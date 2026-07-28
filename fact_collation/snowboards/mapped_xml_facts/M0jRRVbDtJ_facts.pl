0.15::indep(s1).
0.20::indep(s2).
0.15::indep(s16).
0.20::indep(s17).
0.25::indep(s18).
0.15::indep(s21).
0.15::indep(s25).
0.20::indep(s32).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

0.85::acc(s1, brand).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values bataleon=Bataleon unk_brand=Unknown
% @importance 1.0

0.95::true_val(brand, bataleon); 0.05::true_val(brand, unk_brand).

measured(s1, brand, bataleon).

all_consistent(brand) :- consistent(s1, brand).

evidence(all_consistent(brand)).
query(true_val(brand, bataleon)).
query(true_val(brand, unk_brand)).

0.85::acc(s1, model_name).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values goliath_plus=Goliath_Plus unk_model_name=Unknown
% @importance 1.0

0.95::true_val(model_name, goliath_plus); 0.05::true_val(model_name, unk_model_name).

measured(s1, model_name, goliath_plus).

all_consistent(model_name) :- consistent(s1, model_name).

evidence(all_consistent(model_name)).
query(true_val(model_name, goliath_plus)).
query(true_val(model_name, unk_model_name)).

0.85::acc(s1, model_year).

% @attr model_year
% @type numeric
% @canonical true
% @original_name model_year
% @values v2027=2027 unk_model_year=Unknown
% @importance 1.0

0.95::true_val(model_year, v2027); 0.05::true_val(model_year, unk_model_year).

measured(s1, model_year, v2027).

all_consistent(model_year) :- consistent(s1, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, v2027)).
query(true_val(model_year, unk_model_year)).

0.75::acc(s2, product_type).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.85

0.90::true_val(product_type, snowboard); 0.10::true_val(product_type, unk_product_type).

measured(s2, product_type, snowboard).

all_consistent(product_type) :- consistent(s2, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

0.85::acc(s1, board_category).
0.80::acc(s3, board_category).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain=All_Mountain unk_board_category=Unknown
% @importance 0.975

0.95::true_val(board_category, all_mountain); 0.05::true_val(board_category, unk_board_category).

measured(s1, board_category, all_mountain).
measured(s3, board_category, all_mountain).

all_consistent(board_category) :-
    consistent(s1, board_category),
    (indep(s1), consistent(s1, board_category) ; \+indep(s1)).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain)).
query(true_val(board_category, unk_board_category)).

0.93::acc(s4, gender).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.6

0.93::true_val(gender, mens); 0.07::true_val(gender, unk_gender).

measured(s4, gender, mens).

all_consistent(gender) :- consistent(s4, gender).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

0.70::acc(s5, brand_founding_year).
0.68::acc(s6, brand_founding_year).

% @attr brand_founding_year
% @type numeric
% @canonical false
% @original_name Brand founding year
% @values v2001=2001 v2000=2000
% @importance 0.325

0.52::true_val(brand_founding_year, v2001); 0.48::true_val(brand_founding_year, v2000).

measured(s5, brand_founding_year, v2001).
measured(s6, brand_founding_year, v2000).

all_consistent(brand_founding_year) :-
    consistent(s5, brand_founding_year),
    consistent(s6, brand_founding_year).

evidence(all_consistent(brand_founding_year)).
query(true_val(brand_founding_year, v2001)).
query(true_val(brand_founding_year, v2000)).

0.55::acc(s7, company_headquarters).

% @attr company_headquarters
% @type categorical
% @canonical false
% @original_name Company headquarters
% @values amsterdam=Amsterdam unk_company_headquarters=Unknown
% @importance 0.5

0.80::true_val(company_headquarters, amsterdam); 0.20::true_val(company_headquarters, unk_company_headquarters).

measured(s7, company_headquarters, amsterdam).

all_consistent(company_headquarters) :- consistent(s7, company_headquarters).

evidence(all_consistent(company_headquarters)).
query(true_val(company_headquarters, amsterdam)).
query(true_val(company_headquarters, unk_company_headquarters)).

0.75::acc(s8, parent_company).

% @attr parent_company
% @type categorical
% @canonical false
% @original_name Parent company
% @values nidecker_group=Nidecker_Group unk_parent_company=Unknown
% @importance 0.4

0.90::true_val(parent_company, nidecker_group); 0.10::true_val(parent_company, unk_parent_company).

measured(s8, parent_company, nidecker_group).

all_consistent(parent_company) :- consistent(s8, parent_company).

evidence(all_consistent(parent_company)).
query(true_val(parent_company, nidecker_group)).
query(true_val(parent_company, unk_parent_company)).

0.88::acc(s9, nidecker_group_portfolio).

% @attr nidecker_group_portfolio
% @type categorical
% @canonical false
% @original_name Nidecker Group portfolio
% @values confirmed_brands=Bataleon_Emerica_eS_Etnies_Jones_Nidecker_Rome_Thirtytwo_YES unk_nidecker_group_portfolio=Unknown
% @importance 0.35

0.90::true_val(nidecker_group_portfolio, confirmed_brands); 0.10::true_val(nidecker_group_portfolio, unk_nidecker_group_portfolio).

measured(s9, nidecker_group_portfolio, confirmed_brands).

all_consistent(nidecker_group_portfolio) :- consistent(s9, nidecker_group_portfolio).

evidence(all_consistent(nidecker_group_portfolio)).
query(true_val(nidecker_group_portfolio, confirmed_brands)).
query(true_val(nidecker_group_portfolio, unk_nidecker_group_portfolio)).

0.85::acc(s10, tbt_heritage).

% @attr tbt_heritage
% @type categorical
% @canonical false
% @original_name 3BT heritage
% @values over_20_years=Over_20_years_3D_snowboard_tech unk_tbt_heritage=Unknown
% @importance 0.7

0.88::true_val(tbt_heritage, over_20_years); 0.12::true_val(tbt_heritage, unk_tbt_heritage).

measured(s10, tbt_heritage, over_20_years).

all_consistent(tbt_heritage) :- consistent(s10, tbt_heritage).

evidence(all_consistent(tbt_heritage)).
query(true_val(tbt_heritage, over_20_years)).
query(true_val(tbt_heritage, unk_tbt_heritage)).

0.55::acc(s11, manufacturing_location_prior).
0.50::acc(s7, manufacturing_location_prior).
0.60::acc(s12, manufacturing_location_prior).

% @attr manufacturing_location_prior
% @type categorical
% @canonical true
% @original_name Manufacturing location (current)
% @values austria=Austria china_or_saudi=China_or_Saudi_Arabia
% @importance 0.467

0.30::true_val(manufacturing_location_prior, austria); 0.70::true_val(manufacturing_location_prior, china_or_saudi).

measured(s11, manufacturing_location_prior, austria).
measured(s7, manufacturing_location_prior, china_or_saudi).
measured(s12, manufacturing_location_prior, austria).

all_consistent(manufacturing_location_prior) :-
    consistent(s11, manufacturing_location_prior),
    consistent(s7, manufacturing_location_prior),
    consistent(s12, manufacturing_location_prior).

evidence(all_consistent(manufacturing_location_prior)).
query(true_val(manufacturing_location_prior, austria)).
query(true_val(manufacturing_location_prior, china_or_saudi)).

0.65::acc(s13, model_first_available_year).

% @attr model_first_available_year
% @type numeric
% @canonical true
% @original_name model_first_available_year
% @values v2004=2004 unk_model_first_available_year=Unknown
% @importance 0.35

0.70::true_val(model_first_available_year, v2004); 0.30::true_val(model_first_available_year, unk_model_first_available_year).

measured(s13, model_first_available_year, v2004).

all_consistent(model_first_available_year) :- consistent(s13, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, v2004)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

0.80::acc(s14, goliath_plus_first_year).

% @attr goliath_plus_first_year
% @type numeric
% @canonical false
% @original_name Goliath+ variant first year
% @values v2022=2022 unk_goliath_plus_first_year=Unknown
% @importance 0.8

0.82::true_val(goliath_plus_first_year, v2022); 0.18::true_val(goliath_plus_first_year, unk_goliath_plus_first_year).

measured(s14, goliath_plus_first_year, v2022).

all_consistent(goliath_plus_first_year) :- consistent(s14, goliath_plus_first_year).

evidence(all_consistent(goliath_plus_first_year)).
query(true_val(goliath_plus_first_year, v2022)).
query(true_val(goliath_plus_first_year, unk_goliath_plus_first_year)).

0.80::acc(s15, bestseller_status).

% @attr bestseller_status
% @type categorical
% @canonical false
% @original_name Bestseller status
% @values perennial_bestseller=Perennial_bestseller_3D_revolution unk_bestseller_status=Unknown
% @importance 0.75

0.82::true_val(bestseller_status, perennial_bestseller); 0.18::true_val(bestseller_status, unk_bestseller_status).

measured(s15, bestseller_status, perennial_bestseller).

all_consistent(bestseller_status) :- consistent(s15, bestseller_status).

evidence(all_consistent(bestseller_status)).
query(true_val(bestseller_status, perennial_bestseller)).
query(true_val(bestseller_status, unk_bestseller_status)).

0.85::acc(s1, availability_status).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values preorder=Preorder unk_availability_status=Unknown
% @importance 1.0

0.90::true_val(availability_status, preorder); 0.10::true_val(availability_status, unk_availability_status).

measured(s1, availability_status, preorder).

all_consistent(availability_status) :- consistent(s1, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, preorder)).
query(true_val(availability_status, unk_availability_status)).

0.85::acc(s1, estimated_availability_date).
0.70::acc(s16, estimated_availability_date).

% @attr estimated_availability_date
% @type categorical
% @canonical true
% @original_name estimated_availability_date
% @values may_2026=May_1_2026 unk_estimated_availability_date=Unknown
% @importance 0.85

0.95::true_val(estimated_availability_date, may_2026); 0.05::true_val(estimated_availability_date, unk_estimated_availability_date).

measured(s1, estimated_availability_date, may_2026).
measured(s16, estimated_availability_date, may_2026).

all_consistent(estimated_availability_date) :-
    consistent(s1, estimated_availability_date),
    (indep(s16), consistent(s16, estimated_availability_date) ; \+indep(s16)).

evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, may_2026)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

0.72::acc(s17, availability_status_s2as).

% @attr availability_status_s2as
% @type categorical
% @canonical false
% @original_name Availability — S2AS
% @values available_680_usd=Available_680_USD unk_availability_status_s2as=Unknown
% @importance 0.9

0.82::true_val(availability_status_s2as, available_680_usd); 0.18::true_val(availability_status_s2as, unk_availability_status_s2as).

measured(s17, availability_status_s2as, available_680_usd).

all_consistent(availability_status_s2as) :-
    (indep(s17), consistent(s17, availability_status_s2as) ; \+indep(s17)).

evidence(all_consistent(availability_status_s2as)).
query(true_val(availability_status_s2as, available_680_usd)).
query(true_val(availability_status_s2as, unk_availability_status_s2as)).

0.72::acc(s18, availability_status_snowboard_shop).

% @attr availability_status_snowboard_shop
% @type categorical
% @canonical false
% @original_name Availability — The Snowboard Shop
% @values backordered=Backordered unk_availability_status_snowboard_shop=Unknown
% @importance 0.8

