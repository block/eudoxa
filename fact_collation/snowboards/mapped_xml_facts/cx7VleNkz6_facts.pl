0.15::indep(sM).
0.12::indep(s2).
0.20::indep(s3).
0.12::indep(s5).
0.12::indep(s10).
0.25::indep(s12).
0.15::indep(s17).
0.25::indep(s18).
0.12::indep(s19).
0.12::indep(s21).
0.12::indep(s22).
0.20::indep(s23).
0.15::indep(s24).
0.12::indep(s25).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values ride_snowboards=Ride_Snowboards unk_brand=Unknown
% @importance 1.0

0.95::true_val(brand, ride_snowboards); 0.05::true_val(brand, unk_brand).

0.95::acc(s1, brand).

measured(s1, brand, ride_snowboards).

all_consistent(brand) :- consistent(s1, brand).

evidence(all_consistent(brand)).
query(true_val(brand, ride_snowboards)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values warpig=Warpig unk_model_name=Unknown
% @importance 1.0

0.95::true_val(model_name, warpig); 0.05::true_val(model_name, unk_model_name).

0.95::acc(s1, model_name).

measured(s1, model_name, warpig).

all_consistent(model_name) :- consistent(s1, model_name).

evidence(all_consistent(model_name)).
query(true_val(model_name, warpig)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2027=2027 unk_model_year=Unknown
% @importance 0.85

0.93::true_val(model_year, y2027); 0.07::true_val(model_year, unk_model_year).

0.92::acc(sM, model_year).

measured(sM, model_year, y2027).

all_consistent(model_year) :- consistent(sM, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2027)).
query(true_val(model_year, unk_model_year)).

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

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain=All_Mountain unk_board_category=Unknown
% @importance 1.0

0.95::true_val(board_category, all_mountain); 0.05::true_val(board_category, unk_board_category).

0.95::acc(s1, board_category).

measured(s1, board_category, all_mountain).

all_consistent(board_category) :- consistent(s1, board_category).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain)).
query(true_val(board_category, unk_board_category)).

% @attr board_subtype
% @type categorical
% @canonical false
% @original_name Board subtype
% @values volume_shifted_short_wide=Volume_shifted_short_wide unk_board_subtype=Unknown
% @importance 0.7

0.48::true_val(board_subtype, volume_shifted_short_wide); 0.52::true_val(board_subtype, unk_board_subtype).

0.55::acc(s2, board_subtype).

measured(s2, board_subtype, volume_shifted_short_wide).

all_consistent(board_subtype) :- consistent(s2, board_subtype).

