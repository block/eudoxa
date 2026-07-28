0.12::indep(smerchant).
0.15::indep(s4).
0.20::indep(s10).
0.15::indep(s11).
0.15::indep(s29).
0.20::indep(s33).
0.15::indep(s34).
0.15::indep(s35).
0.12::indep(s37).
0.12::indep(s39).
0.15::indep(s40).
0.12::indep(s80).
0.15::indep(s93).
0.15::indep(s98).
0.15::indep(s109).
0.15::indep(s113).
0.15::indep(s116).
0.12::indep(s118).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

0.95::acc(s1, brand).
0.70::acc(s4, brand).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values salomon=Salomon unk_brand=Unknown
% @importance 0.90

0.95::true_val(brand, salomon); 0.05::true_val(brand, unk_brand).

measured(s1, brand, salomon).
measured(s4, brand, salomon).

all_consistent(brand) :-
    consistent(s1, brand),
    (indep(s4), consistent(s4, brand) ; \+indep(s4)).

evidence(all_consistent(brand)).
query(true_val(brand, salomon)).
query(true_val(brand, unk_brand)).

0.95::acc(s1, model_name).
0.93::acc(s7, model_name).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values huck_knife=Huck_Knife unk_model_name=Unknown
% @importance 0.95

0.97::true_val(model_name, huck_knife); 0.03::true_val(model_name, unk_model_name).

measured(s1, model_name, huck_knife).
measured(s7, model_name, huck_knife).

all_consistent(model_name) :-
    consistent(s1, model_name),
    consistent(s7, model_name).

evidence(all_consistent(model_name)).
query(true_val(model_name, huck_knife)).
query(true_val(model_name, unk_model_name)).

0.80::acc(s4, model_year).
0.82::acc(s118, model_year).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2027_au_2025_26_nh=2027_AU_equivalent_2025_2026_NH unk_model_year=Unknown
% @importance 0.825

0.90::true_val(model_year, y2027_au_2025_26_nh); 0.10::true_val(model_year, unk_model_year).

measured(s4, model_year, y2027_au_2025_26_nh).
measured(s118, model_year, y2027_au_2025_26_nh).

all_consistent(model_year) :-
    (indep(s4), consistent(s4, model_year) ; \+indep(s4)),
    (indep(s118), consistent(s118, model_year) ; \+indep(s118)).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2027_au_2025_26_nh)).
query(true_val(model_year, unk_model_year)).

0.85::acc(s83, manufacturer).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values salomon_sas_france=Salomon_SAS_Annecy_France unk_manufacturer=Unknown
% @importance 0.55

0.71::true_val(manufacturer, salomon_sas_france); 0.29::true_val(manufacturer, unk_manufacturer).

measured(s83, manufacturer, salomon_sas_france).

all_consistent(manufacturer) :-
    consistent(s83, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, salomon_sas_france)).
query(true_val(manufacturer, unk_manufacturer)).

0.85::acc(s83, parent_company).

% @attr parent_company
% @type categorical
% @canonical false
% @original_name Parent company
% @values amer_sports=Amer_Sports_Finland unk_parent_company=Unknown
% @importance 0.55

0.71::true_val(parent_company, amer_sports); 0.29::true_val(parent_company, unk_parent_company).

measured(s83, parent_company, amer_sports).

all_consistent(parent_company) :-
    consistent(s83, parent_company).

evidence(all_consistent(parent_company)).
query(true_val(parent_company, amer_sports)).
query(true_val(parent_company, unk_parent_company)).

0.85::acc(s83, salomon_founded).

% @attr salomon_founded
% @type categorical
% @canonical false
% @original_name Salomon founded
% @values y1947_annecy=1947_Annecy_French_Alps unk_salomon_founded=Unknown
% @importance 0.55

0.71::true_val(salomon_founded, y1947_annecy); 0.29::true_val(salomon_founded, unk_salomon_founded).

measured(s83, salomon_founded, y1947_annecy).

all_consistent(salomon_founded) :-
    consistent(s83, salomon_founded).

evidence(all_consistent(salomon_founded)).
query(true_val(salomon_founded, y1947_annecy)).
query(true_val(salomon_founded, unk_salomon_founded)).

0.80::acc(s82, design_development_location).

% @attr design_development_location
% @type categorical
% @canonical false
% @original_name Design & development location
% @values annecy_france=Annecy_Design_Center_France unk_design_development_location=Unknown
% @importance 0.50

0.63::true_val(design_development_location, annecy_france); 0.37::true_val(design_development_location, unk_design_development_location).

measured(s82, design_development_location, annecy_france).

all_consistent(design_development_location) :-
    consistent(s82, design_development_location).

evidence(all_consistent(design_development_location)).
query(true_val(design_development_location, annecy_france)).
query(true_val(design_development_location, unk_design_development_location)).

0.75::acc(s85, manufacturing_location).
0.78::acc(s89, manufacturing_location).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values china=China unk_manufacturing_location=Unknown
% @importance 0.45

0.95::true_val(manufacturing_location, china); 0.05::true_val(manufacturing_location, unk_manufacturing_location).

measured(s85, manufacturing_location, china).
measured(s89, manufacturing_location, china).

all_consistent(manufacturing_location) :-
    consistent(s85, manufacturing_location),
    consistent(s89, manufacturing_location).

evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, china)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

0.93::acc(s12, salomon_product_description).

% @attr salomon_product_description
% @type categorical
% @canonical false
% @original_name Salomon product description
% @values flagship_true_twin_freestyle=Flagship_true_twin_freestyle_board unk_salomon_product_description=Unknown
% @importance 0.90

0.90::true_val(salomon_product_description, flagship_true_twin_freestyle); 0.10::true_val(salomon_product_description, unk_salomon_product_description).

measured(s12, salomon_product_description, flagship_true_twin_freestyle).

all_consistent(salomon_product_description) :-
    consistent(s12, salomon_product_description).

evidence(all_consistent(salomon_product_description)).
query(true_val(salomon_product_description, flagship_true_twin_freestyle)).
query(true_val(salomon_product_description, unk_salomon_product_description)).

0.82::acc(s14, model_first_available_year).
0.80::acc(s110, model_first_available_year).

% @attr model_first_available_year
% @type numeric
% @canonical true
% @original_name model_first_available_year
% @values y2017=2017 unk_model_first_available_year=Unknown
% @importance 0.825

0.95::true_val(model_first_available_year, y2017); 0.05::true_val(model_first_available_year, unk_model_first_available_year).

measured(s14, model_first_available_year, y2017).
measured(s110, model_first_available_year, y2017).

all_consistent(model_first_available_year) :-
    consistent(s14, model_first_available_year),
    consistent(s110, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2017)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

0.80::acc(s110, model_continuity).

% @attr model_continuity
% @type categorical
% @canonical false
% @original_name Model continuity
% @values same_core_design_since_2017=Same_core_design_since_2017 unk_model_continuity=Unknown
% @importance 0.80

0.68::true_val(model_continuity, same_core_design_since_2017); 0.32::true_val(model_continuity, unk_model_continuity).

measured(s110, model_continuity, same_core_design_since_2017).

all_consistent(model_continuity) :-
    consistent(s110, model_continuity).

evidence(all_consistent(model_continuity)).
query(true_val(model_continuity, same_core_design_since_2017)).
query(true_val(model_continuity, unk_model_continuity)).

0.80::acc(s113, redesign_year).

% @attr redesign_year
% @type categorical
% @canonical true
% @original_name redesign_year
% @values updated_graphics_popster_bioresin=Updated_graphics_Popster_Booster_biobased_resin unk_redesign_year=Unknown
% @importance 0.75

0.63::true_val(redesign_year, updated_graphics_popster_bioresin); 0.37::true_val(redesign_year, unk_redesign_year).

measured(s113, redesign_year, updated_graphics_popster_bioresin).

all_consistent(redesign_year) :-
    (indep(s113), consistent(s113, redesign_year) ; \+indep(s113)).

evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, updated_graphics_popster_bioresin)).
query(true_val(redesign_year, unk_redesign_year)).

0.95::acc(smerchant, price_aud_merchant).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v929_99=929.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.95::true_val(price_aud_merchant, v929_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(smerchant, price_aud_merchant, v929_99).

all_consistent(price_aud_merchant) :-
    consistent(smerchant, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v929_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

0.88::acc(s32, price_usd_evo).

% @attr price_usd_evo
% @type categorical
% @canonical true
% @original_name price_usd_evo
% @values in_stock_2026=In_stock_evo_2026_model unk_price_usd_evo=Unknown
% @importance 0.90

0.77::true_val(price_usd_evo, in_stock_2026); 0.23::true_val(price_usd_evo, unk_price_usd_evo).

measured(s32, price_usd_evo, in_stock_2026).

all_consistent(price_usd_evo) :-
    (indep(s32), consistent(s32, price_usd_evo) ; \+indep(s32)).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, in_stock_2026)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

0.85::acc(s33, price_usd_willis).

% @attr price_usd_willis
% @type numeric
% @unit USD
% @canonical false
% @original_name USD price (Willi's Ski & Board)
% @values v579_95=579.95 unk_price_usd_willis=Unknown
% @importance 0.85

0.63::true_val(price_usd_willis, v579_95); 0.37::true_val(price_usd_willis, unk_price_usd_willis).

measured(s33, price_usd_willis, v579_95).

all_consistent(price_usd_willis) :-
    consistent(s33, price_usd_willis).

evidence(all_consistent(price_usd_willis)).
query(true_val(price_usd_willis, v579_95)).
query(true_val(price_usd_willis, unk_price_usd_willis)).

0.82::acc(s22, price_usd_snowboardingprofiles).

% @attr price_usd_snowboardingprofiles
% @type numeric
% @unit USD
% @canonical false
% @original_name USD price (SnowboardingProfiles review reference)
% @values v579=579.0 unk_price_usd_snowboardingprofiles=Unknown
% @importance 0.85

0.68::true_val(price_usd_snowboardingprofiles, v579); 0.32::true_val(price_usd_snowboardingprofiles, unk_price_usd_snowboardingprofiles).

measured(s22, price_usd_snowboardingprofiles, v579).

all_consistent(price_usd_snowboardingprofiles) :-
    consistent(s22, price_usd_snowboardingprofiles).

evidence(all_consistent(price_usd_snowboardingprofiles)).
query(true_val(price_usd_snowboardingprofiles, v579)).
query(true_val(price_usd_snowboardingprofiles, unk_price_usd_snowboardingprofiles)).

0.80::acc(s14, price_compared_to_average).

% @attr price_compared_to_average
% @type categorical
% @canonical false
% @original_name Price compared to average snowboard
% @values approx_4_less_than_avg=Approximately_4_05_less_than_average_468_01 unk_price_compared_to_average=Unknown
% @importance 0.85

0.68::true_val(price_compared_to_average, approx_4_less_than_avg); 0.32::true_val(price_compared_to_average, unk_price_compared_to_average).

measured(s14, price_compared_to_average, approx_4_less_than_avg).

all_consistent(price_compared_to_average) :-
    consistent(s14, price_compared_to_average).

evidence(all_consistent(price_compared_to_average)).
query(true_val(price_compared_to_average, approx_4_less_than_avg)).
query(true_val(price_compared_to_average, unk_price_compared_to_average)).

0.80::acc(s108, price_value_assessment).

% @attr price_value_assessment
% @type categorical
% @canonical false
% @original_name Price value assessment
% @values about_20_cheaper_than_competitors=About_20_cheaper_than_similar_eg_DOA unk_price_value_assessment=Unknown
% @importance 0.80

0.68::true_val(price_value_assessment, about_20_cheaper_than_competitors); 0.32::true_val(price_value_assessment, unk_price_value_assessment).

measured(s108, price_value_assessment, about_20_cheaper_than_competitors).

all_consistent(price_value_assessment) :-
    consistent(s108, price_value_assessment).

evidence(all_consistent(price_value_assessment)).
query(true_val(price_value_assessment, about_20_cheaper_than_competitors)).
query(true_val(price_value_assessment, unk_price_value_assessment)).

0.82::acc(s4, availability_status).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values in_stock_2026=In_stock_2026_model_evo unk_availability_status=Unknown
% @importance 0.90

0.77::true_val(availability_status, in_stock_2026); 0.23::true_val(availability_status, unk_availability_status).

measured(s4, availability_status, in_stock_2026).

all_consistent(availability_status) :-
    consistent(s4, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, in_stock_2026)).
query(true_val(availability_status, unk_availability_status)).

0.82::acc(s118, availability_status_preorder_au).

% @attr availability_status_preorder_au
% @type categorical
% @canonical false
% @original_name availability_status
% @values preorder_apr_may_2026=Preorder_delivery_April_May_2026 unk_availability_status_preorder_au=Unknown
% @importance 0.85

0.63::true_val(availability_status_preorder_au, preorder_apr_may_2026); 0.37::true_val(availability_status_preorder_au, unk_availability_status_preorder_au).

measured(s118, availability_status_preorder_au, preorder_apr_may_2026).

all_consistent(availability_status_preorder_au) :-
    (indep(s118), consistent(s118, availability_status_preorder_au) ; \+indep(s118)).

evidence(all_consistent(availability_status_preorder_au)).
query(true_val(availability_status_preorder_au, preorder_apr_may_2026)).
query(true_val(availability_status_preorder_au, unk_availability_status_preorder_au)).

0.88::acc(s32, availability_status_evo).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status
% @values in_stock_2026_evo=In_stock_2026_model_evo unk_availability_status_evo=Unknown
% @importance 0.90

0.77::true_val(availability_status_evo, in_stock_2026_evo); 0.23::true_val(availability_status_evo, unk_availability_status_evo).

measured(s32, availability_status_evo, in_stock_2026_evo).

all_consistent(availability_status_evo) :-
    consistent(s32, availability_status_evo).

evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, in_stock_2026_evo)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

0.88::acc(s93, availability_status_tactics).

% @attr availability_status_tactics
% @type categorical
% @canonical false
% @original_name availability_status
% @values in_stock_2026_tactics=In_stock_2026_model_Tactics unk_availability_status_tactics=Unknown
% @importance 0.80

0.72::true_val(availability_status_tactics, in_stock_2026_tactics); 0.28::true_val(availability_status_tactics, unk_availability_status_tactics).

