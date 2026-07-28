0.15::indep(s3).
0.15::indep(s10).
0.30::indep(s31).
0.30::indep(s32).
0.30::indep(s33).
0.15::indep(s18).
0.15::indep(s22).
0.15::indep(s23).
0.20::indep(s24).
0.15::indep(s26).
0.10::indep(s27).
0.15::indep(s28).
0.25::indep(s_merchant).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values bataleon=Bataleon unk_brand=Unknown
% @importance 1.0

0.95::acc(s1, brand).

0.95::true_val(brand, bataleon); 0.05::true_val(brand, unk_brand).

measured(s1, brand, bataleon).

all_consistent(brand) :- consistent(s1, brand).

evidence(all_consistent(brand)).
query(true_val(brand, bataleon)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values surfer=Surfer unk_model_name=Unknown
% @importance 0.95

0.95::acc(s1, model_name).
0.83::acc(s2, model_name).

0.95::true_val(model_name, surfer); 0.05::true_val(model_name, unk_model_name).

measured(s1, model_name, surfer).
measured(s2, model_name, surfer).

all_consistent(model_name) :-
    consistent(s1, model_name),
    (indep(s31), consistent(s2, model_name) ; \+indep(s31)).

evidence(all_consistent(model_name)).
query(true_val(model_name, surfer)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values season_2025_2026=2025_2026 unk_model_year=Unknown
% @importance 0.95

0.95::acc(s1, model_year).
0.83::acc(s2, model_year).

0.95::true_val(model_year, season_2025_2026); 0.05::true_val(model_year, unk_model_year).

measured(s1, model_year, season_2025_2026).
measured(s2, model_year, season_2025_2026).

all_consistent(model_year) :-
    consistent(s1, model_year),
    (indep(s31), consistent(s2, model_year) ; \+indep(s31)).

evidence(all_consistent(model_year)).
query(true_val(model_year, season_2025_2026)).
query(true_val(model_year, unk_model_year)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.95::acc(s1, product_type).

0.95::true_val(product_type, snowboard); 0.05::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).

all_consistent(product_type) :- consistent(s1, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 1.0

0.95::acc(s1, gender).

0.95::true_val(gender, mens); 0.05::true_val(gender, unk_gender).

measured(s1, gender, mens).

all_consistent(gender) :- consistent(s1, gender).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values powder_freeride=Powder_Freeride unk_board_category=Unknown
% @importance 0.80

0.83::acc(s2, board_category).
0.75::acc(s3, board_category).

0.95::true_val(board_category, powder_freeride); 0.05::true_val(board_category, unk_board_category).

measured(s2, board_category, powder_freeride).
measured(s3, board_category, powder_freeride).

all_consistent(board_category) :-
    consistent(s2, board_category),
    (indep(s3), consistent(s3, board_category) ; \+indep(s3)).

evidence(all_consistent(board_category)).
query(true_val(board_category, powder_freeride)).
query(true_val(board_category, unk_board_category)).

% @attr manufacturer_founded
% @type categorical
% @canonical false
% @original_name Manufacturer founded
% @values y2000=2000_Netherlands_Jorgen_Karlsen y2001=2001
% @importance 0.40

0.88::acc(s4, manufacturer_founded).
0.70::acc(s5, manufacturer_founded).

0.65::true_val(manufacturer_founded, y2000); 0.35::true_val(manufacturer_founded, y2001).

measured(s4, manufacturer_founded, y2000).
measured(s5, manufacturer_founded, y2001).

all_consistent(manufacturer_founded) :-
    consistent(s4, manufacturer_founded),
    consistent(s5, manufacturer_founded).

evidence(all_consistent(manufacturer_founded)).
query(true_val(manufacturer_founded, y2000)).
query(true_val(manufacturer_founded, y2001)).

% @attr manufacturer_headquarters
% @type categorical
% @canonical false
% @original_name Manufacturer headquarters
% @values amsterdam_netherlands=Amsterdam_Netherlands unk_manufacturer_headquarters=Unknown
% @importance 0.43

0.88::acc(s6, manufacturer_headquarters).
0.80::acc(s7, manufacturer_headquarters).

0.95::true_val(manufacturer_headquarters, amsterdam_netherlands); 0.05::true_val(manufacturer_headquarters, unk_manufacturer_headquarters).

measured(s6, manufacturer_headquarters, amsterdam_netherlands).
measured(s7, manufacturer_headquarters, amsterdam_netherlands).

all_consistent(manufacturer_headquarters) :-
    consistent(s6, manufacturer_headquarters),
    consistent(s7, manufacturer_headquarters).

evidence(all_consistent(manufacturer_headquarters)).
query(true_val(manufacturer_headquarters, amsterdam_netherlands)).
query(true_val(manufacturer_headquarters, unk_manufacturer_headquarters)).

% @attr parent_company
% @type categorical
% @canonical false
% @original_name Parent company
% @values nidecker_group=Nidecker_Group_2018 unk_parent_company=Unknown
% @importance 0.55

0.85::acc(s8, parent_company).

0.82::true_val(parent_company, nidecker_group); 0.18::true_val(parent_company, unk_parent_company).

measured(s8, parent_company, nidecker_group).

all_consistent(parent_company) :- consistent(s8, parent_company).

evidence(all_consistent(parent_company)).
query(true_val(parent_company, nidecker_group)).
query(true_val(parent_company, unk_parent_company)).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values austria_capita=Austria_CAPiTA_Mothership asia_or_other=Asia_or_Saudi_Arabia
% @importance 0.57

0.78::acc(s9, manufacturing_location_current).
0.55::acc(s10, manufacturing_location_current).
0.60::acc(s11, manufacturing_location_current).

0.60::true_val(manufacturing_location_current, austria_capita); 0.40::true_val(manufacturing_location_current, asia_or_other).

measured(s9, manufacturing_location_current, austria_capita).
measured(s10, manufacturing_location_current, austria_capita).
measured(s11, manufacturing_location_current, asia_or_other).

all_consistent(manufacturing_location_current) :-
    consistent(s9, manufacturing_location_current),
    (indep(s10), consistent(s10, manufacturing_location_current) ; \+indep(s10)),
    consistent(s11, manufacturing_location_current).

evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, austria_capita)).
query(true_val(manufacturing_location_current, asia_or_other)).

% @attr manufacturing_location_prior
% @type categorical
% @canonical false
% @original_name manufacturing_location_prior
% @values complex_history=Elan_Austria_then_Asia_then_CAPiTA_then_China_then_Saudi unk_manufacturing_location_prior=Unknown
% @importance 0.55

0.65::acc(s11, manufacturing_location_prior).

0.55::true_val(manufacturing_location_prior, complex_history); 0.45::true_val(manufacturing_location_prior, unk_manufacturing_location_prior).

measured(s11, manufacturing_location_prior, complex_history).

all_consistent(manufacturing_location_prior) :- consistent(s11, manufacturing_location_prior).

evidence(all_consistent(manufacturing_location_prior)).
query(true_val(manufacturing_location_prior, complex_history)).
query(true_val(manufacturing_location_prior, unk_manufacturing_location_prior)).

% @attr design_studio
% @type categorical
% @canonical false
% @original_name Design studio
% @values low_pressure_amsterdam=Low_Pressure_Studio_Amsterdam unk_design_studio=Unknown
% @importance 0.50

0.82::acc(s7, design_studio).

0.75::true_val(design_studio, low_pressure_amsterdam); 0.25::true_val(design_studio, unk_design_studio).

measured(s7, design_studio, low_pressure_amsterdam).

all_consistent(design_studio) :- consistent(s7, design_studio).

evidence(all_consistent(design_studio)).
query(true_val(design_studio, low_pressure_amsterdam)).
query(true_val(design_studio, unk_design_studio)).

% @attr brand_reputation
% @type categorical
% @canonical false
% @original_name Brand reputation
% @values pioneer_3d_shaping=Pioneer_3D_shaping_20_years unk_brand_reputation=Unknown
% @importance 0.40

0.72::acc(s12, brand_reputation).

0.65::true_val(brand_reputation, pioneer_3d_shaping); 0.35::true_val(brand_reputation, unk_brand_reputation).

measured(s12, brand_reputation, pioneer_3d_shaping).

all_consistent(brand_reputation) :- consistent(s12, brand_reputation).

evidence(all_consistent(brand_reputation)).
query(true_val(brand_reputation, pioneer_3d_shaping)).
query(true_val(brand_reputation, unk_brand_reputation)).

% @attr brand_ethos
% @type categorical
% @canonical false
% @original_name Brand ethos
% @values smile_its_snowboarding=Smile_its_Snowboarding_rider_driven unk_brand_ethos=Unknown
% @importance 0.35

0.78::acc(s13, brand_ethos).

0.70::true_val(brand_ethos, smile_its_snowboarding); 0.30::true_val(brand_ethos, unk_brand_ethos).

measured(s13, brand_ethos, smile_its_snowboarding).

all_consistent(brand_ethos) :- consistent(s13, brand_ethos).

evidence(all_consistent(brand_ethos)).
query(true_val(brand_ethos, smile_its_snowboarding)).
query(true_val(brand_ethos, unk_brand_ethos)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2017_2018=2017_2018_season unk_model_first_available_year=Unknown
% @importance 0.45

0.70::acc(s14, model_first_available_year).
0.72::acc(s15, model_first_available_year).
0.65::acc(s16, model_first_available_year).

0.90::true_val(model_first_available_year, season_2017_2018); 0.10::true_val(model_first_available_year, unk_model_first_available_year).

measured(s14, model_first_available_year, season_2017_2018).
measured(s15, model_first_available_year, season_2017_2018).
measured(s16, model_first_available_year, season_2017_2018).

all_consistent(model_first_available_year) :-
    consistent(s14, model_first_available_year),
    consistent(s15, model_first_available_year),
    consistent(s16, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2017_2018)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr design_era_history
% @type categorical
% @canonical false
% @original_name Design era 2019-2023 vs 2025 redesign
% @values deep_swallowtail_then_redesign=2019_2023_swallowtail_then_2025_redesign unk_design_era_history=Unknown
% @importance 0.60

0.72::acc(s17, design_era_history).

0.60::true_val(design_era_history, deep_swallowtail_then_redesign); 0.40::true_val(design_era_history, unk_design_era_history).

measured(s17, design_era_history, deep_swallowtail_then_redesign).

all_consistent(design_era_history) :- consistent(s17, design_era_history).

evidence(all_consistent(design_era_history)).
query(true_val(design_era_history, deep_swallowtail_then_redesign)).
query(true_val(design_era_history, unk_design_era_history)).

% @attr redesign_year
% @type categorical
% @canonical true
% @original_name redesign_year
% @values season_2024_2025=2024_2025_updated_last_season unk_redesign_year=Unknown
% @importance 1.0

0.93::acc(s1, redesign_year).

0.92::true_val(redesign_year, season_2024_2025); 0.08::true_val(redesign_year, unk_redesign_year).

measured(s1, redesign_year, season_2024_2025).

all_consistent(redesign_year) :- consistent(s1, redesign_year).

evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, season_2024_2025)).
query(true_val(redesign_year, unk_redesign_year)).

% @attr model_update_2026
% @type categorical
% @canonical false
% @original_name 2026 model update
% @values powder_hull_see_through=Powder_Hull_see_through_appearance unk_model_update_2026=Unknown
% @importance 0.70

0.78::acc(s18, model_update_2026).

