0.15::indep(s1).
0.15::indep(s3).
0.15::indep(s7).
0.15::indep(s8).
0.15::indep(s13).
0.20::indep(s24).
0.15::indep(s28).
0.15::indep(s33).
0.25::indep(s40).
0.15::indep(s110).
0.15::indep(s_merch).
0.40::indep(s82).
0.30::indep(s41).
0.15::indep(s68).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

0.90::acc(s1, brand).
0.97::acc(s34, brand).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values burton=Burton unk_brand=Unknown
% @importance 0.95

0.95::true_val(brand, burton); 0.05::true_val(brand, unk_brand).

measured(s1, brand, burton).
measured(s34, brand, burton).

all_consistent(brand) :-
    consistent(s34, brand),
    (indep(s1), consistent(s1, brand) ; \+indep(s1)).

evidence(all_consistent(brand)).
query(true_val(brand, burton)).
query(true_val(brand, unk_brand)).

0.90::acc(s1, model_name).
0.97::acc(s34, model_name).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values process=Process unk_model_name=Unknown
% @importance 0.95

0.95::true_val(model_name, process); 0.05::true_val(model_name, unk_model_name).

measured(s1, model_name, process).
measured(s34, model_name, process).

all_consistent(model_name) :-
    consistent(s34, model_name),
    (indep(s1), consistent(s1, model_name) ; \+indep(s1)).

evidence(all_consistent(model_name)).
query(true_val(model_name, process)).
query(true_val(model_name, unk_model_name)).

0.93::acc(s34, full_product_name).

% @attr full_product_name
% @type categorical
% @canonical false
% @original_name Full product name
% @values mens_burton_process_camber_snowboard=Mens_Burton_Process_Camber_Snowboard unk_full_product_name=Unknown
% @importance 1.0

0.93::true_val(full_product_name, mens_burton_process_camber_snowboard); 0.07::true_val(full_product_name, unk_full_product_name).

measured(s34, full_product_name, mens_burton_process_camber_snowboard).

all_consistent(full_product_name) :-
    consistent(s34, full_product_name).

evidence(all_consistent(full_product_name)).
query(true_val(full_product_name, mens_burton_process_camber_snowboard)).
query(true_val(full_product_name, unk_full_product_name)).

0.90::acc(s1, model_year).
0.97::acc(s34, model_year).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2026=2026 unk_model_year=Unknown
% @importance 0.95

0.95::true_val(model_year, y2026); 0.05::true_val(model_year, unk_model_year).

measured(s1, model_year, y2026).
measured(s34, model_year, y2026).

all_consistent(model_year) :-
    consistent(s34, model_year),
    (indep(s1), consistent(s1, model_year) ; \+indep(s1)).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2026)).
query(true_val(model_year, unk_model_year)).

0.70::acc(s25, model_first_available_year).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values y2011_or_earlier=2011_or_earlier unk_model_first_available_year=Unknown
% @importance 0.5

0.60::true_val(model_first_available_year, y2011_or_earlier); 0.40::true_val(model_first_available_year, unk_model_first_available_year).

measured(s25, model_first_available_year, y2011_or_earlier).

all_consistent(model_first_available_year) :-
    consistent(s25, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2011_or_earlier)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

0.80::acc(s40, model_update_2026).

% @attr model_update_2026
% @type categorical
% @canonical false
% @original_name 2026 model update
% @values graphics_only=Graphics_only unk_model_update_2026=Unknown
% @importance 0.8

0.71::true_val(model_update_2026, graphics_only); 0.29::true_val(model_update_2026, unk_model_update_2026).

measured(s40, model_update_2026, graphics_only).

all_consistent(model_update_2026) :-
    consistent(s40, model_update_2026).

evidence(all_consistent(model_update_2026)).
query(true_val(model_update_2026, graphics_only)).
query(true_val(model_update_2026, unk_model_update_2026)).

0.92::acc(s112, manufacturer).
0.95::acc(s46, manufacturer).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values burton_snowboards=Burton_Snowboards_founded_1977 unk_manufacturer=Unknown
% @importance 0.375

0.95::true_val(manufacturer, burton_snowboards); 0.05::true_val(manufacturer, unk_manufacturer).

measured(s112, manufacturer, burton_snowboards).
measured(s46, manufacturer, burton_snowboards).

all_consistent(manufacturer) :-
    consistent(s46, manufacturer),
    consistent(s112, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, burton_snowboards)).
query(true_val(manufacturer, unk_manufacturer)).

0.95::acc(s46, manufacturer_headquarters).
0.90::acc(s112, manufacturer_headquarters).

% @attr manufacturer_headquarters
% @type categorical
% @canonical false
% @original_name Manufacturer headquarters
% @values burlington_vt_usa=Burlington_Vermont_USA unk_manufacturer_headquarters=Unknown
% @importance 0.375

0.95::true_val(manufacturer_headquarters, burlington_vt_usa); 0.05::true_val(manufacturer_headquarters, unk_manufacturer_headquarters).

measured(s46, manufacturer_headquarters, burlington_vt_usa).
measured(s112, manufacturer_headquarters, burlington_vt_usa).

all_consistent(manufacturer_headquarters) :-
    consistent(s46, manufacturer_headquarters),
    consistent(s112, manufacturer_headquarters).

evidence(all_consistent(manufacturer_headquarters)).
query(true_val(manufacturer_headquarters, burlington_vt_usa)).
query(true_val(manufacturer_headquarters, unk_manufacturer_headquarters)).

0.88::acc(s29, manufacturing_location).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values kiel_nindl_austria=Kiel_Nindl_GMBH_Austria unk_manufacturing_location=Unknown
% @importance 0.75

0.84::true_val(manufacturing_location, kiel_nindl_austria); 0.16::true_val(manufacturing_location, unk_manufacturing_location).

measured(s29, manufacturing_location, kiel_nindl_austria).

all_consistent(manufacturing_location) :-
    consistent(s29, manufacturing_location).

evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, kiel_nindl_austria)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

0.88::acc(s104, sustainability_certification_supply_chain).

% @attr sustainability_certification_supply_chain
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values local_sourcing_fsc_scrap=Sources_within_250mi_FSC_wood_scrap_heating unk_sustainability_certification_supply_chain=Unknown
% @importance 0.5

0.81::true_val(sustainability_certification_supply_chain, local_sourcing_fsc_scrap); 0.19::true_val(sustainability_certification_supply_chain, unk_sustainability_certification_supply_chain).

measured(s104, sustainability_certification_supply_chain, local_sourcing_fsc_scrap).

all_consistent(sustainability_certification_supply_chain) :-
    consistent(s104, sustainability_certification_supply_chain).

evidence(all_consistent(sustainability_certification_supply_chain)).
query(true_val(sustainability_certification_supply_chain, local_sourcing_fsc_scrap)).
query(true_val(sustainability_certification_supply_chain, unk_sustainability_certification_supply_chain)).

0.82::acc(s112, burton_market_position).

% @attr burton_market_position
% @type categorical
% @canonical false
% @original_name Burton market position
% @values world_leading_private=World_leading_snowboard_company_privately_owned unk_burton_market_position=Unknown
% @importance 0.35

0.68::true_val(burton_market_position, world_leading_private); 0.32::true_val(burton_market_position, unk_burton_market_position).

measured(s112, burton_market_position, world_leading_private).

all_consistent(burton_market_position) :-
    consistent(s112, burton_market_position).

evidence(all_consistent(burton_market_position)).
query(true_val(burton_market_position, world_leading_private)).
query(true_val(burton_market_position, unk_burton_market_position)).

0.90::acc(s_merch, sustainability_certification_bcorp).

% @attr sustainability_certification_bcorp
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values b_corporation=Certified_B_Corporation unk_sustainability_certification_bcorp=Unknown
% @importance 0.85

0.90::true_val(sustainability_certification_bcorp, b_corporation); 0.10::true_val(sustainability_certification_bcorp, unk_sustainability_certification_bcorp).

measured(s_merch, sustainability_certification_bcorp, b_corporation).

all_consistent(sustainability_certification_bcorp) :-
    consistent(s_merch, sustainability_certification_bcorp).

evidence(all_consistent(sustainability_certification_bcorp)).
query(true_val(sustainability_certification_bcorp, b_corporation)).
query(true_val(sustainability_certification_bcorp, unk_sustainability_certification_bcorp)).

0.88::acc(s1, product_type).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.9

0.90::true_val(product_type, snowboard); 0.10::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).

all_consistent(product_type) :-
    consistent(s1, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

0.88::acc(s13, board_category).
0.88::acc(s1, board_category).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain=All_Mountain unk_board_category=Unknown
% @importance 0.85

0.95::true_val(board_category, all_mountain); 0.05::true_val(board_category, unk_board_category).

measured(s13, board_category, all_mountain).
measured(s1, board_category, all_mountain).

all_consistent(board_category) :-
    (indep(s13), consistent(s13, board_category) ; \+indep(s13)),
    (indep(s1), consistent(s1, board_category) ; \+indep(s1)).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain)).
query(true_val(board_category, unk_board_category)).

0.85::acc(s11, board_subtype).

% @attr board_subtype
% @type categorical
% @canonical false
% @original_name Board subtype
% @values all_mountain_freestyle=All_Mountain_Freestyle unk_board_subtype=Unknown
% @importance 0.85

0.80::true_val(board_subtype, all_mountain_freestyle); 0.20::true_val(board_subtype, unk_board_subtype).

measured(s11, board_subtype, all_mountain_freestyle).

all_consistent(board_subtype) :-
    consistent(s11, board_subtype).

evidence(all_consistent(board_subtype)).
query(true_val(board_subtype, all_mountain_freestyle)).
query(true_val(board_subtype, unk_board_subtype)).

0.93::acc(s34, gender).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 1.0

0.93::true_val(gender, mens); 0.07::true_val(gender, unk_gender).

measured(s34, gender, mens).

all_consistent(gender) :-
    consistent(s34, gender).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

0.93::acc(s34, sku).

% @attr sku
% @type categorical
% @canonical false
% @original_name SKU
% @values sku_106921=106921 unk_sku=Unknown
% @importance 1.0

0.93::true_val(sku, sku_106921); 0.07::true_val(sku, unk_sku).

measured(s34, sku, sku_106921).

all_consistent(sku) :-
    consistent(s34, sku).

evidence(all_consistent(sku)).
query(true_val(sku, sku_106921)).
query(true_val(sku, unk_sku)).

0.93::acc(s_merch, merchant_sku).

% @attr merchant_sku
% @type categorical
% @canonical false
% @original_name Merchant SKU
% @values sku_106921ca03rg152=106921CA03RG152 unk_merchant_sku=Unknown
% @importance 0.85

0.93::true_val(merchant_sku, sku_106921ca03rg152); 0.07::true_val(merchant_sku, unk_merchant_sku).

measured(s_merch, merchant_sku, sku_106921ca03rg152).

all_consistent(merchant_sku) :-
    consistent(s_merch, merchant_sku).

evidence(all_consistent(merchant_sku)).
query(true_val(merchant_sku, sku_106921ca03rg152)).
query(true_val(merchant_sku, unk_merchant_sku)).

0.82::acc(s3, pro_rider_name).
0.80::acc(s33, pro_rider_name).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values mark_mcmorris=Mark_McMorris unk_pro_rider_name=Unknown
% @importance 0.5

0.95::true_val(pro_rider_name, mark_mcmorris); 0.05::true_val(pro_rider_name, unk_pro_rider_name).

measured(s3, pro_rider_name, mark_mcmorris).
measured(s33, pro_rider_name, mark_mcmorris).

all_consistent(pro_rider_name) :-
    (indep(s3), consistent(s3, pro_rider_name) ; \+indep(s3)),
    (indep(s33), consistent(s33, pro_rider_name) ; \+indep(s33)).

evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, mark_mcmorris)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

0.88::acc(s29, price_usd_msrp).
0.92::acc(s82, price_usd_msrp).
0.88::acc(s1, price_usd_msrp).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v549_95=549.95 unk_price_usd_msrp=Unknown
% @importance 0.9

0.97::true_val(price_usd_msrp, v549_95); 0.03::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s29, price_usd_msrp, v549_95).
measured(s82, price_usd_msrp, v549_95).
measured(s1, price_usd_msrp, v549_95).

all_consistent(price_usd_msrp) :-
    consistent(s29, price_usd_msrp),
    (indep(s82), consistent(s82, price_usd_msrp) ; \+indep(s82)),
    (indep(s1), consistent(s1, price_usd_msrp) ; \+indep(s1)).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v549_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

0.93::acc(s_merch, price_aud_merchant_rrp).

% @attr price_aud_merchant_rrp
% @type numeric
% @unit AUD
% @canonical false
% @original_name price_aud_merchant
% @values v879_99=879.99 unk_price_aud_merchant_rrp=Unknown
% @importance 0.85

0.93::true_val(price_aud_merchant_rrp, v879_99); 0.07::true_val(price_aud_merchant_rrp, unk_price_aud_merchant_rrp).

measured(s_merch, price_aud_merchant_rrp, v879_99).

all_consistent(price_aud_merchant_rrp) :-
    consistent(s_merch, price_aud_merchant_rrp).

evidence(all_consistent(price_aud_merchant_rrp)).
query(true_val(price_aud_merchant_rrp, v879_99)).
query(true_val(price_aud_merchant_rrp, unk_price_aud_merchant_rrp)).

0.93::acc(s_merch, price_aud_merchant).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v703_99=703.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.93::true_val(price_aud_merchant, v703_99); 0.07::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s_merch, price_aud_merchant, v703_99).

all_consistent(price_aud_merchant) :-
    consistent(s_merch, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v703_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

0.85::acc(s1, comparable_board_same_brand_custom_price).

% @attr comparable_board_same_brand_custom_price
% @type numeric
% @unit USD
% @canonical false
% @original_name comparable_board_same_brand
% @values v679_95=679.95 unk_comparable_board_same_brand_custom_price=Unknown
% @importance 0.8

0.80::true_val(comparable_board_same_brand_custom_price, v679_95); 0.20::true_val(comparable_board_same_brand_custom_price, unk_comparable_board_same_brand_custom_price).

measured(s1, comparable_board_same_brand_custom_price, v679_95).

all_consistent(comparable_board_same_brand_custom_price) :-
    consistent(s1, comparable_board_same_brand_custom_price).

evidence(all_consistent(comparable_board_same_brand_custom_price)).
query(true_val(comparable_board_same_brand_custom_price, v679_95)).
query(true_val(comparable_board_same_brand_custom_price, unk_comparable_board_same_brand_custom_price)).

0.82::acc(s68, price_usd_evo).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_evo
% @values v439_96=439.96 unk_price_usd_evo=Unknown
% @importance 0.7

0.82::true_val(price_usd_evo, v439_96); 0.18::true_val(price_usd_evo, unk_price_usd_evo).

measured(s68, price_usd_evo, v439_96).

all_consistent(price_usd_evo) :-
    (indep(s68), consistent(s68, price_usd_evo) ; \+indep(s68)).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v439_96)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

0.88::acc(s1, availability_status).
0.80::acc(s7, availability_status).
0.78::acc(s40, availability_status).
0.75::acc(s24, availability_status).
0.78::acc(s13, availability_status).
0.78::acc(s8, availability_status).
0.93::acc(s34, availability_status).
0.75::acc(s3, availability_status).
0.70::acc(s28, availability_status).
0.75::acc(s110, availability_status).
0.70::acc(s5, availability_status).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values available=Available unk_availability_status=Unknown
% @importance 0.58

0.97::true_val(availability_status, available); 0.03::true_val(availability_status, unk_availability_status).

measured(s1, availability_status, available).
measured(s7, availability_status, available).
measured(s40, availability_status, available).
measured(s24, availability_status, available).
measured(s13, availability_status, available).
measured(s8, availability_status, available).
measured(s34, availability_status, available).
measured(s3, availability_status, available).
measured(s28, availability_status, available).
measured(s110, availability_status, available).
measured(s5, availability_status, available).

all_consistent(availability_status) :-
    consistent(s34, availability_status),
    (indep(s1), consistent(s1, availability_status) ; \+indep(s1)),
    (indep(s7), consistent(s7, availability_status) ; \+indep(s7)),
    (indep(s40), consistent(s40, availability_status) ; \+indep(s40)),
    (indep(s24), consistent(s24, availability_status) ; \+indep(s24)),
    (indep(s13), consistent(s13, availability_status) ; \+indep(s13)),
    (indep(s8), consistent(s8, availability_status) ; \+indep(s8)),
    (indep(s3), consistent(s3, availability_status) ; \+indep(s3)),
    (indep(s28), consistent(s28, availability_status) ; \+indep(s28)),
    (indep(s110), consistent(s110, availability_status) ; \+indep(s110)),
    (indep(s5), consistent(s5, availability_status) ; \+indep(s5)).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, available)).
query(true_val(availability_status, unk_availability_status)).

0.90::acc(s82, availability_status_rei).

% @attr availability_status_rei
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_rewards=Available_549_95_with_rewards unk_availability_status_rei=Unknown
% @importance 0.8

0.90::true_val(availability_status_rei, available_rewards); 0.10::true_val(availability_status_rei, unk_availability_status_rei).

measured(s82, availability_status_rei, available_rewards).

all_consistent(availability_status_rei) :-
    (indep(s82), consistent(s82, availability_status_rei) ; \+indep(s82)).

evidence(all_consistent(availability_status_rei)).
query(true_val(availability_status_rei, available_rewards)).
query(true_val(availability_status_rei, unk_availability_status_rei)).

0.85::acc(s29, availability_status_ski_monster).

% @attr availability_status_ski_monster
% @type categorical
% @canonical false
% @original_name availability_status
% @values out_of_stock_90day_return=Out_of_stock_90day_returns unk_availability_status_ski_monster=Unknown
% @importance 0.9

0.85::true_val(availability_status_ski_monster, out_of_stock_90day_return); 0.15::true_val(availability_status_ski_monster, unk_availability_status_ski_monster).

measured(s29, availability_status_ski_monster, out_of_stock_90day_return).

all_consistent(availability_status_ski_monster) :-
    consistent(s29, availability_status_ski_monster).

evidence(all_consistent(availability_status_ski_monster)).
query(true_val(availability_status_ski_monster, out_of_stock_90day_return)).
query(true_val(availability_status_ski_monster, unk_availability_status_ski_monster)).

0.78::acc(s33, availability_status_eriks).

% @attr availability_status_eriks
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_pricematch_binding=Available_pricematch_free_binding unk_availability_status_eriks=Unknown
% @importance 0.5

0.78::true_val(availability_status_eriks, available_pricematch_binding); 0.22::true_val(availability_status_eriks, unk_availability_status_eriks).

measured(s33, availability_status_eriks, available_pricematch_binding).

all_consistent(availability_status_eriks) :-
    (indep(s33), consistent(s33, availability_status_eriks) ; \+indep(s33)).

evidence(all_consistent(availability_status_eriks)).
query(true_val(availability_status_eriks, available_pricematch_binding)).
query(true_val(availability_status_eriks, unk_availability_status_eriks)).

0.90::acc(s_merch, shipping_restriction).

% @attr shipping_restriction
% @type categorical
% @canonical false
% @original_name Shipping restriction on merchant site
% @values australia_only=Australia_only unk_shipping_restriction=Unknown
% @importance 0.85

0.90::true_val(shipping_restriction, australia_only); 0.10::true_val(shipping_restriction, unk_shipping_restriction).

measured(s_merch, shipping_restriction, australia_only).

all_consistent(shipping_restriction) :-
    consistent(s_merch, shipping_restriction).

evidence(all_consistent(shipping_restriction)).
query(true_val(shipping_restriction, australia_only)).
query(true_val(shipping_restriction, unk_shipping_restriction)).

0.92::acc(s34, camber_variant).
0.88::acc(s1, camber_variant).

% @attr camber_variant
% @type categorical
% @canonical false
% @original_name Camber variant
% @values purepop_camber=Burton_Process_Camber_PurePop unk_camber_variant=Unknown
% @importance 0.95

0.95::true_val(camber_variant, purepop_camber); 0.05::true_val(camber_variant, unk_camber_variant).

measured(s34, camber_variant, purepop_camber).
measured(s1, camber_variant, purepop_camber).

all_consistent(camber_variant) :-
    consistent(s34, camber_variant),
    (indep(s1), consistent(s1, camber_variant) ; \+indep(s1)).

evidence(all_consistent(camber_variant)).
query(true_val(camber_variant, purepop_camber)).
query(true_val(camber_variant, unk_camber_variant)).

0.80::acc(s40, comparable_board_same_brand).
0.78::acc(s7, comparable_board_same_brand).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values process_flying_v=Burton_Process_Flying_V unk_comparable_board_same_brand=Unknown
% @importance 0.6

0.95::true_val(comparable_board_same_brand, process_flying_v); 0.05::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s40, comparable_board_same_brand, process_flying_v).
measured(s7, comparable_board_same_brand, process_flying_v).

all_consistent(comparable_board_same_brand) :-
    (indep(s40), consistent(s40, comparable_board_same_brand) ; \+indep(s40)),
    (indep(s7), consistent(s7, comparable_board_same_brand) ; \+indep(s7)).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, process_flying_v)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

0.85::acc(s41, flying_v_profile_description).

% @attr flying_v_profile_description
% @type categorical
% @canonical false
% @original_name Flying V profile description
% @values rocker_camber_hybrid=Rocker_zones_for_playfulness_camber_zones_for_edge_control unk_flying_v_profile_description=Unknown
% @importance 0.7

0.80::true_val(flying_v_profile_description, rocker_camber_hybrid); 0.20::true_val(flying_v_profile_description, unk_flying_v_profile_description).

measured(s41, flying_v_profile_description, rocker_camber_hybrid).

all_consistent(flying_v_profile_description) :-
    (indep(s41), consistent(s41, flying_v_profile_description) ; \+indep(s41)).

evidence(all_consistent(flying_v_profile_description)).
query(true_val(flying_v_profile_description, rocker_camber_hybrid)).
query(true_val(flying_v_profile_description, unk_flying_v_profile_description)).

0.78::acc(s30, comparable_board_same_brand_smalls).

% @attr comparable_board_same_brand_smalls
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values process_smalls=Burton_Process_Smalls_youth unk_comparable_board_same_brand_smalls=Unknown
% @importance 0.7

0.70::true_val(comparable_board_same_brand_smalls, process_smalls); 0.30::true_val(comparable_board_same_brand_smalls, unk_comparable_board_same_brand_smalls).

measured(s30, comparable_board_same_brand_smalls, process_smalls).

all_consistent(comparable_board_same_brand_smalls) :-
    consistent(s30, comparable_board_same_brand_smalls).

evidence(all_consistent(comparable_board_same_brand_smalls)).
query(true_val(comparable_board_same_brand_smalls, process_smalls)).
query(true_val(comparable_board_same_brand_smalls, unk_comparable_board_same_brand_smalls)).

0.90::acc(s_merch, width_options).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 0.85

0.90::true_val(width_options, standard_and_wide); 0.10::true_val(width_options, unk_width_options).

measured(s_merch, width_options, standard_and_wide).

all_consistent(width_options) :-
    consistent(s_merch, width_options).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

0.75::acc(s30, flying_v_flex_rating).

