0.15::indep(s1).
0.20::indep(s9).
0.15::indep(s10).
0.25::indep(s12).
0.15::indep(s13).
0.15::indep(s14).
0.10::indep(s16).
0.10::indep(s17).
0.15::indep(s18).
0.15::indep(s19).
0.15::indep(s29).
0.20::indep(s11).
0.80::indep(s23).
0.80::indep(s27).
0.80::indep(s30).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values nidecker=Nidecker unk_brand=Unknown
% @importance 0.90

0.90::acc(s1, brand).

0.95::true_val(brand, nidecker); 0.05::true_val(brand, unk_brand).

measured(s1, brand, nidecker).

all_consistent(brand) :-
    (indep(s1), consistent(s1, brand) ; \+indep(s1)).

evidence(all_consistent(brand)).
query(true_val(brand, nidecker)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values megalight=Megalight unk_model_name=Unknown
% @importance 0.90

0.90::acc(s1, model_name).

0.95::true_val(model_name, megalight); 0.05::true_val(model_name, unk_model_name).

measured(s1, model_name, megalight).

all_consistent(model_name) :-
    (indep(s1), consistent(s1, model_name) ; \+indep(s1)).

evidence(all_consistent(model_name)).
query(true_val(model_name, megalight)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2027=2027 unk_model_year=Unknown
% @importance 0.90

0.85::acc(s1, model_year).

0.90::true_val(model_year, y2027); 0.10::true_val(model_year, unk_model_year).

measured(s1, model_year, y2027).

all_consistent(model_year) :-
    (indep(s1), consistent(s1, model_year) ; \+indep(s1)).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2027)).
query(true_val(model_year, unk_model_year)).

% @attr manufacturer_legal_entity
% @type categorical
% @canonical false
% @original_name Manufacturer legal entity
% @values nidecker_sa_rolle=Nidecker_SA_Rolle_Switzerland unk_manufacturer_legal_entity=Unknown
% @importance 0.40

0.90::acc(s2, manufacturer_legal_entity).

0.93::true_val(manufacturer_legal_entity, nidecker_sa_rolle); 0.07::true_val(manufacturer_legal_entity, unk_manufacturer_legal_entity).

measured(s2, manufacturer_legal_entity, nidecker_sa_rolle).

all_consistent(manufacturer_legal_entity) :-
    consistent(s2, manufacturer_legal_entity).

evidence(all_consistent(manufacturer_legal_entity)).
query(true_val(manufacturer_legal_entity, nidecker_sa_rolle)).
query(true_val(manufacturer_legal_entity, unk_manufacturer_legal_entity)).

% @attr european_representative
% @type categorical
% @canonical false
% @original_name European representative
% @values low_pressure_studio_bv=Low_Pressure_Studio_BV_Amsterdam unk_european_representative=Unknown
% @importance 0.40

0.88::acc(s2, european_representative).

0.90::true_val(european_representative, low_pressure_studio_bv); 0.10::true_val(european_representative, unk_european_representative).

measured(s2, european_representative, low_pressure_studio_bv).

all_consistent(european_representative) :-
    consistent(s2, european_representative).

evidence(all_consistent(european_representative)).
query(true_val(european_representative, low_pressure_studio_bv)).
query(true_val(european_representative, unk_european_representative)).

% @attr company_founding_year
% @type numeric
% @canonical false
% @original_name Company founding year
% @unit year
% @values v1887=1887 unk_company_founding_year=Unknown
% @importance 0.475

0.90::acc(s3, company_founding_year).
0.95::acc(s4, company_founding_year).

0.95::true_val(company_founding_year, v1887); 0.05::true_val(company_founding_year, unk_company_founding_year).

measured(s3, company_founding_year, v1887).
measured(s4, company_founding_year, v1887).

all_consistent(company_founding_year) :-
    consistent(s3, company_founding_year),
    consistent(s4, company_founding_year).

evidence(all_consistent(company_founding_year)).
query(true_val(company_founding_year, v1887)).
query(true_val(company_founding_year, unk_company_founding_year)).

% @attr first_snowboard_production_year
% @type numeric
% @canonical false
% @original_name First snowboard production year
% @unit year
% @values v1984=1984 unk_first_snowboard_production_year=Unknown
% @importance 0.50

0.95::acc(s4, first_snowboard_production_year).

0.93::true_val(first_snowboard_production_year, v1984); 0.07::true_val(first_snowboard_production_year, unk_first_snowboard_production_year).

measured(s4, first_snowboard_production_year, v1984).

all_consistent(first_snowboard_production_year) :-
    consistent(s4, first_snowboard_production_year).

evidence(all_consistent(first_snowboard_production_year)).
query(true_val(first_snowboard_production_year, v1984)).
query(true_val(first_snowboard_production_year, unk_first_snowboard_production_year)).

% @attr oldest_european_snowboard_brand
% @type categorical
% @canonical false
% @original_name Oldest European snowboard brand
% @values confirmed=Yes_oldest_European_snowboard_brand unk_oldest_european_snowboard_brand=Unknown
% @importance 0.50

0.93::acc(s4, oldest_european_snowboard_brand).

0.92::true_val(oldest_european_snowboard_brand, confirmed); 0.08::true_val(oldest_european_snowboard_brand, unk_oldest_european_snowboard_brand).

measured(s4, oldest_european_snowboard_brand, confirmed).

all_consistent(oldest_european_snowboard_brand) :-
    consistent(s4, oldest_european_snowboard_brand).

evidence(all_consistent(oldest_european_snowboard_brand)).
query(true_val(oldest_european_snowboard_brand, confirmed)).
query(true_val(oldest_european_snowboard_brand, unk_oldest_european_snowboard_brand)).

% @attr family_ownership
% @type categorical
% @canonical false
% @original_name Family ownership
% @values family_owned_swiss=Family_owned_Swiss_company unk_family_ownership=Unknown
% @importance 0.475

0.88::acc(s3, family_ownership).
0.93::acc(s4, family_ownership).

0.95::true_val(family_ownership, family_owned_swiss); 0.05::true_val(family_ownership, unk_family_ownership).

measured(s3, family_ownership, family_owned_swiss).
measured(s4, family_ownership, family_owned_swiss).

all_consistent(family_ownership) :-
    consistent(s3, family_ownership),
    consistent(s4, family_ownership).

evidence(all_consistent(family_ownership)).
query(true_val(family_ownership, family_owned_swiss)).
query(true_val(family_ownership, unk_family_ownership)).

% @attr nidecker_group_brands
% @type categorical
% @canonical false
% @original_name Nidecker Group brands
% @values full_portfolio=Bataleon_Emerica_eS_Etnies_Jones_Nidecker_Rome_Thirtytwo_YES unk_nidecker_group_brands=Unknown
% @importance 0.50

0.95::acc(s4, nidecker_group_brands).

0.93::true_val(nidecker_group_brands, full_portfolio); 0.07::true_val(nidecker_group_brands, unk_nidecker_group_brands).

measured(s4, nidecker_group_brands, full_portfolio).

all_consistent(nidecker_group_brands) :-
    consistent(s4, nidecker_group_brands).

evidence(all_consistent(nidecker_group_brands)).
query(true_val(nidecker_group_brands, full_portfolio)).
query(true_val(nidecker_group_brands, unk_nidecker_group_brands)).

% @attr ceo
% @type categorical
% @canonical false
% @original_name CEO
% @values henry_nidecker=Henry_Nidecker unk_ceo=Unknown
% @importance 0.475

0.88::acc(s3, ceo).

0.85::true_val(ceo, henry_nidecker); 0.15::true_val(ceo, unk_ceo).

measured(s3, ceo, henry_nidecker).

all_consistent(ceo) :-
    consistent(s3, ceo).

evidence(all_consistent(ceo)).
query(true_val(ceo, henry_nidecker)).
query(true_val(ceo, unk_ceo)).

% @attr first_megalight_snowboard_year
% @type numeric
% @canonical false
% @original_name First Megalight snowboard year
% @unit year
% @values v2002=2002 unk_first_megalight_snowboard_year=Unknown
% @importance 0.55

0.95::acc(s5, first_megalight_snowboard_year).

0.93::true_val(first_megalight_snowboard_year, v2002); 0.07::true_val(first_megalight_snowboard_year, unk_first_megalight_snowboard_year).

measured(s5, first_megalight_snowboard_year, v2002).

all_consistent(first_megalight_snowboard_year) :-
    consistent(s5, first_megalight_snowboard_year).

evidence(all_consistent(first_megalight_snowboard_year)).
query(true_val(first_megalight_snowboard_year, v2002)).
query(true_val(first_megalight_snowboard_year, unk_first_megalight_snowboard_year)).

% @attr megalight_long_term_availability
% @type categorical
% @canonical false
% @original_name Megalight long-term availability
% @values since_early_2000s=Available_since_early_2000s unk_megalight_long_term_availability=Unknown
% @importance 0.95

0.85::acc(s6, megalight_long_term_availability).

0.82::true_val(megalight_long_term_availability, since_early_2000s); 0.18::true_val(megalight_long_term_availability, unk_megalight_long_term_availability).

measured(s6, megalight_long_term_availability, since_early_2000s).

all_consistent(megalight_long_term_availability) :-
    consistent(s6, megalight_long_term_availability).

evidence(all_consistent(megalight_long_term_availability)).
query(true_val(megalight_long_term_availability, since_early_2000s)).
query(true_val(megalight_long_term_availability, unk_megalight_long_term_availability)).

% @attr flagship_status
% @type categorical
% @canonical false
% @original_name Flagship status
% @values confirmed_flagship=Flagship_board unk_flagship_status=Unknown
% @importance 0.95

0.95::acc(s7, flagship_status).
0.80::acc(s1, flagship_status).

0.95::true_val(flagship_status, confirmed_flagship); 0.05::true_val(flagship_status, unk_flagship_status).

measured(s7, flagship_status, confirmed_flagship).
measured(s1, flagship_status, confirmed_flagship).

all_consistent(flagship_status) :-
    consistent(s7, flagship_status),
    (indep(s1), consistent(s1, flagship_status) ; \+indep(s1)).

evidence(all_consistent(flagship_status)).
query(true_val(flagship_status, confirmed_flagship)).
query(true_val(flagship_status, unk_flagship_status)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.90

0.90::acc(s1, product_type).

0.95::true_val(product_type, snowboard); 0.05::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).

all_consistent(product_type) :-
    (indep(s1), consistent(s1, product_type) ; \+indep(s1)).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values freeride_powder=Freeride-Powder freeride=Freeride all_mountain=All-Mountain
% @importance 0.85

0.85::acc(s1, board_category).
0.88::acc(s6, board_category).
0.75::acc(s9, board_category).

0.45::true_val(board_category, freeride_powder); 0.40::true_val(board_category, freeride); 0.15::true_val(board_category, all_mountain).

measured(s1, board_category, freeride_powder).
measured(s6, board_category, freeride).
measured(s9, board_category, all_mountain).

all_consistent(board_category) :-
    (indep(s1), consistent(s1, board_category) ; \+indep(s1)),
    consistent(s6, board_category),
    (indep(s9), consistent(s9, board_category) ; \+indep(s9)).

evidence(all_consistent(board_category)).
query(true_val(board_category, freeride_powder)).
query(true_val(board_category, freeride)).
query(true_val(board_category, all_mountain)).

% @attr board_category_snowboard_mag
% @type categorical
% @canonical false
% @original_name Board category (Snowboard Magazine)
% @values heavy_situation=Perfect_for_heavy_situations unk_board_category_snowboard_mag=Unknown
% @importance 0.85

0.85::acc(s8, board_category_snowboard_mag).

0.82::true_val(board_category_snowboard_mag, heavy_situation); 0.18::true_val(board_category_snowboard_mag, unk_board_category_snowboard_mag).

measured(s8, board_category_snowboard_mag, heavy_situation).

all_consistent(board_category_snowboard_mag) :-
    consistent(s8, board_category_snowboard_mag).

evidence(all_consistent(board_category_snowboard_mag)).
query(true_val(board_category_snowboard_mag, heavy_situation)).
query(true_val(board_category_snowboard_mag, unk_board_category_snowboard_mag)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values advanced=Advanced unk_rider_level=Unknown
% @importance 0.90

0.85::acc(s1, rider_level).

0.90::true_val(rider_level, advanced); 0.10::true_val(rider_level, unk_rider_level).

measured(s1, rider_level, advanced).

all_consistent(rider_level) :-
    (indep(s1), consistent(s1, rider_level) ; \+indep(s1)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, advanced)).
query(true_val(rider_level, unk_rider_level)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values advanced_expert=Advanced-Expert unk_skill_level_recommendation=Unknown
% @importance 0.825

0.88::acc(s6, skill_level_recommendation).
0.78::acc(s10, skill_level_recommendation).

0.95::true_val(skill_level_recommendation, advanced_expert); 0.05::true_val(skill_level_recommendation, unk_skill_level_recommendation).

measured(s6, skill_level_recommendation, advanced_expert).
measured(s10, skill_level_recommendation, advanced_expert).

all_consistent(skill_level_recommendation) :-
    consistent(s6, skill_level_recommendation),
    (indep(s10), consistent(s10, skill_level_recommendation) ; \+indep(s10)).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, advanced_expert)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.40

0.75::acc(s11, gender).

0.80::true_val(gender, mens); 0.20::true_val(gender, unk_gender).

measured(s11, gender, mens).

all_consistent(gender) :-
    (indep(s11), consistent(s11, gender) ; \+indep(s11)).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr terrain_focus_ballistyx
% @type categorical
% @canonical false
% @original_name Terrain focus (Ballistyx)
% @values powder_carving=Powder_Carving unk_terrain_focus_ballistyx=Unknown
% @importance 0.70

0.78::acc(s12, terrain_focus_ballistyx).

0.80::true_val(terrain_focus_ballistyx, powder_carving); 0.20::true_val(terrain_focus_ballistyx, unk_terrain_focus_ballistyx).

measured(s12, terrain_focus_ballistyx, powder_carving).

all_consistent(terrain_focus_ballistyx) :-
    (indep(s12), consistent(s12, terrain_focus_ballistyx) ; \+indep(s12)).

