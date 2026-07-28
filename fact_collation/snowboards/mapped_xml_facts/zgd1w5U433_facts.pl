0.15::indep(s13).
0.15::indep(s14).
0.15::indep(s3).
0.20::indep(s20).
0.15::indep(s21).
0.12::indep(s5).
0.15::indep(s12).
0.12::indep(s16).
0.15::indep(s18).
0.40::indep(s38).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values burton=Burton unk_brand=Unknown
% @importance 0.90

0.95::true_val(brand, burton); 0.05::true_val(brand, unk_brand).
0.95::acc(s_m, brand).
measured(s_m, brand, burton).
all_consistent(brand) :- consistent(s_m, brand).
evidence(all_consistent(brand)).
query(true_val(brand, burton)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values custom_x=Custom_X unk_model_name=Unknown
% @importance 0.90

0.95::true_val(model_name, custom_x); 0.05::true_val(model_name, unk_model_name).
0.95::acc(s_m, model_name).
measured(s_m, model_name, custom_x).
all_consistent(model_name) :- consistent(s_m, model_name).
evidence(all_consistent(model_name)).
query(true_val(model_name, custom_x)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2027=2027 unk_model_year=Unknown
% @importance 0.60

0.93::true_val(model_year, y2027); 0.07::true_val(model_year, unk_model_year).
0.88::acc(s2, model_year).
0.85::acc(s3, model_year).
measured(s2, model_year, y2027).
measured(s3, model_year, y2027).
all_consistent(model_year) :-
    consistent(s2, model_year),
    consistent(s3, model_year).
evidence(all_consistent(model_year)).
query(true_val(model_year, y2027)).
query(true_val(model_year, unk_model_year)).

% @attr sku
% @type categorical
% @canonical false
% @original_name SKU
% @values sku_106891ce0brg150=106891CE0BRG150 unk_sku=Unknown
% @importance 0.85

0.95::true_val(sku, sku_106891ce0brg150); 0.05::true_val(sku, unk_sku).
0.97::acc(s_m, sku).
measured(s_m, sku, sku_106891ce0brg150).
all_consistent(sku) :- consistent(s_m, sku).
evidence(all_consistent(sku)).
query(true_val(sku, sku_106891ce0brg150)).
query(true_val(sku, unk_sku)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.90

0.95::true_val(product_type, snowboard); 0.05::true_val(product_type, unk_product_type).
0.95::acc(s_m, product_type).
measured(s_m, product_type, snowboard).
all_consistent(product_type) :- consistent(s_m, product_type).
evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain=All_Mountain unk_board_category=Unknown
% @importance 0.60

0.87::true_val(board_category, all_mountain); 0.13::true_val(board_category, unk_board_category).
0.82::acc(s5, board_category).
measured(s5, board_category, all_mountain).
all_consistent(board_category) :- consistent(s5, board_category).
evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain)).
query(true_val(board_category, unk_board_category)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 1.00

0.93::true_val(gender, mens); 0.07::true_val(gender, unk_gender).
0.95::acc(s6, gender).
measured(s6, gender, mens).
all_consistent(gender) :- consistent(s6, gender).
evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values burton_snowboards_1977_vermont=Burton_Snowboards_founded_1977_Vermont_USA unk_manufacturer=Unknown
% @importance 0.40

0.87::true_val(manufacturer, burton_snowboards_1977_vermont); 0.13::true_val(manufacturer, unk_manufacturer).
0.85::acc(s7, manufacturer).
measured(s7, manufacturer, burton_snowboards_1977_vermont).
all_consistent(manufacturer) :- consistent(s7, manufacturer).
evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, burton_snowboards_1977_vermont)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr custom_series_first_year
% @type categorical
% @canonical false
% @original_name Burton Custom series first year
% @values y1996=1995_96_season unk_custom_series_first_year=Unknown
% @importance 0.50

0.90::true_val(custom_series_first_year, y1996); 0.10::true_val(custom_series_first_year, unk_custom_series_first_year).
0.95::acc(s8, custom_series_first_year).
measured(s8, custom_series_first_year, y1996).
all_consistent(custom_series_first_year) :- consistent(s8, custom_series_first_year).
evidence(all_consistent(custom_series_first_year)).
query(true_val(custom_series_first_year, y1996)).
query(true_val(custom_series_first_year, unk_custom_series_first_year)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values y2004=2004 unk_model_first_available_year=Unknown
% @importance 0.60

0.95::true_val(model_first_available_year, y2004); 0.05::true_val(model_first_available_year, unk_model_first_available_year).
0.97::acc(s9, model_first_available_year).
measured(s9, model_first_available_year, y2004).
all_consistent(model_first_available_year) :- consistent(s9, model_first_available_year).
evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2004)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr position_in_lineup
% @type categorical
% @canonical false
% @original_name Position in lineup
% @values top_performance=Top_advanced_performance_all_mountain unk_position_in_lineup=Unknown
% @importance 0.50

0.87::true_val(position_in_lineup, top_performance); 0.13::true_val(position_in_lineup, unk_position_in_lineup).
0.82::acc(s_m, position_in_lineup).
measured(s_m, position_in_lineup, top_performance).
all_consistent(position_in_lineup) :- consistent(s_m, position_in_lineup).
evidence(all_consistent(position_in_lineup)).
query(true_val(position_in_lineup, top_performance)).
query(true_val(position_in_lineup, unk_position_in_lineup)).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values continuous_since_2004=Continuous_since_2004_incremental_updates unk_predecessor_model_name=Unknown
% @importance 0.40

0.85::true_val(predecessor_model_name, continuous_since_2004); 0.15::true_val(predecessor_model_name, unk_predecessor_model_name).
0.80::acc(s11, predecessor_model_name).
measured(s11, predecessor_model_name, continuous_since_2004).
all_consistent(predecessor_model_name) :- consistent(s11, predecessor_model_name).
evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, continuous_since_2004)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values three_year=3_year_warranty_Channel_system unk_warranty=Unknown
% @importance 0.70

0.87::true_val(warranty, three_year); 0.13::true_val(warranty, unk_warranty).
0.88::acc(s12, warranty).
measured(s12, warranty, three_year).
all_consistent(warranty) :- consistent(s12, warranty).
evidence(all_consistent(warranty)).
query(true_val(warranty, three_year)).
query(true_val(warranty, unk_warranty)).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v1199_99=1199.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.95::true_val(price_aud_merchant, v1199_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).
0.97::acc(s_m, price_aud_merchant).
measured(s_m, price_aud_merchant, v1199_99).
all_consistent(price_aud_merchant) :- consistent(s_m, price_aud_merchant).
evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v1199_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_evo
% @values v674_96=674.96 unk_price_usd_evo=Unknown
% @importance 0.95

0.93::true_val(price_usd_evo, v674_96); 0.07::true_val(price_usd_evo, unk_price_usd_evo).
0.95::acc(s13, price_usd_evo).
measured(s13, price_usd_evo, v674_96).
all_consistent(price_usd_evo) :- consistent(s13, price_usd_evo).
evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v674_96)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_skatepro
% @type numeric
% @unit USD
% @canonical false
% @original_name Price USD (SkatePro)
% @values v849_95=849.95 unk_price_usd_skatepro=Unknown
% @importance 0.85

0.87::true_val(price_usd_skatepro, v849_95); 0.13::true_val(price_usd_skatepro, unk_price_usd_skatepro).
0.90::acc(s14, price_usd_skatepro).
measured(s14, price_usd_skatepro, v849_95).
all_consistent(price_usd_skatepro) :- consistent(s14, price_usd_skatepro).
evidence(all_consistent(price_usd_skatepro)).
query(true_val(price_usd_skatepro, v849_95)).
query(true_val(price_usd_skatepro, unk_price_usd_skatepro)).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v899=899.0 unk_price_usd_msrp=Unknown
% @importance 0.95

0.93::true_val(price_usd_msrp, v899); 0.07::true_val(price_usd_msrp, unk_price_usd_msrp).
0.92::acc(s15, price_usd_msrp).
measured(s15, price_usd_msrp, v899).
all_consistent(price_usd_msrp) :- consistent(s15, price_usd_msrp).
evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v899)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_usd_first_stop
% @type numeric
% @unit USD
% @canonical false
% @original_name Price USD (First Stop Board Barn, 2026 model)
% @values v899_95=899.95 unk_price_usd_first_stop=Unknown
% @importance 0.85

0.87::true_val(price_usd_first_stop, v899_95); 0.13::true_val(price_usd_first_stop, unk_price_usd_first_stop).
0.88::acc(s16, price_usd_first_stop).
measured(s16, price_usd_first_stop, v899_95).
all_consistent(price_usd_first_stop) :- consistent(s16, price_usd_first_stop).
evidence(all_consistent(price_usd_first_stop)).
query(true_val(price_usd_first_stop, v899_95)).
query(true_val(price_usd_first_stop, unk_price_usd_first_stop)).

% @attr price_usd_backcountry
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_backcountry
% @values v539_97=539.97 unk_price_usd_backcountry=Unknown
% @importance 0.85

0.82::true_val(price_usd_backcountry, v539_97); 0.18::true_val(price_usd_backcountry, unk_price_usd_backcountry).
0.82::acc(s17, price_usd_backcountry).
measured(s17, price_usd_backcountry, v539_97).
all_consistent(price_usd_backcountry) :- consistent(s17, price_usd_backcountry).
evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v539_97)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

% @attr price_usd_nz_shred
% @type numeric
% @unit USD
% @canonical false
% @original_name Price NZD (NZ Shred, 2027 Etched graphic)
% @values v746=746.0 unk_price_usd_nz_shred=Unknown
% @importance 0.70

0.80::true_val(price_usd_nz_shred, v746); 0.20::true_val(price_usd_nz_shred, unk_price_usd_nz_shred).
0.78::acc(s18, price_usd_nz_shred).
measured(s18, price_usd_nz_shred, v746).
all_consistent(price_usd_nz_shred) :- consistent(s18, price_usd_nz_shred).
evidence(all_consistent(price_usd_nz_shred)).
query(true_val(price_usd_nz_shred, v746)).
query(true_val(price_usd_nz_shred, unk_price_usd_nz_shred)).

% @attr price_eur_blue_tomato
% @type numeric
% @unit EUR
% @canonical true
% @original_name price_eur_blue_tomato
% @values v879_95=879.95 unk_price_eur_blue_tomato=Unknown
% @importance 0.85

0.82::true_val(price_eur_blue_tomato, v879_95); 0.18::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).
0.82::acc(s17, price_eur_blue_tomato).
measured(s17, price_eur_blue_tomato, v879_95).
all_consistent(price_eur_blue_tomato) :- consistent(s17, price_eur_blue_tomato).
evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v879_95)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values model_2027_listed=2027_model_listed unk_availability_status=Unknown
% @importance 0.50

0.87::true_val(availability_status, model_2027_listed); 0.13::true_val(availability_status, unk_availability_status).
0.82::acc(s_m, availability_status).
measured(s_m, availability_status, model_2027_listed).
all_consistent(availability_status) :- consistent(s_m, availability_status).
evidence(all_consistent(availability_status)).
query(true_val(availability_status, model_2027_listed)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status (evo)
% @values in_stock_2026_free_ship=In_stock_2026_free_shipping unk_availability_status_evo=Unknown
% @importance 0.95

0.93::true_val(availability_status_evo, in_stock_2026_free_ship); 0.07::true_val(availability_status_evo, unk_availability_status_evo).
0.92::acc(s13, availability_status_evo).
measured(s13, availability_status_evo, in_stock_2026_free_ship).
all_consistent(availability_status_evo) :- consistent(s13, availability_status_evo).
evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, in_stock_2026_free_ship)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

% @attr availability_status_rei
% @type categorical
% @canonical false
% @original_name availability_status (REI)
% @values listed_2025_2026=Listed_2025_2026_model unk_availability_status_rei=Unknown
% @importance 0.70

0.88::true_val(availability_status_rei, listed_2025_2026); 0.12::true_val(availability_status_rei, unk_availability_status_rei).
0.87::acc(s19, availability_status_rei).
measured(s19, availability_status_rei, listed_2025_2026).
all_consistent(availability_status_rei) :- consistent(s19, availability_status_rei).
evidence(all_consistent(availability_status_rei)).
query(true_val(availability_status_rei, listed_2025_2026)).
query(true_val(availability_status_rei, unk_availability_status_rei)).

% @attr availability_status_burton
% @type categorical
% @canonical false
% @original_name availability_status (Burton.com)
% @values listed_winter_2026=Listed_Winter_2026 unk_availability_status_burton=Unknown
% @importance 1.00

