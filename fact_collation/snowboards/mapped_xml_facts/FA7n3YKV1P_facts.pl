0.20::indep(s2).
0.20::indep(s3).
0.12::indep(s4).
0.20::indep(s9).
0.15::indep(s12).
0.12::indep(s13).
0.12::indep(s14).
0.12::indep(s15).
0.12::indep(s16).
0.12::indep(s17).
0.12::indep(s18).
0.15::indep(s19).
0.20::indep(s20).
0.15::indep(s26).
0.15::indep(sM).
0.80::indep(s6).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values lib_tech=Lib_Tech unk_brand=Unknown
% @importance 0.95

0.95::acc(s1, brand).
0.80::acc(s2, brand).

0.97::true_val(brand, lib_tech); 0.03::true_val(brand, unk_brand).

measured(s1, brand, lib_tech).
measured(s2, brand, lib_tech).

all_consistent(brand) :-
    consistent(s1, brand),
    (indep(s2), consistent(s2, brand) ; \+indep(s2)).

evidence(all_consistent(brand)).
query(true_val(brand, lib_tech)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values terrain_wrecker=Terrain_Wrecker unk_model_name=Unknown
% @importance 1.0

0.96::acc(s1, model_name).

0.95::true_val(model_name, terrain_wrecker); 0.05::true_val(model_name, unk_model_name).

measured(s1, model_name, terrain_wrecker).

all_consistent(model_name) :- consistent(s1, model_name).

evidence(all_consistent(model_name)).
query(true_val(model_name, terrain_wrecker)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values season_2025_2026=2025-2026 unk_model_year=Unknown
% @importance 1.0

0.96::acc(s1, model_year).

0.95::true_val(model_year, season_2025_2026); 0.05::true_val(model_year, unk_model_year).

measured(s1, model_year, season_2025_2026).

all_consistent(model_year) :- consistent(s1, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, season_2025_2026)).
query(true_val(model_year, unk_model_year)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values v2018=2018 unk_model_first_available_year=Unknown
% @importance 0.625

0.82::acc(s20, model_first_available_year).
0.78::acc(s21, model_first_available_year).

0.95::true_val(model_first_available_year, v2018); 0.05::true_val(model_first_available_year, unk_model_first_available_year).

measured(s20, model_first_available_year, v2018).
measured(s21, model_first_available_year, v2018).

all_consistent(model_first_available_year) :-
    consistent(s20, model_first_available_year),
    consistent(s21, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, v2018)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr redesign_year
% @type categorical
% @canonical true
% @original_name redesign_year
% @values newly_reshaped_nose_tail=Newly_reshaped_new_nose_and_tail unk_redesign_year=Unknown
% @importance 0.975

0.95::acc(s1, redesign_year).
0.85::acc(s22, redesign_year).

0.95::true_val(redesign_year, newly_reshaped_nose_tail); 0.05::true_val(redesign_year, unk_redesign_year).

measured(s1, redesign_year, newly_reshaped_nose_tail).
measured(s22, redesign_year, newly_reshaped_nose_tail).

all_consistent(redesign_year) :-
    consistent(s1, redesign_year),
    consistent(s22, redesign_year).

evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, newly_reshaped_nose_tail)).
query(true_val(redesign_year, unk_redesign_year)).

% @attr redesign_year_camber_change
% @type categorical
% @canonical false
% @original_name redesign_year (camber profile change)
% @values c2x_to_c2=Camber_profile_C2x_to_C2_more_stable unk_redesign_year_camber_change=Unknown
% @importance 0.95

0.80::acc(s10, redesign_year_camber_change).

0.76::true_val(redesign_year_camber_change, c2x_to_c2); 0.24::true_val(redesign_year_camber_change, unk_redesign_year_camber_change).

measured(s10, redesign_year_camber_change, c2x_to_c2).

all_consistent(redesign_year_camber_change) :- consistent(s10, redesign_year_camber_change).

evidence(all_consistent(redesign_year_camber_change)).
query(true_val(redesign_year_camber_change, c2x_to_c2)).
query(true_val(redesign_year_camber_change, unk_redesign_year_camber_change)).

% @attr redesign_year_nose_change
% @type categorical
% @canonical false
% @original_name redesign_year (nose blunted slightly)
% @values nose_blunted=Nose_blunted_slightly unk_redesign_year_nose_change=Unknown
% @importance 0.95

0.82::acc(s22, redesign_year_nose_change).

0.74::true_val(redesign_year_nose_change, nose_blunted); 0.26::true_val(redesign_year_nose_change, unk_redesign_year_nose_change).

measured(s22, redesign_year_nose_change, nose_blunted).

all_consistent(redesign_year_nose_change) :- consistent(s22, redesign_year_nose_change).

evidence(all_consistent(redesign_year_nose_change)).
query(true_val(redesign_year_nose_change, nose_blunted)).
query(true_val(redesign_year_nose_change, unk_redesign_year_nose_change)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.97::acc(s1, product_type).

0.97::true_val(product_type, snowboard); 0.03::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).

all_consistent(product_type) :- consistent(s1, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain=All_Mountain all_mountain_freeride=All_Mountain_Freeride unk_board_category=Unknown
% @importance 0.925

0.95::acc(s1, board_category).
0.88::acc(s3, board_category).
0.88::acc(sM, board_category).

0.55::true_val(board_category, all_mountain); 0.40::true_val(board_category, all_mountain_freeride); 0.05::true_val(board_category, unk_board_category).

measured(s1, board_category, all_mountain).
measured(s3, board_category, all_mountain).
measured(sM, board_category, all_mountain_freeride).

all_consistent(board_category) :-
    consistent(s1, board_category),
    (indep(s3), consistent(s3, board_category) ; \+indep(s3)),
    (indep(sM), consistent(sM, board_category) ; \+indep(sM)).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain)).
query(true_val(board_category, all_mountain_freeride)).
query(true_val(board_category, unk_board_category)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.5

0.70::acc(s4, gender).

0.67::true_val(gender, mens); 0.33::true_val(gender, unk_gender).

measured(s4, gender, mens).

all_consistent(gender) :-
    (indep(s4), consistent(s4, gender) ; \+indep(s4)).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values mervin_manufacturing=Mervin_Manufacturing unk_manufacturer=Unknown
% @importance 0.7

0.93::acc(s5, manufacturer).

0.86::true_val(manufacturer, mervin_manufacturing); 0.14::true_val(manufacturer, unk_manufacturer).

measured(s5, manufacturer, mervin_manufacturing).

all_consistent(manufacturer) :- consistent(s5, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, mervin_manufacturing)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values sequim_wa_usa=Sequim_Washington_USA unk_manufacturing_location=Unknown
% @importance 0.72

0.93::acc(s5, manufacturing_location).
0.92::acc(s6, manufacturing_location).
0.78::acc(s12, manufacturing_location).

0.95::true_val(manufacturing_location, sequim_wa_usa); 0.05::true_val(manufacturing_location, unk_manufacturing_location).

measured(s5, manufacturing_location, sequim_wa_usa).
measured(s6, manufacturing_location, sequim_wa_usa).
measured(s12, manufacturing_location, sequim_wa_usa).

all_consistent(manufacturing_location) :-
    consistent(s5, manufacturing_location),
    (indep(s6), consistent(s6, manufacturing_location) ; \+indep(s6)),
    (indep(s12), consistent(s12, manufacturing_location) ; \+indep(s12)).

evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, sequim_wa_usa)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

% @attr manufacturing_claim
% @type categorical
% @canonical false
% @original_name Manufacturing claim
% @values longest_running_last_major_usa=Longest_running_last_major_board_factory_USA unk_manufacturing_claim=Unknown
% @importance 0.65

0.88::acc(s6, manufacturing_claim).

0.87::true_val(manufacturing_claim, longest_running_last_major_usa); 0.13::true_val(manufacturing_claim, unk_manufacturing_claim).

measured(s6, manufacturing_claim, longest_running_last_major_usa).

all_consistent(manufacturing_claim) :- consistent(s6, manufacturing_claim).

evidence(all_consistent(manufacturing_claim)).
query(true_val(manufacturing_claim, longest_running_last_major_usa)).
query(true_val(manufacturing_claim, unk_manufacturing_claim)).

% @attr factory_founded
% @type categorical
% @canonical false
% @original_name Factory founded
% @values v1977_olson_saari=1977_by_Mike_Olson_and_Pete_Saari unk_factory_founded=Unknown
% @importance 0.65

0.90::acc(s6, factory_founded).

0.87::true_val(factory_founded, v1977_olson_saari); 0.13::true_val(factory_founded, unk_factory_founded).

measured(s6, factory_founded, v1977_olson_saari).

all_consistent(factory_founded) :- consistent(s6, factory_founded).

evidence(all_consistent(factory_founded)).
query(true_val(factory_founded, v1977_olson_saari)).
query(true_val(factory_founded, unk_factory_founded)).

% @attr current_owner
% @type categorical
% @canonical false
% @original_name Current owner
% @values altamont_capital_since_2013=Altamont_Capital_Partners_since_2013 unk_current_owner=Unknown
% @importance 0.4

0.72::acc(s7, current_owner).

0.71::true_val(current_owner, altamont_capital_since_2013); 0.29::true_val(current_owner, unk_current_owner).

measured(s7, current_owner, altamont_capital_since_2013).

all_consistent(current_owner) :- consistent(s7, current_owner).

evidence(all_consistent(current_owner)).
query(true_val(current_owner, altamont_capital_since_2013)).
query(true_val(current_owner, unk_current_owner)).

% @attr prior_owner
% @type categorical
% @canonical false
% @original_name Prior owner
% @values quiksilver_1997_2013=Quiksilver_1997_to_2013 unk_prior_owner=Unknown
% @importance 0.4

0.72::acc(s7, prior_owner).

0.71::true_val(prior_owner, quiksilver_1997_2013); 0.29::true_val(prior_owner, unk_prior_owner).

measured(s7, prior_owner, quiksilver_1997_2013).

all_consistent(prior_owner) :- consistent(s7, prior_owner).

evidence(all_consistent(prior_owner)).
query(true_val(prior_owner, quiksilver_1997_2013)).
query(true_val(prior_owner, unk_prior_owner)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values zero_hazardous_waste=Zero_hazardous_waste_producing_factory unk_sustainability_certification=Unknown
% @importance 0.6

0.90::acc(s5, sustainability_certification).
0.85::acc(s8, sustainability_certification).

0.95::true_val(sustainability_certification, zero_hazardous_waste); 0.05::true_val(sustainability_certification, unk_sustainability_certification).

measured(s5, sustainability_certification, zero_hazardous_waste).
measured(s8, sustainability_certification, zero_hazardous_waste).

all_consistent(sustainability_certification) :-
    consistent(s5, sustainability_certification),
    consistent(s8, sustainability_certification).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, zero_hazardous_waste)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr sustainability_certification_hydro
% @type categorical
% @canonical false
% @original_name sustainability_certification (hydroelectric)
% @values hydro_89_6_pct=89.6_pct_hydroelectric unk_sustainability_certification_hydro=Unknown
% @importance 0.5

0.83::acc(s8, sustainability_certification_hydro).

0.81::true_val(sustainability_certification_hydro, hydro_89_6_pct); 0.19::true_val(sustainability_certification_hydro, unk_sustainability_certification_hydro).

measured(s8, sustainability_certification_hydro, hydro_89_6_pct).

all_consistent(sustainability_certification_hydro) :- consistent(s8, sustainability_certification_hydro).

evidence(all_consistent(sustainability_certification_hydro)).
query(true_val(sustainability_certification_hydro, hydro_89_6_pct)).
query(true_val(sustainability_certification_hydro, unk_sustainability_certification_hydro)).

% @attr sustainability_certification_biodiesel
% @type categorical
% @canonical false
% @original_name sustainability_certification (biodiesel)
% @values renewable_biodiesel=Renewable_based_biodiesel unk_sustainability_certification_biodiesel=Unknown
% @importance 0.5

0.83::acc(s8, sustainability_certification_biodiesel).

0.81::true_val(sustainability_certification_biodiesel, renewable_biodiesel); 0.19::true_val(sustainability_certification_biodiesel, unk_sustainability_certification_biodiesel).

measured(s8, sustainability_certification_biodiesel, renewable_biodiesel).

all_consistent(sustainability_certification_biodiesel) :- consistent(s8, sustainability_certification_biodiesel).

evidence(all_consistent(sustainability_certification_biodiesel)).
query(true_val(sustainability_certification_biodiesel, renewable_biodiesel)).
query(true_val(sustainability_certification_biodiesel, unk_sustainability_certification_biodiesel)).

% @attr sustainability_certification_fsc
% @type categorical
% @canonical false
% @original_name sustainability_certification (FSC certified wood)
% @values fsc_certified_renewable=FSC_certified_fast_growing_renewable_forest_products unk_sustainability_certification_fsc=Unknown
% @importance 0.5

0.83::acc(s8, sustainability_certification_fsc).

0.81::true_val(sustainability_certification_fsc, fsc_certified_renewable); 0.19::true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc).

measured(s8, sustainability_certification_fsc, fsc_certified_renewable).

all_consistent(sustainability_certification_fsc) :- consistent(s8, sustainability_certification_fsc).

evidence(all_consistent(sustainability_certification_fsc)).
query(true_val(sustainability_certification_fsc, fsc_certified_renewable)).
query(true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc)).

% @attr sustainability_certification_sublimation
% @type categorical
% @canonical false
% @original_name sustainability_certification (eco sublimation)
% @values eco_sublimation=Eco_friendly_sublimation_process unk_sustainability_certification_sublimation=Unknown
% @importance 0.85

0.90::acc(sM, sustainability_certification_sublimation).

0.95::true_val(sustainability_certification_sublimation, eco_sublimation); 0.05::true_val(sustainability_certification_sublimation, unk_sustainability_certification_sublimation).

measured(sM, sustainability_certification_sublimation, eco_sublimation).

all_consistent(sustainability_certification_sublimation) :- consistent(sM, sustainability_certification_sublimation).

evidence(all_consistent(sustainability_certification_sublimation)).
query(true_val(sustainability_certification_sublimation, eco_sublimation)).
query(true_val(sustainability_certification_sublimation, unk_sustainability_certification_sublimation)).

% @attr sustainability_certification_fsc_yield
% @type categorical
% @canonical false
% @original_name sustainability_certification (FSC finger-joined yield)
% @values fsc_finger_joined=FSC_certified_finger_joined_to_maximize_yield unk_sustainability_certification_fsc_yield=Unknown
% @importance 0.5

0.83::acc(s8, sustainability_certification_fsc_yield).

0.81::true_val(sustainability_certification_fsc_yield, fsc_finger_joined); 0.19::true_val(sustainability_certification_fsc_yield, unk_sustainability_certification_fsc_yield).

measured(s8, sustainability_certification_fsc_yield, fsc_finger_joined).

