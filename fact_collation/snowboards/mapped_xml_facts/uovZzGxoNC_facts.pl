0.15::indep(s_m).
0.20::indep(s2).
0.15::indep(s29).
0.25::indep(s30).
0.15::indep(s31).
0.20::indep(s32).
0.15::indep(s33).
0.25::indep(s34).
0.20::indep(s35).
0.15::indep(s36).
0.15::indep(s28).
0.80::indep(s23).
0.80::indep(s37).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values bataleon=Bataleon unk_brand=Unknown
% @importance 1.0

0.93::acc(s1, brand).
0.92::true_val(brand, bataleon); 0.08::true_val(brand, unk_brand).
measured(s1, brand, bataleon).
all_consistent(brand) :- consistent(s1, brand).
evidence(all_consistent(brand)).
query(true_val(brand, bataleon)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values turbo=Turbo unk_model_name=Unknown
% @importance 1.0

0.95::acc(s1, model_name).
0.92::true_val(model_name, turbo); 0.08::true_val(model_name, unk_model_name).
measured(s1, model_name, turbo).
all_consistent(model_name) :- consistent(s1, model_name).
evidence(all_consistent(model_name)).
query(true_val(model_name, turbo)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values season_2025_2026=2025/2026 unk_model_year=Unknown
% @importance 0.975

0.95::acc(s1, model_year).
0.85::acc(s2, model_year).
0.95::true_val(model_year, season_2025_2026); 0.05::true_val(model_year, unk_model_year).
measured(s1, model_year, season_2025_2026).
measured(s2, model_year, season_2025_2026).
all_consistent(model_year) :- consistent(s1, model_year), (indep(s2), consistent(s2, model_year) ; \+indep(s2)).
evidence(all_consistent(model_year)).
query(true_val(model_year, season_2025_2026)).
query(true_val(model_year, unk_model_year)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.95::acc(s1, product_type).
0.92::true_val(product_type, snowboard); 0.08::true_val(product_type, unk_product_type).
measured(s1, product_type, snowboard).
all_consistent(product_type) :- consistent(s1, product_type).
evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.8

0.93::acc(s1, gender).
0.88::acc(s3, gender).
0.95::true_val(gender, mens); 0.05::true_val(gender, unk_gender).
measured(s1, gender, mens).
measured(s3, gender, mens).
all_consistent(gender) :- consistent(s1, gender), consistent(s3, gender).
evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr manufacturer
% @type categorical
% @canonical false
% @original_name manufacturer
% @values amsterdam_lps=Amsterdam_Netherlands_Low_Pressure_Studio unk_manufacturer=Unknown
% @importance 0.4

0.85::acc(s18, manufacturer).
0.80::acc(s19, manufacturer).
0.90::true_val(manufacturer, amsterdam_lps); 0.10::true_val(manufacturer, unk_manufacturer).
measured(s18, manufacturer, amsterdam_lps).
measured(s19, manufacturer, amsterdam_lps).
all_consistent(manufacturer) :- consistent(s18, manufacturer), consistent(s19, manufacturer).
evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, amsterdam_lps)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr brand_founded
% @type categorical
% @canonical false
% @original_name Brand founded
% @values y2000_karlsen=2000_by_biophysicist_Jorgen_Karlsen unk_brand_founded=Unknown
% @importance 0.35

0.80::acc(s20, brand_founded).
0.71::true_val(brand_founded, y2000_karlsen); 0.29::true_val(brand_founded, unk_brand_founded).
measured(s20, brand_founded, y2000_karlsen).
all_consistent(brand_founded) :- consistent(s20, brand_founded).
evidence(all_consistent(brand_founded)).
query(true_val(brand_founded, y2000_karlsen)).
query(true_val(brand_founded, unk_brand_founded)).

% @attr brand_cofounders
% @type categorical
% @canonical false
% @original_name Brand co-founders (current operators)
% @values dusseldorp_kiebert=Dennis_Dusseldorp_and_Danny_Kiebert unk_brand_cofounders=Unknown
% @importance 0.4

0.85::acc(s18, brand_cofounders).
0.80::acc(s19, brand_cofounders).
0.90::true_val(brand_cofounders, dusseldorp_kiebert); 0.10::true_val(brand_cofounders, unk_brand_cofounders).
measured(s18, brand_cofounders, dusseldorp_kiebert).
measured(s19, brand_cofounders, dusseldorp_kiebert).
all_consistent(brand_cofounders) :- consistent(s18, brand_cofounders), consistent(s19, brand_cofounders).
evidence(all_consistent(brand_cofounders)).
query(true_val(brand_cofounders, dusseldorp_kiebert)).
query(true_val(brand_cofounders, unk_brand_cofounders)).

% @attr parent_company
% @type categorical
% @canonical false
% @original_name Parent company
% @values lps_nidecker=Low_Pressure_Studio_majority_owned_by_Nidecker_Group unk_parent_company=Unknown
% @importance 0.325

0.82::acc(s21, parent_company).
0.88::acc(s22, parent_company).
0.90::true_val(parent_company, lps_nidecker); 0.10::true_val(parent_company, unk_parent_company).
measured(s21, parent_company, lps_nidecker).
measured(s22, parent_company, lps_nidecker).
all_consistent(parent_company) :- consistent(s21, parent_company), consistent(s22, parent_company).
evidence(all_consistent(parent_company)).
query(true_val(parent_company, lps_nidecker)).
query(true_val(parent_company, unk_parent_company)).

% @attr nidecker_group_description
% @type categorical
% @canonical false
% @original_name Nidecker Group description
% @values family_swiss_second_biggest=Family_owned_Swiss_second_biggest_snowboard_company unk_nidecker_group_description=Unknown
% @importance 0.35

0.78::acc(s21, nidecker_group_description).
0.63::true_val(nidecker_group_description, family_swiss_second_biggest); 0.37::true_val(nidecker_group_description, unk_nidecker_group_description).
measured(s21, nidecker_group_description, family_swiss_second_biggest).
all_consistent(nidecker_group_description) :- consistent(s21, nidecker_group_description).
evidence(all_consistent(nidecker_group_description)).
query(true_val(nidecker_group_description, family_swiss_second_biggest)).
query(true_val(nidecker_group_description, unk_nidecker_group_description)).

% @attr brand_philosophy_slogan
% @type categorical
% @canonical false
% @original_name Brand philosophy slogan
% @values smile_its_snowboarding=Smile_its_Snowboarding unk_brand_philosophy_slogan=Unknown
% @importance 0.4

0.78::acc(s19, brand_philosophy_slogan).
0.64::true_val(brand_philosophy_slogan, smile_its_snowboarding); 0.36::true_val(brand_philosophy_slogan, unk_brand_philosophy_slogan).
measured(s19, brand_philosophy_slogan, smile_its_snowboarding).
all_consistent(brand_philosophy_slogan) :- consistent(s19, brand_philosophy_slogan).
evidence(all_consistent(brand_philosophy_slogan)).
query(true_val(brand_philosophy_slogan, smile_its_snowboarding)).
query(true_val(brand_philosophy_slogan, unk_brand_philosophy_slogan)).

% @attr brand_age
% @type categorical
% @canonical false
% @original_name Brand age
% @values over_20_years=Over_20_years unk_brand_age=Unknown
% @importance 0.3

0.88::acc(s23, brand_age).
0.81::true_val(brand_age, over_20_years); 0.19::true_val(brand_age, unk_brand_age).
measured(s23, brand_age, over_20_years).
all_consistent(brand_age) :- consistent(s23, brand_age).
evidence(all_consistent(brand_age)).
query(true_val(brand_age, over_20_years)).
query(true_val(brand_age, unk_brand_age)).

% @attr design_location
% @type categorical
% @canonical false
% @original_name Design location
% @values lps_amsterdam=Low_Pressure_Studio_Amsterdam unk_design_location=Unknown
% @importance 0.5

0.75::acc(s24, design_location).
0.45::true_val(design_location, lps_amsterdam); 0.55::true_val(design_location, unk_design_location).
measured(s24, design_location, lps_amsterdam).
all_consistent(design_location) :- consistent(s24, design_location).
evidence(all_consistent(design_location)).
query(true_val(design_location, lps_amsterdam)).
query(true_val(design_location, unk_design_location)).

% @attr manufacturing_location_prior
% @type categorical
% @canonical true
% @original_name manufacturing_location_prior
% @values elan_austria=Elan_factory_Feistritz_Austria unk_manufacturing_location_prior=Unknown
% @importance 0.4

0.80::acc(s25, manufacturing_location_prior).
0.68::true_val(manufacturing_location_prior, elan_austria); 0.32::true_val(manufacturing_location_prior, unk_manufacturing_location_prior).
measured(s25, manufacturing_location_prior, elan_austria).
all_consistent(manufacturing_location_prior) :- consistent(s25, manufacturing_location_prior).
evidence(all_consistent(manufacturing_location_prior)).
query(true_val(manufacturing_location_prior, elan_austria)).
query(true_val(manufacturing_location_prior, unk_manufacturing_location_prior)).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values titan_china=Titan_Factory_China unresolved_multiple=Unresolved_multiple_moves unk_manufacturing_location_current=Unknown
% @importance 0.5

0.65::acc(s24, manufacturing_location_current).
0.60::acc(s26, manufacturing_location_current).
0.40::true_val(manufacturing_location_current, titan_china); 0.45::true_val(manufacturing_location_current, unresolved_multiple); 0.15::true_val(manufacturing_location_current, unk_manufacturing_location_current).
measured(s24, manufacturing_location_current, titan_china).
measured(s26, manufacturing_location_current, unresolved_multiple).
all_consistent(manufacturing_location_current) :- consistent(s24, manufacturing_location_current), (indep(s34), consistent(s26, manufacturing_location_current) ; \+indep(s34)).
evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, titan_china)).
query(true_val(manufacturing_location_current, unresolved_multiple)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2025=2025_season unk_model_first_available_year=Unknown
% @importance 0.7

0.82::acc(s27, model_first_available_year).
0.67::true_val(model_first_available_year, season_2025); 0.33::true_val(model_first_available_year, unk_model_first_available_year).
measured(s27, model_first_available_year, season_2025).
all_consistent(model_first_available_year) :- consistent(s27, model_first_available_year).
evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2025)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values none_all_new=None_all_new unk_predecessor_model_name=Unknown
% @importance 0.7

0.82::acc(s27, predecessor_model_name).
0.67::true_val(predecessor_model_name, none_all_new); 0.33::true_val(predecessor_model_name, unk_predecessor_model_name).
measured(s27, predecessor_model_name, none_all_new).
all_consistent(predecessor_model_name) :- consistent(s27, predecessor_model_name).
evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, none_all_new)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values two_plus_one_year=2_plus_1_year_warranty unk_warranty=Unknown
% @importance 1.0

0.94::acc(s1, warranty).
0.92::true_val(warranty, two_plus_one_year); 0.08::true_val(warranty, unk_warranty).
measured(s1, warranty, two_plus_one_year).
all_consistent(warranty) :- consistent(s1, warranty).
evidence(all_consistent(warranty)).
query(true_val(warranty, two_plus_one_year)).
query(true_val(warranty, unk_warranty)).

% @attr return_policy_terms
% @type categorical
% @canonical true
% @original_name return_policy_terms
% @values fortyfive_day=45_day_returns unk_return_policy_terms=Unknown
% @importance 1.0

0.94::acc(s1, return_policy_terms).
0.92::true_val(return_policy_terms, fortyfive_day); 0.08::true_val(return_policy_terms, unk_return_policy_terms).
measured(s1, return_policy_terms, fortyfive_day).
all_consistent(return_policy_terms) :- consistent(s1, return_policy_terms).
evidence(all_consistent(return_policy_terms)).
query(true_val(return_policy_terms, fortyfive_day)).
query(true_val(return_policy_terms, unk_return_policy_terms)).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v689_95=689.95 unk_price_usd_msrp=Unknown
% @importance 1.0

0.95::acc(s1, price_usd_msrp).
0.92::true_val(price_usd_msrp, v689_95); 0.08::true_val(price_usd_msrp, unk_price_usd_msrp).
measured(s1, price_usd_msrp, v689_95).
all_consistent(price_usd_msrp) :- consistent(s1, price_usd_msrp).
evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v689_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_evo
% @values v389_97=389.97 unk_price_usd_evo=Unknown
% @importance 0.95

0.88::acc(s2, price_usd_evo).
0.77::true_val(price_usd_evo, v389_97); 0.23::true_val(price_usd_evo, unk_price_usd_evo).
measured(s2, price_usd_evo, v389_97).
all_consistent(price_usd_evo) :- consistent(s2, price_usd_evo).
evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v389_97)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_evo_full
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_evo (full/RRP)
% @values v689_95=689.95 unk_price_usd_evo_full=Unknown
% @importance 0.95

0.88::acc(s2, price_usd_evo_full).
0.77::true_val(price_usd_evo_full, v689_95); 0.23::true_val(price_usd_evo_full, unk_price_usd_evo_full).
measured(s2, price_usd_evo_full, v689_95).
all_consistent(price_usd_evo_full) :- consistent(s2, price_usd_evo_full).
evidence(all_consistent(price_usd_evo_full)).
query(true_val(price_usd_evo_full, v689_95)).
query(true_val(price_usd_evo_full, unk_price_usd_evo_full)).

% @attr price_usd_freeride
% @type numeric
% @unit USD
% @canonical false
% @original_name Price (Freeride Boardshop, Canada, sale)
% @values v476=476.0 unk_price_usd_freeride=Unknown
% @importance 0.85

0.82::acc(s28, price_usd_freeride).
0.60::true_val(price_usd_freeride, v476); 0.40::true_val(price_usd_freeride, unk_price_usd_freeride).
measured(s28, price_usd_freeride, v476).
all_consistent(price_usd_freeride) :- consistent(s28, price_usd_freeride).
evidence(all_consistent(price_usd_freeride)).
query(true_val(price_usd_freeride, v476)).
query(true_val(price_usd_freeride, unk_price_usd_freeride)).

% @attr price_usd_s2as
% @type numeric
% @unit USD
% @canonical false
% @original_name Price (S2AS UK-based, USD sale)
% @values v458=458.0 unk_price_usd_s2as=Unknown
% @importance 0.85

0.82::acc(s29, price_usd_s2as).
0.68::true_val(price_usd_s2as, v458); 0.32::true_val(price_usd_s2as, unk_price_usd_s2as).
measured(s29, price_usd_s2as, v458).
all_consistent(price_usd_s2as) :- consistent(s29, price_usd_s2as).
evidence(all_consistent(price_usd_s2as)).
query(true_val(price_usd_s2as, v458)).
query(true_val(price_usd_s2as, unk_price_usd_s2as)).

% @attr price_gbp_glisshop
% @type numeric
% @unit GBP
% @canonical false
% @original_name Price (Glisshop UK, GBP)
% @values v584_91=584.91 unk_price_gbp_glisshop=Unknown
% @importance 0.7

