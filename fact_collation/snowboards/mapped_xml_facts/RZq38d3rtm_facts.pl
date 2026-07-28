0.15::indep(s1).
0.15::indep(s2).
0.15::indep(s24).
0.15::indep(s29).
0.20::indep(sm).
0.15::indep(s37).
0.15::indep(s62).
0.15::indep(s70).
0.20::indep(s92).
0.15::indep(s94).
0.15::indep(s95).
0.15::indep(s100).
0.20::indep(s104).
0.15::indep(s109).
0.80::indep(s110).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values salomon=Salomon unk_brand=Unknown
% @importance 0.90

0.93::acc(s22, brand).
0.70::acc(s1, brand).
0.93::acc(sm, brand).

0.97::true_val(brand, salomon); 0.03::true_val(brand, unk_brand).

measured(s22, brand, salomon).
measured(s1, brand, salomon).
measured(sm, brand, salomon).

all_consistent(brand) :-
    consistent(s22, brand),
    (indep(s1), consistent(s1, brand) ; \+indep(s1)),
    (indep(sm), consistent(sm, brand) ; \+indep(sm)).

evidence(all_consistent(brand)).
query(true_val(brand, salomon)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values assassin=Assassin unk_model_name=Unknown
% @importance 0.90

0.93::acc(s22, model_name).
0.70::acc(s1, model_name).

0.97::true_val(model_name, assassin); 0.03::true_val(model_name, unk_model_name).

measured(s22, model_name, assassin).
measured(s1, model_name, assassin).

all_consistent(model_name) :-
    consistent(s22, model_name),
    (indep(s1), consistent(s1, model_name) ; \+indep(s1)).

evidence(all_consistent(model_name)).
query(true_val(model_name, assassin)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type numeric
% @canonical true
% @original_name model_year
% @values v2027=2027 unk_model_year=Unknown
% @importance 0.95

0.85::acc(s104, model_year).

0.67::true_val(model_year, v2027); 0.33::true_val(model_year, unk_model_year).

measured(s104, model_year, v2027).

all_consistent(model_year) :-
    consistent(s104, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, v2027)).
query(true_val(model_year, unk_model_year)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.95::acc(s22, product_type).

0.90::true_val(product_type, snowboard); 0.10::true_val(product_type, unk_product_type).

measured(s22, product_type, snowboard).

all_consistent(product_type) :-
    consistent(s22, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mtn_freestyle=All-Mountain_Freestyle unk_board_category=Unknown
% @importance 0.85

0.80::acc(s24, board_category).
0.75::acc(s29, board_category).
0.70::acc(s1, board_category).
0.82::acc(s9, board_category).

0.95::true_val(board_category, all_mtn_freestyle); 0.05::true_val(board_category, unk_board_category).

measured(s24, board_category, all_mtn_freestyle).
measured(s29, board_category, all_mtn_freestyle).
measured(s1, board_category, all_mtn_freestyle).
measured(s9, board_category, all_mtn_freestyle).

all_consistent(board_category) :-
    consistent(s9, board_category),
    (indep(s24), consistent(s24, board_category) ; \+indep(s24)),
    (indep(s29), consistent(s29, board_category) ; \+indep(s29)),
    (indep(s1), consistent(s1, board_category) ; \+indep(s1)).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mtn_freestyle)).
query(true_val(board_category, unk_board_category)).

% @attr board_category_quiver
% @type categorical
% @canonical false
% @original_name board_category (quiver killer descriptor)
% @values quiver_killer=All-Mountain_Freestyle_quiver_killer unk_board_category_quiver=Unknown
% @importance 0.85

0.70::acc(s1, board_category_quiver).
0.82::acc(s9, board_category_quiver).

0.80::true_val(board_category_quiver, quiver_killer); 0.20::true_val(board_category_quiver, unk_board_category_quiver).

measured(s1, board_category_quiver, quiver_killer).
measured(s9, board_category_quiver, quiver_killer).

all_consistent(board_category_quiver) :-
    (indep(s1), consistent(s1, board_category_quiver) ; \+indep(s1)),
    consistent(s9, board_category_quiver).

evidence(all_consistent(board_category_quiver)).
query(true_val(board_category_quiver, quiver_killer)).
query(true_val(board_category_quiver, unk_board_category_quiver)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.93

0.95::acc(s22, gender).
0.90::acc(s110, gender).

0.97::true_val(gender, mens); 0.03::true_val(gender, unk_gender).

measured(s22, gender, mens).
measured(s110, gender, mens).

all_consistent(gender) :-
    consistent(s22, gender),
    (indep(s110), consistent(s110, gender) ; \+indep(s110)).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values annecy_france=Annecy_France_design_center unk_manufacturer=Unknown
% @importance 0.45

0.78::acc(s86, manufacturer).

0.62::true_val(manufacturer, annecy_france); 0.38::true_val(manufacturer, unk_manufacturer).

measured(s86, manufacturer, annecy_france).

all_consistent(manufacturer) :-
    consistent(s86, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, annecy_france)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr manufacturer_parent
% @type categorical
% @canonical false
% @original_name manufacturer (parent company)
% @values amer_sports=Amer_Sports unk_manufacturer_parent=Unknown
% @importance 0.40

0.60::acc(s82, manufacturer_parent).

0.44::true_val(manufacturer_parent, amer_sports); 0.56::true_val(manufacturer_parent, unk_manufacturer_parent).

measured(s82, manufacturer_parent, amer_sports).

all_consistent(manufacturer_parent) :-
    consistent(s82, manufacturer_parent).

evidence(all_consistent(manufacturer_parent)).
query(true_val(manufacturer_parent, amer_sports)).
query(true_val(manufacturer_parent, unk_manufacturer_parent)).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values austria_or_oem=Austria_AMER_factory_or_OEM china=China unk_manufacturing_location_current=Unknown
% @importance 0.43

0.65::acc(s86, manufacturing_location_current).
0.35::acc(s87, manufacturing_location_current).

0.45::true_val(manufacturing_location_current, austria_or_oem); 0.40::true_val(manufacturing_location_current, china); 0.15::true_val(manufacturing_location_current, unk_manufacturing_location_current).

measured(s86, manufacturing_location_current, austria_or_oem).
measured(s87, manufacturing_location_current, china).

all_consistent(manufacturing_location_current) :-
    consistent(s86, manufacturing_location_current),
    consistent(s87, manufacturing_location_current).

evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, austria_or_oem)).
query(true_val(manufacturing_location_current, china)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values victor_daviet=Victor_Daviet unk_pro_rider_name=Unknown
% @importance 0.47

0.85::acc(s113, pro_rider_name).
0.82::acc(s115, pro_rider_name).
0.85::acc(s120, pro_rider_name).

0.95::true_val(pro_rider_name, victor_daviet); 0.05::true_val(pro_rider_name, unk_pro_rider_name).

measured(s113, pro_rider_name, victor_daviet).
measured(s115, pro_rider_name, victor_daviet).
measured(s120, pro_rider_name, victor_daviet).

all_consistent(pro_rider_name) :-
    consistent(s113, pro_rider_name),
    consistent(s115, pro_rider_name),
    consistent(s120, pro_rider_name).

evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, victor_daviet)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr pro_rider_name_team
% @type categorical
% @canonical false
% @original_name pro_rider_name (full team)
% @values louif_harrison_victor=Louif_Paradis_Harrison_Gordon_Victor_Daviet unk_pro_rider_name_team=Unknown
% @importance 0.40

0.82::acc(s113, pro_rider_name_team).

0.72::true_val(pro_rider_name_team, louif_harrison_victor); 0.28::true_val(pro_rider_name_team, unk_pro_rider_name_team).

measured(s113, pro_rider_name_team, louif_harrison_victor).

all_consistent(pro_rider_name_team) :-
    consistent(s113, pro_rider_name_team).

evidence(all_consistent(pro_rider_name_team)).
query(true_val(pro_rider_name_team, louif_harrison_victor)).
query(true_val(pro_rider_name_team, unk_pro_rider_name_team)).

% @attr model_first_available_year
% @type numeric
% @canonical true
% @original_name model_first_available_year
% @values v2014=2014 unk_model_first_available_year=Unknown
% @importance 0.50

0.78::acc(s5, model_first_available_year).

0.64::true_val(model_first_available_year, v2014); 0.36::true_val(model_first_available_year, unk_model_first_available_year).

measured(s5, model_first_available_year, v2014).

all_consistent(model_first_available_year) :-
    consistent(s5, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, v2014)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr redesign_year
% @type numeric
% @canonical true
% @original_name redesign_year
% @values v2019=2019 unk_redesign_year=Unknown
% @importance 0.70

0.82::acc(s42, redesign_year).

0.62::true_val(redesign_year, v2019); 0.38::true_val(redesign_year, unk_redesign_year).

measured(s42, redesign_year, v2019).

all_consistent(redesign_year) :-
    consistent(s42, redesign_year).

evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, v2019)).
query(true_val(redesign_year, unk_redesign_year)).

% @attr redesign_year_2025
% @type categorical
% @canonical false
% @original_name redesign_year (2025 re-tool)
% @values retool_2025=Significant_retool_2025_rubber_rails_updated_construction unk_redesign_year_2025=Unknown
% @importance 0.78

0.82::acc(s42, redesign_year_2025).
0.90::acc(sm, redesign_year_2025).

0.90::true_val(redesign_year_2025, retool_2025); 0.10::true_val(redesign_year_2025, unk_redesign_year_2025).

measured(s42, redesign_year_2025, retool_2025).
measured(sm, redesign_year_2025, retool_2025).

all_consistent(redesign_year_2025) :-
    consistent(s42, redesign_year_2025),
    (indep(sm), consistent(sm, redesign_year_2025) ; \+indep(sm)).

evidence(all_consistent(redesign_year_2025)).
query(true_val(redesign_year_2025, retool_2025)).
query(true_val(redesign_year_2025, unk_redesign_year_2025)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values two_years=2_years unk_warranty=Unknown
% @importance 0.64

0.95::acc(s96, warranty).
0.70::acc(s94, warranty).
0.65::acc(s95, warranty).
0.65::acc(s100, warranty).
0.82::acc(s120, warranty).

0.97::true_val(warranty, two_years); 0.03::true_val(warranty, unk_warranty).

measured(s96, warranty, two_years).
measured(s94, warranty, two_years).
measured(s95, warranty, two_years).
measured(s100, warranty, two_years).
measured(s120, warranty, two_years).

all_consistent(warranty) :-
    consistent(s96, warranty),
    (indep(s94), consistent(s94, warranty) ; \+indep(s94)),
    (indep(s95), consistent(s95, warranty) ; \+indep(s95)),
    (indep(s100), consistent(s100, warranty) ; \+indep(s100)),
    consistent(s120, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, two_years)).
query(true_val(warranty, unk_warranty)).

% @attr price_aud_merchant
% @type numeric
% @canonical true
% @original_name price_aud_merchant
% @unit AUD
% @values v989_99=989.99 unk_price_aud_merchant=Unknown
% @importance 0.90

