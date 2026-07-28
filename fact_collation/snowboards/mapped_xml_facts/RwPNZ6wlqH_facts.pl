0.15::indep(s_m).
0.15::indep(s17).
0.15::indep(s24).
0.20::indep(s5).
0.20::indep(s12).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values gnu=GNU unk_brand=Unknown
% @importance 1.0

0.93::acc(s13, brand).

0.95::true_val(brand, gnu); 0.05::true_val(brand, unk_brand).

measured(s13, brand, gnu).

all_consistent(brand) :- consistent(s13, brand).

evidence(all_consistent(brand)).
query(true_val(brand, gnu)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values money=Money unk_model_name=Unknown
% @importance 1.0

0.93::acc(s13, model_name).

0.95::true_val(model_name, money); 0.05::true_val(model_name, unk_model_name).

measured(s13, model_name, money).

all_consistent(model_name) :- consistent(s13, model_name).

evidence(all_consistent(model_name)).
query(true_val(model_name, money)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values v2025=2025 v2026=2026
% @importance 0.75

0.75::acc(s2, model_year).
0.80::acc(s3, model_year).

0.50::true_val(model_year, v2025); 0.50::true_val(model_year, v2026).

measured(s2, model_year, v2025).
measured(s3, model_year, v2026).

all_consistent(model_year) :- consistent(s2, model_year), consistent(s3, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, v2025)).
query(true_val(model_year, v2026)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.95::acc(s13, product_type).

0.95::true_val(product_type, snowboard); 0.05::true_val(product_type, unk_product_type).

measured(s13, product_type, snowboard).

all_consistent(product_type) :- consistent(s13, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values freestyle_park=Freestyle_Park unk_board_category=Unknown
% @importance 1.0

0.93::acc(s13, board_category).

0.95::true_val(board_category, freestyle_park); 0.05::true_val(board_category, unk_board_category).

measured(s13, board_category, freestyle_park).

all_consistent(board_category) :- consistent(s13, board_category).

evidence(all_consistent(board_category)).
query(true_val(board_category, freestyle_park)).
query(true_val(board_category, unk_board_category)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values true_twin=True_Twin directional_twin=Directional_Twin
% @importance 0.93

0.95::acc(s13, shape).
0.85::acc(s15, shape).

0.75::true_val(shape, true_twin); 0.25::true_val(shape, directional_twin).

measured(s13, shape, true_twin).
measured(s_m, shape, true_twin).
measured(s15, shape, directional_twin).

all_consistent(shape) :-
    consistent(s13, shape),
    consistent(s15, shape),
    (indep(s_m), consistent(s_m, shape) ; \+indep(s_m)).

evidence(all_consistent(shape)).
query(true_val(shape, true_twin)).
query(true_val(shape, directional_twin)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values mervin_manufacturing=Mervin_Manufacturing unk_manufacturer=Unknown
% @importance 0.7

0.95::acc(s4, manufacturer).

0.95::true_val(manufacturer, mervin_manufacturing); 0.05::true_val(manufacturer, unk_manufacturer).

measured(s4, manufacturer, mervin_manufacturing).

all_consistent(manufacturer) :- consistent(s4, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, mervin_manufacturing)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values carlsborg_wa_usa=Carlsborg_WA_USA unk_manufacturing_location=Unknown
% @importance 0.7

0.80::acc(s5, manufacturing_location).

0.76::true_val(manufacturing_location, carlsborg_wa_usa); 0.24::true_val(manufacturing_location, unk_manufacturing_location).

measured(s5, manufacturing_location, carlsborg_wa_usa).

all_consistent(manufacturing_location) :- consistent(s5, manufacturing_location).

evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, carlsborg_wa_usa)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

% @attr mervin_founded
% @type categorical
% @canonical false
% @original_name Mervin Manufacturing founded
% @values founded_1977=1977_Mike_Olson_Pete_Saari unk_mervin_founded=Unknown
% @importance 0.3

0.93::acc(s6, mervin_founded).

0.90::true_val(mervin_founded, founded_1977); 0.10::true_val(mervin_founded, unk_mervin_founded).

measured(s6, mervin_founded, founded_1977).

all_consistent(mervin_founded) :- consistent(s6, mervin_founded).

evidence(all_consistent(mervin_founded)).
query(true_val(mervin_founded, founded_1977)).
query(true_val(mervin_founded, unk_mervin_founded)).

% @attr mervin_status
% @type categorical
% @canonical false
% @original_name Mervin status
% @values longest_running_usa=Longest_running_last_major_USA_factory unk_mervin_status=Unknown
% @importance 0.6

0.82::acc(s7, mervin_status).

0.77::true_val(mervin_status, longest_running_usa); 0.23::true_val(mervin_status, unk_mervin_status).

measured(s7, mervin_status, longest_running_usa).

all_consistent(mervin_status) :- consistent(s7, mervin_status).

evidence(all_consistent(mervin_status)).
query(true_val(mervin_status, longest_running_usa)).
query(true_val(mervin_status, unk_mervin_status)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values zero_hazardous_waste=Zero_hazardous_waste_factory unk_sustainability_certification=Unknown
% @importance 0.4

0.85::acc(s8, sustainability_certification).
0.78::acc(s11, sustainability_certification).

0.95::true_val(sustainability_certification, zero_hazardous_waste); 0.05::true_val(sustainability_certification, unk_sustainability_certification).

measured(s8, sustainability_certification, zero_hazardous_waste).
measured(s11, sustainability_certification, zero_hazardous_waste).

all_consistent(sustainability_certification) :-
    consistent(s8, sustainability_certification),
    consistent(s11, sustainability_certification).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, zero_hazardous_waste)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr sustainability_certification_hydro
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values hydro_89_6_pct=WA_electricity_89_6pct_hydroelectric unk_sustainability_certification_hydro=Unknown
% @importance 0.35

0.78::acc(s9, sustainability_certification_hydro).

0.68::true_val(sustainability_certification_hydro, hydro_89_6_pct); 0.32::true_val(sustainability_certification_hydro, unk_sustainability_certification_hydro).

measured(s9, sustainability_certification_hydro, hydro_89_6_pct).

all_consistent(sustainability_certification_hydro) :- consistent(s9, sustainability_certification_hydro).

evidence(all_consistent(sustainability_certification_hydro)).
query(true_val(sustainability_certification_hydro, hydro_89_6_pct)).
query(true_val(sustainability_certification_hydro, unk_sustainability_certification_hydro)).

% @attr sustainability_certification_biodiesel
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values renewable_biodiesel=Renewable_based_biodiesel unk_sustainability_certification_biodiesel=Unknown
% @importance 0.35

0.78::acc(s9, sustainability_certification_biodiesel).

0.68::true_val(sustainability_certification_biodiesel, renewable_biodiesel); 0.32::true_val(sustainability_certification_biodiesel, unk_sustainability_certification_biodiesel).

measured(s9, sustainability_certification_biodiesel, renewable_biodiesel).

all_consistent(sustainability_certification_biodiesel) :- consistent(s9, sustainability_certification_biodiesel).

evidence(all_consistent(sustainability_certification_biodiesel)).
query(true_val(sustainability_certification_biodiesel, renewable_biodiesel)).
query(true_val(sustainability_certification_biodiesel, unk_sustainability_certification_biodiesel)).

% @attr sustainability_certification_fsc
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values fsc_certified=FSC_certified_renewable_forest_products unk_sustainability_certification_fsc=Unknown
% @importance 0.45

0.83::acc(s10, sustainability_certification_fsc).

0.77::true_val(sustainability_certification_fsc, fsc_certified); 0.23::true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc).

measured(s10, sustainability_certification_fsc, fsc_certified).

all_consistent(sustainability_certification_fsc) :- consistent(s10, sustainability_certification_fsc).

evidence(all_consistent(sustainability_certification_fsc)).
query(true_val(sustainability_certification_fsc, fsc_certified)).
query(true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc)).

% @attr sustainability_certification_sawdust
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values sawdust_recycled=All_wood_sawdust_recycled_scrap_donated unk_sustainability_certification_sawdust=Unknown
% @importance 0.35

0.78::acc(s12, sustainability_certification_sawdust).

0.72::true_val(sustainability_certification_sawdust, sawdust_recycled); 0.28::true_val(sustainability_certification_sawdust, unk_sustainability_certification_sawdust).

measured(s12, sustainability_certification_sawdust, sawdust_recycled).

all_consistent(sustainability_certification_sawdust) :- consistent(s12, sustainability_certification_sawdust).

evidence(all_consistent(sustainability_certification_sawdust)).
query(true_val(sustainability_certification_sawdust, sawdust_recycled)).
query(true_val(sustainability_certification_sawdust, unk_sustainability_certification_sawdust)).

% @attr sustainability_certification_solvents
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values water_based_solvents=Water_based_solvents_not_petrochemical unk_sustainability_certification_solvents=Unknown
% @importance 0.35

0.78::acc(s12, sustainability_certification_solvents).

0.72::true_val(sustainability_certification_solvents, water_based_solvents); 0.28::true_val(sustainability_certification_solvents, unk_sustainability_certification_solvents).

measured(s12, sustainability_certification_solvents, water_based_solvents).

all_consistent(sustainability_certification_solvents) :- consistent(s12, sustainability_certification_solvents).

evidence(all_consistent(sustainability_certification_solvents)).
query(true_val(sustainability_certification_solvents, water_based_solvents)).
query(true_val(sustainability_certification_solvents, unk_sustainability_certification_solvents)).

% @attr graphic_designer_artist
% @type categorical
% @canonical false
% @original_name graphic_designer_artist
% @values jay_howell=Jay_Howell_punksgitcut unk_graphic_designer_artist=Unknown
% @importance 1.0

0.93::acc(s13, graphic_designer_artist).

0.90::true_val(graphic_designer_artist, jay_howell); 0.10::true_val(graphic_designer_artist, unk_graphic_designer_artist).

measured(s13, graphic_designer_artist, jay_howell).

all_consistent(graphic_designer_artist) :- consistent(s13, graphic_designer_artist).

evidence(all_consistent(graphic_designer_artist)).
query(true_val(graphic_designer_artist, jay_howell)).
query(true_val(graphic_designer_artist, unk_graphic_designer_artist)).

% @attr gnu_brand_reputation
% @type categorical
% @canonical false
% @original_name GNU brand reputation
% @values rebellious_funky_cool=Rebellious_funky_unapologetically_cool unk_gnu_brand_reputation=Unknown
% @importance 0.3

0.65::acc(s14, gnu_brand_reputation).

0.49::true_val(gnu_brand_reputation, rebellious_funky_cool); 0.51::true_val(gnu_brand_reputation, unk_gnu_brand_reputation).

measured(s14, gnu_brand_reputation, rebellious_funky_cool).

all_consistent(gnu_brand_reputation) :- consistent(s14, gnu_brand_reputation).

evidence(all_consistent(gnu_brand_reputation)).
query(true_val(gnu_brand_reputation, rebellious_funky_cool)).
query(true_val(gnu_brand_reputation, unk_gnu_brand_reputation)).

% @attr model_first_available_year
% @type categorical
% @canonical false
% @original_name model_first_available_year
% @values at_least_2018=At_least_2018_model_year unk_model_first_available_year=Unknown
% @importance 0.85

0.82::acc(s15, model_first_available_year).

0.72::true_val(model_first_available_year, at_least_2018); 0.28::true_val(model_first_available_year, unk_model_first_available_year).

measured(s15, model_first_available_year, at_least_2018).

all_consistent(model_first_available_year) :- consistent(s15, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, at_least_2018)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr gnu_money_2021_model
% @type categorical
% @canonical false
% @original_name GNU Money 2021 model
% @values listed_2021=Listed_on_snowboard_review unk_gnu_money_2021_model=Unknown
% @importance 0.3

0.55::acc(s16, gnu_money_2021_model).

0.48::true_val(gnu_money_2021_model, listed_2021); 0.52::true_val(gnu_money_2021_model, unk_gnu_money_2021_model).

measured(s16, gnu_money_2021_model, listed_2021).

all_consistent(gnu_money_2021_model) :- consistent(s16, gnu_money_2021_model).

evidence(all_consistent(gnu_money_2021_model)).
query(true_val(gnu_money_2021_model, listed_2021)).
query(true_val(gnu_money_2021_model, unk_gnu_money_2021_model)).

% @attr model_lineage
% @type categorical
% @canonical false
% @original_name GNU Money model lineage
% @values continuous=Continuous_lineup unk_model_lineage=Unknown
% @importance 0.85

0.80::acc(s15, model_lineage).

0.72::true_val(model_lineage, continuous); 0.28::true_val(model_lineage, unk_model_lineage).

measured(s15, model_lineage, continuous).

all_consistent(model_lineage) :- consistent(s15, model_lineage).

evidence(all_consistent(model_lineage)).
query(true_val(model_lineage, continuous)).
query(true_val(model_lineage, unk_model_lineage)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v449_99=449.99 v349=349.0
% @importance 0.93

0.95::acc(s13, price_usd_msrp).
0.60::acc(s15, price_usd_msrp).

0.80::true_val(price_usd_msrp, v449_99); 0.20::true_val(price_usd_msrp, v349).

measured(s13, price_usd_msrp, v449_99).
measured(s15, price_usd_msrp, v349).

all_consistent(price_usd_msrp) :-
    consistent(s13, price_usd_msrp),
    consistent(s15, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v449_99)).
query(true_val(price_usd_msrp, v349)).

% @attr price_usd_gnu_sale
% @type numeric
% @canonical false
% @original_name GNU.com sale price (2025-2026 A-grade, 30% off)
% @unit USD
% @values v314_99=314.99 unk_price_usd_gnu_sale=Unknown
% @importance 1.0

0.93::acc(s13, price_usd_gnu_sale).

0.90::true_val(price_usd_gnu_sale, v314_99); 0.10::true_val(price_usd_gnu_sale, unk_price_usd_gnu_sale).

measured(s13, price_usd_gnu_sale, v314_99).

all_consistent(price_usd_gnu_sale) :- consistent(s13, price_usd_gnu_sale).

evidence(all_consistent(price_usd_gnu_sale)).
query(true_val(price_usd_gnu_sale, v314_99)).
query(true_val(price_usd_gnu_sale, unk_price_usd_gnu_sale)).

% @attr price_usd_gnu_bgrade
% @type numeric
% @canonical false
% @original_name GNU.com sale price (2025 B-grade)
% @unit USD
% @values v251_99=251.99 unk_price_usd_gnu_bgrade=Unknown
% @importance 1.0

0.93::acc(s13, price_usd_gnu_bgrade).

0.90::true_val(price_usd_gnu_bgrade, v251_99); 0.10::true_val(price_usd_gnu_bgrade, unk_price_usd_gnu_bgrade).

measured(s13, price_usd_gnu_bgrade, v251_99).

all_consistent(price_usd_gnu_bgrade) :- consistent(s13, price_usd_gnu_bgrade).

evidence(all_consistent(price_usd_gnu_bgrade)).
query(true_val(price_usd_gnu_bgrade, v251_99)).
query(true_val(price_usd_gnu_bgrade, unk_price_usd_gnu_bgrade)).

% @attr price_usd_evo
% @type numeric
% @canonical true
% @original_name price_usd_evo
% @unit USD
% @values v314_99=314.99 unk_price_usd_evo=Unknown
% @importance 0.9

0.88::acc(s17, price_usd_evo).

0.85::true_val(price_usd_evo, v314_99); 0.15::true_val(price_usd_evo, unk_price_usd_evo).

measured(s17, price_usd_evo, v314_99).

all_consistent(price_usd_evo) :- consistent(s17, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v314_99)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_evo_rrp
% @type numeric
% @canonical false
% @original_name price_usd_evo
% @unit USD
% @values v449_99=449.99 unk_price_usd_evo_rrp=Unknown
% @importance 0.9

0.88::acc(s17, price_usd_evo_rrp).

0.85::true_val(price_usd_evo_rrp, v449_99); 0.15::true_val(price_usd_evo_rrp, unk_price_usd_evo_rrp).

measured(s17, price_usd_evo_rrp, v449_99).

all_consistent(price_usd_evo_rrp) :- consistent(s17, price_usd_evo_rrp).

evidence(all_consistent(price_usd_evo_rrp)).
query(true_val(price_usd_evo_rrp, v449_99)).
query(true_val(price_usd_evo_rrp, unk_price_usd_evo_rrp)).

% @attr price_usd_blauer
% @type numeric
% @canonical false
% @original_name Blauer Board Shop price
% @unit USD
% @values v314_99=314.99 unk_price_usd_blauer=Unknown
% @importance 0.85

0.78::acc(s15, price_usd_blauer).

0.72::true_val(price_usd_blauer, v314_99); 0.28::true_val(price_usd_blauer, unk_price_usd_blauer).

measured(s15, price_usd_blauer, v314_99).

all_consistent(price_usd_blauer) :- consistent(s15, price_usd_blauer).

evidence(all_consistent(price_usd_blauer)).
query(true_val(price_usd_blauer, v314_99)).
query(true_val(price_usd_blauer, unk_price_usd_blauer)).

% @attr price_usd_sun_ski
% @type numeric
% @canonical false
% @original_name Sun & Ski Sports price
% @unit USD
% @values v359_93=359.93 unk_price_usd_sun_ski=Unknown
% @importance 0.85

0.78::acc(s15, price_usd_sun_ski).

0.72::true_val(price_usd_sun_ski, v359_93); 0.28::true_val(price_usd_sun_ski, unk_price_usd_sun_ski).

measured(s15, price_usd_sun_ski, v359_93).

all_consistent(price_usd_sun_ski) :- consistent(s15, price_usd_sun_ski).

evidence(all_consistent(price_usd_sun_ski)).
query(true_val(price_usd_sun_ski, v359_93)).
query(true_val(price_usd_sun_ski, unk_price_usd_sun_ski)).

% @attr price_usd_the_house
% @type numeric
% @canonical false
% @original_name The House price
% @unit USD
% @values v314_99=314.99 unk_price_usd_the_house=Unknown
% @importance 0.85

0.78::acc(s15, price_usd_the_house).

0.72::true_val(price_usd_the_house, v314_99); 0.28::true_val(price_usd_the_house, unk_price_usd_the_house).

measured(s15, price_usd_the_house, v314_99).

all_consistent(price_usd_the_house) :- consistent(s15, price_usd_the_house).

evidence(all_consistent(price_usd_the_house)).
query(true_val(price_usd_the_house, v314_99)).
query(true_val(price_usd_the_house, unk_price_usd_the_house)).

% @attr price_usd_backcountry
% @type numeric
% @canonical true
% @original_name price_usd_backcountry
% @unit USD
% @values v359_99=359.99 unk_price_usd_backcountry=Unknown
% @importance 0.85

0.78::acc(s15, price_usd_backcountry).

0.72::true_val(price_usd_backcountry, v359_99); 0.28::true_val(price_usd_backcountry, unk_price_usd_backcountry).

measured(s15, price_usd_backcountry, v359_99).

all_consistent(price_usd_backcountry) :- consistent(s15, price_usd_backcountry).

evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v359_99)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

% @attr price_usd_tactics
% @type numeric
% @canonical true
% @original_name price_usd_tactics
% @unit USD
% @values v314_99=314.99 unk_price_usd_tactics=Unknown
% @importance 0.8

0.82::acc(s18, price_usd_tactics).

0.68::true_val(price_usd_tactics, v314_99); 0.32::true_val(price_usd_tactics, unk_price_usd_tactics).

measured(s18, price_usd_tactics, v314_99).

all_consistent(price_usd_tactics) :- consistent(s18, price_usd_tactics).

evidence(all_consistent(price_usd_tactics)).
query(true_val(price_usd_tactics, v314_99)).
query(true_val(price_usd_tactics, unk_price_usd_tactics)).

% @attr price_cad_prfo
% @type numeric
% @canonical false
% @original_name price_cad_prfo
% @unit CAD
% @values v470_99=470.99 unk_price_cad_prfo=Unknown
% @importance 0.85

0.78::acc(s15, price_cad_prfo).

0.72::true_val(price_cad_prfo, v470_99); 0.28::true_val(price_cad_prfo, unk_price_cad_prfo).

measured(s15, price_cad_prfo, v470_99).

all_consistent(price_cad_prfo) :- consistent(s15, price_cad_prfo).

evidence(all_consistent(price_cad_prfo)).
query(true_val(price_cad_prfo, v470_99)).
query(true_val(price_cad_prfo, unk_price_cad_prfo)).

% @attr price_eur_blue_tomato
% @type numeric
% @canonical false
% @original_name price_eur_blue_tomato
% @unit EUR
% @values v329_95=329.95 unk_price_eur_blue_tomato=Unknown
% @importance 0.85

0.78::acc(s15, price_eur_blue_tomato).

0.72::true_val(price_eur_blue_tomato, v329_95); 0.28::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).