0.80::acc(s30, price_gbp_glisshop).
0.60::true_val(price_gbp_glisshop, v584_91); 0.40::true_val(price_gbp_glisshop, unk_price_gbp_glisshop).
measured(s30, price_gbp_glisshop, v584_91).
all_consistent(price_gbp_glisshop) :- consistent(s30, price_gbp_glisshop).
evidence(all_consistent(price_gbp_glisshop)).
query(true_val(price_gbp_glisshop, v584_91)).
query(true_val(price_gbp_glisshop, unk_price_gbp_glisshop)).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v919_99=919.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.95::acc(s_m, price_aud_merchant).
0.95::true_val(price_aud_merchant, v919_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).
measured(s_m, price_aud_merchant, v919_99).
all_consistent(price_aud_merchant) :- consistent(s_m, price_aud_merchant).
evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v919_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_eriks
% @type categorical
% @canonical false
% @original_name Price (ERIK'S)
% @values not_listed_bundle_discount=Not_listed_10pct_bundle_discount unk_price_eriks=Unknown
% @importance 0.7

0.75::acc(s31, price_eriks).
0.56::true_val(price_eriks, not_listed_bundle_discount); 0.44::true_val(price_eriks, unk_price_eriks).
measured(s31, price_eriks, not_listed_bundle_discount).
all_consistent(price_eriks) :- consistent(s31, price_eriks).
evidence(all_consistent(price_eriks)).
query(true_val(price_eriks, not_listed_bundle_discount)).
query(true_val(price_eriks, unk_price_eriks)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values most_sold_out_some_stock=Most_sizes_sold_out_some_in_stock unk_availability_status=Unknown
% @importance 1.0

0.93::acc(s1, availability_status).
0.92::true_val(availability_status, most_sold_out_some_stock); 0.08::true_val(availability_status, unk_availability_status).
measured(s1, availability_status, most_sold_out_some_stock).
all_consistent(availability_status) :- consistent(s1, availability_status).
evidence(all_consistent(availability_status)).
query(true_val(availability_status, most_sold_out_some_stock)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status (evo)
% @values in_stock=In_stock unk_availability_status_evo=Unknown
% @importance 0.95

0.85::acc(s2, availability_status_evo).
0.77::true_val(availability_status_evo, in_stock); 0.23::true_val(availability_status_evo, unk_availability_status_evo).
measured(s2, availability_status_evo, in_stock).
all_consistent(availability_status_evo) :- consistent(s2, availability_status_evo).
evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, in_stock)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

% @attr availability_status_eriks
% @type categorical
% @canonical false
% @original_name availability_status (ERIK'S)
% @values available_to_ship=Available_to_ship_4_to_9_days unk_availability_status_eriks=Unknown
% @importance 0.7

0.75::acc(s31, availability_status_eriks).
0.56::true_val(availability_status_eriks, available_to_ship); 0.44::true_val(availability_status_eriks, unk_availability_status_eriks).
measured(s31, availability_status_eriks, available_to_ship).
all_consistent(availability_status_eriks) :- consistent(s31, availability_status_eriks).
evidence(all_consistent(availability_status_eriks)).
query(true_val(availability_status_eriks, available_to_ship)).
query(true_val(availability_status_eriks, unk_availability_status_eriks)).

% @attr availability_status_s2as
% @type categorical
% @canonical false
% @original_name availability_status (S2AS)
% @values sizes_159_161w=159_and_161W_remaining unk_availability_status_s2as=Unknown
% @importance 0.85

0.82::acc(s29, availability_status_s2as).
0.68::true_val(availability_status_s2as, sizes_159_161w); 0.32::true_val(availability_status_s2as, unk_availability_status_s2as).
measured(s29, availability_status_s2as, sizes_159_161w).
all_consistent(availability_status_s2as) :- consistent(s29, availability_status_s2as).
evidence(all_consistent(availability_status_s2as)).
query(true_val(availability_status_s2as, sizes_159_161w)).
query(true_val(availability_status_s2as, unk_availability_status_s2as)).

% @attr availability_status_glisshop
% @type categorical
% @canonical false
% @original_name availability_status (Glisshop)
% @values sizes_156_159_161w_167w=156_159_161W_167W_in_stock unk_availability_status_glisshop=Unknown
% @importance 0.7

0.80::acc(s30, availability_status_glisshop).
0.60::true_val(availability_status_glisshop, sizes_156_159_161w_167w); 0.40::true_val(availability_status_glisshop, unk_availability_status_glisshop).
measured(s30, availability_status_glisshop, sizes_156_159_161w_167w).
all_consistent(availability_status_glisshop) :- consistent(s30, availability_status_glisshop).
evidence(all_consistent(availability_status_glisshop)).
query(true_val(availability_status_glisshop, sizes_156_159_161w_167w)).
query(true_val(availability_status_glisshop, unk_availability_status_glisshop)).

% @attr availability_status_freeride
% @type categorical
% @canonical false
% @original_name availability_status (Freeride)
% @values listed=Listed unk_availability_status_freeride=Unknown
% @importance 0.85

0.80::acc(s28, availability_status_freeride).
0.60::true_val(availability_status_freeride, listed); 0.40::true_val(availability_status_freeride, unk_availability_status_freeride).
measured(s28, availability_status_freeride, listed).
all_consistent(availability_status_freeride) :- consistent(s28, availability_status_freeride).
evidence(all_consistent(availability_status_freeride)).
query(true_val(availability_status_freeride, listed)).
query(true_val(availability_status_freeride, unk_availability_status_freeride)).

% @attr availability_status_absolute_snow
% @type categorical
% @canonical false
% @original_name availability_status (Absolute-Snow)
% @values listed=Listed unk_availability_status_absolute_snow=Unknown
% @importance 0.65

0.78::acc(s32, availability_status_absolute_snow).
0.64::true_val(availability_status_absolute_snow, listed); 0.36::true_val(availability_status_absolute_snow, unk_availability_status_absolute_snow).
measured(s32, availability_status_absolute_snow, listed).
all_consistent(availability_status_absolute_snow) :- consistent(s32, availability_status_absolute_snow).
evidence(all_consistent(availability_status_absolute_snow)).
query(true_val(availability_status_absolute_snow, listed)).
query(true_val(availability_status_absolute_snow, unk_availability_status_absolute_snow)).

% @attr availability_status_secondhand
% @type categorical
% @canonical false
% @original_name availability_status (second-hand)
% @values secondhand_listed=Second_hand_listing_seen unk_availability_status_secondhand=Unknown
% @importance 0.5

0.65::acc(s33, availability_status_secondhand).
0.44::true_val(availability_status_secondhand, secondhand_listed); 0.56::true_val(availability_status_secondhand, unk_availability_status_secondhand).
measured(s33, availability_status_secondhand, secondhand_listed).
all_consistent(availability_status_secondhand) :- consistent(s33, availability_status_secondhand).
evidence(all_consistent(availability_status_secondhand)).
query(true_val(availability_status_secondhand, secondhand_listed)).
query(true_val(availability_status_secondhand, unk_availability_status_secondhand)).

% @attr availability_status_stoked
% @type categorical
% @canonical false
% @original_name availability_status (Stoked Boardshop)
% @values listed=Listed unk_availability_status_stoked=Unknown
% @importance 0.6

0.70::acc(s34, availability_status_stoked).
0.35::true_val(availability_status_stoked, listed); 0.65::true_val(availability_status_stoked, unk_availability_status_stoked).
measured(s34, availability_status_stoked, listed).
all_consistent(availability_status_stoked) :- consistent(s34, availability_status_stoked).
evidence(all_consistent(availability_status_stoked)).
query(true_val(availability_status_stoked, listed)).
query(true_val(availability_status_stoked, unk_availability_status_stoked)).

% @attr availability_status_snowboards_eu
% @type categorical
% @canonical false
% @original_name availability_status (snowboards.eu)
% @values listed=Listed unk_availability_status_snowboards_eu=Unknown
% @importance 0.65

0.72::acc(s35, availability_status_snowboards_eu).
0.44::true_val(availability_status_snowboards_eu, listed); 0.56::true_val(availability_status_snowboards_eu, unk_availability_status_snowboards_eu).
measured(s35, availability_status_snowboards_eu, listed).
all_consistent(availability_status_snowboards_eu) :- consistent(s35, availability_status_snowboards_eu).
evidence(all_consistent(availability_status_snowboards_eu)).
query(true_val(availability_status_snowboards_eu, listed)).
query(true_val(availability_status_snowboards_eu, unk_availability_status_snowboards_eu)).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status (Blauer, 2025 model)
% @values listed_2025=Listed_2025_model unk_availability_status_blauer=Unknown
% @importance 0.7

0.70::acc(s36, availability_status_blauer).
0.49::true_val(availability_status_blauer, listed_2025); 0.51::true_val(availability_status_blauer, unk_availability_status_blauer).
measured(s36, availability_status_blauer, listed_2025).
all_consistent(availability_status_blauer) :- consistent(s36, availability_status_blauer).
evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, listed_2025)).
query(true_val(availability_status_blauer, unk_availability_status_blauer)).

% @attr shipping_restriction_merchant
% @type categorical
% @canonical false
% @original_name Shipping restriction (Merchant)
% @values australia_only=Only_available_for_shipping_within_Australia unk_shipping_restriction_merchant=Unknown
% @importance 0.85

0.95::acc(s_m, shipping_restriction_merchant).
0.95::true_val(shipping_restriction_merchant, australia_only); 0.05::true_val(shipping_restriction_merchant, unk_shipping_restriction_merchant).
measured(s_m, shipping_restriction_merchant, australia_only).
all_consistent(shipping_restriction_merchant) :- consistent(s_m, shipping_restriction_merchant).
evidence(all_consistent(shipping_restriction_merchant)).
query(true_val(shipping_restriction_merchant, australia_only)).
query(true_val(shipping_restriction_merchant, unk_shipping_restriction_merchant)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain_freestyle=All_Mountain_Freestyle unk_board_category=Unknown
% @importance 0.925

0.94::acc(s1, board_category).
0.92::acc(s_m, board_category).
0.95::true_val(board_category, all_mountain_freestyle); 0.05::true_val(board_category, unk_board_category).
measured(s1, board_category, all_mountain_freestyle).
measured(s_m, board_category, all_mountain_freestyle).
all_consistent(board_category) :- consistent(s1, board_category), (indep(s_m), consistent(s_m, board_category) ; \+indep(s_m)).
evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain_freestyle)).
query(true_val(board_category, unk_board_category)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values advanced_expert=Advanced_Expert unk_rider_level=Unknown
% @importance 0.85

0.94::acc(s1, rider_level).
0.80::acc(s30, rider_level).
0.95::true_val(rider_level, advanced_expert); 0.05::true_val(rider_level, unk_rider_level).
measured(s1, rider_level, advanced_expert).
measured(s30, rider_level, advanced_expert).
all_consistent(rider_level) :- consistent(s1, rider_level), (indep(s30), consistent(s30, rider_level) ; \+indep(s30)).
evidence(all_consistent(rider_level)).
query(true_val(rider_level, advanced_expert)).
query(true_val(rider_level, unk_rider_level)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values bold_experienced_pro=Bold_experienced_riders_and_pro_team unk_skill_level_recommendation=Unknown
% @importance 1.0

0.90::acc(s1, skill_level_recommendation).
0.92::true_val(skill_level_recommendation, bold_experienced_pro); 0.08::true_val(skill_level_recommendation, unk_skill_level_recommendation).
measured(s1, skill_level_recommendation, bold_experienced_pro).
all_consistent(skill_level_recommendation) :- consistent(s1, skill_level_recommendation).
evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, bold_experienced_pro)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values park_resort_natural_powder=Park_resort_natural_terrain_powder unk_terrain_suitability=Unknown
% @importance 0.87

0.92::acc(s1, terrain_suitability).
0.90::acc(s_m, terrain_suitability).
0.70::acc(s34, terrain_suitability).
0.95::true_val(terrain_suitability, park_resort_natural_powder); 0.05::true_val(terrain_suitability, unk_terrain_suitability).
measured(s1, terrain_suitability, park_resort_natural_powder).
measured(s_m, terrain_suitability, park_resort_natural_powder).
measured(s34, terrain_suitability, park_resort_natural_powder).
all_consistent(terrain_suitability) :- consistent(s1, terrain_suitability), (indep(s_m), consistent(s_m, terrain_suitability) ; \+indep(s_m)), (indep(s34), consistent(s34, terrain_suitability) ; \+indep(s34)).
evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, park_resort_natural_powder)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr riding_style
% @type categorical
% @canonical false
% @original_name riding_style
% @values am_freestyle_carving=All_Mountain_Freestyle_aggressive_carving unk_riding_style=Unknown
% @importance 0.85

0.92::acc(s_m, riding_style).
0.95::true_val(riding_style, am_freestyle_carving); 0.05::true_val(riding_style, unk_riding_style).
measured(s_m, riding_style, am_freestyle_carving).
all_consistent(riding_style) :- consistent(s_m, riding_style).
evidence(all_consistent(riding_style)).
query(true_val(riding_style, am_freestyle_carving)).
query(true_val(riding_style, unk_riding_style)).

% @attr pro_team_board
% @type categorical
% @canonical false
% @original_name Pro team board
% @values yes=Yes_top_choice_of_pro_team unk_pro_team_board=Unknown
% @importance 1.0

0.88::acc(s1, pro_team_board).
0.92::true_val(pro_team_board, yes); 0.08::true_val(pro_team_board, unk_pro_team_board).
measured(s1, pro_team_board, yes).
all_consistent(pro_team_board) :- consistent(s1, pro_team_board).
evidence(all_consistent(pro_team_board)).
query(true_val(pro_team_board, yes)).
query(true_val(pro_team_board, unk_pro_team_board)).

% @attr float_ratio
% @type numeric
% @unit /100
% @canonical false
% @original_name Float ratio
% @values v65=65.0 unk_float_ratio=Unknown
% @importance 0.75

