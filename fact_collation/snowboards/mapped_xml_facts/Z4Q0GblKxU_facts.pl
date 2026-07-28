0.20::indep(smerchant).
0.15::indep(s9).
0.15::indep(s13).
0.15::indep(s14).
0.20::indep(s15).
0.25::indep(s16).
0.25::indep(s17).
0.15::indep(s20).
0.20::indep(s21).
0.20::indep(s37).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values nidecker=Nidecker unk_brand=Unknown
% @importance 0.75

0.95::true_val(brand, nidecker); 0.05::true_val(brand, unk_brand).
0.95::acc(s1, brand).
0.80::acc(s2, brand).
measured(s1, brand, nidecker).
measured(s2, brand, nidecker).
all_consistent(brand) :- consistent(s1, brand), consistent(s2, brand).
evidence(all_consistent(brand)).
query(true_val(brand, nidecker)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values beta=Beta unk_model_name=Unknown
% @importance 0.75

0.95::true_val(model_name, beta); 0.05::true_val(model_name, unk_model_name).
0.95::acc(s1, model_name).
0.80::acc(s2, model_name).
measured(s1, model_name, beta).
measured(s2, model_name, beta).
all_consistent(model_name) :- consistent(s1, model_name), consistent(s2, model_name).
evidence(all_consistent(model_name)).
query(true_val(model_name, beta)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2027=2027 unk_model_year=Unknown
% @importance 0.85

0.95::true_val(model_year, y2027); 0.05::true_val(model_year, unk_model_year).
0.93::acc(smerchant, model_year).
measured(smerchant, model_year, y2027).
all_consistent(model_year) :- consistent(smerchant, model_year).
evidence(all_consistent(model_year)).
query(true_val(model_year, y2027)).
query(true_val(model_year, unk_model_year)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.75

0.95::true_val(product_type, snowboard); 0.05::true_val(product_type, unk_product_type).
0.95::acc(s1, product_type).
0.80::acc(s2, product_type).
measured(s1, product_type, snowboard).
measured(s2, product_type, snowboard).
all_consistent(product_type) :- consistent(s1, product_type), consistent(s2, product_type).
evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values nidecker_swiss=Nidecker_family_owned_Swiss_company_Rolle unk_manufacturer=Unknown
% @importance 0.60

0.71::true_val(manufacturer, nidecker_swiss); 0.29::true_val(manufacturer, unk_manufacturer).
0.78::acc(s3, manufacturer).
measured(s3, manufacturer, nidecker_swiss).
all_consistent(manufacturer) :- consistent(s3, manufacturer).
evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, nidecker_swiss)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr company_founding_year
% @type categorical
% @canonical false
% @original_name Company founding year
% @values founded_1887_snowboard_1984=Founded_1887_snowboard_1984 unk_company_founding_year=Unknown
% @importance 0.60

0.71::true_val(company_founding_year, founded_1887_snowboard_1984); 0.29::true_val(company_founding_year, unk_company_founding_year).
0.78::acc(s3, company_founding_year).
measured(s3, company_founding_year, founded_1887_snowboard_1984).
all_consistent(company_founding_year) :- consistent(s3, company_founding_year).
evidence(all_consistent(company_founding_year)).
query(true_val(company_founding_year, founded_1887_snowboard_1984)).
query(true_val(company_founding_year, unk_company_founding_year)).

% @attr manufacturer_corporate_group
% @type categorical
% @canonical false
% @original_name Manufacturer corporate group
% @values ndk_group=NDK_Group_second_biggest_snowboard_company unk_manufacturer_corporate_group=Unknown
% @importance 0.60

0.71::true_val(manufacturer_corporate_group, ndk_group); 0.29::true_val(manufacturer_corporate_group, unk_manufacturer_corporate_group).
0.78::acc(s3, manufacturer_corporate_group).
measured(s3, manufacturer_corporate_group, ndk_group).
all_consistent(manufacturer_corporate_group) :- consistent(s3, manufacturer_corporate_group).
evidence(all_consistent(manufacturer_corporate_group)).
query(true_val(manufacturer_corporate_group, ndk_group)).
query(true_val(manufacturer_corporate_group, unk_manufacturer_corporate_group)).

% @attr subsidiary_brands_ndk_group
% @type categorical
% @canonical false
% @original_name Subsidiary brands under NDK Group
% @values jones_yes_now_flow_bataleon_lobster_rome_thirtytwo_etnies=Jones_YES_NOW_Flow_Bataleon_Lobster_Rome_ThirtyTwo_etnies unk_subsidiary_brands_ndk_group=Unknown
% @importance 0.45

0.70::true_val(subsidiary_brands_ndk_group, jones_yes_now_flow_bataleon_lobster_rome_thirtytwo_etnies); 0.30::true_val(subsidiary_brands_ndk_group, unk_subsidiary_brands_ndk_group).
0.76::acc(s3, subsidiary_brands_ndk_group).
0.72::acc(s4, subsidiary_brands_ndk_group).
measured(s3, subsidiary_brands_ndk_group, jones_yes_now_flow_bataleon_lobster_rome_thirtytwo_etnies).
measured(s4, subsidiary_brands_ndk_group, jones_yes_now_flow_bataleon_lobster_rome_thirtytwo_etnies).
all_consistent(subsidiary_brands_ndk_group) :- consistent(s3, subsidiary_brands_ndk_group), consistent(s4, subsidiary_brands_ndk_group).
evidence(all_consistent(subsidiary_brands_ndk_group)).
query(true_val(subsidiary_brands_ndk_group, jones_yes_now_flow_bataleon_lobster_rome_thirtytwo_etnies)).
query(true_val(subsidiary_brands_ndk_group, unk_subsidiary_brands_ndk_group)).

% @attr design_origin
% @type categorical
% @canonical false
% @original_name Design origin
% @values swiss_designed=Swiss_designed_Engineered_in_Switzerland unk_design_origin=Unknown
% @importance 0.40

0.81::true_val(design_origin, swiss_designed); 0.19::true_val(design_origin, unk_design_origin).
0.88::acc(s5, design_origin).
measured(s5, design_origin, swiss_designed).
all_consistent(design_origin) :- consistent(s5, design_origin).
evidence(all_consistent(design_origin)).
query(true_val(design_origin, swiss_designed)).
query(true_val(design_origin, unk_design_origin)).

% @attr manufacturer_us_headquarters
% @type categorical
% @canonical false
% @original_name Manufacturer US headquarters
% @values low_pressure_studio_seattle=Low_Pressure_Studio_55_S_Atlantic_St_Seattle_WA unk_manufacturer_us_headquarters=Unknown
% @importance 0.50

0.90::true_val(manufacturer_us_headquarters, low_pressure_studio_seattle); 0.10::true_val(manufacturer_us_headquarters, unk_manufacturer_us_headquarters).
0.93::acc(s6, manufacturer_us_headquarters).
measured(s6, manufacturer_us_headquarters, low_pressure_studio_seattle).
all_consistent(manufacturer_us_headquarters) :- consistent(s6, manufacturer_us_headquarters).
evidence(all_consistent(manufacturer_us_headquarters)).
query(true_val(manufacturer_us_headquarters, low_pressure_studio_seattle)).
query(true_val(manufacturer_us_headquarters, unk_manufacturer_us_headquarters)).

% @attr model_series_current
% @type categorical
% @canonical false
% @original_name Model series (current)
% @values bio_series=Bio_Series_Biomimicry_most_powder_focused unk_model_series_current=Unknown
% @importance 1.00

0.90::true_val(model_series_current, bio_series); 0.10::true_val(model_series_current, unk_model_series_current).
0.93::acc(s7, model_series_current).
measured(s7, model_series_current, bio_series).
all_consistent(model_series_current) :- consistent(s7, model_series_current).
evidence(all_consistent(model_series_current)).
query(true_val(model_series_current, bio_series)).
query(true_val(model_series_current, unk_model_series_current)).

% @attr model_series_original
% @type categorical
% @canonical false
% @original_name Model series (original)
% @values instinct_series_2021_22=Instinct_Series_launched_2021_22 unk_model_series_original=Unknown
% @importance 0.50

0.72::true_val(model_series_original, instinct_series_2021_22); 0.28::true_val(model_series_original, unk_model_series_original).
0.82::acc(s8, model_series_original).
measured(s8, model_series_original, instinct_series_2021_22).
all_consistent(model_series_original) :- consistent(s8, model_series_original).
evidence(all_consistent(model_series_original)).
query(true_val(model_series_original, instinct_series_2021_22)).
query(true_val(model_series_original, unk_model_series_original)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values y2022=2022_season_2021_22 unk_model_first_available_year=Unknown
% @importance 0.60

0.51::true_val(model_first_available_year, y2022); 0.49::true_val(model_first_available_year, unk_model_first_available_year).
0.60::acc(s9, model_first_available_year).
measured(s9, model_first_available_year, y2022).
all_consistent(model_first_available_year) :-
    (indep(s9), consistent(s9, model_first_available_year) ; \+indep(s9)).
evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2022)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values beta_apx=Beta_APX_stiffer_lighter_power_rails_triax_plus_n9000 unk_comparable_board_same_brand=Unknown
% @importance 0.70

0.68::true_val(comparable_board_same_brand, beta_apx); 0.32::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).
0.78::acc(s10, comparable_board_same_brand).
measured(s10, comparable_board_same_brand, beta_apx).
all_consistent(comparable_board_same_brand) :- consistent(s10, comparable_board_same_brand).
evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, beta_apx)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical false
% @original_name price_aud_merchant
% @values v849_99=849.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.95::true_val(price_aud_merchant, v849_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).
0.95::acc(smerchant, price_aud_merchant).
measured(smerchant, price_aud_merchant, v849_99).
all_consistent(price_aud_merchant) :- consistent(smerchant, price_aud_merchant).
evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v849_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values preorder=Preorder unk_availability_status=Unknown
% @importance 0.85

0.95::true_val(availability_status, preorder); 0.05::true_val(availability_status, unk_availability_status).
0.95::acc(smerchant, availability_status).
measured(smerchant, availability_status, preorder).
all_consistent(availability_status) :- consistent(smerchant, availability_status).
evidence(all_consistent(availability_status)).
query(true_val(availability_status, preorder)).
query(true_val(availability_status, unk_availability_status)).

% @attr estimated_availability_date
% @type categorical
% @canonical false
% @original_name estimated_availability_date
% @values may_1_2026=May_1_2026 unk_estimated_availability_date=Unknown
% @importance 0.85

0.95::true_val(estimated_availability_date, may_1_2026); 0.05::true_val(estimated_availability_date, unk_estimated_availability_date).
0.93::acc(smerchant, estimated_availability_date).
measured(smerchant, estimated_availability_date, may_1_2026).
all_consistent(estimated_availability_date) :- consistent(smerchant, estimated_availability_date).
evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, may_1_2026)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values freeride_powder=Freeride_Powder unk_board_category=Unknown
% @importance 0.85

0.95::true_val(board_category, freeride_powder); 0.05::true_val(board_category, unk_board_category).
0.93::acc(smerchant, board_category).
measured(smerchant, board_category, freeride_powder).
all_consistent(board_category) :- consistent(smerchant, board_category).
evidence(all_consistent(board_category)).
query(true_val(board_category, freeride_powder)).
query(true_val(board_category, unk_board_category)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate_advanced=Intermediate_Advanced unk_rider_level=Unknown
% @importance 0.85

0.95::true_val(rider_level, intermediate_advanced); 0.05::true_val(rider_level, unk_rider_level).
0.93::acc(smerchant, rider_level).
measured(smerchant, rider_level, intermediate_advanced).
all_consistent(rider_level) :- consistent(smerchant, rider_level).
evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate_advanced)).
query(true_val(rider_level, unk_rider_level)).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v4=4.0 unk_flex_rating_10=Unknown
% @importance 0.90

0.95::true_val(flex_rating_10, v4); 0.05::true_val(flex_rating_10, unk_flex_rating_10).
0.93::acc(smerchant, flex_rating_10).
0.93::acc(s7, flex_rating_10).
measured(smerchant, flex_rating_10, v4).
measured(s7, flex_rating_10, v4).
all_consistent(flex_rating_10) :-
    consistent(s7, flex_rating_10),
    (indep(smerchant), consistent(smerchant, flex_rating_10) ; \+indep(smerchant)).
evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v4)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 0.85

0.95::true_val(shape, tapered_directional); 0.05::true_val(shape, unk_shape).
0.93::acc(smerchant, shape).
measured(smerchant, shape, tapered_directional).
all_consistent(shape) :- consistent(smerchant, shape).
evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values surfy_camrock=Surfy_CamRock_camber_between_feet_rocker_tip_tail unk_camber_type=Unknown
% @importance 0.85

0.95::true_val(camber_type, surfy_camrock); 0.05::true_val(camber_type, unk_camber_type).
0.93::acc(smerchant, camber_type).
measured(smerchant, camber_type, surfy_camrock).
all_consistent(camber_type) :- consistent(smerchant, camber_type).
evidence(all_consistent(camber_type)).
query(true_val(camber_type, surfy_camrock)).
query(true_val(camber_type, unk_camber_type)).

% @attr width_options
% @type categorical
% @canonical true
% @original_name width_options
% @values standard_wide=Standard_Wide unk_width_options=Unknown
% @importance 0.85

0.95::true_val(width_options, standard_wide); 0.05::true_val(width_options, unk_width_options).
0.93::acc(smerchant, width_options).
measured(smerchant, width_options, standard_wide).
all_consistent(width_options) :- consistent(smerchant, width_options).
evidence(all_consistent(width_options)).
query(true_val(width_options, standard_wide)).
query(true_val(width_options, unk_width_options)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values sizes_157_162=157_162 sizes_151_157_162_165w=151_157_162_165W
% @importance 0.93

0.40::true_val(available_sizes, sizes_157_162); 0.60::true_val(available_sizes, sizes_151_157_162_165w).
0.90::acc(smerchant, available_sizes).
0.95::acc(s11, available_sizes).
measured(smerchant, available_sizes, sizes_157_162).
measured(s11, available_sizes, sizes_151_157_162_165w).
all_consistent(available_sizes) :-
    consistent(s11, available_sizes),
    consistent(smerchant, available_sizes).
evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, sizes_157_162)).
query(true_val(available_sizes, sizes_151_157_162_165w)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts_6_rows unk_mounting_pattern=Unknown
% @importance 0.93

0.95::true_val(mounting_pattern, inserts_2x4); 0.05::true_val(mounting_pattern, unk_mounting_pattern).
0.93::acc(smerchant, mounting_pattern).
0.93::acc(s7, mounting_pattern).
measured(smerchant, mounting_pattern, inserts_2x4).
measured(s7, mounting_pattern, inserts_2x4).
all_consistent(mounting_pattern) :-
    consistent(s7, mounting_pattern),
    (indep(smerchant), consistent(smerchant, mounting_pattern) ; \+indep(smerchant)).
evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values powder_freeride_backcountry=Powder_Freeride_Backcountry unk_terrain_suitability=Unknown
% @importance 0.85

0.95::true_val(terrain_suitability, powder_freeride_backcountry); 0.05::true_val(terrain_suitability, unk_terrain_suitability).
0.93::acc(smerchant, terrain_suitability).
measured(smerchant, terrain_suitability, powder_freeride_backcountry).
all_consistent(terrain_suitability) :- consistent(smerchant, terrain_suitability).
evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, powder_freeride_backcountry)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_msrp
% @values v519_95=519.95 unk_price_usd_msrp=Unknown
% @importance 1.00

