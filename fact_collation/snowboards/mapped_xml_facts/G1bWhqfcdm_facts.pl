0.15::indep(s1).
0.12::indep(s4).
0.15::indep(s6).
0.15::indep(s8).
0.12::indep(s9).
0.20::indep(s10).
0.15::indep(s14).
0.15::indep(s16).
0.20::indep(s17).
0.15::indep(s38).
0.10::indep(s39).
0.12::indep(s40).
0.15::indep(s80).
0.12::indep(s92).
0.15::indep(s94).
0.15::indep(s_m).
0.15::indep(s28).
0.12::indep(s74).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

0.88::acc(s1, brand).
0.85::acc(s6, brand).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values burton=Burton unk_brand=Unknown
% @importance 0.88

0.95::true_val(brand, burton); 0.05::true_val(brand, unk_brand).

measured(s1, brand, burton).
measured(s6, brand, burton).

all_consistent(brand) :-
    (indep(s1), consistent(s1, brand) ; \+indep(s1)),
    (indep(s6), consistent(s6, brand) ; \+indep(s6)).

evidence(all_consistent(brand)).
query(true_val(brand, burton)).
query(true_val(brand, unk_brand)).

0.88::acc(s1, model_name).
0.85::acc(s6, model_name).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values custom_flying_v=Custom_Flying_V unk_model_name=Unknown
% @importance 0.88

0.95::true_val(model_name, custom_flying_v); 0.05::true_val(model_name, unk_model_name).

measured(s1, model_name, custom_flying_v).
measured(s6, model_name, custom_flying_v).

all_consistent(model_name) :-
    (indep(s1), consistent(s1, model_name) ; \+indep(s1)),
    (indep(s6), consistent(s6, model_name) ; \+indep(s6)).

evidence(all_consistent(model_name)).
query(true_val(model_name, custom_flying_v)).
query(true_val(model_name, unk_model_name)).

0.93::acc(s_m, model_year).
0.88::acc(s9, model_year).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2027=2027 unk_model_year=Unknown
% @importance 0.78

0.95::true_val(model_year, y2027); 0.05::true_val(model_year, unk_model_year).

measured(s_m, model_year, y2027).
measured(s9, model_year, y2027).

all_consistent(model_year) :-
    (indep(s_m), consistent(s_m, model_year) ; \+indep(s_m)),
    (indep(s9), consistent(s9, model_year) ; \+indep(s9)).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2027)).
query(true_val(model_year, unk_model_year)).

0.88::acc(s1, product_type).
0.85::acc(s6, product_type).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.88

0.95::true_val(product_type, snowboard); 0.05::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).
measured(s6, product_type, snowboard).

all_consistent(product_type) :-
    (indep(s1), consistent(s1, product_type) ; \+indep(s1)),
    (indep(s6), consistent(s6, product_type) ; \+indep(s6)).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

0.85::acc(s6, board_category).
0.88::acc(s10, board_category).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain=All_Mountain unk_board_category=Unknown
% @importance 0.88

0.95::true_val(board_category, all_mountain); 0.05::true_val(board_category, unk_board_category).

measured(s6, board_category, all_mountain).
measured(s10, board_category, all_mountain).

all_consistent(board_category) :-
    (indep(s6), consistent(s6, board_category) ; \+indep(s6)),
    (indep(s10), consistent(s10, board_category) ; \+indep(s10)).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain)).
query(true_val(board_category, unk_board_category)).

0.88::acc(s1, gender).
0.88::acc(s10, gender).
0.90::acc(s47, gender).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.80

0.95::true_val(gender, mens); 0.05::true_val(gender, unk_gender).

measured(s1, gender, mens).
measured(s10, gender, mens).
measured(s47, gender, mens).

all_consistent(gender) :-
    (indep(s1), consistent(s1, gender) ; \+indep(s1)),
    (indep(s10), consistent(s10, gender) ; \+indep(s10)),
    consistent(s47, gender).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

0.82::acc(s6, manufacturer).
0.80::acc(s10, manufacturer).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values burton_snowboards=Burton_Snowboards_Vermont_1977 unk_manufacturer=Unknown
% @importance 0.58

0.95::true_val(manufacturer, burton_snowboards); 0.05::true_val(manufacturer, unk_manufacturer).

measured(s6, manufacturer, burton_snowboards).
measured(s10, manufacturer, burton_snowboards).

all_consistent(manufacturer) :-
    (indep(s6), consistent(s6, manufacturer) ; \+indep(s6)),
    (indep(s10), consistent(s10, manufacturer) ; \+indep(s10)).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, burton_snowboards)).
query(true_val(manufacturer, unk_manufacturer)).

0.93::acc(s63, model_first_available_year).
0.85::acc(s64, model_first_available_year).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2010_2011=2010_2011_season unk_model_first_available_year=Unknown
% @importance 0.45

0.90::true_val(model_first_available_year, season_2010_2011); 0.10::true_val(model_first_available_year, unk_model_first_available_year).

measured(s63, model_first_available_year, season_2010_2011).
measured(s64, model_first_available_year, season_2010_2011).

all_consistent(model_first_available_year) :-
    consistent(s63, model_first_available_year),
    consistent(s64, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2010_2011)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

0.95::acc(s42, model_first_available_year_custom_series).
0.90::acc(s47, model_first_available_year_custom_series).

% @attr model_first_available_year_custom_series
% @type categorical
% @canonical false
% @original_name model_first_available_year (Custom series)
% @values season_1995_96=1995_96_season unk_model_first_available_year_custom_series=Unknown
% @importance 0.55

0.95::true_val(model_first_available_year_custom_series, season_1995_96); 0.05::true_val(model_first_available_year_custom_series, unk_model_first_available_year_custom_series).

measured(s42, model_first_available_year_custom_series, season_1995_96).
measured(s47, model_first_available_year_custom_series, season_1995_96).

all_consistent(model_first_available_year_custom_series) :-
    consistent(s42, model_first_available_year_custom_series),
    consistent(s47, model_first_available_year_custom_series).

evidence(all_consistent(model_first_available_year_custom_series)).
query(true_val(model_first_available_year_custom_series, season_1995_96)).
query(true_val(model_first_available_year_custom_series, unk_model_first_available_year_custom_series)).

0.95::acc(s42, model_series).
0.88::acc(s44, model_series).

% @attr model_series
% @type categorical
% @canonical false
% @original_name Model series
% @values burton_custom=Burton_Custom_longest_running unk_model_series=Unknown
% @importance 0.50

0.95::true_val(model_series, burton_custom); 0.05::true_val(model_series, unk_model_series).

measured(s42, model_series, burton_custom).
measured(s44, model_series, burton_custom).

all_consistent(model_series) :-
    consistent(s42, model_series),
    consistent(s44, model_series).

evidence(all_consistent(model_series)).
query(true_val(model_series, burton_custom)).
query(true_val(model_series, unk_model_series)).

0.80::acc(s42, best_selling_claim).
0.65::acc(s48, best_selling_claim).

% @attr best_selling_claim
% @type categorical
% @canonical false
% @original_name Best-selling snowboard of all time (marketing claim)
% @values yes_marketing=Yes_marketing_claim unk_best_selling_claim=Unknown
% @importance 0.38

0.80::true_val(best_selling_claim, yes_marketing); 0.20::true_val(best_selling_claim, unk_best_selling_claim).

measured(s42, best_selling_claim, yes_marketing).
measured(s48, best_selling_claim, yes_marketing).

all_consistent(best_selling_claim) :-
    consistent(s42, best_selling_claim),
    consistent(s48, best_selling_claim).

evidence(all_consistent(best_selling_claim)).
query(true_val(best_selling_claim, yes_marketing)).
query(true_val(best_selling_claim, unk_best_selling_claim)).

0.85::acc(s12, comparable_board_same_brand).
0.78::acc(s40, comparable_board_same_brand).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values custom_camber=Burton_Custom_Camber unk_comparable_board_same_brand=Unknown
% @importance 0.65

0.92::true_val(comparable_board_same_brand, custom_camber); 0.08::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s12, comparable_board_same_brand, custom_camber).
measured(s40, comparable_board_same_brand, custom_camber).

all_consistent(comparable_board_same_brand) :-
    consistent(s12, comparable_board_same_brand),
    (indep(s40), consistent(s40, comparable_board_same_brand) ; \+indep(s40)).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, custom_camber)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

0.88::acc(s9, available_colors).
0.85::acc(s6, available_colors).

% @attr available_colors
% @type categorical
% @canonical true
% @original_name available_colors
% @values jungle=Jungle unk_available_colors=Unknown
% @importance 0.78

0.92::true_val(available_colors, jungle); 0.08::true_val(available_colors, unk_available_colors).

measured(s9, available_colors, jungle).
measured(s6, available_colors, jungle).

all_consistent(available_colors) :-
    (indep(s9), consistent(s9, available_colors) ; \+indep(s9)),
    (indep(s6), consistent(s6, available_colors) ; \+indep(s6)).

evidence(all_consistent(available_colors)).
query(true_val(available_colors, jungle)).
query(true_val(available_colors, unk_available_colors)).

0.92::acc(s42, custom_30th_anniversary).
0.95::acc(s46, custom_30th_anniversary).

% @attr custom_30th_anniversary
% @type categorical
% @canonical false
% @original_name 30th anniversary of the Custom series
% @values celebrated_2025=Celebrated_in_2025 unk_custom_30th_anniversary=Unknown
% @importance 0.48

0.95::true_val(custom_30th_anniversary, celebrated_2025); 0.05::true_val(custom_30th_anniversary, unk_custom_30th_anniversary).

measured(s42, custom_30th_anniversary, celebrated_2025).
measured(s46, custom_30th_anniversary, celebrated_2025).

all_consistent(custom_30th_anniversary) :-
    consistent(s42, custom_30th_anniversary),
    consistent(s46, custom_30th_anniversary).

evidence(all_consistent(custom_30th_anniversary)).
query(true_val(custom_30th_anniversary, celebrated_2025)).
query(true_val(custom_30th_anniversary, unk_custom_30th_anniversary)).

0.97::acc(s6, price_aud_merchant).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v999_99=999.99 unk_price_aud_merchant=Unknown
% @importance 0.70

0.92::true_val(price_aud_merchant, v999_99); 0.08::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s6, price_aud_merchant, v999_99).

all_consistent(price_aud_merchant) :-
    (indep(s6), consistent(s6, price_aud_merchant) ; \+indep(s6)).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v999_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

0.97::acc(s74, price_aud_merchant_twelve_board).

% @attr price_aud_merchant_twelve_board
% @type numeric
% @unit AUD
% @canonical false
% @original_name price_aud_merchant (Twelve Board Store)
% @values v1019_00=1019.00 unk_price_aud_merchant_twelve_board=Unknown
% @importance 0.85

0.93::true_val(price_aud_merchant_twelve_board, v1019_00); 0.07::true_val(price_aud_merchant_twelve_board, unk_price_aud_merchant_twelve_board).

measured(s74, price_aud_merchant_twelve_board, v1019_00).

all_consistent(price_aud_merchant_twelve_board) :-
    (indep(s74), consistent(s74, price_aud_merchant_twelve_board) ; \+indep(s74)).

evidence(all_consistent(price_aud_merchant_twelve_board)).
query(true_val(price_aud_merchant_twelve_board, v1019_00)).
query(true_val(price_aud_merchant_twelve_board, unk_price_aud_merchant_twelve_board)).

0.97::acc(s_m, price_aud_merchant_melbourne).

% @attr price_aud_merchant_melbourne
% @type numeric
% @unit AUD
% @canonical false
% @original_name price_aud_merchant (Melbourne Snowboard Centre)
% @values v1049_99=1049.99 unk_price_aud_merchant_melbourne=Unknown
% @importance 0.85

0.95::true_val(price_aud_merchant_melbourne, v1049_99); 0.05::true_val(price_aud_merchant_melbourne, unk_price_aud_merchant_melbourne).

measured(s_m, price_aud_merchant_melbourne, v1049_99).

all_consistent(price_aud_merchant_melbourne) :-
    (indep(s_m), consistent(s_m, price_aud_merchant_melbourne) ; \+indep(s_m)).

evidence(all_consistent(price_aud_merchant_melbourne)).
query(true_val(price_aud_merchant_melbourne, v1049_99)).
query(true_val(price_aud_merchant_melbourne, unk_price_aud_merchant_melbourne)).

0.95::acc(s92, price_usd_msrp).
0.93::acc(s38, price_usd_msrp).
0.95::acc(s94, price_usd_msrp).
0.88::acc(s36, price_usd_msrp).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v679_95=679.95 unk_price_usd_msrp=Unknown
% @importance 0.90

0.97::true_val(price_usd_msrp, v679_95); 0.03::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s92, price_usd_msrp, v679_95).
measured(s38, price_usd_msrp, v679_95).
measured(s94, price_usd_msrp, v679_95).
measured(s36, price_usd_msrp, v679_95).

