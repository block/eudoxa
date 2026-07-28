0.15::indep(s10).
0.20::indep(s9).
0.15::indep(s25).
0.15::indep(s32).
0.20::indep(s17).
0.15::indep(s18).
0.12::indep(s20).
0.12::indep(s35).
0.12::indep(s33).
0.20::indep(s114).
0.15::indep(s115).
0.15::indep(sm).
0.15::indep(s12).
0.15::indep(s4).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values burton=Burton unk_brand=Unknown
% @importance 0.95

0.95::true_val(brand, burton); 0.05::true_val(brand, unk_brand).
0.95::acc(s1, brand).
0.75::acc(s10, brand).
measured(s1, brand, burton).
measured(s10, brand, burton).
all_consistent(brand) :- consistent(s1, brand), (indep(s10), consistent(s10, brand) ; \+indep(s10)).
evidence(all_consistent(brand)).
query(true_val(brand, burton)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values process_flying_v=Process_Flying_V unk_model_name=Unknown
% @importance 0.95

0.95::true_val(model_name, process_flying_v); 0.05::true_val(model_name, unk_model_name).
0.95::acc(s1, model_name).
0.75::acc(s10, model_name).
measured(s1, model_name, process_flying_v).
measured(s10, model_name, process_flying_v).
all_consistent(model_name) :- consistent(s1, model_name), (indep(s10), consistent(s10, model_name) ; \+indep(s10)).
evidence(all_consistent(model_name)).
query(true_val(model_name, process_flying_v)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2025=2025 unk_model_year=Unknown
% @importance 0.9

0.93::true_val(model_year, y2025); 0.07::true_val(model_year, unk_model_year).
0.90::acc(s10, model_year).
measured(s10, model_year, y2025).
all_consistent(model_year) :- (indep(s10), consistent(s10, model_year) ; \+indep(s10)).
evidence(all_consistent(model_year)).
query(true_val(model_year, y2025)).
query(true_val(model_year, unk_model_year)).

% @attr model_series
% @type categorical
% @canonical false
% @original_name Model series
% @values process_line=Process_long_running_line unk_model_series=Unknown
% @importance 0.9

0.90::true_val(model_series, process_line); 0.10::true_val(model_series, unk_model_series).
0.80::acc(s10, model_series).
measured(s10, model_series, process_line).
all_consistent(model_series) :- (indep(s10), consistent(s10, model_series) ; \+indep(s10)).
evidence(all_consistent(model_series)).
query(true_val(model_series, process_line)).
query(true_val(model_series, unk_model_series)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.95::true_val(product_type, snowboard); 0.05::true_val(product_type, unk_product_type).
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
% @values mens=Mens unk_gender=Unknown
% @importance 0.975

0.95::true_val(gender, mens); 0.05::true_val(gender, unk_gender).
0.95::acc(s1, gender).
0.85::acc(s9, gender).
measured(s1, gender, mens).
measured(s9, gender, mens).
all_consistent(gender) :- consistent(s1, gender), (indep(s9), consistent(s9, gender) ; \+indep(s9)).
evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values burton_snowboards=Burton_Snowboards_founded_1977_Vermont unk_manufacturer=Unknown
% @importance 0.55

0.93::true_val(manufacturer, burton_snowboards); 0.07::true_val(manufacturer, unk_manufacturer).
0.90::acc(s17, manufacturer).
0.95::acc(s55, manufacturer).
measured(s17, manufacturer, burton_snowboards).
measured(s55, manufacturer, burton_snowboards).
all_consistent(manufacturer) :- consistent(s55, manufacturer), (indep(s17), consistent(s17, manufacturer) ; \+indep(s17)).
evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, burton_snowboards)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr manufacturer_headquarters
% @type categorical
% @canonical false
% @original_name Manufacturer headquarters
% @values burlington_vt_usa=Burlington_Vermont_USA unk_manufacturer_headquarters=Unknown
% @importance 0.4

0.90::true_val(manufacturer_headquarters, burlington_vt_usa); 0.10::true_val(manufacturer_headquarters, unk_manufacturer_headquarters).
0.95::acc(s55, manufacturer_headquarters).
measured(s55, manufacturer_headquarters, burlington_vt_usa).
all_consistent(manufacturer_headquarters) :- consistent(s55, manufacturer_headquarters).
evidence(all_consistent(manufacturer_headquarters)).
query(true_val(manufacturer_headquarters, burlington_vt_usa)).
query(true_val(manufacturer_headquarters, unk_manufacturer_headquarters)).

% @attr manufacturer_reputation
% @type categorical
% @canonical false
% @original_name Manufacturer reputation
% @values bcorp_established_1977=B_Corp_certified_established_globally_since_1977 unk_manufacturer_reputation=Unknown
% @importance 0.55

0.93::true_val(manufacturer_reputation, bcorp_established_1977); 0.07::true_val(manufacturer_reputation, unk_manufacturer_reputation).
0.95::acc(s55, manufacturer_reputation).
0.80::acc(s17, manufacturer_reputation).
measured(s55, manufacturer_reputation, bcorp_established_1977).
measured(s17, manufacturer_reputation, bcorp_established_1977).
all_consistent(manufacturer_reputation) :- consistent(s55, manufacturer_reputation), (indep(s17), consistent(s17, manufacturer_reputation) ; \+indep(s17)).
evidence(all_consistent(manufacturer_reputation)).
query(true_val(manufacturer_reputation, bcorp_established_1977)).
query(true_val(manufacturer_reputation, unk_manufacturer_reputation)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values mark_mcmorris=Mark_McMorris unk_pro_rider_name=Unknown
% @importance 0.775

0.88::true_val(pro_rider_name, mark_mcmorris); 0.12::true_val(pro_rider_name, unk_pro_rider_name).
0.80::acc(s4, pro_rider_name).
0.85::acc(s9, pro_rider_name).
measured(s4, pro_rider_name, mark_mcmorris).
measured(s9, pro_rider_name, mark_mcmorris).
all_consistent(pro_rider_name) :- (indep(s4), consistent(s4, pro_rider_name) ; \+indep(s4)), (indep(s9), consistent(s9, pro_rider_name) ; \+indep(s9)).
evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, mark_mcmorris)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values y2011=2011 unk_model_first_available_year=Unknown
% @importance 0.5

0.88::true_val(model_first_available_year, y2011); 0.12::true_val(model_first_available_year, unk_model_first_available_year).
0.85::acc(s58, model_first_available_year).
0.85::acc(s87, model_first_available_year).
measured(s58, model_first_available_year, y2011).
measured(s87, model_first_available_year, y2011).
all_consistent(model_first_available_year) :- consistent(s58, model_first_available_year), consistent(s87, model_first_available_year).
evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2011)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr model_first_available_year_fv
% @type categorical
% @canonical false
% @original_name model_first_available_year (Flying V variant)
% @values y2011_2012=2011_2012_season unk_model_first_available_year_fv=Unknown
% @importance 0.5

0.85::true_val(model_first_available_year_fv, y2011_2012); 0.15::true_val(model_first_available_year_fv, unk_model_first_available_year_fv).
0.82::acc(s84, model_first_available_year_fv).
measured(s84, model_first_available_year_fv, y2011_2012).
all_consistent(model_first_available_year_fv) :- consistent(s84, model_first_available_year_fv).
evidence(all_consistent(model_first_available_year_fv)).
query(true_val(model_first_available_year_fv, y2011_2012)).
query(true_val(model_first_available_year_fv, unk_model_first_available_year_fv)).

% @attr redesign_year
% @type categorical
% @canonical true
% @original_name redesign_year
% @values y2025_same_as_2024_155w_new=2025_identical_to_2024_except_graphic_155W_new unk_redesign_year=Unknown
% @importance 0.825

0.90::true_val(redesign_year, y2025_same_as_2024_155w_new); 0.10::true_val(redesign_year, unk_redesign_year).
0.88::acc(s11, redesign_year).
measured(s11, redesign_year, y2025_same_as_2024_155w_new).
all_consistent(redesign_year) :- consistent(s11, redesign_year).
evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, y2025_same_as_2024_155w_new)).
query(true_val(redesign_year, unk_redesign_year)).

% @attr unchanged_design_run
% @type categorical
% @canonical false
% @original_name Unchanged design run
% @values since_2017_to_2025=Specs_unchanged_2017_through_2025 unk_unchanged_design_run=Unknown
% @importance 0.6

0.85::true_val(unchanged_design_run, since_2017_to_2025); 0.15::true_val(unchanged_design_run, unk_unchanged_design_run).
0.82::acc(s11, unchanged_design_run).
measured(s11, unchanged_design_run, since_2017_to_2025).
all_consistent(unchanged_design_run) :- consistent(s11, unchanged_design_run).
evidence(all_consistent(unchanged_design_run)).
query(true_val(unchanged_design_run, since_2017_to_2025)).
query(true_val(unchanged_design_run, unk_unchanged_design_run)).

% @attr sku_merchant
% @type categorical
% @canonical false
% @original_name SKU (merchant)
% @values sku_10713111000_155w=10713111000_155w unk_sku_merchant=Unknown
% @importance 0.85

0.95::true_val(sku_merchant, sku_10713111000_155w); 0.05::true_val(sku_merchant, unk_sku_merchant).
0.95::acc(sm, sku_merchant).
measured(sm, sku_merchant, sku_10713111000_155w).
all_consistent(sku_merchant) :- (indep(sm), consistent(sm, sku_merchant) ; \+indep(sm)).
evidence(all_consistent(sku_merchant)).
query(true_val(sku_merchant, sku_10713111000_155w)).
query(true_val(sku_merchant, unk_sku_merchant)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values three_year=3_year_warranty_from_purchase unk_warranty=Unknown
% @importance 0.875

0.93::true_val(warranty, three_year); 0.07::true_val(warranty, unk_warranty).
0.80::acc(s10, warranty).
0.78::acc(s35, warranty).
measured(s10, warranty, three_year).
measured(s35, warranty, three_year).
all_consistent(warranty) :- (indep(s10), consistent(s10, warranty) ; \+indep(s10)), (indep(s35), consistent(s35, warranty) ; \+indep(s35)).
evidence(all_consistent(warranty)).
query(true_val(warranty, three_year)).
query(true_val(warranty, unk_warranty)).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v549_95=549.95 unk_price_usd_msrp=Unknown
% @importance 0.883

0.95::true_val(price_usd_msrp, v549_95); 0.05::true_val(price_usd_msrp, unk_price_usd_msrp).
0.90::acc(s32, price_usd_msrp).
0.88::acc(s35, price_usd_msrp).
0.92::acc(s9, price_usd_msrp).
measured(s32, price_usd_msrp, v549_95).
measured(s35, price_usd_msrp, v549_95).
measured(s9, price_usd_msrp, v549_95).
all_consistent(price_usd_msrp) :- (indep(s32), consistent(s32, price_usd_msrp) ; \+indep(s32)), (indep(s35), consistent(s35, price_usd_msrp) ; \+indep(s35)), (indep(s9), consistent(s9, price_usd_msrp) ; \+indep(s9)).
evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v549_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical false
% @original_name price_aud_merchant
% @values v615_99=615.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.95::true_val(price_aud_merchant, v615_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).
0.95::acc(sm, price_aud_merchant).
measured(sm, price_aud_merchant, v615_99).
all_consistent(price_aud_merchant) :- consistent(sm, price_aud_merchant).
evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v615_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_evo
% @values v439_96=439.96 unk_price_usd_evo=Unknown
% @importance 0.875

0.92::true_val(price_usd_evo, v439_96); 0.08::true_val(price_usd_evo, unk_price_usd_evo).
0.90::acc(s9, price_usd_evo).
measured(s9, price_usd_evo, v439_96).
all_consistent(price_usd_evo) :- (indep(s9), consistent(s9, price_usd_evo) ; \+indep(s9)).
evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v439_96)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_rei
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_rei
% @values v219_83=219.83 unk_price_usd_rei=Unknown
% @importance 0.9

0.90::true_val(price_usd_rei, v219_83); 0.10::true_val(price_usd_rei, unk_price_usd_rei).
0.90::acc(s41, price_usd_rei).
measured(s41, price_usd_rei, v219_83).
all_consistent(price_usd_rei) :- consistent(s41, price_usd_rei).
evidence(all_consistent(price_usd_rei)).
query(true_val(price_usd_rei, v219_83)).
query(true_val(price_usd_rei, unk_price_usd_rei)).

% @attr price_rocky_mountain
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at Rocky Mountain Ski & Board
% @values v549_95=549.95 unk_price_rocky_mountain=Unknown
% @importance 0.9

0.88::true_val(price_rocky_mountain, v549_95); 0.12::true_val(price_rocky_mountain, unk_price_rocky_mountain).
0.88::acc(s32, price_rocky_mountain).
measured(s32, price_rocky_mountain, v549_95).
all_consistent(price_rocky_mountain) :- (indep(s32), consistent(s32, price_rocky_mountain) ; \+indep(s32)).
evidence(all_consistent(price_rocky_mountain)).
query(true_val(price_rocky_mountain, v549_95)).
query(true_val(price_rocky_mountain, unk_price_rocky_mountain)).

% @attr price_park2peak
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at Park 2 Peak
% @values v439_96=439.96 unk_price_park2peak=Unknown
% @importance 0.85

0.87::true_val(price_park2peak, v439_96); 0.13::true_val(price_park2peak, unk_price_park2peak).
0.85::acc(s36, price_park2peak).
measured(s36, price_park2peak, v439_96).
all_consistent(price_park2peak) :- consistent(s36, price_park2peak).
evidence(all_consistent(price_park2peak)).
query(true_val(price_park2peak, v439_96)).
query(true_val(price_park2peak, unk_price_park2peak)).

% @attr price_ski_shack
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at Ski Shack
% @values v439_96=439.96 unk_price_ski_shack=Unknown
% @importance 0.85

0.87::true_val(price_ski_shack, v439_96); 0.13::true_val(price_ski_shack, unk_price_ski_shack).
0.85::acc(s33, price_ski_shack).
measured(s33, price_ski_shack, v439_96).
all_consistent(price_ski_shack) :- (indep(s33), consistent(s33, price_ski_shack) ; \+indep(s33)).
evidence(all_consistent(price_ski_shack)).
query(true_val(price_ski_shack, v439_96)).
query(true_val(price_ski_shack, unk_price_ski_shack)).

% @attr price_boyne_country
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at Boyne Country Sports
% @values v384_97=384.97 unk_price_boyne_country=Unknown
% @importance 0.85

0.88::true_val(price_boyne_country, v384_97); 0.12::true_val(price_boyne_country, unk_price_boyne_country).
0.88::acc(s12, price_boyne_country).
measured(s12, price_boyne_country, v384_97).
all_consistent(price_boyne_country) :- consistent(s12, price_boyne_country).
evidence(all_consistent(price_boyne_country)).
query(true_val(price_boyne_country, v384_97)).
query(true_val(price_boyne_country, unk_price_boyne_country)).

% @attr price_sun_ski
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at Sun & Ski Sports
% @values v399_83=399.83 unk_price_sun_ski=Unknown
% @importance 0.85

