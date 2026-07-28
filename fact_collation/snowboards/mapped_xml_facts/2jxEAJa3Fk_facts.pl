0.15::indep(s2).
0.20::indep(s3).
0.65::indep(s12).
0.55::indep(s28).
0.20::indep(s22).
0.20::indep(s23).
0.15::indep(s26).
0.12::indep(s24).
0.12::indep(s29).
0.25::indep(s18).
0.30::indep(s20).
0.20::indep(s27).
0.15::indep(s35).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values jones_snowboards=Jones_Snowboards unk_brand=Unknown
% @importance 1.0

0.92::true_val(brand, jones_snowboards); 0.08::true_val(brand, unk_brand).
0.95::acc(s1, brand).
measured(s1, brand, jones_snowboards).
all_consistent(brand) :- consistent(s1, brand).
evidence(all_consistent(brand)).
query(true_val(brand, jones_snowboards)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values frontier_2_0=Frontier_2.0 unk_model_name=Unknown
% @importance 1.0

0.92::true_val(model_name, frontier_2_0); 0.08::true_val(model_name, unk_model_name).
0.95::acc(s1, model_name).
measured(s1, model_name, frontier_2_0).
all_consistent(model_name) :- consistent(s1, model_name).
evidence(all_consistent(model_name)).
query(true_val(model_name, frontier_2_0)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2027=2027 y2025_2026=2025/2026
% @importance 0.88

0.45::true_val(model_year, y2027); 0.55::true_val(model_year, y2025_2026).
0.88::acc(s2, model_year).
0.80::acc(s3, model_year).
measured(s2, model_year, y2027).
measured(s3, model_year, y2025_2026).
all_consistent(model_year) :-
    consistent(s3, model_year),
    (indep(s2), consistent(s2, model_year) ; \+indep(s2)).
evidence(all_consistent(model_year)).
query(true_val(model_year, y2027)).
query(true_val(model_year, y2025_2026)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.92::true_val(product_type, snowboard); 0.08::true_val(product_type, unk_product_type).
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
% @values all_mountain_freeride=All_Mountain-Freeride mellow_freeride=Mellow_freeride
% @importance 0.80

0.42::true_val(board_category, all_mountain_freeride); 0.58::true_val(board_category, mellow_freeride).
0.72::acc(s2, board_category).
0.85::acc(s4, board_category).
measured(s2, board_category, all_mountain_freeride).
measured(s4, board_category, mellow_freeride).
all_consistent(board_category) :-
    consistent(s4, board_category),
    (indep(s2), consistent(s2, board_category) ; \+indep(s2)).
evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain_freeride)).
query(true_val(board_category, mellow_freeride)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 1.0

0.92::true_val(gender, mens); 0.08::true_val(gender, unk_gender).
0.95::acc(s1, gender).
measured(s1, gender, mens).
all_consistent(gender) :- consistent(s1, gender).
evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values jones_nidecker_us=Jones_Snowboards_Nidecker_US_Inc_Truckee_CA unk_manufacturer=Unknown
% @importance 0.6

0.87::true_val(manufacturer, jones_nidecker_us); 0.13::true_val(manufacturer, unk_manufacturer).
0.90::acc(s5, manufacturer).
measured(s5, manufacturer, jones_nidecker_us).
all_consistent(manufacturer) :- consistent(s5, manufacturer).
evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, jones_nidecker_us)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr parent_company
% @type categorical
% @canonical true
% @original_name parent company
% @values nidecker_group=Nidecker_Group_Switzerland unk_parent_company=Unknown
% @importance 0.5

0.60::true_val(parent_company, nidecker_group); 0.40::true_val(parent_company, unk_parent_company).
0.72::acc(s6, parent_company).
measured(s6, parent_company, nidecker_group).
all_consistent(parent_company) :- consistent(s6, parent_company).
evidence(all_consistent(parent_company)).
query(true_val(parent_company, nidecker_group)).
query(true_val(parent_company, unk_parent_company)).

% @attr sister_brands
% @type categorical
% @canonical false
% @original_name sister brands in Nidecker Group
% @values nidecker_flow_yes_now=Nidecker_Flow_YES_Now unk_sister_brands=Unknown
% @importance 0.5

0.60::true_val(sister_brands, nidecker_flow_yes_now); 0.40::true_val(sister_brands, unk_sister_brands).
0.72::acc(s6, sister_brands).
measured(s6, sister_brands, nidecker_flow_yes_now).
all_consistent(sister_brands) :- consistent(s6, sister_brands).
evidence(all_consistent(sister_brands)).
query(true_val(sister_brands, nidecker_flow_yes_now)).
query(true_val(sister_brands, unk_sister_brands)).

% @attr founder
% @type categorical
% @canonical true
% @original_name founder
% @values jeremy_jones=Jeremy_Jones unk_founder=Unknown
% @importance 0.4

0.70::true_val(founder, jeremy_jones); 0.30::true_val(founder, unk_founder).
0.85::acc(s7, founder).
measured(s7, founder, jeremy_jones).
all_consistent(founder) :- consistent(s7, founder).
evidence(all_consistent(founder)).
query(true_val(founder, jeremy_jones)).
query(true_val(founder, unk_founder)).

% @attr company_founding_year
% @type categorical
% @canonical true
% @original_name company founding year
% @values y2008=2008 y2009=2009 y2010=2010
% @importance 0.47

0.15::true_val(company_founding_year, y2008); 0.50::true_val(company_founding_year, y2009); 0.35::true_val(company_founding_year, y2010).
0.78::acc(s7, company_founding_year).
0.90::acc(s5, company_founding_year).
0.72::acc(s6, company_founding_year).
measured(s7, company_founding_year, y2008).
measured(s5, company_founding_year, y2009).
measured(s6, company_founding_year, y2010).
all_consistent(company_founding_year) :-
    consistent(s7, company_founding_year),
    consistent(s5, company_founding_year),
    consistent(s6, company_founding_year).
evidence(all_consistent(company_founding_year)).
query(true_val(company_founding_year, y2008)).
query(true_val(company_founding_year, y2009)).
query(true_val(company_founding_year, y2010)).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values sws_dubai=SWS_Solico_Dubai_UAE unk_manufacturing_location_current=Unknown
% @importance 0.53

0.95::true_val(manufacturing_location_current, sws_dubai); 0.05::true_val(manufacturing_location_current, unk_manufacturing_location_current).
0.72::acc(s6, manufacturing_location_current).
0.80::acc(s9, manufacturing_location_current).
0.75::acc(s12, manufacturing_location_current).
measured(s6, manufacturing_location_current, sws_dubai).
measured(s9, manufacturing_location_current, sws_dubai).
measured(s12, manufacturing_location_current, sws_dubai).
all_consistent(manufacturing_location_current) :-
    consistent(s6, manufacturing_location_current),
    consistent(s9, manufacturing_location_current),
    (indep(s12), consistent(s12, manufacturing_location_current) ; \+indep(s12)).
evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, sws_dubai)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values fair_trade=Fair_Trade_Certified unk_sustainability_certification=Unknown
% @importance 0.45

0.69::true_val(sustainability_certification, fair_trade); 0.31::true_val(sustainability_certification, unk_sustainability_certification).
0.82::acc(s10, sustainability_certification).
measured(s10, sustainability_certification, fair_trade).
all_consistent(sustainability_certification) :- consistent(s10, sustainability_certification).
evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, fair_trade)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr sustainability_certification_solar
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values solar_since_2020=100pct_solar_power_since_2020 unk_sustainability_certification_solar=Unknown
% @importance 0.4

0.64::true_val(sustainability_certification_solar, solar_since_2020); 0.36::true_val(sustainability_certification_solar, unk_sustainability_certification_solar).
0.72::acc(s6, sustainability_certification_solar).
measured(s6, sustainability_certification_solar, solar_since_2020).
all_consistent(sustainability_certification_solar) :- consistent(s6, sustainability_certification_solar).
evidence(all_consistent(sustainability_certification_solar)).
query(true_val(sustainability_certification_solar, solar_since_2020)).
query(true_val(sustainability_certification_solar, unk_sustainability_certification_solar)).

% @attr sustainability_certification_1pct
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values one_pct_planet=1pct_For_The_Planet unk_sustainability_certification_1pct=Unknown
% @importance 0.35

0.72::true_val(sustainability_certification_1pct, one_pct_planet); 0.28::true_val(sustainability_certification_1pct, unk_sustainability_certification_1pct).
0.76::acc(s23, sustainability_certification_1pct).
measured(s23, sustainability_certification_1pct, one_pct_planet).
all_consistent(sustainability_certification_1pct) :-
    (indep(s23), consistent(s23, sustainability_certification_1pct) ; \+indep(s23)).
evidence(all_consistent(sustainability_certification_1pct)).
query(true_val(sustainability_certification_1pct, one_pct_planet)).
query(true_val(sustainability_certification_1pct, unk_sustainability_certification_1pct)).

% @attr sustainability_certification_pow
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values pow_2007=Protect_Our_Winters_founded_2007 unk_sustainability_certification_pow=Unknown
% @importance 0.3

0.87::true_val(sustainability_certification_pow, pow_2007); 0.13::true_val(sustainability_certification_pow, unk_sustainability_certification_pow).
0.90::acc(s5, sustainability_certification_pow).
measured(s5, sustainability_certification_pow, pow_2007).
all_consistent(sustainability_certification_pow) :- consistent(s5, sustainability_certification_pow).
evidence(all_consistent(sustainability_certification_pow)).
query(true_val(sustainability_certification_pow, pow_2007)).
query(true_val(sustainability_certification_pow, unk_sustainability_certification_pow)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values inaki_odriozola=Inaki_Odriozola unk_pro_rider_name=Unknown
% @importance 0.35

0.81::true_val(pro_rider_name, inaki_odriozola); 0.19::true_val(pro_rider_name, unk_pro_rider_name).
0.88::acc(s31, pro_rider_name).
measured(s31, pro_rider_name, inaki_odriozola).
all_consistent(pro_rider_name) :- consistent(s31, pro_rider_name).
evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, inaki_odriozola)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr graphic_designer_artist
% @type categorical
% @canonical true
% @original_name graphic_designer_artist
% @values rp_roberts=RP_Roberts unk_graphic_designer_artist=Unknown
% @importance 0.7

0.84::true_val(graphic_designer_artist, rp_roberts); 0.16::true_val(graphic_designer_artist, unk_graphic_designer_artist).
0.90::acc(s16, graphic_designer_artist).
measured(s16, graphic_designer_artist, rp_roberts).
all_consistent(graphic_designer_artist) :- consistent(s16, graphic_designer_artist).
evidence(all_consistent(graphic_designer_artist)).
query(true_val(graphic_designer_artist, rp_roberts)).
query(true_val(graphic_designer_artist, unk_graphic_designer_artist)).

% @attr design_philosophy
% @type categorical
% @canonical false
% @original_name design philosophy
% @values most_prototyped_since_flagship=Most_heavily_prototyped_since_Flagship unk_design_philosophy=Unknown
% @importance 0.7

0.84::true_val(design_philosophy, most_prototyped_since_flagship); 0.16::true_val(design_philosophy, unk_design_philosophy).
0.90::acc(s16, design_philosophy).
measured(s16, design_philosophy, most_prototyped_since_flagship).
all_consistent(design_philosophy) :- consistent(s16, design_philosophy).
evidence(all_consistent(design_philosophy)).
query(true_val(design_philosophy, most_prototyped_since_flagship)).
query(true_val(design_philosophy, unk_design_philosophy)).

% @attr model_lineage
% @type categorical
% @canonical false
% @original_name model lineage
% @values new_version_frontier=All_new_version_of_Frontier_with_new_shape unk_model_lineage=Unknown
% @importance 0.85

0.68::true_val(model_lineage, new_version_frontier); 0.32::true_val(model_lineage, unk_model_lineage).
0.72::acc(s2, model_lineage).
measured(s2, model_lineage, new_version_frontier).
all_consistent(model_lineage) :-
    (indep(s2), consistent(s2, model_lineage) ; \+indep(s2)).
evidence(all_consistent(model_lineage)).
query(true_val(model_lineage, new_version_frontier)).
query(true_val(model_lineage, unk_model_lineage)).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values jones_frontier_original=Jones_Frontier_original_last_2025MY unk_predecessor_model_name=Unknown
% @importance 0.65

0.66::true_val(predecessor_model_name, jones_frontier_original); 0.34::true_val(predecessor_model_name, unk_predecessor_model_name).
0.82::acc(s17, predecessor_model_name).
measured(s17, predecessor_model_name, jones_frontier_original).
all_consistent(predecessor_model_name) :- consistent(s17, predecessor_model_name).
evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, jones_frontier_original)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).

% @attr predecessor_board_category
% @type categorical
% @canonical false
% @original_name predecessor board category
% @values all_mountain=All_mountain unk_predecessor_board_category=Unknown
% @importance 0.65

0.66::true_val(predecessor_board_category, all_mountain); 0.34::true_val(predecessor_board_category, unk_predecessor_board_category).
0.82::acc(s17, predecessor_board_category).
measured(s17, predecessor_board_category, all_mountain).
all_consistent(predecessor_board_category) :- consistent(s17, predecessor_board_category).
evidence(all_consistent(predecessor_board_category)).
query(true_val(predecessor_board_category, all_mountain)).
query(true_val(predecessor_board_category, unk_predecessor_board_category)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2025_2026=2025_2026_season unk_model_first_available_year=Unknown
% @importance 0.8

0.72::true_val(model_first_available_year, season_2025_2026); 0.28::true_val(model_first_available_year, unk_model_first_available_year).
0.80::acc(s3, model_first_available_year).
measured(s3, model_first_available_year, season_2025_2026).
all_consistent(model_first_available_year) :-
    (indep(s3), consistent(s3, model_first_available_year) ; \+indep(s3)).
evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2025_2026)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr estimated_availability_date
% @type categorical
% @canonical true
% @original_name estimated_availability_date
% @values early_june_2026=Early_June_2026 june_8_2026=June_8_2026
% @importance 0.80

0.45::true_val(estimated_availability_date, early_june_2026); 0.55::true_val(estimated_availability_date, june_8_2026).
0.72::acc(s18, estimated_availability_date).
0.88::acc(s2, estimated_availability_date).
measured(s18, estimated_availability_date, early_june_2026).
measured(s2, estimated_availability_date, june_8_2026).
all_consistent(estimated_availability_date) :-
    (indep(s18), consistent(s18, estimated_availability_date) ; \+indep(s18)),
    (indep(s2), consistent(s2, estimated_availability_date) ; \+indep(s2)).
evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, early_june_2026)).
query(true_val(estimated_availability_date, june_8_2026)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values preorder=PREORDER unk_availability_status=Unknown
% @importance 0.85

0.90::true_val(availability_status, preorder); 0.10::true_val(availability_status, unk_availability_status).
0.92::acc(s2, availability_status).
measured(s2, availability_status, preorder).
all_consistent(availability_status) :-
    (indep(s2), consistent(s2, availability_status) ; \+indep(s2)).
evidence(all_consistent(availability_status)).
query(true_val(availability_status, preorder)).
query(true_val(availability_status, unk_availability_status)).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v529_95=529.95 unk_price_usd_msrp=Unknown
% @importance 1.0

0.92::true_val(price_usd_msrp, v529_95); 0.08::true_val(price_usd_msrp, unk_price_usd_msrp).
0.95::acc(s1, price_usd_msrp).
measured(s1, price_usd_msrp, v529_95).
all_consistent(price_usd_msrp) :- consistent(s1, price_usd_msrp).
evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v529_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v899_99=899.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.90::true_val(price_aud_merchant, v899_99); 0.10::true_val(price_aud_merchant, unk_price_aud_merchant).
0.92::acc(s2, price_aud_merchant).
measured(s2, price_aud_merchant, v899_99).
all_consistent(price_aud_merchant) :-
    (indep(s2), consistent(s2, price_aud_merchant) ; \+indep(s2)).
evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v899_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_evo
% @values v423_96=423.96 unk_price_usd_evo=Unknown
% @importance 0.9

0.56::true_val(price_usd_evo, v423_96); 0.44::true_val(price_usd_evo, unk_price_usd_evo).
0.75::acc(s21, price_usd_evo).
measured(s21, price_usd_evo, v423_96).
all_consistent(price_usd_evo) :- consistent(s21, price_usd_evo).
evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v423_96)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_tactics
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_tactics
% @values v423_95=423.95 unk_price_usd_tactics=Unknown
% @importance 0.9

0.56::true_val(price_usd_tactics, v423_95); 0.44::true_val(price_usd_tactics, unk_price_usd_tactics).
0.75::acc(s21, price_usd_tactics).
measured(s21, price_usd_tactics, v423_95).
all_consistent(price_usd_tactics) :- consistent(s21, price_usd_tactics).
evidence(all_consistent(price_usd_tactics)).
query(true_val(price_usd_tactics, v423_95)).
query(true_val(price_usd_tactics, unk_price_usd_tactics)).

% @attr price_usd_rei
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_rei
% @values v370_83=370.83 unk_price_usd_rei=Unknown
% @importance 0.9

0.75::true_val(price_usd_rei, v370_83); 0.25::true_val(price_usd_rei, unk_price_usd_rei).
0.82::acc(s20, price_usd_rei).
measured(s20, price_usd_rei, v370_83).
all_consistent(price_usd_rei) :-
    (indep(s20), consistent(s20, price_usd_rei) ; \+indep(s20)).
evidence(all_consistent(price_usd_rei)).
query(true_val(price_usd_rei, v370_83)).
query(true_val(price_usd_rei, unk_price_usd_rei)).

% @attr price_usd_sun_ski
% @type numeric
% @unit USD
% @canonical false
% @original_name price (discounted, Sun & Ski Sports)
% @values v423_93=423.93 unk_price_usd_sun_ski=Unknown
% @importance 0.9

0.56::true_val(price_usd_sun_ski, v423_93); 0.44::true_val(price_usd_sun_ski, unk_price_usd_sun_ski).
0.75::acc(s21, price_usd_sun_ski).
measured(s21, price_usd_sun_ski, v423_93).
all_consistent(price_usd_sun_ski) :- consistent(s21, price_usd_sun_ski).
evidence(all_consistent(price_usd_sun_ski)).
query(true_val(price_usd_sun_ski, v423_93)).
query(true_val(price_usd_sun_ski, unk_price_usd_sun_ski)).

% @attr price_usd_the_house
% @type numeric
% @unit USD
% @canonical false
% @original_name price (discounted, The House)
% @values v423_95=423.95 unk_price_usd_the_house=Unknown
% @importance 0.9

0.56::true_val(price_usd_the_house, v423_95); 0.44::true_val(price_usd_the_house, unk_price_usd_the_house).
0.75::acc(s21, price_usd_the_house).
measured(s21, price_usd_the_house, v423_95).
all_consistent(price_usd_the_house) :- consistent(s21, price_usd_the_house).
evidence(all_consistent(price_usd_the_house)).
query(true_val(price_usd_the_house, v423_95)).
query(true_val(price_usd_the_house, unk_price_usd_the_house)).

% @attr price_usd_christy_sports
% @type numeric
% @unit USD
% @canonical false
% @original_name price (discounted, Christy Sports)
% @values v370_97=370.97 unk_price_usd_christy_sports=Unknown
% @importance 0.9

0.56::true_val(price_usd_christy_sports, v370_97); 0.44::true_val(price_usd_christy_sports, unk_price_usd_christy_sports).
0.75::acc(s21, price_usd_christy_sports).
measured(s21, price_usd_christy_sports, v370_97).
all_consistent(price_usd_christy_sports) :- consistent(s21, price_usd_christy_sports).
evidence(all_consistent(price_usd_christy_sports)).
query(true_val(price_usd_christy_sports, v370_97)).
query(true_val(price_usd_christy_sports, unk_price_usd_christy_sports)).

% @attr price_eur_blue_tomato
% @type categorical
% @unit EUR
% @canonical true
% @original_name price_eur_blue_tomato
% @values eur_499_95_to_649=499.95-649.00_EUR unk_price_eur_blue_tomato=Unknown
% @importance 0.9

0.56::true_val(price_eur_blue_tomato, eur_499_95_to_649); 0.44::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).
0.75::acc(s21, price_eur_blue_tomato).
measured(s21, price_eur_blue_tomato, eur_499_95_to_649).
all_consistent(price_eur_blue_tomato) :- consistent(s21, price_eur_blue_tomato).
evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, eur_499_95_to_649)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

% @attr price_gbp_blue_tomato_uk
% @type categorical
% @unit GBP
% @canonical true
% @original_name price_gbp_blue_tomato_uk
% @values gbp_445_to_585=445-585_GBP unk_price_gbp_blue_tomato_uk=Unknown
% @importance 0.9

0.56::true_val(price_gbp_blue_tomato_uk, gbp_445_to_585); 0.44::true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk).
0.75::acc(s21, price_gbp_blue_tomato_uk).
measured(s21, price_gbp_blue_tomato_uk, gbp_445_to_585).
all_consistent(price_gbp_blue_tomato_uk) :- consistent(s21, price_gbp_blue_tomato_uk).
evidence(all_consistent(price_gbp_blue_tomato_uk)).
query(true_val(price_gbp_blue_tomato_uk, gbp_445_to_585)).
query(true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk)).

% @attr price_usd_tgr_list
% @type numeric
% @unit USD
% @canonical false
% @original_name The Good Ride list price notation
% @values v529=529.0 unk_price_usd_tgr_list=Unknown
% @importance 0.9

0.66::true_val(price_usd_tgr_list, v529); 0.34::true_val(price_usd_tgr_list, unk_price_usd_tgr_list).
0.85::acc(s21, price_usd_tgr_list).
measured(s21, price_usd_tgr_list, v529).
all_consistent(price_usd_tgr_list) :- consistent(s21, price_usd_tgr_list).
evidence(all_consistent(price_usd_tgr_list)).
query(true_val(price_usd_tgr_list, v529)).
query(true_val(price_usd_tgr_list, unk_price_usd_tgr_list)).

% @attr retailer_jones_direct
% @type categorical
% @canonical false
% @original_name retailer (US, manufacturer direct)
% @values available_free_ship=jonessnowboards.com_in_stock_free_shipping unk_retailer_jones_direct=Unknown
% @importance 1.0

0.92::true_val(retailer_jones_direct, available_free_ship); 0.08::true_val(retailer_jones_direct, unk_retailer_jones_direct).
0.95::acc(s1, retailer_jones_direct).
measured(s1, retailer_jones_direct, available_free_ship).
all_consistent(retailer_jones_direct) :- consistent(s1, retailer_jones_direct).
evidence(all_consistent(retailer_jones_direct)).
query(true_val(retailer_jones_direct, available_free_ship)).
query(true_val(retailer_jones_direct, unk_retailer_jones_direct)).

% @attr retailer_evo
% @type categorical
% @canonical false
% @original_name retailer (US, major)
% @values evo_in_stock=evo.com_in_stock_free_shipping unk_retailer_evo=Unknown
% @importance 0.8

0.72::true_val(retailer_evo, evo_in_stock); 0.28::true_val(retailer_evo, unk_retailer_evo).
0.80::acc(s3, retailer_evo).
measured(s3, retailer_evo, evo_in_stock).
all_consistent(retailer_evo) :-
    (indep(s3), consistent(s3, retailer_evo) ; \+indep(s3)).
evidence(all_consistent(retailer_evo)).
query(true_val(retailer_evo, evo_in_stock)).
query(true_val(retailer_evo, unk_retailer_evo)).

% @attr retailer_tactics
% @type categorical
% @canonical false
% @original_name retailer (US, major) Tactics
% @values tactics_in_stock=Tactics.com_in_stock unk_retailer_tactics=Unknown
% @importance 0.55

0.70::true_val(retailer_tactics, tactics_in_stock); 0.30::true_val(retailer_tactics, unk_retailer_tactics).
0.78::acc(s23, retailer_tactics).
measured(s23, retailer_tactics, tactics_in_stock).
all_consistent(retailer_tactics) :-
    (indep(s23), consistent(s23, retailer_tactics) ; \+indep(s23)).
evidence(all_consistent(retailer_tactics)).
query(true_val(retailer_tactics, tactics_in_stock)).
query(true_val(retailer_tactics, unk_retailer_tactics)).

% @attr retailer_rei
% @type categorical
% @canonical false
% @original_name retailer (US, major) REI
% @values rei_discontinued=REI_was_available_discontinued unk_retailer_rei=Unknown
% @importance 0.9

0.75::true_val(retailer_rei, rei_discontinued); 0.25::true_val(retailer_rei, unk_retailer_rei).
0.82::acc(s20, retailer_rei).
measured(s20, retailer_rei, rei_discontinued).
all_consistent(retailer_rei) :-
    (indep(s20), consistent(s20, retailer_rei) ; \+indep(s20)).
evidence(all_consistent(retailer_rei)).
query(true_val(retailer_rei, rei_discontinued)).
query(true_val(retailer_rei, unk_retailer_rei)).

% @attr retailer_motion
% @type categorical
% @canonical false
% @original_name retailer (US) Motion Boardshop
% @values motion_529_95=Motion_Boardshop_529.95_USD unk_retailer_motion=Unknown
% @importance 0.7

0.51::true_val(retailer_motion, motion_529_95); 0.49::true_val(retailer_motion, unk_retailer_motion).
0.65::acc(s24, retailer_motion).
measured(s24, retailer_motion, motion_529_95).
all_consistent(retailer_motion) :-
    (indep(s24), consistent(s24, retailer_motion) ; \+indep(s24)).
evidence(all_consistent(retailer_motion)).
query(true_val(retailer_motion, motion_529_95)).
query(true_val(retailer_motion, unk_retailer_motion)).

% @attr retailer_ski_monster
% @type categorical
% @canonical false
% @original_name retailer (US) The Ski Monster
% @values ski_monster_available=The_Ski_Monster unk_retailer_ski_monster=Unknown
% @importance 0.4

0.46::true_val(retailer_ski_monster, ski_monster_available); 0.54::true_val(retailer_ski_monster, unk_retailer_ski_monster).
0.65::acc(s12, retailer_ski_monster).
measured(s12, retailer_ski_monster, ski_monster_available).
all_consistent(retailer_ski_monster) :-
    (indep(s12), consistent(s12, retailer_ski_monster) ; \+indep(s12)).
evidence(all_consistent(retailer_ski_monster)).
query(true_val(retailer_ski_monster, ski_monster_available)).
query(true_val(retailer_ski_monster, unk_retailer_ski_monster)).

% @attr retailer_pro_ski
% @type categorical
% @canonical false
% @original_name retailer (US) The Pro Ski and Ride
% @values pro_ski_available=The_Pro_Ski_and_Ride_free_ship unk_retailer_pro_ski=Unknown
% @importance 0.5

0.59::true_val(retailer_pro_ski, pro_ski_available); 0.41::true_val(retailer_pro_ski, unk_retailer_pro_ski).
0.65::acc(s26, retailer_pro_ski).
measured(s26, retailer_pro_ski, pro_ski_available).
all_consistent(retailer_pro_ski) :-
    (indep(s26), consistent(s26, retailer_pro_ski) ; \+indep(s26)).
evidence(all_consistent(retailer_pro_ski)).
query(true_val(retailer_pro_ski, pro_ski_available)).
query(true_val(retailer_pro_ski, unk_retailer_pro_ski)).

% @attr retailer_melbourne
% @type categorical
% @canonical false
% @original_name retailer (AU) Melbourne Snowboard Centre
% @values melbourne_available=Melbourne_Snowboard_Centre unk_retailer_melbourne=Unknown
% @importance 0.85

0.68::true_val(retailer_melbourne, melbourne_available); 0.32::true_val(retailer_melbourne, unk_retailer_melbourne).
0.72::acc(s2, retailer_melbourne).
measured(s2, retailer_melbourne, melbourne_available).
all_consistent(retailer_melbourne) :-
    (indep(s2), consistent(s2, retailer_melbourne) ; \+indep(s2)).
evidence(all_consistent(retailer_melbourne)).
query(true_val(retailer_melbourne, melbourne_available)).
query(true_val(retailer_melbourne, unk_retailer_melbourne)).

% @attr retailer_balmoral
% @type categorical
% @canonical false
% @original_name retailer (AU) Balmoral Boards
% @values balmoral_preorder=Balmoral_Boards_preorder_2027 unk_retailer_balmoral=Unknown
% @importance 0.75

0.65::true_val(retailer_balmoral, balmoral_preorder); 0.35::true_val(retailer_balmoral, unk_retailer_balmoral).
0.72::acc(s18, retailer_balmoral).
measured(s18, retailer_balmoral, balmoral_preorder).
all_consistent(retailer_balmoral) :-
    (indep(s18), consistent(s18, retailer_balmoral) ; \+indep(s18)).
evidence(all_consistent(retailer_balmoral)).
query(true_val(retailer_balmoral, balmoral_preorder)).
query(true_val(retailer_balmoral, unk_retailer_balmoral)).

% @attr retailer_flight
% @type categorical
% @canonical false
% @original_name retailer (AU) Flight Snowboards
% @values flight_perth=Flight_Snowboards_exclusive_Jones_Perth unk_retailer_flight=Unknown
% @importance 0.5

0.45::true_val(retailer_flight, flight_perth); 0.55::true_val(retailer_flight, unk_retailer_flight).
0.55::acc(s27, retailer_flight).
measured(s27, retailer_flight, flight_perth).
all_consistent(retailer_flight) :-
    (indep(s27), consistent(s27, retailer_flight) ; \+indep(s27)).
evidence(all_consistent(retailer_flight)).
query(true_val(retailer_flight, flight_perth)).
query(true_val(retailer_flight, unk_retailer_flight)).