evidence(all_consistent(board_subtype)).
query(true_val(board_subtype, volume_shifted_short_wide)).
query(true_val(board_subtype, unk_board_subtype)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values unisex=Unisex unk_gender=Unknown
% @importance 0.8

0.68::true_val(gender, unisex); 0.32::true_val(gender, unk_gender).

0.72::acc(s3, gender).

measured(s3, gender, unisex).

all_consistent(gender) :- consistent(s3, gender).

evidence(all_consistent(gender)).
query(true_val(gender, unisex)).
query(true_val(gender, unk_gender)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2016_17=2016_17_season unk_model_first_available_year=Unknown
% @importance 0.6

0.81::true_val(model_first_available_year, season_2016_17); 0.19::true_val(model_first_available_year, unk_model_first_available_year).

0.83::acc(s4, model_first_available_year).

measured(s4, model_first_available_year, season_2016_17).

all_consistent(model_first_available_year) :- consistent(s4, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2016_17)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr manufacturer_founded
% @type categorical
% @canonical false
% @original_name Manufacturer founded
% @values y1992_redmond_wa=1992_Redmond_WA unk_manufacturer_founded=Unknown
% @importance 0.4

0.63::true_val(manufacturer_founded, y1992_redmond_wa); 0.37::true_val(manufacturer_founded, unk_manufacturer_founded).

0.65::acc(s5, manufacturer_founded).

measured(s5, manufacturer_founded, y1992_redmond_wa).

all_consistent(manufacturer_founded) :- consistent(s5, manufacturer_founded).

evidence(all_consistent(manufacturer_founded)).
query(true_val(manufacturer_founded, y1992_redmond_wa)).
query(true_val(manufacturer_founded, unk_manufacturer_founded)).

% @attr current_headquarters
% @type categorical
% @canonical false
% @original_name Current headquarters
% @values seattle_wa=Seattle_WA unk_current_headquarters=Unknown
% @importance 0.35

0.81::true_val(current_headquarters, seattle_wa); 0.19::true_val(current_headquarters, unk_current_headquarters).

0.85::acc(s6, current_headquarters).

measured(s6, current_headquarters, seattle_wa).

all_consistent(current_headquarters) :- consistent(s6, current_headquarters).

evidence(all_consistent(current_headquarters)).
query(true_val(current_headquarters, seattle_wa)).
query(true_val(current_headquarters, unk_current_headquarters)).

% @attr parent_company
% @type categorical
% @canonical false
% @original_name Parent company
% @values elevate_outdoor_collective=Elevate_Outdoor_Collective unk_parent_company=Unknown
% @importance 0.5

0.81::true_val(parent_company, elevate_outdoor_collective); 0.19::true_val(parent_company, unk_parent_company).

0.83::acc(s7, parent_company).

measured(s7, parent_company, elevate_outdoor_collective).

all_consistent(parent_company) :- consistent(s7, parent_company).

evidence(all_consistent(parent_company)).
query(true_val(parent_company, elevate_outdoor_collective)).
query(true_val(parent_company, unk_parent_company)).

% @attr parent_company_ownership
% @type categorical
% @canonical false
% @original_name Parent company ownership
% @values kohlberg_and_company=Kohlberg_and_Company unk_parent_company_ownership=Unknown
% @importance 0.3

0.68::true_val(parent_company_ownership, kohlberg_and_company); 0.32::true_val(parent_company_ownership, unk_parent_company_ownership).

0.72::acc(s8, parent_company_ownership).

measured(s8, parent_company_ownership, kohlberg_and_company).

all_consistent(parent_company_ownership) :- consistent(s8, parent_company_ownership).

evidence(all_consistent(parent_company_ownership)).
query(true_val(parent_company_ownership, kohlberg_and_company)).
query(true_val(parent_company_ownership, unk_parent_company_ownership)).

% @attr sister_brands
% @type categorical
% @canonical false
% @original_name Sister brands
% @values k2_marker_dalbello_volkl_line_etc=K2_Marker_Dalbello_Volkl_LINE_etc unk_sister_brands=Unknown
% @importance 0.5

0.81::true_val(sister_brands, k2_marker_dalbello_volkl_line_etc); 0.19::true_val(sister_brands, unk_sister_brands).

0.83::acc(s7, sister_brands).

measured(s7, sister_brands, k2_marker_dalbello_volkl_line_etc).

all_consistent(sister_brands) :- consistent(s7, sister_brands).

evidence(all_consistent(sister_brands)).
query(true_val(sister_brands, k2_marker_dalbello_volkl_line_etc)).
query(true_val(sister_brands, unk_sister_brands)).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values china=China unk_manufacturing_location=Unknown
% @importance 0.5

0.36::true_val(manufacturing_location, china); 0.64::true_val(manufacturing_location, unk_manufacturing_location).

0.55::acc(s9, manufacturing_location).

measured(s9, manufacturing_location, china).

all_consistent(manufacturing_location) :- consistent(s9, manufacturing_location).

evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, china)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

% @attr brand_experience
% @type categorical
% @canonical false
% @original_name Brand experience
% @values over_30_years=Over_30_years unk_brand_experience=Unknown
% @importance 0.3

0.51::true_val(brand_experience, over_30_years); 0.49::true_val(brand_experience, unk_brand_experience).

0.55::acc(s10, brand_experience).

measured(s10, brand_experience, over_30_years).

all_consistent(brand_experience) :- consistent(s10, brand_experience).

evidence(all_consistent(brand_experience)).
query(true_val(brand_experience, over_30_years)).
query(true_val(brand_experience, unk_brand_experience)).

% @attr price_aud_merchant
% @type numeric
% @canonical true
% @original_name price_aud_merchant
% @unit AUD
% @values v949_99=949.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.93::true_val(price_aud_merchant, v949_99); 0.07::true_val(price_aud_merchant, unk_price_aud_merchant).

0.94::acc(sM, price_aud_merchant).

measured(sM, price_aud_merchant, v949_99).

all_consistent(price_aud_merchant) :- consistent(sM, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v949_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v599_95=599.95 unk_price_usd_msrp=Unknown
% @importance 1.0

0.93::true_val(price_usd_msrp, v599_95); 0.07::true_val(price_usd_msrp, unk_price_usd_msrp).

0.95::acc(s1, price_usd_msrp).

measured(s1, price_usd_msrp, v599_95).

all_consistent(price_usd_msrp) :- consistent(s1, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v599_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_usd_sale_manufacturer
% @type numeric
% @canonical false
% @original_name Price (USD sale, manufacturer 2026 model)
% @unit USD
% @values v419_97=419.97 unk_price_usd_sale_manufacturer=Unknown
% @importance 1.0

0.93::true_val(price_usd_sale_manufacturer, v419_97); 0.07::true_val(price_usd_sale_manufacturer, unk_price_usd_sale_manufacturer).

0.95::acc(s1, price_usd_sale_manufacturer).

measured(s1, price_usd_sale_manufacturer, v419_97).

all_consistent(price_usd_sale_manufacturer) :- consistent(s1, price_usd_sale_manufacturer).

evidence(all_consistent(price_usd_sale_manufacturer)).
query(true_val(price_usd_sale_manufacturer, v419_97)).
query(true_val(price_usd_sale_manufacturer, unk_price_usd_sale_manufacturer)).

% @attr price_usd_evo
% @type numeric
% @canonical true
% @original_name price_usd_evo
% @unit USD
% @values v479_96=479.96 unk_price_usd_evo=Unknown
% @importance 0.9

0.68::true_val(price_usd_evo, v479_96); 0.32::true_val(price_usd_evo, unk_price_usd_evo).

0.92::acc(s12, price_usd_evo).

measured(s12, price_usd_evo, v479_96).

all_consistent(price_usd_evo) :- consistent(s12, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v479_96)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_evo_2025_sale
% @type numeric
% @canonical false
% @original_name price_usd_evo (2025 sale)
% @unit USD
% @values v384_96=384.96 unk_price_usd_evo_2025_sale=Unknown
% @importance 0.7

0.68::true_val(price_usd_evo_2025_sale, v384_96); 0.32::true_val(price_usd_evo_2025_sale, unk_price_usd_evo_2025_sale).

0.90::acc(s13, price_usd_evo_2025_sale).

measured(s13, price_usd_evo_2025_sale, v384_96).

all_consistent(price_usd_evo_2025_sale) :- consistent(s13, price_usd_evo_2025_sale).

evidence(all_consistent(price_usd_evo_2025_sale)).
query(true_val(price_usd_evo_2025_sale, v384_96)).
query(true_val(price_usd_evo_2025_sale, unk_price_usd_evo_2025_sale)).

% @attr availability_status_macs_au
% @type categorical
% @canonical false
% @original_name availability_status (Mac's Waterski AU)
% @values sold_out=Sold_Out unk_availability_status_macs_au=Unknown
% @importance 0.6

0.54::true_val(availability_status_macs_au, sold_out); 0.46::true_val(availability_status_macs_au, unk_availability_status_macs_au).

0.82::acc(s2, availability_status_macs_au).

measured(s2, availability_status_macs_au, sold_out).

all_consistent(availability_status_macs_au) :- consistent(s2, availability_status_macs_au).

evidence(all_consistent(availability_status_macs_au)).
query(true_val(availability_status_macs_au, sold_out)).
query(true_val(availability_status_macs_au, unk_availability_status_macs_au)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status (evo.com US)
% @values in_stock_2026=In_stock_2026 unk_availability_status_evo=Unknown
% @importance 0.7

0.72::true_val(availability_status_evo, in_stock_2026); 0.28::true_val(availability_status_evo, unk_availability_status_evo).

0.88::acc(s12, availability_status_evo).

measured(s12, availability_status_evo, in_stock_2026).

all_consistent(availability_status_evo) :- consistent(s12, availability_status_evo).

evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, in_stock_2026)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

% @attr availability_status_tactics
% @type categorical
% @canonical false
% @original_name availability_status (Tactics.com US)
% @values in_stock_2026=In_stock_2026 unk_availability_status_tactics=Unknown
% @importance 0.7

0.68::true_val(availability_status_tactics, in_stock_2026); 0.32::true_val(availability_status_tactics, unk_availability_status_tactics).

0.85::acc(s3, availability_status_tactics).

measured(s3, availability_status_tactics, in_stock_2026).

all_consistent(availability_status_tactics) :- consistent(s3, availability_status_tactics).

evidence(all_consistent(availability_status_tactics)).
query(true_val(availability_status_tactics, in_stock_2026)).
query(true_val(availability_status_tactics, unk_availability_status_tactics)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status (Auski AU)
% @values available_2027=Available_2027 unk_availability_status=Unknown
% @importance 0.7

0.55::true_val(availability_status, available_2027); 0.45::true_val(availability_status, unk_availability_status).

0.82::acc(s17, availability_status).

measured(s17, availability_status, available_2027).

all_consistent(availability_status) :- consistent(s17, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, available_2027)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_ballistyx
% @type categorical
% @canonical false
% @original_name availability_status (Ballistyx AU)
% @values available_2027=Available_2027 unk_availability_status_ballistyx=Unknown
% @importance 0.7

0.60::true_val(availability_status_ballistyx, available_2027); 0.40::true_val(availability_status_ballistyx, unk_availability_status_ballistyx).

0.82::acc(s18, availability_status_ballistyx).

measured(s18, availability_status_ballistyx, available_2027).

all_consistent(availability_status_ballistyx) :- consistent(s18, availability_status_ballistyx).

evidence(all_consistent(availability_status_ballistyx)).
query(true_val(availability_status_ballistyx, available_2027)).
query(true_val(availability_status_ballistyx, unk_availability_status_ballistyx)).

% @attr availability_status_wilderness
% @type categorical
% @canonical false
% @original_name availability_status (Wilderness Sea n Ski AU)
% @values available_2027=Available_2027_148_151_154 unk_availability_status_wilderness=Unknown
% @importance 0.6

0.48::true_val(availability_status_wilderness, available_2027); 0.52::true_val(availability_status_wilderness, unk_availability_status_wilderness).

0.78::acc(s19, availability_status_wilderness).

measured(s19, availability_status_wilderness, available_2027).

all_consistent(availability_status_wilderness) :- consistent(s19, availability_status_wilderness).

evidence(all_consistent(availability_status_wilderness)).
query(true_val(availability_status_wilderness, available_2027)).
query(true_val(availability_status_wilderness, unk_availability_status_wilderness)).

% @attr availability_status_melbourne
% @type categorical
% @canonical false
% @original_name availability_status (Melbourne Snowboard Centre AU)
% @values available_2027=Available_2027 unk_availability_status_melbourne=Unknown
% @importance 0.6

0.48::true_val(availability_status_melbourne, available_2027); 0.52::true_val(availability_status_melbourne, unk_availability_status_melbourne).

0.82::acc(sM, availability_status_melbourne).

measured(sM, availability_status_melbourne, available_2027).

all_consistent(availability_status_melbourne) :- consistent(sM, availability_status_melbourne).

evidence(all_consistent(availability_status_melbourne)).
query(true_val(availability_status_melbourne, available_2027)).
query(true_val(availability_status_melbourne, unk_availability_status_melbourne)).

% @attr availability_status_basenz
% @type categorical
% @canonical false
% @original_name availability_status (BaseNZ NZ)
% @values available_2027=Available_2027 unk_availability_status_basenz=Unknown
% @importance 0.6

0.47::true_val(availability_status_basenz, available_2027); 0.53::true_val(availability_status_basenz, unk_availability_status_basenz).

0.75::acc(s21, availability_status_basenz).

measured(s21, availability_status_basenz, available_2027).

all_consistent(availability_status_basenz) :- consistent(s21, availability_status_basenz).

evidence(all_consistent(availability_status_basenz)).
query(true_val(availability_status_basenz, available_2027)).
query(true_val(availability_status_basenz, unk_availability_status_basenz)).

% @attr availability_status_amazon
% @type categorical
% @canonical false
% @original_name availability_status (Amazon.com US)
% @values available=Available unk_availability_status_amazon=Unknown
% @importance 0.6

0.56::true_val(availability_status_amazon, available); 0.44::true_val(availability_status_amazon, unk_availability_status_amazon).

0.80::acc(s22, availability_status_amazon).

measured(s22, availability_status_amazon, available).

all_consistent(availability_status_amazon) :- consistent(s22, availability_status_amazon).

evidence(all_consistent(availability_status_amazon)).
query(true_val(availability_status_amazon, available)).
query(true_val(availability_status_amazon, unk_availability_status_amazon)).

% @attr availability_status_s2as
% @type categorical
% @canonical false
% @original_name availability_status (S2AS UK)
% @values available_2026=Available_2026 unk_availability_status_s2as=Unknown
% @importance 0.6

0.48::true_val(availability_status_s2as, available_2026); 0.52::true_val(availability_status_s2as, unk_availability_status_s2as).

0.78::acc(s23, availability_status_s2as).

measured(s23, availability_status_s2as, available_2026).

all_consistent(availability_status_s2as) :- consistent(s23, availability_status_s2as).

evidence(all_consistent(availability_status_s2as)).
query(true_val(availability_status_s2as, available_2026)).
query(true_val(availability_status_s2as, unk_availability_status_s2as)).

% @attr availability_status_freeride
% @type categorical
% @canonical false
% @original_name availability_status (Freeride Boardshop Canada)
% @values available_2026=Available_2026 unk_availability_status_freeride=Unknown
% @importance 0.6

0.48::true_val(availability_status_freeride, available_2026); 0.52::true_val(availability_status_freeride, unk_availability_status_freeride).

0.78::acc(s24, availability_status_freeride).

measured(s24, availability_status_freeride, available_2026).

all_consistent(availability_status_freeride) :- consistent(s24, availability_status_freeride).

evidence(all_consistent(availability_status_freeride)).
query(true_val(availability_status_freeride, available_2026)).
query(true_val(availability_status_freeride, unk_availability_status_freeride)).

% @attr availability_status_corbetts
% @type categorical
% @canonical false
% @original_name availability_status (Corbetts Ski + Snowboard)
% @values available_2026=Available_2026 unk_availability_status_corbetts=Unknown
% @importance 0.5

0.45::true_val(availability_status_corbetts, available_2026); 0.55::true_val(availability_status_corbetts, unk_availability_status_corbetts).

0.75::acc(s25, availability_status_corbetts).

measured(s25, availability_status_corbetts, available_2026).

all_consistent(availability_status_corbetts) :- consistent(s25, availability_status_corbetts).

evidence(all_consistent(availability_status_corbetts)).
query(true_val(availability_status_corbetts, available_2026)).
query(true_val(availability_status_corbetts, unk_availability_status_corbetts)).

% @attr price_above_average
% @type categorical
% @canonical false
% @original_name Price above average (US market)
% @values above_11_95=11.95_USD_above_avg_468.01 unk_price_above_average=Unknown
% @importance 0.75

0.52::true_val(price_above_average, above_11_95); 0.48::true_val(price_above_average, unk_price_above_average).

0.70::acc(s29, price_above_average).

measured(s29, price_above_average, above_11_95).

all_consistent(price_above_average) :- consistent(s29, price_above_average).

evidence(all_consistent(price_above_average)).
query(true_val(price_above_average, above_11_95)).
query(true_val(price_above_average, unk_price_above_average)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values three_year_structural=3yr_structural_defect unk_warranty=Unknown
% @importance 0.8

0.71::true_val(warranty, three_year_structural); 0.29::true_val(warranty, unk_warranty).

0.82::acc(s3, warranty).

measured(s3, warranty, three_year_structural).

all_consistent(warranty) :- consistent(s3, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, three_year_structural)).
query(true_val(warranty, unk_warranty)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values xs142_s148_m151_l154_xl158=142_148_151_154_158 unk_available_sizes=Unknown
% @importance 0.925

0.95::true_val(available_sizes, xs142_s148_m151_l154_xl158); 0.05::true_val(available_sizes, unk_available_sizes).

0.95::acc(s1, available_sizes).
0.88::acc(sM, available_sizes).

measured(s1, available_sizes, xs142_s148_m151_l154_xl158).
measured(sM, available_sizes, xs142_s148_m151_l154_xl158).

all_consistent(available_sizes) :-
    consistent(s1, available_sizes),
    (indep(sM), consistent(sM, available_sizes) ; \+indep(sM)).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, xs142_s148_m151_l154_xl158)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr effective_edge_142
% @type numeric
% @canonical false
% @original_name Effective edge X-Small 142cm
% @unit mm
% @values v1044=1044.0 unk_effective_edge_142=Unknown
% @importance 1.0

0.93::true_val(effective_edge_142, v1044); 0.07::true_val(effective_edge_142, unk_effective_edge_142).

0.95::acc(s1, effective_edge_142).

measured(s1, effective_edge_142, v1044).

all_consistent(effective_edge_142) :- consistent(s1, effective_edge_142).

evidence(all_consistent(effective_edge_142)).
query(true_val(effective_edge_142, v1044)).
query(true_val(effective_edge_142, unk_effective_edge_142)).

% @attr effective_edge_148
% @type numeric
% @canonical false
% @original_name Effective edge Small 148cm
% @unit mm
% @values v1095=1095.0 unk_effective_edge_148=Unknown
% @importance 1.0

0.93::true_val(effective_edge_148, v1095); 0.07::true_val(effective_edge_148, unk_effective_edge_148).

0.95::acc(s1, effective_edge_148).

measured(s1, effective_edge_148, v1095).

all_consistent(effective_edge_148) :- consistent(s1, effective_edge_148).

evidence(all_consistent(effective_edge_148)).
query(true_val(effective_edge_148, v1095)).
query(true_val(effective_edge_148, unk_effective_edge_148)).

% @attr effective_edge_151
% @type numeric
% @canonical false
% @original_name Effective edge Medium 151cm
% @unit mm
% @values v1121=1121.0 unk_effective_edge_151=Unknown
% @importance 1.0

0.93::true_val(effective_edge_151, v1121); 0.07::true_val(effective_edge_151, unk_effective_edge_151).

0.95::acc(s1, effective_edge_151).

measured(s1, effective_edge_151, v1121).

all_consistent(effective_edge_151) :- consistent(s1, effective_edge_151).

evidence(all_consistent(effective_edge_151)).
query(true_val(effective_edge_151, v1121)).
query(true_val(effective_edge_151, unk_effective_edge_151)).

% @attr effective_edge_154
% @type numeric
% @canonical false
% @original_name Effective edge Large 154cm
% @unit mm
% @values v1146=1146.0 unk_effective_edge_154=Unknown
% @importance 1.0

0.93::true_val(effective_edge_154, v1146); 0.07::true_val(effective_edge_154, unk_effective_edge_154).

0.95::acc(s1, effective_edge_154).

measured(s1, effective_edge_154, v1146).

all_consistent(effective_edge_154) :- consistent(s1, effective_edge_154).

evidence(all_consistent(effective_edge_154)).
query(true_val(effective_edge_154, v1146)).
query(true_val(effective_edge_154, unk_effective_edge_154)).

% @attr effective_edge_158
% @type numeric
% @canonical false
% @original_name Effective edge X-Large 158cm
% @unit mm
% @values v1171=1171.0 unk_effective_edge_158=Unknown
% @importance 1.0

0.93::true_val(effective_edge_158, v1171); 0.07::true_val(effective_edge_158, unk_effective_edge_158).

0.95::acc(s1, effective_edge_158).

measured(s1, effective_edge_158, v1171).

all_consistent(effective_edge_158) :- consistent(s1, effective_edge_158).

evidence(all_consistent(effective_edge_158)).
query(true_val(effective_edge_158, v1171)).
query(true_val(effective_edge_158, unk_effective_edge_158)).

% @attr waist_width_142
% @type numeric
% @canonical false
% @original_name Waist width X-Small 142cm
% @unit mm
% @values v250=250.0 unk_waist_width_142=Unknown
% @importance 0.925

0.95::true_val(waist_width_142, v250); 0.05::true_val(waist_width_142, unk_waist_width_142).

0.95::acc(s1, waist_width_142).
0.88::acc(sM, waist_width_142).

measured(s1, waist_width_142, v250).
measured(sM, waist_width_142, v250).

all_consistent(waist_width_142) :-
    consistent(s1, waist_width_142),
    (indep(sM), consistent(sM, waist_width_142) ; \+indep(sM)).

evidence(all_consistent(waist_width_142)).
query(true_val(waist_width_142, v250)).
query(true_val(waist_width_142, unk_waist_width_142)).

% @attr waist_width_148
% @type numeric
% @canonical false
% @original_name Waist width Small 148cm
% @unit mm
% @values v260=260.0 unk_waist_width_148=Unknown
% @importance 0.925

0.95::true_val(waist_width_148, v260); 0.05::true_val(waist_width_148, unk_waist_width_148).

0.95::acc(s1, waist_width_148).
0.88::acc(sM, waist_width_148).

measured(s1, waist_width_148, v260).
measured(sM, waist_width_148, v260).

all_consistent(waist_width_148) :-
    consistent(s1, waist_width_148),
    (indep(sM), consistent(sM, waist_width_148) ; \+indep(sM)).

evidence(all_consistent(waist_width_148)).
query(true_val(waist_width_148, v260)).
query(true_val(waist_width_148, unk_waist_width_148)).

% @attr waist_width_151
% @type numeric
% @canonical false
% @original_name Waist width Medium 151cm
% @unit mm
% @values v265=265.0 unk_waist_width_151=Unknown
% @importance 0.925

0.95::true_val(waist_width_151, v265); 0.05::true_val(waist_width_151, unk_waist_width_151).

0.95::acc(s1, waist_width_151).
0.88::acc(sM, waist_width_151).

measured(s1, waist_width_151, v265).
measured(sM, waist_width_151, v265).

all_consistent(waist_width_151) :-
    consistent(s1, waist_width_151),
    (indep(sM), consistent(sM, waist_width_151) ; \+indep(sM)).

evidence(all_consistent(waist_width_151)).
query(true_val(waist_width_151, v265)).
query(true_val(waist_width_151, unk_waist_width_151)).

% @attr waist_width_154
% @type numeric
% @canonical false
% @original_name Waist width Large 154cm
% @unit mm
% @values v270=270.0 unk_waist_width_154=Unknown
% @importance 0.925

0.95::true_val(waist_width_154, v270); 0.05::true_val(waist_width_154, unk_waist_width_154).

0.95::acc(s1, waist_width_154).
0.88::acc(sM, waist_width_154).

measured(s1, waist_width_154, v270).
measured(sM, waist_width_154, v270).

all_consistent(waist_width_154) :-
    consistent(s1, waist_width_154),
    (indep(sM), consistent(sM, waist_width_154) ; \+indep(sM)).

evidence(all_consistent(waist_width_154)).
query(true_val(waist_width_154, v270)).
query(true_val(waist_width_154, unk_waist_width_154)).

% @attr waist_width_158
% @type numeric
% @canonical false
% @original_name Waist width X-Large 158cm
% @unit mm
% @values v277=277.0 unk_waist_width_158=Unknown
% @importance 0.925

0.95::true_val(waist_width_158, v277); 0.05::true_val(waist_width_158, unk_waist_width_158).

0.95::acc(s1, waist_width_158).
0.88::acc(sM, waist_width_158).

measured(s1, waist_width_158, v277).
measured(sM, waist_width_158, v277).

all_consistent(waist_width_158) :-
    consistent(s1, waist_width_158),
    (indep(sM), consistent(sM, waist_width_158) ; \+indep(sM)).

evidence(all_consistent(waist_width_158)).
query(true_val(waist_width_158, v277)).
query(true_val(waist_width_158, unk_waist_width_158)).

% @attr tip_width_142
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (142 nose)
% @unit mm
% @values v301=301.0 unk_tip_width_142=Unknown
% @importance 1.0

0.93::true_val(tip_width_142, v301); 0.07::true_val(tip_width_142, unk_tip_width_142).

0.95::acc(s1, tip_width_142).

measured(s1, tip_width_142, v301).

all_consistent(tip_width_142) :- consistent(s1, tip_width_142).

evidence(all_consistent(tip_width_142)).
query(true_val(tip_width_142, v301)).
query(true_val(tip_width_142, unk_tip_width_142)).

% @attr tip_width_148
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (148 nose)
% @unit mm
% @values v311=311.0 unk_tip_width_148=Unknown
% @importance 1.0

0.93::true_val(tip_width_148, v311); 0.07::true_val(tip_width_148, unk_tip_width_148).

0.95::acc(s1, tip_width_148).

measured(s1, tip_width_148, v311).

all_consistent(tip_width_148) :- consistent(s1, tip_width_148).

evidence(all_consistent(tip_width_148)).
query(true_val(tip_width_148, v311)).
query(true_val(tip_width_148, unk_tip_width_148)).

% @attr tip_width_151
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (151 nose)
% @unit mm
% @values v316=316.0 unk_tip_width_151=Unknown
% @importance 1.0

0.93::true_val(tip_width_151, v316); 0.07::true_val(tip_width_151, unk_tip_width_151).

0.95::acc(s1, tip_width_151).

measured(s1, tip_width_151, v316).

all_consistent(tip_width_151) :- consistent(s1, tip_width_151).

evidence(all_consistent(tip_width_151)).
query(true_val(tip_width_151, v316)).
query(true_val(tip_width_151, unk_tip_width_151)).

% @attr tip_tail_width_size
% @type numeric
% @canonical true
% @original_name tip_tail_width_size (154 nose)
% @unit mm
% @values v321=321.0 unk_tip_tail_width_size=Unknown
% @importance 1.0

0.93::true_val(tip_tail_width_size, v321); 0.07::true_val(tip_tail_width_size, unk_tip_tail_width_size).

0.95::acc(s1, tip_tail_width_size).

measured(s1, tip_tail_width_size, v321).

all_consistent(tip_tail_width_size) :- consistent(s1, tip_tail_width_size).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v321)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr tip_width_158
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (158 nose)
% @unit mm
% @values v328=328.0 unk_tip_width_158=Unknown
% @importance 1.0

0.93::true_val(tip_width_158, v328); 0.07::true_val(tip_width_158, unk_tip_width_158).

0.95::acc(s1, tip_width_158).

measured(s1, tip_width_158, v328).

all_consistent(tip_width_158) :- consistent(s1, tip_width_158).

evidence(all_consistent(tip_width_158)).
query(true_val(tip_width_158, v328)).
query(true_val(tip_width_158, unk_tip_width_158)).

% @attr tail_width_142
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (142 tail)
% @unit mm
% @values v291=291.0 unk_tail_width_142=Unknown
% @importance 1.0

0.93::true_val(tail_width_142, v291); 0.07::true_val(tail_width_142, unk_tail_width_142).

0.95::acc(s1, tail_width_142).

measured(s1, tail_width_142, v291).

all_consistent(tail_width_142) :- consistent(s1, tail_width_142).

evidence(all_consistent(tail_width_142)).
query(true_val(tail_width_142, v291)).
query(true_val(tail_width_142, unk_tail_width_142)).

% @attr tail_width_148
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (148 tail)
% @unit mm
% @values v301=301.0 unk_tail_width_148=Unknown
% @importance 1.0

0.93::true_val(tail_width_148, v301t); 0.07::true_val(tail_width_148, unk_tail_width_148).

0.95::acc(s1, tail_width_148).

measured(s1, tail_width_148, v301t).

all_consistent(tail_width_148) :- consistent(s1, tail_width_148).

evidence(all_consistent(tail_width_148)).
query(true_val(tail_width_148, v301t)).
query(true_val(tail_width_148, unk_tail_width_148)).

% @attr tail_width_151
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (151 tail)
% @unit mm
% @values v306=306.0 unk_tail_width_151=Unknown
% @importance 1.0

0.93::true_val(tail_width_151, v306); 0.07::true_val(tail_width_151, unk_tail_width_151).

0.95::acc(s1, tail_width_151).

measured(s1, tail_width_151, v306).

all_consistent(tail_width_151) :- consistent(s1, tail_width_151).

evidence(all_consistent(tail_width_151)).
query(true_val(tail_width_151, v306)).
query(true_val(tail_width_151, unk_tail_width_151)).

% @attr tail_width_154
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (154 tail)
% @unit mm
% @values v311=311.0 unk_tail_width_154=Unknown
% @importance 1.0

0.93::true_val(tail_width_154, v311t); 0.07::true_val(tail_width_154, unk_tail_width_154).

0.95::acc(s1, tail_width_154).

measured(s1, tail_width_154, v311t).

all_consistent(tail_width_154) :- consistent(s1, tail_width_154).

evidence(all_consistent(tail_width_154)).
query(true_val(tail_width_154, v311t)).
query(true_val(tail_width_154, unk_tail_width_154)).

% @attr tail_width_158
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (158 tail)
% @unit mm
% @values v318=318.0 unk_tail_width_158=Unknown
% @importance 1.0

0.93::true_val(tail_width_158, v318); 0.07::true_val(tail_width_158, unk_tail_width_158).

0.95::acc(s1, tail_width_158).

measured(s1, tail_width_158, v318).

all_consistent(tail_width_158) :- consistent(s1, tail_width_158).

evidence(all_consistent(tail_width_158)).
query(true_val(tail_width_158, v318)).
query(true_val(tail_width_158, unk_tail_width_158)).

% @attr sidecut_radius_142
% @type categorical
% @canonical false
% @original_name sidecut_radius_size (142)
% @unit m
% @values r4_6_5_6=4.6m_5.6m unk_sidecut_radius_142=Unknown
% @importance 0.925

0.95::true_val(sidecut_radius_142, r4_6_5_6); 0.05::true_val(sidecut_radius_142, unk_sidecut_radius_142).

0.95::acc(s1, sidecut_radius_142).
0.88::acc(sM, sidecut_radius_142).

measured(s1, sidecut_radius_142, r4_6_5_6).
measured(sM, sidecut_radius_142, r4_6_5_6).

all_consistent(sidecut_radius_142) :-
    consistent(s1, sidecut_radius_142),
    (indep(sM), consistent(sM, sidecut_radius_142) ; \+indep(sM)).

evidence(all_consistent(sidecut_radius_142)).
query(true_val(sidecut_radius_142, r4_6_5_6)).
query(true_val(sidecut_radius_142, unk_sidecut_radius_142)).

% @attr sidecut_radius_148
% @type categorical
% @canonical false
% @original_name sidecut_radius_size (148)
% @unit m
% @values r5_1_6_2=5.1m_6.2m unk_sidecut_radius_148=Unknown
% @importance 0.925

0.95::true_val(sidecut_radius_148, r5_1_6_2); 0.05::true_val(sidecut_radius_148, unk_sidecut_radius_148).

0.95::acc(s1, sidecut_radius_148).
0.88::acc(sM, sidecut_radius_148).

measured(s1, sidecut_radius_148, r5_1_6_2).
measured(sM, sidecut_radius_148, r5_1_6_2).

all_consistent(sidecut_radius_148) :-
    consistent(s1, sidecut_radius_148),
    (indep(sM), consistent(sM, sidecut_radius_148) ; \+indep(sM)).

evidence(all_consistent(sidecut_radius_148)).
query(true_val(sidecut_radius_148, r5_1_6_2)).
query(true_val(sidecut_radius_148, unk_sidecut_radius_148)).

% @attr sidecut_radius_151
% @type categorical
% @canonical false
% @original_name sidecut_radius_size (151)
% @unit m
% @values r5_4_6_5=5.4m_6.5m unk_sidecut_radius_151=Unknown
% @importance 0.925

0.95::true_val(sidecut_radius_151, r5_4_6_5); 0.05::true_val(sidecut_radius_151, unk_sidecut_radius_151).

0.95::acc(s1, sidecut_radius_151).
0.88::acc(sM, sidecut_radius_151).

measured(s1, sidecut_radius_151, r5_4_6_5).
measured(sM, sidecut_radius_151, r5_4_6_5).

all_consistent(sidecut_radius_151) :-
    consistent(s1, sidecut_radius_151),
    (indep(sM), consistent(sM, sidecut_radius_151) ; \+indep(sM)).

evidence(all_consistent(sidecut_radius_151)).
query(true_val(sidecut_radius_151, r5_4_6_5)).
query(true_val(sidecut_radius_151, unk_sidecut_radius_151)).

% @attr sidecut_radius_size
% @type categorical
% @canonical true
% @original_name sidecut_radius_size (154)
% @unit m
% @values r5_6_6_9=5.6m_6.9m unk_sidecut_radius_size=Unknown
% @importance 0.925

0.95::true_val(sidecut_radius_size, r5_6_6_9); 0.05::true_val(sidecut_radius_size, unk_sidecut_radius_size).

0.95::acc(s1, sidecut_radius_size).
0.88::acc(sM, sidecut_radius_size).

measured(s1, sidecut_radius_size, r5_6_6_9).
measured(sM, sidecut_radius_size, r5_6_6_9).

all_consistent(sidecut_radius_size) :-
    consistent(s1, sidecut_radius_size),
    (indep(sM), consistent(sM, sidecut_radius_size) ; \+indep(sM)).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, r5_6_6_9)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr sidecut_radius_158
% @type categorical
% @canonical false
% @original_name sidecut_radius_size (158)
% @unit m
% @values r5_9_7_2=5.9m_7.2m unk_sidecut_radius_158=Unknown
% @importance 0.925

0.95::true_val(sidecut_radius_158, r5_9_7_2); 0.05::true_val(sidecut_radius_158, unk_sidecut_radius_158).

0.95::acc(s1, sidecut_radius_158).
0.88::acc(sM, sidecut_radius_158).

measured(s1, sidecut_radius_158, r5_9_7_2).
measured(sM, sidecut_radius_158, r5_9_7_2).

all_consistent(sidecut_radius_158) :-
    consistent(s1, sidecut_radius_158),
    (indep(sM), consistent(sM, sidecut_radius_158) ; \+indep(sM)).

evidence(all_consistent(sidecut_radius_158)).
query(true_val(sidecut_radius_158, r5_9_7_2)).
query(true_val(sidecut_radius_158, unk_sidecut_radius_158)).

% @attr setback
% @type numeric
% @canonical true
% @original_name setback
% @unit mm
% @values v0=0.0 unk_setback=Unknown
% @importance 0.925

0.95::true_val(setback, v0); 0.05::true_val(setback, unk_setback).

0.95::acc(s1, setback).
0.88::acc(sM, setback).

measured(s1, setback, v0).
measured(sM, setback, v0).

all_consistent(setback) :-
    consistent(s1, setback),
    (indep(sM), consistent(sM, setback) ; \+indep(sM)).

evidence(all_consistent(setback)).
query(true_val(setback, v0)).
query(true_val(setback, unk_setback)).

% @attr stance_width_142
% @type numeric
% @canonical false
% @original_name stance_width_range_size (142)
% @unit mm
% @values v483=483.0 unk_stance_width_142=Unknown
% @importance 1.0

0.93::true_val(stance_width_142, v483); 0.07::true_val(stance_width_142, unk_stance_width_142).

0.95::acc(s1, stance_width_142).

measured(s1, stance_width_142, v483).

all_consistent(stance_width_142) :- consistent(s1, stance_width_142).

evidence(all_consistent(stance_width_142)).
query(true_val(stance_width_142, v483)).
query(true_val(stance_width_142, unk_stance_width_142)).

% @attr stance_width_148
% @type numeric
% @canonical false
% @original_name stance_width_range_size (148)
% @unit mm
% @values v533=533.0 unk_stance_width_148=Unknown
% @importance 1.0

0.93::true_val(stance_width_148, v533); 0.07::true_val(stance_width_148, unk_stance_width_148).

0.95::acc(s1, stance_width_148).

measured(s1, stance_width_148, v533).

all_consistent(stance_width_148) :- consistent(s1, stance_width_148).

evidence(all_consistent(stance_width_148)).
query(true_val(stance_width_148, v533)).
query(true_val(stance_width_148, unk_stance_width_148)).

% @attr stance_width_151
% @type numeric
% @canonical false
% @original_name stance_width_range_size (151)
% @unit mm
% @values v559=559.0 unk_stance_width_151=Unknown
% @importance 1.0

0.93::true_val(stance_width_151, v559); 0.07::true_val(stance_width_151, unk_stance_width_151).

0.95::acc(s1, stance_width_151).

measured(s1, stance_width_151, v559).

all_consistent(stance_width_151) :- consistent(s1, stance_width_151).

evidence(all_consistent(stance_width_151)).
query(true_val(stance_width_151, v559)).
query(true_val(stance_width_151, unk_stance_width_151)).

% @attr stance_width_range_size
% @type numeric
% @canonical true
% @original_name stance_width_range_size (154)
% @unit mm
% @values v559=559.0 unk_stance_width_range_size=Unknown
% @importance 1.0

0.93::true_val(stance_width_range_size, v559s); 0.07::true_val(stance_width_range_size, unk_stance_width_range_size).

0.95::acc(s1, stance_width_range_size).

measured(s1, stance_width_range_size, v559s).

all_consistent(stance_width_range_size) :- consistent(s1, stance_width_range_size).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v559s)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr stance_width_158
% @type numeric
% @canonical false
% @original_name stance_width_range_size (158)
% @unit mm
% @values v584=584.0 unk_stance_width_158=Unknown
% @importance 1.0

0.93::true_val(stance_width_158, v584); 0.07::true_val(stance_width_158, unk_stance_width_158).

0.95::acc(s1, stance_width_158).

measured(s1, stance_width_158, v584).

all_consistent(stance_width_158) :- consistent(s1, stance_width_158).

evidence(all_consistent(stance_width_158)).
query(true_val(stance_width_158, v584)).
query(true_val(stance_width_158, unk_stance_width_158)).

% @attr rec_weight_142
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (142)
% @unit lbs
% @values w60_160=60_160lbs unk_rec_weight_142=Unknown
% @importance 0.925

0.95::true_val(rec_weight_142, w60_160); 0.05::true_val(rec_weight_142, unk_rec_weight_142).

0.95::acc(s1, rec_weight_142).
0.88::acc(sM, rec_weight_142).

measured(s1, rec_weight_142, w60_160).
measured(sM, rec_weight_142, w60_160).

all_consistent(rec_weight_142) :-
    consistent(s1, rec_weight_142),
    (indep(sM), consistent(sM, rec_weight_142) ; \+indep(sM)).

evidence(all_consistent(rec_weight_142)).
query(true_val(rec_weight_142, w60_160)).
query(true_val(rec_weight_142, unk_rec_weight_142)).

% @attr rec_weight_148
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (148)
% @unit lbs
% @values w100_205=100_205lbs unk_rec_weight_148=Unknown
% @importance 0.925

0.95::true_val(rec_weight_148, w100_205); 0.05::true_val(rec_weight_148, unk_rec_weight_148).

0.95::acc(s1, rec_weight_148).
0.88::acc(sM, rec_weight_148).

measured(s1, rec_weight_148, w100_205).
measured(sM, rec_weight_148, w100_205).

all_consistent(rec_weight_148) :-
    consistent(s1, rec_weight_148),
    (indep(sM), consistent(sM, rec_weight_148) ; \+indep(sM)).

evidence(all_consistent(rec_weight_148)).
query(true_val(rec_weight_148, w100_205)).
query(true_val(rec_weight_148, unk_rec_weight_148)).

% @attr rec_weight_151
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (151)
% @unit lbs
% @values w130_210=130_210lbs unk_rec_weight_151=Unknown
% @importance 0.925

0.95::true_val(rec_weight_151, w130_210); 0.05::true_val(rec_weight_151, unk_rec_weight_151).

0.95::acc(s1, rec_weight_151).
0.88::acc(sM, rec_weight_151).

measured(s1, rec_weight_151, w130_210).
measured(sM, rec_weight_151, w130_210).

all_consistent(rec_weight_151) :-
    consistent(s1, rec_weight_151),
    (indep(sM), consistent(sM, rec_weight_151) ; \+indep(sM)).

evidence(all_consistent(rec_weight_151)).
query(true_val(rec_weight_151, w130_210)).
query(true_val(rec_weight_151, unk_rec_weight_151)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size (154)
% @unit lbs
% @values w140_220plus=140_220plus_lbs unk_recommended_weight_range_size=Unknown
% @importance 0.925

0.95::true_val(recommended_weight_range_size, w140_220plus); 0.05::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

0.95::acc(s1, recommended_weight_range_size).
0.88::acc(sM, recommended_weight_range_size).

measured(s1, recommended_weight_range_size, w140_220plus).
measured(sM, recommended_weight_range_size, w140_220plus).

all_consistent(recommended_weight_range_size) :-
    consistent(s1, recommended_weight_range_size),
    (indep(sM), consistent(sM, recommended_weight_range_size) ; \+indep(sM)).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w140_220plus)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr rec_weight_158
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (158)
% @unit lbs
% @values w170_220plus=170_220plus_lbs unk_rec_weight_158=Unknown
% @importance 0.925

0.95::true_val(rec_weight_158, w170_220plus); 0.05::true_val(rec_weight_158, unk_rec_weight_158).

0.95::acc(s1, rec_weight_158).
0.88::acc(sM, rec_weight_158).

measured(s1, rec_weight_158, w170_220plus).
measured(sM, rec_weight_158, w170_220plus).

all_consistent(rec_weight_158) :-
    consistent(s1, rec_weight_158),
    (indep(sM), consistent(sM, rec_weight_158) ; \+indep(sM)).

evidence(all_consistent(rec_weight_158)).
query(true_val(rec_weight_158, w170_220plus)).
query(true_val(rec_weight_158, unk_rec_weight_158)).

% @attr taper
% @type numeric
% @canonical false
% @original_name taper
% @unit mm
% @values v10=10.0 unk_taper=Unknown
% @importance 0.75

0.63::true_val(taper, v10); 0.37::true_val(taper, unk_taper).

0.85::acc(s28, taper).

measured(s28, taper, v10).

all_consistent(taper) :- consistent(s28, taper).

evidence(all_consistent(taper)).
query(true_val(taper, v10)).
query(true_val(taper, unk_taper)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 0.925

0.95::true_val(shape, tapered_directional); 0.05::true_val(shape, unk_shape).

0.95::acc(s1, shape).
0.88::acc(sM, shape).

measured(s1, shape, tapered_directional).
measured(sM, shape, tapered_directional).

all_consistent(shape) :-
    consistent(s1, shape),
    (indep(sM), consistent(sM, shape) ; \+indep(sM)).

evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values directional_zero_camber=Directional_Zero_Camber_flat_rocker unk_camber_type=Unknown
% @importance 0.925

0.95::true_val(camber_type, directional_zero_camber); 0.05::true_val(camber_type, unk_camber_type).

0.95::acc(s1, camber_type).
0.88::acc(sM, camber_type).

measured(s1, camber_type, directional_zero_camber).
measured(sM, camber_type, directional_zero_camber).

all_consistent(camber_type) :-
    consistent(s1, camber_type),
    (indep(sM), consistent(sM, camber_type) ; \+indep(sM)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, directional_zero_camber)).
query(true_val(camber_type, unk_camber_type)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values medium=Medium touch_stiffer=Touch_stiffer_than_medium
% @importance 0.925

0.60::true_val(flex_feel, medium); 0.40::true_val(flex_feel, touch_stiffer).

0.90::acc(s1, flex_feel).
0.84::acc(s28, flex_feel).

measured(s1, flex_feel, medium).
measured(s28, flex_feel, touch_stiffer).

all_consistent(flex_feel) :-
    consistent(s1, flex_feel),
    consistent(s28, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium)).
query(true_val(flex_feel, touch_stiffer)).

% @attr flex_direction
% @type categorical
% @canonical false
% @original_name flex_direction
% @values directional_nose_softer=Directional_nose_softer_than_tail unk_flex_direction=Unknown
% @importance 0.85

0.63::true_val(flex_direction, directional_nose_softer); 0.37::true_val(flex_direction, unk_flex_direction).

0.82::acc(s29, flex_direction).

measured(s29, flex_direction, directional_nose_softer).

all_consistent(flex_direction) :- consistent(s29, flex_direction).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional_nose_softer)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr flex_rating_10_nose
% @type numeric
% @canonical false
% @original_name flex_rating_10 (nose)
% @unit /10
% @values v4_5=4.5 unk_flex_rating_10_nose=Unknown
% @importance 0.85

0.63::true_val(flex_rating_10_nose, v4_5); 0.37::true_val(flex_rating_10_nose, unk_flex_rating_10_nose).

0.82::acc(s29, flex_rating_10_nose).

measured(s29, flex_rating_10_nose, v4_5).

all_consistent(flex_rating_10_nose) :- consistent(s29, flex_rating_10_nose).

evidence(all_consistent(flex_rating_10_nose)).
query(true_val(flex_rating_10_nose, v4_5)).
query(true_val(flex_rating_10_nose, unk_flex_rating_10_nose)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @original_name flex_rating_10 (tail)
% @unit /10
% @values v6=6.0 unk_flex_rating_10=Unknown
% @importance 0.85

0.63::true_val(flex_rating_10, v6); 0.37::true_val(flex_rating_10, unk_flex_rating_10).

0.82::acc(s29, flex_rating_10).

measured(s29, flex_rating_10, v6).

all_consistent(flex_rating_10) :- consistent(s29, flex_rating_10).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v6)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

% @attr camber_description
% @type categorical
% @canonical false
% @original_name camber_description
% @values flat_between_rocker_nose_tail=Flat_between_feet_large_rocker_nose_smaller_rocker_tail unk_camber_description=Unknown
% @importance 0.75

0.63::true_val(camber_description, flat_between_rocker_nose_tail); 0.37::true_val(camber_description, unk_camber_description).

0.85::acc(s28, camber_description).

measured(s28, camber_description, flat_between_rocker_nose_tail).

all_consistent(camber_description) :- consistent(s28, camber_description).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, flat_between_rocker_nose_tail)).
query(true_val(camber_description, unk_camber_description)).