0.93::true_val(availability_status_burton, listed_winter_2026); 0.07::true_val(availability_status_burton, unk_availability_status_burton).
0.95::acc(s6, availability_status_burton).
measured(s6, availability_status_burton, listed_winter_2026).
all_consistent(availability_status_burton) :- consistent(s6, availability_status_burton).
evidence(all_consistent(availability_status_burton)).
query(true_val(availability_status_burton, listed_winter_2026)).
query(true_val(availability_status_burton, unk_availability_status_burton)).

% @attr availability_status_rhythm
% @type categorical
% @canonical false
% @original_name availability_status (Rhythm)
% @values in_stock_2027_au=2027_in_stock_ships_Australia unk_availability_status_rhythm=Unknown
% @importance 0.75

0.88::true_val(availability_status_rhythm, in_stock_2027_au); 0.12::true_val(availability_status_rhythm, unk_availability_status_rhythm).
0.85::acc(s20, availability_status_rhythm).
measured(s20, availability_status_rhythm, in_stock_2027_au).
all_consistent(availability_status_rhythm) :- consistent(s20, availability_status_rhythm).
evidence(all_consistent(availability_status_rhythm)).
query(true_val(availability_status_rhythm, in_stock_2027_au)).
query(true_val(availability_status_rhythm, unk_availability_status_rhythm)).

% @attr availability_status_basenz
% @type categorical
% @canonical false
% @original_name availability_status (BaseNZ)
% @values listed_2027_std_wide=2027_standard_and_wide_listed unk_availability_status_basenz=Unknown
% @importance 0.60

0.86::true_val(availability_status_basenz, listed_2027_std_wide); 0.14::true_val(availability_status_basenz, unk_availability_status_basenz).
0.83::acc(s2, availability_status_basenz).
0.80::acc(s3, availability_status_basenz).
measured(s2, availability_status_basenz, listed_2027_std_wide).
measured(s3, availability_status_basenz, listed_2027_std_wide).
all_consistent(availability_status_basenz) :-
    consistent(s2, availability_status_basenz),
    consistent(s3, availability_status_basenz).
evidence(all_consistent(availability_status_basenz)).
query(true_val(availability_status_basenz, listed_2027_std_wide)).
query(true_val(availability_status_basenz, unk_availability_status_basenz)).

% @attr availability_status_skatepro
% @type categorical
% @canonical false
% @original_name availability_status (SkatePro)
% @values in_stock_sp=In_stock unk_availability_status_skatepro=Unknown
% @importance 0.85

0.87::true_val(availability_status_skatepro, in_stock_sp); 0.13::true_val(availability_status_skatepro, unk_availability_status_skatepro).
0.85::acc(s14, availability_status_skatepro).
measured(s14, availability_status_skatepro, in_stock_sp).
all_consistent(availability_status_skatepro) :- consistent(s14, availability_status_skatepro).
evidence(all_consistent(availability_status_skatepro)).
query(true_val(availability_status_skatepro, in_stock_sp)).
query(true_val(availability_status_skatepro, unk_availability_status_skatepro)).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status (Blauer)
% @values listed_2025=2025_model_listed unk_availability_status_blauer=Unknown
% @importance 0.50

0.82::true_val(availability_status_blauer, listed_2025); 0.18::true_val(availability_status_blauer, unk_availability_status_blauer).
0.78::acc(s21, availability_status_blauer).
measured(s21, availability_status_blauer, listed_2025).
all_consistent(availability_status_blauer) :- consistent(s21, availability_status_blauer).
evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, listed_2025)).
query(true_val(availability_status_blauer, unk_availability_status_blauer)).

% @attr shipping_restriction
% @type categorical
% @canonical false
% @original_name Shipping restriction (merchant)
% @values australia_only=Australia_only unk_shipping_restriction=Unknown
% @importance 0.85

0.95::true_val(shipping_restriction, australia_only); 0.05::true_val(shipping_restriction, unk_shipping_restriction).
0.97::acc(s_m, shipping_restriction).
measured(s_m, shipping_restriction, australia_only).
all_consistent(shipping_restriction) :- consistent(s_m, shipping_restriction).
evidence(all_consistent(shipping_restriction)).
query(true_val(shipping_restriction, australia_only)).
query(true_val(shipping_restriction, unk_shipping_restriction)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values directional_twin=Directional_Twin unk_shape=Unknown
% @importance 0.87

0.95::true_val(shape, directional_twin); 0.05::true_val(shape, unk_shape).
0.92::acc(s_m, shape).
0.88::acc(s13, shape).
measured(s_m, shape, directional_twin).
measured(s13, shape, directional_twin).
all_consistent(shape) :-
    consistent(s_m, shape),
    (indep(s13), consistent(s13, shape) ; \+indep(s13)).
evidence(all_consistent(shape)).
query(true_val(shape, directional_twin)).
query(true_val(shape, unk_shape)).

% @attr shape_description
% @type categorical
% @canonical false
% @original_name shape (detail)
% @values dir_longer_nose_twin_flex=Directional_longer_nose_shorter_tail_twin_flex unk_shape_description=Unknown
% @importance 0.85

0.95::true_val(shape_description, dir_longer_nose_twin_flex); 0.05::true_val(shape_description, unk_shape_description).
0.90::acc(s_m, shape_description).
measured(s_m, shape_description, dir_longer_nose_twin_flex).
all_consistent(shape_description) :- consistent(s_m, shape_description).
evidence(all_consistent(shape_description)).
query(true_val(shape_description, dir_longer_nose_twin_flex)).
query(true_val(shape_description, unk_shape_description)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values traditional_camber=Traditional_Camber_full_tip_to_tail unk_camber_type=Unknown
% @importance 0.83

0.95::true_val(camber_type, traditional_camber); 0.05::true_val(camber_type, unk_camber_type).
0.92::acc(s_m, camber_type).
0.88::acc(s13, camber_type).
measured(s_m, camber_type, traditional_camber).
measured(s13, camber_type, traditional_camber).
all_consistent(camber_type) :-
    consistent(s_m, camber_type),
    (indep(s13), consistent(s13, camber_type) ; \+indep(s13)).
evidence(all_consistent(camber_type)).
query(true_val(camber_type, traditional_camber)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_height_mm
% @type numeric
% @unit mm
% @canonical true
% @original_name camber_height_mm
% @values v12=12.0 unk_camber_height_mm=Unknown
% @importance 0.70

0.88::true_val(camber_height_mm, v12); 0.12::true_val(camber_height_mm, unk_camber_height_mm).
0.93::acc(s15, camber_height_mm).
measured(s15, camber_height_mm, v12).
all_consistent(camber_height_mm) :- consistent(s15, camber_height_mm).
evidence(all_consistent(camber_height_mm)).
query(true_val(camber_height_mm, v12)).
query(true_val(camber_height_mm, unk_camber_height_mm)).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v8=8.0 v7=7.0
% @importance 0.88

0.72::true_val(flex_rating_10, v8); 0.28::true_val(flex_rating_10, v7).
0.88::acc(s_m, flex_rating_10).
0.92::acc(s15, flex_rating_10).
0.78::acc(s14, flex_rating_10).
0.75::acc(s3, flex_rating_10).
measured(s_m, flex_rating_10, v8).
measured(s15, flex_rating_10, v8).
measured(s14, flex_rating_10, v7).
measured(s3, flex_rating_10, v8).
all_consistent(flex_rating_10) :-
    consistent(s_m, flex_rating_10),
    consistent(s15, flex_rating_10),
    consistent(s14, flex_rating_10),
    (indep(s3), consistent(s3, flex_rating_10) ; \+indep(s3)).
evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v8)).
query(true_val(flex_rating_10, v7)).

% @attr flex_rating_10_manufacturer
% @type categorical
% @canonical false
% @original_name flex_rating_10_manufacturer
% @values v6_to_9=6_to_9_out_of_10 unk_flex_rating_10_manufacturer=Unknown
% @importance 0.85

0.87::true_val(flex_rating_10_manufacturer, v6_to_9); 0.13::true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer).
0.85::acc(s21, flex_rating_10_manufacturer).
measured(s21, flex_rating_10_manufacturer, v6_to_9).
all_consistent(flex_rating_10_manufacturer) :-
    (indep(s21), consistent(s21, flex_rating_10_manufacturer) ; \+indep(s21)).
evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, v6_to_9)).
query(true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values stiff=Stiff unk_flex_feel=Unknown
% @importance 0.90

0.95::true_val(flex_feel, stiff); 0.05::true_val(flex_feel, unk_flex_feel).
0.90::acc(s15, flex_feel).
0.88::acc(s_m, flex_feel).
measured(s15, flex_feel, stiff).
measured(s_m, flex_feel, stiff).
all_consistent(flex_feel) :-
    consistent(s15, flex_feel),
    consistent(s_m, flex_feel).
evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, stiff)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values twin_flex=Twin_Flex_symmetrical unk_flex_direction=Unknown
% @importance 0.80

0.93::true_val(flex_direction, twin_flex); 0.07::true_val(flex_direction, unk_flex_direction).
0.90::acc(s13, flex_direction).
measured(s13, flex_direction, twin_flex).
all_consistent(flex_direction) :-
    (indep(s13), consistent(s13, flex_direction) ; \+indep(s13)).
evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, twin_flex)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr width_options
% @type categorical
% @canonical true
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 0.85

0.95::true_val(width_options, standard_and_wide); 0.05::true_val(width_options, unk_width_options).
0.93::acc(s_m, width_options).
measured(s_m, width_options, standard_and_wide).
all_consistent(width_options) :- consistent(s_m, width_options).
evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values dragonfly_600g=Dragonfly_600G_Multizone_EGD_Squeezebox unk_core_material=Unknown
% @importance 0.83

0.95::true_val(core_material, dragonfly_600g); 0.05::true_val(core_material, unk_core_material).
0.90::acc(s_m, core_material).
0.88::acc(s13, core_material).
measured(s_m, core_material, dragonfly_600g).
measured(s13, core_material, dragonfly_600g).
all_consistent(core_material) :-
    consistent(s_m, core_material),
    (indep(s13), consistent(s13, core_material) ; \+indep(s13)).
evidence(all_consistent(core_material)).
query(true_val(core_material, dragonfly_600g)).
query(true_val(core_material, unk_core_material)).

% @attr core_weight_comparison
% @type categorical
% @canonical false
% @original_name Core weight comparison (independent review)
% @values about_100g_lighter=About_100g_lighter_than_700G_core unk_core_weight_comparison=Unknown
% @importance 0.75

0.85::true_val(core_weight_comparison, about_100g_lighter); 0.15::true_val(core_weight_comparison, unk_core_weight_comparison).
0.82::acc(s27, core_weight_comparison).
measured(s27, core_weight_comparison, about_100g_lighter).
all_consistent(core_weight_comparison) :- consistent(s27, core_weight_comparison).
evidence(all_consistent(core_weight_comparison)).
query(true_val(core_weight_comparison, about_100g_lighter)).
query(true_val(core_weight_comparison, unk_core_weight_comparison)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values multizone_egd=Multizone_EGD_perpendicular_wood_grain_4_zones unk_construction_material_innovation=Unknown
% @importance 0.75

0.93::true_val(construction_material_innovation, multizone_egd); 0.07::true_val(construction_material_innovation, unk_construction_material_innovation).
0.90::acc(s_m, construction_material_innovation).
0.85::acc(s21, construction_material_innovation).
measured(s_m, construction_material_innovation, multizone_egd).
measured(s21, construction_material_innovation, multizone_egd).
all_consistent(construction_material_innovation) :-
    consistent(s_m, construction_material_innovation),
    (indep(s21), consistent(s21, construction_material_innovation) ; \+indep(s21)).
evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, multizone_egd)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr construction_material_innovation_squeezebox
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Squeezebox)
% @values squeezebox=Squeezebox_thicker_thinner_core_sections unk_cmi_squeezebox=Unknown
% @importance 0.75

0.93::true_val(construction_material_innovation_squeezebox, squeezebox); 0.07::true_val(construction_material_innovation_squeezebox, unk_cmi_squeezebox).
0.90::acc(s_m, construction_material_innovation_squeezebox).
0.88::acc(s13, construction_material_innovation_squeezebox).
measured(s_m, construction_material_innovation_squeezebox, squeezebox).
measured(s13, construction_material_innovation_squeezebox, squeezebox).
all_consistent(construction_material_innovation_squeezebox) :-
    consistent(s_m, construction_material_innovation_squeezebox),
    (indep(s13), consistent(s13, construction_material_innovation_squeezebox) ; \+indep(s13)).
