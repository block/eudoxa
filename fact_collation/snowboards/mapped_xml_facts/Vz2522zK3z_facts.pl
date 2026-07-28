0.25::indep(s1).
0.15::indep(s3).
0.30::indep(s4).
0.20::indep(s5).
0.35::indep(s6).
0.15::indep(s13).
0.20::indep(s22).
0.20::indep(s26).
0.15::indep(s27).
0.15::indep(s28).
0.10::indep(s29).
0.15::indep(s30).
0.10::indep(s31).
0.10::indep(s32).
0.20::indep(s33).
0.25::indep(s37).
0.20::indep(s43).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values bataleon=Bataleon unk_brand=Unknown
% @importance 1.0

0.95::true_val(brand, bataleon); 0.05::true_val(brand, unk_brand).
0.90::acc(s1, brand).
measured(s1, brand, bataleon).
all_consistent(brand) :- (indep(s1), consistent(s1, brand) ; \+indep(s1)).
evidence(all_consistent(brand)).
query(true_val(brand, bataleon)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values tornado_beyond_medals=Tornado_Beyond_Medals unk_model_name=Unknown
% @importance 0.9

0.95::true_val(model_name, tornado_beyond_medals); 0.05::true_val(model_name, unk_model_name).
0.93::acc(s2, model_name).
0.80::acc(s3, model_name).
measured(s2, model_name, tornado_beyond_medals).
measured(s3, model_name, tornado_beyond_medals).
all_consistent(model_name) :-
    consistent(s2, model_name),
    (indep(s3), consistent(s3, model_name) ; \+indep(s3)).
evidence(all_consistent(model_name)).
query(true_val(model_name, tornado_beyond_medals)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type numeric
% @canonical true
% @original_name model_year
% @values v2027=2027 unk_model_year=Unknown
% @importance 1.0

0.95::true_val(model_year, v2027); 0.05::true_val(model_year, unk_model_year).
0.90::acc(s4, model_year).
measured(s4, model_year, v2027).
all_consistent(model_year) :- (indep(s4), consistent(s4, model_year) ; \+indep(s4)).
evidence(all_consistent(model_year)).
query(true_val(model_year, v2027)).
query(true_val(model_year, unk_model_year)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values mens_snowboard=Mens_Snowboard unk_product_type=Unknown
% @importance 0.9

0.95::true_val(product_type, mens_snowboard); 0.05::true_val(product_type, unk_product_type).
0.85::acc(s5, product_type).
measured(s5, product_type, mens_snowboard).
all_consistent(product_type) :- (indep(s5), consistent(s5, product_type) ; \+indep(s5)).
evidence(all_consistent(product_type)).
query(true_val(product_type, mens_snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain=All_Mountain unk_board_category=Unknown
% @importance 1.0

0.95::true_val(board_category, all_mountain); 0.05::true_val(board_category, unk_board_category).
0.88::acc(s4, board_category).
measured(s4, board_category, all_mountain).
all_consistent(board_category) :- (indep(s4), consistent(s4, board_category) ; \+indep(s4)).
evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain)).
query(true_val(board_category, unk_board_category)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values all_mountain_freestyle=All_Mountain_Freestyle unk_riding_style=Unknown
% @importance 0.85

0.92::true_val(riding_style, all_mountain_freestyle); 0.08::true_val(riding_style, unk_riding_style).
0.82::acc(s6, riding_style).
measured(s6, riding_style, all_mountain_freestyle).
all_consistent(riding_style) :- (indep(s6), consistent(s6, riding_style) ; \+indep(s6)).
evidence(all_consistent(riding_style)).
query(true_val(riding_style, all_mountain_freestyle)).
query(true_val(riding_style, unk_riding_style)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.9

0.95::true_val(gender, mens); 0.05::true_val(gender, unk_gender).
0.85::acc(s5, gender).
measured(s5, gender, mens).
all_consistent(gender) :- (indep(s5), consistent(s5, gender) ; \+indep(s5)).
evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values tor_lundstrom_bynd_mdls=Tor_Lundstrom_and_BYND_x_MDLS_crew unk_pro_rider_name=Unknown
% @importance 1.0

0.95::true_val(pro_rider_name, tor_lundstrom_bynd_mdls); 0.05::true_val(pro_rider_name, unk_pro_rider_name).
0.94::acc(s2, pro_rider_name).
measured(s2, pro_rider_name, tor_lundstrom_bynd_mdls).
all_consistent(pro_rider_name) :- consistent(s2, pro_rider_name).
evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, tor_lundstrom_bynd_mdls)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr pro_rider_name_collab_founders
% @type categorical
% @canonical false
% @original_name pro_rider_name (Beyond Medals founders)
% @values tor_kevin_2012=Beyond_Medals_cofounded_2012_Tor_Lundstrom_Kevin_Backstrom unk_pro_rider_collab=Unknown
% @importance 0.5

0.90::true_val(pro_rider_name_collab_founders, tor_kevin_2012); 0.10::true_val(pro_rider_name_collab_founders, unk_pro_rider_collab).
0.80::acc(s7, pro_rider_name_collab_founders).
measured(s7, pro_rider_name_collab_founders, tor_kevin_2012).
all_consistent(pro_rider_name_collab_founders) :- consistent(s7, pro_rider_name_collab_founders).
evidence(all_consistent(pro_rider_name_collab_founders)).
query(true_val(pro_rider_name_collab_founders, tor_kevin_2012)).
query(true_val(pro_rider_name_collab_founders, unk_pro_rider_collab)).

% @attr tor_lundstrom_nationality
% @type categorical
% @canonical false
% @original_name Tor Lundstrom nationality
% @values swedish_gothenburg=Swedish_from_Gothenburg unk_tor_nationality=Unknown
% @importance 0.3

0.85::true_val(tor_lundstrom_nationality, swedish_gothenburg); 0.15::true_val(tor_lundstrom_nationality, unk_tor_nationality).
0.82::acc(s8, tor_lundstrom_nationality).
measured(s8, tor_lundstrom_nationality, swedish_gothenburg).
all_consistent(tor_lundstrom_nationality) :- consistent(s8, tor_lundstrom_nationality).
evidence(all_consistent(tor_lundstrom_nationality)).
query(true_val(tor_lundstrom_nationality, swedish_gothenburg)).
query(true_val(tor_lundstrom_nationality, unk_tor_nationality)).

% @attr beyond_medals_collaboration_history
% @type categorical
% @canonical false
% @original_name Beyond Medals collaboration history
% @values ten_plus_years=Over_ten_years_collaboration_since_day_one unk_collab_history=Unknown
% @importance 0.5

0.90::true_val(beyond_medals_collaboration_history, ten_plus_years); 0.10::true_val(beyond_medals_collaboration_history, unk_collab_history).
0.90::acc(s9, beyond_medals_collaboration_history).
measured(s9, beyond_medals_collaboration_history, ten_plus_years).
all_consistent(beyond_medals_collaboration_history) :- consistent(s9, beyond_medals_collaboration_history).
evidence(all_consistent(beyond_medals_collaboration_history)).
query(true_val(beyond_medals_collaboration_history, ten_plus_years)).
query(true_val(beyond_medals_collaboration_history, unk_collab_history)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values goliath_whatever_blend=Combines_Goliath_power_and_Whatever_versatility unk_comparable_same=Unknown
% @importance 0.85

0.95::true_val(comparable_board_same_brand, goliath_whatever_blend); 0.05::true_val(comparable_board_same_brand, unk_comparable_same).
0.93::acc(s2, comparable_board_same_brand).
measured(s2, comparable_board_same_brand, goliath_whatever_blend).
all_consistent(comparable_board_same_brand) :- consistent(s2, comparable_board_same_brand).
evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, goliath_whatever_blend)).
query(true_val(comparable_board_same_brand, unk_comparable_same)).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values whatever_beyond_medals=Whatever_Beyond_Medals_variant unk_predecessor=Unknown
% @importance 0.8

0.90::true_val(predecessor_model_name, whatever_beyond_medals); 0.10::true_val(predecessor_model_name, unk_predecessor).
0.82::acc(s10, predecessor_model_name).
measured(s10, predecessor_model_name, whatever_beyond_medals).
all_consistent(predecessor_model_name) :- consistent(s10, predecessor_model_name).
evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, whatever_beyond_medals)).
query(true_val(predecessor_model_name, unk_predecessor)).

% @attr model_first_available_year
% @type numeric
% @canonical true
% @original_name model_first_available_year
% @values v2026=2026 unk_first_year=Unknown
% @importance 0.8

0.90::true_val(model_first_available_year, v2026); 0.10::true_val(model_first_available_year, unk_first_year).
0.82::acc(s10, model_first_available_year).
measured(s10, model_first_available_year, v2026).
all_consistent(model_first_available_year) :- consistent(s10, model_first_available_year).
evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, v2026)).
query(true_val(model_first_available_year, unk_first_year)).

% @attr model_description_evo
% @type categorical
% @canonical false
% @original_name Model description from evo
% @values high_octane_freestyle=High_octane_freestyle_weapon_with_Tor_Lundstrom unk_model_desc=Unknown
% @importance 0.9

0.85::true_val(model_description_evo, high_octane_freestyle); 0.15::true_val(model_description_evo, unk_model_desc).
0.80::acc(s5, model_description_evo).
measured(s5, model_description_evo, high_octane_freestyle).
all_consistent(model_description_evo) :- (indep(s5), consistent(s5, model_description_evo) ; \+indep(s5)).
evidence(all_consistent(model_description_evo)).
query(true_val(model_description_evo, high_octane_freestyle)).
query(true_val(model_description_evo, unk_model_desc)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values bataleon_nidecker_group=Bataleon_part_of_Nidecker_Group unk_manufacturer=Unknown
% @importance 0.7

0.95::true_val(manufacturer, bataleon_nidecker_group); 0.05::true_val(manufacturer, unk_manufacturer).
0.94::acc(s11, manufacturer).
measured(s11, manufacturer, bataleon_nidecker_group).
all_consistent(manufacturer) :- consistent(s11, manufacturer).
evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, bataleon_nidecker_group)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr nidecker_group_portfolio
% @type categorical
% @canonical false
% @original_name Nidecker Group portfolio
% @values full_portfolio=Bataleon_Emerica_eS_Etnies_Jones_Nidecker_Rome_Thirtytwo_YES unk_portfolio=Unknown
% @importance 0.7

0.95::true_val(nidecker_group_portfolio, full_portfolio); 0.05::true_val(nidecker_group_portfolio, unk_portfolio).
0.94::acc(s11, nidecker_group_portfolio).
measured(s11, nidecker_group_portfolio, full_portfolio).
all_consistent(nidecker_group_portfolio) :- consistent(s11, nidecker_group_portfolio).
evidence(all_consistent(nidecker_group_portfolio)).
query(true_val(nidecker_group_portfolio, full_portfolio)).
query(true_val(nidecker_group_portfolio, unk_portfolio)).

% @attr nidecker_group_heritage
% @type categorical
% @canonical false
% @original_name Nidecker Group heritage
% @values founded_1887_swiss=Founded_1887_Swiss_Alps_family_owned_five_generations unk_heritage=Unknown
% @importance 0.7

0.95::true_val(nidecker_group_heritage, founded_1887_swiss); 0.05::true_val(nidecker_group_heritage, unk_heritage).
0.94::acc(s11, nidecker_group_heritage).
measured(s11, nidecker_group_heritage, founded_1887_swiss).
all_consistent(nidecker_group_heritage) :- consistent(s11, nidecker_group_heritage).
evidence(all_consistent(nidecker_group_heritage)).
query(true_val(nidecker_group_heritage, founded_1887_swiss)).
query(true_val(nidecker_group_heritage, unk_heritage)).

% @attr bataleon_founder
% @type categorical
% @canonical false
% @original_name Bataleon founder
% @values jorgen_karlson_2000=Jorgen_Karlson_biophysicist_founded_2000 unk_founder=Unknown
% @importance 0.4

0.75::true_val(bataleon_founder, jorgen_karlson_2000); 0.25::true_val(bataleon_founder, unk_founder).
0.65::acc(s12, bataleon_founder).
measured(s12, bataleon_founder, jorgen_karlson_2000).
all_consistent(bataleon_founder) :- consistent(s12, bataleon_founder).
evidence(all_consistent(bataleon_founder)).
query(true_val(bataleon_founder, jorgen_karlson_2000)).
query(true_val(bataleon_founder, unk_founder)).

% @attr bataleon_us_address
% @type categorical
% @canonical false
% @original_name Bataleon US address
% @values seattle_55_atlantic=55_S_Atlantic_Street_Unit_202_Seattle_USA unk_us_address=Unknown
% @importance 0.6

0.90::true_val(bataleon_us_address, seattle_55_atlantic); 0.10::true_val(bataleon_us_address, unk_us_address).
0.85::acc(s13, bataleon_us_address).
measured(s13, bataleon_us_address, seattle_55_atlantic).
all_consistent(bataleon_us_address) :- (indep(s13), consistent(s13, bataleon_us_address) ; \+indep(s13)).
evidence(all_consistent(bataleon_us_address)).
query(true_val(bataleon_us_address, seattle_55_atlantic)).
query(true_val(bataleon_us_address, unk_us_address)).

% @attr european_representative
% @type categorical
% @canonical false
% @original_name European representative
% @values low_pressure_amsterdam=Low_Pressure_Studio_Amsterdam_Netherlands unk_eu_rep=Unknown
% @importance 0.6

0.90::true_val(european_representative, low_pressure_amsterdam); 0.10::true_val(european_representative, unk_eu_rep).
0.85::acc(s13, european_representative).
measured(s13, european_representative, low_pressure_amsterdam).
all_consistent(european_representative) :- (indep(s13), consistent(s13, european_representative) ; \+indep(s13)).
evidence(all_consistent(european_representative)).
query(true_val(european_representative, low_pressure_amsterdam)).
query(true_val(european_representative, unk_eu_rep)).

% @attr bataleon_brand_age
% @type categorical
% @canonical false
% @original_name Bataleon brand age
% @values over_20_years=Over_20_years_3D_snowboard_tech_leadership unk_brand_age=Unknown
% @importance 0.5

