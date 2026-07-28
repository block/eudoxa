0.20::indep(s3).
0.15::indep(s4).
0.20::indep(s5).
0.20::indep(s13).
0.25::indep(s14).
0.15::indep(s19).
0.20::indep(s23).
0.15::indep(s25).
0.15::indep(s26).
0.15::indep(s27).
0.15::indep(s28).
0.15::indep(s29).
0.15::indep(s30).
0.15::indep(s31).
0.15::indep(s32).
0.20::indep(s33).
0.15::indep(s34).
0.15::indep(s35).
0.20::indep(s36).
0.20::indep(s49).
0.15::indep(s_merchant).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values nitro=Nitro unk_brand=Unknown
% @importance 1.0

0.95::true_val(brand, nitro); 0.05::true_val(brand, unk_brand).
0.95::acc(s1, brand).
measured(s1, brand, nitro).
all_consistent(brand) :- consistent(s1, brand).
evidence(all_consistent(brand)).
query(true_val(brand, nitro)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values quiver_dinghy=Quiver_Dinghy unk_model_name=Unknown
% @importance 1.0

0.92::true_val(model_name, quiver_dinghy); 0.08::true_val(model_name, unk_model_name).
0.93::acc(s2, model_name).
measured(s2, model_name, quiver_dinghy).
all_consistent(model_name) :- consistent(s2, model_name).
evidence(all_consistent(model_name)).
query(true_val(model_name, quiver_dinghy)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type numeric
% @canonical true
% @original_name model_year
% @values v2026=2026
% @importance 1.0

0.92::true_val(model_year, v2026); 0.08::true_val(model_year, unk_model_year).
0.93::acc(s2, model_year).
measured(s2, model_year, v2026).
all_consistent(model_year) :- consistent(s2, model_year).
evidence(all_consistent(model_year)).
query(true_val(model_year, v2026)).
query(true_val(model_year, unk_model_year)).

% @attr model_series
% @type categorical
% @canonical false
% @original_name Model series
% @values quiver_series=Quiver_Series unk_model_series=Unknown
% @importance 0.6

0.71::true_val(model_series, quiver_series); 0.29::true_val(model_series, unk_model_series).
0.82::acc(s3, model_series).
measured(s3, model_series, quiver_series).
all_consistent(model_series) :-
    (indep(s3), consistent(s3, model_series) ; \+indep(s3)).
evidence(all_consistent(model_series)).
query(true_val(model_series, quiver_series)).
query(true_val(model_series, unk_model_series)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.92::true_val(product_type, snowboard); 0.08::true_val(product_type, unk_product_type).
0.95::acc(s2, product_type).
measured(s2, product_type, snowboard).
all_consistent(product_type) :- consistent(s2, product_type).
evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values freeride_powder=Freeride_Powder unk_board_category=Unknown
% @importance 0.9

0.67::true_val(board_category, freeride_powder); 0.33::true_val(board_category, unk_board_category).
0.80::acc(s4, board_category).
measured(s4, board_category, freeride_powder).
all_consistent(board_category) :-
    (indep(s4), consistent(s4, board_category) ; \+indep(s4)).
evidence(all_consistent(board_category)).
query(true_val(board_category, freeride_powder)).
query(true_val(board_category, unk_board_category)).

% @attr board_subtype
% @type categorical
% @canonical false
% @original_name Board subtype
% @values volume_shifted_directional_powder=Volume_shifted_short_wide_directional_powder unk_board_subtype=Unknown
% @importance 0.6

0.71::true_val(board_subtype, volume_shifted_directional_powder); 0.29::true_val(board_subtype, unk_board_subtype).
0.82::acc(s3, board_subtype).
measured(s3, board_subtype, volume_shifted_directional_powder).
all_consistent(board_subtype) :-
    (indep(s3), consistent(s3, board_subtype) ; \+indep(s3)).
evidence(all_consistent(board_subtype)).
query(true_val(board_subtype, volume_shifted_directional_powder)).
query(true_val(board_subtype, unk_board_subtype)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values unisex=Unisex unk_gender=Unknown
% @importance 0.5

0.72::true_val(gender, unisex); 0.28::true_val(gender, unk_gender).
0.82::acc(s5, gender).
measured(s5, gender, unisex).
all_consistent(gender) :-
    (indep(s5), consistent(s5, gender) ; \+indep(s5)).
evidence(all_consistent(gender)).
query(true_val(gender, unisex)).
query(true_val(gender, unk_gender)).

% @attr sku_150w
% @type categorical
% @canonical false
% @original_name SKU (150W)
% @values v833205_001=833205-001 unk_sku_150w=Unknown
% @importance 0.925

0.95::true_val(sku_150w, v833205_001); 0.05::true_val(sku_150w, unk_sku_150w).
0.95::acc(s2, sku_150w).
0.93::acc(s_merchant, sku_150w).
measured(s2, sku_150w, v833205_001).
measured(s_merchant, sku_150w, v833205_001).
all_consistent(sku_150w) :-
    consistent(s2, sku_150w),
    (indep(s_merchant), consistent(s_merchant, sku_150w) ; \+indep(s_merchant)).
evidence(all_consistent(sku_150w)).
query(true_val(sku_150w, v833205_001)).
query(true_val(sku_150w, unk_sku_150w)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values nitro_ag_switzerland=Nitro_AG_Hunenberg_Switzerland unk_manufacturer=Unknown
% @importance 0.5

0.93::true_val(manufacturer, nitro_ag_switzerland); 0.07::true_val(manufacturer, unk_manufacturer).
0.96::acc(s6, manufacturer).
measured(s6, manufacturer, nitro_ag_switzerland).
all_consistent(manufacturer) :- consistent(s6, manufacturer).
evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, nitro_ag_switzerland)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr eu_representative
% @type categorical
% @canonical false
% @original_name EU representative
% @values nitro_italia=Nitro_Distribution_Italia_Arco unk_eu_representative=Unknown
% @importance 0.5

0.93::true_val(eu_representative, nitro_italia); 0.07::true_val(eu_representative, unk_eu_representative).
0.96::acc(s6, eu_representative).
measured(s6, eu_representative, nitro_italia).
all_consistent(eu_representative) :- consistent(s6, eu_representative).
evidence(all_consistent(eu_representative)).
query(true_val(eu_representative, nitro_italia)).
query(true_val(eu_representative, unk_eu_representative)).

% @attr manufacturer_founded
% @type categorical
% @canonical false
% @original_name Manufacturer founded
% @values v1990_seattle=1990_Seattle_WA unk_manufacturer_founded=Unknown
% @importance 0.4

0.90::true_val(manufacturer_founded, v1990_seattle); 0.10::true_val(manufacturer_founded, unk_manufacturer_founded).
0.93::acc(s7, manufacturer_founded).
measured(s7, manufacturer_founded, v1990_seattle).
all_consistent(manufacturer_founded) :- consistent(s7, manufacturer_founded).
evidence(all_consistent(manufacturer_founded)).
query(true_val(manufacturer_founded, v1990_seattle)).
query(true_val(manufacturer_founded, unk_manufacturer_founded)).

% @attr manufacturer_tagline
% @type categorical
% @canonical false
% @original_name Manufacturer tagline
% @values developed_by_snowboarders=Developed_by_snowboarders_since_1990 unk_manufacturer_tagline=Unknown
% @importance 0.3

0.77::true_val(manufacturer_tagline, developed_by_snowboarders); 0.23::true_val(manufacturer_tagline, unk_manufacturer_tagline).
0.88::acc(s8, manufacturer_tagline).
measured(s8, manufacturer_tagline, developed_by_snowboarders).
all_consistent(manufacturer_tagline) :- consistent(s8, manufacturer_tagline).
evidence(all_consistent(manufacturer_tagline)).
query(true_val(manufacturer_tagline, developed_by_snowboarders)).
query(true_val(manufacturer_tagline, unk_manufacturer_tagline)).

% @attr manufacturer_ownership
% @type categorical
% @canonical false
% @original_name Manufacturer ownership
% @values privately_owned=Privately_owned_rider_operated unk_manufacturer_ownership=Unknown
% @importance 0.35

0.54::true_val(manufacturer_ownership, privately_owned); 0.46::true_val(manufacturer_ownership, unk_manufacturer_ownership).
0.78::acc(s9, manufacturer_ownership).
measured(s9, manufacturer_ownership, privately_owned).
all_consistent(manufacturer_ownership) :- consistent(s9, manufacturer_ownership).
evidence(all_consistent(manufacturer_ownership)).
query(true_val(manufacturer_ownership, privately_owned)).
query(true_val(manufacturer_ownership, unk_manufacturer_ownership)).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values playmaker_taiwan=Playmaker_factory_Taiwan unk_manufacturing_location_current=Unknown
% @importance 0.6

0.36::true_val(manufacturing_location_current, playmaker_taiwan); 0.64::true_val(manufacturing_location_current, unk_manufacturing_location_current).
0.75::acc(s10, manufacturing_location_current).
measured(s10, manufacturing_location_current, playmaker_taiwan).
all_consistent(manufacturing_location_current) :- consistent(s10, manufacturing_location_current).
evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, playmaker_taiwan)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

% @attr manufacturing_location_prior
% @type categorical
% @canonical false
% @original_name manufacturing_location_prior
% @values taiwan_playmaker=Taiwan_Playmaker europe_austria=Europe_Austria
% @importance 0.55

0.65::true_val(manufacturing_location_prior, taiwan_playmaker); 0.35::true_val(manufacturing_location_prior, europe_austria).
0.75::acc(s10, manufacturing_location_prior).
0.55::acc(s11, manufacturing_location_prior).
measured(s10, manufacturing_location_prior, taiwan_playmaker).
measured(s11, manufacturing_location_prior, europe_austria).
all_consistent(manufacturing_location_prior) :-
    consistent(s10, manufacturing_location_prior),
    consistent(s11, manufacturing_location_prior).
evidence(all_consistent(manufacturing_location_prior)).
query(true_val(manufacturing_location_prior, taiwan_playmaker)).
query(true_val(manufacturing_location_prior, europe_austria)).

% @attr design_headquarters
% @type categorical
% @canonical false
% @original_name Design headquarters
% @values seattle_oberammergau=Seattle_WA_and_Oberammergau_Germany unk_design_headquarters=Unknown
% @importance 0.35

0.64::true_val(design_headquarters, seattle_oberammergau); 0.36::true_val(design_headquarters, unk_design_headquarters).
0.80::acc(s12, design_headquarters).
measured(s12, design_headquarters, seattle_oberammergau).
all_consistent(design_headquarters) :- consistent(s12, design_headquarters).
evidence(all_consistent(design_headquarters)).
query(true_val(design_headquarters, seattle_oberammergau)).
query(true_val(design_headquarters, unk_design_headquarters)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2022_2023=2023_season unk_model_first_available_year=Unknown
% @importance 0.7

0.74::true_val(model_first_available_year, season_2022_2023); 0.26::true_val(model_first_available_year, unk_model_first_available_year).
0.85::acc(s13, model_first_available_year).
measured(s13, model_first_available_year, season_2022_2023).
all_consistent(model_first_available_year) :-
    (indep(s13), consistent(s13, model_first_available_year) ; \+indep(s13)).
evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2022_2023)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr current_model_release_date
% @type categorical
% @canonical false
% @original_name Current model release date
% @values season_2025_2026=2026_season unk_current_model_release_date=Unknown
% @importance 1.0

0.92::true_val(current_model_release_date, season_2025_2026); 0.08::true_val(current_model_release_date, unk_current_model_release_date).
0.93::acc(s2, current_model_release_date).
measured(s2, current_model_release_date, season_2025_2026).
all_consistent(current_model_release_date) :- consistent(s2, current_model_release_date).
evidence(all_consistent(current_model_release_date)).
query(true_val(current_model_release_date, season_2025_2026)).
query(true_val(current_model_release_date, unk_current_model_release_date)).

% @attr new_for_2026
% @type categorical
% @canonical false
% @original_name What is new for 2026
% @values new_150_size=New_150cm_size_added unk_new_for_2026=Unknown
% @importance 0.8

0.71::true_val(new_for_2026, new_150_size); 0.29::true_val(new_for_2026, unk_new_for_2026).
0.85::acc(s14, new_for_2026).
measured(s14, new_for_2026, new_150_size).
all_consistent(new_for_2026) :-
    (indep(s14), consistent(s14, new_for_2026) ; \+indep(s14)).
evidence(all_consistent(new_for_2026)).
query(true_val(new_for_2026, new_150_size)).
query(true_val(new_for_2026, unk_new_for_2026)).

% @attr previous_year_sizes
% @type categorical
% @canonical false
% @original_name Previous year sizes
% @values v155_and_160=155_and_160_only unk_previous_year_sizes=Unknown
% @importance 0.65

0.72::true_val(previous_year_sizes, v155_and_160); 0.28::true_val(previous_year_sizes, unk_previous_year_sizes).
0.85::acc(s15, previous_year_sizes).
measured(s15, previous_year_sizes, v155_and_160).
all_consistent(previous_year_sizes) :- consistent(s15, previous_year_sizes).
evidence(all_consistent(previous_year_sizes)).
query(true_val(previous_year_sizes, v155_and_160)).
query(true_val(previous_year_sizes, unk_previous_year_sizes)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values fox_smith=Bryan_Fox_Austin_Smith unk_pro_rider_name=Unknown
% @importance 0.6

0.71::true_val(pro_rider_name, fox_smith); 0.29::true_val(pro_rider_name, unk_pro_rider_name).
0.82::acc(s3, pro_rider_name).
measured(s3, pro_rider_name, fox_smith).
all_consistent(pro_rider_name) :-
    (indep(s3), consistent(s3, pro_rider_name) ; \+indep(s3)).
evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, fox_smith)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr quiver_series_history
% @type categorical
% @canonical false
% @original_name Quiver Series history
% @values tenth_season=10th_season unk_quiver_series_history=Unknown
% @importance 0.3

0.77::true_val(quiver_series_history, tenth_season); 0.23::true_val(quiver_series_history, unk_quiver_series_history).
0.88::acc(s16, quiver_series_history).
measured(s16, quiver_series_history, tenth_season).
all_consistent(quiver_series_history) :- consistent(s16, quiver_series_history).
evidence(all_consistent(quiver_series_history)).
query(true_val(quiver_series_history, tenth_season)).
query(true_val(quiver_series_history, unk_quiver_series_history)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v599_95=599.95 unk_price_usd_msrp=Unknown
% @importance 0.95

0.95::true_val(price_usd_msrp, v599_95); 0.05::true_val(price_usd_msrp, unk_price_usd_msrp).
0.95::acc(s17, price_usd_msrp).
measured(s17, price_usd_msrp, v599_95).
all_consistent(price_usd_msrp) :- consistent(s17, price_usd_msrp).
evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v599_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_eur_manufacturer
% @type numeric
% @canonical false
% @original_name Price (EUR manufacturer site)
% @unit EUR
% @values v649_90=649.90 unk_price_eur_manufacturer=Unknown
% @importance 1.0

0.92::true_val(price_eur_manufacturer, v649_90); 0.08::true_val(price_eur_manufacturer, unk_price_eur_manufacturer).
0.93::acc(s2, price_eur_manufacturer).
measured(s2, price_eur_manufacturer, v649_90).
all_consistent(price_eur_manufacturer) :- consistent(s2, price_eur_manufacturer).
evidence(all_consistent(price_eur_manufacturer)).
query(true_val(price_eur_manufacturer, v649_90)).
query(true_val(price_eur_manufacturer, unk_price_eur_manufacturer)).

% @attr price_aud_merchant
% @type numeric
% @canonical true
% @original_name price_aud_merchant
% @unit AUD
% @values v999=999.00 unk_price_aud_merchant=Unknown
% @importance 0.9

0.95::true_val(price_aud_merchant, v999); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).
0.92::acc(s18, price_aud_merchant).
0.88::acc(s19, price_aud_merchant).
measured(s18, price_aud_merchant, v999).
measured(s19, price_aud_merchant, v999).
all_consistent(price_aud_merchant) :-
    consistent(s18, price_aud_merchant),
    consistent(s19, price_aud_merchant).
evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v999)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_aud_merchant_melbourne
% @type numeric
% @canonical false
% @original_name price_aud_merchant (Melbourne Snowboard Centre)
% @unit AUD
% @values v999_99=999.99 unk_price_aud_merchant_melbourne=Unknown
% @importance 0.85

0.95::true_val(price_aud_merchant_melbourne, v999_99); 0.05::true_val(price_aud_merchant_melbourne, unk_price_aud_merchant_melbourne).
0.93::acc(s_merchant, price_aud_merchant_melbourne).
measured(s_merchant, price_aud_merchant_melbourne, v999_99).
all_consistent(price_aud_merchant_melbourne) :- consistent(s_merchant, price_aud_merchant_melbourne).
evidence(all_consistent(price_aud_merchant_melbourne)).
query(true_val(price_aud_merchant_melbourne, v999_99)).
query(true_val(price_aud_merchant_melbourne, unk_price_aud_merchant_melbourne)).

% @attr price_usd_evo
% @type numeric
% @canonical true
% @original_name price_usd_evo
% @unit USD
% @values v479_96=479.96 unk_price_usd_evo=Unknown
% @importance 0.95

0.81::true_val(price_usd_evo, v479_96); 0.19::true_val(price_usd_evo, unk_price_usd_evo).
0.90::acc(s20, price_usd_evo).
measured(s20, price_usd_evo, v479_96).
all_consistent(price_usd_evo) :- consistent(s20, price_usd_evo).
evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v479_96)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_blauer
% @type numeric
% @canonical false
% @original_name Price (USD - sale at Blauer Board Shop)
% @unit USD
% @values v479_96=479.96 unk_price_usd_blauer=Unknown
% @importance 0.95

0.81::true_val(price_usd_blauer, v479_96); 0.19::true_val(price_usd_blauer, unk_price_usd_blauer).
0.90::acc(s20, price_usd_blauer).
measured(s20, price_usd_blauer, v479_96).
all_consistent(price_usd_blauer) :- consistent(s20, price_usd_blauer).
evidence(all_consistent(price_usd_blauer)).
query(true_val(price_usd_blauer, v479_96)).
query(true_val(price_usd_blauer, unk_price_usd_blauer)).

% @attr price_usd_christy
% @type numeric
% @canonical false
% @original_name Price (USD - sale at Christy Sports)
% @unit USD
% @values v479_96=479.96 unk_price_usd_christy=Unknown
% @importance 0.95

0.81::true_val(price_usd_christy, v479_96); 0.19::true_val(price_usd_christy, unk_price_usd_christy).
0.90::acc(s20, price_usd_christy).
measured(s20, price_usd_christy, v479_96).
all_consistent(price_usd_christy) :- consistent(s20, price_usd_christy).
evidence(all_consistent(price_usd_christy)).
query(true_val(price_usd_christy, v479_96)).
query(true_val(price_usd_christy, unk_price_usd_christy)).

% @attr price_cad_prfo
% @type numeric
% @canonical true
% @original_name price_cad_prfo
% @unit CAD
% @values v555_99=555.99 unk_price_cad_prfo=Unknown
% @importance 0.95

0.81::true_val(price_cad_prfo, v555_99); 0.19::true_val(price_cad_prfo, unk_price_cad_prfo).
0.90::acc(s20, price_cad_prfo).
measured(s20, price_cad_prfo, v555_99).
all_consistent(price_cad_prfo) :- consistent(s20, price_cad_prfo).
evidence(all_consistent(price_cad_prfo)).
query(true_val(price_cad_prfo, v555_99)).
query(true_val(price_cad_prfo, unk_price_cad_prfo)).

% @attr price_eur_snowcountry
% @type numeric
% @canonical false
% @original_name Price (EUR - SnowCountry)
% @unit EUR
% @values v499=499.00 unk_price_eur_snowcountry=Unknown
% @importance 0.95

0.81::true_val(price_eur_snowcountry, v499); 0.19::true_val(price_eur_snowcountry, unk_price_eur_snowcountry).
0.90::acc(s20, price_eur_snowcountry).
measured(s20, price_eur_snowcountry, v499).
all_consistent(price_eur_snowcountry) :- consistent(s20, price_eur_snowcountry).
evidence(all_consistent(price_eur_snowcountry)).
query(true_val(price_eur_snowcountry, v499)).
query(true_val(price_eur_snowcountry, unk_price_eur_snowcountry)).

% @attr price_eur_blue_tomato
% @type numeric
% @canonical true
% @original_name price_eur_blue_tomato
% @unit EUR
% @values v649_95=649.95 unk_price_eur_blue_tomato=Unknown
% @importance 0.95

0.81::true_val(price_eur_blue_tomato, v649_95); 0.19::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).
0.90::acc(s20, price_eur_blue_tomato).
measured(s20, price_eur_blue_tomato, v649_95).
all_consistent(price_eur_blue_tomato) :- consistent(s20, price_eur_blue_tomato).
evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v649_95)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