% @attr flying_v_flex_rating
% @type numeric
% @unit /10
% @canonical false
% @original_name Flying V flex rating (per The Inertia)
% @values v4=4.0 unk_flying_v_flex_rating=Unknown
% @importance 0.7

0.65::true_val(flying_v_flex_rating, v4); 0.35::true_val(flying_v_flex_rating, unk_flying_v_flex_rating).

measured(s30, flying_v_flex_rating, v4).

all_consistent(flying_v_flex_rating) :-
    consistent(s30, flying_v_flex_rating).

evidence(all_consistent(flying_v_flex_rating)).
query(true_val(flying_v_flex_rating, v4)).
query(true_val(flying_v_flex_rating, unk_flying_v_flex_rating)).

0.92::acc(s1, shape).
0.88::acc(s_merch, shape).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values true_twin=True_Twin unk_shape=Unknown
% @importance 0.925

0.95::true_val(shape, true_twin); 0.05::true_val(shape, unk_shape).

measured(s1, shape, true_twin).
measured(s_merch, shape, true_twin).

all_consistent(shape) :-
    (indep(s1), consistent(s1, shape) ; \+indep(s1)),
    (indep(s_merch), consistent(s_merch, shape) ; \+indep(s_merch)).

evidence(all_consistent(shape)).
query(true_val(shape, true_twin)).
query(true_val(shape, unk_shape)).

0.90::acc(s1, shape_description).

% @attr shape_description
% @type categorical
% @canonical false
% @original_name Shape description
% @values symmetric_tip_to_tail=Perfectly_symmetrical_tip_to_tail unk_shape_description=Unknown
% @importance 0.95

0.90::true_val(shape_description, symmetric_tip_to_tail); 0.10::true_val(shape_description, unk_shape_description).

measured(s1, shape_description, symmetric_tip_to_tail).

all_consistent(shape_description) :-
    (indep(s1), consistent(s1, shape_description) ; \+indep(s1)).

evidence(all_consistent(shape_description)).
query(true_val(shape_description, symmetric_tip_to_tail)).
query(true_val(shape_description, unk_shape_description)).

0.90::acc(s1, flex_direction).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values twin_flex=Twin_Flex_symmetrical unk_flex_direction=Unknown
% @importance 0.95

0.95::true_val(flex_direction, twin_flex); 0.05::true_val(flex_direction, unk_flex_direction).

measured(s1, flex_direction, twin_flex).

all_consistent(flex_direction) :-
    (indep(s1), consistent(s1, flex_direction) ; \+indep(s1)).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, twin_flex)).
query(true_val(flex_direction, unk_flex_direction)).

0.90::acc(s_merch, setback).
0.88::acc(s11, setback).

% @attr setback
% @type numeric
% @unit mm
% @canonical true
% @original_name setback
% @values v0=0.0 v12_5=12.5
% @importance 0.875

0.45::true_val(setback, v0); 0.55::true_val(setback, v12_5).

measured(s_merch, setback, v0).
measured(s11, setback, v12_5).

all_consistent(setback) :-
    consistent(s_merch, setback),
    consistent(s11, setback).

evidence(all_consistent(setback)).
query(true_val(setback, v0)).
query(true_val(setback, v12_5)).

0.92::acc(s1, camber_type).
0.85::acc(s11, camber_type).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values purepop_camber=PurePop_Camber hybrid_camber=Hybrid_Camber
% @importance 0.925

0.60::true_val(camber_type, purepop_camber); 0.40::true_val(camber_type, hybrid_camber).

measured(s1, camber_type, purepop_camber).
measured(s11, camber_type, hybrid_camber).

all_consistent(camber_type) :-
    (indep(s1), consistent(s1, camber_type) ; \+indep(s1)),
    consistent(s11, camber_type).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, purepop_camber)).
query(true_val(camber_type, hybrid_camber)).

0.90::acc(s1, camber_description).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values evolution_traditional_flat_zones=Evolution_of_traditional_camber_flat_zones_outside_feet unk_camber_description=Unknown
% @importance 0.825

0.90::true_val(camber_description, evolution_traditional_flat_zones); 0.10::true_val(camber_description, unk_camber_description).

measured(s1, camber_description, evolution_traditional_flat_zones).

all_consistent(camber_description) :-
    (indep(s1), consistent(s1, camber_description) ; \+indep(s1)).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, evolution_traditional_flat_zones)).
query(true_val(camber_description, unk_camber_description)).

0.88::acc(s1, camber_description_tip_tail).

% @attr camber_description_tip_tail
% @type categorical
% @canonical false
% @original_name camber_description
% @values early_rise_tip_tail=Early_rise_tip_tail_catch_free unk_camber_description_tip_tail=Unknown
% @importance 0.95

0.88::true_val(camber_description_tip_tail, early_rise_tip_tail); 0.12::true_val(camber_description_tip_tail, unk_camber_description_tip_tail).

measured(s1, camber_description_tip_tail, early_rise_tip_tail).

all_consistent(camber_description_tip_tail) :-
    (indep(s1), consistent(s1, camber_description_tip_tail) ; \+indep(s1)).

evidence(all_consistent(camber_description_tip_tail)).
query(true_val(camber_description_tip_tail, early_rise_tip_tail)).
query(true_val(camber_description_tip_tail, unk_camber_description_tip_tail)).

0.88::acc(s11, camber_height_mm).

% @attr camber_height_mm
% @type numeric
% @unit mm
% @canonical true
% @original_name camber_height_mm
% @values v7=7.0 unk_camber_height_mm=Unknown
% @importance 0.85

0.80::true_val(camber_height_mm, v7); 0.20::true_val(camber_height_mm, unk_camber_height_mm).

measured(s11, camber_height_mm, v7).

all_consistent(camber_height_mm) :-
    consistent(s11, camber_height_mm).

evidence(all_consistent(camber_height_mm)).
query(true_val(camber_height_mm, v7)).
query(true_val(camber_height_mm, unk_camber_height_mm)).

0.82::acc(s_merch, flex_rating_10).
0.88::acc(s29, flex_rating_10).
0.86::acc(s11, flex_rating_10).
0.78::acc(s26, flex_rating_10).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v3_5=3.5 v5=5.0 v6=6.0 v6_5=6.5
% @importance 0.875

0.25::true_val(flex_rating_10, v3_5); 0.25::true_val(flex_rating_10, v5); 0.30::true_val(flex_rating_10, v6); 0.20::true_val(flex_rating_10, v6_5).

measured(s_merch, flex_rating_10, v3_5).
measured(s29, flex_rating_10, v6).
measured(s11, flex_rating_10, v5).
measured(s26, flex_rating_10, v6_5).

all_consistent(flex_rating_10) :-
    consistent(s_merch, flex_rating_10),
    consistent(s29, flex_rating_10),
    consistent(s11, flex_rating_10),
    consistent(s26, flex_rating_10).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v3_5)).
query(true_val(flex_rating_10, v5)).
query(true_val(flex_rating_10, v6)).
query(true_val(flex_rating_10, v6_5)).

0.80::acc(s82, flex_feel).
0.85::acc(s29, flex_feel).
0.70::acc(s25, flex_feel).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values stiff=Stiff medium=Medium
% @importance 0.77

0.30::true_val(flex_feel, stiff); 0.70::true_val(flex_feel, medium).

measured(s82, flex_feel, stiff).
measured(s29, flex_feel, medium).
measured(s25, flex_feel, medium).

all_consistent(flex_feel) :-
    (indep(s82), consistent(s82, flex_feel) ; \+indep(s82)),
    consistent(s29, flex_feel),
    consistent(s25, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, stiff)).
query(true_val(flex_feel, medium)).

0.92::acc(s1, core_material).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values super_fly_ii_700g=Super_Fly_II_700G_Core unk_core_material=Unknown
% @importance 0.925

0.92::true_val(core_material, super_fly_ii_700g); 0.08::true_val(core_material, unk_core_material).

measured(s1, core_material, super_fly_ii_700g).

all_consistent(core_material) :-
    (indep(s1), consistent(s1, core_material) ; \+indep(s1)).

evidence(all_consistent(core_material)).
query(true_val(core_material, super_fly_ii_700g)).
query(true_val(core_material, unk_core_material)).

0.93::acc(s29, sustainability_certification).
0.95::acc(s106, sustainability_certification).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values fsc_certified=FSC_Certified unk_sustainability_certification=Unknown
% @importance 0.7

0.97::true_val(sustainability_certification, fsc_certified); 0.03::true_val(sustainability_certification, unk_sustainability_certification).

measured(s29, sustainability_certification, fsc_certified).
measured(s106, sustainability_certification, fsc_certified).

all_consistent(sustainability_certification) :-
    consistent(s29, sustainability_certification),
    consistent(s106, sustainability_certification).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, fsc_certified)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

0.92::acc(s1, construction_material_innovation).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values dualzone_egd=Dualzone_EGD_Engineered_Grain_Direction unk_construction_material_innovation=Unknown
% @importance 0.925

0.92::true_val(construction_material_innovation, dualzone_egd); 0.08::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s1, construction_material_innovation, dualzone_egd).

all_consistent(construction_material_innovation) :-
    (indep(s1), consistent(s1, construction_material_innovation) ; \+indep(s1)).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, dualzone_egd)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

0.92::acc(s1, construction_material_innovation_squeezebox).

% @attr construction_material_innovation_squeezebox
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values squeezebox=Squeezebox_thick_thin_core_sections unk_construction_material_innovation_squeezebox=Unknown
% @importance 0.925

0.92::true_val(construction_material_innovation_squeezebox, squeezebox); 0.08::true_val(construction_material_innovation_squeezebox, unk_construction_material_innovation_squeezebox).

measured(s1, construction_material_innovation_squeezebox, squeezebox).

all_consistent(construction_material_innovation_squeezebox) :-
    (indep(s1), consistent(s1, construction_material_innovation_squeezebox) ; \+indep(s1)).

evidence(all_consistent(construction_material_innovation_squeezebox)).
query(true_val(construction_material_innovation_squeezebox, squeezebox)).
query(true_val(construction_material_innovation_squeezebox, unk_construction_material_innovation_squeezebox)).

0.90::acc(s1, laminate).
0.80::acc(s110, laminate).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values triax_fiberglass=Triax_Fiberglass_45_45_0 unk_laminate=Unknown
% @importance 0.775

0.95::true_val(laminate, triax_fiberglass); 0.05::true_val(laminate, unk_laminate).

measured(s1, laminate, triax_fiberglass).
measured(s110, laminate, triax_fiberglass).

all_consistent(laminate) :-
    (indep(s1), consistent(s1, laminate) ; \+indep(s1)),
    (indep(s110), consistent(s110, laminate) ; \+indep(s110)).

evidence(all_consistent(laminate)).
query(true_val(laminate, triax_fiberglass)).
query(true_val(laminate, unk_laminate)).

0.90::acc(s1, resin).

% @attr resin
% @type categorical
% @canonical false
% @original_name resin
% @values super_sap_epoxy=Super_Sap_Epoxy unk_resin=Unknown
% @importance 0.825

0.90::true_val(resin, super_sap_epoxy); 0.10::true_val(resin, unk_resin).

measured(s1, resin, super_sap_epoxy).

all_consistent(resin) :-
    (indep(s1), consistent(s1, resin) ; \+indep(s1)).

evidence(all_consistent(resin)).
query(true_val(resin, super_sap_epoxy)).
query(true_val(resin, unk_resin)).

0.90::acc(s1, sustainability_certification_resin).

% @attr sustainability_certification_resin
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values carbon_reduction_50pct=Bio_based_resin_50pct_carbon_reduction unk_sustainability_certification_resin=Unknown
% @importance 0.725

0.90::true_val(sustainability_certification_resin, carbon_reduction_50pct); 0.10::true_val(sustainability_certification_resin, unk_sustainability_certification_resin).