0.88::true_val(bataleon_brand_age, over_20_years); 0.12::true_val(bataleon_brand_age, unk_brand_age).
0.85::acc(s14, bataleon_brand_age).
measured(s14, bataleon_brand_age, over_20_years).
all_consistent(bataleon_brand_age) :- consistent(s14, bataleon_brand_age).
evidence(all_consistent(bataleon_brand_age)).
query(true_val(bataleon_brand_age, over_20_years)).
query(true_val(bataleon_brand_age, unk_brand_age)).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values austria_mothership=Austria_Mothership sws_dubai=SWS_Dubai unk_mfg_location=Unknown
% @importance 0.68

0.22::true_val(manufacturing_location_current, austria_mothership); 0.73::true_val(manufacturing_location_current, sws_dubai); 0.05::true_val(manufacturing_location_current, unk_mfg_location).
0.45::acc(s15, manufacturing_location_current).
0.88::acc(s16, manufacturing_location_current).
0.60::acc(s18, manufacturing_location_current).
measured(s15, manufacturing_location_current, austria_mothership).
measured(s16, manufacturing_location_current, sws_dubai).
measured(s18, manufacturing_location_current, sws_dubai).
all_consistent(manufacturing_location_current) :-
    consistent(s15, manufacturing_location_current),
    consistent(s16, manufacturing_location_current),
    consistent(s18, manufacturing_location_current).
evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, austria_mothership)).
query(true_val(manufacturing_location_current, sws_dubai)).
query(true_val(manufacturing_location_current, unk_mfg_location)).

% @attr manufacturing_location_prior
% @type categorical
% @canonical true
% @original_name manufacturing_location_prior
% @values multi_moves=Elan_Austria_Asia_CAPiTA_Mothership_Titan_China_SWS unk_mfg_prior=Unknown
% @importance 0.65

0.75::true_val(manufacturing_location_prior, multi_moves); 0.25::true_val(manufacturing_location_prior, unk_mfg_prior).
0.65::acc(s17, manufacturing_location_prior).
measured(s17, manufacturing_location_prior, multi_moves).
all_consistent(manufacturing_location_prior) :- consistent(s17, manufacturing_location_prior).
evidence(all_consistent(manufacturing_location_prior)).
query(true_val(manufacturing_location_prior, multi_moves)).
query(true_val(manufacturing_location_prior, unk_mfg_prior)).

% @attr manufacturing_location_summary
% @type categorical
% @canonical false
% @original_name manufacturing_location_current (summary note)
% @values unclear_likely_sws=Multiple_sources_conflict_likely_SWS_Dubai_or_Asia unk_mfg_summary=Unknown
% @importance 0.68

0.80::true_val(manufacturing_location_summary, unclear_likely_sws); 0.20::true_val(manufacturing_location_summary, unk_mfg_summary).
0.75::acc(s16, manufacturing_location_summary).
0.60::acc(s17, manufacturing_location_summary).
0.55::acc(s18, manufacturing_location_summary).
measured(s16, manufacturing_location_summary, unclear_likely_sws).
measured(s17, manufacturing_location_summary, unclear_likely_sws).
measured(s18, manufacturing_location_summary, unclear_likely_sws).
all_consistent(manufacturing_location_summary) :-
    consistent(s16, manufacturing_location_summary),
    consistent(s17, manufacturing_location_summary),
    consistent(s18, manufacturing_location_summary).
evidence(all_consistent(manufacturing_location_summary)).
query(true_val(manufacturing_location_summary, unclear_likely_sws)).
query(true_val(manufacturing_location_summary, unk_mfg_summary)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values two_year_limited=2_year_limited_warranty_manufacturing_defects unk_warranty=Unknown
% @importance 0.8

0.95::true_val(warranty, two_year_limited); 0.05::true_val(warranty, unk_warranty).
0.95::acc(s19, warranty).
measured(s19, warranty, two_year_limited).
all_consistent(warranty) :- consistent(s19, warranty).
evidence(all_consistent(warranty)).
query(true_val(warranty, two_year_limited)).
query(true_val(warranty, unk_warranty)).

% @attr warranty_period_years
% @type numeric
% @unit years
% @canonical true
% @original_name warranty_period_years
% @values v3=3.0 unk_warranty_years=Unknown
% @importance 0.75

0.95::true_val(warranty_period_years, v3); 0.05::true_val(warranty_period_years, unk_warranty_years).
0.94::acc(s20, warranty_period_years).
measured(s20, warranty_period_years, v3).
all_consistent(warranty_period_years) :- consistent(s20, warranty_period_years).
evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v3)).
query(true_val(warranty_period_years, unk_warranty_years)).

% @attr return_policy_terms
% @type categorical
% @canonical true
% @original_name return_policy_terms
% @values d45_return=45_day_returns_from_Bataleon_direct unk_return=Unknown
% @importance 0.7

0.90::true_val(return_policy_terms, d45_return); 0.10::true_val(return_policy_terms, unk_return).
0.92::acc(s21, return_policy_terms).
measured(s21, return_policy_terms, d45_return).
all_consistent(return_policy_terms) :- consistent(s21, return_policy_terms).
evidence(all_consistent(return_policy_terms)).
query(true_val(return_policy_terms, d45_return)).
query(true_val(return_policy_terms, unk_return)).

% @attr warranty_period_years_retailer
% @type numeric
% @unit months
% @canonical false
% @original_name warranty_period_years (retailer)
% @values v12=12 unk_warranty_retailer=Unknown
% @importance 0.6

0.80::true_val(warranty_period_years_retailer, v12); 0.20::true_val(warranty_period_years_retailer, unk_warranty_retailer).
0.78::acc(s22, warranty_period_years_retailer).
measured(s22, warranty_period_years_retailer, v12).
all_consistent(warranty_period_years_retailer) :- (indep(s22), consistent(s22, warranty_period_years_retailer) ; \+indep(s22)).
evidence(all_consistent(warranty_period_years_retailer)).
query(true_val(warranty_period_years_retailer, v12)).
query(true_val(warranty_period_years_retailer, unk_warranty_retailer)).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v1049_99=1049.99 unk_price_aud=Unknown
% @importance 1.0

0.90::true_val(price_aud_merchant, v1049_99); 0.10::true_val(price_aud_merchant, unk_price_aud).
0.88::acc(s4, price_aud_merchant).
measured(s4, price_aud_merchant, v1049_99).
all_consistent(price_aud_merchant) :- (indep(s4), consistent(s4, price_aud_merchant) ; \+indep(s4)).
evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v1049_99)).
query(true_val(price_aud_merchant, unk_price_aud)).

% @attr estimated_availability_date
% @type categorical
% @canonical true
% @original_name estimated_availability_date
% @values may_1_2026=May_1_2026_preorder unk_avail_date=Unknown
% @importance 1.0

0.90::true_val(estimated_availability_date, may_1_2026); 0.10::true_val(estimated_availability_date, unk_avail_date).
0.85::acc(s4, estimated_availability_date).
measured(s4, estimated_availability_date, may_1_2026).
all_consistent(estimated_availability_date) :- (indep(s4), consistent(s4, estimated_availability_date) ; \+indep(s4)).
evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, may_1_2026)).
query(true_val(estimated_availability_date, unk_avail_date)).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v599=599.0 unk_price_msrp=Unknown
% @importance 0.9

0.88::true_val(price_usd_msrp, v599); 0.12::true_val(price_usd_msrp, unk_price_msrp).
0.87::acc(s16, price_usd_msrp).
measured(s16, price_usd_msrp, v599).
all_consistent(price_usd_msrp) :- consistent(s16, price_usd_msrp).
evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v599)).
query(true_val(price_usd_msrp, unk_price_msrp)).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_evo
% @values v468_96=468.96 unk_price_evo=Unknown
% @importance 0.95

0.88::true_val(price_usd_evo, v468_96); 0.12::true_val(price_usd_evo, unk_price_evo).
0.90::acc(s23, price_usd_evo).
measured(s23, price_usd_evo, v468_96).
all_consistent(price_usd_evo) :- consistent(s23, price_usd_evo).
evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v468_96)).
query(true_val(price_usd_evo, unk_price_evo)).

% @attr price_usd_backcountry
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_backcountry
% @values v468_97=468.97 unk_price_bc=Unknown
% @importance 0.95

0.85::true_val(price_usd_backcountry, v468_97); 0.15::true_val(price_usd_backcountry, unk_price_bc).
0.83::acc(s24, price_usd_backcountry).
measured(s24, price_usd_backcountry, v468_97).
all_consistent(price_usd_backcountry) :- consistent(s24, price_usd_backcountry).
evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v468_97)).
query(true_val(price_usd_backcountry, unk_price_bc)).

% @attr price_usd_blauer
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at Blauer Board Shop (2026 model, on sale)
% @values v468_97=468.97 unk_price_blauer=Unknown
% @importance 0.95

0.85::true_val(price_usd_blauer, v468_97b); 0.15::true_val(price_usd_blauer, unk_price_blauer).
0.83::acc(s24, price_usd_blauer).
measured(s24, price_usd_blauer, v468_97b).
all_consistent(price_usd_blauer) :- consistent(s24, price_usd_blauer).
evidence(all_consistent(price_usd_blauer)).
query(true_val(price_usd_blauer, v468_97b)).
query(true_val(price_usd_blauer, unk_price_blauer)).

% @attr price_usd_gravity_coalition
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at Gravity Coalition (2026 model)
% @values v600=600.0 unk_price_gravity=Unknown
% @importance 0.95

0.85::true_val(price_usd_gravity_coalition, v600); 0.15::true_val(price_usd_gravity_coalition, unk_price_gravity).
0.83::acc(s24, price_usd_gravity_coalition).
measured(s24, price_usd_gravity_coalition, v600).
all_consistent(price_usd_gravity_coalition) :- consistent(s24, price_usd_gravity_coalition).
evidence(all_consistent(price_usd_gravity_coalition)).
query(true_val(price_usd_gravity_coalition, v600)).
query(true_val(price_usd_gravity_coalition, unk_price_gravity)).

% @attr price_eur_stoked
% @type numeric
% @unit EUR
% @canonical false
% @original_name Price at Stoked Board Shop (EU, 2026 model)
% @values v503_95=503.95 unk_price_stoked=Unknown
% @importance 0.95

0.85::true_val(price_eur_stoked, v503_95); 0.15::true_val(price_eur_stoked, unk_price_stoked).
0.83::acc(s24, price_eur_stoked).
measured(s24, price_eur_stoked, v503_95).
all_consistent(price_eur_stoked) :- consistent(s24, price_eur_stoked).
evidence(all_consistent(price_eur_stoked)).
query(true_val(price_eur_stoked, v503_95)).
query(true_val(price_eur_stoked, unk_price_stoked)).

% @attr price_eur_blue_tomato
% @type numeric
% @unit EUR
% @canonical true
% @original_name price_eur_blue_tomato
% @values v499=499.0 unk_price_bt=Unknown
% @importance 0.95

0.85::true_val(price_eur_blue_tomato, v499); 0.15::true_val(price_eur_blue_tomato, unk_price_bt).
0.83::acc(s24, price_eur_blue_tomato).
measured(s24, price_eur_blue_tomato, v499).
all_consistent(price_eur_blue_tomato) :- consistent(s24, price_eur_blue_tomato).
evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v499)).
query(true_val(price_eur_blue_tomato, unk_price_bt)).

% @attr price_eur_snowcountry
% @type numeric
% @unit EUR
% @canonical false
% @original_name Price at SnowCountry (EU, 2026 model)
% @values v535_46=535.46 unk_price_sc=Unknown
% @importance 0.95

0.85::true_val(price_eur_snowcountry, v535_46); 0.15::true_val(price_eur_snowcountry, unk_price_sc).
0.83::acc(s24, price_eur_snowcountry).
measured(s24, price_eur_snowcountry, v535_46).
all_consistent(price_eur_snowcountry) :- consistent(s24, price_eur_snowcountry).
evidence(all_consistent(price_eur_snowcountry)).
query(true_val(price_eur_snowcountry, v535_46)).
query(true_val(price_eur_snowcountry, unk_price_sc)).

% @attr shipping_restriction_merchant
% @type categorical
% @canonical false
% @original_name Shipping restriction (merchant)
% @values australia_only=Australia_only_Melbourne_Snowboard_Centre unk_shipping=Unknown
% @importance 1.0

0.90::true_val(shipping_restriction_merchant, australia_only); 0.10::true_val(shipping_restriction_merchant, unk_shipping).
0.85::acc(s4, shipping_restriction_merchant).
measured(s4, shipping_restriction_merchant, australia_only).
all_consistent(shipping_restriction_merchant) :- (indep(s4), consistent(s4, shipping_restriction_merchant) ; \+indep(s4)).
evidence(all_consistent(shipping_restriction_merchant)).
query(true_val(shipping_restriction_merchant, australia_only)).
query(true_val(shipping_restriction_merchant, unk_shipping)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values bataleon_com_sold_out=Bataleon_com_2026_all_sizes_sold_out unk_avail_bataleon=Unknown
% @importance 0.85

0.90::true_val(availability_status, bataleon_com_sold_out); 0.10::true_val(availability_status, unk_avail_bataleon).
0.90::acc(s25, availability_status).
measured(s25, availability_status, bataleon_com_sold_out).
all_consistent(availability_status) :- consistent(s25, availability_status).
evidence(all_consistent(availability_status)).
query(true_val(availability_status, bataleon_com_sold_out)).
query(true_val(availability_status, unk_avail_bataleon)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status (evo.com)
% @values evo_available=evo_com_major_US_retailer_available unk_avail_evo=Unknown
% @importance 0.95

0.88::true_val(availability_status_evo, evo_available); 0.12::true_val(availability_status_evo, unk_avail_evo).
0.85::acc(s23, availability_status_evo).
measured(s23, availability_status_evo, evo_available).
all_consistent(availability_status_evo) :- consistent(s23, availability_status_evo).
evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, evo_available)).
query(true_val(availability_status_evo, unk_avail_evo)).

% @attr availability_status_backcountry
% @type categorical
% @canonical false
% @original_name availability_status (Backcountry.com)
% @values backcountry_available=Backcountry_com_available unk_avail_bc=Unknown
% @importance 0.95