measured(s15, price_eur_blue_tomato, v329_95).

all_consistent(price_eur_blue_tomato) :- consistent(s15, price_eur_blue_tomato).

evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v329_95)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

% @attr price_aud_merchant
% @type numeric
% @canonical false
% @original_name price_aud_merchant
% @unit AUD
% @values v524_99=524.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.93::acc(s_m, price_aud_merchant).

0.95::true_val(price_aud_merchant, v524_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s_m, price_aud_merchant, v524_99).

all_consistent(price_aud_merchant) :- consistent(s_m, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v524_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_reference_botw
% @type categorical
% @canonical false
% @original_name Board of the World price reference (prior year)
% @values usually_400=Usually_priced_at_400_at_start_of_season unk_price_reference_botw=Unknown
% @importance 0.85

0.70::acc(s19, price_reference_botw).

0.63::true_val(price_reference_botw, usually_400); 0.37::true_val(price_reference_botw, unk_price_reference_botw).

measured(s19, price_reference_botw, usually_400).

all_consistent(price_reference_botw) :- consistent(s19, price_reference_botw).

evidence(all_consistent(price_reference_botw)).
query(true_val(price_reference_botw, usually_400)).
query(true_val(price_reference_botw, unk_price_reference_botw)).

% @attr price_observation_botw
% @type categorical
% @canonical false
% @original_name Board of the World price observation
% @values below_avg_108=108_02_less_than_avg_468_01 unk_price_observation_botw=Unknown
% @importance 0.85

0.70::acc(s19, price_observation_botw).

0.63::true_val(price_observation_botw, below_avg_108); 0.37::true_val(price_observation_botw, unk_price_observation_botw).

measured(s19, price_observation_botw, below_avg_108).

all_consistent(price_observation_botw) :- consistent(s19, price_observation_botw).

evidence(all_consistent(price_observation_botw)).
query(true_val(price_observation_botw, below_avg_108)).
query(true_val(price_observation_botw, unk_price_observation_botw)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values available=Available_gnu_com unk_availability_status=Unknown
% @importance 1.0

0.93::acc(s13, availability_status).

0.90::true_val(availability_status, available); 0.10::true_val(availability_status, unk_availability_status).

measured(s13, availability_status, available).

all_consistent(availability_status) :- consistent(s13, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, available)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status
% @values available=Available_evo unk_availability_status_evo=Unknown
% @importance 0.9

0.85::acc(s17, availability_status_evo).

0.77::true_val(availability_status_evo, available); 0.23::true_val(availability_status_evo, unk_availability_status_evo).

measured(s17, availability_status_evo, available).

all_consistent(availability_status_evo) :- consistent(s17, availability_status_evo).

evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, available)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

% @attr availability_status_tactics
% @type categorical
% @canonical false
% @original_name availability_status
% @values available=Available_tactics unk_availability_status_tactics=Unknown
% @importance 0.8

0.80::acc(s18, availability_status_tactics).

0.68::true_val(availability_status_tactics, available); 0.32::true_val(availability_status_tactics, unk_availability_status_tactics).

measured(s18, availability_status_tactics, available).

all_consistent(availability_status_tactics) :- consistent(s18, availability_status_tactics).

evidence(all_consistent(availability_status_tactics)).
query(true_val(availability_status_tactics, available)).
query(true_val(availability_status_tactics, unk_availability_status_tactics)).

% @attr availability_status_zumiez
% @type categorical
% @canonical false
% @original_name availability_status
% @values available=Available_zumiez unk_availability_status_zumiez=Unknown
% @importance 0.5

0.72::acc(s20, availability_status_zumiez).

0.64::true_val(availability_status_zumiez, available); 0.36::true_val(availability_status_zumiez, unk_availability_status_zumiez).

measured(s20, availability_status_zumiez, available).

all_consistent(availability_status_zumiez) :- consistent(s20, availability_status_zumiez).

evidence(all_consistent(availability_status_zumiez)).
query(true_val(availability_status_zumiez, available)).
query(true_val(availability_status_zumiez, unk_availability_status_zumiez)).

% @attr availability_status_backcountry
% @type categorical
% @canonical false
% @original_name availability_status
% @values available=Available_backcountry unk_availability_status_backcountry=Unknown
% @importance 0.85

0.78::acc(s15, availability_status_backcountry).

0.72::true_val(availability_status_backcountry, available); 0.28::true_val(availability_status_backcountry, unk_availability_status_backcountry).

measured(s15, availability_status_backcountry, available).

all_consistent(availability_status_backcountry) :- consistent(s15, availability_status_backcountry).

evidence(all_consistent(availability_status_backcountry)).
query(true_val(availability_status_backcountry, available)).
query(true_val(availability_status_backcountry, unk_availability_status_backcountry)).

% @attr availability_status_the_house
% @type categorical
% @canonical false
% @original_name availability_status
% @values available=Available_the_house unk_availability_status_the_house=Unknown
% @importance 0.85

0.78::acc(s15, availability_status_the_house).

0.72::true_val(availability_status_the_house, available); 0.28::true_val(availability_status_the_house, unk_availability_status_the_house).

measured(s15, availability_status_the_house, available).

all_consistent(availability_status_the_house) :- consistent(s15, availability_status_the_house).

evidence(all_consistent(availability_status_the_house)).
query(true_val(availability_status_the_house, available)).
query(true_val(availability_status_the_house, unk_availability_status_the_house)).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status
% @values available=Available_blauer unk_availability_status_blauer=Unknown
% @importance 0.85

0.78::acc(s15, availability_status_blauer).

0.72::true_val(availability_status_blauer, available); 0.28::true_val(availability_status_blauer, unk_availability_status_blauer).

measured(s15, availability_status_blauer, available).

all_consistent(availability_status_blauer) :- consistent(s15, availability_status_blauer).

evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, available)).
query(true_val(availability_status_blauer, unk_availability_status_blauer)).

% @attr availability_status_sun_ski
% @type categorical
% @canonical false
% @original_name availability_status
% @values available=Available_sun_ski unk_availability_status_sun_ski=Unknown
% @importance 0.85

0.78::acc(s15, availability_status_sun_ski).

0.72::true_val(availability_status_sun_ski, available); 0.28::true_val(availability_status_sun_ski, unk_availability_status_sun_ski).

measured(s15, availability_status_sun_ski, available).

all_consistent(availability_status_sun_ski) :- consistent(s15, availability_status_sun_ski).

evidence(all_consistent(availability_status_sun_ski)).
query(true_val(availability_status_sun_ski, available)).
query(true_val(availability_status_sun_ski, unk_availability_status_sun_ski)).

% @attr availability_status_salty_peaks
% @type categorical
% @canonical false
% @original_name availability_status
% @values available=Available_salty_peaks unk_availability_status_salty_peaks=Unknown
% @importance 0.5

0.68::acc(s21, availability_status_salty_peaks).

0.56::true_val(availability_status_salty_peaks, available); 0.44::true_val(availability_status_salty_peaks, unk_availability_status_salty_peaks).

measured(s21, availability_status_salty_peaks, available).

all_consistent(availability_status_salty_peaks) :- consistent(s21, availability_status_salty_peaks).

evidence(all_consistent(availability_status_salty_peaks)).
query(true_val(availability_status_salty_peaks, available)).
query(true_val(availability_status_salty_peaks, unk_availability_status_salty_peaks)).

% @attr availability_status_blue_tomato
% @type categorical
% @canonical false
% @original_name availability_status
% @values available=Available_blue_tomato unk_availability_status_blue_tomato=Unknown
% @importance 0.85

0.78::acc(s15, availability_status_blue_tomato).

0.72::true_val(availability_status_blue_tomato, available); 0.28::true_val(availability_status_blue_tomato, unk_availability_status_blue_tomato).

measured(s15, availability_status_blue_tomato, available).

all_consistent(availability_status_blue_tomato) :- consistent(s15, availability_status_blue_tomato).