0.82::true_val(availability_status_snowboard_shop, backordered); 0.18::true_val(availability_status_snowboard_shop, unk_availability_status_snowboard_shop).

measured(s18, availability_status_snowboard_shop, backordered).

all_consistent(availability_status_snowboard_shop) :-
    (indep(s18), consistent(s18, availability_status_snowboard_shop) ; \+indep(s18)).

evidence(all_consistent(availability_status_snowboard_shop)).
query(true_val(availability_status_snowboard_shop, backordered)).
query(true_val(availability_status_snowboard_shop, unk_availability_status_snowboard_shop)).

0.70::acc(s19, availability_status_gravity_coalition).

% @attr availability_status_gravity_coalition
% @type categorical
% @canonical false
% @original_name Availability — Gravity Coalition
% @values prior_year_discounted=Prior_year_554_97_USD unk_availability_status_gravity_coalition=Unknown
% @importance 0.95

0.75::true_val(availability_status_gravity_coalition, prior_year_discounted); 0.25::true_val(availability_status_gravity_coalition, unk_availability_status_gravity_coalition).

measured(s19, availability_status_gravity_coalition, prior_year_discounted).

all_consistent(availability_status_gravity_coalition) :- consistent(s19, availability_status_gravity_coalition).

evidence(all_consistent(availability_status_gravity_coalition)).
query(true_val(availability_status_gravity_coalition, prior_year_discounted)).
query(true_val(availability_status_gravity_coalition, unk_availability_status_gravity_coalition)).

0.78::acc(s20, availability_status_evo).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name Availability — evo
% @values in_stock_2026=In_stock_2026_model unk_availability_status_evo=Unknown
% @importance 0.85

0.82::true_val(availability_status_evo, in_stock_2026); 0.18::true_val(availability_status_evo, unk_availability_status_evo).

measured(s20, availability_status_evo, in_stock_2026).

all_consistent(availability_status_evo) :- consistent(s20, availability_status_evo).

evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, in_stock_2026)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

0.70::acc(s21, availability_status_melbourne).

% @attr availability_status_melbourne
% @type categorical
% @canonical false
% @original_name Availability — Melbourne Snowboard
% @values listed=Listed_2027 unk_availability_status_melbourne=Unknown
% @importance 0.65

0.80::true_val(availability_status_melbourne, listed); 0.20::true_val(availability_status_melbourne, unk_availability_status_melbourne).

measured(s21, availability_status_melbourne, listed).

all_consistent(availability_status_melbourne) :-
    (indep(s21), consistent(s21, availability_status_melbourne) ; \+indep(s21)).

evidence(all_consistent(availability_status_melbourne)).
query(true_val(availability_status_melbourne, listed)).
query(true_val(availability_status_melbourne, unk_availability_status_melbourne)).

0.70::acc(s16, layby_available).

% @attr layby_available
% @type categorical
% @canonical false
% @original_name Lay-by available
% @values yes_balmoral=Yes_Balmoral_Boards unk_layby_available=Unknown
% @importance 0.7

0.80::true_val(layby_available, yes_balmoral); 0.20::true_val(layby_available, unk_layby_available).

measured(s16, layby_available, yes_balmoral).

all_consistent(layby_available) :-
    (indep(s16), consistent(s16, layby_available) ; \+indep(s16)).

evidence(all_consistent(layby_available)).
query(true_val(layby_available, yes_balmoral)).
query(true_val(layby_available, unk_layby_available)).

0.85::acc(s1, shipping_restriction).

% @attr shipping_restriction
% @type categorical
% @canonical false
% @original_name Shipping restriction
% @values australia_only=Australia_only unk_shipping_restriction=Unknown
% @importance 1.0

0.85::true_val(shipping_restriction, australia_only); 0.15::true_val(shipping_restriction, unk_shipping_restriction).

measured(s1, shipping_restriction, australia_only).

all_consistent(shipping_restriction) :- consistent(s1, shipping_restriction).

evidence(all_consistent(shipping_restriction)).
query(true_val(shipping_restriction, australia_only)).
query(true_val(shipping_restriction, unk_shipping_restriction)).

0.85::acc(s1, price_aud_merchant).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical false
% @original_name price_aud_merchant
% @values v1199_99=1199.99 unk_price_aud_merchant=Unknown
% @importance 1.0

0.85::true_val(price_aud_merchant, v1199_99); 0.15::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s1, price_aud_merchant, v1199_99).

all_consistent(price_aud_merchant) :- consistent(s1, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v1199_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

0.75::acc(s17, price_usd_s2as).

% @attr price_usd_s2as
% @type numeric
% @unit USD
% @canonical false
% @original_name USD price — S2AS
% @values v680=680.0 unk_price_usd_s2as=Unknown
% @importance 0.9

0.82::true_val(price_usd_s2as, v680); 0.18::true_val(price_usd_s2as, unk_price_usd_s2as).

measured(s17, price_usd_s2as, v680).

all_consistent(price_usd_s2as) :-
    (indep(s17), consistent(s17, price_usd_s2as) ; \+indep(s17)).

evidence(all_consistent(price_usd_s2as)).
query(true_val(price_usd_s2as, v680)).
query(true_val(price_usd_s2as, unk_price_usd_s2as)).

0.88::acc(s1, flex_rating_10).
0.72::acc(s17, flex_rating_10).
0.75::acc(s20, flex_rating_10).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v7=7.0 v8=8.0
% @importance 0.933

0.80::true_val(flex_rating_10, v7); 0.20::true_val(flex_rating_10, v8).

measured(s1, flex_rating_10, v7).
measured(s17, flex_rating_10, v7).
measured(s20, flex_rating_10, v8).

all_consistent(flex_rating_10) :-
    consistent(s1, flex_rating_10),
    (indep(s17), consistent(s17, flex_rating_10) ; \+indep(s17)),
    consistent(s20, flex_rating_10).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v7)).
query(true_val(flex_rating_10, v8)).

0.85::acc(s1, flex_feel).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values mid_stiff=Mid_stiff_balanced unk_flex_feel=Unknown
% @importance 1.0

0.85::true_val(flex_feel, mid_stiff); 0.15::true_val(flex_feel, unk_flex_feel).

measured(s1, flex_feel, mid_stiff).

all_consistent(flex_feel) :- consistent(s1, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, mid_stiff)).
query(true_val(flex_feel, unk_flex_feel)).

0.88::acc(s1, rider_level).
0.78::acc(s20, rider_level).
0.72::acc(s17, rider_level).
0.80::acc(s14, rider_level).
0.72::acc(s23, rider_level).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values advanced=Advanced advanced_expert=Advanced_Expert intermediate_plus=Intermediate_to_Advanced
% @importance 0.87

0.45::true_val(rider_level, advanced); 0.25::true_val(rider_level, advanced_expert); 0.30::true_val(rider_level, intermediate_plus).

measured(s1, rider_level, advanced).
measured(s20, rider_level, advanced_expert).
measured(s17, rider_level, intermediate_plus).
measured(s14, rider_level, intermediate_plus).
measured(s23, rider_level, intermediate_plus).

all_consistent(rider_level) :-
    consistent(s1, rider_level),
    consistent(s20, rider_level),
    (indep(s17), consistent(s17, rider_level) ; \+indep(s17)),
    consistent(s14, rider_level),
    consistent(s23, rider_level).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, advanced)).
query(true_val(rider_level, advanced_expert)).
query(true_val(rider_level, intermediate_plus)).

0.88::acc(s1, shape).
0.72::acc(s18, shape).
0.72::acc(s23, shape).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values directional_twin=Directional_Twin unk_shape=Unknown
% @importance 0.9

0.95::true_val(shape, directional_twin); 0.05::true_val(shape, unk_shape).

measured(s1, shape, directional_twin).
measured(s18, shape, directional_twin).
measured(s23, shape, directional_twin).

all_consistent(shape) :-
    consistent(s1, shape),
    (indep(s18), consistent(s18, shape) ; \+indep(s18)),
    consistent(s23, shape).

evidence(all_consistent(shape)).
query(true_val(shape, directional_twin)).
query(true_val(shape, unk_shape)).

0.88::acc(s1, camber_type).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values medium_camber_3bt_sidekick=Medium_Camber_3BT_SideKick unk_camber_type=Unknown
% @importance 1.0

0.85::true_val(camber_type, medium_camber_3bt_sidekick); 0.15::true_val(camber_type, unk_camber_type).

measured(s1, camber_type, medium_camber_3bt_sidekick).

all_consistent(camber_type) :- consistent(s1, camber_type).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, medium_camber_3bt_sidekick)).
query(true_val(camber_type, unk_camber_type)).

0.88::acc(s1, nose_sidebase_uplift).

% @attr nose_sidebase_uplift
% @type categorical
% @canonical false
% @original_name Nose sidebase uplift
% @values low=Low unk_nose_sidebase_uplift=Unknown
% @importance 1.0

0.85::true_val(nose_sidebase_uplift, low); 0.15::true_val(nose_sidebase_uplift, unk_nose_sidebase_uplift).

measured(s1, nose_sidebase_uplift, low).

all_consistent(nose_sidebase_uplift) :- consistent(s1, nose_sidebase_uplift).

evidence(all_consistent(nose_sidebase_uplift)).
query(true_val(nose_sidebase_uplift, low)).
query(true_val(nose_sidebase_uplift, unk_nose_sidebase_uplift)).

0.88::acc(s1, tail_sidebase_uplift).

% @attr tail_sidebase_uplift
% @type categorical
% @canonical false
% @original_name Tail sidebase uplift
% @values low=Low unk_tail_sidebase_uplift=Unknown
% @importance 1.0

0.85::true_val(tail_sidebase_uplift, low); 0.15::true_val(tail_sidebase_uplift, unk_tail_sidebase_uplift).

measured(s1, tail_sidebase_uplift, low).

all_consistent(tail_sidebase_uplift) :- consistent(s1, tail_sidebase_uplift).

evidence(all_consistent(tail_sidebase_uplift)).
query(true_val(tail_sidebase_uplift, low)).
query(true_val(tail_sidebase_uplift, unk_tail_sidebase_uplift)).

0.88::acc(s1, width_options).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_and_wide=Standard_Wide unk_width_options=Unknown
% @importance 1.0

0.85::true_val(width_options, standard_and_wide); 0.15::true_val(width_options, unk_width_options).

measured(s1, width_options, standard_and_wide).

all_consistent(width_options) :- consistent(s1, width_options).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

0.88::acc(s1, mounting_pattern).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 1.0

0.85::true_val(mounting_pattern, inserts_2x4); 0.15::true_val(mounting_pattern, unk_mounting_pattern).