measured(s93, availability_status_tactics, in_stock_2026_tactics).

all_consistent(availability_status_tactics) :-
    (indep(s93), consistent(s93, availability_status_tactics) ; \+indep(s93)).

evidence(all_consistent(availability_status_tactics)).
query(true_val(availability_status_tactics, in_stock_2026_tactics)).
query(true_val(availability_status_tactics, unk_availability_status_tactics)).

0.85::acc(s33, availability_status_willis).

% @attr availability_status_willis
% @type categorical
% @canonical false
% @original_name availability_status
% @values partial_stock=In_stock_153_156_159W_some_out unk_availability_status_willis=Unknown
% @importance 0.85

0.63::true_val(availability_status_willis, partial_stock); 0.37::true_val(availability_status_willis, unk_availability_status_willis).

measured(s33, availability_status_willis, partial_stock).

all_consistent(availability_status_willis) :-
    consistent(s33, availability_status_willis).

evidence(all_consistent(availability_status_willis)).
query(true_val(availability_status_willis, partial_stock)).
query(true_val(availability_status_willis, unk_availability_status_willis)).

0.85::acc(s34, availability_status_eriks).

% @attr availability_status_eriks
% @type categorical
% @canonical false
% @original_name availability_status
% @values warehouse_4_9_days=Available_warehouse_4_9_days unk_availability_status_eriks=Unknown
% @importance 0.75

0.72::true_val(availability_status_eriks, warehouse_4_9_days); 0.28::true_val(availability_status_eriks, unk_availability_status_eriks).

measured(s34, availability_status_eriks, warehouse_4_9_days).

all_consistent(availability_status_eriks) :-
    (indep(s34), consistent(s34, availability_status_eriks) ; \+indep(s34)).

evidence(all_consistent(availability_status_eriks)).
query(true_val(availability_status_eriks, warehouse_4_9_days)).
query(true_val(availability_status_eriks, unk_availability_status_eriks)).

0.78::acc(s21, availability_status_rei).

% @attr availability_status_rei
% @type categorical
% @canonical false
% @original_name availability_status
% @values not_available_currently=Listed_2025_2026_not_available unk_availability_status_rei=Unknown
% @importance 0.80

0.64::true_val(availability_status_rei, not_available_currently); 0.36::true_val(availability_status_rei, unk_availability_status_rei).

measured(s21, availability_status_rei, not_available_currently).

all_consistent(availability_status_rei) :-
    consistent(s21, availability_status_rei).

evidence(all_consistent(availability_status_rei)).
query(true_val(availability_status_rei, not_available_currently)).
query(true_val(availability_status_rei, unk_availability_status_rei)).

0.78::acc(s37, availability_status_pelican).

% @attr availability_status_pelican
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_pelican=Available unk_availability_status_pelican=Unknown
% @importance 0.80

0.59::true_val(availability_status_pelican, available_pelican); 0.41::true_val(availability_status_pelican, unk_availability_status_pelican).

measured(s37, availability_status_pelican, available_pelican).

all_consistent(availability_status_pelican) :-
    (indep(s37), consistent(s37, availability_status_pelican) ; \+indep(s37)).

evidence(all_consistent(availability_status_pelican)).
query(true_val(availability_status_pelican, available_pelican)).
query(true_val(availability_status_pelican, unk_availability_status_pelican)).

0.72::acc(s80, availability_status_joes).

% @attr availability_status_joes
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_joes=Available unk_availability_status_joes=Unknown
% @importance 0.60

0.52::true_val(availability_status_joes, available_joes); 0.48::true_val(availability_status_joes, unk_availability_status_joes).

measured(s80, availability_status_joes, available_joes).

all_consistent(availability_status_joes) :-
    (indep(s80), consistent(s80, availability_status_joes) ; \+indep(s80)).

evidence(all_consistent(availability_status_joes)).
query(true_val(availability_status_joes, available_joes)).
query(true_val(availability_status_joes, unk_availability_status_joes)).

0.70::acc(s21, availability_status_used).

% @attr availability_status_used
% @type categorical
% @canonical false
% @original_name availability_status
% @values used_prior_year_available=Used_and_prior_year_models_available unk_availability_status_used=Unknown
% @importance 0.80

0.60::true_val(availability_status_used, used_prior_year_available); 0.40::true_val(availability_status_used, unk_availability_status_used).

measured(s21, availability_status_used, used_prior_year_available).

all_consistent(availability_status_used) :-
    consistent(s21, availability_status_used).

evidence(all_consistent(availability_status_used)).
query(true_val(availability_status_used, used_prior_year_available)).
query(true_val(availability_status_used, unk_availability_status_used)).

0.90::acc(smerchant, board_category).
0.80::acc(s4, board_category).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values freestyle_all_mountain=Freestyle_All_Mountain unk_board_category=Unknown
% @importance 0.825

0.95::true_val(board_category, freestyle_all_mountain); 0.05::true_val(board_category, unk_board_category).

measured(smerchant, board_category, freestyle_all_mountain).
measured(s4, board_category, freestyle_all_mountain).

all_consistent(board_category) :-
    consistent(smerchant, board_category),
    (indep(s4), consistent(s4, board_category) ; \+indep(s4)).

evidence(all_consistent(board_category)).
query(true_val(board_category, freestyle_all_mountain)).
query(true_val(board_category, unk_board_category)).

0.82::acc(s22, product_type).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values freestyle_snowboard=Freestyle_snowboard unk_product_type=Unknown
% @importance 0.85

0.68::true_val(product_type, freestyle_snowboard); 0.32::true_val(product_type, unk_product_type).

measured(s22, product_type, freestyle_snowboard).

all_consistent(product_type) :-
    consistent(s22, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, freestyle_snowboard)).
query(true_val(product_type, unk_product_type)).

0.82::acc(s21, gender).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens_unisex=Mens_Unisex unk_gender=Unknown
% @importance 0.80

0.72::true_val(gender, mens_unisex); 0.28::true_val(gender, unk_gender).

measured(s21, gender, mens_unisex).

all_consistent(gender) :-
    consistent(s21, gender).

evidence(all_consistent(gender)).
query(true_val(gender, mens_unisex)).
query(true_val(gender, unk_gender)).

0.85::acc(smerchant, rider_level).
0.82::acc(s11, rider_level).
0.80::acc(s113, rider_level).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate_to_advanced=Intermediate_to_Advanced unk_rider_level=Unknown
% @importance 0.80

0.95::true_val(rider_level, intermediate_to_advanced); 0.05::true_val(rider_level, unk_rider_level).

measured(smerchant, rider_level, intermediate_to_advanced).
measured(s11, rider_level, intermediate_to_advanced).
measured(s113, rider_level, intermediate_to_advanced).

all_consistent(rider_level) :-
    consistent(smerchant, rider_level),
    (indep(s11), consistent(s11, rider_level) ; \+indep(s11)),
    (indep(s113), consistent(s113, rider_level) ; \+indep(s113)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate_to_advanced)).
query(true_val(rider_level, unk_rider_level)).

0.80::acc(s23, skill_level_recommendation).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values intermediate_park_pop_stability=Intermediate_park_rider_excellent_pop_stability unk_skill_level_recommendation=Unknown
% @importance 0.85

0.64::true_val(skill_level_recommendation, intermediate_park_pop_stability); 0.36::true_val(skill_level_recommendation, unk_skill_level_recommendation).

measured(s23, skill_level_recommendation, intermediate_park_pop_stability).

all_consistent(skill_level_recommendation) :-
    consistent(s23, skill_level_recommendation).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, intermediate_park_pop_stability)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

0.90::acc(s37, shape).
0.88::acc(s39, shape).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values true_twin=True_Twin unk_shape=Unknown
% @importance 0.75

0.95::true_val(shape, true_twin); 0.05::true_val(shape, unk_shape).

measured(s37, shape, true_twin).
measured(s39, shape, true_twin).

all_consistent(shape) :-
    (indep(s37), consistent(s37, shape) ; \+indep(s37)),
    (indep(s39), consistent(s39, shape) ; \+indep(s39)).

evidence(all_consistent(shape)).
query(true_val(shape, true_twin)).
query(true_val(shape, unk_shape)).

0.82::acc(s29, setback).

% @attr setback
% @type numeric
% @unit mm
% @canonical true
% @original_name setback
% @values v0=0.0 unk_setback=Unknown
% @importance 0.50

0.60::true_val(setback, v0); 0.40::true_val(setback, unk_setback).

measured(s29, setback, v0).

all_consistent(setback) :-
    (indep(s29), consistent(s29, setback) ; \+indep(s29)).

evidence(all_consistent(setback)).
query(true_val(setback, v0)).
query(true_val(setback, unk_setback)).

0.95::acc(s12, camber_type).
0.90::acc(smerchant, camber_type).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values quad_camber=Quad_Camber_camber_dominant unk_camber_type=Unknown
% @importance 0.875

0.97::true_val(camber_type, quad_camber); 0.03::true_val(camber_type, unk_camber_type).

measured(s12, camber_type, quad_camber).
measured(smerchant, camber_type, quad_camber).

all_consistent(camber_type) :-
    consistent(s12, camber_type),
    (indep(smerchant), consistent(smerchant, camber_type) ; \+indep(smerchant)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, quad_camber)).
query(true_val(camber_type, unk_camber_type)).

0.85::acc(s28, camber_description).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values four_zones_mellow_center_strong_under_bindings=Four_camber_zones_mellow_center_strong_bindings_rocker_contact unk_camber_description=Unknown
% @importance 0.80

0.72::true_val(camber_description, four_zones_mellow_center_strong_under_bindings); 0.28::true_val(camber_description, unk_camber_description).

measured(s28, camber_description, four_zones_mellow_center_strong_under_bindings).

all_consistent(camber_description) :-
    consistent(s28, camber_description).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, four_zones_mellow_center_strong_under_bindings)).
query(true_val(camber_description, unk_camber_description)).

0.90::acc(s12, nose_tail_design).

% @attr nose_tail_design
% @type categorical
% @canonical false
% @original_name Nose/tail design
% @values steeper_snap_response_swing_weight=Steeper_nose_tail_snap_response_swing_weight_reduction unk_nose_tail_design=Unknown
% @importance 0.90

0.86::true_val(nose_tail_design, steeper_snap_response_swing_weight); 0.14::true_val(nose_tail_design, unk_nose_tail_design).

measured(s12, nose_tail_design, steeper_snap_response_swing_weight).

all_consistent(nose_tail_design) :-
    consistent(s12, nose_tail_design).

evidence(all_consistent(nose_tail_design)).
query(true_val(nose_tail_design, steeper_snap_response_swing_weight)).
query(true_val(nose_tail_design, unk_nose_tail_design)).

0.93::acc(smerchant, flex_rating_10_manufacturer).
0.82::acc(s22, flex_rating_10_manufacturer).

% @attr flex_rating_10_manufacturer
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10_manufacturer
% @values v6=6.0 unk_flex_rating_10_manufacturer=Unknown
% @importance 0.875

0.95::true_val(flex_rating_10_manufacturer, v6); 0.05::true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer).

measured(smerchant, flex_rating_10_manufacturer, v6).
measured(s22, flex_rating_10_manufacturer, v6).

all_consistent(flex_rating_10_manufacturer) :-
    consistent(smerchant, flex_rating_10_manufacturer),
    consistent(s22, flex_rating_10_manufacturer).

evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, v6)).
query(true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer)).

0.82::acc(s109, flex_rating_5).
0.80::acc(s113, flex_rating_5).

% @attr flex_rating_5
% @type numeric
% @unit /5
% @canonical true
% @original_name flex_rating_5
% @values v3=3.0 unk_flex_rating_5=Unknown
% @importance 0.725

0.95::true_val(flex_rating_5, v3); 0.05::true_val(flex_rating_5, unk_flex_rating_5).

measured(s109, flex_rating_5, v3).
measured(s113, flex_rating_5, v3).

all_consistent(flex_rating_5) :-
    (indep(s109), consistent(s109, flex_rating_5) ; \+indep(s109)),
    (indep(s113), consistent(s113, flex_rating_5) ; \+indep(s113)).

evidence(all_consistent(flex_rating_5)).
query(true_val(flex_rating_5, v3)).
query(true_val(flex_rating_5, unk_flex_rating_5)).

0.85::acc(s23, flex_feel).

% @attr flex_feel
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_feel
% @values v4_5=4.5 unk_flex_feel=Unknown
% @importance 0.85

0.64::true_val(flex_feel, v4_5); 0.36::true_val(flex_feel, unk_flex_feel).

measured(s23, flex_feel, v4_5).

all_consistent(flex_feel) :-
    consistent(s23, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, v4_5)).
query(true_val(flex_feel, unk_flex_feel)).

0.85::acc(s102, flex_rating_10).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v5=5.0 unk_flex_rating_10=Unknown
% @importance 0.80

0.64::true_val(flex_rating_10, v5); 0.36::true_val(flex_rating_10, unk_flex_rating_10).

measured(s102, flex_rating_10, v5).

all_consistent(flex_rating_10) :-
    consistent(s102, flex_rating_10).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v5)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

0.82::acc(s11, flex_rating_10_evo).

% @attr flex_rating_10_evo
% @type categorical
% @canonical true
% @original_name flex_rating_10_evo
% @values medium=Medium_flex_3_5_on_evo_scale unk_flex_rating_10_evo=Unknown
% @importance 0.85

0.68::true_val(flex_rating_10_evo, medium); 0.32::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).

measured(s11, flex_rating_10_evo, medium).

all_consistent(flex_rating_10_evo) :-
    (indep(s11), consistent(s11, flex_rating_10_evo) ; \+indep(s11)).

evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, medium)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

0.88::acc(s39, flex_direction).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values twin_symmetric=Twin_symmetric_identical_both_directions unk_flex_direction=Unknown
% @importance 0.70

0.58::true_val(flex_direction, twin_symmetric); 0.42::true_val(flex_direction, unk_flex_direction).

measured(s39, flex_direction, twin_symmetric).

all_consistent(flex_direction) :-
    (indep(s39), consistent(s39, flex_direction) ; \+indep(s39)).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, twin_symmetric)).
