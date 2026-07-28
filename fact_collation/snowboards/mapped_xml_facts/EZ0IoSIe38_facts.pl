0.15::indep(sm).
0.20::indep(s3).
0.12::indep(s13).
0.20::indep(s18).
0.20::indep(s23).
0.20::indep(s24).
0.15::indep(s26).
0.20::indep(s27).
0.15::indep(s28).
0.20::indep(s25).
0.20::indep(s33).
0.20::indep(s35).
0.20::indep(s39).
0.20::indep(s41).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values bataleon=Bataleon unk_brand=Unknown
% @importance 1.0

0.95::acc(s14, brand).
0.85::acc(sm, brand).

0.95::true_val(brand, bataleon); 0.05::true_val(brand, unk_brand).

measured(s14, brand, bataleon).
measured(sm, brand, bataleon).

all_consistent(brand) :-
    consistent(s14, brand),
    (indep(sm), consistent(sm, brand) ; \+indep(sm)).

evidence(all_consistent(brand)).
query(true_val(brand, bataleon)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values the_surfer=The_Surfer unk_model_name=Unknown
% @importance 1.0

0.95::acc(s14, model_name).
0.85::acc(sm, model_name).

0.95::true_val(model_name, the_surfer); 0.05::true_val(model_name, unk_model_name).

measured(s14, model_name, the_surfer).
measured(sm, model_name, the_surfer).

all_consistent(model_name) :-
    consistent(s14, model_name),
    (indep(sm), consistent(sm, model_name) ; \+indep(sm)).

evidence(all_consistent(model_name)).
query(true_val(model_name, the_surfer)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values v2027=2027 v2025_2026=2025/2026
% @importance 0.85

0.90::acc(sm, model_year).
0.88::acc(s14, model_year).

0.55::true_val(model_year, v2027); 0.45::true_val(model_year, v2025_2026).

measured(sm, model_year, v2027).
measured(s14, model_year, v2025_2026).

all_consistent(model_year) :-
    consistent(sm, model_year),
    consistent(s14, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, v2027)).
query(true_val(model_year, v2025_2026)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.97::acc(s14, product_type).

0.95::true_val(product_type, snowboard); 0.05::true_val(product_type, unk_product_type).

measured(s14, product_type, snowboard).

all_consistent(product_type) :-
    consistent(s14, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values powder_freeride=Powder_Freeride unk_board_category=Unknown
% @importance 0.85

0.93::acc(s2, board_category).
0.80::acc(s3, board_category).

0.95::true_val(board_category, powder_freeride); 0.05::true_val(board_category, unk_board_category).

measured(s2, board_category, powder_freeride).
measured(s3, board_category, powder_freeride).

all_consistent(board_category) :-
    consistent(s2, board_category),
    (indep(s3), consistent(s3, board_category) ; \+indep(s3)).

evidence(all_consistent(board_category)).
query(true_val(board_category, powder_freeride)).
query(true_val(board_category, unk_board_category)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 1.0

0.97::acc(s14, gender).

0.95::true_val(gender, mens); 0.05::true_val(gender, unk_gender).

measured(s14, gender, mens).

all_consistent(gender) :-
    consistent(s14, gender).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values low_pressure_studio_nidecker=Low_Pressure_Studio_Nidecker_Group unk_manufacturer=Unknown
% @importance 0.55

0.90::acc(s4, manufacturer).
0.88::acc(s5, manufacturer).

0.95::true_val(manufacturer, low_pressure_studio_nidecker); 0.05::true_val(manufacturer, unk_manufacturer).

measured(s4, manufacturer, low_pressure_studio_nidecker).
measured(s5, manufacturer, low_pressure_studio_nidecker).

all_consistent(manufacturer) :-
    consistent(s4, manufacturer),
    consistent(s5, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, low_pressure_studio_nidecker)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr brand_founded
% @type categorical
% @canonical false
% @original_name Brand founded
% @values y2000_netherlands=2000_by_Jorgen_Karlsen_Netherlands y2001=2001 unk_brand_founded=Unknown
% @importance 0.375

0.82::acc(s6, brand_founded).
0.70::acc(s7, brand_founded).

0.55::true_val(brand_founded, y2000_netherlands); 0.40::true_val(brand_founded, y2001); 0.05::true_val(brand_founded, unk_brand_founded).

measured(s6, brand_founded, y2000_netherlands).
measured(s7, brand_founded, y2001).

all_consistent(brand_founded) :-
    consistent(s6, brand_founded),
    consistent(s7, brand_founded).

evidence(all_consistent(brand_founded)).
query(true_val(brand_founded, y2000_netherlands)).
query(true_val(brand_founded, y2001)).
query(true_val(brand_founded, unk_brand_founded)).

% @attr three_bt_patent_year
% @type categorical
% @canonical false
% @original_name 3BT patent year
% @values y1998=1998 unk_three_bt_patent_year=Unknown
% @importance 0.3

0.75::acc(s8, three_bt_patent_year).

0.85::true_val(three_bt_patent_year, y1998); 0.15::true_val(three_bt_patent_year, unk_three_bt_patent_year).

measured(s8, three_bt_patent_year, y1998).

all_consistent(three_bt_patent_year) :-
    consistent(s8, three_bt_patent_year).

evidence(all_consistent(three_bt_patent_year)).
query(true_val(three_bt_patent_year, y1998)).
query(true_val(three_bt_patent_year, unk_three_bt_patent_year)).

% @attr brand_headquarters
% @type categorical
% @canonical false
% @original_name Brand headquarters
% @values amsterdam=Amsterdam_Netherlands unk_brand_headquarters=Unknown
% @importance 0.35

0.92::acc(s9, brand_headquarters).

0.90::true_val(brand_headquarters, amsterdam); 0.10::true_val(brand_headquarters, unk_brand_headquarters).

measured(s9, brand_headquarters, amsterdam).

all_consistent(brand_headquarters) :-
    consistent(s9, brand_headquarters).

evidence(all_consistent(brand_headquarters)).
query(true_val(brand_headquarters, amsterdam)).
query(true_val(brand_headquarters, unk_brand_headquarters)).

% @attr manufacturing_location_current
% @type categorical
% @canonical false
% @original_name manufacturing_location_current
% @values austria_mothership=Austria_CAPiTA_Mothership unk_manufacturing_location_current=Unknown
% @importance 0.55

0.85::acc(s10, manufacturing_location_current).
0.75::acc(s11, manufacturing_location_current).

0.93::true_val(manufacturing_location_current, austria_mothership); 0.07::true_val(manufacturing_location_current, unk_manufacturing_location_current).

measured(s10, manufacturing_location_current, austria_mothership).
measured(s11, manufacturing_location_current, austria_mothership).

all_consistent(manufacturing_location_current) :-
    consistent(s10, manufacturing_location_current),
    consistent(s11, manufacturing_location_current).

evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, austria_mothership)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

% @attr manufacturing_location_prior
% @type categorical
% @canonical false
% @original_name manufacturing_location_prior
% @values austria_mothership=Austria_Mothership sws_dubai_asia=SWS_Dubai_or_Asia unk_manufacturing_location_prior=Unknown
% @importance 0.55

0.85::acc(s10, manufacturing_location_prior).
0.75::acc(s11, manufacturing_location_prior).
0.60::acc(s12, manufacturing_location_prior).
0.65::acc(s13, manufacturing_location_prior).

0.60::true_val(manufacturing_location_prior, austria_mothership); 0.35::true_val(manufacturing_location_prior, sws_dubai_asia); 0.05::true_val(manufacturing_location_prior, unk_manufacturing_location_prior).

measured(s10, manufacturing_location_prior, austria_mothership).
measured(s11, manufacturing_location_prior, austria_mothership).
measured(s12, manufacturing_location_prior, sws_dubai_asia).
measured(s13, manufacturing_location_prior, austria_mothership).

all_consistent(manufacturing_location_prior) :-
    consistent(s10, manufacturing_location_prior),
    consistent(s11, manufacturing_location_prior),
    consistent(s12, manufacturing_location_prior),
    (indep(s13), consistent(s13, manufacturing_location_prior) ; \+indep(s13)).

evidence(all_consistent(manufacturing_location_prior)).
query(true_val(manufacturing_location_prior, austria_mothership)).
query(true_val(manufacturing_location_prior, sws_dubai_asia)).
query(true_val(manufacturing_location_prior, unk_manufacturing_location_prior)).

% @attr warranty
% @type categorical
% @canonical false
% @original_name warranty
% @values two_plus_one_year=2_plus_1_year_warranty unk_warranty=Unknown
% @importance 1.0

0.95::acc(s14, warranty).

0.95::true_val(warranty, two_plus_one_year); 0.05::true_val(warranty, unk_warranty).

measured(s14, warranty, two_plus_one_year).

all_consistent(warranty) :-
    consistent(s14, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, two_plus_one_year)).
query(true_val(warranty, unk_warranty)).

% @attr model_first_available_year
% @type categorical
% @canonical false
% @original_name model_first_available_year
% @values y2017_2018=Approx_2017_2018 unk_model_first_available_year=Unknown
% @importance 0.475

0.75::acc(s15, model_first_available_year).
0.70::acc(s16, model_first_available_year).

0.88::true_val(model_first_available_year, y2017_2018); 0.12::true_val(model_first_available_year, unk_model_first_available_year).

measured(s15, model_first_available_year, y2017_2018).
measured(s16, model_first_available_year, y2017_2018).

all_consistent(model_first_available_year) :-
    consistent(s15, model_first_available_year),
    consistent(s16, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2017_2018)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr redesign_year
% @type categorical
% @canonical false
% @original_name redesign_year
% @values y2024_2025=2024_2025_season unk_redesign_year=Unknown
% @importance 0.575

0.72::acc(s17, redesign_year).
0.78::acc(s18, redesign_year).

0.90::true_val(redesign_year, y2024_2025); 0.10::true_val(redesign_year, unk_redesign_year).

measured(s17, redesign_year, y2024_2025).
measured(s18, redesign_year, y2024_2025).

all_consistent(redesign_year) :-
    consistent(s17, redesign_year),
    (indep(s18), consistent(s18, redesign_year) ; \+indep(s18)).

evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, y2024_2025)).
query(true_val(redesign_year, unk_redesign_year)).

% @attr predecessor_model_name
% @type categorical
% @canonical false
% @original_name predecessor_model_name
% @values surfer_ltd=Surfer_LTD_limited_125_150_units unk_predecessor_model_name=Unknown
% @importance 0.475

0.80::acc(s19, predecessor_model_name).
0.82::acc(s20, predecessor_model_name).

0.92::true_val(predecessor_model_name, surfer_ltd); 0.08::true_val(predecessor_model_name, unk_predecessor_model_name).

measured(s19, predecessor_model_name, surfer_ltd).
measured(s20, predecessor_model_name, surfer_ltd).

all_consistent(predecessor_model_name) :-
    consistent(s19, predecessor_model_name),
    consistent(s20, predecessor_model_name).

evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, surfer_ltd)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).

% @attr current_model_ltd_status
% @type categorical
% @canonical false
% @original_name Current model has no LTD variant listed
% @values no_ltd_features_integrated=No_LTD_variant_features_now_standard unk_current_model_ltd_status=Unknown
% @importance 0.9

0.93::acc(s14, current_model_ltd_status).
0.90::acc(s21, current_model_ltd_status).

0.93::true_val(current_model_ltd_status, no_ltd_features_integrated); 0.07::true_val(current_model_ltd_status, unk_current_model_ltd_status).

measured(s14, current_model_ltd_status, no_ltd_features_integrated).
measured(s21, current_model_ltd_status, no_ltd_features_integrated).

all_consistent(current_model_ltd_status) :-
    consistent(s14, current_model_ltd_status),
    consistent(s21, current_model_ltd_status).

evidence(all_consistent(current_model_ltd_status)).
query(true_val(current_model_ltd_status, no_ltd_features_integrated)).
query(true_val(current_model_ltd_status, unk_current_model_ltd_status)).

% @attr price_aud_merchant
% @type numeric
% @canonical false
% @original_name price_aud_merchant
% @unit AUD
% @values v1899_99=1899.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.95::acc(sm, price_aud_merchant).

