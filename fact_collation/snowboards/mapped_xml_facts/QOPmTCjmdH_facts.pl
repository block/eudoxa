0.20::indep(s2).
0.10::indep(s8).
0.15::indep(s16).
0.15::indep(s17).
0.20::indep(s20).
0.25::indep(s34).
0.30::indep(s41).
0.15::indep(s42).
0.15::indep(s44).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values ride_snowboards=Ride_Snowboards unk_brand=Unknown
% @importance 1.0

0.93::acc(s1, brand).

0.95::true_val(brand, ride_snowboards); 0.05::true_val(brand, unk_brand).

measured(s1, brand, ride_snowboards).

all_consistent(brand) :- consistent(s1, brand).

evidence(all_consistent(brand)).
query(true_val(brand, ride_snowboards)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values psychocandy=Psychocandy unk_model_name=Unknown
% @importance 1.0

0.93::acc(s1, model_name).

0.95::true_val(model_name, psychocandy); 0.05::true_val(model_name, unk_model_name).

measured(s1, model_name, psychocandy).

all_consistent(model_name) :- consistent(s1, model_name).

evidence(all_consistent(model_name)).
query(true_val(model_name, psychocandy)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2027=2027 unk_model_year=Unknown
% @importance 1.0

0.82::acc(s2, model_year).

0.81::true_val(model_year, y2027); 0.19::true_val(model_year, unk_model_year).

measured(s2, model_year, y2027).

all_consistent(model_year) :- consistent(s2, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2027)).
query(true_val(model_year, unk_model_year)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.93::acc(s1, product_type).

0.95::true_val(product_type, snowboard); 0.05::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).

all_consistent(product_type) :- consistent(s1, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values elevate_outdoor_collective=Elevate_Outdoor_Collective unk_manufacturer=Unknown
% @importance 0.425

0.80::acc(s3, manufacturer).
0.55::acc(s52, manufacturer).

0.95::true_val(manufacturer, elevate_outdoor_collective); 0.05::true_val(manufacturer, unk_manufacturer).

measured(s3, manufacturer, elevate_outdoor_collective).
measured(s52, manufacturer, elevate_outdoor_collective).

all_consistent(manufacturer) :- consistent(s3, manufacturer), consistent(s52, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, elevate_outdoor_collective)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr brand_founding_year
% @type categorical
% @canonical false
% @original_name Brand founding year
% @values y1992=1992 unk_brand_founding_year=Unknown
% @importance 0.35

0.65::acc(s4, brand_founding_year).

0.63::true_val(brand_founding_year, y1992); 0.37::true_val(brand_founding_year, unk_brand_founding_year).

measured(s4, brand_founding_year, y1992).

all_consistent(brand_founding_year) :- consistent(s4, brand_founding_year).

evidence(all_consistent(brand_founding_year)).
query(true_val(brand_founding_year, y1992)).
query(true_val(brand_founding_year, unk_brand_founding_year)).

% @attr brand_headquarters
% @type categorical
% @canonical false
% @original_name Brand headquarters
% @values seattle_wa=Seattle_WA unk_brand_headquarters=Unknown
% @importance 0.3

0.88::acc(s5, brand_headquarters).

0.81::true_val(brand_headquarters, seattle_wa); 0.19::true_val(brand_headquarters, unk_brand_headquarters).

measured(s5, brand_headquarters, seattle_wa).

all_consistent(brand_headquarters) :- consistent(s5, brand_headquarters).

evidence(all_consistent(brand_headquarters)).
query(true_val(brand_headquarters, seattle_wa)).
query(true_val(brand_headquarters, unk_brand_headquarters)).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values china_guangzhou=China_Guangzhou unk_manufacturing_location=Unknown
% @importance 0.55

0.60::acc(s6, manufacturing_location).

0.57::true_val(manufacturing_location, china_guangzhou); 0.43::true_val(manufacturing_location, unk_manufacturing_location).

measured(s6, manufacturing_location, china_guangzhou).

all_consistent(manufacturing_location) :- consistent(s6, manufacturing_location).

evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, china_guangzhou)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values solar_44_pct=44pct_sustainable_solar_energy unk_sustainability_certification=Unknown
% @importance 0.7

0.88::acc(s7, sustainability_certification).

0.86::true_val(sustainability_certification, solar_44_pct); 0.14::true_val(sustainability_certification, unk_sustainability_certification).

measured(s7, sustainability_certification, solar_44_pct).

all_consistent(sustainability_certification) :- consistent(s7, sustainability_certification).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, solar_44_pct)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr brand_experience
% @type categorical
% @canonical false
% @original_name Brand experience
% @values over_30_years=Over_30_years unk_brand_experience=Unknown
% @importance 0.25

0.55::acc(s8, brand_experience).

0.51::true_val(brand_experience, over_30_years); 0.49::true_val(brand_experience, unk_brand_experience).

measured(s8, brand_experience, over_30_years).

all_consistent(brand_experience) :- consistent(s8, brand_experience).

evidence(all_consistent(brand_experience)).
query(true_val(brand_experience, over_30_years)).
query(true_val(brand_experience, unk_brand_experience)).

% @attr design_inspiration
% @type categorical
% @canonical false
% @original_name Design inspiration
% @values warpig_volume_shifted=Inspired_by_Warpig_short_wide_volume_shifted unk_design_inspiration=Unknown
% @importance 0.9

0.88::acc(s9, design_inspiration).

0.86::true_val(design_inspiration, warpig_volume_shifted); 0.14::true_val(design_inspiration, unk_design_inspiration).

measured(s9, design_inspiration, warpig_volume_shifted).

all_consistent(design_inspiration) :- consistent(s9, design_inspiration).

evidence(all_consistent(design_inspiration)).
query(true_val(design_inspiration, warpig_volume_shifted)).
query(true_val(design_inspiration, unk_design_inspiration)).

% @attr model_series
% @type categorical
% @canonical false
% @original_name Model series
% @values pig_family=Ride_Pig_family unk_model_series=Unknown
% @importance 0.6

0.70::acc(s10, model_series).

0.64::true_val(model_series, pig_family); 0.36::true_val(model_series, unk_model_series).

measured(s10, model_series, pig_family).

all_consistent(model_series) :- consistent(s10, model_series).

evidence(all_consistent(model_series)).
query(true_val(model_series, pig_family)).
query(true_val(model_series, unk_model_series)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2019_2020=2019-2020_season unk_model_first_available_year=Unknown
% @importance 0.45

0.78::acc(s11, model_first_available_year).

0.76::true_val(model_first_available_year, season_2019_2020); 0.24::true_val(model_first_available_year, unk_model_first_available_year).

measured(s11, model_first_available_year, season_2019_2020).

all_consistent(model_first_available_year) :- consistent(s11, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2019_2020)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr transition_to_unisex
% @type categorical
% @canonical false
% @original_name Transition to unisex
% @values unisex_directional=Now_unisex_directional unk_transition_to_unisex=Unknown
% @importance 0.7

0.72::acc(s12, transition_to_unisex).

0.71::true_val(transition_to_unisex, unisex_directional); 0.29::true_val(transition_to_unisex, unk_transition_to_unisex).

measured(s12, transition_to_unisex, unisex_directional).

all_consistent(transition_to_unisex) :- consistent(s12, transition_to_unisex).

evidence(all_consistent(transition_to_unisex)).
query(true_val(transition_to_unisex, unisex_directional)).
query(true_val(transition_to_unisex, unk_transition_to_unisex)).

% @attr redesign_year
% @type categorical
% @canonical true
% @original_name redesign_year
% @values y2023_2024_topsheet_tweak=2023-2024_topsheet_tweak refined_volume_sizing=Refined_volume_shifted_sizing_new_graphics
% @importance 0.65

0.72::acc(s13, redesign_year).
0.62::acc(s14, redesign_year).

0.55::true_val(redesign_year, y2023_2024_topsheet_tweak); 0.45::true_val(redesign_year, refined_volume_sizing).

measured(s13, redesign_year, y2023_2024_topsheet_tweak).
measured(s14, redesign_year, refined_volume_sizing).

all_consistent(redesign_year) :- consistent(s13, redesign_year), consistent(s14, redesign_year).

evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, y2023_2024_topsheet_tweak)).
query(true_val(redesign_year, refined_volume_sizing)).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values hellcat_warpig=Ride_Hellcat_mixed_with_Warpig_DNA unk_predecessor_model_name=Unknown
% @importance 0.35

0.70::acc(s15, predecessor_model_name).

0.68::true_val(predecessor_model_name, hellcat_warpig); 0.32::true_val(predecessor_model_name, unk_predecessor_model_name).

measured(s15, predecessor_model_name, hellcat_warpig).

all_consistent(predecessor_model_name) :- consistent(s15, predecessor_model_name).

evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, hellcat_warpig)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).

% @attr price_aud_merchant
% @type numeric
% @canonical true
% @original_name price_aud_merchant
% @unit AUD
% @values v949_99=949.99 unk_price_aud_merchant=Unknown
% @importance 1.0

0.82::acc(s2, price_aud_merchant).

0.81::true_val(price_aud_merchant, v949_99); 0.19::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s2, price_aud_merchant, v949_99).

all_consistent(price_aud_merchant) :- consistent(s2, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v949_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr estimated_availability_date
% @type categorical
% @canonical true
% @original_name estimated_availability_date
% @values may_2026=Preorder_est_May_1_2026 unk_estimated_availability_date=Unknown
% @importance 1.0

0.82::acc(s2, estimated_availability_date).

0.81::true_val(estimated_availability_date, may_2026); 0.19::true_val(estimated_availability_date, unk_estimated_availability_date).

measured(s2, estimated_availability_date, may_2026).

all_consistent(estimated_availability_date) :- consistent(s2, estimated_availability_date).

evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, may_2026)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values available_2027=Available_for_2027 unk_availability_status=Unknown
% @importance 0.6

0.62::acc(s16, availability_status).

0.60::true_val(availability_status, available_2027); 0.40::true_val(availability_status, unk_availability_status).

measured(s16, availability_status, available_2027).

all_consistent(availability_status) :- consistent(s16, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, available_2027)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_basenz
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_2027_nz=Available_2027_free_NZ_shipping unk_availability_status_basenz=Unknown
% @importance 0.55

0.58::acc(s17, availability_status_basenz).

0.55::true_val(availability_status_basenz, available_2027_nz); 0.45::true_val(availability_status_basenz, unk_availability_status_basenz).

measured(s17, availability_status_basenz, available_2027_nz).

all_consistent(availability_status_basenz) :- consistent(s17, availability_status_basenz).

evidence(all_consistent(availability_status_basenz)).
query(true_val(availability_status_basenz, available_2027_nz)).
query(true_val(availability_status_basenz, unk_availability_status_basenz)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v589_95=589.95 v519=519.0
% @importance 0.867

0.88::acc(s18, price_usd_msrp).
0.60::acc(s23, price_usd_msrp).

0.70::true_val(price_usd_msrp, v589_95); 0.30::true_val(price_usd_msrp, v519).

measured(s18, price_usd_msrp, v589_95).
measured(s23, price_usd_msrp, v519).

all_consistent(price_usd_msrp) :- consistent(s18, price_usd_msrp), consistent(s23, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v589_95)).
query(true_val(price_usd_msrp, v519)).

% @attr price_usd_evo
% @type numeric
% @canonical true
% @original_name price_usd_evo
% @unit USD
% @values v471_96=471.96 unk_price_usd_evo=Unknown
% @importance 0.9

0.72::acc(s19, price_usd_evo).

0.68::true_val(price_usd_evo, v471_96); 0.32::true_val(price_usd_evo, unk_price_usd_evo).

measured(s19, price_usd_evo, v471_96).

all_consistent(price_usd_evo) :- consistent(s19, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v471_96)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_tactics
% @type numeric
% @canonical true
% @original_name price_usd_tactics
% @unit USD
% @values v471_95=471.95 unk_price_usd_tactics=Unknown
% @importance 0.85

0.75::acc(s20, price_usd_tactics).

0.72::true_val(price_usd_tactics, v471_95); 0.28::true_val(price_usd_tactics, unk_price_usd_tactics).

measured(s20, price_usd_tactics, v471_95).

all_consistent(price_usd_tactics) :- consistent(s20, price_usd_tactics).

evidence(all_consistent(price_usd_tactics)).
query(true_val(price_usd_tactics, v471_95)).
query(true_val(price_usd_tactics, unk_price_usd_tactics)).