% @attr retailer_lines
% @type categorical
% @canonical false
% @original_name retailer (EU) Lines Snow Boutique
% @values lines_available=Lines_Snow_Boutique unk_retailer_lines=Unknown
% @importance 0.7

0.43::true_val(retailer_lines, lines_available); 0.57::true_val(retailer_lines, unk_retailer_lines).
0.55::acc(s28, retailer_lines).
measured(s28, retailer_lines, lines_available).
all_consistent(retailer_lines) :-
    (indep(s28), consistent(s28, retailer_lines) ; \+indep(s28)).
evidence(all_consistent(retailer_lines)).
query(true_val(retailer_lines, lines_available)).
query(true_val(retailer_lines, unk_retailer_lines)).

% @attr retailer_rudeboys
% @type categorical
% @canonical false
% @original_name retailer (EU) Rudeboys
% @values rudeboys_available=Rudeboys unk_retailer_rudeboys=Unknown
% @importance 0.4

0.41::true_val(retailer_rudeboys, rudeboys_available); 0.59::true_val(retailer_rudeboys, unk_retailer_rudeboys).
0.55::acc(s29, retailer_rudeboys).
measured(s29, retailer_rudeboys, rudeboys_available).
all_consistent(retailer_rudeboys) :-
    (indep(s29), consistent(s29, retailer_rudeboys) ; \+indep(s29)).
evidence(all_consistent(retailer_rudeboys)).
query(true_val(retailer_rudeboys, rudeboys_available)).
query(true_val(retailer_rudeboys, unk_retailer_rudeboys)).

% @attr return_policy_terms
% @type categorical
% @canonical true
% @original_name return_policy_terms
% @values thirty_day_return=30day_return_new_unused_buyer_pays_shipping unk_return_policy_terms=Unknown
% @importance 1.0

0.92::true_val(return_policy_terms, thirty_day_return); 0.08::true_val(return_policy_terms, unk_return_policy_terms).
0.95::acc(s1, return_policy_terms).
measured(s1, return_policy_terms, thirty_day_return).
all_consistent(return_policy_terms) :- consistent(s1, return_policy_terms).
evidence(all_consistent(return_policy_terms)).
query(true_val(return_policy_terms, thirty_day_return)).
query(true_val(return_policy_terms, unk_return_policy_terms)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values two_yr_plus_one=2yr_warranty_plus_1yr_extension unk_warranty=Unknown
% @importance 0.75

0.65::true_val(warranty, two_yr_plus_one); 0.35::true_val(warranty, unk_warranty).
0.72::acc(s18, warranty).
measured(s18, warranty, two_yr_plus_one).
all_consistent(warranty) :-
    (indep(s18), consistent(s18, warranty) ; \+indep(s18)).
evidence(all_consistent(warranty)).
query(true_val(warranty, two_yr_plus_one)).
query(true_val(warranty, unk_warranty)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 1.0

0.92::true_val(shape, tapered_directional); 0.08::true_val(shape, unk_shape).
0.95::acc(s1, shape).
measured(s1, shape, tapered_directional).
all_consistent(shape) :- consistent(s1, shape).
evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

% @attr shape_description
% @type categorical
% @canonical false
% @original_name shape description
% @values dir_5mm_taper=Directional_outline_5mm_taper_increases_float_maneuverability unk_shape_description=Unknown
% @importance 0.7

0.84::true_val(shape_description, dir_5mm_taper); 0.16::true_val(shape_description, unk_shape_description).
0.90::acc(s16, shape_description).
measured(s16, shape_description, dir_5mm_taper).
all_consistent(shape_description) :- consistent(s16, shape_description).
evidence(all_consistent(shape_description)).
query(true_val(shape_description, dir_5mm_taper)).
query(true_val(shape_description, unk_shape_description)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values dir_camber_rocker=Directional_Camber_Rocker unk_camber_type=Unknown
% @importance 1.0

0.92::true_val(camber_type, dir_camber_rocker); 0.08::true_val(camber_type, unk_camber_type).
0.95::acc(s1, camber_type).
measured(s1, camber_type, dir_camber_rocker).
all_consistent(camber_type) :- consistent(s1, camber_type).
evidence(all_consistent(camber_type)).
query(true_val(camber_type, dir_camber_rocker)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values camber_body_rocker_nose=Camber_throughout_body_rocker_in_nose unk_camber_description=Unknown
% @importance 0.85

0.68::true_val(camber_description, camber_body_rocker_nose); 0.32::true_val(camber_description, unk_camber_description).
0.72::acc(s2, camber_description).
measured(s2, camber_description, camber_body_rocker_nose).
all_consistent(camber_description) :-
    (indep(s2), consistent(s2, camber_description) ; \+indep(s2)).
evidence(all_consistent(camber_description)).
query(true_val(camber_description, camber_body_rocker_nose)).
query(true_val(camber_description, unk_camber_description)).

% @attr base_3d_technology
% @type categorical
% @canonical false
% @original_name 3D base technology
% @values medium_3d_contour=Medium_3D_Contour_Base unk_base_3d_technology=Unknown
% @importance 1.0

0.92::true_val(base_3d_technology, medium_3d_contour); 0.08::true_val(base_3d_technology, unk_base_3d_technology).
0.95::acc(s1, base_3d_technology).
measured(s1, base_3d_technology, medium_3d_contour).
all_consistent(base_3d_technology) :- consistent(s1, base_3d_technology).
evidence(all_consistent(base_3d_technology)).
query(true_val(base_3d_technology, medium_3d_contour)).
query(true_val(base_3d_technology, unk_base_3d_technology)).

% @attr base_3d_contour_description
% @type categorical
% @canonical false
% @original_name 3D contour base description
% @values spoon_4mm_nose_tail=4mm_spoon_bevel_nose_and_up_to_4mm_tail unk_base_3d_contour_description=Unknown
% @importance 0.85

0.68::true_val(base_3d_contour_description, spoon_4mm_nose_tail); 0.32::true_val(base_3d_contour_description, unk_base_3d_contour_description).
0.72::acc(s2, base_3d_contour_description).
measured(s2, base_3d_contour_description, spoon_4mm_nose_tail).
all_consistent(base_3d_contour_description) :-
    (indep(s2), consistent(s2, base_3d_contour_description) ; \+indep(s2)).
evidence(all_consistent(base_3d_contour_description)).
query(true_val(base_3d_contour_description, spoon_4mm_nose_tail)).
query(true_val(base_3d_contour_description, unk_base_3d_contour_description)).

% @attr base_3d_flip_tip
% @type categorical
% @canonical false
% @original_name 3D base feature
% @values flip_tip=3D_Flip_Tip_minimizes_hooking unk_base_3d_flip_tip=Unknown
% @importance 0.7

0.84::true_val(base_3d_flip_tip, flip_tip); 0.16::true_val(base_3d_flip_tip, unk_base_3d_flip_tip).
0.90::acc(s16, base_3d_flip_tip).
measured(s16, base_3d_flip_tip, flip_tip).
all_consistent(base_3d_flip_tip) :- consistent(s16, base_3d_flip_tip).
evidence(all_consistent(base_3d_flip_tip)).
query(true_val(base_3d_flip_tip, flip_tip)).
query(true_val(base_3d_flip_tip, unk_base_3d_flip_tip)).

% @attr taper
% @type numeric
% @unit mm
% @canonical true
% @original_name taper
% @values v5=5.0 unk_taper=Unknown
% @importance 1.0

0.92::true_val(taper, v5); 0.08::true_val(taper, unk_taper).
0.95::acc(s1, taper).
measured(s1, taper, v5).
all_consistent(taper) :- consistent(s1, taper).
evidence(all_consistent(taper)).
query(true_val(taper, v5)).
query(true_val(taper, unk_taper)).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values directional_flex=Directional_flex unk_flex_direction=Unknown
% @importance 1.0

0.92::true_val(flex_direction, directional_flex); 0.08::true_val(flex_direction, unk_flex_direction).
0.95::acc(s1, flex_direction).
measured(s1, flex_direction, directional_flex).
all_consistent(flex_direction) :- consistent(s1, flex_direction).
evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional_flex)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr flex_rating_5
% @type numeric
% @unit /5
% @canonical true
% @original_name flex_rating_5
% @values v2=2.0 v2_5=2.5 v3=3.0
% @importance 0.86

0.55::true_val(flex_rating_5, v2); 0.25::true_val(flex_rating_5, v2_5); 0.20::true_val(flex_rating_5, v3).
0.94::acc(s1, flex_rating_5).
0.72::acc(s2, flex_rating_5).
0.75::acc(s12, flex_rating_5).
0.60::acc(s28, flex_rating_5).
measured(s1, flex_rating_5, v2).
measured(s2, flex_rating_5, v2).
measured(s12, flex_rating_5, v2_5).
measured(s28, flex_rating_5, v3).
all_consistent(flex_rating_5) :-
    consistent(s1, flex_rating_5),
    (indep(s2), consistent(s2, flex_rating_5) ; \+indep(s2)),
    (indep(s12), consistent(s12, flex_rating_5) ; \+indep(s12)),
    (indep(s28), consistent(s28, flex_rating_5) ; \+indep(s28)).
evidence(all_consistent(flex_rating_5)).
query(true_val(flex_rating_5, v2)).
query(true_val(flex_rating_5, v2_5)).
query(true_val(flex_rating_5, v3)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values friendly=Friendly_flex_fun_loving mellow=Mellow_flex_playful very_soft=Very_soft_almost_jib_park
% @importance 0.88

0.45::true_val(flex_feel, friendly); 0.30::true_val(flex_feel, mellow); 0.25::true_val(flex_feel, very_soft).
0.90::acc(s1, flex_feel).
0.75::acc(s12, flex_feel).
0.85::acc(s21, flex_feel).
measured(s1, flex_feel, friendly).
measured(s12, flex_feel, mellow).
measured(s21, flex_feel, very_soft).
all_consistent(flex_feel) :-
    consistent(s1, flex_feel),
    (indep(s12), consistent(s12, flex_feel) ; \+indep(s12)),
    consistent(s21, flex_feel).
evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, friendly)).
query(true_val(flex_feel, mellow)).
query(true_val(flex_feel, very_soft)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values master_core_poplar_paulownia=Master_Core_Poplar_Paulownia unk_core_material=Unknown
% @importance 1.0

0.92::true_val(core_material, master_core_poplar_paulownia); 0.08::true_val(core_material, unk_core_material).
0.95::acc(s1, core_material).
measured(s1, core_material, master_core_poplar_paulownia).
all_consistent(core_material) :- consistent(s1, core_material).
evidence(all_consistent(core_material)).
query(true_val(core_material, master_core_poplar_paulownia)).
query(true_val(core_material, unk_core_material)).

% @attr core_material_blend_ratio
% @type categorical
% @canonical false
% @original_name core_material_blend_ratio
% @values one_to_one_alternating=1to1_Poplar_Paulownia_alternating_stringers unk_core_material_blend_ratio=Unknown
% @importance 1.0

0.92::true_val(core_material_blend_ratio, one_to_one_alternating); 0.08::true_val(core_material_blend_ratio, unk_core_material_blend_ratio).
0.94::acc(s1, core_material_blend_ratio).
measured(s1, core_material_blend_ratio, one_to_one_alternating).
all_consistent(core_material_blend_ratio) :- consistent(s1, core_material_blend_ratio).
evidence(all_consistent(core_material_blend_ratio)).
query(true_val(core_material_blend_ratio, one_to_one_alternating)).
query(true_val(core_material_blend_ratio, unk_core_material_blend_ratio)).

% @attr sustainability_certification_fsc
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values fsc_certified=FSC_certified_wood_responsibly_managed unk_sustainability_certification_fsc=Unknown
% @importance 0.55

0.70::true_val(sustainability_certification_fsc, fsc_certified); 0.30::true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc).
0.76::acc(s23, sustainability_certification_fsc).
measured(s23, sustainability_certification_fsc, fsc_certified).
all_consistent(sustainability_certification_fsc) :-
    (indep(s23), consistent(s23, sustainability_certification_fsc) ; \+indep(s23)).
evidence(all_consistent(sustainability_certification_fsc)).
query(true_val(sustainability_certification_fsc, fsc_certified)).
query(true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values biax_fiberglass_bio_resin=Biax_Fiberglass_with_Bio_Resin unk_laminate=Unknown
% @importance 1.0

0.92::true_val(laminate, biax_fiberglass_bio_resin); 0.08::true_val(laminate, unk_laminate).
0.95::acc(s1, laminate).
measured(s1, laminate, biax_fiberglass_bio_resin).
all_consistent(laminate) :- consistent(s1, laminate).
evidence(all_consistent(laminate)).
query(true_val(laminate, biax_fiberglass_bio_resin)).
query(true_val(laminate, unk_laminate)).

% @attr laminate_detail
% @type categorical
% @canonical false
% @original_name laminate
% @values dual_layer_multi_dir=Dual_layer_multi_directional_fiberglass unk_laminate_detail=Unknown
% @importance 1.0

0.92::true_val(laminate_detail, dual_layer_multi_dir); 0.08::true_val(laminate_detail, unk_laminate_detail).
0.94::acc(s1, laminate_detail).
measured(s1, laminate_detail, dual_layer_multi_dir).
all_consistent(laminate_detail) :- consistent(s1, laminate_detail).
evidence(all_consistent(laminate_detail)).
query(true_val(laminate_detail, dual_layer_multi_dir)).
query(true_val(laminate_detail, unk_laminate_detail)).

% @attr resin
% @type categorical
% @canonical false
% @original_name resin
% @values bio_resin_27pct=Bio_Resin_27pct_plant_based_carbon unk_resin=Unknown
% @importance 0.50

0.59::true_val(resin, bio_resin_27pct); 0.41::true_val(resin, unk_resin).
0.65::acc(s26, resin).
measured(s26, resin, bio_resin_27pct).
all_consistent(resin) :-
    (indep(s26), consistent(s26, resin) ; \+indep(s26)).
evidence(all_consistent(resin)).
query(true_val(resin, bio_resin_27pct)).
query(true_val(resin, unk_resin)).

% @attr sustainability_certification_co2
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values co2_33pct_less=Reduces_CO2_33pct_vs_conventional_epoxy unk_sustainability_certification_co2=Unknown
% @importance 0.75

0.74::true_val(sustainability_certification_co2, co2_33pct_less); 0.26::true_val(sustainability_certification_co2, unk_sustainability_certification_co2).
0.78::acc(s3, sustainability_certification_co2).
measured(s3, sustainability_certification_co2, co2_33pct_less).
all_consistent(sustainability_certification_co2) :-
    (indep(s3), consistent(s3, sustainability_certification_co2) ; \+indep(s3)).
evidence(all_consistent(sustainability_certification_co2)).
query(true_val(sustainability_certification_co2, co2_33pct_less)).
query(true_val(sustainability_certification_co2, unk_sustainability_certification_co2)).

% @attr sustainability_certification_bio_source
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values co_products_plant=Co_products_waste_plant_based_SuperSap unk_sustainability_certification_bio_source=Unknown
% @importance 0.75

0.74::true_val(sustainability_certification_bio_source, co_products_plant); 0.26::true_val(sustainability_certification_bio_source, unk_sustainability_certification_bio_source).
0.78::acc(s3, sustainability_certification_bio_source).
measured(s3, sustainability_certification_bio_source, co_products_plant).
all_consistent(sustainability_certification_bio_source) :-
    (indep(s3), consistent(s3, sustainability_certification_bio_source) ; \+indep(s3)).
evidence(all_consistent(sustainability_certification_bio_source)).
query(true_val(sustainability_certification_bio_source, co_products_plant)).
query(true_val(sustainability_certification_bio_source, unk_sustainability_certification_bio_source)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values recycled_abs=Recycled_ABS unk_sidewall_material=Unknown
% @importance 1.0

0.92::true_val(sidewall_material, recycled_abs); 0.08::true_val(sidewall_material, unk_sidewall_material).
0.95::acc(s1, sidewall_material).
measured(s1, sidewall_material, recycled_abs).
all_consistent(sidewall_material) :- consistent(s1, sidewall_material).
evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, recycled_abs)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr sidewall_construction
% @type categorical
% @canonical false
% @original_name sidewall_material
% @values round_finish=Round_finish_deflects_impact_prevents_chipping unk_sidewall_construction=Unknown
% @importance 0.85

0.68::true_val(sidewall_construction, round_finish); 0.32::true_val(sidewall_construction, unk_sidewall_construction).
0.72::acc(s2, sidewall_construction).
measured(s2, sidewall_construction, round_finish).
all_consistent(sidewall_construction) :-
    (indep(s2), consistent(s2, sidewall_construction) ; \+indep(s2)).
evidence(all_consistent(sidewall_construction)).
query(true_val(sidewall_construction, round_finish)).
query(true_val(sidewall_construction, unk_sidewall_construction)).

% @attr edge_material
% @type categorical
% @canonical false
% @original_name edge material
% @values recycled_german_steel=Recycled_German_steel unk_edge_material=Unknown
% @importance 1.0

0.92::true_val(edge_material, recycled_german_steel); 0.08::true_val(edge_material, unk_edge_material).
0.95::acc(s1, edge_material).
measured(s1, edge_material, recycled_german_steel).
all_consistent(edge_material) :- consistent(s1, edge_material).
evidence(all_consistent(edge_material)).
query(true_val(edge_material, recycled_german_steel)).
query(true_val(edge_material, unk_edge_material)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values oversize_recycled=Oversize_recycled_steel_edges unk_edge_technology=Unknown
% @importance 0.55

0.70::true_val(edge_technology, oversize_recycled); 0.30::true_val(edge_technology, unk_edge_technology).
0.76::acc(s23, edge_technology).
measured(s23, edge_technology, oversize_recycled).
all_consistent(edge_technology) :-
    (indep(s23), consistent(s23, edge_technology) ; \+indep(s23)).
evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, oversize_recycled)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr edge_hold_technology
% @type categorical
% @canonical false
% @original_name edge_hold
% @values medium_traction_tech=Medium_Traction_Tech_strategic_contact_points unk_edge_hold_technology=Unknown
% @importance 0.75

0.74::true_val(edge_hold_technology, medium_traction_tech); 0.26::true_val(edge_hold_technology, unk_edge_hold_technology).
0.78::acc(s3, edge_hold_technology).
measured(s3, edge_hold_technology, medium_traction_tech).
all_consistent(edge_hold_technology) :-
    (indep(s3), consistent(s3, edge_hold_technology) ; \+indep(s3)).
evidence(all_consistent(edge_hold_technology)).
query(true_val(edge_hold_technology, medium_traction_tech)).
query(true_val(edge_hold_technology, unk_edge_hold_technology)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_8000=Sintered_8000_Base unk_base_material=Unknown
% @importance 1.0

0.92::true_val(base_material, sintered_8000); 0.08::true_val(base_material, unk_base_material).
0.95::acc(s1, base_material).
measured(s1, base_material, sintered_8000).
all_consistent(base_material) :- consistent(s1, base_material).
evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_8000)).
query(true_val(base_material, unk_base_material)).

% @attr base_material_detail
% @type categorical
% @canonical false
% @original_name base_material
% @values uhmwpe_carbon=UHMW_polyethylene_carbon_fast_wax_absorbent unk_base_material_detail=Unknown
% @importance 0.75

0.74::true_val(base_material_detail, uhmwpe_carbon); 0.26::true_val(base_material_detail, unk_base_material_detail).
0.78::acc(s3, base_material_detail).
measured(s3, base_material_detail, uhmwpe_carbon).
all_consistent(base_material_detail) :-
    (indep(s3), consistent(s3, base_material_detail) ; \+indep(s3)).
evidence(all_consistent(base_material_detail)).
query(true_val(base_material_detail, uhmwpe_carbon)).
query(true_val(base_material_detail, unk_base_material_detail)).

% @attr topsheet
% @type categorical
% @canonical false
% @original_name topsheet
% @values premium_topsheet=Premium_Topsheet unk_topsheet=Unknown
% @importance 1.0

0.92::true_val(topsheet, premium_topsheet); 0.08::true_val(topsheet, unk_topsheet).
0.95::acc(s1, topsheet).
measured(s1, topsheet, premium_topsheet).
all_consistent(topsheet) :- consistent(s1, topsheet).
evidence(all_consistent(topsheet)).
query(true_val(topsheet, premium_topsheet)).
query(true_val(topsheet, unk_topsheet)).

% @attr topsheet_appearance_description
% @type categorical
% @canonical true
% @original_name topsheet_appearance_description
% @values durable_scratch_resistant=Durable_scratch_resistant_extreme_conditions unk_topsheet_appearance_description=Unknown
% @importance 0.5

0.59::true_val(topsheet_appearance_description, durable_scratch_resistant); 0.41::true_val(topsheet_appearance_description, unk_topsheet_appearance_description).
0.65::acc(s26, topsheet_appearance_description).
measured(s26, topsheet_appearance_description, durable_scratch_resistant).
all_consistent(topsheet_appearance_description) :-
    (indep(s26), consistent(s26, topsheet_appearance_description) ; \+indep(s26)).
evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, durable_scratch_resistant)).
query(true_val(topsheet_appearance_description, unk_topsheet_appearance_description)).