0.95::true_val(price_aud_merchant, v1899_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(sm, price_aud_merchant, v1899_99).

all_consistent(price_aud_merchant) :-
    consistent(sm, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v1899_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v769_95=769.95 unk_price_usd_msrp=Unknown
% @importance 1.0

0.95::acc(s14, price_usd_msrp).

0.95::true_val(price_usd_msrp, v769_95); 0.05::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s14, price_usd_msrp, v769_95).

all_consistent(price_usd_msrp) :-
    consistent(s14, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v769_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_usd_msrp_full
% @type numeric
% @canonical false
% @original_name price_usd_msrp (full MSRP)
% @unit USD
% @values v1099_95=1099.95 unk_price_usd_msrp_full=Unknown
% @importance 1.0

0.95::acc(s14, price_usd_msrp_full).

0.95::true_val(price_usd_msrp_full, v1099_95); 0.05::true_val(price_usd_msrp_full, unk_price_usd_msrp_full).

measured(s14, price_usd_msrp_full, v1099_95).

all_consistent(price_usd_msrp_full) :-
    consistent(s14, price_usd_msrp_full).

evidence(all_consistent(price_usd_msrp_full)).
query(true_val(price_usd_msrp_full, v1099_95)).
query(true_val(price_usd_msrp_full, unk_price_usd_msrp_full)).

% @attr price_usd_darkside
% @type numeric
% @canonical false
% @original_name Price (USD, Darkside Snowboards, 2026 model)
% @unit USD
% @values v471_96=471.96 unk_price_usd_darkside=Unknown
% @importance 0.9

0.85::acc(s22, price_usd_darkside).

0.88::true_val(price_usd_darkside, v471_96); 0.12::true_val(price_usd_darkside, unk_price_usd_darkside).

measured(s22, price_usd_darkside, v471_96).

all_consistent(price_usd_darkside) :-
    consistent(s22, price_usd_darkside).

evidence(all_consistent(price_usd_darkside)).
query(true_val(price_usd_darkside, v471_96)).
query(true_val(price_usd_darkside, unk_price_usd_darkside)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values sold_out_all_sizes=All_sizes_sold_out_official_US unk_availability_status=Unknown
% @importance 1.0

0.93::acc(s14, availability_status).

0.92::true_val(availability_status, sold_out_all_sizes); 0.08::true_val(availability_status, unk_availability_status).

measured(s14, availability_status, sold_out_all_sizes).

all_consistent(availability_status) :-
    consistent(s14, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, sold_out_all_sizes)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status (evo)
% @values in_stock_2026=In_stock_2026 unk_availability_status_evo=Unknown
% @importance 0.85

0.85::acc(s23, availability_status_evo).

0.88::true_val(availability_status_evo, in_stock_2026); 0.12::true_val(availability_status_evo, unk_availability_status_evo).

measured(s23, availability_status_evo, in_stock_2026).

all_consistent(availability_status_evo) :-
    consistent(s23, availability_status_evo).

evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, in_stock_2026)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

% @attr availability_status_backcountry
% @type categorical
% @canonical false
% @original_name availability_status (backcountry)
% @values listed_2026=2026_model_listed unk_availability_status_backcountry=Unknown
% @importance 0.7

0.80::acc(s24, availability_status_backcountry).

0.85::true_val(availability_status_backcountry, listed_2026); 0.15::true_val(availability_status_backcountry, unk_availability_status_backcountry).

measured(s24, availability_status_backcountry, listed_2026).

all_consistent(availability_status_backcountry) :-
    consistent(s24, availability_status_backcountry).

evidence(all_consistent(availability_status_backcountry)).
query(true_val(availability_status_backcountry, listed_2026)).
query(true_val(availability_status_backcountry, unk_availability_status_backcountry)).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status (blauer)
% @values page_exists_2027=2027_model_page_behind_login unk_availability_status_blauer=Unknown
% @importance 0.7

0.70::acc(s25, availability_status_blauer).

0.80::true_val(availability_status_blauer, page_exists_2027); 0.20::true_val(availability_status_blauer, unk_availability_status_blauer).

measured(s25, availability_status_blauer, page_exists_2027).

all_consistent(availability_status_blauer) :-
    consistent(s25, availability_status_blauer).

evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, page_exists_2027)).
query(true_val(availability_status_blauer, unk_availability_status_blauer)).

% @attr availability_status_darkside
% @type categorical
% @canonical false
% @original_name availability_status (darkside)
% @values listed_2026_ds=2026_model_listed unk_availability_status_darkside=Unknown
% @importance 0.9

0.82::acc(s22, availability_status_darkside).

0.88::true_val(availability_status_darkside, listed_2026_ds); 0.12::true_val(availability_status_darkside, unk_availability_status_darkside).

measured(s22, availability_status_darkside, listed_2026_ds).

all_consistent(availability_status_darkside) :-
    consistent(s22, availability_status_darkside).

evidence(all_consistent(availability_status_darkside)).
query(true_val(availability_status_darkside, listed_2026_ds)).
query(true_val(availability_status_darkside, unk_availability_status_darkside)).

% @attr availability_status_skipro
% @type categorical
% @canonical false
% @original_name availability_status (skipro)
% @values sold_out_2026=2026_all_sizes_sold_out unk_availability_status_skipro=Unknown
% @importance 0.7

0.78::acc(s26, availability_status_skipro).

0.85::true_val(availability_status_skipro, sold_out_2026); 0.15::true_val(availability_status_skipro, unk_availability_status_skipro).

measured(s26, availability_status_skipro, sold_out_2026).

all_consistent(availability_status_skipro) :-
    consistent(s26, availability_status_skipro).

evidence(all_consistent(availability_status_skipro)).
query(true_val(availability_status_skipro, sold_out_2026)).
query(true_val(availability_status_skipro, unk_availability_status_skipro)).

% @attr availability_status_absolute_snow
% @type categorical
% @canonical false
% @original_name availability_status (absolute-snow)
% @values listed_2025=2025_model_listed unk_availability_status_absolute_snow=Unknown
% @importance 0.75

0.78::acc(s27, availability_status_absolute_snow).

0.85::true_val(availability_status_absolute_snow, listed_2025); 0.15::true_val(availability_status_absolute_snow, unk_availability_status_absolute_snow).

measured(s27, availability_status_absolute_snow, listed_2025).

all_consistent(availability_status_absolute_snow) :-
    consistent(s27, availability_status_absolute_snow).

evidence(all_consistent(availability_status_absolute_snow)).
query(true_val(availability_status_absolute_snow, listed_2025)).
query(true_val(availability_status_absolute_snow, unk_availability_status_absolute_snow)).

% @attr availability_status_surface_sport
% @type categorical
% @canonical false
% @original_name availability_status (surface sport)
% @values listed_2026_ss=2026_model_listed unk_availability_status_surface_sport=Unknown
% @importance 0.6

0.70::acc(s28, availability_status_surface_sport).

0.80::true_val(availability_status_surface_sport, listed_2026_ss); 0.20::true_val(availability_status_surface_sport, unk_availability_status_surface_sport).

measured(s28, availability_status_surface_sport, listed_2026_ss).

all_consistent(availability_status_surface_sport) :-
    consistent(s28, availability_status_surface_sport).

evidence(all_consistent(availability_status_surface_sport)).
query(true_val(availability_status_surface_sport, listed_2026_ss)).
query(true_val(availability_status_surface_sport, unk_availability_status_surface_sport)).

% @attr availability_status_s2as
% @type categorical
% @canonical false
% @original_name availability_status (s2as)
% @values not_found_2027=2027_model_NOT_found_for_Surfer unk_availability_status_s2as=Unknown
% @importance 0.5

0.60::acc(s29, availability_status_s2as).

0.75::true_val(availability_status_s2as, not_found_2027); 0.25::true_val(availability_status_s2as, unk_availability_status_s2as).

measured(s29, availability_status_s2as, not_found_2027).

all_consistent(availability_status_s2as) :-
    consistent(s29, availability_status_s2as).

evidence(all_consistent(availability_status_s2as)).
query(true_val(availability_status_s2as, not_found_2027)).
query(true_val(availability_status_s2as, unk_availability_status_s2as)).

% @attr estimated_availability_date
% @type categorical
% @canonical false
% @original_name estimated_availability_date
% @values may_2026=Sold_out_est_May_1_2026 unk_estimated_availability_date=Unknown
% @importance 0.85

0.88::acc(sm, estimated_availability_date).

0.90::true_val(estimated_availability_date, may_2026); 0.10::true_val(estimated_availability_date, unk_estimated_availability_date).

measured(sm, estimated_availability_date, may_2026).

all_consistent(estimated_availability_date) :-
    consistent(sm, estimated_availability_date).

evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, may_2026)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

% @attr shipping_restriction_au
% @type categorical
% @canonical false
% @original_name Shipping restriction (AU merchant)
% @values australia_only=Only_ships_within_Australia unk_shipping_restriction_au=Unknown
% @importance 0.85

0.92::acc(sm, shipping_restriction_au).

0.92::true_val(shipping_restriction_au, australia_only); 0.08::true_val(shipping_restriction_au, unk_shipping_restriction_au).

measured(sm, shipping_restriction_au, australia_only).

all_consistent(shipping_restriction_au) :-
    consistent(sm, shipping_restriction_au).

evidence(all_consistent(shipping_restriction_au)).
query(true_val(shipping_restriction_au, australia_only)).
query(true_val(shipping_restriction_au, unk_shipping_restriction_au)).

% @attr historical_price_increase
% @type categorical
% @canonical false
% @original_name Historical price increase noted
% @values staggering_increase=AUD_1099_to_1899_staggering_increase unk_historical_price_increase=Unknown
% @importance 0.85

0.75::acc(s30, historical_price_increase).

0.80::true_val(historical_price_increase, staggering_increase); 0.20::true_val(historical_price_increase, unk_historical_price_increase).

measured(s30, historical_price_increase, staggering_increase).

all_consistent(historical_price_increase) :-
    consistent(s30, historical_price_increase).

evidence(all_consistent(historical_price_increase)).
query(true_val(historical_price_increase, staggering_increase)).
query(true_val(historical_price_increase, unk_historical_price_increase)).

% @attr price_comparison_competitors
% @type categorical
% @canonical false
% @original_name Price comparison
% @values competitors_600_900=Most_competing_premium_powder_boards_600_900_USD unk_price_comparison_competitors=Unknown
% @importance 0.85

0.82::acc(s31, price_comparison_competitors).

0.85::true_val(price_comparison_competitors, competitors_600_900); 0.15::true_val(price_comparison_competitors, unk_price_comparison_competitors).

measured(s31, price_comparison_competitors, competitors_600_900).

all_consistent(price_comparison_competitors) :-
    consistent(s31, price_comparison_competitors).

evidence(all_consistent(price_comparison_competitors)).
query(true_val(price_comparison_competitors, competitors_600_900)).
query(true_val(price_comparison_competitors, unk_price_comparison_competitors)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values s149_154_159_162=149cm_154cm_159cm_162cm unk_available_sizes=Unknown
% @importance 0.925

0.95::acc(s14, available_sizes).
0.90::acc(sm, available_sizes).

0.95::true_val(available_sizes, s149_154_159_162); 0.05::true_val(available_sizes, unk_available_sizes).

measured(s14, available_sizes, s149_154_159_162).
measured(sm, available_sizes, s149_154_159_162).

all_consistent(available_sizes) :-
    consistent(s14, available_sizes),
    (indep(sm), consistent(sm, available_sizes) ; \+indep(sm)).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, s149_154_159_162)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr effective_edge_159
% @type numeric
% @canonical false
% @original_name Effective edge (159cm)
% @unit cm
% @values v127_6=127.6 unk_effective_edge_159=Unknown
% @importance 0.925

0.95::acc(s14, effective_edge_159).
0.85::acc(sm, effective_edge_159).

0.95::true_val(effective_edge_159, v127_6); 0.05::true_val(effective_edge_159, unk_effective_edge_159).

measured(s14, effective_edge_159, v127_6).
measured(sm, effective_edge_159, v127_6).

all_consistent(effective_edge_159) :-
    consistent(s14, effective_edge_159),
    (indep(sm), consistent(sm, effective_edge_159) ; \+indep(sm)).

evidence(all_consistent(effective_edge_159)).
query(true_val(effective_edge_159, v127_6)).
query(true_val(effective_edge_159, unk_effective_edge_159)).

% @attr tip_tail_width_size_159_nose
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (159cm nose)
% @unit cm
% @values v32_9=32.9 unk_tip_tail_width_size_159_nose=Unknown
% @importance 0.925

0.95::acc(s14, tip_tail_width_size_159_nose).
0.85::acc(sm, tip_tail_width_size_159_nose).

0.95::true_val(tip_tail_width_size_159_nose, v32_9); 0.05::true_val(tip_tail_width_size_159_nose, unk_tip_tail_width_size_159_nose).

measured(s14, tip_tail_width_size_159_nose, v32_9).
measured(sm, tip_tail_width_size_159_nose, v32_9).

all_consistent(tip_tail_width_size_159_nose) :-
    consistent(s14, tip_tail_width_size_159_nose),
    (indep(sm), consistent(sm, tip_tail_width_size_159_nose) ; \+indep(sm)).

evidence(all_consistent(tip_tail_width_size_159_nose)).
query(true_val(tip_tail_width_size_159_nose, v32_9)).
query(true_val(tip_tail_width_size_159_nose, unk_tip_tail_width_size_159_nose)).

% @attr tip_tail_width_size_159_tail
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (159cm tail)
% @unit cm
% @values v29_8=29.8 unk_tip_tail_width_size_159_tail=Unknown
% @importance 0.925

0.95::acc(s14, tip_tail_width_size_159_tail).
0.85::acc(sm, tip_tail_width_size_159_tail).

0.95::true_val(tip_tail_width_size_159_tail, v29_8); 0.05::true_val(tip_tail_width_size_159_tail, unk_tip_tail_width_size_159_tail).

measured(s14, tip_tail_width_size_159_tail, v29_8).
measured(sm, tip_tail_width_size_159_tail, v29_8).

all_consistent(tip_tail_width_size_159_tail) :-
    consistent(s14, tip_tail_width_size_159_tail),
    (indep(sm), consistent(sm, tip_tail_width_size_159_tail) ; \+indep(sm)).