evidence(all_consistent(terrain_focus_ballistyx)).
query(true_val(terrain_focus_ballistyx, powder_carving)).
query(true_val(terrain_focus_ballistyx, unk_terrain_focus_ballistyx)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values big_mtn_powder_carve_resort=Big_mountain_freeride_deep_powder_carving_resort unk_terrain_suitability=Unknown
% @importance 0.925

0.88::acc(s6, terrain_suitability).
0.85::acc(s8, terrain_suitability).
0.78::acc(s12, terrain_suitability).

0.95::true_val(terrain_suitability, big_mtn_powder_carve_resort); 0.05::true_val(terrain_suitability, unk_terrain_suitability).

measured(s6, terrain_suitability, big_mtn_powder_carve_resort).
measured(s8, terrain_suitability, big_mtn_powder_carve_resort).
measured(s12, terrain_suitability, big_mtn_powder_carve_resort).

all_consistent(terrain_suitability) :-
    consistent(s6, terrain_suitability),
    consistent(s8, terrain_suitability),
    (indep(s12), consistent(s12, terrain_suitability) ; \+indep(s12)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, big_mtn_powder_carve_resort)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr terrain_suitability_powder
% @type numeric
% @canonical false
% @original_name terrain_suitability (Powder)
% @unit /5
% @values v5=5.0 unk_terrain_suitability_powder=Unknown
% @importance 1.00

0.95::acc(s7, terrain_suitability_powder).

0.95::true_val(terrain_suitability_powder, v5); 0.05::true_val(terrain_suitability_powder, unk_terrain_suitability_powder).

measured(s7, terrain_suitability_powder, v5).

all_consistent(terrain_suitability_powder) :-
    consistent(s7, terrain_suitability_powder).

evidence(all_consistent(terrain_suitability_powder)).
query(true_val(terrain_suitability_powder, v5)).
query(true_val(terrain_suitability_powder, unk_terrain_suitability_powder)).

% @attr terrain_suitability_freeride
% @type numeric
% @canonical false
% @original_name terrain_suitability (Freeride)
% @unit /5
% @values v5=5.0 unk_terrain_suitability_freeride=Unknown
% @importance 1.00

0.95::acc(s7, terrain_suitability_freeride).

0.95::true_val(terrain_suitability_freeride, v5); 0.05::true_val(terrain_suitability_freeride, unk_terrain_suitability_freeride).

measured(s7, terrain_suitability_freeride, v5).

all_consistent(terrain_suitability_freeride) :-
    consistent(s7, terrain_suitability_freeride).

evidence(all_consistent(terrain_suitability_freeride)).
query(true_val(terrain_suitability_freeride, v5)).
query(true_val(terrain_suitability_freeride, unk_terrain_suitability_freeride)).

% @attr terrain_suitability_park
% @type numeric
% @canonical false
% @original_name terrain_suitability (Park)
% @unit /5
% @values v1=1.0 unk_terrain_suitability_park=Unknown
% @importance 1.00

0.95::acc(s7, terrain_suitability_park).

0.95::true_val(terrain_suitability_park, v1); 0.05::true_val(terrain_suitability_park, unk_terrain_suitability_park).

measured(s7, terrain_suitability_park, v1).

all_consistent(terrain_suitability_park) :-
    consistent(s7, terrain_suitability_park).

evidence(all_consistent(terrain_suitability_park)).
query(true_val(terrain_suitability_park, v1)).
query(true_val(terrain_suitability_park, unk_terrain_suitability_park)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 0.80

0.88::acc(s1, shape).
0.78::acc(s12, shape).

0.95::true_val(shape, tapered_directional); 0.05::true_val(shape, unk_shape).

measured(s1, shape, tapered_directional).
measured(s12, shape, tapered_directional).

all_consistent(shape) :-
    (indep(s1), consistent(s1, shape) ; \+indep(s1)),
    (indep(s12), consistent(s12, shape) ; \+indep(s12)).

evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values surfy_camrock=Surfy_CamRock unk_camber_type=Unknown
% @importance 0.90

0.88::acc(s1, camber_type).
0.95::acc(s7, camber_type).

0.95::true_val(camber_type, surfy_camrock); 0.05::true_val(camber_type, unk_camber_type).

measured(s1, camber_type, surfy_camrock).
measured(s7, camber_type, surfy_camrock).

all_consistent(camber_type) :-
    consistent(s7, camber_type),
    (indep(s1), consistent(s1, camber_type) ; \+indep(s1)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, surfy_camrock)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name Camber description
% @values extended_rocker_nose_camber_body=Extended_rocker_nose_camber_through_body unk_camber_description=Unknown
% @importance 0.85

0.95::acc(s7, camber_description).
0.78::acc(s12, camber_description).

0.95::true_val(camber_description, extended_rocker_nose_camber_body); 0.05::true_val(camber_description, unk_camber_description).

measured(s7, camber_description, extended_rocker_nose_camber_body).
measured(s12, camber_description, extended_rocker_nose_camber_body).

all_consistent(camber_description) :-
    consistent(s7, camber_description),
    (indep(s12), consistent(s12, camber_description) ; \+indep(s12)).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, extended_rocker_nose_camber_body)).
