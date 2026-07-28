0.15::indep(s2).
0.20::indep(s13).
0.20::indep(s18).
0.20::indep(s19).
0.20::indep(s29).
0.15::indep(s31).
0.20::indep(s35).
0.20::indep(s36).
0.20::indep(s37).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

0.93::acc(s1, brand).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values bataleon=Bataleon unk_brand=Unknown
% @importance 1.0

0.92::true_val(brand, bataleon); 0.08::true_val(brand, unk_brand).

measured(s1, brand, bataleon).

all_consistent(brand) :- consistent(s1, brand).

evidence(all_consistent(brand)).
query(true_val(brand, bataleon)).
query(true_val(brand, unk_brand)).

0.93::acc(s1, model_name).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values goliath=Goliath unk_model_name=Unknown
% @importance 1.0

0.92::true_val(model_name, goliath); 0.08::true_val(model_name, unk_model_name).

measured(s1, model_name, goliath).

all_consistent(model_name) :- consistent(s1, model_name).

evidence(all_consistent(model_name)).
query(true_val(model_name, goliath)).
query(true_val(model_name, unk_model_name)).

0.65::acc(s2, model_year).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2027=2027 unk_model_year=Unknown
% @importance 0.95

0.63::true_val(model_year, y2027); 0.37::true_val(model_year, unk_model_year).

measured(s2, model_year, y2027).

all_consistent(model_year) :- consistent(s2, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2027)).
query(true_val(model_year, unk_model_year)).

0.93::acc(s1, product_type).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.92::true_val(product_type, snowboard); 0.08::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).

all_consistent(product_type) :- consistent(s1, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

0.93::acc(s3, gender).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 1.0

0.92::true_val(gender, mens); 0.08::true_val(gender, unk_gender).

measured(s3, gender, mens).

all_consistent(gender) :- consistent(s3, gender).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

0.72::acc(s4, manufacturer).

% @attr manufacturer
% @type categorical
% @canonical false
% @original_name manufacturer
% @values low_pressure_nidecker=Low_Pressure_Studio_Nidecker_Group unk_manufacturer=Unknown
% @importance 0.6

0.71::true_val(manufacturer, low_pressure_nidecker); 0.29::true_val(manufacturer, unk_manufacturer).

measured(s4, manufacturer, low_pressure_nidecker).

all_consistent(manufacturer) :- consistent(s4, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, low_pressure_nidecker)).
query(true_val(manufacturer, unk_manufacturer)).

0.75::acc(s5, brand_founded).
0.55::acc(s6, brand_founded).

% @attr brand_founded
% @type categorical
% @canonical false
% @original_name Brand founded
% @values y2000=2000 y2001=2001
% @importance 0.425

0.64::true_val(brand_founded, y2000); 0.36::true_val(brand_founded, y2001).

measured(s5, brand_founded, y2000).
measured(s6, brand_founded, y2001).

all_consistent(brand_founded) :- consistent(s5, brand_founded), consistent(s6, brand_founded).

evidence(all_consistent(brand_founded)).
query(true_val(brand_founded, y2000)).
query(true_val(brand_founded, y2001)).

0.72::acc(s5, brand_founder).

% @attr brand_founder
% @type categorical
% @canonical false
% @original_name Brand founder
% @values jorgen_karlsen=Jorgen_Karlsen unk_brand_founder=Unknown
% @importance 0.5

0.68::true_val(brand_founder, jorgen_karlsen); 0.32::true_val(brand_founder, unk_brand_founder).

measured(s5, brand_founder, jorgen_karlsen).

all_consistent(brand_founder) :- consistent(s5, brand_founder).

evidence(all_consistent(brand_founder)).
query(true_val(brand_founder, jorgen_karlsen)).
query(true_val(brand_founder, unk_brand_founder)).

0.88::acc(s7, brand_headquarters).

% @attr brand_headquarters
% @type categorical
% @canonical false
% @original_name Brand headquarters
% @values amsterdam_netherlands=Amsterdam_Netherlands unk_brand_headquarters=Unknown
% @importance 0.4

0.81::true_val(brand_headquarters, amsterdam_netherlands); 0.19::true_val(brand_headquarters, unk_brand_headquarters).

measured(s7, brand_headquarters, amsterdam_netherlands).

all_consistent(brand_headquarters) :- consistent(s7, brand_headquarters).

evidence(all_consistent(brand_headquarters)).
query(true_val(brand_headquarters, amsterdam_netherlands)).
query(true_val(brand_headquarters, unk_brand_headquarters)).

0.70::acc(s8, board_design_location).

% @attr board_design_location
% @type categorical
% @canonical false
% @original_name Board design location
% @values lps_amsterdam=Low_Pressure_Studio_Amsterdam unk_board_design_location=Unknown
% @importance 0.45

0.63::true_val(board_design_location, lps_amsterdam); 0.37::true_val(board_design_location, unk_board_design_location).

measured(s8, board_design_location, lps_amsterdam).

all_consistent(board_design_location) :- consistent(s8, board_design_location).

evidence(all_consistent(board_design_location)).
query(true_val(board_design_location, lps_amsterdam)).
query(true_val(board_design_location, unk_board_design_location)).

0.70::acc(s9, manufacturing_location_current).
0.45::acc(s10, manufacturing_location_current).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values austria_mothership=Austria_CAPiTA_Mothership asia_titan_saudi=Asia_Titan_or_Saudi_Arabia
% @importance 0.55

0.75::true_val(manufacturing_location_current, austria_mothership); 0.25::true_val(manufacturing_location_current, asia_titan_saudi).

measured(s9, manufacturing_location_current, austria_mothership).
measured(s10, manufacturing_location_current, asia_titan_saudi).

all_consistent(manufacturing_location_current) :- consistent(s9, manufacturing_location_current), consistent(s10, manufacturing_location_current).

evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, austria_mothership)).
query(true_val(manufacturing_location_current, asia_titan_saudi)).

0.72::acc(s11, manufacturing_location_prior).

% @attr manufacturing_location_prior
% @type categorical
% @canonical false
% @original_name manufacturing_location_prior
% @values elan_austria=Elan_factory_Feistritz_Austria unk_manufacturing_location_prior=Unknown
% @importance 0.35

0.68::true_val(manufacturing_location_prior, elan_austria); 0.32::true_val(manufacturing_location_prior, unk_manufacturing_location_prior).

measured(s11, manufacturing_location_prior, elan_austria).

all_consistent(manufacturing_location_prior) :- consistent(s11, manufacturing_location_prior).

evidence(all_consistent(manufacturing_location_prior)).
query(true_val(manufacturing_location_prior, elan_austria)).
query(true_val(manufacturing_location_prior, unk_manufacturing_location_prior)).

0.78::acc(s12, brand_slogan).

% @attr brand_slogan
% @type categorical
% @canonical false
% @original_name Brand slogan
% @values smile_its_snowboarding=Smile_Its_Snowboarding unk_brand_slogan=Unknown
% @importance 0.2

0.76::true_val(brand_slogan, smile_its_snowboarding); 0.24::true_val(brand_slogan, unk_brand_slogan).

measured(s12, brand_slogan, smile_its_snowboarding).

all_consistent(brand_slogan) :- consistent(s12, brand_slogan).

evidence(all_consistent(brand_slogan)).
query(true_val(brand_slogan, smile_its_snowboarding)).
query(true_val(brand_slogan, unk_brand_slogan)).

0.93::acc(s3, warranty).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values two_plus_one_year=2_plus_1_year_warranty unk_warranty=Unknown
% @importance 1.0

0.92::true_val(warranty, two_plus_one_year); 0.08::true_val(warranty, unk_warranty).

measured(s3, warranty, two_plus_one_year).

all_consistent(warranty) :- consistent(s3, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, two_plus_one_year)).
query(true_val(warranty, unk_warranty)).

0.93::acc(s3, return_policy_terms).

% @attr return_policy_terms
% @type categorical
% @canonical true
% @original_name return_policy_terms
% @values d45_day_returns=45_day_returns unk_return_policy_terms=Unknown
% @importance 1.0

0.92::true_val(return_policy_terms, d45_day_returns); 0.08::true_val(return_policy_terms, unk_return_policy_terms).

measured(s3, return_policy_terms, d45_day_returns).

all_consistent(return_policy_terms) :- consistent(s3, return_policy_terms).

evidence(all_consistent(return_policy_terms)).
query(true_val(return_policy_terms, d45_day_returns)).
query(true_val(return_policy_terms, unk_return_policy_terms)).

0.93::acc(s3, free_shipping_threshold).

% @attr free_shipping_threshold
% @type categorical
% @canonical false
% @original_name Free shipping threshold (Bataleon US)
% @values over_50_usd=Free_shipping_over_50_USD unk_free_shipping_threshold=Unknown
% @importance 1.0

0.92::true_val(free_shipping_threshold, over_50_usd); 0.08::true_val(free_shipping_threshold, unk_free_shipping_threshold).

measured(s3, free_shipping_threshold, over_50_usd).

all_consistent(free_shipping_threshold) :- consistent(s3, free_shipping_threshold).

evidence(all_consistent(free_shipping_threshold)).
query(true_val(free_shipping_threshold, over_50_usd)).
query(true_val(free_shipping_threshold, unk_free_shipping_threshold)).

0.93::acc(s3, model_heritage).

% @attr model_heritage
% @type categorical
% @canonical false
% @original_name Model heritage
% @values launched_3d_revolution=Board_that_launched_3D_revolution unk_model_heritage=Unknown
% @importance 1.0

0.92::true_val(model_heritage, launched_3d_revolution); 0.08::true_val(model_heritage, unk_model_heritage).

measured(s3, model_heritage, launched_3d_revolution).

all_consistent(model_heritage) :- consistent(s3, model_heritage).

evidence(all_consistent(model_heritage)).
query(true_val(model_heritage, launched_3d_revolution)).
query(true_val(model_heritage, unk_model_heritage)).

0.65::acc(s13, model_first_available_year).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values y2004=Approximately_2004 unk_model_first_available_year=Unknown
% @importance 0.7

0.60::true_val(model_first_available_year, y2004); 0.40::true_val(model_first_available_year, unk_model_first_available_year).

measured(s13, model_first_available_year, y2004).

all_consistent(model_first_available_year) :- consistent(s13, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2004)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

0.80::acc(s14, board_archive_earliest_year).

% @attr board_archive_earliest_year
% @type categorical
% @canonical false
% @original_name Board archive on Bataleon.com
% @values season_2004_05=2004_05_season unk_board_archive_earliest_year=Unknown
% @importance 0.5

0.76::true_val(board_archive_earliest_year, season_2004_05); 0.24::true_val(board_archive_earliest_year, unk_board_archive_earliest_year).

measured(s14, board_archive_earliest_year, season_2004_05).

all_consistent(board_archive_earliest_year) :- consistent(s14, board_archive_earliest_year).

evidence(all_consistent(board_archive_earliest_year)).
query(true_val(board_archive_earliest_year, season_2004_05)).
query(true_val(board_archive_earliest_year, unk_board_archive_earliest_year)).

0.80::acc(s15, model_legacy_whitelines_100).

% @attr model_legacy_whitelines_100
% @type categorical
% @canonical false
% @original_name Model legacy (Whitelines 100)
% @values selected=Selected_for_Whitelines_100 unk_model_legacy_whitelines_100=Unknown
% @importance 0.65

0.72::true_val(model_legacy_whitelines_100, selected); 0.28::true_val(model_legacy_whitelines_100, unk_model_legacy_whitelines_100).

measured(s15, model_legacy_whitelines_100, selected).

all_consistent(model_legacy_whitelines_100) :- consistent(s15, model_legacy_whitelines_100).

evidence(all_consistent(model_legacy_whitelines_100)).
query(true_val(model_legacy_whitelines_100, selected)).
query(true_val(model_legacy_whitelines_100, unk_model_legacy_whitelines_100)).

0.82::acc(s16, model_legacy_bestseller).

% @attr model_legacy_bestseller
% @type categorical
% @canonical false
% @original_name Model legacy (bestseller)
% @values perennial_bestseller=Perennial_bestseller unk_model_legacy_bestseller=Unknown
% @importance 0.8

0.72::true_val(model_legacy_bestseller, perennial_bestseller); 0.28::true_val(model_legacy_bestseller, unk_model_legacy_bestseller).

measured(s16, model_legacy_bestseller, perennial_bestseller).

all_consistent(model_legacy_bestseller) :- consistent(s16, model_legacy_bestseller).

evidence(all_consistent(model_legacy_bestseller)).
query(true_val(model_legacy_bestseller, perennial_bestseller)).
query(true_val(model_legacy_bestseller, unk_model_legacy_bestseller)).

0.90::acc(s3, customer_review_rating).

% @attr customer_review_rating
% @type categorical
% @canonical false
% @original_name Customer review rating
% @values pct96_5star_105reviews=96pct_5star_from_105_reviews unk_customer_review_rating=Unknown
% @importance 1.0

0.90::true_val(customer_review_rating, pct96_5star_105reviews); 0.10::true_val(customer_review_rating, unk_customer_review_rating).

measured(s3, customer_review_rating, pct96_5star_105reviews).

all_consistent(customer_review_rating) :- consistent(s3, customer_review_rating).

evidence(all_consistent(customer_review_rating)).
query(true_val(customer_review_rating, pct96_5star_105reviews)).
query(true_val(customer_review_rating, unk_customer_review_rating)).

0.65::acc(s2, board_category).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain=All_Mountain unk_board_category=Unknown
% @importance 0.95

0.63::true_val(board_category, all_mountain); 0.37::true_val(board_category, unk_board_category).

measured(s2, board_category, all_mountain).

all_consistent(board_category) :- consistent(s2, board_category).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain)).
query(true_val(board_category, unk_board_category)).

0.95::acc(s3, shape).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values directional_twin=Directional_Twin unk_shape=Unknown
% @importance 1.0

0.95::true_val(shape, directional_twin); 0.05::true_val(shape, unk_shape).

measured(s3, shape, directional_twin).

all_consistent(shape) :- consistent(s3, shape).

evidence(all_consistent(shape)).
query(true_val(shape, directional_twin)).
query(true_val(shape, unk_shape)).

0.95::acc(s3, camber_type).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values medium_camber_3bt_sidekick=Medium_Camber_with_3BT_and_SideKick unk_camber_type=Unknown
% @importance 1.0

0.95::true_val(camber_type, medium_camber_3bt_sidekick); 0.05::true_val(camber_type, unk_camber_type).

measured(s3, camber_type, medium_camber_3bt_sidekick).

all_consistent(camber_type) :- consistent(s3, camber_type).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, medium_camber_3bt_sidekick)).
query(true_val(camber_type, unk_camber_type)).