0.93::true_val(price_usd_msrp, v519_95); 0.07::true_val(price_usd_msrp, unk_price_usd_msrp).
0.95::acc(s11, price_usd_msrp).
measured(s11, price_usd_msrp, v519_95).
all_consistent(price_usd_msrp) :- consistent(s11, price_usd_msrp).
evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v519_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_eur_blue_tomato
% @type numeric
% @unit EUR
% @canonical false
% @original_name price_eur_blue_tomato
% @values v499_95=499.95 unk_price_eur_blue_tomato=Unknown
% @importance 0.90

0.60::true_val(price_eur_blue_tomato, v499_95); 0.40::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).
0.72::acc(s12, price_eur_blue_tomato).
measured(s12, price_eur_blue_tomato, v499_95).
all_consistent(price_eur_blue_tomato) :- consistent(s12, price_eur_blue_tomato).
evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v499_95)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

% @attr price_gbp_blue_tomato_uk
% @type numeric
% @unit GBP
% @canonical false
% @original_name price_gbp_blue_tomato_uk
% @values v445=445.0 unk_price_gbp_blue_tomato_uk=Unknown
% @importance 0.90

0.60::true_val(price_gbp_blue_tomato_uk, v445); 0.40::true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk).
0.72::acc(s12, price_gbp_blue_tomato_uk).
measured(s12, price_gbp_blue_tomato_uk, v445).
all_consistent(price_gbp_blue_tomato_uk) :- consistent(s12, price_gbp_blue_tomato_uk).
evidence(all_consistent(price_gbp_blue_tomato_uk)).
query(true_val(price_gbp_blue_tomato_uk, v445)).
query(true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk)).

% @attr price_usd_snowinn
% @type numeric
% @unit USD
% @canonical false
% @original_name Price USD (Snowinn/Tradeinn, older model)
% @values v417_99=417.99 unk_price_usd_snowinn=Unknown
% @importance 0.80

0.52::true_val(price_usd_snowinn, v417_99); 0.48::true_val(price_usd_snowinn, unk_price_usd_snowinn).
0.65::acc(s13, price_usd_snowinn).
measured(s13, price_usd_snowinn, v417_99).
all_consistent(price_usd_snowinn) :- consistent(s13, price_usd_snowinn).
evidence(all_consistent(price_usd_snowinn)).
query(true_val(price_usd_snowinn, v417_99)).
query(true_val(price_usd_snowinn, unk_price_usd_snowinn)).

% @attr price_usd_sundance_sale
% @type numeric
% @unit USD
% @canonical false
% @original_name Price USD (Sundance Ski Shop, older model, sale)
% @values v286=286.0 unk_price_usd_sundance_sale=Unknown
% @importance 0.50

0.45::true_val(price_usd_sundance_sale, v286); 0.55::true_val(price_usd_sundance_sale, unk_price_usd_sundance_sale).
0.60::acc(s14, price_usd_sundance_sale).
measured(s14, price_usd_sundance_sale, v286).
all_consistent(price_usd_sundance_sale) :- consistent(s14, price_usd_sundance_sale).
evidence(all_consistent(price_usd_sundance_sale)).
query(true_val(price_usd_sundance_sale, v286)).
query(true_val(price_usd_sundance_sale, unk_price_usd_sundance_sale)).

% @attr price_eur_snowcountry
% @type numeric
% @unit EUR
% @canonical false
% @original_name Price EUR (SnowCountry)
% @values v439=439.0 unk_price_eur_snowcountry=Unknown
% @importance 0.90

0.60::true_val(price_eur_snowcountry, v439); 0.40::true_val(price_eur_snowcountry, unk_price_eur_snowcountry).
0.72::acc(s12, price_eur_snowcountry).
measured(s12, price_eur_snowcountry, v439).
all_consistent(price_eur_snowcountry) :- consistent(s12, price_eur_snowcountry).
evidence(all_consistent(price_eur_snowcountry)).
query(true_val(price_eur_snowcountry, v439)).
query(true_val(price_eur_snowcountry, unk_price_eur_snowcountry)).

% @attr effective_edge_157
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 157cm
% @values v1180=1180.0 unk_effective_edge_157=Unknown
% @importance 0.93

0.95::true_val(effective_edge_157, v1180); 0.05::true_val(effective_edge_157, unk_effective_edge_157).
0.95::acc(s11, effective_edge_157).
0.88::acc(smerchant, effective_edge_157).
measured(s11, effective_edge_157, v1180).
measured(smerchant, effective_edge_157, v1180).
all_consistent(effective_edge_157) :-
    consistent(s11, effective_edge_157),
    (indep(smerchant), consistent(smerchant, effective_edge_157) ; \+indep(smerchant)).
evidence(all_consistent(effective_edge_157)).
query(true_val(effective_edge_157, v1180)).
query(true_val(effective_edge_157, unk_effective_edge_157)).

% @attr effective_edge_162
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 162cm
% @values v1230=1230.0 unk_effective_edge_162=Unknown
% @importance 0.93

0.95::true_val(effective_edge_162, v1230); 0.05::true_val(effective_edge_162, unk_effective_edge_162).
0.95::acc(s11, effective_edge_162).
0.88::acc(smerchant, effective_edge_162).
measured(s11, effective_edge_162, v1230).
measured(smerchant, effective_edge_162, v1230).
all_consistent(effective_edge_162) :-
    consistent(s11, effective_edge_162),
    (indep(smerchant), consistent(smerchant, effective_edge_162) ; \+indep(smerchant)).
evidence(all_consistent(effective_edge_162)).
query(true_val(effective_edge_162, v1230)).
query(true_val(effective_edge_162, unk_effective_edge_162)).

% @attr effective_edge_151
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 151cm
% @values v1130=1130.0 unk_effective_edge_151=Unknown
% @importance 1.00

0.93::true_val(effective_edge_151, v1130); 0.07::true_val(effective_edge_151, unk_effective_edge_151).
0.95::acc(s11, effective_edge_151).
measured(s11, effective_edge_151, v1130).
all_consistent(effective_edge_151) :- consistent(s11, effective_edge_151).
evidence(all_consistent(effective_edge_151)).
query(true_val(effective_edge_151, v1130)).
query(true_val(effective_edge_151, unk_effective_edge_151)).

% @attr effective_edge_165w
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 165W
% @values v1260=1260.0 unk_effective_edge_165w=Unknown
% @importance 1.00

0.93::true_val(effective_edge_165w, v1260); 0.07::true_val(effective_edge_165w, unk_effective_edge_165w).
0.95::acc(s11, effective_edge_165w).
measured(s11, effective_edge_165w, v1260).
all_consistent(effective_edge_165w) :- consistent(s11, effective_edge_165w).
evidence(all_consistent(effective_edge_165w)).
query(true_val(effective_edge_165w, v1260)).
query(true_val(effective_edge_165w, unk_effective_edge_165w)).

% @attr waist_width_157
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 157cm
% @values v256=256.0 unk_waist_width_157=Unknown
% @importance 0.93

0.95::true_val(waist_width_157, v256); 0.05::true_val(waist_width_157, unk_waist_width_157).
0.95::acc(s11, waist_width_157).
0.88::acc(smerchant, waist_width_157).
measured(s11, waist_width_157, v256).
measured(smerchant, waist_width_157, v256).
all_consistent(waist_width_157) :-
    consistent(s11, waist_width_157),
    (indep(smerchant), consistent(smerchant, waist_width_157) ; \+indep(smerchant)).
evidence(all_consistent(waist_width_157)).
query(true_val(waist_width_157, v256)).
query(true_val(waist_width_157, unk_waist_width_157)).

% @attr waist_width_162
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 162cm
% @values v266=266.0 unk_waist_width_162=Unknown
% @importance 0.93

0.95::true_val(waist_width_162, v266); 0.05::true_val(waist_width_162, unk_waist_width_162).
0.95::acc(s11, waist_width_162).
0.88::acc(smerchant, waist_width_162).
measured(s11, waist_width_162, v266).
measured(smerchant, waist_width_162, v266).
all_consistent(waist_width_162) :-
    consistent(s11, waist_width_162),
    (indep(smerchant), consistent(smerchant, waist_width_162) ; \+indep(smerchant)).
evidence(all_consistent(waist_width_162)).
query(true_val(waist_width_162, v266)).
query(true_val(waist_width_162, unk_waist_width_162)).

% @attr waist_width_151
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 151cm
% @values v252=252.0 unk_waist_width_151=Unknown
% @importance 1.00

0.93::true_val(waist_width_151, v252); 0.07::true_val(waist_width_151, unk_waist_width_151).
0.95::acc(s11, waist_width_151).
measured(s11, waist_width_151, v252).
all_consistent(waist_width_151) :- consistent(s11, waist_width_151).
evidence(all_consistent(waist_width_151)).
query(true_val(waist_width_151, v252)).
query(true_val(waist_width_151, unk_waist_width_151)).

% @attr waist_width_165
% @type numeric
% @unit mm
% @canonical true
% @original_name waist_width_165
% @values v272=272.0 unk_waist_width_165=Unknown
% @importance 1.00

0.93::true_val(waist_width_165, v272); 0.07::true_val(waist_width_165, unk_waist_width_165).
0.95::acc(s11, waist_width_165).
measured(s11, waist_width_165, v272).
all_consistent(waist_width_165) :- consistent(s11, waist_width_165).
evidence(all_consistent(waist_width_165)).
query(true_val(waist_width_165, v272)).
query(true_val(waist_width_165, unk_waist_width_165)).

% @attr tip_tail_width_size
% @type numeric
% @unit mm
% @canonical true
% @original_name tip_tail_width_size
% @values v292=292.0 unk_tip_tail_width_size=Unknown
% @importance 1.00

0.93::true_val(tip_tail_width_size, v292); 0.07::true_val(tip_tail_width_size, unk_tip_tail_width_size).
0.95::acc(s11, tip_tail_width_size).
measured(s11, tip_tail_width_size, v292).
all_consistent(tip_tail_width_size) :- consistent(s11, tip_tail_width_size).
evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v292)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr tip_tail_width_size_162
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size (162cm)
% @values v302=302.0 unk_tip_tail_width_size_162=Unknown
% @importance 1.00

0.93::true_val(tip_tail_width_size_162, v302); 0.07::true_val(tip_tail_width_size_162, unk_tip_tail_width_size_162).
0.95::acc(s11, tip_tail_width_size_162).
measured(s11, tip_tail_width_size_162, v302).
all_consistent(tip_tail_width_size_162) :- consistent(s11, tip_tail_width_size_162).
evidence(all_consistent(tip_tail_width_size_162)).
query(true_val(tip_tail_width_size_162, v302)).
query(true_val(tip_tail_width_size_162, unk_tip_tail_width_size_162)).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size
% @values v7_6=7.6 unk_sidecut_radius_size=Unknown
% @importance 0.93

0.95::true_val(sidecut_radius_size, v7_6); 0.05::true_val(sidecut_radius_size, unk_sidecut_radius_size).
0.95::acc(s11, sidecut_radius_size).
0.88::acc(smerchant, sidecut_radius_size).
measured(s11, sidecut_radius_size, v7_6).
measured(smerchant, sidecut_radius_size, v7_6).
all_consistent(sidecut_radius_size) :-
    consistent(s11, sidecut_radius_size),
    (indep(smerchant), consistent(smerchant, sidecut_radius_size) ; \+indep(smerchant)).
evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_6)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr sidecut_radius_size_162
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (162cm)
% @values v8_0=8.0 unk_sidecut_radius_size_162=Unknown
% @importance 0.93

0.95::true_val(sidecut_radius_size_162, v8_0); 0.05::true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162).
0.95::acc(s11, sidecut_radius_size_162).
0.88::acc(smerchant, sidecut_radius_size_162).
measured(s11, sidecut_radius_size_162, v8_0).
measured(smerchant, sidecut_radius_size_162, v8_0).
all_consistent(sidecut_radius_size_162) :-
    consistent(s11, sidecut_radius_size_162),
    (indep(smerchant), consistent(smerchant, sidecut_radius_size_162) ; \+indep(smerchant)).
evidence(all_consistent(sidecut_radius_size_162)).
query(true_val(sidecut_radius_size_162, v8_0)).
query(true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162)).

% @attr sidecut_radius_size_151
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (151cm)
% @values v7_4=7.4 unk_sidecut_radius_size_151=Unknown
% @importance 1.00

0.93::true_val(sidecut_radius_size_151, v7_4); 0.07::true_val(sidecut_radius_size_151, unk_sidecut_radius_size_151).
0.95::acc(s11, sidecut_radius_size_151).
measured(s11, sidecut_radius_size_151, v7_4).
all_consistent(sidecut_radius_size_151) :- consistent(s11, sidecut_radius_size_151).
evidence(all_consistent(sidecut_radius_size_151)).
query(true_val(sidecut_radius_size_151, v7_4)).
query(true_val(sidecut_radius_size_151, unk_sidecut_radius_size_151)).

% @attr sidecut_radius_165
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_165
% @values v8_2=8.2 unk_sidecut_radius_165=Unknown
% @importance 1.00

0.93::true_val(sidecut_radius_165, v8_2); 0.07::true_val(sidecut_radius_165, unk_sidecut_radius_165).
0.95::acc(s11, sidecut_radius_165).
measured(s11, sidecut_radius_165, v8_2).
all_consistent(sidecut_radius_165) :- consistent(s11, sidecut_radius_165).
evidence(all_consistent(sidecut_radius_165)).
query(true_val(sidecut_radius_165, v8_2)).
query(true_val(sidecut_radius_165, unk_sidecut_radius_165)).