query(true_val(camber_description, unk_camber_description)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @original_name flex_rating_10
% @unit /10
% @values v8=8.0 unk_flex_rating_10=Unknown
% @importance 0.90

0.88::acc(s1, flex_rating_10).
0.93::acc(s7, flex_rating_10).

0.95::true_val(flex_rating_10, v8); 0.05::true_val(flex_rating_10, unk_flex_rating_10).

measured(s1, flex_rating_10, v8).
measured(s7, flex_rating_10, v8).

all_consistent(flex_rating_10) :-
    consistent(s7, flex_rating_10),
    (indep(s1), consistent(s1, flex_rating_10) ; \+indep(s1)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v8)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

% @attr flex_rating_5
% @type numeric
% @canonical true
% @original_name flex_rating_5
% @unit /5
% @values v4=4.0 unk_flex_rating_5=Unknown
% @importance 0.85

0.95::acc(s7, flex_rating_5).
0.78::acc(s10, flex_rating_5).

0.95::true_val(flex_rating_5, v4); 0.05::true_val(flex_rating_5, unk_flex_rating_5).

measured(s7, flex_rating_5, v4).
measured(s10, flex_rating_5, v4).

all_consistent(flex_rating_5) :-
    consistent(s7, flex_rating_5),
    (indep(s10), consistent(s10, flex_rating_5) ; \+indep(s10)).

evidence(all_consistent(flex_rating_5)).
query(true_val(flex_rating_5, v4)).
query(true_val(flex_rating_5, unk_flex_rating_5)).

% @attr flex_description_manufacturer
% @type categorical
% @canonical false
% @original_name Flex description (manufacturer)
% @values powerful_aggressive_stiff=Powerful_aggressive_stiff_flex unk_flex_description_manufacturer=Unknown
% @importance 1.00

0.93::acc(s7, flex_description_manufacturer).

0.95::true_val(flex_description_manufacturer, powerful_aggressive_stiff); 0.05::true_val(flex_description_manufacturer, unk_flex_description_manufacturer).

measured(s7, flex_description_manufacturer, powerful_aggressive_stiff).

all_consistent(flex_description_manufacturer) :-
    consistent(s7, flex_description_manufacturer).

evidence(all_consistent(flex_description_manufacturer)).
query(true_val(flex_description_manufacturer, powerful_aggressive_stiff)).
query(true_val(flex_description_manufacturer, unk_flex_description_manufacturer)).

% @attr flex_rating_10_the_good_ride
% @type categorical
% @canonical true
% @original_name flex_rating_10_the_good_ride
% @values medium_stiff=Medium_Stiff unk_flex_rating_10_the_good_ride=Unknown
% @importance 0.95

0.88::acc(s6, flex_rating_10_the_good_ride).

0.85::true_val(flex_rating_10_the_good_ride, medium_stiff); 0.15::true_val(flex_rating_10_the_good_ride, unk_flex_rating_10_the_good_ride).

measured(s6, flex_rating_10_the_good_ride, medium_stiff).

all_consistent(flex_rating_10_the_good_ride) :-
    consistent(s6, flex_rating_10_the_good_ride).

evidence(all_consistent(flex_rating_10_the_good_ride)).
query(true_val(flex_rating_10_the_good_ride, medium_stiff)).
query(true_val(flex_rating_10_the_good_ride, unk_flex_rating_10_the_good_ride)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name Flex feel (Snowboard Magazine)
% @values versatile_firm_torsionally_flexible=Versatile_stiffness_firm_torsionally_flexible unk_flex_feel=Unknown
% @importance 0.85

0.85::acc(s8, flex_feel).

0.82::true_val(flex_feel, versatile_firm_torsionally_flexible); 0.18::true_val(flex_feel, unk_flex_feel).

measured(s8, flex_feel, versatile_firm_torsionally_flexible).

all_consistent(flex_feel) :-
    consistent(s8, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, versatile_firm_torsionally_flexible)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr construction
% @type categorical
% @canonical false
% @original_name Construction
% @values ntech_2_0=N_Tech_2_0_cap_sandwich_hybrid unk_construction=Unknown
% @importance 0.925

0.95::acc(s7, construction).
0.80::acc(s9, construction).

0.95::true_val(construction, ntech_2_0); 0.05::true_val(construction, unk_construction).

measured(s7, construction, ntech_2_0).
measured(s9, construction, ntech_2_0).

all_consistent(construction) :-
    consistent(s7, construction),
    (indep(s9), consistent(s9, construction) ; \+indep(s9)).

evidence(all_consistent(construction)).
query(true_val(construction, ntech_2_0)).
query(true_val(construction, unk_construction)).

% @attr topsheet_material
% @type categorical
% @canonical false
% @original_name Topsheet
% @values absorbnid=Absorbnid_vibration_absorbing unk_topsheet_material=Unknown
% @importance 1.00

0.95::acc(s7, topsheet_material).

0.95::true_val(topsheet_material, absorbnid); 0.05::true_val(topsheet_material, unk_topsheet_material).

measured(s7, topsheet_material, absorbnid).

all_consistent(topsheet_material) :-
    consistent(s7, topsheet_material).

evidence(all_consistent(topsheet_material)).
query(true_val(topsheet_material, absorbnid)).
query(true_val(topsheet_material, unk_topsheet_material)).

% @attr laminate_fiberglass
% @type categorical
% @canonical false
% @original_name Laminate / fiberglass
% @values triax_plus=Triax_Plus_3_direction_45_degree unk_laminate_fiberglass=Unknown
% @importance 1.00

0.95::acc(s7, laminate_fiberglass).

0.95::true_val(laminate_fiberglass, triax_plus); 0.05::true_val(laminate_fiberglass, unk_laminate_fiberglass).

measured(s7, laminate_fiberglass, triax_plus).

all_consistent(laminate_fiberglass) :-
    consistent(s7, laminate_fiberglass).

evidence(all_consistent(laminate_fiberglass)).
query(true_val(laminate_fiberglass, triax_plus)).
query(true_val(laminate_fiberglass, unk_laminate_fiberglass)).

% @attr core_material
% @type categorical
% @canonical false
% @original_name Core material
% @values mega_core_poplar_paulownia=Mega_Core_poplar_paulownia_glass_stringers unk_core_material=Unknown
% @importance 0.925

0.95::acc(s7, core_material).
0.80::acc(s9, core_material).

0.95::true_val(core_material, mega_core_poplar_paulownia); 0.05::true_val(core_material, unk_core_material).

measured(s7, core_material, mega_core_poplar_paulownia).
measured(s9, core_material, mega_core_poplar_paulownia).

all_consistent(core_material) :-
    consistent(s7, core_material),
    (indep(s9), consistent(s9, core_material) ; \+indep(s9)).

evidence(all_consistent(core_material)).
query(true_val(core_material, mega_core_poplar_paulownia)).
query(true_val(core_material, unk_core_material)).

% @attr carbon_reinforcement
% @type categorical
% @canonical false
% @original_name Carbon reinforcement
% @values carbon_cell_forged=Carbon_Cell_forged_carbon_underfoot unk_carbon_reinforcement=Unknown
% @importance 1.00

0.95::acc(s7, carbon_reinforcement).

0.95::true_val(carbon_reinforcement, carbon_cell_forged); 0.05::true_val(carbon_reinforcement, unk_carbon_reinforcement).

measured(s7, carbon_reinforcement, carbon_cell_forged).

all_consistent(carbon_reinforcement) :-
    consistent(s7, carbon_reinforcement).

evidence(all_consistent(carbon_reinforcement)).
query(true_val(carbon_reinforcement, carbon_cell_forged)).
query(true_val(carbon_reinforcement, unk_carbon_reinforcement)).

% @attr base_material
% @type categorical
% @canonical false
% @original_name Base material
% @values n12000_graphite_sintered=N_12000_Graphite_race_grade_sintered unk_base_material=Unknown
% @importance 1.00

0.95::acc(s7, base_material).

0.95::true_val(base_material, n12000_graphite_sintered); 0.05::true_val(base_material, unk_base_material).

measured(s7, base_material, n12000_graphite_sintered).

all_consistent(base_material) :-
    consistent(s7, base_material).

evidence(all_consistent(base_material)).
query(true_val(base_material, n12000_graphite_sintered)).
query(true_val(base_material, unk_base_material)).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values high_density_sintered_graphite=High_density_sintered_with_graphite unk_base_type=Unknown
% @importance 0.90

0.88::acc(s1, base_type).
0.95::acc(s7, base_type).

0.95::true_val(base_type, high_density_sintered_graphite); 0.05::true_val(base_type, unk_base_type).

measured(s1, base_type, high_density_sintered_graphite).
measured(s7, base_type, high_density_sintered_graphite).

all_consistent(base_type) :-
    consistent(s7, base_type),
    (indep(s1), consistent(s1, base_type) ; \+indep(s1)).

evidence(all_consistent(base_type)).
query(true_val(base_type, high_density_sintered_graphite)).
query(true_val(base_type, unk_base_type)).

% @attr nose_technology
% @type categorical
% @canonical false
% @original_name Nose technology
% @values zero_g_nose_forged_carbon=Zero_G_Nose_forged_carbon_no_wood unk_nose_technology=Unknown
% @importance 1.00

0.95::acc(s7, nose_technology).

0.95::true_val(nose_technology, zero_g_nose_forged_carbon); 0.05::true_val(nose_technology, unk_nose_technology).

measured(s7, nose_technology, zero_g_nose_forged_carbon).

all_consistent(nose_technology) :-
    consistent(s7, nose_technology).

evidence(all_consistent(nose_technology)).
query(true_val(nose_technology, zero_g_nose_forged_carbon)).
query(true_val(nose_technology, unk_nose_technology)).

% @attr underfoot_cushioning
% @type categorical
% @canonical false
% @original_name Underfoot cushioning
% @values orbital_cushioning_tpu=Orbital_Cushioning_TPU_impact_absorbing unk_underfoot_cushioning=Unknown
% @importance 1.00

0.95::acc(s7, underfoot_cushioning).

0.95::true_val(underfoot_cushioning, orbital_cushioning_tpu); 0.05::true_val(underfoot_cushioning, unk_underfoot_cushioning).

measured(s7, underfoot_cushioning, orbital_cushioning_tpu).

all_consistent(underfoot_cushioning) :-
    consistent(s7, underfoot_cushioning).

evidence(all_consistent(underfoot_cushioning)).
query(true_val(underfoot_cushioning, orbital_cushioning_tpu)).
query(true_val(underfoot_cushioning, unk_underfoot_cushioning)).

% @attr edge_reinforcement
% @type categorical
% @canonical false
% @original_name Edge reinforcement
% @values titanium_boosters=Titanium_Boosters_underfoot_power_transfer unk_edge_reinforcement=Unknown
% @importance 1.00

0.95::acc(s7, edge_reinforcement).

0.95::true_val(edge_reinforcement, titanium_boosters); 0.05::true_val(edge_reinforcement, unk_edge_reinforcement).

measured(s7, edge_reinforcement, titanium_boosters).

all_consistent(edge_reinforcement) :-
    consistent(s7, edge_reinforcement).

evidence(all_consistent(edge_reinforcement)).
query(true_val(edge_reinforcement, titanium_boosters)).
query(true_val(edge_reinforcement, unk_edge_reinforcement)).

% @attr tail_technology
% @type categorical
% @canonical false
% @original_name Tail technology
% @values pow_diffuser_3d_channels=Pow_Diffuser_3D_channels unk_tail_technology=Unknown
% @importance 1.00

0.95::acc(s7, tail_technology).

0.95::true_val(tail_technology, pow_diffuser_3d_channels); 0.05::true_val(tail_technology, unk_tail_technology).

measured(s7, tail_technology, pow_diffuser_3d_channels).

all_consistent(tail_technology) :-
    consistent(s7, tail_technology).

evidence(all_consistent(tail_technology)).
query(true_val(tail_technology, pow_diffuser_3d_channels)).
query(true_val(tail_technology, unk_tail_technology)).

% @attr core_milling
% @type categorical
% @canonical false
% @original_name Core milling
% @values v3dn_concept=3DN_Concept_3D_milled_core unk_core_milling=Unknown
% @importance 1.00

0.95::acc(s7, core_milling).

0.95::true_val(core_milling, v3dn_concept); 0.05::true_val(core_milling, unk_core_milling).

measured(s7, core_milling, v3dn_concept).

all_consistent(core_milling) :-
    consistent(s7, core_milling).

evidence(all_consistent(core_milling)).
query(true_val(core_milling, v3dn_concept)).
query(true_val(core_milling, unk_core_milling)).

% @attr insert_configuration
% @type categorical
% @canonical false
% @original_name Insert configuration
% @values v2x4_6plus1=2x4_6_plus_1_inserts_extra_setback unk_insert_configuration=Unknown
% @importance 1.00

0.95::acc(s7, insert_configuration).

0.95::true_val(insert_configuration, v2x4_6plus1); 0.05::true_val(insert_configuration, unk_insert_configuration).

measured(s7, insert_configuration, v2x4_6plus1).

all_consistent(insert_configuration) :-
    consistent(s7, insert_configuration).

evidence(all_consistent(insert_configuration)).
query(true_val(insert_configuration, v2x4_6plus1)).
query(true_val(insert_configuration, unk_insert_configuration)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 0.95

0.88::acc(s1, mounting_pattern).
0.95::acc(s7, mounting_pattern).

0.95::true_val(mounting_pattern, inserts_2x4); 0.05::true_val(mounting_pattern, unk_mounting_pattern).

measured(s1, mounting_pattern, inserts_2x4).
measured(s7, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :-
    consistent(s7, mounting_pattern),
    (indep(s1), consistent(s1, mounting_pattern) ; \+indep(s1)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values universal=Works_with_any_binding unk_binding_compatibility=Unknown
% @importance 0.85

0.80::acc(s9, binding_compatibility).

0.85::true_val(binding_compatibility, universal); 0.15::true_val(binding_compatibility, unk_binding_compatibility).

measured(s9, binding_compatibility, universal).

all_consistent(binding_compatibility) :-
    (indep(s9), consistent(s9, binding_compatibility) ; \+indep(s9)).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, universal)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

% @attr base_finish_features
% @type categorical
% @canonical false
% @original_name Base finish features
% @values matte_overprint_translucent_diecut=Matte_Overprint_Translucent_Diecut unk_base_finish_features=Unknown
% @importance 0.65

0.78::acc(s13, base_finish_features).

0.80::true_val(base_finish_features, matte_overprint_translucent_diecut); 0.20::true_val(base_finish_features, unk_base_finish_features).

measured(s13, base_finish_features, matte_overprint_translucent_diecut).

all_consistent(base_finish_features) :-
    (indep(s13), consistent(s13, base_finish_features) ; \+indep(s13)).

evidence(all_consistent(base_finish_features)).
query(true_val(base_finish_features, matte_overprint_translucent_diecut)).
query(true_val(base_finish_features, unk_base_finish_features)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values v152_158_164w=152_158_164W unk_available_sizes=Unknown
% @importance 1.00

0.95::acc(s7, available_sizes).
0.85::acc(s8, available_sizes).

0.95::true_val(available_sizes, v152_158_164w); 0.05::true_val(available_sizes, unk_available_sizes).

measured(s7, available_sizes, v152_158_164w).
measured(s8, available_sizes, v152_158_164w).

all_consistent(available_sizes) :-
    consistent(s7, available_sizes),
    consistent(s8, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, v152_158_164w)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size
% @unit kg
% @values v65_90=65-90kg_145-200lbs unk_recommended_weight_range_size=Unknown
% @importance 1.00

0.95::acc(s7, recommended_weight_range_size).

0.95::true_val(recommended_weight_range_size, v65_90); 0.05::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s7, recommended_weight_range_size, v65_90).

all_consistent(recommended_weight_range_size) :-
    consistent(s7, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, v65_90)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr recommended_weight_range_size_152
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (152)
% @unit kg
% @values v55_80=55-80kg_120-175lbs unk_recommended_weight_range_size_152=Unknown
% @importance 1.00

0.95::acc(s7, recommended_weight_range_size_152).

0.95::true_val(recommended_weight_range_size_152, v55_80); 0.05::true_val(recommended_weight_range_size_152, unk_recommended_weight_range_size_152).

measured(s7, recommended_weight_range_size_152, v55_80).

all_consistent(recommended_weight_range_size_152) :-
    consistent(s7, recommended_weight_range_size_152).

evidence(all_consistent(recommended_weight_range_size_152)).
query(true_val(recommended_weight_range_size_152, v55_80)).
query(true_val(recommended_weight_range_size_152, unk_recommended_weight_range_size_152)).

% @attr recommended_binding_size_152
% @type categorical
% @canonical false
% @original_name Recommended binding size 152
% @values m_l=M-L unk_recommended_binding_size_152=Unknown
% @importance 1.00

0.95::acc(s7, recommended_binding_size_152).

0.95::true_val(recommended_binding_size_152, m_l); 0.05::true_val(recommended_binding_size_152, unk_recommended_binding_size_152).

measured(s7, recommended_binding_size_152, m_l).

all_consistent(recommended_binding_size_152) :-
    consistent(s7, recommended_binding_size_152).

evidence(all_consistent(recommended_binding_size_152)).
query(true_val(recommended_binding_size_152, m_l)).
query(true_val(recommended_binding_size_152, unk_recommended_binding_size_152)).

% @attr total_length_152
% @type numeric
% @canonical false
% @original_name Total length 152
% @unit mm
% @values v1520=1520.0 unk_total_length_152=Unknown
% @importance 1.00

0.95::acc(s7, total_length_152).

0.95::true_val(total_length_152, v1520); 0.05::true_val(total_length_152, unk_total_length_152).

measured(s7, total_length_152, v1520).

all_consistent(total_length_152) :-
    consistent(s7, total_length_152).

evidence(all_consistent(total_length_152)).
query(true_val(total_length_152, v1520)).
query(true_val(total_length_152, unk_total_length_152)).

% @attr contact_length_size_152
% @type numeric
% @canonical false
% @original_name contact_length_size (152)
% @unit mm
% @values v1030=1030.0 unk_contact_length_size_152=Unknown
% @importance 1.00

0.95::acc(s7, contact_length_size_152).

0.95::true_val(contact_length_size_152, v1030); 0.05::true_val(contact_length_size_152, unk_contact_length_size_152).

measured(s7, contact_length_size_152, v1030).

all_consistent(contact_length_size_152) :-
    consistent(s7, contact_length_size_152).

evidence(all_consistent(contact_length_size_152)).
query(true_val(contact_length_size_152, v1030)).
query(true_val(contact_length_size_152, unk_contact_length_size_152)).

% @attr effective_edge_152
% @type numeric
% @canonical false
% @original_name Effective edge 152
% @unit mm
% @values v1130=1130.0 unk_effective_edge_152=Unknown
% @importance 1.00

0.95::acc(s7, effective_edge_152).
0.60::acc(s1, effective_edge_152).

0.95::true_val(effective_edge_152, v1130); 0.05::true_val(effective_edge_152, unk_effective_edge_152).

measured(s7, effective_edge_152, v1130).
measured(s1, effective_edge_152, v1130).

all_consistent(effective_edge_152) :-
    consistent(s7, effective_edge_152),
    (indep(s1), consistent(s1, effective_edge_152) ; \+indep(s1)).

evidence(all_consistent(effective_edge_152)).
query(true_val(effective_edge_152, v1130)).
query(true_val(effective_edge_152, unk_effective_edge_152)).

% @attr tail_length_152
% @type numeric
% @canonical false
% @original_name Tail length 152
% @unit mm
% @values v205=205.0 unk_tail_length_152=Unknown
% @importance 1.00

0.95::acc(s7, tail_length_152).

0.95::true_val(tail_length_152, v205); 0.05::true_val(tail_length_152, unk_tail_length_152).

measured(s7, tail_length_152, v205).

all_consistent(tail_length_152) :-
    consistent(s7, tail_length_152).

evidence(all_consistent(tail_length_152)).
query(true_val(tail_length_152, v205)).
query(true_val(tail_length_152, unk_tail_length_152)).

% @attr sidecut_radius_size_152
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (152)
% @unit m
% @values v7_6=7.6 unk_sidecut_radius_size_152=Unknown
% @importance 1.00

0.95::acc(s7, sidecut_radius_size_152).

0.95::true_val(sidecut_radius_size_152, v7_6); 0.05::true_val(sidecut_radius_size_152, unk_sidecut_radius_size_152).

measured(s7, sidecut_radius_size_152, v7_6).

all_consistent(sidecut_radius_size_152) :-
    consistent(s7, sidecut_radius_size_152).

evidence(all_consistent(sidecut_radius_size_152)).
query(true_val(sidecut_radius_size_152, v7_6)).
query(true_val(sidecut_radius_size_152, unk_sidecut_radius_size_152)).

% @attr waist_width_152
% @type numeric
% @canonical false
% @original_name Waist width 152
% @unit mm
% @values v252=252.0 unk_waist_width_152=Unknown
% @importance 1.00

0.95::acc(s7, waist_width_152).

0.95::true_val(waist_width_152, v252); 0.05::true_val(waist_width_152, unk_waist_width_152).

measured(s7, waist_width_152, v252).

all_consistent(waist_width_152) :-
    consistent(s7, waist_width_152).

evidence(all_consistent(waist_width_152)).
query(true_val(waist_width_152, v252)).
query(true_val(waist_width_152, unk_waist_width_152)).

% @attr underfoot_width_front_152
% @type numeric
% @canonical false
% @original_name Underfoot width front foot 152
% @unit mm
% @values v262=262.0 unk_underfoot_width_front_152=Unknown
% @importance 1.00

0.95::acc(s7, underfoot_width_front_152).

0.95::true_val(underfoot_width_front_152, v262); 0.05::true_val(underfoot_width_front_152, unk_underfoot_width_front_152).

measured(s7, underfoot_width_front_152, v262).

all_consistent(underfoot_width_front_152) :-
    consistent(s7, underfoot_width_front_152).

evidence(all_consistent(underfoot_width_front_152)).
query(true_val(underfoot_width_front_152, v262)).
query(true_val(underfoot_width_front_152, unk_underfoot_width_front_152)).

% @attr underfoot_width_rear_152
% @type numeric
% @canonical false
% @original_name Underfoot width rear foot 152
% @unit mm
% @values v260=260.0 unk_underfoot_width_rear_152=Unknown
% @importance 1.00

0.95::acc(s7, underfoot_width_rear_152).

0.95::true_val(underfoot_width_rear_152, v260); 0.05::true_val(underfoot_width_rear_152, unk_underfoot_width_rear_152).

measured(s7, underfoot_width_rear_152, v260).

all_consistent(underfoot_width_rear_152) :-
    consistent(s7, underfoot_width_rear_152).

evidence(all_consistent(underfoot_width_rear_152)).
query(true_val(underfoot_width_rear_152, v260)).
query(true_val(underfoot_width_rear_152, unk_underfoot_width_rear_152)).

% @attr tip_tail_width_size_152
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (152)
% @unit mm
% @values v281=281.0 unk_tip_tail_width_size_152=Unknown
% @importance 1.00

0.95::acc(s7, tip_tail_width_size_152).

0.95::true_val(tip_tail_width_size_152, v281); 0.05::true_val(tip_tail_width_size_152, unk_tip_tail_width_size_152).

measured(s7, tip_tail_width_size_152, v281).

all_consistent(tip_tail_width_size_152) :-
    consistent(s7, tip_tail_width_size_152).

evidence(all_consistent(tip_tail_width_size_152)).
query(true_val(tip_tail_width_size_152, v281)).
query(true_val(tip_tail_width_size_152, unk_tip_tail_width_size_152)).

% @attr taper
% @type numeric
% @canonical true
% @original_name taper
% @unit mm
% @values v14=14.0 unk_taper=Unknown
% @importance 1.00

0.95::acc(s7, taper).

0.95::true_val(taper, v14); 0.05::true_val(taper, unk_taper).

measured(s7, taper, v14).

all_consistent(taper) :-
    consistent(s7, taper).

evidence(all_consistent(taper)).
query(true_val(taper, v14)).
query(true_val(taper, unk_taper)).

% @attr setback
% @type numeric
% @canonical true
% @original_name setback
% @unit mm
% @values v30=30.0 unk_setback=Unknown
% @importance 1.00

0.95::acc(s7, setback).

0.95::true_val(setback, v30); 0.05::true_val(setback, unk_setback).

measured(s7, setback, v30).

all_consistent(setback) :-
    consistent(s7, setback).

evidence(all_consistent(setback)).
query(true_val(setback, v30)).
query(true_val(setback, unk_setback)).

% @attr stance_width_range_size_ref_152
% @type numeric
% @canonical false
% @original_name stance_width_range_size (152 reference)
% @unit mm
% @values v520=520.0 unk_stance_width_range_size_ref_152=Unknown
% @importance 1.00

0.95::acc(s7, stance_width_range_size_ref_152).

0.95::true_val(stance_width_range_size_ref_152, v520); 0.05::true_val(stance_width_range_size_ref_152, unk_stance_width_range_size_ref_152).

measured(s7, stance_width_range_size_ref_152, v520).

all_consistent(stance_width_range_size_ref_152) :-
    consistent(s7, stance_width_range_size_ref_152).

evidence(all_consistent(stance_width_range_size_ref_152)).
query(true_val(stance_width_range_size_ref_152, v520)).
query(true_val(stance_width_range_size_ref_152, unk_stance_width_range_size_ref_152)).

% @attr stance_width_range_size_152
% @type categorical
% @canonical false
% @original_name stance_width_range_size (152 range)
% @unit mm
% @values v480_600=480-600mm unk_stance_width_range_size_152=Unknown
% @importance 1.00

0.95::acc(s7, stance_width_range_size_152).

0.95::true_val(stance_width_range_size_152, v480_600); 0.05::true_val(stance_width_range_size_152, unk_stance_width_range_size_152).

measured(s7, stance_width_range_size_152, v480_600).

all_consistent(stance_width_range_size_152) :-
    consistent(s7, stance_width_range_size_152).

evidence(all_consistent(stance_width_range_size_152)).
query(true_val(stance_width_range_size_152, v480_600)).
query(true_val(stance_width_range_size_152, unk_stance_width_range_size_152)).

% @attr boot_size_recommendation_152
% @type categorical
% @canonical false
% @original_name Boot size recommendation 152 (The Good Ride)
% @values us_8_9=US_8-9 unk_boot_size_recommendation_152=Unknown
% @importance 0.95

0.85::acc(s6, boot_size_recommendation_152).

0.82::true_val(boot_size_recommendation_152, us_8_9); 0.18::true_val(boot_size_recommendation_152, unk_boot_size_recommendation_152).

measured(s6, boot_size_recommendation_152, us_8_9).

all_consistent(boot_size_recommendation_152) :-
    consistent(s6, boot_size_recommendation_152).

evidence(all_consistent(boot_size_recommendation_152)).
query(true_val(boot_size_recommendation_152, us_8_9)).
query(true_val(boot_size_recommendation_152, unk_boot_size_recommendation_152)).

% @attr recommended_weight_range_size_164w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (164W)
% @unit kg
% @values v80_plus=80plus_kg_176plus_lbs unk_recommended_weight_range_size_164w=Unknown
% @importance 1.00

0.95::acc(s7, recommended_weight_range_size_164w).

0.95::true_val(recommended_weight_range_size_164w, v80_plus); 0.05::true_val(recommended_weight_range_size_164w, unk_recommended_weight_range_size_164w).

measured(s7, recommended_weight_range_size_164w, v80_plus).

all_consistent(recommended_weight_range_size_164w) :-
    consistent(s7, recommended_weight_range_size_164w).

evidence(all_consistent(recommended_weight_range_size_164w)).
query(true_val(recommended_weight_range_size_164w, v80_plus)).
query(true_val(recommended_weight_range_size_164w, unk_recommended_weight_range_size_164w)).

% @attr recommended_binding_size_158
% @type categorical
% @canonical false
% @original_name Recommended binding size 158
% @values m_l=M-L unk_recommended_binding_size_158=Unknown
% @importance 1.00

0.95::acc(s7, recommended_binding_size_158).

0.95::true_val(recommended_binding_size_158, m_l_158); 0.05::true_val(recommended_binding_size_158, unk_recommended_binding_size_158).

measured(s7, recommended_binding_size_158, m_l_158).

all_consistent(recommended_binding_size_158) :-
    consistent(s7, recommended_binding_size_158).

evidence(all_consistent(recommended_binding_size_158)).
query(true_val(recommended_binding_size_158, m_l_158)).
query(true_val(recommended_binding_size_158, unk_recommended_binding_size_158)).

% @attr total_length_158
% @type numeric
% @canonical false
% @original_name Total length 158
% @unit mm
% @values v1580=1580.0 unk_total_length_158=Unknown
% @importance 1.00

0.95::acc(s7, total_length_158).

0.95::true_val(total_length_158, v1580); 0.05::true_val(total_length_158, unk_total_length_158).

measured(s7, total_length_158, v1580).

all_consistent(total_length_158) :-
    consistent(s7, total_length_158).

evidence(all_consistent(total_length_158)).
query(true_val(total_length_158, v1580)).
query(true_val(total_length_158, unk_total_length_158)).

% @attr contact_length_size
% @type numeric
% @canonical true
% @original_name contact_length_size
% @unit mm
% @values v1090=1090.0 unk_contact_length_size=Unknown
% @importance 1.00

0.95::acc(s7, contact_length_size).

0.95::true_val(contact_length_size, v1090); 0.05::true_val(contact_length_size, unk_contact_length_size).

measured(s7, contact_length_size, v1090).

all_consistent(contact_length_size) :-
    consistent(s7, contact_length_size).

evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v1090)).
query(true_val(contact_length_size, unk_contact_length_size)).

% @attr effective_edge_158
% @type numeric
% @canonical false
% @original_name Effective edge 158
% @unit mm
% @values v1190=1190.0 unk_effective_edge_158=Unknown
% @importance 1.00

0.95::acc(s7, effective_edge_158).

0.95::true_val(effective_edge_158, v1190); 0.05::true_val(effective_edge_158, unk_effective_edge_158).

measured(s7, effective_edge_158, v1190).

all_consistent(effective_edge_158) :-
    consistent(s7, effective_edge_158).

evidence(all_consistent(effective_edge_158)).
query(true_val(effective_edge_158, v1190)).
query(true_val(effective_edge_158, unk_effective_edge_158)).

% @attr tail_length_158
% @type numeric
% @canonical false
% @original_name Tail length 158
% @unit mm
% @values v205=205.0 unk_tail_length_158=Unknown
% @importance 1.00

0.95::acc(s7, tail_length_158).

0.95::true_val(tail_length_158, v205_158); 0.05::true_val(tail_length_158, unk_tail_length_158).

measured(s7, tail_length_158, v205_158).

all_consistent(tail_length_158) :-
    consistent(s7, tail_length_158).

evidence(all_consistent(tail_length_158)).
query(true_val(tail_length_158, v205_158)).
query(true_val(tail_length_158, unk_tail_length_158)).

% @attr sidecut_radius_size
% @type numeric
% @canonical true
% @original_name sidecut_radius_size
% @unit m
% @values v7_8=7.8 unk_sidecut_radius_size=Unknown
% @importance 1.00

0.95::acc(s7, sidecut_radius_size).

0.95::true_val(sidecut_radius_size, v7_8); 0.05::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s7, sidecut_radius_size, v7_8).

all_consistent(sidecut_radius_size) :-
    consistent(s7, sidecut_radius_size).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_8)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr waist_width_158