% @attr price_usd_backcountry
% @type numeric
% @canonical true
% @original_name price_usd_backcountry
% @unit USD
% @values v471_96=471.96 unk_price_usd_backcountry=Unknown
% @importance 0.9

0.72::acc(s19, price_usd_backcountry).

0.68::true_val(price_usd_backcountry, v471_96); 0.32::true_val(price_usd_backcountry, unk_price_usd_backcountry).

measured(s19, price_usd_backcountry, v471_96).

all_consistent(price_usd_backcountry) :- consistent(s19, price_usd_backcountry).

evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v471_96)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

% @attr price_usd_christy_sports
% @type numeric
% @canonical false
% @original_name USD sale price (2026 model / Christy Sports)
% @unit USD
% @values v471_96=471.96 unk_price_usd_christy_sports=Unknown
% @importance 0.9

0.72::acc(s19, price_usd_christy_sports).

0.68::true_val(price_usd_christy_sports, v471_96); 0.32::true_val(price_usd_christy_sports, unk_price_usd_christy_sports).

measured(s19, price_usd_christy_sports, v471_96).

all_consistent(price_usd_christy_sports) :- consistent(s19, price_usd_christy_sports).

evidence(all_consistent(price_usd_christy_sports)).
query(true_val(price_usd_christy_sports, v471_96)).
query(true_val(price_usd_christy_sports, unk_price_usd_christy_sports)).

% @attr price_usd_blauer
% @type numeric
% @canonical false
% @original_name USD sale price (2026 model / Blauer Board Shop)
% @unit USD
% @values v471_96=471.96 unk_price_usd_blauer=Unknown
% @importance 0.9

0.72::acc(s19, price_usd_blauer).

0.68::true_val(price_usd_blauer, v471_96); 0.32::true_val(price_usd_blauer, unk_price_usd_blauer).

measured(s19, price_usd_blauer, v471_96).

all_consistent(price_usd_blauer) :- consistent(s19, price_usd_blauer).

evidence(all_consistent(price_usd_blauer)).
query(true_val(price_usd_blauer, v471_96)).
query(true_val(price_usd_blauer, unk_price_usd_blauer)).

% @attr price_eur_blue_tomato
% @type numeric
% @canonical true
% @original_name price_eur_blue_tomato
% @unit EUR
% @values v423_46=423.46 unk_price_eur_blue_tomato=Unknown
% @importance 0.9

0.72::acc(s19, price_eur_blue_tomato).

0.68::true_val(price_eur_blue_tomato, v423_46); 0.32::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).

measured(s19, price_eur_blue_tomato, v423_46).

all_consistent(price_eur_blue_tomato) :- consistent(s19, price_eur_blue_tomato).

evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v423_46)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

% @attr price_cad_prfo
% @type numeric
% @canonical true
% @original_name price_cad_prfo
% @unit CAD
% @values v649_99=649.99 unk_price_cad_prfo=Unknown
% @importance 0.7

0.60::acc(s21, price_cad_prfo).

0.56::true_val(price_cad_prfo, v649_99); 0.44::true_val(price_cad_prfo, unk_price_cad_prfo).

measured(s21, price_cad_prfo, v649_99).

all_consistent(price_cad_prfo) :- consistent(s21, price_cad_prfo).

evidence(all_consistent(price_cad_prfo)).
query(true_val(price_cad_prfo, v649_99)).
query(true_val(price_cad_prfo, unk_price_cad_prfo)).

% @attr price_usd_evo_2025
% @type numeric
% @canonical false
% @original_name price_usd_evo
% @unit USD
% @values v539_95=539.95 unk_price_usd_evo_2025=Unknown
% @importance 0.75

0.80::acc(s22, price_usd_evo_2025).

0.77::true_val(price_usd_evo_2025, v539_95); 0.23::true_val(price_usd_evo_2025, unk_price_usd_evo_2025).

measured(s22, price_usd_evo_2025, v539_95).

all_consistent(price_usd_evo_2025) :- consistent(s22, price_usd_evo_2025).

evidence(all_consistent(price_usd_evo_2025)).
query(true_val(price_usd_evo_2025, v539_95)).
query(true_val(price_usd_evo_2025, unk_price_usd_evo_2025)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status
% @values in_stock_free_ship=In_stock_free_shipping unk_availability_status_evo=Unknown
% @importance 0.95

0.85::acc(s18, availability_status_evo).

0.81::true_val(availability_status_evo, in_stock_free_ship); 0.19::true_val(availability_status_evo, unk_availability_status_evo).

measured(s18, availability_status_evo, in_stock_free_ship).

all_consistent(availability_status_evo) :- consistent(s18, availability_status_evo).

evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, in_stock_free_ship)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

% @attr availability_status_tactics
% @type categorical
% @canonical false
% @original_name availability_status
% @values in_stock_free_ship_99=In_stock_free_shipping_over_99 unk_availability_status_tactics=Unknown
% @importance 0.85

0.75::acc(s20, availability_status_tactics).

0.72::true_val(availability_status_tactics, in_stock_free_ship_99); 0.28::true_val(availability_status_tactics, unk_availability_status_tactics).

measured(s20, availability_status_tactics, in_stock_free_ship_99).

all_consistent(availability_status_tactics) :- consistent(s20, availability_status_tactics).

evidence(all_consistent(availability_status_tactics)).
query(true_val(availability_status_tactics, in_stock_free_ship_99)).
query(true_val(availability_status_tactics, unk_availability_status_tactics)).

% @attr availability_status_backcountry
% @type categorical
% @canonical false
% @original_name availability_status
% @values in_stock=In_stock unk_availability_status_backcountry=Unknown
% @importance 0.9

0.72::acc(s19, availability_status_backcountry).

0.68::true_val(availability_status_backcountry, in_stock); 0.32::true_val(availability_status_backcountry, unk_availability_status_backcountry).

measured(s19, availability_status_backcountry, in_stock).

all_consistent(availability_status_backcountry) :- consistent(s19, availability_status_backcountry).

evidence(all_consistent(availability_status_backcountry)).
query(true_val(availability_status_backcountry, in_stock)).
query(true_val(availability_status_backcountry, unk_availability_status_backcountry)).

% @attr availability_status_christy
% @type categorical
% @canonical false
% @original_name availability_status
% @values in_stock=In_stock unk_availability_status_christy=Unknown
% @importance 0.9

0.72::acc(s19, availability_status_christy).

0.68::true_val(availability_status_christy, in_stock); 0.32::true_val(availability_status_christy, unk_availability_status_christy).

measured(s19, availability_status_christy, in_stock).

all_consistent(availability_status_christy) :- consistent(s19, availability_status_christy).

evidence(all_consistent(availability_status_christy)).
query(true_val(availability_status_christy, in_stock)).
query(true_val(availability_status_christy, unk_availability_status_christy)).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status
% @values in_stock=In_stock unk_availability_status_blauer=Unknown
% @importance 0.9

0.72::acc(s19, availability_status_blauer).

0.68::true_val(availability_status_blauer, in_stock); 0.32::true_val(availability_status_blauer, unk_availability_status_blauer).

measured(s19, availability_status_blauer, in_stock).

all_consistent(availability_status_blauer) :- consistent(s19, availability_status_blauer).

evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, in_stock)).
query(true_val(availability_status_blauer, unk_availability_status_blauer)).

% @attr availability_status_salty_peaks
% @type categorical
% @canonical false
% @original_name availability_status
% @values available=Available unk_availability_status_salty_peaks=Unknown
% @importance 0.5

0.55::acc(s24, availability_status_salty_peaks).

0.46::true_val(availability_status_salty_peaks, available); 0.54::true_val(availability_status_salty_peaks, unk_availability_status_salty_peaks).

measured(s24, availability_status_salty_peaks, available).

all_consistent(availability_status_salty_peaks) :- consistent(s24, availability_status_salty_peaks).

evidence(all_consistent(availability_status_salty_peaks)).
query(true_val(availability_status_salty_peaks, available)).
query(true_val(availability_status_salty_peaks, unk_availability_status_salty_peaks)).

% @attr availability_status_eriks
% @type categorical
% @canonical false
% @original_name availability_status
% @values closeout_prior_year=Closeout_prior_year unk_availability_status_eriks=Unknown
% @importance 0.4

0.50::acc(s25, availability_status_eriks).

0.45::true_val(availability_status_eriks, closeout_prior_year); 0.55::true_val(availability_status_eriks, unk_availability_status_eriks).

measured(s25, availability_status_eriks, closeout_prior_year).

all_consistent(availability_status_eriks) :- consistent(s25, availability_status_eriks).

evidence(all_consistent(availability_status_eriks)).
query(true_val(availability_status_eriks, closeout_prior_year)).
query(true_val(availability_status_eriks, unk_availability_status_eriks)).

% @attr availability_status_amazon
% @type categorical
% @canonical false
% @original_name availability_status
% @values available=Available unk_availability_status_amazon=Unknown
% @importance 0.5

0.60::acc(s26, availability_status_amazon).

0.56::true_val(availability_status_amazon, available); 0.44::true_val(availability_status_amazon, unk_availability_status_amazon).

measured(s26, availability_status_amazon, available).

all_consistent(availability_status_amazon) :- consistent(s26, availability_status_amazon).

evidence(all_consistent(availability_status_amazon)).
query(true_val(availability_status_amazon, available)).
query(true_val(availability_status_amazon, unk_availability_status_amazon)).

% @attr availability_status_ebay
% @type categorical
% @canonical false
% @original_name availability_status
% @values used_new_prior=Used_new_prior_years unk_availability_status_ebay=Unknown
% @importance 0.4

0.40::acc(s27, availability_status_ebay).

0.35::true_val(availability_status_ebay, used_new_prior); 0.65::true_val(availability_status_ebay, unk_availability_status_ebay).

measured(s27, availability_status_ebay, used_new_prior).

all_consistent(availability_status_ebay) :- consistent(s27, availability_status_ebay).

evidence(all_consistent(availability_status_ebay)).
query(true_val(availability_status_ebay, used_new_prior)).
query(true_val(availability_status_ebay, unk_availability_status_ebay)).

% @attr availability_status_gorge
% @type categorical
% @canonical false
% @original_name availability_status
% @values available=Available unk_availability_status_gorge=Unknown
% @importance 0.4

0.48::acc(s28, availability_status_gorge).

0.42::true_val(availability_status_gorge, available); 0.58::true_val(availability_status_gorge, unk_availability_status_gorge).

measured(s28, availability_status_gorge, available).

all_consistent(availability_status_gorge) :- consistent(s28, availability_status_gorge).

evidence(all_consistent(availability_status_gorge)).
query(true_val(availability_status_gorge, available)).
query(true_val(availability_status_gorge, unk_availability_status_gorge)).

% @attr availability_status_s2as
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_uk=Available_authorized_UK_retailer unk_availability_status_s2as=Unknown
% @importance 0.4

0.48::acc(s29, availability_status_s2as).

0.45::true_val(availability_status_s2as, available_uk); 0.55::true_val(availability_status_s2as, unk_availability_status_s2as).

measured(s29, availability_status_s2as, available_uk).

all_consistent(availability_status_s2as) :- consistent(s29, availability_status_s2as).

evidence(all_consistent(availability_status_s2as)).
query(true_val(availability_status_s2as, available_uk)).
query(true_val(availability_status_s2as, unk_availability_status_s2as)).

% @attr availability_status_rudeboys
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_ca=Available_Banff_Canada unk_availability_status_rudeboys=Unknown
% @importance 0.4

0.48::acc(s30, availability_status_rudeboys).

0.42::true_val(availability_status_rudeboys, available_ca); 0.58::true_val(availability_status_rudeboys, unk_availability_status_rudeboys).

measured(s30, availability_status_rudeboys, available_ca).

all_consistent(availability_status_rudeboys) :- consistent(s30, availability_status_rudeboys).

evidence(all_consistent(availability_status_rudeboys)).
query(true_val(availability_status_rudeboys, available_ca)).
query(true_val(availability_status_rudeboys, unk_availability_status_rudeboys)).

% @attr availability_status_pacific_boarder
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_vancouver=Available_Vancouver unk_availability_status_pacific_boarder=Unknown
% @importance 0.35

0.45::acc(s31, availability_status_pacific_boarder).

0.39::true_val(availability_status_pacific_boarder, available_vancouver); 0.61::true_val(availability_status_pacific_boarder, unk_availability_status_pacific_boarder).