0.88::true_val(price_sun_ski, v399_83); 0.12::true_val(price_sun_ski, unk_price_sun_ski).
0.88::acc(s111, price_sun_ski).
measured(s111, price_sun_ski, v399_83).
all_consistent(price_sun_ski) :- consistent(s111, price_sun_ski).
evidence(all_consistent(price_sun_ski)).
query(true_val(price_sun_ski, v399_83)).
query(true_val(price_sun_ski, unk_price_sun_ski)).

% @attr price_neptune
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at Neptune Diving & Ski
% @values v494_95=494.95 unk_price_neptune=Unknown
% @importance 0.6

0.82::true_val(price_neptune, v494_95); 0.18::true_val(price_neptune, unk_price_neptune).
0.80::acc(s109, price_neptune).
measured(s109, price_neptune, v494_95).
all_consistent(price_neptune) :- consistent(s109, price_neptune).
evidence(all_consistent(price_neptune)).
query(true_val(price_neptune, v494_95)).
query(true_val(price_neptune, unk_price_neptune)).

% @attr price_ebay
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at eBay (new)
% @values v549_95=549.95 unk_price_ebay=Unknown
% @importance 0.6

0.82::true_val(price_ebay, v549_95); 0.18::true_val(price_ebay, unk_price_ebay).
0.78::acc(s108, price_ebay).
measured(s108, price_ebay, v549_95).
all_consistent(price_ebay) :- consistent(s108, price_ebay).
evidence(all_consistent(price_ebay)).
query(true_val(price_ebay, v549_95)).
query(true_val(price_ebay, unk_price_ebay)).

% @attr availability_status_discontinued
% @type categorical
% @canonical false
% @original_name availability_status (discontinued status)
% @values discontinued_clearout=Discontinued_2024_2025_model_cleared_out unk_availability_status_discontinued=Unknown
% @importance 0.8

0.88::true_val(availability_status_discontinued, discontinued_clearout); 0.12::true_val(availability_status_discontinued, unk_availability_status_discontinued).
0.88::acc(s41, availability_status_discontinued).
measured(s41, availability_status_discontinued, discontinued_clearout).
all_consistent(availability_status_discontinued) :- consistent(s41, availability_status_discontinued).
evidence(all_consistent(availability_status_discontinued)).
query(true_val(availability_status_discontinued, discontinued_clearout)).
query(true_val(availability_status_discontinued, unk_availability_status_discontinued)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values available_2025_2026=Available_2025_and_2026_model_at_549_95 unk_availability_status=Unknown
% @importance 0.9

0.92::true_val(availability_status, available_2025_2026); 0.08::true_val(availability_status, unk_availability_status).
0.90::acc(s9, availability_status).
measured(s9, availability_status, available_2025_2026).
all_consistent(availability_status) :- (indep(s9), consistent(s9, availability_status) ; \+indep(s9)).
evidence(all_consistent(availability_status)).
query(true_val(availability_status, available_2025_2026)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_burton
% @type categorical
% @canonical false
% @original_name availability_status (Burton US site)
% @values live_on_burton=Product_page_live_on_Burton_US unk_availability_status_burton=Unknown
% @importance 0.95

0.93::true_val(availability_status_burton, live_on_burton); 0.07::true_val(availability_status_burton, unk_availability_status_burton).
0.95::acc(s1, availability_status_burton).
measured(s1, availability_status_burton, live_on_burton).
all_consistent(availability_status_burton) :- consistent(s1, availability_status_burton).
evidence(all_consistent(availability_status_burton)).
query(true_val(availability_status_burton, live_on_burton)).
query(true_val(availability_status_burton, unk_availability_status_burton)).

% @attr availability_status_backcountry
% @type categorical
% @canonical false
% @original_name availability_status (Backcountry)
% @values listed_available=Listed_as_available unk_availability_status_backcountry=Unknown
% @importance 0.8

0.90::true_val(availability_status_backcountry, listed_available); 0.10::true_val(availability_status_backcountry, unk_availability_status_backcountry).
0.88::acc(s18, availability_status_backcountry).
measured(s18, availability_status_backcountry, listed_available).
all_consistent(availability_status_backcountry) :- (indep(s18), consistent(s18, availability_status_backcountry) ; \+indep(s18)).
evidence(all_consistent(availability_status_backcountry)).
query(true_val(availability_status_backcountry, listed_available)).
query(true_val(availability_status_backcountry, unk_availability_status_backcountry)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain=All_Mountain unk_board_category=Unknown
% @importance 0.95

0.95::true_val(board_category, all_mountain); 0.05::true_val(board_category, unk_board_category).
0.95::acc(s1, board_category).
0.80::acc(s10, board_category).
measured(s1, board_category, all_mountain).
measured(s10, board_category, all_mountain).
all_consistent(board_category) :- consistent(s1, board_category), (indep(s10), consistent(s10, board_category) ; \+indep(s10)).
evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain)).
query(true_val(board_category, unk_board_category)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values am_freestyle=All_mountain_with_freestyle_flavour unk_terrain_suitability=Unknown
% @importance 0.775

0.90::true_val(terrain_suitability, am_freestyle); 0.10::true_val(terrain_suitability, unk_terrain_suitability).
0.82::acc(s12, terrain_suitability).
0.82::acc(s22, terrain_suitability).
measured(s12, terrain_suitability, am_freestyle).
measured(s22, terrain_suitability, am_freestyle).
all_consistent(terrain_suitability) :- (indep(s12), consistent(s12, terrain_suitability) ; \+indep(s12)), consistent(s22, terrain_suitability).
evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, am_freestyle)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate=Intermediate unk_rider_level=Unknown
% @importance 0.9

0.93::true_val(rider_level, intermediate); 0.07::true_val(rider_level, unk_rider_level).
0.82::acc(s10, rider_level).
0.82::acc(s32, rider_level).
measured(s10, rider_level, intermediate).
measured(s32, rider_level, intermediate).
all_consistent(rider_level) :- (indep(s10), consistent(s10, rider_level) ; \+indep(s10)), (indep(s32), consistent(s32, rider_level) ; \+indep(s32)).
evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate)).
query(true_val(rider_level, unk_rider_level)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values flying_v_hybrid_rocker=Flying_V_hybrid_rocker_camber_underfoot unk_camber_type=Unknown
% @importance 0.925

0.95::true_val(camber_type, flying_v_hybrid_rocker); 0.05::true_val(camber_type, unk_camber_type).
0.90::acc(s9, camber_type).
0.80::acc(s10, camber_type).
measured(s9, camber_type, flying_v_hybrid_rocker).
measured(s10, camber_type, flying_v_hybrid_rocker).
all_consistent(camber_type) :- (indep(s9), consistent(s9, camber_type) ; \+indep(s9)), (indep(s10), consistent(s10, camber_type) ; \+indep(s10)).
evidence(all_consistent(camber_type)).
query(true_val(camber_type, flying_v_hybrid_rocker)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values rocker_camber_zones=Rocker_between_outside_feet_camber_under_feet unk_camber_description=Unknown
% @importance 0.875

0.95::true_val(camber_description, rocker_camber_zones); 0.05::true_val(camber_description, unk_camber_description).
0.90::acc(s9, camber_description).
0.88::acc(s14_evo, camber_description).
measured(s9, camber_description, rocker_camber_zones).
measured(s14_evo, camber_description, rocker_camber_zones).
all_consistent(camber_description) :- (indep(s9), consistent(s9, camber_description) ; \+indep(s9)), (indep(s9), consistent(s14_evo, camber_description) ; \+indep(s9)).
evidence(all_consistent(camber_description)).
query(true_val(camber_description, rocker_camber_zones)).
query(true_val(camber_description, unk_camber_description)).

0.20::indep(s14_evo).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values twin=Twin_symmetrical_tip_to_tail unk_shape=Unknown
% @importance 0.925

0.95::true_val(shape, twin); 0.05::true_val(shape, unk_shape).
0.90::acc(s9, shape).
0.80::acc(s10, shape).
measured(s9, shape, twin).
measured(s10, shape, twin).
all_consistent(shape) :- (indep(s9), consistent(s9, shape) ; \+indep(s9)), (indep(s10), consistent(s10, shape) ; \+indep(s10)).
evidence(all_consistent(shape)).
query(true_val(shape, twin)).
query(true_val(shape, unk_shape)).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v2_5=2.5 v4_5=4.5
% @importance 0.883

0.65::true_val(flex_rating_10, v2_5); 0.35::true_val(flex_rating_10, v4_5).
0.88::acc(sm, flex_rating_10).
0.78::acc(s25, flex_rating_10).
0.85::acc(s11, flex_rating_10).
measured(sm, flex_rating_10, v2_5).
measured(s25, flex_rating_10, v2_5).
measured(s11, flex_rating_10, v4_5).
all_consistent(flex_rating_10) :- (indep(sm), consistent(sm, flex_rating_10) ; \+indep(sm)), (indep(s25), consistent(s25, flex_rating_10) ; \+indep(s25)), consistent(s11, flex_rating_10).
evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v2_5)).
query(true_val(flex_rating_10, v4_5)).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values twin_symmetrical=Twin_flex_symmetrical unk_flex_direction=Unknown
% @importance 0.95

0.95::true_val(flex_direction, twin_symmetrical); 0.05::true_val(flex_direction, unk_flex_direction).
0.90::acc(s9, flex_direction).
0.80::acc(s10, flex_direction).
measured(s9, flex_direction, twin_symmetrical).
measured(s10, flex_direction, twin_symmetrical).
all_consistent(flex_direction) :- (indep(s9), consistent(s9, flex_direction) ; \+indep(s9)), (indep(s10), consistent(s10, flex_direction) ; \+indep(s10)).
evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, twin_symmetrical)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr camber_description_profile
% @type categorical
% @canonical false
% @original_name camber_description (profile pattern)
% @values roc_cam_roc_cam_roc=Roc_Cam_Roc_Cam_Roc_five_zone unk_camber_description_profile=Unknown
% @importance 0.7

0.88::true_val(camber_description_profile, roc_cam_roc_cam_roc); 0.12::true_val(camber_description_profile, unk_camber_description_profile).
0.88::acc(s9, camber_description_profile).
measured(s9, camber_description_profile, roc_cam_roc_cam_roc).
all_consistent(camber_description_profile) :- (indep(s9), consistent(s9, camber_description_profile) ; \+indep(s9)).
evidence(all_consistent(camber_description_profile)).
query(true_val(camber_description_profile, roc_cam_roc_cam_roc)).
query(true_val(camber_description_profile, unk_camber_description_profile)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values super_fly_ii_700g=FSC_Super_Fly_II_700G unk_core_material=Unknown
% @importance 0.733

0.95::true_val(core_material, super_fly_ii_700g); 0.05::true_val(core_material, unk_core_material).
0.82::acc(s25, core_material).
0.92::acc(s113, core_material).
0.82::acc(s114, core_material).
0.85::acc(s9, core_material).
measured(s25, core_material, super_fly_ii_700g).
measured(s113, core_material, super_fly_ii_700g).
measured(s114, core_material, super_fly_ii_700g).
measured(s9, core_material, super_fly_ii_700g).
all_consistent(core_material) :- (indep(s25), consistent(s25, core_material) ; \+indep(s25)), consistent(s113, core_material), (indep(s114), consistent(s114, core_material) ; \+indep(s114)), (indep(s9), consistent(s9, core_material) ; \+indep(s9)).
evidence(all_consistent(core_material)).
query(true_val(core_material, super_fly_ii_700g)).
query(true_val(core_material, unk_core_material)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values fsc_and_supersap=FSC_certified_core_and_Super_Sap_bio_epoxy unk_sustainability_certification=Unknown
% @importance 0.65

0.95::true_val(sustainability_certification, fsc_and_supersap); 0.05::true_val(sustainability_certification, unk_sustainability_certification).
0.95::acc(s113, sustainability_certification).
0.88::acc(s9, sustainability_certification).
0.80::acc(s25, sustainability_certification).
measured(s113, sustainability_certification, fsc_and_supersap).
measured(s9, sustainability_certification, fsc_and_supersap).
measured(s25, sustainability_certification, fsc_and_supersap).
all_consistent(sustainability_certification) :- consistent(s113, sustainability_certification), (indep(s9), consistent(s9, sustainability_certification) ; \+indep(s9)), (indep(s25), consistent(s25, sustainability_certification) ; \+indep(s25)).
evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, fsc_and_supersap)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values squeezebox=Squeezebox_variable_thickness_core unk_construction_material_innovation=Unknown
% @importance 0.925

0.95::true_val(construction_material_innovation, squeezebox); 0.05::true_val(construction_material_innovation, unk_construction_material_innovation).
0.90::acc(s9, construction_material_innovation).
0.80::acc(s10, construction_material_innovation).
measured(s9, construction_material_innovation, squeezebox).
measured(s10, construction_material_innovation, squeezebox).
all_consistent(construction_material_innovation) :- (indep(s9), consistent(s9, construction_material_innovation) ; \+indep(s9)), (indep(s10), consistent(s10, construction_material_innovation) ; \+indep(s10)).
evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, squeezebox)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr construction_material_innovation_dualzone
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Dualzone EGD)
% @values dualzone_egd=Dualzone_EGD_perpendicular_grain unk_cmi_dualzone=Unknown
% @importance 0.8