evidence(all_consistent(availability_status_blue_tomato)).
query(true_val(availability_status_blue_tomato, available)).
query(true_val(availability_status_blue_tomato, unk_availability_status_blue_tomato)).

% @attr availability_status_prfo
% @type categorical
% @canonical false
% @original_name availability_status
% @values available=Available_prfo unk_availability_status_prfo=Unknown
% @importance 0.85

0.78::acc(s15, availability_status_prfo).

0.72::true_val(availability_status_prfo, available); 0.28::true_val(availability_status_prfo, unk_availability_status_prfo).

measured(s15, availability_status_prfo, available).

all_consistent(availability_status_prfo) :- consistent(s15, availability_status_prfo).

evidence(all_consistent(availability_status_prfo)).
query(true_val(availability_status_prfo, available)).
query(true_val(availability_status_prfo, unk_availability_status_prfo)).

% @attr availability_status_corbetts
% @type categorical
% @canonical false
% @original_name availability_status
% @values available=Available_corbetts unk_availability_status_corbetts=Unknown
% @importance 0.4

0.60::acc(s22, availability_status_corbetts).

0.46::true_val(availability_status_corbetts, available); 0.54::true_val(availability_status_corbetts, unk_availability_status_corbetts).

measured(s22, availability_status_corbetts, available).

all_consistent(availability_status_corbetts) :- consistent(s22, availability_status_corbetts).

evidence(all_consistent(availability_status_corbetts)).
query(true_val(availability_status_corbetts, available)).
query(true_val(availability_status_corbetts, unk_availability_status_corbetts)).

% @attr availability_status_sitzmark
% @type categorical
% @canonical false
% @original_name availability_status
% @values available=Available_sitzmark unk_availability_status_sitzmark=Unknown
% @importance 0.4

0.50::acc(s23, availability_status_sitzmark).

0.36::true_val(availability_status_sitzmark, available); 0.64::true_val(availability_status_sitzmark, unk_availability_status_sitzmark).

measured(s23, availability_status_sitzmark, available).

all_consistent(availability_status_sitzmark) :- consistent(s23, availability_status_sitzmark).

evidence(all_consistent(availability_status_sitzmark)).
query(true_val(availability_status_sitzmark, available)).
query(true_val(availability_status_sitzmark, unk_availability_status_sitzmark)).

% @attr gnu_shipping
% @type categorical
% @canonical false
% @original_name GNU.com shipping
% @values free_over_75=Free_shipping_over_75_excl_AK_HI unk_gnu_shipping=Unknown
% @importance 1.0

0.90::acc(s13, gnu_shipping).

0.90::true_val(gnu_shipping, free_over_75); 0.10::true_val(gnu_shipping, unk_gnu_shipping).

measured(s13, gnu_shipping, free_over_75).

all_consistent(gnu_shipping) :- consistent(s13, gnu_shipping).

evidence(all_consistent(gnu_shipping)).
query(true_val(gnu_shipping, free_over_75)).
query(true_val(gnu_shipping, unk_gnu_shipping)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values full_range=130_135_140_144_148_152_154_156_159_150W_154W_158W unk_available_sizes=Unknown
% @importance 1.0

0.93::acc(s13, available_sizes).

0.95::true_val(available_sizes, full_range); 0.05::true_val(available_sizes, unk_available_sizes).

measured(s13, available_sizes, full_range).

all_consistent(available_sizes) :- consistent(s13, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, full_range)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr available_sizes_merchant
% @type categorical
% @canonical false
% @original_name available_sizes
% @values merchant_subset=152_154_156_154W unk_available_sizes_merchant=Unknown
% @importance 0.85

0.90::acc(s_m, available_sizes_merchant).

0.95::true_val(available_sizes_merchant, merchant_subset); 0.05::true_val(available_sizes_merchant, unk_available_sizes_merchant).

measured(s_m, available_sizes_merchant, merchant_subset).

all_consistent(available_sizes_merchant) :- consistent(s_m, available_sizes_merchant).

evidence(all_consistent(available_sizes_merchant)).
query(true_val(available_sizes_merchant, merchant_subset)).
query(true_val(available_sizes_merchant, unk_available_sizes_merchant)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values c2e_hybrid_rocker=C2e_Hybrid_Rocker unk_camber_type=Unknown
% @importance 0.93

0.95::acc(s13, camber_type).
0.82::acc(s17, camber_type).

0.95::true_val(camber_type, c2e_hybrid_rocker); 0.05::true_val(camber_type, unk_camber_type).

measured(s13, camber_type, c2e_hybrid_rocker).
measured(s_m, camber_type, c2e_hybrid_rocker).
measured(s17, camber_type, c2e_hybrid_rocker).

all_consistent(camber_type) :-
    consistent(s13, camber_type),
    (indep(s_m), consistent(s_m, camber_type) ; \+indep(s_m)),
    (indep(s17), consistent(s17, camber_type) ; \+indep(s17)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, c2e_hybrid_rocker)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values mild_rocker_elliptical_camber=Mild_rocker_between_feet_elliptical_camber_tips unk_camber_description=Unknown
% @importance 0.9

0.85::acc(s24, camber_description).
0.80::acc(s15, camber_description).

0.95::true_val(camber_description, mild_rocker_elliptical_camber); 0.05::true_val(camber_description, unk_camber_description).

measured(s24, camber_description, mild_rocker_elliptical_camber).
measured(s15, camber_description, mild_rocker_elliptical_camber).

all_consistent(camber_description) :-
    (indep(s24), consistent(s24, camber_description) ; \+indep(s24)),
    consistent(s15, camber_description).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, mild_rocker_elliptical_camber)).
query(true_val(camber_description, unk_camber_description)).

% @attr setback
% @type numeric
% @canonical true
% @original_name setback
% @unit mm
% @values v0=0.0 v_neg12_5=-12.5
% @importance 0.93

0.95::acc(s13, setback).
0.70::acc(s15, setback).

0.78::true_val(setback, v0); 0.22::true_val(setback, v_neg12_5).

measured(s13, setback, v0).
measured(s_m, setback, v0).
measured(s15, setback, v_neg12_5).

all_consistent(setback) :-
    consistent(s13, setback),
    consistent(s15, setback),
    (indep(s_m), consistent(s_m, setback) ; \+indep(s_m)).

evidence(all_consistent(setback)).
query(true_val(setback, v0)).
query(true_val(setback, v_neg12_5)).

% @attr mounting_pattern
% @type categorical
% @canonical false
% @original_name mounting_pattern
% @values inserts_2x4=2x4_inserts unk_mounting_pattern=Unknown
% @importance 0.85

0.88::acc(s_m, mounting_pattern).

0.95::true_val(mounting_pattern, inserts_2x4); 0.05::true_val(mounting_pattern, unk_mounting_pattern).

measured(s_m, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :- consistent(s_m, mounting_pattern).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values g_lite_1_aspen_paulownia=G_Lite_1_FCS_Aspen_Paulownia unk_core_material=Unknown
% @importance 0.95

0.85::acc(s24, core_material).

0.81::true_val(core_material, g_lite_1_aspen_paulownia); 0.19::true_val(core_material, unk_core_material).

measured(s24, core_material, g_lite_1_aspen_paulownia).

all_consistent(core_material) :-
    (indep(s24), consistent(s24, core_material) ; \+indep(s24)).

evidence(all_consistent(core_material)).
query(true_val(core_material, g_lite_1_aspen_paulownia)).
query(true_val(core_material, unk_core_material)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values triax_biax_fiberglass=Triaxial_Biaxial_fiberglass unk_laminate=Unknown
% @importance 0.95

0.85::acc(s24, laminate).

0.81::true_val(laminate, triax_biax_fiberglass); 0.19::true_val(laminate, unk_laminate).

measured(s24, laminate, triax_biax_fiberglass).

all_consistent(laminate) :-
    (indep(s24), consistent(s24, laminate) ; \+indep(s24)).

evidence(all_consistent(laminate)).
query(true_val(laminate, triax_biax_fiberglass)).
query(true_val(laminate, unk_laminate)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values uhmw=UHMW_polyethylene unk_sidewall_material=Unknown
% @importance 0.78

0.88::acc(s_m, sidewall_material).
0.78::acc(s25, sidewall_material).

0.95::true_val(sidewall_material, uhmw); 0.05::true_val(sidewall_material, unk_sidewall_material).

measured(s_m, sidewall_material, uhmw).
measured(s25, sidewall_material, uhmw).

all_consistent(sidewall_material) :-
    consistent(s25, sidewall_material),
    (indep(s_m), consistent(s_m, sidewall_material) ; \+indep(s_m)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, uhmw)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values eco_sub_coex=Eco_Sublimated_Co_Ex unk_base_material=Unknown
% @importance 0.95

0.85::acc(s24, base_material).

0.81::true_val(base_material, eco_sub_coex); 0.19::true_val(base_material, unk_base_material).

measured(s24, base_material, eco_sub_coex).

all_consistent(base_material) :-
    (indep(s24), consistent(s24, base_material) ; \+indep(s24)).

evidence(all_consistent(base_material)).
query(true_val(base_material, eco_sub_coex)).
query(true_val(base_material, unk_base_material)).

% @attr base_type
% @type categorical
% @canonical false
% @original_name base_type
% @values extruded=Extruded_base unk_base_type=Unknown
% @importance 0.85

0.72::acc(s19, base_type).

0.63::true_val(base_type, extruded); 0.37::true_val(base_type, unk_base_type).

measured(s19, base_type, extruded).

all_consistent(base_type) :- consistent(s19, base_type).

evidence(all_consistent(base_type)).
query(true_val(base_type, extruded)).
query(true_val(base_type, unk_base_type)).

% @attr topsheet
% @type categorical
% @canonical false
% @original_name topsheet
% @values eco_sub_poly=Eco_Sublimated_Poly_Top unk_topsheet=Unknown
% @importance 0.95

0.85::acc(s24, topsheet).

0.81::true_val(topsheet, eco_sub_poly); 0.19::true_val(topsheet, unk_topsheet).

measured(s24, topsheet, eco_sub_poly).

all_consistent(topsheet) :-
    (indep(s24), consistent(s24, topsheet) ; \+indep(s24)).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, eco_sub_poly)).
query(true_val(topsheet, unk_topsheet)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values magne_traction_7=Magne_Traction_7_serrations unk_edge_technology=Unknown
% @importance 0.95

0.85::acc(s24, edge_technology).

0.81::true_val(edge_technology, magne_traction_7); 0.19::true_val(edge_technology, unk_edge_technology).

measured(s24, edge_technology, magne_traction_7).

all_consistent(edge_technology) :-
    (indep(s24), consistent(s24, edge_technology) ; \+indep(s24)).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, magne_traction_7)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr available_colors
% @type categorical
% @canonical false
% @original_name available_colors
% @values random_colourways=Random_colourways unk_available_colors=Unknown
% @importance 0.85

0.88::acc(s_m, available_colors).

0.95::true_val(available_colors, random_colourways); 0.05::true_val(available_colors, unk_available_colors).

measured(s_m, available_colors, random_colourways).

all_consistent(available_colors) :- consistent(s_m, available_colors).

evidence(all_consistent(available_colors)).
query(true_val(available_colors, random_colourways)).
query(true_val(available_colors, unk_available_colors)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @original_name flex_rating_10
% @unit /10
% @values v5=5.0 v6=6.0
% @importance 0.88

0.80::acc(s_m, flex_rating_10).
0.78::acc(s26, flex_rating_10).
0.93::acc(s13, flex_rating_10).

0.40::true_val(flex_rating_10, v5); 0.60::true_val(flex_rating_10, v6).

measured(s_m, flex_rating_10, v5).
measured(s26, flex_rating_10, v5).
measured(s13, flex_rating_10, v6).

all_consistent(flex_rating_10) :-
    consistent(s13, flex_rating_10),
    consistent(s26, flex_rating_10),
    (indep(s_m), consistent(s_m, flex_rating_10) ; \+indep(s_m)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v5)).
query(true_val(flex_rating_10, v6)).

% @attr flex_rating_10_evo
% @type categorical
% @canonical true
% @original_name flex_rating_10_evo
% @values medium=Medium unk_flex_rating_10_evo=Unknown
% @importance 0.9

0.82::acc(s17, flex_rating_10_evo).

0.77::true_val(flex_rating_10_evo, medium); 0.23::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).

measured(s17, flex_rating_10_evo, medium).

all_consistent(flex_rating_10_evo) :-
    (indep(s17), consistent(s17, flex_rating_10_evo) ; \+indep(s17)).

evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, medium)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

% @attr flex_rating_10_the_good_ride
% @type categorical
% @canonical false
% @original_name flex_rating_10_the_good_ride
% @values medium=Medium unk_flex_rating_10_the_good_ride=Unknown
% @importance 0.85

0.80::acc(s15, flex_rating_10_the_good_ride).

0.72::true_val(flex_rating_10_the_good_ride, medium); 0.28::true_val(flex_rating_10_the_good_ride, unk_flex_rating_10_the_good_ride).

measured(s15, flex_rating_10_the_good_ride, medium).

all_consistent(flex_rating_10_the_good_ride) :- consistent(s15, flex_rating_10_the_good_ride).

evidence(all_consistent(flex_rating_10_the_good_ride)).
query(true_val(flex_rating_10_the_good_ride, medium)).
query(true_val(flex_rating_10_the_good_ride, unk_flex_rating_10_the_good_ride)).

% @attr flex_rating_10_manufacturer
% @type categorical
% @canonical true
% @original_name flex_rating_10_manufacturer
% @values size_varying=130cm_4_135cm_4_140cm_4_5_144cm_5_5_148plus_6 unk_flex_rating_10_manufacturer=Unknown
% @importance 1.0

0.95::acc(s13, flex_rating_10_manufacturer).

0.90::true_val(flex_rating_10_manufacturer, size_varying); 0.10::true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer).

measured(s13, flex_rating_10_manufacturer, size_varying).

all_consistent(flex_rating_10_manufacturer) :- consistent(s13, flex_rating_10_manufacturer).

evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, size_varying)).
query(true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer)).

% @attr contact_length_size_154
% @type numeric
% @canonical false
% @original_name contact_length_size
% @unit cm
% @values v116_0=116.0 unk_contact_length_size_154=Unknown
% @importance 0.93

0.93::acc(s13, contact_length_size_154).

0.95::true_val(contact_length_size_154, v116_0); 0.05::true_val(contact_length_size_154, unk_contact_length_size_154).

