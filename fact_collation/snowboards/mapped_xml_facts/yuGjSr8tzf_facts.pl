0.15::indep(s3).
0.15::indep(s4).
0.20::indep_tactics.
indep(s27) :- indep_tactics.
indep(s50) :- indep_tactics.
indep(s52) :- indep_tactics.
indep(s54) :- indep_tactics.
indep(s57) :- indep_tactics.
0.15::indep_snowinn.
indep(s28) :- indep_snowinn.
indep(s60) :- indep_snowinn.
0.12::indep(s29).
0.15::indep_shredshop.
indep(s30) :- indep_shredshop.
indep(s41) :- indep_shredshop.
0.25::indep_evo.
indep(s7) :- indep_evo.
indep(s11) :- indep_evo.
indep(s26) :- indep_evo.
indep(s32) :- indep_evo.
indep(s33) :- indep_evo.
indep(s34) :- indep_evo.
indep(s44) :- indep_evo.
indep(s51) :- indep_evo.
0.15::indep(s35).
0.15::indep(s36).
0.15::indep(s37).
0.15::indep(s38).
0.20::indep(s39).
0.15::indep(s43).
0.20::indep(s45).
0.20::indep_abssnow.
indep(s9) :- indep_abssnow.
indep(s47) :- indep_abssnow.
indep(s62) :- indep_abssnow.
0.80::indep_salomon_gb.
indep(s2) :- indep_salomon_gb.
indep(s13) :- indep_salomon_gb.
indep(s40) :- indep_salomon_gb.
indep(s55) :- indep_salomon_gb.
indep(s56) :- indep_salomon_gb.
0.15::indep(s83).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values salomon=Salomon unk_brand=Unknown
% @importance 0.95

0.95::acc(s1, brand).
0.93::acc(s2, brand).

0.95::true_val(brand, salomon); 0.05::true_val(brand, unk_brand).

measured(s1, brand, salomon).
measured(s2, brand, salomon).

all_consistent(brand) :-
    consistent(s1, brand),
    (indep(s2), consistent(s2, brand) ; \+indep(s2)).

evidence(all_consistent(brand)).
query(true_val(brand, salomon)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values jetstream=Jetstream unk_model_name=Unknown
% @importance 0.95

0.95::acc(s1, model_name).
0.93::acc(s2, model_name).

0.95::true_val(model_name, jetstream); 0.05::true_val(model_name, unk_model_name).

measured(s1, model_name, jetstream).
measured(s2, model_name, jetstream).

all_consistent(model_name) :-
    consistent(s1, model_name),
    (indep(s2), consistent(s2, model_name) ; \+indep(s2)).

evidence(all_consistent(model_name)).
query(true_val(model_name, jetstream)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values v2027=2027 v2026=2026
% @importance 0.90

0.75::acc(s3, model_year).
0.75::acc(s4, model_year).
0.85::acc(s5, model_year).
0.85::acc(s6, model_year).

0.45::true_val(model_year, v2027); 0.55::true_val(model_year, v2026).

measured(s3, model_year, v2027).
measured(s4, model_year, v2027).
measured(s5, model_year, v2026).
measured(s6, model_year, v2026).

all_consistent(model_year) :-
    (indep(s3), consistent(s3, model_year) ; \+indep(s3)),
    (indep(s4), consistent(s4, model_year) ; \+indep(s4)),
    consistent(s5, model_year),
    consistent(s6, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, v2027)).
query(true_val(model_year, v2026)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.97::acc(s1, product_type).

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
% @importance 0.85

0.93::acc(s2, board_category).
0.82::acc(s7, board_category).

0.95::true_val(board_category, all_mountain_freeride); 0.05::true_val(board_category, unk_board_category).

measured(s2, board_category, all_mountain_freeride).
measured(s7, board_category, all_mountain_freeride).

all_consistent(board_category) :-
    (indep(s2), consistent(s2, board_category) ; \+indep(s2)),
    (indep(s7), consistent(s7, board_category) ; \+indep(s7)).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain_freeride)).
query(true_val(board_category, unk_board_category)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values unisex=Unisex unk_gender=Unknown
% @importance 0.85

0.95::acc(s8, gender).

0.90::true_val(gender, unisex); 0.10::true_val(gender, unk_gender).

measured(s8, gender, unisex).

all_consistent(gender) :- consistent(s8, gender).

evidence(all_consistent(gender)).
query(true_val(gender, unisex)).
query(true_val(gender, unk_gender)).

% @attr model_series
% @type categorical
% @canonical false
% @original_name Model series
% @values horizon_series=Horizon_Series_Collection unk_model_series=Unknown
% @importance 0.60

0.78::acc(s9, model_series).
0.88::acc(s10, model_series).

0.95::true_val(model_series, horizon_series); 0.05::true_val(model_series, unk_model_series).

measured(s9, model_series, horizon_series).
measured(s10, model_series, horizon_series).

all_consistent(model_series) :-
    (indep(s9), consistent(s9, model_series) ; \+indep(s9)),
    consistent(s10, model_series).

evidence(all_consistent(model_series)).
query(true_val(model_series, horizon_series)).
query(true_val(model_series, unk_model_series)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2025_26=All_new_2025_26_NH_season unk_model_first_available_year=Unknown
% @importance 0.70

0.80::acc(s11, model_first_available_year).
0.78::acc(s12, model_first_available_year).

0.90::true_val(model_first_available_year, season_2025_26); 0.10::true_val(model_first_available_year, unk_model_first_available_year).

measured(s11, model_first_available_year, season_2025_26).
measured(s12, model_first_available_year, season_2025_26).

all_consistent(model_first_available_year) :-
    (indep(s11), consistent(s11, model_first_available_year) ; \+indep(s11)),
    consistent(s12, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2025_26)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr article_reference_number
% @type categorical
% @canonical false
% @original_name Article reference number
% @values l47945800=L47945800 unk_article_reference_number=Unknown
% @importance 0.30

0.95::acc(s13, article_reference_number).

0.90::true_val(article_reference_number, l47945800); 0.10::true_val(article_reference_number, unk_article_reference_number).

measured(s13, article_reference_number, l47945800).

all_consistent(article_reference_number) :-
    (indep(s13), consistent(s13, article_reference_number) ; \+indep(s13)).

evidence(all_consistent(article_reference_number)).
query(true_val(article_reference_number, l47945800)).
query(true_val(article_reference_number, unk_article_reference_number)).

% @attr manufacturer
% @type categorical
% @canonical false
% @original_name manufacturer
% @values salomon_sas=Salomon_SAS_Annecy_France unk_manufacturer=Unknown
% @importance 0.70

0.82::acc(s14, manufacturer).

0.76::true_val(manufacturer, salomon_sas); 0.24::true_val(manufacturer, unk_manufacturer).

measured(s14, manufacturer, salomon_sas).

all_consistent(manufacturer) :- consistent(s14, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, salomon_sas)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr parent_company
% @type categorical
% @canonical false
% @original_name Parent company
% @values amer_sports=Amer_Sports unk_parent_company=Unknown
% @importance 0.50

0.82::acc(s15, parent_company).

0.76::true_val(parent_company, amer_sports); 0.24::true_val(parent_company, unk_parent_company).

measured(s15, parent_company, amer_sports).

all_consistent(parent_company) :- consistent(s15, parent_company).

evidence(all_consistent(parent_company)).
query(true_val(parent_company, amer_sports)).
query(true_val(parent_company, unk_parent_company)).

% @attr manufacturer_founded
% @type categorical
% @canonical false
% @original_name Manufacturer founded
% @values founded_1947_annecy=1947_Francois_Salomon_Annecy unk_manufacturer_founded=Unknown
% @importance 0.40

0.82::acc(s16, manufacturer_founded).

0.76::true_val(manufacturer_founded, founded_1947_annecy); 0.24::true_val(manufacturer_founded, unk_manufacturer_founded).

measured(s16, manufacturer_founded, founded_1947_annecy).

all_consistent(manufacturer_founded) :- consistent(s16, manufacturer_founded).

evidence(all_consistent(manufacturer_founded)).
query(true_val(manufacturer_founded, founded_1947_annecy)).
query(true_val(manufacturer_founded, unk_manufacturer_founded)).

% @attr salomon_entered_snowboarding
% @type categorical
% @canonical false
% @original_name Salomon entered snowboarding
% @values late_1990s=Late_1990s v1995=1995
% @importance 0.35

0.82::acc(s17, salomon_entered_snowboarding).
0.60::acc(s18, salomon_entered_snowboarding).

0.55::true_val(salomon_entered_snowboarding, late_1990s); 0.45::true_val(salomon_entered_snowboarding, v1995).

measured(s17, salomon_entered_snowboarding, late_1990s).
measured(s18, salomon_entered_snowboarding, v1995).

all_consistent(salomon_entered_snowboarding) :-
    consistent(s17, salomon_entered_snowboarding),
    consistent(s18, salomon_entered_snowboarding).

evidence(all_consistent(salomon_entered_snowboarding)).
query(true_val(salomon_entered_snowboarding, late_1990s)).
query(true_val(salomon_entered_snowboarding, v1995)).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values primarily_china=Primarily_China unk_manufacturing_location_current=Unknown
% @importance 0.50

0.65::acc(s19, manufacturing_location_current).

0.44::true_val(manufacturing_location_current, primarily_china); 0.56::true_val(manufacturing_location_current, unk_manufacturing_location_current).

measured(s19, manufacturing_location_current, primarily_china).

all_consistent(manufacturing_location_current) :- consistent(s19, manufacturing_location_current).

evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, primarily_china)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

% @attr design_headquarters
% @type categorical
% @canonical false
% @original_name Design headquarters
% @values annecy_france=Salomon_Annecy_Design_Center_France unk_design_headquarters=Unknown
% @importance 0.40

0.78::acc(s20, design_headquarters).

0.68::true_val(design_headquarters, annecy_france); 0.32::true_val(design_headquarters, unk_design_headquarters).

measured(s20, design_headquarters, annecy_france).

all_consistent(design_headquarters) :- consistent(s20, design_headquarters).

evidence(all_consistent(design_headquarters)).
query(true_val(design_headquarters, annecy_france)).
query(true_val(design_headquarters, unk_design_headquarters)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values mindnich_nyvelt=Nils_Mindnich_and_Wolle_Nyvelt unk_pro_rider_name=Unknown
% @importance 0.45

0.80::acc(s21, pro_rider_name).

0.64::true_val(pro_rider_name, mindnich_nyvelt); 0.36::true_val(pro_rider_name, unk_pro_rider_name).

measured(s21, pro_rider_name, mindnich_nyvelt).

all_consistent(pro_rider_name) :- consistent(s21, pro_rider_name).

evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, mindnich_nyvelt)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr horizon_series_composition
% @type categorical
% @canonical false
% @original_name Horizon Series composition
% @values three_shapes=Jetstream_Highpath_Fastlane unk_horizon_series_composition=Unknown
% @importance 0.675

0.87::acc(s22, horizon_series_composition).
0.85::acc(s23, horizon_series_composition).

0.95::true_val(horizon_series_composition, three_shapes); 0.05::true_val(horizon_series_composition, unk_horizon_series_composition).

measured(s22, horizon_series_composition, three_shapes).
measured(s23, horizon_series_composition, three_shapes).

all_consistent(horizon_series_composition) :-
    consistent(s22, horizon_series_composition),
    consistent(s23, horizon_series_composition).

evidence(all_consistent(horizon_series_composition)).
query(true_val(horizon_series_composition, three_shapes)).
query(true_val(horizon_series_composition, unk_horizon_series_composition)).

% @attr horizon_series_position
% @type categorical
% @canonical false
% @original_name Horizon Series position
% @values softest_most_accessible=Softest_most_accessible_in_Horizon unk_horizon_series_position=Unknown
% @importance 0.70

0.87::acc(s22, horizon_series_position).

0.77::true_val(horizon_series_position, softest_most_accessible); 0.23::true_val(horizon_series_position, unk_horizon_series_position).

measured(s22, horizon_series_position, softest_most_accessible).

all_consistent(horizon_series_position) :- consistent(s22, horizon_series_position).

evidence(all_consistent(horizon_series_position)).
query(true_val(horizon_series_position, softest_most_accessible)).
query(true_val(horizon_series_position, unk_horizon_series_position)).

% @attr horizon_fourth_shape
% @type categorical
% @canonical false
% @original_name Horizon fourth shape added
% @values indicator_fw2026_27=Indicator_added_FW_2026_27 unk_horizon_fourth_shape=Unknown
% @importance 0.40

0.87::acc(s24, horizon_fourth_shape).

0.77::true_val(horizon_fourth_shape, indicator_fw2026_27); 0.23::true_val(horizon_fourth_shape, unk_horizon_fourth_shape).

measured(s24, horizon_fourth_shape, indicator_fw2026_27).

all_consistent(horizon_fourth_shape) :- consistent(s24, horizon_fourth_shape).

evidence(all_consistent(horizon_fourth_shape)).
query(true_val(horizon_fourth_shape, indicator_fw2026_27)).
query(true_val(horizon_fourth_shape, unk_horizon_fourth_shape)).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v649_95=649.95 unk_price_usd_msrp=Unknown
% @importance 0.95

0.88::acc(s5, price_usd_msrp).
0.88::acc(s25, price_usd_msrp).

0.95::true_val(price_usd_msrp, v649_95); 0.05::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s5, price_usd_msrp, v649_95).
measured(s25, price_usd_msrp, v649_95).