0.68::true_val(model_update_2026, powder_hull_see_through); 0.32::true_val(model_update_2026, unk_model_update_2026).

measured(s18, model_update_2026, powder_hull_see_through).

all_consistent(model_update_2026) :-
    (indep(s18), consistent(s18, model_update_2026) ; \+indep(s18)).

evidence(all_consistent(model_update_2026)).
query(true_val(model_update_2026, powder_hull_see_through)).
query(true_val(model_update_2026, unk_model_update_2026)).

% @attr surfer_mini_variant
% @type categorical
% @canonical false
% @original_name Surfer Mini variant
% @values youth_version_2026=Youth_version_exists_2026 unk_surfer_mini_variant=Unknown
% @importance 0.30

0.75::acc(s19, surfer_mini_variant).

0.68::true_val(surfer_mini_variant, youth_version_2026); 0.32::true_val(surfer_mini_variant, unk_surfer_mini_variant).

measured(s19, surfer_mini_variant, youth_version_2026).

all_consistent(surfer_mini_variant) :-
    (indep(s18), consistent(s19, surfer_mini_variant) ; \+indep(s18)).

evidence(all_consistent(surfer_mini_variant)).
query(true_val(surfer_mini_variant, youth_version_2026)).
query(true_val(surfer_mini_variant, unk_surfer_mini_variant)).

% @attr previous_ltd_variant
% @type categorical
% @canonical false
% @original_name Previous LTD variant
% @values ltd_150_units=LTD_upgraded_base_lighter_core_150_units unk_previous_ltd_variant=Unknown
% @importance 0.75

0.82::acc(s20, previous_ltd_variant).

0.72::true_val(previous_ltd_variant, ltd_150_units); 0.28::true_val(previous_ltd_variant, unk_previous_ltd_variant).

measured(s20, previous_ltd_variant, ltd_150_units).

all_consistent(previous_ltd_variant) :- consistent(s20, previous_ltd_variant).

evidence(all_consistent(previous_ltd_variant)).
query(true_val(previous_ltd_variant, ltd_150_units)).
query(true_val(previous_ltd_variant, unk_previous_ltd_variant)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @unit USD
% @original_name price_usd_msrp
% @values v1099_95=1099.95
% @importance 1.0

0.95::acc(s1, price_usd_msrp).

0.95::true_val(price_usd_msrp, v1099_95); 0.05::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s1, price_usd_msrp, v1099_95).

all_consistent(price_usd_msrp) :- consistent(s1, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v1099_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_usd_evo
% @type numeric
% @canonical true
% @unit USD
% @original_name price_usd_evo
% @values v769_96=769.96
% @importance 0.95

0.92::acc(s21, price_usd_evo).

0.92::true_val(price_usd_evo, v769_96); 0.08::true_val(price_usd_evo, unk_price_usd_evo).

measured(s21, price_usd_evo, v769_96).

all_consistent(price_usd_evo) :- consistent(s21, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v769_96)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_skipro
% @type numeric
% @canonical false
% @unit USD
% @original_name Price (USD, Ski Pro AZ)
% @values v879_95=879.95
% @importance 0.85

0.82::acc(s22, price_usd_skipro).

0.82::true_val(price_usd_skipro, v879_95); 0.18::true_val(price_usd_skipro, unk_price_usd_skipro).

measured(s22, price_usd_skipro, v879_95).

all_consistent(price_usd_skipro) :- consistent(s22, price_usd_skipro).

evidence(all_consistent(price_usd_skipro)).
query(true_val(price_usd_skipro, v879_95)).
query(true_val(price_usd_skipro, unk_price_usd_skipro)).

% @attr price_eur_montaz
% @type numeric
% @canonical false
% @unit EUR
% @original_name Price (EUR, Montaz.com)
% @values v699_99=699.99
% @importance 0.85

0.82::acc(s23, price_eur_montaz).

0.82::true_val(price_eur_montaz, v699_99); 0.18::true_val(price_eur_montaz, unk_price_eur_montaz).

measured(s23, price_eur_montaz, v699_99).

all_consistent(price_eur_montaz) :- consistent(s23, price_eur_montaz).

evidence(all_consistent(price_eur_montaz)).
query(true_val(price_eur_montaz, v699_99)).
query(true_val(price_eur_montaz, unk_price_eur_montaz)).

% @attr price_aud_merchant
% @type numeric
% @canonical true
% @unit AUD
% @original_name price_aud_merchant
% @values v1799_99=1799.99
% @importance 0.85

0.95::acc(s_merchant, price_aud_merchant).

0.95::true_val(price_aud_merchant, v1799_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s_merchant, price_aud_merchant, v1799_99).

all_consistent(price_aud_merchant) :- consistent(s_merchant, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v1799_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_usd_backcountry
% @type numeric
% @canonical true
% @unit USD
% @original_name price_usd_backcountry
% @values v1099_95=1099.95
% @importance 0.85

0.85::acc(s24, price_usd_backcountry).

0.82::true_val(price_usd_backcountry, v1099_95); 0.18::true_val(price_usd_backcountry, unk_price_usd_backcountry).

measured(s24, price_usd_backcountry, v1099_95).

all_consistent(price_usd_backcountry) :- consistent(s24, price_usd_backcountry).

evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v1099_95)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

% @attr user_review_forum_price_value
% @type categorical
% @canonical false
% @original_name user_review_forum (price/value sentiment)
% @values expensive_alternatives_exist=Expensive_alternatives_like_Stranda_Korua_Gentemstick unk_user_review_forum_price_value=Unknown
% @importance 0.80

0.70::acc(s25, user_review_forum_price_value).

0.55::true_val(user_review_forum_price_value, expensive_alternatives_exist); 0.45::true_val(user_review_forum_price_value, unk_user_review_forum_price_value).

measured(s25, user_review_forum_price_value, expensive_alternatives_exist).
measured(s21, user_review_forum_price_value, expensive_alternatives_exist).

all_consistent(user_review_forum_price_value) :-
    consistent(s25, user_review_forum_price_value),
    consistent(s21, user_review_forum_price_value).

evidence(all_consistent(user_review_forum_price_value)).
query(true_val(user_review_forum_price_value, expensive_alternatives_exist)).
query(true_val(user_review_forum_price_value, unk_user_review_forum_price_value)).

% @attr availability_status_bataleon
% @type categorical
% @canonical false
% @original_name availability_status (Bataleon US)
% @values all_sold_out=All_sizes_sold_out unk_availability_status_bataleon=Unknown
% @importance 1.0

0.95::acc(s1, availability_status_bataleon).

0.92::true_val(availability_status_bataleon, all_sold_out); 0.08::true_val(availability_status_bataleon, unk_availability_status_bataleon).

measured(s1, availability_status_bataleon, all_sold_out).

all_consistent(availability_status_bataleon) :- consistent(s1, availability_status_bataleon).

evidence(all_consistent(availability_status_bataleon)).
query(true_val(availability_status_bataleon, all_sold_out)).
query(true_val(availability_status_bataleon, unk_availability_status_bataleon)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status (evo)
% @values in_stock=In_stock unk_availability_status=Unknown
% @importance 0.90

0.88::acc(s21, availability_status).

0.88::true_val(availability_status, in_stock); 0.12::true_val(availability_status, unk_availability_status).

measured(s21, availability_status, in_stock).

all_consistent(availability_status) :- consistent(s21, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, in_stock)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_backcountry
% @type categorical
% @canonical false
% @original_name availability_status (Backcountry)
% @values listed=Listed unk_availability_status_backcountry=Unknown
% @importance 0.85

0.80::acc(s24, availability_status_backcountry).

0.78::true_val(availability_status_backcountry, listed); 0.22::true_val(availability_status_backcountry, unk_availability_status_backcountry).

measured(s24, availability_status_backcountry, listed).

all_consistent(availability_status_backcountry) :- consistent(s24, availability_status_backcountry).

evidence(all_consistent(availability_status_backcountry)).
query(true_val(availability_status_backcountry, listed)).
query(true_val(availability_status_backcountry, unk_availability_status_backcountry)).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status (Blauer Board Shop)
% @values available=Available unk_availability_status_blauer=Unknown
% @importance 0.70

0.72::acc(s18, availability_status_blauer).

0.68::true_val(availability_status_blauer, available); 0.32::true_val(availability_status_blauer, unk_availability_status_blauer).

measured(s18, availability_status_blauer, available).

all_consistent(availability_status_blauer) :-
    (indep(s18), consistent(s18, availability_status_blauer) ; \+indep(s18)).

evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, available)).
query(true_val(availability_status_blauer, unk_availability_status_blauer)).

% @attr availability_status_darkside
% @type categorical
% @canonical false
% @original_name availability_status (Darkside Snowboards)
% @values available_ships_intl=Available_ships_internationally unk_availability_status_darkside=Unknown
% @importance 0.60

0.70::acc(s26, availability_status_darkside).

0.62::true_val(availability_status_darkside, available_ships_intl); 0.38::true_val(availability_status_darkside, unk_availability_status_darkside).

measured(s26, availability_status_darkside, available_ships_intl).

all_consistent(availability_status_darkside) :-
    (indep(s26), consistent(s26, availability_status_darkside) ; \+indep(s26)).

evidence(all_consistent(availability_status_darkside)).
query(true_val(availability_status_darkside, available_ships_intl)).
query(true_val(availability_status_darkside, unk_availability_status_darkside)).

% @attr availability_status_skipro
% @type categorical
% @canonical false
% @original_name availability_status (SkiPro)
% @values partial_sold_out=Sizes_154_159_162_sold_out unk_availability_status_skipro=Unknown
% @importance 0.85

0.80::acc(s22, availability_status_skipro).

0.78::true_val(availability_status_skipro, partial_sold_out); 0.22::true_val(availability_status_skipro, unk_availability_status_skipro).

measured(s22, availability_status_skipro, partial_sold_out).

all_consistent(availability_status_skipro) :- consistent(s22, availability_status_skipro).

evidence(all_consistent(availability_status_skipro)).
query(true_val(availability_status_skipro, partial_sold_out)).
query(true_val(availability_status_skipro, unk_availability_status_skipro)).

% @attr availability_status_surfacesport
% @type categorical
% @canonical false
% @original_name availability_status (Surface Sport Depot)
% @values available=Available unk_availability_status_surfacesport=Unknown
% @importance 0.50

0.60::acc(s27, availability_status_surfacesport).

0.52::true_val(availability_status_surfacesport, available); 0.48::true_val(availability_status_surfacesport, unk_availability_status_surfacesport).

measured(s27, availability_status_surfacesport, available).

all_consistent(availability_status_surfacesport) :-
    (indep(s27), consistent(s27, availability_status_surfacesport) ; \+indep(s27)).

evidence(all_consistent(availability_status_surfacesport)).
query(true_val(availability_status_surfacesport, available)).
query(true_val(availability_status_surfacesport, unk_availability_status_surfacesport)).

% @attr availability_status_solnix
% @type categorical
% @canonical false
% @original_name availability_status (SOLNIX)
% @values listed=Listed unk_availability_status_solnix=Unknown
% @importance 0.45

0.58::acc(s28, availability_status_solnix).

0.50::true_val(availability_status_solnix, listed); 0.50::true_val(availability_status_solnix, unk_availability_status_solnix).

measured(s28, availability_status_solnix, listed).

all_consistent(availability_status_solnix) :-
    (indep(s28), consistent(s28, availability_status_solnix) ; \+indep(s28)).