0.92::true_val(construction_material_innovation_dualzone, dualzone_egd); 0.08::true_val(construction_material_innovation_dualzone, unk_cmi_dualzone).
0.80::acc(s10, construction_material_innovation_dualzone).
0.78::acc(s20, construction_material_innovation_dualzone).
measured(s10, construction_material_innovation_dualzone, dualzone_egd).
measured(s20, construction_material_innovation_dualzone, dualzone_egd).
all_consistent(construction_material_innovation_dualzone) :- (indep(s10), consistent(s10, construction_material_innovation_dualzone) ; \+indep(s10)), (indep(s20), consistent(s20, construction_material_innovation_dualzone) ; \+indep(s20)).
evidence(all_consistent(construction_material_innovation_dualzone)).
query(true_val(construction_material_innovation_dualzone, dualzone_egd)).
query(true_val(construction_material_innovation_dualzone, unk_cmi_dualzone)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values triax_fiberglass=Triax_triaxial_fiberglass unk_laminate=Unknown
% @importance 0.925

0.95::true_val(laminate, triax_fiberglass); 0.05::true_val(laminate, unk_laminate).
0.90::acc(s9, laminate).
0.80::acc(s10, laminate).
measured(s9, laminate, triax_fiberglass).
measured(s10, laminate, triax_fiberglass).
all_consistent(laminate) :- (indep(s9), consistent(s9, laminate) ; \+indep(s9)), (indep(s10), consistent(s10, laminate) ; \+indep(s10)).
evidence(all_consistent(laminate)).
query(true_val(laminate, triax_fiberglass)).
query(true_val(laminate, unk_laminate)).

% @attr laminate_layup
% @type categorical
% @canonical false
% @original_name laminate (layup detail)
% @values triax_layup_detail=Topsheet_top_glass_pm45_0_core_bottom_glass_0_pm45_base unk_laminate_layup=Unknown
% @importance 0.75

0.88::true_val(laminate_layup, triax_layup_detail); 0.12::true_val(laminate_layup, unk_laminate_layup).
0.85::acc(s114, laminate_layup).
measured(s114, laminate_layup, triax_layup_detail).
all_consistent(laminate_layup) :- (indep(s114), consistent(s114, laminate_layup) ; \+indep(s114)).
evidence(all_consistent(laminate_layup)).
query(true_val(laminate_layup, triax_layup_detail)).
query(true_val(laminate_layup, unk_laminate_layup)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered=Sintered_durable_porous unk_base_material=Unknown
% @importance 0.925

0.95::true_val(base_material, sintered); 0.05::true_val(base_material, unk_base_material).
0.90::acc(s9, base_material).
0.80::acc(s10, base_material).
measured(s9, base_material, sintered).
measured(s10, base_material, sintered).
all_consistent(base_material) :- (indep(s9), consistent(s9, base_material) ; \+indep(s9)), (indep(s10), consistent(s10, base_material) ; \+indep(s10)).
evidence(all_consistent(base_material)).
query(true_val(base_material, sintered)).
query(true_val(base_material, unk_base_material)).

% @attr resin
% @type categorical
% @canonical true
% @original_name resin
% @values super_sap_epoxy=Super_Sap_bio_based_epoxy_50pct_reduced_carbon unk_resin=Unknown
% @importance 0.925

0.95::true_val(resin, super_sap_epoxy); 0.05::true_val(resin, unk_resin).
0.90::acc(s9, resin).
0.80::acc(s10, resin).
measured(s9, resin, super_sap_epoxy).
measured(s10, resin, super_sap_epoxy).
all_consistent(resin) :- (indep(s9), consistent(s9, resin) ; \+indep(s9)), (indep(s10), consistent(s10, resin) ; \+indep(s10)).
evidence(all_consistent(resin)).
query(true_val(resin, super_sap_epoxy)).
query(true_val(resin, unk_resin)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values the_channel=The_Channel_all_major_bindings_best_with_EST unk_mounting_pattern=Unknown
% @importance 0.925

0.95::true_val(mounting_pattern, the_channel); 0.05::true_val(mounting_pattern, unk_mounting_pattern).
0.90::acc(s9, mounting_pattern).
0.80::acc(s10, mounting_pattern).
measured(s9, mounting_pattern, the_channel).
measured(s10, mounting_pattern, the_channel).
all_consistent(mounting_pattern) :- (indep(s9), consistent(s9, mounting_pattern) ; \+indep(s9)), (indep(s10), consistent(s10, mounting_pattern) ; \+indep(s10)).
evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, the_channel)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values frostbite_edges=Frostbite_Edges_extended_under_bindings unk_edge_technology=Unknown
% @importance 0.925

0.95::true_val(edge_technology, frostbite_edges); 0.05::true_val(edge_technology, unk_edge_technology).
0.90::acc(s9, edge_technology).
0.80::acc(s10, edge_technology).
measured(s9, edge_technology, frostbite_edges).
measured(s10, edge_technology, frostbite_edges).
all_consistent(edge_technology) :- (indep(s9), consistent(s9, edge_technology) ; \+indep(s9)), (indep(s10), consistent(s10, edge_technology) ; \+indep(s10)).
evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, frostbite_edges)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr construction_material_innovation_protip
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Pro-Tip)
% @values pro_tip=Pro_Tip_tapered_tip_tail_reduced_swing_weight unk_cmi_protip=Unknown
% @importance 0.85

0.92::true_val(construction_material_innovation_protip, pro_tip); 0.08::true_val(construction_material_innovation_protip, unk_cmi_protip).
0.82::acc(s17, construction_material_innovation_protip).
0.80::acc(s10, construction_material_innovation_protip).
measured(s17, construction_material_innovation_protip, pro_tip).
measured(s10, construction_material_innovation_protip, pro_tip).
all_consistent(construction_material_innovation_protip) :- (indep(s17), consistent(s17, construction_material_innovation_protip) ; \+indep(s17)), (indep(s10), consistent(s10, construction_material_innovation_protip) ; \+indep(s10)).
evidence(all_consistent(construction_material_innovation_protip)).
query(true_val(construction_material_innovation_protip, pro_tip)).
query(true_val(construction_material_innovation_protip, unk_cmi_protip)).

% @attr construction_material_innovation_scoop
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Scoop)
% @values scoop=Scoop_exaggerated_tip_tail_scooping unk_cmi_scoop=Unknown
% @importance 0.7

0.88::true_val(construction_material_innovation_scoop, scoop); 0.12::true_val(construction_material_innovation_scoop, unk_cmi_scoop).
0.80::acc(s10, construction_material_innovation_scoop).
0.75::acc(s17, construction_material_innovation_scoop).
measured(s10, construction_material_innovation_scoop, scoop).
measured(s17, construction_material_innovation_scoop, scoop).
all_consistent(construction_material_innovation_scoop) :- (indep(s10), consistent(s10, construction_material_innovation_scoop) ; \+indep(s10)), (indep(s17), consistent(s17, construction_material_innovation_scoop) ; \+indep(s17)).
evidence(all_consistent(construction_material_innovation_scoop)).
query(true_val(construction_material_innovation_scoop, scoop)).
query(true_val(construction_material_innovation_scoop, unk_cmi_scoop)).

% @attr construction_material_innovation_infinite_ride
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Infinite Ride)
% @values infinite_ride=Infinite_Ride_factory_break_in_consistent_flex unk_cmi_ir=Unknown
% @importance 0.85

0.92::true_val(construction_material_innovation_infinite_ride, infinite_ride); 0.08::true_val(construction_material_innovation_infinite_ride, unk_cmi_ir).
0.88::acc(s9, construction_material_innovation_infinite_ride).
0.80::acc(s10, construction_material_innovation_infinite_ride).
measured(s9, construction_material_innovation_infinite_ride, infinite_ride).
measured(s10, construction_material_innovation_infinite_ride, infinite_ride).
all_consistent(construction_material_innovation_infinite_ride) :- (indep(s9), consistent(s9, construction_material_innovation_infinite_ride) ; \+indep(s9)), (indep(s10), consistent(s10, construction_material_innovation_infinite_ride) ; \+indep(s10)).
evidence(all_consistent(construction_material_innovation_infinite_ride)).
query(true_val(construction_material_innovation_infinite_ride, infinite_ride)).
query(true_val(construction_material_innovation_infinite_ride, unk_cmi_ir)).

% @attr setback
% @type numeric
% @unit mm
% @canonical true
% @original_name setback
% @values v0=0.0 v12_5=12.5
% @importance 0.85

0.30::true_val(setback, v0); 0.70::true_val(setback, v12_5).
0.82::acc(sm, setback).
0.85::acc(s11, setback).
0.80::acc(s114, setback).
measured(sm, setback, v0).
measured(s11, setback, v12_5).
measured(s114, setback, v12_5).
all_consistent(setback) :- (indep(sm), consistent(sm, setback) ; \+indep(sm)), consistent(s11, setback), (indep(s114), consistent(s114, setback) ; \+indep(s114)).
evidence(all_consistent(setback)).
query(true_val(setback, v0)).
query(true_val(setback, v12_5)).

% @attr topsheet_appearance_description
% @type categorical
% @canonical true
% @original_name topsheet_appearance_description
% @values panda_glow_dark=Panda_graphic_glows_in_dark unk_topsheet=Unknown
% @importance 0.625

0.90::true_val(topsheet_appearance_description, panda_glow_dark); 0.10::true_val(topsheet_appearance_description, unk_topsheet).
0.85::acc(s9, topsheet_appearance_description).
0.82::acc(s33, topsheet_appearance_description).
measured(s9, topsheet_appearance_description, panda_glow_dark).
measured(s33, topsheet_appearance_description, panda_glow_dark).
all_consistent(topsheet_appearance_description) :- (indep(s9), consistent(s9, topsheet_appearance_description) ; \+indep(s9)), (indep(s33), consistent(s33, topsheet_appearance_description) ; \+indep(s33)).
evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, panda_glow_dark)).
query(true_val(topsheet_appearance_description, unk_topsheet)).

% @attr graphic_designer_artist
% @type categorical
% @canonical true
% @original_name graphic_designer_artist
% @values sean_william_randall=Sean_William_Randall unk_graphic_designer=Unknown
% @importance 0.8

0.85::true_val(graphic_designer_artist, sean_william_randall); 0.15::true_val(graphic_designer_artist, unk_graphic_designer).
0.82::acc(s9, graphic_designer_artist).
measured(s9, graphic_designer_artist, sean_william_randall).
all_consistent(graphic_designer_artist) :- (indep(s9), consistent(s9, graphic_designer_artist) ; \+indep(s9)).
evidence(all_consistent(graphic_designer_artist)).
query(true_val(graphic_designer_artist, sean_william_randall)).
query(true_val(graphic_designer_artist, unk_graphic_designer)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values process_purepop=Process_PurePop_Camber_more_pop_better_edge_hold unk_comparable_same=Unknown
% @importance 0.8

0.92::true_val(comparable_board_same_brand, process_purepop); 0.08::true_val(comparable_board_same_brand, unk_comparable_same).
0.82::acc(s10, comparable_board_same_brand).
0.82::acc(s25, comparable_board_same_brand).
0.85::acc(s9, comparable_board_same_brand).
measured(s10, comparable_board_same_brand, process_purepop).
measured(s25, comparable_board_same_brand, process_purepop).
measured(s9, comparable_board_same_brand, process_purepop).
all_consistent(comparable_board_same_brand) :- (indep(s10), consistent(s10, comparable_board_same_brand) ; \+indep(s10)), (indep(s25), consistent(s25, comparable_board_same_brand) ; \+indep(s25)), (indep(s9), consistent(s9, comparable_board_same_brand) ; \+indep(s9)).
evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, process_purepop)).
query(true_val(comparable_board_same_brand, unk_comparable_same)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values nine_sizes=152_155_157_159_162_155W_157W_159W_162W unk_available_sizes=Unknown
% @importance 0.825

0.93::true_val(available_sizes, nine_sizes); 0.07::true_val(available_sizes, unk_available_sizes).
0.82::acc(s10, available_sizes).
0.85::acc(s11, available_sizes).
measured(s10, available_sizes, nine_sizes).
measured(s11, available_sizes, nine_sizes).
all_consistent(available_sizes) :- (indep(s10), consistent(s10, available_sizes) ; \+indep(s10)), consistent(s11, available_sizes).
evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, nine_sizes)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr effective_edge_152
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 152cm
% @values v1165=1165.0 unk_ee_152=Unknown
% @importance 0.85

0.93::true_val(effective_edge_152, v1165); 0.07::true_val(effective_edge_152, unk_ee_152).
0.80::acc(s10, effective_edge_152).
0.85::acc(s18, effective_edge_152).
measured(s10, effective_edge_152, v1165).
measured(s18, effective_edge_152, v1165).
all_consistent(effective_edge_152) :- (indep(s10), consistent(s10, effective_edge_152) ; \+indep(s10)), (indep(s18), consistent(s18, effective_edge_152) ; \+indep(s18)).
evidence(all_consistent(effective_edge_152)).
query(true_val(effective_edge_152, v1165)).
query(true_val(effective_edge_152, unk_ee_152)).

% @attr effective_edge_155
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 155cm
% @values v1195=1195.0 unk_ee_155=Unknown
% @importance 0.85

0.93::true_val(effective_edge_155, v1195); 0.07::true_val(effective_edge_155, unk_ee_155).
0.80::acc(s10, effective_edge_155).
0.85::acc(s18, effective_edge_155).
measured(s10, effective_edge_155, v1195).
measured(s18, effective_edge_155, v1195).
all_consistent(effective_edge_155) :- (indep(s10), consistent(s10, effective_edge_155) ; \+indep(s10)), (indep(s18), consistent(s18, effective_edge_155) ; \+indep(s18)).
evidence(all_consistent(effective_edge_155)).
query(true_val(effective_edge_155, v1195)).
query(true_val(effective_edge_155, unk_ee_155)).

% @attr effective_edge_157
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 157cm
% @values v1215=1215.0 unk_ee_157=Unknown
% @importance 0.85

0.93::true_val(effective_edge_157, v1215); 0.07::true_val(effective_edge_157, unk_ee_157).
0.80::acc(s10, effective_edge_157).
0.85::acc(s18, effective_edge_157).
measured(s10, effective_edge_157, v1215).
measured(s18, effective_edge_157, v1215).
all_consistent(effective_edge_157) :- (indep(s10), consistent(s10, effective_edge_157) ; \+indep(s10)), (indep(s18), consistent(s18, effective_edge_157) ; \+indep(s18)).
evidence(all_consistent(effective_edge_157)).
query(true_val(effective_edge_157, v1215)).
query(true_val(effective_edge_157, unk_ee_157)).

% @attr effective_edge_159
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 159cm
% @values v1235=1235.0 unk_ee_159=Unknown
% @importance 0.85

0.93::true_val(effective_edge_159, v1235); 0.07::true_val(effective_edge_159, unk_ee_159).
0.80::acc(s10, effective_edge_159).
0.85::acc(s18, effective_edge_159).
measured(s10, effective_edge_159, v1235).
measured(s18, effective_edge_159, v1235).
all_consistent(effective_edge_159) :- (indep(s10), consistent(s10, effective_edge_159) ; \+indep(s10)), (indep(s18), consistent(s18, effective_edge_159) ; \+indep(s18)).
evidence(all_consistent(effective_edge_159)).
query(true_val(effective_edge_159, v1235)).
query(true_val(effective_edge_159, unk_ee_159)).

% @attr effective_edge_162
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 162cm
% @values v1265=1265.0 unk_ee_162=Unknown
% @importance 0.85

0.93::true_val(effective_edge_162, v1265); 0.07::true_val(effective_edge_162, unk_ee_162).
0.80::acc(s10, effective_edge_162).
0.85::acc(s18, effective_edge_162).
measured(s10, effective_edge_162, v1265).
measured(s18, effective_edge_162, v1265).
all_consistent(effective_edge_162) :- (indep(s10), consistent(s10, effective_edge_162) ; \+indep(s10)), (indep(s18), consistent(s18, effective_edge_162) ; \+indep(s18)).
evidence(all_consistent(effective_edge_162)).
query(true_val(effective_edge_162, v1265)).
query(true_val(effective_edge_162, unk_ee_162)).

% @attr sidecut_radius_size_152
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size 152cm
% @values v7_7=7.7 unk_scr_152=Unknown
% @importance 0.85

0.93::true_val(sidecut_radius_size_152, v7_7); 0.07::true_val(sidecut_radius_size_152, unk_scr_152).
0.92::acc(sm, sidecut_radius_size_152).
measured(sm, sidecut_radius_size_152, v7_7).
all_consistent(sidecut_radius_size_152) :- (indep(sm), consistent(sm, sidecut_radius_size_152) ; \+indep(sm)).
evidence(all_consistent(sidecut_radius_size_152)).
query(true_val(sidecut_radius_size_152, v7_7)).
query(true_val(sidecut_radius_size_152, unk_scr_152)).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size 155cm
% @values v7_9=7.9 unk_sidecut_radius_size=Unknown
% @importance 0.85

0.93::true_val(sidecut_radius_size, v7_9); 0.07::true_val(sidecut_radius_size, unk_sidecut_radius_size).
0.92::acc(sm, sidecut_radius_size).
measured(sm, sidecut_radius_size, v7_9).
all_consistent(sidecut_radius_size) :- (indep(sm), consistent(sm, sidecut_radius_size) ; \+indep(sm)).
evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_9)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr sidecut_radius_size_157
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size 157cm
% @values v8_1=8.1 unk_scr_157=Unknown
% @importance 0.85