measured(s1, sustainability_certification_resin, carbon_reduction_50pct).

all_consistent(sustainability_certification_resin) :-
    (indep(s1), consistent(s1, sustainability_certification_resin) ; \+indep(s1)).

evidence(all_consistent(sustainability_certification_resin)).
query(true_val(sustainability_certification_resin, carbon_reduction_50pct)).
query(true_val(sustainability_certification_resin, unk_sustainability_certification_resin)).

0.92::acc(s1, base_type).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values sintered=Sintered unk_base_type=Unknown
% @importance 0.925

0.92::true_val(base_type, sintered); 0.08::true_val(base_type, unk_base_type).

measured(s1, base_type, sintered).

all_consistent(base_type) :-
    (indep(s1), consistent(s1, base_type) ; \+indep(s1)).

evidence(all_consistent(base_type)).
query(true_val(base_type, sintered)).
query(true_val(base_type, unk_base_type)).

0.90::acc(s1, base_material).

% @attr base_material
% @type categorical
% @canonical false
% @original_name base_material
% @values sintered_porous_wax=Durable_highly_porous_superior_wax_absorption unk_base_material=Unknown
% @importance 0.95

0.90::true_val(base_material, sintered_porous_wax); 0.10::true_val(base_material, unk_base_material).

measured(s1, base_material, sintered_porous_wax).

all_consistent(base_material) :-
    (indep(s1), consistent(s1, base_material) ; \+indep(s1)).

evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_porous_wax)).
query(true_val(base_material, unk_base_material)).

0.90::acc(s1, edge_technology).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values frostbite_edges=Frostbite_Edges_extend_from_sidewall unk_edge_technology=Unknown
% @importance 0.825

0.90::true_val(edge_technology, frostbite_edges); 0.10::true_val(edge_technology, unk_edge_technology).

measured(s1, edge_technology, frostbite_edges).

all_consistent(edge_technology) :-
    (indep(s1), consistent(s1, edge_technology) ; \+indep(s1)).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, frostbite_edges)).
query(true_val(edge_technology, unk_edge_technology)).

0.88::acc(s_merch, construction_material_innovation_protip).

% @attr construction_material_innovation_protip
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values protip=Pro_Tip_reduced_swing_weight unk_construction_material_innovation_protip=Unknown
% @importance 0.85

0.88::true_val(construction_material_innovation_protip, protip); 0.12::true_val(construction_material_innovation_protip, unk_construction_material_innovation_protip).

measured(s_merch, construction_material_innovation_protip, protip).

all_consistent(construction_material_innovation_protip) :-
    consistent(s_merch, construction_material_innovation_protip).

evidence(all_consistent(construction_material_innovation_protip)).
query(true_val(construction_material_innovation_protip, protip)).
query(true_val(construction_material_innovation_protip, unk_construction_material_innovation_protip)).

0.90::acc(s1, construction_material_innovation_infinite_ride).

% @attr construction_material_innovation_infinite_ride
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values infinite_ride=Infinite_Ride_overbuilt_machine_broken_in unk_construction_material_innovation_infinite_ride=Unknown
% @importance 0.825

0.90::true_val(construction_material_innovation_infinite_ride, infinite_ride); 0.10::true_val(construction_material_innovation_infinite_ride, unk_construction_material_innovation_infinite_ride).

measured(s1, construction_material_innovation_infinite_ride, infinite_ride).

all_consistent(construction_material_innovation_infinite_ride) :-
    (indep(s1), consistent(s1, construction_material_innovation_infinite_ride) ; \+indep(s1)).

evidence(all_consistent(construction_material_innovation_infinite_ride)).
query(true_val(construction_material_innovation_infinite_ride, infinite_ride)).
query(true_val(construction_material_innovation_infinite_ride, unk_construction_material_innovation_infinite_ride)).

0.92::acc(s1, mounting_pattern).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values the_channel=The_Channel_all_brands_compatible unk_mounting_pattern=Unknown
% @importance 0.925

0.92::true_val(mounting_pattern, the_channel); 0.08::true_val(mounting_pattern, unk_mounting_pattern).

measured(s1, mounting_pattern, the_channel).

all_consistent(mounting_pattern) :-
    (indep(s1), consistent(s1, mounting_pattern) ; \+indep(s1)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, the_channel)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

0.82::acc(s13, binding_compatibility).

% @attr binding_compatibility
% @type categorical
% @canonical false
% @original_name binding_compatibility
% @values best_with_est=Works_best_with_Burton_EST_bindings unk_binding_compatibility=Unknown
% @importance 0.8

0.75::true_val(binding_compatibility, best_with_est); 0.25::true_val(binding_compatibility, unk_binding_compatibility).

measured(s13, binding_compatibility, best_with_est).

all_consistent(binding_compatibility) :-
    (indep(s13), consistent(s13, binding_compatibility) ; \+indep(s13)).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, best_with_est)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

0.78::acc(s24, channel_system_history).

% @attr channel_system_history
% @type categorical
% @canonical false
% @original_name Channel system replaced Burton 3D mounting pattern in 2014
% @values replaced_3d_2014=Replaced_3D_pattern_in_2014 unk_channel_system_history=Unknown
% @importance 0.5

0.72::true_val(channel_system_history, replaced_3d_2014); 0.28::true_val(channel_system_history, unk_channel_system_history).

measured(s24, channel_system_history, replaced_3d_2014).

all_consistent(channel_system_history) :-
    (indep(s24), consistent(s24, channel_system_history) ; \+indep(s24)).

evidence(all_consistent(channel_system_history)).
query(true_val(channel_system_history, replaced_3d_2014)).
query(true_val(channel_system_history, unk_channel_system_history)).

0.92::acc(s_merch, available_sizes).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values s152_155_157_159_162=152_155_157_159_162cm unk_available_sizes=Unknown
% @importance 0.85

0.92::true_val(available_sizes, s152_155_157_159_162); 0.08::true_val(available_sizes, unk_available_sizes).

measured(s_merch, available_sizes, s152_155_157_159_162).

all_consistent(available_sizes) :-
    consistent(s_merch, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, s152_155_157_159_162)).
query(true_val(available_sizes, unk_available_sizes)).

0.92::acc(s_merch, available_sizes_wide).

% @attr available_sizes_wide
% @type categorical
% @canonical false
% @original_name available_sizes
% @values w155_157_159_162=155W_157W_159W_162W unk_available_sizes_wide=Unknown
% @importance 0.85

0.92::true_val(available_sizes_wide, w155_157_159_162); 0.08::true_val(available_sizes_wide, unk_available_sizes_wide).

measured(s_merch, available_sizes_wide, w155_157_159_162).

all_consistent(available_sizes_wide) :-
    consistent(s_merch, available_sizes_wide).

evidence(all_consistent(available_sizes_wide)).
query(true_val(available_sizes_wide, w155_157_159_162)).
query(true_val(available_sizes_wide, unk_available_sizes_wide)).

0.92::acc(s_merch, effective_edge_157).

% @attr effective_edge_157
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge (157cm)
% @values v1215=1215.0 unk_effective_edge_157=Unknown
% @importance 0.85

0.92::true_val(effective_edge_157, v1215); 0.08::true_val(effective_edge_157, unk_effective_edge_157).

measured(s_merch, effective_edge_157, v1215).

all_consistent(effective_edge_157) :-
    consistent(s_merch, effective_edge_157).

evidence(all_consistent(effective_edge_157)).
query(true_val(effective_edge_157, v1215)).
query(true_val(effective_edge_157, unk_effective_edge_157)).

0.92::acc(s_merch, sidecut_radius_size).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size
% @values v8_1=8.1 unk_sidecut_radius_size=Unknown
% @importance 0.85

0.92::true_val(sidecut_radius_size, v8_1); 0.08::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s_merch, sidecut_radius_size, v8_1).

all_consistent(sidecut_radius_size) :-
    consistent(s_merch, sidecut_radius_size).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v8_1)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

0.92::acc(s_merch, waist_width_157).

% @attr waist_width_157
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width (157cm)
% @values v252=252.0 unk_waist_width_157=Unknown
% @importance 0.85

0.92::true_val(waist_width_157, v252); 0.08::true_val(waist_width_157, unk_waist_width_157).

measured(s_merch, waist_width_157, v252).

all_consistent(waist_width_157) :-
    consistent(s_merch, waist_width_157).

evidence(all_consistent(waist_width_157)).
query(true_val(waist_width_157, v252)).
query(true_val(waist_width_157, unk_waist_width_157)).

0.92::acc(s_merch, tip_tail_width_size).

% @attr tip_tail_width_size
% @type numeric
% @unit mm
% @canonical true
% @original_name tip_tail_width_size
% @values v294_9=294.9 unk_tip_tail_width_size=Unknown
% @importance 0.85

0.92::true_val(tip_tail_width_size, v294_9); 0.08::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s_merch, tip_tail_width_size, v294_9).

all_consistent(tip_tail_width_size) :-
    consistent(s_merch, tip_tail_width_size).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v294_9)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

0.92::acc(s_merch, stance_width_range_size).

% @attr stance_width_range_size
% @type numeric
% @unit mm
% @canonical true
% @original_name stance_width_range_size
% @values v560=560.0 unk_stance_width_range_size=Unknown
% @importance 0.85

0.92::true_val(stance_width_range_size, v560); 0.08::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s_merch, stance_width_range_size, v560).

all_consistent(stance_width_range_size) :-
    consistent(s_merch, stance_width_range_size).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v560)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

0.92::acc(s_merch, recommended_weight_range_size).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size
% @values kg68_91=68_91kg_150_200lbs unk_recommended_weight_range_size=Unknown
% @importance 0.85

0.92::true_val(recommended_weight_range_size, kg68_91); 0.08::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s_merch, recommended_weight_range_size, kg68_91).

all_consistent(recommended_weight_range_size) :-
    consistent(s_merch, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, kg68_91)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

0.85::acc(s13, terrain_suitability_park).

% @attr terrain_suitability_park
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability
% @values v5=5.0 unk_terrain_suitability_park=Unknown
% @importance 0.8

0.80::true_val(terrain_suitability_park, v5); 0.20::true_val(terrain_suitability_park, unk_terrain_suitability_park).

measured(s13, terrain_suitability_park, v5).

all_consistent(terrain_suitability_park) :-
    (indep(s13), consistent(s13, terrain_suitability_park) ; \+indep(s13)).

evidence(all_consistent(terrain_suitability_park)).
query(true_val(terrain_suitability_park, v5)).
query(true_val(terrain_suitability_park, unk_terrain_suitability_park)).

0.85::acc(s13, terrain_suitability).

% @attr terrain_suitability
% @type numeric
% @unit /10
% @canonical true
% @original_name terrain_suitability
% @values v10=10.0 unk_terrain_suitability=Unknown
% @importance 0.8

0.80::true_val(terrain_suitability, v10); 0.20::true_val(terrain_suitability, unk_terrain_suitability).

measured(s13, terrain_suitability, v10).

all_consistent(terrain_suitability) :-
    (indep(s13), consistent(s13, terrain_suitability) ; \+indep(s13)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, v10)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

0.85::acc(s13, terrain_suitability_powder).

% @attr terrain_suitability_powder
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability
% @values v6=6.0 unk_terrain_suitability_powder=Unknown
% @importance 0.8

0.80::true_val(terrain_suitability_powder, v6); 0.20::true_val(terrain_suitability_powder, unk_terrain_suitability_powder).

measured(s13, terrain_suitability_powder, v6).

all_consistent(terrain_suitability_powder) :-
    (indep(s13), consistent(s13, terrain_suitability_powder) ; \+indep(s13)).

evidence(all_consistent(terrain_suitability_powder)).
query(true_val(terrain_suitability_powder, v6)).
query(true_val(terrain_suitability_powder, unk_terrain_suitability_powder)).

