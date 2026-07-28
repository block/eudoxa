0.70::indep(s1).
0.20::indep(s4).
0.20::indep(s5).
0.20::indep(s18).
0.25::indep(s19).
0.15::indep(s22).
0.15::indep(s23).
0.15::indep(s25).
0.15::indep(s29).
0.20::indep(s30).
0.25::indep(s32).
0.15::indep(s35).
0.20::indep(s55).
0.25::indep(s56).
0.20::indep(s63).
0.15::indep(s24).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values bataleon=Bataleon unk_brand=Unknown
% @importance 1.0

0.93::acc(s2, brand).
0.80::acc(s1, brand).
0.95::true_val(brand, bataleon); 0.05::true_val(brand, unk_brand).
measured(s2, brand, bataleon).
measured(s1, brand, bataleon).
all_consistent(brand) :- consistent(s2, brand), (indep(s1), consistent(s1, brand) ; \+indep(s1)).
evidence(all_consistent(brand)).
query(true_val(brand, bataleon)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values disaster_plus=Disaster_Plus unk_model_name=Unknown
% @importance 1.0

0.95::acc(s2, model_name).
0.82::acc(s1, model_name).
0.96::true_val(model_name, disaster_plus); 0.04::true_val(model_name, unk_model_name).
measured(s2, model_name, disaster_plus).
measured(s1, model_name, disaster_plus).
all_consistent(model_name) :- consistent(s2, model_name), (indep(s1), consistent(s1, model_name) ; \+indep(s1)).
evidence(all_consistent(model_name)).
query(true_val(model_name, disaster_plus)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2027=2027 unk_model_year=Unknown
% @importance 1.0

0.85::acc(s1, model_year).
0.71::true_val(model_year, y2027); 0.29::true_val(model_year, unk_model_year).
measured(s1, model_year, y2027).
all_consistent(model_year) :- consistent(s1, model_year).
evidence(all_consistent(model_year)).
query(true_val(model_year, y2027)).
query(true_val(model_year, unk_model_year)).

% @attr model_series
% @type categorical
% @canonical false
% @original_name Model series
% @values plus_series=Plus_Series unk_model_series=Unknown
% @importance 0.80

0.90::acc(s2, model_series).
0.75::acc(s3, model_series).
0.95::true_val(model_series, plus_series); 0.05::true_val(model_series, unk_model_series).
measured(s2, model_series, plus_series).
measured(s3, model_series, plus_series).
all_consistent(model_series) :- consistent(s2, model_series), consistent(s3, model_series).
evidence(all_consistent(model_series)).
query(true_val(model_series, plus_series)).
query(true_val(model_series, unk_model_series)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.95::acc(s2, product_type).
0.82::acc(s1, product_type).
0.97::true_val(product_type, snowboard); 0.03::true_val(product_type, unk_product_type).
measured(s2, product_type, snowboard).
measured(s1, product_type, snowboard).
all_consistent(product_type) :- consistent(s2, product_type), (indep(s1), consistent(s1, product_type) ; \+indep(s1)).
evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values freestyle=Freestyle unk_board_category=Unknown
% @importance 0.90

0.90::acc(s1, board_category).
0.80::acc(s4, board_category).
0.95::true_val(board_category, freestyle); 0.05::true_val(board_category, unk_board_category).
measured(s1, board_category, freestyle).
measured(s4, board_category, freestyle).
all_consistent(board_category) :- (indep(s1), consistent(s1, board_category) ; \+indep(s1)), (indep(s4), consistent(s4, board_category) ; \+indep(s4)).
evidence(all_consistent(board_category)).
query(true_val(board_category, freestyle)).
query(true_val(board_category, unk_board_category)).

% @attr board_subtype
% @type categorical
% @canonical false
% @original_name Board subtype
% @values jib_park=Jib_Park unk_board_subtype=Unknown
% @importance 0.70

0.78::acc(s5, board_subtype).
0.72::acc(s6, board_subtype).
0.93::true_val(board_subtype, jib_park); 0.07::true_val(board_subtype, unk_board_subtype).
measured(s5, board_subtype, jib_park).
measured(s6, board_subtype, jib_park).
all_consistent(board_subtype) :- consistent(s5, board_subtype), consistent(s6, board_subtype).
evidence(all_consistent(board_subtype)).
query(true_val(board_subtype, jib_park)).
query(true_val(board_subtype, unk_board_subtype)).

% @attr manufacturer_parent
% @type categorical
% @canonical false
% @original_name manufacturer
% @values low_pressure_nidecker=Low_Pressure_Studio_Nidecker unk_manufacturer_parent=Unknown
% @importance 0.50

0.82::acc(s7, manufacturer_parent).
0.71::true_val(manufacturer_parent, low_pressure_nidecker); 0.29::true_val(manufacturer_parent, unk_manufacturer_parent).
measured(s7, manufacturer_parent, low_pressure_nidecker).
all_consistent(manufacturer_parent) :- consistent(s7, manufacturer_parent).
evidence(all_consistent(manufacturer_parent)).
query(true_val(manufacturer_parent, low_pressure_nidecker)).
query(true_val(manufacturer_parent, unk_manufacturer_parent)).

% @attr bataleon_founding_year
% @type categorical
% @canonical false
% @original_name Bataleon founding year
% @values y2000=2000 y2001=2001
% @importance 0.35

0.78::acc(s8, bataleon_founding_year).
0.68::acc(s9, bataleon_founding_year).
0.60::true_val(bataleon_founding_year, y2000); 0.40::true_val(bataleon_founding_year, y2001).
measured(s8, bataleon_founding_year, y2000).
measured(s9, bataleon_founding_year, y2001).
all_consistent(bataleon_founding_year) :- consistent(s8, bataleon_founding_year), consistent(s9, bataleon_founding_year).
evidence(all_consistent(bataleon_founding_year)).
query(true_val(bataleon_founding_year, y2000)).
query(true_val(bataleon_founding_year, y2001)).

% @attr bataleon_headquarters
% @type categorical
% @canonical false
% @original_name Bataleon headquarters
% @values amsterdam=Amsterdam_Netherlands unk_hq=Unknown
% @importance 0.325

0.85::acc(s10, bataleon_headquarters).
0.75::acc(s11, bataleon_headquarters).
0.95::true_val(bataleon_headquarters, amsterdam); 0.05::true_val(bataleon_headquarters, unk_hq).
measured(s10, bataleon_headquarters, amsterdam).
measured(s11, bataleon_headquarters, amsterdam).
all_consistent(bataleon_headquarters) :- consistent(s10, bataleon_headquarters), consistent(s11, bataleon_headquarters).
evidence(all_consistent(bataleon_headquarters)).
query(true_val(bataleon_headquarters, amsterdam)).
query(true_val(bataleon_headquarters, unk_hq)).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values austria_mothership=Austria_Mothership china_or_saudi=China_or_Saudi_Arabia
% @importance 0.60

0.82::acc(s12, manufacturing_location_current).
0.72::acc(s13, manufacturing_location_current).
0.60::acc(s14, manufacturing_location_current).
0.68::acc(s15, manufacturing_location_current).
0.75::true_val(manufacturing_location_current, austria_mothership); 0.25::true_val(manufacturing_location_current, china_or_saudi).
measured(s12, manufacturing_location_current, austria_mothership).
measured(s13, manufacturing_location_current, austria_mothership).
measured(s14, manufacturing_location_current, china_or_saudi).
measured(s15, manufacturing_location_current, austria_mothership).
all_consistent(manufacturing_location_current) :- consistent(s12, manufacturing_location_current), consistent(s13, manufacturing_location_current), consistent(s14, manufacturing_location_current), consistent(s15, manufacturing_location_current).
evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, austria_mothership)).
query(true_val(manufacturing_location_current, china_or_saudi)).

% @attr nidecker_group
% @type categorical
% @canonical false
% @original_name Nidecker Group
% @values second_biggest=Second_biggest_snowboard_company unk_nidecker=Unknown
% @importance 0.50

0.78::acc(s7, nidecker_group).
0.71::true_val(nidecker_group, second_biggest); 0.29::true_val(nidecker_group, unk_nidecker).
measured(s7, nidecker_group, second_biggest).
all_consistent(nidecker_group) :- consistent(s7, nidecker_group).
evidence(all_consistent(nidecker_group)).
query(true_val(nidecker_group, second_biggest)).
query(true_val(nidecker_group, unk_nidecker)).

% @attr brand_usp
% @type categorical
% @canonical false
% @original_name Brand USP
% @values triple_base_3bt=Triple_Base_Technology_3BT unk_brand_usp=Unknown
% @importance 0.45

0.90::acc(s16, brand_usp).
0.78::acc(s17, brand_usp).
0.95::true_val(brand_usp, triple_base_3bt); 0.05::true_val(brand_usp, unk_brand_usp).
measured(s16, brand_usp, triple_base_3bt).
measured(s17, brand_usp, triple_base_3bt).
all_consistent(brand_usp) :- consistent(s16, brand_usp), consistent(s17, brand_usp).
evidence(all_consistent(brand_usp)).
query(true_val(brand_usp, triple_base_3bt)).
query(true_val(brand_usp, unk_brand_usp)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values two_plus_one_year=2_plus_1_Year unk_warranty=Unknown
% @importance 1.0

0.93::acc(s2, warranty).
0.90::true_val(warranty, two_plus_one_year); 0.10::true_val(warranty, unk_warranty).
measured(s2, warranty, two_plus_one_year).
all_consistent(warranty) :- consistent(s2, warranty).
evidence(all_consistent(warranty)).
query(true_val(warranty, two_plus_one_year)).
query(true_val(warranty, unk_warranty)).

% @attr return_policy_terms
% @type categorical
% @canonical true
% @original_name return_policy_terms
% @values fourty_five_day=45_Day_Returns unk_return_policy=Unknown
% @importance 1.0

0.93::acc(s2, return_policy_terms).
0.90::true_val(return_policy_terms, fourty_five_day); 0.10::true_val(return_policy_terms, unk_return_policy).
measured(s2, return_policy_terms, fourty_five_day).
all_consistent(return_policy_terms) :- consistent(s2, return_policy_terms).
evidence(all_consistent(return_policy_terms)).
query(true_val(return_policy_terms, fourty_five_day)).
query(true_val(return_policy_terms, unk_return_policy)).

% @attr free_shipping_threshold
% @type categorical
% @canonical false
% @original_name Free shipping threshold
% @values over_50_usd=Free_shipping_over_50USD unk_shipping=Unknown
% @importance 1.0

0.90::acc(s2, free_shipping_threshold).
0.90::true_val(free_shipping_threshold, over_50_usd); 0.10::true_val(free_shipping_threshold, unk_shipping).
measured(s2, free_shipping_threshold, over_50_usd).
all_consistent(free_shipping_threshold) :- consistent(s2, free_shipping_threshold).
evidence(all_consistent(free_shipping_threshold)).
query(true_val(free_shipping_threshold, over_50_usd)).
query(true_val(free_shipping_threshold, unk_shipping)).

% @attr price_aud_merchant
% @type numeric
% @canonical true
% @original_name price_aud_merchant
% @unit AUD
% @values v1039_99=1039.99 unk_price_aud=Unknown
% @importance 1.0

0.85::acc(s1, price_aud_merchant).
0.71::true_val(price_aud_merchant, v1039_99); 0.29::true_val(price_aud_merchant, unk_price_aud).
measured(s1, price_aud_merchant, v1039_99).
all_consistent(price_aud_merchant) :- consistent(s1, price_aud_merchant).
evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v1039_99)).
query(true_val(price_aud_merchant, unk_price_aud)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v629_95=629.95 unk_msrp=Unknown
% @importance 1.0

0.93::acc(s2, price_usd_msrp).
0.90::true_val(price_usd_msrp, v629_95); 0.10::true_val(price_usd_msrp, unk_msrp).
measured(s2, price_usd_msrp, v629_95).
all_consistent(price_usd_msrp) :- consistent(s2, price_usd_msrp).
evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v629_95)).
query(true_val(price_usd_msrp, unk_msrp)).

% @attr price_usd_evo
% @type numeric
% @canonical true
% @original_name price_usd_evo
% @unit USD
% @values v629_95=629.95 unk_price_evo=Unknown
% @importance 0.95

0.88::acc(s18, price_usd_evo).
0.81::true_val(price_usd_evo, v629_95); 0.19::true_val(price_usd_evo, unk_price_evo).
measured(s18, price_usd_evo, v629_95).
all_consistent(price_usd_evo) :- consistent(s18, price_usd_evo).
evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v629_95)).
query(true_val(price_usd_evo, unk_price_evo)).

% @attr price_usd_evo_sale
% @type numeric
% @canonical false
% @original_name price_usd_evo (sale/clearance on 2026 model year)
% @unit USD
% @values v440_96=440.96 unk_price_evo_sale=Unknown
% @importance 0.95

0.88::acc(s18, price_usd_evo_sale).
0.81::true_val(price_usd_evo_sale, v440_96); 0.19::true_val(price_usd_evo_sale, unk_price_evo_sale).
measured(s18, price_usd_evo_sale, v440_96).
all_consistent(price_usd_evo_sale) :- consistent(s18, price_usd_evo_sale).
evidence(all_consistent(price_usd_evo_sale)).
query(true_val(price_usd_evo_sale, v440_96)).
query(true_val(price_usd_evo_sale, unk_price_evo_sale)).

% @attr price_usd_s2as
% @type numeric
% @canonical false
% @original_name Price (USD, S2AS)
% @unit USD
% @values v601=601.0 unk_price_s2as=Unknown
% @importance 0.90

0.78::acc(s19, price_usd_s2as).
0.63::true_val(price_usd_s2as, v601); 0.37::true_val(price_usd_s2as, unk_price_s2as).
measured(s19, price_usd_s2as, v601).
all_consistent(price_usd_s2as) :- consistent(s19, price_usd_s2as).
evidence(all_consistent(price_usd_s2as)).
query(true_val(price_usd_s2as, v601)).
query(true_val(price_usd_s2as, unk_price_s2as)).

% @attr comparable_board_same_brand
% @type numeric
% @canonical true
% @original_name comparable_board_same_brand
% @unit USD
% @values v499_95=499.95 unk_comp_same=Unknown
% @importance 0.80

0.88::acc(s20, comparable_board_same_brand).
0.81::true_val(comparable_board_same_brand, v499_95); 0.19::true_val(comparable_board_same_brand, unk_comp_same).
measured(s20, comparable_board_same_brand, v499_95).
all_consistent(comparable_board_same_brand) :- consistent(s20, comparable_board_same_brand).
evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, v499_95)).
query(true_val(comparable_board_same_brand, unk_comp_same)).

% @attr comparable_board_same_brand_price_premium
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (price premium ~$130)
% @values approx_130_more=Approximately_130_more_than_standard unk_premium=Unknown
% @importance 0.80

0.78::acc(s21, comparable_board_same_brand_price_premium).
0.60::true_val(comparable_board_same_brand_price_premium, approx_130_more); 0.40::true_val(comparable_board_same_brand_price_premium, unk_premium).
measured(s21, comparable_board_same_brand_price_premium, approx_130_more).
all_consistent(comparable_board_same_brand_price_premium) :- consistent(s21, comparable_board_same_brand_price_premium).
evidence(all_consistent(comparable_board_same_brand_price_premium)).
query(true_val(comparable_board_same_brand_price_premium, approx_130_more)).
query(true_val(comparable_board_same_brand_price_premium, unk_premium)).