% @attr price_gbp_blue_tomato_uk
% @type numeric
% @canonical true
% @original_name price_gbp_blue_tomato_uk
% @unit GBP
% @values v580=580.00 unk_price_gbp_blue_tomato_uk=Unknown
% @importance 0.95

0.81::true_val(price_gbp_blue_tomato_uk, v580); 0.19::true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk).
0.90::acc(s20, price_gbp_blue_tomato_uk).
measured(s20, price_gbp_blue_tomato_uk, v580).
all_consistent(price_gbp_blue_tomato_uk) :- consistent(s20, price_gbp_blue_tomato_uk).
evidence(all_consistent(price_gbp_blue_tomato_uk)).
query(true_val(price_gbp_blue_tomato_uk, v580)).
query(true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk)).

% @attr price_sek_blue_tomato
% @type numeric
% @canonical false
% @original_name Price (SEK - Blue Tomato Sweden)
% @unit SEK
% @values v6999=6999.00 unk_price_sek_blue_tomato=Unknown
% @importance 0.95

0.81::true_val(price_sek_blue_tomato, v6999); 0.19::true_val(price_sek_blue_tomato, unk_price_sek_blue_tomato).
0.90::acc(s20, price_sek_blue_tomato).
measured(s20, price_sek_blue_tomato, v6999).
all_consistent(price_sek_blue_tomato) :- consistent(s20, price_sek_blue_tomato).
evidence(all_consistent(price_sek_blue_tomato)).
query(true_val(price_sek_blue_tomato, v6999)).
query(true_val(price_sek_blue_tomato, unk_price_sek_blue_tomato)).

% @attr price_dkk_blue_tomato
% @type numeric
% @canonical false
% @original_name Price (DKK - Blue Tomato Denmark)
% @unit DKK
% @values v4850=4850.00 unk_price_dkk_blue_tomato=Unknown
% @importance 0.95

0.81::true_val(price_dkk_blue_tomato, v4850); 0.19::true_val(price_dkk_blue_tomato, unk_price_dkk_blue_tomato).
0.90::acc(s20, price_dkk_blue_tomato).
measured(s20, price_dkk_blue_tomato, v4850).
all_consistent(price_dkk_blue_tomato) :- consistent(s20, price_dkk_blue_tomato).
evidence(all_consistent(price_dkk_blue_tomato)).
query(true_val(price_dkk_blue_tomato, v4850)).
query(true_val(price_dkk_blue_tomato, unk_price_dkk_blue_tomato)).

% @attr price_usd_freeride
% @type numeric
% @canonical false
% @original_name Price (USD - Freeride Boardshop)
% @unit USD
% @values v513=513.00 unk_price_usd_freeride=Unknown
% @importance 0.85

0.59::true_val(price_usd_freeride, v513); 0.41::true_val(price_usd_freeride, unk_price_usd_freeride).
0.85::acc(s21, price_usd_freeride).
measured(s21, price_usd_freeride, v513).
all_consistent(price_usd_freeride) :- consistent(s21, price_usd_freeride).
evidence(all_consistent(price_usd_freeride)).
query(true_val(price_usd_freeride, v513)).
query(true_val(price_usd_freeride, unk_price_usd_freeride)).

% @attr price_usd_previous_msrp
% @type numeric
% @canonical false
% @original_name Price (USD - previous season 2025 MSRP)
% @unit USD
% @values v599_95=599.95 unk_price_usd_previous_msrp=Unknown
% @importance 0.6