0.80::acc(s29, float_ratio).
0.75::acc(s35, float_ratio).
0.90::true_val(float_ratio, v65); 0.10::true_val(float_ratio, unk_float_ratio).
measured(s29, float_ratio, v65).
measured(s35, float_ratio, v65).
all_consistent(float_ratio) :- (indep(s29), consistent(s29, float_ratio) ; \+indep(s29)), (indep(s35), consistent(s35, float_ratio) ; \+indep(s35)).
evidence(all_consistent(float_ratio)).
query(true_val(float_ratio, v65)).
query(true_val(float_ratio, unk_float_ratio)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values directional_twin=Directional_Twin unk_shape=Unknown
% @importance 0.87

0.95::acc(s1, shape).
0.93::acc(s_m, shape).
0.90::acc(s37, shape).
0.95::true_val(shape, directional_twin); 0.05::true_val(shape, unk_shape).
measured(s1, shape, directional_twin).
measured(s_m, shape, directional_twin).
measured(s37, shape, directional_twin).
all_consistent(shape) :- consistent(s1, shape), (indep(s_m), consistent(s_m, shape) ; \+indep(s_m)), (indep(s37), consistent(s37, shape) ; \+indep(s37)).
evidence(all_consistent(shape)).
query(true_val(shape, directional_twin)).
query(true_val(shape, unk_shape)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values medium_camber_3bt=Medium_Camber_with_3BT_and_SideKick high_camber=High_Camber
% @importance 0.9

0.95::acc(s1, camber_type).
0.92::acc(s_m, camber_type).
0.80::acc(s2, camber_type).
0.70::acc(s36, camber_type).
0.72::acc(s33, camber_type).
0.65::true_val(camber_type, medium_camber_3bt); 0.35::true_val(camber_type, high_camber).
measured(s1, camber_type, medium_camber_3bt).
measured(s_m, camber_type, medium_camber_3bt).
measured(s33, camber_type, medium_camber_3bt).
measured(s2, camber_type, high_camber).
measured(s36, camber_type, high_camber).
all_consistent(camber_type) :- consistent(s1, camber_type), (indep(s_m), consistent(s_m, camber_type) ; \+indep(s_m)), consistent(s2, camber_type), (indep(s33), consistent(s33, camber_type) ; \+indep(s33)), (indep(s36), consistent(s36, camber_type) ; \+indep(s36)).
evidence(all_consistent(camber_type)).
query(true_val(camber_type, medium_camber_3bt)).
query(true_val(camber_type, high_camber)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values triple_base_sidekick=3BT_Triple_Base_Technology_plus_SideKick unk_camber_description=Unknown
% @importance 1.0

0.94::acc(s1, camber_description).
0.92::true_val(camber_description, triple_base_sidekick); 0.08::true_val(camber_description, unk_camber_description).
measured(s1, camber_description, triple_base_sidekick).
all_consistent(camber_description) :- consistent(s1, camber_description).
evidence(all_consistent(camber_description)).
query(true_val(camber_description, triple_base_sidekick)).
query(true_val(camber_description, unk_camber_description)).

% @attr camber_description_function
% @type categorical
% @canonical false
% @original_name camber_description (function)
% @values positive_camber_lifted_sidebase=Positive_camber_and_lifted_sidebase_reduces_edge_catch unk_camber_description_function=Unknown
% @importance 1.0

0.92::acc(s1, camber_description_function).
0.92::true_val(camber_description_function, positive_camber_lifted_sidebase); 0.08::true_val(camber_description_function, unk_camber_description_function).
measured(s1, camber_description_function, positive_camber_lifted_sidebase).
all_consistent(camber_description_function) :- consistent(s1, camber_description_function).
evidence(all_consistent(camber_description_function)).
query(true_val(camber_description_function, positive_camber_lifted_sidebase)).
query(true_val(camber_description_function, unk_camber_description_function)).

% @attr camber_description_sidekick
% @type categorical
% @canonical false
% @original_name camber_description (SideKick)
% @values hull_shape_float_turn=Hull_like_shape_enhances_float_and_turn_initiation unk_camber_description_sidekick=Unknown
% @importance 1.0

0.92::acc(s1, camber_description_sidekick).
0.92::true_val(camber_description_sidekick, hull_shape_float_turn); 0.08::true_val(camber_description_sidekick, unk_camber_description_sidekick).
measured(s1, camber_description_sidekick, hull_shape_float_turn).
all_consistent(camber_description_sidekick) :- consistent(s1, camber_description_sidekick).
evidence(all_consistent(camber_description_sidekick)).
query(true_val(camber_description_sidekick, hull_shape_float_turn)).
query(true_val(camber_description_sidekick, unk_camber_description_sidekick)).

% @attr camber_description_uplift
% @type categorical
% @canonical false
% @original_name camber_description (nose/tail uplift)
% @values low=Low unk_camber_description_uplift=Unknown
% @importance 0.925

0.94::acc(s1, camber_description_uplift).
0.92::acc(s_m, camber_description_uplift).
0.95::true_val(camber_description_uplift, low); 0.05::true_val(camber_description_uplift, unk_camber_description_uplift).
measured(s1, camber_description_uplift, low).
measured(s_m, camber_description_uplift, low).
all_consistent(camber_description_uplift) :- consistent(s1, camber_description_uplift), (indep(s_m), consistent(s_m, camber_description_uplift) ; \+indep(s_m)).
evidence(all_consistent(camber_description_uplift)).
query(true_val(camber_description_uplift, low)).
query(true_val(camber_description_uplift, unk_camber_description_uplift)).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v9=9.0 unk_flex_rating_10=Unknown
% @importance 0.925

0.95::acc(s1, flex_rating_10).
0.92::acc(s_m, flex_rating_10).
0.95::true_val(flex_rating_10, v9); 0.05::true_val(flex_rating_10, unk_flex_rating_10).
measured(s1, flex_rating_10, v9).
measured(s_m, flex_rating_10, v9).
all_consistent(flex_rating_10) :- consistent(s1, flex_rating_10), (indep(s_m), consistent(s_m, flex_rating_10) ; \+indep(s_m)).
evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v9)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

% @attr flex_direction
% @type categorical
% @canonical false
% @original_name flex_direction
% @values nose_softer_than_tail=Nose_softer_than_tail unk_flex_direction=Unknown
% @importance 0.75

0.72::acc(s38, flex_direction).
0.43::true_val(flex_direction, nose_softer_than_tail); 0.57::true_val(flex_direction, unk_flex_direction).
measured(s38, flex_direction, nose_softer_than_tail).
all_consistent(flex_direction) :- consistent(s38, flex_direction).
evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, nose_softer_than_tail)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr flex_feel
% @type categorical
% @canonical false
% @original_name flex_feel
% @values stiffest_in_lineup=Stiff_stiffest_in_Bataleon_collection unk_flex_feel=Unknown
% @importance 1.0

0.92::acc(s1, flex_feel).
0.92::true_val(flex_feel, stiffest_in_lineup); 0.08::true_val(flex_feel, unk_flex_feel).
measured(s1, flex_feel, stiffest_in_lineup).
all_consistent(flex_feel) :- consistent(s1, flex_feel).
evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, stiffest_in_lineup)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name reviewer_opinion_snowboardingprofiles
% @values not_9_still_stiff=Would_not_rate_9_10_but_still_seriously_stiff unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.9

0.85::acc(s39, reviewer_opinion_snowboardingprofiles).
0.69::true_val(reviewer_opinion_snowboardingprofiles, not_9_still_stiff); 0.31::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).
measured(s39, reviewer_opinion_snowboardingprofiles, not_9_still_stiff).
all_consistent(reviewer_opinion_snowboardingprofiles) :- consistent(s39, reviewer_opinion_snowboardingprofiles).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, not_9_still_stiff)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

% @attr reviewer_opinion_snowboardingprofiles_ranking
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (ranking)
% @values num4_aggressive_am=Ranked_4_on_Top_Aggressive_All_Mountain_2025_2026 unk_reviewer_opinion_snowboardingprofiles_ranking=Unknown
% @importance 0.9

0.85::acc(s39, reviewer_opinion_snowboardingprofiles_ranking).
0.69::true_val(reviewer_opinion_snowboardingprofiles_ranking, num4_aggressive_am); 0.31::true_val(reviewer_opinion_snowboardingprofiles_ranking, unk_reviewer_opinion_snowboardingprofiles_ranking).
measured(s39, reviewer_opinion_snowboardingprofiles_ranking, num4_aggressive_am).
all_consistent(reviewer_opinion_snowboardingprofiles_ranking) :- consistent(s39, reviewer_opinion_snowboardingprofiles_ranking).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles_ranking)).
query(true_val(reviewer_opinion_snowboardingprofiles_ranking, num4_aggressive_am)).
query(true_val(reviewer_opinion_snowboardingprofiles_ranking, unk_reviewer_opinion_snowboardingprofiles_ranking)).

% @attr reviewer_opinion_snowboardingprofiles_ease
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (ease)
% @values less_work_than_typical=Does_not_make_you_work_as_hard_as_typical_stiff_board unk_reviewer_opinion_snowboardingprofiles_ease=Unknown
% @importance 0.9

0.85::acc(s39, reviewer_opinion_snowboardingprofiles_ease).
0.69::true_val(reviewer_opinion_snowboardingprofiles_ease, less_work_than_typical); 0.31::true_val(reviewer_opinion_snowboardingprofiles_ease, unk_reviewer_opinion_snowboardingprofiles_ease).
measured(s39, reviewer_opinion_snowboardingprofiles_ease, less_work_than_typical).
all_consistent(reviewer_opinion_snowboardingprofiles_ease) :- consistent(s39, reviewer_opinion_snowboardingprofiles_ease).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles_ease)).
query(true_val(reviewer_opinion_snowboardingprofiles_ease, less_work_than_typical)).
query(true_val(reviewer_opinion_snowboardingprofiles_ease, unk_reviewer_opinion_snowboardingprofiles_ease)).

% @attr reviewer_opinion_snowboardingprofiles_debut
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (debut)
% @values debuted_25_line=Debuted_with_25_line_confirming_first_year unk_reviewer_opinion_snowboardingprofiles_debut=Unknown
% @importance 0.9

0.85::acc(s39, reviewer_opinion_snowboardingprofiles_debut).
0.69::true_val(reviewer_opinion_snowboardingprofiles_debut, debuted_25_line); 0.31::true_val(reviewer_opinion_snowboardingprofiles_debut, unk_reviewer_opinion_snowboardingprofiles_debut).
measured(s39, reviewer_opinion_snowboardingprofiles_debut, debuted_25_line).
all_consistent(reviewer_opinion_snowboardingprofiles_debut) :- consistent(s39, reviewer_opinion_snowboardingprofiles_debut).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles_debut)).
query(true_val(reviewer_opinion_snowboardingprofiles_debut, debuted_25_line)).
query(true_val(reviewer_opinion_snowboardingprofiles_debut, unk_reviewer_opinion_snowboardingprofiles_debut)).

% @attr laminate
% @type categorical
% @canonical false
% @original_name laminate
% @values tri_ax_fiberglass=Tri_Ax_fiberglass_three_way_weave unk_laminate=Unknown
% @importance 0.975

0.94::acc(s1, laminate).
0.85::acc(s2, laminate).
0.95::true_val(laminate, tri_ax_fiberglass); 0.05::true_val(laminate, unk_laminate).
measured(s1, laminate, tri_ax_fiberglass).
measured(s2, laminate, tri_ax_fiberglass).
all_consistent(laminate) :- consistent(s1, laminate), (indep(s2), consistent(s2, laminate) ; \+indep(s2)).
evidence(all_consistent(laminate)).
query(true_val(laminate, tri_ax_fiberglass)).
query(true_val(laminate, unk_laminate)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values carbon_stringers=Carbon_stringers_strategically_placed unk_construction_material_innovation=Unknown
% @importance 0.975

0.94::acc(s1, construction_material_innovation).
0.85::acc(s2, construction_material_innovation).
0.95::true_val(construction_material_innovation, carbon_stringers); 0.05::true_val(construction_material_innovation, unk_construction_material_innovation).
measured(s1, construction_material_innovation, carbon_stringers).
measured(s2, construction_material_innovation, carbon_stringers).
all_consistent(construction_material_innovation) :- consistent(s1, construction_material_innovation), (indep(s2), consistent(s2, construction_material_innovation) ; \+indep(s2)).
evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, carbon_stringers)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr construction_material_innovation_supertubes
% @type categorical
% @canonical false
% @original_name construction_material_innovation (SuperTubes)
% @values drst_carbon_cylinders=DRST_six_hollow_carbon_cylinders_along_sidecut unk_construction_material_innovation_supertubes=Unknown
% @importance 0.925

0.94::acc(s1, construction_material_innovation_supertubes).
0.92::acc(s_m, construction_material_innovation_supertubes).
0.85::acc(s2, construction_material_innovation_supertubes).
0.95::true_val(construction_material_innovation_supertubes, drst_carbon_cylinders); 0.05::true_val(construction_material_innovation_supertubes, unk_construction_material_innovation_supertubes).
measured(s1, construction_material_innovation_supertubes, drst_carbon_cylinders).
measured(s_m, construction_material_innovation_supertubes, drst_carbon_cylinders).
measured(s2, construction_material_innovation_supertubes, drst_carbon_cylinders).
all_consistent(construction_material_innovation_supertubes) :- consistent(s1, construction_material_innovation_supertubes), (indep(s_m), consistent(s_m, construction_material_innovation_supertubes) ; \+indep(s_m)), (indep(s2), consistent(s2, construction_material_innovation_supertubes) ; \+indep(s2)).
evidence(all_consistent(construction_material_innovation_supertubes)).
query(true_val(construction_material_innovation_supertubes, drst_carbon_cylinders)).
query(true_val(construction_material_innovation_supertubes, unk_construction_material_innovation_supertubes)).

% @attr construction_material_innovation_impact_plates
% @type categorical
% @canonical false
% @original_name construction_material_innovation (impact plates)
% @values impact_plates_underfoot=Impact_plates_underfoot_disperse_pressure unk_construction_material_innovation_impact_plates=Unknown
% @importance 0.925

