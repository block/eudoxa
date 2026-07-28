0.12::indep(s3).
0.12::indep(s4).
0.15::indep(s8).
0.12::indep(s10).
0.12::indep(s19).
0.15::indep(s23).
0.15::indep(s24).
0.12::indep(s27).
0.12::indep(s28).
0.10::indep(s29).
0.10::indep(s30).
0.10::indep(s31).
0.12::indep(s34).
0.80::indep(s20).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values k2=K2 unk_brand=Unknown
% @importance 1.0

0.95::acc(s2, brand).

0.96::true_val(brand, k2); 0.04::true_val(brand, unk_brand).

measured(s2, brand, k2).

all_consistent(brand) :- consistent(s2, brand).

evidence(all_consistent(brand)).
query(true_val(brand, k2)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values sky_pilot=Sky_Pilot unk_model_name=Unknown
% @importance 1.0

0.95::acc(s2, model_name).

0.96::true_val(model_name, sky_pilot); 0.04::true_val(model_name, unk_model_name).

measured(s2, model_name, sky_pilot).

all_consistent(model_name) :- consistent(s2, model_name).

evidence(all_consistent(model_name)).
query(true_val(model_name, sky_pilot)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2027=2027 unk_model_year=Unknown
% @importance 0.75

0.70::acc(s3, model_year).
0.70::acc(s4, model_year).

0.92::true_val(model_year, y2027); 0.08::true_val(model_year, unk_model_year).

measured(s3, model_year, y2027).
measured(s4, model_year, y2027).

all_consistent(model_year) :-
    (indep(s3), consistent(s3, model_year) ; \+indep(s3)),
    (indep(s4), consistent(s4, model_year) ; \+indep(s4)).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2027)).
query(true_val(model_year, unk_model_year)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values y2026_25_26=2026_25_26_season unk_model_first_available_year=Unknown
% @importance 0.775

0.88::acc(s9, model_first_available_year).
0.82::acc(s6, model_first_available_year).

0.93::true_val(model_first_available_year, y2026_25_26); 0.07::true_val(model_first_available_year, unk_model_first_available_year).

measured(s9, model_first_available_year, y2026_25_26).
measured(s6, model_first_available_year, y2026_25_26).

all_consistent(model_first_available_year) :-
    consistent(s9, model_first_available_year),
    consistent(s6, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2026_25_26)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr redesign_year
% @type categorical
% @canonical true
% @original_name redesign_year
% @values unchanged_26_27=Returns_unchanged_for_26_27_graphics_only unk_redesign_year=Unknown
% @importance 0.95

0.92::acc(s7, redesign_year).

0.86::true_val(redesign_year, unchanged_26_27); 0.14::true_val(redesign_year, unk_redesign_year).

measured(s7, redesign_year, unchanged_26_27).

all_consistent(redesign_year) :- consistent(s7, redesign_year).

evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, unchanged_26_27)).
query(true_val(redesign_year, unk_redesign_year)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.95::acc(s2, product_type).

0.96::true_val(product_type, snowboard); 0.04::true_val(product_type, unk_product_type).

measured(s2, product_type, snowboard).

all_consistent(product_type) :- consistent(s2, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain_freeride=All_Mountain_Freeride snowsurf=Snowsurf
% @importance 0.85

0.70::acc(s3, board_category).
0.72::acc(s8, board_category).
0.85::acc(s9, board_category).

0.60::true_val(board_category, all_mountain_freeride); 0.40::true_val(board_category, snowsurf).

measured(s3, board_category, all_mountain_freeride).
measured(s8, board_category, all_mountain_freeride).
measured(s9, board_category, snowsurf).

all_consistent(board_category) :-
    (indep(s3), consistent(s3, board_category) ; \+indep(s3)),
    (indep(s8), consistent(s8, board_category) ; \+indep(s8)),
    consistent(s9, board_category).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain_freeride)).
query(true_val(board_category, snowsurf)).

% @attr snowboard_collection
% @type categorical
% @canonical false
% @original_name Snowboard collection
% @values dopamine=Dopamine unk_snowboard_collection=Unknown
% @importance 1.0

0.94::acc(s2, snowboard_collection).

0.93::true_val(snowboard_collection, dopamine); 0.07::true_val(snowboard_collection, unk_snowboard_collection).

measured(s2, snowboard_collection, dopamine).

all_consistent(snowboard_collection) :- consistent(s2, snowboard_collection).

evidence(all_consistent(snowboard_collection)).
query(true_val(snowboard_collection, dopamine)).
query(true_val(snowboard_collection, unk_snowboard_collection)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values unisex=Unisex_all_gender_scaled_sizing unk_gender=Unknown
% @importance 0.80

0.94::acc(s2, gender).
0.70::acc(s10, gender).

0.95::true_val(gender, unisex); 0.05::true_val(gender, unk_gender).

measured(s2, gender, unisex).
measured(s10, gender, unisex).

all_consistent(gender) :-
    consistent(s2, gender),
    (indep(s10), consistent(s10, gender) ; \+indep(s10)).

evidence(all_consistent(gender)).
query(true_val(gender, unisex)).
query(true_val(gender, unk_gender)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values sage_kotsenburg=Sage_Kotsenburg unk_pro_rider_name=Unknown
% @importance 1.0

0.95::acc(s2, pro_rider_name).

0.96::true_val(pro_rider_name, sage_kotsenburg); 0.04::true_val(pro_rider_name, unk_pro_rider_name).

measured(s2, pro_rider_name, sage_kotsenburg).

all_consistent(pro_rider_name) :- consistent(s2, pro_rider_name).

evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, sage_kotsenburg)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr sage_kotsenburg_credential
% @type categorical
% @canonical false
% @original_name Sage Kotsenburg credential
% @values olympic_gold_2014=Won_first_ever_Olympic_gold_slopestyle_2014_Sochi unk_sage_kotsenburg_credential=Unknown
% @importance 0.5

0.90::acc(s11, sage_kotsenburg_credential).

0.81::true_val(sage_kotsenburg_credential, olympic_gold_2014); 0.19::true_val(sage_kotsenburg_credential, unk_sage_kotsenburg_credential).

measured(s11, sage_kotsenburg_credential, olympic_gold_2014).

all_consistent(sage_kotsenburg_credential) :- consistent(s11, sage_kotsenburg_credential).

evidence(all_consistent(sage_kotsenburg_credential)).
query(true_val(sage_kotsenburg_credential, olympic_gold_2014)).
query(true_val(sage_kotsenburg_credential, unk_sage_kotsenburg_credential)).

% @attr sage_kotsenburg_post_olympic_focus
% @type categorical
% @canonical false
% @original_name Sage Kotsenburg post-Olympic focus
% @values backcountry_freestyle=Left_competitive_for_backcountry_freestyle unk_sage_kotsenburg_post_olympic_focus=Unknown
% @importance 0.425

0.88::acc(s11, sage_kotsenburg_post_olympic_focus).
0.80::acc(s13, sage_kotsenburg_post_olympic_focus).

0.93::true_val(sage_kotsenburg_post_olympic_focus, backcountry_freestyle); 0.07::true_val(sage_kotsenburg_post_olympic_focus, unk_sage_kotsenburg_post_olympic_focus).

measured(s11, sage_kotsenburg_post_olympic_focus, backcountry_freestyle).
measured(s13, sage_kotsenburg_post_olympic_focus, backcountry_freestyle).

all_consistent(sage_kotsenburg_post_olympic_focus) :-
    consistent(s11, sage_kotsenburg_post_olympic_focus),
    consistent(s13, sage_kotsenburg_post_olympic_focus).

evidence(all_consistent(sage_kotsenburg_post_olympic_focus)).
query(true_val(sage_kotsenburg_post_olympic_focus, backcountry_freestyle)).
query(true_val(sage_kotsenburg_post_olympic_focus, unk_sage_kotsenburg_post_olympic_focus)).

% @attr design_intent
% @type categorical
% @canonical false
% @original_name Design intent
% @values pillowy_forested_technical=Designed_for_pillowy_forested_technical_terrain unk_design_intent=Unknown
% @importance 1.0

0.93::acc(s2, design_intent).

0.92::true_val(design_intent, pillowy_forested_technical); 0.08::true_val(design_intent, unk_design_intent).

measured(s2, design_intent, pillowy_forested_technical).

all_consistent(design_intent) :- consistent(s2, design_intent).

evidence(all_consistent(design_intent)).
query(true_val(design_intent, pillowy_forested_technical)).
query(true_val(design_intent, unk_design_intent)).

% @attr design_concept
% @type categorical
% @canonical false
% @original_name Design concept
% @values pivot_release_tail=Pivot_and_release_tail_for_natural_terrain unk_design_concept=Unknown
% @importance 1.0

0.93::acc(s2, design_concept).

0.92::true_val(design_concept, pivot_release_tail); 0.08::true_val(design_concept, unk_design_concept).

measured(s2, design_concept, pivot_release_tail).

all_consistent(design_concept) :- consistent(s2, design_concept).

evidence(all_consistent(design_concept)).
query(true_val(design_concept, pivot_release_tail)).
query(true_val(design_concept, unk_design_concept)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values k2_antidote=K2_Antidote_stiffer_more_carbon unk_comparable_board_same_brand=Unknown
% @importance 0.95

0.90::acc(s7, comparable_board_same_brand).

0.86::true_val(comparable_board_same_brand, k2_antidote); 0.14::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s7, comparable_board_same_brand, k2_antidote).

all_consistent(comparable_board_same_brand) :- consistent(s7, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, k2_antidote)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_commonwealth
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values k2_commonwealth=K2_Commonwealth_better_pop_easier_ollie unk_comparable_board_same_brand_commonwealth=Unknown
% @importance 0.95

0.85::acc(s9, comparable_board_same_brand_commonwealth).

0.78::true_val(comparable_board_same_brand_commonwealth, k2_commonwealth); 0.22::true_val(comparable_board_same_brand_commonwealth, unk_comparable_board_same_brand_commonwealth).

measured(s9, comparable_board_same_brand_commonwealth, k2_commonwealth).

all_consistent(comparable_board_same_brand_commonwealth) :- consistent(s9, comparable_board_same_brand_commonwealth).

evidence(all_consistent(comparable_board_same_brand_commonwealth)).
query(true_val(comparable_board_same_brand_commonwealth, k2_commonwealth)).
query(true_val(comparable_board_same_brand_commonwealth, unk_comparable_board_same_brand_commonwealth)).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values k2_instrument=K2_Instrument_discontinued unk_predecessor_model_name=Unknown
% @importance 0.625

0.85::acc(s9, predecessor_model_name).
0.65::acc(s15, predecessor_model_name).

0.92::true_val(predecessor_model_name, k2_instrument); 0.08::true_val(predecessor_model_name, unk_predecessor_model_name).

measured(s9, predecessor_model_name, k2_instrument).
measured(s15, predecessor_model_name, k2_instrument).

all_consistent(predecessor_model_name) :-
    consistent(s9, predecessor_model_name),
    consistent(s15, predecessor_model_name).

evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, k2_instrument)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values k2_sports_llc=K2_Sports_LLC unk_manufacturer=Unknown
% @importance 0.55

0.90::acc(s16, manufacturer).

0.82::true_val(manufacturer, k2_sports_llc); 0.18::true_val(manufacturer, unk_manufacturer).

measured(s16, manufacturer, k2_sports_llc).

all_consistent(manufacturer) :- consistent(s16, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, k2_sports_llc)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr parent_company
% @type categorical
% @canonical false
% @original_name Parent company
% @values elevate_outdoor_collective=Elevate_Outdoor_Collective unk_parent_company=Unknown
% @importance 0.4

0.90::acc(s17, parent_company).

0.80::true_val(parent_company, elevate_outdoor_collective); 0.20::true_val(parent_company, unk_parent_company).

measured(s17, parent_company, elevate_outdoor_collective).

all_consistent(parent_company) :- consistent(s17, parent_company).

evidence(all_consistent(parent_company)).
query(true_val(parent_company, elevate_outdoor_collective)).
query(true_val(parent_company, unk_parent_company)).

% @attr corporate_ownership
% @type categorical
% @canonical false
% @original_name Corporate ownership
% @values kohlberg_and_company=Kohlberg_and_Company_PE_2017 unk_corporate_ownership=Unknown
% @importance 0.35

0.85::acc(s18, corporate_ownership).

0.69::true_val(corporate_ownership, kohlberg_and_company); 0.31::true_val(corporate_ownership, unk_corporate_ownership).

measured(s18, corporate_ownership, kohlberg_and_company).

all_consistent(corporate_ownership) :- consistent(s18, corporate_ownership).

evidence(all_consistent(corporate_ownership)).
query(true_val(corporate_ownership, kohlberg_and_company)).
query(true_val(corporate_ownership, unk_corporate_ownership)).

% @attr headquarters
% @type categorical
% @canonical false
% @original_name Headquarters
% @values seattle_wa_usa=Seattle_Washington_USA unk_headquarters=Unknown
% @importance 0.475

0.90::acc(s16, headquarters).
0.85::acc(s17, headquarters).

0.95::true_val(headquarters, seattle_wa_usa); 0.05::true_val(headquarters, unk_headquarters).