0.77::true_val(price_usd_previous_msrp, v599_95); 0.23::true_val(price_usd_previous_msrp, unk_price_usd_previous_msrp).
0.88::acc(s22, price_usd_previous_msrp).
measured(s22, price_usd_previous_msrp, v599_95).
all_consistent(price_usd_previous_msrp) :- consistent(s22, price_usd_previous_msrp).
evidence(all_consistent(price_usd_previous_msrp)).
query(true_val(price_usd_previous_msrp, v599_95)).
query(true_val(price_usd_previous_msrp, unk_price_usd_previous_msrp)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values available=Available unk_availability_status=Unknown
% @importance 0.6

0.97::true_val(availability_status, available); 0.03::true_val(availability_status, unk_availability_status).
0.90::acc(s23, availability_status).
0.92::acc(s24, availability_status).
0.85::acc(s25, availability_status).
0.82::acc(s26, availability_status).
0.82::acc(s27, availability_status).
0.80::acc(s28, availability_status).
0.80::acc(s29, availability_status).
0.78::acc(s30, availability_status).
0.78::acc(s31, availability_status).
measured(s23, availability_status, available).
measured(s24, availability_status, available).
measured(s25, availability_status, available).
measured(s26, availability_status, available).
measured(s27, availability_status, available).
measured(s28, availability_status, available).
measured(s29, availability_status, available).
measured(s30, availability_status, available).
measured(s31, availability_status, available).
all_consistent(availability_status) :-
    consistent(s23, availability_status),
    consistent(s24, availability_status),
    consistent(s25, availability_status),
    consistent(s26, availability_status),
    consistent(s27, availability_status),
    consistent(s28, availability_status),
    consistent(s29, availability_status),
    consistent(s30, availability_status),
    consistent(s31, availability_status).
evidence(all_consistent(availability_status)).
query(true_val(availability_status, available)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_sellout_risk
% @type categorical
% @canonical false
% @original_name availability_status (Snow Skiers Warehouse)
% @values high_sellout_risk=High_sell_out_risk_1_2_remaining unk_availability_status_sellout_risk=Unknown
% @importance 0.85

0.67::true_val(availability_status_sellout_risk, high_sellout_risk); 0.33::true_val(availability_status_sellout_risk, unk_availability_status_sellout_risk).
0.82::acc(s19, availability_status_sellout_risk).
measured(s19, availability_status_sellout_risk, high_sellout_risk).
all_consistent(availability_status_sellout_risk) :- consistent(s19, availability_status_sellout_risk).
evidence(all_consistent(availability_status_sellout_risk)).
query(true_val(availability_status_sellout_risk, high_sellout_risk)).
query(true_val(availability_status_sellout_risk, unk_availability_status_sellout_risk)).

% @attr availability_status_motion
% @type categorical
% @canonical false
% @original_name availability_status (Motion Boardshop)
% @values v599_95_usd=599_95_USD_listed unk_availability_status_motion=Unknown
% @importance 0.8

0.59::true_val(availability_status_motion, v599_95_usd); 0.41::true_val(availability_status_motion, unk_availability_status_motion).
0.70::acc(s32, availability_status_motion).
measured(s32, availability_status_motion, v599_95_usd).
all_consistent(availability_status_motion) :- consistent(s32, availability_status_motion).
evidence(all_consistent(availability_status_motion)).
query(true_val(availability_status_motion, v599_95_usd)).
query(true_val(availability_status_motion, unk_availability_status_motion)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 1.0

0.92::true_val(shape, tapered_directional); 0.08::true_val(shape, unk_shape).
0.95::acc(s2, shape).
measured(s2, shape, tapered_directional).
all_consistent(shape) :- consistent(s2, shape).
evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values true_camber=True_Camber_traditional_full unk_camber_type=Unknown
% @importance 1.0

0.92::true_val(camber_type, true_camber); 0.08::true_val(camber_type, unk_camber_type).
0.95::acc(s2, camber_type).
measured(s2, camber_type, true_camber).
all_consistent(camber_type) :- consistent(s2, camber_type).
evidence(all_consistent(camber_type)).
query(true_val(camber_type, true_camber)).
query(true_val(camber_type, unk_camber_type)).

% @attr core_profile
% @type categorical
% @canonical false
% @original_name Core profile
% @values reflex_core=Reflex_Core_Profile unk_core_profile=Unknown
% @importance 1.0

0.92::true_val(core_profile, reflex_core); 0.08::true_val(core_profile, unk_core_profile).
0.93::acc(s2, core_profile).
measured(s2, core_profile, reflex_core).
all_consistent(core_profile) :- consistent(s2, core_profile).
evidence(all_consistent(core_profile)).
query(true_val(core_profile, reflex_core)).
query(true_val(core_profile, unk_core_profile)).

% @attr width_options
% @type categorical
% @canonical true
% @original_name width_options
% @values wide=Wide unk_width_options=Unknown
% @importance 1.0

0.92::true_val(width_options, wide); 0.08::true_val(width_options, unk_width_options).
0.95::acc(s2, width_options).
measured(s2, width_options, wide).
all_consistent(width_options) :- consistent(s2, width_options).
evidence(all_consistent(width_options)).
query(true_val(width_options, wide)).
query(true_val(width_options, unk_width_options)).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values progressive=Progressive_Sidecut unk_sidecut_type=Unknown
% @importance 1.0

0.92::true_val(sidecut_type, progressive); 0.08::true_val(sidecut_type, unk_sidecut_type).
0.95::acc(s2, sidecut_type).
measured(s2, sidecut_type, progressive).
all_consistent(sidecut_type) :- consistent(s2, sidecut_type).
evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, progressive)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @original_name flex_rating_10
% @unit /10
% @values v7=7.0 unk_flex_rating_10=Unknown
% @importance 1.0

0.95::true_val(flex_rating_10, v7); 0.05::true_val(flex_rating_10, unk_flex_rating_10).
0.93::acc(s2, flex_rating_10).
0.93::acc(s_merchant, flex_rating_10).
measured(s2, flex_rating_10, v7).
measured(s_merchant, flex_rating_10, v7).
all_consistent(flex_rating_10) :-
    consistent(s2, flex_rating_10),
    (indep(s_merchant), consistent(s_merchant, flex_rating_10) ; \+indep(s_merchant)).
evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v7)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

% @attr flex_pattern_name
% @type categorical
% @canonical false
% @original_name Flex pattern name
% @values all_terrain=All_Terrain unk_flex_pattern_name=Unknown
% @importance 0.85

0.72::true_val(flex_pattern_name, all_terrain); 0.28::true_val(flex_pattern_name, unk_flex_pattern_name).
0.85::acc(s33, flex_pattern_name).
measured(s33, flex_pattern_name, all_terrain).
all_consistent(flex_pattern_name) :-
    (indep(s33), consistent(s33, flex_pattern_name) ; \+indep(s33)).
evidence(all_consistent(flex_pattern_name)).
query(true_val(flex_pattern_name, all_terrain)).
query(true_val(flex_pattern_name, unk_flex_pattern_name)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values surf_tech_3d=3D_Surf_Tech_convex_nose_concave_tail unk_construction_material_innovation=Unknown
% @importance 0.85

0.72::true_val(construction_material_innovation, surf_tech_3d); 0.28::true_val(construction_material_innovation, unk_construction_material_innovation).
0.85::acc(s33, construction_material_innovation).
measured(s33, construction_material_innovation, surf_tech_3d).
all_consistent(construction_material_innovation) :-
    (indep(s33), consistent(s33, construction_material_innovation) ; \+indep(s33)).
evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, surf_tech_3d)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 0.725

0.90::true_val(mounting_pattern, inserts_2x4); 0.10::true_val(mounting_pattern, unk_mounting_pattern).
0.88::acc(s34, mounting_pattern).
0.93::acc(s_merchant, mounting_pattern).
measured(s34, mounting_pattern, inserts_2x4).
measured(s_merchant, mounting_pattern, inserts_2x4).
all_consistent(mounting_pattern) :-
    (indep(s34), consistent(s34, mounting_pattern) ; \+indep(s34)),
    (indep(s_merchant), consistent(s_merchant, mounting_pattern) ; \+indep(s_merchant)).
evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values w150_w155_w160=150W_155W_160W unk_available_sizes=Unknown
% @importance 1.0

0.92::true_val(available_sizes, w150_w155_w160); 0.08::true_val(available_sizes, unk_available_sizes).
0.95::acc(s2, available_sizes).
measured(s2, available_sizes, w150_w155_w160).
all_consistent(available_sizes) :- consistent(s2, available_sizes).
evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, w150_w155_w160)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values powercore_ii_poplar_beech=Powercore_II_Poplar_Beech_stringers unk_core_material=Unknown
% @importance 1.0

0.92::true_val(core_material, powercore_ii_poplar_beech); 0.08::true_val(core_material, unk_core_material).
0.93::acc(s2, core_material).
measured(s2, core_material, powercore_ii_poplar_beech).
all_consistent(core_material) :- consistent(s2, core_material).
evidence(all_consistent(core_material)).
query(true_val(core_material, powercore_ii_poplar_beech)).
query(true_val(core_material, unk_core_material)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values bi_lite=Bi_Lite_Laminates unk_laminate=Unknown
% @importance 1.0

0.92::true_val(laminate, bi_lite); 0.08::true_val(laminate, unk_laminate).
0.93::acc(s2, laminate).
measured(s2, laminate, bi_lite).
all_consistent(laminate) :- consistent(s2, laminate).
evidence(all_consistent(laminate)).
query(true_val(laminate, bi_lite)).
query(true_val(laminate, unk_laminate)).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values sintered_ecospeed_hd=Sintered_EcoSpeed_HD_Base unk_base_type=Unknown
% @importance 1.0

0.92::true_val(base_type, sintered_ecospeed_hd); 0.08::true_val(base_type, unk_base_type).
0.93::acc(s2, base_type).
measured(s2, base_type, sintered_ecospeed_hd).
all_consistent(base_type) :- consistent(s2, base_type).
evidence(all_consistent(base_type)).
query(true_val(base_type, sintered_ecospeed_hd)).
query(true_val(base_type, unk_base_type)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values recycled_steel_50pct=50pct_Recycled_Steel_Edge unk_edge_technology=Unknown
% @importance 1.0

0.92::true_val(edge_technology, recycled_steel_50pct); 0.08::true_val(edge_technology, unk_edge_technology).
0.93::acc(s2, edge_technology).
measured(s2, edge_technology, recycled_steel_50pct).
all_consistent(edge_technology) :- consistent(s2, edge_technology).
evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, recycled_steel_50pct)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values abs_35pct_recycled=ABS_Sidewalls_35pct_recycled unk_sidewall_material=Unknown
% @importance 1.0

0.92::true_val(sidewall_material, abs_35pct_recycled); 0.08::true_val(sidewall_material, unk_sidewall_material).
0.93::acc(s2, sidewall_material).
measured(s2, sidewall_material, abs_35pct_recycled).
all_consistent(sidewall_material) :- consistent(s2, sidewall_material).
evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, abs_35pct_recycled)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr resin
% @type categorical
% @canonical true
% @original_name resin
% @values ecopoxy33=EcoPoxy33_bio_based_epoxy unk_resin=Unknown
% @importance 1.0

0.92::true_val(resin, ecopoxy33); 0.08::true_val(resin, unk_resin).
0.93::acc(s2, resin).
measured(s2, resin, ecopoxy33).
all_consistent(resin) :- consistent(s2, resin).
evidence(all_consistent(resin)).
query(true_val(resin, ecopoxy33)).
query(true_val(resin, unk_resin)).

% @attr topsheet
% @type categorical
% @canonical true
% @original_name topsheet
% @values ecoguard_90pct_recycled=EcoGuard_Topsheet_90pct_recycled unk_topsheet=Unknown
% @importance 1.0

0.92::true_val(topsheet, ecoguard_90pct_recycled); 0.08::true_val(topsheet, unk_topsheet).
0.93::acc(s2, topsheet).
measured(s2, topsheet, ecoguard_90pct_recycled).
all_consistent(topsheet) :- consistent(s2, topsheet).
evidence(all_consistent(topsheet)).
query(true_val(topsheet, ecoguard_90pct_recycled)).
query(true_val(topsheet, unk_topsheet)).

% @attr factory_wax
% @type categorical
% @canonical false
% @original_name Factory wax
% @values green_speed_natural=Green_Speed_Natural_Wax_biodegradable unk_factory_wax=Unknown
% @importance 1.0

0.92::true_val(factory_wax, green_speed_natural); 0.08::true_val(factory_wax, unk_factory_wax).
0.93::acc(s2, factory_wax).
measured(s2, factory_wax, green_speed_natural).
all_consistent(factory_wax) :- consistent(s2, factory_wax).
evidence(all_consistent(factory_wax)).
query(true_val(factory_wax, green_speed_natural)).
query(true_val(factory_wax, unk_factory_wax)).

% @attr running_length_150
% @type numeric
% @canonical false
% @original_name Running length 150W
% @unit mm
% @values v1090=1090.0 unk_running_length_150=Unknown
% @importance 1.0

0.92::true_val(running_length_150, v1090); 0.08::true_val(running_length_150, unk_running_length_150).
0.93::acc(s2, running_length_150).
measured(s2, running_length_150, v1090).
all_consistent(running_length_150) :- consistent(s2, running_length_150).
evidence(all_consistent(running_length_150)).
query(true_val(running_length_150, v1090)).
query(true_val(running_length_150, unk_running_length_150)).

% @attr tip_tail_width_size_150
% @type categorical
% @canonical false
% @original_name tip_tail_width_size (150W)
% @unit mm
% @values v307_302=307mm_302mm unk_tip_tail_width_size_150=Unknown
% @importance 1.0

0.92::true_val(tip_tail_width_size_150, v307_302); 0.08::true_val(tip_tail_width_size_150, unk_tip_tail_width_size_150).
0.93::acc(s2, tip_tail_width_size_150).
measured(s2, tip_tail_width_size_150, v307_302).
all_consistent(tip_tail_width_size_150) :- consistent(s2, tip_tail_width_size_150).
evidence(all_consistent(tip_tail_width_size_150)).
query(true_val(tip_tail_width_size_150, v307_302)).
query(true_val(tip_tail_width_size_150, unk_tip_tail_width_size_150)).

% @attr waist_width_150
% @type numeric
% @canonical false
% @original_name Waist width 150W
% @unit mm
% @values v262=262.0 unk_waist_width_150=Unknown
% @importance 1.0

0.92::true_val(waist_width_150, v262); 0.08::true_val(waist_width_150, unk_waist_width_150).
0.93::acc(s2, waist_width_150).
measured(s2, waist_width_150, v262).
all_consistent(waist_width_150) :- consistent(s2, waist_width_150).
evidence(all_consistent(waist_width_150)).
query(true_val(waist_width_150, v262)).
query(true_val(waist_width_150, unk_waist_width_150)).

% @attr sidecut_radius_size_150
% @type categorical
% @canonical false
% @original_name sidecut_radius_size (150W)
% @unit m
% @values v7_4_6_1=7.4m_6.1m unk_sidecut_radius_size_150=Unknown
% @importance 1.0

0.92::true_val(sidecut_radius_size_150, v7_4_6_1); 0.08::true_val(sidecut_radius_size_150, unk_sidecut_radius_size_150).
0.93::acc(s2, sidecut_radius_size_150).
measured(s2, sidecut_radius_size_150, v7_4_6_1).
all_consistent(sidecut_radius_size_150) :- consistent(s2, sidecut_radius_size_150).
evidence(all_consistent(sidecut_radius_size_150)).
query(true_val(sidecut_radius_size_150, v7_4_6_1)).
query(true_val(sidecut_radius_size_150, unk_sidecut_radius_size_150)).

% @attr stance_width_range_size_150
% @type categorical
% @canonical false
% @original_name stance_width_range_size (150W)
% @unit cm
% @values v48_60=48-60cm unk_stance_width_range_size_150=Unknown
% @importance 1.0

0.92::true_val(stance_width_range_size_150, v48_60); 0.08::true_val(stance_width_range_size_150, unk_stance_width_range_size_150).
0.93::acc(s2, stance_width_range_size_150).
measured(s2, stance_width_range_size_150, v48_60).
all_consistent(stance_width_range_size_150) :- consistent(s2, stance_width_range_size_150).
evidence(all_consistent(stance_width_range_size_150)).
query(true_val(stance_width_range_size_150, v48_60)).
query(true_val(stance_width_range_size_150, unk_stance_width_range_size_150)).

% @attr recommended_weight_range_size_150
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (150W)
% @unit kg
% @values v60_plus=60_plus_kg unk_recommended_weight_range_size_150=Unknown
% @importance 1.0

0.92::true_val(recommended_weight_range_size_150, v60_plus); 0.08::true_val(recommended_weight_range_size_150, unk_recommended_weight_range_size_150).
0.93::acc(s2, recommended_weight_range_size_150).
measured(s2, recommended_weight_range_size_150, v60_plus).
all_consistent(recommended_weight_range_size_150) :- consistent(s2, recommended_weight_range_size_150).
evidence(all_consistent(recommended_weight_range_size_150)).
query(true_val(recommended_weight_range_size_150, v60_plus)).
query(true_val(recommended_weight_range_size_150, unk_recommended_weight_range_size_150)).

% @attr running_length_155
% @type numeric
% @canonical false
% @original_name Running length 155W
% @unit mm
% @values v1130=1130.0 unk_running_length_155=Unknown
% @importance 1.0

0.92::true_val(running_length_155, v1130); 0.08::true_val(running_length_155, unk_running_length_155).
0.93::acc(s2, running_length_155).
measured(s2, running_length_155, v1130).
all_consistent(running_length_155) :- consistent(s2, running_length_155).
evidence(all_consistent(running_length_155)).
query(true_val(running_length_155, v1130)).
query(true_val(running_length_155, unk_running_length_155)).

% @attr tip_tail_width_size
% @type categorical
% @canonical true
% @original_name tip_tail_width_size
% @unit mm
% @values v314_308=314mm_308mm unk_tip_tail_width_size=Unknown
% @importance 1.0

0.92::true_val(tip_tail_width_size, v314_308); 0.08::true_val(tip_tail_width_size, unk_tip_tail_width_size).
0.93::acc(s2, tip_tail_width_size).
measured(s2, tip_tail_width_size, v314_308).
all_consistent(tip_tail_width_size) :- consistent(s2, tip_tail_width_size).
evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v314_308)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr waist_width_155
% @type numeric
% @canonical false
% @original_name Waist width 155W
% @unit mm
% @values v267=267.0 unk_waist_width_155=Unknown
% @importance 1.0