0.94::acc(s1, construction_material_innovation_impact_plates).
0.92::acc(s_m, construction_material_innovation_impact_plates).
0.95::true_val(construction_material_innovation_impact_plates, impact_plates_underfoot); 0.05::true_val(construction_material_innovation_impact_plates, unk_construction_material_innovation_impact_plates).
measured(s1, construction_material_innovation_impact_plates, impact_plates_underfoot).
measured(s_m, construction_material_innovation_impact_plates, impact_plates_underfoot).
all_consistent(construction_material_innovation_impact_plates) :- consistent(s1, construction_material_innovation_impact_plates), (indep(s_m), consistent(s_m, construction_material_innovation_impact_plates) ; \+indep(s_m)).
evidence(all_consistent(construction_material_innovation_impact_plates)).
query(true_val(construction_material_innovation_impact_plates, impact_plates_underfoot)).
query(true_val(construction_material_innovation_impact_plates, unk_construction_material_innovation_impact_plates)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values ultra_light_core=Ultra_Light_Core_lightest_in_range unk_core_material=Unknown
% @importance 0.8

0.94::acc(s1, core_material).
0.70::acc(s34, core_material).
0.95::true_val(core_material, ultra_light_core); 0.05::true_val(core_material, unk_core_material).
measured(s1, core_material, ultra_light_core).
measured(s34, core_material, ultra_light_core).
all_consistent(core_material) :- consistent(s1, core_material), (indep(s34), consistent(s34, core_material) ; \+indep(s34)).
evidence(all_consistent(core_material)).
query(true_val(core_material, ultra_light_core)).
query(true_val(core_material, unk_core_material)).

% @attr core_material_blend_ratio
% @type categorical
% @canonical false
% @original_name core_material_blend_ratio
% @values ratio_70_30=70_30_Paulownia_Poplar ratio_80_20=80_20_Paulownia_Poplar
% @importance 0.77

0.94::acc(s1, core_material_blend_ratio).
0.70::acc(s34, core_material_blend_ratio).
0.68::acc(s_m, core_material_blend_ratio).
0.72::acc(s35, core_material_blend_ratio).
0.60::true_val(core_material_blend_ratio, ratio_70_30); 0.40::true_val(core_material_blend_ratio, ratio_80_20).
measured(s1, core_material_blend_ratio, ratio_70_30).
measured(s34, core_material_blend_ratio, ratio_70_30).
measured(s_m, core_material_blend_ratio, ratio_80_20).
measured(s35, core_material_blend_ratio, ratio_80_20).
all_consistent(core_material_blend_ratio) :- consistent(s1, core_material_blend_ratio), (indep(s34), consistent(s34, core_material_blend_ratio) ; \+indep(s34)), (indep(s_m), consistent(s_m, core_material_blend_ratio) ; \+indep(s_m)), (indep(s35), consistent(s35, core_material_blend_ratio) ; \+indep(s35)).
evidence(all_consistent(core_material_blend_ratio)).
query(true_val(core_material_blend_ratio, ratio_70_30)).
query(true_val(core_material_blend_ratio, ratio_80_20)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values flex_walls_urethane=Flex_Walls_Urethane_Poured_Sidewalls unk_sidewall_material=Unknown
% @importance 0.975

0.94::acc(s1, sidewall_material).
0.85::acc(s2, sidewall_material).
0.95::true_val(sidewall_material, flex_walls_urethane); 0.05::true_val(sidewall_material, unk_sidewall_material).
measured(s1, sidewall_material, flex_walls_urethane).
measured(s2, sidewall_material, flex_walls_urethane).
all_consistent(sidewall_material) :- consistent(s1, sidewall_material), (indep(s2), consistent(s2, sidewall_material) ; \+indep(s2)).
evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, flex_walls_urethane)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr sidewall_material_properties
% @type categorical
% @canonical false
% @original_name sidewall_material (properties)
% @values shock_absorption=Exceptional_shock_absorption_reduces_chatter unk_sidewall_material_properties=Unknown
% @importance 0.975

0.92::acc(s1, sidewall_material_properties).
0.83::acc(s2, sidewall_material_properties).
0.95::true_val(sidewall_material_properties, shock_absorption); 0.05::true_val(sidewall_material_properties, unk_sidewall_material_properties).
measured(s1, sidewall_material_properties, shock_absorption).
measured(s2, sidewall_material_properties, shock_absorption).
all_consistent(sidewall_material_properties) :- consistent(s1, sidewall_material_properties), (indep(s2), consistent(s2, sidewall_material_properties) ; \+indep(s2)).
evidence(all_consistent(sidewall_material_properties)).
query(true_val(sidewall_material_properties, shock_absorption)).
query(true_val(sidewall_material_properties, unk_sidewall_material_properties)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values ultra_glide_s=Ultra_Glide_S_7000_grade_sintered hyper_glide_s=Hyper_Glide_S
% @importance 0.87

0.95::acc(s1, base_material).
0.85::acc(s2, base_material).
0.55::acc(s34, base_material).
0.80::true_val(base_material, ultra_glide_s); 0.20::true_val(base_material, hyper_glide_s).
measured(s1, base_material, ultra_glide_s).
measured(s2, base_material, ultra_glide_s).
measured(s34, base_material, hyper_glide_s).
all_consistent(base_material) :- consistent(s1, base_material), (indep(s2), consistent(s2, base_material) ; \+indep(s2)), (indep(s34), consistent(s34, base_material) ; \+indep(s34)).
evidence(all_consistent(base_material)).
query(true_val(base_material, ultra_glide_s)).
query(true_val(base_material, hyper_glide_s)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 0.85

0.92::acc(s_m, mounting_pattern).
0.95::true_val(mounting_pattern, inserts_2x4); 0.05::true_val(mounting_pattern, unk_mounting_pattern).
measured(s_m, mounting_pattern, inserts_2x4).
all_consistent(mounting_pattern) :- consistent(s_m, mounting_pattern).
evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr mounting_pattern_insert_count
% @type numeric
% @unit inserts
% @canonical false
% @original_name mounting_pattern (insert count)
% @values v28=28.0 v24=24.0
% @importance 0.825

0.90::acc(s1, mounting_pattern_insert_count).
0.80::acc(s32, mounting_pattern_insert_count).
0.75::acc(s_m, mounting_pattern_insert_count).
0.55::true_val(mounting_pattern_insert_count, v28); 0.45::true_val(mounting_pattern_insert_count, v24).
measured(s1, mounting_pattern_insert_count, v28).
measured(s32, mounting_pattern_insert_count, v28).
measured(s_m, mounting_pattern_insert_count, v24).
all_consistent(mounting_pattern_insert_count) :- consistent(s1, mounting_pattern_insert_count), (indep(s32), consistent(s32, mounting_pattern_insert_count) ; \+indep(s32)), (indep(s_m), consistent(s_m, mounting_pattern_insert_count) ; \+indep(s_m)).
evidence(all_consistent(mounting_pattern_insert_count)).
query(true_val(mounting_pattern_insert_count, v28)).
query(true_val(mounting_pattern_insert_count, v24)).

% @attr mounting_pattern_insert_material
% @type categorical
% @canonical false
% @original_name mounting_pattern (insert material)
% @values a_grade_german_stainless=A_grade_German_stainless_steel unk_mounting_pattern_insert_material=Unknown
% @importance 0.825

0.94::acc(s1, mounting_pattern_insert_material).
0.80::acc(s32, mounting_pattern_insert_material).
0.95::true_val(mounting_pattern_insert_material, a_grade_german_stainless); 0.05::true_val(mounting_pattern_insert_material, unk_mounting_pattern_insert_material).
measured(s1, mounting_pattern_insert_material, a_grade_german_stainless).
measured(s32, mounting_pattern_insert_material, a_grade_german_stainless).
all_consistent(mounting_pattern_insert_material) :- consistent(s1, mounting_pattern_insert_material), (indep(s32), consistent(s32, mounting_pattern_insert_material) ; \+indep(s32)).
evidence(all_consistent(mounting_pattern_insert_material)).
query(true_val(mounting_pattern_insert_material, a_grade_german_stainless)).
query(true_val(mounting_pattern_insert_material, unk_mounting_pattern_insert_material)).

% @attr additional_features
% @type categorical
% @canonical false
% @original_name Additional features
% @values step_down_rails_backseat=Step_Down_Rails_and_plus2_Backseat_Inserts unk_additional_features=Unknown
% @importance 0.65

0.78::acc(s32, additional_features).
0.64::true_val(additional_features, step_down_rails_backseat); 0.36::true_val(additional_features, unk_additional_features).
measured(s32, additional_features, step_down_rails_backseat).
all_consistent(additional_features) :- consistent(s32, additional_features).
evidence(all_consistent(additional_features)).
query(true_val(additional_features, step_down_rails_backseat)).
query(true_val(additional_features, unk_additional_features)).

% @attr factory_tuning
% @type categorical
% @canonical false
% @original_name Factory tuning
% @values factory_waxed_tuned=Factory_waxed_and_tuned unk_factory_tuning=Unknown
% @importance 0.7

0.78::acc(s30, factory_tuning).
0.60::true_val(factory_tuning, factory_waxed_tuned); 0.40::true_val(factory_tuning, unk_factory_tuning).
measured(s30, factory_tuning, factory_waxed_tuned).
all_consistent(factory_tuning) :- consistent(s30, factory_tuning).
evidence(all_consistent(factory_tuning)).
query(true_val(factory_tuning, factory_waxed_tuned)).
query(true_val(factory_tuning, unk_factory_tuning)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values cm156=156cm unk_available_sizes=Unknown
% @importance 1.0

0.95::acc(s1, available_sizes).
0.92::true_val(available_sizes, cm156); 0.08::true_val(available_sizes, unk_available_sizes).
measured(s1, available_sizes, cm156).
all_consistent(available_sizes) :- consistent(s1, available_sizes).
evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, cm156)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr effective_edge_156
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge (156cm)
% @values v1202=1202.0 unk_effective_edge_156=Unknown
% @importance 0.925

0.95::acc(s1, effective_edge_156).
0.92::acc(s_m, effective_edge_156).
0.95::true_val(effective_edge_156, v1202); 0.05::true_val(effective_edge_156, unk_effective_edge_156).
measured(s1, effective_edge_156, v1202).
measured(s_m, effective_edge_156, v1202).
all_consistent(effective_edge_156) :- consistent(s1, effective_edge_156), (indep(s_m), consistent(s_m, effective_edge_156) ; \+indep(s_m)).
evidence(all_consistent(effective_edge_156)).
query(true_val(effective_edge_156, v1202)).
query(true_val(effective_edge_156, unk_effective_edge_156)).

% @attr waist_width_156
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width (156cm)
% @values v254=254.0 unk_waist_width_156=Unknown
% @importance 0.925

0.95::acc(s1, waist_width_156).
0.92::acc(s_m, waist_width_156).
0.95::true_val(waist_width_156, v254); 0.05::true_val(waist_width_156, unk_waist_width_156).
measured(s1, waist_width_156, v254).
measured(s_m, waist_width_156, v254).
all_consistent(waist_width_156) :- consistent(s1, waist_width_156), (indep(s_m), consistent(s_m, waist_width_156) ; \+indep(s_m)).
evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v254)).
query(true_val(waist_width_156, unk_waist_width_156)).

% @attr tip_tail_width_size
% @type numeric
% @unit mm
% @canonical true
% @original_name tip_tail_width_size
% @values v297=297.0 unk_tip_tail_width_size=Unknown
% @importance 0.925

0.95::acc(s1, tip_tail_width_size).
0.92::acc(s_m, tip_tail_width_size).
0.95::true_val(tip_tail_width_size, v297); 0.05::true_val(tip_tail_width_size, unk_tip_tail_width_size).
measured(s1, tip_tail_width_size, v297).
measured(s_m, tip_tail_width_size, v297).
all_consistent(tip_tail_width_size) :- consistent(s1, tip_tail_width_size), (indep(s_m), consistent(s_m, tip_tail_width_size) ; \+indep(s_m)).
evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v297)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size
% @values v7_85=7.85 unk_sidecut_radius_size=Unknown
% @importance 0.925

0.95::acc(s1, sidecut_radius_size).
0.92::acc(s_m, sidecut_radius_size).
0.95::true_val(sidecut_radius_size, v7_85); 0.05::true_val(sidecut_radius_size, unk_sidecut_radius_size).
measured(s1, sidecut_radius_size, v7_85).
measured(s_m, sidecut_radius_size, v7_85).
all_consistent(sidecut_radius_size) :- consistent(s1, sidecut_radius_size), (indep(s_m), consistent(s_m, sidecut_radius_size) ; \+indep(s_m)).
evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_85)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr stance_width_range_size
% @type categorical
% @unit mm
% @canonical true
% @original_name stance_width_range_size
% @values r510_630=510_to_630mm unk_stance_width_range_size=Unknown
% @importance 0.925

0.95::acc(s1, stance_width_range_size).
0.92::acc(s_m, stance_width_range_size).
0.95::true_val(stance_width_range_size, r510_630); 0.05::true_val(stance_width_range_size, unk_stance_width_range_size).
measured(s1, stance_width_range_size, r510_630).
measured(s_m, stance_width_range_size, r510_630).
all_consistent(stance_width_range_size) :- consistent(s1, stance_width_range_size), (indep(s_m), consistent(s_m, stance_width_range_size) ; \+indep(s_m)).
evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, r510_630)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size
% @values r67_87=67_to_87kg unk_recommended_weight_range_size=Unknown
% @importance 0.925

0.95::acc(s1, recommended_weight_range_size).
0.92::acc(s_m, recommended_weight_range_size).
0.95::true_val(recommended_weight_range_size, r67_87); 0.05::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).
measured(s1, recommended_weight_range_size, r67_87).
measured(s_m, recommended_weight_range_size, r67_87).
all_consistent(recommended_weight_range_size) :- consistent(s1, recommended_weight_range_size), (indep(s_m), consistent(s_m, recommended_weight_range_size) ; \+indep(s_m)).
evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, r67_87)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr boot_size_range_156
% @type categorical
% @canonical false
% @original_name Boot size range (156cm)
% @values eu39_44=EU_39_44_US_7_10 unk_boot_size_range_156=Unknown
% @importance 1.0

0.95::acc(s1, boot_size_range_156).
0.92::true_val(boot_size_range_156, eu39_44); 0.08::true_val(boot_size_range_156, unk_boot_size_range_156).
measured(s1, boot_size_range_156, eu39_44).
all_consistent(boot_size_range_156) :- consistent(s1, boot_size_range_156).
evidence(all_consistent(boot_size_range_156)).
query(true_val(boot_size_range_156, eu39_44)).
query(true_val(boot_size_range_156, unk_boot_size_range_156)).

% @attr available_sizes_159
% @type categorical
% @canonical false
% @original_name available_sizes (159cm)
% @values cm159=159cm unk_available_sizes_159=Unknown
% @importance 1.0

0.95::acc(s1, available_sizes_159).
0.92::true_val(available_sizes_159, cm159); 0.08::true_val(available_sizes_159, unk_available_sizes_159).
measured(s1, available_sizes_159, cm159).
all_consistent(available_sizes_159) :- consistent(s1, available_sizes_159).
evidence(all_consistent(available_sizes_159)).
query(true_val(available_sizes_159, cm159)).
query(true_val(available_sizes_159, unk_available_sizes_159)).

% @attr effective_edge_159
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge (159cm)
% @values v1225=1225.0 unk_effective_edge_159=Unknown
% @importance 0.925

0.95::acc(s1, effective_edge_159).
0.92::acc(s_m, effective_edge_159).
0.95::true_val(effective_edge_159, v1225); 0.05::true_val(effective_edge_159, unk_effective_edge_159).
measured(s1, effective_edge_159, v1225).
measured(s_m, effective_edge_159, v1225).
all_consistent(effective_edge_159) :- consistent(s1, effective_edge_159), (indep(s_m), consistent(s_m, effective_edge_159) ; \+indep(s_m)).
evidence(all_consistent(effective_edge_159)).
query(true_val(effective_edge_159, v1225)).
query(true_val(effective_edge_159, unk_effective_edge_159)).

% @attr waist_width_159
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width (159cm)
% @values v256=256.0 unk_waist_width_159=Unknown
% @importance 0.925

0.95::acc(s1, waist_width_159).
0.92::acc(s_m, waist_width_159).
0.95::true_val(waist_width_159, v256); 0.05::true_val(waist_width_159, unk_waist_width_159).
measured(s1, waist_width_159, v256).
measured(s_m, waist_width_159, v256).
all_consistent(waist_width_159) :- consistent(s1, waist_width_159), (indep(s_m), consistent(s_m, waist_width_159) ; \+indep(s_m)).
evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v256)).
query(true_val(waist_width_159, unk_waist_width_159)).

% @attr tip_tail_width_size_159
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size (159cm)
% @values v301=301.0 unk_tip_tail_width_size_159=Unknown
% @importance 0.925

0.95::acc(s1, tip_tail_width_size_159).
0.92::acc(s_m, tip_tail_width_size_159).
0.95::true_val(tip_tail_width_size_159, v301); 0.05::true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159).
measured(s1, tip_tail_width_size_159, v301).
measured(s_m, tip_tail_width_size_159, v301).
all_consistent(tip_tail_width_size_159) :- consistent(s1, tip_tail_width_size_159), (indep(s_m), consistent(s_m, tip_tail_width_size_159) ; \+indep(s_m)).
evidence(all_consistent(tip_tail_width_size_159)).
query(true_val(tip_tail_width_size_159, v301)).
query(true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159)).

% @attr sidecut_radius_size_159
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (159cm)
% @values v7_97=7.97 unk_sidecut_radius_size_159=Unknown
% @importance 0.925

0.95::acc(s1, sidecut_radius_size_159).
0.92::acc(s_m, sidecut_radius_size_159).
0.95::true_val(sidecut_radius_size_159, v7_97); 0.05::true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159).
measured(s1, sidecut_radius_size_159, v7_97).
measured(s_m, sidecut_radius_size_159, v7_97).
all_consistent(sidecut_radius_size_159) :- consistent(s1, sidecut_radius_size_159), (indep(s_m), consistent(s_m, sidecut_radius_size_159) ; \+indep(s_m)).
evidence(all_consistent(sidecut_radius_size_159)).
query(true_val(sidecut_radius_size_159, v7_97)).
query(true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159)).

% @attr stance_width_range_size_159
% @type categorical
% @unit mm
% @canonical false
% @original_name stance_width_range_size (159cm)
% @values r520_640=520_to_640mm unk_stance_width_range_size_159=Unknown
% @importance 0.925

0.95::acc(s1, stance_width_range_size_159).
0.92::acc(s_m, stance_width_range_size_159).
0.95::true_val(stance_width_range_size_159, r520_640); 0.05::true_val(stance_width_range_size_159, unk_stance_width_range_size_159).
measured(s1, stance_width_range_size_159, r520_640).
measured(s_m, stance_width_range_size_159, r520_640).
all_consistent(stance_width_range_size_159) :- consistent(s1, stance_width_range_size_159), (indep(s_m), consistent(s_m, stance_width_range_size_159) ; \+indep(s_m)).
evidence(all_consistent(stance_width_range_size_159)).
query(true_val(stance_width_range_size_159, r520_640)).
query(true_val(stance_width_range_size_159, unk_stance_width_range_size_159)).

% @attr recommended_weight_range_size_159
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (159cm)
% @values r73_93=73_to_93kg unk_recommended_weight_range_size_159=Unknown
% @importance 0.925

0.95::acc(s1, recommended_weight_range_size_159).
0.92::acc(s_m, recommended_weight_range_size_159).
0.95::true_val(recommended_weight_range_size_159, r73_93); 0.05::true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159).
measured(s1, recommended_weight_range_size_159, r73_93).
measured(s_m, recommended_weight_range_size_159, r73_93).
all_consistent(recommended_weight_range_size_159) :- consistent(s1, recommended_weight_range_size_159), (indep(s_m), consistent(s_m, recommended_weight_range_size_159) ; \+indep(s_m)).
evidence(all_consistent(recommended_weight_range_size_159)).
query(true_val(recommended_weight_range_size_159, r73_93)).
query(true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159)).

