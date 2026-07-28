0.15::indep(s_merchant).
0.15::indep(s2).
0.15::indep(s24).
0.15::indep(s25).
0.15::indep(s26).
0.15::indep(s27).
0.15::indep(s28).
0.20::indep(s22).
0.15::indep(s23).
0.10::indep(s29).
0.25::indep(s30).
0.20::indep(s12).
0.30::indep(s21).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values ride=Ride unk_brand=Unknown
% @importance 0.90

0.95::acc(s1, brand).
0.70::acc(s2, brand).

0.97::true_val(brand, ride); 0.03::true_val(brand, unk_brand).

measured(s1, brand, ride).
measured(s2, brand, ride).

all_consistent(brand) :-
    consistent(s1, brand),
    (indep(s2), consistent(s2, brand) ; \+indep(s2)).

evidence(all_consistent(brand)).
query(true_val(brand, ride)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values shadowban=Shadowban unk_model_name=Unknown
% @importance 0.90

0.95::acc(s1, model_name).
0.70::acc(s2, model_name).

0.97::true_val(model_name, shadowban); 0.03::true_val(model_name, unk_model_name).

measured(s1, model_name, shadowban).
measured(s2, model_name, shadowban).

all_consistent(model_name) :-
    consistent(s1, model_name),
    (indep(s2), consistent(s2, model_name) ; \+indep(s2)).

evidence(all_consistent(model_name)).
query(true_val(model_name, shadowban)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2027=2027 unk_model_year=Unknown
% @importance 0.85

0.90::acc(s_merchant, model_year).

0.90::true_val(model_year, y2027); 0.10::true_val(model_year, unk_model_year).

measured(s_merchant, model_year, y2027).

all_consistent(model_year) :-
    consistent(s_merchant, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2027)).
query(true_val(model_year, unk_model_year)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.90

0.95::acc(s1, product_type).
0.70::acc(s2, product_type).

0.97::true_val(product_type, snowboard); 0.03::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).
measured(s2, product_type, snowboard).

all_consistent(product_type) :-
    consistent(s1, product_type),
    (indep(s2), consistent(s2, product_type) ; \+indep(s2)).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr manufacturer_founded
% @type categorical
% @canonical false
% @original_name Manufacturer founded
% @values sept_1992_redmond_wa=September_1992_Redmond_WA unk_manufacturer_founded=Unknown
% @importance 0.375

0.92::acc(s3, manufacturer_founded).
0.75::acc(s4, manufacturer_founded).

0.95::true_val(manufacturer_founded, sept_1992_redmond_wa); 0.05::true_val(manufacturer_founded, unk_manufacturer_founded).

measured(s3, manufacturer_founded, sept_1992_redmond_wa).
measured(s4, manufacturer_founded, sept_1992_redmond_wa).

all_consistent(manufacturer_founded) :-
    consistent(s3, manufacturer_founded),
    consistent(s4, manufacturer_founded).

evidence(all_consistent(manufacturer_founded)).
query(true_val(manufacturer_founded, sept_1992_redmond_wa)).
query(true_val(manufacturer_founded, unk_manufacturer_founded)).

% @attr founders
% @type categorical
% @canonical false
% @original_name Founders
% @values madison_salter_pogue=Roger_Madison_James_Salter_Tim_Pogue unk_founders=Unknown
% @importance 0.375

0.92::acc(s3, founders).
0.75::acc(s4, founders).

0.95::true_val(founders, madison_salter_pogue); 0.05::true_val(founders, unk_founders).

measured(s3, founders, madison_salter_pogue).
measured(s4, founders, madison_salter_pogue).

all_consistent(founders) :-
    consistent(s3, founders),
    consistent(s4, founders).

evidence(all_consistent(founders)).
query(true_val(founders, madison_salter_pogue)).
query(true_val(founders, unk_founders)).

% @attr current_headquarters
% @type categorical
% @canonical false
% @original_name Current headquarters
% @values seattle_wa=Seattle_Washington unk_current_headquarters=Unknown
% @importance 0.30

0.82::acc(s5, current_headquarters).

0.68::true_val(current_headquarters, seattle_wa); 0.32::true_val(current_headquarters, unk_current_headquarters).

measured(s5, current_headquarters, seattle_wa).

all_consistent(current_headquarters) :-
    consistent(s5, current_headquarters).

evidence(all_consistent(current_headquarters)).
query(true_val(current_headquarters, seattle_wa)).
query(true_val(current_headquarters, unk_current_headquarters)).

% @attr parent_company
% @type categorical
% @canonical false
% @original_name Parent company
% @values elevate_outdoor_collective=Elevate_Outdoor_Collective unk_parent_company=Unknown
% @importance 0.40

0.85::acc(s6, parent_company).

0.76::true_val(parent_company, elevate_outdoor_collective); 0.24::true_val(parent_company, unk_parent_company).

measured(s6, parent_company, elevate_outdoor_collective).

all_consistent(parent_company) :-
    consistent(s6, parent_company).

evidence(all_consistent(parent_company)).
query(true_val(parent_company, elevate_outdoor_collective)).
query(true_val(parent_company, unk_parent_company)).

% @attr ultimate_owner
% @type categorical
% @canonical false
% @original_name Ultimate owner
% @values kohlberg_and_company=Kohlberg_and_Company unk_ultimate_owner=Unknown
% @importance 0.30

0.80::acc(s7, ultimate_owner).
0.82::acc(s8, ultimate_owner).

0.95::true_val(ultimate_owner, kohlberg_and_company); 0.05::true_val(ultimate_owner, unk_ultimate_owner).

measured(s7, ultimate_owner, kohlberg_and_company).
measured(s8, ultimate_owner, kohlberg_and_company).

all_consistent(ultimate_owner) :-
    consistent(s7, ultimate_owner),
    consistent(s8, ultimate_owner).

evidence(all_consistent(ultimate_owner)).
query(true_val(ultimate_owner, kohlberg_and_company)).
query(true_val(ultimate_owner, unk_ultimate_owner)).

% @attr manufacturer_heritage
% @type categorical
% @canonical false
% @original_name Manufacturer heritage
% @values over_30_years=Over_30_years unk_manufacturer_heritage=Unknown
% @importance 0.30

0.80::acc(s9, manufacturer_heritage).

0.72::true_val(manufacturer_heritage, over_30_years); 0.28::true_val(manufacturer_heritage, unk_manufacturer_heritage).

measured(s9, manufacturer_heritage, over_30_years).

all_consistent(manufacturer_heritage) :-
    consistent(s9, manufacturer_heritage).

evidence(all_consistent(manufacturer_heritage)).
query(true_val(manufacturer_heritage, over_30_years)).
query(true_val(manufacturer_heritage, unk_manufacturer_heritage)).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values asia_based=Asia_based_facility unk_manufacturing_location_current=Unknown
% @importance 0.45

0.85::acc(s10, manufacturing_location_current).

0.72::true_val(manufacturing_location_current, asia_based); 0.28::true_val(manufacturing_location_current, unk_manufacturing_location_current).

measured(s10, manufacturing_location_current, asia_based).

all_consistent(manufacturing_location_current) :-
    consistent(s10, manufacturing_location_current).

evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, asia_based)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

% @attr brand_reputation
% @type categorical
% @canonical false
% @original_name Brand reputation
% @values established_durable=Established_durable_construction_practical_design unk_brand_reputation=Unknown
% @importance 0.50

0.65::acc(s11, brand_reputation).

0.52::true_val(brand_reputation, established_durable); 0.48::true_val(brand_reputation, unk_brand_reputation).

measured(s11, brand_reputation, established_durable).

all_consistent(brand_reputation) :-
    consistent(s11, brand_reputation).

evidence(all_consistent(brand_reputation)).
query(true_val(brand_reputation, established_durable)).
query(true_val(brand_reputation, unk_brand_reputation)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values y2023=2023 unk_model_first_available_year=Unknown
% @importance 0.575

0.85::acc(s12, model_first_available_year).
0.88::acc(s13, model_first_available_year).

0.95::true_val(model_first_available_year, y2023); 0.05::true_val(model_first_available_year, unk_model_first_available_year).

measured(s12, model_first_available_year, y2023).
measured(s13, model_first_available_year, y2023).

all_consistent(model_first_available_year) :-
    (indep(s12), consistent(s12, model_first_available_year) ; \+indep(s12)),
    consistent(s13, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2023)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values machete_gt=Machete_GT_more_approachable unk_predecessor_model_name=Unknown
% @importance 0.35

0.60::acc(s14, predecessor_model_name).

0.45::true_val(predecessor_model_name, machete_gt); 0.55::true_val(predecessor_model_name, unk_predecessor_model_name).

measured(s14, predecessor_model_name, machete_gt).

all_consistent(predecessor_model_name) :-
    consistent(s14, predecessor_model_name).

evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, machete_gt)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).

% @attr development_period
% @type categorical
% @canonical false
% @original_name Development period
% @values three_years_hundreds_prototypes=3_years_hundreds_of_prototypes unk_development_period=Unknown
% @importance 0.35

0.78::acc(s15, development_period).

0.68::true_val(development_period, three_years_hundreds_prototypes); 0.32::true_val(development_period, unk_development_period).

measured(s15, development_period, three_years_hundreds_prototypes).

all_consistent(development_period) :-
    consistent(s15, development_period).

evidence(all_consistent(development_period)).
query(true_val(development_period, three_years_hundreds_prototypes)).
query(true_val(development_period, unk_development_period)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values preorder=Preorder unk_availability_status=Unknown
% @importance 0.85

0.93::acc(s_merchant, availability_status).

0.90::true_val(availability_status, preorder); 0.10::true_val(availability_status, unk_availability_status).

measured(s_merchant, availability_status, preorder).

all_consistent(availability_status) :-
    consistent(s_merchant, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, preorder)).
query(true_val(availability_status, unk_availability_status)).

% @attr estimated_availability_date
% @type categorical
% @canonical true
% @original_name estimated_availability_date
% @values may_1_2026=May_1_2026 unk_estimated_availability_date=Unknown
% @importance 0.85

0.90::acc(s_merchant, estimated_availability_date).

0.90::true_val(estimated_availability_date, may_1_2026); 0.10::true_val(estimated_availability_date, unk_estimated_availability_date).

measured(s_merchant, estimated_availability_date, may_1_2026).

all_consistent(estimated_availability_date) :-
    consistent(s_merchant, estimated_availability_date).

evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, may_1_2026)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v949_99=949.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.93::acc(s_merchant, price_aud_merchant).

0.90::true_val(price_aud_merchant, v949_99); 0.10::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s_merchant, price_aud_merchant, v949_99).

all_consistent(price_aud_merchant) :-
    consistent(s_merchant, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v949_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v499_95=499.95 v599_95=599.95
% @importance 0.95

0.82::acc(s16, price_usd_msrp).
0.93::acc(s17, price_usd_msrp).

0.40::true_val(price_usd_msrp, v499_95); 0.60::true_val(price_usd_msrp, v599_95).

measured(s16, price_usd_msrp, v499_95).
measured(s17, price_usd_msrp, v599_95).

all_consistent(price_usd_msrp) :-
    consistent(s16, price_usd_msrp),
    consistent(s17, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v499_95)).
query(true_val(price_usd_msrp, v599_95)).

% @attr price_usd_backcountry
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_backcountry
% @values v419_97=419.97 unk_price_usd_backcountry=Unknown
% @importance 0.85

0.75::acc(s18, price_usd_backcountry).

0.56::true_val(price_usd_backcountry, v419_97); 0.44::true_val(price_usd_backcountry, unk_price_usd_backcountry).

measured(s18, price_usd_backcountry, v419_97).

all_consistent(price_usd_backcountry) :-
    consistent(s18, price_usd_backcountry).

evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v419_97)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

% @attr price_usd_christy_sports
% @type numeric
% @unit USD
% @canonical false
% @original_name Price (USD at Christy Sports, prior model year)
% @values v419_97=419.97 unk_price_usd_christy_sports=Unknown
% @importance 0.85

0.75::acc(s18, price_usd_christy_sports).

0.56::true_val(price_usd_christy_sports, v419_97); 0.44::true_val(price_usd_christy_sports, unk_price_usd_christy_sports).

measured(s18, price_usd_christy_sports, v419_97).

all_consistent(price_usd_christy_sports) :-
    consistent(s18, price_usd_christy_sports).

evidence(all_consistent(price_usd_christy_sports)).
query(true_val(price_usd_christy_sports, v419_97)).
query(true_val(price_usd_christy_sports, unk_price_usd_christy_sports)).

% @attr price_eur_snowcountry
% @type numeric
% @unit EUR
% @canonical false
% @original_name Price (EUR at SnowCountry, prior model year)
% @values v397_46=397.46 unk_price_eur_snowcountry=Unknown
% @importance 0.85

0.75::acc(s18, price_eur_snowcountry).

0.56::true_val(price_eur_snowcountry, v397_46); 0.44::true_val(price_eur_snowcountry, unk_price_eur_snowcountry).

measured(s18, price_eur_snowcountry, v397_46).

all_consistent(price_eur_snowcountry) :-
    consistent(s18, price_eur_snowcountry).

evidence(all_consistent(price_eur_snowcountry)).
query(true_val(price_eur_snowcountry, v397_46)).
query(true_val(price_eur_snowcountry, unk_price_eur_snowcountry)).

% @attr price_cad_prfo
% @type numeric
% @unit CAD
% @canonical true
% @original_name price_cad_prfo
% @values v433_99=433.99 unk_price_cad_prfo=Unknown
% @importance 0.85

0.75::acc(s18, price_cad_prfo).

0.56::true_val(price_cad_prfo, v433_99); 0.44::true_val(price_cad_prfo, unk_price_cad_prfo).

measured(s18, price_cad_prfo, v433_99).

all_consistent(price_cad_prfo) :-
    consistent(s18, price_cad_prfo).

evidence(all_consistent(price_cad_prfo)).
query(true_val(price_cad_prfo, v433_99)).
query(true_val(price_cad_prfo, unk_price_cad_prfo)).

% @attr price_cad_rudeboys
% @type numeric
% @unit CAD
% @canonical false
% @original_name Price (CAD at Rudeboys, prior 2025 model)
% @values v433_96=433.96 unk_price_cad_rudeboys=Unknown
% @importance 0.80

0.72::acc(s19, price_cad_rudeboys).

0.60::true_val(price_cad_rudeboys, v433_96); 0.40::true_val(price_cad_rudeboys, unk_price_cad_rudeboys).

measured(s19, price_cad_rudeboys, v433_96).

all_consistent(price_cad_rudeboys) :-
    consistent(s19, price_cad_rudeboys).

evidence(all_consistent(price_cad_rudeboys)).
query(true_val(price_cad_rudeboys, v433_96)).
query(true_val(price_cad_rudeboys, unk_price_cad_rudeboys)).

% @attr value_assessment
% @type categorical
% @canonical false
% @original_name Value assessment (expert)
% @values punches_above_price_class=Punches_above_price_class unk_value_assessment=Unknown
% @importance 0.85

0.75::acc(s20, value_assessment).

0.60::true_val(value_assessment, punches_above_price_class); 0.40::true_val(value_assessment, unk_value_assessment).

measured(s20, value_assessment, punches_above_price_class).

all_consistent(value_assessment) :-
    consistent(s20, value_assessment).

evidence(all_consistent(value_assessment)).
query(true_val(value_assessment, punches_above_price_class)).
query(true_val(value_assessment, unk_value_assessment)).

% @attr seller_ride_direct
% @type categorical
% @canonical false
% @original_name Seller Ride direct
% @values yes_ride_direct=Available unk_seller_ride_direct=Unknown
% @importance 1.0

0.93::acc(s17, seller_ride_direct).

0.93::true_val(seller_ride_direct, yes_ride_direct); 0.07::true_val(seller_ride_direct, unk_seller_ride_direct).

measured(s17, seller_ride_direct, yes_ride_direct).

