0.15::indep(s1).
0.15::indep(s7).
0.15::indep(s8).
0.25::indep(s9).
0.15::indep(s31).
0.20::indep(s33).
0.15::indep(s37).
0.15::indep(s38).
0.15::indep(s39).
0.15::indep(s43).
0.15::indep(s44).
0.15::indep(s29).
0.20::indep(s35).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

0.90::acc(s1, brand).
0.95::acc(s5, brand).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values salomon=Salomon unk_brand=Unknown
% @importance 0.95

0.96::true_val(brand, salomon); 0.04::true_val(brand, unk_brand).

measured(s1, brand, salomon).
measured(s5, brand, salomon).

all_consistent(brand) :-
    consistent(s5, brand),
    (indep(s1), consistent(s1, brand) ; \+indep(s1)).

evidence(all_consistent(brand)).
query(true_val(brand, salomon)).
query(true_val(brand, unk_brand)).

0.90::acc(s1, model_name).
0.95::acc(s5, model_name).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values highpath=Highpath unk_model_name=Unknown
% @importance 0.95

0.96::true_val(model_name, highpath); 0.04::true_val(model_name, unk_model_name).

measured(s1, model_name, highpath).
measured(s5, model_name, highpath).

all_consistent(model_name) :-
    consistent(s5, model_name),
    (indep(s1), consistent(s1, model_name) ; \+indep(s1)).

evidence(all_consistent(model_name)).
query(true_val(model_name, highpath)).
query(true_val(model_name, unk_model_name)).

0.80::acc(s7, model_year).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2027=2027 unk_model_year=Unknown
% @importance 0.80

0.72::true_val(model_year, y2027); 0.28::true_val(model_year, unk_model_year).

measured(s7, model_year, y2027).

all_consistent(model_year) :-
    (indep(s7), consistent(s7, model_year) ; \+indep(s7)).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2027)).
query(true_val(model_year, unk_model_year)).

0.95::acc(s5, product_type).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.96::true_val(product_type, snowboard); 0.04::true_val(product_type, unk_product_type).

measured(s5, product_type, snowboard).

all_consistent(product_type) :-
    consistent(s5, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

0.93::acc(s5, board_category).
0.85::acc(s9, board_category).
0.78::acc(s2, board_category).
0.80::acc(s15, board_category).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain=All_Mountain all_mountain_freeride=All_Mountain_Freeride
% @importance 0.83

0.45::true_val(board_category, all_mountain); 0.55::true_val(board_category, all_mountain_freeride).

measured(s5, board_category, all_mountain).
measured(s9, board_category, all_mountain).
measured(s2, board_category, all_mountain_freeride).
measured(s15, board_category, all_mountain_freeride).

all_consistent(board_category) :-
    consistent(s5, board_category),
    (indep(s9), consistent(s9, board_category) ; \+indep(s9)),
    consistent(s2, board_category),
    consistent(s15, board_category).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain)).
query(true_val(board_category, all_mountain_freeride)).

0.85::acc(s16, gender).
0.90::acc(s18, gender).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values unisex=Unisex unk_gender=Unknown
% @importance 0.65

0.93::true_val(gender, unisex); 0.07::true_val(gender, unk_gender).

measured(s16, gender, unisex).
measured(s18, gender, unisex).

all_consistent(gender) :-
    consistent(s16, gender),
    consistent(s18, gender).

evidence(all_consistent(gender)).
query(true_val(gender, unisex)).
query(true_val(gender, unk_gender)).

0.88::acc(s21, manufacturer).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values salomon_sas_france=Salomon_SAS_Annecy_France unk_manufacturer=Unknown
% @importance 0.50

0.85::true_val(manufacturer, salomon_sas_france); 0.15::true_val(manufacturer, unk_manufacturer).

measured(s21, manufacturer, salomon_sas_france).

all_consistent(manufacturer) :-
    consistent(s21, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, salomon_sas_france)).
query(true_val(manufacturer, unk_manufacturer)).

0.88::acc(s21, parent_company).

% @attr parent_company
% @type categorical
% @canonical false
% @original_name Parent company
% @values amer_sports=Amer_Sports_Finland unk_parent_company=Unknown
% @importance 0.50

0.85::true_val(parent_company, amer_sports); 0.15::true_val(parent_company, unk_parent_company).

measured(s21, parent_company, amer_sports).

all_consistent(parent_company) :-
    consistent(s21, parent_company).

evidence(all_consistent(parent_company)).
query(true_val(parent_company, amer_sports)).
query(true_val(parent_company, unk_parent_company)).

0.88::acc(s21, founded).

% @attr founded
% @type categorical
% @canonical false
% @original_name Founded
% @values y1947_french_alps=1947_French_Alps unk_founded=Unknown
% @importance 0.50

0.85::true_val(founded, y1947_french_alps); 0.15::true_val(founded, unk_founded).

measured(s21, founded, y1947_french_alps).

all_consistent(founded) :-
    consistent(s21, founded).

evidence(all_consistent(founded)).
query(true_val(founded, y1947_french_alps)).
query(true_val(founded, unk_founded)).

0.82::acc(s22, design_location).

% @attr design_location
% @type categorical
% @canonical false
% @original_name Salomon snowboard design/development location
% @values annecy_france=Annecy_France unk_design_location=Unknown
% @importance 0.40

0.80::true_val(design_location, annecy_france); 0.20::true_val(design_location, unk_design_location).

measured(s22, design_location, annecy_france).

all_consistent(design_location) :-
    consistent(s22, design_location).

evidence(all_consistent(design_location)).
query(true_val(design_location, annecy_france)).
query(true_val(design_location, unk_design_location)).

0.82::acc(s22, marketing_location).

% @attr marketing_location
% @type categorical
% @canonical false
% @original_name Salomon snowboard marketing location
% @values portland_oregon=Portland_Oregon_USA unk_marketing_location=Unknown
% @importance 0.40

0.80::true_val(marketing_location, portland_oregon); 0.20::true_val(marketing_location, unk_marketing_location).

measured(s22, marketing_location, portland_oregon).

all_consistent(marketing_location) :-
    consistent(s22, marketing_location).

evidence(all_consistent(marketing_location)).
query(true_val(marketing_location, portland_oregon)).
query(true_val(marketing_location, unk_marketing_location)).

0.90::acc(s23, manufacturing_location).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values china=China unk_manufacturing_location=Unknown
% @importance 0.55

0.85::true_val(manufacturing_location, china); 0.15::true_val(manufacturing_location, unk_manufacturing_location).

measured(s23, manufacturing_location, china).

all_consistent(manufacturing_location) :-
    consistent(s23, manufacturing_location).

evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, china)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

0.90::acc(s24, model_first_available_year).
0.88::acc(s25, model_first_available_year).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values fw22_23=FW22_23_season unk_model_first_available_year=Unknown
% @importance 0.63

0.95::true_val(model_first_available_year, fw22_23); 0.05::true_val(model_first_available_year, unk_model_first_available_year).

measured(s24, model_first_available_year, fw22_23).
measured(s25, model_first_available_year, fw22_23).

all_consistent(model_first_available_year) :-
    consistent(s24, model_first_available_year),
    consistent(s25, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, fw22_23)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

0.90::acc(s24, pro_rider_name).
0.88::acc(s26, pro_rider_name).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values mindnich_daviet=Nils_Mindnich_and_Victor_Daviet unk_pro_rider_name=Unknown
% @importance 0.70

0.95::true_val(pro_rider_name, mindnich_daviet); 0.05::true_val(pro_rider_name, unk_pro_rider_name).

measured(s24, pro_rider_name, mindnich_daviet).
measured(s26, pro_rider_name, mindnich_daviet).

all_consistent(pro_rider_name) :-
    consistent(s24, pro_rider_name),
    consistent(s26, pro_rider_name).

evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, mindnich_daviet)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

0.88::acc(s27, nils_mindnich_credentials).

% @attr nils_mindnich_credentials
% @type categorical
% @canonical false
% @original_name Nils Mindnich credentials
% @values champion_multi_event=Banked_Slalom_FWT_Dirksen_NST unk_nils_mindnich_credentials=Unknown
% @importance 0.50

0.83::true_val(nils_mindnich_credentials, champion_multi_event); 0.17::true_val(nils_mindnich_credentials, unk_nils_mindnich_credentials).

measured(s27, nils_mindnich_credentials, champion_multi_event).

all_consistent(nils_mindnich_credentials) :-
    consistent(s27, nils_mindnich_credentials).

evidence(all_consistent(nils_mindnich_credentials)).
query(true_val(nils_mindnich_credentials, champion_multi_event)).
query(true_val(nils_mindnich_credentials, unk_nils_mindnich_credentials)).

0.88::acc(s28, nils_mindnich_role).

% @attr nils_mindnich_role
% @type categorical
% @canonical false
% @original_name Nils Mindnich now works for Salomon as product designer (engineering & prototyping)
% @values salomon_product_designer=Product_designer_engineering_prototyping unk_nils_mindnich_role=Unknown
% @importance 0.45

0.82::true_val(nils_mindnich_role, salomon_product_designer); 0.18::true_val(nils_mindnich_role, unk_nils_mindnich_role).

measured(s28, nils_mindnich_role, salomon_product_designer).

all_consistent(nils_mindnich_role) :-
    consistent(s28, nils_mindnich_role).

evidence(all_consistent(nils_mindnich_role)).
query(true_val(nils_mindnich_role, salomon_product_designer)).
query(true_val(nils_mindnich_role, unk_nils_mindnich_role)).

0.75::acc(s29, model_variant).

% @attr model_variant
% @type categorical
% @canonical false
% @original_name Model variant
% @values splitboard_plum_pomoca=Highpath_Splitboard_Plum_Pomoca unk_model_variant=Unknown
% @importance 0.40

0.70::true_val(model_variant, splitboard_plum_pomoca); 0.30::true_val(model_variant, unk_model_variant).

measured(s29, model_variant, splitboard_plum_pomoca).

all_consistent(model_variant) :-
    (indep(s29), consistent(s29, model_variant) ; \+indep(s29)).

evidence(all_consistent(model_variant)).
query(true_val(model_variant, splitboard_plum_pomoca)).
query(true_val(model_variant, unk_model_variant)).

0.88::acc(s30, snowboard_magazine_award).

% @attr snowboard_magazine_award
% @type categorical
% @canonical false
% @original_name Snowboard Magazine Platinum Pick award
% @values platinum_pick_best_23=Platinum_Pick_Best_of_23 unk_snowboard_magazine_award=Unknown
% @importance 0.60

0.85::true_val(snowboard_magazine_award, platinum_pick_best_23); 0.15::true_val(snowboard_magazine_award, unk_snowboard_magazine_award).

measured(s30, snowboard_magazine_award, platinum_pick_best_23).

all_consistent(snowboard_magazine_award) :-
    consistent(s30, snowboard_magazine_award).

evidence(all_consistent(snowboard_magazine_award)).
query(true_val(snowboard_magazine_award, platinum_pick_best_23)).
query(true_val(snowboard_magazine_award, unk_snowboard_magazine_award)).

0.80::acc(s31, price_aud_merchant).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v1049_99=1049.99 unk_price_aud_merchant=Unknown
% @importance 0.90

0.78::true_val(price_aud_merchant, v1049_99); 0.22::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s31, price_aud_merchant, v1049_99).

all_consistent(price_aud_merchant) :-
    (indep(s31), consistent(s31, price_aud_merchant) ; \+indep(s31)).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v1049_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

0.88::acc(s32, price_usd_msrp).
0.87::acc(s33, price_usd_msrp).
0.82::acc(s34, price_usd_msrp).
0.80::acc(s35, price_usd_msrp).
0.85::acc(s36, price_usd_msrp).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v699_95=699.95 v649_95=649.95
% @importance 0.88

0.60::true_val(price_usd_msrp, v699_95); 0.40::true_val(price_usd_msrp, v649_95).

measured(s32, price_usd_msrp, v699_95).
measured(s33, price_usd_msrp, v699_95).
measured(s34, price_usd_msrp, v699_95).
measured(s35, price_usd_msrp, v649_95).
measured(s36, price_usd_msrp, v649_95).

all_consistent(price_usd_msrp) :-
    consistent(s32, price_usd_msrp),
    (indep(s33), consistent(s33, price_usd_msrp) ; \+indep(s33)),
    consistent(s34, price_usd_msrp),
    (indep(s35), consistent(s35, price_usd_msrp) ; \+indep(s35)),
    consistent(s36, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v699_95)).
query(true_val(price_usd_msrp, v649_95)).

0.85::acc(s32, price_eur_blue_tomato).

% @attr price_eur_blue_tomato
% @type numeric
% @unit EUR
% @canonical true
% @original_name price_eur_blue_tomato
% @values v429=429.0 unk_price_eur_blue_tomato=Unknown
% @importance 0.95

0.82::true_val(price_eur_blue_tomato, v429); 0.18::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).

measured(s32, price_eur_blue_tomato, v429).

all_consistent(price_eur_blue_tomato) :-
    consistent(s32, price_eur_blue_tomato).

evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v429)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

0.85::acc(s32, price_gbp_blue_tomato_uk).

% @attr price_gbp_blue_tomato_uk
% @type numeric
% @unit GBP
% @canonical true
% @original_name price_gbp_blue_tomato_uk
% @values v385=385.0 unk_price_gbp_blue_tomato_uk=Unknown
% @importance 0.95

0.82::true_val(price_gbp_blue_tomato_uk, v385); 0.18::true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk).

measured(s32, price_gbp_blue_tomato_uk, v385).

all_consistent(price_gbp_blue_tomato_uk) :-
    consistent(s32, price_gbp_blue_tomato_uk).

evidence(all_consistent(price_gbp_blue_tomato_uk)).
query(true_val(price_gbp_blue_tomato_uk, v385)).
query(true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk)).

0.85::acc(s32, price_cad_prfo).

% @attr price_cad_prfo
% @type numeric
% @unit CAD
% @canonical true
% @original_name price_cad_prfo
% @values v769_99=769.99 unk_price_cad_prfo=Unknown
% @importance 0.95

0.82::true_val(price_cad_prfo, v769_99); 0.18::true_val(price_cad_prfo, unk_price_cad_prfo).

measured(s32, price_cad_prfo, v769_99).

all_consistent(price_cad_prfo) :-
    consistent(s32, price_cad_prfo).