% @attr availability_status_preorder_au
% @type categorical
% @canonical false
% @original_name availability_status (preorder AU)
% @values preorder=Preorder unk_avail_au=Unknown
% @importance 1.0

0.82::acc(s1, availability_status_preorder_au).
0.71::true_val(availability_status_preorder_au, preorder); 0.29::true_val(availability_status_preorder_au, unk_avail_au).
measured(s1, availability_status_preorder_au, preorder).
all_consistent(availability_status_preorder_au) :- consistent(s1, availability_status_preorder_au).
evidence(all_consistent(availability_status_preorder_au)).
query(true_val(availability_status_preorder_au, preorder)).
query(true_val(availability_status_preorder_au, unk_avail_au)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values available=Available unk_avail=Unknown
% @importance 0.70

0.90::acc(s2, availability_status).
0.80::acc(s18, availability_status).
0.78::acc(s19, availability_status).
0.72::acc(s22, availability_status).
0.70::acc(s24, availability_status).
0.96::true_val(availability_status, available); 0.04::true_val(availability_status, unk_avail).
measured(s2, availability_status, available).
measured(s18, availability_status, available).
measured(s19, availability_status, available).
measured(s22, availability_status, available).
measured(s24, availability_status, available).
all_consistent(availability_status) :- consistent(s2, availability_status), (indep(s18), consistent(s18, availability_status) ; \+indep(s18)), (indep(s19), consistent(s19, availability_status) ; \+indep(s19)), (indep(s22), consistent(s22, availability_status) ; \+indep(s22)), (indep(s24), consistent(s24, availability_status) ; \+indep(s24)).
evidence(all_consistent(availability_status)).
query(true_val(availability_status, available)).
query(true_val(availability_status, unk_avail)).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status (Blauer)
% @values listed=Listed unk_avail_blauer=Unknown
% @importance 0.50

0.70::acc(s23, availability_status_blauer).
0.56::true_val(availability_status_blauer, listed); 0.44::true_val(availability_status_blauer, unk_avail_blauer).
measured(s23, availability_status_blauer, listed).
all_consistent(availability_status_blauer) :- consistent(s23, availability_status_blauer).
evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, listed)).
query(true_val(availability_status_blauer, unk_avail_blauer)).

% @attr availability_status_skipro
% @type categorical
% @canonical false
% @original_name availability_status (SkiPro sold out/preorder)
% @values sold_out_preorder=Sold_out_or_preorder unk_avail_skipro=Unknown
% @importance 0.40

0.60::acc(s25, availability_status_skipro).
0.45::true_val(availability_status_skipro, sold_out_preorder); 0.55::true_val(availability_status_skipro, unk_avail_skipro).
measured(s25, availability_status_skipro, sold_out_preorder).
all_consistent(availability_status_skipro) :- consistent(s25, availability_status_skipro).
evidence(all_consistent(availability_status_skipro)).
query(true_val(availability_status_skipro, sold_out_preorder)).
query(true_val(availability_status_skipro, unk_avail_skipro)).

% @attr merchant_shipping_restriction
% @type categorical
% @canonical false
% @original_name Merchant shipping restriction
% @values australia_only=Australia_only unk_shipping_restrict=Unknown
% @importance 1.0

0.82::acc(s1, merchant_shipping_restriction).
0.71::true_val(merchant_shipping_restriction, australia_only); 0.29::true_val(merchant_shipping_restriction, unk_shipping_restrict).
measured(s1, merchant_shipping_restriction, australia_only).
all_consistent(merchant_shipping_restriction) :- consistent(s1, merchant_shipping_restriction).
evidence(all_consistent(merchant_shipping_restriction)).
query(true_val(merchant_shipping_restriction, australia_only)).
query(true_val(merchant_shipping_restriction, unk_shipping_restrict)).

% @attr model_first_available_year
% @type categorical
% @canonical false
% @original_name model_first_available_year
% @values y2023=2023 unk_first_year=Unknown
% @importance 0.60

0.75::acc(s26, model_first_available_year).
0.63::true_val(model_first_available_year, y2023); 0.37::true_val(model_first_available_year, unk_first_year).
measured(s26, model_first_available_year, y2023).
all_consistent(model_first_available_year) :- consistent(s26, model_first_available_year).
evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2023)).
query(true_val(model_first_available_year, unk_first_year)).

% @attr disaster_model_lineage
% @type categorical
% @canonical false
% @original_name Disaster model lineage
% @values since_2013_or_earlier=Since_2013_or_earlier unk_lineage=Unknown
% @importance 0.325

0.55::acc(s27, disaster_model_lineage).
0.78::acc(s28, disaster_model_lineage).
0.92::true_val(disaster_model_lineage, since_2013_or_earlier); 0.08::true_val(disaster_model_lineage, unk_lineage).
measured(s27, disaster_model_lineage, since_2013_or_earlier).
measured(s28, disaster_model_lineage, since_2013_or_earlier).
all_consistent(disaster_model_lineage) :- consistent(s27, disaster_model_lineage), consistent(s28, disaster_model_lineage).
evidence(all_consistent(disaster_model_lineage)).
query(true_val(disaster_model_lineage, since_2013_or_earlier)).
query(true_val(disaster_model_lineage, unk_lineage)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @original_name flex_rating_10
% @unit /10
% @values v4=4.0 v3=3.0
% @importance 0.89

0.83::acc(s1, flex_rating_10).
0.72::acc(s19, flex_rating_10).
0.72::acc(s22, flex_rating_10).
0.65::acc(s29, flex_rating_10).
0.55::true_val(flex_rating_10, v4); 0.45::true_val(flex_rating_10, v3).
measured(s1, flex_rating_10, v4).
measured(s19, flex_rating_10, v3).
measured(s22, flex_rating_10, v4).
measured(s29, flex_rating_10, v3).
all_consistent(flex_rating_10) :- (indep(s1), consistent(s1, flex_rating_10) ; \+indep(s1)), (indep(s19), consistent(s19, flex_rating_10) ; \+indep(s19)), (indep(s22), consistent(s22, flex_rating_10) ; \+indep(s22)), (indep(s29), consistent(s29, flex_rating_10) ; \+indep(s29)).
evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v4)).
query(true_val(flex_rating_10, v3)).

% @attr flex_rating_10_manufacturer
% @type numeric
% @canonical false
% @original_name flex_rating_10_manufacturer
% @unit /10
% @values v4=4.0 unk_flex_mfg=Unknown
% @importance 1.0

0.94::acc(s2, flex_rating_10_manufacturer).
0.90::true_val(flex_rating_10_manufacturer, v4); 0.10::true_val(flex_rating_10_manufacturer, unk_flex_mfg).
measured(s2, flex_rating_10_manufacturer, v4).
all_consistent(flex_rating_10_manufacturer) :- consistent(s2, flex_rating_10_manufacturer).
evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, v4)).
query(true_val(flex_rating_10_manufacturer, unk_flex_mfg)).

% @attr flex_rating_10_evo
% @type categorical
% @canonical false
% @original_name flex_rating_10_evo
% @values soft=Soft unk_flex_evo=Unknown
% @importance 0.60

0.78::acc(s30, flex_rating_10_evo).
0.64::true_val(flex_rating_10_evo, soft); 0.36::true_val(flex_rating_10_evo, unk_flex_evo).
measured(s30, flex_rating_10_evo, soft).
all_consistent(flex_rating_10_evo) :- consistent(s30, flex_rating_10_evo).
evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, soft)).
query(true_val(flex_rating_10_evo, unk_flex_evo)).

% @attr flex_feel
% @type numeric
% @canonical true
% @original_name flex_feel
% @unit /10
% @values v3_5=3.5 unk_flex_feel=Unknown
% @importance 0.85

0.82::acc(s31, flex_feel).
0.67::true_val(flex_feel, v3_5); 0.33::true_val(flex_feel, unk_flex_feel).
measured(s31, flex_feel, v3_5).
all_consistent(flex_feel) :- consistent(s31, flex_feel).
evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, v3_5)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr flex_direction
% @type categorical
% @canonical false
% @original_name flex_direction
% @values true_twin=True_twin_identical_nose_tail unk_flex_dir=Unknown
% @importance 1.0

0.93::acc(s2, flex_direction).
0.90::true_val(flex_direction, true_twin); 0.10::true_val(flex_direction, unk_flex_dir).
measured(s2, flex_direction, true_twin).
all_consistent(flex_direction) :- consistent(s2, flex_direction).
evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, true_twin)).
query(true_val(flex_direction, unk_flex_dir)).

% @attr flex_feel_qualitative
% @type categorical
% @canonical false
% @original_name flex_feel (qualitative)
% @values playful_pressable=Playful_pressable_with_snap unk_flex_qual=Unknown
% @importance 0.75