% @attr mounting_pattern
% @type categorical
% @canonical false
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 0.85

0.93::true_val(mounting_pattern, inserts_2x4); 0.07::true_val(mounting_pattern, unk_mounting_pattern).

0.92::acc(sM, mounting_pattern).

measured(sM, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :- consistent(sM, mounting_pattern).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr width_options_note
% @type categorical
% @canonical false
% @original_name width_options (merchant note)
% @values standard_though_wider=Standard_though_wider_than_conventional unk_width_options_note=Unknown
% @importance 0.85

0.93::true_val(width_options_note, standard_though_wider); 0.07::true_val(width_options_note, unk_width_options_note).

0.88::acc(sM, width_options_note).

measured(sM, width_options_note, standard_though_wider).

all_consistent(width_options_note) :- consistent(sM, width_options_note).

evidence(all_consistent(width_options_note)).
query(true_val(width_options_note, standard_though_wider)).
query(true_val(width_options_note, unk_width_options_note)).

% @attr width_options
% @type categorical
% @canonical true
% @original_name width_options
% @values available_in_wide_yes=Yes unk_width_options=Unknown
% @importance 1.0

0.93::true_val(width_options, available_in_wide_yes); 0.07::true_val(width_options, unk_width_options).

0.95::acc(s1, width_options).

measured(s1, width_options, available_in_wide_yes).

all_consistent(width_options) :- consistent(s1, width_options).

evidence(all_consistent(width_options)).
query(true_val(width_options, available_in_wide_yes)).
query(true_val(width_options, unk_width_options)).

% @attr sidecut_type
% @type categorical
% @canonical false
% @original_name sidecut_type
% @values tapered_bi_radial=Tapered_Bi_Radial_Sidecut unk_sidecut_type=Unknown
% @importance 0.925

0.95::true_val(sidecut_type, tapered_bi_radial); 0.05::true_val(sidecut_type, unk_sidecut_type).

0.95::acc(s1, sidecut_type).
0.88::acc(sM, sidecut_type).

measured(s1, sidecut_type, tapered_bi_radial).
measured(sM, sidecut_type, tapered_bi_radial).

all_consistent(sidecut_type) :-
    consistent(s1, sidecut_type),
    (indep(sM), consistent(sM, sidecut_type) ; \+indep(sM)).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, tapered_bi_radial)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr topsheet