measured(s13, contact_length_size_154, v116_0).
measured(s_m, contact_length_size_154, v116_0).

all_consistent(contact_length_size_154) :-
    consistent(s13, contact_length_size_154),
    (indep(s_m), consistent(s_m, contact_length_size_154) ; \+indep(s_m)).

evidence(all_consistent(contact_length_size_154)).
query(true_val(contact_length_size_154, v116_0)).
query(true_val(contact_length_size_154, unk_contact_length_size_154)).

% @attr sidecut_radius_size_154
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v8_1=8.1 unk_sidecut_radius_size_154=Unknown
% @importance 0.93

0.93::acc(s13, sidecut_radius_size_154).

0.95::true_val(sidecut_radius_size_154, v8_1); 0.05::true_val(sidecut_radius_size_154, unk_sidecut_radius_size_154).

measured(s13, sidecut_radius_size_154, v8_1).
measured(s_m, sidecut_radius_size_154, v8_1).

all_consistent(sidecut_radius_size_154) :-
    consistent(s13, sidecut_radius_size_154),
    (indep(s_m), consistent(s_m, sidecut_radius_size_154) ; \+indep(s_m)).

evidence(all_consistent(sidecut_radius_size_154)).
query(true_val(sidecut_radius_size_154, v8_1)).
query(true_val(sidecut_radius_size_154, unk_sidecut_radius_size_154)).

% @attr tip_tail_width_size_154
% @type numeric
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v29_5=29.5 unk_tip_tail_width_size_154=Unknown
% @importance 0.93

0.93::acc(s13, tip_tail_width_size_154).

0.95::true_val(tip_tail_width_size_154, v29_5); 0.05::true_val(tip_tail_width_size_154, unk_tip_tail_width_size_154).

measured(s13, tip_tail_width_size_154, v29_5).
measured(s_m, tip_tail_width_size_154, v29_5).

all_consistent(tip_tail_width_size_154) :-
    consistent(s13, tip_tail_width_size_154),
    (indep(s_m), consistent(s_m, tip_tail_width_size_154) ; \+indep(s_m)).

evidence(all_consistent(tip_tail_width_size_154)).
query(true_val(tip_tail_width_size_154, v29_5)).
query(true_val(tip_tail_width_size_154, unk_tip_tail_width_size_154)).

% @attr waist_width_154
% @type numeric
% @canonical false
% @original_name Waist width 154cm
% @unit cm
% @values v25_4=25.4 unk_waist_width_154=Unknown
% @importance 0.93

0.93::acc(s13, waist_width_154).

0.95::true_val(waist_width_154, v25_4); 0.05::true_val(waist_width_154, unk_waist_width_154).

measured(s13, waist_width_154, v25_4).
measured(s_m, waist_width_154, v25_4).

all_consistent(waist_width_154) :-
    consistent(s13, waist_width_154),
    (indep(s_m), consistent(s_m, waist_width_154) ; \+indep(s_m)).

evidence(all_consistent(waist_width_154)).
query(true_val(waist_width_154, v25_4)).
query(true_val(waist_width_154, unk_waist_width_154)).

% @attr stance_width_range_size_154
% @type categorical
% @canonical false
% @original_name stance_width_range_size
% @values range_20_25_to_25_0=20_25in_to_25_0in unk_stance_width_range_size_154=Unknown
% @importance 0.93

0.93::acc(s13, stance_width_range_size_154).

0.95::true_val(stance_width_range_size_154, range_20_25_to_25_0); 0.05::true_val(stance_width_range_size_154, unk_stance_width_range_size_154).

measured(s13, stance_width_range_size_154, range_20_25_to_25_0).
measured(s_m, stance_width_range_size_154, range_20_25_to_25_0).

all_consistent(stance_width_range_size_154) :-
    consistent(s13, stance_width_range_size_154),
    (indep(s_m), consistent(s_m, stance_width_range_size_154) ; \+indep(s_m)).

evidence(all_consistent(stance_width_range_size_154)).
query(true_val(stance_width_range_size_154, range_20_25_to_25_0)).
query(true_val(stance_width_range_size_154, unk_stance_width_range_size_154)).

% @attr recommended_weight_range_size_154
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values v45_plus_kg=45_plus_kg v40_plus_kg=40_plus_kg
% @importance 0.93

0.93::acc(s13, recommended_weight_range_size_154).
0.85::acc(s_m, recommended_weight_range_size_154).

0.60::true_val(recommended_weight_range_size_154, v45_plus_kg); 0.40::true_val(recommended_weight_range_size_154, v40_plus_kg).

measured(s13, recommended_weight_range_size_154, v45_plus_kg).
measured(s_m, recommended_weight_range_size_154, v40_plus_kg).

all_consistent(recommended_weight_range_size_154) :-
    consistent(s13, recommended_weight_range_size_154),
    consistent(s_m, recommended_weight_range_size_154).

evidence(all_consistent(recommended_weight_range_size_154)).
query(true_val(recommended_weight_range_size_154, v45_plus_kg)).
query(true_val(recommended_weight_range_size_154, v40_plus_kg)).

% @attr gnu_user_rating
% @type numeric
% @canonical false
% @original_name GNU.com user rating
% @unit percent
% @values v98=98.0 unk_gnu_user_rating=Unknown
% @importance 1.0

0.85::acc(s13, gnu_user_rating).

0.90::true_val(gnu_user_rating, v98); 0.10::true_val(gnu_user_rating, unk_gnu_user_rating).

measured(s13, gnu_user_rating, v98).

all_consistent(gnu_user_rating) :- consistent(s13, gnu_user_rating).

evidence(all_consistent(gnu_user_rating)).
query(true_val(gnu_user_rating, v98)).
query(true_val(gnu_user_rating, unk_gnu_user_rating)).

% @attr botw_overall_rating
% @type numeric
% @canonical false
% @original_name Board of the World overall rating
% @unit /5
% @values v4_11=4.11 unk_botw_overall_rating=Unknown
% @importance 0.85

0.75::acc(s19, botw_overall_rating).

0.63::true_val(botw_overall_rating, v4_11); 0.37::true_val(botw_overall_rating, unk_botw_overall_rating).

measured(s19, botw_overall_rating, v4_11).

all_consistent(botw_overall_rating) :- consistent(s19, botw_overall_rating).

evidence(all_consistent(botw_overall_rating)).
query(true_val(botw_overall_rating, v4_11)).
query(true_val(botw_overall_rating, unk_botw_overall_rating)).

% @attr botw_carving_rating
% @type numeric
% @canonical false
% @original_name Board of the World carving rating
% @unit /10
% @values v8_5=8.5 unk_botw_carving_rating=Unknown
% @importance 0.85

0.75::acc(s27, botw_carving_rating).

0.63::true_val(botw_carving_rating, v8_5); 0.37::true_val(botw_carving_rating, unk_botw_carving_rating).

measured(s27, botw_carving_rating, v8_5).

all_consistent(botw_carving_rating) :- consistent(s27, botw_carving_rating).

evidence(all_consistent(botw_carving_rating)).
query(true_val(botw_carving_rating, v8_5)).
query(true_val(botw_carving_rating, unk_botw_carving_rating)).

% @attr botw_ice_rating
% @type numeric
% @canonical false
% @original_name Board of the World ice/poor conditions rating
% @unit /5
% @values v5_0=5.0 unk_botw_ice_rating=Unknown
% @importance 0.85

0.75::acc(s19, botw_ice_rating).

0.63::true_val(botw_ice_rating, v5_0); 0.37::true_val(botw_ice_rating, unk_botw_ice_rating).

measured(s19, botw_ice_rating, v5_0).

all_consistent(botw_ice_rating) :- consistent(s19, botw_ice_rating).

evidence(all_consistent(botw_ice_rating)).
query(true_val(botw_ice_rating, v5_0)).
query(true_val(botw_ice_rating, unk_botw_ice_rating)).

% @attr botw_switch_rating
% @type numeric
% @canonical false
% @original_name Board of the World switch riding rating
% @unit /5
% @values v5_0=5.0 unk_botw_switch_rating=Unknown
% @importance 0.85

0.75::acc(s19, botw_switch_rating).

0.63::true_val(botw_switch_rating, v5_0); 0.37::true_val(botw_switch_rating, unk_botw_switch_rating).

measured(s19, botw_switch_rating, v5_0).

all_consistent(botw_switch_rating) :- consistent(s19, botw_switch_rating).

evidence(all_consistent(botw_switch_rating)).
query(true_val(botw_switch_rating, v5_0)).
query(true_val(botw_switch_rating, unk_botw_switch_rating)).

% @attr botw_pop_rating
% @type numeric
% @canonical false
% @original_name Board of the World pop/power rating
% @unit /5
% @values v3_5=3.5 unk_botw_pop_rating=Unknown
% @importance 0.85

0.75::acc(s19, botw_pop_rating).

0.63::true_val(botw_pop_rating, v3_5); 0.37::true_val(botw_pop_rating, unk_botw_pop_rating).

measured(s19, botw_pop_rating, v3_5).

all_consistent(botw_pop_rating) :- consistent(s19, botw_pop_rating).

evidence(all_consistent(botw_pop_rating)).
query(true_val(botw_pop_rating, v3_5)).
query(true_val(botw_pop_rating, unk_botw_pop_rating)).

% @attr botw_speed_rating
% @type numeric
% @canonical false
% @original_name Board of the World speed rating
% @unit /5
% @values v3_5=3.5 unk_botw_speed_rating=Unknown
% @importance 0.85

0.75::acc(s19, botw_speed_rating).

0.63::true_val(botw_speed_rating, v3_5); 0.37::true_val(botw_speed_rating, unk_botw_speed_rating).

measured(s19, botw_speed_rating, v3_5).

all_consistent(botw_speed_rating) :- consistent(s19, botw_speed_rating).

evidence(all_consistent(botw_speed_rating)).
query(true_val(botw_speed_rating, v3_5)).
query(true_val(botw_speed_rating, unk_botw_speed_rating)).

% @attr botw_dampness_rating
% @type numeric
% @canonical false
% @original_name Board of the World dampness rating
% @unit /5
% @values v3_5=3.5 unk_botw_dampness_rating=Unknown
% @importance 0.85

0.75::acc(s19, botw_dampness_rating).

0.63::true_val(botw_dampness_rating, v3_5); 0.37::true_val(botw_dampness_rating, unk_botw_dampness_rating).

measured(s19, botw_dampness_rating, v3_5).

all_consistent(botw_dampness_rating) :- consistent(s19, botw_dampness_rating).

evidence(all_consistent(botw_dampness_rating)).
query(true_val(botw_dampness_rating, v3_5)).
query(true_val(botw_dampness_rating, unk_botw_dampness_rating)).

% @attr botw_jump_rating
% @type numeric
% @canonical false
% @original_name Board of the World jump rating
% @unit /5
% @values v3_5=3.5 unk_botw_jump_rating=Unknown
% @importance 0.85

0.75::acc(s19, botw_jump_rating).

0.63::true_val(botw_jump_rating, v3_5); 0.37::true_val(botw_jump_rating, unk_botw_jump_rating).

measured(s19, botw_jump_rating, v3_5).

all_consistent(botw_jump_rating) :- consistent(s19, botw_jump_rating).

evidence(all_consistent(botw_jump_rating)).
query(true_val(botw_jump_rating, v3_5)).
query(true_val(botw_jump_rating, unk_botw_jump_rating)).

% @attr botw_fun_rating
% @type numeric
% @canonical false
% @original_name Board of the World fun to ride rating
% @unit /5
% @values v5_0=5.0 unk_botw_fun_rating=Unknown
% @importance 0.85

0.75::acc(s19, botw_fun_rating).

0.63::true_val(botw_fun_rating, v5_0); 0.37::true_val(botw_fun_rating, unk_botw_fun_rating).

measured(s19, botw_fun_rating, v5_0).

all_consistent(botw_fun_rating) :- consistent(s19, botw_fun_rating).

evidence(all_consistent(botw_fun_rating)).
query(true_val(botw_fun_rating, v5_0)).
query(true_val(botw_fun_rating, unk_botw_fun_rating)).

% @attr powder_rating_tgr
% @type categorical
% @canonical false
% @original_name powder_rating_tgr
% @values average=Average unk_powder_rating_tgr=Unknown
% @importance 0.85

0.78::acc(s15, powder_rating_tgr).

0.72::true_val(powder_rating_tgr, average); 0.28::true_val(powder_rating_tgr, unk_powder_rating_tgr).

measured(s15, powder_rating_tgr, average).

all_consistent(powder_rating_tgr) :- consistent(s15, powder_rating_tgr).

evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, average)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

% @attr base_glide_performance
% @type categorical
% @canonical false
% @original_name base_glide_performance
% @values average=Average unk_base_glide_performance=Unknown
% @importance 0.85

0.78::acc(s15, base_glide_performance).

0.72::true_val(base_glide_performance, average); 0.28::true_val(base_glide_performance, unk_base_glide_performance).

measured(s15, base_glide_performance, average).

all_consistent(base_glide_performance) :- consistent(s15, base_glide_performance).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, average)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr carving_rating_tgr
% @type categorical
% @canonical false
% @original_name carving_rating_tgr
% @values average=Average unk_carving_rating_tgr=Unknown
% @importance 0.85

0.78::acc(s15, carving_rating_tgr).

0.72::true_val(carving_rating_tgr, average); 0.28::true_val(carving_rating_tgr, unk_carving_rating_tgr).

measured(s15, carving_rating_tgr, average).

all_consistent(carving_rating_tgr) :- consistent(s15, carving_rating_tgr).

evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, average)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

% @attr speed_rating_tgr
% @type categorical
% @canonical false
% @original_name speed_rating_tgr
% @values average=Average unk_speed_rating_tgr=Unknown
% @importance 0.85

0.78::acc(s15, speed_rating_tgr).

0.72::true_val(speed_rating_tgr, average); 0.28::true_val(speed_rating_tgr, unk_speed_rating_tgr).

measured(s15, speed_rating_tgr, average).

all_consistent(speed_rating_tgr) :- consistent(s15, speed_rating_tgr).

evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, average)).
query(true_val(speed_rating_tgr, unk_speed_rating_tgr)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values good=Good unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.85

0.78::acc(s15, reviewer_opinion_the_good_ride).

0.72::true_val(reviewer_opinion_the_good_ride, good); 0.28::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s15, reviewer_opinion_the_good_ride, good).