0.95::acc(s3, flex_rating_10_manufacturer).
0.65::acc(s13, flex_rating_10_manufacturer).

% @attr flex_rating_10_manufacturer
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10_manufacturer
% @values v6=6.0 unk_flex_rating_10_manufacturer=Unknown
% @importance 0.85

0.95::true_val(flex_rating_10_manufacturer, v6); 0.05::true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer).

measured(s3, flex_rating_10_manufacturer, v6).
measured(s13, flex_rating_10_manufacturer, v6).

all_consistent(flex_rating_10_manufacturer) :-
    consistent(s3, flex_rating_10_manufacturer),
    (indep(s13), consistent(s13, flex_rating_10_manufacturer) ; \+indep(s13)).

evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, v6)).
query(true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer)).

0.93::acc(s3, nose_sidebase_uplift).

% @attr nose_sidebase_uplift
% @type categorical
% @canonical false
% @original_name Nose sidebase uplift
% @values low=Low unk_nose_sidebase_uplift=Unknown
% @importance 1.0

0.92::true_val(nose_sidebase_uplift, low); 0.08::true_val(nose_sidebase_uplift, unk_nose_sidebase_uplift).

measured(s3, nose_sidebase_uplift, low).

all_consistent(nose_sidebase_uplift) :- consistent(s3, nose_sidebase_uplift).

evidence(all_consistent(nose_sidebase_uplift)).
query(true_val(nose_sidebase_uplift, low)).
query(true_val(nose_sidebase_uplift, unk_nose_sidebase_uplift)).

0.93::acc(s3, tail_sidebase_uplift).

% @attr tail_sidebase_uplift
% @type categorical
% @canonical false
% @original_name Tail sidebase uplift
% @values low=Low unk_tail_sidebase_uplift=Unknown
% @importance 1.0

0.92::true_val(tail_sidebase_uplift, low); 0.08::true_val(tail_sidebase_uplift, unk_tail_sidebase_uplift).

measured(s3, tail_sidebase_uplift, low).

all_consistent(tail_sidebase_uplift) :- consistent(s3, tail_sidebase_uplift).

evidence(all_consistent(tail_sidebase_uplift)).
query(true_val(tail_sidebase_uplift, low)).
query(true_val(tail_sidebase_uplift, unk_tail_sidebase_uplift)).

0.93::acc(s3, three_d_shape).

% @attr three_d_shape
% @type categorical
% @canonical false
% @original_name 3D shape
% @values tbt_with_sidekick=3BT_with_SideKick unk_three_d_shape=Unknown
% @importance 1.0

0.92::true_val(three_d_shape, tbt_with_sidekick); 0.08::true_val(three_d_shape, unk_three_d_shape).

measured(s3, three_d_shape, tbt_with_sidekick).

all_consistent(three_d_shape) :- consistent(s3, three_d_shape).

evidence(all_consistent(three_d_shape)).
query(true_val(three_d_shape, tbt_with_sidekick)).
query(true_val(three_d_shape, unk_three_d_shape)).

0.93::acc(s3, available_sizes).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values seven_sizes=153_156_159_158W_161W_164W_167W unk_available_sizes=Unknown
% @importance 1.0

0.92::true_val(available_sizes, seven_sizes); 0.08::true_val(available_sizes, unk_available_sizes).

measured(s3, available_sizes, seven_sizes).

all_consistent(available_sizes) :- consistent(s3, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, seven_sizes)).
query(true_val(available_sizes, unk_available_sizes)).

0.93::acc(s3, width_options).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 1.0

0.92::true_val(width_options, standard_and_wide); 0.08::true_val(width_options, unk_width_options).

measured(s3, width_options, standard_and_wide).

all_consistent(width_options) :- consistent(s3, width_options).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

0.65::acc(s2, mounting_pattern).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_inserts unk_mounting_pattern=Unknown
% @importance 0.95

0.63::true_val(mounting_pattern, inserts_2x4); 0.37::true_val(mounting_pattern, unk_mounting_pattern).

measured(s2, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :- consistent(s2, mounting_pattern).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

0.93::acc(s3, total_inserts).

% @attr total_inserts
% @type numeric
% @canonical false
% @original_name Total inserts
% @values v28=28
% @importance 1.0

0.92::true_val(total_inserts, v28); 0.08::true_val(total_inserts, unk_total_inserts).

measured(s3, total_inserts, v28).

all_consistent(total_inserts) :- consistent(s3, total_inserts).

evidence(all_consistent(total_inserts)).
query(true_val(total_inserts, v28)).
query(true_val(total_inserts, unk_total_inserts)).

0.93::acc(s3, insert_material).

% @attr insert_material
% @type categorical
% @canonical false
% @original_name Insert material
% @values a_grade_german_stainless=A_grade_German_stainless_steel unk_insert_material=Unknown
% @importance 1.0

0.92::true_val(insert_material, a_grade_german_stainless); 0.08::true_val(insert_material, unk_insert_material).

measured(s3, insert_material, a_grade_german_stainless).

all_consistent(insert_material) :- consistent(s3, insert_material).

evidence(all_consistent(insert_material)).
query(true_val(insert_material, a_grade_german_stainless)).
query(true_val(insert_material, unk_insert_material)).

0.93::acc(s17, core_material_blend_ratio).
0.50::acc(s18, core_material_blend_ratio).
0.55::acc(s2, core_material_blend_ratio).

% @attr core_material_blend_ratio
% @type categorical
% @canonical true
% @original_name core_material_blend_ratio
% @values v70_30=70_30_Paulownia_Poplar v80_20=80_20_Paulownia_Poplar v33_67=33_67_Paulownia_Poplar
% @importance 0.783

0.55::true_val(core_material_blend_ratio, v70_30); 0.30::true_val(core_material_blend_ratio, v80_20); 0.15::true_val(core_material_blend_ratio, v33_67).

measured(s17, core_material_blend_ratio, v70_30).
measured(s18, core_material_blend_ratio, v80_20).
measured(s2, core_material_blend_ratio, v33_67).

all_consistent(core_material_blend_ratio) :-
    consistent(s17, core_material_blend_ratio),
    (indep(s18), consistent(s18, core_material_blend_ratio) ; \+indep(s18)),
    (indep(s2), consistent(s2, core_material_blend_ratio) ; \+indep(s2)).

evidence(all_consistent(core_material_blend_ratio)).
query(true_val(core_material_blend_ratio, v70_30)).
query(true_val(core_material_blend_ratio, v80_20)).
query(true_val(core_material_blend_ratio, v33_67)).

0.93::acc(s3, laminate).

% @attr laminate
% @type categorical
% @canonical false
% @original_name laminate
% @values tri_ax=Tri_Axial_lamination unk_laminate=Unknown
% @importance 1.0

0.92::true_val(laminate, tri_ax); 0.08::true_val(laminate, unk_laminate).

measured(s3, laminate, tri_ax).

all_consistent(laminate) :- consistent(s3, laminate).

evidence(all_consistent(laminate)).
query(true_val(laminate, tri_ax)).
query(true_val(laminate, unk_laminate)).

0.93::acc(s3, construction_material_innovation).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values carbon_stringers=Carbon_Stringers unk_construction_material_innovation=Unknown
% @importance 1.0

0.92::true_val(construction_material_innovation, carbon_stringers); 0.08::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s3, construction_material_innovation, carbon_stringers).

all_consistent(construction_material_innovation) :- consistent(s3, construction_material_innovation).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, carbon_stringers)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

0.93::acc(s3, construction_material_innovation_drst).

% @attr construction_material_innovation_drst
% @type categorical
% @canonical false
% @original_name construction_material_innovation (D.R.S.T. SuperTubes)
% @values drst_supertubes=DRST_SuperTubes_six_hollow_carbon_cylinders unk_construction_material_innovation_drst=Unknown
% @importance 1.0

0.92::true_val(construction_material_innovation_drst, drst_supertubes); 0.08::true_val(construction_material_innovation_drst, unk_construction_material_innovation_drst).

measured(s3, construction_material_innovation_drst, drst_supertubes).

all_consistent(construction_material_innovation_drst) :- consistent(s3, construction_material_innovation_drst).

evidence(all_consistent(construction_material_innovation_drst)).
query(true_val(construction_material_innovation_drst, drst_supertubes)).
query(true_val(construction_material_innovation_drst, unk_construction_material_innovation_drst)).

0.93::acc(s3, sidewall_material).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values flex_walls_urethane=Flex_Walls_Urethane_Poured_Sidewalls unk_sidewall_material=Unknown
% @importance 1.0

0.92::true_val(sidewall_material, flex_walls_urethane); 0.08::true_val(sidewall_material, unk_sidewall_material).

measured(s3, sidewall_material, flex_walls_urethane).

all_consistent(sidewall_material) :- consistent(s3, sidewall_material).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, flex_walls_urethane)).
query(true_val(sidewall_material, unk_sidewall_material)).

0.93::acc(s3, sidewall_benefit).

% @attr sidewall_benefit
% @type categorical
% @canonical false
% @original_name Sidewall benefit
% @values shock_absorption=Exceptional_shock_absorption_reduces_chatter unk_sidewall_benefit=Unknown
% @importance 1.0

0.92::true_val(sidewall_benefit, shock_absorption); 0.08::true_val(sidewall_benefit, unk_sidewall_benefit).

measured(s3, sidewall_benefit, shock_absorption).

all_consistent(sidewall_benefit) :- consistent(s3, sidewall_benefit).

evidence(all_consistent(sidewall_benefit)).
query(true_val(sidewall_benefit, shock_absorption)).
query(true_val(sidewall_benefit, unk_sidewall_benefit)).

0.95::acc(s3, base_material).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values ultra_glide_s_7000=Ultra_Glide_S_sintered_7000 unk_base_material=Unknown
% @importance 1.0

0.92::true_val(base_material, ultra_glide_s_7000); 0.08::true_val(base_material, unk_base_material).

measured(s3, base_material, ultra_glide_s_7000).

all_consistent(base_material) :- consistent(s3, base_material).

evidence(all_consistent(base_material)).
query(true_val(base_material, ultra_glide_s_7000)).
query(true_val(base_material, unk_base_material)).

0.93::acc(s3, additional_inserts_backseat_plus4).

% @attr additional_inserts_backseat_plus4
% @type categorical
% @canonical false
% @original_name Additional inserts Backseat +4
% @values extra_4cm_behind=Extra_inserts_4cm_behind_bottom_for_powder unk_additional_inserts_backseat_plus4=Unknown
% @importance 1.0

0.92::true_val(additional_inserts_backseat_plus4, extra_4cm_behind); 0.08::true_val(additional_inserts_backseat_plus4, unk_additional_inserts_backseat_plus4).

measured(s3, additional_inserts_backseat_plus4, extra_4cm_behind).

all_consistent(additional_inserts_backseat_plus4) :- consistent(s3, additional_inserts_backseat_plus4).

evidence(all_consistent(additional_inserts_backseat_plus4)).
query(true_val(additional_inserts_backseat_plus4, extra_4cm_behind)).
query(true_val(additional_inserts_backseat_plus4, unk_additional_inserts_backseat_plus4)).

0.93::acc(s3, additional_inserts_backseat_plus2).

% @attr additional_inserts_backseat_plus2
% @type categorical
% @canonical false
% @original_name Additional inserts Backseat +2
% @values offset_4cm_front_2cm_rear=4cm_offset_front_2cm_rear unk_additional_inserts_backseat_plus2=Unknown
% @importance 1.0

0.92::true_val(additional_inserts_backseat_plus2, offset_4cm_front_2cm_rear); 0.08::true_val(additional_inserts_backseat_plus2, unk_additional_inserts_backseat_plus2).

measured(s3, additional_inserts_backseat_plus2, offset_4cm_front_2cm_rear).

all_consistent(additional_inserts_backseat_plus2) :- consistent(s3, additional_inserts_backseat_plus2).

evidence(all_consistent(additional_inserts_backseat_plus2)).
query(true_val(additional_inserts_backseat_plus2, offset_4cm_front_2cm_rear)).
query(true_val(additional_inserts_backseat_plus2, unk_additional_inserts_backseat_plus2)).

0.93::acc(s3, effective_edge_153).

% @attr effective_edge_153
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 153cm
% @values v117_9=117.9 unk_effective_edge_153=Unknown
% @importance 1.0

0.92::true_val(effective_edge_153, v117_9); 0.08::true_val(effective_edge_153, unk_effective_edge_153).

measured(s3, effective_edge_153, v117_9).

all_consistent(effective_edge_153) :- consistent(s3, effective_edge_153).

evidence(all_consistent(effective_edge_153)).
query(true_val(effective_edge_153, v117_9)).
query(true_val(effective_edge_153, unk_effective_edge_153)).

0.93::acc(s3, effective_edge_156).

% @attr effective_edge_156
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 156cm
% @values v120_2=120.2 unk_effective_edge_156=Unknown
% @importance 1.0

0.92::true_val(effective_edge_156, v120_2); 0.08::true_val(effective_edge_156, unk_effective_edge_156).

measured(s3, effective_edge_156, v120_2).

all_consistent(effective_edge_156) :- consistent(s3, effective_edge_156).

evidence(all_consistent(effective_edge_156)).
query(true_val(effective_edge_156, v120_2)).
query(true_val(effective_edge_156, unk_effective_edge_156)).

0.93::acc(s3, effective_edge_159).

% @attr effective_edge_159
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 159cm
% @values v122_5=122.5 unk_effective_edge_159=Unknown
% @importance 1.0

0.92::true_val(effective_edge_159, v122_5); 0.08::true_val(effective_edge_159, unk_effective_edge_159).

measured(s3, effective_edge_159, v122_5).

all_consistent(effective_edge_159) :- consistent(s3, effective_edge_159).

evidence(all_consistent(effective_edge_159)).
query(true_val(effective_edge_159, v122_5)).
query(true_val(effective_edge_159, unk_effective_edge_159)).

0.93::acc(s3, effective_edge_158w).

% @attr effective_edge_158w
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 158W
% @values v121_7=121.7 unk_effective_edge_158w=Unknown
% @importance 1.0

0.92::true_val(effective_edge_158w, v121_7); 0.08::true_val(effective_edge_158w, unk_effective_edge_158w).

measured(s3, effective_edge_158w, v121_7).

all_consistent(effective_edge_158w) :- consistent(s3, effective_edge_158w).

evidence(all_consistent(effective_edge_158w)).
query(true_val(effective_edge_158w, v121_7)).
query(true_val(effective_edge_158w, unk_effective_edge_158w)).

0.93::acc(s3, effective_edge_161w).

% @attr effective_edge_161w
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 161W
% @values v124_0=124.0 unk_effective_edge_161w=Unknown
% @importance 1.0