query(true_val(flex_direction, unk_flex_direction)).

0.85::acc(s28, flex_pattern).

% @attr flex_pattern
% @type categorical
% @canonical false
% @original_name Flex pattern
% @values milled_core_zones=Milled_core_thinner_center_thicker_under_bindings unk_flex_pattern=Unknown
% @importance 0.80

0.64::true_val(flex_pattern, milled_core_zones); 0.36::true_val(flex_pattern, unk_flex_pattern).

measured(s28, flex_pattern, milled_core_zones).

all_consistent(flex_pattern) :-
    consistent(s28, flex_pattern).

evidence(all_consistent(flex_pattern)).
query(true_val(flex_pattern, milled_core_zones)).
query(true_val(flex_pattern, unk_flex_pattern)).

0.85::acc(s102, torsional_flex).

% @attr torsional_flex
% @type categorical
% @canonical false
% @original_name Torsional flex
% @values relatively_soft=Relatively_soft_torsionally_easy_buttering unk_torsional_flex=Unknown
% @importance 0.80

0.64::true_val(torsional_flex, relatively_soft); 0.36::true_val(torsional_flex, unk_torsional_flex).

measured(s102, torsional_flex, relatively_soft).

all_consistent(torsional_flex) :-
    consistent(s102, torsional_flex).

evidence(all_consistent(torsional_flex)).
query(true_val(torsional_flex, relatively_soft)).
query(true_val(torsional_flex, unk_torsional_flex)).

0.93::acc(s12, sidecut_type).
0.90::acc(smerchant, sidecut_type).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values eq_rad=EQ_Rad_Equaliser_Radial_blended unk_sidecut_type=Unknown
% @importance 0.875

0.97::true_val(sidecut_type, eq_rad); 0.03::true_val(sidecut_type, unk_sidecut_type).

measured(s12, sidecut_type, eq_rad).
measured(smerchant, sidecut_type, eq_rad).

all_consistent(sidecut_type) :-
    consistent(s12, sidecut_type),
    (indep(smerchant), consistent(smerchant, sidecut_type) ; \+indep(smerchant)).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, eq_rad)).
query(true_val(sidecut_type, unk_sidecut_type)).

0.82::acc(s28, sidecut_description).

% @attr sidecut_description
% @type categorical
% @canonical false
% @original_name Sidecut description
% @values straight_lines_enhanced_edge_hold=Straight_lines_instead_of_circular_arcs_enhanced_grip unk_sidecut_description=Unknown
% @importance 0.80

0.64::true_val(sidecut_description, straight_lines_enhanced_edge_hold); 0.36::true_val(sidecut_description, unk_sidecut_description).

measured(s28, sidecut_description, straight_lines_enhanced_edge_hold).

all_consistent(sidecut_description) :-
    consistent(s28, sidecut_description).

evidence(all_consistent(sidecut_description)).
query(true_val(sidecut_description, straight_lines_enhanced_edge_hold)).
query(true_val(sidecut_description, unk_sidecut_description)).

0.93::acc(smerchant, width_options).
0.85::acc(s37, width_options).

% @attr width_options
% @type categorical
% @canonical true
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 0.825

0.95::true_val(width_options, standard_and_wide); 0.05::true_val(width_options, unk_width_options).

measured(smerchant, width_options, standard_and_wide).
measured(s37, width_options, standard_and_wide).

all_consistent(width_options) :-
    consistent(smerchant, width_options),
    (indep(s37), consistent(s37, width_options) ; \+indep(s37)).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

0.93::acc(smerchant, mounting_pattern).
0.85::acc(s37, mounting_pattern).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_inserts unk_mounting_pattern=Unknown
% @importance 0.825

0.95::true_val(mounting_pattern, inserts_2x4); 0.05::true_val(mounting_pattern, unk_mounting_pattern).

measured(smerchant, mounting_pattern, inserts_2x4).
measured(s37, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :-
    consistent(smerchant, mounting_pattern),
    (indep(s37), consistent(s37, mounting_pattern) ; \+indep(s37)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

0.93::acc(smerchant, available_sizes).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values s149_153_156_159_156w_159w=149_153_156_159_156W_159W unk_available_sizes=Unknown
% @importance 0.85

0.93::true_val(available_sizes, s149_153_156_159_156w_159w); 0.07::true_val(available_sizes, unk_available_sizes).

measured(smerchant, available_sizes, s149_153_156_159_156w_159w).

all_consistent(available_sizes) :-
    consistent(smerchant, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, s149_153_156_159_156w_159w)).
query(true_val(available_sizes, unk_available_sizes)).

0.78::acc(s14, available_sizes_162).

% @attr available_sizes_162
% @type categorical
% @canonical false
% @original_name available_sizes
% @values includes_162=162cm_available unk_available_sizes_162=Unknown
% @importance 0.85

0.68::true_val(available_sizes_162, includes_162); 0.32::true_val(available_sizes_162, unk_available_sizes_162).

measured(s14, available_sizes_162, includes_162).

all_consistent(available_sizes_162) :-
    consistent(s14, available_sizes_162).

evidence(all_consistent(available_sizes_162)).
query(true_val(available_sizes_162, includes_162)).
query(true_val(available_sizes_162, unk_available_sizes_162)).

0.93::acc(smerchant, effective_edge_149).

% @attr effective_edge_149
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge (149cm)
% @values v116_2=116.2 unk_effective_edge_149=Unknown
% @importance 0.85

0.93::true_val(effective_edge_149, v116_2); 0.07::true_val(effective_edge_149, unk_effective_edge_149).

measured(smerchant, effective_edge_149, v116_2).

all_consistent(effective_edge_149) :-
    consistent(smerchant, effective_edge_149).

evidence(all_consistent(effective_edge_149)).
query(true_val(effective_edge_149, v116_2)).
query(true_val(effective_edge_149, unk_effective_edge_149)).

0.93::acc(smerchant, tip_tail_width_size).

% @attr tip_tail_width_size
% @type numeric
% @unit cm
% @canonical true
% @original_name tip_tail_width_size
% @values v28_6=28.6 unk_tip_tail_width_size=Unknown
% @importance 0.85

0.93::true_val(tip_tail_width_size, v28_6); 0.07::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(smerchant, tip_tail_width_size, v28_6).

all_consistent(tip_tail_width_size) :-
    consistent(smerchant, tip_tail_width_size).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v28_6)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

0.93::acc(smerchant, waist_width_149).

% @attr waist_width_149
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width (149cm)
% @values v24_8=24.8 unk_waist_width_149=Unknown
% @importance 0.85

0.93::true_val(waist_width_149, v24_8); 0.07::true_val(waist_width_149, unk_waist_width_149).

measured(smerchant, waist_width_149, v24_8).

all_consistent(waist_width_149) :-
    consistent(smerchant, waist_width_149).

evidence(all_consistent(waist_width_149)).
query(true_val(waist_width_149, v24_8)).
query(true_val(waist_width_149, unk_waist_width_149)).

0.93::acc(smerchant, sidecut_radius_size_149).

% @attr sidecut_radius_size_149
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v7_1=7.1 unk_sidecut_radius_size_149=Unknown
% @importance 0.85

0.93::true_val(sidecut_radius_size_149, v7_1); 0.07::true_val(sidecut_radius_size_149, unk_sidecut_radius_size_149).

measured(smerchant, sidecut_radius_size_149, v7_1).

all_consistent(sidecut_radius_size_149) :-
    consistent(smerchant, sidecut_radius_size_149).

evidence(all_consistent(sidecut_radius_size_149)).
query(true_val(sidecut_radius_size_149, v7_1)).
query(true_val(sidecut_radius_size_149, unk_sidecut_radius_size_149)).

0.93::acc(smerchant, stance_width_range_size).

% @attr stance_width_range_size
% @type numeric
% @unit cm
% @canonical true
% @original_name stance_width_range_size
% @values v53_0=53.0 unk_stance_width_range_size=Unknown
% @importance 0.85

0.93::true_val(stance_width_range_size, v53_0); 0.07::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(smerchant, stance_width_range_size, v53_0).

all_consistent(stance_width_range_size) :-
    consistent(smerchant, stance_width_range_size).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v53_0)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

0.93::acc(smerchant, recommended_weight_range_size_149).

% @attr recommended_weight_range_size_149
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values w45_65=45_65kg unk_recommended_weight_range_size_149=Unknown
% @importance 0.85

0.93::true_val(recommended_weight_range_size_149, w45_65); 0.07::true_val(recommended_weight_range_size_149, unk_recommended_weight_range_size_149).

measured(smerchant, recommended_weight_range_size_149, w45_65).

all_consistent(recommended_weight_range_size_149) :-
    consistent(smerchant, recommended_weight_range_size_149).

evidence(all_consistent(recommended_weight_range_size_149)).
query(true_val(recommended_weight_range_size_149, w45_65)).
query(true_val(recommended_weight_range_size_149, unk_recommended_weight_range_size_149)).

0.93::acc(smerchant, effective_edge_153).

% @attr effective_edge_153
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge (153cm)
% @values v119_2=119.2 unk_effective_edge_153=Unknown
% @importance 0.85

0.93::true_val(effective_edge_153, v119_2); 0.07::true_val(effective_edge_153, unk_effective_edge_153).

measured(smerchant, effective_edge_153, v119_2).

all_consistent(effective_edge_153) :-
    consistent(smerchant, effective_edge_153).

evidence(all_consistent(effective_edge_153)).
query(true_val(effective_edge_153, v119_2)).
query(true_val(effective_edge_153, unk_effective_edge_153)).

0.93::acc(smerchant, waist_width_153).

% @attr waist_width_153
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width (153cm)
% @values v25_3=25.3 unk_waist_width_153=Unknown
% @importance 0.85

0.93::true_val(waist_width_153, v25_3); 0.07::true_val(waist_width_153, unk_waist_width_153).

measured(smerchant, waist_width_153, v25_3).

all_consistent(waist_width_153) :-
    consistent(smerchant, waist_width_153).

evidence(all_consistent(waist_width_153)).
query(true_val(waist_width_153, v25_3)).
query(true_val(waist_width_153, unk_waist_width_153)).

0.93::acc(smerchant, sidecut_radius_size_153).

% @attr sidecut_radius_size_153
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v7_3=7.3 unk_sidecut_radius_size_153=Unknown
% @importance 0.85

0.93::true_val(sidecut_radius_size_153, v7_3); 0.07::true_val(sidecut_radius_size_153, unk_sidecut_radius_size_153).

measured(smerchant, sidecut_radius_size_153, v7_3).

all_consistent(sidecut_radius_size_153) :-
    consistent(smerchant, sidecut_radius_size_153).

evidence(all_consistent(sidecut_radius_size_153)).
query(true_val(sidecut_radius_size_153, v7_3)).
query(true_val(sidecut_radius_size_153, unk_sidecut_radius_size_153)).

0.93::acc(smerchant, recommended_weight_range_size_153).

% @attr recommended_weight_range_size_153
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values w50_70=50_70kg unk_recommended_weight_range_size_153=Unknown
% @importance 0.85

0.93::true_val(recommended_weight_range_size_153, w50_70); 0.07::true_val(recommended_weight_range_size_153, unk_recommended_weight_range_size_153).

measured(smerchant, recommended_weight_range_size_153, w50_70).

all_consistent(recommended_weight_range_size_153) :-
    consistent(smerchant, recommended_weight_range_size_153).

evidence(all_consistent(recommended_weight_range_size_153)).
query(true_val(recommended_weight_range_size_153, w50_70)).
query(true_val(recommended_weight_range_size_153, unk_recommended_weight_range_size_153)).

0.93::acc(smerchant, effective_edge_156).

% @attr effective_edge_156
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge (156cm)
% @values v121_6=121.6 unk_effective_edge_156=Unknown
% @importance 0.85

0.93::true_val(effective_edge_156, v121_6); 0.07::true_val(effective_edge_156, unk_effective_edge_156).

measured(smerchant, effective_edge_156, v121_6).

all_consistent(effective_edge_156) :-
    consistent(smerchant, effective_edge_156).

evidence(all_consistent(effective_edge_156)).
query(true_val(effective_edge_156, v121_6)).
query(true_val(effective_edge_156, unk_effective_edge_156)).

0.93::acc(smerchant, waist_width_156).

% @attr waist_width_156
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width (156cm)
% @values v25_5=25.5 unk_waist_width_156=Unknown
% @importance 0.85

0.93::true_val(waist_width_156, v25_5); 0.07::true_val(waist_width_156, unk_waist_width_156).

measured(smerchant, waist_width_156, v25_5).

all_consistent(waist_width_156) :-
    consistent(smerchant, waist_width_156).

evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v25_5)).
query(true_val(waist_width_156, unk_waist_width_156)).

0.93::acc(smerchant, sidecut_radius_size).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size
% @values v7_5=7.5 unk_sidecut_radius_size=Unknown
% @importance 0.85

0.93::true_val(sidecut_radius_size, v7_5); 0.07::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(smerchant, sidecut_radius_size, v7_5).

all_consistent(sidecut_radius_size) :-
    consistent(smerchant, sidecut_radius_size).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_5)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

0.93::acc(smerchant, recommended_weight_range_size).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size
% @values w55_75=55_75kg unk_recommended_weight_range_size=Unknown
% @importance 0.85

0.93::true_val(recommended_weight_range_size, w55_75); 0.07::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(smerchant, recommended_weight_range_size, w55_75).

all_consistent(recommended_weight_range_size) :-
    consistent(smerchant, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w55_75)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

0.93::acc(smerchant, effective_edge_159).

% @attr effective_edge_159
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge (159cm)
% @values v124_0=124.0 unk_effective_edge_159=Unknown
% @importance 0.85

0.93::true_val(effective_edge_159, v124_0); 0.07::true_val(effective_edge_159, unk_effective_edge_159).

measured(smerchant, effective_edge_159, v124_0).

all_consistent(effective_edge_159) :-
    consistent(smerchant, effective_edge_159).

evidence(all_consistent(effective_edge_159)).
query(true_val(effective_edge_159, v124_0)).
query(true_val(effective_edge_159, unk_effective_edge_159)).

0.93::acc(smerchant, waist_width_159).

