0.20::indep(s1).
0.15::indep(s15).
0.25::indep(s16).
0.20::indep(s22).
0.15::indep(s23).
0.15::indep(s24).
0.15::indep(s25).
0.20::indep(s26).
0.15::indep(s29).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

0.90::acc(s1, brand).
0.95::acc(s2, brand).

% @attr brand
% @type categorical
% @canonical false
% @original_name brand
% @values rome=Rome unk_brand=Unknown
% @importance 0.75

0.95::true_val(brand, rome); 0.05::true_val(brand, unk_brand).
measured(s1, brand, rome).
measured(s2, brand, rome).
all_consistent(brand) :-
    (indep(s1), consistent(s1, brand) ; \+indep(s1)),
    consistent(s2, brand).
evidence(all_consistent(brand)).
query(true_val(brand, rome)).
query(true_val(brand, unk_brand)).

0.90::acc(s1, model_name).

% @attr model_name
% @type categorical
% @canonical false
% @original_name model_name
% @values rene=Rene unk_model_name=Unknown
% @importance 1.0

0.71::true_val(model_name, rene); 0.29::true_val(model_name, unk_model_name).
measured(s1, model_name, rene).
all_consistent(model_name) :-
    (indep(s1), consistent(s1, model_name) ; \+indep(s1)).
evidence(all_consistent(model_name)).
query(true_val(model_name, rene)).
query(true_val(model_name, unk_model_name)).

0.90::acc(s1, model_year).

% @attr model_year
% @type categorical
% @canonical false
% @original_name model_year
% @values y2027=2027 unk_model_year=Unknown
% @importance 1.0

0.71::true_val(model_year, y2027); 0.29::true_val(model_year, unk_model_year).
measured(s1, model_year, y2027).
all_consistent(model_year) :-
    (indep(s1), consistent(s1, model_year) ; \+indep(s1)).
evidence(all_consistent(model_year)).
query(true_val(model_year, y2027)).
query(true_val(model_year, unk_model_year)).

0.88::acc(s1, predecessor_model_name).
0.85::acc(s4, predecessor_model_name).

% @attr predecessor_model_name
% @type categorical
% @canonical false
% @original_name predecessor_model_name
% @values rene_gade=Rome_Rene_Gade unk_predecessor_model_name=Unknown
% @importance 0.68

0.95::true_val(predecessor_model_name, rene_gade); 0.05::true_val(predecessor_model_name, unk_predecessor_model_name).
measured(s1, predecessor_model_name, rene_gade).
measured(s4, predecessor_model_name, rene_gade).
all_consistent(predecessor_model_name) :-
    (indep(s1), consistent(s1, predecessor_model_name) ; \+indep(s1)),
    consistent(s4, predecessor_model_name).
evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, rene_gade)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).

0.90::acc(s1, product_type).

% @attr product_type
% @type categorical
% @canonical false
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.71::true_val(product_type, snowboard); 0.29::true_val(product_type, unk_product_type).
measured(s1, product_type, snowboard).
all_consistent(product_type) :-
    (indep(s1), consistent(s1, product_type) ; \+indep(s1)).
evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

0.88::acc(s1, board_category).
0.90::acc(s5, board_category).

% @attr board_category
% @type categorical
% @canonical false
% @original_name board_category
% @values all_mountain_freestyle=All_Mountain_Freestyle unk_board_category=Unknown
% @importance 0.85

0.95::true_val(board_category, all_mountain_freestyle); 0.05::true_val(board_category, unk_board_category).
measured(s1, board_category, all_mountain_freestyle).
measured(s5, board_category, all_mountain_freestyle).
all_consistent(board_category) :-
    (indep(s1), consistent(s1, board_category) ; \+indep(s1)),
    consistent(s5, board_category).
evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain_freestyle)).
query(true_val(board_category, unk_board_category)).

0.88::acc(s1, gender).
0.90::acc(s5, gender).

% @attr gender
% @type categorical
% @canonical false
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.85

0.95::true_val(gender, mens); 0.05::true_val(gender, unk_gender).
measured(s1, gender, mens).
measured(s5, gender, mens).
all_consistent(gender) :-
    (indep(s1), consistent(s1, gender) ; \+indep(s1)),
    consistent(s5, gender).
evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

0.93::acc(s6, pro_rider_name).
0.88::acc(s7, pro_rider_name).

% @attr pro_rider_name
% @type categorical
% @canonical false
% @original_name pro_rider_name
% @values rene_rinnekangas=Rene_Rinnekangas unk_pro_rider_name=Unknown
% @importance 0.48

0.95::true_val(pro_rider_name, rene_rinnekangas); 0.05::true_val(pro_rider_name, unk_pro_rider_name).
measured(s6, pro_rider_name, rene_rinnekangas).
measured(s7, pro_rider_name, rene_rinnekangas).
all_consistent(pro_rider_name) :-
    consistent(s6, pro_rider_name),
    consistent(s7, pro_rider_name).
evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, rene_rinnekangas)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

0.88::acc(s7, pro_rider_nationality).

% @attr pro_rider_nationality
% @type categorical
% @canonical false
% @original_name pro rider nationality
% @values finnish=Finnish_from_Iisalmi unk_pro_rider_nationality=Unknown
% @importance 0.35

0.71::true_val(pro_rider_nationality, finnish); 0.29::true_val(pro_rider_nationality, unk_pro_rider_nationality).
measured(s7, pro_rider_nationality, finnish).
all_consistent(pro_rider_nationality) :-
    consistent(s7, pro_rider_nationality).
evidence(all_consistent(pro_rider_nationality)).
query(true_val(pro_rider_nationality, finnish)).
query(true_val(pro_rider_nationality, unk_pro_rider_nationality)).

0.88::acc(s7, pro_rider_credentials).
0.95::acc(s8, pro_rider_credentials).

% @attr pro_rider_credentials
% @type categorical
% @canonical false
% @original_name pro rider competitive credentials
% @values olympian_xgames=Olympian_XGames_medallist unk_pro_rider_credentials=Unknown
% @importance 0.33

0.95::true_val(pro_rider_credentials, olympian_xgames); 0.05::true_val(pro_rider_credentials, unk_pro_rider_credentials).
measured(s7, pro_rider_credentials, olympian_xgames).
measured(s8, pro_rider_credentials, olympian_xgames).
all_consistent(pro_rider_credentials) :-
    consistent(s7, pro_rider_credentials),
    consistent(s8, pro_rider_credentials).
evidence(all_consistent(pro_rider_credentials)).
query(true_val(pro_rider_credentials, olympian_xgames)).
query(true_val(pro_rider_credentials, unk_pro_rider_credentials)).

0.88::acc(s1, design_philosophy).

% @attr design_philosophy
% @type categorical
% @canonical false
% @original_name design philosophy
% @values replacement_built_for_rene=Replacement_for_Renegade_built_around_Rene unk_design_philosophy=Unknown
% @importance 0.95

0.71::true_val(design_philosophy, replacement_built_for_rene); 0.29::true_val(design_philosophy, unk_design_philosophy).
measured(s1, design_philosophy, replacement_built_for_rene).
all_consistent(design_philosophy) :-
    (indep(s1), consistent(s1, design_philosophy) ; \+indep(s1)).
evidence(all_consistent(design_philosophy)).
query(true_val(design_philosophy, replacement_built_for_rene)).
query(true_val(design_philosophy, unk_design_philosophy)).

0.93::acc(s9, model_series).

% @attr model_series
% @type categorical
% @canonical false
% @original_name model series
% @values signature_collection=Rome_Signature_Collection unk_model_series=Unknown
% @importance 0.4

0.86::true_val(model_series, signature_collection); 0.14::true_val(model_series, unk_model_series).
measured(s9, model_series, signature_collection).
all_consistent(model_series) :-
    consistent(s9, model_series).
evidence(all_consistent(model_series)).
query(true_val(model_series, signature_collection)).
query(true_val(model_series, unk_model_series)).

0.90::acc(s1, model_first_available_year).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2026_27=2026_27_season unk_model_first_available_year=Unknown
% @importance 1.0

0.71::true_val(model_first_available_year, season_2026_27); 0.29::true_val(model_first_available_year, unk_model_first_available_year).
measured(s1, model_first_available_year, season_2026_27).
all_consistent(model_first_available_year) :-
    (indep(s1), consistent(s1, model_first_available_year) ; \+indep(s1)).
evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2026_27)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

0.85::acc(s10, model_first_available_year_predecessor).
0.70::acc(s11, model_first_available_year_predecessor).

% @attr model_first_available_year_predecessor
% @type categorical
% @canonical false
% @original_name model_first_available_year (predecessor)
% @values season_2023_24=2023_24_season unk_mfay_pred=Unknown
% @importance 0.45

0.95::true_val(model_first_available_year_predecessor, season_2023_24); 0.05::true_val(model_first_available_year_predecessor, unk_mfay_pred).
measured(s10, model_first_available_year_predecessor, season_2023_24).
measured(s11, model_first_available_year_predecessor, season_2023_24).
all_consistent(model_first_available_year_predecessor) :-
    consistent(s10, model_first_available_year_predecessor),
    consistent(s11, model_first_available_year_predecessor).
evidence(all_consistent(model_first_available_year_predecessor)).
query(true_val(model_first_available_year_predecessor, season_2023_24)).
query(true_val(model_first_available_year_predecessor, unk_mfay_pred)).

0.88::acc(s1, manufacturer).

% @attr manufacturer
% @type categorical
% @canonical false
% @original_name manufacturer
% @values rome_sds=Rome_Snowboards_SDS unk_manufacturer=Unknown
% @importance 0.4

0.68::true_val(manufacturer, rome_sds); 0.32::true_val(manufacturer, unk_manufacturer).
measured(s1, manufacturer, rome_sds).
all_consistent(manufacturer) :-
    (indep(s1), consistent(s1, manufacturer) ; \+indep(s1)).
evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, rome_sds)).
query(true_val(manufacturer, unk_manufacturer)).

0.85::acc(s1, manufacturer_founding_year).
0.85::acc(s13, manufacturer_founding_year).

% @attr manufacturer_founding_year
% @type numeric
% @canonical false
% @original_name manufacturer founding year
% @values y2001=2001
% @importance 0.38

0.95::true_val(manufacturer_founding_year, y2001); 0.05::true_val(manufacturer_founding_year, unk_mfg_year).
measured(s1, manufacturer_founding_year, y2001).
measured(s13, manufacturer_founding_year, y2001).
all_consistent(manufacturer_founding_year) :-
    (indep(s1), consistent(s1, manufacturer_founding_year) ; \+indep(s1)),
    consistent(s13, manufacturer_founding_year).
evidence(all_consistent(manufacturer_founding_year)).
query(true_val(manufacturer_founding_year, y2001)).
query(true_val(manufacturer_founding_year, unk_mfg_year)).

0.85::acc(s13, manufacturer_founders).

% @attr manufacturer_founders
% @type categorical
% @canonical false
% @original_name manufacturer founders
% @values reed_maravetz=Josh_Reed_and_Paul_Maravetz unk_manufacturer_founders=Unknown
% @importance 0.35

0.67::true_val(manufacturer_founders, reed_maravetz); 0.33::true_val(manufacturer_founders, unk_manufacturer_founders).
measured(s13, manufacturer_founders, reed_maravetz).
all_consistent(manufacturer_founders) :-
    consistent(s13, manufacturer_founders).
evidence(all_consistent(manufacturer_founders)).
query(true_val(manufacturer_founders, reed_maravetz)).
query(true_val(manufacturer_founders, unk_manufacturer_founders)).

0.85::acc(s1, manufacturer_headquarters).
0.85::acc(s13, manufacturer_headquarters).

% @attr manufacturer_headquarters
% @type categorical
% @canonical false
% @original_name manufacturer headquarters
% @values waterbury_vt=Waterbury_Vermont_USA unk_manufacturer_headquarters=Unknown
% @importance 0.38

0.95::true_val(manufacturer_headquarters, waterbury_vt); 0.05::true_val(manufacturer_headquarters, unk_manufacturer_headquarters).
measured(s1, manufacturer_headquarters, waterbury_vt).
measured(s13, manufacturer_headquarters, waterbury_vt).
all_consistent(manufacturer_headquarters) :-
    (indep(s1), consistent(s1, manufacturer_headquarters) ; \+indep(s1)),
    consistent(s13, manufacturer_headquarters).
evidence(all_consistent(manufacturer_headquarters)).
query(true_val(manufacturer_headquarters, waterbury_vt)).
query(true_val(manufacturer_headquarters, unk_manufacturer_headquarters)).

0.85::acc(s13, manufacturer_ethos).

% @attr manufacturer_ethos
% @type categorical
% @canonical false
% @original_name manufacturer ethos
% @values all_ways_down=All_Ways_Down_freestyle_rider_driven unk_manufacturer_ethos=Unknown
% @importance 0.35

0.67::true_val(manufacturer_ethos, all_ways_down); 0.33::true_val(manufacturer_ethos, unk_manufacturer_ethos).
measured(s13, manufacturer_ethos, all_ways_down).
all_consistent(manufacturer_ethos) :-
    consistent(s13, manufacturer_ethos).