0.75::acc(s32, flex_feel_qualitative).
0.72::acc(s33, flex_feel_qualitative).
0.92::true_val(flex_feel_qualitative, playful_pressable); 0.08::true_val(flex_feel_qualitative, unk_flex_qual).
measured(s32, flex_feel_qualitative, playful_pressable).
measured(s33, flex_feel_qualitative, playful_pressable).
all_consistent(flex_feel_qualitative) :- (indep(s32), consistent(s32, flex_feel_qualitative) ; \+indep(s32)), consistent(s33, flex_feel_qualitative).
evidence(all_consistent(flex_feel_qualitative)).
query(true_val(flex_feel_qualitative, playful_pressable)).
query(true_val(flex_feel_qualitative, unk_flex_qual)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values low_camber_3bt_sidekick=Low_Camber_3BT_SideKick unk_camber_type=Unknown
% @importance 1.0

0.93::acc(s2, camber_type).
0.82::acc(s1, camber_type).
0.96::true_val(camber_type, low_camber_3bt_sidekick); 0.04::true_val(camber_type, unk_camber_type).
measured(s2, camber_type, low_camber_3bt_sidekick).
measured(s1, camber_type, low_camber_3bt_sidekick).
all_consistent(camber_type) :- consistent(s2, camber_type), (indep(s1), consistent(s1, camber_type) ; \+indep(s1)).
evidence(all_consistent(camber_type)).
query(true_val(camber_type, low_camber_3bt_sidekick)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values low_camber_nose_to_tail=Low_positive_camber_nose_to_tail unk_camber_desc=Unknown
% @importance 1.0

0.92::acc(s2, camber_description).
0.90::true_val(camber_description, low_camber_nose_to_tail); 0.10::true_val(camber_description, unk_camber_desc).
measured(s2, camber_description, low_camber_nose_to_tail).
all_consistent(camber_description) :- consistent(s2, camber_description).
evidence(all_consistent(camber_description)).
query(true_val(camber_description, low_camber_nose_to_tail)).
query(true_val(camber_description, unk_camber_desc)).

% @attr nose_sidebase_uplift
% @type categorical
% @canonical false
% @original_name Nose sidebase uplift
% @values low=Low unk_nose_uplift=Unknown
% @importance 1.0

0.92::acc(s2, nose_sidebase_uplift).
0.90::true_val(nose_sidebase_uplift, low); 0.10::true_val(nose_sidebase_uplift, unk_nose_uplift).
measured(s2, nose_sidebase_uplift, low).
all_consistent(nose_sidebase_uplift) :- consistent(s2, nose_sidebase_uplift).
evidence(all_consistent(nose_sidebase_uplift)).
query(true_val(nose_sidebase_uplift, low)).
query(true_val(nose_sidebase_uplift, unk_nose_uplift)).

% @attr tail_sidebase_uplift
% @type categorical
% @canonical false
% @original_name Tail sidebase uplift
% @values low=Low unk_tail_uplift=Unknown
% @importance 1.0

0.92::acc(s2, tail_sidebase_uplift).
0.90::true_val(tail_sidebase_uplift, low); 0.10::true_val(tail_sidebase_uplift, unk_tail_uplift).
measured(s2, tail_sidebase_uplift, low).
all_consistent(tail_sidebase_uplift) :- consistent(s2, tail_sidebase_uplift).
evidence(all_consistent(tail_sidebase_uplift)).
query(true_val(tail_sidebase_uplift, low)).
query(true_val(tail_sidebase_uplift, unk_tail_uplift)).

% @attr camber_description_3bt_sidekick
% @type categorical
% @canonical false
% @original_name camber_description (3BT & SideKick)
% @values tbt_sidekick=3BT_and_SideKick unk_camber_3bt=Unknown
% @importance 1.0

0.93::acc(s2, camber_description_3bt_sidekick).
0.90::true_val(camber_description_3bt_sidekick, tbt_sidekick); 0.10::true_val(camber_description_3bt_sidekick, unk_camber_3bt).
measured(s2, camber_description_3bt_sidekick, tbt_sidekick).
all_consistent(camber_description_3bt_sidekick) :- consistent(s2, camber_description_3bt_sidekick).
evidence(all_consistent(camber_description_3bt_sidekick)).
query(true_val(camber_description_3bt_sidekick, tbt_sidekick)).
query(true_val(camber_description_3bt_sidekick, unk_camber_3bt)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values twin=True_twin_symmetric unk_shape=Unknown
% @importance 1.0

0.94::acc(s2, shape).
0.82::acc(s1, shape).
0.96::true_val(shape, twin); 0.04::true_val(shape, unk_shape).
measured(s2, shape, twin).
measured(s1, shape, twin).
all_consistent(shape) :- consistent(s2, shape), (indep(s1), consistent(s1, shape) ; \+indep(s1)).
evidence(all_consistent(shape)).
query(true_val(shape, twin)).
query(true_val(shape, unk_shape)).

% @attr camber_description_twin
% @type categorical
% @canonical false
% @original_name camber_description (centered stance true twin)
% @values centered_true_twin=Centered_stance_true_twin unk_camber_twin=Unknown
% @importance 1.0

0.92::acc(s2, camber_description_twin).
0.90::true_val(camber_description_twin, centered_true_twin); 0.10::true_val(camber_description_twin, unk_camber_twin).
measured(s2, camber_description_twin, centered_true_twin).
all_consistent(camber_description_twin) :- consistent(s2, camber_description_twin).
evidence(all_consistent(camber_description_twin)).
query(true_val(camber_description_twin, centered_true_twin)).
query(true_val(camber_description_twin, unk_camber_twin)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values six_sizes=148_151_154_157_153W_156W four_sizes=151_154_157_156W
% @importance 1.0

0.92::acc(s2, available_sizes).
0.80::acc(s1, available_sizes).
0.55::true_val(available_sizes, six_sizes); 0.45::true_val(available_sizes, four_sizes).
measured(s2, available_sizes, six_sizes).
measured(s1, available_sizes, four_sizes).
all_consistent(available_sizes) :- consistent(s2, available_sizes), consistent(s1, available_sizes).
evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, six_sizes)).
query(true_val(available_sizes, four_sizes)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide unk_width_opt=Unknown
% @importance 1.0

0.93::acc(s2, width_options).
0.82::acc(s1, width_options).
0.96::true_val(width_options, standard_and_wide); 0.04::true_val(width_options, unk_width_opt).
measured(s2, width_options, standard_and_wide).
measured(s1, width_options, standard_and_wide).
all_consistent(width_options) :- consistent(s2, width_options), (indep(s1), consistent(s1, width_options) ; \+indep(s1)).
evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_opt)).

% @attr effective_edge_148
% @type numeric
% @canonical false
% @original_name Effective edge 148cm
% @unit cm
% @values v111_7=111.7 unk_ee148=Unknown
% @importance 1.0

0.93::acc(s2, effective_edge_148).
0.90::true_val(effective_edge_148, v111_7); 0.10::true_val(effective_edge_148, unk_ee148).
measured(s2, effective_edge_148, v111_7).
all_consistent(effective_edge_148) :- consistent(s2, effective_edge_148).
evidence(all_consistent(effective_edge_148)).
query(true_val(effective_edge_148, v111_7)).
query(true_val(effective_edge_148, unk_ee148)).

% @attr effective_edge_151
% @type numeric
% @canonical false
% @original_name Effective edge 151cm
% @unit cm
% @values v114_4=114.4 v113_9=113.9
% @importance 1.0

0.88::acc(s2, effective_edge_151).
0.85::acc(s1, effective_edge_151).
0.45::true_val(effective_edge_151, v114_4); 0.55::true_val(effective_edge_151, v113_9).
measured(s2, effective_edge_151, v114_4).
measured(s1, effective_edge_151, v113_9).
all_consistent(effective_edge_151) :- consistent(s2, effective_edge_151), consistent(s1, effective_edge_151).
evidence(all_consistent(effective_edge_151)).
query(true_val(effective_edge_151, v114_4)).
query(true_val(effective_edge_151, v113_9)).

% @attr effective_edge_154
% @type numeric
% @canonical false
% @original_name Effective edge 154cm
% @unit cm
% @values v117_1=117.1 v116_5=116.5
% @importance 1.0

0.88::acc(s2, effective_edge_154).
0.85::acc(s1, effective_edge_154).
0.45::true_val(effective_edge_154, v117_1); 0.55::true_val(effective_edge_154, v116_5).
measured(s2, effective_edge_154, v117_1).
measured(s1, effective_edge_154, v116_5).
all_consistent(effective_edge_154) :- consistent(s2, effective_edge_154), consistent(s1, effective_edge_154).
evidence(all_consistent(effective_edge_154)).
query(true_val(effective_edge_154, v117_1)).
query(true_val(effective_edge_154, v116_5)).

% @attr effective_edge_157
% @type numeric
% @canonical false
% @original_name Effective edge 157cm
% @unit cm
% @values v119_8=119.8 v119_1=119.1
% @importance 1.0

0.88::acc(s2, effective_edge_157).
0.85::acc(s1, effective_edge_157).
0.45::true_val(effective_edge_157, v119_8); 0.55::true_val(effective_edge_157, v119_1).
measured(s2, effective_edge_157, v119_8).
measured(s1, effective_edge_157, v119_1).
all_consistent(effective_edge_157) :- consistent(s2, effective_edge_157), consistent(s1, effective_edge_157).
evidence(all_consistent(effective_edge_157)).
query(true_val(effective_edge_157, v119_8)).
query(true_val(effective_edge_157, v119_1)).

% @attr effective_edge_153w
% @type numeric
% @canonical false
% @original_name Effective edge 153W
% @unit cm
% @values v116_2=116.2 unk_ee153w=Unknown
% @importance 1.0

0.93::acc(s2, effective_edge_153w).
0.90::true_val(effective_edge_153w, v116_2); 0.10::true_val(effective_edge_153w, unk_ee153w).
measured(s2, effective_edge_153w, v116_2).
all_consistent(effective_edge_153w) :- consistent(s2, effective_edge_153w).
evidence(all_consistent(effective_edge_153w)).
query(true_val(effective_edge_153w, v116_2)).
query(true_val(effective_edge_153w, unk_ee153w)).

% @attr effective_edge_156w
% @type numeric
% @canonical false
% @original_name Effective edge 156W
% @unit cm
% @values v118_9=118.9 v118_6=118.6
% @importance 1.0

0.88::acc(s2, effective_edge_156w).
0.85::acc(s1, effective_edge_156w).
0.45::true_val(effective_edge_156w, v118_9); 0.55::true_val(effective_edge_156w, v118_6).
measured(s2, effective_edge_156w, v118_9).
measured(s1, effective_edge_156w, v118_6).
all_consistent(effective_edge_156w) :- consistent(s2, effective_edge_156w), consistent(s1, effective_edge_156w).
evidence(all_consistent(effective_edge_156w)).
query(true_val(effective_edge_156w, v118_9)).
query(true_val(effective_edge_156w, v118_6)).

% @attr waist_width_148
% @type numeric
% @canonical false
% @original_name Waist width 148cm
% @unit cm
% @values v24_4=24.4 unk_ww148=Unknown
% @importance 1.0

0.93::acc(s2, waist_width_148).
0.90::true_val(waist_width_148, v24_4); 0.10::true_val(waist_width_148, unk_ww148).
measured(s2, waist_width_148, v24_4).
all_consistent(waist_width_148) :- consistent(s2, waist_width_148).
evidence(all_consistent(waist_width_148)).
query(true_val(waist_width_148, v24_4)).
query(true_val(waist_width_148, unk_ww148)).

% @attr waist_width_151
% @type numeric
% @canonical false
% @original_name Waist width 151cm
% @unit cm
% @values v24_7=24.7 v24_8=24.8
% @importance 1.0

0.88::acc(s2, waist_width_151).
0.85::acc(s1, waist_width_151).
0.45::true_val(waist_width_151, v24_7); 0.55::true_val(waist_width_151, v24_8).
measured(s2, waist_width_151, v24_7).
measured(s1, waist_width_151, v24_8).
all_consistent(waist_width_151) :- consistent(s2, waist_width_151), consistent(s1, waist_width_151).
evidence(all_consistent(waist_width_151)).
query(true_val(waist_width_151, v24_7)).
query(true_val(waist_width_151, v24_8)).

% @attr waist_width_154
% @type numeric
% @canonical false
% @original_name Waist width 154cm
% @unit cm
% @values v25_0=25.0 unk_ww154=Unknown
% @importance 1.0

0.93::acc(s2, waist_width_154).
0.85::acc(s1, waist_width_154).
0.96::true_val(waist_width_154, v25_0); 0.04::true_val(waist_width_154, unk_ww154).
measured(s2, waist_width_154, v25_0).
measured(s1, waist_width_154, v25_0).
all_consistent(waist_width_154) :- consistent(s2, waist_width_154), consistent(s1, waist_width_154).
evidence(all_consistent(waist_width_154)).
query(true_val(waist_width_154, v25_0)).
query(true_val(waist_width_154, unk_ww154)).

% @attr waist_width_157
% @type numeric
% @canonical false
% @original_name Waist width 157cm
% @unit cm
% @values v25_3=25.3 v25_2=25.2
% @importance 1.0

0.88::acc(s2, waist_width_157).
0.85::acc(s1, waist_width_157).
0.45::true_val(waist_width_157, v25_3); 0.55::true_val(waist_width_157, v25_2).
measured(s2, waist_width_157, v25_3).
measured(s1, waist_width_157, v25_2).
all_consistent(waist_width_157) :- consistent(s2, waist_width_157), consistent(s1, waist_width_157).
evidence(all_consistent(waist_width_157)).
query(true_val(waist_width_157, v25_3)).
query(true_val(waist_width_157, v25_2)).

% @attr waist_width_153w
% @type numeric
% @canonical false
% @original_name Waist width 153W
% @unit cm
% @values v25_9=25.9 unk_ww153w=Unknown
% @importance 1.0

0.93::acc(s2, waist_width_153w).
0.90::true_val(waist_width_153w, v25_9); 0.10::true_val(waist_width_153w, unk_ww153w).
measured(s2, waist_width_153w, v25_9).
all_consistent(waist_width_153w) :- consistent(s2, waist_width_153w).
evidence(all_consistent(waist_width_153w)).
query(true_val(waist_width_153w, v25_9)).
query(true_val(waist_width_153w, unk_ww153w)).

% @attr waist_width_156w
% @type numeric
% @canonical false
% @original_name Waist width 156W
% @unit cm
% @values v26_2=26.2 v26_8=26.8
% @importance 1.0

0.88::acc(s2, waist_width_156w).
0.85::acc(s1, waist_width_156w).
0.40::true_val(waist_width_156w, v26_2); 0.60::true_val(waist_width_156w, v26_8).
measured(s2, waist_width_156w, v26_2).
measured(s1, waist_width_156w, v26_8).
all_consistent(waist_width_156w) :- consistent(s2, waist_width_156w), consistent(s1, waist_width_156w).
evidence(all_consistent(waist_width_156w)).
query(true_val(waist_width_156w, v26_2)).
query(true_val(waist_width_156w, v26_8)).

% @attr tip_tail_width_size_148
% @type numeric
% @canonical false
% @original_name tip_tail_width_size 148cm
% @unit cm
% @values v28_7=28.7 unk_ttw148=Unknown
% @importance 1.0

0.93::acc(s2, tip_tail_width_size_148).
0.90::true_val(tip_tail_width_size_148, v28_7); 0.10::true_val(tip_tail_width_size_148, unk_ttw148).
measured(s2, tip_tail_width_size_148, v28_7).
all_consistent(tip_tail_width_size_148) :- consistent(s2, tip_tail_width_size_148).
evidence(all_consistent(tip_tail_width_size_148)).
query(true_val(tip_tail_width_size_148, v28_7)).
query(true_val(tip_tail_width_size_148, unk_ttw148)).

% @attr tip_tail_width_size_151
% @type numeric
% @canonical false
% @original_name tip_tail_width_size 151cm
% @unit cm
% @values v29_1=29.1 v28_7=28.7
% @importance 1.0

0.88::acc(s2, tip_tail_width_size_151).
0.85::acc(s1, tip_tail_width_size_151).
0.45::true_val(tip_tail_width_size_151, v29_1); 0.55::true_val(tip_tail_width_size_151, v28_7).
measured(s2, tip_tail_width_size_151, v29_1).
measured(s1, tip_tail_width_size_151, v28_7).
all_consistent(tip_tail_width_size_151) :- consistent(s2, tip_tail_width_size_151), consistent(s1, tip_tail_width_size_151).
evidence(all_consistent(tip_tail_width_size_151)).
query(true_val(tip_tail_width_size_151, v29_1)).
query(true_val(tip_tail_width_size_151, v28_7)).

% @attr tip_tail_width_size_154
% @type numeric
% @canonical false
% @original_name tip_tail_width_size 154cm
% @unit cm
% @values v29_5=29.5 v29_0=29.0
% @importance 1.0

0.88::acc(s2, tip_tail_width_size_154).
0.85::acc(s1, tip_tail_width_size_154).
0.45::true_val(tip_tail_width_size_154, v29_5); 0.55::true_val(tip_tail_width_size_154, v29_0).
measured(s2, tip_tail_width_size_154, v29_5).
measured(s1, tip_tail_width_size_154, v29_0).
all_consistent(tip_tail_width_size_154) :- consistent(s2, tip_tail_width_size_154), consistent(s1, tip_tail_width_size_154).
evidence(all_consistent(tip_tail_width_size_154)).
query(true_val(tip_tail_width_size_154, v29_5)).
query(true_val(tip_tail_width_size_154, v29_0)).

% @attr tip_tail_width_size_157
% @type numeric
% @canonical false
% @original_name tip_tail_width_size 157cm
% @unit cm
% @values v29_9=29.9 v29_3=29.3
% @importance 1.0

0.88::acc(s2, tip_tail_width_size_157).
0.85::acc(s1, tip_tail_width_size_157).
0.45::true_val(tip_tail_width_size_157, v29_9); 0.55::true_val(tip_tail_width_size_157, v29_3).
measured(s2, tip_tail_width_size_157, v29_9).
measured(s1, tip_tail_width_size_157, v29_3).
all_consistent(tip_tail_width_size_157) :- consistent(s2, tip_tail_width_size_157), consistent(s1, tip_tail_width_size_157).
evidence(all_consistent(tip_tail_width_size_157)).
query(true_val(tip_tail_width_size_157, v29_9)).
query(true_val(tip_tail_width_size_157, v29_3)).

% @attr tip_tail_width_size
% @type numeric
% @canonical true
% @original_name tip_tail_width_size 156W
% @unit cm
% @values v30_8=30.8 v30_9=30.9
% @importance 1.0

0.88::acc(s2, tip_tail_width_size).
0.85::acc(s1, tip_tail_width_size).
0.45::true_val(tip_tail_width_size, v30_8); 0.55::true_val(tip_tail_width_size, v30_9).
measured(s2, tip_tail_width_size, v30_8).
measured(s1, tip_tail_width_size, v30_9).
all_consistent(tip_tail_width_size) :- consistent(s2, tip_tail_width_size), consistent(s1, tip_tail_width_size).
evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v30_8)).
query(true_val(tip_tail_width_size, v30_9)).

% @attr sidecut_radius_size_151
% @type numeric
% @canonical false
% @original_name sidecut_radius_size 151cm
% @unit m
% @values v7_6=7.6 v8_16=8.16
% @importance 1.0

0.85::acc(s1, sidecut_radius_size_151).
0.88::acc(s2, sidecut_radius_size_151).
0.55::true_val(sidecut_radius_size_151, v7_6); 0.45::true_val(sidecut_radius_size_151, v8_16).
measured(s1, sidecut_radius_size_151, v7_6).
measured(s2, sidecut_radius_size_151, v8_16).
all_consistent(sidecut_radius_size_151) :- consistent(s1, sidecut_radius_size_151), consistent(s2, sidecut_radius_size_151).
evidence(all_consistent(sidecut_radius_size_151)).
query(true_val(sidecut_radius_size_151, v7_6)).
query(true_val(sidecut_radius_size_151, v8_16)).

% @attr sidecut_radius_size_154
% @type numeric
% @canonical false
% @original_name sidecut_radius_size 154cm
% @unit m
% @values v7_7=7.7 unk_sr154=Unknown
% @importance 1.0

0.82::acc(s1, sidecut_radius_size_154).
0.71::true_val(sidecut_radius_size_154, v7_7); 0.29::true_val(sidecut_radius_size_154, unk_sr154).
measured(s1, sidecut_radius_size_154, v7_7).
all_consistent(sidecut_radius_size_154) :- consistent(s1, sidecut_radius_size_154).
evidence(all_consistent(sidecut_radius_size_154)).
query(true_val(sidecut_radius_size_154, v7_7)).
query(true_val(sidecut_radius_size_154, unk_sr154)).

% @attr sidecut_radius_size_157
% @type numeric
% @canonical false
% @original_name sidecut_radius_size 157cm
% @unit m
% @values v7_8=7.8 unk_sr157=Unknown
% @importance 1.0

0.82::acc(s1, sidecut_radius_size_157).
0.71::true_val(sidecut_radius_size_157, v7_8); 0.29::true_val(sidecut_radius_size_157, unk_sr157).
measured(s1, sidecut_radius_size_157, v7_8).
all_consistent(sidecut_radius_size_157) :- consistent(s1, sidecut_radius_size_157).
evidence(all_consistent(sidecut_radius_size_157)).
query(true_val(sidecut_radius_size_157, v7_8)).
query(true_val(sidecut_radius_size_157, unk_sr157)).