all_consistent(price_usd_msrp) :-
    (indep(s92), consistent(s92, price_usd_msrp) ; \+indep(s92)),
    (indep(s38), consistent(s38, price_usd_msrp) ; \+indep(s38)),
    (indep(s94), consistent(s94, price_usd_msrp) ; \+indep(s94)),
    consistent(s36, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v679_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

0.88::acc(s36, price_usd_evo).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_evo
% @values v509_96=509.96 unk_price_usd_evo=Unknown
% @importance 0.85

0.85::true_val(price_usd_evo, v509_96); 0.15::true_val(price_usd_evo, unk_price_usd_evo).

measured(s36, price_usd_evo, v509_96).

all_consistent(price_usd_evo) :-
    consistent(s36, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v509_96)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

0.95::acc(s94, price_usd_evo_full).

% @attr price_usd_evo_full
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_evo (full price)
% @values v679_95=679.95 unk_price_usd_evo_full=Unknown
% @importance 0.90

0.93::true_val(price_usd_evo_full, v679_95); 0.07::true_val(price_usd_evo_full, unk_price_usd_evo_full).

measured(s94, price_usd_evo_full, v679_95).

all_consistent(price_usd_evo_full) :-
    (indep(s94), consistent(s94, price_usd_evo_full) ; \+indep(s94)).

evidence(all_consistent(price_usd_evo_full)).
query(true_val(price_usd_evo_full, v679_95)).
query(true_val(price_usd_evo_full, unk_price_usd_evo_full)).

0.88::acc(s36, price_cad_burton).

% @attr price_cad_burton
% @type numeric
% @unit CAD
% @canonical false
% @original_name CAD price at Burton Canada (prior season)
% @values v879_99=879.99 unk_price_cad_burton=Unknown
% @importance 0.80

0.85::true_val(price_cad_burton, v879_99); 0.15::true_val(price_cad_burton, unk_price_cad_burton).

measured(s36, price_cad_burton, v879_99).

all_consistent(price_cad_burton) :-
    consistent(s36, price_cad_burton).

evidence(all_consistent(price_cad_burton)).
query(true_val(price_cad_burton, v879_99)).
query(true_val(price_cad_burton, unk_price_cad_burton)).

0.85::acc(s36, price_eur_snowcountry).

% @attr price_eur_snowcountry
% @type numeric
% @unit EUR
% @canonical false
% @original_name EUR price at SnowCountry (prior season)
% @values v599_00=599.00 unk_price_eur_snowcountry=Unknown
% @importance 0.80

0.82::true_val(price_eur_snowcountry, v599_00); 0.18::true_val(price_eur_snowcountry, unk_price_eur_snowcountry).

measured(s36, price_eur_snowcountry, v599_00).

all_consistent(price_eur_snowcountry) :-
    consistent(s36, price_eur_snowcountry).

evidence(all_consistent(price_eur_snowcountry)).
query(true_val(price_eur_snowcountry, v599_00)).
query(true_val(price_eur_snowcountry, unk_price_eur_snowcountry)).

0.90::acc(s9, estimated_availability_date).

% @attr estimated_availability_date
% @type categorical
% @canonical true
% @original_name estimated_availability_date
% @values april_2026=Expected_delivery_April_2026 unk_estimated_availability_date=Unknown
% @importance 0.70

0.88::true_val(estimated_availability_date, april_2026); 0.12::true_val(estimated_availability_date, unk_estimated_availability_date).

measured(s9, estimated_availability_date, april_2026).

all_consistent(estimated_availability_date) :-
    (indep(s9), consistent(s9, estimated_availability_date) ; \+indep(s9)).

evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, april_2026)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

0.93::acc(s_m, shipping_restriction_au).

% @attr shipping_restriction_au
% @type categorical
% @canonical false
% @original_name Shipping restriction (AU merchant)
% @values au_only=Only_ships_within_Australia unk_shipping_restriction_au=Unknown
% @importance 0.85

0.93::true_val(shipping_restriction_au, au_only); 0.07::true_val(shipping_restriction_au, unk_shipping_restriction_au).

measured(s_m, shipping_restriction_au, au_only).

all_consistent(shipping_restriction_au) :-
    (indep(s_m), consistent(s_m, shipping_restriction_au) ; \+indep(s_m)).

evidence(all_consistent(shipping_restriction_au)).
query(true_val(shipping_restriction_au, au_only)).
query(true_val(shipping_restriction_au, unk_shipping_restriction_au)).

0.85::acc(s1, availability_status).
0.85::acc(s10, availability_status).
0.82::acc(s14, availability_status).
0.80::acc(s16, availability_status).
0.82::acc(s38, availability_status).
0.80::acc(s39, availability_status).
0.78::acc(s8, availability_status).
0.80::acc(s92, availability_status).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values major_us_retailers=Burton_evo_REI_Backcountry_TheHouse_ERIKS_PeterGlenn_SaltyPeaks_Amazon unk_availability_status=Unknown
% @importance 0.70

0.95::true_val(availability_status, major_us_retailers); 0.05::true_val(availability_status, unk_availability_status).

measured(s1, availability_status, major_us_retailers).
measured(s10, availability_status, major_us_retailers).
measured(s14, availability_status, major_us_retailers).
measured(s16, availability_status, major_us_retailers).
measured(s38, availability_status, major_us_retailers).
measured(s39, availability_status, major_us_retailers).
measured(s8, availability_status, major_us_retailers).
measured(s92, availability_status, major_us_retailers).

all_consistent(availability_status) :-
    (indep(s1), consistent(s1, availability_status) ; \+indep(s1)),
    (indep(s10), consistent(s10, availability_status) ; \+indep(s10)),
    (indep(s14), consistent(s14, availability_status) ; \+indep(s14)),
    (indep(s16), consistent(s16, availability_status) ; \+indep(s16)),
    (indep(s38), consistent(s38, availability_status) ; \+indep(s38)),
    (indep(s39), consistent(s39, availability_status) ; \+indep(s39)),
    (indep(s8), consistent(s8, availability_status) ; \+indep(s8)),
    (indep(s92), consistent(s92, availability_status) ; \+indep(s92)).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, major_us_retailers)).
query(true_val(availability_status, unk_availability_status)).

0.88::acc(s_m, availability_status_au).
0.85::acc(s74, availability_status_au).
0.85::acc(s6, availability_status_au).

% @attr availability_status_au
% @type categorical
% @canonical false
% @original_name availability_status (AU retailers)
% @values au_retailers=Melbourne_Auski_TwelveBoard_Elevation107_Rhythm unk_availability_status_au=Unknown
% @importance 0.78

0.95::true_val(availability_status_au, au_retailers); 0.05::true_val(availability_status_au, unk_availability_status_au).

measured(s_m, availability_status_au, au_retailers).
measured(s74, availability_status_au, au_retailers).
measured(s6, availability_status_au, au_retailers).

all_consistent(availability_status_au) :-
    (indep(s_m), consistent(s_m, availability_status_au) ; \+indep(s_m)),
    (indep(s74), consistent(s74, availability_status_au) ; \+indep(s74)),
    (indep(s6), consistent(s6, availability_status_au) ; \+indep(s6)).

evidence(all_consistent(availability_status_au)).
query(true_val(availability_status_au, au_retailers)).
query(true_val(availability_status_au, unk_availability_status_au)).

0.88::acc(s9, availability_status_nz).

% @attr availability_status_nz
% @type categorical
% @canonical false
% @original_name availability_status (NZ)
% @values quest_store_queenstown=Quest_Store_Queenstown unk_availability_status_nz=Unknown
% @importance 0.70

0.88::true_val(availability_status_nz, quest_store_queenstown); 0.12::true_val(availability_status_nz, unk_availability_status_nz).

measured(s9, availability_status_nz, quest_store_queenstown).

all_consistent(availability_status_nz) :-
    (indep(s9), consistent(s9, availability_status_nz) ; \+indep(s9)).

evidence(all_consistent(availability_status_nz)).
query(true_val(availability_status_nz, quest_store_queenstown)).
query(true_val(availability_status_nz, unk_availability_status_nz)).

0.90::acc(s1, warranty).
0.88::acc(s39, warranty).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values three_year=3_year_warranty_from_purchase unk_warranty=Unknown
% @importance 0.75

0.95::true_val(warranty, three_year); 0.05::true_val(warranty, unk_warranty).

measured(s1, warranty, three_year).
measured(s39, warranty, three_year).

all_consistent(warranty) :-
    (indep(s1), consistent(s1, warranty) ; \+indep(s1)),
    (indep(s39), consistent(s39, warranty) ; \+indep(s39)).

evidence(all_consistent(warranty)).
query(true_val(warranty, three_year)).
query(true_val(warranty, unk_warranty)).

0.80::acc(s2, customer_service_phone_us).

% @attr customer_service_phone_us
% @type categorical
% @canonical false
% @original_name Burton customer service phone (US)
% @values phone_800_881_3138=800_881_3138 unk_customer_service_phone_us=Unknown
% @importance 0.80

0.88::true_val(customer_service_phone_us, phone_800_881_3138); 0.12::true_val(customer_service_phone_us, unk_customer_service_phone_us).

measured(s2, customer_service_phone_us, phone_800_881_3138).

all_consistent(customer_service_phone_us) :-
    consistent(s2, customer_service_phone_us).

evidence(all_consistent(customer_service_phone_us)).
query(true_val(customer_service_phone_us, phone_800_881_3138)).
query(true_val(customer_service_phone_us, unk_customer_service_phone_us)).

0.82::acc(s2, sustainability_certification_bcorp).

% @attr sustainability_certification_bcorp
% @type categorical
% @canonical false
% @original_name Burton B Corp certified
% @values b_corp=B_Corp_certified unk_sustainability_certification_bcorp=Unknown
% @importance 0.80

0.88::true_val(sustainability_certification_bcorp, b_corp); 0.12::true_val(sustainability_certification_bcorp, unk_sustainability_certification_bcorp).

measured(s2, sustainability_certification_bcorp, b_corp).

all_consistent(sustainability_certification_bcorp) :-
    consistent(s2, sustainability_certification_bcorp).

evidence(all_consistent(sustainability_certification_bcorp)).
query(true_val(sustainability_certification_bcorp, b_corp)).
query(true_val(sustainability_certification_bcorp, unk_sustainability_certification_bcorp)).

0.90::acc(s1, shape).
0.88::acc(s10, shape).
0.93::acc(s_m, shape).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values directional=Directional unk_shape=Unknown
% @importance 0.88

0.95::true_val(shape, directional); 0.05::true_val(shape, unk_shape).

measured(s1, shape, directional).
measured(s10, shape, directional).
measured(s_m, shape, directional).

all_consistent(shape) :-
    (indep(s1), consistent(s1, shape) ; \+indep(s1)),
    (indep(s10), consistent(s10, shape) ; \+indep(s10)),
    (indep(s_m), consistent(s_m, shape) ; \+indep(s_m)).

evidence(all_consistent(shape)).
query(true_val(shape, directional)).
query(true_val(shape, unk_shape)).

0.90::acc(s1, flex_direction).
0.88::acc(s10, flex_direction).
0.93::acc(s_m, flex_direction).
0.88::acc(s17, flex_direction).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values twin=Twin_symmetrical_flex unk_flex_direction=Unknown
% @importance 0.85

0.95::true_val(flex_direction, twin); 0.05::true_val(flex_direction, unk_flex_direction).

measured(s1, flex_direction, twin).
measured(s10, flex_direction, twin).
measured(s_m, flex_direction, twin).
measured(s17, flex_direction, twin).

all_consistent(flex_direction) :-
    (indep(s1), consistent(s1, flex_direction) ; \+indep(s1)),
    (indep(s10), consistent(s10, flex_direction) ; \+indep(s10)),
    (indep(s_m), consistent(s_m, flex_direction) ; \+indep(s_m)),
    (indep(s17), consistent(s17, flex_direction) ; \+indep(s17)).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, twin)).
query(true_val(flex_direction, unk_flex_direction)).

0.85::acc(s6, shape_description).
0.88::acc(s10, shape_description).

% @attr shape_description
% @type categorical
% @canonical false
% @original_name Shape description
% @values dir_shape_twin_flex=Directional_shape_twin_flex unk_shape_description=Unknown
% @importance 0.88

0.93::true_val(shape_description, dir_shape_twin_flex); 0.07::true_val(shape_description, unk_shape_description).

measured(s6, shape_description, dir_shape_twin_flex).
measured(s10, shape_description, dir_shape_twin_flex).

all_consistent(shape_description) :-
    (indep(s6), consistent(s6, shape_description) ; \+indep(s6)),
    (indep(s10), consistent(s10, shape_description) ; \+indep(s10)).

evidence(all_consistent(shape_description)).
query(true_val(shape_description, dir_shape_twin_flex)).
query(true_val(shape_description, unk_shape_description)).

0.92::acc(s1, camber_type).
0.90::acc(s10, camber_type).
0.93::acc(s_m, camber_type).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values flying_v=Flying_V_hybrid_rocker_camber unk_camber_type=Unknown
% @importance 0.88

0.95::true_val(camber_type, flying_v); 0.05::true_val(camber_type, unk_camber_type).

measured(s1, camber_type, flying_v).
measured(s10, camber_type, flying_v).
measured(s_m, camber_type, flying_v).

all_consistent(camber_type) :-
    (indep(s1), consistent(s1, camber_type) ; \+indep(s1)),
    (indep(s10), consistent(s10, camber_type) ; \+indep(s10)),
    (indep(s_m), consistent(s_m, camber_type) ; \+indep(s_m)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, flying_v)).
query(true_val(camber_type, unk_camber_type)).

0.90::acc(s10, camber_description).

% @attr camber_description
% @type categorical
% @canonical false
% @original_name camber_description
% @values roc_cam_roc_cam_roc=Roc_Cam_Roc_Cam_Roc unk_camber_description=Unknown
% @importance 0.85

0.90::true_val(camber_description, roc_cam_roc_cam_roc); 0.10::true_val(camber_description, unk_camber_description).

measured(s10, camber_description, roc_cam_roc_cam_roc).

all_consistent(camber_description) :-
    (indep(s10), consistent(s10, camber_description) ; \+indep(s10)).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, roc_cam_roc_cam_roc)).
query(true_val(camber_description, unk_camber_description)).

0.90::acc(s1, tip_tail_design).
0.93::acc(s_m, tip_tail_design).

% @attr tip_tail_design
% @type categorical
% @canonical false
% @original_name Tip/tail design
% @values pro_tip=Pro_Tip_tapered_reduced_swing_weight unk_tip_tail_design=Unknown
% @importance 0.88

0.93::true_val(tip_tail_design, pro_tip); 0.07::true_val(tip_tail_design, unk_tip_tail_design).

measured(s1, tip_tail_design, pro_tip).
measured(s_m, tip_tail_design, pro_tip).

all_consistent(tip_tail_design) :-
    (indep(s1), consistent(s1, tip_tail_design) ; \+indep(s1)),
    (indep(s_m), consistent(s_m, tip_tail_design) ; \+indep(s_m)).