evidence(all_consistent(manufacturer_ethos)).
query(true_val(manufacturer_ethos, all_ways_down)).
query(true_val(manufacturer_ethos, unk_manufacturer_ethos)).

0.90::acc(s14, brand_director).

% @attr brand_director
% @type categorical
% @canonical false
% @original_name brand director (2026/27 season)
% @values ben_morse=Ben_Morse unk_brand_director=Unknown
% @importance 0.75

0.81::true_val(brand_director, ben_morse); 0.19::true_val(brand_director, unk_brand_director).
measured(s14, brand_director, ben_morse).
all_consistent(brand_director) :-
    consistent(s14, brand_director).
evidence(all_consistent(brand_director)).
query(true_val(brand_director, ben_morse)).
query(true_val(brand_director, unk_brand_director)).

0.90::acc(s1, price_aud_merchant).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v949_99=949.99 unk_price_aud_merchant=Unknown
% @importance 1.0

0.71::true_val(price_aud_merchant, v949_99); 0.29::true_val(price_aud_merchant, unk_price_aud_merchant).
measured(s1, price_aud_merchant, v949_99).
all_consistent(price_aud_merchant) :-
    (indep(s1), consistent(s1, price_aud_merchant) ; \+indep(s1)).
evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v949_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

0.88::acc(s1, availability_status).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values preorder_may_2026=Preorder_est_May_2026 unk_availability_status=Unknown
% @importance 1.0

0.71::true_val(availability_status, preorder_may_2026); 0.29::true_val(availability_status, unk_availability_status).
measured(s1, availability_status, preorder_may_2026).
all_consistent(availability_status) :-
    (indep(s1), consistent(s1, availability_status) ; \+indep(s1)).
evidence(all_consistent(availability_status)).
query(true_val(availability_status, preorder_may_2026)).
query(true_val(availability_status, unk_availability_status)).

0.78::acc(s15, availability_status_snowcentral).

% @attr availability_status_snowcentral
% @type categorical
% @canonical false
% @original_name availability_status (snowcentral)
% @values listed_for_sale=Listed_for_sale unk_avail_sc=Unknown
% @importance 0.7

0.52::true_val(availability_status_snowcentral, listed_for_sale); 0.48::true_val(availability_status_snowcentral, unk_avail_sc).
measured(s15, availability_status_snowcentral, listed_for_sale).
all_consistent(availability_status_snowcentral) :-
    (indep(s15), consistent(s15, availability_status_snowcentral) ; \+indep(s15)).
evidence(all_consistent(availability_status_snowcentral)).
query(true_val(availability_status_snowcentral, listed_for_sale)).
query(true_val(availability_status_snowcentral, unk_avail_sc)).

0.88::acc(s16, price_usd_milosport).

% @attr price_usd_milosport
% @type numeric
% @unit USD
% @canonical false
% @original_name USD price (Milosport)
% @values v569_95=569.95 unk_price_usd_milosport=Unknown
% @importance 0.95

0.76::true_val(price_usd_milosport, v569_95); 0.24::true_val(price_usd_milosport, unk_price_usd_milosport).
measured(s16, price_usd_milosport, v569_95).
all_consistent(price_usd_milosport) :-
    (indep(s16), consistent(s16, price_usd_milosport) ; \+indep(s16)).
evidence(all_consistent(price_usd_milosport)).
query(true_val(price_usd_milosport, v569_95)).
query(true_val(price_usd_milosport, unk_price_usd_milosport)).

0.85::acc(s16, available_sizes).
0.80::acc(s1, available_sizes).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values five_sizes=153_156_157W_159_160W three_sizes=156_157W_159
% @importance 0.98

0.60::true_val(available_sizes, five_sizes); 0.40::true_val(available_sizes, three_sizes).
measured(s16, available_sizes, five_sizes).
measured(s1, available_sizes, three_sizes).
all_consistent(available_sizes) :-
    (indep(s16), consistent(s16, available_sizes) ; \+indep(s16)),
    (indep(s1), consistent(s1, available_sizes) ; \+indep(s1)).
evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, five_sizes)).
query(true_val(available_sizes, three_sizes)).

0.88::acc(s16, availability_status_milosport).

% @attr availability_status_milosport
% @type categorical
% @canonical false
% @original_name availability_status (milosport)
% @values in_stock=In_stock_pickup_SLC unk_avail_milo=Unknown
% @importance 0.95

0.76::true_val(availability_status_milosport, in_stock); 0.24::true_val(availability_status_milosport, unk_avail_milo).
measured(s16, availability_status_milosport, in_stock).
all_consistent(availability_status_milosport) :-
    (indep(s16), consistent(s16, availability_status_milosport) ; \+indep(s16)).
evidence(all_consistent(availability_status_milosport)).
query(true_val(availability_status_milosport, in_stock)).
query(true_val(availability_status_milosport, unk_avail_milo)).

0.90::acc(s17, price_usd_msrp).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_msrp
% @values v629_95=629.95 unk_price_usd_msrp=Unknown
% @importance 0.8

0.81::true_val(price_usd_msrp, v629_95); 0.19::true_val(price_usd_msrp, unk_price_usd_msrp).
measured(s17, price_usd_msrp, v629_95).
all_consistent(price_usd_msrp) :-
    consistent(s17, price_usd_msrp).
evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v629_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

0.90::acc(s17, price_usd_evo).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_evo
% @values v440_96=440.96 unk_price_usd_evo=Unknown
% @importance 0.8

0.81::true_val(price_usd_evo, v440_96); 0.19::true_val(price_usd_evo, unk_price_usd_evo).
measured(s17, price_usd_evo, v440_96).
all_consistent(price_usd_evo) :-
    consistent(s17, price_usd_evo).
evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v440_96)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

0.85::acc(s18, price_usd_predecessor_skipro).

% @attr price_usd_predecessor_skipro
% @type numeric
% @unit USD
% @canonical false
% @original_name Rene-Gade 2026 USD price at Ski Pro AZ
% @values v629_95=629.95 unk_price_pred_skipro=Unknown
% @importance 0.7

0.63::true_val(price_usd_predecessor_skipro, v629_95); 0.37::true_val(price_usd_predecessor_skipro, unk_price_pred_skipro).
measured(s18, price_usd_predecessor_skipro, v629_95).
all_consistent(price_usd_predecessor_skipro) :-
    consistent(s18, price_usd_predecessor_skipro).
evidence(all_consistent(price_usd_predecessor_skipro)).
query(true_val(price_usd_predecessor_skipro, v629_95)).
query(true_val(price_usd_predecessor_skipro, unk_price_pred_skipro)).

0.85::acc(s19, price_gbp_predecessor).

% @attr price_gbp_predecessor
% @type numeric
% @unit GBP
% @canonical false
% @original_name Rene-Gade 2025 GBP price
% @values v372=372.0 unk_price_gbp_pred=Unknown
% @importance 0.8

0.72::true_val(price_gbp_predecessor, v372); 0.28::true_val(price_gbp_predecessor, unk_price_gbp_pred).
measured(s19, price_gbp_predecessor, v372).
all_consistent(price_gbp_predecessor) :-
    consistent(s19, price_gbp_predecessor).
evidence(all_consistent(price_gbp_predecessor)).
query(true_val(price_gbp_predecessor, v372)).
query(true_val(price_gbp_predecessor, unk_price_gbp_pred)).

0.85::acc(s20, price_eur_predecessor).

% @attr price_eur_predecessor
% @type numeric
% @unit EUR
% @canonical false
% @original_name Rene-Gade EUR price at SnowCountry
% @values v449_96=449.96 unk_price_eur_pred=Unknown
% @importance 0.85

0.68::true_val(price_eur_predecessor, v449_96); 0.32::true_val(price_eur_predecessor, unk_price_eur_pred).
measured(s20, price_eur_predecessor, v449_96).
all_consistent(price_eur_predecessor) :-
    consistent(s20, price_eur_predecessor).
evidence(all_consistent(price_eur_predecessor)).
query(true_val(price_eur_predecessor, v449_96)).
query(true_val(price_eur_predecessor, unk_price_eur_pred)).

0.90::acc(s1, shape).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values directional_twin=Directional_Twin unk_shape=Unknown
% @importance 0.98

0.95::true_val(shape, directional_twin); 0.05::true_val(shape, unk_shape).
measured(s1, shape, directional_twin).
all_consistent(shape) :-
    (indep(s1), consistent(s1, shape) ; \+indep(s1)).
evidence(all_consistent(shape)).
query(true_val(shape, directional_twin)).
query(true_val(shape, unk_shape)).

0.88::acc(s1, shape_description).

% @attr shape_description
% @type categorical
% @canonical false
% @original_name shape description (merchant)
% @values longer_nose_balanced_freestyle=Longer_nose_balanced_freestyle unk_shape_description=Unknown
% @importance 0.95

0.71::true_val(shape_description, longer_nose_balanced_freestyle); 0.29::true_val(shape_description, unk_shape_description).
measured(s1, shape_description, longer_nose_balanced_freestyle).
all_consistent(shape_description) :-
    (indep(s1), consistent(s1, shape_description) ; \+indep(s1)).
evidence(all_consistent(shape_description)).
query(true_val(shape_description, longer_nose_balanced_freestyle)).
query(true_val(shape_description, unk_shape_description)).

0.93::acc(s1, camber_type).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values fusion_camber=Fusion_Camber unk_camber_type=Unknown
% @importance 0.98

0.95::true_val(camber_type, fusion_camber); 0.05::true_val(camber_type, unk_camber_type).
measured(s1, camber_type, fusion_camber).
all_consistent(camber_type) :-
    (indep(s1), consistent(s1, camber_type) ; \+indep(s1)).
evidence(all_consistent(camber_type)).
query(true_val(camber_type, fusion_camber)).
query(true_val(camber_type, unk_camber_type)).

0.88::acc(s1, camber_description).

% @attr camber_description
% @type categorical
% @canonical false
% @original_name camber_description
% @values pos_camber_rocker_tips=Positive_camber_rocker_nose_tail unk_camber_description=Unknown
% @importance 0.95

0.71::true_val(camber_description, pos_camber_rocker_tips); 0.29::true_val(camber_description, unk_camber_description).
measured(s1, camber_description, pos_camber_rocker_tips).
all_consistent(camber_description) :-
    (indep(s1), consistent(s1, camber_description) ; \+indep(s1)).
evidence(all_consistent(camber_description)).
query(true_val(camber_description, pos_camber_rocker_tips)).
query(true_val(camber_description, unk_camber_description)).

0.95::acc(s21, camber_type_predecessor).
0.88::acc(s22, camber_type_predecessor).

% @attr camber_type_predecessor
% @type categorical
% @canonical false
% @original_name camber_type (predecessor)
% @values stay_positive=Stay_Positive_Camber unk_camber_pred=Unknown
% @importance 0.83

0.95::true_val(camber_type_predecessor, stay_positive); 0.05::true_val(camber_type_predecessor, unk_camber_pred).
measured(s21, camber_type_predecessor, stay_positive).
measured(s22, camber_type_predecessor, stay_positive).
all_consistent(camber_type_predecessor) :-
    consistent(s21, camber_type_predecessor),
    (indep(s22), consistent(s22, camber_type_predecessor) ; \+indep(s22)).
evidence(all_consistent(camber_type_predecessor)).
query(true_val(camber_type_predecessor, stay_positive)).
query(true_val(camber_type_predecessor, unk_camber_pred)).

0.90::acc(s1, three_d_shape).

% @attr three_d_shape
% @type categorical
% @canonical false
% @original_name 3D shape
% @values directional_diamond_3d=Directional_Diamond_3D unk_three_d_shape=Unknown
% @importance 1.0

0.71::true_val(three_d_shape, directional_diamond_3d); 0.29::true_val(three_d_shape, unk_three_d_shape).
measured(s1, three_d_shape, directional_diamond_3d).
all_consistent(three_d_shape) :-
    (indep(s1), consistent(s1, three_d_shape) ; \+indep(s1)).
evidence(all_consistent(three_d_shape)).
query(true_val(three_d_shape, directional_diamond_3d)).
query(true_val(three_d_shape, unk_three_d_shape)).

0.90::acc(s1, tail_design).

% @attr tail_design
% @type categorical
% @canonical false
% @original_name tail design
% @values tail_double_kick=Tail_Double_Kick unk_tail_design=Unknown
% @importance 1.0

0.71::true_val(tail_design, tail_double_kick); 0.29::true_val(tail_design, unk_tail_design).
measured(s1, tail_design, tail_double_kick).
all_consistent(tail_design) :-
    (indep(s1), consistent(s1, tail_design) ; \+indep(s1)).
evidence(all_consistent(tail_design)).
query(true_val(tail_design, tail_double_kick)).
query(true_val(tail_design, unk_tail_design)).

0.90::acc(s1, sidecut_type).
0.88::acc(s22, sidecut_type).

% @attr sidecut_type
% @type categorical
% @canonical false
% @original_name sidecut_type
% @values radial=Radial_Sidecut unk_sidecut_type=Unknown
% @importance 0.9

0.95::true_val(sidecut_type, radial); 0.05::true_val(sidecut_type, unk_sidecut_type).
measured(s1, sidecut_type, radial).
measured(s22, sidecut_type, radial).
all_consistent(sidecut_type) :-
    (indep(s1), consistent(s1, sidecut_type) ; \+indep(s1)),
    (indep(s22), consistent(s22, sidecut_type) ; \+indep(s22)).
evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, radial)).
query(true_val(sidecut_type, unk_sidecut_type)).

0.88::acc(s1, taper).

% @attr taper
% @type numeric
% @unit cm
% @canonical true
% @original_name taper
% @values v0=0.0 unk_taper=Unknown
% @importance 0.95

0.71::true_val(taper, v0); 0.29::true_val(taper, unk_taper).
measured(s1, taper, v0).
all_consistent(taper) :-
    (indep(s1), consistent(s1, taper) ; \+indep(s1)).
evidence(all_consistent(taper)).
query(true_val(taper, v0)).
query(true_val(taper, unk_taper)).

0.88::acc(s1, setback).

% @attr setback
% @type numeric
% @unit cm
% @canonical true
% @original_name setback
% @values v0=0.0 unk_setback=Unknown
% @importance 0.95

0.71::true_val(setback, v0); 0.29::true_val(setback, unk_setback).
measured(s1, setback, v0).
all_consistent(setback) :-
    (indep(s1), consistent(s1, setback) ; \+indep(s1)).
evidence(all_consistent(setback)).
query(true_val(setback, v0)).
query(true_val(setback, unk_setback)).

0.90::acc(s1, flex_rating_10).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v7=7.0 unk_flex_rating_10=Unknown
% @importance 0.98

0.71::true_val(flex_rating_10, v7); 0.29::true_val(flex_rating_10, unk_flex_rating_10).
measured(s1, flex_rating_10, v7).
all_consistent(flex_rating_10) :-
    (indep(s1), consistent(s1, flex_rating_10) ; \+indep(s1)).
evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v7)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

0.80::acc(s23, flex_rating_10_predecessor).
0.70::acc(s24, flex_rating_10_predecessor).

% @attr flex_rating_10_predecessor
% @type numeric
% @unit /10
% @canonical false
% @original_name flex_rating_10 (predecessor)
% @values v8=8.0 v9=9.0
% @importance 0.78

0.55::true_val(flex_rating_10_predecessor, v8); 0.45::true_val(flex_rating_10_predecessor, v9).
measured(s23, flex_rating_10_predecessor, v8).
measured(s24, flex_rating_10_predecessor, v9).
all_consistent(flex_rating_10_predecessor) :-
    (indep(s23), consistent(s23, flex_rating_10_predecessor) ; \+indep(s23)),
    (indep(s24), consistent(s24, flex_rating_10_predecessor) ; \+indep(s24)).
evidence(all_consistent(flex_rating_10_predecessor)).
query(true_val(flex_rating_10_predecessor, v8)).
query(true_val(flex_rating_10_predecessor, v9)).

0.88::acc(s1, flex_feel).

% @attr flex_feel
% @type categorical
% @canonical false
% @original_name flex_feel
% @values responsive_medium_stiff=Responsive_medium_stiff unk_flex_feel=Unknown
% @importance 0.95

0.71::true_val(flex_feel, responsive_medium_stiff); 0.29::true_val(flex_feel, unk_flex_feel).
measured(s1, flex_feel, responsive_medium_stiff).
all_consistent(flex_feel) :-
    (indep(s1), consistent(s1, flex_feel) ; \+indep(s1)).
evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, responsive_medium_stiff)).
query(true_val(flex_feel, unk_flex_feel)).

0.93::acc(s1, core_material).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values pop_core=Pop_Core_poplar_paulownia unk_core_material=Unknown
% @importance 0.98

0.71::true_val(core_material, pop_core); 0.29::true_val(core_material, unk_core_material).
measured(s1, core_material, pop_core).
all_consistent(core_material) :-
    (indep(s1), consistent(s1, core_material) ; \+indep(s1)).
evidence(all_consistent(core_material)).
query(true_val(core_material, pop_core)).
query(true_val(core_material, unk_core_material)).

0.88::acc(s26, core_material_predecessor).
0.85::acc(s25, core_material_predecessor).

% @attr core_material_predecessor
% @type categorical
% @canonical false
% @original_name core_material (predecessor)
% @values superpop_core=SuperPop_Core unk_core_pred=Unknown
% @importance 0.73

0.95::true_val(core_material_predecessor, superpop_core); 0.05::true_val(core_material_predecessor, unk_core_pred).
measured(s26, core_material_predecessor, superpop_core).
measured(s25, core_material_predecessor, superpop_core).
all_consistent(core_material_predecessor) :-
    (indep(s26), consistent(s26, core_material_predecessor) ; \+indep(s26)),
    (indep(s25), consistent(s25, core_material_predecessor) ; \+indep(s25)).
evidence(all_consistent(core_material_predecessor)).
query(true_val(core_material_predecessor, superpop_core)).
query(true_val(core_material_predecessor, unk_core_pred)).

0.92::acc(s1, laminate).
0.95::acc(s28, laminate).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values triax_glass=Triax_Glass unk_laminate=Unknown
% @importance 0.9

0.95::true_val(laminate, triax_glass); 0.05::true_val(laminate, unk_laminate).
measured(s1, laminate, triax_glass).
measured(s28, laminate, triax_glass).
all_consistent(laminate) :-
    (indep(s1), consistent(s1, laminate) ; \+indep(s1)),
    consistent(s28, laminate).
evidence(all_consistent(laminate)).
query(true_val(laminate, triax_glass)).
query(true_val(laminate, unk_laminate)).

0.93::acc(s1, construction_material_innovation).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values bamboo_omega_hotrods=Directional_Triple_Bamboo_Omega_HotRods unk_cmi=Unknown
% @importance 0.98

0.71::true_val(construction_material_innovation, bamboo_omega_hotrods); 0.29::true_val(construction_material_innovation, unk_cmi).
measured(s1, construction_material_innovation, bamboo_omega_hotrods).
all_consistent(construction_material_innovation) :-
    (indep(s1), consistent(s1, construction_material_innovation) ; \+indep(s1)).
evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, bamboo_omega_hotrods)).
query(true_val(construction_material_innovation, unk_cmi)).

0.95::acc(s21, construction_material_innovation_predecessor).
0.88::acc(s22, construction_material_innovation_predecessor).

% @attr construction_material_innovation_predecessor
% @type categorical
% @canonical false
% @original_name construction_material_innovation (predecessor)
% @values carbon_omega_hotrods=Directional_Triple_Carbon_Omega_HotRods unk_cmi_pred=Unknown
% @importance 0.83

0.95::true_val(construction_material_innovation_predecessor, carbon_omega_hotrods); 0.05::true_val(construction_material_innovation_predecessor, unk_cmi_pred).
measured(s21, construction_material_innovation_predecessor, carbon_omega_hotrods).
measured(s22, construction_material_innovation_predecessor, carbon_omega_hotrods).
all_consistent(construction_material_innovation_predecessor) :-
    consistent(s21, construction_material_innovation_predecessor),
    (indep(s22), consistent(s22, construction_material_innovation_predecessor) ; \+indep(s22)).
evidence(all_consistent(construction_material_innovation_predecessor)).
query(true_val(construction_material_innovation_predecessor, carbon_omega_hotrods)).
query(true_val(construction_material_innovation_predecessor, unk_cmi_pred)).

0.93::acc(s1, base_material).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sinterstrong=SinterStrong_Base unk_base_material=Unknown
% @importance 0.98

0.71::true_val(base_material, sinterstrong); 0.29::true_val(base_material, unk_base_material).
measured(s1, base_material, sinterstrong).
all_consistent(base_material) :-
    (indep(s1), consistent(s1, base_material) ; \+indep(s1)).
evidence(all_consistent(base_material)).
query(true_val(base_material, sinterstrong)).
query(true_val(base_material, unk_base_material)).

0.95::acc(s21, base_material_predecessor).
0.88::acc(s22, base_material_predecessor).

% @attr base_material_predecessor
% @type categorical
% @canonical false
% @original_name base_material (predecessor)
% @values sinterspeed=SinterSpeed_Base unk_base_pred=Unknown
% @importance 0.83

0.95::true_val(base_material_predecessor, sinterspeed); 0.05::true_val(base_material_predecessor, unk_base_pred).
measured(s21, base_material_predecessor, sinterspeed).
measured(s22, base_material_predecessor, sinterspeed).
all_consistent(base_material_predecessor) :-
    consistent(s21, base_material_predecessor),
    (indep(s22), consistent(s22, base_material_predecessor) ; \+indep(s22)).
evidence(all_consistent(base_material_predecessor)).
query(true_val(base_material_predecessor, sinterspeed)).
query(true_val(base_material_predecessor, unk_base_pred)).

0.88::acc(s21, sidewall_material).

% @attr sidewall_material
% @type categorical
% @canonical false
% @original_name sidewall_material
% @values twin_flax_walls=Twin_Flax_Walls_predecessor unk_sidewall_material=Unknown
% @importance 0.85

0.81::true_val(sidewall_material, twin_flax_walls); 0.19::true_val(sidewall_material, unk_sidewall_material).
measured(s21, sidewall_material, twin_flax_walls).
all_consistent(sidewall_material) :-
    consistent(s21, sidewall_material).
evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, twin_flax_walls)).
query(true_val(sidewall_material, unk_sidewall_material)).

0.90::acc(s21, predecessor_flax_technology).
0.85::acc(s26, predecessor_flax_technology).

% @attr predecessor_flax_technology
% @type categorical
% @canonical false
% @original_name predecessor Rene-Gade flax technology
% @values flax_plates_and_walls=Flax_Impact_Plates_Twin_Flax_Walls unk_pred_flax=Unknown
% @importance 0.8

0.95::true_val(predecessor_flax_technology, flax_plates_and_walls); 0.05::true_val(predecessor_flax_technology, unk_pred_flax).
measured(s21, predecessor_flax_technology, flax_plates_and_walls).
measured(s26, predecessor_flax_technology, flax_plates_and_walls).
all_consistent(predecessor_flax_technology) :-
    consistent(s21, predecessor_flax_technology),
    (indep(s26), consistent(s26, predecessor_flax_technology) ; \+indep(s26)).
evidence(all_consistent(predecessor_flax_technology)).
query(true_val(predecessor_flax_technology, flax_plates_and_walls)).
query(true_val(predecessor_flax_technology, unk_pred_flax)).

0.88::acc(s1, mounting_pattern).

% @attr mounting_pattern
% @type categorical
% @canonical false
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 0.98

0.71::true_val(mounting_pattern, inserts_2x4); 0.29::true_val(mounting_pattern, unk_mounting_pattern).
measured(s1, mounting_pattern, inserts_2x4).
all_consistent(mounting_pattern) :-
    (indep(s1), consistent(s1, mounting_pattern) ; \+indep(s1)).
evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

0.82::acc(s29, binding_compatibility).

% @attr binding_compatibility
% @type categorical
% @canonical false
% @original_name binding_compatibility
% @values no_burton_est_3d=Not_suitable_Burton_EST_3D unk_binding_compat=Unknown
% @importance 0.7

0.59::true_val(binding_compatibility, no_burton_est_3d); 0.41::true_val(binding_compatibility, unk_binding_compat).
measured(s29, binding_compatibility, no_burton_est_3d).
all_consistent(binding_compatibility) :-
    (indep(s29), consistent(s29, binding_compatibility) ; \+indep(s29)).
evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, no_burton_est_3d)).
query(true_val(binding_compatibility, unk_binding_compat)).

0.88::acc(s1, effective_edge_156).

% @attr effective_edge_156
% @type numeric
% @unit cm
% @canonical false
% @original_name size 156cm — effective edge
% @values v122_0=122.0 unk_ee_156=Unknown
% @importance 0.95

0.71::true_val(effective_edge_156, v122_0); 0.29::true_val(effective_edge_156, unk_ee_156).
measured(s1, effective_edge_156, v122_0).
all_consistent(effective_edge_156) :-
    (indep(s1), consistent(s1, effective_edge_156) ; \+indep(s1)).
evidence(all_consistent(effective_edge_156)).
query(true_val(effective_edge_156, v122_0)).
query(true_val(effective_edge_156, unk_ee_156)).

0.88::acc(s1, waist_width_156).

% @attr waist_width_156
% @type numeric
% @unit cm
% @canonical false
% @original_name size 156cm — waist width
% @values v25_5=25.5 unk_ww_156=Unknown
% @importance 0.95

0.71::true_val(waist_width_156, v25_5); 0.29::true_val(waist_width_156, unk_ww_156).
measured(s1, waist_width_156, v25_5).
all_consistent(waist_width_156) :-
    (indep(s1), consistent(s1, waist_width_156) ; \+indep(s1)).
evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v25_5)).
query(true_val(waist_width_156, unk_ww_156)).

0.88::acc(s1, sidecut_radius_size).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size
% @values v8_2=8.2 unk_sidecut_radius_size=Unknown
% @importance 0.95

0.71::true_val(sidecut_radius_size, v8_2); 0.29::true_val(sidecut_radius_size, unk_sidecut_radius_size).
measured(s1, sidecut_radius_size, v8_2).
all_consistent(sidecut_radius_size) :-
    (indep(s1), consistent(s1, sidecut_radius_size) ; \+indep(s1)).
evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v8_2)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

0.88::acc(s1, stance_width_range_size_156_min).

% @attr stance_width_range_size_156_min
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size (156cm min)
% @values v49_3=49.3 unk_swr_156_min=Unknown
% @importance 0.95

0.71::true_val(stance_width_range_size_156_min, v49_3); 0.29::true_val(stance_width_range_size_156_min, unk_swr_156_min).
measured(s1, stance_width_range_size_156_min, v49_3).
all_consistent(stance_width_range_size_156_min) :-
    (indep(s1), consistent(s1, stance_width_range_size_156_min) ; \+indep(s1)).
evidence(all_consistent(stance_width_range_size_156_min)).
query(true_val(stance_width_range_size_156_min, v49_3)).
query(true_val(stance_width_range_size_156_min, unk_swr_156_min)).

0.88::acc(s1, stance_width_range_size).

% @attr stance_width_range_size
% @type numeric
% @unit cm
% @canonical true
% @original_name stance_width_range_size
% @values v53_3=53.3 unk_stance_width_range_size=Unknown
% @importance 0.95

0.71::true_val(stance_width_range_size, v53_3); 0.29::true_val(stance_width_range_size, unk_stance_width_range_size).
measured(s1, stance_width_range_size, v53_3).
all_consistent(stance_width_range_size) :-
    (indep(s1), consistent(s1, stance_width_range_size) ; \+indep(s1)).
evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v53_3)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

0.88::acc(s1, stance_width_range_size_156_max).

% @attr stance_width_range_size_156_max
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size (156cm max)
% @values v61_3=61.3 unk_swr_156_max=Unknown
% @importance 0.95

0.71::true_val(stance_width_range_size_156_max, v61_3); 0.29::true_val(stance_width_range_size_156_max, unk_swr_156_max).
measured(s1, stance_width_range_size_156_max, v61_3).
all_consistent(stance_width_range_size_156_max) :-
    (indep(s1), consistent(s1, stance_width_range_size_156_max) ; \+indep(s1)).
evidence(all_consistent(stance_width_range_size_156_max)).
query(true_val(stance_width_range_size_156_max, v61_3)).
query(true_val(stance_width_range_size_156_max, unk_swr_156_max)).

0.88::acc(s1, recommended_weight_range_size).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size
% @values kg_65_85=65_85_kg unk_recommended_weight_range_size=Unknown
% @importance 0.95

0.71::true_val(recommended_weight_range_size, kg_65_85); 0.29::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).
measured(s1, recommended_weight_range_size, kg_65_85).
all_consistent(recommended_weight_range_size) :-
    (indep(s1), consistent(s1, recommended_weight_range_size) ; \+indep(s1)).
evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, kg_65_85)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

0.88::acc(s1, effective_edge_157w).

% @attr effective_edge_157w
% @type numeric
% @unit cm
% @canonical false
% @original_name size 157W — effective edge
% @values v122_9=122.9 unk_ee_157w=Unknown
% @importance 0.95

0.71::true_val(effective_edge_157w, v122_9); 0.29::true_val(effective_edge_157w, unk_ee_157w).
measured(s1, effective_edge_157w, v122_9).
all_consistent(effective_edge_157w) :-
    (indep(s1), consistent(s1, effective_edge_157w) ; \+indep(s1)).
evidence(all_consistent(effective_edge_157w)).
query(true_val(effective_edge_157w, v122_9)).
query(true_val(effective_edge_157w, unk_ee_157w)).

0.88::acc(s1, waist_width_157w).

% @attr waist_width_157w
% @type numeric
% @unit cm
% @canonical false
% @original_name size 157W — waist width
% @values v26_6=26.6 unk_ww_157w=Unknown
% @importance 0.95

0.71::true_val(waist_width_157w, v26_6); 0.29::true_val(waist_width_157w, unk_ww_157w).
measured(s1, waist_width_157w, v26_6).
all_consistent(waist_width_157w) :-
    (indep(s1), consistent(s1, waist_width_157w) ; \+indep(s1)).
evidence(all_consistent(waist_width_157w)).
query(true_val(waist_width_157w, v26_6)).
query(true_val(waist_width_157w, unk_ww_157w)).

0.88::acc(s1, sidecut_radius_size_157w).

% @attr sidecut_radius_size_157w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (157W)
% @values v8_3=8.3 unk_scr_157w=Unknown
% @importance 0.95

0.71::true_val(sidecut_radius_size_157w, v8_3); 0.29::true_val(sidecut_radius_size_157w, unk_scr_157w).
measured(s1, sidecut_radius_size_157w, v8_3).
all_consistent(sidecut_radius_size_157w) :-
    (indep(s1), consistent(s1, sidecut_radius_size_157w) ; \+indep(s1)).
evidence(all_consistent(sidecut_radius_size_157w)).
query(true_val(sidecut_radius_size_157w, v8_3)).
query(true_val(sidecut_radius_size_157w, unk_scr_157w)).

0.88::acc(s1, stance_width_range_size_157w_min).

% @attr stance_width_range_size_157w_min
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size (157W min)
% @values v49_3=49.3 unk_swr_157w_min=Unknown
% @importance 0.95

0.71::true_val(stance_width_range_size_157w_min, v49_3); 0.29::true_val(stance_width_range_size_157w_min, unk_swr_157w_min).
measured(s1, stance_width_range_size_157w_min, v49_3).
all_consistent(stance_width_range_size_157w_min) :-
    (indep(s1), consistent(s1, stance_width_range_size_157w_min) ; \+indep(s1)).
evidence(all_consistent(stance_width_range_size_157w_min)).
query(true_val(stance_width_range_size_157w_min, v49_3)).
query(true_val(stance_width_range_size_157w_min, unk_swr_157w_min)).

0.88::acc(s1, stance_width_range_size_157w_ref).

% @attr stance_width_range_size_157w_ref
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size (157W ref)
% @values v53_3=53.3 unk_swr_157w_ref=Unknown
% @importance 0.95

0.71::true_val(stance_width_range_size_157w_ref, v53_3); 0.29::true_val(stance_width_range_size_157w_ref, unk_swr_157w_ref).
measured(s1, stance_width_range_size_157w_ref, v53_3).
all_consistent(stance_width_range_size_157w_ref) :-
    (indep(s1), consistent(s1, stance_width_range_size_157w_ref) ; \+indep(s1)).
evidence(all_consistent(stance_width_range_size_157w_ref)).
query(true_val(stance_width_range_size_157w_ref, v53_3)).
query(true_val(stance_width_range_size_157w_ref, unk_swr_157w_ref)).

0.88::acc(s1, stance_width_range_size_157w_max).

% @attr stance_width_range_size_157w_max
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size (157W max)
% @values v61_3=61.3 unk_swr_157w_max=Unknown
% @importance 0.95

0.71::true_val(stance_width_range_size_157w_max, v61_3); 0.29::true_val(stance_width_range_size_157w_max, unk_swr_157w_max).
measured(s1, stance_width_range_size_157w_max, v61_3).
all_consistent(stance_width_range_size_157w_max) :-
    (indep(s1), consistent(s1, stance_width_range_size_157w_max) ; \+indep(s1)).
evidence(all_consistent(stance_width_range_size_157w_max)).
query(true_val(stance_width_range_size_157w_max, v61_3)).
query(true_val(stance_width_range_size_157w_max, unk_swr_157w_max)).

0.88::acc(s1, recommended_weight_range_size_157w).

% @attr recommended_weight_range_size_157w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (157W)
% @values kg_74_94=74_94_kg unk_rwr_157w=Unknown
% @importance 0.95

0.71::true_val(recommended_weight_range_size_157w, kg_74_94); 0.29::true_val(recommended_weight_range_size_157w, unk_rwr_157w).
measured(s1, recommended_weight_range_size_157w, kg_74_94).
all_consistent(recommended_weight_range_size_157w) :-
    (indep(s1), consistent(s1, recommended_weight_range_size_157w) ; \+indep(s1)).
evidence(all_consistent(recommended_weight_range_size_157w)).
query(true_val(recommended_weight_range_size_157w, kg_74_94)).
query(true_val(recommended_weight_range_size_157w, unk_rwr_157w)).

0.88::acc(s1, effective_edge_159).

% @attr effective_edge_159
% @type numeric
% @unit cm
% @canonical false
% @original_name size 159cm — effective edge
% @values v124_7=124.7 unk_ee_159=Unknown
% @importance 0.95

0.71::true_val(effective_edge_159, v124_7); 0.29::true_val(effective_edge_159, unk_ee_159).
measured(s1, effective_edge_159, v124_7).
all_consistent(effective_edge_159) :-
    (indep(s1), consistent(s1, effective_edge_159) ; \+indep(s1)).
evidence(all_consistent(effective_edge_159)).
query(true_val(effective_edge_159, v124_7)).
query(true_val(effective_edge_159, unk_ee_159)).

0.88::acc(s1, waist_width_159).

% @attr waist_width_159
% @type numeric
% @unit cm
% @canonical false
% @original_name size 159cm — waist width
% @values v25_7=25.7 unk_ww_159=Unknown
% @importance 0.95

0.71::true_val(waist_width_159, v25_7); 0.29::true_val(waist_width_159, unk_ww_159).
measured(s1, waist_width_159, v25_7).
all_consistent(waist_width_159) :-
    (indep(s1), consistent(s1, waist_width_159) ; \+indep(s1)).
evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v25_7)).
query(true_val(waist_width_159, unk_ww_159)).

0.88::acc(s1, sidecut_radius_size_159).

% @attr sidecut_radius_size_159
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (159)
% @values v8_4=8.4 unk_scr_159=Unknown
% @importance 0.95

0.71::true_val(sidecut_radius_size_159, v8_4); 0.29::true_val(sidecut_radius_size_159, unk_scr_159).
measured(s1, sidecut_radius_size_159, v8_4).
all_consistent(sidecut_radius_size_159) :-
    (indep(s1), consistent(s1, sidecut_radius_size_159) ; \+indep(s1)).
evidence(all_consistent(sidecut_radius_size_159)).
query(true_val(sidecut_radius_size_159, v8_4)).
query(true_val(sidecut_radius_size_159, unk_scr_159)).

0.88::acc(s1, stance_width_range_size_159_min).

% @attr stance_width_range_size_159_min
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size (159 min)
% @values v51_9=51.9 unk_swr_159_min=Unknown
% @importance 0.95

0.71::true_val(stance_width_range_size_159_min, v51_9); 0.29::true_val(stance_width_range_size_159_min, unk_swr_159_min).
measured(s1, stance_width_range_size_159_min, v51_9).
all_consistent(stance_width_range_size_159_min) :-
    (indep(s1), consistent(s1, stance_width_range_size_159_min) ; \+indep(s1)).
evidence(all_consistent(stance_width_range_size_159_min)).
query(true_val(stance_width_range_size_159_min, v51_9)).
query(true_val(stance_width_range_size_159_min, unk_swr_159_min)).

0.88::acc(s1, stance_width_range_size_159_ref).

% @attr stance_width_range_size_159_ref
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size (159 ref)
% @values v55_9=55.9 unk_swr_159_ref=Unknown
% @importance 0.95

0.71::true_val(stance_width_range_size_159_ref, v55_9); 0.29::true_val(stance_width_range_size_159_ref, unk_swr_159_ref).
measured(s1, stance_width_range_size_159_ref, v55_9).
all_consistent(stance_width_range_size_159_ref) :-
    (indep(s1), consistent(s1, stance_width_range_size_159_ref) ; \+indep(s1)).
evidence(all_consistent(stance_width_range_size_159_ref)).
query(true_val(stance_width_range_size_159_ref, v55_9)).
query(true_val(stance_width_range_size_159_ref, unk_swr_159_ref)).

0.88::acc(s1, stance_width_range_size_159_max).

% @attr stance_width_range_size_159_max
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size (159 max)
% @values v63_9=63.9 unk_swr_159_max=Unknown
% @importance 0.95

0.71::true_val(stance_width_range_size_159_max, v63_9); 0.29::true_val(stance_width_range_size_159_max, unk_swr_159_max).
measured(s1, stance_width_range_size_159_max, v63_9).
all_consistent(stance_width_range_size_159_max) :-
    (indep(s1), consistent(s1, stance_width_range_size_159_max) ; \+indep(s1)).
evidence(all_consistent(stance_width_range_size_159_max)).
query(true_val(stance_width_range_size_159_max, v63_9)).
query(true_val(stance_width_range_size_159_max, unk_swr_159_max)).

0.88::acc(s1, recommended_weight_range_size_159).

% @attr recommended_weight_range_size_159
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (159)
% @values kg_71_91=71_91_kg unk_rwr_159=Unknown
% @importance 0.95

0.71::true_val(recommended_weight_range_size_159, kg_71_91); 0.29::true_val(recommended_weight_range_size_159, unk_rwr_159).
measured(s1, recommended_weight_range_size_159, kg_71_91).
all_consistent(recommended_weight_range_size_159) :-
    (indep(s1), consistent(s1, recommended_weight_range_size_159) ; \+indep(s1)).
evidence(all_consistent(recommended_weight_range_size_159)).
query(true_val(recommended_weight_range_size_159, kg_71_91)).
query(true_val(recommended_weight_range_size_159, unk_rwr_159)).