all_consistent(price_usd_msrp) :-
    consistent(s5, price_usd_msrp),
    consistent(s25, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v649_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_evo
% @values v519_96=519.96 unk_price_usd_evo=Unknown
% @importance 0.95

0.85::acc(s26, price_usd_evo).

0.81::true_val(price_usd_evo, v519_96); 0.19::true_val(price_usd_evo, unk_price_usd_evo).

measured(s26, price_usd_evo, v519_96).

all_consistent(price_usd_evo) :-
    (indep(s26), consistent(s26, price_usd_evo) ; \+indep(s26)).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v519_96)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_tactics
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_tactics
% @values v519_95=519.95 unk_price_usd_tactics=Unknown
% @importance 0.90

0.82::acc(s27, price_usd_tactics).

0.74::true_val(price_usd_tactics, v519_95); 0.26::true_val(price_usd_tactics, unk_price_usd_tactics).

measured(s27, price_usd_tactics, v519_95).

all_consistent(price_usd_tactics) :-
    (indep(s27), consistent(s27, price_usd_tactics) ; \+indep(s27)).

evidence(all_consistent(price_usd_tactics)).
query(true_val(price_usd_tactics, v519_95)).
query(true_val(price_usd_tactics, unk_price_usd_tactics)).

% @attr price_usd_snowinn
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at Snowinn / Tradeinn (USD)
% @values v447_99=447.99 unk_price_usd_snowinn=Unknown
% @importance 0.85

0.70::acc(s28, price_usd_snowinn).

0.48::true_val(price_usd_snowinn, v447_99); 0.52::true_val(price_usd_snowinn, unk_price_usd_snowinn).

measured(s28, price_usd_snowinn, v447_99).

all_consistent(price_usd_snowinn) :-
    (indep(s28), consistent(s28, price_usd_snowinn) ; \+indep(s28)).

evidence(all_consistent(price_usd_snowinn)).
query(true_val(price_usd_snowinn, v447_99)).
query(true_val(price_usd_snowinn, unk_price_usd_snowinn)).

% @attr price_usd_skipro
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at SkiPro (USD)
% @values v649_95=649.95 unk_price_usd_skipro=Unknown
% @importance 0.80

0.68::acc(s29, price_usd_skipro).

0.54::true_val(price_usd_skipro, v649_95); 0.46::true_val(price_usd_skipro, unk_price_usd_skipro).

measured(s29, price_usd_skipro, v649_95).

all_consistent(price_usd_skipro) :-
    (indep(s29), consistent(s29, price_usd_skipro) ; \+indep(s29)).

evidence(all_consistent(price_usd_skipro)).
query(true_val(price_usd_skipro, v649_95)).
query(true_val(price_usd_skipro, unk_price_usd_skipro)).

% @attr price_usd_shred_shop
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at Shred Shop (USD)
% @values v649_95=649.95 unk_price_usd_shred_shop=Unknown
% @importance 0.75

0.68::acc(s30, price_usd_shred_shop).

0.51::true_val(price_usd_shred_shop, v649_95); 0.49::true_val(price_usd_shred_shop, unk_price_usd_shred_shop).

measured(s30, price_usd_shred_shop, v649_95).

all_consistent(price_usd_shred_shop) :-
    (indep(s30), consistent(s30, price_usd_shred_shop) ; \+indep(s30)).

evidence(all_consistent(price_usd_shred_shop)).
query(true_val(price_usd_shred_shop, v649_95)).
query(true_val(price_usd_shred_shop, unk_price_usd_shred_shop)).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v1049_99=1049.99 unk_price_aud_merchant=Unknown
% @importance 0.95

0.72::acc(s3, price_aud_merchant).

0.63::true_val(price_aud_merchant, v1049_99); 0.37::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s3, price_aud_merchant, v1049_99).

all_consistent(price_aud_merchant) :-
    (indep(s3), consistent(s3, price_aud_merchant) ; \+indep(s3)).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v1049_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_usd_msrp_psychocandy
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_msrp (Ride Psychocandy)
% @values v589_95=589.95 unk_price_usd_msrp_psychocandy=Unknown
% @importance 0.70

0.78::acc(s31, price_usd_msrp_psychocandy).

0.64::true_val(price_usd_msrp_psychocandy, v589_95); 0.36::true_val(price_usd_msrp_psychocandy, unk_price_usd_msrp_psychocandy).

measured(s31, price_usd_msrp_psychocandy, v589_95).

all_consistent(price_usd_msrp_psychocandy) :- consistent(s31, price_usd_msrp_psychocandy).

evidence(all_consistent(price_usd_msrp_psychocandy)).
query(true_val(price_usd_msrp_psychocandy, v589_95)).
query(true_val(price_usd_msrp_psychocandy, unk_price_usd_msrp_psychocandy)).

% @attr price_usd_msrp_highpath
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_msrp (Salomon Highpath)
% @values v699_95=699.95 unk_price_usd_msrp_highpath=Unknown
% @importance 0.75

0.82::acc(s32, price_usd_msrp_highpath).

0.72::true_val(price_usd_msrp_highpath, v699_95); 0.28::true_val(price_usd_msrp_highpath, unk_price_usd_msrp_highpath).

measured(s32, price_usd_msrp_highpath, v699_95).

all_consistent(price_usd_msrp_highpath) :-
    (indep(s32), consistent(s32, price_usd_msrp_highpath) ; \+indep(s32)).

evidence(all_consistent(price_usd_msrp_highpath)).
query(true_val(price_usd_msrp_highpath, v699_95)).
query(true_val(price_usd_msrp_highpath, unk_price_usd_msrp_highpath)).

% @attr price_usd_msrp_fastlane
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_msrp (Salomon Fastlane)
% @values v749_95=749.95 unk_price_usd_msrp_fastlane=Unknown
% @importance 0.70

0.82::acc(s33, price_usd_msrp_fastlane).

0.72::true_val(price_usd_msrp_fastlane, v749_95); 0.28::true_val(price_usd_msrp_fastlane, unk_price_usd_msrp_fastlane).

measured(s33, price_usd_msrp_fastlane, v749_95).

all_consistent(price_usd_msrp_fastlane) :-
    (indep(s33), consistent(s33, price_usd_msrp_fastlane) ; \+indep(s33)).

evidence(all_consistent(price_usd_msrp_fastlane)).
query(true_val(price_usd_msrp_fastlane, v749_95)).
query(true_val(price_usd_msrp_fastlane, unk_price_usd_msrp_fastlane)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values available=In_stock_available unk_availability_status=Unknown
% @importance 0.78

0.82::acc(s34, availability_status).
0.80::acc(s27, availability_status).
0.78::acc(s35, availability_status).
0.75::acc(s38, availability_status).
0.72::acc(s39, availability_status).
0.93::acc(s8, availability_status).
0.90::acc(s40, availability_status).

0.95::true_val(availability_status, available); 0.05::true_val(availability_status, unk_availability_status).

measured(s34, availability_status, available).
measured(s27, availability_status, available).
measured(s35, availability_status, available).
measured(s38, availability_status, available).
measured(s39, availability_status, available).
measured(s8, availability_status, available).
measured(s40, availability_status, available).

all_consistent(availability_status) :-
    (indep(s34), consistent(s34, availability_status) ; \+indep(s34)),
    (indep(s27), consistent(s27, availability_status) ; \+indep(s27)),
    (indep(s35), consistent(s35, availability_status) ; \+indep(s35)),
    (indep(s38), consistent(s38, availability_status) ; \+indep(s38)),
    (indep(s39), consistent(s39, availability_status) ; \+indep(s39)),
    consistent(s8, availability_status),
    (indep(s40), consistent(s40, availability_status) ; \+indep(s40)).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, available)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_sold_out
% @type categorical
% @canonical false
% @original_name availability_status (Shred Shop sold out)
% @values sold_out=Variant_sold_out_or_unavailable unk_availability_status_sold_out=Unknown
% @importance 0.75

0.68::acc(s30, availability_status_sold_out).

0.51::true_val(availability_status_sold_out, sold_out); 0.49::true_val(availability_status_sold_out, unk_availability_status_sold_out).

measured(s30, availability_status_sold_out, sold_out).

all_consistent(availability_status_sold_out) :-
    (indep(s30), consistent(s30, availability_status_sold_out) ; \+indep(s30)).

evidence(all_consistent(availability_status_sold_out)).
query(true_val(availability_status_sold_out, sold_out)).
query(true_val(availability_status_sold_out, unk_availability_status_sold_out)).

% @attr availability_status_preorder
% @type categorical
% @canonical false
% @original_name availability_status (Pre-order 2027)
% @values preorder_2027=Pre_order_for_2027_season unk_availability_status_preorder=Unknown
% @importance 0.95

0.72::acc(s3, availability_status_preorder).

0.63::true_val(availability_status_preorder, preorder_2027); 0.37::true_val(availability_status_preorder, unk_availability_status_preorder).

measured(s3, availability_status_preorder, preorder_2027).

all_consistent(availability_status_preorder) :-
    (indep(s3), consistent(s3, availability_status_preorder) ; \+indep(s3)).

evidence(all_consistent(availability_status_preorder)).
query(true_val(availability_status_preorder, preorder_2027)).
query(true_val(availability_status_preorder, unk_availability_status_preorder)).

% @attr availability_status_2027_au
% @type categorical
% @canonical false
% @original_name availability_status (2027 AU)
% @values available_2027=Available_for_2027_season unk_availability_status_2027_au=Unknown
% @importance 0.775

0.70::acc(s36, availability_status_2027_au).
0.72::acc(s4, availability_status_2027_au).

0.95::true_val(availability_status_2027_au, available_2027); 0.05::true_val(availability_status_2027_au, unk_availability_status_2027_au).

measured(s36, availability_status_2027_au, available_2027).
measured(s4, availability_status_2027_au, available_2027).

all_consistent(availability_status_2027_au) :-
    (indep(s36), consistent(s36, availability_status_2027_au) ; \+indep(s36)),
    (indep(s4), consistent(s4, availability_status_2027_au) ; \+indep(s4)).

evidence(all_consistent(availability_status_2027_au)).
query(true_val(availability_status_2027_au, available_2027)).
query(true_val(availability_status_2027_au, unk_availability_status_2027_au)).

% @attr estimated_availability_date
% @type categorical
% @canonical false
% @original_name estimated_availability_date
% @values apr_may_2026=April_May_2026 unk_estimated_availability_date=Unknown
% @importance 0.70

0.68::acc(s37, estimated_availability_date).

0.54::true_val(estimated_availability_date, apr_may_2026); 0.46::true_val(estimated_availability_date, unk_estimated_availability_date).

measured(s37, estimated_availability_date, apr_may_2026).

all_consistent(estimated_availability_date) :-
    (indep(s37), consistent(s37, estimated_availability_date) ; \+indep(s37)).

evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, apr_may_2026)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 0.93

0.95::acc(s1, shape).
0.93::acc(s2, shape).
0.93::acc(s8, shape).

0.95::true_val(shape, tapered_directional); 0.05::true_val(shape, unk_shape).

measured(s1, shape, tapered_directional).
measured(s2, shape, tapered_directional).
measured(s8, shape, tapered_directional).

