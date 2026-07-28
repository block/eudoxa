0.30::indep(s3).
0.25::indep(s4).
0.60::indep(s6).
0.20::indep(s12).
0.25::indep(s13).
0.25::indep(s15).
0.15::indep(s16).
0.15::indep(s18).
0.20::indep(s19).
0.15::indep(s20).
0.20::indep(s22).
0.15::indep(s23).
0.20::indep(s25).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values rome=Rome unk_brand=Unknown
% @importance 0.75

0.95::acc(s1, brand).
0.90::acc(s2, brand).

0.97::true_val(brand, rome); 0.03::true_val(brand, unk_brand).

measured(s1, brand, rome).
measured(s2, brand, rome).

all_consistent(brand) :-
    consistent(s1, brand),
    consistent(s2, brand).

evidence(all_consistent(brand)).
query(true_val(brand, rome)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values boneless=Boneless unk_model_name=Unknown
% @importance 0.75

0.95::acc(s1, model_name).
0.90::acc(s2, model_name).

0.97::true_val(model_name, boneless); 0.03::true_val(model_name, unk_model_name).

measured(s1, model_name, boneless).
measured(s2, model_name, boneless).

all_consistent(model_name) :-
    consistent(s1, model_name),
    consistent(s2, model_name).

evidence(all_consistent(model_name)).
query(true_val(model_name, boneless)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2027=2027 unk_model_year=Unknown
% @importance 0.95

0.72::acc(s3, model_year).

0.71::true_val(model_year, y2027); 0.29::true_val(model_year, unk_model_year).

measured(s3, model_year, y2027).

all_consistent(model_year) :-
    (indep(s3), consistent(s3, model_year) ; \+indep(s3)).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2027)).
query(true_val(model_year, unk_model_year)).

% @attr model_series
% @type categorical
% @canonical false
% @original_name model series
% @values all_mountain_freestyle_line=All_Mountain_Freestyle_line unk_model_series=Unknown
% @importance 0.925

0.90::acc(s3, model_series).
0.85::acc(s4, model_series).

0.95::true_val(model_series, all_mountain_freestyle_line); 0.05::true_val(model_series, unk_model_series).

measured(s3, model_series, all_mountain_freestyle_line).
measured(s4, model_series, all_mountain_freestyle_line).

all_consistent(model_series) :-
    (indep(s3), consistent(s3, model_series) ; \+indep(s3)),
    (indep(s4), consistent(s4, model_series) ; \+indep(s4)).

evidence(all_consistent(model_series)).
query(true_val(model_series, all_mountain_freestyle_line)).
query(true_val(model_series, unk_model_series)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.75

0.95::acc(s1, product_type).
0.90::acc(s2, product_type).

0.97::true_val(product_type, snowboard); 0.03::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).
measured(s2, product_type, snowboard).

all_consistent(product_type) :-
    consistent(s1, product_type),
    consistent(s2, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain_freestyle=All_Mountain_Freestyle unk_board_category=Unknown
% @importance 0.925

0.90::acc(s3, board_category).
0.85::acc(s4, board_category).

0.95::true_val(board_category, all_mountain_freestyle); 0.05::true_val(board_category, unk_board_category).

measured(s3, board_category, all_mountain_freestyle).
measured(s4, board_category, all_mountain_freestyle).

all_consistent(board_category) :-
    (indep(s3), consistent(s3, board_category) ; \+indep(s3)),
    (indep(s4), consistent(s4, board_category) ; \+indep(s4)).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain_freestyle)).
query(true_val(board_category, unk_board_category)).

% @attr board_subtype
% @type categorical
% @canonical false
% @original_name board subtype
% @values unisex_am_freestyle_twin=Unisex_all_mountain_freestyle_twin unk_board_subtype=Unknown
% @importance 0.80

0.85::acc(s4, board_subtype).
0.82::acc(s5, board_subtype).

0.95::true_val(board_subtype, unisex_am_freestyle_twin); 0.05::true_val(board_subtype, unk_board_subtype).

measured(s4, board_subtype, unisex_am_freestyle_twin).
measured(s5, board_subtype, unisex_am_freestyle_twin).

all_consistent(board_subtype) :-
    (indep(s4), consistent(s4, board_subtype) ; \+indep(s4)),
    consistent(s5, board_subtype).

evidence(all_consistent(board_subtype)).
query(true_val(board_subtype, unisex_am_freestyle_twin)).
query(true_val(board_subtype, unk_board_subtype)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values unisex=Unisex unk_gender=Unknown
% @importance 0.85

0.95::acc(s1, gender).
0.82::acc(s5, gender).

0.95::true_val(gender, unisex); 0.05::true_val(gender, unk_gender).

measured(s1, gender, unisex).
measured(s5, gender, unisex).

all_consistent(gender) :-
    consistent(s1, gender),
    consistent(s5, gender).

evidence(all_consistent(gender)).
query(true_val(gender, unisex)).
query(true_val(gender, unk_gender)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values rome_sds=Rome_SDS unk_manufacturer=Unknown
% @importance 0.50

0.90::acc(s2, manufacturer).
0.70::acc(s6, manufacturer).

0.95::true_val(manufacturer, rome_sds); 0.05::true_val(manufacturer, unk_manufacturer).

measured(s2, manufacturer, rome_sds).
measured(s6, manufacturer, rome_sds).

all_consistent(manufacturer) :-
    consistent(s2, manufacturer),
    (indep(s6), consistent(s6, manufacturer) ; \+indep(s6)).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, rome_sds)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr manufacturer_headquarters
% @type categorical
% @canonical false
% @original_name manufacturer headquarters
% @values waterbury_vt=1_Derby_Lane_Waterbury_VT_05676 unk_manufacturer_headquarters=Unknown
% @importance 0.40

0.70::acc(s7, manufacturer_headquarters).
0.85::acc(s8, manufacturer_headquarters).

0.95::true_val(manufacturer_headquarters, waterbury_vt); 0.05::true_val(manufacturer_headquarters, unk_manufacturer_headquarters).

measured(s7, manufacturer_headquarters, waterbury_vt).
measured(s8, manufacturer_headquarters, waterbury_vt).

all_consistent(manufacturer_headquarters) :-
    consistent(s7, manufacturer_headquarters),
    consistent(s8, manufacturer_headquarters).

evidence(all_consistent(manufacturer_headquarters)).
query(true_val(manufacturer_headquarters, waterbury_vt)).
query(true_val(manufacturer_headquarters, unk_manufacturer_headquarters)).

% @attr manufacturer_founded
% @type categorical
% @canonical false
% @original_name manufacturer founded
% @values y2001=2001 unk_manufacturer_founded=Unknown
% @importance 0.45

0.70::acc(s6, manufacturer_founded).
0.85::acc(s9, manufacturer_founded).

0.95::true_val(manufacturer_founded, y2001); 0.05::true_val(manufacturer_founded, unk_manufacturer_founded).

measured(s6, manufacturer_founded, y2001).
measured(s9, manufacturer_founded, y2001).

all_consistent(manufacturer_founded) :-
    (indep(s6), consistent(s6, manufacturer_founded) ; \+indep(s6)),
    consistent(s9, manufacturer_founded).

evidence(all_consistent(manufacturer_founded)).
query(true_val(manufacturer_founded, y2001)).
query(true_val(manufacturer_founded, unk_manufacturer_founded)).

% @attr manufacturer_founders
% @type categorical
% @canonical false
% @original_name manufacturer founders
% @values reid_maravetz=Josh_Reid_and_Paul_Maravetz unk_manufacturer_founders=Unknown
% @importance 0.45

0.70::acc(s6, manufacturer_founders).
0.80::acc(s10, manufacturer_founders).

0.95::true_val(manufacturer_founders, reid_maravetz); 0.05::true_val(manufacturer_founders, unk_manufacturer_founders).

measured(s6, manufacturer_founders, reid_maravetz).
measured(s10, manufacturer_founders, reid_maravetz).

all_consistent(manufacturer_founders) :-
    (indep(s6), consistent(s6, manufacturer_founders) ; \+indep(s6)),
    consistent(s10, manufacturer_founders).

evidence(all_consistent(manufacturer_founders)).
query(true_val(manufacturer_founders, reid_maravetz)).
query(true_val(manufacturer_founders, unk_manufacturer_founders)).

% @attr parent_company
% @type categorical
% @canonical false
% @original_name parent company
% @values low_pressure_studio=Low_Pressure_Studio_Amsterdam unk_parent_company=Unknown
% @importance 0.50

0.75::acc(s11, parent_company).

0.68::true_val(parent_company, low_pressure_studio); 0.32::true_val(parent_company, unk_parent_company).

measured(s11, parent_company, low_pressure_studio).

all_consistent(parent_company) :-
    consistent(s11, parent_company).

evidence(all_consistent(parent_company)).
query(true_val(parent_company, low_pressure_studio)).
query(true_val(parent_company, unk_parent_company)).

% @attr design_location
% @type categorical
% @canonical false
% @original_name design location
% @values waterbury_vermont=Waterbury_Vermont unk_design_location=Unknown
% @importance 0.50

0.75::acc(s11, design_location).

0.68::true_val(design_location, waterbury_vermont); 0.32::true_val(design_location, unk_design_location).

measured(s11, design_location, waterbury_vermont).

all_consistent(design_location) :-
    consistent(s11, design_location).

evidence(all_consistent(design_location)).
query(true_val(design_location, waterbury_vermont)).
query(true_val(design_location, unk_design_location)).

% @attr manufacturer_bbb_rating
% @type categorical
% @canonical false
% @original_name manufacturer BBB rating
% @values a_plus=A_plus unk_manufacturer_bbb_rating=Unknown
% @importance 0.50

0.85::acc(s8, manufacturer_bbb_rating).

0.78::true_val(manufacturer_bbb_rating, a_plus); 0.22::true_val(manufacturer_bbb_rating, unk_manufacturer_bbb_rating).

measured(s8, manufacturer_bbb_rating, a_plus).

all_consistent(manufacturer_bbb_rating) :-
    consistent(s8, manufacturer_bbb_rating).

evidence(all_consistent(manufacturer_bbb_rating)).
query(true_val(manufacturer_bbb_rating, a_plus)).
query(true_val(manufacturer_bbb_rating, unk_manufacturer_bbb_rating)).

% @attr manufacturer_ethos_slogan
% @type categorical
% @canonical false
% @original_name manufacturer ethos/slogan
% @values all_ways_down=All_Ways_Down_We_make_snowboarding unk_manufacturer_ethos_slogan=Unknown
% @importance 0.25

0.60::acc(s12, manufacturer_ethos_slogan).
0.75::acc(s13, manufacturer_ethos_slogan).

0.90::true_val(manufacturer_ethos_slogan, all_ways_down); 0.10::true_val(manufacturer_ethos_slogan, unk_manufacturer_ethos_slogan).

measured(s12, manufacturer_ethos_slogan, all_ways_down).
measured(s13, manufacturer_ethos_slogan, all_ways_down).

all_consistent(manufacturer_ethos_slogan) :-
    (indep(s12), consistent(s12, manufacturer_ethos_slogan) ; \+indep(s12)),
    (indep(s13), consistent(s13, manufacturer_ethos_slogan) ; \+indep(s13)).

evidence(all_consistent(manufacturer_ethos_slogan)).
query(true_val(manufacturer_ethos_slogan, all_ways_down)).
query(true_val(manufacturer_ethos_slogan, unk_manufacturer_ethos_slogan)).

% @attr model_name_inspiration
% @type categorical
% @canonical false
% @original_name model name inspiration
% @values skateboard_trick=Named_after_skateboarding_boneless_trick unk_model_name_inspiration=Unknown
% @importance 0.85

0.85::acc(s14, model_name_inspiration).

0.77::true_val(model_name_inspiration, skateboard_trick); 0.23::true_val(model_name_inspiration, unk_model_name_inspiration).

measured(s14, model_name_inspiration, skateboard_trick).

all_consistent(model_name_inspiration) :-
    consistent(s14, model_name_inspiration).

evidence(all_consistent(model_name_inspiration)).
query(true_val(model_name_inspiration, skateboard_trick)).
query(true_val(model_name_inspiration, unk_model_name_inspiration)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2025_26=2025_26_season unk_model_first_available_year=Unknown
% @importance 0.85

0.95::acc(s1, model_first_available_year).
0.82::acc(s5, model_first_available_year).
0.85::acc(s14, model_first_available_year).

0.96::true_val(model_first_available_year, season_2025_26); 0.04::true_val(model_first_available_year, unk_model_first_available_year).

measured(s1, model_first_available_year, season_2025_26).
measured(s5, model_first_available_year, season_2025_26).
measured(s14, model_first_available_year, season_2025_26).

all_consistent(model_first_available_year) :-
    consistent(s1, model_first_available_year),
    consistent(s5, model_first_available_year),
    consistent(s14, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2025_26)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr estimated_availability_date
% @type categorical
% @canonical true
% @original_name estimated_availability_date
% @values may_2026=May_2026 unk_estimated_availability_date=Unknown
% @importance 0.95

0.75::acc(s3, estimated_availability_date).

0.71::true_val(estimated_availability_date, may_2026); 0.29::true_val(estimated_availability_date, unk_estimated_availability_date).

measured(s3, estimated_availability_date, may_2026).

all_consistent(estimated_availability_date) :-
    (indep(s3), consistent(s3, estimated_availability_date) ; \+indep(s3)).

evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, may_2026)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values preorder=Preorder unk_availability_status=Unknown
% @importance 0.95

0.75::acc(s3, availability_status).

0.71::true_val(availability_status, preorder); 0.29::true_val(availability_status, unk_availability_status).

measured(s3, availability_status, preorder).

all_consistent(availability_status) :-
    (indep(s3), consistent(s3, availability_status) ; \+indep(s3)).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, preorder)).