evidence(all_consistent(tip_tail_design)).
query(true_val(tip_tail_design, pro_tip)).
query(true_val(tip_tail_design, unk_tip_tail_design)).

0.93::acc(s_m, setback).

% @attr setback
% @type numeric
% @unit cm
% @canonical true
% @original_name setback
% @values vn1_25=neg1.25 unk_setback=Unknown
% @importance 0.85

0.93::true_val(setback, vn1_25); 0.07::true_val(setback, unk_setback).

measured(s_m, setback, vn1_25).

all_consistent(setback) :-
    (indep(s_m), consistent(s_m, setback) ; \+indep(s_m)).

evidence(all_consistent(setback)).
query(true_val(setback, vn1_25)).
query(true_val(setback, unk_setback)).

0.93::acc(s_m, flex_rating_10).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v4_5=4.5 unk_flex_rating_10=Unknown
% @importance 0.85

0.93::true_val(flex_rating_10, v4_5); 0.07::true_val(flex_rating_10, unk_flex_rating_10).

measured(s_m, flex_rating_10, v4_5).

all_consistent(flex_rating_10) :-
    (indep(s_m), consistent(s_m, flex_rating_10) ; \+indep(s_m)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v4_5)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

0.88::acc(s10, flex_feel).
0.85::acc(s38, flex_feel).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values medium=Medium unk_flex_feel=Unknown
% @importance 0.73

0.93::true_val(flex_feel, medium); 0.07::true_val(flex_feel, unk_flex_feel).

measured(s10, flex_feel, medium).
measured(s38, flex_feel, medium).

all_consistent(flex_feel) :-
    (indep(s10), consistent(s10, flex_feel) ; \+indep(s10)),
    (indep(s38), consistent(s38, flex_feel) ; \+indep(s38)).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium)).
query(true_val(flex_feel, unk_flex_feel)).

0.92::acc(s1, core_material).
0.90::acc(s10, core_material).
0.93::acc(s_m, core_material).
0.82::acc(s4, core_material).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values super_fly_ii_700g=Super_Fly_II_700G_dual_species unk_core_material=Unknown
% @importance 0.80

0.95::true_val(core_material, super_fly_ii_700g); 0.05::true_val(core_material, unk_core_material).

measured(s1, core_material, super_fly_ii_700g).
measured(s10, core_material, super_fly_ii_700g).
measured(s_m, core_material, super_fly_ii_700g).
measured(s4, core_material, super_fly_ii_700g).

all_consistent(core_material) :-
    (indep(s1), consistent(s1, core_material) ; \+indep(s1)),
    (indep(s10), consistent(s10, core_material) ; \+indep(s10)),
    (indep(s_m), consistent(s_m, core_material) ; \+indep(s_m)),
    (indep(s4), consistent(s4, core_material) ; \+indep(s4)).

evidence(all_consistent(core_material)).
query(true_val(core_material, super_fly_ii_700g)).
query(true_val(core_material, unk_core_material)).

0.88::acc(s10, core_description).
0.88::acc(s17, core_description).

% @attr core_description
% @type categorical
% @canonical false
% @original_name Core description
% @values stronger_lighter_targeted=Stronger_lighter_woods_targeted_pop_strength unk_core_description=Unknown
% @importance 0.85

0.93::true_val(core_description, stronger_lighter_targeted); 0.07::true_val(core_description, unk_core_description).

measured(s10, core_description, stronger_lighter_targeted).
measured(s17, core_description, stronger_lighter_targeted).

all_consistent(core_description) :-
    (indep(s10), consistent(s10, core_description) ; \+indep(s10)),
    (indep(s17), consistent(s17, core_description) ; \+indep(s17)).

evidence(all_consistent(core_description)).
query(true_val(core_description, stronger_lighter_targeted)).
query(true_val(core_description, unk_core_description)).

0.88::acc(s10, construction_material_innovation).
0.88::acc(s17, construction_material_innovation).
0.90::acc(s_m, construction_material_innovation).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values squeezebox=Squeezebox_profiled_core unk_construction_material_innovation=Unknown
% @importance 0.85

0.95::true_val(construction_material_innovation, squeezebox); 0.05::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s10, construction_material_innovation, squeezebox).
measured(s17, construction_material_innovation, squeezebox).
measured(s_m, construction_material_innovation, squeezebox).

all_consistent(construction_material_innovation) :-
    (indep(s10), consistent(s10, construction_material_innovation) ; \+indep(s10)),
    (indep(s17), consistent(s17, construction_material_innovation) ; \+indep(s17)),
    (indep(s_m), consistent(s_m, construction_material_innovation) ; \+indep(s_m)).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, squeezebox)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

0.88::acc(s10, construction_material_innovation_dualzone_egd).
0.88::acc(s17, construction_material_innovation_dualzone_egd).
0.90::acc(s_m, construction_material_innovation_dualzone_egd).

% @attr construction_material_innovation_dualzone_egd
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Dualzone EGD)
% @values dualzone_egd=Dualzone_EGD_perpendicular_grain unk_construction_material_innovation_dualzone_egd=Unknown
% @importance 0.85

0.95::true_val(construction_material_innovation_dualzone_egd, dualzone_egd); 0.05::true_val(construction_material_innovation_dualzone_egd, unk_construction_material_innovation_dualzone_egd).

measured(s10, construction_material_innovation_dualzone_egd, dualzone_egd).
measured(s17, construction_material_innovation_dualzone_egd, dualzone_egd).
measured(s_m, construction_material_innovation_dualzone_egd, dualzone_egd).

all_consistent(construction_material_innovation_dualzone_egd) :-
    (indep(s10), consistent(s10, construction_material_innovation_dualzone_egd) ; \+indep(s10)),
    (indep(s17), consistent(s17, construction_material_innovation_dualzone_egd) ; \+indep(s17)),
    (indep(s_m), consistent(s_m, construction_material_innovation_dualzone_egd) ; \+indep(s_m)).

evidence(all_consistent(construction_material_innovation_dualzone_egd)).
query(true_val(construction_material_innovation_dualzone_egd, dualzone_egd)).
query(true_val(construction_material_innovation_dualzone_egd, unk_construction_material_innovation_dualzone_egd)).

0.88::acc(s10, laminate).
0.88::acc(s17, laminate).
0.90::acc(s_m, laminate).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values carbon_highlights_45=45_degree_Carbon_Highlights_tip_to_tail unk_laminate=Unknown
% @importance 0.83

0.95::true_val(laminate, carbon_highlights_45); 0.05::true_val(laminate, unk_laminate).

measured(s10, laminate, carbon_highlights_45).
measured(s17, laminate, carbon_highlights_45).
measured(s_m, laminate, carbon_highlights_45).

all_consistent(laminate) :-
    (indep(s10), consistent(s10, laminate) ; \+indep(s10)),
    (indep(s17), consistent(s17, laminate) ; \+indep(s17)),
    (indep(s_m), consistent(s_m, laminate) ; \+indep(s_m)).

evidence(all_consistent(laminate)).
query(true_val(laminate, carbon_highlights_45)).
query(true_val(laminate, unk_laminate)).

0.88::acc(s17, construction_material_innovation_carbon_opt).
0.85::acc(s10, construction_material_innovation_carbon_opt).

% @attr construction_material_innovation_carbon_opt
% @type categorical
% @canonical false
% @original_name construction_material_innovation (carbon optimization)
% @values optimized_fiberglass_carbon=Optimized_fiberglass_full_carbon_layer unk_construction_material_innovation_carbon_opt=Unknown
% @importance 0.83

0.92::true_val(construction_material_innovation_carbon_opt, optimized_fiberglass_carbon); 0.08::true_val(construction_material_innovation_carbon_opt, unk_construction_material_innovation_carbon_opt).

measured(s17, construction_material_innovation_carbon_opt, optimized_fiberglass_carbon).
measured(s10, construction_material_innovation_carbon_opt, optimized_fiberglass_carbon).

all_consistent(construction_material_innovation_carbon_opt) :-
    (indep(s17), consistent(s17, construction_material_innovation_carbon_opt) ; \+indep(s17)),
    (indep(s10), consistent(s10, construction_material_innovation_carbon_opt) ; \+indep(s10)).

evidence(all_consistent(construction_material_innovation_carbon_opt)).
query(true_val(construction_material_innovation_carbon_opt, optimized_fiberglass_carbon)).
query(true_val(construction_material_innovation_carbon_opt, unk_construction_material_innovation_carbon_opt)).

0.92::acc(s1, base_material).
0.93::acc(s_m, base_material).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_wfo=Sintered_WFO_high_density unk_base_material=Unknown
% @importance 0.88

0.95::true_val(base_material, sintered_wfo); 0.05::true_val(base_material, unk_base_material).

measured(s1, base_material, sintered_wfo).
measured(s_m, base_material, sintered_wfo).

all_consistent(base_material) :-
    (indep(s1), consistent(s1, base_material) ; \+indep(s1)),
    (indep(s_m), consistent(s_m, base_material) ; \+indep(s_m)).

evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_wfo)).
query(true_val(base_material, unk_base_material)).

0.85::acc(s10, base_description).

% @attr base_description
% @type categorical
% @canonical false
% @original_name Base description
% @values ultra_durable_fast=Ultra_durable_stays_fast_all_season unk_base_description=Unknown
% @importance 0.85

0.88::true_val(base_description, ultra_durable_fast); 0.12::true_val(base_description, unk_base_description).

measured(s10, base_description, ultra_durable_fast).

all_consistent(base_description) :-
    (indep(s10), consistent(s10, base_description) ; \+indep(s10)).

evidence(all_consistent(base_description)).
query(true_val(base_description, ultra_durable_fast)).
query(true_val(base_description, unk_base_description)).

0.93::acc(s_m, edge_technology).
0.88::acc(s8, edge_technology).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values frostbite=Frostbite_Edges_extended_under_bindings unk_edge_technology=Unknown
% @importance 0.78

0.93::true_val(edge_technology, frostbite); 0.07::true_val(edge_technology, unk_edge_technology).

measured(s_m, edge_technology, frostbite).
measured(s8, edge_technology, frostbite).

all_consistent(edge_technology) :-
    (indep(s_m), consistent(s_m, edge_technology) ; \+indep(s_m)),
    (indep(s8), consistent(s8, edge_technology) ; \+indep(s8)).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, frostbite)).
query(true_val(edge_technology, unk_edge_technology)).

0.90::acc(s10, resin).
0.90::acc(s17, resin).
0.93::acc(s_m, resin).

% @attr resin
% @type categorical
% @canonical true
% @original_name resin
% @values super_sap_epoxy=Super_Sap_Epoxy_bio_based unk_resin=Unknown
% @importance 0.85

0.95::true_val(resin, super_sap_epoxy); 0.05::true_val(resin, unk_resin).

measured(s10, resin, super_sap_epoxy).
measured(s17, resin, super_sap_epoxy).
measured(s_m, resin, super_sap_epoxy).

all_consistent(resin) :-
    (indep(s10), consistent(s10, resin) ; \+indep(s10)),
    (indep(s17), consistent(s17, resin) ; \+indep(s17)),
    (indep(s_m), consistent(s_m, resin) ; \+indep(s_m)).

evidence(all_consistent(resin)).
query(true_val(resin, super_sap_epoxy)).
query(true_val(resin, unk_resin)).

0.88::acc(s8, construction_material_innovation_infinite_ride).
0.88::acc(s10, construction_material_innovation_infinite_ride).
0.90::acc(s_m, construction_material_innovation_infinite_ride).

% @attr construction_material_innovation_infinite_ride
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Infinite Ride)
% @values infinite_ride=Infinite_Ride_overbuilt_machine_broken_in unk_construction_material_innovation_infinite_ride=Unknown
% @importance 0.78

0.95::true_val(construction_material_innovation_infinite_ride, infinite_ride); 0.05::true_val(construction_material_innovation_infinite_ride, unk_construction_material_innovation_infinite_ride).

measured(s8, construction_material_innovation_infinite_ride, infinite_ride).
measured(s10, construction_material_innovation_infinite_ride, infinite_ride).
measured(s_m, construction_material_innovation_infinite_ride, infinite_ride).

all_consistent(construction_material_innovation_infinite_ride) :-
    (indep(s8), consistent(s8, construction_material_innovation_infinite_ride) ; \+indep(s8)),
    (indep(s10), consistent(s10, construction_material_innovation_infinite_ride) ; \+indep(s10)),
    (indep(s_m), consistent(s_m, construction_material_innovation_infinite_ride) ; \+indep(s_m)).

evidence(all_consistent(construction_material_innovation_infinite_ride)).
query(true_val(construction_material_innovation_infinite_ride, infinite_ride)).
query(true_val(construction_material_innovation_infinite_ride, unk_construction_material_innovation_infinite_ride)).

0.90::acc(s10, mounting_pattern).
0.90::acc(s17, mounting_pattern).
0.93::acc(s_m, mounting_pattern).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values the_channel=The_Channel_system unk_mounting_pattern=Unknown
% @importance 0.85

0.95::true_val(mounting_pattern, the_channel); 0.05::true_val(mounting_pattern, unk_mounting_pattern).

measured(s10, mounting_pattern, the_channel).
measured(s17, mounting_pattern, the_channel).
measured(s_m, mounting_pattern, the_channel).

all_consistent(mounting_pattern) :-
    (indep(s10), consistent(s10, mounting_pattern) ; \+indep(s10)),
    (indep(s17), consistent(s17, mounting_pattern) ; \+indep(s17)),
    (indep(s_m), consistent(s_m, mounting_pattern) ; \+indep(s_m)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, the_channel)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

0.90::acc(s10, channel_inserts_included).
0.90::acc(s17, channel_inserts_included).

% @attr channel_inserts_included
% @type categorical
% @canonical false
% @original_name Channel inserts included
% @values yes=Yes unk_channel_inserts_included=Unknown
% @importance 0.85

0.93::true_val(channel_inserts_included, yes); 0.07::true_val(channel_inserts_included, unk_channel_inserts_included).