% @attr stance_width_range_size
% @type numeric
% @unit mm
% @canonical true
% @original_name stance_width_range_size
% @values v540=540.0 unk_stance_width_range_size=Unknown
% @importance 0.93

0.95::true_val(stance_width_range_size, v540); 0.05::true_val(stance_width_range_size, unk_stance_width_range_size).
0.95::acc(s11, stance_width_range_size).
0.88::acc(smerchant, stance_width_range_size).
measured(s11, stance_width_range_size, v540).
measured(smerchant, stance_width_range_size, v540).
all_consistent(stance_width_range_size) :-
    consistent(s11, stance_width_range_size),
    (indep(smerchant), consistent(smerchant, stance_width_range_size) ; \+indep(smerchant)).
evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v540)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr stance_width_range_size_162
% @type numeric
% @unit mm
% @canonical false
% @original_name stance_width_range_size (162cm)
% @values v550=550.0 unk_stance_width_range_size_162=Unknown
% @importance 0.93

0.95::true_val(stance_width_range_size_162, v550); 0.05::true_val(stance_width_range_size_162, unk_stance_width_range_size_162).
0.95::acc(s11, stance_width_range_size_162).
0.88::acc(smerchant, stance_width_range_size_162).
measured(s11, stance_width_range_size_162, v550).
measured(smerchant, stance_width_range_size_162, v550).
all_consistent(stance_width_range_size_162) :-
    consistent(s11, stance_width_range_size_162),
    (indep(smerchant), consistent(smerchant, stance_width_range_size_162) ; \+indep(smerchant)).
evidence(all_consistent(stance_width_range_size_162)).
query(true_val(stance_width_range_size_162, v550)).
query(true_val(stance_width_range_size_162, unk_stance_width_range_size_162)).

% @attr setback
% @type numeric
% @unit mm
% @canonical true
% @original_name setback
% @values v40=40.0 unk_setback=Unknown
% @importance 0.93

0.95::true_val(setback, v40); 0.05::true_val(setback, unk_setback).
0.95::acc(s11, setback).
0.88::acc(smerchant, setback).
measured(s11, setback, v40).
measured(smerchant, setback, v40).
all_consistent(setback) :-
    consistent(s11, setback),
    (indep(smerchant), consistent(smerchant, setback) ; \+indep(smerchant)).
evidence(all_consistent(setback)).
query(true_val(setback, v40)).
query(true_val(setback, unk_setback)).

% @attr setback_162
% @type numeric
% @unit mm
% @canonical false
% @original_name setback (162cm)
% @values v50=50.0 unk_setback_162=Unknown
% @importance 0.93

0.95::true_val(setback_162, v50); 0.05::true_val(setback_162, unk_setback_162).
0.95::acc(s11, setback_162).
0.88::acc(smerchant, setback_162).
measured(s11, setback_162, v50).
measured(smerchant, setback_162, v50).
all_consistent(setback_162) :-
    consistent(s11, setback_162),
    (indep(smerchant), consistent(smerchant, setback_162) ; \+indep(smerchant)).
evidence(all_consistent(setback_162)).
query(true_val(setback_162, v50)).
query(true_val(setback_162, unk_setback_162)).

% @attr taper_151
% @type numeric
% @unit mm
% @canonical false
% @original_name taper (151cm)
% @values v8=8.0 unk_taper_151=Unknown
% @importance 1.00

0.93::true_val(taper_151, v8); 0.07::true_val(taper_151, unk_taper_151).
0.95::acc(s11, taper_151).
measured(s11, taper_151, v8).
all_consistent(taper_151) :- consistent(s11, taper_151).
evidence(all_consistent(taper_151)).
query(true_val(taper_151, v8)).
query(true_val(taper_151, unk_taper_151)).

% @attr taper
% @type numeric
% @unit mm
% @canonical true
% @original_name taper
% @values v10=10.0 unk_taper=Unknown
% @importance 1.00

0.93::true_val(taper, v10); 0.07::true_val(taper, unk_taper).
0.95::acc(s11, taper).
measured(s11, taper, v10).
all_consistent(taper) :- consistent(s11, taper).
evidence(all_consistent(taper)).
query(true_val(taper, v10)).
query(true_val(taper, unk_taper)).

% @attr taper_162
% @type numeric
% @unit mm
% @canonical false
% @original_name taper (162cm or 165W)
% @values v11=11.0 unk_taper_162=Unknown
% @importance 1.00

0.93::true_val(taper_162, v11); 0.07::true_val(taper_162, unk_taper_162).
0.95::acc(s11, taper_162).
measured(s11, taper_162, v11).
all_consistent(taper_162) :- consistent(s11, taper_162).
evidence(all_consistent(taper_162)).
query(true_val(taper_162, v11)).
query(true_val(taper_162, unk_taper_162)).

% @attr tail_length
% @type numeric
% @unit mm
% @canonical false
% @original_name Tail length (all sizes)
% @values v210=210.0 unk_tail_length=Unknown
% @importance 1.00

0.93::true_val(tail_length, v210); 0.07::true_val(tail_length, unk_tail_length).
0.95::acc(s11, tail_length).
measured(s11, tail_length, v210).
all_consistent(tail_length) :- consistent(s11, tail_length).
evidence(all_consistent(tail_length)).
query(true_val(tail_length, v210)).
query(true_val(tail_length, unk_tail_length)).

% @attr contact_length_size
% @type numeric
% @unit mm
% @canonical true
% @original_name contact_length_size
% @values v1030=1030.0 unk_contact_length_size=Unknown
% @importance 1.00

0.93::true_val(contact_length_size, v1030); 0.07::true_val(contact_length_size, unk_contact_length_size).
0.95::acc(s11, contact_length_size).
measured(s11, contact_length_size, v1030).
all_consistent(contact_length_size) :- consistent(s11, contact_length_size).
evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v1030)).
query(true_val(contact_length_size, unk_contact_length_size)).

% @attr contact_length_size_162
% @type numeric
% @unit mm
% @canonical false
% @original_name contact_length_size (162cm)
% @values v1080=1080.0 unk_contact_length_size_162=Unknown
% @importance 1.00

0.93::true_val(contact_length_size_162, v1080); 0.07::true_val(contact_length_size_162, unk_contact_length_size_162).
0.95::acc(s11, contact_length_size_162).
measured(s11, contact_length_size_162, v1080).
all_consistent(contact_length_size_162) :- consistent(s11, contact_length_size_162).
evidence(all_consistent(contact_length_size_162)).
query(true_val(contact_length_size_162, v1080)).
query(true_val(contact_length_size_162, unk_contact_length_size_162)).

% @attr stance_adjust_range_157
% @type categorical
% @unit mm
% @canonical false
% @original_name stance_width_range_size (adjustable range 157cm)
% @values r500_620=500_to_620mm unk_stance_adjust_range_157=Unknown
% @importance 1.00

0.93::true_val(stance_adjust_range_157, r500_620); 0.07::true_val(stance_adjust_range_157, unk_stance_adjust_range_157).
0.95::acc(s11, stance_adjust_range_157).
measured(s11, stance_adjust_range_157, r500_620).
all_consistent(stance_adjust_range_157) :- consistent(s11, stance_adjust_range_157).
evidence(all_consistent(stance_adjust_range_157)).
query(true_val(stance_adjust_range_157, r500_620)).
query(true_val(stance_adjust_range_157, unk_stance_adjust_range_157)).

% @attr stance_adjust_range_162
% @type categorical
% @unit mm
% @canonical false
% @original_name stance_width_range_size (adjustable range 162cm)
% @values r510_630=510_to_630mm unk_stance_adjust_range_162=Unknown
% @importance 1.00

0.93::true_val(stance_adjust_range_162, r510_630); 0.07::true_val(stance_adjust_range_162, unk_stance_adjust_range_162).
0.95::acc(s11, stance_adjust_range_162).
measured(s11, stance_adjust_range_162, r510_630).
all_consistent(stance_adjust_range_162) :- consistent(s11, stance_adjust_range_162).
evidence(all_consistent(stance_adjust_range_162)).
query(true_val(stance_adjust_range_162, r510_630)).
query(true_val(stance_adjust_range_162, unk_stance_adjust_range_162)).

% @attr underfoot_width_front_157
% @type numeric
% @unit mm
% @canonical false
% @original_name Underfoot width front foot 157cm
% @values v265=265.0 unk_underfoot_width_front_157=Unknown
% @importance 1.00

0.93::true_val(underfoot_width_front_157, v265); 0.07::true_val(underfoot_width_front_157, unk_underfoot_width_front_157).
0.95::acc(s11, underfoot_width_front_157).
measured(s11, underfoot_width_front_157, v265).
all_consistent(underfoot_width_front_157) :- consistent(s11, underfoot_width_front_157).
evidence(all_consistent(underfoot_width_front_157)).
query(true_val(underfoot_width_front_157, v265)).
query(true_val(underfoot_width_front_157, unk_underfoot_width_front_157)).

% @attr underfoot_width_rear_157
% @type numeric
% @unit mm
% @canonical false
% @original_name Underfoot width rear foot 157cm
% @values v267=267.0 unk_underfoot_width_rear_157=Unknown
% @importance 1.00

0.93::true_val(underfoot_width_rear_157, v267); 0.07::true_val(underfoot_width_rear_157, unk_underfoot_width_rear_157).
0.95::acc(s11, underfoot_width_rear_157).
measured(s11, underfoot_width_rear_157, v267).
all_consistent(underfoot_width_rear_157) :- consistent(s11, underfoot_width_rear_157).
evidence(all_consistent(underfoot_width_rear_157)).
query(true_val(underfoot_width_rear_157, v267)).
query(true_val(underfoot_width_rear_157, unk_underfoot_width_rear_157)).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size
% @values w65_90=65_to_90kg w60_80=60_to_80kg
% @importance 0.93

0.60::true_val(recommended_weight_range_size, w65_90); 0.40::true_val(recommended_weight_range_size, w60_80).
0.95::acc(s11, recommended_weight_range_size).
0.88::acc(smerchant, recommended_weight_range_size).
measured(s11, recommended_weight_range_size, w65_90).
measured(smerchant, recommended_weight_range_size, w60_80).
all_consistent(recommended_weight_range_size) :-
    consistent(s11, recommended_weight_range_size),
    consistent(smerchant, recommended_weight_range_size).
evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w65_90)).
query(true_val(recommended_weight_range_size, w60_80)).

% @attr recommended_weight_range_size_162
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (162cm)
% @values w70_95=70_to_95kg w65_85=65_to_85kg
% @importance 0.93

0.60::true_val(recommended_weight_range_size_162, w70_95); 0.40::true_val(recommended_weight_range_size_162, w65_85).
0.95::acc(s11, recommended_weight_range_size_162).
0.88::acc(smerchant, recommended_weight_range_size_162).
measured(s11, recommended_weight_range_size_162, w70_95).
measured(smerchant, recommended_weight_range_size_162, w65_85).
all_consistent(recommended_weight_range_size_162) :-
    consistent(s11, recommended_weight_range_size_162),
    consistent(smerchant, recommended_weight_range_size_162).
evidence(all_consistent(recommended_weight_range_size_162)).
query(true_val(recommended_weight_range_size_162, w70_95)).
query(true_val(recommended_weight_range_size_162, w65_85)).

% @attr recommended_binding_size_157
% @type categorical
% @canonical false
% @original_name Recommended binding size 157cm
% @values size_l=L unk_recommended_binding_size_157=Unknown
% @importance 1.00

0.93::true_val(recommended_binding_size_157, size_l); 0.07::true_val(recommended_binding_size_157, unk_recommended_binding_size_157).
0.95::acc(s11, recommended_binding_size_157).
measured(s11, recommended_binding_size_157, size_l).
all_consistent(recommended_binding_size_157) :- consistent(s11, recommended_binding_size_157).
evidence(all_consistent(recommended_binding_size_157)).
query(true_val(recommended_binding_size_157, size_l)).
query(true_val(recommended_binding_size_157, unk_recommended_binding_size_157)).

% @attr recommended_binding_size_162
% @type categorical
% @canonical false
% @original_name Recommended binding size 162cm
% @values size_l_xl=L_XL unk_recommended_binding_size_162=Unknown
% @importance 1.00

0.93::true_val(recommended_binding_size_162, size_l_xl); 0.07::true_val(recommended_binding_size_162, unk_recommended_binding_size_162).
0.95::acc(s11, recommended_binding_size_162).
measured(s11, recommended_binding_size_162, size_l_xl).
all_consistent(recommended_binding_size_162) :- consistent(s11, recommended_binding_size_162).
evidence(all_consistent(recommended_binding_size_162)).
query(true_val(recommended_binding_size_162, size_l_xl)).
query(true_val(recommended_binding_size_162, unk_recommended_binding_size_162)).

% @attr camber_description
% @type categorical
% @canonical false
% @original_name camber_description
% @values surfy_camrock_extended_rocker_nose=Surfy_CamRock_extended_rocker_nose_regular_camber unk_camber_description=Unknown
% @importance 1.00

0.90::true_val(camber_description, surfy_camrock_extended_rocker_nose); 0.10::true_val(camber_description, unk_camber_description).
0.93::acc(s7, camber_description).
measured(s7, camber_description, surfy_camrock_extended_rocker_nose).
all_consistent(camber_description) :- consistent(s7, camber_description).
evidence(all_consistent(camber_description)).
query(true_val(camber_description, surfy_camrock_extended_rocker_nose)).
query(true_val(camber_description, unk_camber_description)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values premium_sandwich_carbon_stringers=Premium_Sandwich_Construction_carbon_stringers unk_construction_material_innovation=Unknown
% @importance 1.00

0.90::true_val(construction_material_innovation, premium_sandwich_carbon_stringers); 0.10::true_val(construction_material_innovation, unk_construction_material_innovation).
0.93::acc(s7, construction_material_innovation).
measured(s7, construction_material_innovation, premium_sandwich_carbon_stringers).
all_consistent(construction_material_innovation) :- consistent(s7, construction_material_innovation).
evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, premium_sandwich_carbon_stringers)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values master_core_poplar_paulownia=Master_Core_poplar_paulownia master_core_four_species=Master_Core_poplar_beech_spruce_paulownia
% @importance 0.87

0.60::true_val(core_material, master_core_poplar_paulownia); 0.40::true_val(core_material, master_core_four_species).
0.95::acc(s11, core_material).
0.58::acc(s15, core_material).
measured(s11, core_material, master_core_poplar_paulownia).
measured(s15, core_material, master_core_four_species).
all_consistent(core_material) :-
    consistent(s11, core_material),
    (indep(s15), consistent(s15, core_material) ; \+indep(s15)).