measured(s16, headquarters, seattle_wa_usa).
measured(s17, headquarters, seattle_wa_usa).

all_consistent(headquarters) :-
    consistent(s16, headquarters),
    consistent(s17, headquarters).

evidence(all_consistent(headquarters)).
query(true_val(headquarters, seattle_wa_usa)).
query(true_val(headquarters, unk_headquarters)).

% @attr k2_founded
% @type categorical
% @canonical false
% @original_name K2 founded
% @values y1962_vashon=1962_Vashon_Island_WA unk_k2_founded=Unknown
% @importance 0.55

0.90::acc(s16, k2_founded).

0.82::true_val(k2_founded, y1962_vashon); 0.18::true_val(k2_founded, unk_k2_founded).

measured(s16, k2_founded, y1962_vashon).

all_consistent(k2_founded) :- consistent(s16, k2_founded).

evidence(all_consistent(k2_founded)).
query(true_val(k2_founded, y1962_vashon)).
query(true_val(k2_founded, unk_k2_founded)).

% @attr k2_snowboarding_division_founded
% @type categorical
% @canonical false
% @original_name K2 Snowboarding division founded
% @values y1987=1987 y1988=1988
% @importance 0.425

0.82::acc(s19, k2_snowboarding_division_founded).
0.78::acc(s20, k2_snowboarding_division_founded).

0.55::true_val(k2_snowboarding_division_founded, y1987); 0.45::true_val(k2_snowboarding_division_founded, y1988).

measured(s19, k2_snowboarding_division_founded, y1987).
measured(s20, k2_snowboarding_division_founded, y1988).

all_consistent(k2_snowboarding_division_founded) :-
    (indep(s19), consistent(s19, k2_snowboarding_division_founded) ; \+indep(s19)),
    (indep(s20), consistent(s20, k2_snowboarding_division_founded) ; \+indep(s20)).

evidence(all_consistent(k2_snowboarding_division_founded)).
query(true_val(k2_snowboarding_division_founded, y1987)).
query(true_val(k2_snowboarding_division_founded, y1988)).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values china=China unk_manufacturing_location_current=Unknown
% @importance 0.725

0.85::acc(s9, manufacturing_location_current).
0.90::acc(s16, manufacturing_location_current).

0.95::true_val(manufacturing_location_current, china); 0.05::true_val(manufacturing_location_current, unk_manufacturing_location_current).

measured(s9, manufacturing_location_current, china).
measured(s16, manufacturing_location_current, china).

all_consistent(manufacturing_location_current) :-
    consistent(s9, manufacturing_location_current),
    consistent(s16, manufacturing_location_current).

evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, china)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

% @attr manufacturing_location_prior
% @type categorical
% @canonical true
% @original_name manufacturing_location_prior
% @values moved_2001=Manufacturing_moved_to_China_2001 unk_manufacturing_location_prior=Unknown
% @importance 0.5

0.90::acc(s16, manufacturing_location_prior).
0.78::acc(s20, manufacturing_location_prior).

0.95::true_val(manufacturing_location_prior, moved_2001); 0.05::true_val(manufacturing_location_prior, unk_manufacturing_location_prior).

measured(s16, manufacturing_location_prior, moved_2001).
measured(s20, manufacturing_location_prior, moved_2001).

all_consistent(manufacturing_location_prior) :-
    consistent(s16, manufacturing_location_prior),
    (indep(s20), consistent(s20, manufacturing_location_prior) ; \+indep(s20)).

evidence(all_consistent(manufacturing_location_prior)).
query(true_val(manufacturing_location_prior, moved_2001)).
query(true_val(manufacturing_location_prior, unk_manufacturing_location_prior)).

% @attr design_engineer
% @type categorical
% @canonical false
% @original_name Design engineer (K2 Snowboards)
% @values justin_clark=Justin_Clark unk_design_engineer=Unknown
% @importance 0.95

0.90::acc(s7, design_engineer).

0.86::true_val(design_engineer, justin_clark); 0.14::true_val(design_engineer, unk_design_engineer).

measured(s7, design_engineer, justin_clark).

all_consistent(design_engineer) :- consistent(s7, design_engineer).

evidence(all_consistent(design_engineer)).
query(true_val(design_engineer, justin_clark)).
query(true_val(design_engineer, unk_design_engineer)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v629_95=629.95 unk_price_usd_msrp=Unknown
% @importance 1.0

0.95::acc(s2, price_usd_msrp).

0.93::true_val(price_usd_msrp, v629_95); 0.07::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s2, price_usd_msrp, v629_95).

all_consistent(price_usd_msrp) :- consistent(s2, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v629_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_usd_evo
% @type numeric
% @canonical true
% @original_name price_usd_evo
% @unit USD
% @values v629_95=629.95 unk_price_usd_evo=Unknown
% @importance 0.85

0.88::acc(s23, price_usd_evo).

0.82::true_val(price_usd_evo, v629_95); 0.18::true_val(price_usd_evo, unk_price_usd_evo).

measured(s23, price_usd_evo, v629_95).

all_consistent(price_usd_evo) :-
    (indep(s23), consistent(s23, price_usd_evo) ; \+indep(s23)).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v629_95)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_tactics
% @type numeric
% @canonical true
% @original_name price_usd_tactics
% @unit USD
% @values v629_95=629.95 unk_price_usd_tactics=Unknown
% @importance 0.8

0.87::acc(s24, price_usd_tactics).

0.80::true_val(price_usd_tactics, v629_95); 0.20::true_val(price_usd_tactics, unk_price_usd_tactics).

measured(s24, price_usd_tactics, v629_95).

all_consistent(price_usd_tactics) :-
    (indep(s24), consistent(s24, price_usd_tactics) ; \+indep(s24)).

evidence(all_consistent(price_usd_tactics)).
query(true_val(price_usd_tactics, v629_95)).
query(true_val(price_usd_tactics, unk_price_usd_tactics)).

% @attr price_usd_blauer
% @type numeric
% @canonical false
% @original_name Price at Blauer Board Shop (USD)
% @unit USD
% @values v629_95=629.95 unk_price_usd_blauer=Unknown
% @importance 0.7

0.82::acc(s8, price_usd_blauer).

0.75::true_val(price_usd_blauer, v629_95); 0.25::true_val(price_usd_blauer, unk_price_usd_blauer).

measured(s8, price_usd_blauer, v629_95).

all_consistent(price_usd_blauer) :-
    (indep(s8), consistent(s8, price_usd_blauer) ; \+indep(s8)).

evidence(all_consistent(price_usd_blauer)).
query(true_val(price_usd_blauer, v629_95)).
query(true_val(price_usd_blauer, unk_price_usd_blauer)).

% @attr price_usd_christy_discounted
% @type numeric
% @canonical false
% @original_name Price at Christy Sports (USD, discounted)
% @unit USD
% @values v440_97=440.97 unk_price_usd_christy_discounted=Unknown
% @importance 0.95

0.85::acc(s9, price_usd_christy_discounted).

0.78::true_val(price_usd_christy_discounted, v440_97); 0.22::true_val(price_usd_christy_discounted, unk_price_usd_christy_discounted).

measured(s9, price_usd_christy_discounted, v440_97).

all_consistent(price_usd_christy_discounted) :- consistent(s9, price_usd_christy_discounted).

evidence(all_consistent(price_usd_christy_discounted)).
query(true_val(price_usd_christy_discounted, v440_97)).
query(true_val(price_usd_christy_discounted, unk_price_usd_christy_discounted)).

% @attr price_eur_snowcountry
% @type numeric
% @canonical false
% @original_name Price at SnowCountry (EUR)
% @unit EUR
% @values v437_96=437.96 unk_price_eur_snowcountry=Unknown
% @importance 0.95

0.85::acc(s9, price_eur_snowcountry).

0.78::true_val(price_eur_snowcountry, v437_96); 0.22::true_val(price_eur_snowcountry, unk_price_eur_snowcountry).

measured(s9, price_eur_snowcountry, v437_96).

all_consistent(price_eur_snowcountry) :- consistent(s9, price_eur_snowcountry).

evidence(all_consistent(price_eur_snowcountry)).
query(true_val(price_eur_snowcountry, v437_96)).
query(true_val(price_eur_snowcountry, unk_price_eur_snowcountry)).

% @attr price_cad_prfo
% @type categorical
% @canonical true
% @original_name price_cad_prfo
% @unit CAD
% @values v454_99_to_649_99=454.99_to_649.99 unk_price_cad_prfo=Unknown
% @importance 0.95

0.85::acc(s9, price_cad_prfo).

0.78::true_val(price_cad_prfo, v454_99_to_649_99); 0.22::true_val(price_cad_prfo, unk_price_cad_prfo).

measured(s9, price_cad_prfo, v454_99_to_649_99).

all_consistent(price_cad_prfo) :- consistent(s9, price_cad_prfo).

evidence(all_consistent(price_cad_prfo)).
query(true_val(price_cad_prfo, v454_99_to_649_99)).
query(true_val(price_cad_prfo, unk_price_cad_prfo)).

% @attr price_aud_merchant
% @type numeric
% @canonical true
% @original_name price_aud_merchant
% @unit AUD
% @values v949_99=949.99 unk_price_aud_merchant=Unknown
% @importance 0.9

0.72::acc(s3, price_aud_merchant).

0.64::true_val(price_aud_merchant, v949_99); 0.36::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s3, price_aud_merchant, v949_99).

all_consistent(price_aud_merchant) :-
    (indep(s3), consistent(s3, price_aud_merchant) ; \+indep(s3)).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v949_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr estimated_availability_date
% @type categorical
% @canonical false
% @original_name estimated_availability_date
% @values may_1_2026=Preorder_estimated_May_1_2026 unk_estimated_availability_date=Unknown
% @importance 0.9

0.72::acc(s3, estimated_availability_date).

0.64::true_val(estimated_availability_date, may_1_2026); 0.36::true_val(estimated_availability_date, unk_estimated_availability_date).

measured(s3, estimated_availability_date, may_1_2026).

all_consistent(estimated_availability_date) :-
    (indep(s3), consistent(s3, estimated_availability_date) ; \+indep(s3)).

evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, may_1_2026)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values available=Available unk_availability_status=Unknown
% @importance 0.58

0.94::acc(s2, availability_status).
0.85::acc(s9, availability_status).
0.70::acc(s3, availability_status).
0.70::acc(s4, availability_status).
0.70::acc(s8, availability_status).
0.70::acc(s10, availability_status).
0.70::acc(s19, availability_status).
0.82::acc(s23, availability_status).
0.80::acc(s24, availability_status).
0.70::acc(s27, availability_status).
0.68::acc(s28, availability_status).
0.65::acc(s29, availability_status).
0.65::acc(s30, availability_status).
0.60::acc(s31, availability_status).

0.97::true_val(availability_status, available); 0.03::true_val(availability_status, unk_availability_status).

measured(s2, availability_status, available).
measured(s9, availability_status, available).
measured(s3, availability_status, available).
measured(s4, availability_status, available).
measured(s8, availability_status, available).
measured(s10, availability_status, available).
measured(s19, availability_status, available).
measured(s23, availability_status, available).
measured(s24, availability_status, available).
measured(s27, availability_status, available).
measured(s28, availability_status, available).
measured(s29, availability_status, available).
measured(s30, availability_status, available).
measured(s31, availability_status, available).

all_consistent(availability_status) :-
    consistent(s2, availability_status),
    consistent(s9, availability_status),
    (indep(s3), consistent(s3, availability_status) ; \+indep(s3)),
    (indep(s4), consistent(s4, availability_status) ; \+indep(s4)),
    (indep(s8), consistent(s8, availability_status) ; \+indep(s8)),
    (indep(s10), consistent(s10, availability_status) ; \+indep(s10)),
    (indep(s19), consistent(s19, availability_status) ; \+indep(s19)),
    (indep(s23), consistent(s23, availability_status) ; \+indep(s23)),
    (indep(s24), consistent(s24, availability_status) ; \+indep(s24)),
    (indep(s27), consistent(s27, availability_status) ; \+indep(s27)),
    (indep(s28), consistent(s28, availability_status) ; \+indep(s28)),
    (indep(s29), consistent(s29, availability_status) ; \+indep(s29)),
    (indep(s30), consistent(s30, availability_status) ; \+indep(s30)),
    (indep(s31), consistent(s31, availability_status) ; \+indep(s31)).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, available)).