% @type numeric
% @canonical false
% @original_name Waist width 158
% @unit mm
% @values v258=258.0 unk_waist_width_158=Unknown
% @importance 1.00

0.95::acc(s7, waist_width_158).

0.95::true_val(waist_width_158, v258); 0.05::true_val(waist_width_158, unk_waist_width_158).

measured(s7, waist_width_158, v258).

all_consistent(waist_width_158) :-
    consistent(s7, waist_width_158).

evidence(all_consistent(waist_width_158)).
query(true_val(waist_width_158, v258)).
query(true_val(waist_width_158, unk_waist_width_158)).

% @attr underfoot_width_front_158
% @type numeric
% @canonical false
% @original_name Underfoot width front foot 158
% @unit mm
% @values v270=270.0 unk_underfoot_width_front_158=Unknown
% @importance 1.00

0.95::acc(s7, underfoot_width_front_158).

0.95::true_val(underfoot_width_front_158, v270); 0.05::true_val(underfoot_width_front_158, unk_underfoot_width_front_158).

measured(s7, underfoot_width_front_158, v270).

all_consistent(underfoot_width_front_158) :-
    consistent(s7, underfoot_width_front_158).

evidence(all_consistent(underfoot_width_front_158)).
query(true_val(underfoot_width_front_158, v270)).
query(true_val(underfoot_width_front_158, unk_underfoot_width_front_158)).

% @attr underfoot_width_rear_158
% @type numeric
% @canonical false
% @original_name Underfoot width rear foot 158
% @unit mm
% @values v265=265.0 unk_underfoot_width_rear_158=Unknown
% @importance 1.00

0.95::acc(s7, underfoot_width_rear_158).

0.95::true_val(underfoot_width_rear_158, v265); 0.05::true_val(underfoot_width_rear_158, unk_underfoot_width_rear_158).

measured(s7, underfoot_width_rear_158, v265).

all_consistent(underfoot_width_rear_158) :-
    consistent(s7, underfoot_width_rear_158).

evidence(all_consistent(underfoot_width_rear_158)).
query(true_val(underfoot_width_rear_158, v265)).
query(true_val(underfoot_width_rear_158, unk_underfoot_width_rear_158)).

% @attr tip_tail_width_size
% @type numeric
% @canonical true
% @original_name tip_tail_width_size
% @unit mm
% @values v290=290.0 unk_tip_tail_width_size=Unknown
% @importance 1.00

0.95::acc(s7, tip_tail_width_size).

0.95::true_val(tip_tail_width_size, v290); 0.05::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s7, tip_tail_width_size, v290).

all_consistent(tip_tail_width_size) :-
    consistent(s7, tip_tail_width_size).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v290)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr stance_width_range_size
% @type numeric
% @canonical true
% @original_name stance_width_range_size
% @unit mm
% @values v560=560.0 unk_stance_width_range_size=Unknown
% @importance 1.00

0.95::acc(s7, stance_width_range_size).

0.95::true_val(stance_width_range_size, v560); 0.05::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s7, stance_width_range_size, v560).

all_consistent(stance_width_range_size) :-
    consistent(s7, stance_width_range_size).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v560)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr stance_width_range_size_range_158
% @type categorical
% @canonical false
% @original_name stance_width_range_size (158 range)
% @unit mm
% @values v520_640=520-640mm unk_stance_width_range_size_range_158=Unknown
% @importance 1.00

0.95::acc(s7, stance_width_range_size_range_158).

0.95::true_val(stance_width_range_size_range_158, v520_640); 0.05::true_val(stance_width_range_size_range_158, unk_stance_width_range_size_range_158).

measured(s7, stance_width_range_size_range_158, v520_640).

all_consistent(stance_width_range_size_range_158) :-
    consistent(s7, stance_width_range_size_range_158).

evidence(all_consistent(stance_width_range_size_range_158)).
query(true_val(stance_width_range_size_range_158, v520_640)).
query(true_val(stance_width_range_size_range_158, unk_stance_width_range_size_range_158)).

% @attr boot_size_recommendation_158
% @type categorical
% @canonical false
% @original_name Boot size recommendation 158 (The Good Ride)
% @values us_9_10=US_9-10 unk_boot_size_recommendation_158=Unknown
% @importance 0.95

0.85::acc(s6, boot_size_recommendation_158).

0.82::true_val(boot_size_recommendation_158, us_9_10); 0.18::true_val(boot_size_recommendation_158, unk_boot_size_recommendation_158).

measured(s6, boot_size_recommendation_158, us_9_10).

all_consistent(boot_size_recommendation_158) :-
    consistent(s6, boot_size_recommendation_158).

evidence(all_consistent(boot_size_recommendation_158)).
query(true_val(boot_size_recommendation_158, us_9_10)).
query(true_val(boot_size_recommendation_158, unk_boot_size_recommendation_158)).

% @attr recommended_binding_size_164w
% @type categorical
% @canonical false
% @original_name Recommended binding size 164W
% @values l_xl=L-XL unk_recommended_binding_size_164w=Unknown
% @importance 1.00

0.95::acc(s7, recommended_binding_size_164w).

0.95::true_val(recommended_binding_size_164w, l_xl); 0.05::true_val(recommended_binding_size_164w, unk_recommended_binding_size_164w).

measured(s7, recommended_binding_size_164w, l_xl).

all_consistent(recommended_binding_size_164w) :-
    consistent(s7, recommended_binding_size_164w).

evidence(all_consistent(recommended_binding_size_164w)).
query(true_val(recommended_binding_size_164w, l_xl)).
query(true_val(recommended_binding_size_164w, unk_recommended_binding_size_164w)).

% @attr total_length_164w
% @type numeric
% @canonical false
% @original_name Total length 164W
% @unit mm
% @values v1640=1640.0 unk_total_length_164w=Unknown
% @importance 1.00

0.95::acc(s7, total_length_164w).

0.95::true_val(total_length_164w, v1640); 0.05::true_val(total_length_164w, unk_total_length_164w).

measured(s7, total_length_164w, v1640).

all_consistent(total_length_164w) :-
    consistent(s7, total_length_164w).

evidence(all_consistent(total_length_164w)).
query(true_val(total_length_164w, v1640)).
query(true_val(total_length_164w, unk_total_length_164w)).

% @attr contact_length_size_164w
% @type numeric
% @canonical false
% @original_name contact_length_size (164W)
% @unit mm
% @values v1150=1150.0 unk_contact_length_size_164w=Unknown
% @importance 1.00

0.95::acc(s7, contact_length_size_164w).

0.95::true_val(contact_length_size_164w, v1150); 0.05::true_val(contact_length_size_164w, unk_contact_length_size_164w).

measured(s7, contact_length_size_164w, v1150).

all_consistent(contact_length_size_164w) :-
    consistent(s7, contact_length_size_164w).

evidence(all_consistent(contact_length_size_164w)).
query(true_val(contact_length_size_164w, v1150)).
query(true_val(contact_length_size_164w, unk_contact_length_size_164w)).

% @attr effective_edge_164w
% @type numeric
% @canonical false
% @original_name Effective edge 164W
% @unit mm
% @values v1250=1250.0 unk_effective_edge_164w=Unknown
% @importance 1.00

0.95::acc(s7, effective_edge_164w).

0.95::true_val(effective_edge_164w, v1250); 0.05::true_val(effective_edge_164w, unk_effective_edge_164w).

measured(s7, effective_edge_164w, v1250).

all_consistent(effective_edge_164w) :-
    consistent(s7, effective_edge_164w).

evidence(all_consistent(effective_edge_164w)).
query(true_val(effective_edge_164w, v1250)).
query(true_val(effective_edge_164w, unk_effective_edge_164w)).

% @attr tail_length_164w
% @type numeric
% @canonical false
% @original_name Tail length 164W
% @unit mm
% @values v205=205.0 unk_tail_length_164w=Unknown
% @importance 1.00

0.95::acc(s7, tail_length_164w).

0.95::true_val(tail_length_164w, v205_164w); 0.05::true_val(tail_length_164w, unk_tail_length_164w).

measured(s7, tail_length_164w, v205_164w).

all_consistent(tail_length_164w) :-
    consistent(s7, tail_length_164w).

evidence(all_consistent(tail_length_164w)).
query(true_val(tail_length_164w, v205_164w)).
query(true_val(tail_length_164w, unk_tail_length_164w)).

% @attr sidecut_radius_size_164w
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (164W)
% @unit m
% @values v8_0=8.0 unk_sidecut_radius_size_164w=Unknown
% @importance 1.00

0.95::acc(s7, sidecut_radius_size_164w).

0.95::true_val(sidecut_radius_size_164w, v8_0); 0.05::true_val(sidecut_radius_size_164w, unk_sidecut_radius_size_164w).

measured(s7, sidecut_radius_size_164w, v8_0).

all_consistent(sidecut_radius_size_164w) :-
    consistent(s7, sidecut_radius_size_164w).

evidence(all_consistent(sidecut_radius_size_164w)).
query(true_val(sidecut_radius_size_164w, v8_0)).
query(true_val(sidecut_radius_size_164w, unk_sidecut_radius_size_164w)).

% @attr waist_width_164w
% @type numeric
% @canonical false
% @original_name Waist width 164W
% @unit mm
% @values v272=272.0 unk_waist_width_164w=Unknown
% @importance 1.00

0.95::acc(s7, waist_width_164w).

0.95::true_val(waist_width_164w, v272); 0.05::true_val(waist_width_164w, unk_waist_width_164w).

measured(s7, waist_width_164w, v272).

all_consistent(waist_width_164w) :-
    consistent(s7, waist_width_164w).

evidence(all_consistent(waist_width_164w)).
query(true_val(waist_width_164w, v272)).
query(true_val(waist_width_164w, unk_waist_width_164w)).

% @attr underfoot_width_front_164w
% @type numeric
% @canonical false
% @original_name Underfoot width front foot 164W
% @unit mm
% @values v285=285.0 unk_underfoot_width_front_164w=Unknown
% @importance 1.00

0.95::acc(s7, underfoot_width_front_164w).

0.95::true_val(underfoot_width_front_164w, v285); 0.05::true_val(underfoot_width_front_164w, unk_underfoot_width_front_164w).

measured(s7, underfoot_width_front_164w, v285).

all_consistent(underfoot_width_front_164w) :-
    consistent(s7, underfoot_width_front_164w).

evidence(all_consistent(underfoot_width_front_164w)).
query(true_val(underfoot_width_front_164w, v285)).
query(true_val(underfoot_width_front_164w, unk_underfoot_width_front_164w)).

% @attr underfoot_width_rear_164w
% @type numeric
% @canonical false
% @original_name Underfoot width rear foot 164W
% @unit mm
% @values v280=280.0 unk_underfoot_width_rear_164w=Unknown
% @importance 1.00

0.95::acc(s7, underfoot_width_rear_164w).

0.95::true_val(underfoot_width_rear_164w, v280); 0.05::true_val(underfoot_width_rear_164w, unk_underfoot_width_rear_164w).

measured(s7, underfoot_width_rear_164w, v280).

all_consistent(underfoot_width_rear_164w) :-
    consistent(s7, underfoot_width_rear_164w).

evidence(all_consistent(underfoot_width_rear_164w)).
query(true_val(underfoot_width_rear_164w, v280)).
query(true_val(underfoot_width_rear_164w, unk_underfoot_width_rear_164w)).

% @attr tip_tail_width_size_164w
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (164W)
% @unit mm
% @values v306=306.0 unk_tip_tail_width_size_164w=Unknown
% @importance 1.00

0.95::acc(s7, tip_tail_width_size_164w).

0.95::true_val(tip_tail_width_size_164w, v306); 0.05::true_val(tip_tail_width_size_164w, unk_tip_tail_width_size_164w).

measured(s7, tip_tail_width_size_164w, v306).

all_consistent(tip_tail_width_size_164w) :-
    consistent(s7, tip_tail_width_size_164w).

evidence(all_consistent(tip_tail_width_size_164w)).
query(true_val(tip_tail_width_size_164w, v306)).
query(true_val(tip_tail_width_size_164w, unk_tip_tail_width_size_164w)).

% @attr stance_width_range_size_ref_164w
% @type numeric
% @canonical false
% @original_name stance_width_range_size (164W reference)
% @unit mm
% @values v580=580.0 unk_stance_width_range_size_ref_164w=Unknown
% @importance 1.00

0.95::acc(s7, stance_width_range_size_ref_164w).

0.95::true_val(stance_width_range_size_ref_164w, v580); 0.05::true_val(stance_width_range_size_ref_164w, unk_stance_width_range_size_ref_164w).

measured(s7, stance_width_range_size_ref_164w, v580).

all_consistent(stance_width_range_size_ref_164w) :-
    consistent(s7, stance_width_range_size_ref_164w).

evidence(all_consistent(stance_width_range_size_ref_164w)).
query(true_val(stance_width_range_size_ref_164w, v580)).
query(true_val(stance_width_range_size_ref_164w, unk_stance_width_range_size_ref_164w)).

% @attr stance_width_range_size_range_164w
% @type categorical
% @canonical false
% @original_name stance_width_range_size (164W range)
% @unit mm
% @values v540_660=540-660mm unk_stance_width_range_size_range_164w=Unknown
% @importance 1.00

0.95::acc(s7, stance_width_range_size_range_164w).

0.95::true_val(stance_width_range_size_range_164w, v540_660); 0.05::true_val(stance_width_range_size_range_164w, unk_stance_width_range_size_range_164w).

measured(s7, stance_width_range_size_range_164w, v540_660).

all_consistent(stance_width_range_size_range_164w) :-
    consistent(s7, stance_width_range_size_range_164w).

evidence(all_consistent(stance_width_range_size_range_164w)).
query(true_val(stance_width_range_size_range_164w, v540_660)).
query(true_val(stance_width_range_size_range_164w, unk_stance_width_range_size_range_164w)).

% @attr boot_size_recommendation_164w
% @type categorical
% @canonical false
% @original_name Boot size recommendation 164W (The Good Ride)
% @values us_11_12=US_11-12 unk_boot_size_recommendation_164w=Unknown
% @importance 0.95

0.85::acc(s6, boot_size_recommendation_164w).

0.82::true_val(boot_size_recommendation_164w, us_11_12); 0.18::true_val(boot_size_recommendation_164w, unk_boot_size_recommendation_164w).

measured(s6, boot_size_recommendation_164w, us_11_12).

all_consistent(boot_size_recommendation_164w) :-
    consistent(s6, boot_size_recommendation_164w).

evidence(all_consistent(boot_size_recommendation_164w)).
query(true_val(boot_size_recommendation_164w, us_11_12)).
query(true_val(boot_size_recommendation_164w, unk_boot_size_recommendation_164w)).

% @attr width_options
% @type categorical
% @canonical true
% @original_name width_options
% @values standard_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 0.90