all_consistent(sustainability_certification_fsc_yield) :- consistent(s8, sustainability_certification_fsc_yield).

evidence(all_consistent(sustainability_certification_fsc_yield)).
query(true_val(sustainability_certification_fsc_yield, fsc_finger_joined)).
query(true_val(sustainability_certification_fsc_yield, unk_sustainability_certification_fsc_yield)).

% @attr sustainability_certification_compost
% @type categorical
% @canonical false
% @original_name sustainability_certification (waste repurposed)
% @values repurposed_soil_compost=Repurposed_as_soil_compost unk_sustainability_certification_compost=Unknown
% @importance 0.5

0.83::acc(s8, sustainability_certification_compost).

0.81::true_val(sustainability_certification_compost, repurposed_soil_compost); 0.19::true_val(sustainability_certification_compost, unk_sustainability_certification_compost).

measured(s8, sustainability_certification_compost, repurposed_soil_compost).

all_consistent(sustainability_certification_compost) :- consistent(s8, sustainability_certification_compost).

evidence(all_consistent(sustainability_certification_compost)).
query(true_val(sustainability_certification_compost, repurposed_soil_compost)).
query(true_val(sustainability_certification_compost, unk_sustainability_certification_compost)).

% @attr graphic_designer_artist
% @type categorical
% @canonical true
% @original_name graphic_designer_artist
% @values schoph=Schoph unk_graphic_designer_artist=Unknown
% @importance 1.0

0.95::acc(s1, graphic_designer_artist).

0.92::true_val(graphic_designer_artist, schoph); 0.08::true_val(graphic_designer_artist, unk_graphic_designer_artist).

measured(s1, graphic_designer_artist, schoph).

all_consistent(graphic_designer_artist) :- consistent(s1, graphic_designer_artist).

evidence(all_consistent(graphic_designer_artist)).
query(true_val(graphic_designer_artist, schoph)).
query(true_val(graphic_designer_artist, unk_graphic_designer_artist)).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v599_99=599.99 unk_price_usd_msrp=Unknown
% @importance 0.95

0.96::acc(s1, price_usd_msrp).
0.85::acc(s9, price_usd_msrp).

0.95::true_val(price_usd_msrp, v599_99); 0.05::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s1, price_usd_msrp, v599_99).
measured(s9, price_usd_msrp, v599_99).

all_consistent(price_usd_msrp) :-
    consistent(s1, price_usd_msrp),
    (indep(s9), consistent(s9, price_usd_msrp) ; \+indep(s9)).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v599_99)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v999_99=999.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.93::acc(sM, price_aud_merchant).

0.95::true_val(price_aud_merchant, v999_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(sM, price_aud_merchant, v999_99).

all_consistent(price_aud_merchant) :- consistent(sM, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v999_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_evo
% @values v479_99=479.99 unk_price_usd_evo=Unknown
% @importance 0.95

0.88::acc(s10, price_usd_evo).

0.76::true_val(price_usd_evo, v479_99); 0.24::true_val(price_usd_evo, unk_price_usd_evo).

measured(s10, price_usd_evo, v479_99).

all_consistent(price_usd_evo) :- consistent(s10, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v479_99)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_backcountry
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_backcountry
% @values v509_99=509.99 unk_price_usd_backcountry=Unknown
% @importance 0.95

0.88::acc(s10, price_usd_backcountry).

0.76::true_val(price_usd_backcountry, v509_99); 0.24::true_val(price_usd_backcountry, unk_price_usd_backcountry).

measured(s10, price_usd_backcountry, v509_99).

all_consistent(price_usd_backcountry) :- consistent(s10, price_usd_backcountry).

evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v509_99)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

% @attr price_usd_sun_ski
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at Sun & Ski Sports
% @values v419_83=419.83 unk_price_usd_sun_ski=Unknown
% @importance 0.95

0.85::acc(s10, price_usd_sun_ski).

0.76::true_val(price_usd_sun_ski, v419_83); 0.24::true_val(price_usd_sun_ski, unk_price_usd_sun_ski).

measured(s10, price_usd_sun_ski, v419_83).

all_consistent(price_usd_sun_ski) :- consistent(s10, price_usd_sun_ski).

evidence(all_consistent(price_usd_sun_ski)).
query(true_val(price_usd_sun_ski, v419_83)).
query(true_val(price_usd_sun_ski, unk_price_usd_sun_ski)).

% @attr price_usd_the_house
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at The House
% @values v479_99=479.99 unk_price_usd_the_house=Unknown
% @importance 0.95

0.85::acc(s10, price_usd_the_house).

0.76::true_val(price_usd_the_house, v479_99); 0.24::true_val(price_usd_the_house, unk_price_usd_the_house).

measured(s10, price_usd_the_house, v479_99).

all_consistent(price_usd_the_house) :- consistent(s10, price_usd_the_house).

evidence(all_consistent(price_usd_the_house)).
query(true_val(price_usd_the_house, v479_99)).
query(true_val(price_usd_the_house, unk_price_usd_the_house)).

% @attr price_cad_prfo
% @type numeric
% @unit CAD
% @canonical true
% @original_name price_cad_prfo
% @values v599_99=599.99 unk_price_cad_prfo=Unknown
% @importance 0.95

0.85::acc(s10, price_cad_prfo).

0.76::true_val(price_cad_prfo, v599_99); 0.24::true_val(price_cad_prfo, unk_price_cad_prfo).

measured(s10, price_cad_prfo, v599_99).

all_consistent(price_cad_prfo) :- consistent(s10, price_cad_prfo).

evidence(all_consistent(price_cad_prfo)).
query(true_val(price_cad_prfo, v599_99)).
query(true_val(price_cad_prfo, unk_price_cad_prfo)).

% @attr price_eur_blue_tomato
% @type numeric
% @unit EUR
% @canonical true
% @original_name price_eur_blue_tomato
% @values v489=489.0 unk_price_eur_blue_tomato=Unknown
% @importance 0.85

0.75::acc(s11, price_eur_blue_tomato).

0.60::true_val(price_eur_blue_tomato, v489); 0.40::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).

measured(s11, price_eur_blue_tomato, v489).

all_consistent(price_eur_blue_tomato) :- consistent(s11, price_eur_blue_tomato).

evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v489)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

% @attr price_eur_snowcountry
% @type numeric
% @unit EUR
% @canonical false
% @original_name Price at SnowCountry (EU)
% @values v499=499.0 unk_price_eur_snowcountry=Unknown
% @importance 0.85

0.75::acc(s11, price_eur_snowcountry).

0.60::true_val(price_eur_snowcountry, v499); 0.40::true_val(price_eur_snowcountry, unk_price_eur_snowcountry).

measured(s11, price_eur_snowcountry, v499).

all_consistent(price_eur_snowcountry) :- consistent(s11, price_eur_snowcountry).

evidence(all_consistent(price_eur_snowcountry)).
query(true_val(price_eur_snowcountry, v499)).
query(true_val(price_eur_snowcountry, unk_price_eur_snowcountry)).

% @attr price_gbp_blue_tomato_uk
% @type numeric
% @unit GBP
% @canonical true
% @original_name price_gbp_blue_tomato_uk
% @values v440=440.0 unk_price_gbp_blue_tomato_uk=Unknown
% @importance 0.85

0.75::acc(s11, price_gbp_blue_tomato_uk).

0.60::true_val(price_gbp_blue_tomato_uk, v440); 0.40::true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk).

measured(s11, price_gbp_blue_tomato_uk, v440).

all_consistent(price_gbp_blue_tomato_uk) :- consistent(s11, price_gbp_blue_tomato_uk).

evidence(all_consistent(price_gbp_blue_tomato_uk)).
query(true_val(price_gbp_blue_tomato_uk, v440)).
query(true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values yes_available=Yes_available unk_availability_status=Unknown
% @importance 0.63

0.95::acc(s1, availability_status).
0.85::acc(s9, availability_status).
0.85::acc(s10, availability_status).
0.80::acc(s12, availability_status).
0.70::acc(s13, availability_status).
0.70::acc(s14, availability_status).
0.65::acc(s15, availability_status).
0.60::acc(s16, availability_status).
0.60::acc(s17, availability_status).
0.55::acc(s18, availability_status).

0.97::true_val(availability_status, yes_available); 0.03::true_val(availability_status, unk_availability_status).

measured(s1, availability_status, yes_available).
measured(s9, availability_status, yes_available).
measured(s10, availability_status, yes_available).
measured(s12, availability_status, yes_available).
measured(s13, availability_status, yes_available).
measured(s14, availability_status, yes_available).
measured(s15, availability_status, yes_available).
measured(s16, availability_status, yes_available).
measured(s17, availability_status, yes_available).
measured(s18, availability_status, yes_available).

all_consistent(availability_status) :-
    consistent(s1, availability_status),
    consistent(s10, availability_status),
    (indep(s9), consistent(s9, availability_status) ; \+indep(s9)),
    (indep(s12), consistent(s12, availability_status) ; \+indep(s12)),
    (indep(s13), consistent(s13, availability_status) ; \+indep(s13)),
    (indep(s14), consistent(s14, availability_status) ; \+indep(s14)),
    (indep(s15), consistent(s15, availability_status) ; \+indep(s15)),
    (indep(s16), consistent(s16, availability_status) ; \+indep(s16)),
    (indep(s17), consistent(s17, availability_status) ; \+indep(s17)),
    (indep(s18), consistent(s18, availability_status) ; \+indep(s18)).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, yes_available)).
query(true_val(availability_status, unk_availability_status)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values directional_twin=Directional_Twin unk_shape=Unknown
% @importance 1.0

0.96::acc(s1, shape).

0.92::true_val(shape, directional_twin); 0.08::true_val(shape, unk_shape).

measured(s1, shape, directional_twin).

all_consistent(shape) :- consistent(s1, shape).

evidence(all_consistent(shape)).
query(true_val(shape, directional_twin)).
query(true_val(shape, unk_shape)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values c2x_directional=C2x_Directional unk_camber_type=Unknown
% @importance 0.95

0.96::acc(s1, camber_type).
0.85::acc(s19, camber_type).

0.95::true_val(camber_type, c2x_directional); 0.05::true_val(camber_type, unk_camber_type).

measured(s1, camber_type, c2x_directional).
measured(s19, camber_type, c2x_directional).

all_consistent(camber_type) :-
    consistent(s1, camber_type),
    (indep(s19), consistent(s19, camber_type) ; \+indep(s19)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, c2x_directional)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values crcc_hybrid=Camber_Rocker_Camber_hybrid unk_camber_description=Unknown
% @importance 0.9

0.85::acc(s9, camber_description).

0.78::true_val(camber_description, crcc_hybrid); 0.22::true_val(camber_description, unk_camber_description).

measured(s9, camber_description, crcc_hybrid).

all_consistent(camber_description) :-
    (indep(s9), consistent(s9, camber_description) ; \+indep(s9)).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, crcc_hybrid)).
query(true_val(camber_description, unk_camber_description)).

% @attr c2x_codeveloper
% @type categorical
% @canonical false
% @original_name C2x profile co-developed with Travis Rice
% @values travis_rice=Travis_Rice unk_c2x_codeveloper=Unknown
% @importance 0.55

0.80::acc(s20, c2x_codeveloper).

0.74::true_val(c2x_codeveloper, travis_rice); 0.26::true_val(c2x_codeveloper, unk_c2x_codeveloper).

measured(s20, c2x_codeveloper, travis_rice).

all_consistent(c2x_codeveloper) :-
    (indep(s20), consistent(s20, c2x_codeveloper) ; \+indep(s20)).

evidence(all_consistent(c2x_codeveloper)).
query(true_val(c2x_codeveloper, travis_rice)).
query(true_val(c2x_codeveloper, unk_c2x_codeveloper)).

% @attr flex_rating_10_manufacturer
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10_manufacturer
% @values v6=6.0 v6_5=6.5 v7=7.0
% @importance 1.0

0.88::acc(s1, flex_rating_10_manufacturer).

0.35::true_val(flex_rating_10_manufacturer, v6); 0.40::true_val(flex_rating_10_manufacturer, v6_5); 0.25::true_val(flex_rating_10_manufacturer, v7).

measured(s1, flex_rating_10_manufacturer, v6).
measured(s1, flex_rating_10_manufacturer, v6_5).
measured(s1, flex_rating_10_manufacturer, v7).

all_consistent(flex_rating_10_manufacturer) :-
    consistent(s1, flex_rating_10_manufacturer).

evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, v6)).
query(true_val(flex_rating_10_manufacturer, v6_5)).
query(true_val(flex_rating_10_manufacturer, v7)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values medium=Medium medium_stiff=Medium_Stiff
% @importance 0.93

0.90::acc(s1, flex_feel).
0.82::acc(s9, flex_feel).
0.88::acc(sM, flex_feel).
0.88::acc(s22, flex_feel).
0.82::acc(s10, flex_feel).

0.55::true_val(flex_feel, medium); 0.45::true_val(flex_feel, medium_stiff).

measured(s1, flex_feel, medium).
measured(s9, flex_feel, medium).
measured(sM, flex_feel, medium).
measured(s22, flex_feel, medium).
measured(s10, flex_feel, medium_stiff).

all_consistent(flex_feel) :-
    consistent(s1, flex_feel),
    consistent(s22, flex_feel),
    consistent(s10, flex_feel),
    (indep(s9), consistent(s9, flex_feel) ; \+indep(s9)),
    (indep(sM), consistent(sM, flex_feel) ; \+indep(sM)).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium)).