measured(s31, availability_status_pacific_boarder, available_vancouver).

all_consistent(availability_status_pacific_boarder) :- consistent(s31, availability_status_pacific_boarder).

evidence(all_consistent(availability_status_pacific_boarder)).
query(true_val(availability_status_pacific_boarder, available_vancouver)).
query(true_val(availability_status_pacific_boarder, unk_availability_status_pacific_boarder)).

% @attr availability_status_snowcountry
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_eu=Available_EU unk_availability_status_snowcountry=Unknown
% @importance 0.9

0.72::acc(s19, availability_status_snowcountry).

0.68::true_val(availability_status_snowcountry, available_eu); 0.32::true_val(availability_status_snowcountry, unk_availability_status_snowcountry).

measured(s19, availability_status_snowcountry, available_eu).

all_consistent(availability_status_snowcountry) :- consistent(s19, availability_status_snowcountry).

evidence(all_consistent(availability_status_snowcountry)).
query(true_val(availability_status_snowcountry, available_eu)).
query(true_val(availability_status_snowcountry, unk_availability_status_snowcountry)).

% @attr availability_status_ballistyx
% @type categorical
% @canonical false
% @original_name availability_status
% @values preorder_2027=Preorder_for_2027 unk_availability_status_ballistyx=Unknown
% @importance 1.0

0.82::acc(s2, availability_status_ballistyx).

0.81::true_val(availability_status_ballistyx, preorder_2027); 0.19::true_val(availability_status_ballistyx, unk_availability_status_ballistyx).

measured(s2, availability_status_ballistyx, preorder_2027).

all_consistent(availability_status_ballistyx) :- consistent(s2, availability_status_ballistyx).

evidence(all_consistent(availability_status_ballistyx)).
query(true_val(availability_status_ballistyx, preorder_2027)).
query(true_val(availability_status_ballistyx, unk_availability_status_ballistyx)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values three_year_structural=3yr_manufacturer_structural_defects_only unk_warranty=Unknown
% @importance 0.85

0.80::acc(s32, warranty).

0.76::true_val(warranty, three_year_structural); 0.24::true_val(warranty, unk_warranty).

measured(s32, warranty, three_year_structural).

all_consistent(warranty) :- consistent(s32, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, three_year_structural)).
query(true_val(warranty, unk_warranty)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values unisex=Unisex unk_gender=Unknown
% @importance 1.0

0.93::acc(s1, gender).

0.95::true_val(gender, unisex); 0.05::true_val(gender, unk_gender).

measured(s1, gender, unisex).

all_consistent(gender) :- consistent(s1, gender).

evidence(all_consistent(gender)).
query(true_val(gender, unisex)).
query(true_val(gender, unk_gender)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values am_freeride_powder=All_Mountain_Freeride_Powder unk_board_category=Unknown
% @importance 1.0

0.82::acc(s2, board_category).

0.81::true_val(board_category, am_freeride_powder); 0.19::true_val(board_category, unk_board_category).

measured(s2, board_category, am_freeride_powder).

all_consistent(board_category) :- consistent(s2, board_category).

evidence(all_consistent(board_category)).
query(true_val(board_category, am_freeride_powder)).
query(true_val(board_category, unk_board_category)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values freeride_powder_am=Freeride_Powder_All_Mountain unk_terrain_suitability=Unknown
% @importance 1.0

0.82::acc(s2, terrain_suitability).

0.81::true_val(terrain_suitability, freeride_powder_am); 0.19::true_val(terrain_suitability, unk_terrain_suitability).

measured(s2, terrain_suitability, freeride_powder_am).

all_consistent(terrain_suitability) :- consistent(s2, terrain_suitability).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, freeride_powder_am)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 1.0

0.82::acc(s2, shape).

0.81::true_val(shape, tapered_directional); 0.19::true_val(shape, unk_shape).

measured(s2, shape, tapered_directional).

all_consistent(shape) :- consistent(s2, shape).

evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values directional_zero_camber=Directional_Zero_Camber_flat_underfoot_rocker_nose_tail unk_camber_type=Unknown
% @importance 0.9

0.90::acc(s33, camber_type).

0.86::true_val(camber_type, directional_zero_camber); 0.14::true_val(camber_type, unk_camber_type).

measured(s33, camber_type, directional_zero_camber).

all_consistent(camber_type) :- consistent(s33, camber_type).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, directional_zero_camber)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values flat_zero_camber=Flat_zero_camber_one_direction rocker_flat_rocker=Rocker_Flat_Rocker
% @importance 0.875

0.92::acc(s33, camber_description).
0.78::acc(s34, camber_description).

0.60::true_val(camber_description, flat_zero_camber); 0.40::true_val(camber_description, rocker_flat_rocker).

measured(s33, camber_description, flat_zero_camber).
measured(s34, camber_description, rocker_flat_rocker).

all_consistent(camber_description) :-
    consistent(s33, camber_description),
    (indep(s34), consistent(s34, camber_description) ; \+indep(s34)).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, flat_zero_camber)).
query(true_val(camber_description, rocker_flat_rocker)).

% @attr flex_rating_10
% @type categorical
% @canonical true
% @original_name flex_rating_10
% @values medium=Medium unk_flex_rating_10=Unknown
% @importance 1.0

0.82::acc(s2, flex_rating_10).

0.81::true_val(flex_rating_10, medium); 0.19::true_val(flex_rating_10, unk_flex_rating_10).

measured(s2, flex_rating_10, medium).

all_consistent(flex_rating_10) :- consistent(s2, flex_rating_10).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, medium)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values mid_forgiving=Mid_flex_balanced_forgiving medium_stiff=Medium_Stiff
% @importance 0.9

0.78::acc(s35, flex_feel).
0.75::acc(s34, flex_feel).
0.70::acc(s2, flex_feel).

0.70::true_val(flex_feel, mid_forgiving); 0.30::true_val(flex_feel, medium_stiff).

measured(s35, flex_feel, mid_forgiving).
measured(s34, flex_feel, mid_forgiving).
measured(s2, flex_feel, medium_stiff).

all_consistent(flex_feel) :-
    consistent(s35, flex_feel),
    (indep(s34), consistent(s34, flex_feel) ; \+indep(s34)),
    (indep(s2), consistent(s2, flex_feel) ; \+indep(s2)).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, mid_forgiving)).
query(true_val(flex_feel, medium_stiff)).

% @attr flex_direction
% @type categorical
% @canonical false
% @original_name flex_direction
% @values directional_stiffer_tail=Directional_stiffer_tail_carbon unk_flex_direction=Unknown
% @importance 0.65

0.62::acc(s37, flex_direction).

0.56::true_val(flex_direction, directional_stiffer_tail); 0.44::true_val(flex_direction, unk_flex_direction).

measured(s37, flex_direction, directional_stiffer_tail).

all_consistent(flex_direction) :- consistent(s37, flex_direction).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional_stiffer_tail)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr rider_level
% @type categorical
% @canonical false
% @original_name rider_level
% @values intermediate_advanced=Intermediate_to_Advanced unk_rider_level=Unknown
% @importance 0.85

0.78::acc(s34, rider_level).

0.68::true_val(rider_level, intermediate_advanced); 0.32::true_val(rider_level, unk_rider_level).

measured(s34, rider_level, intermediate_advanced).

all_consistent(rider_level) :- consistent(s34, rider_level).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate_advanced)).
query(true_val(rider_level, unk_rider_level)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values beginner_expert=Beginner_to_Expert intermediate_advanced=Intermediate_to_Advanced
% @importance 0.8

0.75::acc(s23, skill_level_recommendation).
0.78::acc(s34, skill_level_recommendation).
0.60::acc(s38, skill_level_recommendation).

0.35::true_val(skill_level_recommendation, beginner_expert); 0.45::true_val(skill_level_recommendation, intermediate_advanced); 0.20::true_val(skill_level_recommendation, not_for_novices).

measured(s23, skill_level_recommendation, beginner_expert).
measured(s34, skill_level_recommendation, intermediate_advanced).
measured(s38, skill_level_recommendation, not_for_novices).

all_consistent(skill_level_recommendation) :-
    consistent(s23, skill_level_recommendation),
    (indep(s34), consistent(s34, skill_level_recommendation) ; \+indep(s34)),
    consistent(s38, skill_level_recommendation).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, beginner_expert)).
query(true_val(skill_level_recommendation, intermediate_advanced)).
query(true_val(skill_level_recommendation, not_for_novices)).

% @attr volume_shift_sizing
% @type categorical
% @canonical false
% @original_name Volume shift / sizing recommendation
% @values size_down_3_6cm=Size_down_3_to_6cm unk_volume_shift_sizing=Unknown
% @importance 0.9

0.88::acc(s9, volume_shift_sizing).

0.86::true_val(volume_shift_sizing, size_down_3_6cm); 0.14::true_val(volume_shift_sizing, unk_volume_shift_sizing).

measured(s9, volume_shift_sizing, size_down_3_6cm).

all_consistent(volume_shift_sizing) :- consistent(s9, volume_shift_sizing).

evidence(all_consistent(volume_shift_sizing)).
query(true_val(volume_shift_sizing, size_down_3_6cm)).
query(true_val(volume_shift_sizing, unk_volume_shift_sizing)).

% @attr sidecut_type
% @type categorical
% @canonical false
% @original_name sidecut_type
% @values tapered_bi_radial=Tapered_Bi_Radial_Sidecut unk_sidecut_type=Unknown
% @importance 1.0

0.82::acc(s2, sidecut_type).

0.81::true_val(sidecut_type, tapered_bi_radial); 0.19::true_val(sidecut_type, unk_sidecut_type).

measured(s2, sidecut_type, tapered_bi_radial).

all_consistent(sidecut_type) :- consistent(s2, sidecut_type).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, tapered_bi_radial)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr sidecut_description
% @type categorical
% @canonical false
% @original_name Sidecut description (Tactics)
% @values tight_tip_wide_tail=Tight_radius_tip_wide_radius_tail unk_sidecut_description=Unknown
% @importance 0.75

0.78::acc(s39, sidecut_description).

0.72::true_val(sidecut_description, tight_tip_wide_tail); 0.28::true_val(sidecut_description, unk_sidecut_description).

measured(s39, sidecut_description, tight_tip_wide_tail).

all_consistent(sidecut_description) :- consistent(s39, sidecut_description).

evidence(all_consistent(sidecut_description)).
query(true_val(sidecut_description, tight_tip_wide_tail)).
query(true_val(sidecut_description, unk_sidecut_description)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 1.0

0.82::acc(s2, mounting_pattern).

0.81::true_val(mounting_pattern, inserts_2x4); 0.19::true_val(mounting_pattern, unk_mounting_pattern).

measured(s2, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :- consistent(s2, mounting_pattern).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard=Standard unk_width_options=Unknown
% @importance 1.0

0.82::acc(s2, width_options).

0.81::true_val(width_options, standard); 0.19::true_val(width_options, unk_width_options).

measured(s2, width_options, standard).

all_consistent(width_options) :- consistent(s2, width_options).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard)).
query(true_val(width_options, unk_width_options)).

% @attr setback
% @type numeric
% @canonical true
% @original_name setback
% @unit mm
% @values v_neg19=19.0 v_neg20=20.0
% @importance 0.95

0.82::acc(s2, setback).
0.78::acc(s23, setback).

0.50::true_val(setback, v_neg19); 0.50::true_val(setback, v_neg20).

measured(s2, setback, v_neg19).
measured(s23, setback, v_neg20).

all_consistent(setback) :-
    (indep(s2), consistent(s2, setback) ; \+indep(s2)),
    consistent(s23, setback).

evidence(all_consistent(setback)).
query(true_val(setback, v_neg19)).
query(true_val(setback, v_neg20)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values six_sizes=138_142_146_150_154_158cm four_sizes=146_150_154_158cm
% @importance 0.95

0.82::acc(s2, available_sizes).
0.85::acc(s33, available_sizes).

0.45::true_val(available_sizes, six_sizes); 0.55::true_val(available_sizes, four_sizes).

measured(s2, available_sizes, six_sizes).
measured(s33, available_sizes, four_sizes).

all_consistent(available_sizes) :-
    (indep(s2), consistent(s2, available_sizes) ; \+indep(s2)),
    consistent(s33, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, six_sizes)).
query(true_val(available_sizes, four_sizes)).