measured(s10, channel_inserts_included, yes).
measured(s17, channel_inserts_included, yes).

all_consistent(channel_inserts_included) :-
    (indep(s10), consistent(s10, channel_inserts_included) ; \+indep(s10)),
    (indep(s17), consistent(s17, channel_inserts_included) ; \+indep(s17)).

evidence(all_consistent(channel_inserts_included)).
query(true_val(channel_inserts_included, yes)).
query(true_val(channel_inserts_included, unk_channel_inserts_included)).

0.88::acc(s_m, available_sizes).
0.90::acc(s38, available_sizes).
0.88::acc(s6, available_sizes).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values full_range_9=150_154_154W_156_158_158W_162_162W_166W limited_6=150_154_156_158_158W_162W limited_3=154_156_158
% @importance 0.80

0.55::true_val(available_sizes, full_range_9); 0.35::true_val(available_sizes, limited_6); 0.10::true_val(available_sizes, limited_3).

measured(s38, available_sizes, full_range_9).
measured(s6, available_sizes, limited_6).
measured(s_m, available_sizes, limited_3).

all_consistent(available_sizes) :-
    (indep(s38), consistent(s38, available_sizes) ; \+indep(s38)),
    (indep(s6), consistent(s6, available_sizes) ; \+indep(s6)),
    (indep(s_m), consistent(s_m, available_sizes) ; \+indep(s_m)).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, full_range_9)).
query(true_val(available_sizes, limited_6)).
query(true_val(available_sizes, limited_3)).

0.93::acc(s_m, width_options).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 0.85

0.93::true_val(width_options, standard_and_wide); 0.07::true_val(width_options, unk_width_options).

measured(s_m, width_options, standard_and_wide).

all_consistent(width_options) :-
    (indep(s_m), consistent(s_m, width_options) ; \+indep(s_m)).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

0.93::acc(s_m, effective_edge_154).

% @attr effective_edge_154
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 154cm
% @values v117_5=117.5 unk_effective_edge_154=Unknown
% @importance 0.85

0.93::true_val(effective_edge_154, v117_5); 0.07::true_val(effective_edge_154, unk_effective_edge_154).

measured(s_m, effective_edge_154, v117_5).

all_consistent(effective_edge_154) :-
    (indep(s_m), consistent(s_m, effective_edge_154) ; \+indep(s_m)).

evidence(all_consistent(effective_edge_154)).
query(true_val(effective_edge_154, v117_5)).
query(true_val(effective_edge_154, unk_effective_edge_154)).

0.93::acc(s_m, sidecut_radius_size_154).

% @attr sidecut_radius_size_154
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (154cm)
% @values v7_6=7.6 unk_sidecut_radius_size_154=Unknown
% @importance 0.85

0.93::true_val(sidecut_radius_size_154, v7_6); 0.07::true_val(sidecut_radius_size_154, unk_sidecut_radius_size_154).

measured(s_m, sidecut_radius_size_154, v7_6).

all_consistent(sidecut_radius_size_154) :-
    (indep(s_m), consistent(s_m, sidecut_radius_size_154) ; \+indep(s_m)).

evidence(all_consistent(sidecut_radius_size_154)).
query(true_val(sidecut_radius_size_154, v7_6)).
query(true_val(sidecut_radius_size_154, unk_sidecut_radius_size_154)).

0.93::acc(s_m, tip_tail_width_size_154).

% @attr tip_tail_width_size_154
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (154cm)
% @values v29_2=29.2 unk_tip_tail_width_size_154=Unknown
% @importance 0.85

0.93::true_val(tip_tail_width_size_154, v29_2); 0.07::true_val(tip_tail_width_size_154, unk_tip_tail_width_size_154).

measured(s_m, tip_tail_width_size_154, v29_2).

all_consistent(tip_tail_width_size_154) :-
    (indep(s_m), consistent(s_m, tip_tail_width_size_154) ; \+indep(s_m)).

evidence(all_consistent(tip_tail_width_size_154)).
query(true_val(tip_tail_width_size_154, v29_2)).
query(true_val(tip_tail_width_size_154, unk_tip_tail_width_size_154)).

0.93::acc(s_m, waist_width_154).

% @attr waist_width_154
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 154cm
% @values v25_0=25.0 unk_waist_width_154=Unknown
% @importance 0.85

0.93::true_val(waist_width_154, v25_0); 0.07::true_val(waist_width_154, unk_waist_width_154).

measured(s_m, waist_width_154, v25_0).

all_consistent(waist_width_154) :-
    (indep(s_m), consistent(s_m, waist_width_154) ; \+indep(s_m)).

evidence(all_consistent(waist_width_154)).
query(true_val(waist_width_154, v25_0)).
query(true_val(waist_width_154, unk_waist_width_154)).

0.93::acc(s_m, stance_width_range_size_154).

% @attr stance_width_range_size_154
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size (154cm)
% @values v53_0=53.0 unk_stance_width_range_size_154=Unknown
% @importance 0.85

0.93::true_val(stance_width_range_size_154, v53_0); 0.07::true_val(stance_width_range_size_154, unk_stance_width_range_size_154).

measured(s_m, stance_width_range_size_154, v53_0).

all_consistent(stance_width_range_size_154) :-
    (indep(s_m), consistent(s_m, stance_width_range_size_154) ; \+indep(s_m)).

evidence(all_consistent(stance_width_range_size_154)).
query(true_val(stance_width_range_size_154, v53_0)).
query(true_val(stance_width_range_size_154, unk_stance_width_range_size_154)).

0.93::acc(s_m, recommended_weight_range_size_154).

% @attr recommended_weight_range_size_154
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (154cm)
% @values r54_82=54_to_82_kg unk_recommended_weight_range_size_154=Unknown
% @importance 0.85

0.93::true_val(recommended_weight_range_size_154, r54_82); 0.07::true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154).

measured(s_m, recommended_weight_range_size_154, r54_82).

all_consistent(recommended_weight_range_size_154) :-
    (indep(s_m), consistent(s_m, recommended_weight_range_size_154) ; \+indep(s_m)).

evidence(all_consistent(recommended_weight_range_size_154)).
query(true_val(recommended_weight_range_size_154, r54_82)).
query(true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154)).

0.93::acc(s_m, sku_154).

% @attr sku_154
% @type categorical
% @canonical false
% @original_name SKU 154cm
% @values sku_1070719i66rg154=1070719I66RG154 unk_sku_154=Unknown
% @importance 0.85

0.95::true_val(sku_154, sku_1070719i66rg154); 0.05::true_val(sku_154, unk_sku_154).

measured(s_m, sku_154, sku_1070719i66rg154).

all_consistent(sku_154) :-
    (indep(s_m), consistent(s_m, sku_154) ; \+indep(s_m)).

evidence(all_consistent(sku_154)).
query(true_val(sku_154, sku_1070719i66rg154)).
query(true_val(sku_154, unk_sku_154)).

0.93::acc(s_m, effective_edge_156).

% @attr effective_edge_156
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 156cm
% @values v119_5=119.5 unk_effective_edge_156=Unknown
% @importance 0.85

0.93::true_val(effective_edge_156, v119_5); 0.07::true_val(effective_edge_156, unk_effective_edge_156).

measured(s_m, effective_edge_156, v119_5).

all_consistent(effective_edge_156) :-
    (indep(s_m), consistent(s_m, effective_edge_156) ; \+indep(s_m)).

evidence(all_consistent(effective_edge_156)).
query(true_val(effective_edge_156, v119_5)).
query(true_val(effective_edge_156, unk_effective_edge_156)).

0.93::acc(s_m, sidecut_radius_size).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size (156cm)
% @values v7_8=7.8 unk_sidecut_radius_size=Unknown
% @importance 0.85

0.93::true_val(sidecut_radius_size, v7_8); 0.07::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s_m, sidecut_radius_size, v7_8).

all_consistent(sidecut_radius_size) :-
    (indep(s_m), consistent(s_m, sidecut_radius_size) ; \+indep(s_m)).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_8)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

0.93::acc(s_m, tip_tail_width_size).

% @attr tip_tail_width_size
% @type numeric
% @unit cm
% @canonical true
% @original_name tip_tail_width_size (156cm)
% @values v29_4=29.4 unk_tip_tail_width_size=Unknown
% @importance 0.85

0.93::true_val(tip_tail_width_size, v29_4); 0.07::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s_m, tip_tail_width_size, v29_4).

all_consistent(tip_tail_width_size) :-
    (indep(s_m), consistent(s_m, tip_tail_width_size) ; \+indep(s_m)).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v29_4)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

0.93::acc(s_m, waist_width_156).

% @attr waist_width_156
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 156cm
% @values v25_2=25.2 unk_waist_width_156=Unknown
% @importance 0.85

0.93::true_val(waist_width_156, v25_2); 0.07::true_val(waist_width_156, unk_waist_width_156).

measured(s_m, waist_width_156, v25_2).

all_consistent(waist_width_156) :-
    (indep(s_m), consistent(s_m, waist_width_156) ; \+indep(s_m)).

evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v25_2)).
query(true_val(waist_width_156, unk_waist_width_156)).

0.93::acc(s_m, stance_width_range_size).

% @attr stance_width_range_size
% @type numeric
% @unit cm
% @canonical true
% @original_name stance_width_range_size (156cm)
% @values v53_0=53.0 unk_stance_width_range_size=Unknown
% @importance 0.85

0.93::true_val(stance_width_range_size, v53_0); 0.07::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s_m, stance_width_range_size, v53_0).

all_consistent(stance_width_range_size) :-
    (indep(s_m), consistent(s_m, stance_width_range_size) ; \+indep(s_m)).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v53_0)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

0.93::acc(s_m, recommended_weight_range_size).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size (156cm)
% @values r68_91=68_to_91_kg unk_recommended_weight_range_size=Unknown
% @importance 0.85

0.93::true_val(recommended_weight_range_size, r68_91); 0.07::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s_m, recommended_weight_range_size, r68_91).

all_consistent(recommended_weight_range_size) :-
    (indep(s_m), consistent(s_m, recommended_weight_range_size) ; \+indep(s_m)).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, r68_91)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

0.93::acc(s_m, effective_edge_158).

% @attr effective_edge_158
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 158cm
% @values v121_5=121.5 unk_effective_edge_158=Unknown
% @importance 0.85

0.93::true_val(effective_edge_158, v121_5); 0.07::true_val(effective_edge_158, unk_effective_edge_158).

measured(s_m, effective_edge_158, v121_5).

all_consistent(effective_edge_158) :-
    (indep(s_m), consistent(s_m, effective_edge_158) ; \+indep(s_m)).

evidence(all_consistent(effective_edge_158)).
query(true_val(effective_edge_158, v121_5)).
query(true_val(effective_edge_158, unk_effective_edge_158)).

0.93::acc(s_m, sidecut_radius_size_158).

% @attr sidecut_radius_size_158
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (158cm)
% @values v7_9=7.9 unk_sidecut_radius_size_158=Unknown
% @importance 0.85

0.93::true_val(sidecut_radius_size_158, v7_9); 0.07::true_val(sidecut_radius_size_158, unk_sidecut_radius_size_158).

measured(s_m, sidecut_radius_size_158, v7_9).

all_consistent(sidecut_radius_size_158) :-
    (indep(s_m), consistent(s_m, sidecut_radius_size_158) ; \+indep(s_m)).

evidence(all_consistent(sidecut_radius_size_158)).
query(true_val(sidecut_radius_size_158, v7_9)).
query(true_val(sidecut_radius_size_158, unk_sidecut_radius_size_158)).

0.93::acc(s_m, tip_tail_width_size_158).

% @attr tip_tail_width_size_158
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (158cm)
% @values v29_7=29.7 unk_tip_tail_width_size_158=Unknown
% @importance 0.85

0.93::true_val(tip_tail_width_size_158, v29_7); 0.07::true_val(tip_tail_width_size_158, unk_tip_tail_width_size_158).

measured(s_m, tip_tail_width_size_158, v29_7).

all_consistent(tip_tail_width_size_158) :-
    (indep(s_m), consistent(s_m, tip_tail_width_size_158) ; \+indep(s_m)).

evidence(all_consistent(tip_tail_width_size_158)).
query(true_val(tip_tail_width_size_158, v29_7)).
query(true_val(tip_tail_width_size_158, unk_tip_tail_width_size_158)).

0.93::acc(s_m, waist_width_158).

% @attr waist_width_158
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 158cm
% @values v25_4=25.4 unk_waist_width_158=Unknown
% @importance 0.85

0.93::true_val(waist_width_158, v25_4); 0.07::true_val(waist_width_158, unk_waist_width_158).

measured(s_m, waist_width_158, v25_4).

all_consistent(waist_width_158) :-
    (indep(s_m), consistent(s_m, waist_width_158) ; \+indep(s_m)).

evidence(all_consistent(waist_width_158)).
query(true_val(waist_width_158, v25_4)).
query(true_val(waist_width_158, unk_waist_width_158)).

0.93::acc(s_m, stance_width_range_size_158).

% @attr stance_width_range_size_158
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size (158cm)
% @values v56_0=56.0 unk_stance_width_range_size_158=Unknown
% @importance 0.85

0.93::true_val(stance_width_range_size_158, v56_0); 0.07::true_val(stance_width_range_size_158, unk_stance_width_range_size_158).

measured(s_m, stance_width_range_size_158, v56_0).

all_consistent(stance_width_range_size_158) :-
    (indep(s_m), consistent(s_m, stance_width_range_size_158) ; \+indep(s_m)).

evidence(all_consistent(stance_width_range_size_158)).
query(true_val(stance_width_range_size_158, v56_0)).
query(true_val(stance_width_range_size_158, unk_stance_width_range_size_158)).

0.93::acc(s_m, recommended_weight_range_size_158).

% @attr recommended_weight_range_size_158
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (158cm)
% @values r68_91=68_to_91_kg unk_recommended_weight_range_size_158=Unknown
% @importance 0.85