all_consistent(seller_ride_direct) :-
    consistent(s17, seller_ride_direct).

evidence(all_consistent(seller_ride_direct)).
query(true_val(seller_ride_direct, yes_ride_direct)).
query(true_val(seller_ride_direct, unk_seller_ride_direct)).

% @attr seller_evo
% @type categorical
% @canonical false
% @original_name Seller evo
% @values yes_evo=Available unk_seller_evo=Unknown
% @importance 0.75

0.82::acc(s21, seller_evo).

0.68::true_val(seller_evo, yes_evo); 0.32::true_val(seller_evo, unk_seller_evo).

measured(s21, seller_evo, yes_evo).

all_consistent(seller_evo) :-
    consistent(s21, seller_evo).

evidence(all_consistent(seller_evo)).
query(true_val(seller_evo, yes_evo)).
query(true_val(seller_evo, unk_seller_evo)).

% @attr seller_backcountry
% @type categorical
% @canonical false
% @original_name Seller Backcountry
% @values yes_backcountry=Available unk_seller_backcountry=Unknown
% @importance 0.85

0.75::acc(s18, seller_backcountry).

0.56::true_val(seller_backcountry, yes_backcountry); 0.44::true_val(seller_backcountry, unk_seller_backcountry).

measured(s18, seller_backcountry, yes_backcountry).

all_consistent(seller_backcountry) :-
    consistent(s18, seller_backcountry).

evidence(all_consistent(seller_backcountry)).
query(true_val(seller_backcountry, yes_backcountry)).
query(true_val(seller_backcountry, unk_seller_backcountry)).

% @attr seller_christy_sports
% @type categorical
% @canonical false
% @original_name Seller Christy Sports
% @values yes_christy=Available unk_seller_christy_sports=Unknown
% @importance 0.85

0.75::acc(s18, seller_christy_sports).

0.56::true_val(seller_christy_sports, yes_christy); 0.44::true_val(seller_christy_sports, unk_seller_christy_sports).

measured(s18, seller_christy_sports, yes_christy).

all_consistent(seller_christy_sports) :-
    consistent(s18, seller_christy_sports).

evidence(all_consistent(seller_christy_sports)).
query(true_val(seller_christy_sports, yes_christy)).
query(true_val(seller_christy_sports, unk_seller_christy_sports)).

% @attr seller_the_house
% @type categorical
% @canonical false
% @original_name Seller The-House
% @values yes_thehouse=Available unk_seller_the_house=Unknown
% @importance 0.50

0.70::acc(s22, seller_the_house).

0.56::true_val(seller_the_house, yes_thehouse); 0.44::true_val(seller_the_house, unk_seller_the_house).

measured(s22, seller_the_house, yes_thehouse).

all_consistent(seller_the_house) :-
    consistent(s22, seller_the_house).

evidence(all_consistent(seller_the_house)).
query(true_val(seller_the_house, yes_thehouse)).
query(true_val(seller_the_house, unk_seller_the_house)).

% @attr seller_blauer_board_shop
% @type categorical
% @canonical false
% @original_name Seller Blauer Board Shop
% @values yes_blauer=Available unk_seller_blauer_board_shop=Unknown
% @importance 0.85

0.75::acc(s18, seller_blauer_board_shop).

0.56::true_val(seller_blauer_board_shop, yes_blauer); 0.44::true_val(seller_blauer_board_shop, unk_seller_blauer_board_shop).

measured(s18, seller_blauer_board_shop, yes_blauer).

all_consistent(seller_blauer_board_shop) :-
    consistent(s18, seller_blauer_board_shop).

evidence(all_consistent(seller_blauer_board_shop)).
query(true_val(seller_blauer_board_shop, yes_blauer)).
query(true_val(seller_blauer_board_shop, unk_seller_blauer_board_shop)).

% @attr seller_gorge_performance
% @type categorical
% @canonical false
% @original_name Seller Gorge Performance
% @values yes_gorge=Available unk_seller_gorge_performance=Unknown
% @importance 0.40

0.60::acc(s23, seller_gorge_performance).

0.45::true_val(seller_gorge_performance, yes_gorge); 0.55::true_val(seller_gorge_performance, unk_seller_gorge_performance).

measured(s23, seller_gorge_performance, yes_gorge).

all_consistent(seller_gorge_performance) :-
    consistent(s23, seller_gorge_performance).

evidence(all_consistent(seller_gorge_performance)).
query(true_val(seller_gorge_performance, yes_gorge)).
query(true_val(seller_gorge_performance, unk_seller_gorge_performance)).

% @attr seller_ballistyx
% @type categorical
% @canonical false
% @original_name Seller Ballistyx Australia
% @values yes_ballistyx=Available unk_seller_ballistyx=Unknown
% @importance 0.70

0.70::acc(s24, seller_ballistyx).

0.63::true_val(seller_ballistyx, yes_ballistyx); 0.37::true_val(seller_ballistyx, unk_seller_ballistyx).

measured(s24, seller_ballistyx, yes_ballistyx).

all_consistent(seller_ballistyx) :-
    consistent(s24, seller_ballistyx).

evidence(all_consistent(seller_ballistyx)).
query(true_val(seller_ballistyx, yes_ballistyx)).
query(true_val(seller_ballistyx, unk_seller_ballistyx)).

% @attr seller_basenz
% @type categorical
% @canonical false
% @original_name Seller BaseNZ
% @values yes_basenz=Available unk_seller_basenz=Unknown
% @importance 0.50

0.65::acc(s25, seller_basenz).

0.52::true_val(seller_basenz, yes_basenz); 0.48::true_val(seller_basenz, unk_seller_basenz).

measured(s25, seller_basenz, yes_basenz).

all_consistent(seller_basenz) :-
    consistent(s25, seller_basenz).

evidence(all_consistent(seller_basenz)).
query(true_val(seller_basenz, yes_basenz)).
query(true_val(seller_basenz, unk_seller_basenz)).

% @attr seller_rhythm
% @type categorical
% @canonical false
% @original_name Seller Rhythm Snowsports Australia
% @values yes_rhythm=Available unk_seller_rhythm=Unknown
% @importance 0.50

0.65::acc(s26, seller_rhythm).

0.52::true_val(seller_rhythm, yes_rhythm); 0.48::true_val(seller_rhythm, unk_seller_rhythm).

measured(s26, seller_rhythm, yes_rhythm).

all_consistent(seller_rhythm) :-
    consistent(s26, seller_rhythm).

evidence(all_consistent(seller_rhythm)).
query(true_val(seller_rhythm, yes_rhythm)).
query(true_val(seller_rhythm, unk_seller_rhythm)).

% @attr seller_cherripow
% @type categorical
% @canonical false
% @original_name Seller Cherri Cherri Pow Pow Australia
% @values yes_cherripow=Available unk_seller_cherripow=Unknown
% @importance 0.50

0.60::acc(s27, seller_cherripow).

0.48::true_val(seller_cherripow, yes_cherripow); 0.52::true_val(seller_cherripow, unk_seller_cherripow).

measured(s27, seller_cherripow, yes_cherripow).

all_consistent(seller_cherripow) :-
    consistent(s27, seller_cherripow).

evidence(all_consistent(seller_cherripow)).
query(true_val(seller_cherripow, yes_cherripow)).
query(true_val(seller_cherripow, unk_seller_cherripow)).

% @attr seller_tcb_nz
% @type categorical
% @canonical false
% @original_name Seller TCB NZ
% @values yes_tcb=Available unk_seller_tcb_nz=Unknown
% @importance 0.50

0.60::acc(s28, seller_tcb_nz).

0.51::true_val(seller_tcb_nz, yes_tcb); 0.49::true_val(seller_tcb_nz, unk_seller_tcb_nz).

measured(s28, seller_tcb_nz, yes_tcb).

all_consistent(seller_tcb_nz) :-
    consistent(s28, seller_tcb_nz).

evidence(all_consistent(seller_tcb_nz)).
query(true_val(seller_tcb_nz, yes_tcb)).
query(true_val(seller_tcb_nz, unk_seller_tcb_nz)).

% @attr seller_melbourne_snowboard
% @type categorical
% @canonical false
% @original_name Seller Melbourne Snowboard Centre
% @values yes_melbourne=Available unk_seller_melbourne_snowboard=Unknown
% @importance 0.45

0.60::acc(s29, seller_melbourne_snowboard).

0.45::true_val(seller_melbourne_snowboard, yes_melbourne); 0.55::true_val(seller_melbourne_snowboard, unk_seller_melbourne_snowboard).

measured(s29, seller_melbourne_snowboard, yes_melbourne).

all_consistent(seller_melbourne_snowboard) :-
    consistent(s29, seller_melbourne_snowboard).

evidence(all_consistent(seller_melbourne_snowboard)).
query(true_val(seller_melbourne_snowboard, yes_melbourne)).
query(true_val(seller_melbourne_snowboard, unk_seller_melbourne_snowboard)).

% @attr seller_motion_boardshop
% @type categorical
% @canonical false
% @original_name Seller Motion Boardshop
% @values yes_motion=Available unk_seller_motion_boardshop=Unknown
% @importance 0.40

0.65::acc(s30, seller_motion_boardshop).

0.46::true_val(seller_motion_boardshop, yes_motion); 0.54::true_val(seller_motion_boardshop, unk_seller_motion_boardshop).

measured(s30, seller_motion_boardshop, yes_motion).

all_consistent(seller_motion_boardshop) :-
    consistent(s30, seller_motion_boardshop).

evidence(all_consistent(seller_motion_boardshop)).
query(true_val(seller_motion_boardshop, yes_motion)).
query(true_val(seller_motion_boardshop, unk_seller_motion_boardshop)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain=All_Mountain all_mountain_freestyle=All_Mountain_Freestyle
% @importance 0.85

0.93::acc(s17, board_category).
0.88::acc(s_merchant, board_category).
0.72::acc(s24, board_category).

0.65::true_val(board_category, all_mountain); 0.35::true_val(board_category, all_mountain_freestyle).

measured(s_merchant, board_category, all_mountain).
measured(s17, board_category, all_mountain).
measured(s24, board_category, all_mountain_freestyle).

all_consistent(board_category) :-
    consistent(s17, board_category),
    (indep(s_merchant), consistent(s_merchant, board_category) ; \+indep(s_merchant)),
    (indep(s24), consistent(s24, board_category) ; \+indep(s24)).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain)).
query(true_val(board_category, all_mountain_freestyle)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values unisex=Unisex unk_gender=Unknown
% @importance 0.60

0.82::acc(s31, gender).

0.68::true_val(gender, unisex); 0.32::true_val(gender, unk_gender).

measured(s31, gender, unisex).

all_consistent(gender) :-
    consistent(s31, gender).

evidence(all_consistent(gender)).
query(true_val(gender, unisex)).
query(true_val(gender, unk_gender)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate=Intermediate beginner_intermediate=Beginner_Intermediate intermediate_advanced=Intermediate_Advanced
% @importance 0.81

0.88::acc(s_merchant, rider_level).
0.90::acc(s17, rider_level).
0.82::acc(s21, rider_level).
0.80::acc(s32, rider_level).

0.25::true_val(rider_level, intermediate); 0.30::true_val(rider_level, beginner_intermediate); 0.45::true_val(rider_level, intermediate_advanced).

measured(s_merchant, rider_level, intermediate).
measured(s17, rider_level, beginner_intermediate).
measured(s21, rider_level, intermediate_advanced).
measured(s32, rider_level, intermediate_advanced).

all_consistent(rider_level) :-
    (indep(s_merchant), consistent(s_merchant, rider_level) ; \+indep(s_merchant)),
    consistent(s17, rider_level),
    (indep(s21), consistent(s21, rider_level) ; \+indep(s21)),
    consistent(s32, rider_level).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate)).
query(true_val(rider_level, beginner_intermediate)).
query(true_val(rider_level, intermediate_advanced)).

% @attr skill_level_recommendation
% @type categorical
% @canonical false
% @original_name skill_level_recommendation
% @values intermediate_and_up=Intermediate_and_up unk_skill_level_recommendation=Unknown
% @importance 0.85

0.82::acc(s32, skill_level_recommendation).

0.68::true_val(skill_level_recommendation, intermediate_and_up); 0.32::true_val(skill_level_recommendation, unk_skill_level_recommendation).

measured(s32, skill_level_recommendation, intermediate_and_up).

all_consistent(skill_level_recommendation) :-
    consistent(s32, skill_level_recommendation).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, intermediate_and_up)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

% @attr flex_rating_10
% @type categorical
% @canonical true
% @original_name flex_rating_10
% @values mid_flex=Mid mellow_flex=Mellow
% @importance 0.93

0.88::acc(s_merchant, flex_rating_10).
0.93::acc(s17, flex_rating_10).

0.40::true_val(flex_rating_10, mid_flex); 0.60::true_val(flex_rating_10, mellow_flex).

measured(s_merchant, flex_rating_10, mid_flex).
measured(s17, flex_rating_10, mellow_flex).

all_consistent(flex_rating_10) :-
    (indep(s_merchant), consistent(s_merchant, flex_rating_10) ; \+indep(s_merchant)),
    consistent(s17, flex_rating_10).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, mid_flex)).
query(true_val(flex_rating_10, mellow_flex)).

% @attr flex_feel
% @type categorical
% @canonical false
% @original_name flex_feel
% @values v6_7_softens_to_5_5=6_7_out_of_box_softens_to_5_5 unk_flex_feel=Unknown
% @importance 0.80

0.60::acc(s33, flex_feel).

0.38::true_val(flex_feel, v6_7_softens_to_5_5); 0.62::true_val(flex_feel, unk_flex_feel).

measured(s33, flex_feel, v6_7_softens_to_5_5).

all_consistent(flex_feel) :-
    consistent(s33, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, v6_7_softens_to_5_5)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr target_rider_persona
% @type categorical
% @canonical false
% @original_name Target rider persona
% @values rad_dad_versatile=Rad_Dad_versatile_everyday_rider unk_target_rider_persona=Unknown
% @importance 0.45

0.55::acc(s34, target_rider_persona).
0.50::acc(s35, target_rider_persona).

0.95::true_val(target_rider_persona, rad_dad_versatile); 0.05::true_val(target_rider_persona, unk_target_rider_persona).

measured(s34, target_rider_persona, rad_dad_versatile).
measured(s35, target_rider_persona, rad_dad_versatile).

all_consistent(target_rider_persona) :-
    consistent(s34, target_rider_persona),
    consistent(s35, target_rider_persona).

evidence(all_consistent(target_rider_persona)).
query(true_val(target_rider_persona, rad_dad_versatile)).
query(true_val(target_rider_persona, unk_target_rider_persona)).

% @attr use_case
% @type categorical
% @canonical false
% @original_name Use case
% @values quiver_killer=Quiver_killer_one_board_for_everything unk_use_case=Unknown
% @importance 0.83

0.65::acc(s36, use_case).
0.93::acc(s17, use_case).

0.95::true_val(use_case, quiver_killer); 0.05::true_val(use_case, unk_use_case).

measured(s36, use_case, quiver_killer).
measured(s17, use_case, quiver_killer).

all_consistent(use_case) :-
    (indep(s27), consistent(s36, use_case) ; \+indep(s27)),
    consistent(s17, use_case).

evidence(all_consistent(use_case)).
query(true_val(use_case, quiver_killer)).
query(true_val(use_case, unk_use_case)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values all_mtn_park_pow_groom=All_mountain_park_powder_groomers unk_terrain_suitability=Unknown
% @importance 0.85

0.90::acc(s_merchant, terrain_suitability).

0.90::true_val(terrain_suitability, all_mtn_park_pow_groom); 0.10::true_val(terrain_suitability, unk_terrain_suitability).

measured(s_merchant, terrain_suitability, all_mtn_park_pow_groom).

all_consistent(terrain_suitability) :-
    consistent(s_merchant, terrain_suitability).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, all_mtn_park_pow_groom)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values versatile_all_mountain=Quiver_killer_versatile_all_mountain unk_riding_style=Unknown