% @attr sidecut_radius_size
% @type numeric
% @canonical true
% @original_name sidecut_radius_size 156W
% @unit m
% @values v7_8=7.8 unk_sr156w=Unknown
% @importance 1.0

0.82::acc(s1, sidecut_radius_size).
0.71::true_val(sidecut_radius_size, v7_8); 0.29::true_val(sidecut_radius_size, unk_sr156w).
measured(s1, sidecut_radius_size, v7_8).
all_consistent(sidecut_radius_size) :- consistent(s1, sidecut_radius_size).
evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_8)).
query(true_val(sidecut_radius_size, unk_sr156w)).

% @attr sidecut_radius_size_148
% @type numeric
% @canonical false
% @original_name sidecut_radius_size 148cm
% @unit m
% @values v7_98=7.98 unk_sr148=Unknown
% @importance 1.0

0.90::acc(s2, sidecut_radius_size_148).
0.90::true_val(sidecut_radius_size_148, v7_98); 0.10::true_val(sidecut_radius_size_148, unk_sr148).
measured(s2, sidecut_radius_size_148, v7_98).
all_consistent(sidecut_radius_size_148) :- consistent(s2, sidecut_radius_size_148).
evidence(all_consistent(sidecut_radius_size_148)).
query(true_val(sidecut_radius_size_148, v7_98)).
query(true_val(sidecut_radius_size_148, unk_sr148)).

% @attr stance_width_range_size_151
% @type categorical
% @canonical false
% @original_name stance_width_range_size 148/151cm
% @unit cm
% @values r47_5_59_5=47.5-59.5cm unk_sw151=Unknown
% @importance 1.0

0.93::acc(s2, stance_width_range_size_151).
0.82::acc(s1, stance_width_range_size_151).
0.96::true_val(stance_width_range_size_151, r47_5_59_5); 0.04::true_val(stance_width_range_size_151, unk_sw151).
measured(s2, stance_width_range_size_151, r47_5_59_5).
measured(s1, stance_width_range_size_151, r47_5_59_5).
all_consistent(stance_width_range_size_151) :- consistent(s2, stance_width_range_size_151), (indep(s1), consistent(s1, stance_width_range_size_151) ; \+indep(s1)).
evidence(all_consistent(stance_width_range_size_151)).
query(true_val(stance_width_range_size_151, r47_5_59_5)).
query(true_val(stance_width_range_size_151, unk_sw151)).

% @attr stance_width_range_size_154
% @type categorical
% @canonical false
% @original_name stance_width_range_size 154cm
% @unit cm
% @values r49_0_61_0=49.0-61.0cm unk_sw154=Unknown
% @importance 1.0

0.93::acc(s2, stance_width_range_size_154).
0.82::acc(s1, stance_width_range_size_154).
0.96::true_val(stance_width_range_size_154, r49_0_61_0); 0.04::true_val(stance_width_range_size_154, unk_sw154).
measured(s2, stance_width_range_size_154, r49_0_61_0).
measured(s1, stance_width_range_size_154, r49_0_61_0).
all_consistent(stance_width_range_size_154) :- consistent(s2, stance_width_range_size_154), (indep(s1), consistent(s1, stance_width_range_size_154) ; \+indep(s1)).
evidence(all_consistent(stance_width_range_size_154)).
query(true_val(stance_width_range_size_154, r49_0_61_0)).
query(true_val(stance_width_range_size_154, unk_sw154)).

% @attr stance_width_range_size_157
% @type categorical
% @canonical false
% @original_name stance_width_range_size 157cm
% @unit cm
% @values r51_0_63_0=51.0-63.0cm unk_sw157=Unknown
% @importance 1.0

0.93::acc(s2, stance_width_range_size_157).
0.82::acc(s1, stance_width_range_size_157).
0.96::true_val(stance_width_range_size_157, r51_0_63_0); 0.04::true_val(stance_width_range_size_157, unk_sw157).
measured(s2, stance_width_range_size_157, r51_0_63_0).
measured(s1, stance_width_range_size_157, r51_0_63_0).
all_consistent(stance_width_range_size_157) :- consistent(s2, stance_width_range_size_157), (indep(s1), consistent(s1, stance_width_range_size_157) ; \+indep(s1)).
evidence(all_consistent(stance_width_range_size_157)).
query(true_val(stance_width_range_size_157, r51_0_63_0)).
query(true_val(stance_width_range_size_157, unk_sw157)).

% @attr stance_width_range_size
% @type categorical
% @canonical true
% @original_name stance_width_range_size 156W
% @unit cm
% @values r51_0_63_0=51.0-63.0cm unk_sw156w=Unknown
% @importance 1.0

0.93::acc(s2, stance_width_range_size).
0.82::acc(s1, stance_width_range_size).
0.96::true_val(stance_width_range_size, r51_0_63_0); 0.04::true_val(stance_width_range_size, unk_sw156w).
measured(s2, stance_width_range_size, r51_0_63_0).
measured(s1, stance_width_range_size, r51_0_63_0).
all_consistent(stance_width_range_size) :- consistent(s2, stance_width_range_size), (indep(s1), consistent(s1, stance_width_range_size) ; \+indep(s1)).
evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, r51_0_63_0)).
query(true_val(stance_width_range_size, unk_sw156w)).

% @attr mounting_pattern
% @type categorical
% @canonical false
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mount=Unknown
% @importance 1.0

0.82::acc(s1, mounting_pattern).
0.71::true_val(mounting_pattern, inserts_2x4); 0.29::true_val(mounting_pattern, unk_mount).
measured(s1, mounting_pattern, inserts_2x4).
all_consistent(mounting_pattern) :- consistent(s1, mounting_pattern).
evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mount)).

% @attr insert_count
% @type numeric
% @canonical false
% @original_name Insert count
% @values v24=24 unk_inserts=Unknown
% @importance 1.0

0.93::acc(s2, insert_count).
0.90::true_val(insert_count, v24); 0.10::true_val(insert_count, unk_inserts).
measured(s2, insert_count, v24).
all_consistent(insert_count) :- consistent(s2, insert_count).
evidence(all_consistent(insert_count)).
query(true_val(insert_count, v24)).
query(true_val(insert_count, unk_inserts)).

% @attr insert_material
% @type categorical
% @canonical false
% @original_name Insert material
% @values a_grade_german_stainless=A_grade_German_stainless_steel unk_insert_mat=Unknown
% @importance 1.0

0.93::acc(s2, insert_material).
0.90::true_val(insert_material, a_grade_german_stainless); 0.10::true_val(insert_material, unk_insert_mat).
measured(s2, insert_material, a_grade_german_stainless).
all_consistent(insert_material) :- consistent(s2, insert_material).
evidence(all_consistent(insert_material)).
query(true_val(insert_material, a_grade_german_stainless)).
query(true_val(insert_material, unk_insert_mat)).

% @attr recommended_weight_range_size_148
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size 148cm
% @unit kg
% @values r54_74=54-74kg unk_rw148=Unknown
% @importance 1.0

0.93::acc(s2, recommended_weight_range_size_148).
0.90::true_val(recommended_weight_range_size_148, r54_74); 0.10::true_val(recommended_weight_range_size_148, unk_rw148).
measured(s2, recommended_weight_range_size_148, r54_74).
all_consistent(recommended_weight_range_size_148) :- consistent(s2, recommended_weight_range_size_148).
evidence(all_consistent(recommended_weight_range_size_148)).
query(true_val(recommended_weight_range_size_148, r54_74)).
query(true_val(recommended_weight_range_size_148, unk_rw148)).

% @attr recommended_weight_range_size_151
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size 151cm
% @unit kg
% @values r61_81=61-81kg unk_rw151=Unknown
% @importance 1.0

0.93::acc(s2, recommended_weight_range_size_151).
0.82::acc(s1, recommended_weight_range_size_151).
0.96::true_val(recommended_weight_range_size_151, r61_81); 0.04::true_val(recommended_weight_range_size_151, unk_rw151).
measured(s2, recommended_weight_range_size_151, r61_81).
measured(s1, recommended_weight_range_size_151, r61_81).
all_consistent(recommended_weight_range_size_151) :- consistent(s2, recommended_weight_range_size_151), (indep(s1), consistent(s1, recommended_weight_range_size_151) ; \+indep(s1)).
evidence(all_consistent(recommended_weight_range_size_151)).
query(true_val(recommended_weight_range_size_151, r61_81)).
query(true_val(recommended_weight_range_size_151, unk_rw151)).

% @attr recommended_weight_range_size_154
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size 154cm
% @unit kg
% @values r66_86=66-86kg unk_rw154=Unknown
% @importance 1.0

0.93::acc(s2, recommended_weight_range_size_154).
0.82::acc(s1, recommended_weight_range_size_154).
0.96::true_val(recommended_weight_range_size_154, r66_86); 0.04::true_val(recommended_weight_range_size_154, unk_rw154).
measured(s2, recommended_weight_range_size_154, r66_86).
measured(s1, recommended_weight_range_size_154, r66_86).
all_consistent(recommended_weight_range_size_154) :- consistent(s2, recommended_weight_range_size_154), (indep(s1), consistent(s1, recommended_weight_range_size_154) ; \+indep(s1)).
evidence(all_consistent(recommended_weight_range_size_154)).
query(true_val(recommended_weight_range_size_154, r66_86)).
query(true_val(recommended_weight_range_size_154, unk_rw154)).

% @attr recommended_weight_range_size_157
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size 157cm
% @unit kg
% @values r72_92=72-92kg unk_rw157=Unknown
% @importance 1.0

0.93::acc(s2, recommended_weight_range_size_157).
0.82::acc(s1, recommended_weight_range_size_157).
0.96::true_val(recommended_weight_range_size_157, r72_92); 0.04::true_val(recommended_weight_range_size_157, unk_rw157).
measured(s2, recommended_weight_range_size_157, r72_92).
measured(s1, recommended_weight_range_size_157, r72_92).
all_consistent(recommended_weight_range_size_157) :- consistent(s2, recommended_weight_range_size_157), (indep(s1), consistent(s1, recommended_weight_range_size_157) ; \+indep(s1)).
evidence(all_consistent(recommended_weight_range_size_157)).
query(true_val(recommended_weight_range_size_157, r72_92)).
query(true_val(recommended_weight_range_size_157, unk_rw157)).

% @attr recommended_weight_range_size_153w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size 153W
% @unit kg
% @values r64_84=64-84kg unk_rw153w=Unknown
% @importance 1.0

0.93::acc(s2, recommended_weight_range_size_153w).
0.90::true_val(recommended_weight_range_size_153w, r64_84); 0.10::true_val(recommended_weight_range_size_153w, unk_rw153w).
measured(s2, recommended_weight_range_size_153w, r64_84).
all_consistent(recommended_weight_range_size_153w) :- consistent(s2, recommended_weight_range_size_153w).
evidence(all_consistent(recommended_weight_range_size_153w)).
query(true_val(recommended_weight_range_size_153w, r64_84)).
query(true_val(recommended_weight_range_size_153w, unk_rw153w)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size 156W
% @unit kg
% @values r70_90=70-90kg unk_rw156w=Unknown
% @importance 1.0

0.93::acc(s2, recommended_weight_range_size).
0.82::acc(s1, recommended_weight_range_size).
0.96::true_val(recommended_weight_range_size, r70_90); 0.04::true_val(recommended_weight_range_size, unk_rw156w).
measured(s2, recommended_weight_range_size, r70_90).
measured(s1, recommended_weight_range_size, r70_90).
all_consistent(recommended_weight_range_size) :- consistent(s2, recommended_weight_range_size), (indep(s1), consistent(s1, recommended_weight_range_size) ; \+indep(s1)).
evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, r70_90)).
query(true_val(recommended_weight_range_size, unk_rw156w)).

% @attr boot_size_148
% @type categorical
% @canonical false
% @original_name Boot size 148cm
% @values eu36_41=EU36-41_US4-8 unk_bs148=Unknown
% @importance 1.0

0.93::acc(s2, boot_size_148).
0.90::true_val(boot_size_148, eu36_41); 0.10::true_val(boot_size_148, unk_bs148).
measured(s2, boot_size_148, eu36_41).
all_consistent(boot_size_148) :- consistent(s2, boot_size_148).
evidence(all_consistent(boot_size_148)).
query(true_val(boot_size_148, eu36_41)).
query(true_val(boot_size_148, unk_bs148)).

% @attr boot_size_151
% @type categorical
% @canonical false
% @original_name Boot size 151cm
% @values eu38_42=EU38-42_US5-9 unk_bs151=Unknown
% @importance 1.0

0.93::acc(s2, boot_size_151).
0.90::true_val(boot_size_151, eu38_42); 0.10::true_val(boot_size_151, unk_bs151).
measured(s2, boot_size_151, eu38_42).
all_consistent(boot_size_151) :- consistent(s2, boot_size_151).
evidence(all_consistent(boot_size_151)).
query(true_val(boot_size_151, eu38_42)).
query(true_val(boot_size_151, unk_bs151)).

% @attr boot_size_154
% @type categorical
% @canonical false
% @original_name Boot size 154cm
% @values eu39_44=EU39-44_US7-10 unk_bs154=Unknown
% @importance 1.0

0.93::acc(s2, boot_size_154).
0.90::true_val(boot_size_154, eu39_44); 0.10::true_val(boot_size_154, unk_bs154).
measured(s2, boot_size_154, eu39_44).
all_consistent(boot_size_154) :- consistent(s2, boot_size_154).
evidence(all_consistent(boot_size_154)).
query(true_val(boot_size_154, eu39_44)).
query(true_val(boot_size_154, unk_bs154)).

% @attr boot_size_157
% @type categorical
% @canonical false
% @original_name Boot size 157cm
% @values eu39_44=EU39-44_US7-10 unk_bs157=Unknown
% @importance 1.0

0.93::acc(s2, boot_size_157).
0.90::true_val(boot_size_157, eu39_44); 0.10::true_val(boot_size_157, unk_bs157).
measured(s2, boot_size_157, eu39_44).
all_consistent(boot_size_157) :- consistent(s2, boot_size_157).
evidence(all_consistent(boot_size_157)).
query(true_val(boot_size_157, eu39_44)).
query(true_val(boot_size_157, unk_bs157)).

% @attr boot_size_153w
% @type categorical
% @canonical false
% @original_name Boot size 153W
% @values eu42_46=EU42-46_US8-12 unk_bs153w=Unknown
% @importance 1.0

0.93::acc(s2, boot_size_153w).
0.90::true_val(boot_size_153w, eu42_46); 0.10::true_val(boot_size_153w, unk_bs153w).
measured(s2, boot_size_153w, eu42_46).
all_consistent(boot_size_153w) :- consistent(s2, boot_size_153w).
evidence(all_consistent(boot_size_153w)).
query(true_val(boot_size_153w, eu42_46)).
query(true_val(boot_size_153w, unk_bs153w)).

% @attr boot_size_156w
% @type categorical
% @canonical false
% @original_name Boot size 156W
% @values eu42_47=EU42-47_US9-12 unk_bs156w=Unknown
% @importance 1.0