0.92::true_val(waist_width_155, v267); 0.08::true_val(waist_width_155, unk_waist_width_155).
0.93::acc(s2, waist_width_155).
measured(s2, waist_width_155, v267).
all_consistent(waist_width_155) :- consistent(s2, waist_width_155).
evidence(all_consistent(waist_width_155)).
query(true_val(waist_width_155, v267)).
query(true_val(waist_width_155, unk_waist_width_155)).

% @attr sidecut_radius_size
% @type categorical
% @canonical true
% @original_name sidecut_radius_size
% @unit m
% @values v7_6_6_3=7.6m_6.3m unk_sidecut_radius_size=Unknown
% @importance 1.0

0.92::true_val(sidecut_radius_size, v7_6_6_3); 0.08::true_val(sidecut_radius_size, unk_sidecut_radius_size).
0.93::acc(s2, sidecut_radius_size).
measured(s2, sidecut_radius_size, v7_6_6_3).
all_consistent(sidecut_radius_size) :- consistent(s2, sidecut_radius_size).
evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_6_6_3)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr setback
% @type numeric
% @canonical true
% @original_name setback
% @unit mm
% @values vneg15=-15.0 unk_setback=Unknown
% @importance 0.975

0.97::true_val(setback, vneg15); 0.03::true_val(setback, unk_setback).
0.95::acc(s2, setback).
0.88::acc(s20, setback).
measured(s2, setback, vneg15).
measured(s20, setback, vneg15).
all_consistent(setback) :-
    consistent(s2, setback),
    consistent(s20, setback).
evidence(all_consistent(setback)).
query(true_val(setback, vneg15)).
query(true_val(setback, unk_setback)).

% @attr stance_width_range_size
% @type categorical
% @canonical true
% @original_name stance_width_range_size
% @unit cm
% @values v48_60=48-60cm unk_stance_width_range_size=Unknown
% @importance 1.0

0.92::true_val(stance_width_range_size, v48_60); 0.08::true_val(stance_width_range_size, unk_stance_width_range_size).
0.93::acc(s2, stance_width_range_size).
measured(s2, stance_width_range_size, v48_60).
all_consistent(stance_width_range_size) :- consistent(s2, stance_width_range_size).
evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v48_60)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size
% @unit kg
% @values v70_plus=70_plus_kg unk_recommended_weight_range_size=Unknown
% @importance 1.0

0.92::true_val(recommended_weight_range_size, v70_plus); 0.08::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).
0.93::acc(s2, recommended_weight_range_size).
measured(s2, recommended_weight_range_size, v70_plus).
all_consistent(recommended_weight_range_size) :- consistent(s2, recommended_weight_range_size).
evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, v70_plus)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr running_length_160
% @type numeric
% @canonical false
% @original_name Running length 160W
% @unit mm
% @values v1180=1180.0 unk_running_length_160=Unknown
% @importance 1.0

0.92::true_val(running_length_160, v1180); 0.08::true_val(running_length_160, unk_running_length_160).
0.93::acc(s2, running_length_160).
measured(s2, running_length_160, v1180).
all_consistent(running_length_160) :- consistent(s2, running_length_160).
evidence(all_consistent(running_length_160)).
query(true_val(running_length_160, v1180)).
query(true_val(running_length_160, unk_running_length_160)).

% @attr tip_tail_width_size_160
% @type categorical
% @canonical false
% @original_name tip_tail_width_size (160W)
% @unit mm
% @values v318_312=318mm_312mm unk_tip_tail_width_size_160=Unknown
% @importance 1.0

0.92::true_val(tip_tail_width_size_160, v318_312); 0.08::true_val(tip_tail_width_size_160, unk_tip_tail_width_size_160).
0.93::acc(s2, tip_tail_width_size_160).
measured(s2, tip_tail_width_size_160, v318_312).
all_consistent(tip_tail_width_size_160) :- consistent(s2, tip_tail_width_size_160).
evidence(all_consistent(tip_tail_width_size_160)).
query(true_val(tip_tail_width_size_160, v318_312)).
query(true_val(tip_tail_width_size_160, unk_tip_tail_width_size_160)).

% @attr waist_width_160
% @type numeric
% @canonical false
% @original_name Waist width 160W
% @unit mm
% @values v269=269.0 unk_waist_width_160=Unknown
% @importance 1.0

0.92::true_val(waist_width_160, v269); 0.08::true_val(waist_width_160, unk_waist_width_160).
0.93::acc(s2, waist_width_160).
measured(s2, waist_width_160, v269).
all_consistent(waist_width_160) :- consistent(s2, waist_width_160).
evidence(all_consistent(waist_width_160)).
query(true_val(waist_width_160, v269)).
query(true_val(waist_width_160, unk_waist_width_160)).

% @attr sidecut_radius_size_160
% @type categorical
% @canonical false
% @original_name sidecut_radius_size (160W)
% @unit m
% @values v8_0_6_6=8.0m_6.6m unk_sidecut_radius_size_160=Unknown
% @importance 1.0

0.92::true_val(sidecut_radius_size_160, v8_0_6_6); 0.08::true_val(sidecut_radius_size_160, unk_sidecut_radius_size_160).
0.93::acc(s2, sidecut_radius_size_160).
measured(s2, sidecut_radius_size_160, v8_0_6_6).
all_consistent(sidecut_radius_size_160) :- consistent(s2, sidecut_radius_size_160).
evidence(all_consistent(sidecut_radius_size_160)).
query(true_val(sidecut_radius_size_160, v8_0_6_6)).
query(true_val(sidecut_radius_size_160, unk_sidecut_radius_size_160)).

% @attr stance_width_range_size_160
% @type categorical
% @canonical false
% @original_name stance_width_range_size (160W)
% @unit cm
% @values v50_62=50-62cm unk_stance_width_range_size_160=Unknown
% @importance 1.0

0.92::true_val(stance_width_range_size_160, v50_62); 0.08::true_val(stance_width_range_size_160, unk_stance_width_range_size_160).
0.93::acc(s2, stance_width_range_size_160).
measured(s2, stance_width_range_size_160, v50_62).
all_consistent(stance_width_range_size_160) :- consistent(s2, stance_width_range_size_160).
evidence(all_consistent(stance_width_range_size_160)).
query(true_val(stance_width_range_size_160, v50_62)).
query(true_val(stance_width_range_size_160, unk_stance_width_range_size_160)).

% @attr recommended_weight_range_size_160
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (160W)
% @unit kg
% @values v75_plus=75_plus_kg unk_recommended_weight_range_size_160=Unknown
% @importance 1.0

0.92::true_val(recommended_weight_range_size_160, v75_plus); 0.08::true_val(recommended_weight_range_size_160, unk_recommended_weight_range_size_160).
0.93::acc(s2, recommended_weight_range_size_160).
measured(s2, recommended_weight_range_size_160, v75_plus).
all_consistent(recommended_weight_range_size_160) :- consistent(s2, recommended_weight_range_size_160).
evidence(all_consistent(recommended_weight_range_size_160)).
query(true_val(recommended_weight_range_size_160, v75_plus)).
query(true_val(recommended_weight_range_size_160, unk_recommended_weight_range_size_160)).

% @attr terrain_suitability
% @type numeric
% @canonical true
% @original_name terrain_suitability
% @unit /10
% @values v10=10.0 unk_terrain_suitability=Unknown
% @importance 1.0

0.92::true_val(terrain_suitability, v10); 0.08::true_val(terrain_suitability, unk_terrain_suitability).
0.93::acc(s2, terrain_suitability).
measured(s2, terrain_suitability, v10).
all_consistent(terrain_suitability) :- consistent(s2, terrain_suitability).
evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, v10)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr terrain_suitability_park
% @type numeric
% @canonical false
% @original_name terrain_suitability (park/groomed)
% @unit /10
% @values v4=4.0 unk_terrain_suitability_park=Unknown
% @importance 1.0

0.92::true_val(terrain_suitability_park, v4); 0.08::true_val(terrain_suitability_park, unk_terrain_suitability_park).
0.93::acc(s2, terrain_suitability_park).
measured(s2, terrain_suitability_park, v4).
all_consistent(terrain_suitability_park) :- consistent(s2, terrain_suitability_park).
evidence(all_consistent(terrain_suitability_park)).
query(true_val(terrain_suitability_park, v4)).
query(true_val(terrain_suitability_park, unk_terrain_suitability_park)).

% @attr terrain_suitability_backcountry
% @type numeric
% @canonical false
% @original_name terrain_suitability (backcountry/all-mountain)
% @unit /10
% @values v10=10.0 unk_terrain_suitability_backcountry=Unknown
% @importance 1.0

0.92::true_val(terrain_suitability_backcountry, v10); 0.08::true_val(terrain_suitability_backcountry, unk_terrain_suitability_backcountry).
0.93::acc(s2, terrain_suitability_backcountry).
measured(s2, terrain_suitability_backcountry, v10).
all_consistent(terrain_suitability_backcountry) :- consistent(s2, terrain_suitability_backcountry).
evidence(all_consistent(terrain_suitability_backcountry)).
query(true_val(terrain_suitability_backcountry, v10)).
query(true_val(terrain_suitability_backcountry, unk_terrain_suitability_backcountry)).

% @attr terrain_suitability_description
% @type categorical
% @canonical false
% @original_name terrain_suitability (description)
% @values trees_powder_faces_groomers=Tree_runs_deep_powder_wide_open_faces_groomers unk_terrain_suitability_description=Unknown
% @importance 1.0

0.92::true_val(terrain_suitability_description, trees_powder_faces_groomers); 0.08::true_val(terrain_suitability_description, unk_terrain_suitability_description).
0.93::acc(s2, terrain_suitability_description).
measured(s2, terrain_suitability_description, trees_powder_faces_groomers).
all_consistent(terrain_suitability_description) :- consistent(s2, terrain_suitability_description).
evidence(all_consistent(terrain_suitability_description)).
query(true_val(terrain_suitability_description, trees_powder_faces_groomers)).
query(true_val(terrain_suitability_description, unk_terrain_suitability_description)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values solar_power_100pct=Made_with_100pct_solar_power unk_sustainability_certification=Unknown
% @importance 1.0

0.92::true_val(sustainability_certification, solar_power_100pct); 0.08::true_val(sustainability_certification, unk_sustainability_certification).
0.93::acc(s2, sustainability_certification).
measured(s2, sustainability_certification, solar_power_100pct).
all_consistent(sustainability_certification) :- consistent(s2, sustainability_certification).
evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, solar_power_100pct)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr sustainability_certification_fsc
% @type categorical
% @canonical false
% @original_name sustainability_certification (FSC)
% @values fsc_certified=FSC_Certified_Wood_Core unk_sustainability_certification_fsc=Unknown
% @importance 1.0

0.92::true_val(sustainability_certification_fsc, fsc_certified); 0.08::true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc).
0.93::acc(s2, sustainability_certification_fsc).
measured(s2, sustainability_certification_fsc, fsc_certified).
all_consistent(sustainability_certification_fsc) :- consistent(s2, sustainability_certification_fsc).
evidence(all_consistent(sustainability_certification_fsc)).
query(true_val(sustainability_certification_fsc, fsc_certified)).
query(true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc)).

% @attr sustainability_certification_inks
% @type categorical
% @canonical false
% @original_name sustainability_certification (inks)
% @values water_based_inks=Water_based_inks unk_sustainability_certification_inks=Unknown
% @importance 1.0

0.92::true_val(sustainability_certification_inks, water_based_inks); 0.08::true_val(sustainability_certification_inks, unk_sustainability_certification_inks).
0.93::acc(s2, sustainability_certification_inks).
measured(s2, sustainability_certification_inks, water_based_inks).
all_consistent(sustainability_certification_inks) :- consistent(s2, sustainability_certification_inks).
evidence(all_consistent(sustainability_certification_inks)).
query(true_val(sustainability_certification_inks, water_based_inks)).
query(true_val(sustainability_certification_inks, unk_sustainability_certification_inks)).

% @attr sustainability_certification_recycled
% @type categorical
% @canonical false
% @original_name sustainability_certification (recycled materials)
% @values recycled_throughout=Recycled_raw_materials_throughout unk_sustainability_certification_recycled=Unknown
% @importance 1.0

0.92::true_val(sustainability_certification_recycled, recycled_throughout); 0.08::true_val(sustainability_certification_recycled, unk_sustainability_certification_recycled).
0.93::acc(s2, sustainability_certification_recycled).
measured(s2, sustainability_certification_recycled, recycled_throughout).
all_consistent(sustainability_certification_recycled) :- consistent(s2, sustainability_certification_recycled).
evidence(all_consistent(sustainability_certification_recycled)).
query(true_val(sustainability_certification_recycled, recycled_throughout)).
query(true_val(sustainability_certification_recycled, unk_sustainability_certification_recycled)).

% @attr sustainability_certification_carbon
% @type numeric
% @canonical false
% @original_name sustainability_certification (carbon footprint)
% @unit kg_CO2
% @values v32_2=32.2 unk_sustainability_certification_carbon=Unknown
% @importance 1.0

0.92::true_val(sustainability_certification_carbon, v32_2); 0.08::true_val(sustainability_certification_carbon, unk_sustainability_certification_carbon).
0.93::acc(s2, sustainability_certification_carbon).
measured(s2, sustainability_certification_carbon, v32_2).
all_consistent(sustainability_certification_carbon) :- consistent(s2, sustainability_certification_carbon).
evidence(all_consistent(sustainability_certification_carbon)).
query(true_val(sustainability_certification_carbon, v32_2)).
query(true_val(sustainability_certification_carbon, unk_sustainability_certification_carbon)).

% @attr sustainability_certification_base
% @type categorical
% @canonical false
% @original_name sustainability_certification (EcoSpeed base)
% @values ecospeed_85pct_recycled=EcoSpeed_Base_85pct_recycled_Ptex unk_sustainability_certification_base=Unknown
% @importance 0.75

0.90::true_val(sustainability_certification_base, ecospeed_85pct_recycled); 0.10::true_val(sustainability_certification_base, unk_sustainability_certification_base).
0.88::acc(s35, sustainability_certification_base).
0.93::acc(s_merchant, sustainability_certification_base).
measured(s35, sustainability_certification_base, ecospeed_85pct_recycled).
measured(s_merchant, sustainability_certification_base, ecospeed_85pct_recycled).
all_consistent(sustainability_certification_base) :-
    (indep(s35), consistent(s35, sustainability_certification_base) ; \+indep(s35)),
    (indep(s_merchant), consistent(s_merchant, sustainability_certification_base) ; \+indep(s_merchant)).