evidence(all_consistent(price_cad_prfo)).
query(true_val(price_cad_prfo, v769_99)).
query(true_val(price_cad_prfo, unk_price_cad_prfo)).

0.82::acc(s32, price_usd_oge_sale).

% @attr price_usd_oge_sale
% @type numeric
% @unit USD
% @canonical false
% @original_name Price (USD, Outdoor Gear Exchange on sale / prior-year models)
% @values v454_97=454.97 unk_price_usd_oge_sale=Unknown
% @importance 0.95

0.80::true_val(price_usd_oge_sale, v454_97); 0.20::true_val(price_usd_oge_sale, unk_price_usd_oge_sale).

measured(s32, price_usd_oge_sale, v454_97).

all_consistent(price_usd_oge_sale) :-
    consistent(s32, price_usd_oge_sale).

evidence(all_consistent(price_usd_oge_sale)).
query(true_val(price_usd_oge_sale, v454_97)).
query(true_val(price_usd_oge_sale, unk_price_usd_oge_sale)).

0.85::acc(s35, price_usd_evo_discounted).

% @attr price_usd_evo_discounted
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_evo
% @values v308_73=308.73 unk_price_usd_evo_discounted=Unknown
% @importance 0.70

0.82::true_val(price_usd_evo_discounted, v308_73); 0.18::true_val(price_usd_evo_discounted, unk_price_usd_evo_discounted).

measured(s35, price_usd_evo_discounted, v308_73).

all_consistent(price_usd_evo_discounted) :-
    (indep(s35), consistent(s35, price_usd_evo_discounted) ; \+indep(s35)).

evidence(all_consistent(price_usd_evo_discounted)).
query(true_val(price_usd_evo_discounted, v308_73)).
query(true_val(price_usd_evo_discounted, unk_price_usd_evo_discounted)).

0.80::acc(s31, estimated_availability_date).

% @attr estimated_availability_date
% @type categorical
% @canonical true
% @original_name estimated_availability_date
% @values preorder_may_2026=Preorder_est_May_1_2026 unk_estimated_availability_date=Unknown
% @importance 0.90

0.78::true_val(estimated_availability_date, preorder_may_2026); 0.22::true_val(estimated_availability_date, unk_estimated_availability_date).

measured(s31, estimated_availability_date, preorder_may_2026).

all_consistent(estimated_availability_date) :-
    (indep(s31), consistent(s31, estimated_availability_date) ; \+indep(s31)).

evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, preorder_may_2026)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

0.85::acc(s32, availability_status).
0.87::acc(s33, availability_status).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values in_stock=In_stock_evo_REI_Backcountry_TheHouse unk_availability_status=Unknown
% @importance 0.90

0.93::true_val(availability_status, in_stock); 0.07::true_val(availability_status, unk_availability_status).

measured(s32, availability_status, in_stock).
measured(s33, availability_status, in_stock).

all_consistent(availability_status) :-
    consistent(s32, availability_status),
    (indep(s33), consistent(s33, availability_status) ; \+indep(s33)).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, in_stock)).
query(true_val(availability_status, unk_availability_status)).

0.88::acc(s32, seller_evo).

% @attr seller_evo
% @type categorical
% @canonical false
% @original_name Seller: evo.com
% @values authorized=Reputable_major_online_specialty_retailer unk_seller_evo=Unknown
% @importance 0.95

0.85::true_val(seller_evo, authorized); 0.15::true_val(seller_evo, unk_seller_evo).

measured(s32, seller_evo, authorized).

all_consistent(seller_evo) :-
    consistent(s32, seller_evo).

evidence(all_consistent(seller_evo)).
query(true_val(seller_evo, authorized)).
query(true_val(seller_evo, unk_seller_evo)).

0.87::acc(s33, seller_rei).

% @attr seller_rei
% @type categorical
% @canonical false
% @original_name Seller: REI Co-op
% @values authorized=Major_US_outdoor_retailer unk_seller_rei=Unknown
% @importance 0.85

0.85::true_val(seller_rei, authorized); 0.15::true_val(seller_rei, unk_seller_rei).

measured(s33, seller_rei, authorized).

all_consistent(seller_rei) :-
    (indep(s33), consistent(s33, seller_rei) ; \+indep(s33)).

evidence(all_consistent(seller_rei)).
query(true_val(seller_rei, authorized)).
query(true_val(seller_rei, unk_seller_rei)).

0.85::acc(s32, seller_backcountry).

% @attr seller_backcountry
% @type categorical
% @canonical false
% @original_name Seller: Backcountry.com
% @values authorized=Major_US_specialty_online_retailer unk_seller_backcountry=Unknown
% @importance 0.95

0.85::true_val(seller_backcountry, authorized); 0.15::true_val(seller_backcountry, unk_seller_backcountry).

measured(s32, seller_backcountry, authorized).

all_consistent(seller_backcountry) :-
    consistent(s32, seller_backcountry).

evidence(all_consistent(seller_backcountry)).
query(true_val(seller_backcountry, authorized)).
query(true_val(seller_backcountry, unk_seller_backcountry)).

0.85::acc(s32, seller_the_house).

% @attr seller_the_house
% @type categorical
% @canonical false
% @original_name Seller: The House
% @values authorized=Established_US_snowboard_retailer unk_seller_the_house=Unknown
% @importance 0.95

0.85::true_val(seller_the_house, authorized); 0.15::true_val(seller_the_house, unk_seller_the_house).

measured(s32, seller_the_house, authorized).

all_consistent(seller_the_house) :-
    consistent(s32, seller_the_house).

evidence(all_consistent(seller_the_house)).
query(true_val(seller_the_house, authorized)).
query(true_val(seller_the_house, unk_seller_the_house)).

0.85::acc(s32, seller_oge).

% @attr seller_oge
% @type categorical
% @canonical false
% @original_name Seller: Outdoor Gear Exchange
% @values authorized=Specialty_retailer unk_seller_oge=Unknown
% @importance 0.95

0.85::true_val(seller_oge, authorized); 0.15::true_val(seller_oge, unk_seller_oge).

measured(s32, seller_oge, authorized).

all_consistent(seller_oge) :-
    consistent(s32, seller_oge).

evidence(all_consistent(seller_oge)).
query(true_val(seller_oge, authorized)).
query(true_val(seller_oge, unk_seller_oge)).

0.85::acc(s32, seller_blue_tomato).

% @attr seller_blue_tomato
% @type categorical
% @canonical false
% @original_name Seller: Blue Tomato
% @values authorized=European_specialty_retailer unk_seller_blue_tomato=Unknown
% @importance 0.95

0.85::true_val(seller_blue_tomato, authorized); 0.15::true_val(seller_blue_tomato, unk_seller_blue_tomato).

measured(s32, seller_blue_tomato, authorized).

all_consistent(seller_blue_tomato) :-
    consistent(s32, seller_blue_tomato).

evidence(all_consistent(seller_blue_tomato)).
query(true_val(seller_blue_tomato, authorized)).
query(true_val(seller_blue_tomato, unk_seller_blue_tomato)).

0.85::acc(s32, seller_snowcountry).

% @attr seller_snowcountry
% @type categorical
% @canonical false
% @original_name Seller: SnowCountry (EU)
% @values authorized_eur449=EU_specialty_retailer_EUR449 unk_seller_snowcountry=Unknown
% @importance 0.95

0.85::true_val(seller_snowcountry, authorized_eur449); 0.15::true_val(seller_snowcountry, unk_seller_snowcountry).

measured(s32, seller_snowcountry, authorized_eur449).

all_consistent(seller_snowcountry) :-
    consistent(s32, seller_snowcountry).

evidence(all_consistent(seller_snowcountry)).
query(true_val(seller_snowcountry, authorized_eur449)).
query(true_val(seller_snowcountry, unk_seller_snowcountry)).

0.85::acc(s32, seller_prfo).

% @attr seller_prfo
% @type categorical
% @canonical false
% @original_name Seller: PRFO Sports (Canada)
% @values authorized=Canadian_retailer unk_seller_prfo=Unknown
% @importance 0.95

0.85::true_val(seller_prfo, authorized); 0.15::true_val(seller_prfo, unk_seller_prfo).

measured(s32, seller_prfo, authorized).

all_consistent(seller_prfo) :-
    consistent(s32, seller_prfo).

evidence(all_consistent(seller_prfo)).
query(true_val(seller_prfo, authorized)).
query(true_val(seller_prfo, unk_seller_prfo)).

0.80::acc(s7, seller_melbourne_snowboard).

% @attr seller_melbourne_snowboard
% @type categorical
% @canonical false
% @original_name Seller: Melbourne Snowboard Centre (Australia)
% @values preorder_2027=AU_retailer_preorder_2027 unk_seller_melbourne_snowboard=Unknown
% @importance 0.80

0.78::true_val(seller_melbourne_snowboard, preorder_2027); 0.22::true_val(seller_melbourne_snowboard, unk_seller_melbourne_snowboard).

measured(s7, seller_melbourne_snowboard, preorder_2027).

all_consistent(seller_melbourne_snowboard) :-
    (indep(s7), consistent(s7, seller_melbourne_snowboard) ; \+indep(s7)).

evidence(all_consistent(seller_melbourne_snowboard)).
query(true_val(seller_melbourne_snowboard, preorder_2027)).
query(true_val(seller_melbourne_snowboard, unk_seller_melbourne_snowboard)).

0.80::acc(s8, seller_auski).

% @attr seller_auski
% @type categorical
% @canonical false
% @original_name Seller: Auski (Australia)
% @values available_2027=AU_retailer_2027_model unk_seller_auski=Unknown
% @importance 0.85

0.78::true_val(seller_auski, available_2027); 0.22::true_val(seller_auski, unk_seller_auski).

measured(s8, seller_auski, available_2027).

all_consistent(seller_auski) :-
    (indep(s8), consistent(s8, seller_auski) ; \+indep(s8)).

evidence(all_consistent(seller_auski)).
query(true_val(seller_auski, available_2027)).
query(true_val(seller_auski, unk_seller_auski)).

0.80::acc(s37, seller_rhythm).

% @attr seller_rhythm
% @type categorical
% @canonical false
% @original_name Seller: Rhythm Snowsports (Australia)
% @values available_2027=AU_retailer_2027_model unk_seller_rhythm=Unknown
% @importance 0.60

0.78::true_val(seller_rhythm, available_2027); 0.22::true_val(seller_rhythm, unk_seller_rhythm).

measured(s37, seller_rhythm, available_2027).

all_consistent(seller_rhythm) :-
    (indep(s37), consistent(s37, seller_rhythm) ; \+indep(s37)).

evidence(all_consistent(seller_rhythm)).
query(true_val(seller_rhythm, available_2027)).
query(true_val(seller_rhythm, unk_seller_rhythm)).

0.70::acc(s38, seller_blauer).

% @attr seller_blauer
% @type categorical
% @canonical false
% @original_name Seller: Blauer Board Shop (US)
% @values listed_2027=US_retailer_2027_listed unk_seller_blauer=Unknown
% @importance 0.40

0.68::true_val(seller_blauer, listed_2027); 0.32::true_val(seller_blauer, unk_seller_blauer).

measured(s38, seller_blauer, listed_2027).

all_consistent(seller_blauer) :-
    (indep(s38), consistent(s38, seller_blauer) ; \+indep(s38)).

evidence(all_consistent(seller_blauer)).
query(true_val(seller_blauer, listed_2027)).
query(true_val(seller_blauer, unk_seller_blauer)).

0.72::acc(s39, seller_corbetts).

% @attr seller_corbetts
% @type categorical
% @canonical false
% @original_name Seller: Corbetts Ski + Snowboard
% @values authorized=Specialty_retailer unk_seller_corbetts=Unknown
% @importance 0.50

0.70::true_val(seller_corbetts, authorized); 0.30::true_val(seller_corbetts, unk_seller_corbetts).

measured(s39, seller_corbetts, authorized).

all_consistent(seller_corbetts) :-
    (indep(s39), consistent(s39, seller_corbetts) ; \+indep(s39)).

evidence(all_consistent(seller_corbetts)).
query(true_val(seller_corbetts, authorized)).
query(true_val(seller_corbetts, unk_seller_corbetts)).

0.93::acc(s36, seller_salomon_direct).

% @attr seller_salomon_direct
% @type categorical
% @canonical false
% @original_name Seller: Salomon.com direct
% @values direct_available=Available_direct_from_manufacturer unk_seller_salomon_direct=Unknown
% @importance 0.80

0.90::true_val(seller_salomon_direct, direct_available); 0.10::true_val(seller_salomon_direct, unk_seller_salomon_direct).

measured(s36, seller_salomon_direct, direct_available).

all_consistent(seller_salomon_direct) :-
    consistent(s36, seller_salomon_direct).

evidence(all_consistent(seller_salomon_direct)).
query(true_val(seller_salomon_direct, direct_available)).
query(true_val(seller_salomon_direct, unk_seller_salomon_direct)).

0.95::acc(s5, shape).
0.80::acc(s7, shape).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 0.90

0.95::true_val(shape, tapered_directional); 0.05::true_val(shape, unk_shape).

measured(s5, shape, tapered_directional).
measured(s7, shape, tapered_directional).

all_consistent(shape) :-
    consistent(s5, shape),
    (indep(s7), consistent(s7, shape) ; \+indep(s7)).

evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

0.88::acc(s18, shape_taper_detail).

% @attr shape_taper_detail
% @type categorical
% @canonical false
% @original_name shape (taper detail)
% @values slight_taper_2_20mm=Tail_slightly_tapered_2_20mm unk_shape_taper_detail=Unknown
% @importance 0.70

0.85::true_val(shape_taper_detail, slight_taper_2_20mm); 0.15::true_val(shape_taper_detail, unk_shape_taper_detail).

measured(s18, shape_taper_detail, slight_taper_2_20mm).

all_consistent(shape_taper_detail) :-
    consistent(s18, shape_taper_detail).

evidence(all_consistent(shape_taper_detail)).
query(true_val(shape_taper_detail, slight_taper_2_20mm)).
query(true_val(shape_taper_detail, unk_shape_taper_detail)).

0.92::acc(s40, taper).
0.82::acc(s41, taper).

% @attr taper
% @type numeric
% @unit mm
% @canonical true
% @original_name taper
% @values v3=3.0 v4=4.0
% @importance 0.85

0.50::true_val(taper, v3); 0.50::true_val(taper, v4).