% @attr factory_wax
% @type categorical
% @canonical false
% @original_name factory wax
% @values wend_natural=WEND_Natural_Wax unk_factory_wax=Unknown
% @importance 1.0

0.92::true_val(factory_wax, wend_natural); 0.08::true_val(factory_wax, unk_factory_wax).
0.95::acc(s1, factory_wax).
measured(s1, factory_wax, wend_natural).
all_consistent(factory_wax) :- consistent(s1, factory_wax).
evidence(all_consistent(factory_wax)).
query(true_val(factory_wax, wend_natural)).
query(true_val(factory_wax, unk_factory_wax)).

% @attr factory_tuned
% @type categorical
% @canonical false
% @original_name factory tuned
% @values yes_detuned=Yes_detuned_tip_tail_ready_to_ride unk_factory_tuned=Unknown
% @importance 0.75

0.74::true_val(factory_tuned, yes_detuned); 0.26::true_val(factory_tuned, unk_factory_tuned).
0.78::acc(s3, factory_tuned).
measured(s3, factory_tuned, yes_detuned).
all_consistent(factory_tuned) :-
    (indep(s3), consistent(s3, factory_tuned) ; \+indep(s3)).
evidence(all_consistent(factory_tuned)).
query(true_val(factory_tuned, yes_detuned)).
query(true_val(factory_tuned, unk_factory_tuned)).

% @attr forever_flex
% @type categorical
% @canonical false
% @original_name forever flex
% @values yes_overbuilt=Yes_overbuilt_then_broken_in_20_days unk_forever_flex=Unknown
% @importance 0.85

0.68::true_val(forever_flex, yes_overbuilt); 0.32::true_val(forever_flex, unk_forever_flex).
0.72::acc(s2, forever_flex).
measured(s2, forever_flex, yes_overbuilt).
all_consistent(forever_flex) :-
    (indep(s2), consistent(s2, forever_flex) ; \+indep(s2)).
evidence(all_consistent(forever_flex)).
query(true_val(forever_flex, yes_overbuilt)).
query(true_val(forever_flex, unk_forever_flex)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts_Standard_Pack unk_mounting_pattern=Unknown
% @importance 0.93

0.95::true_val(mounting_pattern, inserts_2x4); 0.05::true_val(mounting_pattern, unk_mounting_pattern).
0.95::acc(s1, mounting_pattern).
0.90::acc(s2, mounting_pattern).
measured(s1, mounting_pattern, inserts_2x4).
measured(s2, mounting_pattern, inserts_2x4).
all_consistent(mounting_pattern) :-
    consistent(s1, mounting_pattern),
    (indep(s2), consistent(s2, mounting_pattern) ; \+indep(s2)).
evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values groomers_powder_am=Groomers_powder_all_mountain unk_terrain_suitability=Unknown
% @importance 0.85

0.90::true_val(terrain_suitability, groomers_powder_am); 0.10::true_val(terrain_suitability, unk_terrain_suitability).
0.90::acc(s2, terrain_suitability).
measured(s2, terrain_suitability, groomers_powder_am).
all_consistent(terrain_suitability) :-
    (indep(s2), consistent(s2, terrain_suitability) ; \+indep(s2)).
evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, groomers_powder_am)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values am_freeride_carving=All_Mountain_Freeride_Carving unk_riding_style=Unknown
% @importance 0.85

0.90::true_val(riding_style, am_freeride_carving); 0.10::true_val(riding_style, unk_riding_style).
0.90::acc(s2, riding_style).
measured(s2, riding_style, am_freeride_carving).
all_consistent(riding_style) :-
    (indep(s2), consistent(s2, riding_style) ; \+indep(s2)).
evidence(all_consistent(riding_style)).
query(true_val(riding_style, am_freeride_carving)).
query(true_val(riding_style, unk_riding_style)).

% @attr terrain_suitability_powder
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability
% @values v10=10.0 unk_terrain_suitability_powder=Unknown
% @importance 1.0

0.92::true_val(terrain_suitability_powder, v10); 0.08::true_val(terrain_suitability_powder, unk_terrain_suitability_powder).
0.94::acc(s1, terrain_suitability_powder).
measured(s1, terrain_suitability_powder, v10).
all_consistent(terrain_suitability_powder) :- consistent(s1, terrain_suitability_powder).
evidence(all_consistent(terrain_suitability_powder)).
query(true_val(terrain_suitability_powder, v10)).
query(true_val(terrain_suitability_powder, unk_terrain_suitability_powder)).

% @attr terrain_suitability_all_mountain
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability
% @values v9=9.0 unk_terrain_suitability_all_mountain=Unknown
% @importance 1.0

0.92::true_val(terrain_suitability_all_mountain, v9); 0.08::true_val(terrain_suitability_all_mountain, unk_terrain_suitability_all_mountain).
0.94::acc(s1, terrain_suitability_all_mountain).
measured(s1, terrain_suitability_all_mountain, v9).
all_consistent(terrain_suitability_all_mountain) :- consistent(s1, terrain_suitability_all_mountain).
evidence(all_consistent(terrain_suitability_all_mountain)).
query(true_val(terrain_suitability_all_mountain, v9)).
query(true_val(terrain_suitability_all_mountain, unk_terrain_suitability_all_mountain)).

% @attr freestyle_park_rating
% @type numeric
% @unit /10
% @canonical true
% @original_name freestyle_park_rating
% @values v5=5.0 v6=6.0
% @importance 0.93

0.75::true_val(freestyle_park_rating, v5); 0.25::true_val(freestyle_park_rating, v6).
0.94::acc(s1, freestyle_park_rating).
0.72::acc(s2, freestyle_park_rating).
measured(s1, freestyle_park_rating, v5).
measured(s2, freestyle_park_rating, v6).
all_consistent(freestyle_park_rating) :-
    consistent(s1, freestyle_park_rating),
    (indep(s2), consistent(s2, freestyle_park_rating) ; \+indep(s2)).
evidence(all_consistent(freestyle_park_rating)).
query(true_val(freestyle_park_rating, v5)).
query(true_val(freestyle_park_rating, v6)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values beginner_to_expert=Beginner_Intermediate_Expert_progress_2of5 unk_rider_level=Unknown
% @importance 1.0

0.92::true_val(rider_level, beginner_to_expert); 0.08::true_val(rider_level, unk_rider_level).
0.94::acc(s1, rider_level).
measured(s1, rider_level, beginner_to_expert).
all_consistent(rider_level) :- consistent(s1, rider_level).
evidence(all_consistent(rider_level)).
query(true_val(rider_level, beginner_to_expert)).
query(true_val(rider_level, unk_rider_level)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values sizes_150_to_167w=150_153_155W_156_158W_159_161W_162_164W_165_167W unk_available_sizes=Unknown
% @importance 1.0

0.92::true_val(available_sizes, sizes_150_to_167w); 0.08::true_val(available_sizes, unk_available_sizes).
0.95::acc(s1, available_sizes).
measured(s1, available_sizes, sizes_150_to_167w).
all_consistent(available_sizes) :- consistent(s1, available_sizes).
evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, sizes_150_to_167w)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr width_options
% @type categorical
% @canonical true
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 0.85

0.90::true_val(width_options, standard_and_wide); 0.10::true_val(width_options, unk_width_options).
0.92::acc(s2, width_options).
measured(s2, width_options, standard_and_wide).
all_consistent(width_options) :-
    (indep(s2), consistent(s2, width_options) ; \+indep(s2)).
evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

% @attr board_weight_grams
% @type numeric
% @unit g
% @canonical true
% @original_name board_weight_grams
% @values v2700=2700.0 unk_board_weight_grams=Unknown
% @importance 1.0

0.92::true_val(board_weight_grams, v2700); 0.08::true_val(board_weight_grams, unk_board_weight_grams).
0.94::acc(s1, board_weight_grams).
measured(s1, board_weight_grams, v2700).
all_consistent(board_weight_grams) :- consistent(s1, board_weight_grams).
evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v2700)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr board_weight_grams_150
% @type numeric
% @unit g
% @canonical false
% @original_name board_weight_grams
% @values v2500=2500.0 unk_board_weight_grams_150=Unknown
% @importance 1.0

0.92::true_val(board_weight_grams_150, v2500); 0.08::true_val(board_weight_grams_150, unk_board_weight_grams_150).
0.94::acc(s1, board_weight_grams_150).
measured(s1, board_weight_grams_150, v2500).
all_consistent(board_weight_grams_150) :- consistent(s1, board_weight_grams_150).
evidence(all_consistent(board_weight_grams_150)).
query(true_val(board_weight_grams_150, v2500)).
query(true_val(board_weight_grams_150, unk_board_weight_grams_150)).

% @attr board_weight_grams_153
% @type numeric
% @unit g
% @canonical false
% @original_name board_weight_grams
% @values v2600=2600.0 unk_board_weight_grams_153=Unknown
% @importance 1.0