0.85::true_val(availability_status_backcountry, backcountry_available); 0.15::true_val(availability_status_backcountry, unk_avail_bc).
0.83::acc(s24, availability_status_backcountry).
measured(s24, availability_status_backcountry, backcountry_available).
all_consistent(availability_status_backcountry) :- consistent(s24, availability_status_backcountry).
evidence(all_consistent(availability_status_backcountry)).
query(true_val(availability_status_backcountry, backcountry_available)).
query(true_val(availability_status_backcountry, unk_avail_bc)).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status (Blauer Board Shop)
% @values blauer_available=Blauer_Board_Shop_specialist_retailer unk_avail_blauer=Unknown
% @importance 0.95

0.85::true_val(availability_status_blauer, blauer_available); 0.15::true_val(availability_status_blauer, unk_avail_blauer).
0.83::acc(s24, availability_status_blauer).
measured(s24, availability_status_blauer, blauer_available).
all_consistent(availability_status_blauer) :- consistent(s24, availability_status_blauer).
evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, blauer_available)).
query(true_val(availability_status_blauer, unk_avail_blauer)).

% @attr availability_status_melbourne
% @type categorical
% @canonical false
% @original_name availability_status (Melbourne Snowboard Centre)
% @values melbourne_preorder_2027=Melbourne_Snowboard_Centre_2027_preorder unk_avail_melb=Unknown
% @importance 1.0

0.90::true_val(availability_status_melbourne, melbourne_preorder_2027); 0.10::true_val(availability_status_melbourne, unk_avail_melb).
0.85::acc(s4, availability_status_melbourne).
measured(s4, availability_status_melbourne, melbourne_preorder_2027).
all_consistent(availability_status_melbourne) :- (indep(s4), consistent(s4, availability_status_melbourne) ; \+indep(s4)).
evidence(all_consistent(availability_status_melbourne)).
query(true_val(availability_status_melbourne, melbourne_preorder_2027)).
query(true_val(availability_status_melbourne, unk_avail_melb)).

% @attr availability_status_welcome
% @type categorical
% @canonical false
% @original_name availability_status (Welcome Boardstore)
% @values welcome_2027_some_sold_out=Welcome_Boardstore_2027_some_sizes_sold_out unk_avail_welcome=Unknown
% @importance 0.8

0.80::true_val(availability_status_welcome, welcome_2027_some_sold_out); 0.20::true_val(availability_status_welcome, unk_avail_welcome).
0.75::acc(s26, availability_status_welcome).
measured(s26, availability_status_welcome, welcome_2027_some_sold_out).
all_consistent(availability_status_welcome) :- (indep(s26), consistent(s26, availability_status_welcome) ; \+indep(s26)).
evidence(all_consistent(availability_status_welcome)).
query(true_val(availability_status_welcome, welcome_2027_some_sold_out)).
query(true_val(availability_status_welcome, unk_avail_welcome)).

% @attr availability_status_rhythm
% @type categorical
% @canonical false
% @original_name availability_status (Rhythm Snowsports)
% @values rhythm_2027=Rhythm_Snowsports_Australia_2027_model unk_avail_rhythm=Unknown
% @importance 0.7

0.78::true_val(availability_status_rhythm, rhythm_2027); 0.22::true_val(availability_status_rhythm, unk_avail_rhythm).
0.75::acc(s27, availability_status_rhythm).
measured(s27, availability_status_rhythm, rhythm_2027).
all_consistent(availability_status_rhythm) :- (indep(s27), consistent(s27, availability_status_rhythm) ; \+indep(s27)).
evidence(all_consistent(availability_status_rhythm)).
query(true_val(availability_status_rhythm, rhythm_2027)).
query(true_val(availability_status_rhythm, unk_avail_rhythm)).

% @attr availability_status_zezula
% @type categorical
% @canonical false
% @original_name availability_status (Snowboard Zezula)
% @values zezula_in_stock=Snowboard_Zezula_EU_free_shipping_in_stock unk_avail_zezula=Unknown
% @importance 0.6

0.85::true_val(availability_status_zezula, zezula_in_stock); 0.15::true_val(availability_status_zezula, unk_avail_zezula).
0.80::acc(s13, availability_status_zezula).
measured(s13, availability_status_zezula, zezula_in_stock).
all_consistent(availability_status_zezula) :- (indep(s13), consistent(s13, availability_status_zezula) ; \+indep(s13)).
evidence(all_consistent(availability_status_zezula)).
query(true_val(availability_status_zezula, zezula_in_stock)).
query(true_val(availability_status_zezula, unk_avail_zezula)).

% @attr availability_status_absolute_snow
% @type categorical
% @canonical false
% @original_name availability_status (Absolute-Snow.com)
% @values absolute_snow_2026=Absolute_Snow_UK_2026_model unk_avail_abs=Unknown
% @importance 0.5

0.78::true_val(availability_status_absolute_snow, absolute_snow_2026); 0.22::true_val(availability_status_absolute_snow, unk_avail_abs).
0.72::acc(s28, availability_status_absolute_snow).
measured(s28, availability_status_absolute_snow, absolute_snow_2026).
all_consistent(availability_status_absolute_snow) :- (indep(s28), consistent(s28, availability_status_absolute_snow) ; \+indep(s28)).
evidence(all_consistent(availability_status_absolute_snow)).
query(true_val(availability_status_absolute_snow, absolute_snow_2026)).
query(true_val(availability_status_absolute_snow, unk_avail_abs)).

% @attr availability_status_88gear
% @type categorical
% @canonical false
% @original_name availability_status (88 Gear)
% @values gear88_available=Available_at_88_Gear unk_avail_88=Unknown
% @importance 0.5

0.72::true_val(availability_status_88gear, gear88_available); 0.28::true_val(availability_status_88gear, unk_avail_88).
0.68::acc(s29, availability_status_88gear).
measured(s29, availability_status_88gear, gear88_available).
all_consistent(availability_status_88gear) :- (indep(s29), consistent(s29, availability_status_88gear) ; \+indep(s29)).
evidence(all_consistent(availability_status_88gear)).
query(true_val(availability_status_88gear, gear88_available)).
query(true_val(availability_status_88gear, unk_avail_88)).

% @attr availability_status_eriks
% @type categorical
% @canonical false
% @original_name availability_status (Erik's Bike Board & Ski)
% @values eriks_some_sold_out=Eriks_US_some_sizes_sold_out unk_avail_eriks=Unknown
% @importance 0.6

0.76::true_val(availability_status_eriks, eriks_some_sold_out); 0.24::true_val(availability_status_eriks, unk_avail_eriks).
0.72::acc(s30, availability_status_eriks).
measured(s30, availability_status_eriks, eriks_some_sold_out).
all_consistent(availability_status_eriks) :- (indep(s30), consistent(s30, availability_status_eriks) ; \+indep(s30)).
evidence(all_consistent(availability_status_eriks)).
query(true_val(availability_status_eriks, eriks_some_sold_out)).
query(true_val(availability_status_eriks, unk_avail_eriks)).

% @attr availability_status_getboards
% @type categorical
% @canonical false
% @original_name availability_status (Getboards.com)
% @values getboards_available=Available_at_Getboards_US unk_avail_getboards=Unknown
% @importance 0.5

0.72::true_val(availability_status_getboards, getboards_available); 0.28::true_val(availability_status_getboards, unk_avail_getboards).
0.65::acc(s31, availability_status_getboards).
measured(s31, availability_status_getboards, getboards_available).
all_consistent(availability_status_getboards) :- (indep(s31), consistent(s31, availability_status_getboards) ; \+indep(s31)).
evidence(all_consistent(availability_status_getboards)).
query(true_val(availability_status_getboards, getboards_available)).
query(true_val(availability_status_getboards, unk_avail_getboards)).

% @attr availability_status_amazon
% @type categorical
% @canonical false
% @original_name availability_status (Amazon.com)
% @values amazon_available=Available_on_Amazon unk_avail_amazon=Unknown
% @importance 0.5

0.76::true_val(availability_status_amazon, amazon_available); 0.24::true_val(availability_status_amazon, unk_avail_amazon).
0.72::acc(s32, availability_status_amazon).
measured(s32, availability_status_amazon, amazon_available).
all_consistent(availability_status_amazon) :- (indep(s32), consistent(s32, availability_status_amazon) ; \+indep(s32)).
evidence(all_consistent(availability_status_amazon)).
query(true_val(availability_status_amazon, amazon_available)).
query(true_val(availability_status_amazon, unk_avail_amazon)).

% @attr availability_status_blauer_2027
% @type categorical
% @canonical false
% @original_name availability_status (Blauer Board Shop 2027)
% @values blauer_2027_listed=Blauer_Board_Shop_2027_model_listed unk_avail_blauer27=Unknown
% @importance 0.6

0.78::true_val(availability_status_blauer_2027, blauer_2027_listed); 0.22::true_val(availability_status_blauer_2027, unk_avail_blauer27).
0.75::acc(s33, availability_status_blauer_2027).
measured(s33, availability_status_blauer_2027, blauer_2027_listed).
all_consistent(availability_status_blauer_2027) :- (indep(s33), consistent(s33, availability_status_blauer_2027) ; \+indep(s33)).
evidence(all_consistent(availability_status_blauer_2027)).
query(true_val(availability_status_blauer_2027, blauer_2027_listed)).
query(true_val(availability_status_blauer_2027, unk_avail_blauer27)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values directional_twin=Directional_Twin_elongated_nose_squared_tail unk_shape=Unknown
% @importance 1.0

0.95::true_val(shape, directional_twin); 0.05::true_val(shape, unk_shape).
0.88::acc(s4, shape).
0.82::acc(s27, shape).
measured(s4, shape, directional_twin).
measured(s27, shape, directional_twin).
all_consistent(shape) :-
    (indep(s4), consistent(s4, shape) ; \+indep(s4)),
    (indep(s27), consistent(s27, shape) ; \+indep(s27)).
evidence(all_consistent(shape)).
query(true_val(shape, directional_twin)).
query(true_val(shape, unk_shape)).

% @attr shape_ride_feel
% @type categorical
% @canonical false
% @original_name shape (ride feel)
% @values very_centered_feel=Very_centered_feel_despite_directional_look unk_shape_feel=Unknown
% @importance 0.7

0.85::true_val(shape_ride_feel, very_centered_feel); 0.15::true_val(shape_ride_feel, unk_shape_feel).
0.87::acc(s34, shape_ride_feel).
measured(s34, shape_ride_feel, very_centered_feel).
all_consistent(shape_ride_feel) :- consistent(s34, shape_ride_feel).
evidence(all_consistent(shape_ride_feel)).
query(true_val(shape_ride_feel, very_centered_feel)).
query(true_val(shape_ride_feel, unk_shape_feel)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values medium_camber_sidekick=Medium_Camber_with_SideKick_Low_Nose_Tail_Uplift mostly_camber=Mostly_Camber
% @importance 0.95

0.60::true_val(camber_type, medium_camber_sidekick); 0.40::true_val(camber_type, mostly_camber).
0.88::acc(s4, camber_type).
0.86::acc(s16, camber_type).
measured(s4, camber_type, medium_camber_sidekick).
measured(s16, camber_type, mostly_camber).
all_consistent(camber_type) :-
    (indep(s4), consistent(s4, camber_type) ; \+indep(s4)),
    consistent(s16, camber_type).
evidence(all_consistent(camber_type)).
query(true_val(camber_type, medium_camber_sidekick)).
query(true_val(camber_type, mostly_camber)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values tbt_3d_patented=Triple_Base_Technology_3BT_patented_3D_shape unk_camber_desc=Unknown
% @importance 0.5

0.88::true_val(camber_description, tbt_3d_patented); 0.12::true_val(camber_description, unk_camber_desc).
0.90::acc(s14, camber_description).
measured(s14, camber_description, tbt_3d_patented).
all_consistent(camber_description) :- consistent(s14, camber_description).
evidence(all_consistent(camber_description)).
query(true_val(camber_description, tbt_3d_patented)).
query(true_val(camber_description, unk_camber_desc)).

% @attr camber_description_sidekick
% @type categorical
% @canonical false
% @original_name camber_description (SideKick detail)
% @values sidekick_hull_shape=Amplifies_sidebase_uplift_hull_shape_float unk_camber_sk=Unknown
% @importance 1.0

0.90::true_val(camber_description_sidekick, sidekick_hull_shape); 0.10::true_val(camber_description_sidekick, unk_camber_sk).
0.88::acc(s4, camber_description_sidekick).
measured(s4, camber_description_sidekick, sidekick_hull_shape).
all_consistent(camber_description_sidekick) :- (indep(s4), consistent(s4, camber_description_sidekick) ; \+indep(s4)).
evidence(all_consistent(camber_description_sidekick)).
query(true_val(camber_description_sidekick, sidekick_hull_shape)).
query(true_val(camber_description_sidekick, unk_camber_sk)).

% @attr camber_description_3bt_level
% @type categorical
% @canonical false
% @original_name camber_description (3BT level)
% @values low_3bt=Low_3BT_least_amount_in_Bataleon_lineup unk_3bt_level=Unknown
% @importance 0.75

0.72::true_val(camber_description_3bt_level, low_3bt); 0.28::true_val(camber_description_3bt_level, unk_3bt_level).
0.68::acc(s35, camber_description_3bt_level).
measured(s35, camber_description_3bt_level, low_3bt).
all_consistent(camber_description_3bt_level) :- consistent(s35, camber_description_3bt_level).
evidence(all_consistent(camber_description_3bt_level)).
query(true_val(camber_description_3bt_level, low_3bt)).
query(true_val(camber_description_3bt_level, unk_3bt_level)).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v8=8.0 unk_flex_rating=Unknown
% @importance 1.0

0.95::true_val(flex_rating_10, v8); 0.05::true_val(flex_rating_10, unk_flex_rating).
0.90::acc(s4, flex_rating_10).
0.82::acc(s27, flex_rating_10).
measured(s4, flex_rating_10, v8).
measured(s27, flex_rating_10, v8).
all_consistent(flex_rating_10) :-
    (indep(s4), consistent(s4, flex_rating_10) ; \+indep(s4)),
    (indep(s27), consistent(s27, flex_rating_10) ; \+indep(s27)).
evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v8)).
query(true_val(flex_rating_10, unk_flex_rating)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values medium_overall=Pretty_medium_overall_flex_softer_than_rated unk_flex_feel=Unknown
% @importance 0.9

0.85::true_val(flex_feel, medium_overall); 0.15::true_val(flex_feel, unk_flex_feel).
0.87::acc(s36, flex_feel).
measured(s36, flex_feel, medium_overall).
all_consistent(flex_feel) :- consistent(s36, flex_feel).
evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium_overall)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr flex_feel_character
% @type categorical
% @canonical false
% @original_name flex_feel (character)
% @values very_rubbery=Very_rubbery_urethane_sidewalls_paulownia_core unk_flex_char=Unknown
% @importance 0.9

0.85::true_val(flex_feel_character, very_rubbery); 0.15::true_val(flex_feel_character, unk_flex_char).
0.87::acc(s36, flex_feel_character).
measured(s36, flex_feel_character, very_rubbery).
all_consistent(flex_feel_character) :- consistent(s36, flex_feel_character).
evidence(all_consistent(flex_feel_character)).
query(true_val(flex_feel_character, very_rubbery)).
query(true_val(flex_feel_character, unk_flex_char)).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values tip_to_tail_camber=Tip_to_tail_camber unk_flex_dir=Unknown
% @importance 0.9

0.85::true_val(flex_direction, tip_to_tail_camber); 0.15::true_val(flex_direction, unk_flex_dir).
0.82::acc(s5, flex_direction).
measured(s5, flex_direction, tip_to_tail_camber).
all_consistent(flex_direction) :- (indep(s5), consistent(s5, flex_direction) ; \+indep(s5)).
evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, tip_to_tail_camber)).
query(true_val(flex_direction, unk_flex_dir)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate_advanced=Intermediate_Advanced unk_rider_level=Unknown
% @importance 1.0

0.90::true_val(rider_level, intermediate_advanced); 0.10::true_val(rider_level, unk_rider_level).
0.88::acc(s4, rider_level).
measured(s4, rider_level, intermediate_advanced).
all_consistent(rider_level) :- (indep(s4), consistent(s4, rider_level) ; \+indep(s4)).
evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate_advanced)).
query(true_val(rider_level, unk_rider_level)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values intermediate_advanced_sl=Intermediate_Advanced advanced_expert=Advanced_Expert beginner_expert=Beginner_Expert
% @importance 0.88

0.40::true_val(skill_level_recommendation, intermediate_advanced_sl); 0.35::true_val(skill_level_recommendation, advanced_expert); 0.25::true_val(skill_level_recommendation, beginner_expert).
0.85::acc(s4, skill_level_recommendation).
0.82::acc(s6, skill_level_recommendation).
0.88::acc(s16, skill_level_recommendation).
measured(s4, skill_level_recommendation, intermediate_advanced_sl).
measured(s6, skill_level_recommendation, advanced_expert).
measured(s16, skill_level_recommendation, beginner_expert).
all_consistent(skill_level_recommendation) :-
    (indep(s4), consistent(s4, skill_level_recommendation) ; \+indep(s4)),
    (indep(s6), consistent(s6, skill_level_recommendation) ; \+indep(s6)),
    consistent(s16, skill_level_recommendation).
evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, intermediate_advanced_sl)).
query(true_val(skill_level_recommendation, advanced_expert)).
query(true_val(skill_level_recommendation, beginner_expert)).