measured(s40, taper, v3).
measured(s41, taper, v4).

all_consistent(taper) :-
    consistent(s40, taper),
    consistent(s41, taper).

evidence(all_consistent(taper)).
query(true_val(taper, v3)).
query(true_val(taper, v4)).

0.95::acc(s5, camber_type).
0.80::acc(s34, camber_type).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values rock_out_camber=Rock_Out_Camber hybrid_camber=Hybrid_Camber
% @importance 0.95

0.65::true_val(camber_type, rock_out_camber); 0.35::true_val(camber_type, hybrid_camber).

measured(s5, camber_type, rock_out_camber).
measured(s34, camber_type, hybrid_camber).

all_consistent(camber_type) :-
    consistent(s5, camber_type),
    consistent(s34, camber_type).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, rock_out_camber)).
query(true_val(camber_type, hybrid_camber)).

0.93::acc(s5, camber_description).
0.85::acc(s9, camber_description).

% @attr camber_description
% @type categorical
% @canonical false
% @original_name camber_description
% @values flat_camber_rocker=Flat_between_bindings_camber_near_feet_rocker_tip_tail unk_camber_description=Unknown
% @importance 0.95

0.95::true_val(camber_description, flat_camber_rocker); 0.05::true_val(camber_description, unk_camber_description).

measured(s5, camber_description, flat_camber_rocker).
measured(s9, camber_description, flat_camber_rocker).

all_consistent(camber_description) :-
    consistent(s5, camber_description),
    (indep(s9), consistent(s9, camber_description) ; \+indep(s9)).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, flat_camber_rocker)).
query(true_val(camber_description, unk_camber_description)).

0.82::acc(s7, setback).
0.82::acc(s34, setback).

% @attr setback
% @type numeric
% @unit cm
% @canonical true
% @original_name setback
% @values v2_0=2.0 unk_setback=Unknown
% @importance 0.85

0.93::true_val(setback, v2_0); 0.07::true_val(setback, unk_setback).

measured(s7, setback, v2_0).
measured(s34, setback, v2_0).

all_consistent(setback) :-
    (indep(s7), consistent(s7, setback) ; \+indep(s7)),
    consistent(s34, setback).

evidence(all_consistent(setback)).
query(true_val(setback, v2_0)).
query(true_val(setback, unk_setback)).

0.95::acc(s5, sidecut_type).
0.85::acc(s9, sidecut_type).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values quadratic=Quadratic_Sidecut unk_sidecut_type=Unknown
% @importance 0.95

0.96::true_val(sidecut_type, quadratic); 0.04::true_val(sidecut_type, unk_sidecut_type).

measured(s5, sidecut_type, quadratic).
measured(s9, sidecut_type, quadratic).

all_consistent(sidecut_type) :-
    consistent(s5, sidecut_type),
    (indep(s9), consistent(s9, sidecut_type) ; \+indep(s9)).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, quadratic)).
query(true_val(sidecut_type, unk_sidecut_type)).

0.88::acc(s9, sidecut_type_description).

% @attr sidecut_type_description
% @type categorical
% @canonical false
% @original_name sidecut_type (description)
% @values elliptic_blend=Blend_of_elliptic_curves_easy_turn_initiation unk_sidecut_type_description=Unknown
% @importance 0.90

0.86::true_val(sidecut_type_description, elliptic_blend); 0.14::true_val(sidecut_type_description, unk_sidecut_type_description).

measured(s9, sidecut_type_description, elliptic_blend).

all_consistent(sidecut_type_description) :-
    (indep(s9), consistent(s9, sidecut_type_description) ; \+indep(s9)).

evidence(all_consistent(sidecut_type_description)).
query(true_val(sidecut_type_description, elliptic_blend)).
query(true_val(sidecut_type_description, unk_sidecut_type_description)).

0.78::acc(s31, flex_rating_10).
0.85::acc(s34, flex_rating_10).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v8=8.0 v7=7.0
% @importance 0.90

0.40::true_val(flex_rating_10, v8); 0.60::true_val(flex_rating_10, v7).

measured(s31, flex_rating_10, v8).
measured(s34, flex_rating_10, v7).

all_consistent(flex_rating_10) :-
    (indep(s31), consistent(s31, flex_rating_10) ; \+indep(s31)),
    consistent(s34, flex_rating_10).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v8)).
query(true_val(flex_rating_10, v7)).

0.75::acc(s31, flex_feel).
0.90::acc(s40, flex_feel).
0.82::acc(s42, flex_feel).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values stiff=Stiff medium_soft=Medium_bordering_medium_soft medium_stiff=Medium_stiff
% @importance 0.87

0.20::true_val(flex_feel, stiff); 0.45::true_val(flex_feel, medium_soft); 0.35::true_val(flex_feel, medium_stiff).

measured(s31, flex_feel, stiff).
measured(s40, flex_feel, medium_soft).
measured(s42, flex_feel, medium_stiff).

all_consistent(flex_feel) :-
    (indep(s31), consistent(s31, flex_feel) ; \+indep(s31)),
    consistent(s40, flex_feel),
    consistent(s42, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, stiff)).
query(true_val(flex_feel, medium_soft)).
query(true_val(flex_feel, medium_stiff)).

0.83::acc(s9, flex_rating_10_evo).

% @attr flex_rating_10_evo
% @type categorical
% @canonical false
% @original_name flex_rating_10_evo
% @values stiff_6_8=Stiff_evo_rates_6_8 unk_flex_rating_10_evo=Unknown
% @importance 0.90

0.83::true_val(flex_rating_10_evo, stiff_6_8); 0.17::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).

measured(s9, flex_rating_10_evo, stiff_6_8).

all_consistent(flex_rating_10_evo) :-
    (indep(s9), consistent(s9, flex_rating_10_evo) ; \+indep(s9)).

evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, stiff_6_8)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

0.88::acc(s40, flex_direction).

% @attr flex_direction
% @type categorical
% @canonical false
% @original_name flex_direction
% @values directional_flex=Directional_softer_nose_tail_stiffer_middle unk_flex_direction=Unknown
% @importance 0.95

0.86::true_val(flex_direction, directional_flex); 0.14::true_val(flex_direction, unk_flex_direction).

measured(s40, flex_direction, directional_flex).

all_consistent(flex_direction) :-
    consistent(s40, flex_direction).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional_flex)).
query(true_val(flex_direction, unk_flex_direction)).

0.78::acc(s43, flex_rating_5).

% @attr flex_rating_5
% @type numeric
% @unit /5
% @canonical true
% @original_name flex_rating_5
% @values v4=4.0 unk_flex_rating_5=Unknown
% @importance 0.70

0.75::true_val(flex_rating_5, v4); 0.25::true_val(flex_rating_5, unk_flex_rating_5).

measured(s43, flex_rating_5, v4).

all_consistent(flex_rating_5) :-
    (indep(s43), consistent(s43, flex_rating_5) ; \+indep(s43)).

evidence(all_consistent(flex_rating_5)).
query(true_val(flex_rating_5, v4)).
query(true_val(flex_rating_5, unk_flex_rating_5)).

0.93::acc(s5, core_material).
0.85::acc(s42, core_material).
0.83::acc(s9, core_material).
0.85::acc(s33, core_material).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values ghost_green_core=Ghost_Green_Core_paulownia_aspen aspen_slct=Aspen_SLCT_hand_selected
% @importance 0.90

0.50::true_val(core_material, ghost_green_core); 0.50::true_val(core_material, aspen_slct).

measured(s5, core_material, ghost_green_core).
measured(s42, core_material, ghost_green_core).
measured(s9, core_material, aspen_slct).
measured(s33, core_material, aspen_slct).

all_consistent(core_material) :-
    consistent(s5, core_material),
    consistent(s42, core_material),
    (indep(s9), consistent(s9, core_material) ; \+indep(s9)),
    (indep(s33), consistent(s33, core_material) ; \+indep(s33)).

evidence(all_consistent(core_material)).
query(true_val(core_material, ghost_green_core)).
query(true_val(core_material, aspen_slct)).

0.82::acc(s7, sustainability_certification).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values fsc_certified=FSC_certified unk_sustainability_certification=Unknown
% @importance 0.80

0.80::true_val(sustainability_certification, fsc_certified); 0.20::true_val(sustainability_certification, unk_sustainability_certification).

measured(s7, sustainability_certification, fsc_certified).

all_consistent(sustainability_certification) :-
    (indep(s7), consistent(s7, sustainability_certification) ; \+indep(s7)).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, fsc_certified)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

0.85::acc(s9, pop_construction).
0.78::acc(s43, pop_construction).

% @attr pop_construction
% @type categorical
% @canonical false
% @original_name pop
% @values popster_milled=Strategically_milled_insert_packs_natural_flex_pop unk_pop_construction=Unknown
% @importance 0.80

0.90::true_val(pop_construction, popster_milled); 0.10::true_val(pop_construction, unk_pop_construction).

measured(s9, pop_construction, popster_milled).
measured(s43, pop_construction, popster_milled).

all_consistent(pop_construction) :-
    (indep(s9), consistent(s9, pop_construction) ; \+indep(s9)),
    (indep(s43), consistent(s43, pop_construction) ; \+indep(s43)).

evidence(all_consistent(pop_construction)).
query(true_val(pop_construction, popster_milled)).
query(true_val(pop_construction, unk_pop_construction)).

0.78::acc(s31, laminate).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values biax_hd_glass=BiAx_HD_Glass_two_angle_fiberglass unk_laminate=Unknown
% @importance 0.90

0.78::true_val(laminate, biax_hd_glass); 0.22::true_val(laminate, unk_laminate).

measured(s31, laminate, biax_hd_glass).

all_consistent(laminate) :-
    (indep(s31), consistent(s31, laminate) ; \+indep(s31)).

evidence(all_consistent(laminate)).
query(true_val(laminate, biax_hd_glass)).
query(true_val(laminate, unk_laminate)).

0.95::acc(s5, laminate_bfx).
0.85::acc(s9, laminate_bfx).

% @attr laminate_bfx
% @type categorical
% @canonical false
% @original_name laminate (Basalt Booster / B/FX Stringer)
% @values basalt_bfx=Basalt_Booster_BFX_Stringer_fiberglass_basalt unk_laminate_bfx=Unknown
% @importance 0.95

0.96::true_val(laminate_bfx, basalt_bfx); 0.04::true_val(laminate_bfx, unk_laminate_bfx).

measured(s5, laminate_bfx, basalt_bfx).
measured(s9, laminate_bfx, basalt_bfx).

all_consistent(laminate_bfx) :-
    consistent(s5, laminate_bfx),
    (indep(s9), consistent(s9, laminate_bfx) ; \+indep(s9)).

evidence(all_consistent(laminate_bfx)).
query(true_val(laminate_bfx, basalt_bfx)).
query(true_val(laminate_bfx, unk_laminate_bfx)).

0.82::acc(s7, resin).
0.80::acc(s37, resin).

% @attr resin
% @type categorical
% @canonical true
% @original_name resin
% @values bio_resin_30pct=30pct_Bio_Based_Resin unk_resin=Unknown
% @importance 0.70

0.90::true_val(resin, bio_resin_30pct); 0.10::true_val(resin, unk_resin).

measured(s7, resin, bio_resin_30pct).
measured(s37, resin, bio_resin_30pct).

all_consistent(resin) :-
    (indep(s7), consistent(s7, resin) ; \+indep(s7)),
    (indep(s37), consistent(s37, resin) ; \+indep(s37)).

evidence(all_consistent(resin)).
query(true_val(resin, bio_resin_30pct)).
query(true_val(resin, unk_resin)).

0.82::acc(s8, topsheet).
0.80::acc(s37, topsheet).

% @attr topsheet
% @type categorical
% @canonical true
% @original_name topsheet
% @values abc_wrapper_olive=ABC_Wrapper_olive_wood_veneer_2027 unk_topsheet=Unknown
% @importance 0.73

0.90::true_val(topsheet, abc_wrapper_olive); 0.10::true_val(topsheet, unk_topsheet).

measured(s8, topsheet, abc_wrapper_olive).
measured(s37, topsheet, abc_wrapper_olive).

all_consistent(topsheet) :-
    (indep(s8), consistent(s8, topsheet) ; \+indep(s8)),
    (indep(s37), consistent(s37, topsheet) ; \+indep(s37)).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, abc_wrapper_olive)).
query(true_val(topsheet, unk_topsheet)).

0.82::acc(s41, topsheet_bio).

% @attr topsheet_bio
% @type categorical
% @canonical false
% @original_name topsheet (castor bean)
% @values castor_bean_bio=Castor_bean_based_bio_topsheet unk_topsheet_bio=Unknown
% @importance 0.75

0.80::true_val(topsheet_bio, castor_bean_bio); 0.20::true_val(topsheet_bio, unk_topsheet_bio).

measured(s41, topsheet_bio, castor_bean_bio).

all_consistent(topsheet_bio) :-
    consistent(s41, topsheet_bio).

evidence(all_consistent(topsheet_bio)).
query(true_val(topsheet_bio, castor_bean_bio)).
query(true_val(topsheet_bio, unk_topsheet_bio)).

0.93::acc(s5, sidewall_material).
0.80::acc(s7, sidewall_material).
0.80::acc(s37, sidewall_material).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values recycled_abs_100pct=100pct_recycled_ABS recycled_abs_66pct=66pct_recycled_ABS
% @importance 0.70

0.40::true_val(sidewall_material, recycled_abs_100pct); 0.60::true_val(sidewall_material, recycled_abs_66pct).

measured(s5, sidewall_material, recycled_abs_100pct).
measured(s7, sidewall_material, recycled_abs_66pct).
measured(s37, sidewall_material, recycled_abs_66pct).

all_consistent(sidewall_material) :-
    consistent(s5, sidewall_material),
    (indep(s7), consistent(s7, sidewall_material) ; \+indep(s7)),
    (indep(s37), consistent(s37, sidewall_material) ; \+indep(s37)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, recycled_abs_100pct)).
query(true_val(sidewall_material, recycled_abs_66pct)).

0.93::acc(s5, edge_technology).
0.80::acc(s37, edge_technology).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values recycled_aluminum_20pct=At_least_20pct_recycled_aluminum unk_edge_technology=Unknown
% @importance 0.80

0.93::true_val(edge_technology, recycled_aluminum_20pct); 0.07::true_val(edge_technology, unk_edge_technology).