0.92::true_val(board_weight_grams_153, v2600); 0.08::true_val(board_weight_grams_153, unk_board_weight_grams_153).
0.94::acc(s1, board_weight_grams_153).
measured(s1, board_weight_grams_153, v2600).
all_consistent(board_weight_grams_153) :- consistent(s1, board_weight_grams_153).
evidence(all_consistent(board_weight_grams_153)).
query(true_val(board_weight_grams_153, v2600)).
query(true_val(board_weight_grams_153, unk_board_weight_grams_153)).

% @attr board_weight_grams_155w
% @type numeric
% @unit g
% @canonical false
% @original_name board_weight_grams
% @values v2800=2800.0 unk_board_weight_grams_155w=Unknown
% @importance 1.0

0.92::true_val(board_weight_grams_155w, v2800); 0.08::true_val(board_weight_grams_155w, unk_board_weight_grams_155w).
0.94::acc(s1, board_weight_grams_155w).
measured(s1, board_weight_grams_155w, v2800).
all_consistent(board_weight_grams_155w) :- consistent(s1, board_weight_grams_155w).
evidence(all_consistent(board_weight_grams_155w)).
query(true_val(board_weight_grams_155w, v2800)).
query(true_val(board_weight_grams_155w, unk_board_weight_grams_155w)).

% @attr board_weight_grams_158w
% @type numeric
% @unit g
% @canonical false
% @original_name board_weight_grams
% @values v2900=2900.0 unk_board_weight_grams_158w=Unknown
% @importance 1.0

0.92::true_val(board_weight_grams_158w, v2900); 0.08::true_val(board_weight_grams_158w, unk_board_weight_grams_158w).
0.94::acc(s1, board_weight_grams_158w).
measured(s1, board_weight_grams_158w, v2900).
all_consistent(board_weight_grams_158w) :- consistent(s1, board_weight_grams_158w).
evidence(all_consistent(board_weight_grams_158w)).
query(true_val(board_weight_grams_158w, v2900)).
query(true_val(board_weight_grams_158w, unk_board_weight_grams_158w)).

% @attr board_weight_grams_159
% @type numeric
% @unit g
% @canonical false
% @original_name board_weight_grams
% @values v2900=2900.0 unk_board_weight_grams_159=Unknown
% @importance 1.0

0.92::true_val(board_weight_grams_159, v2900); 0.08::true_val(board_weight_grams_159, unk_board_weight_grams_159).
0.94::acc(s1, board_weight_grams_159).
measured(s1, board_weight_grams_159, v2900).
all_consistent(board_weight_grams_159) :- consistent(s1, board_weight_grams_159).
evidence(all_consistent(board_weight_grams_159)).
query(true_val(board_weight_grams_159, v2900)).
query(true_val(board_weight_grams_159, unk_board_weight_grams_159)).

% @attr board_weight_grams_161w
% @type numeric
% @unit g
% @canonical false
% @original_name board_weight_grams
% @values v3000=3000.0 unk_board_weight_grams_161w=Unknown
% @importance 1.0

0.92::true_val(board_weight_grams_161w, v3000); 0.08::true_val(board_weight_grams_161w, unk_board_weight_grams_161w).
0.94::acc(s1, board_weight_grams_161w).
measured(s1, board_weight_grams_161w, v3000).
all_consistent(board_weight_grams_161w) :- consistent(s1, board_weight_grams_161w).
evidence(all_consistent(board_weight_grams_161w)).
query(true_val(board_weight_grams_161w, v3000)).
query(true_val(board_weight_grams_161w, unk_board_weight_grams_161w)).

% @attr board_weight_grams_162
% @type numeric
% @unit g
% @canonical false
% @original_name board_weight_grams
% @values v3000=3000.0 unk_board_weight_grams_162=Unknown
% @importance 1.0

0.92::true_val(board_weight_grams_162, v3000); 0.08::true_val(board_weight_grams_162, unk_board_weight_grams_162).
0.94::acc(s1, board_weight_grams_162).
measured(s1, board_weight_grams_162, v3000).
all_consistent(board_weight_grams_162) :- consistent(s1, board_weight_grams_162).
evidence(all_consistent(board_weight_grams_162)).
query(true_val(board_weight_grams_162, v3000)).
query(true_val(board_weight_grams_162, unk_board_weight_grams_162)).

% @attr board_weight_grams_164w
% @type numeric
% @unit g
% @canonical false
% @original_name board_weight_grams
% @values v3100=3100.0 unk_board_weight_grams_164w=Unknown
% @importance 1.0

0.92::true_val(board_weight_grams_164w, v3100); 0.08::true_val(board_weight_grams_164w, unk_board_weight_grams_164w).
0.94::acc(s1, board_weight_grams_164w).
measured(s1, board_weight_grams_164w, v3100).
all_consistent(board_weight_grams_164w) :- consistent(s1, board_weight_grams_164w).
evidence(all_consistent(board_weight_grams_164w)).
query(true_val(board_weight_grams_164w, v3100)).
query(true_val(board_weight_grams_164w, unk_board_weight_grams_164w)).

% @attr board_weight_grams_165
% @type numeric
% @unit g
% @canonical false
% @original_name board_weight_grams
% @values v3200=3200.0 unk_board_weight_grams_165=Unknown
% @importance 1.0

0.92::true_val(board_weight_grams_165, v3200); 0.08::true_val(board_weight_grams_165, unk_board_weight_grams_165).
0.94::acc(s1, board_weight_grams_165).
measured(s1, board_weight_grams_165, v3200).
all_consistent(board_weight_grams_165) :- consistent(s1, board_weight_grams_165).
evidence(all_consistent(board_weight_grams_165)).
query(true_val(board_weight_grams_165, v3200)).
query(true_val(board_weight_grams_165, unk_board_weight_grams_165)).

% @attr board_weight_grams_167w
% @type numeric
% @unit g
% @canonical false
% @original_name board_weight_grams
% @values v3300=3300.0 unk_board_weight_grams_167w=Unknown
% @importance 1.0

0.92::true_val(board_weight_grams_167w, v3300); 0.08::true_val(board_weight_grams_167w, unk_board_weight_grams_167w).
0.94::acc(s1, board_weight_grams_167w).
measured(s1, board_weight_grams_167w, v3300).
all_consistent(board_weight_grams_167w) :- consistent(s1, board_weight_grams_167w).
evidence(all_consistent(board_weight_grams_167w)).
query(true_val(board_weight_grams_167w, v3300)).
query(true_val(board_weight_grams_167w, unk_board_weight_grams_167w)).

% @attr waist_width_159
% @type numeric
% @unit cm
% @canonical false
% @original_name waist width 159cm
% @values v25_5=25.5 unk_waist_width_159=Unknown
% @importance 1.0

0.92::true_val(waist_width_159, v25_5); 0.08::true_val(waist_width_159, unk_waist_width_159).
0.95::acc(s1, waist_width_159).
measured(s1, waist_width_159, v25_5).
all_consistent(waist_width_159) :- consistent(s1, waist_width_159).
evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v25_5)).
query(true_val(waist_width_159, unk_waist_width_159)).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size
% @values v7_8=7.8 unk_sidecut_radius_size=Unknown
% @importance 1.0

0.92::true_val(sidecut_radius_size, v7_8); 0.08::true_val(sidecut_radius_size, unk_sidecut_radius_size).
0.95::acc(s1, sidecut_radius_size).
measured(s1, sidecut_radius_size, v7_8).
all_consistent(sidecut_radius_size) :- consistent(s1, sidecut_radius_size).
evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_8)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr effective_edge_159
% @type numeric
% @unit mm
% @canonical false
% @original_name effective edge 159cm
% @values v1220=1220.0 v1215=1215.0
% @importance 0.93

0.65::true_val(effective_edge_159, v1220); 0.35::true_val(effective_edge_159, v1215).
0.94::acc(s1, effective_edge_159).
0.72::acc(s2, effective_edge_159).
measured(s1, effective_edge_159, v1220).
measured(s2, effective_edge_159, v1215).
all_consistent(effective_edge_159) :-
    consistent(s1, effective_edge_159),
    (indep(s2), consistent(s2, effective_edge_159) ; \+indep(s2)).
evidence(all_consistent(effective_edge_159)).
query(true_val(effective_edge_159, v1220)).
query(true_val(effective_edge_159, v1215)).

% @attr contact_length_size
% @type numeric
% @unit cm
% @canonical true
% @original_name contact_length_size
% @values v115_5=115.5 unk_contact_length_size=Unknown
% @importance 1.0

0.92::true_val(contact_length_size, v115_5); 0.08::true_val(contact_length_size, unk_contact_length_size).
0.95::acc(s1, contact_length_size).
measured(s1, contact_length_size, v115_5).
all_consistent(contact_length_size) :- consistent(s1, contact_length_size).
evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v115_5)).
query(true_val(contact_length_size, unk_contact_length_size)).

% @attr stance_width_range_size
% @type numeric
% @unit cm
% @canonical true
% @original_name stance_width_range_size
% @values v56_0=56.0 unk_stance_width_range_size=Unknown
% @importance 1.0

0.92::true_val(stance_width_range_size, v56_0); 0.08::true_val(stance_width_range_size, unk_stance_width_range_size).
0.95::acc(s1, stance_width_range_size).
measured(s1, stance_width_range_size, v56_0).
all_consistent(stance_width_range_size) :- consistent(s1, stance_width_range_size).
evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v56_0)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr setback
% @type numeric
% @unit mm
% @canonical true
% @original_name setback
% @values v20=20.0 unk_setback=Unknown
% @importance 1.0

0.92::true_val(setback, v20); 0.08::true_val(setback, unk_setback).
0.95::acc(s1, setback).
measured(s1, setback, v20).
all_consistent(setback) :- consistent(s1, setback).
evidence(all_consistent(setback)).
query(true_val(setback, v20)).
query(true_val(setback, unk_setback)).

% @attr setback_22_stance
% @type categorical
% @canonical false
% @original_name setback
% @values approx_2in=Approx_2in_back_from_center_at_22in_stance unk_setback_22_stance=Unknown
% @importance 0.9

0.66::true_val(setback_22_stance, approx_2in); 0.34::true_val(setback_22_stance, unk_setback_22_stance).
0.85::acc(s21, setback_22_stance).
measured(s21, setback_22_stance, approx_2in).
all_consistent(setback_22_stance) :- consistent(s21, setback_22_stance).
evidence(all_consistent(setback_22_stance)).
query(true_val(setback_22_stance, approx_2in)).
query(true_val(setback_22_stance, unk_setback_22_stance)).

% @attr setback_22_75_stance
% @type categorical
% @canonical false
% @original_name setback
% @values v3_125in=3.125in_back_at_22.75in_stance unk_setback_22_75_stance=Unknown
% @importance 0.9

0.66::true_val(setback_22_75_stance, v3_125in); 0.34::true_val(setback_22_75_stance, unk_setback_22_75_stance).
0.85::acc(s21, setback_22_75_stance).
measured(s21, setback_22_75_stance, v3_125in).
all_consistent(setback_22_75_stance) :- consistent(s21, setback_22_75_stance).
evidence(all_consistent(setback_22_75_stance)).
query(true_val(setback_22_75_stance, v3_125in)).
query(true_val(setback_22_75_stance, unk_setback_22_75_stance)).

% @attr tip_tail_width_size
% @type numeric
% @unit cm
% @canonical true
% @original_name tip_tail_width_size
% @values v30_2=30.2 unk_tip_tail_width_size=Unknown
% @importance 1.0

0.92::true_val(tip_tail_width_size, v30_2); 0.08::true_val(tip_tail_width_size, unk_tip_tail_width_size).
0.95::acc(s1, tip_tail_width_size).
measured(s1, tip_tail_width_size, v30_2).
all_consistent(tip_tail_width_size) :- consistent(s1, tip_tail_width_size).
evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v30_2)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr tip_tail_width_size_tail
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size
% @values v29_7=29.7 unk_tip_tail_width_size_tail=Unknown
% @importance 1.0

0.92::true_val(tip_tail_width_size_tail, v29_7); 0.08::true_val(tip_tail_width_size_tail, unk_tip_tail_width_size_tail).
0.95::acc(s1, tip_tail_width_size_tail).
measured(s1, tip_tail_width_size_tail, v29_7).
all_consistent(tip_tail_width_size_tail) :- consistent(s1, tip_tail_width_size_tail).
evidence(all_consistent(tip_tail_width_size_tail)).
query(true_val(tip_tail_width_size_tail, v29_7)).
query(true_val(tip_tail_width_size_tail, unk_tip_tail_width_size_tail)).

% @attr tip_length_159
% @type numeric
% @unit cm
% @canonical false
% @original_name tip length 159cm
% @values v25_0=25.0 unk_tip_length_159=Unknown
% @importance 1.0

0.92::true_val(tip_length_159, v25_0); 0.08::true_val(tip_length_159, unk_tip_length_159).
0.95::acc(s1, tip_length_159).
measured(s1, tip_length_159, v25_0).
all_consistent(tip_length_159) :- consistent(s1, tip_length_159).
evidence(all_consistent(tip_length_159)).
query(true_val(tip_length_159, v25_0)).
query(true_val(tip_length_159, unk_tip_length_159)).

% @attr tail_length_159
% @type numeric
% @unit cm
% @canonical false
% @original_name tail length 159cm
% @values v18_5=18.5 unk_tail_length_159=Unknown
% @importance 1.0

0.92::true_val(tail_length_159, v18_5); 0.08::true_val(tail_length_159, unk_tail_length_159).
0.95::acc(s1, tail_length_159).
measured(s1, tail_length_159, v18_5).
all_consistent(tail_length_159) :- consistent(s1, tail_length_159).
evidence(all_consistent(tail_length_159)).
query(true_val(tail_length_159, v18_5)).
query(true_val(tail_length_159, unk_tail_length_159)).

% @attr surface_area_159
% @type numeric
% @unit dm2
% @canonical false
% @original_name surface area 159cm
% @values v41_9=41.9 unk_surface_area_159=Unknown
% @importance 1.0

0.92::true_val(surface_area_159, v41_9); 0.08::true_val(surface_area_159, unk_surface_area_159).
0.95::acc(s1, surface_area_159).
measured(s1, surface_area_159, v41_9).
all_consistent(surface_area_159) :- consistent(s1, surface_area_159).
evidence(all_consistent(surface_area_159)).
query(true_val(surface_area_159, v41_9)).
query(true_val(surface_area_159, unk_surface_area_159)).

% @attr recommended_weight_range_size
% @type categorical
% @unit lbs
% @canonical true
% @original_name recommended_weight_range_size
% @values lbs_140_190=140-190lbs_64-86kg unk_recommended_weight_range_size=Unknown
% @importance 1.0