evidence(all_consistent(sustainability_certification_base)).
query(true_val(sustainability_certification_base, ecospeed_85pct_recycled)).
query(true_val(sustainability_certification_base, unk_sustainability_certification_base)).

% @attr sustainability_certification_edges
% @type categorical
% @canonical false
% @original_name sustainability_certification (recycled edges)
% @values recycled_steel_edges=Recycled_steel_edges unk_sustainability_certification_edges=Unknown
% @importance 1.0

0.92::true_val(sustainability_certification_edges, recycled_steel_edges); 0.08::true_val(sustainability_certification_edges, unk_sustainability_certification_edges).
0.93::acc(s2, sustainability_certification_edges).
measured(s2, sustainability_certification_edges, recycled_steel_edges).
all_consistent(sustainability_certification_edges) :- consistent(s2, sustainability_certification_edges).
evidence(all_consistent(sustainability_certification_edges)).
query(true_val(sustainability_certification_edges, recycled_steel_edges)).
query(true_val(sustainability_certification_edges, unk_sustainability_certification_edges)).

% @attr warranty
% @type categorical
% @canonical false
% @original_name warranty
% @values two_year_structural=2_year_structural_defects_only unk_warranty=Unknown
% @importance 0.75

0.76::true_val(warranty, two_year_structural); 0.24::true_val(warranty, unk_warranty).
0.88::acc(s36, warranty).
measured(s36, warranty, two_year_structural).
all_consistent(warranty) :-
    (indep(s36), consistent(s36, warranty) ; \+indep(s36)).
evidence(all_consistent(warranty)).
query(true_val(warranty, two_year_structural)).
query(true_val(warranty, unk_warranty)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values alternative_freeride=Alternative_Freeride unk_riding_style=Unknown
% @importance 0.95

0.81::true_val(riding_style, alternative_freeride); 0.19::true_val(riding_style, unk_riding_style).
0.88::acc(s20, riding_style).
measured(s20, riding_style, alternative_freeride).
all_consistent(riding_style) :- consistent(s20, riding_style).
evidence(all_consistent(riding_style)).
query(true_val(riding_style, alternative_freeride)).
query(true_val(riding_style, unk_riding_style)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values advanced_expert=Advanced_Expert intermediate_advanced=Intermediate_Advanced intermediate=Intermediate
% @importance 0.84

0.45::true_val(skill_level_recommendation, advanced_expert); 0.37::true_val(skill_level_recommendation, intermediate_advanced); 0.18::true_val(skill_level_recommendation, intermediate).
0.88::acc(s20, skill_level_recommendation).
0.85::acc(s33, skill_level_recommendation).
0.80::acc(s14, skill_level_recommendation).
0.78::acc(s25, skill_level_recommendation).
0.82::acc(s_merchant, skill_level_recommendation).
measured(s20, skill_level_recommendation, advanced_expert).
measured(s33, skill_level_recommendation, advanced_expert).
measured(s14, skill_level_recommendation, intermediate_advanced).
measured(s25, skill_level_recommendation, intermediate_advanced).
measured(s_merchant, skill_level_recommendation, intermediate).
all_consistent(skill_level_recommendation) :-
    consistent(s20, skill_level_recommendation),
    (indep(s33), consistent(s33, skill_level_recommendation) ; \+indep(s33)),
    (indep(s14), consistent(s14, skill_level_recommendation) ; \+indep(s14)),
    (indep(s25), consistent(s25, skill_level_recommendation) ; \+indep(s25)),
    (indep(s_merchant), consistent(s_merchant, skill_level_recommendation) ; \+indep(s_merchant)).
evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, advanced_expert)).
query(true_val(skill_level_recommendation, intermediate_advanced)).
query(true_val(skill_level_recommendation, intermediate)).

% @attr powder_rating_tgr
% @type categorical
% @canonical true
% @original_name powder_rating_tgr
% @values great=Great unk_powder_rating_tgr=Unknown
% @importance 0.95

0.81::true_val(powder_rating_tgr, great); 0.19::true_val(powder_rating_tgr, unk_powder_rating_tgr).
0.88::acc(s20, powder_rating_tgr).
measured(s20, powder_rating_tgr, great).
all_consistent(powder_rating_tgr) :- consistent(s20, powder_rating_tgr).
evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, great)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

% @attr carving_rating_tgr
% @type categorical
% @canonical true
% @original_name carving_rating_tgr
% @values great=Great unk_carving_rating_tgr=Unknown
% @importance 0.95

0.81::true_val(carving_rating_tgr, great); 0.19::true_val(carving_rating_tgr, unk_carving_rating_tgr).
0.88::acc(s20, carving_rating_tgr).
measured(s20, carving_rating_tgr, great).
all_consistent(carving_rating_tgr) :- consistent(s20, carving_rating_tgr).
evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, great)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

% @attr uneven_snow_rating_tgr
% @type categorical
% @canonical false
% @original_name The Good Ride — uneven snow rating
% @values great=Great unk_uneven_snow_rating_tgr=Unknown
% @importance 0.95

0.81::true_val(uneven_snow_rating_tgr, great); 0.19::true_val(uneven_snow_rating_tgr, unk_uneven_snow_rating_tgr).
0.88::acc(s20, uneven_snow_rating_tgr).
measured(s20, uneven_snow_rating_tgr, great).
all_consistent(uneven_snow_rating_tgr) :- consistent(s20, uneven_snow_rating_tgr).
evidence(all_consistent(uneven_snow_rating_tgr)).
query(true_val(uneven_snow_rating_tgr, great)).
query(true_val(uneven_snow_rating_tgr, unk_uneven_snow_rating_tgr)).

% @attr speed_rating_tgr
% @type categorical
% @canonical true
% @original_name speed_rating_tgr
% @values good=Good unk_speed_rating_tgr=Unknown
% @importance 0.95

0.81::true_val(speed_rating_tgr, good); 0.19::true_val(speed_rating_tgr, unk_speed_rating_tgr).
0.88::acc(s20, speed_rating_tgr).
measured(s20, speed_rating_tgr, good).
all_consistent(speed_rating_tgr) :- consistent(s20, speed_rating_tgr).
evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, good)).
query(true_val(speed_rating_tgr, unk_speed_rating_tgr)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values good=Good unk_base_glide_performance=Unknown
% @importance 0.95

0.81::true_val(base_glide_performance, good); 0.19::true_val(base_glide_performance, unk_base_glide_performance).
0.88::acc(s20, base_glide_performance).
measured(s20, base_glide_performance, good).
all_consistent(base_glide_performance) :- consistent(s20, base_glide_performance).
evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, good)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values average=Average unk_switch_riding=Unknown
% @importance 0.95

0.81::true_val(switch_riding, average); 0.19::true_val(switch_riding, unk_switch_riding).
0.88::acc(s20, switch_riding).
measured(s20, switch_riding, average).
all_consistent(switch_riding) :- consistent(s20, switch_riding).
evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, average)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr jumps_rating_tgr
% @type categorical
% @canonical true
% @original_name jumps_rating_tgr
% @values good=Good unk_jumps_rating_tgr=Unknown
% @importance 0.95

0.81::true_val(jumps_rating_tgr, good); 0.19::true_val(jumps_rating_tgr, unk_jumps_rating_tgr).
0.88::acc(s20, jumps_rating_tgr).
measured(s20, jumps_rating_tgr, good).
all_consistent(jumps_rating_tgr) :- consistent(s20, jumps_rating_tgr).
evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, good)).
query(true_val(jumps_rating_tgr, unk_jumps_rating_tgr)).

% @attr jibbing_rating_tgr
% @type categorical
% @canonical true
% @original_name jibbing_rating_tgr
% @values average=Average unk_jibbing_rating_tgr=Unknown
% @importance 0.95

0.81::true_val(jibbing_rating_tgr, average); 0.19::true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr).
0.88::acc(s20, jibbing_rating_tgr).
measured(s20, jibbing_rating_tgr, average).
all_consistent(jibbing_rating_tgr) :- consistent(s20, jibbing_rating_tgr).
evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, average)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr)).

% @attr pipe_rating_tgr
% @type categorical
% @canonical true
% @original_name pipe_rating_tgr
% @values average=Average unk_pipe_rating_tgr=Unknown
% @importance 0.95

0.81::true_val(pipe_rating_tgr, average); 0.19::true_val(pipe_rating_tgr, unk_pipe_rating_tgr).
0.88::acc(s20, pipe_rating_tgr).
measured(s20, pipe_rating_tgr, average).
all_consistent(pipe_rating_tgr) :- consistent(s20, pipe_rating_tgr).
evidence(all_consistent(pipe_rating_tgr)).
query(true_val(pipe_rating_tgr, average)).
query(true_val(pipe_rating_tgr, unk_pipe_rating_tgr)).

% @attr on_snow_feel_tgr
% @type categorical
% @canonical true
% @original_name on_snow_feel_tgr
% @values semi_locked_in=Semi_Locked_In unk_on_snow_feel_tgr=Unknown
% @importance 0.95

0.81::true_val(on_snow_feel_tgr, semi_locked_in); 0.19::true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr).
0.88::acc(s20, on_snow_feel_tgr).
measured(s20, on_snow_feel_tgr, semi_locked_in).
all_consistent(on_snow_feel_tgr) :- consistent(s20, on_snow_feel_tgr).
evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, semi_locked_in)).
query(true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values medium=Medium unk_turn_initiation_performance=Unknown
% @importance 0.95

0.81::true_val(turn_initiation_performance, medium); 0.19::true_val(turn_initiation_performance, unk_turn_initiation_performance).
0.88::acc(s20, turn_initiation_performance).
measured(s20, turn_initiation_performance, medium).
all_consistent(turn_initiation_performance) :- consistent(s20, turn_initiation_performance).
evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, medium)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr skidded_turns_tgr
% @type categorical
% @canonical false
% @original_name The Good Ride — skidded turns
% @values semi_hard=Semi_Hard unk_skidded_turns_tgr=Unknown
% @importance 0.95

0.81::true_val(skidded_turns_tgr, semi_hard); 0.19::true_val(skidded_turns_tgr, unk_skidded_turns_tgr).
0.88::acc(s20, skidded_turns_tgr).
measured(s20, skidded_turns_tgr, semi_hard).
all_consistent(skidded_turns_tgr) :- consistent(s20, skidded_turns_tgr).
evidence(all_consistent(skidded_turns_tgr)).
query(true_val(skidded_turns_tgr, semi_hard)).
query(true_val(skidded_turns_tgr, unk_skidded_turns_tgr)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values medium_stiff=Medium_Stiff_rubbery_snaps_back_hard unk_flex_feel=Unknown
% @importance 0.95

0.81::true_val(flex_feel, medium_stiff); 0.19::true_val(flex_feel, unk_flex_feel).
0.88::acc(s20, flex_feel).
measured(s20, flex_feel, medium_stiff).
all_consistent(flex_feel) :- consistent(s20, flex_feel).
evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium_stiff)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr buttering_tgr
% @type categorical
% @canonical false
% @original_name The Good Ride — buttering
% @values semi_hard=Semi_Hard unk_buttering_tgr=Unknown
% @importance 0.95

0.81::true_val(buttering_tgr, semi_hard); 0.19::true_val(buttering_tgr, unk_buttering_tgr).
0.88::acc(s20, buttering_tgr).
measured(s20, buttering_tgr, semi_hard).
all_consistent(buttering_tgr) :- consistent(s20, buttering_tgr).
evidence(all_consistent(buttering_tgr)).
query(true_val(buttering_tgr, semi_hard)).
query(true_val(buttering_tgr, unk_buttering_tgr)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values hard_snow=Hard_Snow unk_edge_hold=Unknown
% @importance 0.95

0.81::true_val(edge_hold, hard_snow); 0.19::true_val(edge_hold, unk_edge_hold).
0.88::acc(s20, edge_hold).
measured(s20, edge_hold, hard_snow).
all_consistent(edge_hold) :- consistent(s20, edge_hold).
evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, hard_snow)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr list_price_tgr
% @type numeric
% @canonical false
% @original_name The Good Ride — list price cited
% @unit USD
% @values v599=599.0 unk_list_price_tgr=Unknown
% @importance 0.95

0.81::true_val(list_price_tgr, v599); 0.19::true_val(list_price_tgr, unk_list_price_tgr).
0.88::acc(s20, list_price_tgr).
measured(s20, list_price_tgr, v599).
all_consistent(list_price_tgr) :- consistent(s20, list_price_tgr).
evidence(all_consistent(list_price_tgr)).
query(true_val(list_price_tgr, v599)).
query(true_val(list_price_tgr, unk_list_price_tgr)).

% @attr fits_boot_size_tgr
% @type categorical
% @canonical false
% @original_name The Good Ride — fits boot size
% @values us_8_12=US_8_10_and_10_12 unk_fits_boot_size_tgr=Unknown
% @importance 0.95

0.81::true_val(fits_boot_size_tgr, us_8_12); 0.19::true_val(fits_boot_size_tgr, unk_fits_boot_size_tgr).
0.88::acc(s20, fits_boot_size_tgr).
measured(s20, fits_boot_size_tgr, us_8_12).
all_consistent(fits_boot_size_tgr) :- consistent(s20, fits_boot_size_tgr).
evidence(all_consistent(fits_boot_size_tgr)).
query(true_val(fits_boot_size_tgr, us_8_12)).
query(true_val(fits_boot_size_tgr, unk_fits_boot_size_tgr)).

% @attr weight_feel_tgr
% @type categorical
% @canonical false
% @original_name The Good Ride — approximate weight feel
% @values normal_for_surface_area=Normal_for_surface_area unk_weight_feel_tgr=Unknown
% @importance 0.95