all_consistent(reviewer_opinion_the_good_ride) :- consistent(s15, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, good)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr jumps_rating_tgr
% @type categorical
% @canonical false
% @original_name jumps_rating_tgr
% @values good=Good unk_jumps_rating_tgr=Unknown
% @importance 0.85

0.78::acc(s15, jumps_rating_tgr).

0.72::true_val(jumps_rating_tgr, good); 0.28::true_val(jumps_rating_tgr, unk_jumps_rating_tgr).

measured(s15, jumps_rating_tgr, good).

all_consistent(jumps_rating_tgr) :- consistent(s15, jumps_rating_tgr).

evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, good)).
query(true_val(jumps_rating_tgr, unk_jumps_rating_tgr)).

% @attr jibbing_rating_tgr
% @type categorical
% @canonical false
% @original_name jibbing_rating_tgr
% @values good=Good unk_jibbing_rating_tgr=Unknown
% @importance 0.85

0.78::acc(s15, jibbing_rating_tgr).

0.72::true_val(jibbing_rating_tgr, good); 0.28::true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr).

measured(s15, jibbing_rating_tgr, good).

all_consistent(jibbing_rating_tgr) :- consistent(s15, jibbing_rating_tgr).

evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, good)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr)).

% @attr pipe_rating_tgr
% @type categorical
% @canonical false
% @original_name pipe_rating_tgr
% @values good=Good unk_pipe_rating_tgr=Unknown
% @importance 0.85

0.78::acc(s15, pipe_rating_tgr).

0.72::true_val(pipe_rating_tgr, good); 0.28::true_val(pipe_rating_tgr, unk_pipe_rating_tgr).

measured(s15, pipe_rating_tgr, good).

all_consistent(pipe_rating_tgr) :- consistent(s15, pipe_rating_tgr).

evidence(all_consistent(pipe_rating_tgr)).
query(true_val(pipe_rating_tgr, good)).
query(true_val(pipe_rating_tgr, unk_pipe_rating_tgr)).

% @attr edge_hold
% @type categorical
% @canonical false
% @original_name edge_hold
% @values icy_snow_excellent=Icy_Snow_excellent unk_edge_hold=Unknown
% @importance 0.85

0.78::acc(s15, edge_hold).

0.72::true_val(edge_hold, icy_snow_excellent); 0.28::true_val(edge_hold, unk_edge_hold).

measured(s15, edge_hold, icy_snow_excellent).

all_consistent(edge_hold) :- consistent(s15, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, icy_snow_excellent)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr on_snow_feel_tgr
% @type categorical
% @canonical false
% @original_name on_snow_feel_tgr
% @values semi_stable=Semi_Stable unk_on_snow_feel_tgr=Unknown
% @importance 0.85

0.78::acc(s15, on_snow_feel_tgr).

0.72::true_val(on_snow_feel_tgr, semi_stable); 0.28::true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr).

measured(s15, on_snow_feel_tgr, semi_stable).

all_consistent(on_snow_feel_tgr) :- consistent(s15, on_snow_feel_tgr).

evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, semi_stable)).
query(true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr)).

% @attr turn_initiation_performance
% @type categorical
% @canonical false
% @original_name turn_initiation_performance
% @values fast=Fast unk_turn_initiation_performance=Unknown
% @importance 0.85

0.78::acc(s15, turn_initiation_performance).

0.72::true_val(turn_initiation_performance, fast); 0.28::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s15, turn_initiation_performance, fast).

all_consistent(turn_initiation_performance) :- consistent(s15, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, fast)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr reviewer_opinion_the_good_ride_ease
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values easy=Easy unk_reviewer_opinion_the_good_ride_ease=Unknown
% @importance 0.85

0.78::acc(s15, reviewer_opinion_the_good_ride_ease).

0.72::true_val(reviewer_opinion_the_good_ride_ease, easy); 0.28::true_val(reviewer_opinion_the_good_ride_ease, unk_reviewer_opinion_the_good_ride_ease).

measured(s15, reviewer_opinion_the_good_ride_ease, easy).

all_consistent(reviewer_opinion_the_good_ride_ease) :- consistent(s15, reviewer_opinion_the_good_ride_ease).

evidence(all_consistent(reviewer_opinion_the_good_ride_ease)).
query(true_val(reviewer_opinion_the_good_ride_ease, easy)).
query(true_val(reviewer_opinion_the_good_ride_ease, unk_reviewer_opinion_the_good_ride_ease)).

% @attr reviewer_opinion_the_good_ride_buttering
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values semi_easy=Semi_Easy unk_reviewer_opinion_the_good_ride_buttering=Unknown
% @importance 0.85

0.78::acc(s15, reviewer_opinion_the_good_ride_buttering).

0.72::true_val(reviewer_opinion_the_good_ride_buttering, semi_easy); 0.28::true_val(reviewer_opinion_the_good_ride_buttering, unk_reviewer_opinion_the_good_ride_buttering).

measured(s15, reviewer_opinion_the_good_ride_buttering, semi_easy).

all_consistent(reviewer_opinion_the_good_ride_buttering) :- consistent(s15, reviewer_opinion_the_good_ride_buttering).

evidence(all_consistent(reviewer_opinion_the_good_ride_buttering)).
query(true_val(reviewer_opinion_the_good_ride_buttering, semi_easy)).
query(true_val(reviewer_opinion_the_good_ride_buttering, unk_reviewer_opinion_the_good_ride_buttering)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values beginner_expert=Beginner_to_Expert beginner_focused=More_aimed_toward_beginners
% @importance 0.7

0.80::acc(s15, skill_level_recommendation).
0.65::acc(s36, skill_level_recommendation).

0.55::true_val(skill_level_recommendation, beginner_expert); 0.45::true_val(skill_level_recommendation, beginner_focused).

measured(s15, skill_level_recommendation, beginner_expert).
measured(s36, skill_level_recommendation, beginner_focused).

all_consistent(skill_level_recommendation) :-
    consistent(s15, skill_level_recommendation),
    consistent(s36, skill_level_recommendation).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, beginner_expert)).
query(true_val(skill_level_recommendation, beginner_focused)).

% @attr reviewer_opinion_the_good_ride_boot_fit
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values normal=Normal unk_reviewer_opinion_the_good_ride_boot_fit=Unknown
% @importance 0.85

0.78::acc(s15, reviewer_opinion_the_good_ride_boot_fit).

0.72::true_val(reviewer_opinion_the_good_ride_boot_fit, normal); 0.28::true_val(reviewer_opinion_the_good_ride_boot_fit, unk_reviewer_opinion_the_good_ride_boot_fit).

measured(s15, reviewer_opinion_the_good_ride_boot_fit, normal).

all_consistent(reviewer_opinion_the_good_ride_boot_fit) :- consistent(s15, reviewer_opinion_the_good_ride_boot_fit).

evidence(all_consistent(reviewer_opinion_the_good_ride_boot_fit)).
query(true_val(reviewer_opinion_the_good_ride_boot_fit, normal)).
query(true_val(reviewer_opinion_the_good_ride_boot_fit, unk_reviewer_opinion_the_good_ride_boot_fit)).

% @attr botw_ranking
% @type categorical
% @canonical false
% @original_name Board of the World ranking
% @values rank_36_of_38=36th_of_38_all_mountain unk_botw_ranking=Unknown
% @importance 0.85

0.70::acc(s19, botw_ranking).

0.63::true_val(botw_ranking, rank_36_of_38); 0.37::true_val(botw_ranking, unk_botw_ranking).

measured(s19, botw_ranking, rank_36_of_38).

all_consistent(botw_ranking) :- consistent(s19, botw_ranking).