0.85::acc(s_merch, skill_level_recommendation).
0.88::acc(s11, skill_level_recommendation).
0.85::acc(s29, skill_level_recommendation).
0.78::acc(s26, skill_level_recommendation).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values beginner_intermediate=Beginner_Intermediate intermediate_advanced=Intermediate_Advanced beginner_to_advanced=Beginner_to_Advanced
% @importance 0.79

0.25::true_val(skill_level_recommendation, beginner_intermediate); 0.45::true_val(skill_level_recommendation, intermediate_advanced); 0.30::true_val(skill_level_recommendation, beginner_to_advanced).

measured(s_merch, skill_level_recommendation, beginner_intermediate).
measured(s11, skill_level_recommendation, intermediate_advanced).
measured(s29, skill_level_recommendation, beginner_to_advanced).
measured(s26, skill_level_recommendation, intermediate_advanced).

all_consistent(skill_level_recommendation) :-
    consistent(s_merch, skill_level_recommendation),
    consistent(s11, skill_level_recommendation),
    consistent(s29, skill_level_recommendation),
    consistent(s26, skill_level_recommendation).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, beginner_intermediate)).
query(true_val(skill_level_recommendation, intermediate_advanced)).
query(true_val(skill_level_recommendation, beginner_to_advanced)).

0.85::acc(s11, overall_rating_snowboardingprofiles).

% @attr overall_rating_snowboardingprofiles
% @type numeric
% @unit /100
% @canonical true
% @original_name overall_rating_snowboardingprofiles
% @values v83_1=83.1 v84_6=84.6
% @importance 0.85

0.50::true_val(overall_rating_snowboardingprofiles, v83_1); 0.50::true_val(overall_rating_snowboardingprofiles, v84_6).

measured(s11, overall_rating_snowboardingprofiles, v83_1).
measured(s11, overall_rating_snowboardingprofiles, v84_6).

all_consistent(overall_rating_snowboardingprofiles) :-
    consistent(s11, overall_rating_snowboardingprofiles).

evidence(all_consistent(overall_rating_snowboardingprofiles)).
query(true_val(overall_rating_snowboardingprofiles, v83_1)).
query(true_val(overall_rating_snowboardingprofiles, v84_6)).

0.85::acc(s11, powder_score_snowboardingprofiles).

% @attr powder_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical false
% @original_name powder_score_snowboardingprofiles
% @values v2_5=2.5 unk_powder_score_snowboardingprofiles=Unknown
% @importance 0.85

0.80::true_val(powder_score_snowboardingprofiles, v2_5); 0.20::true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles).

measured(s11, powder_score_snowboardingprofiles, v2_5).

all_consistent(powder_score_snowboardingprofiles) :-
    consistent(s11, powder_score_snowboardingprofiles).

evidence(all_consistent(powder_score_snowboardingprofiles)).
query(true_val(powder_score_snowboardingprofiles, v2_5)).
query(true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles)).

0.85::acc(s11, carving_score_snowboardingprofiles).

% @attr carving_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical false
% @original_name carving_score_snowboardingprofiles
% @values v3=3.0 unk_carving_score_snowboardingprofiles=Unknown
% @importance 0.85

0.80::true_val(carving_score_snowboardingprofiles, v3); 0.20::true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles).

measured(s11, carving_score_snowboardingprofiles, v3).

all_consistent(carving_score_snowboardingprofiles) :-
    consistent(s11, carving_score_snowboardingprofiles).

evidence(all_consistent(carving_score_snowboardingprofiles)).
query(true_val(carving_score_snowboardingprofiles, v3)).
query(true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles)).

0.88::acc(s11, turn_initiation_performance).
0.85::acc(s29, turn_initiation_performance).

% @attr turn_initiation_performance
% @type numeric
% @unit /5
% @canonical true
% @original_name turn_initiation_performance
% @values v4=4.0 unk_turn_initiation_performance=Unknown
% @importance 0.875

0.95::true_val(turn_initiation_performance, v4); 0.05::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s11, turn_initiation_performance, v4).
measured(s29, turn_initiation_performance, v4).

all_consistent(turn_initiation_performance) :-
    consistent(s11, turn_initiation_performance),
    consistent(s29, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, v4)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

0.85::acc(s11, speed_score_sp).

% @attr speed_score_sp
% @type numeric
% @unit /5
% @canonical false
% @original_name Snowboarding Profiles speed score
% @values v3=3.0 unk_speed_score_sp=Unknown
% @importance 0.85

0.80::true_val(speed_score_sp, v3); 0.20::true_val(speed_score_sp, unk_speed_score_sp).

measured(s11, speed_score_sp, v3).

all_consistent(speed_score_sp) :-
    consistent(s11, speed_score_sp).

evidence(all_consistent(speed_score_sp)).
query(true_val(speed_score_sp, v3)).
query(true_val(speed_score_sp, unk_speed_score_sp)).

0.85::acc(s11, crud_score_sp).

% @attr crud_score_sp
% @type numeric
% @unit /5
% @canonical false
% @original_name Snowboarding Profiles crud score
% @values v3=3.0 unk_crud_score_sp=Unknown
% @importance 0.85

0.80::true_val(crud_score_sp, v3); 0.20::true_val(crud_score_sp, unk_crud_score_sp).

measured(s11, crud_score_sp, v3).

all_consistent(crud_score_sp) :-
    consistent(s11, crud_score_sp).

evidence(all_consistent(crud_score_sp)).
query(true_val(crud_score_sp, v3)).
query(true_val(crud_score_sp, unk_crud_score_sp)).

0.85::acc(s11, trees_score_sp).

% @attr trees_score_sp
% @type numeric
% @unit /5
% @canonical false
% @original_name Snowboarding Profiles trees score
% @values v4=4.0 unk_trees_score_sp=Unknown
% @importance 0.85

0.80::true_val(trees_score_sp, v4); 0.20::true_val(trees_score_sp, unk_trees_score_sp).

measured(s11, trees_score_sp, v4).

all_consistent(trees_score_sp) :-
    consistent(s11, trees_score_sp).

evidence(all_consistent(trees_score_sp)).
query(true_val(trees_score_sp, v4)).
query(true_val(trees_score_sp, unk_trees_score_sp)).

0.85::acc(s11, switch_score_sp).

% @attr switch_score_sp
% @type numeric
% @unit /5
% @canonical false
% @original_name Snowboarding Profiles switch score
% @values v4=4.0 unk_switch_score_sp=Unknown
% @importance 0.85

0.80::true_val(switch_score_sp, v4); 0.20::true_val(switch_score_sp, unk_switch_score_sp).

measured(s11, switch_score_sp, v4).

all_consistent(switch_score_sp) :-
    consistent(s11, switch_score_sp).

evidence(all_consistent(switch_score_sp)).
query(true_val(switch_score_sp, v4)).
query(true_val(switch_score_sp, unk_switch_score_sp)).

0.85::acc(s11, jumps_score_sp).

% @attr jumps_score_sp
% @type numeric
% @unit /5
% @canonical false
% @original_name Snowboarding Profiles jumps score
% @values v4=4.0 unk_jumps_score_sp=Unknown
% @importance 0.85

0.80::true_val(jumps_score_sp, v4); 0.20::true_val(jumps_score_sp, unk_jumps_score_sp).

measured(s11, jumps_score_sp, v4).

all_consistent(jumps_score_sp) :-
    consistent(s11, jumps_score_sp).

evidence(all_consistent(jumps_score_sp)).
query(true_val(jumps_score_sp, v4)).
query(true_val(jumps_score_sp, unk_jumps_score_sp)).

0.85::acc(s11, spins_score_sp).

% @attr spins_score_sp
% @type numeric
% @unit /5
% @canonical false
% @original_name Snowboarding Profiles spins score
% @values v4=4.0 unk_spins_score_sp=Unknown
% @importance 0.85

0.80::true_val(spins_score_sp, v4); 0.20::true_val(spins_score_sp, unk_spins_score_sp).

measured(s11, spins_score_sp, v4).

all_consistent(spins_score_sp) :-
    consistent(s11, spins_score_sp).

evidence(all_consistent(spins_score_sp)).
query(true_val(spins_score_sp, v4)).
query(true_val(spins_score_sp, unk_spins_score_sp)).

0.85::acc(s11, butters_score_sp).

% @attr butters_score_sp
% @type numeric
% @unit /5
% @canonical false
% @original_name Snowboarding Profiles butters score
% @values v4=4.0 unk_butters_score_sp=Unknown
% @importance 0.85

0.80::true_val(butters_score_sp, v4); 0.20::true_val(butters_score_sp, unk_butters_score_sp).

measured(s11, butters_score_sp, v4).

all_consistent(butters_score_sp) :-
    consistent(s11, butters_score_sp).

evidence(all_consistent(butters_score_sp)).
query(true_val(butters_score_sp, v4)).
query(true_val(butters_score_sp, unk_butters_score_sp)).

0.85::acc(s11, rails_score_sp).

% @attr rails_score_sp
% @type numeric
% @unit /5
% @canonical false
% @original_name Snowboarding Profiles rails score
% @values v3_5=3.5 unk_rails_score_sp=Unknown
% @importance 0.85

0.80::true_val(rails_score_sp, v3_5); 0.20::true_val(rails_score_sp, unk_rails_score_sp).

measured(s11, rails_score_sp, v3_5).

all_consistent(rails_score_sp) :-
    consistent(s11, rails_score_sp).

evidence(all_consistent(rails_score_sp)).
query(true_val(rails_score_sp, v3_5)).
query(true_val(rails_score_sp, unk_rails_score_sp)).

0.90::acc(s_merch, merchant_avg_review_rating).

% @attr merchant_avg_review_rating
% @type numeric
% @unit /5
% @canonical false
% @original_name Merchant average review rating
% @values v5_0=5.0 unk_merchant_avg_review_rating=Unknown
% @importance 0.85

0.85::true_val(merchant_avg_review_rating, v5_0); 0.15::true_val(merchant_avg_review_rating, unk_merchant_avg_review_rating).

measured(s_merch, merchant_avg_review_rating, v5_0).

all_consistent(merchant_avg_review_rating) :-
    consistent(s_merch, merchant_avg_review_rating).

evidence(all_consistent(merchant_avg_review_rating)).
query(true_val(merchant_avg_review_rating, v5_0)).
query(true_val(merchant_avg_review_rating, unk_merchant_avg_review_rating)).

0.65::acc(s25, reviewer_opinion_the_good_ride).

% @attr reviewer_opinion_the_good_ride
% @type numeric
% @unit /5
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values v4_0=4.0 unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.5

0.55::true_val(reviewer_opinion_the_good_ride, v4_0); 0.45::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s25, reviewer_opinion_the_good_ride, v4_0).

all_consistent(reviewer_opinion_the_good_ride) :-
    consistent(s25, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, v4_0)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

0.60::acc(s27, user_review_forum).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values positive_159_fun=Positive_159cm_fun_turns_holds_well unk_user_review_forum=Unknown
% @importance 0.7

0.55::true_val(user_review_forum, positive_159_fun); 0.45::true_val(user_review_forum, unk_user_review_forum).

measured(s27, user_review_forum, positive_159_fun).

all_consistent(user_review_forum) :-
    consistent(s27, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, positive_159_fun)).
query(true_val(user_review_forum, unk_user_review_forum)).

0.85::acc(s11, pop).
0.78::acc(s26, pop).

% @attr pop
% @type categorical
% @canonical false
% @original_name pop
% @values easy_good_snap=Easy_access_good_snap_from_PurePop unk_pop=Unknown
% @importance 0.875

0.95::true_val(pop, easy_good_snap); 0.05::true_val(pop, unk_pop).

measured(s11, pop, easy_good_snap).
measured(s26, pop, easy_good_snap).

