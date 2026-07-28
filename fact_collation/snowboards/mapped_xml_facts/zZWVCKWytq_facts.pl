0.15::indep(s3).
0.15::indep(s4).
0.40::indep(s2).
0.15::indep(s5).
0.15::indep(s19).
0.15::indep(s20).
0.15::indep(s21).
0.30::indep(s16).
0.15::indep(s28).
0.25::indep(s29).
0.15::indep(s30).
0.15::indep(s31).
0.15::indep(s34).
0.20::indep(s40).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values salomon=Salomon unk_brand=Unknown
% @importance 0.95

0.93::acc(s1, brand).
0.80::acc(s2, brand).

0.97::true_val(brand, salomon); 0.03::true_val(brand, unk_brand).

measured(s1, brand, salomon).
measured(s2, brand, salomon).

all_consistent(brand) :-
    consistent(s1, brand),
    (indep(s2), consistent(s2, brand) ; \+indep(s2)).

evidence(all_consistent(brand)).
query(true_val(brand, salomon)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values sleepwalker=Sleepwalker unk_model_name=Unknown
% @importance 0.95

0.95::acc(s1, model_name).
0.82::acc(s2, model_name).

0.97::true_val(model_name, sleepwalker); 0.03::true_val(model_name, unk_model_name).

measured(s1, model_name, sleepwalker).
measured(s2, model_name, sleepwalker).

all_consistent(model_name) :-
    consistent(s1, model_name),
    (indep(s2), consistent(s2, model_name) ; \+indep(s2)).

evidence(all_consistent(model_name)).
query(true_val(model_name, sleepwalker)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2027=2027 unk_model_year=Unknown
% @importance 0.95

0.85::acc(s3, model_year).
0.78::acc(s4, model_year).

0.95::true_val(model_year, y2027); 0.05::true_val(model_year, unk_model_year).

measured(s3, model_year, y2027).
measured(s4, model_year, y2027).

all_consistent(model_year) :-
    consistent(s3, model_year),
    (indep(s4), consistent(s4, model_year) ; \+indep(s4)).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2027)).
query(true_val(model_year, unk_model_year)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.95

0.95::acc(s1, product_type).
0.82::acc(s2, product_type).

0.97::true_val(product_type, snowboard); 0.03::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).
measured(s2, product_type, snowboard).

all_consistent(product_type) :-
    consistent(s1, product_type),
    (indep(s2), consistent(s2, product_type) ; \+indep(s2)).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values freestyle_park_jib=Freestyle_Park_and_Jib freestyle_only=Freestyle
% @importance 0.82

0.93::acc(s1, board_category).
0.80::acc(s5, board_category).
0.82::acc(s3, board_category).

0.55::true_val(board_category, freestyle_park_jib); 0.45::true_val(board_category, freestyle_only).

measured(s1, board_category, freestyle_park_jib).
measured(s5, board_category, freestyle_park_jib).
measured(s3, board_category, freestyle_only).

all_consistent(board_category) :-
    consistent(s1, board_category),
    (indep(s5), consistent(s5, board_category) ; \+indep(s5)),
    (indep(s3), consistent(s3, board_category) ; \+indep(s3)).

evidence(all_consistent(board_category)).
query(true_val(board_category, freestyle_park_jib)).
query(true_val(board_category, freestyle_only)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.725

0.82::acc(s6, gender).
0.82::acc(s7, gender).

0.95::true_val(gender, mens); 0.05::true_val(gender, unk_gender).

measured(s6, gender, mens).
measured(s7, gender, mens).

all_consistent(gender) :-
    consistent(s6, gender),
    consistent(s7, gender).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr manufacturer
% @type categorical
% @canonical false
% @original_name manufacturer
% @values salomon_sas_annecy=Salomon_SAS_Annecy_France unk_manufacturer=Unknown
% @importance 0.6

0.90::acc(s8, manufacturer).

0.81::true_val(manufacturer, salomon_sas_annecy); 0.19::true_val(manufacturer, unk_manufacturer).

measured(s8, manufacturer, salomon_sas_annecy).

all_consistent(manufacturer) :- consistent(s8, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, salomon_sas_annecy)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr founded_year
% @type categorical
% @canonical false
% @original_name Founded
% @values y1947=1947 unk_founded_year=Unknown
% @importance 0.55

0.90::acc(s8, founded_year).
0.93::acc(s9, founded_year).

0.95::true_val(founded_year, y1947); 0.05::true_val(founded_year, unk_founded_year).

measured(s8, founded_year, y1947).
measured(s9, founded_year, y1947).

all_consistent(founded_year) :-
    consistent(s8, founded_year),
    consistent(s9, founded_year).

evidence(all_consistent(founded_year)).
query(true_val(founded_year, y1947)).
query(true_val(founded_year, unk_founded_year)).

% @attr parent_company
% @type categorical
% @canonical false
% @original_name Parent company
% @values amer_sports=Amer_Sports unk_parent_company=Unknown
% @importance 0.45

0.88::acc(s10, parent_company).

0.81::true_val(parent_company, amer_sports); 0.19::true_val(parent_company, unk_parent_company).

measured(s10, parent_company, amer_sports).

all_consistent(parent_company) :- consistent(s10, parent_company).

evidence(all_consistent(parent_company)).
query(true_val(parent_company, amer_sports)).
query(true_val(parent_company, unk_parent_company)).

% @attr first_snowboard_year
% @type categorical
% @canonical false
% @original_name Salomon first snowboard offering
% @values y1997=1997 unk_first_snowboard_year=Unknown
% @importance 0.35

0.82::acc(s11, first_snowboard_year).

0.72::true_val(first_snowboard_year, y1997); 0.28::true_val(first_snowboard_year, unk_first_snowboard_year).

measured(s11, first_snowboard_year, y1997).

all_consistent(first_snowboard_year) :- consistent(s11, first_snowboard_year).

evidence(all_consistent(first_snowboard_year)).
query(true_val(first_snowboard_year, y1997)).
query(true_val(first_snowboard_year, unk_first_snowboard_year)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2017_18=2017_18_season unk_model_first_available_year=Unknown
% @importance 0.7

0.88::acc(s12, model_first_available_year).
0.78::acc(s13, model_first_available_year).
0.78::acc(s14, model_first_available_year).

0.95::true_val(model_first_available_year, season_2017_18); 0.05::true_val(model_first_available_year, unk_model_first_available_year).

measured(s12, model_first_available_year, season_2017_18).
measured(s13, model_first_available_year, season_2017_18).
measured(s14, model_first_available_year, season_2017_18).

all_consistent(model_first_available_year) :-
    consistent(s12, model_first_available_year),
    consistent(s13, model_first_available_year),
    consistent(s14, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2017_18)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values tommy_gesme=Tommy_Gesme unk_pro_rider_name=Unknown
% @importance 0.87

0.93::acc(s1, pro_rider_name).
0.80::acc(s2, pro_rider_name).
0.78::acc(s5, pro_rider_name).

0.95::true_val(pro_rider_name, tommy_gesme); 0.05::true_val(pro_rider_name, unk_pro_rider_name).

measured(s1, pro_rider_name, tommy_gesme).
measured(s2, pro_rider_name, tommy_gesme).
measured(s5, pro_rider_name, tommy_gesme).

all_consistent(pro_rider_name) :-
    consistent(s1, pro_rider_name),
    (indep(s2), consistent(s2, pro_rider_name) ; \+indep(s2)),
    (indep(s5), consistent(s5, pro_rider_name) ; \+indep(s5)).

evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, tommy_gesme)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values two_year_limited=Two_year_limited_warranty unk_warranty=Unknown
% @importance 0.75

0.93::acc(s15, warranty).
0.78::acc(s16, warranty).

0.95::true_val(warranty, two_year_limited); 0.05::true_val(warranty, unk_warranty).

measured(s15, warranty, two_year_limited).
measured(s16, warranty, two_year_limited).

all_consistent(warranty) :-
    consistent(s15, warranty),
    (indep(s16), consistent(s16, warranty) ; \+indep(s16)).

evidence(all_consistent(warranty)).
query(true_val(warranty, two_year_limited)).
query(true_val(warranty, unk_warranty)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values fsc_certified_core_abs=FSC_certified_wood_core_and_ABS_sidewalls unk_sustainability_certification=Unknown
% @importance 0.9

0.82::acc(s4, sustainability_certification).

0.68::true_val(sustainability_certification, fsc_certified_core_abs); 0.32::true_val(sustainability_certification, unk_sustainability_certification).

measured(s4, sustainability_certification, fsc_certified_core_abs).

all_consistent(sustainability_certification) :-
    (indep(s4), consistent(s4, sustainability_certification) ; \+indep(s4)).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, fsc_certified_core_abs)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr redesign_year
% @type categorical
% @canonical true
% @original_name redesign_year
% @values graphics_only=Graphics_update_only unk_redesign_year=Unknown
% @importance 0.8

0.78::acc(s17, redesign_year).

0.68::true_val(redesign_year, graphics_only); 0.32::true_val(redesign_year, unk_redesign_year).

measured(s17, redesign_year, graphics_only).

all_consistent(redesign_year) :-
    (indep(s16), consistent(s17, redesign_year) ; \+indep(s16)).

evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, graphics_only)).
query(true_val(redesign_year, unk_redesign_year)).

% @attr price_aud_merchant
% @type numeric
% @canonical false
% @original_name price_aud_merchant
% @unit AUD
% @values v769_99=769.99 unk_price_aud_merchant=Unknown
% @importance 1.0

0.82::acc(s3, price_aud_merchant).

0.76::true_val(price_aud_merchant, v769_99); 0.24::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s3, price_aud_merchant, v769_99).

all_consistent(price_aud_merchant) :- consistent(s3, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v769_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values available_salomon_direct=Available_salomon_com unk_availability_status=Unknown
% @importance 0.7

0.90::acc(s35, availability_status).

0.86::true_val(availability_status, available_salomon_direct); 0.14::true_val(availability_status, unk_availability_status).

measured(s35, availability_status, available_salomon_direct).

all_consistent(availability_status) :- consistent(s35, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, available_salomon_direct)).
query(true_val(availability_status, unk_availability_status)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v449_95=449.95 v419_95=419.95
% @importance 0.93

0.85::acc(s18, price_usd_msrp).
0.82::acc(s19, price_usd_msrp).
0.82::acc(s20, price_usd_msrp).
0.82::acc(s21, price_usd_msrp).
0.82::acc(s6, price_usd_msrp).

0.70::true_val(price_usd_msrp, v449_95); 0.30::true_val(price_usd_msrp, v419_95).

measured(s18, price_usd_msrp, v449_95).
measured(s19, price_usd_msrp, v449_95).
measured(s20, price_usd_msrp, v449_95).
measured(s21, price_usd_msrp, v449_95).
measured(s6, price_usd_msrp, v419_95).

all_consistent(price_usd_msrp) :-
    consistent(s18, price_usd_msrp),
    (indep(s19), consistent(s19, price_usd_msrp) ; \+indep(s19)),
    (indep(s20), consistent(s20, price_usd_msrp) ; \+indep(s20)),
    (indep(s21), consistent(s21, price_usd_msrp) ; \+indep(s21)),
    consistent(s6, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v449_95)).
query(true_val(price_usd_msrp, v419_95)).

% @attr price_usd_the_house_sale
% @type numeric
% @canonical false
% @original_name Price USD (The House, 2026 model on sale)
% @unit USD
% @values v293_95=293.95 unk_price_usd_the_house_sale=Unknown
% @importance 0.95

0.85::acc(s6, price_usd_the_house_sale).

0.76::true_val(price_usd_the_house_sale, v293_95); 0.24::true_val(price_usd_the_house_sale, unk_price_usd_the_house_sale).

measured(s6, price_usd_the_house_sale, v293_95).

all_consistent(price_usd_the_house_sale) :- consistent(s6, price_usd_the_house_sale).

evidence(all_consistent(price_usd_the_house_sale)).
query(true_val(price_usd_the_house_sale, v293_95)).
query(true_val(price_usd_the_house_sale, unk_price_usd_the_house_sale)).

% @attr price_usd_utahskis_clearance
% @type numeric
% @canonical false
% @original_name Price USD (previous year 2025 model on clearance, UtahSkis)
% @unit USD
% @values v259_97=259.97 unk_price_usd_utahskis_clearance=Unknown
% @importance 0.85

0.78::acc(s22, price_usd_utahskis_clearance).

0.63::true_val(price_usd_utahskis_clearance, v259_97); 0.37::true_val(price_usd_utahskis_clearance, unk_price_usd_utahskis_clearance).

measured(s22, price_usd_utahskis_clearance, v259_97).

all_consistent(price_usd_utahskis_clearance) :- consistent(s22, price_usd_utahskis_clearance).

evidence(all_consistent(price_usd_utahskis_clearance)).
query(true_val(price_usd_utahskis_clearance, v259_97)).
query(true_val(price_usd_utahskis_clearance, unk_price_usd_utahskis_clearance)).

% @attr price_usd_boyne_sale
% @type numeric
% @canonical false
% @original_name Price USD (Boyne Country Sports, 2026 on sale)
% @unit USD
% @values v314_96=314.96 unk_price_usd_boyne_sale=Unknown
% @importance 0.85

0.78::acc(s23, price_usd_boyne_sale).

0.63::true_val(price_usd_boyne_sale, v314_96); 0.37::true_val(price_usd_boyne_sale, unk_price_usd_boyne_sale).

measured(s23, price_usd_boyne_sale, v314_96).

all_consistent(price_usd_boyne_sale) :- consistent(s23, price_usd_boyne_sale).

evidence(all_consistent(price_usd_boyne_sale)).
query(true_val(price_usd_boyne_sale, v314_96)).
query(true_val(price_usd_boyne_sale, unk_price_usd_boyne_sale)).

% @attr price_usd_gearchase_sale
% @type numeric
% @canonical false
% @original_name Price USD (Gearchase, 2026 on sale)
% @unit USD
% @values v359_96=359.96 unk_price_usd_gearchase_sale=Unknown
% @importance 0.85