0.88::acc(s1, width_options).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 1.0

0.71::true_val(width_options, standard_and_wide); 0.29::true_val(width_options, unk_width_options).
measured(s1, width_options, standard_and_wide).
all_consistent(width_options) :-
    (indep(s1), consistent(s1, width_options) ; \+indep(s1)).
evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

0.80::acc(s25, predecessor_waist_widths).

% @attr predecessor_waist_widths
% @type categorical
% @unit mm
% @canonical false
% @original_name predecessor waist widths
% @values range_253_267=253_267mm unk_pred_ww=Unknown
% @importance 0.7

0.60::true_val(predecessor_waist_widths, range_253_267); 0.40::true_val(predecessor_waist_widths, unk_pred_ww).
measured(s25, predecessor_waist_widths, range_253_267).
all_consistent(predecessor_waist_widths) :-
    (indep(s25), consistent(s25, predecessor_waist_widths) ; \+indep(s25)).
evidence(all_consistent(predecessor_waist_widths)).
query(true_val(predecessor_waist_widths, range_253_267)).
query(true_val(predecessor_waist_widths, unk_pred_ww)).

0.80::acc(s25, predecessor_effective_edge_range).

% @attr predecessor_effective_edge_range
% @type categorical
% @unit mm
% @canonical false
% @original_name predecessor effective edge range
% @values range_1193_1255=1193_1255mm unk_pred_ee=Unknown
% @importance 0.7

0.60::true_val(predecessor_effective_edge_range, range_1193_1255); 0.40::true_val(predecessor_effective_edge_range, unk_pred_ee).
measured(s25, predecessor_effective_edge_range, range_1193_1255).
all_consistent(predecessor_effective_edge_range) :-
    (indep(s25), consistent(s25, predecessor_effective_edge_range) ; \+indep(s25)).
evidence(all_consistent(predecessor_effective_edge_range)).
query(true_val(predecessor_effective_edge_range, range_1193_1255)).
query(true_val(predecessor_effective_edge_range, unk_pred_ee)).

0.80::acc(s25, recommended_weight_range_size_pred_153).

% @attr recommended_weight_range_size_pred_153
% @type categorical
% @unit lbs
% @canonical false
% @original_name recommended_weight_range_size (predecessor 153)
% @values lbs_118_158=118_158_lbs unk_rwr_pred_153=Unknown
% @importance 0.7

0.60::true_val(recommended_weight_range_size_pred_153, lbs_118_158); 0.40::true_val(recommended_weight_range_size_pred_153, unk_rwr_pred_153).
measured(s25, recommended_weight_range_size_pred_153, lbs_118_158).
all_consistent(recommended_weight_range_size_pred_153) :-
    (indep(s25), consistent(s25, recommended_weight_range_size_pred_153) ; \+indep(s25)).
evidence(all_consistent(recommended_weight_range_size_pred_153)).
query(true_val(recommended_weight_range_size_pred_153, lbs_118_158)).
query(true_val(recommended_weight_range_size_pred_153, unk_rwr_pred_153)).

0.80::acc(s25, recommended_weight_range_size_pred_159).

% @attr recommended_weight_range_size_pred_159
% @type categorical
% @unit lbs
% @canonical false
% @original_name recommended_weight_range_size (predecessor 159)
% @values lbs_160_200=160_200_plus_lbs unk_rwr_pred_159=Unknown
% @importance 0.7

0.60::true_val(recommended_weight_range_size_pred_159, lbs_160_200); 0.40::true_val(recommended_weight_range_size_pred_159, unk_rwr_pred_159).
measured(s25, recommended_weight_range_size_pred_159, lbs_160_200).
all_consistent(recommended_weight_range_size_pred_159) :-
    (indep(s25), consistent(s25, recommended_weight_range_size_pred_159) ; \+indep(s25)).
evidence(all_consistent(recommended_weight_range_size_pred_159)).
query(true_val(recommended_weight_range_size_pred_159, lbs_160_200)).
query(true_val(recommended_weight_range_size_pred_159, unk_rwr_pred_159)).

0.93::acc(s30, warranty_period_years).
0.93::acc(s31, warranty_period_years).
0.88::acc(s32, warranty_period_years).

% @attr warranty_period_years
% @type categorical
% @unit years
% @canonical true
% @original_name warranty_period_years
% @values two_plus_one=2_plus_1_years three_years=3_years
% @importance 0.75

0.55::true_val(warranty_period_years, two_plus_one); 0.45::true_val(warranty_period_years, three_years).
measured(s30, warranty_period_years, two_plus_one).
measured(s31, warranty_period_years, two_plus_one).
measured(s32, warranty_period_years, three_years).
all_consistent(warranty_period_years) :-
    consistent(s30, warranty_period_years),
    consistent(s31, warranty_period_years),
    consistent(s32, warranty_period_years).
evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, two_plus_one)).
query(true_val(warranty_period_years, three_years)).

0.93::acc(s30, warranty_coverage).

% @attr warranty_coverage
% @type categorical
% @canonical false
% @original_name warranty
% @values delam_inserts_topsheet=Delamination_inserts_topsheet unk_warranty_coverage=Unknown
% @importance 0.8

0.90::true_val(warranty_coverage, delam_inserts_topsheet); 0.10::true_val(warranty_coverage, unk_warranty_coverage).
measured(s30, warranty_coverage, delam_inserts_topsheet).
all_consistent(warranty_coverage) :-
    consistent(s30, warranty_coverage).
evidence(all_consistent(warranty_coverage)).
query(true_val(warranty_coverage, delam_inserts_topsheet)).
query(true_val(warranty_coverage, unk_warranty_coverage)).

0.93::acc(s31, return_policy_terms).

% @attr return_policy_terms
% @type categorical
% @canonical false
% @original_name return_policy_terms
% @values days_45=45_day_return unk_return_policy=Unknown
% @importance 0.75

0.90::true_val(return_policy_terms, days_45); 0.10::true_val(return_policy_terms, unk_return_policy).
measured(s31, return_policy_terms, days_45).
all_consistent(return_policy_terms) :-
    consistent(s31, return_policy_terms).
evidence(all_consistent(return_policy_terms)).
query(true_val(return_policy_terms, days_45)).
query(true_val(return_policy_terms, unk_return_policy)).

0.88::acc(s1, skill_level_recommendation).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values intermediate_advanced=Intermediate_Advanced unk_skill_level=Unknown
% @importance 1.0

0.71::true_val(skill_level_recommendation, intermediate_advanced); 0.29::true_val(skill_level_recommendation, unk_skill_level).
measured(s1, skill_level_recommendation, intermediate_advanced).
all_consistent(skill_level_recommendation) :-
    (indep(s1), consistent(s1, skill_level_recommendation) ; \+indep(s1)).
evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, intermediate_advanced)).
query(true_val(skill_level_recommendation, unk_skill_level)).

0.88::acc(s1, terrain_suitability).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values all_mtn_freestyle_park=All_Mountain_Freestyle_Park unk_terrain_suitability=Unknown
% @importance 1.0

0.71::true_val(terrain_suitability, all_mtn_freestyle_park); 0.29::true_val(terrain_suitability, unk_terrain_suitability).
measured(s1, terrain_suitability, all_mtn_freestyle_park).
all_consistent(terrain_suitability) :-
    (indep(s1), consistent(s1, terrain_suitability) ; \+indep(s1)).
evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, all_mtn_freestyle_park)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

0.88::acc(s1, riding_style).

% @attr riding_style
% @type categorical
% @canonical false
% @original_name riding_style
% @values freestyle_all_mountain=Freestyle_All_Mountain unk_riding_style=Unknown
% @importance 1.0

0.71::true_val(riding_style, freestyle_all_mountain); 0.29::true_val(riding_style, unk_riding_style).
measured(s1, riding_style, freestyle_all_mountain).
all_consistent(riding_style) :-
    (indep(s1), consistent(s1, riding_style) ; \+indep(s1)).
evidence(all_consistent(riding_style)).
query(true_val(riding_style, freestyle_all_mountain)).
query(true_val(riding_style, unk_riding_style)).

0.85::acc(s1, terrain_suitability_rating_1).

% @attr terrain_suitability_rating_1
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability (rating 8/10)
% @values v8=8.0 unk_tsr1=Unknown
% @importance 1.0

0.71::true_val(terrain_suitability_rating_1, v8); 0.29::true_val(terrain_suitability_rating_1, unk_tsr1).
measured(s1, terrain_suitability_rating_1, v8).
all_consistent(terrain_suitability_rating_1) :-
    (indep(s1), consistent(s1, terrain_suitability_rating_1) ; \+indep(s1)).
evidence(all_consistent(terrain_suitability_rating_1)).
query(true_val(terrain_suitability_rating_1, v8)).
query(true_val(terrain_suitability_rating_1, unk_tsr1)).

0.85::acc(s1, terrain_suitability_rating_2).

% @attr terrain_suitability_rating_2
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability (rating 5/10)
% @values v5=5.0 unk_tsr2=Unknown
% @importance 1.0

0.71::true_val(terrain_suitability_rating_2, v5); 0.29::true_val(terrain_suitability_rating_2, unk_tsr2).
measured(s1, terrain_suitability_rating_2, v5).
all_consistent(terrain_suitability_rating_2) :-
    (indep(s1), consistent(s1, terrain_suitability_rating_2) ; \+indep(s1)).
evidence(all_consistent(terrain_suitability_rating_2)).
query(true_val(terrain_suitability_rating_2, v5)).
query(true_val(terrain_suitability_rating_2, unk_tsr2)).

0.85::acc(s1, terrain_suitability_rating_3).

% @attr terrain_suitability_rating_3
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability (rating 6/10)
% @values v6=6.0 unk_tsr3=Unknown
% @importance 1.0

0.71::true_val(terrain_suitability_rating_3, v6); 0.29::true_val(terrain_suitability_rating_3, unk_tsr3).
measured(s1, terrain_suitability_rating_3, v6).
all_consistent(terrain_suitability_rating_3) :-
    (indep(s1), consistent(s1, terrain_suitability_rating_3) ; \+indep(s1)).
evidence(all_consistent(terrain_suitability_rating_3)).
query(true_val(terrain_suitability_rating_3, v6)).
query(true_val(terrain_suitability_rating_3, unk_tsr3)).

0.85::acc(s33, skill_level_recommendation_predecessor).

% @attr skill_level_recommendation_predecessor
% @type categorical
% @canonical false
% @original_name skill_level_recommendation (predecessor)
% @values advanced_expert=Advanced_Expert unk_skill_pred=Unknown
% @importance 0.85

0.68::true_val(skill_level_recommendation_predecessor, advanced_expert); 0.32::true_val(skill_level_recommendation_predecessor, unk_skill_pred).
measured(s33, skill_level_recommendation_predecessor, advanced_expert).
all_consistent(skill_level_recommendation_predecessor) :-
    consistent(s33, skill_level_recommendation_predecessor).
evidence(all_consistent(skill_level_recommendation_predecessor)).
query(true_val(skill_level_recommendation_predecessor, advanced_expert)).
query(true_val(skill_level_recommendation_predecessor, unk_skill_pred)).

0.85::acc(s33, predecessor_ideal_use).

% @attr predecessor_ideal_use
% @type categorical
% @canonical false
% @original_name predecessor Rene-Gade ideal use (evo review)
% @values expert_high_speed_freestyle=Expert_high_speed_freestyle unk_pred_ideal=Unknown
% @importance 0.85

0.68::true_val(predecessor_ideal_use, expert_high_speed_freestyle); 0.32::true_val(predecessor_ideal_use, unk_pred_ideal).
measured(s33, predecessor_ideal_use, expert_high_speed_freestyle).
all_consistent(predecessor_ideal_use) :-
    consistent(s33, predecessor_ideal_use).
evidence(all_consistent(predecessor_ideal_use)).
query(true_val(predecessor_ideal_use, expert_high_speed_freestyle)).
query(true_val(predecessor_ideal_use, unk_pred_ideal)).

0.85::acc(s19, pop_performance).

% @attr pop_performance
% @type categorical
% @canonical false
% @original_name pop
% @values excellent=Pop_machine_excellent unk_pop=Unknown
% @importance 0.8

0.72::true_val(pop_performance, excellent); 0.28::true_val(pop_performance, unk_pop).
measured(s19, pop_performance, excellent).
all_consistent(pop_performance) :-
    consistent(s19, pop_performance).
evidence(all_consistent(pop_performance)).
query(true_val(pop_performance, excellent)).
query(true_val(pop_performance, unk_pop)).

0.78::acc(s34, high_speed_stability).

% @attr high_speed_stability
% @type categorical
% @canonical false
% @original_name high-speed stability
% @values very_stable=Very_stable_at_high_speed unk_hss=Unknown
% @importance 0.8

0.47::true_val(high_speed_stability, very_stable); 0.53::true_val(high_speed_stability, unk_hss).
measured(s34, high_speed_stability, very_stable).
all_consistent(high_speed_stability) :-
    consistent(s34, high_speed_stability).
evidence(all_consistent(high_speed_stability)).
query(true_val(high_speed_stability, very_stable)).
query(true_val(high_speed_stability, unk_hss)).

0.85::acc(s33, edge_hold).