% @attr riding_style_description
% @type categorical
% @canonical false
% @original_name riding_style (description)
% @values fast_aggressive=Fast_aggressive_high_speed_all_mountain_dominance unk_riding_desc=Unknown
% @importance 1.0

0.95::true_val(riding_style_description, fast_aggressive); 0.05::true_val(riding_style_description, unk_riding_desc).
0.93::acc(s2, riding_style_description).
measured(s2, riding_style_description, fast_aggressive).
all_consistent(riding_style_description) :- consistent(s2, riding_style_description).
evidence(all_consistent(riding_style_description)).
query(true_val(riding_style_description, fast_aggressive)).
query(true_val(riding_style_description, unk_riding_desc)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values park_groomers_powder=Park_Groomers_Powder unk_terrain=Unknown
% @importance 1.0

0.90::true_val(terrain_suitability, park_groomers_powder); 0.10::true_val(terrain_suitability, unk_terrain).
0.88::acc(s4, terrain_suitability).
measured(s4, terrain_suitability, park_groomers_powder).
all_consistent(terrain_suitability) :- (indep(s4), consistent(s4, terrain_suitability) ; \+indep(s4)).
evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, park_groomers_powder)).
query(true_val(terrain_suitability, unk_terrain)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values ultra_light_poplar_paulownia=Ultra_Light_Core_Poplar_Paulownia unk_core=Unknown
% @importance 1.0

0.95::true_val(core_material, ultra_light_poplar_paulownia); 0.05::true_val(core_material, unk_core).
0.88::acc(s4, core_material).
0.82::acc(s5, core_material).
measured(s4, core_material, ultra_light_poplar_paulownia).
measured(s5, core_material, ultra_light_poplar_paulownia).
all_consistent(core_material) :-
    (indep(s4), consistent(s4, core_material) ; \+indep(s4)),
    (indep(s5), consistent(s5, core_material) ; \+indep(s5)).
evidence(all_consistent(core_material)).
query(true_val(core_material, ultra_light_poplar_paulownia)).
query(true_val(core_material, unk_core)).

% @attr core_material_blend_ratio
% @type categorical
% @canonical false
% @original_name core_material_blend_ratio
% @values r70_30_paulownia_poplar=70_30_Paulownia_Poplar unk_blend=Unknown
% @importance 0.9

0.85::true_val(core_material_blend_ratio, r70_30_paulownia_poplar); 0.15::true_val(core_material_blend_ratio, unk_blend).
0.82::acc(s5, core_material_blend_ratio).
measured(s5, core_material_blend_ratio, r70_30_paulownia_poplar).
all_consistent(core_material_blend_ratio) :- (indep(s5), consistent(s5, core_material_blend_ratio) ; \+indep(s5)).
evidence(all_consistent(core_material_blend_ratio)).
query(true_val(core_material_blend_ratio, r70_30_paulownia_poplar)).
query(true_val(core_material_blend_ratio, unk_blend)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values tri_ax_fiberglass=Tri_Ax_three_way_fiberglass_weave unk_laminate=Unknown
% @importance 0.9

0.85::true_val(laminate, tri_ax_fiberglass); 0.15::true_val(laminate, unk_laminate).
0.82::acc(s5, laminate).
measured(s5, laminate, tri_ax_fiberglass).
all_consistent(laminate) :- (indep(s5), consistent(s5, laminate) ; \+indep(s5)).
evidence(all_consistent(laminate)).
query(true_val(laminate, tri_ax_fiberglass)).
query(true_val(laminate, unk_laminate)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values carbon_stringers=Carbon_Stringers_pop_edge_response_dampening unk_construction=Unknown
% @importance 0.9

0.85::true_val(construction_material_innovation, carbon_stringers); 0.15::true_val(construction_material_innovation, unk_construction).
0.82::acc(s5, construction_material_innovation).
measured(s5, construction_material_innovation, carbon_stringers).
all_consistent(construction_material_innovation) :- (indep(s5), consistent(s5, construction_material_innovation) ; \+indep(s5)).
evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, carbon_stringers)).
query(true_val(construction_material_innovation, unk_construction)).

% @attr construction_material_innovation_drst
% @type categorical
% @canonical false
% @original_name construction_material_innovation (DRST)
% @values drst_carbon_tubes=DRST_Dual_Radial_SuperTubes_six_hollow_carbon_cylinders unk_drst=Unknown
% @importance 1.0

0.95::true_val(construction_material_innovation_drst, drst_carbon_tubes); 0.05::true_val(construction_material_innovation_drst, unk_drst).
0.92::acc(s2, construction_material_innovation_drst).
measured(s2, construction_material_innovation_drst, drst_carbon_tubes).
all_consistent(construction_material_innovation_drst) :- consistent(s2, construction_material_innovation_drst).
evidence(all_consistent(construction_material_innovation_drst)).
query(true_val(construction_material_innovation_drst, drst_carbon_tubes)).
query(true_val(construction_material_innovation_drst, unk_drst)).

% @attr construction_material_innovation_aramid
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Aramid)
% @values aramid_x_ply=Aramid_X_Ply_diamond_weave_Kevlar_torsional_stiffness unk_aramid=Unknown
% @importance 1.0

0.90::true_val(construction_material_innovation_aramid, aramid_x_ply); 0.10::true_val(construction_material_innovation_aramid, unk_aramid).
0.88::acc(s4, construction_material_innovation_aramid).
measured(s4, construction_material_innovation_aramid, aramid_x_ply).
all_consistent(construction_material_innovation_aramid) :- (indep(s4), consistent(s4, construction_material_innovation_aramid) ; \+indep(s4)).
evidence(all_consistent(construction_material_innovation_aramid)).
query(true_val(construction_material_innovation_aramid, aramid_x_ply)).
query(true_val(construction_material_innovation_aramid, unk_aramid)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values ultra_glide_s_7000=Ultra_Glide_S_7000_grade_sintered unk_base=Unknown
% @importance 1.0

0.90::true_val(base_material, ultra_glide_s_7000); 0.10::true_val(base_material, unk_base).
0.88::acc(s4, base_material).
measured(s4, base_material, ultra_glide_s_7000).
all_consistent(base_material) :- (indep(s4), consistent(s4, base_material) ; \+indep(s4)).
evidence(all_consistent(base_material)).
query(true_val(base_material, ultra_glide_s_7000)).
query(true_val(base_material, unk_base)).

% @attr base_material_description
% @type categorical
% @canonical false
% @original_name base_material (description)
% @values elite_performance_durable=Elite_performance_ultra_dense_Ptex_durable unk_base_desc=Unknown
% @importance 0.6

0.85::true_val(base_material_description, elite_performance_durable); 0.15::true_val(base_material_description, unk_base_desc).
0.80::acc(s13, base_material_description).
measured(s13, base_material_description, elite_performance_durable).
all_consistent(base_material_description) :- (indep(s13), consistent(s13, base_material_description) ; \+indep(s13)).
evidence(all_consistent(base_material_description)).
query(true_val(base_material_description, elite_performance_durable)).
query(true_val(base_material_description, unk_base_desc)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values urethane_flex_walls=Urethane_Poured_FlexWalls_shock_absorption unk_sidewall=Unknown
% @importance 1.0

0.95::true_val(sidewall_material, urethane_flex_walls); 0.05::true_val(sidewall_material, unk_sidewall).
0.93::acc(s2, sidewall_material).
measured(s2, sidewall_material, urethane_flex_walls).
all_consistent(sidewall_material) :- consistent(s2, sidewall_material).
evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, urethane_flex_walls)).
query(true_val(sidewall_material, unk_sidewall)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values german_stainless_28_inserts=A_grade_German_stainless_steel_28_inserts unk_edge=Unknown
% @importance 0.6

0.85::true_val(edge_technology, german_stainless_28_inserts); 0.15::true_val(edge_technology, unk_edge).
0.80::acc(s13, edge_technology).
measured(s13, edge_technology, german_stainless_28_inserts).
all_consistent(edge_technology) :- (indep(s13), consistent(s13, edge_technology) ; \+indep(s13)).
evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, german_stainless_28_inserts)).
query(true_val(edge_technology, unk_edge)).

% @attr construction_material_innovation_impact
% @type categorical
% @canonical false
% @original_name construction_material_innovation (impact)
% @values under_binding_energy_dissipation=Technology_under_binding_dissipates_impact_energy unk_impact=Unknown
% @importance 0.6

0.85::true_val(construction_material_innovation_impact, under_binding_energy_dissipation); 0.15::true_val(construction_material_innovation_impact, unk_impact).
0.80::acc(s13, construction_material_innovation_impact).
measured(s13, construction_material_innovation_impact, under_binding_energy_dissipation).
all_consistent(construction_material_innovation_impact) :- (indep(s13), consistent(s13, construction_material_innovation_impact) ; \+indep(s13)).
evidence(all_consistent(construction_material_innovation_impact)).
query(true_val(construction_material_innovation_impact, under_binding_energy_dissipation)).
query(true_val(construction_material_innovation_impact, unk_impact)).

% @attr mounting_pattern_backseat
% @type categorical
% @canonical false
% @original_name mounting_pattern (backseat inserts)
% @values plus2_backseat=Plus_2_Backseat_Inserts_4cm_behind_standard unk_backseat=Unknown
% @importance 0.8

0.90::true_val(mounting_pattern_backseat, plus2_backseat); 0.10::true_val(mounting_pattern_backseat, unk_backseat).
0.85::acc(s13, mounting_pattern_backseat).
measured(s13, mounting_pattern_backseat, plus2_backseat).
all_consistent(mounting_pattern_backseat) :- (indep(s13), consistent(s13, mounting_pattern_backseat) ; \+indep(s13)).
evidence(all_consistent(mounting_pattern_backseat)).
query(true_val(mounting_pattern_backseat, plus2_backseat)).
query(true_val(mounting_pattern_backseat, unk_backseat)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting=Unknown
% @importance 1.0

0.90::true_val(mounting_pattern, inserts_2x4); 0.10::true_val(mounting_pattern, unk_mounting).
0.88::acc(s4, mounting_pattern).
measured(s4, mounting_pattern, inserts_2x4).
all_consistent(mounting_pattern) :- (indep(s4), consistent(s4, mounting_pattern) ; \+indep(s4)).
evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting)).

% @attr rails
% @type categorical
% @canonical false
% @original_name Rails
% @values step_down_rails=Step_Down_Rails_3D_topsheet_taper_weight_saving unk_rails=Unknown
% @importance 0.4

0.75::true_val(rails, step_down_rails); 0.25::true_val(rails, unk_rails).
0.72::acc(s37, rails).
measured(s37, rails, step_down_rails).
all_consistent(rails) :- (indep(s37), consistent(s37, rails) ; \+indep(s37)).
evidence(all_consistent(rails)).
query(true_val(rails, step_down_rails)).
query(true_val(rails, unk_rails)).

% @attr width_options
% @type categorical
% @canonical true
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide unk_width_opts=Unknown
% @importance 1.0