0.85::acc(s1, width_options).

0.90::true_val(width_options, standard_wide); 0.10::true_val(width_options, unk_width_options).

measured(s1, width_options, standard_wide).

all_consistent(width_options) :-
    (indep(s1), consistent(s1, width_options) ; \+indep(s1)).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_wide)).
query(true_val(width_options, unk_width_options)).

% @attr only_three_sizes
% @type categorical
% @canonical false
% @original_name Only three sizes available
% @values three_sizes_only=Only_152_158_164W unk_only_three_sizes=Unknown
% @importance 0.875

0.85::acc(s6, only_three_sizes).

0.82::true_val(only_three_sizes, three_sizes_only); 0.18::true_val(only_three_sizes, unk_only_three_sizes).

measured(s6, only_three_sizes, three_sizes_only).

all_consistent(only_three_sizes) :-
    consistent(s6, only_three_sizes).

evidence(all_consistent(only_three_sizes)).
query(true_val(only_three_sizes, three_sizes_only)).
query(true_val(only_three_sizes, unk_only_three_sizes)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v849_95=849.95 unk_price_usd_msrp=Unknown
% @importance 0.825

0.93::acc(s7, price_usd_msrp).
0.85::acc(s8, price_usd_msrp).
0.80::acc(s16, price_usd_msrp).

0.95::true_val(price_usd_msrp, v849_95); 0.05::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s7, price_usd_msrp, v849_95).
measured(s8, price_usd_msrp, v849_95).
measured(s16, price_usd_msrp, v849_95).

all_consistent(price_usd_msrp) :-
    consistent(s7, price_usd_msrp),
    consistent(s8, price_usd_msrp),
    (indep(s16), consistent(s16, price_usd_msrp) ; \+indep(s16)).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v849_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_aud_merchant
% @type numeric
% @canonical true
% @original_name price_aud_merchant
% @unit AUD
% @values v1349_99=1349.99 unk_price_aud_merchant=Unknown
% @importance 0.90

0.85::acc(s1, price_aud_merchant).

0.90::true_val(price_aud_merchant, v1349_99); 0.10::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s1, price_aud_merchant, v1349_99).

all_consistent(price_aud_merchant) :-
    (indep(s1), consistent(s1, price_aud_merchant) ; \+indep(s1)).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v1349_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_usd_evo
% @type numeric
% @canonical true
% @original_name price_usd_evo
% @unit USD
% @values v679_96=679.96 unk_price_usd_evo=Unknown
% @importance 0.95

0.85::acc(s6, price_usd_evo).

0.82::true_val(price_usd_evo, v679_96); 0.18::true_val(price_usd_evo, unk_price_usd_evo).

measured(s6, price_usd_evo, v679_96).

all_consistent(price_usd_evo) :-
    consistent(s6, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v679_96)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_sun_ski_sale
% @type numeric
% @canonical false
% @original_name Price (USD, Sun & Ski Sports — sale)
% @unit USD
% @values v679_93=679.93 unk_price_usd_sun_ski_sale=Unknown
% @importance 0.95

0.80::acc(s6, price_usd_sun_ski_sale).

0.80::true_val(price_usd_sun_ski_sale, v679_93); 0.20::true_val(price_usd_sun_ski_sale, unk_price_usd_sun_ski_sale).

measured(s6, price_usd_sun_ski_sale, v679_93).

all_consistent(price_usd_sun_ski_sale) :-
    consistent(s6, price_usd_sun_ski_sale).

evidence(all_consistent(price_usd_sun_ski_sale)).
query(true_val(price_usd_sun_ski_sale, v679_93)).
query(true_val(price_usd_sun_ski_sale, unk_price_usd_sun_ski_sale)).

% @attr price_eur_blue_tomato
% @type numeric
% @canonical true
% @original_name price_eur_blue_tomato
% @unit EUR
% @values v799_95=799.95 unk_price_eur_blue_tomato=Unknown
% @importance 0.95

0.82::acc(s6, price_eur_blue_tomato).

0.80::true_val(price_eur_blue_tomato, v799_95); 0.20::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).

measured(s6, price_eur_blue_tomato, v799_95).

all_consistent(price_eur_blue_tomato) :-
    consistent(s6, price_eur_blue_tomato).

evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v799_95)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

% @attr price_eur_snowcountry
% @type numeric
% @canonical false
% @original_name Price (EUR, SnowCountry — 2026 model)
% @unit EUR
% @values v649=649.00 unk_price_eur_snowcountry=Unknown
% @importance 0.95

0.78::acc(s6, price_eur_snowcountry).

0.78::true_val(price_eur_snowcountry, v649); 0.22::true_val(price_eur_snowcountry, unk_price_eur_snowcountry).

measured(s6, price_eur_snowcountry, v649).

all_consistent(price_eur_snowcountry) :-
    consistent(s6, price_eur_snowcountry).

evidence(all_consistent(price_eur_snowcountry)).
query(true_val(price_eur_snowcountry, v649)).
query(true_val(price_eur_snowcountry, unk_price_eur_snowcountry)).

% @attr price_usd_skatepro
% @type numeric
% @canonical false
% @original_name Price (USD, SkatePro)
% @unit USD
% @values v899_95=899.95 unk_price_usd_skatepro=Unknown
% @importance 0.70

0.80::acc(s14, price_usd_skatepro).

0.82::true_val(price_usd_skatepro, v899_95); 0.18::true_val(price_usd_skatepro, unk_price_usd_skatepro).

measured(s14, price_usd_skatepro, v899_95).

all_consistent(price_usd_skatepro) :-
    (indep(s14), consistent(s14, price_usd_skatepro) ; \+indep(s14)).

evidence(all_consistent(price_usd_skatepro)).
query(true_val(price_usd_skatepro, v899_95)).
query(true_val(price_usd_skatepro, unk_price_usd_skatepro)).

% @attr price_usd_snowinn
% @type numeric
% @canonical false
% @original_name Price (USD, Snowinn/Tradeinn — 2026 colorway)
% @unit USD
% @values v700_99=700.99 unk_price_usd_snowinn=Unknown
% @importance 0.65

0.78::acc(s13, price_usd_snowinn).

0.78::true_val(price_usd_snowinn, v700_99); 0.22::true_val(price_usd_snowinn, unk_price_usd_snowinn).

measured(s13, price_usd_snowinn, v700_99).

all_consistent(price_usd_snowinn) :-
    (indep(s13), consistent(s13, price_usd_snowinn) ; \+indep(s13)).

evidence(all_consistent(price_usd_snowinn)).
query(true_val(price_usd_snowinn, v700_99)).
query(true_val(price_usd_snowinn, unk_price_usd_snowinn)).

% @attr price_gbp_blue_tomato_uk
% @type numeric
% @canonical true
% @original_name price_gbp_blue_tomato_uk
% @unit GBP
% @values v715=715.00 unk_price_gbp_blue_tomato_uk=Unknown
% @importance 0.95

0.82::acc(s6, price_gbp_blue_tomato_uk).

0.80::true_val(price_gbp_blue_tomato_uk, v715); 0.20::true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk).

measured(s6, price_gbp_blue_tomato_uk, v715).

all_consistent(price_gbp_blue_tomato_uk) :-
    consistent(s6, price_gbp_blue_tomato_uk).

evidence(all_consistent(price_gbp_blue_tomato_uk)).
query(true_val(price_gbp_blue_tomato_uk, v715)).
query(true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk)).

% @attr price_usd_the_house_clearance
% @type numeric
% @canonical false
% @original_name Price (USD, The House — older model, clearance)
% @unit USD
% @values v399_99=399.99 unk_price_usd_the_house_clearance=Unknown
% @importance 0.60

0.75::acc(s15, price_usd_the_house_clearance).

0.72::true_val(price_usd_the_house_clearance, v399_99); 0.28::true_val(price_usd_the_house_clearance, unk_price_usd_the_house_clearance).

measured(s15, price_usd_the_house_clearance, v399_99).

all_consistent(price_usd_the_house_clearance) :-
    consistent(s15, price_usd_the_house_clearance).

evidence(all_consistent(price_usd_the_house_clearance)).
query(true_val(price_usd_the_house_clearance, v399_99)).
query(true_val(price_usd_the_house_clearance, unk_price_usd_the_house_clearance)).

% @attr price_usd_alpine_east
% @type numeric
% @canonical false
% @original_name Price (USD, Alpine East — 2026)
% @unit USD
% @values v849_95_ae=849.95 unk_price_usd_alpine_east=Unknown
% @importance 0.60

0.78::acc(s16, price_usd_alpine_east).

0.78::true_val(price_usd_alpine_east, v849_95_ae); 0.22::true_val(price_usd_alpine_east, unk_price_usd_alpine_east).

measured(s16, price_usd_alpine_east, v849_95_ae).

all_consistent(price_usd_alpine_east) :-
    (indep(s16), consistent(s16, price_usd_alpine_east) ; \+indep(s16)).