% @importance 0.85

0.90::acc(s_merchant, riding_style).

0.90::true_val(riding_style, versatile_all_mountain); 0.10::true_val(riding_style, unk_riding_style).

measured(s_merchant, riding_style, versatile_all_mountain).

all_consistent(riding_style) :-
    consistent(s_merchant, riding_style).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, versatile_all_mountain)).
query(true_val(riding_style, unk_riding_style)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values directional_twin=Directional_Twin unk_shape=Unknown
% @importance 0.90

0.93::acc(s17, shape).
0.88::acc(s_merchant, shape).
0.88::acc(s37, shape).

0.97::true_val(shape, directional_twin); 0.03::true_val(shape, unk_shape).

measured(s17, shape, directional_twin).
measured(s_merchant, shape, directional_twin).
measured(s37, shape, directional_twin).

all_consistent(shape) :-
    consistent(s17, shape),
    (indep(s_merchant), consistent(s_merchant, shape) ; \+indep(s_merchant)),
    consistent(s37, shape).

evidence(all_consistent(shape)).
query(true_val(shape, directional_twin)).
query(true_val(shape, unk_shape)).

% @attr nose_volume
% @type categorical
% @canonical false
% @original_name Nose volume
% @values more_volume_nose_than_tail=Slightly_more_volume_in_nose unk_nose_volume=Unknown
% @importance 0.70

0.82::acc(s38, nose_volume).

0.72::true_val(nose_volume, more_volume_nose_than_tail); 0.28::true_val(nose_volume, unk_nose_volume).

measured(s38, nose_volume, more_volume_nose_than_tail).

all_consistent(nose_volume) :-
    consistent(s38, nose_volume).

evidence(all_consistent(nose_volume)).
query(true_val(nose_volume, more_volume_nose_than_tail)).
query(true_val(nose_volume, unk_nose_volume)).

% @attr camber_type
% @type categorical
% @canonical false
% @original_name camber_type
% @values dir_twin_std_camber=Directional_Twin_Standard_Camber_extended_rocker_tip_tail unk_camber_type=Unknown
% @importance 0.85

0.90::acc(s_merchant, camber_type).

0.90::true_val(camber_type, dir_twin_std_camber); 0.10::true_val(camber_type, unk_camber_type).

measured(s_merchant, camber_type, dir_twin_std_camber).

all_consistent(camber_type) :-
    consistent(s_merchant, camber_type).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, dir_twin_std_camber)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values hybrid_positive_camber=Hybrid_Positive_camber_with_early_rise unk_camber_description=Unknown
% @importance 0.80

0.93::acc(s17, camber_description).
0.72::acc(s24, camber_description).
0.82::acc(s38, camber_description).

0.97::true_val(camber_description, hybrid_positive_camber); 0.03::true_val(camber_description, unk_camber_description).

measured(s17, camber_description, hybrid_positive_camber).
measured(s24, camber_description, hybrid_positive_camber).
measured(s38, camber_description, hybrid_positive_camber).

all_consistent(camber_description) :-
    consistent(s17, camber_description),
    (indep(s24), consistent(s24, camber_description) ; \+indep(s24)),
    consistent(s38, camber_description).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, hybrid_positive_camber)).
query(true_val(camber_description, unk_camber_description)).

% @attr camber_height_mm
% @type numeric
% @unit mm
% @canonical true
% @original_name camber_height_mm
% @values v2_3=2.5 unk_camber_height_mm=Unknown
% @importance 0.60

0.72::acc(s39, camber_height_mm).

0.56::true_val(camber_height_mm, v2_3); 0.44::true_val(camber_height_mm, unk_camber_height_mm).

measured(s39, camber_height_mm, v2_3).

all_consistent(camber_height_mm) :-
    consistent(s39, camber_height_mm).

evidence(all_consistent(camber_height_mm)).
query(true_val(camber_height_mm, v2_3)).
query(true_val(camber_height_mm, unk_camber_height_mm)).

% @attr setback
% @type numeric
% @unit mm
% @canonical true
% @original_name setback
% @values v19=19.0 unk_setback=Unknown
% @importance 0.93

0.93::acc(s17, setback).
0.88::acc(s_merchant, setback).

0.97::true_val(setback, v19); 0.03::true_val(setback, unk_setback).

measured(s17, setback, v19).
measured(s_merchant, setback, v19).

all_consistent(setback) :-
    consistent(s17, setback),
    (indep(s_merchant), consistent(s_merchant, setback) ; \+indep(s_merchant)).

evidence(all_consistent(setback)).
query(true_val(setback, v19)).
query(true_val(setback, unk_setback)).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values quadratic_three_radii=Quadratic_Sidecut_blend_of_three_radii unk_sidecut_type=Unknown
% @importance 0.93

0.93::acc(s17, sidecut_type).
0.88::acc(s_merchant, sidecut_type).

0.97::true_val(sidecut_type, quadratic_three_radii); 0.03::true_val(sidecut_type, unk_sidecut_type).

measured(s17, sidecut_type, quadratic_three_radii).
measured(s_merchant, sidecut_type, quadratic_three_radii).

all_consistent(sidecut_type) :-
    consistent(s17, sidecut_type),
    (indep(s_merchant), consistent(s_merchant, sidecut_type) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, quadratic_three_radii)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr reviewer_opinion_the_good_ride_sidecut
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (sidecut)
% @values deep_sidecut_accommodates_carving=Deep_sidecut_accommodates_carving unk_reviewer_opinion_the_good_ride_sidecut=Unknown
% @importance 0.90

0.88::acc(s37, reviewer_opinion_the_good_ride_sidecut).

0.79::true_val(reviewer_opinion_the_good_ride_sidecut, deep_sidecut_accommodates_carving); 0.21::true_val(reviewer_opinion_the_good_ride_sidecut, unk_reviewer_opinion_the_good_ride_sidecut).

measured(s37, reviewer_opinion_the_good_ride_sidecut, deep_sidecut_accommodates_carving).

all_consistent(reviewer_opinion_the_good_ride_sidecut) :-
    consistent(s37, reviewer_opinion_the_good_ride_sidecut).

evidence(all_consistent(reviewer_opinion_the_good_ride_sidecut)).
query(true_val(reviewer_opinion_the_good_ride_sidecut, deep_sidecut_accommodates_carving)).
query(true_val(reviewer_opinion_the_good_ride_sidecut, unk_reviewer_opinion_the_good_ride_sidecut)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 0.85

0.90::acc(s_merchant, mounting_pattern).

0.90::true_val(mounting_pattern, inserts_2x4); 0.10::true_val(mounting_pattern, unk_mounting_pattern).

measured(s_merchant, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :-
    consistent(s_merchant, mounting_pattern).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values eight_sizes=147_151_154_157_161_155W_160W_164W unk_available_sizes=Unknown
% @importance 0.93

0.93::acc(s17, available_sizes).
0.88::acc(s_merchant, available_sizes).

0.97::true_val(available_sizes, eight_sizes); 0.03::true_val(available_sizes, unk_available_sizes).

measured(s17, available_sizes, eight_sizes).
measured(s_merchant, available_sizes, eight_sizes).

all_consistent(available_sizes) :-
    consistent(s17, available_sizes),
    (indep(s_merchant), consistent(s_merchant, available_sizes) ; \+indep(s_merchant)).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, eight_sizes)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 0.85

0.90::acc(s_merchant, width_options).

0.90::true_val(width_options, standard_wide); 0.10::true_val(width_options, unk_width_options).

measured(s_merchant, width_options, standard_wide).

all_consistent(width_options) :-
    consistent(s_merchant, width_options).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_wide)).
query(true_val(width_options, unk_width_options)).

% @attr sidecut_radius_size_147
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size (147cm)
% @values r9_0_6_5_9_0=9.0_6.5_9.0 unk_sidecut_radius_size_147=Unknown
% @importance 0.93

0.93::acc(s17, sidecut_radius_size_147).
0.88::acc(s_merchant, sidecut_radius_size_147).

0.97::true_val(sidecut_radius_size_147, r9_0_6_5_9_0); 0.03::true_val(sidecut_radius_size_147, unk_sidecut_radius_size_147).

measured(s17, sidecut_radius_size_147, r9_0_6_5_9_0).
measured(s_merchant, sidecut_radius_size_147, r9_0_6_5_9_0).

all_consistent(sidecut_radius_size_147) :-
    consistent(s17, sidecut_radius_size_147),
    (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_147) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_radius_size_147)).
query(true_val(sidecut_radius_size_147, r9_0_6_5_9_0)).
query(true_val(sidecut_radius_size_147, unk_sidecut_radius_size_147)).

% @attr waist_width_147
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 147cm
% @values v245=245.0 unk_waist_width_147=Unknown
% @importance 1.0

0.93::acc(s17, waist_width_147).

0.90::true_val(waist_width_147, v245); 0.10::true_val(waist_width_147, unk_waist_width_147).

measured(s17, waist_width_147, v245).

all_consistent(waist_width_147) :-
    consistent(s17, waist_width_147).

evidence(all_consistent(waist_width_147)).
query(true_val(waist_width_147, v245)).
query(true_val(waist_width_147, unk_waist_width_147)).

% @attr tip_tail_width_size_147
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size (147cm)
% @values v287=287.0 unk_tip_tail_width_size_147=Unknown
% @importance 1.0

0.93::acc(s17, tip_tail_width_size_147).

0.90::true_val(tip_tail_width_size_147, v287); 0.10::true_val(tip_tail_width_size_147, unk_tip_tail_width_size_147).

measured(s17, tip_tail_width_size_147, v287).

all_consistent(tip_tail_width_size_147) :-
    consistent(s17, tip_tail_width_size_147).

evidence(all_consistent(tip_tail_width_size_147)).
query(true_val(tip_tail_width_size_147, v287)).
query(true_val(tip_tail_width_size_147, unk_tip_tail_width_size_147)).

% @attr effective_edge_147
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 147cm
% @values v1096=1096.0 unk_effective_edge_147=Unknown
% @importance 1.0

0.93::acc(s17, effective_edge_147).

0.90::true_val(effective_edge_147, v1096); 0.10::true_val(effective_edge_147, unk_effective_edge_147).

measured(s17, effective_edge_147, v1096).

all_consistent(effective_edge_147) :-
    consistent(s17, effective_edge_147).

evidence(all_consistent(effective_edge_147)).
query(true_val(effective_edge_147, v1096)).
query(true_val(effective_edge_147, unk_effective_edge_147)).

% @attr stance_width_range_size_147
% @type numeric
% @unit mm
% @canonical false
% @original_name stance_width_range_size (147cm)
% @values v508=508.0 v506=506.0
% @importance 0.93

0.93::acc(s17, stance_width_range_size_147).
0.85::acc(s_merchant, stance_width_range_size_147).

0.55::true_val(stance_width_range_size_147, v508); 0.45::true_val(stance_width_range_size_147, v506).

measured(s17, stance_width_range_size_147, v508).
measured(s_merchant, stance_width_range_size_147, v506).

all_consistent(stance_width_range_size_147) :-
    consistent(s17, stance_width_range_size_147),
    (indep(s_merchant), consistent(s_merchant, stance_width_range_size_147) ; \+indep(s_merchant)).

evidence(all_consistent(stance_width_range_size_147)).
query(true_val(stance_width_range_size_147, v508)).
query(true_val(stance_width_range_size_147, v506)).

% @attr recommended_weight_range_size_147
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (147cm)
% @values w75_165=75_165_lbs unk_recommended_weight_range_size_147=Unknown
% @importance 1.0

0.93::acc(s17, recommended_weight_range_size_147).

0.90::true_val(recommended_weight_range_size_147, w75_165); 0.10::true_val(recommended_weight_range_size_147, unk_recommended_weight_range_size_147).

measured(s17, recommended_weight_range_size_147, w75_165).

all_consistent(recommended_weight_range_size_147) :-
    consistent(s17, recommended_weight_range_size_147).

evidence(all_consistent(recommended_weight_range_size_147)).
query(true_val(recommended_weight_range_size_147, w75_165)).
query(true_val(recommended_weight_range_size_147, unk_recommended_weight_range_size_147)).

% @attr sidecut_radius_size_151
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size (151cm)
% @values r9_1_6_6_9_1=9.1_6.6_9.1 unk_sidecut_radius_size_151=Unknown
% @importance 0.93

0.93::acc(s17, sidecut_radius_size_151).
0.88::acc(s_merchant, sidecut_radius_size_151).

0.97::true_val(sidecut_radius_size_151, r9_1_6_6_9_1); 0.03::true_val(sidecut_radius_size_151, unk_sidecut_radius_size_151).

measured(s17, sidecut_radius_size_151, r9_1_6_6_9_1).
measured(s_merchant, sidecut_radius_size_151, r9_1_6_6_9_1).

all_consistent(sidecut_radius_size_151) :-
    consistent(s17, sidecut_radius_size_151),
    (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_151) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_radius_size_151)).
query(true_val(sidecut_radius_size_151, r9_1_6_6_9_1)).
query(true_val(sidecut_radius_size_151, unk_sidecut_radius_size_151)).

% @attr waist_width_151
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 151cm
% @values v248=248.0 unk_waist_width_151=Unknown
% @importance 1.0

0.93::acc(s17, waist_width_151).

0.90::true_val(waist_width_151, v248); 0.10::true_val(waist_width_151, unk_waist_width_151).

measured(s17, waist_width_151, v248).

all_consistent(waist_width_151) :-
    consistent(s17, waist_width_151).

evidence(all_consistent(waist_width_151)).
query(true_val(waist_width_151, v248)).
query(true_val(waist_width_151, unk_waist_width_151)).

% @attr effective_edge_151
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 151cm
% @values v1121=1121.0 unk_effective_edge_151=Unknown
% @importance 1.0

0.93::acc(s17, effective_edge_151).

0.90::true_val(effective_edge_151, v1121); 0.10::true_val(effective_edge_151, unk_effective_edge_151).

measured(s17, effective_edge_151, v1121).

all_consistent(effective_edge_151) :-
    consistent(s17, effective_edge_151).

evidence(all_consistent(effective_edge_151)).
query(true_val(effective_edge_151, v1121)).
query(true_val(effective_edge_151, unk_effective_edge_151)).

% @attr stance_width_range_size_151
% @type numeric
% @unit mm
% @canonical false
% @original_name stance_width_range_size (151cm)
% @values v533=533.0 unk_stance_width_range_size_151=Unknown
% @importance 0.93

0.93::acc(s17, stance_width_range_size_151).
0.88::acc(s_merchant, stance_width_range_size_151).

0.97::true_val(stance_width_range_size_151, v533); 0.03::true_val(stance_width_range_size_151, unk_stance_width_range_size_151).

measured(s17, stance_width_range_size_151, v533).
measured(s_merchant, stance_width_range_size_151, v533).

all_consistent(stance_width_range_size_151) :-
    consistent(s17, stance_width_range_size_151),
    (indep(s_merchant), consistent(s_merchant, stance_width_range_size_151) ; \+indep(s_merchant)).

evidence(all_consistent(stance_width_range_size_151)).
query(true_val(stance_width_range_size_151, v533)).
query(true_val(stance_width_range_size_151, unk_stance_width_range_size_151)).

% @attr recommended_weight_range_size_151
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (151cm)
% @values w100_180=100_180_lbs unk_recommended_weight_range_size_151=Unknown
% @importance 1.0

0.93::acc(s17, recommended_weight_range_size_151).

0.90::true_val(recommended_weight_range_size_151, w100_180); 0.10::true_val(recommended_weight_range_size_151, unk_recommended_weight_range_size_151).

measured(s17, recommended_weight_range_size_151, w100_180).

all_consistent(recommended_weight_range_size_151) :-
    consistent(s17, recommended_weight_range_size_151).