% @attr boot_size_range_159
% @type categorical
% @canonical false
% @original_name Boot size range (159cm)
% @values eu39_44=EU_39_44_US_7_10 unk_boot_size_range_159=Unknown
% @importance 1.0

0.95::acc(s1, boot_size_range_159).
0.92::true_val(boot_size_range_159, eu39_44); 0.08::true_val(boot_size_range_159, unk_boot_size_range_159).
measured(s1, boot_size_range_159, eu39_44).
all_consistent(boot_size_range_159) :- consistent(s1, boot_size_range_159).
evidence(all_consistent(boot_size_range_159)).
query(true_val(boot_size_range_159, eu39_44)).
query(true_val(boot_size_range_159, unk_boot_size_range_159)).

% @attr available_sizes_158w
% @type categorical
% @canonical false
% @original_name available_sizes (158W)
% @values cm158w=158W unk_available_sizes_158w=Unknown
% @importance 1.0

0.95::acc(s1, available_sizes_158w).
0.92::true_val(available_sizes_158w, cm158w); 0.08::true_val(available_sizes_158w, unk_available_sizes_158w).
measured(s1, available_sizes_158w, cm158w).
all_consistent(available_sizes_158w) :- consistent(s1, available_sizes_158w).
evidence(all_consistent(available_sizes_158w)).
query(true_val(available_sizes_158w, cm158w)).
query(true_val(available_sizes_158w, unk_available_sizes_158w)).

% @attr effective_edge_158w
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge (158W)
% @values v1217=1217.0 unk_effective_edge_158w=Unknown
% @importance 1.0

0.95::acc(s1, effective_edge_158w).
0.92::true_val(effective_edge_158w, v1217); 0.08::true_val(effective_edge_158w, unk_effective_edge_158w).
measured(s1, effective_edge_158w, v1217).
all_consistent(effective_edge_158w) :- consistent(s1, effective_edge_158w).
evidence(all_consistent(effective_edge_158w)).
query(true_val(effective_edge_158w, v1217)).
query(true_val(effective_edge_158w, unk_effective_edge_158w)).

% @attr waist_width_158w
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width (158W)
% @values v266=266.0 unk_waist_width_158w=Unknown
% @importance 1.0

0.95::acc(s1, waist_width_158w).
0.92::true_val(waist_width_158w, v266); 0.08::true_val(waist_width_158w, unk_waist_width_158w).
measured(s1, waist_width_158w, v266).
all_consistent(waist_width_158w) :- consistent(s1, waist_width_158w).
evidence(all_consistent(waist_width_158w)).
query(true_val(waist_width_158w, v266)).
query(true_val(waist_width_158w, unk_waist_width_158w)).

% @attr tip_tail_width_size_158w
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size (158W)
% @values v309=309.0 unk_tip_tail_width_size_158w=Unknown
% @importance 1.0

0.95::acc(s1, tip_tail_width_size_158w).
0.92::true_val(tip_tail_width_size_158w, v309); 0.08::true_val(tip_tail_width_size_158w, unk_tip_tail_width_size_158w).
measured(s1, tip_tail_width_size_158w, v309).
all_consistent(tip_tail_width_size_158w) :- consistent(s1, tip_tail_width_size_158w).
evidence(all_consistent(tip_tail_width_size_158w)).
query(true_val(tip_tail_width_size_158w, v309)).
query(true_val(tip_tail_width_size_158w, unk_tip_tail_width_size_158w)).

% @attr sidecut_radius_size_158w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (158W)
% @values v7_93=7.93 unk_sidecut_radius_size_158w=Unknown
% @importance 1.0

0.95::acc(s1, sidecut_radius_size_158w).
0.92::true_val(sidecut_radius_size_158w, v7_93); 0.08::true_val(sidecut_radius_size_158w, unk_sidecut_radius_size_158w).
measured(s1, sidecut_radius_size_158w, v7_93).
all_consistent(sidecut_radius_size_158w) :- consistent(s1, sidecut_radius_size_158w).
evidence(all_consistent(sidecut_radius_size_158w)).
query(true_val(sidecut_radius_size_158w, v7_93)).
query(true_val(sidecut_radius_size_158w, unk_sidecut_radius_size_158w)).

% @attr stance_width_range_size_158w
% @type categorical
% @unit mm
% @canonical false
% @original_name stance_width_range_size (158W)
% @values r510_630=510_to_630mm unk_stance_width_range_size_158w=Unknown
% @importance 1.0

0.95::acc(s1, stance_width_range_size_158w).
0.92::true_val(stance_width_range_size_158w, r510_630); 0.08::true_val(stance_width_range_size_158w, unk_stance_width_range_size_158w).
measured(s1, stance_width_range_size_158w, r510_630).
all_consistent(stance_width_range_size_158w) :- consistent(s1, stance_width_range_size_158w).
evidence(all_consistent(stance_width_range_size_158w)).
query(true_val(stance_width_range_size_158w, r510_630)).
query(true_val(stance_width_range_size_158w, unk_stance_width_range_size_158w)).

% @attr recommended_weight_range_size_158w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (158W)
% @values r75_95=75_to_95kg unk_recommended_weight_range_size_158w=Unknown
% @importance 1.0

0.95::acc(s1, recommended_weight_range_size_158w).
0.92::true_val(recommended_weight_range_size_158w, r75_95); 0.08::true_val(recommended_weight_range_size_158w, unk_recommended_weight_range_size_158w).
measured(s1, recommended_weight_range_size_158w, r75_95).
all_consistent(recommended_weight_range_size_158w) :- consistent(s1, recommended_weight_range_size_158w).
evidence(all_consistent(recommended_weight_range_size_158w)).
query(true_val(recommended_weight_range_size_158w, r75_95)).
query(true_val(recommended_weight_range_size_158w, unk_recommended_weight_range_size_158w)).

% @attr boot_size_range_158w
% @type categorical
% @canonical false
% @original_name Boot size range (158W)
% @values eu42_47=EU_42_47_US_9_12 unk_boot_size_range_158w=Unknown
% @importance 1.0

0.95::acc(s1, boot_size_range_158w).
0.92::true_val(boot_size_range_158w, eu42_47); 0.08::true_val(boot_size_range_158w, unk_boot_size_range_158w).
measured(s1, boot_size_range_158w, eu42_47).
all_consistent(boot_size_range_158w) :- consistent(s1, boot_size_range_158w).
evidence(all_consistent(boot_size_range_158w)).
query(true_val(boot_size_range_158w, eu42_47)).
query(true_val(boot_size_range_158w, unk_boot_size_range_158w)).

% @attr available_sizes_161w
% @type categorical
% @canonical false
% @original_name available_sizes (161W)
% @values cm161w=161W unk_available_sizes_161w=Unknown
% @importance 1.0

0.95::acc(s1, available_sizes_161w).
0.92::true_val(available_sizes_161w, cm161w); 0.08::true_val(available_sizes_161w, unk_available_sizes_161w).
measured(s1, available_sizes_161w, cm161w).
all_consistent(available_sizes_161w) :- consistent(s1, available_sizes_161w).
evidence(all_consistent(available_sizes_161w)).
query(true_val(available_sizes_161w, cm161w)).
query(true_val(available_sizes_161w, unk_available_sizes_161w)).

% @attr effective_edge_161w
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge (161W)
% @values v1240=1240.0 unk_effective_edge_161w=Unknown
% @importance 1.0

0.95::acc(s1, effective_edge_161w).
0.92::true_val(effective_edge_161w, v1240); 0.08::true_val(effective_edge_161w, unk_effective_edge_161w).
measured(s1, effective_edge_161w, v1240).
all_consistent(effective_edge_161w) :- consistent(s1, effective_edge_161w).
evidence(all_consistent(effective_edge_161w)).
query(true_val(effective_edge_161w, v1240)).
query(true_val(effective_edge_161w, unk_effective_edge_161w)).

% @attr waist_width_161w
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width (161W)
% @values v268=268.0 unk_waist_width_161w=Unknown
% @importance 1.0

0.95::acc(s1, waist_width_161w).
0.92::true_val(waist_width_161w, v268); 0.08::true_val(waist_width_161w, unk_waist_width_161w).
measured(s1, waist_width_161w, v268).
all_consistent(waist_width_161w) :- consistent(s1, waist_width_161w).
evidence(all_consistent(waist_width_161w)).
query(true_val(waist_width_161w, v268)).
query(true_val(waist_width_161w, unk_waist_width_161w)).

% @attr tip_tail_width_size_161w
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size (161W)
% @values v313=313.0 unk_tip_tail_width_size_161w=Unknown
% @importance 1.0

0.95::acc(s1, tip_tail_width_size_161w).
0.92::true_val(tip_tail_width_size_161w, v313); 0.08::true_val(tip_tail_width_size_161w, unk_tip_tail_width_size_161w).
measured(s1, tip_tail_width_size_161w, v313).
all_consistent(tip_tail_width_size_161w) :- consistent(s1, tip_tail_width_size_161w).
evidence(all_consistent(tip_tail_width_size_161w)).
query(true_val(tip_tail_width_size_161w, v313)).
query(true_val(tip_tail_width_size_161w, unk_tip_tail_width_size_161w)).

% @attr sidecut_radius_size_161w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (161W)
% @values v8_05=8.05 unk_sidecut_radius_size_161w=Unknown
% @importance 1.0

0.95::acc(s1, sidecut_radius_size_161w).
0.92::true_val(sidecut_radius_size_161w, v8_05); 0.08::true_val(sidecut_radius_size_161w, unk_sidecut_radius_size_161w).
measured(s1, sidecut_radius_size_161w, v8_05).
all_consistent(sidecut_radius_size_161w) :- consistent(s1, sidecut_radius_size_161w).
evidence(all_consistent(sidecut_radius_size_161w)).
query(true_val(sidecut_radius_size_161w, v8_05)).
query(true_val(sidecut_radius_size_161w, unk_sidecut_radius_size_161w)).

% @attr stance_width_range_size_161w
% @type categorical
% @unit mm
% @canonical false
% @original_name stance_width_range_size (161W)
% @values r520_640=520_to_640mm unk_stance_width_range_size_161w=Unknown
% @importance 1.0

0.95::acc(s1, stance_width_range_size_161w).
0.92::true_val(stance_width_range_size_161w, r520_640); 0.08::true_val(stance_width_range_size_161w, unk_stance_width_range_size_161w).
measured(s1, stance_width_range_size_161w, r520_640).
all_consistent(stance_width_range_size_161w) :- consistent(s1, stance_width_range_size_161w).
evidence(all_consistent(stance_width_range_size_161w)).
query(true_val(stance_width_range_size_161w, r520_640)).
query(true_val(stance_width_range_size_161w, unk_stance_width_range_size_161w)).

% @attr recommended_weight_range_size_161w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (161W)
% @values r79_99=79_to_99kg unk_recommended_weight_range_size_161w=Unknown
% @importance 1.0

0.95::acc(s1, recommended_weight_range_size_161w).
0.92::true_val(recommended_weight_range_size_161w, r79_99); 0.08::true_val(recommended_weight_range_size_161w, unk_recommended_weight_range_size_161w).
measured(s1, recommended_weight_range_size_161w, r79_99).
all_consistent(recommended_weight_range_size_161w) :- consistent(s1, recommended_weight_range_size_161w).
evidence(all_consistent(recommended_weight_range_size_161w)).
query(true_val(recommended_weight_range_size_161w, r79_99)).
query(true_val(recommended_weight_range_size_161w, unk_recommended_weight_range_size_161w)).

% @attr boot_size_range_161w
% @type categorical
% @canonical false
% @original_name Boot size range (161W)
% @values eu43_48=EU_43_48_US_9_13 unk_boot_size_range_161w=Unknown
% @importance 1.0

0.95::acc(s1, boot_size_range_161w).
0.92::true_val(boot_size_range_161w, eu43_48); 0.08::true_val(boot_size_range_161w, unk_boot_size_range_161w).
measured(s1, boot_size_range_161w, eu43_48).
all_consistent(boot_size_range_161w) :- consistent(s1, boot_size_range_161w).
evidence(all_consistent(boot_size_range_161w)).
query(true_val(boot_size_range_161w, eu43_48)).
query(true_val(boot_size_range_161w, unk_boot_size_range_161w)).

% @attr available_sizes_164w
% @type categorical
% @canonical false
% @original_name available_sizes (164W)
% @values cm164w=164W unk_available_sizes_164w=Unknown
% @importance 1.0

0.95::acc(s1, available_sizes_164w).
0.92::true_val(available_sizes_164w, cm164w); 0.08::true_val(available_sizes_164w, unk_available_sizes_164w).
measured(s1, available_sizes_164w, cm164w).
all_consistent(available_sizes_164w) :- consistent(s1, available_sizes_164w).
evidence(all_consistent(available_sizes_164w)).
query(true_val(available_sizes_164w, cm164w)).
query(true_val(available_sizes_164w, unk_available_sizes_164w)).

% @attr effective_edge_164w
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge (164W)
% @values v1263=1263.0 unk_effective_edge_164w=Unknown
% @importance 0.925

0.95::acc(s1, effective_edge_164w).
0.92::acc(s_m, effective_edge_164w).
0.95::true_val(effective_edge_164w, v1263); 0.05::true_val(effective_edge_164w, unk_effective_edge_164w).
measured(s1, effective_edge_164w, v1263).
measured(s_m, effective_edge_164w, v1263).
all_consistent(effective_edge_164w) :- consistent(s1, effective_edge_164w), (indep(s_m), consistent(s_m, effective_edge_164w) ; \+indep(s_m)).
evidence(all_consistent(effective_edge_164w)).
query(true_val(effective_edge_164w, v1263)).
query(true_val(effective_edge_164w, unk_effective_edge_164w)).

% @attr waist_width_164w
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width (164W)
% @values v270=270.0 unk_waist_width_164w=Unknown
% @importance 0.925

0.95::acc(s1, waist_width_164w).
0.92::acc(s_m, waist_width_164w).
0.95::true_val(waist_width_164w, v270); 0.05::true_val(waist_width_164w, unk_waist_width_164w).
measured(s1, waist_width_164w, v270).
measured(s_m, waist_width_164w, v270).
all_consistent(waist_width_164w) :- consistent(s1, waist_width_164w), (indep(s_m), consistent(s_m, waist_width_164w) ; \+indep(s_m)).
evidence(all_consistent(waist_width_164w)).
query(true_val(waist_width_164w, v270)).
query(true_val(waist_width_164w, unk_waist_width_164w)).

% @attr tip_tail_width_size_164w
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size (164W)
% @values v316=316.0 unk_tip_tail_width_size_164w=Unknown
% @importance 0.925

0.95::acc(s1, tip_tail_width_size_164w).
0.92::acc(s_m, tip_tail_width_size_164w).
0.95::true_val(tip_tail_width_size_164w, v316); 0.05::true_val(tip_tail_width_size_164w, unk_tip_tail_width_size_164w).
measured(s1, tip_tail_width_size_164w, v316).
measured(s_m, tip_tail_width_size_164w, v316).
all_consistent(tip_tail_width_size_164w) :- consistent(s1, tip_tail_width_size_164w), (indep(s_m), consistent(s_m, tip_tail_width_size_164w) ; \+indep(s_m)).
evidence(all_consistent(tip_tail_width_size_164w)).
query(true_val(tip_tail_width_size_164w, v316)).
query(true_val(tip_tail_width_size_164w, unk_tip_tail_width_size_164w)).

% @attr sidecut_radius_size_164w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (164W)
% @values v8_17=8.17 unk_sidecut_radius_size_164w=Unknown
% @importance 0.925