measured(s1, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :- consistent(s1, mounting_pattern).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

0.88::acc(s1, additional_inserts).

% @attr additional_inserts
% @type categorical
% @canonical false
% @original_name Additional inserts
% @values backseat_2_inserts=Plus_2_Backseat_Inserts_4cm_behind unk_additional_inserts=Unknown
% @importance 1.0

0.85::true_val(additional_inserts, backseat_2_inserts); 0.15::true_val(additional_inserts, unk_additional_inserts).

measured(s1, additional_inserts, backseat_2_inserts).

all_consistent(additional_inserts) :- consistent(s1, additional_inserts).

evidence(all_consistent(additional_inserts)).
query(true_val(additional_inserts, backseat_2_inserts)).
query(true_val(additional_inserts, unk_additional_inserts)).

0.88::acc(s1, available_sizes).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values six_sizes=153_156_159_158W_161W_164W unk_available_sizes=Unknown
% @importance 1.0

0.85::true_val(available_sizes, six_sizes); 0.15::true_val(available_sizes, unk_available_sizes).

measured(s1, available_sizes, six_sizes).

all_consistent(available_sizes) :- consistent(s1, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, six_sizes)).
query(true_val(available_sizes, unk_available_sizes)).

0.78::acc(s22, flex_comparison_vs_goliath).

% @attr flex_comparison_vs_goliath
% @type categorical
% @canonical false
% @original_name Flex comparison — regular Goliath
% @values significantly_stiffer=Significantly_stiffer_than_regular_Goliath unk_flex_comparison_vs_goliath=Unknown
% @importance 0.9

0.82::true_val(flex_comparison_vs_goliath, significantly_stiffer); 0.18::true_val(flex_comparison_vs_goliath, unk_flex_comparison_vs_goliath).

measured(s22, flex_comparison_vs_goliath, significantly_stiffer).

all_consistent(flex_comparison_vs_goliath) :- consistent(s22, flex_comparison_vs_goliath).

evidence(all_consistent(flex_comparison_vs_goliath)).
query(true_val(flex_comparison_vs_goliath, significantly_stiffer)).
query(true_val(flex_comparison_vs_goliath, unk_flex_comparison_vs_goliath)).

0.88::acc(s1, tbt_technology).
0.90::acc(s24, tbt_technology).

% @attr tbt_technology
% @type categorical
% @canonical false
% @original_name 3BT
% @values triple_base_tech=Triple_Base_Technology_reduces_edge_catch unk_tbt_technology=Unknown
% @importance 0.975

0.95::true_val(tbt_technology, triple_base_tech); 0.05::true_val(tbt_technology, unk_tbt_technology).

measured(s1, tbt_technology, triple_base_tech).
measured(s24, tbt_technology, triple_base_tech).

all_consistent(tbt_technology) :-
    consistent(s1, tbt_technology),
    consistent(s24, tbt_technology).

evidence(all_consistent(tbt_technology)).
query(true_val(tbt_technology, triple_base_tech)).
query(true_val(tbt_technology, unk_tbt_technology)).

0.88::acc(s1, sidekick_technology).
0.72::acc(s18, sidekick_technology).

% @attr sidekick_technology
% @type categorical
% @canonical false
% @original_name SideKick
% @values sidekick_hull=Amplified_sidebase_uplift_hull_shape unk_sidekick_technology=Unknown
% @importance 0.9

0.95::true_val(sidekick_technology, sidekick_hull); 0.05::true_val(sidekick_technology, unk_sidekick_technology).

measured(s1, sidekick_technology, sidekick_hull).
measured(s18, sidekick_technology, sidekick_hull).

all_consistent(sidekick_technology) :-
    consistent(s1, sidekick_technology),
    (indep(s18), consistent(s18, sidekick_technology) ; \+indep(s18)).

evidence(all_consistent(sidekick_technology)).
query(true_val(sidekick_technology, sidekick_hull)).
query(true_val(sidekick_technology, unk_sidekick_technology)).

0.88::acc(s1, core_material).
0.90::acc(s24, core_material).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values super_ultra_light=Super_Ultra_Light_Core unk_core_material=Unknown
% @importance 0.975

0.95::true_val(core_material, super_ultra_light); 0.05::true_val(core_material, unk_core_material).

measured(s1, core_material, super_ultra_light).
measured(s24, core_material, super_ultra_light).

all_consistent(core_material) :-
    consistent(s1, core_material),
    consistent(s24, core_material).

evidence(all_consistent(core_material)).
query(true_val(core_material, super_ultra_light)).
query(true_val(core_material, unk_core_material)).

0.88::acc(s1, core_material_blend_ratio).

% @attr core_material_blend_ratio
% @type categorical
% @canonical false
% @original_name core_material_blend_ratio
% @values p80_p20=80pct_Paulownia_20pct_Poplar unk_core_material_blend_ratio=Unknown
% @importance 1.0

0.85::true_val(core_material_blend_ratio, p80_p20); 0.15::true_val(core_material_blend_ratio, unk_core_material_blend_ratio).

measured(s1, core_material_blend_ratio, p80_p20).

all_consistent(core_material_blend_ratio) :- consistent(s1, core_material_blend_ratio).

evidence(all_consistent(core_material_blend_ratio)).
query(true_val(core_material_blend_ratio, p80_p20)).
query(true_val(core_material_blend_ratio, unk_core_material_blend_ratio)).

0.88::acc(s1, laminate).
0.70::acc(s25, laminate).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values triax_carbon_drst_aramid=Tri_Ax_Carbon_Stringers_DRST_Aramid_XPly unk_laminate=Unknown
% @importance 0.85

0.95::true_val(laminate, triax_carbon_drst_aramid); 0.05::true_val(laminate, unk_laminate).

measured(s1, laminate, triax_carbon_drst_aramid).
measured(s25, laminate, triax_carbon_drst_aramid).

all_consistent(laminate) :-
    consistent(s1, laminate),
    (indep(s25), consistent(s25, laminate) ; \+indep(s25)).

evidence(all_consistent(laminate)).
query(true_val(laminate, triax_carbon_drst_aramid)).
query(true_val(laminate, unk_laminate)).

0.70::acc(s25, carbon_stringers).

% @attr carbon_stringers
% @type categorical
% @canonical false
% @original_name Carbon stringers
% @values present=Carbon_stringers_pop_edge_control unk_carbon_stringers=Unknown
% @importance 0.7

0.80::true_val(carbon_stringers, present); 0.20::true_val(carbon_stringers, unk_carbon_stringers).

measured(s25, carbon_stringers, present).

all_consistent(carbon_stringers) :-
    (indep(s25), consistent(s25, carbon_stringers) ; \+indep(s25)).

evidence(all_consistent(carbon_stringers)).
query(true_val(carbon_stringers, present)).
query(true_val(carbon_stringers, unk_carbon_stringers)).

0.88::acc(s1, construction_material_innovation).
0.90::acc(s24, construction_material_innovation).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values drst=DRST_Dual_Radial_SuperTubes_six_hollow_carbon unk_construction_material_innovation=Unknown
% @importance 0.975

0.95::true_val(construction_material_innovation, drst); 0.05::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s1, construction_material_innovation, drst).
measured(s24, construction_material_innovation, drst).

all_consistent(construction_material_innovation) :-
    consistent(s1, construction_material_innovation),
    consistent(s24, construction_material_innovation).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, drst)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

0.88::acc(s1, construction_aramid_xply).
0.90::acc(s24, construction_aramid_xply).

% @attr construction_aramid_xply
% @type categorical
% @canonical false
% @original_name construction_material_innovation — Aramid X-Ply
% @values aramid_xply=Aramid_XPly_diamond_weave_Kevlar_torsional unk_construction_aramid_xply=Unknown
% @importance 0.975

0.95::true_val(construction_aramid_xply, aramid_xply); 0.05::true_val(construction_aramid_xply, unk_construction_aramid_xply).

measured(s1, construction_aramid_xply, aramid_xply).
measured(s24, construction_aramid_xply, aramid_xply).

all_consistent(construction_aramid_xply) :-
    consistent(s1, construction_aramid_xply),
    consistent(s24, construction_aramid_xply).

evidence(all_consistent(construction_aramid_xply)).
query(true_val(construction_aramid_xply, aramid_xply)).
query(true_val(construction_aramid_xply, unk_construction_aramid_xply)).

0.88::acc(s1, sidewall_material).
0.90::acc(s24, sidewall_material).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values flex_walls=Flex_Walls_urethane_bonded_to_core unk_sidewall_material=Unknown
% @importance 0.975

0.95::true_val(sidewall_material, flex_walls); 0.05::true_val(sidewall_material, unk_sidewall_material).

measured(s1, sidewall_material, flex_walls).
measured(s24, sidewall_material, flex_walls).

all_consistent(sidewall_material) :-
    consistent(s1, sidewall_material),
    consistent(s24, sidewall_material).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, flex_walls)).
query(true_val(sidewall_material, unk_sidewall_material)).

0.88::acc(s1, base_material).
0.90::acc(s26, base_material).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values nano_speed_s=Nano_Speed_S_ISOSPORT_7000_sintered unk_base_material=Unknown
% @importance 0.925

0.95::true_val(base_material, nano_speed_s); 0.05::true_val(base_material, unk_base_material).

measured(s1, base_material, nano_speed_s).
measured(s26, base_material, nano_speed_s).

all_consistent(base_material) :-
    consistent(s1, base_material),
    consistent(s26, base_material).

evidence(all_consistent(base_material)).
query(true_val(base_material, nano_speed_s)).
query(true_val(base_material, unk_base_material)).

0.88::acc(s1, construction_airride).
0.90::acc(s26, construction_airride).

% @attr construction_airride
% @type categorical
% @canonical false
% @original_name construction_material_innovation — AirRide
% @values airride=AirRide_urethane_channels_suspension unk_construction_airride=Unknown
% @importance 0.925

0.95::true_val(construction_airride, airride); 0.05::true_val(construction_airride, unk_construction_airride).

measured(s1, construction_airride, airride).
measured(s26, construction_airride, airride).

all_consistent(construction_airride) :-
    consistent(s1, construction_airride),
    consistent(s26, construction_airride).

evidence(all_consistent(construction_airride)).
query(true_val(construction_airride, airride)).
query(true_val(construction_airride, unk_construction_airride)).

0.90::acc(s24, insert_material).

% @attr insert_material
% @type categorical
% @canonical false
% @original_name Insert material
% @values german_stainless_steel=A_grade_German_stainless_steel unk_insert_material=Unknown
% @importance 0.95

0.90::true_val(insert_material, german_stainless_steel); 0.10::true_val(insert_material, unk_insert_material).

measured(s24, insert_material, german_stainless_steel).

all_consistent(insert_material) :- consistent(s24, insert_material).

evidence(all_consistent(insert_material)).
query(true_val(insert_material, german_stainless_steel)).
query(true_val(insert_material, unk_insert_material)).

0.72::acc(s18, binding_compatibility).

% @attr binding_compatibility
% @type categorical
% @canonical false
% @original_name Binding compatibility
% @values standard_non_est=Standard_pattern_non_Burton_EST unk_binding_compatibility=Unknown
% @importance 0.8

0.82::true_val(binding_compatibility, standard_non_est); 0.18::true_val(binding_compatibility, unk_binding_compatibility).

measured(s18, binding_compatibility, standard_non_est).

all_consistent(binding_compatibility) :-
    (indep(s18), consistent(s18, binding_compatibility) ; \+indep(s18)).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, standard_non_est)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

0.72::acc(s27, float_ratio).

% @attr float_ratio
% @type numeric
% @unit /100
% @canonical false
% @original_name Float ratio
% @values v62=62.0 unk_float_ratio=Unknown
% @importance 0.6