0.72::acc(s24, price_usd_gearchase_sale).

0.59::true_val(price_usd_gearchase_sale, v359_96); 0.41::true_val(price_usd_gearchase_sale, unk_price_usd_gearchase_sale).

measured(s24, price_usd_gearchase_sale, v359_96).

all_consistent(price_usd_gearchase_sale) :- consistent(s24, price_usd_gearchase_sale).

evidence(all_consistent(price_usd_gearchase_sale)).
query(true_val(price_usd_gearchase_sale, v359_96)).
query(true_val(price_usd_gearchase_sale, unk_price_usd_gearchase_sale)).

% @attr historical_price_2018
% @type categorical
% @canonical false
% @original_name Historical price (2018 launch)
% @values approx_500aud_400cad=Approx_500_AUD_400_CAD unk_historical_price_2018=Unknown
% @importance 0.8

0.70::acc(s25, historical_price_2018).

0.56::true_val(historical_price_2018, approx_500aud_400cad); 0.44::true_val(historical_price_2018, unk_historical_price_2018).

measured(s25, historical_price_2018, approx_500aud_400cad).

all_consistent(historical_price_2018) :- consistent(s25, historical_price_2018).

evidence(all_consistent(historical_price_2018)).
query(true_val(historical_price_2018, approx_500aud_400cad)).
query(true_val(historical_price_2018, unk_historical_price_2018)).

% @attr base_upgrade_note
% @type categorical
% @canonical false
% @original_name Historical base change
% @values sintered_upgrade_2024=Sintered_base_upgrade_around_2024 unk_base_upgrade_note=Unknown
% @importance 0.775

0.60::acc(s26, base_upgrade_note).
0.68::acc(s25, base_upgrade_note).

0.90::true_val(base_upgrade_note, sintered_upgrade_2024); 0.10::true_val(base_upgrade_note, unk_base_upgrade_note).

measured(s26, base_upgrade_note, sintered_upgrade_2024).
measured(s25, base_upgrade_note, sintered_upgrade_2024).

all_consistent(base_upgrade_note) :-
    consistent(s26, base_upgrade_note),
    consistent(s25, base_upgrade_note).

evidence(all_consistent(base_upgrade_note)).
query(true_val(base_upgrade_note, sintered_upgrade_2024)).
query(true_val(base_upgrade_note, unk_base_upgrade_note)).

% @attr availability_status_preorder_melbourne
% @type categorical
% @canonical false
% @original_name availability_status
% @values preorder_may2026=Pre_order_estimated_May_2026 unk_availability_status_preorder_melbourne=Unknown
% @importance 1.0

0.80::acc(s3, availability_status_preorder_melbourne).

0.76::true_val(availability_status_preorder_melbourne, preorder_may2026); 0.24::true_val(availability_status_preorder_melbourne, unk_availability_status_preorder_melbourne).

measured(s3, availability_status_preorder_melbourne, preorder_may2026).

all_consistent(availability_status_preorder_melbourne) :- consistent(s3, availability_status_preorder_melbourne).

evidence(all_consistent(availability_status_preorder_melbourne)).
query(true_val(availability_status_preorder_melbourne, preorder_may2026)).
query(true_val(availability_status_preorder_melbourne, unk_availability_status_preorder_melbourne)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_evo=Available_evo_com unk_availability_status_evo=Unknown
% @importance 0.85

0.85::acc(s27, availability_status_evo).

0.85::true_val(availability_status_evo, available_evo); 0.15::true_val(availability_status_evo, unk_availability_status_evo).

measured(s27, availability_status_evo, available_evo).

all_consistent(availability_status_evo) :- consistent(s27, availability_status_evo).

evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, available_evo)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

% @attr availability_status_the_house
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_the_house=Available_the_house unk_availability_status_the_house=Unknown
% @importance 0.95

0.82::acc(s6, availability_status_the_house).

0.76::true_val(availability_status_the_house, available_the_house); 0.24::true_val(availability_status_the_house, unk_availability_status_the_house).

measured(s6, availability_status_the_house, available_the_house).

all_consistent(availability_status_the_house) :- consistent(s6, availability_status_the_house).

evidence(all_consistent(availability_status_the_house)).
query(true_val(availability_status_the_house, available_the_house)).
query(true_val(availability_status_the_house, unk_availability_status_the_house)).

% @attr availability_status_christy
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_christy=Available_Christy_Sports unk_availability_status_christy=Unknown
% @importance 0.6

0.80::acc(s28, availability_status_christy).

0.68::true_val(availability_status_christy, available_christy); 0.32::true_val(availability_status_christy, unk_availability_status_christy).

measured(s28, availability_status_christy, available_christy).

all_consistent(availability_status_christy) :- consistent(s28, availability_status_christy).

evidence(all_consistent(availability_status_christy)).
query(true_val(availability_status_christy, available_christy)).
query(true_val(availability_status_christy, unk_availability_status_christy)).

% @attr availability_status_getboards
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_getboards=Available_Getboards unk_availability_status_getboards=Unknown
% @importance 0.95

0.78::acc(s19, availability_status_getboards).

0.67::true_val(availability_status_getboards, available_getboards); 0.33::true_val(availability_status_getboards, unk_availability_status_getboards).

measured(s19, availability_status_getboards, available_getboards).

all_consistent(availability_status_getboards) :- consistent(s19, availability_status_getboards).

evidence(all_consistent(availability_status_getboards)).
query(true_val(availability_status_getboards, available_getboards)).
query(true_val(availability_status_getboards, unk_availability_status_getboards)).

% @attr availability_status_willis
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_willis=Available_Willis_Ski_Board unk_availability_status_willis=Unknown
% @importance 0.9

0.78::acc(s21, availability_status_willis).

0.67::true_val(availability_status_willis, available_willis); 0.33::true_val(availability_status_willis, unk_availability_status_willis).

measured(s21, availability_status_willis, available_willis).

all_consistent(availability_status_willis) :- consistent(s21, availability_status_willis).

evidence(all_consistent(availability_status_willis)).
query(true_val(availability_status_willis, available_willis)).
query(true_val(availability_status_willis, unk_availability_status_willis)).

% @attr availability_status_aspen
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_aspen=Available_Aspen_Ski_Board unk_availability_status_aspen=Unknown
% @importance 0.9

0.78::acc(s20, availability_status_aspen).

0.67::true_val(availability_status_aspen, available_aspen); 0.33::true_val(availability_status_aspen, unk_availability_status_aspen).

measured(s20, availability_status_aspen, available_aspen).

all_consistent(availability_status_aspen) :- consistent(s20, availability_status_aspen).

evidence(all_consistent(availability_status_aspen)).
query(true_val(availability_status_aspen, available_aspen)).
query(true_val(availability_status_aspen, unk_availability_status_aspen)).

% @attr availability_status_eriks
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_eriks=Available_ERIKS unk_availability_status_eriks=Unknown
% @importance 0.7

0.78::acc(s29, availability_status_eriks).

0.66::true_val(availability_status_eriks, available_eriks); 0.34::true_val(availability_status_eriks, unk_availability_status_eriks).

measured(s29, availability_status_eriks, available_eriks).

all_consistent(availability_status_eriks) :- consistent(s29, availability_status_eriks).

evidence(all_consistent(availability_status_eriks)).
query(true_val(availability_status_eriks, available_eriks)).
query(true_val(availability_status_eriks, unk_availability_status_eriks)).

% @attr availability_status_boyne
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_boyne=Available_Boyne_Country_Sports unk_availability_status_boyne=Unknown
% @importance 0.85

0.78::acc(s23, availability_status_boyne).

0.63::true_val(availability_status_boyne, available_boyne); 0.37::true_val(availability_status_boyne, unk_availability_status_boyne).

measured(s23, availability_status_boyne, available_boyne).

all_consistent(availability_status_boyne) :- consistent(s23, availability_status_boyne).

evidence(all_consistent(availability_status_boyne)).
query(true_val(availability_status_boyne, available_boyne)).
query(true_val(availability_status_boyne, unk_availability_status_boyne)).

% @attr availability_status_gorge
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_gorge=Available_Gorge_Performance unk_availability_status_gorge=Unknown
% @importance 0.5

0.72::acc(s30, availability_status_gorge).

0.52::true_val(availability_status_gorge, available_gorge); 0.48::true_val(availability_status_gorge, unk_availability_status_gorge).

measured(s30, availability_status_gorge, available_gorge).

all_consistent(availability_status_gorge) :- consistent(s30, availability_status_gorge).

evidence(all_consistent(availability_status_gorge)).
query(true_val(availability_status_gorge, available_gorge)).
query(true_val(availability_status_gorge, unk_availability_status_gorge)).

% @attr availability_status_pelican
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_pelican=Available_Pelican_Outdoor unk_availability_status_pelican=Unknown
% @importance 0.8

0.72::acc(s31, availability_status_pelican).

0.62::true_val(availability_status_pelican, available_pelican); 0.38::true_val(availability_status_pelican, unk_availability_status_pelican).

measured(s31, availability_status_pelican, available_pelican).

all_consistent(availability_status_pelican) :- consistent(s31, availability_status_pelican).

evidence(all_consistent(availability_status_pelican)).
query(true_val(availability_status_pelican, available_pelican)).
query(true_val(availability_status_pelican, unk_availability_status_pelican)).

% @attr availability_status_gear_west
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_gear_west=Available_Gear_West unk_availability_status_gear_west=Unknown
% @importance 0.5

0.75::acc(s32, availability_status_gear_west).

0.56::true_val(availability_status_gear_west, available_gear_west); 0.44::true_val(availability_status_gear_west, unk_availability_status_gear_west).

measured(s32, availability_status_gear_west, available_gear_west).

all_consistent(availability_status_gear_west) :- consistent(s32, availability_status_gear_west).

evidence(all_consistent(availability_status_gear_west)).
query(true_val(availability_status_gear_west, available_gear_west)).
query(true_val(availability_status_gear_west, unk_availability_status_gear_west)).

% @attr availability_status_ebay
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_ebay=Available_eBay_third_party unk_availability_status_ebay=Unknown
% @importance 0.4

0.55::acc(s33, availability_status_ebay).

0.35::true_val(availability_status_ebay, available_ebay); 0.65::true_val(availability_status_ebay, unk_availability_status_ebay).

measured(s33, availability_status_ebay, available_ebay).

all_consistent(availability_status_ebay) :- consistent(s33, availability_status_ebay).

evidence(all_consistent(availability_status_ebay)).
query(true_val(availability_status_ebay, available_ebay)).
query(true_val(availability_status_ebay, unk_availability_status_ebay)).

% @attr availability_status_rude_boys
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_rude_boys=Available_Rude_Boys_Banff unk_availability_status_rude_boys=Unknown
% @importance 0.4

0.68::acc(s34, availability_status_rude_boys).

0.49::true_val(availability_status_rude_boys, available_rude_boys); 0.51::true_val(availability_status_rude_boys, unk_availability_status_rude_boys).

measured(s34, availability_status_rude_boys, available_rude_boys).

all_consistent(availability_status_rude_boys) :- consistent(s34, availability_status_rude_boys).

evidence(all_consistent(availability_status_rude_boys)).
query(true_val(availability_status_rude_boys, available_rude_boys)).
query(true_val(availability_status_rude_boys, unk_availability_status_rude_boys)).

% @attr availability_status_melbourne
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_melbourne=Available_Melbourne_Snowboard_Centre unk_availability_status_melbourne=Unknown
% @importance 1.0

0.80::acc(s3, availability_status_melbourne).

0.76::true_val(availability_status_melbourne, available_melbourne); 0.24::true_val(availability_status_melbourne, unk_availability_status_melbourne).

measured(s3, availability_status_melbourne, available_melbourne).

all_consistent(availability_status_melbourne) :- consistent(s3, availability_status_melbourne).

evidence(all_consistent(availability_status_melbourne)).
query(true_val(availability_status_melbourne, available_melbourne)).
query(true_val(availability_status_melbourne, unk_availability_status_melbourne)).

% @attr availability_status_auski
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_auski=Available_Auski_Australia unk_availability_status_auski=Unknown
% @importance 0.9

0.75::acc(s4, availability_status_auski).

0.68::true_val(availability_status_auski, available_auski); 0.32::true_val(availability_status_auski, unk_availability_status_auski).

measured(s4, availability_status_auski, available_auski).

all_consistent(availability_status_auski) :- consistent(s4, availability_status_auski).

evidence(all_consistent(availability_status_auski)).
query(true_val(availability_status_auski, available_auski)).
query(true_val(availability_status_auski, unk_availability_status_auski)).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_blauer=Available_Blauer_Board_Shop unk_availability_status_blauer=Unknown
% @importance 0.8

0.78::acc(s17, availability_status_blauer).

0.59::true_val(availability_status_blauer, available_blauer); 0.41::true_val(availability_status_blauer, unk_availability_status_blauer).

measured(s17, availability_status_blauer, available_blauer).

all_consistent(availability_status_blauer) :- consistent(s17, availability_status_blauer).

evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, available_blauer)).
query(true_val(availability_status_blauer, unk_availability_status_blauer)).

% @attr salomon_brand_reputation
% @type categorical
% @canonical false
% @original_name Salomon brand reputation
% @values leading_global_brand=Leading_global_outdoor_sports_brand unk_salomon_brand_reputation=Unknown
% @importance 0.55

0.88::acc(s8, salomon_brand_reputation).
0.93::acc(s9, salomon_brand_reputation).

0.95::true_val(salomon_brand_reputation, leading_global_brand); 0.05::true_val(salomon_brand_reputation, unk_salomon_brand_reputation).

measured(s8, salomon_brand_reputation, leading_global_brand).
measured(s9, salomon_brand_reputation, leading_global_brand).

all_consistent(salomon_brand_reputation) :-
    consistent(s8, salomon_brand_reputation),
    consistent(s9, salomon_brand_reputation).