0.95::acc(sm, price_aud_merchant).
0.88::acc(s104, price_aud_merchant).

0.97::true_val(price_aud_merchant, v989_99); 0.03::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(sm, price_aud_merchant, v989_99).
measured(s104, price_aud_merchant, v989_99).

all_consistent(price_aud_merchant) :-
    consistent(sm, price_aud_merchant),
    consistent(s104, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v989_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values preorder=Preorder unk_availability_status=Unknown
% @importance 0.90

0.95::acc(sm, availability_status).
0.88::acc(s104, availability_status).

0.97::true_val(availability_status, preorder); 0.03::true_val(availability_status, unk_availability_status).

measured(sm, availability_status, preorder).
measured(s104, availability_status, preorder).

all_consistent(availability_status) :-
    consistent(sm, availability_status),
    consistent(s104, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, preorder)).
query(true_val(availability_status, unk_availability_status)).

% @attr estimated_availability_date
% @type categorical
% @canonical true
% @original_name estimated_availability_date
% @values apr_may_2026=April_May_2026 unk_estimated_availability_date=Unknown
% @importance 0.95

0.85::acc(s104, estimated_availability_date).

0.67::true_val(estimated_availability_date, apr_may_2026); 0.33::true_val(estimated_availability_date, unk_estimated_availability_date).

measured(s104, estimated_availability_date, apr_may_2026).

all_consistent(estimated_availability_date) :-
    consistent(s104, estimated_availability_date).

evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, apr_may_2026)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

% @attr price_aud_salomon_au
% @type numeric
% @canonical false
% @original_name price_aud_merchant (Salomon AU 2025/26 model)
% @unit AUD
% @values v899_99=899.99 unk_price_aud_salomon_au=Unknown
% @importance 0.85

0.92::acc(s110, price_aud_salomon_au).

0.85::true_val(price_aud_salomon_au, v899_99); 0.15::true_val(price_aud_salomon_au, unk_price_aud_salomon_au).

measured(s110, price_aud_salomon_au, v899_99).

all_consistent(price_aud_salomon_au) :-
    (indep(s110), consistent(s110, price_aud_salomon_au) ; \+indep(s110)).

evidence(all_consistent(price_aud_salomon_au)).
query(true_val(price_aud_salomon_au, v899_99)).
query(true_val(price_aud_salomon_au, unk_price_aud_salomon_au)).

% @attr price_aud_clearance
% @type numeric
% @canonical false
% @original_name price_aud_merchant (clearance $659.99 was $879.99)
% @unit AUD
% @values v659_99=659.99 unk_price_aud_clearance=Unknown
% @importance 0.70

0.90::acc(s111, price_aud_clearance).

0.81::true_val(price_aud_clearance, v659_99); 0.19::true_val(price_aud_clearance, unk_price_aud_clearance).

measured(s111, price_aud_clearance, v659_99).

all_consistent(price_aud_clearance) :-
    consistent(s111, price_aud_clearance).

evidence(all_consistent(price_aud_clearance)).
query(true_val(price_aud_clearance, v659_99)).
query(true_val(price_aud_clearance, unk_price_aud_clearance)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v649_95=649.95 unk_price_usd_msrp=Unknown
% @importance 0.95

0.90::acc(sr, price_usd_msrp).
0.85::acc(s62, price_usd_msrp).

0.97::true_val(price_usd_msrp, v649_95); 0.03::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(sr, price_usd_msrp, v649_95).
measured(s62, price_usd_msrp, v649_95).

all_consistent(price_usd_msrp) :-
    consistent(sr, price_usd_msrp),
    (indep(s62), consistent(s62, price_usd_msrp) ; \+indep(s62)).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v649_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_usd_rei
% @type numeric
% @canonical false
% @original_name price_usd_rei
% @unit USD
% @values v649_95=649.95 unk_price_usd_rei=Unknown
% @importance 0.95

0.92::acc(sr, price_usd_rei).

0.81::true_val(price_usd_rei, v649_95); 0.19::true_val(price_usd_rei, unk_price_usd_rei).

measured(sr, price_usd_rei, v649_95).

all_consistent(price_usd_rei) :-
    consistent(sr, price_usd_rei).

evidence(all_consistent(price_usd_rei)).
query(true_val(price_usd_rei, v649_95)).
query(true_val(price_usd_rei, unk_price_usd_rei)).

% @attr price_usd_aspen
% @type numeric
% @canonical false
% @original_name Price at Aspen Ski and Board (2026)
% @unit USD
% @values v649_95=649.95 unk_price_usd_aspen=Unknown
% @importance 0.95

0.85::acc(s62, price_usd_aspen).

0.67::true_val(price_usd_aspen, v649_95); 0.33::true_val(price_usd_aspen, unk_price_usd_aspen).

measured(s62, price_usd_aspen, v649_95).

all_consistent(price_usd_aspen) :-
    (indep(s62), consistent(s62, price_usd_aspen) ; \+indep(s62)).

evidence(all_consistent(price_usd_aspen)).
query(true_val(price_usd_aspen, v649_95)).
query(true_val(price_usd_aspen, unk_price_usd_aspen)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values assassin_pro_699_95=Assassin_Pro_MSRP_699_95_USD_vs_Assassin_649_95_USD unk_comparable_board_same_brand=Unknown
% @importance 0.75

0.80::acc(s70, comparable_board_same_brand).
0.85::acc(s62, comparable_board_same_brand).

0.85::true_val(comparable_board_same_brand, assassin_pro_699_95); 0.15::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s70, comparable_board_same_brand, assassin_pro_699_95).
measured(s62, comparable_board_same_brand, assassin_pro_699_95).

all_consistent(comparable_board_same_brand) :-
    (indep(s70), consistent(s70, comparable_board_same_brand) ; \+indep(s70)),
    (indep(s62), consistent(s62, comparable_board_same_brand) ; \+indep(s62)).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, assassin_pro_699_95)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr price_usd_discounted
% @type numeric
% @canonical false
% @original_name price_usd_msrp (discounted range)
% @unit USD
% @values v489_97_to_559_96=489.97-559.96 unk_price_usd_discounted=Unknown
% @importance 0.85

0.72::acc(s36, price_usd_discounted).

0.60::true_val(price_usd_discounted, v489_97_to_559_96); 0.40::true_val(price_usd_discounted, unk_price_usd_discounted).

measured(s36, price_usd_discounted, v489_97_to_559_96).

all_consistent(price_usd_discounted) :-
    consistent(s36, price_usd_discounted).

evidence(all_consistent(price_usd_discounted)).
query(true_val(price_usd_discounted, v489_97_to_559_96)).
query(true_val(price_usd_discounted, unk_price_usd_discounted)).

% @attr availability_status_rei
% @type categorical
% @canonical false
% @original_name availability_status (REI US)
% @values preorder_rei=Pre-order_REI unk_availability_status_rei=Unknown
% @importance 0.95

0.90::acc(sr, availability_status_rei).

0.81::true_val(availability_status_rei, preorder_rei); 0.19::true_val(availability_status_rei, unk_availability_status_rei).

measured(sr, availability_status_rei, preorder_rei).

all_consistent(availability_status_rei) :-
    consistent(sr, availability_status_rei).

evidence(all_consistent(availability_status_rei)).
query(true_val(availability_status_rei, preorder_rei)).
query(true_val(availability_status_rei, unk_availability_status_rei)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status (evo US)
% @values in_stock=In_stock_2026_model unk_availability_status_evo=Unknown
% @importance 0.85

0.85::acc(s21, availability_status_evo).

0.68::true_val(availability_status_evo, in_stock); 0.32::true_val(availability_status_evo, unk_availability_status_evo).

measured(s21, availability_status_evo, in_stock).

all_consistent(availability_status_evo) :-
    consistent(s21, availability_status_evo).

evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, in_stock)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

% @attr availability_status_tactics
% @type categorical
% @canonical false
% @original_name availability_status (Tactics US)
% @values available=Available unk_availability_status_tactics=Unknown
% @importance 0.75

0.75::acc(s15, availability_status_tactics).

0.49::true_val(availability_status_tactics, available); 0.51::true_val(availability_status_tactics, unk_availability_status_tactics).

measured(s15, availability_status_tactics, available).

all_consistent(availability_status_tactics) :-
    consistent(s15, availability_status_tactics).

evidence(all_consistent(availability_status_tactics)).
query(true_val(availability_status_tactics, available)).
query(true_val(availability_status_tactics, unk_availability_status_tactics)).

% @attr availability_status_backcountry
% @type categorical
% @canonical false
% @original_name availability_status (Backcountry US)
% @values available=Available unk_availability_status_backcountry=Unknown
% @importance 0.85

0.72::acc(s36, availability_status_backcountry).

0.60::true_val(availability_status_backcountry, available); 0.40::true_val(availability_status_backcountry, unk_availability_status_backcountry).

measured(s36, availability_status_backcountry, available).

all_consistent(availability_status_backcountry) :-
    consistent(s36, availability_status_backcountry).

evidence(all_consistent(availability_status_backcountry)).
query(true_val(availability_status_backcountry, available)).
query(true_val(availability_status_backcountry, unk_availability_status_backcountry)).

% @attr availability_status_sun_ski
% @type categorical
% @canonical false
% @original_name availability_status (Sun and Ski US)
% @values available=Available unk_availability_status_sun_ski=Unknown
% @importance 0.85

0.72::acc(s36, availability_status_sun_ski).

0.60::true_val(availability_status_sun_ski, available); 0.40::true_val(availability_status_sun_ski, unk_availability_status_sun_ski).

measured(s36, availability_status_sun_ski, available).

all_consistent(availability_status_sun_ski) :-
    consistent(s36, availability_status_sun_ski).

evidence(all_consistent(availability_status_sun_ski)).
query(true_val(availability_status_sun_ski, available)).
query(true_val(availability_status_sun_ski, unk_availability_status_sun_ski)).

% @attr availability_status_christy
% @type categorical
% @canonical false
% @original_name availability_status (Christy Sports US)
% @values available=Available unk_availability_status_christy=Unknown
% @importance 0.85

0.72::acc(s36, availability_status_christy).

0.60::true_val(availability_status_christy, available); 0.40::true_val(availability_status_christy, unk_availability_status_christy).

measured(s36, availability_status_christy, available).

all_consistent(availability_status_christy) :-
    consistent(s36, availability_status_christy).

evidence(all_consistent(availability_status_christy)).
query(true_val(availability_status_christy, available)).
query(true_val(availability_status_christy, unk_availability_status_christy)).

% @attr availability_status_the_house
% @type categorical
% @canonical false
% @original_name availability_status (The House US)
% @values available=Available unk_availability_status_the_house=Unknown
% @importance 0.90

0.78::acc(s24, availability_status_the_house).

0.69::true_val(availability_status_the_house, available); 0.31::true_val(availability_status_the_house, unk_availability_status_the_house).

measured(s24, availability_status_the_house, available).

all_consistent(availability_status_the_house) :-
    consistent(s24, availability_status_the_house).