0.80::true_val(float_ratio, v62); 0.20::true_val(float_ratio, unk_float_ratio).

measured(s27, float_ratio, v62).

all_consistent(float_ratio) :- consistent(s27, float_ratio).

evidence(all_consistent(float_ratio)).
query(true_val(float_ratio, v62)).
query(true_val(float_ratio, unk_float_ratio)).

0.88::acc(s1, effective_edge_153).

% @attr effective_edge_153
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 153cm
% @values v117_9=117.9 unk_effective_edge_153=Unknown
% @importance 1.0

0.85::true_val(effective_edge_153, v117_9); 0.15::true_val(effective_edge_153, unk_effective_edge_153).

measured(s1, effective_edge_153, v117_9).

all_consistent(effective_edge_153) :- consistent(s1, effective_edge_153).

evidence(all_consistent(effective_edge_153)).
query(true_val(effective_edge_153, v117_9)).
query(true_val(effective_edge_153, unk_effective_edge_153)).

0.88::acc(s1, tip_tail_width_size_153).

% @attr tip_tail_width_size_153
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size 153cm
% @values v29_5=29.5 unk_tip_tail_width_size_153=Unknown
% @importance 1.0

0.85::true_val(tip_tail_width_size_153, v29_5); 0.15::true_val(tip_tail_width_size_153, unk_tip_tail_width_size_153).

measured(s1, tip_tail_width_size_153, v29_5).

all_consistent(tip_tail_width_size_153) :- consistent(s1, tip_tail_width_size_153).

evidence(all_consistent(tip_tail_width_size_153)).
query(true_val(tip_tail_width_size_153, v29_5)).
query(true_val(tip_tail_width_size_153, unk_tip_tail_width_size_153)).

0.88::acc(s1, waist_width_153).

% @attr waist_width_153
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 153cm
% @values v25_2=25.2 unk_waist_width_153=Unknown
% @importance 1.0

0.85::true_val(waist_width_153, v25_2); 0.15::true_val(waist_width_153, unk_waist_width_153).

measured(s1, waist_width_153, v25_2).

all_consistent(waist_width_153) :- consistent(s1, waist_width_153).

evidence(all_consistent(waist_width_153)).
query(true_val(waist_width_153, v25_2)).
query(true_val(waist_width_153, unk_waist_width_153)).

0.88::acc(s1, sidecut_radius_size_153).

% @attr sidecut_radius_size_153
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size 153cm
% @values v7_7=7.7 unk_sidecut_radius_size_153=Unknown
% @importance 1.0

0.85::true_val(sidecut_radius_size_153, v7_7); 0.15::true_val(sidecut_radius_size_153, unk_sidecut_radius_size_153).

measured(s1, sidecut_radius_size_153, v7_7).

all_consistent(sidecut_radius_size_153) :- consistent(s1, sidecut_radius_size_153).

evidence(all_consistent(sidecut_radius_size_153)).
query(true_val(sidecut_radius_size_153, v7_7)).
query(true_val(sidecut_radius_size_153, unk_sidecut_radius_size_153)).

0.88::acc(s1, stance_width_range_size_153).

% @attr stance_width_range_size_153
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size 153cm
% @values v53_0=53.0 unk_stance_width_range_size_153=Unknown
% @importance 1.0

0.85::true_val(stance_width_range_size_153, v53_0); 0.15::true_val(stance_width_range_size_153, unk_stance_width_range_size_153).

measured(s1, stance_width_range_size_153, v53_0).

all_consistent(stance_width_range_size_153) :- consistent(s1, stance_width_range_size_153).

evidence(all_consistent(stance_width_range_size_153)).
query(true_val(stance_width_range_size_153, v53_0)).
query(true_val(stance_width_range_size_153, unk_stance_width_range_size_153)).

0.88::acc(s1, recommended_weight_range_size_153).

% @attr recommended_weight_range_size_153
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size 153cm
% @values r59_79=59_79kg unk_recommended_weight_range_size_153=Unknown
% @importance 1.0

0.85::true_val(recommended_weight_range_size_153, r59_79); 0.15::true_val(recommended_weight_range_size_153, unk_recommended_weight_range_size_153).

measured(s1, recommended_weight_range_size_153, r59_79).

all_consistent(recommended_weight_range_size_153) :- consistent(s1, recommended_weight_range_size_153).

evidence(all_consistent(recommended_weight_range_size_153)).
query(true_val(recommended_weight_range_size_153, r59_79)).
query(true_val(recommended_weight_range_size_153, unk_recommended_weight_range_size_153)).

0.88::acc(s1, effective_edge_156).

% @attr effective_edge_156
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 156cm
% @values v120_2=120.2 unk_effective_edge_156=Unknown
% @importance 1.0

0.85::true_val(effective_edge_156, v120_2); 0.15::true_val(effective_edge_156, unk_effective_edge_156).

measured(s1, effective_edge_156, v120_2).

all_consistent(effective_edge_156) :- consistent(s1, effective_edge_156).

evidence(all_consistent(effective_edge_156)).
query(true_val(effective_edge_156, v120_2)).
query(true_val(effective_edge_156, unk_effective_edge_156)).

0.88::acc(s1, tip_tail_width_size).

% @attr tip_tail_width_size
% @type numeric
% @unit cm
% @canonical true
% @original_name tip_tail_width_size
% @values v29_8=29.8 unk_tip_tail_width_size=Unknown
% @importance 1.0

0.85::true_val(tip_tail_width_size, v29_8); 0.15::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s1, tip_tail_width_size, v29_8).

all_consistent(tip_tail_width_size) :- consistent(s1, tip_tail_width_size).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v29_8)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

0.88::acc(s1, waist_width_156).

% @attr waist_width_156
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 156cm
% @values v25_4=25.4 unk_waist_width_156=Unknown
% @importance 1.0

0.85::true_val(waist_width_156, v25_4); 0.15::true_val(waist_width_156, unk_waist_width_156).

measured(s1, waist_width_156, v25_4).

all_consistent(waist_width_156) :- consistent(s1, waist_width_156).

evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v25_4)).
query(true_val(waist_width_156, unk_waist_width_156)).

0.88::acc(s1, sidecut_radius_size).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size
% @values v7_9=7.9 unk_sidecut_radius_size=Unknown
% @importance 1.0

0.85::true_val(sidecut_radius_size, v7_9); 0.15::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s1, sidecut_radius_size, v7_9).

all_consistent(sidecut_radius_size) :- consistent(s1, sidecut_radius_size).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_9)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

0.88::acc(s1, stance_width_range_size).

% @attr stance_width_range_size
% @type numeric
% @unit cm
% @canonical true
% @original_name stance_width_range_size
% @values v55_0=55.0 unk_stance_width_range_size=Unknown
% @importance 1.0

0.85::true_val(stance_width_range_size, v55_0); 0.15::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s1, stance_width_range_size, v55_0).

all_consistent(stance_width_range_size) :- consistent(s1, stance_width_range_size).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v55_0)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

0.88::acc(s1, recommended_weight_range_size).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size
% @values r65_85=65_85kg unk_recommended_weight_range_size=Unknown
% @importance 1.0

0.85::true_val(recommended_weight_range_size, r65_85); 0.15::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s1, recommended_weight_range_size, r65_85).

all_consistent(recommended_weight_range_size) :- consistent(s1, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, r65_85)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

0.88::acc(s1, effective_edge_159).

% @attr effective_edge_159
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 159cm
% @values v122_5=122.5 unk_effective_edge_159=Unknown
% @importance 1.0

0.85::true_val(effective_edge_159, v122_5); 0.15::true_val(effective_edge_159, unk_effective_edge_159).

measured(s1, effective_edge_159, v122_5).

all_consistent(effective_edge_159) :- consistent(s1, effective_edge_159).

evidence(all_consistent(effective_edge_159)).
query(true_val(effective_edge_159, v122_5)).
query(true_val(effective_edge_159, unk_effective_edge_159)).

0.88::acc(s1, tip_tail_width_size_159).

% @attr tip_tail_width_size_159
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size 159cm
% @values v30_1=30.1 unk_tip_tail_width_size_159=Unknown
% @importance 1.0

0.85::true_val(tip_tail_width_size_159, v30_1); 0.15::true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159).

measured(s1, tip_tail_width_size_159, v30_1).

all_consistent(tip_tail_width_size_159) :- consistent(s1, tip_tail_width_size_159).

evidence(all_consistent(tip_tail_width_size_159)).
query(true_val(tip_tail_width_size_159, v30_1)).
query(true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159)).

0.88::acc(s1, waist_width_159).

% @attr waist_width_159
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 159cm
% @values v25_6=25.6 unk_waist_width_159=Unknown
% @importance 1.0

0.85::true_val(waist_width_159, v25_6); 0.15::true_val(waist_width_159, unk_waist_width_159).

measured(s1, waist_width_159, v25_6).

all_consistent(waist_width_159) :- consistent(s1, waist_width_159).

evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v25_6)).
query(true_val(waist_width_159, unk_waist_width_159)).

0.88::acc(s1, sidecut_radius_size_159).

% @attr sidecut_radius_size_159
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size 159cm
% @values v8_0=8.0 unk_sidecut_radius_size_159=Unknown
% @importance 1.0

0.85::true_val(sidecut_radius_size_159, v8_0); 0.15::true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159).

measured(s1, sidecut_radius_size_159, v8_0).

all_consistent(sidecut_radius_size_159) :- consistent(s1, sidecut_radius_size_159).

evidence(all_consistent(sidecut_radius_size_159)).
query(true_val(sidecut_radius_size_159, v8_0)).
query(true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159)).

0.88::acc(s1, stance_width_range_size_159).

% @attr stance_width_range_size_159
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size 159cm
% @values v56_0=56.0 unk_stance_width_range_size_159=Unknown
% @importance 1.0

0.85::true_val(stance_width_range_size_159, v56_0); 0.15::true_val(stance_width_range_size_159, unk_stance_width_range_size_159).

measured(s1, stance_width_range_size_159, v56_0).

all_consistent(stance_width_range_size_159) :- consistent(s1, stance_width_range_size_159).

evidence(all_consistent(stance_width_range_size_159)).
query(true_val(stance_width_range_size_159, v56_0)).
query(true_val(stance_width_range_size_159, unk_stance_width_range_size_159)).

0.88::acc(s1, recommended_weight_range_size_159).

% @attr recommended_weight_range_size_159
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size 159cm
% @values r71_91=71_91kg unk_recommended_weight_range_size_159=Unknown
% @importance 1.0

0.85::true_val(recommended_weight_range_size_159, r71_91); 0.15::true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159).

measured(s1, recommended_weight_range_size_159, r71_91).

all_consistent(recommended_weight_range_size_159) :- consistent(s1, recommended_weight_range_size_159).

evidence(all_consistent(recommended_weight_range_size_159)).
query(true_val(recommended_weight_range_size_159, r71_91)).
query(true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159)).

0.88::acc(s1, effective_edge_158w).

% @attr effective_edge_158w
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 158W
% @values v121_7=121.7 unk_effective_edge_158w=Unknown
% @importance 1.0

0.85::true_val(effective_edge_158w, v121_7); 0.15::true_val(effective_edge_158w, unk_effective_edge_158w).