% @type categorical
% @canonical false
% @original_name topsheet
% @values topless_topsheet=Topless_graphics_on_fiberglass unk_topsheet=Unknown
% @importance 0.925

0.95::true_val(topsheet, topless_topsheet); 0.05::true_val(topsheet, unk_topsheet).

0.95::acc(s1, topsheet).
0.88::acc(sM, topsheet).

measured(s1, topsheet, topless_topsheet).
measured(sM, topsheet, topless_topsheet).

all_consistent(topsheet) :-
    consistent(s1, topsheet),
    (indep(sM), consistent(sM, topsheet) ; \+indep(sM)).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, topless_topsheet)).
query(true_val(topsheet, unk_topsheet)).

% @attr laminate
% @type categorical
% @canonical false
% @original_name laminate
% @values hybrid_glass=Hybrid_Glass_triax_top_biax_base unk_laminate=Unknown
% @importance 0.925

0.95::true_val(laminate, hybrid_glass); 0.05::true_val(laminate, unk_laminate).

0.95::acc(s1, laminate).
0.88::acc(sM, laminate).

measured(s1, laminate, hybrid_glass).
measured(sM, laminate, hybrid_glass).

all_consistent(laminate) :-
    consistent(s1, laminate),
    (indep(sM), consistent(sM, laminate) ; \+indep(sM)).