evidence(all_consistent(core_material)).
query(true_val(core_material, master_core_poplar_paulownia)).
query(true_val(core_material, master_core_four_species)).

% @attr base_material
% @type categorical
% @canonical false
% @original_name base_material
% @values n7000_hybrid=N_7000_Hybrid_extruded_sintered_durability unk_base_material=Unknown
% @importance 0.93

0.95::true_val(base_material, n7000_hybrid); 0.05::true_val(base_material, unk_base_material).
0.95::acc(s11, base_material).
0.88::acc(smerchant, base_material).
measured(s11, base_material, n7000_hybrid).
measured(smerchant, base_material, n7000_hybrid).
all_consistent(base_material) :-
    consistent(s11, base_material),
    (indep(smerchant), consistent(smerchant, base_material) ; \+indep(smerchant)).
evidence(all_consistent(base_material)).
query(true_val(base_material, n7000_hybrid)).
query(true_val(base_material, unk_base_material)).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values n7000_extruded_plus=N_7000_Extruded_Plus n7000_sintruded=N_7000_sintruded_carbon_nanoparticles
% @importance 0.75

0.55::true_val(base_type, n7000_extruded_plus); 0.45::true_val(base_type, n7000_sintruded).
0.80::acc(s16, base_type).
0.60::acc(s13, base_type).
measured(s16, base_type, n7000_extruded_plus).
measured(s13, base_type, n7000_sintruded).
all_consistent(base_type) :-
    (indep(s16), consistent(s16, base_type) ; \+indep(s16)),
    (indep(s13), consistent(s13, base_type) ; \+indep(s13)).
evidence(all_consistent(base_type)).
query(true_val(base_type, n7000_extruded_plus)).
query(true_val(base_type, n7000_sintruded)).

% @attr laminate
% @type categorical
% @canonical false
% @original_name laminate
% @values biax_plus=Biax_Plus_90deg_weave_enhanced_power_transfer unk_laminate=Unknown
% @importance 1.00

0.90::true_val(laminate, biax_plus); 0.10::true_val(laminate, unk_laminate).
0.93::acc(s7, laminate).
measured(s7, laminate, biax_plus).
all_consistent(laminate) :- consistent(s7, laminate).
evidence(all_consistent(laminate)).
query(true_val(laminate, biax_plus)).
query(true_val(laminate, unk_laminate)).

% @attr construction_material_innovation_pop_carbon
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Pop Carbon)
% @values pop_carbon=Pop_Carbon_between_inserts_nose_tail pop_carbon_plus=Pop_Carbon_Plus
% @importance 0.88

0.50::true_val(construction_material_innovation_pop_carbon, pop_carbon); 0.50::true_val(construction_material_innovation_pop_carbon, pop_carbon_plus).
0.93::acc(s7, construction_material_innovation_pop_carbon).
0.88::acc(smerchant, construction_material_innovation_pop_carbon).
measured(s7, construction_material_innovation_pop_carbon, pop_carbon).
measured(smerchant, construction_material_innovation_pop_carbon, pop_carbon_plus).
all_consistent(construction_material_innovation_pop_carbon) :-
    consistent(s7, construction_material_innovation_pop_carbon),
    (indep(smerchant), consistent(smerchant, construction_material_innovation_pop_carbon) ; \+indep(smerchant)).
evidence(all_consistent(construction_material_innovation_pop_carbon)).
query(true_val(construction_material_innovation_pop_carbon, pop_carbon)).
query(true_val(construction_material_innovation_pop_carbon, pop_carbon_plus)).

% @attr topsheet
% @type categorical
% @canonical false
% @original_name topsheet
% @values absorbnid=Absorbnid_vibration_absorbing_smooth_ride unk_topsheet=Unknown
% @importance 1.00

0.90::true_val(topsheet, absorbnid); 0.10::true_val(topsheet, unk_topsheet).
0.93::acc(s7, topsheet).
measured(s7, topsheet, absorbnid).
all_consistent(topsheet) :- consistent(s7, topsheet).
evidence(all_consistent(topsheet)).
query(true_val(topsheet, absorbnid)).
query(true_val(topsheet, unk_topsheet)).

% @attr nose_design
% @type categorical
% @canonical false
% @original_name Nose design
% @values evolution_nose=Evolution_Nose_3D_curved_surf_like_flow unk_nose_design=Unknown
% @importance 1.00

0.90::true_val(nose_design, evolution_nose); 0.10::true_val(nose_design, unk_nose_design).
0.93::acc(s7, nose_design).
measured(s7, nose_design, evolution_nose).
all_consistent(nose_design) :- consistent(s7, nose_design).
evidence(all_consistent(nose_design)).
query(true_val(nose_design, evolution_nose)).
query(true_val(nose_design, unk_nose_design)).

% @attr tail_design
% @type categorical
% @canonical false
% @original_name Tail design
% @values drop_out=Drop_Out_bird_of_prey_tail_control_agility unk_tail_design=Unknown
% @importance 1.00

0.90::true_val(tail_design, drop_out); 0.10::true_val(tail_design, unk_tail_design).
0.93::acc(s7, tail_design).
measured(s7, tail_design, drop_out).
all_consistent(tail_design) :- consistent(s7, tail_design).
evidence(all_consistent(tail_design)).
query(true_val(tail_design, drop_out)).
query(true_val(tail_design, unk_tail_design)).

% @attr nose_description
% @type categorical
% @canonical false
% @original_name Nose description
% @values spooned_3d_extended_rocker=3D_spooned_nose_extended_rocker unk_nose_description=Unknown
% @importance 1.00

0.90::true_val(nose_description, spooned_3d_extended_rocker); 0.10::true_val(nose_description, unk_nose_description).
0.93::acc(s7, nose_description).
measured(s7, nose_description, spooned_3d_extended_rocker).
all_consistent(nose_description) :- consistent(s7, nose_description).
evidence(all_consistent(nose_description)).
query(true_val(nose_description, spooned_3d_extended_rocker)).
query(true_val(nose_description, unk_nose_description)).

% @attr tail_description
% @type categorical
% @canonical false
% @original_name Tail description
% @values short_swallowtail=Short_swallowtail unk_tail_description=Unknown
% @importance 0.85

0.95::true_val(tail_description, short_swallowtail); 0.05::true_val(tail_description, unk_tail_description).
0.93::acc(smerchant, tail_description).
measured(smerchant, tail_description, short_swallowtail).
all_consistent(tail_description) :- consistent(smerchant, tail_description).
evidence(all_consistent(tail_description)).
query(true_val(tail_description, short_swallowtail)).
query(true_val(tail_description, unk_tail_description)).

% @attr stance_type
% @type categorical
% @canonical false
% @original_name Stance
% @values set_back=Set_back unk_stance_type=Unknown
% @importance 0.85

0.95::true_val(stance_type, set_back); 0.05::true_val(stance_type, unk_stance_type).
0.93::acc(smerchant, stance_type).
measured(smerchant, stance_type, set_back).
all_consistent(stance_type) :- consistent(smerchant, stance_type).
evidence(all_consistent(stance_type)).
query(true_val(stance_type, set_back)).
query(true_val(stance_type, unk_stance_type)).

% @attr flex_rating_5
% @type numeric
% @unit /5
% @canonical false
% @original_name flex_rating_5
% @values v2=2.0 unk_flex_rating_5=Unknown
% @importance 1.00

0.90::true_val(flex_rating_5, v2); 0.10::true_val(flex_rating_5, unk_flex_rating_5).
0.93::acc(s7, flex_rating_5).
measured(s7, flex_rating_5, v2).
all_consistent(flex_rating_5) :- consistent(s7, flex_rating_5).
evidence(all_consistent(flex_rating_5)).
query(true_val(flex_rating_5, v2)).
query(true_val(flex_rating_5, unk_flex_rating_5)).

% @attr flex_rating_10_evo
% @type categorical
% @canonical false
% @original_name flex_rating_10_evo
% @values medium=Medium unk_flex_rating_10_evo=Unknown
% @importance 0.70

0.68::true_val(flex_rating_10_evo, medium); 0.32::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).
0.78::acc(s17, flex_rating_10_evo).
measured(s17, flex_rating_10_evo, medium).
all_consistent(flex_rating_10_evo) :-
    (indep(s17), consistent(s17, flex_rating_10_evo) ; \+indep(s17)).
evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, medium)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

% @attr flex_direction
% @type categorical
% @canonical false
% @original_name flex_direction
% @values directional_flex_nose_soft_tail_stiff=Directional_flex_nose_more_flex_stiffer_toward_tail unk_flex_direction=Unknown
% @importance 0.70

0.55::true_val(flex_direction, directional_flex_nose_soft_tail_stiff); 0.45::true_val(flex_direction, unk_flex_direction).
0.62::acc(s18, flex_direction).
measured(s18, flex_direction, directional_flex_nose_soft_tail_stiff).
all_consistent(flex_direction) :- consistent(s18, flex_direction).
evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional_flex_nose_soft_tail_stiff)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr terrain_suitability_freeride_rating
% @type numeric
% @unit /5
% @canonical false
% @original_name terrain_suitability (Freeride rating)
% @values v3=3.0 unk_terrain_suitability_freeride_rating=Unknown
% @importance 1.00

0.90::true_val(terrain_suitability_freeride_rating, v3); 0.10::true_val(terrain_suitability_freeride_rating, unk_terrain_suitability_freeride_rating).
0.93::acc(s7, terrain_suitability_freeride_rating).
measured(s7, terrain_suitability_freeride_rating, v3).
all_consistent(terrain_suitability_freeride_rating) :- consistent(s7, terrain_suitability_freeride_rating).
evidence(all_consistent(terrain_suitability_freeride_rating)).
query(true_val(terrain_suitability_freeride_rating, v3)).
query(true_val(terrain_suitability_freeride_rating, unk_terrain_suitability_freeride_rating)).

% @attr terrain_suitability_powder_rating
% @type numeric
% @unit /5
% @canonical false
% @original_name terrain_suitability (Powder rating)
% @values v5=5.0 unk_terrain_suitability_powder_rating=Unknown
% @importance 1.00

0.90::true_val(terrain_suitability_powder_rating, v5); 0.10::true_val(terrain_suitability_powder_rating, unk_terrain_suitability_powder_rating).
0.93::acc(s7, terrain_suitability_powder_rating).
measured(s7, terrain_suitability_powder_rating, v5).
all_consistent(terrain_suitability_powder_rating) :- consistent(s7, terrain_suitability_powder_rating).
evidence(all_consistent(terrain_suitability_powder_rating)).
query(true_val(terrain_suitability_powder_rating, v5)).
query(true_val(terrain_suitability_powder_rating, unk_terrain_suitability_powder_rating)).

% @attr terrain_suitability_park_rating
% @type numeric
% @unit /5
% @canonical false
% @original_name terrain_suitability (Park rating)
% @values v1=1.0 unk_terrain_suitability_park_rating=Unknown
% @importance 1.00

0.90::true_val(terrain_suitability_park_rating, v1); 0.10::true_val(terrain_suitability_park_rating, unk_terrain_suitability_park_rating).
0.93::acc(s7, terrain_suitability_park_rating).
measured(s7, terrain_suitability_park_rating, v1).
all_consistent(terrain_suitability_park_rating) :- consistent(s7, terrain_suitability_park_rating).
evidence(all_consistent(terrain_suitability_park_rating)).
query(true_val(terrain_suitability_park_rating, v1)).
query(true_val(terrain_suitability_park_rating, unk_terrain_suitability_park_rating)).

% @attr warranty
% @type categorical
% @canonical false
% @original_name warranty
% @values two_year_extendable_three=2_year_warranty_extendable_to_3_years unk_warranty=Unknown
% @importance 1.00

0.90::true_val(warranty, two_year_extendable_three); 0.10::true_val(warranty, unk_warranty).
0.93::acc(s7, warranty).
measured(s7, warranty, two_year_extendable_three).
all_consistent(warranty) :- consistent(s7, warranty).
evidence(all_consistent(warranty)).
query(true_val(warranty, two_year_extendable_three)).
query(true_val(warranty, unk_warranty)).

% @attr return_policy_terms
% @type categorical
% @canonical false
% @original_name return_policy_terms
% @values thirty_day_return_minus_14_99=30_day_return_minus_14_99_shipping_discounted_final unk_return_policy_terms=Unknown
% @importance 0.50

0.90::true_val(return_policy_terms, thirty_day_return_minus_14_99); 0.10::true_val(return_policy_terms, unk_return_policy_terms).
0.93::acc(s6, return_policy_terms).
measured(s6, return_policy_terms, thirty_day_return_minus_14_99).
all_consistent(return_policy_terms) :- consistent(s6, return_policy_terms).
evidence(all_consistent(return_policy_terms)).
query(true_val(return_policy_terms, thirty_day_return_minus_14_99)).
query(true_val(return_policy_terms, unk_return_policy_terms)).

% @attr award_snowboard_mag
% @type categorical
% @canonical false
% @original_name Award
% @values platinum_pick_2026=Snowboard_Magazine_Platinum_Pick_2026 unk_award_snowboard_mag=Unknown
% @importance 0.80

0.77::true_val(award_snowboard_mag, platinum_pick_2026); 0.23::true_val(award_snowboard_mag, unk_award_snowboard_mag).
0.85::acc(s19, award_snowboard_mag).
measured(s19, award_snowboard_mag, platinum_pick_2026).
all_consistent(award_snowboard_mag) :- consistent(s19, award_snowboard_mag).
evidence(all_consistent(award_snowboard_mag)).
query(true_val(award_snowboard_mag, platinum_pick_2026)).
query(true_val(award_snowboard_mag, unk_award_snowboard_mag)).

% @attr availability_status_nidecker_us
% @type categorical
% @canonical false
% @original_name availability_status (Nidecker US)
% @values available_519_95_free_shipping=Available_519_95_USD_free_shipping unk_availability_status_nidecker_us=Unknown
% @importance 1.00