all_consistent(shape) :-
    consistent(s1, shape),
    (indep(s2), consistent(s2, shape) ; \+indep(s2)),
    consistent(s8, shape).

evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

% @attr shape_description
% @type categorical
% @canonical false
% @original_name Shape description
% @values taper_2_20mm=Tail_tapered_2_20mm_loosens_turning_improves_float unk_shape_description=Unknown
% @importance 0.65

0.72::acc(s41, shape_description).

0.59::true_val(shape_description, taper_2_20mm); 0.41::true_val(shape_description, unk_shape_description).

measured(s41, shape_description, taper_2_20mm).

all_consistent(shape_description) :-
    (indep(s41), consistent(s41, shape_description) ; \+indep(s41)).

evidence(all_consistent(shape_description)).
query(true_val(shape_description, taper_2_20mm)).
query(true_val(shape_description, unk_shape_description)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values rock_out_camber=Rock_Out_Camber unk_camber_type=Unknown
% @importance 0.93

0.95::acc(s1, camber_type).
0.93::acc(s2, camber_type).
0.93::acc(s8, camber_type).

0.95::true_val(camber_type, rock_out_camber); 0.05::true_val(camber_type, unk_camber_type).

measured(s1, camber_type, rock_out_camber).
measured(s2, camber_type, rock_out_camber).
measured(s8, camber_type, rock_out_camber).

all_consistent(camber_type) :-
    consistent(s1, camber_type),
    (indep(s2), consistent(s2, camber_type) ; \+indep(s2)),
    consistent(s8, camber_type).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, rock_out_camber)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical false
% @original_name camber_description
% @values flat_camber_rocker=Flat_between_bindings_camber_near_feet_rocker_tip_tail unk_camber_description=Unknown
% @importance 0.93

0.95::acc(s1, camber_description).
0.93::acc(s2, camber_description).
0.90::acc(s42, camber_description).

0.95::true_val(camber_description, flat_camber_rocker); 0.05::true_val(camber_description, unk_camber_description).

measured(s1, camber_description, flat_camber_rocker).
measured(s2, camber_description, flat_camber_rocker).
measured(s42, camber_description, flat_camber_rocker).

all_consistent(camber_description) :-
    consistent(s1, camber_description),
    (indep(s2), consistent(s2, camber_description) ; \+indep(s2)),
    consistent(s42, camber_description).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, flat_camber_rocker)).
query(true_val(camber_description, unk_camber_description)).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values radial=Radial_Sidecut unk_sidecut_type=Unknown
% @importance 0.93

0.95::acc(s1, sidecut_type).
0.93::acc(s2, sidecut_type).
0.93::acc(s8, sidecut_type).

0.95::true_val(sidecut_type, radial); 0.05::true_val(sidecut_type, unk_sidecut_type).

measured(s1, sidecut_type, radial).
measured(s2, sidecut_type, radial).
measured(s8, sidecut_type, radial).

all_consistent(sidecut_type) :-
    consistent(s1, sidecut_type),
    (indep(s2), consistent(s2, sidecut_type) ; \+indep(s2)),
    consistent(s8, sidecut_type).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, radial)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr sidecut_description
% @type categorical
% @canonical false
% @original_name Sidecut description
% @values perfect_circle=Shaped_from_perfect_circle_consistent_response unk_sidecut_description=Unknown
% @importance 0.78

0.95::acc(s1, sidecut_description).
0.90::acc(s42, sidecut_description).

0.95::true_val(sidecut_description, perfect_circle); 0.05::true_val(sidecut_description, unk_sidecut_description).

measured(s1, sidecut_description, perfect_circle).
measured(s42, sidecut_description, perfect_circle).

all_consistent(sidecut_description) :-
    consistent(s1, sidecut_description),
    consistent(s42, sidecut_description).

evidence(all_consistent(sidecut_description)).
query(true_val(sidecut_description, perfect_circle)).
query(true_val(sidecut_description, unk_sidecut_description)).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v7=7.0 unk_flex_rating_10=Unknown
% @importance 0.90

0.78::acc(s3, flex_rating_10).
0.68::acc(s43, flex_rating_10).

0.95::true_val(flex_rating_10, v7); 0.05::true_val(flex_rating_10, unk_flex_rating_10).

measured(s3, flex_rating_10, v7).
measured(s43, flex_rating_10, v7).

all_consistent(flex_rating_10) :-
    (indep(s3), consistent(s3, flex_rating_10) ; \+indep(s3)),
    (indep(s43), consistent(s43, flex_rating_10) ; \+indep(s43)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v7)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

% @attr flex_rating_10_evo
% @type categorical
% @canonical false
% @original_name flex_rating_10_evo
% @values stiff=Stiff unk_flex_rating_10_evo=Unknown
% @importance 0.85

0.82::acc(s44, flex_rating_10_evo).

0.68::true_val(flex_rating_10_evo, stiff); 0.32::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).

measured(s44, flex_rating_10_evo, stiff).

all_consistent(flex_rating_10_evo) :-
    (indep(s44), consistent(s44, flex_rating_10_evo) ; \+indep(s44)).

evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, stiff)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values medium_stiff=Medium_Stiff softer_than_rated=Softer_than_rated_rides_soft
% @importance 0.83

0.80::acc(s27, flex_feel).
0.85::acc(s46, flex_feel).

0.45::true_val(flex_feel, medium_stiff); 0.55::true_val(flex_feel, softer_than_rated).

measured(s27, flex_feel, medium_stiff).
measured(s46, flex_feel, softer_than_rated).

all_consistent(flex_feel) :-
    (indep(s27), consistent(s27, flex_feel) ; \+indep(s27)),
    consistent(s46, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium_stiff)).
query(true_val(flex_feel, softer_than_rated)).

% @attr flex_rating_5
% @type numeric
% @unit /5
% @canonical false
% @original_name flex_rating_5
% @values v3_5=3.5 unk_flex_rating_5=Unknown
% @importance 0.80

0.72::acc(s45, flex_rating_5).

0.55::true_val(flex_rating_5, v3_5); 0.45::true_val(flex_rating_5, unk_flex_rating_5).

measured(s45, flex_rating_5, v3_5).

all_consistent(flex_rating_5) :-
    (indep(s45), consistent(s45, flex_rating_5) ; \+indep(s45)).

evidence(all_consistent(flex_rating_5)).
query(true_val(flex_rating_5, v3_5)).
query(true_val(flex_rating_5, unk_flex_rating_5)).

% @attr flex_direction
% @type categorical
% @canonical false
% @original_name flex_direction
% @values progressive=Progressive_flex unk_flex_direction=Unknown
% @importance 0.93

0.95::acc(s1, flex_direction).
0.93::acc(s2, flex_direction).
0.93::acc(s8, flex_direction).

0.95::true_val(flex_direction, progressive); 0.05::true_val(flex_direction, unk_flex_direction).

measured(s1, flex_direction, progressive).
measured(s2, flex_direction, progressive).
measured(s8, flex_direction, progressive).

all_consistent(flex_direction) :-
    consistent(s1, flex_direction),
    (indep(s2), consistent(s2, flex_direction) ; \+indep(s2)),
    consistent(s8, flex_direction).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, progressive)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate_to_advanced=Intermediate_to_Advanced advanced_expert=Advanced_Expert
% @importance 0.83

0.75::acc(s3, rider_level).
0.75::acc(s4, rider_level).
0.82::acc(s44, rider_level).
0.75::acc(s47, rider_level).

0.40::true_val(rider_level, intermediate_to_advanced); 0.60::true_val(rider_level, advanced_expert).

measured(s3, rider_level, intermediate_to_advanced).
measured(s4, rider_level, intermediate_to_advanced).
measured(s44, rider_level, advanced_expert).
measured(s47, rider_level, advanced_expert).

all_consistent(rider_level) :-
    (indep(s3), consistent(s3, rider_level) ; \+indep(s3)),
    (indep(s4), consistent(s4, rider_level) ; \+indep(s4)),
    (indep(s44), consistent(s44, rider_level) ; \+indep(s44)),
    (indep(s47), consistent(s47, rider_level) ; \+indep(s47)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate_to_advanced)).
query(true_val(rider_level, advanced_expert)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values advanced_expert=Advanced_to_Expert unk_skill_level_recommendation=Unknown
% @importance 0.80

0.82::acc(s44, skill_level_recommendation).
0.75::acc(s47, skill_level_recommendation).

0.95::true_val(skill_level_recommendation, advanced_expert); 0.05::true_val(skill_level_recommendation, unk_skill_level_recommendation).

measured(s44, skill_level_recommendation, advanced_expert).
measured(s47, skill_level_recommendation, advanced_expert).

all_consistent(skill_level_recommendation) :-
    (indep(s44), consistent(s44, skill_level_recommendation) ; \+indep(s44)),
    (indep(s47), consistent(s47, skill_level_recommendation) ; \+indep(s47)).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, advanced_expert)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

% @attr width_options
% @type categorical
% @canonical true
% @original_name width_options
% @values standard=Standard wide=Wide regular_wide=Regular_and_Wide
% @importance 0.88

0.75::acc(s3, width_options).
0.80::acc(s27, width_options).
0.65::acc(s28, width_options).

0.25::true_val(width_options, standard); 0.40::true_val(width_options, wide); 0.35::true_val(width_options, regular_wide).

measured(s3, width_options, standard).
measured(s27, width_options, wide).
measured(s28, width_options, regular_wide).

all_consistent(width_options) :-
    (indep(s3), consistent(s3, width_options) ; \+indep(s3)),
    (indep(s27), consistent(s27, width_options) ; \+indep(s27)),
    (indep(s28), consistent(s28, width_options) ; \+indep(s28)).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard)).
query(true_val(width_options, wide)).
query(true_val(width_options, regular_wide)).

% @attr width_description
% @type categorical
% @canonical false
% @original_name Width description
% @values mid_wide=Mid_wide_waist unk_width_description=Unknown
% @importance 0.65

0.82::acc(s48, width_description).

0.72::true_val(width_description, mid_wide); 0.28::true_val(width_description, unk_width_description).

measured(s48, width_description, mid_wide).

all_consistent(width_description) :- consistent(s48, width_description).

evidence(all_consistent(width_description)).
query(true_val(width_description, mid_wide)).
query(true_val(width_description, unk_width_description)).

% @attr mounting_pattern
% @type categorical
% @canonical false
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 0.95

0.78::acc(s3, mounting_pattern).

0.63::true_val(mounting_pattern, inserts_2x4); 0.37::true_val(mounting_pattern, unk_mounting_pattern).

measured(s3, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :-
    (indep(s3), consistent(s3, mounting_pattern) ; \+indep(s3)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values seven_sizes=146_149_153_157_160_163_166cm four_sizes=153_157_160_163cm two_sizes=153_157cm
% @importance 0.87

0.88::acc(s25, available_sizes).
0.87::acc(s49, available_sizes).
0.78::acc(s35, available_sizes).
0.80::acc(s27, available_sizes).

0.70::true_val(available_sizes, seven_sizes); 0.20::true_val(available_sizes, four_sizes); 0.10::true_val(available_sizes, two_sizes).

measured(s25, available_sizes, seven_sizes).
measured(s49, available_sizes, seven_sizes).
measured(s35, available_sizes, four_sizes).
measured(s27, available_sizes, two_sizes).

all_consistent(available_sizes) :-
    consistent(s25, available_sizes),
    consistent(s49, available_sizes),
    (indep(s35), consistent(s35, available_sizes) ; \+indep(s35)),
    (indep(s27), consistent(s27, available_sizes) ; \+indep(s27)).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, seven_sizes)).
query(true_val(available_sizes, four_sizes)).
query(true_val(available_sizes, two_sizes)).

% @attr setback
% @type numeric
% @unit cm
% @canonical true
% @original_name setback
% @values v2_0=2.0 unk_setback=Unknown
% @importance 0.93

0.78::acc(s3, setback).
0.80::acc(s27, setback).

0.95::true_val(setback, v2_0); 0.05::true_val(setback, unk_setback).

measured(s3, setback, v2_0).
measured(s27, setback, v2_0).

all_consistent(setback) :-
    (indep(s3), consistent(s3, setback) ; \+indep(s3)),
    (indep(s27), consistent(s27, setback) ; \+indep(s27)).

evidence(all_consistent(setback)).
query(true_val(setback, v2_0)).
query(true_val(setback, unk_setback)).