query(true_val(flex_feel, medium_stiff)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 0.85

0.90::acc(sM, mounting_pattern).

0.95::true_val(mounting_pattern, inserts_2x4); 0.05::true_val(mounting_pattern, unk_mounting_pattern).

measured(sM, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :- consistent(sM, mounting_pattern).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr width_options
% @type categorical
% @canonical true
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 0.85

0.90::acc(sM, width_options).

0.95::true_val(width_options, standard_and_wide); 0.05::true_val(width_options, unk_width_options).

measured(sM, width_options, standard_and_wide).

all_consistent(width_options) :- consistent(sM, width_options).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values six_sizes=152_154_157_160_156W_161W unk_available_sizes=Unknown
% @importance 0.925

0.96::acc(s1, available_sizes).
0.90::acc(sM, available_sizes).

0.95::true_val(available_sizes, six_sizes); 0.05::true_val(available_sizes, unk_available_sizes).

measured(s1, available_sizes, six_sizes).
measured(sM, available_sizes, six_sizes).

all_consistent(available_sizes) :-
    consistent(s1, available_sizes),
    (indep(sM), consistent(sM, available_sizes) ; \+indep(sM)).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, six_sizes)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr specs_152
% @type categorical
% @canonical false
% @original_name 152cm contact length/sidecut/width/waist
% @values cl115_sc8_1_nt29_4_w25_3=CL115cm_SC8.1m_NT29.4cm_W25.3cm unk_specs_152=Unknown
% @importance 1.0

0.95::acc(s1, specs_152).

0.92::true_val(specs_152, cl115_sc8_1_nt29_4_w25_3); 0.08::true_val(specs_152, unk_specs_152).

measured(s1, specs_152, cl115_sc8_1_nt29_4_w25_3).

all_consistent(specs_152) :- consistent(s1, specs_152).

evidence(all_consistent(specs_152)).
query(true_val(specs_152, cl115_sc8_1_nt29_4_w25_3)).
query(true_val(specs_152, unk_specs_152)).

% @attr specs_152_stance
% @type categorical
% @canonical false
% @original_name 152cm stance range and weight range
% @values stance_20_25_to_25_wt_95plus=Stance_20.25_to_25in_0_setback_95plus_lbs unk_specs_152_stance=Unknown
% @importance 1.0

0.95::acc(s1, specs_152_stance).

0.92::true_val(specs_152_stance, stance_20_25_to_25_wt_95plus); 0.08::true_val(specs_152_stance, unk_specs_152_stance).

measured(s1, specs_152_stance, stance_20_25_to_25_wt_95plus).

all_consistent(specs_152_stance) :- consistent(s1, specs_152_stance).

evidence(all_consistent(specs_152_stance)).
query(true_val(specs_152_stance, stance_20_25_to_25_wt_95plus)).
query(true_val(specs_152_stance, unk_specs_152_stance)).

% @attr specs_154
% @type categorical
% @canonical false
% @original_name 154cm contact length/sidecut/width/waist
% @values cl117_sc8_2_nt29_6_w25_5=CL117cm_SC8.2m_NT29.6cm_W25.5cm unk_specs_154=Unknown
% @importance 1.0

0.95::acc(s1, specs_154).

0.92::true_val(specs_154, cl117_sc8_2_nt29_6_w25_5); 0.08::true_val(specs_154, unk_specs_154).

measured(s1, specs_154, cl117_sc8_2_nt29_6_w25_5).

all_consistent(specs_154) :- consistent(s1, specs_154).

evidence(all_consistent(specs_154)).
query(true_val(specs_154, cl117_sc8_2_nt29_6_w25_5)).
query(true_val(specs_154, unk_specs_154)).

% @attr recommended_weight_range_size_154
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (154cm)
% @values v100_plus_lbs=100plus_lbs_45plus_kg unk_recommended_weight_range_size_154=Unknown
% @importance 1.0

0.95::acc(s1, recommended_weight_range_size_154).

0.92::true_val(recommended_weight_range_size_154, v100_plus_lbs); 0.08::true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154).

measured(s1, recommended_weight_range_size_154, v100_plus_lbs).

all_consistent(recommended_weight_range_size_154) :- consistent(s1, recommended_weight_range_size_154).

evidence(all_consistent(recommended_weight_range_size_154)).
query(true_val(recommended_weight_range_size_154, v100_plus_lbs)).
query(true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154)).

% @attr specs_157
% @type categorical
% @canonical false
% @original_name 157cm contact length/sidecut/width/waist
% @values cl119_sc8_3_nt30_0_w25_7=CL119cm_SC8.3m_NT30.0cm_W25.7cm unk_specs_157=Unknown
% @importance 1.0

0.95::acc(s1, specs_157).

0.92::true_val(specs_157, cl119_sc8_3_nt30_0_w25_7); 0.08::true_val(specs_157, unk_specs_157).

measured(s1, specs_157, cl119_sc8_3_nt30_0_w25_7).

all_consistent(specs_157) :- consistent(s1, specs_157).

evidence(all_consistent(specs_157)).
query(true_val(specs_157, cl119_sc8_3_nt30_0_w25_7)).
query(true_val(specs_157, unk_specs_157)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size
% @values v110_plus_lbs=110plus_lbs_50plus_kg unk_recommended_weight_range_size=Unknown
% @importance 1.0

0.95::acc(s1, recommended_weight_range_size).

0.92::true_val(recommended_weight_range_size, v110_plus_lbs); 0.08::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s1, recommended_weight_range_size, v110_plus_lbs).

all_consistent(recommended_weight_range_size) :- consistent(s1, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, v110_plus_lbs)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr specs_160
% @type categorical
% @canonical false
% @original_name 160cm contact length/sidecut/width/waist
% @values cl121_sc8_4_nt30_2_w25_9=CL121cm_SC8.4m_NT30.2cm_W25.9cm unk_specs_160=Unknown
% @importance 1.0

0.95::acc(s1, specs_160).

0.92::true_val(specs_160, cl121_sc8_4_nt30_2_w25_9); 0.08::true_val(specs_160, unk_specs_160).

measured(s1, specs_160, cl121_sc8_4_nt30_2_w25_9).

all_consistent(specs_160) :- consistent(s1, specs_160).

evidence(all_consistent(specs_160)).
query(true_val(specs_160, cl121_sc8_4_nt30_2_w25_9)).
query(true_val(specs_160, unk_specs_160)).

% @attr recommended_weight_range_size_160
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (160cm)
% @values v120_plus_lbs=120plus_lbs_55plus_kg unk_recommended_weight_range_size_160=Unknown
% @importance 1.0

0.95::acc(s1, recommended_weight_range_size_160).

0.92::true_val(recommended_weight_range_size_160, v120_plus_lbs); 0.08::true_val(recommended_weight_range_size_160, unk_recommended_weight_range_size_160).

measured(s1, recommended_weight_range_size_160, v120_plus_lbs).

all_consistent(recommended_weight_range_size_160) :- consistent(s1, recommended_weight_range_size_160).

evidence(all_consistent(recommended_weight_range_size_160)).
query(true_val(recommended_weight_range_size_160, v120_plus_lbs)).
query(true_val(recommended_weight_range_size_160, unk_recommended_weight_range_size_160)).

% @attr specs_156w
% @type categorical
% @canonical false
% @original_name 156W contact length/sidecut/width/waist
% @values cl119_sc8_3_nt31_0_w26_7=CL119cm_SC8.3m_NT31.0cm_W26.7cm unk_specs_156w=Unknown
% @importance 1.0

0.95::acc(s1, specs_156w).

0.92::true_val(specs_156w, cl119_sc8_3_nt31_0_w26_7); 0.08::true_val(specs_156w, unk_specs_156w).

measured(s1, specs_156w, cl119_sc8_3_nt31_0_w26_7).

all_consistent(specs_156w) :- consistent(s1, specs_156w).

evidence(all_consistent(specs_156w)).
query(true_val(specs_156w, cl119_sc8_3_nt31_0_w26_7)).
query(true_val(specs_156w, unk_specs_156w)).

% @attr recommended_weight_range_size_156w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (156W)
% @values v120_plus_lbs=120plus_lbs_55plus_kg unk_recommended_weight_range_size_156w=Unknown
% @importance 1.0

0.95::acc(s1, recommended_weight_range_size_156w).

0.92::true_val(recommended_weight_range_size_156w, v120_plus_lbs); 0.08::true_val(recommended_weight_range_size_156w, unk_recommended_weight_range_size_156w).

measured(s1, recommended_weight_range_size_156w, v120_plus_lbs).

all_consistent(recommended_weight_range_size_156w) :- consistent(s1, recommended_weight_range_size_156w).

evidence(all_consistent(recommended_weight_range_size_156w)).
query(true_val(recommended_weight_range_size_156w, v120_plus_lbs)).
query(true_val(recommended_weight_range_size_156w, unk_recommended_weight_range_size_156w)).

% @attr specs_161w
% @type categorical
% @canonical false
% @original_name 161W contact length/sidecut/width/waist
% @values cl121_sc8_4_nt31_0_w26_7=CL121cm_SC8.4m_NT31.0cm_W26.7cm unk_specs_161w=Unknown
% @importance 1.0

0.95::acc(s1, specs_161w).

0.92::true_val(specs_161w, cl121_sc8_4_nt31_0_w26_7); 0.08::true_val(specs_161w, unk_specs_161w).

measured(s1, specs_161w, cl121_sc8_4_nt31_0_w26_7).

all_consistent(specs_161w) :- consistent(s1, specs_161w).

evidence(all_consistent(specs_161w)).
query(true_val(specs_161w, cl121_sc8_4_nt31_0_w26_7)).
query(true_val(specs_161w, unk_specs_161w)).

% @attr recommended_weight_range_size_161w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (161W)
% @values v120_plus_lbs=120plus_lbs_55plus_kg unk_recommended_weight_range_size_161w=Unknown
% @importance 1.0

0.95::acc(s1, recommended_weight_range_size_161w).

0.92::true_val(recommended_weight_range_size_161w, v120_plus_lbs); 0.08::true_val(recommended_weight_range_size_161w, unk_recommended_weight_range_size_161w).

measured(s1, recommended_weight_range_size_161w, v120_plus_lbs).

all_consistent(recommended_weight_range_size_161w) :- consistent(s1, recommended_weight_range_size_161w).

evidence(all_consistent(recommended_weight_range_size_161w)).
query(true_val(recommended_weight_range_size_161w, v120_plus_lbs)).
query(true_val(recommended_weight_range_size_161w, unk_recommended_weight_range_size_161w)).

% @attr stance_width_range_size
% @type categorical
% @canonical true
% @original_name stance_width_range_size
% @values stance_20_25_to_25_0setback=20.25_to_25in_0in_setback unk_stance_width_range_size=Unknown
% @importance 1.0

0.95::acc(s1, stance_width_range_size).

0.92::true_val(stance_width_range_size, stance_20_25_to_25_0setback); 0.08::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s1, stance_width_range_size, stance_20_25_to_25_0setback).

all_consistent(stance_width_range_size) :- consistent(s1, stance_width_range_size).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, stance_20_25_to_25_0setback)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values op_75aspen_25paulownia=OP_75pct_Aspen_25pct_Paulownia unk_core_material=Unknown
% @importance 0.93

0.96::acc(s1, core_material).
0.82::acc(s12, core_material).
0.88::acc(sM, core_material).

0.95::true_val(core_material, op_75aspen_25paulownia); 0.05::true_val(core_material, unk_core_material).

measured(s1, core_material, op_75aspen_25paulownia).
measured(s12, core_material, op_75aspen_25paulownia).
measured(sM, core_material, op_75aspen_25paulownia).

all_consistent(core_material) :-
    consistent(s1, core_material),
    (indep(s12), consistent(s12, core_material) ; \+indep(s12)),
    (indep(sM), consistent(sM, core_material) ; \+indep(sM)).

evidence(all_consistent(core_material)).
query(true_val(core_material, op_75aspen_25paulownia)).
query(true_val(core_material, unk_core_material)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values tri_ax_bi_ax=Tri_Ax_Bi_Ax_Fiber unk_laminate=Unknown
% @importance 0.93

0.96::acc(s1, laminate).
0.82::acc(s12, laminate).
0.88::acc(sM, laminate).

0.95::true_val(laminate, tri_ax_bi_ax); 0.05::true_val(laminate, unk_laminate).

measured(s1, laminate, tri_ax_bi_ax).
measured(s12, laminate, tri_ax_bi_ax).
measured(sM, laminate, tri_ax_bi_ax).

all_consistent(laminate) :-
    consistent(s1, laminate),
    (indep(s12), consistent(s12, laminate) ; \+indep(s12)),
    (indep(sM), consistent(sM, laminate) ; \+indep(sM)).

evidence(all_consistent(laminate)).
query(true_val(laminate, tri_ax_bi_ax)).
query(true_val(laminate, unk_laminate)).

% @attr topsheet
% @type categorical
% @canonical true
% @original_name topsheet
% @values eco_sublimated_poly=Eco_Sublimated_Poly_Topsheet unk_topsheet=Unknown
% @importance 0.925

0.96::acc(s1, topsheet).
0.88::acc(sM, topsheet).

0.95::true_val(topsheet, eco_sublimated_poly); 0.05::true_val(topsheet, unk_topsheet).

measured(s1, topsheet, eco_sublimated_poly).
measured(sM, topsheet, eco_sublimated_poly).

all_consistent(topsheet) :-
    consistent(s1, topsheet),
    (indep(sM), consistent(sM, topsheet) ; \+indep(sM)).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, eco_sublimated_poly)).