measured(s1, effective_edge_158w, v121_7).

all_consistent(effective_edge_158w) :- consistent(s1, effective_edge_158w).

evidence(all_consistent(effective_edge_158w)).
query(true_val(effective_edge_158w, v121_7)).
query(true_val(effective_edge_158w, unk_effective_edge_158w)).

0.88::acc(s1, tip_tail_width_size_158w).

% @attr tip_tail_width_size_158w
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size 158W
% @values v31_0=31.0 unk_tip_tail_width_size_158w=Unknown
% @importance 1.0

0.85::true_val(tip_tail_width_size_158w, v31_0); 0.15::true_val(tip_tail_width_size_158w, unk_tip_tail_width_size_158w).

measured(s1, tip_tail_width_size_158w, v31_0).

all_consistent(tip_tail_width_size_158w) :- consistent(s1, tip_tail_width_size_158w).

evidence(all_consistent(tip_tail_width_size_158w)).
query(true_val(tip_tail_width_size_158w, v31_0)).
query(true_val(tip_tail_width_size_158w, unk_tip_tail_width_size_158w)).

0.88::acc(s1, waist_width_158w).

% @attr waist_width_158w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 158W
% @values v26_6=26.6 unk_waist_width_158w=Unknown
% @importance 1.0

0.85::true_val(waist_width_158w, v26_6); 0.15::true_val(waist_width_158w, unk_waist_width_158w).

measured(s1, waist_width_158w, v26_6).

all_consistent(waist_width_158w) :- consistent(s1, waist_width_158w).

evidence(all_consistent(waist_width_158w)).
query(true_val(waist_width_158w, v26_6)).
query(true_val(waist_width_158w, unk_waist_width_158w)).

0.88::acc(s1, sidecut_radius_size_158w).

% @attr sidecut_radius_size_158w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size 158W
% @values v7_9=7.9 unk_sidecut_radius_size_158w=Unknown
% @importance 1.0

0.85::true_val(sidecut_radius_size_158w, v7_9); 0.15::true_val(sidecut_radius_size_158w, unk_sidecut_radius_size_158w).

measured(s1, sidecut_radius_size_158w, v7_9).

all_consistent(sidecut_radius_size_158w) :- consistent(s1, sidecut_radius_size_158w).

evidence(all_consistent(sidecut_radius_size_158w)).
query(true_val(sidecut_radius_size_158w, v7_9)).
query(true_val(sidecut_radius_size_158w, unk_sidecut_radius_size_158w)).

0.88::acc(s1, stance_width_range_size_158w).

% @attr stance_width_range_size_158w
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size 158W
% @values v55_0=55.0 unk_stance_width_range_size_158w=Unknown
% @importance 1.0

0.85::true_val(stance_width_range_size_158w, v55_0); 0.15::true_val(stance_width_range_size_158w, unk_stance_width_range_size_158w).

measured(s1, stance_width_range_size_158w, v55_0).

all_consistent(stance_width_range_size_158w) :- consistent(s1, stance_width_range_size_158w).

evidence(all_consistent(stance_width_range_size_158w)).
query(true_val(stance_width_range_size_158w, v55_0)).
query(true_val(stance_width_range_size_158w, unk_stance_width_range_size_158w)).

0.88::acc(s1, recommended_weight_range_size_158w).

% @attr recommended_weight_range_size_158w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size 158W
% @values r76_96=76_96kg unk_recommended_weight_range_size_158w=Unknown
% @importance 1.0

0.85::true_val(recommended_weight_range_size_158w, r76_96); 0.15::true_val(recommended_weight_range_size_158w, unk_recommended_weight_range_size_158w).

measured(s1, recommended_weight_range_size_158w, r76_96).

all_consistent(recommended_weight_range_size_158w) :- consistent(s1, recommended_weight_range_size_158w).

evidence(all_consistent(recommended_weight_range_size_158w)).
query(true_val(recommended_weight_range_size_158w, r76_96)).
query(true_val(recommended_weight_range_size_158w, unk_recommended_weight_range_size_158w)).

0.88::acc(s1, effective_edge_161w).

% @attr effective_edge_161w
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 161W
% @values v124_0=124.0 unk_effective_edge_161w=Unknown
% @importance 1.0

0.85::true_val(effective_edge_161w, v124_0); 0.15::true_val(effective_edge_161w, unk_effective_edge_161w).

measured(s1, effective_edge_161w, v124_0).

all_consistent(effective_edge_161w) :- consistent(s1, effective_edge_161w).

evidence(all_consistent(effective_edge_161w)).
query(true_val(effective_edge_161w, v124_0)).
query(true_val(effective_edge_161w, unk_effective_edge_161w)).

0.88::acc(s1, tip_tail_width_size_161w).

% @attr tip_tail_width_size_161w
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size 161W
% @values v31_3=31.3 unk_tip_tail_width_size_161w=Unknown
% @importance 1.0

0.85::true_val(tip_tail_width_size_161w, v31_3); 0.15::true_val(tip_tail_width_size_161w, unk_tip_tail_width_size_161w).

measured(s1, tip_tail_width_size_161w, v31_3).

all_consistent(tip_tail_width_size_161w) :- consistent(s1, tip_tail_width_size_161w).

evidence(all_consistent(tip_tail_width_size_161w)).
query(true_val(tip_tail_width_size_161w, v31_3)).
query(true_val(tip_tail_width_size_161w, unk_tip_tail_width_size_161w)).

0.88::acc(s1, waist_width_161w).

% @attr waist_width_161w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 161W
% @values v26_8=26.8 unk_waist_width_161w=Unknown
% @importance 1.0

0.85::true_val(waist_width_161w, v26_8); 0.15::true_val(waist_width_161w, unk_waist_width_161w).

measured(s1, waist_width_161w, v26_8).

all_consistent(waist_width_161w) :- consistent(s1, waist_width_161w).

evidence(all_consistent(waist_width_161w)).
query(true_val(waist_width_161w, v26_8)).
query(true_val(waist_width_161w, unk_waist_width_161w)).

0.88::acc(s1, sidecut_radius_size_161w).

% @attr sidecut_radius_size_161w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size 161W
% @values v8_1=8.1 unk_sidecut_radius_size_161w=Unknown
% @importance 1.0

0.85::true_val(sidecut_radius_size_161w, v8_1); 0.15::true_val(sidecut_radius_size_161w, unk_sidecut_radius_size_161w).

measured(s1, sidecut_radius_size_161w, v8_1).

all_consistent(sidecut_radius_size_161w) :- consistent(s1, sidecut_radius_size_161w).

evidence(all_consistent(sidecut_radius_size_161w)).
query(true_val(sidecut_radius_size_161w, v8_1)).
query(true_val(sidecut_radius_size_161w, unk_sidecut_radius_size_161w)).

0.88::acc(s1, stance_width_range_size_161w).

% @attr stance_width_range_size_161w
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size 161W
% @values v56_0=56.0 unk_stance_width_range_size_161w=Unknown
% @importance 1.0

0.85::true_val(stance_width_range_size_161w, v56_0); 0.15::true_val(stance_width_range_size_161w, unk_stance_width_range_size_161w).

measured(s1, stance_width_range_size_161w, v56_0).

all_consistent(stance_width_range_size_161w) :- consistent(s1, stance_width_range_size_161w).

evidence(all_consistent(stance_width_range_size_161w)).
query(true_val(stance_width_range_size_161w, v56_0)).
query(true_val(stance_width_range_size_161w, unk_stance_width_range_size_161w)).

0.88::acc(s1, recommended_weight_range_size_161w).

% @attr recommended_weight_range_size_161w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size 161W
% @values r82_102=82_102kg unk_recommended_weight_range_size_161w=Unknown
% @importance 1.0

0.85::true_val(recommended_weight_range_size_161w, r82_102); 0.15::true_val(recommended_weight_range_size_161w, unk_recommended_weight_range_size_161w).

measured(s1, recommended_weight_range_size_161w, r82_102).

all_consistent(recommended_weight_range_size_161w) :- consistent(s1, recommended_weight_range_size_161w).

evidence(all_consistent(recommended_weight_range_size_161w)).
query(true_val(recommended_weight_range_size_161w, r82_102)).
query(true_val(recommended_weight_range_size_161w, unk_recommended_weight_range_size_161w)).

0.88::acc(s1, effective_edge_164w).

% @attr effective_edge_164w
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 164W
% @values v126_3=126.3 unk_effective_edge_164w=Unknown
% @importance 1.0

0.85::true_val(effective_edge_164w, v126_3); 0.15::true_val(effective_edge_164w, unk_effective_edge_164w).

measured(s1, effective_edge_164w, v126_3).

all_consistent(effective_edge_164w) :- consistent(s1, effective_edge_164w).

evidence(all_consistent(effective_edge_164w)).
query(true_val(effective_edge_164w, v126_3)).
query(true_val(effective_edge_164w, unk_effective_edge_164w)).

0.88::acc(s1, tip_tail_width_size_164w).

% @attr tip_tail_width_size_164w
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size 164W
% @values v31_7=31.7 unk_tip_tail_width_size_164w=Unknown
% @importance 1.0

0.85::true_val(tip_tail_width_size_164w, v31_7); 0.15::true_val(tip_tail_width_size_164w, unk_tip_tail_width_size_164w).

measured(s1, tip_tail_width_size_164w, v31_7).

all_consistent(tip_tail_width_size_164w) :- consistent(s1, tip_tail_width_size_164w).

evidence(all_consistent(tip_tail_width_size_164w)).
query(true_val(tip_tail_width_size_164w, v31_7)).
query(true_val(tip_tail_width_size_164w, unk_tip_tail_width_size_164w)).

0.88::acc(s1, waist_width_164w).

% @attr waist_width_164w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 164W
% @values v27_0=27.0 unk_waist_width_164w=Unknown
% @importance 1.0

0.85::true_val(waist_width_164w, v27_0); 0.15::true_val(waist_width_164w, unk_waist_width_164w).

measured(s1, waist_width_164w, v27_0).

all_consistent(waist_width_164w) :- consistent(s1, waist_width_164w).

evidence(all_consistent(waist_width_164w)).
query(true_val(waist_width_164w, v27_0)).
query(true_val(waist_width_164w, unk_waist_width_164w)).

0.88::acc(s1, sidecut_radius_size_164w).

% @attr sidecut_radius_size_164w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size 164W
% @values v8_2=8.2 unk_sidecut_radius_size_164w=Unknown
% @importance 1.0

0.85::true_val(sidecut_radius_size_164w, v8_2); 0.15::true_val(sidecut_radius_size_164w, unk_sidecut_radius_size_164w).

measured(s1, sidecut_radius_size_164w, v8_2).

all_consistent(sidecut_radius_size_164w) :- consistent(s1, sidecut_radius_size_164w).

evidence(all_consistent(sidecut_radius_size_164w)).
query(true_val(sidecut_radius_size_164w, v8_2)).
query(true_val(sidecut_radius_size_164w, unk_sidecut_radius_size_164w)).

0.88::acc(s1, stance_width_range_size_164w).

% @attr stance_width_range_size_164w
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size 164W
% @values v57_0=57.0 unk_stance_width_range_size_164w=Unknown
% @importance 1.0

