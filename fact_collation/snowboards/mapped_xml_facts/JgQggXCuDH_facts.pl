0.15::indep(s14).
0.20::indep(s19).
0.20::indep(s29).
0.30::indep(s9).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values bataleon=Bataleon unk_brand=Unknown
% @importance 1.0
0.92::true_val(brand, bataleon); 0.08::true_val(brand, unk_brand).
0.95::acc(s1, brand).
measured(s1, brand, bataleon).
all_consistent(brand) :- consistent(s1, brand).
evidence(all_consistent(brand)).
query(true_val(brand, bataleon)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values thunderstorm=ThunderStorm unk_model_name=Unknown
% @importance 1.0
0.92::true_val(model_name, thunderstorm); 0.08::true_val(model_name, unk_model_name).
0.95::acc(s1, model_name).
measured(s1, model_name, thunderstorm).
all_consistent(model_name) :- consistent(s1, model_name).
evidence(all_consistent(model_name)).
query(true_val(model_name, thunderstorm)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values season_2025_26=2025/2026 unk_model_year=Unknown
% @importance 1.0
0.92::true_val(model_year, season_2025_26); 0.08::true_val(model_year, unk_model_year).
0.95::acc(s1, model_year).
measured(s1, model_year, season_2025_26).
all_consistent(model_year) :- consistent(s1, model_year).
evidence(all_consistent(model_year)).
query(true_val(model_year, season_2025_26)).
query(true_val(model_year, unk_model_year)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values low_pressure_studio=Low_Pressure_Studio_BV unk_manufacturer=Unknown
% @importance 0.3
0.68::true_val(manufacturer, low_pressure_studio); 0.32::true_val(manufacturer, unk_manufacturer).
0.78::acc(s2, manufacturer).
measured(s2, manufacturer, low_pressure_studio).
all_consistent(manufacturer) :- consistent(s2, manufacturer).
evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, low_pressure_studio)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr parent_company
% @type categorical
% @canonical false
% @original_name Parent company
% @values nidecker_group=Nidecker_Group unk_parent_company=Unknown
% @importance 0.5
0.90::true_val(parent_company, nidecker_group); 0.10::true_val(parent_company, unk_parent_company).
0.93::acc(s3, parent_company).
measured(s3, parent_company, nidecker_group).
all_consistent(parent_company) :- consistent(s3, parent_company).
evidence(all_consistent(parent_company)).
query(true_val(parent_company, nidecker_group)).
query(true_val(parent_company, unk_parent_company)).

% @attr sister_brands
% @type categorical
% @canonical false
% @original_name Nidecker Group sister brands
% @values jones_rome_nidecker_thirtytwo_yes_emerica_es_etnies=Jones_Rome_Nidecker_Thirtytwo_YES_Emerica_eS_Etnies unk_sister_brands=Unknown
% @importance 0.5
0.90::true_val(sister_brands, jones_rome_nidecker_thirtytwo_yes_emerica_es_etnies); 0.10::true_val(sister_brands, unk_sister_brands).
0.93::acc(s3, sister_brands).
measured(s3, sister_brands, jones_rome_nidecker_thirtytwo_yes_emerica_es_etnies).
all_consistent(sister_brands) :- consistent(s3, sister_brands).
evidence(all_consistent(sister_brands)).
query(true_val(sister_brands, jones_rome_nidecker_thirtytwo_yes_emerica_es_etnies)).
query(true_val(sister_brands, unk_sister_brands)).

% @attr founder
% @type categorical
% @canonical false
% @original_name Founder
% @values jorgen_karlsen=Jorgen_Karlsen_Norwegian_biophysicist unk_founder=Unknown
% @importance 0.35
0.77::true_val(founder, jorgen_karlsen); 0.23::true_val(founder, unk_founder).
0.84::acc(s4, founder).
measured(s4, founder, jorgen_karlsen).
all_consistent(founder) :- consistent(s4, founder).
evidence(all_consistent(founder)).
query(true_val(founder, jorgen_karlsen)).
query(true_val(founder, unk_founder)).

% @attr year_founded
% @type categorical
% @canonical false
% @original_name Year founded
% @values y2000=2000 y1998=1998
% @importance 0.30
0.75::true_val(year_founded, y2000); 0.25::true_val(year_founded, y1998).
0.80::acc(s5, year_founded).
0.45::acc(s6, year_founded).
measured(s5, year_founded, y2000).
measured(s6, year_founded, y1998).
all_consistent(year_founded) :- consistent(s5, year_founded), consistent(s6, year_founded).
evidence(all_consistent(year_founded)).
query(true_val(year_founded, y2000)).
query(true_val(year_founded, y1998)).

% @attr headquarters
% @type categorical
% @canonical false
% @original_name Headquarters
% @values amsterdam_nl=Amsterdam_Netherlands unk_headquarters=Unknown
% @importance 0.35
0.60::true_val(headquarters, amsterdam_nl); 0.40::true_val(headquarters, unk_headquarters).
0.72::acc(s7, headquarters).
measured(s7, headquarters, amsterdam_nl).
all_consistent(headquarters) :- consistent(s7, headquarters).
evidence(all_consistent(headquarters)).
query(true_val(headquarters, amsterdam_nl)).
query(true_val(headquarters, unk_headquarters)).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values austria_capita_mothership=Austria_CAPiTA_Mothership unk_manufacturing_location_current=Unknown
% @importance 0.45
0.95::true_val(manufacturing_location_current, austria_capita_mothership); 0.05::true_val(manufacturing_location_current, unk_manufacturing_location_current).
0.85::acc(s8, manufacturing_location_current).
0.70::acc(s9, manufacturing_location_current).
measured(s8, manufacturing_location_current, austria_capita_mothership).
measured(s9, manufacturing_location_current, austria_capita_mothership).
all_consistent(manufacturing_location_current) :- consistent(s8, manufacturing_location_current), (indep(s9), consistent(s9, manufacturing_location_current) ; \+indep(s9)).
evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, austria_capita_mothership)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

% @attr manufacturing_location_prior
% @type categorical
% @canonical false
% @original_name manufacturing_location_prior
% @values elan_then_asia_then_mothership=Elan_then_Asia_then_CAPiTA_Mothership unk_manufacturing_location_prior=Unknown
% @importance 0.35
0.56::true_val(manufacturing_location_prior, elan_then_asia_then_mothership); 0.44::true_val(manufacturing_location_prior, unk_manufacturing_location_prior).
0.72::acc(s10, manufacturing_location_prior).
measured(s10, manufacturing_location_prior, elan_then_asia_then_mothership).
all_consistent(manufacturing_location_prior) :- consistent(s10, manufacturing_location_prior).
evidence(all_consistent(manufacturing_location_prior)).
query(true_val(manufacturing_location_prior, elan_then_asia_then_mothership)).
query(true_val(manufacturing_location_prior, unk_manufacturing_location_prior)).

% @attr brand_entered_market
% @type categorical
% @canonical false
% @original_name Brand entered market at
% @values ispo_brandnew_2005=ISPO_Brandnew_2005 unk_brand_entered_market=Unknown
% @importance 0.3
0.77::true_val(brand_entered_market, ispo_brandnew_2005); 0.23::true_val(brand_entered_market, unk_brand_entered_market).
0.84::acc(s11, brand_entered_market).
measured(s11, brand_entered_market, ispo_brandnew_2005).
all_consistent(brand_entered_market) :- consistent(s11, brand_entered_market).
evidence(all_consistent(brand_entered_market)).
query(true_val(brand_entered_market, ispo_brandnew_2005)).
query(true_val(brand_entered_market, unk_brand_entered_market)).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values thunder_and_storm=Thunder_men_Storm_women_combined unk_predecessor_model_name=Unknown
% @importance 0.6
0.76::true_val(predecessor_model_name, thunder_and_storm); 0.24::true_val(predecessor_model_name, unk_predecessor_model_name).
0.82::acc(s12, predecessor_model_name).
measured(s12, predecessor_model_name, thunder_and_storm).
all_consistent(predecessor_model_name) :- consistent(s12, predecessor_model_name).
evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, thunder_and_storm)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2023_24=2023_2024_season unk_model_first_available_year=Unknown
% @importance 0.6
0.76::true_val(model_first_available_year, season_2023_24); 0.24::true_val(model_first_available_year, unk_model_first_available_year).
0.82::acc(s12, model_first_available_year).
measured(s12, model_first_available_year, season_2023_24).
all_consistent(model_first_available_year) :- consistent(s12, model_first_available_year).
evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2023_24)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0
0.92::true_val(product_type, snowboard); 0.08::true_val(product_type, unk_product_type).
0.95::acc(s1, product_type).
measured(s1, product_type, snowboard).
all_consistent(product_type) :- consistent(s1, product_type).
evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values unisex=Unisex_Genderless unk_gender=Unknown
% @importance 1.0
0.92::true_val(gender, unisex); 0.08::true_val(gender, unk_gender).
0.95::acc(s1, gender).
measured(s1, gender, unisex).
all_consistent(gender) :- consistent(s1, gender).
evidence(all_consistent(gender)).
query(true_val(gender, unisex)).
query(true_val(gender, unk_gender)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values freeride_powder_mellow=Freeride_Powder_Mellow_Freeride unk_board_category=Unknown
% @importance 0.75
0.93::true_val(board_category, freeride_powder_mellow); 0.07::true_val(board_category, unk_board_category).
0.80::acc(s13, board_category).
0.75::acc(s14, board_category).
measured(s13, board_category, freeride_powder_mellow).
measured(s14, board_category, freeride_powder_mellow).
all_consistent(board_category) :- consistent(s13, board_category), (indep(s14), consistent(s14, board_category) ; \+indep(s14)).
evidence(all_consistent(board_category)).
query(true_val(board_category, freeride_powder_mellow)).
query(true_val(board_category, unk_board_category)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v589_95=589.95 unk_price_usd_msrp=Unknown
% @importance 1.0
0.92::true_val(price_usd_msrp, v589_95); 0.08::true_val(price_usd_msrp, unk_price_usd_msrp).
0.95::acc(s1, price_usd_msrp).
measured(s1, price_usd_msrp, v589_95).
all_consistent(price_usd_msrp) :- consistent(s1, price_usd_msrp).
evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v589_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_usd_evo
% @type numeric
% @canonical false
% @original_name price_usd_evo
% @unit USD
% @values v412_96=412.96 unk_price_usd_evo=Unknown
% @importance 0.95
0.77::true_val(price_usd_evo, v412_96); 0.23::true_val(price_usd_evo, unk_price_usd_evo).
0.82::acc(s15, price_usd_evo).
measured(s15, price_usd_evo, v412_96).
all_consistent(price_usd_evo) :- consistent(s15, price_usd_evo).
evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v412_96)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_aud_merchant
% @type numeric
% @canonical false
% @original_name price_aud_merchant
% @unit AUD
% @values v949_99=949.99 unk_price_aud_merchant=Unknown
% @importance 0.8
0.64::true_val(price_aud_merchant, v949_99); 0.36::true_val(price_aud_merchant, unk_price_aud_merchant).
0.70::acc(s14, price_aud_merchant).
measured(s14, price_aud_merchant, v949_99).
all_consistent(price_aud_merchant) :- consistent(s14, price_aud_merchant).
evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v949_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values two_plus_one=2_plus_1_year unk_warranty=Unknown
% @importance 1.0
0.92::true_val(warranty, two_plus_one); 0.08::true_val(warranty, unk_warranty).
0.95::acc(s1, warranty).
measured(s1, warranty, two_plus_one).
all_consistent(warranty) :- consistent(s1, warranty).
evidence(all_consistent(warranty)).
query(true_val(warranty, two_plus_one)).
query(true_val(warranty, unk_warranty)).

% @attr return_policy_terms
% @type categorical
% @canonical true
% @original_name return_policy_terms
% @values days_45=45_day_returns unk_return_policy_terms=Unknown
% @importance 1.0
0.92::true_val(return_policy_terms, days_45); 0.08::true_val(return_policy_terms, unk_return_policy_terms).
0.95::acc(s1, return_policy_terms).
measured(s1, return_policy_terms, days_45).
all_consistent(return_policy_terms) :- consistent(s1, return_policy_terms).
evidence(all_consistent(return_policy_terms)).
query(true_val(return_policy_terms, days_45)).
query(true_val(return_policy_terms, unk_return_policy_terms)).

% @attr shipping_bataleon_us
% @type categorical
% @canonical false
% @original_name Shipping (Bataleon US)
% @values free_over_50=Free_shipping_over_50_USD unk_shipping_bataleon_us=Unknown
% @importance 1.0
0.92::true_val(shipping_bataleon_us, free_over_50); 0.08::true_val(shipping_bataleon_us, unk_shipping_bataleon_us).
0.95::acc(s1, shipping_bataleon_us).
measured(s1, shipping_bataleon_us, free_over_50).
all_consistent(shipping_bataleon_us) :- consistent(s1, shipping_bataleon_us).
evidence(all_consistent(shipping_bataleon_us)).
query(true_val(shipping_bataleon_us, free_over_50)).
query(true_val(shipping_bataleon_us, unk_shipping_bataleon_us)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values bataleon_com=Bataleon_US_direct unk_availability_status=Unknown
% @importance 1.0
0.92::true_val(availability_status, bataleon_com); 0.08::true_val(availability_status, unk_availability_status).
0.95::acc(s1, availability_status).
measured(s1, availability_status, bataleon_com).
all_consistent(availability_status) :- consistent(s1, availability_status).
evidence(all_consistent(availability_status)).
query(true_val(availability_status, bataleon_com)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status (evo.com)
% @values evo_com=evo_com_available unk_availability_status_evo=Unknown
% @importance 0.95
0.77::true_val(availability_status_evo, evo_com); 0.23::true_val(availability_status_evo, unk_availability_status_evo).
0.82::acc(s15, availability_status_evo).
measured(s15, availability_status_evo, evo_com).
all_consistent(availability_status_evo) :- consistent(s15, availability_status_evo).
evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, evo_com)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

% @attr availability_status_darkside
% @type categorical
% @canonical false
% @original_name availability_status (Darkside Snowboards)
% @values darkside=Darkside_Snowboards_available unk_availability_status_darkside=Unknown
% @importance 0.5
0.45::true_val(availability_status_darkside, darkside); 0.55::true_val(availability_status_darkside, unk_availability_status_darkside).
0.58::acc(s16, availability_status_darkside).
measured(s16, availability_status_darkside, darkside).
all_consistent(availability_status_darkside) :- consistent(s16, availability_status_darkside).
evidence(all_consistent(availability_status_darkside)).
query(true_val(availability_status_darkside, darkside)).
query(true_val(availability_status_darkside, unk_availability_status_darkside)).

% @attr availability_status_helmetsnow
% @type categorical
% @canonical false
% @original_name availability_status (Helmet Snow)
% @values helmetsnow=Helmet_Snow_available unk_availability_status_helmetsnow=Unknown
% @importance 0.6
0.47::true_val(availability_status_helmetsnow, helmetsnow); 0.53::true_val(availability_status_helmetsnow, unk_availability_status_helmetsnow).
0.55::acc(s17, availability_status_helmetsnow).
measured(s17, availability_status_helmetsnow, helmetsnow).
all_consistent(availability_status_helmetsnow) :- consistent(s17, availability_status_helmetsnow).
evidence(all_consistent(availability_status_helmetsnow)).
query(true_val(availability_status_helmetsnow, helmetsnow)).
query(true_val(availability_status_helmetsnow, unk_availability_status_helmetsnow)).

% @attr availability_status_cbs
% @type categorical
% @canonical false
% @original_name availability_status (CBS Boardshop)
% @values cbs=CBS_Boardshop_available unk_availability_status_cbs=Unknown
% @importance 0.4
0.39::true_val(availability_status_cbs, cbs); 0.61::true_val(availability_status_cbs, unk_availability_status_cbs).
0.55::acc(s18, availability_status_cbs).
measured(s18, availability_status_cbs, cbs).
all_consistent(availability_status_cbs) :- consistent(s18, availability_status_cbs).
evidence(all_consistent(availability_status_cbs)).
query(true_val(availability_status_cbs, cbs)).
query(true_val(availability_status_cbs, unk_availability_status_cbs)).

% @attr availability_status_melbourne
% @type categorical
% @canonical false
% @original_name availability_status (Melbourne Snowboard Centre)
% @values melbourne=Melbourne_Snowboard_Centre_available unk_availability_status_melbourne=Unknown
% @importance 0.8
0.64::true_val(availability_status_melbourne, melbourne); 0.36::true_val(availability_status_melbourne, unk_availability_status_melbourne).
0.70::acc(s14, availability_status_melbourne).
measured(s14, availability_status_melbourne, melbourne).
all_consistent(availability_status_melbourne) :- consistent(s14, availability_status_melbourne).
evidence(all_consistent(availability_status_melbourne)).
query(true_val(availability_status_melbourne, melbourne)).
query(true_val(availability_status_melbourne, unk_availability_status_melbourne)).

% @attr availability_status_absolute
% @type categorical
% @canonical false
% @original_name availability_status (Absolute Snow)
% @values absolute_snow=Absolute_Snow_UK_available unk_availability_status_absolute=Unknown
% @importance 0.7
0.62::true_val(availability_status_absolute, absolute_snow); 0.38::true_val(availability_status_absolute, unk_availability_status_absolute).
0.70::acc(s19, availability_status_absolute).
measured(s19, availability_status_absolute, absolute_snow).
all_consistent(availability_status_absolute) :- consistent(s19, availability_status_absolute).
evidence(all_consistent(availability_status_absolute)).
query(true_val(availability_status_absolute, absolute_snow)).
query(true_val(availability_status_absolute, unk_availability_status_absolute)).

% @attr availability_status_sideways
% @type categorical
% @canonical false
% @original_name availability_status (Sideways/Snowboards.eu)
% @values sideways=Sideways_Snowboards_eu_available unk_availability_status_sideways=Unknown
% @importance 0.4
0.39::true_val(availability_status_sideways, sideways); 0.61::true_val(availability_status_sideways, unk_availability_status_sideways).
0.55::acc(s20, availability_status_sideways).
measured(s20, availability_status_sideways, sideways).
all_consistent(availability_status_sideways) :- consistent(s20, availability_status_sideways).
evidence(all_consistent(availability_status_sideways)).
query(true_val(availability_status_sideways, sideways)).
query(true_val(availability_status_sideways, unk_availability_status_sideways)).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status (Blauer Board Shop)
% @values blauer=Blauer_Board_Shop_available unk_availability_status_blauer=Unknown
% @importance 0.55
0.55::true_val(availability_status_blauer, blauer); 0.45::true_val(availability_status_blauer, unk_availability_status_blauer).
0.65::acc(s21, availability_status_blauer).
measured(s21, availability_status_blauer, blauer).
all_consistent(availability_status_blauer) :- consistent(s21, availability_status_blauer).
evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, blauer)).
query(true_val(availability_status_blauer, unk_availability_status_blauer)).