0.92::true_val(effective_edge_161w, v124_0); 0.08::true_val(effective_edge_161w, unk_effective_edge_161w).

measured(s3, effective_edge_161w, v124_0).

all_consistent(effective_edge_161w) :- consistent(s3, effective_edge_161w).

evidence(all_consistent(effective_edge_161w)).
query(true_val(effective_edge_161w, v124_0)).
query(true_val(effective_edge_161w, unk_effective_edge_161w)).

0.93::acc(s3, effective_edge_164w).

% @attr effective_edge_164w
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 164W
% @values v126_3=126.3 unk_effective_edge_164w=Unknown
% @importance 1.0

0.92::true_val(effective_edge_164w, v126_3); 0.08::true_val(effective_edge_164w, unk_effective_edge_164w).

measured(s3, effective_edge_164w, v126_3).

all_consistent(effective_edge_164w) :- consistent(s3, effective_edge_164w).

evidence(all_consistent(effective_edge_164w)).
query(true_val(effective_edge_164w, v126_3)).
query(true_val(effective_edge_164w, unk_effective_edge_164w)).

0.93::acc(s3, effective_edge_167w).

% @attr effective_edge_167w
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 167W
% @values v128_6=128.6 unk_effective_edge_167w=Unknown
% @importance 1.0

0.92::true_val(effective_edge_167w, v128_6); 0.08::true_val(effective_edge_167w, unk_effective_edge_167w).

measured(s3, effective_edge_167w, v128_6).

all_consistent(effective_edge_167w) :- consistent(s3, effective_edge_167w).

evidence(all_consistent(effective_edge_167w)).
query(true_val(effective_edge_167w, v128_6)).
query(true_val(effective_edge_167w, unk_effective_edge_167w)).

0.93::acc(s3, sidecut_radius_size_153).

% @attr sidecut_radius_size_153
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size 153cm
% @values v7_73=7.73 unk_sidecut_radius_size_153=Unknown
% @importance 1.0

0.92::true_val(sidecut_radius_size_153, v7_73); 0.08::true_val(sidecut_radius_size_153, unk_sidecut_radius_size_153).

measured(s3, sidecut_radius_size_153, v7_73).

all_consistent(sidecut_radius_size_153) :- consistent(s3, sidecut_radius_size_153).

evidence(all_consistent(sidecut_radius_size_153)).
query(true_val(sidecut_radius_size_153, v7_73)).
query(true_val(sidecut_radius_size_153, unk_sidecut_radius_size_153)).

0.93::acc(s3, sidecut_radius_size).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size 156cm
% @values v7_85=7.85 unk_sidecut_radius_size=Unknown
% @importance 1.0

0.92::true_val(sidecut_radius_size, v7_85); 0.08::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s3, sidecut_radius_size, v7_85).

all_consistent(sidecut_radius_size) :- consistent(s3, sidecut_radius_size).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_85)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

0.93::acc(s3, sidecut_radius_size_159).

% @attr sidecut_radius_size_159
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size 159cm
% @values v7_97=7.97 unk_sidecut_radius_size_159=Unknown
% @importance 1.0

0.92::true_val(sidecut_radius_size_159, v7_97); 0.08::true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159).

measured(s3, sidecut_radius_size_159, v7_97).

all_consistent(sidecut_radius_size_159) :- consistent(s3, sidecut_radius_size_159).

evidence(all_consistent(sidecut_radius_size_159)).
query(true_val(sidecut_radius_size_159, v7_97)).
query(true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159)).

0.93::acc(s3, sidecut_radius_size_158w).

% @attr sidecut_radius_size_158w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size 158W
% @values v7_93=7.93 unk_sidecut_radius_size_158w=Unknown
% @importance 1.0

0.92::true_val(sidecut_radius_size_158w, v7_93); 0.08::true_val(sidecut_radius_size_158w, unk_sidecut_radius_size_158w).

measured(s3, sidecut_radius_size_158w, v7_93).

all_consistent(sidecut_radius_size_158w) :- consistent(s3, sidecut_radius_size_158w).

evidence(all_consistent(sidecut_radius_size_158w)).
query(true_val(sidecut_radius_size_158w, v7_93)).
query(true_val(sidecut_radius_size_158w, unk_sidecut_radius_size_158w)).

0.93::acc(s3, sidecut_radius_size_161w).

% @attr sidecut_radius_size_161w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size 161W
% @values v8_05=8.05 unk_sidecut_radius_size_161w=Unknown
% @importance 1.0

0.92::true_val(sidecut_radius_size_161w, v8_05); 0.08::true_val(sidecut_radius_size_161w, unk_sidecut_radius_size_161w).

measured(s3, sidecut_radius_size_161w, v8_05).

all_consistent(sidecut_radius_size_161w) :- consistent(s3, sidecut_radius_size_161w).

evidence(all_consistent(sidecut_radius_size_161w)).
query(true_val(sidecut_radius_size_161w, v8_05)).
query(true_val(sidecut_radius_size_161w, unk_sidecut_radius_size_161w)).

0.93::acc(s3, sidecut_radius_size_164w).

% @attr sidecut_radius_size_164w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size 164W
% @values v8_17=8.17 unk_sidecut_radius_size_164w=Unknown
% @importance 1.0

0.92::true_val(sidecut_radius_size_164w, v8_17); 0.08::true_val(sidecut_radius_size_164w, unk_sidecut_radius_size_164w).

measured(s3, sidecut_radius_size_164w, v8_17).

all_consistent(sidecut_radius_size_164w) :- consistent(s3, sidecut_radius_size_164w).

evidence(all_consistent(sidecut_radius_size_164w)).
query(true_val(sidecut_radius_size_164w, v8_17)).
query(true_val(sidecut_radius_size_164w, unk_sidecut_radius_size_164w)).

0.93::acc(s3, sidecut_radius_size_167w).

% @attr sidecut_radius_size_167w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size 167W
% @values v8_29=8.29 unk_sidecut_radius_size_167w=Unknown
% @importance 1.0

0.92::true_val(sidecut_radius_size_167w, v8_29); 0.08::true_val(sidecut_radius_size_167w, unk_sidecut_radius_size_167w).

measured(s3, sidecut_radius_size_167w, v8_29).

all_consistent(sidecut_radius_size_167w) :- consistent(s3, sidecut_radius_size_167w).

evidence(all_consistent(sidecut_radius_size_167w)).
query(true_val(sidecut_radius_size_167w, v8_29)).
query(true_val(sidecut_radius_size_167w, unk_sidecut_radius_size_167w)).

0.93::acc(s3, waist_width_153).

% @attr waist_width_153
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 153cm
% @values v25_2=25.2 unk_waist_width_153=Unknown
% @importance 1.0

0.92::true_val(waist_width_153, v25_2); 0.08::true_val(waist_width_153, unk_waist_width_153).

measured(s3, waist_width_153, v25_2).

all_consistent(waist_width_153) :- consistent(s3, waist_width_153).

evidence(all_consistent(waist_width_153)).
query(true_val(waist_width_153, v25_2)).
query(true_val(waist_width_153, unk_waist_width_153)).

0.93::acc(s3, waist_width_156).

% @attr waist_width_156
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 156cm
% @values v25_4=25.4 unk_waist_width_156=Unknown
% @importance 1.0

0.92::true_val(waist_width_156, v25_4); 0.08::true_val(waist_width_156, unk_waist_width_156).

measured(s3, waist_width_156, v25_4).

all_consistent(waist_width_156) :- consistent(s3, waist_width_156).

evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v25_4)).
query(true_val(waist_width_156, unk_waist_width_156)).

0.93::acc(s3, waist_width_159).

% @attr waist_width_159
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 159cm
% @values v25_6=25.6 unk_waist_width_159=Unknown
% @importance 1.0

0.92::true_val(waist_width_159, v25_6); 0.08::true_val(waist_width_159, unk_waist_width_159).

measured(s3, waist_width_159, v25_6).

all_consistent(waist_width_159) :- consistent(s3, waist_width_159).

evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v25_6)).
query(true_val(waist_width_159, unk_waist_width_159)).

0.93::acc(s3, waist_width_158w).

% @attr waist_width_158w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 158W
% @values v26_6=26.6 unk_waist_width_158w=Unknown
% @importance 1.0

0.92::true_val(waist_width_158w, v26_6); 0.08::true_val(waist_width_158w, unk_waist_width_158w).

measured(s3, waist_width_158w, v26_6).

all_consistent(waist_width_158w) :- consistent(s3, waist_width_158w).

evidence(all_consistent(waist_width_158w)).
query(true_val(waist_width_158w, v26_6)).
query(true_val(waist_width_158w, unk_waist_width_158w)).

0.93::acc(s3, waist_width_161w).

% @attr waist_width_161w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 161W
% @values v26_8=26.8 unk_waist_width_161w=Unknown
% @importance 1.0

0.92::true_val(waist_width_161w, v26_8); 0.08::true_val(waist_width_161w, unk_waist_width_161w).

measured(s3, waist_width_161w, v26_8).

all_consistent(waist_width_161w) :- consistent(s3, waist_width_161w).

evidence(all_consistent(waist_width_161w)).
query(true_val(waist_width_161w, v26_8)).
query(true_val(waist_width_161w, unk_waist_width_161w)).

0.93::acc(s3, waist_width_164w).

% @attr waist_width_164w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 164W
% @values v27_0=27.0 unk_waist_width_164w=Unknown
% @importance 1.0

0.92::true_val(waist_width_164w, v27_0); 0.08::true_val(waist_width_164w, unk_waist_width_164w).

measured(s3, waist_width_164w, v27_0).

all_consistent(waist_width_164w) :- consistent(s3, waist_width_164w).

evidence(all_consistent(waist_width_164w)).
query(true_val(waist_width_164w, v27_0)).
query(true_val(waist_width_164w, unk_waist_width_164w)).

0.93::acc(s3, waist_width_167w).

% @attr waist_width_167w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 167W
% @values v27_2=27.2 unk_waist_width_167w=Unknown
% @importance 1.0

0.92::true_val(waist_width_167w, v27_2); 0.08::true_val(waist_width_167w, unk_waist_width_167w).

measured(s3, waist_width_167w, v27_2).

all_consistent(waist_width_167w) :- consistent(s3, waist_width_167w).

evidence(all_consistent(waist_width_167w)).
query(true_val(waist_width_167w, v27_2)).
query(true_val(waist_width_167w, unk_waist_width_167w)).

0.93::acc(s3, tip_tail_width_size_153).

% @attr tip_tail_width_size_153
% @type categorical
% @unit cm
% @canonical false
% @original_name tip_tail_width_size 153cm
% @values v29_4_29_4=29.4/29.4 unk_tip_tail_width_size_153=Unknown
% @importance 1.0

0.92::true_val(tip_tail_width_size_153, v29_4_29_4); 0.08::true_val(tip_tail_width_size_153, unk_tip_tail_width_size_153).

measured(s3, tip_tail_width_size_153, v29_4_29_4).

all_consistent(tip_tail_width_size_153) :- consistent(s3, tip_tail_width_size_153).

evidence(all_consistent(tip_tail_width_size_153)).
query(true_val(tip_tail_width_size_153, v29_4_29_4)).
query(true_val(tip_tail_width_size_153, unk_tip_tail_width_size_153)).

0.93::acc(s3, tip_tail_width_size).

% @attr tip_tail_width_size
% @type categorical
% @unit cm
% @canonical true
% @original_name tip_tail_width_size 156cm
% @values v29_7_29_7=29.7/29.7 unk_tip_tail_width_size=Unknown
% @importance 1.0

0.92::true_val(tip_tail_width_size, v29_7_29_7); 0.08::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s3, tip_tail_width_size, v29_7_29_7).

all_consistent(tip_tail_width_size) :- consistent(s3, tip_tail_width_size).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v29_7_29_7)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

0.93::acc(s3, tip_tail_width_size_159).

% @attr tip_tail_width_size_159
% @type categorical
% @unit cm
% @canonical false
% @original_name tip_tail_width_size 159cm
% @values v30_9_30_9=30.9/30.9 unk_tip_tail_width_size_159=Unknown
% @importance 1.0

0.92::true_val(tip_tail_width_size_159, v30_9_30_9); 0.08::true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159).

measured(s3, tip_tail_width_size_159, v30_9_30_9).

all_consistent(tip_tail_width_size_159) :- consistent(s3, tip_tail_width_size_159).

evidence(all_consistent(tip_tail_width_size_159)).
query(true_val(tip_tail_width_size_159, v30_9_30_9)).
query(true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159)).

0.93::acc(s3, tip_tail_width_size_158w).

% @attr tip_tail_width_size_158w
% @type categorical
% @unit cm
% @canonical false
% @original_name tip_tail_width_size 158W
% @values v30_1_30_1=30.1/30.1 unk_tip_tail_width_size_158w=Unknown
% @importance 1.0

0.92::true_val(tip_tail_width_size_158w, v30_1_30_1); 0.08::true_val(tip_tail_width_size_158w, unk_tip_tail_width_size_158w).

measured(s3, tip_tail_width_size_158w, v30_1_30_1).

all_consistent(tip_tail_width_size_158w) :- consistent(s3, tip_tail_width_size_158w).

evidence(all_consistent(tip_tail_width_size_158w)).
query(true_val(tip_tail_width_size_158w, v30_1_30_1)).
query(true_val(tip_tail_width_size_158w, unk_tip_tail_width_size_158w)).

0.93::acc(s3, tip_tail_width_size_161w).

% @attr tip_tail_width_size_161w
% @type categorical
% @unit cm
% @canonical false
% @original_name tip_tail_width_size 161W
% @values v31_3_31_3=31.3/31.3 unk_tip_tail_width_size_161w=Unknown
% @importance 1.0

0.92::true_val(tip_tail_width_size_161w, v31_3_31_3); 0.08::true_val(tip_tail_width_size_161w, unk_tip_tail_width_size_161w).

measured(s3, tip_tail_width_size_161w, v31_3_31_3).

all_consistent(tip_tail_width_size_161w) :- consistent(s3, tip_tail_width_size_161w).

evidence(all_consistent(tip_tail_width_size_161w)).
query(true_val(tip_tail_width_size_161w, v31_3_31_3)).
query(true_val(tip_tail_width_size_161w, unk_tip_tail_width_size_161w)).

0.93::acc(s3, tip_tail_width_size_164w).

% @attr tip_tail_width_size_164w
% @type categorical
% @unit cm
% @canonical false
% @original_name tip_tail_width_size 164W
% @values v31_6_31_6=31.6/31.6 unk_tip_tail_width_size_164w=Unknown
% @importance 1.0