% @attr taper
% @type categorical
% @canonical false
% @original_name taper
% @values nose_wider=Nose_wider_than_tail unk_taper=Unknown
% @importance 0.93

0.95::acc(s1, taper).
0.78::acc(s3, taper).

0.95::true_val(taper, nose_wider); 0.05::true_val(taper, unk_taper).

measured(s1, taper, nose_wider).
measured(s3, taper, nose_wider).

all_consistent(taper) :-
    consistent(s1, taper),
    (indep(s3), consistent(s3, taper) ; \+indep(s3)).

evidence(all_consistent(taper)).
query(true_val(taper, nose_wider)).
query(true_val(taper, unk_taper)).

% @attr board_weight_grams
% @type numeric
% @unit kg
% @canonical true
% @original_name board_weight_grams
% @values v3_4=3.4 unk_board_weight_grams=Unknown
% @importance 0.85

0.60::acc(s28, board_weight_grams).

0.48::true_val(board_weight_grams, v3_4); 0.52::true_val(board_weight_grams, unk_board_weight_grams).

measured(s28, board_weight_grams, v3_4).

all_consistent(board_weight_grams) :-
    (indep(s28), consistent(s28, board_weight_grams) ; \+indep(s28)).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v3_4)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values aspen_slct=Aspen_SLCT_Core_FSC aero_core=Aero_Core_Balsa_Poplar
% @importance 0.83

0.95::acc(s1, core_material).
0.93::acc(s2, core_material).
0.82::acc(s50, core_material).
0.70::acc(s51, core_material).

0.75::true_val(core_material, aspen_slct); 0.25::true_val(core_material, aero_core).

measured(s1, core_material, aspen_slct).
measured(s2, core_material, aspen_slct).
measured(s50, core_material, aspen_slct).
measured(s51, core_material, aero_core).

all_consistent(core_material) :-
    consistent(s1, core_material),
    (indep(s2), consistent(s2, core_material) ; \+indep(s2)),
    (indep(s50), consistent(s50, core_material) ; \+indep(s50)),
    (indep(s51), consistent(s51, core_material) ; \+indep(s51)).

evidence(all_consistent(core_material)).
query(true_val(core_material, aspen_slct)).
query(true_val(core_material, aero_core)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values fsc_certified=FSC_certified_wood unk_sustainability_certification=Unknown
% @importance 0.82

0.95::acc(s1, sustainability_certification).
0.75::acc(s4, sustainability_certification).
0.82::acc(s50, sustainability_certification).

0.95::true_val(sustainability_certification, fsc_certified); 0.05::true_val(sustainability_certification, unk_sustainability_certification).

measured(s1, sustainability_certification, fsc_certified).
measured(s4, sustainability_certification, fsc_certified).
measured(s50, sustainability_certification, fsc_certified).

all_consistent(sustainability_certification) :-
    consistent(s1, sustainability_certification),
    (indep(s4), consistent(s4, sustainability_certification) ; \+indep(s4)),
    (indep(s50), consistent(s50, sustainability_certification) ; \+indep(s50)).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, fsc_certified)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr core_profiling
% @type categorical
% @canonical false
% @original_name Core profiling
% @values popster=Popster_thinner_underfoot_thicker_outside unk_core_profiling=Unknown
% @importance 0.70

0.82::acc(s52, core_profiling).
0.78::acc(s53, core_profiling).

0.95::true_val(core_profiling, popster); 0.05::true_val(core_profiling, unk_core_profiling).

measured(s52, core_profiling, popster).
measured(s53, core_profiling, popster).

all_consistent(core_profiling) :-
    (indep(s52), consistent(s52, core_profiling) ; \+indep(s52)),
    consistent(s53, core_profiling).

evidence(all_consistent(core_profiling)).
query(true_val(core_profiling, popster)).
query(true_val(core_profiling, unk_core_profiling)).

% @attr laminate
% @type categorical
% @canonical false
% @original_name laminate
% @values ba_md=BA_MD_BIAX_MD_European_fiberglass unk_laminate=Unknown
% @importance 0.60

0.95::acc(s1, laminate).
0.82::acc(s54, laminate).
0.93::acc(s55, laminate).

0.95::true_val(laminate, ba_md); 0.05::true_val(laminate, unk_laminate).

measured(s1, laminate, ba_md).
measured(s54, laminate, ba_md).
measured(s55, laminate, ba_md).

all_consistent(laminate) :-
    consistent(s1, laminate),
    (indep(s54), consistent(s54, laminate) ; \+indep(s54)),
    (indep(s55), consistent(s55, laminate) ; \+indep(s55)).

evidence(all_consistent(laminate)).
query(true_val(laminate, ba_md)).
query(true_val(laminate, unk_laminate)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values ghost_carbon_beam_plus=Ghost_Carbon_Beams_Plus unk_construction_material_innovation=Unknown
% @importance 0.70

0.95::acc(s1, construction_material_innovation).
0.93::acc(s56, construction_material_innovation).
0.82::acc(s57, construction_material_innovation).

0.95::true_val(construction_material_innovation, ghost_carbon_beam_plus); 0.05::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s1, construction_material_innovation, ghost_carbon_beam_plus).
measured(s56, construction_material_innovation, ghost_carbon_beam_plus).
measured(s57, construction_material_innovation, ghost_carbon_beam_plus).

all_consistent(construction_material_innovation) :-
    consistent(s1, construction_material_innovation),
    (indep(s56), consistent(s56, construction_material_innovation) ; \+indep(s56)),
    (indep(s57), consistent(s57, construction_material_innovation) ; \+indep(s57)).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, ghost_carbon_beam_plus)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr construction_material_innovation_beam_count
% @type categorical
% @canonical false
% @original_name construction_material_innovation (beam count)
% @values three_beams=Three_carbon_beams two_beams=Two_carbon_beams
% @importance 0.60

0.72::acc(s3, construction_material_innovation_beam_count).
0.65::acc(s39, construction_material_innovation_beam_count).

0.50::true_val(construction_material_innovation_beam_count, three_beams); 0.50::true_val(construction_material_innovation_beam_count, two_beams).

measured(s3, construction_material_innovation_beam_count, three_beams).
measured(s39, construction_material_innovation_beam_count, two_beams).

all_consistent(construction_material_innovation_beam_count) :-
    (indep(s3), consistent(s3, construction_material_innovation_beam_count) ; \+indep(s3)),
    (indep(s39), consistent(s39, construction_material_innovation_beam_count) ; \+indep(s39)).

evidence(all_consistent(construction_material_innovation_beam_count)).
query(true_val(construction_material_innovation_beam_count, three_beams)).
query(true_val(construction_material_innovation_beam_count, two_beams)).

% @attr resin
% @type categorical
% @canonical false
% @original_name resin
% @values bio_30pct=30pct_Bio_Based_Resin unk_resin=Unknown
% @importance 0.93

0.95::acc(s1, resin).
0.78::acc(s3, resin).

0.95::true_val(resin, bio_30pct); 0.05::true_val(resin, unk_resin).

measured(s1, resin, bio_30pct).
measured(s3, resin, bio_30pct).

all_consistent(resin) :-
    consistent(s1, resin),
    (indep(s3), consistent(s3, resin) ; \+indep(s3)).

evidence(all_consistent(resin)).
query(true_val(resin, bio_30pct)).
query(true_val(resin, unk_resin)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values recycled_66pct=66pct_Recycled_ABS recycled_100pct=100pct_Recycled_ABS
% @importance 0.68

0.95::acc(s1, sidewall_material).
0.78::acc(s3, sidewall_material).
0.75::acc(s4, sidewall_material).
0.88::acc(s58, sidewall_material).
0.70::acc(s59, sidewall_material).
0.60::acc(s60, sidewall_material).

0.70::true_val(sidewall_material, recycled_66pct); 0.30::true_val(sidewall_material, recycled_100pct).

measured(s1, sidewall_material, recycled_66pct).
measured(s3, sidewall_material, recycled_66pct).
measured(s4, sidewall_material, recycled_66pct).
measured(s58, sidewall_material, recycled_66pct).
measured(s59, sidewall_material, recycled_100pct).
measured(s60, sidewall_material, recycled_100pct).

all_consistent(sidewall_material) :-
    consistent(s1, sidewall_material),
    (indep(s3), consistent(s3, sidewall_material) ; \+indep(s3)),
    (indep(s4), consistent(s4, sidewall_material) ; \+indep(s4)),
    consistent(s58, sidewall_material),
    consistent(s59, sidewall_material),
    (indep(s60), consistent(s60, sidewall_material) ; \+indep(s60)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, recycled_66pct)).
query(true_val(sidewall_material, recycled_100pct)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values recycled_sintered_50pct=50pct_Recycled_Sintered_Base unk_base_material=Unknown
% @importance 0.93

0.95::acc(s1, base_material).
0.93::acc(s2, base_material).
0.93::acc(s8, base_material).

0.95::true_val(base_material, recycled_sintered_50pct); 0.05::true_val(base_material, unk_base_material).

measured(s1, base_material, recycled_sintered_50pct).
measured(s2, base_material, recycled_sintered_50pct).
measured(s8, base_material, recycled_sintered_50pct).

all_consistent(base_material) :-
    consistent(s1, base_material),
    (indep(s2), consistent(s2, base_material) ; \+indep(s2)),
    consistent(s8, base_material).

evidence(all_consistent(base_material)).
query(true_val(base_material, recycled_sintered_50pct)).
query(true_val(base_material, unk_base_material)).

% @attr base_type
% @type categorical
% @canonical false
% @original_name base_type
% @values sintered_eg=Sintered_EG unk_base_type=Unknown
% @importance 0.60

0.93::acc(s55, base_type).

0.88::true_val(base_type, sintered_eg); 0.12::true_val(base_type, unk_base_type).

measured(s55, base_type, sintered_eg).

all_consistent(base_type) :-
    (indep(s55), consistent(s55, base_type) ; \+indep(s55)).

evidence(all_consistent(base_type)).
query(true_val(base_type, sintered_eg)).
query(true_val(base_type, unk_base_type)).

% @attr base_finish
% @type categorical
% @canonical false
% @original_name Base finish
% @values fine_stone=Fine_Stone_Finish unk_base_finish=Unknown
% @importance 0.78

0.95::acc(s1, base_finish).
0.93::acc(s55, base_finish).

0.95::true_val(base_finish, fine_stone); 0.05::true_val(base_finish, unk_base_finish).

measured(s1, base_finish, fine_stone).
measured(s55, base_finish, fine_stone).

all_consistent(base_finish) :-
    consistent(s1, base_finish),
    (indep(s55), consistent(s55, base_finish) ; \+indep(s55)).

evidence(all_consistent(base_finish)).
query(true_val(base_finish, fine_stone)).
query(true_val(base_finish, unk_base_finish)).

% @attr wax
% @type categorical
% @canonical false
% @original_name Wax
% @values natural_wax=Natural_Wax_paraffin_free unk_wax=Unknown
% @importance 0.73

0.95::acc(s1, wax).
0.95::acc(s61, wax).

0.95::true_val(wax, natural_wax); 0.05::true_val(wax, unk_wax).

measured(s1, wax, natural_wax).
measured(s61, wax, natural_wax).

all_consistent(wax) :-
    consistent(s1, wax),
    consistent(s61, wax).

evidence(all_consistent(wax)).
query(true_val(wax, natural_wax)).
query(true_val(wax, unk_wax)).

% @attr edge_technology
% @type categorical
% @canonical false
% @original_name edge_technology
% @values recycled_20pct=20pct_Recycled_edges unk_edge_technology=Unknown
% @importance 0.78

0.75::acc(s4, edge_technology).
0.88::acc(s58, edge_technology).

0.95::true_val(edge_technology, recycled_20pct); 0.05::true_val(edge_technology, unk_edge_technology).

measured(s4, edge_technology, recycled_20pct).
measured(s58, edge_technology, recycled_20pct).

all_consistent(edge_technology) :-
    (indep(s4), consistent(s4, edge_technology) ; \+indep(s4)),
    consistent(s58, edge_technology).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, recycled_20pct)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr topsheet
% @type categorical
% @canonical false
% @original_name topsheet
% @values olive_wood_veneer=Olive_wood_veneer unk_topsheet=Unknown
% @importance 0.78

0.75::acc(s4, topsheet).
0.88::acc(s58, topsheet).