% @attr availability_status_solnix
% @type categorical
% @canonical false
% @original_name availability_status (SOLNIX)
% @values solnix=SOLNIX_available unk_availability_status_solnix=Unknown
% @importance 0.35
0.33::true_val(availability_status_solnix, solnix); 0.67::true_val(availability_status_solnix, unk_availability_status_solnix).
0.50::acc(s22, availability_status_solnix).
measured(s22, availability_status_solnix, solnix).
all_consistent(availability_status_solnix) :- consistent(s22, availability_status_solnix).
evidence(all_consistent(availability_status_solnix)).
query(true_val(availability_status_solnix, solnix)).
query(true_val(availability_status_solnix, unk_availability_status_solnix)).

% @attr availability_status_rei
% @type categorical
% @canonical false
% @original_name availability_status (REI Co-op)
% @values rei=REI_available_2024_2025_model unk_availability_status_rei=Unknown
% @importance 0.5
0.64::true_val(availability_status_rei, rei); 0.36::true_val(availability_status_rei, unk_availability_status_rei).
0.80::acc(s23, availability_status_rei).
measured(s23, availability_status_rei, rei).
all_consistent(availability_status_rei) :- consistent(s23, availability_status_rei).
evidence(all_consistent(availability_status_rei)).
query(true_val(availability_status_rei, rei)).
query(true_val(availability_status_rei, unk_availability_status_rei)).

% @attr availability_status_backcountry
% @type categorical
% @canonical false
% @original_name availability_status (Backcountry.com)
% @values backcountry=Backcountry_com_available unk_availability_status_backcountry=Unknown
% @importance 0.4
0.46::true_val(availability_status_backcountry, backcountry); 0.54::true_val(availability_status_backcountry, unk_availability_status_backcountry).
0.65::acc(s24, availability_status_backcountry).
measured(s24, availability_status_backcountry, backcountry).
all_consistent(availability_status_backcountry) :- consistent(s24, availability_status_backcountry).
evidence(all_consistent(availability_status_backcountry)).
query(true_val(availability_status_backcountry, backcountry)).
query(true_val(availability_status_backcountry, unk_availability_status_backcountry)).

% @attr availability_status_some_sold_out
% @type categorical
% @canonical false
% @original_name availability_status (some sizes sold out)
% @values some_sizes_sold_out=Some_sizes_variant_sold_out unk_availability_status_some_sold_out=Unknown
% @importance 1.0
0.92::true_val(availability_status_some_sold_out, some_sizes_sold_out); 0.08::true_val(availability_status_some_sold_out, unk_availability_status_some_sold_out).
0.90::acc(s1, availability_status_some_sold_out).
measured(s1, availability_status_some_sold_out, some_sizes_sold_out).
all_consistent(availability_status_some_sold_out) :- consistent(s1, availability_status_some_sold_out).
evidence(all_consistent(availability_status_some_sold_out)).
query(true_val(availability_status_some_sold_out, some_sizes_sold_out)).
query(true_val(availability_status_some_sold_out, unk_availability_status_some_sold_out)).

% @attr availability_status_proctor
% @type categorical
% @canonical false
% @original_name availability_status (Proctor Ski & Board)
% @values proctor=Proctor_Ski_Board_available unk_availability_status_proctor=Unknown
% @importance 0.3
0.33::true_val(availability_status_proctor, proctor); 0.67::true_val(availability_status_proctor, unk_availability_status_proctor).
0.55::acc(s25, availability_status_proctor).
measured(s25, availability_status_proctor, proctor).
all_consistent(availability_status_proctor) :- consistent(s25, availability_status_proctor).
evidence(all_consistent(availability_status_proctor)).
query(true_val(availability_status_proctor, proctor)).
query(true_val(availability_status_proctor, unk_availability_status_proctor)).

% @attr availability_status_powderforce
% @type categorical
% @canonical false
% @original_name availability_status (Powderforce.com)
% @values powderforce=Powderforce_available unk_availability_status_powderforce=Unknown
% @importance 0.35
0.41::true_val(availability_status_powderforce, powderforce); 0.59::true_val(availability_status_powderforce, unk_availability_status_powderforce).
0.55::acc(s26, availability_status_powderforce).
measured(s26, availability_status_powderforce, powderforce).
all_consistent(availability_status_powderforce) :- consistent(s26, availability_status_powderforce).
evidence(all_consistent(availability_status_powderforce)).
query(true_val(availability_status_powderforce, powderforce)).
query(true_val(availability_status_powderforce, unk_availability_status_powderforce)).