evidence(all_consistent(salomon_brand_reputation)).
query(true_val(salomon_brand_reputation, leading_global_brand)).
query(true_val(salomon_brand_reputation, unk_salomon_brand_reputation)).

% @attr review_rating_the_house
% @type numeric
% @canonical false
% @original_name Review rating (The House)
% @unit out_of_5
% @values v3_4=3.4 unk_review_rating_the_house=Unknown
% @importance 0.95

0.82::acc(s6, review_rating_the_house).

0.76::true_val(review_rating_the_house, v3_4); 0.24::true_val(review_rating_the_house, unk_review_rating_the_house).

measured(s6, review_rating_the_house, v3_4).

all_consistent(review_rating_the_house) :- consistent(s6, review_rating_the_house).

evidence(all_consistent(review_rating_the_house)).
query(true_val(review_rating_the_house, v3_4)).
query(true_val(review_rating_the_house, unk_review_rating_the_house)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values seven_sizes=148_151_153_155_158_155W_158W unk_available_sizes=Unknown
% @importance 0.975

0.82::acc(s3, available_sizes).
0.82::acc(s6, available_sizes).

0.95::true_val(available_sizes, seven_sizes); 0.05::true_val(available_sizes, unk_available_sizes).

measured(s3, available_sizes, seven_sizes).
measured(s6, available_sizes, seven_sizes).

all_consistent(available_sizes) :-
    (indep(s3), consistent(s3, available_sizes) ; \+indep(s3)),
    consistent(s6, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, seven_sizes)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values true_twin=True_Twin unk_shape=Unknown
% @importance 0.975

0.90::acc(s3, shape).
0.88::acc(s36, shape).

0.95::true_val(shape, true_twin); 0.05::true_val(shape, unk_shape).

measured(s3, shape, true_twin).
measured(s36, shape, true_twin).

all_consistent(shape) :-
    (indep(s3), consistent(s3, shape) ; \+indep(s3)),
    (indep(s2), consistent(s36, shape) ; \+indep(s2)).

evidence(all_consistent(shape)).
query(true_val(shape, true_twin)).
query(true_val(shape, unk_shape)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values rock_out_camber=Rock_Out_Camber unk_camber_type=Unknown
% @importance 0.975

0.90::acc(s3, camber_type).
0.88::acc(s36, camber_type).

0.95::true_val(camber_type, rock_out_camber); 0.05::true_val(camber_type, unk_camber_type).

measured(s3, camber_type, rock_out_camber).
measured(s36, camber_type, rock_out_camber).

all_consistent(camber_type) :-
    (indep(s3), consistent(s3, camber_type) ; \+indep(s3)),
    (indep(s2), consistent(s36, camber_type) ; \+indep(s2)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, rock_out_camber)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values flat_camber_rocker=Flat_between_bindings_camber_feet_rocker_tip_tail unk_camber_description=Unknown
% @importance 0.95

0.88::acc(s3, camber_description).
0.88::acc(s36, camber_description).
0.93::acc(s37, camber_description).

0.95::true_val(camber_description, flat_camber_rocker); 0.05::true_val(camber_description, unk_camber_description).

measured(s3, camber_description, flat_camber_rocker).
measured(s36, camber_description, flat_camber_rocker).
measured(s37, camber_description, flat_camber_rocker).

all_consistent(camber_description) :-
    (indep(s3), consistent(s3, camber_description) ; \+indep(s3)),
    (indep(s2), consistent(s36, camber_description) ; \+indep(s2)),
    consistent(s37, camber_description).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, flat_camber_rocker)).
query(true_val(camber_description, unk_camber_description)).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values eq_rad=EQ_Rad_Sidecut quadratic=Quadratic_Sidecut
% @importance 0.8

0.90::acc(s3, sidecut_type).
0.88::acc(s36, sidecut_type).
0.60::acc(s38, sidecut_type).

0.75::true_val(sidecut_type, eq_rad); 0.25::true_val(sidecut_type, quadratic).

measured(s3, sidecut_type, eq_rad).
measured(s36, sidecut_type, eq_rad).
measured(s38, sidecut_type, quadratic).

all_consistent(sidecut_type) :-
    (indep(s3), consistent(s3, sidecut_type) ; \+indep(s3)),
    (indep(s2), consistent(s36, sidecut_type) ; \+indep(s2)),
    (indep(s34), consistent(s38, sidecut_type) ; \+indep(s34)).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, eq_rad)).
query(true_val(sidecut_type, quadratic)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @original_name flex_rating_10
% @unit per_10
% @values v3=3.0 v4=4.0
% @importance 0.85

0.82::acc(s3, flex_rating_10).
0.78::acc(s17, flex_rating_10).
0.80::acc(s29, flex_rating_10).

0.55::true_val(flex_rating_10, v3); 0.45::true_val(flex_rating_10, v4).

measured(s3, flex_rating_10, v3).
measured(s17, flex_rating_10, v4).
measured(s29, flex_rating_10, v3).

all_consistent(flex_rating_10) :-
    (indep(s3), consistent(s3, flex_rating_10) ; \+indep(s3)),
    (indep(s16), consistent(s17, flex_rating_10) ; \+indep(s16)),
    (indep(s29), consistent(s29, flex_rating_10) ; \+indep(s29)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v3)).
query(true_val(flex_rating_10, v4)).

% @attr flex_rating_5
% @type numeric
% @canonical true
% @original_name flex_rating_5
% @unit per_5
% @values v2=2.0 unk_flex_rating_5=Unknown
% @importance 0.725

0.78::acc(s17, flex_rating_5).
0.68::acc(s40, flex_rating_5).

0.90::true_val(flex_rating_5, v2); 0.10::true_val(flex_rating_5, unk_flex_rating_5).

measured(s17, flex_rating_5, v2).
measured(s40, flex_rating_5, v2).

all_consistent(flex_rating_5) :-
    (indep(s16), consistent(s17, flex_rating_5) ; \+indep(s16)),
    (indep(s40), consistent(s40, flex_rating_5) ; \+indep(s40)).

evidence(all_consistent(flex_rating_5)).
query(true_val(flex_rating_5, v2)).
query(true_val(flex_rating_5, unk_flex_rating_5)).

% @attr flex_rating_10_evo
% @type categorical
% @canonical true
% @original_name flex_rating_10_evo
% @values medium=Medium soft=Soft
% @importance 0.8

0.83::acc(s27, flex_rating_10_evo).
0.80::acc(s39, flex_rating_10_evo).

0.55::true_val(flex_rating_10_evo, medium); 0.45::true_val(flex_rating_10_evo, soft).

measured(s27, flex_rating_10_evo, medium).
measured(s39, flex_rating_10_evo, soft).

all_consistent(flex_rating_10_evo) :-
    consistent(s27, flex_rating_10_evo),
    consistent(s39, flex_rating_10_evo).

evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, medium)).
query(true_val(flex_rating_10_evo, soft)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_inserts unk_mounting_pattern=Unknown
% @importance 0.87

0.88::acc(s3, mounting_pattern).
0.72::acc(s31, mounting_pattern).
0.78::acc(s17, mounting_pattern).

0.95::true_val(mounting_pattern, inserts_2x4); 0.05::true_val(mounting_pattern, unk_mounting_pattern).

measured(s3, mounting_pattern, inserts_2x4).
measured(s31, mounting_pattern, inserts_2x4).
measured(s17, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :-
    (indep(s3), consistent(s3, mounting_pattern) ; \+indep(s3)),
    (indep(s31), consistent(s31, mounting_pattern) ; \+indep(s31)),
    (indep(s16), consistent(s17, mounting_pattern) ; \+indep(s16)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr width_options
% @type categorical
% @canonical true
% @original_name width_options
% @values standard_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 0.975

0.85::acc(s3, width_options).
0.82::acc(s6, width_options).

0.95::true_val(width_options, standard_wide); 0.05::true_val(width_options, unk_width_options).

measured(s3, width_options, standard_wide).
measured(s6, width_options, standard_wide).

all_consistent(width_options) :-
    (indep(s3), consistent(s3, width_options) ; \+indep(s3)),
    consistent(s6, width_options).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_wide)).
query(true_val(width_options, unk_width_options)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values beginner_intermediate=Beginner_Intermediate intermediate_advanced=Intermediate_Advanced
% @importance 0.88

0.72::acc(s3, rider_level).
0.83::acc(s27, rider_level).
0.78::acc(s4, rider_level).

0.30::true_val(rider_level, beginner_intermediate); 0.70::true_val(rider_level, intermediate_advanced).

measured(s3, rider_level, beginner_intermediate).
measured(s27, rider_level, intermediate_advanced).
measured(s4, rider_level, intermediate_advanced).

all_consistent(rider_level) :-
    (indep(s3), consistent(s3, rider_level) ; \+indep(s3)),
    consistent(s27, rider_level),
    (indep(s4), consistent(s4, rider_level) ; \+indep(s4)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, beginner_intermediate)).
query(true_val(rider_level, intermediate_advanced)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values int_adv=Intermediate_Advanced int_adv_freestyle=Intermediate_to_advanced_freestyle beg_int_adv=Beginner_Intermediate_Advanced
% @importance 0.87

0.83::acc(s27, skill_level_recommendation).
0.78::acc(s4, skill_level_recommendation).
0.75::acc(s6, skill_level_recommendation).

0.45::true_val(skill_level_recommendation, int_adv); 0.35::true_val(skill_level_recommendation, int_adv_freestyle); 0.20::true_val(skill_level_recommendation, beg_int_adv).

measured(s27, skill_level_recommendation, int_adv).
measured(s4, skill_level_recommendation, int_adv_freestyle).
measured(s6, skill_level_recommendation, beg_int_adv).

all_consistent(skill_level_recommendation) :-
    consistent(s27, skill_level_recommendation),
    (indep(s4), consistent(s4, skill_level_recommendation) ; \+indep(s4)),
    consistent(s6, skill_level_recommendation).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, int_adv)).
query(true_val(skill_level_recommendation, int_adv_freestyle)).
query(true_val(skill_level_recommendation, beg_int_adv)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values aspen_strong=Aspen_Strong_Core unk_core_material=Unknown
% @importance 0.95

0.88::acc(s3, core_material).
0.88::acc(s36, core_material).

0.95::true_val(core_material, aspen_strong); 0.05::true_val(core_material, unk_core_material).

measured(s3, core_material, aspen_strong).
measured(s36, core_material, aspen_strong).

all_consistent(core_material) :-
    (indep(s3), consistent(s3, core_material) ; \+indep(s3)),
    (indep(s2), consistent(s36, core_material) ; \+indep(s2)).

evidence(all_consistent(core_material)).
query(true_val(core_material, aspen_strong)).
query(true_val(core_material, unk_core_material)).

% @attr sustainability_certification_fsc
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values fsc_certified=FSC_certified unk_sustainability_certification_fsc=Unknown
% @importance 0.85

0.78::acc(s4, sustainability_certification_fsc).
0.68::acc(s25, sustainability_certification_fsc).

0.90::true_val(sustainability_certification_fsc, fsc_certified); 0.10::true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc).

measured(s4, sustainability_certification_fsc, fsc_certified).
measured(s25, sustainability_certification_fsc, fsc_certified).

all_consistent(sustainability_certification_fsc) :-
    (indep(s4), consistent(s4, sustainability_certification_fsc) ; \+indep(s4)),
    consistent(s25, sustainability_certification_fsc).

evidence(all_consistent(sustainability_certification_fsc)).
query(true_val(sustainability_certification_fsc, fsc_certified)).
query(true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values popster=Popster_milled_core_for_pop unk_construction_material_innovation=Unknown
% @importance 0.8

0.88::acc(s3, construction_material_innovation).
0.88::acc(s36, construction_material_innovation).
0.93::acc(s41, construction_material_innovation).
0.68::acc(s42, construction_material_innovation).

0.95::true_val(construction_material_innovation, popster); 0.05::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s3, construction_material_innovation, popster).
measured(s36, construction_material_innovation, popster).
measured(s41, construction_material_innovation, popster).
measured(s42, construction_material_innovation, popster).

all_consistent(construction_material_innovation) :-
    (indep(s3), consistent(s3, construction_material_innovation) ; \+indep(s3)),
    (indep(s2), consistent(s36, construction_material_innovation) ; \+indep(s2)),
    consistent(s41, construction_material_innovation),
    (indep(s34), consistent(s42, construction_material_innovation) ; \+indep(s34)).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, popster)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values ba_md_fiberglass=BA_MD_Biaxial_Medium_Density_Fiberglass unk_laminate=Unknown
% @importance 0.72

0.88::acc(s3, laminate).
0.82::acc(s44, laminate).
0.72::acc(s45, laminate).

0.95::true_val(laminate, ba_md_fiberglass); 0.05::true_val(laminate, unk_laminate).

measured(s3, laminate, ba_md_fiberglass).
measured(s44, laminate, ba_md_fiberglass).
measured(s45, laminate, ba_md_fiberglass).

all_consistent(laminate) :-
    (indep(s3), consistent(s3, laminate) ; \+indep(s3)),
    (indep(s28), consistent(s44, laminate) ; \+indep(s28)),
    (indep(s4), consistent(s45, laminate) ; \+indep(s4)).

evidence(all_consistent(laminate)).
query(true_val(laminate, ba_md_fiberglass)).
query(true_val(laminate, unk_laminate)).

% @attr resin
% @type categorical
% @canonical false
% @original_name resin
% @values bio_based_30pct=30_percent_Bio_Based_Resin unk_resin=Unknown
% @importance 0.9

0.88::acc(s3, resin).
0.72::acc(s31, resin).

0.90::true_val(resin, bio_based_30pct); 0.10::true_val(resin, unk_resin).

measured(s3, resin, bio_based_30pct).
measured(s31, resin, bio_based_30pct).