0.85::true_val(stance_width_range_size_164w, v57_0); 0.15::true_val(stance_width_range_size_164w, unk_stance_width_range_size_164w).

measured(s1, stance_width_range_size_164w, v57_0).

all_consistent(stance_width_range_size_164w) :- consistent(s1, stance_width_range_size_164w).

evidence(all_consistent(stance_width_range_size_164w)).
query(true_val(stance_width_range_size_164w, v57_0)).
query(true_val(stance_width_range_size_164w, unk_stance_width_range_size_164w)).

0.88::acc(s1, recommended_weight_range_size_164w).

% @attr recommended_weight_range_size_164w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size 164W
% @values r88_108=88_108kg unk_recommended_weight_range_size_164w=Unknown
% @importance 1.0

0.85::true_val(recommended_weight_range_size_164w, r88_108); 0.15::true_val(recommended_weight_range_size_164w, unk_recommended_weight_range_size_164w).

measured(s1, recommended_weight_range_size_164w, r88_108).

all_consistent(recommended_weight_range_size_164w) :- consistent(s1, recommended_weight_range_size_164w).

evidence(all_consistent(recommended_weight_range_size_164w)).
query(true_val(recommended_weight_range_size_164w, r88_108)).
query(true_val(recommended_weight_range_size_164w, unk_recommended_weight_range_size_164w)).

0.88::acc(s1, effective_edge_167w).

% @attr effective_edge_167w
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 167W
% @values v128_6=128.6 unk_effective_edge_167w=Unknown
% @importance 1.0

0.85::true_val(effective_edge_167w, v128_6); 0.15::true_val(effective_edge_167w, unk_effective_edge_167w).

measured(s1, effective_edge_167w, v128_6).

all_consistent(effective_edge_167w) :- consistent(s1, effective_edge_167w).

evidence(all_consistent(effective_edge_167w)).
query(true_val(effective_edge_167w, v128_6)).
query(true_val(effective_edge_167w, unk_effective_edge_167w)).

0.88::acc(s1, tip_tail_width_size_167w).

% @attr tip_tail_width_size_167w
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size 167W
% @values v32_0=32.0 unk_tip_tail_width_size_167w=Unknown
% @importance 1.0

0.85::true_val(tip_tail_width_size_167w, v32_0); 0.15::true_val(tip_tail_width_size_167w, unk_tip_tail_width_size_167w).

measured(s1, tip_tail_width_size_167w, v32_0).

all_consistent(tip_tail_width_size_167w) :- consistent(s1, tip_tail_width_size_167w).

evidence(all_consistent(tip_tail_width_size_167w)).
query(true_val(tip_tail_width_size_167w, v32_0)).
query(true_val(tip_tail_width_size_167w, unk_tip_tail_width_size_167w)).

0.88::acc(s1, waist_width_167w).

% @attr waist_width_167w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 167W
% @values v27_2=27.2 unk_waist_width_167w=Unknown
% @importance 1.0

0.85::true_val(waist_width_167w, v27_2); 0.15::true_val(waist_width_167w, unk_waist_width_167w).

measured(s1, waist_width_167w, v27_2).

all_consistent(waist_width_167w) :- consistent(s1, waist_width_167w).

evidence(all_consistent(waist_width_167w)).
query(true_val(waist_width_167w, v27_2)).
query(true_val(waist_width_167w, unk_waist_width_167w)).

0.88::acc(s1, sidecut_radius_size_167w).

% @attr sidecut_radius_size_167w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size 167W
% @values v8_3=8.3 unk_sidecut_radius_size_167w=Unknown
% @importance 1.0

0.85::true_val(sidecut_radius_size_167w, v8_3); 0.15::true_val(sidecut_radius_size_167w, unk_sidecut_radius_size_167w).

measured(s1, sidecut_radius_size_167w, v8_3).

all_consistent(sidecut_radius_size_167w) :- consistent(s1, sidecut_radius_size_167w).

evidence(all_consistent(sidecut_radius_size_167w)).
query(true_val(sidecut_radius_size_167w, v8_3)).
query(true_val(sidecut_radius_size_167w, unk_sidecut_radius_size_167w)).

0.88::acc(s1, stance_width_range_size_167w).

% @attr stance_width_range_size_167w
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size 167W
% @values v58_0=58.0 unk_stance_width_range_size_167w=Unknown
% @importance 1.0

0.85::true_val(stance_width_range_size_167w, v58_0); 0.15::true_val(stance_width_range_size_167w, unk_stance_width_range_size_167w).

measured(s1, stance_width_range_size_167w, v58_0).

all_consistent(stance_width_range_size_167w) :- consistent(s1, stance_width_range_size_167w).

evidence(all_consistent(stance_width_range_size_167w)).
query(true_val(stance_width_range_size_167w, v58_0)).
query(true_val(stance_width_range_size_167w, unk_stance_width_range_size_167w)).

0.88::acc(s1, recommended_weight_range_size_167w).

% @attr recommended_weight_range_size_167w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size 167W
% @values r94_114=94_114kg unk_recommended_weight_range_size_167w=Unknown
% @importance 1.0

0.85::true_val(recommended_weight_range_size_167w, r94_114); 0.15::true_val(recommended_weight_range_size_167w, unk_recommended_weight_range_size_167w).

measured(s1, recommended_weight_range_size_167w, r94_114).

all_consistent(recommended_weight_range_size_167w) :- consistent(s1, recommended_weight_range_size_167w).

evidence(all_consistent(recommended_weight_range_size_167w)).
query(true_val(recommended_weight_range_size_167w, r94_114)).
query(true_val(recommended_weight_range_size_167w, unk_recommended_weight_range_size_167w)).

0.85::acc(s1, wide_boot_recommendation).

% @attr wide_boot_recommendation
% @type categorical
% @canonical false
% @original_name Wide boot recommendation
% @values uk10_5_plus=UK10_5_or_larger_select_wide unk_wide_boot_recommendation=Unknown
% @importance 1.0

0.85::true_val(wide_boot_recommendation, uk10_5_plus); 0.15::true_val(wide_boot_recommendation, unk_wide_boot_recommendation).

measured(s1, wide_boot_recommendation, uk10_5_plus).

all_consistent(wide_boot_recommendation) :- consistent(s1, wide_boot_recommendation).

evidence(all_consistent(wide_boot_recommendation)).
query(true_val(wide_boot_recommendation, uk10_5_plus)).
query(true_val(wide_boot_recommendation, unk_wide_boot_recommendation)).

0.93::acc(s28, warranty_period_years).

% @attr warranty_period_years
% @type numeric
% @unit years
% @canonical true
% @original_name warranty_period_years
% @values v2=2.0 unk_warranty_period_years=Unknown
% @importance 0.75

0.93::true_val(warranty_period_years, v2); 0.07::true_val(warranty_period_years, unk_warranty_period_years).

measured(s28, warranty_period_years, v2).

all_consistent(warranty_period_years) :- consistent(s28, warranty_period_years).

evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v2)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

0.93::acc(s29, warranty_extended).

% @attr warranty_extended
% @type categorical
% @canonical false
% @original_name Warranty extended (2+1)
% @values three_year_with_registration=3yr_with_newsletter_registration unk_warranty_extended=Unknown
% @importance 0.7

0.93::true_val(warranty_extended, three_year_with_registration); 0.07::true_val(warranty_extended, unk_warranty_extended).

measured(s29, warranty_extended, three_year_with_registration).

all_consistent(warranty_extended) :- consistent(s29, warranty_extended).

evidence(all_consistent(warranty_extended)).
query(true_val(warranty_extended, three_year_with_registration)).
query(true_val(warranty_extended, unk_warranty_extended)).

0.85::acc(s10, return_policy).

% @attr return_policy
% @type categorical
% @canonical false
% @original_name Returns policy
% @values d45_return=45_day_return_policy unk_return_policy=Unknown
% @importance 0.7

0.85::true_val(return_policy, d45_return); 0.15::true_val(return_policy, unk_return_policy).

measured(s10, return_policy, d45_return).

all_consistent(return_policy) :- consistent(s10, return_policy).

evidence(all_consistent(return_policy)).
query(true_val(return_policy, d45_return)).
query(true_val(return_policy, unk_return_policy)).

0.82::acc(s19, pop_performance).

% @attr pop_performance
% @type categorical
% @canonical false
% @original_name Pop
% @values exceptional=Exceptional_best_Bataleon_pop unk_pop_performance=Unknown
% @importance 0.95

0.82::true_val(pop_performance, exceptional); 0.18::true_val(pop_performance, unk_pop_performance).

measured(s19, pop_performance, exceptional).

all_consistent(pop_performance) :- consistent(s19, pop_performance).

evidence(all_consistent(pop_performance)).
query(true_val(pop_performance, exceptional)).
query(true_val(pop_performance, unk_pop_performance)).

0.82::acc(s19, catch_free_ride).

% @attr catch_free_ride
% @type categorical
% @canonical false
% @original_name Catch-free ride
% @values very_catch_free=Very_catch_free_retains_camber_power unk_catch_free_ride=Unknown
% @importance 0.95

0.82::true_val(catch_free_ride, very_catch_free); 0.18::true_val(catch_free_ride, unk_catch_free_ride).

measured(s19, catch_free_ride, very_catch_free).

all_consistent(catch_free_ride) :- consistent(s19, catch_free_ride).

evidence(all_consistent(catch_free_ride)).
query(true_val(catch_free_ride, very_catch_free)).
query(true_val(catch_free_ride, unk_catch_free_ride)).

0.82::acc(s19, buttering_performance).

% @attr buttering_performance
% @type categorical
% @canonical false
% @original_name Buttering
% @values excellent=Excellent_flat_tip_tail_locks_in unk_buttering_performance=Unknown
% @importance 0.95

0.82::true_val(buttering_performance, excellent); 0.18::true_val(buttering_performance, unk_buttering_performance).

measured(s19, buttering_performance, excellent).

all_consistent(buttering_performance) :- consistent(s19, buttering_performance).

evidence(all_consistent(buttering_performance)).
query(true_val(buttering_performance, excellent)).
query(true_val(buttering_performance, unk_buttering_performance)).

0.75::acc(s23, versatility).

% @attr versatility
% @type categorical
% @canonical false
% @original_name Versatility — one-board quiver
% @values one_board_quiver=Do_it_all_one_board_quiver unk_versatility=Unknown
% @importance 0.9

0.80::true_val(versatility, one_board_quiver); 0.20::true_val(versatility, unk_versatility).

measured(s23, versatility, one_board_quiver).

all_consistent(versatility) :- consistent(s23, versatility).

evidence(all_consistent(versatility)).
query(true_val(versatility, one_board_quiver)).
query(true_val(versatility, unk_versatility)).

0.82::acc(s19, freestyle_capability).

% @attr freestyle_capability
% @type categorical
% @canonical false
% @original_name Freestyle capability
% @values special_for_jumping=Pretty_special_for_jumping unk_freestyle_capability=Unknown
% @importance 0.95

0.82::true_val(freestyle_capability, special_for_jumping); 0.18::true_val(freestyle_capability, unk_freestyle_capability).

measured(s19, freestyle_capability, special_for_jumping).

all_consistent(freestyle_capability) :- consistent(s19, freestyle_capability).