0.90::true_val(width_options, standard_and_wide); 0.10::true_val(width_options, unk_width_opts).
0.88::acc(s4, width_options).
measured(s4, width_options, standard_and_wide).
all_consistent(width_options) :- (indep(s4), consistent(s4, width_options) ; \+indep(s4)).
evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_opts)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values wend_wax_plant_based=Plant_based_WEND_WAX_all_boards_2025_26 unk_sustain=Unknown
% @importance 0.4

0.82::true_val(sustainability_certification, wend_wax_plant_based); 0.18::true_val(sustainability_certification, unk_sustain).
0.80::acc(s38, sustainability_certification).
measured(s38, sustainability_certification, wend_wax_plant_based).
all_consistent(sustainability_certification) :- consistent(s38, sustainability_certification).
evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, wend_wax_plant_based)).
query(true_val(sustainability_certification, unk_sustain)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values sizes_153_156_159_160w=153_156_159_160W sizes_151_154_156_158mw_159_161w_164w=151_154_156_158MW_159_161W_164W sizes_151_153_156_158mw_160w=151_153_156_158MW_160W
% @importance 0.88

0.35::true_val(available_sizes, sizes_153_156_159_160w); 0.40::true_val(available_sizes, sizes_151_154_156_158mw_159_161w_164w); 0.25::true_val(available_sizes, sizes_151_153_156_158mw_160w).
0.85::acc(s4, available_sizes).
0.90::acc(s25, available_sizes).
0.75::acc(s26, available_sizes).
measured(s4, available_sizes, sizes_153_156_159_160w).
measured(s25, available_sizes, sizes_151_154_156_158mw_159_161w_164w).
measured(s26, available_sizes, sizes_151_153_156_158mw_160w).
all_consistent(available_sizes) :-
    (indep(s4), consistent(s4, available_sizes) ; \+indep(s4)),
    consistent(s25, available_sizes),
    (indep(s26), consistent(s26, available_sizes) ; \+indep(s26)).
evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, sizes_153_156_159_160w)).
query(true_val(available_sizes, sizes_151_154_156_158mw_159_161w_164w)).
query(true_val(available_sizes, sizes_151_153_156_158mw_160w)).

% @attr effective_edge_153
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 153cm
% @values v116_7=116.7 unk_ee_153=Unknown
% @importance 1.0

0.76::true_val(effective_edge_153, v116_7); 0.24::true_val(effective_edge_153, unk_ee_153).
0.88::acc(s4, effective_edge_153).
measured(s4, effective_edge_153, v116_7).
all_consistent(effective_edge_153) :- (indep(s4), consistent(s4, effective_edge_153) ; \+indep(s4)).
evidence(all_consistent(effective_edge_153)).
query(true_val(effective_edge_153, v116_7)).
query(true_val(effective_edge_153, unk_ee_153)).

% @attr effective_edge_156
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 156cm
% @values v118_9=118.9 unk_ee_156=Unknown
% @importance 1.0

0.76::true_val(effective_edge_156, v118_9); 0.24::true_val(effective_edge_156, unk_ee_156).
0.88::acc(s4, effective_edge_156).
measured(s4, effective_edge_156, v118_9).
all_consistent(effective_edge_156) :- (indep(s4), consistent(s4, effective_edge_156) ; \+indep(s4)).
evidence(all_consistent(effective_edge_156)).
query(true_val(effective_edge_156, v118_9)).
query(true_val(effective_edge_156, unk_ee_156)).

% @attr effective_edge_159
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 159cm
% @values v121_0=121.0 unk_ee_159=Unknown
% @importance 1.0

0.76::true_val(effective_edge_159, v121_0); 0.24::true_val(effective_edge_159, unk_ee_159).
0.88::acc(s4, effective_edge_159).
measured(s4, effective_edge_159, v121_0).
all_consistent(effective_edge_159) :- (indep(s4), consistent(s4, effective_edge_159) ; \+indep(s4)).
evidence(all_consistent(effective_edge_159)).
query(true_val(effective_edge_159, v121_0)).
query(true_val(effective_edge_159, unk_ee_159)).

% @attr effective_edge_162
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 162cm
% @values v123_1=123.1 unk_ee_162=Unknown
% @importance 1.0

0.76::true_val(effective_edge_162, v123_1); 0.24::true_val(effective_edge_162, unk_ee_162).
0.88::acc(s4, effective_edge_162).
measured(s4, effective_edge_162, v123_1).
all_consistent(effective_edge_162) :- (indep(s4), consistent(s4, effective_edge_162) ; \+indep(s4)).
evidence(all_consistent(effective_edge_162)).
query(true_val(effective_edge_162, v123_1)).
query(true_val(effective_edge_162, unk_ee_162)).

% @attr effective_edge_160w
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 160W cm
% @values v121_7=121.7 unk_ee_160w=Unknown
% @importance 1.0

0.76::true_val(effective_edge_160w, v121_7); 0.24::true_val(effective_edge_160w, unk_ee_160w).
0.88::acc(s4, effective_edge_160w).
measured(s4, effective_edge_160w, v121_7).
all_consistent(effective_edge_160w) :- (indep(s4), consistent(s4, effective_edge_160w) ; \+indep(s4)).
evidence(all_consistent(effective_edge_160w)).
query(true_val(effective_edge_160w, v121_7)).
query(true_val(effective_edge_160w, unk_ee_160w)).

% @attr effective_edge_164w
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 164W cm
% @values v124_6=124.6 unk_ee_164w=Unknown
% @importance 1.0

0.76::true_val(effective_edge_164w, v124_6); 0.24::true_val(effective_edge_164w, unk_ee_164w).
0.88::acc(s4, effective_edge_164w).
measured(s4, effective_edge_164w, v124_6).
all_consistent(effective_edge_164w) :- (indep(s4), consistent(s4, effective_edge_164w) ; \+indep(s4)).
evidence(all_consistent(effective_edge_164w)).
query(true_val(effective_edge_164w, v124_6)).
query(true_val(effective_edge_164w, unk_ee_164w)).

% @attr waist_width_153
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 153cm
% @values v25_1=25.1 unk_ww_153=Unknown
% @importance 1.0

0.76::true_val(waist_width_153, v25_1); 0.24::true_val(waist_width_153, unk_ww_153).
0.88::acc(s4, waist_width_153).
measured(s4, waist_width_153, v25_1).
all_consistent(waist_width_153) :- (indep(s4), consistent(s4, waist_width_153) ; \+indep(s4)).
evidence(all_consistent(waist_width_153)).
query(true_val(waist_width_153, v25_1)).
query(true_val(waist_width_153, unk_ww_153)).

% @attr waist_width_156
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 156cm
% @values v25_4=25.4 unk_ww_156=Unknown
% @importance 1.0

0.76::true_val(waist_width_156, v25_4); 0.24::true_val(waist_width_156, unk_ww_156).
0.88::acc(s4, waist_width_156).
measured(s4, waist_width_156, v25_4).
all_consistent(waist_width_156) :- (indep(s4), consistent(s4, waist_width_156) ; \+indep(s4)).
evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v25_4)).
query(true_val(waist_width_156, unk_ww_156)).

% @attr waist_width_159
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 159cm
% @values v25_7=25.7 unk_ww_159=Unknown
% @importance 1.0

0.76::true_val(waist_width_159, v25_7); 0.24::true_val(waist_width_159, unk_ww_159).
0.88::acc(s4, waist_width_159).
measured(s4, waist_width_159, v25_7).
all_consistent(waist_width_159) :- (indep(s4), consistent(s4, waist_width_159) ; \+indep(s4)).
evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v25_7)).
query(true_val(waist_width_159, unk_ww_159)).

% @attr waist_width_162
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 162cm
% @values v26_0=26.0 unk_ww_162=Unknown
% @importance 1.0

0.76::true_val(waist_width_162, v26_0); 0.24::true_val(waist_width_162, unk_ww_162).
0.88::acc(s4, waist_width_162).
measured(s4, waist_width_162, v26_0).
all_consistent(waist_width_162) :- (indep(s4), consistent(s4, waist_width_162) ; \+indep(s4)).
evidence(all_consistent(waist_width_162)).
query(true_val(waist_width_162, v26_0)).
query(true_val(waist_width_162, unk_ww_162)).

% @attr waist_width_160w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 160W cm
% @values v26_8=26.8 unk_ww_160w=Unknown
% @importance 1.0

0.76::true_val(waist_width_160w, v26_8); 0.24::true_val(waist_width_160w, unk_ww_160w).
0.88::acc(s4, waist_width_160w).
measured(s4, waist_width_160w, v26_8).
all_consistent(waist_width_160w) :- (indep(s4), consistent(s4, waist_width_160w) ; \+indep(s4)).
evidence(all_consistent(waist_width_160w)).
query(true_val(waist_width_160w, v26_8)).
query(true_val(waist_width_160w, unk_ww_160w)).

% @attr waist_width_164w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 164W cm
% @values v27_2=27.2 unk_ww_164w=Unknown
% @importance 1.0

0.76::true_val(waist_width_164w, v27_2); 0.24::true_val(waist_width_164w, unk_ww_164w).
0.88::acc(s4, waist_width_164w).
measured(s4, waist_width_164w, v27_2).
all_consistent(waist_width_164w) :- (indep(s4), consistent(s4, waist_width_164w) ; \+indep(s4)).
evidence(all_consistent(waist_width_164w)).
query(true_val(waist_width_164w, v27_2)).
query(true_val(waist_width_164w, unk_ww_164w)).

% @attr tip_tail_width_size_153
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (153cm)
% @values v29_6=29.6 unk_ttw_153=Unknown
% @importance 1.0

0.76::true_val(tip_tail_width_size_153, v29_6); 0.24::true_val(tip_tail_width_size_153, unk_ttw_153).
0.88::acc(s4, tip_tail_width_size_153).
measured(s4, tip_tail_width_size_153, v29_6).
all_consistent(tip_tail_width_size_153) :- (indep(s4), consistent(s4, tip_tail_width_size_153) ; \+indep(s4)).
evidence(all_consistent(tip_tail_width_size_153)).
query(true_val(tip_tail_width_size_153, v29_6)).
query(true_val(tip_tail_width_size_153, unk_ttw_153)).

% @attr tip_tail_width_size
% @type numeric
% @unit cm
% @canonical true
% @original_name tip_tail_width_size
% @values v30_0=30.0 unk_ttw=Unknown
% @importance 1.0

0.76::true_val(tip_tail_width_size, v30_0); 0.24::true_val(tip_tail_width_size, unk_ttw).
0.88::acc(s4, tip_tail_width_size).
measured(s4, tip_tail_width_size, v30_0).
all_consistent(tip_tail_width_size) :- (indep(s4), consistent(s4, tip_tail_width_size) ; \+indep(s4)).
evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v30_0)).
query(true_val(tip_tail_width_size, unk_ttw)).

% @attr tip_tail_width_size_159
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (159cm)
% @values v30_4=30.4 unk_ttw_159=Unknown
% @importance 1.0

0.76::true_val(tip_tail_width_size_159, v30_4); 0.24::true_val(tip_tail_width_size_159, unk_ttw_159).
0.88::acc(s4, tip_tail_width_size_159).
measured(s4, tip_tail_width_size_159, v30_4).
all_consistent(tip_tail_width_size_159) :- (indep(s4), consistent(s4, tip_tail_width_size_159) ; \+indep(s4)).
evidence(all_consistent(tip_tail_width_size_159)).
query(true_val(tip_tail_width_size_159, v30_4)).
query(true_val(tip_tail_width_size_159, unk_ttw_159)).

% @attr tip_tail_width_size_162
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (162cm)
% @values v30_8=30.8 unk_ttw_162=Unknown
% @importance 1.0

0.76::true_val(tip_tail_width_size_162, v30_8); 0.24::true_val(tip_tail_width_size_162, unk_ttw_162).
0.88::acc(s4, tip_tail_width_size_162).
measured(s4, tip_tail_width_size_162, v30_8).
all_consistent(tip_tail_width_size_162) :- (indep(s4), consistent(s4, tip_tail_width_size_162) ; \+indep(s4)).
evidence(all_consistent(tip_tail_width_size_162)).
query(true_val(tip_tail_width_size_162, v30_8)).
query(true_val(tip_tail_width_size_162, unk_ttw_162)).

% @attr tip_tail_width_size_160w
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (160W)
% @values v31_5=31.5 unk_ttw_160w=Unknown
% @importance 1.0

0.76::true_val(tip_tail_width_size_160w, v31_5); 0.24::true_val(tip_tail_width_size_160w, unk_ttw_160w).
0.88::acc(s4, tip_tail_width_size_160w).
measured(s4, tip_tail_width_size_160w, v31_5).
all_consistent(tip_tail_width_size_160w) :- (indep(s4), consistent(s4, tip_tail_width_size_160w) ; \+indep(s4)).
evidence(all_consistent(tip_tail_width_size_160w)).
query(true_val(tip_tail_width_size_160w, v31_5)).
query(true_val(tip_tail_width_size_160w, unk_ttw_160w)).

% @attr tip_tail_width_size_164w
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (164W)
% @values v32_0=32.0 unk_ttw_164w=Unknown
% @importance 1.0

0.76::true_val(tip_tail_width_size_164w, v32_0); 0.24::true_val(tip_tail_width_size_164w, unk_ttw_164w).
0.88::acc(s4, tip_tail_width_size_164w).
measured(s4, tip_tail_width_size_164w, v32_0).
all_consistent(tip_tail_width_size_164w) :- (indep(s4), consistent(s4, tip_tail_width_size_164w) ; \+indep(s4)).
evidence(all_consistent(tip_tail_width_size_164w)).
query(true_val(tip_tail_width_size_164w, v32_0)).
query(true_val(tip_tail_width_size_164w, unk_ttw_164w)).

% @attr sidecut_radius_size_153
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size (153cm)
% @values r8_8_6_8_8_8=8.8_6.8_8.8m unk_sr_153=Unknown
% @importance 1.0