0.93::true_val(sidecut_radius_size_157, v8_1); 0.07::true_val(sidecut_radius_size_157, unk_scr_157).
0.92::acc(sm, sidecut_radius_size_157).
measured(sm, sidecut_radius_size_157, v8_1).
all_consistent(sidecut_radius_size_157) :- (indep(sm), consistent(sm, sidecut_radius_size_157) ; \+indep(sm)).
evidence(all_consistent(sidecut_radius_size_157)).
query(true_val(sidecut_radius_size_157, v8_1)).
query(true_val(sidecut_radius_size_157, unk_scr_157)).

% @attr sidecut_radius_size_159
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size 159cm
% @values v8_2=8.2 unk_scr_159=Unknown
% @importance 0.85

0.93::true_val(sidecut_radius_size_159, v8_2); 0.07::true_val(sidecut_radius_size_159, unk_scr_159).
0.92::acc(sm, sidecut_radius_size_159).
measured(sm, sidecut_radius_size_159, v8_2).
all_consistent(sidecut_radius_size_159) :- (indep(sm), consistent(sm, sidecut_radius_size_159) ; \+indep(sm)).
evidence(all_consistent(sidecut_radius_size_159)).
query(true_val(sidecut_radius_size_159, v8_2)).
query(true_val(sidecut_radius_size_159, unk_scr_159)).

% @attr sidecut_radius_size_162
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size 162cm
% @values v8_4=8.4 unk_scr_162=Unknown
% @importance 0.85

0.93::true_val(sidecut_radius_size_162, v8_4); 0.07::true_val(sidecut_radius_size_162, unk_scr_162).
0.92::acc(sm, sidecut_radius_size_162).
measured(sm, sidecut_radius_size_162, v8_4).
all_consistent(sidecut_radius_size_162) :- (indep(sm), consistent(sm, sidecut_radius_size_162) ; \+indep(sm)).
evidence(all_consistent(sidecut_radius_size_162)).
query(true_val(sidecut_radius_size_162, v8_4)).
query(true_val(sidecut_radius_size_162, unk_scr_162)).

% @attr waist_width_152
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 152cm
% @values v249=249.0 unk_ww_152=Unknown
% @importance 0.95

0.88::true_val(waist_width_152, v249); 0.12::true_val(waist_width_152, unk_ww_152).
0.85::acc(s11, waist_width_152).
measured(s11, waist_width_152, v249).
all_consistent(waist_width_152) :- consistent(s11, waist_width_152).
evidence(all_consistent(waist_width_152)).
query(true_val(waist_width_152, v249)).
query(true_val(waist_width_152, unk_ww_152)).

% @attr waist_width_155
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 155cm
% @values v251=251.0 unk_ww_155=Unknown
% @importance 0.95

0.88::true_val(waist_width_155, v251); 0.12::true_val(waist_width_155, unk_ww_155).
0.85::acc(s11, waist_width_155).
measured(s11, waist_width_155, v251).
all_consistent(waist_width_155) :- consistent(s11, waist_width_155).
evidence(all_consistent(waist_width_155)).
query(true_val(waist_width_155, v251)).
query(true_val(waist_width_155, unk_ww_155)).

% @attr waist_width_157
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 157cm
% @values v252=252.0 unk_ww_157=Unknown
% @importance 0.95

0.88::true_val(waist_width_157, v252); 0.12::true_val(waist_width_157, unk_ww_157).
0.85::acc(s11, waist_width_157).
measured(s11, waist_width_157, v252).
all_consistent(waist_width_157) :- consistent(s11, waist_width_157).
evidence(all_consistent(waist_width_157)).
query(true_val(waist_width_157, v252)).
query(true_val(waist_width_157, unk_ww_157)).

% @attr waist_width_159
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 159cm
% @values v255=255.0 unk_ww_159=Unknown
% @importance 0.95

0.88::true_val(waist_width_159, v255); 0.12::true_val(waist_width_159, unk_ww_159).
0.85::acc(s11, waist_width_159).
measured(s11, waist_width_159, v255).
all_consistent(waist_width_159) :- consistent(s11, waist_width_159).
evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v255)).
query(true_val(waist_width_159, unk_ww_159)).

% @attr waist_width_162
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 162cm
% @values v257=257.0 unk_ww_162=Unknown
% @importance 0.95

0.88::true_val(waist_width_162, v257); 0.12::true_val(waist_width_162, unk_ww_162).
0.85::acc(s11, waist_width_162).
measured(s11, waist_width_162, v257).
all_consistent(waist_width_162) :- consistent(s11, waist_width_162).
evidence(all_consistent(waist_width_162)).
query(true_val(waist_width_162, v257)).
query(true_val(waist_width_162, unk_ww_162)).

% @attr waist_width_155w
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 155W
% @values v256=256.0 unk_ww_155w=Unknown
% @importance 0.9

0.95::true_val(waist_width_155w, v256); 0.05::true_val(waist_width_155w, unk_ww_155w).
0.85::acc(s11, waist_width_155w).
0.92::acc(sm, waist_width_155w).
measured(s11, waist_width_155w, v256).
measured(sm, waist_width_155w, v256).
all_consistent(waist_width_155w) :- consistent(s11, waist_width_155w), (indep(sm), consistent(sm, waist_width_155w) ; \+indep(sm)).
evidence(all_consistent(waist_width_155w)).
query(true_val(waist_width_155w, v256)).
query(true_val(waist_width_155w, unk_ww_155w)).

% @attr waist_width_157w
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 157W
% @values v257w=257.0 unk_ww_157w=Unknown
% @importance 0.9

0.95::true_val(waist_width_157w, v257w); 0.05::true_val(waist_width_157w, unk_ww_157w).
0.85::acc(s11, waist_width_157w).
0.92::acc(sm, waist_width_157w).
measured(s11, waist_width_157w, v257w).
measured(sm, waist_width_157w, v257w).
all_consistent(waist_width_157w) :- consistent(s11, waist_width_157w), (indep(sm), consistent(sm, waist_width_157w) ; \+indep(sm)).
evidence(all_consistent(waist_width_157w)).
query(true_val(waist_width_157w, v257w)).
query(true_val(waist_width_157w, unk_ww_157w)).

% @attr waist_width_159w
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 159W
% @values v260=260.0 unk_ww_159w=Unknown
% @importance 0.9

0.95::true_val(waist_width_159w, v260); 0.05::true_val(waist_width_159w, unk_ww_159w).
0.85::acc(s11, waist_width_159w).
0.92::acc(sm, waist_width_159w).
measured(s11, waist_width_159w, v260).
measured(sm, waist_width_159w, v260).
all_consistent(waist_width_159w) :- consistent(s11, waist_width_159w), (indep(sm), consistent(sm, waist_width_159w) ; \+indep(sm)).
evidence(all_consistent(waist_width_159w)).
query(true_val(waist_width_159w, v260)).
query(true_val(waist_width_159w, unk_ww_159w)).

% @attr waist_width_162w
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 162W
% @values v262=262.0 unk_ww_162w=Unknown
% @importance 0.9

0.95::true_val(waist_width_162w, v262); 0.05::true_val(waist_width_162w, unk_ww_162w).
0.85::acc(s11, waist_width_162w).
0.92::acc(sm, waist_width_162w).
measured(s11, waist_width_162w, v262).
measured(sm, waist_width_162w, v262).
all_consistent(waist_width_162w) :- consistent(s11, waist_width_162w), (indep(sm), consistent(sm, waist_width_162w) ; \+indep(sm)).
evidence(all_consistent(waist_width_162w)).
query(true_val(waist_width_162w, v262)).
query(true_val(waist_width_162w, unk_ww_162w)).

% @attr tip_tail_width_size_152
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size 152cm
% @values v29_01=29.01 unk_ttw_152=Unknown
% @importance 0.85

0.93::true_val(tip_tail_width_size_152, v29_01); 0.07::true_val(tip_tail_width_size_152, unk_ttw_152).
0.92::acc(sm, tip_tail_width_size_152).
measured(sm, tip_tail_width_size_152, v29_01).
all_consistent(tip_tail_width_size_152) :- (indep(sm), consistent(sm, tip_tail_width_size_152) ; \+indep(sm)).
evidence(all_consistent(tip_tail_width_size_152)).
query(true_val(tip_tail_width_size_152, v29_01)).
query(true_val(tip_tail_width_size_152, unk_ttw_152)).

% @attr tip_tail_width_size
% @type numeric
% @unit cm
% @canonical true
% @original_name tip_tail_width_size 155cm
% @values v29_32=29.32 unk_tip_tail_width_size=Unknown
% @importance 0.85

0.93::true_val(tip_tail_width_size, v29_32); 0.07::true_val(tip_tail_width_size, unk_tip_tail_width_size).
0.92::acc(sm, tip_tail_width_size).
measured(sm, tip_tail_width_size, v29_32).
all_consistent(tip_tail_width_size) :- (indep(sm), consistent(sm, tip_tail_width_size) ; \+indep(sm)).
evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v29_32)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr tip_tail_width_size_157
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size 157cm
% @values v29_49=29.49 unk_ttw_157=Unknown
% @importance 0.85

0.93::true_val(tip_tail_width_size_157, v29_49); 0.07::true_val(tip_tail_width_size_157, unk_ttw_157).
0.92::acc(sm, tip_tail_width_size_157).
measured(sm, tip_tail_width_size_157, v29_49).
all_consistent(tip_tail_width_size_157) :- (indep(sm), consistent(sm, tip_tail_width_size_157) ; \+indep(sm)).
evidence(all_consistent(tip_tail_width_size_157)).
query(true_val(tip_tail_width_size_157, v29_49)).
query(true_val(tip_tail_width_size_157, unk_ttw_157)).

% @attr tip_tail_width_size_159
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size 159cm
% @values v29_86=29.86 unk_ttw_159=Unknown
% @importance 0.85

0.93::true_val(tip_tail_width_size_159, v29_86); 0.07::true_val(tip_tail_width_size_159, unk_ttw_159).
0.92::acc(sm, tip_tail_width_size_159).
measured(sm, tip_tail_width_size_159, v29_86).
all_consistent(tip_tail_width_size_159) :- (indep(sm), consistent(sm, tip_tail_width_size_159) ; \+indep(sm)).
evidence(all_consistent(tip_tail_width_size_159)).
query(true_val(tip_tail_width_size_159, v29_86)).
query(true_val(tip_tail_width_size_159, unk_ttw_159)).

% @attr tip_tail_width_size_162
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size 162cm
% @values v30_18=30.18 unk_ttw_162=Unknown
% @importance 0.85

0.93::true_val(tip_tail_width_size_162, v30_18); 0.07::true_val(tip_tail_width_size_162, unk_ttw_162).
0.92::acc(sm, tip_tail_width_size_162).
measured(sm, tip_tail_width_size_162, v30_18).
all_consistent(tip_tail_width_size_162) :- (indep(sm), consistent(sm, tip_tail_width_size_162) ; \+indep(sm)).
evidence(all_consistent(tip_tail_width_size_162)).
query(true_val(tip_tail_width_size_162, v30_18)).
query(true_val(tip_tail_width_size_162, unk_ttw_162)).

% @attr stance_width_range_size_152
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size 152cm
% @values v53_0=53.0 unk_swr_152=Unknown
% @importance 0.85

0.93::true_val(stance_width_range_size_152, v53_0); 0.07::true_val(stance_width_range_size_152, unk_swr_152).
0.92::acc(sm, stance_width_range_size_152).
measured(sm, stance_width_range_size_152, v53_0).
all_consistent(stance_width_range_size_152) :- (indep(sm), consistent(sm, stance_width_range_size_152) ; \+indep(sm)).
evidence(all_consistent(stance_width_range_size_152)).
query(true_val(stance_width_range_size_152, v53_0)).
query(true_val(stance_width_range_size_152, unk_swr_152)).

% @attr stance_width_range_size
% @type numeric
% @unit cm
% @canonical true
% @original_name stance_width_range_size 155cm
% @values v53_0=53.0 unk_stance_width_range_size=Unknown
% @importance 0.85

0.93::true_val(stance_width_range_size, v53_0s); 0.07::true_val(stance_width_range_size, unk_stance_width_range_size).
0.92::acc(sm, stance_width_range_size).
measured(sm, stance_width_range_size, v53_0s).
all_consistent(stance_width_range_size) :- (indep(sm), consistent(sm, stance_width_range_size) ; \+indep(sm)).
evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v53_0s)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr stance_width_range_size_157
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size 157cm
% @values v56_0=56.0 unk_swr_157=Unknown
% @importance 0.85

0.93::true_val(stance_width_range_size_157, v56_0); 0.07::true_val(stance_width_range_size_157, unk_swr_157).
0.92::acc(sm, stance_width_range_size_157).
measured(sm, stance_width_range_size_157, v56_0).
all_consistent(stance_width_range_size_157) :- (indep(sm), consistent(sm, stance_width_range_size_157) ; \+indep(sm)).
evidence(all_consistent(stance_width_range_size_157)).
query(true_val(stance_width_range_size_157, v56_0)).
query(true_val(stance_width_range_size_157, unk_swr_157)).

% @attr stance_width_range_size_159
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size 159cm
% @values v56_0=56.0 unk_swr_159=Unknown
% @importance 0.85

0.93::true_val(stance_width_range_size_159, v56_0a); 0.07::true_val(stance_width_range_size_159, unk_swr_159).
0.92::acc(sm, stance_width_range_size_159).
measured(sm, stance_width_range_size_159, v56_0a).
all_consistent(stance_width_range_size_159) :- (indep(sm), consistent(sm, stance_width_range_size_159) ; \+indep(sm)).
evidence(all_consistent(stance_width_range_size_159)).
query(true_val(stance_width_range_size_159, v56_0a)).
query(true_val(stance_width_range_size_159, unk_swr_159)).

% @attr stance_width_range_size_162
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size 162cm
% @values v56_0=56.0 unk_swr_162=Unknown
% @importance 0.85

0.93::true_val(stance_width_range_size_162, v56_0b); 0.07::true_val(stance_width_range_size_162, unk_swr_162).
0.92::acc(sm, stance_width_range_size_162).
measured(sm, stance_width_range_size_162, v56_0b).
all_consistent(stance_width_range_size_162) :- (indep(sm), consistent(sm, stance_width_range_size_162) ; \+indep(sm)).
evidence(all_consistent(stance_width_range_size_162)).
query(true_val(stance_width_range_size_162, v56_0b)).
query(true_val(stance_width_range_size_162, unk_swr_162)).

% @attr recommended_weight_range_size_152
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size 152cm
% @values w54_82kg=54_82kg unk_rwr_152=Unknown
% @importance 0.9