evidence(all_consistent(availability_status_solnix)).
query(true_val(availability_status_solnix, listed)).
query(true_val(availability_status_solnix, unk_availability_status_solnix)).

% @attr availability_status_montaz
% @type categorical
% @canonical false
% @original_name availability_status (Montaz)
% @values available_162=162cm_available_at_699_99_EUR unk_availability_status_montaz=Unknown
% @importance 0.85

0.80::acc(s23, availability_status_montaz).

0.78::true_val(availability_status_montaz, available_162); 0.22::true_val(availability_status_montaz, unk_availability_status_montaz).

measured(s23, availability_status_montaz, available_162).

all_consistent(availability_status_montaz) :- consistent(s23, availability_status_montaz).

evidence(all_consistent(availability_status_montaz)).
query(true_val(availability_status_montaz, available_162)).
query(true_val(availability_status_montaz, unk_availability_status_montaz)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values two_plus_one_year=2_plus_1_year_warranty unk_warranty=Unknown
% @importance 1.0

0.95::acc(s1, warranty).

0.92::true_val(warranty, two_plus_one_year); 0.08::true_val(warranty, unk_warranty).

measured(s1, warranty, two_plus_one_year).

all_consistent(warranty) :- consistent(s1, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, two_plus_one_year)).
query(true_val(warranty, unk_warranty)).

% @attr return_policy_terms
% @type categorical
% @canonical true
% @original_name return_policy_terms (Bataleon direct)
% @values days_45=45_day_returns unk_return_policy_terms=Unknown
% @importance 1.0

0.93::acc(s1, return_policy_terms).

0.92::true_val(return_policy_terms, days_45); 0.08::true_val(return_policy_terms, unk_return_policy_terms).

measured(s1, return_policy_terms, days_45).

all_consistent(return_policy_terms) :- consistent(s1, return_policy_terms).

evidence(all_consistent(return_policy_terms)).
query(true_val(return_policy_terms, days_45)).
query(true_val(return_policy_terms, unk_return_policy_terms)).

% @attr return_policy_terms_evo
% @type categorical
% @canonical false
% @original_name return_policy_terms (evo)
% @values one_year=Up_to_full_year_return unk_return_policy_terms_evo=Unknown
% @importance 0.65

0.90::acc(s29, return_policy_terms_evo).

0.88::true_val(return_policy_terms_evo, one_year); 0.12::true_val(return_policy_terms_evo, unk_return_policy_terms_evo).

measured(s29, return_policy_terms_evo, one_year).

all_consistent(return_policy_terms_evo) :- consistent(s29, return_policy_terms_evo).

evidence(all_consistent(return_policy_terms_evo)).
query(true_val(return_policy_terms_evo, one_year)).
query(true_val(return_policy_terms_evo, unk_return_policy_terms_evo)).

% @attr return_policy_terms_darkside
% @type categorical
% @canonical false
% @original_name return_policy_terms (Darkside)
% @values days_14_unused=14_day_return_unused_only unk_return_policy_terms_darkside=Unknown
% @importance 0.60

0.75::acc(s26, return_policy_terms_darkside).

0.65::true_val(return_policy_terms_darkside, days_14_unused); 0.35::true_val(return_policy_terms_darkside, unk_return_policy_terms_darkside).

measured(s26, return_policy_terms_darkside, days_14_unused).

all_consistent(return_policy_terms_darkside) :- consistent(s26, return_policy_terms_darkside).

evidence(all_consistent(return_policy_terms_darkside)).
query(true_val(return_policy_terms_darkside, days_14_unused)).
query(true_val(return_policy_terms_darkside, unk_return_policy_terms_darkside)).

% @attr shipping_bataleon_us
% @type categorical
% @canonical false
% @original_name Shipping (Bataleon US)
% @values free_over_50=Free_shipping_over_50_USD unk_shipping_bataleon_us=Unknown
% @importance 1.0

0.93::acc(s1, shipping_bataleon_us).

0.92::true_val(shipping_bataleon_us, free_over_50); 0.08::true_val(shipping_bataleon_us, unk_shipping_bataleon_us).

measured(s1, shipping_bataleon_us, free_over_50).

all_consistent(shipping_bataleon_us) :- consistent(s1, shipping_bataleon_us).

evidence(all_consistent(shipping_bataleon_us)).
query(true_val(shipping_bataleon_us, free_over_50)).
query(true_val(shipping_bataleon_us, unk_shipping_bataleon_us)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values four_sizes=149_154_159_162cm unk_available_sizes=Unknown
% @importance 1.0

0.95::acc(s1, available_sizes).

0.95::true_val(available_sizes, four_sizes); 0.05::true_val(available_sizes, unk_available_sizes).

measured(s1, available_sizes, four_sizes).

all_consistent(available_sizes) :- consistent(s1, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, four_sizes)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr effective_edge_149
% @type numeric
% @canonical false
% @unit cm
% @original_name Effective edge — 149cm
% @values v119_1=119.1
% @importance 1.0

0.95::acc(s1, effective_edge_149).

0.92::true_val(effective_edge_149, v119_1); 0.08::true_val(effective_edge_149, unk_effective_edge_149).

measured(s1, effective_edge_149, v119_1).

all_consistent(effective_edge_149) :- consistent(s1, effective_edge_149).

evidence(all_consistent(effective_edge_149)).
query(true_val(effective_edge_149, v119_1)).
query(true_val(effective_edge_149, unk_effective_edge_149)).

% @attr effective_edge_154
% @type numeric
% @canonical false
% @unit cm
% @original_name Effective edge — 154cm
% @values v123_3=123.3
% @importance 1.0

0.95::acc(s1, effective_edge_154).

0.92::true_val(effective_edge_154, v123_3); 0.08::true_val(effective_edge_154, unk_effective_edge_154).

measured(s1, effective_edge_154, v123_3).

all_consistent(effective_edge_154) :- consistent(s1, effective_edge_154).

evidence(all_consistent(effective_edge_154)).
query(true_val(effective_edge_154, v123_3)).
query(true_val(effective_edge_154, unk_effective_edge_154)).

% @attr effective_edge_159
% @type numeric
% @canonical false
% @unit cm
% @original_name Effective edge — 159cm
% @values v127_6=127.6
% @importance 1.0

0.95::acc(s1, effective_edge_159).

0.92::true_val(effective_edge_159, v127_6); 0.08::true_val(effective_edge_159, unk_effective_edge_159).

measured(s1, effective_edge_159, v127_6).

all_consistent(effective_edge_159) :- consistent(s1, effective_edge_159).

evidence(all_consistent(effective_edge_159)).
query(true_val(effective_edge_159, v127_6)).
query(true_val(effective_edge_159, unk_effective_edge_159)).

% @attr effective_edge_162
% @type numeric
% @canonical false
% @unit cm
% @original_name Effective edge — 162cm
% @values v130_1=130.1
% @importance 1.0

0.95::acc(s1, effective_edge_162).

0.92::true_val(effective_edge_162, v130_1); 0.08::true_val(effective_edge_162, unk_effective_edge_162).

measured(s1, effective_edge_162, v130_1).

all_consistent(effective_edge_162) :- consistent(s1, effective_edge_162).

evidence(all_consistent(effective_edge_162)).
query(true_val(effective_edge_162, v130_1)).
query(true_val(effective_edge_162, unk_effective_edge_162)).

% @attr waist_width_149
% @type numeric
% @canonical false
% @unit cm
% @original_name Waist width — 149cm
% @values v25_4=25.4
% @importance 1.0

0.95::acc(s1, waist_width_149).

0.92::true_val(waist_width_149, v25_4); 0.08::true_val(waist_width_149, unk_waist_width_149).

measured(s1, waist_width_149, v25_4).

all_consistent(waist_width_149) :- consistent(s1, waist_width_149).

evidence(all_consistent(waist_width_149)).
query(true_val(waist_width_149, v25_4)).
query(true_val(waist_width_149, unk_waist_width_149)).

% @attr waist_width_154
% @type numeric
% @canonical false
% @unit cm
% @original_name Waist width — 154cm
% @values v25_9=25.9
% @importance 1.0

0.95::acc(s1, waist_width_154).

0.92::true_val(waist_width_154, v25_9); 0.08::true_val(waist_width_154, unk_waist_width_154).

measured(s1, waist_width_154, v25_9).

all_consistent(waist_width_154) :- consistent(s1, waist_width_154).

evidence(all_consistent(waist_width_154)).
query(true_val(waist_width_154, v25_9)).
query(true_val(waist_width_154, unk_waist_width_154)).

% @attr waist_width_159
% @type numeric
% @canonical false
% @unit cm
% @original_name Waist width — 159cm
% @values v26_4=26.4
% @importance 1.0

0.95::acc(s1, waist_width_159).

0.92::true_val(waist_width_159, v26_4); 0.08::true_val(waist_width_159, unk_waist_width_159).

measured(s1, waist_width_159, v26_4).

all_consistent(waist_width_159) :- consistent(s1, waist_width_159).

evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v26_4)).
query(true_val(waist_width_159, unk_waist_width_159)).

% @attr waist_width_162
% @type numeric
% @canonical false
% @unit cm
% @original_name Waist width — 162cm
% @values v26_7=26.7
% @importance 1.0

0.95::acc(s1, waist_width_162).

0.92::true_val(waist_width_162, v26_7); 0.08::true_val(waist_width_162, unk_waist_width_162).

measured(s1, waist_width_162, v26_7).

all_consistent(waist_width_162) :- consistent(s1, waist_width_162).

evidence(all_consistent(waist_width_162)).
query(true_val(waist_width_162, v26_7)).
query(true_val(waist_width_162, unk_waist_width_162)).

% @attr tip_tail_width_size_149
% @type categorical
% @canonical false
% @unit cm
% @original_name tip_tail_width_size (149cm)
% @values v31_4_28_4=31.4_28.4cm
% @importance 1.0

0.95::acc(s1, tip_tail_width_size_149).

0.92::true_val(tip_tail_width_size_149, v31_4_28_4); 0.08::true_val(tip_tail_width_size_149, unk_tip_tail_width_size_149).

measured(s1, tip_tail_width_size_149, v31_4_28_4).

all_consistent(tip_tail_width_size_149) :- consistent(s1, tip_tail_width_size_149).

evidence(all_consistent(tip_tail_width_size_149)).
query(true_val(tip_tail_width_size_149, v31_4_28_4)).
query(true_val(tip_tail_width_size_149, unk_tip_tail_width_size_149)).

% @attr tip_tail_width_size
% @type categorical
% @canonical true
% @unit cm
% @original_name tip_tail_width_size (154cm)
% @values v32_2_29_1=32.2_29.1cm
% @importance 1.0

0.95::acc(s1, tip_tail_width_size).

0.92::true_val(tip_tail_width_size, v32_2_29_1); 0.08::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s1, tip_tail_width_size, v32_2_29_1).

all_consistent(tip_tail_width_size) :- consistent(s1, tip_tail_width_size).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v32_2_29_1)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr tip_tail_width_size_159
% @type categorical
% @canonical false
% @unit cm
% @original_name tip_tail_width_size (159cm)
% @values v32_9_29_8=32.9_29.8cm
% @importance 1.0

0.95::acc(s1, tip_tail_width_size_159).

0.92::true_val(tip_tail_width_size_159, v32_9_29_8); 0.08::true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159).

measured(s1, tip_tail_width_size_159, v32_9_29_8).

all_consistent(tip_tail_width_size_159) :- consistent(s1, tip_tail_width_size_159).