evidence(all_consistent(recommended_weight_range_size_151)).
query(true_val(recommended_weight_range_size_151, w100_180)).
query(true_val(recommended_weight_range_size_151, unk_recommended_weight_range_size_151)).

% @attr sidecut_radius_size_154
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size (154cm)
% @values r9_2_6_7_9_2=9.2_6.7_9.2 unk_sidecut_radius_size_154=Unknown
% @importance 0.93

0.93::acc(s17, sidecut_radius_size_154).
0.88::acc(s_merchant, sidecut_radius_size_154).

0.97::true_val(sidecut_radius_size_154, r9_2_6_7_9_2); 0.03::true_val(sidecut_radius_size_154, unk_sidecut_radius_size_154).

measured(s17, sidecut_radius_size_154, r9_2_6_7_9_2).
measured(s_merchant, sidecut_radius_size_154, r9_2_6_7_9_2).

all_consistent(sidecut_radius_size_154) :-
    consistent(s17, sidecut_radius_size_154),
    (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_154) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_radius_size_154)).
query(true_val(sidecut_radius_size_154, r9_2_6_7_9_2)).
query(true_val(sidecut_radius_size_154, unk_sidecut_radius_size_154)).

% @attr waist_width_154
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 154cm
% @values v251=251.0 unk_waist_width_154=Unknown
% @importance 1.0

0.93::acc(s17, waist_width_154).

0.90::true_val(waist_width_154, v251); 0.10::true_val(waist_width_154, unk_waist_width_154).

measured(s17, waist_width_154, v251).

all_consistent(waist_width_154) :-
    consistent(s17, waist_width_154).

evidence(all_consistent(waist_width_154)).
query(true_val(waist_width_154, v251)).
query(true_val(waist_width_154, unk_waist_width_154)).

% @attr effective_edge_154
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 154cm
% @values v1147=1147.0 unk_effective_edge_154=Unknown
% @importance 1.0

0.93::acc(s17, effective_edge_154).

0.90::true_val(effective_edge_154, v1147); 0.10::true_val(effective_edge_154, unk_effective_edge_154).

measured(s17, effective_edge_154, v1147).

all_consistent(effective_edge_154) :-
    consistent(s17, effective_edge_154).

evidence(all_consistent(effective_edge_154)).
query(true_val(effective_edge_154, v1147)).
query(true_val(effective_edge_154, unk_effective_edge_154)).

% @attr stance_width_range_size_154
% @type numeric
% @unit mm
% @canonical false
% @original_name stance_width_range_size (154cm)
% @values v559=559.0 unk_stance_width_range_size_154=Unknown
% @importance 0.93

0.93::acc(s17, stance_width_range_size_154).
0.88::acc(s_merchant, stance_width_range_size_154).

0.97::true_val(stance_width_range_size_154, v559); 0.03::true_val(stance_width_range_size_154, unk_stance_width_range_size_154).

measured(s17, stance_width_range_size_154, v559).
measured(s_merchant, stance_width_range_size_154, v559).

all_consistent(stance_width_range_size_154) :-
    consistent(s17, stance_width_range_size_154),
    (indep(s_merchant), consistent(s_merchant, stance_width_range_size_154) ; \+indep(s_merchant)).

evidence(all_consistent(stance_width_range_size_154)).
query(true_val(stance_width_range_size_154, v559)).
query(true_val(stance_width_range_size_154, unk_stance_width_range_size_154)).

% @attr recommended_weight_range_size_154
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (154cm)
% @values w115_195=115_195_lbs unk_recommended_weight_range_size_154=Unknown
% @importance 1.0

0.93::acc(s17, recommended_weight_range_size_154).

0.90::true_val(recommended_weight_range_size_154, w115_195); 0.10::true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154).

measured(s17, recommended_weight_range_size_154, w115_195).

all_consistent(recommended_weight_range_size_154) :-
    consistent(s17, recommended_weight_range_size_154).

evidence(all_consistent(recommended_weight_range_size_154)).
query(true_val(recommended_weight_range_size_154, w115_195)).
query(true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154)).

% @attr sidecut_radius_size
% @type categorical
% @unit m
% @canonical true
% @original_name sidecut_radius_size (157cm)
% @values r9_3_6_8_9_3=9.3_6.8_9.3 unk_sidecut_radius_size=Unknown
% @importance 0.93

0.93::acc(s17, sidecut_radius_size).
0.88::acc(s_merchant, sidecut_radius_size).

0.97::true_val(sidecut_radius_size, r9_3_6_8_9_3); 0.03::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s17, sidecut_radius_size, r9_3_6_8_9_3).
measured(s_merchant, sidecut_radius_size, r9_3_6_8_9_3).

all_consistent(sidecut_radius_size) :-
    consistent(s17, sidecut_radius_size),
    (indep(s_merchant), consistent(s_merchant, sidecut_radius_size) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, r9_3_6_8_9_3)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr waist_width_157
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 157cm
% @values v254=254.0 unk_waist_width_157=Unknown
% @importance 1.0

0.93::acc(s17, waist_width_157).

0.90::true_val(waist_width_157, v254); 0.10::true_val(waist_width_157, unk_waist_width_157).

measured(s17, waist_width_157, v254).

all_consistent(waist_width_157) :-
    consistent(s17, waist_width_157).

evidence(all_consistent(waist_width_157)).
query(true_val(waist_width_157, v254)).
query(true_val(waist_width_157, unk_waist_width_157)).

% @attr effective_edge_157
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 157cm
% @values v1172=1172.0 unk_effective_edge_157=Unknown
% @importance 1.0

0.93::acc(s17, effective_edge_157).

0.90::true_val(effective_edge_157, v1172); 0.10::true_val(effective_edge_157, unk_effective_edge_157).

measured(s17, effective_edge_157, v1172).

all_consistent(effective_edge_157) :-
    consistent(s17, effective_edge_157).

evidence(all_consistent(effective_edge_157)).
query(true_val(effective_edge_157, v1172)).
query(true_val(effective_edge_157, unk_effective_edge_157)).

% @attr stance_width_range_size
% @type numeric
% @unit mm
% @canonical true
% @original_name stance_width_range_size (157cm)
% @values v559=559.0 unk_stance_width_range_size=Unknown
% @importance 0.93

0.93::acc(s17, stance_width_range_size).
0.88::acc(s_merchant, stance_width_range_size).

0.97::true_val(stance_width_range_size, v559); 0.03::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s17, stance_width_range_size, v559).
measured(s_merchant, stance_width_range_size, v559).

all_consistent(stance_width_range_size) :-
    consistent(s17, stance_width_range_size),
    (indep(s_merchant), consistent(s_merchant, stance_width_range_size) ; \+indep(s_merchant)).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v559)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size (157cm)
% @values w125_205=125_205_lbs unk_recommended_weight_range_size=Unknown
% @importance 1.0

0.93::acc(s17, recommended_weight_range_size).

0.90::true_val(recommended_weight_range_size, w125_205); 0.10::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s17, recommended_weight_range_size, w125_205).

all_consistent(recommended_weight_range_size) :-
    consistent(s17, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w125_205)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr sidecut_radius_size_161
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size (161cm)
% @values r9_4_6_9_9_4=9.4_6.9_9.4 unk_sidecut_radius_size_161=Unknown
% @importance 0.93

0.93::acc(s17, sidecut_radius_size_161).
0.88::acc(s_merchant, sidecut_radius_size_161).

0.97::true_val(sidecut_radius_size_161, r9_4_6_9_9_4); 0.03::true_val(sidecut_radius_size_161, unk_sidecut_radius_size_161).

measured(s17, sidecut_radius_size_161, r9_4_6_9_9_4).
measured(s_merchant, sidecut_radius_size_161, r9_4_6_9_9_4).

all_consistent(sidecut_radius_size_161) :-
    consistent(s17, sidecut_radius_size_161),
    (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_161) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_radius_size_161)).
query(true_val(sidecut_radius_size_161, r9_4_6_9_9_4)).
query(true_val(sidecut_radius_size_161, unk_sidecut_radius_size_161)).

% @attr waist_width_161
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 161cm
% @values v257=257.0 unk_waist_width_161=Unknown
% @importance 1.0

0.93::acc(s17, waist_width_161).

0.90::true_val(waist_width_161, v257); 0.10::true_val(waist_width_161, unk_waist_width_161).

measured(s17, waist_width_161, v257).

all_consistent(waist_width_161) :-
    consistent(s17, waist_width_161).

evidence(all_consistent(waist_width_161)).
query(true_val(waist_width_161, v257)).
query(true_val(waist_width_161, unk_waist_width_161)).

% @attr effective_edge_161
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 161cm
% @values v1197=1197.0 unk_effective_edge_161=Unknown
% @importance 1.0

0.93::acc(s17, effective_edge_161).

0.90::true_val(effective_edge_161, v1197); 0.10::true_val(effective_edge_161, unk_effective_edge_161).

measured(s17, effective_edge_161, v1197).

all_consistent(effective_edge_161) :-
    consistent(s17, effective_edge_161).

evidence(all_consistent(effective_edge_161)).
query(true_val(effective_edge_161, v1197)).
query(true_val(effective_edge_161, unk_effective_edge_161)).

% @attr stance_width_range_size_161
% @type numeric
% @unit mm
% @canonical false
% @original_name stance_width_range_size (161cm)
% @values v559=559.0 unk_stance_width_range_size_161=Unknown
% @importance 0.93

0.93::acc(s17, stance_width_range_size_161).
0.88::acc(s_merchant, stance_width_range_size_161).

0.97::true_val(stance_width_range_size_161, v559); 0.03::true_val(stance_width_range_size_161, unk_stance_width_range_size_161).

measured(s17, stance_width_range_size_161, v559).
measured(s_merchant, stance_width_range_size_161, v559).

all_consistent(stance_width_range_size_161) :-
    consistent(s17, stance_width_range_size_161),
    (indep(s_merchant), consistent(s_merchant, stance_width_range_size_161) ; \+indep(s_merchant)).

evidence(all_consistent(stance_width_range_size_161)).
query(true_val(stance_width_range_size_161, v559)).
query(true_val(stance_width_range_size_161, unk_stance_width_range_size_161)).

% @attr recommended_weight_range_size_161
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (161cm)
% @values w130_210=130_210_lbs unk_recommended_weight_range_size_161=Unknown
% @importance 1.0

0.93::acc(s17, recommended_weight_range_size_161).

0.90::true_val(recommended_weight_range_size_161, w130_210); 0.10::true_val(recommended_weight_range_size_161, unk_recommended_weight_range_size_161).

measured(s17, recommended_weight_range_size_161, w130_210).

all_consistent(recommended_weight_range_size_161) :-
    consistent(s17, recommended_weight_range_size_161).

evidence(all_consistent(recommended_weight_range_size_161)).
query(true_val(recommended_weight_range_size_161, w130_210)).
query(true_val(recommended_weight_range_size_161, unk_recommended_weight_range_size_161)).

% @attr sidecut_radius_size_155w
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size (155W)
% @values r9_2_6_7_9_2=9.2_6.7_9.2 unk_sidecut_radius_size_155w=Unknown
% @importance 0.93

0.93::acc(s17, sidecut_radius_size_155w).
0.88::acc(s_merchant, sidecut_radius_size_155w).

0.97::true_val(sidecut_radius_size_155w, r9_2_6_7_9_2w); 0.03::true_val(sidecut_radius_size_155w, unk_sidecut_radius_size_155w).

measured(s17, sidecut_radius_size_155w, r9_2_6_7_9_2w).
measured(s_merchant, sidecut_radius_size_155w, r9_2_6_7_9_2w).

all_consistent(sidecut_radius_size_155w) :-
    consistent(s17, sidecut_radius_size_155w),
    (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_155w) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_radius_size_155w)).
query(true_val(sidecut_radius_size_155w, r9_2_6_7_9_2w)).
query(true_val(sidecut_radius_size_155w, unk_sidecut_radius_size_155w)).

% @attr waist_width_155w
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 155W
% @values v258=258.0 unk_waist_width_155w=Unknown
% @importance 1.0

0.93::acc(s17, waist_width_155w).

0.90::true_val(waist_width_155w, v258); 0.10::true_val(waist_width_155w, unk_waist_width_155w).

measured(s17, waist_width_155w, v258).

all_consistent(waist_width_155w) :-
    consistent(s17, waist_width_155w).

evidence(all_consistent(waist_width_155w)).
query(true_val(waist_width_155w, v258)).
query(true_val(waist_width_155w, unk_waist_width_155w)).

% @attr effective_edge_155w
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 155W
% @values v1159=1159.0 unk_effective_edge_155w=Unknown
% @importance 1.0

0.93::acc(s17, effective_edge_155w).

0.90::true_val(effective_edge_155w, v1159); 0.10::true_val(effective_edge_155w, unk_effective_edge_155w).

measured(s17, effective_edge_155w, v1159).

all_consistent(effective_edge_155w) :-
    consistent(s17, effective_edge_155w).

evidence(all_consistent(effective_edge_155w)).
query(true_val(effective_edge_155w, v1159)).
query(true_val(effective_edge_155w, unk_effective_edge_155w)).

% @attr stance_width_range_size_155w
% @type numeric
% @unit mm
% @canonical false
% @original_name stance_width_range_size (155W)
% @values v559=559.0 unk_stance_width_range_size_155w=Unknown
% @importance 0.93

0.93::acc(s17, stance_width_range_size_155w).
0.88::acc(s_merchant, stance_width_range_size_155w).

0.97::true_val(stance_width_range_size_155w, v559); 0.03::true_val(stance_width_range_size_155w, unk_stance_width_range_size_155w).

measured(s17, stance_width_range_size_155w, v559).
measured(s_merchant, stance_width_range_size_155w, v559).

all_consistent(stance_width_range_size_155w) :-
    consistent(s17, stance_width_range_size_155w),
    (indep(s_merchant), consistent(s_merchant, stance_width_range_size_155w) ; \+indep(s_merchant)).

evidence(all_consistent(stance_width_range_size_155w)).
query(true_val(stance_width_range_size_155w, v559)).
query(true_val(stance_width_range_size_155w, unk_stance_width_range_size_155w)).

% @attr recommended_weight_range_size_155w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (155W)
% @values w125_205=125_205_lbs unk_recommended_weight_range_size_155w=Unknown
% @importance 1.0

0.93::acc(s17, recommended_weight_range_size_155w).

0.90::true_val(recommended_weight_range_size_155w, w125_205); 0.10::true_val(recommended_weight_range_size_155w, unk_recommended_weight_range_size_155w).

measured(s17, recommended_weight_range_size_155w, w125_205).

all_consistent(recommended_weight_range_size_155w) :-
    consistent(s17, recommended_weight_range_size_155w).

evidence(all_consistent(recommended_weight_range_size_155w)).
query(true_val(recommended_weight_range_size_155w, w125_205)).
query(true_val(recommended_weight_range_size_155w, unk_recommended_weight_range_size_155w)).

% @attr sidecut_radius_size_160w
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size (160W)
% @values r9_4_6_9_9_4w=9.4_6.9_9.4 unk_sidecut_radius_size_160w=Unknown
% @importance 0.93

0.93::acc(s17, sidecut_radius_size_160w).
0.88::acc(s_merchant, sidecut_radius_size_160w).

0.97::true_val(sidecut_radius_size_160w, r9_4_6_9_9_4w); 0.03::true_val(sidecut_radius_size_160w, unk_sidecut_radius_size_160w).

measured(s17, sidecut_radius_size_160w, r9_4_6_9_9_4w).
measured(s_merchant, sidecut_radius_size_160w, r9_4_6_9_9_4w).

all_consistent(sidecut_radius_size_160w) :-
    consistent(s17, sidecut_radius_size_160w),
    (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_160w) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_radius_size_160w)).
query(true_val(sidecut_radius_size_160w, r9_4_6_9_9_4w)).
query(true_val(sidecut_radius_size_160w, unk_sidecut_radius_size_160w)).