evidence(all_consistent(botw_ranking)).
query(true_val(botw_ranking, rank_36_of_38)).
query(true_val(botw_ranking, unk_botw_ranking)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values great_low_cost_park=Great_low_cost_park_deck_fun_to_ride unk_user_review_forum=Unknown
% @importance 0.6

0.60::acc(s28, user_review_forum).

0.52::true_val(user_review_forum, great_low_cost_park); 0.48::true_val(user_review_forum, unk_user_review_forum).

measured(s28, user_review_forum, great_low_cost_park).

all_consistent(user_review_forum) :- consistent(s28, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, great_low_cost_park)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values exceptional_price_magne_traction=Exceptional_for_price_Magne_Traction_grip unk_positive_aspect=Unknown
% @importance 0.85

0.75::acc(s27, positive_aspect).

0.63::true_val(positive_aspect, exceptional_price_magne_traction); 0.37::true_val(positive_aspect, unk_positive_aspect).

measured(s27, positive_aspect, exceptional_price_magne_traction).

all_consistent(positive_aspect) :- consistent(s27, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, exceptional_price_magne_traction)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr positive_aspect_ice
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values outstanding_ice=Outstanding_for_East_Coast_Midwest_icy_conditions unk_positive_aspect_ice=Unknown
% @importance 0.85

0.75::acc(s27, positive_aspect_ice).

0.63::true_val(positive_aspect_ice, outstanding_ice); 0.37::true_val(positive_aspect_ice, unk_positive_aspect_ice).

measured(s27, positive_aspect_ice, outstanding_ice).

all_consistent(positive_aspect_ice) :- consistent(s27, positive_aspect_ice).

evidence(all_consistent(positive_aspect_ice)).
query(true_val(positive_aspect_ice, outstanding_ice)).
query(true_val(positive_aspect_ice, unk_positive_aspect_ice)).

% @attr positive_aspect_control
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values precise_control=Precise_and_in_control_at_all_times unk_positive_aspect_control=Unknown
% @importance 0.85

0.75::acc(s27, positive_aspect_control).

0.63::true_val(positive_aspect_control, precise_control); 0.37::true_val(positive_aspect_control, unk_positive_aspect_control).

measured(s27, positive_aspect_control, precise_control).

all_consistent(positive_aspect_control) :- consistent(s27, positive_aspect_control).

evidence(all_consistent(positive_aspect_control)).
query(true_val(positive_aspect_control, precise_control)).
query(true_val(positive_aspect_control, unk_positive_aspect_control)).

% @attr positive_aspect_beginner
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values great_first_board=Great_first_snowboard_easy_to_learn unk_positive_aspect_beginner=Unknown
% @importance 0.85

0.70::acc(s19, positive_aspect_beginner).

0.63::true_val(positive_aspect_beginner, great_first_board); 0.37::true_val(positive_aspect_beginner, unk_positive_aspect_beginner).

measured(s19, positive_aspect_beginner, great_first_board).

all_consistent(positive_aspect_beginner) :- consistent(s19, positive_aspect_beginner).

evidence(all_consistent(positive_aspect_beginner)).
query(true_val(positive_aspect_beginner, great_first_board)).
query(true_val(positive_aspect_beginner, unk_positive_aspect_beginner)).

% @attr positive_aspect_buttering
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values easy_butter=Easy_to_nose_press_and_butter_C2e_profile unk_positive_aspect_buttering=Unknown
% @importance 0.8

0.72::acc(s26, positive_aspect_buttering).

0.63::true_val(positive_aspect_buttering, easy_butter); 0.37::true_val(positive_aspect_buttering, unk_positive_aspect_buttering).

measured(s26, positive_aspect_buttering, easy_butter).

all_consistent(positive_aspect_buttering) :- consistent(s26, positive_aspect_buttering).

evidence(all_consistent(positive_aspect_buttering)).
query(true_val(positive_aspect_buttering, easy_butter)).
query(true_val(positive_aspect_buttering, unk_positive_aspect_buttering)).

% @attr positive_aspect_jibbing
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values jibbing_highlight=Jibbing_highlight_flex_pattern_rocker_profile unk_positive_aspect_jibbing=Unknown
% @importance 0.8

0.72::acc(s26, positive_aspect_jibbing).

0.63::true_val(positive_aspect_jibbing, jibbing_highlight); 0.37::true_val(positive_aspect_jibbing, unk_positive_aspect_jibbing).

measured(s26, positive_aspect_jibbing, jibbing_highlight).

all_consistent(positive_aspect_jibbing) :- consistent(s26, positive_aspect_jibbing).

evidence(all_consistent(positive_aspect_jibbing)).
query(true_val(positive_aspect_jibbing, jibbing_highlight)).
query(true_val(positive_aspect_jibbing, unk_positive_aspect_jibbing)).

% @attr positive_aspect_value
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values main_perk_value=Main_perk_is_value_for_price unk_positive_aspect_value=Unknown
% @importance 0.85

0.70::acc(s19, positive_aspect_value).

0.63::true_val(positive_aspect_value, main_perk_value); 0.37::true_val(positive_aspect_value, unk_positive_aspect_value).

measured(s19, positive_aspect_value, main_perk_value).

all_consistent(positive_aspect_value) :- consistent(s19, positive_aspect_value).

evidence(all_consistent(positive_aspect_value)).
query(true_val(positive_aspect_value, main_perk_value)).
query(true_val(positive_aspect_value, unk_positive_aspect_value)).

% @attr positive_aspect_build_quality
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values exceptional_build=Exceptional_build_quality_for_price_made_in_USA unk_positive_aspect_build_quality=Unknown
% @importance 0.85

0.70::acc(s19, positive_aspect_build_quality).

0.63::true_val(positive_aspect_build_quality, exceptional_build); 0.37::true_val(positive_aspect_build_quality, unk_positive_aspect_build_quality).

measured(s19, positive_aspect_build_quality, exceptional_build).

all_consistent(positive_aspect_build_quality) :- consistent(s19, positive_aspect_build_quality).

evidence(all_consistent(positive_aspect_build_quality)).
query(true_val(positive_aspect_build_quality, exceptional_build)).
query(true_val(positive_aspect_build_quality, unk_positive_aspect_build_quality)).

% @attr positive_aspect_uhmw
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values uhmw_impact=UHMW_sidewalls_absorb_accidental_impacts unk_positive_aspect_uhmw=Unknown
% @importance 0.7

0.72::acc(s25, positive_aspect_uhmw).

0.63::true_val(positive_aspect_uhmw, uhmw_impact); 0.37::true_val(positive_aspect_uhmw, unk_positive_aspect_uhmw).

measured(s25, positive_aspect_uhmw, uhmw_impact).

all_consistent(positive_aspect_uhmw) :- consistent(s25, positive_aspect_uhmw).

evidence(all_consistent(positive_aspect_uhmw)).
query(true_val(positive_aspect_uhmw, uhmw_impact)).
query(true_val(positive_aspect_uhmw, unk_positive_aspect_uhmw)).

% @attr switch_riding
% @type categorical
% @canonical false
% @original_name switch_riding
% @values perfect_twin_switch=Perfect_twin_equal_switch_regular unk_switch_riding=Unknown
% @importance 0.85

0.88::acc(s_m, switch_riding).

0.95::true_val(switch_riding, perfect_twin_switch); 0.05::true_val(switch_riding, unk_switch_riding).

measured(s_m, switch_riding, perfect_twin_switch).

all_consistent(switch_riding) :- consistent(s_m, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, perfect_twin_switch)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr positive_aspect_fun
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values rated_5_5_fun=Rated_5_of_5_fun_to_ride unk_positive_aspect_fun=Unknown
% @importance 0.85

0.70::acc(s19, positive_aspect_fun).

0.63::true_val(positive_aspect_fun, rated_5_5_fun); 0.37::true_val(positive_aspect_fun, unk_positive_aspect_fun).

measured(s19, positive_aspect_fun, rated_5_5_fun).

all_consistent(positive_aspect_fun) :- consistent(s19, positive_aspect_fun).

evidence(all_consistent(positive_aspect_fun)).
query(true_val(positive_aspect_fun, rated_5_5_fun)).
query(true_val(positive_aspect_fun, unk_positive_aspect_fun)).

% @attr positive_aspect_swing_weight
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values blunted_low_swing=Blunted_nose_tail_keeps_swing_weight_down unk_positive_aspect_swing_weight=Unknown
% @importance 0.8

0.72::acc(s26, positive_aspect_swing_weight).

0.63::true_val(positive_aspect_swing_weight, blunted_low_swing); 0.37::true_val(positive_aspect_swing_weight, unk_positive_aspect_swing_weight).

measured(s26, positive_aspect_swing_weight, blunted_low_swing).

all_consistent(positive_aspect_swing_weight) :- consistent(s26, positive_aspect_swing_weight).

evidence(all_consistent(positive_aspect_swing_weight)).
query(true_val(positive_aspect_swing_weight, blunted_low_swing)).
query(true_val(positive_aspect_swing_weight, unk_positive_aspect_swing_weight)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values slow_base=Can_feel_slow_co_extruded_base_not_fastest unk_negative_aspect=Unknown
% @importance 0.85

0.70::acc(s19, negative_aspect).

0.63::true_val(negative_aspect, slow_base); 0.37::true_val(negative_aspect, unk_negative_aspect).

measured(s19, negative_aspect, slow_base).

all_consistent(negative_aspect) :- consistent(s19, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, slow_base)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_pop
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values average_pop=Very_average_pop_no_extra_power unk_negative_aspect_pop=Unknown
% @importance 0.8

0.72::acc(s26, negative_aspect_pop).

0.63::true_val(negative_aspect_pop, average_pop); 0.37::true_val(negative_aspect_pop, unk_negative_aspect_pop).

measured(s26, negative_aspect_pop, average_pop).

all_consistent(negative_aspect_pop) :- consistent(s26, negative_aspect_pop).

evidence(all_consistent(negative_aspect_pop)).
query(true_val(negative_aspect_pop, average_pop)).
query(true_val(negative_aspect_pop, unk_negative_aspect_pop)).

% @attr negative_aspect_experienced
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values lacking_for_experienced=Lacking_pop_and_carving_for_experienced_riders unk_negative_aspect_experienced=Unknown
% @importance 0.85

0.70::acc(s19, negative_aspect_experienced).

0.63::true_val(negative_aspect_experienced, lacking_for_experienced); 0.37::true_val(negative_aspect_experienced, unk_negative_aspect_experienced).

measured(s19, negative_aspect_experienced, lacking_for_experienced).

all_consistent(negative_aspect_experienced) :- consistent(s19, negative_aspect_experienced).

evidence(all_consistent(negative_aspect_experienced)).
query(true_val(negative_aspect_experienced, lacking_for_experienced)).
query(true_val(negative_aspect_experienced, unk_negative_aspect_experienced)).

% @attr negative_aspect_dampness
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values not_damp=Not_damp_very_lively_all_vibrations unk_negative_aspect_dampness=Unknown
% @importance 0.8

0.72::acc(s26, negative_aspect_dampness).

0.63::true_val(negative_aspect_dampness, not_damp); 0.37::true_val(negative_aspect_dampness, unk_negative_aspect_dampness).

measured(s26, negative_aspect_dampness, not_damp).

all_consistent(negative_aspect_dampness) :- consistent(s26, negative_aspect_dampness).

evidence(all_consistent(negative_aspect_dampness)).
query(true_val(negative_aspect_dampness, not_damp)).
query(true_val(negative_aspect_dampness, unk_negative_aspect_dampness)).

% @attr negative_aspect_jumps
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values under_40ft=Better_for_jumps_under_40ft unk_negative_aspect_jumps=Unknown
% @importance 0.8

0.72::acc(s26, negative_aspect_jumps).

0.63::true_val(negative_aspect_jumps, under_40ft); 0.37::true_val(negative_aspect_jumps, unk_negative_aspect_jumps).

measured(s26, negative_aspect_jumps, under_40ft).

all_consistent(negative_aspect_jumps) :- consistent(s26, negative_aspect_jumps).

evidence(all_consistent(negative_aspect_jumps)).
query(true_val(negative_aspect_jumps, under_40ft)).
query(true_val(negative_aspect_jumps, unk_negative_aspect_jumps)).

% @attr negative_aspect_speed
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values nerve_wracking_speed=Nerve_wracking_at_speed unk_negative_aspect_speed=Unknown
% @importance 0.65

0.52::acc(s29, negative_aspect_speed).

0.44::true_val(negative_aspect_speed, nerve_wracking_speed); 0.56::true_val(negative_aspect_speed, unk_negative_aspect_speed).

measured(s29, negative_aspect_speed, nerve_wracking_speed).

all_consistent(negative_aspect_speed) :- consistent(s29, negative_aspect_speed).

evidence(all_consistent(negative_aspect_speed)).
query(true_val(negative_aspect_speed, nerve_wracking_speed)).
query(true_val(negative_aspect_speed, unk_negative_aspect_speed)).

% @attr negative_aspect_powder
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values not_for_powder=Not_suited_for_deep_powder_twin_limited_float unk_negative_aspect_powder=Unknown
% @importance 0.85

0.78::acc(s15, negative_aspect_powder).

0.72::true_val(negative_aspect_powder, not_for_powder); 0.28::true_val(negative_aspect_powder, unk_negative_aspect_powder).

measured(s15, negative_aspect_powder, not_for_powder).

all_consistent(negative_aspect_powder) :- consistent(s15, negative_aspect_powder).

evidence(all_consistent(negative_aspect_powder)).
query(true_val(negative_aspect_powder, not_for_powder)).
query(true_val(negative_aspect_powder, unk_negative_aspect_powder)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values c_money_c3=GNU_C_Money_C3_camber_dominant_same_price unk_comparable_board_same_brand=Unknown
% @importance 0.75

0.90::acc(s30, comparable_board_same_brand).

0.86::true_val(comparable_board_same_brand, c_money_c3); 0.14::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s30, comparable_board_same_brand, c_money_c3).

all_consistent(comparable_board_same_brand) :- consistent(s30, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, c_money_c3)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values salomon_huck_knife=Salomon_Huck_Knife_better_board_sintered_base unk_comparable_board_cross_brand=Unknown
% @importance 0.73

0.75::acc(s31, comparable_board_cross_brand).
0.55::acc(s32, comparable_board_cross_brand).

0.95::true_val(comparable_board_cross_brand, salomon_huck_knife); 0.05::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s31, comparable_board_cross_brand, salomon_huck_knife).
measured(s32, comparable_board_cross_brand, salomon_huck_knife).

all_consistent(comparable_board_cross_brand) :-
    consistent(s31, comparable_board_cross_brand),
    consistent(s32, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, salomon_huck_knife)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr user_review_forum_huck_knife
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values hk_won_83_17=Huck_Knife_won_83pct_to_17pct_5v1 unk_user_review_forum_huck_knife=Unknown
% @importance 0.75

0.50::acc(s32, user_review_forum_huck_knife).

0.38::true_val(user_review_forum_huck_knife, hk_won_83_17); 0.62::true_val(user_review_forum_huck_knife, unk_user_review_forum_huck_knife).

measured(s32, user_review_forum_huck_knife, hk_won_83_17).

all_consistent(user_review_forum_huck_knife) :- consistent(s32, user_review_forum_huck_knife).

evidence(all_consistent(user_review_forum_huck_knife)).
query(true_val(user_review_forum_huck_knife, hk_won_83_17)).
query(true_val(user_review_forum_huck_knife, unk_user_review_forum_huck_knife)).

% @attr comparable_board_cross_brand_hk_score
% @type numeric
% @canonical false
% @original_name comparable_board_cross_brand
% @unit /100
% @values v85_175=85.175 unk_comparable_board_cross_brand_hk_score=Unknown
% @importance 0.75

0.70::acc(s33, comparable_board_cross_brand_hk_score).

0.60::true_val(comparable_board_cross_brand_hk_score, v85_175); 0.40::true_val(comparable_board_cross_brand_hk_score, unk_comparable_board_cross_brand_hk_score).

measured(s33, comparable_board_cross_brand_hk_score, v85_175).

all_consistent(comparable_board_cross_brand_hk_score) :- consistent(s33, comparable_board_cross_brand_hk_score).

evidence(all_consistent(comparable_board_cross_brand_hk_score)).
query(true_val(comparable_board_cross_brand_hk_score, v85_175)).
query(true_val(comparable_board_cross_brand_hk_score, unk_comparable_board_cross_brand_hk_score)).

% @attr comparable_board_cross_brand_alternatives
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values capita_doa_burton_process_rome_agent=Capita_DOA_Burton_Process_Rome_Agent unk_comparable_board_cross_brand_alternatives=Unknown
% @importance 0.75

0.68::acc(s33, comparable_board_cross_brand_alternatives).
0.62::acc(s34, comparable_board_cross_brand_alternatives).

0.95::true_val(comparable_board_cross_brand_alternatives, capita_doa_burton_process_rome_agent); 0.05::true_val(comparable_board_cross_brand_alternatives, unk_comparable_board_cross_brand_alternatives).

measured(s33, comparable_board_cross_brand_alternatives, capita_doa_burton_process_rome_agent).
measured(s34, comparable_board_cross_brand_alternatives, capita_doa_burton_process_rome_agent).

all_consistent(comparable_board_cross_brand_alternatives) :-
    consistent(s33, comparable_board_cross_brand_alternatives),
    consistent(s34, comparable_board_cross_brand_alternatives).

evidence(all_consistent(comparable_board_cross_brand_alternatives)).
query(true_val(comparable_board_cross_brand_alternatives, capita_doa_burton_process_rome_agent)).
query(true_val(comparable_board_cross_brand_alternatives, unk_comparable_board_cross_brand_alternatives)).

% @attr comparable_board_same_brand_young_money
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values young_money=Young_Money_youth_version_same_construction unk_comparable_board_same_brand_young_money=Unknown
% @importance 0.4

0.85::acc(s35, comparable_board_same_brand_young_money).

0.77::true_val(comparable_board_same_brand_young_money, young_money); 0.23::true_val(comparable_board_same_brand_young_money, unk_comparable_board_same_brand_young_money).

measured(s35, comparable_board_same_brand_young_money, young_money).

all_consistent(comparable_board_same_brand_young_money) :- consistent(s35, comparable_board_same_brand_young_money).

evidence(all_consistent(comparable_board_same_brand_young_money)).
query(true_val(comparable_board_same_brand_young_money, young_money)).
query(true_val(comparable_board_same_brand_young_money, unk_comparable_board_same_brand_young_money)).

% @attr comparable_board_cross_brand_rome_agent
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values rome_agent_better_carve=Rome_Agent_Money_C2e_not_as_good_on_carve unk_comparable_board_cross_brand_rome_agent=Unknown
% @importance 0.65

0.62::acc(s34, comparable_board_cross_brand_rome_agent).

0.52::true_val(comparable_board_cross_brand_rome_agent, rome_agent_better_carve); 0.48::true_val(comparable_board_cross_brand_rome_agent, unk_comparable_board_cross_brand_rome_agent).

measured(s34, comparable_board_cross_brand_rome_agent, rome_agent_better_carve).

all_consistent(comparable_board_cross_brand_rome_agent) :- consistent(s34, comparable_board_cross_brand_rome_agent).

evidence(all_consistent(comparable_board_cross_brand_rome_agent)).
query(true_val(comparable_board_cross_brand_rome_agent, rome_agent_better_carve)).
query(true_val(comparable_board_cross_brand_rome_agent, unk_comparable_board_cross_brand_rome_agent)).

% @attr warranty_period_years
% @type numeric
% @canonical false
% @original_name warranty_period_years
% @unit years
% @values v1=1.0 unk_warranty_period_years=Unknown
% @importance 0.7

0.80::acc(s37, warranty_period_years).

0.68::true_val(warranty_period_years, v1); 0.32::true_val(warranty_period_years, unk_warranty_period_years).

measured(s37, warranty_period_years, v1).

all_consistent(warranty_period_years) :- consistent(s37, warranty_period_years).

evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v1)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

% @attr warranty_coverage
% @type categorical
% @canonical false
% @original_name warranty
% @values structural_defects_only=Structural_defects_only_no_impact_abuse unk_warranty_coverage=Unknown
% @importance 0.7

0.80::acc(s37, warranty_coverage).

0.68::true_val(warranty_coverage, structural_defects_only); 0.32::true_val(warranty_coverage, unk_warranty_coverage).

measured(s37, warranty_coverage, structural_defects_only).

all_consistent(warranty_coverage) :- consistent(s37, warranty_coverage).

evidence(all_consistent(warranty_coverage)).
query(true_val(warranty_coverage, structural_defects_only)).
query(true_val(warranty_coverage, unk_warranty_coverage)).

% @attr merchant_condition
% @type categorical
% @canonical false
% @original_name Merchant condition
% @values b_grade=B_Grade_slight_cosmetic_defects unk_merchant_condition=Unknown
% @importance 0.85

0.93::acc(s_m, merchant_condition).

0.95::true_val(merchant_condition, b_grade); 0.05::true_val(merchant_condition, unk_merchant_condition).

measured(s_m, merchant_condition, b_grade).