0.92::true_val(tip_tail_width_size_164w, v31_6_31_6); 0.08::true_val(tip_tail_width_size_164w, unk_tip_tail_width_size_164w).

measured(s3, tip_tail_width_size_164w, v31_6_31_6).

all_consistent(tip_tail_width_size_164w) :- consistent(s3, tip_tail_width_size_164w).

evidence(all_consistent(tip_tail_width_size_164w)).
query(true_val(tip_tail_width_size_164w, v31_6_31_6)).
query(true_val(tip_tail_width_size_164w, unk_tip_tail_width_size_164w)).

0.93::acc(s3, tip_tail_width_size_167w).

% @attr tip_tail_width_size_167w
% @type categorical
% @unit cm
% @canonical false
% @original_name tip_tail_width_size 167W
% @values v31_9_31_9=31.9/31.9 unk_tip_tail_width_size_167w=Unknown
% @importance 1.0

0.92::true_val(tip_tail_width_size_167w, v31_9_31_9); 0.08::true_val(tip_tail_width_size_167w, unk_tip_tail_width_size_167w).

measured(s3, tip_tail_width_size_167w, v31_9_31_9).

all_consistent(tip_tail_width_size_167w) :- consistent(s3, tip_tail_width_size_167w).

evidence(all_consistent(tip_tail_width_size_167w)).
query(true_val(tip_tail_width_size_167w, v31_9_31_9)).
query(true_val(tip_tail_width_size_167w, unk_tip_tail_width_size_167w)).

0.93::acc(s3, stance_width_range_size_153).

% @attr stance_width_range_size_153
% @type categorical
% @unit cm
% @canonical false
% @original_name stance_width_range_size 153cm
% @values v49_61=49.0-61.0 unk_stance_width_range_size_153=Unknown
% @importance 1.0

0.92::true_val(stance_width_range_size_153, v49_61); 0.08::true_val(stance_width_range_size_153, unk_stance_width_range_size_153).

measured(s3, stance_width_range_size_153, v49_61).

all_consistent(stance_width_range_size_153) :- consistent(s3, stance_width_range_size_153).

evidence(all_consistent(stance_width_range_size_153)).
query(true_val(stance_width_range_size_153, v49_61)).
query(true_val(stance_width_range_size_153, unk_stance_width_range_size_153)).

0.93::acc(s3, stance_width_range_size).

% @attr stance_width_range_size
% @type categorical
% @unit cm
% @canonical true
% @original_name stance_width_range_size 156cm
% @values v51_63=51.0-63.0 unk_stance_width_range_size=Unknown
% @importance 1.0

0.92::true_val(stance_width_range_size, v51_63); 0.08::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s3, stance_width_range_size, v51_63).

all_consistent(stance_width_range_size) :- consistent(s3, stance_width_range_size).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v51_63)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

0.93::acc(s3, stance_width_range_size_159).

% @attr stance_width_range_size_159
% @type categorical
% @unit cm
% @canonical false
% @original_name stance_width_range_size 159cm
% @values v52_64=52.0-64.0 unk_stance_width_range_size_159=Unknown
% @importance 1.0

0.92::true_val(stance_width_range_size_159, v52_64); 0.08::true_val(stance_width_range_size_159, unk_stance_width_range_size_159).

measured(s3, stance_width_range_size_159, v52_64).

all_consistent(stance_width_range_size_159) :- consistent(s3, stance_width_range_size_159).

evidence(all_consistent(stance_width_range_size_159)).
query(true_val(stance_width_range_size_159, v52_64)).
query(true_val(stance_width_range_size_159, unk_stance_width_range_size_159)).

0.93::acc(s3, stance_width_range_size_158w).

% @attr stance_width_range_size_158w
% @type categorical
% @unit cm
% @canonical false
% @original_name stance_width_range_size 158W
% @values v51_63w=51.0-63.0 unk_stance_width_range_size_158w=Unknown
% @importance 1.0

0.92::true_val(stance_width_range_size_158w, v51_63w); 0.08::true_val(stance_width_range_size_158w, unk_stance_width_range_size_158w).

measured(s3, stance_width_range_size_158w, v51_63w).

all_consistent(stance_width_range_size_158w) :- consistent(s3, stance_width_range_size_158w).

evidence(all_consistent(stance_width_range_size_158w)).
query(true_val(stance_width_range_size_158w, v51_63w)).
query(true_val(stance_width_range_size_158w, unk_stance_width_range_size_158w)).

0.93::acc(s3, stance_width_range_size_161w).

% @attr stance_width_range_size_161w
% @type categorical
% @unit cm
% @canonical false
% @original_name stance_width_range_size 161W
% @values v52_64w=52.0-64.0 unk_stance_width_range_size_161w=Unknown
% @importance 1.0

0.92::true_val(stance_width_range_size_161w, v52_64w); 0.08::true_val(stance_width_range_size_161w, unk_stance_width_range_size_161w).

measured(s3, stance_width_range_size_161w, v52_64w).

all_consistent(stance_width_range_size_161w) :- consistent(s3, stance_width_range_size_161w).

evidence(all_consistent(stance_width_range_size_161w)).
query(true_val(stance_width_range_size_161w, v52_64w)).
query(true_val(stance_width_range_size_161w, unk_stance_width_range_size_161w)).

0.93::acc(s3, stance_width_range_size_164w).

% @attr stance_width_range_size_164w
% @type categorical
% @unit cm
% @canonical false
% @original_name stance_width_range_size 164W
% @values v53_65=53.0-65.0 unk_stance_width_range_size_164w=Unknown
% @importance 1.0

0.92::true_val(stance_width_range_size_164w, v53_65); 0.08::true_val(stance_width_range_size_164w, unk_stance_width_range_size_164w).

measured(s3, stance_width_range_size_164w, v53_65).

all_consistent(stance_width_range_size_164w) :- consistent(s3, stance_width_range_size_164w).

evidence(all_consistent(stance_width_range_size_164w)).
query(true_val(stance_width_range_size_164w, v53_65)).
query(true_val(stance_width_range_size_164w, unk_stance_width_range_size_164w)).

0.93::acc(s3, stance_width_range_size_167w).

% @attr stance_width_range_size_167w
% @type categorical
% @unit cm
% @canonical false
% @original_name stance_width_range_size 167W
% @values v54_65=54.0-65.0 unk_stance_width_range_size_167w=Unknown
% @importance 1.0

0.92::true_val(stance_width_range_size_167w, v54_65); 0.08::true_val(stance_width_range_size_167w, unk_stance_width_range_size_167w).

measured(s3, stance_width_range_size_167w, v54_65).

all_consistent(stance_width_range_size_167w) :- consistent(s3, stance_width_range_size_167w).

evidence(all_consistent(stance_width_range_size_167w)).
query(true_val(stance_width_range_size_167w, v54_65)).
query(true_val(stance_width_range_size_167w, unk_stance_width_range_size_167w)).

0.93::acc(s3, recommended_weight_range_size_153).

% @attr recommended_weight_range_size_153
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size 153cm
% @values v61_81=61-81kg unk_recommended_weight_range_size_153=Unknown
% @importance 1.0

0.92::true_val(recommended_weight_range_size_153, v61_81); 0.08::true_val(recommended_weight_range_size_153, unk_recommended_weight_range_size_153).

measured(s3, recommended_weight_range_size_153, v61_81).

all_consistent(recommended_weight_range_size_153) :- consistent(s3, recommended_weight_range_size_153).

evidence(all_consistent(recommended_weight_range_size_153)).
query(true_val(recommended_weight_range_size_153, v61_81)).
query(true_val(recommended_weight_range_size_153, unk_recommended_weight_range_size_153)).

0.93::acc(s3, recommended_weight_range_size).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size 156cm
% @values v67_87=67-87kg unk_recommended_weight_range_size=Unknown
% @importance 1.0

0.92::true_val(recommended_weight_range_size, v67_87); 0.08::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s3, recommended_weight_range_size, v67_87).

all_consistent(recommended_weight_range_size) :- consistent(s3, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, v67_87)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

0.93::acc(s3, recommended_weight_range_size_159).

% @attr recommended_weight_range_size_159
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size 159cm
% @values v75_95=75-95kg unk_recommended_weight_range_size_159=Unknown
% @importance 1.0

0.92::true_val(recommended_weight_range_size_159, v75_95); 0.08::true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159).

measured(s3, recommended_weight_range_size_159, v75_95).

all_consistent(recommended_weight_range_size_159) :- consistent(s3, recommended_weight_range_size_159).

evidence(all_consistent(recommended_weight_range_size_159)).
query(true_val(recommended_weight_range_size_159, v75_95)).
query(true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159)).

0.93::acc(s3, recommended_weight_range_size_158w).

% @attr recommended_weight_range_size_158w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size 158W
% @values v73_93=73-93kg unk_recommended_weight_range_size_158w=Unknown
% @importance 1.0

0.92::true_val(recommended_weight_range_size_158w, v73_93); 0.08::true_val(recommended_weight_range_size_158w, unk_recommended_weight_range_size_158w).

measured(s3, recommended_weight_range_size_158w, v73_93).

all_consistent(recommended_weight_range_size_158w) :- consistent(s3, recommended_weight_range_size_158w).

evidence(all_consistent(recommended_weight_range_size_158w)).
query(true_val(recommended_weight_range_size_158w, v73_93)).
query(true_val(recommended_weight_range_size_158w, unk_recommended_weight_range_size_158w)).

0.93::acc(s3, recommended_weight_range_size_161w).

% @attr recommended_weight_range_size_161w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size 161W
% @values v79_99=79-99kg unk_recommended_weight_range_size_161w=Unknown
% @importance 1.0

0.92::true_val(recommended_weight_range_size_161w, v79_99); 0.08::true_val(recommended_weight_range_size_161w, unk_recommended_weight_range_size_161w).

measured(s3, recommended_weight_range_size_161w, v79_99).

all_consistent(recommended_weight_range_size_161w) :- consistent(s3, recommended_weight_range_size_161w).

evidence(all_consistent(recommended_weight_range_size_161w)).
query(true_val(recommended_weight_range_size_161w, v79_99)).
query(true_val(recommended_weight_range_size_161w, unk_recommended_weight_range_size_161w)).

0.93::acc(s3, recommended_weight_range_size_164w).

% @attr recommended_weight_range_size_164w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size 164W
% @values v85_105=85-105kg unk_recommended_weight_range_size_164w=Unknown
% @importance 1.0

0.92::true_val(recommended_weight_range_size_164w, v85_105); 0.08::true_val(recommended_weight_range_size_164w, unk_recommended_weight_range_size_164w).

measured(s3, recommended_weight_range_size_164w, v85_105).

all_consistent(recommended_weight_range_size_164w) :- consistent(s3, recommended_weight_range_size_164w).

evidence(all_consistent(recommended_weight_range_size_164w)).
query(true_val(recommended_weight_range_size_164w, v85_105)).
query(true_val(recommended_weight_range_size_164w, unk_recommended_weight_range_size_164w)).

0.93::acc(s3, recommended_weight_range_size_167w).

% @attr recommended_weight_range_size_167w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size 167W
% @values v103_123=103-123kg unk_recommended_weight_range_size_167w=Unknown
% @importance 1.0

0.92::true_val(recommended_weight_range_size_167w, v103_123); 0.08::true_val(recommended_weight_range_size_167w, unk_recommended_weight_range_size_167w).

measured(s3, recommended_weight_range_size_167w, v103_123).

all_consistent(recommended_weight_range_size_167w) :- consistent(s3, recommended_weight_range_size_167w).

evidence(all_consistent(recommended_weight_range_size_167w)).
query(true_val(recommended_weight_range_size_167w, v103_123)).
query(true_val(recommended_weight_range_size_167w, unk_recommended_weight_range_size_167w)).

0.65::acc(s19, wide_board_boot_size).

% @attr wide_board_boot_size
% @type categorical
% @canonical false
% @original_name Wide board recommended boot size
% @values uk10_5_or_larger=UK_10_5_or_larger unk_wide_board_boot_size=Unknown
% @importance 0.65

0.60::true_val(wide_board_boot_size, uk10_5_or_larger); 0.40::true_val(wide_board_boot_size, unk_wide_board_boot_size).

measured(s19, wide_board_boot_size, uk10_5_or_larger).

all_consistent(wide_board_boot_size) :- consistent(s19, wide_board_boot_size).

evidence(all_consistent(wide_board_boot_size)).
query(true_val(wide_board_boot_size, uk10_5_or_larger)).
query(true_val(wide_board_boot_size, unk_wide_board_boot_size)).

0.93::acc(s3, boot_size_range_standard).

% @attr boot_size_range_standard
% @type categorical
% @canonical false
% @original_name Boot size range (standard 153-159)
% @values eu39_44_us7_10=EU_39_44_US_7_10 unk_boot_size_range_standard=Unknown
% @importance 1.0

0.92::true_val(boot_size_range_standard, eu39_44_us7_10); 0.08::true_val(boot_size_range_standard, unk_boot_size_range_standard).

measured(s3, boot_size_range_standard, eu39_44_us7_10).

all_consistent(boot_size_range_standard) :- consistent(s3, boot_size_range_standard).

evidence(all_consistent(boot_size_range_standard)).
query(true_val(boot_size_range_standard, eu39_44_us7_10)).
query(true_val(boot_size_range_standard, unk_boot_size_range_standard)).

0.93::acc(s3, boot_size_range_wide).

% @attr boot_size_range_wide
% @type categorical
% @canonical false
% @original_name Boot size range (wide 158W-167W)
% @values eu42_48_us9_14=EU_42_48_US_9_14 unk_boot_size_range_wide=Unknown
% @importance 1.0

0.92::true_val(boot_size_range_wide, eu42_48_us9_14); 0.08::true_val(boot_size_range_wide, unk_boot_size_range_wide).

measured(s3, boot_size_range_wide, eu42_48_us9_14).

all_consistent(boot_size_range_wide) :- consistent(s3, boot_size_range_wide).

evidence(all_consistent(boot_size_range_wide)).
query(true_val(boot_size_range_wide, eu42_48_us9_14)).
query(true_val(boot_size_range_wide, unk_boot_size_range_wide)).

0.65::acc(s2, terrain_suitability).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values powder_park_groomers=Powder_Park_Groomers unk_terrain_suitability=Unknown
% @importance 0.95

0.63::true_val(terrain_suitability, powder_park_groomers); 0.37::true_val(terrain_suitability, unk_terrain_suitability).

measured(s2, terrain_suitability, powder_park_groomers).

all_consistent(terrain_suitability) :- consistent(s2, terrain_suitability).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, powder_park_groomers)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

0.93::acc(s3, riding_style).