measured(s5, edge_technology, recycled_aluminum_20pct).
measured(s37, edge_technology, recycled_aluminum_20pct).

all_consistent(edge_technology) :-
    consistent(s5, edge_technology),
    (indep(s37), consistent(s37, edge_technology) ; \+indep(s37)).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, recycled_aluminum_20pct)).
query(true_val(edge_technology, unk_edge_technology)).

0.93::acc(s5, base_material).
0.82::acc(s7, base_material).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values recycled_sintered_50pct=50pct_Recycled_Sintered_Base unk_base_material=Unknown
% @importance 0.90

0.95::true_val(base_material, recycled_sintered_50pct); 0.05::true_val(base_material, unk_base_material).

measured(s5, base_material, recycled_sintered_50pct).
measured(s7, base_material, recycled_sintered_50pct).

all_consistent(base_material) :-
    consistent(s5, base_material),
    (indep(s7), consistent(s7, base_material) ; \+indep(s7)).

evidence(all_consistent(base_material)).
query(true_val(base_material, recycled_sintered_50pct)).
query(true_val(base_material, unk_base_material)).

0.82::acc(s7, base_type).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values sintered=Sintered_hard_surface_good_wax_retention unk_base_type=Unknown
% @importance 0.80

0.80::true_val(base_type, sintered); 0.20::true_val(base_type, unk_base_type).

measured(s7, base_type, sintered).

all_consistent(base_type) :-
    (indep(s7), consistent(s7, base_type) ; \+indep(s7)).

evidence(all_consistent(base_type)).
query(true_val(base_type, sintered)).
query(true_val(base_type, unk_base_type)).

0.93::acc(s5, base_material_finish).

% @attr base_material_finish
% @type categorical
% @canonical false
% @original_name base_material (Fine Stone Finish)
% @values fine_stone_finish=Fine_Stone_Finish_sintered_EG unk_base_material_finish=Unknown
% @importance 1.0

0.94::true_val(base_material_finish, fine_stone_finish); 0.06::true_val(base_material_finish, unk_base_material_finish).

measured(s5, base_material_finish, fine_stone_finish).

all_consistent(base_material_finish) :-
    consistent(s5, base_material_finish).

evidence(all_consistent(base_material_finish)).
query(true_val(base_material_finish, fine_stone_finish)).
query(true_val(base_material_finish, unk_base_material_finish)).

0.80::acc(s7, base_graphics).

% @attr base_graphics
% @type categorical
% @canonical false
% @original_name Base graphics
% @values random=Random unk_base_graphics=Unknown
% @importance 0.80

0.78::true_val(base_graphics, random); 0.22::true_val(base_graphics, unk_base_graphics).

measured(s7, base_graphics, random).

all_consistent(base_graphics) :-
    (indep(s7), consistent(s7, base_graphics) ; \+indep(s7)).

evidence(all_consistent(base_graphics)).
query(true_val(base_graphics, random)).
query(true_val(base_graphics, unk_base_graphics)).

0.93::acc(s5, factory_wax).

% @attr factory_wax
% @type categorical
% @canonical false
% @original_name Factory wax
% @values natural_wax=Natural_Wax_paraffin_free_natural_ingredients unk_factory_wax=Unknown
% @importance 1.0

0.94::true_val(factory_wax, natural_wax); 0.06::true_val(factory_wax, unk_factory_wax).

measured(s5, factory_wax, natural_wax).

all_consistent(factory_wax) :-
    consistent(s5, factory_wax).

evidence(all_consistent(factory_wax)).
query(true_val(factory_wax, natural_wax)).
query(true_val(factory_wax, unk_factory_wax)).

0.78::acc(s31, edge_bevel_spec).

% @attr edge_bevel_spec
% @type categorical
% @canonical true
% @original_name edge_bevel_spec
% @values am_bevel_1_5deg=All_Mountain_1_5deg_base_and_side unk_edge_bevel_spec=Unknown
% @importance 0.90

0.78::true_val(edge_bevel_spec, am_bevel_1_5deg); 0.22::true_val(edge_bevel_spec, unk_edge_bevel_spec).

measured(s31, edge_bevel_spec, am_bevel_1_5deg).

all_consistent(edge_bevel_spec) :-
    (indep(s31), consistent(s31, edge_bevel_spec) ; \+indep(s31)).

evidence(all_consistent(edge_bevel_spec)).
query(true_val(edge_bevel_spec, am_bevel_1_5deg)).
query(true_val(edge_bevel_spec, unk_edge_bevel_spec)).

0.78::acc(s31, mounting_pattern).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 0.90

0.78::true_val(mounting_pattern, inserts_2x4); 0.22::true_val(mounting_pattern, unk_mounting_pattern).

measured(s31, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :-
    (indep(s31), consistent(s31, mounting_pattern) ; \+indep(s31)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

0.80::acc(s8, laminate_chatter).

% @attr laminate_chatter
% @type categorical
% @canonical false
% @original_name laminate (chatter absorption)
% @values chatter_absorption=Absorbs_chatter_rough_variable_snow_crud unk_laminate_chatter=Unknown
% @importance 0.85

0.78::true_val(laminate_chatter, chatter_absorption); 0.22::true_val(laminate_chatter, unk_laminate_chatter).

measured(s8, laminate_chatter, chatter_absorption).

all_consistent(laminate_chatter) :-
    (indep(s8), consistent(s8, laminate_chatter) ; \+indep(s8)).

evidence(all_consistent(laminate_chatter)).
query(true_val(laminate_chatter, chatter_absorption)).
query(true_val(laminate_chatter, unk_laminate_chatter)).

0.88::acc(s18, sustainability_bio_pct).

% @attr sustainability_bio_pct
% @type categorical
% @canonical false
% @original_name sustainability_certification (28% bio-based)
% @values bio_28pct=28pct_bio_based_sidewalls_resin_core unk_sustainability_bio_pct=Unknown
% @importance 0.70

0.85::true_val(sustainability_bio_pct, bio_28pct); 0.15::true_val(sustainability_bio_pct, unk_sustainability_bio_pct).

measured(s18, sustainability_bio_pct, bio_28pct).

all_consistent(sustainability_bio_pct) :-
    consistent(s18, sustainability_bio_pct).

evidence(all_consistent(sustainability_bio_pct)).
query(true_val(sustainability_bio_pct, bio_28pct)).
query(true_val(sustainability_bio_pct, unk_sustainability_bio_pct)).

0.82::acc(s7, sustainability_comprehensive).
0.80::acc(s37, sustainability_comprehensive).

% @attr sustainability_comprehensive
% @type categorical
% @canonical false
% @original_name sustainability_certification (comprehensive)
% @values full_eco_package=Bio_topsheet_resin_FSC_core_recycled_base_edges_sidewalls unk_sustainability_comprehensive=Unknown
% @importance 0.70

0.90::true_val(sustainability_comprehensive, full_eco_package); 0.10::true_val(sustainability_comprehensive, unk_sustainability_comprehensive).

measured(s7, sustainability_comprehensive, full_eco_package).
measured(s37, sustainability_comprehensive, full_eco_package).

all_consistent(sustainability_comprehensive) :-
    (indep(s7), consistent(s7, sustainability_comprehensive) ; \+indep(s7)),
    (indep(s37), consistent(s37, sustainability_comprehensive) ; \+indep(s37)).

evidence(all_consistent(sustainability_comprehensive)).
query(true_val(sustainability_comprehensive, full_eco_package)).
query(true_val(sustainability_comprehensive, unk_sustainability_comprehensive)).

0.78::acc(s31, width_options).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 0.90

0.78::true_val(width_options, standard_and_wide); 0.22::true_val(width_options, unk_width_options).

measured(s31, width_options, standard_and_wide).

all_consistent(width_options) :-
    (indep(s31), consistent(s31, width_options) ; \+indep(s31)).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

0.78::acc(s31, available_sizes).
0.82::acc(s34, available_sizes).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values sizes_4=156_159_159W_162W sizes_9=146_150_153_156_159_162_159W_162W_165W
% @importance 0.90

0.35::true_val(available_sizes, sizes_4); 0.65::true_val(available_sizes, sizes_9).

measured(s31, available_sizes, sizes_4).
measured(s34, available_sizes, sizes_9).

all_consistent(available_sizes) :-
    (indep(s31), consistent(s31, available_sizes) ; \+indep(s31)),
    consistent(s34, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, sizes_4)).
query(true_val(available_sizes, sizes_9)).

0.82::acc(s31, waist_width_156).

% @attr waist_width_156
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 156cm
% @values v25_5=25.5 unk_waist_width_156=Unknown
% @importance 0.90

0.80::true_val(waist_width_156, v25_5); 0.20::true_val(waist_width_156, unk_waist_width_156).

measured(s31, waist_width_156, v25_5).

all_consistent(waist_width_156) :-
    (indep(s31), consistent(s31, waist_width_156) ; \+indep(s31)).

evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v25_5)).
query(true_val(waist_width_156, unk_waist_width_156)).

0.82::acc(s31, waist_width_159).

% @attr waist_width_159
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 159cm
% @values v25_7=25.7 unk_waist_width_159=Unknown
% @importance 0.90

0.80::true_val(waist_width_159, v25_7); 0.20::true_val(waist_width_159, unk_waist_width_159).

measured(s31, waist_width_159, v25_7).

all_consistent(waist_width_159) :-
    (indep(s31), consistent(s31, waist_width_159) ; \+indep(s31)).

evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v25_7)).
query(true_val(waist_width_159, unk_waist_width_159)).

0.82::acc(s31, waist_width_159w).

% @attr waist_width_159w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 159cm Wide
% @values v26_5=26.5 unk_waist_width_159w=Unknown
% @importance 0.90

0.80::true_val(waist_width_159w, v26_5); 0.20::true_val(waist_width_159w, unk_waist_width_159w).

measured(s31, waist_width_159w, v26_5).

all_consistent(waist_width_159w) :-
    (indep(s31), consistent(s31, waist_width_159w) ; \+indep(s31)).

evidence(all_consistent(waist_width_159w)).
query(true_val(waist_width_159w, v26_5)).
query(true_val(waist_width_159w, unk_waist_width_159w)).

0.82::acc(s31, waist_width_162w).

% @attr waist_width_162w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 162cm Wide
% @values v26_7=26.7 unk_waist_width_162w=Unknown
% @importance 0.90

0.80::true_val(waist_width_162w, v26_7); 0.20::true_val(waist_width_162w, unk_waist_width_162w).

measured(s31, waist_width_162w, v26_7).

all_consistent(waist_width_162w) :-
    (indep(s31), consistent(s31, waist_width_162w) ; \+indep(s31)).

evidence(all_consistent(waist_width_162w)).
query(true_val(waist_width_162w, v26_7)).
query(true_val(waist_width_162w, unk_waist_width_162w)).

0.82::acc(s31, effective_edge_156).

% @attr effective_edge_156
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 156cm
% @values v118_5=118.5 unk_effective_edge_156=Unknown
% @importance 0.90

0.80::true_val(effective_edge_156, v118_5); 0.20::true_val(effective_edge_156, unk_effective_edge_156).

measured(s31, effective_edge_156, v118_5).

all_consistent(effective_edge_156) :-
    (indep(s31), consistent(s31, effective_edge_156) ; \+indep(s31)).

evidence(all_consistent(effective_edge_156)).
query(true_val(effective_edge_156, v118_5)).
query(true_val(effective_edge_156, unk_effective_edge_156)).

0.82::acc(s31, effective_edge_159).

% @attr effective_edge_159
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 159cm
% @values v121_0=121.0 unk_effective_edge_159=Unknown
% @importance 0.90

0.80::true_val(effective_edge_159, v121_0); 0.20::true_val(effective_edge_159, unk_effective_edge_159).

measured(s31, effective_edge_159, v121_0).

all_consistent(effective_edge_159) :-
    (indep(s31), consistent(s31, effective_edge_159) ; \+indep(s31)).

evidence(all_consistent(effective_edge_159)).
query(true_val(effective_edge_159, v121_0)).
query(true_val(effective_edge_159, unk_effective_edge_159)).

0.82::acc(s31, sidecut_radius_size).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size
% @values v7_3=7.3 unk_sidecut_radius_size=Unknown
% @importance 0.90

0.80::true_val(sidecut_radius_size, v7_3); 0.20::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s31, sidecut_radius_size, v7_3).

all_consistent(sidecut_radius_size) :-
    (indep(s31), consistent(s31, sidecut_radius_size) ; \+indep(s31)).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_3)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

0.82::acc(s31, sidecut_radius_size_159).

% @attr sidecut_radius_size_159
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (159cm)
% @values v7_7=7.7 unk_sidecut_radius_size_159=Unknown
% @importance 0.90

0.80::true_val(sidecut_radius_size_159, v7_7); 0.20::true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159).

measured(s31, sidecut_radius_size_159, v7_7).

all_consistent(sidecut_radius_size_159) :-
    (indep(s31), consistent(s31, sidecut_radius_size_159) ; \+indep(s31)).

evidence(all_consistent(sidecut_radius_size_159)).
query(true_val(sidecut_radius_size_159, v7_7)).
query(true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159)).

0.82::acc(s31, recommended_weight_range_size).
0.82::acc(s34, recommended_weight_range_size).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size
% @values w60_95=60_95kg unk_recommended_weight_range_size=Unknown
% @importance 0.90

0.93::true_val(recommended_weight_range_size, w60_95); 0.07::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s31, recommended_weight_range_size, w60_95).
measured(s34, recommended_weight_range_size, w60_95).

all_consistent(recommended_weight_range_size) :-
    (indep(s31), consistent(s31, recommended_weight_range_size) ; \+indep(s31)),
    consistent(s34, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w60_95)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

0.82::acc(s31, recommended_weight_range_size_159).
0.82::acc(s34, recommended_weight_range_size_159).

% @attr recommended_weight_range_size_159
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (159cm)
% @values w70_100=70_100kg unk_recommended_weight_range_size_159=Unknown
% @importance 0.90

0.93::true_val(recommended_weight_range_size_159, w70_100); 0.07::true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159).

measured(s31, recommended_weight_range_size_159, w70_100).
measured(s34, recommended_weight_range_size_159, w70_100).

all_consistent(recommended_weight_range_size_159) :-
    (indep(s31), consistent(s31, recommended_weight_range_size_159) ; \+indep(s31)),
    consistent(s34, recommended_weight_range_size_159).