evidence(all_consistent(tip_tail_width_size_159)).
query(true_val(tip_tail_width_size_159, v32_9_29_8)).
query(true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159)).

% @attr tip_tail_width_size_162
% @type categorical
% @canonical false
% @unit cm
% @original_name tip_tail_width_size (162cm)
% @values v33_4_30_3=33.4_30.3cm
% @importance 1.0

0.95::acc(s1, tip_tail_width_size_162).

0.92::true_val(tip_tail_width_size_162, v33_4_30_3); 0.08::true_val(tip_tail_width_size_162, unk_tip_tail_width_size_162).

measured(s1, tip_tail_width_size_162, v33_4_30_3).

all_consistent(tip_tail_width_size_162) :- consistent(s1, tip_tail_width_size_162).

evidence(all_consistent(tip_tail_width_size_162)).
query(true_val(tip_tail_width_size_162, v33_4_30_3)).
query(true_val(tip_tail_width_size_162, unk_tip_tail_width_size_162)).

% @attr sidecut_radius_size_149
% @type numeric
% @canonical false
% @unit m
% @original_name sidecut_radius_size (149cm)
% @values v7_58=7.58
% @importance 1.0

0.95::acc(s1, sidecut_radius_size_149).

0.92::true_val(sidecut_radius_size_149, v7_58); 0.08::true_val(sidecut_radius_size_149, unk_sidecut_radius_size_149).

measured(s1, sidecut_radius_size_149, v7_58).

all_consistent(sidecut_radius_size_149) :- consistent(s1, sidecut_radius_size_149).

evidence(all_consistent(sidecut_radius_size_149)).
query(true_val(sidecut_radius_size_149, v7_58)).
query(true_val(sidecut_radius_size_149, unk_sidecut_radius_size_149)).

% @attr sidecut_radius_size
% @type numeric
% @canonical true
% @unit m
% @original_name sidecut_radius_size (154cm)
% @values v7_74=7.74
% @importance 1.0

0.95::acc(s1, sidecut_radius_size).

0.92::true_val(sidecut_radius_size, v7_74); 0.08::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s1, sidecut_radius_size, v7_74).

all_consistent(sidecut_radius_size) :- consistent(s1, sidecut_radius_size).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_74)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr sidecut_radius_size_159
% @type numeric
% @canonical false
% @unit m
% @original_name sidecut_radius_size (159cm)
% @values v7_89=7.89
% @importance 1.0

0.95::acc(s1, sidecut_radius_size_159).

0.92::true_val(sidecut_radius_size_159, v7_89); 0.08::true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159).

measured(s1, sidecut_radius_size_159, v7_89).

all_consistent(sidecut_radius_size_159) :- consistent(s1, sidecut_radius_size_159).

evidence(all_consistent(sidecut_radius_size_159)).
query(true_val(sidecut_radius_size_159, v7_89)).
query(true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159)).

% @attr sidecut_radius_size_162
% @type numeric
% @canonical false
% @unit m
% @original_name sidecut_radius_size (162cm)
% @values v7_98=7.98
% @importance 1.0

0.95::acc(s1, sidecut_radius_size_162).

0.92::true_val(sidecut_radius_size_162, v7_98); 0.08::true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162).

measured(s1, sidecut_radius_size_162, v7_98).

all_consistent(sidecut_radius_size_162) :- consistent(s1, sidecut_radius_size_162).

evidence(all_consistent(sidecut_radius_size_162)).
query(true_val(sidecut_radius_size_162, v7_98)).
query(true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162)).

% @attr stance_width_range_size_149
% @type categorical
% @canonical false
% @unit cm
% @original_name stance_width_range_size (149cm)
% @values v46_0_58_0=46.0_to_58.0cm
% @importance 1.0

0.95::acc(s1, stance_width_range_size_149).

0.92::true_val(stance_width_range_size_149, v46_0_58_0); 0.08::true_val(stance_width_range_size_149, unk_stance_width_range_size_149).

measured(s1, stance_width_range_size_149, v46_0_58_0).

all_consistent(stance_width_range_size_149) :- consistent(s1, stance_width_range_size_149).

evidence(all_consistent(stance_width_range_size_149)).
query(true_val(stance_width_range_size_149, v46_0_58_0)).
query(true_val(stance_width_range_size_149, unk_stance_width_range_size_149)).

% @attr stance_width_range_size
% @type categorical
% @canonical true
% @unit cm
% @original_name stance_width_range_size (154cm)
% @values v49_0_61_0=49.0_to_61.0cm
% @importance 1.0

0.95::acc(s1, stance_width_range_size).

0.92::true_val(stance_width_range_size, v49_0_61_0); 0.08::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s1, stance_width_range_size, v49_0_61_0).

all_consistent(stance_width_range_size) :- consistent(s1, stance_width_range_size).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v49_0_61_0)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr stance_width_range_size_159
% @type categorical
% @canonical false
% @unit cm
% @original_name stance_width_range_size (159cm)
% @values v52_0_64_0=52.0_to_64.0cm
% @importance 1.0

0.95::acc(s1, stance_width_range_size_159).

0.92::true_val(stance_width_range_size_159, v52_0_64_0); 0.08::true_val(stance_width_range_size_159, unk_stance_width_range_size_159).

measured(s1, stance_width_range_size_159, v52_0_64_0).

all_consistent(stance_width_range_size_159) :- consistent(s1, stance_width_range_size_159).

evidence(all_consistent(stance_width_range_size_159)).
query(true_val(stance_width_range_size_159, v52_0_64_0)).
query(true_val(stance_width_range_size_159, unk_stance_width_range_size_159)).

% @attr stance_width_range_size_162
% @type categorical
% @canonical false
% @unit cm
% @original_name stance_width_range_size (162cm)
% @values v53_0_65_0=53.0_to_65.0cm
% @importance 1.0

0.95::acc(s1, stance_width_range_size_162).

0.92::true_val(stance_width_range_size_162, v53_0_65_0); 0.08::true_val(stance_width_range_size_162, unk_stance_width_range_size_162).

measured(s1, stance_width_range_size_162, v53_0_65_0).

all_consistent(stance_width_range_size_162) :- consistent(s1, stance_width_range_size_162).

evidence(all_consistent(stance_width_range_size_162)).
query(true_val(stance_width_range_size_162, v53_0_65_0)).
query(true_val(stance_width_range_size_162, unk_stance_width_range_size_162)).

% @attr recommended_weight_range_size_149
% @type categorical
% @canonical false
% @unit kg
% @original_name recommended_weight_range_size (149cm)
% @values v56_76=56_to_76kg
% @importance 1.0

0.95::acc(s1, recommended_weight_range_size_149).

0.92::true_val(recommended_weight_range_size_149, v56_76); 0.08::true_val(recommended_weight_range_size_149, unk_recommended_weight_range_size_149).

measured(s1, recommended_weight_range_size_149, v56_76).

all_consistent(recommended_weight_range_size_149) :- consistent(s1, recommended_weight_range_size_149).

evidence(all_consistent(recommended_weight_range_size_149)).
query(true_val(recommended_weight_range_size_149, v56_76)).
query(true_val(recommended_weight_range_size_149, unk_recommended_weight_range_size_149)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @unit kg
% @original_name recommended_weight_range_size (154cm)
% @values v67_87=67_to_87kg
% @importance 1.0

0.95::acc(s1, recommended_weight_range_size).

0.92::true_val(recommended_weight_range_size, v67_87); 0.08::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s1, recommended_weight_range_size, v67_87).

all_consistent(recommended_weight_range_size) :- consistent(s1, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, v67_87)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr recommended_weight_range_size_159
% @type categorical
% @canonical false
% @unit kg
% @original_name recommended_weight_range_size (159cm)
% @values v77_97=77_to_97kg
% @importance 1.0

0.95::acc(s1, recommended_weight_range_size_159).

0.92::true_val(recommended_weight_range_size_159, v77_97); 0.08::true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159).

measured(s1, recommended_weight_range_size_159, v77_97).

all_consistent(recommended_weight_range_size_159) :- consistent(s1, recommended_weight_range_size_159).

evidence(all_consistent(recommended_weight_range_size_159)).
query(true_val(recommended_weight_range_size_159, v77_97)).
query(true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159)).

% @attr recommended_weight_range_size_162
% @type categorical
% @canonical false
% @unit kg
% @original_name recommended_weight_range_size (162cm)
% @values v85_105=85_to_105kg
% @importance 1.0

0.95::acc(s1, recommended_weight_range_size_162).

0.92::true_val(recommended_weight_range_size_162, v85_105); 0.08::true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162).

measured(s1, recommended_weight_range_size_162, v85_105).

all_consistent(recommended_weight_range_size_162) :- consistent(s1, recommended_weight_range_size_162).

evidence(all_consistent(recommended_weight_range_size_162)).
query(true_val(recommended_weight_range_size_162, v85_105)).
query(true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162)).

% @attr boot_size_149
% @type categorical
% @canonical false
% @original_name Boot size — 149cm
% @values eu38_42=EU_38_42_US_5_9
% @importance 1.0

0.95::acc(s1, boot_size_149).

0.92::true_val(boot_size_149, eu38_42); 0.08::true_val(boot_size_149, unk_boot_size_149).

measured(s1, boot_size_149, eu38_42).

all_consistent(boot_size_149) :- consistent(s1, boot_size_149).

evidence(all_consistent(boot_size_149)).
query(true_val(boot_size_149, eu38_42)).
query(true_val(boot_size_149, unk_boot_size_149)).

% @attr boot_size_154
% @type categorical
% @canonical false
% @original_name Boot size — 154cm
% @values eu39_44=EU_39_44_US_7_10
% @importance 1.0

0.95::acc(s1, boot_size_154).

0.92::true_val(boot_size_154, eu39_44); 0.08::true_val(boot_size_154, unk_boot_size_154).

measured(s1, boot_size_154, eu39_44).

all_consistent(boot_size_154) :- consistent(s1, boot_size_154).

evidence(all_consistent(boot_size_154)).
query(true_val(boot_size_154, eu39_44)).
query(true_val(boot_size_154, unk_boot_size_154)).

% @attr boot_size_159
% @type categorical
% @canonical false
% @original_name Boot size — 159cm
% @values eu42_46=EU_42_46_US_8_12
% @importance 1.0

0.95::acc(s1, boot_size_159).

0.92::true_val(boot_size_159, eu42_46); 0.08::true_val(boot_size_159, unk_boot_size_159).

measured(s1, boot_size_159, eu42_46).

all_consistent(boot_size_159) :- consistent(s1, boot_size_159).

evidence(all_consistent(boot_size_159)).
query(true_val(boot_size_159, eu42_46)).
query(true_val(boot_size_159, unk_boot_size_159)).

% @attr boot_size_162
% @type categorical
% @canonical false
% @original_name Boot size — 162cm
% @values eu42_47=EU_42_47_US_9_12
% @importance 1.0

0.95::acc(s1, boot_size_162).

0.92::true_val(boot_size_162, eu42_47); 0.08::true_val(boot_size_162, unk_boot_size_162).

measured(s1, boot_size_162, eu42_47).

all_consistent(boot_size_162) :- consistent(s1, boot_size_162).

evidence(all_consistent(boot_size_162)).
query(true_val(boot_size_162, eu42_47)).
query(true_val(boot_size_162, unk_boot_size_162)).