% @attr waist_width_160w
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 160W
% @values v264=264.0 unk_waist_width_160w=Unknown
% @importance 1.0

0.93::acc(s17, waist_width_160w).

0.90::true_val(waist_width_160w, v264); 0.10::true_val(waist_width_160w, unk_waist_width_160w).

measured(s17, waist_width_160w, v264).

all_consistent(waist_width_160w) :-
    consistent(s17, waist_width_160w).

evidence(all_consistent(waist_width_160w)).
query(true_val(waist_width_160w, v264)).
query(true_val(waist_width_160w, unk_waist_width_160w)).

% @attr effective_edge_160w
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 160W
% @values v1197=1197.0 unk_effective_edge_160w=Unknown
% @importance 1.0

0.93::acc(s17, effective_edge_160w).

0.90::true_val(effective_edge_160w, v1197); 0.10::true_val(effective_edge_160w, unk_effective_edge_160w).

measured(s17, effective_edge_160w, v1197).

all_consistent(effective_edge_160w) :-
    consistent(s17, effective_edge_160w).

evidence(all_consistent(effective_edge_160w)).
query(true_val(effective_edge_160w, v1197)).
query(true_val(effective_edge_160w, unk_effective_edge_160w)).

% @attr stance_width_range_size_160w
% @type numeric
% @unit mm
% @canonical false
% @original_name stance_width_range_size (160W)
% @values v559=559.0 unk_stance_width_range_size_160w=Unknown
% @importance 0.93

0.93::acc(s17, stance_width_range_size_160w).
0.88::acc(s_merchant, stance_width_range_size_160w).

0.97::true_val(stance_width_range_size_160w, v559); 0.03::true_val(stance_width_range_size_160w, unk_stance_width_range_size_160w).

measured(s17, stance_width_range_size_160w, v559).
measured(s_merchant, stance_width_range_size_160w, v559).

all_consistent(stance_width_range_size_160w) :-
    consistent(s17, stance_width_range_size_160w),
    (indep(s_merchant), consistent(s_merchant, stance_width_range_size_160w) ; \+indep(s_merchant)).

evidence(all_consistent(stance_width_range_size_160w)).
query(true_val(stance_width_range_size_160w, v559)).
query(true_val(stance_width_range_size_160w, unk_stance_width_range_size_160w)).

% @attr recommended_weight_range_size_160w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (160W)
% @values w160_220plus=160_220plus_lbs unk_recommended_weight_range_size_160w=Unknown
% @importance 1.0

0.93::acc(s17, recommended_weight_range_size_160w).

0.90::true_val(recommended_weight_range_size_160w, w160_220plus); 0.10::true_val(recommended_weight_range_size_160w, unk_recommended_weight_range_size_160w).

measured(s17, recommended_weight_range_size_160w, w160_220plus).

all_consistent(recommended_weight_range_size_160w) :-
    consistent(s17, recommended_weight_range_size_160w).

evidence(all_consistent(recommended_weight_range_size_160w)).
query(true_val(recommended_weight_range_size_160w, w160_220plus)).
query(true_val(recommended_weight_range_size_160w, unk_recommended_weight_range_size_160w)).

% @attr sidecut_radius_size_164w
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size (164W)
% @values r9_5_7_0_9_5=9.5_7.0_9.5 unk_sidecut_radius_size_164w=Unknown
% @importance 0.93

0.93::acc(s17, sidecut_radius_size_164w).
0.88::acc(s_merchant, sidecut_radius_size_164w).

0.97::true_val(sidecut_radius_size_164w, r9_5_7_0_9_5); 0.03::true_val(sidecut_radius_size_164w, unk_sidecut_radius_size_164w).

measured(s17, sidecut_radius_size_164w, r9_5_7_0_9_5).
measured(s_merchant, sidecut_radius_size_164w, r9_5_7_0_9_5).

all_consistent(sidecut_radius_size_164w) :-
    consistent(s17, sidecut_radius_size_164w),
    (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_164w) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_radius_size_164w)).
query(true_val(sidecut_radius_size_164w, r9_5_7_0_9_5)).
query(true_val(sidecut_radius_size_164w, unk_sidecut_radius_size_164w)).

% @attr waist_width_164w
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 164W
% @values v266=266.0 unk_waist_width_164w=Unknown
% @importance 1.0

0.93::acc(s17, waist_width_164w).

0.90::true_val(waist_width_164w, v266); 0.10::true_val(waist_width_164w, unk_waist_width_164w).

measured(s17, waist_width_164w, v266).

all_consistent(waist_width_164w) :-
    consistent(s17, waist_width_164w).

evidence(all_consistent(waist_width_164w)).
query(true_val(waist_width_164w, v266)).
query(true_val(waist_width_164w, unk_waist_width_164w)).

% @attr effective_edge_164w
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 164W
% @values v1223=1223.0 unk_effective_edge_164w=Unknown
% @importance 1.0

0.93::acc(s17, effective_edge_164w).

0.90::true_val(effective_edge_164w, v1223); 0.10::true_val(effective_edge_164w, unk_effective_edge_164w).

measured(s17, effective_edge_164w, v1223).

all_consistent(effective_edge_164w) :-
    consistent(s17, effective_edge_164w).

evidence(all_consistent(effective_edge_164w)).
query(true_val(effective_edge_164w, v1223)).
query(true_val(effective_edge_164w, unk_effective_edge_164w)).

% @attr stance_width_range_size_164w
% @type numeric
% @unit mm
% @canonical false
% @original_name stance_width_range_size (164W)
% @values v584=584.0 unk_stance_width_range_size_164w=Unknown
% @importance 0.93

0.93::acc(s17, stance_width_range_size_164w).
0.88::acc(s_merchant, stance_width_range_size_164w).

0.97::true_val(stance_width_range_size_164w, v584); 0.03::true_val(stance_width_range_size_164w, unk_stance_width_range_size_164w).

measured(s17, stance_width_range_size_164w, v584).
measured(s_merchant, stance_width_range_size_164w, v584).

all_consistent(stance_width_range_size_164w) :-
    consistent(s17, stance_width_range_size_164w),
    (indep(s_merchant), consistent(s_merchant, stance_width_range_size_164w) ; \+indep(s_merchant)).

evidence(all_consistent(stance_width_range_size_164w)).
query(true_val(stance_width_range_size_164w, v584)).
query(true_val(stance_width_range_size_164w, unk_stance_width_range_size_164w)).

% @attr recommended_weight_range_size_164w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (164W)
% @values w170_220plus=170_220plus_lbs unk_recommended_weight_range_size_164w=Unknown
% @importance 1.0

0.93::acc(s17, recommended_weight_range_size_164w).

0.90::true_val(recommended_weight_range_size_164w, w170_220plus); 0.10::true_val(recommended_weight_range_size_164w, unk_recommended_weight_range_size_164w).

measured(s17, recommended_weight_range_size_164w, w170_220plus).

all_consistent(recommended_weight_range_size_164w) :-
    consistent(s17, recommended_weight_range_size_164w).

evidence(all_consistent(recommended_weight_range_size_164w)).
query(true_val(recommended_weight_range_size_164w, w170_220plus)).
query(true_val(recommended_weight_range_size_164w, unk_recommended_weight_range_size_164w)).

% @attr boot_size_147
% @type categorical
% @canonical false
% @original_name Boot size 147cm
% @values us7_7_5=US_7_7.5 unk_boot_size_147=Unknown
% @importance 0.75

0.82::acc(s40, boot_size_147).

0.72::true_val(boot_size_147, us7_7_5); 0.28::true_val(boot_size_147, unk_boot_size_147).

measured(s40, boot_size_147, us7_7_5).

all_consistent(boot_size_147) :-
    consistent(s40, boot_size_147).

evidence(all_consistent(boot_size_147)).
query(true_val(boot_size_147, us7_7_5)).
query(true_val(boot_size_147, unk_boot_size_147)).

% @attr boot_size_151
% @type categorical
% @canonical false
% @original_name Boot size 151cm
% @values us7_5_8=US_7.5_8 unk_boot_size_151=Unknown
% @importance 0.75

0.82::acc(s40, boot_size_151).

0.72::true_val(boot_size_151, us7_5_8); 0.28::true_val(boot_size_151, unk_boot_size_151).

measured(s40, boot_size_151, us7_5_8).

all_consistent(boot_size_151) :-
    consistent(s40, boot_size_151).

evidence(all_consistent(boot_size_151)).
query(true_val(boot_size_151, us7_5_8)).
query(true_val(boot_size_151, unk_boot_size_151)).

% @attr boot_size_154
% @type categorical
% @canonical false
% @original_name Boot size 154cm
% @values us8_9=US_8_9 unk_boot_size_154=Unknown
% @importance 0.75

0.82::acc(s40, boot_size_154).

0.72::true_val(boot_size_154, us8_9); 0.28::true_val(boot_size_154, unk_boot_size_154).

measured(s40, boot_size_154, us8_9).

all_consistent(boot_size_154) :-
    consistent(s40, boot_size_154).

evidence(all_consistent(boot_size_154)).
query(true_val(boot_size_154, us8_9)).
query(true_val(boot_size_154, unk_boot_size_154)).

% @attr boot_size_157
% @type categorical
% @canonical false
% @original_name Boot size 157cm
% @values us8_5_9_5=US_8.5_9.5 unk_boot_size_157=Unknown
% @importance 0.75

0.82::acc(s40, boot_size_157).

0.72::true_val(boot_size_157, us8_5_9_5); 0.28::true_val(boot_size_157, unk_boot_size_157).

measured(s40, boot_size_157, us8_5_9_5).

all_consistent(boot_size_157) :-
    consistent(s40, boot_size_157).

evidence(all_consistent(boot_size_157)).
query(true_val(boot_size_157, us8_5_9_5)).
query(true_val(boot_size_157, unk_boot_size_157)).

% @attr boot_size_161
% @type categorical
% @canonical false
% @original_name Boot size 161cm
% @values us9_5_10=US_9.5_10 unk_boot_size_161=Unknown
% @importance 0.75

0.82::acc(s40, boot_size_161).

0.72::true_val(boot_size_161, us9_5_10); 0.28::true_val(boot_size_161, unk_boot_size_161).

measured(s40, boot_size_161, us9_5_10).

all_consistent(boot_size_161) :-
    consistent(s40, boot_size_161).

evidence(all_consistent(boot_size_161)).
query(true_val(boot_size_161, us9_5_10)).
query(true_val(boot_size_161, unk_boot_size_161)).

% @attr boot_size_155w
% @type categorical
% @canonical false
% @original_name Boot size 155W
% @values us10_10_5=US_10_10.5 unk_boot_size_155w=Unknown
% @importance 0.75

0.82::acc(s40, boot_size_155w).

0.72::true_val(boot_size_155w, us10_10_5); 0.28::true_val(boot_size_155w, unk_boot_size_155w).

measured(s40, boot_size_155w, us10_10_5).

all_consistent(boot_size_155w) :-
    consistent(s40, boot_size_155w).

evidence(all_consistent(boot_size_155w)).
query(true_val(boot_size_155w, us10_10_5)).
query(true_val(boot_size_155w, unk_boot_size_155w)).

% @attr boot_size_160w
% @type categorical
% @canonical false
% @original_name Boot size 160W
% @values us11_11_5=US_11_11.5 unk_boot_size_160w=Unknown
% @importance 0.75

0.82::acc(s40, boot_size_160w).

0.72::true_val(boot_size_160w, us11_11_5); 0.28::true_val(boot_size_160w, unk_boot_size_160w).

measured(s40, boot_size_160w, us11_11_5).

all_consistent(boot_size_160w) :-
    consistent(s40, boot_size_160w).

evidence(all_consistent(boot_size_160w)).
query(true_val(boot_size_160w, us11_11_5)).
query(true_val(boot_size_160w, unk_boot_size_160w)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values aspen_bamboo_paulownia=Aspen_Bamboo_Paulownia aspen_bamboo=Aspen_Bamboo
% @importance 0.93

0.93::acc(s17, core_material).
0.82::acc(s_merchant, core_material).

0.70::true_val(core_material, aspen_bamboo_paulownia); 0.30::true_val(core_material, aspen_bamboo).

measured(s17, core_material, aspen_bamboo_paulownia).
measured(s_merchant, core_material, aspen_bamboo).

all_consistent(core_material) :-
    consistent(s17, core_material),
    (indep(s_merchant), consistent(s_merchant, core_material) ; \+indep(s_merchant)).

evidence(all_consistent(core_material)).
query(true_val(core_material, aspen_bamboo_paulownia)).
query(true_val(core_material, aspen_bamboo)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values pre_cured_glass_usa=Pre_Cured_Glass_USA_made unk_laminate=Unknown
% @importance 0.90

0.93::acc(s17, laminate).
0.88::acc(s_merchant, laminate).
0.82::acc(s15, laminate).

0.97::true_val(laminate, pre_cured_glass_usa); 0.03::true_val(laminate, unk_laminate).

measured(s17, laminate, pre_cured_glass_usa).
measured(s_merchant, laminate, pre_cured_glass_usa).
measured(s15, laminate, pre_cured_glass_usa).

all_consistent(laminate) :-
    consistent(s17, laminate),
    (indep(s_merchant), consistent(s_merchant, laminate) ; \+indep(s_merchant)),
    consistent(s15, laminate).

evidence(all_consistent(laminate)).
query(true_val(laminate, pre_cured_glass_usa)).
query(true_val(laminate, unk_laminate)).

% @attr reviewer_opinion_whitelines_laminate
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines laminate
% @values snappier_consistent_flex=Snappier_more_consistent_flex unk_reviewer_opinion_whitelines_laminate=Unknown
% @importance 0.35

0.80::acc(s15, reviewer_opinion_whitelines_laminate).

0.68::true_val(reviewer_opinion_whitelines_laminate, snappier_consistent_flex); 0.32::true_val(reviewer_opinion_whitelines_laminate, unk_reviewer_opinion_whitelines_laminate).

measured(s15, reviewer_opinion_whitelines_laminate, snappier_consistent_flex).

all_consistent(reviewer_opinion_whitelines_laminate) :-
    consistent(s15, reviewer_opinion_whitelines_laminate).

evidence(all_consistent(reviewer_opinion_whitelines_laminate)).
query(true_val(reviewer_opinion_whitelines_laminate, snappier_consistent_flex)).
query(true_val(reviewer_opinion_whitelines_laminate, unk_reviewer_opinion_whitelines_laminate)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation (Carbon Array 3)
% @values carbon_array_3=Carbon_Array_3_three_carbon_stringers unk_construction_material_innovation=Unknown
% @importance 0.93

0.93::acc(s17, construction_material_innovation).
0.88::acc(s_merchant, construction_material_innovation).

0.97::true_val(construction_material_innovation, carbon_array_3); 0.03::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s17, construction_material_innovation, carbon_array_3).
measured(s_merchant, construction_material_innovation, carbon_array_3).

all_consistent(construction_material_innovation) :-
    consistent(s17, construction_material_innovation),
    (indep(s_merchant), consistent(s_merchant, construction_material_innovation) ; \+indep(s_merchant)).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, carbon_array_3)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr construction_material_innovation_impact_plates
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Impact Plates)
% @values single_impact=Single_Impact_Plates double_impact=Double_Impact_Plates
% @importance 0.93

0.82::acc(s_merchant, construction_material_innovation_impact_plates).
0.93::acc(s17, construction_material_innovation_impact_plates).

0.35::true_val(construction_material_innovation_impact_plates, single_impact); 0.65::true_val(construction_material_innovation_impact_plates, double_impact).

measured(s_merchant, construction_material_innovation_impact_plates, single_impact).
measured(s17, construction_material_innovation_impact_plates, double_impact).

all_consistent(construction_material_innovation_impact_plates) :-
    (indep(s_merchant), consistent(s_merchant, construction_material_innovation_impact_plates) ; \+indep(s_merchant)),
    consistent(s17, construction_material_innovation_impact_plates).