evidence(all_consistent(availability_status_the_house)).
query(true_val(availability_status_the_house, available)).
query(true_val(availability_status_the_house, unk_availability_status_the_house)).

% @attr availability_status_absolute_snow
% @type categorical
% @canonical false
% @original_name availability_status (Absolute-Snow UK)
% @values available=Available unk_availability_status_absolute_snow=Unknown
% @importance 0.75

0.75::acc(s37, availability_status_absolute_snow).

0.62::true_val(availability_status_absolute_snow, available); 0.38::true_val(availability_status_absolute_snow, unk_availability_status_absolute_snow).

measured(s37, availability_status_absolute_snow, available).

all_consistent(availability_status_absolute_snow) :-
    consistent(s37, availability_status_absolute_snow).

evidence(all_consistent(availability_status_absolute_snow)).
query(true_val(availability_status_absolute_snow, available)).
query(true_val(availability_status_absolute_snow, unk_availability_status_absolute_snow)).

% @attr availability_status_snow_rock
% @type categorical
% @canonical false
% @original_name availability_status (Snow+Rock UK)
% @values available_3yr_warranty=Available_3_year_retailer_warranty unk_availability_status_snow_rock=Unknown
% @importance 0.50

0.75::acc(s92, availability_status_snow_rock).

0.60::true_val(availability_status_snow_rock, available_3yr_warranty); 0.40::true_val(availability_status_snow_rock, unk_availability_status_snow_rock).

measured(s92, availability_status_snow_rock, available_3yr_warranty).

all_consistent(availability_status_snow_rock) :-
    (indep(s92), consistent(s92, availability_status_snow_rock) ; \+indep(s92)).

evidence(all_consistent(availability_status_snow_rock)).
query(true_val(availability_status_snow_rock, available_3yr_warranty)).
query(true_val(availability_status_snow_rock, unk_availability_status_snow_rock)).

% @attr availability_status_balmoral
% @type categorical
% @canonical false
% @original_name availability_status (Balmoral Boards AU)
% @values preorder_989_99_aud=Preorder_989_99_AUD unk_availability_status_balmoral=Unknown
% @importance 0.95

0.88::acc(s104, availability_status_balmoral).

0.67::true_val(availability_status_balmoral, preorder_989_99_aud); 0.33::true_val(availability_status_balmoral, unk_availability_status_balmoral).

measured(s104, availability_status_balmoral, preorder_989_99_aud).

all_consistent(availability_status_balmoral) :-
    (indep(s104), consistent(s104, availability_status_balmoral) ; \+indep(s104)).

evidence(all_consistent(availability_status_balmoral)).
query(true_val(availability_status_balmoral, preorder_989_99_aud)).
query(true_val(availability_status_balmoral, unk_availability_status_balmoral)).

% @attr availability_status_cherri
% @type categorical
% @canonical false
% @original_name availability_status (Cherri Cherri Pow Pow AU)
% @values preorder_2027=Preorder_2027 unk_availability_status_cherri=Unknown
% @importance 0.70

0.65::acc(s103, availability_status_cherri).

0.55::true_val(availability_status_cherri, preorder_2027); 0.45::true_val(availability_status_cherri, unk_availability_status_cherri).

measured(s103, availability_status_cherri, preorder_2027).

all_consistent(availability_status_cherri) :-
    consistent(s103, availability_status_cherri).

evidence(all_consistent(availability_status_cherri)).
query(true_val(availability_status_cherri, preorder_2027)).
query(true_val(availability_status_cherri, unk_availability_status_cherri)).

% @attr availability_status_melbourne
% @type categorical
% @canonical false
% @original_name availability_status (Melbourne Snowboard Centre AU)
% @values preorder_2027=Preorder_2027 unk_availability_status_melbourne=Unknown
% @importance 0.30

0.70::acc(s109, availability_status_melbourne).

0.55::true_val(availability_status_melbourne, preorder_2027); 0.45::true_val(availability_status_melbourne, unk_availability_status_melbourne).

measured(s109, availability_status_melbourne, preorder_2027).

all_consistent(availability_status_melbourne) :-
    (indep(s109), consistent(s109, availability_status_melbourne) ; \+indep(s109)).

evidence(all_consistent(availability_status_melbourne)).
query(true_val(availability_status_melbourne, preorder_2027)).
query(true_val(availability_status_melbourne, unk_availability_status_melbourne)).

% @attr availability_status_salomon_au
% @type categorical
% @canonical false
% @original_name availability_status (Salomon AU official)
% @values sold_out_2025_26=Sold_out_2025_2026_model unk_availability_status_salomon_au=Unknown
% @importance 0.85

0.90::acc(s110, availability_status_salomon_au).

0.85::true_val(availability_status_salomon_au, sold_out_2025_26); 0.15::true_val(availability_status_salomon_au, unk_availability_status_salomon_au).

measured(s110, availability_status_salomon_au, sold_out_2025_26).

all_consistent(availability_status_salomon_au) :-
    (indep(s110), consistent(s110, availability_status_salomon_au) ; \+indep(s110)).

evidence(all_consistent(availability_status_salomon_au)).
query(true_val(availability_status_salomon_au, sold_out_2025_26)).
query(true_val(availability_status_salomon_au, unk_availability_status_salomon_au)).

% @attr price_usd_gravity
% @type numeric
% @canonical false
% @original_name price_usd_msrp (Gravity Coalition)
% @unit USD
% @values v489_97=489.97 unk_price_usd_gravity=Unknown
% @importance 0.85

0.72::acc(s36, price_usd_gravity).

0.60::true_val(price_usd_gravity, v489_97); 0.40::true_val(price_usd_gravity, unk_price_usd_gravity).

measured(s36, price_usd_gravity, v489_97).

all_consistent(price_usd_gravity) :-
    consistent(s36, price_usd_gravity).

evidence(all_consistent(price_usd_gravity)).
query(true_val(price_usd_gravity, v489_97)).
query(true_val(price_usd_gravity, unk_price_usd_gravity)).

% @attr price_eur_snowcountry
% @type numeric
% @canonical false
% @original_name price_eur_blue_tomato
% @unit EUR
% @values v419_97_to_569=419.97-569.00 unk_price_eur_snowcountry=Unknown
% @importance 0.85

0.72::acc(s36, price_eur_snowcountry).

0.60::true_val(price_eur_snowcountry, v419_97_to_569); 0.40::true_val(price_eur_snowcountry, unk_price_eur_snowcountry).

measured(s36, price_eur_snowcountry, v419_97_to_569).

all_consistent(price_eur_snowcountry) :-
    consistent(s36, price_eur_snowcountry).

evidence(all_consistent(price_eur_snowcountry)).
query(true_val(price_eur_snowcountry, v419_97_to_569)).
query(true_val(price_eur_snowcountry, unk_price_eur_snowcountry)).

% @attr availability_status_rude_boys
% @type categorical
% @canonical false
% @original_name availability_status (Rude Boys Banff Canada)
% @values available=Available unk_availability_status_rude_boys=Unknown
% @importance 0.65

0.75::acc(s94, availability_status_rude_boys).

0.62::true_val(availability_status_rude_boys, available); 0.38::true_val(availability_status_rude_boys, unk_availability_status_rude_boys).

measured(s94, availability_status_rude_boys, available).

all_consistent(availability_status_rude_boys) :-
    (indep(s94), consistent(s94, availability_status_rude_boys) ; \+indep(s94)).

evidence(all_consistent(availability_status_rude_boys)).
query(true_val(availability_status_rude_boys, available)).
query(true_val(availability_status_rude_boys, unk_availability_status_rude_boys)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values directional_twin=Directional_Twin unk_shape=Unknown
% @importance 0.90

0.95::acc(s22, shape).
0.80::acc(s24, shape).
0.92::acc(sm, shape).
0.70::acc(s1, shape).

0.97::true_val(shape, directional_twin); 0.03::true_val(shape, unk_shape).

measured(s22, shape, directional_twin).
measured(s24, shape, directional_twin).
measured(sm, shape, directional_twin).
measured(s1, shape, directional_twin).

all_consistent(shape) :-
    consistent(s22, shape),
    (indep(s24), consistent(s24, shape) ; \+indep(s24)),
    (indep(sm), consistent(sm, shape) ; \+indep(sm)),
    (indep(s1), consistent(s1, shape) ; \+indep(s1)).

evidence(all_consistent(shape)).
query(true_val(shape, directional_twin)).
query(true_val(shape, unk_shape)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values rock_out_camber=Rock_Out_Camber unk_camber_type=Unknown
% @importance 0.93

0.95::acc(s22, camber_type).
0.92::acc(sm, camber_type).

0.97::true_val(camber_type, rock_out_camber); 0.03::true_val(camber_type, unk_camber_type).

measured(s22, camber_type, rock_out_camber).
measured(sm, camber_type, rock_out_camber).

all_consistent(camber_type) :-
    consistent(s22, camber_type),
    (indep(sm), consistent(sm, camber_type) ; \+indep(sm)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, rock_out_camber)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values flat_camber_rocker=Flat_between_bindings_camber_near_feet_rocker_tip_tail unk_camber_description=Unknown
% @importance 0.93

0.95::acc(s22, camber_description).
0.70::acc(s1, camber_description).

0.95::true_val(camber_description, flat_camber_rocker); 0.05::true_val(camber_description, unk_camber_description).

measured(s22, camber_description, flat_camber_rocker).
measured(s1, camber_description, flat_camber_rocker).

all_consistent(camber_description) :-
    consistent(s22, camber_description),
    (indep(s1), consistent(s1, camber_description) ; \+indep(s1)).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, flat_camber_rocker)).
query(true_val(camber_description, unk_camber_description)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @original_name flex_rating_10
% @unit /10
% @values v6=6.0 unk_flex_rating_10=Unknown
% @importance 0.85

0.93::acc(sm, flex_rating_10).

0.93::true_val(flex_rating_10, v6); 0.07::true_val(flex_rating_10, unk_flex_rating_10).

measured(sm, flex_rating_10, v6).

all_consistent(flex_rating_10) :-
    (indep(sm), consistent(sm, flex_rating_10) ; \+indep(sm)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v6)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

% @attr flex_rating_5
% @type numeric
% @canonical true
% @original_name flex_rating_5
% @unit /5
% @values v4=4.0 unk_flex_rating_5=Unknown
% @importance 0.85

0.75::acc(s1, flex_rating_5).

0.64::true_val(flex_rating_5, v4); 0.36::true_val(flex_rating_5, unk_flex_rating_5).

measured(s1, flex_rating_5, v4).

all_consistent(flex_rating_5) :-
    (indep(s1), consistent(s1, flex_rating_5) ; \+indep(s1)).

evidence(all_consistent(flex_rating_5)).
query(true_val(flex_rating_5, v4)).
query(true_val(flex_rating_5, unk_flex_rating_5)).

% @attr flex_rating_10_evo
% @type categorical
% @canonical true
% @original_name flex_rating_10_evo
% @values stiff=Stiff_6_to_8_of_10 unk_flex_rating_10_evo=Unknown
% @importance 0.75

0.82::acc(s21, flex_rating_10_evo).

0.68::true_val(flex_rating_10_evo, stiff); 0.32::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).