0.93::true_val(recommended_weight_range_size_158, r68_91); 0.07::true_val(recommended_weight_range_size_158, unk_recommended_weight_range_size_158).

measured(s_m, recommended_weight_range_size_158, r68_91).

all_consistent(recommended_weight_range_size_158) :-
    (indep(s_m), consistent(s_m, recommended_weight_range_size_158) ; \+indep(s_m)).

evidence(all_consistent(recommended_weight_range_size_158)).
query(true_val(recommended_weight_range_size_158, r68_91)).
query(true_val(recommended_weight_range_size_158, unk_recommended_weight_range_size_158)).

0.90::acc(s_m, terrain_suitability).

% @attr terrain_suitability
% @type numeric
% @unit /10
% @canonical true
% @original_name terrain_suitability (first rating)
% @values v5=5.0 unk_terrain_suitability=Unknown
% @importance 0.85

0.90::true_val(terrain_suitability, v5); 0.10::true_val(terrain_suitability, unk_terrain_suitability).

measured(s_m, terrain_suitability, v5).

all_consistent(terrain_suitability) :-
    (indep(s_m), consistent(s_m, terrain_suitability) ; \+indep(s_m)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, v5)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

0.90::acc(s_m, terrain_suitability_peak).

% @attr terrain_suitability_peak
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability (second rating)
% @values v10=10.0 unk_terrain_suitability_peak=Unknown
% @importance 0.85

0.90::true_val(terrain_suitability_peak, v10); 0.10::true_val(terrain_suitability_peak, unk_terrain_suitability_peak).

measured(s_m, terrain_suitability_peak, v10).

all_consistent(terrain_suitability_peak) :-
    (indep(s_m), consistent(s_m, terrain_suitability_peak) ; \+indep(s_m)).

evidence(all_consistent(terrain_suitability_peak)).
query(true_val(terrain_suitability_peak, v10)).
query(true_val(terrain_suitability_peak, unk_terrain_suitability_peak)).

0.90::acc(s_m, terrain_suitability_third).

% @attr terrain_suitability_third
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability (third rating)
% @values v6=6.0 unk_terrain_suitability_third=Unknown
% @importance 0.85

0.90::true_val(terrain_suitability_third, v6); 0.10::true_val(terrain_suitability_third, unk_terrain_suitability_third).

measured(s_m, terrain_suitability_third, v6).

all_consistent(terrain_suitability_third) :-
    (indep(s_m), consistent(s_m, terrain_suitability_third) ; \+indep(s_m)).

evidence(all_consistent(terrain_suitability_third)).
query(true_val(terrain_suitability_third, v6)).
query(true_val(terrain_suitability_third, unk_terrain_suitability_third)).

0.65::acc(s_m, skill_level_recommendation).
0.88::acc(s1, skill_level_recommendation).
0.90::acc(s10, skill_level_recommendation).
0.82::acc(s_m2, skill_level_recommendation).
0.80::acc(s83, skill_level_recommendation).
0.82::acc(s85, skill_level_recommendation).

0.70::indep(s_m2).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values intermediate_expert=Intermediate_Expert beginner_intermediate=Beginner_Intermediate intermediate_advanced=Intermediate_Advanced
% @importance 0.83

0.10::true_val(skill_level_recommendation, beginner_intermediate); 0.50::true_val(skill_level_recommendation, intermediate_expert); 0.40::true_val(skill_level_recommendation, intermediate_advanced).

measured(s_m, skill_level_recommendation, beginner_intermediate).
measured(s1, skill_level_recommendation, intermediate_expert).
measured(s_m2, skill_level_recommendation, intermediate_expert).
measured(s10, skill_level_recommendation, intermediate_advanced).
measured(s83, skill_level_recommendation, intermediate_expert).
measured(s85, skill_level_recommendation, intermediate_advanced).

all_consistent(skill_level_recommendation) :-
    (indep(s_m), consistent(s_m, skill_level_recommendation) ; \+indep(s_m)),
    (indep(s1), consistent(s1, skill_level_recommendation) ; \+indep(s1)),
    (indep(s_m2), consistent(s_m2, skill_level_recommendation) ; \+indep(s_m2)),
    (indep(s10), consistent(s10, skill_level_recommendation) ; \+indep(s10)),
    consistent(s83, skill_level_recommendation),
    consistent(s85, skill_level_recommendation).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, beginner_intermediate)).
query(true_val(skill_level_recommendation, intermediate_expert)).
query(true_val(skill_level_recommendation, intermediate_advanced)).

0.85::acc(s7, flex_feel_qualitative).
0.80::acc(s5, flex_feel_qualitative).
0.85::acc(s36, flex_feel_qualitative).

% @attr flex_feel_qualitative
% @type categorical
% @canonical false
% @original_name flex_feel (qualitative)
% @values playful_forgiving_loose=Playful_forgiving_loose_surfier unk_flex_feel_qualitative=Unknown
% @importance 0.87

0.92::true_val(flex_feel_qualitative, playful_forgiving_loose); 0.08::true_val(flex_feel_qualitative, unk_flex_feel_qualitative).

measured(s7, flex_feel_qualitative, playful_forgiving_loose).
measured(s5, flex_feel_qualitative, playful_forgiving_loose).
measured(s36, flex_feel_qualitative, playful_forgiving_loose).

all_consistent(flex_feel_qualitative) :-
    consistent(s7, flex_feel_qualitative),
    consistent(s5, flex_feel_qualitative),
    consistent(s36, flex_feel_qualitative).

evidence(all_consistent(flex_feel_qualitative)).
query(true_val(flex_feel_qualitative, playful_forgiving_loose)).
query(true_val(flex_feel_qualitative, unk_flex_feel_qualitative)).

0.85::acc(s7, positive_aspect).
0.82::acc(s12, positive_aspect).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values excellent_butter_press=Excellent_butter_press_playfulness unk_positive_aspect=Unknown
% @importance 0.85

0.90::true_val(positive_aspect, excellent_butter_press); 0.10::true_val(positive_aspect, unk_positive_aspect).

measured(s7, positive_aspect, excellent_butter_press).
measured(s12, positive_aspect, excellent_butter_press).

all_consistent(positive_aspect) :-
    consistent(s7, positive_aspect),
    consistent(s12, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, excellent_butter_press)).
query(true_val(positive_aspect, unk_positive_aspect)).

0.85::acc(s7, positive_aspect_powder_float).
0.80::acc(s5, positive_aspect_powder_float).
0.78::acc(s36, positive_aspect_powder_float).

% @attr positive_aspect_powder_float
% @type categorical
% @canonical false
% @original_name positive_aspect (powder float)
% @values good_powder_float=Good_powder_float_rocker_directional unk_positive_aspect_powder_float=Unknown
% @importance 0.87

0.92::true_val(positive_aspect_powder_float, good_powder_float); 0.08::true_val(positive_aspect_powder_float, unk_positive_aspect_powder_float).

measured(s7, positive_aspect_powder_float, good_powder_float).
measured(s5, positive_aspect_powder_float, good_powder_float).
measured(s36, positive_aspect_powder_float, good_powder_float).

all_consistent(positive_aspect_powder_float) :-
    consistent(s7, positive_aspect_powder_float),
    consistent(s5, positive_aspect_powder_float),
    consistent(s36, positive_aspect_powder_float).

evidence(all_consistent(positive_aspect_powder_float)).
query(true_val(positive_aspect_powder_float, good_powder_float)).
query(true_val(positive_aspect_powder_float, unk_positive_aspect_powder_float)).

0.82::acc(s5, positive_aspect_turn_initiation).
0.80::acc(s36, positive_aspect_turn_initiation).

% @attr positive_aspect_turn_initiation
% @type categorical
% @canonical false
% @original_name positive_aspect (turn initiation)
% @values easy_turn_quick_edge=Easy_turn_initiation_quick_edge_to_edge unk_positive_aspect_turn_initiation=Unknown
% @importance 0.85

0.90::true_val(positive_aspect_turn_initiation, easy_turn_quick_edge); 0.10::true_val(positive_aspect_turn_initiation, unk_positive_aspect_turn_initiation).

measured(s5, positive_aspect_turn_initiation, easy_turn_quick_edge).
measured(s36, positive_aspect_turn_initiation, easy_turn_quick_edge).

all_consistent(positive_aspect_turn_initiation) :-
    consistent(s5, positive_aspect_turn_initiation),
    consistent(s36, positive_aspect_turn_initiation).

evidence(all_consistent(positive_aspect_turn_initiation)).
query(true_val(positive_aspect_turn_initiation, easy_turn_quick_edge)).
query(true_val(positive_aspect_turn_initiation, unk_positive_aspect_turn_initiation)).

0.80::acc(s5, positive_aspect_forgiving).
0.78::acc(s36, positive_aspect_forgiving).

% @attr positive_aspect_forgiving
% @type categorical
% @canonical false
% @original_name positive_aspect (forgiving)
% @values forgiving_catch_free=Forgiving_catch_free_good_for_progression unk_positive_aspect_forgiving=Unknown
% @importance 0.85

0.88::true_val(positive_aspect_forgiving, forgiving_catch_free); 0.12::true_val(positive_aspect_forgiving, unk_positive_aspect_forgiving).

measured(s5, positive_aspect_forgiving, forgiving_catch_free).
measured(s36, positive_aspect_forgiving, forgiving_catch_free).

all_consistent(positive_aspect_forgiving) :-
    consistent(s5, positive_aspect_forgiving),
    consistent(s36, positive_aspect_forgiving).

evidence(all_consistent(positive_aspect_forgiving)).
query(true_val(positive_aspect_forgiving, forgiving_catch_free)).
query(true_val(positive_aspect_forgiving, unk_positive_aspect_forgiving)).

0.82::acc(s25, positive_aspect_switch_riding).
0.85::acc(s10, positive_aspect_switch_riding).

% @attr positive_aspect_switch_riding
% @type categorical
% @canonical false
% @original_name positive_aspect (switch riding)
% @values good_switch=Good_for_switch_riding_twin_flex unk_positive_aspect_switch_riding=Unknown
% @importance 0.70

0.88::true_val(positive_aspect_switch_riding, good_switch); 0.12::true_val(positive_aspect_switch_riding, unk_positive_aspect_switch_riding).

measured(s25, positive_aspect_switch_riding, good_switch).
measured(s10, positive_aspect_switch_riding, good_switch).

all_consistent(positive_aspect_switch_riding) :-
    consistent(s25, positive_aspect_switch_riding),
    (indep(s10), consistent(s10, positive_aspect_switch_riding) ; \+indep(s10)).

evidence(all_consistent(positive_aspect_switch_riding)).
query(true_val(positive_aspect_switch_riding, good_switch)).
query(true_val(positive_aspect_switch_riding, unk_positive_aspect_switch_riding)).

0.87::acc(s7, negative_aspect).
0.82::acc(s5, negative_aspect).
0.80::acc(s36, negative_aspect).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values reduced_edge_hold=Reduced_edge_hold_hardpack_ice unk_negative_aspect=Unknown
% @importance 0.88

0.93::true_val(negative_aspect, reduced_edge_hold); 0.07::true_val(negative_aspect, unk_negative_aspect).

measured(s7, negative_aspect, reduced_edge_hold).
measured(s5, negative_aspect, reduced_edge_hold).
measured(s36, negative_aspect, reduced_edge_hold).

all_consistent(negative_aspect) :-
    consistent(s7, negative_aspect),
    consistent(s5, negative_aspect),
    consistent(s36, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, reduced_edge_hold)).
query(true_val(negative_aspect, unk_negative_aspect)).

0.85::acc(s5, negative_aspect_high_speed).
0.87::acc(s7, negative_aspect_high_speed).

% @attr negative_aspect_high_speed
% @type categorical
% @canonical false
% @original_name negative_aspect (high speed instability)
% @values loose_unstable_speed=Feels_loose_unstable_at_high_speeds unk_negative_aspect_high_speed=Unknown
% @importance 0.88

0.92::true_val(negative_aspect_high_speed, loose_unstable_speed); 0.08::true_val(negative_aspect_high_speed, unk_negative_aspect_high_speed).

measured(s5, negative_aspect_high_speed, loose_unstable_speed).
measured(s7, negative_aspect_high_speed, loose_unstable_speed).

all_consistent(negative_aspect_high_speed) :-
    consistent(s5, negative_aspect_high_speed),
    consistent(s7, negative_aspect_high_speed).

evidence(all_consistent(negative_aspect_high_speed)).
query(true_val(negative_aspect_high_speed, loose_unstable_speed)).
query(true_val(negative_aspect_high_speed, unk_negative_aspect_high_speed)).

0.82::acc(s7, negative_aspect_speed_wobbles).

% @attr negative_aspect_speed_wobbles
% @type categorical
% @canonical false
% @original_name negative_aspect (speed wobbles)
% @values speed_wobbles_uneven=Speed_wobbles_uneven_hard_terrain unk_negative_aspect_speed_wobbles=Unknown
% @importance 0.90

0.82::true_val(negative_aspect_speed_wobbles, speed_wobbles_uneven); 0.18::true_val(negative_aspect_speed_wobbles, unk_negative_aspect_speed_wobbles).

measured(s7, negative_aspect_speed_wobbles, speed_wobbles_uneven).

all_consistent(negative_aspect_speed_wobbles) :-
    consistent(s7, negative_aspect_speed_wobbles).

evidence(all_consistent(negative_aspect_speed_wobbles)).
query(true_val(negative_aspect_speed_wobbles, speed_wobbles_uneven)).
query(true_val(negative_aspect_speed_wobbles, unk_negative_aspect_speed_wobbles)).

0.85::acc(s5, negative_aspect_low_pop).

% @attr negative_aspect_low_pop
% @type categorical
% @canonical false
% @original_name negative_aspect (low pop)
% @values pop_6_of_10=Pop_rated_6_of_10_low unk_negative_aspect_low_pop=Unknown
% @importance 0.85