0.92::true_val(recommended_weight_range_size, lbs_140_190); 0.08::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).
0.94::acc(s1, recommended_weight_range_size).
measured(s1, recommended_weight_range_size, lbs_140_190).
all_consistent(recommended_weight_range_size) :- consistent(s1, recommended_weight_range_size).
evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, lbs_140_190)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr ideal_boot_size_159
% @type categorical
% @canonical false
% @original_name ideal boot size 159cm
% @values us9_11=US_9-11_EU_41.5-44.5 unk_ideal_boot_size_159=Unknown
% @importance 1.0

0.92::true_val(ideal_boot_size_159, us9_11); 0.08::true_val(ideal_boot_size_159, unk_ideal_boot_size_159).
0.94::acc(s1, ideal_boot_size_159).
measured(s1, ideal_boot_size_159, us9_11).
all_consistent(ideal_boot_size_159) :- consistent(s1, ideal_boot_size_159).
evidence(all_consistent(ideal_boot_size_159)).
query(true_val(ideal_boot_size_159, us9_11)).
query(true_val(ideal_boot_size_159, unk_ideal_boot_size_159)).

% @attr recommended_binding_size_159
% @type categorical
% @canonical false
% @original_name recommended binding size 159cm
% @values ml=M_L unk_recommended_binding_size_159=Unknown
% @importance 1.0

0.92::true_val(recommended_binding_size_159, ml); 0.08::true_val(recommended_binding_size_159, unk_recommended_binding_size_159).
0.94::acc(s1, recommended_binding_size_159).
measured(s1, recommended_binding_size_159, ml).
all_consistent(recommended_binding_size_159) :- consistent(s1, recommended_binding_size_159).
evidence(all_consistent(recommended_binding_size_159)).
query(true_val(recommended_binding_size_159, ml)).
query(true_val(recommended_binding_size_159, unk_recommended_binding_size_159)).

% @attr big_horn_threshold
% @type categorical
% @canonical false
% @original_name Big Horn series threshold
% @values us11_5_min_26_3cm=US_Mens_11.5plus_min_waist_26.3cm unk_big_horn_threshold=Unknown
% @importance 1.0

0.92::true_val(big_horn_threshold, us11_5_min_26_3cm); 0.08::true_val(big_horn_threshold, unk_big_horn_threshold).
0.94::acc(s1, big_horn_threshold).
measured(s1, big_horn_threshold, us11_5_min_26_3cm).
all_consistent(big_horn_threshold) :- consistent(s1, big_horn_threshold).
evidence(all_consistent(big_horn_threshold)).
query(true_val(big_horn_threshold, us11_5_min_26_3cm)).
query(true_val(big_horn_threshold, unk_big_horn_threshold)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values excellent=Excellent unk_edge_hold=Unknown
% @importance 0.9

0.78::true_val(edge_hold, excellent); 0.22::true_val(edge_hold, unk_edge_hold).
0.88::acc(s31, edge_hold).
measured(s31, edge_hold, excellent).
all_consistent(edge_hold) :- consistent(s31, edge_hold).
evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, excellent)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values quick_turns_slow_mod=Quick_turns_slow_to_moderate_speeds unk_turn_initiation_performance=Unknown
% @importance 0.85

0.65::true_val(turn_initiation_performance, quick_turns_slow_mod); 0.35::true_val(turn_initiation_performance, unk_turn_initiation_performance).
0.85::acc(s4, turn_initiation_performance).
measured(s4, turn_initiation_performance, quick_turns_slow_mod).
all_consistent(turn_initiation_performance) :- consistent(s4, turn_initiation_performance).
evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, quick_turns_slow_mod)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr tree_riding
% @type categorical
% @canonical false
% @original_name tree riding
% @values excels=Excels_edge_to_edge_quickness_tight_spaces unk_tree_riding=Unknown
% @importance 0.85

0.65::true_val(tree_riding, excels); 0.35::true_val(tree_riding, unk_tree_riding).
0.85::acc(s4, tree_riding).
measured(s4, tree_riding, excels).
all_consistent(tree_riding) :- consistent(s4, tree_riding).
evidence(all_consistent(tree_riding)).
query(true_val(tree_riding, excels)).
query(true_val(tree_riding, unk_tree_riding)).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name reviewer_opinion_snowboardingprofiles
% @values very_good_float=Very_good_float_rocker_nose_shape_setback_taper unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.85

0.65::true_val(reviewer_opinion_snowboardingprofiles, very_good_float); 0.35::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).
0.85::acc(s4, reviewer_opinion_snowboardingprofiles).
measured(s4, reviewer_opinion_snowboardingprofiles, very_good_float).
all_consistent(reviewer_opinion_snowboardingprofiles) :- consistent(s4, reviewer_opinion_snowboardingprofiles).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, very_good_float)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

% @attr reviewer_opinion_snowboardingprofiles_comp
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles
% @values not_flagship_stratos_better_mt_twin=Not_Flagship_Stratos_but_floats_better_than_MT_Twin unk_reviewer_opinion_snowboardingprofiles_comp=Unknown
% @importance 0.85

0.66::true_val(reviewer_opinion_snowboardingprofiles_comp, not_flagship_stratos_better_mt_twin); 0.34::true_val(reviewer_opinion_snowboardingprofiles_comp, unk_reviewer_opinion_snowboardingprofiles_comp).
0.85::acc(s21, reviewer_opinion_snowboardingprofiles_comp).
measured(s21, reviewer_opinion_snowboardingprofiles_comp, not_flagship_stratos_better_mt_twin).
all_consistent(reviewer_opinion_snowboardingprofiles_comp) :- consistent(s21, reviewer_opinion_snowboardingprofiles_comp).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles_comp)).
query(true_val(reviewer_opinion_snowboardingprofiles_comp, not_flagship_stratos_better_mt_twin)).
query(true_val(reviewer_opinion_snowboardingprofiles_comp, unk_reviewer_opinion_snowboardingprofiles_comp)).

% @attr park_capability
% @type categorical
% @canonical false
% @original_name park capability
% @values surprisingly_capable=Surprisingly_capable_boxes_rails_jumps_presses unk_park_capability=Unknown
% @importance 0.9

0.78::true_val(park_capability, surprisingly_capable); 0.22::true_val(park_capability, unk_park_capability).
0.88::acc(s31, park_capability).
measured(s31, park_capability, surprisingly_capable).
all_consistent(park_capability) :- consistent(s31, park_capability).
evidence(all_consistent(park_capability)).
query(true_val(park_capability, surprisingly_capable)).
query(true_val(park_capability, unk_park_capability)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values not_dedicated_park=Not_a_dedicated_park_board unk_negative_aspect=Unknown
% @importance 0.9

0.78::true_val(negative_aspect, not_dedicated_park); 0.22::true_val(negative_aspect, unk_negative_aspect).
0.88::acc(s31, negative_aspect).
measured(s31, negative_aspect, not_dedicated_park).
all_consistent(negative_aspect) :- consistent(s31, negative_aspect).
evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, not_dedicated_park)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr pop
% @type categorical
% @canonical false
% @original_name pop
% @values easy_access_not_huge=Easy_to_access_but_total_pop_not_huge unk_pop=Unknown
% @importance 0.85

0.65::true_val(pop, easy_access_not_huge); 0.35::true_val(pop, unk_pop).
0.85::acc(s4, pop).
measured(s4, pop, easy_access_not_huge).
all_consistent(pop) :- consistent(s4, pop).
evidence(all_consistent(pop)).
query(true_val(pop, easy_access_not_huge)).
query(true_val(pop, unk_pop)).

% @attr chatter_performance
% @type categorical
% @canonical true
% @original_name chatter_performance
% @values chatter_high_speed=Reports_of_chatter_at_high_speeds_due_to_softness unk_chatter_performance=Unknown
% @importance 0.9

0.78::true_val(chatter_performance, chatter_high_speed); 0.22::true_val(chatter_performance, unk_chatter_performance).
0.85::acc(s31, chatter_performance).
measured(s31, chatter_performance, chatter_high_speed).
all_consistent(chatter_performance) :- consistent(s31, chatter_performance).
evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, chatter_high_speed)).
query(true_val(chatter_performance, unk_chatter_performance)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values breeze_despite_directional=Breeze_to_ride_switch_despite_directional unk_switch_riding=Unknown
% @importance 0.35

0.81::true_val(switch_riding, breeze_despite_directional); 0.19::true_val(switch_riding, unk_switch_riding).
0.88::acc(s31, switch_riding).
measured(s31, switch_riding, breeze_despite_directional).
all_consistent(switch_riding) :- consistent(s31, switch_riding).
evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, breeze_despite_directional)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values good_for_price=Good_for_price_point_not_fastest_Jones unk_base_glide_performance=Unknown
% @importance 0.85

0.66::true_val(base_glide_performance, good_for_price); 0.34::true_val(base_glide_performance, unk_base_glide_performance).
0.85::acc(s21, base_glide_performance).
measured(s21, base_glide_performance, good_for_price).
all_consistent(base_glide_performance) :- consistent(s21, base_glide_performance).
evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, good_for_price)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr dampening
% @type categorical
% @canonical true
% @original_name dampening
% @values more_damp_than_stratos=More_damp_than_Stratos_medium_weight unk_dampening=Unknown
% @importance 0.85

0.66::true_val(dampening, more_damp_than_stratos); 0.34::true_val(dampening, unk_dampening).
0.85::acc(s21, dampening).
measured(s21, dampening, more_damp_than_stratos).
all_consistent(dampening) :- consistent(s21, dampening).
evidence(all_consistent(dampening)).
query(true_val(dampening, more_damp_than_stratos)).
query(true_val(dampening, unk_dampening)).

% @attr topsheet_durability
% @type categorical
% @canonical false
% @original_name topsheet durability
% @values not_super_thick_reliable=Not_super_thick_but_reliable unk_topsheet_durability=Unknown
% @importance 0.9

0.66::true_val(topsheet_durability, not_super_thick_reliable); 0.34::true_val(topsheet_durability, unk_topsheet_durability).
0.85::acc(s21, topsheet_durability).
measured(s21, topsheet_durability, not_super_thick_reliable).
all_consistent(topsheet_durability) :- consistent(s21, topsheet_durability).
evidence(all_consistent(topsheet_durability)).
query(true_val(topsheet_durability, not_super_thick_reliable)).
query(true_val(topsheet_durability, unk_topsheet_durability)).

% @attr weight_per_cm
% @type categorical
% @canonical true
% @original_name weight_per_cm
% @values medium_to_light=Medium_to_light_side_of_medium unk_weight_per_cm=Unknown
% @importance 0.9

0.66::true_val(weight_per_cm, medium_to_light); 0.34::true_val(weight_per_cm, unk_weight_per_cm).
0.85::acc(s21, weight_per_cm).
measured(s21, weight_per_cm, medium_to_light).
all_consistent(weight_per_cm) :- consistent(s21, weight_per_cm).
evidence(all_consistent(weight_per_cm)).
query(true_val(weight_per_cm, medium_to_light)).
query(true_val(weight_per_cm, unk_weight_per_cm)).

% @attr positive_aspect
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values easy_butter_groomers=Easy_to_butter_on_groomers_soft_flex unk_positive_aspect=Unknown
% @importance 0.9

0.78::true_val(positive_aspect, easy_butter_groomers); 0.22::true_val(positive_aspect, unk_positive_aspect).
0.88::acc(s31, positive_aspect).
measured(s31, positive_aspect, easy_butter_groomers).
all_consistent(positive_aspect) :- consistent(s31, positive_aspect).
evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, easy_butter_groomers)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr user_rating_jones
% @type numeric
% @unit /5
% @canonical false
% @original_name Jones website user rating
% @values v4_8=4.8 unk_user_rating_jones=Unknown
% @importance 1.0

0.92::true_val(user_rating_jones, v4_8); 0.08::true_val(user_rating_jones, unk_user_rating_jones).
0.93::acc(s1, user_rating_jones).
measured(s1, user_rating_jones, v4_8).
all_consistent(user_rating_jones) :- consistent(s1, user_rating_jones).
evidence(all_consistent(user_rating_jones)).
query(true_val(user_rating_jones, v4_8)).
query(true_val(user_rating_jones, unk_user_rating_jones)).

% @attr review_snowboarder_mag
% @type categorical
% @canonical false
% @original_name review summary (Snowboarder Magazine)
% @values most_fun_quiver_killer=Most_fun_board_this_year_quiver_killer unk_review_snowboarder_mag=Unknown
% @importance 0.9

0.78::true_val(review_snowboarder_mag, most_fun_quiver_killer); 0.22::true_val(review_snowboarder_mag, unk_review_snowboarder_mag).
0.88::acc(s31, review_snowboarder_mag).
measured(s31, review_snowboarder_mag, most_fun_quiver_killer).
all_consistent(review_snowboarder_mag) :- consistent(s31, review_snowboarder_mag).
evidence(all_consistent(review_snowboarder_mag)).
query(true_val(review_snowboarder_mag, most_fun_quiver_killer)).
query(true_val(review_snowboarder_mag, unk_review_snowboarder_mag)).

% @attr reviewer_opinion_snowboardingprofiles_summary
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles
% @values had_a_blast=Had_a_blast_mellow_freeride_trees_powder unk_reviewer_opinion_snowboardingprofiles_summary=Unknown
% @importance 0.85

0.65::true_val(reviewer_opinion_snowboardingprofiles_summary, had_a_blast); 0.35::true_val(reviewer_opinion_snowboardingprofiles_summary, unk_reviewer_opinion_snowboardingprofiles_summary).
0.85::acc(s4, reviewer_opinion_snowboardingprofiles_summary).
measured(s4, reviewer_opinion_snowboardingprofiles_summary, had_a_blast).
all_consistent(reviewer_opinion_snowboardingprofiles_summary) :- consistent(s4, reviewer_opinion_snowboardingprofiles_summary).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles_summary)).
query(true_val(reviewer_opinion_snowboardingprofiles_summary, had_a_blast)).
query(true_val(reviewer_opinion_snowboardingprofiles_summary, unk_reviewer_opinion_snowboardingprofiles_summary)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values easy_but_soft_dealbreaker=Very_easy_but_flex_massively_softer_dealbreaker unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.9

0.66::true_val(reviewer_opinion_the_good_ride, easy_but_soft_dealbreaker); 0.34::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).
0.85::acc(s21, reviewer_opinion_the_good_ride).
measured(s21, reviewer_opinion_the_good_ride, easy_but_soft_dealbreaker).
all_consistent(reviewer_opinion_the_good_ride) :- consistent(s21, reviewer_opinion_the_good_ride).
evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, easy_but_soft_dealbreaker)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr review_king_snow
% @type categorical
% @canonical false
% @original_name review summary (King Snow)
% @values natural_responsive_nimble=Everything_felt_natural_responsive_nimble_playful unk_review_king_snow=Unknown
% @importance 0.8

0.62::true_val(review_king_snow, natural_responsive_nimble); 0.38::true_val(review_king_snow, unk_review_king_snow).
0.82::acc(s30, review_king_snow).
measured(s30, review_king_snow, natural_responsive_nimble).
all_consistent(review_king_snow) :- consistent(s30, review_king_snow).
evidence(all_consistent(review_king_snow)).
query(true_val(review_king_snow, natural_responsive_nimble)).
query(true_val(review_king_snow, unk_review_king_snow)).