evidence(all_consistent(laminate)).
query(true_val(laminate, hybrid_glass)).
query(true_val(laminate, unk_laminate)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation (Carbon Array 3)
% @values carbon_array_3=Carbon_Array_3_three_carbon_stringers unk_construction_material_innovation=Unknown
% @importance 0.925

0.95::true_val(construction_material_innovation, carbon_array_3); 0.05::true_val(construction_material_innovation, unk_construction_material_innovation).

0.95::acc(s1, construction_material_innovation).
0.88::acc(sM, construction_material_innovation).

measured(s1, construction_material_innovation, carbon_array_3).
measured(sM, construction_material_innovation, carbon_array_3).

all_consistent(construction_material_innovation) :-
    consistent(s1, construction_material_innovation),
    (indep(sM), consistent(sM, construction_material_innovation) ; \+indep(sM)).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, carbon_array_3)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr construction_material_innovation_impact_plates
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Double Impact Plates)
% @values double_impact_plates=Double_Impact_Plates_urethane_weaves unk_construction_material_innovation_impact_plates=Unknown
% @importance 0.925

0.95::true_val(construction_material_innovation_impact_plates, double_impact_plates); 0.05::true_val(construction_material_innovation_impact_plates, unk_construction_material_innovation_impact_plates).

0.95::acc(s1, construction_material_innovation_impact_plates).
0.88::acc(sM, construction_material_innovation_impact_plates).

measured(s1, construction_material_innovation_impact_plates, double_impact_plates).
measured(sM, construction_material_innovation_impact_plates, double_impact_plates).

all_consistent(construction_material_innovation_impact_plates) :-
    consistent(s1, construction_material_innovation_impact_plates),
    (indep(sM), consistent(sM, construction_material_innovation_impact_plates) ; \+indep(sM)).

evidence(all_consistent(construction_material_innovation_impact_plates)).
query(true_val(construction_material_innovation_impact_plates, double_impact_plates)).
query(true_val(construction_material_innovation_impact_plates, unk_construction_material_innovation_impact_plates)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values performance_core_aspen_bamboo_paulownia=Aspen_Bamboo_Paulownia unk_core_material=Unknown
% @importance 1.0

0.93::true_val(core_material, performance_core_aspen_bamboo_paulownia); 0.07::true_val(core_material, unk_core_material).

0.95::acc(s1, core_material).

measured(s1, core_material, performance_core_aspen_bamboo_paulownia).

all_consistent(core_material) :- consistent(s1, core_material).

evidence(all_consistent(core_material)).
query(true_val(core_material, performance_core_aspen_bamboo_paulownia)).
query(true_val(core_material, unk_core_material)).

% @attr sidewall_material
% @type categorical
% @canonical false
% @original_name sidewall_material
% @values slim_walls_slimewall=Slim_Walls_3D_composite_Slimewall_urethane unk_sidewall_material=Unknown
% @importance 1.0

0.93::true_val(sidewall_material, slim_walls_slimewall); 0.07::true_val(sidewall_material, unk_sidewall_material).

0.95::acc(s1, sidewall_material).

measured(s1, sidewall_material, slim_walls_slimewall).

all_consistent(sidewall_material) :- consistent(s1, sidewall_material).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, slim_walls_slimewall)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_4000_stone_ground=Sintered_4000_PTEX_Stone_Ground unk_base_material=Unknown
% @importance 0.925

0.95::true_val(base_material, sintered_4000_stone_ground); 0.05::true_val(base_material, unk_base_material).

0.95::acc(s1, base_material).
0.88::acc(sM, base_material).

measured(s1, base_material, sintered_4000_stone_ground).
measured(sM, base_material, sintered_4000_stone_ground).

all_consistent(base_material) :-
    consistent(s1, base_material),
    (indep(sM), consistent(sM, base_material) ; \+indep(sM)).

evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_4000_stone_ground)).
query(true_val(base_material, unk_base_material)).

% @attr edge_technology
% @type categorical
% @canonical false
% @original_name edge_technology
% @values cleave_edge_steel=Cleave_Edge_Steel_50pct_more unk_edge_technology=Unknown
% @importance 1.0

0.93::true_val(edge_technology, cleave_edge_steel); 0.07::true_val(edge_technology, unk_edge_technology).

0.95::acc(s1, edge_technology).

measured(s1, edge_technology, cleave_edge_steel).

all_consistent(edge_technology) :- consistent(s1, edge_technology).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, cleave_edge_steel)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr resin
% @type categorical
% @canonical false
% @original_name resin
% @values bio_resin=Bio_Resin_plant_based_epoxy unk_resin=Unknown
% @importance 0.925

0.95::true_val(resin, bio_resin); 0.05::true_val(resin, unk_resin).

0.95::acc(s1, resin).
0.88::acc(sM, resin).

measured(s1, resin, bio_resin).
measured(sM, resin, bio_resin).

all_consistent(resin) :-
    consistent(s1, resin),
    (indep(sM), consistent(sM, resin) ; \+indep(sM)).

evidence(all_consistent(resin)).
query(true_val(resin, bio_resin)).
query(true_val(resin, unk_resin)).

% @attr construction_material_innovation_thin_con
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Thin Con)
% @values thin_con=Thin_Con_tapered_tips_tails unk_construction_material_innovation_thin_con=Unknown
% @importance 0.85

0.93::true_val(construction_material_innovation_thin_con, thin_con); 0.07::true_val(construction_material_innovation_thin_con, unk_construction_material_innovation_thin_con).

0.90::acc(sM, construction_material_innovation_thin_con).

measured(sM, construction_material_innovation_thin_con, thin_con).

all_consistent(construction_material_innovation_thin_con) :- consistent(sM, construction_material_innovation_thin_con).

evidence(all_consistent(construction_material_innovation_thin_con)).
query(true_val(construction_material_innovation_thin_con, thin_con)).
query(true_val(construction_material_innovation_thin_con, unk_construction_material_innovation_thin_con)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification (recycled steel)
% @values recycled_steel_30pct=30pct_recycled_steel_in_edges unk_sustainability_certification=Unknown
% @importance 1.0

0.93::true_val(sustainability_certification, recycled_steel_30pct); 0.07::true_val(sustainability_certification, unk_sustainability_certification).

0.95::acc(s1, sustainability_certification).

measured(s1, sustainability_certification, recycled_steel_30pct).

all_consistent(sustainability_certification) :- consistent(s1, sustainability_certification).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, recycled_steel_30pct)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr sustainability_certification_packaging
% @type categorical
% @canonical false
% @original_name sustainability_certification (FSC packaging)
% @values fsc_certified_paper=FSC_Certified_paper_packaging unk_sustainability_certification_packaging=Unknown
% @importance 1.0

0.93::true_val(sustainability_certification_packaging, fsc_certified_paper); 0.07::true_val(sustainability_certification_packaging, unk_sustainability_certification_packaging).

0.95::acc(s1, sustainability_certification_packaging).

measured(s1, sustainability_certification_packaging, fsc_certified_paper).

all_consistent(sustainability_certification_packaging) :- consistent(s1, sustainability_certification_packaging).

evidence(all_consistent(sustainability_certification_packaging)).
query(true_val(sustainability_certification_packaging, fsc_certified_paper)).
query(true_val(sustainability_certification_packaging, unk_sustainability_certification_packaging)).

% @attr sustainability_certification_solar
% @type categorical
% @canonical false
% @original_name sustainability_certification (solar energy)
% @values solar_44pct=44pct_manufacturing_energy_solar unk_sustainability_certification_solar=Unknown
% @importance 1.0

0.93::true_val(sustainability_certification_solar, solar_44pct); 0.07::true_val(sustainability_certification_solar, unk_sustainability_certification_solar).

0.95::acc(s1, sustainability_certification_solar).

measured(s1, sustainability_certification_solar, solar_44pct).

all_consistent(sustainability_certification_solar) :- consistent(s1, sustainability_certification_solar).

evidence(all_consistent(sustainability_certification_solar)).
query(true_val(sustainability_certification_solar, solar_44pct)).
query(true_val(sustainability_certification_solar, unk_sustainability_certification_solar)).

% @attr sustainability_certification_bio_resin
% @type categorical
% @canonical false
% @original_name sustainability_certification (plant-based epoxy)
% @values plant_based_epoxy=Plant_based_epoxy_replaces_petrochemical unk_sustainability_certification_bio_resin=Unknown
% @importance 1.0

0.93::true_val(sustainability_certification_bio_resin, plant_based_epoxy); 0.07::true_val(sustainability_certification_bio_resin, unk_sustainability_certification_bio_resin).

0.95::acc(s1, sustainability_certification_bio_resin).

measured(s1, sustainability_certification_bio_resin, plant_based_epoxy).

all_consistent(sustainability_certification_bio_resin) :- consistent(s1, sustainability_certification_bio_resin).

evidence(all_consistent(sustainability_certification_bio_resin)).
query(true_val(sustainability_certification_bio_resin, plant_based_epoxy)).
query(true_val(sustainability_certification_bio_resin, unk_sustainability_certification_bio_resin)).

% @attr sustainability_certification_wax
% @type categorical
% @canonical false
% @original_name sustainability_certification (biodegradable wax)
% @values meadowfoam_wax=Wend_Meadowfoam_Biodegradable_Wax unk_sustainability_certification_wax=Unknown
% @importance 1.0

0.93::true_val(sustainability_certification_wax, meadowfoam_wax); 0.07::true_val(sustainability_certification_wax, unk_sustainability_certification_wax).

0.95::acc(s1, sustainability_certification_wax).

measured(s1, sustainability_certification_wax, meadowfoam_wax).

all_consistent(sustainability_certification_wax) :- consistent(s1, sustainability_certification_wax).

evidence(all_consistent(sustainability_certification_wax)).
query(true_val(sustainability_certification_wax, meadowfoam_wax)).
query(true_val(sustainability_certification_wax, unk_sustainability_certification_wax)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values ride_6_10cm_shorter=Designed_to_ride_6_10cm_shorter unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.9

0.67::true_val(reviewer_opinion_the_good_ride, ride_6_10cm_shorter); 0.33::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

0.82::acc(s29, reviewer_opinion_the_good_ride).

measured(s29, reviewer_opinion_the_good_ride, ride_6_10cm_shorter).

all_consistent(reviewer_opinion_the_good_ride) :- consistent(s29, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, ride_6_10cm_shorter)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr volume_shift_concept
% @type categorical
% @canonical false
% @original_name Volume shift concept
% @values wider_shorter_same_area=Wider_shorter_similar_surface_area_more_maneuverable unk_volume_shift_concept=Unknown
% @importance 0.85

0.63::true_val(volume_shift_concept, wider_shorter_same_area); 0.37::true_val(volume_shift_concept, unk_volume_shift_concept).

0.82::acc(s28, volume_shift_concept).

measured(s28, volume_shift_concept, wider_shorter_same_area).

all_consistent(volume_shift_concept) :- consistent(s28, volume_shift_concept).

evidence(all_consistent(volume_shift_concept)).
query(true_val(volume_shift_concept, wider_shorter_same_area)).
query(true_val(volume_shift_concept, unk_volume_shift_concept)).

% @attr sizing_advice
% @type categorical
% @canonical false
% @original_name Sizing advice (retailer)
% @values size_down_6_10cm=Size_down_6_10cm unk_sizing_advice=Unknown
% @importance 0.85

0.95::true_val(sizing_advice, size_down_6_10cm); 0.05::true_val(sizing_advice, unk_sizing_advice).

0.82::acc(s29, sizing_advice).
0.78::acc(s18, sizing_advice).

measured(s29, sizing_advice, size_down_6_10cm).
measured(s18, sizing_advice, size_down_6_10cm).

all_consistent(sizing_advice) :-
    consistent(s29, sizing_advice),
    consistent(s18, sizing_advice).

evidence(all_consistent(sizing_advice)).
query(true_val(sizing_advice, size_down_6_10cm)).
query(true_val(sizing_advice, unk_sizing_advice)).

% @attr rider_level
% @type categorical
% @canonical false
% @original_name rider_level
% @values beginner_intermediate_advanced=Beginner_Intermediate_Advanced unk_rider_level=Unknown
% @importance 1.0

0.93::true_val(rider_level, beginner_intermediate_advanced); 0.07::true_val(rider_level, unk_rider_level).

0.95::acc(s1, rider_level).

measured(s1, rider_level, beginner_intermediate_advanced).

all_consistent(rider_level) :- consistent(s1, rider_level).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, beginner_intermediate_advanced)).
query(true_val(rider_level, unk_rider_level)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values intermediate_advanced=Intermediate_Advanced intermediate_only=Intermediate
% @importance 0.883

0.65::true_val(skill_level_recommendation, intermediate_advanced); 0.35::true_val(skill_level_recommendation, intermediate_only).

0.88::acc(s1, skill_level_recommendation).
0.85::acc(s12, skill_level_recommendation).
0.80::acc(sM, skill_level_recommendation).

measured(s1, skill_level_recommendation, intermediate_advanced).
measured(s12, skill_level_recommendation, intermediate_advanced).
measured(sM, skill_level_recommendation, intermediate_only).

all_consistent(skill_level_recommendation) :-
    consistent(s1, skill_level_recommendation),
    (indep(s12), consistent(s12, skill_level_recommendation) ; \+indep(s12)),
    (indep(sM), consistent(sM, skill_level_recommendation) ; \+indep(sM)).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, intermediate_advanced)).