query(true_val(availability_status, unk_availability_status)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values directional=Directional tapered_directional=Tapered_directional_longer_nose_shorter_tail
% @importance 0.9125

0.94::acc(s2, shape).
0.70::acc(s3, shape).
0.88::acc(s9, shape).

0.55::true_val(shape, directional); 0.45::true_val(shape, tapered_directional).

measured(s2, shape, directional).
measured(s3, shape, directional).
measured(s9, shape, tapered_directional).

all_consistent(shape) :-
    consistent(s2, shape),
    (indep(s3), consistent(s3, shape) ; \+indep(s3)),
    consistent(s9, shape).

evidence(all_consistent(shape)).
query(true_val(shape, directional)).
query(true_val(shape, tapered_directional)).

% @attr taper
% @type numeric
% @canonical true
% @original_name taper
% @unit mm
% @values v10=10.0 unk_taper=Unknown
% @importance 0.85

0.92::acc(s7, taper).
0.88::acc(s9, taper).

0.95::true_val(taper, v10); 0.05::true_val(taper, unk_taper).

measured(s7, taper, v10).
measured(s9, taper, v10).

all_consistent(taper) :-
    consistent(s7, taper),
    consistent(s9, taper).

evidence(all_consistent(taper)).
query(true_val(taper, v10)).
query(true_val(taper, unk_taper)).

% @attr setback
% @type numeric
% @canonical true
% @original_name setback
% @unit cm
% @values v_neg1_9=neg1.9 unk_setback=Unknown
% @importance 0.95

0.94::acc(s2, setback).
0.70::acc(s3, setback).
0.85::acc(s9, setback).

0.96::true_val(setback, v_neg1_9); 0.04::true_val(setback, unk_setback).

measured(s2, setback, v_neg1_9).
measured(s3, setback, v_neg1_9).
measured(s9, setback, v_neg1_9).

all_consistent(setback) :-
    consistent(s2, setback),
    (indep(s3), consistent(s3, setback) ; \+indep(s3)),
    consistent(s9, setback).

evidence(all_consistent(setback)).
query(true_val(setback, v_neg1_9)).
query(true_val(setback, unk_setback)).

% @attr width_options
% @type categorical
% @canonical true
% @original_name width_options
% @values volume_shifted_mid_wide=Volume_Shifted_mid_wide unk_width_options=Unknown
% @importance 0.93

0.94::acc(s2, width_options).
0.70::acc(s3, width_options).
0.90::acc(s7, width_options).

0.96::true_val(width_options, volume_shifted_mid_wide); 0.04::true_val(width_options, unk_width_options).

measured(s2, width_options, volume_shifted_mid_wide).
measured(s3, width_options, volume_shifted_mid_wide).
measured(s7, width_options, volume_shifted_mid_wide).

all_consistent(width_options) :-
    consistent(s2, width_options),
    (indep(s3), consistent(s3, width_options) ; \+indep(s3)),
    consistent(s7, width_options).

evidence(all_consistent(width_options)).
query(true_val(width_options, volume_shifted_mid_wide)).
query(true_val(width_options, unk_width_options)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values six_sizes=148_151_154_157_160_163cm three_sizes=154_157_160cm
% @importance 0.95

0.94::acc(s2, available_sizes).
0.65::acc(s3, available_sizes).

0.80::true_val(available_sizes, six_sizes); 0.20::true_val(available_sizes, three_sizes).

measured(s2, available_sizes, six_sizes).
measured(s3, available_sizes, three_sizes).

all_consistent(available_sizes) :-
    consistent(s2, available_sizes),
    (indep(s3), consistent(s3, available_sizes) ; \+indep(s3)).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, six_sizes)).
query(true_val(available_sizes, three_sizes)).

% @attr volume_shift
% @type categorical
% @canonical false
% @original_name Volume shift
% @values yes_volume_shift=Yes_Volume_Shift_technology unk_volume_shift=Unknown
% @importance 0.95

0.94::acc(s2, volume_shift).
0.70::acc(s3, volume_shift).

0.95::true_val(volume_shift, yes_volume_shift); 0.05::true_val(volume_shift, unk_volume_shift).

measured(s2, volume_shift, yes_volume_shift).
measured(s3, volume_shift, yes_volume_shift).

all_consistent(volume_shift) :-
    consistent(s2, volume_shift),
    (indep(s3), consistent(s3, volume_shift) ; \+indep(s3)).

evidence(all_consistent(volume_shift)).
query(true_val(volume_shift, yes_volume_shift)).
query(true_val(volume_shift, unk_volume_shift)).

% @attr volume_shift_sizing_rec
% @type categorical
% @canonical false
% @original_name Volume shift sizing recommendation
% @values downsize_3_5cm=Downsize_3_to_5cm downsize_4_10cm=Downsize_4_to_10cm
% @importance 0.95

0.85::acc(s2a, volume_shift_sizing_rec).
0.82::acc(s2b, volume_shift_sizing_rec).
0.68::acc(s3, volume_shift_sizing_rec).

0.50::true_val(volume_shift_sizing_rec, downsize_3_5cm); 0.50::true_val(volume_shift_sizing_rec, downsize_4_10cm).

measured(s2a, volume_shift_sizing_rec, downsize_3_5cm).
measured(s2b, volume_shift_sizing_rec, downsize_4_10cm).
measured(s3, volume_shift_sizing_rec, downsize_4_10cm).

all_consistent(volume_shift_sizing_rec) :-
    consistent(s2a, volume_shift_sizing_rec),
    consistent(s2b, volume_shift_sizing_rec),
    (indep(s3), consistent(s3, volume_shift_sizing_rec) ; \+indep(s3)).

evidence(all_consistent(volume_shift_sizing_rec)).
query(true_val(volume_shift_sizing_rec, downsize_3_5cm)).
query(true_val(volume_shift_sizing_rec, downsize_4_10cm)).

0.85::acc(s2a, volume_shift_sizing_rec).
0.82::acc(s2b, volume_shift_sizing_rec).

% @attr effective_edge_148
% @type numeric
% @canonical false
% @original_name Effective edge 148cm
% @unit cm
% @values v112_0=112.0 unk_effective_edge_148=Unknown
% @importance 0.95

0.94::acc(s2, effective_edge_148).
0.70::acc(s3, effective_edge_148).

0.95::true_val(effective_edge_148, v112_0); 0.05::true_val(effective_edge_148, unk_effective_edge_148).

measured(s2, effective_edge_148, v112_0).
measured(s3, effective_edge_148, v112_0).

all_consistent(effective_edge_148) :-
    consistent(s2, effective_edge_148),
    (indep(s3), consistent(s3, effective_edge_148) ; \+indep(s3)).

evidence(all_consistent(effective_edge_148)).
query(true_val(effective_edge_148, v112_0)).
query(true_val(effective_edge_148, unk_effective_edge_148)).

% @attr tip_tail_width_size_148
% @type categorical
% @canonical false
% @original_name Tip/waist/tail 148cm
% @unit cm
% @values v29_5_24_9_28_5=29.5_24.9_28.5 unk_tip_tail_width_size_148=Unknown
% @importance 0.95

0.94::acc(s2, tip_tail_width_size_148).
0.70::acc(s3, tip_tail_width_size_148).

0.95::true_val(tip_tail_width_size_148, v29_5_24_9_28_5); 0.05::true_val(tip_tail_width_size_148, unk_tip_tail_width_size_148).

measured(s2, tip_tail_width_size_148, v29_5_24_9_28_5).
measured(s3, tip_tail_width_size_148, v29_5_24_9_28_5).

all_consistent(tip_tail_width_size_148) :-
    consistent(s2, tip_tail_width_size_148),
    (indep(s3), consistent(s3, tip_tail_width_size_148) ; \+indep(s3)).

evidence(all_consistent(tip_tail_width_size_148)).
query(true_val(tip_tail_width_size_148, v29_5_24_9_28_5)).
query(true_val(tip_tail_width_size_148, unk_tip_tail_width_size_148)).

% @attr sidecut_radius_size_148
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v6_9=6.9 unk_sidecut_radius_size_148=Unknown
% @importance 0.95

0.94::acc(s2, sidecut_radius_size_148).
0.70::acc(s3, sidecut_radius_size_148).

0.95::true_val(sidecut_radius_size_148, v6_9); 0.05::true_val(sidecut_radius_size_148, unk_sidecut_radius_size_148).

measured(s2, sidecut_radius_size_148, v6_9).
measured(s3, sidecut_radius_size_148, v6_9).

all_consistent(sidecut_radius_size_148) :-
    consistent(s2, sidecut_radius_size_148),
    (indep(s3), consistent(s3, sidecut_radius_size_148) ; \+indep(s3)).

evidence(all_consistent(sidecut_radius_size_148)).
query(true_val(sidecut_radius_size_148, v6_9)).
query(true_val(sidecut_radius_size_148, unk_sidecut_radius_size_148)).

% @attr stance_width_range_size_148
% @type numeric
% @canonical false
% @original_name stance_width_range_size
% @unit cm
% @values v48_3=48.3 unk_stance_width_range_size_148=Unknown
% @importance 0.95

0.94::acc(s2, stance_width_range_size_148).
0.70::acc(s3, stance_width_range_size_148).

0.95::true_val(stance_width_range_size_148, v48_3); 0.05::true_val(stance_width_range_size_148, unk_stance_width_range_size_148).

measured(s2, stance_width_range_size_148, v48_3).
measured(s3, stance_width_range_size_148, v48_3).

all_consistent(stance_width_range_size_148) :-
    consistent(s2, stance_width_range_size_148),
    (indep(s3), consistent(s3, stance_width_range_size_148) ; \+indep(s3)).

evidence(all_consistent(stance_width_range_size_148)).
query(true_val(stance_width_range_size_148, v48_3)).
query(true_val(stance_width_range_size_148, unk_stance_width_range_size_148)).

% @attr recommended_weight_range_size_148
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @unit kg
% @values v41_73=41_to_73kg unk_recommended_weight_range_size_148=Unknown
% @importance 0.95

0.94::acc(s2, recommended_weight_range_size_148).
0.70::acc(s3, recommended_weight_range_size_148).

0.95::true_val(recommended_weight_range_size_148, v41_73); 0.05::true_val(recommended_weight_range_size_148, unk_recommended_weight_range_size_148).

measured(s2, recommended_weight_range_size_148, v41_73).
measured(s3, recommended_weight_range_size_148, v41_73).

all_consistent(recommended_weight_range_size_148) :-
    consistent(s2, recommended_weight_range_size_148),
    (indep(s3), consistent(s3, recommended_weight_range_size_148) ; \+indep(s3)).

evidence(all_consistent(recommended_weight_range_size_148)).
query(true_val(recommended_weight_range_size_148, v41_73)).
query(true_val(recommended_weight_range_size_148, unk_recommended_weight_range_size_148)).

% @attr effective_edge_151
% @type numeric
% @canonical false
% @original_name Effective edge 151cm
% @unit cm
% @values v114_0=114.0 unk_effective_edge_151=Unknown
% @importance 0.95

0.94::acc(s2, effective_edge_151).
0.70::acc(s3, effective_edge_151).

0.95::true_val(effective_edge_151, v114_0); 0.05::true_val(effective_edge_151, unk_effective_edge_151).

measured(s2, effective_edge_151, v114_0).
measured(s3, effective_edge_151, v114_0).

all_consistent(effective_edge_151) :-
    consistent(s2, effective_edge_151),
    (indep(s3), consistent(s3, effective_edge_151) ; \+indep(s3)).

evidence(all_consistent(effective_edge_151)).
query(true_val(effective_edge_151, v114_0)).
query(true_val(effective_edge_151, unk_effective_edge_151)).

% @attr tip_tail_width_size_151
% @type categorical
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v30_0_25_3_29_0=30.0_25.3_29.0 unk_tip_tail_width_size_151=Unknown
% @importance 0.95

0.94::acc(s2, tip_tail_width_size_151).
0.70::acc(s3, tip_tail_width_size_151).

0.95::true_val(tip_tail_width_size_151, v30_0_25_3_29_0); 0.05::true_val(tip_tail_width_size_151, unk_tip_tail_width_size_151).

measured(s2, tip_tail_width_size_151, v30_0_25_3_29_0).
measured(s3, tip_tail_width_size_151, v30_0_25_3_29_0).

all_consistent(tip_tail_width_size_151) :-
    consistent(s2, tip_tail_width_size_151),
    (indep(s3), consistent(s3, tip_tail_width_size_151) ; \+indep(s3)).

evidence(all_consistent(tip_tail_width_size_151)).
query(true_val(tip_tail_width_size_151, v30_0_25_3_29_0)).
query(true_val(tip_tail_width_size_151, unk_tip_tail_width_size_151)).

% @attr sidecut_radius_size_151
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v7_1=7.1 unk_sidecut_radius_size_151=Unknown
% @importance 0.95

0.94::acc(s2, sidecut_radius_size_151).
0.70::acc(s3, sidecut_radius_size_151).

0.95::true_val(sidecut_radius_size_151, v7_1); 0.05::true_val(sidecut_radius_size_151, unk_sidecut_radius_size_151).

measured(s2, sidecut_radius_size_151, v7_1).
measured(s3, sidecut_radius_size_151, v7_1).

all_consistent(sidecut_radius_size_151) :-
    consistent(s2, sidecut_radius_size_151),
    (indep(s3), consistent(s3, sidecut_radius_size_151) ; \+indep(s3)).

evidence(all_consistent(sidecut_radius_size_151)).
query(true_val(sidecut_radius_size_151, v7_1)).
query(true_val(sidecut_radius_size_151, unk_sidecut_radius_size_151)).

% @attr stance_width_range_size_151
% @type numeric
% @canonical false
% @original_name stance_width_range_size
% @unit cm
% @values v50_8=50.8 unk_stance_width_range_size_151=Unknown
% @importance 0.95

0.94::acc(s2, stance_width_range_size_151).
0.70::acc(s3, stance_width_range_size_151).

0.95::true_val(stance_width_range_size_151, v50_8); 0.05::true_val(stance_width_range_size_151, unk_stance_width_range_size_151).