0.95::true_val(topsheet, olive_wood_veneer); 0.05::true_val(topsheet, unk_topsheet).

measured(s4, topsheet, olive_wood_veneer).
measured(s58, topsheet, olive_wood_veneer).

all_consistent(topsheet) :-
    (indep(s4), consistent(s4, topsheet) ; \+indep(s4)),
    consistent(s58, topsheet).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, olive_wood_veneer)).
query(true_val(topsheet, unk_topsheet)).

% @attr base_graphics
% @type categorical
% @canonical false
% @original_name Base graphics
% @values random=Random unk_base_graphics=Unknown
% @importance 0.95

0.72::acc(s3, base_graphics).

0.63::true_val(base_graphics, random); 0.37::true_val(base_graphics, unk_base_graphics).

measured(s3, base_graphics, random).

all_consistent(base_graphics) :-
    (indep(s3), consistent(s3, base_graphics) ; \+indep(s3)).

evidence(all_consistent(base_graphics)).
query(true_val(base_graphics, random)).
query(true_val(base_graphics, unk_base_graphics)).

% @attr sustainability_recycled_overall
% @type categorical
% @canonical false
% @original_name sustainability_certification (50% recycled materials)
% @values pct50_recycled=50pct_recycled_materials unk_sustainability_recycled_overall=Unknown
% @importance 0.93

0.95::acc(s1, sustainability_recycled_overall).
0.93::acc(s8, sustainability_recycled_overall).

0.95::true_val(sustainability_recycled_overall, pct50_recycled); 0.05::true_val(sustainability_recycled_overall, unk_sustainability_recycled_overall).

measured(s1, sustainability_recycled_overall, pct50_recycled).
measured(s8, sustainability_recycled_overall, pct50_recycled).

all_consistent(sustainability_recycled_overall) :-
    consistent(s1, sustainability_recycled_overall),
    consistent(s8, sustainability_recycled_overall).

evidence(all_consistent(sustainability_recycled_overall)).
query(true_val(sustainability_recycled_overall, pct50_recycled)).
query(true_val(sustainability_recycled_overall, unk_sustainability_recycled_overall)).

% @attr sustainability_recycled_content
% @type categorical
% @canonical false
% @original_name sustainability_certification (66% recycled content)
% @values pct66_recycled=66pct_recycled_content unk_sustainability_recycled_content=Unknown
% @importance 0.83

0.95::acc(s1, sustainability_recycled_content).
0.88::acc(s58, sustainability_recycled_content).

0.95::true_val(sustainability_recycled_content, pct66_recycled); 0.05::true_val(sustainability_recycled_content, unk_sustainability_recycled_content).

measured(s1, sustainability_recycled_content, pct66_recycled).
measured(s58, sustainability_recycled_content, pct66_recycled).

all_consistent(sustainability_recycled_content) :-
    consistent(s1, sustainability_recycled_content),
    consistent(s58, sustainability_recycled_content).

evidence(all_consistent(sustainability_recycled_content)).
query(true_val(sustainability_recycled_content, pct66_recycled)).
query(true_val(sustainability_recycled_content, unk_sustainability_recycled_content)).

% @attr sustainability_plant_based
% @type categorical
% @canonical false
% @original_name sustainability_certification (30% plant-based)
% @values pct30_plant=30pct_plant_based_material unk_sustainability_plant_based=Unknown
% @importance 0.98

0.95::acc(s1, sustainability_plant_based).
0.78::acc(s3, sustainability_plant_based).

0.95::true_val(sustainability_plant_based, pct30_plant); 0.05::true_val(sustainability_plant_based, unk_sustainability_plant_based).

measured(s1, sustainability_plant_based, pct30_plant).
measured(s3, sustainability_plant_based, pct30_plant).

all_consistent(sustainability_plant_based) :-
    consistent(s1, sustainability_plant_based),
    (indep(s3), consistent(s3, sustainability_plant_based) ; \+indep(s3)).

evidence(all_consistent(sustainability_plant_based)).
query(true_val(sustainability_plant_based, pct30_plant)).
query(true_val(sustainability_plant_based, unk_sustainability_plant_based)).

% @attr sustainability_recycled_edges
% @type categorical
% @canonical false
% @original_name sustainability_certification (20% recycled aluminum)
% @values pct20_recycled_al=20pct_recycled_aluminum unk_sustainability_recycled_edges=Unknown
% @importance 0.78

0.75::acc(s4, sustainability_recycled_edges).
0.88::acc(s58, sustainability_recycled_edges).

0.95::true_val(sustainability_recycled_edges, pct20_recycled_al); 0.05::true_val(sustainability_recycled_edges, unk_sustainability_recycled_edges).

measured(s4, sustainability_recycled_edges, pct20_recycled_al).
measured(s58, sustainability_recycled_edges, pct20_recycled_al).

all_consistent(sustainability_recycled_edges) :-
    (indep(s4), consistent(s4, sustainability_recycled_edges) ; \+indep(s4)),
    consistent(s58, sustainability_recycled_edges).

evidence(all_consistent(sustainability_recycled_edges)).
query(true_val(sustainability_recycled_edges, pct20_recycled_al)).
query(true_val(sustainability_recycled_edges, unk_sustainability_recycled_edges)).

% @attr sustainability_natural_wax
% @type categorical
% @canonical false
% @original_name sustainability_certification (natural wax)
% @values yes_natural_wax=Yes_natural_wax unk_sustainability_natural_wax=Unknown
% @importance 0.72

0.95::acc(s1, sustainability_natural_wax).
0.75::acc(s4, sustainability_natural_wax).
0.82::acc(s50, sustainability_natural_wax).
0.95::acc(s61, sustainability_natural_wax).

0.95::true_val(sustainability_natural_wax, yes_natural_wax); 0.05::true_val(sustainability_natural_wax, unk_sustainability_natural_wax).

measured(s1, sustainability_natural_wax, yes_natural_wax).
measured(s4, sustainability_natural_wax, yes_natural_wax).
measured(s50, sustainability_natural_wax, yes_natural_wax).
measured(s61, sustainability_natural_wax, yes_natural_wax).

all_consistent(sustainability_natural_wax) :-
    consistent(s1, sustainability_natural_wax),
    (indep(s4), consistent(s4, sustainability_natural_wax) ; \+indep(s4)),
    (indep(s50), consistent(s50, sustainability_natural_wax) ; \+indep(s50)),
    consistent(s61, sustainability_natural_wax).

evidence(all_consistent(sustainability_natural_wax)).
query(true_val(sustainability_natural_wax, yes_natural_wax)).
query(true_val(sustainability_natural_wax, unk_sustainability_natural_wax)).

% @attr sustainability_recycled_sidewall
% @type categorical
% @canonical false
% @original_name sustainability_certification (recycled sidewall)
% @values yes_recycled_sidewall=Yes_recycled_sidewall unk_sustainability_recycled_sidewall=Unknown
% @importance 0.78

0.75::acc(s4, sustainability_recycled_sidewall).
0.88::acc(s58, sustainability_recycled_sidewall).

0.95::true_val(sustainability_recycled_sidewall, yes_recycled_sidewall); 0.05::true_val(sustainability_recycled_sidewall, unk_sustainability_recycled_sidewall).

measured(s4, sustainability_recycled_sidewall, yes_recycled_sidewall).
measured(s58, sustainability_recycled_sidewall, yes_recycled_sidewall).

all_consistent(sustainability_recycled_sidewall) :-
    (indep(s4), consistent(s4, sustainability_recycled_sidewall) ; \+indep(s4)),
    consistent(s58, sustainability_recycled_sidewall).

evidence(all_consistent(sustainability_recycled_sidewall)).
query(true_val(sustainability_recycled_sidewall, yes_recycled_sidewall)).
query(true_val(sustainability_recycled_sidewall, unk_sustainability_recycled_sidewall)).

% @attr sustainability_marketing
% @type categorical
% @canonical false
% @original_name sustainability_certification (marketing claim)
% @values no_compromise=No_compromise_performance_for_planet unk_sustainability_marketing=Unknown
% @importance 0.45

0.62::acc(s62, sustainability_marketing).

0.49::true_val(sustainability_marketing, no_compromise); 0.51::true_val(sustainability_marketing, unk_sustainability_marketing).

measured(s62, sustainability_marketing, no_compromise).

all_consistent(sustainability_marketing) :-
    (indep(s62), consistent(s62, sustainability_marketing) ; \+indep(s62)).

evidence(all_consistent(sustainability_marketing)).
query(true_val(sustainability_marketing, no_compromise)).
query(true_val(sustainability_marketing, unk_sustainability_marketing)).

% @attr specs_153
% @type categorical
% @canonical false
% @original_name 153cm size specs
% @values specs_153_val=EE112_W26_3_N31_4_T29_6_SR7_1_ST54_RW60_90 unk_specs_153=Unknown
% @importance 0.95

0.78::acc(s3, specs_153).

0.63::true_val(specs_153, specs_153_val); 0.37::true_val(specs_153, unk_specs_153).

measured(s3, specs_153, specs_153_val).

all_consistent(specs_153) :-
    (indep(s3), consistent(s3, specs_153) ; \+indep(s3)).

evidence(all_consistent(specs_153)).
query(true_val(specs_153, specs_153_val)).
query(true_val(specs_153, unk_specs_153)).

% @attr specs_157
% @type categorical
% @canonical false
% @original_name 157cm size specs
% @values specs_157_val=EE115_3_W26_6_N32_T30_SR7_3_ST55_RW60_95 unk_specs_157=Unknown
% @importance 0.95

0.78::acc(s3, specs_157).

0.63::true_val(specs_157, specs_157_val); 0.37::true_val(specs_157, unk_specs_157).

measured(s3, specs_157, specs_157_val).

all_consistent(specs_157) :-
    (indep(s3), consistent(s3, specs_157) ; \+indep(s3)).

evidence(all_consistent(specs_157)).
query(true_val(specs_157, specs_157_val)).
query(true_val(specs_157, unk_specs_157)).

% @attr specs_160
% @type categorical
% @canonical false
% @original_name 160cm size specs
% @values specs_160_val=EE117_6_W26_9_N32_5_T30_5_SR7_5_ST56_RW70_95 unk_specs_160=Unknown
% @importance 0.95

0.78::acc(s3, specs_160).

0.63::true_val(specs_160, specs_160_val); 0.37::true_val(specs_160, unk_specs_160).

measured(s3, specs_160, specs_160_val).

all_consistent(specs_160) :-
    (indep(s3), consistent(s3, specs_160) ; \+indep(s3)).

evidence(all_consistent(specs_160)).
query(true_val(specs_160, specs_160_val)).
query(true_val(specs_160, unk_specs_160)).

% @attr specs_163
% @type categorical
% @canonical false
% @original_name 163cm size specs
% @values specs_163_val=EE119_9_W27_2_N33_2_T31_SR7_7_ST57_RW70_105 unk_specs_163=Unknown
% @importance 0.95

0.78::acc(s3, specs_163).

0.63::true_val(specs_163, specs_163_val); 0.37::true_val(specs_163, unk_specs_163).

measured(s3, specs_163, specs_163_val).

all_consistent(specs_163) :-
    (indep(s3), consistent(s3, specs_163) ; \+indep(s3)).

evidence(all_consistent(specs_163)).
query(true_val(specs_163, specs_163_val)).
query(true_val(specs_163, unk_specs_163)).

% @attr specs_146
% @type categorical
% @canonical false
% @original_name 146cm size specs
% @values specs_146_val=EE105_7_W25_1_N30_T28_6_SR6_2_ST52_RW50_75 unk_specs_146=Unknown
% @importance 0.95

0.78::acc(s3, specs_146).

0.63::true_val(specs_146, specs_146_val); 0.37::true_val(specs_146, unk_specs_146).

measured(s3, specs_146, specs_146_val).

all_consistent(specs_146) :-
    (indep(s3), consistent(s3, specs_146) ; \+indep(s3)).

evidence(all_consistent(specs_146)).
query(true_val(specs_146, specs_146_val)).
query(true_val(specs_146, unk_specs_146)).

% @attr specs_149
% @type categorical
% @canonical false
% @original_name 149cm size specs
% @values specs_149_val=EE108_1_W25_4_N30_4_T29_SR6_5_ST53_RW50_80 unk_specs_149=Unknown
% @importance 0.95