query(true_val(topsheet, unk_topsheet)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values eco_sublimated_tnt=Eco_Sublimated_TNT_Base unk_base_material=Unknown
% @importance 0.95

0.96::acc(s1, base_material).
0.85::acc(s9, base_material).

0.95::true_val(base_material, eco_sublimated_tnt); 0.05::true_val(base_material, unk_base_material).

measured(s1, base_material, eco_sublimated_tnt).
measured(s9, base_material, eco_sublimated_tnt).

all_consistent(base_material) :-
    consistent(s1, base_material),
    (indep(s9), consistent(s9, base_material) ; \+indep(s9)).

evidence(all_consistent(base_material)).
query(true_val(base_material, eco_sublimated_tnt)).
query(true_val(base_material, unk_base_material)).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values uhmw_dual_layer_titanium=UHMW_dual_layer_thermal_fusion_titanium unk_base_type=Unknown
% @importance 0.85

0.88::acc(sM, base_type).

0.95::true_val(base_type, uhmw_dual_layer_titanium); 0.05::true_val(base_type, unk_base_type).

measured(sM, base_type, uhmw_dual_layer_titanium).

all_consistent(base_type) :- consistent(sM, base_type).

evidence(all_consistent(base_type)).
query(true_val(base_type, uhmw_dual_layer_titanium)).
query(true_val(base_type, unk_base_type)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values birch_internal_uhmw_sintered=Birch_Internal_plus_UHMW_Sintered_Sidewalls unk_sidewall_material=Unknown
% @importance 0.85

0.82::acc(s12, sidewall_material).
0.88::acc(sM, sidewall_material).

0.95::true_val(sidewall_material, birch_internal_uhmw_sintered); 0.05::true_val(sidewall_material, unk_sidewall_material).

measured(s12, sidewall_material, birch_internal_uhmw_sintered).
measured(sM, sidewall_material, birch_internal_uhmw_sintered).

all_consistent(sidewall_material) :-
    (indep(s12), consistent(s12, sidewall_material) ; \+indep(s12)),
    (indep(sM), consistent(sM, sidewall_material) ; \+indep(sM)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, birch_internal_uhmw_sintered)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values magne_traction=Magne_Traction_7_serrations unk_edge_technology=Unknown
% @importance 0.93

0.96::acc(s1, edge_technology).
0.82::acc(s12, edge_technology).
0.88::acc(sM, edge_technology).

0.95::true_val(edge_technology, magne_traction); 0.05::true_val(edge_technology, unk_edge_technology).

measured(s1, edge_technology, magne_traction).
measured(s12, edge_technology, magne_traction).
measured(sM, edge_technology, magne_traction).

all_consistent(edge_technology) :-
    consistent(s1, edge_technology),
    (indep(s12), consistent(s12, edge_technology) ; \+indep(s12)),
    (indep(sM), consistent(sM, edge_technology) ; \+indep(sM)).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, magne_traction)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr tip_tail_protection
% @type categorical
% @canonical false
% @original_name Tip/tail protection
% @values uhmw_impact_deflection=UHMW_Tip_Tail_Impact_Deflection unk_tip_tail_protection=Unknown
% @importance 0.85

0.88::acc(sM, tip_tail_protection).

0.95::true_val(tip_tail_protection, uhmw_impact_deflection); 0.05::true_val(tip_tail_protection, unk_tip_tail_protection).

measured(sM, tip_tail_protection, uhmw_impact_deflection).

all_consistent(tip_tail_protection) :- consistent(sM, tip_tail_protection).

evidence(all_consistent(tip_tail_protection)).
query(true_val(tip_tail_protection, uhmw_impact_deflection)).
query(true_val(tip_tail_protection, unk_tip_tail_protection)).

% @attr nose_design
% @type categorical
% @canonical false
% @original_name Nose design
% @values rounded_powder_float=Rounded_nose_effortless_powder_float unk_nose_design=Unknown
% @importance 0.925

0.96::acc(s1, nose_design).
0.88::acc(sM, nose_design).

0.95::true_val(nose_design, rounded_powder_float); 0.05::true_val(nose_design, unk_nose_design).

measured(s1, nose_design, rounded_powder_float).
measured(sM, nose_design, rounded_powder_float).

all_consistent(nose_design) :-
    consistent(s1, nose_design),
    (indep(sM), consistent(sM, nose_design) ; \+indep(sM)).

evidence(all_consistent(nose_design)).
query(true_val(nose_design, rounded_powder_float)).
query(true_val(nose_design, unk_nose_design)).

% @attr tail_design
% @type categorical
% @canonical false
% @original_name Tail design
% @values blunted_grabs_blocks=Blunted_tail_solid_grabs_blocks unk_tail_design=Unknown
% @importance 0.925

0.96::acc(s1, tail_design).
0.88::acc(sM, tail_design).

0.95::true_val(tail_design, blunted_grabs_blocks); 0.05::true_val(tail_design, unk_tail_design).

measured(s1, tail_design, blunted_grabs_blocks).
measured(sM, tail_design, blunted_grabs_blocks).

all_consistent(tail_design) :-
    consistent(s1, tail_design),
    (indep(sM), consistent(sM, tail_design) ; \+indep(sM)).

evidence(all_consistent(tail_design)).
query(true_val(tail_design, blunted_grabs_blocks)).
query(true_val(tail_design, unk_tail_design)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values intermediate_advanced=Intermediate_Advanced intermediate=Intermediate beginner_expert=Beginner_to_Expert
% @importance 0.81

0.88::acc(s9, skill_level_recommendation).
0.85::acc(sM, skill_level_recommendation).
0.82::acc(s10, skill_level_recommendation).

0.45::true_val(skill_level_recommendation, intermediate_advanced); 0.30::true_val(skill_level_recommendation, intermediate); 0.25::true_val(skill_level_recommendation, beginner_expert).

measured(s9, skill_level_recommendation, intermediate_advanced).
measured(sM, skill_level_recommendation, intermediate).
measured(s10, skill_level_recommendation, beginner_expert).

all_consistent(skill_level_recommendation) :-
    consistent(s10, skill_level_recommendation),
    (indep(s9), consistent(s9, skill_level_recommendation) ; \+indep(s9)),
    (indep(sM), consistent(sM, skill_level_recommendation) ; \+indep(sM)).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, intermediate_advanced)).
query(true_val(skill_level_recommendation, intermediate)).
query(true_val(skill_level_recommendation, beginner_expert)).

% @attr on_snow_feel_tgr
% @type categorical
% @canonical true
% @original_name on_snow_feel_tgr
% @values semi_stable=Semi_Stable unk_on_snow_feel_tgr=Unknown
% @importance 0.95

0.82::acc(s10, on_snow_feel_tgr).

0.76::true_val(on_snow_feel_tgr, semi_stable); 0.24::true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr).

measured(s10, on_snow_feel_tgr, semi_stable).

all_consistent(on_snow_feel_tgr) :- consistent(s10, on_snow_feel_tgr).

evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, semi_stable)).
query(true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values fast=Fast unk_turn_initiation_performance=Unknown
% @importance 0.95

0.82::acc(s10, turn_initiation_performance).

0.76::true_val(turn_initiation_performance, fast); 0.24::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s10, turn_initiation_performance, fast).

all_consistent(turn_initiation_performance) :- consistent(s10, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, fast)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr reviewer_opinion_the_good_ride
% @type numeric
% @unit /5
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values v5_0=5.0 unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.95

0.80::acc(s10, reviewer_opinion_the_good_ride).

0.76::true_val(reviewer_opinion_the_good_ride, v5_0); 0.24::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s10, reviewer_opinion_the_good_ride, v5_0).

all_consistent(reviewer_opinion_the_good_ride) :- consistent(s10, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, v5_0)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr reviewer_opinion_the_good_ride_ease
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (ease of riding)
% @values semi_easy=Semi_Easy unk_reviewer_opinion_the_good_ride_ease=Unknown
% @importance 0.95

0.82::acc(s10, reviewer_opinion_the_good_ride_ease).

0.76::true_val(reviewer_opinion_the_good_ride_ease, semi_easy); 0.24::true_val(reviewer_opinion_the_good_ride_ease, unk_reviewer_opinion_the_good_ride_ease).

measured(s10, reviewer_opinion_the_good_ride_ease, semi_easy).

all_consistent(reviewer_opinion_the_good_ride_ease) :- consistent(s10, reviewer_opinion_the_good_ride_ease).

evidence(all_consistent(reviewer_opinion_the_good_ride_ease)).
query(true_val(reviewer_opinion_the_good_ride_ease, semi_easy)).
query(true_val(reviewer_opinion_the_good_ride_ease, unk_reviewer_opinion_the_good_ride_ease)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values excellent_icy=Excellent_grip_icy_hard_snow unk_edge_hold=Unknown
% @importance 0.88

0.85::acc(s10, edge_hold).
0.45::acc(s27, edge_hold).

0.95::true_val(edge_hold, excellent_icy); 0.05::true_val(edge_hold, unk_edge_hold).

measured(s10, edge_hold, excellent_icy).
measured(s27, edge_hold, excellent_icy).

all_consistent(edge_hold) :-
    consistent(s10, edge_hold),
    consistent(s27, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, excellent_icy)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values good_slow_for_price=Good_but_slow_for_price unk_base_glide_performance=Unknown
% @importance 0.88

0.85::acc(s10, base_glide_performance).
0.45::acc(s27, base_glide_performance).

0.95::true_val(base_glide_performance, good_slow_for_price); 0.05::true_val(base_glide_performance, unk_base_glide_performance).

measured(s10, base_glide_performance, good_slow_for_price).
measured(s27, base_glide_performance, good_slow_for_price).

all_consistent(base_glide_performance) :-
    consistent(s10, base_glide_performance),
    consistent(s27, base_glide_performance).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, good_slow_for_price)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr carving_rating_tgr
% @type categorical
% @canonical true
% @original_name carving_rating_tgr
% @values good=Good unk_carving_rating_tgr=Unknown
% @importance 0.95

0.82::acc(s10, carving_rating_tgr).

0.76::true_val(carving_rating_tgr, good); 0.24::true_val(carving_rating_tgr, unk_carving_rating_tgr).

measured(s10, carving_rating_tgr, good).

all_consistent(carving_rating_tgr) :- consistent(s10, carving_rating_tgr).

evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, good)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

% @attr speed_rating_tgr
% @type categorical
% @canonical true
% @original_name speed_rating_tgr
% @values good=Good unk_speed_rating_tgr=Unknown
% @importance 0.95

0.82::acc(s10, speed_rating_tgr).

0.76::true_val(speed_rating_tgr, good); 0.24::true_val(speed_rating_tgr, unk_speed_rating_tgr).

measured(s10, speed_rating_tgr, good).

all_consistent(speed_rating_tgr) :- consistent(s10, speed_rating_tgr).

evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, good)).
query(true_val(speed_rating_tgr, unk_speed_rating_tgr)).

% @attr reviewer_opinion_the_good_ride_2
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (sub-rating Good)
% @values good=Good unk_reviewer_opinion_the_good_ride_2=Unknown
% @importance 0.95

0.82::acc(s10, reviewer_opinion_the_good_ride_2).

0.76::true_val(reviewer_opinion_the_good_ride_2, good); 0.24::true_val(reviewer_opinion_the_good_ride_2, unk_reviewer_opinion_the_good_ride_2).

measured(s10, reviewer_opinion_the_good_ride_2, good).

all_consistent(reviewer_opinion_the_good_ride_2) :- consistent(s10, reviewer_opinion_the_good_ride_2).

evidence(all_consistent(reviewer_opinion_the_good_ride_2)).
query(true_val(reviewer_opinion_the_good_ride_2, good)).
query(true_val(reviewer_opinion_the_good_ride_2, unk_reviewer_opinion_the_good_ride_2)).

% @attr reviewer_opinion_the_good_ride_3
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (sub-rating Great)
% @values great=Great unk_reviewer_opinion_the_good_ride_3=Unknown
% @importance 0.95

0.82::acc(s10, reviewer_opinion_the_good_ride_3).

0.76::true_val(reviewer_opinion_the_good_ride_3, great); 0.24::true_val(reviewer_opinion_the_good_ride_3, unk_reviewer_opinion_the_good_ride_3).

measured(s10, reviewer_opinion_the_good_ride_3, great).

all_consistent(reviewer_opinion_the_good_ride_3) :- consistent(s10, reviewer_opinion_the_good_ride_3).

evidence(all_consistent(reviewer_opinion_the_good_ride_3)).
query(true_val(reviewer_opinion_the_good_ride_3, great)).
query(true_val(reviewer_opinion_the_good_ride_3, unk_reviewer_opinion_the_good_ride_3)).

% @attr jumps_rating_tgr
% @type categorical
% @canonical true
% @original_name jumps_rating_tgr
% @values great=Great unk_jumps_rating_tgr=Unknown
% @importance 0.95

0.82::acc(s10, jumps_rating_tgr).

0.76::true_val(jumps_rating_tgr, great); 0.24::true_val(jumps_rating_tgr, unk_jumps_rating_tgr).

measured(s10, jumps_rating_tgr, great).

all_consistent(jumps_rating_tgr) :- consistent(s10, jumps_rating_tgr).

evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, great)).
query(true_val(jumps_rating_tgr, unk_jumps_rating_tgr)).

% @attr jibbing_rating_tgr
% @type categorical
% @canonical true
% @original_name jibbing_rating_tgr
% @values good=Good unk_jibbing_rating_tgr=Unknown
% @importance 0.95

0.82::acc(s10, jibbing_rating_tgr).

0.76::true_val(jibbing_rating_tgr, good); 0.24::true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr).

measured(s10, jibbing_rating_tgr, good).

all_consistent(jibbing_rating_tgr) :- consistent(s10, jibbing_rating_tgr).

evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, good)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr)).

% @attr pipe_rating_tgr
% @type categorical
% @canonical true
% @original_name pipe_rating_tgr
% @values great=Great unk_pipe_rating_tgr=Unknown
% @importance 0.95

0.82::acc(s10, pipe_rating_tgr).

0.76::true_val(pipe_rating_tgr, great); 0.24::true_val(pipe_rating_tgr, unk_pipe_rating_tgr).

measured(s10, pipe_rating_tgr, great).

all_consistent(pipe_rating_tgr) :- consistent(s10, pipe_rating_tgr).

evidence(all_consistent(pipe_rating_tgr)).
query(true_val(pipe_rating_tgr, great)).
query(true_val(pipe_rating_tgr, unk_pipe_rating_tgr)).

% @attr powder_rating_tgr
% @type categorical
% @canonical true
% @original_name powder_rating_tgr
% @values average=Average unk_powder_rating_tgr=Unknown
% @importance 0.95

0.82::acc(s10, powder_rating_tgr).

0.76::true_val(powder_rating_tgr, average); 0.24::true_val(powder_rating_tgr, unk_powder_rating_tgr).

measured(s10, powder_rating_tgr, average).

all_consistent(powder_rating_tgr) :- consistent(s10, powder_rating_tgr).

evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, average)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

% @attr reviewer_opinion_the_good_ride_weight
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (weight feel)
% @values normal_bordering_light=Normal_bordering_on_light unk_reviewer_opinion_the_good_ride_weight=Unknown
% @importance 0.95

0.80::acc(s10, reviewer_opinion_the_good_ride_weight).

0.76::true_val(reviewer_opinion_the_good_ride_weight, normal_bordering_light); 0.24::true_val(reviewer_opinion_the_good_ride_weight, unk_reviewer_opinion_the_good_ride_weight).

measured(s10, reviewer_opinion_the_good_ride_weight, normal_bordering_light).

all_consistent(reviewer_opinion_the_good_ride_weight) :- consistent(s10, reviewer_opinion_the_good_ride_weight).

evidence(all_consistent(reviewer_opinion_the_good_ride_weight)).
query(true_val(reviewer_opinion_the_good_ride_weight, normal_bordering_light)).
query(true_val(reviewer_opinion_the_good_ride_weight, unk_reviewer_opinion_the_good_ride_weight)).

% @attr board_weight_grams
% @type numeric
% @unit g
% @canonical true
% @original_name board_weight_grams
% @values v2860=2860.0 unk_board_weight_grams=Unknown
% @importance 0.95

0.85::acc(s22, board_weight_grams).

0.74::true_val(board_weight_grams, v2860); 0.26::true_val(board_weight_grams, unk_board_weight_grams).

measured(s22, board_weight_grams, v2860).

all_consistent(board_weight_grams) :- consistent(s22, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v2860)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr board_weight_grams_154
% @type numeric
% @unit g
% @canonical false
% @original_name board_weight_grams (154cm)
% @values v2900=2900.0 unk_board_weight_grams_154=Unknown
% @importance 0.95

0.85::acc(s22, board_weight_grams_154).

0.74::true_val(board_weight_grams_154, v2900); 0.26::true_val(board_weight_grams_154, unk_board_weight_grams_154).

measured(s22, board_weight_grams_154, v2900).

all_consistent(board_weight_grams_154) :- consistent(s22, board_weight_grams_154).

evidence(all_consistent(board_weight_grams_154)).
query(true_val(board_weight_grams_154, v2900)).
query(true_val(board_weight_grams_154, unk_board_weight_grams_154)).

% @attr weight_per_cm
% @type numeric
% @unit g/cm
% @canonical true
% @original_name weight_per_cm
% @values v18_83=18.83 unk_weight_per_cm=Unknown
% @importance 0.95