0.76::true_val(sidecut_radius_size_153, r8_8_6_8_8_8); 0.24::true_val(sidecut_radius_size_153, unk_sr_153).
0.88::acc(s4, sidecut_radius_size_153).
measured(s4, sidecut_radius_size_153, r8_8_6_8_8_8).
all_consistent(sidecut_radius_size_153) :- (indep(s4), consistent(s4, sidecut_radius_size_153) ; \+indep(s4)).
evidence(all_consistent(sidecut_radius_size_153)).
query(true_val(sidecut_radius_size_153, r8_8_6_8_8_8)).
query(true_val(sidecut_radius_size_153, unk_sr_153)).

% @attr sidecut_radius_size
% @type categorical
% @unit m
% @canonical true
% @original_name sidecut_radius_size
% @values r8_9_6_9_8_9=8.9_6.9_8.9m unk_sr=Unknown
% @importance 1.0

0.76::true_val(sidecut_radius_size, r8_9_6_9_8_9); 0.24::true_val(sidecut_radius_size, unk_sr).
0.88::acc(s4, sidecut_radius_size).
measured(s4, sidecut_radius_size, r8_9_6_9_8_9).
all_consistent(sidecut_radius_size) :- (indep(s4), consistent(s4, sidecut_radius_size) ; \+indep(s4)).
evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, r8_9_6_9_8_9)).
query(true_val(sidecut_radius_size, unk_sr)).

% @attr sidecut_radius_size_159
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size (159cm)
% @values r9_1_7_1_9_1=9.1_7.1_9.1m unk_sr_159=Unknown
% @importance 1.0

0.76::true_val(sidecut_radius_size_159, r9_1_7_1_9_1); 0.24::true_val(sidecut_radius_size_159, unk_sr_159).
0.88::acc(s4, sidecut_radius_size_159).
measured(s4, sidecut_radius_size_159, r9_1_7_1_9_1).
all_consistent(sidecut_radius_size_159) :- (indep(s4), consistent(s4, sidecut_radius_size_159) ; \+indep(s4)).
evidence(all_consistent(sidecut_radius_size_159)).
query(true_val(sidecut_radius_size_159, r9_1_7_1_9_1)).
query(true_val(sidecut_radius_size_159, unk_sr_159)).

% @attr sidecut_radius_size_162
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size (162cm)
% @values r9_2_7_2_9_2=9.2_7.2_9.2m unk_sr_162=Unknown
% @importance 1.0

0.76::true_val(sidecut_radius_size_162, r9_2_7_2_9_2); 0.24::true_val(sidecut_radius_size_162, unk_sr_162).
0.88::acc(s4, sidecut_radius_size_162).
measured(s4, sidecut_radius_size_162, r9_2_7_2_9_2).
all_consistent(sidecut_radius_size_162) :- (indep(s4), consistent(s4, sidecut_radius_size_162) ; \+indep(s4)).
evidence(all_consistent(sidecut_radius_size_162)).
query(true_val(sidecut_radius_size_162, r9_2_7_2_9_2)).
query(true_val(sidecut_radius_size_162, unk_sr_162)).

% @attr sidecut_radius_size_160w
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size (160W)
% @values r9_1_7_1_9_1w=9.1_7.1_9.1m unk_sr_160w=Unknown
% @importance 1.0

0.76::true_val(sidecut_radius_size_160w, r9_1_7_1_9_1w); 0.24::true_val(sidecut_radius_size_160w, unk_sr_160w).
0.88::acc(s4, sidecut_radius_size_160w).
measured(s4, sidecut_radius_size_160w, r9_1_7_1_9_1w).
all_consistent(sidecut_radius_size_160w) :- (indep(s4), consistent(s4, sidecut_radius_size_160w) ; \+indep(s4)).
evidence(all_consistent(sidecut_radius_size_160w)).
query(true_val(sidecut_radius_size_160w, r9_1_7_1_9_1w)).
query(true_val(sidecut_radius_size_160w, unk_sr_160w)).

% @attr sidecut_radius_size_164w
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size (164W)
% @values r9_3_7_3_9_3=9.3_7.3_9.3m unk_sr_164w=Unknown
% @importance 1.0

0.76::true_val(sidecut_radius_size_164w, r9_3_7_3_9_3); 0.24::true_val(sidecut_radius_size_164w, unk_sr_164w).
0.88::acc(s4, sidecut_radius_size_164w).
measured(s4, sidecut_radius_size_164w, r9_3_7_3_9_3).
all_consistent(sidecut_radius_size_164w) :- (indep(s4), consistent(s4, sidecut_radius_size_164w) ; \+indep(s4)).
evidence(all_consistent(sidecut_radius_size_164w)).
query(true_val(sidecut_radius_size_164w, r9_3_7_3_9_3)).
query(true_val(sidecut_radius_size_164w, unk_sr_164w)).

% @attr stance_width_range_size_153
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size (153cm)
% @values v53_0=53.0 unk_sw_153=Unknown
% @importance 1.0

0.76::true_val(stance_width_range_size_153, v53_0); 0.24::true_val(stance_width_range_size_153, unk_sw_153).
0.88::acc(s4, stance_width_range_size_153).
measured(s4, stance_width_range_size_153, v53_0).
all_consistent(stance_width_range_size_153) :- (indep(s4), consistent(s4, stance_width_range_size_153) ; \+indep(s4)).
evidence(all_consistent(stance_width_range_size_153)).
query(true_val(stance_width_range_size_153, v53_0)).
query(true_val(stance_width_range_size_153, unk_sw_153)).

% @attr stance_width_range_size
% @type numeric
% @unit cm
% @canonical true
% @original_name stance_width_range_size
% @values v55_0=55.0 unk_sw=Unknown
% @importance 1.0

0.76::true_val(stance_width_range_size, v55_0); 0.24::true_val(stance_width_range_size, unk_sw).
0.88::acc(s4, stance_width_range_size).
measured(s4, stance_width_range_size, v55_0).
all_consistent(stance_width_range_size) :- (indep(s4), consistent(s4, stance_width_range_size) ; \+indep(s4)).
evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v55_0)).
query(true_val(stance_width_range_size, unk_sw)).

% @attr stance_width_range_size_159
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size (159cm)
% @values v56_0=56.0 unk_sw_159=Unknown
% @importance 1.0

0.76::true_val(stance_width_range_size_159, v56_0); 0.24::true_val(stance_width_range_size_159, unk_sw_159).
0.88::acc(s4, stance_width_range_size_159).
measured(s4, stance_width_range_size_159, v56_0).
all_consistent(stance_width_range_size_159) :- (indep(s4), consistent(s4, stance_width_range_size_159) ; \+indep(s4)).
evidence(all_consistent(stance_width_range_size_159)).
query(true_val(stance_width_range_size_159, v56_0)).
query(true_val(stance_width_range_size_159, unk_sw_159)).

% @attr stance_width_range_size_162
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size (162cm)
% @values v57_0=57.0 unk_sw_162=Unknown
% @importance 1.0

0.76::true_val(stance_width_range_size_162, v57_0); 0.24::true_val(stance_width_range_size_162, unk_sw_162).
0.88::acc(s4, stance_width_range_size_162).
measured(s4, stance_width_range_size_162, v57_0).
all_consistent(stance_width_range_size_162) :- (indep(s4), consistent(s4, stance_width_range_size_162) ; \+indep(s4)).
evidence(all_consistent(stance_width_range_size_162)).
query(true_val(stance_width_range_size_162, v57_0)).
query(true_val(stance_width_range_size_162, unk_sw_162)).

% @attr stance_width_range_size_160w
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size (160W)
% @values v56_0w=56.0 unk_sw_160w=Unknown
% @importance 1.0

0.76::true_val(stance_width_range_size_160w, v56_0w); 0.24::true_val(stance_width_range_size_160w, unk_sw_160w).
0.88::acc(s4, stance_width_range_size_160w).
measured(s4, stance_width_range_size_160w, v56_0w).
all_consistent(stance_width_range_size_160w) :- (indep(s4), consistent(s4, stance_width_range_size_160w) ; \+indep(s4)).
evidence(all_consistent(stance_width_range_size_160w)).
query(true_val(stance_width_range_size_160w, v56_0w)).
query(true_val(stance_width_range_size_160w, unk_sw_160w)).

% @attr stance_width_range_size_164w
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size (164W)
% @values v57_0w=57.0 unk_sw_164w=Unknown
% @importance 1.0

0.76::true_val(stance_width_range_size_164w, v57_0w); 0.24::true_val(stance_width_range_size_164w, unk_sw_164w).
0.88::acc(s4, stance_width_range_size_164w).
measured(s4, stance_width_range_size_164w, v57_0w).
all_consistent(stance_width_range_size_164w) :- (indep(s4), consistent(s4, stance_width_range_size_164w) ; \+indep(s4)).
evidence(all_consistent(stance_width_range_size_164w)).
query(true_val(stance_width_range_size_164w, v57_0w)).
query(true_val(stance_width_range_size_164w, unk_sw_164w)).

% @attr recommended_weight_range_size_153
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (153cm)
% @values w59_79=59_79kg unk_rw_153=Unknown
% @importance 1.0

0.76::true_val(recommended_weight_range_size_153, w59_79); 0.24::true_val(recommended_weight_range_size_153, unk_rw_153).
0.88::acc(s4, recommended_weight_range_size_153).
measured(s4, recommended_weight_range_size_153, w59_79).
all_consistent(recommended_weight_range_size_153) :- (indep(s4), consistent(s4, recommended_weight_range_size_153) ; \+indep(s4)).
evidence(all_consistent(recommended_weight_range_size_153)).
query(true_val(recommended_weight_range_size_153, w59_79)).
query(true_val(recommended_weight_range_size_153, unk_rw_153)).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size
% @values w65_86=65_86kg unk_rw=Unknown
% @importance 1.0

0.76::true_val(recommended_weight_range_size, w65_86); 0.24::true_val(recommended_weight_range_size, unk_rw).
0.88::acc(s4, recommended_weight_range_size).
measured(s4, recommended_weight_range_size, w65_86).
all_consistent(recommended_weight_range_size) :- (indep(s4), consistent(s4, recommended_weight_range_size) ; \+indep(s4)).
evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w65_86)).
query(true_val(recommended_weight_range_size, unk_rw)).

% @attr recommended_weight_range_size_159
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (159cm)
% @values w71_91=71_91kg unk_rw_159=Unknown
% @importance 1.0

0.76::true_val(recommended_weight_range_size_159, w71_91); 0.24::true_val(recommended_weight_range_size_159, unk_rw_159).
0.88::acc(s4, recommended_weight_range_size_159).
measured(s4, recommended_weight_range_size_159, w71_91).
all_consistent(recommended_weight_range_size_159) :- (indep(s4), consistent(s4, recommended_weight_range_size_159) ; \+indep(s4)).
evidence(all_consistent(recommended_weight_range_size_159)).
query(true_val(recommended_weight_range_size_159, w71_91)).
query(true_val(recommended_weight_range_size_159, unk_rw_159)).

% @attr recommended_weight_range_size_162
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (162cm)
% @values w77_97=77_97kg unk_rw_162=Unknown
% @importance 1.0

0.76::true_val(recommended_weight_range_size_162, w77_97); 0.24::true_val(recommended_weight_range_size_162, unk_rw_162).
0.88::acc(s4, recommended_weight_range_size_162).
measured(s4, recommended_weight_range_size_162, w77_97).
all_consistent(recommended_weight_range_size_162) :- (indep(s4), consistent(s4, recommended_weight_range_size_162) ; \+indep(s4)).
evidence(all_consistent(recommended_weight_range_size_162)).
query(true_val(recommended_weight_range_size_162, w77_97)).
query(true_val(recommended_weight_range_size_162, unk_rw_162)).

% @attr recommended_weight_range_size_160w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (160W)
% @values w80_100=80_100kg unk_rw_160w=Unknown
% @importance 1.0

0.76::true_val(recommended_weight_range_size_160w, w80_100); 0.24::true_val(recommended_weight_range_size_160w, unk_rw_160w).
0.88::acc(s4, recommended_weight_range_size_160w).
measured(s4, recommended_weight_range_size_160w, w80_100).
all_consistent(recommended_weight_range_size_160w) :- (indep(s4), consistent(s4, recommended_weight_range_size_160w) ; \+indep(s4)).
evidence(all_consistent(recommended_weight_range_size_160w)).
query(true_val(recommended_weight_range_size_160w, w80_100)).
query(true_val(recommended_weight_range_size_160w, unk_rw_160w)).

% @attr recommended_weight_range_size_164w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (164W)
% @values w88_108=88_108kg unk_rw_164w=Unknown
% @importance 1.0

0.76::true_val(recommended_weight_range_size_164w, w88_108); 0.24::true_val(recommended_weight_range_size_164w, unk_rw_164w).
0.88::acc(s4, recommended_weight_range_size_164w).
measured(s4, recommended_weight_range_size_164w, w88_108).
all_consistent(recommended_weight_range_size_164w) :- (indep(s4), consistent(s4, recommended_weight_range_size_164w) ; \+indep(s4)).
evidence(all_consistent(recommended_weight_range_size_164w)).
query(true_val(recommended_weight_range_size_164w, w88_108)).
query(true_val(recommended_weight_range_size_164w, unk_rw_164w)).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values triple_radius=Triple_radius_sidecut unk_sidecut_type=Unknown
% @importance 1.0

0.90::true_val(sidecut_type, triple_radius); 0.10::true_val(sidecut_type, unk_sidecut_type).
0.88::acc(s4, sidecut_type).
measured(s4, sidecut_type, triple_radius).
all_consistent(sidecut_type) :- (indep(s4), consistent(s4, sidecut_type) ; \+indep(s4)).
evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, triple_radius)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr powder_rating_tgr
% @type categorical
% @canonical true
% @original_name powder_rating_tgr
% @values good=Good unk_powder=Unknown
% @importance 0.9

0.81::true_val(powder_rating_tgr, good); 0.19::true_val(powder_rating_tgr, unk_powder).
0.85::acc(s16, powder_rating_tgr).
measured(s16, powder_rating_tgr, good).
all_consistent(powder_rating_tgr) :- consistent(s16, powder_rating_tgr).
evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, good)).
query(true_val(powder_rating_tgr, unk_powder)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values good=Good unk_glide=Unknown
% @importance 0.9

0.81::true_val(base_glide_performance, good); 0.19::true_val(base_glide_performance, unk_glide).
0.85::acc(s16, base_glide_performance).
measured(s16, base_glide_performance, good).
all_consistent(base_glide_performance) :- consistent(s16, base_glide_performance).
evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, good)).
query(true_val(base_glide_performance, unk_glide)).