evidence(all_consistent(price_usd_alpine_east)).
query(true_val(price_usd_alpine_east, v849_95_ae)).
query(true_val(price_usd_alpine_east, unk_price_usd_alpine_east)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values sold_out=Sold_out_manufacturer unk_availability_status=Unknown
% @importance 1.00

0.93::acc(s7, availability_status).

0.93::true_val(availability_status, sold_out); 0.07::true_val(availability_status, unk_availability_status).

measured(s7, availability_status, sold_out).

all_consistent(availability_status) :-
    consistent(s7, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, sold_out)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_ballistyx
% @type categorical
% @canonical false
% @original_name Ballistyx.com.au (2027) availability
% @values preorder_limited=Preorder_limited_allocations unk_availability_status_ballistyx=Unknown
% @importance 0.70

0.78::acc(s12, availability_status_ballistyx).

0.80::true_val(availability_status_ballistyx, preorder_limited); 0.20::true_val(availability_status_ballistyx, unk_availability_status_ballistyx).

measured(s12, availability_status_ballistyx, preorder_limited).

all_consistent(availability_status_ballistyx) :-
    (indep(s12), consistent(s12, availability_status_ballistyx) ; \+indep(s12)).

evidence(all_consistent(availability_status_ballistyx)).
query(true_val(availability_status_ballistyx, preorder_limited)).
query(true_val(availability_status_ballistyx, unk_availability_status_ballistyx)).

% @attr availability_status_snow_central
% @type categorical
% @canonical false
% @original_name Snow Central AU (2027) availability
% @values preorder_may_2026=Preorder_estimated_May_2026 unk_availability_status_snow_central=Unknown
% @importance 0.60

0.75::acc(s17, availability_status_snow_central).

0.75::true_val(availability_status_snow_central, preorder_may_2026); 0.25::true_val(availability_status_snow_central, unk_availability_status_snow_central).

measured(s17, availability_status_snow_central, preorder_may_2026).

all_consistent(availability_status_snow_central) :-
    (indep(s17), consistent(s17, availability_status_snow_central) ; \+indep(s17)).

evidence(all_consistent(availability_status_snow_central)).
query(true_val(availability_status_snow_central, preorder_may_2026)).
query(true_val(availability_status_snow_central, unk_availability_status_snow_central)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name evo.com (2026) availability
% @values in_stock_on_sale=In_stock_on_sale unk_availability_status_evo=Unknown
% @importance 0.85

0.85::acc(s9, availability_status_evo).

0.85::true_val(availability_status_evo, in_stock_on_sale); 0.15::true_val(availability_status_evo, unk_availability_status_evo).

measured(s9, availability_status_evo, in_stock_on_sale).

all_consistent(availability_status_evo) :-
    (indep(s9), consistent(s9, availability_status_evo) ; \+indep(s9)).

evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, in_stock_on_sale)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

% @attr availability_status_skatepro
% @type categorical
% @canonical false
% @original_name SkatePro (2026) availability
% @values in_stock=In_stock unk_availability_status_skatepro=Unknown
% @importance 0.70

0.80::acc(s14, availability_status_skatepro).

0.82::true_val(availability_status_skatepro, in_stock); 0.18::true_val(availability_status_skatepro, unk_availability_status_skatepro).

measured(s14, availability_status_skatepro, in_stock).

all_consistent(availability_status_skatepro) :-
    (indep(s14), consistent(s14, availability_status_skatepro) ; \+indep(s14)).

evidence(all_consistent(availability_status_skatepro)).
query(true_val(availability_status_skatepro, in_stock)).
query(true_val(availability_status_skatepro, unk_availability_status_skatepro)).

% @attr availability_status_the_house
% @type categorical
% @canonical false
% @original_name availability_status (The House)
% @values available_158_only=Available_158_only unk_availability_status_the_house=Unknown
% @importance 0.60

0.75::acc(s15, availability_status_the_house).

0.72::true_val(availability_status_the_house, available_158_only); 0.28::true_val(availability_status_the_house, unk_availability_status_the_house).

measured(s15, availability_status_the_house, available_158_only).

all_consistent(availability_status_the_house) :-
    consistent(s15, availability_status_the_house).

evidence(all_consistent(availability_status_the_house)).
query(true_val(availability_status_the_house, available_158_only)).
query(true_val(availability_status_the_house, unk_availability_status_the_house)).

% @attr availability_status_amazon
% @type categorical
% @canonical false
% @original_name availability_status (Amazon)
% @values listed=Listed unk_availability_status_amazon=Unknown
% @importance 0.40

0.70::acc(s11, availability_status_amazon).

0.72::true_val(availability_status_amazon, listed); 0.28::true_val(availability_status_amazon, unk_availability_status_amazon).

measured(s11, availability_status_amazon, listed).

all_consistent(availability_status_amazon) :-
    (indep(s11), consistent(s11, availability_status_amazon) ; \+indep(s11)).

evidence(all_consistent(availability_status_amazon)).
query(true_val(availability_status_amazon, listed)).
query(true_val(availability_status_amazon, unk_availability_status_amazon)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values v2_year_extendable_3=2_year_extendable_to_3 v1_year=1_year
% @importance 0.72

0.95::acc(s7, warranty).
0.82::acc(s19, warranty).
0.55::acc(s18, warranty).

0.80::true_val(warranty, v2_year_extendable_3); 0.20::true_val(warranty, v1_year).

measured(s7, warranty, v2_year_extendable_3).
measured(s19, warranty, v2_year_extendable_3).
measured(s18, warranty, v1_year).

all_consistent(warranty) :-
    consistent(s7, warranty),
    (indep(s19), consistent(s19, warranty) ; \+indep(s19)),
    (indep(s18), consistent(s18, warranty) ; \+indep(s18)).

evidence(all_consistent(warranty)).
query(true_val(warranty, v2_year_extendable_3)).
query(true_val(warranty, v1_year)).

% @attr extended_warranty_process
% @type categorical
% @canonical false
% @original_name Extended warranty process
% @values register_for_3rd_year=Register_board_for_additional_year unk_extended_warranty_process=Unknown
% @importance 0.70

0.82::acc(s19, extended_warranty_process).

0.80::true_val(extended_warranty_process, register_for_3rd_year); 0.20::true_val(extended_warranty_process, unk_extended_warranty_process).

measured(s19, extended_warranty_process, register_for_3rd_year).

all_consistent(extended_warranty_process) :-
    (indep(s19), consistent(s19, extended_warranty_process) ; \+indep(s19)).

evidence(all_consistent(extended_warranty_process)).
query(true_val(extended_warranty_process, register_for_3rd_year)).
query(true_val(extended_warranty_process, unk_extended_warranty_process)).

% @attr environmental_commitment
% @type categorical
% @canonical false
% @original_name Environmental commitment
% @values one_pct_for_environment=1_percent_of_sales_to_environment unk_environmental_commitment=Unknown
% @importance 0.35

0.93::acc(s20, environmental_commitment).

0.92::true_val(environmental_commitment, one_pct_for_environment); 0.08::true_val(environmental_commitment, unk_environmental_commitment).

measured(s20, environmental_commitment, one_pct_for_environment).

all_consistent(environmental_commitment) :-
    consistent(s20, environmental_commitment).

evidence(all_consistent(environmental_commitment)).
query(true_val(environmental_commitment, one_pct_for_environment)).
query(true_val(environmental_commitment, unk_environmental_commitment)).

% @attr snowboard_mag_award
% @type categorical
% @canonical false
% @original_name Snowboard Magazine award
% @values platinum_pick_2026=2026_Platinum_Pick unk_snowboard_mag_award=Unknown
% @importance 0.85

0.88::acc(s8, snowboard_mag_award).

0.85::true_val(snowboard_mag_award, platinum_pick_2026); 0.15::true_val(snowboard_mag_award, unk_snowboard_mag_award).

measured(s8, snowboard_mag_award, platinum_pick_2026).

all_consistent(snowboard_mag_award) :-
    consistent(s8, snowboard_mag_award).

evidence(all_consistent(snowboard_mag_award)).
query(true_val(snowboard_mag_award, platinum_pick_2026)).
query(true_val(snowboard_mag_award, unk_snowboard_mag_award)).

% @attr snowboard_mag_ride_impression
% @type categorical
% @canonical false
% @original_name Snowboard Magazine ride impression
% @values calm_predictable_snappy_carving=Calm_predictable_fast_edge_to_edge_snappy_carving unk_snowboard_mag_ride_impression=Unknown
% @importance 0.85

0.88::acc(s8, snowboard_mag_ride_impression).

0.85::true_val(snowboard_mag_ride_impression, calm_predictable_snappy_carving); 0.15::true_val(snowboard_mag_ride_impression, unk_snowboard_mag_ride_impression).

measured(s8, snowboard_mag_ride_impression, calm_predictable_snappy_carving).

all_consistent(snowboard_mag_ride_impression) :-
    consistent(s8, snowboard_mag_ride_impression).

evidence(all_consistent(snowboard_mag_ride_impression)).
query(true_val(snowboard_mag_ride_impression, calm_predictable_snappy_carving)).
query(true_val(snowboard_mag_ride_impression, unk_snowboard_mag_ride_impression)).

% @attr the_good_ride_overall_verdict
% @type categorical
% @canonical false
% @original_name The Good Ride overall verdict
% @values one_of_better_powder_freeride=One_of_better_powder_freeride_boards unk_the_good_ride_overall_verdict=Unknown
% @importance 0.95

0.88::acc(s6, the_good_ride_overall_verdict).

0.85::true_val(the_good_ride_overall_verdict, one_of_better_powder_freeride); 0.15::true_val(the_good_ride_overall_verdict, unk_the_good_ride_overall_verdict).

measured(s6, the_good_ride_overall_verdict, one_of_better_powder_freeride).

all_consistent(the_good_ride_overall_verdict) :-
    consistent(s6, the_good_ride_overall_verdict).

evidence(all_consistent(the_good_ride_overall_verdict)).
query(true_val(the_good_ride_overall_verdict, one_of_better_powder_freeride)).
query(true_val(the_good_ride_overall_verdict, unk_the_good_ride_overall_verdict)).

% @attr the_good_ride_reviewer_loved_it
% @type categorical
% @canonical false
% @original_name The Good Ride reviewer loved it
% @values loved_asked_to_keep=Loved_ride_asked_to_keep_it unk_the_good_ride_reviewer_loved_it=Unknown
% @importance 0.95

0.85::acc(s6, the_good_ride_reviewer_loved_it).

0.82::true_val(the_good_ride_reviewer_loved_it, loved_asked_to_keep); 0.18::true_val(the_good_ride_reviewer_loved_it, unk_the_good_ride_reviewer_loved_it).

measured(s6, the_good_ride_reviewer_loved_it, loved_asked_to_keep).

all_consistent(the_good_ride_reviewer_loved_it) :-
    consistent(s6, the_good_ride_reviewer_loved_it).

evidence(all_consistent(the_good_ride_reviewer_loved_it)).
query(true_val(the_good_ride_reviewer_loved_it, loved_asked_to_keep)).
query(true_val(the_good_ride_reviewer_loved_it, unk_the_good_ride_reviewer_loved_it)).

% @attr reviewer_opinion_the_good_ride
% @type numeric
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @unit /5
% @values v4_9=4.9 unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.95

0.90::acc(s6, reviewer_opinion_the_good_ride).

0.85::true_val(reviewer_opinion_the_good_ride, v4_9); 0.15::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s6, reviewer_opinion_the_good_ride, v4_9).

all_consistent(reviewer_opinion_the_good_ride) :-
    consistent(s6, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, v4_9)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr outdoor_review_user_rating
% @type numeric
% @canonical false
% @original_name Outdoor Review user rating
% @unit /5
% @values v4_4=4.4 unk_outdoor_review_user_rating=Unknown
% @importance 0.55

0.65::acc(s21, outdoor_review_user_rating).

0.60::true_val(outdoor_review_user_rating, v4_4); 0.40::true_val(outdoor_review_user_rating, unk_outdoor_review_user_rating).

measured(s21, outdoor_review_user_rating, v4_4).

all_consistent(outdoor_review_user_rating) :-
    consistent(s21, outdoor_review_user_rating).

evidence(all_consistent(outdoor_review_user_rating)).
query(true_val(outdoor_review_user_rating, v4_4)).
query(true_val(outdoor_review_user_rating, unk_outdoor_review_user_rating)).

% @attr the_house_customer_rating
% @type numeric
% @canonical false
% @original_name The House customer rating
% @unit /5
% @values v4_3=4.3 unk_the_house_customer_rating=Unknown
% @importance 0.60

0.72::acc(s15, the_house_customer_rating).

0.70::true_val(the_house_customer_rating, v4_3); 0.30::true_val(the_house_customer_rating, unk_the_house_customer_rating).

measured(s15, the_house_customer_rating, v4_3).

all_consistent(the_house_customer_rating) :-
    consistent(s15, the_house_customer_rating).

evidence(all_consistent(the_house_customer_rating)).
query(true_val(the_house_customer_rating, v4_3)).
query(true_val(the_house_customer_rating, unk_the_house_customer_rating)).

% @attr snow_mag_best_freeride_2026
% @type categorical
% @canonical false
% @original_name Snow Magazine best freeride 2026 inclusion
% @values included=Included_in_best_freeride_2026 unk_snow_mag_best_freeride_2026=Unknown
% @importance 0.70

0.82::acc(s22, snow_mag_best_freeride_2026).

0.80::true_val(snow_mag_best_freeride_2026, included); 0.20::true_val(snow_mag_best_freeride_2026, unk_snow_mag_best_freeride_2026).

measured(s22, snow_mag_best_freeride_2026, included).

all_consistent(snow_mag_best_freeride_2026) :-
    consistent(s22, snow_mag_best_freeride_2026).

evidence(all_consistent(snow_mag_best_freeride_2026)).
query(true_val(snow_mag_best_freeride_2026, included)).
query(true_val(snow_mag_best_freeride_2026, unk_snow_mag_best_freeride_2026)).

% @attr the_good_ride_freeride_favorites_2026
% @type categorical
% @canonical false
% @original_name The Good Ride Freeride Favorites 2026 inclusion
% @values included_tgr=Included_more_camber_new_construction unk_the_good_ride_freeride_favorites_2026=Unknown
% @importance 0.80

0.88::acc(s23, the_good_ride_freeride_favorites_2026).

0.85::true_val(the_good_ride_freeride_favorites_2026, included_tgr); 0.15::true_val(the_good_ride_freeride_favorites_2026, unk_the_good_ride_freeride_favorites_2026).

measured(s23, the_good_ride_freeride_favorites_2026, included_tgr).

all_consistent(the_good_ride_freeride_favorites_2026) :-
    (indep(s23), consistent(s23, the_good_ride_freeride_favorites_2026) ; \+indep(s23)).

evidence(all_consistent(the_good_ride_freeride_favorites_2026)).
query(true_val(the_good_ride_freeride_favorites_2026, included_tgr)).
query(true_val(the_good_ride_freeride_favorites_2026, unk_the_good_ride_freeride_favorites_2026)).

% @attr powder_rating_tgr
% @type categorical
% @canonical true
% @original_name powder_rating_tgr
% @values great=Great unk_powder_rating_tgr=Unknown
% @importance 0.95

0.90::acc(s6, powder_rating_tgr).

0.85::true_val(powder_rating_tgr, great); 0.15::true_val(powder_rating_tgr, unk_powder_rating_tgr).

measured(s6, powder_rating_tgr, great).

all_consistent(powder_rating_tgr) :-
    consistent(s6, powder_rating_tgr).

evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, great)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values excellent=Excellent unk_base_glide_performance=Unknown
% @importance 0.95

0.90::acc(s6, base_glide_performance).

0.85::true_val(base_glide_performance, excellent); 0.15::true_val(base_glide_performance, unk_base_glide_performance).

measured(s6, base_glide_performance, excellent).

all_consistent(base_glide_performance) :-
    consistent(s6, base_glide_performance).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, excellent)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr carving_rating_tgr
% @type categorical
% @canonical true
% @original_name carving_rating_tgr
% @values great=Great unk_carving_rating_tgr=Unknown
% @importance 0.95

0.90::acc(s6, carving_rating_tgr).

0.85::true_val(carving_rating_tgr, great); 0.15::true_val(carving_rating_tgr, unk_carving_rating_tgr).

measured(s6, carving_rating_tgr, great).

all_consistent(carving_rating_tgr) :-
    consistent(s6, carving_rating_tgr).

evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, great)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

% @attr speed_rating_tgr
% @type categorical
% @canonical true
% @original_name speed_rating_tgr
% @values great=Great unk_speed_rating_tgr=Unknown
% @importance 0.95

0.90::acc(s6, speed_rating_tgr).

0.85::true_val(speed_rating_tgr, great); 0.15::true_val(speed_rating_tgr, unk_speed_rating_tgr).

measured(s6, speed_rating_tgr, great).

all_consistent(speed_rating_tgr) :-
    consistent(s6, speed_rating_tgr).

evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, great)).
query(true_val(speed_rating_tgr, unk_speed_rating_tgr)).

% @attr uneven_snow_handling
% @type categorical
% @canonical false
% @original_name Uneven snow handling
% @values great=Great unk_uneven_snow_handling=Unknown
% @importance 0.95

0.90::acc(s6, uneven_snow_handling).

0.85::true_val(uneven_snow_handling, great); 0.15::true_val(uneven_snow_handling, unk_uneven_snow_handling).

measured(s6, uneven_snow_handling, great).

all_consistent(uneven_snow_handling) :-
    consistent(s6, uneven_snow_handling).

evidence(all_consistent(uneven_snow_handling)).
query(true_val(uneven_snow_handling, great)).
query(true_val(uneven_snow_handling, unk_uneven_snow_handling)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values average=Average unk_switch_riding=Unknown
% @importance 0.95

0.90::acc(s6, switch_riding).

0.85::true_val(switch_riding, average); 0.15::true_val(switch_riding, unk_switch_riding).

measured(s6, switch_riding, average).

all_consistent(switch_riding) :-
    consistent(s6, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, average)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr jumps_rating_tgr
% @type categorical
% @canonical true
% @original_name jumps_rating_tgr
% @values great=Great unk_jumps_rating_tgr=Unknown
% @importance 0.95

0.90::acc(s6, jumps_rating_tgr).

0.85::true_val(jumps_rating_tgr, great); 0.15::true_val(jumps_rating_tgr, unk_jumps_rating_tgr).

measured(s6, jumps_rating_tgr, great).

all_consistent(jumps_rating_tgr) :-
    consistent(s6, jumps_rating_tgr).

evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, great)).
query(true_val(jumps_rating_tgr, unk_jumps_rating_tgr)).

% @attr jibbing_rating_tgr
% @type categorical
% @canonical true
% @original_name jibbing_rating_tgr
% @values poor=Poor unk_jibbing_rating_tgr=Unknown
% @importance 0.95

0.90::acc(s6, jibbing_rating_tgr).

0.85::true_val(jibbing_rating_tgr, poor); 0.15::true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr).

measured(s6, jibbing_rating_tgr, poor).

all_consistent(jibbing_rating_tgr) :-
    consistent(s6, jibbing_rating_tgr).

evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, poor)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr)).

% @attr pipe_rating_tgr
% @type categorical
% @canonical true
% @original_name pipe_rating_tgr
% @values good=Good unk_pipe_rating_tgr=Unknown
% @importance 0.95

0.90::acc(s6, pipe_rating_tgr).

0.85::true_val(pipe_rating_tgr, good); 0.15::true_val(pipe_rating_tgr, unk_pipe_rating_tgr).

measured(s6, pipe_rating_tgr, good).

all_consistent(pipe_rating_tgr) :-
    consistent(s6, pipe_rating_tgr).

evidence(all_consistent(pipe_rating_tgr)).
query(true_val(pipe_rating_tgr, good)).
query(true_val(pipe_rating_tgr, unk_pipe_rating_tgr)).

% @attr on_snow_feel_tgr
% @type categorical
% @canonical true
% @original_name on_snow_feel_tgr
% @values stable=Stable unk_on_snow_feel_tgr=Unknown
% @importance 0.95

0.90::acc(s6, on_snow_feel_tgr).

0.85::true_val(on_snow_feel_tgr, stable); 0.15::true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr).

measured(s6, on_snow_feel_tgr, stable).

all_consistent(on_snow_feel_tgr) :-
    consistent(s6, on_snow_feel_tgr).

evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, stable)).
query(true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values fast=Fast unk_turn_initiation_performance=Unknown
% @importance 0.95

0.90::acc(s6, turn_initiation_performance).

0.85::true_val(turn_initiation_performance, fast); 0.15::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s6, turn_initiation_performance, fast).

all_consistent(turn_initiation_performance) :-
    consistent(s6, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, fast)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr skidded_turns
% @type categorical
% @canonical false
% @original_name Skidded turns
% @values moderate=Moderate unk_skidded_turns=Unknown
% @importance 0.95

0.90::acc(s6, skidded_turns).

0.85::true_val(skidded_turns, moderate); 0.15::true_val(skidded_turns, unk_skidded_turns).

measured(s6, skidded_turns, moderate).

all_consistent(skidded_turns) :-
    consistent(s6, skidded_turns).

evidence(all_consistent(skidded_turns)).
query(true_val(skidded_turns, moderate)).
query(true_val(skidded_turns, unk_skidded_turns)).

% @attr buttering_ease
% @type categorical
% @canonical false
% @original_name Buttering ease
% @values moderate=Moderate unk_buttering_ease=Unknown
% @importance 0.95

0.90::acc(s6, buttering_ease).

0.85::true_val(buttering_ease, moderate); 0.15::true_val(buttering_ease, unk_buttering_ease).

measured(s6, buttering_ease, moderate).

all_consistent(buttering_ease) :-
    consistent(s6, buttering_ease).