% @attr inserts_per_size
% @type numeric
% @canonical false
% @original_name Inserts per size
% @values v24=24
% @importance 1.0

0.95::acc(s1, inserts_per_size).

0.92::true_val(inserts_per_size, v24); 0.08::true_val(inserts_per_size, unk_inserts_per_size).

measured(s1, inserts_per_size, v24).

all_consistent(inserts_per_size) :- consistent(s1, inserts_per_size).

evidence(all_consistent(inserts_per_size)).
query(true_val(inserts_per_size, v24)).
query(true_val(inserts_per_size, unk_inserts_per_size)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_inserts unk_mounting_pattern=Unknown
% @importance 0.85

0.90::acc(s_merchant, mounting_pattern).

0.90::true_val(mounting_pattern, inserts_2x4); 0.10::true_val(mounting_pattern, unk_mounting_pattern).

measured(s_merchant, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :-
    (indep(s_merchant), consistent(s_merchant, mounting_pattern) ; \+indep(s_merchant)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr insert_material
% @type categorical
% @canonical false
% @original_name Insert material
% @values a_grade_german_stainless=A_grade_German_stainless_steel unk_insert_material=Unknown
% @importance 1.0

0.93::acc(s1, insert_material).

0.92::true_val(insert_material, a_grade_german_stainless); 0.08::true_val(insert_material, unk_insert_material).

measured(s1, insert_material, a_grade_german_stainless).

all_consistent(insert_material) :- consistent(s1, insert_material).

evidence(all_consistent(insert_material)).
query(true_val(insert_material, a_grade_german_stainless)).
query(true_val(insert_material, unk_insert_material)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 0.93

0.95::acc(s1, shape).
0.88::acc(s_merchant, shape).

0.95::true_val(shape, tapered_directional); 0.05::true_val(shape, unk_shape).

measured(s1, shape, tapered_directional).
measured(s_merchant, shape, tapered_directional).

all_consistent(shape) :-
    consistent(s1, shape),
    (indep(s_merchant), consistent(s_merchant, shape) ; \+indep(s_merchant)).

evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

% @attr tail_design
% @type categorical
% @canonical false
% @original_name Tail design
% @values powder_hull=Powder_Hull_snow_exhaust_effect unk_tail_design=Unknown
% @importance 1.0

0.93::acc(s1, tail_design).

0.92::true_val(tail_design, powder_hull); 0.08::true_val(tail_design, unk_tail_design).

measured(s1, tail_design, powder_hull).

all_consistent(tail_design) :- consistent(s1, tail_design).

evidence(all_consistent(tail_design)).
query(true_val(tail_design, powder_hull)).
query(true_val(tail_design, unk_tail_design)).

% @attr nose_design
% @type categorical
% @canonical false
% @original_name Nose design
% @values wide_hull_nose=Wide_hull_like_nose_for_powder_lift unk_nose_design=Unknown
% @importance 1.0

0.93::acc(s1, nose_design).

0.92::true_val(nose_design, wide_hull_nose); 0.08::true_val(nose_design, unk_nose_design).

measured(s1, nose_design, wide_hull_nose).

all_consistent(nose_design) :- consistent(s1, nose_design).

evidence(all_consistent(nose_design)).
query(true_val(nose_design, wide_hull_nose)).
query(true_val(nose_design, unk_nose_design)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values low_camber=Low_Camber medium_camber=Medium_Camber
% @importance 0.90

0.94::acc(s1, camber_type).
0.70::acc(s18, camber_type).
0.78::acc(s_merchant, camber_type).

0.55::true_val(camber_type, low_camber); 0.45::true_val(camber_type, medium_camber).

measured(s1, camber_type, low_camber).
measured(s18, camber_type, medium_camber).
measured(s_merchant, camber_type, medium_camber).

all_consistent(camber_type) :-
    consistent(s1, camber_type),
    (indep(s18), consistent(s18, camber_type) ; \+indep(s18)),
    (indep(s_merchant), consistent(s_merchant, camber_type) ; \+indep(s_merchant)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, low_camber)).
query(true_val(camber_type, medium_camber)).

% @attr three_d_shape
% @type categorical
% @canonical false
% @original_name 3D shape
% @values tbt_with_sidekick=3BT_Triple_Base_Technology_with_SideKick unk_three_d_shape=Unknown
% @importance 1.0

0.95::acc(s1, three_d_shape).

0.92::true_val(three_d_shape, tbt_with_sidekick); 0.08::true_val(three_d_shape, unk_three_d_shape).

measured(s1, three_d_shape, tbt_with_sidekick).

all_consistent(three_d_shape) :- consistent(s1, three_d_shape).

evidence(all_consistent(three_d_shape)).
query(true_val(three_d_shape, tbt_with_sidekick)).
query(true_val(three_d_shape, unk_three_d_shape)).

% @attr nose_sidebase_uplift
% @type categorical
% @canonical false
% @original_name Nose sidebase uplift
% @values high=High unk_nose_sidebase_uplift=Unknown
% @importance 1.0

0.95::acc(s1, nose_sidebase_uplift).

0.92::true_val(nose_sidebase_uplift, high); 0.08::true_val(nose_sidebase_uplift, unk_nose_sidebase_uplift).

measured(s1, nose_sidebase_uplift, high).

all_consistent(nose_sidebase_uplift) :- consistent(s1, nose_sidebase_uplift).

evidence(all_consistent(nose_sidebase_uplift)).
query(true_val(nose_sidebase_uplift, high)).
query(true_val(nose_sidebase_uplift, unk_nose_sidebase_uplift)).

% @attr tail_sidebase_uplift
% @type categorical
% @canonical false
% @original_name Tail sidebase uplift
% @values low=Low unk_tail_sidebase_uplift=Unknown
% @importance 1.0

0.95::acc(s1, tail_sidebase_uplift).

0.92::true_val(tail_sidebase_uplift, low); 0.08::true_val(tail_sidebase_uplift, unk_tail_sidebase_uplift).

measured(s1, tail_sidebase_uplift, low).

all_consistent(tail_sidebase_uplift) :- consistent(s1, tail_sidebase_uplift).

evidence(all_consistent(tail_sidebase_uplift)).
query(true_val(tail_sidebase_uplift, low)).
query(true_val(tail_sidebase_uplift, unk_tail_sidebase_uplift)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @unit /10
% @original_name flex_rating_10
% @values v4=4.0 unk_flex_rating_10=Unknown
% @importance 0.93

0.95::acc(s1, flex_rating_10).
0.88::acc(s_merchant, flex_rating_10).

0.95::true_val(flex_rating_10, v4); 0.05::true_val(flex_rating_10, unk_flex_rating_10).

measured(s1, flex_rating_10, v4).
measured(s_merchant, flex_rating_10, v4).

all_consistent(flex_rating_10) :-
    consistent(s1, flex_rating_10),
    (indep(s_merchant), consistent(s_merchant, flex_rating_10) ; \+indep(s_merchant)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v4)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

% @attr taper
% @type categorical
% @canonical true
% @original_name taper
% @values tapered_directional_28mm=Tapered_directional_28mm_historical unk_taper=Unknown
% @importance 0.78

0.85::acc(s_merchant, taper).
0.68::acc(s30, taper).

0.90::true_val(taper, tapered_directional_28mm); 0.10::true_val(taper, unk_taper).

measured(s_merchant, taper, tapered_directional_28mm).
measured(s30, taper, tapered_directional_28mm).

all_consistent(taper) :-
    (indep(s_merchant), consistent(s_merchant, taper) ; \+indep(s_merchant)),
    consistent(s30, taper).

evidence(all_consistent(taper)).
query(true_val(taper, tapered_directional_28mm)).
query(true_val(taper, unk_taper)).

% @attr setback
% @type categorical
% @canonical true
% @original_name setback
% @values yes_setback=Yes_binding_inserts_shifted_back unk_setback=Unknown
% @importance 0.80

0.85::acc(s31, setback).

0.82::true_val(setback, yes_setback); 0.18::true_val(setback, unk_setback).

measured(s31, setback, yes_setback).

all_consistent(setback) :-
    (indep(s31), consistent(s31, setback) ; \+indep(s31)).

evidence(all_consistent(setback)).
query(true_val(setback, yes_setback)).
query(true_val(setback, unk_setback)).

% @attr core_material_blend_ratio
% @type categorical
% @canonical true
% @original_name core_material_blend_ratio
% @values ratio_80_20=80_20_Paulownia_Poplar ratio_67_33=67_33_Paulownia_Poplar
% @importance 0.90

0.95::acc(s1, core_material_blend_ratio).
0.82::acc(s20, core_material_blend_ratio).
0.70::acc(s_merchant, core_material_blend_ratio).

0.65::true_val(core_material_blend_ratio, ratio_80_20); 0.35::true_val(core_material_blend_ratio, ratio_67_33).

measured(s1, core_material_blend_ratio, ratio_80_20).
measured(s20, core_material_blend_ratio, ratio_80_20).
measured(s_merchant, core_material_blend_ratio, ratio_67_33).

all_consistent(core_material_blend_ratio) :-
    consistent(s1, core_material_blend_ratio),
    consistent(s20, core_material_blend_ratio),
    (indep(s_merchant), consistent(s_merchant, core_material_blend_ratio) ; \+indep(s_merchant)).

evidence(all_consistent(core_material_blend_ratio)).
query(true_val(core_material_blend_ratio, ratio_80_20)).
query(true_val(core_material_blend_ratio, ratio_67_33)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values paulownia_poplar=Paulownia_and_Poplar unk_core_material=Unknown
% @importance 1.0

0.95::acc(s1, core_material).

0.92::true_val(core_material, paulownia_poplar); 0.08::true_val(core_material, unk_core_material).

measured(s1, core_material, paulownia_poplar).

all_consistent(core_material) :- consistent(s1, core_material).

evidence(all_consistent(core_material)).
query(true_val(core_material, paulownia_poplar)).
query(true_val(core_material, unk_core_material)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation (AirRide)
% @values airride_dampening=AirRide_core_additive_vibration_dampening unk_construction_material_innovation=Unknown
% @importance 0.73

0.85::acc(s31, construction_material_innovation).
0.85::acc(s32, construction_material_innovation).

0.95::true_val(construction_material_innovation, airride_dampening); 0.05::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s31, construction_material_innovation, airride_dampening).
measured(s32, construction_material_innovation, airride_dampening).

all_consistent(construction_material_innovation) :-
    (indep(s31), consistent(s31, construction_material_innovation) ; \+indep(s31)),
    (indep(s32), consistent(s32, construction_material_innovation) ; \+indep(s32)).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, airride_dampening)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values tri_axial=Tri_Axial_Laminate unk_laminate=Unknown
% @importance 0.93

0.95::acc(s1, laminate).
0.88::acc(s_merchant, laminate).

0.95::true_val(laminate, tri_axial); 0.05::true_val(laminate, unk_laminate).

measured(s1, laminate, tri_axial).
measured(s_merchant, laminate, tri_axial).

all_consistent(laminate) :-
    consistent(s1, laminate),
    (indep(s_merchant), consistent(s_merchant, laminate) ; \+indep(s_merchant)).

evidence(all_consistent(laminate)).
query(true_val(laminate, tri_axial)).
query(true_val(laminate, unk_laminate)).

% @attr construction_material_innovation_carbon_stringers
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Carbon Stringers)
% @values precured_carbon_stringers=Precured_carbon_stringers_livelier_rebound unk_cmi_carbon_stringers=Unknown
% @importance 0.73

0.85::acc(s31, construction_material_innovation_carbon_stringers).
0.85::acc(s33, construction_material_innovation_carbon_stringers).
0.85::acc(s_merchant, construction_material_innovation_carbon_stringers).

0.95::true_val(construction_material_innovation_carbon_stringers, precured_carbon_stringers); 0.05::true_val(construction_material_innovation_carbon_stringers, unk_cmi_carbon_stringers).

measured(s31, construction_material_innovation_carbon_stringers, precured_carbon_stringers).
measured(s33, construction_material_innovation_carbon_stringers, precured_carbon_stringers).
measured(s_merchant, construction_material_innovation_carbon_stringers, precured_carbon_stringers).

all_consistent(construction_material_innovation_carbon_stringers) :-
    (indep(s31), consistent(s31, construction_material_innovation_carbon_stringers) ; \+indep(s31)),
    (indep(s33), consistent(s33, construction_material_innovation_carbon_stringers) ; \+indep(s33)),
    (indep(s_merchant), consistent(s_merchant, construction_material_innovation_carbon_stringers) ; \+indep(s_merchant)).

evidence(all_consistent(construction_material_innovation_carbon_stringers)).
query(true_val(construction_material_innovation_carbon_stringers, precured_carbon_stringers)).
query(true_val(construction_material_innovation_carbon_stringers, unk_cmi_carbon_stringers)).

% @attr construction_material_innovation_drst
% @type categorical
% @canonical false
% @original_name construction_material_innovation (D.R.S.T.)
% @values drst_six_carbon_tubes=DRST_six_hollow_carbon_cylinders_edge_power unk_cmi_drst=Unknown
% @importance 0.93

0.95::acc(s1, construction_material_innovation_drst).
0.88::acc(s_merchant, construction_material_innovation_drst).

0.95::true_val(construction_material_innovation_drst, drst_six_carbon_tubes); 0.05::true_val(construction_material_innovation_drst, unk_cmi_drst).

measured(s1, construction_material_innovation_drst, drst_six_carbon_tubes).
measured(s_merchant, construction_material_innovation_drst, drst_six_carbon_tubes).

all_consistent(construction_material_innovation_drst) :-
    consistent(s1, construction_material_innovation_drst),
    (indep(s_merchant), consistent(s_merchant, construction_material_innovation_drst) ; \+indep(s_merchant)).

evidence(all_consistent(construction_material_innovation_drst)).
query(true_val(construction_material_innovation_drst, drst_six_carbon_tubes)).
query(true_val(construction_material_innovation_drst, unk_cmi_drst)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values urethane_flex_walls=Urethane_Flex_Walls abs_solid_walls=ABS_Solid_Walls
% @importance 0.90

0.95::acc(s1, sidewall_material).
0.78::acc(s31, sidewall_material).
0.88::acc(s_merchant, sidewall_material).

0.60::true_val(sidewall_material, urethane_flex_walls); 0.40::true_val(sidewall_material, abs_solid_walls).

measured(s1, sidewall_material, urethane_flex_walls).
measured(s31, sidewall_material, abs_solid_walls).
measured(s_merchant, sidewall_material, urethane_flex_walls).

all_consistent(sidewall_material) :-
    consistent(s1, sidewall_material),
    (indep(s31), consistent(s31, sidewall_material) ; \+indep(s31)),
    (indep(s_merchant), consistent(s_merchant, sidewall_material) ; \+indep(s_merchant)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, urethane_flex_walls)).
query(true_val(sidewall_material, abs_solid_walls)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_7000_nano=Nano_Speed_S_sintered_ISOSPORT_7000 sintered_7000_ultra=Ultra_Glide_S_sintered_7000 sintered_7000_hyper=Hyper_Glide_S_sintered_7000
% @importance 0.90

0.95::acc(s1, base_material).
0.75::acc(s31, base_material).
0.70::acc(s22, base_material).
0.88::acc(s_merchant, base_material).

0.50::true_val(base_material, sintered_7000_nano); 0.25::true_val(base_material, sintered_7000_ultra); 0.25::true_val(base_material, sintered_7000_hyper).

measured(s1, base_material, sintered_7000_nano).
measured(s31, base_material, sintered_7000_ultra).
measured(s22, base_material, sintered_7000_hyper).
measured(s_merchant, base_material, sintered_7000_nano).

all_consistent(base_material) :-
    consistent(s1, base_material),
    (indep(s31), consistent(s31, base_material) ; \+indep(s31)),
    (indep(s22), consistent(s22, base_material) ; \+indep(s22)),
    (indep(s_merchant), consistent(s_merchant, base_material) ; \+indep(s_merchant)).

evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_7000_nano)).
query(true_val(base_material, sintered_7000_ultra)).
query(true_val(base_material, sintered_7000_hyper)).

% @attr topsheet
% @type categorical
% @canonical false
% @original_name topsheet
% @values step_down_rails_3d=Step_Down_Rails_Top_3D_reduces_weight unk_topsheet=Unknown
% @importance 1.0

0.93::acc(s1, topsheet).

0.92::true_val(topsheet, step_down_rails_3d); 0.08::true_val(topsheet, unk_topsheet).

measured(s1, topsheet, step_down_rails_3d).

all_consistent(topsheet) :- consistent(s1, topsheet).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, step_down_rails_3d)).
query(true_val(topsheet, unk_topsheet)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values powder_freeride_hardpack=Powder_Freeride_Hardpack_carving unk_terrain_suitability=Unknown
% @importance 0.85

0.88::acc(s_merchant, terrain_suitability).

0.88::true_val(terrain_suitability, powder_freeride_hardpack); 0.12::true_val(terrain_suitability, unk_terrain_suitability).

measured(s_merchant, terrain_suitability, powder_freeride_hardpack).

all_consistent(terrain_suitability) :-
    (indep(s_merchant), consistent(s_merchant, terrain_suitability) ; \+indep(s_merchant)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, powder_freeride_hardpack)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values powder_surfing_freeride=Powder_surfing_Freeride unk_riding_style=Unknown
% @importance 0.85

0.88::acc(s_merchant, riding_style).

0.88::true_val(riding_style, powder_surfing_freeride); 0.12::true_val(riding_style, unk_riding_style).

measured(s_merchant, riding_style, powder_surfing_freeride).

all_consistent(riding_style) :-
    (indep(s_merchant), consistent(s_merchant, riding_style) ; \+indep(s_merchant)).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, powder_surfing_freeride)).