% @attr carving_rating_tgr
% @type categorical
% @canonical true
% @original_name carving_rating_tgr
% @values good=Good unk_carving=Unknown
% @importance 0.9

0.81::true_val(carving_rating_tgr, good); 0.19::true_val(carving_rating_tgr, unk_carving).
0.85::acc(s16, carving_rating_tgr).
measured(s16, carving_rating_tgr, good).
all_consistent(carving_rating_tgr) :- consistent(s16, carving_rating_tgr).
evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, good)).
query(true_val(carving_rating_tgr, unk_carving)).

% @attr speed_rating_tgr
% @type categorical
% @canonical true
% @original_name speed_rating_tgr
% @values good=Good unk_speed=Unknown
% @importance 0.9

0.81::true_val(speed_rating_tgr, good); 0.19::true_val(speed_rating_tgr, unk_speed).
0.85::acc(s16, speed_rating_tgr).
measured(s16, speed_rating_tgr, good).
all_consistent(speed_rating_tgr) :- consistent(s16, speed_rating_tgr).
evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, good)).
query(true_val(speed_rating_tgr, unk_speed)).

% @attr chatter_performance
% @type categorical
% @canonical true
% @original_name chatter_performance
% @values poor=Poor unk_chatter=Unknown
% @importance 0.9

0.81::true_val(chatter_performance, poor); 0.19::true_val(chatter_performance, unk_chatter).
0.85::acc(s16, chatter_performance).
measured(s16, chatter_performance, poor).
all_consistent(chatter_performance) :- consistent(s16, chatter_performance).
evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, poor)).
query(true_val(chatter_performance, unk_chatter)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values great=Great unk_switch=Unknown
% @importance 0.9

0.81::true_val(switch_riding, great); 0.19::true_val(switch_riding, unk_switch).
0.85::acc(s16, switch_riding).
measured(s16, switch_riding, great).
all_consistent(switch_riding) :- consistent(s16, switch_riding).
evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, great)).
query(true_val(switch_riding, unk_switch)).

% @attr jumps_rating_tgr
% @type categorical
% @canonical true
% @original_name jumps_rating_tgr
% @values excellent=Excellent unk_jumps=Unknown
% @importance 0.9

0.81::true_val(jumps_rating_tgr, excellent); 0.19::true_val(jumps_rating_tgr, unk_jumps).
0.85::acc(s16, jumps_rating_tgr).
measured(s16, jumps_rating_tgr, excellent).
all_consistent(jumps_rating_tgr) :- consistent(s16, jumps_rating_tgr).
evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, excellent)).
query(true_val(jumps_rating_tgr, unk_jumps)).

% @attr jibbing_rating_tgr
% @type categorical
% @canonical true
% @original_name jibbing_rating_tgr
% @values good=Good unk_jibbing=Unknown
% @importance 0.9

0.81::true_val(jibbing_rating_tgr, good); 0.19::true_val(jibbing_rating_tgr, unk_jibbing).
0.85::acc(s16, jibbing_rating_tgr).
measured(s16, jibbing_rating_tgr, good).
all_consistent(jibbing_rating_tgr) :- consistent(s16, jibbing_rating_tgr).
evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, good)).
query(true_val(jibbing_rating_tgr, unk_jibbing)).

% @attr pipe_rating_tgr
% @type categorical
% @canonical true
% @original_name pipe_rating_tgr
% @values average=Average unk_pipe=Unknown
% @importance 0.9

0.81::true_val(pipe_rating_tgr, average); 0.19::true_val(pipe_rating_tgr, unk_pipe).
0.85::acc(s16, pipe_rating_tgr).
measured(s16, pipe_rating_tgr, average).
all_consistent(pipe_rating_tgr) :- consistent(s16, pipe_rating_tgr).
evidence(all_consistent(pipe_rating_tgr)).
query(true_val(pipe_rating_tgr, average)).
query(true_val(pipe_rating_tgr, unk_pipe)).

% @attr on_snow_feel_tgr
% @type categorical
% @canonical true
% @original_name on_snow_feel_tgr
% @values semi_stable=Semi_Stable unk_on_snow=Unknown
% @importance 0.9

0.81::true_val(on_snow_feel_tgr, semi_stable); 0.19::true_val(on_snow_feel_tgr, unk_on_snow).
0.85::acc(s16, on_snow_feel_tgr).
measured(s16, on_snow_feel_tgr, semi_stable).
all_consistent(on_snow_feel_tgr) :- consistent(s16, on_snow_feel_tgr).
evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, semi_stable)).
query(true_val(on_snow_feel_tgr, unk_on_snow)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values medium_fast=Medium_Fast unk_turn_init=Unknown
% @importance 0.9

0.81::true_val(turn_initiation_performance, medium_fast); 0.19::true_val(turn_initiation_performance, unk_turn_init).
0.85::acc(s16, turn_initiation_performance).
measured(s16, turn_initiation_performance, medium_fast).
all_consistent(turn_initiation_performance) :- consistent(s16, turn_initiation_performance).
evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, medium_fast)).
query(true_val(turn_initiation_performance, unk_turn_init)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values easy=Easy unk_tgr_opinion=Unknown
% @importance 0.9

0.81::true_val(reviewer_opinion_the_good_ride, easy); 0.19::true_val(reviewer_opinion_the_good_ride, unk_tgr_opinion).
0.85::acc(s16, reviewer_opinion_the_good_ride).
measured(s16, reviewer_opinion_the_good_ride, easy).
all_consistent(reviewer_opinion_the_good_ride) :- consistent(s16, reviewer_opinion_the_good_ride).
evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, easy)).
query(true_val(reviewer_opinion_the_good_ride, unk_tgr_opinion)).

% @attr reviewer_opinion_tgr_getting_air
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (getting air)
% @values semi_easy=Semi_Easy unk_tgr_air=Unknown
% @importance 0.9

0.81::true_val(reviewer_opinion_tgr_getting_air, semi_easy); 0.19::true_val(reviewer_opinion_tgr_getting_air, unk_tgr_air).
0.85::acc(s16, reviewer_opinion_tgr_getting_air).
measured(s16, reviewer_opinion_tgr_getting_air, semi_easy).
all_consistent(reviewer_opinion_tgr_getting_air) :- consistent(s16, reviewer_opinion_tgr_getting_air).
evidence(all_consistent(reviewer_opinion_tgr_getting_air)).
query(true_val(reviewer_opinion_tgr_getting_air, semi_easy)).
query(true_val(reviewer_opinion_tgr_getting_air, unk_tgr_air)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values medium_soft_snow=Medium_Soft_Snow unk_edge_hold=Unknown
% @importance 0.9

0.81::true_val(edge_hold, medium_soft_snow); 0.19::true_val(edge_hold, unk_edge_hold).
0.85::acc(s16, edge_hold).
measured(s16, edge_hold, medium_soft_snow).
all_consistent(edge_hold) :- consistent(s16, edge_hold).
evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, medium_soft_snow)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr reviewer_opinion_tgr_board_feel
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (board feel)
% @values feels_normal=Feels_Normal unk_tgr_feel=Unknown
% @importance 0.9

0.81::true_val(reviewer_opinion_tgr_board_feel, feels_normal); 0.19::true_val(reviewer_opinion_tgr_board_feel, unk_tgr_feel).
0.85::acc(s16, reviewer_opinion_tgr_board_feel).
measured(s16, reviewer_opinion_tgr_board_feel, feels_normal).
all_consistent(reviewer_opinion_tgr_board_feel) :- consistent(s16, reviewer_opinion_tgr_board_feel).
evidence(all_consistent(reviewer_opinion_tgr_board_feel)).
query(true_val(reviewer_opinion_tgr_board_feel, feels_normal)).
query(true_val(reviewer_opinion_tgr_board_feel, unk_tgr_feel)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values exceptional_pop=Exceptional_Pop_super_lively_carbon_tubes_camber unk_pos=Unknown
% @importance 0.9

0.85::true_val(positive_aspect, exceptional_pop); 0.15::true_val(positive_aspect, unk_pos).
0.87::acc(s36, positive_aspect).
measured(s36, positive_aspect, exceptional_pop).
all_consistent(positive_aspect) :- consistent(s36, positive_aspect).
evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, exceptional_pop)).
query(true_val(positive_aspect, unk_pos)).

% @attr positive_aspect_forgiving
% @type categorical
% @canonical false
% @original_name positive_aspect (forgiving)
% @values very_forgiving=Very_Forgiving_easy_to_skid_beginners_through_experts unk_pos_forg=Unknown
% @importance 0.9

0.85::true_val(positive_aspect_forgiving, very_forgiving); 0.15::true_val(positive_aspect_forgiving, unk_pos_forg).
0.87::acc(s36, positive_aspect_forgiving).
measured(s36, positive_aspect_forgiving, very_forgiving).
all_consistent(positive_aspect_forgiving) :- consistent(s36, positive_aspect_forgiving).
evidence(all_consistent(positive_aspect_forgiving)).
query(true_val(positive_aspect_forgiving, very_forgiving)).
query(true_val(positive_aspect_forgiving, unk_pos_forg)).

% @attr positive_aspect_pow_float
% @type categorical
% @canonical false
% @original_name positive_aspect (pow float)
% @values set_back_inserts_float=Set_Back_Inserts_Easy_Pow_Float unk_pos_pow=Unknown
% @importance 0.9

0.81::true_val(positive_aspect_pow_float, set_back_inserts_float); 0.19::true_val(positive_aspect_pow_float, unk_pos_pow).
0.85::acc(s16, positive_aspect_pow_float).
measured(s16, positive_aspect_pow_float, set_back_inserts_float).
all_consistent(positive_aspect_pow_float) :- consistent(s16, positive_aspect_pow_float).
evidence(all_consistent(positive_aspect_pow_float)).
query(true_val(positive_aspect_pow_float, set_back_inserts_float)).
query(true_val(positive_aspect_pow_float, unk_pos_pow)).

% @attr positive_aspect_quick_edge
% @type categorical
% @canonical false
% @original_name positive_aspect (quick edge)
% @values quick_edge_good_pop=Quick_edge_to_edge_with_good_pop unk_pos_edge=Unknown
% @importance 0.7

0.75::true_val(positive_aspect_quick_edge, quick_edge_good_pop); 0.25::true_val(positive_aspect_quick_edge, unk_pos_edge).
0.72::acc(s39, positive_aspect_quick_edge).
measured(s39, positive_aspect_quick_edge, quick_edge_good_pop).
all_consistent(positive_aspect_quick_edge) :- consistent(s39, positive_aspect_quick_edge).
evidence(all_consistent(positive_aspect_quick_edge)).
query(true_val(positive_aspect_quick_edge, quick_edge_good_pop)).
query(true_val(positive_aspect_quick_edge, unk_pos_edge)).

% @attr positive_aspect_butter
% @type categorical
% @canonical false
% @original_name positive_aspect (butter)
% @values easy_to_butter=Easy_to_butter_flat_nose_tail_section unk_pos_butter=Unknown
% @importance 0.9

0.85::true_val(positive_aspect_butter, easy_to_butter); 0.15::true_val(positive_aspect_butter, unk_pos_butter).
0.87::acc(s36, positive_aspect_butter).
measured(s36, positive_aspect_butter, easy_to_butter).
all_consistent(positive_aspect_butter) :- consistent(s36, positive_aspect_butter).
evidence(all_consistent(positive_aspect_butter)).
query(true_val(positive_aspect_butter, easy_to_butter)).
query(true_val(positive_aspect_butter, unk_pos_butter)).

% @attr positive_aspect_switch
% @type categorical
% @canonical false
% @original_name positive_aspect (switch)
% @values good_switch_despite_directional=Good_switch_riding_despite_directional_look unk_pos_switch=Unknown
% @importance 0.7

0.85::true_val(positive_aspect_switch, good_switch_despite_directional); 0.15::true_val(positive_aspect_switch, unk_pos_switch).
0.87::acc(s34, positive_aspect_switch).
measured(s34, positive_aspect_switch, good_switch_despite_directional).
all_consistent(positive_aspect_switch) :- consistent(s34, positive_aspect_switch).
evidence(all_consistent(positive_aspect_switch)).
query(true_val(positive_aspect_switch, good_switch_despite_directional)).
query(true_val(positive_aspect_switch, unk_pos_switch)).

% @attr positive_aspect_stiff_playful
% @type categorical
% @canonical false
% @original_name positive_aspect (stiff playful)
% @values stiff_right_places=Stiff_in_right_places_fun_playful_tip_tail unk_pos_stiff=Unknown
% @importance 0.7

0.70::true_val(positive_aspect_stiff_playful, stiff_right_places); 0.30::true_val(positive_aspect_stiff_playful, unk_pos_stiff).
0.68::acc(s40, positive_aspect_stiff_playful).
measured(s40, positive_aspect_stiff_playful, stiff_right_places).
all_consistent(positive_aspect_stiff_playful) :- consistent(s40, positive_aspect_stiff_playful).
evidence(all_consistent(positive_aspect_stiff_playful)).
query(true_val(positive_aspect_stiff_playful, stiff_right_places)).
query(true_val(positive_aspect_stiff_playful, unk_pos_stiff)).

% @attr positive_aspect_spins
% @type categorical
% @canonical false
% @original_name positive_aspect (spins)
% @values spins_effortlessly=Spins_effortlessly_edge_to_edge_quick unk_pos_spins=Unknown
% @importance 0.7

0.70::true_val(positive_aspect_spins, spins_effortlessly); 0.30::true_val(positive_aspect_spins, unk_pos_spins).
0.68::acc(s40, positive_aspect_spins).
measured(s40, positive_aspect_spins, spins_effortlessly).
all_consistent(positive_aspect_spins) :- consistent(s40, positive_aspect_spins).
evidence(all_consistent(positive_aspect_spins)).
query(true_val(positive_aspect_spins, spins_effortlessly)).
query(true_val(positive_aspect_spins, unk_pos_spins)).