evidence(all_consistent(buttering_ease)).
query(true_val(buttering_ease, moderate)).
query(true_val(buttering_ease, unk_buttering_ease)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values hard_snow=Hard_Snow unk_edge_hold=Unknown
% @importance 0.95

0.90::acc(s6, edge_hold).

0.85::true_val(edge_hold, hard_snow); 0.15::true_val(edge_hold, unk_edge_hold).

measured(s6, edge_hold, hard_snow).

all_consistent(edge_hold) :-
    consistent(s6, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, hard_snow)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr pop
% @type categorical
% @canonical false
% @original_name pop
% @values exceptional=Exceptional_pop_great_ollie_power unk_pop=Unknown
% @importance 0.95

0.88::acc(s6, pop).

0.85::true_val(pop, exceptional); 0.15::true_val(pop, unk_pop).

measured(s6, pop, exceptional).

all_consistent(pop) :-
    consistent(s6, pop).

evidence(all_consistent(pop)).
query(true_val(pop, exceptional)).
query(true_val(pop, unk_pop)).

% @attr chatter_absorption
% @type categorical
% @canonical false
% @original_name Chatter absorption despite lightweight
% @values absorbs_well_for_weight=Absorbs_way_more_chatter_for_being_light unk_chatter_absorption=Unknown
% @importance 0.95

0.88::acc(s6, chatter_absorption).

0.85::true_val(chatter_absorption, absorbs_well_for_weight); 0.15::true_val(chatter_absorption, unk_chatter_absorption).

measured(s6, chatter_absorption, absorbs_well_for_weight).

all_consistent(chatter_absorption) :-
    consistent(s6, chatter_absorption).

evidence(all_consistent(chatter_absorption)).
query(true_val(chatter_absorption, absorbs_well_for_weight)).
query(true_val(chatter_absorption, unk_chatter_absorption)).

% @attr build_quality
% @type categorical
% @canonical false
% @original_name Build quality for ultralight board
% @values well_built_for_ultralight=Really_well_built_for_ultralight unk_build_quality=Unknown
% @importance 0.95

0.88::acc(s6, build_quality).

0.85::true_val(build_quality, well_built_for_ultralight); 0.15::true_val(build_quality, unk_build_quality).

measured(s6, build_quality, well_built_for_ultralight).

all_consistent(build_quality) :-
    consistent(s6, build_quality).

evidence(all_consistent(build_quality)).
query(true_val(build_quality, well_built_for_ultralight)).
query(true_val(build_quality, unk_build_quality)).

% @attr versatile_one_board_quiver
% @type categorical
% @canonical false
% @original_name Versatile one-board quiver
% @values yes_directional_big_mtn=Versatile_one_board_quiver_directional_big_mountain unk_versatile_one_board_quiver=Unknown
% @importance 0.95

0.88::acc(s6, versatile_one_board_quiver).

0.85::true_val(versatile_one_board_quiver, yes_directional_big_mtn); 0.15::true_val(versatile_one_board_quiver, unk_versatile_one_board_quiver).

measured(s6, versatile_one_board_quiver, yes_directional_big_mtn).

all_consistent(versatile_one_board_quiver) :-
    consistent(s6, versatile_one_board_quiver).

evidence(all_consistent(versatile_one_board_quiver)).
query(true_val(versatile_one_board_quiver, yes_directional_big_mtn)).
query(true_val(versatile_one_board_quiver, unk_versatile_one_board_quiver)).

% @attr improvement_over_prior
% @type categorical
% @canonical false
% @original_name 2026 improvement over 2025 model
% @values massive_improvement=Massively_more_camber_new_damp_light_construction unk_improvement_over_prior=Unknown
% @importance 0.95

0.88::acc(s6, improvement_over_prior).

0.85::true_val(improvement_over_prior, massive_improvement); 0.15::true_val(improvement_over_prior, unk_improvement_over_prior).

measured(s6, improvement_over_prior, massive_improvement).

all_consistent(improvement_over_prior) :-
    consistent(s6, improvement_over_prior).

evidence(all_consistent(improvement_over_prior)).
query(true_val(improvement_over_prior, massive_improvement)).
query(true_val(improvement_over_prior, unk_improvement_over_prior)).

% @attr popularity
% @type categorical
% @canonical false
% @original_name Popularity
% @values most_popular_us_owns_europe=Most_popular_Nidecker_board_in_US_owns_Europe unk_popularity=Unknown
% @importance 0.95

0.85::acc(s6, popularity).

0.82::true_val(popularity, most_popular_us_owns_europe); 0.18::true_val(popularity, unk_popularity).

measured(s6, popularity, most_popular_us_owns_europe).

all_consistent(popularity) :-
    consistent(s6, popularity).

evidence(all_consistent(popularity)).
query(true_val(popularity, most_popular_us_owns_europe)).
query(true_val(popularity, unk_popularity)).

% @attr limited_sizing
% @type categorical
% @canonical false
% @original_name Limited sizing (only 3 sizes)
% @values only_three_sizes_wish_more=Only_3_sizes_reviewer_wishes_more unk_limited_sizing=Unknown
% @importance 0.95

0.85::acc(s6, limited_sizing).

0.82::true_val(limited_sizing, only_three_sizes_wish_more); 0.18::true_val(limited_sizing, unk_limited_sizing).

measured(s6, limited_sizing, only_three_sizes_wish_more).

all_consistent(limited_sizing) :-
    consistent(s6, limited_sizing).

evidence(all_consistent(limited_sizing)).
query(true_val(limited_sizing, only_three_sizes_wish_more)).
query(true_val(limited_sizing, unk_limited_sizing)).

% @attr setback_inserts_issue
% @type categorical
% @canonical false
% @original_name Setback inserts wider than reference stance
% @values wider_than_reference=Setback_inserts_much_wider_than_reference unk_setback_inserts_issue=Unknown
% @importance 0.95

0.85::acc(s6, setback_inserts_issue).

0.82::true_val(setback_inserts_issue, wider_than_reference); 0.18::true_val(setback_inserts_issue, unk_setback_inserts_issue).

measured(s6, setback_inserts_issue, wider_than_reference).

all_consistent(setback_inserts_issue) :-
    consistent(s6, setback_inserts_issue).

evidence(all_consistent(setback_inserts_issue)).
query(true_val(setback_inserts_issue, wider_than_reference)).
query(true_val(setback_inserts_issue, unk_setback_inserts_issue)).

% @attr camber_height_wish
% @type categorical
% @canonical false
% @original_name Camber height wish
% @values want_more_camber_higher_than_1_5mm=Would_like_more_camber_higher_than_1_5mm unk_camber_height_wish=Unknown
% @importance 0.95

0.85::acc(s6, camber_height_wish).

0.82::true_val(camber_height_wish, want_more_camber_higher_than_1_5mm); 0.18::true_val(camber_height_wish, unk_camber_height_wish).

measured(s6, camber_height_wish, want_more_camber_higher_than_1_5mm).

all_consistent(camber_height_wish) :-
    consistent(s6, camber_height_wish).

evidence(all_consistent(camber_height_wish)).
query(true_val(camber_height_wish, want_more_camber_higher_than_1_5mm)).
query(true_val(camber_height_wish, unk_camber_height_wish)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values park_jibbing_beginners=Park_jibbing_beginners unk_negative_aspect=Unknown
% @importance 0.975

0.92::acc(s7, negative_aspect).
0.88::acc(s6, negative_aspect).

0.95::true_val(negative_aspect, park_jibbing_beginners); 0.05::true_val(negative_aspect, unk_negative_aspect).

measured(s7, negative_aspect, park_jibbing_beginners).
measured(s6, negative_aspect, park_jibbing_beginners).

all_consistent(negative_aspect) :-
    consistent(s7, negative_aspect),
    consistent(s6, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, park_jibbing_beginners)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values ultralight_delamination_concern=Ultralight_topsheet_base_split_2_3_seasons unk_user_review_forum=Unknown
% @importance 0.80

0.55::acc(s24, user_review_forum).

0.50::true_val(user_review_forum, ultralight_delamination_concern); 0.50::true_val(user_review_forum, unk_user_review_forum).

measured(s24, user_review_forum, ultralight_delamination_concern).

all_consistent(user_review_forum) :-
    consistent(s24, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, ultralight_delamination_concern)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr whitelines_tester_2020
% @type categorical
% @canonical false
% @original_name Whitelines tester found flex too soft for carving expectations (2020 model)
% @values hard_to_carve_old_model=Hard_to_get_edge_to_edge_2020_model unk_whitelines_tester_2020=Unknown
% @importance 0.50

0.55::acc(s25, whitelines_tester_2020).

0.50::true_val(whitelines_tester_2020, hard_to_carve_old_model); 0.50::true_val(whitelines_tester_2020, unk_whitelines_tester_2020).

measured(s25, whitelines_tester_2020, hard_to_carve_old_model).

all_consistent(whitelines_tester_2020) :-
    consistent(s25, whitelines_tester_2020).

evidence(all_consistent(whitelines_tester_2020)).
query(true_val(whitelines_tester_2020, hard_to_carve_old_model)).
query(true_val(whitelines_tester_2020, unk_whitelines_tester_2020)).

% @attr forum_concern_lightweight
% @type categorical
% @canonical false
% @original_name Forum concern about lightweight = less damp
% @values lightweight_vibration_concern=Lightweight_usually_not_good_vibration_absorption unk_forum_concern_lightweight=Unknown
% @importance 0.70

0.50::acc(s26, forum_concern_lightweight).

0.45::true_val(forum_concern_lightweight, lightweight_vibration_concern); 0.55::true_val(forum_concern_lightweight, unk_forum_concern_lightweight).

measured(s26, forum_concern_lightweight, lightweight_vibration_concern).

all_consistent(forum_concern_lightweight) :-
    consistent(s26, forum_concern_lightweight).

evidence(all_consistent(forum_concern_lightweight)).
query(true_val(forum_concern_lightweight, lightweight_vibration_concern)).
query(true_val(forum_concern_lightweight, unk_forum_concern_lightweight)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values tgr_list=Amplid_Souly_Grail_K2_Alchemist_United_Shapes_Cadet_Burton_Gril_Master_Jones_Flagship_Pro_etc forum_list=Jones_Flagship_Jones_Carbon_Flagship_Rossignol_XV_Capita_Mega_Death
% @importance 0.825

0.88::acc(s6, comparable_board_cross_brand).
0.50::acc(s26, comparable_board_cross_brand).
0.50::acc(s24, comparable_board_cross_brand).

0.65::true_val(comparable_board_cross_brand, tgr_list); 0.35::true_val(comparable_board_cross_brand, forum_list).

measured(s6, comparable_board_cross_brand, tgr_list).
measured(s26, comparable_board_cross_brand, forum_list).
measured(s24, comparable_board_cross_brand, forum_list).

all_consistent(comparable_board_cross_brand) :-
    consistent(s6, comparable_board_cross_brand),
    consistent(s26, comparable_board_cross_brand),
    consistent(s24, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, tgr_list)).
query(true_val(comparable_board_cross_brand, forum_list)).

% @attr nidecker_ultralight_comparison
% @type categorical
% @canonical false
% @original_name Nidecker Ultralight (sibling model)
% @values softer_lighter_more_expensive=Ultralight_softer_lighter_300_more_expensive unk_nidecker_ultralight_comparison=Unknown
% @importance 0.80

0.88::acc(s27, nidecker_ultralight_comparison).

0.85::true_val(nidecker_ultralight_comparison, softer_lighter_more_expensive); 0.15::true_val(nidecker_ultralight_comparison, unk_nidecker_ultralight_comparison).

measured(s27, nidecker_ultralight_comparison, softer_lighter_more_expensive).

all_consistent(nidecker_ultralight_comparison) :-
    (indep(s27), consistent(s27, nidecker_ultralight_comparison) ; \+indep(s27)).

evidence(all_consistent(nidecker_ultralight_comparison)).
query(true_val(nidecker_ultralight_comparison, softer_lighter_more_expensive)).
query(true_val(nidecker_ultralight_comparison, unk_nidecker_ultralight_comparison)).

% @attr price_difference_vs_ultralight
% @type categorical
% @canonical false
% @original_name Price difference vs Ultralight
% @values not_worth_300_extra=Not_worth_300_extra_for_Ultralight unk_price_difference_vs_ultralight=Unknown
% @importance 0.80

0.88::acc(s27, price_difference_vs_ultralight).

0.85::true_val(price_difference_vs_ultralight, not_worth_300_extra); 0.15::true_val(price_difference_vs_ultralight, unk_price_difference_vs_ultralight).

measured(s27, price_difference_vs_ultralight, not_worth_300_extra).

all_consistent(price_difference_vs_ultralight) :-
    (indep(s27), consistent(s27, price_difference_vs_ultralight) ; \+indep(s27)).

evidence(all_consistent(price_difference_vs_ultralight)).
query(true_val(price_difference_vs_ultralight, not_worth_300_extra)).
query(true_val(price_difference_vs_ultralight, unk_price_difference_vs_ultralight)).

% @attr forum_comparison_jones_flagship
% @type categorical
% @canonical false
% @original_name Forum comparison to Jones Flagship
% @values jones_easiest_gun=Jones_Flagship_easiest_to_ride_gun_ever unk_forum_comparison_jones_flagship=Unknown
% @importance 0.60

0.55::acc(s28, forum_comparison_jones_flagship).

0.50::true_val(forum_comparison_jones_flagship, jones_easiest_gun); 0.50::true_val(forum_comparison_jones_flagship, unk_forum_comparison_jones_flagship).

measured(s28, forum_comparison_jones_flagship, jones_easiest_gun).

all_consistent(forum_comparison_jones_flagship) :-
    consistent(s28, forum_comparison_jones_flagship).

evidence(all_consistent(forum_comparison_jones_flagship)).
query(true_val(forum_comparison_jones_flagship, jones_easiest_gun)).
query(true_val(forum_comparison_jones_flagship, unk_forum_comparison_jones_flagship)).

% @attr megalight_vs_ultralight_stability
% @type categorical
% @canonical false
% @original_name Megalight vs Ultralight stability (forum)
% @values ultralight_more_stable=Ultralight_more_stable_than_Megalight_or_Flagship unk_megalight_vs_ultralight_stability=Unknown
% @importance 0.70

0.50::acc(s26, megalight_vs_ultralight_stability).

0.45::true_val(megalight_vs_ultralight_stability, ultralight_more_stable); 0.55::true_val(megalight_vs_ultralight_stability, unk_megalight_vs_ultralight_stability).

measured(s26, megalight_vs_ultralight_stability, ultralight_more_stable).

all_consistent(megalight_vs_ultralight_stability) :-
    consistent(s26, megalight_vs_ultralight_stability).

evidence(all_consistent(megalight_vs_ultralight_stability)).
query(true_val(megalight_vs_ultralight_stability, ultralight_more_stable)).
query(true_val(megalight_vs_ultralight_stability, unk_megalight_vs_ultralight_stability)).

% @attr long_term_rider_testimony
% @type categorical
% @canonical false
% @original_name Long-term rider testimony
% @values amazing_board_10_years=Truly_amazing_board_10_years_well_made unk_long_term_rider_testimony=Unknown
% @importance 0.80

0.60::acc(s24, long_term_rider_testimony).

0.55::true_val(long_term_rider_testimony, amazing_board_10_years); 0.45::true_val(long_term_rider_testimony, unk_long_term_rider_testimony).

measured(s24, long_term_rider_testimony, amazing_board_10_years).

all_consistent(long_term_rider_testimony) :-
    consistent(s24, long_term_rider_testimony).

evidence(all_consistent(long_term_rider_testimony)).
query(true_val(long_term_rider_testimony, amazing_board_10_years)).
query(true_val(long_term_rider_testimony, unk_long_term_rider_testimony)).

% @attr long_term_rider_testimony_15yr
% @type categorical
% @canonical false
% @original_name 15+ year rider testimony
% @values rode_hard_7_8_seasons=First_Megalight_15_plus_years_ago_rode_hard_7_8_seasons unk_long_term_rider_testimony_15yr=Unknown
% @importance 0.80

0.60::acc(s24, long_term_rider_testimony_15yr).

0.55::true_val(long_term_rider_testimony_15yr, rode_hard_7_8_seasons); 0.45::true_val(long_term_rider_testimony_15yr, unk_long_term_rider_testimony_15yr).

measured(s24, long_term_rider_testimony_15yr, rode_hard_7_8_seasons).

all_consistent(long_term_rider_testimony_15yr) :-
    consistent(s24, long_term_rider_testimony_15yr).

evidence(all_consistent(long_term_rider_testimony_15yr)).
query(true_val(long_term_rider_testimony_15yr, rode_hard_7_8_seasons)).
query(true_val(long_term_rider_testimony_15yr, unk_long_term_rider_testimony_15yr)).

% @attr weight_feel
% @type categorical
% @canonical false
% @original_name Approximate weight feel
% @values feels_light=Feels_Light_no_exact_weight_given unk_weight_feel=Unknown
% @importance 0.95

0.85::acc(s6, weight_feel).

0.82::true_val(weight_feel, feels_light); 0.18::true_val(weight_feel, unk_weight_feel).

measured(s6, weight_feel, feels_light).

all_consistent(weight_feel) :-
    consistent(s6, weight_feel).

evidence(all_consistent(weight_feel)).
query(true_val(weight_feel, feels_light)).
query(true_val(weight_feel, unk_weight_feel)).

% @attr legendary_reputation
% @type categorical
% @canonical false
% @original_name Legendary reputation
% @values most_legendary_nidecker=Most_legendary_board_from_Nidecker unk_legendary_reputation=Unknown
% @importance 0.55

0.72::acc(s29, legendary_reputation).

0.70::true_val(legendary_reputation, most_legendary_nidecker); 0.30::true_val(legendary_reputation, unk_legendary_reputation).

measured(s29, legendary_reputation, most_legendary_nidecker).

all_consistent(legendary_reputation) :-
    (indep(s29), consistent(s29, legendary_reputation) ; \+indep(s29)).

evidence(all_consistent(legendary_reputation)).
query(true_val(legendary_reputation, most_legendary_nidecker)).
query(true_val(legendary_reputation, unk_legendary_reputation)).

% @attr retailer_info_evo
% @type categorical
% @canonical false
% @original_name evo.com retailer info
% @values major_us_price_match=Major_US_specialty_retailer_price_match unk_retailer_info_evo=Unknown
% @importance 0.85

0.82::acc(s9, retailer_info_evo).

0.85::true_val(retailer_info_evo, major_us_price_match); 0.15::true_val(retailer_info_evo, unk_retailer_info_evo).

measured(s9, retailer_info_evo, major_us_price_match).

all_consistent(retailer_info_evo) :-
    (indep(s9), consistent(s9, retailer_info_evo) ; \+indep(s9)).

evidence(all_consistent(retailer_info_evo)).
query(true_val(retailer_info_evo, major_us_price_match)).
query(true_val(retailer_info_evo, unk_retailer_info_evo)).

% @attr retailer_info_ballistyx
% @type categorical
% @canonical false
% @original_name Ballistyx.com.au retailer info
% @values au_specialty_preorder_bonus=Australian_specialty_shop_preorder_bonus_tshirt unk_retailer_info_ballistyx=Unknown
% @importance 0.70

0.75::acc(s12, retailer_info_ballistyx).

0.75::true_val(retailer_info_ballistyx, au_specialty_preorder_bonus); 0.25::true_val(retailer_info_ballistyx, unk_retailer_info_ballistyx).

measured(s12, retailer_info_ballistyx, au_specialty_preorder_bonus).

all_consistent(retailer_info_ballistyx) :-
    (indep(s12), consistent(s12, retailer_info_ballistyx) ; \+indep(s12)).

evidence(all_consistent(retailer_info_ballistyx)).
query(true_val(retailer_info_ballistyx, au_specialty_preorder_bonus)).
query(true_val(retailer_info_ballistyx, unk_retailer_info_ballistyx)).

% @attr retailer_info_snow_central
% @type categorical
% @canonical false
% @original_name Snow Central AU retailer info
% @values small_local_au_30_day_return=Small_locally_owned_AU_30_day_return unk_retailer_info_snow_central=Unknown
% @importance 0.60

0.72::acc(s17, retailer_info_snow_central).

0.72::true_val(retailer_info_snow_central, small_local_au_30_day_return); 0.28::true_val(retailer_info_snow_central, unk_retailer_info_snow_central).

measured(s17, retailer_info_snow_central, small_local_au_30_day_return).

all_consistent(retailer_info_snow_central) :-
    (indep(s17), consistent(s17, retailer_info_snow_central) ; \+indep(s17)).

evidence(all_consistent(retailer_info_snow_central)).
query(true_val(retailer_info_snow_central, small_local_au_30_day_return)).
query(true_val(retailer_info_snow_central, unk_retailer_info_snow_central)).

% @attr retailer_info_blauer_board_shop
% @type categorical
% @canonical false
% @original_name Blauer Board Shop retailer info
% @values tgr_recommended_affiliate=Recommended_by_The_Good_Ride unk_retailer_info_blauer_board_shop=Unknown
% @importance 0.95

0.85::acc(s6, retailer_info_blauer_board_shop).

0.82::true_val(retailer_info_blauer_board_shop, tgr_recommended_affiliate); 0.18::true_val(retailer_info_blauer_board_shop, unk_retailer_info_blauer_board_shop).

measured(s6, retailer_info_blauer_board_shop, tgr_recommended_affiliate).

all_consistent(retailer_info_blauer_board_shop) :-
    consistent(s6, retailer_info_blauer_board_shop).

evidence(all_consistent(retailer_info_blauer_board_shop)).
query(true_val(retailer_info_blauer_board_shop, tgr_recommended_affiliate)).
query(true_val(retailer_info_blauer_board_shop, unk_retailer_info_blauer_board_shop)).

% @attr retailer_info_blue_tomato
% @type categorical
% @canonical false
% @original_name Blue Tomato retailer info
% @values major_eu_multicountry=Major_European_multi_country_retailer unk_retailer_info_blue_tomato=Unknown
% @importance 0.95

0.82::acc(s6, retailer_info_blue_tomato).

0.80::true_val(retailer_info_blue_tomato, major_eu_multicountry); 0.20::true_val(retailer_info_blue_tomato, unk_retailer_info_blue_tomato).

measured(s6, retailer_info_blue_tomato, major_eu_multicountry).

all_consistent(retailer_info_blue_tomato) :-
    consistent(s6, retailer_info_blue_tomato).

evidence(all_consistent(retailer_info_blue_tomato)).
query(true_val(retailer_info_blue_tomato, major_eu_multicountry)).
query(true_val(retailer_info_blue_tomato, unk_retailer_info_blue_tomato)).

% @attr retailer_info_snowcountry
% @type categorical
% @canonical false
% @original_name SnowCountry.eu retailer info
% @values eu_worldwide_shipping=European_retailer_worldwide_shipping unk_retailer_info_snowcountry=Unknown
% @importance 0.55

0.72::acc(s29, retailer_info_snowcountry).

0.70::true_val(retailer_info_snowcountry, eu_worldwide_shipping); 0.30::true_val(retailer_info_snowcountry, unk_retailer_info_snowcountry).

measured(s29, retailer_info_snowcountry, eu_worldwide_shipping).

all_consistent(retailer_info_snowcountry) :-
    (indep(s29), consistent(s29, retailer_info_snowcountry) ; \+indep(s29)).

evidence(all_consistent(retailer_info_snowcountry)).
query(true_val(retailer_info_snowcountry, eu_worldwide_shipping)).
query(true_val(retailer_info_snowcountry, unk_retailer_info_snowcountry)).

% @attr retailer_info_skatepro
% @type categorical
% @canonical false
% @original_name SkatePro retailer info
% @values listed_899_95_free_shipping=Listed_899_95_free_shipping unk_retailer_info_skatepro=Unknown
% @importance 0.70

0.80::acc(s14, retailer_info_skatepro).

0.82::true_val(retailer_info_skatepro, listed_899_95_free_shipping); 0.18::true_val(retailer_info_skatepro, unk_retailer_info_skatepro).

measured(s14, retailer_info_skatepro, listed_899_95_free_shipping).

all_consistent(retailer_info_skatepro) :-
    (indep(s14), consistent(s14, retailer_info_skatepro) ; \+indep(s14)).

evidence(all_consistent(retailer_info_skatepro)).
query(true_val(retailer_info_skatepro, listed_899_95_free_shipping)).
query(true_val(retailer_info_skatepro, unk_retailer_info_skatepro)).

% @attr retailer_info_the_house
% @type categorical
% @canonical false
% @original_name The House retailer info
% @values clearance_older_models=Clearance_sale_pricing_older_models unk_retailer_info_the_house=Unknown
% @importance 0.60

0.72::acc(s15, retailer_info_the_house).

0.70::true_val(retailer_info_the_house, clearance_older_models); 0.30::true_val(retailer_info_the_house, unk_retailer_info_the_house).

measured(s15, retailer_info_the_house, clearance_older_models).

all_consistent(retailer_info_the_house) :-
    consistent(s15, retailer_info_the_house).

evidence(all_consistent(retailer_info_the_house)).
query(true_val(retailer_info_the_house, clearance_older_models)).
query(true_val(retailer_info_the_house, unk_retailer_info_the_house)).

% @attr retailer_info_snowboard_zezula
% @type categorical
% @canonical false
% @original_name Snowboard Zezula retailer info
% @values eu_free_shipping_loyalty=European_retailer_free_shipping_loyalty_program unk_retailer_info_snowboard_zezula=Unknown
% @importance 0.40

0.75::acc(s2, retailer_info_snowboard_zezula).

0.75::true_val(retailer_info_snowboard_zezula, eu_free_shipping_loyalty); 0.25::true_val(retailer_info_snowboard_zezula, unk_retailer_info_snowboard_zezula).

measured(s2, retailer_info_snowboard_zezula, eu_free_shipping_loyalty).

all_consistent(retailer_info_snowboard_zezula) :-
    consistent(s2, retailer_info_snowboard_zezula).

evidence(all_consistent(retailer_info_snowboard_zezula)).
query(true_val(retailer_info_snowboard_zezula, eu_free_shipping_loyalty)).
query(true_val(retailer_info_snowboard_zezula, unk_retailer_info_snowboard_zezula)).

% @attr retailer_info_snowinn
% @type categorical
% @canonical false
% @original_name Snowinn/Tradeinn retailer info
% @values global_online=Global_online_retailer unk_retailer_info_snowinn=Unknown
% @importance 0.65

0.75::acc(s13, retailer_info_snowinn).

0.75::true_val(retailer_info_snowinn, global_online); 0.25::true_val(retailer_info_snowinn, unk_retailer_info_snowinn).

measured(s13, retailer_info_snowinn, global_online).

all_consistent(retailer_info_snowinn) :-
    (indep(s13), consistent(s13, retailer_info_snowinn) ; \+indep(s13)).

evidence(all_consistent(retailer_info_snowinn)).
query(true_val(retailer_info_snowinn, global_online)).
query(true_val(retailer_info_snowinn, unk_retailer_info_snowinn)).

% @attr topsheet_appearance_description
% @type categorical
% @canonical true
% @original_name topsheet_appearance_description
% @values matte_finish=Matte_finish unk_topsheet_appearance_description=Unknown
% @importance 1.00

0.95::acc(s7, topsheet_appearance_description).

0.95::true_val(topsheet_appearance_description, matte_finish); 0.05::true_val(topsheet_appearance_description, unk_topsheet_appearance_description).

measured(s7, topsheet_appearance_description, matte_finish).

all_consistent(topsheet_appearance_description) :-
    consistent(s7, topsheet_appearance_description).

evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, matte_finish)).
query(true_val(topsheet_appearance_description, unk_topsheet_appearance_description)).