% @attr waist_width_159
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width (159cm)
% @values v25_7=25.7 unk_waist_width_159=Unknown
% @importance 0.85

0.93::true_val(waist_width_159, v25_7); 0.07::true_val(waist_width_159, unk_waist_width_159).

measured(smerchant, waist_width_159, v25_7).

all_consistent(waist_width_159) :-
    consistent(smerchant, waist_width_159).

evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v25_7)).
query(true_val(waist_width_159, unk_waist_width_159)).

0.93::acc(smerchant, sidecut_radius_size_159).

% @attr sidecut_radius_size_159
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v7_7=7.7 unk_sidecut_radius_size_159=Unknown
% @importance 0.85

0.93::true_val(sidecut_radius_size_159, v7_7); 0.07::true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159).

measured(smerchant, sidecut_radius_size_159, v7_7).

all_consistent(sidecut_radius_size_159) :-
    consistent(smerchant, sidecut_radius_size_159).

evidence(all_consistent(sidecut_radius_size_159)).
query(true_val(sidecut_radius_size_159, v7_7)).
query(true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159)).

0.93::acc(smerchant, recommended_weight_range_size_159).

% @attr recommended_weight_range_size_159
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values w65_90=65_90kg unk_recommended_weight_range_size_159=Unknown
% @importance 0.85

0.93::true_val(recommended_weight_range_size_159, w65_90); 0.07::true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159).

measured(smerchant, recommended_weight_range_size_159, w65_90).

all_consistent(recommended_weight_range_size_159) :-
    consistent(smerchant, recommended_weight_range_size_159).

evidence(all_consistent(recommended_weight_range_size_159)).
query(true_val(recommended_weight_range_size_159, w65_90)).
query(true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159)).

0.93::acc(smerchant, effective_edge_156w).

% @attr effective_edge_156w
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge (156W)
% @values v121_6=121.6 unk_effective_edge_156w=Unknown
% @importance 0.85

0.93::true_val(effective_edge_156w, v121_6); 0.07::true_val(effective_edge_156w, unk_effective_edge_156w).

measured(smerchant, effective_edge_156w, v121_6).

all_consistent(effective_edge_156w) :-
    consistent(smerchant, effective_edge_156w).

evidence(all_consistent(effective_edge_156w)).
query(true_val(effective_edge_156w, v121_6)).
query(true_val(effective_edge_156w, unk_effective_edge_156w)).

0.93::acc(smerchant, waist_width_156w).

% @attr waist_width_156w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width (156W)
% @values v26_2=26.2 unk_waist_width_156w=Unknown
% @importance 0.85

0.93::true_val(waist_width_156w, v26_2); 0.07::true_val(waist_width_156w, unk_waist_width_156w).

measured(smerchant, waist_width_156w, v26_2).

all_consistent(waist_width_156w) :-
    consistent(smerchant, waist_width_156w).

evidence(all_consistent(waist_width_156w)).
query(true_val(waist_width_156w, v26_2)).
query(true_val(waist_width_156w, unk_waist_width_156w)).

0.93::acc(smerchant, sidecut_radius_size_156w).

% @attr sidecut_radius_size_156w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v7_6=7.6 unk_sidecut_radius_size_156w=Unknown
% @importance 0.85

0.93::true_val(sidecut_radius_size_156w, v7_6); 0.07::true_val(sidecut_radius_size_156w, unk_sidecut_radius_size_156w).

measured(smerchant, sidecut_radius_size_156w, v7_6).

all_consistent(sidecut_radius_size_156w) :-
    consistent(smerchant, sidecut_radius_size_156w).

evidence(all_consistent(sidecut_radius_size_156w)).
query(true_val(sidecut_radius_size_156w, v7_6)).
query(true_val(sidecut_radius_size_156w, unk_sidecut_radius_size_156w)).

0.93::acc(smerchant, recommended_weight_range_size_156w).

% @attr recommended_weight_range_size_156w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values w80_110=80_110kg unk_recommended_weight_range_size_156w=Unknown
% @importance 0.85

0.93::true_val(recommended_weight_range_size_156w, w80_110); 0.07::true_val(recommended_weight_range_size_156w, unk_recommended_weight_range_size_156w).

measured(smerchant, recommended_weight_range_size_156w, w80_110).

all_consistent(recommended_weight_range_size_156w) :-
    consistent(smerchant, recommended_weight_range_size_156w).

evidence(all_consistent(recommended_weight_range_size_156w)).
query(true_val(recommended_weight_range_size_156w, w80_110)).
query(true_val(recommended_weight_range_size_156w, unk_recommended_weight_range_size_156w)).

0.93::acc(smerchant, effective_edge_159w).

% @attr effective_edge_159w
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge (159W)
% @values v124_0=124.0 unk_effective_edge_159w=Unknown
% @importance 0.85

0.93::true_val(effective_edge_159w, v124_0); 0.07::true_val(effective_edge_159w, unk_effective_edge_159w).

measured(smerchant, effective_edge_159w, v124_0).

all_consistent(effective_edge_159w) :-
    consistent(smerchant, effective_edge_159w).

evidence(all_consistent(effective_edge_159w)).
query(true_val(effective_edge_159w, v124_0)).
query(true_val(effective_edge_159w, unk_effective_edge_159w)).

0.93::acc(smerchant, waist_width_159w).

% @attr waist_width_159w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width (159W)
% @values v26_4=26.4 unk_waist_width_159w=Unknown
% @importance 0.85

0.93::true_val(waist_width_159w, v26_4); 0.07::true_val(waist_width_159w, unk_waist_width_159w).

measured(smerchant, waist_width_159w, v26_4).

all_consistent(waist_width_159w) :-
    consistent(smerchant, waist_width_159w).

evidence(all_consistent(waist_width_159w)).
query(true_val(waist_width_159w, v26_4)).
query(true_val(waist_width_159w, unk_waist_width_159w)).

0.93::acc(smerchant, sidecut_radius_size_159w).

% @attr sidecut_radius_size_159w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v7_8=7.8 unk_sidecut_radius_size_159w=Unknown
% @importance 0.85

0.93::true_val(sidecut_radius_size_159w, v7_8); 0.07::true_val(sidecut_radius_size_159w, unk_sidecut_radius_size_159w).

measured(smerchant, sidecut_radius_size_159w, v7_8).

all_consistent(sidecut_radius_size_159w) :-
    consistent(smerchant, sidecut_radius_size_159w).

evidence(all_consistent(sidecut_radius_size_159w)).
query(true_val(sidecut_radius_size_159w, v7_8)).
query(true_val(sidecut_radius_size_159w, unk_sidecut_radius_size_159w)).

0.93::acc(smerchant, recommended_weight_range_size_159w).

% @attr recommended_weight_range_size_159w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values w90_125=90_125kg unk_recommended_weight_range_size_159w=Unknown
% @importance 0.85

0.93::true_val(recommended_weight_range_size_159w, w90_125); 0.07::true_val(recommended_weight_range_size_159w, unk_recommended_weight_range_size_159w).

measured(smerchant, recommended_weight_range_size_159w, w90_125).

all_consistent(recommended_weight_range_size_159w) :-
    consistent(smerchant, recommended_weight_range_size_159w).

evidence(all_consistent(recommended_weight_range_size_159w)).
query(true_val(recommended_weight_range_size_159w, w90_125)).
query(true_val(recommended_weight_range_size_159w, unk_recommended_weight_range_size_159w)).

0.93::acc(smerchant, core_material).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values aspen_slct=Aspen_SLCT_hand_selected_wood unk_core_material=Unknown
% @importance 0.85

0.93::true_val(core_material, aspen_slct); 0.07::true_val(core_material, unk_core_material).

measured(smerchant, core_material, aspen_slct).

all_consistent(core_material) :-
    consistent(smerchant, core_material).

evidence(all_consistent(core_material)).
query(true_val(core_material, aspen_slct)).
query(true_val(core_material, unk_core_material)).

0.90::acc(smerchant, laminate).
0.85::acc(s34, laminate).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values tri_ax_glass=Tri_Ax_Glass unk_laminate=Unknown
% @importance 0.80

0.95::true_val(laminate, tri_ax_glass); 0.05::true_val(laminate, unk_laminate).

measured(smerchant, laminate, tri_ax_glass).
measured(s34, laminate, tri_ax_glass).

all_consistent(laminate) :-
    consistent(smerchant, laminate),
    (indep(s34), consistent(s34, laminate) ; \+indep(s34)).

evidence(all_consistent(laminate)).
query(true_val(laminate, tri_ax_glass)).
query(true_val(laminate, unk_laminate)).

0.85::acc(s34, laminate_ba_md).
0.90::acc(smerchant, laminate_ba_md).

% @attr laminate_ba_md
% @type categorical
% @canonical false
% @original_name laminate
% @values ba_md_fiberglass=BA_MD_medium_density_European_fiberglass unk_laminate_ba_md=Unknown
% @importance 0.80

0.95::true_val(laminate_ba_md, ba_md_fiberglass); 0.05::true_val(laminate_ba_md, unk_laminate_ba_md).

measured(s34, laminate_ba_md, ba_md_fiberglass).
measured(smerchant, laminate_ba_md, ba_md_fiberglass).

all_consistent(laminate_ba_md) :-
    (indep(s34), consistent(s34, laminate_ba_md) ; \+indep(s34)),
    consistent(smerchant, laminate_ba_md).

evidence(all_consistent(laminate_ba_md)).
query(true_val(laminate_ba_md, ba_md_fiberglass)).
query(true_val(laminate_ba_md, unk_laminate_ba_md)).

0.90::acc(smerchant, construction_material_innovation).
0.85::acc(s10, construction_material_innovation).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values popster_booster_carbon=Popster_Booster_carbon_stringers_nose_tail_max_pop unk_construction_material_innovation=Unknown
% @importance 0.85

0.95::true_val(construction_material_innovation, popster_booster_carbon); 0.05::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(smerchant, construction_material_innovation, popster_booster_carbon).
measured(s10, construction_material_innovation, popster_booster_carbon).

all_consistent(construction_material_innovation) :-
    consistent(smerchant, construction_material_innovation),
    (indep(s10), consistent(s10, construction_material_innovation) ; \+indep(s10)).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, popster_booster_carbon)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

0.88::acc(s111, construction_material_innovation_popster).

% @attr construction_material_innovation_popster
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values popster_milled_core=Popster_milled_core_underfoot_natural_reactive_flex unk_construction_material_innovation_popster=Unknown
% @importance 0.70

0.76::true_val(construction_material_innovation_popster, popster_milled_core); 0.24::true_val(construction_material_innovation_popster, unk_construction_material_innovation_popster).

measured(s111, construction_material_innovation_popster, popster_milled_core).

all_consistent(construction_material_innovation_popster) :-
    consistent(s111, construction_material_innovation_popster).

evidence(all_consistent(construction_material_innovation_popster)).
query(true_val(construction_material_innovation_popster, popster_milled_core)).
query(true_val(construction_material_innovation_popster, unk_construction_material_innovation_popster)).

0.93::acc(s12, resin).
0.85::acc(s34, resin).

% @attr resin
% @type categorical
% @canonical true
% @original_name resin
% @values biobased_30=BioBased_30_bio_epoxy_30pct_plant_derived unk_resin=Unknown
% @importance 0.825

0.97::true_val(resin, biobased_30); 0.03::true_val(resin, unk_resin).

measured(s12, resin, biobased_30).
measured(s34, resin, biobased_30).

all_consistent(resin) :-
    consistent(s12, resin),
    (indep(s34), consistent(s34, resin) ; \+indep(s34)).

evidence(all_consistent(resin)).
query(true_val(resin, biobased_30)).
query(true_val(resin, unk_resin)).

0.88::acc(s93, sidewall_material).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values abs_sidewalls=ABS_sidewalls unk_sidewall_material=Unknown
% @importance 0.80

0.72::true_val(sidewall_material, abs_sidewalls); 0.28::true_val(sidewall_material, unk_sidewall_material).

measured(s93, sidewall_material, abs_sidewalls).

all_consistent(sidewall_material) :-
    (indep(s93), consistent(s93, sidewall_material) ; \+indep(s93)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, abs_sidewalls)).
query(true_val(sidewall_material, unk_sidewall_material)).

0.90::acc(smerchant, construction_material_innovation_rubber).
0.88::acc(s93, construction_material_innovation_rubber).

% @attr construction_material_innovation_rubber
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values royal_rubber_pads_4mm=Royal_Rubber_Pads_4mm_vibration_dampening unk_construction_material_innovation_rubber=Unknown
% @importance 0.825

0.95::true_val(construction_material_innovation_rubber, royal_rubber_pads_4mm); 0.05::true_val(construction_material_innovation_rubber, unk_construction_material_innovation_rubber).

measured(smerchant, construction_material_innovation_rubber, royal_rubber_pads_4mm).
measured(s93, construction_material_innovation_rubber, royal_rubber_pads_4mm).

all_consistent(construction_material_innovation_rubber) :-
    consistent(smerchant, construction_material_innovation_rubber),
    (indep(s93), consistent(s93, construction_material_innovation_rubber) ; \+indep(s93)).

evidence(all_consistent(construction_material_innovation_rubber)).
query(true_val(construction_material_innovation_rubber, royal_rubber_pads_4mm)).
query(true_val(construction_material_innovation_rubber, unk_construction_material_innovation_rubber)).

0.93::acc(smerchant, base_material).
0.93::acc(s12, base_material).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered=Sintered unk_base_material=Unknown
% @importance 0.875

0.97::true_val(base_material, sintered); 0.03::true_val(base_material, unk_base_material).

measured(smerchant, base_material, sintered).
measured(s12, base_material, sintered).

all_consistent(base_material) :-
    consistent(s12, base_material),
    (indep(smerchant), consistent(smerchant, base_material) ; \+indep(smerchant)).

evidence(all_consistent(base_material)).
query(true_val(base_material, sintered)).
query(true_val(base_material, unk_base_material)).

0.93::acc(smerchant, base_type).
0.93::acc(s12, base_type).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values medium_stone_finish=Medium_Stone_Finish_improved_glide unk_base_type=Unknown
% @importance 0.875

0.97::true_val(base_type, medium_stone_finish); 0.03::true_val(base_type, unk_base_type).