0.93::true_val(availability_status_nidecker_us, available_519_95_free_shipping); 0.07::true_val(availability_status_nidecker_us, unk_availability_status_nidecker_us).
0.95::acc(s11, availability_status_nidecker_us).
measured(s11, availability_status_nidecker_us, available_519_95_free_shipping).
all_consistent(availability_status_nidecker_us) :- consistent(s11, availability_status_nidecker_us).
evidence(all_consistent(availability_status_nidecker_us)).
query(true_val(availability_status_nidecker_us, available_519_95_free_shipping)).
query(true_val(availability_status_nidecker_us, unk_availability_status_nidecker_us)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status (evo.com)
% @values available_price_match_1yr_return=Available_free_shipping_5pct_price_match_1yr_return unk_availability_status_evo=Unknown
% @importance 0.70

0.68::true_val(availability_status_evo, available_price_match_1yr_return); 0.32::true_val(availability_status_evo, unk_availability_status_evo).
0.78::acc(s17, availability_status_evo).
measured(s17, availability_status_evo, available_price_match_1yr_return).
all_consistent(availability_status_evo) :- consistent(s17, availability_status_evo).
evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, available_price_match_1yr_return)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

% @attr availability_status_blue_tomato
% @type categorical
% @canonical false
% @original_name availability_status (BlueTomato 2026)
% @values available_499_95_eur=Available_499_95_EUR unk_availability_status_blue_tomato=Unknown
% @importance 0.90

0.60::true_val(availability_status_blue_tomato, available_499_95_eur); 0.40::true_val(availability_status_blue_tomato, unk_availability_status_blue_tomato).
0.72::acc(s12, availability_status_blue_tomato).
measured(s12, availability_status_blue_tomato, available_499_95_eur).
all_consistent(availability_status_blue_tomato) :- consistent(s12, availability_status_blue_tomato).
evidence(all_consistent(availability_status_blue_tomato)).
query(true_val(availability_status_blue_tomato, available_499_95_eur)).
query(true_val(availability_status_blue_tomato, unk_availability_status_blue_tomato)).

% @attr availability_status_blue_tomato_2025
% @type categorical
% @canonical false
% @original_name availability_status (BlueTomato 2025 model)
% @values available_439_eur=Available_439_EUR_2025_model unk_availability_status_blue_tomato_2025=Unknown
% @importance 0.90

0.60::true_val(availability_status_blue_tomato_2025, available_439_eur); 0.40::true_val(availability_status_blue_tomato_2025, unk_availability_status_blue_tomato_2025).
0.72::acc(s12, availability_status_blue_tomato_2025).
measured(s12, availability_status_blue_tomato_2025, available_439_eur).
all_consistent(availability_status_blue_tomato_2025) :- consistent(s12, availability_status_blue_tomato_2025).
evidence(all_consistent(availability_status_blue_tomato_2025)).
query(true_val(availability_status_blue_tomato_2025, available_439_eur)).
query(true_val(availability_status_blue_tomato_2025, unk_availability_status_blue_tomato_2025)).

% @attr availability_status_snowinn
% @type categorical
% @canonical false
% @original_name availability_status (Snowinn)
% @values available_417_99_usd=Available_417_99_USD_prior_year unk_availability_status_snowinn=Unknown
% @importance 0.80

0.52::true_val(availability_status_snowinn, available_417_99_usd); 0.48::true_val(availability_status_snowinn, unk_availability_status_snowinn).
0.65::acc(s13, availability_status_snowinn).
measured(s13, availability_status_snowinn, available_417_99_usd).
all_consistent(availability_status_snowinn) :- consistent(s13, availability_status_snowinn).
evidence(all_consistent(availability_status_snowinn)).
query(true_val(availability_status_snowinn, available_417_99_usd)).
query(true_val(availability_status_snowinn, unk_availability_status_snowinn)).

% @attr availability_status_eriks
% @type categorical
% @canonical false
% @original_name availability_status (ERIK'S)
% @values available_warehouse_4_9_days=Available_warehouse_fulfillment_4_9_days unk_availability_status_eriks=Unknown
% @importance 0.50

0.52::true_val(availability_status_eriks, available_warehouse_4_9_days); 0.48::true_val(availability_status_eriks, unk_availability_status_eriks).
0.63::acc(s20, availability_status_eriks).
measured(s20, availability_status_eriks, available_warehouse_4_9_days).
all_consistent(availability_status_eriks) :- consistent(s20, availability_status_eriks).
evidence(all_consistent(availability_status_eriks)).
query(true_val(availability_status_eriks, available_warehouse_4_9_days)).
query(true_val(availability_status_eriks, unk_availability_status_eriks)).

% @attr availability_status_bundle
% @type categorical
% @canonical false
% @original_name availability_status (Absolute-Snow bundle)
% @values available_bundle_10_20_off=Available_bundle_discounts_10_to_20pct_off unk_availability_status_bundle=Unknown
% @importance 0.60

0.53::true_val(availability_status_bundle, available_bundle_10_20_off); 0.47::true_val(availability_status_bundle, unk_availability_status_bundle).
0.68::acc(s21, availability_status_bundle).
measured(s21, availability_status_bundle, available_bundle_10_20_off).
all_consistent(availability_status_bundle) :- consistent(s21, availability_status_bundle).
evidence(all_consistent(availability_status_bundle)).
query(true_val(availability_status_bundle, available_bundle_10_20_off)).
query(true_val(availability_status_bundle, unk_availability_status_bundle)).

% @attr availability_status_sundance_sale
% @type categorical
% @canonical false
% @original_name availability_status (Sundance sale)
% @values on_sale_286_was_429=On_sale_286_USD_was_429 unk_availability_status_sundance_sale=Unknown
% @importance 0.50

0.45::true_val(availability_status_sundance_sale, on_sale_286_was_429); 0.55::true_val(availability_status_sundance_sale, unk_availability_status_sundance_sale).
0.60::acc(s14, availability_status_sundance_sale).
measured(s14, availability_status_sundance_sale, on_sale_286_was_429).
all_consistent(availability_status_sundance_sale) :- consistent(s14, availability_status_sundance_sale).
evidence(all_consistent(availability_status_sundance_sale)).
query(true_val(availability_status_sundance_sale, on_sale_286_was_429)).
query(true_val(availability_status_sundance_sale, unk_availability_status_sundance_sale)).

% @attr availability_status_europe
% @type categorical
% @canonical false
% @original_name availability_status (Europe)
% @values available_europe=Available_in_Europe unk_availability_status_europe=Unknown
% @importance 0.60

0.42::true_val(availability_status_europe, available_europe); 0.58::true_val(availability_status_europe, unk_availability_status_europe).
0.60::acc(s15, availability_status_europe).
measured(s15, availability_status_europe, available_europe).
all_consistent(availability_status_europe) :- consistent(s15, availability_status_europe).
evidence(all_consistent(availability_status_europe)).
query(true_val(availability_status_europe, available_europe)).
query(true_val(availability_status_europe, unk_availability_status_europe)).

% @attr evo_reputation
% @type categorical
% @canonical false
% @original_name evo.com reputation
% @values reputable_large_us_retailer=Reputable_large_US_specialty_5pct_match_1yr_returns_10pct_rewards unk_evo_reputation=Unknown
% @importance 0.70

0.68::true_val(evo_reputation, reputable_large_us_retailer); 0.32::true_val(evo_reputation, unk_evo_reputation).
0.78::acc(s17, evo_reputation).
measured(s17, evo_reputation, reputable_large_us_retailer).
all_consistent(evo_reputation) :- consistent(s17, evo_reputation).
evidence(all_consistent(evo_reputation)).
query(true_val(evo_reputation, reputable_large_us_retailer)).
query(true_val(evo_reputation, unk_evo_reputation)).

% @attr blue_tomato_reputation
% @type categorical
% @canonical false
% @original_name BlueTomato reputation
% @values established_eu_action_sports=Established_European_action_sports_retailer unk_blue_tomato_reputation=Unknown
% @importance 0.90

0.60::true_val(blue_tomato_reputation, established_eu_action_sports); 0.40::true_val(blue_tomato_reputation, unk_blue_tomato_reputation).
0.72::acc(s12, blue_tomato_reputation).
measured(s12, blue_tomato_reputation, established_eu_action_sports).
all_consistent(blue_tomato_reputation) :- consistent(s12, blue_tomato_reputation).
evidence(all_consistent(blue_tomato_reputation)).
query(true_val(blue_tomato_reputation, established_eu_action_sports)).
query(true_val(blue_tomato_reputation, unk_blue_tomato_reputation)).

% @attr snowinn_reputation
% @type categorical
% @canonical false
% @original_name Snowinn/Tradeinn reputation
% @values large_intl_spain_based=Large_international_online_sports_retailer_Spain_2000_suppliers unk_snowinn_reputation=Unknown
% @importance 0.80

0.52::true_val(snowinn_reputation, large_intl_spain_based); 0.48::true_val(snowinn_reputation, unk_snowinn_reputation).
0.65::acc(s13, snowinn_reputation).
measured(s13, snowinn_reputation, large_intl_spain_based).
all_consistent(snowinn_reputation) :- consistent(s13, snowinn_reputation).
evidence(all_consistent(snowinn_reputation)).
query(true_val(snowinn_reputation, large_intl_spain_based)).
query(true_val(snowinn_reputation, unk_snowinn_reputation)).

% @attr absolute_snow_reputation
% @type categorical
% @canonical false
% @original_name Absolute-Snow reputation
% @values established_uk_retailer=Established_UK_snowboard_ski_retailer_bundle_savings unk_absolute_snow_reputation=Unknown
% @importance 0.60

0.53::true_val(absolute_snow_reputation, established_uk_retailer); 0.47::true_val(absolute_snow_reputation, unk_absolute_snow_reputation).
0.68::acc(s21, absolute_snow_reputation).
measured(s21, absolute_snow_reputation, established_uk_retailer).
all_consistent(absolute_snow_reputation) :- consistent(s21, absolute_snow_reputation).
evidence(all_consistent(absolute_snow_reputation)).
query(true_val(absolute_snow_reputation, established_uk_retailer)).
query(true_val(absolute_snow_reputation, unk_absolute_snow_reputation)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values powerful_carving_floaty_pow=Powerful_hard_carving_front_foot_ride_transforms_floaty_in_pow unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.85

0.72::true_val(reviewer_opinion_the_good_ride, powerful_carving_floaty_pow); 0.28::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).
0.82::acc(s22, reviewer_opinion_the_good_ride).
measured(s22, reviewer_opinion_the_good_ride, powerful_carving_floaty_pow).
all_consistent(reviewer_opinion_the_good_ride) :- consistent(s22, reviewer_opinion_the_good_ride).
evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, powerful_carving_floaty_pow)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr reviewer_opinion_the_good_ride_value
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (value proposition)
% @values borderline_snowsurf_reasonable_price=Great_option_borderline_snowsurf_ride_reasonable_price unk_reviewer_opinion_the_good_ride_value=Unknown
% @importance 0.85

0.72::true_val(reviewer_opinion_the_good_ride_value, borderline_snowsurf_reasonable_price); 0.28::true_val(reviewer_opinion_the_good_ride_value, unk_reviewer_opinion_the_good_ride_value).
0.82::acc(s22, reviewer_opinion_the_good_ride_value).
measured(s22, reviewer_opinion_the_good_ride_value, borderline_snowsurf_reasonable_price).
all_consistent(reviewer_opinion_the_good_ride_value) :- consistent(s22, reviewer_opinion_the_good_ride_value).
evidence(all_consistent(reviewer_opinion_the_good_ride_value)).
query(true_val(reviewer_opinion_the_good_ride_value, borderline_snowsurf_reasonable_price)).
query(true_val(reviewer_opinion_the_good_ride_value, unk_reviewer_opinion_the_good_ride_value)).

% @attr edge_hold
% @type categorical
% @canonical false
% @original_name edge_hold
% @values adequate_not_special=Adequate_not_special_works_except_hard_snow_ice unk_edge_hold=Unknown
% @importance 0.90

0.72::true_val(edge_hold, adequate_not_special); 0.28::true_val(edge_hold, unk_edge_hold).
0.82::acc(s23, edge_hold).
measured(s23, edge_hold, adequate_not_special).
all_consistent(edge_hold) :- consistent(s23, edge_hold).
evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, adequate_not_special)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values decent_for_price=Not_bad_for_price_keeps_speed_when_waxed unk_base_glide_performance=Unknown
% @importance 0.90

0.72::true_val(base_glide_performance, decent_for_price); 0.28::true_val(base_glide_performance, unk_base_glide_performance).
0.82::acc(s23, base_glide_performance).
measured(s23, base_glide_performance, decent_for_price).
all_consistent(base_glide_performance) :- consistent(s23, base_glide_performance).
evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, decent_for_price)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr reviewer_opinion_the_good_ride_dampness
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (dampness)
% @values surprisingly_damp_straight_line=Surprisingly_damp_going_straight unk_reviewer_opinion_the_good_ride_dampness=Unknown
% @importance 0.90

0.72::true_val(reviewer_opinion_the_good_ride_dampness, surprisingly_damp_straight_line); 0.28::true_val(reviewer_opinion_the_good_ride_dampness, unk_reviewer_opinion_the_good_ride_dampness).
0.82::acc(s23, reviewer_opinion_the_good_ride_dampness).
measured(s23, reviewer_opinion_the_good_ride_dampness, surprisingly_damp_straight_line).
all_consistent(reviewer_opinion_the_good_ride_dampness) :- consistent(s23, reviewer_opinion_the_good_ride_dampness).
evidence(all_consistent(reviewer_opinion_the_good_ride_dampness)).
query(true_val(reviewer_opinion_the_good_ride_dampness, surprisingly_damp_straight_line)).
query(true_val(reviewer_opinion_the_good_ride_dampness, unk_reviewer_opinion_the_good_ride_dampness)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values excels_narrow_s_turns_hard_carves=Excels_narrow_s_turns_build_speed_hard_groomer_carves unk_turn_initiation_performance=Unknown
% @importance 0.90

0.72::true_val(turn_initiation_performance, excels_narrow_s_turns_hard_carves); 0.28::true_val(turn_initiation_performance, unk_turn_initiation_performance).
0.82::acc(s23, turn_initiation_performance).
measured(s23, turn_initiation_performance, excels_narrow_s_turns_hard_carves).
all_consistent(turn_initiation_performance) :- consistent(s23, turn_initiation_performance).
evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, excels_narrow_s_turns_hard_carves)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr reviewer_opinion_the_good_ride_boot_size
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (boot sizing)
% @values us_8_5_9_5_for_157=Ideal_US_boot_8_5_to_9_5_for_157_10_5_to_12_for_162 unk_reviewer_opinion_the_good_ride_boot_size=Unknown
% @importance 0.80