0.85::acc(s22, weight_per_cm).

0.74::true_val(weight_per_cm, v18_83); 0.26::true_val(weight_per_cm, unk_weight_per_cm).

measured(s22, weight_per_cm, v18_83).

all_consistent(weight_per_cm) :- consistent(s22, weight_per_cm).

evidence(all_consistent(weight_per_cm)).
query(true_val(weight_per_cm, v18_83)).
query(true_val(weight_per_cm, unk_weight_per_cm)).

% @attr overall_rating_snowboardingprofiles
% @type numeric
% @unit /100
% @canonical true
% @original_name overall_rating_snowboardingprofiles
% @values v87_3=87.3 unk_overall_rating_snowboardingprofiles=Unknown
% @importance 0.95

0.85::acc(s22, overall_rating_snowboardingprofiles).

0.74::true_val(overall_rating_snowboardingprofiles, v87_3); 0.26::true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles).

measured(s22, overall_rating_snowboardingprofiles, v87_3).

all_consistent(overall_rating_snowboardingprofiles) :- consistent(s22, overall_rating_snowboardingprofiles).

evidence(all_consistent(overall_rating_snowboardingprofiles)).
query(true_val(overall_rating_snowboardingprofiles, v87_3)).
query(true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles)).

% @attr ranking_all_mountain
% @type categorical
% @canonical false
% @original_name Ranked 10th out of 32 current all-mountain boards tested
% @values rank_10_of_32=10th_of_32 unk_ranking_all_mountain=Unknown
% @importance 0.95

0.82::acc(s22, ranking_all_mountain).

0.74::true_val(ranking_all_mountain, rank_10_of_32); 0.26::true_val(ranking_all_mountain, unk_ranking_all_mountain).

measured(s22, ranking_all_mountain, rank_10_of_32).

all_consistent(ranking_all_mountain) :- consistent(s22, ranking_all_mountain).

evidence(all_consistent(ranking_all_mountain)).
query(true_val(ranking_all_mountain, rank_10_of_32)).
query(true_val(ranking_all_mountain, unk_ranking_all_mountain)).

% @attr avg_all_mountain_score
% @type numeric
% @unit /100
% @canonical false
% @original_name Average all-mountain board score in comparison
% @values v84_6=84.6 unk_avg_all_mountain_score=Unknown
% @importance 0.95

0.82::acc(s22, avg_all_mountain_score).

0.74::true_val(avg_all_mountain_score, v84_6); 0.26::true_val(avg_all_mountain_score, unk_avg_all_mountain_score).

measured(s22, avg_all_mountain_score, v84_6).

all_consistent(avg_all_mountain_score) :- consistent(s22, avg_all_mountain_score).

evidence(all_consistent(avg_all_mountain_score)).
query(true_val(avg_all_mountain_score, v84_6)).
query(true_val(avg_all_mountain_score, unk_avg_all_mountain_score)).

% @attr avg_all_mountain_price
% @type numeric
% @unit USD
% @canonical false
% @original_name Average all-mountain board price in comparison
% @values v572=572.0 unk_avg_all_mountain_price=Unknown
% @importance 0.95

0.82::acc(s22, avg_all_mountain_price).

0.74::true_val(avg_all_mountain_price, v572); 0.26::true_val(avg_all_mountain_price, unk_avg_all_mountain_price).

measured(s22, avg_all_mountain_price, v572).

all_consistent(avg_all_mountain_price) :- consistent(s22, avg_all_mountain_price).

evidence(all_consistent(avg_all_mountain_price)).
query(true_val(avg_all_mountain_price, v572)).
query(true_val(avg_all_mountain_price, unk_avg_all_mountain_price)).

% @attr powder_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical true
% @original_name powder_score_snowboardingprofiles
% @values v3_5=3.5 unk_powder_score_snowboardingprofiles=Unknown
% @importance 0.95

0.85::acc(s22, powder_score_snowboardingprofiles).

0.74::true_val(powder_score_snowboardingprofiles, v3_5); 0.26::true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles).

measured(s22, powder_score_snowboardingprofiles, v3_5).

all_consistent(powder_score_snowboardingprofiles) :- consistent(s22, powder_score_snowboardingprofiles).

evidence(all_consistent(powder_score_snowboardingprofiles)).
query(true_val(powder_score_snowboardingprofiles, v3_5)).
query(true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles)).

% @attr carving_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical true
% @original_name carving_score_snowboardingprofiles
% @values v3=3.0 unk_carving_score_snowboardingprofiles=Unknown
% @importance 0.95

0.85::acc(s22, carving_score_snowboardingprofiles).

0.74::true_val(carving_score_snowboardingprofiles, v3); 0.26::true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles).

measured(s22, carving_score_snowboardingprofiles, v3).

all_consistent(carving_score_snowboardingprofiles) :- consistent(s22, carving_score_snowboardingprofiles).

evidence(all_consistent(carving_score_snowboardingprofiles)).
query(true_val(carving_score_snowboardingprofiles, v3)).
query(true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles)).

% @attr reviewer_opinion_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical true
% @original_name reviewer_opinion_snowboardingprofiles
% @values v4=4.0 unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.95

0.85::acc(s22, reviewer_opinion_snowboardingprofiles).

0.74::true_val(reviewer_opinion_snowboardingprofiles, v4); 0.26::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).

measured(s22, reviewer_opinion_snowboardingprofiles, v4).

all_consistent(reviewer_opinion_snowboardingprofiles) :- consistent(s22, reviewer_opinion_snowboardingprofiles).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, v4)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

% @attr reviewer_opinion_snowboardingprofiles_2
% @type numeric
% @unit /5
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (sub-rating 2)
% @values v3=3.0 unk_reviewer_opinion_snowboardingprofiles_2=Unknown
% @importance 0.95

0.85::acc(s22, reviewer_opinion_snowboardingprofiles_2).

0.74::true_val(reviewer_opinion_snowboardingprofiles_2, v3); 0.26::true_val(reviewer_opinion_snowboardingprofiles_2, unk_reviewer_opinion_snowboardingprofiles_2).

measured(s22, reviewer_opinion_snowboardingprofiles_2, v3).

all_consistent(reviewer_opinion_snowboardingprofiles_2) :- consistent(s22, reviewer_opinion_snowboardingprofiles_2).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_2)).
query(true_val(reviewer_opinion_snowboardingprofiles_2, v3)).
query(true_val(reviewer_opinion_snowboardingprofiles_2, unk_reviewer_opinion_snowboardingprofiles_2)).

% @attr reviewer_opinion_snowboardingprofiles_3
% @type numeric
% @unit /5
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (sub-rating 3)
% @values v3_5=3.5 unk_reviewer_opinion_snowboardingprofiles_3=Unknown
% @importance 0.95

0.85::acc(s22, reviewer_opinion_snowboardingprofiles_3).

0.74::true_val(reviewer_opinion_snowboardingprofiles_3, v3_5); 0.26::true_val(reviewer_opinion_snowboardingprofiles_3, unk_reviewer_opinion_snowboardingprofiles_3).

measured(s22, reviewer_opinion_snowboardingprofiles_3, v3_5).

all_consistent(reviewer_opinion_snowboardingprofiles_3) :- consistent(s22, reviewer_opinion_snowboardingprofiles_3).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_3)).
query(true_val(reviewer_opinion_snowboardingprofiles_3, v3_5)).
query(true_val(reviewer_opinion_snowboardingprofiles_3, unk_reviewer_opinion_snowboardingprofiles_3)).

% @attr reviewer_opinion_snowboardingprofiles_4
% @type numeric
% @unit /5
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (sub-rating 4)
% @values v4=4.0 unk_reviewer_opinion_snowboardingprofiles_4=Unknown
% @importance 0.95

0.85::acc(s22, reviewer_opinion_snowboardingprofiles_4).

0.74::true_val(reviewer_opinion_snowboardingprofiles_4, v4); 0.26::true_val(reviewer_opinion_snowboardingprofiles_4, unk_reviewer_opinion_snowboardingprofiles_4).

measured(s22, reviewer_opinion_snowboardingprofiles_4, v4).

all_consistent(reviewer_opinion_snowboardingprofiles_4) :- consistent(s22, reviewer_opinion_snowboardingprofiles_4).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_4)).
query(true_val(reviewer_opinion_snowboardingprofiles_4, v4)).
query(true_val(reviewer_opinion_snowboardingprofiles_4, unk_reviewer_opinion_snowboardingprofiles_4)).

% @attr reviewer_opinion_snowboardingprofiles_5
% @type numeric
% @unit /5
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (sub-rating 5)
% @values v3_5=3.5 unk_reviewer_opinion_snowboardingprofiles_5=Unknown
% @importance 0.95

0.85::acc(s22, reviewer_opinion_snowboardingprofiles_5).

0.74::true_val(reviewer_opinion_snowboardingprofiles_5, v3_5); 0.26::true_val(reviewer_opinion_snowboardingprofiles_5, unk_reviewer_opinion_snowboardingprofiles_5).

measured(s22, reviewer_opinion_snowboardingprofiles_5, v3_5).

all_consistent(reviewer_opinion_snowboardingprofiles_5) :- consistent(s22, reviewer_opinion_snowboardingprofiles_5).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_5)).
query(true_val(reviewer_opinion_snowboardingprofiles_5, v3_5)).
query(true_val(reviewer_opinion_snowboardingprofiles_5, unk_reviewer_opinion_snowboardingprofiles_5)).

% @attr reviewer_opinion_snowboardingprofiles_6
% @type numeric
% @unit /5
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (sub-rating 6)
% @values v4=4.0 unk_reviewer_opinion_snowboardingprofiles_6=Unknown
% @importance 0.95

0.85::acc(s22, reviewer_opinion_snowboardingprofiles_6).

0.74::true_val(reviewer_opinion_snowboardingprofiles_6, v4); 0.26::true_val(reviewer_opinion_snowboardingprofiles_6, unk_reviewer_opinion_snowboardingprofiles_6).

measured(s22, reviewer_opinion_snowboardingprofiles_6, v4).

all_consistent(reviewer_opinion_snowboardingprofiles_6) :- consistent(s22, reviewer_opinion_snowboardingprofiles_6).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_6)).
query(true_val(reviewer_opinion_snowboardingprofiles_6, v4)).
query(true_val(reviewer_opinion_snowboardingprofiles_6, unk_reviewer_opinion_snowboardingprofiles_6)).

% @attr reviewer_opinion_snowboardingprofiles_7
% @type numeric
% @unit /5
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (sub-rating 7)
% @values v4=4.0 unk_reviewer_opinion_snowboardingprofiles_7=Unknown
% @importance 0.95

0.85::acc(s22, reviewer_opinion_snowboardingprofiles_7).

0.74::true_val(reviewer_opinion_snowboardingprofiles_7, v4); 0.26::true_val(reviewer_opinion_snowboardingprofiles_7, unk_reviewer_opinion_snowboardingprofiles_7).

measured(s22, reviewer_opinion_snowboardingprofiles_7, v4).

all_consistent(reviewer_opinion_snowboardingprofiles_7) :- consistent(s22, reviewer_opinion_snowboardingprofiles_7).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_7)).
query(true_val(reviewer_opinion_snowboardingprofiles_7, v4)).
query(true_val(reviewer_opinion_snowboardingprofiles_7, unk_reviewer_opinion_snowboardingprofiles_7)).

% @attr reviewer_opinion_snowboardingprofiles_8
% @type numeric
% @unit /5
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (sub-rating 8)
% @values v4_5=4.5 unk_reviewer_opinion_snowboardingprofiles_8=Unknown
% @importance 0.95

0.85::acc(s22, reviewer_opinion_snowboardingprofiles_8).

0.74::true_val(reviewer_opinion_snowboardingprofiles_8, v4_5); 0.26::true_val(reviewer_opinion_snowboardingprofiles_8, unk_reviewer_opinion_snowboardingprofiles_8).

measured(s22, reviewer_opinion_snowboardingprofiles_8, v4_5).

all_consistent(reviewer_opinion_snowboardingprofiles_8) :- consistent(s22, reviewer_opinion_snowboardingprofiles_8).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_8)).
query(true_val(reviewer_opinion_snowboardingprofiles_8, v4_5)).
query(true_val(reviewer_opinion_snowboardingprofiles_8, unk_reviewer_opinion_snowboardingprofiles_8)).

% @attr reviewer_opinion_snowboardingprofiles_9
% @type numeric
% @unit /5
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (sub-rating 9)
% @values v3_5=3.5 unk_reviewer_opinion_snowboardingprofiles_9=Unknown
% @importance 0.95

0.85::acc(s22, reviewer_opinion_snowboardingprofiles_9).

0.74::true_val(reviewer_opinion_snowboardingprofiles_9, v3_5); 0.26::true_val(reviewer_opinion_snowboardingprofiles_9, unk_reviewer_opinion_snowboardingprofiles_9).

measured(s22, reviewer_opinion_snowboardingprofiles_9, v3_5).