evidence(all_consistent(tip_tail_width_size_159_tail)).
query(true_val(tip_tail_width_size_159_tail, v29_8)).
query(true_val(tip_tail_width_size_159_tail, unk_tip_tail_width_size_159_tail)).

% @attr waist_width_159
% @type numeric
% @canonical false
% @original_name Waist width (159cm)
% @unit cm
% @values v26_4=26.4 unk_waist_width_159=Unknown
% @importance 0.925

0.95::acc(s14, waist_width_159).
0.85::acc(sm, waist_width_159).

0.95::true_val(waist_width_159, v26_4); 0.05::true_val(waist_width_159, unk_waist_width_159).

measured(s14, waist_width_159, v26_4).
measured(sm, waist_width_159, v26_4).

all_consistent(waist_width_159) :-
    consistent(s14, waist_width_159),
    (indep(sm), consistent(sm, waist_width_159) ; \+indep(sm)).

evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v26_4)).
query(true_val(waist_width_159, unk_waist_width_159)).

% @attr sidecut_radius_size_159
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (159cm)
% @unit m
% @values v7_89=7.89 unk_sidecut_radius_size_159=Unknown
% @importance 0.925

0.95::acc(s14, sidecut_radius_size_159).
0.85::acc(sm, sidecut_radius_size_159).

0.95::true_val(sidecut_radius_size_159, v7_89); 0.05::true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159).

measured(s14, sidecut_radius_size_159, v7_89).
measured(sm, sidecut_radius_size_159, v7_89).

all_consistent(sidecut_radius_size_159) :-
    consistent(s14, sidecut_radius_size_159),
    (indep(sm), consistent(sm, sidecut_radius_size_159) ; \+indep(sm)).

evidence(all_consistent(sidecut_radius_size_159)).
query(true_val(sidecut_radius_size_159, v7_89)).
query(true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159)).

% @attr stance_width_range_size_159
% @type categorical
% @canonical false
% @original_name stance_width_range_size (159cm)
% @unit cm
% @values r52_64=52.0-64.0cm unk_stance_width_range_size_159=Unknown
% @importance 0.925

0.95::acc(s14, stance_width_range_size_159).
0.85::acc(sm, stance_width_range_size_159).

0.95::true_val(stance_width_range_size_159, r52_64); 0.05::true_val(stance_width_range_size_159, unk_stance_width_range_size_159).

measured(s14, stance_width_range_size_159, r52_64).
measured(sm, stance_width_range_size_159, r52_64).

all_consistent(stance_width_range_size_159) :-
    consistent(s14, stance_width_range_size_159),
    (indep(sm), consistent(sm, stance_width_range_size_159) ; \+indep(sm)).

evidence(all_consistent(stance_width_range_size_159)).
query(true_val(stance_width_range_size_159, r52_64)).
query(true_val(stance_width_range_size_159, unk_stance_width_range_size_159)).

% @attr recommended_weight_range_size_159
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (159cm)
% @unit kg
% @values r77_97=77-97kg unk_recommended_weight_range_size_159=Unknown
% @importance 0.925

0.95::acc(s14, recommended_weight_range_size_159).
0.85::acc(sm, recommended_weight_range_size_159).

0.95::true_val(recommended_weight_range_size_159, r77_97); 0.05::true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159).

measured(s14, recommended_weight_range_size_159, r77_97).
measured(sm, recommended_weight_range_size_159, r77_97).

all_consistent(recommended_weight_range_size_159) :-
    consistent(s14, recommended_weight_range_size_159),
    (indep(sm), consistent(sm, recommended_weight_range_size_159) ; \+indep(sm)).

evidence(all_consistent(recommended_weight_range_size_159)).
query(true_val(recommended_weight_range_size_159, r77_97)).
query(true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159)).

% @attr boot_size_159
% @type categorical
% @canonical false
% @original_name Boot size (159cm)
% @values eu42_46=EU42-46_US8-12 unk_boot_size_159=Unknown
% @importance 1.0

0.95::acc(s14, boot_size_159).

0.95::true_val(boot_size_159, eu42_46); 0.05::true_val(boot_size_159, unk_boot_size_159).

measured(s14, boot_size_159, eu42_46).

all_consistent(boot_size_159) :-
    consistent(s14, boot_size_159).

evidence(all_consistent(boot_size_159)).
query(true_val(boot_size_159, eu42_46)).
query(true_val(boot_size_159, unk_boot_size_159)).

% @attr effective_edge_162
% @type numeric
% @canonical false
% @original_name Effective edge (162cm)
% @unit cm
% @values v130_1=130.1 unk_effective_edge_162=Unknown
% @importance 0.925

0.95::acc(s14, effective_edge_162).
0.85::acc(sm, effective_edge_162).

0.95::true_val(effective_edge_162, v130_1); 0.05::true_val(effective_edge_162, unk_effective_edge_162).

measured(s14, effective_edge_162, v130_1).
measured(sm, effective_edge_162, v130_1).

all_consistent(effective_edge_162) :-
    consistent(s14, effective_edge_162),
    (indep(sm), consistent(sm, effective_edge_162) ; \+indep(sm)).

evidence(all_consistent(effective_edge_162)).
query(true_val(effective_edge_162, v130_1)).
query(true_val(effective_edge_162, unk_effective_edge_162)).

% @attr tip_tail_width_size_162_nose
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (162cm nose)
% @unit cm
% @values v33_4=33.4 unk_tip_tail_width_size_162_nose=Unknown
% @importance 0.925

0.95::acc(s14, tip_tail_width_size_162_nose).
0.85::acc(sm, tip_tail_width_size_162_nose).

0.95::true_val(tip_tail_width_size_162_nose, v33_4); 0.05::true_val(tip_tail_width_size_162_nose, unk_tip_tail_width_size_162_nose).

measured(s14, tip_tail_width_size_162_nose, v33_4).
measured(sm, tip_tail_width_size_162_nose, v33_4).

all_consistent(tip_tail_width_size_162_nose) :-
    consistent(s14, tip_tail_width_size_162_nose),
    (indep(sm), consistent(sm, tip_tail_width_size_162_nose) ; \+indep(sm)).

evidence(all_consistent(tip_tail_width_size_162_nose)).
query(true_val(tip_tail_width_size_162_nose, v33_4)).
query(true_val(tip_tail_width_size_162_nose, unk_tip_tail_width_size_162_nose)).

% @attr tip_tail_width_size_162_tail
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (162cm tail)
% @unit cm
% @values v30_3=30.3 unk_tip_tail_width_size_162_tail=Unknown
% @importance 0.925

0.95::acc(s14, tip_tail_width_size_162_tail).
0.85::acc(sm, tip_tail_width_size_162_tail).

0.95::true_val(tip_tail_width_size_162_tail, v30_3); 0.05::true_val(tip_tail_width_size_162_tail, unk_tip_tail_width_size_162_tail).

measured(s14, tip_tail_width_size_162_tail, v30_3).
measured(sm, tip_tail_width_size_162_tail, v30_3).

all_consistent(tip_tail_width_size_162_tail) :-
    consistent(s14, tip_tail_width_size_162_tail),
    (indep(sm), consistent(sm, tip_tail_width_size_162_tail) ; \+indep(sm)).

evidence(all_consistent(tip_tail_width_size_162_tail)).
query(true_val(tip_tail_width_size_162_tail, v30_3)).
query(true_val(tip_tail_width_size_162_tail, unk_tip_tail_width_size_162_tail)).

% @attr waist_width_162
% @type numeric
% @canonical false
% @original_name Waist width (162cm)
% @unit cm
% @values v26_7=26.7 unk_waist_width_162=Unknown
% @importance 0.925

0.95::acc(s14, waist_width_162).
0.85::acc(sm, waist_width_162).

0.95::true_val(waist_width_162, v26_7); 0.05::true_val(waist_width_162, unk_waist_width_162).

measured(s14, waist_width_162, v26_7).
measured(sm, waist_width_162, v26_7).

all_consistent(waist_width_162) :-
    consistent(s14, waist_width_162),
    (indep(sm), consistent(sm, waist_width_162) ; \+indep(sm)).

evidence(all_consistent(waist_width_162)).
query(true_val(waist_width_162, v26_7)).
query(true_val(waist_width_162, unk_waist_width_162)).

% @attr sidecut_radius_size_162
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (162cm)
% @unit m
% @values v7_98=7.98 unk_sidecut_radius_size_162=Unknown
% @importance 0.925

0.95::acc(s14, sidecut_radius_size_162).
0.85::acc(sm, sidecut_radius_size_162).

0.95::true_val(sidecut_radius_size_162, v7_98); 0.05::true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162).

measured(s14, sidecut_radius_size_162, v7_98).
measured(sm, sidecut_radius_size_162, v7_98).

all_consistent(sidecut_radius_size_162) :-
    consistent(s14, sidecut_radius_size_162),
    (indep(sm), consistent(sm, sidecut_radius_size_162) ; \+indep(sm)).

evidence(all_consistent(sidecut_radius_size_162)).
query(true_val(sidecut_radius_size_162, v7_98)).
query(true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162)).

% @attr stance_width_range_size_162
% @type categorical
% @canonical false
% @original_name stance_width_range_size (162cm)
% @unit cm
% @values r53_65=53.0-65.0cm unk_stance_width_range_size_162=Unknown
% @importance 0.925

0.95::acc(s14, stance_width_range_size_162).
0.85::acc(sm, stance_width_range_size_162).

0.95::true_val(stance_width_range_size_162, r53_65); 0.05::true_val(stance_width_range_size_162, unk_stance_width_range_size_162).

measured(s14, stance_width_range_size_162, r53_65).
measured(sm, stance_width_range_size_162, r53_65).

all_consistent(stance_width_range_size_162) :-
    consistent(s14, stance_width_range_size_162),
    (indep(sm), consistent(sm, stance_width_range_size_162) ; \+indep(sm)).

evidence(all_consistent(stance_width_range_size_162)).
query(true_val(stance_width_range_size_162, r53_65)).
query(true_val(stance_width_range_size_162, unk_stance_width_range_size_162)).

% @attr recommended_weight_range_size_162
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (162cm)
% @unit kg
% @values r85_105=85-105kg unk_recommended_weight_range_size_162=Unknown
% @importance 0.925

0.95::acc(s14, recommended_weight_range_size_162).
0.85::acc(sm, recommended_weight_range_size_162).

0.95::true_val(recommended_weight_range_size_162, r85_105); 0.05::true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162).

measured(s14, recommended_weight_range_size_162, r85_105).
measured(sm, recommended_weight_range_size_162, r85_105).

all_consistent(recommended_weight_range_size_162) :-
    consistent(s14, recommended_weight_range_size_162),
    (indep(sm), consistent(sm, recommended_weight_range_size_162) ; \+indep(sm)).

evidence(all_consistent(recommended_weight_range_size_162)).
query(true_val(recommended_weight_range_size_162, r85_105)).
query(true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162)).

% @attr boot_size_162
% @type categorical
% @canonical false
% @original_name Boot size (162cm)
% @values eu42_47=EU42-47_US9-12 unk_boot_size_162=Unknown
% @importance 1.0

0.95::acc(s14, boot_size_162).

0.95::true_val(boot_size_162, eu42_47); 0.05::true_val(boot_size_162, unk_boot_size_162).

measured(s14, boot_size_162, eu42_47).

all_consistent(boot_size_162) :-
    consistent(s14, boot_size_162).

evidence(all_consistent(boot_size_162)).
query(true_val(boot_size_162, eu42_47)).
query(true_val(boot_size_162, unk_boot_size_162)).

% @attr effective_edge_149
% @type numeric
% @canonical false
% @original_name Effective edge (149cm)
% @unit cm
% @values v119_1=119.1 unk_effective_edge_149=Unknown
% @importance 1.0

0.95::acc(s14, effective_edge_149).

0.95::true_val(effective_edge_149, v119_1); 0.05::true_val(effective_edge_149, unk_effective_edge_149).

measured(s14, effective_edge_149, v119_1).

all_consistent(effective_edge_149) :-
    consistent(s14, effective_edge_149).

evidence(all_consistent(effective_edge_149)).
query(true_val(effective_edge_149, v119_1)).
query(true_val(effective_edge_149, unk_effective_edge_149)).

% @attr waist_width_149
% @type numeric
% @canonical false
% @original_name Waist width (149cm)
% @unit cm
% @values v25_4=25.4 unk_waist_width_149=Unknown
% @importance 1.0

0.95::acc(s14, waist_width_149).

0.95::true_val(waist_width_149, v25_4); 0.05::true_val(waist_width_149, unk_waist_width_149).

measured(s14, waist_width_149, v25_4).

all_consistent(waist_width_149) :-
    consistent(s14, waist_width_149).

evidence(all_consistent(waist_width_149)).
query(true_val(waist_width_149, v25_4)).
query(true_val(waist_width_149, unk_waist_width_149)).

% @attr tip_tail_width_size_149
% @type categorical
% @canonical false
% @original_name tip_tail_width_size (149cm)
% @unit cm
% @values v31_4_28_4=31.4_28.4 unk_tip_tail_width_size_149=Unknown
% @importance 1.0

0.95::acc(s14, tip_tail_width_size_149).