% @attr waist_width_146
% @type numeric
% @canonical false
% @original_name Waist width 146cm
% @unit cm
% @values v25_7=25.7 unk_waist_width_146=Unknown
% @importance 1.0

0.82::acc(s2, waist_width_146).

0.81::true_val(waist_width_146, v25_7); 0.19::true_val(waist_width_146, unk_waist_width_146).

measured(s2, waist_width_146, v25_7).

all_consistent(waist_width_146) :- consistent(s2, waist_width_146).

evidence(all_consistent(waist_width_146)).
query(true_val(waist_width_146, v25_7)).
query(true_val(waist_width_146, unk_waist_width_146)).

% @attr waist_width_150
% @type numeric
% @canonical false
% @original_name Waist width 150cm
% @unit cm
% @values v26_4=26.4 unk_waist_width_150=Unknown
% @importance 1.0

0.82::acc(s2, waist_width_150).

0.81::true_val(waist_width_150, v26_4); 0.19::true_val(waist_width_150, unk_waist_width_150).

measured(s2, waist_width_150, v26_4).

all_consistent(waist_width_150) :- consistent(s2, waist_width_150).

evidence(all_consistent(waist_width_150)).
query(true_val(waist_width_150, v26_4)).
query(true_val(waist_width_150, unk_waist_width_150)).

% @attr waist_width_154
% @type numeric
% @canonical false
% @original_name Waist width 154cm
% @unit cm
% @values v26_7=26.7 unk_waist_width_154=Unknown
% @importance 1.0

0.82::acc(s2, waist_width_154).

0.81::true_val(waist_width_154, v26_7); 0.19::true_val(waist_width_154, unk_waist_width_154).

measured(s2, waist_width_154, v26_7).

all_consistent(waist_width_154) :- consistent(s2, waist_width_154).

evidence(all_consistent(waist_width_154)).
query(true_val(waist_width_154, v26_7)).
query(true_val(waist_width_154, unk_waist_width_154)).

% @attr waist_width_158
% @type numeric
% @canonical false
% @original_name Waist width 158cm
% @unit cm
% @values v26_9=26.9 unk_waist_width_158=Unknown
% @importance 1.0

0.82::acc(s2, waist_width_158).

0.81::true_val(waist_width_158, v26_9); 0.19::true_val(waist_width_158, unk_waist_width_158).

measured(s2, waist_width_158, v26_9).

all_consistent(waist_width_158) :- consistent(s2, waist_width_158).

evidence(all_consistent(waist_width_158)).
query(true_val(waist_width_158, v26_9)).
query(true_val(waist_width_158, unk_waist_width_158)).

% @attr tip_tail_width_size_146
% @type categorical
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v30_9_29_9=30.9/29.9 unk_tip_tail_width_size_146=Unknown
% @importance 1.0

0.82::acc(s2, tip_tail_width_size_146).

0.81::true_val(tip_tail_width_size_146, v30_9_29_9); 0.19::true_val(tip_tail_width_size_146, unk_tip_tail_width_size_146).

measured(s2, tip_tail_width_size_146, v30_9_29_9).

all_consistent(tip_tail_width_size_146) :- consistent(s2, tip_tail_width_size_146).

evidence(all_consistent(tip_tail_width_size_146)).
query(true_val(tip_tail_width_size_146, v30_9_29_9)).
query(true_val(tip_tail_width_size_146, unk_tip_tail_width_size_146)).

% @attr tip_tail_width_size_150
% @type categorical
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v31_6_30_6=31.6/30.6 unk_tip_tail_width_size_150=Unknown
% @importance 1.0

0.82::acc(s2, tip_tail_width_size_150).

0.81::true_val(tip_tail_width_size_150, v31_6_30_6); 0.19::true_val(tip_tail_width_size_150, unk_tip_tail_width_size_150).

measured(s2, tip_tail_width_size_150, v31_6_30_6).

all_consistent(tip_tail_width_size_150) :- consistent(s2, tip_tail_width_size_150).

evidence(all_consistent(tip_tail_width_size_150)).
query(true_val(tip_tail_width_size_150, v31_6_30_6)).
query(true_val(tip_tail_width_size_150, unk_tip_tail_width_size_150)).

% @attr tip_tail_width_size
% @type categorical
% @canonical true
% @original_name tip_tail_width_size
% @unit cm
% @values v31_8_30_8=31.8/30.8 unk_tip_tail_width_size=Unknown
% @importance 1.0

0.82::acc(s2, tip_tail_width_size).

0.81::true_val(tip_tail_width_size, v31_8_30_8); 0.19::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s2, tip_tail_width_size, v31_8_30_8).

all_consistent(tip_tail_width_size) :- consistent(s2, tip_tail_width_size).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v31_8_30_8)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr tip_tail_width_size_158
% @type categorical
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v32_0_31_0=32.0/31.0 unk_tip_tail_width_size_158=Unknown
% @importance 1.0

0.82::acc(s2, tip_tail_width_size_158).

0.81::true_val(tip_tail_width_size_158, v32_0_31_0); 0.19::true_val(tip_tail_width_size_158, unk_tip_tail_width_size_158).

measured(s2, tip_tail_width_size_158, v32_0_31_0).

all_consistent(tip_tail_width_size_158) :- consistent(s2, tip_tail_width_size_158).

evidence(all_consistent(tip_tail_width_size_158)).
query(true_val(tip_tail_width_size_158, v32_0_31_0)).
query(true_val(tip_tail_width_size_158, unk_tip_tail_width_size_158)).

% @attr sidecut_radius_size_146
% @type categorical
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v4_9_6_0=4.9/6.0 unk_sidecut_radius_size_146=Unknown
% @importance 1.0

0.82::acc(s2, sidecut_radius_size_146).

0.81::true_val(sidecut_radius_size_146, v4_9_6_0); 0.19::true_val(sidecut_radius_size_146, unk_sidecut_radius_size_146).

measured(s2, sidecut_radius_size_146, v4_9_6_0).

all_consistent(sidecut_radius_size_146) :- consistent(s2, sidecut_radius_size_146).

evidence(all_consistent(sidecut_radius_size_146)).
query(true_val(sidecut_radius_size_146, v4_9_6_0)).
query(true_val(sidecut_radius_size_146, unk_sidecut_radius_size_146)).

% @attr sidecut_radius_size_150
% @type categorical
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v5_3_6_3=5.3/6.3 unk_sidecut_radius_size_150=Unknown
% @importance 1.0

0.82::acc(s2, sidecut_radius_size_150).

0.81::true_val(sidecut_radius_size_150, v5_3_6_3); 0.19::true_val(sidecut_radius_size_150, unk_sidecut_radius_size_150).

measured(s2, sidecut_radius_size_150, v5_3_6_3).

all_consistent(sidecut_radius_size_150) :- consistent(s2, sidecut_radius_size_150).

evidence(all_consistent(sidecut_radius_size_150)).
query(true_val(sidecut_radius_size_150, v5_3_6_3)).
query(true_val(sidecut_radius_size_150, unk_sidecut_radius_size_150)).

% @attr sidecut_radius_size
% @type categorical
% @canonical true
% @original_name sidecut_radius_size
% @unit m
% @values v5_4_6_6=5.4/6.6 unk_sidecut_radius_size=Unknown
% @importance 1.0

0.82::acc(s2, sidecut_radius_size).

0.81::true_val(sidecut_radius_size, v5_4_6_6); 0.19::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s2, sidecut_radius_size, v5_4_6_6).

all_consistent(sidecut_radius_size) :- consistent(s2, sidecut_radius_size).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v5_4_6_6)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr sidecut_radius_size_158
% @type categorical
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v5_7_6_9=5.7/6.9 unk_sidecut_radius_size_158=Unknown
% @importance 1.0

0.82::acc(s2, sidecut_radius_size_158).

0.81::true_val(sidecut_radius_size_158, v5_7_6_9); 0.19::true_val(sidecut_radius_size_158, unk_sidecut_radius_size_158).

measured(s2, sidecut_radius_size_158, v5_7_6_9).

all_consistent(sidecut_radius_size_158) :- consistent(s2, sidecut_radius_size_158).

evidence(all_consistent(sidecut_radius_size_158)).
query(true_val(sidecut_radius_size_158, v5_7_6_9)).
query(true_val(sidecut_radius_size_158, unk_sidecut_radius_size_158)).

% @attr stance_width_range_size_146
% @type numeric
% @canonical false
% @original_name stance_width_range_size
% @unit cm
% @values v50_8=50.8 unk_stance_width_range_size_146=Unknown
% @importance 1.0

0.82::acc(s2, stance_width_range_size_146).

0.81::true_val(stance_width_range_size_146, v50_8); 0.19::true_val(stance_width_range_size_146, unk_stance_width_range_size_146).

measured(s2, stance_width_range_size_146, v50_8).

all_consistent(stance_width_range_size_146) :- consistent(s2, stance_width_range_size_146).

evidence(all_consistent(stance_width_range_size_146)).
query(true_val(stance_width_range_size_146, v50_8)).
query(true_val(stance_width_range_size_146, unk_stance_width_range_size_146)).

% @attr stance_width_range_size_150
% @type numeric
% @canonical false
% @original_name stance_width_range_size
% @unit cm
% @values v50_8=50.8 unk_stance_width_range_size_150=Unknown
% @importance 1.0

0.82::acc(s2, stance_width_range_size_150).

0.81::true_val(stance_width_range_size_150, v50_8); 0.19::true_val(stance_width_range_size_150, unk_stance_width_range_size_150).

measured(s2, stance_width_range_size_150, v50_8).

all_consistent(stance_width_range_size_150) :- consistent(s2, stance_width_range_size_150).

evidence(all_consistent(stance_width_range_size_150)).
query(true_val(stance_width_range_size_150, v50_8)).
query(true_val(stance_width_range_size_150, unk_stance_width_range_size_150)).

% @attr stance_width_range_size
% @type numeric
% @canonical true
% @original_name stance_width_range_size
% @unit cm
% @values v53_3=53.3 unk_stance_width_range_size=Unknown
% @importance 1.0

0.82::acc(s2, stance_width_range_size).

0.81::true_val(stance_width_range_size, v53_3); 0.19::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s2, stance_width_range_size, v53_3).

all_consistent(stance_width_range_size) :- consistent(s2, stance_width_range_size).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v53_3)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr stance_width_range_size_158
% @type numeric
% @canonical false
% @original_name stance_width_range_size
% @unit cm
% @values v55_9=55.9 unk_stance_width_range_size_158=Unknown
% @importance 1.0

0.82::acc(s2, stance_width_range_size_158).

0.81::true_val(stance_width_range_size_158, v55_9); 0.19::true_val(stance_width_range_size_158, unk_stance_width_range_size_158).

measured(s2, stance_width_range_size_158, v55_9).

all_consistent(stance_width_range_size_158) :- consistent(s2, stance_width_range_size_158).

evidence(all_consistent(stance_width_range_size_158)).
query(true_val(stance_width_range_size_158, v55_9)).
query(true_val(stance_width_range_size_158, unk_stance_width_range_size_158)).

% @attr recommended_weight_range_size_146
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @unit kg
% @values w45_93=45-93kg unk_recommended_weight_range_size_146=Unknown
% @importance 1.0

0.82::acc(s2, recommended_weight_range_size_146).

0.81::true_val(recommended_weight_range_size_146, w45_93); 0.19::true_val(recommended_weight_range_size_146, unk_recommended_weight_range_size_146).

measured(s2, recommended_weight_range_size_146, w45_93).

all_consistent(recommended_weight_range_size_146) :- consistent(s2, recommended_weight_range_size_146).

evidence(all_consistent(recommended_weight_range_size_146)).
query(true_val(recommended_weight_range_size_146, w45_93)).
query(true_val(recommended_weight_range_size_146, unk_recommended_weight_range_size_146)).

% @attr recommended_weight_range_size_150
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @unit kg
% @values w59_95=59-95kg unk_recommended_weight_range_size_150=Unknown
% @importance 1.0

0.82::acc(s2, recommended_weight_range_size_150).

0.81::true_val(recommended_weight_range_size_150, w59_95); 0.19::true_val(recommended_weight_range_size_150, unk_recommended_weight_range_size_150).

measured(s2, recommended_weight_range_size_150, w59_95).

all_consistent(recommended_weight_range_size_150) :- consistent(s2, recommended_weight_range_size_150).