0.95::acc(s1, sidecut_radius_size_164w).
0.92::acc(s_m, sidecut_radius_size_164w).
0.95::true_val(sidecut_radius_size_164w, v8_17); 0.05::true_val(sidecut_radius_size_164w, unk_sidecut_radius_size_164w).
measured(s1, sidecut_radius_size_164w, v8_17).
measured(s_m, sidecut_radius_size_164w, v8_17).
all_consistent(sidecut_radius_size_164w) :- consistent(s1, sidecut_radius_size_164w), (indep(s_m), consistent(s_m, sidecut_radius_size_164w) ; \+indep(s_m)).
evidence(all_consistent(sidecut_radius_size_164w)).
query(true_val(sidecut_radius_size_164w, v8_17)).
query(true_val(sidecut_radius_size_164w, unk_sidecut_radius_size_164w)).

% @attr stance_width_range_size_164w
% @type categorical
% @unit mm
% @canonical false
% @original_name stance_width_range_size (164W)
% @values r530_650=530_to_650mm unk_stance_width_range_size_164w=Unknown
% @importance 0.925

0.95::acc(s1, stance_width_range_size_164w).
0.92::acc(s_m, stance_width_range_size_164w).
0.95::true_val(stance_width_range_size_164w, r530_650); 0.05::true_val(stance_width_range_size_164w, unk_stance_width_range_size_164w).
measured(s1, stance_width_range_size_164w, r530_650).
measured(s_m, stance_width_range_size_164w, r530_650).
all_consistent(stance_width_range_size_164w) :- consistent(s1, stance_width_range_size_164w), (indep(s_m), consistent(s_m, stance_width_range_size_164w) ; \+indep(s_m)).
evidence(all_consistent(stance_width_range_size_164w)).
query(true_val(stance_width_range_size_164w, r530_650)).
query(true_val(stance_width_range_size_164w, unk_stance_width_range_size_164w)).

% @attr recommended_weight_range_size_164w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (164W)
% @values r85_105=85_to_105kg unk_recommended_weight_range_size_164w=Unknown
% @importance 0.925

0.95::acc(s1, recommended_weight_range_size_164w).
0.92::acc(s_m, recommended_weight_range_size_164w).
0.95::true_val(recommended_weight_range_size_164w, r85_105); 0.05::true_val(recommended_weight_range_size_164w, unk_recommended_weight_range_size_164w).
measured(s1, recommended_weight_range_size_164w, r85_105).
measured(s_m, recommended_weight_range_size_164w, r85_105).
all_consistent(recommended_weight_range_size_164w) :- consistent(s1, recommended_weight_range_size_164w), (indep(s_m), consistent(s_m, recommended_weight_range_size_164w) ; \+indep(s_m)).
evidence(all_consistent(recommended_weight_range_size_164w)).
query(true_val(recommended_weight_range_size_164w, r85_105)).
query(true_val(recommended_weight_range_size_164w, unk_recommended_weight_range_size_164w)).

% @attr boot_size_range_164w
% @type categorical
% @canonical false
% @original_name Boot size range (164W)
% @values eu43_48=EU_43_48_US_9_13 unk_boot_size_range_164w=Unknown
% @importance 1.0

0.95::acc(s1, boot_size_range_164w).
0.92::true_val(boot_size_range_164w, eu43_48); 0.08::true_val(boot_size_range_164w, unk_boot_size_range_164w).
measured(s1, boot_size_range_164w, eu43_48).
all_consistent(boot_size_range_164w) :- consistent(s1, boot_size_range_164w).
evidence(all_consistent(boot_size_range_164w)).
query(true_val(boot_size_range_164w, eu43_48)).
query(true_val(boot_size_range_164w, unk_boot_size_range_164w)).

% @attr available_sizes_167w
% @type categorical
% @canonical false
% @original_name available_sizes (167W)
% @values cm167w=167W unk_available_sizes_167w=Unknown
% @importance 1.0

0.95::acc(s1, available_sizes_167w).
0.92::true_val(available_sizes_167w, cm167w); 0.08::true_val(available_sizes_167w, unk_available_sizes_167w).
measured(s1, available_sizes_167w, cm167w).
all_consistent(available_sizes_167w) :- consistent(s1, available_sizes_167w).
evidence(all_consistent(available_sizes_167w)).
query(true_val(available_sizes_167w, cm167w)).
query(true_val(available_sizes_167w, unk_available_sizes_167w)).

% @attr effective_edge_167w
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge (167W)
% @values v1286=1286.0 unk_effective_edge_167w=Unknown
% @importance 1.0

0.95::acc(s1, effective_edge_167w).
0.92::true_val(effective_edge_167w, v1286); 0.08::true_val(effective_edge_167w, unk_effective_edge_167w).
measured(s1, effective_edge_167w, v1286).
all_consistent(effective_edge_167w) :- consistent(s1, effective_edge_167w).
evidence(all_consistent(effective_edge_167w)).
query(true_val(effective_edge_167w, v1286)).
query(true_val(effective_edge_167w, unk_effective_edge_167w)).

% @attr waist_width_167w
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width (167W)
% @values v272=272.0 unk_waist_width_167w=Unknown
% @importance 1.0

0.95::acc(s1, waist_width_167w).
0.92::true_val(waist_width_167w, v272); 0.08::true_val(waist_width_167w, unk_waist_width_167w).
measured(s1, waist_width_167w, v272).
all_consistent(waist_width_167w) :- consistent(s1, waist_width_167w).
evidence(all_consistent(waist_width_167w)).
query(true_val(waist_width_167w, v272)).
query(true_val(waist_width_167w, unk_waist_width_167w)).

% @attr tip_tail_width_size_167w
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size (167W)
% @values v319=319.0 unk_tip_tail_width_size_167w=Unknown
% @importance 1.0

0.95::acc(s1, tip_tail_width_size_167w).
0.92::true_val(tip_tail_width_size_167w, v319); 0.08::true_val(tip_tail_width_size_167w, unk_tip_tail_width_size_167w).
measured(s1, tip_tail_width_size_167w, v319).
all_consistent(tip_tail_width_size_167w) :- consistent(s1, tip_tail_width_size_167w).
evidence(all_consistent(tip_tail_width_size_167w)).
query(true_val(tip_tail_width_size_167w, v319)).
query(true_val(tip_tail_width_size_167w, unk_tip_tail_width_size_167w)).

% @attr sidecut_radius_size_167w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (167W)
% @values v8_29=8.29 unk_sidecut_radius_size_167w=Unknown
% @importance 1.0

0.95::acc(s1, sidecut_radius_size_167w).
0.92::true_val(sidecut_radius_size_167w, v8_29); 0.08::true_val(sidecut_radius_size_167w, unk_sidecut_radius_size_167w).
measured(s1, sidecut_radius_size_167w, v8_29).
all_consistent(sidecut_radius_size_167w) :- consistent(s1, sidecut_radius_size_167w).
evidence(all_consistent(sidecut_radius_size_167w)).
query(true_val(sidecut_radius_size_167w, v8_29)).
query(true_val(sidecut_radius_size_167w, unk_sidecut_radius_size_167w)).

% @attr stance_width_range_size_167w
% @type categorical
% @unit mm
% @canonical false
% @original_name stance_width_range_size (167W)
% @values r540_660=540_to_660mm unk_stance_width_range_size_167w=Unknown
% @importance 1.0

0.95::acc(s1, stance_width_range_size_167w).
0.92::true_val(stance_width_range_size_167w, r540_660); 0.08::true_val(stance_width_range_size_167w, unk_stance_width_range_size_167w).
measured(s1, stance_width_range_size_167w, r540_660).
all_consistent(stance_width_range_size_167w) :- consistent(s1, stance_width_range_size_167w).
evidence(all_consistent(stance_width_range_size_167w)).
query(true_val(stance_width_range_size_167w, r540_660)).
query(true_val(stance_width_range_size_167w, unk_stance_width_range_size_167w)).

% @attr recommended_weight_range_size_167w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (167W)
% @values r103_123=103_to_123kg unk_recommended_weight_range_size_167w=Unknown
% @importance 1.0

0.95::acc(s1, recommended_weight_range_size_167w).
0.92::true_val(recommended_weight_range_size_167w, r103_123); 0.08::true_val(recommended_weight_range_size_167w, unk_recommended_weight_range_size_167w).
measured(s1, recommended_weight_range_size_167w, r103_123).
all_consistent(recommended_weight_range_size_167w) :- consistent(s1, recommended_weight_range_size_167w).
evidence(all_consistent(recommended_weight_range_size_167w)).
query(true_val(recommended_weight_range_size_167w, r103_123)).
query(true_val(recommended_weight_range_size_167w, unk_recommended_weight_range_size_167w)).

% @attr boot_size_range_167w
% @type categorical
% @canonical false
% @original_name Boot size range (167W)
% @values eu43_48=EU_43_48_US_9_13 unk_boot_size_range_167w=Unknown
% @importance 1.0