query(true_val(availability_status, unk_availability_status)).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v529_95=529.95 unk_price_usd_msrp=Unknown
% @importance 0.85

0.90::acc(s15, price_usd_msrp).
0.70::acc(s16, price_usd_msrp).
0.85::acc(s17, price_usd_msrp).

0.96::true_val(price_usd_msrp, v529_95); 0.04::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s15, price_usd_msrp, v529_95).
measured(s16, price_usd_msrp, v529_95).
measured(s17, price_usd_msrp, v529_95).

all_consistent(price_usd_msrp) :-
    consistent(s15, price_usd_msrp),
    consistent(s16, price_usd_msrp),
    consistent(s17, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v529_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_evo
% @values v370_96=370.96 unk_price_usd_evo=Unknown
% @importance 0.90

0.85::acc(s17, price_usd_evo).

0.77::true_val(price_usd_evo, v370_96); 0.23::true_val(price_usd_evo, unk_price_usd_evo).

measured(s17, price_usd_evo, v370_96).

all_consistent(price_usd_evo) :-
    consistent(s17, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v370_96)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_eastern_boarder
% @type numeric
% @unit USD
% @canonical false
% @original_name price USD (Eastern Boarder)
% @values v529_95=529.95 unk_price_usd_eastern_boarder=Unknown
% @importance 0.80

0.70::acc(s18, price_usd_eastern_boarder).

0.63::true_val(price_usd_eastern_boarder, v529_95); 0.37::true_val(price_usd_eastern_boarder, unk_price_usd_eastern_boarder).

measured(s18, price_usd_eastern_boarder, v529_95).

all_consistent(price_usd_eastern_boarder) :-
    consistent(s18, price_usd_eastern_boarder).

evidence(all_consistent(price_usd_eastern_boarder)).
query(true_val(price_usd_eastern_boarder, v529_95)).
query(true_val(price_usd_eastern_boarder, unk_price_usd_eastern_boarder)).

% @attr price_usd_skatepro
% @type numeric
% @unit USD
% @canonical false
% @original_name price USD (SkatePro)
% @values v479_95=479.95 unk_price_usd_skatepro=Unknown
% @importance 0.85

0.70::acc(s19, price_usd_skatepro).

0.63::true_val(price_usd_skatepro, v479_95); 0.37::true_val(price_usd_skatepro, unk_price_usd_skatepro).

measured(s19, price_usd_skatepro, v479_95).

all_consistent(price_usd_skatepro) :-
    consistent(s19, price_usd_skatepro).

evidence(all_consistent(price_usd_skatepro)).
query(true_val(price_usd_skatepro, v479_95)).
query(true_val(price_usd_skatepro, unk_price_usd_skatepro)).

% @attr price_usd_ski_pro_az
% @type numeric
% @unit USD
% @canonical false
% @original_name price USD (Ski Pro AZ, 2026 sale)
% @values v389_95=389.95 unk_price_usd_ski_pro_az=Unknown
% @importance 0.80

0.60::acc(s20, price_usd_ski_pro_az).

0.51::true_val(price_usd_ski_pro_az, v389_95); 0.49::true_val(price_usd_ski_pro_az, unk_price_usd_ski_pro_az).

measured(s20, price_usd_ski_pro_az, v389_95).

all_consistent(price_usd_ski_pro_az) :-
    consistent(s20, price_usd_ski_pro_az).

evidence(all_consistent(price_usd_ski_pro_az)).
query(true_val(price_usd_ski_pro_az, v389_95)).
query(true_val(price_usd_ski_pro_az, unk_price_usd_ski_pro_az)).

% @attr price_usd_rome_direct
% @type numeric
% @unit USD
% @canonical false
% @original_name price USD (Rome direct, 2026 sale)
% @values v423_95=423.95 unk_price_usd_rome_direct=Unknown
% @importance 1.00

0.95::acc(s1, price_usd_rome_direct).

0.92::true_val(price_usd_rome_direct, v423_95); 0.08::true_val(price_usd_rome_direct, unk_price_usd_rome_direct).

measured(s1, price_usd_rome_direct, v423_95).

all_consistent(price_usd_rome_direct) :-
    consistent(s1, price_usd_rome_direct).

evidence(all_consistent(price_usd_rome_direct)).
query(true_val(price_usd_rome_direct, v423_95)).
query(true_val(price_usd_rome_direct, unk_price_usd_rome_direct)).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v899_99=899.99 unk_price_aud_merchant=Unknown
% @importance 0.95

0.75::acc(s3, price_aud_merchant).

0.71::true_val(price_aud_merchant, v899_99); 0.29::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s3, price_aud_merchant, v899_99).

all_consistent(price_aud_merchant) :-
    consistent(s3, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v899_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_eur_blue_tomato
% @type numeric
% @unit EUR
% @canonical true
% @original_name price_eur_blue_tomato
% @values v499_95=499.95 unk_price_eur_blue_tomato=Unknown
% @importance 0.80

0.85::acc(s21, price_eur_blue_tomato).

0.78::true_val(price_eur_blue_tomato, v499_95); 0.22::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).

measured(s21, price_eur_blue_tomato, v499_95).

all_consistent(price_eur_blue_tomato) :-
    consistent(s21, price_eur_blue_tomato).

evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v499_95)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

% @attr retailer_rome
% @type categorical
% @canonical false
% @original_name retailer (Rome Snowboards)
% @values confirmed=Confirmed unk_retailer_rome=Unknown
% @importance 1.00

0.95::acc(s1, retailer_rome).

0.92::true_val(retailer_rome, confirmed); 0.08::true_val(retailer_rome, unk_retailer_rome).

measured(s1, retailer_rome, confirmed).

all_consistent(retailer_rome) :-
    consistent(s1, retailer_rome).

evidence(all_consistent(retailer_rome)).
query(true_val(retailer_rome, confirmed)).
query(true_val(retailer_rome, unk_retailer_rome)).

% @attr retailer_evo
% @type categorical
% @canonical false
% @original_name retailer (evo)
% @values confirmed=Confirmed unk_retailer_evo=Unknown
% @importance 0.80

0.85::acc(s15, retailer_evo).

0.72::true_val(retailer_evo, confirmed); 0.28::true_val(retailer_evo, unk_retailer_evo).

measured(s15, retailer_evo, confirmed).

all_consistent(retailer_evo) :-
    consistent(s15, retailer_evo).

evidence(all_consistent(retailer_evo)).
query(true_val(retailer_evo, confirmed)).
query(true_val(retailer_evo, unk_retailer_evo)).

% @attr retailer_eastern_boarder
% @type categorical
% @canonical false
% @original_name retailer (Eastern Boarder)
% @values confirmed=Confirmed unk_retailer_eastern_boarder=Unknown
% @importance 0.80

0.70::acc(s18, retailer_eastern_boarder).

0.63::true_val(retailer_eastern_boarder, confirmed); 0.37::true_val(retailer_eastern_boarder, unk_retailer_eastern_boarder).

measured(s18, retailer_eastern_boarder, confirmed).

all_consistent(retailer_eastern_boarder) :-
    consistent(s18, retailer_eastern_boarder).

evidence(all_consistent(retailer_eastern_boarder)).
query(true_val(retailer_eastern_boarder, confirmed)).
query(true_val(retailer_eastern_boarder, unk_retailer_eastern_boarder)).

% @attr retailer_skatepro
% @type categorical
% @canonical false
% @original_name retailer (SkatePro)
% @values confirmed=Confirmed unk_retailer_skatepro=Unknown
% @importance 0.85

0.70::acc(s19, retailer_skatepro).

0.63::true_val(retailer_skatepro, confirmed); 0.37::true_val(retailer_skatepro, unk_retailer_skatepro).

measured(s19, retailer_skatepro, confirmed).

all_consistent(retailer_skatepro) :-
    consistent(s19, retailer_skatepro).

evidence(all_consistent(retailer_skatepro)).
query(true_val(retailer_skatepro, confirmed)).
query(true_val(retailer_skatepro, unk_retailer_skatepro)).

% @attr retailer_blauer_board
% @type categorical
% @canonical false
% @original_name retailer (Blauer Board Shop)
% @values confirmed=Confirmed unk_retailer_blauer_board=Unknown
% @importance 0.70

0.75::acc(s22, retailer_blauer_board).

0.68::true_val(retailer_blauer_board, confirmed); 0.32::true_val(retailer_blauer_board, unk_retailer_blauer_board).

measured(s22, retailer_blauer_board, confirmed).

all_consistent(retailer_blauer_board) :-
    consistent(s22, retailer_blauer_board).

evidence(all_consistent(retailer_blauer_board)).
query(true_val(retailer_blauer_board, confirmed)).
query(true_val(retailer_blauer_board, unk_retailer_blauer_board)).

% @attr retailer_ballistyx
% @type categorical
% @canonical false
% @original_name retailer (Ballistyx)
% @values confirmed=Confirmed unk_retailer_ballistyx=Unknown
% @importance 0.95

0.75::acc(s3, retailer_ballistyx).

0.71::true_val(retailer_ballistyx, confirmed); 0.29::true_val(retailer_ballistyx, unk_retailer_ballistyx).

measured(s3, retailer_ballistyx, confirmed).

all_consistent(retailer_ballistyx) :-
    consistent(s3, retailer_ballistyx).

evidence(all_consistent(retailer_ballistyx)).
query(true_val(retailer_ballistyx, confirmed)).
query(true_val(retailer_ballistyx, unk_retailer_ballistyx)).

% @attr retailer_eriks
% @type categorical
% @canonical false
% @original_name retailer (ERIK'S Bike Shop)
% @values confirmed=Confirmed unk_retailer_eriks=Unknown
% @importance 0.60

0.65::acc(s23, retailer_eriks).

0.49::true_val(retailer_eriks, confirmed); 0.51::true_val(retailer_eriks, unk_retailer_eriks).

measured(s23, retailer_eriks, confirmed).

all_consistent(retailer_eriks) :-
    consistent(s23, retailer_eriks).

evidence(all_consistent(retailer_eriks)).
query(true_val(retailer_eriks, confirmed)).
query(true_val(retailer_eriks, unk_retailer_eriks)).

% @attr retailer_boarderline
% @type categorical
% @canonical false
% @original_name retailer (Boarderline Insanity/VT Snowboarder)
% @values confirmed=Confirmed unk_retailer_boarderline=Unknown
% @importance 0.50

0.55::acc(s24, retailer_boarderline).

0.44::true_val(retailer_boarderline, confirmed); 0.56::true_val(retailer_boarderline, unk_retailer_boarderline).

measured(s24, retailer_boarderline, confirmed).

all_consistent(retailer_boarderline) :-
    consistent(s24, retailer_boarderline).

evidence(all_consistent(retailer_boarderline)).
query(true_val(retailer_boarderline, confirmed)).
query(true_val(retailer_boarderline, unk_retailer_boarderline)).

% @attr retailer_ebay
% @type categorical
% @canonical false
% @original_name retailer (eBay)
% @values confirmed=Confirmed unk_retailer_ebay=Unknown
% @importance 0.50

0.55::acc(s24, retailer_ebay).

0.44::true_val(retailer_ebay, confirmed); 0.56::true_val(retailer_ebay, unk_retailer_ebay).

measured(s24, retailer_ebay, confirmed).

all_consistent(retailer_ebay) :-
    consistent(s24, retailer_ebay).

evidence(all_consistent(retailer_ebay)).
query(true_val(retailer_ebay, confirmed)).
query(true_val(retailer_ebay, unk_retailer_ebay)).

% @attr retailer_ski_pro_az
% @type categorical
% @canonical false
% @original_name retailer (Ski Pro AZ)
% @values confirmed=Confirmed unk_retailer_ski_pro_az=Unknown
% @importance 0.80

0.60::acc(s20, retailer_ski_pro_az).

0.51::true_val(retailer_ski_pro_az, confirmed); 0.49::true_val(retailer_ski_pro_az, unk_retailer_ski_pro_az).

measured(s20, retailer_ski_pro_az, confirmed).

all_consistent(retailer_ski_pro_az) :-
    consistent(s20, retailer_ski_pro_az).

evidence(all_consistent(retailer_ski_pro_az)).
query(true_val(retailer_ski_pro_az, confirmed)).
query(true_val(retailer_ski_pro_az, unk_retailer_ski_pro_az)).

% @attr retailer_snow_central
% @type categorical
% @canonical false
% @original_name retailer (Snow Central)
% @values confirmed=Confirmed unk_retailer_snow_central=Unknown
% @importance 0.50

0.60::acc(s25, retailer_snow_central).

0.42::true_val(retailer_snow_central, confirmed); 0.58::true_val(retailer_snow_central, unk_retailer_snow_central).

measured(s25, retailer_snow_central, confirmed).

all_consistent(retailer_snow_central) :-
    consistent(s25, retailer_snow_central).

evidence(all_consistent(retailer_snow_central)).
query(true_val(retailer_snow_central, confirmed)).
query(true_val(retailer_snow_central, unk_retailer_snow_central)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values true_twin=True_Twin unk_shape=Unknown
% @importance 0.90

0.95::acc(s1, shape).
0.85::acc(s4, shape).
0.82::acc(s5, shape).

0.96::true_val(shape, true_twin); 0.04::true_val(shape, unk_shape).

measured(s1, shape, true_twin).
measured(s4, shape, true_twin).
measured(s5, shape, true_twin).

all_consistent(shape) :-
    consistent(s1, shape),
    (indep(s4), consistent(s4, shape) ; \+indep(s4)),
    consistent(s5, shape).

evidence(all_consistent(shape)).
query(true_val(shape, true_twin)).
query(true_val(shape, unk_shape)).

% @attr shape_description
% @type categorical
% @canonical false
% @original_name shape description
% @values sym_nose_tail_centered=Fully_symmetrical_nose_tail_centered_stance unk_shape_description=Unknown
% @importance 0.80

0.85::acc(s4, shape_description).
0.75::acc(s22, shape_description).

0.95::true_val(shape_description, sym_nose_tail_centered); 0.05::true_val(shape_description, unk_shape_description).

measured(s4, shape_description, sym_nose_tail_centered).
measured(s22, shape_description, sym_nose_tail_centered).

all_consistent(shape_description) :-
    (indep(s4), consistent(s4, shape_description) ; \+indep(s4)),
    (indep(s22), consistent(s22, shape_description) ; \+indep(s22)).

evidence(all_consistent(shape_description)).
query(true_val(shape_description, sym_nose_tail_centered)).
query(true_val(shape_description, unk_shape_description)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values fusion_camber=Fusion_Camber unk_camber_type=Unknown
% @importance 0.90

0.95::acc(s1, camber_type).
0.85::acc(s4, camber_type).
0.82::acc(s5, camber_type).

0.96::true_val(camber_type, fusion_camber); 0.04::true_val(camber_type, unk_camber_type).

measured(s1, camber_type, fusion_camber).
measured(s4, camber_type, fusion_camber).
measured(s5, camber_type, fusion_camber).

all_consistent(camber_type) :-
    consistent(s1, camber_type),
    (indep(s4), consistent(s4, camber_type) ; \+indep(s4)),
    consistent(s5, camber_type).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, fusion_camber)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values pos_camber_rocker_tips=Positive_camber_between_bindings_rocker_nose_tail unk_camber_description=Unknown
% @importance 0.92

0.95::acc(s1, camber_description).
0.85::acc(s4, camber_description).
0.85::acc(s14, camber_description).

0.96::true_val(camber_description, pos_camber_rocker_tips); 0.04::true_val(camber_description, unk_camber_description).

measured(s1, camber_description, pos_camber_rocker_tips).
measured(s4, camber_description, pos_camber_rocker_tips).
measured(s14, camber_description, pos_camber_rocker_tips).

all_consistent(camber_description) :-
    consistent(s1, camber_description),
    (indep(s4), consistent(s4, camber_description) ; \+indep(s4)),
    consistent(s14, camber_description).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, pos_camber_rocker_tips)).