evidence(all_consistent(recommended_weight_range_size_150)).
query(true_val(recommended_weight_range_size_150, w59_95)).
query(true_val(recommended_weight_range_size_150, unk_recommended_weight_range_size_150)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size
% @unit kg
% @values w64_100plus=64-100+kg unk_recommended_weight_range_size=Unknown
% @importance 1.0

0.82::acc(s2, recommended_weight_range_size).

0.81::true_val(recommended_weight_range_size, w64_100plus); 0.19::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s2, recommended_weight_range_size, w64_100plus).

all_consistent(recommended_weight_range_size) :- consistent(s2, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w64_100plus)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr recommended_weight_range_size_158
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @unit kg
% @values w77_100plus=77-100+kg unk_recommended_weight_range_size_158=Unknown
% @importance 1.0

0.82::acc(s2, recommended_weight_range_size_158).

0.81::true_val(recommended_weight_range_size_158, w77_100plus); 0.19::true_val(recommended_weight_range_size_158, unk_recommended_weight_range_size_158).

measured(s2, recommended_weight_range_size_158, w77_100plus).

all_consistent(recommended_weight_range_size_158) :- consistent(s2, recommended_weight_range_size_158).

evidence(all_consistent(recommended_weight_range_size_158)).
query(true_val(recommended_weight_range_size_158, w77_100plus)).
query(true_val(recommended_weight_range_size_158, unk_recommended_weight_range_size_158)).

% @attr boot_size_146
% @type categorical
% @canonical false
% @original_name Recommended boot size 146
% @values us7_8m_8_10w=7-8_US_Mens_8-10_US_Womens unk_boot_size_146=Unknown
% @importance 0.8

0.72::acc(s40, boot_size_146).

0.64::true_val(boot_size_146, us7_8m_8_10w); 0.36::true_val(boot_size_146, unk_boot_size_146).

measured(s40, boot_size_146, us7_8m_8_10w).

all_consistent(boot_size_146) :- consistent(s40, boot_size_146).

evidence(all_consistent(boot_size_146)).
query(true_val(boot_size_146, us7_8m_8_10w)).
query(true_val(boot_size_146, unk_boot_size_146)).

% @attr boot_size_150
% @type categorical
% @canonical false
% @original_name Recommended boot size 150
% @values us8_9m_10plusw=8-9_US_Mens_10plus_US_Womens unk_boot_size_150=Unknown
% @importance 0.8

0.72::acc(s40, boot_size_150).

0.64::true_val(boot_size_150, us8_9m_10plusw); 0.36::true_val(boot_size_150, unk_boot_size_150).

measured(s40, boot_size_150, us8_9m_10plusw).

all_consistent(boot_size_150) :- consistent(s40, boot_size_150).

evidence(all_consistent(boot_size_150)).
query(true_val(boot_size_150, us8_9m_10plusw)).
query(true_val(boot_size_150, unk_boot_size_150)).

% @attr boot_size_154
% @type categorical
% @canonical false
% @original_name Recommended boot size 154
% @values us9_10m=9-10_US_Mens unk_boot_size_154=Unknown
% @importance 0.8

0.72::acc(s40, boot_size_154).

0.64::true_val(boot_size_154, us9_10m); 0.36::true_val(boot_size_154, unk_boot_size_154).

measured(s40, boot_size_154, us9_10m).

all_consistent(boot_size_154) :- consistent(s40, boot_size_154).

evidence(all_consistent(boot_size_154)).
query(true_val(boot_size_154, us9_10m)).
query(true_val(boot_size_154, unk_boot_size_154)).

% @attr boot_size_158
% @type categorical
% @canonical false
% @original_name Recommended boot size 158
% @values us10_5_11_5m=10.5-11.5_US_Mens unk_boot_size_158=Unknown
% @importance 0.8

0.72::acc(s40, boot_size_158).

0.64::true_val(boot_size_158, us10_5_11_5m); 0.36::true_val(boot_size_158, unk_boot_size_158).

measured(s40, boot_size_158, us10_5_11_5m).

all_consistent(boot_size_158) :- consistent(s40, boot_size_158).

evidence(all_consistent(boot_size_158)).
query(true_val(boot_size_158, us10_5_11_5m)).
query(true_val(boot_size_158, unk_boot_size_158)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values perf_light_aspen_bamboo_paulownia=Performance_Light_Aspen_Bamboo_Paulownia unk_core_material=Unknown
% @importance 0.75

0.78::acc(s41, core_material).

0.72::true_val(core_material, perf_light_aspen_bamboo_paulownia); 0.28::true_val(core_material, unk_core_material).

measured(s41, core_material, perf_light_aspen_bamboo_paulownia).

all_consistent(core_material) :-
    (indep(s41), consistent(s41, core_material) ; \+indep(s41)).

evidence(all_consistent(core_material)).
query(true_val(core_material, perf_light_aspen_bamboo_paulownia)).
query(true_val(core_material, unk_core_material)).

% @attr laminate
% @type categorical
% @canonical false
% @original_name laminate
% @values carbon_glass_array5_impact=Carbon_Infused_Glass_Carbon_Array_5_Double_Impact_Plates unk_laminate=Unknown
% @importance 1.0

0.82::acc(s2, laminate).

0.81::true_val(laminate, carbon_glass_array5_impact); 0.19::true_val(laminate, unk_laminate).

measured(s2, laminate, carbon_glass_array5_impact).

all_consistent(laminate) :- consistent(s2, laminate).

evidence(all_consistent(laminate)).
query(true_val(laminate, carbon_glass_array5_impact)).
query(true_val(laminate, unk_laminate)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values carbon_90deg_fibers=90deg_carbon_fibers_in_glass_pop_response unk_construction_material_innovation=Unknown
% @importance 0.7

0.88::acc(s7, construction_material_innovation).

0.86::true_val(construction_material_innovation, carbon_90deg_fibers); 0.14::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s7, construction_material_innovation, carbon_90deg_fibers).

all_consistent(construction_material_innovation) :- consistent(s7, construction_material_innovation).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, carbon_90deg_fibers)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr construction_material_innovation_carbon_array
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values carbon_array_5=5_carbon_stringers_binding_zone unk_construction_material_innovation_carbon_array=Unknown
% @importance 0.7

0.88::acc(s7, construction_material_innovation_carbon_array).

0.86::true_val(construction_material_innovation_carbon_array, carbon_array_5); 0.14::true_val(construction_material_innovation_carbon_array, unk_construction_material_innovation_carbon_array).

measured(s7, construction_material_innovation_carbon_array, carbon_array_5).

all_consistent(construction_material_innovation_carbon_array) :- consistent(s7, construction_material_innovation_carbon_array).

evidence(all_consistent(construction_material_innovation_carbon_array)).
query(true_val(construction_material_innovation_carbon_array, carbon_array_5)).
query(true_val(construction_material_innovation_carbon_array, unk_construction_material_innovation_carbon_array)).

% @attr construction_material_innovation_impact_plates
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values double_impact_plates=Two_layer_urethane_weaves_binding_area unk_construction_material_innovation_impact_plates=Unknown
% @importance 0.6

0.65::acc(s42, construction_material_innovation_impact_plates).

0.63::true_val(construction_material_innovation_impact_plates, double_impact_plates); 0.37::true_val(construction_material_innovation_impact_plates, unk_construction_material_innovation_impact_plates).

measured(s42, construction_material_innovation_impact_plates, double_impact_plates).

all_consistent(construction_material_innovation_impact_plates) :-
    (indep(s42), consistent(s42, construction_material_innovation_impact_plates) ; \+indep(s42)).

evidence(all_consistent(construction_material_innovation_impact_plates)).
query(true_val(construction_material_innovation_impact_plates, double_impact_plates)).
query(true_val(construction_material_innovation_impact_plates, unk_construction_material_innovation_impact_plates)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values carbon_slimewalls_roll_in=Carbon_Slimewalls_urethane_Roll_In_Construction unk_sidewall_material=Unknown
% @importance 0.7

0.90::acc(s33, sidewall_material).
0.88::acc(s7, sidewall_material).

0.95::true_val(sidewall_material, carbon_slimewalls_roll_in); 0.05::true_val(sidewall_material, unk_sidewall_material).

measured(s33, sidewall_material, carbon_slimewalls_roll_in).
measured(s7, sidewall_material, carbon_slimewalls_roll_in).

all_consistent(sidewall_material) :- consistent(s33, sidewall_material), consistent(s7, sidewall_material).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, carbon_slimewalls_roll_in)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr construction_material_innovation_roll_in
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values roll_in_3d_glass=3D_fiberglass_around_urethane_slimewall unk_construction_material_innovation_roll_in=Unknown
% @importance 0.7

0.88::acc(s7, construction_material_innovation_roll_in).

0.86::true_val(construction_material_innovation_roll_in, roll_in_3d_glass); 0.14::true_val(construction_material_innovation_roll_in, unk_construction_material_innovation_roll_in).

measured(s7, construction_material_innovation_roll_in, roll_in_3d_glass).

all_consistent(construction_material_innovation_roll_in) :- consistent(s7, construction_material_innovation_roll_in).

evidence(all_consistent(construction_material_innovation_roll_in)).
query(true_val(construction_material_innovation_roll_in, roll_in_3d_glass)).
query(true_val(construction_material_innovation_roll_in, unk_construction_material_innovation_roll_in)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_4000_ptex=Sintered_4000_PTEX unk_base_material=Unknown
% @importance 0.7

0.88::acc(s7, base_material).

0.86::true_val(base_material, sintered_4000_ptex); 0.14::true_val(base_material, unk_base_material).

measured(s7, base_material, sintered_4000_ptex).

all_consistent(base_material) :- consistent(s7, base_material).

evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_4000_ptex)).
query(true_val(base_material, unk_base_material)).

% @attr base_type
% @type categorical
% @canonical false
% @original_name base_type
% @values stone_ground=Stone_Ground unk_base_type=Unknown
% @importance 0.7

0.88::acc(s7, base_type).

0.86::true_val(base_type, stone_ground); 0.14::true_val(base_type, unk_base_type).

measured(s7, base_type, stone_ground).

all_consistent(base_type) :- consistent(s7, base_type).

evidence(all_consistent(base_type)).
query(true_val(base_type, stone_ground)).
query(true_val(base_type, unk_base_type)).

% @attr topsheet
% @type categorical
% @canonical true
% @original_name topsheet
% @values topless_topsheet=Topless_Topsheet durable_urethane=Durable_urethane_topsheet
% @importance 0.87

0.78::acc(s2, topsheet).
0.88::acc(s33, topsheet).

0.45::true_val(topsheet, topless_topsheet); 0.55::true_val(topsheet, durable_urethane).

measured(s2, topsheet, topless_topsheet).
measured(s33, topsheet, durable_urethane).

all_consistent(topsheet) :-
    (indep(s2), consistent(s2, topsheet) ; \+indep(s2)),
    consistent(s33, topsheet).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, topless_topsheet)).
query(true_val(topsheet, durable_urethane)).

% @attr resin
% @type categorical
% @canonical false
% @original_name resin
% @values bio_resin_plant=Bio_Resin_plant_based_epoxy unk_resin=Unknown
% @importance 0.5

0.88::acc(s43, resin).

0.81::true_val(resin, bio_resin_plant); 0.19::true_val(resin, unk_resin).

measured(s43, resin, bio_resin_plant).

all_consistent(resin) :- consistent(s43, resin).

evidence(all_consistent(resin)).
query(true_val(resin, bio_resin_plant)).
query(true_val(resin, unk_resin)).

% @attr sustainability_certification_wax
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values wend_meadowfoam=WEND_Meadowfoam_biodegradable_wax unk_sustainability_certification_wax=Unknown
% @importance 0.5

0.88::acc(s43, sustainability_certification_wax).

0.81::true_val(sustainability_certification_wax, wend_meadowfoam); 0.19::true_val(sustainability_certification_wax, unk_sustainability_certification_wax).

measured(s43, sustainability_certification_wax, wend_meadowfoam).

all_consistent(sustainability_certification_wax) :- consistent(s43, sustainability_certification_wax).

evidence(all_consistent(sustainability_certification_wax)).
query(true_val(sustainability_certification_wax, wend_meadowfoam)).
query(true_val(sustainability_certification_wax, unk_sustainability_certification_wax)).

% @attr edge_technology
% @type categorical
% @canonical false
% @original_name edge_technology
% @values standard_steel=Standard_steel_edge unk_edge_technology=Unknown
% @importance 1.0

0.82::acc(s2, edge_technology).