all_consistent(merchant_condition) :- consistent(s_m, merchant_condition).

evidence(all_consistent(merchant_condition)).
query(true_val(merchant_condition, b_grade)).
query(true_val(merchant_condition, unk_merchant_condition)).

% @attr merchant_sku
% @type categorical
% @canonical false
% @original_name Merchant SKU
% @values sku_24sn004_154=24SN004_154 unk_merchant_sku=Unknown
% @importance 0.85

0.93::acc(s_m, merchant_sku).

0.95::true_val(merchant_sku, sku_24sn004_154); 0.05::true_val(merchant_sku, unk_merchant_sku).

measured(s_m, merchant_sku, sku_24sn004_154).

all_consistent(merchant_sku) :- consistent(s_m, merchant_sku).

evidence(all_consistent(merchant_sku)).
query(true_val(merchant_sku, sku_24sn004_154)).
query(true_val(merchant_sku, unk_merchant_sku)).

% @attr merchant_discount
% @type numeric
% @canonical false
% @original_name Merchant discount
% @unit percent
% @values v30=30.0 unk_merchant_discount=Unknown
% @importance 0.85

0.93::acc(s_m, merchant_discount).

0.95::true_val(merchant_discount, v30); 0.05::true_val(merchant_discount, unk_merchant_discount).

measured(s_m, merchant_discount, v30).

all_consistent(merchant_discount) :- consistent(s_m, merchant_discount).

evidence(all_consistent(merchant_discount)).
query(true_val(merchant_discount, v30)).
query(true_val(merchant_discount, unk_merchant_discount)).

% @attr contact_length_size_144
% @type numeric
% @canonical false
% @original_name contact_length_size
% @unit cm
% @values v110_0=110.0 unk_contact_length_size_144=Unknown
% @importance 0.85

0.88::acc(s_m, contact_length_size_144).

0.95::true_val(contact_length_size_144, v110_0); 0.05::true_val(contact_length_size_144, unk_contact_length_size_144).

measured(s_m, contact_length_size_144, v110_0).

all_consistent(contact_length_size_144) :- consistent(s_m, contact_length_size_144).

evidence(all_consistent(contact_length_size_144)).
query(true_val(contact_length_size_144, v110_0)).
query(true_val(contact_length_size_144, unk_contact_length_size_144)).

% @attr sidecut_radius_size_144
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v7_9=7.9 unk_sidecut_radius_size_144=Unknown
% @importance 0.85

0.88::acc(s_m, sidecut_radius_size_144).

0.95::true_val(sidecut_radius_size_144, v7_9); 0.05::true_val(sidecut_radius_size_144, unk_sidecut_radius_size_144).

measured(s_m, sidecut_radius_size_144, v7_9).

all_consistent(sidecut_radius_size_144) :- consistent(s_m, sidecut_radius_size_144).

evidence(all_consistent(sidecut_radius_size_144)).
query(true_val(sidecut_radius_size_144, v7_9)).
query(true_val(sidecut_radius_size_144, unk_sidecut_radius_size_144)).

% @attr tip_tail_width_size_144
% @type numeric
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v27_9=27.9 unk_tip_tail_width_size_144=Unknown
% @importance 0.85

0.88::acc(s_m, tip_tail_width_size_144).

0.95::true_val(tip_tail_width_size_144, v27_9); 0.05::true_val(tip_tail_width_size_144, unk_tip_tail_width_size_144).

measured(s_m, tip_tail_width_size_144, v27_9).

all_consistent(tip_tail_width_size_144) :- consistent(s_m, tip_tail_width_size_144).

evidence(all_consistent(tip_tail_width_size_144)).
query(true_val(tip_tail_width_size_144, v27_9)).
query(true_val(tip_tail_width_size_144, unk_tip_tail_width_size_144)).

% @attr waist_width_144
% @type numeric
% @canonical false
% @original_name waist width 144cm
% @unit cm
% @values v24_2=24.2 unk_waist_width_144=Unknown
% @importance 0.85

0.88::acc(s_m, waist_width_144).

0.95::true_val(waist_width_144, v24_2); 0.05::true_val(waist_width_144, unk_waist_width_144).

measured(s_m, waist_width_144, v24_2).

all_consistent(waist_width_144) :- consistent(s_m, waist_width_144).

evidence(all_consistent(waist_width_144)).
query(true_val(waist_width_144, v24_2)).
query(true_val(waist_width_144, unk_waist_width_144)).

% @attr stance_width_range_size_144
% @type categorical
% @canonical false
% @original_name stance_width_range_size
% @values range_19_0_to_24_0=19_0in_to_24_0in unk_stance_width_range_size_144=Unknown
% @importance 0.85

0.88::acc(s_m, stance_width_range_size_144).

0.95::true_val(stance_width_range_size_144, range_19_0_to_24_0); 0.05::true_val(stance_width_range_size_144, unk_stance_width_range_size_144).

measured(s_m, stance_width_range_size_144, range_19_0_to_24_0).

all_consistent(stance_width_range_size_144) :- consistent(s_m, stance_width_range_size_144).

evidence(all_consistent(stance_width_range_size_144)).
query(true_val(stance_width_range_size_144, range_19_0_to_24_0)).
query(true_val(stance_width_range_size_144, unk_stance_width_range_size_144)).

% @attr setback_144
% @type numeric
% @canonical false
% @original_name setback
% @unit mm
% @values v0=0.0 unk_setback_144=Unknown
% @importance 0.85

0.88::acc(s_m, setback_144).

0.95::true_val(setback_144, v0); 0.05::true_val(setback_144, unk_setback_144).

measured(s_m, setback_144, v0).

all_consistent(setback_144) :- consistent(s_m, setback_144).

evidence(all_consistent(setback_144)).
query(true_val(setback_144, v0)).
query(true_val(setback_144, unk_setback_144)).

% @attr recommended_weight_range_size_144
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values v35_plus_kg=35_plus_kg unk_recommended_weight_range_size_144=Unknown
% @importance 0.85

0.88::acc(s_m, recommended_weight_range_size_144).

0.95::true_val(recommended_weight_range_size_144, v35_plus_kg); 0.05::true_val(recommended_weight_range_size_144, unk_recommended_weight_range_size_144).

measured(s_m, recommended_weight_range_size_144, v35_plus_kg).

all_consistent(recommended_weight_range_size_144) :- consistent(s_m, recommended_weight_range_size_144).

evidence(all_consistent(recommended_weight_range_size_144)).
query(true_val(recommended_weight_range_size_144, v35_plus_kg)).
query(true_val(recommended_weight_range_size_144, unk_recommended_weight_range_size_144)).

% @attr contact_length_size_148
% @type numeric
% @canonical false
% @original_name contact_length_size
% @unit cm
% @values v113_0=113.0 unk_contact_length_size_148=Unknown
% @importance 0.85

0.88::acc(s_m, contact_length_size_148).

0.95::true_val(contact_length_size_148, v113_0); 0.05::true_val(contact_length_size_148, unk_contact_length_size_148).

measured(s_m, contact_length_size_148, v113_0).

all_consistent(contact_length_size_148) :- consistent(s_m, contact_length_size_148).

evidence(all_consistent(contact_length_size_148)).
query(true_val(contact_length_size_148, v113_0)).
query(true_val(contact_length_size_148, unk_contact_length_size_148)).

% @attr sidecut_radius_size_148
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v8_0=8.0 unk_sidecut_radius_size_148=Unknown
% @importance 0.85

0.88::acc(s_m, sidecut_radius_size_148).

0.95::true_val(sidecut_radius_size_148, v8_0); 0.05::true_val(sidecut_radius_size_148, unk_sidecut_radius_size_148).

measured(s_m, sidecut_radius_size_148, v8_0).

all_consistent(sidecut_radius_size_148) :- consistent(s_m, sidecut_radius_size_148).

evidence(all_consistent(sidecut_radius_size_148)).
query(true_val(sidecut_radius_size_148, v8_0)).
query(true_val(sidecut_radius_size_148, unk_sidecut_radius_size_148)).

% @attr tip_tail_width_size_148
% @type numeric
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v28_6=28.6 unk_tip_tail_width_size_148=Unknown
% @importance 0.85

0.88::acc(s_m, tip_tail_width_size_148).

0.95::true_val(tip_tail_width_size_148, v28_6); 0.05::true_val(tip_tail_width_size_148, unk_tip_tail_width_size_148).

measured(s_m, tip_tail_width_size_148, v28_6).

all_consistent(tip_tail_width_size_148) :- consistent(s_m, tip_tail_width_size_148).

evidence(all_consistent(tip_tail_width_size_148)).
query(true_val(tip_tail_width_size_148, v28_6)).
query(true_val(tip_tail_width_size_148, unk_tip_tail_width_size_148)).

% @attr waist_width_148
% @type numeric
% @canonical false
% @original_name waist width 148cm
% @unit cm
% @values v24_7=24.7 unk_waist_width_148=Unknown
% @importance 0.85

0.88::acc(s_m, waist_width_148).

0.95::true_val(waist_width_148, v24_7); 0.05::true_val(waist_width_148, unk_waist_width_148).

measured(s_m, waist_width_148, v24_7).

all_consistent(waist_width_148) :- consistent(s_m, waist_width_148).

evidence(all_consistent(waist_width_148)).
query(true_val(waist_width_148, v24_7)).
query(true_val(waist_width_148, unk_waist_width_148)).

% @attr stance_width_range_size_148
% @type categorical
% @canonical false
% @original_name stance_width_range_size
% @values range_19_0_to_24_0=19_0in_to_24_0in unk_stance_width_range_size_148=Unknown
% @importance 0.85

0.88::acc(s_m, stance_width_range_size_148).

0.95::true_val(stance_width_range_size_148, range_19_0_to_24_0); 0.05::true_val(stance_width_range_size_148, unk_stance_width_range_size_148).

measured(s_m, stance_width_range_size_148, range_19_0_to_24_0).

all_consistent(stance_width_range_size_148) :- consistent(s_m, stance_width_range_size_148).

evidence(all_consistent(stance_width_range_size_148)).
query(true_val(stance_width_range_size_148, range_19_0_to_24_0)).
query(true_val(stance_width_range_size_148, unk_stance_width_range_size_148)).

% @attr setback_148
% @type numeric
% @canonical false
% @original_name setback
% @unit mm
% @values v0=0.0 unk_setback_148=Unknown
% @importance 0.85

0.88::acc(s_m, setback_148).

0.95::true_val(setback_148, v0); 0.05::true_val(setback_148, unk_setback_148).

measured(s_m, setback_148, v0).

all_consistent(setback_148) :- consistent(s_m, setback_148).

evidence(all_consistent(setback_148)).
query(true_val(setback_148, v0)).
query(true_val(setback_148, unk_setback_148)).

% @attr recommended_weight_range_size_148
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values v35_plus_kg=35_plus_kg unk_recommended_weight_range_size_148=Unknown
% @importance 0.85

0.88::acc(s_m, recommended_weight_range_size_148).

0.95::true_val(recommended_weight_range_size_148, v35_plus_kg); 0.05::true_val(recommended_weight_range_size_148, unk_recommended_weight_range_size_148).

measured(s_m, recommended_weight_range_size_148, v35_plus_kg).

all_consistent(recommended_weight_range_size_148) :- consistent(s_m, recommended_weight_range_size_148).

evidence(all_consistent(recommended_weight_range_size_148)).
query(true_val(recommended_weight_range_size_148, v35_plus_kg)).
query(true_val(recommended_weight_range_size_148, unk_recommended_weight_range_size_148)).

% @attr contact_length_size_152
% @type numeric
% @canonical false
% @original_name contact_length_size
% @unit cm
% @values v115_0=115.0 unk_contact_length_size_152=Unknown
% @importance 0.85

0.88::acc(s_m, contact_length_size_152).

0.95::true_val(contact_length_size_152, v115_0); 0.05::true_val(contact_length_size_152, unk_contact_length_size_152).

measured(s_m, contact_length_size_152, v115_0).

all_consistent(contact_length_size_152) :- consistent(s_m, contact_length_size_152).

evidence(all_consistent(contact_length_size_152)).
query(true_val(contact_length_size_152, v115_0)).
query(true_val(contact_length_size_152, unk_contact_length_size_152)).

% @attr sidecut_radius_size_152
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v8_1=8.1 unk_sidecut_radius_size_152=Unknown
% @importance 0.85

0.88::acc(s_m, sidecut_radius_size_152).

0.95::true_val(sidecut_radius_size_152, v8_1); 0.05::true_val(sidecut_radius_size_152, unk_sidecut_radius_size_152).

measured(s_m, sidecut_radius_size_152, v8_1).

all_consistent(sidecut_radius_size_152) :- consistent(s_m, sidecut_radius_size_152).

evidence(all_consistent(sidecut_radius_size_152)).
query(true_val(sidecut_radius_size_152, v8_1)).
query(true_val(sidecut_radius_size_152, unk_sidecut_radius_size_152)).

% @attr tip_tail_width_size_152
% @type numeric
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v29_3=29.3 unk_tip_tail_width_size_152=Unknown
% @importance 0.85

0.88::acc(s_m, tip_tail_width_size_152).

0.95::true_val(tip_tail_width_size_152, v29_3); 0.05::true_val(tip_tail_width_size_152, unk_tip_tail_width_size_152).

measured(s_m, tip_tail_width_size_152, v29_3).

all_consistent(tip_tail_width_size_152) :- consistent(s_m, tip_tail_width_size_152).

evidence(all_consistent(tip_tail_width_size_152)).
query(true_val(tip_tail_width_size_152, v29_3)).
query(true_val(tip_tail_width_size_152, unk_tip_tail_width_size_152)).

% @attr waist_width_152
% @type numeric
% @canonical false
% @original_name waist width 152cm
% @unit cm
% @values v25_3=25.3 unk_waist_width_152=Unknown
% @importance 0.85

0.88::acc(s_m, waist_width_152).

0.95::true_val(waist_width_152, v25_3); 0.05::true_val(waist_width_152, unk_waist_width_152).

measured(s_m, waist_width_152, v25_3).

all_consistent(waist_width_152) :- consistent(s_m, waist_width_152).

evidence(all_consistent(waist_width_152)).
query(true_val(waist_width_152, v25_3)).
query(true_val(waist_width_152, unk_waist_width_152)).

% @attr stance_width_range_size_152
% @type categorical
% @canonical false
% @original_name stance_width_range_size
% @values range_20_25_to_25_0=20_25in_to_25_0in unk_stance_width_range_size_152=Unknown
% @importance 0.85