measured(smerchant, base_type, medium_stone_finish).
measured(s12, base_type, medium_stone_finish).

all_consistent(base_type) :-
    consistent(s12, base_type),
    (indep(smerchant), consistent(smerchant, base_type) ; \+indep(smerchant)).

evidence(all_consistent(base_type)).
query(true_val(base_type, medium_stone_finish)).
query(true_val(base_type, unk_base_type)).

0.93::acc(smerchant, factory_wax).
0.93::acc(s12, factory_wax).

% @attr factory_wax
% @type categorical
% @canonical false
% @original_name Factory wax
% @values natural_wax_paraffin_free=Natural_Wax_paraffin_free_natural_ingredients unk_factory_wax=Unknown
% @importance 0.875

0.97::true_val(factory_wax, natural_wax_paraffin_free); 0.03::true_val(factory_wax, unk_factory_wax).

measured(smerchant, factory_wax, natural_wax_paraffin_free).
measured(s12, factory_wax, natural_wax_paraffin_free).

all_consistent(factory_wax) :-
    consistent(s12, factory_wax),
    (indep(smerchant), consistent(smerchant, factory_wax) ; \+indep(smerchant)).

evidence(all_consistent(factory_wax)).
query(true_val(factory_wax, natural_wax_paraffin_free)).
query(true_val(factory_wax, unk_factory_wax)).

0.85::acc(smerchant, edge_bevel_spec).
0.88::acc(s33, edge_bevel_spec).
0.92::acc(s111, edge_bevel_spec).

% @attr edge_bevel_spec
% @type categorical
% @canonical true
% @original_name edge_bevel_spec
% @values bevel_1_5_degree=1_5_degree_base_edge bevel_2_3_degree_zones=2deg_nose_tail_3deg_between_feet
% @importance 0.80

0.35::true_val(edge_bevel_spec, bevel_1_5_degree); 0.65::true_val(edge_bevel_spec, bevel_2_3_degree_zones).

measured(smerchant, edge_bevel_spec, bevel_1_5_degree).
measured(s33, edge_bevel_spec, bevel_2_3_degree_zones).
measured(s111, edge_bevel_spec, bevel_2_3_degree_zones).

all_consistent(edge_bevel_spec) :-
    consistent(smerchant, edge_bevel_spec),
    consistent(s33, edge_bevel_spec),
    consistent(s111, edge_bevel_spec).

evidence(all_consistent(edge_bevel_spec)).
query(true_val(edge_bevel_spec, bevel_1_5_degree)).
query(true_val(edge_bevel_spec, bevel_2_3_degree_zones)).

0.90::acc(smerchant, terrain_suitability).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values park_freestyle_all_mountain=Park_Freestyle_All_Mountain unk_terrain_suitability=Unknown
% @importance 0.85

0.90::true_val(terrain_suitability, park_freestyle_all_mountain); 0.10::true_val(terrain_suitability, unk_terrain_suitability).

measured(smerchant, terrain_suitability, park_freestyle_all_mountain).

all_consistent(terrain_suitability) :-
    consistent(smerchant, terrain_suitability).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, park_freestyle_all_mountain)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

0.90::acc(smerchant, riding_style).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values park_jumps_rails_side_hits=Park_jumps_rails_side_hits unk_riding_style=Unknown
% @importance 0.85

0.90::true_val(riding_style, park_jumps_rails_side_hits); 0.10::true_val(riding_style, unk_riding_style).

measured(smerchant, riding_style, park_jumps_rails_side_hits).

all_consistent(riding_style) :-
    consistent(smerchant, riding_style).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, park_jumps_rails_side_hits)).
query(true_val(riding_style, unk_riding_style)).

0.85::acc(s14, positive_aspect).
0.82::acc(s23, positive_aspect).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values exceptional_park=Exceptional_in_park_jibbing_jumping unk_positive_aspect=Unknown
% @importance 0.85

0.95::true_val(positive_aspect, exceptional_park); 0.05::true_val(positive_aspect, unk_positive_aspect).

measured(s14, positive_aspect, exceptional_park).
measured(s23, positive_aspect, exceptional_park).

all_consistent(positive_aspect) :-
    consistent(s14, positive_aspect),
    consistent(s23, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, exceptional_park)).
query(true_val(positive_aspect, unk_positive_aspect)).

0.82::acc(s23, positive_aspect_jibbing).

% @attr positive_aspect_jibbing
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values jibs_better_than_jumps=Board_jibs_better_than_jump_performance unk_positive_aspect_jibbing=Unknown
% @importance 0.85

0.64::true_val(positive_aspect_jibbing, jibs_better_than_jumps); 0.36::true_val(positive_aspect_jibbing, unk_positive_aspect_jibbing).

measured(s23, positive_aspect_jibbing, jibs_better_than_jumps).

all_consistent(positive_aspect_jibbing) :-
    consistent(s23, positive_aspect_jibbing).

evidence(all_consistent(positive_aspect_jibbing)).
query(true_val(positive_aspect_jibbing, jibs_better_than_jumps)).
query(true_val(positive_aspect_jibbing, unk_positive_aspect_jibbing)).

0.82::acc(s107, positive_aspect_landing_stability).

% @attr positive_aspect_landing_stability
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values stable_landings=Stable_on_landings_camber_medium_flex unk_positive_aspect_landing_stability=Unknown
% @importance 0.85

0.64::true_val(positive_aspect_landing_stability, stable_landings); 0.36::true_val(positive_aspect_landing_stability, unk_positive_aspect_landing_stability).

measured(s107, positive_aspect_landing_stability, stable_landings).

all_consistent(positive_aspect_landing_stability) :-
    consistent(s107, positive_aspect_landing_stability).

evidence(all_consistent(positive_aspect_landing_stability)).
query(true_val(positive_aspect_landing_stability, stable_landings)).
query(true_val(positive_aspect_landing_stability, unk_positive_aspect_landing_stability)).

0.82::acc(s14, negative_aspect).
0.80::acc(s22, negative_aspect).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values average_carving_outside_park=Average_carving_outside_park unk_negative_aspect=Unknown
% @importance 0.85

0.95::true_val(negative_aspect, average_carving_outside_park); 0.05::true_val(negative_aspect, unk_negative_aspect).

measured(s14, negative_aspect, average_carving_outside_park).
measured(s22, negative_aspect, average_carving_outside_park).

all_consistent(negative_aspect) :-
    consistent(s14, negative_aspect),
    consistent(s22, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, average_carving_outside_park)).
query(true_val(negative_aspect, unk_negative_aspect)).

0.82::acc(s28, negative_aspect_high_speed_carving).

% @attr negative_aspect_high_speed_carving
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values limited_high_speed_carving=Limited_rebound_high_speed_carving unk_negative_aspect_high_speed_carving=Unknown
% @importance 0.80

0.64::true_val(negative_aspect_high_speed_carving, limited_high_speed_carving); 0.36::true_val(negative_aspect_high_speed_carving, unk_negative_aspect_high_speed_carving).

measured(s28, negative_aspect_high_speed_carving, limited_high_speed_carving).

all_consistent(negative_aspect_high_speed_carving) :-
    consistent(s28, negative_aspect_high_speed_carving).

evidence(all_consistent(negative_aspect_high_speed_carving)).
query(true_val(negative_aspect_high_speed_carving, limited_high_speed_carving)).
query(true_val(negative_aspect_high_speed_carving, unk_negative_aspect_high_speed_carving)).

0.85::acc(s107, switch_riding).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values easy_natural=True_twin_centered_stance_easy_natural_switch unk_switch_riding=Unknown
% @importance 0.85

0.64::true_val(switch_riding, easy_natural); 0.36::true_val(switch_riding, unk_switch_riding).

measured(s107, switch_riding, easy_natural).

all_consistent(switch_riding) :-
    consistent(s107, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, easy_natural)).
query(true_val(switch_riding, unk_switch_riding)).

0.82::acc(s22, negative_aspect_powder).
0.82::acc(s73, negative_aspect_powder).

% @attr negative_aspect_powder
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values sinky_deep_powder=Struggles_deep_powder_sinky_no_setback unk_negative_aspect_powder=Unknown
% @importance 0.775

0.95::true_val(negative_aspect_powder, sinky_deep_powder); 0.05::true_val(negative_aspect_powder, unk_negative_aspect_powder).

measured(s22, negative_aspect_powder, sinky_deep_powder).
measured(s73, negative_aspect_powder, sinky_deep_powder).

all_consistent(negative_aspect_powder) :-
    consistent(s22, negative_aspect_powder),
    consistent(s73, negative_aspect_powder).

evidence(all_consistent(negative_aspect_powder)).
query(true_val(negative_aspect_powder, sinky_deep_powder)).
query(true_val(negative_aspect_powder, unk_negative_aspect_powder)).

0.78::acc(s51, edge_hold).
0.80::acc(s110, edge_hold).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values good_hardpack_icy=Good_edge_hold_hardpack_icy_camber_aided unk_edge_hold=Unknown
% @importance 0.75

0.95::true_val(edge_hold, good_hardpack_icy); 0.05::true_val(edge_hold, unk_edge_hold).

measured(s51, edge_hold, good_hardpack_icy).
measured(s110, edge_hold, good_hardpack_icy).

all_consistent(edge_hold) :-
    consistent(s51, edge_hold),
    consistent(s110, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, good_hardpack_icy)).
query(true_val(edge_hold, unk_edge_hold)).

0.82::acc(s23, pop).
0.80::acc(s110, pop).

% @attr pop
% @type categorical
% @canonical true
% @original_name pop
% @values excellent_pop=Excellent_pop_carbon_stringers_popster_booster unk_pop=Unknown
% @importance 0.825

0.95::true_val(pop, excellent_pop); 0.05::true_val(pop, unk_pop).

measured(s23, pop, excellent_pop).
measured(s110, pop, excellent_pop).

all_consistent(pop) :-
    consistent(s23, pop),
    consistent(s110, pop).

evidence(all_consistent(pop)).
query(true_val(pop, excellent_pop)).
query(true_val(pop, unk_pop)).

0.82::acc(s23, positive_aspect_buttering).
0.82::acc(s102, positive_aspect_buttering).

% @attr positive_aspect_buttering
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values easy_press_butter=Easy_to_press_butter_locks_into_nose_press unk_positive_aspect_buttering=Unknown
% @importance 0.825

0.95::true_val(positive_aspect_buttering, easy_press_butter); 0.05::true_val(positive_aspect_buttering, unk_positive_aspect_buttering).

measured(s23, positive_aspect_buttering, easy_press_butter).
measured(s102, positive_aspect_buttering, easy_press_butter).

all_consistent(positive_aspect_buttering) :-
    consistent(s23, positive_aspect_buttering),
    consistent(s102, positive_aspect_buttering).

evidence(all_consistent(positive_aspect_buttering)).
query(true_val(positive_aspect_buttering, easy_press_butter)).
query(true_val(positive_aspect_buttering, unk_positive_aspect_buttering)).

0.82::acc(s107, stability_at_speed).

% @attr stability_at_speed
% @type categorical
% @canonical false
% @original_name Stability at speed
% @values reasonably_stable_not_charging=Reasonably_stable_not_for_high_speed_charging unk_stability_at_speed=Unknown
% @importance 0.85

0.64::true_val(stability_at_speed, reasonably_stable_not_charging); 0.36::true_val(stability_at_speed, unk_stability_at_speed).

measured(s107, stability_at_speed, reasonably_stable_not_charging).

all_consistent(stability_at_speed) :-
    consistent(s107, stability_at_speed).

evidence(all_consistent(stability_at_speed)).
query(true_val(stability_at_speed, reasonably_stable_not_charging)).
query(true_val(stability_at_speed, unk_stability_at_speed)).

0.82::acc(s107, chatter_performance).

% @attr chatter_performance
% @type categorical
% @canonical true
% @original_name chatter_performance
% @values moderate_not_super_damp_or_chattery=Not_super_damp_not_super_chattery_decent_crud unk_chatter_performance=Unknown
% @importance 0.85

0.64::true_val(chatter_performance, moderate_not_super_damp_or_chattery); 0.36::true_val(chatter_performance, unk_chatter_performance).

measured(s107, chatter_performance, moderate_not_super_damp_or_chattery).

all_consistent(chatter_performance) :-
    consistent(s107, chatter_performance).

evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, moderate_not_super_damp_or_chattery)).
query(true_val(chatter_performance, unk_chatter_performance)).

0.82::acc(s11, positive_aspect_forgiving).

% @attr positive_aspect_forgiving
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values more_forgiving_than_regular_camber=More_forgiving_quad_camber_rocker_sections unk_positive_aspect_forgiving=Unknown
% @importance 0.85

0.68::true_val(positive_aspect_forgiving, more_forgiving_than_regular_camber); 0.32::true_val(positive_aspect_forgiving, unk_positive_aspect_forgiving).

measured(s11, positive_aspect_forgiving, more_forgiving_than_regular_camber).

all_consistent(positive_aspect_forgiving) :-
    (indep(s11), consistent(s11, positive_aspect_forgiving) ; \+indep(s11)).

evidence(all_consistent(positive_aspect_forgiving)).
query(true_val(positive_aspect_forgiving, more_forgiving_than_regular_camber)).
query(true_val(positive_aspect_forgiving, unk_positive_aspect_forgiving)).

0.82::acc(s23, base_glide_performance).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values fast_sintered_noticeable_glide=Fast_sintered_base_noticeable_glide unk_base_glide_performance=Unknown
% @importance 0.85

0.64::true_val(base_glide_performance, fast_sintered_noticeable_glide); 0.36::true_val(base_glide_performance, unk_base_glide_performance).

measured(s23, base_glide_performance, fast_sintered_noticeable_glide).

all_consistent(base_glide_performance) :-
    consistent(s23, base_glide_performance).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, fast_sintered_noticeable_glide)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

0.80::acc(s22, weight_feel).

% @attr weight_feel
% @type categorical
% @canonical false
% @original_name Weight feel
% @values slightly_heavier_than_average=Little_heavier_than_average unk_weight_feel=Unknown
% @importance 0.85

0.68::true_val(weight_feel, slightly_heavier_than_average); 0.32::true_val(weight_feel, unk_weight_feel).