evidence(all_consistent(recommended_weight_range_size_159)).
query(true_val(recommended_weight_range_size_159, w70_100)).
query(true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159)).

0.82::acc(s31, stance_width_range_size).

% @attr stance_width_range_size
% @type numeric
% @unit cm
% @canonical true
% @original_name stance_width_range_size
% @values v56_0=56.0 unk_stance_width_range_size=Unknown
% @importance 0.90

0.80::true_val(stance_width_range_size, v56_0); 0.20::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s31, stance_width_range_size, v56_0).

all_consistent(stance_width_range_size) :-
    (indep(s31), consistent(s31, stance_width_range_size) ; \+indep(s31)).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v56_0)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

0.82::acc(s31, stance_width_range_size_159).

% @attr stance_width_range_size_159
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size (159cm)
% @values v57_0=57.0 unk_stance_width_range_size_159=Unknown
% @importance 0.90

0.80::true_val(stance_width_range_size_159, v57_0); 0.20::true_val(stance_width_range_size_159, unk_stance_width_range_size_159).

measured(s31, stance_width_range_size_159, v57_0).

all_consistent(stance_width_range_size_159) :-
    (indep(s31), consistent(s31, stance_width_range_size_159) ; \+indep(s31)).

evidence(all_consistent(stance_width_range_size_159)).
query(true_val(stance_width_range_size_159, v57_0)).
query(true_val(stance_width_range_size_159, unk_stance_width_range_size_159)).

0.82::acc(s31, tip_tail_width_size).

% @attr tip_tail_width_size
% @type categorical
% @unit cm
% @canonical true
% @original_name tip_tail_width_size
% @values w30_1_29_8=30_1_29_8cm unk_tip_tail_width_size=Unknown
% @importance 0.90

0.80::true_val(tip_tail_width_size, w30_1_29_8); 0.20::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s31, tip_tail_width_size, w30_1_29_8).

all_consistent(tip_tail_width_size) :-
    (indep(s31), consistent(s31, tip_tail_width_size) ; \+indep(s31)).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, w30_1_29_8)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

0.82::acc(s31, tip_tail_width_size_159).

% @attr tip_tail_width_size_159
% @type categorical
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (159cm)
% @values w30_4_30_1=30_4_30_1cm unk_tip_tail_width_size_159=Unknown
% @importance 0.90

0.80::true_val(tip_tail_width_size_159, w30_4_30_1); 0.20::true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159).

measured(s31, tip_tail_width_size_159, w30_4_30_1).

all_consistent(tip_tail_width_size_159) :-
    (indep(s31), consistent(s31, tip_tail_width_size_159) ; \+indep(s31)).

evidence(all_consistent(tip_tail_width_size_159)).
query(true_val(tip_tail_width_size_159, w30_4_30_1)).
query(true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159)).

0.85::acc(s40, boot_size_rec_146).

% @attr boot_size_rec_146
% @type categorical
% @canonical false
% @original_name Boot size recommendation 146cm
% @values us6_7=US_6_7 unk_boot_size_rec_146=Unknown
% @importance 0.95

0.83::true_val(boot_size_rec_146, us6_7); 0.17::true_val(boot_size_rec_146, unk_boot_size_rec_146).

measured(s40, boot_size_rec_146, us6_7).

all_consistent(boot_size_rec_146) :-
    consistent(s40, boot_size_rec_146).

evidence(all_consistent(boot_size_rec_146)).
query(true_val(boot_size_rec_146, us6_7)).
query(true_val(boot_size_rec_146, unk_boot_size_rec_146)).

0.85::acc(s40, boot_size_rec_150).

% @attr boot_size_rec_150
% @type categorical
% @canonical false
% @original_name Boot size recommendation 150cm
% @values us7_8=US_7_8 unk_boot_size_rec_150=Unknown
% @importance 0.95

0.83::true_val(boot_size_rec_150, us7_8); 0.17::true_val(boot_size_rec_150, unk_boot_size_rec_150).

measured(s40, boot_size_rec_150, us7_8).

all_consistent(boot_size_rec_150) :-
    consistent(s40, boot_size_rec_150).

evidence(all_consistent(boot_size_rec_150)).
query(true_val(boot_size_rec_150, us7_8)).
query(true_val(boot_size_rec_150, unk_boot_size_rec_150)).

0.85::acc(s40, boot_size_rec_153).

% @attr boot_size_rec_153
% @type categorical
% @canonical false
% @original_name Boot size recommendation 153cm
% @values us8_5_9=US_8_5_9 unk_boot_size_rec_153=Unknown
% @importance 0.95

0.83::true_val(boot_size_rec_153, us8_5_9); 0.17::true_val(boot_size_rec_153, unk_boot_size_rec_153).

measured(s40, boot_size_rec_153, us8_5_9).

all_consistent(boot_size_rec_153) :-
    consistent(s40, boot_size_rec_153).

evidence(all_consistent(boot_size_rec_153)).
query(true_val(boot_size_rec_153, us8_5_9)).
query(true_val(boot_size_rec_153, unk_boot_size_rec_153)).

0.85::acc(s40, boot_size_rec_156).

% @attr boot_size_rec_156
% @type categorical
% @canonical false
% @original_name Boot size recommendation 156cm
% @values us9_9_5=US_9_9_5 unk_boot_size_rec_156=Unknown
% @importance 0.95

0.83::true_val(boot_size_rec_156, us9_9_5); 0.17::true_val(boot_size_rec_156, unk_boot_size_rec_156).

measured(s40, boot_size_rec_156, us9_9_5).

all_consistent(boot_size_rec_156) :-
    consistent(s40, boot_size_rec_156).

evidence(all_consistent(boot_size_rec_156)).
query(true_val(boot_size_rec_156, us9_9_5)).
query(true_val(boot_size_rec_156, unk_boot_size_rec_156)).

0.85::acc(s40, boot_size_rec_159).

% @attr boot_size_rec_159
% @type categorical
% @canonical false
% @original_name Boot size recommendation 159cm
% @values us9_5_10_5=US_9_5_10_5 unk_boot_size_rec_159=Unknown
% @importance 0.95

0.83::true_val(boot_size_rec_159, us9_5_10_5); 0.17::true_val(boot_size_rec_159, unk_boot_size_rec_159).

measured(s40, boot_size_rec_159, us9_5_10_5).

all_consistent(boot_size_rec_159) :-
    consistent(s40, boot_size_rec_159).

evidence(all_consistent(boot_size_rec_159)).
query(true_val(boot_size_rec_159, us9_5_10_5)).
query(true_val(boot_size_rec_159, unk_boot_size_rec_159)).

0.85::acc(s40, boot_size_rec_159w).

% @attr boot_size_rec_159w
% @type categorical
% @canonical false
% @original_name Boot size recommendation 159W
% @values us10_5_11_5=US_10_5_11_5 unk_boot_size_rec_159w=Unknown
% @importance 0.95

0.83::true_val(boot_size_rec_159w, us10_5_11_5); 0.17::true_val(boot_size_rec_159w, unk_boot_size_rec_159w).

measured(s40, boot_size_rec_159w, us10_5_11_5).

all_consistent(boot_size_rec_159w) :-
    consistent(s40, boot_size_rec_159w).

evidence(all_consistent(boot_size_rec_159w)).
query(true_val(boot_size_rec_159w, us10_5_11_5)).
query(true_val(boot_size_rec_159w, unk_boot_size_rec_159w)).

0.85::acc(s40, boot_size_rec_162w).

% @attr boot_size_rec_162w
% @type categorical
% @canonical false
% @original_name Boot size recommendation 162W
% @values us11_12=US_11_12 unk_boot_size_rec_162w=Unknown
% @importance 0.95

0.83::true_val(boot_size_rec_162w, us11_12); 0.17::true_val(boot_size_rec_162w, unk_boot_size_rec_162w).

measured(s40, boot_size_rec_162w, us11_12).

all_consistent(boot_size_rec_162w) :-
    consistent(s40, boot_size_rec_162w).

evidence(all_consistent(boot_size_rec_162w)).
query(true_val(boot_size_rec_162w, us11_12)).
query(true_val(boot_size_rec_162w, unk_boot_size_rec_162w)).

0.85::acc(s40, recommended_boot_size_165).

% @attr recommended_boot_size_165
% @type categorical
% @canonical true
% @original_name recommended_boot_size_165
% @values us12_13=US_12_13 unk_recommended_boot_size_165=Unknown
% @importance 0.95

0.83::true_val(recommended_boot_size_165, us12_13); 0.17::true_val(recommended_boot_size_165, unk_recommended_boot_size_165).

measured(s40, recommended_boot_size_165, us12_13).

all_consistent(recommended_boot_size_165) :-
    consistent(s40, recommended_boot_size_165).

evidence(all_consistent(recommended_boot_size_165)).
query(true_val(recommended_boot_size_165, us12_13)).
query(true_val(recommended_boot_size_165, unk_recommended_boot_size_165)).

0.78::acc(s31, skill_level_recommendation).
0.85::acc(s9, skill_level_recommendation).
0.82::acc(s34, skill_level_recommendation).
0.72::acc(s44, skill_level_recommendation).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values advanced=Advanced advanced_expert=Advanced_Expert intermediate_advanced=Intermediate_to_Advanced_Expert intermediate_expert=Intermediate_to_Expert
% @importance 0.80

0.20::true_val(skill_level_recommendation, advanced); 0.35::true_val(skill_level_recommendation, advanced_expert); 0.25::true_val(skill_level_recommendation, intermediate_advanced); 0.20::true_val(skill_level_recommendation, intermediate_expert).

measured(s31, skill_level_recommendation, advanced).
measured(s9, skill_level_recommendation, advanced_expert).
measured(s34, skill_level_recommendation, intermediate_advanced).
measured(s44, skill_level_recommendation, intermediate_expert).

all_consistent(skill_level_recommendation) :-
    (indep(s31), consistent(s31, skill_level_recommendation) ; \+indep(s31)),
    (indep(s9), consistent(s9, skill_level_recommendation) ; \+indep(s9)),
    consistent(s34, skill_level_recommendation),
    (indep(s44), consistent(s44, skill_level_recommendation) ; \+indep(s44)).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, advanced)).
query(true_val(skill_level_recommendation, advanced_expert)).
query(true_val(skill_level_recommendation, intermediate_advanced)).
query(true_val(skill_level_recommendation, intermediate_expert)).

0.82::acc(s34, skill_level_recommendation_profile).

% @attr skill_level_recommendation_profile
% @type categorical
% @canonical false
% @original_name skill_level_recommendation (rider profile)
% @values carve_powder_chatter=Carve_powder_minimize_chatter unk_skill_level_recommendation_profile=Unknown
% @importance 0.90

0.82::true_val(skill_level_recommendation_profile, carve_powder_chatter); 0.18::true_val(skill_level_recommendation_profile, unk_skill_level_recommendation_profile).

measured(s34, skill_level_recommendation_profile, carve_powder_chatter).

all_consistent(skill_level_recommendation_profile) :-
    consistent(s34, skill_level_recommendation_profile).

evidence(all_consistent(skill_level_recommendation_profile)).
query(true_val(skill_level_recommendation_profile, carve_powder_chatter)).
query(true_val(skill_level_recommendation_profile, unk_skill_level_recommendation_profile)).

0.88::acc(s26, riding_style).
0.85::acc(s36, riding_style).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values all_mountain_freeride_daily=All_mountain_freeride_daily_driver unk_riding_style=Unknown
% @importance 0.78

0.92::true_val(riding_style, all_mountain_freeride_daily); 0.08::true_val(riding_style, unk_riding_style).

measured(s26, riding_style, all_mountain_freeride_daily).
measured(s36, riding_style, all_mountain_freeride_daily).

all_consistent(riding_style) :-
    consistent(s26, riding_style),
    consistent(s36, riding_style).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, all_mountain_freeride_daily)).
query(true_val(riding_style, unk_riding_style)).

0.93::acc(s5, terrain_suitability).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values backcountry_frontside=Backcountry_to_frontside_side_hits_wind_lips unk_terrain_suitability=Unknown
% @importance 1.0

0.94::true_val(terrain_suitability, backcountry_frontside); 0.06::true_val(terrain_suitability, unk_terrain_suitability).

measured(s5, terrain_suitability, backcountry_frontside).

all_consistent(terrain_suitability) :-
    consistent(s5, terrain_suitability).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, backcountry_frontside)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

0.88::acc(s40, terrain_suitability_quiver).

% @attr terrain_suitability_quiver
% @type categorical
% @canonical false
% @original_name terrain_suitability (quiver potential)
% @values one_board_quiver=One_board_quiver_speed_carving_powder unk_terrain_suitability_quiver=Unknown
% @importance 0.95

0.86::true_val(terrain_suitability_quiver, one_board_quiver); 0.14::true_val(terrain_suitability_quiver, unk_terrain_suitability_quiver).

measured(s40, terrain_suitability_quiver, one_board_quiver).

all_consistent(terrain_suitability_quiver) :-
    consistent(s40, terrain_suitability_quiver).

evidence(all_consistent(terrain_suitability_quiver)).
query(true_val(terrain_suitability_quiver, one_board_quiver)).
query(true_val(terrain_suitability_quiver, unk_terrain_suitability_quiver)).

0.82::acc(s34, positive_aspect_carving).

% @attr positive_aspect_carving
% @type categorical
% @canonical false
% @original_name positive_aspect (carving at speed)
% @values locked_in_carve=Good_locked_in_holds_carve_at_high_speeds unk_positive_aspect_carving=Unknown
% @importance 0.90

0.82::true_val(positive_aspect_carving, locked_in_carve); 0.18::true_val(positive_aspect_carving, unk_positive_aspect_carving).

measured(s34, positive_aspect_carving, locked_in_carve).

all_consistent(positive_aspect_carving) :-
    consistent(s34, positive_aspect_carving).

evidence(all_consistent(positive_aspect_carving)).
query(true_val(positive_aspect_carving, locked_in_carve)).
query(true_val(positive_aspect_carving, unk_positive_aspect_carving)).

0.88::acc(s40, positive_aspect_grip).

% @attr positive_aspect_grip
% @type categorical
% @canonical false
% @original_name positive_aspect (grip)
% @values impressive_grip=Impressive_grip_hard_snow_quadratic_holds unk_positive_aspect_grip=Unknown
% @importance 0.95