query(true_val(skill_level_recommendation, intermediate_only)).

% @attr skill_level_recommendation_note
% @type categorical
% @canonical false
% @original_name skill_level_recommendation (disagreement note)
% @values disagreement_beg_adv_vs_int_adv_vs_int=Sources_disagree_manufacturer_broadest unk_skill_level_recommendation_note=Unknown
% @importance 0.883

0.90::true_val(skill_level_recommendation_note, disagreement_beg_adv_vs_int_adv_vs_int); 0.10::true_val(skill_level_recommendation_note, unk_skill_level_recommendation_note).

0.88::acc(s1, skill_level_recommendation_note).

measured(s1, skill_level_recommendation_note, disagreement_beg_adv_vs_int_adv_vs_int).

all_consistent(skill_level_recommendation_note) :- consistent(s1, skill_level_recommendation_note).

evidence(all_consistent(skill_level_recommendation_note)).
query(true_val(skill_level_recommendation_note, disagreement_beg_adv_vs_int_adv_vs_int)).
query(true_val(skill_level_recommendation_note, unk_skill_level_recommendation_note)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values all_mtn_park_powder=All_Mountain_Park_Powder all_mtn_powder_focused=All_Mountain_Powder_lean_toward_float
% @importance 0.85

0.60::true_val(terrain_suitability, all_mtn_park_powder); 0.40::true_val(terrain_suitability, all_mtn_powder_focused).

0.93::acc(s1, terrain_suitability).
0.88::acc(sM, terrain_suitability).
0.80::acc(s18, terrain_suitability).

measured(s1, terrain_suitability, all_mtn_park_powder).
measured(sM, terrain_suitability, all_mtn_park_powder).
measured(s18, terrain_suitability, all_mtn_powder_focused).

all_consistent(terrain_suitability) :-
    consistent(s1, terrain_suitability),
    (indep(sM), consistent(sM, terrain_suitability) ; \+indep(sM)),
    consistent(s18, terrain_suitability).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, all_mtn_park_powder)).
query(true_val(terrain_suitability, all_mtn_powder_focused)).

% @attr riding_style
% @type categorical
% @canonical false
% @original_name riding_style
% @values versatile_all_mountain=Versatile_all_mountain_carving_jumps_big_mountain unk_riding_style=Unknown
% @importance 1.0

0.93::true_val(riding_style, versatile_all_mountain); 0.07::true_val(riding_style, unk_riding_style).

0.93::acc(s1, riding_style).

measured(s1, riding_style, versatile_all_mountain).

all_consistent(riding_style) :- consistent(s1, riding_style).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, versatile_all_mountain)).
query(true_val(riding_style, unk_riding_style)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values capable_not_optimized=Can_ride_switch_not_optimized unk_switch_riding=Unknown
% @importance 0.725

0.95::true_val(switch_riding, capable_not_optimized); 0.05::true_val(switch_riding, unk_switch_riding).

0.92::acc(s1, switch_riding).
0.85::acc(s28, switch_riding).

measured(s1, switch_riding, capable_not_optimized).
measured(s28, switch_riding, capable_not_optimized).

all_consistent(switch_riding) :-
    consistent(s1, switch_riding),
    consistent(s28, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, capable_not_optimized)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect (stability)
% @values incredibly_stable=Feels_incredibly_stable_underfoot unk_positive_aspect=Unknown
% @importance 0.85

0.63::true_val(positive_aspect, incredibly_stable); 0.37::true_val(positive_aspect, unk_positive_aspect).

0.82::acc(s29, positive_aspect).

measured(s29, positive_aspect, incredibly_stable).

all_consistent(positive_aspect) :- consistent(s29, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, incredibly_stable)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr positive_aspect_steering
% @type categorical
% @canonical false
% @original_name positive_aspect (steering)
% @values easy_to_steer=Very_easy_to_steer_and_maneuver unk_positive_aspect_steering=Unknown
% @importance 0.85

0.63::true_val(positive_aspect_steering, easy_to_steer); 0.37::true_val(positive_aspect_steering, unk_positive_aspect_steering).

0.82::acc(s29, positive_aspect_steering).

measured(s29, positive_aspect_steering, easy_to_steer).

all_consistent(positive_aspect_steering) :- consistent(s29, positive_aspect_steering).

evidence(all_consistent(positive_aspect_steering)).
query(true_val(positive_aspect_steering, easy_to_steer)).
query(true_val(positive_aspect_steering, unk_positive_aspect_steering)).

% @attr positive_aspect_playful
% @type categorical
% @canonical false
% @original_name positive_aspect (playful)
% @values playful_feel=Very_playful_side_hits_jibs_jumps unk_positive_aspect_playful=Unknown
% @importance 0.85

0.63::true_val(positive_aspect_playful, playful_feel); 0.37::true_val(positive_aspect_playful, unk_positive_aspect_playful).

0.82::acc(s29, positive_aspect_playful).

measured(s29, positive_aspect_playful, playful_feel).

all_consistent(positive_aspect_playful) :- consistent(s29, positive_aspect_playful).

evidence(all_consistent(positive_aspect_playful)).
query(true_val(positive_aspect_playful, playful_feel)).
query(true_val(positive_aspect_playful, unk_positive_aspect_playful)).

% @attr pop
% @type categorical
% @canonical false
% @original_name pop
% @values not_super_poppy=Not_super_poppy_pops_once_learned unk_pop=Unknown
% @importance 0.85

0.65::true_val(pop, not_super_poppy); 0.35::true_val(pop, unk_pop).

0.84::acc(s28, pop).

measured(s28, pop, not_super_poppy).

all_consistent(pop) :- consistent(s28, pop).

evidence(all_consistent(pop)).
query(true_val(pop, not_super_poppy)).
query(true_val(pop, unk_pop)).

% @attr chatter_performance
% @type categorical
% @canonical false
% @original_name chatter_performance
% @values damper_less_chatter=Damper_feel_less_chatter_and_vibrations unk_chatter_performance=Unknown
% @importance 0.85

0.65::true_val(chatter_performance, damper_less_chatter); 0.35::true_val(chatter_performance, unk_chatter_performance).

0.84::acc(s28, chatter_performance).

measured(s28, chatter_performance, damper_less_chatter).

all_consistent(chatter_performance) :- consistent(s28, chatter_performance).

evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, damper_less_chatter)).
query(true_val(chatter_performance, unk_chatter_performance)).

% @attr positive_aspect_float
% @type categorical
% @canonical false
% @original_name positive_aspect (float)
% @values excellent_float=Excellent_float_surfy_feel_deep_snow unk_positive_aspect_float=Unknown
% @importance 0.85

0.64::true_val(positive_aspect_float, excellent_float); 0.36::true_val(positive_aspect_float, unk_positive_aspect_float).

0.82::acc(s36, positive_aspect_float).

measured(s36, positive_aspect_float, excellent_float).

all_consistent(positive_aspect_float) :- consistent(s36, positive_aspect_float).

evidence(all_consistent(positive_aspect_float)).
query(true_val(positive_aspect_float, excellent_float)).
query(true_val(positive_aspect_float, unk_positive_aspect_float)).

% @attr base_glide_performance
% @type categorical
% @canonical false
% @original_name base_glide_performance
% @values performs_well=Sintered_base_performs_well_no_slowdown unk_base_glide_performance=Unknown
% @importance 0.85

0.65::true_val(base_glide_performance, performs_well); 0.35::true_val(base_glide_performance, unk_base_glide_performance).

0.84::acc(s28, base_glide_performance).

measured(s28, base_glide_performance, performs_well).

all_consistent(base_glide_performance) :- consistent(s28, base_glide_performance).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, performs_well)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr edge_hold
% @type categorical
% @canonical false
% @original_name edge_hold
% @values better_than_expected=Better_than_expected_for_flat_profile unk_edge_hold=Unknown
% @importance 0.75

0.63::true_val(edge_hold, better_than_expected); 0.37::true_val(edge_hold, unk_edge_hold).

0.84::acc(s28, edge_hold).

measured(s28, edge_hold, better_than_expected).

all_consistent(edge_hold) :- consistent(s28, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, better_than_expected)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr negative_aspect_nose_chatter
% @type categorical
% @canonical false
% @original_name negative_aspect (nose chatter)
% @values nose_chatters_high_speed=Nose_chatters_at_higher_speeds_on_ice unk_negative_aspect_nose_chatter=Unknown
% @importance 0.9

0.64::true_val(negative_aspect_nose_chatter, nose_chatters_high_speed); 0.36::true_val(negative_aspect_nose_chatter, unk_negative_aspect_nose_chatter).

0.84::acc(s29, negative_aspect_nose_chatter).

measured(s29, negative_aspect_nose_chatter, nose_chatters_high_speed).

all_consistent(negative_aspect_nose_chatter) :- consistent(s29, negative_aspect_nose_chatter).

evidence(all_consistent(negative_aspect_nose_chatter)).
query(true_val(negative_aspect_nose_chatter, nose_chatters_high_speed)).
query(true_val(negative_aspect_nose_chatter, unk_negative_aspect_nose_chatter)).

% @attr carving_rating_tgr
% @type categorical
% @canonical false
% @original_name carving_rating_tgr
% @values medium_mellow_carves=Medium_sized_mellow_carves_not_aggressive unk_carving_rating_tgr=Unknown
% @importance 0.85

0.63::true_val(carving_rating_tgr, medium_mellow_carves); 0.37::true_val(carving_rating_tgr, unk_carving_rating_tgr).

0.82::acc(s29, carving_rating_tgr).

measured(s29, carving_rating_tgr, medium_mellow_carves).

all_consistent(carving_rating_tgr) :- consistent(s29, carving_rating_tgr).

evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, medium_mellow_carves)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

% @attr negative_aspect_carve_washout
% @type categorical
% @canonical false
% @original_name negative_aspect (carve washout)
% @values can_wash_out=Can_wash_out_under_aggressive_riding unk_negative_aspect_carve_washout=Unknown
% @importance 0.9

0.64::true_val(negative_aspect_carve_washout, can_wash_out); 0.36::true_val(negative_aspect_carve_washout, unk_negative_aspect_carve_washout).

0.84::acc(s29, negative_aspect_carve_washout).

measured(s29, negative_aspect_carve_washout, can_wash_out).

all_consistent(negative_aspect_carve_washout) :- consistent(s29, negative_aspect_carve_washout).

evidence(all_consistent(negative_aspect_carve_washout)).
query(true_val(negative_aspect_carve_washout, can_wash_out)).
query(true_val(negative_aspect_carve_washout, unk_negative_aspect_carve_washout)).

% @attr positive_aspect_park
% @type categorical
% @canonical false
% @original_name positive_aspect (park)
% @values excellent_park=Excellent_for_park_jibs_and_jumps unk_positive_aspect_park=Unknown
% @importance 0.85

0.63::true_val(positive_aspect_park, excellent_park); 0.37::true_val(positive_aspect_park, unk_positive_aspect_park).

0.82::acc(s29, positive_aspect_park).

measured(s29, positive_aspect_park, excellent_park).

all_consistent(positive_aspect_park) :- consistent(s29, positive_aspect_park).

evidence(all_consistent(positive_aspect_park)).
query(true_val(positive_aspect_park, excellent_park)).
query(true_val(positive_aspect_park, unk_positive_aspect_park)).

% @attr positive_aspect_landing
% @type categorical
% @canonical false
% @original_name positive_aspect (landing)
% @values wide_stable_landings=Wide_platform_easier_more_stable_landings unk_positive_aspect_landing=Unknown
% @importance 0.85

0.63::true_val(positive_aspect_landing, wide_stable_landings); 0.37::true_val(positive_aspect_landing, unk_positive_aspect_landing).

0.82::acc(s29, positive_aspect_landing).

measured(s29, positive_aspect_landing, wide_stable_landings).

all_consistent(positive_aspect_landing) :- consistent(s29, positive_aspect_landing).

evidence(all_consistent(positive_aspect_landing)).
query(true_val(positive_aspect_landing, wide_stable_landings)).
query(true_val(positive_aspect_landing, unk_positive_aspect_landing)).

% @attr positive_aspect_trees
% @type categorical
% @canonical false
% @original_name positive_aspect (trees)
% @values short_tight_carves_trees=Short_tight_carves_for_tree_runs unk_positive_aspect_trees=Unknown
% @importance 0.85

0.63::true_val(positive_aspect_trees, short_tight_carves_trees); 0.37::true_val(positive_aspect_trees, unk_positive_aspect_trees).

0.82::acc(s29, positive_aspect_trees).

measured(s29, positive_aspect_trees, short_tight_carves_trees).

all_consistent(positive_aspect_trees) :- consistent(s29, positive_aspect_trees).

evidence(all_consistent(positive_aspect_trees)).
query(true_val(positive_aspect_trees, short_tight_carves_trees)).
query(true_val(positive_aspect_trees, unk_positive_aspect_trees)).

% @attr positive_aspect_pop_features
% @type categorical
% @canonical false
% @original_name positive_aspect (pop and control)
% @values quick_pop_control=Quick_pop_and_control_natural_features unk_positive_aspect_pop_features=Unknown
% @importance 0.6

0.48::true_val(positive_aspect_pop_features, quick_pop_control); 0.52::true_val(positive_aspect_pop_features, unk_positive_aspect_pop_features).