0.68::true_val(reviewer_opinion_the_good_ride_boot_size, us_8_5_9_5_for_157); 0.32::true_val(reviewer_opinion_the_good_ride_boot_size, unk_reviewer_opinion_the_good_ride_boot_size).
0.80::acc(s24, reviewer_opinion_the_good_ride_boot_size).
measured(s24, reviewer_opinion_the_good_ride_boot_size, us_8_5_9_5_for_157).
all_consistent(reviewer_opinion_the_good_ride_boot_size) :- consistent(s24, reviewer_opinion_the_good_ride_boot_size).
evidence(all_consistent(reviewer_opinion_the_good_ride_boot_size)).
query(true_val(reviewer_opinion_the_good_ride_boot_size, us_8_5_9_5_for_157)).
query(true_val(reviewer_opinion_the_good_ride_boot_size, unk_reviewer_opinion_the_good_ride_boot_size)).

% @attr reviewer_opinion_the_good_ride_weight
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (weight range)
% @values conservative_weight_ranges=Nidecker_very_conservative_with_weight_ranges_dont_worry_if_over unk_reviewer_opinion_the_good_ride_weight=Unknown
% @importance 0.80

0.68::true_val(reviewer_opinion_the_good_ride_weight, conservative_weight_ranges); 0.32::true_val(reviewer_opinion_the_good_ride_weight, unk_reviewer_opinion_the_good_ride_weight).
0.80::acc(s24, reviewer_opinion_the_good_ride_weight).
measured(s24, reviewer_opinion_the_good_ride_weight, conservative_weight_ranges).
all_consistent(reviewer_opinion_the_good_ride_weight) :- consistent(s24, reviewer_opinion_the_good_ride_weight).
evidence(all_consistent(reviewer_opinion_the_good_ride_weight)).
query(true_val(reviewer_opinion_the_good_ride_weight, conservative_weight_ranges)).
query(true_val(reviewer_opinion_the_good_ride_weight, unk_reviewer_opinion_the_good_ride_weight)).

% @attr reviewer_opinion_the_good_ride_sizing
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (sizing comparison)
% @values v157_great_all_conditions=157_great_all_conditions_162_only_deep_powder unk_reviewer_opinion_the_good_ride_sizing=Unknown
% @importance 0.80

0.68::true_val(reviewer_opinion_the_good_ride_sizing, v157_great_all_conditions); 0.32::true_val(reviewer_opinion_the_good_ride_sizing, unk_reviewer_opinion_the_good_ride_sizing).
0.80::acc(s24, reviewer_opinion_the_good_ride_sizing).
measured(s24, reviewer_opinion_the_good_ride_sizing, v157_great_all_conditions).
all_consistent(reviewer_opinion_the_good_ride_sizing) :- consistent(s24, reviewer_opinion_the_good_ride_sizing).
evidence(all_consistent(reviewer_opinion_the_good_ride_sizing)).
query(true_val(reviewer_opinion_the_good_ride_sizing, v157_great_all_conditions)).
query(true_val(reviewer_opinion_the_good_ride_sizing, unk_reviewer_opinion_the_good_ride_sizing)).

% @attr reviewer_opinion_the_good_ride_quiver
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (quiver recommendation)
% @values great_one_board_directional=Great_choice_if_one_board_directional_riding unk_reviewer_opinion_the_good_ride_quiver=Unknown
% @importance 0.90

0.68::true_val(reviewer_opinion_the_good_ride_quiver, great_one_board_directional); 0.32::true_val(reviewer_opinion_the_good_ride_quiver, unk_reviewer_opinion_the_good_ride_quiver).
0.80::acc(s25, reviewer_opinion_the_good_ride_quiver).
measured(s25, reviewer_opinion_the_good_ride_quiver, great_one_board_directional).
all_consistent(reviewer_opinion_the_good_ride_quiver) :- consistent(s25, reviewer_opinion_the_good_ride_quiver).
evidence(all_consistent(reviewer_opinion_the_good_ride_quiver)).
query(true_val(reviewer_opinion_the_good_ride_quiver, great_one_board_directional)).
query(true_val(reviewer_opinion_the_good_ride_quiver, unk_reviewer_opinion_the_good_ride_quiver)).

% @attr reviewer_opinion_the_good_ride_steep
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (steep/deep)
% @values built_for_deepest_steepest=Built_for_the_deepest_and_steepest_days unk_reviewer_opinion_the_good_ride_steep=Unknown
% @importance 0.80

0.60::true_val(reviewer_opinion_the_good_ride_steep, built_for_deepest_steepest); 0.40::true_val(reviewer_opinion_the_good_ride_steep, unk_reviewer_opinion_the_good_ride_steep).
0.72::acc(s26, reviewer_opinion_the_good_ride_steep).
measured(s26, reviewer_opinion_the_good_ride_steep, built_for_deepest_steepest).
all_consistent(reviewer_opinion_the_good_ride_steep) :- consistent(s26, reviewer_opinion_the_good_ride_steep).
evidence(all_consistent(reviewer_opinion_the_good_ride_steep)).
query(true_val(reviewer_opinion_the_good_ride_steep, built_for_deepest_steepest)).
query(true_val(reviewer_opinion_the_good_ride_steep, unk_reviewer_opinion_the_good_ride_steep)).

% @attr nose_3d_assessment
% @type categorical
% @canonical false
% @original_name 3D nose assessment
% @values subtle_unnoticed=Best_part_did_not_notice_it_subtle_no_impede_traverses unk_nose_3d_assessment=Unknown
% @importance 0.80

0.60::true_val(nose_3d_assessment, subtle_unnoticed); 0.40::true_val(nose_3d_assessment, unk_nose_3d_assessment).
0.72::acc(s26, nose_3d_assessment).
measured(s26, nose_3d_assessment, subtle_unnoticed).
all_consistent(nose_3d_assessment) :- consistent(s26, nose_3d_assessment).
evidence(all_consistent(nose_3d_assessment)).
query(true_val(nose_3d_assessment, subtle_unnoticed)).
query(true_val(nose_3d_assessment, unk_nose_3d_assessment)).

% @attr turn_initiation_performance_mwn
% @type categorical
% @canonical false
% @original_name turn_initiation_performance (Mountain Weekly News)
% @values rocker_nose_deflects_chunky_easy=Rocker_nose_deflects_chunky_snow_easy_turn_initiation unk_turn_initiation_performance_mwn=Unknown
% @importance 0.80

0.60::true_val(turn_initiation_performance_mwn, rocker_nose_deflects_chunky_easy); 0.40::true_val(turn_initiation_performance_mwn, unk_turn_initiation_performance_mwn).
0.72::acc(s26, turn_initiation_performance_mwn).
measured(s26, turn_initiation_performance_mwn, rocker_nose_deflects_chunky_easy).
all_consistent(turn_initiation_performance_mwn) :- consistent(s26, turn_initiation_performance_mwn).
evidence(all_consistent(turn_initiation_performance_mwn)).
query(true_val(turn_initiation_performance_mwn, rocker_nose_deflects_chunky_easy)).
query(true_val(turn_initiation_performance_mwn, unk_turn_initiation_performance_mwn)).

% @attr wide_board_feel
% @type categorical
% @canonical false
% @original_name Wide board feel
% @values rides_smaller_narrower_easy_turns=Rides_smaller_narrower_than_size_easy_turn_initiation unk_wide_board_feel=Unknown
% @importance 0.70

0.60::true_val(wide_board_feel, rides_smaller_narrower_easy_turns); 0.40::true_val(wide_board_feel, unk_wide_board_feel).
0.72::acc(s27, wide_board_feel).
measured(s27, wide_board_feel, rides_smaller_narrower_easy_turns).
all_consistent(wide_board_feel) :- consistent(s27, wide_board_feel).
evidence(all_consistent(wide_board_feel)).
query(true_val(wide_board_feel, rides_smaller_narrower_easy_turns)).
query(true_val(wide_board_feel, unk_wide_board_feel)).

% @attr binding_recommendation
% @type categorical
% @canonical false
% @original_name Binding recommendation
% @values medium_flex_for_piste=Medium_flex_binding_more_performance_on_piste unk_binding_recommendation=Unknown
% @importance 0.70

0.60::true_val(binding_recommendation, medium_flex_for_piste); 0.40::true_val(binding_recommendation, unk_binding_recommendation).
0.72::acc(s27, binding_recommendation).
measured(s27, binding_recommendation, medium_flex_for_piste).
all_consistent(binding_recommendation) :- consistent(s27, binding_recommendation).
evidence(all_consistent(binding_recommendation)).
query(true_val(binding_recommendation, medium_flex_for_piste)).
query(true_val(binding_recommendation, unk_binding_recommendation)).

% @attr stance_tip
% @type categorical
% @canonical false
% @original_name Stance tip
% @values shift_forward_one_set_helps_rear_foot=Shifting_forward_one_set_2in_helps_rear_foot_drivers unk_stance_tip=Unknown
% @importance 0.60

0.56::true_val(stance_tip, shift_forward_one_set_helps_rear_foot); 0.44::true_val(stance_tip, unk_stance_tip).
0.70::acc(s28, stance_tip).
measured(s28, stance_tip, shift_forward_one_set_helps_rear_foot).
all_consistent(stance_tip) :- consistent(s28, stance_tip).
evidence(all_consistent(stance_tip)).
query(true_val(stance_tip, shift_forward_one_set_helps_rear_foot)).
query(true_val(stance_tip, unk_stance_tip)).

% @attr speed_assessment
% @type categorical
% @canonical false
% @original_name Speed assessment
% @values carries_speed_stiff_enough=Son_thrilled_carries_speed_stiff_enough_rip_through_everything unk_speed_assessment=Unknown
% @importance 0.80

0.60::true_val(speed_assessment, carries_speed_stiff_enough); 0.40::true_val(speed_assessment, unk_speed_assessment).
0.72::acc(s26, speed_assessment).
measured(s26, speed_assessment, carries_speed_stiff_enough).
all_consistent(speed_assessment) :- consistent(s26, speed_assessment).
evidence(all_consistent(speed_assessment)).
query(true_val(speed_assessment, carries_speed_stiff_enough)).
query(true_val(speed_assessment, unk_speed_assessment)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values super_smooth_floaty_powder=Super_smooth_floaty_feeling_in_powder unk_positive_aspect=Unknown
% @importance 0.85

0.47::true_val(positive_aspect, super_smooth_floaty_powder); 0.53::true_val(positive_aspect, unk_positive_aspect).
0.58::acc(s29, positive_aspect).
measured(s29, positive_aspect, super_smooth_floaty_powder).
all_consistent(positive_aspect) :- consistent(s29, positive_aspect).
evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, super_smooth_floaty_powder)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr positive_aspect_groomer
% @type categorical
% @canonical false
% @original_name positive_aspect (groomer carving)
% @values super_fun_carve_groomers=Super_fun_to_carve_on_groomers_any_turn unk_positive_aspect_groomer=Unknown
% @importance 0.85

0.47::true_val(positive_aspect_groomer, super_fun_carve_groomers); 0.53::true_val(positive_aspect_groomer, unk_positive_aspect_groomer).
0.58::acc(s29, positive_aspect_groomer).
measured(s29, positive_aspect_groomer, super_fun_carve_groomers).
all_consistent(positive_aspect_groomer) :- consistent(s29, positive_aspect_groomer).
evidence(all_consistent(positive_aspect_groomer)).
query(true_val(positive_aspect_groomer, super_fun_carve_groomers)).
query(true_val(positive_aspect_groomer, unk_positive_aspect_groomer)).

% @attr positive_aspect_stability
% @type categorical
% @canonical false
% @original_name positive_aspect (stability)
% @values very_stable_blast_everything=Very_stable_blast_riding_moguls_to_switch unk_positive_aspect_stability=Unknown
% @importance 0.85

0.47::true_val(positive_aspect_stability, very_stable_blast_everything); 0.53::true_val(positive_aspect_stability, unk_positive_aspect_stability).
0.58::acc(s29, positive_aspect_stability).
measured(s29, positive_aspect_stability, very_stable_blast_everything).
all_consistent(positive_aspect_stability) :- consistent(s29, positive_aspect_stability).
evidence(all_consistent(positive_aspect_stability)).
query(true_val(positive_aspect_stability, very_stable_blast_everything)).
query(true_val(positive_aspect_stability, unk_positive_aspect_stability)).

% @attr positive_aspect_nose
% @type categorical
% @canonical false
% @original_name positive_aspect (nose behavior)
% @values big_nose_no_chatter=Big_nose_never_seems_to_chatter unk_positive_aspect_nose=Unknown
% @importance 0.85

0.47::true_val(positive_aspect_nose, big_nose_no_chatter); 0.53::true_val(positive_aspect_nose, unk_positive_aspect_nose).
0.58::acc(s29, positive_aspect_nose).
measured(s29, positive_aspect_nose, big_nose_no_chatter).
all_consistent(positive_aspect_nose) :- consistent(s29, positive_aspect_nose).
evidence(all_consistent(positive_aspect_nose)).
query(true_val(positive_aspect_nose, big_nose_no_chatter)).
query(true_val(positive_aspect_nose, unk_positive_aspect_nose)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values no_fun_ice_hard_snow=No_fun_ice_hard_snow_3D_nose_squirrelly unk_negative_aspect=Unknown
% @importance 0.85

0.47::true_val(negative_aspect, no_fun_ice_hard_snow); 0.53::true_val(negative_aspect, unk_negative_aspect).
0.58::acc(s29, negative_aspect).
measured(s29, negative_aspect, no_fun_ice_hard_snow).
all_consistent(negative_aspect) :- consistent(s29, negative_aspect).
evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, no_fun_ice_hard_snow)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values definitely_quiver_board=Definitely_a_quiver_board unk_user_review_forum=Unknown
% @importance 0.85

0.47::true_val(user_review_forum, definitely_quiver_board); 0.53::true_val(user_review_forum, unk_user_review_forum).
0.58::acc(s29, user_review_forum).
measured(s29, user_review_forum, definitely_quiver_board).
all_consistent(user_review_forum) :- consistent(s29, user_review_forum).
evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, definitely_quiver_board)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr user_review_forum_powder
% @type categorical
% @canonical false
% @original_name user_review_forum (powder comparison)
% @values best_ridden_low_angle_powder=By_far_the_best_ridden_in_low_angle_powder unk_user_review_forum_powder=Unknown
% @importance 0.85

0.47::true_val(user_review_forum_powder, best_ridden_low_angle_powder); 0.53::true_val(user_review_forum_powder, unk_user_review_forum_powder).
0.58::acc(s29, user_review_forum_powder).
measured(s29, user_review_forum_powder, best_ridden_low_angle_powder).
all_consistent(user_review_forum_powder) :- consistent(s29, user_review_forum_powder).
evidence(all_consistent(user_review_forum_powder)).
query(true_val(user_review_forum_powder, best_ridden_low_angle_powder)).
query(true_val(user_review_forum_powder, unk_user_review_forum_powder)).