% @attr positive_aspect_customer_service
% @type categorical
% @canonical false
% @original_name positive_aspect (customer service)
% @values responsive_warranty=Responsive_Bataleon_customer_service_warranty unk_pos_cs=Unknown
% @importance 0.7

0.75::true_val(positive_aspect_customer_service, responsive_warranty); 0.25::true_val(positive_aspect_customer_service, unk_pos_cs).
0.72::acc(s39, positive_aspect_customer_service).
measured(s39, positive_aspect_customer_service, responsive_warranty).
all_consistent(positive_aspect_customer_service) :- consistent(s39, positive_aspect_customer_service).
evidence(all_consistent(positive_aspect_customer_service)).
query(true_val(positive_aspect_customer_service, responsive_warranty)).
query(true_val(positive_aspect_customer_service, unk_pos_cs)).

% @attr positive_aspect_brilliant_team
% @type categorical
% @canonical false
% @original_name positive_aspect (brilliant team response)
% @values brilliant_team_response=Bataleon_team_brilliant_quick_response unk_pos_team=Unknown
% @importance 0.7

0.75::true_val(positive_aspect_brilliant_team, brilliant_team_response); 0.25::true_val(positive_aspect_brilliant_team, unk_pos_team).
0.72::acc(s39, positive_aspect_brilliant_team).
measured(s39, positive_aspect_brilliant_team, brilliant_team_response).
all_consistent(positive_aspect_brilliant_team) :- consistent(s39, positive_aspect_brilliant_team).
evidence(all_consistent(positive_aspect_brilliant_team)).
query(true_val(positive_aspect_brilliant_team, brilliant_team_response)).
query(true_val(positive_aspect_brilliant_team, unk_pos_team)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values limited_edge_hold=Very_limited_edge_hold_challenging_icy_snow unk_neg=Unknown
% @importance 0.9

0.85::true_val(negative_aspect, limited_edge_hold); 0.15::true_val(negative_aspect, unk_neg).
0.87::acc(s36, negative_aspect).
measured(s36, negative_aspect, limited_edge_hold).
all_consistent(negative_aspect) :- consistent(s36, negative_aspect).
evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, limited_edge_hold)).
query(true_val(negative_aspect, unk_neg)).

% @attr negative_aspect_washy
% @type categorical
% @canonical false
% @original_name negative_aspect (washy)
% @values edgeless_washy=Edgeless_washy_feel_medium_to_firm_snow unk_neg_washy=Unknown
% @importance 0.9

0.85::true_val(negative_aspect_washy, edgeless_washy); 0.15::true_val(negative_aspect_washy, unk_neg_washy).
0.87::acc(s36, negative_aspect_washy).
measured(s36, negative_aspect_washy, edgeless_washy).
all_consistent(negative_aspect_washy) :- consistent(s36, negative_aspect_washy).
evidence(all_consistent(negative_aspect_washy)).
query(true_val(negative_aspect_washy, edgeless_washy)).
query(true_val(negative_aspect_washy, unk_neg_washy)).

% @attr negative_aspect_bouncy
% @type categorical
% @canonical false
% @original_name negative_aspect (bouncy)
% @values bucky_bouncy=Very_bucky_bouncy_soft_uneven_snow unk_neg_bouncy=Unknown
% @importance 0.9

0.81::true_val(negative_aspect_bouncy, bucky_bouncy); 0.19::true_val(negative_aspect_bouncy, unk_neg_bouncy).
0.85::acc(s16, negative_aspect_bouncy).
measured(s16, negative_aspect_bouncy, bucky_bouncy).
all_consistent(negative_aspect_bouncy) :- consistent(s16, negative_aspect_bouncy).
evidence(all_consistent(negative_aspect_bouncy)).
query(true_val(negative_aspect_bouncy, bucky_bouncy)).
query(true_val(negative_aspect_bouncy, unk_neg_bouncy)).

% @attr negative_aspect_center_weighted
% @type categorical
% @canonical false
% @original_name negative_aspect (center weighted)
% @values only_center_weighted=Only_likes_center_weighted_turns unk_neg_center=Unknown
% @importance 0.9

0.81::true_val(negative_aspect_center_weighted, only_center_weighted); 0.19::true_val(negative_aspect_center_weighted, unk_neg_center).
0.85::acc(s16, negative_aspect_center_weighted).
measured(s16, negative_aspect_center_weighted, only_center_weighted).
all_consistent(negative_aspect_center_weighted) :- consistent(s16, negative_aspect_center_weighted).
evidence(all_consistent(negative_aspect_center_weighted)).
query(true_val(negative_aspect_center_weighted, only_center_weighted)).
query(true_val(negative_aspect_center_weighted, unk_neg_center)).

% @attr negative_aspect_stability
% @type categorical
% @canonical false
% @original_name negative_aspect (stability)
% @values not_as_stable=Not_as_stable_as_most_hybrid_camber_boards unk_neg_stab=Unknown
% @importance 0.9

0.85::true_val(negative_aspect_stability, not_as_stable); 0.15::true_val(negative_aspect_stability, unk_neg_stab).
0.87::acc(s36, negative_aspect_stability).
measured(s36, negative_aspect_stability, not_as_stable).
all_consistent(negative_aspect_stability) :- consistent(s36, negative_aspect_stability).
evidence(all_consistent(negative_aspect_stability)).
query(true_val(negative_aspect_stability, not_as_stable)).
query(true_val(negative_aspect_stability, unk_neg_stab)).

% @attr negative_aspect_trees
% @type categorical
% @canonical false
% @original_name negative_aspect (trees)
% @values not_nimble_trees=Not_as_nimble_in_trees_vs_Party_Wave unk_neg_trees=Unknown
% @importance 0.7

0.70::true_val(negative_aspect_trees, not_nimble_trees); 0.30::true_val(negative_aspect_trees, unk_neg_trees).
0.68::acc(s40, negative_aspect_trees).
measured(s40, negative_aspect_trees, not_nimble_trees).
all_consistent(negative_aspect_trees) :- consistent(s40, negative_aspect_trees).
evidence(all_consistent(negative_aspect_trees)).
query(true_val(negative_aspect_trees, not_nimble_trees)).
query(true_val(negative_aspect_trees, unk_neg_trees)).

% @attr negative_aspect_3bt_edgeless
% @type categorical
% @canonical false
% @original_name negative_aspect (3BT edgeless)
% @values tbt_edgeless=TBT_feels_edgeless_outside_soft_clean_snow unk_neg_3bt=Unknown
% @importance 0.9

0.85::true_val(negative_aspect_3bt_edgeless, tbt_edgeless); 0.15::true_val(negative_aspect_3bt_edgeless, unk_neg_3bt).
0.87::acc(s36, negative_aspect_3bt_edgeless).
measured(s36, negative_aspect_3bt_edgeless, tbt_edgeless).
all_consistent(negative_aspect_3bt_edgeless) :- consistent(s36, negative_aspect_3bt_edgeless).
evidence(all_consistent(negative_aspect_3bt_edgeless)).
query(true_val(negative_aspect_3bt_edgeless, tbt_edgeless)).
query(true_val(negative_aspect_3bt_edgeless, unk_neg_3bt)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values tgr_comparable_list=United_Shapes_Cadet_Korua_Otto_K2_Manifest_Yes_Typo_Jones_Frontier_etc unk_comparable_cross=Unknown
% @importance 0.85

0.83::true_val(comparable_board_cross_brand, tgr_comparable_list); 0.17::true_val(comparable_board_cross_brand, unk_comparable_cross).
0.85::acc(s41, comparable_board_cross_brand).
measured(s41, comparable_board_cross_brand, tgr_comparable_list).
all_consistent(comparable_board_cross_brand) :- consistent(s41, comparable_board_cross_brand).
evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, tgr_comparable_list)).
query(true_val(comparable_board_cross_brand, unk_comparable_cross)).

% @attr comparable_board_same_brand_3bt
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (3BT level)
% @values least_3bt_in_lineup=Beyond_Medals_has_least_3BT_in_Bataleon_lineup unk_comp_3bt=Unknown
% @importance 0.7

0.72::true_val(comparable_board_same_brand_3bt, least_3bt_in_lineup); 0.28::true_val(comparable_board_same_brand_3bt, unk_comp_3bt).
0.68::acc(s35, comparable_board_same_brand_3bt).
measured(s35, comparable_board_same_brand_3bt, least_3bt_in_lineup).
all_consistent(comparable_board_same_brand_3bt) :- consistent(s35, comparable_board_same_brand_3bt).
evidence(all_consistent(comparable_board_same_brand_3bt)).
query(true_val(comparable_board_same_brand_3bt, least_3bt_in_lineup)).
query(true_val(comparable_board_same_brand_3bt, unk_comp_3bt)).

% @attr comparable_board_same_brand_lineup
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (lineup)
% @values goliath_whatever_thunderstorm_turbo_cameleon=Goliath_Goliath_Plus_Whatever_Thunderstorm_Turbo_Cameleon unk_comp_lineup=Unknown
% @importance 0.7

0.68::true_val(comparable_board_same_brand_lineup, goliath_whatever_thunderstorm_turbo_cameleon); 0.32::true_val(comparable_board_same_brand_lineup, unk_comp_lineup).
0.62::acc(s42, comparable_board_same_brand_lineup).
measured(s42, comparable_board_same_brand_lineup, goliath_whatever_thunderstorm_turbo_cameleon).
all_consistent(comparable_board_same_brand_lineup) :- consistent(s42, comparable_board_same_brand_lineup).
evidence(all_consistent(comparable_board_same_brand_lineup)).
query(true_val(comparable_board_same_brand_lineup, goliath_whatever_thunderstorm_turbo_cameleon)).
query(true_val(comparable_board_same_brand_lineup, unk_comp_lineup)).

% @attr sustainability_certification_fsc
% @type categorical
% @canonical false
% @original_name sustainability_certification (FSC)
% @values fsc_certified_cores=FSC_certified_wood_cores unk_sustain_fsc=Unknown
% @importance 0.45

0.68::true_val(sustainability_certification_fsc, fsc_certified_cores); 0.32::true_val(sustainability_certification_fsc, unk_sustain_fsc).
0.62::acc(s43, sustainability_certification_fsc).
measured(s43, sustainability_certification_fsc, fsc_certified_cores).
all_consistent(sustainability_certification_fsc) :- (indep(s43), consistent(s43, sustainability_certification_fsc) ; \+indep(s43)).
evidence(all_consistent(sustainability_certification_fsc)).
query(true_val(sustainability_certification_fsc, fsc_certified_cores)).
query(true_val(sustainability_certification_fsc, unk_sustain_fsc)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values fastest_growing_brand=One_of_fastest_growing_snowboard_brands unk_wl_opinion=Unknown
% @importance 0.5

0.78::true_val(reviewer_opinion_whitelines, fastest_growing_brand); 0.22::true_val(reviewer_opinion_whitelines, unk_wl_opinion).
0.75::acc(s44, reviewer_opinion_whitelines).
measured(s44, reviewer_opinion_whitelines, fastest_growing_brand).
all_consistent(reviewer_opinion_whitelines) :- consistent(s44, reviewer_opinion_whitelines).
evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, fastest_growing_brand)).
query(true_val(reviewer_opinion_whitelines, unk_wl_opinion)).

% @attr brand_reputation_nidecker
% @type categorical
% @canonical false
% @original_name Brand reputation (Nidecker)
% @values profoundly_influential=Few_brands_influenced_snowboard_design_as_profoundly unk_brand_rep=Unknown
% @importance 0.7

0.90::true_val(brand_reputation_nidecker, profoundly_influential); 0.10::true_val(brand_reputation_nidecker, unk_brand_rep).
0.88::acc(s11, brand_reputation_nidecker).
measured(s11, brand_reputation_nidecker, profoundly_influential).
all_consistent(brand_reputation_nidecker) :- consistent(s11, brand_reputation_nidecker).
evidence(all_consistent(brand_reputation_nidecker)).
query(true_val(brand_reputation_nidecker, profoundly_influential)).
query(true_val(brand_reputation_nidecker, unk_brand_rep)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values catch_free_but_loose_firm=3BT_catch_free_comfortable_but_loose_in_firm_snow unk_forum=Unknown
% @importance 0.75

0.72::true_val(user_review_forum, catch_free_but_loose_firm); 0.28::true_val(user_review_forum, unk_forum).
0.70::acc(s45, user_review_forum).
measured(s45, user_review_forum, catch_free_but_loose_firm).
all_consistent(user_review_forum) :- consistent(s45, user_review_forum).
evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, catch_free_but_loose_firm)).
query(true_val(user_review_forum, unk_forum)).

% @attr reviewer_opinion_whitelines_award
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines (award)
% @values whitelines_100_predecessor=Whatever_Beyond_Medals_Whitelines_100_2022_23 unk_wl_award=Unknown
% @importance 0.5

0.72::true_val(reviewer_opinion_whitelines_award, whitelines_100_predecessor); 0.28::true_val(reviewer_opinion_whitelines_award, unk_wl_award).
0.70::acc(s46, reviewer_opinion_whitelines_award).
measured(s46, reviewer_opinion_whitelines_award, whitelines_100_predecessor).
all_consistent(reviewer_opinion_whitelines_award) :- consistent(s46, reviewer_opinion_whitelines_award).
evidence(all_consistent(reviewer_opinion_whitelines_award)).
query(true_val(reviewer_opinion_whitelines_award, whitelines_100_predecessor)).
query(true_val(reviewer_opinion_whitelines_award, unk_wl_award)).

% @attr user_review_forum_preference
% @type categorical
% @canonical false
% @original_name user_review_forum (preference)
% @values prefers_flat_base=Some_riders_prefer_flat_base_over_3BT unk_forum_pref=Unknown
% @importance 0.65

0.62::true_val(user_review_forum_preference, prefers_flat_base); 0.38::true_val(user_review_forum_preference, unk_forum_pref).
0.58::acc(s47, user_review_forum_preference).
measured(s47, user_review_forum_preference, prefers_flat_base).
all_consistent(user_review_forum_preference) :- consistent(s47, user_review_forum_preference).
evidence(all_consistent(user_review_forum_preference)).
query(true_val(user_review_forum_preference, prefers_flat_base)).
query(true_val(user_review_forum_preference, unk_forum_pref)).