all_consistent(pop) :-
    consistent(s11, pop),
    consistent(s26, pop).

evidence(all_consistent(pop)).
query(true_val(pop, easy_good_snap)).
query(true_val(pop, unk_pop)).

0.85::acc(s11, positive_aspect).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values agile_easy_pop_sidehits=Agile_easy_pop_confidence_side_hits unk_positive_aspect=Unknown
% @importance 0.9

0.80::true_val(positive_aspect, agile_easy_pop_sidehits); 0.20::true_val(positive_aspect, unk_positive_aspect).

measured(s11, positive_aspect, agile_easy_pop_sidehits).

all_consistent(positive_aspect) :-
    consistent(s11, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, agile_easy_pop_sidehits)).
query(true_val(positive_aspect, unk_positive_aspect)).

0.85::acc(s11, switch_riding).

% @attr switch_riding
% @type categorical
% @canonical false
% @original_name switch_riding
% @values really_good=Really_good_easy_transitions unk_switch_riding=Unknown
% @importance 0.9

0.80::true_val(switch_riding, really_good); 0.20::true_val(switch_riding, unk_switch_riding).

measured(s11, switch_riding, really_good).

all_consistent(switch_riding) :-
    consistent(s11, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, really_good)).
query(true_val(switch_riding, unk_switch_riding)).

0.85::acc(s11, positive_aspect_buttering).

% @attr positive_aspect_buttering
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values easy_butter=Nice_easy_to_butter_no_over_flexing unk_positive_aspect_buttering=Unknown
% @importance 0.85

0.80::true_val(positive_aspect_buttering, easy_butter); 0.20::true_val(positive_aspect_buttering, unk_positive_aspect_buttering).

measured(s11, positive_aspect_buttering, easy_butter).

all_consistent(positive_aspect_buttering) :-
    consistent(s11, positive_aspect_buttering).

evidence(all_consistent(positive_aspect_buttering)).
query(true_val(positive_aspect_buttering, easy_butter)).
query(true_val(positive_aspect_buttering, unk_positive_aspect_buttering)).

0.85::acc(s29, positive_aspect_predictability).

% @attr positive_aspect_predictability
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values predictable_sweet_spot=Predictable_huge_sweet_spot unk_positive_aspect_predictability=Unknown
% @importance 0.9

0.82::true_val(positive_aspect_predictability, predictable_sweet_spot); 0.18::true_val(positive_aspect_predictability, unk_positive_aspect_predictability).

measured(s29, positive_aspect_predictability, predictable_sweet_spot).

all_consistent(positive_aspect_predictability) :-
    consistent(s29, positive_aspect_predictability).

evidence(all_consistent(positive_aspect_predictability)).
query(true_val(positive_aspect_predictability, predictable_sweet_spot)).
query(true_val(positive_aspect_predictability, unk_positive_aspect_predictability)).

0.85::acc(s29, freestyle_park_rating).

% @attr freestyle_park_rating
% @type categorical
% @canonical false
% @original_name freestyle_park_rating
% @values twin_switch_solid_pop=Twin_shape_switch_solid_pop_park unk_freestyle_park_rating=Unknown
% @importance 0.9

0.82::true_val(freestyle_park_rating, twin_switch_solid_pop); 0.18::true_val(freestyle_park_rating, unk_freestyle_park_rating).

measured(s29, freestyle_park_rating, twin_switch_solid_pop).

all_consistent(freestyle_park_rating) :-
    consistent(s29, freestyle_park_rating).

evidence(all_consistent(freestyle_park_rating)).
query(true_val(freestyle_park_rating, twin_switch_solid_pop)).
query(true_val(freestyle_park_rating, unk_freestyle_park_rating)).

0.85::acc(s11, positive_aspect_slow_speed).

% @attr positive_aspect_slow_speed
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values confident_fun_slow=Confident_decisive_fun_at_slow_speeds unk_positive_aspect_slow_speed=Unknown
% @importance 0.9

0.80::true_val(positive_aspect_slow_speed, confident_fun_slow); 0.20::true_val(positive_aspect_slow_speed, unk_positive_aspect_slow_speed).

measured(s11, positive_aspect_slow_speed, confident_fun_slow).

all_consistent(positive_aspect_slow_speed) :-
    consistent(s11, positive_aspect_slow_speed).

evidence(all_consistent(positive_aspect_slow_speed)).
query(true_val(positive_aspect_slow_speed, confident_fun_slow)).
query(true_val(positive_aspect_slow_speed, unk_positive_aspect_slow_speed)).

0.78::acc(s30, positive_aspect_versatility).

% @attr positive_aspect_versatility
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values all_movement_types=Allows_butters_carving_rotations_powder unk_positive_aspect_versatility=Unknown
% @importance 0.7

0.70::true_val(positive_aspect_versatility, all_movement_types); 0.30::true_val(positive_aspect_versatility, unk_positive_aspect_versatility).

measured(s30, positive_aspect_versatility, all_movement_types).

all_consistent(positive_aspect_versatility) :-
    consistent(s30, positive_aspect_versatility).

evidence(all_consistent(positive_aspect_versatility)).
query(true_val(positive_aspect_versatility, all_movement_types)).
query(true_val(positive_aspect_versatility, unk_positive_aspect_versatility)).

0.78::acc(s30, positive_aspect_weight).

% @attr positive_aspect_weight
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values lighter_core_easy_maneuver=Reduced_weight_lighter_wood_core_easy_maneuver unk_positive_aspect_weight=Unknown
% @importance 0.7

0.70::true_val(positive_aspect_weight, lighter_core_easy_maneuver); 0.30::true_val(positive_aspect_weight, unk_positive_aspect_weight).

measured(s30, positive_aspect_weight, lighter_core_easy_maneuver).

all_consistent(positive_aspect_weight) :-
    consistent(s30, positive_aspect_weight).

evidence(all_consistent(positive_aspect_weight)).
query(true_val(positive_aspect_weight, lighter_core_easy_maneuver)).
query(true_val(positive_aspect_weight, unk_positive_aspect_weight)).

0.85::acc(s11, negative_aspect).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values shy_hesitant_fast=Shy_hesitant_awkward_at_fast_speeds unk_negative_aspect=Unknown
% @importance 0.9

0.80::true_val(negative_aspect, shy_hesitant_fast); 0.20::true_val(negative_aspect, unk_negative_aspect).

measured(s11, negative_aspect, shy_hesitant_fast).

all_consistent(negative_aspect) :-
    consistent(s11, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, shy_hesitant_fast)).
query(true_val(negative_aspect, unk_negative_aspect)).

0.85::acc(s29, negative_aspect_stability).

% @attr negative_aspect_stability
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values not_stable_speed_limit=Not_most_stable_has_speed_limit unk_negative_aspect_stability=Unknown
% @importance 0.9

0.82::true_val(negative_aspect_stability, not_stable_speed_limit); 0.18::true_val(negative_aspect_stability, unk_negative_aspect_stability).

measured(s29, negative_aspect_stability, not_stable_speed_limit).

all_consistent(negative_aspect_stability) :-
    consistent(s29, negative_aspect_stability).

evidence(all_consistent(negative_aspect_stability)).
query(true_val(negative_aspect_stability, not_stable_speed_limit)).
query(true_val(negative_aspect_stability, unk_negative_aspect_stability)).

0.85::acc(s11, negative_aspect_carving).

% @attr negative_aspect_carving
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values washy_high_speed_carves=Washy_during_high_speed_low_angle_carves unk_negative_aspect_carving=Unknown
% @importance 0.9

0.80::true_val(negative_aspect_carving, washy_high_speed_carves); 0.20::true_val(negative_aspect_carving, unk_negative_aspect_carving).

measured(s11, negative_aspect_carving, washy_high_speed_carves).

all_consistent(negative_aspect_carving) :-
    consistent(s11, negative_aspect_carving).

evidence(all_consistent(negative_aspect_carving)).
query(true_val(negative_aspect_carving, washy_high_speed_carves)).
query(true_val(negative_aspect_carving, unk_negative_aspect_carving)).

0.85::acc(s11, chatter_performance).

% @attr chatter_performance
% @type categorical
% @canonical true
% @original_name chatter_performance
% @values chattery_not_damp=Chattery_bucked_around_uneven_terrain unk_chatter_performance=Unknown
% @importance 0.85

0.80::true_val(chatter_performance, chattery_not_damp); 0.20::true_val(chatter_performance, unk_chatter_performance).

measured(s11, chatter_performance, chattery_not_damp).

all_consistent(chatter_performance) :-
    consistent(s11, chatter_performance).

evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, chattery_not_damp)).
query(true_val(chatter_performance, unk_chatter_performance)).

0.85::acc(s11, negative_aspect_powder).

% @attr negative_aspect_powder
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values not_great_powder=Not_great_in_powder_sinks unk_negative_aspect_powder=Unknown
% @importance 0.9

0.80::true_val(negative_aspect_powder, not_great_powder); 0.20::true_val(negative_aspect_powder, unk_negative_aspect_powder).

measured(s11, negative_aspect_powder, not_great_powder).

all_consistent(negative_aspect_powder) :-
    consistent(s11, negative_aspect_powder).

evidence(all_consistent(negative_aspect_powder)).
query(true_val(negative_aspect_powder, not_great_powder)).
query(true_val(negative_aspect_powder, unk_negative_aspect_powder)).

0.85::acc(s11, negative_aspect_landings).

% @attr negative_aspect_landings
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values not_stable_landings=Not_stable_on_fast_approaches_larger_jumps unk_negative_aspect_landings=Unknown
% @importance 0.9

0.80::true_val(negative_aspect_landings, not_stable_landings); 0.20::true_val(negative_aspect_landings, unk_negative_aspect_landings).

measured(s11, negative_aspect_landings, not_stable_landings).

all_consistent(negative_aspect_landings) :-
    consistent(s11, negative_aspect_landings).

evidence(all_consistent(negative_aspect_landings)).
query(true_val(negative_aspect_landings, not_stable_landings)).
query(true_val(negative_aspect_landings, unk_negative_aspect_landings)).

0.85::acc(s29, negative_aspect_aggressive_riders).

% @attr negative_aspect_aggressive_riders
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values not_for_aggressive=Not_for_aggressive_hard_charging_riders unk_negative_aspect_aggressive_riders=Unknown
% @importance 0.9

0.82::true_val(negative_aspect_aggressive_riders, not_for_aggressive); 0.18::true_val(negative_aspect_aggressive_riders, unk_negative_aspect_aggressive_riders).

measured(s29, negative_aspect_aggressive_riders, not_for_aggressive).

all_consistent(negative_aspect_aggressive_riders) :-
    consistent(s29, negative_aspect_aggressive_riders).

evidence(all_consistent(negative_aspect_aggressive_riders)).
query(true_val(negative_aspect_aggressive_riders, not_for_aggressive)).
query(true_val(negative_aspect_aggressive_riders, unk_negative_aspect_aggressive_riders)).

0.88::acc(s11, board_weight_grams).

% @attr board_weight_grams
% @type numeric
% @unit g
% @canonical false
% @original_name board_weight_grams
% @values v3100=3100.0 unk_board_weight_grams=Unknown
% @importance 0.85

0.80::true_val(board_weight_grams, v3100); 0.20::true_val(board_weight_grams, unk_board_weight_grams).

measured(s11, board_weight_grams, v3100).

all_consistent(board_weight_grams) :-
    consistent(s11, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v3100)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

0.88::acc(s11, weight_per_cm).

% @attr weight_per_cm
% @type numeric
% @unit g/cm
% @canonical true
% @original_name weight_per_cm
% @values v19_75=19.75 unk_weight_per_cm=Unknown
% @importance 0.85

0.80::true_val(weight_per_cm, v19_75); 0.20::true_val(weight_per_cm, unk_weight_per_cm).