measured(s2, stance_width_range_size_151, v50_8).
measured(s3, stance_width_range_size_151, v50_8).

all_consistent(stance_width_range_size_151) :-
    consistent(s2, stance_width_range_size_151),
    (indep(s3), consistent(s3, stance_width_range_size_151) ; \+indep(s3)).

evidence(all_consistent(stance_width_range_size_151)).
query(true_val(stance_width_range_size_151, v50_8)).
query(true_val(stance_width_range_size_151, unk_stance_width_range_size_151)).

% @attr recommended_weight_range_size_151
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @unit kg
% @values v45_77=45_to_77kg unk_recommended_weight_range_size_151=Unknown
% @importance 0.95

0.94::acc(s2, recommended_weight_range_size_151).
0.70::acc(s3, recommended_weight_range_size_151).

0.95::true_val(recommended_weight_range_size_151, v45_77); 0.05::true_val(recommended_weight_range_size_151, unk_recommended_weight_range_size_151).

measured(s2, recommended_weight_range_size_151, v45_77).
measured(s3, recommended_weight_range_size_151, v45_77).

all_consistent(recommended_weight_range_size_151) :-
    consistent(s2, recommended_weight_range_size_151),
    (indep(s3), consistent(s3, recommended_weight_range_size_151) ; \+indep(s3)).

evidence(all_consistent(recommended_weight_range_size_151)).
query(true_val(recommended_weight_range_size_151, v45_77)).
query(true_val(recommended_weight_range_size_151, unk_recommended_weight_range_size_151)).

% @attr effective_edge_154
% @type numeric
% @canonical false
% @original_name Effective edge 154cm
% @unit cm
% @values v117_0=117.0 unk_effective_edge_154=Unknown
% @importance 0.95

0.94::acc(s2, effective_edge_154).
0.70::acc(s3, effective_edge_154).

0.95::true_val(effective_edge_154, v117_0); 0.05::true_val(effective_edge_154, unk_effective_edge_154).

measured(s2, effective_edge_154, v117_0).
measured(s3, effective_edge_154, v117_0).

all_consistent(effective_edge_154) :-
    consistent(s2, effective_edge_154),
    (indep(s3), consistent(s3, effective_edge_154) ; \+indep(s3)).

evidence(all_consistent(effective_edge_154)).
query(true_val(effective_edge_154, v117_0)).
query(true_val(effective_edge_154, unk_effective_edge_154)).

% @attr tip_tail_width_size_154
% @type categorical
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v30_4_25_6_29_4=30.4_25.6_29.4 unk_tip_tail_width_size_154=Unknown
% @importance 0.95

0.94::acc(s2, tip_tail_width_size_154).
0.70::acc(s3, tip_tail_width_size_154).

0.95::true_val(tip_tail_width_size_154, v30_4_25_6_29_4); 0.05::true_val(tip_tail_width_size_154, unk_tip_tail_width_size_154).

measured(s2, tip_tail_width_size_154, v30_4_25_6_29_4).
measured(s3, tip_tail_width_size_154, v30_4_25_6_29_4).

all_consistent(tip_tail_width_size_154) :-
    consistent(s2, tip_tail_width_size_154),
    (indep(s3), consistent(s3, tip_tail_width_size_154) ; \+indep(s3)).

evidence(all_consistent(tip_tail_width_size_154)).
query(true_val(tip_tail_width_size_154, v30_4_25_6_29_4)).
query(true_val(tip_tail_width_size_154, unk_tip_tail_width_size_154)).

% @attr sidecut_radius_size_154
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v7_3=7.3 unk_sidecut_radius_size_154=Unknown
% @importance 0.95

0.94::acc(s2, sidecut_radius_size_154).
0.70::acc(s3, sidecut_radius_size_154).

0.95::true_val(sidecut_radius_size_154, v7_3); 0.05::true_val(sidecut_radius_size_154, unk_sidecut_radius_size_154).

measured(s2, sidecut_radius_size_154, v7_3).
measured(s3, sidecut_radius_size_154, v7_3).

all_consistent(sidecut_radius_size_154) :-
    consistent(s2, sidecut_radius_size_154),
    (indep(s3), consistent(s3, sidecut_radius_size_154) ; \+indep(s3)).

evidence(all_consistent(sidecut_radius_size_154)).
query(true_val(sidecut_radius_size_154, v7_3)).
query(true_val(sidecut_radius_size_154, unk_sidecut_radius_size_154)).

% @attr stance_width_range_size_154
% @type numeric
% @canonical false
% @original_name stance_width_range_size
% @unit cm
% @values v53_3=53.3 unk_stance_width_range_size_154=Unknown
% @importance 0.95

0.94::acc(s2, stance_width_range_size_154).
0.70::acc(s3, stance_width_range_size_154).

0.95::true_val(stance_width_range_size_154, v53_3); 0.05::true_val(stance_width_range_size_154, unk_stance_width_range_size_154).

measured(s2, stance_width_range_size_154, v53_3).
measured(s3, stance_width_range_size_154, v53_3).

all_consistent(stance_width_range_size_154) :-
    consistent(s2, stance_width_range_size_154),
    (indep(s3), consistent(s3, stance_width_range_size_154) ; \+indep(s3)).

evidence(all_consistent(stance_width_range_size_154)).
query(true_val(stance_width_range_size_154, v53_3)).
query(true_val(stance_width_range_size_154, unk_stance_width_range_size_154)).

% @attr recommended_weight_range_size_154
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @unit kg
% @values v50_82=50_to_82kg unk_recommended_weight_range_size_154=Unknown
% @importance 0.95

0.94::acc(s2, recommended_weight_range_size_154).
0.70::acc(s3, recommended_weight_range_size_154).

0.95::true_val(recommended_weight_range_size_154, v50_82); 0.05::true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154).

measured(s2, recommended_weight_range_size_154, v50_82).
measured(s3, recommended_weight_range_size_154, v50_82).

all_consistent(recommended_weight_range_size_154) :-
    consistent(s2, recommended_weight_range_size_154),
    (indep(s3), consistent(s3, recommended_weight_range_size_154) ; \+indep(s3)).

evidence(all_consistent(recommended_weight_range_size_154)).
query(true_val(recommended_weight_range_size_154, v50_82)).
query(true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154)).

% @attr effective_edge_157
% @type numeric
% @canonical false
% @original_name Effective edge 157cm
% @unit cm
% @values v119_0=119.0 unk_effective_edge_157=Unknown
% @importance 0.95

0.94::acc(s2, effective_edge_157).
0.70::acc(s3, effective_edge_157).

0.95::true_val(effective_edge_157, v119_0); 0.05::true_val(effective_edge_157, unk_effective_edge_157).

measured(s2, effective_edge_157, v119_0).
measured(s3, effective_edge_157, v119_0).

all_consistent(effective_edge_157) :-
    consistent(s2, effective_edge_157),
    (indep(s3), consistent(s3, effective_edge_157) ; \+indep(s3)).

evidence(all_consistent(effective_edge_157)).
query(true_val(effective_edge_157, v119_0)).
query(true_val(effective_edge_157, unk_effective_edge_157)).

% @attr tip_tail_width_size
% @type categorical
% @canonical true
% @original_name tip_tail_width_size
% @unit cm
% @values v30_8_25_9_29_8=30.8_25.9_29.8 unk_tip_tail_width_size=Unknown
% @importance 0.95

0.94::acc(s2, tip_tail_width_size).
0.70::acc(s3, tip_tail_width_size).

0.95::true_val(tip_tail_width_size, v30_8_25_9_29_8); 0.05::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s2, tip_tail_width_size, v30_8_25_9_29_8).
measured(s3, tip_tail_width_size, v30_8_25_9_29_8).

all_consistent(tip_tail_width_size) :-
    consistent(s2, tip_tail_width_size),
    (indep(s3), consistent(s3, tip_tail_width_size) ; \+indep(s3)).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v30_8_25_9_29_8)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr sidecut_radius_size
% @type numeric
% @canonical true
% @original_name sidecut_radius_size
% @unit m
% @values v7_5=7.5 unk_sidecut_radius_size=Unknown
% @importance 0.95

0.94::acc(s2, sidecut_radius_size).
0.70::acc(s3, sidecut_radius_size).

0.95::true_val(sidecut_radius_size, v7_5); 0.05::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s2, sidecut_radius_size, v7_5).
measured(s3, sidecut_radius_size, v7_5).

all_consistent(sidecut_radius_size) :-
    consistent(s2, sidecut_radius_size),
    (indep(s3), consistent(s3, sidecut_radius_size) ; \+indep(s3)).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_5)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr stance_width_range_size
% @type numeric
% @canonical true
% @original_name stance_width_range_size
% @unit cm
% @values v53_3=53.3 unk_stance_width_range_size=Unknown
% @importance 0.95

0.94::acc(s2, stance_width_range_size).
0.70::acc(s3, stance_width_range_size).

0.95::true_val(stance_width_range_size, v53_3); 0.05::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s2, stance_width_range_size, v53_3).
measured(s3, stance_width_range_size, v53_3).

all_consistent(stance_width_range_size) :-
    consistent(s2, stance_width_range_size),
    (indep(s3), consistent(s3, stance_width_range_size) ; \+indep(s3)).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v53_3)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size
% @unit kg
% @values v54_86=54_to_86kg unk_recommended_weight_range_size=Unknown
% @importance 0.95

0.94::acc(s2, recommended_weight_range_size).
0.70::acc(s3, recommended_weight_range_size).

0.95::true_val(recommended_weight_range_size, v54_86); 0.05::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s2, recommended_weight_range_size, v54_86).
measured(s3, recommended_weight_range_size, v54_86).

all_consistent(recommended_weight_range_size) :-
    consistent(s2, recommended_weight_range_size),
    (indep(s3), consistent(s3, recommended_weight_range_size) ; \+indep(s3)).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, v54_86)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr effective_edge_160
% @type numeric
% @canonical false
% @original_name Effective edge 160cm
% @unit cm
% @values v122_0=122.0 unk_effective_edge_160=Unknown
% @importance 0.95

0.94::acc(s2, effective_edge_160).
0.70::acc(s3, effective_edge_160).

0.95::true_val(effective_edge_160, v122_0); 0.05::true_val(effective_edge_160, unk_effective_edge_160).

measured(s2, effective_edge_160, v122_0).
measured(s3, effective_edge_160, v122_0).

all_consistent(effective_edge_160) :-
    consistent(s2, effective_edge_160),
    (indep(s3), consistent(s3, effective_edge_160) ; \+indep(s3)).

evidence(all_consistent(effective_edge_160)).
query(true_val(effective_edge_160, v122_0)).
query(true_val(effective_edge_160, unk_effective_edge_160)).

% @attr tip_tail_width_size_160
% @type categorical
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v31_2_26_2_30_2=31.2_26.2_30.2 unk_tip_tail_width_size_160=Unknown
% @importance 0.95

0.94::acc(s2, tip_tail_width_size_160).
0.70::acc(s3, tip_tail_width_size_160).

0.95::true_val(tip_tail_width_size_160, v31_2_26_2_30_2); 0.05::true_val(tip_tail_width_size_160, unk_tip_tail_width_size_160).

measured(s2, tip_tail_width_size_160, v31_2_26_2_30_2).
measured(s3, tip_tail_width_size_160, v31_2_26_2_30_2).

all_consistent(tip_tail_width_size_160) :-
    consistent(s2, tip_tail_width_size_160),
    (indep(s3), consistent(s3, tip_tail_width_size_160) ; \+indep(s3)).

evidence(all_consistent(tip_tail_width_size_160)).
query(true_val(tip_tail_width_size_160, v31_2_26_2_30_2)).
query(true_val(tip_tail_width_size_160, unk_tip_tail_width_size_160)).

% @attr sidecut_radius_size_160
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v7_7=7.7 unk_sidecut_radius_size_160=Unknown
% @importance 0.95

0.94::acc(s2, sidecut_radius_size_160).
0.70::acc(s3, sidecut_radius_size_160).

0.95::true_val(sidecut_radius_size_160, v7_7); 0.05::true_val(sidecut_radius_size_160, unk_sidecut_radius_size_160).

measured(s2, sidecut_radius_size_160, v7_7).
measured(s3, sidecut_radius_size_160, v7_7).

all_consistent(sidecut_radius_size_160) :-
    consistent(s2, sidecut_radius_size_160),
    (indep(s3), consistent(s3, sidecut_radius_size_160) ; \+indep(s3)).

evidence(all_consistent(sidecut_radius_size_160)).
query(true_val(sidecut_radius_size_160, v7_7)).
query(true_val(sidecut_radius_size_160, unk_sidecut_radius_size_160)).

% @attr stance_width_range_size_160
% @type numeric
% @canonical false
% @original_name stance_width_range_size
% @unit cm
% @values v55_9=55.9 unk_stance_width_range_size_160=Unknown
% @importance 0.95

0.94::acc(s2, stance_width_range_size_160).
0.70::acc(s3, stance_width_range_size_160).

0.95::true_val(stance_width_range_size_160, v55_9); 0.05::true_val(stance_width_range_size_160, unk_stance_width_range_size_160).