all_consistent(resin) :-
    (indep(s3), consistent(s3, resin) ; \+indep(s3)),
    (indep(s31), consistent(s31, resin) ; \+indep(s31)).

evidence(all_consistent(resin)).
query(true_val(resin, bio_based_30pct)).
query(true_val(resin, unk_resin)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values abs_sidewalls=ABS_Sidewalls unk_sidewall_material=Unknown
% @importance 0.7

0.75::acc(s42, sidewall_material).

0.59::true_val(sidewall_material, abs_sidewalls); 0.41::true_val(sidewall_material, unk_sidewall_material).

measured(s42, sidewall_material, abs_sidewalls).

all_consistent(sidewall_material) :-
    (indep(s34), consistent(s42, sidewall_material) ; \+indep(s34)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, abs_sidewalls)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr construction_material_innovation_rubber
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values royal_rubber_pads=Royal_Rubber_Pads_2mm unk_construction_material_innovation_rubber=Unknown
% @importance 0.72

0.88::acc(s3, construction_material_innovation_rubber).
0.88::acc(s36, construction_material_innovation_rubber).
0.75::acc(s42, construction_material_innovation_rubber).
0.68::acc(s40, construction_material_innovation_rubber).
0.92::acc(s46, construction_material_innovation_rubber).

0.95::true_val(construction_material_innovation_rubber, royal_rubber_pads); 0.05::true_val(construction_material_innovation_rubber, unk_construction_material_innovation_rubber).

measured(s3, construction_material_innovation_rubber, royal_rubber_pads).
measured(s36, construction_material_innovation_rubber, royal_rubber_pads).
measured(s42, construction_material_innovation_rubber, royal_rubber_pads).
measured(s40, construction_material_innovation_rubber, royal_rubber_pads).
measured(s46, construction_material_innovation_rubber, royal_rubber_pads).

all_consistent(construction_material_innovation_rubber) :-
    (indep(s3), consistent(s3, construction_material_innovation_rubber) ; \+indep(s3)),
    (indep(s2), consistent(s36, construction_material_innovation_rubber) ; \+indep(s2)),
    (indep(s34), consistent(s42, construction_material_innovation_rubber) ; \+indep(s34)),
    (indep(s40), consistent(s40, construction_material_innovation_rubber) ; \+indep(s40)),
    consistent(s46, construction_material_innovation_rubber).

evidence(all_consistent(construction_material_innovation_rubber)).
query(true_val(construction_material_innovation_rubber, royal_rubber_pads)).
query(true_val(construction_material_innovation_rubber, unk_construction_material_innovation_rubber)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered=Sintered_base unk_base_material=Unknown
% @importance 0.95

0.88::acc(s3, base_material).
0.88::acc(s36, base_material).

0.95::true_val(base_material, sintered); 0.05::true_val(base_material, unk_base_material).

measured(s3, base_material, sintered).
measured(s36, base_material, sintered).

all_consistent(base_material) :-
    (indep(s3), consistent(s3, base_material) ; \+indep(s3)),
    (indep(s2), consistent(s36, base_material) ; \+indep(s2)).

evidence(all_consistent(base_material)).
query(true_val(base_material, sintered)).
query(true_val(base_material, unk_base_material)).

% @attr base_type
% @type categorical
% @canonical false
% @original_name base_type
% @values moderate_speed_wax=Moderate_speed_good_wax_retention unk_base_type=Unknown
% @importance 0.675

0.75::acc(s42, base_type).
0.82::acc(s47, base_type).

0.90::true_val(base_type, moderate_speed_wax); 0.10::true_val(base_type, unk_base_type).

measured(s42, base_type, moderate_speed_wax).
measured(s47, base_type, moderate_speed_wax).

all_consistent(base_type) :-
    (indep(s34), consistent(s42, base_type) ; \+indep(s34)),
    consistent(s47, base_type).

evidence(all_consistent(base_type)).
query(true_val(base_type, moderate_speed_wax)).
query(true_val(base_type, unk_base_type)).

% @attr base_material_finish
% @type categorical
% @canonical false
% @original_name base_material
% @values medium_stone_finish=Medium_Stone_Finish unk_base_material_finish=Unknown
% @importance 0.87

0.88::acc(s3, base_material_finish).
0.75::acc(s42, base_material_finish).
0.82::acc(s47, base_material_finish).

0.95::true_val(base_material_finish, medium_stone_finish); 0.05::true_val(base_material_finish, unk_base_material_finish).

measured(s3, base_material_finish, medium_stone_finish).
measured(s42, base_material_finish, medium_stone_finish).
measured(s47, base_material_finish, medium_stone_finish).

all_consistent(base_material_finish) :-
    (indep(s3), consistent(s3, base_material_finish) ; \+indep(s3)),
    (indep(s34), consistent(s42, base_material_finish) ; \+indep(s34)),
    consistent(s47, base_material_finish).

evidence(all_consistent(base_material_finish)).
query(true_val(base_material_finish, medium_stone_finish)).
query(true_val(base_material_finish, unk_base_material_finish)).

% @attr factory_wax
% @type categorical
% @canonical false
% @original_name Factory wax
% @values natural_wax=Natural_Wax unk_factory_wax=Unknown
% @importance 0.9

0.85::acc(s3, factory_wax).
0.72::acc(s31, factory_wax).

0.90::true_val(factory_wax, natural_wax); 0.10::true_val(factory_wax, unk_factory_wax).

measured(s3, factory_wax, natural_wax).
measured(s31, factory_wax, natural_wax).

all_consistent(factory_wax) :-
    (indep(s3), consistent(s3, factory_wax) ; \+indep(s3)),
    (indep(s31), consistent(s31, factory_wax) ; \+indep(s31)).

evidence(all_consistent(factory_wax)).
query(true_val(factory_wax, natural_wax)).
query(true_val(factory_wax, unk_factory_wax)).

% @attr edge_bevel_spec
% @type categorical
% @canonical true
% @original_name edge_bevel_spec
% @values bevel_1_5deg=1_5_degree_base_edge freestyle_bevel_2_3deg=Freestyle_bevel_2deg_sidecut_3deg_between_feet
% @importance 0.65

0.78::acc(s3, edge_bevel_spec).
0.82::acc(s47, edge_bevel_spec).
0.72::acc(s48, edge_bevel_spec).

0.35::true_val(edge_bevel_spec, bevel_1_5deg); 0.65::true_val(edge_bevel_spec, freestyle_bevel_2_3deg).

measured(s3, edge_bevel_spec, bevel_1_5deg).
measured(s47, edge_bevel_spec, freestyle_bevel_2_3deg).
measured(s48, edge_bevel_spec, freestyle_bevel_2_3deg).

all_consistent(edge_bevel_spec) :-
    (indep(s3), consistent(s3, edge_bevel_spec) ; \+indep(s3)),
    consistent(s47, edge_bevel_spec),
    consistent(s48, edge_bevel_spec).

evidence(all_consistent(edge_bevel_spec)).
query(true_val(edge_bevel_spec, bevel_1_5deg)).
query(true_val(edge_bevel_spec, freestyle_bevel_2_3deg)).

% @attr effective_edge_148
% @type numeric
% @canonical false
% @original_name Effective edge 148cm
% @unit cm
% @values v114_0=114.0 unk_effective_edge_148=Unknown
% @importance 1.0

0.85::acc(s3, effective_edge_148).

0.76::true_val(effective_edge_148, v114_0); 0.24::true_val(effective_edge_148, unk_effective_edge_148).

measured(s3, effective_edge_148, v114_0).

all_consistent(effective_edge_148) :- consistent(s3, effective_edge_148).

evidence(all_consistent(effective_edge_148)).
query(true_val(effective_edge_148, v114_0)).
query(true_val(effective_edge_148, unk_effective_edge_148)).

% @attr tip_tail_width_size_148
% @type numeric
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v28_7=28.7 unk_tip_tail_width_size_148=Unknown
% @importance 1.0

0.85::acc(s3, tip_tail_width_size_148).

0.76::true_val(tip_tail_width_size_148, v28_7); 0.24::true_val(tip_tail_width_size_148, unk_tip_tail_width_size_148).

measured(s3, tip_tail_width_size_148, v28_7).

all_consistent(tip_tail_width_size_148) :- consistent(s3, tip_tail_width_size_148).

evidence(all_consistent(tip_tail_width_size_148)).
query(true_val(tip_tail_width_size_148, v28_7)).
query(true_val(tip_tail_width_size_148, unk_tip_tail_width_size_148)).

% @attr waist_width_148
% @type numeric
% @canonical false
% @original_name Waist width 148cm
% @unit cm
% @values v24_2=24.2 unk_waist_width_148=Unknown
% @importance 1.0

0.85::acc(s3, waist_width_148).

0.76::true_val(waist_width_148, v24_2); 0.24::true_val(waist_width_148, unk_waist_width_148).

measured(s3, waist_width_148, v24_2).

all_consistent(waist_width_148) :- consistent(s3, waist_width_148).

evidence(all_consistent(waist_width_148)).
query(true_val(waist_width_148, v24_2)).
query(true_val(waist_width_148, unk_waist_width_148)).

% @attr sidecut_radius_size_148
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v7_4=7.4 unk_sidecut_radius_size_148=Unknown
% @importance 1.0

0.85::acc(s3, sidecut_radius_size_148).

0.76::true_val(sidecut_radius_size_148, v7_4); 0.24::true_val(sidecut_radius_size_148, unk_sidecut_radius_size_148).

measured(s3, sidecut_radius_size_148, v7_4).

all_consistent(sidecut_radius_size_148) :- consistent(s3, sidecut_radius_size_148).

evidence(all_consistent(sidecut_radius_size_148)).
query(true_val(sidecut_radius_size_148, v7_4)).
query(true_val(sidecut_radius_size_148, unk_sidecut_radius_size_148)).

% @attr stance_width_range_size_148
% @type numeric
% @canonical false
% @original_name stance_width_range_size
% @unit cm
% @values v53_0=53.0 unk_stance_width_range_size_148=Unknown
% @importance 1.0

0.85::acc(s3, stance_width_range_size_148).

0.76::true_val(stance_width_range_size_148, v53_0); 0.24::true_val(stance_width_range_size_148, unk_stance_width_range_size_148).

measured(s3, stance_width_range_size_148, v53_0).

all_consistent(stance_width_range_size_148) :- consistent(s3, stance_width_range_size_148).

evidence(all_consistent(stance_width_range_size_148)).
query(true_val(stance_width_range_size_148, v53_0)).
query(true_val(stance_width_range_size_148, unk_stance_width_range_size_148)).

% @attr recommended_weight_range_size_148
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @unit kg
% @values w45_65=45_65kg unk_recommended_weight_range_size_148=Unknown
% @importance 1.0

0.85::acc(s3, recommended_weight_range_size_148).

0.76::true_val(recommended_weight_range_size_148, w45_65); 0.24::true_val(recommended_weight_range_size_148, unk_recommended_weight_range_size_148).

measured(s3, recommended_weight_range_size_148, w45_65).

all_consistent(recommended_weight_range_size_148) :- consistent(s3, recommended_weight_range_size_148).

evidence(all_consistent(recommended_weight_range_size_148)).
query(true_val(recommended_weight_range_size_148, w45_65)).
query(true_val(recommended_weight_range_size_148, unk_recommended_weight_range_size_148)).

% @attr effective_edge_151
% @type numeric
% @canonical false
% @original_name Effective edge 151cm
% @unit cm
% @values v117_0=117.0 unk_effective_edge_151=Unknown
% @importance 1.0

0.85::acc(s3, effective_edge_151).

0.76::true_val(effective_edge_151, v117_0); 0.24::true_val(effective_edge_151, unk_effective_edge_151).

measured(s3, effective_edge_151, v117_0).

all_consistent(effective_edge_151) :- consistent(s3, effective_edge_151).

evidence(all_consistent(effective_edge_151)).
query(true_val(effective_edge_151, v117_0)).
query(true_val(effective_edge_151, unk_effective_edge_151)).

% @attr tip_tail_width_size_151
% @type numeric
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v29_2=29.2 unk_tip_tail_width_size_151=Unknown
% @importance 1.0

0.85::acc(s3, tip_tail_width_size_151).

0.76::true_val(tip_tail_width_size_151, v29_2); 0.24::true_val(tip_tail_width_size_151, unk_tip_tail_width_size_151).

measured(s3, tip_tail_width_size_151, v29_2).

all_consistent(tip_tail_width_size_151) :- consistent(s3, tip_tail_width_size_151).

evidence(all_consistent(tip_tail_width_size_151)).
query(true_val(tip_tail_width_size_151, v29_2)).
query(true_val(tip_tail_width_size_151, unk_tip_tail_width_size_151)).

% @attr waist_width_151
% @type numeric
% @canonical false
% @original_name Waist width 151cm
% @unit cm
% @values v24_7=24.7 unk_waist_width_151=Unknown
% @importance 1.0

0.85::acc(s3, waist_width_151).

0.76::true_val(waist_width_151, v24_7); 0.24::true_val(waist_width_151, unk_waist_width_151).

measured(s3, waist_width_151, v24_7).

all_consistent(waist_width_151) :- consistent(s3, waist_width_151).

evidence(all_consistent(waist_width_151)).
query(true_val(waist_width_151, v24_7)).
query(true_val(waist_width_151, unk_waist_width_151)).

% @attr sidecut_radius_size_151
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v7_6=7.6 unk_sidecut_radius_size_151=Unknown
% @importance 1.0

0.85::acc(s3, sidecut_radius_size_151).

0.76::true_val(sidecut_radius_size_151, v7_6); 0.24::true_val(sidecut_radius_size_151, unk_sidecut_radius_size_151).

measured(s3, sidecut_radius_size_151, v7_6).

all_consistent(sidecut_radius_size_151) :- consistent(s3, sidecut_radius_size_151).

evidence(all_consistent(sidecut_radius_size_151)).
query(true_val(sidecut_radius_size_151, v7_6)).
query(true_val(sidecut_radius_size_151, unk_sidecut_radius_size_151)).

% @attr stance_width_range_size_151
% @type numeric
% @canonical false
% @original_name stance_width_range_size
% @unit cm
% @values v54_0=54.0 unk_stance_width_range_size_151=Unknown
% @importance 1.0

0.85::acc(s3, stance_width_range_size_151).

0.76::true_val(stance_width_range_size_151, v54_0); 0.24::true_val(stance_width_range_size_151, unk_stance_width_range_size_151).

measured(s3, stance_width_range_size_151, v54_0).

all_consistent(stance_width_range_size_151) :- consistent(s3, stance_width_range_size_151).

evidence(all_consistent(stance_width_range_size_151)).
query(true_val(stance_width_range_size_151, v54_0)).
query(true_val(stance_width_range_size_151, unk_stance_width_range_size_151)).

% @attr recommended_weight_range_size_151
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @unit kg
% @values w50_70=50_70kg unk_recommended_weight_range_size_151=Unknown
% @importance 1.0

0.85::acc(s3, recommended_weight_range_size_151).

0.76::true_val(recommended_weight_range_size_151, w50_70); 0.24::true_val(recommended_weight_range_size_151, unk_recommended_weight_range_size_151).

measured(s3, recommended_weight_range_size_151, w50_70).

all_consistent(recommended_weight_range_size_151) :- consistent(s3, recommended_weight_range_size_151).

evidence(all_consistent(recommended_weight_range_size_151)).
query(true_val(recommended_weight_range_size_151, w50_70)).
query(true_val(recommended_weight_range_size_151, unk_recommended_weight_range_size_151)).

% @attr effective_edge_153
% @type numeric
% @canonical false
% @original_name Effective edge 153cm
% @unit cm
% @values v119_0=119.0 unk_effective_edge_153=Unknown
% @importance 1.0

0.85::acc(s3, effective_edge_153).

0.76::true_val(effective_edge_153, v119_0); 0.24::true_val(effective_edge_153, unk_effective_edge_153).

measured(s3, effective_edge_153, v119_0).

all_consistent(effective_edge_153) :- consistent(s3, effective_edge_153).

evidence(all_consistent(effective_edge_153)).
query(true_val(effective_edge_153, v119_0)).
query(true_val(effective_edge_153, unk_effective_edge_153)).

% @attr tip_tail_width_size_153
% @type numeric
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v29_5=29.5 unk_tip_tail_width_size_153=Unknown
% @importance 1.0

0.85::acc(s3, tip_tail_width_size_153).

0.76::true_val(tip_tail_width_size_153, v29_5); 0.24::true_val(tip_tail_width_size_153, unk_tip_tail_width_size_153).

measured(s3, tip_tail_width_size_153, v29_5).

all_consistent(tip_tail_width_size_153) :- consistent(s3, tip_tail_width_size_153).

evidence(all_consistent(tip_tail_width_size_153)).
query(true_val(tip_tail_width_size_153, v29_5)).
query(true_val(tip_tail_width_size_153, unk_tip_tail_width_size_153)).

% @attr waist_width_153
% @type numeric
% @canonical false
% @original_name Waist width 153cm
% @unit cm
% @values v25_0=25.0 unk_waist_width_153=Unknown
% @importance 1.0

0.85::acc(s3, waist_width_153).

0.76::true_val(waist_width_153, v25_0); 0.24::true_val(waist_width_153, unk_waist_width_153).

measured(s3, waist_width_153, v25_0).

all_consistent(waist_width_153) :- consistent(s3, waist_width_153).

evidence(all_consistent(waist_width_153)).
query(true_val(waist_width_153, v25_0)).
query(true_val(waist_width_153, unk_waist_width_153)).

% @attr sidecut_radius_size_153
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v7_8=7.8 unk_sidecut_radius_size_153=Unknown
% @importance 1.0

0.85::acc(s3, sidecut_radius_size_153).

0.76::true_val(sidecut_radius_size_153, v7_8); 0.24::true_val(sidecut_radius_size_153, unk_sidecut_radius_size_153).

measured(s3, sidecut_radius_size_153, v7_8).

all_consistent(sidecut_radius_size_153) :- consistent(s3, sidecut_radius_size_153).

evidence(all_consistent(sidecut_radius_size_153)).
query(true_val(sidecut_radius_size_153, v7_8)).
query(true_val(sidecut_radius_size_153, unk_sidecut_radius_size_153)).

% @attr stance_width_range_size_153
% @type numeric
% @canonical false
% @original_name stance_width_range_size
% @unit cm
% @values v55_0=55.0 unk_stance_width_range_size_153=Unknown
% @importance 1.0

0.85::acc(s3, stance_width_range_size_153).

0.76::true_val(stance_width_range_size_153, v55_0); 0.24::true_val(stance_width_range_size_153, unk_stance_width_range_size_153).

measured(s3, stance_width_range_size_153, v55_0).

all_consistent(stance_width_range_size_153) :- consistent(s3, stance_width_range_size_153).

evidence(all_consistent(stance_width_range_size_153)).
query(true_val(stance_width_range_size_153, v55_0)).
query(true_val(stance_width_range_size_153, unk_stance_width_range_size_153)).

% @attr recommended_weight_range_size_153
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @unit kg
% @values w55_75=55_75kg unk_recommended_weight_range_size_153=Unknown
% @importance 1.0

0.85::acc(s3, recommended_weight_range_size_153).

0.76::true_val(recommended_weight_range_size_153, w55_75); 0.24::true_val(recommended_weight_range_size_153, unk_recommended_weight_range_size_153).

measured(s3, recommended_weight_range_size_153, w55_75).

all_consistent(recommended_weight_range_size_153) :- consistent(s3, recommended_weight_range_size_153).

evidence(all_consistent(recommended_weight_range_size_153)).
query(true_val(recommended_weight_range_size_153, w55_75)).
query(true_val(recommended_weight_range_size_153, unk_recommended_weight_range_size_153)).

% @attr effective_edge_155
% @type numeric
% @canonical false
% @original_name Effective edge 155cm
% @unit cm
% @values v120_5=120.5 unk_effective_edge_155=Unknown
% @importance 1.0

0.85::acc(s3, effective_edge_155).

0.76::true_val(effective_edge_155, v120_5); 0.24::true_val(effective_edge_155, unk_effective_edge_155).

measured(s3, effective_edge_155, v120_5).

all_consistent(effective_edge_155) :- consistent(s3, effective_edge_155).

evidence(all_consistent(effective_edge_155)).
query(true_val(effective_edge_155, v120_5)).
query(true_val(effective_edge_155, unk_effective_edge_155)).

% @attr tip_tail_width_size
% @type numeric
% @canonical true
% @original_name tip_tail_width_size
% @unit cm
% @values v29_7=29.7 unk_tip_tail_width_size=Unknown
% @importance 1.0

0.85::acc(s3, tip_tail_width_size).

0.76::true_val(tip_tail_width_size, v29_7); 0.24::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s3, tip_tail_width_size, v29_7).

all_consistent(tip_tail_width_size) :- consistent(s3, tip_tail_width_size).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v29_7)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr waist_width_155
% @type numeric
% @canonical false
% @original_name Waist width 155cm
% @unit cm
% @values v25_2=25.2 unk_waist_width_155=Unknown
% @importance 1.0