measured(s21, flex_rating_10_evo, stiff).

all_consistent(flex_rating_10_evo) :-
    consistent(s21, flex_rating_10_evo).

evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, stiff)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values medium=Medium quite_soft=Quite_soft about_4_5=About_4_5_just_under_medium
% @importance 0.78

0.88::acc(sr, flex_feel).
0.80::acc(s50, flex_feel).
0.78::acc(s15, flex_feel).

0.40::true_val(flex_feel, medium); 0.35::true_val(flex_feel, quite_soft); 0.25::true_val(flex_feel, about_4_5).

measured(sr, flex_feel, medium).
measured(s50, flex_feel, quite_soft).
measured(s15, flex_feel, about_4_5).

all_consistent(flex_feel) :-
    consistent(sr, flex_feel),
    consistent(s50, flex_feel),
    consistent(s15, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium)).
query(true_val(flex_feel, quite_soft)).
query(true_val(flex_feel, about_4_5)).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values directional_stiffer_nose=Directional_flex_stiffer_toward_nose unk_flex_direction=Unknown
% @importance 0.85

0.75::acc(s1, flex_direction).

0.64::true_val(flex_direction, directional_stiffer_nose); 0.36::true_val(flex_direction, unk_flex_direction).

measured(s1, flex_direction, directional_stiffer_nose).

all_consistent(flex_direction) :-
    (indep(s1), consistent(s1, flex_direction) ; \+indep(s1)).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional_stiffer_nose)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values quadralizer=Quadralizer_Sidecut quadrilizer=Quadrilizer unk_sidecut_type=Unknown
% @importance 0.88

0.95::acc(s22, sidecut_type).
0.90::acc(sm, sidecut_type).
0.78::acc(s21, sidecut_type).

0.90::true_val(sidecut_type, quadralizer); 0.08::true_val(sidecut_type, quadrilizer); 0.02::true_val(sidecut_type, unk_sidecut_type).

measured(s22, sidecut_type, quadralizer).
measured(sm, sidecut_type, quadralizer).
measured(s21, sidecut_type, quadrilizer).

all_consistent(sidecut_type) :-
    consistent(s22, sidecut_type),
    (indep(sm), consistent(sm, sidecut_type) ; \+indep(sm)),
    consistent(s21, sidecut_type).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, quadralizer)).
query(true_val(sidecut_type, quadrilizer)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr sidecut_description
% @type categorical
% @canonical false
% @original_name sidecut_type (description)
% @values equalizer_quadratic_combo=Combining_Equalizer_and_Quadratic_sidecuts_multiple_radii unk_sidecut_description=Unknown
% @importance 1.0

0.95::acc(s22, sidecut_description).

0.90::true_val(sidecut_description, equalizer_quadratic_combo); 0.10::true_val(sidecut_description, unk_sidecut_description).

measured(s22, sidecut_description, equalizer_quadratic_combo).

all_consistent(sidecut_description) :-
    consistent(s22, sidecut_description).

evidence(all_consistent(sidecut_description)).
query(true_val(sidecut_description, equalizer_quadratic_combo)).
query(true_val(sidecut_description, unk_sidecut_description)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values aspen_slct=Aspen_SLCT_Core_hand_selected unk_core_material=Unknown
% @importance 0.93

0.95::acc(s22, core_material).
0.90::acc(sm, core_material).

0.97::true_val(core_material, aspen_slct); 0.03::true_val(core_material, unk_core_material).

measured(s22, core_material, aspen_slct).
measured(sm, core_material, aspen_slct).

all_consistent(core_material) :-
    consistent(s22, core_material),
    (indep(sm), consistent(sm, core_material) ; \+indep(sm)).

evidence(all_consistent(core_material)).
query(true_val(core_material, aspen_slct)).
query(true_val(core_material, unk_core_material)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values fsc_certified_wood=FSC_certified_wood unk_sustainability_certification=Unknown
% @importance 0.85

0.70::acc(s1, sustainability_certification).

0.64::true_val(sustainability_certification, fsc_certified_wood); 0.36::true_val(sustainability_certification, unk_sustainability_certification).

measured(s1, sustainability_certification, fsc_certified_wood).

all_consistent(sustainability_certification) :-
    (indep(s1), consistent(s1, sustainability_certification) ; \+indep(s1)).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, fsc_certified_wood)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values ba_md_fiberglass=BA_MD_Fiberglass_medium_density unk_laminate=Unknown
% @importance 0.88

0.82::acc(s24, laminate).
0.90::acc(sm, laminate).

0.95::true_val(laminate, ba_md_fiberglass); 0.05::true_val(laminate, unk_laminate).

measured(s24, laminate, ba_md_fiberglass).
measured(sm, laminate, ba_md_fiberglass).

all_consistent(laminate) :-
    (indep(s24), consistent(s24, laminate) ; \+indep(s24)),
    (indep(sm), consistent(sm, laminate) ; \+indep(sm)).

evidence(all_consistent(laminate)).
query(true_val(laminate, ba_md_fiberglass)).
query(true_val(laminate, unk_laminate)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values popster_eco_booster=Popster_Eco_Booster_milled_core_carbon_stringers_bamboo_rods unk_construction_material_innovation=Unknown
% @importance 0.85

0.95::acc(s22, construction_material_innovation).
0.90::acc(sm, construction_material_innovation).
0.70::acc(s2, construction_material_innovation).

0.97::true_val(construction_material_innovation, popster_eco_booster); 0.03::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s22, construction_material_innovation, popster_eco_booster).
measured(sm, construction_material_innovation, popster_eco_booster).
measured(s2, construction_material_innovation, popster_eco_booster).

all_consistent(construction_material_innovation) :-
    consistent(s22, construction_material_innovation),
    (indep(sm), consistent(sm, construction_material_innovation) ; \+indep(sm)),
    (indep(s2), consistent(s2, construction_material_innovation) ; \+indep(s2)).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, popster_eco_booster)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr construction_carbon_stringers
% @type categorical
% @canonical false
% @original_name construction_material_innovation (carbon stringers)
% @values carbon_stringers_nose_tail=Carbon_stringers_in_nose_tail unk_construction_carbon_stringers=Unknown
% @importance 0.93

0.95::acc(s22, construction_carbon_stringers).
0.90::acc(sm, construction_carbon_stringers).

0.97::true_val(construction_carbon_stringers, carbon_stringers_nose_tail); 0.03::true_val(construction_carbon_stringers, unk_construction_carbon_stringers).

measured(s22, construction_carbon_stringers, carbon_stringers_nose_tail).
measured(sm, construction_carbon_stringers, carbon_stringers_nose_tail).

all_consistent(construction_carbon_stringers) :-
    consistent(s22, construction_carbon_stringers),
    (indep(sm), consistent(sm, construction_carbon_stringers) ; \+indep(sm)).

evidence(all_consistent(construction_carbon_stringers)).
query(true_val(construction_carbon_stringers, carbon_stringers_nose_tail)).
query(true_val(construction_carbon_stringers, unk_construction_carbon_stringers)).

% @attr construction_bamboo_rods
% @type categorical
% @canonical false
% @original_name construction_material_innovation (bamboo rods)
% @values bamboo_rods_for_pop=Bamboo_rods_for_pop unk_construction_bamboo_rods=Unknown
% @importance 0.93

0.95::acc(s22, construction_bamboo_rods).
0.90::acc(sm, construction_bamboo_rods).

0.97::true_val(construction_bamboo_rods, bamboo_rods_for_pop); 0.03::true_val(construction_bamboo_rods, unk_construction_bamboo_rods).

measured(s22, construction_bamboo_rods, bamboo_rods_for_pop).
measured(sm, construction_bamboo_rods, bamboo_rods_for_pop).

all_consistent(construction_bamboo_rods) :-
    consistent(s22, construction_bamboo_rods),
    (indep(sm), consistent(sm, construction_bamboo_rods) ; \+indep(sm)).

evidence(all_consistent(construction_bamboo_rods)).
query(true_val(construction_bamboo_rods, bamboo_rods_for_pop)).
query(true_val(construction_bamboo_rods, unk_construction_bamboo_rods)).

% @attr resin
% @type categorical
% @canonical true
% @original_name resin
% @values bio_based_30pct=30_percent_Bio_Based_Resin unk_resin=Unknown
% @importance 0.88

0.82::acc(s24, resin).
0.90::acc(sm, resin).

0.95::true_val(resin, bio_based_30pct); 0.05::true_val(resin, unk_resin).

measured(s24, resin, bio_based_30pct).
measured(sm, resin, bio_based_30pct).

all_consistent(resin) :-
    (indep(s24), consistent(s24, resin) ; \+indep(s24)),
    (indep(sm), consistent(sm, resin) ; \+indep(sm)).

evidence(all_consistent(resin)).
query(true_val(resin, bio_based_30pct)).
query(true_val(resin, unk_resin)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values royal_rubber_rails=Royal_Rubber_Rails_full_length_rubber unk_sidewall_material=Unknown
% @importance 0.85

0.92::acc(sm, sidewall_material).

0.95::true_val(sidewall_material, royal_rubber_rails); 0.05::true_val(sidewall_material, unk_sidewall_material).

measured(sm, sidewall_material, royal_rubber_rails).

all_consistent(sidewall_material) :-
    (indep(sm), consistent(sm, sidewall_material) ; \+indep(sm)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, royal_rubber_rails)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr topsheet
% @type categorical
% @canonical true
% @original_name topsheet
% @values abc_wrapper=ABC_Wrapper_Topsheet_wood_veneer unk_topsheet=Unknown
% @importance 0.88

0.82::acc(s24, topsheet).
0.90::acc(sm, topsheet).

0.95::true_val(topsheet, abc_wrapper); 0.05::true_val(topsheet, unk_topsheet).

measured(s24, topsheet, abc_wrapper).
measured(sm, topsheet, abc_wrapper).

all_consistent(topsheet) :-
    (indep(s24), consistent(s24, topsheet) ; \+indep(s24)),
    (indep(sm), consistent(sm, topsheet) ; \+indep(sm)).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, abc_wrapper)).
query(true_val(topsheet, unk_topsheet)).

% @attr topsheet_appearance_description
% @type categorical
% @canonical true
% @original_name topsheet_appearance_description
% @values bamboo_veneers_reduce_fg_resin=Bamboo_veneers_reduce_fibreglass_and_resin unk_topsheet_appearance_description=Unknown
% @importance 0.50

0.80::acc(s115, topsheet_appearance_description).

0.68::true_val(topsheet_appearance_description, bamboo_veneers_reduce_fg_resin); 0.32::true_val(topsheet_appearance_description, unk_topsheet_appearance_description).

measured(s115, topsheet_appearance_description, bamboo_veneers_reduce_fg_resin).

all_consistent(topsheet_appearance_description) :-
    consistent(s115, topsheet_appearance_description).

evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, bamboo_veneers_reduce_fg_resin)).
query(true_val(topsheet_appearance_description, unk_topsheet_appearance_description)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_eg=Sintered_EG_Base_Gallium_Electra unk_base_material=Unknown
% @importance 0.93

0.95::acc(s22, base_material).
0.90::acc(sm, base_material).

0.97::true_val(base_material, sintered_eg); 0.03::true_val(base_material, unk_base_material).

measured(s22, base_material, sintered_eg).
measured(sm, base_material, sintered_eg).

all_consistent(base_material) :-
    consistent(s22, base_material),
    (indep(sm), consistent(sm, base_material) ; \+indep(sm)).

evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_eg)).
query(true_val(base_material, unk_base_material)).

% @attr base_finish
% @type categorical
% @canonical false
% @original_name base_material (Fine Stone Finish)
% @values fine_stone_finish=Fine_Stone_Finish unk_base_finish=Unknown
% @importance 0.93

0.95::acc(s22, base_finish).
0.90::acc(sm, base_finish).

0.97::true_val(base_finish, fine_stone_finish); 0.03::true_val(base_finish, unk_base_finish).

measured(s22, base_finish, fine_stone_finish).
measured(sm, base_finish, fine_stone_finish).

all_consistent(base_finish) :-
    consistent(s22, base_finish),
    (indep(sm), consistent(sm, base_finish) ; \+indep(sm)).

evidence(all_consistent(base_finish)).
query(true_val(base_finish, fine_stone_finish)).
query(true_val(base_finish, unk_base_finish)).

% @attr sustainability_natural_wax
% @type categorical
% @canonical false
% @original_name sustainability_certification (Natural Wax)
% @values natural_wax_paraffin_free=Natural_wax_paraffin_free unk_sustainability_natural_wax=Unknown
% @importance 1.0

0.95::acc(s22, sustainability_natural_wax).
0.90::acc(sm, sustainability_natural_wax).

0.97::true_val(sustainability_natural_wax, natural_wax_paraffin_free); 0.03::true_val(sustainability_natural_wax, unk_sustainability_natural_wax).

measured(s22, sustainability_natural_wax, natural_wax_paraffin_free).
measured(sm, sustainability_natural_wax, natural_wax_paraffin_free).

all_consistent(sustainability_natural_wax) :-
    consistent(s22, sustainability_natural_wax),
    (indep(sm), consistent(sm, sustainability_natural_wax) ; \+indep(sm)).

evidence(all_consistent(sustainability_natural_wax)).
query(true_val(sustainability_natural_wax, natural_wax_paraffin_free)).
query(true_val(sustainability_natural_wax, unk_sustainability_natural_wax)).

% @attr edge_bevel_spec
% @type categorical
% @canonical true
% @original_name edge_bevel_spec
% @values am_bevel_1_5_deg=All_Mountain_1_5_degree_base_and_side unk_edge_bevel_spec=Unknown
% @importance 0.85

0.92::acc(sm, edge_bevel_spec).

0.95::true_val(edge_bevel_spec, am_bevel_1_5_deg); 0.05::true_val(edge_bevel_spec, unk_edge_bevel_spec).

measured(sm, edge_bevel_spec, am_bevel_1_5_deg).

all_consistent(edge_bevel_spec) :-
    (indep(sm), consistent(sm, edge_bevel_spec) ; \+indep(sm)).

evidence(all_consistent(edge_bevel_spec)).
query(true_val(edge_bevel_spec, am_bevel_1_5_deg)).
query(true_val(edge_bevel_spec, unk_edge_bevel_spec)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_inserts inserts_5x2=5x2_inserts_per_foot unk_mounting_pattern=Unknown
% @importance 0.83

0.82::acc(s24, mounting_pattern).
0.90::acc(sm, mounting_pattern).
0.85::acc(s52, mounting_pattern).

0.55::true_val(mounting_pattern, inserts_2x4); 0.40::true_val(mounting_pattern, inserts_5x2); 0.05::true_val(mounting_pattern, unk_mounting_pattern).

measured(s24, mounting_pattern, inserts_2x4).
measured(sm, mounting_pattern, inserts_2x4).
measured(s52, mounting_pattern, inserts_5x2).

all_consistent(mounting_pattern) :-
    (indep(s24), consistent(s24, mounting_pattern) ; \+indep(s24)),
    (indep(sm), consistent(sm, mounting_pattern) ; \+indep(sm)),
    consistent(s52, mounting_pattern).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, inserts_5x2)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr available_colors
% @type categorical
% @canonical true
% @original_name available_colors
% @values random=Random unk_available_colors=Unknown
% @importance 0.58

0.92::acc(sm, available_colors).
0.70::acc(s109, available_colors).

0.95::true_val(available_colors, random); 0.05::true_val(available_colors, unk_available_colors).

measured(sm, available_colors, random).
measured(s109, available_colors, random).

all_consistent(available_colors) :-
    (indep(sm), consistent(sm, available_colors) ; \+indep(sm)),
    (indep(s109), consistent(s109, available_colors) ; \+indep(s109)).

evidence(all_consistent(available_colors)).
query(true_val(available_colors, random)).
query(true_val(available_colors, unk_available_colors)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values s150_153_156_159_162=150_153_156_159_162cm unk_available_sizes=Unknown
% @importance 0.85

0.92::acc(sm, available_sizes).

0.95::true_val(available_sizes, s150_153_156_159_162); 0.05::true_val(available_sizes, unk_available_sizes).

measured(sm, available_sizes, s150_153_156_159_162).

all_consistent(available_sizes) :-
    (indep(sm), consistent(sm, available_sizes) ; \+indep(sm)).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, s150_153_156_159_162)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr available_sizes_wide
% @type categorical
% @canonical false
% @original_name available_sizes (wide)
% @values s158w_163w=158W_163W unk_available_sizes_wide=Unknown
% @importance 0.85

0.92::acc(sm, available_sizes_wide).

0.95::true_val(available_sizes_wide, s158w_163w); 0.05::true_val(available_sizes_wide, unk_available_sizes_wide).

measured(sm, available_sizes_wide, s158w_163w).

all_consistent(available_sizes_wide) :-
    (indep(sm), consistent(sm, available_sizes_wide) ; \+indep(sm)).

evidence(all_consistent(available_sizes_wide)).
query(true_val(available_sizes_wide, s158w_163w)).
query(true_val(available_sizes_wide, unk_available_sizes_wide)).

% @attr width_options
% @type categorical
% @canonical true
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 0.85

0.92::acc(sm, width_options).

0.95::true_val(width_options, standard_and_wide); 0.05::true_val(width_options, unk_width_options).

measured(sm, width_options, standard_and_wide).

all_consistent(width_options) :-
    (indep(sm), consistent(sm, width_options) ; \+indep(sm)).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

% @attr effective_edge_156
% @type numeric
% @canonical false
% @original_name Effective edge 156cm
% @unit cm
% @values v116_0=116.0 unk_effective_edge_156=Unknown
% @importance 0.85

0.92::acc(sm, effective_edge_156).

0.95::true_val(effective_edge_156, v116_0); 0.05::true_val(effective_edge_156, unk_effective_edge_156).

measured(sm, effective_edge_156, v116_0).

all_consistent(effective_edge_156) :-
    (indep(sm), consistent(sm, effective_edge_156) ; \+indep(sm)).

evidence(all_consistent(effective_edge_156)).
query(true_val(effective_edge_156, v116_0)).
query(true_val(effective_edge_156, unk_effective_edge_156)).

% @attr tip_tail_width_size
% @type numeric
% @canonical true
% @original_name tip_tail_width_size
% @unit cm
% @values v29_3=29.3 unk_tip_tail_width_size=Unknown
% @importance 0.85

0.92::acc(sm, tip_tail_width_size).

0.95::true_val(tip_tail_width_size, v29_3); 0.05::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(sm, tip_tail_width_size, v29_3).

all_consistent(tip_tail_width_size) :-
    (indep(sm), consistent(sm, tip_tail_width_size) ; \+indep(sm)).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v29_3)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr waist_width_156
% @type numeric
% @canonical false
% @original_name Waist width 156cm
% @unit cm
% @values v25_3=25.3 unk_waist_width_156=Unknown
% @importance 0.85

0.92::acc(sm, waist_width_156).

0.95::true_val(waist_width_156, v25_3); 0.05::true_val(waist_width_156, unk_waist_width_156).

measured(sm, waist_width_156, v25_3).

all_consistent(waist_width_156) :-
    (indep(sm), consistent(sm, waist_width_156) ; \+indep(sm)).

evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v25_3)).
query(true_val(waist_width_156, unk_waist_width_156)).

% @attr sidecut_radius_size
% @type numeric
% @canonical true
% @original_name sidecut_radius_size
% @unit m
% @values v7_5=7.5 unk_sidecut_radius_size=Unknown
% @importance 0.85

0.92::acc(sm, sidecut_radius_size).

0.95::true_val(sidecut_radius_size, v7_5); 0.05::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(sm, sidecut_radius_size, v7_5).

all_consistent(sidecut_radius_size) :-
    (indep(sm), consistent(sm, sidecut_radius_size) ; \+indep(sm)).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_5)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr stance_width_range_size
% @type numeric
% @canonical true
% @original_name stance_width_range_size
% @unit cm
% @values v56_0=56.0 unk_stance_width_range_size=Unknown
% @importance 0.85

0.92::acc(sm, stance_width_range_size).

0.95::true_val(stance_width_range_size, v56_0); 0.05::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(sm, stance_width_range_size, v56_0).

all_consistent(stance_width_range_size) :-
    (indep(sm), consistent(sm, stance_width_range_size) ; \+indep(sm)).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v56_0)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size
% @unit kg
% @values w55_85=55-85kg unk_recommended_weight_range_size=Unknown
% @importance 0.85

0.92::acc(sm, recommended_weight_range_size).

0.95::true_val(recommended_weight_range_size, w55_85); 0.05::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(sm, recommended_weight_range_size, w55_85).

all_consistent(recommended_weight_range_size) :-
    (indep(sm), consistent(sm, recommended_weight_range_size) ; \+indep(sm)).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w55_85)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr recommended_weight_range_size_159
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (159cm)
% @unit kg
% @values w65_90=65-90kg unk_recommended_weight_range_size_159=Unknown
% @importance 0.95

0.88::acc(sr, recommended_weight_range_size_159).

0.81::true_val(recommended_weight_range_size_159, w65_90); 0.19::true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159).

measured(sr, recommended_weight_range_size_159, w65_90).

all_consistent(recommended_weight_range_size_159) :-
    consistent(sr, recommended_weight_range_size_159).

evidence(all_consistent(recommended_weight_range_size_159)).
query(true_val(recommended_weight_range_size_159, w65_90)).
query(true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159)).

% @attr effective_edge_159
% @type numeric
% @canonical false
% @original_name REI effective edge 159cm
% @unit cm
% @values v118_8=118.8 unk_effective_edge_159=Unknown
% @importance 0.95

0.88::acc(sr, effective_edge_159).