query(true_val(riding_style, unk_riding_style)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate_to_expert=Intermediate_to_Advanced_Expert unk_rider_level=Unknown
% @importance 0.78

0.88::acc(s_merchant, rider_level).
0.75::acc(s18, rider_level).

0.95::true_val(rider_level, intermediate_to_expert); 0.05::true_val(rider_level, unk_rider_level).

measured(s_merchant, rider_level, intermediate_to_expert).
measured(s18, rider_level, intermediate_to_expert).

all_consistent(rider_level) :-
    (indep(s_merchant), consistent(s_merchant, rider_level) ; \+indep(s_merchant)),
    (indep(s18), consistent(s18, rider_level) ; \+indep(s18)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate_to_expert)).
query(true_val(rider_level, unk_rider_level)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum (powder float)
% @values exceptional_float=From_first_run_just_floats_exceptional_powder unk_user_review_forum=Unknown
% @importance 0.85

0.78::acc(s34, user_review_forum).

0.68::true_val(user_review_forum, exceptional_float); 0.32::true_val(user_review_forum, unk_user_review_forum).

measured(s34, user_review_forum, exceptional_float).

all_consistent(user_review_forum) :- consistent(s34, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, exceptional_float)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr user_review_forum_carving
% @type categorical
% @canonical false
% @original_name user_review_forum (carving)
% @values carves_better_than_expected=Carves_better_than_expected_for_powder_shape unk_urf_carving=Unknown
% @importance 0.85

0.78::acc(s34, user_review_forum_carving).

0.68::true_val(user_review_forum_carving, carves_better_than_expected); 0.32::true_val(user_review_forum_carving, unk_urf_carving).

measured(s34, user_review_forum_carving, carves_better_than_expected).

all_consistent(user_review_forum_carving) :- consistent(s34, user_review_forum_carving).

evidence(all_consistent(user_review_forum_carving)).
query(true_val(user_review_forum_carving, carves_better_than_expected)).
query(true_val(user_review_forum_carving, unk_urf_carving)).

% @attr user_review_forum_nimbleness
% @type categorical
% @canonical false
% @original_name user_review_forum (nimbleness)
% @values surprisingly_nimble=Surprisingly_nimble_in_trees_and_bowls unk_urf_nimbleness=Unknown
% @importance 0.85

0.78::acc(s34, user_review_forum_nimbleness).

0.68::true_val(user_review_forum_nimbleness, surprisingly_nimble); 0.32::true_val(user_review_forum_nimbleness, unk_urf_nimbleness).

measured(s34, user_review_forum_nimbleness, surprisingly_nimble).

all_consistent(user_review_forum_nimbleness) :- consistent(s34, user_review_forum_nimbleness).

evidence(all_consistent(user_review_forum_nimbleness)).
query(true_val(user_review_forum_nimbleness, surprisingly_nimble)).
query(true_val(user_review_forum_nimbleness, unk_urf_nimbleness)).

% @attr user_review_forum_edge_transitions
% @type categorical
% @canonical false
% @original_name user_review_forum (3BT edge transitions)
% @values smooth_forgiving=Smooth_and_forgiving_edge_transitions unk_urf_edge_transitions=Unknown
% @importance 0.85

0.78::acc(s34, user_review_forum_edge_transitions).

0.68::true_val(user_review_forum_edge_transitions, smooth_forgiving); 0.32::true_val(user_review_forum_edge_transitions, unk_urf_edge_transitions).

measured(s34, user_review_forum_edge_transitions, smooth_forgiving).

all_consistent(user_review_forum_edge_transitions) :- consistent(s34, user_review_forum_edge_transitions).

evidence(all_consistent(user_review_forum_edge_transitions)).
query(true_val(user_review_forum_edge_transitions, smooth_forgiving)).
query(true_val(user_review_forum_edge_transitions, unk_urf_edge_transitions)).

% @attr user_review_forum_speed_stability
% @type categorical
% @canonical false
% @original_name user_review_forum (speed stability)
% @values stable_high_speed=Stable_at_very_high_speeds_easy_to_ride_fast unk_urf_speed_stability=Unknown
% @importance 0.80

0.75::acc(s35, user_review_forum_speed_stability).
0.75::acc(s36, user_review_forum_speed_stability).

0.90::true_val(user_review_forum_speed_stability, stable_high_speed); 0.10::true_val(user_review_forum_speed_stability, unk_urf_speed_stability).

measured(s35, user_review_forum_speed_stability, stable_high_speed).
measured(s36, user_review_forum_speed_stability, stable_high_speed).

all_consistent(user_review_forum_speed_stability) :-
    consistent(s35, user_review_forum_speed_stability),
    consistent(s36, user_review_forum_speed_stability).

evidence(all_consistent(user_review_forum_speed_stability)).
query(true_val(user_review_forum_speed_stability, stable_high_speed)).
query(true_val(user_review_forum_speed_stability, unk_urf_speed_stability)).

% @attr expert_review_snowboard_robot
% @type categorical
% @canonical false
% @original_name Expert review (Snowboard Robot, LTD version)
% @values great_float_stable_groomed=Great_float_more_stable_than_expected_on_groomed unk_expert_review_sr=Unknown
% @importance 0.75

0.82::acc(s20, expert_review_snowboard_robot).

0.72::true_val(expert_review_snowboard_robot, great_float_stable_groomed); 0.28::true_val(expert_review_snowboard_robot, unk_expert_review_sr).

measured(s20, expert_review_snowboard_robot, great_float_stable_groomed).

all_consistent(expert_review_snowboard_robot) :- consistent(s20, expert_review_snowboard_robot).

evidence(all_consistent(expert_review_snowboard_robot)).
query(true_val(expert_review_snowboard_robot, great_float_stable_groomed)).
query(true_val(expert_review_snowboard_robot, unk_expert_review_sr)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines (unsinkable)
% @values virtually_unsinkable=Virtually_unsinkable_spoon_nose_swallowtail unk_reviewer_opinion_whitelines=Unknown
% @importance 0.85

0.82::acc(s37, reviewer_opinion_whitelines).

0.75::true_val(reviewer_opinion_whitelines, virtually_unsinkable); 0.25::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

measured(s37, reviewer_opinion_whitelines, virtually_unsinkable).

all_consistent(reviewer_opinion_whitelines) :- consistent(s37, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, virtually_unsinkable)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

% @attr reviewer_opinion_whitelines_edge_hold
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines (edge hold)
% @values smooth_then_locked=Rolling_onto_edges_smooth_then_locked_in unk_row_edge_hold=Unknown
% @importance 0.85

0.82::acc(s37, reviewer_opinion_whitelines_edge_hold).

0.75::true_val(reviewer_opinion_whitelines_edge_hold, smooth_then_locked); 0.25::true_val(reviewer_opinion_whitelines_edge_hold, unk_row_edge_hold).

measured(s37, reviewer_opinion_whitelines_edge_hold, smooth_then_locked).

all_consistent(reviewer_opinion_whitelines_edge_hold) :- consistent(s37, reviewer_opinion_whitelines_edge_hold).

evidence(all_consistent(reviewer_opinion_whitelines_edge_hold)).
query(true_val(reviewer_opinion_whitelines_edge_hold, smooth_then_locked)).
query(true_val(reviewer_opinion_whitelines_edge_hold, unk_row_edge_hold)).

% @attr reviewer_opinion_whitelines_switch
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines (switch riding)
% @values not_suitable_switch=Not_suitable_for_switch_riding unk_row_switch=Unknown
% @importance 0.85

0.82::acc(s37, reviewer_opinion_whitelines_switch).

0.75::true_val(reviewer_opinion_whitelines_switch, not_suitable_switch); 0.25::true_val(reviewer_opinion_whitelines_switch, unk_row_switch).

measured(s37, reviewer_opinion_whitelines_switch, not_suitable_switch).

all_consistent(reviewer_opinion_whitelines_switch) :- consistent(s37, reviewer_opinion_whitelines_switch).

evidence(all_consistent(reviewer_opinion_whitelines_switch)).
query(true_val(reviewer_opinion_whitelines_switch, not_suitable_switch)).
query(true_val(reviewer_opinion_whitelines_switch, unk_row_switch)).

% @attr reviewer_comparison_drift
% @type categorical
% @canonical false
% @original_name Reviewer comparison (Drift Products)
% @values best_resort_pow_variable=Best_resort_board_best_pow_for_variable_and_groomers unk_reviewer_comparison_drift=Unknown
% @importance 0.85

0.80::acc(s38, reviewer_comparison_drift).

0.68::true_val(reviewer_comparison_drift, best_resort_pow_variable); 0.32::true_val(reviewer_comparison_drift, unk_reviewer_comparison_drift).

measured(s38, reviewer_comparison_drift, best_resort_pow_variable).

all_consistent(reviewer_comparison_drift) :- consistent(s38, reviewer_comparison_drift).

evidence(all_consistent(reviewer_comparison_drift)).
query(true_val(reviewer_comparison_drift, best_resort_pow_variable)).
query(true_val(reviewer_comparison_drift, unk_reviewer_comparison_drift)).

% @attr user_review_forum_skill_level
% @type categorical
% @canonical false
% @original_name user_review_forum (not beginner)
% @values not_beginner=Definitely_not_a_beginner_board unk_urf_skill_level=Unknown
% @importance 0.80

0.72::acc(s35, user_review_forum_skill_level).

0.60::true_val(user_review_forum_skill_level, not_beginner); 0.40::true_val(user_review_forum_skill_level, unk_urf_skill_level).

measured(s35, user_review_forum_skill_level, not_beginner).

all_consistent(user_review_forum_skill_level) :- consistent(s35, user_review_forum_skill_level).

evidence(all_consistent(user_review_forum_skill_level)).
query(true_val(user_review_forum_skill_level, not_beginner)).
query(true_val(user_review_forum_skill_level, unk_urf_skill_level)).

% @attr user_review_forum_aesthetics
% @type categorical
% @canonical false
% @original_name user_review_forum (aesthetics)
% @values head_turning=Turns_heads_sparks_conversations unk_urf_aesthetics=Unknown
% @importance 0.80

0.72::acc(s35, user_review_forum_aesthetics).

0.60::true_val(user_review_forum_aesthetics, head_turning); 0.40::true_val(user_review_forum_aesthetics, unk_urf_aesthetics).

measured(s35, user_review_forum_aesthetics, head_turning).

all_consistent(user_review_forum_aesthetics) :- consistent(s35, user_review_forum_aesthetics).

evidence(all_consistent(user_review_forum_aesthetics)).
query(true_val(user_review_forum_aesthetics, head_turning)).
query(true_val(user_review_forum_aesthetics, unk_urf_aesthetics)).

% @attr review_count_bataleon
% @type categorical
% @canonical false
% @original_name Review count on Bataleon US
% @values r68_94pct_5star=68_reviews_94pct_five_star unk_review_count_bataleon=Unknown
% @importance 1.0

0.90::acc(s1, review_count_bataleon).

0.90::true_val(review_count_bataleon, r68_94pct_5star); 0.10::true_val(review_count_bataleon, unk_review_count_bataleon).

measured(s1, review_count_bataleon, r68_94pct_5star).

all_consistent(review_count_bataleon) :- consistent(s1, review_count_bataleon).

evidence(all_consistent(review_count_bataleon)).
query(true_val(review_count_bataleon, r68_94pct_5star)).
query(true_val(review_count_bataleon, unk_review_count_bataleon)).

% @attr user_review_forum_flex_feel
% @type categorical
% @canonical false
% @original_name user_review_forum (flex feel)
% @values never_too_soft=Despite_4_10_never_felt_too_soft_plenty_pushback unk_urf_flex_feel=Unknown
% @importance 0.75

0.78::acc(s20, user_review_forum_flex_feel).

0.72::true_val(user_review_forum_flex_feel, never_too_soft); 0.28::true_val(user_review_forum_flex_feel, unk_urf_flex_feel).

measured(s20, user_review_forum_flex_feel, never_too_soft).

all_consistent(user_review_forum_flex_feel) :- consistent(s20, user_review_forum_flex_feel).

evidence(all_consistent(user_review_forum_flex_feel)).
query(true_val(user_review_forum_flex_feel, never_too_soft)).
query(true_val(user_review_forum_flex_feel, unk_urf_flex_feel)).

% @attr user_review_forum_durability
% @type categorical
% @canonical false
% @original_name user_review_forum (durability)
% @values durability_concerns=Durability_concerns_not_all_wrong unk_urf_durability=Unknown
% @importance 0.80

0.72::acc(s35, user_review_forum_durability).

0.60::true_val(user_review_forum_durability, durability_concerns); 0.40::true_val(user_review_forum_durability, unk_urf_durability).

measured(s35, user_review_forum_durability, durability_concerns).

all_consistent(user_review_forum_durability) :- consistent(s35, user_review_forum_durability).

evidence(all_consistent(user_review_forum_durability)).
query(true_val(user_review_forum_durability, durability_concerns)).
query(true_val(user_review_forum_durability, unk_urf_durability)).

% @attr user_review_forum_tail_flex
% @type categorical
% @canonical false
% @original_name user_review_forum (tail stiffness / torsional flex)
% @values stiffer_tail_dialed_torsion=Tail_stiffer_torsional_flex_dialed_better_shock_absorption unk_urf_tail_flex=Unknown
% @importance 0.75

0.75::acc(s39, user_review_forum_tail_flex).

0.62::true_val(user_review_forum_tail_flex, stiffer_tail_dialed_torsion); 0.38::true_val(user_review_forum_tail_flex, unk_urf_tail_flex).

measured(s39, user_review_forum_tail_flex, stiffer_tail_dialed_torsion).

all_consistent(user_review_forum_tail_flex) :- consistent(s39, user_review_forum_tail_flex).

evidence(all_consistent(user_review_forum_tail_flex)).
query(true_val(user_review_forum_tail_flex, stiffer_tail_dialed_torsion)).
query(true_val(user_review_forum_tail_flex, unk_urf_tail_flex)).

% @attr construction_material_innovation_3bt_camber
% @type categorical
% @canonical false
% @original_name construction_material_innovation (3BT+Camber)
% @values tip_to_tail_camber_uplift=Positive_camber_with_uplifted_sidebase_reduces_edge_catch unk_cmi_3bt_camber=Unknown
% @importance 1.0

0.93::acc(s1, construction_material_innovation_3bt_camber).

0.92::true_val(construction_material_innovation_3bt_camber, tip_to_tail_camber_uplift); 0.08::true_val(construction_material_innovation_3bt_camber, unk_cmi_3bt_camber).

measured(s1, construction_material_innovation_3bt_camber, tip_to_tail_camber_uplift).

all_consistent(construction_material_innovation_3bt_camber) :- consistent(s1, construction_material_innovation_3bt_camber).

evidence(all_consistent(construction_material_innovation_3bt_camber)).
query(true_val(construction_material_innovation_3bt_camber, tip_to_tail_camber_uplift)).
query(true_val(construction_material_innovation_3bt_camber, unk_cmi_3bt_camber)).

% @attr construction_material_innovation_sidekick
% @type categorical
% @canonical false
% @original_name construction_material_innovation (SideKick)
% @values sidekick_hull=SideKick_extends_sidebase_beyond_widest_points_hull_shape unk_cmi_sidekick=Unknown
% @importance 1.0

0.93::acc(s1, construction_material_innovation_sidekick).

0.92::true_val(construction_material_innovation_sidekick, sidekick_hull); 0.08::true_val(construction_material_innovation_sidekick, unk_cmi_sidekick).

measured(s1, construction_material_innovation_sidekick, sidekick_hull).

all_consistent(construction_material_innovation_sidekick) :- consistent(s1, construction_material_innovation_sidekick).

evidence(all_consistent(construction_material_innovation_sidekick)).
query(true_val(construction_material_innovation_sidekick, sidekick_hull)).
query(true_val(construction_material_innovation_sidekick, unk_cmi_sidekick)).

% @attr construction_material_innovation_powder_hull
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Powder Hull)
% @values powder_hull_snow_exhaust=Advanced_swallowtail_snow_exhaust_boost_float unk_cmi_powder_hull=Unknown
% @importance 1.0

0.93::acc(s1, construction_material_innovation_powder_hull).

0.92::true_val(construction_material_innovation_powder_hull, powder_hull_snow_exhaust); 0.08::true_val(construction_material_innovation_powder_hull, unk_cmi_powder_hull).

measured(s1, construction_material_innovation_powder_hull, powder_hull_snow_exhaust).

all_consistent(construction_material_innovation_powder_hull) :- consistent(s1, construction_material_innovation_powder_hull).

evidence(all_consistent(construction_material_innovation_powder_hull)).
query(true_val(construction_material_innovation_powder_hull, powder_hull_snow_exhaust)).
query(true_val(construction_material_innovation_powder_hull, unk_cmi_powder_hull)).

% @attr construction_material_innovation_step_down
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Step Down Rails)
% @values step_down_3d=Topsheet_3D_tapered_deck_reduces_weight_carve_precision unk_cmi_step_down=Unknown
% @importance 1.0