query(true_val(camber_description, unk_camber_description)).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values tri_radial=Tri_Radial_Sidecut unk_sidecut_type=Unknown
% @importance 0.95

0.95::acc(s1, sidecut_type).
0.85::acc(s4, sidecut_type).

0.96::true_val(sidecut_type, tri_radial); 0.04::true_val(sidecut_type, unk_sidecut_type).

measured(s1, sidecut_type, tri_radial).
measured(s4, sidecut_type, tri_radial).

all_consistent(sidecut_type) :-
    consistent(s1, sidecut_type),
    (indep(s4), consistent(s4, sidecut_type) ; \+indep(s4)).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, tri_radial)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr sidecut_description
% @type categorical
% @canonical false
% @original_name sidecut description
% @values three_radii_natural_turn=Three_radii_wider_tip_tail_tighter_mid unk_sidecut_description=Unknown
% @importance 0.88

0.85::acc(s4, sidecut_description).
0.85::acc(s14, sidecut_description).

0.95::true_val(sidecut_description, three_radii_natural_turn); 0.05::true_val(sidecut_description, unk_sidecut_description).

measured(s4, sidecut_description, three_radii_natural_turn).
measured(s14, sidecut_description, three_radii_natural_turn).

all_consistent(sidecut_description) :-
    (indep(s4), consistent(s4, sidecut_description) ; \+indep(s4)),
    consistent(s14, sidecut_description).

evidence(all_consistent(sidecut_description)).
query(true_val(sidecut_description, three_radii_natural_turn)).
query(true_val(sidecut_description, unk_sidecut_description)).

% @attr three_d_shaping
% @type categorical
% @canonical false
% @original_name 3D shaping
% @values twin_diamond_3d=Twin_Diamond_3D unk_three_d_shaping=Unknown
% @importance 0.90

0.95::acc(s1, three_d_shaping).
0.85::acc(s4, three_d_shaping).
0.82::acc(s5, three_d_shaping).

0.96::true_val(three_d_shaping, twin_diamond_3d); 0.04::true_val(three_d_shaping, unk_three_d_shaping).

measured(s1, three_d_shaping, twin_diamond_3d).
measured(s4, three_d_shaping, twin_diamond_3d).
measured(s5, three_d_shaping, twin_diamond_3d).

all_consistent(three_d_shaping) :-
    consistent(s1, three_d_shaping),
    (indep(s4), consistent(s4, three_d_shaping) ; \+indep(s4)),
    consistent(s5, three_d_shaping).

evidence(all_consistent(three_d_shaping)).
query(true_val(three_d_shaping, twin_diamond_3d)).
query(true_val(three_d_shaping, unk_three_d_shaping)).

% @attr three_d_shaping_description
% @type categorical
% @canonical false
% @original_name 3D shaping description
% @values wide_flat_mid_3d_rise=Wide_flat_middle_3D_rise_past_contact_points unk_three_d_shaping_description=Unknown
% @importance 0.95

0.95::acc(s1, three_d_shaping_description).
0.85::acc(s4, three_d_shaping_description).

0.96::true_val(three_d_shaping_description, wide_flat_mid_3d_rise); 0.04::true_val(three_d_shaping_description, unk_three_d_shaping_description).

measured(s1, three_d_shaping_description, wide_flat_mid_3d_rise).
measured(s4, three_d_shaping_description, wide_flat_mid_3d_rise).

all_consistent(three_d_shaping_description) :-
    consistent(s1, three_d_shaping_description),
    (indep(s4), consistent(s4, three_d_shaping_description) ; \+indep(s4)).

evidence(all_consistent(three_d_shaping_description)).
query(true_val(three_d_shaping_description, wide_flat_mid_3d_rise)).
query(true_val(three_d_shaping_description, unk_three_d_shaping_description)).

% @attr taper
% @type numeric
% @unit mm
% @canonical false
% @original_name taper
% @values v0=0.0 unk_taper=Unknown
% @importance 0.975

0.95::acc(s1, taper).
0.75::acc(s3, taper).

0.96::true_val(taper, v0); 0.04::true_val(taper, unk_taper).

measured(s1, taper, v0).
measured(s3, taper, v0).

all_consistent(taper) :-
    consistent(s1, taper),
    (indep(s3), consistent(s3, taper) ; \+indep(s3)).

evidence(all_consistent(taper)).
query(true_val(taper, v0)).
query(true_val(taper, unk_taper)).

% @attr setback
% @type numeric
% @unit mm
% @canonical true
% @original_name setback
% @values v0=0.0 unk_setback=Unknown
% @importance 0.975

0.95::acc(s1, setback).
0.75::acc(s3, setback).

0.96::true_val(setback, v0); 0.04::true_val(setback, unk_setback).

measured(s1, setback, v0).
measured(s3, setback, v0).

all_consistent(setback) :-
    consistent(s1, setback),
    (indep(s3), consistent(s3, setback) ; \+indep(s3)).

evidence(all_consistent(setback)).
query(true_val(setback, v0)).
query(true_val(setback, unk_setback)).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values twin_flex=Twin_symmetrical unk_flex_direction=Unknown
% @importance 1.00

0.95::acc(s1, flex_direction).

0.92::true_val(flex_direction, twin_flex); 0.08::true_val(flex_direction, unk_flex_direction).

measured(s1, flex_direction, twin_flex).

all_consistent(flex_direction) :-
    consistent(s1, flex_direction).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, twin_flex)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v5=5.0 v6=6.0
% @importance 0.90

0.93::acc(s1, flex_rating_10).
0.70::acc(s16, flex_rating_10).
0.75::acc(s3, flex_rating_10).
0.80::acc(s15, flex_rating_10).

0.65::true_val(flex_rating_10, v5); 0.35::true_val(flex_rating_10, v6).

measured(s1, flex_rating_10, v5).
measured(s16, flex_rating_10, v5).
measured(s3, flex_rating_10, v6).
measured(s15, flex_rating_10, v5).

all_consistent(flex_rating_10) :-
    consistent(s1, flex_rating_10),
    (indep(s16), consistent(s16, flex_rating_10) ; \+indep(s16)),
    (indep(s3), consistent(s3, flex_rating_10) ; \+indep(s3)),
    (indep(s15), consistent(s15, flex_rating_10) ; \+indep(s15)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v5)).
query(true_val(flex_rating_10, v6)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values mid_flex=Mid_flex_balanced mid_soft=Mid_Soft_4_10
% @importance 0.91

0.88::acc(s1, flex_feel).
0.90::acc(s26, flex_feel).
0.85::acc(s14, flex_feel).
0.72::acc(s3, flex_feel).

0.50::true_val(flex_feel, mid_flex); 0.50::true_val(flex_feel, mid_soft).

measured(s1, flex_feel, mid_flex).
measured(s26, flex_feel, mid_soft).
measured(s14, flex_feel, mid_soft).
measured(s3, flex_feel, mid_flex).

all_consistent(flex_feel) :-
    consistent(s1, flex_feel),
    consistent(s26, flex_feel),
    consistent(s14, flex_feel),
    (indep(s3), consistent(s3, flex_feel) ; \+indep(s3)).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, mid_flex)).
query(true_val(flex_feel, mid_soft)).

% @attr flex_rating_10_evo
% @type categorical
% @canonical false
% @original_name flex_rating_10_evo
% @values medium_3_5=Medium_3_to_5 unk_flex_rating_10_evo=Unknown
% @importance 0.80

0.80::acc(s15, flex_rating_10_evo).

0.72::true_val(flex_rating_10_evo, medium_3_5); 0.28::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).

measured(s15, flex_rating_10_evo, medium_3_5).

all_consistent(flex_rating_10_evo) :-
    (indep(s15), consistent(s15, flex_rating_10_evo) ; \+indep(s15)).

evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, medium_3_5)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values pop_core_poplar_paulownia=Pop_Core_poplar_paulownia unk_core_material=Unknown
% @importance 0.825

0.75::acc(s3, core_material).

0.71::true_val(core_material, pop_core_poplar_paulownia); 0.29::true_val(core_material, unk_core_material).

measured(s3, core_material, pop_core_poplar_paulownia).

all_consistent(core_material) :-
    (indep(s3), consistent(s3, core_material) ; \+indep(s3)).

evidence(all_consistent(core_material)).
query(true_val(core_material, pop_core_poplar_paulownia)).
query(true_val(core_material, unk_core_material)).

% @attr core_construction
% @type categorical
% @canonical false
% @original_name core construction
% @values lightweight_strong_return=Lightweight_strong_energy_return unk_core_construction=Unknown
% @importance 0.825

0.75::acc(s3, core_construction).

0.71::true_val(core_construction, lightweight_strong_return); 0.29::true_val(core_construction, unk_core_construction).

measured(s3, core_construction, lightweight_strong_return).

all_consistent(core_construction) :-
    (indep(s3), consistent(s3, core_construction) ; \+indep(s3)).

evidence(all_consistent(core_construction)).
query(true_val(core_construction, lightweight_strong_return)).
query(true_val(core_construction, unk_core_construction)).

% @attr laminate
% @type categorical
% @canonical false
% @original_name laminate
% @values biax_fiberglass=Biaxial_fiberglass unk_laminate=Unknown
% @importance 0.975

0.95::acc(s1, laminate).
0.75::acc(s3, laminate).

0.96::true_val(laminate, biax_fiberglass); 0.04::true_val(laminate, unk_laminate).

measured(s1, laminate, biax_fiberglass).
measured(s3, laminate, biax_fiberglass).

all_consistent(laminate) :-
    consistent(s1, laminate),
    (indep(s3), consistent(s3, laminate) ; \+indep(s3)).

evidence(all_consistent(laminate)).
query(true_val(laminate, biax_fiberglass)).
query(true_val(laminate, unk_laminate)).

% @attr fiberglass_description
% @type categorical
% @canonical false
% @original_name fiberglass description
% @values smooth_predictable_flex=Smooth_predictable_flex_for_freestyle unk_fiberglass_description=Unknown
% @importance 0.95

0.75::acc(s3, fiberglass_description).

0.71::true_val(fiberglass_description, smooth_predictable_flex); 0.29::true_val(fiberglass_description, unk_fiberglass_description).

measured(s3, fiberglass_description, smooth_predictable_flex).

all_consistent(fiberglass_description) :-
    (indep(s3), consistent(s3, fiberglass_description) ; \+indep(s3)).

evidence(all_consistent(fiberglass_description)).
query(true_val(fiberglass_description, smooth_predictable_flex)).
query(true_val(fiberglass_description, unk_fiberglass_description)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values bamboo_omega_hotrods=Twin_Single_Bamboo_Omega_HotRods unk_construction_material_innovation=Unknown
% @importance 0.88

0.95::acc(s1, construction_material_innovation).
0.75::acc(s3, construction_material_innovation).
0.75::acc(s22, construction_material_innovation).

0.96::true_val(construction_material_innovation, bamboo_omega_hotrods); 0.04::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s1, construction_material_innovation, bamboo_omega_hotrods).
measured(s3, construction_material_innovation, bamboo_omega_hotrods).
measured(s22, construction_material_innovation, bamboo_omega_hotrods).

all_consistent(construction_material_innovation) :-
    consistent(s1, construction_material_innovation),
    (indep(s3), consistent(s3, construction_material_innovation) ; \+indep(s3)),
    (indep(s22), consistent(s22, construction_material_innovation) ; \+indep(s22)).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, bamboo_omega_hotrods)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr construction_material_innovation_detail
% @type categorical
% @canonical false
% @original_name construction_material_innovation (HotRod detail)
% @values bamboo_carbon_sleeve_pop=Bamboo_HotRod_nose_tail_carbon_sleeve unk_construction_material_innovation_detail=Unknown
% @importance 0.85

0.95::acc(s1, construction_material_innovation_detail).
0.75::acc(s22, construction_material_innovation_detail).