0.95::true_val(recommended_weight_range_size_152, w54_82kg); 0.05::true_val(recommended_weight_range_size_152, unk_rwr_152).
0.92::acc(sm, recommended_weight_range_size_152).
0.85::acc(s11, recommended_weight_range_size_152).
measured(sm, recommended_weight_range_size_152, w54_82kg).
measured(s11, recommended_weight_range_size_152, w54_82kg).
all_consistent(recommended_weight_range_size_152) :- (indep(sm), consistent(sm, recommended_weight_range_size_152) ; \+indep(sm)), consistent(s11, recommended_weight_range_size_152).
evidence(all_consistent(recommended_weight_range_size_152)).
query(true_val(recommended_weight_range_size_152, w54_82kg)).
query(true_val(recommended_weight_range_size_152, unk_rwr_152)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size 155cm
% @values w54_82kg=54_82kg unk_recommended_weight_range_size=Unknown
% @importance 0.9

0.95::true_val(recommended_weight_range_size, w54_82kg_p); 0.05::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).
0.92::acc(sm, recommended_weight_range_size).
0.85::acc(s11, recommended_weight_range_size).
measured(sm, recommended_weight_range_size, w54_82kg_p).
measured(s11, recommended_weight_range_size, w54_82kg_p).
all_consistent(recommended_weight_range_size) :- (indep(sm), consistent(sm, recommended_weight_range_size) ; \+indep(sm)), consistent(s11, recommended_weight_range_size).
evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w54_82kg_p)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr recommended_weight_range_size_157
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size 157cm
% @values w68_91kg=68_91kg unk_rwr_157=Unknown
% @importance 0.9

0.95::true_val(recommended_weight_range_size_157, w68_91kg); 0.05::true_val(recommended_weight_range_size_157, unk_rwr_157).
0.92::acc(sm, recommended_weight_range_size_157).
0.85::acc(s11, recommended_weight_range_size_157).
measured(sm, recommended_weight_range_size_157, w68_91kg).
measured(s11, recommended_weight_range_size_157, w68_91kg).
all_consistent(recommended_weight_range_size_157) :- (indep(sm), consistent(sm, recommended_weight_range_size_157) ; \+indep(sm)), consistent(s11, recommended_weight_range_size_157).
evidence(all_consistent(recommended_weight_range_size_157)).
query(true_val(recommended_weight_range_size_157, w68_91kg)).
query(true_val(recommended_weight_range_size_157, unk_rwr_157)).

% @attr recommended_weight_range_size_159
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size 159cm
% @values w68_91kg=68_91kg unk_rwr_159=Unknown
% @importance 0.9

0.95::true_val(recommended_weight_range_size_159, w68_91kg_b); 0.05::true_val(recommended_weight_range_size_159, unk_rwr_159).
0.92::acc(sm, recommended_weight_range_size_159).
0.85::acc(s11, recommended_weight_range_size_159).
measured(sm, recommended_weight_range_size_159, w68_91kg_b).
measured(s11, recommended_weight_range_size_159, w68_91kg_b).
all_consistent(recommended_weight_range_size_159) :- (indep(sm), consistent(sm, recommended_weight_range_size_159) ; \+indep(sm)), consistent(s11, recommended_weight_range_size_159).
evidence(all_consistent(recommended_weight_range_size_159)).
query(true_val(recommended_weight_range_size_159, w68_91kg_b)).
query(true_val(recommended_weight_range_size_159, unk_rwr_159)).

% @attr recommended_weight_range_size_162
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size 162cm
% @values w82_118plus=82_118plus_kg unk_rwr_162=Unknown
% @importance 0.9

0.95::true_val(recommended_weight_range_size_162, w82_118plus); 0.05::true_val(recommended_weight_range_size_162, unk_rwr_162).
0.92::acc(sm, recommended_weight_range_size_162).
0.85::acc(s11, recommended_weight_range_size_162).
measured(sm, recommended_weight_range_size_162, w82_118plus).
measured(s11, recommended_weight_range_size_162, w82_118plus).
all_consistent(recommended_weight_range_size_162) :- (indep(sm), consistent(sm, recommended_weight_range_size_162) ; \+indep(sm)), consistent(s11, recommended_weight_range_size_162).
evidence(all_consistent(recommended_weight_range_size_162)).
query(true_val(recommended_weight_range_size_162, w82_118plus)).
query(true_val(recommended_weight_range_size_162, unk_rwr_162)).

% @attr overall_rating_snowboardingprofiles
% @type numeric
% @unit /100
% @canonical true
% @original_name overall_rating_snowboardingprofiles
% @values v83_7=83.7 unk_overall_rating=Unknown
% @importance 0.95

0.88::true_val(overall_rating_snowboardingprofiles, v83_7); 0.12::true_val(overall_rating_snowboardingprofiles, unk_overall_rating).
0.88::acc(s11, overall_rating_snowboardingprofiles).
measured(s11, overall_rating_snowboardingprofiles, v83_7).
all_consistent(overall_rating_snowboardingprofiles) :- consistent(s11, overall_rating_snowboardingprofiles).
evidence(all_consistent(overall_rating_snowboardingprofiles)).
query(true_val(overall_rating_snowboardingprofiles, v83_7)).
query(true_val(overall_rating_snowboardingprofiles, unk_overall_rating)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values medium_fast=Medium_fast_effortless_quick_edge_to_edge unk_turn_initiation=Unknown
% @importance 0.925

0.88::true_val(turn_initiation_performance, medium_fast); 0.12::true_val(turn_initiation_performance, unk_turn_initiation).
0.85::acc(s11, turn_initiation_performance).
measured(s11, turn_initiation_performance, medium_fast).
all_consistent(turn_initiation_performance) :- consistent(s11, turn_initiation_performance).
evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, medium_fast)).
query(true_val(turn_initiation_performance, unk_turn_initiation)).

% @attr powder_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical true
% @original_name powder_score_snowboardingprofiles
% @values v3_0=3.0 unk_powder_score=Unknown
% @importance 0.925

0.88::true_val(powder_score_snowboardingprofiles, v3_0); 0.12::true_val(powder_score_snowboardingprofiles, unk_powder_score).
0.85::acc(s11, powder_score_snowboardingprofiles).
measured(s11, powder_score_snowboardingprofiles, v3_0).
all_consistent(powder_score_snowboardingprofiles) :- consistent(s11, powder_score_snowboardingprofiles).
evidence(all_consistent(powder_score_snowboardingprofiles)).
query(true_val(powder_score_snowboardingprofiles, v3_0)).
query(true_val(powder_score_snowboardingprofiles, unk_powder_score)).

% @attr carving_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical true
% @original_name carving_score_snowboardingprofiles
% @values v2_5=2.5 unk_carving_score=Unknown
% @importance 0.925

0.88::true_val(carving_score_snowboardingprofiles, v2_5c); 0.12::true_val(carving_score_snowboardingprofiles, unk_carving_score).
0.85::acc(s11, carving_score_snowboardingprofiles).
measured(s11, carving_score_snowboardingprofiles, v2_5c).
all_consistent(carving_score_snowboardingprofiles) :- consistent(s11, carving_score_snowboardingprofiles).
evidence(all_consistent(carving_score_snowboardingprofiles)).
query(true_val(carving_score_snowboardingprofiles, v2_5c)).
query(true_val(carving_score_snowboardingprofiles, unk_carving_score)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values firm_medium_snow=Firm_Medium_Snow_not_amazing_on_ice unk_edge_hold=Unknown
% @importance 0.9

0.88::true_val(edge_hold, firm_medium_snow); 0.12::true_val(edge_hold, unk_edge_hold).
0.85::acc(s11, edge_hold).
0.78::acc(s22, edge_hold).
measured(s11, edge_hold, firm_medium_snow).
measured(s22, edge_hold, firm_medium_snow).
all_consistent(edge_hold) :- consistent(s11, edge_hold), consistent(s22, edge_hold).
evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, firm_medium_snow)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr speed_rating_tgr
% @type numeric
% @unit /5
% @canonical true
% @original_name speed_rating_tgr
% @values v3_0=3.0 unk_speed_rating=Unknown
% @importance 0.925

0.88::true_val(speed_rating_tgr, v3_0s); 0.12::true_val(speed_rating_tgr, unk_speed_rating).
0.85::acc(s11, speed_rating_tgr).
measured(s11, speed_rating_tgr, v3_0s).
all_consistent(speed_rating_tgr) :- consistent(s11, speed_rating_tgr).
evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, v3_0s)).
query(true_val(speed_rating_tgr, unk_speed_rating)).

% @attr jumps_rating_tgr
% @type numeric
% @unit /5
% @canonical true
% @original_name jumps_rating_tgr
% @values v3_5=3.5 unk_jumps_rating=Unknown
% @importance 0.925

0.88::true_val(jumps_rating_tgr, v3_5); 0.12::true_val(jumps_rating_tgr, unk_jumps_rating).
0.85::acc(s11, jumps_rating_tgr).
measured(s11, jumps_rating_tgr, v3_5).
all_consistent(jumps_rating_tgr) :- consistent(s11, jumps_rating_tgr).
evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, v3_5)).
query(true_val(jumps_rating_tgr, unk_jumps_rating)).

% @attr jibbing_rating_tgr
% @type numeric
% @unit /5
% @canonical true
% @original_name jibbing_rating_tgr
% @values v3_5j=3.5 unk_jibbing_rating=Unknown
% @importance 0.925

0.88::true_val(jibbing_rating_tgr, v3_5j); 0.12::true_val(jibbing_rating_tgr, unk_jibbing_rating).
0.85::acc(s11, jibbing_rating_tgr).
measured(s11, jibbing_rating_tgr, v3_5j).
all_consistent(jibbing_rating_tgr) :- consistent(s11, jibbing_rating_tgr).
evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, v3_5j)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating)).

% @attr switch_riding
% @type numeric
% @unit /5
% @canonical true
% @original_name switch_riding
% @values v4_0=4.0 unk_switch_riding=Unknown
% @importance 0.95

0.88::true_val(switch_riding, v4_0); 0.12::true_val(switch_riding, unk_switch_riding).
0.85::acc(s11, switch_riding).
measured(s11, switch_riding, v4_0).
all_consistent(switch_riding) :- consistent(s11, switch_riding).
evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, v4_0)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values easy_butter_press=Very_easy_to_butter_and_press_4_of_5 unk_positive_aspect=Unknown
% @importance 0.9

0.88::true_val(positive_aspect, easy_butter_press); 0.12::true_val(positive_aspect, unk_positive_aspect).
0.85::acc(s11, positive_aspect).
0.78::acc(s22, positive_aspect).
measured(s11, positive_aspect, easy_butter_press).
measured(s22, positive_aspect, easy_butter_press).
all_consistent(positive_aspect) :- consistent(s11, positive_aspect), consistent(s22, positive_aspect).
evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, easy_butter_press)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr chatter_performance
% @type categorical
% @canonical true
% @original_name chatter_performance
% @values handles_bumps_well=Handles_bumpy_terrain_well unk_chatter=Unknown
% @importance 0.925

0.88::true_val(chatter_performance, handles_bumps_well); 0.12::true_val(chatter_performance, unk_chatter).
0.85::acc(s11, chatter_performance).
measured(s11, chatter_performance, handles_bumps_well).
all_consistent(chatter_performance) :- consistent(s11, chatter_performance).
evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, handles_bumps_well)).
query(true_val(chatter_performance, unk_chatter)).

% @attr trees_rating
% @type numeric
% @unit /5
% @canonical false
% @original_name Trees
% @values v4_0t=4.0 unk_trees_rating=Unknown
% @importance 0.95

0.88::true_val(trees_rating, v4_0t); 0.12::true_val(trees_rating, unk_trees_rating).
0.85::acc(s11, trees_rating).
measured(s11, trees_rating, v4_0t).
all_consistent(trees_rating) :- consistent(s11, trees_rating).
evidence(all_consistent(trees_rating)).
query(true_val(trees_rating, v4_0t)).
query(true_val(trees_rating, unk_trees_rating)).

% @attr pipe_rating_tgr
% @type categorical
% @canonical true
% @original_name pipe_rating_tgr
% @values weakest_discipline=Weakest_too_soft_edge_hold_insufficient unk_pipe_rating=Unknown
% @importance 0.925

0.88::true_val(pipe_rating_tgr, weakest_discipline); 0.12::true_val(pipe_rating_tgr, unk_pipe_rating).
0.85::acc(s11, pipe_rating_tgr).
measured(s11, pipe_rating_tgr, weakest_discipline).
all_consistent(pipe_rating_tgr) :- consistent(s11, pipe_rating_tgr).
evidence(all_consistent(pipe_rating_tgr)).
query(true_val(pipe_rating_tgr, weakest_discipline)).
query(true_val(pipe_rating_tgr, unk_pipe_rating)).

% @attr positive_aspect_forgiving
% @type categorical
% @canonical false
% @original_name positive_aspect (forgiving ride)
% @values very_forgiving=Very_forgiving_catch_free_ride unk_pa_forgiving=Unknown
% @importance 0.775

0.88::true_val(positive_aspect_forgiving, very_forgiving); 0.12::true_val(positive_aspect_forgiving, unk_pa_forgiving).
0.78::acc(s22, positive_aspect_forgiving).
0.80::acc(s17, positive_aspect_forgiving).
measured(s22, positive_aspect_forgiving, very_forgiving).
measured(s17, positive_aspect_forgiving, very_forgiving).
all_consistent(positive_aspect_forgiving) :- consistent(s22, positive_aspect_forgiving), (indep(s17), consistent(s17, positive_aspect_forgiving) ; \+indep(s17)).
evidence(all_consistent(positive_aspect_forgiving)).
query(true_val(positive_aspect_forgiving, very_forgiving)).
query(true_val(positive_aspect_forgiving, unk_pa_forgiving)).

% @attr pop
% @type categorical
% @canonical true
% @original_name pop
% @values decent_pop=Decent_pop_from_camber_zones_good_for_ollies unk_pop=Unknown
% @importance 0.9

0.85::true_val(pop, decent_pop); 0.15::true_val(pop, unk_pop).
0.82::acc(s11, pop).
0.78::acc(s22, pop).
measured(s11, pop, decent_pop).
measured(s22, pop, decent_pop).
all_consistent(pop) :- consistent(s11, pop), consistent(s22, pop).
evidence(all_consistent(pop)).
query(true_val(pop, decent_pop)).
query(true_val(pop, unk_pop)).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name reviewer_opinion_snowboardingprofiles
% @values better_soft_playful=One_of_better_soft_playful_all_mountain_decks unk_reviewer_opinion=Unknown
% @importance 0.95

0.88::true_val(reviewer_opinion_snowboardingprofiles, better_soft_playful); 0.12::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion).
0.85::acc(s11, reviewer_opinion_snowboardingprofiles).
measured(s11, reviewer_opinion_snowboardingprofiles, better_soft_playful).
all_consistent(reviewer_opinion_snowboardingprofiles) :- consistent(s11, reviewer_opinion_snowboardingprofiles).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, better_soft_playful)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion)).

% @attr the_inertia_rating
% @type categorical
% @canonical false
% @original_name The Inertia rating
% @values best_beginner=Best_Beginner_Snowboard_2025_26 unk_inertia_rating=Unknown
% @importance 0.85

0.88::true_val(the_inertia_rating, best_beginner); 0.12::true_val(the_inertia_rating, unk_inertia_rating).
0.88::acc(s66, the_inertia_rating).
measured(s66, the_inertia_rating, best_beginner).
all_consistent(the_inertia_rating) :- consistent(s66, the_inertia_rating).
evidence(all_consistent(the_inertia_rating)).
query(true_val(the_inertia_rating, best_beginner)).
query(true_val(the_inertia_rating, unk_inertia_rating)).

% @attr snow_magazine_opinion
% @type categorical
% @canonical false
% @original_name Snow Magazine opinion
% @values loss_leader_features=Packs_so_many_great_features_could_be_loss_leader unk_snow_mag=Unknown
% @importance 0.6