% @attr flex_rating_10_manufacturer
% @type numeric
% @canonical true
% @original_name flex_rating_10_manufacturer
% @unit /10
% @values v6_0=6.0 unk_flex_rating_10_manufacturer=Unknown
% @importance 1.0
0.92::true_val(flex_rating_10_manufacturer, v6_0); 0.08::true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer).
0.95::acc(s1, flex_rating_10_manufacturer).
measured(s1, flex_rating_10_manufacturer, v6_0).
all_consistent(flex_rating_10_manufacturer) :- consistent(s1, flex_rating_10_manufacturer).
evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, v6_0)).
query(true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values mid_flex=Mid_flex_Medium unk_flex_feel=Unknown
% @importance 1.0
0.92::true_val(flex_feel, mid_flex); 0.08::true_val(flex_feel, unk_flex_feel).
0.93::acc(s1, flex_feel).
measured(s1, flex_feel, mid_flex).
all_consistent(flex_feel) :- consistent(s1, flex_feel).
evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, mid_flex)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr flex_feel_reviewer
% @type numeric
% @canonical false
% @original_name flex_feel (independent reviewer)
% @unit /10
% @values v6_5=6.5 unk_flex_feel_reviewer=Unknown
% @importance 0.9
0.76::true_val(flex_feel_reviewer, v6_5); 0.24::true_val(flex_feel_reviewer, unk_flex_feel_reviewer).
0.88::acc(s27, flex_feel_reviewer).
measured(s27, flex_feel_reviewer, v6_5).
all_consistent(flex_feel_reviewer) :- consistent(s27, flex_feel_reviewer).
evidence(all_consistent(flex_feel_reviewer)).
query(true_val(flex_feel_reviewer, v6_5)).
query(true_val(flex_feel_reviewer, unk_flex_feel_reviewer)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values advanced_intermediate=Advanced_Intermediate_to_Advanced unk_rider_level=Unknown
% @importance 0.85
0.93::true_val(rider_level, advanced_intermediate); 0.07::true_val(rider_level, unk_rider_level).
0.75::acc(s14, rider_level).
0.85::acc(s27, rider_level).
measured(s14, rider_level, advanced_intermediate).
measured(s27, rider_level, advanced_intermediate).
all_consistent(rider_level) :- (indep(s14), consistent(s14, rider_level) ; \+indep(s14)), consistent(s27, rider_level).
evidence(all_consistent(rider_level)).
query(true_val(rider_level, advanced_intermediate)).
query(true_val(rider_level, unk_rider_level)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 0.8
0.64::true_val(shape, tapered_directional); 0.36::true_val(shape, unk_shape).
0.78::acc(s14, shape).
measured(s14, shape, tapered_directional).
all_consistent(shape) :- consistent(s14, shape).
evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

% @attr taper
% @type numeric
% @canonical true
% @original_name taper
% @unit mm
% @values v6=6.0 unk_taper=Unknown
% @importance 0.65
0.72::true_val(taper, v6); 0.28::true_val(taper, unk_taper).
0.90::acc(s28, taper).
measured(s28, taper, v6).
all_consistent(taper) :- consistent(s28, taper).
evidence(all_consistent(taper)).
query(true_val(taper, v6)).
query(true_val(taper, unk_taper)).

% @attr setback
% @type numeric
% @canonical true
% @original_name setback
% @unit mm
% @values v10=10.0 unk_setback=Unknown
% @importance 0.9
0.76::true_val(setback, v10); 0.24::true_val(setback, unk_setback).
0.88::acc(s27, setback).
measured(s27, setback, v10).
all_consistent(setback) :- consistent(s27, setback).
evidence(all_consistent(setback)).
query(true_val(setback, v10)).
query(true_val(setback, unk_setback)).

% @attr camber_height_mm
% @type numeric
% @canonical true
% @original_name camber_height_mm
% @unit mm
% @values v10=10.0 unk_camber_height_mm=Unknown
% @importance 0.9
0.76::true_val(camber_height_mm, v10); 0.24::true_val(camber_height_mm, unk_camber_height_mm).
0.90::acc(s27, camber_height_mm).
measured(s27, camber_height_mm, v10).
all_consistent(camber_height_mm) :- consistent(s27, camber_height_mm).
evidence(all_consistent(camber_height_mm)).
query(true_val(camber_height_mm, v10)).
query(true_val(camber_height_mm, unk_camber_height_mm)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values medium_camber=Medium_Camber low_camber=Low_Camber
% @importance 0.76
0.62::true_val(camber_type, medium_camber); 0.38::true_val(camber_type, low_camber).
0.94::acc(s1, camber_type).
0.72::acc(s14, camber_type).
0.72::acc(s19, camber_type).
0.78::acc(s29, camber_type).
0.65::acc(s30, camber_type).
measured(s1, camber_type, medium_camber).
measured(s14, camber_type, medium_camber).
measured(s19, camber_type, medium_camber).
measured(s29, camber_type, low_camber).
measured(s30, camber_type, low_camber).
all_consistent(camber_type) :- consistent(s1, camber_type), (indep(s14), consistent(s14, camber_type) ; \+indep(s14)), (indep(s19), consistent(s19, camber_type) ; \+indep(s19)), (indep(s29), consistent(s29, camber_type) ; \+indep(s29)), consistent(s30, camber_type).
evidence(all_consistent(camber_type)).
query(true_val(camber_type, medium_camber)).
query(true_val(camber_type, low_camber)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values triple_base_3bt=Triple_Base_Technology_3BT unk_construction_material_innovation=Unknown
% @importance 1.0
0.92::true_val(construction_material_innovation, triple_base_3bt); 0.08::true_val(construction_material_innovation, unk_construction_material_innovation).
0.96::acc(s1, construction_material_innovation).
measured(s1, construction_material_innovation, triple_base_3bt).
all_consistent(construction_material_innovation) :- consistent(s1, construction_material_innovation).
evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, triple_base_3bt)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr camber_description
% @type categorical
% @canonical false
% @original_name camber_description
% @values positive_camber_lifted_sidebase=Positive_camber_with_lifted_sidebase_contact_points unk_camber_description=Unknown
% @importance 1.0
0.92::true_val(camber_description, positive_camber_lifted_sidebase); 0.08::true_val(camber_description, unk_camber_description).
0.94::acc(s1, camber_description).
measured(s1, camber_description, positive_camber_lifted_sidebase).
all_consistent(camber_description) :- consistent(s1, camber_description).
evidence(all_consistent(camber_description)).
query(true_val(camber_description, positive_camber_lifted_sidebase)).
query(true_val(camber_description, unk_camber_description)).

% @attr construction_material_innovation_sidekick
% @type categorical
% @canonical false
% @original_name construction_material_innovation (SideKick)
% @values sidekick_amplified=SideKick_amplified_sidebase_uplift unk_construction_material_innovation_sidekick=Unknown
% @importance 1.0
0.92::true_val(construction_material_innovation_sidekick, sidekick_amplified); 0.08::true_val(construction_material_innovation_sidekick, unk_construction_material_innovation_sidekick).
0.94::acc(s1, construction_material_innovation_sidekick).
measured(s1, construction_material_innovation_sidekick, sidekick_amplified).
all_consistent(construction_material_innovation_sidekick) :- consistent(s1, construction_material_innovation_sidekick).
evidence(all_consistent(construction_material_innovation_sidekick)).
query(true_val(construction_material_innovation_sidekick, sidekick_amplified)).
query(true_val(construction_material_innovation_sidekick, unk_construction_material_innovation_sidekick)).

% @attr nose_sidebase_uplift
% @type categorical
% @canonical false
% @original_name Nose sidebase uplift
% @values high=High unk_nose_sidebase_uplift=Unknown
% @importance 1.0
0.92::true_val(nose_sidebase_uplift, high); 0.08::true_val(nose_sidebase_uplift, unk_nose_sidebase_uplift).
0.95::acc(s1, nose_sidebase_uplift).
measured(s1, nose_sidebase_uplift, high).
all_consistent(nose_sidebase_uplift) :- consistent(s1, nose_sidebase_uplift).
evidence(all_consistent(nose_sidebase_uplift)).
query(true_val(nose_sidebase_uplift, high)).
query(true_val(nose_sidebase_uplift, unk_nose_sidebase_uplift)).

% @attr tail_sidebase_uplift
% @type categorical
% @canonical false
% @original_name Tail sidebase uplift
% @values medium=Medium unk_tail_sidebase_uplift=Unknown
% @importance 1.0
0.92::true_val(tail_sidebase_uplift, medium); 0.08::true_val(tail_sidebase_uplift, unk_tail_sidebase_uplift).
0.95::acc(s1, tail_sidebase_uplift).
measured(s1, tail_sidebase_uplift, medium).
all_consistent(tail_sidebase_uplift) :- consistent(s1, tail_sidebase_uplift).
evidence(all_consistent(tail_sidebase_uplift)).
query(true_val(tail_sidebase_uplift, medium)).
query(true_val(tail_sidebase_uplift, unk_tail_sidebase_uplift)).

% @attr shape_3bt
% @type categorical
% @canonical false
% @original_name shape (3BT + SideKick)
% @values directional_3bt_sidekick=3BT_SideKick_directional unk_shape_3bt=Unknown
% @importance 1.0
0.92::true_val(shape_3bt, directional_3bt_sidekick); 0.08::true_val(shape_3bt, unk_shape_3bt).
0.95::acc(s1, shape_3bt).
measured(s1, shape_3bt, directional_3bt_sidekick).
all_consistent(shape_3bt) :- consistent(s1, shape_3bt).
evidence(all_consistent(shape_3bt)).
query(true_val(shape_3bt, directional_3bt_sidekick)).
query(true_val(shape_3bt, unk_shape_3bt)).

% @attr core_material_name
% @type categorical
% @canonical false
% @original_name core_material (name)
% @values ultra_light_core=Ultra_Light_Core unk_core_material_name=Unknown
% @importance 1.0
0.92::true_val(core_material_name, ultra_light_core); 0.08::true_val(core_material_name, unk_core_material_name).
0.95::acc(s1, core_material_name).
measured(s1, core_material_name, ultra_light_core).
all_consistent(core_material_name) :- consistent(s1, core_material_name).
evidence(all_consistent(core_material_name)).
query(true_val(core_material_name, ultra_light_core)).
query(true_val(core_material_name, unk_core_material_name)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values paulownia_poplar=Paulownia_and_Poplar unk_core_material=Unknown
% @importance 1.0
0.92::true_val(core_material, paulownia_poplar); 0.08::true_val(core_material, unk_core_material).
0.95::acc(s1, core_material).
measured(s1, core_material, paulownia_poplar).
all_consistent(core_material) :- consistent(s1, core_material).
evidence(all_consistent(core_material)).
query(true_val(core_material, paulownia_poplar)).
query(true_val(core_material, unk_core_material)).

% @attr core_material_blend_ratio
% @type categorical
% @canonical true
% @original_name core_material_blend_ratio
% @values ratio_70_30=70_30_Paulownia_Poplar ratio_50_50=50_50_Paulownia_Poplar
% @importance 0.675
0.65::true_val(core_material_blend_ratio, ratio_70_30); 0.35::true_val(core_material_blend_ratio, ratio_50_50).
0.94::acc(s1, core_material_blend_ratio).
0.72::acc(s32, core_material_blend_ratio).
measured(s1, core_material_blend_ratio, ratio_70_30).
measured(s32, core_material_blend_ratio, ratio_50_50).
all_consistent(core_material_blend_ratio) :- consistent(s1, core_material_blend_ratio), consistent(s32, core_material_blend_ratio).
evidence(all_consistent(core_material_blend_ratio)).
query(true_val(core_material_blend_ratio, ratio_70_30)).
query(true_val(core_material_blend_ratio, ratio_50_50)).

% @attr construction_material_innovation_airride
% @type categorical
% @canonical false
% @original_name construction_material_innovation (AirRide)
% @values airride=AirRide_vibration_damping unk_construction_material_innovation_airride=Unknown
% @importance 0.8
0.68::true_val(construction_material_innovation_airride, airride); 0.32::true_val(construction_material_innovation_airride, unk_construction_material_innovation_airride).
0.78::acc(s29, construction_material_innovation_airride).
measured(s29, construction_material_innovation_airride, airride).
all_consistent(construction_material_innovation_airride) :- consistent(s29, construction_material_innovation_airride).
evidence(all_consistent(construction_material_innovation_airride)).
query(true_val(construction_material_innovation_airride, airride)).
query(true_val(construction_material_innovation_airride, unk_construction_material_innovation_airride)).

% @attr laminate
% @type categorical
% @canonical false
% @original_name laminate
% @values tri_ax=Tri_Ax_Lamination unk_laminate=Unknown
% @importance 1.0
0.92::true_val(laminate, tri_ax); 0.08::true_val(laminate, unk_laminate).
0.95::acc(s1, laminate).
measured(s1, laminate, tri_ax).
all_consistent(laminate) :- consistent(s1, laminate).
evidence(all_consistent(laminate)).
query(true_val(laminate, tri_ax)).
query(true_val(laminate, unk_laminate)).

% @attr construction_material_innovation_carbon_stringers
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Carbon Stringers)
% @values carbon_stringers=Carbon_Stringers unk_construction_material_innovation_carbon_stringers=Unknown
% @importance 1.0
0.92::true_val(construction_material_innovation_carbon_stringers, carbon_stringers); 0.08::true_val(construction_material_innovation_carbon_stringers, unk_construction_material_innovation_carbon_stringers).
0.95::acc(s1, construction_material_innovation_carbon_stringers).
measured(s1, construction_material_innovation_carbon_stringers, carbon_stringers).
all_consistent(construction_material_innovation_carbon_stringers) :- consistent(s1, construction_material_innovation_carbon_stringers).
evidence(all_consistent(construction_material_innovation_carbon_stringers)).
query(true_val(construction_material_innovation_carbon_stringers, carbon_stringers)).
query(true_val(construction_material_innovation_carbon_stringers, unk_construction_material_innovation_carbon_stringers)).

% @attr construction_material_innovation_supertubes
% @type categorical
% @canonical false
% @original_name construction_material_innovation (SuperTubes)
% @values dst_supertubes=DST_SuperTubes_hollow_carbon_cylinders drst_six_tubes=DRST_SuperTubes_six_tubes
% @importance 0.83
0.50::true_val(construction_material_innovation_supertubes, dst_supertubes); 0.50::true_val(construction_material_innovation_supertubes, drst_six_tubes).
0.93::acc(s1, construction_material_innovation_supertubes).
0.75::acc(s14, construction_material_innovation_supertubes).
measured(s1, construction_material_innovation_supertubes, dst_supertubes).
measured(s14, construction_material_innovation_supertubes, drst_six_tubes).
all_consistent(construction_material_innovation_supertubes) :- consistent(s1, construction_material_innovation_supertubes), (indep(s14), consistent(s14, construction_material_innovation_supertubes) ; \+indep(s14)).
evidence(all_consistent(construction_material_innovation_supertubes)).
query(true_val(construction_material_innovation_supertubes, dst_supertubes)).
query(true_val(construction_material_innovation_supertubes, drst_six_tubes)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values flex_walls=Flex_Walls_urethane_poured unk_sidewall_material=Unknown
% @importance 1.0
0.92::true_val(sidewall_material, flex_walls); 0.08::true_val(sidewall_material, unk_sidewall_material).
0.95::acc(s1, sidewall_material).
measured(s1, sidewall_material, flex_walls).
all_consistent(sidewall_material) :- consistent(s1, sidewall_material).
evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, flex_walls)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr sidewall_function
% @type categorical
% @canonical false
% @original_name Sidewall function
% @values shock_absorption_chatter_reduction=Shock_absorption_chatter_reduction_flexibility_impact_resistance unk_sidewall_function=Unknown
% @importance 1.0
0.92::true_val(sidewall_function, shock_absorption_chatter_reduction); 0.08::true_val(sidewall_function, unk_sidewall_function).
0.93::acc(s1, sidewall_function).
measured(s1, sidewall_function, shock_absorption_chatter_reduction).
all_consistent(sidewall_function) :- consistent(s1, sidewall_function).
evidence(all_consistent(sidewall_function)).
query(true_val(sidewall_function, shock_absorption_chatter_reduction)).
query(true_val(sidewall_function, unk_sidewall_function)).

% @attr insert_material
% @type categorical
% @canonical false
% @original_name Insert material
% @values german_stainless_steel=A_grade_German_stainless_steel unk_insert_material=Unknown
% @importance 1.0
0.92::true_val(insert_material, german_stainless_steel); 0.08::true_val(insert_material, unk_insert_material).
0.95::acc(s1, insert_material).
measured(s1, insert_material, german_stainless_steel).
all_consistent(insert_material) :- consistent(s1, insert_material).
evidence(all_consistent(insert_material)).
query(true_val(insert_material, german_stainless_steel)).
query(true_val(insert_material, unk_insert_material)).

% @attr insert_count
% @type numeric
% @canonical false
% @original_name Insert count
% @values v24=24
% @unit per_board
% @values v24=24 unk_insert_count=Unknown
% @importance 1.0
0.92::true_val(insert_count, v24); 0.08::true_val(insert_count, unk_insert_count).
0.95::acc(s1, insert_count).
measured(s1, insert_count, v24).
all_consistent(insert_count) :- consistent(s1, insert_count).
evidence(all_consistent(insert_count)).
query(true_val(insert_count, v24)).
query(true_val(insert_count, unk_insert_count)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_inserts unk_mounting_pattern=Unknown
% @importance 0.8
0.64::true_val(mounting_pattern, inserts_2x4); 0.36::true_val(mounting_pattern, unk_mounting_pattern).
0.78::acc(s14, mounting_pattern).
measured(s14, mounting_pattern, inserts_2x4).
all_consistent(mounting_pattern) :- consistent(s14, mounting_pattern).
evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr topsheet
% @type categorical
% @canonical true
% @original_name topsheet
% @values step_down_rails_top_3d=Step_Down_Rails_Top_3D unk_topsheet=Unknown
% @importance 1.0
0.92::true_val(topsheet, step_down_rails_top_3d); 0.08::true_val(topsheet, unk_topsheet).
0.95::acc(s1, topsheet).
measured(s1, topsheet, step_down_rails_top_3d).
all_consistent(topsheet) :- consistent(s1, topsheet).
evidence(all_consistent(topsheet)).
query(true_val(topsheet, step_down_rails_top_3d)).
query(true_val(topsheet, unk_topsheet)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values ultra_glide_s_7000=Ultra_Glide_S_7000_grade_sintered unk_base_material=Unknown
% @importance 1.0
0.92::true_val(base_material, ultra_glide_s_7000); 0.08::true_val(base_material, unk_base_material).
0.95::acc(s1, base_material).
measured(s1, base_material, ultra_glide_s_7000).
all_consistent(base_material) :- consistent(s1, base_material).
evidence(all_consistent(base_material)).
query(true_val(base_material, ultra_glide_s_7000)).
query(true_val(base_material, unk_base_material)).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values sintered_premium=Sintered_high_end_premium unk_base_type=Unknown
% @importance 1.0
0.92::true_val(base_type, sintered_premium); 0.08::true_val(base_type, unk_base_type).
0.95::acc(s1, base_type).
measured(s1, base_type, sintered_premium).
all_consistent(base_type) :- consistent(s1, base_type).
evidence(all_consistent(base_type)).
query(true_val(base_type, sintered_premium)).
query(true_val(base_type, unk_base_type)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values ten_sizes=144N_148N_152N_154_156_158_161_156W_159W_162W unk_available_sizes=Unknown
% @importance 1.0
0.92::true_val(available_sizes, ten_sizes); 0.08::true_val(available_sizes, unk_available_sizes).
0.95::acc(s1, available_sizes).
measured(s1, available_sizes, ten_sizes).
all_consistent(available_sizes) :- consistent(s1, available_sizes).
evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, ten_sizes)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values narrow_standard_wide=Narrow_N_Standard_Wide_W unk_width_options=Unknown
% @importance 1.0
0.92::true_val(width_options, narrow_standard_wide); 0.08::true_val(width_options, unk_width_options).
0.95::acc(s1, width_options).
measured(s1, width_options, narrow_standard_wide).
all_consistent(width_options) :- consistent(s1, width_options).
evidence(all_consistent(width_options)).
query(true_val(width_options, narrow_standard_wide)).
query(true_val(width_options, unk_width_options)).

% @attr wide_sizing_guidance
% @type categorical
% @canonical false
% @original_name Wide sizing guidance
% @values us11_uk10_eur44_plus=US11_UK10_EUR44_or_above unk_wide_sizing_guidance=Unknown
% @importance 0.65
0.81::true_val(wide_sizing_guidance, us11_uk10_eur44_plus); 0.19::true_val(wide_sizing_guidance, unk_wide_sizing_guidance).
0.90::acc(s33, wide_sizing_guidance).
measured(s33, wide_sizing_guidance, us11_uk10_eur44_plus).
all_consistent(wide_sizing_guidance) :- consistent(s33, wide_sizing_guidance).
evidence(all_consistent(wide_sizing_guidance)).
query(true_val(wide_sizing_guidance, us11_uk10_eur44_plus)).
query(true_val(wide_sizing_guidance, unk_wide_sizing_guidance)).

% @attr effective_edge_156
% @type numeric
% @canonical false
% @original_name Effective edge (156cm)
% @unit cm
% @values v117_0=117.0 unk_effective_edge_156=Unknown
% @importance 1.0
0.92::true_val(effective_edge_156, v117_0); 0.08::true_val(effective_edge_156, unk_effective_edge_156).
0.93::acc(s1, effective_edge_156).
measured(s1, effective_edge_156, v117_0).
all_consistent(effective_edge_156) :- consistent(s1, effective_edge_156).
evidence(all_consistent(effective_edge_156)).
query(true_val(effective_edge_156, v117_0)).
query(true_val(effective_edge_156, unk_effective_edge_156)).

% @attr waist_width_156
% @type numeric
% @canonical false
% @original_name Waist width (156cm)
% @unit cm
% @values v25_6=25.6 unk_waist_width_156=Unknown
% @importance 1.0
0.92::true_val(waist_width_156, v25_6); 0.08::true_val(waist_width_156, unk_waist_width_156).
0.93::acc(s1, waist_width_156).
measured(s1, waist_width_156, v25_6).
all_consistent(waist_width_156) :- consistent(s1, waist_width_156).
evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v25_6)).
query(true_val(waist_width_156, unk_waist_width_156)).

% @attr tip_tail_width_size
% @type categorical
% @canonical true
% @original_name tip_tail_width_size
% @unit cm
% @values v30_1_29_6=30.1/29.6 unk_tip_tail_width_size=Unknown
% @importance 1.0
0.92::true_val(tip_tail_width_size, v30_1_29_6); 0.08::true_val(tip_tail_width_size, unk_tip_tail_width_size).
0.93::acc(s1, tip_tail_width_size).
measured(s1, tip_tail_width_size, v30_1_29_6).
all_consistent(tip_tail_width_size) :- consistent(s1, tip_tail_width_size).
evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v30_1_29_6)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr sidecut_radius_size
% @type numeric
% @canonical true
% @original_name sidecut_radius_size
% @unit m
% @values v7_5=7.5 unk_sidecut_radius_size=Unknown
% @importance 1.0
0.92::true_val(sidecut_radius_size, v7_5); 0.08::true_val(sidecut_radius_size, unk_sidecut_radius_size).
0.93::acc(s1, sidecut_radius_size).
measured(s1, sidecut_radius_size, v7_5).
all_consistent(sidecut_radius_size) :- consistent(s1, sidecut_radius_size).
evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_5)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr stance_width_range_size
% @type categorical
% @canonical true
% @original_name stance_width_range_size
% @unit cm
% @values v51_0_63_0=51.0-63.0 unk_stance_width_range_size=Unknown
% @importance 1.0
0.92::true_val(stance_width_range_size, v51_0_63_0); 0.08::true_val(stance_width_range_size, unk_stance_width_range_size).
0.93::acc(s1, stance_width_range_size).
measured(s1, stance_width_range_size, v51_0_63_0).
all_consistent(stance_width_range_size) :- consistent(s1, stance_width_range_size).
evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v51_0_63_0)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size
% @unit kg
% @values v68_88=68-88kg unk_recommended_weight_range_size=Unknown
% @importance 1.0
0.92::true_val(recommended_weight_range_size, v68_88); 0.08::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).
0.93::acc(s1, recommended_weight_range_size).
measured(s1, recommended_weight_range_size, v68_88).
all_consistent(recommended_weight_range_size) :- consistent(s1, recommended_weight_range_size).
evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, v68_88)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr boot_size_156
% @type categorical
% @canonical false
% @original_name Boot size (156cm)
% @values eu39_44_us7_10=EU39_44_US7_10 unk_boot_size_156=Unknown
% @importance 1.0
0.92::true_val(boot_size_156, eu39_44_us7_10); 0.08::true_val(boot_size_156, unk_boot_size_156).
0.93::acc(s1, boot_size_156).
measured(s1, boot_size_156, eu39_44_us7_10).
all_consistent(boot_size_156) :- consistent(s1, boot_size_156).
evidence(all_consistent(boot_size_156)).
query(true_val(boot_size_156, eu39_44_us7_10)).
query(true_val(boot_size_156, unk_boot_size_156)).