0.95::true_val(tip_tail_width_size_149, v31_4_28_4); 0.05::true_val(tip_tail_width_size_149, unk_tip_tail_width_size_149).

measured(s14, tip_tail_width_size_149, v31_4_28_4).

all_consistent(tip_tail_width_size_149) :-
    consistent(s14, tip_tail_width_size_149).

evidence(all_consistent(tip_tail_width_size_149)).
query(true_val(tip_tail_width_size_149, v31_4_28_4)).
query(true_val(tip_tail_width_size_149, unk_tip_tail_width_size_149)).

% @attr sidecut_radius_size_149
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (149cm)
% @unit m
% @values v7_58=7.58 unk_sidecut_radius_size_149=Unknown
% @importance 1.0

0.95::acc(s14, sidecut_radius_size_149).

0.95::true_val(sidecut_radius_size_149, v7_58); 0.05::true_val(sidecut_radius_size_149, unk_sidecut_radius_size_149).

measured(s14, sidecut_radius_size_149, v7_58).

all_consistent(sidecut_radius_size_149) :-
    consistent(s14, sidecut_radius_size_149).

evidence(all_consistent(sidecut_radius_size_149)).
query(true_val(sidecut_radius_size_149, v7_58)).
query(true_val(sidecut_radius_size_149, unk_sidecut_radius_size_149)).

% @attr stance_width_range_size_149
% @type categorical
% @canonical false
% @original_name stance_width_range_size (149cm)
% @unit cm
% @values r46_58=46.0-58.0cm unk_stance_width_range_size_149=Unknown
% @importance 1.0

0.95::acc(s14, stance_width_range_size_149).

0.95::true_val(stance_width_range_size_149, r46_58); 0.05::true_val(stance_width_range_size_149, unk_stance_width_range_size_149).

measured(s14, stance_width_range_size_149, r46_58).

all_consistent(stance_width_range_size_149) :-
    consistent(s14, stance_width_range_size_149).

evidence(all_consistent(stance_width_range_size_149)).
query(true_val(stance_width_range_size_149, r46_58)).
query(true_val(stance_width_range_size_149, unk_stance_width_range_size_149)).

% @attr recommended_weight_range_size_149
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (149cm)
% @unit kg
% @values r56_76=56-76kg unk_recommended_weight_range_size_149=Unknown
% @importance 1.0

0.95::acc(s14, recommended_weight_range_size_149).

0.95::true_val(recommended_weight_range_size_149, r56_76); 0.05::true_val(recommended_weight_range_size_149, unk_recommended_weight_range_size_149).

measured(s14, recommended_weight_range_size_149, r56_76).

all_consistent(recommended_weight_range_size_149) :-
    consistent(s14, recommended_weight_range_size_149).

evidence(all_consistent(recommended_weight_range_size_149)).
query(true_val(recommended_weight_range_size_149, r56_76)).
query(true_val(recommended_weight_range_size_149, unk_recommended_weight_range_size_149)).

% @attr effective_edge_154
% @type numeric
% @canonical false
% @original_name Effective edge (154cm)
% @unit cm
% @values v123_3=123.3 unk_effective_edge_154=Unknown
% @importance 1.0

0.95::acc(s14, effective_edge_154).

0.95::true_val(effective_edge_154, v123_3); 0.05::true_val(effective_edge_154, unk_effective_edge_154).

measured(s14, effective_edge_154, v123_3).

all_consistent(effective_edge_154) :-
    consistent(s14, effective_edge_154).

evidence(all_consistent(effective_edge_154)).
query(true_val(effective_edge_154, v123_3)).
query(true_val(effective_edge_154, unk_effective_edge_154)).

% @attr waist_width_154
% @type numeric
% @canonical false
% @original_name Waist width (154cm)
% @unit cm
% @values v25_9=25.9 unk_waist_width_154=Unknown
% @importance 1.0

0.95::acc(s14, waist_width_154).

0.95::true_val(waist_width_154, v25_9); 0.05::true_val(waist_width_154, unk_waist_width_154).

measured(s14, waist_width_154, v25_9).

all_consistent(waist_width_154) :-
    consistent(s14, waist_width_154).

evidence(all_consistent(waist_width_154)).
query(true_val(waist_width_154, v25_9)).
query(true_val(waist_width_154, unk_waist_width_154)).

% @attr tip_tail_width_size
% @type categorical
% @canonical true
% @original_name tip_tail_width_size (154cm)
% @unit cm
% @values v32_2_29_1=32.2_29.1 unk_tip_tail_width_size=Unknown
% @importance 1.0

0.95::acc(s14, tip_tail_width_size).

0.95::true_val(tip_tail_width_size, v32_2_29_1); 0.05::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s14, tip_tail_width_size, v32_2_29_1).

all_consistent(tip_tail_width_size) :-
    consistent(s14, tip_tail_width_size).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v32_2_29_1)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr sidecut_radius_size
% @type numeric
% @canonical true
% @original_name sidecut_radius_size (154cm)
% @unit m
% @values v7_74=7.74 unk_sidecut_radius_size=Unknown
% @importance 1.0

0.95::acc(s14, sidecut_radius_size).

0.95::true_val(sidecut_radius_size, v7_74); 0.05::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s14, sidecut_radius_size, v7_74).

all_consistent(sidecut_radius_size) :-
    consistent(s14, sidecut_radius_size).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_74)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr stance_width_range_size
% @type categorical
% @canonical true
% @original_name stance_width_range_size (154cm)
% @unit cm
% @values r49_61=49.0-61.0cm unk_stance_width_range_size=Unknown
% @importance 1.0

0.95::acc(s14, stance_width_range_size).

0.95::true_val(stance_width_range_size, r49_61); 0.05::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s14, stance_width_range_size, r49_61).

all_consistent(stance_width_range_size) :-
    consistent(s14, stance_width_range_size).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, r49_61)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size (154cm)
% @unit kg
% @values r67_87=67-87kg unk_recommended_weight_range_size=Unknown
% @importance 1.0

0.95::acc(s14, recommended_weight_range_size).

0.95::true_val(recommended_weight_range_size, r67_87); 0.05::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s14, recommended_weight_range_size, r67_87).

all_consistent(recommended_weight_range_size) :-
    consistent(s14, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, r67_87)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 0.875

0.93::acc(sm, shape).
0.92::acc(s2, shape).

0.95::true_val(shape, tapered_directional); 0.05::true_val(shape, unk_shape).

measured(sm, shape, tapered_directional).
measured(s2, shape, tapered_directional).

all_consistent(shape) :-
    consistent(s2, shape),
    (indep(sm), consistent(sm, shape) ; \+indep(sm)).

evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @original_name flex_rating_10
% @unit /10
% @values v4=4.0 unk_flex_rating_10=Unknown
% @importance 0.917

0.95::acc(s14, flex_rating_10).
0.82::acc(s32, flex_rating_10).
0.88::acc(sm, flex_rating_10).

0.95::true_val(flex_rating_10, v4); 0.05::true_val(flex_rating_10, unk_flex_rating_10).

measured(s14, flex_rating_10, v4).
measured(s32, flex_rating_10, v4).
measured(sm, flex_rating_10, v4).

all_consistent(flex_rating_10) :-
    consistent(s14, flex_rating_10),
    consistent(s32, flex_rating_10),
    (indep(sm), consistent(sm, flex_rating_10) ; \+indep(sm)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v4)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values mid_flex_balanced=Mid_flex_balanced_blend unk_flex_feel=Unknown
% @importance 0.85

0.82::acc(sm, flex_feel).

0.85::true_val(flex_feel, mid_flex_balanced); 0.15::true_val(flex_feel, unk_flex_feel).

measured(sm, flex_feel, mid_flex_balanced).

all_consistent(flex_feel) :-
    consistent(sm, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, mid_flex_balanced)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values low_camber_3bt_sidekick=Low_Camber_3BT_SideKick medium_camber_3bt_sidekick=Medium_Camber_3BT_SideKick
% @importance 0.9

0.93::acc(s14, camber_type).
0.82::acc(sm, camber_type).
0.78::acc(s33, camber_type).

0.50::true_val(camber_type, low_camber_3bt_sidekick); 0.50::true_val(camber_type, medium_camber_3bt_sidekick).

measured(s14, camber_type, low_camber_3bt_sidekick).
measured(sm, camber_type, medium_camber_3bt_sidekick).
measured(s33, camber_type, medium_camber_3bt_sidekick).

all_consistent(camber_type) :-
    consistent(s14, camber_type),
    (indep(sm), consistent(sm, camber_type) ; \+indep(sm)),
    (indep(s33), consistent(s33, camber_type) ; \+indep(s33)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, low_camber_3bt_sidekick)).
query(true_val(camber_type, medium_camber_3bt_sidekick)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values positive_camber_lifted_sidebase=Tip_to_tail_positive_camber_lifted_sidebase unk_camber_description=Unknown
% @importance 0.885

0.94::acc(s14, camber_description).
0.92::acc(s34, camber_description).

0.95::true_val(camber_description, positive_camber_lifted_sidebase); 0.05::true_val(camber_description, unk_camber_description).

measured(s14, camber_description, positive_camber_lifted_sidebase).
measured(s34, camber_description, positive_camber_lifted_sidebase).

all_consistent(camber_description) :-
    consistent(s14, camber_description),
    consistent(s34, camber_description).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, positive_camber_lifted_sidebase)).
query(true_val(camber_description, unk_camber_description)).

% @attr camber_description_sidebase
% @type categorical
% @canonical false
% @original_name camber_description (sidebase uplift)
% @values hull_like_uplift=Increases_sidebase_uplift_beyond_widest_points unk_camber_description_sidebase=Unknown
% @importance 0.885

0.94::acc(s14, camber_description_sidebase).
0.92::acc(s34, camber_description_sidebase).

0.95::true_val(camber_description_sidebase, hull_like_uplift); 0.05::true_val(camber_description_sidebase, unk_camber_description_sidebase).

measured(s14, camber_description_sidebase, hull_like_uplift).
measured(s34, camber_description_sidebase, hull_like_uplift).

all_consistent(camber_description_sidebase) :-
    consistent(s14, camber_description_sidebase),
    consistent(s34, camber_description_sidebase).

evidence(all_consistent(camber_description_sidebase)).
query(true_val(camber_description_sidebase, hull_like_uplift)).
query(true_val(camber_description_sidebase, unk_camber_description_sidebase)).

% @attr camber_description_nose_uplift
% @type categorical
% @canonical false
% @original_name camber_description (nose sidebase uplift)
% @values high=High unk_camber_description_nose_uplift=Unknown
% @importance 0.925

0.93::acc(s14, camber_description_nose_uplift).
0.85::acc(sm, camber_description_nose_uplift).

0.93::true_val(camber_description_nose_uplift, high); 0.07::true_val(camber_description_nose_uplift, unk_camber_description_nose_uplift).

measured(s14, camber_description_nose_uplift, high).
measured(sm, camber_description_nose_uplift, high).

all_consistent(camber_description_nose_uplift) :-
    consistent(s14, camber_description_nose_uplift),
    (indep(sm), consistent(sm, camber_description_nose_uplift) ; \+indep(sm)).

evidence(all_consistent(camber_description_nose_uplift)).
query(true_val(camber_description_nose_uplift, high)).
query(true_val(camber_description_nose_uplift, unk_camber_description_nose_uplift)).

% @attr camber_description_tail_uplift
% @type categorical
% @canonical false
% @original_name camber_description (tail sidebase uplift)
% @values low=Low unk_camber_description_tail_uplift=Unknown
% @importance 0.925

0.93::acc(s14, camber_description_tail_uplift).
0.85::acc(sm, camber_description_tail_uplift).

0.93::true_val(camber_description_tail_uplift, low); 0.07::true_val(camber_description_tail_uplift, unk_camber_description_tail_uplift).

measured(s14, camber_description_tail_uplift, low).
measured(sm, camber_description_tail_uplift, low).

all_consistent(camber_description_tail_uplift) :-
    consistent(s14, camber_description_tail_uplift),
    (indep(sm), consistent(sm, camber_description_tail_uplift) ; \+indep(sm)).