0.80::true_val(snow_magazine_opinion, loss_leader_features); 0.20::true_val(snow_magazine_opinion, unk_snow_mag).
0.75::acc(s30, snow_magazine_opinion).
measured(s30, snow_magazine_opinion, loss_leader_features).
all_consistent(snow_magazine_opinion) :- consistent(s30, snow_magazine_opinion).
evidence(all_consistent(snow_magazine_opinion)).
query(true_val(snow_magazine_opinion, loss_leader_features)).
query(true_val(snow_magazine_opinion, unk_snow_mag)).

% @attr ugosnow_review_summary
% @type categorical
% @canonical false
% @original_name uGOsnow review summary
% @values creative_fun_backbone=Encourages_creativity_fun_enough_backbone_bestseller unk_ugosnow=Unknown
% @importance 0.825

0.82::true_val(ugosnow_review_summary, creative_fun_backbone); 0.18::true_val(ugosnow_review_summary, unk_ugosnow).
0.78::acc(s22, ugosnow_review_summary).
measured(s22, ugosnow_review_summary, creative_fun_backbone).
all_consistent(ugosnow_review_summary) :- consistent(s22, ugosnow_review_summary).
evidence(all_consistent(ugosnow_review_summary)).
query(true_val(ugosnow_review_summary, creative_fun_backbone)).
query(true_val(ugosnow_review_summary, unk_ugosnow)).

% @attr boyne_country_description
% @type categorical
% @canonical false
% @original_name Boyne Country Sports description
% @values intermediate_advanced_creative=Intermediate_to_advanced_letting_loose_creative unk_boyne_desc=Unknown
% @importance 0.7

0.82::true_val(boyne_country_description, intermediate_advanced_creative); 0.18::true_val(boyne_country_description, unk_boyne_desc).
0.78::acc(s12, boyne_country_description).
measured(s12, boyne_country_description, intermediate_advanced_creative).
all_consistent(boyne_country_description) :- (indep(s12), consistent(s12, boyne_country_description) ; \+indep(s12)).
evidence(all_consistent(boyne_country_description)).
query(true_val(boyne_country_description, intermediate_advanced_creative)).
query(true_val(boyne_country_description, unk_boyne_desc)).

% @attr merchant_customer_rating
% @type numeric
% @unit /5
% @canonical false
% @original_name Merchant customer rating
% @values v5_0=5.0 unk_merchant_rating=Unknown
% @importance 0.85

0.90::true_val(merchant_customer_rating, v5_0); 0.10::true_val(merchant_customer_rating, unk_merchant_rating).
0.80::acc(sm, merchant_customer_rating).
measured(sm, merchant_customer_rating, v5_0).
all_consistent(merchant_customer_rating) :- (indep(sm), consistent(sm, merchant_customer_rating) ; \+indep(sm)).
evidence(all_consistent(merchant_customer_rating)).
query(true_val(merchant_customer_rating, v5_0)).
query(true_val(merchant_customer_rating, unk_merchant_rating)).

% @attr absolute_snow_assessment
% @type categorical
% @canonical false
% @original_name Absolute-Snow assessment
% @values perfect_all_levels=Perfect_for_beginners_to_advanced_mix_it_up unk_abs_snow=Unknown
% @importance 0.675

0.82::true_val(absolute_snow_assessment, perfect_all_levels); 0.18::true_val(absolute_snow_assessment, unk_abs_snow).
0.78::acc(s17, absolute_snow_assessment).
measured(s17, absolute_snow_assessment, perfect_all_levels).
all_consistent(absolute_snow_assessment) :- (indep(s17), consistent(s17, absolute_snow_assessment) ; \+indep(s17)).
evidence(all_consistent(absolute_snow_assessment)).
query(true_val(absolute_snow_assessment, perfect_all_levels)).
query(true_val(absolute_snow_assessment, unk_abs_snow)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values poor_edge_hold_ice=Poor_edge_hold_on_ice_camber_preferred unk_user_review_forum=Unknown
% @importance 0.8

0.78::true_val(user_review_forum, poor_edge_hold_ice); 0.22::true_val(user_review_forum, unk_user_review_forum).
0.72::acc(s42, user_review_forum).
measured(s42, user_review_forum, poor_edge_hold_ice).
all_consistent(user_review_forum) :- consistent(s42, user_review_forum).
evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, poor_edge_hold_ice)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr user_review_forum_progression
% @type categorical
% @canonical false
% @original_name user_review_forum (progression)
% @values overly_forgiving=Flying_V_overly_forgiving_wont_force_better_riding unk_urf_prog=Unknown
% @importance 0.7

0.75::true_val(user_review_forum_progression, overly_forgiving); 0.25::true_val(user_review_forum_progression, unk_urf_prog).
0.68::acc(s100, user_review_forum_progression).
measured(s100, user_review_forum_progression, overly_forgiving).
all_consistent(user_review_forum_progression) :- consistent(s100, user_review_forum_progression).
evidence(all_consistent(user_review_forum_progression)).
query(true_val(user_review_forum_progression, overly_forgiving)).
query(true_val(user_review_forum_progression, unk_urf_prog)).

% @attr user_review_forum_carving_ice
% @type categorical
% @canonical false
% @original_name user_review_forum (carving ice)
% @values washout_carving_ice=Washes_out_carving_ice_no_fun unk_urf_carve=Unknown
% @importance 0.85

0.80::true_val(user_review_forum_carving_ice, washout_carving_ice); 0.20::true_val(user_review_forum_carving_ice, unk_urf_carve).
0.75::acc(s62, user_review_forum_carving_ice).
measured(s62, user_review_forum_carving_ice, washout_carving_ice).
all_consistent(user_review_forum_carving_ice) :- consistent(s62, user_review_forum_carving_ice).
evidence(all_consistent(user_review_forum_carving_ice)).
query(true_val(user_review_forum_carving_ice, washout_carving_ice)).
query(true_val(user_review_forum_carving_ice, unk_urf_carve)).

% @attr user_review_forum_purepop
% @type categorical
% @canonical false
% @original_name user_review_forum (PurePop recommendation)
% @values consider_purepop=Consider_PurePop_Camber_for_technique unk_urf_pp=Unknown
% @importance 0.8

0.78::true_val(user_review_forum_purepop, consider_purepop); 0.22::true_val(user_review_forum_purepop, unk_urf_pp).
0.70::acc(s45, user_review_forum_purepop).
0.68::acc(s100, user_review_forum_purepop).
measured(s45, user_review_forum_purepop, consider_purepop).
measured(s100, user_review_forum_purepop, consider_purepop).
all_consistent(user_review_forum_purepop) :- consistent(s45, user_review_forum_purepop), consistent(s100, user_review_forum_purepop).
evidence(all_consistent(user_review_forum_purepop)).
query(true_val(user_review_forum_purepop, consider_purepop)).
query(true_val(user_review_forum_purepop, unk_urf_pp)).

% @attr user_review_forum_praise
% @type categorical
% @canonical false
% @original_name user_review_forum (praise)
% @values praise_butter_jib=Praised_for_buttering_jibbing_playful_riding unk_urf_praise=Unknown
% @importance 0.5

0.72::true_val(user_review_forum_praise, praise_butter_jib); 0.28::true_val(user_review_forum_praise, unk_urf_praise).
0.65::acc(s47, user_review_forum_praise).
0.75::acc(s62, user_review_forum_praise).
measured(s47, user_review_forum_praise, praise_butter_jib).
measured(s62, user_review_forum_praise, praise_butter_jib).
all_consistent(user_review_forum_praise) :- consistent(s47, user_review_forum_praise), consistent(s62, user_review_forum_praise).
evidence(all_consistent(user_review_forum_praise)).
query(true_val(user_review_forum_praise, praise_butter_jib)).
query(true_val(user_review_forum_praise, unk_urf_praise)).

% @attr user_review_forum_comparison
% @type categorical
% @canonical false
% @original_name user_review_forum (FV vs Camber comparison)
% @values fv_forgiving_camber_edge=FV_more_forgiving_floaty_Camber_better_edge_hold unk_urf_comp=Unknown
% @importance 0.775

0.78::true_val(user_review_forum_comparison, fv_forgiving_camber_edge); 0.22::true_val(user_review_forum_comparison, unk_urf_comp).
0.72::acc(s44, user_review_forum_comparison).
0.70::acc(s45, user_review_forum_comparison).
measured(s44, user_review_forum_comparison, fv_forgiving_camber_edge).
measured(s45, user_review_forum_comparison, fv_forgiving_camber_edge).
all_consistent(user_review_forum_comparison) :- consistent(s44, user_review_forum_comparison), consistent(s45, user_review_forum_comparison).
evidence(all_consistent(user_review_forum_comparison)).
query(true_val(user_review_forum_comparison, fv_forgiving_camber_edge)).
query(true_val(user_review_forum_comparison, unk_urf_comp)).

% @attr comparable_board_same_brand_custom_fv
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Custom Flying V)
% @values custom_fv=Burton_Custom_Flying_V_stiffer_directional unk_cb_custom=Unknown
% @importance 0.7

0.82::true_val(comparable_board_same_brand_custom_fv, custom_fv); 0.18::true_val(comparable_board_same_brand_custom_fv, unk_cb_custom).
0.78::acc(s64, comparable_board_same_brand_custom_fv).
measured(s64, comparable_board_same_brand_custom_fv, custom_fv).
all_consistent(comparable_board_same_brand_custom_fv) :- consistent(s64, comparable_board_same_brand_custom_fv).
evidence(all_consistent(comparable_board_same_brand_custom_fv)).
query(true_val(comparable_board_same_brand_custom_fv, custom_fv)).
query(true_val(comparable_board_same_brand_custom_fv, unk_cb_custom)).

% @attr comparable_board_same_brand_hometown
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Hometown Hero)
% @values hometown_hero=Burton_Hometown_Hero_freeride_directional_camber unk_cb_hh=Unknown
% @importance 0.85

0.82::true_val(comparable_board_same_brand_hometown, hometown_hero); 0.18::true_val(comparable_board_same_brand_hometown, unk_cb_hh).
0.82::acc(s66, comparable_board_same_brand_hometown).
0.78::acc(s22, comparable_board_same_brand_hometown).
measured(s66, comparable_board_same_brand_hometown, hometown_hero).
measured(s22, comparable_board_same_brand_hometown, hometown_hero).
all_consistent(comparable_board_same_brand_hometown) :- consistent(s66, comparable_board_same_brand_hometown), consistent(s22, comparable_board_same_brand_hometown).
evidence(all_consistent(comparable_board_same_brand_hometown)).
query(true_val(comparable_board_same_brand_hometown, hometown_hero)).
query(true_val(comparable_board_same_brand_hometown, unk_cb_hh)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values capita_doa=CAPiTA_DOA_true_twin_hybrid_camber_stiffer unk_comparable_cross=Unknown
% @importance 0.825

0.85::true_val(comparable_board_cross_brand, capita_doa); 0.15::true_val(comparable_board_cross_brand, unk_comparable_cross).
0.78::acc(s62, comparable_board_cross_brand).
0.82::acc(s66, comparable_board_cross_brand).
0.72::acc(s70, comparable_board_cross_brand).
measured(s62, comparable_board_cross_brand, capita_doa).
measured(s66, comparable_board_cross_brand, capita_doa).
measured(s70, comparable_board_cross_brand, capita_doa).
all_consistent(comparable_board_cross_brand) :- consistent(s62, comparable_board_cross_brand), consistent(s66, comparable_board_cross_brand), consistent(s70, comparable_board_cross_brand).
evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, capita_doa)).
query(true_val(comparable_board_cross_brand, unk_comparable_cross)).

% @attr comparable_board_cross_brand_warpig
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Ride Warpig)
% @values ride_warpig=Ride_Warpig_volume_shifted_directional_medium_flex unk_cb_warpig=Unknown
% @importance 0.6

0.78::true_val(comparable_board_cross_brand_warpig, ride_warpig); 0.22::true_val(comparable_board_cross_brand_warpig, unk_cb_warpig).
0.72::acc(s67, comparable_board_cross_brand_warpig).
0.80::acc(s69, comparable_board_cross_brand_warpig).
measured(s67, comparable_board_cross_brand_warpig, ride_warpig).
measured(s69, comparable_board_cross_brand_warpig, ride_warpig).
all_consistent(comparable_board_cross_brand_warpig) :- consistent(s67, comparable_board_cross_brand_warpig), consistent(s69, comparable_board_cross_brand_warpig).
evidence(all_consistent(comparable_board_cross_brand_warpig)).
query(true_val(comparable_board_cross_brand_warpig, ride_warpig)).
query(true_val(comparable_board_cross_brand_warpig, unk_cb_warpig)).

% @attr comparable_board_cross_brand_jones
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Jones Mountain Twin)
% @values jones_mountain_twin=Jones_Mountain_Twin_directional_twin_camber unk_cb_jones=Unknown
% @importance 0.65

0.78::true_val(comparable_board_cross_brand_jones, jones_mountain_twin); 0.22::true_val(comparable_board_cross_brand_jones, unk_cb_jones).
0.75::acc(s70, comparable_board_cross_brand_jones).
measured(s70, comparable_board_cross_brand_jones, jones_mountain_twin).
all_consistent(comparable_board_cross_brand_jones) :- consistent(s70, comparable_board_cross_brand_jones).
evidence(all_consistent(comparable_board_cross_brand_jones)).
query(true_val(comparable_board_cross_brand_jones, jones_mountain_twin)).
query(true_val(comparable_board_cross_brand_jones, unk_cb_jones)).

% @attr comparable_board_cross_brand_bataleon
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Bataleon)
% @values bataleon_goliath=Bataleon_Goliath_Evil_Twin_3BT_base unk_cb_bataleon=Unknown
% @importance 0.8

0.72::true_val(comparable_board_cross_brand_bataleon, bataleon_goliath); 0.28::true_val(comparable_board_cross_brand_bataleon, unk_cb_bataleon).
0.68::acc(s42, comparable_board_cross_brand_bataleon).
measured(s42, comparable_board_cross_brand_bataleon, bataleon_goliath).
all_consistent(comparable_board_cross_brand_bataleon) :- consistent(s42, comparable_board_cross_brand_bataleon).
evidence(all_consistent(comparable_board_cross_brand_bataleon)).
query(true_val(comparable_board_cross_brand_bataleon, bataleon_goliath)).
query(true_val(comparable_board_cross_brand_bataleon, unk_cb_bataleon)).

% @attr user_review_forum_doa_comparison
% @type categorical
% @canonical false
% @original_name user_review_forum (DOA comparison)
% @values doa_poppy_process_playful=DOA_more_poppy_aggressive_Process_more_playful unk_urf_doa=Unknown
% @importance 0.85

0.80::true_val(user_review_forum_doa_comparison, doa_poppy_process_playful); 0.20::true_val(user_review_forum_doa_comparison, unk_urf_doa).
0.78::acc(s62, user_review_forum_doa_comparison).
measured(s62, user_review_forum_doa_comparison, doa_poppy_process_playful).
all_consistent(user_review_forum_doa_comparison) :- consistent(s62, user_review_forum_doa_comparison).
evidence(all_consistent(user_review_forum_doa_comparison)).
query(true_val(user_review_forum_doa_comparison, doa_poppy_process_playful)).
query(true_val(user_review_forum_doa_comparison, unk_urf_doa)).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values channel_all_brands=Channel_all_major_brands_best_with_EST unk_binding=Unknown
% @importance 0.875