evidence(all_consistent(construction_material_innovation_squeezebox)).
query(true_val(construction_material_innovation_squeezebox, squeezebox)).
query(true_val(construction_material_innovation_squeezebox, unk_cmi_squeezebox)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values triax_carbon_ibeam=Triax_fiberglass_with_Carbon_I_Beam unk_laminate=Unknown
% @importance 0.70

0.93::true_val(laminate, triax_carbon_ibeam); 0.07::true_val(laminate, unk_laminate).
0.90::acc(s_m, laminate).
0.88::acc(s30, laminate).
measured(s_m, laminate, triax_carbon_ibeam).
measured(s30, laminate, triax_carbon_ibeam).
all_consistent(laminate) :-
    consistent(s_m, laminate),
    consistent(s30, laminate).
evidence(all_consistent(laminate)).
query(true_val(laminate, triax_carbon_ibeam)).
query(true_val(laminate, unk_laminate)).

% @attr construction_material_innovation_carbon_highlights
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Carbon Highlights)
% @values carbon_highlights_hv=45deg_Carbon_Highlights_High_Voltage unk_cmi_carbon_hl=Unknown
% @importance 0.70

0.93::true_val(construction_material_innovation_carbon_highlights, carbon_highlights_hv); 0.07::true_val(construction_material_innovation_carbon_highlights, unk_cmi_carbon_hl).
0.88::acc(s13, construction_material_innovation_carbon_highlights).
measured(s13, construction_material_innovation_carbon_highlights, carbon_highlights_hv).
all_consistent(construction_material_innovation_carbon_highlights) :-
    (indep(s13), consistent(s13, construction_material_innovation_carbon_highlights) ; \+indep(s13)).
evidence(all_consistent(construction_material_innovation_carbon_highlights)).
query(true_val(construction_material_innovation_carbon_highlights, carbon_highlights_hv)).
query(true_val(construction_material_innovation_carbon_highlights, unk_cmi_carbon_hl)).

% @attr construction_material_innovation_carbon_ibeam
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Carbon I-Beam)
% @values carbon_ibeam=Ultralight_carbon_backbone_bottom_layer unk_cmi_carbon_ib=Unknown
% @importance 0.70

0.93::true_val(construction_material_innovation_carbon_ibeam, carbon_ibeam); 0.07::true_val(construction_material_innovation_carbon_ibeam, unk_cmi_carbon_ib).
0.88::acc(s_m, construction_material_innovation_carbon_ibeam).
0.85::acc(s30, construction_material_innovation_carbon_ibeam).
measured(s_m, construction_material_innovation_carbon_ibeam, carbon_ibeam).
measured(s30, construction_material_innovation_carbon_ibeam, carbon_ibeam).
all_consistent(construction_material_innovation_carbon_ibeam) :-
    consistent(s_m, construction_material_innovation_carbon_ibeam),
    consistent(s30, construction_material_innovation_carbon_ibeam).
evidence(all_consistent(construction_material_innovation_carbon_ibeam)).
query(true_val(construction_material_innovation_carbon_ibeam, carbon_ibeam)).
query(true_val(construction_material_innovation_carbon_ibeam, unk_cmi_carbon_ib)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values frostbite_edges=Frostbite_Edges_extend_under_bindings unk_edge_technology=Unknown
% @importance 0.75

0.95::true_val(edge_technology, frostbite_edges); 0.05::true_val(edge_technology, unk_edge_technology).
0.90::acc(s_m, edge_technology).
0.85::acc(s20, edge_technology).
measured(s_m, edge_technology, frostbite_edges).
measured(s20, edge_technology, frostbite_edges).
all_consistent(edge_technology) :-
    consistent(s_m, edge_technology),
    (indep(s20), consistent(s20, edge_technology) ; \+indep(s20)).
evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, frostbite_edges)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_wfo=Sintered_WFO_high_density unk_base_material=Unknown
% @importance 0.70

0.95::true_val(base_material, sintered_wfo); 0.05::true_val(base_material, unk_base_material).
0.90::acc(s_m, base_material).
0.88::acc(s13, base_material).
measured(s_m, base_material, sintered_wfo).
measured(s13, base_material, sintered_wfo).
all_consistent(base_material) :-
    consistent(s_m, base_material),
    (indep(s13), consistent(s13, base_material) ; \+indep(s13)).
evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_wfo)).
query(true_val(base_material, unk_base_material)).

% @attr resin
% @type categorical
% @canonical true
% @original_name resin
% @values super_sap_epoxy=Super_Sap_Epoxy_bio_based unk_resin=Unknown
% @importance 0.50

0.95::true_val(resin, super_sap_epoxy); 0.05::true_val(resin, unk_resin).
0.90::acc(s_m, resin).
0.88::acc(s13, resin).
measured(s_m, resin, super_sap_epoxy).
measured(s13, resin, super_sap_epoxy).
all_consistent(resin) :-
    consistent(s_m, resin),
    (indep(s13), consistent(s13, resin) ; \+indep(s13)).
evidence(all_consistent(resin)).
query(true_val(resin, super_sap_epoxy)).
query(true_val(resin, unk_resin)).

% @attr construction_material_innovation_infinite_ride
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Infinite Ride)
% @values infinite_ride=Infinite_Ride_factory_break_in unk_cmi_infinite_ride=Unknown
% @importance 0.60

0.93::true_val(construction_material_innovation_infinite_ride, infinite_ride); 0.07::true_val(construction_material_innovation_infinite_ride, unk_cmi_infinite_ride).
0.90::acc(s_m, construction_material_innovation_infinite_ride).
0.88::acc(s13, construction_material_innovation_infinite_ride).
measured(s_m, construction_material_innovation_infinite_ride, infinite_ride).
measured(s13, construction_material_innovation_infinite_ride, infinite_ride).
all_consistent(construction_material_innovation_infinite_ride) :-
    consistent(s_m, construction_material_innovation_infinite_ride),
    (indep(s13), consistent(s13, construction_material_innovation_infinite_ride) ; \+indep(s13)).
evidence(all_consistent(construction_material_innovation_infinite_ride)).
query(true_val(construction_material_innovation_infinite_ride, infinite_ride)).
query(true_val(construction_material_innovation_infinite_ride, unk_cmi_infinite_ride)).

% @attr construction_material_innovation_pro_tip
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Pro-Tip)
% @values pro_tip=Pro_Tip_tapered_tip_tail unk_cmi_pro_tip=Unknown
% @importance 0.50

0.93::true_val(construction_material_innovation_pro_tip, pro_tip); 0.07::true_val(construction_material_innovation_pro_tip, unk_cmi_pro_tip).
0.90::acc(s_m, construction_material_innovation_pro_tip).
0.88::acc(s13, construction_material_innovation_pro_tip).
measured(s_m, construction_material_innovation_pro_tip, pro_tip).
measured(s13, construction_material_innovation_pro_tip, pro_tip).
all_consistent(construction_material_innovation_pro_tip) :-
    consistent(s_m, construction_material_innovation_pro_tip),
    (indep(s13), consistent(s13, construction_material_innovation_pro_tip) ; \+indep(s13)).
evidence(all_consistent(construction_material_innovation_pro_tip)).
query(true_val(construction_material_innovation_pro_tip, pro_tip)).
query(true_val(construction_material_innovation_pro_tip, unk_cmi_pro_tip)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values the_channel=The_Channel_all_major_bindings unk_mounting_pattern=Unknown
% @importance 0.80

0.95::true_val(mounting_pattern, the_channel); 0.05::true_val(mounting_pattern, unk_mounting_pattern).
0.90::acc(s_m, mounting_pattern).
0.88::acc(s13, mounting_pattern).
measured(s_m, mounting_pattern, the_channel).
measured(s13, mounting_pattern, the_channel).
all_consistent(mounting_pattern) :-
    consistent(s_m, mounting_pattern),
    (indep(s13), consistent(s13, mounting_pattern) ; \+indep(s13)).
evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, the_channel)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values kiel_nindl_austria=Kiel_Nindl_GMBH_Austria unk_manufacturing_location=Unknown
% @importance 0.35

0.62::true_val(manufacturing_location, kiel_nindl_austria); 0.38::true_val(manufacturing_location, unk_manufacturing_location).
0.60::acc(s38, manufacturing_location).
measured(s38, manufacturing_location, kiel_nindl_austria).
all_consistent(manufacturing_location) :-
    (indep(s38), consistent(s38, manufacturing_location) ; \+indep(s38)).
evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, kiel_nindl_austria)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values sizes_150_to_166w=150_154_156_158_162_158W_162W_166W unk_available_sizes=Unknown
% @importance 0.85

0.95::true_val(available_sizes, sizes_150_to_166w); 0.05::true_val(available_sizes, unk_available_sizes).
0.93::acc(s_m, available_sizes).
measured(s_m, available_sizes, sizes_150_to_166w).
all_consistent(available_sizes) :- consistent(s_m, available_sizes).
evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, sizes_150_to_166w)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr effective_edge_150
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge (150cm)
% @values v113_5=113.5 unk_effective_edge_150=Unknown
% @importance 0.85

0.95::true_val(effective_edge_150, v113_5); 0.05::true_val(effective_edge_150, unk_effective_edge_150).
0.92::acc(s_m, effective_edge_150).
measured(s_m, effective_edge_150, v113_5).
all_consistent(effective_edge_150) :- consistent(s_m, effective_edge_150).
evidence(all_consistent(effective_edge_150)).
query(true_val(effective_edge_150, v113_5)).
query(true_val(effective_edge_150, unk_effective_edge_150)).

% @attr sidecut_radius_size_150
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (150cm)
% @values v7_4=7.4 unk_sidecut_radius_size_150=Unknown
% @importance 0.85

0.95::true_val(sidecut_radius_size_150, v7_4); 0.05::true_val(sidecut_radius_size_150, unk_sidecut_radius_size_150).
0.92::acc(s_m, sidecut_radius_size_150).
measured(s_m, sidecut_radius_size_150, v7_4).
all_consistent(sidecut_radius_size_150) :- consistent(s_m, sidecut_radius_size_150).
evidence(all_consistent(sidecut_radius_size_150)).
query(true_val(sidecut_radius_size_150, v7_4)).
query(true_val(sidecut_radius_size_150, unk_sidecut_radius_size_150)).

% @attr waist_width_150
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width (150cm)
% @values v24_8=24.8 unk_waist_width_150=Unknown
% @importance 0.85

0.95::true_val(waist_width_150, v24_8); 0.05::true_val(waist_width_150, unk_waist_width_150).
0.92::acc(s_m, waist_width_150).
measured(s_m, waist_width_150, v24_8).
all_consistent(waist_width_150) :- consistent(s_m, waist_width_150).
evidence(all_consistent(waist_width_150)).
query(true_val(waist_width_150, v24_8)).
query(true_val(waist_width_150, unk_waist_width_150)).

% @attr tip_tail_width_size_150
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (150cm)
% @values v28_81=28.81 unk_tip_tail_width_size_150=Unknown
% @importance 0.85

0.95::true_val(tip_tail_width_size_150, v28_81); 0.05::true_val(tip_tail_width_size_150, unk_tip_tail_width_size_150).
0.92::acc(s_m, tip_tail_width_size_150).
measured(s_m, tip_tail_width_size_150, v28_81).
all_consistent(tip_tail_width_size_150) :- consistent(s_m, tip_tail_width_size_150).
evidence(all_consistent(tip_tail_width_size_150)).
query(true_val(tip_tail_width_size_150, v28_81)).
query(true_val(tip_tail_width_size_150, unk_tip_tail_width_size_150)).

% @attr stance_width_range_size_150
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size (150cm)
% @values v50_5=50.5 unk_stance_width_range_size_150=Unknown
% @importance 0.85

0.95::true_val(stance_width_range_size_150, v50_5); 0.05::true_val(stance_width_range_size_150, unk_stance_width_range_size_150).
0.92::acc(s_m, stance_width_range_size_150).
measured(s_m, stance_width_range_size_150, v50_5).
all_consistent(stance_width_range_size_150) :- consistent(s_m, stance_width_range_size_150).
evidence(all_consistent(stance_width_range_size_150)).
query(true_val(stance_width_range_size_150, v50_5)).
query(true_val(stance_width_range_size_150, unk_stance_width_range_size_150)).

% @attr setback
% @type numeric
% @unit cm
% @canonical true
% @original_name setback
% @values vn1_25=-1.25 unk_setback=Unknown
% @importance 0.85

0.95::true_val(setback, vn1_25); 0.05::true_val(setback, unk_setback).
0.92::acc(s_m, setback).
measured(s_m, setback, vn1_25).
all_consistent(setback) :- consistent(s_m, setback).
evidence(all_consistent(setback)).
query(true_val(setback, vn1_25)).
query(true_val(setback, unk_setback)).

% @attr recommended_weight_range_size_150
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (150cm)
% @values v54_82=54_to_82kg unk_rwrs_150=Unknown
% @importance 0.85

0.95::true_val(recommended_weight_range_size_150, v54_82); 0.05::true_val(recommended_weight_range_size_150, unk_rwrs_150).
0.92::acc(s_m, recommended_weight_range_size_150).
measured(s_m, recommended_weight_range_size_150, v54_82).
all_consistent(recommended_weight_range_size_150) :- consistent(s_m, recommended_weight_range_size_150).
evidence(all_consistent(recommended_weight_range_size_150)).
query(true_val(recommended_weight_range_size_150, v54_82)).
query(true_val(recommended_weight_range_size_150, unk_rwrs_150)).