0.85::acc(s3, waist_width_155).

0.76::true_val(waist_width_155, v25_2); 0.24::true_val(waist_width_155, unk_waist_width_155).

measured(s3, waist_width_155, v25_2).

all_consistent(waist_width_155) :- consistent(s3, waist_width_155).

evidence(all_consistent(waist_width_155)).
query(true_val(waist_width_155, v25_2)).
query(true_val(waist_width_155, unk_waist_width_155)).

% @attr sidecut_radius_size
% @type numeric
% @canonical true
% @original_name sidecut_radius_size
% @unit m
% @values v8_0=8.0 unk_sidecut_radius_size=Unknown
% @importance 1.0

0.85::acc(s3, sidecut_radius_size).

0.76::true_val(sidecut_radius_size, v8_0); 0.24::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s3, sidecut_radius_size, v8_0).

all_consistent(sidecut_radius_size) :- consistent(s3, sidecut_radius_size).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v8_0)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr stance_width_range_size
% @type numeric
% @canonical true
% @original_name stance_width_range_size
% @unit cm
% @values v56_0=56.0 unk_stance_width_range_size=Unknown
% @importance 1.0

0.85::acc(s3, stance_width_range_size).

0.76::true_val(stance_width_range_size, v56_0); 0.24::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s3, stance_width_range_size, v56_0).

all_consistent(stance_width_range_size) :- consistent(s3, stance_width_range_size).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v56_0)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size
% @unit kg
% @values w55_85=55_85kg unk_recommended_weight_range_size=Unknown
% @importance 1.0

0.85::acc(s3, recommended_weight_range_size).

0.76::true_val(recommended_weight_range_size, w55_85); 0.24::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s3, recommended_weight_range_size, w55_85).

all_consistent(recommended_weight_range_size) :- consistent(s3, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w55_85)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr effective_edge_158
% @type numeric
% @canonical false
% @original_name Effective edge 158cm
% @unit cm
% @values v123_0=123.0 unk_effective_edge_158=Unknown
% @importance 1.0

0.85::acc(s3, effective_edge_158).

0.76::true_val(effective_edge_158, v123_0); 0.24::true_val(effective_edge_158, unk_effective_edge_158).

measured(s3, effective_edge_158, v123_0).

all_consistent(effective_edge_158) :- consistent(s3, effective_edge_158).

evidence(all_consistent(effective_edge_158)).
query(true_val(effective_edge_158, v123_0)).
query(true_val(effective_edge_158, unk_effective_edge_158)).

% @attr tip_tail_width_size_158
% @type numeric
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v29_9=29.9 unk_tip_tail_width_size_158=Unknown
% @importance 1.0

0.85::acc(s3, tip_tail_width_size_158).

0.76::true_val(tip_tail_width_size_158, v29_9); 0.24::true_val(tip_tail_width_size_158, unk_tip_tail_width_size_158).

measured(s3, tip_tail_width_size_158, v29_9).

all_consistent(tip_tail_width_size_158) :- consistent(s3, tip_tail_width_size_158).

evidence(all_consistent(tip_tail_width_size_158)).
query(true_val(tip_tail_width_size_158, v29_9)).
query(true_val(tip_tail_width_size_158, unk_tip_tail_width_size_158)).

% @attr waist_width_158
% @type numeric
% @canonical false
% @original_name Waist width 158cm
% @unit cm
% @values v25_4=25.4 unk_waist_width_158=Unknown
% @importance 1.0

0.85::acc(s3, waist_width_158).

0.76::true_val(waist_width_158, v25_4); 0.24::true_val(waist_width_158, unk_waist_width_158).

measured(s3, waist_width_158, v25_4).

all_consistent(waist_width_158) :- consistent(s3, waist_width_158).

evidence(all_consistent(waist_width_158)).
query(true_val(waist_width_158, v25_4)).
query(true_val(waist_width_158, unk_waist_width_158)).

% @attr sidecut_radius_size_158
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v8_2=8.2 unk_sidecut_radius_size_158=Unknown
% @importance 1.0

0.85::acc(s3, sidecut_radius_size_158).

0.76::true_val(sidecut_radius_size_158, v8_2); 0.24::true_val(sidecut_radius_size_158, unk_sidecut_radius_size_158).

measured(s3, sidecut_radius_size_158, v8_2).

all_consistent(sidecut_radius_size_158) :- consistent(s3, sidecut_radius_size_158).

evidence(all_consistent(sidecut_radius_size_158)).
query(true_val(sidecut_radius_size_158, v8_2)).
query(true_val(sidecut_radius_size_158, unk_sidecut_radius_size_158)).

% @attr stance_width_range_size_158
% @type numeric
% @canonical false
% @original_name stance_width_range_size
% @unit cm
% @values v57_0=57.0 unk_stance_width_range_size_158=Unknown
% @importance 1.0

0.85::acc(s3, stance_width_range_size_158).

0.76::true_val(stance_width_range_size_158, v57_0); 0.24::true_val(stance_width_range_size_158, unk_stance_width_range_size_158).

measured(s3, stance_width_range_size_158, v57_0).

all_consistent(stance_width_range_size_158) :- consistent(s3, stance_width_range_size_158).

evidence(all_consistent(stance_width_range_size_158)).
query(true_val(stance_width_range_size_158, v57_0)).
query(true_val(stance_width_range_size_158, unk_stance_width_range_size_158)).

% @attr recommended_weight_range_size_158
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @unit kg
% @values w65_90=65_90kg unk_recommended_weight_range_size_158=Unknown
% @importance 1.0

0.85::acc(s3, recommended_weight_range_size_158).

0.76::true_val(recommended_weight_range_size_158, w65_90); 0.24::true_val(recommended_weight_range_size_158, unk_recommended_weight_range_size_158).

measured(s3, recommended_weight_range_size_158, w65_90).

all_consistent(recommended_weight_range_size_158) :- consistent(s3, recommended_weight_range_size_158).

evidence(all_consistent(recommended_weight_range_size_158)).
query(true_val(recommended_weight_range_size_158, w65_90)).
query(true_val(recommended_weight_range_size_158, unk_recommended_weight_range_size_158)).

% @attr effective_edge_155w
% @type numeric
% @canonical false
% @original_name Effective edge 155W
% @unit cm
% @values v120_5w=120.5 unk_effective_edge_155w=Unknown
% @importance 1.0

0.85::acc(s3, effective_edge_155w).

0.76::true_val(effective_edge_155w, v120_5w); 0.24::true_val(effective_edge_155w, unk_effective_edge_155w).

measured(s3, effective_edge_155w, v120_5w).

all_consistent(effective_edge_155w) :- consistent(s3, effective_edge_155w).

evidence(all_consistent(effective_edge_155w)).
query(true_val(effective_edge_155w, v120_5w)).
query(true_val(effective_edge_155w, unk_effective_edge_155w)).