0.93::true_val(binding_compatibility, channel_all_brands); 0.07::true_val(binding_compatibility, unk_binding).
0.88::acc(s9, binding_compatibility).
0.78::acc(s20, binding_compatibility).
measured(s9, binding_compatibility, channel_all_brands).
measured(s20, binding_compatibility, channel_all_brands).
all_consistent(binding_compatibility) :- (indep(s9), consistent(s9, binding_compatibility) ; \+indep(s9)), (indep(s20), consistent(s20, binding_compatibility) ; \+indep(s20)).
evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, channel_all_brands)).
query(true_val(binding_compatibility, unk_binding)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values sintered_superior_glide=Sintered_superior_wax_absorption_needs_regular_waxing unk_base_glide=Unknown
% @importance 0.925

0.88::true_val(base_glide_performance, sintered_superior_glide); 0.12::true_val(base_glide_performance, unk_base_glide).
0.88::acc(s9, base_glide_performance).
measured(s9, base_glide_performance, sintered_superior_glide).
all_consistent(base_glide_performance) :- (indep(s9), consistent(s9, base_glide_performance) ; \+indep(s9)).
evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, sintered_superior_glide)).
query(true_val(base_glide_performance, unk_base_glide)).

% @attr board_weight_grams
% @type categorical
% @canonical true
% @original_name board_weight_grams
% @values normal_weight=Normal_weight unk_board_weight=Unknown
% @importance 0.95

0.85::true_val(board_weight_grams, normal_weight); 0.15::true_val(board_weight_grams, unk_board_weight).
0.82::acc(s11, board_weight_grams).
measured(s11, board_weight_grams, normal_weight).
all_consistent(board_weight_grams) :- consistent(s11, board_weight_grams).
evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, normal_weight)).
query(true_val(board_weight_grams, unk_board_weight)).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values single_radius=Single_radius_sidecut unk_sidecut_type=Unknown
% @importance 0.85

0.90::true_val(sidecut_type, single_radius); 0.10::true_val(sidecut_type, unk_sidecut_type).
0.88::acc(sm, sidecut_type).
measured(sm, sidecut_type, single_radius).
all_consistent(sidecut_type) :- (indep(sm), consistent(sm, sidecut_type) ; \+indep(sm)).
evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, single_radius)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr tip_tail_width_size_155w
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size 155W
% @values v29_82=29.82 unk_ttw_155w=Unknown
% @importance 0.85

0.93::true_val(tip_tail_width_size_155w, v29_82); 0.07::true_val(tip_tail_width_size_155w, unk_ttw_155w).
0.92::acc(sm, tip_tail_width_size_155w).
measured(sm, tip_tail_width_size_155w, v29_82).
all_consistent(tip_tail_width_size_155w) :- (indep(sm), consistent(sm, tip_tail_width_size_155w) ; \+indep(sm)).
evidence(all_consistent(tip_tail_width_size_155w)).
query(true_val(tip_tail_width_size_155w, v29_82)).
query(true_val(tip_tail_width_size_155w, unk_ttw_155w)).

% @attr tip_tail_width_size_157w
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size 157W
% @values v29_99=29.99 unk_ttw_157w=Unknown
% @importance 0.85

0.93::true_val(tip_tail_width_size_157w, v29_99); 0.07::true_val(tip_tail_width_size_157w, unk_ttw_157w).
0.92::acc(sm, tip_tail_width_size_157w).
measured(sm, tip_tail_width_size_157w, v29_99).
all_consistent(tip_tail_width_size_157w) :- (indep(sm), consistent(sm, tip_tail_width_size_157w) ; \+indep(sm)).
evidence(all_consistent(tip_tail_width_size_157w)).
query(true_val(tip_tail_width_size_157w, v29_99)).
query(true_val(tip_tail_width_size_157w, unk_ttw_157w)).

% @attr tip_tail_width_size_159w
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size 159W
% @values v30_36=30.36 unk_ttw_159w=Unknown
% @importance 0.85

0.93::true_val(tip_tail_width_size_159w, v30_36); 0.07::true_val(tip_tail_width_size_159w, unk_ttw_159w).
0.92::acc(sm, tip_tail_width_size_159w).
measured(sm, tip_tail_width_size_159w, v30_36).
all_consistent(tip_tail_width_size_159w) :- (indep(sm), consistent(sm, tip_tail_width_size_159w) ; \+indep(sm)).
evidence(all_consistent(tip_tail_width_size_159w)).
query(true_val(tip_tail_width_size_159w, v30_36)).
query(true_val(tip_tail_width_size_159w, unk_ttw_159w)).

% @attr tip_tail_width_size_162w
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size 162W
% @values v30_68=30.68 unk_ttw_162w=Unknown
% @importance 0.85

0.93::true_val(tip_tail_width_size_162w, v30_68); 0.07::true_val(tip_tail_width_size_162w, unk_ttw_162w).
0.92::acc(sm, tip_tail_width_size_162w).
measured(sm, tip_tail_width_size_162w, v30_68).
all_consistent(tip_tail_width_size_162w) :- (indep(sm), consistent(sm, tip_tail_width_size_162w) ; \+indep(sm)).
evidence(all_consistent(tip_tail_width_size_162w)).
query(true_val(tip_tail_width_size_162w, v30_68)).
query(true_val(tip_tail_width_size_162w, unk_ttw_162w)).

% @attr stance_width_range_size_155w
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size 155W
% @values v53_0=53.0 unk_swr_155w=Unknown
% @importance 0.85

0.93::true_val(stance_width_range_size_155w, v53_0w); 0.07::true_val(stance_width_range_size_155w, unk_swr_155w).
0.92::acc(sm, stance_width_range_size_155w).
measured(sm, stance_width_range_size_155w, v53_0w).
all_consistent(stance_width_range_size_155w) :- (indep(sm), consistent(sm, stance_width_range_size_155w) ; \+indep(sm)).
evidence(all_consistent(stance_width_range_size_155w)).
query(true_val(stance_width_range_size_155w, v53_0w)).
query(true_val(stance_width_range_size_155w, unk_swr_155w)).

% @attr stance_width_range_size_157w
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size 157W
% @values v56_0=56.0 unk_swr_157w=Unknown
% @importance 0.85

0.93::true_val(stance_width_range_size_157w, v56_0c); 0.07::true_val(stance_width_range_size_157w, unk_swr_157w).
0.92::acc(sm, stance_width_range_size_157w).
measured(sm, stance_width_range_size_157w, v56_0c).
all_consistent(stance_width_range_size_157w) :- (indep(sm), consistent(sm, stance_width_range_size_157w) ; \+indep(sm)).
evidence(all_consistent(stance_width_range_size_157w)).
query(true_val(stance_width_range_size_157w, v56_0c)).
query(true_val(stance_width_range_size_157w, unk_swr_157w)).

% @attr stance_width_range_size_159w
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size 159W
% @values v56_0=56.0 unk_swr_159w=Unknown
% @importance 0.85

0.93::true_val(stance_width_range_size_159w, v56_0d); 0.07::true_val(stance_width_range_size_159w, unk_swr_159w).
0.92::acc(sm, stance_width_range_size_159w).
measured(sm, stance_width_range_size_159w, v56_0d).
all_consistent(stance_width_range_size_159w) :- (indep(sm), consistent(sm, stance_width_range_size_159w) ; \+indep(sm)).
evidence(all_consistent(stance_width_range_size_159w)).
query(true_val(stance_width_range_size_159w, v56_0d)).
query(true_val(stance_width_range_size_159w, unk_swr_159w)).

% @attr stance_width_range_size_162w
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size 162W
% @values v56_0=56.0 unk_swr_162w=Unknown
% @importance 0.85

0.93::true_val(stance_width_range_size_162w, v56_0e); 0.07::true_val(stance_width_range_size_162w, unk_swr_162w).
0.92::acc(sm, stance_width_range_size_162w).
measured(sm, stance_width_range_size_162w, v56_0e).
all_consistent(stance_width_range_size_162w) :- (indep(sm), consistent(sm, stance_width_range_size_162w) ; \+indep(sm)).
evidence(all_consistent(stance_width_range_size_162w)).
query(true_val(stance_width_range_size_162w, v56_0e)).
query(true_val(stance_width_range_size_162w, unk_swr_162w)).

% @attr recommended_weight_range_size_155w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size 155W
% @values w54_82kg=54_82kg unk_rwr_155w=Unknown
% @importance 0.85

0.93::true_val(recommended_weight_range_size_155w, w54_82kg_w); 0.07::true_val(recommended_weight_range_size_155w, unk_rwr_155w).
0.92::acc(sm, recommended_weight_range_size_155w).
measured(sm, recommended_weight_range_size_155w, w54_82kg_w).
all_consistent(recommended_weight_range_size_155w) :- (indep(sm), consistent(sm, recommended_weight_range_size_155w) ; \+indep(sm)).
evidence(all_consistent(recommended_weight_range_size_155w)).
query(true_val(recommended_weight_range_size_155w, w54_82kg_w)).
query(true_val(recommended_weight_range_size_155w, unk_rwr_155w)).

% @attr recommended_weight_range_size_157w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size 157W
% @values w68_91kg=68_91kg unk_rwr_157w=Unknown
% @importance 0.85

0.93::true_val(recommended_weight_range_size_157w, w68_91kg_w); 0.07::true_val(recommended_weight_range_size_157w, unk_rwr_157w).
0.92::acc(sm, recommended_weight_range_size_157w).
measured(sm, recommended_weight_range_size_157w, w68_91kg_w).
all_consistent(recommended_weight_range_size_157w) :- (indep(sm), consistent(sm, recommended_weight_range_size_157w) ; \+indep(sm)).
evidence(all_consistent(recommended_weight_range_size_157w)).
query(true_val(recommended_weight_range_size_157w, w68_91kg_w)).
query(true_val(recommended_weight_range_size_157w, unk_rwr_157w)).

% @attr recommended_weight_range_size_159w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size 159W
% @values w68_91kg=68_91kg unk_rwr_159w=Unknown
% @importance 0.85

0.93::true_val(recommended_weight_range_size_159w, w68_91kg_w2); 0.07::true_val(recommended_weight_range_size_159w, unk_rwr_159w).
0.92::acc(sm, recommended_weight_range_size_159w).
measured(sm, recommended_weight_range_size_159w, w68_91kg_w2).
all_consistent(recommended_weight_range_size_159w) :- (indep(sm), consistent(sm, recommended_weight_range_size_159w) ; \+indep(sm)).
evidence(all_consistent(recommended_weight_range_size_159w)).
query(true_val(recommended_weight_range_size_159w, w68_91kg_w2)).
query(true_val(recommended_weight_range_size_159w, unk_rwr_159w)).

% @attr recommended_weight_range_size_162w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size 162W
% @values w82_118plus=82_118plus_kg unk_rwr_162w=Unknown
% @importance 0.85

0.93::true_val(recommended_weight_range_size_162w, w82_118plus_w); 0.07::true_val(recommended_weight_range_size_162w, unk_rwr_162w).
0.92::acc(sm, recommended_weight_range_size_162w).
measured(sm, recommended_weight_range_size_162w, w82_118plus_w).
all_consistent(recommended_weight_range_size_162w) :- (indep(sm), consistent(sm, recommended_weight_range_size_162w) ; \+indep(sm)).
evidence(all_consistent(recommended_weight_range_size_162w)).
query(true_val(recommended_weight_range_size_162w, w82_118plus_w)).
query(true_val(recommended_weight_range_size_162w, unk_rwr_162w)).

% @attr effective_edge_155w
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 155W
% @values v1195=1195.0 unk_ee_155w=Unknown
% @importance 0.85

0.93::true_val(effective_edge_155w, v1195w); 0.07::true_val(effective_edge_155w, unk_ee_155w).
0.92::acc(sm, effective_edge_155w).
measured(sm, effective_edge_155w, v1195w).
all_consistent(effective_edge_155w) :- (indep(sm), consistent(sm, effective_edge_155w) ; \+indep(sm)).
evidence(all_consistent(effective_edge_155w)).
query(true_val(effective_edge_155w, v1195w)).
query(true_val(effective_edge_155w, unk_ee_155w)).

% @attr effective_edge_157w
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 157W
% @values v1215=1215.0 unk_ee_157w=Unknown
% @importance 0.85

0.93::true_val(effective_edge_157w, v1215w); 0.07::true_val(effective_edge_157w, unk_ee_157w).
0.92::acc(sm, effective_edge_157w).
measured(sm, effective_edge_157w, v1215w).
all_consistent(effective_edge_157w) :- (indep(sm), consistent(sm, effective_edge_157w) ; \+indep(sm)).
evidence(all_consistent(effective_edge_157w)).
query(true_val(effective_edge_157w, v1215w)).
query(true_val(effective_edge_157w, unk_ee_157w)).

% @attr effective_edge_159w
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 159W
% @values v1235=1235.0 unk_ee_159w=Unknown
% @importance 0.85

0.93::true_val(effective_edge_159w, v1235w); 0.07::true_val(effective_edge_159w, unk_ee_159w).
0.92::acc(sm, effective_edge_159w).
measured(sm, effective_edge_159w, v1235w).
all_consistent(effective_edge_159w) :- (indep(sm), consistent(sm, effective_edge_159w) ; \+indep(sm)).
evidence(all_consistent(effective_edge_159w)).
query(true_val(effective_edge_159w, v1235w)).
query(true_val(effective_edge_159w, unk_ee_159w)).

% @attr effective_edge_162w
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 162W
% @values v1265=1265.0 unk_ee_162w=Unknown
% @importance 0.85

0.93::true_val(effective_edge_162w, v1265w); 0.07::true_val(effective_edge_162w, unk_ee_162w).
0.92::acc(sm, effective_edge_162w).
measured(sm, effective_edge_162w, v1265w).
all_consistent(effective_edge_162w) :- (indep(sm), consistent(sm, effective_edge_162w) ; \+indep(sm)).
evidence(all_consistent(effective_edge_162w)).
query(true_val(effective_edge_162w, v1265w)).
query(true_val(effective_edge_162w, unk_ee_162w)).

% @attr sidecut_radius_size_155w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size 155W
% @values v7_9=7.9 unk_scr_155w=Unknown
% @importance 0.85

0.93::true_val(sidecut_radius_size_155w, v7_9w); 0.07::true_val(sidecut_radius_size_155w, unk_scr_155w).
0.92::acc(sm, sidecut_radius_size_155w).
measured(sm, sidecut_radius_size_155w, v7_9w).
all_consistent(sidecut_radius_size_155w) :- (indep(sm), consistent(sm, sidecut_radius_size_155w) ; \+indep(sm)).
evidence(all_consistent(sidecut_radius_size_155w)).
query(true_val(sidecut_radius_size_155w, v7_9w)).
query(true_val(sidecut_radius_size_155w, unk_scr_155w)).

% @attr sidecut_radius_size_157w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size 157W
% @values v8_1=8.1 unk_scr_157w=Unknown
% @importance 0.85