0.81::true_val(edge_technology, standard_steel); 0.19::true_val(edge_technology, unk_edge_technology).

measured(s2, edge_technology, standard_steel).

all_consistent(edge_technology) :- consistent(s2, edge_technology).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, standard_steel)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr sustainability_certification_edges
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values recycled_30pct_edges=Edges_30pct_recycled_materials unk_sustainability_certification_edges=Unknown
% @importance 0.7

0.88::acc(s7, sustainability_certification_edges).

0.86::true_val(sustainability_certification_edges, recycled_30pct_edges); 0.14::true_val(sustainability_certification_edges, unk_sustainability_certification_edges).

measured(s7, sustainability_certification_edges, recycled_30pct_edges).

all_consistent(sustainability_certification_edges) :- consistent(s7, sustainability_certification_edges).

evidence(all_consistent(sustainability_certification_edges)).
query(true_val(sustainability_certification_edges, recycled_30pct_edges)).
query(true_val(sustainability_certification_edges, unk_sustainability_certification_edges)).

% @attr construction_material_innovation_thin_con
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values thin_con=Thin_Con_tapered_tips_tails unk_construction_material_innovation_thin_con=Unknown
% @importance 0.5

0.65::acc(s44, construction_material_innovation_thin_con).

0.63::true_val(construction_material_innovation_thin_con, thin_con); 0.37::true_val(construction_material_innovation_thin_con, unk_construction_material_innovation_thin_con).

measured(s44, construction_material_innovation_thin_con, thin_con).

all_consistent(construction_material_innovation_thin_con) :-
    (indep(s44), consistent(s44, construction_material_innovation_thin_con) ; \+indep(s44)).

evidence(all_consistent(construction_material_innovation_thin_con)).
query(true_val(construction_material_innovation_thin_con, thin_con)).
query(true_val(construction_material_innovation_thin_con, unk_construction_material_innovation_thin_con)).

% @attr nose_description
% @type categorical
% @canonical false
% @original_name Nose description
% @values long_floaty=Long_floaty_nose_powder_float unk_nose_description=Unknown
% @importance 1.0

0.82::acc(s2, nose_description).

0.81::true_val(nose_description, long_floaty); 0.19::true_val(nose_description, unk_nose_description).

measured(s2, nose_description, long_floaty).

all_consistent(nose_description) :- consistent(s2, nose_description).

evidence(all_consistent(nose_description)).
query(true_val(nose_description, long_floaty)).
query(true_val(nose_description, unk_nose_description)).

% @attr sustainability_certification_fsc
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values fsc_certified=FSC_Certified_stickers_shipping_boxes unk_sustainability_certification_fsc=Unknown
% @importance 0.7

0.88::acc(s7, sustainability_certification_fsc).

0.86::true_val(sustainability_certification_fsc, fsc_certified); 0.14::true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc).

measured(s7, sustainability_certification_fsc, fsc_certified).

all_consistent(sustainability_certification_fsc) :- consistent(s7, sustainability_certification_fsc).

evidence(all_consistent(sustainability_certification_fsc)).
query(true_val(sustainability_certification_fsc, fsc_certified)).
query(true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc)).

% @attr sustainability_certification_bio_resin
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values bio_resin_reduced_carbon=Plant_based_epoxy_reduced_carbon unk_sustainability_certification_bio_resin=Unknown
% @importance 0.5

0.88::acc(s43, sustainability_certification_bio_resin).

0.81::true_val(sustainability_certification_bio_resin, bio_resin_reduced_carbon); 0.19::true_val(sustainability_certification_bio_resin, unk_sustainability_certification_bio_resin).

measured(s43, sustainability_certification_bio_resin, bio_resin_reduced_carbon).

all_consistent(sustainability_certification_bio_resin) :- consistent(s43, sustainability_certification_bio_resin).

evidence(all_consistent(sustainability_certification_bio_resin)).
query(true_val(sustainability_certification_bio_resin, bio_resin_reduced_carbon)).
query(true_val(sustainability_certification_bio_resin, unk_sustainability_certification_bio_resin)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values alternative_freeride=Alternative_Freeride unk_riding_style=Unknown
% @importance 0.9

0.78::acc(s23, riding_style).

0.72::true_val(riding_style, alternative_freeride); 0.28::true_val(riding_style, unk_riding_style).

measured(s23, riding_style, alternative_freeride).

all_consistent(riding_style) :- consistent(s23, riding_style).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, alternative_freeride)).
query(true_val(riding_style, unk_riding_style)).

% @attr powder_rating_tgr
% @type categorical
% @canonical true
% @original_name powder_rating_tgr
% @values great=Great unk_powder_rating_tgr=Unknown
% @importance 0.9

0.78::acc(s23, powder_rating_tgr).

0.72::true_val(powder_rating_tgr, great); 0.28::true_val(powder_rating_tgr, unk_powder_rating_tgr).

measured(s23, powder_rating_tgr, great).

all_consistent(powder_rating_tgr) :- consistent(s23, powder_rating_tgr).

evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, great)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values good=Good unk_base_glide_performance=Unknown
% @importance 0.9

0.78::acc(s23, base_glide_performance).

0.72::true_val(base_glide_performance, good); 0.28::true_val(base_glide_performance, unk_base_glide_performance).

measured(s23, base_glide_performance, good).

all_consistent(base_glide_performance) :- consistent(s23, base_glide_performance).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, good)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr carving_rating_tgr
% @type categorical
% @canonical true
% @original_name carving_rating_tgr
% @values good=Good unk_carving_rating_tgr=Unknown
% @importance 0.9

0.78::acc(s23, carving_rating_tgr).

0.72::true_val(carving_rating_tgr, good); 0.28::true_val(carving_rating_tgr, unk_carving_rating_tgr).

measured(s23, carving_rating_tgr, good).

all_consistent(carving_rating_tgr) :- consistent(s23, carving_rating_tgr).

evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, good)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

% @attr speed_rating_tgr
% @type categorical
% @canonical true
% @original_name speed_rating_tgr
% @values good=Good unk_speed_rating_tgr=Unknown
% @importance 0.9

0.78::acc(s23, speed_rating_tgr).

0.72::true_val(speed_rating_tgr, good); 0.28::true_val(speed_rating_tgr, unk_speed_rating_tgr).

measured(s23, speed_rating_tgr, good).

all_consistent(speed_rating_tgr) :- consistent(s23, speed_rating_tgr).

evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, good)).
query(true_val(speed_rating_tgr, unk_speed_rating_tgr)).

% @attr uneven_snow_rating
% @type categorical
% @canonical false
% @original_name Uneven snow rating
% @values good=Good unk_uneven_snow_rating=Unknown
% @importance 0.9

0.78::acc(s23, uneven_snow_rating).

0.72::true_val(uneven_snow_rating, good); 0.28::true_val(uneven_snow_rating, unk_uneven_snow_rating).

measured(s23, uneven_snow_rating, good).

all_consistent(uneven_snow_rating) :- consistent(s23, uneven_snow_rating).

evidence(all_consistent(uneven_snow_rating)).
query(true_val(uneven_snow_rating, good)).
query(true_val(uneven_snow_rating, unk_uneven_snow_rating)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values average=Average unk_switch_riding=Unknown
% @importance 0.9

0.78::acc(s23, switch_riding).

0.72::true_val(switch_riding, average); 0.28::true_val(switch_riding, unk_switch_riding).

measured(s23, switch_riding, average).

all_consistent(switch_riding) :- consistent(s23, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, average)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr jumps_rating_tgr
% @type categorical
% @canonical true
% @original_name jumps_rating_tgr
% @values good=Good unk_jumps_rating_tgr=Unknown
% @importance 0.9

0.78::acc(s23, jumps_rating_tgr).

0.72::true_val(jumps_rating_tgr, good); 0.28::true_val(jumps_rating_tgr, unk_jumps_rating_tgr).

measured(s23, jumps_rating_tgr, good).

all_consistent(jumps_rating_tgr) :- consistent(s23, jumps_rating_tgr).

evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, good)).
query(true_val(jumps_rating_tgr, unk_jumps_rating_tgr)).

% @attr jibbing_rating_tgr
% @type categorical
% @canonical true
% @original_name jibbing_rating_tgr
% @values average=Average unk_jibbing_rating_tgr=Unknown
% @importance 0.9

0.78::acc(s23, jibbing_rating_tgr).

0.72::true_val(jibbing_rating_tgr, average); 0.28::true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr).

measured(s23, jibbing_rating_tgr, average).

all_consistent(jibbing_rating_tgr) :- consistent(s23, jibbing_rating_tgr).

evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, average)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr)).

% @attr pipe_rating_tgr
% @type categorical
% @canonical true
% @original_name pipe_rating_tgr
% @values good=Good unk_pipe_rating_tgr=Unknown
% @importance 0.9

0.78::acc(s23, pipe_rating_tgr).

0.72::true_val(pipe_rating_tgr, good); 0.28::true_val(pipe_rating_tgr, unk_pipe_rating_tgr).

measured(s23, pipe_rating_tgr, good).

all_consistent(pipe_rating_tgr) :- consistent(s23, pipe_rating_tgr).

evidence(all_consistent(pipe_rating_tgr)).
query(true_val(pipe_rating_tgr, good)).
query(true_val(pipe_rating_tgr, unk_pipe_rating_tgr)).

% @attr on_snow_feel_tgr
% @type categorical
% @canonical true
% @original_name on_snow_feel_tgr
% @values stable=Stable unk_on_snow_feel_tgr=Unknown
% @importance 0.9

0.78::acc(s23, on_snow_feel_tgr).

0.72::true_val(on_snow_feel_tgr, stable); 0.28::true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr).

measured(s23, on_snow_feel_tgr, stable).

all_consistent(on_snow_feel_tgr) :- consistent(s23, on_snow_feel_tgr).

evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, stable)).
query(true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values medium=Medium unk_turn_initiation_performance=Unknown
% @importance 0.9

0.78::acc(s23, turn_initiation_performance).

0.72::true_val(turn_initiation_performance, medium); 0.28::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s23, turn_initiation_performance, medium).

all_consistent(turn_initiation_performance) :- consistent(s23, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, medium)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr skidded_turns
% @type categorical
% @canonical false
% @original_name Skidded turns
% @values semi_easy=Semi_Easy unk_skidded_turns=Unknown
% @importance 0.9

0.78::acc(s23, skidded_turns).

0.72::true_val(skidded_turns, semi_easy); 0.28::true_val(skidded_turns, unk_skidded_turns).

measured(s23, skidded_turns, semi_easy).

all_consistent(skidded_turns) :- consistent(s23, skidded_turns).

evidence(all_consistent(skidded_turns)).
query(true_val(skidded_turns, semi_easy)).
query(true_val(skidded_turns, unk_skidded_turns)).

% @attr flex_rating_10_the_good_ride
% @type categorical
% @canonical false
% @original_name flex_rating_10_the_good_ride
% @values medium=Medium unk_flex_rating_10_the_good_ride=Unknown
% @importance 0.9

0.78::acc(s23, flex_rating_10_the_good_ride).

0.72::true_val(flex_rating_10_the_good_ride, medium); 0.28::true_val(flex_rating_10_the_good_ride, unk_flex_rating_10_the_good_ride).

measured(s23, flex_rating_10_the_good_ride, medium).

all_consistent(flex_rating_10_the_good_ride) :- consistent(s23, flex_rating_10_the_good_ride).

evidence(all_consistent(flex_rating_10_the_good_ride)).
query(true_val(flex_rating_10_the_good_ride, medium)).
query(true_val(flex_rating_10_the_good_ride, unk_flex_rating_10_the_good_ride)).

% @attr buttering
% @type categorical
% @canonical false
% @original_name Buttering
% @values semi_easy=Semi_Easy unk_buttering=Unknown
% @importance 0.9

0.78::acc(s23, buttering).

0.72::true_val(buttering, semi_easy); 0.28::true_val(buttering, unk_buttering).

measured(s23, buttering, semi_easy).

all_consistent(buttering) :- consistent(s23, buttering).