% @attr tip_tail_width_size_155w
% @type numeric
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v30_4=30.4 unk_tip_tail_width_size_155w=Unknown
% @importance 1.0

0.85::acc(s3, tip_tail_width_size_155w).

0.76::true_val(tip_tail_width_size_155w, v30_4); 0.24::true_val(tip_tail_width_size_155w, unk_tip_tail_width_size_155w).

measured(s3, tip_tail_width_size_155w, v30_4).

all_consistent(tip_tail_width_size_155w) :- consistent(s3, tip_tail_width_size_155w).

evidence(all_consistent(tip_tail_width_size_155w)).
query(true_val(tip_tail_width_size_155w, v30_4)).
query(true_val(tip_tail_width_size_155w, unk_tip_tail_width_size_155w)).

% @attr waist_width_155w
% @type numeric
% @canonical false
% @original_name Waist width 155W
% @unit cm
% @values v25_9=25.9 unk_waist_width_155w=Unknown
% @importance 1.0

0.85::acc(s3, waist_width_155w).

0.76::true_val(waist_width_155w, v25_9); 0.24::true_val(waist_width_155w, unk_waist_width_155w).

measured(s3, waist_width_155w, v25_9).

all_consistent(waist_width_155w) :- consistent(s3, waist_width_155w).

evidence(all_consistent(waist_width_155w)).
query(true_val(waist_width_155w, v25_9)).
query(true_val(waist_width_155w, unk_waist_width_155w)).

% @attr sidecut_radius_size_155w
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v8_0w=8.0 unk_sidecut_radius_size_155w=Unknown
% @importance 1.0

0.85::acc(s3, sidecut_radius_size_155w).

0.76::true_val(sidecut_radius_size_155w, v8_0w); 0.24::true_val(sidecut_radius_size_155w, unk_sidecut_radius_size_155w).

measured(s3, sidecut_radius_size_155w, v8_0w).

all_consistent(sidecut_radius_size_155w) :- consistent(s3, sidecut_radius_size_155w).

evidence(all_consistent(sidecut_radius_size_155w)).
query(true_val(sidecut_radius_size_155w, v8_0w)).
query(true_val(sidecut_radius_size_155w, unk_sidecut_radius_size_155w)).

% @attr stance_width_range_size_155w
% @type numeric
% @canonical false
% @original_name stance_width_range_size
% @unit cm
% @values v56_0w=56.0 unk_stance_width_range_size_155w=Unknown
% @importance 1.0

0.85::acc(s3, stance_width_range_size_155w).

0.76::true_val(stance_width_range_size_155w, v56_0w); 0.24::true_val(stance_width_range_size_155w, unk_stance_width_range_size_155w).

measured(s3, stance_width_range_size_155w, v56_0w).

all_consistent(stance_width_range_size_155w) :- consistent(s3, stance_width_range_size_155w).

evidence(all_consistent(stance_width_range_size_155w)).
query(true_val(stance_width_range_size_155w, v56_0w)).
query(true_val(stance_width_range_size_155w, unk_stance_width_range_size_155w)).

% @attr recommended_weight_range_size_155w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @unit kg
% @values w65_95=65_95kg unk_recommended_weight_range_size_155w=Unknown
% @importance 1.0

0.85::acc(s3, recommended_weight_range_size_155w).

0.76::true_val(recommended_weight_range_size_155w, w65_95); 0.24::true_val(recommended_weight_range_size_155w, unk_recommended_weight_range_size_155w).

measured(s3, recommended_weight_range_size_155w, w65_95).

all_consistent(recommended_weight_range_size_155w) :- consistent(s3, recommended_weight_range_size_155w).

evidence(all_consistent(recommended_weight_range_size_155w)).
query(true_val(recommended_weight_range_size_155w, w65_95)).
query(true_val(recommended_weight_range_size_155w, unk_recommended_weight_range_size_155w)).

% @attr effective_edge_158w
% @type numeric
% @canonical false
% @original_name Effective edge 158W
% @unit cm
% @values v123_0w=123.0 unk_effective_edge_158w=Unknown
% @importance 1.0

0.85::acc(s3, effective_edge_158w).

0.76::true_val(effective_edge_158w, v123_0w); 0.24::true_val(effective_edge_158w, unk_effective_edge_158w).

measured(s3, effective_edge_158w, v123_0w).

all_consistent(effective_edge_158w) :- consistent(s3, effective_edge_158w).

evidence(all_consistent(effective_edge_158w)).
query(true_val(effective_edge_158w, v123_0w)).
query(true_val(effective_edge_158w, unk_effective_edge_158w)).

% @attr tip_tail_width_size_158w
% @type numeric
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v30_7=30.7 unk_tip_tail_width_size_158w=Unknown
% @importance 1.0

0.85::acc(s3, tip_tail_width_size_158w).

0.76::true_val(tip_tail_width_size_158w, v30_7); 0.24::true_val(tip_tail_width_size_158w, unk_tip_tail_width_size_158w).

measured(s3, tip_tail_width_size_158w, v30_7).

all_consistent(tip_tail_width_size_158w) :- consistent(s3, tip_tail_width_size_158w).

evidence(all_consistent(tip_tail_width_size_158w)).
query(true_val(tip_tail_width_size_158w, v30_7)).
query(true_val(tip_tail_width_size_158w, unk_tip_tail_width_size_158w)).

% @attr waist_width_158w
% @type numeric
% @canonical false
% @original_name Waist width 158W
% @unit cm
% @values v26_2=26.2 unk_waist_width_158w=Unknown
% @importance 1.0

0.85::acc(s3, waist_width_158w).

0.76::true_val(waist_width_158w, v26_2); 0.24::true_val(waist_width_158w, unk_waist_width_158w).

measured(s3, waist_width_158w, v26_2).

all_consistent(waist_width_158w) :- consistent(s3, waist_width_158w).

evidence(all_consistent(waist_width_158w)).
query(true_val(waist_width_158w, v26_2)).
query(true_val(waist_width_158w, unk_waist_width_158w)).

% @attr sidecut_radius_size_158w
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v8_2w=8.2 unk_sidecut_radius_size_158w=Unknown
% @importance 1.0

0.85::acc(s3, sidecut_radius_size_158w).

0.76::true_val(sidecut_radius_size_158w, v8_2w); 0.24::true_val(sidecut_radius_size_158w, unk_sidecut_radius_size_158w).

measured(s3, sidecut_radius_size_158w, v8_2w).

all_consistent(sidecut_radius_size_158w) :- consistent(s3, sidecut_radius_size_158w).

evidence(all_consistent(sidecut_radius_size_158w)).
query(true_val(sidecut_radius_size_158w, v8_2w)).
query(true_val(sidecut_radius_size_158w, unk_sidecut_radius_size_158w)).

% @attr stance_width_range_size_158w
% @type numeric
% @canonical false
% @original_name stance_width_range_size
% @unit cm
% @values v57_0w=57.0 unk_stance_width_range_size_158w=Unknown
% @importance 1.0

0.85::acc(s3, stance_width_range_size_158w).

0.76::true_val(stance_width_range_size_158w, v57_0w); 0.24::true_val(stance_width_range_size_158w, unk_stance_width_range_size_158w).

measured(s3, stance_width_range_size_158w, v57_0w).

all_consistent(stance_width_range_size_158w) :- consistent(s3, stance_width_range_size_158w).

evidence(all_consistent(stance_width_range_size_158w)).
query(true_val(stance_width_range_size_158w, v57_0w)).
query(true_val(stance_width_range_size_158w, unk_stance_width_range_size_158w)).

% @attr recommended_weight_range_size_158w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @unit kg
% @values w70_105=70_105kg unk_recommended_weight_range_size_158w=Unknown
% @importance 1.0

0.85::acc(s3, recommended_weight_range_size_158w).

0.76::true_val(recommended_weight_range_size_158w, w70_105); 0.24::true_val(recommended_weight_range_size_158w, unk_recommended_weight_range_size_158w).

measured(s3, recommended_weight_range_size_158w, w70_105).

all_consistent(recommended_weight_range_size_158w) :- consistent(s3, recommended_weight_range_size_158w).

evidence(all_consistent(recommended_weight_range_size_158w)).
query(true_val(recommended_weight_range_size_158w, w70_105)).
query(true_val(recommended_weight_range_size_158w, unk_recommended_weight_range_size_158w)).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values sm_148_153_ml_155_158w=SM_148_153_ML_155_158W unk_binding_compatibility=Unknown
% @importance 0.95

0.82::acc(s6, binding_compatibility).

0.76::true_val(binding_compatibility, sm_148_153_ml_155_158w); 0.24::true_val(binding_compatibility, unk_binding_compatibility).

measured(s6, binding_compatibility, sm_148_153_ml_155_158w).

all_consistent(binding_compatibility) :- consistent(s6, binding_compatibility).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, sm_148_153_ml_155_158w)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values park_jib_creative=Park_jib_rail_pressing_side_hits_creative_freestyle unk_riding_style=Unknown
% @importance 0.85

0.88::acc(s3, riding_style).
0.80::acc(s5, riding_style).

0.95::true_val(riding_style, park_jib_creative); 0.05::true_val(riding_style, unk_riding_style).

measured(s3, riding_style, park_jib_creative).
measured(s5, riding_style, park_jib_creative).

all_consistent(riding_style) :-
    (indep(s3), consistent(s3, riding_style) ; \+indep(s3)),
    (indep(s5), consistent(s5, riding_style) ; \+indep(s5)).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, park_jib_creative)).
query(true_val(riding_style, unk_riding_style)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values park_rails_boxes=Terrain_park_rails_boxes_side_hits_urban unk_terrain_suitability=Unknown
% @importance 0.63

0.80::acc(s4, terrain_suitability).
0.72::acc(s49, terrain_suitability).

0.90::true_val(terrain_suitability, park_rails_boxes); 0.10::true_val(terrain_suitability, unk_terrain_suitability).

measured(s4, terrain_suitability, park_rails_boxes).
measured(s49, terrain_suitability, park_rails_boxes).

all_consistent(terrain_suitability) :-
    (indep(s4), consistent(s4, terrain_suitability) ; \+indep(s4)),
    consistent(s49, terrain_suitability).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, park_rails_boxes)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr terrain_suitability_secondary
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values can_handle_all_mtn=Can_handle_some_all_mountain_best_freestyle unk_terrain_suitability_secondary=Unknown
% @importance 0.8

0.78::acc(s50, terrain_suitability_secondary).

0.64::true_val(terrain_suitability_secondary, can_handle_all_mtn); 0.36::true_val(terrain_suitability_secondary, unk_terrain_suitability_secondary).

measured(s50, terrain_suitability_secondary, can_handle_all_mtn).

all_consistent(terrain_suitability_secondary) :- consistent(s50, terrain_suitability_secondary).

evidence(all_consistent(terrain_suitability_secondary)).
query(true_val(terrain_suitability_secondary, can_handle_all_mtn)).
query(true_val(terrain_suitability_secondary, unk_terrain_suitability_secondary)).

% @attr pop
% @type categorical
% @canonical false
% @original_name pop
% @values snappy_explosive=Snappy_and_explosive_pop_from_Popster unk_pop=Unknown
% @importance 0.875

0.88::acc(s36, pop).
0.93::acc(s41, pop).

0.95::true_val(pop, snappy_explosive); 0.05::true_val(pop, unk_pop).

measured(s36, pop, snappy_explosive).
measured(s41, pop, snappy_explosive).

all_consistent(pop) :-
    (indep(s2), consistent(s36, pop) ; \+indep(s2)),
    consistent(s41, pop).

evidence(all_consistent(pop)).
query(true_val(pop, snappy_explosive)).
query(true_val(pop, unk_pop)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values presses_fun_easy=Excellent_soft_flex_makes_presses_fun_easy unk_positive_aspect=Unknown
% @importance 0.775

0.72::acc(s25, positive_aspect).
0.70::acc(s51, positive_aspect).

0.90::true_val(positive_aspect, presses_fun_easy); 0.10::true_val(positive_aspect, unk_positive_aspect).

measured(s25, positive_aspect, presses_fun_easy).
measured(s51, positive_aspect, presses_fun_easy).

all_consistent(positive_aspect) :-
    consistent(s25, positive_aspect),
    consistent(s51, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, presses_fun_easy)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr switch_riding
% @type categorical
% @canonical false
% @original_name switch_riding
% @values identical_both_ways=Rides_identically_regular_or_switch unk_switch_riding=Unknown
% @importance 0.875

0.72::acc(s25, switch_riding).
0.88::acc(s36, switch_riding).

0.90::true_val(switch_riding, identical_both_ways); 0.10::true_val(switch_riding, unk_switch_riding).

measured(s25, switch_riding, identical_both_ways).
measured(s36, switch_riding, identical_both_ways).

all_consistent(switch_riding) :-
    consistent(s25, switch_riding),
    (indep(s2), consistent(s36, switch_riding) ; \+indep(s2)).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, identical_both_ways)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr edge_hold
% @type categorical
% @canonical false
% @original_name edge_hold
% @values adequate_park=Adequate_for_park_blend_hold_forgiveness unk_edge_hold=Unknown
% @importance 0.625

0.82::acc(s47, edge_hold).
0.72::acc(s48, edge_hold).

0.90::true_val(edge_hold, adequate_park); 0.10::true_val(edge_hold, unk_edge_hold).

measured(s47, edge_hold, adequate_park).
measured(s48, edge_hold, adequate_park).

all_consistent(edge_hold) :-
    consistent(s47, edge_hold),
    consistent(s48, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, adequate_park)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values not_high_speed=Not_a_high_speed_board_park_noodle unk_negative_aspect=Unknown
% @importance 0.85

0.62::acc(s52, negative_aspect).

0.34::true_val(negative_aspect, not_high_speed); 0.66::true_val(negative_aspect, unk_negative_aspect).

measured(s52, negative_aspect, not_high_speed).