evidence(all_consistent(construction_material_innovation_impact_plates)).
query(true_val(construction_material_innovation_impact_plates, single_impact)).
query(true_val(construction_material_innovation_impact_plates, double_impact)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values slimewalls_roll_in=Slimewalls_urethane_with_Roll_In_Construction unk_sidewall_material=Unknown
% @importance 0.93

0.93::acc(s17, sidewall_material).
0.88::acc(s_merchant, sidewall_material).

0.97::true_val(sidewall_material, slimewalls_roll_in); 0.03::true_val(sidewall_material, unk_sidewall_material).

measured(s17, sidewall_material, slimewalls_roll_in).
measured(s_merchant, sidewall_material, slimewalls_roll_in).

all_consistent(sidewall_material) :-
    consistent(s17, sidewall_material),
    (indep(s_merchant), consistent(s_merchant, sidewall_material) ; \+indep(s_merchant)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, slimewalls_roll_in)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_4000_ptex=Sintered_Stone_Ground_4000_PTEX unk_base_material=Unknown
% @importance 0.93

0.93::acc(s17, base_material).
0.88::acc(s_merchant, base_material).

0.97::true_val(base_material, sintered_4000_ptex); 0.03::true_val(base_material, unk_base_material).

measured(s17, base_material, sintered_4000_ptex).
measured(s_merchant, base_material, sintered_4000_ptex).

all_consistent(base_material) :-
    consistent(s17, base_material),
    (indep(s_merchant), consistent(s_merchant, base_material) ; \+indep(s_merchant)).

evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_4000_ptex)).
query(true_val(base_material, unk_base_material)).

% @attr base_type
% @type categorical
% @canonical false
% @original_name base_type
% @values high_end_sintered=High_end_sintered_more_durable_harder_faster unk_base_type=Unknown
% @importance 1.0

0.93::acc(s17, base_type).

0.90::true_val(base_type, high_end_sintered); 0.10::true_val(base_type, unk_base_type).

measured(s17, base_type, high_end_sintered).

all_consistent(base_type) :-
    consistent(s17, base_type).

evidence(all_consistent(base_type)).
query(true_val(base_type, high_end_sintered)).
query(true_val(base_type, unk_base_type)).

% @attr topsheet
% @type categorical
% @canonical false
% @original_name topsheet
% @values topless_topsheet=Topless_Topsheet_graphics_on_fiberglass_urethane unk_topsheet=Unknown
% @importance 0.93

0.93::acc(s17, topsheet).
0.88::acc(s_merchant, topsheet).

0.97::true_val(topsheet, topless_topsheet); 0.03::true_val(topsheet, unk_topsheet).

measured(s17, topsheet, topless_topsheet).
measured(s_merchant, topsheet, topless_topsheet).

all_consistent(topsheet) :-
    consistent(s17, topsheet),
    (indep(s_merchant), consistent(s_merchant, topsheet) ; \+indep(s_merchant)).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, topless_topsheet)).
query(true_val(topsheet, unk_topsheet)).

% @attr edge_technology
% @type categorical
% @canonical false
% @original_name edge_technology
% @values steel_30pct_recycled=Standard_Steel_Edge_30pct_recycled unk_edge_technology=Unknown
% @importance 0.93

0.93::acc(s17, edge_technology).
0.88::acc(s_merchant, edge_technology).

0.97::true_val(edge_technology, steel_30pct_recycled); 0.03::true_val(edge_technology, unk_edge_technology).

measured(s17, edge_technology, steel_30pct_recycled).
measured(s_merchant, edge_technology, steel_30pct_recycled).

all_consistent(edge_technology) :-
    consistent(s17, edge_technology),
    (indep(s_merchant), consistent(s_merchant, edge_technology) ; \+indep(s_merchant)).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, steel_30pct_recycled)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr sustainability_certification_wend_wax
% @type categorical
% @canonical false
% @original_name sustainability_certification (WEND wax)
% @values wend_meadowfoam=WEND_Meadowfoam_biodegradable_wax unk_sustainability_certification_wend_wax=Unknown
% @importance 1.0

0.93::acc(s17, sustainability_certification_wend_wax).

0.90::true_val(sustainability_certification_wend_wax, wend_meadowfoam); 0.10::true_val(sustainability_certification_wend_wax, unk_sustainability_certification_wend_wax).

measured(s17, sustainability_certification_wend_wax, wend_meadowfoam).

all_consistent(sustainability_certification_wend_wax) :-
    consistent(s17, sustainability_certification_wend_wax).

evidence(all_consistent(sustainability_certification_wend_wax)).
query(true_val(sustainability_certification_wend_wax, wend_meadowfoam)).
query(true_val(sustainability_certification_wend_wax, unk_sustainability_certification_wend_wax)).

% @attr thin_con
% @type categorical
% @canonical false
% @original_name Additional feature Thin Con
% @values tapered_tips_tails=Tapered_tips_tails_reduced_swing_weight unk_thin_con=Unknown
% @importance 0.85

0.88::acc(s_merchant, thin_con).

0.88::true_val(thin_con, tapered_tips_tails); 0.12::true_val(thin_con, unk_thin_con).

measured(s_merchant, thin_con, tapered_tips_tails).

all_consistent(thin_con) :-
    consistent(s_merchant, thin_con).

evidence(all_consistent(thin_con)).
query(true_val(thin_con, tapered_tips_tails)).
query(true_val(thin_con, unk_thin_con)).

% @attr board_weight_grams
% @type categorical
% @canonical true
% @original_name board_weight_grams
% @values pretty_normal=Pretty_normal_weight_not_published unk_board_weight_grams=Unknown
% @importance 0.75

0.82::acc(s40, board_weight_grams).

0.72::true_val(board_weight_grams, pretty_normal); 0.28::true_val(board_weight_grams, unk_board_weight_grams).

measured(s40, board_weight_grams, pretty_normal).

all_consistent(board_weight_grams) :-
    consistent(s40, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, pretty_normal)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification (30% recycled)
% @values thirty_pct_recycled=30_percent_recycled_materials unk_sustainability_certification=Unknown
% @importance 1.0

0.93::acc(s17, sustainability_certification).

0.90::true_val(sustainability_certification, thirty_pct_recycled); 0.10::true_val(sustainability_certification, unk_sustainability_certification).

measured(s17, sustainability_certification, thirty_pct_recycled).

all_consistent(sustainability_certification) :-
    consistent(s17, sustainability_certification).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, thirty_pct_recycled)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr sustainability_certification_fsc
% @type categorical
% @canonical false
% @original_name sustainability_certification (FSC)
% @values fsc_certified_stickers_boxes=FSC_certified_stickers_and_boxes unk_sustainability_certification_fsc=Unknown
% @importance 1.0

0.93::acc(s17, sustainability_certification_fsc).

0.90::true_val(sustainability_certification_fsc, fsc_certified_stickers_boxes); 0.10::true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc).

measured(s17, sustainability_certification_fsc, fsc_certified_stickers_boxes).

all_consistent(sustainability_certification_fsc) :-
    consistent(s17, sustainability_certification_fsc).

evidence(all_consistent(sustainability_certification_fsc)).
query(true_val(sustainability_certification_fsc, fsc_certified_stickers_boxes)).
query(true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc)).

% @attr sustainability_certification_solar
% @type categorical
% @canonical false
% @original_name sustainability_certification (solar)
% @values solar_44pct=44_percent_solar_energy unk_sustainability_certification_solar=Unknown
% @importance 1.0

0.93::acc(s17, sustainability_certification_solar).

0.90::true_val(sustainability_certification_solar, solar_44pct); 0.10::true_val(sustainability_certification_solar, unk_sustainability_certification_solar).

measured(s17, sustainability_certification_solar, solar_44pct).

all_consistent(sustainability_certification_solar) :-
    consistent(s17, sustainability_certification_solar).

evidence(all_consistent(sustainability_certification_solar)).
query(true_val(sustainability_certification_solar, solar_44pct)).
query(true_val(sustainability_certification_solar, unk_sustainability_certification_solar)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values three_year_structural=3_year_warranty_structural_defects unk_warranty=Unknown
% @importance 0.75

0.95::acc(s41, warranty).

0.90::true_val(warranty, three_year_structural); 0.10::true_val(warranty, unk_warranty).

measured(s41, warranty, three_year_structural).

all_consistent(warranty) :-
    consistent(s41, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, three_year_structural)).
query(true_val(warranty, unk_warranty)).

% @attr warranty_exclusions
% @type categorical
% @canonical false
% @original_name warranty exclusions
% @values impact_cosmetic_misuse=Impact_cosmetic_improper_mounting_misuse unk_warranty_exclusions=Unknown
% @importance 0.75

0.95::acc(s41, warranty_exclusions).

0.90::true_val(warranty_exclusions, impact_cosmetic_misuse); 0.10::true_val(warranty_exclusions, unk_warranty_exclusions).

measured(s41, warranty_exclusions, impact_cosmetic_misuse).

all_consistent(warranty_exclusions) :-
    consistent(s41, warranty_exclusions).

evidence(all_consistent(warranty_exclusions)).
query(true_val(warranty_exclusions, impact_cosmetic_misuse)).
query(true_val(warranty_exclusions, unk_warranty_exclusions)).

% @attr whitelines_100_award
% @type categorical
% @canonical false
% @original_name Whitelines 100 award
% @values selected_2023_2024=Whitelines_100_2023_and_2024 unk_whitelines_100_award=Unknown
% @importance 0.60

0.82::acc(s31, whitelines_100_award).
0.82::acc(s42, whitelines_100_award).

0.95::true_val(whitelines_100_award, selected_2023_2024); 0.05::true_val(whitelines_100_award, unk_whitelines_100_award).

measured(s31, whitelines_100_award, selected_2023_2024).
measured(s42, whitelines_100_award, selected_2023_2024).

all_consistent(whitelines_100_award) :-
    consistent(s31, whitelines_100_award),
    consistent(s42, whitelines_100_award).

evidence(all_consistent(whitelines_100_award)).
query(true_val(whitelines_100_award, selected_2023_2024)).
query(true_val(whitelines_100_award, unk_whitelines_100_award)).

% @attr snowboard_magazine_platinum_pick
% @type categorical
% @canonical false
% @original_name Snowboard Magazine Platinum Pick
% @values best_of_23=Best_of_23_Platinum_Pick unk_snowboard_magazine_platinum_pick=Unknown
% @importance 0.90

0.88::acc(s16, snowboard_magazine_platinum_pick).

0.77::true_val(snowboard_magazine_platinum_pick, best_of_23); 0.23::true_val(snowboard_magazine_platinum_pick, unk_snowboard_magazine_platinum_pick).

measured(s16, snowboard_magazine_platinum_pick, best_of_23).

all_consistent(snowboard_magazine_platinum_pick) :-
    consistent(s16, snowboard_magazine_platinum_pick).

evidence(all_consistent(snowboard_magazine_platinum_pick)).
query(true_val(snowboard_magazine_platinum_pick, best_of_23)).
query(true_val(snowboard_magazine_platinum_pick, unk_snowboard_magazine_platinum_pick)).

% @attr reviewer_opinion_the_good_ride_awards
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (awards)
% @values fav_2024_hon_mention_2025=Favorite_2024_Honorable_Mention_2025 unk_reviewer_opinion_the_good_ride_awards=Unknown
% @importance 0.73

0.85::acc(s43, reviewer_opinion_the_good_ride_awards).

0.68::true_val(reviewer_opinion_the_good_ride_awards, fav_2024_hon_mention_2025); 0.32::true_val(reviewer_opinion_the_good_ride_awards, unk_reviewer_opinion_the_good_ride_awards).

measured(s43, reviewer_opinion_the_good_ride_awards, fav_2024_hon_mention_2025).

all_consistent(reviewer_opinion_the_good_ride_awards) :-
    consistent(s43, reviewer_opinion_the_good_ride_awards).

evidence(all_consistent(reviewer_opinion_the_good_ride_awards)).
query(true_val(reviewer_opinion_the_good_ride_awards, fav_2024_hon_mention_2025)).
query(true_val(reviewer_opinion_the_good_ride_awards, unk_reviewer_opinion_the_good_ride_awards)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values algorythm_less_damp_more_pop=Algorythm_with_less_dampness_more_pop_very_versatile unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.90

0.88::acc(s37, reviewer_opinion_the_good_ride).

0.77::true_val(reviewer_opinion_the_good_ride, algorythm_less_damp_more_pop); 0.23::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s37, reviewer_opinion_the_good_ride, algorythm_less_damp_more_pop).

all_consistent(reviewer_opinion_the_good_ride) :-
    consistent(s37, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, algorythm_less_damp_more_pop)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr reviewer_opinion_the_good_ride_endorsement
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (endorsement)
% @values asked_to_keep=Liked_so_much_asked_to_keep unk_reviewer_opinion_the_good_ride_endorsement=Unknown
% @importance 0.65

0.85::acc(s44, reviewer_opinion_the_good_ride_endorsement).

0.72::true_val(reviewer_opinion_the_good_ride_endorsement, asked_to_keep); 0.28::true_val(reviewer_opinion_the_good_ride_endorsement, unk_reviewer_opinion_the_good_ride_endorsement).

measured(s44, reviewer_opinion_the_good_ride_endorsement, asked_to_keep).

all_consistent(reviewer_opinion_the_good_ride_endorsement) :-
    consistent(s44, reviewer_opinion_the_good_ride_endorsement).

evidence(all_consistent(reviewer_opinion_the_good_ride_endorsement)).
query(true_val(reviewer_opinion_the_good_ride_endorsement, asked_to_keep)).
query(true_val(reviewer_opinion_the_good_ride_endorsement, unk_reviewer_opinion_the_good_ride_endorsement)).

% @attr evo_field_review_verdict
% @type categorical
% @canonical false
% @original_name evo field review verdict
% @values all_mountain_dream=All_mountain_dream unk_evo_field_review_verdict=Unknown
% @importance 0.65

0.78::acc(s45, evo_field_review_verdict).

0.64::true_val(evo_field_review_verdict, all_mountain_dream); 0.36::true_val(evo_field_review_verdict, unk_evo_field_review_verdict).

measured(s45, evo_field_review_verdict, all_mountain_dream).

all_consistent(evo_field_review_verdict) :-
    consistent(s45, evo_field_review_verdict).

evidence(all_consistent(evo_field_review_verdict)).
query(true_val(evo_field_review_verdict, all_mountain_dream)).
query(true_val(evo_field_review_verdict, unk_evo_field_review_verdict)).

% @attr positive_aspect
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values versatile_groomers_to_pow=Versatile_groomers_to_pow_tech_excels_high_energy unk_positive_aspect=Unknown
% @importance 0.80

0.78::acc(s46, positive_aspect).

0.64::true_val(positive_aspect, versatile_groomers_to_pow); 0.36::true_val(positive_aspect, unk_positive_aspect).

measured(s46, positive_aspect, versatile_groomers_to_pow).

all_consistent(positive_aspect) :-
    consistent(s46, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, versatile_groomers_to_pow)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values soft_not_supportive_heavy_riders=Soft_may_not_support_heavier_riders unk_negative_aspect=Unknown
% @importance 0.80

0.78::acc(s46, negative_aspect).

0.64::true_val(negative_aspect, soft_not_supportive_heavy_riders); 0.36::true_val(negative_aspect, unk_negative_aspect).

measured(s46, negative_aspect, soft_not_supportive_heavy_riders).

all_consistent(negative_aspect) :-
    consistent(s46, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, soft_not_supportive_heavy_riders)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_powder
% @type categorical
% @canonical false
% @original_name negative_aspect (deep powder)
% @values size_up_or_set_back=Deep_powder_size_up_or_mount_bindings_back unk_negative_aspect_powder=Unknown
% @importance 0.80

0.78::acc(s46, negative_aspect_powder).