% @attr riding_style
% @type categorical
% @canonical false
% @original_name riding_style
% @values all_mountain_freestyle=All_mountain_freestyle unk_riding_style=Unknown
% @importance 1.0

0.92::true_val(riding_style, all_mountain_freestyle); 0.08::true_val(riding_style, unk_riding_style).

measured(s3, riding_style, all_mountain_freestyle).

all_consistent(riding_style) :- consistent(s3, riding_style).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, all_mountain_freestyle)).
query(true_val(riding_style, unk_riding_style)).

0.65::acc(s13, skill_level_recommendation).
0.82::acc(s16, skill_level_recommendation).
0.60::acc(s2, skill_level_recommendation).
0.80::acc(s20, skill_level_recommendation).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values intermediate_to_advanced=Intermediate_to_advanced progressing=Progressing_all_conditions intermediate=Intermediate low_intermediate_ok=Low_intermediate_OK
% @importance 0.813

0.35::true_val(skill_level_recommendation, intermediate_to_advanced); 0.25::true_val(skill_level_recommendation, progressing); 0.20::true_val(skill_level_recommendation, intermediate); 0.20::true_val(skill_level_recommendation, low_intermediate_ok).

measured(s13, skill_level_recommendation, intermediate_to_advanced).
measured(s16, skill_level_recommendation, progressing).
measured(s2, skill_level_recommendation, intermediate).
measured(s20, skill_level_recommendation, low_intermediate_ok).

all_consistent(skill_level_recommendation) :-
    (indep(s13), consistent(s13, skill_level_recommendation) ; \+indep(s13)),
    consistent(s16, skill_level_recommendation),
    (indep(s2), consistent(s2, skill_level_recommendation) ; \+indep(s2)),
    consistent(s20, skill_level_recommendation).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, intermediate_to_advanced)).
query(true_val(skill_level_recommendation, progressing)).
query(true_val(skill_level_recommendation, intermediate)).
query(true_val(skill_level_recommendation, low_intermediate_ok)).

0.68::acc(s13, use_case).

% @attr use_case
% @type categorical
% @canonical false
% @original_name Use case
% @values quiver_killer=One_board_quiver_killer unk_use_case=Unknown
% @importance 0.7

0.60::true_val(use_case, quiver_killer); 0.40::true_val(use_case, unk_use_case).

measured(s13, use_case, quiver_killer).

all_consistent(use_case) :- consistent(s13, use_case).

evidence(all_consistent(use_case)).
query(true_val(use_case, quiver_killer)).
query(true_val(use_case, unk_use_case)).

0.70::acc(s21, switch_riding).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values rides_switch_perfectly=Rides_switch_perfectly unk_switch_riding=Unknown
% @importance 0.6

0.43::true_val(switch_riding, rides_switch_perfectly); 0.57::true_val(switch_riding, unk_switch_riding).

measured(s21, switch_riding, rides_switch_perfectly).

all_consistent(switch_riding) :- consistent(s21, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, rides_switch_perfectly)).
query(true_val(switch_riding, unk_switch_riding)).

0.85::acc(s22, pop).

% @attr pop
% @type categorical
% @canonical true
% @original_name pop
% @values exceptional=Exceptional_pop_unreal_ollies unk_pop=Unknown
% @importance 0.9

0.72::true_val(pop, exceptional); 0.28::true_val(pop, unk_pop).

measured(s22, pop, exceptional).

all_consistent(pop) :- consistent(s22, pop).

evidence(all_consistent(pop)).
query(true_val(pop, exceptional)).
query(true_val(pop, unk_pop)).

0.80::acc(s20, edge_hold).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values super_catch_free=Very_catch_free unk_edge_hold=Unknown
% @importance 0.9

0.64::true_val(edge_hold, super_catch_free); 0.36::true_val(edge_hold, unk_edge_hold).

measured(s20, edge_hold, super_catch_free).

all_consistent(edge_hold) :- consistent(s20, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, super_catch_free)).
query(true_val(edge_hold, unk_edge_hold)).

0.82::acc(s20, turn_initiation_performance).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values very_easy_quick=Very_easy_quick_edge_to_edge unk_turn_initiation_performance=Unknown
% @importance 0.9

0.64::true_val(turn_initiation_performance, very_easy_quick); 0.36::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s20, turn_initiation_performance, very_easy_quick).

all_consistent(turn_initiation_performance) :- consistent(s20, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, very_easy_quick)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

0.78::acc(s20, carving_score_snowboardingprofiles).

% @attr carving_score_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name carving_score_snowboardingprofiles
% @values good_not_epic=Good_but_not_epic_carver unk_carving_score_snowboardingprofiles=Unknown
% @importance 0.9

0.64::true_val(carving_score_snowboardingprofiles, good_not_epic); 0.36::true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles).

measured(s20, carving_score_snowboardingprofiles, good_not_epic).

all_consistent(carving_score_snowboardingprofiles) :- consistent(s20, carving_score_snowboardingprofiles).

evidence(all_consistent(carving_score_snowboardingprofiles)).
query(true_val(carving_score_snowboardingprofiles, good_not_epic)).
query(true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles)).

0.78::acc(s20, carving_feel_3bt).

% @attr carving_feel_3bt
% @type categorical
% @canonical false
% @original_name Carving feel with 3BT
% @values deeper_edge_engagement=Edge_engagement_lower_deeper_than_traditional unk_carving_feel_3bt=Unknown
% @importance 0.9

0.64::true_val(carving_feel_3bt, deeper_edge_engagement); 0.36::true_val(carving_feel_3bt, unk_carving_feel_3bt).

measured(s20, carving_feel_3bt, deeper_edge_engagement).

all_consistent(carving_feel_3bt) :- consistent(s20, carving_feel_3bt).

evidence(all_consistent(carving_feel_3bt)).
query(true_val(carving_feel_3bt, deeper_edge_engagement)).
query(true_val(carving_feel_3bt, unk_carving_feel_3bt)).

0.72::acc(s23, carving_speed_suitability).

% @attr carving_speed_suitability
% @type categorical
% @canonical false
% @original_name Carving speed suitability
% @values good_moderate_slow=Good_moderate_slow_less_high_speed unk_carving_speed_suitability=Unknown
% @importance 0.8

0.56::true_val(carving_speed_suitability, good_moderate_slow); 0.44::true_val(carving_speed_suitability, unk_carving_speed_suitability).

measured(s23, carving_speed_suitability, good_moderate_slow).

all_consistent(carving_speed_suitability) :- consistent(s23, carving_speed_suitability).

evidence(all_consistent(carving_speed_suitability)).
query(true_val(carving_speed_suitability, good_moderate_slow)).
query(true_val(carving_speed_suitability, unk_carving_speed_suitability)).

0.83::acc(s24, negative_aspect).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values sketchy_edge_hard_snow=Trouble_holding_edge_in_hard_snow_sketchy unk_negative_aspect=Unknown
% @importance 0.9

0.72::true_val(negative_aspect, sketchy_edge_hard_snow); 0.28::true_val(negative_aspect, unk_negative_aspect).

measured(s24, negative_aspect, sketchy_edge_hard_snow).

all_consistent(negative_aspect) :- consistent(s24, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, sketchy_edge_hard_snow)).
query(true_val(negative_aspect, unk_negative_aspect)).

0.78::acc(s20, negative_aspect_wobbly).

% @attr negative_aspect_wobbly
% @type categorical
% @canonical false
% @original_name negative_aspect (wobbly at speed)
% @values wobbly_moderate_fast=Wobbly_at_moderately_fast_speeds unk_negative_aspect_wobbly=Unknown
% @importance 0.9

0.64::true_val(negative_aspect_wobbly, wobbly_moderate_fast); 0.36::true_val(negative_aspect_wobbly, unk_negative_aspect_wobbly).

measured(s20, negative_aspect_wobbly, wobbly_moderate_fast).

all_consistent(negative_aspect_wobbly) :- consistent(s20, negative_aspect_wobbly).

evidence(all_consistent(negative_aspect_wobbly)).
query(true_val(negative_aspect_wobbly, wobbly_moderate_fast)).
query(true_val(negative_aspect_wobbly, unk_negative_aspect_wobbly)).

0.78::acc(s20, negative_aspect_chattery).

% @attr negative_aspect_chattery
% @type categorical
% @canonical false
% @original_name negative_aspect (chattery in crud)
% @values chattery_crud=Chattery_in_crud_chunder unk_negative_aspect_chattery=Unknown
% @importance 0.9

0.64::true_val(negative_aspect_chattery, chattery_crud); 0.36::true_val(negative_aspect_chattery, unk_negative_aspect_chattery).

measured(s20, negative_aspect_chattery, chattery_crud).

all_consistent(negative_aspect_chattery) :- consistent(s20, negative_aspect_chattery).

evidence(all_consistent(negative_aspect_chattery)).
query(true_val(negative_aspect_chattery, chattery_crud)).
query(true_val(negative_aspect_chattery, unk_negative_aspect_chattery)).

0.83::acc(s24, negative_aspect_washy).

% @attr negative_aspect_washy
% @type categorical
% @canonical false
% @original_name negative_aspect (washy feel)
% @values washy_medium_hard_snow=Edgeless_washy_feel_medium_to_hard_snow unk_negative_aspect_washy=Unknown
% @importance 0.9

0.72::true_val(negative_aspect_washy, washy_medium_hard_snow); 0.28::true_val(negative_aspect_washy, unk_negative_aspect_washy).

measured(s24, negative_aspect_washy, washy_medium_hard_snow).

all_consistent(negative_aspect_washy) :- consistent(s24, negative_aspect_washy).

evidence(all_consistent(negative_aspect_washy)).
query(true_val(negative_aspect_washy, washy_medium_hard_snow)).
query(true_val(negative_aspect_washy, unk_negative_aspect_washy)).

0.85::acc(s22, positive_aspect).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values good_float_despite_camber=Good_float_TBT_helps_despite_camber unk_positive_aspect=Unknown
% @importance 0.9

0.72::true_val(positive_aspect, good_float_despite_camber); 0.28::true_val(positive_aspect, unk_positive_aspect).

measured(s22, positive_aspect, good_float_despite_camber).

all_consistent(positive_aspect) :- consistent(s22, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, good_float_despite_camber)).
query(true_val(positive_aspect, unk_positive_aspect)).

0.83::acc(s24, positive_aspect_buttering).

% @attr positive_aspect_buttering
% @type categorical
% @canonical false
% @original_name positive_aspect (buttering)
% @values very_good_buttering=Very_good_flat_sections_aid_buttering unk_positive_aspect_buttering=Unknown
% @importance 0.9

0.72::true_val(positive_aspect_buttering, very_good_buttering); 0.28::true_val(positive_aspect_buttering, unk_positive_aspect_buttering).

measured(s24, positive_aspect_buttering, very_good_buttering).

all_consistent(positive_aspect_buttering) :- consistent(s24, positive_aspect_buttering).

evidence(all_consistent(positive_aspect_buttering)).
query(true_val(positive_aspect_buttering, very_good_buttering)).
query(true_val(positive_aspect_buttering, unk_positive_aspect_buttering)).

0.80::acc(s20, board_weight_grams).
0.83::acc(s24, board_weight_grams).

% @attr board_weight_grams
% @type categorical
% @canonical true
% @original_name board_weight_grams
% @values lighter_than_avg=Lighter_than_average unk_board_weight_grams=Unknown
% @importance 0.9

0.95::true_val(board_weight_grams, lighter_than_avg); 0.05::true_val(board_weight_grams, unk_board_weight_grams).

measured(s20, board_weight_grams, lighter_than_avg).
measured(s24, board_weight_grams, lighter_than_avg).

all_consistent(board_weight_grams) :- consistent(s20, board_weight_grams), consistent(s24, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, lighter_than_avg)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

0.78::acc(s20, reviewer_opinion_snowboardingprofiles).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles
% @values great_allrounder=Great_allrounder_capable_of_almost_anything unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.9

0.64::true_val(reviewer_opinion_snowboardingprofiles, great_allrounder); 0.36::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).

measured(s20, reviewer_opinion_snowboardingprofiles, great_allrounder).

all_consistent(reviewer_opinion_snowboardingprofiles) :- consistent(s20, reviewer_opinion_snowboardingprofiles).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, great_allrounder)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

0.82::acc(s16, reviewer_opinion_whitelines).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values true_all_mountain_legend=True_all_mountain_legend unk_reviewer_opinion_whitelines=Unknown
% @importance 0.8

0.72::true_val(reviewer_opinion_whitelines, true_all_mountain_legend); 0.28::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

measured(s16, reviewer_opinion_whitelines, true_all_mountain_legend).

all_consistent(reviewer_opinion_whitelines) :- consistent(s16, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, true_all_mountain_legend)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

0.55::acc(s25, overall_impression_wobble_snow).

% @attr overall_impression_wobble_snow
% @type categorical
% @canonical false
% @original_name Overall impression (Wobble Snow)
% @values comfy_slippers=Like_slipping_into_comfy_slippers unk_overall_impression_wobble_snow=Unknown
% @importance 0.5

0.35::true_val(overall_impression_wobble_snow, comfy_slippers); 0.65::true_val(overall_impression_wobble_snow, unk_overall_impression_wobble_snow).

measured(s25, overall_impression_wobble_snow, comfy_slippers).

all_consistent(overall_impression_wobble_snow) :- consistent(s25, overall_impression_wobble_snow).

evidence(all_consistent(overall_impression_wobble_snow)).
query(true_val(overall_impression_wobble_snow, comfy_slippers)).
query(true_val(overall_impression_wobble_snow, unk_overall_impression_wobble_snow)).

0.75::acc(s3, user_review_forum).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values confidence_increase=Instantly_easier_confidence_increased unk_user_review_forum=Unknown
% @importance 1.0

0.72::true_val(user_review_forum, confidence_increase); 0.28::true_val(user_review_forum, unk_user_review_forum).

measured(s3, user_review_forum, confidence_increase).

all_consistent(user_review_forum) :- consistent(s3, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, confidence_increase)).
query(true_val(user_review_forum, unk_user_review_forum)).

0.75::acc(s3, user_review_forum_2).

% @attr user_review_forum_2
% @type categorical
% @canonical false
% @original_name user_review_forum (light/easy turn)
% @values super_light_easy_turn=Super_light_easy_to_turn_stable unk_user_review_forum_2=Unknown
% @importance 1.0

0.72::true_val(user_review_forum_2, super_light_easy_turn); 0.28::true_val(user_review_forum_2, unk_user_review_forum_2).

measured(s3, user_review_forum_2, super_light_easy_turn).

all_consistent(user_review_forum_2) :- consistent(s3, user_review_forum_2).