0.81::true_val(weight_feel_tgr, normal_for_surface_area); 0.19::true_val(weight_feel_tgr, unk_weight_feel_tgr).
0.88::acc(s20, weight_feel_tgr).
measured(s20, weight_feel_tgr, normal_for_surface_area).
all_consistent(weight_feel_tgr) :- consistent(s20, weight_feel_tgr).
evidence(all_consistent(weight_feel_tgr)).
query(true_val(weight_feel_tgr, normal_for_surface_area)).
query(true_val(weight_feel_tgr, unk_weight_feel_tgr)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values spoon_nose_in_pow=Spoon_nose_felt_only_in_powder unk_positive_aspect=Unknown
% @importance 0.95

0.81::true_val(positive_aspect, spoon_nose_in_pow); 0.19::true_val(positive_aspect, unk_positive_aspect).
0.85::acc(s20, positive_aspect).
measured(s20, positive_aspect, spoon_nose_in_pow).
all_consistent(positive_aspect) :- consistent(s20, positive_aspect).
evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, spoon_nose_in_pow)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr positive_aspect_turning
% @type categorical
% @canonical false
% @original_name positive_aspect (turning)
% @values fun_centered_turning=Fun_centered_feel_when_turning unk_positive_aspect_turning=Unknown
% @importance 0.95

0.81::true_val(positive_aspect_turning, fun_centered_turning); 0.19::true_val(positive_aspect_turning, unk_positive_aspect_turning).
0.85::acc(s20, positive_aspect_turning).
measured(s20, positive_aspect_turning, fun_centered_turning).
all_consistent(positive_aspect_turning) :- consistent(s20, positive_aspect_turning).
evidence(all_consistent(positive_aspect_turning)).
query(true_val(positive_aspect_turning, fun_centered_turning)).
query(true_val(positive_aspect_turning, unk_positive_aspect_turning)).

% @attr positive_aspect_float
% @type categorical
% @canonical false
% @original_name positive_aspect (float)
% @values pretty_good_float=Pretty_good_float unk_positive_aspect_float=Unknown
% @importance 0.95

0.81::true_val(positive_aspect_float, pretty_good_float); 0.19::true_val(positive_aspect_float, unk_positive_aspect_float).
0.85::acc(s20, positive_aspect_float).
measured(s20, positive_aspect_float, pretty_good_float).
all_consistent(positive_aspect_float) :- consistent(s20, positive_aspect_float).
evidence(all_consistent(positive_aspect_float)).
query(true_val(positive_aspect_float, pretty_good_float)).
query(true_val(positive_aspect_float, unk_positive_aspect_float)).

% @attr positive_aspect_pop
% @type categorical
% @canonical false
% @original_name positive_aspect (pop)
% @values very_good_pop=Very_good_pop unk_positive_aspect_pop=Unknown
% @importance 0.95

0.81::true_val(positive_aspect_pop, very_good_pop); 0.19::true_val(positive_aspect_pop, unk_positive_aspect_pop).
0.85::acc(s20, positive_aspect_pop).
measured(s20, positive_aspect_pop, very_good_pop).
all_consistent(positive_aspect_pop) :- consistent(s20, positive_aspect_pop).
evidence(all_consistent(positive_aspect_pop)).
query(true_val(positive_aspect_pop, very_good_pop)).
query(true_val(positive_aspect_pop, unk_positive_aspect_pop)).

% @attr negative_aspect
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values hard_turn_uneven_small_boot=Hard_to_turn_uneven_snow_size_10_under unk_negative_aspect=Unknown
% @importance 0.95

0.81::true_val(negative_aspect, hard_turn_uneven_small_boot); 0.19::true_val(negative_aspect, unk_negative_aspect).
0.85::acc(s20, negative_aspect).
measured(s20, negative_aspect, hard_turn_uneven_small_boot).
all_consistent(negative_aspect) :- consistent(s20, negative_aspect).
evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, hard_turn_uneven_small_boot)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values tgr_comp_list=Gentemstick_Mantaray_Jones_Hovercraft_Korua_TF_Rome_Stalefish_Cardiff_Powgoda_Jones_ME_Yes_PYL unk_comparable_board_cross_brand=Unknown
% @importance 0.85

0.81::true_val(comparable_board_cross_brand, tgr_comp_list); 0.19::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).
0.90::acc(s37, comparable_board_cross_brand).
measured(s37, comparable_board_cross_brand, tgr_comp_list).
all_consistent(comparable_board_cross_brand) :- consistent(s37, comparable_board_cross_brand).
evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, tgr_comp_list)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr king_reviewer_opinion
% @type categorical
% @canonical false
% @original_name King Snowboard Magazine reviewer opinion
% @values turnkey_comfortable=Really_turnkey_comfortable_right_away unk_king_reviewer_opinion=Unknown
% @importance 0.85

0.63::true_val(king_reviewer_opinion, turnkey_comfortable); 0.37::true_val(king_reviewer_opinion, unk_king_reviewer_opinion).
0.82::acc(s38, king_reviewer_opinion).
measured(s38, king_reviewer_opinion, turnkey_comfortable).
all_consistent(king_reviewer_opinion) :- consistent(s38, king_reviewer_opinion).
evidence(all_consistent(king_reviewer_opinion)).
query(true_val(king_reviewer_opinion, turnkey_comfortable)).
query(true_val(king_reviewer_opinion, unk_king_reviewer_opinion)).

% @attr king_reviewer_versatility
% @type categorical
% @canonical false
% @original_name King Snowboard reviewer — versatility
% @values very_versatile=Very_versatile_all_over_mountain unk_king_reviewer_versatility=Unknown
% @importance 0.85

0.63::true_val(king_reviewer_versatility, very_versatile); 0.37::true_val(king_reviewer_versatility, unk_king_reviewer_versatility).
0.82::acc(s38, king_reviewer_versatility).
measured(s38, king_reviewer_versatility, very_versatile).
all_consistent(king_reviewer_versatility) :- consistent(s38, king_reviewer_versatility).
evidence(all_consistent(king_reviewer_versatility)).
query(true_val(king_reviewer_versatility, very_versatile)).
query(true_val(king_reviewer_versatility, unk_king_reviewer_versatility)).

% @attr king_reviewer_edge_hold
% @type categorical
% @canonical false
% @original_name King Snowboard reviewer — edge hold
% @values great_edge_camber=Great_edge_hold_from_traditional_camber unk_king_reviewer_edge_hold=Unknown
% @importance 0.85

0.63::true_val(king_reviewer_edge_hold, great_edge_camber); 0.37::true_val(king_reviewer_edge_hold, unk_king_reviewer_edge_hold).
0.82::acc(s38, king_reviewer_edge_hold).
measured(s38, king_reviewer_edge_hold, great_edge_camber).
all_consistent(king_reviewer_edge_hold) :- consistent(s38, king_reviewer_edge_hold).
evidence(all_consistent(king_reviewer_edge_hold)).
query(true_val(king_reviewer_edge_hold, great_edge_camber)).
query(true_val(king_reviewer_edge_hold, unk_king_reviewer_edge_hold)).

% @attr king_reviewer_snap
% @type categorical
% @canonical false
% @original_name King Snowboard reviewer — snap
% @values lots_of_snap=Lot_of_snap_in_and_out_of_turns unk_king_reviewer_snap=Unknown
% @importance 0.85

0.63::true_val(king_reviewer_snap, lots_of_snap); 0.37::true_val(king_reviewer_snap, unk_king_reviewer_snap).
0.82::acc(s38, king_reviewer_snap).
measured(s38, king_reviewer_snap, lots_of_snap).
all_consistent(king_reviewer_snap) :- consistent(s38, king_reviewer_snap).
evidence(all_consistent(king_reviewer_snap)).
query(true_val(king_reviewer_snap, lots_of_snap)).
query(true_val(king_reviewer_snap, unk_king_reviewer_snap)).

% @attr terrain_suitability_reviewer
% @type categorical
% @canonical false
% @original_name terrain_suitability (King Snowboard reviewer)
% @values freeride_bigmtn_park=Best_freeride_big_mountain_bit_of_park unk_terrain_suitability_reviewer=Unknown
% @importance 0.85

0.63::true_val(terrain_suitability_reviewer, freeride_bigmtn_park); 0.37::true_val(terrain_suitability_reviewer, unk_terrain_suitability_reviewer).
0.82::acc(s38, terrain_suitability_reviewer).
measured(s38, terrain_suitability_reviewer, freeride_bigmtn_park).
all_consistent(terrain_suitability_reviewer) :- consistent(s38, terrain_suitability_reviewer).
evidence(all_consistent(terrain_suitability_reviewer)).
query(true_val(terrain_suitability_reviewer, freeride_bigmtn_park)).
query(true_val(terrain_suitability_reviewer, unk_terrain_suitability_reviewer)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values forgiving_slower_speeds=Dinghy_more_forgiving_well_at_slower_speeds unk_user_review_forum=Unknown
% @importance 0.8

0.38::true_val(user_review_forum, forgiving_slower_speeds); 0.62::true_val(user_review_forum, unk_user_review_forum).
0.78::acc(s39, user_review_forum).
measured(s39, user_review_forum, forgiving_slower_speeds).
all_consistent(user_review_forum) :- consistent(s39, user_review_forum).
evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, forgiving_slower_speeds)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr user_review_forum_cruiser
% @type categorical
% @canonical false
% @original_name user_review_forum (high speed cruiser)
% @values high_speed_cruiser_pow=Comfortable_high_speed_cruiser_pow_machine unk_user_review_forum_cruiser=Unknown
% @importance 0.75

0.34::true_val(user_review_forum_cruiser, high_speed_cruiser_pow); 0.66::true_val(user_review_forum_cruiser, unk_user_review_forum_cruiser).
0.78::acc(s40, user_review_forum_cruiser).
measured(s40, user_review_forum_cruiser, high_speed_cruiser_pow).
all_consistent(user_review_forum_cruiser) :- consistent(s40, user_review_forum_cruiser).
evidence(all_consistent(user_review_forum_cruiser)).
query(true_val(user_review_forum_cruiser, high_speed_cruiser_pow)).
query(true_val(user_review_forum_cruiser, unk_user_review_forum_cruiser)).

% @attr user_review_forum_chop
% @type categorical
% @canonical false
% @original_name user_review_forum (chop dampness)
% @values damp_in_chop=Well_and_damp_in_chop unk_user_review_forum_chop=Unknown
% @importance 0.8

0.36::true_val(user_review_forum_chop, damp_in_chop); 0.64::true_val(user_review_forum_chop, unk_user_review_forum_chop).
0.78::acc(s41, user_review_forum_chop).
measured(s41, user_review_forum_chop, damp_in_chop).
all_consistent(user_review_forum_chop) :- consistent(s41, user_review_forum_chop).
evidence(all_consistent(user_review_forum_chop)).
query(true_val(user_review_forum_chop, damp_in_chop)).
query(true_val(user_review_forum_chop, unk_user_review_forum_chop)).

% @attr user_review_forum_speed_limit
% @type categorical
% @canonical false
% @original_name user_review_forum (speed limit)
% @values has_speed_limit=Has_speed_limit_goes_over_not_through unk_user_review_forum_speed_limit=Unknown
% @importance 0.8

0.36::true_val(user_review_forum_speed_limit, has_speed_limit); 0.64::true_val(user_review_forum_speed_limit, unk_user_review_forum_speed_limit).
0.78::acc(s41, user_review_forum_speed_limit).
measured(s41, user_review_forum_speed_limit, has_speed_limit).
all_consistent(user_review_forum_speed_limit) :- consistent(s41, user_review_forum_speed_limit).
evidence(all_consistent(user_review_forum_speed_limit)).
query(true_val(user_review_forum_speed_limit, has_speed_limit)).
query(true_val(user_review_forum_speed_limit, unk_user_review_forum_speed_limit)).

% @attr user_review_forum_daily
% @type categorical
% @canonical false
% @original_name user_review_forum (daily driver)
% @values daily_for_directional=Could_be_daily_for_directional_rider unk_user_review_forum_daily=Unknown
% @importance 0.75

0.34::true_val(user_review_forum_daily, daily_for_directional); 0.66::true_val(user_review_forum_daily, unk_user_review_forum_daily).
0.78::acc(s42, user_review_forum_daily).
measured(s42, user_review_forum_daily, daily_for_directional).
all_consistent(user_review_forum_daily) :- consistent(s42, user_review_forum_daily).
evidence(all_consistent(user_review_forum_daily)).
query(true_val(user_review_forum_daily, daily_for_directional)).
query(true_val(user_review_forum_daily, unk_user_review_forum_daily)).

% @attr user_review_forum_stable
% @type categorical
% @canonical false
% @original_name user_review_forum (stability)
% @values no_flappy_nose=No_flappy_nose_vibrations_cruised_like_caddy unk_user_review_forum_stable=Unknown
% @importance 0.75

0.34::true_val(user_review_forum_stable, no_flappy_nose); 0.66::true_val(user_review_forum_stable, unk_user_review_forum_stable).
0.78::acc(s42, user_review_forum_stable).
measured(s42, user_review_forum_stable, no_flappy_nose).
all_consistent(user_review_forum_stable) :- consistent(s42, user_review_forum_stable).
evidence(all_consistent(user_review_forum_stable)).
query(true_val(user_review_forum_stable, no_flappy_nose)).
query(true_val(user_review_forum_stable, unk_user_review_forum_stable)).

% @attr user_review_forum_sizing
% @type categorical
% @canonical false
% @original_name user_review_forum (size selection)
% @values v160_handled_155_sportier=160_handled_well_155_sportier_less_smooth unk_user_review_forum_sizing=Unknown
% @importance 0.7

0.34::true_val(user_review_forum_sizing, v160_handled_155_sportier); 0.66::true_val(user_review_forum_sizing, unk_user_review_forum_sizing).
0.78::acc(s43, user_review_forum_sizing).
measured(s43, user_review_forum_sizing, v160_handled_155_sportier).
all_consistent(user_review_forum_sizing) :- consistent(s43, user_review_forum_sizing).
evidence(all_consistent(user_review_forum_sizing)).
query(true_val(user_review_forum_sizing, v160_handled_155_sportier)).
query(true_val(user_review_forum_sizing, unk_user_review_forum_sizing)).

% @attr user_review_forum_flex_ride
% @type categorical
% @canonical false
% @original_name user_review_forum (flex and ride quality)
% @values mediumish_flex_damp=Mediumish_flex_dampness_traditional_freeride_camber unk_user_review_forum_flex_ride=Unknown
% @importance 0.85