% @attr effective_edge_156
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge (156cm)
% @values v119_5=119.5 unk_effective_edge_156=Unknown
% @importance 0.85

0.95::true_val(effective_edge_156, v119_5); 0.05::true_val(effective_edge_156, unk_effective_edge_156).
0.92::acc(s_m, effective_edge_156).
measured(s_m, effective_edge_156, v119_5).
all_consistent(effective_edge_156) :- consistent(s_m, effective_edge_156).
evidence(all_consistent(effective_edge_156)).
query(true_val(effective_edge_156, v119_5)).
query(true_val(effective_edge_156, unk_effective_edge_156)).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size
% @values v7_8=7.8 unk_sidecut_radius_size=Unknown
% @importance 0.85

0.95::true_val(sidecut_radius_size, v7_8); 0.05::true_val(sidecut_radius_size, unk_sidecut_radius_size).
0.92::acc(s_m, sidecut_radius_size).
measured(s_m, sidecut_radius_size, v7_8).
all_consistent(sidecut_radius_size) :- consistent(s_m, sidecut_radius_size).
evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_8)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr waist_width_156
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width (156cm)
% @values v25_2=25.2 unk_waist_width_156=Unknown
% @importance 0.90

0.96::true_val(waist_width_156, v25_2); 0.04::true_val(waist_width_156, unk_waist_width_156).
0.92::acc(s_m, waist_width_156).
0.94::acc(s15, waist_width_156).
measured(s_m, waist_width_156, v25_2).
measured(s15, waist_width_156, v25_2).
all_consistent(waist_width_156) :-
    consistent(s_m, waist_width_156),
    consistent(s15, waist_width_156).
evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v25_2)).
query(true_val(waist_width_156, unk_waist_width_156)).

% @attr tip_tail_width_size
% @type numeric
% @unit cm
% @canonical true
% @original_name tip_tail_width_size
% @values v29_43=29.43 unk_tip_tail_width_size=Unknown
% @importance 0.85

0.95::true_val(tip_tail_width_size, v29_43); 0.05::true_val(tip_tail_width_size, unk_tip_tail_width_size).
0.92::acc(s_m, tip_tail_width_size).
measured(s_m, tip_tail_width_size, v29_43).
all_consistent(tip_tail_width_size) :- consistent(s_m, tip_tail_width_size).
evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v29_43)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr stance_width_range_size
% @type numeric
% @unit cm
% @canonical true
% @original_name stance_width_range_size
% @values v53_0=53.0 unk_stance_width_range_size=Unknown
% @importance 0.85

0.95::true_val(stance_width_range_size, v53_0); 0.05::true_val(stance_width_range_size, unk_stance_width_range_size).
0.92::acc(s_m, stance_width_range_size).
measured(s_m, stance_width_range_size, v53_0).
all_consistent(stance_width_range_size) :- consistent(s_m, stance_width_range_size).
evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v53_0)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size
% @values v68_91=68_to_91kg unk_recommended_weight_range_size=Unknown
% @importance 0.85

0.95::true_val(recommended_weight_range_size, v68_91); 0.05::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).
0.92::acc(s_m, recommended_weight_range_size).
measured(s_m, recommended_weight_range_size, v68_91).
all_consistent(recommended_weight_range_size) :- consistent(s_m, recommended_weight_range_size).
evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, v68_91)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr effective_edge_158
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge (158cm)
% @values v121_5=121.5 unk_effective_edge_158=Unknown
% @importance 0.85

0.95::true_val(effective_edge_158, v121_5); 0.05::true_val(effective_edge_158, unk_effective_edge_158).
0.92::acc(s_m, effective_edge_158).
measured(s_m, effective_edge_158, v121_5).
all_consistent(effective_edge_158) :- consistent(s_m, effective_edge_158).
evidence(all_consistent(effective_edge_158)).
query(true_val(effective_edge_158, v121_5)).
query(true_val(effective_edge_158, unk_effective_edge_158)).

% @attr sidecut_radius_size_158
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (158cm)
% @values v7_9=7.9 unk_sidecut_radius_size_158=Unknown
% @importance 0.85

0.95::true_val(sidecut_radius_size_158, v7_9); 0.05::true_val(sidecut_radius_size_158, unk_sidecut_radius_size_158).
0.92::acc(s_m, sidecut_radius_size_158).
measured(s_m, sidecut_radius_size_158, v7_9).
all_consistent(sidecut_radius_size_158) :- consistent(s_m, sidecut_radius_size_158).
evidence(all_consistent(sidecut_radius_size_158)).
query(true_val(sidecut_radius_size_158, v7_9)).
query(true_val(sidecut_radius_size_158, unk_sidecut_radius_size_158)).

% @attr waist_width_158
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width (158cm)
% @values v25_4=25.4 unk_waist_width_158=Unknown
% @importance 0.85

0.95::true_val(waist_width_158, v25_4); 0.05::true_val(waist_width_158, unk_waist_width_158).
0.92::acc(s_m, waist_width_158).
measured(s_m, waist_width_158, v25_4).
all_consistent(waist_width_158) :- consistent(s_m, waist_width_158).
evidence(all_consistent(waist_width_158)).
query(true_val(waist_width_158, v25_4)).
query(true_val(waist_width_158, unk_waist_width_158)).

% @attr stance_width_range_size_158
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size (158cm)
% @values v56_0=56.0 unk_stance_width_range_size_158=Unknown
% @importance 0.85

0.95::true_val(stance_width_range_size_158, v56_0); 0.05::true_val(stance_width_range_size_158, unk_stance_width_range_size_158).
0.92::acc(s_m, stance_width_range_size_158).
measured(s_m, stance_width_range_size_158, v56_0).
all_consistent(stance_width_range_size_158) :- consistent(s_m, stance_width_range_size_158).
evidence(all_consistent(stance_width_range_size_158)).
query(true_val(stance_width_range_size_158, v56_0)).
query(true_val(stance_width_range_size_158, unk_stance_width_range_size_158)).

% @attr recommended_weight_range_size_158
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (158cm)
% @values v68_91_158=68_to_91kg unk_rwrs_158=Unknown
% @importance 0.85

0.95::true_val(recommended_weight_range_size_158, v68_91_158); 0.05::true_val(recommended_weight_range_size_158, unk_rwrs_158).
0.92::acc(s_m, recommended_weight_range_size_158).
measured(s_m, recommended_weight_range_size_158, v68_91_158).
all_consistent(recommended_weight_range_size_158) :- consistent(s_m, recommended_weight_range_size_158).
evidence(all_consistent(recommended_weight_range_size_158)).
query(true_val(recommended_weight_range_size_158, v68_91_158)).
query(true_val(recommended_weight_range_size_158, unk_rwrs_158)).

% @attr effective_edge_162
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge (162cm)
% @values v125_5=125.5 unk_effective_edge_162=Unknown
% @importance 0.85

0.95::true_val(effective_edge_162, v125_5); 0.05::true_val(effective_edge_162, unk_effective_edge_162).
0.92::acc(s_m, effective_edge_162).
measured(s_m, effective_edge_162, v125_5).
all_consistent(effective_edge_162) :- consistent(s_m, effective_edge_162).
evidence(all_consistent(effective_edge_162)).
query(true_val(effective_edge_162, v125_5)).
query(true_val(effective_edge_162, unk_effective_edge_162)).

% @attr sidecut_radius_size_162
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (162cm)
% @values v8_2=8.2 unk_sidecut_radius_size_162=Unknown
% @importance 0.85

0.95::true_val(sidecut_radius_size_162, v8_2); 0.05::true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162).
0.92::acc(s_m, sidecut_radius_size_162).
measured(s_m, sidecut_radius_size_162, v8_2).
all_consistent(sidecut_radius_size_162) :- consistent(s_m, sidecut_radius_size_162).
evidence(all_consistent(sidecut_radius_size_162)).
query(true_val(sidecut_radius_size_162, v8_2)).
query(true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162)).

% @attr waist_width_162
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width (162cm)
% @values v25_6=25.6 unk_waist_width_162=Unknown
% @importance 0.85

0.95::true_val(waist_width_162, v25_6); 0.05::true_val(waist_width_162, unk_waist_width_162).
0.92::acc(s_m, waist_width_162).
measured(s_m, waist_width_162, v25_6).
all_consistent(waist_width_162) :- consistent(s_m, waist_width_162).
evidence(all_consistent(waist_width_162)).
query(true_val(waist_width_162, v25_6)).
query(true_val(waist_width_162, unk_waist_width_162)).

% @attr recommended_weight_range_size_162
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (162cm)
% @values v82_118plus=82_to_118plus_kg unk_rwrs_162=Unknown
% @importance 0.85

0.95::true_val(recommended_weight_range_size_162, v82_118plus); 0.05::true_val(recommended_weight_range_size_162, unk_rwrs_162).
0.92::acc(s_m, recommended_weight_range_size_162).
measured(s_m, recommended_weight_range_size_162, v82_118plus).
all_consistent(recommended_weight_range_size_162) :- consistent(s_m, recommended_weight_range_size_162).
evidence(all_consistent(recommended_weight_range_size_162)).
query(true_val(recommended_weight_range_size_162, v82_118plus)).
query(true_val(recommended_weight_range_size_162, unk_rwrs_162)).

% @attr effective_edge_158w
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge (158 Wide)
% @values v121_5w=121.5 unk_effective_edge_158w=Unknown
% @importance 0.85

0.95::true_val(effective_edge_158w, v121_5w); 0.05::true_val(effective_edge_158w, unk_effective_edge_158w).
0.92::acc(s_m, effective_edge_158w).
measured(s_m, effective_edge_158w, v121_5w).
all_consistent(effective_edge_158w) :- consistent(s_m, effective_edge_158w).
evidence(all_consistent(effective_edge_158w)).
query(true_val(effective_edge_158w, v121_5w)).
query(true_val(effective_edge_158w, unk_effective_edge_158w)).

% @attr waist_width_158w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width (158 Wide)
% @values v26_2=26.2 unk_waist_width_158w=Unknown
% @importance 0.85

0.95::true_val(waist_width_158w, v26_2); 0.05::true_val(waist_width_158w, unk_waist_width_158w).
0.92::acc(s_m, waist_width_158w).
measured(s_m, waist_width_158w, v26_2).
all_consistent(waist_width_158w) :- consistent(s_m, waist_width_158w).
evidence(all_consistent(waist_width_158w)).
query(true_val(waist_width_158w, v26_2)).
query(true_val(waist_width_158w, unk_waist_width_158w)).

% @attr recommended_weight_range_size_158w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (158W)
% @values v68_91_158w=68_to_91kg unk_rwrs_158w=Unknown
% @importance 0.85

0.95::true_val(recommended_weight_range_size_158w, v68_91_158w); 0.05::true_val(recommended_weight_range_size_158w, unk_rwrs_158w).
0.92::acc(s_m, recommended_weight_range_size_158w).
measured(s_m, recommended_weight_range_size_158w, v68_91_158w).
all_consistent(recommended_weight_range_size_158w) :- consistent(s_m, recommended_weight_range_size_158w).
evidence(all_consistent(recommended_weight_range_size_158w)).
query(true_val(recommended_weight_range_size_158w, v68_91_158w)).
query(true_val(recommended_weight_range_size_158w, unk_rwrs_158w)).

% @attr effective_edge_162w
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge (162 Wide)
% @values v125_5w=125.5 unk_effective_edge_162w=Unknown
% @importance 0.85

0.95::true_val(effective_edge_162w, v125_5w); 0.05::true_val(effective_edge_162w, unk_effective_edge_162w).
0.92::acc(s_m, effective_edge_162w).
measured(s_m, effective_edge_162w, v125_5w).
all_consistent(effective_edge_162w) :- consistent(s_m, effective_edge_162w).
evidence(all_consistent(effective_edge_162w)).
query(true_val(effective_edge_162w, v125_5w)).
query(true_val(effective_edge_162w, unk_effective_edge_162w)).

% @attr waist_width_162w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width (162 Wide)
% @values v26_4=26.4 unk_waist_width_162w=Unknown
% @importance 0.85

0.95::true_val(waist_width_162w, v26_4); 0.05::true_val(waist_width_162w, unk_waist_width_162w).
0.92::acc(s_m, waist_width_162w).
measured(s_m, waist_width_162w, v26_4).
all_consistent(waist_width_162w) :- consistent(s_m, waist_width_162w).
evidence(all_consistent(waist_width_162w)).
query(true_val(waist_width_162w, v26_4)).
query(true_val(waist_width_162w, unk_waist_width_162w)).

% @attr recommended_weight_range_size_162w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (162W)
% @values v82_118plus_162w=82_to_118plus_kg unk_rwrs_162w=Unknown
% @importance 0.85