evidence(all_consistent(camber_description_tail_uplift)).
query(true_val(camber_description_tail_uplift, low)).
query(true_val(camber_description_tail_uplift, unk_camber_description_tail_uplift)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values sul_paulownia_poplar=Super_Ultra_Light_80_20_Paulownia_Poplar unk_core_material=Unknown
% @importance 0.875

0.94::acc(s14, core_material).
0.82::acc(s35, core_material).

0.95::true_val(core_material, sul_paulownia_poplar); 0.05::true_val(core_material, unk_core_material).

measured(s14, core_material, sul_paulownia_poplar).
measured(s35, core_material, sul_paulownia_poplar).

all_consistent(core_material) :-
    consistent(s14, core_material),
    (indep(s35), consistent(s35, core_material) ; \+indep(s35)).

evidence(all_consistent(core_material)).
query(true_val(core_material, sul_paulownia_poplar)).
query(true_val(core_material, unk_core_material)).

% @attr core_material_blend_ratio
% @type categorical
% @canonical false
% @original_name core_material_blend_ratio
% @values r80_20=80_20_Paulownia_Poplar r70_30=70_30_Paulownia_Poplar
% @importance 0.7

0.85::acc(s35, core_material_blend_ratio).
0.75::acc(sm, core_material_blend_ratio).
0.65::acc(s36, core_material_blend_ratio).

0.65::true_val(core_material_blend_ratio, r80_20); 0.35::true_val(core_material_blend_ratio, r70_30).

measured(s35, core_material_blend_ratio, r80_20).
measured(sm, core_material_blend_ratio, r80_20).
measured(s36, core_material_blend_ratio, r70_30).

all_consistent(core_material_blend_ratio) :-
    (indep(s35), consistent(s35, core_material_blend_ratio) ; \+indep(s35)),
    (indep(sm), consistent(sm, core_material_blend_ratio) ; \+indep(sm)),
    consistent(s36, core_material_blend_ratio).

evidence(all_consistent(core_material_blend_ratio)).
query(true_val(core_material_blend_ratio, r80_20)).
query(true_val(core_material_blend_ratio, r70_30)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values nano_speed_s_isosport_7000=Nano_Speed_S_sintered_ISOSPORT_7000 unk_base_material=Unknown
% @importance 0.85

0.95::acc(s14, base_material).
0.93::acc(s37, base_material).

0.95::true_val(base_material, nano_speed_s_isosport_7000); 0.05::true_val(base_material, unk_base_material).

measured(s14, base_material, nano_speed_s_isosport_7000).
measured(s37, base_material, nano_speed_s_isosport_7000).

all_consistent(base_material) :-
    consistent(s14, base_material),
    consistent(s37, base_material).

evidence(all_consistent(base_material)).
query(true_val(base_material, nano_speed_s_isosport_7000)).
query(true_val(base_material, unk_base_material)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values tri_ax=Tri_Ax_triaxial_fiberglass unk_laminate=Unknown
% @importance 0.65

0.95::acc(s14, laminate).

0.95::true_val(laminate, tri_ax); 0.05::true_val(laminate, unk_laminate).

measured(s14, laminate, tri_ax).

all_consistent(laminate) :-
    consistent(s14, laminate).

evidence(all_consistent(laminate)).
query(true_val(laminate, tri_ax)).
query(true_val(laminate, unk_laminate)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation (Carbon Stringers)
% @values carbon_stringers=Carbon_Stringers unk_construction_material_innovation=Unknown
% @importance 0.625

0.93::acc(s14, construction_material_innovation).
0.80::acc(s39, construction_material_innovation).

0.93::true_val(construction_material_innovation, carbon_stringers); 0.07::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s14, construction_material_innovation, carbon_stringers).
measured(s39, construction_material_innovation, carbon_stringers).

all_consistent(construction_material_innovation) :-
    consistent(s14, construction_material_innovation),
    (indep(s39), consistent(s39, construction_material_innovation) ; \+indep(s39)).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, carbon_stringers)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr construction_material_innovation_drst
% @type categorical
% @canonical false
% @original_name construction_material_innovation (D.R.S.T. SuperTubes)
% @values drst_supertubes=DRST_SuperTubes_six_hollow_carbon_cylinders unk_construction_material_innovation_drst=Unknown
% @importance 0.65

0.95::acc(s14, construction_material_innovation_drst).

0.95::true_val(construction_material_innovation_drst, drst_supertubes); 0.05::true_val(construction_material_innovation_drst, unk_construction_material_innovation_drst).

measured(s14, construction_material_innovation_drst, drst_supertubes).

all_consistent(construction_material_innovation_drst) :-
    consistent(s14, construction_material_innovation_drst).

evidence(all_consistent(construction_material_innovation_drst)).
query(true_val(construction_material_innovation_drst, drst_supertubes)).
query(true_val(construction_material_innovation_drst, unk_construction_material_innovation_drst)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values urethane_flex_walls=Urethane_Flex_Walls abs_solid_walls=ABS_Solid_Walls
% @importance 0.85

0.93::acc(s14, sidewall_material).
0.85::acc(sm, sidewall_material).
0.75::acc(s41, sidewall_material).

0.60::true_val(sidewall_material, urethane_flex_walls); 0.40::true_val(sidewall_material, abs_solid_walls).

measured(s14, sidewall_material, urethane_flex_walls).
measured(sm, sidewall_material, urethane_flex_walls).
measured(s41, sidewall_material, abs_solid_walls).

all_consistent(sidewall_material) :-
    consistent(s14, sidewall_material),
    (indep(sm), consistent(sm, sidewall_material) ; \+indep(sm)),
    (indep(s41), consistent(s41, sidewall_material) ; \+indep(s41)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, urethane_flex_walls)).
query(true_val(sidewall_material, abs_solid_walls)).

% @attr topsheet
% @type categorical
% @canonical false
% @original_name topsheet
% @values step_down_rails_3d=Step_Down_Rails_Top_3D unk_topsheet=Unknown
% @importance 0.45

0.93::acc(s14, topsheet).
0.90::acc(s42, topsheet).

0.95::true_val(topsheet, step_down_rails_3d); 0.05::true_val(topsheet, unk_topsheet).

measured(s14, topsheet, step_down_rails_3d).
measured(s42, topsheet, step_down_rails_3d).

all_consistent(topsheet) :-
    consistent(s14, topsheet),
    consistent(s42, topsheet).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, step_down_rails_3d)).
query(true_val(topsheet, unk_topsheet)).

% @attr inserts
% @type categorical
% @canonical false
% @original_name Inserts
% @values v24_german_stainless=24_German_stainless_steel_inserts unk_inserts=Unknown
% @importance 1.0

0.95::acc(s14, inserts).

0.95::true_val(inserts, v24_german_stainless); 0.05::true_val(inserts, unk_inserts).

measured(s14, inserts, v24_german_stainless).

all_consistent(inserts) :-
    consistent(s14, inserts).

evidence(all_consistent(inserts)).
query(true_val(inserts, v24_german_stainless)).
query(true_val(inserts, unk_inserts)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 0.85

0.88::acc(sm, mounting_pattern).

0.90::true_val(mounting_pattern, inserts_2x4); 0.10::true_val(mounting_pattern, unk_mounting_pattern).

measured(sm, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :-
    consistent(sm, mounting_pattern).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr tail_design
% @type categorical
% @canonical false
% @original_name Tail design
% @values powder_hull=Powder_Hull_advanced_swallowtail unk_tail_design=Unknown
% @importance 0.825

0.94::acc(s14, tail_design).
0.93::acc(s43, tail_design).

0.95::true_val(tail_design, powder_hull); 0.05::true_val(tail_design, unk_tail_design).

measured(s14, tail_design, powder_hull).
measured(s43, tail_design, powder_hull).

all_consistent(tail_design) :-
    consistent(s14, tail_design),
    consistent(s43, tail_design).

evidence(all_consistent(tail_design)).
query(true_val(tail_design, powder_hull)).
query(true_val(tail_design, unk_tail_design)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard=Standard_not_wide unk_width_options=Unknown
% @importance 0.85

0.88::acc(sm, width_options).

0.90::true_val(width_options, standard); 0.10::true_val(width_options, unk_width_options).

measured(sm, width_options, standard).

all_consistent(width_options) :-
    consistent(sm, width_options).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard)).
query(true_val(width_options, unk_width_options)).

% @attr nose_design
% @type categorical
% @canonical false
% @original_name Nose design
% @values wide_hull_nose=Wide_hull_like_nose_max_powder_float unk_nose_design=Unknown
% @importance 0.9

0.93::acc(s2, nose_design).

0.92::true_val(nose_design, wide_hull_nose); 0.08::true_val(nose_design, unk_nose_design).

measured(s2, nose_design, wide_hull_nose).

all_consistent(nose_design) :-
    consistent(s2, nose_design).

evidence(all_consistent(nose_design)).
query(true_val(nose_design, wide_hull_nose)).
query(true_val(nose_design, unk_nose_design)).

% @attr construction_material_innovation_airride
% @type categorical
% @canonical false
% @original_name construction_material_innovation (AirRide)
% @values airride_present=AirRide_vibration_dampening airride_absent=AirRide_not_confirmed_2027
% @importance 0.575

0.82::acc(s44, construction_material_innovation_airride).
0.80::acc(s45, construction_material_innovation_airride).
0.78::acc(sm, construction_material_innovation_airride).

0.60::true_val(construction_material_innovation_airride, airride_present); 0.40::true_val(construction_material_innovation_airride, airride_absent).

measured(s44, construction_material_innovation_airride, airride_present).
measured(s45, construction_material_innovation_airride, airride_present).
measured(sm, construction_material_innovation_airride, airride_absent).

all_consistent(construction_material_innovation_airride) :-
    consistent(s44, construction_material_innovation_airride),
    consistent(s45, construction_material_innovation_airride),
    consistent(sm, construction_material_innovation_airride).

evidence(all_consistent(construction_material_innovation_airride)).
query(true_val(construction_material_innovation_airride, airride_present)).
query(true_val(construction_material_innovation_airride, airride_absent)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values powder_primary_hardpack_secondary=Powder_primary_Hardpack_carving_secondary unk_terrain_suitability=Unknown
% @importance 0.875

0.88::acc(sm, terrain_suitability).
0.92::acc(s2, terrain_suitability).

0.95::true_val(terrain_suitability, powder_primary_hardpack_secondary); 0.05::true_val(terrain_suitability, unk_terrain_suitability).

measured(sm, terrain_suitability, powder_primary_hardpack_secondary).
measured(s2, terrain_suitability, powder_primary_hardpack_secondary).

all_consistent(terrain_suitability) :-
    consistent(s2, terrain_suitability),
    (indep(sm), consistent(sm, terrain_suitability) ; \+indep(sm)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, powder_primary_hardpack_secondary)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate_advanced=Intermediate_Advanced unk_rider_level=Unknown
% @importance 0.8

0.82::acc(sm, rider_level).
0.78::acc(s27, rider_level).

0.90::true_val(rider_level, intermediate_advanced); 0.10::true_val(rider_level, unk_rider_level).

measured(sm, rider_level, intermediate_advanced).
measured(s27, rider_level, intermediate_advanced).

all_consistent(rider_level) :-
    (indep(sm), consistent(sm, rider_level) ; \+indep(sm)),
    (indep(s27), consistent(s27, rider_level) ; \+indep(s27)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate_advanced)).
query(true_val(rider_level, unk_rider_level)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values advanced_expert=Advanced_Expert unk_skill_level_recommendation=Unknown
% @importance 0.85

0.82::acc(s23, skill_level_recommendation).

0.85::true_val(skill_level_recommendation, advanced_expert); 0.15::true_val(skill_level_recommendation, unk_skill_level_recommendation).

measured(s23, skill_level_recommendation, advanced_expert).

all_consistent(skill_level_recommendation) :-
    consistent(s23, skill_level_recommendation).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, advanced_expert)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values surfy_laid_back=Surfy_laid_back_feel_with_control unk_riding_style=Unknown
% @importance 1.0

0.93::acc(s14, riding_style).

0.92::true_val(riding_style, surfy_laid_back); 0.08::true_val(riding_style, unk_riding_style).

measured(s14, riding_style, surfy_laid_back).

all_consistent(riding_style) :-
    consistent(s14, riding_style).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, surfy_laid_back)).
query(true_val(riding_style, unk_riding_style)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect (powder float)
% @values exceptional_float=Exceptional_effortless_float unk_positive_aspect=Unknown
% @importance 0.78

0.80::acc(s46, positive_aspect).
0.85::acc(s47, positive_aspect).
0.78::acc(s48, positive_aspect).

0.93::true_val(positive_aspect, exceptional_float); 0.07::true_val(positive_aspect, unk_positive_aspect).

measured(s46, positive_aspect, exceptional_float).
measured(s47, positive_aspect, exceptional_float).
measured(s48, positive_aspect, exceptional_float).

all_consistent(positive_aspect) :-
    consistent(s46, positive_aspect),
    consistent(s47, positive_aspect),
    consistent(s48, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, exceptional_float)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values better_than_expected=Better_than_expected_for_powder_shape unk_edge_hold=Unknown
% @importance 0.8

0.78::acc(s49, edge_hold).
0.75::acc(s50, edge_hold).

0.88::true_val(edge_hold, better_than_expected); 0.12::true_val(edge_hold, unk_edge_hold).

measured(s49, edge_hold, better_than_expected).
measured(s50, edge_hold, better_than_expected).

all_consistent(edge_hold) :-
    consistent(s49, edge_hold),
    consistent(s50, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, better_than_expected)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr carving_rating_tgr
% @type categorical
% @canonical true
% @original_name carving_rating_tgr
% @values better_than_expected_carve=Carves_better_than_expected_for_powder_shape unk_carving_rating_tgr=Unknown
% @importance 0.8

0.78::acc(s50, carving_rating_tgr).

0.82::true_val(carving_rating_tgr, better_than_expected_carve); 0.18::true_val(carving_rating_tgr, unk_carving_rating_tgr).

measured(s50, carving_rating_tgr, better_than_expected_carve).

all_consistent(carving_rating_tgr) :-
    consistent(s50, carving_rating_tgr).

evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, better_than_expected_carve)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

% @attr positive_aspect_tree_agility
% @type categorical
% @canonical false
% @original_name positive_aspect (tree/bowl agility)
% @values surprisingly_nimble=Surprisingly_nimble_in_trees_and_bowls unk_positive_aspect_tree_agility=Unknown
% @importance 0.8