0.95::true_val(construction_material_innovation_detail, bamboo_carbon_sleeve_pop); 0.05::true_val(construction_material_innovation_detail, unk_construction_material_innovation_detail).

measured(s1, construction_material_innovation_detail, bamboo_carbon_sleeve_pop).
measured(s22, construction_material_innovation_detail, bamboo_carbon_sleeve_pop).

all_consistent(construction_material_innovation_detail) :-
    consistent(s1, construction_material_innovation_detail),
    (indep(s22), consistent(s22, construction_material_innovation_detail) ; \+indep(s22)).

evidence(all_consistent(construction_material_innovation_detail)).
query(true_val(construction_material_innovation_detail, bamboo_carbon_sleeve_pop)).
query(true_val(construction_material_innovation_detail, unk_construction_material_innovation_detail)).

% @attr construction_material_innovation_flax
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Flax Impact Plates)
% @values flax_impact_plates=Flax_Impact_Plates_around_inserts unk_construction_material_innovation_flax=Unknown
% @importance 0.87

0.95::acc(s1, construction_material_innovation_flax).
0.85::acc(s4, construction_material_innovation_flax).
0.75::acc(s22, construction_material_innovation_flax).

0.96::true_val(construction_material_innovation_flax, flax_impact_plates); 0.04::true_val(construction_material_innovation_flax, unk_construction_material_innovation_flax).

measured(s1, construction_material_innovation_flax, flax_impact_plates).
measured(s4, construction_material_innovation_flax, flax_impact_plates).
measured(s22, construction_material_innovation_flax, flax_impact_plates).

all_consistent(construction_material_innovation_flax) :-
    consistent(s1, construction_material_innovation_flax),
    (indep(s4), consistent(s4, construction_material_innovation_flax) ; \+indep(s4)),
    (indep(s22), consistent(s22, construction_material_innovation_flax) ; \+indep(s22)).

evidence(all_consistent(construction_material_innovation_flax)).
query(true_val(construction_material_innovation_flax, flax_impact_plates)).
query(true_val(construction_material_innovation_flax, unk_construction_material_innovation_flax)).

% @attr construction_material_innovation_flax_detail
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Flax detail)
% @values vibration_absorb_durability=Absorb_vibration_strengthen_impact_zones unk_construction_material_innovation_flax_detail=Unknown
% @importance 0.90

0.95::acc(s1, construction_material_innovation_flax_detail).
0.75::acc(s3, construction_material_innovation_flax_detail).
0.85::acc(s4, construction_material_innovation_flax_detail).

0.96::true_val(construction_material_innovation_flax_detail, vibration_absorb_durability); 0.04::true_val(construction_material_innovation_flax_detail, unk_construction_material_innovation_flax_detail).

measured(s1, construction_material_innovation_flax_detail, vibration_absorb_durability).
measured(s3, construction_material_innovation_flax_detail, vibration_absorb_durability).
measured(s4, construction_material_innovation_flax_detail, vibration_absorb_durability).

all_consistent(construction_material_innovation_flax_detail) :-
    consistent(s1, construction_material_innovation_flax_detail),
    (indep(s3), consistent(s3, construction_material_innovation_flax_detail) ; \+indep(s3)),
    (indep(s4), consistent(s4, construction_material_innovation_flax_detail) ; \+indep(s4)).

evidence(all_consistent(construction_material_innovation_flax_detail)).
query(true_val(construction_material_innovation_flax_detail, vibration_absorb_durability)).
query(true_val(construction_material_innovation_flax_detail, unk_construction_material_innovation_flax_detail)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sinterstrong=SinterStrong_sintered unk_base_material=Unknown
% @importance 0.95

0.95::acc(s1, base_material).
0.85::acc(s4, base_material).

0.96::true_val(base_material, sinterstrong); 0.04::true_val(base_material, unk_base_material).

measured(s1, base_material, sinterstrong).
measured(s4, base_material, sinterstrong).

all_consistent(base_material) :-
    consistent(s1, base_material),
    (indep(s4), consistent(s4, base_material) ; \+indep(s4)).

evidence(all_consistent(base_material)).
query(true_val(base_material, sinterstrong)).
query(true_val(base_material, unk_base_material)).

% @attr base_type
% @type categorical
% @canonical false
% @original_name base_type
% @values low_maint_sintered=Low_maintenance_sintered unk_base_type=Unknown
% @importance 0.95

0.95::acc(s1, base_type).
0.85::acc(s4, base_type).

0.96::true_val(base_type, low_maint_sintered); 0.04::true_val(base_type, unk_base_type).

measured(s1, base_type, low_maint_sintered).
measured(s4, base_type, low_maint_sintered).

all_consistent(base_type) :-
    consistent(s1, base_type),
    (indep(s4), consistent(s4, base_type) ; \+indep(s4)).

evidence(all_consistent(base_type)).
query(true_val(base_type, low_maint_sintered)).
query(true_val(base_type, unk_base_type)).

% @attr base_description
% @type categorical
% @canonical false
% @original_name base description
% @values durable_wax_glide=Durable_sintered_good_wax_retention_glide unk_base_description=Unknown
% @importance 0.925

0.75::acc(s3, base_description).
0.85::acc(s4, base_description).

0.95::true_val(base_description, durable_wax_glide); 0.05::true_val(base_description, unk_base_description).

measured(s3, base_description, durable_wax_glide).
measured(s4, base_description, durable_wax_glide).

all_consistent(base_description) :-
    (indep(s3), consistent(s3, base_description) ; \+indep(s3)),
    (indep(s4), consistent(s4, base_description) ; \+indep(s4)).

evidence(all_consistent(base_description)).
query(true_val(base_description, durable_wax_glide)).
query(true_val(base_description, unk_base_description)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 0.975

0.95::acc(s1, mounting_pattern).
0.75::acc(s3, mounting_pattern).

0.96::true_val(mounting_pattern, inserts_2x4); 0.04::true_val(mounting_pattern, unk_mounting_pattern).

measured(s1, mounting_pattern, inserts_2x4).
measured(s3, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :-
    consistent(s1, mounting_pattern),
    (indep(s3), consistent(s3, mounting_pattern) ; \+indep(s3)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr inserts_per_board
% @type numeric
% @unit count
% @canonical false
% @original_name inserts per board
% @values v24=24 unk_inserts_per_board=Unknown
% @importance 1.00

0.95::acc(s1, inserts_per_board).

0.92::true_val(inserts_per_board, v24); 0.08::true_val(inserts_per_board, unk_inserts_per_board).

measured(s1, inserts_per_board, v24).

all_consistent(inserts_per_board) :-
    consistent(s1, inserts_per_board).

evidence(all_consistent(inserts_per_board)).
query(true_val(inserts_per_board, v24)).
query(true_val(inserts_per_board, unk_inserts_per_board)).

% @attr construction_layup
% @type categorical
% @canonical false
% @original_name construction layup (bottom to top)
% @values sinterstrong_biax_hotrod_popcore_biax_top=SinterStrong_Biax_HotRod_PopCore_Biax_Topsheet unk_construction_layup=Unknown
% @importance 1.00

0.95::acc(s1, construction_layup).

0.92::true_val(construction_layup, sinterstrong_biax_hotrod_popcore_biax_top); 0.08::true_val(construction_layup, unk_construction_layup).

measured(s1, construction_layup, sinterstrong_biax_hotrod_popcore_biax_top).

all_consistent(construction_layup) :-
    consistent(s1, construction_layup).

evidence(all_consistent(construction_layup)).
query(true_val(construction_layup, sinterstrong_biax_hotrod_popcore_biax_top)).
query(true_val(construction_layup, unk_construction_layup)).

% @attr nose_tail_feature_2027
% @type categorical
% @canonical false
% @original_name nose/tail feature (2027 model)
% @values twin_double_kick=Twin_Double_Kick_pronounced_rise unk_nose_tail_feature_2027=Unknown
% @importance 0.95

0.75::acc(s3, nose_tail_feature_2027).

0.71::true_val(nose_tail_feature_2027, twin_double_kick); 0.29::true_val(nose_tail_feature_2027, unk_nose_tail_feature_2027).

measured(s3, nose_tail_feature_2027, twin_double_kick).

all_consistent(nose_tail_feature_2027) :-
    (indep(s3), consistent(s3, nose_tail_feature_2027) ; \+indep(s3)).

evidence(all_consistent(nose_tail_feature_2027)).
query(true_val(nose_tail_feature_2027, twin_double_kick)).
query(true_val(nose_tail_feature_2027, unk_nose_tail_feature_2027)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values full_range_11=138N_141N_144N_147N_150_153_156_157W_159_160W_163W unk_available_sizes=Unknown
% @importance 0.90

0.95::acc(s1, available_sizes).
0.85::acc(s21, available_sizes).

0.96::true_val(available_sizes, full_range_11); 0.04::true_val(available_sizes, unk_available_sizes).

measured(s1, available_sizes, full_range_11).
measured(s21, available_sizes, full_range_11).

all_consistent(available_sizes) :-
    consistent(s1, available_sizes),
    consistent(s21, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, full_range_11)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr available_sizes_preorder
% @type categorical
% @canonical false
% @original_name available_sizes (preorder allocation)
% @values limited_6=141N_144N_147N_153_156_159 unk_available_sizes_preorder=Unknown
% @importance 0.95

0.75::acc(s3, available_sizes_preorder).

0.71::true_val(available_sizes_preorder, limited_6); 0.29::true_val(available_sizes_preorder, unk_available_sizes_preorder).

measured(s3, available_sizes_preorder, limited_6).

all_consistent(available_sizes_preorder) :-
    (indep(s3), consistent(s3, available_sizes_preorder) ; \+indep(s3)).

evidence(all_consistent(available_sizes_preorder)).
query(true_val(available_sizes_preorder, limited_6)).
query(true_val(available_sizes_preorder, unk_available_sizes_preorder)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_narrow_wide=Standard_Narrow_N_Wide_W unk_width_options=Unknown
% @importance 0.75

0.95::acc(s1, width_options).
0.55::acc(s24, width_options).

0.95::true_val(width_options, standard_narrow_wide); 0.05::true_val(width_options, unk_width_options).

measured(s1, width_options, standard_narrow_wide).
measured(s24, width_options, standard_narrow_wide).

all_consistent(width_options) :-
    consistent(s1, width_options),
    consistent(s24, width_options).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_narrow_wide)).
query(true_val(width_options, unk_width_options)).

% @attr effective_edge_138n
% @type numeric
% @unit cm
% @canonical false
% @original_name effective edge 138N
% @values v105_8=105.8 unk_effective_edge_138n=Unknown
% @importance 1.00

0.93::acc(s1, effective_edge_138n).

0.92::true_val(effective_edge_138n, v105_8); 0.08::true_val(effective_edge_138n, unk_effective_edge_138n).

measured(s1, effective_edge_138n, v105_8).

all_consistent(effective_edge_138n) :-
    consistent(s1, effective_edge_138n).

evidence(all_consistent(effective_edge_138n)).
query(true_val(effective_edge_138n, v105_8)).
query(true_val(effective_edge_138n, unk_effective_edge_138n)).

% @attr waist_width_138n
% @type numeric
% @unit cm
% @canonical false
% @original_name waist width 138N
% @values v23_2=23.2 unk_waist_width_138n=Unknown
% @importance 1.00

0.93::acc(s1, waist_width_138n).

0.92::true_val(waist_width_138n, v23_2); 0.08::true_val(waist_width_138n, unk_waist_width_138n).

measured(s1, waist_width_138n, v23_2).

all_consistent(waist_width_138n) :-
    consistent(s1, waist_width_138n).

evidence(all_consistent(waist_width_138n)).
query(true_val(waist_width_138n, v23_2)).
query(true_val(waist_width_138n, unk_waist_width_138n)).

% @attr sidecut_radius_size_138n
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size 138N
% @values r7_5_6_0_7_5=7.5_6.0_7.5m unk_sidecut_radius_size_138n=Unknown
% @importance 1.00

0.93::acc(s1, sidecut_radius_size_138n).

0.92::true_val(sidecut_radius_size_138n, r7_5_6_0_7_5); 0.08::true_val(sidecut_radius_size_138n, unk_sidecut_radius_size_138n).

measured(s1, sidecut_radius_size_138n, r7_5_6_0_7_5).

all_consistent(sidecut_radius_size_138n) :-
    consistent(s1, sidecut_radius_size_138n).

evidence(all_consistent(sidecut_radius_size_138n)).
query(true_val(sidecut_radius_size_138n, r7_5_6_0_7_5)).
query(true_val(sidecut_radius_size_138n, unk_sidecut_radius_size_138n)).

% @attr stance_width_range_size_138n
% @type categorical
% @unit cm
% @canonical false
% @original_name stance_width_range_size 138N
% @values r41_7_53_7=41.7_to_53.7cm unk_stance_width_range_size_138n=Unknown
% @importance 1.00

0.93::acc(s1, stance_width_range_size_138n).

0.92::true_val(stance_width_range_size_138n, r41_7_53_7); 0.08::true_val(stance_width_range_size_138n, unk_stance_width_range_size_138n).

measured(s1, stance_width_range_size_138n, r41_7_53_7).

all_consistent(stance_width_range_size_138n) :-
    consistent(s1, stance_width_range_size_138n).

evidence(all_consistent(stance_width_range_size_138n)).
query(true_val(stance_width_range_size_138n, r41_7_53_7)).
query(true_val(stance_width_range_size_138n, unk_stance_width_range_size_138n)).

% @attr recommended_weight_range_size_138n
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size 138N
% @values r31_5_49_5=31.5_to_49.5kg unk_recommended_weight_range_size_138n=Unknown
% @importance 1.00

0.93::acc(s1, recommended_weight_range_size_138n).

0.92::true_val(recommended_weight_range_size_138n, r31_5_49_5); 0.08::true_val(recommended_weight_range_size_138n, unk_recommended_weight_range_size_138n).

measured(s1, recommended_weight_range_size_138n, r31_5_49_5).

all_consistent(recommended_weight_range_size_138n) :-
    consistent(s1, recommended_weight_range_size_138n).

evidence(all_consistent(recommended_weight_range_size_138n)).
query(true_val(recommended_weight_range_size_138n, r31_5_49_5)).
query(true_val(recommended_weight_range_size_138n, unk_recommended_weight_range_size_138n)).

% @attr boot_size_range_138n
% @type categorical
% @canonical false
% @original_name boot size range 138N
% @values us3_7=US_3_7_EU_35_39 unk_boot_size_range_138n=Unknown
% @importance 1.00

0.93::acc(s1, boot_size_range_138n).

0.92::true_val(boot_size_range_138n, us3_7); 0.08::true_val(boot_size_range_138n, unk_boot_size_range_138n).

measured(s1, boot_size_range_138n, us3_7).

all_consistent(boot_size_range_138n) :-
    consistent(s1, boot_size_range_138n).

evidence(all_consistent(boot_size_range_138n)).
query(true_val(boot_size_range_138n, us3_7)).
query(true_val(boot_size_range_138n, unk_boot_size_range_138n)).

% @attr effective_edge_153
% @type numeric
% @unit cm
% @canonical false
% @original_name effective edge 153
% @values v116_4=116.4 v116_9=116.9
% @importance 0.975

0.93::acc(s1, effective_edge_153).
0.75::acc(s3, effective_edge_153).

0.60::true_val(effective_edge_153, v116_4); 0.40::true_val(effective_edge_153, v116_9).

measured(s1, effective_edge_153, v116_4).
measured(s3, effective_edge_153, v116_9).

all_consistent(effective_edge_153) :-
    consistent(s1, effective_edge_153),
    (indep(s3), consistent(s3, effective_edge_153) ; \+indep(s3)).

evidence(all_consistent(effective_edge_153)).
query(true_val(effective_edge_153, v116_4)).
query(true_val(effective_edge_153, v116_9)).

% @attr waist_width_153
% @type numeric
% @unit cm
% @canonical false
% @original_name waist width 153
% @values v25_1=25.1 v25_2=25.2
% @importance 0.975

0.93::acc(s1, waist_width_153).
0.75::acc(s3, waist_width_153).

0.60::true_val(waist_width_153, v25_1); 0.40::true_val(waist_width_153, v25_2).

measured(s1, waist_width_153, v25_1).
measured(s3, waist_width_153, v25_2).

all_consistent(waist_width_153) :-
    consistent(s1, waist_width_153),
    (indep(s3), consistent(s3, waist_width_153) ; \+indep(s3)).

evidence(all_consistent(waist_width_153)).
query(true_val(waist_width_153, v25_1)).
query(true_val(waist_width_153, v25_2)).

% @attr sidecut_radius_size
% @type categorical
% @unit m
% @canonical true
% @original_name sidecut_radius_size
% @values r8_3_6_8_8_3=8.3_6.8_8.3m unk_sidecut_radius_size=Unknown
% @importance 1.00

0.93::acc(s1, sidecut_radius_size).

0.92::true_val(sidecut_radius_size, r8_3_6_8_8_3); 0.08::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s1, sidecut_radius_size, r8_3_6_8_8_3).

all_consistent(sidecut_radius_size) :-
    consistent(s1, sidecut_radius_size).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, r8_3_6_8_8_3)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr contact_length_size
% @type numeric
% @unit cm
% @canonical true
% @original_name contact_length_size
% @values v108_4=108.4 unk_contact_length_size=Unknown
% @importance 1.00

0.93::acc(s1, contact_length_size).

0.92::true_val(contact_length_size, v108_4); 0.08::true_val(contact_length_size, unk_contact_length_size).

measured(s1, contact_length_size, v108_4).

all_consistent(contact_length_size) :-
    consistent(s1, contact_length_size).

evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v108_4)).
query(true_val(contact_length_size, unk_contact_length_size)).