all_consistent(reviewer_opinion_snowboardingprofiles_9) :- consistent(s22, reviewer_opinion_snowboardingprofiles_9).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_9)).
query(true_val(reviewer_opinion_snowboardingprofiles_9, v3_5)).
query(true_val(reviewer_opinion_snowboardingprofiles_9, unk_reviewer_opinion_snowboardingprofiles_9)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values forgiving_versatile_grip=Very_Forgiving_Versatile_Quiver_Excellent_Grip unk_positive_aspect=Unknown
% @importance 0.95

0.82::acc(s10, positive_aspect).

0.76::true_val(positive_aspect, forgiving_versatile_grip); 0.24::true_val(positive_aspect, unk_positive_aspect).

measured(s10, positive_aspect, forgiving_versatile_grip).

all_consistent(positive_aspect) :- consistent(s10, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, forgiving_versatile_grip)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values loose_auto_spinny_slow_base=Can_feel_loose_auto_spinny_base_slow_for_price unk_negative_aspect=Unknown
% @importance 0.95

0.82::acc(s10, negative_aspect).

0.76::true_val(negative_aspect, loose_auto_spinny_slow_base); 0.24::true_val(negative_aspect, unk_negative_aspect).

measured(s10, negative_aspect, loose_auto_spinny_slow_base).

all_consistent(negative_aspect) :- consistent(s10, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, loose_auto_spinny_slow_base)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr reviewer_opinion_the_good_ride_currency
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (review currency note)
% @values no_changes_review_stands_2026=No_real_changes_review_still_stands_2026 unk_reviewer_opinion_the_good_ride_currency=Unknown
% @importance 0.95

0.80::acc(s10, reviewer_opinion_the_good_ride_currency).

0.76::true_val(reviewer_opinion_the_good_ride_currency, no_changes_review_stands_2026); 0.24::true_val(reviewer_opinion_the_good_ride_currency, unk_reviewer_opinion_the_good_ride_currency).

measured(s10, reviewer_opinion_the_good_ride_currency, no_changes_review_stands_2026).

all_consistent(reviewer_opinion_the_good_ride_currency) :- consistent(s10, reviewer_opinion_the_good_ride_currency).

evidence(all_consistent(reviewer_opinion_the_good_ride_currency)).
query(true_val(reviewer_opinion_the_good_ride_currency, no_changes_review_stands_2026)).
query(true_val(reviewer_opinion_the_good_ride_currency, unk_reviewer_opinion_the_good_ride_currency)).

% @attr boot_size_152
% @type categorical
% @canonical false
% @original_name 152cm boot size
% @values us_8_9=US_8_to_9 unk_boot_size_152=Unknown
% @importance 0.95

0.82::acc(s10, boot_size_152).

0.76::true_val(boot_size_152, us_8_9); 0.24::true_val(boot_size_152, unk_boot_size_152).

measured(s10, boot_size_152, us_8_9).

all_consistent(boot_size_152) :- consistent(s10, boot_size_152).

evidence(all_consistent(boot_size_152)).
query(true_val(boot_size_152, us_8_9)).
query(true_val(boot_size_152, unk_boot_size_152)).

% @attr boot_size_154
% @type categorical
% @canonical false
% @original_name 154cm boot size
% @values us_8_5_9_5=US_8.5_to_9.5 unk_boot_size_154=Unknown
% @importance 0.95

0.82::acc(s10, boot_size_154).

0.76::true_val(boot_size_154, us_8_5_9_5); 0.24::true_val(boot_size_154, unk_boot_size_154).

measured(s10, boot_size_154, us_8_5_9_5).

all_consistent(boot_size_154) :- consistent(s10, boot_size_154).

evidence(all_consistent(boot_size_154)).
query(true_val(boot_size_154, us_8_5_9_5)).
query(true_val(boot_size_154, unk_boot_size_154)).

% @attr boot_size_157
% @type categorical
% @canonical false
% @original_name 157cm boot size
% @values us_9_5_10_5=US_9.5_to_10.5 unk_boot_size_157=Unknown
% @importance 0.95

0.82::acc(s10, boot_size_157).

0.76::true_val(boot_size_157, us_9_5_10_5); 0.24::true_val(boot_size_157, unk_boot_size_157).

measured(s10, boot_size_157, us_9_5_10_5).

all_consistent(boot_size_157) :- consistent(s10, boot_size_157).

evidence(all_consistent(boot_size_157)).
query(true_val(boot_size_157, us_9_5_10_5)).
query(true_val(boot_size_157, unk_boot_size_157)).

% @attr boot_size_160
% @type categorical
% @canonical false
% @original_name 160cm boot size
% @values us_10_11=US_10_to_11 unk_boot_size_160=Unknown
% @importance 0.95

0.82::acc(s10, boot_size_160).

0.76::true_val(boot_size_160, us_10_11); 0.24::true_val(boot_size_160, unk_boot_size_160).

measured(s10, boot_size_160, us_10_11).

all_consistent(boot_size_160) :- consistent(s10, boot_size_160).

evidence(all_consistent(boot_size_160)).
query(true_val(boot_size_160, us_10_11)).
query(true_val(boot_size_160, unk_boot_size_160)).

% @attr boot_size_156w
% @type categorical
% @canonical false
% @original_name 156W boot size
% @values us_11_12=US_11_to_12 unk_boot_size_156w=Unknown
% @importance 0.95

0.82::acc(s10, boot_size_156w).

0.76::true_val(boot_size_156w, us_11_12); 0.24::true_val(boot_size_156w, unk_boot_size_156w).

measured(s10, boot_size_156w, us_11_12).

all_consistent(boot_size_156w) :- consistent(s10, boot_size_156w).

evidence(all_consistent(boot_size_156w)).
query(true_val(boot_size_156w, us_11_12)).
query(true_val(boot_size_156w, unk_boot_size_156w)).

% @attr boot_size_161w
% @type categorical
% @canonical false
% @original_name 161W boot size
% @values us_11_5_12_5=US_11.5_to_12.5 unk_boot_size_161w=Unknown
% @importance 0.95

0.82::acc(s10, boot_size_161w).

0.76::true_val(boot_size_161w, us_11_5_12_5); 0.24::true_val(boot_size_161w, unk_boot_size_161w).

measured(s10, boot_size_161w, us_11_5_12_5).

all_consistent(boot_size_161w) :- consistent(s10, boot_size_161w).

evidence(all_consistent(boot_size_161w)).
query(true_val(boot_size_161w, us_11_5_12_5)).
query(true_val(boot_size_161w, unk_boot_size_161w)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values mellow_catch_free=Mellow_catch_free_turns_quick_confidence unk_reviewer_opinion_whitelines=Unknown
% @importance 0.7

0.72::acc(s23, reviewer_opinion_whitelines).

0.64::true_val(reviewer_opinion_whitelines, mellow_catch_free); 0.36::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

measured(s23, reviewer_opinion_whitelines, mellow_catch_free).

all_consistent(reviewer_opinion_whitelines) :- consistent(s23, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, mellow_catch_free)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

% @attr snow_magazine_review
% @type categorical
% @canonical false
% @original_name Snow Magazine review
% @values stable_cut_through=Cut_through_uneven_terrain_stable_underfoot unk_snow_magazine_review=Unknown
% @importance 0.65

0.72::acc(s24, snow_magazine_review).

0.64::true_val(snow_magazine_review, stable_cut_through); 0.36::true_val(snow_magazine_review, unk_snow_magazine_review).

measured(s24, snow_magazine_review, stable_cut_through).

all_consistent(snow_magazine_review) :- consistent(s24, snow_magazine_review).

evidence(all_consistent(snow_magazine_review)).
query(true_val(snow_magazine_review, stable_cut_through)).
query(true_val(snow_magazine_review, unk_snow_magazine_review)).

% @attr snow_magazine_verdict
% @type categorical
% @canonical false
% @original_name Snow Magazine verdict
% @values accomplished_am_freestyle=Accomplished_all_mountain_freestyle_board unk_snow_magazine_verdict=Unknown
% @importance 0.65

0.72::acc(s24, snow_magazine_verdict).

0.64::true_val(snow_magazine_verdict, accomplished_am_freestyle); 0.36::true_val(snow_magazine_verdict, unk_snow_magazine_verdict).

measured(s24, snow_magazine_verdict, accomplished_am_freestyle).

all_consistent(snow_magazine_verdict) :- consistent(s24, snow_magazine_verdict).

evidence(all_consistent(snow_magazine_verdict)).
query(true_val(snow_magazine_verdict, accomplished_am_freestyle)).
query(true_val(snow_magazine_verdict, unk_snow_magazine_verdict)).

% @attr core_design_unchanged
% @type categorical
% @canonical false
% @original_name Core design largely unchanged since 2021 model
% @values unchanged_since_2021=Largely_unchanged_since_2021 unk_core_design_unchanged=Unknown
% @importance 0.95

0.82::acc(s22, core_design_unchanged).

0.74::true_val(core_design_unchanged, unchanged_since_2021); 0.26::true_val(core_design_unchanged, unk_core_design_unchanged).

measured(s22, core_design_unchanged, unchanged_since_2021).

all_consistent(core_design_unchanged) :- consistent(s22, core_design_unchanged).

evidence(all_consistent(core_design_unchanged)).
query(true_val(core_design_unchanged, unchanged_since_2021)).
query(true_val(core_design_unchanged, unk_core_design_unchanged)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values all_mountain=All_Mountain unk_terrain_suitability=Unknown
% @importance 1.0

0.96::acc(s1, terrain_suitability).

0.92::true_val(terrain_suitability, all_mountain); 0.08::true_val(terrain_suitability, unk_terrain_suitability).

measured(s1, terrain_suitability, all_mountain).

all_consistent(terrain_suitability) :- consistent(s1, terrain_suitability).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, all_mountain)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr terrain_suitability_detailed
% @type categorical
% @canonical false
% @original_name terrain_suitability (detailed)
% @values am_fr_resort_powder=All_Mountain_Freeride_Resort_Powder unk_terrain_suitability_detailed=Unknown
% @importance 0.85

0.88::acc(sM, terrain_suitability_detailed).

0.95::true_val(terrain_suitability_detailed, am_fr_resort_powder); 0.05::true_val(terrain_suitability_detailed, unk_terrain_suitability_detailed).

measured(sM, terrain_suitability_detailed, am_fr_resort_powder).

all_consistent(terrain_suitability_detailed) :- consistent(sM, terrain_suitability_detailed).

evidence(all_consistent(terrain_suitability_detailed)).
query(true_val(terrain_suitability_detailed, am_fr_resort_powder)).
query(true_val(terrain_suitability_detailed, unk_terrain_suitability_detailed)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values all_mountain=All_Mountain unk_riding_style=Unknown
% @importance 0.95

0.82::acc(s10, riding_style).

0.76::true_val(riding_style, all_mountain); 0.24::true_val(riding_style, unk_riding_style).

measured(s10, riding_style, all_mountain).

all_consistent(riding_style) :- consistent(s10, riding_style).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, all_mountain)).
query(true_val(riding_style, unk_riding_style)).

% @attr terrain_suitability_quiver
% @type categorical
% @canonical false
% @original_name terrain_suitability (one-board quiver)
% @values one_board_quiver=One_board_quiver_versatile unk_terrain_suitability_quiver=Unknown
% @importance 0.95

0.82::acc(s10, terrain_suitability_quiver).
0.82::acc(s22, terrain_suitability_quiver).

0.95::true_val(terrain_suitability_quiver, one_board_quiver); 0.05::true_val(terrain_suitability_quiver, unk_terrain_suitability_quiver).

measured(s10, terrain_suitability_quiver, one_board_quiver).
measured(s22, terrain_suitability_quiver, one_board_quiver).

all_consistent(terrain_suitability_quiver) :-
    consistent(s10, terrain_suitability_quiver),
    consistent(s22, terrain_suitability_quiver).

evidence(all_consistent(terrain_suitability_quiver)).
query(true_val(terrain_suitability_quiver, one_board_quiver)).
query(true_val(terrain_suitability_quiver, unk_terrain_suitability_quiver)).

% @attr terrain_suitability_marketing
% @type categorical
% @canonical false
% @original_name terrain_suitability (marketing - destruction)
% @values freestyle_entire_mountain=Designed_to_leave_path_of_destruction unk_terrain_suitability_marketing=Unknown
% @importance 1.0

0.80::acc(s1, terrain_suitability_marketing).

0.76::true_val(terrain_suitability_marketing, freestyle_entire_mountain); 0.24::true_val(terrain_suitability_marketing, unk_terrain_suitability_marketing).

measured(s1, terrain_suitability_marketing, freestyle_entire_mountain).

all_consistent(terrain_suitability_marketing) :- consistent(s1, terrain_suitability_marketing).

evidence(all_consistent(terrain_suitability_marketing)).
query(true_val(terrain_suitability_marketing, freestyle_entire_mountain)).
query(true_val(terrain_suitability_marketing, unk_terrain_suitability_marketing)).

% @attr reviewer_opinion_the_good_ride_powder
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (powder float)
% @values good_float_1_75_setback=Good_float_1.75in_setback unk_reviewer_opinion_the_good_ride_powder=Unknown
% @importance 0.95

0.82::acc(s10, reviewer_opinion_the_good_ride_powder).

0.76::true_val(reviewer_opinion_the_good_ride_powder, good_float_1_75_setback); 0.24::true_val(reviewer_opinion_the_good_ride_powder, unk_reviewer_opinion_the_good_ride_powder).

measured(s10, reviewer_opinion_the_good_ride_powder, good_float_1_75_setback).

all_consistent(reviewer_opinion_the_good_ride_powder) :- consistent(s10, reviewer_opinion_the_good_ride_powder).

evidence(all_consistent(reviewer_opinion_the_good_ride_powder)).
query(true_val(reviewer_opinion_the_good_ride_powder, good_float_1_75_setback)).
query(true_val(reviewer_opinion_the_good_ride_powder, unk_reviewer_opinion_the_good_ride_powder)).

% @attr terrain_suitability_marketing_2
% @type categorical
% @canonical false
% @original_name terrain_suitability (marketing - resort berserkers)
% @values hard_charging_dream_resort=Technically_perfect_hard_charging_dream_board unk_terrain_suitability_marketing_2=Unknown
% @importance 1.0

0.80::acc(s1, terrain_suitability_marketing_2).

0.76::true_val(terrain_suitability_marketing_2, hard_charging_dream_resort); 0.24::true_val(terrain_suitability_marketing_2, unk_terrain_suitability_marketing_2).

measured(s1, terrain_suitability_marketing_2, hard_charging_dream_resort).

all_consistent(terrain_suitability_marketing_2) :- consistent(s1, terrain_suitability_marketing_2).

evidence(all_consistent(terrain_suitability_marketing_2)).
query(true_val(terrain_suitability_marketing_2, hard_charging_dream_resort)).
query(true_val(terrain_suitability_marketing_2, unk_terrain_suitability_marketing_2)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values one_year_mfr_defects=1_year_manufacturer_defects_structural unk_warranty=Unknown
% @importance 0.8

0.95::acc(s25, warranty).
0.82::acc(s26, warranty).

0.95::true_val(warranty, one_year_mfr_defects); 0.05::true_val(warranty, unk_warranty).

measured(s25, warranty, one_year_mfr_defects).
measured(s26, warranty, one_year_mfr_defects).

all_consistent(warranty) :-
    consistent(s25, warranty),
    (indep(s26), consistent(s26, warranty) ; \+indep(s26)).

evidence(all_consistent(warranty)).
query(true_val(warranty, one_year_mfr_defects)).
query(true_val(warranty, unk_warranty)).

% @attr warranty_exclusions
% @type categorical
% @canonical false
% @original_name warranty (exclusions)
% @values no_impact_abuse_misuse_wear=Does_NOT_cover_impact_abuse_misuse_normal_wear unk_warranty_exclusions=Unknown
% @importance 0.8

0.95::acc(s25, warranty_exclusions).
0.82::acc(s26, warranty_exclusions).

0.95::true_val(warranty_exclusions, no_impact_abuse_misuse_wear); 0.05::true_val(warranty_exclusions, unk_warranty_exclusions).

measured(s25, warranty_exclusions, no_impact_abuse_misuse_wear).
measured(s26, warranty_exclusions, no_impact_abuse_misuse_wear).

all_consistent(warranty_exclusions) :-
    consistent(s25, warranty_exclusions),
    (indep(s26), consistent(s26, warranty_exclusions) ; \+indep(s26)).

evidence(all_consistent(warranty_exclusions)).
query(true_val(warranty_exclusions, no_impact_abuse_misuse_wear)).
query(true_val(warranty_exclusions, unk_warranty_exclusions)).

% @attr warranty_no_repairs
% @type categorical
% @canonical false
% @original_name Lib Tech does not offer board repair services
% @values no_repair_services=No_board_repair_services_offered unk_warranty_no_repairs=Unknown
% @importance 0.8

0.93::acc(s25, warranty_no_repairs).

0.92::true_val(warranty_no_repairs, no_repair_services); 0.08::true_val(warranty_no_repairs, unk_warranty_no_repairs).

measured(s25, warranty_no_repairs, no_repair_services).

all_consistent(warranty_no_repairs) :- consistent(s25, warranty_no_repairs).

evidence(all_consistent(warranty_no_repairs)).
query(true_val(warranty_no_repairs, no_repair_services)).
query(true_val(warranty_no_repairs, unk_warranty_no_repairs)).

% @attr return_policy_terms
% @type categorical
% @canonical true
% @original_name return_policy_terms
% @values one_year_return=Up_to_full_year_to_return unk_return_policy_terms=Unknown
% @importance 0.9

0.85::acc(s9, return_policy_terms).

0.78::true_val(return_policy_terms, one_year_return); 0.22::true_val(return_policy_terms, unk_return_policy_terms).

measured(s9, return_policy_terms, one_year_return).

all_consistent(return_policy_terms) :-
    (indep(s9), consistent(s9, return_policy_terms) ; \+indep(s9)).

evidence(all_consistent(return_policy_terms)).
query(true_val(return_policy_terms, one_year_return)).
query(true_val(return_policy_terms, unk_return_policy_terms)).

% @attr evo_price_guarantee
% @type categorical
% @canonical false
% @original_name Evo.com price guarantee
% @values beat_by_5pct=Will_beat_competitor_price_by_5pct unk_evo_price_guarantee=Unknown
% @importance 0.9

0.85::acc(s9, evo_price_guarantee).

0.78::true_val(evo_price_guarantee, beat_by_5pct); 0.22::true_val(evo_price_guarantee, unk_evo_price_guarantee).

measured(s9, evo_price_guarantee, beat_by_5pct).

all_consistent(evo_price_guarantee) :-
    (indep(s9), consistent(s9, evo_price_guarantee) ; \+indep(s9)).

evidence(all_consistent(evo_price_guarantee)).
query(true_val(evo_price_guarantee, beat_by_5pct)).
query(true_val(evo_price_guarantee, unk_evo_price_guarantee)).

% @attr return_policy_terms_pathfinder
% @type categorical
% @canonical false
% @original_name return_policy_terms (Pathfinder 30 days)
% @values v30_days_new_unused=30_days_new_unused_with_tags unk_return_policy_terms_pathfinder=Unknown
% @importance 0.5

0.65::acc(s15, return_policy_terms_pathfinder).

0.59::true_val(return_policy_terms_pathfinder, v30_days_new_unused); 0.41::true_val(return_policy_terms_pathfinder, unk_return_policy_terms_pathfinder).

measured(s15, return_policy_terms_pathfinder, v30_days_new_unused).

all_consistent(return_policy_terms_pathfinder) :-
    (indep(s15), consistent(s15, return_policy_terms_pathfinder) ; \+indep(s15)).

evidence(all_consistent(return_policy_terms_pathfinder)).
query(true_val(return_policy_terms_pathfinder, v30_days_new_unused)).
query(true_val(return_policy_terms_pathfinder, unk_return_policy_terms_pathfinder)).

% @attr eriks_price_match
% @type categorical
% @canonical false
% @original_name ERIK'S price match
% @values v10_days_from_purchase=10_days_from_purchase unk_eriks_price_match=Unknown
% @importance 0.5

0.70::acc(s14, eriks_price_match).

0.60::true_val(eriks_price_match, v10_days_from_purchase); 0.40::true_val(eriks_price_match, unk_eriks_price_match).

measured(s14, eriks_price_match, v10_days_from_purchase).

all_consistent(eriks_price_match) :-
    (indep(s14), consistent(s14, eriks_price_match) ; \+indep(s14)).

evidence(all_consistent(eriks_price_match)).
query(true_val(eriks_price_match, v10_days_from_purchase)).
query(true_val(eriks_price_match, unk_eriks_price_match)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values korua_k2_jones_ride_salomon_yes_cardiff=Korua_Otto_K2_Manifest_Jones_Frontier_Ride_Algorythm_etc unk_comparable_board_cross_brand=Unknown
% @importance 0.95

0.80::acc(s10, comparable_board_cross_brand).

0.76::true_val(comparable_board_cross_brand, korua_k2_jones_ride_salomon_yes_cardiff); 0.24::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s10, comparable_board_cross_brand, korua_k2_jones_ride_salomon_yes_cardiff).

all_consistent(comparable_board_cross_brand) :- consistent(s10, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, korua_k2_jones_ride_salomon_yes_cardiff)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_rc
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (GNU Riders Choice comparison)
% @values rc_sintered_asymmetric=RC_has_sintered_base_asymmetric_sidecut unk_comparable_board_cross_brand_rc=Unknown
% @importance 0.75

0.45::acc(s27, comparable_board_cross_brand_rc).

0.32::true_val(comparable_board_cross_brand_rc, rc_sintered_asymmetric); 0.68::true_val(comparable_board_cross_brand_rc, unk_comparable_board_cross_brand_rc).

measured(s27, comparable_board_cross_brand_rc, rc_sintered_asymmetric).

all_consistent(comparable_board_cross_brand_rc) :- consistent(s27, comparable_board_cross_brand_rc).

evidence(all_consistent(comparable_board_cross_brand_rc)).
query(true_val(comparable_board_cross_brand_rc, rc_sintered_asymmetric)).
query(true_val(comparable_board_cross_brand_rc, unk_comparable_board_cross_brand_rc)).

% @attr comparable_board_cross_brand_yes
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Yes boards comparison)
% @values yes_less_damp=Yes_boards_little_less_damp unk_comparable_board_cross_brand_yes=Unknown
% @importance 0.75

0.45::acc(s27, comparable_board_cross_brand_yes).

0.32::true_val(comparable_board_cross_brand_yes, yes_less_damp); 0.68::true_val(comparable_board_cross_brand_yes, unk_comparable_board_cross_brand_yes).

measured(s27, comparable_board_cross_brand_yes, yes_less_damp).

all_consistent(comparable_board_cross_brand_yes) :- consistent(s27, comparable_board_cross_brand_yes).

evidence(all_consistent(comparable_board_cross_brand_yes)).
query(true_val(comparable_board_cross_brand_yes, yes_less_damp)).
query(true_val(comparable_board_cross_brand_yes, unk_comparable_board_cross_brand_yes)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values hate_tnt_base_slow=Hate_TNT_base_slower_than_sintered unk_user_review_forum=Unknown
% @importance 0.75

0.42::acc(s27, user_review_forum).

0.32::true_val(user_review_forum, hate_tnt_base_slow); 0.68::true_val(user_review_forum, unk_user_review_forum).

measured(s27, user_review_forum, hate_tnt_base_slow).

all_consistent(user_review_forum) :- consistent(s27, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, hate_tnt_base_slow)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr user_review_forum_2
% @type categorical
% @canonical false
% @original_name user_review_forum (Jones MT comparison)
% @values jones_mt_more_freestyle=Jones_MT_more_freestyle_both_recommended_AM unk_user_review_forum_2=Unknown
% @importance 0.75

0.40::acc(s28, user_review_forum_2).

0.29::true_val(user_review_forum_2, jones_mt_more_freestyle); 0.71::true_val(user_review_forum_2, unk_user_review_forum_2).

measured(s28, user_review_forum_2, jones_mt_more_freestyle).

all_consistent(user_review_forum_2) :- consistent(s28, user_review_forum_2).

evidence(all_consistent(user_review_forum_2)).
query(true_val(user_review_forum_2, jones_mt_more_freestyle)).
query(true_val(user_review_forum_2, unk_user_review_forum_2)).

% @attr user_review_forum_3
% @type categorical
% @canonical false
% @original_name user_review_forum (rave reviews)
% @values rave_reviews_both=Both_get_rave_reviews_similar_AM_use unk_user_review_forum_3=Unknown
% @importance 0.75

0.40::acc(s28, user_review_forum_3).

0.29::true_val(user_review_forum_3, rave_reviews_both); 0.71::true_val(user_review_forum_3, unk_user_review_forum_3).

measured(s28, user_review_forum_3, rave_reviews_both).

all_consistent(user_review_forum_3) :- consistent(s28, user_review_forum_3).

evidence(all_consistent(user_review_forum_3)).
query(true_val(user_review_forum_3, rave_reviews_both)).
query(true_val(user_review_forum_3, unk_user_review_forum_3)).

% @attr user_review_forum_4
% @type categorical
% @canonical false
% @original_name user_review_forum (Deep Thinker suggestion)
% @values deep_thinker_am_freeride=Deep_Thinker_suggested_as_AM_Freeride_alternative unk_user_review_forum_4=Unknown
% @importance 0.75

0.40::acc(s28, user_review_forum_4).

0.29::true_val(user_review_forum_4, deep_thinker_am_freeride); 0.71::true_val(user_review_forum_4, unk_user_review_forum_4).

measured(s28, user_review_forum_4, deep_thinker_am_freeride).

all_consistent(user_review_forum_4) :- consistent(s28, user_review_forum_4).

evidence(all_consistent(user_review_forum_4)).
query(true_val(user_review_forum_4, deep_thinker_am_freeride)).
query(true_val(user_review_forum_4, unk_user_review_forum_4)).

% @attr user_review_forum_5
% @type categorical
% @canonical false
% @original_name user_review_forum (TRS vs TW comparison)
% @values trs_speed_jumps_tw_powder=TRS_preferred_speed_jumps_TW_better_powder unk_user_review_forum_5=Unknown
% @importance 0.7

0.40::acc(s29, user_review_forum_5).

0.30::true_val(user_review_forum_5, trs_speed_jumps_tw_powder); 0.70::true_val(user_review_forum_5, unk_user_review_forum_5).

measured(s29, user_review_forum_5, trs_speed_jumps_tw_powder).

all_consistent(user_review_forum_5) :- consistent(s29, user_review_forum_5).

evidence(all_consistent(user_review_forum_5)).
query(true_val(user_review_forum_5, trs_speed_jumps_tw_powder)).
query(true_val(user_review_forum_5, unk_user_review_forum_5)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values ejack_dynamo_skunk=EJack_Knife_Dynamo_Skunk_Ape unk_comparable_board_same_brand=Unknown
% @importance 1.0

0.90::acc(s1, comparable_board_same_brand).

0.92::true_val(comparable_board_same_brand, ejack_dynamo_skunk); 0.08::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s1, comparable_board_same_brand, ejack_dynamo_skunk).

all_consistent(comparable_board_same_brand) :- consistent(s1, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, ejack_dynamo_skunk)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr reviewer_opinion_snowboardingprofiles_10
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (highly recommended)
% @values highly_recommended=Highly_recommended_everywhere_internet unk_reviewer_opinion_snowboardingprofiles_10=Unknown
% @importance 0.75

0.50::acc(s27, reviewer_opinion_snowboardingprofiles_10).

0.32::true_val(reviewer_opinion_snowboardingprofiles_10, highly_recommended); 0.68::true_val(reviewer_opinion_snowboardingprofiles_10, unk_reviewer_opinion_snowboardingprofiles_10).

measured(s27, reviewer_opinion_snowboardingprofiles_10, highly_recommended).

all_consistent(reviewer_opinion_snowboardingprofiles_10) :- consistent(s27, reviewer_opinion_snowboardingprofiles_10).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_10)).
query(true_val(reviewer_opinion_snowboardingprofiles_10, highly_recommended)).
query(true_val(reviewer_opinion_snowboardingprofiles_10, unk_reviewer_opinion_snowboardingprofiles_10)).