% @attr user_review_forum_base
% @type categorical
% @canonical false
% @original_name user_review_forum (base durability)
% @values n7000_fragile_warm_temps=N_7000_base_seems_fragile_not_good_warm_temps unk_user_review_forum_base=Unknown
% @importance 0.70

0.30::true_val(user_review_forum_base, n7000_fragile_warm_temps); 0.70::true_val(user_review_forum_base, unk_user_review_forum_base).
0.42::acc(s30, user_review_forum_base).
measured(s30, user_review_forum_base, n7000_fragile_warm_temps).
all_consistent(user_review_forum_base) :- consistent(s30, user_review_forum_base).
evidence(all_consistent(user_review_forum_base)).
query(true_val(user_review_forum_base, n7000_fragile_warm_temps)).
query(true_val(user_review_forum_base, unk_user_review_forum_base)).

% @attr negative_aspect_torsion
% @type categorical
% @canonical false
% @original_name negative_aspect (torsional stiffness)
% @values too_torsionally_stiff=Too_torsionally_stiff_delay_edge_to_edge unk_negative_aspect_torsion=Unknown
% @importance 0.75

0.48::true_val(negative_aspect_torsion, too_torsionally_stiff); 0.52::true_val(negative_aspect_torsion, unk_negative_aspect_torsion).
0.60::acc(s31, negative_aspect_torsion).
measured(s31, negative_aspect_torsion, too_torsionally_stiff).
all_consistent(negative_aspect_torsion) :- consistent(s31, negative_aspect_torsion).
evidence(all_consistent(negative_aspect_torsion)).
query(true_val(negative_aspect_torsion, too_torsionally_stiff)).
query(true_val(negative_aspect_torsion, unk_negative_aspect_torsion)).

% @attr positive_aspect_deep_snow
% @type categorical
% @canonical false
% @original_name positive_aspect (deep heavy snow)
% @values plowed_through_deep_heavy_chop=In_deep_heavy_snow_plowed_through_ease_serious_chop unk_positive_aspect_deep_snow=Unknown
% @importance 0.75

0.48::true_val(positive_aspect_deep_snow, plowed_through_deep_heavy_chop); 0.52::true_val(positive_aspect_deep_snow, unk_positive_aspect_deep_snow).
0.60::acc(s31, positive_aspect_deep_snow).
measured(s31, positive_aspect_deep_snow, plowed_through_deep_heavy_chop).
all_consistent(positive_aspect_deep_snow) :- consistent(s31, positive_aspect_deep_snow).
evidence(all_consistent(positive_aspect_deep_snow)).
query(true_val(positive_aspect_deep_snow, plowed_through_deep_heavy_chop)).
query(true_val(positive_aspect_deep_snow, unk_positive_aspect_deep_snow)).

% @attr positive_aspect_dampness
% @type categorical
% @canonical false
% @original_name positive_aspect (dampness)
% @values damp_pushes_through_everything=Very_damp_pushes_through_everything_in_path unk_positive_aspect_dampness=Unknown
% @importance 0.75

0.48::true_val(positive_aspect_dampness, damp_pushes_through_everything); 0.52::true_val(positive_aspect_dampness, unk_positive_aspect_dampness).
0.60::acc(s31, positive_aspect_dampness).
measured(s31, positive_aspect_dampness, damp_pushes_through_everything).
all_consistent(positive_aspect_dampness) :- consistent(s31, positive_aspect_dampness).
evidence(all_consistent(positive_aspect_dampness)).
query(true_val(positive_aspect_dampness, damp_pushes_through_everything)).
query(true_val(positive_aspect_dampness, unk_positive_aspect_dampness)).

% @attr negative_aspect_trees
% @type categorical
% @canonical false
% @original_name negative_aspect (trees/calculated riding)
% @values more_energy_trees_calculated=In_trees_calculated_using_more_energy unk_negative_aspect_trees=Unknown
% @importance 0.75

0.48::true_val(negative_aspect_trees, more_energy_trees_calculated); 0.52::true_val(negative_aspect_trees, unk_negative_aspect_trees).
0.60::acc(s31, negative_aspect_trees).
measured(s31, negative_aspect_trees, more_energy_trees_calculated).
all_consistent(negative_aspect_trees) :- consistent(s31, negative_aspect_trees).
evidence(all_consistent(negative_aspect_trees)).
query(true_val(negative_aspect_trees, more_energy_trees_calculated)).
query(true_val(negative_aspect_trees, unk_negative_aspect_trees)).

% @attr flex_feel
% @type categorical
% @canonical false
% @original_name flex_feel
% @values fully_directional_stiffer_side=Fully_directional_stiffer_side_nose_flex_stiff_tail unk_flex_feel=Unknown
% @importance 0.75

0.48::true_val(flex_feel, fully_directional_stiffer_side); 0.52::true_val(flex_feel, unk_flex_feel).
0.60::acc(s31, flex_feel).
measured(s31, flex_feel, fully_directional_stiffer_side).
all_consistent(flex_feel) :- consistent(s31, flex_feel).
evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, fully_directional_stiffer_side)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values yes_pyl_burton_fa_jones_flagship_etc=YES_PYL_Burton_FA_Jones_Flagship_Rossignol_XV_LibTech_BRD_etc unk_comparable_board_cross_brand=Unknown
% @importance 0.90

0.68::true_val(comparable_board_cross_brand, yes_pyl_burton_fa_jones_flagship_etc); 0.32::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).
0.80::acc(s25, comparable_board_cross_brand).
measured(s25, comparable_board_cross_brand, yes_pyl_burton_fa_jones_flagship_etc).
all_consistent(comparable_board_cross_brand) :- consistent(s25, comparable_board_cross_brand).
evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, yes_pyl_burton_fa_jones_flagship_etc)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr award_quote
% @type categorical
% @canonical false
% @original_name Award quote
% @values softer_playful_cruising_setback_powder=Softer_playful_built_for_cruising_2in_setback_powder_breeze unk_award_quote=Unknown
% @importance 0.80

0.77::true_val(award_quote, softer_playful_cruising_setback_powder); 0.23::true_val(award_quote, unk_award_quote).
0.85::acc(s19, award_quote).
measured(s19, award_quote, softer_playful_cruising_setback_powder).
all_consistent(award_quote) :- consistent(s19, award_quote).
evidence(all_consistent(award_quote)).
query(true_val(award_quote, softer_playful_cruising_setback_powder)).
query(true_val(award_quote, unk_award_quote)).

% @attr comparable_board_same_brand_dampness
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (dampness comparison)
% @values beta_apx_not_as_damp=Beta_APX_not_as_damp_but_close_fun_in_more_conditions unk_comparable_board_same_brand_dampness=Unknown
% @importance 0.80

0.68::true_val(comparable_board_same_brand_dampness, beta_apx_not_as_damp); 0.32::true_val(comparable_board_same_brand_dampness, unk_comparable_board_same_brand_dampness).
0.80::acc(s32, comparable_board_same_brand_dampness).
measured(s32, comparable_board_same_brand_dampness, beta_apx_not_as_damp).
all_consistent(comparable_board_same_brand_dampness) :- consistent(s32, comparable_board_same_brand_dampness).
evidence(all_consistent(comparable_board_same_brand_dampness)).
query(true_val(comparable_board_same_brand_dampness, beta_apx_not_as_damp)).
query(true_val(comparable_board_same_brand_dampness, unk_comparable_board_same_brand_dampness)).

% @attr comparable_board_same_brand_allday
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (all-day recommendation)
% @values get_beta_if_ride_all_day=Still_get_Beta_if_ride_all_day_vs_APX unk_comparable_board_same_brand_allday=Unknown
% @importance 0.80

0.68::true_val(comparable_board_same_brand_allday, get_beta_if_ride_all_day); 0.32::true_val(comparable_board_same_brand_allday, unk_comparable_board_same_brand_allday).
0.80::acc(s32, comparable_board_same_brand_allday).
measured(s32, comparable_board_same_brand_allday, get_beta_if_ride_all_day).
all_consistent(comparable_board_same_brand_allday) :- consistent(s32, comparable_board_same_brand_allday).
evidence(all_consistent(comparable_board_same_brand_allday)).
query(true_val(comparable_board_same_brand_allday, get_beta_if_ride_all_day)).
query(true_val(comparable_board_same_brand_allday, unk_comparable_board_same_brand_allday)).

% @attr base_glide_performance_whitelines
% @type categorical
% @canonical false
% @original_name base_glide_performance (Whitelines)
% @values sheer_glide=Shape_shines_through_sheer_glide unk_base_glide_performance_whitelines=Unknown
% @importance 0.70

0.60::true_val(base_glide_performance_whitelines, sheer_glide); 0.40::true_val(base_glide_performance_whitelines, unk_base_glide_performance_whitelines).
0.75::acc(s33, base_glide_performance_whitelines).
measured(s33, base_glide_performance_whitelines, sheer_glide).
all_consistent(base_glide_performance_whitelines) :- consistent(s33, base_glide_performance_whitelines).
evidence(all_consistent(base_glide_performance_whitelines)).
query(true_val(base_glide_performance_whitelines, sheer_glide)).
query(true_val(base_glide_performance_whitelines, unk_base_glide_performance_whitelines)).

% @attr terrain_suitability_natural_terrain
% @type categorical
% @canonical false
% @original_name terrain_suitability (natural terrain)
% @values windlips_gullies_forests_faces=Lovers_natural_terrain_windlips_gullies_forests_faces unk_terrain_suitability_natural_terrain=Unknown
% @importance 0.70

0.60::true_val(terrain_suitability_natural_terrain, windlips_gullies_forests_faces); 0.40::true_val(terrain_suitability_natural_terrain, unk_terrain_suitability_natural_terrain).
0.75::acc(s33, terrain_suitability_natural_terrain).
measured(s33, terrain_suitability_natural_terrain, windlips_gullies_forests_faces).
all_consistent(terrain_suitability_natural_terrain) :- consistent(s33, terrain_suitability_natural_terrain).
evidence(all_consistent(terrain_suitability_natural_terrain)).
query(true_val(terrain_suitability_natural_terrain, windlips_gullies_forests_faces)).
query(true_val(terrain_suitability_natural_terrain, unk_terrain_suitability_natural_terrain)).

% @attr nidecker_brand_recognition
% @type categorical
% @canonical false
% @original_name Nidecker brand recognition 2026
% @values alpha_apx_best_overall_inertia=The_Inertia_Nidecker_Alpha_APX_Best_Overall_Snowboard_2026 unk_nidecker_brand_recognition=Unknown
% @importance 0.50

0.45::true_val(nidecker_brand_recognition, alpha_apx_best_overall_inertia); 0.55::true_val(nidecker_brand_recognition, unk_nidecker_brand_recognition).
0.68::acc(s34, nidecker_brand_recognition).
measured(s34, nidecker_brand_recognition, alpha_apx_best_overall_inertia).
all_consistent(nidecker_brand_recognition) :- consistent(s34, nidecker_brand_recognition).
evidence(all_consistent(nidecker_brand_recognition)).
query(true_val(nidecker_brand_recognition, alpha_apx_best_overall_inertia)).
query(true_val(nidecker_brand_recognition, unk_nidecker_brand_recognition)).

% @attr comparable_board_cross_brand_angry_sb
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Angry Snowboarder)
% @values jones_storm_wolf_gnu_gremlin_capita_kazu=Jones_Storm_Wolf_Gnu_Gremlin_Capita_Kazu unk_comparable_board_cross_brand_angry_sb=Unknown
% @importance 0.75

0.48::true_val(comparable_board_cross_brand_angry_sb, jones_storm_wolf_gnu_gremlin_capita_kazu); 0.52::true_val(comparable_board_cross_brand_angry_sb, unk_comparable_board_cross_brand_angry_sb).
0.60::acc(s31, comparable_board_cross_brand_angry_sb).
measured(s31, comparable_board_cross_brand_angry_sb, jones_storm_wolf_gnu_gremlin_capita_kazu).
all_consistent(comparable_board_cross_brand_angry_sb) :- consistent(s31, comparable_board_cross_brand_angry_sb).
evidence(all_consistent(comparable_board_cross_brand_angry_sb)).
query(true_val(comparable_board_cross_brand_angry_sb, jones_storm_wolf_gnu_gremlin_capita_kazu)).
query(true_val(comparable_board_cross_brand_angry_sb, unk_comparable_board_cross_brand_angry_sb)).

% @attr comparable_board_cross_brand_surf
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (surf/powder)
% @values korua_dart_cafe_racer_weston_japow_etc=Korua_Dart_Cafe_Racer_Weston_Japow_Moss_Jellyfish_Gentemstick unk_comparable_board_cross_brand_surf=Unknown
% @importance 0.75

0.64::true_val(comparable_board_cross_brand_surf, korua_dart_cafe_racer_weston_japow_etc); 0.36::true_val(comparable_board_cross_brand_surf, unk_comparable_board_cross_brand_surf).
0.80::acc(s35, comparable_board_cross_brand_surf).
measured(s35, comparable_board_cross_brand_surf, korua_dart_cafe_racer_weston_japow_etc).
all_consistent(comparable_board_cross_brand_surf) :- consistent(s35, comparable_board_cross_brand_surf).
evidence(all_consistent(comparable_board_cross_brand_surf)).
query(true_val(comparable_board_cross_brand_surf, korua_dart_cafe_racer_weston_japow_etc)).
query(true_val(comparable_board_cross_brand_surf, unk_comparable_board_cross_brand_surf)).

% @attr comparable_board_same_brand_specs
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (APX specs)
% @values same_shape_stiffer_lighter_n9000=Same_shape_stiffer_lighter_power_rails_triax_plus_n9000_489eur unk_comparable_board_same_brand_specs=Unknown
% @importance 0.70

0.68::true_val(comparable_board_same_brand_specs, same_shape_stiffer_lighter_n9000); 0.32::true_val(comparable_board_same_brand_specs, unk_comparable_board_same_brand_specs).
0.78::acc(s10, comparable_board_same_brand_specs).
measured(s10, comparable_board_same_brand_specs, same_shape_stiffer_lighter_n9000).
all_consistent(comparable_board_same_brand_specs) :- consistent(s10, comparable_board_same_brand_specs).
evidence(all_consistent(comparable_board_same_brand_specs)).
query(true_val(comparable_board_same_brand_specs, same_shape_stiffer_lighter_n9000)).
query(true_val(comparable_board_same_brand_specs, unk_comparable_board_same_brand_specs)).