0.78::acc(s3, specs_149).

0.63::true_val(specs_149, specs_149_val); 0.37::true_val(specs_149, unk_specs_149).

measured(s3, specs_149, specs_149_val).

all_consistent(specs_149) :-
    (indep(s3), consistent(s3, specs_149) ; \+indep(s3)).

evidence(all_consistent(specs_149)).
query(true_val(specs_149, specs_149_val)).
query(true_val(specs_149, unk_specs_149)).

% @attr waist_width_165
% @type categorical
% @canonical false
% @original_name waist_width_165
% @values specs_166_val=EE122_2_W27_5_N33_7_T31_5_SR7_9_ST58_RW75_115 unk_waist_width_165=Unknown
% @importance 0.95

0.78::acc(s3, waist_width_165).

0.63::true_val(waist_width_165, specs_166_val); 0.37::true_val(waist_width_165, unk_waist_width_165).

measured(s3, waist_width_165, specs_166_val).

all_consistent(waist_width_165) :-
    (indep(s3), consistent(s3, waist_width_165) ; \+indep(s3)).

evidence(all_consistent(waist_width_165)).
query(true_val(waist_width_165, specs_166_val)).
query(true_val(waist_width_165, unk_waist_width_165)).

% @attr boot_size_153
% @type categorical
% @canonical false
% @original_name Boot size compatibility (Tactics, 153)
% @values us13_under=US_13_and_under unk_boot_size_153=Unknown
% @importance 0.90

0.80::acc(s27, boot_size_153).

0.74::true_val(boot_size_153, us13_under); 0.26::true_val(boot_size_153, unk_boot_size_153).

measured(s27, boot_size_153, us13_under).

all_consistent(boot_size_153) :-
    (indep(s27), consistent(s27, boot_size_153) ; \+indep(s27)).

evidence(all_consistent(boot_size_153)).
query(true_val(boot_size_153, us13_under)).
query(true_val(boot_size_153, unk_boot_size_153)).

% @attr boot_size_157
% @type categorical
% @canonical false
% @original_name Boot size compatibility (Tactics, 157)
% @values us14_under=US_14_and_under unk_boot_size_157=Unknown
% @importance 0.90

0.80::acc(s27, boot_size_157).

0.74::true_val(boot_size_157, us14_under); 0.26::true_val(boot_size_157, unk_boot_size_157).

measured(s27, boot_size_157, us14_under).

all_consistent(boot_size_157) :-
    (indep(s27), consistent(s27, boot_size_157) ; \+indep(s27)).

evidence(all_consistent(boot_size_157)).
query(true_val(boot_size_157, us14_under)).
query(true_val(boot_size_157, unk_boot_size_157)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values groomers_am_freeride_deep=Groomers_all_mountain_freeride_deep_snow_sketchy unk_terrain_suitability=Unknown
% @importance 0.95

0.78::acc(s3, terrain_suitability).

0.63::true_val(terrain_suitability, groomers_am_freeride_deep); 0.37::true_val(terrain_suitability, unk_terrain_suitability).

measured(s3, terrain_suitability, groomers_am_freeride_deep).

all_consistent(terrain_suitability) :-
    (indep(s3), consistent(s3, terrain_suitability) ; \+indep(s3)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, groomers_am_freeride_deep)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr riding_style
% @type categorical
% @canonical false
% @original_name riding_style
% @values carving_charging_am=Carving_charging_all_mountain_freeride unk_riding_style=Unknown
% @importance 0.95

0.78::acc(s3, riding_style).

0.63::true_val(riding_style, carving_charging_am); 0.37::true_val(riding_style, unk_riding_style).

measured(s3, riding_style, carving_charging_am).

all_consistent(riding_style) :-
    (indep(s3), consistent(s3, riding_style) ; \+indep(s3)).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, carving_charging_am)).
query(true_val(riding_style, unk_riding_style)).

% @attr terrain_suitability_powder
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability (powder rating)
% @values v9=9.0 unk_terrain_suitability_powder=Unknown
% @importance 0.85

0.75::acc(s4, terrain_suitability_powder).

0.63::true_val(terrain_suitability_powder, v9); 0.37::true_val(terrain_suitability_powder, unk_terrain_suitability_powder).

measured(s4, terrain_suitability_powder, v9).

all_consistent(terrain_suitability_powder) :-
    (indep(s4), consistent(s4, terrain_suitability_powder) ; \+indep(s4)).

evidence(all_consistent(terrain_suitability_powder)).
query(true_val(terrain_suitability_powder, v9)).
query(true_val(terrain_suitability_powder, unk_terrain_suitability_powder)).

% @attr terrain_suitability_all_mountain
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability (all-mountain rating)
% @values v7=7.0 unk_terrain_suitability_all_mountain=Unknown
% @importance 0.85

0.75::acc(s4, terrain_suitability_all_mountain).

0.63::true_val(terrain_suitability_all_mountain, v7); 0.37::true_val(terrain_suitability_all_mountain, unk_terrain_suitability_all_mountain).

measured(s4, terrain_suitability_all_mountain, v7).

all_consistent(terrain_suitability_all_mountain) :-
    (indep(s4), consistent(s4, terrain_suitability_all_mountain) ; \+indep(s4)).

evidence(all_consistent(terrain_suitability_all_mountain)).
query(true_val(terrain_suitability_all_mountain, v7)).
query(true_val(terrain_suitability_all_mountain, unk_terrain_suitability_all_mountain)).

% @attr use_case_summary
% @type categorical
% @canonical false
% @original_name Use case summary
% @values freeride_am_int_adv=Freeride_oriented_all_mountain_int_to_adv unk_use_case_summary=Unknown
% @importance 0.85

0.75::acc(s4, use_case_summary).

0.63::true_val(use_case_summary, freeride_am_int_adv); 0.37::true_val(use_case_summary, unk_use_case_summary).

measured(s4, use_case_summary, freeride_am_int_adv).

all_consistent(use_case_summary) :-
    (indep(s4), consistent(s4, use_case_summary) ; \+indep(s4)).

evidence(all_consistent(use_case_summary)).
query(true_val(use_case_summary, freeride_am_int_adv)).
query(true_val(use_case_summary, unk_use_case_summary)).

% @attr snowboard_mag_assessment
% @type categorical
% @canonical false
% @original_name Snowboard Magazine assessment
% @values platinum_pick_top_carving=Platinum_Pick_2026_top_carving_board unk_snowboard_mag_assessment=Unknown
% @importance 0.85

0.88::acc(s63, snowboard_mag_assessment).

0.81::true_val(snowboard_mag_assessment, platinum_pick_top_carving); 0.19::true_val(snowboard_mag_assessment, unk_snowboard_mag_assessment).

measured(s63, snowboard_mag_assessment, platinum_pick_top_carving).

all_consistent(snowboard_mag_assessment) :- consistent(s63, snowboard_mag_assessment).

evidence(all_consistent(snowboard_mag_assessment)).
query(true_val(snowboard_mag_assessment, platinum_pick_top_carving)).
query(true_val(snowboard_mag_assessment, unk_snowboard_mag_assessment)).

% @attr carving_strength
% @type categorical
% @canonical false
% @original_name Carving strength (Snowboard Magazine)
% @values thrives_lower_angle=Thrives_on_lower_angle_terrain_smooth_predictable unk_carving_strength=Unknown
% @importance 0.85

0.88::acc(s63, carving_strength).

0.81::true_val(carving_strength, thrives_lower_angle); 0.19::true_val(carving_strength, unk_carving_strength).

measured(s63, carving_strength, thrives_lower_angle).

all_consistent(carving_strength) :- consistent(s63, carving_strength).

evidence(all_consistent(carving_strength)).
query(true_val(carving_strength, thrives_lower_angle)).
query(true_val(carving_strength, unk_carving_strength)).

% @attr float_capability
% @type categorical
% @canonical false
% @original_name Float capability
% @values superior_buoyancy=Superior_buoyancy_floatation_deep_snow unk_float_capability=Unknown
% @importance 0.70

0.88::acc(s58, float_capability).

0.81::true_val(float_capability, superior_buoyancy); 0.19::true_val(float_capability, unk_float_capability).

measured(s58, float_capability, superior_buoyancy).

all_consistent(float_capability) :- consistent(s58, float_capability).

evidence(all_consistent(float_capability)).
query(true_val(float_capability, superior_buoyancy)).
query(true_val(float_capability, unk_float_capability)).

% @attr snowboard_mag_award
% @type categorical
% @canonical false
% @original_name Snowboard Magazine Platinum Pick award
% @values platinum_pick_2026=Platinum_Pick_2026 unk_snowboard_mag_award=Unknown
% @importance 0.85

0.88::acc(s63, snowboard_mag_award).

0.81::true_val(snowboard_mag_award, platinum_pick_2026); 0.19::true_val(snowboard_mag_award, unk_snowboard_mag_award).

measured(s63, snowboard_mag_award, platinum_pick_2026).

all_consistent(snowboard_mag_award) :- consistent(s63, snowboard_mag_award).

evidence(all_consistent(snowboard_mag_award)).
query(true_val(snowboard_mag_award, platinum_pick_2026)).
query(true_val(snowboard_mag_award, unk_snowboard_mag_award)).

% @attr snowboarder_journal_review
% @type categorical
% @canonical false
% @original_name Snowboarder's Journal review
% @values very_positive=Very_positive_the_Jetstream_rips unk_snowboarder_journal_review=Unknown
% @importance 0.75

0.85::acc(s64, snowboarder_journal_review).

0.77::true_val(snowboarder_journal_review, very_positive); 0.23::true_val(snowboarder_journal_review, unk_snowboarder_journal_review).

measured(s64, snowboarder_journal_review, very_positive).

all_consistent(snowboarder_journal_review) :- consistent(s64, snowboarder_journal_review).

evidence(all_consistent(snowboarder_journal_review)).
query(true_val(snowboarder_journal_review, very_positive)).
query(true_val(snowboarder_journal_review, unk_snowboarder_journal_review)).

% @attr snowboarder_journal_flex_impression
% @type categorical
% @canonical false
% @original_name Snowboarder's Journal flex impression
% @values medium_more_fun=Skeptical_of_soft_flex_but_won_over_medium_was_more_fun unk_snowboarder_journal_flex_impression=Unknown
% @importance 0.75

0.85::acc(s65, snowboarder_journal_flex_impression).

0.72::true_val(snowboarder_journal_flex_impression, medium_more_fun); 0.28::true_val(snowboarder_journal_flex_impression, unk_snowboarder_journal_flex_impression).

measured(s65, snowboarder_journal_flex_impression, medium_more_fun).

all_consistent(snowboarder_journal_flex_impression) :- consistent(s65, snowboarder_journal_flex_impression).

evidence(all_consistent(snowboarder_journal_flex_impression)).
query(true_val(snowboarder_journal_flex_impression, medium_more_fun)).
query(true_val(snowboarder_journal_flex_impression, unk_snowboarder_journal_flex_impression)).

% @attr king_snow_review
% @type categorical
% @canonical false
% @original_name King Snow review
% @values perfect_freeride_carver=Perfect_for_freeride_carver_powder_and_groomers unk_king_snow_review=Unknown
% @importance 0.80

0.78::acc(s66, king_snow_review).

0.63::true_val(king_snow_review, perfect_freeride_carver); 0.37::true_val(king_snow_review, unk_king_snow_review).

measured(s66, king_snow_review, perfect_freeride_carver).

all_consistent(king_snow_review) :- consistent(s66, king_snow_review).