0.86::true_val(positive_aspect_grip, impressive_grip); 0.14::true_val(positive_aspect_grip, unk_positive_aspect_grip).

measured(s40, positive_aspect_grip, impressive_grip).

all_consistent(positive_aspect_grip) :-
    consistent(s40, positive_aspect_grip).

evidence(all_consistent(positive_aspect_grip)).
query(true_val(positive_aspect_grip, impressive_grip)).
query(true_val(positive_aspect_grip, unk_positive_aspect_grip)).

0.88::acc(s40, positive_aspect).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values versatile_float_groomers=Very_versatile_decent_directional_float_good_groomers unk_positive_aspect=Unknown
% @importance 0.95

0.86::true_val(positive_aspect, versatile_float_groomers); 0.14::true_val(positive_aspect, unk_positive_aspect).

measured(s40, positive_aspect, versatile_float_groomers).

all_consistent(positive_aspect) :-
    consistent(s40, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, versatile_float_groomers)).
query(true_val(positive_aspect, unk_positive_aspect)).

0.88::acc(s40, positive_aspect_pop).

% @attr positive_aspect_pop
% @type categorical
% @canonical false
% @original_name positive_aspect (pop)
% @values easy_pop_ollies=Easy_accessible_pop_good_for_ollies unk_positive_aspect_pop=Unknown
% @importance 0.95

0.86::true_val(positive_aspect_pop, easy_pop_ollies); 0.14::true_val(positive_aspect_pop, unk_positive_aspect_pop).

measured(s40, positive_aspect_pop, easy_pop_ollies).

all_consistent(positive_aspect_pop) :-
    consistent(s40, positive_aspect_pop).

evidence(all_consistent(positive_aspect_pop)).
query(true_val(positive_aspect_pop, easy_pop_ollies)).
query(true_val(positive_aspect_pop, unk_positive_aspect_pop)).

0.88::acc(s40, positive_aspect_butter).

% @attr positive_aspect_butter
% @type categorical
% @canonical false
% @original_name positive_aspect (butter)
% @values semi_easy_butter=Semi_easy_to_butter_despite_stiff unk_positive_aspect_butter=Unknown
% @importance 0.95

0.86::true_val(positive_aspect_butter, semi_easy_butter); 0.14::true_val(positive_aspect_butter, unk_positive_aspect_butter).

measured(s40, positive_aspect_butter, semi_easy_butter).

all_consistent(positive_aspect_butter) :-
    consistent(s40, positive_aspect_butter).

evidence(all_consistent(positive_aspect_butter)).
query(true_val(positive_aspect_butter, semi_easy_butter)).
query(true_val(positive_aspect_butter, unk_positive_aspect_butter)).

0.88::acc(s36, positive_aspect_comfort).

% @attr positive_aspect_comfort
% @type categorical
% @canonical false
% @original_name positive_aspect (comfort)
% @values comfortable_easy=Comfortable_easy_ride_berms_to_big_mountain unk_positive_aspect_comfort=Unknown
% @importance 0.80

0.86::true_val(positive_aspect_comfort, comfortable_easy); 0.14::true_val(positive_aspect_comfort, unk_positive_aspect_comfort).

measured(s36, positive_aspect_comfort, comfortable_easy).

all_consistent(positive_aspect_comfort) :-
    consistent(s36, positive_aspect_comfort).

evidence(all_consistent(positive_aspect_comfort)).
query(true_val(positive_aspect_comfort, comfortable_easy)).
query(true_val(positive_aspect_comfort, unk_positive_aspect_comfort)).

0.88::acc(s40, positive_aspect_smooth).

% @attr positive_aspect_smooth
% @type categorical
% @canonical false
% @original_name positive_aspect (smooth in hard snow)
% @values not_cranky_hard_snow=No_crankiness_in_hard_micro_bumpy_snow unk_positive_aspect_smooth=Unknown
% @importance 0.95

0.86::true_val(positive_aspect_smooth, not_cranky_hard_snow); 0.14::true_val(positive_aspect_smooth, unk_positive_aspect_smooth).

measured(s40, positive_aspect_smooth, not_cranky_hard_snow).

all_consistent(positive_aspect_smooth) :-
    consistent(s40, positive_aspect_smooth).

evidence(all_consistent(positive_aspect_smooth)).
query(true_val(positive_aspect_smooth, not_cranky_hard_snow)).
query(true_val(positive_aspect_smooth, unk_positive_aspect_smooth)).

0.82::acc(s41, positive_aspect_light).

% @attr positive_aspect_light
% @type categorical
% @canonical false
% @original_name positive_aspect (lightweight)
% @values very_lightweight=Very_lightweight_Ghost_Green_Core unk_positive_aspect_light=Unknown
% @importance 0.75

0.80::true_val(positive_aspect_light, very_lightweight); 0.20::true_val(positive_aspect_light, unk_positive_aspect_light).

measured(s41, positive_aspect_light, very_lightweight).

all_consistent(positive_aspect_light) :-
    consistent(s41, positive_aspect_light).

evidence(all_consistent(positive_aspect_light)).
query(true_val(positive_aspect_light, very_lightweight)).
query(true_val(positive_aspect_light, unk_positive_aspect_light)).

0.80::acc(s42, positive_aspect_stable).

% @attr positive_aspect_stable
% @type categorical
% @canonical false
% @original_name positive_aspect (stable damp)
% @values stable_damp_locked=Stable_damp_locked_in_carving_reduced_chatter unk_positive_aspect_stable=Unknown
% @importance 0.80

0.78::true_val(positive_aspect_stable, stable_damp_locked); 0.22::true_val(positive_aspect_stable, unk_positive_aspect_stable).

measured(s42, positive_aspect_stable, stable_damp_locked).

all_consistent(positive_aspect_stable) :-
    consistent(s42, positive_aspect_stable).

evidence(all_consistent(positive_aspect_stable)).
query(true_val(positive_aspect_stable, stable_damp_locked)).
query(true_val(positive_aspect_stable, unk_positive_aspect_stable)).

0.88::acc(s40, positive_aspect_switch).

% @attr positive_aspect_switch
% @type categorical
% @canonical false
% @original_name positive_aspect (switch riding)
% @values rides_switch_well=Rides_switch_very_well_for_directional unk_positive_aspect_switch=Unknown
% @importance 0.95

0.86::true_val(positive_aspect_switch, rides_switch_well); 0.14::true_val(positive_aspect_switch, unk_positive_aspect_switch).

measured(s40, positive_aspect_switch, rides_switch_well).

all_consistent(positive_aspect_switch) :-
    consistent(s40, positive_aspect_switch).

evidence(all_consistent(positive_aspect_switch)).
query(true_val(positive_aspect_switch, rides_switch_well)).
query(true_val(positive_aspect_switch, unk_positive_aspect_switch)).

0.88::acc(s40, positive_aspect_glide).

% @attr positive_aspect_glide
% @type categorical
% @canonical false
% @original_name positive_aspect (base glide)
% @values good_base_glide=Good_base_glide_good_structure unk_positive_aspect_glide=Unknown
% @importance 0.95

0.86::true_val(positive_aspect_glide, good_base_glide); 0.14::true_val(positive_aspect_glide, unk_positive_aspect_glide).

measured(s40, positive_aspect_glide, good_base_glide).

all_consistent(positive_aspect_glide) :-
    consistent(s40, positive_aspect_glide).

evidence(all_consistent(positive_aspect_glide)).
query(true_val(positive_aspect_glide, good_base_glide)).
query(true_val(positive_aspect_glide, unk_positive_aspect_glide)).

0.82::acc(s41, positive_aspect_sustainable).

% @attr positive_aspect_sustainable
% @type categorical
% @canonical false
% @original_name positive_aspect (sustainability)
% @values most_sustainable_salomon=Most_sustainable_Salomon_construction unk_positive_aspect_sustainable=Unknown
% @importance 0.75

0.80::true_val(positive_aspect_sustainable, most_sustainable_salomon); 0.20::true_val(positive_aspect_sustainable, unk_positive_aspect_sustainable).

measured(s41, positive_aspect_sustainable, most_sustainable_salomon).

all_consistent(positive_aspect_sustainable) :-
    consistent(s41, positive_aspect_sustainable).

evidence(all_consistent(positive_aspect_sustainable)).
query(true_val(positive_aspect_sustainable, most_sustainable_salomon)).
query(true_val(positive_aspect_sustainable, unk_positive_aspect_sustainable)).

0.88::acc(s30, positive_aspect_award).

% @attr positive_aspect_award
% @type categorical
% @canonical false
% @original_name positive_aspect (Platinum Pick)
% @values platinum_pick_blend=Platinum_Pick_perfect_stiffness_stability_soft_playful unk_positive_aspect_award=Unknown
% @importance 0.60

0.86::true_val(positive_aspect_award, platinum_pick_blend); 0.14::true_val(positive_aspect_award, unk_positive_aspect_award).

measured(s30, positive_aspect_award, platinum_pick_blend).

all_consistent(positive_aspect_award) :-
    consistent(s30, positive_aspect_award).

evidence(all_consistent(positive_aspect_award)).
query(true_val(positive_aspect_award, platinum_pick_blend)).
query(true_val(positive_aspect_award, unk_positive_aspect_award)).

0.88::acc(s40, negative_aspect).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values not_dampest=Not_dampest_bucks_bounces_soft_uneven_spring unk_negative_aspect=Unknown
% @importance 0.95

0.86::true_val(negative_aspect, not_dampest); 0.14::true_val(negative_aspect, unk_negative_aspect).

measured(s40, negative_aspect, not_dampest).

all_consistent(negative_aspect) :-
    consistent(s40, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, not_dampest)).
query(true_val(negative_aspect, unk_negative_aspect)).

0.88::acc(s40, negative_aspect_speed).

% @attr negative_aspect_speed
% @type categorical
% @canonical false
% @original_name negative_aspect (speed)
% @values not_speed_specialist=Not_speed_specialist_does_alright unk_negative_aspect_speed=Unknown
% @importance 0.95

0.86::true_val(negative_aspect_speed, not_speed_specialist); 0.14::true_val(negative_aspect_speed, unk_negative_aspect_speed).

measured(s40, negative_aspect_speed, not_speed_specialist).

all_consistent(negative_aspect_speed) :-
    consistent(s40, negative_aspect_speed).

evidence(all_consistent(negative_aspect_speed)).
query(true_val(negative_aspect_speed, not_speed_specialist)).
query(true_val(negative_aspect_speed, unk_negative_aspect_speed)).

0.88::acc(s40, negative_aspect_carving).

% @attr negative_aspect_carving
% @type categorical
% @canonical false
% @original_name negative_aspect (carving)
% @values not_carving_specialist=Not_true_carving_specialist_little_too_soft unk_negative_aspect_carving=Unknown
% @importance 0.95

0.86::true_val(negative_aspect_carving, not_carving_specialist); 0.14::true_val(negative_aspect_carving, unk_negative_aspect_carving).

measured(s40, negative_aspect_carving, not_carving_specialist).

all_consistent(negative_aspect_carving) :-
    consistent(s40, negative_aspect_carving).

evidence(all_consistent(negative_aspect_carving)).
query(true_val(negative_aspect_carving, not_carving_specialist)).
query(true_val(negative_aspect_carving, unk_negative_aspect_carving)).

0.80::acc(s42, negative_aspect_moguls).

% @attr negative_aspect_moguls
% @type categorical
% @canonical false
% @original_name negative_aspect (moguls)
% @values stiff_moguls=Stiff_for_moguls_quick_turns_jarring unk_negative_aspect_moguls=Unknown
% @importance 0.80

0.78::true_val(negative_aspect_moguls, stiff_moguls); 0.22::true_val(negative_aspect_moguls, unk_negative_aspect_moguls).

measured(s42, negative_aspect_moguls, stiff_moguls).

all_consistent(negative_aspect_moguls) :-
    consistent(s42, negative_aspect_moguls).

evidence(all_consistent(negative_aspect_moguls)).
query(true_val(negative_aspect_moguls, stiff_moguls)).
query(true_val(negative_aspect_moguls, unk_negative_aspect_moguls)).

0.82::acc(s34, negative_aspect_jumps).

% @attr negative_aspect_jumps
% @type categorical
% @canonical false
% @original_name negative_aspect (jumps)
% @values ok_jumps_not_first=OK_jumps_not_first_choice_pop_takes_effort unk_negative_aspect_jumps=Unknown
% @importance 0.90

0.82::true_val(negative_aspect_jumps, ok_jumps_not_first); 0.18::true_val(negative_aspect_jumps, unk_negative_aspect_jumps).

measured(s34, negative_aspect_jumps, ok_jumps_not_first).

all_consistent(negative_aspect_jumps) :-
    consistent(s34, negative_aspect_jumps).

evidence(all_consistent(negative_aspect_jumps)).
query(true_val(negative_aspect_jumps, ok_jumps_not_first)).
query(true_val(negative_aspect_jumps, unk_negative_aspect_jumps)).

0.82::acc(s34, negative_aspect_slow_speed).

% @attr negative_aspect_slow_speed
% @type categorical
% @canonical false
% @original_name negative_aspect (slow speed)
% @values better_high_speed=Reasonably_nimble_slow_but_better_at_high_speeds unk_negative_aspect_slow_speed=Unknown
% @importance 0.90

0.82::true_val(negative_aspect_slow_speed, better_high_speed); 0.18::true_val(negative_aspect_slow_speed, unk_negative_aspect_slow_speed).

measured(s34, negative_aspect_slow_speed, better_high_speed).

all_consistent(negative_aspect_slow_speed) :-
    consistent(s34, negative_aspect_slow_speed).

evidence(all_consistent(negative_aspect_slow_speed)).
query(true_val(negative_aspect_slow_speed, better_high_speed)).
query(true_val(negative_aspect_slow_speed, unk_negative_aspect_slow_speed)).

0.85::acc(s36, negative_aspect_xxl).

% @attr negative_aspect_xxl
% @type categorical
% @canonical false
% @original_name negative_aspect (XXL features)
% @values want_more_stiffness=May_want_more_stiffness_XXL_landing unk_negative_aspect_xxl=Unknown
% @importance 0.80

0.83::true_val(negative_aspect_xxl, want_more_stiffness); 0.17::true_val(negative_aspect_xxl, unk_negative_aspect_xxl).