0.95::true_val(recommended_weight_range_size_162w, v82_118plus_162w); 0.05::true_val(recommended_weight_range_size_162w, unk_rwrs_162w).
0.92::acc(s_m, recommended_weight_range_size_162w).
measured(s_m, recommended_weight_range_size_162w, v82_118plus_162w).
all_consistent(recommended_weight_range_size_162w) :- consistent(s_m, recommended_weight_range_size_162w).
evidence(all_consistent(recommended_weight_range_size_162w)).
query(true_val(recommended_weight_range_size_162w, v82_118plus_162w)).
query(true_val(recommended_weight_range_size_162w, unk_rwrs_162w)).

% @attr effective_edge_166w
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge (166 Wide)
% @values v129_5=129.5 unk_effective_edge_166w=Unknown
% @importance 0.85

0.95::true_val(effective_edge_166w, v129_5); 0.05::true_val(effective_edge_166w, unk_effective_edge_166w).
0.92::acc(s_m, effective_edge_166w).
measured(s_m, effective_edge_166w, v129_5).
all_consistent(effective_edge_166w) :- consistent(s_m, effective_edge_166w).
evidence(all_consistent(effective_edge_166w)).
query(true_val(effective_edge_166w, v129_5)).
query(true_val(effective_edge_166w, unk_effective_edge_166w)).

% @attr waist_width_166w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width (166 Wide)
% @values v26_6=26.6 unk_waist_width_166w=Unknown
% @importance 0.85

0.95::true_val(waist_width_166w, v26_6); 0.05::true_val(waist_width_166w, unk_waist_width_166w).
0.92::acc(s_m, waist_width_166w).
measured(s_m, waist_width_166w, v26_6).
all_consistent(waist_width_166w) :- consistent(s_m, waist_width_166w).
evidence(all_consistent(waist_width_166w)).
query(true_val(waist_width_166w, v26_6)).
query(true_val(waist_width_166w, unk_waist_width_166w)).

% @attr recommended_weight_range_size_166w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (166W)
% @values v82_118plus_166w=82_to_118plus_kg unk_rwrs_166w=Unknown
% @importance 0.85

0.95::true_val(recommended_weight_range_size_166w, v82_118plus_166w); 0.05::true_val(recommended_weight_range_size_166w, unk_rwrs_166w).
0.92::acc(s_m, recommended_weight_range_size_166w).
measured(s_m, recommended_weight_range_size_166w, v82_118plus_166w).
all_consistent(recommended_weight_range_size_166w) :- consistent(s_m, recommended_weight_range_size_166w).
evidence(all_consistent(recommended_weight_range_size_166w)).
query(true_val(recommended_weight_range_size_166w, v82_118plus_166w)).
query(true_val(recommended_weight_range_size_166w, unk_rwrs_166w)).

% @attr wide_width_purpose
% @type categorical
% @canonical false
% @original_name Wide width purpose
% @values boot_10_5_plus=For_boots_size_10_5_plus_eliminates_drag unk_wide_width_purpose=Unknown
% @importance 0.60

0.85::true_val(wide_width_purpose, boot_10_5_plus); 0.15::true_val(wide_width_purpose, unk_wide_width_purpose).
0.80::acc(s2, wide_width_purpose).
measured(s2, wide_width_purpose, boot_10_5_plus).
all_consistent(wide_width_purpose) :-
    (indep(s2), consistent(s2, wide_width_purpose) ; \+indep(s2)).
evidence(all_consistent(wide_width_purpose)).
query(true_val(wide_width_purpose, boot_10_5_plus)).
query(true_val(wide_width_purpose, unk_wide_width_purpose)).

% @attr terrain_suitability
% @type numeric
% @unit /10
% @canonical true
% @original_name terrain_suitability
% @values v9=9.0 unk_terrain_suitability=Unknown
% @importance 0.85

0.95::true_val(terrain_suitability, v9); 0.05::true_val(terrain_suitability, unk_terrain_suitability).
0.85::acc(s_m, terrain_suitability).
measured(s_m, terrain_suitability, v9).
all_consistent(terrain_suitability) :- consistent(s_m, terrain_suitability).
evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, v9)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr terrain_suitability_secondary
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability (secondary)
% @values v7_ts=7.0 unk_terrain_suitability_secondary=Unknown
% @importance 0.85

0.95::true_val(terrain_suitability_secondary, v7_ts); 0.05::true_val(terrain_suitability_secondary, unk_terrain_suitability_secondary).
0.85::acc(s_m, terrain_suitability_secondary).
measured(s_m, terrain_suitability_secondary, v7_ts).
all_consistent(terrain_suitability_secondary) :- consistent(s_m, terrain_suitability_secondary).
evidence(all_consistent(terrain_suitability_secondary)).
query(true_val(terrain_suitability_secondary, v7_ts)).
query(true_val(terrain_suitability_secondary, unk_terrain_suitability_secondary)).

% @attr terrain_suitability_tertiary
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability (tertiary)
% @values v6_ts=6.0 unk_terrain_suitability_tertiary=Unknown
% @importance 0.85

0.95::true_val(terrain_suitability_tertiary, v6_ts); 0.05::true_val(terrain_suitability_tertiary, unk_terrain_suitability_tertiary).
0.85::acc(s_m, terrain_suitability_tertiary).
measured(s_m, terrain_suitability_tertiary, v6_ts).
all_consistent(terrain_suitability_tertiary) :- consistent(s_m, terrain_suitability_tertiary).
evidence(all_consistent(terrain_suitability_tertiary)).
query(true_val(terrain_suitability_tertiary, v6_ts)).
query(true_val(terrain_suitability_tertiary, unk_terrain_suitability_tertiary)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values aggressive_am_charger=Aggressive_all_mountain_backcountry_competition_carving unk_riding_style=Unknown
% @importance 0.85

0.95::true_val(riding_style, aggressive_am_charger); 0.05::true_val(riding_style, unk_riding_style).
0.90::acc(s_m, riding_style).
measured(s_m, riding_style, aggressive_am_charger).
all_consistent(riding_style) :- consistent(s_m, riding_style).
evidence(all_consistent(riding_style)).
query(true_val(riding_style, aggressive_am_charger)).
query(true_val(riding_style, unk_riding_style)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values advanced=Advanced unk_rider_level=Unknown
% @importance 0.85

0.95::true_val(rider_level, advanced); 0.05::true_val(rider_level, unk_rider_level).
0.90::acc(s_m, rider_level).
measured(s_m, rider_level, advanced).
all_consistent(rider_level) :- consistent(s_m, rider_level).
evidence(all_consistent(rider_level)).
query(true_val(rider_level, advanced)).
query(true_val(rider_level, unk_rider_level)).

% @attr board_weight_grams
% @type numeric
% @unit g
% @canonical true
% @original_name board_weight_grams
% @values v2720=2720.0 unk_board_weight_grams=Unknown
% @importance 0.75

0.88::true_val(board_weight_grams, v2720); 0.12::true_val(board_weight_grams, unk_board_weight_grams).
0.93::acc(s15, board_weight_grams).
measured(s15, board_weight_grams, v2720).
all_consistent(board_weight_grams) :- consistent(s15, board_weight_grams).
evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v2720)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr weight_per_cm
% @type numeric
% @unit g/cm
% @canonical true
% @original_name weight_per_cm
% @values v16_79=16.79 unk_weight_per_cm=Unknown
% @importance 0.75

0.88::true_val(weight_per_cm, v16_79); 0.12::true_val(weight_per_cm, unk_weight_per_cm).
0.93::acc(s15, weight_per_cm).
measured(s15, weight_per_cm, v16_79).
all_consistent(weight_per_cm) :- consistent(s15, weight_per_cm).
evidence(all_consistent(weight_per_cm)).
query(true_val(weight_per_cm, v16_79)).
query(true_val(weight_per_cm, unk_weight_per_cm)).

% @attr overall_rating_snowboardingprofiles
% @type numeric
% @unit /100
% @canonical true
% @original_name overall_rating_snowboardingprofiles
% @values v91_5=91.5 unk_overall_rating_sp=Unknown
% @importance 0.95

0.90::true_val(overall_rating_snowboardingprofiles, v91_5); 0.10::true_val(overall_rating_snowboardingprofiles, unk_overall_rating_sp).
0.92::acc(s15, overall_rating_snowboardingprofiles).
measured(s15, overall_rating_snowboardingprofiles, v91_5).
all_consistent(overall_rating_snowboardingprofiles) :- consistent(s15, overall_rating_snowboardingprofiles).
evidence(all_consistent(overall_rating_snowboardingprofiles)).
query(true_val(overall_rating_snowboardingprofiles, v91_5)).
query(true_val(overall_rating_snowboardingprofiles, unk_overall_rating_sp)).

% @attr carving_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical true
% @original_name carving_score_snowboardingprofiles
% @values v5=5.0 unk_carving_score_sp=Unknown
% @importance 0.95

0.90::true_val(carving_score_snowboardingprofiles, v5); 0.10::true_val(carving_score_snowboardingprofiles, unk_carving_score_sp).
0.92::acc(s15, carving_score_snowboardingprofiles).
measured(s15, carving_score_snowboardingprofiles, v5).
all_consistent(carving_score_snowboardingprofiles) :- consistent(s15, carving_score_snowboardingprofiles).
evidence(all_consistent(carving_score_snowboardingprofiles)).
query(true_val(carving_score_snowboardingprofiles, v5)).
query(true_val(carving_score_snowboardingprofiles, unk_carving_score_sp)).

% @attr speed_score_sp
% @type numeric
% @unit /5
% @canonical false
% @original_name SnowboardingProfiles speed score
% @values v4_5=4.5 unk_speed_score_sp=Unknown
% @importance 0.95

0.90::true_val(speed_score_sp, v4_5); 0.10::true_val(speed_score_sp, unk_speed_score_sp).
0.92::acc(s15, speed_score_sp).
measured(s15, speed_score_sp, v4_5).
all_consistent(speed_score_sp) :- consistent(s15, speed_score_sp).
evidence(all_consistent(speed_score_sp)).
query(true_val(speed_score_sp, v4_5)).
query(true_val(speed_score_sp, unk_speed_score_sp)).

% @attr jumps_score_sp
% @type numeric
% @unit /5
% @canonical false
% @original_name SnowboardingProfiles jumps score
% @values v4=4.0 unk_jumps_score_sp=Unknown
% @importance 0.95

0.90::true_val(jumps_score_sp, v4); 0.10::true_val(jumps_score_sp, unk_jumps_score_sp).
0.92::acc(s15, jumps_score_sp).
measured(s15, jumps_score_sp, v4).
all_consistent(jumps_score_sp) :- consistent(s15, jumps_score_sp).
evidence(all_consistent(jumps_score_sp)).
query(true_val(jumps_score_sp, v4)).
query(true_val(jumps_score_sp, unk_jumps_score_sp)).

% @attr powder_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical true
% @original_name powder_score_snowboardingprofiles
% @values v2_5=2.5 unk_powder_score_sp=Unknown
% @importance 0.95

0.90::true_val(powder_score_snowboardingprofiles, v2_5); 0.10::true_val(powder_score_snowboardingprofiles, unk_powder_score_sp).
0.92::acc(s15, powder_score_snowboardingprofiles).
measured(s15, powder_score_snowboardingprofiles, v2_5).
all_consistent(powder_score_snowboardingprofiles) :- consistent(s15, powder_score_snowboardingprofiles).
evidence(all_consistent(powder_score_snowboardingprofiles)).
query(true_val(powder_score_snowboardingprofiles, v2_5)).
query(true_val(powder_score_snowboardingprofiles, unk_powder_score_sp)).

% @attr crud_score_sp
% @type numeric
% @unit /5
% @canonical false
% @original_name SnowboardingProfiles crud score
% @values v4_crud=4.0 unk_crud_score_sp=Unknown
% @importance 0.95

0.90::true_val(crud_score_sp, v4_crud); 0.10::true_val(crud_score_sp, unk_crud_score_sp).
0.92::acc(s15, crud_score_sp).
measured(s15, crud_score_sp, v4_crud).
all_consistent(crud_score_sp) :- consistent(s15, crud_score_sp).
evidence(all_consistent(crud_score_sp)).
query(true_val(crud_score_sp, v4_crud)).
query(true_val(crud_score_sp, unk_crud_score_sp)).

% @attr ranking_sp
% @type categorical
% @canonical false
% @original_name SnowboardingProfiles ranked #1
% @values ranked_first=Ranked_1_aggressive_all_mountain_2025_2026 unk_ranking_sp=Unknown
% @importance 0.85

0.88::true_val(ranking_sp, ranked_first); 0.12::true_val(ranking_sp, unk_ranking_sp).
0.90::acc(s15, ranking_sp).
measured(s15, ranking_sp, ranked_first).
all_consistent(ranking_sp) :- consistent(s15, ranking_sp).
evidence(all_consistent(ranking_sp)).
query(true_val(ranking_sp, ranked_first)).
query(true_val(ranking_sp, unk_ranking_sp)).

% @attr reviewer_opinion_the_inertia
% @type categorical
% @canonical false
% @original_name The Inertia review
% @values worthy_consideration=Former_top_pick_more_than_worthy unk_reviewer_opinion_the_inertia=Unknown
% @importance 0.70

0.82::true_val(reviewer_opinion_the_inertia, worthy_consideration); 0.18::true_val(reviewer_opinion_the_inertia, unk_reviewer_opinion_the_inertia).
0.80::acc(s42, reviewer_opinion_the_inertia).
measured(s42, reviewer_opinion_the_inertia, worthy_consideration).
all_consistent(reviewer_opinion_the_inertia) :- consistent(s42, reviewer_opinion_the_inertia).
evidence(all_consistent(reviewer_opinion_the_inertia)).
query(true_val(reviewer_opinion_the_inertia, worthy_consideration)).
query(true_val(reviewer_opinion_the_inertia, unk_reviewer_opinion_the_inertia)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values stable_high_speed_pop=Praised_stability_high_speed_pop_off_rollers unk_reviewer_opinion_whitelines=Unknown
% @importance 0.65

0.80::true_val(reviewer_opinion_whitelines, stable_high_speed_pop); 0.20::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).
0.78::acc(s43, reviewer_opinion_whitelines).
measured(s43, reviewer_opinion_whitelines, stable_high_speed_pop).
all_consistent(reviewer_opinion_whitelines) :- consistent(s43, reviewer_opinion_whitelines).
evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, stable_high_speed_pop)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