evidence(all_consistent(buttering)).
query(true_val(buttering, semi_easy)).
query(true_val(buttering, unk_buttering)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values hard_snow_capable=Hard_Snow_capable unk_edge_hold=Unknown
% @importance 0.9

0.78::acc(s23, edge_hold).

0.72::true_val(edge_hold, hard_snow_capable); 0.28::true_val(edge_hold, unk_edge_hold).

measured(s23, edge_hold, hard_snow_capable).

all_consistent(edge_hold) :- consistent(s23, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, hard_snow_capable)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr weight_feel
% @type categorical
% @canonical false
% @original_name Weight feel
% @values light_side_normal=Light_side_of_normal unk_weight_feel=Unknown
% @importance 0.9

0.78::acc(s23, weight_feel).

0.72::true_val(weight_feel, light_side_normal); 0.28::true_val(weight_feel, unk_weight_feel).

measured(s23, weight_feel, light_side_normal).

all_consistent(weight_feel) :- consistent(s23, weight_feel).

evidence(all_consistent(weight_feel)).
query(true_val(weight_feel, light_side_normal)).
query(true_val(weight_feel, unk_weight_feel)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values outstanding_volume_shifted_am=Outstanding_volume_shifted_all_mountain unk_positive_aspect=Unknown
% @importance 0.85

0.78::acc(s46, positive_aspect).

0.72::true_val(positive_aspect, outstanding_volume_shifted_am); 0.28::true_val(positive_aspect, unk_positive_aspect).

measured(s46, positive_aspect, outstanding_volume_shifted_am).

all_consistent(positive_aspect) :- consistent(s46, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, outstanding_volume_shifted_am)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr positive_aspect_lively_poppy
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values lively_poppy_easy_butter=Lively_poppy_easy_to_butter_not_chattery unk_positive_aspect_lively_poppy=Unknown
% @importance 0.8

0.72::acc(s45, positive_aspect_lively_poppy).

0.64::true_val(positive_aspect_lively_poppy, lively_poppy_easy_butter); 0.36::true_val(positive_aspect_lively_poppy, unk_positive_aspect_lively_poppy).

measured(s45, positive_aspect_lively_poppy, lively_poppy_easy_butter).

all_consistent(positive_aspect_lively_poppy) :- consistent(s45, positive_aspect_lively_poppy).

evidence(all_consistent(positive_aspect_lively_poppy)).
query(true_val(positive_aspect_lively_poppy, lively_poppy_easy_butter)).
query(true_val(positive_aspect_lively_poppy, unk_positive_aspect_lively_poppy)).

% @attr positive_aspect_powder_float
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values better_powder_float=Better_float_than_Warpig_Superpig unk_positive_aspect_powder_float=Unknown
% @importance 0.9

0.78::acc(s23, positive_aspect_powder_float).

0.72::true_val(positive_aspect_powder_float, better_powder_float); 0.28::true_val(positive_aspect_powder_float, unk_positive_aspect_powder_float).

measured(s23, positive_aspect_powder_float, better_powder_float).

all_consistent(positive_aspect_powder_float) :- consistent(s23, positive_aspect_powder_float).

evidence(all_consistent(positive_aspect_powder_float)).
query(true_val(positive_aspect_powder_float, better_powder_float)).
query(true_val(positive_aspect_powder_float, unk_positive_aspect_powder_float)).

% @attr positive_aspect_edge_hold
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values excellent_edge_hold=Excellent_edge_hold unk_positive_aspect_edge_hold=Unknown
% @importance 0.85

0.78::acc(s46, positive_aspect_edge_hold).

0.72::true_val(positive_aspect_edge_hold, excellent_edge_hold); 0.28::true_val(positive_aspect_edge_hold, unk_positive_aspect_edge_hold).

measured(s46, positive_aspect_edge_hold, excellent_edge_hold).

all_consistent(positive_aspect_edge_hold) :- consistent(s46, positive_aspect_edge_hold).

evidence(all_consistent(positive_aspect_edge_hold)).
query(true_val(positive_aspect_edge_hold, excellent_edge_hold)).
query(true_val(positive_aspect_edge_hold, unk_positive_aspect_edge_hold)).

% @attr positive_aspect_accessible
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values fun_for_all_not_boring=Anyone_can_have_fun_not_boring_for_experts unk_positive_aspect_accessible=Unknown
% @importance 0.8

0.72::acc(s45, positive_aspect_accessible).

0.64::true_val(positive_aspect_accessible, fun_for_all_not_boring); 0.36::true_val(positive_aspect_accessible, unk_positive_aspect_accessible).

measured(s45, positive_aspect_accessible, fun_for_all_not_boring).

all_consistent(positive_aspect_accessible) :- consistent(s45, positive_aspect_accessible).

evidence(all_consistent(positive_aspect_accessible)).
query(true_val(positive_aspect_accessible, fun_for_all_not_boring)).
query(true_val(positive_aspect_accessible, unk_positive_aspect_accessible)).

% @attr positive_aspect_smooth
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values light_lively_smooth=Light_lively_smooth_vibration_damped unk_positive_aspect_smooth=Unknown
% @importance 0.75

0.65::acc(s47, positive_aspect_smooth).

0.60::true_val(positive_aspect_smooth, light_lively_smooth); 0.40::true_val(positive_aspect_smooth, unk_positive_aspect_smooth).

measured(s47, positive_aspect_smooth, light_lively_smooth).

all_consistent(positive_aspect_smooth) :- consistent(s47, positive_aspect_smooth).

evidence(all_consistent(positive_aspect_smooth)).
query(true_val(positive_aspect_smooth, light_lively_smooth)).
query(true_val(positive_aspect_smooth, unk_positive_aspect_smooth)).

% @attr positive_aspect_turny_slashy
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values more_setback_turny_slashy=More_setback_narrower_turny_slashy unk_positive_aspect_turny_slashy=Unknown
% @importance 0.8

0.72::acc(s45, positive_aspect_turny_slashy).

0.64::true_val(positive_aspect_turny_slashy, more_setback_turny_slashy); 0.36::true_val(positive_aspect_turny_slashy, unk_positive_aspect_turny_slashy).

measured(s45, positive_aspect_turny_slashy, more_setback_turny_slashy).

all_consistent(positive_aspect_turny_slashy) :- consistent(s45, positive_aspect_turny_slashy).

evidence(all_consistent(positive_aspect_turny_slashy)).
query(true_val(positive_aspect_turny_slashy, more_setback_turny_slashy)).
query(true_val(positive_aspect_turny_slashy, unk_positive_aspect_turny_slashy)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values chatter_high_speed=Chattered_at_high_speeds unk_negative_aspect=Unknown
% @importance 0.85

0.78::acc(s46, negative_aspect).

0.72::true_val(negative_aspect, chatter_high_speed); 0.28::true_val(negative_aspect, unk_negative_aspect).

measured(s46, negative_aspect, chatter_high_speed).

all_consistent(negative_aspect) :- consistent(s46, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, chatter_high_speed)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_dampness
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values not_as_damp=Not_as_damp_as_Superpig_Warpig unk_negative_aspect_dampness=Unknown
% @importance 0.9

0.78::acc(s23, negative_aspect_dampness).

0.72::true_val(negative_aspect_dampness, not_as_damp); 0.28::true_val(negative_aspect_dampness, unk_negative_aspect_dampness).

measured(s23, negative_aspect_dampness, not_as_damp).

all_consistent(negative_aspect_dampness) :- consistent(s23, negative_aspect_dampness).

evidence(all_consistent(negative_aspect_dampness)).
query(true_val(negative_aspect_dampness, not_as_damp)).
query(true_val(negative_aspect_dampness, unk_negative_aspect_dampness)).

% @attr negative_aspect_carving
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values flat_rocker_carve_limit=Flat_Rocker_doesnt_carve_as_hard unk_negative_aspect_carving=Unknown
% @importance 0.9

0.78::acc(s23, negative_aspect_carving).

0.72::true_val(negative_aspect_carving, flat_rocker_carve_limit); 0.28::true_val(negative_aspect_carving, unk_negative_aspect_carving).

measured(s23, negative_aspect_carving, flat_rocker_carve_limit).

all_consistent(negative_aspect_carving) :- consistent(s23, negative_aspect_carving).

evidence(all_consistent(negative_aspect_carving)).
query(true_val(negative_aspect_carving, flat_rocker_carve_limit)).
query(true_val(negative_aspect_carving, unk_negative_aspect_carving)).

% @attr negative_aspect_switch
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values not_great_switch=Directional_not_as_good_switch unk_negative_aspect_switch=Unknown
% @importance 0.9

0.90::acc(s33, negative_aspect_switch).

0.86::true_val(negative_aspect_switch, not_great_switch); 0.14::true_val(negative_aspect_switch, unk_negative_aspect_switch).

measured(s33, negative_aspect_switch, not_great_switch).

all_consistent(negative_aspect_switch) :- consistent(s33, negative_aspect_switch).

evidence(all_consistent(negative_aspect_switch)).
query(true_val(negative_aspect_switch, not_great_switch)).
query(true_val(negative_aspect_switch, unk_negative_aspect_switch)).

% @attr negative_aspect_edge_effort
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values width_edge_effort=Volume_shifted_more_effort_to_edge unk_negative_aspect_edge_effort=Unknown
% @importance 0.75

0.65::acc(s47, negative_aspect_edge_effort).

0.60::true_val(negative_aspect_edge_effort, width_edge_effort); 0.40::true_val(negative_aspect_edge_effort, unk_negative_aspect_edge_effort).

measured(s47, negative_aspect_edge_effort, width_edge_effort).

all_consistent(negative_aspect_edge_effort) :- consistent(s47, negative_aspect_edge_effort).

evidence(all_consistent(negative_aspect_edge_effort)).
query(true_val(negative_aspect_edge_effort, width_edge_effort)).
query(true_val(negative_aspect_edge_effort, unk_negative_aspect_edge_effort)).

% @attr negative_aspect_trees
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values tree_transition_effort=Extra_effort_edge_transitions_trees unk_negative_aspect_trees=Unknown
% @importance 0.75

0.65::acc(s47, negative_aspect_trees).

0.60::true_val(negative_aspect_trees, tree_transition_effort); 0.40::true_val(negative_aspect_trees, unk_negative_aspect_trees).

measured(s47, negative_aspect_trees, tree_transition_effort).

all_consistent(negative_aspect_trees) :- consistent(s47, negative_aspect_trees).

evidence(all_consistent(negative_aspect_trees)).
query(true_val(negative_aspect_trees, tree_transition_effort)).
query(true_val(negative_aspect_trees, unk_negative_aspect_trees)).

% @attr negative_aspect_park
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values not_for_park=Not_designed_for_park unk_negative_aspect_park=Unknown
% @importance 0.65

0.78::acc(s48, negative_aspect_park).

0.72::true_val(negative_aspect_park, not_for_park); 0.28::true_val(negative_aspect_park, unk_negative_aspect_park).

measured(s48, negative_aspect_park, not_for_park).

all_consistent(negative_aspect_park) :- consistent(s48, negative_aspect_park).

evidence(all_consistent(negative_aspect_park)).
query(true_val(negative_aspect_park, not_for_park)).
query(true_val(negative_aspect_park, unk_negative_aspect_park)).

% @attr negative_aspect_moguls
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values moguls_feel_like_work=Large_mogul_field_feels_like_work unk_negative_aspect_moguls=Unknown
% @importance 0.75

0.65::acc(s47, negative_aspect_moguls).

0.60::true_val(negative_aspect_moguls, moguls_feel_like_work); 0.40::true_val(negative_aspect_moguls, unk_negative_aspect_moguls).

measured(s47, negative_aspect_moguls, moguls_feel_like_work).

all_consistent(negative_aspect_moguls) :- consistent(s47, negative_aspect_moguls).

evidence(all_consistent(negative_aspect_moguls)).
query(true_val(negative_aspect_moguls, moguls_feel_like_work)).
query(true_val(negative_aspect_moguls, unk_negative_aspect_moguls)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values whitelines_100_fun_nimble=Whitelines_100_fun_nimble_lighter unk_reviewer_opinion_whitelines=Unknown
% @importance 0.6

0.68::acc(s38, reviewer_opinion_whitelines).

0.60::true_val(reviewer_opinion_whitelines, whitelines_100_fun_nimble); 0.40::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

measured(s38, reviewer_opinion_whitelines, whitelines_100_fun_nimble).

all_consistent(reviewer_opinion_whitelines) :- consistent(s38, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, whitelines_100_fun_nimble)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

% @attr review_evo_field_tested
% @type categorical
% @canonical false
% @original_name Review — evo Field Tested
% @values positive_3_testers=3_experienced_testers_positive unk_review_evo_field_tested=Unknown
% @importance 0.85

0.78::acc(s46, review_evo_field_tested).

0.72::true_val(review_evo_field_tested, positive_3_testers); 0.28::true_val(review_evo_field_tested, unk_review_evo_field_tested).

measured(s46, review_evo_field_tested, positive_3_testers).

all_consistent(review_evo_field_tested) :- consistent(s46, review_evo_field_tested).

evidence(all_consistent(review_evo_field_tested)).
query(true_val(review_evo_field_tested, positive_3_testers)).
query(true_val(review_evo_field_tested, unk_review_evo_field_tested)).

% @attr review_curated_expert
% @type categorical
% @canonical false
% @original_name Review — Curated.com expert
% @values middle_ground_warpig_superpig=Perfect_middle_ground_Warpig_Superpig unk_review_curated_expert=Unknown
% @importance 0.85

0.68::acc(s36, review_curated_expert).

0.63::true_val(review_curated_expert, middle_ground_warpig_superpig); 0.37::true_val(review_curated_expert, unk_review_curated_expert).

measured(s36, review_curated_expert, middle_ground_warpig_superpig).

all_consistent(review_curated_expert) :- consistent(s36, review_curated_expert).

evidence(all_consistent(review_curated_expert)).
query(true_val(review_curated_expert, middle_ground_warpig_superpig)).
query(true_val(review_curated_expert, unk_review_curated_expert)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values great_middle_ground=Great_middle_ground_volume_shift unk_user_review_forum=Unknown
% @importance 0.5

0.35::acc(s49, user_review_forum).

0.26::true_val(user_review_forum, great_middle_ground); 0.74::true_val(user_review_forum, unk_user_review_forum).

measured(s49, user_review_forum, great_middle_ground).

all_consistent(user_review_forum) :- consistent(s49, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, great_middle_ground)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values warpig_comparison=Warpig_wider_stiffer_twin_sidecut_more_centered unk_comparable_board_same_brand=Unknown
% @importance 0.87

0.78::acc(s23, comparable_board_same_brand).
0.78::acc(s46, comparable_board_same_brand).

0.95::true_val(comparable_board_same_brand, warpig_comparison); 0.05::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s23, comparable_board_same_brand, warpig_comparison).
measured(s46, comparable_board_same_brand, warpig_comparison).

all_consistent(comparable_board_same_brand) :- consistent(s23, comparable_board_same_brand), consistent(s46, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, warpig_comparison)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_superpig
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values superpig_comparison=Superpig_stiffer_aggressive_hybrid_camber unk_comparable_board_same_brand_superpig=Unknown
% @importance 0.9

0.78::acc(s18, comparable_board_same_brand_superpig).
0.68::acc(s36, comparable_board_same_brand_superpig).

0.95::true_val(comparable_board_same_brand_superpig, superpig_comparison); 0.05::true_val(comparable_board_same_brand_superpig, unk_comparable_board_same_brand_superpig).

measured(s18, comparable_board_same_brand_superpig, superpig_comparison).
measured(s36, comparable_board_same_brand_superpig, superpig_comparison).

all_consistent(comparable_board_same_brand_superpig) :- consistent(s18, comparable_board_same_brand_superpig), consistent(s36, comparable_board_same_brand_superpig).

evidence(all_consistent(comparable_board_same_brand_superpig)).
query(true_val(comparable_board_same_brand_superpig, superpig_comparison)).
query(true_val(comparable_board_same_brand_superpig, unk_comparable_board_same_brand_superpig)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values salomon_dancehaul_pro=Salomon_Dancehaul_Pro_easier_engage_snap unk_comparable_board_cross_brand=Unknown
% @importance 0.85

0.68::acc(s36, comparable_board_cross_brand).

0.63::true_val(comparable_board_cross_brand, salomon_dancehaul_pro); 0.37::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s36, comparable_board_cross_brand, salomon_dancehaul_pro).

all_consistent(comparable_board_cross_brand) :- consistent(s36, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, salomon_dancehaul_pro)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_mind_expander
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values jones_mind_expander=Jones_Mind_Expander_better_hardpack unk_comparable_board_cross_brand_mind_expander=Unknown
% @importance 0.85

0.68::acc(s36, comparable_board_cross_brand_mind_expander).

0.63::true_val(comparable_board_cross_brand_mind_expander, jones_mind_expander); 0.37::true_val(comparable_board_cross_brand_mind_expander, unk_comparable_board_cross_brand_mind_expander).

measured(s36, comparable_board_cross_brand_mind_expander, jones_mind_expander).

all_consistent(comparable_board_cross_brand_mind_expander) :- consistent(s36, comparable_board_cross_brand_mind_expander).

evidence(all_consistent(comparable_board_cross_brand_mind_expander)).
query(true_val(comparable_board_cross_brand_mind_expander, jones_mind_expander)).
query(true_val(comparable_board_cross_brand_mind_expander, unk_comparable_board_cross_brand_mind_expander)).

% @attr comparable_board_cross_brand_party_platter
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values k2_party_platter=K2_Party_Platter_more_stable_variable unk_comparable_board_cross_brand_party_platter=Unknown
% @importance 0.85

0.68::acc(s36, comparable_board_cross_brand_party_platter).

0.63::true_val(comparable_board_cross_brand_party_platter, k2_party_platter); 0.37::true_val(comparable_board_cross_brand_party_platter, unk_comparable_board_cross_brand_party_platter).

measured(s36, comparable_board_cross_brand_party_platter, k2_party_platter).

all_consistent(comparable_board_cross_brand_party_platter) :- consistent(s36, comparable_board_cross_brand_party_platter).

evidence(all_consistent(comparable_board_cross_brand_party_platter)).
query(true_val(comparable_board_cross_brand_party_platter, k2_party_platter)).
query(true_val(comparable_board_cross_brand_party_platter, unk_comparable_board_cross_brand_party_platter)).

% @attr comparable_board_cross_brand_others
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values orca_harpoon_hybrid_pyre=Lib_Tech_Orca_NS_Harpoon_Yes_Hybrid_Niche_Pyre unk_comparable_board_cross_brand_others=Unknown
% @importance 0.9

0.78::acc(s23, comparable_board_cross_brand_others).

0.72::true_val(comparable_board_cross_brand_others, orca_harpoon_hybrid_pyre); 0.28::true_val(comparable_board_cross_brand_others, unk_comparable_board_cross_brand_others).

measured(s23, comparable_board_cross_brand_others, orca_harpoon_hybrid_pyre).

all_consistent(comparable_board_cross_brand_others) :- consistent(s23, comparable_board_cross_brand_others).

evidence(all_consistent(comparable_board_cross_brand_others)).
query(true_val(comparable_board_cross_brand_others, orca_harpoon_hybrid_pyre)).
query(true_val(comparable_board_cross_brand_others, unk_comparable_board_cross_brand_others)).

% @attr retailer_info_evo
% @type categorical
% @canonical false
% @original_name evo
% @values major_us_retailer=Major_US_retailer_free_shipping_lowest_price unk_retailer_info_evo=Unknown
% @importance 0.95

0.85::acc(s18, retailer_info_evo).

0.81::true_val(retailer_info_evo, major_us_retailer); 0.19::true_val(retailer_info_evo, unk_retailer_info_evo).

measured(s18, retailer_info_evo, major_us_retailer).

all_consistent(retailer_info_evo) :- consistent(s18, retailer_info_evo).

evidence(all_consistent(retailer_info_evo)).
query(true_val(retailer_info_evo, major_us_retailer)).
query(true_val(retailer_info_evo, unk_retailer_info_evo)).

% @attr retailer_info_tactics
% @type categorical
% @canonical false
% @original_name Tactics
% @values established_us_shop=Established_US_board_shop_low_price_guarantee unk_retailer_info_tactics=Unknown
% @importance 0.85

0.75::acc(s20, retailer_info_tactics).

0.72::true_val(retailer_info_tactics, established_us_shop); 0.28::true_val(retailer_info_tactics, unk_retailer_info_tactics).

measured(s20, retailer_info_tactics, established_us_shop).

all_consistent(retailer_info_tactics) :- consistent(s20, retailer_info_tactics).

evidence(all_consistent(retailer_info_tactics)).
query(true_val(retailer_info_tactics, established_us_shop)).
query(true_val(retailer_info_tactics, unk_retailer_info_tactics)).

% @attr retailer_info_backcountry
% @type categorical
% @canonical false
% @original_name Backcountry
% @values major_us_outdoor=Major_US_outdoor_retailer unk_retailer_info_backcountry=Unknown
% @importance 0.9

0.72::acc(s19, retailer_info_backcountry).

0.68::true_val(retailer_info_backcountry, major_us_outdoor); 0.32::true_val(retailer_info_backcountry, unk_retailer_info_backcountry).

measured(s19, retailer_info_backcountry, major_us_outdoor).

all_consistent(retailer_info_backcountry) :- consistent(s19, retailer_info_backcountry).

evidence(all_consistent(retailer_info_backcountry)).
query(true_val(retailer_info_backcountry, major_us_outdoor)).
query(true_val(retailer_info_backcountry, unk_retailer_info_backcountry)).

% @attr retailer_info_salty_peaks
% @type categorical
% @canonical false
% @original_name Salty Peaks
% @values specialist_decades=Decades_industry_leadership_specialist unk_retailer_info_salty_peaks=Unknown
% @importance 0.5

0.55::acc(s24, retailer_info_salty_peaks).

0.46::true_val(retailer_info_salty_peaks, specialist_decades); 0.54::true_val(retailer_info_salty_peaks, unk_retailer_info_salty_peaks).

measured(s24, retailer_info_salty_peaks, specialist_decades).

all_consistent(retailer_info_salty_peaks) :- consistent(s24, retailer_info_salty_peaks).

evidence(all_consistent(retailer_info_salty_peaks)).
query(true_val(retailer_info_salty_peaks, specialist_decades)).
query(true_val(retailer_info_salty_peaks, unk_retailer_info_salty_peaks)).

% @attr retailer_info_ballistyx
% @type categorical
% @canonical false
% @original_name Ballistyx
% @values trusted_melbourne_since_1991=Trusted_Melbourne_store_since_1991 unk_retailer_info_ballistyx=Unknown
% @importance 0.35

0.52::acc(s50, retailer_info_ballistyx).

0.48::true_val(retailer_info_ballistyx, trusted_melbourne_since_1991); 0.52::true_val(retailer_info_ballistyx, unk_retailer_info_ballistyx).

measured(s50, retailer_info_ballistyx, trusted_melbourne_since_1991).

all_consistent(retailer_info_ballistyx) :- consistent(s50, retailer_info_ballistyx).

evidence(all_consistent(retailer_info_ballistyx)).
query(true_val(retailer_info_ballistyx, trusted_melbourne_since_1991)).
query(true_val(retailer_info_ballistyx, unk_retailer_info_ballistyx)).

% @attr retailer_info_melbourne_sc
% @type categorical
% @canonical false
% @original_name Melbourne Snowboard Centre
% @values local_independent_au=Local_independently_owned_Australian_store unk_retailer_info_melbourne_sc=Unknown
% @importance 0.6

0.62::acc(s16, retailer_info_melbourne_sc).

0.60::true_val(retailer_info_melbourne_sc, local_independent_au); 0.40::true_val(retailer_info_melbourne_sc, unk_retailer_info_melbourne_sc).

measured(s16, retailer_info_melbourne_sc, local_independent_au).

all_consistent(retailer_info_melbourne_sc) :-
    (indep(s16), consistent(s16, retailer_info_melbourne_sc) ; \+indep(s16)).

evidence(all_consistent(retailer_info_melbourne_sc)).
query(true_val(retailer_info_melbourne_sc, local_independent_au)).
query(true_val(retailer_info_melbourne_sc, unk_retailer_info_melbourne_sc)).

% @attr brand_reputation
% @type categorical
% @canonical false
% @original_name Ride Snowboards brand reputation
% @values tech_performance_reliable=Known_for_technology_performance_reliability unk_brand_reputation=Unknown
% @importance 0.45

0.52::acc(s51, brand_reputation).

0.45::true_val(brand_reputation, tech_performance_reliable); 0.55::true_val(brand_reputation, unk_brand_reputation).

measured(s51, brand_reputation, tech_performance_reliable).

all_consistent(brand_reputation) :- consistent(s51, brand_reputation).

evidence(all_consistent(brand_reputation)).
query(true_val(brand_reputation, tech_performance_reliable)).
query(true_val(brand_reputation, unk_brand_reputation)).