% @attr effective_edge_156w
% @type numeric
% @canonical false
% @original_name Effective edge (156W)
% @unit cm
% @values v117_0=117.0 unk_effective_edge_156w=Unknown
% @importance 1.0
0.92::true_val(effective_edge_156w, v117_0); 0.08::true_val(effective_edge_156w, unk_effective_edge_156w).
0.93::acc(s1, effective_edge_156w).
measured(s1, effective_edge_156w, v117_0).
all_consistent(effective_edge_156w) :- consistent(s1, effective_edge_156w).
evidence(all_consistent(effective_edge_156w)).
query(true_val(effective_edge_156w, v117_0)).
query(true_val(effective_edge_156w, unk_effective_edge_156w)).

% @attr waist_width_156w
% @type numeric
% @canonical false
% @original_name Waist width (156W)
% @unit cm
% @values v26_6=26.6 unk_waist_width_156w=Unknown
% @importance 1.0
0.92::true_val(waist_width_156w, v26_6); 0.08::true_val(waist_width_156w, unk_waist_width_156w).
0.93::acc(s1, waist_width_156w).
measured(s1, waist_width_156w, v26_6).
all_consistent(waist_width_156w) :- consistent(s1, waist_width_156w).
evidence(all_consistent(waist_width_156w)).
query(true_val(waist_width_156w, v26_6)).
query(true_val(waist_width_156w, unk_waist_width_156w)).

% @attr tip_tail_width_size_156w
% @type categorical
% @canonical false
% @original_name tip_tail_width_size (156W)
% @unit cm
% @values v31_1_30_6=31.1/30.6 unk_tip_tail_width_size_156w=Unknown
% @importance 1.0
0.92::true_val(tip_tail_width_size_156w, v31_1_30_6); 0.08::true_val(tip_tail_width_size_156w, unk_tip_tail_width_size_156w).
0.93::acc(s1, tip_tail_width_size_156w).
measured(s1, tip_tail_width_size_156w, v31_1_30_6).
all_consistent(tip_tail_width_size_156w) :- consistent(s1, tip_tail_width_size_156w).
evidence(all_consistent(tip_tail_width_size_156w)).
query(true_val(tip_tail_width_size_156w, v31_1_30_6)).
query(true_val(tip_tail_width_size_156w, unk_tip_tail_width_size_156w)).

% @attr sidecut_radius_size_156w
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (156W)
% @unit m
% @values v7_5=7.5 unk_sidecut_radius_size_156w=Unknown
% @importance 1.0
0.92::true_val(sidecut_radius_size_156w, v7_5); 0.08::true_val(sidecut_radius_size_156w, unk_sidecut_radius_size_156w).
0.93::acc(s1, sidecut_radius_size_156w).
measured(s1, sidecut_radius_size_156w, v7_5).
all_consistent(sidecut_radius_size_156w) :- consistent(s1, sidecut_radius_size_156w).
evidence(all_consistent(sidecut_radius_size_156w)).
query(true_val(sidecut_radius_size_156w, v7_5)).
query(true_val(sidecut_radius_size_156w, unk_sidecut_radius_size_156w)).

% @attr stance_width_range_size_156w
% @type categorical
% @canonical false
% @original_name stance_width_range_size (156W)
% @unit cm
% @values v51_0_63_0=51.0-63.0 unk_stance_width_range_size_156w=Unknown
% @importance 1.0
0.92::true_val(stance_width_range_size_156w, v51_0_63_0); 0.08::true_val(stance_width_range_size_156w, unk_stance_width_range_size_156w).
0.93::acc(s1, stance_width_range_size_156w).
measured(s1, stance_width_range_size_156w, v51_0_63_0).
all_consistent(stance_width_range_size_156w) :- consistent(s1, stance_width_range_size_156w).
evidence(all_consistent(stance_width_range_size_156w)).
query(true_val(stance_width_range_size_156w, v51_0_63_0)).
query(true_val(stance_width_range_size_156w, unk_stance_width_range_size_156w)).

% @attr recommended_weight_range_size_156w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (156W)
% @unit kg
% @values v68_88=68-88kg unk_recommended_weight_range_size_156w=Unknown
% @importance 1.0
0.92::true_val(recommended_weight_range_size_156w, v68_88); 0.08::true_val(recommended_weight_range_size_156w, unk_recommended_weight_range_size_156w).
0.93::acc(s1, recommended_weight_range_size_156w).
measured(s1, recommended_weight_range_size_156w, v68_88).
all_consistent(recommended_weight_range_size_156w) :- consistent(s1, recommended_weight_range_size_156w).
evidence(all_consistent(recommended_weight_range_size_156w)).
query(true_val(recommended_weight_range_size_156w, v68_88)).
query(true_val(recommended_weight_range_size_156w, unk_recommended_weight_range_size_156w)).

% @attr boot_size_156w
% @type categorical
% @canonical false
% @original_name Boot size (156W)
% @values eu42_47_us9_12=EU42_47_US9_12 unk_boot_size_156w=Unknown
% @importance 1.0
0.92::true_val(boot_size_156w, eu42_47_us9_12); 0.08::true_val(boot_size_156w, unk_boot_size_156w).
0.93::acc(s1, boot_size_156w).
measured(s1, boot_size_156w, eu42_47_us9_12).
all_consistent(boot_size_156w) :- consistent(s1, boot_size_156w).
evidence(all_consistent(boot_size_156w)).
query(true_val(boot_size_156w, eu42_47_us9_12)).
query(true_val(boot_size_156w, unk_boot_size_156w)).

% @attr effective_edge_159w
% @type numeric
% @canonical false
% @original_name Effective edge (159W)
% @unit cm
% @values v119_6=119.6 unk_effective_edge_159w=Unknown
% @importance 1.0
0.92::true_val(effective_edge_159w, v119_6); 0.08::true_val(effective_edge_159w, unk_effective_edge_159w).
0.93::acc(s1, effective_edge_159w).
measured(s1, effective_edge_159w, v119_6).
all_consistent(effective_edge_159w) :- consistent(s1, effective_edge_159w).
evidence(all_consistent(effective_edge_159w)).
query(true_val(effective_edge_159w, v119_6)).
query(true_val(effective_edge_159w, unk_effective_edge_159w)).

% @attr waist_width_159w
% @type numeric
% @canonical false
% @original_name Waist width (159W)
% @unit cm
% @values v26_9=26.9 unk_waist_width_159w=Unknown
% @importance 1.0
0.92::true_val(waist_width_159w, v26_9); 0.08::true_val(waist_width_159w, unk_waist_width_159w).
0.93::acc(s1, waist_width_159w).
measured(s1, waist_width_159w, v26_9).
all_consistent(waist_width_159w) :- consistent(s1, waist_width_159w).
evidence(all_consistent(waist_width_159w)).
query(true_val(waist_width_159w, v26_9)).
query(true_val(waist_width_159w, unk_waist_width_159w)).

% @attr tip_tail_width_size_159w
% @type categorical
% @canonical false
% @original_name tip_tail_width_size (159W)
% @unit cm
% @values v31_6_31_0=31.6/31.0 unk_tip_tail_width_size_159w=Unknown
% @importance 1.0
0.92::true_val(tip_tail_width_size_159w, v31_6_31_0); 0.08::true_val(tip_tail_width_size_159w, unk_tip_tail_width_size_159w).
0.93::acc(s1, tip_tail_width_size_159w).
measured(s1, tip_tail_width_size_159w, v31_6_31_0).
all_consistent(tip_tail_width_size_159w) :- consistent(s1, tip_tail_width_size_159w).
evidence(all_consistent(tip_tail_width_size_159w)).
query(true_val(tip_tail_width_size_159w, v31_6_31_0)).
query(true_val(tip_tail_width_size_159w, unk_tip_tail_width_size_159w)).

% @attr sidecut_radius_size_159w
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (159W)
% @unit m
% @values v7_59=7.59 unk_sidecut_radius_size_159w=Unknown
% @importance 1.0
0.92::true_val(sidecut_radius_size_159w, v7_59); 0.08::true_val(sidecut_radius_size_159w, unk_sidecut_radius_size_159w).
0.93::acc(s1, sidecut_radius_size_159w).
measured(s1, sidecut_radius_size_159w, v7_59).
all_consistent(sidecut_radius_size_159w) :- consistent(s1, sidecut_radius_size_159w).
evidence(all_consistent(sidecut_radius_size_159w)).
query(true_val(sidecut_radius_size_159w, v7_59)).
query(true_val(sidecut_radius_size_159w, unk_sidecut_radius_size_159w)).

% @attr stance_width_range_size_159w
% @type categorical
% @canonical false
% @original_name stance_width_range_size (159W)
% @unit cm
% @values v52_0_64_0=52.0-64.0 unk_stance_width_range_size_159w=Unknown
% @importance 1.0
0.92::true_val(stance_width_range_size_159w, v52_0_64_0); 0.08::true_val(stance_width_range_size_159w, unk_stance_width_range_size_159w).
0.93::acc(s1, stance_width_range_size_159w).
measured(s1, stance_width_range_size_159w, v52_0_64_0).
all_consistent(stance_width_range_size_159w) :- consistent(s1, stance_width_range_size_159w).
evidence(all_consistent(stance_width_range_size_159w)).
query(true_val(stance_width_range_size_159w, v52_0_64_0)).
query(true_val(stance_width_range_size_159w, unk_stance_width_range_size_159w)).

% @attr recommended_weight_range_size_159w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (159W)
% @unit kg
% @values v76_96=76-96kg unk_recommended_weight_range_size_159w=Unknown
% @importance 1.0
0.92::true_val(recommended_weight_range_size_159w, v76_96); 0.08::true_val(recommended_weight_range_size_159w, unk_recommended_weight_range_size_159w).
0.93::acc(s1, recommended_weight_range_size_159w).
measured(s1, recommended_weight_range_size_159w, v76_96).
all_consistent(recommended_weight_range_size_159w) :- consistent(s1, recommended_weight_range_size_159w).
evidence(all_consistent(recommended_weight_range_size_159w)).
query(true_val(recommended_weight_range_size_159w, v76_96)).
query(true_val(recommended_weight_range_size_159w, unk_recommended_weight_range_size_159w)).

% @attr effective_edge_162w
% @type numeric
% @canonical false
% @original_name Effective edge (162W)
% @unit cm
% @values v122_1=122.1 unk_effective_edge_162w=Unknown
% @importance 1.0
0.92::true_val(effective_edge_162w, v122_1); 0.08::true_val(effective_edge_162w, unk_effective_edge_162w).
0.93::acc(s1, effective_edge_162w).
measured(s1, effective_edge_162w, v122_1).
all_consistent(effective_edge_162w) :- consistent(s1, effective_edge_162w).
evidence(all_consistent(effective_edge_162w)).
query(true_val(effective_edge_162w, v122_1)).
query(true_val(effective_edge_162w, unk_effective_edge_162w)).

% @attr waist_width_162w
% @type numeric
% @canonical false
% @original_name Waist width (162W)
% @unit cm
% @values v27_2=27.2 unk_waist_width_162w=Unknown
% @importance 1.0
0.92::true_val(waist_width_162w, v27_2); 0.08::true_val(waist_width_162w, unk_waist_width_162w).
0.93::acc(s1, waist_width_162w).
measured(s1, waist_width_162w, v27_2).
all_consistent(waist_width_162w) :- consistent(s1, waist_width_162w).
evidence(all_consistent(waist_width_162w)).
query(true_val(waist_width_162w, v27_2)).
query(true_val(waist_width_162w, unk_waist_width_162w)).

% @attr tip_tail_width_size_162w
% @type categorical
% @canonical false
% @original_name tip_tail_width_size (162W)
% @unit cm
% @values v32_0_31_4=32.0/31.4 unk_tip_tail_width_size_162w=Unknown
% @importance 1.0
0.92::true_val(tip_tail_width_size_162w, v32_0_31_4); 0.08::true_val(tip_tail_width_size_162w, unk_tip_tail_width_size_162w).
0.93::acc(s1, tip_tail_width_size_162w).
measured(s1, tip_tail_width_size_162w, v32_0_31_4).
all_consistent(tip_tail_width_size_162w) :- consistent(s1, tip_tail_width_size_162w).
evidence(all_consistent(tip_tail_width_size_162w)).
query(true_val(tip_tail_width_size_162w, v32_0_31_4)).
query(true_val(tip_tail_width_size_162w, unk_tip_tail_width_size_162w)).

% @attr sidecut_radius_size_162w
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (162W)
% @unit m
% @values v7_68=7.68 unk_sidecut_radius_size_162w=Unknown
% @importance 1.0
0.92::true_val(sidecut_radius_size_162w, v7_68); 0.08::true_val(sidecut_radius_size_162w, unk_sidecut_radius_size_162w).
0.93::acc(s1, sidecut_radius_size_162w).
measured(s1, sidecut_radius_size_162w, v7_68).
all_consistent(sidecut_radius_size_162w) :- consistent(s1, sidecut_radius_size_162w).
evidence(all_consistent(sidecut_radius_size_162w)).
query(true_val(sidecut_radius_size_162w, v7_68)).
query(true_val(sidecut_radius_size_162w, unk_sidecut_radius_size_162w)).