0.81::true_val(effective_edge_159, v118_8); 0.19::true_val(effective_edge_159, unk_effective_edge_159).

measured(sr, effective_edge_159, v118_8).

all_consistent(effective_edge_159) :-
    consistent(sr, effective_edge_159).

evidence(all_consistent(effective_edge_159)).
query(true_val(effective_edge_159, v118_8)).
query(true_val(effective_edge_159, unk_effective_edge_159)).

% @attr waist_width_159
% @type numeric
% @canonical false
% @original_name REI waist width 159cm
% @unit cm
% @values v25_5=25.5 unk_waist_width_159=Unknown
% @importance 0.95

0.88::acc(sr, waist_width_159).

0.81::true_val(waist_width_159, v25_5); 0.19::true_val(waist_width_159, unk_waist_width_159).

measured(sr, waist_width_159, v25_5).

all_consistent(waist_width_159) :-
    consistent(sr, waist_width_159).

evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v25_5)).
query(true_val(waist_width_159, unk_waist_width_159)).

% @attr sidecut_radius_size_159
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (159cm)
% @unit m
% @values v7_7=7.7 unk_sidecut_radius_size_159=Unknown
% @importance 0.95

0.88::acc(sr, sidecut_radius_size_159).

0.81::true_val(sidecut_radius_size_159, v7_7); 0.19::true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159).

measured(sr, sidecut_radius_size_159, v7_7).

all_consistent(sidecut_radius_size_159) :-
    consistent(sr, sidecut_radius_size_159).

evidence(all_consistent(sidecut_radius_size_159)).
query(true_val(sidecut_radius_size_159, v7_7)).
query(true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values intermediate=Intermediate intermediate_advanced=Intermediate-Advanced
% @importance 0.83

0.85::acc(sm, skill_level_recommendation).
0.88::acc(sr, skill_level_recommendation).
0.82::acc(s20, skill_level_recommendation).
0.78::acc(s37, skill_level_recommendation).

0.20::true_val(skill_level_recommendation, intermediate); 0.80::true_val(skill_level_recommendation, intermediate_advanced).

measured(sm, skill_level_recommendation, intermediate).
measured(sr, skill_level_recommendation, intermediate_advanced).
measured(s20, skill_level_recommendation, intermediate_advanced).
measured(s37, skill_level_recommendation, intermediate_advanced).

all_consistent(skill_level_recommendation) :-
    (indep(sm), consistent(sm, skill_level_recommendation) ; \+indep(sm)),
    consistent(sr, skill_level_recommendation),
    consistent(s20, skill_level_recommendation),
    (indep(s37), consistent(s37, skill_level_recommendation) ; \+indep(s37)).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, intermediate)).
query(true_val(skill_level_recommendation, intermediate_advanced)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values am_park_freestyle_freeride=All-Mountain_Park_Freestyle_Freeride unk_terrain_suitability=Unknown
% @importance 0.85

0.82::acc(s24, terrain_suitability).
0.78::acc(s29, terrain_suitability).

0.95::true_val(terrain_suitability, am_park_freestyle_freeride); 0.05::true_val(terrain_suitability, unk_terrain_suitability).

measured(s24, terrain_suitability, am_park_freestyle_freeride).
measured(s29, terrain_suitability, am_park_freestyle_freeride).

all_consistent(terrain_suitability) :-
    (indep(s24), consistent(s24, terrain_suitability) ; \+indep(s24)),
    (indep(s29), consistent(s29, terrain_suitability) ; \+indep(s29)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, am_park_freestyle_freeride)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr terrain_suitability_powder
% @type categorical
% @canonical false
% @original_name terrain_suitability (Powder emphasis)
% @values powder_am_park_freestyle=Powder_All-Mountain_Park_Freestyle unk_terrain_suitability_powder=Unknown
% @importance 0.85

0.88::acc(s110, terrain_suitability_powder).

0.85::true_val(terrain_suitability_powder, powder_am_park_freestyle); 0.15::true_val(terrain_suitability_powder, unk_terrain_suitability_powder).

measured(s110, terrain_suitability_powder, powder_am_park_freestyle).

all_consistent(terrain_suitability_powder) :-
    (indep(s110), consistent(s110, terrain_suitability_powder) ; \+indep(s110)).

evidence(all_consistent(terrain_suitability_powder)).
query(true_val(terrain_suitability_powder, powder_am_park_freestyle)).
query(true_val(terrain_suitability_powder, unk_terrain_suitability_powder)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values freestyle_fwd_all_mtn=Freestyle-forward_all-mountain unk_riding_style=Unknown
% @importance 0.78

0.82::acc(s9, riding_style).
0.80::acc(s42, riding_style).

0.90::true_val(riding_style, freestyle_fwd_all_mtn); 0.10::true_val(riding_style, unk_riding_style).

measured(s9, riding_style, freestyle_fwd_all_mtn).
measured(s42, riding_style, freestyle_fwd_all_mtn).

all_consistent(riding_style) :-
    consistent(s9, riding_style),
    consistent(s42, riding_style).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, freestyle_fwd_all_mtn)).
query(true_val(riding_style, unk_riding_style)).

% @attr terrain_suitability_quiver
% @type categorical
% @canonical false
% @original_name terrain_suitability (one-board quiver)
% @values one_board_quiver=One-board_quiver_all_conditions unk_terrain_suitability_quiver=Unknown
% @importance 0.93

0.95::acc(s22, terrain_suitability_quiver).
0.70::acc(s1, terrain_suitability_quiver).

0.95::true_val(terrain_suitability_quiver, one_board_quiver); 0.05::true_val(terrain_suitability_quiver, unk_terrain_suitability_quiver).

measured(s22, terrain_suitability_quiver, one_board_quiver).
measured(s1, terrain_suitability_quiver, one_board_quiver).

all_consistent(terrain_suitability_quiver) :-
    consistent(s22, terrain_suitability_quiver),
    (indep(s1), consistent(s1, terrain_suitability_quiver) ; \+indep(s1)).

evidence(all_consistent(terrain_suitability_quiver)).
query(true_val(terrain_suitability_quiver, one_board_quiver)).
query(true_val(terrain_suitability_quiver, unk_terrain_suitability_quiver)).

% @attr terrain_suitability_specific
% @type categorical
% @canonical false
% @original_name terrain_suitability (specific terrain list)
% @values groomers_park_powder_sidehits_bc=Groomers_park_powder_side_hits_backcountry unk_terrain_suitability_specific=Unknown
% @importance 0.85

0.82::acc(s9, terrain_suitability_specific).

0.69::true_val(terrain_suitability_specific, groomers_park_powder_sidehits_bc); 0.31::true_val(terrain_suitability_specific, unk_terrain_suitability_specific).

measured(s9, terrain_suitability_specific, groomers_park_powder_sidehits_bc).

all_consistent(terrain_suitability_specific) :-
    consistent(s9, terrain_suitability_specific).

evidence(all_consistent(terrain_suitability_specific)).
query(true_val(terrain_suitability_specific, groomers_park_powder_sidehits_bc)).
query(true_val(terrain_suitability_specific, unk_terrain_suitability_specific)).

% @attr terrain_suitability_versatile
% @type categorical
% @canonical false
% @original_name terrain_suitability (versatile)
% @values versatile_all_conditions=Versatile_across_all_conditions unk_terrain_suitability_versatile=Unknown
% @importance 0.85

0.82::acc(s44, terrain_suitability_versatile).

0.68::true_val(terrain_suitability_versatile, versatile_all_conditions); 0.32::true_val(terrain_suitability_versatile, unk_terrain_suitability_versatile).

measured(s44, terrain_suitability_versatile, versatile_all_conditions).

all_consistent(terrain_suitability_versatile) :-
    consistent(s44, terrain_suitability_versatile).

evidence(all_consistent(terrain_suitability_versatile)).
query(true_val(terrain_suitability_versatile, versatile_all_conditions)).
query(true_val(terrain_suitability_versatile, unk_terrain_suitability_versatile)).

% @attr setback
% @type categorical
% @canonical true
% @original_name setback
% @values centered=Centered unk_setback=Unknown
% @importance 0.95

0.90::acc(sr, setback).

0.81::true_val(setback, centered); 0.19::true_val(setback, unk_setback).

measured(sr, setback, centered).

all_consistent(setback) :-
    consistent(sr, setback).

evidence(all_consistent(setback)).
query(true_val(setback, centered)).
query(true_val(setback, unk_setback)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values very_good=Very_good_edge_grip unk_edge_hold=Unknown
% @importance 0.80

0.78::acc(s15, edge_hold).
0.82::acc(s44, edge_hold).

0.90::true_val(edge_hold, very_good); 0.10::true_val(edge_hold, unk_edge_hold).

measured(s15, edge_hold, very_good).
measured(s44, edge_hold, very_good).

all_consistent(edge_hold) :-
    consistent(s15, edge_hold),
    consistent(s44, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, very_good)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr pop
% @type categorical
% @canonical true
% @original_name pop
% @values skate_like_good_height=Skate-like_feel_pop_good_height unk_pop=Unknown
% @importance 0.80

0.78::acc(s15, pop).
0.82::acc(s44, pop).

0.90::true_val(pop, skate_like_good_height); 0.10::true_val(pop, unk_pop).

measured(s15, pop, skate_like_good_height).
measured(s44, pop, skate_like_good_height).

all_consistent(pop) :-
    consistent(s15, pop),
    consistent(s44, pop).

evidence(all_consistent(pop)).
query(true_val(pop, skate_like_good_height)).
query(true_val(pop, unk_pop)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values fast=Fast_sintered_EG_base unk_base_glide_performance=Unknown
% @importance 0.75

0.75::acc(s50, base_glide_performance).

0.55::true_val(base_glide_performance, fast); 0.45::true_val(base_glide_performance, unk_base_glide_performance).

measured(s50, base_glide_performance, fast).

all_consistent(base_glide_performance) :-
    consistent(s50, base_glide_performance).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, fast)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values excellent_all_rounder=Excellent_all-rounder_Swiss_army_knife unk_positive_aspect=Unknown
% @importance 0.85

0.85::acc(s44, positive_aspect).

0.68::true_val(positive_aspect, excellent_all_rounder); 0.32::true_val(positive_aspect, unk_positive_aspect).

measured(s44, positive_aspect, excellent_all_rounder).

all_consistent(positive_aspect) :-
    consistent(s44, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, excellent_all_rounder)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr powder_rating_tgr
% @type categorical
% @canonical true
% @original_name powder_rating_tgr
% @values better_than_expected=Better_than_expected_for_twin unk_powder_rating_tgr=Unknown
% @importance 0.80

0.78::acc(s50, powder_rating_tgr).
0.82::acc(s44, powder_rating_tgr).

0.88::true_val(powder_rating_tgr, better_than_expected); 0.12::true_val(powder_rating_tgr, unk_powder_rating_tgr).

measured(s50, powder_rating_tgr, better_than_expected).
measured(s44, powder_rating_tgr, better_than_expected).

all_consistent(powder_rating_tgr) :-
    consistent(s50, powder_rating_tgr),
    consistent(s44, powder_rating_tgr).

evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, better_than_expected)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