0.93::acc(s2, boot_size_156w).
0.90::true_val(boot_size_156w, eu42_47); 0.10::true_val(boot_size_156w, unk_bs156w).
measured(s2, boot_size_156w, eu42_47).
all_consistent(boot_size_156w) :- consistent(s2, boot_size_156w).
evidence(all_consistent(boot_size_156w)).
query(true_val(boot_size_156w, eu42_47)).
query(true_val(boot_size_156w, unk_bs156w)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values light_core_paulownia_poplar=Light_Core_50_50_Paulownia_Poplar unk_core=Unknown
% @importance 1.0

0.94::acc(s2, core_material).
0.82::acc(s1, core_material).
0.96::true_val(core_material, light_core_paulownia_poplar); 0.04::true_val(core_material, unk_core).
measured(s2, core_material, light_core_paulownia_poplar).
measured(s1, core_material, light_core_paulownia_poplar).
all_consistent(core_material) :- consistent(s2, core_material), (indep(s1), consistent(s1, core_material) ; \+indep(s1)).
evidence(all_consistent(core_material)).
query(true_val(core_material, light_core_paulownia_poplar)).
query(true_val(core_material, unk_core)).

% @attr comparable_board_same_brand_core_diff
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (core difference)
% @values standard_full_poplar=Standard_uses_full_Poplar_Plus_gets_Light_Core unk_core_diff=Unknown
% @importance 0.725

0.75::acc(s26, comparable_board_same_brand_core_diff).
0.72::acc(s34, comparable_board_same_brand_core_diff).
0.93::true_val(comparable_board_same_brand_core_diff, standard_full_poplar); 0.07::true_val(comparable_board_same_brand_core_diff, unk_core_diff).
measured(s26, comparable_board_same_brand_core_diff, standard_full_poplar).
measured(s34, comparable_board_same_brand_core_diff, standard_full_poplar).
all_consistent(comparable_board_same_brand_core_diff) :- consistent(s26, comparable_board_same_brand_core_diff), consistent(s34, comparable_board_same_brand_core_diff).
evidence(all_consistent(comparable_board_same_brand_core_diff)).
query(true_val(comparable_board_same_brand_core_diff, standard_full_poplar)).
query(true_val(comparable_board_same_brand_core_diff, unk_core_diff)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values biax=Biaxial unk_laminate=Unknown
% @importance 1.0

0.94::acc(s2, laminate).
0.82::acc(s1, laminate).
0.96::true_val(laminate, biax); 0.04::true_val(laminate, unk_laminate).
measured(s2, laminate, biax).
measured(s1, laminate, biax).
all_consistent(laminate) :- consistent(s2, laminate), (indep(s1), consistent(s1, laminate) ; \+indep(s1)).
evidence(all_consistent(laminate)).
query(true_val(laminate, biax)).
query(true_val(laminate, unk_laminate)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation (carbon stringers)
% @values carbon_stringers=Carbon_stringers_fine_tune_flex unk_cmi=Unknown
% @importance 1.0

0.94::acc(s2, construction_material_innovation).
0.82::acc(s1, construction_material_innovation).
0.96::true_val(construction_material_innovation, carbon_stringers); 0.04::true_val(construction_material_innovation, unk_cmi).
measured(s2, construction_material_innovation, carbon_stringers).
measured(s1, construction_material_innovation, carbon_stringers).
all_consistent(construction_material_innovation) :- consistent(s2, construction_material_innovation), (indep(s1), consistent(s1, construction_material_innovation) ; \+indep(s1)).
evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, carbon_stringers)).
query(true_val(construction_material_innovation, unk_cmi)).

% @attr construction_material_innovation_cst
% @type categorical
% @canonical false
% @original_name construction_material_innovation (CST SuperTubes)
% @values cst_supertubes=CST_SuperTubes_hollow_carbon_center unk_cst=Unknown
% @importance 1.0

0.94::acc(s2, construction_material_innovation_cst).
0.82::acc(s1, construction_material_innovation_cst).
0.96::true_val(construction_material_innovation_cst, cst_supertubes); 0.04::true_val(construction_material_innovation_cst, unk_cst).
measured(s2, construction_material_innovation_cst, cst_supertubes).
measured(s1, construction_material_innovation_cst, cst_supertubes).
all_consistent(construction_material_innovation_cst) :- consistent(s2, construction_material_innovation_cst), (indep(s1), consistent(s1, construction_material_innovation_cst) ; \+indep(s1)).
evidence(all_consistent(construction_material_innovation_cst)).
query(true_val(construction_material_innovation_cst, cst_supertubes)).
query(true_val(construction_material_innovation_cst, unk_cst)).

% @attr construction_material_innovation_cst_function
% @type categorical
% @canonical false
% @original_name construction_material_innovation (CST function)
% @values pop_no_stiffness_lighter=Pop_without_stiffening_torsionally_reduces_weight unk_cst_func=Unknown
% @importance 0.85

0.90::acc(s2, construction_material_innovation_cst_function).
0.75::acc(s35, construction_material_innovation_cst_function).
0.93::true_val(construction_material_innovation_cst_function, pop_no_stiffness_lighter); 0.07::true_val(construction_material_innovation_cst_function, unk_cst_func).
measured(s2, construction_material_innovation_cst_function, pop_no_stiffness_lighter).
measured(s35, construction_material_innovation_cst_function, pop_no_stiffness_lighter).
all_consistent(construction_material_innovation_cst_function) :- consistent(s2, construction_material_innovation_cst_function), (indep(s35), consistent(s35, construction_material_innovation_cst_function) ; \+indep(s35)).
evidence(all_consistent(construction_material_innovation_cst_function)).
query(true_val(construction_material_innovation_cst_function, pop_no_stiffness_lighter)).
query(true_val(construction_material_innovation_cst_function, unk_cst_func)).

% @attr construction_material_innovation_aramid
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Aramid X-Ply)
% @values aramid_x_ply=Aramid_X_Ply_Kevlar_diamond_weave unk_aramid=Unknown
% @importance 1.0

0.94::acc(s2, construction_material_innovation_aramid).
0.82::acc(s1, construction_material_innovation_aramid).
0.96::true_val(construction_material_innovation_aramid, aramid_x_ply); 0.04::true_val(construction_material_innovation_aramid, unk_aramid).
measured(s2, construction_material_innovation_aramid, aramid_x_ply).
measured(s1, construction_material_innovation_aramid, aramid_x_ply).
all_consistent(construction_material_innovation_aramid) :- consistent(s2, construction_material_innovation_aramid), (indep(s1), consistent(s1, construction_material_innovation_aramid) ; \+indep(s1)).
evidence(all_consistent(construction_material_innovation_aramid)).
query(true_val(construction_material_innovation_aramid, aramid_x_ply)).
query(true_val(construction_material_innovation_aramid, unk_aramid)).

% @attr construction_material_innovation_aramid_function
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Aramid function)
% @values torsional_stability_damping=Full_perimeter_3D_torsional_stability_damping unk_aramid_func=Unknown
% @importance 1.0

0.92::acc(s2, construction_material_innovation_aramid_function).
0.90::true_val(construction_material_innovation_aramid_function, torsional_stability_damping); 0.10::true_val(construction_material_innovation_aramid_function, unk_aramid_func).
measured(s2, construction_material_innovation_aramid_function, torsional_stability_damping).
all_consistent(construction_material_innovation_aramid_function) :- consistent(s2, construction_material_innovation_aramid_function).
evidence(all_consistent(construction_material_innovation_aramid_function)).
query(true_val(construction_material_innovation_aramid_function, torsional_stability_damping)).
query(true_val(construction_material_innovation_aramid_function, unk_aramid_func)).

% @attr construction_material_innovation_exclusive
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Plus Series exclusive)
% @values plus_series_only=Exclusively_Plus_Series unk_exclusive=Unknown
% @importance 1.0

0.92::acc(s2, construction_material_innovation_exclusive).
0.90::true_val(construction_material_innovation_exclusive, plus_series_only); 0.10::true_val(construction_material_innovation_exclusive, unk_exclusive).
measured(s2, construction_material_innovation_exclusive, plus_series_only).
all_consistent(construction_material_innovation_exclusive) :- consistent(s2, construction_material_innovation_exclusive).
evidence(all_consistent(construction_material_innovation_exclusive)).
query(true_val(construction_material_innovation_exclusive, plus_series_only)).
query(true_val(construction_material_innovation_exclusive, unk_exclusive)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values flex_walls_urethane=Flex_Walls_Urethane_Poured unk_sidewall=Unknown
% @importance 1.0

0.94::acc(s2, sidewall_material).
0.82::acc(s1, sidewall_material).
0.96::true_val(sidewall_material, flex_walls_urethane); 0.04::true_val(sidewall_material, unk_sidewall).
measured(s2, sidewall_material, flex_walls_urethane).
measured(s1, sidewall_material, flex_walls_urethane).
all_consistent(sidewall_material) :- consistent(s2, sidewall_material), (indep(s1), consistent(s1, sidewall_material) ; \+indep(s1)).
evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, flex_walls_urethane)).
query(true_val(sidewall_material, unk_sidewall)).

% @attr sidewall_function
% @type categorical
% @canonical false
% @original_name Sidewall function
% @values shock_absorption_damping=Shock_absorption_reduced_chatter unk_sw_func=Unknown
% @importance 1.0

0.90::acc(s2, sidewall_function).
0.90::true_val(sidewall_function, shock_absorption_damping); 0.10::true_val(sidewall_function, unk_sw_func).
measured(s2, sidewall_function, shock_absorption_damping).
all_consistent(sidewall_function) :- consistent(s2, sidewall_function).
evidence(all_consistent(sidewall_function)).
query(true_val(sidewall_function, shock_absorption_damping)).
query(true_val(sidewall_function, unk_sw_func)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values hyper_glide_s_sintered=Hyper_Glide_S_sintered unk_base_mat=Unknown
% @importance 1.0

0.94::acc(s2, base_material).
0.82::acc(s1, base_material).
0.96::true_val(base_material, hyper_glide_s_sintered); 0.04::true_val(base_material, unk_base_mat).
measured(s2, base_material, hyper_glide_s_sintered).
measured(s1, base_material, hyper_glide_s_sintered).
all_consistent(base_material) :- consistent(s2, base_material), (indep(s1), consistent(s1, base_material) ; \+indep(s1)).
evidence(all_consistent(base_material)).
query(true_val(base_material, hyper_glide_s_sintered)).
query(true_val(base_material, unk_base_mat)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values fast_durable=Fast_durable_fastest_jib_base unk_base_glide=Unknown
% @importance 0.80

0.88::acc(s2, base_glide_performance).
0.82::acc(s21, base_glide_performance).
0.80::acc(s43, base_glide_performance).
0.95::true_val(base_glide_performance, fast_durable); 0.05::true_val(base_glide_performance, unk_base_glide).
measured(s2, base_glide_performance, fast_durable).
measured(s21, base_glide_performance, fast_durable).
measured(s43, base_glide_performance, fast_durable).
all_consistent(base_glide_performance) :- consistent(s2, base_glide_performance), consistent(s21, base_glide_performance), consistent(s43, base_glide_performance).
evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, fast_durable)).
query(true_val(base_glide_performance, unk_base_glide)).

% @attr edge_material
% @type categorical
% @canonical false
% @original_name Edge material
% @values standard_steel=Standard_steel_edges unk_edge_mat=Unknown
% @importance 0.50

0.60::true_val(edge_material, standard_steel); 0.40::true_val(edge_material, unk_edge_mat).
all_consistent(edge_material).
evidence(all_consistent(edge_material)).
query(true_val(edge_material, standard_steel)).
query(true_val(edge_material, unk_edge_mat)).

% @attr topsheet
% @type categorical
% @canonical false
% @original_name topsheet
% @values new_shape_2025_26=New_shape_marked_2025_26 unk_topsheet=Unknown
% @importance 1.0

0.88::acc(s2, topsheet).
0.90::true_val(topsheet, new_shape_2025_26); 0.10::true_val(topsheet, unk_topsheet).
measured(s2, topsheet, new_shape_2025_26).
all_consistent(topsheet) :- consistent(s2, topsheet).
evidence(all_consistent(topsheet)).
query(true_val(topsheet, new_shape_2025_26)).
query(true_val(topsheet, unk_topsheet)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values mikey_b=Mikey_B unk_pro_rider=Unknown
% @importance 0.70

0.78::acc(s1, pro_rider_name).
0.72::acc(s24, pro_rider_name).
0.92::true_val(pro_rider_name, mikey_b); 0.08::true_val(pro_rider_name, unk_pro_rider).
measured(s1, pro_rider_name, mikey_b).
measured(s24, pro_rider_name, mikey_b).
all_consistent(pro_rider_name) :- (indep(s1), consistent(s1, pro_rider_name) ; \+indep(s1)), (indep(s24), consistent(s24, pro_rider_name) ; \+indep(s24)).
evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, mikey_b)).
query(true_val(pro_rider_name, unk_pro_rider)).

% @attr riding_style
% @type categorical
% @canonical false
% @original_name riding_style
% @values park_jib_rails=Park_jib_rails unk_riding_style=Unknown
% @importance 1.0

0.82::acc(s1, riding_style).
0.71::true_val(riding_style, park_jib_rails); 0.29::true_val(riding_style, unk_riding_style).
measured(s1, riding_style, park_jib_rails).
all_consistent(riding_style) :- consistent(s1, riding_style).
evidence(all_consistent(riding_style)).
query(true_val(riding_style, park_jib_rails)).
query(true_val(riding_style, unk_riding_style)).

% @attr terrain_suitability
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values park_dominant=Park_dominant_some_resort_versatility unk_terrain=Unknown
% @importance 0.775

0.85::acc(s36, terrain_suitability).
0.82::acc(s37, terrain_suitability).
0.93::true_val(terrain_suitability, park_dominant); 0.07::true_val(terrain_suitability, unk_terrain).
measured(s36, terrain_suitability, park_dominant).
measured(s37, terrain_suitability, park_dominant).
all_consistent(terrain_suitability) :- consistent(s36, terrain_suitability), consistent(s37, terrain_suitability).
evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, park_dominant)).
query(true_val(terrain_suitability, unk_terrain)).

% @attr rider_level
% @type categorical
% @canonical false
% @original_name rider_level
% @values intermediate_advanced=Intermediate_to_Advanced advanced=Advanced
% @importance 0.90

0.82::acc(s1, rider_level).
0.78::acc(s4, rider_level).
0.55::true_val(rider_level, intermediate_advanced); 0.45::true_val(rider_level, advanced).
measured(s1, rider_level, intermediate_advanced).
measured(s4, rider_level, advanced).
all_consistent(rider_level) :- consistent(s1, rider_level), (indep(s4), consistent(s4, rider_level) ; \+indep(s4)).
evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate_advanced)).
query(true_val(rider_level, advanced)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values extremely_easy_nimble=Extremely_easy_ultra_nimble unk_turn=Unknown
% @importance 0.85

0.82::acc(s38, turn_initiation_performance).
0.78::true_val(turn_initiation_performance, extremely_easy_nimble); 0.22::true_val(turn_initiation_performance, unk_turn).
measured(s38, turn_initiation_performance, extremely_easy_nimble).
all_consistent(turn_initiation_performance) :- consistent(s38, turn_initiation_performance).
evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, extremely_easy_nimble)).
query(true_val(turn_initiation_performance, unk_turn)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values least_catchy=Least_catchy_3BT_reduces_catches unk_edge_hold=Unknown
% @importance 0.85

0.82::acc(s38, edge_hold).
0.78::acc(s39, edge_hold).
0.93::true_val(edge_hold, least_catchy); 0.07::true_val(edge_hold, unk_edge_hold).
measured(s38, edge_hold, least_catchy).
measured(s39, edge_hold, least_catchy).
all_consistent(edge_hold) :- consistent(s38, edge_hold), consistent(s39, edge_hold).
evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, least_catchy)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr positive_aspect_pressing
% @type categorical
% @canonical false
% @original_name positive_aspect (pressing/buttering)
% @values effortless=Effortless_pressing_buttering unk_pa_press=Unknown
% @importance 0.80