evidence(all_consistent(freestyle_capability)).
query(true_val(freestyle_capability, special_for_jumping)).
query(true_val(freestyle_capability, unk_freestyle_capability)).

0.78::acc(s22, switch_riding).
0.72::acc(s18, switch_riding).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name Switch riding
% @values rides_switch_well=Rides_switch_incredibly_well_not_true_twin unk_switch_riding=Unknown
% @importance 0.85

0.90::true_val(switch_riding, rides_switch_well); 0.10::true_val(switch_riding, unk_switch_riding).

measured(s22, switch_riding, rides_switch_well).
measured(s18, switch_riding, rides_switch_well).

all_consistent(switch_riding) :-
    consistent(s22, switch_riding),
    (indep(s18), consistent(s18, switch_riding) ; \+indep(s18)).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, rides_switch_well)).
query(true_val(switch_riding, unk_switch_riding)).

0.78::acc(s22, powder_float).

% @attr powder_float
% @type categorical
% @canonical false
% @original_name Powder float
% @values good_float=Good_float_TBT_helps_especially_set_back unk_powder_float=Unknown
% @importance 0.9

0.80::true_val(powder_float, good_float); 0.20::true_val(powder_float, unk_powder_float).

measured(s22, powder_float, good_float).

all_consistent(powder_float) :- consistent(s22, powder_float).

evidence(all_consistent(powder_float)).
query(true_val(powder_float, good_float)).
query(true_val(powder_float, unk_powder_float)).

0.50::acc(s34, user_review_light_feel).

% @attr user_review_light_feel
% @type categorical
% @canonical false
% @original_name User review — light feel
% @values super_light=Super_light_easy_to_turn_stable unk_user_review_light_feel=Unknown
% @importance 0.65

0.70::true_val(user_review_light_feel, super_light); 0.30::true_val(user_review_light_feel, unk_user_review_light_feel).

measured(s34, user_review_light_feel, super_light).

all_consistent(user_review_light_feel) :- consistent(s34, user_review_light_feel).

evidence(all_consistent(user_review_light_feel)).
query(true_val(user_review_light_feel, super_light)).
query(true_val(user_review_light_feel, unk_user_review_light_feel)).

0.82::acc(s14, user_review_whitelines_plus).

% @attr user_review_whitelines_plus
% @type categorical
% @canonical false
% @original_name User review — Whitelines on the Plus
% @values lighter_faster_reactive=Lighter_faster_more_reactive_core unk_user_review_whitelines_plus=Unknown
% @importance 0.8

0.82::true_val(user_review_whitelines_plus, lighter_faster_reactive); 0.18::true_val(user_review_whitelines_plus, unk_user_review_whitelines_plus).

measured(s14, user_review_whitelines_plus, lighter_faster_reactive).

all_consistent(user_review_whitelines_plus) :- consistent(s14, user_review_whitelines_plus).

evidence(all_consistent(user_review_whitelines_plus)).
query(true_val(user_review_whitelines_plus, lighter_faster_reactive)).
query(true_val(user_review_whitelines_plus, unk_user_review_whitelines_plus)).

0.75::acc(s23, carving_moderate_speeds).

% @attr carving_moderate_speeds
% @type categorical
% @canonical false
% @original_name Carving (moderate speeds)
% @values good_moderate_not_high=Good_moderate_slow_not_high_speed unk_carving_moderate_speeds=Unknown
% @importance 0.9

0.78::true_val(carving_moderate_speeds, good_moderate_not_high); 0.22::true_val(carving_moderate_speeds, unk_carving_moderate_speeds).

measured(s23, carving_moderate_speeds, good_moderate_not_high).

all_consistent(carving_moderate_speeds) :- consistent(s23, carving_moderate_speeds).

evidence(all_consistent(carving_moderate_speeds)).
query(true_val(carving_moderate_speeds, good_moderate_not_high)).
query(true_val(carving_moderate_speeds, unk_carving_moderate_speeds)).

0.82::acc(s19, uneven_snow_performance).

% @attr uneven_snow_performance
% @type categorical
% @canonical false
% @original_name Uneven snow performance
% @values poor_bucks_bounces=Poor_bucks_and_bounces_unsettling unk_uneven_snow_performance=Unknown
% @importance 0.95

0.82::true_val(uneven_snow_performance, poor_bucks_bounces); 0.18::true_val(uneven_snow_performance, unk_uneven_snow_performance).

measured(s19, uneven_snow_performance, poor_bucks_bounces).

all_consistent(uneven_snow_performance) :- consistent(s19, uneven_snow_performance).

evidence(all_consistent(uneven_snow_performance)).
query(true_val(uneven_snow_performance, poor_bucks_bounces)).
query(true_val(uneven_snow_performance, unk_uneven_snow_performance)).

0.78::acc(s22, edge_hold_limitation).
0.40::acc(s30, edge_hold_limitation).

% @attr edge_hold_limitation
% @type categorical
% @canonical false
% @original_name Edge hold limitation
% @values limited_edge_hold=Limited_worse_than_Goliath_in_uneven_snow unk_edge_hold_limitation=Unknown
% @importance 0.85

0.85::true_val(edge_hold_limitation, limited_edge_hold); 0.15::true_val(edge_hold_limitation, unk_edge_hold_limitation).

measured(s22, edge_hold_limitation, limited_edge_hold).
measured(s30, edge_hold_limitation, limited_edge_hold).

all_consistent(edge_hold_limitation) :-
    consistent(s22, edge_hold_limitation),
    consistent(s30, edge_hold_limitation).

evidence(all_consistent(edge_hold_limitation)).
query(true_val(edge_hold_limitation, limited_edge_hold)).
query(true_val(edge_hold_limitation, unk_edge_hold_limitation)).

0.78::acc(s22, hard_snow_challenge).

% @attr hard_snow_challenge
% @type categorical
% @canonical false
% @original_name Hard snow challenge
% @values most_challenging=Most_challenging_3BT_board_hard_snow unk_hard_snow_challenge=Unknown
% @importance 0.9

0.80::true_val(hard_snow_challenge, most_challenging); 0.20::true_val(hard_snow_challenge, unk_hard_snow_challenge).

measured(s22, hard_snow_challenge, most_challenging).

all_consistent(hard_snow_challenge) :- consistent(s22, hard_snow_challenge).

evidence(all_consistent(hard_snow_challenge)).
query(true_val(hard_snow_challenge, most_challenging)).
query(true_val(hard_snow_challenge, unk_hard_snow_challenge)).

0.82::acc(s19, center_weighted_requirement).

% @attr center_weighted_requirement
% @type categorical
% @canonical false
% @original_name Center-weighted requirement
% @values must_ride_centered=Must_ride_center_weighted_to_engage unk_center_weighted_requirement=Unknown
% @importance 0.95

0.82::true_val(center_weighted_requirement, must_ride_centered); 0.18::true_val(center_weighted_requirement, unk_center_weighted_requirement).

measured(s19, center_weighted_requirement, must_ride_centered).

all_consistent(center_weighted_requirement) :- consistent(s19, center_weighted_requirement).

evidence(all_consistent(center_weighted_requirement)).
query(true_val(center_weighted_requirement, must_ride_centered)).
query(true_val(center_weighted_requirement, unk_center_weighted_requirement)).

0.75::acc(s23, tbt_carve_adjustment).

% @attr tbt_carve_adjustment
% @type categorical
% @canonical false
% @original_name 3BT carve adjustment
% @values different_engagement=Different_edge_engagement_point_lower unk_tbt_carve_adjustment=Unknown
% @importance 0.9

0.78::true_val(tbt_carve_adjustment, different_engagement); 0.22::true_val(tbt_carve_adjustment, unk_tbt_carve_adjustment).

measured(s23, tbt_carve_adjustment, different_engagement).

all_consistent(tbt_carve_adjustment) :- consistent(s23, tbt_carve_adjustment).

evidence(all_consistent(tbt_carve_adjustment)).
query(true_val(tbt_carve_adjustment, different_engagement)).
query(true_val(tbt_carve_adjustment, unk_tbt_carve_adjustment)).

0.75::acc(s23, key_competitor).

% @attr key_competitor
% @type categorical
% @canonical false
% @original_name Key competitor
% @values jones_mountain_twin=Jones_Mountain_Twin_better_hard_icy unk_key_competitor=Unknown
% @importance 0.9

0.78::true_val(key_competitor, jones_mountain_twin); 0.22::true_val(key_competitor, unk_key_competitor).

measured(s23, key_competitor, jones_mountain_twin).

all_consistent(key_competitor) :- consistent(s23, key_competitor).

evidence(all_consistent(key_competitor)).
query(true_val(key_competitor, jones_mountain_twin)).
query(true_val(key_competitor, unk_key_competitor)).

0.78::acc(s19, competitor_list_good_ride).

% @attr competitor_list_good_ride
% @type categorical
% @canonical false
% @original_name Competitor list from The Good Ride
% @values tgr_list=Korua_Otto_Ride_Algorythm_Salomon_Highpath_etc unk_competitor_list_good_ride=Unknown
% @importance 0.95

0.80::true_val(competitor_list_good_ride, tgr_list); 0.20::true_val(competitor_list_good_ride, unk_competitor_list_good_ride).

measured(s19, competitor_list_good_ride, tgr_list).

all_consistent(competitor_list_good_ride) :- consistent(s19, competitor_list_good_ride).

evidence(all_consistent(competitor_list_good_ride)).
query(true_val(competitor_list_good_ride, tgr_list)).
query(true_val(competitor_list_good_ride, unk_competitor_list_good_ride)).

0.75::acc(s23, competitor_list_snowboarding_profiles).

% @attr competitor_list_snowboarding_profiles
% @type categorical
% @canonical false
% @original_name Alternative competitor recommendations
% @values sp_list=Jones_Frontier_Mountain_Twin_YES_Standard_GNU_4x4_Arbor_Shiloh unk_competitor_list_snowboarding_profiles=Unknown
% @importance 0.9

0.78::true_val(competitor_list_snowboarding_profiles, sp_list); 0.22::true_val(competitor_list_snowboarding_profiles, unk_competitor_list_snowboarding_profiles).

measured(s23, competitor_list_snowboarding_profiles, sp_list).

all_consistent(competitor_list_snowboarding_profiles) :- consistent(s23, competitor_list_snowboarding_profiles).

evidence(all_consistent(competitor_list_snowboarding_profiles)).
query(true_val(competitor_list_snowboarding_profiles, sp_list)).
query(true_val(competitor_list_snowboarding_profiles, unk_competitor_list_snowboarding_profiles)).

0.80::acc(s31, regular_goliath_vs_plus).

% @attr regular_goliath_vs_plus
% @type categorical
% @canonical false
% @original_name Regular Goliath vs Goliath+
% @values plus_for_advanced=Advanced_riders_specced_up_plus_version unk_regular_goliath_vs_plus=Unknown
% @importance 0.7

0.80::true_val(regular_goliath_vs_plus, plus_for_advanced); 0.20::true_val(regular_goliath_vs_plus, unk_regular_goliath_vs_plus).

measured(s31, regular_goliath_vs_plus, plus_for_advanced).

all_consistent(regular_goliath_vs_plus) :- consistent(s31, regular_goliath_vs_plus).