0.78::acc(s50, positive_aspect_tree_agility).

0.82::true_val(positive_aspect_tree_agility, surprisingly_nimble); 0.18::true_val(positive_aspect_tree_agility, unk_positive_aspect_tree_agility).

measured(s50, positive_aspect_tree_agility, surprisingly_nimble).

all_consistent(positive_aspect_tree_agility) :-
    consistent(s50, positive_aspect_tree_agility).

evidence(all_consistent(positive_aspect_tree_agility)).
query(true_val(positive_aspect_tree_agility, surprisingly_nimble)).
query(true_val(positive_aspect_tree_agility, unk_positive_aspect_tree_agility)).

% @attr pop
% @type categorical
% @canonical true
% @original_name pop
% @values good_easy_ollie=Good_ollies_high_easy_pop unk_pop=Unknown
% @importance 0.65

0.82::acc(s51, pop).

0.85::true_val(pop, good_easy_ollie); 0.15::true_val(pop, unk_pop).

measured(s51, pop, good_easy_ollie).

all_consistent(pop) :-
    consistent(s51, pop).

evidence(all_consistent(pop)).
query(true_val(pop, good_easy_ollie)).
query(true_val(pop, unk_pop)).

% @attr positive_aspect_speed_stability
% @type categorical
% @canonical false
% @original_name positive_aspect (speed stability)
% @values easy_fast_stable=Really_easy_to_ride_fast_without_sketchy unk_positive_aspect_speed_stability=Unknown
% @importance 0.75

0.72::acc(s52, positive_aspect_speed_stability).

0.78::true_val(positive_aspect_speed_stability, easy_fast_stable); 0.22::true_val(positive_aspect_speed_stability, unk_positive_aspect_speed_stability).

measured(s52, positive_aspect_speed_stability, easy_fast_stable).

all_consistent(positive_aspect_speed_stability) :-
    consistent(s52, positive_aspect_speed_stability).

evidence(all_consistent(positive_aspect_speed_stability)).
query(true_val(positive_aspect_speed_stability, easy_fast_stable)).
query(true_val(positive_aspect_speed_stability, unk_positive_aspect_speed_stability)).

% @attr freestyle_park_rating
% @type categorical
% @canonical true
% @original_name freestyle_park_rating
% @values limited_but_possible=Limited_but_possible_park_and_switch unk_freestyle_park_rating=Unknown
% @importance 0.45

0.65::acc(s53, freestyle_park_rating).

0.72::true_val(freestyle_park_rating, limited_but_possible); 0.28::true_val(freestyle_park_rating, unk_freestyle_park_rating).

measured(s53, freestyle_park_rating, limited_but_possible).

all_consistent(freestyle_park_rating) :-
    consistent(s53, freestyle_park_rating).

evidence(all_consistent(freestyle_park_rating)).
query(true_val(freestyle_park_rating, limited_but_possible)).
query(true_val(freestyle_park_rating, unk_freestyle_park_rating)).

% @attr negative_aspect_adaptation
% @type categorical
% @canonical false
% @original_name negative_aspect (adaptation/learning curve)
% @values requires_adaptation=Board_requires_few_days_to_get_to_know unk_negative_aspect_adaptation=Unknown
% @importance 0.75

0.82::acc(s54, negative_aspect_adaptation).

0.85::true_val(negative_aspect_adaptation, requires_adaptation); 0.15::true_val(negative_aspect_adaptation, unk_negative_aspect_adaptation).

measured(s54, negative_aspect_adaptation, requires_adaptation).

all_consistent(negative_aspect_adaptation) :-
    consistent(s54, negative_aspect_adaptation).

evidence(all_consistent(negative_aspect_adaptation)).
query(true_val(negative_aspect_adaptation, requires_adaptation)).
query(true_val(negative_aspect_adaptation, unk_negative_aspect_adaptation)).

% @attr positive_aspect_comfort
% @type categorical
% @canonical false
% @original_name positive_aspect (comfort/no back leg burn)
% @values minimal_fatigue=Handles_deep_snow_no_back_leg_burn unk_positive_aspect_comfort=Unknown
% @importance 0.8

0.78::acc(s55, positive_aspect_comfort).

0.80::true_val(positive_aspect_comfort, minimal_fatigue); 0.20::true_val(positive_aspect_comfort, unk_positive_aspect_comfort).

measured(s55, positive_aspect_comfort, minimal_fatigue).

all_consistent(positive_aspect_comfort) :-
    consistent(s55, positive_aspect_comfort).

evidence(all_consistent(positive_aspect_comfort)).
query(true_val(positive_aspect_comfort, minimal_fatigue)).
query(true_val(positive_aspect_comfort, unk_positive_aspect_comfort)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values very_fast=Very_fast_fastest_base_money_can_buy unk_base_glide_performance=Unknown
% @importance 0.7

0.93::acc(s37, base_glide_performance).

0.92::true_val(base_glide_performance, very_fast); 0.08::true_val(base_glide_performance, unk_base_glide_performance).

measured(s37, base_glide_performance, very_fast).

all_consistent(base_glide_performance) :-
    consistent(s37, base_glide_performance).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, very_fast)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr flex_feel_torsional
% @type categorical
% @canonical false
% @original_name flex_feel (torsional)
% @values well_tuned_dialed=Well_tuned_torsional_flex_sick_dialed unk_flex_feel_torsional=Unknown
% @importance 0.6

0.70::acc(s56, flex_feel_torsional).

0.75::true_val(flex_feel_torsional, well_tuned_dialed); 0.25::true_val(flex_feel_torsional, unk_flex_feel_torsional).

measured(s56, flex_feel_torsional, well_tuned_dialed).

all_consistent(flex_feel_torsional) :-
    consistent(s56, flex_feel_torsional).

evidence(all_consistent(flex_feel_torsional)).
query(true_val(flex_feel_torsional, well_tuned_dialed)).
query(true_val(flex_feel_torsional, unk_flex_feel_torsional)).

% @attr review_count_official
% @type numeric
% @canonical false
% @original_name Review count (Bataleon official)
% @values v68=68 unk_review_count_official=Unknown
% @importance 1.0

0.90::acc(s14, review_count_official).

0.92::true_val(review_count_official, v68); 0.08::true_val(review_count_official, unk_review_count_official).

measured(s14, review_count_official, v68).

all_consistent(review_count_official) :-
    consistent(s14, review_count_official).

evidence(all_consistent(review_count_official)).
query(true_val(review_count_official, v68)).
query(true_val(review_count_official, unk_review_count_official)).

% @attr review_rating_distribution
% @type categorical
% @canonical false
% @original_name Review rating distribution
% @values pct94_5star_3_4star=94pct_5star_3pct_4star unk_review_rating_distribution=Unknown
% @importance 1.0

0.90::acc(s14, review_rating_distribution).

0.92::true_val(review_rating_distribution, pct94_5star_3_4star); 0.08::true_val(review_rating_distribution, unk_review_rating_distribution).

measured(s14, review_rating_distribution, pct94_5star_3_4star).

all_consistent(review_rating_distribution) :-
    consistent(s14, review_rating_distribution).