0.93::acc(s1, construction_material_innovation_step_down).

0.92::true_val(construction_material_innovation_step_down, step_down_3d); 0.08::true_val(construction_material_innovation_step_down, unk_cmi_step_down).

measured(s1, construction_material_innovation_step_down, step_down_3d).

all_consistent(construction_material_innovation_step_down) :- consistent(s1, construction_material_innovation_step_down).

evidence(all_consistent(construction_material_innovation_step_down)).
query(true_val(construction_material_innovation_step_down, step_down_3d)).
query(true_val(construction_material_innovation_step_down, unk_cmi_step_down)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand (Jones Storm Chaser)
% @values storm_chaser_best_all_around=Jones_Storm_Chaser_best_all_around_pow_more_slashable unk_comparable_board_cross_brand=Unknown
% @importance 0.84

0.78::acc(s40, comparable_board_cross_brand).
0.80::acc(s38, comparable_board_cross_brand).

0.90::true_val(comparable_board_cross_brand, storm_chaser_best_all_around); 0.10::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s40, comparable_board_cross_brand, storm_chaser_best_all_around).
measured(s38, comparable_board_cross_brand, storm_chaser_best_all_around).

all_consistent(comparable_board_cross_brand) :-
    consistent(s40, comparable_board_cross_brand),
    consistent(s38, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, storm_chaser_best_all_around)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_korua_dart
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Korua Dart)
% @values korua_dart_most_versatile=Korua_Dart_most_versatile_powder_board unk_cbcb_korua=Unknown
% @importance 0.82