0.64::true_val(negative_aspect_powder, size_up_or_set_back); 0.36::true_val(negative_aspect_powder, unk_negative_aspect_powder).

measured(s46, negative_aspect_powder, size_up_or_set_back).

all_consistent(negative_aspect_powder) :-
    consistent(s46, negative_aspect_powder).

evidence(all_consistent(negative_aspect_powder)).
query(true_val(negative_aspect_powder, size_up_or_set_back)).
query(true_val(negative_aspect_powder, unk_negative_aspect_powder)).

% @attr curated_expert_value
% @type categorical
% @canonical false
% @original_name Curated expert value assessment
% @values punches_above_class=Punches_above_price_class unk_curated_expert_value=Unknown
% @importance 0.85

0.75::acc(s20, curated_expert_value).

0.60::true_val(curated_expert_value, punches_above_class); 0.40::true_val(curated_expert_value, unk_curated_expert_value).

measured(s20, curated_expert_value, punches_above_class).

all_consistent(curated_expert_value) :-
    consistent(s20, curated_expert_value).

evidence(all_consistent(curated_expert_value)).
query(true_val(curated_expert_value, punches_above_class)).
query(true_val(curated_expert_value, unk_curated_expert_value)).

% @attr curated_expert_comparison
% @type categorical
% @canonical false
% @original_name Curated expert comparison
% @values better_stability_snap_turn=Better_stability_than_Mtn_Twin_snap_than_Standard_easier_turns_than_Coda unk_curated_expert_comparison=Unknown
% @importance 0.85

0.75::acc(s20, curated_expert_comparison).

0.60::true_val(curated_expert_comparison, better_stability_snap_turn); 0.40::true_val(curated_expert_comparison, unk_curated_expert_comparison).

measured(s20, curated_expert_comparison, better_stability_snap_turn).

all_consistent(curated_expert_comparison) :-
    consistent(s20, curated_expert_comparison).

evidence(all_consistent(curated_expert_comparison)).
query(true_val(curated_expert_comparison, better_stability_snap_turn)).
query(true_val(curated_expert_comparison, unk_curated_expert_comparison)).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles
% @values versatile_mellow_side=Versatile_all_mountain_mellow_side unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.85

0.80::acc(s32, reviewer_opinion_snowboardingprofiles).

0.68::true_val(reviewer_opinion_snowboardingprofiles, versatile_mellow_side); 0.32::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).

measured(s32, reviewer_opinion_snowboardingprofiles, versatile_mellow_side).

all_consistent(reviewer_opinion_snowboardingprofiles) :-
    consistent(s32, reviewer_opinion_snowboardingprofiles).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, versatile_mellow_side)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

% @attr powder_score_snowboardingprofiles
% @type categorical
% @canonical false
% @original_name powder_score_snowboardingprofiles
% @values above_middle=Just_above_middle_of_road unk_powder_score_snowboardingprofiles=Unknown
% @importance 0.70

0.72::acc(s47, powder_score_snowboardingprofiles).

0.49::true_val(powder_score_snowboardingprofiles, above_middle); 0.51::true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles).

measured(s47, powder_score_snowboardingprofiles, above_middle).

all_consistent(powder_score_snowboardingprofiles) :-
    consistent(s47, powder_score_snowboardingprofiles).

evidence(all_consistent(powder_score_snowboardingprofiles)).
query(true_val(powder_score_snowboardingprofiles, above_middle)).
query(true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles)).

% @attr carving_score_snowboardingprofiles
% @type categorical
% @canonical false
% @original_name carving_score_snowboardingprofiles
% @values decent_carver=Decent_carver_better_than_control_not_as_good_as_Algorhythm unk_carving_score_snowboardingprofiles=Unknown
% @importance 0.75

0.75::acc(s48, carving_score_snowboardingprofiles).

0.56::true_val(carving_score_snowboardingprofiles, decent_carver); 0.44::true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles).

measured(s48, carving_score_snowboardingprofiles, decent_carver).

all_consistent(carving_score_snowboardingprofiles) :-
    consistent(s48, carving_score_snowboardingprofiles).

evidence(all_consistent(carving_score_snowboardingprofiles)).
query(true_val(carving_score_snowboardingprofiles, decent_carver)).
query(true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles)).

% @attr pop
% @type categorical
% @canonical false
% @original_name pop
% @values poppy_snappy=Poppy_snappy_from_Carbon_Array_3_and_mellow_camber unk_pop=Unknown
% @importance 0.75

0.78::acc(s39, pop).
0.88::acc(s37, pop).

0.95::true_val(pop, poppy_snappy); 0.05::true_val(pop, unk_pop).

measured(s39, pop, poppy_snappy).
measured(s37, pop, poppy_snappy).

all_consistent(pop) :-
    consistent(s39, pop),
    consistent(s37, pop).

evidence(all_consistent(pop)).
query(true_val(pop, poppy_snappy)).
query(true_val(pop, unk_pop)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values very_competent_not_grabby=Very_competent_grip_not_grabby_in_soft_snow unk_edge_hold=Unknown
% @importance 0.90

0.88::acc(s37, edge_hold).

0.77::true_val(edge_hold, very_competent_not_grabby); 0.23::true_val(edge_hold, unk_edge_hold).

measured(s37, edge_hold, very_competent_not_grabby).

all_consistent(edge_hold) :-
    consistent(s37, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, very_competent_not_grabby)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr chatter_performance
% @type categorical
% @canonical false
% @original_name chatter_performance
% @values not_as_damp_as_algorhythm_sufficient=Not_as_damp_as_Algorhythm_but_sufficient unk_chatter_performance=Unknown
% @importance 0.90

0.88::acc(s37, chatter_performance).

0.77::true_val(chatter_performance, not_as_damp_as_algorhythm_sufficient); 0.23::true_val(chatter_performance, unk_chatter_performance).

measured(s37, chatter_performance, not_as_damp_as_algorhythm_sufficient).

all_consistent(chatter_performance) :-
    consistent(s37, chatter_performance).

evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, not_as_damp_as_algorhythm_sufficient)).
query(true_val(chatter_performance, unk_chatter_performance)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values pretty_good=Pretty_good_nothing_exceptional slow_for_sintered=Slow_despite_sintered
% @importance 0.85

0.85::acc(s37, base_glide_performance).
0.60::acc(s33, base_glide_performance).

0.55::true_val(base_glide_performance, pretty_good); 0.45::true_val(base_glide_performance, slow_for_sintered).

measured(s37, base_glide_performance, pretty_good).
measured(s33, base_glide_performance, slow_for_sintered).

all_consistent(base_glide_performance) :-
    consistent(s37, base_glide_performance),
    consistent(s33, base_glide_performance).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, pretty_good)).
query(true_val(base_glide_performance, slow_for_sintered)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum (speed handling)
% @values stable_over_40mph=Handles_speed_well_stable_over_40mph unk_user_review_forum=Unknown
% @importance 0.80

0.60::acc(s33, user_review_forum).

0.38::true_val(user_review_forum, stable_over_40mph); 0.62::true_val(user_review_forum, unk_user_review_forum).

measured(s33, user_review_forum, stable_over_40mph).

all_consistent(user_review_forum) :-
    consistent(s33, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, stable_over_40mph)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr turn_initiation_performance
% @type categorical
% @canonical false
% @original_name turn_initiation_performance
% @values very_nice_quick_stable=Turns_very_nice_quick_turny_sidecut_stable_carving unk_turn_initiation_performance=Unknown
% @importance 0.80

0.60::acc(s33, turn_initiation_performance).

0.38::true_val(turn_initiation_performance, very_nice_quick_stable); 0.62::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s33, turn_initiation_performance, very_nice_quick_stable).

all_consistent(turn_initiation_performance) :-
    consistent(s33, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, very_nice_quick_stable)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr buttering_pressing
% @type categorical
% @canonical false
% @original_name Buttering/pressing
% @values takes_effort_easier_after_break_in=Takes_effort_easier_after_12_14_rides unk_buttering_pressing=Unknown
% @importance 0.78

0.72::acc(s48, buttering_pressing).
0.60::acc(s33, buttering_pressing).

0.95::true_val(buttering_pressing, takes_effort_easier_after_break_in); 0.05::true_val(buttering_pressing, unk_buttering_pressing).

measured(s48, buttering_pressing, takes_effort_easier_after_break_in).
measured(s33, buttering_pressing, takes_effort_easier_after_break_in).

all_consistent(buttering_pressing) :-
    consistent(s48, buttering_pressing),
    consistent(s33, buttering_pressing).

evidence(all_consistent(buttering_pressing)).
query(true_val(buttering_pressing, takes_effort_easier_after_break_in)).
query(true_val(buttering_pressing, unk_buttering_pressing)).

% @attr switch_riding
% @type categorical
% @canonical false
% @original_name switch_riding
% @values capable_more_comfortable_preferred=Capable_switch_more_comfortable_preferred_stance unk_switch_riding=Unknown
% @importance 0.70

0.82::acc(s38, switch_riding).

0.72::true_val(switch_riding, capable_more_comfortable_preferred); 0.28::true_val(switch_riding, unk_switch_riding).

measured(s38, switch_riding, capable_more_comfortable_preferred).

all_consistent(switch_riding) :-
    consistent(s38, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, capable_more_comfortable_preferred)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr float_in_powder
% @type categorical
% @canonical false
% @original_name Float in powder
% @values floats_well_19mm_setback=Floats_well_with_19mm_setback_2_25in_back_from_center unk_float_in_powder=Unknown
% @importance 0.60

0.85::acc(s49, float_in_powder).

0.68::true_val(float_in_powder, floats_well_19mm_setback); 0.32::true_val(float_in_powder, unk_float_in_powder).

measured(s49, float_in_powder, floats_well_19mm_setback).

all_consistent(float_in_powder) :-
    consistent(s49, float_in_powder).

evidence(all_consistent(float_in_powder)).
query(true_val(float_in_powder, floats_well_19mm_setback)).
query(true_val(float_in_powder, unk_float_in_powder)).

% @attr reviewer_opinion_the_good_ride_forgiving
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (forgiving)
% @values forgiving_stable_all_levels=Very_forgiving_stable_all_ability_levels unk_reviewer_opinion_the_good_ride_forgiving=Unknown
% @importance 0.90

0.88::acc(s37, reviewer_opinion_the_good_ride_forgiving).

0.77::true_val(reviewer_opinion_the_good_ride_forgiving, forgiving_stable_all_levels); 0.23::true_val(reviewer_opinion_the_good_ride_forgiving, unk_reviewer_opinion_the_good_ride_forgiving).

measured(s37, reviewer_opinion_the_good_ride_forgiving, forgiving_stable_all_levels).

all_consistent(reviewer_opinion_the_good_ride_forgiving) :-
    consistent(s37, reviewer_opinion_the_good_ride_forgiving).

evidence(all_consistent(reviewer_opinion_the_good_ride_forgiving)).
query(true_val(reviewer_opinion_the_good_ride_forgiving, forgiving_stable_all_levels)).
query(true_val(reviewer_opinion_the_good_ride_forgiving, unk_reviewer_opinion_the_good_ride_forgiving)).

% @attr reviewer_opinion_the_good_ride_tracking
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (tracking)
% @values tracks_well_easy_skid=Tracks_super_well_one_footing_flat_basing_easy_skid unk_reviewer_opinion_the_good_ride_tracking=Unknown
% @importance 0.90

0.88::acc(s37, reviewer_opinion_the_good_ride_tracking).

0.77::true_val(reviewer_opinion_the_good_ride_tracking, tracks_well_easy_skid); 0.23::true_val(reviewer_opinion_the_good_ride_tracking, unk_reviewer_opinion_the_good_ride_tracking).

measured(s37, reviewer_opinion_the_good_ride_tracking, tracks_well_easy_skid).

all_consistent(reviewer_opinion_the_good_ride_tracking) :-
    consistent(s37, reviewer_opinion_the_good_ride_tracking).

evidence(all_consistent(reviewer_opinion_the_good_ride_tracking)).
query(true_val(reviewer_opinion_the_good_ride_tracking, tracks_well_easy_skid)).
query(true_val(reviewer_opinion_the_good_ride_tracking, unk_reviewer_opinion_the_good_ride_tracking)).

% @attr user_review_forum_topsheet_scratch
% @type categorical
% @canonical false
% @original_name user_review_forum (topsheet scratch)
% @values scratches_easily=Black_topsheet_scratches_easily_white_underneath unk_user_review_forum_topsheet_scratch=Unknown
% @importance 0.80

0.60::acc(s33, user_review_forum_topsheet_scratch).

0.38::true_val(user_review_forum_topsheet_scratch, scratches_easily); 0.62::true_val(user_review_forum_topsheet_scratch, unk_user_review_forum_topsheet_scratch).

measured(s33, user_review_forum_topsheet_scratch, scratches_easily).

all_consistent(user_review_forum_topsheet_scratch) :-
    consistent(s33, user_review_forum_topsheet_scratch).

evidence(all_consistent(user_review_forum_topsheet_scratch)).
query(true_val(user_review_forum_topsheet_scratch, scratches_easily)).
query(true_val(user_review_forum_topsheet_scratch, unk_user_review_forum_topsheet_scratch)).

% @attr user_review_forum_topsheet_chip
% @type categorical
% @canonical false
% @original_name user_review_forum (topsheet chip resistance)
% @values doesnt_chip_roll_in=Doesnt_chip_easily_Roll_In_Construction_helps unk_user_review_forum_topsheet_chip=Unknown
% @importance 0.80

0.60::acc(s33, user_review_forum_topsheet_chip).

0.38::true_val(user_review_forum_topsheet_chip, doesnt_chip_roll_in); 0.62::true_val(user_review_forum_topsheet_chip, unk_user_review_forum_topsheet_chip).

measured(s33, user_review_forum_topsheet_chip, doesnt_chip_roll_in).

all_consistent(user_review_forum_topsheet_chip) :-
    consistent(s33, user_review_forum_topsheet_chip).

evidence(all_consistent(user_review_forum_topsheet_chip)).
query(true_val(user_review_forum_topsheet_chip, doesnt_chip_roll_in)).
query(true_val(user_review_forum_topsheet_chip, unk_user_review_forum_topsheet_chip)).

% @attr user_review_forum_topsheet_concern
% @type categorical
% @canonical false
% @original_name user_review_forum (topsheet concern)
% @values dealbreaker_for_some=Multiple_users_talked_out_due_to_topsheet unk_user_review_forum_topsheet_concern=Unknown
% @importance 0.70

0.50::acc(s50, user_review_forum_topsheet_concern).

0.32::true_val(user_review_forum_topsheet_concern, dealbreaker_for_some); 0.68::true_val(user_review_forum_topsheet_concern, unk_user_review_forum_topsheet_concern).

measured(s50, user_review_forum_topsheet_concern, dealbreaker_for_some).

all_consistent(user_review_forum_topsheet_concern) :-
    consistent(s50, user_review_forum_topsheet_concern).

evidence(all_consistent(user_review_forum_topsheet_concern)).
query(true_val(user_review_forum_topsheet_concern, dealbreaker_for_some)).
query(true_val(user_review_forum_topsheet_concern, unk_user_review_forum_topsheet_concern)).

% @attr user_review_forum_base_speed
% @type categorical
% @canonical false
% @original_name user_review_forum (base speed)
% @values slower_than_yes=Base_slower_than_competitor_boards_eg_YES unk_user_review_forum_base_speed=Unknown
% @importance 0.80

0.60::acc(s33, user_review_forum_base_speed).

0.38::true_val(user_review_forum_base_speed, slower_than_yes); 0.62::true_val(user_review_forum_base_speed, unk_user_review_forum_base_speed).

measured(s33, user_review_forum_base_speed, slower_than_yes).

all_consistent(user_review_forum_base_speed) :-
    consistent(s33, user_review_forum_base_speed).