0.41::true_val(user_review_forum_flex_ride, mediumish_flex_damp); 0.59::true_val(user_review_forum_flex_ride, unk_user_review_forum_flex_ride).
0.78::acc(s44, user_review_forum_flex_ride).
measured(s44, user_review_forum_flex_ride, mediumish_flex_damp).
all_consistent(user_review_forum_flex_ride) :- consistent(s44, user_review_forum_flex_ride).
evidence(all_consistent(user_review_forum_flex_ride)).
query(true_val(user_review_forum_flex_ride, mediumish_flex_damp)).
query(true_val(user_review_forum_flex_ride, unk_user_review_forum_flex_ride)).

% @attr user_review_forum_nimble
% @type categorical
% @canonical false
% @original_name user_review_forum (nimble vs Powgoda)
% @values nimbler_lighter_than_powgoda=160_Dinghy_nimbler_lighter_than_162_Powgoda unk_user_review_forum_nimble=Unknown
% @importance 0.85

0.41::true_val(user_review_forum_nimble, nimbler_lighter_than_powgoda); 0.59::true_val(user_review_forum_nimble, unk_user_review_forum_nimble).
0.78::acc(s44, user_review_forum_nimble).
measured(s44, user_review_forum_nimble, nimbler_lighter_than_powgoda).
all_consistent(user_review_forum_nimble) :- consistent(s44, user_review_forum_nimble).
evidence(all_consistent(user_review_forum_nimble)).
query(true_val(user_review_forum_nimble, nimbler_lighter_than_powgoda)).
query(true_val(user_review_forum_nimble, unk_user_review_forum_nimble)).

% @attr forum_comparison_trees
% @type categorical
% @canonical false
% @original_name Forum comparison — Dinghy excels in tight trees vs Powgoda
% @values excels_tight_trees=Dinghy_excels_tight_trees_vs_Powgoda unk_forum_comparison_trees=Unknown
% @importance 0.85

0.41::true_val(forum_comparison_trees, excels_tight_trees); 0.59::true_val(forum_comparison_trees, unk_forum_comparison_trees).
0.78::acc(s44, forum_comparison_trees).
measured(s44, forum_comparison_trees, excels_tight_trees).
all_consistent(forum_comparison_trees) :- consistent(s44, forum_comparison_trees).
evidence(all_consistent(forum_comparison_trees)).
query(true_val(forum_comparison_trees, excels_tight_trees)).
query(true_val(forum_comparison_trees, unk_forum_comparison_trees)).

% @attr forum_consideration_set
% @type categorical
% @canonical false
% @original_name Forum — considered alongside other powder boards
% @values with_hovercraft_me_excavator=Considered_with_Jones_Hovercraft_Mind_Expander_K2_Excavator unk_forum_consideration_set=Unknown
% @importance 0.75

0.32::true_val(forum_consideration_set, with_hovercraft_me_excavator); 0.68::true_val(forum_consideration_set, unk_forum_consideration_set).
0.75::acc(s45, forum_consideration_set).
measured(s45, forum_consideration_set, with_hovercraft_me_excavator).
all_consistent(forum_consideration_set) :- consistent(s45, forum_consideration_set).
evidence(all_consistent(forum_consideration_set)).
query(true_val(forum_consideration_set, with_hovercraft_me_excavator)).
query(true_val(forum_consideration_set, unk_forum_consideration_set)).

% @attr user_review_forum_resort_pow
% @type categorical
% @canonical false
% @original_name user_review_forum (resort powder recommendation)
% @values love_for_resort_pow=Recommended_for_resort_powder unk_user_review_forum_resort_pow=Unknown
% @importance 0.65

0.25::true_val(user_review_forum_resort_pow, love_for_resort_pow); 0.75::true_val(user_review_forum_resort_pow, unk_user_review_forum_resort_pow).
0.75::acc(s46, user_review_forum_resort_pow).
measured(s46, user_review_forum_resort_pow, love_for_resort_pow).
all_consistent(user_review_forum_resort_pow) :- consistent(s46, user_review_forum_resort_pow).
evidence(all_consistent(user_review_forum_resort_pow)).
query(true_val(user_review_forum_resort_pow, love_for_resort_pow)).
query(true_val(user_review_forum_resort_pow, unk_user_review_forum_resort_pow)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values centered_no_setback_feel=Centered_ride_no_setback_feel_unlike_peers unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.85

0.81::true_val(reviewer_opinion_the_good_ride, centered_no_setback_feel); 0.19::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).
0.88::acc(s47, reviewer_opinion_the_good_ride).
measured(s47, reviewer_opinion_the_good_ride, centered_no_setback_feel).
all_consistent(reviewer_opinion_the_good_ride) :- consistent(s47, reviewer_opinion_the_good_ride).
evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, centered_no_setback_feel)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr camber_description
% @type categorical
% @canonical false
% @original_name camber_description
% @values full_camber_minor_spoon=Full_camber_tip_to_tail_minor_spoon_nose unk_camber_description=Unknown
% @importance 0.95

0.81::true_val(camber_description, full_camber_minor_spoon); 0.19::true_val(camber_description, unk_camber_description).
0.88::acc(s20, camber_description).
measured(s20, camber_description, full_camber_minor_spoon).
all_consistent(camber_description) :- consistent(s20, camber_description).
evidence(all_consistent(camber_description)).
query(true_val(camber_description, full_camber_minor_spoon)).
query(true_val(camber_description, unk_camber_description)).

% @attr tgr_sizing_note
% @type categorical
% @canonical false
% @original_name The Good Ride — 160 felt very wide for size 9 boots
% @values wide_for_size9_rec_155=160_very_wide_for_size_9_recommend_155 unk_tgr_sizing_note=Unknown
% @importance 0.95

0.81::true_val(tgr_sizing_note, wide_for_size9_rec_155); 0.19::true_val(tgr_sizing_note, unk_tgr_sizing_note).
0.85::acc(s20, tgr_sizing_note).
measured(s20, tgr_sizing_note, wide_for_size9_rec_155).
all_consistent(tgr_sizing_note) :- consistent(s20, tgr_sizing_note).
evidence(all_consistent(tgr_sizing_note)).
query(true_val(tgr_sizing_note, wide_for_size9_rec_155)).
query(true_val(tgr_sizing_note, unk_tgr_sizing_note)).

% @attr skill_level_recommendation_qualitative
% @type categorical
% @canonical false
% @original_name skill_level_recommendation (rider profile)
% @values larger_foot_experienced_surfy=Larger_footprint_experienced_riders_surfy_ride unk_skill_level_recommendation_qualitative=Unknown
% @importance 0.9

0.67::true_val(skill_level_recommendation_qualitative, larger_foot_experienced_surfy); 0.33::true_val(skill_level_recommendation_qualitative, unk_skill_level_recommendation_qualitative).
0.80::acc(s4, skill_level_recommendation_qualitative).
0.93::acc(s_merchant, skill_level_recommendation_qualitative).
measured(s4, skill_level_recommendation_qualitative, larger_foot_experienced_surfy).
measured(s_merchant, skill_level_recommendation_qualitative, larger_foot_experienced_surfy).
all_consistent(skill_level_recommendation_qualitative) :-
    (indep(s4), consistent(s4, skill_level_recommendation_qualitative) ; \+indep(s4)),
    (indep(s_merchant), consistent(s_merchant, skill_level_recommendation_qualitative) ; \+indep(s_merchant)).
evidence(all_consistent(skill_level_recommendation_qualitative)).
query(true_val(skill_level_recommendation_qualitative, larger_foot_experienced_surfy)).
query(true_val(skill_level_recommendation_qualitative, unk_skill_level_recommendation_qualitative)).

% @attr comparable_gnu_gremlin
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Gnu Gremlin)
% @values gremlin_stiffer_less_torsion=Gnu_Gremlin_stiffer_especially_tail_less_torsional_flex unk_comparable_gnu_gremlin=Unknown
% @importance 0.8

0.38::true_val(comparable_gnu_gremlin, gremlin_stiffer_less_torsion); 0.62::true_val(comparable_gnu_gremlin, unk_comparable_gnu_gremlin).
0.78::acc(s39, comparable_gnu_gremlin).
measured(s39, comparable_gnu_gremlin, gremlin_stiffer_less_torsion).
all_consistent(comparable_gnu_gremlin) :- consistent(s39, comparable_gnu_gremlin).
evidence(all_consistent(comparable_gnu_gremlin)).
query(true_val(comparable_gnu_gremlin, gremlin_stiffer_less_torsion)).
query(true_val(comparable_gnu_gremlin, unk_comparable_gnu_gremlin)).

% @attr comparable_cardiff_powgoda
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Cardiff Powgoda)
% @values powgoda_similar_surfy_bigger_carves=Cardiff_Powgoda_similar_flex_more_surfy_tail_bigger_carves unk_comparable_cardiff_powgoda=Unknown
% @importance 0.85

0.41::true_val(comparable_cardiff_powgoda, powgoda_similar_surfy_bigger_carves); 0.59::true_val(comparable_cardiff_powgoda, unk_comparable_cardiff_powgoda).
0.78::acc(s44, comparable_cardiff_powgoda).
measured(s44, comparable_cardiff_powgoda, powgoda_similar_surfy_bigger_carves).
all_consistent(comparable_cardiff_powgoda) :- consistent(s44, comparable_cardiff_powgoda).
evidence(all_consistent(comparable_cardiff_powgoda)).
query(true_val(comparable_cardiff_powgoda, powgoda_similar_surfy_bigger_carves)).
query(true_val(comparable_cardiff_powgoda, unk_comparable_cardiff_powgoda)).

% @attr comparable_jones_mind_expander
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Jones Mind Expander)
% @values mind_expander_popular_alt=Jones_Mind_Expander_popular_short_wide_powder_alt unk_comparable_jones_mind_expander=Unknown
% @importance 0.75

0.32::true_val(comparable_jones_mind_expander, mind_expander_popular_alt); 0.68::true_val(comparable_jones_mind_expander, unk_comparable_jones_mind_expander).
0.75::acc(s45, comparable_jones_mind_expander).
measured(s45, comparable_jones_mind_expander, mind_expander_popular_alt).
all_consistent(comparable_jones_mind_expander) :- consistent(s45, comparable_jones_mind_expander).
evidence(all_consistent(comparable_jones_mind_expander)).
query(true_val(comparable_jones_mind_expander, mind_expander_popular_alt)).
query(true_val(comparable_jones_mind_expander, unk_comparable_jones_mind_expander)).

% @attr comparable_jones_hovercraft
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Jones Hovercraft 2.0)
% @values hovercraft_more_aggressive=Jones_Hovercraft_more_aggressive_better_fast_straight unk_comparable_jones_hovercraft=Unknown
% @importance 0.85

0.81::true_val(comparable_jones_hovercraft, hovercraft_more_aggressive); 0.19::true_val(comparable_jones_hovercraft, unk_comparable_jones_hovercraft).
0.88::acc(s37, comparable_jones_hovercraft).
measured(s37, comparable_jones_hovercraft, hovercraft_more_aggressive).
all_consistent(comparable_jones_hovercraft) :- consistent(s37, comparable_jones_hovercraft).
evidence(all_consistent(comparable_jones_hovercraft)).
query(true_val(comparable_jones_hovercraft, hovercraft_more_aggressive)).
query(true_val(comparable_jones_hovercraft, unk_comparable_jones_hovercraft)).

% @attr comparable_korua_tf
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Korua Transition Finder)
% @values korua_tf_similar_alt_freeride=Korua_Transition_Finder_similar_alt_freeride unk_comparable_korua_tf=Unknown
% @importance 0.85

0.81::true_val(comparable_korua_tf, korua_tf_similar_alt_freeride); 0.19::true_val(comparable_korua_tf, unk_comparable_korua_tf).
0.88::acc(s37, comparable_korua_tf).
measured(s37, comparable_korua_tf, korua_tf_similar_alt_freeride).
all_consistent(comparable_korua_tf) :- consistent(s37, comparable_korua_tf).
evidence(all_consistent(comparable_korua_tf)).
query(true_val(comparable_korua_tf, korua_tf_similar_alt_freeride)).
query(true_val(comparable_korua_tf, unk_comparable_korua_tf)).

% @attr comparable_rome_stale_fish
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Rome Stale Fish)
% @values rome_stale_fish_similar=Rome_Stale_Fish_similar_tapered_directional unk_comparable_rome_stale_fish=Unknown
% @importance 0.85

0.81::true_val(comparable_rome_stale_fish, rome_stale_fish_similar); 0.19::true_val(comparable_rome_stale_fish, unk_comparable_rome_stale_fish).
0.88::acc(s37, comparable_rome_stale_fish).
measured(s37, comparable_rome_stale_fish, rome_stale_fish_similar).
all_consistent(comparable_rome_stale_fish) :- consistent(s37, comparable_rome_stale_fish).
evidence(all_consistent(comparable_rome_stale_fish)).
query(true_val(comparable_rome_stale_fish, rome_stale_fish_similar)).
query(true_val(comparable_rome_stale_fish, unk_comparable_rome_stale_fish)).

% @attr comparable_yes_pyl_uninc
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Yes PYL Uninc)
% @values yes_pyl_similar_alt_freeride=Yes_PYL_Uninc_similar_alt_freeride unk_comparable_yes_pyl_uninc=Unknown
% @importance 0.85

0.81::true_val(comparable_yes_pyl_uninc, yes_pyl_similar_alt_freeride); 0.19::true_val(comparable_yes_pyl_uninc, unk_comparable_yes_pyl_uninc).
0.88::acc(s37, comparable_yes_pyl_uninc).
measured(s37, comparable_yes_pyl_uninc, yes_pyl_similar_alt_freeride).
all_consistent(comparable_yes_pyl_uninc) :- consistent(s37, comparable_yes_pyl_uninc).
evidence(all_consistent(comparable_yes_pyl_uninc)).
query(true_val(comparable_yes_pyl_uninc, yes_pyl_similar_alt_freeride)).
query(true_val(comparable_yes_pyl_uninc, unk_comparable_yes_pyl_uninc)).

% @attr comparable_gentemstick_mantaray
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Gentemstick Mantaray)
% @values gentemstick_premium_jp=Gentemstick_Mantaray_premium_Japanese_alt unk_comparable_gentemstick_mantaray=Unknown
% @importance 0.85

0.81::true_val(comparable_gentemstick_mantaray, gentemstick_premium_jp); 0.19::true_val(comparable_gentemstick_mantaray, unk_comparable_gentemstick_mantaray).
0.88::acc(s37, comparable_gentemstick_mantaray).
measured(s37, comparable_gentemstick_mantaray, gentemstick_premium_jp).
all_consistent(comparable_gentemstick_mantaray) :- consistent(s37, comparable_gentemstick_mantaray).
evidence(all_consistent(comparable_gentemstick_mantaray)).
query(true_val(comparable_gentemstick_mantaray, gentemstick_premium_jp)).
query(true_val(comparable_gentemstick_mantaray, unk_comparable_gentemstick_mantaray)).