evidence(all_consistent(king_snow_review)).
query(true_val(king_snow_review, perfect_freeride_carver)).
query(true_val(king_snow_review, unk_king_snow_review)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values edge_hold_responsive=Edge_hold_responsive_play_in_nose unk_positive_aspect=Unknown
% @importance 0.85

0.80::acc(s67, positive_aspect).

0.67::true_val(positive_aspect, edge_hold_responsive); 0.33::true_val(positive_aspect, unk_positive_aspect).

measured(s67, positive_aspect, edge_hold_responsive).

all_consistent(positive_aspect) :- consistent(s67, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, edge_hold_responsive)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr king_snow_sizing_recommendation
% @type categorical
% @canonical false
% @original_name King Snow reviewer sizing recommendation
% @values v157_at_5ft8_150lbs=157_perfect_at_5ft8_150lbs_8_5boot unk_king_snow_sizing_recommendation=Unknown
% @importance 0.75

0.78::acc(s68, king_snow_sizing_recommendation).

0.63::true_val(king_snow_sizing_recommendation, v157_at_5ft8_150lbs); 0.37::true_val(king_snow_sizing_recommendation, unk_king_snow_sizing_recommendation).

measured(s68, king_snow_sizing_recommendation, v157_at_5ft8_150lbs).

all_consistent(king_snow_sizing_recommendation) :- consistent(s68, king_snow_sizing_recommendation).

evidence(all_consistent(king_snow_sizing_recommendation)).
query(true_val(king_snow_sizing_recommendation, v157_at_5ft8_150lbs)).
query(true_val(king_snow_sizing_recommendation, unk_king_snow_sizing_recommendation)).

% @attr king_snow_sizing_advice
% @type categorical
% @canonical false
% @original_name King Snow sizing advice
% @values size_down_for_playful=Size_down_for_more_playful unk_king_snow_sizing_advice=Unknown
% @importance 0.70

0.78::acc(s69, king_snow_sizing_advice).

0.63::true_val(king_snow_sizing_advice, size_down_for_playful); 0.37::true_val(king_snow_sizing_advice, unk_king_snow_sizing_advice).

measured(s69, king_snow_sizing_advice, size_down_for_playful).

all_consistent(king_snow_sizing_advice) :- consistent(s69, king_snow_sizing_advice).

evidence(all_consistent(king_snow_sizing_advice)).
query(true_val(king_snow_sizing_advice, size_down_for_playful)).
query(true_val(king_snow_sizing_advice, unk_king_snow_sizing_advice)).

% @attr king_snow_terrain_tested
% @type categorical
% @canonical false
% @original_name King Snow reviewer terrain tested
% @values alpine_slush_sidehits=Alpine_groomers_slush_freeriding_side_hits unk_king_snow_terrain_tested=Unknown
% @importance 0.60

0.78::acc(s70, king_snow_terrain_tested).

0.63::true_val(king_snow_terrain_tested, alpine_slush_sidehits); 0.37::true_val(king_snow_terrain_tested, unk_king_snow_terrain_tested).

measured(s70, king_snow_terrain_tested, alpine_slush_sidehits).

all_consistent(king_snow_terrain_tested) :- consistent(s70, king_snow_terrain_tested).

evidence(all_consistent(king_snow_terrain_tested)).
query(true_val(king_snow_terrain_tested, alpine_slush_sidehits)).
query(true_val(king_snow_terrain_tested, unk_king_snow_terrain_tested)).

% @attr king_snow_shape_impression
% @type categorical
% @canonical false
% @original_name King Snow shape impression
% @values love_shape_wider_nice_tail=Love_the_shape_wider_nice_tail_cool_graphic unk_king_snow_shape_impression=Unknown
% @importance 0.50

0.75::acc(s71, king_snow_shape_impression).

0.60::true_val(king_snow_shape_impression, love_shape_wider_nice_tail); 0.40::true_val(king_snow_shape_impression, unk_king_snow_shape_impression).

measured(s71, king_snow_shape_impression, love_shape_wider_nice_tail).

all_consistent(king_snow_shape_impression) :- consistent(s71, king_snow_shape_impression).

evidence(all_consistent(king_snow_shape_impression)).
query(true_val(king_snow_shape_impression, love_shape_wider_nice_tail)).
query(true_val(king_snow_shape_impression, unk_king_snow_shape_impression)).

% @attr angrysnowboarder_review
% @type categorical
% @canonical false
% @original_name Angrysnowboarder review
% @values early_review_157=Early_review_published_May_2025_tested_157 unk_angrysnowboarder_review=Unknown
% @importance 0.50

0.62::acc(s72, angrysnowboarder_review).

0.39::true_val(angrysnowboarder_review, early_review_157); 0.61::true_val(angrysnowboarder_review, unk_angrysnowboarder_review).

measured(s72, angrysnowboarder_review, early_review_157).

all_consistent(angrysnowboarder_review) :- consistent(s72, angrysnowboarder_review).

evidence(all_consistent(angrysnowboarder_review)).
query(true_val(angrysnowboarder_review, early_review_157)).
query(true_val(angrysnowboarder_review, unk_angrysnowboarder_review)).

% @attr user_reviews_snowboards_com
% @type categorical
% @canonical false
% @original_name User reviews on Snowboards.com
% @values none_yet=No_Reviews_Yet unk_user_reviews_snowboards_com=Unknown
% @importance 0.35

0.70::acc(s73, user_reviews_snowboards_com).

0.54::true_val(user_reviews_snowboards_com, none_yet); 0.46::true_val(user_reviews_snowboards_com, unk_user_reviews_snowboards_com).

measured(s73, user_reviews_snowboards_com, none_yet).

all_consistent(user_reviews_snowboards_com) :- consistent(s73, user_reviews_snowboards_com).

evidence(all_consistent(user_reviews_snowboards_com)).
query(true_val(user_reviews_snowboards_com, none_yet)).
query(true_val(user_reviews_snowboards_com, unk_user_reviews_snowboards_com)).

% @attr user_reviews_salomon_com
% @type categorical
% @canonical false
% @original_name User reviews on Salomon.com (UK)
% @values none_yet_salomon=No_reviews_be_the_first unk_user_reviews_salomon_com=Unknown
% @importance 0.40

0.90::acc(s40, user_reviews_salomon_com).

0.86::true_val(user_reviews_salomon_com, none_yet_salomon); 0.14::true_val(user_reviews_salomon_com, unk_user_reviews_salomon_com).

measured(s40, user_reviews_salomon_com, none_yet_salomon).

all_consistent(user_reviews_salomon_com) :-
    (indep(s40), consistent(s40, user_reviews_salomon_com) ; \+indep(s40)).

evidence(all_consistent(user_reviews_salomon_com)).
query(true_val(user_reviews_salomon_com, none_yet_salomon)).
query(true_val(user_reviews_salomon_com, unk_user_reviews_salomon_com)).

% @attr glisshop_description
% @type categorical
% @canonical false
% @original_name Glisshop description
% @values more_versatile_less_physical=More_versatile_less_physical_than_Fastlane unk_glisshop_description=Unknown
% @importance 0.65

0.65::acc(s74, glisshop_description).

0.51::true_val(glisshop_description, more_versatile_less_physical); 0.49::true_val(glisshop_description, unk_glisshop_description).

measured(s74, glisshop_description, more_versatile_less_physical).

all_consistent(glisshop_description) :- consistent(s74, glisshop_description).

evidence(all_consistent(glisshop_description)).
query(true_val(glisshop_description, more_versatile_less_physical)).
query(true_val(glisshop_description, unk_glisshop_description)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values ride_psychocandy=Ride_Psychocandy_tapered_directional_unisex_freeride unk_comparable_board_cross_brand=Unknown
% @importance 0.70

0.65::acc(s75, comparable_board_cross_brand).
0.78::acc(s76, comparable_board_cross_brand).

0.90::true_val(comparable_board_cross_brand, ride_psychocandy); 0.10::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s75, comparable_board_cross_brand, ride_psychocandy).
measured(s76, comparable_board_cross_brand, ride_psychocandy).

all_consistent(comparable_board_cross_brand) :-
    consistent(s75, comparable_board_cross_brand),
    consistent(s76, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, ride_psychocandy)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values highpath=Salomon_Highpath_stiffer_quadratic_sidecut unk_comparable_board_same_brand=Unknown
% @importance 0.68

0.82::acc(s32, comparable_board_same_brand).
0.85::acc(s77, comparable_board_same_brand).

0.95::true_val(comparable_board_same_brand, highpath); 0.05::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s32, comparable_board_same_brand, highpath).
measured(s77, comparable_board_same_brand, highpath).

all_consistent(comparable_board_same_brand) :-
    (indep(s32), consistent(s32, comparable_board_same_brand) ; \+indep(s32)),
    consistent(s77, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, highpath)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_fastlane
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Fastlane)
% @values fastlane=Salomon_Fastlane_stiffest_Horizon_pin_tail unk_comparable_board_same_brand_fastlane=Unknown
% @importance 0.65

0.82::acc(s33, comparable_board_same_brand_fastlane).
0.85::acc(s78, comparable_board_same_brand_fastlane).

0.95::true_val(comparable_board_same_brand_fastlane, fastlane); 0.05::true_val(comparable_board_same_brand_fastlane, unk_comparable_board_same_brand_fastlane).

measured(s33, comparable_board_same_brand_fastlane, fastlane).
measured(s78, comparable_board_same_brand_fastlane, fastlane).

all_consistent(comparable_board_same_brand_fastlane) :-
    (indep(s33), consistent(s33, comparable_board_same_brand_fastlane) ; \+indep(s33)),
    consistent(s78, comparable_board_same_brand_fastlane).

evidence(all_consistent(comparable_board_same_brand_fastlane)).
query(true_val(comparable_board_same_brand_fastlane, fastlane)).
query(true_val(comparable_board_same_brand_fastlane, unk_comparable_board_same_brand_fastlane)).

% @attr comparable_board_same_brand_assassin
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Assassin)
% @values assassin=Salomon_Assassin_directional_twin_quiver_killer unk_comparable_board_same_brand_assassin=Unknown
% @importance 0.75

0.82::acc(s32, comparable_board_same_brand_assassin).

0.72::true_val(comparable_board_same_brand_assassin, assassin); 0.28::true_val(comparable_board_same_brand_assassin, unk_comparable_board_same_brand_assassin).

measured(s32, comparable_board_same_brand_assassin, assassin).

all_consistent(comparable_board_same_brand_assassin) :-
    (indep(s32), consistent(s32, comparable_board_same_brand_assassin) ; \+indep(s32)).

evidence(all_consistent(comparable_board_same_brand_assassin)).
query(true_val(comparable_board_same_brand_assassin, assassin)).
query(true_val(comparable_board_same_brand_assassin, unk_comparable_board_same_brand_assassin)).

% @attr comparable_board_cross_brand_others
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (others)
% @values stratos_counterbalance_alternator=Jones_Stratos_Burton_Counterbalance_Nitro_Alternator unk_comparable_board_cross_brand_others=Unknown
% @importance 0.65

0.72::acc(s79, comparable_board_cross_brand_others).

0.53::true_val(comparable_board_cross_brand_others, stratos_counterbalance_alternator); 0.47::true_val(comparable_board_cross_brand_others, unk_comparable_board_cross_brand_others).

measured(s79, comparable_board_cross_brand_others, stratos_counterbalance_alternator).

all_consistent(comparable_board_cross_brand_others) :- consistent(s79, comparable_board_cross_brand_others).