% @attr reviewer_opinion_the_manual
% @type categorical
% @canonical false
% @original_name The Manual review
% @values ferrari_comparison=Compared_to_Ferrari_zero_compromise unk_reviewer_opinion_the_manual=Unknown
% @importance 0.60

0.78::true_val(reviewer_opinion_the_manual, ferrari_comparison); 0.22::true_val(reviewer_opinion_the_manual, unk_reviewer_opinion_the_manual).
0.76::acc(s44, reviewer_opinion_the_manual).
measured(s44, reviewer_opinion_the_manual, ferrari_comparison).
all_consistent(reviewer_opinion_the_manual) :- consistent(s44, reviewer_opinion_the_manual).
evidence(all_consistent(reviewer_opinion_the_manual)).
query(true_val(reviewer_opinion_the_manual, ferrari_comparison)).
query(true_val(reviewer_opinion_the_manual, unk_reviewer_opinion_the_manual)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values chattery_exceptional_pop=Chattery_but_exceptional_pop unk_reviewer_opinion_tgr=Unknown
% @importance 0.75

0.83::true_val(reviewer_opinion_the_good_ride, chattery_exceptional_pop); 0.17::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_tgr).
0.80::acc(s11, reviewer_opinion_the_good_ride).
measured(s11, reviewer_opinion_the_good_ride, chattery_exceptional_pop).
all_consistent(reviewer_opinion_the_good_ride) :- consistent(s11, reviewer_opinion_the_good_ride).
evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, chattery_exceptional_pop)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_tgr)).

% @attr reviewer_opinion_snowboard_robot
% @type categorical
% @canonical false
% @original_name Snowboard Robot review
% @values not_over_top_quick_edge=Not_over_the_top_quick_edge_to_edge unk_reviewer_opinion_sr=Unknown
% @importance 0.65

0.80::true_val(reviewer_opinion_snowboard_robot, not_over_top_quick_edge); 0.20::true_val(reviewer_opinion_snowboard_robot, unk_reviewer_opinion_sr).
0.78::acc(s27, reviewer_opinion_snowboard_robot).
measured(s27, reviewer_opinion_snowboard_robot, not_over_top_quick_edge).
all_consistent(reviewer_opinion_snowboard_robot) :- consistent(s27, reviewer_opinion_snowboard_robot).
evidence(all_consistent(reviewer_opinion_snowboard_robot)).
query(true_val(reviewer_opinion_snowboard_robot, not_over_top_quick_edge)).
query(true_val(reviewer_opinion_snowboard_robot, unk_reviewer_opinion_sr)).

% @attr carving_score_snowboardingprofiles_qualitative
% @type categorical
% @canonical false
% @original_name carving_score_snowboardingprofiles (qualitative)
% @values absolute_carving_beast=Absolute_carving_beast unk_carving_qual=Unknown
% @importance 0.95

0.90::true_val(carving_score_snowboardingprofiles_qualitative, absolute_carving_beast); 0.10::true_val(carving_score_snowboardingprofiles_qualitative, unk_carving_qual).
0.90::acc(s15, carving_score_snowboardingprofiles_qualitative).
measured(s15, carving_score_snowboardingprofiles_qualitative, absolute_carving_beast).
all_consistent(carving_score_snowboardingprofiles_qualitative) :- consistent(s15, carving_score_snowboardingprofiles_qualitative).
evidence(all_consistent(carving_score_snowboardingprofiles_qualitative)).
query(true_val(carving_score_snowboardingprofiles_qualitative, absolute_carving_beast)).
query(true_val(carving_score_snowboardingprofiles_qualitative, unk_carving_qual)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values locked_secure_high_speed=Locked_and_secure_at_high_speeds unk_user_review_forum=Unknown
% @importance 0.70

0.75::true_val(user_review_forum, locked_secure_high_speed); 0.25::true_val(user_review_forum, unk_user_review_forum).
0.72::acc(s47, user_review_forum).
measured(s47, user_review_forum, locked_secure_high_speed).
all_consistent(user_review_forum) :- consistent(s47, user_review_forum).
evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, locked_secure_high_speed)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values noticeably_lighter=Board_100g_lighter_core_than_standard_Burton unk_positive_aspect=Unknown
% @importance 0.75

0.88::true_val(positive_aspect, noticeably_lighter); 0.12::true_val(positive_aspect, unk_positive_aspect).
0.82::acc(s27, positive_aspect).
0.90::acc(s15, positive_aspect).
measured(s27, positive_aspect, noticeably_lighter).
measured(s15, positive_aspect, noticeably_lighter).
all_consistent(positive_aspect) :-
    consistent(s27, positive_aspect),
    consistent(s15, positive_aspect).
evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, noticeably_lighter)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr pop
% @type categorical
% @canonical true
% @original_name pop
% @values enormous_pop=Enormous_pop_potential_12mm_camber unk_pop=Unknown
% @importance 0.70

0.88::true_val(pop, enormous_pop); 0.12::true_val(pop, unk_pop).
0.90::acc(s15, pop).
measured(s15, pop, enormous_pop).
all_consistent(pop) :- consistent(s15, pop).
evidence(all_consistent(pop)).
query(true_val(pop, enormous_pop)).
query(true_val(pop, unk_pop)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values exceptional_hardpack_ice=Frostbite_Edges_exceptional_grip_hardpack_ice unk_edge_hold=Unknown
% @importance 0.68

0.90::true_val(edge_hold, exceptional_hardpack_ice); 0.10::true_val(edge_hold, unk_edge_hold).
0.85::acc(s20, edge_hold).
0.78::acc(s43, edge_hold).
measured(s20, edge_hold, exceptional_hardpack_ice).
measured(s43, edge_hold, exceptional_hardpack_ice).
all_consistent(edge_hold) :-
    (indep(s20), consistent(s20, edge_hold) ; \+indep(s20)),
    consistent(s43, edge_hold).
evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, exceptional_hardpack_ice)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr positive_aspect_forgiving
% @type categorical
% @canonical false
% @original_name positive_aspect (forgiving evolution)
% @values more_forgiving_now=More_forgiving_than_historical_retaining_performance unk_positive_aspect_forgiving=Unknown
% @importance 0.70

0.88::true_val(positive_aspect_forgiving, more_forgiving_now); 0.12::true_val(positive_aspect_forgiving, unk_positive_aspect_forgiving).
0.87::acc(s15, positive_aspect_forgiving).
measured(s15, positive_aspect_forgiving, more_forgiving_now).
all_consistent(positive_aspect_forgiving) :- consistent(s15, positive_aspect_forgiving).
evidence(all_consistent(positive_aspect_forgiving)).
query(true_val(positive_aspect_forgiving, more_forgiving_now)).
query(true_val(positive_aspect_forgiving, unk_positive_aspect_forgiving)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values similar_both_directions=Twin_flex_similar_feel_both_directions unk_switch_riding=Unknown
% @importance 0.55

0.85::true_val(switch_riding, similar_both_directions); 0.15::true_val(switch_riding, unk_switch_riding).
0.85::acc(s15, switch_riding).
measured(s15, switch_riding, similar_both_directions).
all_consistent(switch_riding) :- consistent(s15, switch_riding).
evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, similar_both_directions)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr positive_aspect_construction
% @type categorical
% @canonical false
% @original_name positive_aspect (construction)
% @values top_tier_construction=Top_tier_construction_and_durability unk_positive_aspect_construction=Unknown
% @importance 0.65

0.82::true_val(positive_aspect_construction, top_tier_construction); 0.18::true_val(positive_aspect_construction, unk_positive_aspect_construction).
0.78::acc(s27, positive_aspect_construction).
measured(s27, positive_aspect_construction, top_tier_construction).
all_consistent(positive_aspect_construction) :- consistent(s27, positive_aspect_construction).
evidence(all_consistent(positive_aspect_construction)).
query(true_val(positive_aspect_construction, top_tier_construction)).
query(true_val(positive_aspect_construction, unk_positive_aspect_construction)).

% @attr positive_aspect_light_feel
% @type categorical
% @canonical false
% @original_name positive_aspect (light feel)
% @values felt_lighter_than_normal=Felt_lighter_than_normal_despite_stiff unk_positive_aspect_light_feel=Unknown
% @importance 0.75

0.88::true_val(positive_aspect_light_feel, felt_lighter_than_normal); 0.12::true_val(positive_aspect_light_feel, unk_positive_aspect_light_feel).
0.90::acc(s15, positive_aspect_light_feel).
measured(s15, positive_aspect_light_feel, felt_lighter_than_normal).
all_consistent(positive_aspect_light_feel) :- consistent(s15, positive_aspect_light_feel).
evidence(all_consistent(positive_aspect_light_feel)).
query(true_val(positive_aspect_light_feel, felt_lighter_than_normal)).
query(true_val(positive_aspect_light_feel, unk_positive_aspect_light_feel)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values avg_powder=Average_powder_due_to_camber_back_leg_burner unk_negative_aspect=Unknown
% @importance 0.80

0.90::true_val(negative_aspect, avg_powder); 0.10::true_val(negative_aspect, unk_negative_aspect).
0.88::acc(s15, negative_aspect).
measured(s15, negative_aspect, avg_powder).
all_consistent(negative_aspect) :- consistent(s15, negative_aspect).
evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, avg_powder)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_slow_speed
% @type categorical
% @canonical false
% @original_name negative_aspect (slow speed)
% @values not_agile_slow=Not_agile_at_slow_speeds_hard_to_initiate_turns unk_negative_aspect_slow_speed=Unknown
% @importance 0.75

0.90::true_val(negative_aspect_slow_speed, not_agile_slow); 0.10::true_val(negative_aspect_slow_speed, unk_negative_aspect_slow_speed).
0.88::acc(s15, negative_aspect_slow_speed).
measured(s15, negative_aspect_slow_speed, not_agile_slow).
all_consistent(negative_aspect_slow_speed) :- consistent(s15, negative_aspect_slow_speed).
evidence(all_consistent(negative_aspect_slow_speed)).
query(true_val(negative_aspect_slow_speed, not_agile_slow)).
query(true_val(negative_aspect_slow_speed, unk_negative_aspect_slow_speed)).

% @attr negative_aspect_catchy
% @type categorical
% @canonical false
% @original_name negative_aspect (catchy)
% @values most_catchy_slow=Most_catchy_at_slower_speeds unk_negative_aspect_catchy=Unknown
% @importance 0.75

0.90::true_val(negative_aspect_catchy, most_catchy_slow); 0.10::true_val(negative_aspect_catchy, unk_negative_aspect_catchy).
0.88::acc(s15, negative_aspect_catchy).
measured(s15, negative_aspect_catchy, most_catchy_slow).
all_consistent(negative_aspect_catchy) :- consistent(s15, negative_aspect_catchy).
evidence(all_consistent(negative_aspect_catchy)).
query(true_val(negative_aspect_catchy, most_catchy_slow)).
query(true_val(negative_aspect_catchy, unk_negative_aspect_catchy)).

% @attr negative_aspect_beginner
% @type categorical
% @canonical false
% @original_name negative_aspect (beginner)
% @values too_stiff_beginners=Too_stiff_technical_for_beginners_intermediates unk_negative_aspect_beginner=Unknown
% @importance 0.80