evidence(all_consistent(user_review_forum_base_speed)).
query(true_val(user_review_forum_base_speed, slower_than_yes)).
query(true_val(user_review_forum_base_speed, unk_user_review_forum_base_speed)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand (Jones Mountain Twin)
% @values jones_mountain_twin=Jones_Mountain_Twin unk_comparable_board_cross_brand=Unknown
% @importance 0.70

0.65::acc(s51, comparable_board_cross_brand).

0.38::true_val(comparable_board_cross_brand, jones_mountain_twin); 0.62::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s51, comparable_board_cross_brand, jones_mountain_twin).

all_consistent(comparable_board_cross_brand) :-
    consistent(s51, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, jones_mountain_twin)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand (Algorhythm)
% @values ride_algorhythm=Ride_Algorhythm unk_comparable_board_same_brand=Unknown
% @importance 0.90

0.88::acc(s37, comparable_board_same_brand).

0.77::true_val(comparable_board_same_brand, ride_algorhythm); 0.23::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s37, comparable_board_same_brand, ride_algorhythm).

all_consistent(comparable_board_same_brand) :-
    consistent(s37, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, ride_algorhythm)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_cross_brand_yes_basic
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (YES Basic Uninc)
% @values yes_basic_uninc=YES_Basic_Uninc unk_comparable_board_cross_brand_yes_basic=Unknown
% @importance 0.90

0.88::acc(s37, comparable_board_cross_brand_yes_basic).

0.77::true_val(comparable_board_cross_brand_yes_basic, yes_basic_uninc); 0.23::true_val(comparable_board_cross_brand_yes_basic, unk_comparable_board_cross_brand_yes_basic).

measured(s37, comparable_board_cross_brand_yes_basic, yes_basic_uninc).

all_consistent(comparable_board_cross_brand_yes_basic) :-
    consistent(s37, comparable_board_cross_brand_yes_basic).

evidence(all_consistent(comparable_board_cross_brand_yes_basic)).
query(true_val(comparable_board_cross_brand_yes_basic, yes_basic_uninc)).
query(true_val(comparable_board_cross_brand_yes_basic, unk_comparable_board_cross_brand_yes_basic)).

% @attr comparable_board_cross_brand_yes_standard
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (YES Standard)
% @values yes_standard=YES_Standard unk_comparable_board_cross_brand_yes_standard=Unknown
% @importance 0.70

0.55::acc(s52, comparable_board_cross_brand_yes_standard).

0.40::true_val(comparable_board_cross_brand_yes_standard, yes_standard); 0.60::true_val(comparable_board_cross_brand_yes_standard, unk_comparable_board_cross_brand_yes_standard).

measured(s52, comparable_board_cross_brand_yes_standard, yes_standard).

all_consistent(comparable_board_cross_brand_yes_standard) :-
    consistent(s52, comparable_board_cross_brand_yes_standard).

evidence(all_consistent(comparable_board_cross_brand_yes_standard)).
query(true_val(comparable_board_cross_brand_yes_standard, yes_standard)).
query(true_val(comparable_board_cross_brand_yes_standard, unk_comparable_board_cross_brand_yes_standard)).

% @attr comparable_board_cross_brand_arbor_coda
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Arbor Coda Camber)
% @values arbor_coda_camber=Arbor_Coda_Camber unk_comparable_board_cross_brand_arbor_coda=Unknown
% @importance 0.85

0.75::acc(s20, comparable_board_cross_brand_arbor_coda).

0.60::true_val(comparable_board_cross_brand_arbor_coda, arbor_coda_camber); 0.40::true_val(comparable_board_cross_brand_arbor_coda, unk_comparable_board_cross_brand_arbor_coda).

measured(s20, comparable_board_cross_brand_arbor_coda, arbor_coda_camber).

all_consistent(comparable_board_cross_brand_arbor_coda) :-
    consistent(s20, comparable_board_cross_brand_arbor_coda).

evidence(all_consistent(comparable_board_cross_brand_arbor_coda)).
query(true_val(comparable_board_cross_brand_arbor_coda, arbor_coda_camber)).
query(true_val(comparable_board_cross_brand_arbor_coda, unk_comparable_board_cross_brand_arbor_coda)).

% @attr comparable_board_cross_brand_capita_mercury
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Capita Mercury)
% @values capita_mercury=Capita_Mercury unk_comparable_board_cross_brand_capita_mercury=Unknown
% @importance 0.75

0.85::acc(s53, comparable_board_cross_brand_capita_mercury).

0.72::true_val(comparable_board_cross_brand_capita_mercury, capita_mercury); 0.28::true_val(comparable_board_cross_brand_capita_mercury, unk_comparable_board_cross_brand_capita_mercury).

measured(s53, comparable_board_cross_brand_capita_mercury, capita_mercury).

all_consistent(comparable_board_cross_brand_capita_mercury) :-
    consistent(s53, comparable_board_cross_brand_capita_mercury).

evidence(all_consistent(comparable_board_cross_brand_capita_mercury)).
query(true_val(comparable_board_cross_brand_capita_mercury, capita_mercury)).
query(true_val(comparable_board_cross_brand_capita_mercury, unk_comparable_board_cross_brand_capita_mercury)).

% @attr comparable_board_cross_brand_k2_manifest
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (K2 Manifest)
% @values k2_manifest=K2_Manifest unk_comparable_board_cross_brand_k2_manifest=Unknown
% @importance 0.75

0.85::acc(s53, comparable_board_cross_brand_k2_manifest).

0.72::true_val(comparable_board_cross_brand_k2_manifest, k2_manifest); 0.28::true_val(comparable_board_cross_brand_k2_manifest, unk_comparable_board_cross_brand_k2_manifest).

measured(s53, comparable_board_cross_brand_k2_manifest, k2_manifest).

all_consistent(comparable_board_cross_brand_k2_manifest) :-
    consistent(s53, comparable_board_cross_brand_k2_manifest).

evidence(all_consistent(comparable_board_cross_brand_k2_manifest)).
query(true_val(comparable_board_cross_brand_k2_manifest, k2_manifest)).
query(true_val(comparable_board_cross_brand_k2_manifest, unk_comparable_board_cross_brand_k2_manifest)).

% @attr comparable_board_cross_brand_nidecker_escape
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Nidecker Escape)
% @values nidecker_escape=Nidecker_Escape unk_comparable_board_cross_brand_nidecker_escape=Unknown
% @importance 0.70

0.55::acc(s52, comparable_board_cross_brand_nidecker_escape).

0.40::true_val(comparable_board_cross_brand_nidecker_escape, nidecker_escape); 0.60::true_val(comparable_board_cross_brand_nidecker_escape, unk_comparable_board_cross_brand_nidecker_escape).

measured(s52, comparable_board_cross_brand_nidecker_escape, nidecker_escape).

all_consistent(comparable_board_cross_brand_nidecker_escape) :-
    consistent(s52, comparable_board_cross_brand_nidecker_escape).

evidence(all_consistent(comparable_board_cross_brand_nidecker_escape)).
query(true_val(comparable_board_cross_brand_nidecker_escape, nidecker_escape)).
query(true_val(comparable_board_cross_brand_nidecker_escape, unk_comparable_board_cross_brand_nidecker_escape)).

% @attr comparable_board_cross_brand_rome_agent
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Rome Agent)
% @values rome_agent=Rome_Agent unk_comparable_board_cross_brand_rome_agent=Unknown
% @importance 0.70

0.55::acc(s52, comparable_board_cross_brand_rome_agent).

0.40::true_val(comparable_board_cross_brand_rome_agent, rome_agent); 0.60::true_val(comparable_board_cross_brand_rome_agent, unk_comparable_board_cross_brand_rome_agent).

measured(s52, comparable_board_cross_brand_rome_agent, rome_agent).

all_consistent(comparable_board_cross_brand_rome_agent) :-
    consistent(s52, comparable_board_cross_brand_rome_agent).

evidence(all_consistent(comparable_board_cross_brand_rome_agent)).
query(true_val(comparable_board_cross_brand_rome_agent, rome_agent)).
query(true_val(comparable_board_cross_brand_rome_agent, unk_comparable_board_cross_brand_rome_agent)).

% @attr comparable_board_cross_brand_lib_tech_tw
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Lib Tech Terrain Wrecker)
% @values lib_tech_terrain_wrecker=Lib_Tech_Terrain_Wrecker unk_comparable_board_cross_brand_lib_tech_tw=Unknown
% @importance 0.75

0.75::acc(s48, comparable_board_cross_brand_lib_tech_tw).

0.56::true_val(comparable_board_cross_brand_lib_tech_tw, lib_tech_terrain_wrecker); 0.44::true_val(comparable_board_cross_brand_lib_tech_tw, unk_comparable_board_cross_brand_lib_tech_tw).

measured(s48, comparable_board_cross_brand_lib_tech_tw, lib_tech_terrain_wrecker).

all_consistent(comparable_board_cross_brand_lib_tech_tw) :-
    consistent(s48, comparable_board_cross_brand_lib_tech_tw).

evidence(all_consistent(comparable_board_cross_brand_lib_tech_tw)).
query(true_val(comparable_board_cross_brand_lib_tech_tw, lib_tech_terrain_wrecker)).
query(true_val(comparable_board_cross_brand_lib_tech_tw, unk_comparable_board_cross_brand_lib_tech_tw)).

% @attr comparable_board_same_brand_wild_life
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Wild Life)
% @values ride_wild_life=Ride_Wild_Life unk_comparable_board_same_brand_wild_life=Unknown
% @importance 0.75

0.85::acc(s53, comparable_board_same_brand_wild_life).

0.72::true_val(comparable_board_same_brand_wild_life, ride_wild_life); 0.28::true_val(comparable_board_same_brand_wild_life, unk_comparable_board_same_brand_wild_life).

measured(s53, comparable_board_same_brand_wild_life, ride_wild_life).

all_consistent(comparable_board_same_brand_wild_life) :-
    consistent(s53, comparable_board_same_brand_wild_life).

evidence(all_consistent(comparable_board_same_brand_wild_life)).
query(true_val(comparable_board_same_brand_wild_life, ride_wild_life)).
query(true_val(comparable_board_same_brand_wild_life, unk_comparable_board_same_brand_wild_life)).

% @attr insert_location_back_147
% @type numeric
% @unit cm
% @canonical false
% @original_name Insert location back 147cm
% @values vm1_9=neg1.9 unk_insert_location_back_147=Unknown
% @importance 0.85

0.88::acc(s_merchant, insert_location_back_147).

0.88::true_val(insert_location_back_147, vm1_9); 0.12::true_val(insert_location_back_147, unk_insert_location_back_147).

measured(s_merchant, insert_location_back_147, vm1_9).

all_consistent(insert_location_back_147) :-
    consistent(s_merchant, insert_location_back_147).

evidence(all_consistent(insert_location_back_147)).
query(true_val(insert_location_back_147, vm1_9)).
query(true_val(insert_location_back_147, unk_insert_location_back_147)).

% @attr insert_location_back_151
% @type numeric
% @unit cm
% @canonical false
% @original_name Insert location back 151cm
% @values vm1_9=neg1.9 unk_insert_location_back_151=Unknown
% @importance 0.85

0.88::acc(s_merchant, insert_location_back_151).

0.88::true_val(insert_location_back_151, vm1_9_151); 0.12::true_val(insert_location_back_151, unk_insert_location_back_151).

measured(s_merchant, insert_location_back_151, vm1_9_151).

all_consistent(insert_location_back_151) :-
    consistent(s_merchant, insert_location_back_151).

evidence(all_consistent(insert_location_back_151)).
query(true_val(insert_location_back_151, vm1_9_151)).
query(true_val(insert_location_back_151, unk_insert_location_back_151)).

% @attr tip_tail_width_size_151
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (151cm)
% @values v29_1=29.1 unk_tip_tail_width_size_151=Unknown
% @importance 0.85

0.88::acc(s_merchant, tip_tail_width_size_151).

0.88::true_val(tip_tail_width_size_151, v29_1); 0.12::true_val(tip_tail_width_size_151, unk_tip_tail_width_size_151).

measured(s_merchant, tip_tail_width_size_151, v29_1).

all_consistent(tip_tail_width_size_151) :-
    consistent(s_merchant, tip_tail_width_size_151).

evidence(all_consistent(tip_tail_width_size_151)).
query(true_val(tip_tail_width_size_151, v29_1)).
query(true_val(tip_tail_width_size_151, unk_tip_tail_width_size_151)).

% @attr tip_tail_width_size_154
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (154cm)
% @values v29_6=29.6 unk_tip_tail_width_size_154=Unknown
% @importance 0.85

0.88::acc(s_merchant, tip_tail_width_size_154).

0.88::true_val(tip_tail_width_size_154, v29_6); 0.12::true_val(tip_tail_width_size_154, unk_tip_tail_width_size_154).

measured(s_merchant, tip_tail_width_size_154, v29_6).

all_consistent(tip_tail_width_size_154) :-
    consistent(s_merchant, tip_tail_width_size_154).

evidence(all_consistent(tip_tail_width_size_154)).
query(true_val(tip_tail_width_size_154, v29_6)).
query(true_val(tip_tail_width_size_154, unk_tip_tail_width_size_154)).

% @attr tip_tail_width_size
% @type numeric
% @unit cm
% @canonical true
% @original_name tip_tail_width_size (157cm)
% @values v30_0=30.0 unk_tip_tail_width_size=Unknown
% @importance 0.85

0.88::acc(s_merchant, tip_tail_width_size).

0.88::true_val(tip_tail_width_size, v30_0); 0.12::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s_merchant, tip_tail_width_size, v30_0).

all_consistent(tip_tail_width_size) :-
    consistent(s_merchant, tip_tail_width_size).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v30_0)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr tip_tail_width_size_161
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (161cm)
% @values v30_4=30.4 unk_tip_tail_width_size_161=Unknown
% @importance 0.85

0.88::acc(s_merchant, tip_tail_width_size_161).

0.88::true_val(tip_tail_width_size_161, v30_4); 0.12::true_val(tip_tail_width_size_161, unk_tip_tail_width_size_161).

measured(s_merchant, tip_tail_width_size_161, v30_4).

all_consistent(tip_tail_width_size_161) :-
    consistent(s_merchant, tip_tail_width_size_161).

evidence(all_consistent(tip_tail_width_size_161)).
query(true_val(tip_tail_width_size_161, v30_4)).
query(true_val(tip_tail_width_size_161, unk_tip_tail_width_size_161)).

% @attr tip_tail_width_size_155w
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (155W)
% @values v30_4w=30.4 unk_tip_tail_width_size_155w=Unknown
% @importance 0.85

0.88::acc(s_merchant, tip_tail_width_size_155w).

0.88::true_val(tip_tail_width_size_155w, v30_4w); 0.12::true_val(tip_tail_width_size_155w, unk_tip_tail_width_size_155w).

measured(s_merchant, tip_tail_width_size_155w, v30_4w).

all_consistent(tip_tail_width_size_155w) :-
    consistent(s_merchant, tip_tail_width_size_155w).

evidence(all_consistent(tip_tail_width_size_155w)).
query(true_val(tip_tail_width_size_155w, v30_4w)).
query(true_val(tip_tail_width_size_155w, unk_tip_tail_width_size_155w)).

% @attr tip_tail_width_size_160w
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (160W)
% @values v31_1=31.1 unk_tip_tail_width_size_160w=Unknown
% @importance 0.85

0.88::acc(s_merchant, tip_tail_width_size_160w).

0.88::true_val(tip_tail_width_size_160w, v31_1); 0.12::true_val(tip_tail_width_size_160w, unk_tip_tail_width_size_160w).

measured(s_merchant, tip_tail_width_size_160w, v31_1).

all_consistent(tip_tail_width_size_160w) :-
    consistent(s_merchant, tip_tail_width_size_160w).

evidence(all_consistent(tip_tail_width_size_160w)).
query(true_val(tip_tail_width_size_160w, v31_1)).
query(true_val(tip_tail_width_size_160w, unk_tip_tail_width_size_160w)).