% @attr stance_width_range_size
% @type categorical
% @unit cm
% @canonical true
% @original_name stance_width_range_size
% @values r49_3_61_3=49.3_to_61.3cm v53_3=53.3cm
% @importance 0.975

0.93::acc(s1, stance_width_range_size).
0.72::acc(s3, stance_width_range_size).

0.60::true_val(stance_width_range_size, r49_3_61_3); 0.40::true_val(stance_width_range_size, v53_3).

measured(s1, stance_width_range_size, r49_3_61_3).
measured(s3, stance_width_range_size, v53_3).

all_consistent(stance_width_range_size) :-
    consistent(s1, stance_width_range_size),
    (indep(s3), consistent(s3, stance_width_range_size) ; \+indep(s3)).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, r49_3_61_3)).
query(true_val(stance_width_range_size, v53_3)).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size
% @values r53_5_72=53.5_to_72kg r54_77=54_to_77kg
% @importance 0.975

0.93::acc(s1, recommended_weight_range_size).
0.72::acc(s3, recommended_weight_range_size).

0.58::true_val(recommended_weight_range_size, r53_5_72); 0.42::true_val(recommended_weight_range_size, r54_77).

measured(s1, recommended_weight_range_size, r53_5_72).
measured(s3, recommended_weight_range_size, r54_77).

all_consistent(recommended_weight_range_size) :-
    consistent(s1, recommended_weight_range_size),
    (indep(s3), consistent(s3, recommended_weight_range_size) ; \+indep(s3)).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, r53_5_72)).
query(true_val(recommended_weight_range_size, r54_77)).

% @attr boot_size_range_153
% @type categorical
% @canonical false
% @original_name boot size range 153
% @values us6_9=US_6_9_EU_39_43 unk_boot_size_range_153=Unknown
% @importance 1.00

0.93::acc(s1, boot_size_range_153).

0.92::true_val(boot_size_range_153, us6_9); 0.08::true_val(boot_size_range_153, unk_boot_size_range_153).

measured(s1, boot_size_range_153, us6_9).

all_consistent(boot_size_range_153) :-
    consistent(s1, boot_size_range_153).

evidence(all_consistent(boot_size_range_153)).
query(true_val(boot_size_range_153, us6_9)).
query(true_val(boot_size_range_153, unk_boot_size_range_153)).

% @attr effective_edge_157w
% @type numeric
% @unit cm
% @canonical false
% @original_name effective edge 157W
% @values v119_2=119.2 unk_effective_edge_157w=Unknown
% @importance 1.00

0.93::acc(s1, effective_edge_157w).

0.92::true_val(effective_edge_157w, v119_2); 0.08::true_val(effective_edge_157w, unk_effective_edge_157w).

measured(s1, effective_edge_157w, v119_2).

all_consistent(effective_edge_157w) :-
    consistent(s1, effective_edge_157w).

evidence(all_consistent(effective_edge_157w)).
query(true_val(effective_edge_157w, v119_2)).
query(true_val(effective_edge_157w, unk_effective_edge_157w)).

% @attr waist_width_157w
% @type numeric
% @unit cm
% @canonical false
% @original_name waist width 157W
% @values v26_4=26.4 unk_waist_width_157w=Unknown
% @importance 1.00

0.93::acc(s1, waist_width_157w).

0.92::true_val(waist_width_157w, v26_4); 0.08::true_val(waist_width_157w, unk_waist_width_157w).

measured(s1, waist_width_157w, v26_4).

all_consistent(waist_width_157w) :-
    consistent(s1, waist_width_157w).

evidence(all_consistent(waist_width_157w)).
query(true_val(waist_width_157w, v26_4)).
query(true_val(waist_width_157w, unk_waist_width_157w)).

% @attr sidecut_radius_size_157w
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size 157W
% @values r8_5_7_0_8_5=8.5_7.0_8.5m unk_sidecut_radius_size_157w=Unknown
% @importance 1.00

0.93::acc(s1, sidecut_radius_size_157w).

0.92::true_val(sidecut_radius_size_157w, r8_5_7_0_8_5); 0.08::true_val(sidecut_radius_size_157w, unk_sidecut_radius_size_157w).

measured(s1, sidecut_radius_size_157w, r8_5_7_0_8_5).

all_consistent(sidecut_radius_size_157w) :-
    consistent(s1, sidecut_radius_size_157w).

evidence(all_consistent(sidecut_radius_size_157w)).
query(true_val(sidecut_radius_size_157w, r8_5_7_0_8_5)).
query(true_val(sidecut_radius_size_157w, unk_sidecut_radius_size_157w)).

% @attr recommended_weight_range_size_157w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size 157W
% @values r67_5_85_5=67.5_to_85.5kg unk_recommended_weight_range_size_157w=Unknown
% @importance 1.00

0.93::acc(s1, recommended_weight_range_size_157w).

0.92::true_val(recommended_weight_range_size_157w, r67_5_85_5); 0.08::true_val(recommended_weight_range_size_157w, unk_recommended_weight_range_size_157w).

measured(s1, recommended_weight_range_size_157w, r67_5_85_5).

all_consistent(recommended_weight_range_size_157w) :-
    consistent(s1, recommended_weight_range_size_157w).

evidence(all_consistent(recommended_weight_range_size_157w)).
query(true_val(recommended_weight_range_size_157w, r67_5_85_5)).
query(true_val(recommended_weight_range_size_157w, unk_recommended_weight_range_size_157w)).

% @attr boot_size_range_157w
% @type categorical
% @canonical false
% @original_name boot size range 157W
% @values us9_12=US_9_12_EU_42_47 unk_boot_size_range_157w=Unknown
% @importance 1.00

0.93::acc(s1, boot_size_range_157w).

0.92::true_val(boot_size_range_157w, us9_12); 0.08::true_val(boot_size_range_157w, unk_boot_size_range_157w).

measured(s1, boot_size_range_157w, us9_12).

all_consistent(boot_size_range_157w) :-
    consistent(s1, boot_size_range_157w).

evidence(all_consistent(boot_size_range_157w)).
query(true_val(boot_size_range_157w, us9_12)).
query(true_val(boot_size_range_157w, unk_boot_size_range_157w)).

% @attr effective_edge_163w
% @type numeric
% @unit cm
% @canonical false
% @original_name effective edge 163W
% @values v123_4=123.4 unk_effective_edge_163w=Unknown
% @importance 1.00

0.93::acc(s1, effective_edge_163w).

0.92::true_val(effective_edge_163w, v123_4); 0.08::true_val(effective_edge_163w, unk_effective_edge_163w).

measured(s1, effective_edge_163w, v123_4).

all_consistent(effective_edge_163w) :-
    consistent(s1, effective_edge_163w).

evidence(all_consistent(effective_edge_163w)).
query(true_val(effective_edge_163w, v123_4)).
query(true_val(effective_edge_163w, unk_effective_edge_163w)).

% @attr waist_width_163w
% @type numeric
% @unit cm
% @canonical false
% @original_name waist width 163W
% @values v26_7=26.7 unk_waist_width_163w=Unknown
% @importance 1.00

0.93::acc(s1, waist_width_163w).

0.92::true_val(waist_width_163w, v26_7); 0.08::true_val(waist_width_163w, unk_waist_width_163w).

measured(s1, waist_width_163w, v26_7).

all_consistent(waist_width_163w) :-
    consistent(s1, waist_width_163w).

evidence(all_consistent(waist_width_163w)).
query(true_val(waist_width_163w, v26_7)).
query(true_val(waist_width_163w, unk_waist_width_163w)).

% @attr recommended_weight_range_size_163w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size 163W
% @values r82_100=82_to_100kg unk_recommended_weight_range_size_163w=Unknown
% @importance 1.00

0.93::acc(s1, recommended_weight_range_size_163w).

0.92::true_val(recommended_weight_range_size_163w, r82_100); 0.08::true_val(recommended_weight_range_size_163w, unk_recommended_weight_range_size_163w).

measured(s1, recommended_weight_range_size_163w, r82_100).

all_consistent(recommended_weight_range_size_163w) :-
    consistent(s1, recommended_weight_range_size_163w).