0.72::acc(s40, positive_aspect_pressing).
0.70::acc(s33, positive_aspect_pressing).
0.92::true_val(positive_aspect_pressing, effortless); 0.08::true_val(positive_aspect_pressing, unk_pa_press).
measured(s40, positive_aspect_pressing, effortless).
measured(s33, positive_aspect_pressing, effortless).
all_consistent(positive_aspect_pressing) :- consistent(s40, positive_aspect_pressing), consistent(s33, positive_aspect_pressing).
evidence(all_consistent(positive_aspect_pressing)).
query(true_val(positive_aspect_pressing, effortless)).
query(true_val(positive_aspect_pressing, unk_pa_press)).

% @attr pop
% @type categorical
% @canonical false
% @original_name pop
% @values surprisingly_good=Surprisingly_good_from_CST_SuperTubes unk_pop=Unknown
% @importance 0.75

0.72::acc(s33, pop).
0.75::acc(s35, pop).
0.92::true_val(pop, surprisingly_good); 0.08::true_val(pop, unk_pop).
measured(s33, pop, surprisingly_good).
measured(s35, pop, surprisingly_good).
all_consistent(pop) :- consistent(s33, pop), (indep(s35), consistent(s35, pop) ; \+indep(s35)).
evidence(all_consistent(pop)).
query(true_val(pop, surprisingly_good)).
query(true_val(pop, unk_pop)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect (carving)
% @values poor_carving=Poor_carving_skids_at_speed unk_na_carve=Unknown
% @importance 0.825

0.82::acc(s38, negative_aspect).
0.80::acc(s41, negative_aspect).
0.93::true_val(negative_aspect, poor_carving); 0.07::true_val(negative_aspect, unk_na_carve).
measured(s38, negative_aspect, poor_carving).
measured(s41, negative_aspect, poor_carving).
all_consistent(negative_aspect) :- consistent(s38, negative_aspect), consistent(s41, negative_aspect).
evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, poor_carving)).
query(true_val(negative_aspect, unk_na_carve)).

% @attr chatter_performance
% @type categorical
% @canonical true
% @original_name chatter_performance
% @values poor_chattery=Poor_chattery_unstable_at_speed unk_chatter=Unknown
% @importance 0.75

0.62::acc(s42, chatter_performance).
0.60::true_val(chatter_performance, poor_chattery); 0.40::true_val(chatter_performance, unk_chatter).
measured(s42, chatter_performance, poor_chattery).
all_consistent(chatter_performance) :- consistent(s42, chatter_performance).
evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, poor_chattery)).
query(true_val(chatter_performance, unk_chatter)).

% @attr negative_aspect_jumps
% @type categorical
% @canonical false
% @original_name negative_aspect (bigger jumps)
% @values not_suited_big_jumps=Not_suited_for_bigger_jumps unk_na_jumps=Unknown
% @importance 0.825

0.80::acc(s33, negative_aspect_jumps).
0.82::acc(s38, negative_aspect_jumps).
0.92::true_val(negative_aspect_jumps, not_suited_big_jumps); 0.08::true_val(negative_aspect_jumps, unk_na_jumps).
measured(s33, negative_aspect_jumps, not_suited_big_jumps).
measured(s38, negative_aspect_jumps, not_suited_big_jumps).
all_consistent(negative_aspect_jumps) :- consistent(s33, negative_aspect_jumps), consistent(s38, negative_aspect_jumps).
evidence(all_consistent(negative_aspect_jumps)).
query(true_val(negative_aspect_jumps, not_suited_big_jumps)).
query(true_val(negative_aspect_jumps, unk_na_jumps)).

% @attr positive_aspect_small_jumps
% @type categorical
% @canonical false
% @original_name positive_aspect (small jumps)
% @values good_small_medium=Good_for_small_to_medium_jumps unk_pa_jumps=Unknown
% @importance 0.85

0.82::acc(s38, positive_aspect_small_jumps).
0.60::true_val(positive_aspect_small_jumps, good_small_medium); 0.40::true_val(positive_aspect_small_jumps, unk_pa_jumps).
measured(s38, positive_aspect_small_jumps, good_small_medium).
all_consistent(positive_aspect_small_jumps) :- consistent(s38, positive_aspect_small_jumps).
evidence(all_consistent(positive_aspect_small_jumps)).
query(true_val(positive_aspect_small_jumps, good_small_medium)).
query(true_val(positive_aspect_small_jumps, unk_pa_jumps)).

% @attr negative_aspect_powder
% @type categorical
% @canonical false
% @original_name negative_aspect (powder)
% @values poor_powder=Average_to_poor_centered_twin_limits_float unk_na_powder=Unknown
% @importance 0.825

0.82::acc(s38, negative_aspect_powder).
0.80::acc(s41, negative_aspect_powder).
0.93::true_val(negative_aspect_powder, poor_powder); 0.07::true_val(negative_aspect_powder, unk_na_powder).
measured(s38, negative_aspect_powder, poor_powder).
measured(s41, negative_aspect_powder, poor_powder).
all_consistent(negative_aspect_powder) :- consistent(s38, negative_aspect_powder), consistent(s41, negative_aspect_powder).
evidence(all_consistent(negative_aspect_powder)).
query(true_val(negative_aspect_powder, poor_powder)).
query(true_val(negative_aspect_powder, unk_na_powder)).

% @attr weight_feel
% @type categorical
% @canonical false
% @original_name Weight feel
% @values feels_light=Feels_light_on_snow unk_weight_feel=Unknown
% @importance 0.85

0.80::acc(s38, weight_feel).
0.60::true_val(weight_feel, feels_light); 0.40::true_val(weight_feel, unk_weight_feel).
measured(s38, weight_feel, feels_light).
all_consistent(weight_feel) :- consistent(s38, weight_feel).
evidence(all_consistent(weight_feel)).
query(true_val(weight_feel, feels_light)).
query(true_val(weight_feel, unk_weight_feel)).

% @attr positive_aspect_catch_free
% @type categorical
% @canonical false
% @original_name positive_aspect (catch free rails)
% @values catch_free_rails=3BT_SideKick_catch_free_on_features unk_pa_catch=Unknown
% @importance 0.80

0.82::acc(s43, positive_aspect_catch_free).
0.67::true_val(positive_aspect_catch_free, catch_free_rails); 0.33::true_val(positive_aspect_catch_free, unk_pa_catch).
measured(s43, positive_aspect_catch_free, catch_free_rails).
all_consistent(positive_aspect_catch_free) :- consistent(s43, positive_aspect_catch_free).
evidence(all_consistent(positive_aspect_catch_free)).
query(true_val(positive_aspect_catch_free, catch_free_rails)).
query(true_val(positive_aspect_catch_free, unk_pa_catch)).

% @attr positive_aspect_rail_stability
% @type categorical
% @canonical false
% @original_name positive_aspect (rail stability)
% @values locks_on_rails=Excellent_rail_stability_locks_down unk_pa_rails=Unknown
% @importance 0.75

0.62::acc(s42, positive_aspect_rail_stability).
0.48::true_val(positive_aspect_rail_stability, locks_on_rails); 0.52::true_val(positive_aspect_rail_stability, unk_pa_rails).
measured(s42, positive_aspect_rail_stability, locks_on_rails).
all_consistent(positive_aspect_rail_stability) :- consistent(s42, positive_aspect_rail_stability).
evidence(all_consistent(positive_aspect_rail_stability)).
query(true_val(positive_aspect_rail_stability, locks_on_rails)).
query(true_val(positive_aspect_rail_stability, unk_pa_rails)).

% @attr board_of_world_rating
% @type numeric
% @canonical false
% @original_name Board of the World rating
% @unit /100
% @values v84_75=84.75 unk_botw_rating=Unknown
% @importance 0.85

0.82::acc(s31, board_of_world_rating).
0.67::true_val(board_of_world_rating, v84_75); 0.33::true_val(board_of_world_rating, unk_botw_rating).
measured(s31, board_of_world_rating, v84_75).
all_consistent(board_of_world_rating) :- consistent(s31, board_of_world_rating).
evidence(all_consistent(board_of_world_rating)).
query(true_val(board_of_world_rating, v84_75)).
query(true_val(board_of_world_rating, unk_botw_rating)).

% @attr board_of_world_ranking
% @type categorical
% @canonical false
% @original_name Board of the World ranking
% @values rank_27_of_36=27th_of_36_park_boards unk_botw_rank=Unknown
% @importance 0.85

0.82::acc(s31, board_of_world_ranking).
0.67::true_val(board_of_world_ranking, rank_27_of_36); 0.33::true_val(board_of_world_ranking, unk_botw_rank).
measured(s31, board_of_world_ranking, rank_27_of_36).
all_consistent(board_of_world_ranking) :- consistent(s31, board_of_world_ranking).
evidence(all_consistent(board_of_world_ranking)).
query(true_val(board_of_world_ranking, rank_27_of_36)).
query(true_val(board_of_world_ranking, unk_botw_rank)).

% @attr bataleon_user_reviews
% @type categorical
% @canonical false
% @original_name Bataleon.com user reviews
% @values r199_92pct_5star=199_reviews_92pct_5star unk_user_reviews=Unknown
% @importance 1.0

0.85::acc(s2, bataleon_user_reviews).
0.90::true_val(bataleon_user_reviews, r199_92pct_5star); 0.10::true_val(bataleon_user_reviews, unk_user_reviews).
measured(s2, bataleon_user_reviews, r199_92pct_5star).
all_consistent(bataleon_user_reviews) :- consistent(s2, bataleon_user_reviews).
evidence(all_consistent(bataleon_user_reviews)).
query(true_val(bataleon_user_reviews, r199_92pct_5star)).
query(true_val(bataleon_user_reviews, unk_user_reviews)).

% @attr the_inertia_award
% @type categorical
% @canonical false
% @original_name The Inertia award
% @values best_jib_board_2026=Best_Jib_Board_2026 unk_inertia=Unknown
% @importance 0.85

0.85::acc(s36, the_inertia_award).
0.76::true_val(the_inertia_award, best_jib_board_2026); 0.24::true_val(the_inertia_award, unk_inertia).
measured(s36, the_inertia_award, best_jib_board_2026).
all_consistent(the_inertia_award) :- consistent(s36, the_inertia_award).
evidence(all_consistent(the_inertia_award)).
query(true_val(the_inertia_award, best_jib_board_2026)).
query(true_val(the_inertia_award, unk_inertia)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values whitelines_100_selected=Whitelines_100_selected_2020_21_2021_22 unk_whitelines=Unknown
% @importance 0.65

0.80::acc(s44, reviewer_opinion_whitelines).
0.80::acc(s45, reviewer_opinion_whitelines).
0.93::true_val(reviewer_opinion_whitelines, whitelines_100_selected); 0.07::true_val(reviewer_opinion_whitelines, unk_whitelines).
measured(s44, reviewer_opinion_whitelines, whitelines_100_selected).
measured(s45, reviewer_opinion_whitelines, whitelines_100_selected).
all_consistent(reviewer_opinion_whitelines) :- consistent(s44, reviewer_opinion_whitelines), consistent(s45, reviewer_opinion_whitelines).
evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, whitelines_100_selected)).
query(true_val(reviewer_opinion_whitelines, unk_whitelines)).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name reviewer_opinion_snowboardingprofiles
% @values super_fun_playful=Super_fun_playful_creative unk_rsp=Unknown
% @importance 0.85

0.80::acc(s39, reviewer_opinion_snowboardingprofiles).
0.63::true_val(reviewer_opinion_snowboardingprofiles, super_fun_playful); 0.37::true_val(reviewer_opinion_snowboardingprofiles, unk_rsp).
measured(s39, reviewer_opinion_snowboardingprofiles, super_fun_playful).
all_consistent(reviewer_opinion_snowboardingprofiles) :- consistent(s39, reviewer_opinion_snowboardingprofiles).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, super_fun_playful)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_rsp)).

% @attr reviewer_opinion_snowboardingprofiles_limitation
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (limitation)
% @values not_one_board_quiver=Not_a_one_board_quiver unk_rsp_lim=Unknown
% @importance 0.85

0.80::acc(s39, reviewer_opinion_snowboardingprofiles_limitation).
0.63::true_val(reviewer_opinion_snowboardingprofiles_limitation, not_one_board_quiver); 0.37::true_val(reviewer_opinion_snowboardingprofiles_limitation, unk_rsp_lim).
measured(s39, reviewer_opinion_snowboardingprofiles_limitation, not_one_board_quiver).
all_consistent(reviewer_opinion_snowboardingprofiles_limitation) :- consistent(s39, reviewer_opinion_snowboardingprofiles_limitation).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles_limitation)).
query(true_val(reviewer_opinion_snowboardingprofiles_limitation, not_one_board_quiver)).
query(true_val(reviewer_opinion_snowboardingprofiles_limitation, unk_rsp_lim)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values most_fun_unique=Most_fun_most_unique_board unk_urf=Unknown
% @importance 0.80

0.70::acc(s33, user_review_forum).
0.55::true_val(user_review_forum, most_fun_unique); 0.45::true_val(user_review_forum, unk_urf).
measured(s33, user_review_forum, most_fun_unique).
all_consistent(user_review_forum) :- consistent(s33, user_review_forum).
evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, most_fun_unique)).
query(true_val(user_review_forum, unk_urf)).

% @attr user_review_forum_light_tricks
% @type categorical
% @canonical false
% @original_name user_review_forum (light tricks)
% @values so_light_tricks_breeze=So_light_tricks_are_a_breeze unk_urf_light=Unknown
% @importance 0.80

0.70::acc(s33, user_review_forum_light_tricks).
0.55::true_val(user_review_forum_light_tricks, so_light_tricks_breeze); 0.45::true_val(user_review_forum_light_tricks, unk_urf_light).
measured(s33, user_review_forum_light_tricks, so_light_tricks_breeze).
all_consistent(user_review_forum_light_tricks) :- consistent(s33, user_review_forum_light_tricks).
evidence(all_consistent(user_review_forum_light_tricks)).
query(true_val(user_review_forum_light_tricks, so_light_tricks_breeze)).
query(true_val(user_review_forum_light_tricks, unk_urf_light)).

% @attr user_review_forum_pop
% @type categorical
% @canonical false
% @original_name user_review_forum (SuperTubes pop)
% @values surprising_pop=SuperTubes_surprising_nose_tail_pop unk_urf_pop=Unknown
% @importance 0.80