0.85::true_val(negative_aspect_low_pop, pop_6_of_10); 0.15::true_val(negative_aspect_low_pop, unk_negative_aspect_low_pop).

measured(s5, negative_aspect_low_pop, pop_6_of_10).

all_consistent(negative_aspect_low_pop) :-
    consistent(s5, negative_aspect_low_pop).

evidence(all_consistent(negative_aspect_low_pop)).
query(true_val(negative_aspect_low_pop, pop_6_of_10)).
query(true_val(negative_aspect_low_pop, unk_negative_aspect_low_pop)).

0.82::acc(s5, negative_aspect_carving).

% @attr negative_aspect_carving
% @type categorical
% @canonical false
% @original_name negative_aspect (carving)
% @values not_ideal_aggressive_carving=Not_ideal_aggressive_high_speed_carving unk_negative_aspect_carving=Unknown
% @importance 0.85

0.85::true_val(negative_aspect_carving, not_ideal_aggressive_carving); 0.15::true_val(negative_aspect_carving, unk_negative_aspect_carving).

measured(s5, negative_aspect_carving, not_ideal_aggressive_carving).

all_consistent(negative_aspect_carving) :-
    consistent(s5, negative_aspect_carving).

evidence(all_consistent(negative_aspect_carving)).
query(true_val(negative_aspect_carving, not_ideal_aggressive_carving)).
query(true_val(negative_aspect_carving, unk_negative_aspect_carving)).

0.88::acc(s7, reviewer_opinion_the_good_ride).
0.85::acc(s36, reviewer_opinion_the_good_ride).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values mellow_playful_but_hardsnow=Mellow_playful_easier_floating_loses_charm_hard_snow unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.85

0.92::true_val(reviewer_opinion_the_good_ride, mellow_playful_but_hardsnow); 0.08::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s7, reviewer_opinion_the_good_ride, mellow_playful_but_hardsnow).
measured(s36, reviewer_opinion_the_good_ride, mellow_playful_but_hardsnow).

all_consistent(reviewer_opinion_the_good_ride) :-
    consistent(s7, reviewer_opinion_the_good_ride),
    consistent(s36, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, mellow_playful_but_hardsnow)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

0.82::acc(s5, review_score_ogl).

% @attr review_score_ogl
% @type numeric
% @unit /10
% @canonical false
% @original_name Review score (Outdoor Gear Lab)
% @values v7=7.0 unk_review_score_ogl=Unknown
% @importance 0.85

0.85::true_val(review_score_ogl, v7); 0.15::true_val(review_score_ogl, unk_review_score_ogl).

measured(s5, review_score_ogl, v7).

all_consistent(review_score_ogl) :-
    consistent(s5, review_score_ogl).

evidence(all_consistent(review_score_ogl)).
query(true_val(review_score_ogl, v7)).
query(true_val(review_score_ogl, unk_review_score_ogl)).

0.82::acc(s5, review_verdict_ogl).

% @attr review_verdict_ogl
% @type categorical
% @canonical false
% @original_name Review verdict (Outdoor Gear Lab)
% @values too_soft_rockered=Too_soft_rockered_for_best_all_mountain unk_review_verdict_ogl=Unknown
% @importance 0.85

0.82::true_val(review_verdict_ogl, too_soft_rockered); 0.18::true_val(review_verdict_ogl, unk_review_verdict_ogl).

measured(s5, review_verdict_ogl, too_soft_rockered).

all_consistent(review_verdict_ogl) :-
    consistent(s5, review_verdict_ogl).

evidence(all_consistent(review_verdict_ogl)).
query(true_val(review_verdict_ogl, too_soft_rockered)).
query(true_val(review_verdict_ogl, unk_review_verdict_ogl)).

0.82::acc(s85, review_snowboardhow).

% @attr review_snowboardhow
% @type categorical
% @canonical false
% @original_name Review (snowboardhow.com)
% @values excellent_int_adv=Excellent_intermediate_to_advanced_too_aggressive_beginners unk_review_snowboardhow=Unknown
% @importance 0.80

0.82::true_val(review_snowboardhow, excellent_int_adv); 0.18::true_val(review_snowboardhow, unk_review_snowboardhow).

measured(s85, review_snowboardhow, excellent_int_adv).

all_consistent(review_snowboardhow) :-
    consistent(s85, review_snowboardhow).

evidence(all_consistent(review_snowboardhow)).
query(true_val(review_snowboardhow, excellent_int_adv)).
query(true_val(review_snowboardhow, unk_review_snowboardhow)).

0.80::acc(s83, review_extremenomads).

% @attr review_extremenomads
% @type categorical
% @canonical false
% @original_name Review (extremenomads.life)
% @values suited_int_expert=Better_suited_intermediate_expert_despite_forgiving unk_review_extremenomads=Unknown
% @importance 0.80

0.80::true_val(review_extremenomads, suited_int_expert); 0.20::true_val(review_extremenomads, unk_review_extremenomads).

measured(s83, review_extremenomads, suited_int_expert).

all_consistent(review_extremenomads) :-
    consistent(s83, review_extremenomads).

evidence(all_consistent(review_extremenomads)).
query(true_val(review_extremenomads, suited_int_expert)).
query(true_val(review_extremenomads, unk_review_extremenomads)).

0.82::acc(s12, review_board_of_world).

% @attr review_board_of_world
% @type categorical
% @canonical false
% @original_name Review (Board of the World)
% @values fv_better_powder_butter_beginners=FlyingV_better_powder_buttering_beginners unk_review_board_of_world=Unknown
% @importance 0.80

0.82::true_val(review_board_of_world, fv_better_powder_butter_beginners); 0.18::true_val(review_board_of_world, unk_review_board_of_world).

measured(s12, review_board_of_world, fv_better_powder_butter_beginners).

all_consistent(review_board_of_world) :-
    consistent(s12, review_board_of_world).

evidence(all_consistent(review_board_of_world)).
query(true_val(review_board_of_world, fv_better_powder_butter_beginners)).
query(true_val(review_board_of_world, unk_review_board_of_world)).

0.85::acc(s7, reviewer_opinion_the_good_ride_hardpack).
0.78::acc(s36, reviewer_opinion_the_good_ride_hardpack).

% @attr reviewer_opinion_the_good_ride_hardpack
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (hardpack)
% @values dangerous_speed_hardpack=Hard_pack_ice_dangerous_at_speed_soft_snow_only unk_reviewer_opinion_the_good_ride_hardpack=Unknown
% @importance 0.88

0.90::true_val(reviewer_opinion_the_good_ride_hardpack, dangerous_speed_hardpack); 0.10::true_val(reviewer_opinion_the_good_ride_hardpack, unk_reviewer_opinion_the_good_ride_hardpack).

measured(s7, reviewer_opinion_the_good_ride_hardpack, dangerous_speed_hardpack).
measured(s36, reviewer_opinion_the_good_ride_hardpack, dangerous_speed_hardpack).

all_consistent(reviewer_opinion_the_good_ride_hardpack) :-
    consistent(s7, reviewer_opinion_the_good_ride_hardpack),
    consistent(s36, reviewer_opinion_the_good_ride_hardpack).

evidence(all_consistent(reviewer_opinion_the_good_ride_hardpack)).
query(true_val(reviewer_opinion_the_good_ride_hardpack, dangerous_speed_hardpack)).
query(true_val(reviewer_opinion_the_good_ride_hardpack, unk_reviewer_opinion_the_good_ride_hardpack)).

0.72::acc(s30, user_review_forum).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values best_board_proper_carving=Best_board_ever_edge_grip_fine_with_technique unk_user_review_forum=Unknown
% @importance 0.70

0.72::true_val(user_review_forum, best_board_proper_carving); 0.28::true_val(user_review_forum, unk_user_review_forum).

measured(s30, user_review_forum, best_board_proper_carving).

all_consistent(user_review_forum) :-
    consistent(s30, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, best_board_proper_carving)).
query(true_val(user_review_forum, unk_user_review_forum)).

0.75::acc(s24, user_review_forum_lightweight).

% @attr user_review_forum_lightweight
% @type categorical
% @canonical false
% @original_name user_review_forum (lightweight)
% @values lightweight_stable_playful=Lightweight_stable_playful_worse_edge_grip unk_user_review_forum_lightweight=Unknown
% @importance 0.75

0.75::true_val(user_review_forum_lightweight, lightweight_stable_playful); 0.25::true_val(user_review_forum_lightweight, unk_user_review_forum_lightweight).

measured(s24, user_review_forum_lightweight, lightweight_stable_playful).

all_consistent(user_review_forum_lightweight) :-
    consistent(s24, user_review_forum_lightweight).

evidence(all_consistent(user_review_forum_lightweight)).
query(true_val(user_review_forum_lightweight, lightweight_stable_playful)).
query(true_val(user_review_forum_lightweight, unk_user_review_forum_lightweight)).

0.85::acc(s36, reviewer_opinion_the_good_ride_consistency).

% @attr reviewer_opinion_the_good_ride_consistency
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (consistency)
% @values unchanged_since_2014=Ride_personality_unchanged_since_2014_incremental unk_reviewer_opinion_the_good_ride_consistency=Unknown
% @importance 0.80

0.85::true_val(reviewer_opinion_the_good_ride_consistency, unchanged_since_2014); 0.15::true_val(reviewer_opinion_the_good_ride_consistency, unk_reviewer_opinion_the_good_ride_consistency).

measured(s36, reviewer_opinion_the_good_ride_consistency, unchanged_since_2014).

all_consistent(reviewer_opinion_the_good_ride_consistency) :-
    consistent(s36, reviewer_opinion_the_good_ride_consistency).

evidence(all_consistent(reviewer_opinion_the_good_ride_consistency)).
query(true_val(reviewer_opinion_the_good_ride_consistency, unchanged_since_2014)).
query(true_val(reviewer_opinion_the_good_ride_consistency, unk_reviewer_opinion_the_good_ride_consistency)).

0.85::acc(s8, infinite_ride_verdict).
0.88::acc(s10, infinite_ride_verdict).

% @attr infinite_ride_verdict
% @type categorical
% @canonical false
% @original_name Infinite Ride verdict (review sites)
% @values flex_maintained_no_breakin=Flex_maintained_no_break_in_period unk_infinite_ride_verdict=Unknown
% @importance 0.78

0.90::true_val(infinite_ride_verdict, flex_maintained_no_breakin); 0.10::true_val(infinite_ride_verdict, unk_infinite_ride_verdict).

measured(s8, infinite_ride_verdict, flex_maintained_no_breakin).
measured(s10, infinite_ride_verdict, flex_maintained_no_breakin).

all_consistent(infinite_ride_verdict) :-
    (indep(s8), consistent(s8, infinite_ride_verdict) ; \+indep(s8)),
    (indep(s10), consistent(s10, infinite_ride_verdict) ; \+indep(s10)).

evidence(all_consistent(infinite_ride_verdict)).
query(true_val(infinite_ride_verdict, flex_maintained_no_breakin)).
query(true_val(infinite_ride_verdict, unk_infinite_ride_verdict)).

0.88::acc(s10, sustainability_certification).
0.88::acc(s17, sustainability_certification).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values super_sap_50pct=Super_Sap_Epoxy_50pct_carbon_reduction unk_sustainability_certification=Unknown
% @importance 0.85

0.93::true_val(sustainability_certification, super_sap_50pct); 0.07::true_val(sustainability_certification, unk_sustainability_certification).

measured(s10, sustainability_certification, super_sap_50pct).
measured(s17, sustainability_certification, super_sap_50pct).

all_consistent(sustainability_certification) :-
    (indep(s10), consistent(s10, sustainability_certification) ; \+indep(s10)),
    (indep(s17), consistent(s17, sustainability_certification) ; \+indep(s17)).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, super_sap_50pct)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

0.70::acc(s28, sustainability_certification_fsc).
0.68::acc(s40, sustainability_certification_fsc).

% @attr sustainability_certification_fsc
% @type categorical
% @canonical false
% @original_name sustainability_certification (FSC)
% @values fsc_past_unverified_2027=FSC_certified_past_models_unverified_2027 unk_sustainability_certification_fsc=Unknown
% @importance 0.45

0.60::true_val(sustainability_certification_fsc, fsc_past_unverified_2027); 0.40::true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc).

measured(s28, sustainability_certification_fsc, fsc_past_unverified_2027).
measured(s40, sustainability_certification_fsc, fsc_past_unverified_2027).

all_consistent(sustainability_certification_fsc) :-
    (indep(s28), consistent(s28, sustainability_certification_fsc) ; \+indep(s28)),
    (indep(s40), consistent(s40, sustainability_certification_fsc) ; \+indep(s40)).

evidence(all_consistent(sustainability_certification_fsc)).
query(true_val(sustainability_certification_fsc, fsc_past_unverified_2027)).
query(true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc)).

0.82::acc(s12, burton_custom_camber_flex).

% @attr burton_custom_camber_flex
% @type numeric
% @unit /10
% @canonical false
% @original_name Burton Custom Camber flex
% @values v6=6.0 unk_burton_custom_camber_flex=Unknown
% @importance 0.80

0.82::true_val(burton_custom_camber_flex, v6); 0.18::true_val(burton_custom_camber_flex, unk_burton_custom_camber_flex).

measured(s12, burton_custom_camber_flex, v6).

all_consistent(burton_custom_camber_flex) :-
    consistent(s12, burton_custom_camber_flex).

evidence(all_consistent(burton_custom_camber_flex)).
query(true_val(burton_custom_camber_flex, v6)).
query(true_val(burton_custom_camber_flex, unk_burton_custom_camber_flex)).

0.82::acc(s12, burton_custom_camber_msrp).

% @attr burton_custom_camber_msrp
% @type numeric
% @unit USD
% @canonical false
% @original_name Burton Custom Camber MSRP
% @values v669_95=669.95 unk_burton_custom_camber_msrp=Unknown
% @importance 0.80

0.82::true_val(burton_custom_camber_msrp, v669_95); 0.18::true_val(burton_custom_camber_msrp, unk_burton_custom_camber_msrp).