measured(s2, stance_width_range_size_160, v55_9).
measured(s3, stance_width_range_size_160, v55_9).

all_consistent(stance_width_range_size_160) :-
    consistent(s2, stance_width_range_size_160),
    (indep(s3), consistent(s3, stance_width_range_size_160) ; \+indep(s3)).

evidence(all_consistent(stance_width_range_size_160)).
query(true_val(stance_width_range_size_160, v55_9)).
query(true_val(stance_width_range_size_160, unk_stance_width_range_size_160)).

% @attr recommended_weight_range_size_160
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @unit kg
% @values v59_91=59_to_91kg unk_recommended_weight_range_size_160=Unknown
% @importance 0.95

0.94::acc(s2, recommended_weight_range_size_160).
0.70::acc(s3, recommended_weight_range_size_160).

0.95::true_val(recommended_weight_range_size_160, v59_91); 0.05::true_val(recommended_weight_range_size_160, unk_recommended_weight_range_size_160).

measured(s2, recommended_weight_range_size_160, v59_91).
measured(s3, recommended_weight_range_size_160, v59_91).

all_consistent(recommended_weight_range_size_160) :-
    consistent(s2, recommended_weight_range_size_160),
    (indep(s3), consistent(s3, recommended_weight_range_size_160) ; \+indep(s3)).

evidence(all_consistent(recommended_weight_range_size_160)).
query(true_val(recommended_weight_range_size_160, v59_91)).
query(true_val(recommended_weight_range_size_160, unk_recommended_weight_range_size_160)).

% @attr effective_edge_163
% @type numeric
% @canonical false
% @original_name Effective edge 163cm
% @unit cm
% @values v124_0=124.0 unk_effective_edge_163=Unknown
% @importance 0.95

0.94::acc(s2, effective_edge_163).
0.70::acc(s3, effective_edge_163).

0.95::true_val(effective_edge_163, v124_0); 0.05::true_val(effective_edge_163, unk_effective_edge_163).

measured(s2, effective_edge_163, v124_0).
measured(s3, effective_edge_163, v124_0).

all_consistent(effective_edge_163) :-
    consistent(s2, effective_edge_163),
    (indep(s3), consistent(s3, effective_edge_163) ; \+indep(s3)).

evidence(all_consistent(effective_edge_163)).
query(true_val(effective_edge_163, v124_0)).
query(true_val(effective_edge_163, unk_effective_edge_163)).

% @attr tip_tail_width_size_163
% @type categorical
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v31_6_26_5_30_6=31.6_26.5_30.6 unk_tip_tail_width_size_163=Unknown
% @importance 0.95

0.94::acc(s2, tip_tail_width_size_163).
0.70::acc(s3, tip_tail_width_size_163).

0.95::true_val(tip_tail_width_size_163, v31_6_26_5_30_6); 0.05::true_val(tip_tail_width_size_163, unk_tip_tail_width_size_163).

measured(s2, tip_tail_width_size_163, v31_6_26_5_30_6).
measured(s3, tip_tail_width_size_163, v31_6_26_5_30_6).

all_consistent(tip_tail_width_size_163) :-
    consistent(s2, tip_tail_width_size_163),
    (indep(s3), consistent(s3, tip_tail_width_size_163) ; \+indep(s3)).

evidence(all_consistent(tip_tail_width_size_163)).
query(true_val(tip_tail_width_size_163, v31_6_26_5_30_6)).
query(true_val(tip_tail_width_size_163, unk_tip_tail_width_size_163)).

% @attr sidecut_radius_size_163
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v7_9=7.9 unk_sidecut_radius_size_163=Unknown
% @importance 0.95

0.94::acc(s2, sidecut_radius_size_163).
0.70::acc(s3, sidecut_radius_size_163).

0.95::true_val(sidecut_radius_size_163, v7_9); 0.05::true_val(sidecut_radius_size_163, unk_sidecut_radius_size_163).

measured(s2, sidecut_radius_size_163, v7_9).
measured(s3, sidecut_radius_size_163, v7_9).

all_consistent(sidecut_radius_size_163) :-
    consistent(s2, sidecut_radius_size_163),
    (indep(s3), consistent(s3, sidecut_radius_size_163) ; \+indep(s3)).

evidence(all_consistent(sidecut_radius_size_163)).
query(true_val(sidecut_radius_size_163, v7_9)).
query(true_val(sidecut_radius_size_163, unk_sidecut_radius_size_163)).

% @attr stance_width_range_size_163
% @type numeric
% @canonical false
% @original_name stance_width_range_size
% @unit cm
% @values v58_4=58.4 unk_stance_width_range_size_163=Unknown
% @importance 0.95

0.94::acc(s2, stance_width_range_size_163).
0.70::acc(s3, stance_width_range_size_163).

0.95::true_val(stance_width_range_size_163, v58_4); 0.05::true_val(stance_width_range_size_163, unk_stance_width_range_size_163).

measured(s2, stance_width_range_size_163, v58_4).
measured(s3, stance_width_range_size_163, v58_4).

all_consistent(stance_width_range_size_163) :-
    consistent(s2, stance_width_range_size_163),
    (indep(s3), consistent(s3, stance_width_range_size_163) ; \+indep(s3)).

evidence(all_consistent(stance_width_range_size_163)).
query(true_val(stance_width_range_size_163, v58_4)).
query(true_val(stance_width_range_size_163, unk_stance_width_range_size_163)).

% @attr recommended_weight_range_size_163
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @unit kg
% @values v59_91=59_to_91kg unk_recommended_weight_range_size_163=Unknown
% @importance 0.95

0.94::acc(s2, recommended_weight_range_size_163).
0.70::acc(s3, recommended_weight_range_size_163).

0.95::true_val(recommended_weight_range_size_163, v59_91); 0.05::true_val(recommended_weight_range_size_163, unk_recommended_weight_range_size_163).

measured(s2, recommended_weight_range_size_163, v59_91).
measured(s3, recommended_weight_range_size_163, v59_91).

all_consistent(recommended_weight_range_size_163) :-
    consistent(s2, recommended_weight_range_size_163),
    (indep(s3), consistent(s3, recommended_weight_range_size_163) ; \+indep(s3)).

evidence(all_consistent(recommended_weight_range_size_163)).
query(true_val(recommended_weight_range_size_163, v59_91)).
query(true_val(recommended_weight_range_size_163, unk_recommended_weight_range_size_163)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values directional_combination_camber=Directional_Combination_Camber unk_camber_type=Unknown
% @importance 0.95

0.94::acc(s2, camber_type).
0.70::acc(s3, camber_type).

0.95::true_val(camber_type, directional_combination_camber); 0.05::true_val(camber_type, unk_camber_type).

measured(s2, camber_type, directional_combination_camber).
measured(s3, camber_type, directional_combination_camber).

all_consistent(camber_type) :-
    consistent(s2, camber_type),
    (indep(s3), consistent(s3, camber_type) ; \+indep(s3)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, directional_combination_camber)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values camber_rocker_combo=Camber_underfoot_rocker_tail_early_rise_nose unk_camber_description=Unknown
% @importance 0.97

0.92::acc(s7, camber_description).
0.93::acc(s2, camber_description).
0.70::acc(s3, camber_description).

0.96::true_val(camber_description, camber_rocker_combo); 0.04::true_val(camber_description, unk_camber_description).

measured(s7, camber_description, camber_rocker_combo).
measured(s2, camber_description, camber_rocker_combo).
measured(s3, camber_description, camber_rocker_combo).

all_consistent(camber_description) :-
    consistent(s7, camber_description),
    consistent(s2, camber_description),
    (indep(s3), consistent(s3, camber_description) ; \+indep(s3)).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, camber_rocker_combo)).
query(true_val(camber_description, unk_camber_description)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @original_name flex_rating_10
% @unit /10
% @values v6=6.0 unk_flex_rating_10=Unknown
% @importance 0.875

0.72::acc(s3, flex_rating_10).
0.82::acc(s8, flex_rating_10).

0.95::true_val(flex_rating_10, v6); 0.05::true_val(flex_rating_10, unk_flex_rating_10).

measured(s3, flex_rating_10, v6).
measured(s8, flex_rating_10, v6).

all_consistent(flex_rating_10) :-
    (indep(s3), consistent(s3, flex_rating_10) ; \+indep(s3)),
    (indep(s8), consistent(s8, flex_rating_10) ; \+indep(s8)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v6)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values medium=Medium medium_stiff=Medium_bordering_medium_stiff
% @importance 0.92

0.88::acc(s2, flex_feel).
0.87::acc(s9, flex_feel).
0.78::acc(s8, flex_feel).

0.60::true_val(flex_feel, medium); 0.40::true_val(flex_feel, medium_stiff).

measured(s2, flex_feel, medium).
measured(s9, flex_feel, medium_stiff).
measured(s8, flex_feel, medium).

all_consistent(flex_feel) :-
    consistent(s2, flex_feel),
    consistent(s9, flex_feel),
    (indep(s8), consistent(s8, flex_feel) ; \+indep(s8)).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium)).
query(true_val(flex_feel, medium_stiff)).

% @attr flex_direction
% @type categorical
% @canonical false
% @original_name flex_direction
% @values directional_stiffer_tail_softer_nose=Directional_stiffer_tail_softer_nose unk_flex_direction=Unknown
% @importance 0.95

0.92::acc(s7, flex_direction).
0.87::acc(s9, flex_direction).

0.95::true_val(flex_direction, directional_stiffer_tail_softer_nose); 0.05::true_val(flex_direction, unk_flex_direction).

measured(s7, flex_direction, directional_stiffer_tail_softer_nose).
measured(s9, flex_direction, directional_stiffer_tail_softer_nose).

all_consistent(flex_direction) :-
    consistent(s7, flex_direction),
    consistent(s9, flex_direction).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional_stiffer_tail_softer_nose)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values hybritech=Hybritech_sidewall_capped_tip_tail unk_sidewall_material=Unknown
% @importance 0.675

0.82::acc(s34, sidewall_material).
0.88::acc(s35, sidewall_material).

0.95::true_val(sidewall_material, hybritech); 0.05::true_val(sidewall_material, unk_sidewall_material).

measured(s34, sidewall_material, hybritech).
measured(s35, sidewall_material, hybritech).

all_consistent(sidewall_material) :-
    (indep(s34), consistent(s34, sidewall_material) ; \+indep(s34)),
    consistent(s35, sidewall_material).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, hybritech)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values s1_core_bamboo_aspen_paulownia=S1_Core_Bamboo_Aspen_Paulownia unk_core_material=Unknown
% @importance 0.95

0.94::acc(s2, core_material).
0.70::acc(s3, core_material).
0.82::acc(s23, core_material).

0.96::true_val(core_material, s1_core_bamboo_aspen_paulownia); 0.04::true_val(core_material, unk_core_material).

measured(s2, core_material, s1_core_bamboo_aspen_paulownia).
measured(s3, core_material, s1_core_bamboo_aspen_paulownia).
measured(s23, core_material, s1_core_bamboo_aspen_paulownia).

all_consistent(core_material) :-
    consistent(s2, core_material),
    (indep(s3), consistent(s3, core_material) ; \+indep(s3)),
    (indep(s23), consistent(s23, core_material) ; \+indep(s23)).

evidence(all_consistent(core_material)).
query(true_val(core_material, s1_core_bamboo_aspen_paulownia)).
query(true_val(core_material, unk_core_material)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values triax=Triaxial_45_45_0 unk_laminate=Unknown
% @importance 0.88

0.94::acc(s2, laminate).
0.70::acc(s3, laminate).
0.65::acc(s26, laminate).

0.96::true_val(laminate, triax); 0.04::true_val(laminate, unk_laminate).

measured(s2, laminate, triax).
measured(s3, laminate, triax).
measured(s26, laminate, triax).

all_consistent(laminate) :-
    consistent(s2, laminate),
    (indep(s3), consistent(s3, laminate) ; \+indep(s3)),
    (indep(s26), consistent(s26, laminate) ; \+indep(s26)).

evidence(all_consistent(laminate)).
query(true_val(laminate, triax)).
query(true_val(laminate, unk_laminate)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values carbon_y_beam=Carbon_Y_Beam_snap_stability unk_construction_material_innovation=Unknown
% @importance 0.95

0.94::acc(s2, construction_material_innovation).
0.70::acc(s3, construction_material_innovation).
0.92::acc(s7, construction_material_innovation).

0.96::true_val(construction_material_innovation, carbon_y_beam); 0.04::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s2, construction_material_innovation, carbon_y_beam).
measured(s3, construction_material_innovation, carbon_y_beam).
measured(s7, construction_material_innovation, carbon_y_beam).

all_consistent(construction_material_innovation) :-
    consistent(s2, construction_material_innovation),
    (indep(s3), consistent(s3, construction_material_innovation) ; \+indep(s3)),
    consistent(s7, construction_material_innovation).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, carbon_y_beam)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr resin
% @type categorical
% @canonical false
% @original_name resin
% @values bio_resin=Bio_Resin_plant_based_epoxy unk_resin=Unknown
% @importance 0.775

0.94::acc(s2, resin).
0.78::acc(s19, resin).

0.95::true_val(resin, bio_resin); 0.05::true_val(resin, unk_resin).