measured(s22, weight_feel, slightly_heavier_than_average).

all_consistent(weight_feel) :-
    consistent(s22, weight_feel).

evidence(all_consistent(weight_feel)).
query(true_val(weight_feel, slightly_heavier_than_average)).
query(true_val(weight_feel, unk_weight_feel)).

0.78::acc(s21, user_review_forum).

% @attr user_review_forum
% @type numeric
% @canonical true
% @original_name user_review_forum
% @values v4_2_of_5=4.2 unk_user_review_forum=Unknown
% @importance 0.80

0.64::true_val(user_review_forum, v4_2_of_5); 0.36::true_val(user_review_forum, unk_user_review_forum).

measured(s21, user_review_forum, v4_2_of_5).

all_consistent(user_review_forum) :-
    consistent(s21, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, v4_2_of_5)).
query(true_val(user_review_forum, unk_user_review_forum)).

0.80::acc(s23, overall_rating_snowboardingprofiles).
0.78::acc(s22, overall_rating_snowboardingprofiles).

% @attr overall_rating_snowboardingprofiles
% @type numeric
% @unit /100
% @canonical true
% @original_name overall_rating_snowboardingprofiles
% @values v85_175=85.175 v86_475=86.475 v83_7=83.7
% @importance 0.85

0.35::true_val(overall_rating_snowboardingprofiles, v85_175); 0.35::true_val(overall_rating_snowboardingprofiles, v86_475); 0.30::true_val(overall_rating_snowboardingprofiles, v83_7).

measured(s23, overall_rating_snowboardingprofiles, v85_175).
measured(s23, overall_rating_snowboardingprofiles, v86_475).
measured(s22, overall_rating_snowboardingprofiles, v83_7).

all_consistent(overall_rating_snowboardingprofiles) :-
    consistent(s23, overall_rating_snowboardingprofiles),
    consistent(s22, overall_rating_snowboardingprofiles).

evidence(all_consistent(overall_rating_snowboardingprofiles)).
query(true_val(overall_rating_snowboardingprofiles, v85_175)).
query(true_val(overall_rating_snowboardingprofiles, v86_475)).
query(true_val(overall_rating_snowboardingprofiles, v83_7)).

0.80::acc(s22, reviewer_opinion_snowboardingprofiles).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name reviewer_opinion_snowboardingprofiles
% @values rank_17th_of_28_freestyle=17th_of_28_freestyle_boards unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.85

0.68::true_val(reviewer_opinion_snowboardingprofiles, rank_17th_of_28_freestyle); 0.32::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).

measured(s22, reviewer_opinion_snowboardingprofiles, rank_17th_of_28_freestyle).

all_consistent(reviewer_opinion_snowboardingprofiles) :-
    consistent(s22, reviewer_opinion_snowboardingprofiles).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, rank_17th_of_28_freestyle)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

0.80::acc(s14, reviewer_opinion_snowboardingprofiles_allmtn).

% @attr reviewer_opinion_snowboardingprofiles_allmtn
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles
% @values rank_19th_of_38_all_mountain=19th_of_38_all_mountain unk_reviewer_opinion_snowboardingprofiles_allmtn=Unknown
% @importance 0.85

0.68::true_val(reviewer_opinion_snowboardingprofiles_allmtn, rank_19th_of_38_all_mountain); 0.32::true_val(reviewer_opinion_snowboardingprofiles_allmtn, unk_reviewer_opinion_snowboardingprofiles_allmtn).

measured(s14, reviewer_opinion_snowboardingprofiles_allmtn, rank_19th_of_38_all_mountain).

all_consistent(reviewer_opinion_snowboardingprofiles_allmtn) :-
    consistent(s14, reviewer_opinion_snowboardingprofiles_allmtn).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_allmtn)).
query(true_val(reviewer_opinion_snowboardingprofiles_allmtn, rank_19th_of_38_all_mountain)).
query(true_val(reviewer_opinion_snowboardingprofiles_allmtn, unk_reviewer_opinion_snowboardingprofiles_allmtn)).

0.80::acc(s14, reviewer_opinion_snowboardingprofiles_park).

% @attr reviewer_opinion_snowboardingprofiles_park
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles
% @values rank_21st_of_36_park=21st_of_36_park unk_reviewer_opinion_snowboardingprofiles_park=Unknown
% @importance 0.85

0.68::true_val(reviewer_opinion_snowboardingprofiles_park, rank_21st_of_36_park); 0.32::true_val(reviewer_opinion_snowboardingprofiles_park, unk_reviewer_opinion_snowboardingprofiles_park).

measured(s14, reviewer_opinion_snowboardingprofiles_park, rank_21st_of_36_park).

all_consistent(reviewer_opinion_snowboardingprofiles_park) :-
    consistent(s14, reviewer_opinion_snowboardingprofiles_park).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_park)).
query(true_val(reviewer_opinion_snowboardingprofiles_park, rank_21st_of_36_park)).
query(true_val(reviewer_opinion_snowboardingprofiles_park, unk_reviewer_opinion_snowboardingprofiles_park)).

0.80::acc(s110, snowboard_robot_assessment).

% @attr snowboard_robot_assessment
% @type categorical
% @canonical false
% @original_name Snowboard Robot assessment
% @values good_value_park_board=Good_value_park_board_very_good_value unk_snowboard_robot_assessment=Unknown
% @importance 0.80

0.68::true_val(snowboard_robot_assessment, good_value_park_board); 0.32::true_val(snowboard_robot_assessment, unk_snowboard_robot_assessment).

measured(s110, snowboard_robot_assessment, good_value_park_board).

all_consistent(snowboard_robot_assessment) :-
    consistent(s110, snowboard_robot_assessment).

evidence(all_consistent(snowboard_robot_assessment)).
query(true_val(snowboard_robot_assessment, good_value_park_board)).
query(true_val(snowboard_robot_assessment, unk_snowboard_robot_assessment)).

0.82::acc(s102, snowboard_selector_assessment).

% @attr snowboard_selector_assessment
% @type categorical
% @canonical false
% @original_name Snowboard Selector assessment
% @values impressed_park_credentials=Really_impressed_park_credentials_worth_money unk_snowboard_selector_assessment=Unknown
% @importance 0.80

0.64::true_val(snowboard_selector_assessment, impressed_park_credentials); 0.36::true_val(snowboard_selector_assessment, unk_snowboard_selector_assessment).

measured(s102, snowboard_selector_assessment, impressed_park_credentials).

all_consistent(snowboard_selector_assessment) :-
    consistent(s102, snowboard_selector_assessment).

evidence(all_consistent(snowboard_selector_assessment)).
query(true_val(snowboard_selector_assessment, impressed_park_credentials)).
query(true_val(snowboard_selector_assessment, unk_snowboard_selector_assessment)).

0.75::acc(s44, reviewer_opinion_whitelines).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values best_freestyle_list=Included_in_Best_Freestyle_Snowboards_list unk_reviewer_opinion_whitelines=Unknown
% @importance 0.60

0.60::true_val(reviewer_opinion_whitelines, best_freestyle_list); 0.40::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

measured(s44, reviewer_opinion_whitelines, best_freestyle_list).

all_consistent(reviewer_opinion_whitelines) :-
    consistent(s44, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, best_freestyle_list)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

0.75::acc(s21, user_review_forum_longevity).

% @attr user_review_forum_longevity
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values pop_still_good_after_years=2022_model_still_going_pop_still_good unk_user_review_forum_longevity=Unknown
% @importance 0.80

0.64::true_val(user_review_forum_longevity, pop_still_good_after_years); 0.36::true_val(user_review_forum_longevity, unk_user_review_forum_longevity).

measured(s21, user_review_forum_longevity, pop_still_good_after_years).

all_consistent(user_review_forum_longevity) :-
    consistent(s21, user_review_forum_longevity).

evidence(all_consistent(user_review_forum_longevity)).
query(true_val(user_review_forum_longevity, pop_still_good_after_years)).
query(true_val(user_review_forum_longevity, unk_user_review_forum_longevity)).

0.60::acc(s21, user_review_forum_failure).

% @attr user_review_forum_failure
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values snapped_first_run=One_user_board_snapped_first_run unk_user_review_forum_failure=Unknown
% @importance 0.80

0.53::true_val(user_review_forum_failure, snapped_first_run); 0.47::true_val(user_review_forum_failure, unk_user_review_forum_failure).

measured(s21, user_review_forum_failure, snapped_first_run).

all_consistent(user_review_forum_failure) :-
    consistent(s21, user_review_forum_failure).

evidence(all_consistent(user_review_forum_failure)).
query(true_val(user_review_forum_failure, snapped_first_run)).
query(true_val(user_review_forum_failure, unk_user_review_forum_failure)).

0.82::acc(s28, positive_aspect_nimble_turning).

% @attr positive_aspect_nimble_turning
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values effortless_nimble_turns=Turning_no_effort_surprisingly_nimble unk_positive_aspect_nimble_turning=Unknown
% @importance 0.80

0.64::true_val(positive_aspect_nimble_turning, effortless_nimble_turns); 0.36::true_val(positive_aspect_nimble_turning, unk_positive_aspect_nimble_turning).

measured(s28, positive_aspect_nimble_turning, effortless_nimble_turns).

all_consistent(positive_aspect_nimble_turning) :-
    consistent(s28, positive_aspect_nimble_turning).

evidence(all_consistent(positive_aspect_nimble_turning)).
query(true_val(positive_aspect_nimble_turning, effortless_nimble_turns)).
query(true_val(positive_aspect_nimble_turning, unk_positive_aspect_nimble_turning)).

0.70::acc(s56, positive_aspect_value).
0.78::acc(s110, positive_aspect_value).

% @attr positive_aspect_value
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values sintered_full_edges_good_price=Sintered_base_full_metal_edges_competitive_price unk_positive_aspect_value=Unknown
% @importance 0.75

0.95::true_val(positive_aspect_value, sintered_full_edges_good_price); 0.05::true_val(positive_aspect_value, unk_positive_aspect_value).

measured(s56, positive_aspect_value, sintered_full_edges_good_price).
measured(s110, positive_aspect_value, sintered_full_edges_good_price).

all_consistent(positive_aspect_value) :-
    consistent(s56, positive_aspect_value),
    consistent(s110, positive_aspect_value).

evidence(all_consistent(positive_aspect_value)).
query(true_val(positive_aspect_value, sintered_full_edges_good_price)).
query(true_val(positive_aspect_value, unk_positive_aspect_value)).

0.78::acc(s4, positive_aspect_versatility).
0.78::acc(s73, positive_aspect_versatility).

% @attr positive_aspect_versatility
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values park_and_mountain=Functions_well_park_and_rest_of_mountain unk_positive_aspect_versatility=Unknown
% @importance 0.75

0.95::true_val(positive_aspect_versatility, park_and_mountain); 0.05::true_val(positive_aspect_versatility, unk_positive_aspect_versatility).

measured(s4, positive_aspect_versatility, park_and_mountain).
measured(s73, positive_aspect_versatility, park_and_mountain).

all_consistent(positive_aspect_versatility) :-
    (indep(s4), consistent(s4, positive_aspect_versatility) ; \+indep(s4)),
    consistent(s73, positive_aspect_versatility).

evidence(all_consistent(positive_aspect_versatility)).
query(true_val(positive_aspect_versatility, park_and_mountain)).
query(true_val(positive_aspect_versatility, unk_positive_aspect_versatility)).

0.75::acc(s21, positive_aspect_durability).

% @attr positive_aspect_durability
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values years_hard_use_repairable=Years_hard_use_rails_rocks_successful_repairs unk_positive_aspect_durability=Unknown
% @importance 0.80

0.64::true_val(positive_aspect_durability, years_hard_use_repairable); 0.36::true_val(positive_aspect_durability, unk_positive_aspect_durability).

measured(s21, positive_aspect_durability, years_hard_use_repairable).

all_consistent(positive_aspect_durability) :-
    consistent(s21, positive_aspect_durability).

evidence(all_consistent(positive_aspect_durability)).
query(true_val(positive_aspect_durability, years_hard_use_repairable)).
query(true_val(positive_aspect_durability, unk_positive_aspect_durability)).

0.80::acc(s23, positive_aspect_easy_transition).

% @attr positive_aspect_easy_transition
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values easy_from_rocker_flat=Easy_transition_from_rocker_or_flat_profile unk_positive_aspect_easy_transition=Unknown
% @importance 0.85

0.64::true_val(positive_aspect_easy_transition, easy_from_rocker_flat); 0.36::true_val(positive_aspect_easy_transition, unk_positive_aspect_easy_transition).

measured(s23, positive_aspect_easy_transition, easy_from_rocker_flat).

all_consistent(positive_aspect_easy_transition) :-
    consistent(s23, positive_aspect_easy_transition).

evidence(all_consistent(positive_aspect_easy_transition)).
query(true_val(positive_aspect_easy_transition, easy_from_rocker_flat)).
query(true_val(positive_aspect_easy_transition, unk_positive_aspect_easy_transition)).

0.72::acc(s52, positive_aspect_fun).
0.72::acc(s54, positive_aspect_fun).

% @attr positive_aspect_fun
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values plain_fun_to_ride=Multiple_reviewers_just_plain_fun unk_positive_aspect_fun=Unknown
% @importance 0.625

0.95::true_val(positive_aspect_fun, plain_fun_to_ride); 0.05::true_val(positive_aspect_fun, unk_positive_aspect_fun).

measured(s52, positive_aspect_fun, plain_fun_to_ride).
measured(s54, positive_aspect_fun, plain_fun_to_ride).

all_consistent(positive_aspect_fun) :-
    consistent(s52, positive_aspect_fun),
    consistent(s54, positive_aspect_fun).

evidence(all_consistent(positive_aspect_fun)).
query(true_val(positive_aspect_fun, plain_fun_to_ride)).
query(true_val(positive_aspect_fun, unk_positive_aspect_fun)).

0.80::acc(s14, negative_aspect_flex_soft_carving).
0.75::acc(s59, negative_aspect_flex_soft_carving).

% @attr negative_aspect_flex_soft_carving
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values flex_too_soft_aggressive_carving=Flex_too_soft_for_aggressive_high_speed_carving unk_negative_aspect_flex_soft_carving=Unknown
% @importance 0.80