measured(s12, burton_custom_camber_msrp, v669_95).

all_consistent(burton_custom_camber_msrp) :-
    consistent(s12, burton_custom_camber_msrp).

evidence(all_consistent(burton_custom_camber_msrp)).
query(true_val(burton_custom_camber_msrp, v669_95)).
query(true_val(burton_custom_camber_msrp, unk_burton_custom_camber_msrp)).

0.78::acc(s53, comparable_board_cross_brand).
0.82::acc(s12, comparable_board_cross_brand).
0.78::acc(s60, comparable_board_cross_brand).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values jones_mt=Jones_Mountain_Twin_camrock_TractionTech unk_comparable_board_cross_brand=Unknown
% @importance 0.77

0.90::true_val(comparable_board_cross_brand, jones_mt); 0.10::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s53, comparable_board_cross_brand, jones_mt).
measured(s12, comparable_board_cross_brand, jones_mt).
measured(s60, comparable_board_cross_brand, jones_mt).

all_consistent(comparable_board_cross_brand) :-
    consistent(s53, comparable_board_cross_brand),
    consistent(s12, comparable_board_cross_brand),
    consistent(s60, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, jones_mt)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

0.80::acc(s12, jones_mt_pricing).

% @attr jones_mt_pricing
% @type categorical
% @canonical false
% @original_name Jones Mountain Twin pricing
% @values approx_120_less=Approximately_120_USD_less_than_Custom_Camber unk_jones_mt_pricing=Unknown
% @importance 0.80

0.80::true_val(jones_mt_pricing, approx_120_less); 0.20::true_val(jones_mt_pricing, unk_jones_mt_pricing).

measured(s12, jones_mt_pricing, approx_120_less).

all_consistent(jones_mt_pricing) :-
    consistent(s12, jones_mt_pricing).

evidence(all_consistent(jones_mt_pricing)).
query(true_val(jones_mt_pricing, approx_120_less)).
query(true_val(jones_mt_pricing, unk_jones_mt_pricing)).

0.82::acc(s12, jones_mt_edge_hold).
0.78::acc(s60, jones_mt_edge_hold).

% @attr jones_mt_edge_hold
% @type categorical
% @canonical false
% @original_name Jones Mountain Twin edge hold advantage
% @values traction_tech_2_0=Traction_Tech_2_0_better_ice_grip unk_jones_mt_edge_hold=Unknown
% @importance 0.75

0.88::true_val(jones_mt_edge_hold, traction_tech_2_0); 0.12::true_val(jones_mt_edge_hold, unk_jones_mt_edge_hold).

measured(s12, jones_mt_edge_hold, traction_tech_2_0).
measured(s60, jones_mt_edge_hold, traction_tech_2_0).

all_consistent(jones_mt_edge_hold) :-
    consistent(s12, jones_mt_edge_hold),
    consistent(s60, jones_mt_edge_hold).

evidence(all_consistent(jones_mt_edge_hold)).
query(true_val(jones_mt_edge_hold, traction_tech_2_0)).
query(true_val(jones_mt_edge_hold, unk_jones_mt_edge_hold)).

0.70::acc(s57, comparable_board_cross_brand_ride_algorythm).

% @attr comparable_board_cross_brand_ride_algorythm
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Ride Algorythm)
% @values ride_algorythm=Ride_Algorythm_cam_rock_versatile unk_comparable_board_cross_brand_ride_algorythm=Unknown
% @importance 0.60

0.70::true_val(comparable_board_cross_brand_ride_algorythm, ride_algorythm); 0.30::true_val(comparable_board_cross_brand_ride_algorythm, unk_comparable_board_cross_brand_ride_algorythm).

measured(s57, comparable_board_cross_brand_ride_algorythm, ride_algorythm).

all_consistent(comparable_board_cross_brand_ride_algorythm) :-
    consistent(s57, comparable_board_cross_brand_ride_algorythm).

evidence(all_consistent(comparable_board_cross_brand_ride_algorythm)).
query(true_val(comparable_board_cross_brand_ride_algorythm, ride_algorythm)).
query(true_val(comparable_board_cross_brand_ride_algorythm, unk_comparable_board_cross_brand_ride_algorythm)).

0.82::acc(s5, comparable_board_cross_brand_ns_proto).

% @attr comparable_board_cross_brand_ns_proto
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Never Summer Proto Type Two)
% @values ns_proto_type_two=NS_Proto_Type_Two_9_10_powder_better_pop unk_comparable_board_cross_brand_ns_proto=Unknown
% @importance 0.85

0.82::true_val(comparable_board_cross_brand_ns_proto, ns_proto_type_two); 0.18::true_val(comparable_board_cross_brand_ns_proto, unk_comparable_board_cross_brand_ns_proto).

measured(s5, comparable_board_cross_brand_ns_proto, ns_proto_type_two).

all_consistent(comparable_board_cross_brand_ns_proto) :-
    consistent(s5, comparable_board_cross_brand_ns_proto).

evidence(all_consistent(comparable_board_cross_brand_ns_proto)).
query(true_val(comparable_board_cross_brand_ns_proto, ns_proto_type_two)).
query(true_val(comparable_board_cross_brand_ns_proto, unk_comparable_board_cross_brand_ns_proto)).

0.82::acc(s5, comparable_board_same_brand_flight_attendant).

% @attr comparable_board_same_brand_flight_attendant
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Flight Attendant)
% @values flight_attendant=Burton_Flight_Attendant_better_stability_powder unk_comparable_board_same_brand_flight_attendant=Unknown
% @importance 0.85

0.82::true_val(comparable_board_same_brand_flight_attendant, flight_attendant); 0.18::true_val(comparable_board_same_brand_flight_attendant, unk_comparable_board_same_brand_flight_attendant).

measured(s5, comparable_board_same_brand_flight_attendant, flight_attendant).

all_consistent(comparable_board_same_brand_flight_attendant) :-
    consistent(s5, comparable_board_same_brand_flight_attendant).

evidence(all_consistent(comparable_board_same_brand_flight_attendant)).
query(true_val(comparable_board_same_brand_flight_attendant, flight_attendant)).
query(true_val(comparable_board_same_brand_flight_attendant, unk_comparable_board_same_brand_flight_attendant)).

0.82::acc(s5, comparable_board_cross_brand_lib_tech_trice).

% @attr comparable_board_cross_brand_lib_tech_trice
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Lib Tech Travis Rice Pro)
% @values lib_tech_trice_pro=Lib_Tech_Travis_Rice_Pro_best_edge_hold unk_comparable_board_cross_brand_lib_tech_trice=Unknown
% @importance 0.85

0.82::true_val(comparable_board_cross_brand_lib_tech_trice, lib_tech_trice_pro); 0.18::true_val(comparable_board_cross_brand_lib_tech_trice, unk_comparable_board_cross_brand_lib_tech_trice).

measured(s5, comparable_board_cross_brand_lib_tech_trice, lib_tech_trice_pro).

all_consistent(comparable_board_cross_brand_lib_tech_trice) :-
    consistent(s5, comparable_board_cross_brand_lib_tech_trice).

evidence(all_consistent(comparable_board_cross_brand_lib_tech_trice)).
query(true_val(comparable_board_cross_brand_lib_tech_trice, lib_tech_trice_pro)).
query(true_val(comparable_board_cross_brand_lib_tech_trice, unk_comparable_board_cross_brand_lib_tech_trice)).

0.72::acc(s15, comparable_board_cross_brand_forgiving_icy).

% @attr comparable_board_cross_brand_forgiving_icy
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (YES Typo / NS Snowtrooper)
% @values yes_typo_ns_snowtrooper=YES_Typo_NS_Snowtrooper_forgiving_better_ice unk_comparable_board_cross_brand_forgiving_icy=Unknown
% @importance 0.70

0.72::true_val(comparable_board_cross_brand_forgiving_icy, yes_typo_ns_snowtrooper); 0.28::true_val(comparable_board_cross_brand_forgiving_icy, unk_comparable_board_cross_brand_forgiving_icy).

measured(s15, comparable_board_cross_brand_forgiving_icy, yes_typo_ns_snowtrooper).

all_consistent(comparable_board_cross_brand_forgiving_icy) :-
    consistent(s15, comparable_board_cross_brand_forgiving_icy).

evidence(all_consistent(comparable_board_cross_brand_forgiving_icy)).
query(true_val(comparable_board_cross_brand_forgiving_icy, yes_typo_ns_snowtrooper)).
query(true_val(comparable_board_cross_brand_forgiving_icy, unk_comparable_board_cross_brand_forgiving_icy)).

0.78::acc(s80, comparable_board_same_brand_process_fv).

% @attr comparable_board_same_brand_process_fv
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Process Flying V)
% @values process_fv=Burton_Process_Flying_V_softer_freestyle unk_comparable_board_same_brand_process_fv=Unknown
% @importance 0.50

0.78::true_val(comparable_board_same_brand_process_fv, process_fv); 0.22::true_val(comparable_board_same_brand_process_fv, unk_comparable_board_same_brand_process_fv).

measured(s80, comparable_board_same_brand_process_fv, process_fv).

all_consistent(comparable_board_same_brand_process_fv) :-
    (indep(s80), consistent(s80, comparable_board_same_brand_process_fv) ; \+indep(s80)).

evidence(all_consistent(comparable_board_same_brand_process_fv)).
query(true_val(comparable_board_same_brand_process_fv, process_fv)).
query(true_val(comparable_board_same_brand_process_fv, unk_comparable_board_same_brand_process_fv)).

0.75::acc(s53, user_review_forum_jones_preferred).

% @attr user_review_forum_jones_preferred
% @type categorical
% @canonical false
% @original_name user_review_forum (Jones MT preferred)
% @values jones_mt_preferred_icy=Jones_MT_preferred_icy_East_Coast unk_user_review_forum_jones_preferred=Unknown
% @importance 0.80

0.75::true_val(user_review_forum_jones_preferred, jones_mt_preferred_icy); 0.25::true_val(user_review_forum_jones_preferred, unk_user_review_forum_jones_preferred).

measured(s53, user_review_forum_jones_preferred, jones_mt_preferred_icy).

all_consistent(user_review_forum_jones_preferred) :-
    consistent(s53, user_review_forum_jones_preferred).

evidence(all_consistent(user_review_forum_jones_preferred)).
query(true_val(user_review_forum_jones_preferred, jones_mt_preferred_icy)).
query(true_val(user_review_forum_jones_preferred, unk_user_review_forum_jones_preferred)).

0.82::acc(s2, retailer_burton).

% @attr retailer_burton
% @type categorical
% @canonical false
% @original_name Burton.com
% @values official_store_premium=Official_manufacturer_3yr_warranty_preorder unk_retailer_burton=Unknown
% @importance 0.80

0.88::true_val(retailer_burton, official_store_premium); 0.12::true_val(retailer_burton, unk_retailer_burton).

measured(s2, retailer_burton, official_store_premium).

all_consistent(retailer_burton) :-
    consistent(s2, retailer_burton).

evidence(all_consistent(retailer_burton)).
query(true_val(retailer_burton, official_store_premium)).
query(true_val(retailer_burton, unk_retailer_burton)).

0.88::acc(s10, retailer_evo).

% @attr retailer_evo
% @type categorical
% @canonical false
% @original_name evo.com
% @values large_us_retailer=Large_US_online_5pct_pricebeat_10pct_rewards unk_retailer_evo=Unknown
% @importance 0.88

0.90::true_val(retailer_evo, large_us_retailer); 0.10::true_val(retailer_evo, unk_retailer_evo).

measured(s10, retailer_evo, large_us_retailer).

all_consistent(retailer_evo) :-
    (indep(s10), consistent(s10, retailer_evo) ; \+indep(s10)).

evidence(all_consistent(retailer_evo)).
query(true_val(retailer_evo, large_us_retailer)).
query(true_val(retailer_evo, unk_retailer_evo)).

0.85::acc(s14, retailer_rei).

% @attr retailer_rei
% @type categorical
% @canonical false
% @original_name REI Co-op
% @values major_us_outdoor=Major_US_outdoor_retailer_member_benefits unk_retailer_rei=Unknown
% @importance 0.60

0.85::true_val(retailer_rei, major_us_outdoor); 0.15::true_val(retailer_rei, unk_retailer_rei).

measured(s14, retailer_rei, major_us_outdoor).

all_consistent(retailer_rei) :-
    (indep(s14), consistent(s14, retailer_rei) ; \+indep(s14)).

evidence(all_consistent(retailer_rei)).
query(true_val(retailer_rei, major_us_outdoor)).
query(true_val(retailer_rei, unk_retailer_rei)).

0.82::acc(s16, retailer_backcountry).

% @attr retailer_backcountry
% @type categorical
% @canonical false
% @original_name Backcountry.com
% @values large_us_online=Large_US_online_retailer_expert_staff unk_retailer_backcountry=Unknown
% @importance 0.50

0.82::true_val(retailer_backcountry, large_us_online); 0.18::true_val(retailer_backcountry, unk_retailer_backcountry).

measured(s16, retailer_backcountry, large_us_online).

all_consistent(retailer_backcountry) :-
    (indep(s16), consistent(s16, retailer_backcountry) ; \+indep(s16)).

evidence(all_consistent(retailer_backcountry)).
query(true_val(retailer_backcountry, large_us_online)).
query(true_val(retailer_backcountry, unk_retailer_backcountry)).

0.85::acc(s1, retailer_the_house).

% @attr retailer_the_house
% @type categorical
% @canonical false
% @original_name The-House.com
% @values longstanding_board_sports=Long_standing_board_sports_90day_returns unk_retailer_the_house=Unknown
% @importance 0.85

0.85::true_val(retailer_the_house, longstanding_board_sports); 0.15::true_val(retailer_the_house, unk_retailer_the_house).

measured(s1, retailer_the_house, longstanding_board_sports).

all_consistent(retailer_the_house) :-
    (indep(s1), consistent(s1, retailer_the_house) ; \+indep(s1)).