% @attr edge_hold
% @type categorical
% @canonical false
% @original_name edge_hold
% @values consistent_damp=Consistently_holds_edge_damp unk_edge_hold=Unknown
% @importance 0.85

0.68::true_val(edge_hold, consistent_damp); 0.32::true_val(edge_hold, unk_edge_hold).
measured(s33, edge_hold, consistent_damp).
all_consistent(edge_hold) :-
    consistent(s33, edge_hold).
evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, consistent_damp)).
query(true_val(edge_hold, unk_edge_hold)).

0.82::acc(s35, carving_performance).

% @attr carving_performance
% @type categorical
% @canonical false
% @original_name carving performance
% @values solid_aggressive=Real_solid_carver unk_carving=Unknown
% @importance 0.85

0.60::true_val(carving_performance, solid_aggressive); 0.40::true_val(carving_performance, unk_carving).
measured(s35, carving_performance, solid_aggressive).
all_consistent(carving_performance) :-
    consistent(s35, carving_performance).
evidence(all_consistent(carving_performance)).
query(true_val(carving_performance, solid_aggressive)).
query(true_val(carving_performance, unk_carving)).

0.82::acc(s35, jumping_performance).

% @attr jumping_performance
% @type categorical
% @canonical false
% @original_name jumping performance
% @values beauty_favorite=Beauty_for_jumping_one_of_favorites unk_jumping=Unknown
% @importance 0.85

0.60::true_val(jumping_performance, beauty_favorite); 0.40::true_val(jumping_performance, unk_jumping).
measured(s35, jumping_performance, beauty_favorite).
all_consistent(jumping_performance) :-
    consistent(s35, jumping_performance).
evidence(all_consistent(jumping_performance)).
query(true_val(jumping_performance, beauty_favorite)).
query(true_val(jumping_performance, unk_jumping)).

0.82::acc(s35, landing_confidence).

% @attr landing_confidence
% @type categorical
% @canonical false
% @original_name landing confidence
% @values stomp_confident=Stomp_landings_confidence unk_landing=Unknown
% @importance 0.85

0.60::true_val(landing_confidence, stomp_confident); 0.40::true_val(landing_confidence, unk_landing).
measured(s35, landing_confidence, stomp_confident).
all_consistent(landing_confidence) :-
    consistent(s35, landing_confidence).
evidence(all_consistent(landing_confidence)).
query(true_val(landing_confidence, stomp_confident)).
query(true_val(landing_confidence, unk_landing)).

0.85::acc(s19, pipe_performance).

% @attr pipe_performance
% @type categorical
% @canonical false
% @original_name pipe performance
% @values beast=Beast_in_pipe unk_pipe=Unknown
% @importance 0.8

0.72::true_val(pipe_performance, beast); 0.28::true_val(pipe_performance, unk_pipe).
measured(s19, pipe_performance, beast).
all_consistent(pipe_performance) :-
    consistent(s19, pipe_performance).
evidence(all_consistent(pipe_performance)).
query(true_val(pipe_performance, beast)).
query(true_val(pipe_performance, unk_pipe)).

0.85::acc(s19, torsional_play).

% @attr torsional_play
% @type categorical
% @canonical false
% @original_name torsional play
% @values stiff_lateral_play_torsional=Super_stiff_lateral_torsional_play unk_torsion=Unknown
% @importance 0.8

0.72::true_val(torsional_play, stiff_lateral_play_torsional); 0.28::true_val(torsional_play, unk_torsion).
measured(s19, torsional_play, stiff_lateral_play_torsional).
all_consistent(torsional_play) :-
    consistent(s19, torsional_play).
evidence(all_consistent(torsional_play)).
query(true_val(torsional_play, stiff_lateral_play_torsional)).
query(true_val(torsional_play, unk_torsion)).

0.75::acc(s34, user_review_forum).

% @attr user_review_forum
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values everywhere_all_conditions=Use_everywhere_all_conditions unk_user_review=Unknown
% @importance 0.8

0.47::true_val(user_review_forum, everywhere_all_conditions); 0.53::true_val(user_review_forum, unk_user_review).
measured(s34, user_review_forum, everywhere_all_conditions).
all_consistent(user_review_forum) :-
    consistent(s34, user_review_forum).
evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, everywhere_all_conditions)).
query(true_val(user_review_forum, unk_user_review)).

0.82::acc(s35, switch_riding).

% @attr switch_riding
% @type categorical
% @canonical false
% @original_name switch_riding
% @values rides_fine_switch=Rides_switch_fine_similar unk_switch=Unknown
% @importance 0.85

0.60::true_val(switch_riding, rides_fine_switch); 0.40::true_val(switch_riding, unk_switch).
measured(s35, switch_riding, rides_fine_switch).
all_consistent(switch_riding) :-
    consistent(s35, switch_riding).
evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, rides_fine_switch)).
query(true_val(switch_riding, unk_switch)).

0.85::acc(s33, negative_aspect).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values not_playful_slow_speed=Not_playful_slow_speeds_stiff unk_negative_aspect=Unknown
% @importance 0.85

0.68::true_val(negative_aspect, not_playful_slow_speed); 0.32::true_val(negative_aspect, unk_negative_aspect).
measured(s33, negative_aspect, not_playful_slow_speed).
all_consistent(negative_aspect) :-
    consistent(s33, negative_aspect).
evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, not_playful_slow_speed)).
query(true_val(negative_aspect, unk_negative_aspect)).

0.85::acc(s20, negative_aspect_powder).
0.85::acc(s19, negative_aspect_powder).

% @attr negative_aspect_powder
% @type categorical
% @canonical false
% @original_name negative_aspect (powder)
% @values poor_powder=Last_board_for_powder unk_neg_powder=Unknown
% @importance 0.83

0.95::true_val(negative_aspect_powder, poor_powder); 0.05::true_val(negative_aspect_powder, unk_neg_powder).
measured(s20, negative_aspect_powder, poor_powder).
measured(s19, negative_aspect_powder, poor_powder).
all_consistent(negative_aspect_powder) :-
    consistent(s20, negative_aspect_powder),
    consistent(s19, negative_aspect_powder).
evidence(all_consistent(negative_aspect_powder)).
query(true_val(negative_aspect_powder, poor_powder)).
query(true_val(negative_aspect_powder, unk_neg_powder)).

0.78::acc(s34, negative_aspect_ruddering).

% @attr negative_aspect_ruddering
% @type categorical
% @canonical false
% @original_name negative_aspect (ruddering)
% @values difficult_rudder=Difficult_to_rudder_for_speed_control unk_neg_rudder=Unknown
% @importance 0.8

0.47::true_val(negative_aspect_ruddering, difficult_rudder); 0.53::true_val(negative_aspect_ruddering, unk_neg_rudder).
measured(s34, negative_aspect_ruddering, difficult_rudder).
all_consistent(negative_aspect_ruddering) :-
    consistent(s34, negative_aspect_ruddering).
evidence(all_consistent(negative_aspect_ruddering)).
query(true_val(negative_aspect_ruddering, difficult_rudder)).
query(true_val(negative_aspect_ruddering, unk_neg_rudder)).

0.82::acc(s35, negative_aspect_catchy_tail).

% @attr negative_aspect_catchy_tail
% @type categorical
% @canonical false
% @original_name negative_aspect (catchy tail)
% @values catchy_tail_slow=Tail_catchy_at_slow_speeds unk_neg_tail=Unknown
% @importance 0.85

0.60::true_val(negative_aspect_catchy_tail, catchy_tail_slow); 0.40::true_val(negative_aspect_catchy_tail, unk_neg_tail).
measured(s35, negative_aspect_catchy_tail, catchy_tail_slow).
all_consistent(negative_aspect_catchy_tail) :-
    consistent(s35, negative_aspect_catchy_tail).
evidence(all_consistent(negative_aspect_catchy_tail)).
query(true_val(negative_aspect_catchy_tail, catchy_tail_slow)).
query(true_val(negative_aspect_catchy_tail, unk_neg_tail)).

0.75::acc(s36, negative_aspect_topsheet).

% @attr negative_aspect_topsheet
% @type categorical
% @canonical false
% @original_name negative_aspect (topsheet durability)
% @values topsheet_wrinkle_bubble=Topsheet_wrinkled_bubbled_warranty_claims unk_neg_topsheet=Unknown
% @importance 0.8

0.41::true_val(negative_aspect_topsheet, topsheet_wrinkle_bubble); 0.59::true_val(negative_aspect_topsheet, unk_neg_topsheet).
measured(s36, negative_aspect_topsheet, topsheet_wrinkle_bubble).
all_consistent(negative_aspect_topsheet) :-
    consistent(s36, negative_aspect_topsheet).
evidence(all_consistent(negative_aspect_topsheet)).
query(true_val(negative_aspect_topsheet, topsheet_wrinkle_bubble)).
query(true_val(negative_aspect_topsheet, unk_neg_topsheet)).

0.82::acc(s20, weight_impression).

% @attr weight_impression
% @type categorical
% @canonical false
% @original_name weight
% @values touch_heavy=Touch_heavy_but_not_worrying unk_weight=Unknown
% @importance 0.85

0.68::true_val(weight_impression, touch_heavy); 0.32::true_val(weight_impression, unk_weight).
measured(s20, weight_impression, touch_heavy).
all_consistent(weight_impression) :-
    consistent(s20, weight_impression).
evidence(all_consistent(weight_impression)).
query(true_val(weight_impression, touch_heavy)).
query(true_val(weight_impression, unk_weight)).

0.85::acc(s19, negative_aspect_skill_barrier).

% @attr negative_aspect_skill_barrier
% @type categorical
% @canonical false
% @original_name negative_aspect (skill barrier)
% @values long_list_not_up_to_task=Many_riders_not_up_to_task unk_neg_skill=Unknown
% @importance 0.8

0.72::true_val(negative_aspect_skill_barrier, long_list_not_up_to_task); 0.28::true_val(negative_aspect_skill_barrier, unk_neg_skill).
measured(s19, negative_aspect_skill_barrier, long_list_not_up_to_task).
all_consistent(negative_aspect_skill_barrier) :-
    consistent(s19, negative_aspect_skill_barrier).
evidence(all_consistent(negative_aspect_skill_barrier)).
query(true_val(negative_aspect_skill_barrier, long_list_not_up_to_task)).
query(true_val(negative_aspect_skill_barrier, unk_neg_skill)).

0.90::acc(s1, camber_change).
0.93::acc(s21, camber_change).

% @attr camber_change
% @type categorical
% @canonical false
% @original_name camber change
% @values stay_pos_to_fusion=Stay_Positive_to_Fusion_Camber unk_camber_change=Unknown
% @importance 0.93

0.95::true_val(camber_change, stay_pos_to_fusion); 0.05::true_val(camber_change, unk_camber_change).
measured(s1, camber_change, stay_pos_to_fusion).
measured(s21, camber_change, stay_pos_to_fusion).
all_consistent(camber_change) :-
    (indep(s1), consistent(s1, camber_change) ; \+indep(s1)),
    consistent(s21, camber_change).
evidence(all_consistent(camber_change)).
query(true_val(camber_change, stay_pos_to_fusion)).
query(true_val(camber_change, unk_camber_change)).

0.90::acc(s1, flex_change).
0.80::acc(s23, flex_change).
0.70::acc(s24, flex_change).

% @attr flex_change
% @type categorical
% @canonical false
% @original_name flex change
% @values from_8_9_to_7=From_8_9_to_7_out_of_10 unk_flex_change=Unknown
% @importance 0.85

0.95::true_val(flex_change, from_8_9_to_7); 0.05::true_val(flex_change, unk_flex_change).
measured(s1, flex_change, from_8_9_to_7).
measured(s23, flex_change, from_8_9_to_7).
measured(s24, flex_change, from_8_9_to_7).
all_consistent(flex_change) :-
    (indep(s1), consistent(s1, flex_change) ; \+indep(s1)),
    (indep(s23), consistent(s23, flex_change) ; \+indep(s23)),
    (indep(s24), consistent(s24, flex_change) ; \+indep(s24)).
evidence(all_consistent(flex_change)).
query(true_val(flex_change, from_8_9_to_7)).
query(true_val(flex_change, unk_flex_change)).

0.90::acc(s1, core_change).
0.88::acc(s26, core_change).
0.93::acc(s28, core_change).

% @attr core_change
% @type categorical
% @canonical false
% @original_name core change
% @values superpop_to_pop=SuperPop_to_Pop_Core unk_core_change=Unknown
% @importance 0.87

0.95::true_val(core_change, superpop_to_pop); 0.05::true_val(core_change, unk_core_change).
measured(s1, core_change, superpop_to_pop).
measured(s26, core_change, superpop_to_pop).
measured(s28, core_change, superpop_to_pop).
all_consistent(core_change) :-
    (indep(s1), consistent(s1, core_change) ; \+indep(s1)),
    (indep(s26), consistent(s26, core_change) ; \+indep(s26)),
    consistent(s28, core_change).
evidence(all_consistent(core_change)).
query(true_val(core_change, superpop_to_pop)).
query(true_val(core_change, unk_core_change)).

0.90::acc(s1, hotrod_material_change).
0.93::acc(s21, hotrod_material_change).