% @attr pop
% @type categorical
% @canonical true
% @original_name pop
% @values ton_of_pop=A_TON_of_pop unk_pop=Unknown
% @importance 0.95

0.80::acc(s10, pop).

0.76::true_val(pop, ton_of_pop); 0.24::true_val(pop, unk_pop).

measured(s10, pop, ton_of_pop).

all_consistent(pop) :- consistent(s10, pop).

evidence(all_consistent(pop)).
query(true_val(pop, ton_of_pop)).
query(true_val(pop, unk_pop)).

% @attr reviewer_opinion_the_good_ride_quiver
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (quiver killer)
% @values quiver_killer=Quiver_killer_handles_everything unk_reviewer_opinion_the_good_ride_quiver=Unknown
% @importance 0.95

0.82::acc(s10, reviewer_opinion_the_good_ride_quiver).
0.82::acc(s22, reviewer_opinion_the_good_ride_quiver).

0.95::true_val(reviewer_opinion_the_good_ride_quiver, quiver_killer); 0.05::true_val(reviewer_opinion_the_good_ride_quiver, unk_reviewer_opinion_the_good_ride_quiver).

measured(s10, reviewer_opinion_the_good_ride_quiver, quiver_killer).
measured(s22, reviewer_opinion_the_good_ride_quiver, quiver_killer).

all_consistent(reviewer_opinion_the_good_ride_quiver) :-
    consistent(s10, reviewer_opinion_the_good_ride_quiver),
    consistent(s22, reviewer_opinion_the_good_ride_quiver).

evidence(all_consistent(reviewer_opinion_the_good_ride_quiver)).
query(true_val(reviewer_opinion_the_good_ride_quiver, quiver_killer)).
query(true_val(reviewer_opinion_the_good_ride_quiver, unk_reviewer_opinion_the_good_ride_quiver)).

% @attr reviewer_opinion_the_good_ride_forgiving
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (very forgiving)
% @values very_forgiving_catch_free=Very_forgiving_easy_turn_initiation_catch_free unk_reviewer_opinion_the_good_ride_forgiving=Unknown
% @importance 0.83

0.82::acc(s10, reviewer_opinion_the_good_ride_forgiving).
0.72::acc(s23, reviewer_opinion_the_good_ride_forgiving).

0.95::true_val(reviewer_opinion_the_good_ride_forgiving, very_forgiving_catch_free); 0.05::true_val(reviewer_opinion_the_good_ride_forgiving, unk_reviewer_opinion_the_good_ride_forgiving).

measured(s10, reviewer_opinion_the_good_ride_forgiving, very_forgiving_catch_free).
measured(s23, reviewer_opinion_the_good_ride_forgiving, very_forgiving_catch_free).

all_consistent(reviewer_opinion_the_good_ride_forgiving) :-
    consistent(s10, reviewer_opinion_the_good_ride_forgiving),
    consistent(s23, reviewer_opinion_the_good_ride_forgiving).

evidence(all_consistent(reviewer_opinion_the_good_ride_forgiving)).
query(true_val(reviewer_opinion_the_good_ride_forgiving, very_forgiving_catch_free)).
query(true_val(reviewer_opinion_the_good_ride_forgiving, unk_reviewer_opinion_the_good_ride_forgiving)).