0.95::true_val(negative_aspect_flex_soft_carving, flex_too_soft_aggressive_carving); 0.05::true_val(negative_aspect_flex_soft_carving, unk_negative_aspect_flex_soft_carving).

measured(s14, negative_aspect_flex_soft_carving, flex_too_soft_aggressive_carving).
measured(s59, negative_aspect_flex_soft_carving, flex_too_soft_aggressive_carving).

all_consistent(negative_aspect_flex_soft_carving) :-
    consistent(s14, negative_aspect_flex_soft_carving),
    consistent(s59, negative_aspect_flex_soft_carving).

evidence(all_consistent(negative_aspect_flex_soft_carving)).
query(true_val(negative_aspect_flex_soft_carving, flex_too_soft_aggressive_carving)).
query(true_val(negative_aspect_flex_soft_carving, unk_negative_aspect_flex_soft_carving)).

0.78::acc(s106, negative_aspect_flex_break_in).

% @attr negative_aspect_flex_break_in
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values flex_breaks_in_daily_season=Flex_breaks_in_significantly_after_season_daily unk_negative_aspect_flex_break_in=Unknown
% @importance 0.75

0.60::true_val(negative_aspect_flex_break_in, flex_breaks_in_daily_season); 0.40::true_val(negative_aspect_flex_break_in, unk_negative_aspect_flex_break_in).

measured(s106, negative_aspect_flex_break_in, flex_breaks_in_daily_season).

all_consistent(negative_aspect_flex_break_in) :-
    consistent(s106, negative_aspect_flex_break_in).

evidence(all_consistent(negative_aspect_flex_break_in)).
query(true_val(negative_aspect_flex_break_in, flex_breaks_in_daily_season)).
query(true_val(negative_aspect_flex_break_in, unk_negative_aspect_flex_break_in)).

0.82::acc(s107, negative_aspect_not_jib_specialist).

% @attr negative_aspect_not_jib_specialist
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values not_jib_specialist=Not_jib_specialist_softer_options_exist unk_negative_aspect_not_jib_specialist=Unknown
% @importance 0.85

0.64::true_val(negative_aspect_not_jib_specialist, not_jib_specialist); 0.36::true_val(negative_aspect_not_jib_specialist, unk_negative_aspect_not_jib_specialist).

measured(s107, negative_aspect_not_jib_specialist, not_jib_specialist).

all_consistent(negative_aspect_not_jib_specialist) :-
    consistent(s107, negative_aspect_not_jib_specialist).

evidence(all_consistent(negative_aspect_not_jib_specialist)).
query(true_val(negative_aspect_not_jib_specialist, not_jib_specialist)).
query(true_val(negative_aspect_not_jib_specialist, unk_negative_aspect_not_jib_specialist)).

0.80::acc(s14, negative_aspect_park_not_all_mountain).

% @attr negative_aspect_park_not_all_mountain
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values park_board_not_true_all_mountain=More_park_than_true_all_mountain_freestyle unk_negative_aspect_park_not_all_mountain=Unknown
% @importance 0.85

0.68::true_val(negative_aspect_park_not_all_mountain, park_board_not_true_all_mountain); 0.32::true_val(negative_aspect_park_not_all_mountain, unk_negative_aspect_park_not_all_mountain).

measured(s14, negative_aspect_park_not_all_mountain, park_board_not_true_all_mountain).

all_consistent(negative_aspect_park_not_all_mountain) :-
    consistent(s14, negative_aspect_park_not_all_mountain).

evidence(all_consistent(negative_aspect_park_not_all_mountain)).
query(true_val(negative_aspect_park_not_all_mountain, park_board_not_true_all_mountain)).
query(true_val(negative_aspect_park_not_all_mountain, unk_negative_aspect_park_not_all_mountain)).

0.82::acc(s23, negative_aspect_softer_than_stated).
0.82::acc(s102, negative_aspect_softer_than_stated).

% @attr negative_aspect_softer_than_stated
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values rides_softer_than_stated=Rides_softer_than_stated_flex_rating unk_negative_aspect_softer_than_stated=Unknown
% @importance 0.825

0.95::true_val(negative_aspect_softer_than_stated, rides_softer_than_stated); 0.05::true_val(negative_aspect_softer_than_stated, unk_negative_aspect_softer_than_stated).

measured(s23, negative_aspect_softer_than_stated, rides_softer_than_stated).
measured(s102, negative_aspect_softer_than_stated, rides_softer_than_stated).

all_consistent(negative_aspect_softer_than_stated) :-
    consistent(s23, negative_aspect_softer_than_stated),
    consistent(s102, negative_aspect_softer_than_stated).

evidence(all_consistent(negative_aspect_softer_than_stated)).
query(true_val(negative_aspect_softer_than_stated, rides_softer_than_stated)).
query(true_val(negative_aspect_softer_than_stated, unk_negative_aspect_softer_than_stated)).

0.93::acc(s63, warranty_period_years).
0.80::acc(s113, warranty_period_years).

% @attr warranty_period_years
% @type numeric
% @unit years
% @canonical true
% @original_name warranty_period_years
% @values v2=2.0 unk_warranty_period_years=Unknown
% @importance 0.75

0.97::true_val(warranty_period_years, v2); 0.03::true_val(warranty_period_years, unk_warranty_period_years).

measured(s63, warranty_period_years, v2).
measured(s113, warranty_period_years, v2).

all_consistent(warranty_period_years) :-
    consistent(s63, warranty_period_years),
    (indep(s113), consistent(s113, warranty_period_years) ; \+indep(s113)).

evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v2)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

0.90::acc(s67, warranty).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values repair_or_replace_no_charge=Repair_or_replace_at_no_charge unk_warranty=Unknown
% @importance 0.65

0.86::true_val(warranty, repair_or_replace_no_charge); 0.14::true_val(warranty, unk_warranty).

measured(s67, warranty, repair_or_replace_no_charge).

all_consistent(warranty) :-
    consistent(s67, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, repair_or_replace_no_charge)).
query(true_val(warranty, unk_warranty)).

0.90::acc(s63, warranty_purchase_requirement).

% @attr warranty_purchase_requirement
% @type categorical
% @canonical false
% @original_name warranty
% @values authorized_retailer_proof=Must_purchase_from_authorized_retailer_with_proof unk_warranty_purchase_requirement=Unknown
% @importance 0.75

0.90::true_val(warranty_purchase_requirement, authorized_retailer_proof); 0.10::true_val(warranty_purchase_requirement, unk_warranty_purchase_requirement).

measured(s63, warranty_purchase_requirement, authorized_retailer_proof).

all_consistent(warranty_purchase_requirement) :-
    consistent(s63, warranty_purchase_requirement).

evidence(all_consistent(warranty_purchase_requirement)).
query(true_val(warranty_purchase_requirement, authorized_retailer_proof)).
query(true_val(warranty_purchase_requirement, unk_warranty_purchase_requirement)).

0.85::acc(s34, sustainability_certification).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values biobased_30_plant_derived=BioBased_30_resin_30pct_plant_derived unk_sustainability_certification=Unknown
% @importance 0.75

0.72::true_val(sustainability_certification, biobased_30_plant_derived); 0.28::true_val(sustainability_certification, unk_sustainability_certification).

measured(s34, sustainability_certification, biobased_30_plant_derived).

all_consistent(sustainability_certification) :-
    (indep(s34), consistent(s34, sustainability_certification) ; \+indep(s34)).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, biobased_30_plant_derived)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

0.90::acc(s12, sustainability_certification_wax).

% @attr sustainability_certification_wax
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values paraffin_free_non_pollutant=Paraffin_free_non_pollutant_compound unk_sustainability_certification_wax=Unknown
% @importance 0.90

0.86::true_val(sustainability_certification_wax, paraffin_free_non_pollutant); 0.14::true_val(sustainability_certification_wax, unk_sustainability_certification_wax).

measured(s12, sustainability_certification_wax, paraffin_free_non_pollutant).

all_consistent(sustainability_certification_wax) :-
    consistent(s12, sustainability_certification_wax).

evidence(all_consistent(sustainability_certification_wax)).
query(true_val(sustainability_certification_wax, paraffin_free_non_pollutant)).
query(true_val(sustainability_certification_wax, unk_sustainability_certification_wax)).

0.90::acc(s12, variant_standard).

% @attr variant_standard
% @type categorical
% @canonical false
% @original_name Variant — Huck Knife (standard)
% @values medium_flex_aspen_sintered=Medium_flex_Aspen_SLCT_sintered_base unk_variant_standard=Unknown
% @importance 0.90

0.86::true_val(variant_standard, medium_flex_aspen_sintered); 0.14::true_val(variant_standard, unk_variant_standard).

measured(s12, variant_standard, medium_flex_aspen_sintered).

all_consistent(variant_standard) :-
    consistent(s12, variant_standard).

evidence(all_consistent(variant_standard)).
query(true_val(variant_standard, medium_flex_aspen_sintered)).
query(true_val(variant_standard, unk_variant_standard)).

0.90::acc(s13, variant_pro).
0.90::acc(s76, variant_pro).

% @attr variant_pro
% @type categorical
% @canonical false
% @original_name Variant — Huck Knife Pro
% @values stiffer_ghost_green_carbon_damplifier=Stiffer_Ghost_Green_Core_Ghost_Carbon_Damplifier_Sintered_EG unk_variant_pro=Unknown
% @importance 0.65

0.95::true_val(variant_pro, stiffer_ghost_green_carbon_damplifier); 0.05::true_val(variant_pro, unk_variant_pro).

measured(s13, variant_pro, stiffer_ghost_green_carbon_damplifier).
measured(s76, variant_pro, stiffer_ghost_green_carbon_damplifier).

all_consistent(variant_pro) :-
    consistent(s13, variant_pro),
    consistent(s76, variant_pro).

evidence(all_consistent(variant_pro)).
query(true_val(variant_pro, stiffer_ghost_green_carbon_damplifier)).
query(true_val(variant_pro, unk_variant_pro)).

0.82::acc(s29, variant_pro_dusty_ltd).

% @attr variant_pro_dusty_ltd
% @type categorical
% @canonical false
% @original_name Variant — Huck Knife Pro Dusty LTD
% @values collab_dusty_henricksen_same_pro_specs=Collaboration_Dusty_Henricksen_same_Pro_specs unk_variant_pro_dusty_ltd=Unknown
% @importance 0.50

0.60::true_val(variant_pro_dusty_ltd, collab_dusty_henricksen_same_pro_specs); 0.40::true_val(variant_pro_dusty_ltd, unk_variant_pro_dusty_ltd).

measured(s29, variant_pro_dusty_ltd, collab_dusty_henricksen_same_pro_specs).

all_consistent(variant_pro_dusty_ltd) :-
    (indep(s29), consistent(s29, variant_pro_dusty_ltd) ; \+indep(s29)).

evidence(all_consistent(variant_pro_dusty_ltd)).
query(true_val(variant_pro_dusty_ltd, collab_dusty_henricksen_same_pro_specs)).
query(true_val(variant_pro_dusty_ltd, unk_variant_pro_dusty_ltd)).

0.78::acc(s116, variant_grom).

% @attr variant_grom
% @type categorical
% @canonical false
% @original_name Variant — Huck Knife Grom
% @values youth_version_scaled_down=Youth_version_scaled_for_younger_riders unk_variant_grom=Unknown
% @importance 0.40

0.60::true_val(variant_grom, youth_version_scaled_down); 0.40::true_val(variant_grom, unk_variant_grom).

measured(s116, variant_grom, youth_version_scaled_down).

all_consistent(variant_grom) :-
    (indep(s116), consistent(s116, variant_grom) ; \+indep(s116)).

evidence(all_consistent(variant_grom)).
query(true_val(variant_grom, youth_version_scaled_down)).
query(true_val(variant_grom, unk_variant_grom)).

0.85::acc(s40, huck_knife_pro_price).

% @attr huck_knife_pro_price
% @type numeric
% @unit USD
% @canonical false
% @original_name Huck Knife Pro price
% @values v679_95=679.95 unk_huck_knife_pro_price=Unknown
% @importance 0.70

0.63::true_val(huck_knife_pro_price, v679_95); 0.37::true_val(huck_knife_pro_price, unk_huck_knife_pro_price).

measured(s40, huck_knife_pro_price, v679_95).

all_consistent(huck_knife_pro_price) :-
    (indep(s40), consistent(s40, huck_knife_pro_price) ; \+indep(s40)).

evidence(all_consistent(huck_knife_pro_price)).
query(true_val(huck_knife_pro_price, v679_95)).
query(true_val(huck_knife_pro_price, unk_huck_knife_pro_price)).

0.80::acc(s98, pro_rider_name).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values dusty_henricksen_sven_thorgren=Dusty_Henricksen_and_Sven_Thorgren unk_pro_rider_name=Unknown
% @importance 0.40

0.64::true_val(pro_rider_name, dusty_henricksen_sven_thorgren); 0.36::true_val(pro_rider_name, unk_pro_rider_name).

measured(s98, pro_rider_name, dusty_henricksen_sven_thorgren).

all_consistent(pro_rider_name) :-
    (indep(s98), consistent(s98, pro_rider_name) ; \+indep(s98)).

evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, dusty_henricksen_sven_thorgren)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

0.82::acc(s42, comparable_board_cross_brand).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values capita_doa_similar_hk_softer=Capita_DOA_very_similar_HK_softer_more_playful unk_comparable_board_cross_brand=Unknown
% @importance 0.90

0.68::true_val(comparable_board_cross_brand, capita_doa_similar_hk_softer); 0.32::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s42, comparable_board_cross_brand, capita_doa_similar_hk_softer).

all_consistent(comparable_board_cross_brand) :-
    consistent(s42, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, capita_doa_similar_hk_softer)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

0.82::acc(s42, comparable_board_cross_brand_doa_detail).
0.65::acc(s43, comparable_board_cross_brand_doa_detail).

% @attr comparable_board_cross_brand_doa_detail
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values hybrid_camber_doa_stiffer_hk_jib_doa_jump=Hybrid_camber_DOA_stiffer_HK_jibbing_DOA_jumping unk_comparable_board_cross_brand_doa_detail=Unknown
% @importance 0.80