measured(s36, negative_aspect_xxl, want_more_stiffness).

all_consistent(negative_aspect_xxl) :-
    consistent(s36, negative_aspect_xxl).

evidence(all_consistent(negative_aspect_xxl)).
query(true_val(negative_aspect_xxl, want_more_stiffness)).
query(true_val(negative_aspect_xxl, unk_negative_aspect_xxl)).

0.88::acc(s40, negative_aspect_width).

% @attr negative_aspect_width
% @type categorical
% @canonical false
% @original_name negative_aspect (width for boot)
% @values wide_for_size9=159_felt_wide_for_size_9_boot unk_negative_aspect_width=Unknown
% @importance 0.95

0.86::true_val(negative_aspect_width, wide_for_size9); 0.14::true_val(negative_aspect_width, unk_negative_aspect_width).

measured(s40, negative_aspect_width, wide_for_size9).

all_consistent(negative_aspect_width) :-
    consistent(s40, negative_aspect_width).

evidence(all_consistent(negative_aspect_width)).
query(true_val(negative_aspect_width, wide_for_size9)).
query(true_val(negative_aspect_width, unk_negative_aspect_width)).

0.78::acc(s34, negative_aspect_weight).
0.82::acc(s41, negative_aspect_weight).
0.80::acc(s42, negative_aspect_weight).
0.88::acc(s40, negative_aspect_weight).

% @attr negative_aspect_weight
% @type categorical
% @canonical false
% @original_name negative_aspect (weight perception)
% @values heavier_than_normal=Felt_heavier_than_normal very_lightweight=Very_lightweight lighter_normal=Lighter_side_of_normal
% @importance 0.86

0.25::true_val(negative_aspect_weight, heavier_than_normal); 0.45::true_val(negative_aspect_weight, very_lightweight); 0.30::true_val(negative_aspect_weight, lighter_normal).

measured(s34, negative_aspect_weight, heavier_than_normal).
measured(s41, negative_aspect_weight, very_lightweight).
measured(s42, negative_aspect_weight, very_lightweight).
measured(s40, negative_aspect_weight, lighter_normal).

all_consistent(negative_aspect_weight) :-
    consistent(s34, negative_aspect_weight),
    consistent(s41, negative_aspect_weight),
    consistent(s42, negative_aspect_weight),
    consistent(s40, negative_aspect_weight).

evidence(all_consistent(negative_aspect_weight)).
query(true_val(negative_aspect_weight, heavier_than_normal)).
query(true_val(negative_aspect_weight, very_lightweight)).
query(true_val(negative_aspect_weight, lighter_normal)).

0.85::acc(s34, overall_rating_snowboardingprofiles).

% @attr overall_rating_snowboardingprofiles
% @type numeric
% @unit /100
% @canonical true
% @original_name overall_rating_snowboardingprofiles
% @values v87_2=87.2 unk_overall_rating_snowboardingprofiles=Unknown
% @importance 0.90

0.83::true_val(overall_rating_snowboardingprofiles, v87_2); 0.17::true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles).

measured(s34, overall_rating_snowboardingprofiles, v87_2).

all_consistent(overall_rating_snowboardingprofiles) :-
    consistent(s34, overall_rating_snowboardingprofiles).

evidence(all_consistent(overall_rating_snowboardingprofiles)).
query(true_val(overall_rating_snowboardingprofiles, v87_2)).
query(true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles)).

0.85::acc(s34, reviewer_opinion_snowboardingprofiles).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name reviewer_opinion_snowboardingprofiles
% @values third_of_16=3rd_out_of_16_freeride_boards unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.90

0.83::true_val(reviewer_opinion_snowboardingprofiles, third_of_16); 0.17::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).

measured(s34, reviewer_opinion_snowboardingprofiles, third_of_16).

all_consistent(reviewer_opinion_snowboardingprofiles) :-
    consistent(s34, reviewer_opinion_snowboardingprofiles).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, third_of_16)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

0.85::acc(s34, powder_score_snowboardingprofiles).

% @attr powder_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical true
% @original_name powder_score_snowboardingprofiles
% @values v4=4.0 unk_powder_score_snowboardingprofiles=Unknown
% @importance 0.90

0.83::true_val(powder_score_snowboardingprofiles, v4); 0.17::true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles).

measured(s34, powder_score_snowboardingprofiles, v4).

all_consistent(powder_score_snowboardingprofiles) :-
    consistent(s34, powder_score_snowboardingprofiles).

evidence(all_consistent(powder_score_snowboardingprofiles)).
query(true_val(powder_score_snowboardingprofiles, v4)).
query(true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles)).

0.85::acc(s34, speed_score_snowboardingprofiles).

% @attr speed_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical false
% @original_name SnowboardingProfiles speed score
% @values v4_5=4.5 unk_speed_score_snowboardingprofiles=Unknown
% @importance 0.90

0.83::true_val(speed_score_snowboardingprofiles, v4_5); 0.17::true_val(speed_score_snowboardingprofiles, unk_speed_score_snowboardingprofiles).

measured(s34, speed_score_snowboardingprofiles, v4_5).

all_consistent(speed_score_snowboardingprofiles) :-
    consistent(s34, speed_score_snowboardingprofiles).

evidence(all_consistent(speed_score_snowboardingprofiles)).
query(true_val(speed_score_snowboardingprofiles, v4_5)).
query(true_val(speed_score_snowboardingprofiles, unk_speed_score_snowboardingprofiles)).

0.85::acc(s34, carving_score_snowboardingprofiles).

% @attr carving_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical true
% @original_name carving_score_snowboardingprofiles
% @values v4_5=4.5 unk_carving_score_snowboardingprofiles=Unknown
% @importance 0.90

0.83::true_val(carving_score_snowboardingprofiles, v4_5); 0.17::true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles).

measured(s34, carving_score_snowboardingprofiles, v4_5).

all_consistent(carving_score_snowboardingprofiles) :-
    consistent(s34, carving_score_snowboardingprofiles).

evidence(all_consistent(carving_score_snowboardingprofiles)).
query(true_val(carving_score_snowboardingprofiles, v4_5)).
query(true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles)).

0.85::acc(s34, turns_score_snowboardingprofiles).

% @attr turns_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical false
% @original_name SnowboardingProfiles turns score
% @values v3_5=3.5 unk_turns_score_snowboardingprofiles=Unknown
% @importance 0.90

0.83::true_val(turns_score_snowboardingprofiles, v3_5); 0.17::true_val(turns_score_snowboardingprofiles, unk_turns_score_snowboardingprofiles).

measured(s34, turns_score_snowboardingprofiles, v3_5).

all_consistent(turns_score_snowboardingprofiles) :-
    consistent(s34, turns_score_snowboardingprofiles).

evidence(all_consistent(turns_score_snowboardingprofiles)).
query(true_val(turns_score_snowboardingprofiles, v3_5)).
query(true_val(turns_score_snowboardingprofiles, unk_turns_score_snowboardingprofiles)).

0.85::acc(s34, jumps_score_snowboardingprofiles).

% @attr jumps_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical false
% @original_name SnowboardingProfiles jumps score
% @values v3=3.0 unk_jumps_score_snowboardingprofiles=Unknown
% @importance 0.90

0.83::true_val(jumps_score_snowboardingprofiles, v3); 0.17::true_val(jumps_score_snowboardingprofiles, unk_jumps_score_snowboardingprofiles).

measured(s34, jumps_score_snowboardingprofiles, v3).

all_consistent(jumps_score_snowboardingprofiles) :-
    consistent(s34, jumps_score_snowboardingprofiles).

evidence(all_consistent(jumps_score_snowboardingprofiles)).
query(true_val(jumps_score_snowboardingprofiles, v3)).
query(true_val(jumps_score_snowboardingprofiles, unk_jumps_score_snowboardingprofiles)).

0.88::acc(s40, carving_rating_tgr).

% @attr carving_rating_tgr
% @type categorical
% @canonical true
% @original_name carving_rating_tgr
% @values great=Great unk_carving_rating_tgr=Unknown
% @importance 0.95

0.86::true_val(carving_rating_tgr, great); 0.14::true_val(carving_rating_tgr, unk_carving_rating_tgr).

measured(s40, carving_rating_tgr, great).

all_consistent(carving_rating_tgr) :-
    consistent(s40, carving_rating_tgr).

evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, great)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

0.88::acc(s40, base_glide_performance).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values great=Great unk_base_glide_performance=Unknown
% @importance 0.95

0.86::true_val(base_glide_performance, great); 0.14::true_val(base_glide_performance, unk_base_glide_performance).

measured(s40, base_glide_performance, great).

all_consistent(base_glide_performance) :-
    consistent(s40, base_glide_performance).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, great)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

0.88::acc(s40, edge_hold).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values good_hard_snow=Good_in_hard_snow unk_edge_hold=Unknown
% @importance 0.95

0.86::true_val(edge_hold, good_hard_snow); 0.14::true_val(edge_hold, unk_edge_hold).

measured(s40, edge_hold, good_hard_snow).

all_consistent(edge_hold) :-
    consistent(s40, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, good_hard_snow)).
query(true_val(edge_hold, unk_edge_hold)).

0.88::acc(s40, speed_rating_tgr).

% @attr speed_rating_tgr
% @type categorical
% @canonical true
% @original_name speed_rating_tgr
% @values good=Good unk_speed_rating_tgr=Unknown
% @importance 0.95

0.86::true_val(speed_rating_tgr, good); 0.14::true_val(speed_rating_tgr, unk_speed_rating_tgr).

measured(s40, speed_rating_tgr, good).

all_consistent(speed_rating_tgr) :-
    consistent(s40, speed_rating_tgr).

evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, good)).
query(true_val(speed_rating_tgr, unk_speed_rating_tgr)).

0.88::acc(s40, powder_rating_tgr).

% @attr powder_rating_tgr
% @type categorical
% @canonical true
% @original_name powder_rating_tgr
% @values good=Good unk_powder_rating_tgr=Unknown
% @importance 0.95

0.86::true_val(powder_rating_tgr, good); 0.14::true_val(powder_rating_tgr, unk_powder_rating_tgr).

measured(s40, powder_rating_tgr, good).

all_consistent(powder_rating_tgr) :-
    consistent(s40, powder_rating_tgr).

evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, good)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

0.88::acc(s40, reviewer_opinion_the_good_ride).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values good=Good unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.95

0.86::true_val(reviewer_opinion_the_good_ride, good); 0.14::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s40, reviewer_opinion_the_good_ride, good).

all_consistent(reviewer_opinion_the_good_ride) :-
    consistent(s40, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, good)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

0.88::acc(s40, flex_rating_10_the_good_ride).

% @attr flex_rating_10_the_good_ride
% @type categorical
% @canonical true
% @original_name flex_rating_10_the_good_ride
% @values medium=Medium unk_flex_rating_10_the_good_ride=Unknown
% @importance 0.95

0.86::true_val(flex_rating_10_the_good_ride, medium); 0.14::true_val(flex_rating_10_the_good_ride, unk_flex_rating_10_the_good_ride).

measured(s40, flex_rating_10_the_good_ride, medium).

all_consistent(flex_rating_10_the_good_ride) :-
    consistent(s40, flex_rating_10_the_good_ride).

evidence(all_consistent(flex_rating_10_the_good_ride)).
query(true_val(flex_rating_10_the_good_ride, medium)).
query(true_val(flex_rating_10_the_good_ride, unk_flex_rating_10_the_good_ride)).

0.88::acc(s40, on_snow_feel_tgr).

% @attr on_snow_feel_tgr
% @type categorical
% @canonical true
% @original_name on_snow_feel_tgr
% @values semi_locked_in=Semi_Locked_In unk_on_snow_feel_tgr=Unknown
% @importance 0.95

0.86::true_val(on_snow_feel_tgr, semi_locked_in); 0.14::true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr).

measured(s40, on_snow_feel_tgr, semi_locked_in).

all_consistent(on_snow_feel_tgr) :-
    consistent(s40, on_snow_feel_tgr).

evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, semi_locked_in)).
query(true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr)).

0.88::acc(s40, turn_initiation_performance).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values medium_fast=Medium_Fast unk_turn_initiation_performance=Unknown
% @importance 0.95

0.86::true_val(turn_initiation_performance, medium_fast); 0.14::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s40, turn_initiation_performance, medium_fast).

all_consistent(turn_initiation_performance) :-
    consistent(s40, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, medium_fast)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

0.88::acc(s18, user_review_forum).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values five_stars_powerful=5_of_5_Powerful_good_all_conditions_stiff_flex unk_user_review_forum=Unknown
% @importance 0.70

0.85::true_val(user_review_forum, five_stars_powerful); 0.15::true_val(user_review_forum, unk_user_review_forum).

measured(s18, user_review_forum, five_stars_powerful).

all_consistent(user_review_forum) :-
    consistent(s18, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, five_stars_powerful)).
query(true_val(user_review_forum, unk_user_review_forum)).

0.88::acc(s18, user_review_forum_2).

% @attr user_review_forum_2
% @type categorical
% @canonical false
% @original_name user_review_forum (second review)
% @values four_stars_fun=4_of_5_Super_fun_easy_great_groomers_not_best_offpiste unk_user_review_forum_2=Unknown
% @importance 0.70

0.85::true_val(user_review_forum_2, four_stars_fun); 0.15::true_val(user_review_forum_2, unk_user_review_forum_2).

measured(s18, user_review_forum_2, four_stars_fun).

all_consistent(user_review_forum_2) :-
    consistent(s18, user_review_forum_2).

evidence(all_consistent(user_review_forum_2)).
query(true_val(user_review_forum_2, four_stars_fun)).
query(true_val(user_review_forum_2, unk_user_review_forum_2)).

0.88::acc(s40, comparable_board_same_brand).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values dancehaul=Salomon_Dancehaul_similar_softer_flex unk_comparable_board_same_brand=Unknown
% @importance 0.95

0.86::true_val(comparable_board_same_brand, dancehaul); 0.14::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s40, comparable_board_same_brand, dancehaul).

all_consistent(comparable_board_same_brand) :-
    consistent(s40, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, dancehaul)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

0.80::acc(s42, comparable_board_cross_brand).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values jones_flagship=Jones_Flagship_between_Flagship_and_Stratos unk_comparable_board_cross_brand=Unknown
% @importance 0.80