0.72::acc(s41, comparable_board_cross_brand_korua_dart).

0.55::true_val(comparable_board_cross_brand_korua_dart, korua_dart_most_versatile); 0.45::true_val(comparable_board_cross_brand_korua_dart, unk_cbcb_korua).

measured(s41, comparable_board_cross_brand_korua_dart, korua_dart_most_versatile).

all_consistent(comparable_board_cross_brand_korua_dart) :- consistent(s41, comparable_board_cross_brand_korua_dart).

evidence(all_consistent(comparable_board_cross_brand_korua_dart)).
query(true_val(comparable_board_cross_brand_korua_dart, korua_dart_most_versatile)).
query(true_val(comparable_board_cross_brand_korua_dart, unk_cbcb_korua)).

% @attr comparable_board_cross_brand_weston_japow
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Weston Japow)
% @values weston_japow_deep_pow=Weston_Japow_extra_deep_powder_soft_nose_light_fluffy unk_cbcb_weston=Unknown
% @importance 0.82

0.72::acc(s41, comparable_board_cross_brand_weston_japow).

0.55::true_val(comparable_board_cross_brand_weston_japow, weston_japow_deep_pow); 0.45::true_val(comparable_board_cross_brand_weston_japow, unk_cbcb_weston).

measured(s41, comparable_board_cross_brand_weston_japow, weston_japow_deep_pow).

all_consistent(comparable_board_cross_brand_weston_japow) :- consistent(s41, comparable_board_cross_brand_weston_japow).

evidence(all_consistent(comparable_board_cross_brand_weston_japow)).
query(true_val(comparable_board_cross_brand_weston_japow, weston_japow_deep_pow)).
query(true_val(comparable_board_cross_brand_weston_japow, unk_cbcb_weston)).

% @attr comparable_board_cross_brand_capita_pow_glider
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (CAPiTA Spring Break Pow Glider)
% @values capita_pow_glider=CAPiTA_Spring_Break_Pow_Glider_torn_between unk_cbcb_capita=Unknown
% @importance 0.80

0.68::acc(s25, comparable_board_cross_brand_capita_pow_glider).

0.52::true_val(comparable_board_cross_brand_capita_pow_glider, capita_pow_glider); 0.48::true_val(comparable_board_cross_brand_capita_pow_glider, unk_cbcb_capita).

measured(s25, comparable_board_cross_brand_capita_pow_glider, capita_pow_glider).

all_consistent(comparable_board_cross_brand_capita_pow_glider) :- consistent(s25, comparable_board_cross_brand_capita_pow_glider).

evidence(all_consistent(comparable_board_cross_brand_capita_pow_glider)).
query(true_val(comparable_board_cross_brand_capita_pow_glider, capita_pow_glider)).
query(true_val(comparable_board_cross_brand_capita_pow_glider, unk_cbcb_capita)).

% @attr comparable_board_cross_brand_k2
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (K2 Special Effects / Cool Bean)
% @values k2_short_wide_powder=K2_Special_Effects_Cool_Bean_alternative_short_wide_powder unk_cbcb_k2=Unknown
% @importance 0.70

0.68::acc(s42, comparable_board_cross_brand_k2).

0.55::true_val(comparable_board_cross_brand_k2, k2_short_wide_powder); 0.45::true_val(comparable_board_cross_brand_k2, unk_cbcb_k2).

measured(s42, comparable_board_cross_brand_k2, k2_short_wide_powder).

all_consistent(comparable_board_cross_brand_k2) :- consistent(s42, comparable_board_cross_brand_k2).

evidence(all_consistent(comparable_board_cross_brand_k2)).
query(true_val(comparable_board_cross_brand_k2, k2_short_wide_powder)).
query(true_val(comparable_board_cross_brand_k2, unk_cbcb_k2)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand (Party Wave+)
% @values party_wave_plus=Surfer_wider_stiffer_more_serious_vs_Party_Wave_playful unk_comparable_board_same_brand=Unknown
% @importance 0.85

0.75::acc(s22, comparable_board_same_brand).

0.68::true_val(comparable_board_same_brand, party_wave_plus); 0.32::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s22, comparable_board_same_brand, party_wave_plus).

all_consistent(comparable_board_same_brand) :-
    (indep(s22), consistent(s22, comparable_board_same_brand) ; \+indep(s22)).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, party_wave_plus)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_cruiser
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Cruiser)
% @values cruiser_more_versatile=Bataleon_Cruiser_more_versatile_take_on_surfer unk_cbsb_cruiser=Unknown
% @importance 0.80

0.68::acc(s25, comparable_board_same_brand_cruiser).

0.52::true_val(comparable_board_same_brand_cruiser, cruiser_more_versatile); 0.48::true_val(comparable_board_same_brand_cruiser, unk_cbsb_cruiser).

measured(s25, comparable_board_same_brand_cruiser, cruiser_more_versatile).

all_consistent(comparable_board_same_brand_cruiser) :- consistent(s25, comparable_board_same_brand_cruiser).

evidence(all_consistent(comparable_board_same_brand_cruiser)).
query(true_val(comparable_board_same_brand_cruiser, cruiser_more_versatile)).
query(true_val(comparable_board_same_brand_cruiser, unk_cbsb_cruiser)).

% @attr forum_comparison_storm_chaser
% @type categorical
% @canonical false
% @original_name Forum user Storm Chaser vs Surfer preference
% @values preferred_storm_chaser=Owner_of_both_preferred_Storm_Chaser_for_good_pow unk_forum_comparison_sc=Unknown
% @importance 0.82

0.70::acc(s40, forum_comparison_storm_chaser).

0.58::true_val(forum_comparison_storm_chaser, preferred_storm_chaser); 0.42::true_val(forum_comparison_storm_chaser, unk_forum_comparison_sc).

measured(s40, forum_comparison_storm_chaser, preferred_storm_chaser).

all_consistent(forum_comparison_storm_chaser) :- consistent(s40, forum_comparison_storm_chaser).

evidence(all_consistent(forum_comparison_storm_chaser)).
query(true_val(forum_comparison_storm_chaser, preferred_storm_chaser)).
query(true_val(forum_comparison_storm_chaser, unk_forum_comparison_sc)).

% @attr board_weight_grams
% @type numeric
% @canonical true
% @unit g
% @original_name board_weight_grams
% @values v3000=3000.0
% @importance 0.70

0.65::acc(s30, board_weight_grams).

0.55::true_val(board_weight_grams, v3000); 0.45::true_val(board_weight_grams, unk_board_weight_grams).

measured(s30, board_weight_grams, v3000).

all_consistent(board_weight_grams) :- consistent(s30, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v3000)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard=Standard_not_wide unk_width_options=Unknown
% @importance 0.85

0.88::acc(s_merchant, width_options).

0.88::true_val(width_options, standard); 0.12::true_val(width_options, unk_width_options).

measured(s_merchant, width_options, standard).

all_consistent(width_options) :-
    (indep(s_merchant), consistent(s_merchant, width_options) ; \+indep(s_merchant)).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard)).
query(true_val(width_options, unk_width_options)).

% @attr reviewer_opinion_whitelines_sizing
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines (sizing)
% @values ride_shorter=Can_be_ridden_shorter_due_to_wide_nose_swallowtail unk_row_sizing=Unknown
% @importance 0.85

0.82::acc(s37, reviewer_opinion_whitelines_sizing).

0.75::true_val(reviewer_opinion_whitelines_sizing, ride_shorter); 0.25::true_val(reviewer_opinion_whitelines_sizing, unk_row_sizing).

measured(s37, reviewer_opinion_whitelines_sizing, ride_shorter).

all_consistent(reviewer_opinion_whitelines_sizing) :- consistent(s37, reviewer_opinion_whitelines_sizing).

evidence(all_consistent(reviewer_opinion_whitelines_sizing)).
query(true_val(reviewer_opinion_whitelines_sizing, ride_shorter)).
query(true_val(reviewer_opinion_whitelines_sizing, unk_row_sizing)).

% @attr flex_feel
% @type categorical
% @canonical false
% @original_name flex_feel
% @values mid_flex_balanced=Mid_flex_balanced_versatile_all_mountain unk_flex_feel=Unknown
% @importance 0.85

0.82::acc(s_merchant, flex_feel).

0.82::true_val(flex_feel, mid_flex_balanced); 0.18::true_val(flex_feel, unk_flex_feel).

measured(s_merchant, flex_feel, mid_flex_balanced).

all_consistent(flex_feel) :-
    (indep(s_merchant), consistent(s_merchant, flex_feel) ; \+indep(s_merchant)).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, mid_flex_balanced)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr camber_description
% @type categorical
% @canonical false
% @original_name camber_description
% @values medium_camber_3bt_sidekick=Medium_Camber_3BT_Sidekick_High_Nose_Low_Tail unk_camber_description=Unknown
% @importance 0.85

0.82::acc(s_merchant, camber_description).

0.82::true_val(camber_description, medium_camber_3bt_sidekick); 0.18::true_val(camber_description, unk_camber_description).

measured(s_merchant, camber_description, medium_camber_3bt_sidekick).

all_consistent(camber_description) :-
    (indep(s_merchant), consistent(s_merchant, camber_description) ; \+indep(s_merchant)).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, medium_camber_3bt_sidekick)).
query(true_val(camber_description, unk_camber_description)).