measured(s2, resin, bio_resin).
measured(s19, resin, bio_resin).

all_consistent(resin) :-
    consistent(s2, resin),
    (indep(s19), consistent(s19, resin) ; \+indep(s19)).

evidence(all_consistent(resin)).
query(true_val(resin, bio_resin)).
query(true_val(resin, unk_resin)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values wax_infused_sintered_4001=Wax_Infused_Sintered_4001 unk_base_material=Unknown
% @importance 0.93

0.94::acc(s2, base_material).
0.70::acc(s3, base_material).
0.70::acc(s10, base_material).

0.96::true_val(base_material, wax_infused_sintered_4001); 0.04::true_val(base_material, unk_base_material).

measured(s2, base_material, wax_infused_sintered_4001).
measured(s3, base_material, wax_infused_sintered_4001).
measured(s10, base_material, wax_infused_sintered_4001).

all_consistent(base_material) :-
    consistent(s2, base_material),
    (indep(s3), consistent(s3, base_material) ; \+indep(s3)),
    (indep(s10), consistent(s10, base_material) ; \+indep(s10)).

evidence(all_consistent(base_material)).
query(true_val(base_material, wax_infused_sintered_4001)).
query(true_val(base_material, unk_base_material)).

% @attr base_type
% @type categorical
% @canonical false
% @original_name base_type
% @values stone_ground=Stone_Ground unk_base_type=Unknown
% @importance 0.775

0.94::acc(s2, base_type).
0.78::acc(s19, base_type).

0.95::true_val(base_type, stone_ground); 0.05::true_val(base_type, unk_base_type).

measured(s2, base_type, stone_ground).
measured(s19, base_type, stone_ground).

all_consistent(base_type) :-
    consistent(s2, base_type),
    (indep(s19), consistent(s19, base_type) ; \+indep(s19)).

evidence(all_consistent(base_type)).
query(true_val(base_type, stone_ground)).
query(true_val(base_type, unk_base_type)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values base_contour_3d_3mm=3D_Base_Contour_3mm_spoon_tip_tail unk_edge_technology=Unknown
% @importance 0.85

0.94::acc(s2, edge_technology).
0.70::acc(s27, edge_technology).
0.92::acc(s7, edge_technology).

0.96::true_val(edge_technology, base_contour_3d_3mm); 0.04::true_val(edge_technology, unk_edge_technology).

measured(s2, edge_technology, base_contour_3d_3mm).
measured(s27, edge_technology, base_contour_3d_3mm).
measured(s7, edge_technology, base_contour_3d_3mm).

all_consistent(edge_technology) :-
    consistent(s2, edge_technology),
    (indep(s27), consistent(s27, edge_technology) ; \+indep(s27)),
    consistent(s7, edge_technology).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, base_contour_3d_3mm)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values pattern_2x4=2x4_tighter_hole_pattern unk_mounting_pattern=Unknown
% @importance 0.825

0.94::acc(s2, mounting_pattern).
0.70::acc(s3, mounting_pattern).
0.65::acc(s26, mounting_pattern).

0.96::true_val(mounting_pattern, pattern_2x4); 0.04::true_val(mounting_pattern, unk_mounting_pattern).

measured(s2, mounting_pattern, pattern_2x4).
measured(s3, mounting_pattern, pattern_2x4).
measured(s26, mounting_pattern, pattern_2x4).

all_consistent(mounting_pattern) :-
    consistent(s2, mounting_pattern),
    (indep(s3), consistent(s3, mounting_pattern) ; \+indep(s3)),
    (indep(s26), consistent(s26, mounting_pattern) ; \+indep(s26)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, pattern_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values int_adv_expert=Intermediate_Advanced_Expert unk_rider_level=Unknown
% @importance 1.0

0.94::acc(s2, rider_level).

0.92::true_val(rider_level, int_adv_expert); 0.08::true_val(rider_level, unk_rider_level).

measured(s2, rider_level, int_adv_expert).

all_consistent(rider_level) :- consistent(s2, rider_level).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, int_adv_expert)).
query(true_val(rider_level, unk_rider_level)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values int_adv=Intermediate_to_Advanced unk_skill_level_recommendation=Unknown
% @importance 0.9

0.72::acc(s3, skill_level_recommendation).

0.64::true_val(skill_level_recommendation, int_adv); 0.36::true_val(skill_level_recommendation, unk_skill_level_recommendation).

measured(s3, skill_level_recommendation, int_adv).

all_consistent(skill_level_recommendation) :-
    (indep(s3), consistent(s3, skill_level_recommendation) ; \+indep(s3)).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, int_adv)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values freeride_all_mountain=Freeride_BigMtn_Freestyle_Powder_Piste_Speed unk_terrain_suitability=Unknown
% @importance 0.93

0.94::acc(s2, terrain_suitability).
0.82::acc(s23, terrain_suitability).
0.90::acc(s7, terrain_suitability).

0.96::true_val(terrain_suitability, freeride_all_mountain); 0.04::true_val(terrain_suitability, unk_terrain_suitability).

measured(s2, terrain_suitability, freeride_all_mountain).
measured(s23, terrain_suitability, freeride_all_mountain).
measured(s7, terrain_suitability, freeride_all_mountain).

all_consistent(terrain_suitability) :-
    consistent(s2, terrain_suitability),
    (indep(s23), consistent(s23, terrain_suitability) ; \+indep(s23)),
    consistent(s7, terrain_suitability).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, freeride_all_mountain)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr riding_style
% @type categorical
% @canonical false
% @original_name riding_style
% @values freeride_freestyle_versatility=Freeride_with_freestyle_versatility unk_riding_style=Unknown
% @importance 0.85

0.85::acc(s23, riding_style).

0.74::true_val(riding_style, freeride_freestyle_versatility); 0.26::true_val(riding_style, unk_riding_style).

measured(s23, riding_style, freeride_freestyle_versatility).

all_consistent(riding_style) :-
    (indep(s23), consistent(s23, riding_style) ; \+indep(s23)).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, freeride_freestyle_versatility)).
query(true_val(riding_style, unk_riding_style)).

% @attr warranty
% @type categorical
% @canonical false
% @original_name warranty
% @values five_year=5_year_warranty_defects_material_craftsmanship unk_warranty=Unknown
% @importance 0.825

0.85::acc(s24, warranty).
0.82::acc(s8, warranty).

0.95::true_val(warranty, five_year); 0.05::true_val(warranty, unk_warranty).

measured(s24, warranty, five_year).
measured(s8, warranty, five_year).

all_consistent(warranty) :-
    (indep(s24), consistent(s24, warranty) ; \+indep(s24)),
    (indep(s8), consistent(s8, warranty) ; \+indep(s8)).

evidence(all_consistent(warranty)).
query(true_val(warranty, five_year)).
query(true_val(warranty, unk_warranty)).

% @attr powder_rating_tgr
% @type categorical
% @canonical true
% @original_name powder_rating_tgr
% @values good=Good unk_powder_rating_tgr=Unknown
% @importance 0.95

0.87::acc(s9, powder_rating_tgr).

0.78::true_val(powder_rating_tgr, good); 0.22::true_val(powder_rating_tgr, unk_powder_rating_tgr).

measured(s9, powder_rating_tgr, good).

all_consistent(powder_rating_tgr) :- consistent(s9, powder_rating_tgr).

evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, good)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values good=Good unk_base_glide_performance=Unknown
% @importance 0.95

0.87::acc(s9, base_glide_performance).

0.78::true_val(base_glide_performance, good); 0.22::true_val(base_glide_performance, unk_base_glide_performance).

measured(s9, base_glide_performance, good).

all_consistent(base_glide_performance) :- consistent(s9, base_glide_performance).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, good)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr carving_rating_tgr
% @type categorical
% @canonical true
% @original_name carving_rating_tgr
% @values great=Great unk_carving_rating_tgr=Unknown
% @importance 0.95

0.87::acc(s9, carving_rating_tgr).

0.78::true_val(carving_rating_tgr, great); 0.22::true_val(carving_rating_tgr, unk_carving_rating_tgr).

measured(s9, carving_rating_tgr, great).

all_consistent(carving_rating_tgr) :- consistent(s9, carving_rating_tgr).

evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, great)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

% @attr speed_rating_tgr
% @type categorical
% @canonical true
% @original_name speed_rating_tgr
% @values great=Great unk_speed_rating_tgr=Unknown
% @importance 0.95

0.87::acc(s9, speed_rating_tgr).

0.78::true_val(speed_rating_tgr, great); 0.22::true_val(speed_rating_tgr, unk_speed_rating_tgr).

measured(s9, speed_rating_tgr, great).

all_consistent(speed_rating_tgr) :- consistent(s9, speed_rating_tgr).

evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, great)).
query(true_val(speed_rating_tgr, unk_speed_rating_tgr)).

% @attr uneven_snow
% @type categorical
% @canonical false
% @original_name Uneven snow
% @values great=Great unk_uneven_snow=Unknown
% @importance 0.95

0.87::acc(s9, uneven_snow).

0.78::true_val(uneven_snow, great); 0.22::true_val(uneven_snow, unk_uneven_snow).

measured(s9, uneven_snow, great).

all_consistent(uneven_snow) :- consistent(s9, uneven_snow).

evidence(all_consistent(uneven_snow)).
query(true_val(uneven_snow, great)).
query(true_val(uneven_snow, unk_uneven_snow)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values average=Average unk_switch_riding=Unknown
% @importance 0.95

0.87::acc(s9, switch_riding).

0.78::true_val(switch_riding, average); 0.22::true_val(switch_riding, unk_switch_riding).

measured(s9, switch_riding, average).

all_consistent(switch_riding) :- consistent(s9, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, average)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr jumps_rating_tgr
% @type categorical
% @canonical true
% @original_name jumps_rating_tgr
% @values good=Good unk_jumps_rating_tgr=Unknown
% @importance 0.95

0.87::acc(s9, jumps_rating_tgr).

0.78::true_val(jumps_rating_tgr, good); 0.22::true_val(jumps_rating_tgr, unk_jumps_rating_tgr).

measured(s9, jumps_rating_tgr, good).

all_consistent(jumps_rating_tgr) :- consistent(s9, jumps_rating_tgr).

evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, good)).
query(true_val(jumps_rating_tgr, unk_jumps_rating_tgr)).

% @attr jibbing_rating_tgr
% @type categorical
% @canonical true
% @original_name jibbing_rating_tgr
% @values average=Average unk_jibbing_rating_tgr=Unknown
% @importance 0.95

0.87::acc(s9, jibbing_rating_tgr).

0.78::true_val(jibbing_rating_tgr, average); 0.22::true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr).

measured(s9, jibbing_rating_tgr, average).

all_consistent(jibbing_rating_tgr) :- consistent(s9, jibbing_rating_tgr).

evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, average)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr)).

% @attr pipe_rating_tgr
% @type categorical
% @canonical true
% @original_name pipe_rating_tgr
% @values good=Good unk_pipe_rating_tgr=Unknown
% @importance 0.95

0.87::acc(s9, pipe_rating_tgr).

0.78::true_val(pipe_rating_tgr, good); 0.22::true_val(pipe_rating_tgr, unk_pipe_rating_tgr).

measured(s9, pipe_rating_tgr, good).

all_consistent(pipe_rating_tgr) :- consistent(s9, pipe_rating_tgr).

evidence(all_consistent(pipe_rating_tgr)).
query(true_val(pipe_rating_tgr, good)).
query(true_val(pipe_rating_tgr, unk_pipe_rating_tgr)).

% @attr on_snow_feel_tgr
% @type categorical
% @canonical true
% @original_name on_snow_feel_tgr
% @values stable=Stable unk_on_snow_feel_tgr=Unknown
% @importance 0.95

0.87::acc(s9, on_snow_feel_tgr).

0.78::true_val(on_snow_feel_tgr, stable); 0.22::true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr).

measured(s9, on_snow_feel_tgr, stable).

all_consistent(on_snow_feel_tgr) :- consistent(s9, on_snow_feel_tgr).

evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, stable)).
query(true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values medium_fast=Medium_Fast unk_turn_initiation_performance=Unknown
% @importance 0.95

0.87::acc(s9, turn_initiation_performance).

0.78::true_val(turn_initiation_performance, medium_fast); 0.22::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s9, turn_initiation_performance, medium_fast).

all_consistent(turn_initiation_performance) :- consistent(s9, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, medium_fast)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr skidded_turns
% @type categorical
% @canonical false
% @original_name Skidded turns
% @values moderate=Moderate unk_skidded_turns=Unknown
% @importance 0.95

0.87::acc(s9, skidded_turns).

0.78::true_val(skidded_turns, moderate); 0.22::true_val(skidded_turns, unk_skidded_turns).

measured(s9, skidded_turns, moderate).

all_consistent(skidded_turns) :- consistent(s9, skidded_turns).

evidence(all_consistent(skidded_turns)).
query(true_val(skidded_turns, moderate)).
query(true_val(skidded_turns, unk_skidded_turns)).

% @attr flex_rating_10_the_good_ride
% @type categorical
% @canonical true
% @original_name flex_rating_10_the_good_ride
% @values medium_stiff=Medium_Stiff unk_flex_rating_10_the_good_ride=Unknown
% @importance 0.95