all_consistent(negative_aspect) :- consistent(s52, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, not_high_speed)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr chatter_performance
% @type categorical
% @canonical false
% @original_name chatter_performance
% @values rubber_dampening=Royal_Rubber_provides_dampening_reduces_chatter unk_chatter_performance=Unknown
% @importance 0.825

0.88::acc(s36, chatter_performance).
0.75::acc(s42, chatter_performance).

0.90::true_val(chatter_performance, rubber_dampening); 0.10::true_val(chatter_performance, unk_chatter_performance).

measured(s36, chatter_performance, rubber_dampening).
measured(s42, chatter_performance, rubber_dampening).

all_consistent(chatter_performance) :-
    (indep(s2), consistent(s36, chatter_performance) ; \+indep(s2)),
    (indep(s34), consistent(s42, chatter_performance) ; \+indep(s34)).

evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, rubber_dampening)).
query(true_val(chatter_performance, unk_chatter_performance)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values unstable_high_speed=Less_stable_at_higher_speeds_not_all_mountain unk_user_review_forum=Unknown
% @importance 0.8

0.58::acc(s52, user_review_forum).
0.55::acc(s53, user_review_forum).

0.80::true_val(user_review_forum, unstable_high_speed); 0.20::true_val(user_review_forum, unk_user_review_forum).

measured(s52, user_review_forum, unstable_high_speed).
measured(s53, user_review_forum, unstable_high_speed).

all_consistent(user_review_forum) :-
    consistent(s52, user_review_forum),
    consistent(s53, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, unstable_high_speed)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values great_value_park=Great_value_for_money_park_jib unk_reviewer_opinion_whitelines=Unknown
% @importance 0.85

0.82::acc(s54, reviewer_opinion_whitelines).

0.68::true_val(reviewer_opinion_whitelines, great_value_park); 0.32::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

measured(s54, reviewer_opinion_whitelines, great_value_park).

all_consistent(reviewer_opinion_whitelines) :- consistent(s54, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, great_value_park)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

% @attr reviewer_opinion_whitelines_100
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values whitelines_100=Selected_for_Whitelines_100_Best unk_reviewer_opinion_whitelines_100=Unknown
% @importance 0.85

0.82::acc(s54, reviewer_opinion_whitelines_100).

0.68::true_val(reviewer_opinion_whitelines_100, whitelines_100); 0.32::true_val(reviewer_opinion_whitelines_100, unk_reviewer_opinion_whitelines_100).

measured(s54, reviewer_opinion_whitelines_100, whitelines_100).

all_consistent(reviewer_opinion_whitelines_100) :- consistent(s54, reviewer_opinion_whitelines_100).

evidence(all_consistent(reviewer_opinion_whitelines_100)).
query(true_val(reviewer_opinion_whitelines_100, whitelines_100)).
query(true_val(reviewer_opinion_whitelines_100, unk_reviewer_opinion_whitelines_100)).

% @attr positive_aspect_fun
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values super_fun_great_price=Super_fun_board_unbeatable_price unk_positive_aspect_fun=Unknown
% @importance 0.8

0.72::acc(s25, positive_aspect_fun).

0.56::true_val(positive_aspect_fun, super_fun_great_price); 0.44::true_val(positive_aspect_fun, unk_positive_aspect_fun).

measured(s25, positive_aspect_fun, super_fun_great_price).

all_consistent(positive_aspect_fun) :- consistent(s25, positive_aspect_fun).

evidence(all_consistent(positive_aspect_fun)).
query(true_val(positive_aspect_fun, super_fun_great_price)).
query(true_val(positive_aspect_fun, unk_positive_aspect_fun)).

% @attr positive_aspect_forgiveness
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values loose_camber_forgiveness=Rock_Out_Camber_loose_feel_with_forgiveness unk_positive_aspect_forgiveness=Unknown
% @importance 0.8

0.72::acc(s25, positive_aspect_forgiveness).

0.56::true_val(positive_aspect_forgiveness, loose_camber_forgiveness); 0.44::true_val(positive_aspect_forgiveness, unk_positive_aspect_forgiveness).

measured(s25, positive_aspect_forgiveness, loose_camber_forgiveness).

all_consistent(positive_aspect_forgiveness) :- consistent(s25, positive_aspect_forgiveness).

evidence(all_consistent(positive_aspect_forgiveness)).
query(true_val(positive_aspect_forgiveness, loose_camber_forgiveness)).
query(true_val(positive_aspect_forgiveness, unk_positive_aspect_forgiveness)).

% @attr positive_aspect_flex_stability
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values soft_not_unstable=Soft_flex_not_too_soft_stable_moderate_speed unk_positive_aspect_flex_stability=Unknown
% @importance 0.8

0.72::acc(s25, positive_aspect_flex_stability).

0.56::true_val(positive_aspect_flex_stability, soft_not_unstable); 0.44::true_val(positive_aspect_flex_stability, unk_positive_aspect_flex_stability).

measured(s25, positive_aspect_flex_stability, soft_not_unstable).

all_consistent(positive_aspect_flex_stability) :- consistent(s25, positive_aspect_flex_stability).

evidence(all_consistent(positive_aspect_flex_stability)).
query(true_val(positive_aspect_flex_stability, soft_not_unstable)).
query(true_val(positive_aspect_flex_stability, unk_positive_aspect_flex_stability)).

% @attr positive_aspect_edge_hold
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values adequate_hardpack=Edge_hold_adequate_on_hardpack_for_soft_board unk_positive_aspect_edge_hold=Unknown
% @importance 0.8

0.72::acc(s25, positive_aspect_edge_hold).

0.56::true_val(positive_aspect_edge_hold, adequate_hardpack); 0.44::true_val(positive_aspect_edge_hold, unk_positive_aspect_edge_hold).

measured(s25, positive_aspect_edge_hold, adequate_hardpack).

all_consistent(positive_aspect_edge_hold) :- consistent(s25, positive_aspect_edge_hold).

evidence(all_consistent(positive_aspect_edge_hold)).
query(true_val(positive_aspect_edge_hold, adequate_hardpack)).
query(true_val(positive_aspect_edge_hold, unk_positive_aspect_edge_hold)).

% @attr positive_aspect_durability
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values core_takes_beating=Core_built_to_take_a_beating_all_season unk_positive_aspect_durability=Unknown
% @importance 0.7

0.80::acc(s55, positive_aspect_durability).

0.64::true_val(positive_aspect_durability, core_takes_beating); 0.36::true_val(positive_aspect_durability, unk_positive_aspect_durability).

measured(s55, positive_aspect_durability, core_takes_beating).

all_consistent(positive_aspect_durability) :- consistent(s55, positive_aspect_durability).

evidence(all_consistent(positive_aspect_durability)).
query(true_val(positive_aspect_durability, core_takes_beating)).
query(true_val(positive_aspect_durability, unk_positive_aspect_durability)).

% @attr user_review_forum_noodle
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values park_noodle=Described_as_park_noodle_not_all_mountain unk_user_review_forum_noodle=Unknown
% @importance 0.85

0.58::acc(s52, user_review_forum_noodle).

0.34::true_val(user_review_forum_noodle, park_noodle); 0.66::true_val(user_review_forum_noodle, unk_user_review_forum_noodle).

measured(s52, user_review_forum_noodle, park_noodle).

all_consistent(user_review_forum_noodle) :- consistent(s52, user_review_forum_noodle).

evidence(all_consistent(user_review_forum_noodle)).
query(true_val(user_review_forum_noodle, park_noodle)).
query(true_val(user_review_forum_noodle, unk_user_review_forum_noodle)).

% @attr user_review_forum_stiffer
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values feels_stiffer_2024=User_noted_2024_model_feels_stiffer unk_user_review_forum_stiffer=Unknown
% @importance 0.75

0.55::acc(s26, user_review_forum_stiffer).

0.34::true_val(user_review_forum_stiffer, feels_stiffer_2024); 0.66::true_val(user_review_forum_stiffer, unk_user_review_forum_stiffer).

measured(s26, user_review_forum_stiffer, feels_stiffer_2024).

all_consistent(user_review_forum_stiffer) :- consistent(s26, user_review_forum_stiffer).

evidence(all_consistent(user_review_forum_stiffer)).
query(true_val(user_review_forum_stiffer, feels_stiffer_2024)).
query(true_val(user_review_forum_stiffer, unk_user_review_forum_stiffer)).

% @attr negative_aspect_powder
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values not_suited_powder=Board_not_suited_for_powder_riding unk_negative_aspect_powder=Unknown
% @importance 0.8

0.78::acc(s50, negative_aspect_powder).

0.64::true_val(negative_aspect_powder, not_suited_powder); 0.36::true_val(negative_aspect_powder, unk_negative_aspect_powder).

measured(s50, negative_aspect_powder, not_suited_powder).

all_consistent(negative_aspect_powder) :- consistent(s50, negative_aspect_powder).

evidence(all_consistent(negative_aspect_powder)).
query(true_val(negative_aspect_powder, not_suited_powder)).
query(true_val(negative_aspect_powder, unk_negative_aspect_powder)).

% @attr user_review_forum_narrow
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values narrower_underfoot=Quadratic_sidecut_makes_2_3mm_narrower_underfoot unk_user_review_forum_narrow=Unknown
% @importance 0.75

0.55::acc(s26, user_review_forum_narrow).

0.34::true_val(user_review_forum_narrow, narrower_underfoot); 0.66::true_val(user_review_forum_narrow, unk_user_review_forum_narrow).

measured(s26, user_review_forum_narrow, narrower_underfoot).

all_consistent(user_review_forum_narrow) :- consistent(s26, user_review_forum_narrow).

evidence(all_consistent(user_review_forum_narrow)).
query(true_val(user_review_forum_narrow, narrower_underfoot)).
query(true_val(user_review_forum_narrow, unk_user_review_forum_narrow)).

% @attr user_review_forum_speed
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values speed_concern=Users_question_all_mountain_and_high_speed unk_user_review_forum_speed=Unknown
% @importance 0.75

0.55::acc(s53, user_review_forum_speed).

0.30::true_val(user_review_forum_speed, speed_concern); 0.70::true_val(user_review_forum_speed, unk_user_review_forum_speed).

measured(s53, user_review_forum_speed, speed_concern).

all_consistent(user_review_forum_speed) :- consistent(s53, user_review_forum_speed).

evidence(all_consistent(user_review_forum_speed)).
query(true_val(user_review_forum_speed, speed_concern)).
query(true_val(user_review_forum_speed, unk_user_review_forum_speed)).

% @attr positive_aspect_value
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values best_value_park=Consistently_praised_best_value_park_boards unk_positive_aspect_value=Unknown
% @importance 0.825

0.82::acc(s54, positive_aspect_value).
0.72::acc(s25, positive_aspect_value).

0.90::true_val(positive_aspect_value, best_value_park); 0.10::true_val(positive_aspect_value, unk_positive_aspect_value).

measured(s54, positive_aspect_value, best_value_park).
measured(s25, positive_aspect_value, best_value_park).

all_consistent(positive_aspect_value) :-
    consistent(s54, positive_aspect_value),
    consistent(s25, positive_aspect_value).

evidence(all_consistent(positive_aspect_value)).
query(true_val(positive_aspect_value, best_value_park)).
query(true_val(positive_aspect_value, unk_positive_aspect_value)).

% @attr sustainability_certification_bio
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values bio_30pct_plant=30_percent_plant_material_reduced_impact unk_sustainability_certification_bio=Unknown
% @importance 0.9

0.85::acc(s3, sustainability_certification_bio).
0.72::acc(s31, sustainability_certification_bio).

0.90::true_val(sustainability_certification_bio, bio_30pct_plant); 0.10::true_val(sustainability_certification_bio, unk_sustainability_certification_bio).

measured(s3, sustainability_certification_bio, bio_30pct_plant).
measured(s31, sustainability_certification_bio, bio_30pct_plant).

all_consistent(sustainability_certification_bio) :-
    (indep(s3), consistent(s3, sustainability_certification_bio) ; \+indep(s3)),
    (indep(s31), consistent(s31, sustainability_certification_bio) ; \+indep(s31)).

evidence(all_consistent(sustainability_certification_bio)).
query(true_val(sustainability_certification_bio, bio_30pct_plant)).
query(true_val(sustainability_certification_bio, unk_sustainability_certification_bio)).

% @attr sustainability_certification_sourcing
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values responsibly_sourced_aspen=Responsibly_sourced_aspen unk_sustainability_certification_sourcing=Unknown
% @importance 0.85

0.78::acc(s4, sustainability_certification_sourcing).
0.68::acc(s25, sustainability_certification_sourcing).

0.90::true_val(sustainability_certification_sourcing, responsibly_sourced_aspen); 0.10::true_val(sustainability_certification_sourcing, unk_sustainability_certification_sourcing).

measured(s4, sustainability_certification_sourcing, responsibly_sourced_aspen).
measured(s25, sustainability_certification_sourcing, responsibly_sourced_aspen).

all_consistent(sustainability_certification_sourcing) :-
    (indep(s4), consistent(s4, sustainability_certification_sourcing) ; \+indep(s4)),
    consistent(s25, sustainability_certification_sourcing).

evidence(all_consistent(sustainability_certification_sourcing)).
query(true_val(sustainability_certification_sourcing, responsibly_sourced_aspen)).
query(true_val(sustainability_certification_sourcing, unk_sustainability_certification_sourcing)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values huck_knife=Salomon_Huck_Knife_stiffer_carbon_sintered unk_comparable_board_same_brand=Unknown
% @importance 0.8

0.75::acc(s56, comparable_board_same_brand).
0.72::acc(s57, comparable_board_same_brand).

0.90::true_val(comparable_board_same_brand, huck_knife); 0.10::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s56, comparable_board_same_brand, huck_knife).
measured(s57, comparable_board_same_brand, huck_knife).

all_consistent(comparable_board_same_brand) :-
    consistent(s56, comparable_board_same_brand),
    consistent(s57, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, huck_knife)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_hk_price
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values hk_463_96=Huck_Knife_463_96_MSRP_slightly_more_expensive unk_comparable_board_same_brand_hk_price=Unknown
% @importance 0.75

0.72::acc(s57, comparable_board_same_brand_hk_price).

0.53::true_val(comparable_board_same_brand_hk_price, hk_463_96); 0.47::true_val(comparable_board_same_brand_hk_price, unk_comparable_board_same_brand_hk_price).

measured(s57, comparable_board_same_brand_hk_price, hk_463_96).

all_consistent(comparable_board_same_brand_hk_price) :- consistent(s57, comparable_board_same_brand_hk_price).

evidence(all_consistent(comparable_board_same_brand_hk_price)).
query(true_val(comparable_board_same_brand_hk_price, hk_463_96)).
query(true_val(comparable_board_same_brand_hk_price, unk_comparable_board_same_brand_hk_price)).

% @attr comparable_board_same_brand_villain
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values villain_alternative=Sleepwalker_cheaper_alternative_to_Villain unk_comparable_board_same_brand_villain=Unknown
% @importance 0.75

0.70::acc(s25, comparable_board_same_brand_villain).
0.72::acc(s58, comparable_board_same_brand_villain).

0.85::true_val(comparable_board_same_brand_villain, villain_alternative); 0.15::true_val(comparable_board_same_brand_villain, unk_comparable_board_same_brand_villain).

measured(s25, comparable_board_same_brand_villain, villain_alternative).
measured(s58, comparable_board_same_brand_villain, villain_alternative).

all_consistent(comparable_board_same_brand_villain) :-
    consistent(s25, comparable_board_same_brand_villain),
    consistent(s58, comparable_board_same_brand_villain).

evidence(all_consistent(comparable_board_same_brand_villain)).
query(true_val(comparable_board_same_brand_villain, villain_alternative)).
query(true_val(comparable_board_same_brand_villain, unk_comparable_board_same_brand_villain)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values capita_ultrafear=Capita_Ultrafear_549_95_true_twin_cork_dampening unk_comparable_board_cross_brand=Unknown
% @importance 0.8

0.75::acc(s59, comparable_board_cross_brand).
0.75::acc(s60, comparable_board_cross_brand).

0.90::true_val(comparable_board_cross_brand, capita_ultrafear); 0.10::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s59, comparable_board_cross_brand, capita_ultrafear).
measured(s60, comparable_board_cross_brand, capita_ultrafear).

all_consistent(comparable_board_cross_brand) :-
    consistent(s59, comparable_board_cross_brand),
    consistent(s60, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, capita_ultrafear)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_doa
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values capita_doa=CAPiTA_DOA_stiffer_better_carving_less_jib unk_comparable_board_cross_brand_doa=Unknown
% @importance 0.75

0.75::acc(s60, comparable_board_cross_brand_doa).

0.53::true_val(comparable_board_cross_brand_doa, capita_doa); 0.47::true_val(comparable_board_cross_brand_doa, unk_comparable_board_cross_brand_doa).

measured(s60, comparable_board_cross_brand_doa, capita_doa).

all_consistent(comparable_board_cross_brand_doa) :- consistent(s60, comparable_board_cross_brand_doa).

evidence(all_consistent(comparable_board_cross_brand_doa)).
query(true_val(comparable_board_cross_brand_doa, capita_doa)).
query(true_val(comparable_board_cross_brand_doa, unk_comparable_board_cross_brand_doa)).

% @attr comparable_board_cross_brand_bataleon
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values bataleon_evil_twin=Bataleon_Evil_Twin_3BT_medium_flex_versatile unk_comparable_board_cross_brand_bataleon=Unknown
% @importance 0.7

0.72::acc(s61, comparable_board_cross_brand_bataleon).

0.53::true_val(comparable_board_cross_brand_bataleon, bataleon_evil_twin); 0.47::true_val(comparable_board_cross_brand_bataleon, unk_comparable_board_cross_brand_bataleon).

measured(s61, comparable_board_cross_brand_bataleon, bataleon_evil_twin).

all_consistent(comparable_board_cross_brand_bataleon) :- consistent(s61, comparable_board_cross_brand_bataleon).

evidence(all_consistent(comparable_board_cross_brand_bataleon)).
query(true_val(comparable_board_cross_brand_bataleon, bataleon_evil_twin)).
query(true_val(comparable_board_cross_brand_bataleon, unk_comparable_board_cross_brand_bataleon)).

% @attr comparable_board_cross_brand_twinpig
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values ride_twinpig=Ride_Twinpig_asymmetrical_hybrid_camber_volume_shifted unk_comparable_board_cross_brand_twinpig=Unknown
% @importance 0.6

0.68::acc(s62, comparable_board_cross_brand_twinpig).

0.49::true_val(comparable_board_cross_brand_twinpig, ride_twinpig); 0.51::true_val(comparable_board_cross_brand_twinpig, unk_comparable_board_cross_brand_twinpig).

measured(s62, comparable_board_cross_brand_twinpig, ride_twinpig).

all_consistent(comparable_board_cross_brand_twinpig) :- consistent(s62, comparable_board_cross_brand_twinpig).

evidence(all_consistent(comparable_board_cross_brand_twinpig)).
query(true_val(comparable_board_cross_brand_twinpig, ride_twinpig)).
query(true_val(comparable_board_cross_brand_twinpig, unk_comparable_board_cross_brand_twinpig)).

% @attr comparable_board_cross_brand_forum
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values forum_rec_all_mtn=Forum_rec_for_all_mountain_versatility_butter unk_comparable_board_cross_brand_forum=Unknown
% @importance 0.85

0.58::acc(s52, comparable_board_cross_brand_forum).

0.34::true_val(comparable_board_cross_brand_forum, forum_rec_all_mtn); 0.66::true_val(comparable_board_cross_brand_forum, unk_comparable_board_cross_brand_forum).

measured(s52, comparable_board_cross_brand_forum, forum_rec_all_mtn).

all_consistent(comparable_board_cross_brand_forum) :- consistent(s52, comparable_board_cross_brand_forum).

evidence(all_consistent(comparable_board_cross_brand_forum)).
query(true_val(comparable_board_cross_brand_forum, forum_rec_all_mtn)).
query(true_val(comparable_board_cross_brand_forum, unk_comparable_board_cross_brand_forum)).

% @attr comparable_board_same_brand_craft
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values salomon_craft=Salomon_Craft_similar_Rock_Out_Camber_different_sidecut unk_comparable_board_same_brand_craft=Unknown
% @importance 0.75

0.55::acc(s26, comparable_board_same_brand_craft).

0.34::true_val(comparable_board_same_brand_craft, salomon_craft); 0.66::true_val(comparable_board_same_brand_craft, unk_comparable_board_same_brand_craft).

measured(s26, comparable_board_same_brand_craft, salomon_craft).

all_consistent(comparable_board_same_brand_craft) :- consistent(s26, comparable_board_same_brand_craft).

evidence(all_consistent(comparable_board_same_brand_craft)).
query(true_val(comparable_board_same_brand_craft, salomon_craft)).
query(true_val(comparable_board_same_brand_craft, unk_comparable_board_same_brand_craft)).

% @attr comparable_board_cross_brand_prices
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values lower_end_premium=Sleepwalker_449_95_lower_end_of_premium_park_market unk_comparable_board_cross_brand_prices=Unknown
% @importance 0.78

0.75::acc(s59, comparable_board_cross_brand_prices).
0.72::acc(s57, comparable_board_cross_brand_prices).
0.78::acc(s19, comparable_board_cross_brand_prices).

0.90::true_val(comparable_board_cross_brand_prices, lower_end_premium); 0.10::true_val(comparable_board_cross_brand_prices, unk_comparable_board_cross_brand_prices).

measured(s59, comparable_board_cross_brand_prices, lower_end_premium).
measured(s57, comparable_board_cross_brand_prices, lower_end_premium).
measured(s19, comparable_board_cross_brand_prices, lower_end_premium).

all_consistent(comparable_board_cross_brand_prices) :-
    consistent(s59, comparable_board_cross_brand_prices),
    consistent(s57, comparable_board_cross_brand_prices),
    (indep(s19), consistent(s19, comparable_board_cross_brand_prices) ; \+indep(s19)).

evidence(all_consistent(comparable_board_cross_brand_prices)).
query(true_val(comparable_board_cross_brand_prices, lower_end_premium)).
query(true_val(comparable_board_cross_brand_prices, unk_comparable_board_cross_brand_prices)).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values symmetrical_twin=Symmetrical_twin_flex unk_flex_direction=Unknown
% @importance 0.95

0.88::acc(s36, flex_direction).

0.84::true_val(flex_direction, symmetrical_twin); 0.16::true_val(flex_direction, unk_flex_direction).

measured(s36, flex_direction, symmetrical_twin).

all_consistent(flex_direction) :-
    (indep(s2), consistent(s36, flex_direction) ; \+indep(s2)).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, symmetrical_twin)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr setback