evidence(all_consistent(recommended_weight_range_size_163w)).
query(true_val(recommended_weight_range_size_163w, r82_100)).
query(true_val(recommended_weight_range_size_163w, unk_recommended_weight_range_size_163w)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values park_sidehits_trees_am=Park_side_hits_trees_all_mountain unk_terrain_suitability=Unknown
% @importance 0.95

0.95::acc(s1, terrain_suitability).
0.85::acc(s4, terrain_suitability).

0.96::true_val(terrain_suitability, park_sidehits_trees_am); 0.04::true_val(terrain_suitability, unk_terrain_suitability).

measured(s1, terrain_suitability, park_sidehits_trees_am).
measured(s4, terrain_suitability, park_sidehits_trees_am).

all_consistent(terrain_suitability) :-
    consistent(s1, terrain_suitability),
    (indep(s4), consistent(s4, terrain_suitability) ; \+indep(s4)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, park_sidehits_trees_am)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr terrain_suitability_park_10
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability (park rating)
% @values v7=7.0 unk_terrain_suitability_park_10=Unknown
% @importance 0.925

0.95::acc(s1, terrain_suitability_park_10).
0.70::acc(s16, terrain_suitability_park_10).

0.95::true_val(terrain_suitability_park_10, v7); 0.05::true_val(terrain_suitability_park_10, unk_terrain_suitability_park_10).

measured(s1, terrain_suitability_park_10, v7).
measured(s16, terrain_suitability_park_10, v7).

all_consistent(terrain_suitability_park_10) :-
    consistent(s1, terrain_suitability_park_10),
    (indep(s16), consistent(s16, terrain_suitability_park_10) ; \+indep(s16)).

evidence(all_consistent(terrain_suitability_park_10)).
query(true_val(terrain_suitability_park_10, v7)).
query(true_val(terrain_suitability_park_10, unk_terrain_suitability_park_10)).

% @attr terrain_suitability_all_mountain_10
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability (all-mountain rating)
% @values v7=7.0 unk_terrain_suitability_all_mountain_10=Unknown
% @importance 0.925

0.95::acc(s1, terrain_suitability_all_mountain_10).
0.70::acc(s16, terrain_suitability_all_mountain_10).

0.95::true_val(terrain_suitability_all_mountain_10, v7); 0.05::true_val(terrain_suitability_all_mountain_10, unk_terrain_suitability_all_mountain_10).

measured(s1, terrain_suitability_all_mountain_10, v7).
measured(s16, terrain_suitability_all_mountain_10, v7).

all_consistent(terrain_suitability_all_mountain_10) :-
    consistent(s1, terrain_suitability_all_mountain_10),
    (indep(s16), consistent(s16, terrain_suitability_all_mountain_10) ; \+indep(s16)).

evidence(all_consistent(terrain_suitability_all_mountain_10)).
query(true_val(terrain_suitability_all_mountain_10, v7)).
query(true_val(terrain_suitability_all_mountain_10, unk_terrain_suitability_all_mountain_10)).

% @attr terrain_suitability_powder_10
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability (powder rating)
% @values v7=7.0 unk_terrain_suitability_powder_10=Unknown
% @importance 0.925

0.95::acc(s1, terrain_suitability_powder_10).
0.70::acc(s16, terrain_suitability_powder_10).

0.95::true_val(terrain_suitability_powder_10, v7); 0.05::true_val(terrain_suitability_powder_10, unk_terrain_suitability_powder_10).

measured(s1, terrain_suitability_powder_10, v7).
measured(s16, terrain_suitability_powder_10, v7).

all_consistent(terrain_suitability_powder_10) :-
    consistent(s1, terrain_suitability_powder_10),
    (indep(s16), consistent(s16, terrain_suitability_powder_10) ; \+indep(s16)).

evidence(all_consistent(terrain_suitability_powder_10)).
query(true_val(terrain_suitability_powder_10, v7)).
query(true_val(terrain_suitability_powder_10, unk_terrain_suitability_powder_10)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values freestyle_all_mountain=Freestyle_all_mountain unk_riding_style=Unknown
% @importance 0.88

0.85::acc(s4, riding_style).
0.85::acc(s14, riding_style).

0.95::true_val(riding_style, freestyle_all_mountain); 0.05::true_val(riding_style, unk_riding_style).

measured(s4, riding_style, freestyle_all_mountain).
measured(s14, riding_style, freestyle_all_mountain).

all_consistent(riding_style) :-
    (indep(s4), consistent(s4, riding_style) ; \+indep(s4)),
    consistent(s14, riding_style).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, freestyle_all_mountain)).
query(true_val(riding_style, unk_riding_style)).

% @attr rider_level
% @type categorical
% @canonical false
% @original_name rider_level
% @values intermediate=Intermediate unk_rider_level=Unknown
% @importance 0.75

0.75::acc(s22, rider_level).
0.85::acc(s15, rider_level).

0.95::true_val(rider_level, intermediate); 0.05::true_val(rider_level, unk_rider_level).

measured(s22, rider_level, intermediate).
measured(s15, rider_level, intermediate).

all_consistent(rider_level) :-
    (indep(s22), consistent(s22, rider_level) ; \+indep(s22)),
    (indep(s15), consistent(s15, rider_level) ; \+indep(s15)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate)).
query(true_val(rider_level, unk_rider_level)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values intermediate_advanced=Intermediate_Advanced unk_skill_level_recommendation=Unknown
% @importance 0.75

0.85::acc(s15, skill_level_recommendation).
0.75::acc(s22, skill_level_recommendation).

0.95::true_val(skill_level_recommendation, intermediate_advanced); 0.05::true_val(skill_level_recommendation, unk_skill_level_recommendation).

measured(s15, skill_level_recommendation, intermediate_advanced).
measured(s22, skill_level_recommendation, intermediate_advanced).

all_consistent(skill_level_recommendation) :-
    (indep(s15), consistent(s15, skill_level_recommendation) ; \+indep(s15)),
    (indep(s22), consistent(s22, skill_level_recommendation) ; \+indep(s22)).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, intermediate_advanced)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

% @attr board_weight_grams
% @type numeric
% @unit g
% @canonical true
% @original_name board_weight_grams
% @values v2680=2680.0 unk_board_weight_grams=Unknown
% @importance 0.95

0.92::acc(s26, board_weight_grams).

0.76::true_val(board_weight_grams, v2680); 0.24::true_val(board_weight_grams, unk_board_weight_grams).

measured(s26, board_weight_grams, v2680).

all_consistent(board_weight_grams) :-
    consistent(s26, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v2680)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr weight_per_cm
% @type numeric
% @unit g/cm
% @canonical false
% @original_name weight_per_cm
% @values v17_52=17.52 unk_weight_per_cm=Unknown
% @importance 0.95

0.90::acc(s26, weight_per_cm).

0.76::true_val(weight_per_cm, v17_52); 0.24::true_val(weight_per_cm, unk_weight_per_cm).

measured(s26, weight_per_cm, v17_52).

all_consistent(weight_per_cm) :-
    consistent(s26, weight_per_cm).

evidence(all_consistent(weight_per_cm)).
query(true_val(weight_per_cm, v17_52)).
query(true_val(weight_per_cm, unk_weight_per_cm)).

% @attr overall_rating_snowboardingprofiles
% @type numeric
% @unit /100
% @canonical true
% @original_name overall_rating_snowboardingprofiles
% @values v85_9=85.9 unk_overall_rating_snowboardingprofiles=Unknown
% @importance 0.95

0.90::acc(s26, overall_rating_snowboardingprofiles).

0.76::true_val(overall_rating_snowboardingprofiles, v85_9); 0.24::true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles).

measured(s26, overall_rating_snowboardingprofiles, v85_9).

all_consistent(overall_rating_snowboardingprofiles) :-
    consistent(s26, overall_rating_snowboardingprofiles).

evidence(all_consistent(overall_rating_snowboardingprofiles)).
query(true_val(overall_rating_snowboardingprofiles, v85_9)).
query(true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles)).

% @attr freestyle_board_average_score
% @type numeric
% @unit /100
% @canonical false
% @original_name freestyle board average score
% @values v83_8=83.8 unk_freestyle_board_average_score=Unknown
% @importance 0.95

0.88::acc(s26, freestyle_board_average_score).

0.76::true_val(freestyle_board_average_score, v83_8); 0.24::true_val(freestyle_board_average_score, unk_freestyle_board_average_score).

measured(s26, freestyle_board_average_score, v83_8).

all_consistent(freestyle_board_average_score) :-
    consistent(s26, freestyle_board_average_score).

evidence(all_consistent(freestyle_board_average_score)).
query(true_val(freestyle_board_average_score, v83_8)).
query(true_val(freestyle_board_average_score, unk_freestyle_board_average_score)).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name reviewer_opinion_snowboardingprofiles
% @values fun_forgiving_easygoing=Really_fun_forgiving_easygoing unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.95

0.88::acc(s26, reviewer_opinion_snowboardingprofiles).

0.76::true_val(reviewer_opinion_snowboardingprofiles, fun_forgiving_easygoing); 0.24::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).

measured(s26, reviewer_opinion_snowboardingprofiles, fun_forgiving_easygoing).

all_consistent(reviewer_opinion_snowboardingprofiles) :-
    consistent(s26, reviewer_opinion_snowboardingprofiles).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, fun_forgiving_easygoing)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values strong_contender_quiver=Strong_contender_one_board_quiver unk_reviewer_opinion_whitelines=Unknown
% @importance 0.85

0.85::acc(s14, reviewer_opinion_whitelines).

0.77::true_val(reviewer_opinion_whitelines, strong_contender_quiver); 0.23::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

measured(s14, reviewer_opinion_whitelines, strong_contender_quiver).

all_consistent(reviewer_opinion_whitelines) :-
    consistent(s14, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, strong_contender_quiver)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

% @attr reviewer_opinion_whitelines_100
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines (Whitelines 100)
% @values included_whitelines_100=Included_in_Whitelines_100 unk_reviewer_opinion_whitelines_100=Unknown
% @importance 0.80

0.85::acc(s21, reviewer_opinion_whitelines_100).

0.78::true_val(reviewer_opinion_whitelines_100, included_whitelines_100); 0.22::true_val(reviewer_opinion_whitelines_100, unk_reviewer_opinion_whitelines_100).

measured(s21, reviewer_opinion_whitelines_100, included_whitelines_100).

all_consistent(reviewer_opinion_whitelines_100) :-
    consistent(s21, reviewer_opinion_whitelines_100).

evidence(all_consistent(reviewer_opinion_whitelines_100)).
query(true_val(reviewer_opinion_whitelines_100, included_whitelines_100)).
query(true_val(reviewer_opinion_whitelines_100, unk_reviewer_opinion_whitelines_100)).

% @attr user_review_forum
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values five_star_plain_fun=5_star_just_plain_fun unk_user_review_forum=Unknown
% @importance 1.00

0.80::acc(s1, user_review_forum).

0.78::true_val(user_review_forum, five_star_plain_fun); 0.22::true_val(user_review_forum, unk_user_review_forum).

measured(s1, user_review_forum, five_star_plain_fun).

all_consistent(user_review_forum) :-
    consistent(s1, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, five_star_plain_fun)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values outstanding_pressing=Outstanding_easy_press_catchless_3D unk_positive_aspect=Unknown
% @importance 0.90

0.85::acc(s14, positive_aspect).
0.90::acc(s26, positive_aspect).

0.95::true_val(positive_aspect, outstanding_pressing); 0.05::true_val(positive_aspect, unk_positive_aspect).

measured(s14, positive_aspect, outstanding_pressing).
measured(s26, positive_aspect, outstanding_pressing).

all_consistent(positive_aspect) :-
    consistent(s14, positive_aspect),
    consistent(s26, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, outstanding_pressing)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr switch_riding
% @type categorical
% @canonical false
% @original_name switch_riding
% @values great_smooth=Great_smooth_transitions_low_catch unk_switch_riding=Unknown
% @importance 0.95

0.90::acc(s26, switch_riding).

0.76::true_val(switch_riding, great_smooth); 0.24::true_val(switch_riding, unk_switch_riding).

measured(s26, switch_riding, great_smooth).

all_consistent(switch_riding) :-
    consistent(s26, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, great_smooth)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr positive_aspect_spins
% @type categorical
% @canonical false
% @original_name positive_aspect (spins)
% @values easy_rotations_forgiving=Easy_rotations_intuitive_forgiving_landings unk_positive_aspect_spins=Unknown
% @importance 0.95

0.90::acc(s26, positive_aspect_spins).

0.76::true_val(positive_aspect_spins, easy_rotations_forgiving); 0.24::true_val(positive_aspect_spins, unk_positive_aspect_spins).

measured(s26, positive_aspect_spins, easy_rotations_forgiving).

all_consistent(positive_aspect_spins) :-
    consistent(s26, positive_aspect_spins).

evidence(all_consistent(positive_aspect_spins)).
query(true_val(positive_aspect_spins, easy_rotations_forgiving)).
query(true_val(positive_aspect_spins, unk_positive_aspect_spins)).

% @attr positive_aspect_park
% @type categorical
% @canonical false
% @original_name positive_aspect (park)
% @values easy_pop_maneuverable=Standout_easy_pop_maneuverability_forgiving unk_positive_aspect_park=Unknown
% @importance 0.95

0.90::acc(s26, positive_aspect_park).

0.76::true_val(positive_aspect_park, easy_pop_maneuverable); 0.24::true_val(positive_aspect_park, unk_positive_aspect_park).

measured(s26, positive_aspect_park, easy_pop_maneuverable).

all_consistent(positive_aspect_park) :-
    consistent(s26, positive_aspect_park).

evidence(all_consistent(positive_aspect_park)).
query(true_val(positive_aspect_park, easy_pop_maneuverable)).
query(true_val(positive_aspect_park, unk_positive_aspect_park)).

% @attr turn_initiation_performance
% @type categorical
% @canonical false
% @original_name turn_initiation_performance
% @values super_easy=Super_easy_playful_surfy unk_turn_initiation_performance=Unknown
% @importance 0.95

0.90::acc(s26, turn_initiation_performance).

0.76::true_val(turn_initiation_performance, super_easy); 0.24::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s26, turn_initiation_performance, super_easy).

all_consistent(turn_initiation_performance) :-
    consistent(s26, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, super_easy)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr positive_aspect_edge_to_edge
% @type categorical
% @canonical false
% @original_name positive_aspect (edge-to-edge)
% @values solid_quick_slow_speed=Really_solid_quick_edge_to_edge_slower_speeds unk_positive_aspect_edge_to_edge=Unknown
% @importance 0.95

0.90::acc(s26, positive_aspect_edge_to_edge).

0.76::true_val(positive_aspect_edge_to_edge, solid_quick_slow_speed); 0.24::true_val(positive_aspect_edge_to_edge, unk_positive_aspect_edge_to_edge).

measured(s26, positive_aspect_edge_to_edge, solid_quick_slow_speed).

all_consistent(positive_aspect_edge_to_edge) :-
    consistent(s26, positive_aspect_edge_to_edge).