0.88::acc(s_m, stance_width_range_size_152).

0.95::true_val(stance_width_range_size_152, range_20_25_to_25_0); 0.05::true_val(stance_width_range_size_152, unk_stance_width_range_size_152).

measured(s_m, stance_width_range_size_152, range_20_25_to_25_0).

all_consistent(stance_width_range_size_152) :- consistent(s_m, stance_width_range_size_152).

evidence(all_consistent(stance_width_range_size_152)).
query(true_val(stance_width_range_size_152, range_20_25_to_25_0)).
query(true_val(stance_width_range_size_152, unk_stance_width_range_size_152)).

% @attr setback_152
% @type numeric
% @canonical false
% @original_name setback
% @unit mm
% @values v0=0.0 unk_setback_152=Unknown
% @importance 0.85

0.88::acc(s_m, setback_152).

0.95::true_val(setback_152, v0); 0.05::true_val(setback_152, unk_setback_152).

measured(s_m, setback_152, v0).

all_consistent(setback_152) :- consistent(s_m, setback_152).

evidence(all_consistent(setback_152)).
query(true_val(setback_152, v0)).
query(true_val(setback_152, unk_setback_152)).

% @attr recommended_weight_range_size_152
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values v40_plus_kg=40_plus_kg unk_recommended_weight_range_size_152=Unknown
% @importance 0.85

0.88::acc(s_m, recommended_weight_range_size_152).

0.95::true_val(recommended_weight_range_size_152, v40_plus_kg); 0.05::true_val(recommended_weight_range_size_152, unk_recommended_weight_range_size_152).

measured(s_m, recommended_weight_range_size_152, v40_plus_kg).

all_consistent(recommended_weight_range_size_152) :- consistent(s_m, recommended_weight_range_size_152).

evidence(all_consistent(recommended_weight_range_size_152)).
query(true_val(recommended_weight_range_size_152, v40_plus_kg)).
query(true_val(recommended_weight_range_size_152, unk_recommended_weight_range_size_152)).

% @attr contact_length_size
% @type numeric
% @canonical true
% @original_name contact_length_size
% @unit cm
% @values v117_0=117.0 unk_contact_length_size=Unknown
% @importance 0.85

0.88::acc(s_m, contact_length_size).

0.95::true_val(contact_length_size, v117_0); 0.05::true_val(contact_length_size, unk_contact_length_size).

measured(s_m, contact_length_size, v117_0).

all_consistent(contact_length_size) :- consistent(s_m, contact_length_size).

evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v117_0)).
query(true_val(contact_length_size, unk_contact_length_size)).

% @attr sidecut_radius_size
% @type numeric
% @canonical true
% @original_name sidecut_radius_size
% @unit m
% @values v8_2=8.2 unk_sidecut_radius_size=Unknown
% @importance 0.85

0.88::acc(s_m, sidecut_radius_size).

0.95::true_val(sidecut_radius_size, v8_2); 0.05::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s_m, sidecut_radius_size, v8_2).

all_consistent(sidecut_radius_size) :- consistent(s_m, sidecut_radius_size).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v8_2)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr tip_tail_width_size
% @type numeric
% @canonical true
% @original_name tip_tail_width_size
% @unit cm
% @values v29_6=29.6 unk_tip_tail_width_size=Unknown
% @importance 0.85

0.88::acc(s_m, tip_tail_width_size).

0.95::true_val(tip_tail_width_size, v29_6); 0.05::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s_m, tip_tail_width_size, v29_6).

all_consistent(tip_tail_width_size) :- consistent(s_m, tip_tail_width_size).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v29_6)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr waist_width_156
% @type numeric
% @canonical false
% @original_name waist width 156cm
% @unit cm
% @values v25_5=25.5 unk_waist_width_156=Unknown
% @importance 0.85

0.88::acc(s_m, waist_width_156).

0.95::true_val(waist_width_156, v25_5); 0.05::true_val(waist_width_156, unk_waist_width_156).

measured(s_m, waist_width_156, v25_5).

all_consistent(waist_width_156) :- consistent(s_m, waist_width_156).

evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v25_5)).
query(true_val(waist_width_156, unk_waist_width_156)).

% @attr stance_width_range_size
% @type categorical
% @canonical true
% @original_name stance_width_range_size
% @values range_20_25_to_25_0=20_25in_to_25_0in unk_stance_width_range_size=Unknown
% @importance 0.85

0.88::acc(s_m, stance_width_range_size).

0.95::true_val(stance_width_range_size, range_20_25_to_25_0); 0.05::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s_m, stance_width_range_size, range_20_25_to_25_0).

all_consistent(stance_width_range_size) :- consistent(s_m, stance_width_range_size).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, range_20_25_to_25_0)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr setback_156
% @type numeric
% @canonical false
% @original_name setback
% @unit mm
% @values v0=0.0 unk_setback_156=Unknown
% @importance 0.85

0.88::acc(s_m, setback_156).

0.95::true_val(setback_156, v0); 0.05::true_val(setback_156, unk_setback_156).

measured(s_m, setback_156, v0).

all_consistent(setback_156) :- consistent(s_m, setback_156).

evidence(all_consistent(setback_156)).
query(true_val(setback_156, v0)).
query(true_val(setback_156, unk_setback_156)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size
% @values v45_plus_kg=45_plus_kg unk_recommended_weight_range_size=Unknown
% @importance 0.85

0.88::acc(s_m, recommended_weight_range_size).

0.95::true_val(recommended_weight_range_size, v45_plus_kg); 0.05::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s_m, recommended_weight_range_size, v45_plus_kg).

all_consistent(recommended_weight_range_size) :- consistent(s_m, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, v45_plus_kg)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr contact_length_size_159
% @type numeric
% @canonical false
% @original_name contact_length_size
% @unit cm
% @values v119_0=119.0 unk_contact_length_size_159=Unknown
% @importance 0.85

0.88::acc(s_m, contact_length_size_159).

0.95::true_val(contact_length_size_159, v119_0); 0.05::true_val(contact_length_size_159, unk_contact_length_size_159).

measured(s_m, contact_length_size_159, v119_0).

all_consistent(contact_length_size_159) :- consistent(s_m, contact_length_size_159).

evidence(all_consistent(contact_length_size_159)).
query(true_val(contact_length_size_159, v119_0)).
query(true_val(contact_length_size_159, unk_contact_length_size_159)).

% @attr sidecut_radius_size_159
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v8_2=8.2 unk_sidecut_radius_size_159=Unknown
% @importance 0.85

0.88::acc(s_m, sidecut_radius_size_159).

0.95::true_val(sidecut_radius_size_159, v8_2); 0.05::true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159).

measured(s_m, sidecut_radius_size_159, v8_2).

all_consistent(sidecut_radius_size_159) :- consistent(s_m, sidecut_radius_size_159).

evidence(all_consistent(sidecut_radius_size_159)).
query(true_val(sidecut_radius_size_159, v8_2)).
query(true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159)).

% @attr tip_tail_width_size_159
% @type numeric
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v29_8=29.8 unk_tip_tail_width_size_159=Unknown
% @importance 0.85

0.88::acc(s_m, tip_tail_width_size_159).

0.95::true_val(tip_tail_width_size_159, v29_8); 0.05::true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159).

measured(s_m, tip_tail_width_size_159, v29_8).

all_consistent(tip_tail_width_size_159) :- consistent(s_m, tip_tail_width_size_159).

evidence(all_consistent(tip_tail_width_size_159)).
query(true_val(tip_tail_width_size_159, v29_8)).
query(true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159)).

% @attr waist_width_159
% @type numeric
% @canonical false
% @original_name waist width 159cm
% @unit cm
% @values v25_6=25.6 unk_waist_width_159=Unknown
% @importance 0.85

0.88::acc(s_m, waist_width_159).

0.95::true_val(waist_width_159, v25_6); 0.05::true_val(waist_width_159, unk_waist_width_159).

measured(s_m, waist_width_159, v25_6).

all_consistent(waist_width_159) :- consistent(s_m, waist_width_159).

evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v25_6)).
query(true_val(waist_width_159, unk_waist_width_159)).

% @attr stance_width_range_size_159
% @type categorical
% @canonical false
% @original_name stance_width_range_size
% @values range_20_25_to_25_0=20_25in_to_25_0in unk_stance_width_range_size_159=Unknown
% @importance 0.85

0.88::acc(s_m, stance_width_range_size_159).

0.95::true_val(stance_width_range_size_159, range_20_25_to_25_0); 0.05::true_val(stance_width_range_size_159, unk_stance_width_range_size_159).

measured(s_m, stance_width_range_size_159, range_20_25_to_25_0).

all_consistent(stance_width_range_size_159) :- consistent(s_m, stance_width_range_size_159).

evidence(all_consistent(stance_width_range_size_159)).
query(true_val(stance_width_range_size_159, range_20_25_to_25_0)).
query(true_val(stance_width_range_size_159, unk_stance_width_range_size_159)).

% @attr setback_159
% @type numeric
% @canonical false
% @original_name setback
% @unit mm
% @values v0=0.0 unk_setback_159=Unknown
% @importance 0.85

0.88::acc(s_m, setback_159).

0.95::true_val(setback_159, v0); 0.05::true_val(setback_159, unk_setback_159).

measured(s_m, setback_159, v0).

all_consistent(setback_159) :- consistent(s_m, setback_159).

evidence(all_consistent(setback_159)).
query(true_val(setback_159, v0)).
query(true_val(setback_159, unk_setback_159)).

% @attr recommended_weight_range_size_159
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values v60_plus_kg=60_plus_kg unk_recommended_weight_range_size_159=Unknown
% @importance 0.85

0.88::acc(s_m, recommended_weight_range_size_159).

0.95::true_val(recommended_weight_range_size_159, v60_plus_kg); 0.05::true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159).

measured(s_m, recommended_weight_range_size_159, v60_plus_kg).

all_consistent(recommended_weight_range_size_159) :- consistent(s_m, recommended_weight_range_size_159).

evidence(all_consistent(recommended_weight_range_size_159)).
query(true_val(recommended_weight_range_size_159, v60_plus_kg)).
query(true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159)).

% @attr contact_length_size_150w
% @type numeric
% @canonical false
% @original_name contact_length_size
% @unit cm
% @values v113_0=113.0 unk_contact_length_size_150w=Unknown
% @importance 0.85

0.88::acc(s_m, contact_length_size_150w).

0.95::true_val(contact_length_size_150w, v113_0); 0.05::true_val(contact_length_size_150w, unk_contact_length_size_150w).

measured(s_m, contact_length_size_150w, v113_0).

all_consistent(contact_length_size_150w) :- consistent(s_m, contact_length_size_150w).

evidence(all_consistent(contact_length_size_150w)).
query(true_val(contact_length_size_150w, v113_0)).
query(true_val(contact_length_size_150w, unk_contact_length_size_150w)).

% @attr contact_length_size_154w
% @type numeric
% @canonical false
% @original_name contact_length_size
% @unit cm
% @values v116_0=116.0 unk_contact_length_size_154w=Unknown
% @importance 0.85

0.88::acc(s_m, contact_length_size_154w).

0.95::true_val(contact_length_size_154w, v116_0); 0.05::true_val(contact_length_size_154w, unk_contact_length_size_154w).

measured(s_m, contact_length_size_154w, v116_0).

all_consistent(contact_length_size_154w) :- consistent(s_m, contact_length_size_154w).

evidence(all_consistent(contact_length_size_154w)).
query(true_val(contact_length_size_154w, v116_0)).
query(true_val(contact_length_size_154w, unk_contact_length_size_154w)).

% @attr contact_length_size_158w
% @type numeric
% @canonical false
% @original_name contact_length_size
% @unit cm
% @values v119_0=119.0 unk_contact_length_size_158w=Unknown
% @importance 0.85

0.88::acc(s_m, contact_length_size_158w).

0.95::true_val(contact_length_size_158w, v119_0); 0.05::true_val(contact_length_size_158w, unk_contact_length_size_158w).

measured(s_m, contact_length_size_158w, v119_0).

all_consistent(contact_length_size_158w) :- consistent(s_m, contact_length_size_158w).

evidence(all_consistent(contact_length_size_158w)).
query(true_val(contact_length_size_158w, v119_0)).
query(true_val(contact_length_size_158w, unk_contact_length_size_158w)).

% @attr waist_width_150w
% @type numeric
% @canonical false
% @original_name waist width 150W
% @unit cm
% @values v26_0=26.0 unk_waist_width_150w=Unknown
% @importance 0.85

0.88::acc(s_m, waist_width_150w).

0.95::true_val(waist_width_150w, v26_0); 0.05::true_val(waist_width_150w, unk_waist_width_150w).

measured(s_m, waist_width_150w, v26_0).

all_consistent(waist_width_150w) :- consistent(s_m, waist_width_150w).

evidence(all_consistent(waist_width_150w)).
query(true_val(waist_width_150w, v26_0)).
query(true_val(waist_width_150w, unk_waist_width_150w)).

% @attr waist_width_154w
% @type numeric
% @canonical false
% @original_name waist width 154W
% @unit cm
% @values v26_2=26.2 unk_waist_width_154w=Unknown
% @importance 0.85

0.88::acc(s_m, waist_width_154w).

0.95::true_val(waist_width_154w, v26_2); 0.05::true_val(waist_width_154w, unk_waist_width_154w).

measured(s_m, waist_width_154w, v26_2).

all_consistent(waist_width_154w) :- consistent(s_m, waist_width_154w).

evidence(all_consistent(waist_width_154w)).
query(true_val(waist_width_154w, v26_2)).
query(true_val(waist_width_154w, unk_waist_width_154w)).

% @attr waist_width_158w
% @type numeric
% @canonical false
% @original_name waist width 158W
% @unit cm
% @values v26_6=26.6 unk_waist_width_158w=Unknown
% @importance 0.85

0.88::acc(s_m, waist_width_158w).

0.95::true_val(waist_width_158w, v26_6); 0.05::true_val(waist_width_158w, unk_waist_width_158w).

measured(s_m, waist_width_158w, v26_6).

all_consistent(waist_width_158w) :- consistent(s_m, waist_width_158w).

evidence(all_consistent(waist_width_158w)).
query(true_val(waist_width_158w, v26_6)).
query(true_val(waist_width_158w, unk_waist_width_158w)).