% @attr stance_width_range_size_162w
% @type categorical
% @canonical false
% @original_name stance_width_range_size (162W)
% @unit cm
% @values v53_0_65_0=53.0-65.0 unk_stance_width_range_size_162w=Unknown
% @importance 1.0
0.92::true_val(stance_width_range_size_162w, v53_0_65_0); 0.08::true_val(stance_width_range_size_162w, unk_stance_width_range_size_162w).
0.93::acc(s1, stance_width_range_size_162w).
measured(s1, stance_width_range_size_162w, v53_0_65_0).
all_consistent(stance_width_range_size_162w) :- consistent(s1, stance_width_range_size_162w).
evidence(all_consistent(stance_width_range_size_162w)).
query(true_val(stance_width_range_size_162w, v53_0_65_0)).
query(true_val(stance_width_range_size_162w, unk_stance_width_range_size_162w)).

% @attr recommended_weight_range_size_162w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (162W)
% @unit kg
% @values v82_102=82-102kg unk_recommended_weight_range_size_162w=Unknown
% @importance 1.0
0.92::true_val(recommended_weight_range_size_162w, v82_102); 0.08::true_val(recommended_weight_range_size_162w, unk_recommended_weight_range_size_162w).
0.93::acc(s1, recommended_weight_range_size_162w).
measured(s1, recommended_weight_range_size_162w, v82_102).
all_consistent(recommended_weight_range_size_162w) :- consistent(s1, recommended_weight_range_size_162w).
evidence(all_consistent(recommended_weight_range_size_162w)).
query(true_val(recommended_weight_range_size_162w, v82_102)).
query(true_val(recommended_weight_range_size_162w, unk_recommended_weight_range_size_162w)).

% @attr effective_edge_144n
% @type numeric
% @canonical false
% @original_name Effective edge (144N)
% @unit cm
% @values v106_8=106.8 unk_effective_edge_144n=Unknown
% @importance 1.0
0.92::true_val(effective_edge_144n, v106_8); 0.08::true_val(effective_edge_144n, unk_effective_edge_144n).
0.93::acc(s1, effective_edge_144n).
measured(s1, effective_edge_144n, v106_8).
all_consistent(effective_edge_144n) :- consistent(s1, effective_edge_144n).
evidence(all_consistent(effective_edge_144n)).
query(true_val(effective_edge_144n, v106_8)).
query(true_val(effective_edge_144n, unk_effective_edge_144n)).

% @attr waist_width_144n
% @type numeric
% @canonical false
% @original_name Waist width (144N)
% @unit cm
% @values v23_9=23.9 unk_waist_width_144n=Unknown
% @importance 1.0
0.92::true_val(waist_width_144n, v23_9); 0.08::true_val(waist_width_144n, unk_waist_width_144n).
0.93::acc(s1, waist_width_144n).
measured(s1, waist_width_144n, v23_9).
all_consistent(waist_width_144n) :- consistent(s1, waist_width_144n).
evidence(all_consistent(waist_width_144n)).
query(true_val(waist_width_144n, v23_9)).
query(true_val(waist_width_144n, unk_waist_width_144n)).

% @attr recommended_weight_range_size_144n
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (144N)
% @unit kg
% @values v42_62=42-62kg unk_recommended_weight_range_size_144n=Unknown
% @importance 1.0
0.92::true_val(recommended_weight_range_size_144n, v42_62); 0.08::true_val(recommended_weight_range_size_144n, unk_recommended_weight_range_size_144n).
0.93::acc(s1, recommended_weight_range_size_144n).
measured(s1, recommended_weight_range_size_144n, v42_62).
all_consistent(recommended_weight_range_size_144n) :- consistent(s1, recommended_weight_range_size_144n).
evidence(all_consistent(recommended_weight_range_size_144n)).
query(true_val(recommended_weight_range_size_144n, v42_62)).
query(true_val(recommended_weight_range_size_144n, unk_recommended_weight_range_size_144n)).

% @attr effective_edge_148n
% @type numeric
% @canonical false
% @original_name Effective edge (148N)
% @unit cm
% @values v110_2=110.2 unk_effective_edge_148n=Unknown
% @importance 1.0
0.92::true_val(effective_edge_148n, v110_2); 0.08::true_val(effective_edge_148n, unk_effective_edge_148n).
0.93::acc(s1, effective_edge_148n).
measured(s1, effective_edge_148n, v110_2).
all_consistent(effective_edge_148n) :- consistent(s1, effective_edge_148n).
evidence(all_consistent(effective_edge_148n)).
query(true_val(effective_edge_148n, v110_2)).
query(true_val(effective_edge_148n, unk_effective_edge_148n)).

% @attr waist_width_148n
% @type numeric
% @canonical false
% @original_name Waist width (148N)
% @unit cm
% @values v24_3=24.3 unk_waist_width_148n=Unknown
% @importance 1.0
0.92::true_val(waist_width_148n, v24_3); 0.08::true_val(waist_width_148n, unk_waist_width_148n).
0.93::acc(s1, waist_width_148n).
measured(s1, waist_width_148n, v24_3).
all_consistent(waist_width_148n) :- consistent(s1, waist_width_148n).
evidence(all_consistent(waist_width_148n)).
query(true_val(waist_width_148n, v24_3)).
query(true_val(waist_width_148n, unk_waist_width_148n)).

% @attr recommended_weight_range_size_148n
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (148N)
% @unit kg
% @values v46_66=46-66kg unk_recommended_weight_range_size_148n=Unknown
% @importance 1.0
0.92::true_val(recommended_weight_range_size_148n, v46_66); 0.08::true_val(recommended_weight_range_size_148n, unk_recommended_weight_range_size_148n).
0.93::acc(s1, recommended_weight_range_size_148n).
measured(s1, recommended_weight_range_size_148n, v46_66).
all_consistent(recommended_weight_range_size_148n) :- consistent(s1, recommended_weight_range_size_148n).
evidence(all_consistent(recommended_weight_range_size_148n)).
query(true_val(recommended_weight_range_size_148n, v46_66)).
query(true_val(recommended_weight_range_size_148n, unk_recommended_weight_range_size_148n)).

% @attr effective_edge_152n
% @type numeric
% @canonical false
% @original_name Effective edge (152N)
% @unit cm
% @values v113_6=113.6 unk_effective_edge_152n=Unknown
% @importance 1.0
0.92::true_val(effective_edge_152n, v113_6); 0.08::true_val(effective_edge_152n, unk_effective_edge_152n).
0.93::acc(s1, effective_edge_152n).
measured(s1, effective_edge_152n, v113_6).
all_consistent(effective_edge_152n) :- consistent(s1, effective_edge_152n).
evidence(all_consistent(effective_edge_152n)).
query(true_val(effective_edge_152n, v113_6)).
query(true_val(effective_edge_152n, unk_effective_edge_152n)).

% @attr waist_width_152n
% @type numeric
% @canonical false
% @original_name Waist width (152N)
% @unit cm
% @values v24_7=24.7 unk_waist_width_152n=Unknown
% @importance 1.0
0.92::true_val(waist_width_152n, v24_7); 0.08::true_val(waist_width_152n, unk_waist_width_152n).
0.93::acc(s1, waist_width_152n).
measured(s1, waist_width_152n, v24_7).
all_consistent(waist_width_152n) :- consistent(s1, waist_width_152n).
evidence(all_consistent(waist_width_152n)).
query(true_val(waist_width_152n, v24_7)).
query(true_val(waist_width_152n, unk_waist_width_152n)).

% @attr recommended_weight_range_size_152n
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (152N)
% @unit kg
% @values v54_74=54-74kg unk_recommended_weight_range_size_152n=Unknown
% @importance 1.0
0.92::true_val(recommended_weight_range_size_152n, v54_74); 0.08::true_val(recommended_weight_range_size_152n, unk_recommended_weight_range_size_152n).
0.93::acc(s1, recommended_weight_range_size_152n).
measured(s1, recommended_weight_range_size_152n, v54_74).
all_consistent(recommended_weight_range_size_152n) :- consistent(s1, recommended_weight_range_size_152n).
evidence(all_consistent(recommended_weight_range_size_152n)).
query(true_val(recommended_weight_range_size_152n, v54_74)).
query(true_val(recommended_weight_range_size_152n, unk_recommended_weight_range_size_152n)).

% @attr effective_edge_154
% @type numeric
% @canonical false
% @original_name Effective edge (154)
% @unit cm
% @values v115_3=115.3 unk_effective_edge_154=Unknown
% @importance 1.0
0.92::true_val(effective_edge_154, v115_3); 0.08::true_val(effective_edge_154, unk_effective_edge_154).
0.93::acc(s1, effective_edge_154).
measured(s1, effective_edge_154, v115_3).
all_consistent(effective_edge_154) :- consistent(s1, effective_edge_154).
evidence(all_consistent(effective_edge_154)).
query(true_val(effective_edge_154, v115_3)).
query(true_val(effective_edge_154, unk_effective_edge_154)).

% @attr waist_width_154
% @type numeric
% @canonical false
% @original_name Waist width (154)
% @unit cm
% @values v25_4=25.4 unk_waist_width_154=Unknown
% @importance 1.0
0.92::true_val(waist_width_154, v25_4); 0.08::true_val(waist_width_154, unk_waist_width_154).
0.93::acc(s1, waist_width_154).
measured(s1, waist_width_154, v25_4).
all_consistent(waist_width_154) :- consistent(s1, waist_width_154).
evidence(all_consistent(waist_width_154)).
query(true_val(waist_width_154, v25_4)).
query(true_val(waist_width_154, unk_waist_width_154)).

% @attr recommended_weight_range_size_154
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (154)
% @unit kg
% @values v63_83=63-83kg unk_recommended_weight_range_size_154=Unknown
% @importance 1.0
0.92::true_val(recommended_weight_range_size_154, v63_83); 0.08::true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154).
0.93::acc(s1, recommended_weight_range_size_154).
measured(s1, recommended_weight_range_size_154, v63_83).
all_consistent(recommended_weight_range_size_154) :- consistent(s1, recommended_weight_range_size_154).
evidence(all_consistent(recommended_weight_range_size_154)).
query(true_val(recommended_weight_range_size_154, v63_83)).
query(true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154)).

% @attr effective_edge_158
% @type numeric
% @canonical false
% @original_name Effective edge (158)
% @unit cm
% @values v118_7=118.7 unk_effective_edge_158=Unknown
% @importance 1.0
0.92::true_val(effective_edge_158, v118_7); 0.08::true_val(effective_edge_158, unk_effective_edge_158).
0.93::acc(s1, effective_edge_158).
measured(s1, effective_edge_158, v118_7).
all_consistent(effective_edge_158) :- consistent(s1, effective_edge_158).
evidence(all_consistent(effective_edge_158)).
query(true_val(effective_edge_158, v118_7)).
query(true_val(effective_edge_158, unk_effective_edge_158)).

% @attr waist_width_158
% @type numeric
% @canonical false
% @original_name Waist width (158)
% @unit cm
% @values v25_8=25.8 unk_waist_width_158=Unknown
% @importance 1.0
0.92::true_val(waist_width_158, v25_8); 0.08::true_val(waist_width_158, unk_waist_width_158).
0.93::acc(s1, waist_width_158).
measured(s1, waist_width_158, v25_8).
all_consistent(waist_width_158) :- consistent(s1, waist_width_158).
evidence(all_consistent(waist_width_158)).
query(true_val(waist_width_158, v25_8)).
query(true_val(waist_width_158, unk_waist_width_158)).

% @attr recommended_weight_range_size_158
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (158)
% @unit kg
% @values v72_92=72-92kg unk_recommended_weight_range_size_158=Unknown
% @importance 1.0
0.92::true_val(recommended_weight_range_size_158, v72_92); 0.08::true_val(recommended_weight_range_size_158, unk_recommended_weight_range_size_158).
0.93::acc(s1, recommended_weight_range_size_158).
measured(s1, recommended_weight_range_size_158, v72_92).
all_consistent(recommended_weight_range_size_158) :- consistent(s1, recommended_weight_range_size_158).
evidence(all_consistent(recommended_weight_range_size_158)).
query(true_val(recommended_weight_range_size_158, v72_92)).
query(true_val(recommended_weight_range_size_158, unk_recommended_weight_range_size_158)).

% @attr effective_edge_161
% @type numeric
% @canonical false
% @original_name Effective edge (161)
% @unit cm
% @values v121_3=121.3 unk_effective_edge_161=Unknown
% @importance 1.0
0.92::true_val(effective_edge_161, v121_3); 0.08::true_val(effective_edge_161, unk_effective_edge_161).
0.93::acc(s1, effective_edge_161).
measured(s1, effective_edge_161, v121_3).
all_consistent(effective_edge_161) :- consistent(s1, effective_edge_161).
evidence(all_consistent(effective_edge_161)).
query(true_val(effective_edge_161, v121_3)).
query(true_val(effective_edge_161, unk_effective_edge_161)).

% @attr waist_width_161
% @type numeric
% @canonical false
% @original_name Waist width (161)
% @unit cm
% @values v26_1=26.1 unk_waist_width_161=Unknown
% @importance 1.0
0.92::true_val(waist_width_161, v26_1); 0.08::true_val(waist_width_161, unk_waist_width_161).
0.93::acc(s1, waist_width_161).
measured(s1, waist_width_161, v26_1).
all_consistent(waist_width_161) :- consistent(s1, waist_width_161).
evidence(all_consistent(waist_width_161)).
query(true_val(waist_width_161, v26_1)).
query(true_val(waist_width_161, unk_waist_width_161)).

% @attr recommended_weight_range_size_161
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (161)
% @unit kg
% @values v80_100=80-100kg unk_recommended_weight_range_size_161=Unknown
% @importance 1.0
0.92::true_val(recommended_weight_range_size_161, v80_100); 0.08::true_val(recommended_weight_range_size_161, unk_recommended_weight_range_size_161).
0.93::acc(s1, recommended_weight_range_size_161).
measured(s1, recommended_weight_range_size_161, v80_100).
all_consistent(recommended_weight_range_size_161) :- consistent(s1, recommended_weight_range_size_161).
evidence(all_consistent(recommended_weight_range_size_161)).
query(true_val(recommended_weight_range_size_161, v80_100)).
query(true_val(recommended_weight_range_size_161, unk_recommended_weight_range_size_161)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values resort_powder_groomer=Resort_high_speed_powder_groomer_carving unk_terrain_suitability=Unknown
% @importance 0.8
0.64::true_val(terrain_suitability, resort_powder_groomer); 0.36::true_val(terrain_suitability, unk_terrain_suitability).
0.78::acc(s14, terrain_suitability).
measured(s14, terrain_suitability, resort_powder_groomer).
all_consistent(terrain_suitability) :- consistent(s14, terrain_suitability).
evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, resort_powder_groomer)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values aggressive_freeride_powder_am=Aggressive_freeride_powder_all_mountain unk_riding_style=Unknown
% @importance 0.8
0.64::true_val(riding_style, aggressive_freeride_powder_am); 0.36::true_val(riding_style, unk_riding_style).
0.78::acc(s14, riding_style).
measured(s14, riding_style, aggressive_freeride_powder_am).
all_consistent(riding_style) :- consistent(s14, riding_style).
evidence(all_consistent(riding_style)).
query(true_val(riding_style, aggressive_freeride_powder_am)).
query(true_val(riding_style, unk_riding_style)).