measured(s11, weight_per_cm, v19_75).

all_consistent(weight_per_cm) :-
    consistent(s11, weight_per_cm).

evidence(all_consistent(weight_per_cm)).
query(true_val(weight_per_cm, v19_75)).
query(true_val(weight_per_cm, unk_weight_per_cm)).

0.95::acc(s92, warranty_period_years).

% @attr warranty_period_years
% @type numeric
% @unit years
% @canonical false
% @original_name warranty_period_years
% @values v3=3.0 unk_warranty_period_years=Unknown
% @importance 0.85

0.95::true_val(warranty_period_years, v3); 0.05::true_val(warranty_period_years, unk_warranty_period_years).

measured(s92, warranty_period_years, v3).

all_consistent(warranty_period_years) :-
    consistent(s92, warranty_period_years).

evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v3)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

0.95::acc(s92, warranty).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values defects_repair_replace=Against_manufacturer_defects_repair_or_replace unk_warranty=Unknown
% @importance 0.85

0.95::true_val(warranty, defects_repair_replace); 0.05::true_val(warranty, unk_warranty).

measured(s92, warranty, defects_repair_replace).

all_consistent(warranty) :-
    consistent(s92, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, defects_repair_replace)).
query(true_val(warranty, unk_warranty)).

0.92::acc(s95, warranty_processing).

% @attr warranty_processing
% @type categorical
% @canonical false
% @original_name warranty
% @values w48_2_business_days=Processed_shipped_within_2_business_days unk_warranty_processing=Unknown
% @importance 0.7

0.90::true_val(warranty_processing, w48_2_business_days); 0.10::true_val(warranty_processing, unk_warranty_processing).

measured(s95, warranty_processing, w48_2_business_days).

all_consistent(warranty_processing) :-
    consistent(s95, warranty_processing).

evidence(all_consistent(warranty_processing)).
query(true_val(warranty_processing, w48_2_business_days)).
query(true_val(warranty_processing, unk_warranty_processing)).

0.95::acc(s92, warranty_exclusions).

% @attr warranty_exclusions
% @type categorical
% @canonical false
% @original_name warranty
% @values misuse_abuse_neglect=Misuse_abuse_neglect_improper_mount_normal_wear unk_warranty_exclusions=Unknown
% @importance 0.775

0.95::true_val(warranty_exclusions, misuse_abuse_neglect); 0.05::true_val(warranty_exclusions, unk_warranty_exclusions).

measured(s92, warranty_exclusions, misuse_abuse_neglect).

all_consistent(warranty_exclusions) :-
    consistent(s92, warranty_exclusions).

evidence(all_consistent(warranty_exclusions)).
query(true_val(warranty_exclusions, misuse_abuse_neglect)).
query(true_val(warranty_exclusions, unk_warranty_exclusions)).

0.95::acc(s92, warranty_authorized_dealers).

% @attr warranty_authorized_dealers
% @type categorical
% @canonical false
% @original_name warranty
% @values authorized_dealers_original=Authorized_Burton_Dealers_original_purchaser_only unk_warranty_authorized_dealers=Unknown
% @importance 0.85

0.95::true_val(warranty_authorized_dealers, authorized_dealers_original); 0.05::true_val(warranty_authorized_dealers, unk_warranty_authorized_dealers).

measured(s92, warranty_authorized_dealers, authorized_dealers_original).

all_consistent(warranty_authorized_dealers) :-
    consistent(s92, warranty_authorized_dealers).

evidence(all_consistent(warranty_authorized_dealers)).
query(true_val(warranty_authorized_dealers, authorized_dealers_original)).
query(true_val(warranty_authorized_dealers, unk_warranty_authorized_dealers)).

0.88::acc(s104, sustainability_certification_recycling).

% @attr sustainability_certification_recycling
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values recycles_scrap_closed_loop_water=Recycles_sidewall_base_scrap_closed_loop_water_50pct unk_sustainability_certification_recycling=Unknown
% @importance 0.5

0.81::true_val(sustainability_certification_recycling, recycles_scrap_closed_loop_water); 0.19::true_val(sustainability_certification_recycling, unk_sustainability_certification_recycling).

measured(s104, sustainability_certification_recycling, recycles_scrap_closed_loop_water).

all_consistent(sustainability_certification_recycling) :-
    consistent(s104, sustainability_certification_recycling).

evidence(all_consistent(sustainability_certification_recycling)).
query(true_val(sustainability_certification_recycling, recycles_scrap_closed_loop_water)).
query(true_val(sustainability_certification_recycling, unk_sustainability_certification_recycling)).

0.78::acc(s75, comparable_board_same_brand_custom_shape).

% @attr comparable_board_same_brand_custom_shape
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values custom_directional_process_twin=Custom_directional_twin_Process_true_twin unk_comparable_board_same_brand_custom_shape=Unknown
% @importance 0.8

0.72::true_val(comparable_board_same_brand_custom_shape, custom_directional_process_twin); 0.28::true_val(comparable_board_same_brand_custom_shape, unk_comparable_board_same_brand_custom_shape).

measured(s75, comparable_board_same_brand_custom_shape, custom_directional_process_twin).

all_consistent(comparable_board_same_brand_custom_shape) :-
    consistent(s75, comparable_board_same_brand_custom_shape).

evidence(all_consistent(comparable_board_same_brand_custom_shape)).
query(true_val(comparable_board_same_brand_custom_shape, custom_directional_process_twin)).
query(true_val(comparable_board_same_brand_custom_shape, unk_comparable_board_same_brand_custom_shape)).

0.78::acc(s75, comparable_board_same_brand_custom_flex).

% @attr comparable_board_same_brand_custom_flex
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values custom_stiffer_process_softer=Custom_stiffer_aggressive_Process_softer_playful unk_comparable_board_same_brand_custom_flex=Unknown
% @importance 0.8

0.72::true_val(comparable_board_same_brand_custom_flex, custom_stiffer_process_softer); 0.28::true_val(comparable_board_same_brand_custom_flex, unk_comparable_board_same_brand_custom_flex).

measured(s75, comparable_board_same_brand_custom_flex, custom_stiffer_process_softer).

all_consistent(comparable_board_same_brand_custom_flex) :-
    consistent(s75, comparable_board_same_brand_custom_flex).

evidence(all_consistent(comparable_board_same_brand_custom_flex)).
query(true_val(comparable_board_same_brand_custom_flex, custom_stiffer_process_softer)).
query(true_val(comparable_board_same_brand_custom_flex, unk_comparable_board_same_brand_custom_flex)).

0.78::acc(s72, comparable_board_same_brand_custom_construction).

% @attr comparable_board_same_brand_custom_construction
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values custom_higher_base_carbon=Custom_has_WFO_sintered_base_and_carbon_layer unk_comparable_board_same_brand_custom_construction=Unknown
% @importance 0.8

0.72::true_val(comparable_board_same_brand_custom_construction, custom_higher_base_carbon); 0.28::true_val(comparable_board_same_brand_custom_construction, unk_comparable_board_same_brand_custom_construction).

measured(s72, comparable_board_same_brand_custom_construction, custom_higher_base_carbon).

all_consistent(comparable_board_same_brand_custom_construction) :-
    consistent(s72, comparable_board_same_brand_custom_construction).

evidence(all_consistent(comparable_board_same_brand_custom_construction)).
query(true_val(comparable_board_same_brand_custom_construction, custom_higher_base_carbon)).
query(true_val(comparable_board_same_brand_custom_construction, unk_comparable_board_same_brand_custom_construction)).

0.55::acc(s73, comparable_board_same_brand_custom_terrain).

% @attr comparable_board_same_brand_custom_terrain
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values process_park_custom_am=Process_more_park_Custom_more_all_mountain unk_comparable_board_same_brand_custom_terrain=Unknown
% @importance 0.7

0.50::true_val(comparable_board_same_brand_custom_terrain, process_park_custom_am); 0.50::true_val(comparable_board_same_brand_custom_terrain, unk_comparable_board_same_brand_custom_terrain).

measured(s73, comparable_board_same_brand_custom_terrain, process_park_custom_am).

all_consistent(comparable_board_same_brand_custom_terrain) :-
    consistent(s73, comparable_board_same_brand_custom_terrain).

evidence(all_consistent(comparable_board_same_brand_custom_terrain)).
query(true_val(comparable_board_same_brand_custom_terrain, process_park_custom_am)).
query(true_val(comparable_board_same_brand_custom_terrain, unk_comparable_board_same_brand_custom_terrain)).

0.82::acc(s1, comparable_board_same_brand_price_comparison).
0.78::acc(s75, comparable_board_same_brand_price_comparison).

% @attr comparable_board_same_brand_price_comparison
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values custom_679_process_549=Custom_679_95_vs_Process_549_95 unk_comparable_board_same_brand_price_comparison=Unknown
% @importance 0.85

0.95::true_val(comparable_board_same_brand_price_comparison, custom_679_process_549); 0.05::true_val(comparable_board_same_brand_price_comparison, unk_comparable_board_same_brand_price_comparison).

measured(s1, comparable_board_same_brand_price_comparison, custom_679_process_549).
measured(s75, comparable_board_same_brand_price_comparison, custom_679_process_549).

all_consistent(comparable_board_same_brand_price_comparison) :-
    (indep(s1), consistent(s1, comparable_board_same_brand_price_comparison) ; \+indep(s1)),
    consistent(s75, comparable_board_same_brand_price_comparison).

evidence(all_consistent(comparable_board_same_brand_price_comparison)).
query(true_val(comparable_board_same_brand_price_comparison, custom_679_process_549)).
query(true_val(comparable_board_same_brand_price_comparison, unk_comparable_board_same_brand_price_comparison)).

0.85::acc(s11, comparable_board_same_brand_pop_comparison).

% @attr comparable_board_same_brand_pop_comparison
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values easier_pop_less_total=Process_easier_pop_but_less_total_than_Custom unk_comparable_board_same_brand_pop_comparison=Unknown
% @importance 0.9

0.80::true_val(comparable_board_same_brand_pop_comparison, easier_pop_less_total); 0.20::true_val(comparable_board_same_brand_pop_comparison, unk_comparable_board_same_brand_pop_comparison).

measured(s11, comparable_board_same_brand_pop_comparison, easier_pop_less_total).

all_consistent(comparable_board_same_brand_pop_comparison) :-
    consistent(s11, comparable_board_same_brand_pop_comparison).

evidence(all_consistent(comparable_board_same_brand_pop_comparison)).
query(true_val(comparable_board_same_brand_pop_comparison, easier_pop_less_total)).
query(true_val(comparable_board_same_brand_pop_comparison, unk_comparable_board_same_brand_pop_comparison)).

0.78::acc(s75, comparable_board_same_brand_custom_powder).

% @attr comparable_board_same_brand_custom_powder
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values custom_better_powder=Custom_stiffness_directional_better_in_powder unk_comparable_board_same_brand_custom_powder=Unknown
% @importance 0.8

0.72::true_val(comparable_board_same_brand_custom_powder, custom_better_powder); 0.28::true_val(comparable_board_same_brand_custom_powder, unk_comparable_board_same_brand_custom_powder).

measured(s75, comparable_board_same_brand_custom_powder, custom_better_powder).

all_consistent(comparable_board_same_brand_custom_powder) :-
    consistent(s75, comparable_board_same_brand_custom_powder).

evidence(all_consistent(comparable_board_same_brand_custom_powder)).
query(true_val(comparable_board_same_brand_custom_powder, custom_better_powder)).
query(true_val(comparable_board_same_brand_custom_powder, unk_comparable_board_same_brand_custom_powder)).

0.80::acc(s40, comparable_board_same_brand_flying_v_comparison).

% @attr comparable_board_same_brand_flying_v_comparison
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values fv_forgiving_camber_precise=Flying_V_more_forgiving_Camber_more_edge_hold unk_comparable_board_same_brand_flying_v_comparison=Unknown
% @importance 0.8