0.70::acc(s33, user_review_forum_pop).
0.55::true_val(user_review_forum_pop, surprising_pop); 0.45::true_val(user_review_forum_pop, unk_urf_pop).
measured(s33, user_review_forum_pop, surprising_pop).
all_consistent(user_review_forum_pop) :- consistent(s33, user_review_forum_pop).
evidence(all_consistent(user_review_forum_pop)).
query(true_val(user_review_forum_pop, surprising_pop)).
query(true_val(user_review_forum_pop, unk_urf_pop)).

% @attr user_review_forum_edge_catch
% @type categorical
% @canonical false
% @original_name user_review_forum (edge catch)
% @values near_impossible_catch=Near_impossible_to_catch_edge unk_urf_edge=Unknown
% @importance 0.80

0.70::acc(s33, user_review_forum_edge_catch).
0.55::true_val(user_review_forum_edge_catch, near_impossible_catch); 0.45::true_val(user_review_forum_edge_catch, unk_urf_edge).
measured(s33, user_review_forum_edge_catch, near_impossible_catch).
all_consistent(user_review_forum_edge_catch) :- consistent(s33, user_review_forum_edge_catch).
evidence(all_consistent(user_review_forum_edge_catch)).
query(true_val(user_review_forum_edge_catch, near_impossible_catch)).
query(true_val(user_review_forum_edge_catch, unk_urf_edge)).

% @attr user_review_forum_build_quality
% @type categorical
% @canonical false
% @original_name user_review_forum (build quality)
% @values build_10_10=Build_quality_10_out_of_10_no_flaws unk_urf_build=Unknown
% @importance 0.75

0.62::acc(s42, user_review_forum_build_quality).
0.48::true_val(user_review_forum_build_quality, build_10_10); 0.52::true_val(user_review_forum_build_quality, unk_urf_build).
measured(s42, user_review_forum_build_quality, build_10_10).
all_consistent(user_review_forum_build_quality) :- consistent(s42, user_review_forum_build_quality).
evidence(all_consistent(user_review_forum_build_quality)).
query(true_val(user_review_forum_build_quality, build_10_10)).
query(true_val(user_review_forum_build_quality, unk_urf_build)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect (jibbing/park overall)
% @values excellent_jib_creative=Excellent_for_jibbing_pressing_creative_park unk_pa=Unknown
% @importance 0.85

0.85::acc(s36, positive_aspect).
0.80::acc(s39, positive_aspect).
0.82::acc(s43, positive_aspect).
0.95::true_val(positive_aspect, excellent_jib_creative); 0.05::true_val(positive_aspect, unk_pa).
measured(s36, positive_aspect, excellent_jib_creative).
measured(s39, positive_aspect, excellent_jib_creative).
measured(s43, positive_aspect, excellent_jib_creative).
all_consistent(positive_aspect) :- consistent(s36, positive_aspect), consistent(s39, positive_aspect), consistent(s43, positive_aspect).
evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, excellent_jib_creative)).
query(true_val(positive_aspect, unk_pa)).

% @attr positive_aspect_rope_tow
% @type categorical
% @canonical false
% @original_name positive_aspect (rope tow/indoor)
% @values excellent_rope_tow=Excellent_for_rope_tow_indoor_slow_snow unk_pa_rope=Unknown
% @importance 0.80

0.82::acc(s43, positive_aspect_rope_tow).
0.63::true_val(positive_aspect_rope_tow, excellent_rope_tow); 0.37::true_val(positive_aspect_rope_tow, unk_pa_rope).
measured(s43, positive_aspect_rope_tow, excellent_rope_tow).
all_consistent(positive_aspect_rope_tow) :- consistent(s43, positive_aspect_rope_tow).
evidence(all_consistent(positive_aspect_rope_tow)).
query(true_val(positive_aspect_rope_tow, excellent_rope_tow)).
query(true_val(positive_aspect_rope_tow, unk_pa_rope)).

% @attr user_review_forum_soft
% @type categorical
% @canonical false
% @original_name user_review_forum (too soft)
% @values too_soft_no_pop=Too_soft_no_pop_standard_Disaster unk_urf_soft=Unknown
% @importance 0.75

0.58::acc(s46, user_review_forum_soft).
0.44::true_val(user_review_forum_soft, too_soft_no_pop); 0.56::true_val(user_review_forum_soft, unk_urf_soft).
measured(s46, user_review_forum_soft, too_soft_no_pop).
all_consistent(user_review_forum_soft) :- consistent(s46, user_review_forum_soft).
evidence(all_consistent(user_review_forum_soft)).
query(true_val(user_review_forum_soft, too_soft_no_pop)).
query(true_val(user_review_forum_soft, unk_urf_soft)).

% @attr user_review_forum_suck
% @type categorical
% @canonical false
% @original_name user_review_forum (does this board suck)
% @values doesnt_suit_all=Doesnt_suit_all_riders unk_urf_suck=Unknown
% @importance 0.50

0.40::acc(s47, user_review_forum_suck).
0.18::true_val(user_review_forum_suck, doesnt_suit_all); 0.82::true_val(user_review_forum_suck, unk_urf_suck).
measured(s47, user_review_forum_suck, doesnt_suit_all).
all_consistent(user_review_forum_suck) :- consistent(s47, user_review_forum_suck).
evidence(all_consistent(user_review_forum_suck)).
query(true_val(user_review_forum_suck, doesnt_suit_all)).
query(true_val(user_review_forum_suck, unk_urf_suck)).

% @attr user_review_forum_3bt_taste
% @type categorical
% @canonical false
% @original_name user_review_forum (3BT acquired taste)
% @values acquired_taste=3BT_acquired_taste_drive_differently unk_urf_3bt=Unknown
% @importance 0.65

0.55::acc(s48, user_review_forum_3bt_taste).
0.34::true_val(user_review_forum_3bt_taste, acquired_taste); 0.66::true_val(user_review_forum_3bt_taste, unk_urf_3bt).
measured(s48, user_review_forum_3bt_taste, acquired_taste).
all_consistent(user_review_forum_3bt_taste) :- consistent(s48, user_review_forum_3bt_taste).
evidence(all_consistent(user_review_forum_3bt_taste)).
query(true_val(user_review_forum_3bt_taste, acquired_taste)).
query(true_val(user_review_forum_3bt_taste, unk_urf_3bt)).

% @attr user_review_forum_3bt_dislike
% @type categorical
% @canonical false
% @original_name user_review_forum (3BT dislike)
% @values some_dislike_3bt=Some_riders_strongly_dislike_3BT unk_urf_3bt_dis=Unknown
% @importance 0.60

0.45::acc(s49, user_review_forum_3bt_dislike).
0.25::true_val(user_review_forum_3bt_dislike, some_dislike_3bt); 0.75::true_val(user_review_forum_3bt_dislike, unk_urf_3bt_dis).
measured(s49, user_review_forum_3bt_dislike, some_dislike_3bt).
all_consistent(user_review_forum_3bt_dislike) :- consistent(s49, user_review_forum_3bt_dislike).
evidence(all_consistent(user_review_forum_3bt_dislike)).
query(true_val(user_review_forum_3bt_dislike, some_dislike_3bt)).
query(true_val(user_review_forum_3bt_dislike, unk_urf_3bt_dis)).

% @attr negative_aspect_pair_stiffer
% @type categorical
% @canonical false
% @original_name negative_aspect (pair with stiffer board)
% @values recommend_pair_stiffer=Recommend_pairing_with_stiffer_all_mountain unk_na_pair=Unknown
% @importance 0.80

0.80::acc(s39, negative_aspect_pair_stiffer).
0.58::acc(s46, negative_aspect_pair_stiffer).
0.88::true_val(negative_aspect_pair_stiffer, recommend_pair_stiffer); 0.12::true_val(negative_aspect_pair_stiffer, unk_na_pair).
measured(s39, negative_aspect_pair_stiffer, recommend_pair_stiffer).
measured(s46, negative_aspect_pair_stiffer, recommend_pair_stiffer).
all_consistent(negative_aspect_pair_stiffer) :- consistent(s39, negative_aspect_pair_stiffer), consistent(s46, negative_aspect_pair_stiffer).
evidence(all_consistent(negative_aspect_pair_stiffer)).
query(true_val(negative_aspect_pair_stiffer, recommend_pair_stiffer)).
query(true_val(negative_aspect_pair_stiffer, unk_na_pair)).

% @attr comparable_board_same_brand_weight
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (weight comparison)
% @values standard_heavy_plus_lighter=Standard_pretty_heavy_Plus_lighter_core unk_csb_weight=Unknown
% @importance 0.75

0.62::acc(s42, comparable_board_same_brand_weight).
0.48::true_val(comparable_board_same_brand_weight, standard_heavy_plus_lighter); 0.52::true_val(comparable_board_same_brand_weight, unk_csb_weight).
measured(s42, comparable_board_same_brand_weight, standard_heavy_plus_lighter).
all_consistent(comparable_board_same_brand_weight) :- consistent(s42, comparable_board_same_brand_weight).
evidence(all_consistent(comparable_board_same_brand_weight)).
query(true_val(comparable_board_same_brand_weight, standard_heavy_plus_lighter)).
query(true_val(comparable_board_same_brand_weight, unk_csb_weight)).

% @attr negative_aspect_price
% @type categorical
% @canonical false
% @original_name negative_aspect (price premium)
% @values costs_more_than_avg=Costs_94_to_130_more_than_average unk_na_price=Unknown
% @importance 0.825

0.78::acc(s21, negative_aspect_price).
0.75::acc(s31, negative_aspect_price).
0.90::true_val(negative_aspect_price, costs_more_than_avg); 0.10::true_val(negative_aspect_price, unk_na_price).
measured(s21, negative_aspect_price, costs_more_than_avg).
measured(s31, negative_aspect_price, costs_more_than_avg).
all_consistent(negative_aspect_price) :- consistent(s21, negative_aspect_price), consistent(s31, negative_aspect_price).
evidence(all_consistent(negative_aspect_price)).
query(true_val(negative_aspect_price, costs_more_than_avg)).
query(true_val(negative_aspect_price, unk_na_price)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values horrorscope_headspace_twinpig=CAPiTA_Horrorscope_GNU_Head_Space_Ride_Twinpig unk_ccb=Unknown
% @importance 0.70

0.68::acc(s50, comparable_board_cross_brand).
0.60::acc(s51, comparable_board_cross_brand).
0.88::true_val(comparable_board_cross_brand, horrorscope_headspace_twinpig); 0.12::true_val(comparable_board_cross_brand, unk_ccb).
measured(s50, comparable_board_cross_brand, horrorscope_headspace_twinpig).
measured(s51, comparable_board_cross_brand, horrorscope_headspace_twinpig).
all_consistent(comparable_board_cross_brand) :- consistent(s50, comparable_board_cross_brand), consistent(s51, comparable_board_cross_brand).
evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, horrorscope_headspace_twinpig)).
query(true_val(comparable_board_cross_brand, unk_ccb)).

% @attr comparable_board_same_brand_evil_twin
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Evil Twin)
% @values evil_twin_stiffer=Evil_Twin_Plus_stiffer_more_versatile unk_csb_et=Unknown
% @importance 0.60

0.55::acc(s52, comparable_board_same_brand_evil_twin).
0.40::true_val(comparable_board_same_brand_evil_twin, evil_twin_stiffer); 0.60::true_val(comparable_board_same_brand_evil_twin, unk_csb_et).
measured(s52, comparable_board_same_brand_evil_twin, evil_twin_stiffer).
all_consistent(comparable_board_same_brand_evil_twin) :- consistent(s52, comparable_board_same_brand_evil_twin).
evidence(all_consistent(comparable_board_same_brand_evil_twin)).
query(true_val(comparable_board_same_brand_evil_twin, evil_twin_stiffer)).
query(true_val(comparable_board_same_brand_evil_twin, unk_csb_et)).

% @attr comparable_board_same_brand_evil_twin_ranking
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Evil Twin ranking)
% @values et_1st_d_27th=Evil_Twin_Plus_1st_Disaster_Plus_27th_of_36 unk_csb_etr=Unknown
% @importance 0.75

0.78::acc(s53, comparable_board_same_brand_evil_twin_ranking).
0.60::true_val(comparable_board_same_brand_evil_twin_ranking, et_1st_d_27th); 0.40::true_val(comparable_board_same_brand_evil_twin_ranking, unk_csb_etr).
measured(s53, comparable_board_same_brand_evil_twin_ranking, et_1st_d_27th).
all_consistent(comparable_board_same_brand_evil_twin_ranking) :- consistent(s53, comparable_board_same_brand_evil_twin_ranking).
evidence(all_consistent(comparable_board_same_brand_evil_twin_ranking)).
query(true_val(comparable_board_same_brand_evil_twin_ranking, et_1st_d_27th)).
query(true_val(comparable_board_same_brand_evil_twin_ranking, unk_csb_etr)).

% @attr comparable_board_cross_brand_doa
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (DOA switch)
% @values user_preferred_doa=User_switched_Disaster_to_DOA_preferred unk_ccb_doa=Unknown
% @importance 0.70

0.55::acc(s54, comparable_board_cross_brand_doa).
0.36::true_val(comparable_board_cross_brand_doa, user_preferred_doa); 0.64::true_val(comparable_board_cross_brand_doa, unk_ccb_doa).
measured(s54, comparable_board_cross_brand_doa, user_preferred_doa).
all_consistent(comparable_board_cross_brand_doa) :- consistent(s54, comparable_board_cross_brand_doa).
evidence(all_consistent(comparable_board_cross_brand_doa)).
query(true_val(comparable_board_cross_brand_doa, user_preferred_doa)).
query(true_val(comparable_board_cross_brand_doa, unk_ccb_doa)).

% @attr comparable_board_cross_brand_twinpig
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Twinpig)
% @values twinpig_wider_shorter=Twinpig_wider_shorter_hybrid_camber unk_ccb_tp=Unknown
% @importance 0.70

0.68::acc(s50, comparable_board_cross_brand_twinpig).
0.51::true_val(comparable_board_cross_brand_twinpig, twinpig_wider_shorter); 0.49::true_val(comparable_board_cross_brand_twinpig, unk_ccb_tp).
measured(s50, comparable_board_cross_brand_twinpig, twinpig_wider_shorter).
all_consistent(comparable_board_cross_brand_twinpig) :- consistent(s50, comparable_board_cross_brand_twinpig).
evidence(all_consistent(comparable_board_cross_brand_twinpig)).
query(true_val(comparable_board_cross_brand_twinpig, twinpig_wider_shorter)).
query(true_val(comparable_board_cross_brand_twinpig, unk_ccb_tp)).

% @attr comparable_board_same_brand_standard_diff
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (standard vs Plus differences)
% @values standard_softer_heavier_no_carbon=Standard_softer_heavier_no_carbon_saves_130 unk_csb_diff=Unknown
% @importance 0.725