% @attr terrain_suitability_powder_10
% @type numeric
% @canonical false
% @original_name terrain_suitability (powder rating)
% @unit /10
% @values v9=9.0 unk_terrain_suitability_powder_10=Unknown
% @importance 0.7
0.62::true_val(terrain_suitability_powder_10, v9); 0.38::true_val(terrain_suitability_powder_10, unk_terrain_suitability_powder_10).
0.75::acc(s19, terrain_suitability_powder_10).
measured(s19, terrain_suitability_powder_10, v9).
all_consistent(terrain_suitability_powder_10) :- consistent(s19, terrain_suitability_powder_10).
evidence(all_consistent(terrain_suitability_powder_10)).
query(true_val(terrain_suitability_powder_10, v9)).
query(true_val(terrain_suitability_powder_10, unk_terrain_suitability_powder_10)).

% @attr terrain_suitability_resort_10
% @type numeric
% @canonical false
% @original_name terrain_suitability (resort rating)
% @unit /10
% @values v8=8.0 unk_terrain_suitability_resort_10=Unknown
% @importance 0.7
0.62::true_val(terrain_suitability_resort_10, v8); 0.38::true_val(terrain_suitability_resort_10, unk_terrain_suitability_resort_10).
0.75::acc(s19, terrain_suitability_resort_10).
measured(s19, terrain_suitability_resort_10, v8).
all_consistent(terrain_suitability_resort_10) :- consistent(s19, terrain_suitability_resort_10).
evidence(all_consistent(terrain_suitability_resort_10)).
query(true_val(terrain_suitability_resort_10, v8)).
query(true_val(terrain_suitability_resort_10, unk_terrain_suitability_resort_10)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values no_problem_switch=Directional_but_no_problem_going_switch unk_switch_riding=Unknown
% @importance 1.0
0.92::true_val(switch_riding, no_problem_switch); 0.08::true_val(switch_riding, unk_switch_riding).
0.90::acc(s1, switch_riding).
measured(s1, switch_riding, no_problem_switch).
all_consistent(switch_riding) :- consistent(s1, switch_riding).
evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, no_problem_switch)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr freestyle_park_rating
% @type categorical
% @canonical true
% @original_name freestyle_park_rating
% @values capable_not_park_board=Can_handle_freestyle_not_a_park_board unk_freestyle_park_rating=Unknown
% @importance 0.7
0.40::true_val(freestyle_park_rating, capable_not_park_board); 0.60::true_val(freestyle_park_rating, unk_freestyle_park_rating).
0.55::acc(s34, freestyle_park_rating).
measured(s34, freestyle_park_rating, capable_not_park_board).
all_consistent(freestyle_park_rating) :- consistent(s34, freestyle_park_rating).
evidence(all_consistent(freestyle_park_rating)).
query(true_val(freestyle_park_rating, capable_not_park_board)).
query(true_val(freestyle_park_rating, unk_freestyle_park_rating)).

% @attr terrain_suitability_quiver
% @type categorical
% @canonical false
% @original_name terrain_suitability (quiver assessment)
% @values one_board_quiver=One_board_quiver_not_switch_park_icy unk_terrain_suitability_quiver=Unknown
% @importance 0.9
0.76::true_val(terrain_suitability_quiver, one_board_quiver); 0.24::true_val(terrain_suitability_quiver, unk_terrain_suitability_quiver).
0.85::acc(s27, terrain_suitability_quiver).
measured(s27, terrain_suitability_quiver, one_board_quiver).
all_consistent(terrain_suitability_quiver) :- consistent(s27, terrain_suitability_quiver).
evidence(all_consistent(terrain_suitability_quiver)).
query(true_val(terrain_suitability_quiver, one_board_quiver)).
query(true_val(terrain_suitability_quiver, unk_terrain_suitability_quiver)).

% @attr board_weight_grams
% @type numeric
% @canonical true
% @original_name board_weight_grams
% @unit g
% @values v2600=2600.0 unk_board_weight_grams=Unknown
% @importance 0.9
0.76::true_val(board_weight_grams, v2600); 0.24::true_val(board_weight_grams, unk_board_weight_grams).
0.92::acc(s27, board_weight_grams).
measured(s27, board_weight_grams, v2600).
all_consistent(board_weight_grams) :- consistent(s27, board_weight_grams).
evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v2600)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr weight_per_cm
% @type numeric
% @canonical false
% @original_name weight_per_cm
% @unit g/cm
% @values v16_67=16.67 unk_weight_per_cm=Unknown
% @importance 0.9
0.76::true_val(weight_per_cm, v16_67); 0.24::true_val(weight_per_cm, unk_weight_per_cm).
0.90::acc(s27, weight_per_cm).
measured(s27, weight_per_cm, v16_67).
all_consistent(weight_per_cm) :- consistent(s27, weight_per_cm).
evidence(all_consistent(weight_per_cm)).
query(true_val(weight_per_cm, v16_67)).
query(true_val(weight_per_cm, unk_weight_per_cm)).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name reviewer_opinion_snowboardingprofiles
% @values light_scales_not_snow=Super_light_on_scales_not_as_light_on_snow unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.9
0.76::true_val(reviewer_opinion_snowboardingprofiles, light_scales_not_snow); 0.24::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).
0.85::acc(s27, reviewer_opinion_snowboardingprofiles).
measured(s27, reviewer_opinion_snowboardingprofiles, light_scales_not_snow).
all_consistent(reviewer_opinion_snowboardingprofiles) :- consistent(s27, reviewer_opinion_snowboardingprofiles).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, light_scales_not_snow)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

% @attr overall_rating_snowboardingprofiles
% @type numeric
% @canonical true
% @original_name overall_rating_snowboardingprofiles
% @unit /100
% @values v84_4=84.4 unk_overall_rating_snowboardingprofiles=Unknown
% @importance 0.9
0.76::true_val(overall_rating_snowboardingprofiles, v84_4); 0.24::true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles).
0.88::acc(s27, overall_rating_snowboardingprofiles).
measured(s27, overall_rating_snowboardingprofiles, v84_4).
all_consistent(overall_rating_snowboardingprofiles) :- consistent(s27, overall_rating_snowboardingprofiles).
evidence(all_consistent(overall_rating_snowboardingprofiles)).
query(true_val(overall_rating_snowboardingprofiles, v84_4)).
query(true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles)).

% @attr overall_rating_snowboardingprofiles_rank
% @type categorical
% @canonical false
% @original_name overall_rating_snowboardingprofiles (ranking)
% @values rank_19th_of_28=19th_out_of_28_mellow_freeride unk_overall_rating_snowboardingprofiles_rank=Unknown
% @importance 0.9
0.76::true_val(overall_rating_snowboardingprofiles_rank, rank_19th_of_28); 0.24::true_val(overall_rating_snowboardingprofiles_rank, unk_overall_rating_snowboardingprofiles_rank).
0.88::acc(s27, overall_rating_snowboardingprofiles_rank).
measured(s27, overall_rating_snowboardingprofiles_rank, rank_19th_of_28).
all_consistent(overall_rating_snowboardingprofiles_rank) :- consistent(s27, overall_rating_snowboardingprofiles_rank).
evidence(all_consistent(overall_rating_snowboardingprofiles_rank)).
query(true_val(overall_rating_snowboardingprofiles_rank, rank_19th_of_28)).
query(true_val(overall_rating_snowboardingprofiles_rank, unk_overall_rating_snowboardingprofiles_rank)).

% @attr overall_rating_snowboardingprofiles_alt
% @type numeric
% @canonical false
% @original_name overall_rating_snowboardingprofiles (alt score)
% @unit /100
% @values v85_7=85.7 unk_overall_rating_snowboardingprofiles_alt=Unknown
% @importance 0.9
0.76::true_val(overall_rating_snowboardingprofiles_alt, v85_7); 0.24::true_val(overall_rating_snowboardingprofiles_alt, unk_overall_rating_snowboardingprofiles_alt).
0.85::acc(s27, overall_rating_snowboardingprofiles_alt).
measured(s27, overall_rating_snowboardingprofiles_alt, v85_7).
all_consistent(overall_rating_snowboardingprofiles_alt) :- consistent(s27, overall_rating_snowboardingprofiles_alt).
evidence(all_consistent(overall_rating_snowboardingprofiles_alt)).
query(true_val(overall_rating_snowboardingprofiles_alt, v85_7)).
query(true_val(overall_rating_snowboardingprofiles_alt, unk_overall_rating_snowboardingprofiles_alt)).

% @attr powder_score_snowboardingprofiles
% @type numeric
% @canonical false
% @original_name powder_score_snowboardingprofiles
% @unit /5
% @values v4=4.0 unk_powder_score_snowboardingprofiles=Unknown
% @importance 0.9
0.76::true_val(powder_score_snowboardingprofiles, v4); 0.24::true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles).
0.88::acc(s27, powder_score_snowboardingprofiles).
measured(s27, powder_score_snowboardingprofiles, v4).
all_consistent(powder_score_snowboardingprofiles) :- consistent(s27, powder_score_snowboardingprofiles).
evidence(all_consistent(powder_score_snowboardingprofiles)).
query(true_val(powder_score_snowboardingprofiles, v4)).
query(true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles)).

% @attr reviewer_opinion_snowboardingprofiles_2
% @type numeric
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (sub-score 2)
% @unit /5
% @values v4=4.0 unk_reviewer_opinion_snowboardingprofiles_2=Unknown
% @importance 0.9
0.76::true_val(reviewer_opinion_snowboardingprofiles_2, v4); 0.24::true_val(reviewer_opinion_snowboardingprofiles_2, unk_reviewer_opinion_snowboardingprofiles_2).
0.85::acc(s27, reviewer_opinion_snowboardingprofiles_2).
measured(s27, reviewer_opinion_snowboardingprofiles_2, v4).
all_consistent(reviewer_opinion_snowboardingprofiles_2) :- consistent(s27, reviewer_opinion_snowboardingprofiles_2).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles_2)).
query(true_val(reviewer_opinion_snowboardingprofiles_2, v4)).
query(true_val(reviewer_opinion_snowboardingprofiles_2, unk_reviewer_opinion_snowboardingprofiles_2)).

% @attr carving_score_snowboardingprofiles
% @type numeric
% @canonical false
% @original_name carving_score_snowboardingprofiles
% @unit /5
% @values v3_5=3.5 unk_carving_score_snowboardingprofiles=Unknown
% @importance 0.9
0.76::true_val(carving_score_snowboardingprofiles, v3_5); 0.24::true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles).
0.88::acc(s27, carving_score_snowboardingprofiles).
measured(s27, carving_score_snowboardingprofiles, v3_5).
all_consistent(carving_score_snowboardingprofiles) :- consistent(s27, carving_score_snowboardingprofiles).
evidence(all_consistent(carving_score_snowboardingprofiles)).
query(true_val(carving_score_snowboardingprofiles, v3_5)).
query(true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles)).

% @attr reviewer_opinion_snowboardingprofiles_3
% @type numeric
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (sub-score 3)
% @unit /5
% @values v4=4.0 unk_reviewer_opinion_snowboardingprofiles_3=Unknown
% @importance 0.9
0.76::true_val(reviewer_opinion_snowboardingprofiles_3, v4); 0.24::true_val(reviewer_opinion_snowboardingprofiles_3, unk_reviewer_opinion_snowboardingprofiles_3).
0.85::acc(s27, reviewer_opinion_snowboardingprofiles_3).
measured(s27, reviewer_opinion_snowboardingprofiles_3, v4).
all_consistent(reviewer_opinion_snowboardingprofiles_3) :- consistent(s27, reviewer_opinion_snowboardingprofiles_3).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles_3)).
query(true_val(reviewer_opinion_snowboardingprofiles_3, v4)).
query(true_val(reviewer_opinion_snowboardingprofiles_3, unk_reviewer_opinion_snowboardingprofiles_3)).

% @attr reviewer_opinion_snowboardingprofiles_4
% @type numeric
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (sub-score 4)
% @unit /5
% @values v3_5=3.5 unk_reviewer_opinion_snowboardingprofiles_4=Unknown
% @importance 0.9
0.76::true_val(reviewer_opinion_snowboardingprofiles_4, v3_5); 0.24::true_val(reviewer_opinion_snowboardingprofiles_4, unk_reviewer_opinion_snowboardingprofiles_4).
0.85::acc(s27, reviewer_opinion_snowboardingprofiles_4).
measured(s27, reviewer_opinion_snowboardingprofiles_4, v3_5).
all_consistent(reviewer_opinion_snowboardingprofiles_4) :- consistent(s27, reviewer_opinion_snowboardingprofiles_4).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles_4)).
query(true_val(reviewer_opinion_snowboardingprofiles_4, v3_5)).
query(true_val(reviewer_opinion_snowboardingprofiles_4, unk_reviewer_opinion_snowboardingprofiles_4)).

% @attr reviewer_opinion_snowboardingprofiles_5
% @type numeric
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (sub-score 5)
% @unit /5
% @values v3_5=3.5 unk_reviewer_opinion_snowboardingprofiles_5=Unknown
% @importance 0.9
0.76::true_val(reviewer_opinion_snowboardingprofiles_5, v3_5); 0.24::true_val(reviewer_opinion_snowboardingprofiles_5, unk_reviewer_opinion_snowboardingprofiles_5).
0.85::acc(s27, reviewer_opinion_snowboardingprofiles_5).
measured(s27, reviewer_opinion_snowboardingprofiles_5, v3_5).
all_consistent(reviewer_opinion_snowboardingprofiles_5) :- consistent(s27, reviewer_opinion_snowboardingprofiles_5).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles_5)).
query(true_val(reviewer_opinion_snowboardingprofiles_5, v3_5)).
query(true_val(reviewer_opinion_snowboardingprofiles_5, unk_reviewer_opinion_snowboardingprofiles_5)).

% @attr reviewer_opinion_snowboardingprofiles_6
% @type numeric
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (sub-score 6)
% @unit /5
% @values v4=4.0 unk_reviewer_opinion_snowboardingprofiles_6=Unknown
% @importance 0.9
0.76::true_val(reviewer_opinion_snowboardingprofiles_6, v4); 0.24::true_val(reviewer_opinion_snowboardingprofiles_6, unk_reviewer_opinion_snowboardingprofiles_6).
0.85::acc(s27, reviewer_opinion_snowboardingprofiles_6).
measured(s27, reviewer_opinion_snowboardingprofiles_6, v4).
all_consistent(reviewer_opinion_snowboardingprofiles_6) :- consistent(s27, reviewer_opinion_snowboardingprofiles_6).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles_6)).
query(true_val(reviewer_opinion_snowboardingprofiles_6, v4)).
query(true_val(reviewer_opinion_snowboardingprofiles_6, unk_reviewer_opinion_snowboardingprofiles_6)).

% @attr reviewer_opinion_snowboardingprofiles_7
% @type numeric
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (sub-score 7)
% @unit /5
% @values v3=3.0 unk_reviewer_opinion_snowboardingprofiles_7=Unknown
% @importance 0.9
0.76::true_val(reviewer_opinion_snowboardingprofiles_7, v3); 0.24::true_val(reviewer_opinion_snowboardingprofiles_7, unk_reviewer_opinion_snowboardingprofiles_7).
0.85::acc(s27, reviewer_opinion_snowboardingprofiles_7).
measured(s27, reviewer_opinion_snowboardingprofiles_7, v3).
all_consistent(reviewer_opinion_snowboardingprofiles_7) :- consistent(s27, reviewer_opinion_snowboardingprofiles_7).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles_7)).
query(true_val(reviewer_opinion_snowboardingprofiles_7, v3)).
query(true_val(reviewer_opinion_snowboardingprofiles_7, unk_reviewer_opinion_snowboardingprofiles_7)).