0.93::true_val(sidecut_radius_size_157w, v8_1w); 0.07::true_val(sidecut_radius_size_157w, unk_scr_157w).
0.92::acc(sm, sidecut_radius_size_157w).
measured(sm, sidecut_radius_size_157w, v8_1w).
all_consistent(sidecut_radius_size_157w) :- (indep(sm), consistent(sm, sidecut_radius_size_157w) ; \+indep(sm)).
evidence(all_consistent(sidecut_radius_size_157w)).
query(true_val(sidecut_radius_size_157w, v8_1w)).
query(true_val(sidecut_radius_size_157w, unk_scr_157w)).

% @attr sidecut_radius_size_159w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size 159W
% @values v8_2=8.2 unk_scr_159w=Unknown
% @importance 0.85

0.93::true_val(sidecut_radius_size_159w, v8_2w); 0.07::true_val(sidecut_radius_size_159w, unk_scr_159w).
0.92::acc(sm, sidecut_radius_size_159w).
measured(sm, sidecut_radius_size_159w, v8_2w).
all_consistent(sidecut_radius_size_159w) :- (indep(sm), consistent(sm, sidecut_radius_size_159w) ; \+indep(sm)).
evidence(all_consistent(sidecut_radius_size_159w)).
query(true_val(sidecut_radius_size_159w, v8_2w)).
query(true_val(sidecut_radius_size_159w, unk_scr_159w)).

% @attr sidecut_radius_size_162w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size 162W
% @values v8_4=8.4 unk_scr_162w=Unknown
% @importance 0.85

0.93::true_val(sidecut_radius_size_162w, v8_4w); 0.07::true_val(sidecut_radius_size_162w, unk_scr_162w).
0.92::acc(sm, sidecut_radius_size_162w).
measured(sm, sidecut_radius_size_162w, v8_4w).
all_consistent(sidecut_radius_size_162w) :- (indep(sm), consistent(sm, sidecut_radius_size_162w) ; \+indep(sm)).
evidence(all_consistent(sidecut_radius_size_162w)).
query(true_val(sidecut_radius_size_162w, v8_4w)).
query(true_val(sidecut_radius_size_162w, unk_scr_162w)).

% @attr availability_status_manufacturer
% @type categorical
% @canonical false
% @original_name availability_status (manufacturer description)
% @values official_manufacturer=Official_manufacturer_highest_trust_free_shipping unk_as_mfr=Unknown
% @importance 0.95

0.93::true_val(availability_status_manufacturer, official_manufacturer); 0.07::true_val(availability_status_manufacturer, unk_as_mfr).
0.95::acc(s1, availability_status_manufacturer).
measured(s1, availability_status_manufacturer, official_manufacturer).
all_consistent(availability_status_manufacturer) :- consistent(s1, availability_status_manufacturer).
evidence(all_consistent(availability_status_manufacturer)).
query(true_val(availability_status_manufacturer, official_manufacturer)).
query(true_val(availability_status_manufacturer, unk_as_mfr)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status (evo description)
% @values major_reputable=Major_reputable_retailer_lowest_price_guarantee unk_as_evo=Unknown
% @importance 0.9

0.92::true_val(availability_status_evo, major_reputable); 0.08::true_val(availability_status_evo, unk_as_evo).
0.88::acc(s9, availability_status_evo).
measured(s9, availability_status_evo, major_reputable).
all_consistent(availability_status_evo) :- (indep(s9), consistent(s9, availability_status_evo) ; \+indep(s9)).
evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, major_reputable)).
query(true_val(availability_status_evo, unk_as_evo)).

% @attr availability_status_rei
% @type categorical
% @canonical false
% @original_name availability_status (REI description)
% @values major_us_clearance=Major_US_outdoor_retailer_discontinued_clearance unk_as_rei=Unknown
% @importance 0.9

0.90::true_val(availability_status_rei, major_us_clearance); 0.10::true_val(availability_status_rei, unk_as_rei).
0.88::acc(s41, availability_status_rei).
measured(s41, availability_status_rei, major_us_clearance).
all_consistent(availability_status_rei) :- consistent(s41, availability_status_rei).
evidence(all_consistent(availability_status_rei)).
query(true_val(availability_status_rei, major_us_clearance)).
query(true_val(availability_status_rei, unk_as_rei)).

% @attr availability_status_bc
% @type categorical
% @canonical false
% @original_name availability_status (Backcountry description)
% @values established_us=Established_US_retailer_member_discounts unk_as_bc=Unknown
% @importance 0.8

0.90::true_val(availability_status_bc, established_us); 0.10::true_val(availability_status_bc, unk_as_bc).
0.85::acc(s18, availability_status_bc).
measured(s18, availability_status_bc, established_us).
all_consistent(availability_status_bc) :- (indep(s18), consistent(s18, availability_status_bc) ; \+indep(s18)).
evidence(all_consistent(availability_status_bc)).
query(true_val(availability_status_bc, established_us)).
query(true_val(availability_status_bc, unk_as_bc)).

% @attr availability_status_boyne
% @type categorical
% @canonical false
% @original_name availability_status (Boyne description)
% @values resort_affiliated=Resort_affiliated_risk_free_30day_returns unk_as_boyne=Unknown
% @importance 0.85

0.88::true_val(availability_status_boyne, resort_affiliated); 0.12::true_val(availability_status_boyne, unk_as_boyne).
0.82::acc(s12, availability_status_boyne).
measured(s12, availability_status_boyne, resort_affiliated).
all_consistent(availability_status_boyne) :- (indep(s12), consistent(s12, availability_status_boyne) ; \+indep(s12)).
evidence(all_consistent(availability_status_boyne)).
query(true_val(availability_status_boyne, resort_affiliated)).
query(true_val(availability_status_boyne, unk_as_boyne)).

% @attr availability_status_ebay
% @type categorical
% @canonical false
% @original_name availability_status (eBay description)
% @values marketplace_new=Marketplace_third_party_sellers_full_msrp unk_as_ebay=Unknown
% @importance 0.6

0.82::true_val(availability_status_ebay, marketplace_new); 0.18::true_val(availability_status_ebay, unk_as_ebay).
0.78::acc(s108, availability_status_ebay).
measured(s108, availability_status_ebay, marketplace_new).
all_consistent(availability_status_ebay) :- consistent(s108, availability_status_ebay).
evidence(all_consistent(availability_status_ebay)).
query(true_val(availability_status_ebay, marketplace_new)).
query(true_val(availability_status_ebay, unk_as_ebay)).

% @attr availability_status_skishack
% @type categorical
% @canonical false
% @original_name availability_status (Ski Shack description)
% @values smaller_specialty=Smaller_specialty_ski_shop_in_stock_discount unk_as_ss=Unknown
% @importance 0.85

0.87::true_val(availability_status_skishack, smaller_specialty); 0.13::true_val(availability_status_skishack, unk_as_ss).
0.80::acc(s33, availability_status_skishack).
measured(s33, availability_status_skishack, smaller_specialty).
all_consistent(availability_status_skishack) :- (indep(s33), consistent(s33, availability_status_skishack) ; \+indep(s33)).
evidence(all_consistent(availability_status_skishack)).
query(true_val(availability_status_skishack, smaller_specialty)).
query(true_val(availability_status_skishack, unk_as_ss)).

% @attr availability_status_park2peak
% @type categorical
% @canonical false
% @original_name availability_status (Park 2 Peak description)
% @values smaller_specialty_retailer=Smaller_specialty_retailer unk_as_p2p=Unknown
% @importance 0.85

0.85::true_val(availability_status_park2peak, smaller_specialty_retailer); 0.15::true_val(availability_status_park2peak, unk_as_p2p).
0.78::acc(s36, availability_status_park2peak).
measured(s36, availability_status_park2peak, smaller_specialty_retailer).
all_consistent(availability_status_park2peak) :- consistent(s36, availability_status_park2peak).
evidence(all_consistent(availability_status_park2peak)).
query(true_val(availability_status_park2peak, smaller_specialty_retailer)).
query(true_val(availability_status_park2peak, unk_as_p2p)).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status (Blauer Board Shop description)
% @values specialty_snowboard=Specialty_snowboard_retailer_good_descriptions unk_as_blauer=Unknown
% @importance 0.8

0.85::true_val(availability_status_blauer, specialty_snowboard); 0.15::true_val(availability_status_blauer, unk_as_blauer).
0.78::acc(s25, availability_status_blauer).
measured(s25, availability_status_blauer, specialty_snowboard).
all_consistent(availability_status_blauer) :- (indep(s25), consistent(s25, availability_status_blauer) ; \+indep(s25)).
evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, specialty_snowboard)).
query(true_val(availability_status_blauer, unk_as_blauer)).

% @attr availability_status_dreamruns
% @type categorical
% @canonical false
% @original_name availability_status (Dreamruns description)
% @values specialty_online=Specialty_online_retailer unk_as_dr=Unknown
% @importance 0.9

0.88::true_val(availability_status_dreamruns, specialty_online); 0.12::true_val(availability_status_dreamruns, unk_as_dr).
0.80::acc(s10, availability_status_dreamruns).
measured(s10, availability_status_dreamruns, specialty_online).
all_consistent(availability_status_dreamruns) :- (indep(s10), consistent(s10, availability_status_dreamruns) ; \+indep(s10)).
evidence(all_consistent(availability_status_dreamruns)).
query(true_val(availability_status_dreamruns, specialty_online)).
query(true_val(availability_status_dreamruns, unk_as_dr)).

% @attr availability_status_snowboard_asylum
% @type categorical
% @canonical false
% @original_name availability_status (Snowboard Asylum description)
% @values uk_specialist=UK_based_specialist_snowboard_retailer unk_as_sa=Unknown
% @importance 0.5

0.85::true_val(availability_status_snowboard_asylum, uk_specialist); 0.15::true_val(availability_status_snowboard_asylum, unk_as_sa).
0.78::acc(s115, availability_status_snowboard_asylum).
measured(s115, availability_status_snowboard_asylum, uk_specialist).
all_consistent(availability_status_snowboard_asylum) :- (indep(s115), consistent(s115, availability_status_snowboard_asylum) ; \+indep(s115)).
evidence(all_consistent(availability_status_snowboard_asylum)).
query(true_val(availability_status_snowboard_asylum, uk_specialist)).
query(true_val(availability_status_snowboard_asylum, unk_as_sa)).

% @attr availability_status_absolute_snow
% @type categorical
% @canonical false
% @original_name availability_status (Absolute-Snow description)
% @values uk_specialist_guides=UK_based_specialist_detailed_buying_guides unk_as_abs=Unknown
% @importance 0.7

0.85::true_val(availability_status_absolute_snow, uk_specialist_guides); 0.15::true_val(availability_status_absolute_snow, unk_as_abs).
0.78::acc(s17, availability_status_absolute_snow).
measured(s17, availability_status_absolute_snow, uk_specialist_guides).
all_consistent(availability_status_absolute_snow) :- (indep(s17), consistent(s17, availability_status_absolute_snow) ; \+indep(s17)).
evidence(all_consistent(availability_status_absolute_snow)).
query(true_val(availability_status_absolute_snow, uk_specialist_guides)).
query(true_val(availability_status_absolute_snow, unk_as_abs)).

% @attr availability_status_tradeinn
% @type categorical
% @canonical false
% @original_name availability_status (Tradeinn description)
% @values european_online=European_online_sports_retailer_detailed_specs unk_as_ti=Unknown
% @importance 0.75

0.85::true_val(availability_status_tradeinn, european_online); 0.15::true_val(availability_status_tradeinn, unk_as_ti).
0.78::acc(s114, availability_status_tradeinn).
measured(s114, availability_status_tradeinn, european_online).
all_consistent(availability_status_tradeinn) :- (indep(s114), consistent(s114, availability_status_tradeinn) ; \+indep(s114)).
evidence(all_consistent(availability_status_tradeinn)).
query(true_val(availability_status_tradeinn, european_online)).
query(true_val(availability_status_tradeinn, unk_as_ti)).

% @attr terrain_suitability_quiver
% @type categorical
% @canonical false
% @original_name terrain_suitability (one-board quiver)
% @values one_board_quiver=One_board_quiver_playful_AM_freestyle_park_butter_jib unk_ts_quiver=Unknown
% @importance 0.9

0.88::true_val(terrain_suitability_quiver, one_board_quiver); 0.12::true_val(terrain_suitability_quiver, unk_ts_quiver).
0.85::acc(s11, terrain_suitability_quiver).
0.78::acc(s22, terrain_suitability_quiver).
measured(s11, terrain_suitability_quiver, one_board_quiver).
measured(s22, terrain_suitability_quiver, one_board_quiver).
all_consistent(terrain_suitability_quiver) :- consistent(s11, terrain_suitability_quiver), consistent(s22, terrain_suitability_quiver).
evidence(all_consistent(terrain_suitability_quiver)).
query(true_val(terrain_suitability_quiver, one_board_quiver)).
query(true_val(terrain_suitability_quiver, unk_ts_quiver)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values intermediate_forgiving=Intermediate_wanting_forgiving_playful_also_beginners unk_skill_rec=Unknown
% @importance 0.817

0.88::true_val(skill_level_recommendation, intermediate_forgiving); 0.12::true_val(skill_level_recommendation, unk_skill_rec).
0.85::acc(s11, skill_level_recommendation).
0.80::acc(s17, skill_level_recommendation).
0.85::acc(s66, skill_level_recommendation).
measured(s11, skill_level_recommendation, intermediate_forgiving).
measured(s17, skill_level_recommendation, intermediate_forgiving).
measured(s66, skill_level_recommendation, intermediate_forgiving).
all_consistent(skill_level_recommendation) :- consistent(s11, skill_level_recommendation), (indep(s17), consistent(s17, skill_level_recommendation) ; \+indep(s17)), consistent(s66, skill_level_recommendation).
evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, intermediate_forgiving)).
query(true_val(skill_level_recommendation, unk_skill_rec)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values not_for_carvers_ice=Not_for_aggressive_carvers_speed_chargers_pipe_icy unk_negative=Unknown
% @importance 0.883

0.88::true_val(negative_aspect, not_for_carvers_ice); 0.12::true_val(negative_aspect, unk_negative).
0.85::acc(s11, negative_aspect).
0.72::acc(s42, negative_aspect).
measured(s11, negative_aspect, not_for_carvers_ice).
measured(s42, negative_aspect, not_for_carvers_ice).
all_consistent(negative_aspect) :- consistent(s11, negative_aspect), consistent(s42, negative_aspect).
evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, not_for_carvers_ice)).
query(true_val(negative_aspect, unk_negative)).

% @attr value_assessment
% @type categorical
% @canonical false
% @original_name Value assessment
% @values average_msrp_often_discounted=Average_MSRP_549_95_frequently_20_30pct_off unk_value=Unknown
% @importance 0.833

0.85::true_val(value_assessment, average_msrp_often_discounted); 0.15::true_val(value_assessment, unk_value).
0.82::acc(s11, value_assessment).
0.80::acc(s12, value_assessment).
0.78::acc(s36, value_assessment).
measured(s11, value_assessment, average_msrp_often_discounted).
measured(s12, value_assessment, average_msrp_often_discounted).
measured(s36, value_assessment, average_msrp_often_discounted).
all_consistent(value_assessment) :- consistent(s11, value_assessment), (indep(s12), consistent(s12, value_assessment) ; \+indep(s12)), consistent(s36, value_assessment).
evidence(all_consistent(value_assessment)).
query(true_val(value_assessment, average_msrp_often_discounted)).
query(true_val(value_assessment, unk_value)).