evidence(all_consistent(comparable_board_cross_brand_others)).
query(true_val(comparable_board_cross_brand_others, stratos_counterbalance_alternator)).
query(true_val(comparable_board_cross_brand_others, unk_comparable_board_cross_brand_others)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values two_year_limited=2_year_limited_warranty_manufacturing_defects unk_warranty=Unknown
% @importance 0.77

0.93::acc(s80, warranty).
0.93::acc(s81, warranty).
0.72::acc(s45, warranty).

0.95::true_val(warranty, two_year_limited); 0.05::true_val(warranty, unk_warranty).

measured(s80, warranty, two_year_limited).
measured(s81, warranty, two_year_limited).
measured(s45, warranty, two_year_limited).

all_consistent(warranty) :-
    consistent(s80, warranty),
    consistent(s81, warranty),
    (indep(s45), consistent(s45, warranty) ; \+indep(s45)).

evidence(all_consistent(warranty)).
query(true_val(warranty, two_year_limited)).
query(true_val(warranty, unk_warranty)).

% @attr warranty_exclusions
% @type categorical
% @canonical false
% @original_name warranty (exclusions)
% @values no_impact_abuse_wear=No_impact_abuse_misuse_wear_modification unk_warranty_exclusions=Unknown
% @importance 0.75

0.93::acc(s80, warranty_exclusions).

0.88::true_val(warranty_exclusions, no_impact_abuse_wear); 0.12::true_val(warranty_exclusions, unk_warranty_exclusions).

measured(s80, warranty_exclusions, no_impact_abuse_wear).

all_consistent(warranty_exclusions) :- consistent(s80, warranty_exclusions).

evidence(all_consistent(warranty_exclusions)).
query(true_val(warranty_exclusions, no_impact_abuse_wear)).
query(true_val(warranty_exclusions, unk_warranty_exclusions)).

% @attr brand_reputation
% @type categorical
% @canonical false
% @original_name Brand reputation
% @values established_global_40plus=Well_established_global_40plus_countries_since_1947 unk_brand_reputation=Unknown
% @importance 0.60

0.82::acc(s14, brand_reputation).
0.80::acc(s82, brand_reputation).

0.95::true_val(brand_reputation, established_global_40plus); 0.05::true_val(brand_reputation, unk_brand_reputation).

measured(s14, brand_reputation, established_global_40plus).
measured(s82, brand_reputation, established_global_40plus).

all_consistent(brand_reputation) :-
    consistent(s14, brand_reputation),
    consistent(s82, brand_reputation).

evidence(all_consistent(brand_reputation)).
query(true_val(brand_reputation, established_global_40plus)).
query(true_val(brand_reputation, unk_brand_reputation)).

% @attr brand_reputation_auski
% @type categorical
% @canonical false
% @original_name Brand reputation (Auski)
% @values french_alps_exploration=Founded_French_Alps_exploration_freedom unk_brand_reputation_auski=Unknown
% @importance 0.30

0.60::acc(s83, brand_reputation_auski).

0.42::true_val(brand_reputation_auski, french_alps_exploration); 0.58::true_val(brand_reputation_auski, unk_brand_reputation_auski).

measured(s83, brand_reputation_auski, french_alps_exploration).

all_consistent(brand_reputation_auski) :-
    (indep(s83), consistent(s83, brand_reputation_auski) ; \+indep(s83)).

evidence(all_consistent(brand_reputation_auski)).
query(true_val(brand_reputation_auski, french_alps_exploration)).
query(true_val(brand_reputation_auski, unk_brand_reputation_auski)).

% @attr salomon_snowboarding_heritage
% @type categorical
% @canonical false
% @original_name Salomon snowboarding heritage
% @values started_late_1990s=Started_producing_snowboards_late_1990s unk_salomon_snowboarding_heritage=Unknown
% @importance 0.35

0.82::acc(s17, salomon_snowboarding_heritage).

0.74::true_val(salomon_snowboarding_heritage, started_late_1990s); 0.26::true_val(salomon_snowboarding_heritage, unk_salomon_snowboarding_heritage).

measured(s17, salomon_snowboarding_heritage, started_late_1990s).

all_consistent(salomon_snowboarding_heritage) :- consistent(s17, salomon_snowboarding_heritage).

evidence(all_consistent(salomon_snowboarding_heritage)).
query(true_val(salomon_snowboarding_heritage, started_late_1990s)).
query(true_val(salomon_snowboarding_heritage, unk_salomon_snowboarding_heritage)).

% @attr salomon_us_operations
% @type categorical
% @canonical false
% @original_name Salomon US operations
% @values ogden_utah=Ogden_Utah unk_salomon_us_operations=Unknown
% @importance 0.30

0.80::acc(s84, salomon_us_operations).

0.72::true_val(salomon_us_operations, ogden_utah); 0.28::true_val(salomon_us_operations, unk_salomon_us_operations).

measured(s84, salomon_us_operations, ogden_utah).

all_consistent(salomon_us_operations) :- consistent(s84, salomon_us_operations).

evidence(all_consistent(salomon_us_operations)).
query(true_val(salomon_us_operations, ogden_utah)).
query(true_val(salomon_us_operations, unk_salomon_us_operations)).

% @attr retailer_evo
% @type categorical
% @canonical false
% @original_name evo retailer info
% @values major_us_lpg_freeship=Major_US_specialty_Lowest_Price_Guarantee_free_shipping unk_retailer_evo=Unknown
% @importance 0.85

0.82::acc(s34, retailer_evo).

0.72::true_val(retailer_evo, major_us_lpg_freeship); 0.28::true_val(retailer_evo, unk_retailer_evo).

measured(s34, retailer_evo, major_us_lpg_freeship).

all_consistent(retailer_evo) :-
    (indep(s34), consistent(s34, retailer_evo) ; \+indep(s34)).

evidence(all_consistent(retailer_evo)).
query(true_val(retailer_evo, major_us_lpg_freeship)).
query(true_val(retailer_evo, unk_retailer_evo)).

% @attr retailer_tactics
% @type categorical
% @canonical false
% @original_name Tactics retailer info
% @values est_1999_price_match=Established_US_boardsports_since_1999_price_match unk_retailer_tactics=Unknown
% @importance 0.90

0.80::acc(s27, retailer_tactics).

0.74::true_val(retailer_tactics, est_1999_price_match); 0.26::true_val(retailer_tactics, unk_retailer_tactics).

measured(s27, retailer_tactics, est_1999_price_match).

all_consistent(retailer_tactics) :-
    (indep(s27), consistent(s27, retailer_tactics) ; \+indep(s27)).

evidence(all_consistent(retailer_tactics)).
query(true_val(retailer_tactics, est_1999_price_match)).
query(true_val(retailer_tactics, unk_retailer_tactics)).

% @attr retailer_amazon
% @type categorical
% @canonical false
% @original_name Amazon (via The Ski Monster) retailer info
% @values binding_mount_90day=Binding_mounting_available_90_day_returns unk_retailer_amazon=Unknown
% @importance 0.80

0.78::acc(s35, retailer_amazon).

0.64::true_val(retailer_amazon, binding_mount_90day); 0.36::true_val(retailer_amazon, unk_retailer_amazon).

measured(s35, retailer_amazon, binding_mount_90day).

all_consistent(retailer_amazon) :-
    (indep(s35), consistent(s35, retailer_amazon) ; \+indep(s35)).

evidence(all_consistent(retailer_amazon)).
query(true_val(retailer_amazon, binding_mount_90day)).
query(true_val(retailer_amazon, unk_retailer_amazon)).

% @attr retailer_snowinn
% @type categorical
% @canonical false
% @original_name Snowinn/Tradeinn retailer info
% @values eu_marketplace_competitive=European_online_marketplace_competitive_pricing_2000plus_suppliers unk_retailer_snowinn=Unknown
% @importance 0.85

0.65::acc(s28, retailer_snowinn).

0.48::true_val(retailer_snowinn, eu_marketplace_competitive); 0.52::true_val(retailer_snowinn, unk_retailer_snowinn).

measured(s28, retailer_snowinn, eu_marketplace_competitive).

all_consistent(retailer_snowinn) :-
    (indep(s28), consistent(s28, retailer_snowinn) ; \+indep(s28)).

evidence(all_consistent(retailer_snowinn)).
query(true_val(retailer_snowinn, eu_marketplace_competitive)).
query(true_val(retailer_snowinn, unk_retailer_snowinn)).

% @attr retailer_melbourne_snowboard
% @type categorical
% @canonical false
% @original_name Melbourne Snowboard Centre retailer info
% @values specialist_au=Specialist_Australian_retailer unk_retailer_melbourne_snowboard=Unknown
% @importance 0.95

0.72::acc(s3, retailer_melbourne_snowboard).

0.63::true_val(retailer_melbourne_snowboard, specialist_au); 0.37::true_val(retailer_melbourne_snowboard, unk_retailer_melbourne_snowboard).

measured(s3, retailer_melbourne_snowboard, specialist_au).

all_consistent(retailer_melbourne_snowboard) :-
    (indep(s3), consistent(s3, retailer_melbourne_snowboard) ; \+indep(s3)).

evidence(all_consistent(retailer_melbourne_snowboard)).
query(true_val(retailer_melbourne_snowboard, specialist_au)).
query(true_val(retailer_melbourne_snowboard, unk_retailer_melbourne_snowboard)).

% @attr retailer_rhythm
% @type categorical
% @canonical false
% @original_name Rhythm Snowsports retailer info
% @values au_14day_365exchange=Australian_retailer_14_day_refund_365_day_exchange unk_retailer_rhythm=Unknown
% @importance 0.70

0.68::acc(s36, retailer_rhythm).

0.52::true_val(retailer_rhythm, au_14day_365exchange); 0.48::true_val(retailer_rhythm, unk_retailer_rhythm).

measured(s36, retailer_rhythm, au_14day_365exchange).

all_consistent(retailer_rhythm) :-
    (indep(s36), consistent(s36, retailer_rhythm) ; \+indep(s36)).

evidence(all_consistent(retailer_rhythm)).
query(true_val(retailer_rhythm, au_14day_365exchange)).
query(true_val(retailer_rhythm, unk_retailer_rhythm)).

% @attr retailer_auski
% @type categorical
% @canonical false
% @original_name Auski retailer info
% @values au_free_ship_99=Australian_retailer_free_shipping_over_99 unk_retailer_auski=Unknown
% @importance 0.85

0.72::acc(s4, retailer_auski).

0.63::true_val(retailer_auski, au_free_ship_99); 0.37::true_val(retailer_auski, unk_retailer_auski).

measured(s4, retailer_auski, au_free_ship_99).

all_consistent(retailer_auski) :-
    (indep(s4), consistent(s4, retailer_auski) ; \+indep(s4)).

evidence(all_consistent(retailer_auski)).
query(true_val(retailer_auski, au_free_ship_99)).
query(true_val(retailer_auski, unk_retailer_auski)).

% @attr retailer_balmoral
% @type categorical
% @canonical false
% @original_name Balmoral Boards retailer info
% @values au_10flat_30day_layby=Australian_retailer_10_flat_rate_30_day_returns_layby unk_retailer_balmoral=Unknown
% @importance 0.70

0.65::acc(s37, retailer_balmoral).

0.54::true_val(retailer_balmoral, au_10flat_30day_layby); 0.46::true_val(retailer_balmoral, unk_retailer_balmoral).

measured(s37, retailer_balmoral, au_10flat_30day_layby).

all_consistent(retailer_balmoral) :-
    (indep(s37), consistent(s37, retailer_balmoral) ; \+indep(s37)).

evidence(all_consistent(retailer_balmoral)).
query(true_val(retailer_balmoral, au_10flat_30day_layby)).
query(true_val(retailer_balmoral, unk_retailer_balmoral)).

% @attr retailer_snowtrax
% @type categorical
% @canonical false
% @original_name Snowtrax retailer info
% @values uk_authorized=UK_based_retailer_Dorset_authorized_dealer unk_retailer_snowtrax=Unknown
% @importance 0.65

0.68::acc(s38, retailer_snowtrax).

0.52::true_val(retailer_snowtrax, uk_authorized); 0.48::true_val(retailer_snowtrax, unk_retailer_snowtrax).

measured(s38, retailer_snowtrax, uk_authorized).

all_consistent(retailer_snowtrax) :-
    (indep(s38), consistent(s38, retailer_snowtrax) ; \+indep(s38)).

evidence(all_consistent(retailer_snowtrax)).
query(true_val(retailer_snowtrax, uk_authorized)).
query(true_val(retailer_snowtrax, unk_retailer_snowtrax)).

% @attr retailer_blauer
% @type categorical
% @canonical false
% @original_name Blauer Board Shop retailer info
% @values us_specialty=US_specialty_retailer unk_retailer_blauer=Unknown
% @importance 0.80

0.68::acc(s45, retailer_blauer).

0.55::true_val(retailer_blauer, us_specialty); 0.45::true_val(retailer_blauer, unk_retailer_blauer).

measured(s45, retailer_blauer, us_specialty).

all_consistent(retailer_blauer) :-
    (indep(s45), consistent(s45, retailer_blauer) ; \+indep(s45)).

evidence(all_consistent(retailer_blauer)).
query(true_val(retailer_blauer, us_specialty)).
query(true_val(retailer_blauer, unk_retailer_blauer)).

% @attr retailer_skipro
% @type categorical
% @canonical false
% @original_name SkiPro retailer info
% @values us_online=US_online_retailer unk_retailer_skipro=Unknown
% @importance 0.80

0.65::acc(s29, retailer_skipro).

0.54::true_val(retailer_skipro, us_online); 0.46::true_val(retailer_skipro, unk_retailer_skipro).

measured(s29, retailer_skipro, us_online).

all_consistent(retailer_skipro) :-
    (indep(s29), consistent(s29, retailer_skipro) ; \+indep(s29)).

evidence(all_consistent(retailer_skipro)).
query(true_val(retailer_skipro, us_online)).
query(true_val(retailer_skipro, unk_retailer_skipro)).