0.95::true_val(comparable_board_cross_brand_doa_detail, hybrid_camber_doa_stiffer_hk_jib_doa_jump); 0.05::true_val(comparable_board_cross_brand_doa_detail, unk_comparable_board_cross_brand_doa_detail).

measured(s42, comparable_board_cross_brand_doa_detail, hybrid_camber_doa_stiffer_hk_jib_doa_jump).
measured(s43, comparable_board_cross_brand_doa_detail, hybrid_camber_doa_stiffer_hk_jib_doa_jump).

all_consistent(comparable_board_cross_brand_doa_detail) :-
    consistent(s42, comparable_board_cross_brand_doa_detail),
    consistent(s43, comparable_board_cross_brand_doa_detail).

evidence(all_consistent(comparable_board_cross_brand_doa_detail)).
query(true_val(comparable_board_cross_brand_doa_detail, hybrid_camber_doa_stiffer_hk_jib_doa_jump)).
query(true_val(comparable_board_cross_brand_doa_detail, unk_comparable_board_cross_brand_doa_detail)).

0.82::acc(s42, comparable_board_cross_brand_jackpot).

% @attr comparable_board_cross_brand_jackpot
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values yes_jackpot_midbite_ice_grip=YES_Jackpot_Midbite_extra_ice_grip unk_comparable_board_cross_brand_jackpot=Unknown
% @importance 0.90

0.68::true_val(comparable_board_cross_brand_jackpot, yes_jackpot_midbite_ice_grip); 0.32::true_val(comparable_board_cross_brand_jackpot, unk_comparable_board_cross_brand_jackpot).

measured(s42, comparable_board_cross_brand_jackpot, yes_jackpot_midbite_ice_grip).

all_consistent(comparable_board_cross_brand_jackpot) :-
    consistent(s42, comparable_board_cross_brand_jackpot).

evidence(all_consistent(comparable_board_cross_brand_jackpot)).
query(true_val(comparable_board_cross_brand_jackpot, yes_jackpot_midbite_ice_grip)).
query(true_val(comparable_board_cross_brand_jackpot, unk_comparable_board_cross_brand_jackpot)).

0.72::acc(s55, comparable_board_same_brand).
0.75::acc(s59, comparable_board_same_brand).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values assassin_stiffer_all_mountain=Assassin_stiffer_all_mountain_groomer_carving unk_comparable_board_same_brand=Unknown
% @importance 0.65

0.95::true_val(comparable_board_same_brand, assassin_stiffer_all_mountain); 0.05::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s55, comparable_board_same_brand, assassin_stiffer_all_mountain).
measured(s59, comparable_board_same_brand, assassin_stiffer_all_mountain).

all_consistent(comparable_board_same_brand) :-
    consistent(s55, comparable_board_same_brand),
    consistent(s59, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, assassin_stiffer_all_mountain)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

0.78::acc(s54, comparable_board_cross_brand_all_mtn).
0.82::acc(s102, comparable_board_cross_brand_all_mtn).

% @attr comparable_board_cross_brand_all_mtn
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values alternative_more_all_mountain_freestyle=Alternative_more_all_mountain_with_freestyle unk_comparable_board_cross_brand_all_mtn=Unknown
% @importance 0.725

0.95::true_val(comparable_board_cross_brand_all_mtn, alternative_more_all_mountain_freestyle); 0.05::true_val(comparable_board_cross_brand_all_mtn, unk_comparable_board_cross_brand_all_mtn).

measured(s54, comparable_board_cross_brand_all_mtn, alternative_more_all_mountain_freestyle).
measured(s102, comparable_board_cross_brand_all_mtn, alternative_more_all_mountain_freestyle).

all_consistent(comparable_board_cross_brand_all_mtn) :-
    consistent(s54, comparable_board_cross_brand_all_mtn),
    consistent(s102, comparable_board_cross_brand_all_mtn).

evidence(all_consistent(comparable_board_cross_brand_all_mtn)).
query(true_val(comparable_board_cross_brand_all_mtn, alternative_more_all_mountain_freestyle)).
query(true_val(comparable_board_cross_brand_all_mtn, unk_comparable_board_cross_brand_all_mtn)).

0.78::acc(s106, comparable_board_same_brand_pro).

% @attr comparable_board_same_brand_pro
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values pro_for_jumps_standard_for_rails=HK_Pro_for_jumps_standard_HK_for_rails unk_comparable_board_same_brand_pro=Unknown
% @importance 0.75

0.60::true_val(comparable_board_same_brand_pro, pro_for_jumps_standard_for_rails); 0.40::true_val(comparable_board_same_brand_pro, unk_comparable_board_same_brand_pro).

measured(s106, comparable_board_same_brand_pro, pro_for_jumps_standard_for_rails).

all_consistent(comparable_board_same_brand_pro) :-
    consistent(s106, comparable_board_same_brand_pro).

evidence(all_consistent(comparable_board_same_brand_pro)).
query(true_val(comparable_board_same_brand_pro, pro_for_jumps_standard_for_rails)).
query(true_val(comparable_board_same_brand_pro, unk_comparable_board_same_brand_pro)).

0.68::acc(s60, user_review_forum_assassin).

% @attr user_review_forum_assassin
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values assassin_for_all_mtn_hk_for_park=Assassin_for_all_mountain_HK_for_park unk_user_review_forum_assassin=Unknown
% @importance 0.60

0.49::true_val(user_review_forum_assassin, assassin_for_all_mtn_hk_for_park); 0.51::true_val(user_review_forum_assassin, unk_user_review_forum_assassin).

measured(s60, user_review_forum_assassin, assassin_for_all_mtn_hk_for_park).

all_consistent(user_review_forum_assassin) :-
    consistent(s60, user_review_forum_assassin).

evidence(all_consistent(user_review_forum_assassin)).
query(true_val(user_review_forum_assassin, assassin_for_all_mtn_hk_for_park)).
query(true_val(user_review_forum_assassin, unk_user_review_forum_assassin)).

0.82::acc(s32, retailer_evo).

% @attr retailer_evo
% @type categorical
% @canonical false
% @original_name evo.com
% @values major_us_retailer_price_match=Major_US_retailer_price_match_5pct_free_shipping unk_retailer_evo=Unknown
% @importance 0.90

0.77::true_val(retailer_evo, major_us_retailer_price_match); 0.23::true_val(retailer_evo, unk_retailer_evo).

measured(s32, retailer_evo, major_us_retailer_price_match).

all_consistent(retailer_evo) :-
    consistent(s32, retailer_evo).

evidence(all_consistent(retailer_evo)).
query(true_val(retailer_evo, major_us_retailer_price_match)).
query(true_val(retailer_evo, unk_retailer_evo)).

0.85::acc(s93, retailer_tactics).

% @attr retailer_tactics
% @type categorical
% @canonical false
% @original_name Tactics
% @values reputable_us_shop_10pct_rewards=Reputable_US_shop_10pct_rewards_free_shipping unk_retailer_tactics=Unknown
% @importance 0.80

0.72::true_val(retailer_tactics, reputable_us_shop_10pct_rewards); 0.28::true_val(retailer_tactics, unk_retailer_tactics).

measured(s93, retailer_tactics, reputable_us_shop_10pct_rewards).

all_consistent(retailer_tactics) :-
    (indep(s93), consistent(s93, retailer_tactics) ; \+indep(s93)).

evidence(all_consistent(retailer_tactics)).
query(true_val(retailer_tactics, reputable_us_shop_10pct_rewards)).
query(true_val(retailer_tactics, unk_retailer_tactics)).

0.78::acc(s21, retailer_rei).

% @attr retailer_rei
% @type categorical
% @canonical false
% @original_name REI Co-op
% @values premium_outdoor_4_2_rating_broad_return=Premium_outdoor_expert_advice_4_2_avg_broad_return unk_retailer_rei=Unknown
% @importance 0.80

0.64::true_val(retailer_rei, premium_outdoor_4_2_rating_broad_return); 0.36::true_val(retailer_rei, unk_retailer_rei).

measured(s21, retailer_rei, premium_outdoor_4_2_rating_broad_return).

all_consistent(retailer_rei) :-
    consistent(s21, retailer_rei).

evidence(all_consistent(retailer_rei)).
query(true_val(retailer_rei, premium_outdoor_4_2_rating_broad_return)).
query(true_val(retailer_rei, unk_retailer_rei)).

0.82::acc(s33, retailer_willis).

% @attr retailer_willis
% @type categorical
% @canonical false
% @original_name Willi's Ski & Board
% @values specialty_shop_579_95_30day_returns=Specialty_shop_579_95_30day_returns unk_retailer_willis=Unknown
% @importance 0.85

0.63::true_val(retailer_willis, specialty_shop_579_95_30day_returns); 0.37::true_val(retailer_willis, unk_retailer_willis).

measured(s33, retailer_willis, specialty_shop_579_95_30day_returns).

all_consistent(retailer_willis) :-
    consistent(s33, retailer_willis).

evidence(all_consistent(retailer_willis)).
query(true_val(retailer_willis, specialty_shop_579_95_30day_returns)).
query(true_val(retailer_willis, unk_retailer_willis)).

0.82::acc(s34, retailer_eriks).

% @attr retailer_eriks
% @type categorical
% @canonical false
% @original_name ERIK'S
% @values multi_state_us_free_binding_install=Multi_state_US_retailer_free_binding_install unk_retailer_eriks=Unknown
% @importance 0.75

0.65::true_val(retailer_eriks, multi_state_us_free_binding_install); 0.35::true_val(retailer_eriks, unk_retailer_eriks).

measured(s34, retailer_eriks, multi_state_us_free_binding_install).

all_consistent(retailer_eriks) :-
    (indep(s34), consistent(s34, retailer_eriks) ; \+indep(s34)).

evidence(all_consistent(retailer_eriks)).
query(true_val(retailer_eriks, multi_state_us_free_binding_install)).
query(true_val(retailer_eriks, unk_retailer_eriks)).

0.80::acc(s4, retailer_melbourne_snowboard).

% @attr retailer_melbourne_snowboard
% @type categorical
% @canonical false
% @original_name Melbourne Snowboard Centre (AU)
% @values australian_specialist_2027_model=Australian_specialist_carrying_2027_model unk_retailer_melbourne_snowboard=Unknown
% @importance 0.80

0.60::true_val(retailer_melbourne_snowboard, australian_specialist_2027_model); 0.40::true_val(retailer_melbourne_snowboard, unk_retailer_melbourne_snowboard).

measured(s4, retailer_melbourne_snowboard, australian_specialist_2027_model).

all_consistent(retailer_melbourne_snowboard) :-
    (indep(s4), consistent(s4, retailer_melbourne_snowboard) ; \+indep(s4)).

evidence(all_consistent(retailer_melbourne_snowboard)).
query(true_val(retailer_melbourne_snowboard, australian_specialist_2027_model)).
query(true_val(retailer_melbourne_snowboard, unk_retailer_melbourne_snowboard)).

0.80::acc(s118, retailer_balmoral).

% @attr retailer_balmoral
% @type categorical
% @canonical false
% @original_name Balmoral Boards (AU)
% @values australian_retailer_2027_preorder=Australian_retailer_2027_preorder_Apr_May_2026 unk_retailer_balmoral=Unknown
% @importance 0.85

0.63::true_val(retailer_balmoral, australian_retailer_2027_preorder); 0.37::true_val(retailer_balmoral, unk_retailer_balmoral).

measured(s118, retailer_balmoral, australian_retailer_2027_preorder).

all_consistent(retailer_balmoral) :-
    (indep(s118), consistent(s118, retailer_balmoral) ; \+indep(s118)).

evidence(all_consistent(retailer_balmoral)).
query(true_val(retailer_balmoral, australian_retailer_2027_preorder)).
query(true_val(retailer_balmoral, unk_retailer_balmoral)).

0.85::acc(s35, binding_compatibility).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values inserts_2x4_most_bindings=2x4_insert_compatible_most_bindings unk_binding_compatibility=Unknown
% @importance 0.70

0.60::true_val(binding_compatibility, inserts_2x4_most_bindings); 0.40::true_val(binding_compatibility, unk_binding_compatibility).

measured(s35, binding_compatibility, inserts_2x4_most_bindings).

all_consistent(binding_compatibility) :-
    (indep(s35), consistent(s35, binding_compatibility) ; \+indep(s35)).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, inserts_2x4_most_bindings)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

0.78::acc(s37, available_colors).
0.80::acc(s113, available_colors).

% @attr available_colors
% @type categorical
% @canonical true
% @original_name available_colors
% @values varies_random_by_manufacturer=May_vary_chosen_at_random unk_available_colors=Unknown
% @importance 0.775

0.95::true_val(available_colors, varies_random_by_manufacturer); 0.05::true_val(available_colors, unk_available_colors).

measured(s37, available_colors, varies_random_by_manufacturer).
measured(s113, available_colors, varies_random_by_manufacturer).

all_consistent(available_colors) :-
    (indep(s37), consistent(s37, available_colors) ; \+indep(s37)),
    (indep(s113), consistent(s113, available_colors) ; \+indep(s113)).

evidence(all_consistent(available_colors)).
query(true_val(available_colors, varies_random_by_manufacturer)).
query(true_val(available_colors, unk_available_colors)).

0.72::acc(s54, recommended_bindings).
0.68::acc(s46, recommended_bindings).

% @attr recommended_bindings
% @type categorical
% @canonical false
% @original_name Recommended bindings (forum users)
% @values hologram_str_mid_flex=Salomon_Hologram_Union_STR_mid_flex_freestyle unk_recommended_bindings=Unknown
% @importance 0.625

0.90::true_val(recommended_bindings, hologram_str_mid_flex); 0.10::true_val(recommended_bindings, unk_recommended_bindings).

measured(s54, recommended_bindings, hologram_str_mid_flex).
measured(s46, recommended_bindings, hologram_str_mid_flex).

all_consistent(recommended_bindings) :-
    consistent(s54, recommended_bindings),
    consistent(s46, recommended_bindings).

evidence(all_consistent(recommended_bindings)).
query(true_val(recommended_bindings, hologram_str_mid_flex)).
query(true_val(recommended_bindings, unk_recommended_bindings)).