evidence(all_consistent(retailer_the_house)).
query(true_val(retailer_the_house, longstanding_board_sports)).
query(true_val(retailer_the_house, unk_retailer_the_house)).

0.85::acc(s38, retailer_eriks).

% @attr retailer_eriks
% @type categorical
% @canonical false
% @original_name ERIK'S Bike Board and Ski
% @values us_midwest_bundle_discount=US_Midwest_10pct_bundle_free_binding_install unk_retailer_eriks=Unknown
% @importance 0.68

0.85::true_val(retailer_eriks, us_midwest_bundle_discount); 0.15::true_val(retailer_eriks, unk_retailer_eriks).

measured(s38, retailer_eriks, us_midwest_bundle_discount).

all_consistent(retailer_eriks) :-
    (indep(s38), consistent(s38, retailer_eriks) ; \+indep(s38)).

evidence(all_consistent(retailer_eriks)).
query(true_val(retailer_eriks, us_midwest_bundle_discount)).
query(true_val(retailer_eriks, unk_retailer_eriks)).

0.82::acc(s92, retailer_peter_glenn).

% @attr retailer_peter_glenn
% @type categorical
% @canonical false
% @original_name Peter Glenn
% @values us_specialty_sports=US_specialty_sports_retailer unk_retailer_peter_glenn=Unknown
% @importance 0.90

0.82::true_val(retailer_peter_glenn, us_specialty_sports); 0.18::true_val(retailer_peter_glenn, unk_retailer_peter_glenn).

measured(s92, retailer_peter_glenn, us_specialty_sports).

all_consistent(retailer_peter_glenn) :-
    (indep(s92), consistent(s92, retailer_peter_glenn) ; \+indep(s92)).

evidence(all_consistent(retailer_peter_glenn)).
query(true_val(retailer_peter_glenn, us_specialty_sports)).
query(true_val(retailer_peter_glenn, unk_retailer_peter_glenn)).

0.85::acc(s8, retailer_salty_peaks).

% @attr retailer_salty_peaks
% @type categorical
% @canonical false
% @original_name Salty Peaks
% @values specialty_slc=Specialty_snowboard_shop_Salt_Lake_City unk_retailer_salty_peaks=Unknown
% @importance 0.70

0.85::true_val(retailer_salty_peaks, specialty_slc); 0.15::true_val(retailer_salty_peaks, unk_retailer_salty_peaks).

measured(s8, retailer_salty_peaks, specialty_slc).

all_consistent(retailer_salty_peaks) :-
    (indep(s8), consistent(s8, retailer_salty_peaks) ; \+indep(s8)).

evidence(all_consistent(retailer_salty_peaks)).
query(true_val(retailer_salty_peaks, specialty_slc)).
query(true_val(retailer_salty_peaks, unk_retailer_salty_peaks)).

0.80::acc(s39, retailer_amazon).

% @attr retailer_amazon
% @type categorical
% @canonical false
% @original_name Amazon
% @values amazon_us=Available_Amazon_US unk_retailer_amazon=Unknown
% @importance 0.60

0.82::true_val(retailer_amazon, amazon_us); 0.18::true_val(retailer_amazon, unk_retailer_amazon).

measured(s39, retailer_amazon, amazon_us).

all_consistent(retailer_amazon) :-
    (indep(s39), consistent(s39, retailer_amazon) ; \+indep(s39)).

evidence(all_consistent(retailer_amazon)).
query(true_val(retailer_amazon, amazon_us)).
query(true_val(retailer_amazon, unk_retailer_amazon)).

0.85::acc(s6, retailer_auski).

% @attr retailer_auski
% @type categorical
% @canonical false
% @original_name Auski Australia
% @values au_since_1949=Australian_retailer_since_1949_free_shipping unk_retailer_auski=Unknown
% @importance 0.70

0.85::true_val(retailer_auski, au_since_1949); 0.15::true_val(retailer_auski, unk_retailer_auski).

measured(s6, retailer_auski, au_since_1949).

all_consistent(retailer_auski) :-
    (indep(s6), consistent(s6, retailer_auski) ; \+indep(s6)).

evidence(all_consistent(retailer_auski)).
query(true_val(retailer_auski, au_since_1949)).
query(true_val(retailer_auski, unk_retailer_auski)).

0.85::acc(s74, retailer_twelve_board).

% @attr retailer_twelve_board
% @type categorical
% @canonical false
% @original_name Twelve Board Store (AU)
% @values melbourne_free_ship=Melbourne_based_free_shipping_over_90 unk_retailer_twelve_board=Unknown
% @importance 0.85

0.85::true_val(retailer_twelve_board, melbourne_free_ship); 0.15::true_val(retailer_twelve_board, unk_retailer_twelve_board).

measured(s74, retailer_twelve_board, melbourne_free_ship).

all_consistent(retailer_twelve_board) :-
    (indep(s74), consistent(s74, retailer_twelve_board) ; \+indep(s74)).

evidence(all_consistent(retailer_twelve_board)).
query(true_val(retailer_twelve_board, melbourne_free_ship)).
query(true_val(retailer_twelve_board, unk_retailer_twelve_board)).

0.88::acc(s_m, retailer_melbourne_snowboard).

% @attr retailer_melbourne_snowboard
% @type categorical
% @canonical false
% @original_name Melbourne Snowboard Centre (AU)
% @values independent_au_30day=Independent_AU_store_30day_returns unk_retailer_melbourne_snowboard=Unknown
% @importance 0.80

0.88::true_val(retailer_melbourne_snowboard, independent_au_30day); 0.12::true_val(retailer_melbourne_snowboard, unk_retailer_melbourne_snowboard).

measured(s_m, retailer_melbourne_snowboard, independent_au_30day).

all_consistent(retailer_melbourne_snowboard) :-
    (indep(s_m), consistent(s_m, retailer_melbourne_snowboard) ; \+indep(s_m)).

evidence(all_consistent(retailer_melbourne_snowboard)).
query(true_val(retailer_melbourne_snowboard, independent_au_30day)).
query(true_val(retailer_melbourne_snowboard, unk_retailer_melbourne_snowboard)).

0.85::acc(s9, retailer_quest_store).

% @attr retailer_quest_store
% @type categorical
% @canonical false
% @original_name Quest Store (NZ)
% @values queenstown_click_collect=Queenstown_free_click_collect unk_retailer_quest_store=Unknown
% @importance 0.70

0.85::true_val(retailer_quest_store, queenstown_click_collect); 0.15::true_val(retailer_quest_store, unk_retailer_quest_store).

measured(s9, retailer_quest_store, queenstown_click_collect).

all_consistent(retailer_quest_store) :-
    (indep(s9), consistent(s9, retailer_quest_store) ; \+indep(s9)).

evidence(all_consistent(retailer_quest_store)).
query(true_val(retailer_quest_store, queenstown_click_collect)).
query(true_val(retailer_quest_store, unk_retailer_quest_store)).

% @attr retailer_ebay
% @type categorical
% @canonical false
% @original_name eBay
% @values used_new_third_party=Used_and_new_from_third_party_sellers unk_retailer_ebay=Unknown
% @importance 0.55

0.65::true_val(retailer_ebay, used_new_third_party); 0.35::true_val(retailer_ebay, unk_retailer_ebay).

all_consistent(retailer_ebay).

evidence(all_consistent(retailer_ebay)).
query(true_val(retailer_ebay, used_new_third_party)).
query(true_val(retailer_ebay, unk_retailer_ebay)).

0.90::acc(s10, binding_compatibility).
0.90::acc(s17, binding_compatibility).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values channel_all_major=Channel_compatible_all_major_binding_brands unk_binding_compatibility=Unknown
% @importance 0.85

0.95::true_val(binding_compatibility, channel_all_major); 0.05::true_val(binding_compatibility, unk_binding_compatibility).

measured(s10, binding_compatibility, channel_all_major).
measured(s17, binding_compatibility, channel_all_major).

all_consistent(binding_compatibility) :-
    (indep(s10), consistent(s10, binding_compatibility) ; \+indep(s10)),
    (indep(s17), consistent(s17, binding_compatibility) ; \+indep(s17)).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, channel_all_major)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

0.88::acc(s_m, binding_compatibility_est).

% @attr binding_compatibility_est
% @type categorical
% @canonical false
% @original_name binding_compatibility (EST)
% @values best_with_est=Best_compatibility_with_Burton_EST unk_binding_compatibility_est=Unknown
% @importance 0.83

0.90::true_val(binding_compatibility_est, best_with_est); 0.10::true_val(binding_compatibility_est, unk_binding_compatibility_est).

measured(s_m, binding_compatibility_est, best_with_est).

all_consistent(binding_compatibility_est) :-
    (indep(s_m), consistent(s_m, binding_compatibility_est) ; \+indep(s_m)).

evidence(all_consistent(binding_compatibility_est)).
query(true_val(binding_compatibility_est, best_with_est)).
query(true_val(binding_compatibility_est, unk_binding_compatibility_est)).

0.75::acc(s2, binding_compatibility_reflex).

% @attr binding_compatibility_reflex
% @type categorical
% @canonical false
% @original_name binding_compatibility (Re:Flex)
% @values also_reflex=Also_compatible_Burton_ReFlex unk_binding_compatibility_reflex=Unknown
% @importance 0.75

0.80::true_val(binding_compatibility_reflex, also_reflex); 0.20::true_val(binding_compatibility_reflex, unk_binding_compatibility_reflex).

measured(s2, binding_compatibility_reflex, also_reflex).

all_consistent(binding_compatibility_reflex) :-
    consistent(s2, binding_compatibility_reflex).

evidence(all_consistent(binding_compatibility_reflex)).
query(true_val(binding_compatibility_reflex, also_reflex)).
query(true_val(binding_compatibility_reflex, unk_binding_compatibility_reflex)).

0.88::acc(s10, channel_inserts_required).

% @attr channel_inserts_required
% @type categorical
% @canonical false
% @original_name Channel inserts required to mount bindings
% @values included_with_board=Included_with_board unk_channel_inserts_required=Unknown
% @importance 0.85

0.90::true_val(channel_inserts_required, included_with_board); 0.10::true_val(channel_inserts_required, unk_channel_inserts_required).

measured(s10, channel_inserts_required, included_with_board).

all_consistent(channel_inserts_required) :-
    (indep(s10), consistent(s10, channel_inserts_required) ; \+indep(s10)).

evidence(all_consistent(channel_inserts_required)).
query(true_val(channel_inserts_required, included_with_board)).
query(true_val(channel_inserts_required, unk_channel_inserts_required)).

0.93::acc(s_m, sidecut_type).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values standard_radial=Standard_radial_sidecut unk_sidecut_type=Unknown
% @importance 0.85

0.93::true_val(sidecut_type, standard_radial); 0.07::true_val(sidecut_type, unk_sidecut_type).

measured(s_m, sidecut_type, standard_radial).

all_consistent(sidecut_type) :-
    (indep(s_m), consistent(s_m, sidecut_type) ; \+indep(s_m)).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, standard_radial)).
query(true_val(sidecut_type, unk_sidecut_type)).

0.90::acc(s1, base_type).
0.88::acc(s10, base_type).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values sintered=Sintered unk_base_type=Unknown
% @importance 0.88

0.95::true_val(base_type, sintered); 0.05::true_val(base_type, unk_base_type).

measured(s1, base_type, sintered).
measured(s10, base_type, sintered).

all_consistent(base_type) :-
    (indep(s1), consistent(s1, base_type) ; \+indep(s1)),
    (indep(s10), consistent(s10, base_type) ; \+indep(s10)).

evidence(all_consistent(base_type)).
query(true_val(base_type, sintered)).
query(true_val(base_type, unk_base_type)).

0.55::acc(s30, sidewall_material).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values not_specified=Not_explicitly_specified_2027 unk_sidewall_material=Unknown
% @importance 0.55

0.55::true_val(sidewall_material, not_specified); 0.45::true_val(sidewall_material, unk_sidewall_material).

measured(s30, sidewall_material, not_specified).

all_consistent(sidewall_material) :-
    consistent(s30, sidewall_material).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, not_specified)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr topsheet
% @type categorical
% @canonical true
% @original_name topsheet
% @values not_specified=Not_explicitly_specified unk_topsheet=Unknown
% @importance 0.40

0.999::true_val(topsheet, not_specified); 0.001::true_val(topsheet, unk_topsheet).

all_consistent(topsheet).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, not_specified)).
query(true_val(topsheet, unk_topsheet)).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values not_specified=Not_specified_in_sources unk_manufacturing_location=Unknown
% @importance 0.40

0.999::true_val(manufacturing_location, not_specified); 0.001::true_val(manufacturing_location, unk_manufacturing_location).

all_consistent(manufacturing_location).

evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, not_specified)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

% @attr board_weight_grams
% @type categorical
% @canonical true
% @original_name board_weight_grams
% @values not_published=Not_published_by_Burton unk_board_weight_grams=Unknown
% @importance 0.40

0.999::true_val(board_weight_grams, not_published); 0.001::true_val(board_weight_grams, unk_board_weight_grams).

all_consistent(board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, not_published)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

0.82::acc(s36, recommended_stance_angles).

% @attr recommended_stance_angles
% @type categorical
% @canonical false
% @original_name Recommended stance angles (reviewer setups)
% @values duck_15_neg9_to_15_neg15=Typically_15_neg9_to_15_neg15_duck unk_recommended_stance_angles=Unknown
% @importance 0.80

0.82::true_val(recommended_stance_angles, duck_15_neg9_to_15_neg15); 0.18::true_val(recommended_stance_angles, unk_recommended_stance_angles).

measured(s36, recommended_stance_angles, duck_15_neg9_to_15_neg15).

all_consistent(recommended_stance_angles) :-
    consistent(s36, recommended_stance_angles).

evidence(all_consistent(recommended_stance_angles)).
query(true_val(recommended_stance_angles, duck_15_neg9_to_15_neg15)).
query(true_val(recommended_stance_angles, unk_recommended_stance_angles)).