evidence(all_consistent(user_review_forum_2)).
query(true_val(user_review_forum_2, super_light_easy_turn)).
query(true_val(user_review_forum_2, unk_user_review_forum_2)).

0.65::acc(s26, user_review_forum_3).

% @attr user_review_forum_3
% @type categorical
% @canonical false
% @original_name user_review_forum (stable/park)
% @values stable_good_park=Stable_good_feedback_fun_in_park unk_user_review_forum_3=Unknown
% @importance 0.55

0.52::true_val(user_review_forum_3, stable_good_park); 0.48::true_val(user_review_forum_3, unk_user_review_forum_3).

measured(s26, user_review_forum_3, stable_good_park).

all_consistent(user_review_forum_3) :- consistent(s26, user_review_forum_3).

evidence(all_consistent(user_review_forum_3)).
query(true_val(user_review_forum_3, stable_good_park)).
query(true_val(user_review_forum_3, unk_user_review_forum_3)).

0.75::acc(s3, user_review_forum_4).

% @attr user_review_forum_4
% @type categorical
% @canonical false
% @original_name user_review_forum (customer service)
% @values cs_unhelpful=Customer_service_unhelpful_poorly_written unk_user_review_forum_4=Unknown
% @importance 1.0

0.72::true_val(user_review_forum_4, cs_unhelpful); 0.28::true_val(user_review_forum_4, unk_user_review_forum_4).

measured(s3, user_review_forum_4, cs_unhelpful).

all_consistent(user_review_forum_4) :- consistent(s3, user_review_forum_4).

evidence(all_consistent(user_review_forum_4)).
query(true_val(user_review_forum_4, cs_unhelpful)).
query(true_val(user_review_forum_4, unk_user_review_forum_4)).

0.75::acc(s3, user_review_forum_5).

% @attr user_review_forum_5
% @type categorical
% @canonical false
% @original_name user_review_forum (shipping delayed)
% @values shipping_extremely_delayed=Shipping_extremely_delayed unk_user_review_forum_5=Unknown
% @importance 1.0

0.72::true_val(user_review_forum_5, shipping_extremely_delayed); 0.28::true_val(user_review_forum_5, unk_user_review_forum_5).

measured(s3, user_review_forum_5, shipping_extremely_delayed).

all_consistent(user_review_forum_5) :- consistent(s3, user_review_forum_5).

evidence(all_consistent(user_review_forum_5)).
query(true_val(user_review_forum_5, shipping_extremely_delayed)).
query(true_val(user_review_forum_5, unk_user_review_forum_5)).

0.83::acc(s24, reviewer_opinion_the_good_ride).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values rides_like_true_twin=Rides_almost_like_true_twin_centred_feel unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.9

0.72::true_val(reviewer_opinion_the_good_ride, rides_like_true_twin); 0.28::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s24, reviewer_opinion_the_good_ride, rides_like_true_twin).

all_consistent(reviewer_opinion_the_good_ride) :- consistent(s24, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, rides_like_true_twin)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

0.55::acc(s27, user_review_forum_6).

% @attr user_review_forum_6
% @type categorical
% @canonical false
% @original_name user_review_forum (different but comfortable)
% @values different_instantly_comfortable=Feel_different_but_instantly_comfortable unk_user_review_forum_6=Unknown
% @importance 0.7

0.32::true_val(user_review_forum_6, different_instantly_comfortable); 0.68::true_val(user_review_forum_6, unk_user_review_forum_6).

measured(s27, user_review_forum_6, different_instantly_comfortable).

all_consistent(user_review_forum_6) :- consistent(s27, user_review_forum_6).

evidence(all_consistent(user_review_forum_6)).
query(true_val(user_review_forum_6, different_instantly_comfortable)).
query(true_val(user_review_forum_6, unk_user_review_forum_6)).

0.83::acc(s24, reviewer_opinion_the_good_ride_3bt).

% @attr reviewer_opinion_the_good_ride_3bt
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (3BT adjustment)
% @values takes_few_days=3BT_takes_few_days_to_understand unk_reviewer_opinion_the_good_ride_3bt=Unknown
% @importance 0.9

0.72::true_val(reviewer_opinion_the_good_ride_3bt, takes_few_days); 0.28::true_val(reviewer_opinion_the_good_ride_3bt, unk_reviewer_opinion_the_good_ride_3bt).

measured(s24, reviewer_opinion_the_good_ride_3bt, takes_few_days).

all_consistent(reviewer_opinion_the_good_ride_3bt) :- consistent(s24, reviewer_opinion_the_good_ride_3bt).

evidence(all_consistent(reviewer_opinion_the_good_ride_3bt)).
query(true_val(reviewer_opinion_the_good_ride_3bt, takes_few_days)).
query(true_val(reviewer_opinion_the_good_ride_3bt, unk_reviewer_opinion_the_good_ride_3bt)).

0.90::acc(s3, price_bataleon_us_sale).

% @attr price_bataleon_us_sale
% @type numeric
% @unit USD
% @canonical false
% @original_name Price Bataleon US (sale)
% @values v440_95=440.95 unk_price_bataleon_us_sale=Unknown
% @importance 1.0

0.90::true_val(price_bataleon_us_sale, v440_95); 0.10::true_val(price_bataleon_us_sale, unk_price_bataleon_us_sale).

measured(s3, price_bataleon_us_sale, v440_95).

all_consistent(price_bataleon_us_sale) :- consistent(s3, price_bataleon_us_sale).

evidence(all_consistent(price_bataleon_us_sale)).
query(true_val(price_bataleon_us_sale, v440_95)).
query(true_val(price_bataleon_us_sale, unk_price_bataleon_us_sale)).

0.93::acc(s3, price_usd_msrp).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v629_95=629.95 unk_price_usd_msrp=Unknown
% @importance 1.0

0.92::true_val(price_usd_msrp, v629_95); 0.08::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s3, price_usd_msrp, v629_95).

all_consistent(price_usd_msrp) :- consistent(s3, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v629_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

0.88::acc(s28, price_usd_evo).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_evo
% @values v440_96=440.96 unk_price_usd_evo=Unknown
% @importance 0.9

0.77::true_val(price_usd_evo, v440_96); 0.23::true_val(price_usd_evo, unk_price_usd_evo).

measured(s28, price_usd_evo, v440_96).

all_consistent(price_usd_evo) :- consistent(s28, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v440_96)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

0.82::acc(s16, price_usd_evo_rrp).

% @attr price_usd_evo_rrp
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_evo (RRP/full)
% @values v629=629.0 unk_price_usd_evo_rrp=Unknown
% @importance 0.8

0.72::true_val(price_usd_evo_rrp, v629); 0.28::true_val(price_usd_evo_rrp, unk_price_usd_evo_rrp).

measured(s16, price_usd_evo_rrp, v629).

all_consistent(price_usd_evo_rrp) :- consistent(s16, price_usd_evo_rrp).

evidence(all_consistent(price_usd_evo_rrp)).
query(true_val(price_usd_evo_rrp, v629)).
query(true_val(price_usd_evo_rrp, unk_price_usd_evo_rrp)).

0.75::acc(s29, price_usd_s2as_2027).

% @attr price_usd_s2as_2027
% @type numeric
% @unit USD
% @canonical false
% @original_name Price S2AS (2027 Goliath)
% @values v623=623.0 unk_price_usd_s2as_2027=Unknown
% @importance 0.85

0.63::true_val(price_usd_s2as_2027, v623); 0.37::true_val(price_usd_s2as_2027, unk_price_usd_s2as_2027).

measured(s29, price_usd_s2as_2027, v623).

all_consistent(price_usd_s2as_2027) :- consistent(s29, price_usd_s2as_2027).

evidence(all_consistent(price_usd_s2as_2027)).
query(true_val(price_usd_s2as_2027, v623)).
query(true_val(price_usd_s2as_2027, unk_price_usd_s2as_2027)).

0.75::acc(s30, price_usd_s2as_goliath_plus).

% @attr price_usd_s2as_goliath_plus
% @type numeric
% @unit USD
% @canonical false
% @original_name Price S2AS (2027 Goliath+)
% @values v673=673.0 unk_price_usd_s2as_goliath_plus=Unknown
% @importance 0.8

0.63::true_val(price_usd_s2as_goliath_plus, v673); 0.37::true_val(price_usd_s2as_goliath_plus, unk_price_usd_s2as_goliath_plus).

measured(s30, price_usd_s2as_goliath_plus, v673).

all_consistent(price_usd_s2as_goliath_plus) :- consistent(s30, price_usd_s2as_goliath_plus).

evidence(all_consistent(price_usd_s2as_goliath_plus)).
query(true_val(price_usd_s2as_goliath_plus, v673)).
query(true_val(price_usd_s2as_goliath_plus, unk_price_usd_s2as_goliath_plus)).

0.70::acc(s2, price_aud_merchant).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v1079_99=1079.99 unk_price_aud_merchant=Unknown
% @importance 0.95

0.63::true_val(price_aud_merchant, v1079_99); 0.37::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s2, price_aud_merchant, v1079_99).

all_consistent(price_aud_merchant) :- consistent(s2, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v1079_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

0.70::acc(s2, availability_status).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values preorder_may_2026=Preorder_estimated_May_2026 unk_availability_status=Unknown
% @importance 0.95

0.63::true_val(availability_status, preorder_may_2026); 0.37::true_val(availability_status, unk_availability_status).

measured(s2, availability_status, preorder_may_2026).

all_consistent(availability_status) :- consistent(s2, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, preorder_may_2026)).
query(true_val(availability_status, unk_availability_status)).

0.90::acc(s3, availability_status_bataleon).

% @attr availability_status_bataleon
% @type categorical
% @canonical false
% @original_name availability_status (Bataleon.com)
% @values all_sizes_sold_out=All_sizes_sold_out unk_availability_status_bataleon=Unknown
% @importance 1.0

0.90::true_val(availability_status_bataleon, all_sizes_sold_out); 0.10::true_val(availability_status_bataleon, unk_availability_status_bataleon).

measured(s3, availability_status_bataleon, all_sizes_sold_out).

all_consistent(availability_status_bataleon) :- consistent(s3, availability_status_bataleon).

evidence(all_consistent(availability_status_bataleon)).
query(true_val(availability_status_bataleon, all_sizes_sold_out)).
query(true_val(availability_status_bataleon, unk_availability_status_bataleon)).

0.65::acc(s31, estimated_availability_date).

% @attr estimated_availability_date
% @type categorical
% @canonical true
% @original_name estimated_availability_date
% @values apr_may_2026=April_May_2026 unk_estimated_availability_date=Unknown
% @importance 0.7

0.59::true_val(estimated_availability_date, apr_may_2026); 0.41::true_val(estimated_availability_date, unk_estimated_availability_date).

measured(s31, estimated_availability_date, apr_may_2026).

all_consistent(estimated_availability_date) :- consistent(s31, estimated_availability_date).

evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, apr_may_2026)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

0.70::acc(s29, availability_status_s2as).

% @attr availability_status_s2as
% @type categorical
% @canonical false
% @original_name availability_status (S2AS)
% @values preorder_low_stock=Pre_order_low_stock unk_availability_status_s2as=Unknown
% @importance 0.85

0.63::true_val(availability_status_s2as, preorder_low_stock); 0.37::true_val(availability_status_s2as, unk_availability_status_s2as).

measured(s29, availability_status_s2as, preorder_low_stock).

all_consistent(availability_status_s2as) :- consistent(s29, availability_status_s2as).

evidence(all_consistent(availability_status_s2as)).
query(true_val(availability_status_s2as, preorder_low_stock)).
query(true_val(availability_status_s2as, unk_availability_status_s2as)).

0.65::acc(s19, availability_status_snowboard_shop).

% @attr availability_status_snowboard_shop
% @type categorical
% @canonical false
% @original_name availability_status (The Snowboard Shop)
% @values backordered_preorder=Backordered_pre_order unk_availability_status_snowboard_shop=Unknown
% @importance 0.65

0.60::true_val(availability_status_snowboard_shop, backordered_preorder); 0.40::true_val(availability_status_snowboard_shop, unk_availability_status_snowboard_shop).

measured(s19, availability_status_snowboard_shop, backordered_preorder).

all_consistent(availability_status_snowboard_shop) :- consistent(s19, availability_status_snowboard_shop).

evidence(all_consistent(availability_status_snowboard_shop)).
query(true_val(availability_status_snowboard_shop, backordered_preorder)).
query(true_val(availability_status_snowboard_shop, unk_availability_status_snowboard_shop)).

0.65::acc(s2, shipping_restriction_merchant).

% @attr shipping_restriction_merchant
% @type categorical
% @canonical false
% @original_name Shipping restriction (merchant)
% @values australia_only=Only_available_shipping_within_Australia unk_shipping_restriction_merchant=Unknown
% @importance 0.95

0.63::true_val(shipping_restriction_merchant, australia_only); 0.37::true_val(shipping_restriction_merchant, unk_shipping_restriction_merchant).

measured(s2, shipping_restriction_merchant, australia_only).

all_consistent(shipping_restriction_merchant) :- consistent(s2, shipping_restriction_merchant).

evidence(all_consistent(shipping_restriction_merchant)).
query(true_val(shipping_restriction_merchant, australia_only)).
query(true_val(shipping_restriction_merchant, unk_shipping_restriction_merchant)).

0.90::acc(s3, retailer_bataleon).

% @attr retailer_bataleon
% @type categorical
% @canonical false
% @original_name Retailer Bataleon.com
% @values dtc_45day_warranty=DTC_45day_returns_2plus1_warranty_free_ship unk_retailer_bataleon=Unknown
% @importance 1.0

0.90::true_val(retailer_bataleon, dtc_45day_warranty); 0.10::true_val(retailer_bataleon, unk_retailer_bataleon).

measured(s3, retailer_bataleon, dtc_45day_warranty).

all_consistent(retailer_bataleon) :- consistent(s3, retailer_bataleon).

evidence(all_consistent(retailer_bataleon)).
query(true_val(retailer_bataleon, dtc_45day_warranty)).
query(true_val(retailer_bataleon, unk_retailer_bataleon)).

0.85::acc(s28, retailer_evo).

% @attr retailer_evo
% @type categorical
% @canonical false
% @original_name Retailer evo.com
% @values major_us_price_match=Major_US_retailer_price_match_free_ship unk_retailer_evo=Unknown
% @importance 0.9

0.77::true_val(retailer_evo, major_us_price_match); 0.23::true_val(retailer_evo, unk_retailer_evo).

measured(s28, retailer_evo, major_us_price_match).

all_consistent(retailer_evo) :- consistent(s28, retailer_evo).

evidence(all_consistent(retailer_evo)).
query(true_val(retailer_evo, major_us_price_match)).
query(true_val(retailer_evo, unk_retailer_evo)).