evidence(all_consistent(review_rating_distribution)).
query(true_val(review_rating_distribution, pct94_5star_3_4star)).
query(true_val(review_rating_distribution, unk_review_rating_distribution)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values overwhelmingly_positive=Overwhelmingly_positive_most_fun_absolute_weapon unk_user_review_forum=Unknown
% @importance 0.775

0.75::acc(s46, user_review_forum).
0.78::acc(s50, user_review_forum).

0.88::true_val(user_review_forum, overwhelmingly_positive); 0.12::true_val(user_review_forum, unk_user_review_forum).

measured(s46, user_review_forum, overwhelmingly_positive).
measured(s50, user_review_forum, overwhelmingly_positive).

all_consistent(user_review_forum) :-
    consistent(s46, user_review_forum),
    consistent(s50, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, overwhelmingly_positive)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr positive_aspect_aesthetics
% @type categorical
% @canonical false
% @original_name positive_aspect (aesthetics)
% @values head_turning=Visual_appeal_head_turning_aesthetics unk_positive_aspect_aesthetics=Unknown
% @importance 0.4

0.72::acc(s57, positive_aspect_aesthetics).

0.75::true_val(positive_aspect_aesthetics, head_turning); 0.25::true_val(positive_aspect_aesthetics, unk_positive_aspect_aesthetics).

measured(s57, positive_aspect_aesthetics, head_turning).

all_consistent(positive_aspect_aesthetics) :-
    consistent(s57, positive_aspect_aesthetics).

evidence(all_consistent(positive_aspect_aesthetics)).
query(true_val(positive_aspect_aesthetics, head_turning)).
query(true_val(positive_aspect_aesthetics, unk_positive_aspect_aesthetics)).

% @attr positive_aspect_versatility
% @type categorical
% @canonical false
% @original_name positive_aspect (versatility)
% @values versatile_beyond_powder=Versatility_beyond_pure_powder_use unk_positive_aspect_versatility=Unknown
% @importance 0.7

0.72::acc(s58, positive_aspect_versatility).

0.78::true_val(positive_aspect_versatility, versatile_beyond_powder); 0.22::true_val(positive_aspect_versatility, unk_positive_aspect_versatility).

measured(s58, positive_aspect_versatility, versatile_beyond_powder).

all_consistent(positive_aspect_versatility) :-
    consistent(s58, positive_aspect_versatility).

evidence(all_consistent(positive_aspect_versatility)).
query(true_val(positive_aspect_versatility, versatile_beyond_powder)).
query(true_val(positive_aspect_versatility, unk_positive_aspect_versatility)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect (high price)
% @values high_price=High_price_staggering_increase unk_negative_aspect=Unknown
% @importance 0.85

0.75::acc(s30, negative_aspect).

0.80::true_val(negative_aspect, high_price); 0.20::true_val(negative_aspect, unk_negative_aspect).

measured(s30, negative_aspect, high_price).

all_consistent(negative_aspect) :-
    consistent(s30, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, high_price)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_durability
% @type categorical
% @canonical false
% @original_name negative_aspect (durability)
% @values durability_concerns=Durability_concerns_for_Bataleon_generally unk_negative_aspect_durability=Unknown
% @importance 0.8

0.72::acc(s59, negative_aspect_durability).

0.78::true_val(negative_aspect_durability, durability_concerns); 0.22::true_val(negative_aspect_durability, unk_negative_aspect_durability).

measured(s59, negative_aspect_durability, durability_concerns).

all_consistent(negative_aspect_durability) :-
    consistent(s59, negative_aspect_durability).

evidence(all_consistent(negative_aspect_durability)).
query(true_val(negative_aspect_durability, durability_concerns)).
query(true_val(negative_aspect_durability, unk_negative_aspect_durability)).

% @attr negative_aspect_not_beginner
% @type categorical
% @canonical false
% @original_name negative_aspect (not for beginners)
% @values not_beginner=Definitely_not_a_beginner_board unk_negative_aspect_not_beginner=Unknown
% @importance 0.85

0.72::acc(s60, negative_aspect_not_beginner).

0.78::true_val(negative_aspect_not_beginner, not_beginner); 0.22::true_val(negative_aspect_not_beginner, unk_negative_aspect_not_beginner).

measured(s60, negative_aspect_not_beginner, not_beginner).

all_consistent(negative_aspect_not_beginner) :-
    consistent(s60, negative_aspect_not_beginner).

evidence(all_consistent(negative_aspect_not_beginner)).
query(true_val(negative_aspect_not_beginner, not_beginner)).
query(true_val(negative_aspect_not_beginner, unk_negative_aspect_not_beginner)).

% @attr negative_aspect_waxing
% @type categorical
% @canonical false
% @original_name negative_aspect (waxing difficulty)
% @values waxing_difficult=3BT_base_makes_waxing_scraping_difficult unk_negative_aspect_waxing=Unknown
% @importance 0.6

0.75::acc(s61, negative_aspect_waxing).

0.78::true_val(negative_aspect_waxing, waxing_difficult); 0.22::true_val(negative_aspect_waxing, unk_negative_aspect_waxing).

measured(s61, negative_aspect_waxing, waxing_difficult).

all_consistent(negative_aspect_waxing) :-
    consistent(s61, negative_aspect_waxing).

evidence(all_consistent(negative_aspect_waxing)).
query(true_val(negative_aspect_waxing, waxing_difficult)).
query(true_val(negative_aspect_waxing, unk_negative_aspect_waxing)).

% @attr user_review_forum_flex
% @type categorical
% @canonical false
% @original_name user_review_forum (flex perception)
% @values never_felt_too_soft=4_10_rated_but_never_felt_too_soft unk_user_review_forum_flex=Unknown
% @importance 0.75

0.78::acc(s32, user_review_forum_flex).

0.80::true_val(user_review_forum_flex, never_felt_too_soft); 0.20::true_val(user_review_forum_flex, unk_user_review_forum_flex).

measured(s32, user_review_forum_flex, never_felt_too_soft).

all_consistent(user_review_forum_flex) :-
    consistent(s32, user_review_forum_flex).

evidence(all_consistent(user_review_forum_flex)).
query(true_val(user_review_forum_flex, never_felt_too_soft)).
query(true_val(user_review_forum_flex, unk_user_review_forum_flex)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values learning_curve=Learning_curve_steering_not_intuitive_initially unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.75

0.82::acc(s54, reviewer_opinion_the_good_ride).

0.85::true_val(reviewer_opinion_the_good_ride, learning_curve); 0.15::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s54, reviewer_opinion_the_good_ride, learning_curve).

all_consistent(reviewer_opinion_the_good_ride) :-
    consistent(s54, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, learning_curve)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values turns_on_dime=Turns_on_a_dime_aggressive_sidecut unk_reviewer_opinion_whitelines=Unknown
% @importance 0.7

0.85::acc(s62, reviewer_opinion_whitelines).

0.88::true_val(reviewer_opinion_whitelines, turns_on_dime); 0.12::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

measured(s62, reviewer_opinion_whitelines, turns_on_dime).

all_consistent(reviewer_opinion_whitelines) :-
    consistent(s62, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, turns_on_dime)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

% @attr reviewer_note_retention
% @type categorical
% @canonical false
% @original_name Reviewer note (The Snow Chasers)
% @values high_retention=People_hang_onto_them_high_owner_retention unk_reviewer_note_retention=Unknown
% @importance 0.7

0.78::acc(s63, reviewer_note_retention).

0.80::true_val(reviewer_note_retention, high_retention); 0.20::true_val(reviewer_note_retention, unk_reviewer_note_retention).

measured(s63, reviewer_note_retention, high_retention).

all_consistent(reviewer_note_retention) :-
    consistent(s63, reviewer_note_retention).

evidence(all_consistent(reviewer_note_retention)).
query(true_val(reviewer_note_retention, high_retention)).
query(true_val(reviewer_note_retention, unk_reviewer_note_retention)).

% @attr user_review_forum_longevity
% @type categorical
% @canonical false
% @original_name user_review_forum (longevity)
% @values still_rips_years_later=2019_model_still_absolutely_rips unk_user_review_forum_longevity=Unknown
% @importance 0.7

0.78::acc(s63, user_review_forum_longevity).

0.80::true_val(user_review_forum_longevity, still_rips_years_later); 0.20::true_val(user_review_forum_longevity, unk_user_review_forum_longevity).

measured(s63, user_review_forum_longevity, still_rips_years_later).

all_consistent(user_review_forum_longevity) :-
    consistent(s63, user_review_forum_longevity).

evidence(all_consistent(user_review_forum_longevity)).
query(true_val(user_review_forum_longevity, still_rips_years_later)).
query(true_val(user_review_forum_longevity, unk_user_review_forum_longevity)).

% @attr return_policy_terms
% @type categorical
% @canonical true
% @original_name return_policy_terms (manufacturer store)
% @values free_ship_2plus1_warranty_45day=Free_shipping_2plus1yr_warranty_45day_return unk_return_policy_terms=Unknown
% @importance 1.0

0.93::acc(s14, return_policy_terms).

0.92::true_val(return_policy_terms, free_ship_2plus1_warranty_45day); 0.08::true_val(return_policy_terms, unk_return_policy_terms).

measured(s14, return_policy_terms, free_ship_2plus1_warranty_45day).

all_consistent(return_policy_terms) :-
    consistent(s14, return_policy_terms).

evidence(all_consistent(return_policy_terms)).
query(true_val(return_policy_terms, free_ship_2plus1_warranty_45day)).
query(true_val(return_policy_terms, unk_return_policy_terms)).

% @attr return_policy_terms_evo
% @type categorical
% @canonical false
% @original_name return_policy_terms (evo)
% @values free_ship_1yr_return_5pct_beat=Free_shipping_1yr_return_5pct_price_beat unk_return_policy_terms_evo=Unknown
% @importance 0.85

0.85::acc(s23, return_policy_terms_evo).

0.88::true_val(return_policy_terms_evo, free_ship_1yr_return_5pct_beat); 0.12::true_val(return_policy_terms_evo, unk_return_policy_terms_evo).

measured(s23, return_policy_terms_evo, free_ship_1yr_return_5pct_beat).

all_consistent(return_policy_terms_evo) :-
    consistent(s23, return_policy_terms_evo).

evidence(all_consistent(return_policy_terms_evo)).
query(true_val(return_policy_terms_evo, free_ship_1yr_return_5pct_beat)).
query(true_val(return_policy_terms_evo, unk_return_policy_terms_evo)).

% @attr retailer_backcountry
% @type categorical
% @canonical false
% @original_name Backcountry.com
% @values major_us_outdoor=Major_US_outdoor_retailer_reputable unk_retailer_backcountry=Unknown
% @importance 0.7

0.80::acc(s24, retailer_backcountry).

0.85::true_val(retailer_backcountry, major_us_outdoor); 0.15::true_val(retailer_backcountry, unk_retailer_backcountry).

measured(s24, retailer_backcountry, major_us_outdoor).

all_consistent(retailer_backcountry) :-
    consistent(s24, retailer_backcountry).

evidence(all_consistent(retailer_backcountry)).
query(true_val(retailer_backcountry, major_us_outdoor)).
query(true_val(retailer_backcountry, unk_retailer_backcountry)).

% @attr retailer_blauer
% @type categorical
% @canonical false
% @original_name Blauer Board Shop
% @values specialty_2025_2027=Specialty_snowboard_retailer_carries_2025_2027 unk_retailer_blauer=Unknown
% @importance 0.7

0.75::acc(s25, retailer_blauer).

0.82::true_val(retailer_blauer, specialty_2025_2027); 0.18::true_val(retailer_blauer, unk_retailer_blauer).

measured(s25, retailer_blauer, specialty_2025_2027).

all_consistent(retailer_blauer) :-
    consistent(s25, retailer_blauer).

evidence(all_consistent(retailer_blauer)).
query(true_val(retailer_blauer, specialty_2025_2027)).
query(true_val(retailer_blauer, unk_retailer_blauer)).

% @attr retailer_darkside
% @type categorical
% @canonical false
% @original_name Darkside Snowboards
% @values established_vt_since_1989=Established_Vermont_retailer_since_1989 unk_retailer_darkside=Unknown
% @importance 0.9

0.80::acc(s22, retailer_darkside).

0.85::true_val(retailer_darkside, established_vt_since_1989); 0.15::true_val(retailer_darkside, unk_retailer_darkside).

measured(s22, retailer_darkside, established_vt_since_1989).

all_consistent(retailer_darkside) :-
    consistent(s22, retailer_darkside).

evidence(all_consistent(retailer_darkside)).
query(true_val(retailer_darkside, established_vt_since_1989)).
query(true_val(retailer_darkside, unk_retailer_darkside)).

% @attr retailer_absolute_snow
% @type categorical
% @canonical false
% @original_name Absolute-Snow (UK)
% @values specialist_uk=Specialist_snow_sports_retailer_UK unk_retailer_absolute_snow=Unknown
% @importance 0.75

0.75::acc(s27, retailer_absolute_snow).

0.82::true_val(retailer_absolute_snow, specialist_uk); 0.18::true_val(retailer_absolute_snow, unk_retailer_absolute_snow).

measured(s27, retailer_absolute_snow, specialist_uk).

all_consistent(retailer_absolute_snow) :-
    consistent(s27, retailer_absolute_snow).

evidence(all_consistent(retailer_absolute_snow)).
query(true_val(retailer_absolute_snow, specialist_uk)).
query(true_val(retailer_absolute_snow, unk_retailer_absolute_snow)).

% @attr retailer_s2as
% @type categorical
% @canonical false
% @original_name S2AS (Surface 2 Air Sports, UK)
% @values uk_authorized_price_match=UK_authorized_retailer_price_match unk_retailer_s2as=Unknown
% @importance 0.5

0.70::acc(s29, retailer_s2as).

0.78::true_val(retailer_s2as, uk_authorized_price_match); 0.22::true_val(retailer_s2as, unk_retailer_s2as).

measured(s29, retailer_s2as, uk_authorized_price_match).

all_consistent(retailer_s2as) :-
    consistent(s29, retailer_s2as).

evidence(all_consistent(retailer_s2as)).
query(true_val(retailer_s2as, uk_authorized_price_match)).
query(true_val(retailer_s2as, unk_retailer_s2as)).

% @attr secondary_market_ebay
% @type categorical
% @canonical false
% @original_name eBay
% @values available_used_new=Secondary_market_used_and_new_available unk_secondary_market_ebay=Unknown
% @importance 0.5

0.65::acc(s64, secondary_market_ebay).

0.72::true_val(secondary_market_ebay, available_used_new); 0.28::true_val(secondary_market_ebay, unk_secondary_market_ebay).

measured(s64, secondary_market_ebay, available_used_new).

all_consistent(secondary_market_ebay) :-
    consistent(s64, secondary_market_ebay).

evidence(all_consistent(secondary_market_ebay)).
query(true_val(secondary_market_ebay, available_used_new)).
query(true_val(secondary_market_ebay, unk_secondary_market_ebay)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand (Burton Fish 3D)
% @values burton_fish_3d=Burton_Fish_3D_679_95_USD unk_comparable_board_cross_brand=Unknown
% @importance 0.8

0.82::acc(s65, comparable_board_cross_brand).

0.85::true_val(comparable_board_cross_brand, burton_fish_3d); 0.15::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s65, comparable_board_cross_brand, burton_fish_3d).

all_consistent(comparable_board_cross_brand) :-
    consistent(s65, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, burton_fish_3d)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_mind_expander
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Jones Mind Expander)
% @values jones_mind_expander=Jones_Mind_Expander_599_95_USD unk_comparable_board_cross_brand_mind_expander=Unknown
% @importance 0.8

0.80::acc(s66, comparable_board_cross_brand_mind_expander).

0.83::true_val(comparable_board_cross_brand_mind_expander, jones_mind_expander); 0.17::true_val(comparable_board_cross_brand_mind_expander, unk_comparable_board_cross_brand_mind_expander).

measured(s66, comparable_board_cross_brand_mind_expander, jones_mind_expander).

all_consistent(comparable_board_cross_brand_mind_expander) :-
    consistent(s66, comparable_board_cross_brand_mind_expander).

evidence(all_consistent(comparable_board_cross_brand_mind_expander)).
query(true_val(comparable_board_cross_brand_mind_expander, jones_mind_expander)).
query(true_val(comparable_board_cross_brand_mind_expander, unk_comparable_board_cross_brand_mind_expander)).

% @attr comparable_board_cross_brand_flagship_pro
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Jones Flagship Pro)
% @values jones_flagship_pro=Jones_Flagship_Pro_899_95_USD unk_comparable_board_cross_brand_flagship_pro=Unknown
% @importance 0.8

0.80::acc(s67, comparable_board_cross_brand_flagship_pro).

0.83::true_val(comparable_board_cross_brand_flagship_pro, jones_flagship_pro); 0.17::true_val(comparable_board_cross_brand_flagship_pro, unk_comparable_board_cross_brand_flagship_pro).

measured(s67, comparable_board_cross_brand_flagship_pro, jones_flagship_pro).

all_consistent(comparable_board_cross_brand_flagship_pro) :-
    consistent(s67, comparable_board_cross_brand_flagship_pro).

evidence(all_consistent(comparable_board_cross_brand_flagship_pro)).
query(true_val(comparable_board_cross_brand_flagship_pro, jones_flagship_pro)).
query(true_val(comparable_board_cross_brand_flagship_pro, unk_comparable_board_cross_brand_flagship_pro)).

% @attr comparable_board_cross_brand_golden_orca
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Lib Tech Golden Orca)
% @values lib_tech_golden_orca=Lib_Tech_T_Rice_Golden_Orca_849_99_USD unk_comparable_board_cross_brand_golden_orca=Unknown
% @importance 0.8

0.82::acc(s68, comparable_board_cross_brand_golden_orca).

0.85::true_val(comparable_board_cross_brand_golden_orca, lib_tech_golden_orca); 0.15::true_val(comparable_board_cross_brand_golden_orca, unk_comparable_board_cross_brand_golden_orca).

measured(s68, comparable_board_cross_brand_golden_orca, lib_tech_golden_orca).

all_consistent(comparable_board_cross_brand_golden_orca) :-
    consistent(s68, comparable_board_cross_brand_golden_orca).

evidence(all_consistent(comparable_board_cross_brand_golden_orca)).
query(true_val(comparable_board_cross_brand_golden_orca, lib_tech_golden_orca)).
query(true_val(comparable_board_cross_brand_golden_orca, unk_comparable_board_cross_brand_golden_orca)).

% @attr comparable_board_cross_brand_forma
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Season Forma)
% @values season_forma=Season_Forma_699_95_USD_best_powder_Inertia unk_comparable_board_cross_brand_forma=Unknown
% @importance 0.7

0.78::acc(s69, comparable_board_cross_brand_forma).

0.82::true_val(comparable_board_cross_brand_forma, season_forma); 0.18::true_val(comparable_board_cross_brand_forma, unk_comparable_board_cross_brand_forma).

measured(s69, comparable_board_cross_brand_forma, season_forma).

all_consistent(comparable_board_cross_brand_forma) :-
    consistent(s69, comparable_board_cross_brand_forma).