0.75::acc(s26, comparable_board_same_brand_standard_diff).
0.72::acc(s34, comparable_board_same_brand_standard_diff).
0.93::true_val(comparable_board_same_brand_standard_diff, standard_softer_heavier_no_carbon); 0.07::true_val(comparable_board_same_brand_standard_diff, unk_csb_diff).
measured(s26, comparable_board_same_brand_standard_diff, standard_softer_heavier_no_carbon).
measured(s34, comparable_board_same_brand_standard_diff, standard_softer_heavier_no_carbon).
all_consistent(comparable_board_same_brand_standard_diff) :- consistent(s26, comparable_board_same_brand_standard_diff), consistent(s34, comparable_board_same_brand_standard_diff).
evidence(all_consistent(comparable_board_same_brand_standard_diff)).
query(true_val(comparable_board_same_brand_standard_diff, standard_softer_heavier_no_carbon)).
query(true_val(comparable_board_same_brand_standard_diff, unk_csb_diff)).

% @attr comparable_board_same_brand_wallie
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Wallie)
% @values wallie_carbon_center_inserts=Wallie_has_carbon_around_center_inserts unk_csb_wallie=Unknown
% @importance 0.35

0.78::acc(s28, comparable_board_same_brand_wallie).
0.68::true_val(comparable_board_same_brand_wallie, wallie_carbon_center_inserts); 0.32::true_val(comparable_board_same_brand_wallie, unk_csb_wallie).
measured(s28, comparable_board_same_brand_wallie, wallie_carbon_center_inserts).
all_consistent(comparable_board_same_brand_wallie) :- consistent(s28, comparable_board_same_brand_wallie).
evidence(all_consistent(comparable_board_same_brand_wallie)).
query(true_val(comparable_board_same_brand_wallie, wallie_carbon_center_inserts)).
query(true_val(comparable_board_same_brand_wallie, unk_csb_wallie)).

% @attr camber_description_positive_camber
% @type categorical
% @canonical false
% @original_name camber_description (positive camber detail)
% @values positive_camber_lifted_sidebase=Positive_camber_nose_to_tail_lifted_sidebase unk_cd_pc=Unknown
% @importance 0.75

0.90::acc(s2, camber_description_positive_camber).
0.85::acc(s16, camber_description_positive_camber).
0.95::true_val(camber_description_positive_camber, positive_camber_lifted_sidebase); 0.05::true_val(camber_description_positive_camber, unk_cd_pc).
measured(s2, camber_description_positive_camber, positive_camber_lifted_sidebase).
measured(s16, camber_description_positive_camber, positive_camber_lifted_sidebase).
all_consistent(camber_description_positive_camber) :- consistent(s2, camber_description_positive_camber), consistent(s16, camber_description_positive_camber).
evidence(all_consistent(camber_description_positive_camber)).
query(true_val(camber_description_positive_camber, positive_camber_lifted_sidebase)).
query(true_val(camber_description_positive_camber, unk_cd_pc)).

% @attr camber_description_centerbase
% @type categorical
% @canonical false
% @original_name camber_description (widest centerbase)
% @values widest_centerbase=Widest_centerbase_in_range_locked_presses unk_cd_cb=Unknown
% @importance 0.70

0.72::acc(s55, camber_description_centerbase).
0.52::true_val(camber_description_centerbase, widest_centerbase); 0.48::true_val(camber_description_centerbase, unk_cd_cb).
measured(s55, camber_description_centerbase, widest_centerbase).
all_consistent(camber_description_centerbase) :- consistent(s55, camber_description_centerbase).
evidence(all_consistent(camber_description_centerbase)).
query(true_val(camber_description_centerbase, widest_centerbase)).
query(true_val(camber_description_centerbase, unk_cd_cb)).

% @attr camber_description_sidekick_uplift
% @type categorical
% @canonical false
% @original_name camber_description (SideKick uplift)
% @values amplifies_sidebase_uplift=Amplifies_sidebase_uplift_nose_tail_hull_shape unk_cd_sk=Unknown
% @importance 1.0

0.90::acc(s2, camber_description_sidekick_uplift).
0.90::true_val(camber_description_sidekick_uplift, amplifies_sidebase_uplift); 0.10::true_val(camber_description_sidekick_uplift, unk_cd_sk).
measured(s2, camber_description_sidekick_uplift, amplifies_sidebase_uplift).
all_consistent(camber_description_sidekick_uplift) :- consistent(s2, camber_description_sidekick_uplift).
evidence(all_consistent(camber_description_sidekick_uplift)).
query(true_val(camber_description_sidekick_uplift, amplifies_sidebase_uplift)).
query(true_val(camber_description_sidekick_uplift, unk_cd_sk)).

% @attr camber_description_enhanced_float
% @type categorical
% @canonical false
% @original_name camber_description (enhanced float)
% @values enhanced_float_smooth_turns=Enhanced_float_smoother_turn_initiation unk_cd_ef=Unknown
% @importance 1.0

0.88::acc(s2, camber_description_enhanced_float).
0.90::true_val(camber_description_enhanced_float, enhanced_float_smooth_turns); 0.10::true_val(camber_description_enhanced_float, unk_cd_ef).
measured(s2, camber_description_enhanced_float, enhanced_float_smooth_turns).
all_consistent(camber_description_enhanced_float) :- consistent(s2, camber_description_enhanced_float).
evidence(all_consistent(camber_description_enhanced_float)).
query(true_val(camber_description_enhanced_float, enhanced_float_smooth_turns)).
query(true_val(camber_description_enhanced_float, unk_cd_ef)).

% @attr construction_method
% @type categorical
% @canonical false
% @original_name Construction method
% @values sandwich_urethane_sidewalls=Sandwich_construction_urethane_sidewalls unk_const_method=Unknown
% @importance 1.0

0.92::acc(s2, construction_method).
0.90::true_val(construction_method, sandwich_urethane_sidewalls); 0.10::true_val(construction_method, unk_const_method).
measured(s2, construction_method, sandwich_urethane_sidewalls).
all_consistent(construction_method) :- consistent(s2, construction_method).
evidence(all_consistent(construction_method)).
query(true_val(construction_method, sandwich_urethane_sidewalls)).
query(true_val(construction_method, unk_const_method)).

% @attr binding_compatibility
% @type categorical
% @canonical false
% @original_name binding_compatibility
% @values two_by_four_any_disc=2x4_compatible_any_standard_mini_disc unk_binding=Unknown
% @importance 1.0

0.82::acc(s1, binding_compatibility).
0.71::true_val(binding_compatibility, two_by_four_any_disc); 0.29::true_val(binding_compatibility, unk_binding).
measured(s1, binding_compatibility, two_by_four_any_disc).
all_consistent(binding_compatibility) :- consistent(s1, binding_compatibility).
evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, two_by_four_any_disc)).
query(true_val(binding_compatibility, unk_binding)).

% @attr gender
% @type categorical
% @canonical false
% @original_name gender
% @values mens_unisex=Mens_unisex unk_gender=Unknown
% @importance 0.70

0.88::acc(s2, gender).
0.72::acc(s56, gender).
0.93::true_val(gender, mens_unisex); 0.07::true_val(gender, unk_gender).
measured(s2, gender, mens_unisex).
measured(s56, gender, mens_unisex).
all_consistent(gender) :- consistent(s2, gender), (indep(s56), consistent(s56, gender) ; \+indep(s56)).
evidence(all_consistent(gender)).
query(true_val(gender, mens_unisex)).
query(true_val(gender, unk_gender)).

% @attr brand_perception
% @type categorical
% @canonical false
% @original_name Brand perception
% @values well_respected_innovative=Well_respected_innovation_quality unk_brand_perc=Unknown
% @importance 0.45

0.72::acc(s57, brand_perception).
0.68::acc(s58, brand_perception).
0.90::true_val(brand_perception, well_respected_innovative); 0.10::true_val(brand_perception, unk_brand_perc).
measured(s57, brand_perception, well_respected_innovative).
measured(s58, brand_perception, well_respected_innovative).
all_consistent(brand_perception) :- consistent(s57, brand_perception), consistent(s58, brand_perception).
evidence(all_consistent(brand_perception)).
query(true_val(brand_perception, well_respected_innovative)).
query(true_val(brand_perception, unk_brand_perc)).

% @attr brand_loyalty
% @type categorical
% @canonical false
% @original_name Brand loyalty
% @values loyal_repeat_customers=Many_loyal_repeat_customers_due_to_3BT unk_brand_loyalty=Unknown
% @importance 0.45

0.68::acc(s59, brand_loyalty).
0.48::true_val(brand_loyalty, loyal_repeat_customers); 0.52::true_val(brand_loyalty, unk_brand_loyalty).
measured(s59, brand_loyalty, loyal_repeat_customers).
all_consistent(brand_loyalty) :- consistent(s59, brand_loyalty).
evidence(all_consistent(brand_loyalty)).
query(true_val(brand_loyalty, loyal_repeat_customers)).
query(true_val(brand_loyalty, unk_brand_loyalty)).

% @attr brand_heritage
% @type categorical
% @canonical false
% @original_name Brand heritage
% @values twenty_plus_years_3d_tech=Over_20_years_3D_snowboard_tech unk_brand_heritage=Unknown
% @importance 0.50

0.88::acc(s16, brand_heritage).
0.90::true_val(brand_heritage, twenty_plus_years_3d_tech); 0.10::true_val(brand_heritage, unk_brand_heritage).
measured(s16, brand_heritage, twenty_plus_years_3d_tech).
all_consistent(brand_heritage) :- consistent(s16, brand_heritage).
evidence(all_consistent(brand_heritage)).
query(true_val(brand_heritage, twenty_plus_years_3d_tech)).
query(true_val(brand_heritage, unk_brand_heritage)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values clean_energy_carbon_neutral=100pct_clean_energy_carbon_neutral_hydro unk_sustain=Unknown
% @importance 0.425

0.85::acc(s60, sustainability_certification).
0.72::acc(s61, sustainability_certification).
0.93::true_val(sustainability_certification, clean_energy_carbon_neutral); 0.07::true_val(sustainability_certification, unk_sustain).
measured(s60, sustainability_certification, clean_energy_carbon_neutral).
measured(s61, sustainability_certification, clean_energy_carbon_neutral).
all_consistent(sustainability_certification) :- consistent(s60, sustainability_certification), consistent(s61, sustainability_certification).
evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, clean_energy_carbon_neutral)).
query(true_val(sustainability_certification, unk_sustain)).

% @attr topsheet_appearance_description
% @type categorical
% @canonical false
% @original_name topsheet_appearance_description
% @values clean_simple=Clean_simple_design unk_topsheet_app=Unknown
% @importance 0.20

0.65::acc(s62, topsheet_appearance_description).
0.49::true_val(topsheet_appearance_description, clean_simple); 0.51::true_val(topsheet_appearance_description, unk_topsheet_app).
measured(s62, topsheet_appearance_description, clean_simple).
all_consistent(topsheet_appearance_description) :- consistent(s62, topsheet_appearance_description).
evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, clean_simple)).
query(true_val(topsheet_appearance_description, unk_topsheet_app)).

% @attr base_colour
% @type categorical
% @canonical false
% @original_name Base colour
% @values solid_colour=Solid_colour_potentially_faster unk_base_colour=Unknown
% @importance 0.80

0.78::acc(s43, base_colour).
0.63::true_val(base_colour, solid_colour); 0.37::true_val(base_colour, unk_base_colour).
measured(s43, base_colour, solid_colour).
all_consistent(base_colour) :- consistent(s43, base_colour).
evidence(all_consistent(base_colour)).
query(true_val(base_colour, solid_colour)).
query(true_val(base_colour, unk_base_colour)).

% @attr redesign_year
% @type categorical
% @canonical false
% @original_name redesign_year
% @values new_shape_2025_26=New_shape_for_2025_26 unk_redesign=Unknown
% @importance 1.0

0.90::acc(s2, redesign_year).
0.90::true_val(redesign_year, new_shape_2025_26); 0.10::true_val(redesign_year, unk_redesign).
measured(s2, redesign_year, new_shape_2025_26).
all_consistent(redesign_year) :- consistent(s2, redesign_year).
evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, new_shape_2025_26)).
query(true_val(redesign_year, unk_redesign)).

% @attr comparable_board_same_brand_price_diff
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (price difference calculation)
% @values v130_diff=629_95_vs_499_95_equals_130_difference unk_csb_pdiff=Unknown
% @importance 0.875

0.88::acc(s18, comparable_board_same_brand_price_diff).
0.85::acc(s20, comparable_board_same_brand_price_diff).
0.95::true_val(comparable_board_same_brand_price_diff, v130_diff); 0.05::true_val(comparable_board_same_brand_price_diff, unk_csb_pdiff).
measured(s18, comparable_board_same_brand_price_diff, v130_diff).
measured(s20, comparable_board_same_brand_price_diff, v130_diff).
all_consistent(comparable_board_same_brand_price_diff) :- (indep(s18), consistent(s18, comparable_board_same_brand_price_diff) ; \+indep(s18)), consistent(s20, comparable_board_same_brand_price_diff).
evidence(all_consistent(comparable_board_same_brand_price_diff)).
query(true_val(comparable_board_same_brand_price_diff, v130_diff)).
query(true_val(comparable_board_same_brand_price_diff, unk_csb_pdiff)).

% @attr disaster_plus_bundle
% @type numeric
% @canonical false
% @original_name Disaster+ in bundles
% @unit USD
% @values v1019_90=1019.90 unk_bundle=Unknown
% @importance 0.50

0.85::acc(s63, disaster_plus_bundle).
0.77::true_val(disaster_plus_bundle, v1019_90); 0.23::true_val(disaster_plus_bundle, unk_bundle).
measured(s63, disaster_plus_bundle, v1019_90).
all_consistent(disaster_plus_bundle) :- consistent(s63, disaster_plus_bundle).
evidence(all_consistent(disaster_plus_bundle)).
query(true_val(disaster_plus_bundle, v1019_90)).
query(true_val(disaster_plus_bundle, unk_bundle)).

% @attr comparable_board_same_brand_evil_twin_price
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Evil Twin+ price range)
% @values r620_650=620_to_650_USD unk_csb_etp=Unknown
% @importance 0.75

0.78::acc(s53, comparable_board_same_brand_evil_twin_price).
0.60::true_val(comparable_board_same_brand_evil_twin_price, r620_650); 0.40::true_val(comparable_board_same_brand_evil_twin_price, unk_csb_etp).
measured(s53, comparable_board_same_brand_evil_twin_price, r620_650).
all_consistent(comparable_board_same_brand_evil_twin_price) :- consistent(s53, comparable_board_same_brand_evil_twin_price).
evidence(all_consistent(comparable_board_same_brand_evil_twin_price)).
query(true_val(comparable_board_same_brand_evil_twin_price, r620_650)).
query(true_val(comparable_board_same_brand_evil_twin_price, unk_csb_etp)).

% @attr edge_hold_ice
% @type categorical
% @canonical false
% @original_name edge_hold (ice performance)
% @values washes_out_ice=Washes_out_on_ice_for_soft_Bataleon unk_edge_ice=Unknown
% @importance 0.75

0.58::acc(s42, edge_hold_ice).
0.38::true_val(edge_hold_ice, washes_out_ice); 0.62::true_val(edge_hold_ice, unk_edge_ice).
measured(s42, edge_hold_ice, washes_out_ice).
all_consistent(edge_hold_ice) :- consistent(s42, edge_hold_ice).
evidence(all_consistent(edge_hold_ice)).
query(true_val(edge_hold_ice, washes_out_ice)).
query(true_val(edge_hold_ice, unk_edge_ice)).