% @attr youtube_powder_ranking
% @type categorical
% @canonical false
% @original_name YouTube 10 Best Powder Snowboards ranking
% @values ranked_number_1=Nidecker_Beta_listed_number_1 unk_youtube_powder_ranking=Unknown
% @importance 0.40

0.23::true_val(youtube_powder_ranking, ranked_number_1); 0.77::true_val(youtube_powder_ranking, unk_youtube_powder_ranking).
0.35::acc(s36, youtube_powder_ranking).
measured(s36, youtube_powder_ranking, ranked_number_1).
all_consistent(youtube_powder_ranking) :- consistent(s36, youtube_powder_ranking).
evidence(all_consistent(youtube_powder_ranking)).
query(true_val(youtube_powder_ranking, ranked_number_1)).
query(true_val(youtube_powder_ranking, unk_youtube_powder_ranking)).

% @attr design_inspiration
% @type categorical
% @canonical false
% @original_name Design inspiration
% @values biomimicry_marine_bird_prey=Biomimicry_nose_marine_animals_tail_bird_of_prey unk_design_inspiration=Unknown
% @importance 0.70

0.60::true_val(design_inspiration, biomimicry_marine_bird_prey); 0.40::true_val(design_inspiration, unk_design_inspiration).
0.75::acc(s33, design_inspiration).
measured(s33, design_inspiration, biomimicry_marine_bird_prey).
all_consistent(design_inspiration) :- consistent(s33, design_inspiration).
evidence(all_consistent(design_inspiration)).
query(true_val(design_inspiration, biomimicry_marine_bird_prey)).
query(true_val(design_inspiration, unk_design_inspiration)).

% @attr series_philosophy
% @type categorical
% @canonical false
% @original_name Series philosophy
% @values natural_world_shapes_natural_selection=Shapes_from_natural_world_strategies_natural_selection unk_series_philosophy=Unknown
% @importance 0.40

0.60::true_val(series_philosophy, natural_world_shapes_natural_selection); 0.40::true_val(series_philosophy, unk_series_philosophy).
0.72::acc(s37, series_philosophy).
measured(s37, series_philosophy, natural_world_shapes_natural_selection).
all_consistent(series_philosophy) :-
    (indep(s37), consistent(s37, series_philosophy) ; \+indep(s37)).
evidence(all_consistent(series_philosophy)).
query(true_val(series_philosophy, natural_world_shapes_natural_selection)).
query(true_val(series_philosophy, unk_series_philosophy)).

% @attr terrain_suitability_deep_powder
% @type categorical
% @canonical false
% @original_name terrain_suitability (deep powder days)
% @values deep_powder_freeride_backcountry_steep=Deep_powder_freeride_backcountry_steep_terrain unk_terrain_suitability_deep_powder=Unknown
% @importance 0.93

0.90::true_val(terrain_suitability_deep_powder, deep_powder_freeride_backcountry_steep); 0.10::true_val(terrain_suitability_deep_powder, unk_terrain_suitability_deep_powder).
0.93::acc(s7, terrain_suitability_deep_powder).
0.82::acc(s22, terrain_suitability_deep_powder).
measured(s7, terrain_suitability_deep_powder, deep_powder_freeride_backcountry_steep).
measured(s22, terrain_suitability_deep_powder, deep_powder_freeride_backcountry_steep).
all_consistent(terrain_suitability_deep_powder) :- consistent(s7, terrain_suitability_deep_powder), consistent(s22, terrain_suitability_deep_powder).
evidence(all_consistent(terrain_suitability_deep_powder)).
query(true_val(terrain_suitability_deep_powder, deep_powder_freeride_backcountry_steep)).
query(true_val(terrain_suitability_deep_powder, unk_terrain_suitability_deep_powder)).

% @attr terrain_suitability_groomer
% @type categorical
% @canonical false
% @original_name terrain_suitability (groomer carving)
% @values groomer_carving_front_foot=Groomer_carving_front_foot_weighted_turns unk_terrain_suitability_groomer=Unknown
% @importance 0.85

0.72::true_val(terrain_suitability_groomer, groomer_carving_front_foot); 0.28::true_val(terrain_suitability_groomer, unk_terrain_suitability_groomer).
0.82::acc(s22, terrain_suitability_groomer).
measured(s22, terrain_suitability_groomer, groomer_carving_front_foot).
all_consistent(terrain_suitability_groomer) :- consistent(s22, terrain_suitability_groomer).
evidence(all_consistent(terrain_suitability_groomer)).
query(true_val(terrain_suitability_groomer, groomer_carving_front_foot)).
query(true_val(terrain_suitability_groomer, unk_terrain_suitability_groomer)).

% @attr terrain_suitability_ice
% @type categorical
% @canonical false
% @original_name terrain_suitability (ice/hard pack)
% @values poor_edge_hold_ice_3d_nose=Poor_edge_hold_ice_hard_pack_3D_nose_rocker unk_terrain_suitability_ice=Unknown
% @importance 0.88

0.70::true_val(terrain_suitability_ice, poor_edge_hold_ice_3d_nose); 0.30::true_val(terrain_suitability_ice, unk_terrain_suitability_ice).
0.82::acc(s23, terrain_suitability_ice).
0.58::acc(s29, terrain_suitability_ice).
measured(s23, terrain_suitability_ice, poor_edge_hold_ice_3d_nose).
measured(s29, terrain_suitability_ice, poor_edge_hold_ice_3d_nose).
all_consistent(terrain_suitability_ice) :- consistent(s23, terrain_suitability_ice), consistent(s29, terrain_suitability_ice).
evidence(all_consistent(terrain_suitability_ice)).
query(true_val(terrain_suitability_ice, poor_edge_hold_ice_3d_nose)).
query(true_val(terrain_suitability_ice, unk_terrain_suitability_ice)).

% @attr terrain_suitability_park
% @type categorical
% @canonical false
% @original_name terrain_suitability (park riding)
% @values park_1_out_of_5=Park_riding_1_out_of_5 unk_terrain_suitability_park=Unknown
% @importance 1.00

0.90::true_val(terrain_suitability_park, park_1_out_of_5); 0.10::true_val(terrain_suitability_park, unk_terrain_suitability_park).
0.93::acc(s7, terrain_suitability_park).
measured(s7, terrain_suitability_park, park_1_out_of_5).
all_consistent(terrain_suitability_park) :- consistent(s7, terrain_suitability_park).
evidence(all_consistent(terrain_suitability_park)).
query(true_val(terrain_suitability_park, park_1_out_of_5)).
query(true_val(terrain_suitability_park, unk_terrain_suitability_park)).

% @attr riding_style
% @type categorical
% @canonical false
% @original_name riding_style
% @values surfy_floaty_directional=Surfy_floaty_directional unk_riding_style=Unknown
% @importance 1.00

0.90::true_val(riding_style, surfy_floaty_directional); 0.10::true_val(riding_style, unk_riding_style).
0.93::acc(s7, riding_style).
measured(s7, riding_style, surfy_floaty_directional).
all_consistent(riding_style) :- consistent(s7, riding_style).
evidence(all_consistent(riding_style)).
query(true_val(riding_style, surfy_floaty_directional)).
query(true_val(riding_style, unk_riding_style)).

% @attr gender
% @type categorical
% @canonical false
% @original_name gender
% @values unisex_mens=Unisex_Mens_listed_under_mens unk_gender=Unknown
% @importance 0.40

0.81::true_val(gender, unisex_mens); 0.19::true_val(gender, unk_gender).
0.88::acc(s5, gender).
measured(s5, gender, unisex_mens).
all_consistent(gender) :- consistent(s5, gender).
evidence(all_consistent(gender)).
query(true_val(gender, unisex_mens)).
query(true_val(gender, unk_gender)).

% @attr recommended_bindings_nidecker
% @type categorical
% @canonical false
% @original_name Recommended bindings (Nidecker suggested)
% @values lt_supermatic_479_95=LT_Supermatic_479_95_or_standard_Supermatic unk_recommended_bindings_nidecker=Unknown
% @importance 0.50

0.90::true_val(recommended_bindings_nidecker, lt_supermatic_479_95); 0.10::true_val(recommended_bindings_nidecker, unk_recommended_bindings_nidecker).
0.93::acc(s6, recommended_bindings_nidecker).
measured(s6, recommended_bindings_nidecker, lt_supermatic_479_95).
all_consistent(recommended_bindings_nidecker) :- consistent(s6, recommended_bindings_nidecker).
evidence(all_consistent(recommended_bindings_nidecker)).
query(true_val(recommended_bindings_nidecker, lt_supermatic_479_95)).
query(true_val(recommended_bindings_nidecker, unk_recommended_bindings_nidecker)).

% @attr recommended_boots_nidecker
% @type categorical
% @canonical false
% @original_name Recommended boots (Nidecker suggested)
% @values rift_pro_399_95=Rift_Pro_399_95 unk_recommended_boots_nidecker=Unknown
% @importance 0.50

0.90::true_val(recommended_boots_nidecker, rift_pro_399_95); 0.10::true_val(recommended_boots_nidecker, unk_recommended_boots_nidecker).
0.93::acc(s6, recommended_boots_nidecker).
measured(s6, recommended_boots_nidecker, rift_pro_399_95).
all_consistent(recommended_boots_nidecker) :- consistent(s6, recommended_boots_nidecker).
evidence(all_consistent(recommended_boots_nidecker)).
query(true_val(recommended_boots_nidecker, rift_pro_399_95)).
query(true_val(recommended_boots_nidecker, unk_recommended_boots_nidecker)).

% @attr us_brand_awareness
% @type categorical
% @canonical false
% @original_name US brand awareness
% @values not_well_known_in_us=Nidecker_not_well_known_brand_in_US unk_us_brand_awareness=Unknown
% @importance 0.80

0.60::true_val(us_brand_awareness, not_well_known_in_us); 0.40::true_val(us_brand_awareness, unk_us_brand_awareness).
0.72::acc(s26, us_brand_awareness).
measured(s26, us_brand_awareness, not_well_known_in_us).
all_consistent(us_brand_awareness) :- consistent(s26, us_brand_awareness).
evidence(all_consistent(us_brand_awareness)).
query(true_val(us_brand_awareness, not_well_known_in_us)).
query(true_val(us_brand_awareness, unk_us_brand_awareness)).

% @attr industry_standing
% @type categorical
% @canonical false
% @original_name Industry standing
% @values og_european_since_1984=OG_European_manufacturer_boards_since_1984 unk_industry_standing=Unknown
% @importance 0.80

0.60::true_val(industry_standing, og_european_since_1984); 0.40::true_val(industry_standing, unk_industry_standing).
0.72::acc(s26, industry_standing).
measured(s26, industry_standing, og_european_since_1984).
all_consistent(industry_standing) :- consistent(s26, industry_standing).
evidence(all_consistent(industry_standing)).
query(true_val(industry_standing, og_european_since_1984)).
query(true_val(industry_standing, unk_industry_standing)).

% @attr ndk_group_standing
% @type categorical
% @canonical false
% @original_name NDK Group standing
% @values second_biggest_snowboard_company=Second_biggest_snowboard_company_in_world unk_ndk_group_standing=Unknown
% @importance 0.60

0.71::true_val(ndk_group_standing, second_biggest_snowboard_company); 0.29::true_val(ndk_group_standing, unk_ndk_group_standing).
0.78::acc(s3, ndk_group_standing).
measured(s3, ndk_group_standing, second_biggest_snowboard_company).
all_consistent(ndk_group_standing) :- consistent(s3, ndk_group_standing).
evidence(all_consistent(ndk_group_standing)).
query(true_val(ndk_group_standing, second_biggest_snowboard_company)).
query(true_val(ndk_group_standing, unk_ndk_group_standing)).

% @attr sustainability_certification
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values most_sustainably_sourced_timber=Made_from_most_sustainably_sourced_timber unk_sustainability_certification=Unknown
% @importance 1.00

0.90::true_val(sustainability_certification, most_sustainably_sourced_timber); 0.10::true_val(sustainability_certification, unk_sustainability_certification).
0.93::acc(s7, sustainability_certification).
measured(s7, sustainability_certification, most_sustainably_sourced_timber).
all_consistent(sustainability_certification) :- consistent(s7, sustainability_certification).
evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, most_sustainably_sourced_timber)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr core_material_older
% @type categorical
% @canonical false
% @original_name core_material (older model NDK Swiss Core)
% @values ndk_swiss_core_poplar=NDK_Swiss_Core_sustainably_harvested_light_poplar unk_core_material_older=Unknown
% @importance 0.40

0.60::true_val(core_material_older, ndk_swiss_core_poplar); 0.40::true_val(core_material_older, unk_core_material_older).
0.70::acc(s37, core_material_older).
measured(s37, core_material_older, ndk_swiss_core_poplar).
all_consistent(core_material_older) :-
    (indep(s37), consistent(s37, core_material_older) ; \+indep(s37)).
evidence(all_consistent(core_material_older)).
query(true_val(core_material_older, ndk_swiss_core_poplar)).
query(true_val(core_material_older, unk_core_material_older)).

% @attr base_graphic
% @type categorical
% @canonical false
% @original_name Base graphic
% @values diecut_base=Diecut_base_pure_color_materials_jigsaw unk_base_graphic=Unknown
% @importance 1.00

0.90::true_val(base_graphic, diecut_base); 0.10::true_val(base_graphic, unk_base_graphic).
0.93::acc(s7, base_graphic).
measured(s7, base_graphic, diecut_base).
all_consistent(base_graphic) :- consistent(s7, base_graphic).
evidence(all_consistent(base_graphic)).
query(true_val(base_graphic, diecut_base)).
query(true_val(base_graphic, unk_base_graphic)).

% @attr topsheet_appearance_description
% @type categorical
% @canonical false
% @original_name topsheet_appearance_description
% @values glossy_overprint_translucent=Glossy_finish_overprint_layered_artwork_translucent_color unk_topsheet_appearance_description=Unknown
% @importance 1.00

0.90::true_val(topsheet_appearance_description, glossy_overprint_translucent); 0.10::true_val(topsheet_appearance_description, unk_topsheet_appearance_description).
0.93::acc(s7, topsheet_appearance_description).
measured(s7, topsheet_appearance_description, glossy_overprint_translucent).
all_consistent(topsheet_appearance_description) :- consistent(s7, topsheet_appearance_description).
evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, glossy_overprint_translucent)).
query(true_val(topsheet_appearance_description, unk_topsheet_appearance_description)).