0.70::acc(s29, retailer_s2as).

% @attr retailer_s2as
% @type categorical
% @canonical false
% @original_name Retailer S2AS
% @values uk_authorised_15yr=UK_authorised_15plus_years_price_match_intl unk_retailer_s2as=Unknown
% @importance 0.85

0.63::true_val(retailer_s2as, uk_authorised_15yr); 0.37::true_val(retailer_s2as, unk_retailer_s2as).

measured(s29, retailer_s2as, uk_authorised_15yr).

all_consistent(retailer_s2as) :- consistent(s29, retailer_s2as).

evidence(all_consistent(retailer_s2as)).
query(true_val(retailer_s2as, uk_authorised_15yr)).
query(true_val(retailer_s2as, unk_retailer_s2as)).

0.55::acc(s32, retailer_source).

% @attr retailer_source
% @type categorical
% @canonical false
% @original_name Retailer The Source
% @values na_speciality=North_American_speciality_shop unk_retailer_source=Unknown
% @importance 0.5

0.49::true_val(retailer_source, na_speciality); 0.51::true_val(retailer_source, unk_retailer_source).

measured(s32, retailer_source, na_speciality).

all_consistent(retailer_source) :- consistent(s32, retailer_source).

evidence(all_consistent(retailer_source)).
query(true_val(retailer_source, na_speciality)).
query(true_val(retailer_source, unk_retailer_source)).

0.45::acc(s33, retailer_blauer).

% @attr retailer_blauer
% @type categorical
% @canonical false
% @original_name Retailer Blauer Board Shop
% @values us_speciality=US_speciality_snowboard_shop unk_retailer_blauer=Unknown
% @importance 0.4

0.30::true_val(retailer_blauer, us_speciality); 0.70::true_val(retailer_blauer, unk_retailer_blauer).

measured(s33, retailer_blauer, us_speciality).

all_consistent(retailer_blauer) :- consistent(s33, retailer_blauer).

evidence(all_consistent(retailer_blauer)).
query(true_val(retailer_blauer, us_speciality)).
query(true_val(retailer_blauer, unk_retailer_blauer)).

0.65::acc(s19, retailer_snowboard_shop).

% @attr retailer_snowboard_shop
% @type categorical
% @canonical false
% @original_name Retailer The Snowboard Shop
% @values uk_speciality_klarna=UK_speciality_Klarna_Clearpay unk_retailer_snowboard_shop=Unknown
% @importance 0.65

0.60::true_val(retailer_snowboard_shop, uk_speciality_klarna); 0.40::true_val(retailer_snowboard_shop, unk_retailer_snowboard_shop).

measured(s19, retailer_snowboard_shop, uk_speciality_klarna).

all_consistent(retailer_snowboard_shop) :- consistent(s19, retailer_snowboard_shop).

evidence(all_consistent(retailer_snowboard_shop)).
query(true_val(retailer_snowboard_shop, uk_speciality_klarna)).
query(true_val(retailer_snowboard_shop, unk_retailer_snowboard_shop)).

0.65::acc(s31, retailer_balmoral).

% @attr retailer_balmoral
% @type categorical
% @canonical false
% @original_name Retailer Balmoral Boards
% @values au_speciality_layby=Australian_speciality_10_flat_rate_layby unk_retailer_balmoral=Unknown
% @importance 0.7

0.59::true_val(retailer_balmoral, au_speciality_layby); 0.41::true_val(retailer_balmoral, unk_retailer_balmoral).

measured(s31, retailer_balmoral, au_speciality_layby).

all_consistent(retailer_balmoral) :- consistent(s31, retailer_balmoral).

evidence(all_consistent(retailer_balmoral)).
query(true_val(retailer_balmoral, au_speciality_layby)).
query(true_val(retailer_balmoral, unk_retailer_balmoral)).

0.55::acc(s34, retailer_absolute_snow).

% @attr retailer_absolute_snow
% @type categorical
% @canonical false
% @original_name Retailer Absolute Snow
% @values uk_retailer=UK_retailer_stocking_Bataleon unk_retailer_absolute_snow=Unknown
% @importance 0.45

0.46::true_val(retailer_absolute_snow, uk_retailer); 0.54::true_val(retailer_absolute_snow, unk_retailer_absolute_snow).

measured(s34, retailer_absolute_snow, uk_retailer).

all_consistent(retailer_absolute_snow) :- consistent(s34, retailer_absolute_snow).

evidence(all_consistent(retailer_absolute_snow)).
query(true_val(retailer_absolute_snow, uk_retailer)).
query(true_val(retailer_absolute_snow, unk_retailer_absolute_snow)).

0.50::acc(s27, user_review_forum_7).

% @attr user_review_forum_7
% @type categorical
% @canonical false
% @original_name user_review_forum (buy from Canada)
% @values buy_from_canada=Buy_from_Canada_30_shipping_good_exchange unk_user_review_forum_7=Unknown
% @importance 0.7

0.32::true_val(user_review_forum_7, buy_from_canada); 0.68::true_val(user_review_forum_7, unk_user_review_forum_7).

measured(s27, user_review_forum_7, buy_from_canada).

all_consistent(user_review_forum_7) :- consistent(s27, user_review_forum_7).

evidence(all_consistent(user_review_forum_7)).
query(true_val(user_review_forum_7, buy_from_canada)).
query(true_val(user_review_forum_7, unk_user_review_forum_7)).

0.72::acc(s35, comparable_board_same_brand).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values goliath_plus=Goliath_Plus_stiffer_7_10_super_ultra_light_core unk_comparable_board_same_brand=Unknown
% @importance 0.75

0.63::true_val(comparable_board_same_brand, goliath_plus); 0.37::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s35, comparable_board_same_brand, goliath_plus).

all_consistent(comparable_board_same_brand) :-
    (indep(s35), consistent(s35, comparable_board_same_brand) ; \+indep(s35)).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, goliath_plus)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

0.68::acc(s13, comparable_board_same_brand_flex).
0.72::acc(s35, comparable_board_same_brand_flex).

% @attr comparable_board_same_brand_flex
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (flex comparison)
% @values goliath_6_plus_7=Goliath_6_10_vs_Goliath_Plus_7_10 unk_comparable_board_same_brand_flex=Unknown
% @importance 0.725

0.95::true_val(comparable_board_same_brand_flex, goliath_6_plus_7); 0.05::true_val(comparable_board_same_brand_flex, unk_comparable_board_same_brand_flex).

measured(s13, comparable_board_same_brand_flex, goliath_6_plus_7).
measured(s35, comparable_board_same_brand_flex, goliath_6_plus_7).

all_consistent(comparable_board_same_brand_flex) :-
    (indep(s13), consistent(s13, comparable_board_same_brand_flex) ; \+indep(s13)),
    (indep(s35), consistent(s35, comparable_board_same_brand_flex) ; \+indep(s35)).

evidence(all_consistent(comparable_board_same_brand_flex)).
query(true_val(comparable_board_same_brand_flex, goliath_6_plus_7)).
query(true_val(comparable_board_same_brand_flex, unk_comparable_board_same_brand_flex)).

0.55::acc(s18, comparable_board_same_brand_core).
0.72::acc(s35, comparable_board_same_brand_core).

% @attr comparable_board_same_brand_core
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (core comparison)
% @values ulc_vs_sulc_airride=Ultra_Light_vs_Super_Ultra_Light_AirRide unk_comparable_board_same_brand_core=Unknown
% @importance 0.725

0.95::true_val(comparable_board_same_brand_core, ulc_vs_sulc_airride); 0.05::true_val(comparable_board_same_brand_core, unk_comparable_board_same_brand_core).

measured(s18, comparable_board_same_brand_core, ulc_vs_sulc_airride).
measured(s35, comparable_board_same_brand_core, ulc_vs_sulc_airride).

all_consistent(comparable_board_same_brand_core) :-
    (indep(s18), consistent(s18, comparable_board_same_brand_core) ; \+indep(s18)),
    (indep(s35), consistent(s35, comparable_board_same_brand_core) ; \+indep(s35)).

evidence(all_consistent(comparable_board_same_brand_core)).
query(true_val(comparable_board_same_brand_core, ulc_vs_sulc_airride)).
query(true_val(comparable_board_same_brand_core, unk_comparable_board_same_brand_core)).

0.85::acc(s22, comparable_board_same_brand_pop).

% @attr comparable_board_same_brand_pop
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (pop comparison)
% @values plus_more_pop=Goliath_Plus_has_more_pop unk_comparable_board_same_brand_pop=Unknown
% @importance 0.9

0.72::true_val(comparable_board_same_brand_pop, plus_more_pop); 0.28::true_val(comparable_board_same_brand_pop, unk_comparable_board_same_brand_pop).

measured(s22, comparable_board_same_brand_pop, plus_more_pop).

all_consistent(comparable_board_same_brand_pop) :- consistent(s22, comparable_board_same_brand_pop).

evidence(all_consistent(comparable_board_same_brand_pop)).
query(true_val(comparable_board_same_brand_pop, plus_more_pop)).
query(true_val(comparable_board_same_brand_pop, unk_comparable_board_same_brand_pop)).

0.72::acc(s35, comparable_board_same_brand_airride).

% @attr comparable_board_same_brand_airride
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (AirRide)
% @values plus_has_airride=Goliath_Plus_has_AirRide_standard_does_not unk_comparable_board_same_brand_airride=Unknown
% @importance 0.75

0.63::true_val(comparable_board_same_brand_airride, plus_has_airride); 0.37::true_val(comparable_board_same_brand_airride, unk_comparable_board_same_brand_airride).

measured(s35, comparable_board_same_brand_airride, plus_has_airride).

all_consistent(comparable_board_same_brand_airride) :-
    (indep(s35), consistent(s35, comparable_board_same_brand_airride) ; \+indep(s35)).

evidence(all_consistent(comparable_board_same_brand_airride)).
query(true_val(comparable_board_same_brand_airride, plus_has_airride)).
query(true_val(comparable_board_same_brand_airride, unk_comparable_board_same_brand_airride)).

0.65::acc(s36, comparable_board_same_brand_whatever).

% @attr comparable_board_same_brand_whatever
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Whatever)
% @values whatever_softer_5_10=Bataleon_Whatever_softer_flex_5_10 unk_comparable_board_same_brand_whatever=Unknown
% @importance 0.5

0.49::true_val(comparable_board_same_brand_whatever, whatever_softer_5_10); 0.51::true_val(comparable_board_same_brand_whatever, unk_comparable_board_same_brand_whatever).

measured(s36, comparable_board_same_brand_whatever, whatever_softer_5_10).

all_consistent(comparable_board_same_brand_whatever) :-
    (indep(s36), consistent(s36, comparable_board_same_brand_whatever) ; \+indep(s36)).

evidence(all_consistent(comparable_board_same_brand_whatever)).
query(true_val(comparable_board_same_brand_whatever, whatever_softer_5_10)).
query(true_val(comparable_board_same_brand_whatever, unk_comparable_board_same_brand_whatever)).

0.68::acc(s37, comparable_board_same_brand_funkink).

% @attr comparable_board_same_brand_funkink
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Fun.Kink)
% @values funkink_medium_soft_4_10=Bataleon_Fun_Kink_medium_soft_4_10 unk_comparable_board_same_brand_funkink=Unknown
% @importance 0.45

0.60::true_val(comparable_board_same_brand_funkink, funkink_medium_soft_4_10); 0.40::true_val(comparable_board_same_brand_funkink, unk_comparable_board_same_brand_funkink).

measured(s37, comparable_board_same_brand_funkink, funkink_medium_soft_4_10).

all_consistent(comparable_board_same_brand_funkink) :-
    (indep(s37), consistent(s37, comparable_board_same_brand_funkink) ; \+indep(s37)).

evidence(all_consistent(comparable_board_same_brand_funkink)).
query(true_val(comparable_board_same_brand_funkink, funkink_medium_soft_4_10)).
query(true_val(comparable_board_same_brand_funkink, unk_comparable_board_same_brand_funkink)).

0.78::acc(s38, comparable_board_cross_brand).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values jones_mt_better_edge=Jones_Mountain_Twin_better_edge_hold unk_comparable_board_cross_brand=Unknown
% @importance 0.85

0.64::true_val(comparable_board_cross_brand, jones_mt_better_edge); 0.36::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s38, comparable_board_cross_brand, jones_mt_better_edge).

all_consistent(comparable_board_cross_brand) :- consistent(s38, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, jones_mt_better_edge)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

0.72::acc(s39, comparable_board_cross_brand_yes).

% @attr comparable_board_cross_brand_yes
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (YES Standard)
% @values yes_standard_top_quiver=YES_Standard_top_all_mountain_quiver unk_comparable_board_cross_brand_yes=Unknown
% @importance 0.8

0.56::true_val(comparable_board_cross_brand_yes, yes_standard_top_quiver); 0.44::true_val(comparable_board_cross_brand_yes, unk_comparable_board_cross_brand_yes).

measured(s39, comparable_board_cross_brand_yes, yes_standard_top_quiver).

all_consistent(comparable_board_cross_brand_yes) :- consistent(s39, comparable_board_cross_brand_yes).

evidence(all_consistent(comparable_board_cross_brand_yes)).
query(true_val(comparable_board_cross_brand_yes, yes_standard_top_quiver)).
query(true_val(comparable_board_cross_brand_yes, unk_comparable_board_cross_brand_yes)).

0.60::acc(s40, comparable_board_cross_brand_capita).

% @attr comparable_board_cross_brand_capita
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Capita Mercury)
% @values capita_mercury_more_aggressive=Capita_Mercury_more_aggressive_edge_to_edge unk_comparable_board_cross_brand_capita=Unknown
% @importance 0.65

0.46::true_val(comparable_board_cross_brand_capita, capita_mercury_more_aggressive); 0.54::true_val(comparable_board_cross_brand_capita, unk_comparable_board_cross_brand_capita).

measured(s40, comparable_board_cross_brand_capita, capita_mercury_more_aggressive).

all_consistent(comparable_board_cross_brand_capita) :- consistent(s40, comparable_board_cross_brand_capita).

evidence(all_consistent(comparable_board_cross_brand_capita)).
query(true_val(comparable_board_cross_brand_capita, capita_mercury_more_aggressive)).
query(true_val(comparable_board_cross_brand_capita, unk_comparable_board_cross_brand_capita)).

0.78::acc(s38, comparable_board_cross_brand_list1).

% @attr comparable_board_cross_brand_list1
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (list 1)
% @values frontier_mt_yes_gnu_arbor=Jones_Frontier_MT_YES_Standard_GNU_4x4_Arbor_Shiloh unk_comparable_board_cross_brand_list1=Unknown
% @importance 0.85