evidence(all_consistent(comparable_board_cross_brand_forma)).
query(true_val(comparable_board_cross_brand_forma, season_forma)).
query(true_val(comparable_board_cross_brand_forma, unk_comparable_board_cross_brand_forma)).

% @attr comparable_board_cross_brand_powder_racers
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (CAPiTA Spring Break)
% @values capita_powder_racers=CAPiTA_Spring_Break_Powder_Racers_649_95_USD unk_comparable_board_cross_brand_powder_racers=Unknown
% @importance 0.7

0.78::acc(s70, comparable_board_cross_brand_powder_racers).

0.82::true_val(comparable_board_cross_brand_powder_racers, capita_powder_racers); 0.18::true_val(comparable_board_cross_brand_powder_racers, unk_comparable_board_cross_brand_powder_racers).

measured(s70, comparable_board_cross_brand_powder_racers, capita_powder_racers).

all_consistent(comparable_board_cross_brand_powder_racers) :-
    consistent(s70, comparable_board_cross_brand_powder_racers).

evidence(all_consistent(comparable_board_cross_brand_powder_racers)).
query(true_val(comparable_board_cross_brand_powder_racers, capita_powder_racers)).
query(true_val(comparable_board_cross_brand_powder_racers, unk_comparable_board_cross_brand_powder_racers)).

% @attr comparable_board_cross_brand_k2_special
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (K2 Special Effects)
% @values k2_special_effects=K2_Special_Effects_Japan_powder_alternative unk_comparable_board_cross_brand_k2_special=Unknown
% @importance 0.55

0.65::acc(s71, comparable_board_cross_brand_k2_special).

0.72::true_val(comparable_board_cross_brand_k2_special, k2_special_effects); 0.28::true_val(comparable_board_cross_brand_k2_special, unk_comparable_board_cross_brand_k2_special).

measured(s71, comparable_board_cross_brand_k2_special, k2_special_effects).

all_consistent(comparable_board_cross_brand_k2_special) :-
    consistent(s71, comparable_board_cross_brand_k2_special).

evidence(all_consistent(comparable_board_cross_brand_k2_special)).
query(true_val(comparable_board_cross_brand_k2_special, k2_special_effects)).
query(true_val(comparable_board_cross_brand_k2_special, unk_comparable_board_cross_brand_k2_special)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values bataleon_cruiser=Bataleon_Cruiser_more_versatile unk_comparable_board_same_brand=Unknown
% @importance 0.55

0.65::acc(s72, comparable_board_same_brand).

0.72::true_val(comparable_board_same_brand, bataleon_cruiser); 0.28::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s72, comparable_board_same_brand, bataleon_cruiser).

all_consistent(comparable_board_same_brand) :-
    consistent(s72, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, bataleon_cruiser)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr price_positioning
% @type categorical
% @canonical false
% @original_name Price positioning
% @values significantly_more_expensive=Significantly_more_expensive_1099_vs_600_900 unk_price_positioning=Unknown
% @importance 0.925

0.90::acc(s14, price_positioning).
0.82::acc(s31, price_positioning).

0.92::true_val(price_positioning, significantly_more_expensive); 0.08::true_val(price_positioning, unk_price_positioning).

measured(s14, price_positioning, significantly_more_expensive).
measured(s31, price_positioning, significantly_more_expensive).

all_consistent(price_positioning) :-
    consistent(s14, price_positioning),
    consistent(s31, price_positioning).

evidence(all_consistent(price_positioning)).
query(true_val(price_positioning, significantly_more_expensive)).
query(true_val(price_positioning, unk_price_positioning)).

% @attr setback
% @type numeric
% @canonical true
% @original_name setback
% @unit mm
% @values v_neg25=neg25 unk_setback=Unknown
% @importance 0.675

0.78::acc(s41, setback).
0.75::acc(s73, setback).

0.88::true_val(setback, v_neg25); 0.12::true_val(setback, unk_setback).

measured(s41, setback, v_neg25).
measured(s73, setback, v_neg25).

all_consistent(setback) :-
    (indep(s41), consistent(s41, setback) ; \+indep(s41)),
    consistent(s73, setback).

evidence(all_consistent(setback)).
query(true_val(setback, v_neg25)).
query(true_val(setback, unk_setback)).

% @attr board_weight_grams
% @type numeric
% @canonical true
% @original_name board_weight_grams
% @unit grams
% @values v3000=3000 unk_board_weight_grams=Unknown
% @importance 0.65

0.72::acc(s73, board_weight_grams).

0.75::true_val(board_weight_grams, v3000); 0.25::true_val(board_weight_grams, unk_board_weight_grams).

measured(s73, board_weight_grams, v3000).

all_consistent(board_weight_grams) :-
    consistent(s73, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v3000)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr taper
% @type numeric
% @canonical false
% @original_name taper
% @unit mm
% @values v28=28 unk_taper=Unknown
% @importance 0.65

0.72::acc(s73, taper).

0.75::true_val(taper, v28); 0.25::true_val(taper, unk_taper).

measured(s73, taper, v28).

all_consistent(taper) :-
    consistent(s73, taper).

evidence(all_consistent(taper)).
query(true_val(taper, v28)).
query(true_val(taper, unk_taper)).

% @attr contact_length_size
% @type numeric
% @canonical true
% @original_name contact_length_size
% @unit mm
% @values v1160=1160 unk_contact_length_size=Unknown
% @importance 0.65

0.72::acc(s73, contact_length_size).

0.75::true_val(contact_length_size, v1160); 0.25::true_val(contact_length_size, unk_contact_length_size).

measured(s73, contact_length_size, v1160).

all_consistent(contact_length_size) :-
    consistent(s73, contact_length_size).

evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v1160)).
query(true_val(contact_length_size, unk_contact_length_size)).

% @attr camber_height_mm
% @type numeric
% @canonical true
% @original_name camber_height_mm
% @unit mm
% @values v12=12 unk_camber_height_mm=Unknown
% @importance 0.65

0.72::acc(s73, camber_height_mm).

0.75::true_val(camber_height_mm, v12); 0.25::true_val(camber_height_mm, unk_camber_height_mm).

measured(s73, camber_height_mm, v12).

all_consistent(camber_height_mm) :-
    consistent(s73, camber_height_mm).

evidence(all_consistent(camber_height_mm)).
query(true_val(camber_height_mm, v12)).
query(true_val(camber_height_mm, unk_camber_height_mm)).

% @attr sidecut_type
% @type categorical
% @canonical false
% @original_name sidecut_type
% @values progressive=Progressive_sidecut unk_sidecut_type=Unknown
% @importance 0.9

0.93::acc(s2, sidecut_type).

0.92::true_val(sidecut_type, progressive); 0.08::true_val(sidecut_type, unk_sidecut_type).

measured(s2, sidecut_type, progressive).

all_consistent(sidecut_type) :-
    consistent(s2, sidecut_type).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, progressive)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr binding_compatibility
% @type categorical
% @canonical false
% @original_name binding_compatibility
% @values standard_2x4_all_major=Standard_2x4_compatible_all_major_brands unk_binding_compatibility=Unknown
% @importance 0.85

0.88::acc(sm, binding_compatibility).

0.90::true_val(binding_compatibility, standard_2x4_all_major); 0.10::true_val(binding_compatibility, unk_binding_compatibility).

measured(sm, binding_compatibility, standard_2x4_all_major).

all_consistent(binding_compatibility) :-
    consistent(sm, binding_compatibility).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, standard_2x4_all_major)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

% @attr construction_style
% @type categorical
% @canonical false
% @original_name Construction style
% @values sandwich_sidewall=Sandwich_construction_sidewall unk_construction_style=Unknown
% @importance 1.0

0.93::acc(s14, construction_style).

0.92::true_val(construction_style, sandwich_sidewall); 0.08::true_val(construction_style, unk_construction_style).

measured(s14, construction_style, sandwich_sidewall).

all_consistent(construction_style) :-
    consistent(s14, construction_style).

evidence(all_consistent(construction_style)).
query(true_val(construction_style, sandwich_sidewall)).
query(true_val(construction_style, unk_construction_style)).

% @attr bataleon_usp
% @type categorical
% @canonical false
% @original_name Bataleon's USP
% @values only_company_all_3bt=Only_company_making_all_boards_with_3BT unk_bataleon_usp=Unknown
% @importance 0.6

0.78::acc(s74, bataleon_usp).

0.82::true_val(bataleon_usp, only_company_all_3bt); 0.18::true_val(bataleon_usp, unk_bataleon_usp).

measured(s74, bataleon_usp, only_company_all_3bt).

all_consistent(bataleon_usp) :-
    consistent(s74, bataleon_usp).

evidence(all_consistent(bataleon_usp)).
query(true_val(bataleon_usp, only_company_all_3bt)).
query(true_val(bataleon_usp, unk_bataleon_usp)).

% @attr three_bt_patent_status
% @type categorical
% @canonical false
% @original_name 3BT patent status
% @values patented_exclusive=Patented_and_exclusive_to_Bataleon unk_three_bt_patent_status=Unknown
% @importance 0.5

0.75::acc(s75, three_bt_patent_status).

0.80::true_val(three_bt_patent_status, patented_exclusive); 0.20::true_val(three_bt_patent_status, unk_three_bt_patent_status).

measured(s75, three_bt_patent_status, patented_exclusive).

all_consistent(three_bt_patent_status) :-
    consistent(s75, three_bt_patent_status).

evidence(all_consistent(three_bt_patent_status)).
query(true_val(three_bt_patent_status, patented_exclusive)).
query(true_val(three_bt_patent_status, unk_three_bt_patent_status)).

% @attr nidecker_acquisition
% @type categorical
% @canonical false
% @original_name Nidecker Group acquisition
% @values acquired_2018=Nidecker_acquired_Low_Pressure_Studio_2018 unk_nidecker_acquisition=Unknown
% @importance 0.6

0.85::acc(s4, nidecker_acquisition).

0.90::true_val(nidecker_acquisition, acquired_2018); 0.10::true_val(nidecker_acquisition, unk_nidecker_acquisition).

measured(s4, nidecker_acquisition, acquired_2018).

all_consistent(nidecker_acquisition) :-
    consistent(s4, nidecker_acquisition).

evidence(all_consistent(nidecker_acquisition)).
query(true_val(nidecker_acquisition, acquired_2018)).
query(true_val(nidecker_acquisition, unk_nidecker_acquisition)).

% @attr nidecker_ranking
% @type categorical
% @canonical false
% @original_name Nidecker Group is considered the second biggest snowboard company
% @values second_biggest=Second_biggest_snowboard_company_world unk_nidecker_ranking=Unknown
% @importance 0.4

0.75::acc(s76, nidecker_ranking).

0.80::true_val(nidecker_ranking, second_biggest); 0.20::true_val(nidecker_ranking, unk_nidecker_ranking).

measured(s76, nidecker_ranking, second_biggest).

all_consistent(nidecker_ranking) :-
    consistent(s76, nidecker_ranking).

evidence(all_consistent(nidecker_ranking)).
query(true_val(nidecker_ranking, second_biggest)).
query(true_val(nidecker_ranking, unk_nidecker_ranking)).

% @attr bataleon_full_range
% @type categorical
% @canonical false
% @original_name Bataleon produces full range
% @values full_range=Snowboards_boots_bindings_all_categories unk_bataleon_full_range=Unknown
% @importance 0.35

0.72::acc(s77, bataleon_full_range).

0.78::true_val(bataleon_full_range, full_range); 0.22::true_val(bataleon_full_range, unk_bataleon_full_range).

measured(s77, bataleon_full_range, full_range).

all_consistent(bataleon_full_range) :-
    consistent(s77, bataleon_full_range).

evidence(all_consistent(bataleon_full_range)).
query(true_val(bataleon_full_range, full_range)).
query(true_val(bataleon_full_range, unk_bataleon_full_range)).

% @attr brand_presence
% @type categorical
% @canonical false
% @original_name Brand presence
% @values global_na_eu_jp_au=Available_globally_NA_Europe_Japan_Australasia unk_brand_presence=Unknown
% @importance 0.35

0.72::acc(s78, brand_presence).

0.78::true_val(brand_presence, global_na_eu_jp_au); 0.22::true_val(brand_presence, unk_brand_presence).

measured(s78, brand_presence, global_na_eu_jp_au).

all_consistent(brand_presence) :-
    consistent(s78, brand_presence).

evidence(all_consistent(brand_presence)).
query(true_val(brand_presence, global_na_eu_jp_au)).
query(true_val(brand_presence, unk_brand_presence)).

% @attr availability_status_au_limited
% @type categorical
% @canonical false
% @original_name availability_status (AU limited allocation)
% @values limited_handful=Limited_allocation_handful_per_year_Australia unk_availability_status_au_limited=Unknown
% @importance 0.65

0.72::acc(s79, availability_status_au_limited).

0.78::true_val(availability_status_au_limited, limited_handful); 0.22::true_val(availability_status_au_limited, unk_availability_status_au_limited).

measured(s79, availability_status_au_limited, limited_handful).

all_consistent(availability_status_au_limited) :-
    consistent(s79, availability_status_au_limited).

evidence(all_consistent(availability_status_au_limited)).
query(true_val(availability_status_au_limited, limited_handful)).
query(true_val(availability_status_au_limited, unk_availability_status_au_limited)).