evidence(all_consistent(positive_aspect_edge_to_edge)).
query(true_val(positive_aspect_edge_to_edge, solid_quick_slow_speed)).
query(true_val(positive_aspect_edge_to_edge, unk_positive_aspect_edge_to_edge)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values decent_low_catch=Decent_on_hard_snow_very_low_catch_factor unk_edge_hold=Unknown
% @importance 0.95

0.88::acc(s26, edge_hold).

0.76::true_val(edge_hold, decent_low_catch); 0.24::true_val(edge_hold, unk_edge_hold).

measured(s26, edge_hold, decent_low_catch).

all_consistent(edge_hold) :-
    consistent(s26, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, decent_low_catch)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr pop
% @type categorical
% @canonical false
% @original_name pop
% @values easy_quick_load=Easy_access_loads_quickly_spontaneous unk_pop=Unknown
% @importance 0.95

0.90::acc(s26, pop).

0.76::true_val(pop, easy_quick_load); 0.24::true_val(pop, unk_pop).

measured(s26, pop, easy_quick_load).

all_consistent(pop) :-
    consistent(s26, pop).

evidence(all_consistent(pop)).
query(true_val(pop, easy_quick_load)).
query(true_val(pop, unk_pop)).

% @attr jibbing_rating_tgr
% @type categorical
% @canonical true
% @original_name jibbing_rating_tgr
% @values solid_jib=Solid_jib_board_confident_rails_boxes unk_jibbing_rating_tgr=Unknown
% @importance 0.95

0.88::acc(s26, jibbing_rating_tgr).

0.76::true_val(jibbing_rating_tgr, solid_jib); 0.24::true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr).

measured(s26, jibbing_rating_tgr, solid_jib).

all_consistent(jibbing_rating_tgr) :-
    consistent(s26, jibbing_rating_tgr).

evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, solid_jib)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values wobbly_high_speed=Gets_wobbly_at_higher_speeds unk_negative_aspect=Unknown
% @importance 0.95

0.90::acc(s26, negative_aspect).

0.76::true_val(negative_aspect, wobbly_high_speed); 0.24::true_val(negative_aspect, unk_negative_aspect).

measured(s26, negative_aspect, wobbly_high_speed).

all_consistent(negative_aspect) :-
    consistent(s26, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, wobbly_high_speed)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_chop
% @type categorical
% @canonical false
% @original_name negative_aspect (chop)
% @values struggles_chop=Gets_thrown_around_in_chopped_snow unk_negative_aspect_chop=Unknown
% @importance 0.95

0.90::acc(s26, negative_aspect_chop).

0.76::true_val(negative_aspect_chop, struggles_chop); 0.24::true_val(negative_aspect_chop, unk_negative_aspect_chop).

measured(s26, negative_aspect_chop, struggles_chop).

all_consistent(negative_aspect_chop) :-
    consistent(s26, negative_aspect_chop).

evidence(all_consistent(negative_aspect_chop)).
query(true_val(negative_aspect_chop, struggles_chop)).
query(true_val(negative_aspect_chop, unk_negative_aspect_chop)).

% @attr carving_score_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name carving_score_snowboardingprofiles
% @values adequate_casual=Adequate_casual_carving_not_dedicated unk_carving_score_snowboardingprofiles=Unknown
% @importance 0.95

0.88::acc(s26, carving_score_snowboardingprofiles).

0.76::true_val(carving_score_snowboardingprofiles, adequate_casual); 0.24::true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles).

measured(s26, carving_score_snowboardingprofiles, adequate_casual).

all_consistent(carving_score_snowboardingprofiles) :-
    consistent(s26, carving_score_snowboardingprofiles).

evidence(all_consistent(carving_score_snowboardingprofiles)).
query(true_val(carving_score_snowboardingprofiles, adequate_casual)).
query(true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles)).

% @attr powder_score_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name powder_score_snowboardingprofiles
% @values not_well_suited=Not_well_suited_lacks_float unk_powder_score_snowboardingprofiles=Unknown
% @importance 0.95

0.88::acc(s26, powder_score_snowboardingprofiles).

0.76::true_val(powder_score_snowboardingprofiles, not_well_suited); 0.24::true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles).

measured(s26, powder_score_snowboardingprofiles, not_well_suited).

all_consistent(powder_score_snowboardingprofiles) :-
    consistent(s26, powder_score_snowboardingprofiles).

evidence(all_consistent(powder_score_snowboardingprofiles)).
query(true_val(powder_score_snowboardingprofiles, not_well_suited)).
query(true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles)).

% @attr negative_aspect_flex_soft
% @type categorical
% @canonical false
% @original_name negative_aspect (flex too soft)
% @values flex_too_soft_aggressive=Aggressive_riders_may_find_flex_too_soft unk_negative_aspect_flex_soft=Unknown
% @importance 0.85

0.85::acc(s14, negative_aspect_flex_soft).

0.77::true_val(negative_aspect_flex_soft, flex_too_soft_aggressive); 0.23::true_val(negative_aspect_flex_soft, unk_negative_aspect_flex_soft).

measured(s14, negative_aspect_flex_soft, flex_too_soft_aggressive).

all_consistent(negative_aspect_flex_soft) :-
    consistent(s14, negative_aspect_flex_soft).

evidence(all_consistent(negative_aspect_flex_soft)).
query(true_val(negative_aspect_flex_soft, flex_too_soft_aggressive)).
query(true_val(negative_aspect_flex_soft, unk_negative_aspect_flex_soft)).

% @attr negative_aspect_graphic
% @type categorical
% @canonical false
% @original_name negative_aspect (graphic)
% @values graphic_not_fresh=Graphic_does_not_feel_as_fresh_as_the_board unk_negative_aspect_graphic=Unknown
% @importance 0.85

0.82::acc(s14, negative_aspect_graphic).

0.77::true_val(negative_aspect_graphic, graphic_not_fresh); 0.23::true_val(negative_aspect_graphic, unk_negative_aspect_graphic).

measured(s14, negative_aspect_graphic, graphic_not_fresh).

all_consistent(negative_aspect_graphic) :-
    consistent(s14, negative_aspect_graphic).

evidence(all_consistent(negative_aspect_graphic)).
query(true_val(negative_aspect_graphic, graphic_not_fresh)).
query(true_val(negative_aspect_graphic, unk_negative_aspect_graphic)).

% @attr reviewer_opinion_snowboardingprofiles_quiver
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (quiver caveat)
% @values one_board_if_not_charging=One_board_quiver_only_if_not_charging_or_powder unk_reviewer_opinion_snowboardingprofiles_quiver=Unknown
% @importance 0.95

0.88::acc(s26, reviewer_opinion_snowboardingprofiles_quiver).

0.76::true_val(reviewer_opinion_snowboardingprofiles_quiver, one_board_if_not_charging); 0.24::true_val(reviewer_opinion_snowboardingprofiles_quiver, unk_reviewer_opinion_snowboardingprofiles_quiver).

measured(s26, reviewer_opinion_snowboardingprofiles_quiver, one_board_if_not_charging).

all_consistent(reviewer_opinion_snowboardingprofiles_quiver) :-
    consistent(s26, reviewer_opinion_snowboardingprofiles_quiver).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_quiver)).
query(true_val(reviewer_opinion_snowboardingprofiles_quiver, one_board_if_not_charging)).
query(true_val(reviewer_opinion_snowboardingprofiles_quiver, unk_reviewer_opinion_snowboardingprofiles_quiver)).

% @attr camber_height_mm
% @type numeric
% @unit mm
% @canonical true
% @original_name camber_height_mm
% @values v7=7.0 unk_camber_height_mm=Unknown
% @importance 0.95

0.92::acc(s26, camber_height_mm).

0.76::true_val(camber_height_mm, v7); 0.24::true_val(camber_height_mm, unk_camber_height_mm).

measured(s26, camber_height_mm, v7).

all_consistent(camber_height_mm) :-
    consistent(s26, camber_height_mm).

evidence(all_consistent(camber_height_mm)).
query(true_val(camber_height_mm, v7)).
query(true_val(camber_height_mm, unk_camber_height_mm)).

% @attr warranty_period_years
% @type numeric
% @unit years
% @canonical true
% @original_name warranty_period_years
% @values v2=2.0 v3=3.0
% @importance 0.75

0.95::acc(s28, warranty_period_years).
0.92::acc(s29, warranty_period_years).
0.93::acc(s30, warranty_period_years).
0.80::acc(s31, warranty_period_years).

0.40::true_val(warranty_period_years, v2); 0.60::true_val(warranty_period_years, v3).

measured(s28, warranty_period_years, v2).
measured(s29, warranty_period_years, v3).
measured(s30, warranty_period_years, v3).
measured(s31, warranty_period_years, v3).

all_consistent(warranty_period_years) :-
    consistent(s28, warranty_period_years),
    consistent(s29, warranty_period_years),
    consistent(s30, warranty_period_years),
    consistent(s31, warranty_period_years).

evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v2)).
query(true_val(warranty_period_years, v3)).

% @attr warranty_coverage
% @type categorical
% @canonical false
% @original_name warranty coverage
% @values delam_inserts_topsheet=Delamination_inserts_cracked_topsheet unk_warranty_coverage=Unknown
% @importance 0.80

0.95::acc(s28, warranty_coverage).

0.90::true_val(warranty_coverage, delam_inserts_topsheet); 0.10::true_val(warranty_coverage, unk_warranty_coverage).

measured(s28, warranty_coverage, delam_inserts_topsheet).

all_consistent(warranty_coverage) :-
    consistent(s28, warranty_coverage).

evidence(all_consistent(warranty_coverage)).
query(true_val(warranty_coverage, delam_inserts_topsheet)).
query(true_val(warranty_coverage, unk_warranty_coverage)).

% @attr return_policy_terms
% @type categorical
% @canonical false
% @original_name return_policy_terms
% @values days_45=45_day_return_policy unk_return_policy_terms=Unknown
% @importance 0.75

0.93::acc(s30, return_policy_terms).

0.90::true_val(return_policy_terms, days_45); 0.10::true_val(return_policy_terms, unk_return_policy_terms).

measured(s30, return_policy_terms, days_45).

all_consistent(return_policy_terms) :-
    consistent(s30, return_policy_terms).

evidence(all_consistent(return_policy_terms)).
query(true_val(return_policy_terms, days_45)).
query(true_val(return_policy_terms, unk_return_policy_terms)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values capita_doa=CAPiTA_DOA_twin_hybrid_camber_flex_5_5 unk_comparable_board_cross_brand=Unknown
% @importance 0.75

0.75::acc(s32, comparable_board_cross_brand).
0.75::acc(s33, comparable_board_cross_brand).

0.90::true_val(comparable_board_cross_brand, capita_doa); 0.10::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s32, comparable_board_cross_brand, capita_doa).
measured(s33, comparable_board_cross_brand, capita_doa).

all_consistent(comparable_board_cross_brand) :-
    consistent(s32, comparable_board_cross_brand),
    consistent(s33, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, capita_doa)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_process
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Burton Process)
% @values burton_process=Burton_Process_twin_freestyle_playful_medium unk_comparable_board_cross_brand_process=Unknown
% @importance 0.625

0.40::acc(s34, comparable_board_cross_brand_process).
0.40::acc(s35, comparable_board_cross_brand_process).

0.80::true_val(comparable_board_cross_brand_process, burton_process); 0.20::true_val(comparable_board_cross_brand_process, unk_comparable_board_cross_brand_process).

measured(s34, comparable_board_cross_brand_process, burton_process).
measured(s35, comparable_board_cross_brand_process, burton_process).

all_consistent(comparable_board_cross_brand_process) :-
    consistent(s34, comparable_board_cross_brand_process),
    consistent(s35, comparable_board_cross_brand_process).

evidence(all_consistent(comparable_board_cross_brand_process)).
query(true_val(comparable_board_cross_brand_process, burton_process)).
query(true_val(comparable_board_cross_brand_process, unk_comparable_board_cross_brand_process)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values rome_agent=Rome_Agent_all_mountain_true_twin unk_comparable_board_same_brand=Unknown
% @importance 0.55

0.75::acc(s36, comparable_board_same_brand).

0.45::true_val(comparable_board_same_brand, rome_agent); 0.55::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s36, comparable_board_same_brand, rome_agent).

all_consistent(comparable_board_same_brand) :-
    consistent(s36, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, rome_agent)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_ravine
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Rome Ravine)
% @values rome_ravine=Rome_Ravine_directional_freeride_599_95 unk_comparable_board_same_brand_ravine=Unknown
% @importance 0.90

0.85::acc(s17, comparable_board_same_brand_ravine).

0.77::true_val(comparable_board_same_brand_ravine, rome_ravine); 0.23::true_val(comparable_board_same_brand_ravine, unk_comparable_board_same_brand_ravine).

measured(s17, comparable_board_same_brand_ravine, rome_ravine).

all_consistent(comparable_board_same_brand_ravine) :-
    consistent(s17, comparable_board_same_brand_ravine).

evidence(all_consistent(comparable_board_same_brand_ravine)).
query(true_val(comparable_board_same_brand_ravine, rome_ravine)).
query(true_val(comparable_board_same_brand_ravine, unk_comparable_board_same_brand_ravine)).

% @attr comparable_board_cross_brand_party_platter
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (K2 Party Platter)
% @values k2_party_platter=K2_Party_Platter_equally_fun unk_comparable_board_cross_brand_party_platter=Unknown
% @importance 1.00

0.80::acc(s1, comparable_board_cross_brand_party_platter).

0.78::true_val(comparable_board_cross_brand_party_platter, k2_party_platter); 0.22::true_val(comparable_board_cross_brand_party_platter, unk_comparable_board_cross_brand_party_platter).

measured(s1, comparable_board_cross_brand_party_platter, k2_party_platter).

all_consistent(comparable_board_cross_brand_party_platter) :-
    consistent(s1, comparable_board_cross_brand_party_platter).

evidence(all_consistent(comparable_board_cross_brand_party_platter)).
query(true_val(comparable_board_cross_brand_party_platter, k2_party_platter)).
query(true_val(comparable_board_cross_brand_party_platter, unk_comparable_board_cross_brand_party_platter)).

% @attr comparable_board_same_brand_mechanic_price
% @type numeric
% @unit USD
% @canonical false
% @original_name comparable_board_same_brand (Mechanic price)
% @values v449_95=449.95 unk_comparable_board_same_brand_mechanic_price=Unknown
% @importance 0.90