% @attr reviewer_opinion_the_good_ride_butter
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (easy to butter)
% @values easy_butter_nose_tail=Easy_to_butter_nose_and_tail unk_reviewer_opinion_the_good_ride_butter=Unknown
% @importance 0.95

0.82::acc(s10, reviewer_opinion_the_good_ride_butter).
0.82::acc(s22, reviewer_opinion_the_good_ride_butter).

0.95::true_val(reviewer_opinion_the_good_ride_butter, easy_butter_nose_tail); 0.05::true_val(reviewer_opinion_the_good_ride_butter, unk_reviewer_opinion_the_good_ride_butter).

measured(s10, reviewer_opinion_the_good_ride_butter, easy_butter_nose_tail).
measured(s22, reviewer_opinion_the_good_ride_butter, easy_butter_nose_tail).

all_consistent(reviewer_opinion_the_good_ride_butter) :-
    consistent(s10, reviewer_opinion_the_good_ride_butter),
    consistent(s22, reviewer_opinion_the_good_ride_butter).

evidence(all_consistent(reviewer_opinion_the_good_ride_butter)).
query(true_val(reviewer_opinion_the_good_ride_butter, easy_butter_nose_tail)).
query(true_val(reviewer_opinion_the_good_ride_butter, unk_reviewer_opinion_the_good_ride_butter)).

% @attr reviewer_opinion_snowboardingprofiles_11
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (nimbleness)
% @values excellent_nimbleness_slow_speeds=Excellent_nimbleness_slow_speeds_great_in_trees unk_reviewer_opinion_snowboardingprofiles_11=Unknown
% @importance 0.95

0.82::acc(s22, reviewer_opinion_snowboardingprofiles_11).

0.74::true_val(reviewer_opinion_snowboardingprofiles_11, excellent_nimbleness_slow_speeds); 0.26::true_val(reviewer_opinion_snowboardingprofiles_11, unk_reviewer_opinion_snowboardingprofiles_11).

measured(s22, reviewer_opinion_snowboardingprofiles_11, excellent_nimbleness_slow_speeds).

all_consistent(reviewer_opinion_snowboardingprofiles_11) :- consistent(s22, reviewer_opinion_snowboardingprofiles_11).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_11)).
query(true_val(reviewer_opinion_snowboardingprofiles_11, excellent_nimbleness_slow_speeds)).
query(true_val(reviewer_opinion_snowboardingprofiles_11, unk_reviewer_opinion_snowboardingprofiles_11)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values very_doable_almost_true_twin=Very_doable_switch_almost_like_true_twin unk_switch_riding=Unknown
% @importance 0.95

0.82::acc(s10, switch_riding).

0.76::true_val(switch_riding, very_doable_almost_true_twin); 0.24::true_val(switch_riding, unk_switch_riding).

measured(s10, switch_riding, very_doable_almost_true_twin).

all_consistent(switch_riding) :- consistent(s10, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, very_doable_almost_true_twin)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr negative_aspect_speed
% @type categorical
% @canonical false
% @original_name negative_aspect (speed stability)
% @values wobbly_high_speed=Gets_wobbly_at_high_speed_loose unk_negative_aspect_speed=Unknown
% @importance 0.95

0.82::acc(s10, negative_aspect_speed).
0.80::acc(s22, negative_aspect_speed).

0.95::true_val(negative_aspect_speed, wobbly_high_speed); 0.05::true_val(negative_aspect_speed, unk_negative_aspect_speed).

measured(s10, negative_aspect_speed, wobbly_high_speed).
measured(s22, negative_aspect_speed, wobbly_high_speed).

all_consistent(negative_aspect_speed) :-
    consistent(s10, negative_aspect_speed),
    consistent(s22, negative_aspect_speed).

evidence(all_consistent(negative_aspect_speed)).
query(true_val(negative_aspect_speed, wobbly_high_speed)).
query(true_val(negative_aspect_speed, unk_negative_aspect_speed)).

% @attr negative_aspect_carving
% @type categorical
% @canonical false
% @original_name negative_aspect (carving hurried)
% @values rocker_hurries_turn=Rocker_in_middle_hurries_through_turn unk_negative_aspect_carving=Unknown
% @importance 0.95

0.82::acc(s10, negative_aspect_carving).

0.76::true_val(negative_aspect_carving, rocker_hurries_turn); 0.24::true_val(negative_aspect_carving, unk_negative_aspect_carving).

measured(s10, negative_aspect_carving, rocker_hurries_turn).

all_consistent(negative_aspect_carving) :- consistent(s10, negative_aspect_carving).

evidence(all_consistent(negative_aspect_carving)).
query(true_val(negative_aspect_carving, rocker_hurries_turn)).
query(true_val(negative_aspect_carving, unk_negative_aspect_carving)).

% @attr chatter_performance
% @type categorical
% @canonical true
% @original_name chatter_performance
% @values more_chattery_than_damp=More_chattery_than_damp_doesnt_crush_crud unk_chatter_performance=Unknown
% @importance 0.95

0.82::acc(s22, chatter_performance).

0.74::true_val(chatter_performance, more_chattery_than_damp); 0.26::true_val(chatter_performance, unk_chatter_performance).

measured(s22, chatter_performance, more_chattery_than_damp).

all_consistent(chatter_performance) :- consistent(s22, chatter_performance).

evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, more_chattery_than_damp)).
query(true_val(chatter_performance, unk_chatter_performance)).

% @attr negative_aspect_waist
% @type categorical
% @canonical false
% @original_name negative_aspect (wider waist)
% @values wider_waist_slow_turn_small_boot=Slightly_wider_waist_slow_turn_smaller_boots unk_negative_aspect_waist=Unknown
% @importance 0.95

0.80::acc(s10, negative_aspect_waist).

0.76::true_val(negative_aspect_waist, wider_waist_slow_turn_small_boot); 0.24::true_val(negative_aspect_waist, unk_negative_aspect_waist).

measured(s10, negative_aspect_waist, wider_waist_slow_turn_small_boot).

all_consistent(negative_aspect_waist) :- consistent(s10, negative_aspect_waist).

evidence(all_consistent(negative_aspect_waist)).
query(true_val(negative_aspect_waist, wider_waist_slow_turn_small_boot)).
query(true_val(negative_aspect_waist, unk_negative_aspect_waist)).

% @attr not_ideal_for
% @type categorical
% @canonical false
% @original_name Not ideal for dedicated carving enthusiasts or speed demons
% @values not_carving_speed=Not_ideal_for_carving_enthusiasts_or_speed_demons unk_not_ideal_for=Unknown
% @importance 0.95

0.80::acc(s10, not_ideal_for).

0.76::true_val(not_ideal_for, not_carving_speed); 0.24::true_val(not_ideal_for, unk_not_ideal_for).

measured(s10, not_ideal_for, not_carving_speed).

all_consistent(not_ideal_for) :- consistent(s10, not_ideal_for).

evidence(all_consistent(not_ideal_for)).
query(true_val(not_ideal_for, not_carving_speed)).
query(true_val(not_ideal_for, unk_not_ideal_for)).

% @attr lib_tech_review_rating
% @type categorical
% @canonical false
% @original_name Lib Tech website review rating
% @values v99pct_37reviews=99pct_approval_37_reviews unk_lib_tech_review_rating=Unknown
% @importance 1.0

0.88::acc(s1, lib_tech_review_rating).

0.92::true_val(lib_tech_review_rating, v99pct_37reviews); 0.08::true_val(lib_tech_review_rating, unk_lib_tech_review_rating).

measured(s1, lib_tech_review_rating, v99pct_37reviews).

all_consistent(lib_tech_review_rating) :- consistent(s1, lib_tech_review_rating).

evidence(all_consistent(lib_tech_review_rating)).
query(true_val(lib_tech_review_rating, v99pct_37reviews)).
query(true_val(lib_tech_review_rating, unk_lib_tech_review_rating)).

% @attr evo_retailer_info
% @type categorical
% @canonical false
% @original_name evo.com retailer info
% @values major_specialty_1yr_return=Major_specialty_retailer_1yr_returns_5pct_beat unk_evo_retailer_info=Unknown
% @importance 0.9

0.85::acc(s9, evo_retailer_info).

0.78::true_val(evo_retailer_info, major_specialty_1yr_return); 0.22::true_val(evo_retailer_info, unk_evo_retailer_info).

measured(s9, evo_retailer_info, major_specialty_1yr_return).

all_consistent(evo_retailer_info) :-
    (indep(s9), consistent(s9, evo_retailer_info) ; \+indep(s9)).

evidence(all_consistent(evo_retailer_info)).
query(true_val(evo_retailer_info, major_specialty_1yr_return)).
query(true_val(evo_retailer_info, unk_evo_retailer_info)).

% @attr backcountry_retailer_info
% @type categorical
% @canonical false
% @original_name Backcountry.com retailer info
% @values large_specialty_40pct_off=Large_specialty_retailer_up_to_40pct_off unk_backcountry_retailer_info=Unknown
% @importance 0.95

0.80::acc(s10, backcountry_retailer_info).

0.76::true_val(backcountry_retailer_info, large_specialty_40pct_off); 0.24::true_val(backcountry_retailer_info, unk_backcountry_retailer_info).

measured(s10, backcountry_retailer_info, large_specialty_40pct_off).

all_consistent(backcountry_retailer_info) :- consistent(s10, backcountry_retailer_info).

evidence(all_consistent(backcountry_retailer_info)).
query(true_val(backcountry_retailer_info, large_specialty_40pct_off)).
query(true_val(backcountry_retailer_info, unk_backcountry_retailer_info)).

% @attr tactics_retailer_info
% @type categorical
% @canonical false
% @original_name Tactics.com retailer info
% @values reputable_specialty=Reputable_snowboard_specialty_retailer unk_tactics_retailer_info=Unknown
% @importance 0.85

0.80::acc(s12, tactics_retailer_info).

0.76::true_val(tactics_retailer_info, reputable_specialty); 0.24::true_val(tactics_retailer_info, unk_tactics_retailer_info).

measured(s12, tactics_retailer_info, reputable_specialty).

all_consistent(tactics_retailer_info) :-
    (indep(s12), consistent(s12, tactics_retailer_info) ; \+indep(s12)).

evidence(all_consistent(tactics_retailer_info)).
query(true_val(tactics_retailer_info, reputable_specialty)).
query(true_val(tactics_retailer_info, unk_tactics_retailer_info)).

% @attr salty_peaks_retailer_info
% @type categorical
% @canonical false
% @original_name Salty Peaks retailer info
% @values established_10day_price_match=Established_specialty_shop_10day_price_match unk_salty_peaks_retailer_info=Unknown
% @importance 0.45

0.55::acc(s17, salty_peaks_retailer_info).

0.42::true_val(salty_peaks_retailer_info, established_10day_price_match); 0.58::true_val(salty_peaks_retailer_info, unk_salty_peaks_retailer_info).

measured(s17, salty_peaks_retailer_info, established_10day_price_match).

all_consistent(salty_peaks_retailer_info) :-
    (indep(s17), consistent(s17, salty_peaks_retailer_info) ; \+indep(s17)).

evidence(all_consistent(salty_peaks_retailer_info)).
query(true_val(salty_peaks_retailer_info, established_10day_price_match)).
query(true_val(salty_peaks_retailer_info, unk_salty_peaks_retailer_info)).

% @attr sun_ski_retailer_info
% @type categorical
% @canonical false
% @original_name Sun & Ski Sports retailer info
% @values best_us_price_60pct_off=Best_listed_US_price_up_to_60pct_off unk_sun_ski_retailer_info=Unknown
% @importance 0.95

0.80::acc(s10, sun_ski_retailer_info).

0.76::true_val(sun_ski_retailer_info, best_us_price_60pct_off); 0.24::true_val(sun_ski_retailer_info, unk_sun_ski_retailer_info).

measured(s10, sun_ski_retailer_info, best_us_price_60pct_off).

all_consistent(sun_ski_retailer_info) :- consistent(s10, sun_ski_retailer_info).

evidence(all_consistent(sun_ski_retailer_info)).
query(true_val(sun_ski_retailer_info, best_us_price_60pct_off)).
query(true_val(sun_ski_retailer_info, unk_sun_ski_retailer_info)).

% @attr the_house_retailer_info
% @type categorical
% @canonical false
% @original_name The House retailer info
% @values board_sports_specialty_50pct_off=Board_sports_specialty_up_to_50pct_off unk_the_house_retailer_info=Unknown
% @importance 0.95

0.80::acc(s10, the_house_retailer_info).

0.76::true_val(the_house_retailer_info, board_sports_specialty_50pct_off); 0.24::true_val(the_house_retailer_info, unk_the_house_retailer_info).

measured(s10, the_house_retailer_info, board_sports_specialty_50pct_off).

all_consistent(the_house_retailer_info) :- consistent(s10, the_house_retailer_info).

evidence(all_consistent(the_house_retailer_info)).
query(true_val(the_house_retailer_info, board_sports_specialty_50pct_off)).
query(true_val(the_house_retailer_info, unk_the_house_retailer_info)).

% @attr prfo_retailer_info
% @type categorical
% @canonical false
% @original_name PRFO Sports Canada retailer info
% @values canadian_specialty=Canadian_specialty_retailer unk_prfo_retailer_info=Unknown
% @importance 0.95

0.80::acc(s10, prfo_retailer_info).

0.76::true_val(prfo_retailer_info, canadian_specialty); 0.24::true_val(prfo_retailer_info, unk_prfo_retailer_info).

measured(s10, prfo_retailer_info, canadian_specialty).

all_consistent(prfo_retailer_info) :- consistent(s10, prfo_retailer_info).

evidence(all_consistent(prfo_retailer_info)).
query(true_val(prfo_retailer_info, canadian_specialty)).
query(true_val(prfo_retailer_info, unk_prfo_retailer_info)).

% @attr blue_tomato_retailer_info
% @type categorical
% @canonical false
% @original_name BlueTomato retailer info
% @values major_eu_multi_country=Major_European_retailer_multiple_countries unk_blue_tomato_retailer_info=Unknown
% @importance 0.85

0.75::acc(s11, blue_tomato_retailer_info).

0.60::true_val(blue_tomato_retailer_info, major_eu_multi_country); 0.40::true_val(blue_tomato_retailer_info, unk_blue_tomato_retailer_info).

measured(s11, blue_tomato_retailer_info, major_eu_multi_country).

all_consistent(blue_tomato_retailer_info) :- consistent(s11, blue_tomato_retailer_info).

evidence(all_consistent(blue_tomato_retailer_info)).
query(true_val(blue_tomato_retailer_info, major_eu_multi_country)).
query(true_val(blue_tomato_retailer_info, unk_blue_tomato_retailer_info)).