% @attr hotrod_material_change
% @type categorical
% @canonical false
% @original_name HotRod material change
% @values carbon_to_bamboo=Carbon_Omega_to_Bamboo_Omega unk_hotrod_change=Unknown
% @importance 0.93

0.95::true_val(hotrod_material_change, carbon_to_bamboo); 0.05::true_val(hotrod_material_change, unk_hotrod_change).
measured(s1, hotrod_material_change, carbon_to_bamboo).
measured(s21, hotrod_material_change, carbon_to_bamboo).
all_consistent(hotrod_material_change) :-
    (indep(s1), consistent(s1, hotrod_material_change) ; \+indep(s1)),
    consistent(s21, hotrod_material_change).
evidence(all_consistent(hotrod_material_change)).
query(true_val(hotrod_material_change, carbon_to_bamboo)).
query(true_val(hotrod_material_change, unk_hotrod_change)).

0.90::acc(s1, base_change).
0.93::acc(s21, base_change).

% @attr base_change
% @type categorical
% @canonical false
% @original_name base change
% @values sinterspeed_to_sinterstrong=SinterSpeed_to_SinterStrong unk_base_change=Unknown
% @importance 0.93

0.95::true_val(base_change, sinterspeed_to_sinterstrong); 0.05::true_val(base_change, unk_base_change).
measured(s1, base_change, sinterspeed_to_sinterstrong).
measured(s21, base_change, sinterspeed_to_sinterstrong).
all_consistent(base_change) :-
    (indep(s1), consistent(s1, base_change) ; \+indep(s1)),
    consistent(s21, base_change).
evidence(all_consistent(base_change)).
query(true_val(base_change, sinterspeed_to_sinterstrong)).
query(true_val(base_change, unk_base_change)).

0.90::acc(s1, three_d_shape_addition).

% @attr three_d_shape_addition
% @type categorical
% @canonical false
% @original_name 3D shape addition
% @values new_dir_diamond_3d=Directional_Diamond_3D_new_for_Rene unk_3d_add=Unknown
% @importance 1.0

0.71::true_val(three_d_shape_addition, new_dir_diamond_3d); 0.29::true_val(three_d_shape_addition, unk_3d_add).
measured(s1, three_d_shape_addition, new_dir_diamond_3d).
all_consistent(three_d_shape_addition) :-
    (indep(s1), consistent(s1, three_d_shape_addition) ; \+indep(s1)).
evidence(all_consistent(three_d_shape_addition)).
query(true_val(three_d_shape_addition, new_dir_diamond_3d)).
query(true_val(three_d_shape_addition, unk_3d_add)).

0.90::acc(s1, tail_design_addition).

% @attr tail_design_addition
% @type categorical
% @canonical false
% @original_name tail design addition
% @values new_tail_double_kick=Tail_Double_Kick_new unk_tail_add=Unknown
% @importance 1.0

0.71::true_val(tail_design_addition, new_tail_double_kick); 0.29::true_val(tail_design_addition, unk_tail_add).
measured(s1, tail_design_addition, new_tail_double_kick).
all_consistent(tail_design_addition) :-
    (indep(s1), consistent(s1, tail_design_addition) ; \+indep(s1)).
evidence(all_consistent(tail_design_addition)).
query(true_val(tail_design_addition, new_tail_double_kick)).
query(true_val(tail_design_addition, unk_tail_add)).

0.88::acc(s1, net_positioning).

% @attr net_positioning
% @type categorical
% @canonical false
% @original_name net positioning
% @values softer_more_approachable=Softer_more_approachable_than_predecessor unk_net_pos=Unknown
% @importance 0.98

0.71::true_val(net_positioning, softer_more_approachable); 0.29::true_val(net_positioning, unk_net_pos).
measured(s1, net_positioning, softer_more_approachable).
all_consistent(net_positioning) :-
    (indep(s1), consistent(s1, net_positioning) ; \+indep(s1)).
evidence(all_consistent(net_positioning)).
query(true_val(net_positioning, softer_more_approachable)).
query(true_val(net_positioning, unk_net_pos)).

0.80::acc(s16, milosport_reputation).

% @attr milosport_reputation
% @type categorical
% @canonical false
% @original_name Milosport reputation
% @values established_specialty_slc=Established_specialty_shop_SLC unk_milo_rep=Unknown
% @importance 0.95

0.76::true_val(milosport_reputation, established_specialty_slc); 0.24::true_val(milosport_reputation, unk_milo_rep).
measured(s16, milosport_reputation, established_specialty_slc).
all_consistent(milosport_reputation) :-
    (indep(s16), consistent(s16, milosport_reputation) ; \+indep(s16)).
evidence(all_consistent(milosport_reputation)).
query(true_val(milosport_reputation, established_specialty_slc)).
query(true_val(milosport_reputation, unk_milo_rep)).

0.85::acc(s1, ballistyx_reputation).

% @attr ballistyx_reputation
% @type categorical
% @canonical false
% @original_name Ballistyx reputation
% @values melbourne_33_years=Melbourne_based_33_plus_years unk_ball_rep=Unknown
% @importance 1.0

0.71::true_val(ballistyx_reputation, melbourne_33_years); 0.29::true_val(ballistyx_reputation, unk_ball_rep).
measured(s1, ballistyx_reputation, melbourne_33_years).
all_consistent(ballistyx_reputation) :-
    (indep(s1), consistent(s1, ballistyx_reputation) ; \+indep(s1)).
evidence(all_consistent(ballistyx_reputation)).
query(true_val(ballistyx_reputation, melbourne_33_years)).
query(true_val(ballistyx_reputation, unk_ball_rep)).

0.65::acc(s37, comparable_board_cross_brand).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values dt_alternatives=Indoor_Survival_Shadowban_Nitro_Team_Yes_Typo_Frontier unk_comp_cross=Unknown
% @importance 0.65

0.28::true_val(comparable_board_cross_brand, dt_alternatives); 0.72::true_val(comparable_board_cross_brand, unk_comp_cross).
measured(s37, comparable_board_cross_brand, dt_alternatives).
all_consistent(comparable_board_cross_brand) :-
    consistent(s37, comparable_board_cross_brand).
evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, dt_alternatives)).
query(true_val(comparable_board_cross_brand, unk_comp_cross)).

0.65::acc(s37, comparable_board_cross_brand_stiff).

% @attr comparable_board_cross_brand_stiff
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (stiff alternatives)
% @values stiff_alts=Custom_X_BSOD_Algorythm_Deep_Fake unk_comp_stiff=Unknown
% @importance 0.65

0.28::true_val(comparable_board_cross_brand_stiff, stiff_alts); 0.72::true_val(comparable_board_cross_brand_stiff, unk_comp_stiff).
measured(s37, comparable_board_cross_brand_stiff, stiff_alts).
all_consistent(comparable_board_cross_brand_stiff) :-
    consistent(s37, comparable_board_cross_brand_stiff).
evidence(all_consistent(comparable_board_cross_brand_stiff)).
query(true_val(comparable_board_cross_brand_stiff, stiff_alts)).
query(true_val(comparable_board_cross_brand_stiff, unk_comp_stiff)).

0.90::acc(s38, comparable_board_same_brand).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values freaker=Rome_Freaker unk_comp_same=Unknown
% @importance 0.6

0.76::true_val(comparable_board_same_brand, freaker); 0.24::true_val(comparable_board_same_brand, unk_comp_same).
measured(s38, comparable_board_same_brand, freaker).
all_consistent(comparable_board_same_brand) :-
    consistent(s38, comparable_board_same_brand).
evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, freaker)).
query(true_val(comparable_board_same_brand, unk_comp_same)).

0.88::acc(s39, comparable_board_same_brand_agent_pro).

% @attr comparable_board_same_brand_agent_pro
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Agent Pro)
% @values agent_pro=Rome_Agent_Pro unk_comp_agent=Unknown
% @importance 0.5

0.71::true_val(comparable_board_same_brand_agent_pro, agent_pro); 0.24::true_val(comparable_board_same_brand_agent_pro, unk_comp_agent).
measured(s39, comparable_board_same_brand_agent_pro, agent_pro).
all_consistent(comparable_board_same_brand_agent_pro) :-
    consistent(s39, comparable_board_same_brand_agent_pro).
evidence(all_consistent(comparable_board_same_brand_agent_pro)).
query(true_val(comparable_board_same_brand_agent_pro, agent_pro)).
query(true_val(comparable_board_same_brand_agent_pro, unk_comp_agent)).

0.78::acc(s40, comparable_board_same_brand_ravine_pro).

% @attr comparable_board_same_brand_ravine_pro
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Ravine Pro)
% @values ravine_pro=Rome_Ravine_Pro unk_comp_ravine=Unknown
% @importance 0.5

0.52::true_val(comparable_board_same_brand_ravine_pro, ravine_pro); 0.48::true_val(comparable_board_same_brand_ravine_pro, unk_comp_ravine).
measured(s40, comparable_board_same_brand_ravine_pro, ravine_pro).
all_consistent(comparable_board_same_brand_ravine_pro) :-
    consistent(s40, comparable_board_same_brand_ravine_pro).
evidence(all_consistent(comparable_board_same_brand_ravine_pro)).
query(true_val(comparable_board_same_brand_ravine_pro, ravine_pro)).
query(true_val(comparable_board_same_brand_ravine_pro, unk_comp_ravine)).

0.85::acc(s10, predecessor_replaced).

% @attr predecessor_replaced
% @type categorical
% @canonical false
% @original_name predecessor Rene-Gade replaced
% @values rome_national=Rome_National unk_pred_replaced=Unknown
% @importance 0.5

0.67::true_val(predecessor_replaced, rome_national); 0.33::true_val(predecessor_replaced, unk_pred_replaced).
measured(s10, predecessor_replaced, rome_national).
all_consistent(predecessor_replaced) :-
    consistent(s10, predecessor_replaced).
evidence(all_consistent(predecessor_replaced)).
query(true_val(predecessor_replaced, rome_national)).
query(true_val(predecessor_replaced, unk_pred_replaced)).

0.82::acc(s20, comparable_board_same_brand_freaker_relation).

% @attr comparable_board_same_brand_freaker_relation
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Freaker relation)
% @values continuation_of_freaker=Continuation_of_Freaker_old_school_shape unk_freaker_rel=Unknown
% @importance 0.85

0.68::true_val(comparable_board_same_brand_freaker_relation, continuation_of_freaker); 0.32::true_val(comparable_board_same_brand_freaker_relation, unk_freaker_rel).
measured(s20, comparable_board_same_brand_freaker_relation, continuation_of_freaker).
all_consistent(comparable_board_same_brand_freaker_relation) :-
    consistent(s20, comparable_board_same_brand_freaker_relation).
evidence(all_consistent(comparable_board_same_brand_freaker_relation)).
query(true_val(comparable_board_same_brand_freaker_relation, continuation_of_freaker)).
query(true_val(comparable_board_same_brand_freaker_relation, unk_freaker_rel)).

0.85::acc(s13, rome_brand_perception).
0.88::acc(s14, rome_brand_perception).

% @attr rome_brand_perception
% @type categorical
% @canonical false
% @original_name Rome brand perception
% @values lifestyle_freestyle_innovative=Snowboarding_lifestyle_youth_freestyle_innovative unk_brand_perc=Unknown
% @importance 0.5

0.95::true_val(rome_brand_perception, lifestyle_freestyle_innovative); 0.05::true_val(rome_brand_perception, unk_brand_perc).
measured(s13, rome_brand_perception, lifestyle_freestyle_innovative).
measured(s14, rome_brand_perception, lifestyle_freestyle_innovative).
all_consistent(rome_brand_perception) :-
    consistent(s13, rome_brand_perception),
    consistent(s14, rome_brand_perception).
evidence(all_consistent(rome_brand_perception)).
query(true_val(rome_brand_perception, lifestyle_freestyle_innovative)).
query(true_val(rome_brand_perception, unk_brand_perc)).

0.88::acc(s14, brand_ethos_director).

% @attr brand_ethos_director
% @type categorical
% @canonical false
% @original_name brand ethos (per Brand Director)
% @values freestyle_responsive=Freestyle_oriented_responsive_product unk_brand_ethos_dir=Unknown
% @importance 0.75

0.81::true_val(brand_ethos_director, freestyle_responsive); 0.19::true_val(brand_ethos_director, unk_brand_ethos_dir).
measured(s14, brand_ethos_director, freestyle_responsive).
all_consistent(brand_ethos_director) :-
    consistent(s14, brand_ethos_director).
evidence(all_consistent(brand_ethos_director)).
query(true_val(brand_ethos_director, freestyle_responsive)).
query(true_val(brand_ethos_director, unk_brand_ethos_dir)).

0.55::acc(s37, manufacturing_location_prior).

% @attr manufacturing_location_prior
% @type categorical
% @canonical false
% @original_name manufacturing_location_prior
% @values uae_factory=Switch_to_UAE_factory_around_2020 unk_mfg_loc=Unknown
% @importance 0.65

0.28::true_val(manufacturing_location_prior, uae_factory); 0.72::true_val(manufacturing_location_prior, unk_mfg_loc).
measured(s37, manufacturing_location_prior, uae_factory).
all_consistent(manufacturing_location_prior) :-
    consistent(s37, manufacturing_location_prior).