0.85::acc(s17, comparable_board_same_brand_mechanic_price).

0.77::true_val(comparable_board_same_brand_mechanic_price, v449_95); 0.23::true_val(comparable_board_same_brand_mechanic_price, unk_comparable_board_same_brand_mechanic_price).

measured(s17, comparable_board_same_brand_mechanic_price, v449_95).

all_consistent(comparable_board_same_brand_mechanic_price) :-
    consistent(s17, comparable_board_same_brand_mechanic_price).

evidence(all_consistent(comparable_board_same_brand_mechanic_price)).
query(true_val(comparable_board_same_brand_mechanic_price, v449_95)).
query(true_val(comparable_board_same_brand_mechanic_price, unk_comparable_board_same_brand_mechanic_price)).

% @attr comparable_board_same_brand_agent_price
% @type numeric
% @unit USD
% @canonical false
% @original_name comparable_board_same_brand (Agent price)
% @values v499_95=499.95 unk_comparable_board_same_brand_agent_price=Unknown
% @importance 0.90

0.85::acc(s17, comparable_board_same_brand_agent_price).

0.77::true_val(comparable_board_same_brand_agent_price, v499_95); 0.23::true_val(comparable_board_same_brand_agent_price, unk_comparable_board_same_brand_agent_price).

measured(s17, comparable_board_same_brand_agent_price, v499_95).

all_consistent(comparable_board_same_brand_agent_price) :-
    consistent(s17, comparable_board_same_brand_agent_price).

evidence(all_consistent(comparable_board_same_brand_agent_price)).
query(true_val(comparable_board_same_brand_agent_price, v499_95)).
query(true_val(comparable_board_same_brand_agent_price, unk_comparable_board_same_brand_agent_price)).

% @attr comparable_board_same_brand_price_559a
% @type numeric
% @unit USD
% @canonical false
% @original_name comparable_board_same_brand (lineup price 559a)
% @values v559_95=559.95 unk_comparable_board_same_brand_price_559a=Unknown
% @importance 0.90

0.85::acc(s17, comparable_board_same_brand_price_559a).

0.77::true_val(comparable_board_same_brand_price_559a, v559_95); 0.23::true_val(comparable_board_same_brand_price_559a, unk_comparable_board_same_brand_price_559a).

measured(s17, comparable_board_same_brand_price_559a, v559_95).

all_consistent(comparable_board_same_brand_price_559a) :-
    consistent(s17, comparable_board_same_brand_price_559a).

evidence(all_consistent(comparable_board_same_brand_price_559a)).
query(true_val(comparable_board_same_brand_price_559a, v559_95)).
query(true_val(comparable_board_same_brand_price_559a, unk_comparable_board_same_brand_price_559a)).

% @attr comparable_board_same_brand_price_559b
% @type numeric
% @unit USD
% @canonical false
% @original_name comparable_board_same_brand (lineup price 559b)
% @values v559_95=559.95 unk_comparable_board_same_brand_price_559b=Unknown
% @importance 0.90

0.85::acc(s17, comparable_board_same_brand_price_559b).

0.77::true_val(comparable_board_same_brand_price_559b, v559_95); 0.23::true_val(comparable_board_same_brand_price_559b, unk_comparable_board_same_brand_price_559b).

measured(s17, comparable_board_same_brand_price_559b, v559_95).

all_consistent(comparable_board_same_brand_price_559b) :-
    consistent(s17, comparable_board_same_brand_price_559b).

evidence(all_consistent(comparable_board_same_brand_price_559b)).
query(true_val(comparable_board_same_brand_price_559b, v559_95)).
query(true_val(comparable_board_same_brand_price_559b, unk_comparable_board_same_brand_price_559b)).

% @attr comparable_board_same_brand_ravine_price
% @type numeric
% @unit USD
% @canonical false
% @original_name comparable_board_same_brand (Ravine price)
% @values v599_95=599.95 unk_comparable_board_same_brand_ravine_price=Unknown
% @importance 0.90

0.85::acc(s17, comparable_board_same_brand_ravine_price).

0.77::true_val(comparable_board_same_brand_ravine_price, v599_95); 0.23::true_val(comparable_board_same_brand_ravine_price, unk_comparable_board_same_brand_ravine_price).

measured(s17, comparable_board_same_brand_ravine_price, v599_95).

all_consistent(comparable_board_same_brand_ravine_price) :-
    consistent(s17, comparable_board_same_brand_ravine_price).

evidence(all_consistent(comparable_board_same_brand_ravine_price)).
query(true_val(comparable_board_same_brand_ravine_price, v599_95)).
query(true_val(comparable_board_same_brand_ravine_price, unk_comparable_board_same_brand_ravine_price)).

% @attr comparable_board_same_brand_price_669
% @type numeric
% @unit USD
% @canonical false
% @original_name comparable_board_same_brand (lineup price 669)
% @values v669_95=669.95 unk_comparable_board_same_brand_price_669=Unknown
% @importance 0.90

0.85::acc(s17, comparable_board_same_brand_price_669).

0.77::true_val(comparable_board_same_brand_price_669, v669_95); 0.23::true_val(comparable_board_same_brand_price_669, unk_comparable_board_same_brand_price_669).

measured(s17, comparable_board_same_brand_price_669, v669_95).

all_consistent(comparable_board_same_brand_price_669) :-
    consistent(s17, comparable_board_same_brand_price_669).

evidence(all_consistent(comparable_board_same_brand_price_669)).
query(true_val(comparable_board_same_brand_price_669, v669_95)).
query(true_val(comparable_board_same_brand_price_669, unk_comparable_board_same_brand_price_669)).

% @attr average_freestyle_snowboard_price
% @type numeric
% @unit USD
% @canonical false
% @original_name average freestyle snowboard price (SnowboardingProfiles sample)
% @values v518=518.0 unk_average_freestyle_snowboard_price=Unknown
% @importance 0.95

0.85::acc(s26, average_freestyle_snowboard_price).

0.76::true_val(average_freestyle_snowboard_price, v518); 0.24::true_val(average_freestyle_snowboard_price, unk_average_freestyle_snowboard_price).

measured(s26, average_freestyle_snowboard_price, v518).

all_consistent(average_freestyle_snowboard_price) :-
    consistent(s26, average_freestyle_snowboard_price).

evidence(all_consistent(average_freestyle_snowboard_price)).
query(true_val(average_freestyle_snowboard_price, v518)).
query(true_val(average_freestyle_snowboard_price, unk_average_freestyle_snowboard_price)).

% @attr brand_perception
% @type categorical
% @canonical false
% @original_name brand perception
% @values serious_player_since_2001=Serious_player_since_2001 unk_brand_perception=Unknown
% @importance 0.40

0.80::acc(s10, brand_perception).

0.68::true_val(brand_perception, serious_player_since_2001); 0.32::true_val(brand_perception, unk_brand_perception).

measured(s10, brand_perception, serious_player_since_2001).

all_consistent(brand_perception) :-
    consistent(s10, brand_perception).

evidence(all_consistent(brand_perception)).
query(true_val(brand_perception, serious_player_since_2001)).
query(true_val(brand_perception, unk_brand_perception)).

% @attr brand_reputation_blue_tomato
% @type categorical
% @canonical false
% @original_name brand reputation (Blue Tomato)
% @values influential_institution=Anti_establishment_influential_institution unk_brand_reputation_blue_tomato=Unknown
% @importance 0.30

0.75::acc(s13, brand_reputation_blue_tomato).

0.60::true_val(brand_reputation_blue_tomato, influential_institution); 0.40::true_val(brand_reputation_blue_tomato, unk_brand_reputation_blue_tomato).

measured(s13, brand_reputation_blue_tomato, influential_institution).

all_consistent(brand_reputation_blue_tomato) :-
    (indep(s13), consistent(s13, brand_reputation_blue_tomato) ; \+indep(s13)).

evidence(all_consistent(brand_reputation_blue_tomato)).
query(true_val(brand_reputation_blue_tomato, influential_institution)).
query(true_val(brand_reputation_blue_tomato, unk_brand_reputation_blue_tomato)).

% @attr brand_reputation_ballistyx
% @type categorical
% @canonical false
% @original_name brand reputation (Ballistyx)
% @values creativity_progression=Reputation_for_creativity_and_progression unk_brand_reputation_ballistyx=Unknown
% @importance 0.95

0.72::acc(s3, brand_reputation_ballistyx).

0.71::true_val(brand_reputation_ballistyx, creativity_progression); 0.29::true_val(brand_reputation_ballistyx, unk_brand_reputation_ballistyx).

measured(s3, brand_reputation_ballistyx, creativity_progression).

all_consistent(brand_reputation_ballistyx) :-
    (indep(s3), consistent(s3, brand_reputation_ballistyx) ; \+indep(s3)).

evidence(all_consistent(brand_reputation_ballistyx)).
query(true_val(brand_reputation_ballistyx, creativity_progression)).
query(true_val(brand_reputation_ballistyx, unk_brand_reputation_ballistyx)).

% @attr brand_community_involvement
% @type categorical
% @canonical false
% @original_name brand community involvement
% @values events_competitions_sponsors=Active_events_competitions_sponsors unk_brand_community_involvement=Unknown
% @importance 0.40

0.60::acc(s37, brand_community_involvement).

0.48::true_val(brand_community_involvement, events_competitions_sponsors); 0.52::true_val(brand_community_involvement, unk_brand_community_involvement).

measured(s37, brand_community_involvement, events_competitions_sponsors).

all_consistent(brand_community_involvement) :-
    consistent(s37, brand_community_involvement).

evidence(all_consistent(brand_community_involvement)).
query(true_val(brand_community_involvement, events_competitions_sponsors)).
query(true_val(brand_community_involvement, unk_brand_community_involvement)).

% @attr brand_design_philosophy
% @type categorical
% @canonical false
% @original_name brand design philosophy
% @values rider_driven=Rider_driven_product_development unk_brand_design_philosophy=Unknown
% @importance 0.40

0.60::acc(s37, brand_design_philosophy).

0.48::true_val(brand_design_philosophy, rider_driven); 0.52::true_val(brand_design_philosophy, unk_brand_design_philosophy).

measured(s37, brand_design_philosophy, rider_driven).

all_consistent(brand_design_philosophy) :-
    consistent(s37, brand_design_philosophy).

evidence(all_consistent(brand_design_philosophy)).
query(true_val(brand_design_philosophy, rider_driven)).
query(true_val(brand_design_philosophy, unk_brand_design_philosophy)).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values universal_2x4=2x4_compatible_all_major_brands unk_binding_compatibility=Unknown
% @importance 0.975

0.95::acc(s1, binding_compatibility).
0.75::acc(s3, binding_compatibility).

0.96::true_val(binding_compatibility, universal_2x4); 0.04::true_val(binding_compatibility, unk_binding_compatibility).

measured(s1, binding_compatibility, universal_2x4).
measured(s3, binding_compatibility, universal_2x4).

all_consistent(binding_compatibility) :-
    consistent(s1, binding_compatibility),
    (indep(s3), consistent(s3, binding_compatibility) ; \+indep(s3)).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, universal_2x4)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

% @attr chatter_performance
% @type categorical
% @canonical false
% @original_name chatter_performance
% @values mid_range_chattery=Mid_range_chattery_rather_than_damp unk_chatter_performance=Unknown
% @importance 0.95

0.88::acc(s26, chatter_performance).

0.76::true_val(chatter_performance, mid_range_chattery); 0.24::true_val(chatter_performance, unk_chatter_performance).

measured(s26, chatter_performance, mid_range_chattery).

all_consistent(chatter_performance) :-
    consistent(s26, chatter_performance).

evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, mid_range_chattery)).
query(true_val(chatter_performance, unk_chatter_performance)).

% @attr reviewer_opinion_snowboardingprofiles_snappy
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (snappy rating)
% @values snappy_6_10=Snappy_6_10 unk_reviewer_opinion_snowboardingprofiles_snappy=Unknown
% @importance 0.95

0.88::acc(s26, reviewer_opinion_snowboardingprofiles_snappy).

0.76::true_val(reviewer_opinion_snowboardingprofiles_snappy, snappy_6_10); 0.24::true_val(reviewer_opinion_snowboardingprofiles_snappy, unk_reviewer_opinion_snowboardingprofiles_snappy).

measured(s26, reviewer_opinion_snowboardingprofiles_snappy, snappy_6_10).

all_consistent(reviewer_opinion_snowboardingprofiles_snappy) :-
    consistent(s26, reviewer_opinion_snowboardingprofiles_snappy).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_snappy)).
query(true_val(reviewer_opinion_snowboardingprofiles_snappy, snappy_6_10)).
query(true_val(reviewer_opinion_snowboardingprofiles_snappy, unk_reviewer_opinion_snowboardingprofiles_snappy)).

% @attr reviewer_opinion_snowboardingprofiles_playful
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (playful rating)
% @values playful_4_10=Playful_4_10_toward_aggressive unk_reviewer_opinion_snowboardingprofiles_playful=Unknown
% @importance 0.95

0.88::acc(s26, reviewer_opinion_snowboardingprofiles_playful).

0.76::true_val(reviewer_opinion_snowboardingprofiles_playful, playful_4_10); 0.24::true_val(reviewer_opinion_snowboardingprofiles_playful, unk_reviewer_opinion_snowboardingprofiles_playful).

measured(s26, reviewer_opinion_snowboardingprofiles_playful, playful_4_10).

all_consistent(reviewer_opinion_snowboardingprofiles_playful) :-
    consistent(s26, reviewer_opinion_snowboardingprofiles_playful).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_playful)).
query(true_val(reviewer_opinion_snowboardingprofiles_playful, playful_4_10)).
query(true_val(reviewer_opinion_snowboardingprofiles_playful, unk_reviewer_opinion_snowboardingprofiles_playful)).