0.78::true_val(comparable_board_cross_brand, jones_flagship); 0.22::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s42, comparable_board_cross_brand, jones_flagship).

all_consistent(comparable_board_cross_brand) :-
    consistent(s42, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, jones_flagship)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

0.80::acc(s42, comparable_board_cross_brand_2).

% @attr comparable_board_cross_brand_2
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (K2 Excavator)
% @values k2_excavator=K2_Excavator_Highpath_more_aggressive_more_expensive unk_comparable_board_cross_brand_2=Unknown
% @importance 0.80

0.78::true_val(comparable_board_cross_brand_2, k2_excavator); 0.22::true_val(comparable_board_cross_brand_2, unk_comparable_board_cross_brand_2).

measured(s42, comparable_board_cross_brand_2, k2_excavator).

all_consistent(comparable_board_cross_brand_2) :-
    consistent(s42, comparable_board_cross_brand_2).

evidence(all_consistent(comparable_board_cross_brand_2)).
query(true_val(comparable_board_cross_brand_2, k2_excavator)).
query(true_val(comparable_board_cross_brand_2, unk_comparable_board_cross_brand_2)).

0.88::acc(s40, comparable_board_cross_brand_3).

% @attr comparable_board_cross_brand_3
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (multiple)
% @values multi_comparables=Burton_Instigator_NS_Hammer_Korua_Otto_etc unk_comparable_board_cross_brand_3=Unknown
% @importance 0.95

0.86::true_val(comparable_board_cross_brand_3, multi_comparables); 0.14::true_val(comparable_board_cross_brand_3, unk_comparable_board_cross_brand_3).

measured(s40, comparable_board_cross_brand_3, multi_comparables).

all_consistent(comparable_board_cross_brand_3) :-
    consistent(s40, comparable_board_cross_brand_3).

evidence(all_consistent(comparable_board_cross_brand_3)).
query(true_val(comparable_board_cross_brand_3, multi_comparables)).
query(true_val(comparable_board_cross_brand_3, unk_comparable_board_cross_brand_3)).

0.82::acc(s34, comparable_board_same_brand_2).

% @attr comparable_board_same_brand_2
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Ultimate Ride)
% @values ultimate_ride=Closest_to_discontinued_Salomon_Ultimate_Ride unk_comparable_board_same_brand_2=Unknown
% @importance 0.90

0.80::true_val(comparable_board_same_brand_2, ultimate_ride); 0.20::true_val(comparable_board_same_brand_2, unk_comparable_board_same_brand_2).

measured(s34, comparable_board_same_brand_2, ultimate_ride).

all_consistent(comparable_board_same_brand_2) :-
    consistent(s34, comparable_board_same_brand_2).

evidence(all_consistent(comparable_board_same_brand_2)).
query(true_val(comparable_board_same_brand_2, ultimate_ride)).
query(true_val(comparable_board_same_brand_2, unk_comparable_board_same_brand_2)).

0.90::acc(s24, comparable_board_same_brand_3).

% @attr comparable_board_same_brand_3
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Assassin)
% @values more_versatile_assassin=Even_more_versatile_than_Assassin unk_comparable_board_same_brand_3=Unknown
% @importance 0.65

0.88::true_val(comparable_board_same_brand_3, more_versatile_assassin); 0.12::true_val(comparable_board_same_brand_3, unk_comparable_board_same_brand_3).

measured(s24, comparable_board_same_brand_3, more_versatile_assassin).

all_consistent(comparable_board_same_brand_3) :-
    consistent(s24, comparable_board_same_brand_3).

evidence(all_consistent(comparable_board_same_brand_3)).
query(true_val(comparable_board_same_brand_3, more_versatile_assassin)).
query(true_val(comparable_board_same_brand_3, unk_comparable_board_same_brand_3)).

0.95::acc(s45, warranty_period_years).

% @attr warranty_period_years
% @type numeric
% @unit years
% @canonical true
% @original_name warranty_period_years
% @values v2=2.0 unk_warranty_period_years=Unknown
% @importance 0.70

0.94::true_val(warranty_period_years, v2); 0.06::true_val(warranty_period_years, unk_warranty_period_years).

measured(s45, warranty_period_years, v2).

all_consistent(warranty_period_years) :-
    consistent(s45, warranty_period_years).

evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v2)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

0.93::acc(s45, warranty).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values mfg_defects_original_purchaser=Against_manufacturing_material_defects_original_purchaser unk_warranty=Unknown
% @importance 0.70

0.93::true_val(warranty, mfg_defects_original_purchaser); 0.07::true_val(warranty, unk_warranty).

measured(s45, warranty, mfg_defects_original_purchaser).

all_consistent(warranty) :-
    consistent(s45, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, mfg_defects_original_purchaser)).
query(true_val(warranty, unk_warranty)).

0.93::acc(s45, warranty_remedy).

% @attr warranty_remedy
% @type categorical
% @canonical false
% @original_name warranty (remedy)
% @values repair_or_replace=Repair_or_replace_at_no_charge_at_discretion unk_warranty_remedy=Unknown
% @importance 0.70

0.93::true_val(warranty_remedy, repair_or_replace); 0.07::true_val(warranty_remedy, unk_warranty_remedy).

measured(s45, warranty_remedy, repair_or_replace).

all_consistent(warranty_remedy) :-
    consistent(s45, warranty_remedy).

evidence(all_consistent(warranty_remedy)).
query(true_val(warranty_remedy, repair_or_replace)).
query(true_val(warranty_remedy, unk_warranty_remedy)).

0.82::acc(s31, effective_edge_146).

% @attr effective_edge_146
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 146cm
% @values v110_5=110.5 unk_effective_edge_146=Unknown
% @importance 0.90

0.80::true_val(effective_edge_146, v110_5); 0.20::true_val(effective_edge_146, unk_effective_edge_146).

measured(s31, effective_edge_146, v110_5).

all_consistent(effective_edge_146) :-
    (indep(s31), consistent(s31, effective_edge_146) ; \+indep(s31)).

evidence(all_consistent(effective_edge_146)).
query(true_val(effective_edge_146, v110_5)).
query(true_val(effective_edge_146, unk_effective_edge_146)).

0.82::acc(s31, waist_width_146).

% @attr waist_width_146
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 146cm
% @values v24_3=24.3 unk_waist_width_146=Unknown
% @importance 0.90

0.80::true_val(waist_width_146, v24_3); 0.20::true_val(waist_width_146, unk_waist_width_146).

measured(s31, waist_width_146, v24_3).

all_consistent(waist_width_146) :-
    (indep(s31), consistent(s31, waist_width_146) ; \+indep(s31)).

evidence(all_consistent(waist_width_146)).
query(true_val(waist_width_146, v24_3)).
query(true_val(waist_width_146, unk_waist_width_146)).

0.82::acc(s31, sidecut_radius_size_146).

% @attr sidecut_radius_size_146
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (146cm)
% @values v6_2=6.2 unk_sidecut_radius_size_146=Unknown
% @importance 0.90

0.80::true_val(sidecut_radius_size_146, v6_2); 0.20::true_val(sidecut_radius_size_146, unk_sidecut_radius_size_146).

measured(s31, sidecut_radius_size_146, v6_2).

all_consistent(sidecut_radius_size_146) :-
    (indep(s31), consistent(s31, sidecut_radius_size_146) ; \+indep(s31)).

evidence(all_consistent(sidecut_radius_size_146)).
query(true_val(sidecut_radius_size_146, v6_2)).
query(true_val(sidecut_radius_size_146, unk_sidecut_radius_size_146)).

0.82::acc(s31, recommended_weight_range_size_146).

% @attr recommended_weight_range_size_146
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (146cm)
% @values w50_75=50_75kg unk_recommended_weight_range_size_146=Unknown
% @importance 0.90

0.80::true_val(recommended_weight_range_size_146, w50_75); 0.20::true_val(recommended_weight_range_size_146, unk_recommended_weight_range_size_146).

measured(s31, recommended_weight_range_size_146, w50_75).

all_consistent(recommended_weight_range_size_146) :-
    (indep(s31), consistent(s31, recommended_weight_range_size_146) ; \+indep(s31)).

evidence(all_consistent(recommended_weight_range_size_146)).
query(true_val(recommended_weight_range_size_146, w50_75)).
query(true_val(recommended_weight_range_size_146, unk_recommended_weight_range_size_146)).

0.82::acc(s31, effective_edge_150).

% @attr effective_edge_150
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 150cm
% @values v114_0=114.0 unk_effective_edge_150=Unknown
% @importance 0.90

0.80::true_val(effective_edge_150, v114_0); 0.20::true_val(effective_edge_150, unk_effective_edge_150).

measured(s31, effective_edge_150, v114_0).

all_consistent(effective_edge_150) :-
    (indep(s31), consistent(s31, effective_edge_150) ; \+indep(s31)).

evidence(all_consistent(effective_edge_150)).
query(true_val(effective_edge_150, v114_0)).
query(true_val(effective_edge_150, unk_effective_edge_150)).

0.82::acc(s31, waist_width_150).

% @attr waist_width_150
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 150cm
% @values v24_7=24.7 unk_waist_width_150=Unknown
% @importance 0.90

0.80::true_val(waist_width_150, v24_7); 0.20::true_val(waist_width_150, unk_waist_width_150).

measured(s31, waist_width_150, v24_7).

all_consistent(waist_width_150) :-
    (indep(s31), consistent(s31, waist_width_150) ; \+indep(s31)).

evidence(all_consistent(waist_width_150)).
query(true_val(waist_width_150, v24_7)).
query(true_val(waist_width_150, unk_waist_width_150)).

0.82::acc(s31, sidecut_radius_size_150).

% @attr sidecut_radius_size_150
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (150cm)
% @values v6_5=6.5 unk_sidecut_radius_size_150=Unknown
% @importance 0.90

0.80::true_val(sidecut_radius_size_150, v6_5); 0.20::true_val(sidecut_radius_size_150, unk_sidecut_radius_size_150).

measured(s31, sidecut_radius_size_150, v6_5).

all_consistent(sidecut_radius_size_150) :-
    (indep(s31), consistent(s31, sidecut_radius_size_150) ; \+indep(s31)).

evidence(all_consistent(sidecut_radius_size_150)).
query(true_val(sidecut_radius_size_150, v6_5)).
query(true_val(sidecut_radius_size_150, unk_sidecut_radius_size_150)).

0.82::acc(s31, recommended_weight_range_size_150).

% @attr recommended_weight_range_size_150
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (150cm)
% @values w50_80=50_80kg unk_recommended_weight_range_size_150=Unknown
% @importance 0.90

0.80::true_val(recommended_weight_range_size_150, w50_80); 0.20::true_val(recommended_weight_range_size_150, unk_recommended_weight_range_size_150).

measured(s31, recommended_weight_range_size_150, w50_80).

all_consistent(recommended_weight_range_size_150) :-
    (indep(s31), consistent(s31, recommended_weight_range_size_150) ; \+indep(s31)).

evidence(all_consistent(recommended_weight_range_size_150)).
query(true_val(recommended_weight_range_size_150, w50_80)).
query(true_val(recommended_weight_range_size_150, unk_recommended_weight_range_size_150)).

0.82::acc(s31, effective_edge_153).

% @attr effective_edge_153
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 153cm
% @values v117_0=117.0 unk_effective_edge_153=Unknown
% @importance 0.90

0.80::true_val(effective_edge_153, v117_0); 0.20::true_val(effective_edge_153, unk_effective_edge_153).

measured(s31, effective_edge_153, v117_0).

all_consistent(effective_edge_153) :-
    (indep(s31), consistent(s31, effective_edge_153) ; \+indep(s31)).

evidence(all_consistent(effective_edge_153)).
query(true_val(effective_edge_153, v117_0)).
query(true_val(effective_edge_153, unk_effective_edge_153)).

0.82::acc(s31, waist_width_153).

% @attr waist_width_153
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 153cm
% @values v25_2=25.2 unk_waist_width_153=Unknown
% @importance 0.90

0.80::true_val(waist_width_153, v25_2); 0.20::true_val(waist_width_153, unk_waist_width_153).

measured(s31, waist_width_153, v25_2).

all_consistent(waist_width_153) :-
    (indep(s31), consistent(s31, waist_width_153) ; \+indep(s31)).

evidence(all_consistent(waist_width_153)).
query(true_val(waist_width_153, v25_2)).
query(true_val(waist_width_153, unk_waist_width_153)).

0.82::acc(s31, sidecut_radius_size_153).

% @attr sidecut_radius_size_153
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (153cm)
% @values v6_9=6.9 unk_sidecut_radius_size_153=Unknown
% @importance 0.90

0.80::true_val(sidecut_radius_size_153, v6_9); 0.20::true_val(sidecut_radius_size_153, unk_sidecut_radius_size_153).

measured(s31, sidecut_radius_size_153, v6_9).

all_consistent(sidecut_radius_size_153) :-
    (indep(s31), consistent(s31, sidecut_radius_size_153) ; \+indep(s31)).

evidence(all_consistent(sidecut_radius_size_153)).
query(true_val(sidecut_radius_size_153, v6_9)).
query(true_val(sidecut_radius_size_153, unk_sidecut_radius_size_153)).

0.82::acc(s31, recommended_weight_range_size_153).

% @attr recommended_weight_range_size_153
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (153cm)
% @values w60_90=60_90kg unk_recommended_weight_range_size_153=Unknown
% @importance 0.90

0.80::true_val(recommended_weight_range_size_153, w60_90); 0.20::true_val(recommended_weight_range_size_153, unk_recommended_weight_range_size_153).

measured(s31, recommended_weight_range_size_153, w60_90).

all_consistent(recommended_weight_range_size_153) :-
    (indep(s31), consistent(s31, recommended_weight_range_size_153) ; \+indep(s31)).

evidence(all_consistent(recommended_weight_range_size_153)).
query(true_val(recommended_weight_range_size_153, w60_90)).
query(true_val(recommended_weight_range_size_153, unk_recommended_weight_range_size_153)).

0.78::acc(s31, rider_level).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values advanced=Advanced unk_rider_level=Unknown
% @importance 0.90

0.78::true_val(rider_level, advanced); 0.22::true_val(rider_level, unk_rider_level).

measured(s31, rider_level, advanced).

all_consistent(rider_level) :-
    (indep(s31), consistent(s31, rider_level) ; \+indep(s31)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, advanced)).
query(true_val(rider_level, unk_rider_level)).