% @attr reviewer_opinion_snowboardingprofiles_8
% @type numeric
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (sub-score 8)
% @unit /10
% @values v6=6.0 unk_reviewer_opinion_snowboardingprofiles_8=Unknown
% @importance 0.9
0.76::true_val(reviewer_opinion_snowboardingprofiles_8, v6); 0.24::true_val(reviewer_opinion_snowboardingprofiles_8, unk_reviewer_opinion_snowboardingprofiles_8).
0.85::acc(s27, reviewer_opinion_snowboardingprofiles_8).
measured(s27, reviewer_opinion_snowboardingprofiles_8, v6).
all_consistent(reviewer_opinion_snowboardingprofiles_8) :- consistent(s27, reviewer_opinion_snowboardingprofiles_8).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles_8)).
query(true_val(reviewer_opinion_snowboardingprofiles_8, v6)).
query(true_val(reviewer_opinion_snowboardingprofiles_8, unk_reviewer_opinion_snowboardingprofiles_8)).

% @attr reviewer_opinion_snowboardingprofiles_9
% @type numeric
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (sub-score 9)
% @unit /10
% @values v5=5.0 unk_reviewer_opinion_snowboardingprofiles_9=Unknown
% @importance 0.9
0.76::true_val(reviewer_opinion_snowboardingprofiles_9, v5); 0.24::true_val(reviewer_opinion_snowboardingprofiles_9, unk_reviewer_opinion_snowboardingprofiles_9).
0.85::acc(s27, reviewer_opinion_snowboardingprofiles_9).
measured(s27, reviewer_opinion_snowboardingprofiles_9, v5).
all_consistent(reviewer_opinion_snowboardingprofiles_9) :- consistent(s27, reviewer_opinion_snowboardingprofiles_9).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles_9)).
query(true_val(reviewer_opinion_snowboardingprofiles_9, v5)).
query(true_val(reviewer_opinion_snowboardingprofiles_9, unk_reviewer_opinion_snowboardingprofiles_9)).

% @attr reviewer_opinion_snowboardingprofiles_10
% @type numeric
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (sub-score 10)
% @unit /10
% @values v5=5.0 unk_reviewer_opinion_snowboardingprofiles_10=Unknown
% @importance 0.9
0.76::true_val(reviewer_opinion_snowboardingprofiles_10, v5); 0.24::true_val(reviewer_opinion_snowboardingprofiles_10, unk_reviewer_opinion_snowboardingprofiles_10).
0.85::acc(s27, reviewer_opinion_snowboardingprofiles_10).
measured(s27, reviewer_opinion_snowboardingprofiles_10, v5).
all_consistent(reviewer_opinion_snowboardingprofiles_10) :- consistent(s27, reviewer_opinion_snowboardingprofiles_10).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles_10)).
query(true_val(reviewer_opinion_snowboardingprofiles_10, v5)).
query(true_val(reviewer_opinion_snowboardingprofiles_10, unk_reviewer_opinion_snowboardingprofiles_10)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values firm_hard_good=Firm_to_hard_snow_good unk_edge_hold=Unknown
% @importance 0.9
0.76::true_val(edge_hold, firm_hard_good); 0.24::true_val(edge_hold, unk_edge_hold).
0.85::acc(s27, edge_hold).
measured(s27, edge_hold, firm_hard_good).
all_consistent(edge_hold) :- consistent(s27, edge_hold).
evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, firm_hard_good)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr user_review_forum
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values reviews_33_97pct_5star=33_reviews_97pct_5star unk_user_review_forum=Unknown
% @importance 1.0
0.92::true_val(user_review_forum, reviews_33_97pct_5star); 0.08::true_val(user_review_forum, unk_user_review_forum).
0.88::acc(s1, user_review_forum).
measured(s1, user_review_forum, reviews_33_97pct_5star).
all_consistent(user_review_forum) :- consistent(s1, user_review_forum).
evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, reviews_33_97pct_5star)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values positive_exceeded_expectations=Positive_exceeded_expectations unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.65
0.60::true_val(reviewer_opinion_the_good_ride, positive_exceeded_expectations); 0.40::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).
0.75::acc(s32, reviewer_opinion_the_good_ride).
measured(s32, reviewer_opinion_the_good_ride, positive_exceeded_expectations).
all_consistent(reviewer_opinion_the_good_ride) :- consistent(s32, reviewer_opinion_the_good_ride).
evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, positive_exceeded_expectations)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values versatile_powder_groomer_park=Versatile_powder_groomers_park unk_positive_aspect=Unknown
% @importance 0.7
0.40::true_val(positive_aspect, versatile_powder_groomer_park); 0.60::true_val(positive_aspect, unk_positive_aspect).
0.55::acc(s34, positive_aspect).
measured(s34, positive_aspect, versatile_powder_groomer_park).
all_consistent(positive_aspect) :- consistent(s34, positive_aspect).
evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, versatile_powder_groomer_park)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr positive_aspect_fast_base
% @type categorical
% @canonical false
% @original_name positive_aspect (fast base)
% @values fast_sintered_base=Fast_sintered_base_praised_for_speed unk_positive_aspect_fast_base=Unknown
% @importance 0.7
0.40::true_val(positive_aspect_fast_base, fast_sintered_base); 0.60::true_val(positive_aspect_fast_base, unk_positive_aspect_fast_base).
0.55::acc(s34, positive_aspect_fast_base).
measured(s34, positive_aspect_fast_base, fast_sintered_base).
all_consistent(positive_aspect_fast_base) :- consistent(s34, positive_aspect_fast_base).
evidence(all_consistent(positive_aspect_fast_base)).
query(true_val(positive_aspect_fast_base, fast_sintered_base)).
query(true_val(positive_aspect_fast_base, unk_positive_aspect_fast_base)).

% @attr positive_aspect_catch_free
% @type categorical
% @canonical false
% @original_name positive_aspect (catch-free ride)
% @values catch_free_3bt=Catch_free_ride_3BT_eliminates_edge_catches unk_positive_aspect_catch_free=Unknown
% @importance 0.7
0.36::true_val(positive_aspect_catch_free, catch_free_3bt); 0.64::true_val(positive_aspect_catch_free, unk_positive_aspect_catch_free).
0.50::acc(s35, positive_aspect_catch_free).
measured(s35, positive_aspect_catch_free, catch_free_3bt).
all_consistent(positive_aspect_catch_free) :- consistent(s35, positive_aspect_catch_free).
evidence(all_consistent(positive_aspect_catch_free)).
query(true_val(positive_aspect_catch_free, catch_free_3bt)).
query(true_val(positive_aspect_catch_free, unk_positive_aspect_catch_free)).

% @attr positive_aspect_carve_bash
% @type categorical
% @canonical false
% @original_name positive_aspect (carve and bash)
% @values carve_bash_low_effort=Can_carve_and_bash_through_afternoon_low_effort unk_positive_aspect_carve_bash=Unknown
% @importance 0.7
0.36::true_val(positive_aspect_carve_bash, carve_bash_low_effort); 0.64::true_val(positive_aspect_carve_bash, unk_positive_aspect_carve_bash).
0.50::acc(s35, positive_aspect_carve_bash).
measured(s35, positive_aspect_carve_bash, carve_bash_low_effort).
all_consistent(positive_aspect_carve_bash) :- consistent(s35, positive_aspect_carve_bash).
evidence(all_consistent(positive_aspect_carve_bash)).
query(true_val(positive_aspect_carve_bash, carve_bash_low_effort)).
query(true_val(positive_aspect_carve_bash, unk_positive_aspect_carve_bash)).

% @attr positive_aspect_pop
% @type categorical
% @canonical false
% @original_name positive_aspect (pop)
% @values nice_pop=Pop_is_nice_easy_to_extract unk_positive_aspect_pop=Unknown
% @importance 0.9
0.76::true_val(positive_aspect_pop, nice_pop); 0.24::true_val(positive_aspect_pop, unk_positive_aspect_pop).
0.85::acc(s27, positive_aspect_pop).
measured(s27, positive_aspect_pop, nice_pop).
all_consistent(positive_aspect_pop) :- consistent(s27, positive_aspect_pop).
evidence(all_consistent(positive_aspect_pop)).
query(true_val(positive_aspect_pop, nice_pop)).
query(true_val(positive_aspect_pop, unk_positive_aspect_pop)).

% @attr positive_aspect_light_fast
% @type categorical
% @canonical false
% @original_name positive_aspect (light and fast)
% @values super_light_fast_good=Super_light_fast_all_around_good unk_positive_aspect_light_fast=Unknown
% @importance 0.6
0.34::true_val(positive_aspect_light_fast, super_light_fast_good); 0.66::true_val(positive_aspect_light_fast, unk_positive_aspect_light_fast).
0.50::acc(s36, positive_aspect_light_fast).
measured(s36, positive_aspect_light_fast, super_light_fast_good).
all_consistent(positive_aspect_light_fast) :- consistent(s36, positive_aspect_light_fast).
evidence(all_consistent(positive_aspect_light_fast)).
query(true_val(positive_aspect_light_fast, super_light_fast_good)).
query(true_val(positive_aspect_light_fast, unk_positive_aspect_light_fast)).

% @attr positive_aspect_terrain_control
% @type categorical
% @canonical false
% @original_name positive_aspect (terrain control)
% @values cut_through_uneven=Board_cut_through_uneven_terrain_with_control unk_positive_aspect_terrain_control=Unknown
% @importance 0.8
0.59::true_val(positive_aspect_terrain_control, cut_through_uneven); 0.41::true_val(positive_aspect_terrain_control, unk_positive_aspect_terrain_control).
0.72::acc(s37, positive_aspect_terrain_control).
measured(s37, positive_aspect_terrain_control, cut_through_uneven).
all_consistent(positive_aspect_terrain_control) :- consistent(s37, positive_aspect_terrain_control).
evidence(all_consistent(positive_aspect_terrain_control)).
query(true_val(positive_aspect_terrain_control, cut_through_uneven)).
query(true_val(positive_aspect_terrain_control, unk_positive_aspect_terrain_control)).

% @attr positive_aspect_powder_float
% @type categorical
% @canonical false
% @original_name positive_aspect (powder float)
% @values great_powder_float_3bt=Great_powder_float_3BT unk_positive_aspect_powder_float=Unknown
% @importance 0.8
0.59::true_val(positive_aspect_powder_float, great_powder_float_3bt); 0.41::true_val(positive_aspect_powder_float, unk_positive_aspect_powder_float).
0.72::acc(s37, positive_aspect_powder_float).
measured(s37, positive_aspect_powder_float, great_powder_float_3bt).
all_consistent(positive_aspect_powder_float) :- consistent(s37, positive_aspect_powder_float).
evidence(all_consistent(positive_aspect_powder_float)).
query(true_val(positive_aspect_powder_float, great_powder_float_3bt)).
query(true_val(positive_aspect_powder_float, unk_positive_aspect_powder_float)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values wax_hungry=Sintered_base_needs_regular_waxing unk_negative_aspect=Unknown
% @importance 0.9
0.76::true_val(negative_aspect, wax_hungry); 0.24::true_val(negative_aspect, unk_negative_aspect).
0.85::acc(s27, negative_aspect).
measured(s27, negative_aspect, wax_hungry).
all_consistent(negative_aspect) :- consistent(s27, negative_aspect).
evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, wax_hungry)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_grabby
% @type categorical
% @canonical false
% @original_name negative_aspect (grabby first day)
% @values grabby_catchy_first_day=Felt_grabby_catchy_on_first_day unk_negative_aspect_grabby=Unknown
% @importance 0.9
0.76::true_val(negative_aspect_grabby, grabby_catchy_first_day); 0.24::true_val(negative_aspect_grabby, unk_negative_aspect_grabby).
0.82::acc(s27, negative_aspect_grabby).
measured(s27, negative_aspect_grabby, grabby_catchy_first_day).
all_consistent(negative_aspect_grabby) :- consistent(s27, negative_aspect_grabby).
evidence(all_consistent(negative_aspect_grabby)).
query(true_val(negative_aspect_grabby, grabby_catchy_first_day)).
query(true_val(negative_aspect_grabby, unk_negative_aspect_grabby)).

% @attr negative_aspect_chatter
% @type categorical
% @canonical false
% @original_name negative_aspect (chatter)
% @values chatter_choppy_terrain=Some_chatter_in_choppy_uneven_terrain unk_negative_aspect_chatter=Unknown
% @importance 0.8
0.59::true_val(negative_aspect_chatter, chatter_choppy_terrain); 0.41::true_val(negative_aspect_chatter, unk_negative_aspect_chatter).
0.72::acc(s37, negative_aspect_chatter).
measured(s37, negative_aspect_chatter, chatter_choppy_terrain).
all_consistent(negative_aspect_chatter) :- consistent(s37, negative_aspect_chatter).
evidence(all_consistent(negative_aspect_chatter)).
query(true_val(negative_aspect_chatter, chatter_choppy_terrain)).
query(true_val(negative_aspect_chatter, unk_negative_aspect_chatter)).

% @attr negative_aspect_icy
% @type categorical
% @canonical false
% @original_name negative_aspect (icy conditions)
% @values not_ideal_icy=Not_ideal_for_very_icy_conditions unk_negative_aspect_icy=Unknown
% @importance 0.9
0.76::true_val(negative_aspect_icy, not_ideal_icy); 0.24::true_val(negative_aspect_icy, unk_negative_aspect_icy).
0.85::acc(s27, negative_aspect_icy).
measured(s27, negative_aspect_icy, not_ideal_icy).
all_consistent(negative_aspect_icy) :- consistent(s27, negative_aspect_icy).
evidence(all_consistent(negative_aspect_icy)).
query(true_val(negative_aspect_icy, not_ideal_icy)).
query(true_val(negative_aspect_icy, unk_negative_aspect_icy)).

% @attr negative_aspect_carving
% @type categorical
% @canonical false
% @original_name negative_aspect (carving)
% @values decent_not_super_carver=Not_top_tier_carver_decent_not_super unk_negative_aspect_carving=Unknown
% @importance 0.9
0.76::true_val(negative_aspect_carving, decent_not_super_carver); 0.24::true_val(negative_aspect_carving, unk_negative_aspect_carving).
0.85::acc(s27, negative_aspect_carving).
measured(s27, negative_aspect_carving, decent_not_super_carver).
all_consistent(negative_aspect_carving) :- consistent(s27, negative_aspect_carving).
evidence(all_consistent(negative_aspect_carving)).
query(true_val(negative_aspect_carving, decent_not_super_carver)).
query(true_val(negative_aspect_carving, unk_negative_aspect_carving)).

% @attr negative_aspect_switch
% @type categorical
% @canonical false
% @original_name negative_aspect (switch riding)
% @values switch_decent_not_ideal=Switch_decent_not_ideal_directional unk_negative_aspect_switch=Unknown
% @importance 0.9
0.76::true_val(negative_aspect_switch, switch_decent_not_ideal); 0.24::true_val(negative_aspect_switch, unk_negative_aspect_switch).
0.85::acc(s27, negative_aspect_switch).
measured(s27, negative_aspect_switch, switch_decent_not_ideal).
all_consistent(negative_aspect_switch) :- consistent(s27, negative_aspect_switch).
evidence(all_consistent(negative_aspect_switch)).
query(true_val(negative_aspect_switch, switch_decent_not_ideal)).
query(true_val(negative_aspect_switch, unk_negative_aspect_switch)).