0.87::true_val(negative_aspect_beginner, too_stiff_beginners); 0.13::true_val(negative_aspect_beginner, unk_negative_aspect_beginner).
0.82::acc(s44, negative_aspect_beginner).
measured(s44, negative_aspect_beginner, too_stiff_beginners).
all_consistent(negative_aspect_beginner) :- consistent(s44, negative_aspect_beginner).
evidence(all_consistent(negative_aspect_beginner)).
query(true_val(negative_aspect_beginner, too_stiff_beginners)).
query(true_val(negative_aspect_beginner, unk_negative_aspect_beginner)).

% @attr negative_aspect_pop_sweetspot
% @type categorical
% @canonical false
% @original_name negative_aspect (pop sweet spot)
% @values narrow_sweetspot=Narrow_sweet_spot_for_popping unk_negative_aspect_pop_sweetspot=Unknown
% @importance 0.60

0.72::true_val(negative_aspect_pop_sweetspot, narrow_sweetspot); 0.28::true_val(negative_aspect_pop_sweetspot, unk_negative_aspect_pop_sweetspot).
0.70::acc(s54, negative_aspect_pop_sweetspot).
measured(s54, negative_aspect_pop_sweetspot, narrow_sweetspot).
all_consistent(negative_aspect_pop_sweetspot) :- consistent(s54, negative_aspect_pop_sweetspot).
evidence(all_consistent(negative_aspect_pop_sweetspot)).
query(true_val(negative_aspect_pop_sweetspot, narrow_sweetspot)).
query(true_val(negative_aspect_pop_sweetspot, unk_negative_aspect_pop_sweetspot)).

% @attr chatter_performance
% @type categorical
% @canonical true
% @original_name chatter_performance
% @values chattery_variable=Chattery_in_variable_conditions_lightness_less_invincible unk_chatter_performance=Unknown
% @importance 0.73

0.85::true_val(chatter_performance, chattery_variable); 0.15::true_val(chatter_performance, unk_chatter_performance).
0.82::acc(s11, chatter_performance).
measured(s11, chatter_performance, chattery_variable).
all_consistent(chatter_performance) :- consistent(s11, chatter_performance).
evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, chattery_variable)).
query(true_val(chatter_performance, unk_chatter_performance)).

% @attr negative_aspect_jibbing
% @type categorical
% @canonical false
% @original_name negative_aspect (jibbing)
% @values not_suited_jibbing=Not_suited_for_jibbing_unforgiving_rails unk_negative_aspect_jibbing=Unknown
% @importance 0.55

0.90::true_val(negative_aspect_jibbing, not_suited_jibbing); 0.10::true_val(negative_aspect_jibbing, unk_negative_aspect_jibbing).
0.88::acc(s15, negative_aspect_jibbing).
measured(s15, negative_aspect_jibbing, not_suited_jibbing).
all_consistent(negative_aspect_jibbing) :- consistent(s15, negative_aspect_jibbing).
evidence(all_consistent(negative_aspect_jibbing)).
query(true_val(negative_aspect_jibbing, not_suited_jibbing)).
query(true_val(negative_aspect_jibbing, unk_negative_aspect_jibbing)).

% @attr negative_aspect_pressing
% @type categorical
% @canonical false
% @original_name negative_aspect (pressing)
% @values requires_muscling=Requires_significant_muscling_to_press unk_negative_aspect_pressing=Unknown
% @importance 0.45

0.88::true_val(negative_aspect_pressing, requires_muscling); 0.12::true_val(negative_aspect_pressing, unk_negative_aspect_pressing).
0.85::acc(s15, negative_aspect_pressing).
measured(s15, negative_aspect_pressing, requires_muscling).
all_consistent(negative_aspect_pressing) :- consistent(s15, negative_aspect_pressing).
evidence(all_consistent(negative_aspect_pressing)).
query(true_val(negative_aspect_pressing, requires_muscling)).
query(true_val(negative_aspect_pressing, unk_negative_aspect_pressing)).

% @attr negative_aspect_price
% @type categorical
% @canonical false
% @original_name negative_aspect (price)
% @values most_expensive_am=Among_most_expensive_at_899_vs_avg_655 unk_negative_aspect_price=Unknown
% @importance 0.95

0.90::true_val(negative_aspect_price, most_expensive_am); 0.10::true_val(negative_aspect_price, unk_negative_aspect_price).
0.90::acc(s15, negative_aspect_price).
measured(s15, negative_aspect_price, most_expensive_am).
all_consistent(negative_aspect_price) :- consistent(s15, negative_aspect_price).
evidence(all_consistent(negative_aspect_price)).
query(true_val(negative_aspect_price, most_expensive_am)).
query(true_val(negative_aspect_price, unk_negative_aspect_price)).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values channel_all_brands=Channel_requires_Burton_inserts_works_all_brands unk_binding_compatibility=Unknown
% @importance 0.80

0.93::true_val(binding_compatibility, channel_all_brands); 0.07::true_val(binding_compatibility, unk_binding_compatibility).
0.88::acc(s13, binding_compatibility).
measured(s13, binding_compatibility, channel_all_brands).
all_consistent(binding_compatibility) :-
    (indep(s13), consistent(s13, binding_compatibility) ; \+indep(s13)).
evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, channel_all_brands)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values burton_custom=Burton_Custom_softer_flex_lighter_core_less_expensive unk_comparable_same_brand=Unknown
% @importance 0.70

0.85::true_val(comparable_board_same_brand, burton_custom); 0.15::true_val(comparable_board_same_brand, unk_comparable_same_brand).
0.80::acc(s38, comparable_board_same_brand).
measured(s38, comparable_board_same_brand, burton_custom).
all_consistent(comparable_board_same_brand) :-
    (indep(s38), consistent(s38, comparable_board_same_brand) ; \+indep(s38)).
evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, burton_custom)).
query(true_val(comparable_board_same_brand, unk_comparable_same_brand)).

% @attr comparable_board_same_brand_detail
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (core detail)
% @values custom_700g_vs_x_600g=Custom_SuperFlyII_700G_vs_CustomX_Dragonfly_600G unk_comparable_same_brand_detail=Unknown
% @importance 0.73

0.85::true_val(comparable_board_same_brand_detail, custom_700g_vs_x_600g); 0.15::true_val(comparable_board_same_brand_detail, unk_comparable_same_brand_detail).
0.80::acc(s27, comparable_board_same_brand_detail).
0.78::acc(s38, comparable_board_same_brand_detail).
measured(s27, comparable_board_same_brand_detail, custom_700g_vs_x_600g).
measured(s38, comparable_board_same_brand_detail, custom_700g_vs_x_600g).
all_consistent(comparable_board_same_brand_detail) :-
    consistent(s27, comparable_board_same_brand_detail),
    (indep(s38), consistent(s38, comparable_board_same_brand_detail) ; \+indep(s38)).
evidence(all_consistent(comparable_board_same_brand_detail)).
query(true_val(comparable_board_same_brand_detail, custom_700g_vs_x_600g)).
query(true_val(comparable_board_same_brand_detail, unk_comparable_same_brand_detail)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values jones_flagship=Jones_Flagship_rocker_contacts_mellows_camber unk_comparable_cross_brand=Unknown
% @importance 0.75

0.75::true_val(comparable_board_cross_brand, jones_flagship); 0.25::true_val(comparable_board_cross_brand, unk_comparable_cross_brand).
0.72::acc(s47, comparable_board_cross_brand).
measured(s47, comparable_board_cross_brand, jones_flagship).
all_consistent(comparable_board_cross_brand) :- consistent(s47, comparable_board_cross_brand).
evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, jones_flagship)).
query(true_val(comparable_board_cross_brand, unk_comparable_cross_brand)).

% @attr comparable_board_cross_brand_jones_mt
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Jones Mountain Twin)
% @values jones_mountain_twin=Jones_Mountain_Twin_CamRock_more_forgiving unk_comparable_jones_mt=Unknown
% @importance 0.60

0.72::true_val(comparable_board_cross_brand_jones_mt, jones_mountain_twin); 0.28::true_val(comparable_board_cross_brand_jones_mt, unk_comparable_jones_mt).
0.68::acc(s60, comparable_board_cross_brand_jones_mt).
measured(s60, comparable_board_cross_brand_jones_mt, jones_mountain_twin).
all_consistent(comparable_board_cross_brand_jones_mt) :- consistent(s60, comparable_board_cross_brand_jones_mt).
evidence(all_consistent(comparable_board_cross_brand_jones_mt)).
query(true_val(comparable_board_cross_brand_jones_mt, jones_mountain_twin)).
query(true_val(comparable_board_cross_brand_jones_mt, unk_comparable_jones_mt)).

% @attr comparable_board_cross_brand_orca
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Lib Tech T.Rice Orca)
% @values lib_tech_orca=Lib_Tech_TRice_Orca_volume_shifted_better_powder unk_comparable_orca=Unknown
% @importance 0.60

0.78::true_val(comparable_board_cross_brand_orca, lib_tech_orca); 0.22::true_val(comparable_board_cross_brand_orca, unk_comparable_orca).
0.75::acc(s61, comparable_board_cross_brand_orca).
measured(s61, comparable_board_cross_brand_orca, lib_tech_orca).
all_consistent(comparable_board_cross_brand_orca) :- consistent(s61, comparable_board_cross_brand_orca).
evidence(all_consistent(comparable_board_cross_brand_orca)).
query(true_val(comparable_board_cross_brand_orca, lib_tech_orca)).
query(true_val(comparable_board_cross_brand_orca, unk_comparable_orca)).

% @attr comparable_board_cross_brand_pantera
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Nitro Pantera)
% @values nitro_pantera=Nitro_Pantera_similar_stiffness unk_comparable_pantera=Unknown
% @importance 0.65

0.72::true_val(comparable_board_cross_brand_pantera, nitro_pantera); 0.28::true_val(comparable_board_cross_brand_pantera, unk_comparable_pantera).
0.68::acc(s47, comparable_board_cross_brand_pantera).
measured(s47, comparable_board_cross_brand_pantera, nitro_pantera).
all_consistent(comparable_board_cross_brand_pantera) :- consistent(s47, comparable_board_cross_brand_pantera).
evidence(all_consistent(comparable_board_cross_brand_pantera)).
query(true_val(comparable_board_cross_brand_pantera, nitro_pantera)).
query(true_val(comparable_board_cross_brand_pantera, unk_comparable_pantera)).

% @attr comparable_board_cross_brand_other
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (other chargers)
% @values other_chargers=Mentioned_as_alternatives_for_locked_in_charging unk_comparable_other=Unknown
% @importance 0.65

0.72::true_val(comparable_board_cross_brand_other, other_chargers); 0.28::true_val(comparable_board_cross_brand_other, unk_comparable_other).
0.68::acc(s47, comparable_board_cross_brand_other).
measured(s47, comparable_board_cross_brand_other, other_chargers).
all_consistent(comparable_board_cross_brand_other) :- consistent(s47, comparable_board_cross_brand_other).
evidence(all_consistent(comparable_board_cross_brand_other)).
query(true_val(comparable_board_cross_brand_other, other_chargers)).
query(true_val(comparable_board_cross_brand_other, unk_comparable_other)).

% @attr comparable_board_cross_brand_amplid
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Amplid Unw8)
% @values amplid_unw8=Amplid_Unw8_much_stiffer_freight_train unk_comparable_amplid=Unknown
% @importance 0.65

0.72::true_val(comparable_board_cross_brand_amplid, amplid_unw8); 0.28::true_val(comparable_board_cross_brand_amplid, unk_comparable_amplid).
0.68::acc(s47, comparable_board_cross_brand_amplid).
measured(s47, comparable_board_cross_brand_amplid, amplid_unw8).
all_consistent(comparable_board_cross_brand_amplid) :- consistent(s47, comparable_board_cross_brand_amplid).
evidence(all_consistent(comparable_board_cross_brand_amplid)).
query(true_val(comparable_board_cross_brand_amplid, amplid_unw8)).
query(true_val(comparable_board_cross_brand_amplid, unk_comparable_amplid)).

% @attr comparable_board_cross_brand_ultralight
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (softer ultralight)
% @values softer_ultralight_7=Softer_ultralight_version_7_of_10_flex unk_comparable_ultralight=Unknown
% @importance 0.65

0.72::true_val(comparable_board_cross_brand_ultralight, softer_ultralight_7); 0.28::true_val(comparable_board_cross_brand_ultralight, unk_comparable_ultralight).
0.68::acc(s47, comparable_board_cross_brand_ultralight).
measured(s47, comparable_board_cross_brand_ultralight, softer_ultralight_7).
all_consistent(comparable_board_cross_brand_ultralight) :- consistent(s47, comparable_board_cross_brand_ultralight).
evidence(all_consistent(comparable_board_cross_brand_ultralight)).
query(true_val(comparable_board_cross_brand_ultralight, softer_ultralight_7)).
query(true_val(comparable_board_cross_brand_ultralight, unk_comparable_ultralight)).