0.95::acc(s1, boot_size_range_167w).
0.92::true_val(boot_size_range_167w, eu43_48); 0.08::true_val(boot_size_range_167w, unk_boot_size_range_167w).
measured(s1, boot_size_range_167w, eu43_48).
all_consistent(boot_size_range_167w) :- consistent(s1, boot_size_range_167w).
evidence(all_consistent(boot_size_range_167w)).
query(true_val(boot_size_range_167w, eu43_48)).
query(true_val(boot_size_range_167w, unk_boot_size_range_167w)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_and_wide=Standard_156_159_and_Wide_158W_161W_164W_167W unk_width_options=Unknown
% @importance 0.925

0.95::acc(s1, width_options).
0.92::acc(s_m, width_options).
0.95::true_val(width_options, standard_and_wide); 0.05::true_val(width_options, unk_width_options).
measured(s1, width_options, standard_and_wide).
measured(s_m, width_options, standard_and_wide).
all_consistent(width_options) :- consistent(s1, width_options), (indep(s_m), consistent(s_m, width_options) ; \+indep(s_m)).
evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

% @attr available_sizes_merchant_discrepancy
% @type categorical
% @canonical false
% @original_name available_sizes (merchant discrepancy)
% @values merchant_incomplete=Merchant_lists_only_3_sizes_manufacturer_lists_6 unk_available_sizes_merchant_discrepancy=Unknown
% @importance 0.85

0.90::acc(s1, available_sizes_merchant_discrepancy).
0.75::acc(s_m, available_sizes_merchant_discrepancy).
0.78::acc(s31, available_sizes_merchant_discrepancy).
0.85::true_val(available_sizes_merchant_discrepancy, merchant_incomplete); 0.15::true_val(available_sizes_merchant_discrepancy, unk_available_sizes_merchant_discrepancy).
measured(s1, available_sizes_merchant_discrepancy, merchant_incomplete).
measured(s_m, available_sizes_merchant_discrepancy, merchant_incomplete).
measured(s31, available_sizes_merchant_discrepancy, merchant_incomplete).
all_consistent(available_sizes_merchant_discrepancy) :- consistent(s1, available_sizes_merchant_discrepancy), (indep(s_m), consistent(s_m, available_sizes_merchant_discrepancy) ; \+indep(s_m)), (indep(s31), consistent(s31, available_sizes_merchant_discrepancy) ; \+indep(s31)).
evidence(all_consistent(available_sizes_merchant_discrepancy)).
query(true_val(available_sizes_merchant_discrepancy, merchant_incomplete)).
query(true_val(available_sizes_merchant_discrepancy, unk_available_sizes_merchant_discrepancy)).

% @attr customer_review_rating
% @type numeric
% @unit /5
% @canonical false
% @original_name Customer review rating (Bataleon.com)
% @values v5=5.0 unk_customer_review_rating=Unknown
% @importance 1.0

0.88::acc(s1, customer_review_rating).
0.92::true_val(customer_review_rating, v5); 0.08::true_val(customer_review_rating, unk_customer_review_rating).
measured(s1, customer_review_rating, v5).
all_consistent(customer_review_rating) :- consistent(s1, customer_review_rating).
evidence(all_consistent(customer_review_rating)).
query(true_val(customer_review_rating, v5)).
query(true_val(customer_review_rating, unk_customer_review_rating)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values best_board=Best_board_I_have_had_so_far unk_user_review_forum=Unknown
% @importance 1.0

0.75::acc(s1, user_review_forum).
0.48::true_val(user_review_forum, best_board); 0.52::true_val(user_review_forum, unk_user_review_forum).
measured(s1, user_review_forum, best_board).
all_consistent(user_review_forum) :- consistent(s1, user_review_forum).
evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, best_board)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr user_review_forum_pop
% @type categorical
% @canonical false
% @original_name user_review_forum (pop and stability)
% @values pop_stability_immense=Pop_and_stability_at_higher_speeds_is_immense unk_user_review_forum_pop=Unknown
% @importance 1.0

0.75::acc(s1, user_review_forum_pop).
0.48::true_val(user_review_forum_pop, pop_stability_immense); 0.52::true_val(user_review_forum_pop, unk_user_review_forum_pop).
measured(s1, user_review_forum_pop, pop_stability_immense).
all_consistent(user_review_forum_pop) :- consistent(s1, user_review_forum_pop).
evidence(all_consistent(user_review_forum_pop)).
query(true_val(user_review_forum_pop, pop_stability_immense)).
query(true_val(user_review_forum_pop, unk_user_review_forum_pop)).

% @attr user_review_forum_speed_work
% @type categorical
% @canonical false
% @original_name user_review_forum (speed vs work)
% @values needs_work_slow_fast_great=Needs_work_slow_incredibly_fast_at_speed unk_user_review_forum_speed_work=Unknown
% @importance 1.0

0.75::acc(s1, user_review_forum_speed_work).
0.48::true_val(user_review_forum_speed_work, needs_work_slow_fast_great); 0.52::true_val(user_review_forum_speed_work, unk_user_review_forum_speed_work).
measured(s1, user_review_forum_speed_work, needs_work_slow_fast_great).
all_consistent(user_review_forum_speed_work) :- consistent(s1, user_review_forum_speed_work).
evidence(all_consistent(user_review_forum_speed_work)).
query(true_val(user_review_forum_speed_work, needs_work_slow_fast_great)).
query(true_val(user_review_forum_speed_work, unk_user_review_forum_speed_work)).

% @attr user_review_forum_stiff
% @type categorical
% @canonical false
% @original_name user_review_forum (stiffest ever)
% @values most_stiff_ever=Most_stiff_board_ever_ridden unk_user_review_forum_stiff=Unknown
% @importance 1.0

0.75::acc(s1, user_review_forum_stiff).
0.48::true_val(user_review_forum_stiff, most_stiff_ever); 0.52::true_val(user_review_forum_stiff, unk_user_review_forum_stiff).
measured(s1, user_review_forum_stiff, most_stiff_ever).
all_consistent(user_review_forum_stiff) :- consistent(s1, user_review_forum_stiff).
evidence(all_consistent(user_review_forum_stiff)).
query(true_val(user_review_forum_stiff, most_stiff_ever)).
query(true_val(user_review_forum_stiff, unk_user_review_forum_stiff)).

% @attr user_review_forum_aggressive
% @type categorical
% @canonical false
% @original_name user_review_forum (aggressive camber)
% @values aggressive_stiff_fun_fast=Aggressive_camber_stiff_but_fun_at_speed_not_daily unk_user_review_forum_aggressive=Unknown
% @importance 1.0

0.75::acc(s1, user_review_forum_aggressive).
0.48::true_val(user_review_forum_aggressive, aggressive_stiff_fun_fast); 0.52::true_val(user_review_forum_aggressive, unk_user_review_forum_aggressive).
measured(s1, user_review_forum_aggressive, aggressive_stiff_fun_fast).
all_consistent(user_review_forum_aggressive) :- consistent(s1, user_review_forum_aggressive).
evidence(all_consistent(user_review_forum_aggressive)).
query(true_val(user_review_forum_aggressive, aggressive_stiff_fun_fast)).
query(true_val(user_review_forum_aggressive, unk_user_review_forum_aggressive)).

% @attr user_review_forum_nose_flex
% @type categorical
% @canonical false
% @original_name user_review_forum (nose flex)
% @values nose_softer_butters_easier=Nose_softer_than_tail_butters_easier unk_user_review_forum_nose_flex=Unknown
% @importance 0.75

0.72::acc(s38, user_review_forum_nose_flex).
0.43::true_val(user_review_forum_nose_flex, nose_softer_butters_easier); 0.57::true_val(user_review_forum_nose_flex, unk_user_review_forum_nose_flex).
measured(s38, user_review_forum_nose_flex, nose_softer_butters_easier).
all_consistent(user_review_forum_nose_flex) :- consistent(s38, user_review_forum_nose_flex).
evidence(all_consistent(user_review_forum_nose_flex)).
query(true_val(user_review_forum_nose_flex, nose_softer_butters_easier)).
query(true_val(user_review_forum_nose_flex, unk_user_review_forum_nose_flex)).

% @attr user_review_forum_backcountry
% @type categorical
% @canonical false
% @original_name user_review_forum (backcountry use)
% @values backcountry_playful_stable=Mostly_backcountry_playful_yet_stable_on_bumpy unk_user_review_forum_backcountry=Unknown
% @importance 0.75

0.72::acc(s38, user_review_forum_backcountry).
0.43::true_val(user_review_forum_backcountry, backcountry_playful_stable); 0.57::true_val(user_review_forum_backcountry, unk_user_review_forum_backcountry).
measured(s38, user_review_forum_backcountry, backcountry_playful_stable).
all_consistent(user_review_forum_backcountry) :- consistent(s38, user_review_forum_backcountry).
evidence(all_consistent(user_review_forum_backcountry)).
query(true_val(user_review_forum_backcountry, backcountry_playful_stable)).
query(true_val(user_review_forum_backcountry, unk_user_review_forum_backcountry)).

% @attr user_review_forum_charging
% @type categorical
% @canonical false
% @original_name user_review_forum (charging hard)
% @values wants_to_run_fast=Board_wants_to_run_fast_charging_hard_excels unk_user_review_forum_charging=Unknown
% @importance 1.0

0.75::acc(s1, user_review_forum_charging).
0.48::true_val(user_review_forum_charging, wants_to_run_fast); 0.52::true_val(user_review_forum_charging, unk_user_review_forum_charging).
measured(s1, user_review_forum_charging, wants_to_run_fast).
all_consistent(user_review_forum_charging) :- consistent(s1, user_review_forum_charging).
evidence(all_consistent(user_review_forum_charging)).
query(true_val(user_review_forum_charging, wants_to_run_fast)).
query(true_val(user_review_forum_charging, unk_user_review_forum_charging)).

% @attr user_review_forum_press
% @type categorical
% @canonical false
% @original_name user_review_forum (pressing)
% @values stiff_press_proper=Stiff_doesnt_mean_no_press_just_do_it_properly unk_user_review_forum_press=Unknown
% @importance 1.0

0.75::acc(s1, user_review_forum_press).
0.48::true_val(user_review_forum_press, stiff_press_proper); 0.52::true_val(user_review_forum_press, unk_user_review_forum_press).
measured(s1, user_review_forum_press, stiff_press_proper).
all_consistent(user_review_forum_press) :- consistent(s1, user_review_forum_press).
evidence(all_consistent(user_review_forum_press)).
query(true_val(user_review_forum_press, stiff_press_proper)).
query(true_val(user_review_forum_press, unk_user_review_forum_press)).

% @attr user_review_forum_3bt_precision
% @type categorical
% @canonical false
% @original_name user_review_forum (3BT precision)
% @values lose_precision_hard_conditions=3BT_great_but_lose_precision_carving_hard_conditions unk_user_review_forum_3bt_precision=Unknown
% @importance 0.75

0.65::acc(s40, user_review_forum_3bt_precision).
0.32::true_val(user_review_forum_3bt_precision, lose_precision_hard_conditions); 0.68::true_val(user_review_forum_3bt_precision, unk_user_review_forum_3bt_precision).
measured(s40, user_review_forum_3bt_precision, lose_precision_hard_conditions).
all_consistent(user_review_forum_3bt_precision) :- consistent(s40, user_review_forum_3bt_precision).
evidence(all_consistent(user_review_forum_3bt_precision)).
query(true_val(user_review_forum_3bt_precision, lose_precision_hard_conditions)).
query(true_val(user_review_forum_3bt_precision, unk_user_review_forum_3bt_precision)).

% @attr user_review_forum_edge_delay
% @type categorical
% @canonical false
% @original_name user_review_forum (edge delay)
% @values split_second_delay=Split_second_delay_before_contact_point_engages unk_user_review_forum_edge_delay=Unknown
% @importance 0.7

0.55::acc(s41, user_review_forum_edge_delay).
0.23::true_val(user_review_forum_edge_delay, split_second_delay); 0.77::true_val(user_review_forum_edge_delay, unk_user_review_forum_edge_delay).
measured(s41, user_review_forum_edge_delay, split_second_delay).
all_consistent(user_review_forum_edge_delay) :- consistent(s41, user_review_forum_edge_delay).
evidence(all_consistent(user_review_forum_edge_delay)).
query(true_val(user_review_forum_edge_delay, split_second_delay)).
query(true_val(user_review_forum_edge_delay, unk_user_review_forum_edge_delay)).

% @attr user_review_forum_carve_lean
% @type categorical
% @canonical false
% @original_name user_review_forum (carve lean)
% @values lean_deeper_3bt=Must_lean_deeper_to_carve_due_to_3BT unk_user_review_forum_carve_lean=Unknown
% @importance 0.7

0.68::acc(s42, user_review_forum_carve_lean).
0.42::true_val(user_review_forum_carve_lean, lean_deeper_3bt); 0.58::true_val(user_review_forum_carve_lean, unk_user_review_forum_carve_lean).
measured(s42, user_review_forum_carve_lean, lean_deeper_3bt).
all_consistent(user_review_forum_carve_lean) :- consistent(s42, user_review_forum_carve_lean).
evidence(all_consistent(user_review_forum_carve_lean)).
query(true_val(user_review_forum_carve_lean, lean_deeper_3bt)).
query(true_val(user_review_forum_carve_lean, unk_user_review_forum_carve_lean)).

% @attr glisshop_description
% @type categorical
% @canonical false
% @original_name Glisshop description
% @values dtwin_camber_edge_pop=Directional_twin_powerful_camber_fierce_edge_hold_responsive_pop unk_glisshop_description=Unknown
% @importance 0.7

0.78::acc(s30, glisshop_description).
0.60::true_val(glisshop_description, dtwin_camber_edge_pop); 0.40::true_val(glisshop_description, unk_glisshop_description).
measured(s30, glisshop_description, dtwin_camber_edge_pop).
all_consistent(glisshop_description) :- consistent(s30, glisshop_description).
evidence(all_consistent(glisshop_description)).
query(true_val(glisshop_description, dtwin_camber_edge_pop)).
query(true_val(glisshop_description, unk_glisshop_description)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values ranking_list=Burton_Custom_X_1_Capita_Mega_Merc_2_YES_Standard_3_Turbo_4 unk_comparable_board_cross_brand=Unknown
% @importance 0.9

0.82::acc(s39, comparable_board_cross_brand).
0.69::true_val(comparable_board_cross_brand, ranking_list); 0.31::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).
measured(s39, comparable_board_cross_brand, ranking_list).
all_consistent(comparable_board_cross_brand) :- consistent(s39, comparable_board_cross_brand).
evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, ranking_list)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_doa
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (CAPiTA DOA)
% @values capita_doa_flex_5_5=CAPiTA_DOA_flex_5_5_more_freestyle unk_comparable_board_cross_brand_doa=Unknown
% @importance 0.7

0.70::acc(s45, comparable_board_cross_brand_doa).
0.46::true_val(comparable_board_cross_brand_doa, capita_doa_flex_5_5); 0.54::true_val(comparable_board_cross_brand_doa, unk_comparable_board_cross_brand_doa).
measured(s45, comparable_board_cross_brand_doa, capita_doa_flex_5_5).
all_consistent(comparable_board_cross_brand_doa) :- consistent(s45, comparable_board_cross_brand_doa).
evidence(all_consistent(comparable_board_cross_brand_doa)).
query(true_val(comparable_board_cross_brand_doa, capita_doa_flex_5_5)).
query(true_val(comparable_board_cross_brand_doa, unk_comparable_board_cross_brand_doa)).

% @attr comparable_board_cross_brand_jones_mt
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Jones Mountain Twin)
% @values jones_mt_flex_7=Jones_Mountain_Twin_flex_7_more_versatile unk_comparable_board_cross_brand_jones_mt=Unknown
% @importance 0.7

0.70::acc(s45, comparable_board_cross_brand_jones_mt).
0.46::true_val(comparable_board_cross_brand_jones_mt, jones_mt_flex_7); 0.54::true_val(comparable_board_cross_brand_jones_mt, unk_comparable_board_cross_brand_jones_mt).
measured(s45, comparable_board_cross_brand_jones_mt, jones_mt_flex_7).
all_consistent(comparable_board_cross_brand_jones_mt) :- consistent(s45, comparable_board_cross_brand_jones_mt).
evidence(all_consistent(comparable_board_cross_brand_jones_mt)).
query(true_val(comparable_board_cross_brand_jones_mt, jones_mt_flex_7)).
query(true_val(comparable_board_cross_brand_jones_mt, unk_comparable_board_cross_brand_jones_mt)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values bataleon_whatever_flex5=Bataleon_Whatever_flex_5_10 unk_comparable_board_same_brand=Unknown
% @importance 0.5

0.78::acc(s43, comparable_board_same_brand).
0.60::true_val(comparable_board_same_brand, bataleon_whatever_flex5); 0.40::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).
measured(s43, comparable_board_same_brand, bataleon_whatever_flex5).
all_consistent(comparable_board_same_brand) :- consistent(s43, comparable_board_same_brand).
evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, bataleon_whatever_flex5)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_goliath
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Goliath)
% @values bataleon_goliath_medium=Bataleon_Goliath_medium_flex unk_comparable_board_same_brand_goliath=Unknown
% @importance 0.5

0.75::acc(s44, comparable_board_same_brand_goliath).
0.53::true_val(comparable_board_same_brand_goliath, bataleon_goliath_medium); 0.47::true_val(comparable_board_same_brand_goliath, unk_comparable_board_same_brand_goliath).
measured(s44, comparable_board_same_brand_goliath, bataleon_goliath_medium).
all_consistent(comparable_board_same_brand_goliath) :- consistent(s44, comparable_board_same_brand_goliath).
evidence(all_consistent(comparable_board_same_brand_goliath)).
query(true_val(comparable_board_same_brand_goliath, bataleon_goliath_medium)).
query(true_val(comparable_board_same_brand_goliath, unk_comparable_board_same_brand_goliath)).

% @attr comparable_board_same_brand_evil_twin
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Evil Twin)
% @values bataleon_evil_twin=Bataleon_Evil_Twin_Evil_Twin_Plus unk_comparable_board_same_brand_evil_twin=Unknown
% @importance 0.75

0.68::acc(s40, comparable_board_same_brand_evil_twin).
0.32::true_val(comparable_board_same_brand_evil_twin, bataleon_evil_twin); 0.68::true_val(comparable_board_same_brand_evil_twin, unk_comparable_board_same_brand_evil_twin).
measured(s40, comparable_board_same_brand_evil_twin, bataleon_evil_twin).
all_consistent(comparable_board_same_brand_evil_twin) :- consistent(s40, comparable_board_same_brand_evil_twin).
evidence(all_consistent(comparable_board_same_brand_evil_twin)).
query(true_val(comparable_board_same_brand_evil_twin, bataleon_evil_twin)).
query(true_val(comparable_board_same_brand_evil_twin, unk_comparable_board_same_brand_evil_twin)).

% @attr pop
% @type categorical
% @canonical false
% @original_name pop
% @values high_explosive=High_carbon_SuperTubes_stringers_explosive_pop unk_pop=Unknown
% @importance 0.975

0.93::acc(s1, pop).
0.85::acc(s2, pop).
0.95::true_val(pop, high_explosive); 0.05::true_val(pop, unk_pop).
measured(s1, pop, high_explosive).
measured(s2, pop, high_explosive).
all_consistent(pop) :- consistent(s1, pop), (indep(s2), consistent(s2, pop) ; \+indep(s2)).
evidence(all_consistent(pop)).
query(true_val(pop, high_explosive)).
query(true_val(pop, unk_pop)).

% @attr stability
% @type categorical
% @canonical false
% @original_name Stability
% @values excellent_high_speed=Excellent_at_high_speed_stiff_flex_camber unk_stability=Unknown
% @importance 1.0

0.92::acc(s1, stability).
0.92::true_val(stability, excellent_high_speed); 0.08::true_val(stability, unk_stability).
measured(s1, stability, excellent_high_speed).
all_consistent(stability) :- consistent(s1, stability).
evidence(all_consistent(stability)).
query(true_val(stability, excellent_high_speed)).
query(true_val(stability, unk_stability)).

% @attr edge_hold
% @type categorical
% @canonical false
% @original_name edge_hold
% @values strong_moderated_3bt=Strong_camber_edge_hold_moderated_by_3BT unk_edge_hold=Unknown
% @importance 0.725

0.80::acc(s30, edge_hold).
0.68::acc(s40, edge_hold).
0.85::true_val(edge_hold, strong_moderated_3bt); 0.15::true_val(edge_hold, unk_edge_hold).
measured(s30, edge_hold, strong_moderated_3bt).
measured(s40, edge_hold, strong_moderated_3bt).
all_consistent(edge_hold) :- (indep(s30), consistent(s30, edge_hold) ; \+indep(s30)), consistent(s40, edge_hold).
evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, strong_moderated_3bt)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr float_powder
% @type categorical
% @canonical false
% @original_name Float (powder)
% @values moderate_hull_65=Moderate_SideKick_hull_float_ratio_65_100 unk_float_powder=Unknown
% @importance 0.85

0.80::acc(s29, float_powder).
0.68::true_val(float_powder, moderate_hull_65); 0.32::true_val(float_powder, unk_float_powder).
measured(s29, float_powder, moderate_hull_65).
all_consistent(float_powder) :- consistent(s29, float_powder).
evidence(all_consistent(float_powder)).
query(true_val(float_powder, moderate_hull_65)).
query(true_val(float_powder, unk_float_powder)).

% @attr turn_initiation_performance
% @type categorical
% @canonical false
% @original_name turn_initiation_performance
% @values ultra_responsive=Ultra_responsive_edge_to_edge_transitions unk_turn_initiation_performance=Unknown
% @importance 1.0

0.90::acc(s1, turn_initiation_performance).
0.92::true_val(turn_initiation_performance, ultra_responsive); 0.08::true_val(turn_initiation_performance, unk_turn_initiation_performance).
measured(s1, turn_initiation_performance, ultra_responsive).
all_consistent(turn_initiation_performance) :- consistent(s1, turn_initiation_performance).
evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, ultra_responsive)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr chatter_performance
% @type categorical
% @canonical false
% @original_name chatter_performance
% @values flex_walls_impact_reduce=Flex_Walls_and_Impact_Plates_reduce_chatter unk_chatter_performance=Unknown
% @importance 0.825