% @attr topsheet_appearance_description_diecut
% @type categorical
% @canonical false
% @original_name topsheet_appearance_description (Diecut base)
% @values diecut_base=Diecut_base unk_topsheet_appearance_description_diecut=Unknown
% @importance 1.00

0.95::acc(s7, topsheet_appearance_description_diecut).

0.95::true_val(topsheet_appearance_description_diecut, diecut_base); 0.05::true_val(topsheet_appearance_description_diecut, unk_topsheet_appearance_description_diecut).

measured(s7, topsheet_appearance_description_diecut, diecut_base).

all_consistent(topsheet_appearance_description_diecut) :-
    consistent(s7, topsheet_appearance_description_diecut).

evidence(all_consistent(topsheet_appearance_description_diecut)).
query(true_val(topsheet_appearance_description_diecut, diecut_base)).
query(true_val(topsheet_appearance_description_diecut, unk_topsheet_appearance_description_diecut)).

% @attr topsheet_appearance_description_overprint
% @type categorical
% @canonical false
% @original_name topsheet_appearance_description (Overprint)
% @values overprint=Overprint_layered_artwork unk_topsheet_appearance_description_overprint=Unknown
% @importance 1.00

0.95::acc(s7, topsheet_appearance_description_overprint).

0.95::true_val(topsheet_appearance_description_overprint, overprint); 0.05::true_val(topsheet_appearance_description_overprint, unk_topsheet_appearance_description_overprint).

measured(s7, topsheet_appearance_description_overprint, overprint).

all_consistent(topsheet_appearance_description_overprint) :-
    consistent(s7, topsheet_appearance_description_overprint).

evidence(all_consistent(topsheet_appearance_description_overprint)).
query(true_val(topsheet_appearance_description_overprint, overprint)).
query(true_val(topsheet_appearance_description_overprint, unk_topsheet_appearance_description_overprint)).

% @attr topsheet_appearance_description_translucent
% @type categorical
% @canonical false
% @original_name topsheet_appearance_description (Translucent color)
% @values translucent_color=Translucent_color unk_topsheet_appearance_description_translucent=Unknown
% @importance 1.00

0.95::acc(s7, topsheet_appearance_description_translucent).

0.95::true_val(topsheet_appearance_description_translucent, translucent_color); 0.05::true_val(topsheet_appearance_description_translucent, unk_topsheet_appearance_description_translucent).

measured(s7, topsheet_appearance_description_translucent, translucent_color).

all_consistent(topsheet_appearance_description_translucent) :-
    consistent(s7, topsheet_appearance_description_translucent).

evidence(all_consistent(topsheet_appearance_description_translucent)).
query(true_val(topsheet_appearance_description_translucent, translucent_color)).
query(true_val(topsheet_appearance_description_translucent, unk_topsheet_appearance_description_translucent)).

% @attr prior_model_weaker
% @type categorical
% @canonical false
% @original_name 2024/25 model was considered weaker
% @values lacked_old_megalight_magic=2024_25_lacked_old_Megalight_magic unk_prior_model_weaker=Unknown
% @importance 0.95

0.85::acc(s6, prior_model_weaker).

0.82::true_val(prior_model_weaker, lacked_old_megalight_magic); 0.18::true_val(prior_model_weaker, unk_prior_model_weaker).

measured(s6, prior_model_weaker, lacked_old_megalight_magic).

all_consistent(prior_model_weaker) :-
    consistent(s6, prior_model_weaker).

evidence(all_consistent(prior_model_weaker)).
query(true_val(prior_model_weaker, lacked_old_megalight_magic)).
query(true_val(prior_model_weaker, unk_prior_model_weaker)).

% @attr redesign_year
% @type categorical
% @canonical true
% @original_name 2026 model considered major redesign
% @values y2026_major_redesign=2026_massively_more_camber_new_construction unk_redesign_year=Unknown
% @importance 0.95

0.88::acc(s6, redesign_year).

0.85::true_val(redesign_year, y2026_major_redesign); 0.15::true_val(redesign_year, unk_redesign_year).

measured(s6, redesign_year, y2026_major_redesign).

all_consistent(redesign_year) :-
    consistent(s6, redesign_year).

evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, y2026_major_redesign)).
query(true_val(redesign_year, unk_redesign_year)).

% @attr prior_model_base
% @type categorical
% @canonical false
% @original_name 2024/25 model had different base (N-9000)
% @values n9000_carbon_nanoparticles=N_9000_Base_carbon_nanoparticles unk_prior_model_base=Unknown
% @importance 0.55

0.72::acc(s29, prior_model_base).

0.70::true_val(prior_model_base, n9000_carbon_nanoparticles); 0.30::true_val(prior_model_base, unk_prior_model_base).

measured(s29, prior_model_base, n9000_carbon_nanoparticles).

all_consistent(prior_model_base) :-
    (indep(s29), consistent(s29, prior_model_base) ; \+indep(s29)).

evidence(all_consistent(prior_model_base)).
query(true_val(prior_model_base, n9000_carbon_nanoparticles)).
query(true_val(prior_model_base, unk_prior_model_base)).

% @attr prior_model_bck_material
% @type categorical
% @canonical false
% @original_name 2024/25 had BCK (Basalt/Carbon/Kevlar) in tip/tail
% @values bck_tip_tail=Basalt_Carbon_Kevlar_in_tip_tail unk_prior_model_bck_material=Unknown
% @importance 0.45

0.75::acc(s30, prior_model_bck_material).

0.72::true_val(prior_model_bck_material, bck_tip_tail); 0.28::true_val(prior_model_bck_material, unk_prior_model_bck_material).

measured(s30, prior_model_bck_material, bck_tip_tail).

all_consistent(prior_model_bck_material) :-
    (indep(s30), consistent(s30, prior_model_bck_material) ; \+indep(s30)).

evidence(all_consistent(prior_model_bck_material)).
query(true_val(prior_model_bck_material, bck_tip_tail)).
query(true_val(prior_model_bck_material, unk_prior_model_bck_material)).

% @attr megalight_vs_ultralight_24_25
% @type categorical
% @canonical false
% @original_name Megalight vs Ultralight (24/25)
% @values same_outline_absorbnid_cheaper=Same_outline_absorbnid_topsheet_cheaper unk_megalight_vs_ultralight_24_25=Unknown
% @importance 0.55

0.72::acc(s29, megalight_vs_ultralight_24_25).

0.70::true_val(megalight_vs_ultralight_24_25, same_outline_absorbnid_cheaper); 0.30::true_val(megalight_vs_ultralight_24_25, unk_megalight_vs_ultralight_24_25).

measured(s29, megalight_vs_ultralight_24_25, same_outline_absorbnid_cheaper).

all_consistent(megalight_vs_ultralight_24_25) :-
    (indep(s29), consistent(s29, megalight_vs_ultralight_24_25) ; \+indep(s29)).

evidence(all_consistent(megalight_vs_ultralight_24_25)).
query(true_val(megalight_vs_ultralight_24_25, same_outline_absorbnid_cheaper)).
query(true_val(megalight_vs_ultralight_24_25, unk_megalight_vs_ultralight_24_25)).