0.75::true_val(comparable_board_same_brand_flying_v_comparison, fv_forgiving_camber_precise); 0.25::true_val(comparable_board_same_brand_flying_v_comparison, unk_comparable_board_same_brand_flying_v_comparison).

measured(s40, comparable_board_same_brand_flying_v_comparison, fv_forgiving_camber_precise).

all_consistent(comparable_board_same_brand_flying_v_comparison) :-
    (indep(s40), consistent(s40, comparable_board_same_brand_flying_v_comparison) ; \+indep(s40)).

evidence(all_consistent(comparable_board_same_brand_flying_v_comparison)).
query(true_val(comparable_board_same_brand_flying_v_comparison, fv_forgiving_camber_precise)).
query(true_val(comparable_board_same_brand_flying_v_comparison, unk_comparable_board_same_brand_flying_v_comparison)).

0.75::acc(s30, comparable_board_cross_brand_k2_antidote).

% @attr comparable_board_cross_brand_k2_antidote
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values k2_antidote=K2_Antidote_stiffer_more_advanced unk_comparable_board_cross_brand_k2_antidote=Unknown
% @importance 0.7

0.68::true_val(comparable_board_cross_brand_k2_antidote, k2_antidote); 0.32::true_val(comparable_board_cross_brand_k2_antidote, unk_comparable_board_cross_brand_k2_antidote).

measured(s30, comparable_board_cross_brand_k2_antidote, k2_antidote).

all_consistent(comparable_board_cross_brand_k2_antidote) :-
    consistent(s30, comparable_board_cross_brand_k2_antidote).

evidence(all_consistent(comparable_board_cross_brand_k2_antidote)).
query(true_val(comparable_board_cross_brand_k2_antidote, k2_antidote)).
query(true_val(comparable_board_cross_brand_k2_antidote, unk_comparable_board_cross_brand_k2_antidote)).

0.75::acc(s30, comparable_board_cross_brand_ride_moderator).

% @attr comparable_board_cross_brand_ride_moderator
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values ride_moderator=Ride_Moderator_more_approachable unk_comparable_board_cross_brand_ride_moderator=Unknown
% @importance 0.7

0.68::true_val(comparable_board_cross_brand_ride_moderator, ride_moderator); 0.32::true_val(comparable_board_cross_brand_ride_moderator, unk_comparable_board_cross_brand_ride_moderator).

measured(s30, comparable_board_cross_brand_ride_moderator, ride_moderator).

all_consistent(comparable_board_cross_brand_ride_moderator) :-
    consistent(s30, comparable_board_cross_brand_ride_moderator).

evidence(all_consistent(comparable_board_cross_brand_ride_moderator)).
query(true_val(comparable_board_cross_brand_ride_moderator, ride_moderator)).
query(true_val(comparable_board_cross_brand_ride_moderator, unk_comparable_board_cross_brand_ride_moderator)).

0.72::acc(s77, comparable_board_cross_brand).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values salomon_assassin=Salomon_Assassin unk_comparable_board_cross_brand=Unknown
% @importance 0.75

0.65::true_val(comparable_board_cross_brand, salomon_assassin); 0.35::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s77, comparable_board_cross_brand, salomon_assassin).

all_consistent(comparable_board_cross_brand) :-
    consistent(s77, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, salomon_assassin)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

0.50::acc(s73, comparable_board_cross_brand_capita_mercury).

% @attr comparable_board_cross_brand_capita_mercury
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values capita_mercury=Capita_Mercury unk_comparable_board_cross_brand_capita_mercury=Unknown
% @importance 0.7

0.42::true_val(comparable_board_cross_brand_capita_mercury, capita_mercury); 0.58::true_val(comparable_board_cross_brand_capita_mercury, unk_comparable_board_cross_brand_capita_mercury).

measured(s73, comparable_board_cross_brand_capita_mercury, capita_mercury).

all_consistent(comparable_board_cross_brand_capita_mercury) :-
    consistent(s73, comparable_board_cross_brand_capita_mercury).

evidence(all_consistent(comparable_board_cross_brand_capita_mercury)).
query(true_val(comparable_board_cross_brand_capita_mercury, capita_mercury)).
query(true_val(comparable_board_cross_brand_capita_mercury, unk_comparable_board_cross_brand_capita_mercury)).

0.50::acc(s73, user_review_forum_upgrade).

% @attr user_review_forum_upgrade
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values upgrade_custom_mercury=Suggest_upgrading_to_Custom_or_Capita_Mercury unk_user_review_forum_upgrade=Unknown
% @importance 0.7

0.42::true_val(user_review_forum_upgrade, upgrade_custom_mercury); 0.58::true_val(user_review_forum_upgrade, unk_user_review_forum_upgrade).

measured(s73, user_review_forum_upgrade, upgrade_custom_mercury).

all_consistent(user_review_forum_upgrade) :-
    consistent(s73, user_review_forum_upgrade).

evidence(all_consistent(user_review_forum_upgrade)).
query(true_val(user_review_forum_upgrade, upgrade_custom_mercury)).
query(true_val(user_review_forum_upgrade, unk_user_review_forum_upgrade)).

0.88::acc(s82, graphic_designer_artist).

% @attr graphic_designer_artist
% @type categorical
% @canonical true
% @original_name graphic_designer_artist
% @values annie_spratt=Photographer_Annie_Spratt unk_graphic_designer_artist=Unknown
% @importance 0.9

0.85::true_val(graphic_designer_artist, annie_spratt); 0.15::true_val(graphic_designer_artist, unk_graphic_designer_artist).

measured(s82, graphic_designer_artist, annie_spratt).

all_consistent(graphic_designer_artist) :-
    (indep(s82), consistent(s82, graphic_designer_artist) ; \+indep(s82)).

evidence(all_consistent(graphic_designer_artist)).
query(true_val(graphic_designer_artist, annie_spratt)).
query(true_val(graphic_designer_artist, unk_graphic_designer_artist)).

0.78::acc(s40, graphic_designer_artist_2).

% @attr graphic_designer_artist_2
% @type categorical
% @canonical false
% @original_name graphic_designer_artist
% @values sean_william_randall=Sean_William_Randall unk_graphic_designer_artist_2=Unknown
% @importance 0.8

0.70::true_val(graphic_designer_artist_2, sean_william_randall); 0.30::true_val(graphic_designer_artist_2, unk_graphic_designer_artist_2).

measured(s40, graphic_designer_artist_2, sean_william_randall).

all_consistent(graphic_designer_artist_2) :-
    (indep(s40), consistent(s40, graphic_designer_artist_2) ; \+indep(s40)).

evidence(all_consistent(graphic_designer_artist_2)).
query(true_val(graphic_designer_artist_2, sean_william_randall)).
query(true_val(graphic_designer_artist_2, unk_graphic_designer_artist_2)).

0.75::acc(s24, topsheet_appearance_description).

% @attr topsheet_appearance_description
% @type categorical
% @canonical false
% @original_name topsheet_appearance_description
% @values tiger_glow_in_dark=Tiger_graphic_glow_in_dark_elements unk_topsheet_appearance_description=Unknown
% @importance 0.5

0.68::true_val(topsheet_appearance_description, tiger_glow_in_dark); 0.32::true_val(topsheet_appearance_description, unk_topsheet_appearance_description).

measured(s24, topsheet_appearance_description, tiger_glow_in_dark).

all_consistent(topsheet_appearance_description) :-
    (indep(s24), consistent(s24, topsheet_appearance_description) ; \+indep(s24)).

evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, tiger_glow_in_dark)).
query(true_val(topsheet_appearance_description, unk_topsheet_appearance_description)).

0.82::acc(s26, recommended_bindings_review).
0.85::acc(s11, recommended_bindings_review).

% @attr recommended_bindings_review
% @type categorical
% @canonical false
% @original_name Recommended bindings used in review
% @values malavita_cartel_x=Burton_Malavita_and_Cartel_X_EST unk_recommended_bindings_review=Unknown
% @importance 0.875

0.95::true_val(recommended_bindings_review, malavita_cartel_x); 0.05::true_val(recommended_bindings_review, unk_recommended_bindings_review).

measured(s26, recommended_bindings_review, malavita_cartel_x).
measured(s11, recommended_bindings_review, malavita_cartel_x).

all_consistent(recommended_bindings_review) :-
    consistent(s26, recommended_bindings_review),
    consistent(s11, recommended_bindings_review).

evidence(all_consistent(recommended_bindings_review)).
query(true_val(recommended_bindings_review, malavita_cartel_x)).
query(true_val(recommended_bindings_review, unk_recommended_bindings_review)).

0.78::acc(s75, best_selling_description).

% @attr best_selling_description
% @type categorical
% @canonical false
% @original_name The Process is described as best-selling board in Burton freestyle range
% @values best_selling_freestyle=Best_selling_board_in_Burton_freestyle_range unk_best_selling_description=Unknown
% @importance 0.8

0.72::true_val(best_selling_description, best_selling_freestyle); 0.28::true_val(best_selling_description, unk_best_selling_description).

measured(s75, best_selling_description, best_selling_freestyle).

all_consistent(best_selling_description) :-
    consistent(s75, best_selling_description).

evidence(all_consistent(best_selling_description)).
query(true_val(best_selling_description, best_selling_freestyle)).
query(true_val(best_selling_description, unk_best_selling_description)).

0.88::acc(s1, return_policy_terms).

% @attr return_policy_terms
% @type categorical
% @canonical true
% @original_name return_policy_terms
% @values one_full_year=Up_to_1_full_year unk_return_policy_terms=Unknown
% @importance 0.6

0.85::true_val(return_policy_terms, one_full_year); 0.15::true_val(return_policy_terms, unk_return_policy_terms).

measured(s1, return_policy_terms, one_full_year).

all_consistent(return_policy_terms) :-
    (indep(s1), consistent(s1, return_policy_terms) ; \+indep(s1)).

evidence(all_consistent(return_policy_terms)).
query(true_val(return_policy_terms, one_full_year)).
query(true_val(return_policy_terms, unk_return_policy_terms)).

0.85::acc(s29, return_policy_terms_ski_monster).

% @attr return_policy_terms_ski_monster
% @type categorical
% @canonical false
% @original_name return_policy_terms
% @values ninety_days_new=90_days_new_condition unk_return_policy_terms_ski_monster=Unknown
% @importance 0.9

0.82::true_val(return_policy_terms_ski_monster, ninety_days_new); 0.18::true_val(return_policy_terms_ski_monster, unk_return_policy_terms_ski_monster).

measured(s29, return_policy_terms_ski_monster, ninety_days_new).

all_consistent(return_policy_terms_ski_monster) :-
    consistent(s29, return_policy_terms_ski_monster).

evidence(all_consistent(return_policy_terms_ski_monster)).
query(true_val(return_policy_terms_ski_monster, ninety_days_new)).
query(true_val(return_policy_terms_ski_monster, unk_return_policy_terms_ski_monster)).

0.88::acc(s82, rei_membership_reward).

% @attr rei_membership_reward
% @type numeric
% @unit USD
% @canonical false
% @original_name REI membership reward on this board
% @values v54_99=54.99 unk_rei_membership_reward=Unknown
% @importance 0.9

0.85::true_val(rei_membership_reward, v54_99); 0.15::true_val(rei_membership_reward, unk_rei_membership_reward).

measured(s82, rei_membership_reward, v54_99).

all_consistent(rei_membership_reward) :-
    (indep(s82), consistent(s82, rei_membership_reward) ; \+indep(s82)).

evidence(all_consistent(rei_membership_reward)).
query(true_val(rei_membership_reward, v54_99)).
query(true_val(rei_membership_reward, unk_rei_membership_reward)).