0.64::true_val(comparable_board_cross_brand_list1, frontier_mt_yes_gnu_arbor); 0.36::true_val(comparable_board_cross_brand_list1, unk_comparable_board_cross_brand_list1).

measured(s38, comparable_board_cross_brand_list1, frontier_mt_yes_gnu_arbor).

all_consistent(comparable_board_cross_brand_list1) :- consistent(s38, comparable_board_cross_brand_list1).

evidence(all_consistent(comparable_board_cross_brand_list1)).
query(true_val(comparable_board_cross_brand_list1, frontier_mt_yes_gnu_arbor)).
query(true_val(comparable_board_cross_brand_list1, unk_comparable_board_cross_brand_list1)).

0.85::acc(s22, comparable_board_cross_brand_list2).

% @attr comparable_board_cross_brand_list2
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (list 2)
% @values korua_ride_salomon_yes_capita_jones_nitro=Korua_Ride_Salomon_YES_Capita_Jones_Nitro unk_comparable_board_cross_brand_list2=Unknown
% @importance 0.9

0.72::true_val(comparable_board_cross_brand_list2, korua_ride_salomon_yes_capita_jones_nitro); 0.28::true_val(comparable_board_cross_brand_list2, unk_comparable_board_cross_brand_list2).

measured(s22, comparable_board_cross_brand_list2, korua_ride_salomon_yes_capita_jones_nitro).

all_consistent(comparable_board_cross_brand_list2) :- consistent(s22, comparable_board_cross_brand_list2).

evidence(all_consistent(comparable_board_cross_brand_list2)).
query(true_val(comparable_board_cross_brand_list2, korua_ride_salomon_yes_capita_jones_nitro)).
query(true_val(comparable_board_cross_brand_list2, unk_comparable_board_cross_brand_list2)).

0.55::acc(s27, comparable_board_cross_brand_mt_detail).

% @attr comparable_board_cross_brand_mt_detail
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (MT detail)
% @values mt_more_edge_less_aggressive=MT_touch_more_edge_hold_less_aggressive_feel unk_comparable_board_cross_brand_mt_detail=Unknown
% @importance 0.7

0.32::true_val(comparable_board_cross_brand_mt_detail, mt_more_edge_less_aggressive); 0.68::true_val(comparable_board_cross_brand_mt_detail, unk_comparable_board_cross_brand_mt_detail).

measured(s27, comparable_board_cross_brand_mt_detail, mt_more_edge_less_aggressive).

all_consistent(comparable_board_cross_brand_mt_detail) :- consistent(s27, comparable_board_cross_brand_mt_detail).

evidence(all_consistent(comparable_board_cross_brand_mt_detail)).
query(true_val(comparable_board_cross_brand_mt_detail, mt_more_edge_less_aggressive)).
query(true_val(comparable_board_cross_brand_mt_detail, unk_comparable_board_cross_brand_mt_detail)).

0.78::acc(s38, comparable_board_cross_brand_mt_edge_tech).

% @attr comparable_board_cross_brand_mt_edge_tech
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (MT edge tech)
% @values mt_has_magne_goliath_not=Jones_MT_has_magnetraction_Goliath_does_not unk_comparable_board_cross_brand_mt_edge_tech=Unknown
% @importance 0.85

0.64::true_val(comparable_board_cross_brand_mt_edge_tech, mt_has_magne_goliath_not); 0.36::true_val(comparable_board_cross_brand_mt_edge_tech, unk_comparable_board_cross_brand_mt_edge_tech).

measured(s38, comparable_board_cross_brand_mt_edge_tech, mt_has_magne_goliath_not).

all_consistent(comparable_board_cross_brand_mt_edge_tech) :- consistent(s38, comparable_board_cross_brand_mt_edge_tech).

evidence(all_consistent(comparable_board_cross_brand_mt_edge_tech)).
query(true_val(comparable_board_cross_brand_mt_edge_tech, mt_has_magne_goliath_not)).
query(true_val(comparable_board_cross_brand_mt_edge_tech, unk_comparable_board_cross_brand_mt_edge_tech)).

0.55::acc(s27, comparable_board_cross_brand_catch_free).

% @attr comparable_board_cross_brand_catch_free
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (catch-free)
% @values more_catch_free_forgiving=More_catch_free_forgiving_than_traditional_camber unk_comparable_board_cross_brand_catch_free=Unknown
% @importance 0.7

0.32::true_val(comparable_board_cross_brand_catch_free, more_catch_free_forgiving); 0.68::true_val(comparable_board_cross_brand_catch_free, unk_comparable_board_cross_brand_catch_free).

measured(s27, comparable_board_cross_brand_catch_free, more_catch_free_forgiving).

all_consistent(comparable_board_cross_brand_catch_free) :- consistent(s27, comparable_board_cross_brand_catch_free).

evidence(all_consistent(comparable_board_cross_brand_catch_free)).
query(true_val(comparable_board_cross_brand_catch_free, more_catch_free_forgiving)).
query(true_val(comparable_board_cross_brand_catch_free, unk_comparable_board_cross_brand_catch_free)).

0.93::acc(s3, tbt_definition).

% @attr tbt_definition
% @type categorical
% @canonical false
% @original_name 3BT definition
% @values triple_base_tech_3d=Triple_Base_Technology_3D_base_shaping unk_tbt_definition=Unknown
% @importance 1.0

0.92::true_val(tbt_definition, triple_base_tech_3d); 0.08::true_val(tbt_definition, unk_tbt_definition).

measured(s3, tbt_definition, triple_base_tech_3d).

all_consistent(tbt_definition) :- consistent(s3, tbt_definition).

evidence(all_consistent(tbt_definition)).
query(true_val(tbt_definition, triple_base_tech_3d)).
query(true_val(tbt_definition, unk_tbt_definition)).

0.65::acc(s2, tbt_benefit).

% @attr tbt_benefit
% @type categorical
% @canonical false
% @original_name 3BT benefit
% @values reduces_edge_catch=Reduces_edge_catch_maintains_ollie_carving unk_tbt_benefit=Unknown
% @importance 0.95

0.63::true_val(tbt_benefit, reduces_edge_catch); 0.37::true_val(tbt_benefit, unk_tbt_benefit).

measured(s2, tbt_benefit, reduces_edge_catch).

all_consistent(tbt_benefit) :- consistent(s2, tbt_benefit).

evidence(all_consistent(tbt_benefit)).
query(true_val(tbt_benefit, reduces_edge_catch)).
query(true_val(tbt_benefit, unk_tbt_benefit)).

0.93::acc(s3, sidekick_definition).

% @attr sidekick_definition
% @type categorical
% @canonical false
% @original_name SideKick definition
% @values increased_sidebase_uplift=Increased_sidebase_uplift_hull_like_tips unk_sidekick_definition=Unknown
% @importance 1.0

0.92::true_val(sidekick_definition, increased_sidebase_uplift); 0.08::true_val(sidekick_definition, unk_sidekick_definition).

measured(s3, sidekick_definition, increased_sidebase_uplift).

all_consistent(sidekick_definition) :- consistent(s3, sidekick_definition).

evidence(all_consistent(sidekick_definition)).
query(true_val(sidekick_definition, increased_sidebase_uplift)).
query(true_val(sidekick_definition, unk_sidekick_definition)).

0.93::acc(s3, sidekick_benefit).

% @attr sidekick_benefit
% @type categorical
% @canonical false
% @original_name SideKick benefit
% @values float_smooth_turns=Enhanced_float_deep_snow_smoother_turn_initiation unk_sidekick_benefit=Unknown
% @importance 1.0

0.92::true_val(sidekick_benefit, float_smooth_turns); 0.08::true_val(sidekick_benefit, unk_sidekick_benefit).

measured(s3, sidekick_benefit, float_smooth_turns).

all_consistent(sidekick_benefit) :- consistent(s3, sidekick_benefit).

evidence(all_consistent(sidekick_benefit)).
query(true_val(sidekick_benefit, float_smooth_turns)).
query(true_val(sidekick_benefit, unk_sidekick_benefit)).

0.65::acc(s41, tbt_patented).

% @attr tbt_patented
% @type categorical
% @canonical false
% @original_name 3BT is unique to Bataleon (patented)
% @values patented=Triple_Base_Technology_is_patented unk_tbt_patented=Unknown
% @importance 0.6

0.55::true_val(tbt_patented, patented); 0.45::true_val(tbt_patented, unk_tbt_patented).

measured(s41, tbt_patented, patented).

all_consistent(tbt_patented) :- consistent(s41, tbt_patented).

evidence(all_consistent(tbt_patented)).
query(true_val(tbt_patented, patented)).
query(true_val(tbt_patented, unk_tbt_patented)).

0.83::acc(s24, tbt_goliath_variant).

% @attr tbt_goliath_variant
% @type categorical
% @canonical false
% @original_name 3BT Goliath variant
% @values low_3bt_more_than_competitors=Low_3BT_but_more_lifted_than_competitors unk_tbt_goliath_variant=Unknown
% @importance 0.9

0.72::true_val(tbt_goliath_variant, low_3bt_more_than_competitors); 0.28::true_val(tbt_goliath_variant, unk_tbt_goliath_variant).

measured(s24, tbt_goliath_variant, low_3bt_more_than_competitors).

all_consistent(tbt_goliath_variant) :- consistent(s24, tbt_goliath_variant).

evidence(all_consistent(tbt_goliath_variant)).
query(true_val(tbt_goliath_variant, low_3bt_more_than_competitors)).
query(true_val(tbt_goliath_variant, unk_tbt_goliath_variant)).

0.65::acc(s19, binding_compatibility).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values standard_2x4_non_est=Standard_2x4_compatible_non_Burton_EST unk_binding_compatibility=Unknown
% @importance 0.65

0.60::true_val(binding_compatibility, standard_2x4_non_est); 0.40::true_val(binding_compatibility, unk_binding_compatibility).

measured(s19, binding_compatibility, standard_2x4_non_est).

all_consistent(binding_compatibility) :- consistent(s19, binding_compatibility).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, standard_2x4_non_est)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

0.82::acc(s22, binding_recommendation_user).

% @attr binding_recommendation_user
% @type categorical
% @canonical false
% @original_name Binding recommendation (user)
% @values union_force_full_disc=Union_Force_full_size_discs_work_well unk_binding_recommendation_user=Unknown
% @importance 0.9

0.72::true_val(binding_recommendation_user, union_force_full_disc); 0.28::true_val(binding_recommendation_user, unk_binding_recommendation_user).

measured(s22, binding_recommendation_user, union_force_full_disc).

all_consistent(binding_recommendation_user) :- consistent(s22, binding_recommendation_user).

evidence(all_consistent(binding_recommendation_user)).
query(true_val(binding_recommendation_user, union_force_full_disc)).
query(true_val(binding_recommendation_user, unk_binding_recommendation_user)).

0.40::acc(s42, recommended_binding_bataleon).

% @attr recommended_binding_bataleon
% @type categorical
% @canonical false
% @original_name Recommended Bataleon binding
% @values astro_fullwrap=Astro_Fullwrap unk_recommended_binding_bataleon=Unknown
% @importance 0.45

0.24::true_val(recommended_binding_bataleon, astro_fullwrap); 0.76::true_val(recommended_binding_bataleon, unk_recommended_binding_bataleon).

measured(s42, recommended_binding_bataleon, astro_fullwrap).

all_consistent(recommended_binding_bataleon) :- consistent(s42, recommended_binding_bataleon).

evidence(all_consistent(recommended_binding_bataleon)).
query(true_val(recommended_binding_bataleon, astro_fullwrap)).
query(true_val(recommended_binding_bataleon, unk_recommended_binding_bataleon)).

0.83::acc(s22, reviewer_opinion_the_good_ride_sizing).

% @attr reviewer_opinion_the_good_ride_sizing
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (sizing)
% @values weight_ok_boot_liberal=Pretty_spot_on_weight_too_liberal_boot_sizing unk_reviewer_opinion_the_good_ride_sizing=Unknown
% @importance 0.9

0.72::true_val(reviewer_opinion_the_good_ride_sizing, weight_ok_boot_liberal); 0.28::true_val(reviewer_opinion_the_good_ride_sizing, unk_reviewer_opinion_the_good_ride_sizing).

measured(s22, reviewer_opinion_the_good_ride_sizing, weight_ok_boot_liberal).

all_consistent(reviewer_opinion_the_good_ride_sizing) :- consistent(s22, reviewer_opinion_the_good_ride_sizing).

evidence(all_consistent(reviewer_opinion_the_good_ride_sizing)).
query(true_val(reviewer_opinion_the_good_ride_sizing, weight_ok_boot_liberal)).
query(true_val(reviewer_opinion_the_good_ride_sizing, unk_reviewer_opinion_the_good_ride_sizing)).

0.68::acc(s43, directional_twin_detail).

% @attr directional_twin_detail
% @type categorical
% @canonical false
% @original_name Directional twin detail
% @values nose_1cm_longer=Slightly_longer_nose_approx_1cm unk_directional_twin_detail=Unknown
% @importance 0.55

0.60::true_val(directional_twin_detail, nose_1cm_longer); 0.40::true_val(directional_twin_detail, unk_directional_twin_detail).

measured(s43, directional_twin_detail, nose_1cm_longer).

all_consistent(directional_twin_detail) :- consistent(s43, directional_twin_detail).

evidence(all_consistent(directional_twin_detail)).
query(true_val(directional_twin_detail, nose_1cm_longer)).
query(true_val(directional_twin_detail, unk_directional_twin_detail)).

0.85::acc(s22, setback).

% @attr setback
% @type numeric
% @unit inches
% @canonical true
% @original_name setback
% @values v2_875=2.875 unk_setback=Unknown
% @importance 0.9

0.72::true_val(setback, v2_875); 0.28::true_val(setback, unk_setback).

measured(s22, setback, v2_875).

all_consistent(setback) :- consistent(s22, setback).

evidence(all_consistent(setback)).
query(true_val(setback, v2_875)).
query(true_val(setback, unk_setback)).

0.83::acc(s24, redesign_year).

% @attr redesign_year
% @type categorical
% @canonical true
% @original_name redesign_year
% @values minimal_changes_yoy=Minimal_spec_changes_year_to_year unk_redesign_year=Unknown
% @importance 0.9

0.72::true_val(redesign_year, minimal_changes_yoy); 0.28::true_val(redesign_year, unk_redesign_year).

measured(s24, redesign_year, minimal_changes_yoy).

all_consistent(redesign_year) :- consistent(s24, redesign_year).

evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, minimal_changes_yoy)).
query(true_val(redesign_year, unk_redesign_year)).