0.75::acc(s23, positive_aspect_pop_features).

measured(s23, positive_aspect_pop_features, quick_pop_control).

all_consistent(positive_aspect_pop_features) :- consistent(s23, positive_aspect_pop_features).

evidence(all_consistent(positive_aspect_pop_features)).
query(true_val(positive_aspect_pop_features, quick_pop_control)).
query(true_val(positive_aspect_pop_features, unk_positive_aspect_pop_features)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect (hard/icy conditions)
% @values not_ideal_hard_icy=Not_ideal_for_hard_icy_conditions unk_negative_aspect=Unknown
% @importance 0.8

0.51::true_val(negative_aspect, not_ideal_hard_icy); 0.49::true_val(negative_aspect, unk_negative_aspect).

0.78::acc(s38, negative_aspect).

measured(s38, negative_aspect, not_ideal_hard_icy).

all_consistent(negative_aspect) :- consistent(s38, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, not_ideal_hard_icy)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_butter
% @type categorical
% @canonical false
% @original_name negative_aspect (butter/press)
% @values too_stiff_for_butter=Too_stiff_for_press_and_butter unk_negative_aspect_butter=Unknown
% @importance 0.8

0.57::true_val(negative_aspect_butter, too_stiff_for_butter); 0.43::true_val(negative_aspect_butter, unk_negative_aspect_butter).

0.80::acc(s39, negative_aspect_butter).

measured(s39, negative_aspect_butter, too_stiff_for_butter).

all_consistent(negative_aspect_butter) :- consistent(s39, negative_aspect_butter).

evidence(all_consistent(negative_aspect_butter)).
query(true_val(negative_aspect_butter, too_stiff_for_butter)).
query(true_val(negative_aspect_butter, unk_negative_aspect_butter)).

% @attr overall_rating_snowboardingprofiles
% @type numeric
% @canonical true
% @original_name overall_rating_snowboardingprofiles
% @unit /5
% @values v4_2=4.2 unk_overall_rating_snowboardingprofiles=Unknown
% @importance 0.85

0.63::true_val(overall_rating_snowboardingprofiles, v4_2); 0.37::true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles).

0.82::acc(s29, overall_rating_snowboardingprofiles).

measured(s29, overall_rating_snowboardingprofiles, v4_2).

all_consistent(overall_rating_snowboardingprofiles) :- consistent(s29, overall_rating_snowboardingprofiles).

evidence(all_consistent(overall_rating_snowboardingprofiles)).
query(true_val(overall_rating_snowboardingprofiles, v4_2)).
query(true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles)).

% @attr overall_rating_snowboardingprofiles_ranking
% @type categorical
% @canonical false
% @original_name overall_rating_snowboardingprofiles (ranking)
% @values rank_31_of_38=31st_of_38_all_mountain unk_overall_rating_snowboardingprofiles_ranking=Unknown
% @importance 0.85

0.63::true_val(overall_rating_snowboardingprofiles_ranking, rank_31_of_38); 0.37::true_val(overall_rating_snowboardingprofiles_ranking, unk_overall_rating_snowboardingprofiles_ranking).

0.82::acc(s29, overall_rating_snowboardingprofiles_ranking).

measured(s29, overall_rating_snowboardingprofiles_ranking, rank_31_of_38).

all_consistent(overall_rating_snowboardingprofiles_ranking) :- consistent(s29, overall_rating_snowboardingprofiles_ranking).

evidence(all_consistent(overall_rating_snowboardingprofiles_ranking)).
query(true_val(overall_rating_snowboardingprofiles_ranking, rank_31_of_38)).
query(true_val(overall_rating_snowboardingprofiles_ranking, unk_overall_rating_snowboardingprofiles_ranking)).

% @attr snowboard_selector_verdict
% @type categorical
% @canonical false
% @original_name Snowboard Selector verdict
% @values versatile_jack_of_all_trades=Versatile_jack_of_all_trades_comfortable_middle_price unk_snowboard_selector_verdict=Unknown
% @importance 0.75

0.49::true_val(snowboard_selector_verdict, versatile_jack_of_all_trades); 0.51::true_val(snowboard_selector_verdict, unk_snowboard_selector_verdict).

0.75::acc(s38, snowboard_selector_verdict).

measured(s38, snowboard_selector_verdict, versatile_jack_of_all_trades).

all_consistent(snowboard_selector_verdict) :- consistent(s38, snowboard_selector_verdict).

evidence(all_consistent(snowboard_selector_verdict)).
query(true_val(snowboard_selector_verdict, versatile_jack_of_all_trades)).
query(true_val(snowboard_selector_verdict, unk_snowboard_selector_verdict)).

% @attr mountain_weekly_verdict
% @type categorical
% @canonical false
% @original_name Mountain Weekly News verdict
% @values revelation_deep_powder=A_revelation_lively_responsive_playful unk_mountain_weekly_verdict=Unknown
% @importance 0.7

0.58::true_val(mountain_weekly_verdict, revelation_deep_powder); 0.42::true_val(mountain_weekly_verdict, unk_mountain_weekly_verdict).

0.78::acc(s36, mountain_weekly_verdict).

measured(s36, mountain_weekly_verdict, revelation_deep_powder).

all_consistent(mountain_weekly_verdict) :- consistent(s36, mountain_weekly_verdict).

evidence(all_consistent(mountain_weekly_verdict)).
query(true_val(mountain_weekly_verdict, revelation_deep_powder)).
query(true_val(mountain_weekly_verdict, unk_mountain_weekly_verdict)).

% @attr snow_chasers_verdict
% @type categorical
% @canonical false
% @original_name The Snow Chasers verdict
% @values most_fun_board=Still_one_of_the_most_fun_boards unk_snow_chasers_verdict=Unknown
% @importance 0.8

0.57::true_val(snow_chasers_verdict, most_fun_board); 0.43::true_val(snow_chasers_verdict, unk_snow_chasers_verdict).

0.78::acc(s39, snow_chasers_verdict).

measured(s39, snow_chasers_verdict, most_fun_board).

all_consistent(snow_chasers_verdict) :- consistent(s39, snow_chasers_verdict).

evidence(all_consistent(snow_chasers_verdict)).
query(true_val(snow_chasers_verdict, most_fun_board)).
query(true_val(snow_chasers_verdict, unk_snow_chasers_verdict)).

% @attr snowboard_robot_verdict
% @type categorical
% @canonical false
% @original_name Snowboard Robot verdict
% @values surprise_board_very_impressed=Surprise_board_very_impressed_bought_one unk_snowboard_robot_verdict=Unknown
% @importance 0.85

0.65::true_val(snowboard_robot_verdict, surprise_board_very_impressed); 0.35::true_val(snowboard_robot_verdict, unk_snowboard_robot_verdict).

0.84::acc(s28, snowboard_robot_verdict).

measured(s28, snowboard_robot_verdict, surprise_board_very_impressed).

all_consistent(snowboard_robot_verdict) :- consistent(s28, snowboard_robot_verdict).

evidence(all_consistent(snowboard_robot_verdict)).
query(true_val(snowboard_robot_verdict, surprise_board_very_impressed)).
query(true_val(snowboard_robot_verdict, unk_snowboard_robot_verdict)).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name reviewer_opinion_snowboardingprofiles
% @values not_as_impressed=Not_as_impressed_great_in_powder_less_outside unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.75

0.60::true_val(reviewer_opinion_snowboardingprofiles, not_as_impressed); 0.40::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).

0.80::acc(s42, reviewer_opinion_snowboardingprofiles).

measured(s42, reviewer_opinion_snowboardingprofiles, not_as_impressed).

all_consistent(reviewer_opinion_snowboardingprofiles) :- consistent(s42, reviewer_opinion_snowboardingprofiles).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, not_as_impressed)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

% @attr curated_comparison_verdict
% @type categorical
% @canonical false
% @original_name Curated comparison verdict
% @values warpig_won_carving=Warpig_won_carving_vs_Orca_and_Warca unk_curated_comparison_verdict=Unknown
% @importance 0.85

0.56::true_val(curated_comparison_verdict, warpig_won_carving); 0.44::true_val(curated_comparison_verdict, unk_curated_comparison_verdict).

0.78::acc(s43, curated_comparison_verdict).

measured(s43, curated_comparison_verdict, warpig_won_carving).

all_consistent(curated_comparison_verdict) :- consistent(s43, curated_comparison_verdict).

evidence(all_consistent(curated_comparison_verdict)).
query(true_val(curated_comparison_verdict, warpig_won_carving)).
query(true_val(curated_comparison_verdict, unk_curated_comparison_verdict)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values universally_positive=Universally_positive_ripper_light_poppy unk_user_review_forum=Unknown
% @importance 0.65

0.34::true_val(user_review_forum, universally_positive); 0.66::true_val(user_review_forum, unk_user_review_forum).

0.55::acc(s44, user_review_forum).

measured(s44, user_review_forum, universally_positive).

all_consistent(user_review_forum) :- consistent(s44, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, universally_positive)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr award_history
% @type categorical
% @canonical false
% @original_name Award history
% @values won_multiple_tests=Won_multiple_snowboard_tests_all_mtn_and_freestyle unk_award_history=Unknown
% @importance 1.0

0.87::true_val(award_history, won_multiple_tests); 0.13::true_val(award_history, unk_award_history).

0.90::acc(s1, award_history).

measured(s1, award_history, won_multiple_tests).

all_consistent(award_history) :- consistent(s1, award_history).

evidence(all_consistent(award_history)).
query(true_val(award_history, won_multiple_tests)).
query(true_val(award_history, unk_award_history)).

% @attr negative_aspect_topsheet
% @type categorical
% @canonical false
% @original_name negative_aspect (topsheet durability)
% @values topsheet_durability_concern=Topsheet_durability_concerns_Topless_construction unk_negative_aspect_topsheet=Unknown
% @importance 0.75

0.49::true_val(negative_aspect_topsheet, topsheet_durability_concern); 0.51::true_val(negative_aspect_topsheet, unk_negative_aspect_topsheet).

0.75::acc(s38, negative_aspect_topsheet).

measured(s38, negative_aspect_topsheet, topsheet_durability_concern).

all_consistent(negative_aspect_topsheet) :- consistent(s38, negative_aspect_topsheet).

evidence(all_consistent(negative_aspect_topsheet)).
query(true_val(negative_aspect_topsheet, topsheet_durability_concern)).
query(true_val(negative_aspect_topsheet, unk_negative_aspect_topsheet)).

% @attr negative_aspect_boot_overhang
% @type categorical
% @canonical false
% @original_name negative_aspect (boot overhang)
% @values boot_overhang_small_feet=Boot_overhang_below_UK10_5 unk_negative_aspect_boot_overhang=Unknown
% @importance 0.7

0.64::true_val(negative_aspect_boot_overhang, boot_overhang_small_feet); 0.36::true_val(negative_aspect_boot_overhang, unk_negative_aspect_boot_overhang).

0.82::acc(s4, negative_aspect_boot_overhang).

measured(s4, negative_aspect_boot_overhang, boot_overhang_small_feet).

all_consistent(negative_aspect_boot_overhang) :- consistent(s4, negative_aspect_boot_overhang).

evidence(all_consistent(negative_aspect_boot_overhang)).
query(true_val(negative_aspect_boot_overhang, boot_overhang_small_feet)).
query(true_val(negative_aspect_boot_overhang, unk_negative_aspect_boot_overhang)).

% @attr negative_aspect_powder_limit
% @type categorical
% @canonical false
% @original_name negative_aspect (not true powder board)
% @values not_true_powder_board=Not_a_true_powder_board_dedicated_better unk_negative_aspect_powder_limit=Unknown
% @importance 0.75

0.49::true_val(negative_aspect_powder_limit, not_true_powder_board); 0.51::true_val(negative_aspect_powder_limit, unk_negative_aspect_powder_limit).

0.75::acc(s38, negative_aspect_powder_limit).

measured(s38, negative_aspect_powder_limit, not_true_powder_board).

all_consistent(negative_aspect_powder_limit) :- consistent(s38, negative_aspect_powder_limit).

evidence(all_consistent(negative_aspect_powder_limit)).
query(true_val(negative_aspect_powder_limit, not_true_powder_board)).
query(true_val(negative_aspect_powder_limit, unk_negative_aspect_powder_limit)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand (Lib Tech Orca)
% @values lib_tech_orca=Lib_Tech_Orca_better_edge_hold_less_park unk_comparable_board_cross_brand=Unknown
% @importance 0.85

0.63::true_val(comparable_board_cross_brand, lib_tech_orca); 0.37::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

0.82::acc(s29, comparable_board_cross_brand).

measured(s29, comparable_board_cross_brand, lib_tech_orca).

all_consistent(comparable_board_cross_brand) :- consistent(s29, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, lib_tech_orca)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_warca
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Yes Warca)
% @values yes_warca=Yes_Warca_true_camber_better_carving unk_comparable_board_cross_brand_warca=Unknown
% @importance 0.85

0.56::true_val(comparable_board_cross_brand_warca, yes_warca); 0.44::true_val(comparable_board_cross_brand_warca, unk_comparable_board_cross_brand_warca).

0.78::acc(s43, comparable_board_cross_brand_warca).

measured(s43, comparable_board_cross_brand_warca, yes_warca).

all_consistent(comparable_board_cross_brand_warca) :- consistent(s43, comparable_board_cross_brand_warca).

evidence(all_consistent(comparable_board_cross_brand_warca)).
query(true_val(comparable_board_cross_brand_warca, yes_warca)).
query(true_val(comparable_board_cross_brand_warca, unk_comparable_board_cross_brand_warca)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand (Ride Superpig)
% @values ride_superpig=Ride_Superpig_stiffer_more_camber_faster_base unk_comparable_board_same_brand=Unknown
% @importance 0.8

0.51::true_val(comparable_board_same_brand, ride_superpig); 0.49::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

0.75::acc(s47, comparable_board_same_brand).

measured(s47, comparable_board_same_brand, ride_superpig).

all_consistent(comparable_board_same_brand) :- consistent(s47, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, ride_superpig)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_twinpig
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Ride Twinpig)
% @values ride_twinpig=Ride_Twinpig_twin_version_more_freestyle unk_comparable_board_same_brand_twinpig=Unknown
% @importance 0.65

0.81::true_val(comparable_board_same_brand_twinpig, ride_twinpig); 0.19::true_val(comparable_board_same_brand_twinpig, unk_comparable_board_same_brand_twinpig).

0.88::acc(s48, comparable_board_same_brand_twinpig).

measured(s48, comparable_board_same_brand_twinpig, ride_twinpig).

all_consistent(comparable_board_same_brand_twinpig) :- consistent(s48, comparable_board_same_brand_twinpig).

evidence(all_consistent(comparable_board_same_brand_twinpig)).
query(true_val(comparable_board_same_brand_twinpig, ride_twinpig)).
query(true_val(comparable_board_same_brand_twinpig, unk_comparable_board_same_brand_twinpig)).

% @attr comparable_board_same_brand_moderator
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Ride Moderator)
% @values ride_moderator=Ride_Moderator_between_Warpig_and_Superpig unk_comparable_board_same_brand_moderator=Unknown
% @importance 0.85