evidence(all_consistent(regular_goliath_vs_plus)).
query(true_val(regular_goliath_vs_plus, plus_for_advanced)).
query(true_val(regular_goliath_vs_plus, unk_regular_goliath_vs_plus)).

0.80::acc(s15, regular_goliath_pricing).

% @attr regular_goliath_pricing
% @type numeric
% @unit USD
% @canonical false
% @original_name Regular Goliath pricing reference
% @values v629=629.0 unk_regular_goliath_pricing=Unknown
% @importance 0.75

0.80::true_val(regular_goliath_pricing, v629); 0.20::true_val(regular_goliath_pricing, unk_regular_goliath_pricing).

measured(s15, regular_goliath_pricing, v629).

all_consistent(regular_goliath_pricing) :- consistent(s15, regular_goliath_pricing).

evidence(all_consistent(regular_goliath_pricing)).
query(true_val(regular_goliath_pricing, v629)).
query(true_val(regular_goliath_pricing, unk_regular_goliath_pricing)).

0.88::acc(s1, terrain).
0.70::acc(s25, terrain).
0.72::acc(s32, terrain).
0.72::acc(s23, terrain).

% @attr terrain
% @type categorical
% @canonical false
% @original_name Terrain
% @values park_resort_powder_all_mountain=Park_Resort_Powder_All_Mountain unk_terrain=Unknown
% @importance 0.838

0.95::true_val(terrain, park_resort_powder_all_mountain); 0.05::true_val(terrain, unk_terrain).

measured(s1, terrain, park_resort_powder_all_mountain).
measured(s25, terrain, park_resort_powder_all_mountain).
measured(s32, terrain, park_resort_powder_all_mountain).
measured(s23, terrain, park_resort_powder_all_mountain).

all_consistent(terrain) :-
    consistent(s1, terrain),
    (indep(s25), consistent(s25, terrain) ; \+indep(s25)),
    (indep(s32), consistent(s32, terrain) ; \+indep(s32)),
    consistent(s23, terrain).

evidence(all_consistent(terrain)).
query(true_val(terrain, park_resort_powder_all_mountain)).
query(true_val(terrain, unk_terrain)).

0.85::acc(s33, whitelines_100_selection).

% @attr whitelines_100_selection
% @type categorical
% @canonical false
% @original_name Whitelines 100 selection
% @values selected_2022_23=Selected_Whitelines_100_2022_23 unk_whitelines_100_selection=Unknown
% @importance 0.7

0.85::true_val(whitelines_100_selection, selected_2022_23); 0.15::true_val(whitelines_100_selection, unk_whitelines_100_selection).

measured(s33, whitelines_100_selection, selected_2022_23).

all_consistent(whitelines_100_selection) :- consistent(s33, whitelines_100_selection).

evidence(all_consistent(whitelines_100_selection)).
query(true_val(whitelines_100_selection, selected_2022_23)).
query(true_val(whitelines_100_selection, unk_whitelines_100_selection)).

0.82::acc(s14, whitelines_verdict).

% @attr whitelines_verdict
% @type categorical
% @canonical false
% @original_name Whitelines verdict
% @values comfortable_fast_reactive=Comfortable_faster_more_reactive_ride unk_whitelines_verdict=Unknown
% @importance 0.8

0.82::true_val(whitelines_verdict, comfortable_fast_reactive); 0.18::true_val(whitelines_verdict, unk_whitelines_verdict).

measured(s14, whitelines_verdict, comfortable_fast_reactive).

all_consistent(whitelines_verdict) :- consistent(s14, whitelines_verdict).

evidence(all_consistent(whitelines_verdict)).
query(true_val(whitelines_verdict, comfortable_fast_reactive)).
query(true_val(whitelines_verdict, unk_whitelines_verdict)).

0.82::acc(s19, good_ride_verdict).

% @attr good_ride_verdict
% @type categorical
% @canonical false
% @original_name The Good Ride overall verdict
% @values otherworldly_pop_limited_edge=Otherworldly_pop_limited_edge_hold unk_good_ride_verdict=Unknown
% @importance 0.95

0.82::true_val(good_ride_verdict, otherworldly_pop_limited_edge); 0.18::true_val(good_ride_verdict, unk_good_ride_verdict).

measured(s19, good_ride_verdict, otherworldly_pop_limited_edge).

all_consistent(good_ride_verdict) :- consistent(s19, good_ride_verdict).

evidence(all_consistent(good_ride_verdict)).
query(true_val(good_ride_verdict, otherworldly_pop_limited_edge)).
query(true_val(good_ride_verdict, unk_good_ride_verdict)).

0.45::acc(s34, negative_customer_service).

% @attr negative_customer_service
% @type categorical
% @canonical false
% @original_name Negative customer service experience
% @values unhelpful_delayed=Unhelpful_unprofessional_delayed_shipping unk_negative_customer_service=Unknown
% @importance 0.65

0.60::true_val(negative_customer_service, unhelpful_delayed); 0.40::true_val(negative_customer_service, unk_negative_customer_service).

measured(s34, negative_customer_service, unhelpful_delayed).

all_consistent(negative_customer_service) :- consistent(s34, negative_customer_service).

evidence(all_consistent(negative_customer_service)).
query(true_val(negative_customer_service, unhelpful_delayed)).
query(true_val(negative_customer_service, unk_negative_customer_service)).

0.35::acc(s35, forum_warranty_concern).

% @attr forum_warranty_concern
% @type categorical
% @canonical false
% @original_name Forum warranty concern
% @values frustrating_delamination=Frustrating_warranty_delamination_3_days unk_forum_warranty_concern=Unknown
% @importance 0.7

0.50::true_val(forum_warranty_concern, frustrating_delamination); 0.50::true_val(forum_warranty_concern, unk_forum_warranty_concern).

measured(s35, forum_warranty_concern, frustrating_delamination).

all_consistent(forum_warranty_concern) :- consistent(s35, forum_warranty_concern).

evidence(all_consistent(forum_warranty_concern)).
query(true_val(forum_warranty_concern, frustrating_delamination)).
query(true_val(forum_warranty_concern, unk_forum_warranty_concern)).

0.78::acc(s20, retailer_info_evo).

% @attr retailer_info_evo
% @type categorical
% @canonical false
% @original_name evo.com retailer info
% @values major_us_retailer=Major_US_specialty_1yr_return_price_match unk_retailer_info_evo=Unknown
% @importance 0.85

0.82::true_val(retailer_info_evo, major_us_retailer); 0.18::true_val(retailer_info_evo, unk_retailer_info_evo).

measured(s20, retailer_info_evo, major_us_retailer).

all_consistent(retailer_info_evo) :- consistent(s20, retailer_info_evo).

evidence(all_consistent(retailer_info_evo)).
query(true_val(retailer_info_evo, major_us_retailer)).
query(true_val(retailer_info_evo, unk_retailer_info_evo)).

0.72::acc(s27, retailer_info_s2as).

% @attr retailer_info_s2as
% @type categorical
% @canonical false
% @original_name S2AS retailer info
% @values specialist_uk_15yr=Specialist_UK_15_years_Bataleon_experience unk_retailer_info_s2as=Unknown
% @importance 0.6

0.78::true_val(retailer_info_s2as, specialist_uk_15yr); 0.22::true_val(retailer_info_s2as, unk_retailer_info_s2as).

measured(s27, retailer_info_s2as, specialist_uk_15yr).

all_consistent(retailer_info_s2as) :- consistent(s27, retailer_info_s2as).

evidence(all_consistent(retailer_info_s2as)).
query(true_val(retailer_info_s2as, specialist_uk_15yr)).
query(true_val(retailer_info_s2as, unk_retailer_info_s2as)).

0.72::acc(s18, retailer_info_snowboard_shop).

% @attr retailer_info_snowboard_shop
% @type categorical
% @canonical false
% @original_name The Snowboard Shop retailer info
% @values specialist_uk_test=Specialist_UK_test_majority_items unk_retailer_info_snowboard_shop=Unknown
% @importance 0.8

0.78::true_val(retailer_info_snowboard_shop, specialist_uk_test); 0.22::true_val(retailer_info_snowboard_shop, unk_retailer_info_snowboard_shop).

measured(s18, retailer_info_snowboard_shop, specialist_uk_test).

all_consistent(retailer_info_snowboard_shop) :-
    (indep(s18), consistent(s18, retailer_info_snowboard_shop) ; \+indep(s18)).

evidence(all_consistent(retailer_info_snowboard_shop)).
query(true_val(retailer_info_snowboard_shop, specialist_uk_test)).
query(true_val(retailer_info_snowboard_shop, unk_retailer_info_snowboard_shop)).

0.70::acc(s16, retailer_info_balmoral).

% @attr retailer_info_balmoral
% @type categorical
% @canonical false
% @original_name Balmoral Boards retailer info
% @values aus_specialist_flat_shipping=Australian_specialist_10_flat_rate unk_retailer_info_balmoral=Unknown
% @importance 0.7

0.78::true_val(retailer_info_balmoral, aus_specialist_flat_shipping); 0.22::true_val(retailer_info_balmoral, unk_retailer_info_balmoral).

measured(s16, retailer_info_balmoral, aus_specialist_flat_shipping).

all_consistent(retailer_info_balmoral) :-
    (indep(s16), consistent(s16, retailer_info_balmoral) ; \+indep(s16)).

evidence(all_consistent(retailer_info_balmoral)).
query(true_val(retailer_info_balmoral, aus_specialist_flat_shipping)).
query(true_val(retailer_info_balmoral, unk_retailer_info_balmoral)).

0.70::acc(s19, retailer_info_gravity_coalition).

% @attr retailer_info_gravity_coalition
% @type categorical
% @canonical false
% @original_name Gravity Coalition retailer info
% @values us_affiliate_prior_year=US_affiliate_prior_year_554_97 unk_retailer_info_gravity_coalition=Unknown
% @importance 0.95

0.75::true_val(retailer_info_gravity_coalition, us_affiliate_prior_year); 0.25::true_val(retailer_info_gravity_coalition, unk_retailer_info_gravity_coalition).

measured(s19, retailer_info_gravity_coalition, us_affiliate_prior_year).

all_consistent(retailer_info_gravity_coalition) :- consistent(s19, retailer_info_gravity_coalition).

evidence(all_consistent(retailer_info_gravity_coalition)).
query(true_val(retailer_info_gravity_coalition, us_affiliate_prior_year)).
query(true_val(retailer_info_gravity_coalition, unk_retailer_info_gravity_coalition)).

0.78::acc(s22, model_year_continuity).

% @attr model_year_continuity
% @type categorical
% @canonical false
% @original_name Model year continuity
% @values minimal_changes=Minimal_changes_between_years unk_model_year_continuity=Unknown
% @importance 0.9

0.80::true_val(model_year_continuity, minimal_changes); 0.20::true_val(model_year_continuity, unk_model_year_continuity).

measured(s22, model_year_continuity, minimal_changes).

all_consistent(model_year_continuity) :- consistent(s22, model_year_continuity).

evidence(all_consistent(model_year_continuity)).
query(true_val(model_year_continuity, minimal_changes)).
query(true_val(model_year_continuity, unk_model_year_continuity)).