evidence(all_consistent(manufacturing_location_prior)).
query(true_val(manufacturing_location_prior, uae_factory)).
query(true_val(manufacturing_location_prior, unk_mfg_loc)).

0.68::acc(s36, rome_customer_service).
0.55::acc(s41, rome_customer_service).

% @attr rome_customer_service
% @type categorical
% @canonical false
% @original_name Rome customer service reputation
% @values mixed=Mixed_responsive_but_sometimes_slow unk_cust_svc=Unknown
% @importance 0.68

0.95::true_val(rome_customer_service, mixed); 0.05::true_val(rome_customer_service, unk_cust_svc).
measured(s36, rome_customer_service, mixed).
measured(s41, rome_customer_service, mixed).
all_consistent(rome_customer_service) :-
    consistent(s36, rome_customer_service),
    consistent(s41, rome_customer_service).
evidence(all_consistent(rome_customer_service)).
query(true_val(rome_customer_service, mixed)).
query(true_val(rome_customer_service, unk_cust_svc)).

0.95::acc(s28, hotrods_definition).

% @attr hotrods_definition
% @type categorical
% @canonical false
% @original_name HotRods definition (Rome official)
% @values thin_rods_milled_core=Thin_rods_milled_into_core_from_inserts unk_hotrods_def=Unknown
% @importance 0.85

0.90::true_val(hotrods_definition, thin_rods_milled_core); 0.10::true_val(hotrods_definition, unk_hotrods_def).
measured(s28, hotrods_definition, thin_rods_milled_core).
all_consistent(hotrods_definition) :-
    consistent(s28, hotrods_definition).
evidence(all_consistent(hotrods_definition)).
query(true_val(hotrods_definition, thin_rods_milled_core)).
query(true_val(hotrods_definition, unk_hotrods_def)).

0.95::acc(s28, omega_definition).

% @attr omega_definition
% @type categorical
% @canonical false
% @original_name Omega definition (Rome official)
% @values carbon_sleeves_omega_shape=Carbon_sleeves_around_HotRods_Omega_shape unk_omega_def=Unknown
% @importance 0.85

0.90::true_val(omega_definition, carbon_sleeves_omega_shape); 0.10::true_val(omega_definition, unk_omega_def).
measured(s28, omega_definition, carbon_sleeves_omega_shape).
all_consistent(omega_definition) :-
    consistent(s28, omega_definition).
evidence(all_consistent(omega_definition)).
query(true_val(omega_definition, carbon_sleeves_omega_shape)).
query(true_val(omega_definition, unk_omega_def)).

0.95::acc(s28, directional_triple_config).

% @attr directional_triple_config
% @type categorical
% @canonical false
% @original_name Directional Triple HotRod configuration
% @values versatility_reactivity=Versatility_reactivity_all_terrain unk_dt_config=Unknown
% @importance 0.85

0.90::true_val(directional_triple_config, versatility_reactivity); 0.10::true_val(directional_triple_config, unk_dt_config).
measured(s28, directional_triple_config, versatility_reactivity).
all_consistent(directional_triple_config) :-
    consistent(s28, directional_triple_config).
evidence(all_consistent(directional_triple_config)).
query(true_val(directional_triple_config, versatility_reactivity)).
query(true_val(directional_triple_config, unk_dt_config)).

0.95::acc(s28, fusion_camber_definition).

% @attr fusion_camber_definition
% @type categorical
% @canonical false
% @original_name Fusion Camber definition (Rome official)
% @values pos_camber_rocker_contacts=Positive_Camber_rocker_contact_points unk_fc_def=Unknown
% @importance 0.85

0.90::true_val(fusion_camber_definition, pos_camber_rocker_contacts); 0.10::true_val(fusion_camber_definition, unk_fc_def).
measured(s28, fusion_camber_definition, pos_camber_rocker_contacts).
all_consistent(fusion_camber_definition) :-
    consistent(s28, fusion_camber_definition).
evidence(all_consistent(fusion_camber_definition)).
query(true_val(fusion_camber_definition, pos_camber_rocker_contacts)).
query(true_val(fusion_camber_definition, unk_fc_def)).

0.95::acc(s28, pop_core_definition).

% @attr pop_core_definition
% @type categorical
% @canonical false
% @original_name Pop Core definition (Rome official)
% @values versatile_durable_20_20=Most_versatile_durable_20mm_Poplar_20mm_Paulownia unk_pc_def=Unknown
% @importance 0.85

0.90::true_val(pop_core_definition, versatile_durable_20_20); 0.10::true_val(pop_core_definition, unk_pc_def).
measured(s28, pop_core_definition, versatile_durable_20_20).
all_consistent(pop_core_definition) :-
    consistent(s28, pop_core_definition).
evidence(all_consistent(pop_core_definition)).
query(true_val(pop_core_definition, versatile_durable_20_20)).
query(true_val(pop_core_definition, unk_pc_def)).

0.95::acc(s28, superpop_core_definition).

% @attr superpop_core_definition
% @type categorical
% @canonical false
% @original_name SuperPop Core definition (Rome official)
% @values lightest_responsive_10_20=Lightest_most_responsive_10mm_Poplar_20mm_Paulownia unk_spc_def=Unknown
% @importance 0.85

0.90::true_val(superpop_core_definition, lightest_responsive_10_20); 0.10::true_val(superpop_core_definition, unk_spc_def).
measured(s28, superpop_core_definition, lightest_responsive_10_20).
all_consistent(superpop_core_definition) :-
    consistent(s28, superpop_core_definition).
evidence(all_consistent(superpop_core_definition)).
query(true_val(superpop_core_definition, lightest_responsive_10_20)).
query(true_val(superpop_core_definition, unk_spc_def)).

0.95::acc(s28, sinterstrong_definition).

% @attr sinterstrong_definition
% @type categorical
% @canonical false
% @original_name SinterStrong Base definition (Rome official)
% @values versatile_low_maint=Versatile_low_maintenance_sintered unk_ss_def=Unknown
% @importance 0.85

0.90::true_val(sinterstrong_definition, versatile_low_maint); 0.10::true_val(sinterstrong_definition, unk_ss_def).
measured(s28, sinterstrong_definition, versatile_low_maint).
all_consistent(sinterstrong_definition) :-
    consistent(s28, sinterstrong_definition).
evidence(all_consistent(sinterstrong_definition)).
query(true_val(sinterstrong_definition, versatile_low_maint)).
query(true_val(sinterstrong_definition, unk_ss_def)).

0.95::acc(s28, sinterspeed_definition).

% @attr sinterspeed_definition
% @type categorical
% @canonical false
% @original_name SinterSpeed Base definition (Rome official)
% @values premium_high_speed=Premium_sintered_high_performance_speed unk_spd_def=Unknown
% @importance 0.85

0.90::true_val(sinterspeed_definition, premium_high_speed); 0.10::true_val(sinterspeed_definition, unk_spd_def).
measured(s28, sinterspeed_definition, premium_high_speed).
all_consistent(sinterspeed_definition) :-
    consistent(s28, sinterspeed_definition).
evidence(all_consistent(sinterspeed_definition)).
query(true_val(sinterspeed_definition, premium_high_speed)).
query(true_val(sinterspeed_definition, unk_spd_def)).

0.95::acc(s28, triax_glass_definition).

% @attr triax_glass_definition
% @type categorical
% @canonical false
% @original_name Triax Glass definition (Rome official)
% @values three_axes_torsional_snap=Fiberglass_three_axes_torsional_rigidity_snap unk_tg_def=Unknown
% @importance 0.85

0.90::true_val(triax_glass_definition, three_axes_torsional_snap); 0.10::true_val(triax_glass_definition, unk_tg_def).
measured(s28, triax_glass_definition, three_axes_torsional_snap).
all_consistent(triax_glass_definition) :-
    consistent(s28, triax_glass_definition).
evidence(all_consistent(triax_glass_definition)).
query(true_val(triax_glass_definition, three_axes_torsional_snap)).
query(true_val(triax_glass_definition, unk_tg_def)).

0.95::acc(s28, directional_diamond_3d_def).

% @attr directional_diamond_3d_def
% @type categorical
% @canonical false
% @original_name Directional Diamond 3D definition (Rome official)
% @values nose_only_float_turns=Found_in_nose_float_deep_snow_smooth_turns unk_dd3d_def=Unknown
% @importance 0.85

0.90::true_val(directional_diamond_3d_def, nose_only_float_turns); 0.10::true_val(directional_diamond_3d_def, unk_dd3d_def).
measured(s28, directional_diamond_3d_def, nose_only_float_turns).
all_consistent(directional_diamond_3d_def) :-
    consistent(s28, directional_diamond_3d_def).
evidence(all_consistent(directional_diamond_3d_def)).
query(true_val(directional_diamond_3d_def, nose_only_float_turns)).
query(true_val(directional_diamond_3d_def, unk_dd3d_def)).

0.95::acc(s28, double_kick_definition).

% @attr double_kick_definition
% @type categorical
% @canonical false
% @original_name Double Kick definition (Rome official)
% @values freestyle_aggressive_rise=Freestyle_aggressive_two_part_rise_presses_stability unk_dk_def=Unknown
% @importance 0.85

0.90::true_val(double_kick_definition, freestyle_aggressive_rise); 0.10::true_val(double_kick_definition, unk_dk_def).
measured(s28, double_kick_definition, freestyle_aggressive_rise).
all_consistent(double_kick_definition) :-
    consistent(s28, double_kick_definition).
evidence(all_consistent(double_kick_definition)).
query(true_val(double_kick_definition, freestyle_aggressive_rise)).
query(true_val(double_kick_definition, unk_dk_def)).

0.95::acc(s28, directional_twin_definition).

% @attr directional_twin_definition
% @type categorical
% @canonical false
% @original_name Directional Twin shape definition (Rome official)
% @values longer_nose_sym_camber=Longer_nose_symmetrical_camber_switch_capable unk_dtwin_def=Unknown
% @importance 0.85

0.90::true_val(directional_twin_definition, longer_nose_sym_camber); 0.10::true_val(directional_twin_definition, unk_dtwin_def).
measured(s28, directional_twin_definition, longer_nose_sym_camber).
all_consistent(directional_twin_definition) :-
    consistent(s28, directional_twin_definition).
evidence(all_consistent(directional_twin_definition)).
query(true_val(directional_twin_definition, longer_nose_sym_camber)).
query(true_val(directional_twin_definition, unk_dtwin_def)).

0.85::acc(s19, renegade_second_year).

% @attr renegade_second_year
% @type categorical
% @canonical false
% @original_name Rome Rene-Gade second model year
% @values y2025=2025_season unk_rg_y2=Unknown
% @importance 0.8

0.72::true_val(renegade_second_year, y2025); 0.28::true_val(renegade_second_year, unk_rg_y2).
measured(s19, renegade_second_year, y2025).
all_consistent(renegade_second_year) :-
    consistent(s19, renegade_second_year).
evidence(all_consistent(renegade_second_year)).
query(true_val(renegade_second_year, y2025)).
query(true_val(renegade_second_year, unk_rg_y2)).

0.88::acc(s17, renegade_third_year).

% @attr renegade_third_year
% @type categorical
% @canonical false
% @original_name Rome Rene-Gade third model year
% @values y2026=2026_season unk_rg_y3=Unknown
% @importance 0.8

0.81::true_val(renegade_third_year, y2026); 0.19::true_val(renegade_third_year, unk_rg_y3).
measured(s17, renegade_third_year, y2026).
all_consistent(renegade_third_year) :-
    consistent(s17, renegade_third_year).
evidence(all_consistent(renegade_third_year)).
query(true_val(renegade_third_year, y2026)).
query(true_val(renegade_third_year, unk_rg_y3)).

0.88::acc(s1, redesign_year).
0.88::acc(s14, redesign_year).

% @attr redesign_year
% @type categorical
% @canonical false
% @original_name redesign_year
% @values season_2026_27=New_model_name_2026_27 unk_redesign=Unknown
% @importance 0.85

0.95::true_val(redesign_year, season_2026_27); 0.05::true_val(redesign_year, unk_redesign).
measured(s1, redesign_year, season_2026_27).
measured(s14, redesign_year, season_2026_27).
all_consistent(redesign_year) :-
    (indep(s1), consistent(s1, redesign_year) ; \+indep(s1)),
    consistent(s14, redesign_year).
evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, season_2026_27)).
query(true_val(redesign_year, unk_redesign)).

0.88::acc(s14, comparable_board_same_brand_rene_pro).

% @attr comparable_board_same_brand_rene_pro
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Rene Pro)
% @values rene_pro=Rene_Pro_higher_tier unk_comp_rp=Unknown
% @importance 0.75

0.81::true_val(comparable_board_same_brand_rene_pro, rene_pro); 0.19::true_val(comparable_board_same_brand_rene_pro, unk_comp_rp).
measured(s14, comparable_board_same_brand_rene_pro, rene_pro).
all_consistent(comparable_board_same_brand_rene_pro) :-
    consistent(s14, comparable_board_same_brand_rene_pro).
evidence(all_consistent(comparable_board_same_brand_rene_pro)).
query(true_val(comparable_board_same_brand_rene_pro, rene_pro)).
query(true_val(comparable_board_same_brand_rene_pro, unk_comp_rp)).