% @attr avg_price_comparison_sp
% @type numeric
% @unit USD
% @canonical false
% @original_name Average price of aggressive all-mountain boards tested
% @values v655=655.0 unk_avg_price_comparison_sp=Unknown
% @importance 0.95

0.90::true_val(avg_price_comparison_sp, v655); 0.10::true_val(avg_price_comparison_sp, unk_avg_price_comparison_sp).
0.88::acc(s15, avg_price_comparison_sp).
measured(s15, avg_price_comparison_sp, v655).
all_consistent(avg_price_comparison_sp) :- consistent(s15, avg_price_comparison_sp).
evidence(all_consistent(avg_price_comparison_sp)).
query(true_val(avg_price_comparison_sp, v655)).
query(true_val(avg_price_comparison_sp, unk_avg_price_comparison_sp)).

% @attr brand_description
% @type categorical
% @canonical false
% @original_name Burton brand description
% @values first_complete_range=Worlds_first_snowboard_company_most_complete_range unk_brand_description=Unknown
% @importance 0.50

0.72::true_val(brand_description, first_complete_range); 0.28::true_val(brand_description, unk_brand_description).
0.65::acc(s63, brand_description).
measured(s63, brand_description, first_complete_range).
all_consistent(brand_description) :- consistent(s63, brand_description).
evidence(all_consistent(brand_description)).
query(true_val(brand_description, first_complete_range)).
query(true_val(brand_description, unk_brand_description)).

% @attr brand_reputation_community
% @type categorical
% @canonical false
% @original_name Burton reputation (community)
% @values criticism_but_durable=Gets_criticism_for_dominance_but_gear_holds_up unk_brand_reputation_community=Unknown
% @importance 0.45

0.72::true_val(brand_reputation_community, criticism_but_durable); 0.28::true_val(brand_reputation_community, unk_brand_reputation_community).
0.65::acc(s63, brand_reputation_community).
measured(s63, brand_reputation_community, criticism_but_durable).
all_consistent(brand_reputation_community) :- consistent(s63, brand_reputation_community).
evidence(all_consistent(brand_reputation_community)).
query(true_val(brand_reputation_community, criticism_but_durable)).
query(true_val(brand_reputation_community, unk_brand_reputation_community)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values b_corp=B_Corp_certified unk_sustainability_certification=Unknown
% @importance 1.00

0.93::true_val(sustainability_certification, b_corp); 0.07::true_val(sustainability_certification, unk_sustainability_certification).
0.90::acc(s6, sustainability_certification).
measured(s6, sustainability_certification, b_corp).
all_consistent(sustainability_certification) :- consistent(s6, sustainability_certification).
evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, b_corp)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr retailer_info_evo
% @type categorical
% @canonical false
% @original_name evo.com retailer info
% @values major_us_retailer=Major_US_retailer_1yr_returns_price_match_rewards unk_retailer_info_evo=Unknown
% @importance 0.95

0.93::true_val(retailer_info_evo, major_us_retailer); 0.07::true_val(retailer_info_evo, unk_retailer_info_evo).
0.90::acc(s13, retailer_info_evo).
measured(s13, retailer_info_evo, major_us_retailer).
all_consistent(retailer_info_evo) :- consistent(s13, retailer_info_evo).
evidence(all_consistent(retailer_info_evo)).
query(true_val(retailer_info_evo, major_us_retailer)).
query(true_val(retailer_info_evo, unk_retailer_info_evo)).

% @attr retailer_info_rei
% @type categorical
% @canonical false
% @original_name REI retailer info
% @values major_us_outdoor=Major_US_outdoor_retailer_satisfaction_guarantee unk_retailer_info_rei=Unknown
% @importance 0.70

0.88::true_val(retailer_info_rei, major_us_outdoor); 0.12::true_val(retailer_info_rei, unk_retailer_info_rei).
0.85::acc(s19, retailer_info_rei).
measured(s19, retailer_info_rei, major_us_outdoor).
all_consistent(retailer_info_rei) :- consistent(s19, retailer_info_rei).
evidence(all_consistent(retailer_info_rei)).
query(true_val(retailer_info_rei, major_us_outdoor)).
query(true_val(retailer_info_rei, unk_retailer_info_rei)).

% @attr return_policy_terms
% @type categorical
% @canonical true
% @original_name return_policy_terms
% @values d14_refund_365_exchange=14_day_refund_or_365_day_exchange_ships_Australia unk_return_policy_terms=Unknown
% @importance 0.75

0.88::true_val(return_policy_terms, d14_refund_365_exchange); 0.12::true_val(return_policy_terms, unk_return_policy_terms).
0.85::acc(s20, return_policy_terms).
measured(s20, return_policy_terms, d14_refund_365_exchange).
all_consistent(return_policy_terms) :-
    (indep(s20), consistent(s20, return_policy_terms) ; \+indep(s20)).
evidence(all_consistent(return_policy_terms)).
query(true_val(return_policy_terms, d14_refund_365_exchange)).
query(true_val(return_policy_terms, unk_return_policy_terms)).

% @attr return_policy_terms_melbourne
% @type categorical
% @canonical false
% @original_name return_policy_terms (Melbourne Snowboard)
% @values d30_credit_20pct_restock=30_day_store_credit_exchange_20pct_restocking unk_return_policy_terms_melbourne=Unknown
% @importance 0.55

0.87::true_val(return_policy_terms_melbourne, d30_credit_20pct_restock); 0.13::true_val(return_policy_terms_melbourne, unk_return_policy_terms_melbourne).
0.82::acc(s_m, return_policy_terms_melbourne).
measured(s_m, return_policy_terms_melbourne, d30_credit_20pct_restock).
all_consistent(return_policy_terms_melbourne) :- consistent(s_m, return_policy_terms_melbourne).
evidence(all_consistent(return_policy_terms_melbourne)).
query(true_val(return_policy_terms_melbourne, d30_credit_20pct_restock)).
query(true_val(return_policy_terms_melbourne, unk_return_policy_terms_melbourne)).

% @attr retailer_info_basenz
% @type categorical
% @canonical false
% @original_name BaseNZ retailer info
% @values nz_retailer_rewards=NZ_focused_retailer_rider_rewards unk_retailer_info_basenz=Unknown
% @importance 0.50

0.82::true_val(retailer_info_basenz, nz_retailer_rewards); 0.18::true_val(retailer_info_basenz, unk_retailer_info_basenz).
0.78::acc(s2, retailer_info_basenz).
measured(s2, retailer_info_basenz, nz_retailer_rewards).
all_consistent(retailer_info_basenz) :-
    (indep(s2), consistent(s2, retailer_info_basenz) ; \+indep(s2)).
evidence(all_consistent(retailer_info_basenz)).
query(true_val(retailer_info_basenz, nz_retailer_rewards)).
query(true_val(retailer_info_basenz, unk_retailer_info_basenz)).

% @attr retailer_info_skatepro
% @type categorical
% @canonical false
% @original_name SkatePro retailer info
% @values intl_retailer_free_ship=International_retailer_free_shipping unk_retailer_info_skatepro=Unknown
% @importance 0.85

0.87::true_val(retailer_info_skatepro, intl_retailer_free_ship); 0.13::true_val(retailer_info_skatepro, unk_retailer_info_skatepro).
0.82::acc(s14, retailer_info_skatepro).
measured(s14, retailer_info_skatepro, intl_retailer_free_ship).
all_consistent(retailer_info_skatepro) :-
    (indep(s14), consistent(s14, retailer_info_skatepro) ; \+indep(s14)).
evidence(all_consistent(retailer_info_skatepro)).
query(true_val(retailer_info_skatepro, intl_retailer_free_ship)).
query(true_val(retailer_info_skatepro, unk_retailer_info_skatepro)).

% @attr return_policy_terms_ski_monster
% @type categorical
% @canonical false
% @original_name return_policy_terms (Ski Monster)
% @values d90_returns_tests_all=Staff_tests_all_90_day_returns_2_day_dispatch unk_return_policy_terms_sm=Unknown
% @importance 0.40

0.78::true_val(return_policy_terms_ski_monster, d90_returns_tests_all); 0.22::true_val(return_policy_terms_ski_monster, unk_return_policy_terms_sm).
0.75::acc(s38, return_policy_terms_ski_monster).
measured(s38, return_policy_terms_ski_monster, d90_returns_tests_all).
all_consistent(return_policy_terms_ski_monster) :-
    (indep(s38), consistent(s38, return_policy_terms_ski_monster) ; \+indep(s38)).
evidence(all_consistent(return_policy_terms_ski_monster)).
query(true_val(return_policy_terms_ski_monster, d90_returns_tests_all)).
query(true_val(return_policy_terms_ski_monster, unk_return_policy_terms_sm)).

% @attr retailer_info_blauer
% @type categorical
% @canonical false
% @original_name Blauer Board Shop retailer info
% @values expert_guidance_decades=Expert_guidance_decades_experience unk_retailer_info_blauer=Unknown
% @importance 0.50

0.82::true_val(retailer_info_blauer, expert_guidance_decades); 0.18::true_val(retailer_info_blauer, unk_retailer_info_blauer).
0.78::acc(s21, retailer_info_blauer).
measured(s21, retailer_info_blauer, expert_guidance_decades).
all_consistent(retailer_info_blauer) :-
    (indep(s21), consistent(s21, retailer_info_blauer) ; \+indep(s21)).
evidence(all_consistent(retailer_info_blauer)).
query(true_val(retailer_info_blauer, expert_guidance_decades)).
query(true_val(retailer_info_blauer, unk_retailer_info_blauer)).

% @attr sustainability_certification_resin
% @type categorical
% @canonical false
% @original_name sustainability_certification (resin)
% @values super_sap_50pct=Super_Sap_Epoxy_50pct_carbon_reduction unk_sustainability_resin=Unknown
% @importance 0.50

0.93::true_val(sustainability_certification_resin, super_sap_50pct); 0.07::true_val(sustainability_certification_resin, unk_sustainability_resin).
0.88::acc(s13, sustainability_certification_resin).
measured(s13, sustainability_certification_resin, super_sap_50pct).
all_consistent(sustainability_certification_resin) :-
    (indep(s13), consistent(s13, sustainability_certification_resin) ; \+indep(s13)).
evidence(all_consistent(sustainability_certification_resin)).
query(true_val(sustainability_certification_resin, super_sap_50pct)).
query(true_val(sustainability_certification_resin, unk_sustainability_resin)).

% @attr sustainability_certification_confirmed
% @type categorical
% @canonical false
% @original_name sustainability_certification (confirmed)
% @values confirmed_burton_footer=Confirmed_by_Burton_website unk_sustainability_confirmed=Unknown
% @importance 1.00

0.93::true_val(sustainability_certification_confirmed, confirmed_burton_footer); 0.07::true_val(sustainability_certification_confirmed, unk_sustainability_confirmed).
0.90::acc(s6, sustainability_certification_confirmed).
measured(s6, sustainability_certification_confirmed, confirmed_burton_footer).
all_consistent(sustainability_certification_confirmed) :- consistent(s6, sustainability_certification_confirmed).
evidence(all_consistent(sustainability_certification_confirmed)).
query(true_val(sustainability_certification_confirmed, confirmed_burton_footer)).
query(true_val(sustainability_certification_confirmed, unk_sustainability_confirmed)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values olympic_backcountry=Burton_riders_Olympic_competition_backcountry unk_pro_rider_name=Unknown
% @importance 0.50

0.82::true_val(pro_rider_name, olympic_backcountry); 0.18::true_val(pro_rider_name, unk_pro_rider_name).
0.78::acc(s20, pro_rider_name).
measured(s20, pro_rider_name, olympic_backcountry).
all_consistent(pro_rider_name) :-
    (indep(s20), consistent(s20, pro_rider_name) ; \+indep(s20)).
evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, olympic_backcountry)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr pro_rider_name_red_gerard
% @type categorical
% @canonical false
% @original_name pro_rider_name (Red Gerard)
% @values red_gerard_2018_olympic=Red_Gerard_Olympic_slopestyle_2018 unk_pro_rider_red_gerard=Unknown
% @importance 0.45

0.88::true_val(pro_rider_name_red_gerard, red_gerard_2018_olympic); 0.12::true_val(pro_rider_name_red_gerard, unk_pro_rider_red_gerard).
0.85::acc(s43, pro_rider_name_red_gerard).
measured(s43, pro_rider_name_red_gerard, red_gerard_2018_olympic).
all_consistent(pro_rider_name_red_gerard) :- consistent(s43, pro_rider_name_red_gerard).
evidence(all_consistent(pro_rider_name_red_gerard)).
query(true_val(pro_rider_name_red_gerard, red_gerard_2018_olympic)).
query(true_val(pro_rider_name_red_gerard, unk_pro_rider_red_gerard)).