% @attr positive_aspect_park
% @type categorical
% @canonical false
% @original_name positive_aspect (park performance)
% @values rails_well_tail_snap=Locks_into_rails_good_tail_snap_for_kickers unk_positive_aspect_park=Unknown
% @importance 0.85

0.82::acc(s44, positive_aspect_park).

0.68::true_val(positive_aspect_park, rails_well_tail_snap); 0.32::true_val(positive_aspect_park, unk_positive_aspect_park).

measured(s44, positive_aspect_park, rails_well_tail_snap).

all_consistent(positive_aspect_park) :-
    consistent(s44, positive_aspect_park).

evidence(all_consistent(positive_aspect_park)).
query(true_val(positive_aspect_park, rails_well_tail_snap)).
query(true_val(positive_aspect_park, unk_positive_aspect_park)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values great=Great_due_to_directional_twin unk_switch_riding=Unknown
% @importance 0.70

0.80::acc(s42, switch_riding).

0.62::true_val(switch_riding, great); 0.38::true_val(switch_riding, unk_switch_riding).

measured(s42, switch_riding, great).

all_consistent(switch_riding) :-
    consistent(s42, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, great)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr chatter_performance
% @type categorical
% @canonical true
% @original_name chatter_performance
% @values good_damping=Good_vibration_absorption_more_damp_than_Pro unk_chatter_performance=Unknown
% @importance 0.80

0.82::acc(s52, chatter_performance).

0.68::true_val(chatter_performance, good_damping); 0.32::true_val(chatter_performance, unk_chatter_performance).

measured(s52, chatter_performance, good_damping).

all_consistent(chatter_performance) :-
    consistent(s52, chatter_performance).

evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, good_damping)).
query(true_val(chatter_performance, unk_chatter_performance)).

% @attr positive_aspect_weight
% @type categorical
% @canonical false
% @original_name positive_aspect (lighter than average)
% @values lighter_than_avg=Just_a_little_lighter_than_average unk_positive_aspect_weight=Unknown
% @importance 0.70

0.72::acc(s53, positive_aspect_weight).

0.55::true_val(positive_aspect_weight, lighter_than_avg); 0.45::true_val(positive_aspect_weight, unk_positive_aspect_weight).

measured(s53, positive_aspect_weight, lighter_than_avg).

all_consistent(positive_aspect_weight) :-
    consistent(s53, positive_aspect_weight).

evidence(all_consistent(positive_aspect_weight)).
query(true_val(positive_aspect_weight, lighter_than_avg)).
query(true_val(positive_aspect_weight, unk_positive_aspect_weight)).

% @attr positive_aspect_groomers
% @type categorical
% @canonical false
% @original_name positive_aspect (groomers performance)
% @values snappy_responsive_stable=Super_snappy_responsive_stable_on_groomers unk_positive_aspect_groomers=Unknown
% @importance 0.85

0.82::acc(s44, positive_aspect_groomers).

0.68::true_val(positive_aspect_groomers, snappy_responsive_stable); 0.32::true_val(positive_aspect_groomers, unk_positive_aspect_groomers).

measured(s44, positive_aspect_groomers, snappy_responsive_stable).

all_consistent(positive_aspect_groomers) :-
    consistent(s44, positive_aspect_groomers).

evidence(all_consistent(positive_aspect_groomers)).
query(true_val(positive_aspect_groomers, snappy_responsive_stable)).
query(true_val(positive_aspect_groomers, unk_positive_aspect_groomers)).

% @attr edge_hold_icy
% @type categorical
% @canonical false
% @original_name edge_hold (icy conditions)
% @values bites_through_chopped_icy=Bites_through_snow_in_chopped_icy_conditions unk_edge_hold_icy=Unknown
% @importance 0.85

0.82::acc(s44, edge_hold_icy).

0.68::true_val(edge_hold_icy, bites_through_chopped_icy); 0.32::true_val(edge_hold_icy, unk_edge_hold_icy).

measured(s44, edge_hold_icy, bites_through_chopped_icy).

all_consistent(edge_hold_icy) :-
    consistent(s44, edge_hold_icy).

evidence(all_consistent(edge_hold_icy)).
query(true_val(edge_hold_icy, bites_through_chopped_icy)).
query(true_val(edge_hold_icy, unk_edge_hold_icy)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values forgiving_torsional=Forgiving_torsional_flex_helps_maneuverability unk_turn_initiation_performance=Unknown
% @importance 0.85

0.82::acc(s44, turn_initiation_performance).

0.68::true_val(turn_initiation_performance, forgiving_torsional); 0.32::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s44, turn_initiation_performance, forgiving_torsional).

all_consistent(turn_initiation_performance) :-
    consistent(s44, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, forgiving_torsional)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values stiff_for_novices=Stiffness_difficult_for_novice_riders unk_negative_aspect=Unknown
% @importance 0.85

0.82::acc(s44, negative_aspect).

0.68::true_val(negative_aspect, stiff_for_novices); 0.32::true_val(negative_aspect, unk_negative_aspect).

measured(s44, negative_aspect, stiff_for_novices).

all_consistent(negative_aspect) :-
    consistent(s44, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, stiff_for_novices)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_washout
% @type categorical
% @canonical false
% @original_name negative_aspect (turn wash-out)
% @values washout_undersized=Wash-out_during_turns_when_undersized unk_negative_aspect_washout=Unknown
% @importance 0.70

0.75::acc(s58, negative_aspect_washout).

0.64::true_val(negative_aspect_washout, washout_undersized); 0.36::true_val(negative_aspect_washout, unk_negative_aspect_washout).

measured(s58, negative_aspect_washout, washout_undersized).

all_consistent(negative_aspect_washout) :-
    consistent(s58, negative_aspect_washout).

evidence(all_consistent(negative_aspect_washout)).
query(true_val(negative_aspect_washout, washout_undersized)).
query(true_val(negative_aspect_washout, unk_negative_aspect_washout)).

% @attr chatter_performance_tips
% @type categorical
% @canonical false
% @original_name chatter_performance (tips at high speed)
% @values tips_chattery_high_speed=Tips_chattery_due_to_rocker_at_very_high_speed unk_chatter_performance_tips=Unknown
% @importance 0.70

0.50::acc(s71, chatter_performance_tips).

0.30::true_val(chatter_performance_tips, tips_chattery_high_speed); 0.70::true_val(chatter_performance_tips, unk_chatter_performance_tips).

measured(s71, chatter_performance_tips, tips_chattery_high_speed).

all_consistent(chatter_performance_tips) :-
    consistent(s71, chatter_performance_tips).

evidence(all_consistent(chatter_performance_tips)).
query(true_val(chatter_performance_tips, tips_chattery_high_speed)).
query(true_val(chatter_performance_tips, unk_chatter_performance_tips)).

% @attr negative_aspect_carving
% @type categorical
% @canonical false
% @original_name negative_aspect (carving)
% @values not_carving_machine=Not_a_carving_machine_but_decent unk_negative_aspect_carving=Unknown
% @importance 0.80

0.82::acc(s13, negative_aspect_carving).

0.72::true_val(negative_aspect_carving, not_carving_machine); 0.28::true_val(negative_aspect_carving, unk_negative_aspect_carving).

measured(s13, negative_aspect_carving, not_carving_machine).

all_consistent(negative_aspect_carving) :-
    consistent(s13, negative_aspect_carving).

evidence(all_consistent(negative_aspect_carving)).
query(true_val(negative_aspect_carving, not_carving_machine)).
query(true_val(negative_aspect_carving, unk_negative_aspect_carving)).

% @attr negative_aspect_technical
% @type categorical
% @canonical false
% @original_name negative_aspect (technical scenarios)
% @values limited_precision_technical=May_not_meet_expectations_in_technical_scenarios unk_negative_aspect_technical=Unknown
% @importance 0.80

0.82::acc(s13, negative_aspect_technical).

0.72::true_val(negative_aspect_technical, limited_precision_technical); 0.28::true_val(negative_aspect_technical, unk_negative_aspect_technical).

measured(s13, negative_aspect_technical, limited_precision_technical).

all_consistent(negative_aspect_technical) :-
    consistent(s13, negative_aspect_technical).

evidence(all_consistent(negative_aspect_technical)).
query(true_val(negative_aspect_technical, limited_precision_technical)).
query(true_val(negative_aspect_technical, unk_negative_aspect_technical)).

% @attr negative_aspect_ice
% @type categorical
% @canonical false
% @original_name negative_aspect (sheet ice)
% @values sidecut_weak_on_ice=Sidecut_grips_well_up_to_hard_snow_not_sheet_ice unk_negative_aspect_ice=Unknown
% @importance 0.70

0.50::acc(s71, negative_aspect_ice).

0.30::true_val(negative_aspect_ice, sidecut_weak_on_ice); 0.70::true_val(negative_aspect_ice, unk_negative_aspect_ice).

measured(s71, negative_aspect_ice, sidecut_weak_on_ice).

all_consistent(negative_aspect_ice) :-
    consistent(s71, negative_aspect_ice).

evidence(all_consistent(negative_aspect_ice)).
query(true_val(negative_aspect_ice, sidecut_weak_on_ice)).
query(true_val(negative_aspect_ice, unk_negative_aspect_ice)).

% @attr negative_aspect_powder
% @type categorical
% @canonical false
% @original_name negative_aspect (powder on 2018 model)
% @values powder_weakest_point=Powder_weakest_point_on_pre_2019_twin_improved_since unk_negative_aspect_powder=Unknown
% @importance 0.70

0.65::acc(s53, negative_aspect_powder).

0.46::true_val(negative_aspect_powder, powder_weakest_point); 0.54::true_val(negative_aspect_powder, unk_negative_aspect_powder).

measured(s53, negative_aspect_powder, powder_weakest_point).

all_consistent(negative_aspect_powder) :-
    consistent(s53, negative_aspect_powder).

evidence(all_consistent(negative_aspect_powder)).
query(true_val(negative_aspect_powder, powder_weakest_point)).
query(true_val(negative_aspect_powder, unk_negative_aspect_powder)).

% @attr jibbing_rating_tgr
% @type categorical
% @canonical true
% @original_name jibbing_rating_tgr
% @values above_average=Not_king_of_jibs_but_above_average unk_jibbing_rating_tgr=Unknown
% @importance 0.70

0.80::acc(s42, jibbing_rating_tgr).

0.62::true_val(jibbing_rating_tgr, above_average); 0.38::true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr).

measured(s42, jibbing_rating_tgr, above_average).

all_consistent(jibbing_rating_tgr) :-
    consistent(s42, jibbing_rating_tgr).

evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, above_average)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr)).

% @attr topsheet_durability_issue
% @type categorical
% @canonical false
% @original_name One REI reviewer noted topsheet chips/scrapes easily
% @values chips_easily=Topsheet_chips_scrapes_easily_on_first_ride unk_topsheet_durability_issue=Unknown
% @importance 0.95

0.70::acc(sr, topsheet_durability_issue).