% @attr retailer_info_evo
% @type categorical
% @canonical false
% @original_name evo — Major US online retailer
% @values major_us_free_ship_price_match=Major_US_retailer_free_shipping_price_match_1yr_return unk_retailer_info_evo=Unknown
% @importance 0.8

0.76::true_val(retailer_info_evo, major_us_free_ship_price_match); 0.24::true_val(retailer_info_evo, unk_retailer_info_evo).
0.85::acc(s23, retailer_info_evo).
measured(s23, retailer_info_evo, major_us_free_ship_price_match).
all_consistent(retailer_info_evo) :- consistent(s23, retailer_info_evo).
evidence(all_consistent(retailer_info_evo)).
query(true_val(retailer_info_evo, major_us_free_ship_price_match)).
query(true_val(retailer_info_evo, unk_retailer_info_evo)).

% @attr retailer_info_blauer
% @type categorical
% @canonical false
% @original_name Blauer Board Shop — Recommended by The Good Ride
% @values tgr_recommended_10_15pct_off=TGR_recommended_10_15pct_new_customer_savings unk_retailer_info_blauer=Unknown
% @importance 0.95

0.81::true_val(retailer_info_blauer, tgr_recommended_10_15pct_off); 0.19::true_val(retailer_info_blauer, unk_retailer_info_blauer).
0.85::acc(s20, retailer_info_blauer).
measured(s20, retailer_info_blauer, tgr_recommended_10_15pct_off).
all_consistent(retailer_info_blauer) :- consistent(s20, retailer_info_blauer).
evidence(all_consistent(retailer_info_blauer)).
query(true_val(retailer_info_blauer, tgr_recommended_10_15pct_off)).
query(true_val(retailer_info_blauer, unk_retailer_info_blauer)).

% @attr retailer_info_christy
% @type categorical
% @canonical false
% @original_name Christy Sports — Major US retailer
% @values major_us_rentals_clearance=Major_US_retailer_rentals_clearance unk_retailer_info_christy=Unknown
% @importance 0.95

0.81::true_val(retailer_info_christy, major_us_rentals_clearance); 0.19::true_val(retailer_info_christy, unk_retailer_info_christy).
0.85::acc(s20, retailer_info_christy).
measured(s20, retailer_info_christy, major_us_rentals_clearance).
all_consistent(retailer_info_christy) :- consistent(s20, retailer_info_christy).
evidence(all_consistent(retailer_info_christy)).
query(true_val(retailer_info_christy, major_us_rentals_clearance)).
query(true_val(retailer_info_christy, unk_retailer_info_christy)).

% @attr retailer_info_blue_tomato
% @type categorical
% @canonical false
% @original_name Blue Tomato — Major European multi-country retailer
% @values major_eu_multi_country=Major_European_multi_country_retailer unk_retailer_info_blue_tomato=Unknown
% @importance 0.95

0.81::true_val(retailer_info_blue_tomato, major_eu_multi_country); 0.19::true_val(retailer_info_blue_tomato, unk_retailer_info_blue_tomato).
0.85::acc(s20, retailer_info_blue_tomato).
measured(s20, retailer_info_blue_tomato, major_eu_multi_country).
all_consistent(retailer_info_blue_tomato) :- consistent(s20, retailer_info_blue_tomato).
evidence(all_consistent(retailer_info_blue_tomato)).
query(true_val(retailer_info_blue_tomato, major_eu_multi_country)).
query(true_val(retailer_info_blue_tomato, unk_retailer_info_blue_tomato)).

% @attr retailer_info_snowcountry
% @type categorical
% @canonical false
% @original_name SnowCountry — European retailer lower EUR pricing
% @values eu_retailer_lower_eur=European_retailer_lower_EUR_499 unk_retailer_info_snowcountry=Unknown
% @importance 0.95

0.81::true_val(retailer_info_snowcountry, eu_retailer_lower_eur); 0.19::true_val(retailer_info_snowcountry, unk_retailer_info_snowcountry).
0.85::acc(s20, retailer_info_snowcountry).
measured(s20, retailer_info_snowcountry, eu_retailer_lower_eur).
all_consistent(retailer_info_snowcountry) :- consistent(s20, retailer_info_snowcountry).
evidence(all_consistent(retailer_info_snowcountry)).
query(true_val(retailer_info_snowcountry, eu_retailer_lower_eur)).
query(true_val(retailer_info_snowcountry, unk_retailer_info_snowcountry)).

% @attr retailer_info_prfo
% @type categorical
% @canonical false
% @original_name PRFO Sports — Canadian retailer
% @values canadian_retailer=Canadian_retailer unk_retailer_info_prfo=Unknown
% @importance 0.95

0.81::true_val(retailer_info_prfo, canadian_retailer); 0.19::true_val(retailer_info_prfo, unk_retailer_info_prfo).
0.85::acc(s20, retailer_info_prfo).
measured(s20, retailer_info_prfo, canadian_retailer).
all_consistent(retailer_info_prfo) :- consistent(s20, retailer_info_prfo).
evidence(all_consistent(retailer_info_prfo)).
query(true_val(retailer_info_prfo, canadian_retailer)).
query(true_val(retailer_info_prfo, unk_retailer_info_prfo)).

% @attr retailer_info_tactics
% @type categorical
% @canonical false
% @original_name Tactics — US retailer with 10% rewards
% @values us_retailer_10pct_rewards=US_retailer_10pct_rewards_full_price unk_retailer_info_tactics=Unknown
% @importance 0.75

0.76::true_val(retailer_info_tactics, us_retailer_10pct_rewards); 0.24::true_val(retailer_info_tactics, unk_retailer_info_tactics).
0.85::acc(s36, retailer_info_tactics).
measured(s36, retailer_info_tactics, us_retailer_10pct_rewards).
all_consistent(retailer_info_tactics) :- consistent(s36, retailer_info_tactics).
evidence(all_consistent(retailer_info_tactics)).
query(true_val(retailer_info_tactics, us_retailer_10pct_rewards)).
query(true_val(retailer_info_tactics, unk_retailer_info_tactics)).

% @attr retailer_info_ssw
% @type categorical
% @canonical false
% @original_name Snow Skiers Warehouse (Australia)
% @values au_premium_free_express=Premium_AU_store_free_express_over_99 unk_retailer_info_ssw=Unknown
% @importance 0.85

0.67::true_val(retailer_info_ssw, au_premium_free_express); 0.33::true_val(retailer_info_ssw, unk_retailer_info_ssw).
0.82::acc(s19, retailer_info_ssw).
measured(s19, retailer_info_ssw, au_premium_free_express).
all_consistent(retailer_info_ssw) :- consistent(s19, retailer_info_ssw).
evidence(all_consistent(retailer_info_ssw)).
query(true_val(retailer_info_ssw, au_premium_free_express)).
query(true_val(retailer_info_ssw, unk_retailer_info_ssw)).

% @attr retailer_info_nitro_au
% @type categorical
% @canonical false
% @original_name Nitro Australia — Official distribution
% @values dingley_village_victoria=Official_distribution_Dingley_Village_Victoria unk_retailer_info_nitro_au=Unknown
% @importance 0.4

0.86::true_val(retailer_info_nitro_au, dingley_village_victoria); 0.14::true_val(retailer_info_nitro_au, unk_retailer_info_nitro_au).
0.92::acc(s48, retailer_info_nitro_au).
measured(s48, retailer_info_nitro_au, dingley_village_victoria).
all_consistent(retailer_info_nitro_au) :- consistent(s48, retailer_info_nitro_au).
evidence(all_consistent(retailer_info_nitro_au)).
query(true_val(retailer_info_nitro_au, dingley_village_victoria)).
query(true_val(retailer_info_nitro_au, unk_retailer_info_nitro_au)).

% @attr retailer_info_source
% @type categorical
% @canonical false
% @original_name The Source Snowboard & Skate
% @values day30_return_exchange=30_day_return_exchange_unworn unk_retailer_info_source=Unknown
% @importance 0.4

0.52::true_val(retailer_info_source, day30_return_exchange); 0.48::true_val(retailer_info_source, unk_retailer_info_source).
0.78::acc(s29, retailer_info_source).
measured(s29, retailer_info_source, day30_return_exchange).
all_consistent(retailer_info_source) :- consistent(s29, retailer_info_source).
evidence(all_consistent(retailer_info_source)).
query(true_val(retailer_info_source, day30_return_exchange)).
query(true_val(retailer_info_source, unk_retailer_info_source)).

% @attr retailer_info_freeride
% @type categorical
% @canonical false
% @original_name Freeride Boardshop — Canadian retailer
% @values canadian_retailer_freeride=Canadian_retailer unk_retailer_info_freeride=Unknown
% @importance 0.85

0.59::true_val(retailer_info_freeride, canadian_retailer_freeride); 0.41::true_val(retailer_info_freeride, unk_retailer_info_freeride).
0.80::acc(s21, retailer_info_freeride).
measured(s21, retailer_info_freeride, canadian_retailer_freeride).
all_consistent(retailer_info_freeride) :- consistent(s21, retailer_info_freeride).
evidence(all_consistent(retailer_info_freeride)).
query(true_val(retailer_info_freeride, canadian_retailer_freeride)).
query(true_val(retailer_info_freeride, unk_retailer_info_freeride)).

% @attr volume_shifted_design
% @type categorical
% @canonical false
% @original_name Volume-shifted design
% @values shorter_wider_big_board_energy=Shorter_wider_board_big_board_energy_compact_maneuverable unk_volume_shifted_design=Unknown
% @importance 0.8

0.71::true_val(volume_shifted_design, shorter_wider_big_board_energy); 0.29::true_val(volume_shifted_design, unk_volume_shifted_design).
0.85::acc(s14, volume_shifted_design).
measured(s14, volume_shifted_design, shorter_wider_big_board_energy).
all_consistent(volume_shifted_design) :-
    (indep(s14), consistent(s14, volume_shifted_design) ; \+indep(s14)).
evidence(all_consistent(volume_shifted_design)).
query(true_val(volume_shifted_design, shorter_wider_big_board_energy)).
query(true_val(volume_shifted_design, unk_volume_shifted_design)).

% @attr wider_shape_benefit
% @type categorical
% @canonical false
% @original_name Wider shape benefit
% @values float_less_drag=Additional_floatation_less_drag_not_bathroom_door unk_wider_shape_benefit=Unknown
% @importance 1.0

0.92::true_val(wider_shape_benefit, float_less_drag); 0.08::true_val(wider_shape_benefit, unk_wider_shape_benefit).
0.90::acc(s2, wider_shape_benefit).
measured(s2, wider_shape_benefit, float_less_drag).
all_consistent(wider_shape_benefit) :- consistent(s2, wider_shape_benefit).
evidence(all_consistent(wider_shape_benefit)).
query(true_val(wider_shape_benefit, float_less_drag)).
query(true_val(wider_shape_benefit, unk_wider_shape_benefit)).

% @attr progressive_sidecut_benefit
% @type categorical
% @canonical false
% @original_name Progressive sidecut benefit
% @values accel_out_turns_catch_free=Accelerating_out_of_turns_easy_catch_free_nose unk_progressive_sidecut_benefit=Unknown
% @importance 1.0

0.92::true_val(progressive_sidecut_benefit, accel_out_turns_catch_free); 0.08::true_val(progressive_sidecut_benefit, unk_progressive_sidecut_benefit).
0.90::acc(s2, progressive_sidecut_benefit).
measured(s2, progressive_sidecut_benefit, accel_out_turns_catch_free).
all_consistent(progressive_sidecut_benefit) :- consistent(s2, progressive_sidecut_benefit).
evidence(all_consistent(progressive_sidecut_benefit)).
query(true_val(progressive_sidecut_benefit, accel_out_turns_catch_free)).
query(true_val(progressive_sidecut_benefit, unk_progressive_sidecut_benefit)).

% @attr reflex_core_benefit
% @type categorical
% @canonical false
% @original_name Reflex Core Profile benefit
% @values thinner_better_handling_torsion=Thinner_core_between_feet_better_handling_torsional_flex unk_reflex_core_benefit=Unknown
% @importance 1.0

0.92::true_val(reflex_core_benefit, thinner_better_handling_torsion); 0.08::true_val(reflex_core_benefit, unk_reflex_core_benefit).
0.90::acc(s2, reflex_core_benefit).
measured(s2, reflex_core_benefit, thinner_better_handling_torsion).
all_consistent(reflex_core_benefit) :- consistent(s2, reflex_core_benefit).
evidence(all_consistent(reflex_core_benefit)).
query(true_val(reflex_core_benefit, thinner_better_handling_torsion)).
query(true_val(reflex_core_benefit, unk_reflex_core_benefit)).

% @attr surf_tech_benefit
% @type categorical
% @canonical false
% @original_name 3D Surf Tech benefit
% @values convex_nose_float_concave_tail_control=Convex_nose_floatation_concave_tail_control_carve unk_surf_tech_benefit=Unknown
% @importance 0.65

0.72::true_val(surf_tech_benefit, convex_nose_float_concave_tail_control); 0.28::true_val(surf_tech_benefit, unk_surf_tech_benefit).
0.85::acc(s49, surf_tech_benefit).
measured(s49, surf_tech_benefit, convex_nose_float_concave_tail_control).
all_consistent(surf_tech_benefit) :-
    (indep(s49), consistent(s49, surf_tech_benefit) ; \+indep(s49)).
evidence(all_consistent(surf_tech_benefit)).
query(true_val(surf_tech_benefit, convex_nose_float_concave_tail_control)).
query(true_val(surf_tech_benefit, unk_surf_tech_benefit)).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values directional_all_terrain=Directional_All_Terrain_pattern unk_flex_direction=Unknown
% @importance 1.0

0.92::true_val(flex_direction, directional_all_terrain); 0.08::true_val(flex_direction, unk_flex_direction).
0.93::acc(s2, flex_direction).
measured(s2, flex_direction, directional_all_terrain).
all_consistent(flex_direction) :- consistent(s2, flex_direction).
evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional_all_terrain)).
query(true_val(flex_direction, unk_flex_direction)).