0.87::acc(s9, flex_rating_10_the_good_ride).

0.78::true_val(flex_rating_10_the_good_ride, medium_stiff); 0.22::true_val(flex_rating_10_the_good_ride, unk_flex_rating_10_the_good_ride).

measured(s9, flex_rating_10_the_good_ride, medium_stiff).

all_consistent(flex_rating_10_the_good_ride) :- consistent(s9, flex_rating_10_the_good_ride).

evidence(all_consistent(flex_rating_10_the_good_ride)).
query(true_val(flex_rating_10_the_good_ride, medium_stiff)).
query(true_val(flex_rating_10_the_good_ride, unk_flex_rating_10_the_good_ride)).

% @attr buttering
% @type categorical
% @canonical false
% @original_name Buttering
% @values moderate=Moderate unk_buttering=Unknown
% @importance 0.95

0.87::acc(s9, buttering).

0.78::true_val(buttering, moderate); 0.22::true_val(buttering, unk_buttering).

measured(s9, buttering, moderate).

all_consistent(buttering) :- consistent(s9, buttering).

evidence(all_consistent(buttering)).
query(true_val(buttering, moderate)).
query(true_val(buttering, unk_buttering)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values hard_snow_competent=Hard_Snow_competent_grip_not_best_icy unk_edge_hold=Unknown
% @importance 0.95

0.87::acc(s9, edge_hold).

0.78::true_val(edge_hold, hard_snow_competent); 0.22::true_val(edge_hold, unk_edge_hold).

measured(s9, edge_hold, hard_snow_competent).

all_consistent(edge_hold) :- consistent(s9, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, hard_snow_competent)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr approx_weight_feel
% @type categorical
% @canonical false
% @original_name Approx. weight feel
% @values feels_normal=Feels_Normal unk_approx_weight_feel=Unknown
% @importance 0.95

0.87::acc(s9, approx_weight_feel).

0.78::true_val(approx_weight_feel, feels_normal); 0.22::true_val(approx_weight_feel, unk_approx_weight_feel).

measured(s9, approx_weight_feel, feels_normal).

all_consistent(approx_weight_feel) :- consistent(s9, approx_weight_feel).

evidence(all_consistent(approx_weight_feel)).
query(true_val(approx_weight_feel, feels_normal)).
query(true_val(approx_weight_feel, unk_approx_weight_feel)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values very_versatile_ride=Very_versatile_ride unk_positive_aspect=Unknown
% @importance 0.95

0.87::acc(s9, positive_aspect).

0.78::true_val(positive_aspect, very_versatile_ride); 0.22::true_val(positive_aspect, unk_positive_aspect).

measured(s9, positive_aspect, very_versatile_ride).

all_consistent(positive_aspect) :- consistent(s9, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, very_versatile_ride)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr positive_aspect_damp
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values very_damp_chatter_resistant=Very_damp_chatter_resistant_ride unk_positive_aspect_damp=Unknown
% @importance 0.95

0.87::acc(s9, positive_aspect_damp).

0.78::true_val(positive_aspect_damp, very_damp_chatter_resistant); 0.22::true_val(positive_aspect_damp, unk_positive_aspect_damp).

measured(s9, positive_aspect_damp, very_damp_chatter_resistant).

all_consistent(positive_aspect_damp) :- consistent(s9, positive_aspect_damp).

evidence(all_consistent(positive_aspect_damp)).
query(true_val(positive_aspect_damp, very_damp_chatter_resistant)).
query(true_val(positive_aspect_damp, unk_positive_aspect_damp)).

% @attr positive_aspect_all_day
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values great_all_day_ride=Great_all_day_ride unk_positive_aspect_all_day=Unknown
% @importance 0.95

0.87::acc(s9, positive_aspect_all_day).

0.78::true_val(positive_aspect_all_day, great_all_day_ride); 0.22::true_val(positive_aspect_all_day, unk_positive_aspect_all_day).

measured(s9, positive_aspect_all_day, great_all_day_ride).

all_consistent(positive_aspect_all_day) :- consistent(s9, positive_aspect_all_day).

evidence(all_consistent(positive_aspect_all_day)).
query(true_val(positive_aspect_all_day, great_all_day_ride)).
query(true_val(positive_aspect_all_day, unk_positive_aspect_all_day)).

% @attr positive_aspect_fun_to_turn
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values fun_to_turn=Fun_to_turn unk_positive_aspect_fun_to_turn=Unknown
% @importance 0.95

0.87::acc(s9, positive_aspect_fun_to_turn).

0.78::true_val(positive_aspect_fun_to_turn, fun_to_turn); 0.22::true_val(positive_aspect_fun_to_turn, unk_positive_aspect_fun_to_turn).

measured(s9, positive_aspect_fun_to_turn, fun_to_turn).

all_consistent(positive_aspect_fun_to_turn) :- consistent(s9, positive_aspect_fun_to_turn).

evidence(all_consistent(positive_aspect_fun_to_turn)).
query(true_val(positive_aspect_fun_to_turn, fun_to_turn)).
query(true_val(positive_aspect_fun_to_turn, unk_positive_aspect_fun_to_turn)).

% @attr positive_aspect_speed
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values competent_at_speed=Pretty_competent_at_speed unk_positive_aspect_speed=Unknown
% @importance 0.95

0.87::acc(s9, positive_aspect_speed).

0.78::true_val(positive_aspect_speed, competent_at_speed); 0.22::true_val(positive_aspect_speed, unk_positive_aspect_speed).

measured(s9, positive_aspect_speed, competent_at_speed).

all_consistent(positive_aspect_speed) :- consistent(s9, positive_aspect_speed).

evidence(all_consistent(positive_aspect_speed)).
query(true_val(positive_aspect_speed, competent_at_speed)).
query(true_val(positive_aspect_speed, unk_positive_aspect_speed)).

% @attr positive_aspect_playful_stable
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values playful_stable=Playful_when_buttering_stable_at_speed unk_positive_aspect_playful_stable=Unknown
% @importance 0.8

0.80::acc(s36, positive_aspect_playful_stable).

0.61::true_val(positive_aspect_playful_stable, playful_stable); 0.39::true_val(positive_aspect_playful_stable, unk_positive_aspect_playful_stable).

measured(s36, positive_aspect_playful_stable, playful_stable).

all_consistent(positive_aspect_playful_stable) :- consistent(s36, positive_aspect_playful_stable).

evidence(all_consistent(positive_aspect_playful_stable)).
query(true_val(positive_aspect_playful_stable, playful_stable)).
query(true_val(positive_aspect_playful_stable, unk_positive_aspect_playful_stable)).

% @attr positive_aspect_surfy_feel
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values surfy_feel=Nose_and_tail_flares_add_surfy_feel unk_positive_aspect_surfy_feel=Unknown
% @importance 0.8

0.80::acc(s36, positive_aspect_surfy_feel).

0.61::true_val(positive_aspect_surfy_feel, surfy_feel); 0.39::true_val(positive_aspect_surfy_feel, unk_positive_aspect_surfy_feel).

measured(s36, positive_aspect_surfy_feel, surfy_feel).

all_consistent(positive_aspect_surfy_feel) :- consistent(s36, positive_aspect_surfy_feel).

evidence(all_consistent(positive_aspect_surfy_feel)).
query(true_val(positive_aspect_surfy_feel, surfy_feel)).
query(true_val(positive_aspect_surfy_feel, unk_positive_aspect_surfy_feel)).

% @attr positive_aspect_fun_easy_versatile
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values fun_easy_versatile=Fun_easy_to_ride_versatile_across_conditions unk_positive_aspect_fun_easy_versatile=Unknown
% @importance 0.95

0.90::acc(s7, positive_aspect_fun_easy_versatile).

0.86::true_val(positive_aspect_fun_easy_versatile, fun_easy_versatile); 0.14::true_val(positive_aspect_fun_easy_versatile, unk_positive_aspect_fun_easy_versatile).

measured(s7, positive_aspect_fun_easy_versatile, fun_easy_versatile).

all_consistent(positive_aspect_fun_easy_versatile) :- consistent(s7, positive_aspect_fun_easy_versatile).

evidence(all_consistent(positive_aspect_fun_easy_versatile)).
query(true_val(positive_aspect_fun_easy_versatile, fun_easy_versatile)).
query(true_val(positive_aspect_fun_easy_versatile, unk_positive_aspect_fun_easy_versatile)).

% @attr positive_aspect_firm_snow
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values outperforms_firm_snow=Outperforms_many_competitors_on_firm_snow unk_positive_aspect_firm_snow=Unknown
% @importance 0.95

0.90::acc(s7, positive_aspect_firm_snow).

0.86::true_val(positive_aspect_firm_snow, outperforms_firm_snow); 0.14::true_val(positive_aspect_firm_snow, unk_positive_aspect_firm_snow).

measured(s7, positive_aspect_firm_snow, outperforms_firm_snow).

all_consistent(positive_aspect_firm_snow) :- consistent(s7, positive_aspect_firm_snow).

evidence(all_consistent(positive_aspect_firm_snow)).
query(true_val(positive_aspect_firm_snow, outperforms_firm_snow)).
query(true_val(positive_aspect_firm_snow, unk_positive_aspect_firm_snow)).

% @attr positive_aspect_balanced_control
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values balanced_mid_flex_control=Balanced_mid_flex_predictable_high_speed_control unk_positive_aspect_balanced_control=Unknown
% @importance 0.82

0.85::acc(s37, positive_aspect_balanced_control).

0.69::true_val(positive_aspect_balanced_control, balanced_mid_flex_control); 0.31::true_val(positive_aspect_balanced_control, unk_positive_aspect_balanced_control).

measured(s37, positive_aspect_balanced_control, balanced_mid_flex_control).

all_consistent(positive_aspect_balanced_control) :- consistent(s37, positive_aspect_balanced_control).

evidence(all_consistent(positive_aspect_balanced_control)).
query(true_val(positive_aspect_balanced_control, balanced_mid_flex_control)).
query(true_val(positive_aspect_balanced_control, unk_positive_aspect_balanced_control)).

% @attr positive_aspect_easy_release_tail
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values easy_release_tail=Easy_to_release_tail_for_creative_lines unk_positive_aspect_easy_release_tail=Unknown
% @importance 0.82

0.85::acc(s37, positive_aspect_easy_release_tail).

0.69::true_val(positive_aspect_easy_release_tail, easy_release_tail); 0.31::true_val(positive_aspect_easy_release_tail, unk_positive_aspect_easy_release_tail).

measured(s37, positive_aspect_easy_release_tail, easy_release_tail).

all_consistent(positive_aspect_easy_release_tail) :- consistent(s37, positive_aspect_easy_release_tail).

evidence(all_consistent(positive_aspect_easy_release_tail)).
query(true_val(positive_aspect_easy_release_tail, easy_release_tail)).
query(true_val(positive_aspect_easy_release_tail, unk_positive_aspect_easy_release_tail)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values base_slow_for_price=Base_is_slow_for_the_price_point unk_negative_aspect=Unknown
% @importance 0.95

0.87::acc(s9, negative_aspect).

0.78::true_val(negative_aspect, base_slow_for_price); 0.22::true_val(negative_aspect, unk_negative_aspect).

measured(s9, negative_aspect, base_slow_for_price).

all_consistent(negative_aspect) :- consistent(s9, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, base_slow_for_price)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_pop
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values middle_ground_pop=Middle_ground_pop_not_as_springy unk_negative_aspect_pop=Unknown
% @importance 0.95

0.87::acc(s9, negative_aspect_pop).

0.78::true_val(negative_aspect_pop, middle_ground_pop); 0.22::true_val(negative_aspect_pop, unk_negative_aspect_pop).

measured(s9, negative_aspect_pop, middle_ground_pop).

all_consistent(negative_aspect_pop) :- consistent(s9, negative_aspect_pop).

evidence(all_consistent(negative_aspect_pop)).
query(true_val(negative_aspect_pop, middle_ground_pop)).
query(true_val(negative_aspect_pop, unk_negative_aspect_pop)).

% @attr negative_aspect_icy_snow
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values not_for_icy_snow=Not_the_board_for_hard_to_icy_snow unk_negative_aspect_icy_snow=Unknown
% @importance 0.95

0.87::acc(s9, negative_aspect_icy_snow).

0.78::true_val(negative_aspect_icy_snow, not_for_icy_snow); 0.22::true_val(negative_aspect_icy_snow, unk_negative_aspect_icy_snow).

measured(s9, negative_aspect_icy_snow, not_for_icy_snow).

all_consistent(negative_aspect_icy_snow) :- consistent(s9, negative_aspect_icy_snow).

evidence(all_consistent(negative_aspect_icy_snow)).
query(true_val(negative_aspect_icy_snow, not_for_icy_snow)).
query(true_val(negative_aspect_icy_snow, unk_negative_aspect_icy_snow)).

% @attr negative_aspect_folds_speed
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values folds_at_high_speeds=Folds_relatively_quickly_at_high_speeds unk_negative_aspect_folds_speed=Unknown
% @importance 0.95

0.90::acc(s7, negative_aspect_folds_speed).

0.86::true_val(negative_aspect_folds_speed, folds_at_high_speeds); 0.14::true_val(negative_aspect_folds_speed, unk_negative_aspect_folds_speed).

measured(s7, negative_aspect_folds_speed, folds_at_high_speeds).

all_consistent(negative_aspect_folds_speed) :- consistent(s7, negative_aspect_folds_speed).

evidence(all_consistent(negative_aspect_folds_speed)).
query(true_val(negative_aspect_folds_speed, folds_at_high_speeds)).
query(true_val(negative_aspect_folds_speed, unk_negative_aspect_folds_speed)).

% @attr negative_aspect_soft_flex
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values soft_flex_limitation=Softer_flex_may_not_satisfy_aggressive_riders unk_negative_aspect_soft_flex=Unknown
% @importance 0.8

0.80::acc(s36, negative_aspect_soft_flex).

0.61::true_val(negative_aspect_soft_flex, soft_flex_limitation); 0.39::true_val(negative_aspect_soft_flex, unk_negative_aspect_soft_flex).

measured(s36, negative_aspect_soft_flex, soft_flex_limitation).

all_consistent(negative_aspect_soft_flex) :- consistent(s36, negative_aspect_soft_flex).

evidence(all_consistent(negative_aspect_soft_flex)).
query(true_val(negative_aspect_soft_flex, soft_flex_limitation)).
query(true_val(negative_aspect_soft_flex, unk_negative_aspect_soft_flex)).

% @attr negative_aspect_boot_size
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values no_boot_size_recs=K2_does_not_post_boot_size_recommendations unk_negative_aspect_boot_size=Unknown
% @importance 0.95

0.87::acc(s9, negative_aspect_boot_size).

0.78::true_val(negative_aspect_boot_size, no_boot_size_recs); 0.22::true_val(negative_aspect_boot_size, unk_negative_aspect_boot_size).

measured(s9, negative_aspect_boot_size, no_boot_size_recs).

all_consistent(negative_aspect_boot_size) :- consistent(s9, negative_aspect_boot_size).

evidence(all_consistent(negative_aspect_boot_size)).
query(true_val(negative_aspect_boot_size, no_boot_size_recs)).
query(true_val(negative_aspect_boot_size, unk_negative_aspect_boot_size)).

% @attr boot_size_fit_148
% @type categorical
% @canonical false
% @original_name Boot size fit 148cm
% @values us_7_8=US_7_to_8 unk_boot_size_fit_148=Unknown
% @importance 0.95

0.85::acc(s9, boot_size_fit_148).

0.78::true_val(boot_size_fit_148, us_7_8); 0.22::true_val(boot_size_fit_148, unk_boot_size_fit_148).

measured(s9, boot_size_fit_148, us_7_8).

all_consistent(boot_size_fit_148) :- consistent(s9, boot_size_fit_148).

evidence(all_consistent(boot_size_fit_148)).
query(true_val(boot_size_fit_148, us_7_8)).
query(true_val(boot_size_fit_148, unk_boot_size_fit_148)).

% @attr boot_size_fit_151
% @type categorical
% @canonical false
% @original_name Boot size fit 151cm
% @values us_8_5_9_5=US_8.5_to_9.5 unk_boot_size_fit_151=Unknown
% @importance 0.95

0.85::acc(s9, boot_size_fit_151).

0.78::true_val(boot_size_fit_151, us_8_5_9_5); 0.22::true_val(boot_size_fit_151, unk_boot_size_fit_151).

measured(s9, boot_size_fit_151, us_8_5_9_5).

all_consistent(boot_size_fit_151) :- consistent(s9, boot_size_fit_151).

evidence(all_consistent(boot_size_fit_151)).
query(true_val(boot_size_fit_151, us_8_5_9_5)).
query(true_val(boot_size_fit_151, unk_boot_size_fit_151)).

% @attr boot_size_fit_154
% @type categorical
% @canonical false
% @original_name Boot size fit 154cm
% @values us_9_10=US_9_to_10 unk_boot_size_fit_154=Unknown
% @importance 0.95

0.85::acc(s9, boot_size_fit_154).

0.78::true_val(boot_size_fit_154, us_9_10); 0.22::true_val(boot_size_fit_154, unk_boot_size_fit_154).

measured(s9, boot_size_fit_154, us_9_10).

all_consistent(boot_size_fit_154) :- consistent(s9, boot_size_fit_154).

evidence(all_consistent(boot_size_fit_154)).
query(true_val(boot_size_fit_154, us_9_10)).
query(true_val(boot_size_fit_154, unk_boot_size_fit_154)).

% @attr boot_size_fit_157
% @type categorical
% @canonical false
% @original_name Boot size fit 157cm
% @values us_9_5_10_5=US_9.5_to_10.5 unk_boot_size_fit_157=Unknown
% @importance 0.95

0.85::acc(s9, boot_size_fit_157).

0.78::true_val(boot_size_fit_157, us_9_5_10_5); 0.22::true_val(boot_size_fit_157, unk_boot_size_fit_157).

measured(s9, boot_size_fit_157, us_9_5_10_5).

all_consistent(boot_size_fit_157) :- consistent(s9, boot_size_fit_157).

evidence(all_consistent(boot_size_fit_157)).
query(true_val(boot_size_fit_157, us_9_5_10_5)).
query(true_val(boot_size_fit_157, unk_boot_size_fit_157)).

% @attr boot_size_fit_160
% @type categorical
% @canonical false
% @original_name Boot size fit 160cm
% @values us_10_11=US_10_to_11 unk_boot_size_fit_160=Unknown
% @importance 0.95

0.85::acc(s9, boot_size_fit_160).

0.78::true_val(boot_size_fit_160, us_10_11); 0.22::true_val(boot_size_fit_160, unk_boot_size_fit_160).

measured(s9, boot_size_fit_160, us_10_11).

all_consistent(boot_size_fit_160) :- consistent(s9, boot_size_fit_160).

evidence(all_consistent(boot_size_fit_160)).
query(true_val(boot_size_fit_160, us_10_11)).
query(true_val(boot_size_fit_160, unk_boot_size_fit_160)).

% @attr boot_size_fit_163
% @type categorical
% @canonical false
% @original_name Boot size fit 163cm
% @values us_11_12=US_11_to_12 unk_boot_size_fit_163=Unknown
% @importance 0.95

0.85::acc(s9, boot_size_fit_163).

0.78::true_val(boot_size_fit_163, us_11_12); 0.22::true_val(boot_size_fit_163, unk_boot_size_fit_163).

measured(s9, boot_size_fit_163, us_11_12).

all_consistent(boot_size_fit_163) :- consistent(s9, boot_size_fit_163).

evidence(all_consistent(boot_size_fit_163)).
query(true_val(boot_size_fit_163, us_11_12)).
query(true_val(boot_size_fit_163, unk_boot_size_fit_163)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values multi_board_list=Nidecker_Megalight_Burton_Counterbalance_Amplid_Souly_Grail_etc unk_comparable_board_cross_brand=Unknown
% @importance 0.95

0.85::acc(s9, comparable_board_cross_brand).

0.78::true_val(comparable_board_cross_brand, multi_board_list); 0.22::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s9, comparable_board_cross_brand, multi_board_list).

all_consistent(comparable_board_cross_brand) :- consistent(s9, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, multi_board_list)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_tail
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values longer_tail_softer_flex=Sky_Pilot_tail_longer_more_substantial_softer_flex unk_comparable_board_cross_brand_tail=Unknown
% @importance 0.95

0.90::acc(s7, comparable_board_cross_brand_tail).

0.86::true_val(comparable_board_cross_brand_tail, longer_tail_softer_flex); 0.14::true_val(comparable_board_cross_brand_tail, unk_comparable_board_cross_brand_tail).

measured(s7, comparable_board_cross_brand_tail, longer_tail_softer_flex).

all_consistent(comparable_board_cross_brand_tail) :- consistent(s7, comparable_board_cross_brand_tail).

evidence(all_consistent(comparable_board_cross_brand_tail)).
query(true_val(comparable_board_cross_brand_tail, longer_tail_softer_flex)).
query(true_val(comparable_board_cross_brand_tail, unk_comparable_board_cross_brand_tail)).

% @attr comparable_board_cross_brand_stratos
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values vs_stratos=Stratos_narrower_surfier_Sky_Pilot_stiffer_more_stable unk_comparable_board_cross_brand_stratos=Unknown
% @importance 0.95

0.90::acc(s7, comparable_board_cross_brand_stratos).

0.86::true_val(comparable_board_cross_brand_stratos, vs_stratos); 0.14::true_val(comparable_board_cross_brand_stratos, unk_comparable_board_cross_brand_stratos).

measured(s7, comparable_board_cross_brand_stratos, vs_stratos).

all_consistent(comparable_board_cross_brand_stratos) :- consistent(s7, comparable_board_cross_brand_stratos).

evidence(all_consistent(comparable_board_cross_brand_stratos)).
query(true_val(comparable_board_cross_brand_stratos, vs_stratos)).
query(true_val(comparable_board_cross_brand_stratos, unk_comparable_board_cross_brand_stratos)).

% @attr user_review_forum
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values like_excavator_more_playful=Reminds_of_K2_Excavator_more_playful_version unk_user_review_forum=Unknown
% @importance 0.6

0.65::acc(s15, user_review_forum).

0.34::true_val(user_review_forum, like_excavator_more_playful); 0.66::true_val(user_review_forum, unk_user_review_forum).

measured(s15, user_review_forum, like_excavator_more_playful).

all_consistent(user_review_forum) :- consistent(s15, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, like_excavator_more_playful)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr award_consideration
% @type categorical
% @canonical false
% @original_name Award consideration
% @values angrysnowboarder_top5_2026=Listed_Angrysnowboarder_Top_5_contender_2026 unk_award_consideration=Unknown
% @importance 0.5

0.60::acc(s38, award_consideration).

0.39::true_val(award_consideration, angrysnowboarder_top5_2026); 0.61::true_val(award_consideration, unk_award_consideration).

measured(s38, award_consideration, angrysnowboarder_top5_2026).

all_consistent(award_consideration) :- consistent(s38, award_consideration).

evidence(all_consistent(award_consideration)).
query(true_val(award_consideration, angrysnowboarder_top5_2026)).
query(true_val(award_consideration, unk_award_consideration)).

% @attr snowboard_international_test_location
% @type categorical
% @canonical false
% @original_name Snowboard International test location
% @values are_sweden=Are_Sweden unk_snowboard_international_test_location=Unknown
% @importance 0.82

0.85::acc(s37, snowboard_international_test_location).

0.69::true_val(snowboard_international_test_location, are_sweden); 0.31::true_val(snowboard_international_test_location, unk_snowboard_international_test_location).

measured(s37, snowboard_international_test_location, are_sweden).

all_consistent(snowboard_international_test_location) :- consistent(s37, snowboard_international_test_location).

evidence(all_consistent(snowboard_international_test_location)).
query(true_val(snowboard_international_test_location, are_sweden)).
query(true_val(snowboard_international_test_location, unk_snowboard_international_test_location)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values james_sz9_5ft10_185_195_157cm=James_size9_5ft10_185_195lbs_tested_157cm unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.95

0.85::acc(s9, reviewer_opinion_the_good_ride).

0.78::true_val(reviewer_opinion_the_good_ride, james_sz9_5ft10_185_195_157cm); 0.22::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s9, reviewer_opinion_the_good_ride, james_sz9_5ft10_185_195_157cm).

all_consistent(reviewer_opinion_the_good_ride) :- consistent(s9, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, james_sz9_5ft10_185_195_157cm)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr blister_reviewer_tested
% @type categorical
% @canonical false
% @original_name Blister reviewer tested
% @values tested_157_varied_conditions=157cm_extensively_varied_conditions unk_blister_reviewer_tested=Unknown
% @importance 0.95

0.92::acc(s7, blister_reviewer_tested).

0.86::true_val(blister_reviewer_tested, tested_157_varied_conditions); 0.14::true_val(blister_reviewer_tested, unk_blister_reviewer_tested).

measured(s7, blister_reviewer_tested, tested_157_varied_conditions).

all_consistent(blister_reviewer_tested) :- consistent(s7, blister_reviewer_tested).

evidence(all_consistent(blister_reviewer_tested)).
query(true_val(blister_reviewer_tested, tested_157_varied_conditions)).
query(true_val(blister_reviewer_tested, unk_blister_reviewer_tested)).

% @attr sage_kotsenburg_film_project
% @type categorical
% @canonical false
% @original_name Sage Kotsenburg film project
% @values eternal_descent=Eternal_Descent_Japanese_pillows_Alaskan_spines unk_sage_kotsenburg_film_project=Unknown
% @importance 0.95

0.90::acc(s7, sage_kotsenburg_film_project).

0.86::true_val(sage_kotsenburg_film_project, eternal_descent); 0.14::true_val(sage_kotsenburg_film_project, unk_sage_kotsenburg_film_project).

measured(s7, sage_kotsenburg_film_project, eternal_descent).

all_consistent(sage_kotsenburg_film_project) :- consistent(s7, sage_kotsenburg_film_project).

evidence(all_consistent(sage_kotsenburg_film_project)).
query(true_val(sage_kotsenburg_film_project, eternal_descent)).
query(true_val(sage_kotsenburg_film_project, unk_sage_kotsenburg_film_project)).