0.63::true_val(comparable_board_same_brand_moderator, ride_moderator); 0.37::true_val(comparable_board_same_brand_moderator, unk_comparable_board_same_brand_moderator).

0.82::acc(s29, comparable_board_same_brand_moderator).

measured(s29, comparable_board_same_brand_moderator, ride_moderator).

all_consistent(comparable_board_same_brand_moderator) :- consistent(s29, comparable_board_same_brand_moderator).

evidence(all_consistent(comparable_board_same_brand_moderator)).
query(true_val(comparable_board_same_brand_moderator, ride_moderator)).
query(true_val(comparable_board_same_brand_moderator, unk_comparable_board_same_brand_moderator)).

% @attr comparable_board_cross_brand_slush_slasher
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Capita Slush Slasher)
% @values capita_slush_slasher=Capita_Slush_Slasher_cheaper_less_fun unk_comparable_board_cross_brand_slush_slasher=Unknown
% @importance 0.85

0.65::true_val(comparable_board_cross_brand_slush_slasher, capita_slush_slasher); 0.35::true_val(comparable_board_cross_brand_slush_slasher, unk_comparable_board_cross_brand_slush_slasher).

0.84::acc(s28, comparable_board_cross_brand_slush_slasher).

measured(s28, comparable_board_cross_brand_slush_slasher, capita_slush_slasher).

all_consistent(comparable_board_cross_brand_slush_slasher) :- consistent(s28, comparable_board_cross_brand_slush_slasher).

evidence(all_consistent(comparable_board_cross_brand_slush_slasher)).
query(true_val(comparable_board_cross_brand_slush_slasher, capita_slush_slasher)).
query(true_val(comparable_board_cross_brand_slush_slasher, unk_comparable_board_cross_brand_slush_slasher)).

% @attr volume_shifted_pioneer
% @type categorical
% @canonical false
% @original_name Volume-shifted category pioneer
% @values one_of_first_popular=One_of_first_volume_shift_boards_to_become_popular unk_volume_shifted_pioneer=Unknown
% @importance 0.85

0.65::true_val(volume_shifted_pioneer, one_of_first_popular); 0.35::true_val(volume_shifted_pioneer, unk_volume_shifted_pioneer).

0.84::acc(s28, volume_shifted_pioneer).

measured(s28, volume_shifted_pioneer, one_of_first_popular).

all_consistent(volume_shifted_pioneer) :- consistent(s28, volume_shifted_pioneer).

evidence(all_consistent(volume_shifted_pioneer)).
query(true_val(volume_shifted_pioneer, one_of_first_popular)).
query(true_val(volume_shifted_pioneer, unk_volume_shifted_pioneer)).

% @attr ride_reputation
% @type categorical
% @canonical false
% @original_name Ride Snowboards reputation
% @values established_durable_slimewall=Established_1992_durable_Slimewall_practical unk_ride_reputation=Unknown
% @importance 0.7

0.60::true_val(ride_reputation, established_durable_slimewall); 0.40::true_val(ride_reputation, unk_ride_reputation).

0.78::acc(s18, ride_reputation).

measured(s18, ride_reputation, established_durable_slimewall).

all_consistent(ride_reputation) :- consistent(s18, ride_reputation).

evidence(all_consistent(ride_reputation)).
query(true_val(ride_reputation, established_durable_slimewall)).
query(true_val(ride_reputation, unk_ride_reputation)).

% @attr evo_reputation
% @type categorical
% @canonical false
% @original_name evo.com reputation
% @values major_us_retailer=Major_US_retailer_lowest_price_guarantee unk_evo_reputation=Unknown
% @importance 0.9

0.68::true_val(evo_reputation, major_us_retailer); 0.32::true_val(evo_reputation, unk_evo_reputation).

0.82::acc(s12, evo_reputation).

measured(s12, evo_reputation, major_us_retailer).

all_consistent(evo_reputation) :- consistent(s12, evo_reputation).

evidence(all_consistent(evo_reputation)).
query(true_val(evo_reputation, major_us_retailer)).
query(true_val(evo_reputation, unk_evo_reputation)).

% @attr tactics_reputation
% @type categorical
% @canonical false
% @original_name Tactics.com reputation
% @values established_us_shop=Established_US_board_shop_low_price_guarantee unk_tactics_reputation=Unknown
% @importance 0.7

0.68::true_val(tactics_reputation, established_us_shop); 0.32::true_val(tactics_reputation, unk_tactics_reputation).

0.80::acc(s3, tactics_reputation).

measured(s3, tactics_reputation, established_us_shop).

all_consistent(tactics_reputation) :- consistent(s3, tactics_reputation).

evidence(all_consistent(tactics_reputation)).
query(true_val(tactics_reputation, established_us_shop)).
query(true_val(tactics_reputation, unk_tactics_reputation)).

% @attr ballistyx_reputation
% @type categorical
% @canonical false
% @original_name Ballistyx reputation
% @values au_specialist_rider_run=Australian_specialist_rider_run_expert_advice unk_ballistyx_reputation=Unknown
% @importance 0.7

0.60::true_val(ballistyx_reputation, au_specialist_rider_run); 0.40::true_val(ballistyx_reputation, unk_ballistyx_reputation).

0.78::acc(s18, ballistyx_reputation).

measured(s18, ballistyx_reputation, au_specialist_rider_run).

all_consistent(ballistyx_reputation) :- consistent(s18, ballistyx_reputation).

evidence(all_consistent(ballistyx_reputation)).
query(true_val(ballistyx_reputation, au_specialist_rider_run)).
query(true_val(ballistyx_reputation, unk_ballistyx_reputation)).

% @attr auski_reputation
% @type categorical
% @canonical false
% @original_name Auski reputation
% @values established_au_outdoor=Established_AU_outdoor_retailer_free_shipping unk_auski_reputation=Unknown
% @importance 0.7

0.55::true_val(auski_reputation, established_au_outdoor); 0.45::true_val(auski_reputation, unk_auski_reputation).

0.78::acc(s17, auski_reputation).

measured(s17, auski_reputation, established_au_outdoor).

all_consistent(auski_reputation) :- consistent(s17, auski_reputation).

evidence(all_consistent(auski_reputation)).
query(true_val(auski_reputation, established_au_outdoor)).
query(true_val(auski_reputation, unk_auski_reputation)).

% @attr s2as_reputation
% @type categorical
% @canonical false
% @original_name S2AS reputation
% @values uk_rider_run_shop=UK_rider_run_shop_aftercare_setup unk_s2as_reputation=Unknown
% @importance 0.6

0.48::true_val(s2as_reputation, uk_rider_run_shop); 0.52::true_val(s2as_reputation, unk_s2as_reputation).

0.75::acc(s23, s2as_reputation).

measured(s23, s2as_reputation, uk_rider_run_shop).

all_consistent(s2as_reputation) :- consistent(s23, s2as_reputation).

evidence(all_consistent(s2as_reputation)).
query(true_val(s2as_reputation, uk_rider_run_shop)).
query(true_val(s2as_reputation, unk_s2as_reputation)).

% @attr price_usd_evo_2025_msrp
% @type numeric
% @canonical false
% @original_name price_usd_evo (2025 MSRP)
% @unit USD
% @values v549_95=549.95 unk_price_usd_evo_2025_msrp=Unknown
% @importance 0.7

0.68::true_val(price_usd_evo_2025_msrp, v549_95); 0.32::true_val(price_usd_evo_2025_msrp, unk_price_usd_evo_2025_msrp).

0.90::acc(s13, price_usd_evo_2025_msrp).

measured(s13, price_usd_evo_2025_msrp, v549_95).

all_consistent(price_usd_evo_2025_msrp) :- consistent(s13, price_usd_evo_2025_msrp).

evidence(all_consistent(price_usd_evo_2025_msrp)).
query(true_val(price_usd_evo_2025_msrp, v549_95)).
query(true_val(price_usd_evo_2025_msrp, unk_price_usd_evo_2025_msrp)).

% @attr price_usd_evo_msrp
% @type numeric
% @canonical false
% @original_name price_usd_evo (2026 MSRP)
% @unit USD
% @values v599_95=599.95 unk_price_usd_evo_msrp=Unknown
% @importance 0.9

0.68::true_val(price_usd_evo_msrp, v599_95); 0.32::true_val(price_usd_evo_msrp, unk_price_usd_evo_msrp).

0.92::acc(s12, price_usd_evo_msrp).

measured(s12, price_usd_evo_msrp, v599_95).

all_consistent(price_usd_evo_msrp) :- consistent(s12, price_usd_evo_msrp).

evidence(all_consistent(price_usd_evo_msrp)).
query(true_val(price_usd_evo_msrp, v599_95)).
query(true_val(price_usd_evo_msrp, unk_price_usd_evo_msrp)).

% @attr price_trend
% @type categorical
% @canonical false
% @original_name Price trend
% @values increased_9pct_yoy=Increased_549_95_to_599_95_approx_9pct_yoy unk_price_trend=Unknown
% @importance 0.8

0.95::true_val(price_trend, increased_9pct_yoy); 0.05::true_val(price_trend, unk_price_trend).

0.88::acc(s12, price_trend).
0.88::acc(s13, price_trend).

measured(s12, price_trend, increased_9pct_yoy).
measured(s13, price_trend, increased_9pct_yoy).

all_consistent(price_trend) :-
    consistent(s12, price_trend),
    consistent(s13, price_trend).

evidence(all_consistent(price_trend)).
query(true_val(price_trend, increased_9pct_yoy)).
query(true_val(price_trend, unk_price_trend)).

% @attr design_concept
% @type categorical
% @canonical false
% @original_name Design concept
% @values volume_shifted=Volume_shifted_reduces_length_adds_width unk_design_concept=Unknown
% @importance 0.85

0.63::true_val(design_concept, volume_shifted); 0.37::true_val(design_concept, unk_design_concept).

0.82::acc(s28, design_concept).

measured(s28, design_concept, volume_shifted).

all_consistent(design_concept) :- consistent(s28, design_concept).

evidence(all_consistent(design_concept)).
query(true_val(design_concept, volume_shifted)).
query(true_val(design_concept, unk_design_concept)).

% @attr best_use_case
% @type categorical
% @canonical false
% @original_name Best use case
% @values one_board_quiver=One_board_quiver_powder_park_groomers unk_best_use_case=Unknown
% @importance 0.9

0.67::true_val(best_use_case, one_board_quiver); 0.33::true_val(best_use_case, unk_best_use_case).

0.82::acc(s29, best_use_case).

measured(s29, best_use_case, one_board_quiver).

all_consistent(best_use_case) :- consistent(s29, best_use_case).

evidence(all_consistent(best_use_case)).
query(true_val(best_use_case, one_board_quiver)).
query(true_val(best_use_case, unk_best_use_case)).

% @attr not_ideal_for
% @type categorical
% @canonical false
% @original_name Not ideal for
% @values aggressive_carvers_moguls_ice_butter=Not_for_aggressive_carvers_moguls_ice_butter unk_not_ideal_for=Unknown
% @importance 0.825

0.95::true_val(not_ideal_for, aggressive_carvers_moguls_ice_butter); 0.05::true_val(not_ideal_for, unk_not_ideal_for).

0.82::acc(s29, not_ideal_for).
0.80::acc(s39, not_ideal_for).

measured(s29, not_ideal_for, aggressive_carvers_moguls_ice_butter).
measured(s39, not_ideal_for, aggressive_carvers_moguls_ice_butter).

all_consistent(not_ideal_for) :-
    consistent(s29, not_ideal_for),
    consistent(s39, not_ideal_for).

evidence(all_consistent(not_ideal_for)).
query(true_val(not_ideal_for, aggressive_carvers_moguls_ice_butter)).
query(true_val(not_ideal_for, unk_not_ideal_for)).