% @attr negative_aspect_shipping
% @type categorical
% @canonical false
% @original_name negative_aspect (shipping)
% @values usps_shipping_delay=Customer_reported_USPS_shipping_delay unk_negative_aspect_shipping=Unknown
% @importance 1.0
0.92::true_val(negative_aspect_shipping, usps_shipping_delay); 0.08::true_val(negative_aspect_shipping, unk_negative_aspect_shipping).
0.70::acc(s1, negative_aspect_shipping).
measured(s1, negative_aspect_shipping, usps_shipping_delay).
all_consistent(negative_aspect_shipping) :- consistent(s1, negative_aspect_shipping).
evidence(all_consistent(negative_aspect_shipping)).
query(true_val(negative_aspect_shipping, usps_shipping_delay)).
query(true_val(negative_aspect_shipping, unk_negative_aspect_shipping)).

% @attr negative_aspect_ranking
% @type categorical
% @canonical false
% @original_name negative_aspect (ranking)
% @values below_avg_mellow_freeride=Ranked_below_average_19th_of_28 unk_negative_aspect_ranking=Unknown
% @importance 0.9
0.76::true_val(negative_aspect_ranking, below_avg_mellow_freeride); 0.24::true_val(negative_aspect_ranking, unk_negative_aspect_ranking).
0.85::acc(s27, negative_aspect_ranking).
measured(s27, negative_aspect_ranking, below_avg_mellow_freeride).
all_consistent(negative_aspect_ranking) :- consistent(s27, negative_aspect_ranking).
evidence(all_consistent(negative_aspect_ranking)).
query(true_val(negative_aspect_ranking, below_avg_mellow_freeride)).
query(true_val(negative_aspect_ranking, unk_negative_aspect_ranking)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values salomon_sickstick=Salomon_Sickstick unk_comparable_board_cross_brand=Unknown
% @importance 0.6
0.39::true_val(comparable_board_cross_brand, salomon_sickstick); 0.61::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).
0.60::acc(s38, comparable_board_cross_brand).
measured(s38, comparable_board_cross_brand, salomon_sickstick).
all_consistent(comparable_board_cross_brand) :- consistent(s38, comparable_board_cross_brand).
evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, salomon_sickstick)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_2
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Jones Flagship)
% @values jones_flagship=Jones_Flagship unk_comparable_board_cross_brand_2=Unknown
% @importance 0.6
0.39::true_val(comparable_board_cross_brand_2, jones_flagship); 0.61::true_val(comparable_board_cross_brand_2, unk_comparable_board_cross_brand_2).
0.60::acc(s39, comparable_board_cross_brand_2).
measured(s39, comparable_board_cross_brand_2, jones_flagship).
all_consistent(comparable_board_cross_brand_2) :- consistent(s39, comparable_board_cross_brand_2).
evidence(all_consistent(comparable_board_cross_brand_2)).
query(true_val(comparable_board_cross_brand_2, jones_flagship)).
query(true_val(comparable_board_cross_brand_2, unk_comparable_board_cross_brand_2)).

% @attr comparable_board_cross_brand_3
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Jones Stratos)
% @values jones_stratos=Jones_Stratos unk_comparable_board_cross_brand_3=Unknown
% @importance 0.65
0.52::true_val(comparable_board_cross_brand_3, jones_stratos); 0.48::true_val(comparable_board_cross_brand_3, unk_comparable_board_cross_brand_3).
0.70::acc(s40, comparable_board_cross_brand_3).
measured(s40, comparable_board_cross_brand_3, jones_stratos).
all_consistent(comparable_board_cross_brand_3) :- consistent(s40, comparable_board_cross_brand_3).
evidence(all_consistent(comparable_board_cross_brand_3)).
query(true_val(comparable_board_cross_brand_3, jones_stratos)).
query(true_val(comparable_board_cross_brand_3, unk_comparable_board_cross_brand_3)).

% @attr comparable_board_cross_brand_4
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Nitro Squash)
% @values nitro_squash=Nitro_Squash unk_comparable_board_cross_brand_4=Unknown
% @importance 0.65
0.52::true_val(comparable_board_cross_brand_4, nitro_squash); 0.48::true_val(comparable_board_cross_brand_4, unk_comparable_board_cross_brand_4).
0.70::acc(s40, comparable_board_cross_brand_4).
measured(s40, comparable_board_cross_brand_4, nitro_squash).
all_consistent(comparable_board_cross_brand_4) :- consistent(s40, comparable_board_cross_brand_4).
evidence(all_consistent(comparable_board_cross_brand_4)).
query(true_val(comparable_board_cross_brand_4, nitro_squash)).
query(true_val(comparable_board_cross_brand_4, unk_comparable_board_cross_brand_4)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values bataleon_whatever=Bataleon_Whatever_579_95 unk_comparable_board_same_brand=Unknown
% @importance 0.95
0.77::true_val(comparable_board_same_brand, bataleon_whatever); 0.23::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).
0.82::acc(s15, comparable_board_same_brand).
measured(s15, comparable_board_same_brand, bataleon_whatever).
all_consistent(comparable_board_same_brand) :- consistent(s15, comparable_board_same_brand).
evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, bataleon_whatever)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_2
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Goliath)
% @values bataleon_goliath=Bataleon_Goliath_629_95 unk_comparable_board_same_brand_2=Unknown
% @importance 0.95
0.77::true_val(comparable_board_same_brand_2, bataleon_goliath); 0.23::true_val(comparable_board_same_brand_2, unk_comparable_board_same_brand_2).
0.82::acc(s15, comparable_board_same_brand_2).
measured(s15, comparable_board_same_brand_2, bataleon_goliath).
all_consistent(comparable_board_same_brand_2) :- consistent(s15, comparable_board_same_brand_2).
evidence(all_consistent(comparable_board_same_brand_2)).
query(true_val(comparable_board_same_brand_2, bataleon_goliath)).
query(true_val(comparable_board_same_brand_2, unk_comparable_board_same_brand_2)).

% @attr comparable_board_same_brand_3
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Cameleon)
% @values bataleon_cameleon=Bataleon_Cameleon_689_95 unk_comparable_board_same_brand_3=Unknown
% @importance 0.95
0.77::true_val(comparable_board_same_brand_3, bataleon_cameleon); 0.23::true_val(comparable_board_same_brand_3, unk_comparable_board_same_brand_3).
0.82::acc(s15, comparable_board_same_brand_3).
measured(s15, comparable_board_same_brand_3, bataleon_cameleon).
all_consistent(comparable_board_same_brand_3) :- consistent(s15, comparable_board_same_brand_3).
evidence(all_consistent(comparable_board_same_brand_3)).
query(true_val(comparable_board_same_brand_3, bataleon_cameleon)).
query(true_val(comparable_board_same_brand_3, unk_comparable_board_same_brand_3)).

% @attr comparable_board_same_brand_4
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Surfer)
% @values bataleon_surfer=Bataleon_Surfer_1099_95 unk_comparable_board_same_brand_4=Unknown
% @importance 0.95
0.77::true_val(comparable_board_same_brand_4, bataleon_surfer); 0.23::true_val(comparable_board_same_brand_4, unk_comparable_board_same_brand_4).
0.82::acc(s15, comparable_board_same_brand_4).
measured(s15, comparable_board_same_brand_4, bataleon_surfer).
all_consistent(comparable_board_same_brand_4) :- consistent(s15, comparable_board_same_brand_4).
evidence(all_consistent(comparable_board_same_brand_4)).
query(true_val(comparable_board_same_brand_4, bataleon_surfer)).
query(true_val(comparable_board_same_brand_4, unk_comparable_board_same_brand_4)).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values standard_2x4_non_est=Standard_2x4_compatible_non_Burton_EST unk_binding_compatibility=Unknown
% @importance 0.6
0.47::true_val(binding_compatibility, standard_2x4_non_est); 0.53::true_val(binding_compatibility, unk_binding_compatibility).
0.60::acc(s17, binding_compatibility).
measured(s17, binding_compatibility, standard_2x4_non_est).
all_consistent(binding_compatibility) :- consistent(s17, binding_compatibility).
evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, standard_2x4_non_est)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

% @attr construction_material_innovation_stringer_placement
% @type categorical
% @canonical false
% @original_name construction_material_innovation (stringer placement)
% @values nose_front_insert_contact_tail_insert_tail=Nose_stringers_front_insert_to_contact_points_tail_stringers_insert_to_tail unk_construction_material_innovation_stringer_placement=Unknown
% @importance 0.55
0.55::true_val(construction_material_innovation_stringer_placement, nose_front_insert_contact_tail_insert_tail); 0.45::true_val(construction_material_innovation_stringer_placement, unk_construction_material_innovation_stringer_placement).
0.68::acc(s21, construction_material_innovation_stringer_placement).
measured(s21, construction_material_innovation_stringer_placement, nose_front_insert_contact_tail_insert_tail).
all_consistent(construction_material_innovation_stringer_placement) :- consistent(s21, construction_material_innovation_stringer_placement).
evidence(all_consistent(construction_material_innovation_stringer_placement)).
query(true_val(construction_material_innovation_stringer_placement, nose_front_insert_contact_tail_insert_tail)).
query(true_val(construction_material_innovation_stringer_placement, unk_construction_material_innovation_stringer_placement)).

% @attr mounting_pattern_backseat
% @type categorical
% @canonical false
% @original_name mounting_pattern (backseat inserts)
% @values plus_2_backseat=Plus_2_additional_insert_positions_for_setback unk_mounting_pattern_backseat=Unknown
% @importance 0.7
0.62::true_val(mounting_pattern_backseat, plus_2_backseat); 0.38::true_val(mounting_pattern_backseat, unk_mounting_pattern_backseat).
0.75::acc(s19, mounting_pattern_backseat).
measured(s19, mounting_pattern_backseat, plus_2_backseat).
all_consistent(mounting_pattern_backseat) :- consistent(s19, mounting_pattern_backseat).
evidence(all_consistent(mounting_pattern_backseat)).
query(true_val(mounting_pattern_backseat, plus_2_backseat)).
query(true_val(mounting_pattern_backseat, unk_mounting_pattern_backseat)).

% @attr brand_reputation
% @type categorical
% @canonical false
% @original_name Brand reputation
% @values fastest_growing_20yr_3bt=Fastest_growing_brand_20plus_years_3BT unk_brand_reputation=Unknown
% @importance 0.4
0.64::true_val(brand_reputation, fastest_growing_20yr_3bt); 0.36::true_val(brand_reputation, unk_brand_reputation).
0.78::acc(s41, brand_reputation).
measured(s41, brand_reputation, fastest_growing_20yr_3bt).
all_consistent(brand_reputation) :- consistent(s41, brand_reputation).
evidence(all_consistent(brand_reputation)).
query(true_val(brand_reputation, fastest_growing_20yr_3bt)).
query(true_val(brand_reputation, unk_brand_reputation)).

% @attr brand_reputation_craftsmanship
% @type categorical
% @canonical false
% @original_name Brand reputation (craftsmanship)
% @values hand_built_austria_exceptional=Hand_built_Austria_Mothership_exceptional_materials unk_brand_reputation_craftsmanship=Unknown
% @importance 0.5
0.72::true_val(brand_reputation_craftsmanship, hand_built_austria_exceptional); 0.28::true_val(brand_reputation_craftsmanship, unk_brand_reputation_craftsmanship).
0.80::acc(s8, brand_reputation_craftsmanship).
measured(s8, brand_reputation_craftsmanship, hand_built_austria_exceptional).
all_consistent(brand_reputation_craftsmanship) :- consistent(s8, brand_reputation_craftsmanship).
evidence(all_consistent(brand_reputation_craftsmanship)).
query(true_val(brand_reputation_craftsmanship, hand_built_austria_exceptional)).
query(true_val(brand_reputation_craftsmanship, unk_brand_reputation_craftsmanship)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values fsc_certified_wood=FSC_certified_wood_cores unk_sustainability_certification=Unknown
% @importance 0.45
0.42::true_val(sustainability_certification, fsc_certified_wood); 0.58::true_val(sustainability_certification, unk_sustainability_certification).
0.58::acc(s42, sustainability_certification).
measured(s42, sustainability_certification, fsc_certified_wood).
all_consistent(sustainability_certification) :- consistent(s42, sustainability_certification).
evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, fsc_certified_wood)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr sustainability_certification_commitment
% @type categorical
% @canonical false
% @original_name sustainability_certification (commitment)
% @values committed_responsible_sourcing=Committed_to_responsible_sourcing_minimal_footprint unk_sustainability_certification_commitment=Unknown
% @importance 0.35
0.27::true_val(sustainability_certification_commitment, committed_responsible_sourcing); 0.73::true_val(sustainability_certification_commitment, unk_sustainability_certification_commitment).
0.45::acc(s44, sustainability_certification_commitment).
measured(s44, sustainability_certification_commitment, committed_responsible_sourcing).
all_consistent(sustainability_certification_commitment) :- consistent(s44, sustainability_certification_commitment).
evidence(all_consistent(sustainability_certification_commitment)).
query(true_val(sustainability_certification_commitment, committed_responsible_sourcing)).
query(true_val(sustainability_certification_commitment, unk_sustainability_certification_commitment)).

% @attr pro_rider_name
% @type categorical
% @canonical false
% @original_name pro_rider_name
% @values morgan_lundstrom_medlova=Ethan_Morgan_Tor_Lundstrom_Klaudia_Medlova unk_pro_rider_name=Unknown
% @importance 0.325
0.93::true_val(pro_rider_name, morgan_lundstrom_medlova); 0.07::true_val(pro_rider_name, unk_pro_rider_name).
0.78::acc(s41, pro_rider_name).
0.55::acc(s45, pro_rider_name).
measured(s41, pro_rider_name, morgan_lundstrom_medlova).
measured(s45, pro_rider_name, morgan_lundstrom_medlova).
all_consistent(pro_rider_name) :- consistent(s41, pro_rider_name), consistent(s45, pro_rider_name).
evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, morgan_lundstrom_medlova)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr construction_material_innovation_supertubes_function
% @type categorical
% @canonical false
% @original_name construction_material_innovation (SuperTubes function)
% @values reinforce_camber_reduce_weight_pop=Reinforce_camber_reduce_weight_increase_pop unk_construction_material_innovation_supertubes_function=Unknown
% @importance 0.7
0.90::true_val(construction_material_innovation_supertubes_function, reinforce_camber_reduce_weight_pop); 0.10::true_val(construction_material_innovation_supertubes_function, unk_construction_material_innovation_supertubes_function).
0.93::acc(s1, construction_material_innovation_supertubes_function).
measured(s1, construction_material_innovation_supertubes_function, reinforce_camber_reduce_weight_pop).
all_consistent(construction_material_innovation_supertubes_function) :- consistent(s1, construction_material_innovation_supertubes_function).
evidence(all_consistent(construction_material_innovation_supertubes_function)).
query(true_val(construction_material_innovation_supertubes_function, reinforce_camber_reduce_weight_pop)).
query(true_val(construction_material_innovation_supertubes_function, unk_construction_material_innovation_supertubes_function)).