0.65::true_val(topsheet_durability_issue, chips_easily); 0.35::true_val(topsheet_durability_issue, unk_topsheet_durability_issue).

measured(sr, topsheet_durability_issue, chips_easily).

all_consistent(topsheet_durability_issue) :-
    consistent(sr, topsheet_durability_issue).

evidence(all_consistent(topsheet_durability_issue)).
query(true_val(topsheet_durability_issue, chips_easily)).
query(true_val(topsheet_durability_issue, unk_topsheet_durability_issue)).

% @attr assassin_pro_flex
% @type categorical
% @canonical false
% @original_name Assassin Pro flex rating
% @values five_of_five=5_of_5_stiffer_than_standard unk_assassin_pro_flex=Unknown
% @importance 0.60

0.78::acc(s10, assassin_pro_flex).

0.63::true_val(assassin_pro_flex, five_of_five); 0.37::true_val(assassin_pro_flex, unk_assassin_pro_flex).

measured(s10, assassin_pro_flex, five_of_five).

all_consistent(assassin_pro_flex) :-
    consistent(s10, assassin_pro_flex).

evidence(all_consistent(assassin_pro_flex)).
query(true_val(assassin_pro_flex, five_of_five)).
query(true_val(assassin_pro_flex, unk_assassin_pro_flex)).

% @attr assassin_pro_core
% @type categorical
% @canonical false
% @original_name Assassin Pro core material
% @values ghost_green_core=Ghost_Green_Core_lighter unk_assassin_pro_core=Unknown
% @importance 0.65

0.80::acc(s25, assassin_pro_core).

0.68::true_val(assassin_pro_core, ghost_green_core); 0.32::true_val(assassin_pro_core, unk_assassin_pro_core).

measured(s25, assassin_pro_core, ghost_green_core).

all_consistent(assassin_pro_core) :-
    consistent(s25, assassin_pro_core).

evidence(all_consistent(assassin_pro_core)).
query(true_val(assassin_pro_core, ghost_green_core)).
query(true_val(assassin_pro_core, unk_assassin_pro_core)).

% @attr assassin_pro_inserts
% @type categorical
% @canonical false
% @original_name Assassin Pro insert count
% @values six_x_two=6x2_inserts_per_foot_vs_Assassin_5x2 unk_assassin_pro_inserts=Unknown
% @importance 0.70

0.82::acc(s57, assassin_pro_inserts).

0.69::true_val(assassin_pro_inserts, six_x_two); 0.31::true_val(assassin_pro_inserts, unk_assassin_pro_inserts).

measured(s57, assassin_pro_inserts, six_x_two).

all_consistent(assassin_pro_inserts) :-
    consistent(s57, assassin_pro_inserts).

evidence(all_consistent(assassin_pro_inserts)).
query(true_val(assassin_pro_inserts, six_x_two)).
query(true_val(assassin_pro_inserts, unk_assassin_pro_inserts)).

% @attr assassin_pro_chatter
% @type categorical
% @canonical false
% @original_name Assassin Pro chatter issues
% @values had_chatter_improved_2025=Chatter_in_uneven_snow_improved_with_ABS_2025 unk_assassin_pro_chatter=Unknown
% @importance 0.70

0.80::acc(s57, assassin_pro_chatter).

0.69::true_val(assassin_pro_chatter, had_chatter_improved_2025); 0.31::true_val(assassin_pro_chatter, unk_assassin_pro_chatter).

measured(s57, assassin_pro_chatter, had_chatter_improved_2025).

all_consistent(assassin_pro_chatter) :-
    consistent(s57, assassin_pro_chatter).

evidence(all_consistent(assassin_pro_chatter)).
query(true_val(assassin_pro_chatter, had_chatter_improved_2025)).
query(true_val(assassin_pro_chatter, unk_assassin_pro_chatter)).

% @attr assassin_vs_pro_damping
% @type categorical
% @canonical false
% @original_name Assassin vs Pro damping comparison
% @values standard_more_damp=Standard_Assassin_more_damp_chatter_resistant_than_Pro unk_assassin_vs_pro_damping=Unknown
% @importance 0.80

0.82::acc(s52, assassin_vs_pro_damping).

0.68::true_val(assassin_vs_pro_damping, standard_more_damp); 0.32::true_val(assassin_vs_pro_damping, unk_assassin_vs_pro_damping).

measured(s52, assassin_vs_pro_damping, standard_more_damp).

all_consistent(assassin_vs_pro_damping) :-
    consistent(s52, assassin_vs_pro_damping).

evidence(all_consistent(assassin_vs_pro_damping)).
query(true_val(assassin_vs_pro_damping, standard_more_damp)).
query(true_val(assassin_vs_pro_damping, unk_assassin_vs_pro_damping)).

% @attr comparable_board_same_brand_aud
% @type numeric
% @canonical false
% @original_name comparable_board_same_brand (AUD Pro price)
% @unit AUD
% @values v1089_99=1089.99 unk_comparable_board_same_brand_aud=Unknown
% @importance 0.70

0.80::acc(s105, comparable_board_same_brand_aud).

0.64::true_val(comparable_board_same_brand_aud, v1089_99); 0.36::true_val(comparable_board_same_brand_aud, unk_comparable_board_same_brand_aud).

measured(s105, comparable_board_same_brand_aud, v1089_99).

all_consistent(comparable_board_same_brand_aud) :-
    consistent(s105, comparable_board_same_brand_aud).

evidence(all_consistent(comparable_board_same_brand_aud)).
query(true_val(comparable_board_same_brand_aud, v1089_99)).
query(true_val(comparable_board_same_brand_aud, unk_comparable_board_same_brand_aud)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values ns_photo_yes_greats_twinpig_good_co_typo=NS_Photosynthesis_Yes_Greats_Ride_TwinPig_Burton_Good_Company_Yes_Typo unk_comparable_board_cross_brand=Unknown
% @importance 0.80

0.82::acc(s52, comparable_board_cross_brand).

0.68::true_val(comparable_board_cross_brand, ns_photo_yes_greats_twinpig_good_co_typo); 0.32::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s52, comparable_board_cross_brand, ns_photo_yes_greats_twinpig_good_co_typo).

all_consistent(comparable_board_cross_brand) :-
    consistent(s52, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, ns_photo_yes_greats_twinpig_good_co_typo)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_freeride
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (freeride alternatives)
% @values korua_otto_ride_algo_shadowban_highpath_rally=Korua_Otto_Ride_Algorythm_Shadowban_Salomon_Highpath_Jones_Rally_Cat unk_comparable_board_cross_brand_freeride=Unknown
% @importance 0.80

0.82::acc(s52, comparable_board_cross_brand_freeride).

0.68::true_val(comparable_board_cross_brand_freeride, korua_otto_ride_algo_shadowban_highpath_rally); 0.32::true_val(comparable_board_cross_brand_freeride, unk_comparable_board_cross_brand_freeride).

measured(s52, comparable_board_cross_brand_freeride, korua_otto_ride_algo_shadowban_highpath_rally).

all_consistent(comparable_board_cross_brand_freeride) :-
    consistent(s52, comparable_board_cross_brand_freeride).

evidence(all_consistent(comparable_board_cross_brand_freeride)).
query(true_val(comparable_board_cross_brand_freeride, korua_otto_ride_algo_shadowban_highpath_rally)).
query(true_val(comparable_board_cross_brand_freeride, unk_comparable_board_cross_brand_freeride)).

% @attr comparable_board_cross_brand_mercury
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Capita Mercury)
% @values capita_mercury=Capita_Mercury_alternative_to_Pro unk_comparable_board_cross_brand_mercury=Unknown
% @importance 0.60

0.70::acc(s80, comparable_board_cross_brand_mercury).

0.52::true_val(comparable_board_cross_brand_mercury, capita_mercury); 0.48::true_val(comparable_board_cross_brand_mercury, unk_comparable_board_cross_brand_mercury).

measured(s80, comparable_board_cross_brand_mercury, capita_mercury).

all_consistent(comparable_board_cross_brand_mercury) :-
    consistent(s80, comparable_board_cross_brand_mercury).

evidence(all_consistent(comparable_board_cross_brand_mercury)).
query(true_val(comparable_board_cross_brand_mercury, capita_mercury)).
query(true_val(comparable_board_cross_brand_mercury, unk_comparable_board_cross_brand_mercury)).

% @attr comparable_board_cross_brand_super_doa
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Capita Super DOA)
% @values capita_super_doa=Capita_Super_DOA_similar_profile_flex_lighter unk_comparable_board_cross_brand_super_doa=Unknown
% @importance 0.60

0.70::acc(s80, comparable_board_cross_brand_super_doa).

0.52::true_val(comparable_board_cross_brand_super_doa, capita_super_doa); 0.48::true_val(comparable_board_cross_brand_super_doa, unk_comparable_board_cross_brand_super_doa).

measured(s80, comparable_board_cross_brand_super_doa, capita_super_doa).

all_consistent(comparable_board_cross_brand_super_doa) :-
    consistent(s80, comparable_board_cross_brand_super_doa).

evidence(all_consistent(comparable_board_cross_brand_super_doa)).
query(true_val(comparable_board_cross_brand_super_doa, capita_super_doa)).
query(true_val(comparable_board_cross_brand_super_doa, unk_comparable_board_cross_brand_super_doa)).

% @attr reviewer_opinion_the_good_ride
% @type numeric
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @unit /5
% @values v4_8=4.8 unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.85

0.78::acc(s36, reviewer_opinion_the_good_ride).

0.60::true_val(reviewer_opinion_the_good_ride, v4_8); 0.40::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s36, reviewer_opinion_the_good_ride, v4_8).

all_consistent(reviewer_opinion_the_good_ride) :-
    consistent(s36, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, v4_8)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr user_review_forum
% @type numeric
% @canonical true
% @original_name user_review_forum
% @unit /5
% @values v4_5=4.5 unk_user_review_forum=Unknown
% @importance 0.95

0.85::acc(sr, user_review_forum).

0.81::true_val(user_review_forum, v4_5); 0.19::true_val(user_review_forum, unk_user_review_forum).

measured(sr, user_review_forum, v4_5).

all_consistent(user_review_forum) :-
    consistent(sr, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, v4_5)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr user_review_forum_consensus
% @type categorical
% @canonical false
% @original_name user_review_forum (qualitative consensus)
% @values positive_great_am=Positive_consensus_great_all-mountain_board unk_user_review_forum_consensus=Unknown
% @importance 0.75

0.78::acc(s15, user_review_forum_consensus).

0.55::true_val(user_review_forum_consensus, positive_great_am); 0.45::true_val(user_review_forum_consensus, unk_user_review_forum_consensus).

measured(s15, user_review_forum_consensus, positive_great_am).

all_consistent(user_review_forum_consensus) :-
    consistent(s15, user_review_forum_consensus).

evidence(all_consistent(user_review_forum_consensus)).
query(true_val(user_review_forum_consensus, positive_great_am)).
query(true_val(user_review_forum_consensus, unk_user_review_forum_consensus)).