% @type categorical
% @canonical true
% @original_name setback
% @values centered=Centered_binding_stance unk_setback=Unknown
% @importance 0.95

0.88::acc(s36, setback).

0.84::true_val(setback, centered); 0.16::true_val(setback, unk_setback).

measured(s36, setback, centered).

all_consistent(setback) :-
    (indep(s2), consistent(s36, setback) ; \+indep(s2)).

evidence(all_consistent(setback)).
query(true_val(setback, centered)).
query(true_val(setback, unk_setback)).

% @attr binding_compatibility_pattern
% @type categorical
% @canonical false
% @original_name binding_compatibility
% @values compatible_2x4=Compatible_most_bindings_2x4_inserts unk_binding_compatibility_pattern=Unknown
% @importance 0.8

0.78::acc(s17, binding_compatibility_pattern).

0.59::true_val(binding_compatibility_pattern, compatible_2x4); 0.41::true_val(binding_compatibility_pattern, unk_binding_compatibility_pattern).

measured(s17, binding_compatibility_pattern, compatible_2x4).

all_consistent(binding_compatibility_pattern) :-
    (indep(s16), consistent(s17, binding_compatibility_pattern) ; \+indep(s16)).

evidence(all_consistent(binding_compatibility_pattern)).
query(true_val(binding_compatibility_pattern, compatible_2x4)).
query(true_val(binding_compatibility_pattern, unk_binding_compatibility_pattern)).

% @attr taper
% @type categorical
% @canonical true
% @original_name taper
% @values none_true_twin=None_true_twin_zero_setback unk_taper=Unknown
% @importance 0.95

0.88::acc(s36, taper).

0.84::true_val(taper, none_true_twin); 0.16::true_val(taper, unk_taper).

measured(s36, taper, none_true_twin).

all_consistent(taper) :-
    (indep(s2), consistent(s36, taper) ; \+indep(s2)).

evidence(all_consistent(taper)).
query(true_val(taper, none_true_twin)).
query(true_val(taper, unk_taper)).

% @attr comparable_board_same_brand_grom
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values sleepwalker_grom=Sleepwalker_Grom_127cm_junior_Flat_Out_Camber unk_comparable_board_same_brand_grom=Unknown
% @importance 0.4

0.75::acc(s63, comparable_board_same_brand_grom).

0.60::true_val(comparable_board_same_brand_grom, sleepwalker_grom); 0.40::true_val(comparable_board_same_brand_grom, unk_comparable_board_same_brand_grom).

measured(s63, comparable_board_same_brand_grom, sleepwalker_grom).

all_consistent(comparable_board_same_brand_grom) :- consistent(s63, comparable_board_same_brand_grom).

evidence(all_consistent(comparable_board_same_brand_grom)).
query(true_val(comparable_board_same_brand_grom, sleepwalker_grom)).
query(true_val(comparable_board_same_brand_grom, unk_comparable_board_same_brand_grom)).

% @attr topsheet_appearance_description
% @type categorical
% @canonical true
% @original_name topsheet_appearance_description
% @values mad_scientist=Mad_scientists_electrifying_mishap_theme unk_topsheet_appearance_description=Unknown
% @importance 0.35

0.68::acc(s49, topsheet_appearance_description).

0.52::true_val(topsheet_appearance_description, mad_scientist); 0.48::true_val(topsheet_appearance_description, unk_topsheet_appearance_description).

measured(s49, topsheet_appearance_description, mad_scientist).

all_consistent(topsheet_appearance_description) :- consistent(s49, topsheet_appearance_description).

evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, mad_scientist)).
query(true_val(topsheet_appearance_description, unk_topsheet_appearance_description)).

% @attr salomon_headquarters
% @type categorical
% @canonical false
% @original_name Salomon headquarters
% @values annecy_france=Annecy_France unk_salomon_headquarters=Unknown
% @importance 0.6

0.90::acc(s8, salomon_headquarters).

0.81::true_val(salomon_headquarters, annecy_france); 0.19::true_val(salomon_headquarters, unk_salomon_headquarters).

measured(s8, salomon_headquarters, annecy_france).

all_consistent(salomon_headquarters) :- consistent(s8, salomon_headquarters).

evidence(all_consistent(salomon_headquarters)).
query(true_val(salomon_headquarters, annecy_france)).
query(true_val(salomon_headquarters, unk_salomon_headquarters)).

% @attr salomon_us_operations
% @type categorical
% @canonical false
% @original_name Salomon US operations
% @values ogden_utah=Ogden_Utah unk_salomon_us_operations=Unknown
% @importance 0.45

0.88::acc(s10, salomon_us_operations).

0.81::true_val(salomon_us_operations, ogden_utah); 0.19::true_val(salomon_us_operations, unk_salomon_us_operations).

measured(s10, salomon_us_operations, ogden_utah).

all_consistent(salomon_us_operations) :- consistent(s10, salomon_us_operations).

evidence(all_consistent(salomon_us_operations)).
query(true_val(salomon_us_operations, ogden_utah)).
query(true_val(salomon_us_operations, unk_salomon_us_operations)).