% @attr review_ski_monster
% @type categorical
% @canonical false
% @original_name review summary (The Ski Monster)
% @values best_directional_mellow=One_of_best_directional_boards_mellow_flex unk_review_ski_monster=Unknown
% @importance 0.75

0.57::true_val(review_ski_monster, best_directional_mellow); 0.43::true_val(review_ski_monster, unk_review_ski_monster).
0.75::acc(s12, review_ski_monster).
measured(s12, review_ski_monster, best_directional_mellow).
all_consistent(review_ski_monster) :-
    (indep(s12), consistent(s12, review_ski_monster) ; \+indep(s12)).
evidence(all_consistent(review_ski_monster)).
query(true_val(review_ski_monster, best_directional_mellow)).
query(true_val(review_ski_monster, unk_review_ski_monster)).

% @attr review_lines_boutique
% @type categorical
% @canonical false
% @original_name review summary (Lines Snow Boutique)
% @values most_complete_versatile=Most_complete_reliable_versatile_affordable unk_review_lines_boutique=Unknown
% @importance 0.7

0.43::true_val(review_lines_boutique, most_complete_versatile); 0.57::true_val(review_lines_boutique, unk_review_lines_boutique).
0.60::acc(s28, review_lines_boutique).
measured(s28, review_lines_boutique, most_complete_versatile).
all_consistent(review_lines_boutique) :-
    (indep(s28), consistent(s28, review_lines_boutique) ; \+indep(s28)).
evidence(all_consistent(review_lines_boutique)).
query(true_val(review_lines_boutique, most_complete_versatile)).
query(true_val(review_lines_boutique, unk_review_lines_boutique)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values great_all_rounder_japan=Great_all_rounder_first_board_Japan unk_user_review_forum=Unknown
% @importance 0.9

0.66::true_val(user_review_forum, great_all_rounder_japan); 0.34::true_val(user_review_forum, unk_user_review_forum).
0.80::acc(s21, user_review_forum).
measured(s21, user_review_forum, great_all_rounder_japan).
all_consistent(user_review_forum) :- consistent(s21, user_review_forum).
evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, great_all_rounder_japan)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr negative_aspect_bridge
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values no_longer_bridge=No_longer_bridge_AM_freeride_soft_flex unk_negative_aspect_bridge=Unknown
% @importance 0.9

0.66::true_val(negative_aspect_bridge, no_longer_bridge); 0.34::true_val(negative_aspect_bridge, unk_negative_aspect_bridge).
0.85::acc(s21, negative_aspect_bridge).
measured(s21, negative_aspect_bridge, no_longer_bridge).
all_consistent(negative_aspect_bridge) :- consistent(s21, negative_aspect_bridge).
evidence(all_consistent(negative_aspect_bridge)).
query(true_val(negative_aspect_bridge, no_longer_bridge)).
query(true_val(negative_aspect_bridge, unk_negative_aspect_bridge)).

% @attr negative_aspect_chatter
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values chatter_complaints=Heard_complaints_chatter_high_speeds unk_negative_aspect_chatter=Unknown
% @importance 0.9

0.78::true_val(negative_aspect_chatter, chatter_complaints); 0.22::true_val(negative_aspect_chatter, unk_negative_aspect_chatter).
0.85::acc(s31, negative_aspect_chatter).
measured(s31, negative_aspect_chatter, chatter_complaints).
all_consistent(negative_aspect_chatter) :- consistent(s31, negative_aspect_chatter).
evidence(all_consistent(negative_aspect_chatter)).
query(true_val(negative_aspect_chatter, chatter_complaints)).
query(true_val(negative_aspect_chatter, unk_negative_aspect_chatter)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values am_ripper_one_board=All_mountain_ripper_resort_powder_trees_park unk_skill_level_recommendation=Unknown
% @importance 0.8

0.62::true_val(skill_level_recommendation, am_ripper_one_board); 0.38::true_val(skill_level_recommendation, unk_skill_level_recommendation).
0.82::acc(s30, skill_level_recommendation).
measured(s30, skill_level_recommendation, am_ripper_one_board).
all_consistent(skill_level_recommendation) :- consistent(s30, skill_level_recommendation).
evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, am_ripper_one_board)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

% @attr skill_level_recommendation_maneuv
% @type categorical
% @canonical false
% @original_name skill_level_recommendation
% @values maneuverability_trees_powder=Riders_valuing_maneuverability_trees_powder unk_skill_level_recommendation_maneuv=Unknown
% @importance 0.85

0.65::true_val(skill_level_recommendation_maneuv, maneuverability_trees_powder); 0.35::true_val(skill_level_recommendation_maneuv, unk_skill_level_recommendation_maneuv).
0.85::acc(s4, skill_level_recommendation_maneuv).
measured(s4, skill_level_recommendation_maneuv, maneuverability_trees_powder).
all_consistent(skill_level_recommendation_maneuv) :- consistent(s4, skill_level_recommendation_maneuv).
evidence(all_consistent(skill_level_recommendation_maneuv)).
query(true_val(skill_level_recommendation_maneuv, maneuverability_trees_powder)).
query(true_val(skill_level_recommendation_maneuv, unk_skill_level_recommendation_maneuv)).

% @attr one_board_quiver
% @type categorical
% @canonical false
% @original_name one-board quiver potential
% @values yes_powder_trees=Yes_if_mostly_powder_trees_cruising_groomers unk_one_board_quiver=Unknown
% @importance 0.85

0.65::true_val(one_board_quiver, yes_powder_trees); 0.35::true_val(one_board_quiver, unk_one_board_quiver).
0.85::acc(s4, one_board_quiver).
measured(s4, one_board_quiver, yes_powder_trees).
all_consistent(one_board_quiver) :- consistent(s4, one_board_quiver).
evidence(all_consistent(one_board_quiver)).
query(true_val(one_board_quiver, yes_powder_trees)).
query(true_val(one_board_quiver, unk_one_board_quiver)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values flagship_749_95=Jones_Flagship_749.95_stiffer_freeride unk_comparable_board_same_brand=Unknown
% @importance 1.0

0.92::true_val(comparable_board_same_brand, flagship_749_95); 0.08::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).
0.93::acc(s1, comparable_board_same_brand).
measured(s1, comparable_board_same_brand, flagship_749_95).
all_consistent(comparable_board_same_brand) :- consistent(s1, comparable_board_same_brand).
evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, flagship_749_95)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_stratos
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values stratos_669_95=Jones_Stratos_669.95_more_technical_rigid unk_comparable_board_same_brand_stratos=Unknown
% @importance 0.81

0.85::true_val(comparable_board_same_brand_stratos, stratos_669_95); 0.15::true_val(comparable_board_same_brand_stratos, unk_comparable_board_same_brand_stratos).
0.92::acc(s1, comparable_board_same_brand_stratos).
measured(s1, comparable_board_same_brand_stratos, stratos_669_95).
all_consistent(comparable_board_same_brand_stratos) :- consistent(s1, comparable_board_same_brand_stratos).
evidence(all_consistent(comparable_board_same_brand_stratos)).
query(true_val(comparable_board_same_brand_stratos, stratos_669_95)).
query(true_val(comparable_board_same_brand_stratos, unk_comparable_board_same_brand_stratos)).

% @attr comparable_board_same_brand_mt_twin
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values mountain_twin=Jones_Mountain_Twin_directional_twin unk_comparable_board_same_brand_mt_twin=Unknown
% @importance 0.85

0.66::true_val(comparable_board_same_brand_mt_twin, mountain_twin); 0.34::true_val(comparable_board_same_brand_mt_twin, unk_comparable_board_same_brand_mt_twin).
0.85::acc(s21, comparable_board_same_brand_mt_twin).
measured(s21, comparable_board_same_brand_mt_twin, mountain_twin).
all_consistent(comparable_board_same_brand_mt_twin) :- consistent(s21, comparable_board_same_brand_mt_twin).
evidence(all_consistent(comparable_board_same_brand_mt_twin)).
query(true_val(comparable_board_same_brand_mt_twin, mountain_twin)).
query(true_val(comparable_board_same_brand_mt_twin, unk_comparable_board_same_brand_mt_twin)).

% @attr comparable_board_same_brand_dw
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values dream_weaver_529_95=Jones_Dream_Weaver_2.0_529.95 unk_comparable_board_same_brand_dw=Unknown
% @importance 0.6

0.70::true_val(comparable_board_same_brand_dw, dream_weaver_529_95); 0.30::true_val(comparable_board_same_brand_dw, unk_comparable_board_same_brand_dw).
0.82::acc(s35, comparable_board_same_brand_dw).
measured(s35, comparable_board_same_brand_dw, dream_weaver_529_95).
all_consistent(comparable_board_same_brand_dw) :-
    (indep(s35), consistent(s35, comparable_board_same_brand_dw) ; \+indep(s35)).
evidence(all_consistent(comparable_board_same_brand_dw)).
query(true_val(comparable_board_same_brand_dw, dream_weaver_529_95)).
query(true_val(comparable_board_same_brand_dw, unk_comparable_board_same_brand_dw)).

% @attr comparable_board_same_brand_vs_stratos
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values more_accessible_forgiving=More_accessible_forgiving_than_Stratos unk_comparable_board_same_brand_vs_stratos=Unknown
% @importance 0.8

0.48::true_val(comparable_board_same_brand_vs_stratos, more_accessible_forgiving); 0.52::true_val(comparable_board_same_brand_vs_stratos, unk_comparable_board_same_brand_vs_stratos).
0.60::acc(s28, comparable_board_same_brand_vs_stratos).
measured(s28, comparable_board_same_brand_vs_stratos, more_accessible_forgiving).
all_consistent(comparable_board_same_brand_vs_stratos) :-
    (indep(s28), consistent(s28, comparable_board_same_brand_vs_stratos) ; \+indep(s28)).
evidence(all_consistent(comparable_board_same_brand_vs_stratos)).
query(true_val(comparable_board_same_brand_vs_stratos, more_accessible_forgiving)).
query(true_val(comparable_board_same_brand_vs_stratos, unk_comparable_board_same_brand_vs_stratos)).

% @attr comparable_board_same_brand_vs_flagship
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values less_aggressive_easier=Less_aggressive_than_Flagship_easier_to_progress unk_comparable_board_same_brand_vs_flagship=Unknown
% @importance 0.8

0.48::true_val(comparable_board_same_brand_vs_flagship, less_aggressive_easier); 0.52::true_val(comparable_board_same_brand_vs_flagship, unk_comparable_board_same_brand_vs_flagship).
0.60::acc(s28, comparable_board_same_brand_vs_flagship).
measured(s28, comparable_board_same_brand_vs_flagship, less_aggressive_easier).
all_consistent(comparable_board_same_brand_vs_flagship) :-
    (indep(s28), consistent(s28, comparable_board_same_brand_vs_flagship) ; \+indep(s28)).
evidence(all_consistent(comparable_board_same_brand_vs_flagship)).
query(true_val(comparable_board_same_brand_vs_flagship, less_aggressive_easier)).
query(true_val(comparable_board_same_brand_vs_flagship, unk_comparable_board_same_brand_vs_flagship)).

% @attr comparable_board_same_brand_vs_mt_twin
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values similar_versatility_more_dir=Similar_versatility_more_directional_character unk_comparable_board_same_brand_vs_mt_twin=Unknown
% @importance 0.8

0.48::true_val(comparable_board_same_brand_vs_mt_twin, similar_versatility_more_dir); 0.52::true_val(comparable_board_same_brand_vs_mt_twin, unk_comparable_board_same_brand_vs_mt_twin).
0.60::acc(s28, comparable_board_same_brand_vs_mt_twin).
measured(s28, comparable_board_same_brand_vs_mt_twin, similar_versatility_more_dir).
all_consistent(comparable_board_same_brand_vs_mt_twin) :-
    (indep(s28), consistent(s28, comparable_board_same_brand_vs_mt_twin) ; \+indep(s28)).
evidence(all_consistent(comparable_board_same_brand_vs_mt_twin)).
query(true_val(comparable_board_same_brand_vs_mt_twin, similar_versatility_more_dir)).
query(true_val(comparable_board_same_brand_vs_mt_twin, unk_comparable_board_same_brand_vs_mt_twin)).

% @attr comparable_board_same_brand_hovercraft
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values hovercraft_629_95=Hovercraft_2.0_629.95_more_freeride_powder unk_comparable_board_same_brand_hovercraft=Unknown
% @importance 1.0

0.92::true_val(comparable_board_same_brand_hovercraft, hovercraft_629_95); 0.08::true_val(comparable_board_same_brand_hovercraft, unk_comparable_board_same_brand_hovercraft).
0.93::acc(s1, comparable_board_same_brand_hovercraft).
measured(s1, comparable_board_same_brand_hovercraft, hovercraft_629_95).
all_consistent(comparable_board_same_brand_hovercraft) :- consistent(s1, comparable_board_same_brand_hovercraft).
evidence(all_consistent(comparable_board_same_brand_hovercraft)).
query(true_val(comparable_board_same_brand_hovercraft, hovercraft_629_95)).
query(true_val(comparable_board_same_brand_hovercraft, unk_comparable_board_same_brand_hovercraft)).

% @attr comparable_board_same_brand_split
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values frontier_split_849_95=Frontier_2.0_Splitboard_849.95 unk_comparable_board_same_brand_split=Unknown
% @importance 0.45

0.78::true_val(comparable_board_same_brand_split, frontier_split_849_95); 0.22::true_val(comparable_board_same_brand_split, unk_comparable_board_same_brand_split).
0.92::acc(s37, comparable_board_same_brand_split).
measured(s37, comparable_board_same_brand_split, frontier_split_849_95).
all_consistent(comparable_board_same_brand_split) :- consistent(s37, comparable_board_same_brand_split).
evidence(all_consistent(comparable_board_same_brand_split)).
query(true_val(comparable_board_same_brand_split, frontier_split_849_95)).
query(true_val(comparable_board_same_brand_split, unk_comparable_board_same_brand_split)).

% @attr key_design_change_taper
% @type categorical
% @canonical false
% @original_name key design change vs predecessor
% @values new_dir_5mm_taper=New_directional_outline_5mm_taper unk_key_design_change_taper=Unknown
% @importance 0.7

0.84::true_val(key_design_change_taper, new_dir_5mm_taper); 0.16::true_val(key_design_change_taper, unk_key_design_change_taper).
0.90::acc(s16, key_design_change_taper).
measured(s16, key_design_change_taper, new_dir_5mm_taper).
all_consistent(key_design_change_taper) :- consistent(s16, key_design_change_taper).
evidence(all_consistent(key_design_change_taper)).
query(true_val(key_design_change_taper, new_dir_5mm_taper)).
query(true_val(key_design_change_taper, unk_key_design_change_taper)).