0.92::acc(s1, chatter_performance).
0.80::acc(s32, chatter_performance).
0.95::true_val(chatter_performance, flex_walls_impact_reduce); 0.05::true_val(chatter_performance, unk_chatter_performance).
measured(s1, chatter_performance, flex_walls_impact_reduce).
measured(s32, chatter_performance, flex_walls_impact_reduce).
all_consistent(chatter_performance) :- consistent(s1, chatter_performance), (indep(s32), consistent(s32, chatter_performance) ; \+indep(s32)).
evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, flex_walls_impact_reduce)).
query(true_val(chatter_performance, unk_chatter_performance)).

% @attr catch_free_riding
% @type categorical
% @canonical false
% @original_name Catch-free riding
% @values tbt_reduces_edge_catch=3BT_reduces_edge_catch_risk unk_catch_free_riding=Unknown
% @importance 1.0

0.90::acc(s1, catch_free_riding).
0.92::true_val(catch_free_riding, tbt_reduces_edge_catch); 0.08::true_val(catch_free_riding, unk_catch_free_riding).
measured(s1, catch_free_riding, tbt_reduces_edge_catch).
all_consistent(catch_free_riding) :- consistent(s1, catch_free_riding).
evidence(all_consistent(catch_free_riding)).
query(true_val(catch_free_riding, tbt_reduces_edge_catch)).
query(true_val(catch_free_riding, unk_catch_free_riding)).

% @attr switch_riding
% @type categorical
% @canonical false
% @original_name switch_riding
% @values competent_directional_bias=Competent_switch_despite_directional_bias unk_switch_riding=Unknown
% @importance 0.5

0.65::acc(s33, switch_riding).
0.44::true_val(switch_riding, competent_directional_bias); 0.56::true_val(switch_riding, unk_switch_riding).
measured(s33, switch_riding, competent_directional_bias).
all_consistent(switch_riding) :- consistent(s33, switch_riding).
evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, competent_directional_bias)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr low_speed_performance
% @type categorical
% @canonical false
% @original_name Low-speed performance
% @values requires_effort=Requires_effort_at_low_speeds unk_low_speed_performance=Unknown
% @importance 1.0

0.78::acc(s1, low_speed_performance).
0.92::true_val(low_speed_performance, requires_effort); 0.08::true_val(low_speed_performance, unk_low_speed_performance).
measured(s1, low_speed_performance, requires_effort).
all_consistent(low_speed_performance) :- consistent(s1, low_speed_performance).
evidence(all_consistent(low_speed_performance)).
query(true_val(low_speed_performance, requires_effort)).
query(true_val(low_speed_performance, unk_low_speed_performance)).

% @attr high_speed_performance
% @type categorical
% @canonical false
% @original_name High-speed performance
% @values excels_rock_steady=Excels_rock_steady_at_medium_to_high_speeds unk_high_speed_performance=Unknown
% @importance 0.75

0.75::acc(s38, high_speed_performance).
0.43::true_val(high_speed_performance, excels_rock_steady); 0.57::true_val(high_speed_performance, unk_high_speed_performance).
measured(s38, high_speed_performance, excels_rock_steady).
all_consistent(high_speed_performance) :- consistent(s38, high_speed_performance).
evidence(all_consistent(high_speed_performance)).
query(true_val(high_speed_performance, excels_rock_steady)).
query(true_val(high_speed_performance, unk_high_speed_performance)).

% @attr carving_rating_tgr
% @type categorical
% @canonical true
% @original_name carving_rating_tgr
% @values excellent_solid_drive=Excellent_solid_drive_at_end_of_turns unk_carving_rating_tgr=Unknown
% @importance 0.75

0.75::acc(s38, carving_rating_tgr).
0.43::true_val(carving_rating_tgr, excellent_solid_drive); 0.57::true_val(carving_rating_tgr, unk_carving_rating_tgr).
measured(s38, carving_rating_tgr, excellent_solid_drive).
all_consistent(carving_rating_tgr) :- consistent(s38, carving_rating_tgr).
evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, excellent_solid_drive)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

% @attr buttering_pressing
% @type categorical
% @canonical false
% @original_name Buttering/pressing
% @values possible_more_strength=Possible_but_requires_more_strength_stiff unk_buttering_pressing=Unknown
% @importance 1.0

0.80::acc(s1, buttering_pressing).
0.92::true_val(buttering_pressing, possible_more_strength); 0.08::true_val(buttering_pressing, unk_buttering_pressing).
measured(s1, buttering_pressing, possible_more_strength).
all_consistent(buttering_pressing) :- consistent(s1, buttering_pressing).
evidence(all_consistent(buttering_pressing)).
query(true_val(buttering_pressing, possible_more_strength)).
query(true_val(buttering_pressing, unk_buttering_pressing)).

% @attr evo_reputation
% @type categorical
% @canonical false
% @original_name evo.com reputation
% @values major_us_retailer=Major_US_retailer_price_match_free_shipping unk_evo_reputation=Unknown
% @importance 0.95

0.85::acc(s2, evo_reputation).
0.77::true_val(evo_reputation, major_us_retailer); 0.23::true_val(evo_reputation, unk_evo_reputation).
measured(s2, evo_reputation, major_us_retailer).
all_consistent(evo_reputation) :- consistent(s2, evo_reputation).
evidence(all_consistent(evo_reputation)).
query(true_val(evo_reputation, major_us_retailer)).
query(true_val(evo_reputation, unk_evo_reputation)).

% @attr s2as_reputation
% @type categorical
% @canonical false
% @original_name S2AS reputation
% @values uk_authorized_15yr=UK_authorized_Bataleon_dealer_15_plus_years unk_s2as_reputation=Unknown
% @importance 0.85

0.80::acc(s29, s2as_reputation).
0.68::true_val(s2as_reputation, uk_authorized_15yr); 0.32::true_val(s2as_reputation, unk_s2as_reputation).
measured(s29, s2as_reputation, uk_authorized_15yr).
all_consistent(s2as_reputation) :- consistent(s29, s2as_reputation).
evidence(all_consistent(s2as_reputation)).
query(true_val(s2as_reputation, uk_authorized_15yr)).
query(true_val(s2as_reputation, unk_s2as_reputation)).

% @attr absolute_snow_reputation
% @type categorical
% @canonical false
% @original_name Absolute-Snow reputation
% @values uk_specialist=UK_specialist_snow_sports_price_match unk_absolute_snow_reputation=Unknown
% @importance 0.65

0.78::acc(s32, absolute_snow_reputation).
0.64::true_val(absolute_snow_reputation, uk_specialist); 0.36::true_val(absolute_snow_reputation, unk_absolute_snow_reputation).
measured(s32, absolute_snow_reputation, uk_specialist).
all_consistent(absolute_snow_reputation) :- consistent(s32, absolute_snow_reputation).
evidence(all_consistent(absolute_snow_reputation)).
query(true_val(absolute_snow_reputation, uk_specialist)).
query(true_val(absolute_snow_reputation, unk_absolute_snow_reputation)).

% @attr eriks_reputation
% @type categorical
% @canonical false
% @original_name ERIK'S reputation
% @values us_midwest_free_install=US_Midwest_retailer_free_binding_install unk_eriks_reputation=Unknown
% @importance 0.7

0.78::acc(s31, eriks_reputation).
0.56::true_val(eriks_reputation, us_midwest_free_install); 0.44::true_val(eriks_reputation, unk_eriks_reputation).
measured(s31, eriks_reputation, us_midwest_free_install).
all_consistent(eriks_reputation) :- consistent(s31, eriks_reputation).
evidence(all_consistent(eriks_reputation)).
query(true_val(eriks_reputation, us_midwest_free_install)).
query(true_val(eriks_reputation, unk_eriks_reputation)).

% @attr glisshop_reputation
% @type categorical
% @canonical false
% @original_name Glisshop reputation
% @values european_france_multi=European_France_based_multi_brand unk_glisshop_reputation=Unknown
% @importance 0.7

0.78::acc(s30, glisshop_reputation).
0.60::true_val(glisshop_reputation, european_france_multi); 0.40::true_val(glisshop_reputation, unk_glisshop_reputation).
measured(s30, glisshop_reputation, european_france_multi).
all_consistent(glisshop_reputation) :- consistent(s30, glisshop_reputation).
evidence(all_consistent(glisshop_reputation)).
query(true_val(glisshop_reputation, european_france_multi)).
query(true_val(glisshop_reputation, unk_glisshop_reputation)).

% @attr freeride_boardshop_reputation
% @type categorical
% @canonical false
% @original_name Freeride Boardshop reputation
% @values canadian_authorized=Canadian_authorized_dealer unk_freeride_boardshop_reputation=Unknown
% @importance 0.85

0.78::acc(s28, freeride_boardshop_reputation).
0.60::true_val(freeride_boardshop_reputation, canadian_authorized); 0.40::true_val(freeride_boardshop_reputation, unk_freeride_boardshop_reputation).
measured(s28, freeride_boardshop_reputation, canadian_authorized).
all_consistent(freeride_boardshop_reputation) :- consistent(s28, freeride_boardshop_reputation).
evidence(all_consistent(freeride_boardshop_reputation)).
query(true_val(freeride_boardshop_reputation, canadian_authorized)).
query(true_val(freeride_boardshop_reputation, unk_freeride_boardshop_reputation)).

% @attr blauer_board_shop_reputation
% @type categorical
% @canonical false
% @original_name Blauer Board Shop reputation
% @values us_specialty=US_specialty_snowboard_retailer unk_blauer_board_shop_reputation=Unknown
% @importance 0.7

0.72::acc(s36, blauer_board_shop_reputation).
0.49::true_val(blauer_board_shop_reputation, us_specialty); 0.51::true_val(blauer_board_shop_reputation, unk_blauer_board_shop_reputation).
measured(s36, blauer_board_shop_reputation, us_specialty).
all_consistent(blauer_board_shop_reputation) :- consistent(s36, blauer_board_shop_reputation).
evidence(all_consistent(blauer_board_shop_reputation)).
query(true_val(blauer_board_shop_reputation, us_specialty)).
query(true_val(blauer_board_shop_reputation, unk_blauer_board_shop_reputation)).

% @attr bataleon_direct_reputation
% @type categorical
% @canonical false
% @original_name Bataleon direct (bataleon.com)
% @values free_ship_45day_warranty=Free_shipping_over_50_45day_returns_2plus1_warranty unk_bataleon_direct_reputation=Unknown
% @importance 1.0

0.93::acc(s1, bataleon_direct_reputation).
0.92::true_val(bataleon_direct_reputation, free_ship_45day_warranty); 0.08::true_val(bataleon_direct_reputation, unk_bataleon_direct_reputation).
measured(s1, bataleon_direct_reputation, free_ship_45day_warranty).
all_consistent(bataleon_direct_reputation) :- consistent(s1, bataleon_direct_reputation).
evidence(all_consistent(bataleon_direct_reputation)).
query(true_val(bataleon_direct_reputation, free_ship_45day_warranty)).
query(true_val(bataleon_direct_reputation, unk_bataleon_direct_reputation)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values advanced_skill_required=Requires_advanced_skill_and_strength unk_negative_aspect=Unknown
% @importance 0.85

0.90::acc(s1, negative_aspect).
0.78::acc(s31, negative_aspect).
0.92::true_val(negative_aspect, advanced_skill_required); 0.08::true_val(negative_aspect, unk_negative_aspect).
measured(s1, negative_aspect, advanced_skill_required).
measured(s31, negative_aspect, advanced_skill_required).
all_consistent(negative_aspect) :- consistent(s1, negative_aspect), (indep(s31), consistent(s31, negative_aspect) ; \+indep(s31)).
evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, advanced_skill_required)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_daily_driver
% @type categorical
% @canonical false
% @original_name negative_aspect (not daily driver)
% @values not_daily_driver=Not_a_daily_driver_best_for_high_speed_sessions unk_negative_aspect_daily_driver=Unknown
% @importance 0.75

0.72::acc(s38, negative_aspect_daily_driver).
0.43::true_val(negative_aspect_daily_driver, not_daily_driver); 0.57::true_val(negative_aspect_daily_driver, unk_negative_aspect_daily_driver).
measured(s38, negative_aspect_daily_driver, not_daily_driver).
all_consistent(negative_aspect_daily_driver) :- consistent(s38, negative_aspect_daily_driver).
evidence(all_consistent(negative_aspect_daily_driver)).
query(true_val(negative_aspect_daily_driver, not_daily_driver)).
query(true_val(negative_aspect_daily_driver, unk_negative_aspect_daily_driver)).

% @attr negative_aspect_3bt_adjustment
% @type categorical
% @canonical false
% @original_name negative_aspect (3BT adjustment)
% @values adjustment_needed=Riders_from_traditional_boards_need_adjustment_time unk_negative_aspect_3bt_adjustment=Unknown
% @importance 0.725

0.65::acc(s40, negative_aspect_3bt_adjustment).
0.55::acc(s41, negative_aspect_3bt_adjustment).
0.70::true_val(negative_aspect_3bt_adjustment, adjustment_needed); 0.30::true_val(negative_aspect_3bt_adjustment, unk_negative_aspect_3bt_adjustment).
measured(s40, negative_aspect_3bt_adjustment, adjustment_needed).
measured(s41, negative_aspect_3bt_adjustment, adjustment_needed).
all_consistent(negative_aspect_3bt_adjustment) :- consistent(s40, negative_aspect_3bt_adjustment), consistent(s41, negative_aspect_3bt_adjustment).
evidence(all_consistent(negative_aspect_3bt_adjustment)).
query(true_val(negative_aspect_3bt_adjustment, adjustment_needed)).
query(true_val(negative_aspect_3bt_adjustment, unk_negative_aspect_3bt_adjustment)).

% @attr negative_aspect_warranty
% @type categorical
% @canonical false
% @original_name negative_aspect (warranty experience)
% @values poor_warranty_different_model=Poor_warranty_experience_reported_different_model unk_negative_aspect_warranty=Unknown
% @importance 0.65

0.55::acc(s46, negative_aspect_warranty).
0.28::true_val(negative_aspect_warranty, poor_warranty_different_model); 0.72::true_val(negative_aspect_warranty, unk_negative_aspect_warranty).
measured(s46, negative_aspect_warranty, poor_warranty_different_model).
all_consistent(negative_aspect_warranty) :- consistent(s46, negative_aspect_warranty).
evidence(all_consistent(negative_aspect_warranty)).
query(true_val(negative_aspect_warranty, poor_warranty_different_model)).
query(true_val(negative_aspect_warranty, unk_negative_aspect_warranty)).

% @attr negative_aspect_courier
% @type categorical
% @canonical false
% @original_name negative_aspect (courier)
% @values courier_issues=Some_users_report_courier_service_issues unk_negative_aspect_courier=Unknown
% @importance 0.65

0.55::acc(s46, negative_aspect_courier).
0.28::true_val(negative_aspect_courier, courier_issues); 0.72::true_val(negative_aspect_courier, unk_negative_aspect_courier).
measured(s46, negative_aspect_courier, courier_issues).
all_consistent(negative_aspect_courier) :- consistent(s46, negative_aspect_courier).
evidence(all_consistent(negative_aspect_courier)).
query(true_val(negative_aspect_courier, courier_issues)).
query(true_val(negative_aspect_courier, unk_negative_aspect_courier)).

% @attr base_color_randomness
% @type categorical
% @canonical false
% @original_name Base color randomness
% @values color_may_differ=Base_colour_may_differ_from_website_picture unk_base_color_randomness=Unknown
% @importance 0.7

0.78::acc(s30, base_color_randomness).
0.60::true_val(base_color_randomness, color_may_differ); 0.40::true_val(base_color_randomness, unk_base_color_randomness).
measured(s30, base_color_randomness, color_may_differ).
all_consistent(base_color_randomness) :- consistent(s30, base_color_randomness).
evidence(all_consistent(base_color_randomness)).
query(true_val(base_color_randomness, color_may_differ)).
query(true_val(base_color_randomness, unk_base_color_randomness)).