% @attr key_design_change_flip_tip
% @type categorical
% @canonical false
% @original_name key design change
% @values new_3d_flip_tip=New_3D_Flip_Tip_minimizes_hooking unk_key_design_change_flip_tip=Unknown
% @importance 0.7

0.84::true_val(key_design_change_flip_tip, new_3d_flip_tip); 0.16::true_val(key_design_change_flip_tip, unk_key_design_change_flip_tip).
0.90::acc(s16, key_design_change_flip_tip).
measured(s16, key_design_change_flip_tip, new_3d_flip_tip).
all_consistent(key_design_change_flip_tip) :- consistent(s16, key_design_change_flip_tip).
evidence(all_consistent(key_design_change_flip_tip)).
query(true_val(key_design_change_flip_tip, new_3d_flip_tip)).
query(true_val(key_design_change_flip_tip, unk_key_design_change_flip_tip)).

% @attr key_design_change_3d_base
% @type categorical
% @canonical false
% @original_name key design change
% @values updated_medium_3d=Updated_Medium_3D_Contour_Base_less_friction unk_key_design_change_3d_base=Unknown
% @importance 0.7

0.84::true_val(key_design_change_3d_base, updated_medium_3d); 0.16::true_val(key_design_change_3d_base, unk_key_design_change_3d_base).
0.90::acc(s16, key_design_change_3d_base).
measured(s16, key_design_change_3d_base, updated_medium_3d).
all_consistent(key_design_change_3d_base) :- consistent(s16, key_design_change_3d_base).
evidence(all_consistent(key_design_change_3d_base)).
query(true_val(key_design_change_3d_base, updated_medium_3d)).
query(true_val(key_design_change_3d_base, unk_key_design_change_3d_base)).

% @attr key_design_change_core
% @type categorical
% @canonical false
% @original_name key design change
% @values updated_master_core=Updated_Master_Core_poplar_paulownia_lightweight_pop unk_key_design_change_core=Unknown
% @importance 0.7

0.84::true_val(key_design_change_core, updated_master_core); 0.16::true_val(key_design_change_core, unk_key_design_change_core).
0.90::acc(s16, key_design_change_core).
measured(s16, key_design_change_core, updated_master_core).
all_consistent(key_design_change_core) :- consistent(s16, key_design_change_core).
evidence(all_consistent(key_design_change_core)).
query(true_val(key_design_change_core, updated_master_core)).
query(true_val(key_design_change_core, unk_key_design_change_core)).

% @attr key_design_change_stance
% @type categorical
% @canonical false
% @original_name key design change
% @values narrower_ref_stance=Much_narrower_ref_stance_22in_vs_23.6in unk_key_design_change_stance=Unknown
% @importance 0.9

0.66::true_val(key_design_change_stance, narrower_ref_stance); 0.34::true_val(key_design_change_stance, unk_key_design_change_stance).
0.85::acc(s21, key_design_change_stance).
measured(s21, key_design_change_stance, narrower_ref_stance).
all_consistent(key_design_change_stance) :- consistent(s21, key_design_change_stance).
evidence(all_consistent(key_design_change_stance)).
query(true_val(key_design_change_stance, narrower_ref_stance)).
query(true_val(key_design_change_stance, unk_key_design_change_stance)).

% @attr camber_change_vs_predecessor
% @type categorical
% @canonical false
% @original_name camber change vs predecessor
% @values more_camber_diff_shape=More_camber_different_shape_lower_profile unk_camber_change_vs_predecessor=Unknown
% @importance 0.9

0.66::true_val(camber_change_vs_predecessor, more_camber_diff_shape); 0.34::true_val(camber_change_vs_predecessor, unk_camber_change_vs_predecessor).
0.85::acc(s21, camber_change_vs_predecessor).
measured(s21, camber_change_vs_predecessor, more_camber_diff_shape).
all_consistent(camber_change_vs_predecessor) :- consistent(s21, camber_change_vs_predecessor).
evidence(all_consistent(camber_change_vs_predecessor)).
query(true_val(camber_change_vs_predecessor, more_camber_diff_shape)).
query(true_val(camber_change_vs_predecessor, unk_camber_change_vs_predecessor)).

% @attr sustainability_certification_plant_carbon
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values plant_carbon_27pct=27pct_plant_based_carbon unk_sustainability_certification_plant_carbon=Unknown
% @importance 0.5

0.59::true_val(sustainability_certification_plant_carbon, plant_carbon_27pct); 0.41::true_val(sustainability_certification_plant_carbon, unk_sustainability_certification_plant_carbon).
0.65::acc(s26, sustainability_certification_plant_carbon).
measured(s26, sustainability_certification_plant_carbon, plant_carbon_27pct).
all_consistent(sustainability_certification_plant_carbon) :-
    (indep(s26), consistent(s26, sustainability_certification_plant_carbon) ; \+indep(s26)).
evidence(all_consistent(sustainability_certification_plant_carbon)).
query(true_val(sustainability_certification_plant_carbon, plant_carbon_27pct)).
query(true_val(sustainability_certification_plant_carbon, unk_sustainability_certification_plant_carbon)).

% @attr sustainability_certification_ghg
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values ghg_33pct_less=33pct_less_greenhouse_gas_vs_conventional unk_sustainability_certification_ghg=Unknown
% @importance 0.75

0.74::true_val(sustainability_certification_ghg, ghg_33pct_less); 0.26::true_val(sustainability_certification_ghg, unk_sustainability_certification_ghg).
0.78::acc(s3, sustainability_certification_ghg).
measured(s3, sustainability_certification_ghg, ghg_33pct_less).
all_consistent(sustainability_certification_ghg) :-
    (indep(s3), consistent(s3, sustainability_certification_ghg) ; \+indep(s3)).
evidence(all_consistent(sustainability_certification_ghg)).
query(true_val(sustainability_certification_ghg, ghg_33pct_less)).
query(true_val(sustainability_certification_ghg, unk_sustainability_certification_ghg)).

% @attr sustainability_certification_recycled_abs
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values recycled_abs_plastic=Recycled_ABS_plastic unk_sustainability_certification_recycled_abs=Unknown
% @importance 0.75

0.74::true_val(sustainability_certification_recycled_abs, recycled_abs_plastic); 0.26::true_val(sustainability_certification_recycled_abs, unk_sustainability_certification_recycled_abs).
0.78::acc(s3, sustainability_certification_recycled_abs).
measured(s3, sustainability_certification_recycled_abs, recycled_abs_plastic).
all_consistent(sustainability_certification_recycled_abs) :-
    (indep(s3), consistent(s3, sustainability_certification_recycled_abs) ; \+indep(s3)).
evidence(all_consistent(sustainability_certification_recycled_abs)).
query(true_val(sustainability_certification_recycled_abs, recycled_abs_plastic)).
query(true_val(sustainability_certification_recycled_abs, unk_sustainability_certification_recycled_abs)).

% @attr sustainability_certification_recycled_steel
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values recycled_german_steel=Recycled_German_steel unk_sustainability_certification_recycled_steel=Unknown
% @importance 1.0

0.92::true_val(sustainability_certification_recycled_steel, recycled_german_steel); 0.08::true_val(sustainability_certification_recycled_steel, unk_sustainability_certification_recycled_steel).
0.94::acc(s1, sustainability_certification_recycled_steel).
measured(s1, sustainability_certification_recycled_steel, recycled_german_steel).
all_consistent(sustainability_certification_recycled_steel) :- consistent(s1, sustainability_certification_recycled_steel).
evidence(all_consistent(sustainability_certification_recycled_steel)).
query(true_val(sustainability_certification_recycled_steel, recycled_german_steel)).
query(true_val(sustainability_certification_recycled_steel, unk_sustainability_certification_recycled_steel)).

% @attr sustainability_certification_wend
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values wend_natural_biodegradable=WEND_natural_wax_biodegradable unk_sustainability_certification_wend=Unknown
% @importance 1.0

0.92::true_val(sustainability_certification_wend, wend_natural_biodegradable); 0.08::true_val(sustainability_certification_wend, unk_sustainability_certification_wend).
0.94::acc(s1, sustainability_certification_wend).
measured(s1, sustainability_certification_wend, wend_natural_biodegradable).
all_consistent(sustainability_certification_wend) :- consistent(s1, sustainability_certification_wend).
evidence(all_consistent(sustainability_certification_wend)).
query(true_val(sustainability_certification_wend, wend_natural_biodegradable)).
query(true_val(sustainability_certification_wend, unk_sustainability_certification_wend)).

% @attr sustainability_certification_solar_all
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values solar_100pct_2020=All_boards_100pct_solar_since_2020 unk_sustainability_certification_solar_all=Unknown
% @importance 0.4

0.64::true_val(sustainability_certification_solar_all, solar_100pct_2020); 0.36::true_val(sustainability_certification_solar_all, unk_sustainability_certification_solar_all).
0.72::acc(s6, sustainability_certification_solar_all).
measured(s6, sustainability_certification_solar_all, solar_100pct_2020).
all_consistent(sustainability_certification_solar_all) :- consistent(s6, sustainability_certification_solar_all).
evidence(all_consistent(sustainability_certification_solar_all)).
query(true_val(sustainability_certification_solar_all, solar_100pct_2020)).
query(true_val(sustainability_certification_solar_all, unk_sustainability_certification_solar_all)).

% @attr sustainability_certification_lca
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values lca_15_5kg_co2=Approx_15.5kg_CO2_eq_per_solid_snowboard_2020_LCA unk_sustainability_certification_lca=Unknown
% @importance 0.3

0.45::true_val(sustainability_certification_lca, lca_15_5kg_co2); 0.55::true_val(sustainability_certification_lca, unk_sustainability_certification_lca).
0.55::acc(s38, sustainability_certification_lca).
measured(s38, sustainability_certification_lca, lca_15_5kg_co2).
all_consistent(sustainability_certification_lca) :- consistent(s38, sustainability_certification_lca).
evidence(all_consistent(sustainability_certification_lca)).
query(true_val(sustainability_certification_lca, lca_15_5kg_co2)).
query(true_val(sustainability_certification_lca, unk_sustainability_certification_lca)).

% @attr re_up_program
% @type categorical
% @canonical false
% @original_name re-up program
% @values send_dead_board_50_off=Send_dead_board_get_50_toward_new unk_re_up_program=Unknown
% @importance 1.0

0.92::true_val(re_up_program, send_dead_board_50_off); 0.08::true_val(re_up_program, unk_re_up_program).
0.93::acc(s1, re_up_program).
measured(s1, re_up_program, send_dead_board_50_off).
all_consistent(re_up_program) :- consistent(s1, re_up_program).
evidence(all_consistent(re_up_program)).
query(true_val(re_up_program, send_dead_board_50_off)).
query(true_val(re_up_program, unk_re_up_program)).

% @attr sizing_tip
% @type categorical
% @canonical false
% @original_name sizing tip (manufacturer)
% @values shorter_playful_longer_stable=Choose_shorter_playful_longer_stability_float unk_sizing_tip=Unknown
% @importance 1.0

0.92::true_val(sizing_tip, shorter_playful_longer_stable); 0.08::true_val(sizing_tip, unk_sizing_tip).
0.93::acc(s1, sizing_tip).
measured(s1, sizing_tip, shorter_playful_longer_stable).
all_consistent(sizing_tip) :- consistent(s1, sizing_tip).
evidence(all_consistent(sizing_tip)).
query(true_val(sizing_tip, shorter_playful_longer_stable)).
query(true_val(sizing_tip, unk_sizing_tip)).

% @attr boot_compatibility_regular
% @type categorical
% @canonical false
% @original_name boot compatibility (regular widths)
% @values us7_11=US_Mens_7-11 unk_boot_compatibility_regular=Unknown
% @importance 1.0

0.92::true_val(boot_compatibility_regular, us7_11); 0.08::true_val(boot_compatibility_regular, unk_boot_compatibility_regular).
0.94::acc(s1, boot_compatibility_regular).
measured(s1, boot_compatibility_regular, us7_11).
all_consistent(boot_compatibility_regular) :- consistent(s1, boot_compatibility_regular).
evidence(all_consistent(boot_compatibility_regular)).
query(true_val(boot_compatibility_regular, us7_11)).
query(true_val(boot_compatibility_regular, unk_boot_compatibility_regular)).

% @attr boot_compatibility_wide
% @type categorical
% @canonical false
% @original_name boot compatibility (wide widths)
% @values us9_5_15=US_Mens_9.5-15_depending_on_size unk_boot_compatibility_wide=Unknown
% @importance 1.0

0.92::true_val(boot_compatibility_wide, us9_5_15); 0.08::true_val(boot_compatibility_wide, unk_boot_compatibility_wide).
0.94::acc(s1, boot_compatibility_wide).
measured(s1, boot_compatibility_wide, us9_5_15).
all_consistent(boot_compatibility_wide) :- consistent(s1, boot_compatibility_wide).
evidence(all_consistent(boot_compatibility_wide)).
query(true_val(boot_compatibility_wide, us9_5_15)).
query(true_val(boot_compatibility_wide, unk_boot_compatibility_wide)).

% @attr reviewer_opinion_the_good_ride_boot
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values liberal_boots_conservative_weight=Jones_liberal_boot_sizes_conservative_weight unk_reviewer_opinion_the_good_ride_boot=Unknown
% @importance 0.9

0.66::true_val(reviewer_opinion_the_good_ride_boot, liberal_boots_conservative_weight); 0.34::true_val(reviewer_opinion_the_good_ride_boot, unk_reviewer_opinion_the_good_ride_boot).
0.85::acc(s21, reviewer_opinion_the_good_ride_boot).
measured(s21, reviewer_opinion_the_good_ride_boot, liberal_boots_conservative_weight).
all_consistent(reviewer_opinion_the_good_ride_boot) :- consistent(s21, reviewer_opinion_the_good_ride_boot).
evidence(all_consistent(reviewer_opinion_the_good_ride_boot)).
query(true_val(reviewer_opinion_the_good_ride_boot, liberal_boots_conservative_weight)).
query(true_val(reviewer_opinion_the_good_ride_boot, unk_reviewer_opinion_the_good_ride_boot)).

% @attr reviewer_opinion_the_good_ride_size
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values new_159_feels_smaller=New_159_feels_smaller_than_old_159_softer_flex unk_reviewer_opinion_the_good_ride_size=Unknown
% @importance 0.9

0.66::true_val(reviewer_opinion_the_good_ride_size, new_159_feels_smaller); 0.34::true_val(reviewer_opinion_the_good_ride_size, unk_reviewer_opinion_the_good_ride_size).
0.85::acc(s21, reviewer_opinion_the_good_ride_size).
measured(s21, reviewer_opinion_the_good_ride_size, new_159_feels_smaller).
all_consistent(reviewer_opinion_the_good_ride_size) :- consistent(s21, reviewer_opinion_the_good_ride_size).
evidence(all_consistent(reviewer_opinion_the_good_ride_size)).
query(true_val(reviewer_opinion_the_good_ride_size, new_159_feels_smaller)).
query(true_val(reviewer_opinion_the_good_ride_size, unk_reviewer_opinion_the_good_ride_size)).