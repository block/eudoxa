0.15::indep(s_merchant).
0.20::indep(s4).
0.15::indep(s6).
0.15::indep(s7).
0.20::indep(s8).
0.12::indep(s10).
0.12::indep(s13).
0.15::indep(s14).
0.15::indep(s15).
0.25::indep(s23).
0.20::indep(s26).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values nidecker=Nidecker unk_brand=Unknown
% @importance 0.65

0.94::acc(s1, brand).

0.95::true_val(brand, nidecker); 0.05::true_val(brand, unk_brand).
measured(s1, brand, nidecker).
all_consistent(brand) :- consistent(s1, brand).
evidence(all_consistent(brand)).
query(true_val(brand, nidecker)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values sensor_pro=Sensor_Pro unk_model_name=Unknown
% @importance 0.65

0.94::acc(s1, model_name).

0.95::true_val(model_name, sensor_pro); 0.05::true_val(model_name, unk_model_name).
measured(s1, model_name, sensor_pro).
all_consistent(model_name) :- consistent(s1, model_name).
evidence(all_consistent(model_name)).
query(true_val(model_name, sensor_pro)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2027=2027 unk_model_year=Unknown
% @importance 1.0

0.94::acc(s1, model_year).

0.95::true_val(model_year, y2027); 0.05::true_val(model_year, unk_model_year).
measured(s1, model_year, y2027).
all_consistent(model_year) :- consistent(s1, model_year).
evidence(all_consistent(model_year)).
query(true_val(model_year, y2027)).
query(true_val(model_year, unk_model_year)).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values sensor_plus_renamed=Nidecker_Sensor_Plus_renamed_to_Sensor_Pro_for_MY2025 unk_predecessor_model_name=Unknown
% @importance 0.78

0.72::acc(s11, predecessor_model_name).
0.55::acc(s17, predecessor_model_name).

0.85::true_val(predecessor_model_name, sensor_plus_renamed); 0.15::true_val(predecessor_model_name, unk_predecessor_model_name).
measured(s11, predecessor_model_name, sensor_plus_renamed).
measured(s17, predecessor_model_name, sensor_plus_renamed).
all_consistent(predecessor_model_name) :- consistent(s11, predecessor_model_name), consistent(s17, predecessor_model_name).
evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, sensor_plus_renamed)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.65

0.94::acc(s1, product_type).

0.95::true_val(product_type, snowboard); 0.05::true_val(product_type, unk_product_type).
measured(s1, product_type, snowboard).
all_consistent(product_type) :- consistent(s1, product_type).
evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values freestyle_all_mountain=Freestyle_All_Mountain unk_board_category=Unknown
% @importance 0.70

0.68::acc(s14, board_category).
0.68::acc(s16, board_category).

0.85::true_val(board_category, freestyle_all_mountain); 0.15::true_val(board_category, unk_board_category).
measured(s14, board_category, freestyle_all_mountain).
measured(s16, board_category, freestyle_all_mountain).
all_consistent(board_category) :- consistent(s14, board_category), consistent(s16, board_category).
evidence(all_consistent(board_category)).
query(true_val(board_category, freestyle_all_mountain)).
query(true_val(board_category, unk_board_category)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 1.0

0.94::acc(s5, gender).

0.95::true_val(gender, mens); 0.05::true_val(gender, unk_gender).
measured(s5, gender, mens).
all_consistent(gender) :- consistent(s5, gender).
evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values nidecker_sa_rolle=Nidecker_SA_Rolle_Switzerland unk_manufacturer=Unknown
% @importance 0.70

0.85::acc(s7, manufacturer).

0.90::true_val(manufacturer, nidecker_sa_rolle); 0.10::true_val(manufacturer, unk_manufacturer).
measured(s7, manufacturer, nidecker_sa_rolle).
all_consistent(manufacturer) :- consistent(s7, manufacturer).
evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, nidecker_sa_rolle)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr manufacturer_eu_representative
% @type categorical
% @canonical false
% @original_name Manufacturer European representative
% @values low_pressure_amsterdam=Low_Pressure_Studio_BV_Amsterdam unk_manufacturer_eu_representative=Unknown
% @importance 0.70

0.85::acc(s7, manufacturer_eu_representative).

0.88::true_val(manufacturer_eu_representative, low_pressure_amsterdam); 0.12::true_val(manufacturer_eu_representative, unk_manufacturer_eu_representative).
measured(s7, manufacturer_eu_representative, low_pressure_amsterdam).
all_consistent(manufacturer_eu_representative) :- consistent(s7, manufacturer_eu_representative).
evidence(all_consistent(manufacturer_eu_representative)).
query(true_val(manufacturer_eu_representative, low_pressure_amsterdam)).
query(true_val(manufacturer_eu_representative, unk_manufacturer_eu_representative)).

% @attr manufacturer_us_operations
% @type categorical
% @canonical false
% @original_name Manufacturer US operations
% @values low_pressure_seattle=Low_Pressure_Studio_Seattle_WA unk_manufacturer_us_operations=Unknown
% @importance 0.30

0.90::acc(s2, manufacturer_us_operations).

0.90::true_val(manufacturer_us_operations, low_pressure_seattle); 0.10::true_val(manufacturer_us_operations, unk_manufacturer_us_operations).
measured(s2, manufacturer_us_operations, low_pressure_seattle).
all_consistent(manufacturer_us_operations) :- consistent(s2, manufacturer_us_operations).
evidence(all_consistent(manufacturer_us_operations)).
query(true_val(manufacturer_us_operations, low_pressure_seattle)).
query(true_val(manufacturer_us_operations, unk_manufacturer_us_operations)).

% @attr nidecker_company_founded
% @type categorical
% @canonical false
% @original_name Nidecker company founded
% @values y1887_etoy=1887_in_Etoy_Switzerland unk_nidecker_company_founded=Unknown
% @importance 0.50

0.82::acc(s18, nidecker_company_founded).

0.92::true_val(nidecker_company_founded, y1887_etoy); 0.08::true_val(nidecker_company_founded, unk_nidecker_company_founded).
measured(s18, nidecker_company_founded, y1887_etoy).
all_consistent(nidecker_company_founded) :- consistent(s18, nidecker_company_founded).
evidence(all_consistent(nidecker_company_founded)).
query(true_val(nidecker_company_founded, y1887_etoy)).
query(true_val(nidecker_company_founded, unk_nidecker_company_founded)).

% @attr first_snowboard_produced
% @type categorical
% @canonical false
% @original_name First Nidecker snowboard produced
% @values y1984_rolle=1984_in_Rolle_Switzerland unk_first_snowboard_produced=Unknown
% @importance 0.40

0.90::acc(s19, first_snowboard_produced).

0.93::true_val(first_snowboard_produced, y1984_rolle); 0.07::true_val(first_snowboard_produced, unk_first_snowboard_produced).
measured(s19, first_snowboard_produced, y1984_rolle).
all_consistent(first_snowboard_produced) :- consistent(s19, first_snowboard_produced).
evidence(all_consistent(first_snowboard_produced)).
query(true_val(first_snowboard_produced, y1984_rolle)).
query(true_val(first_snowboard_produced, unk_first_snowboard_produced)).

% @attr nidecker_ownership
% @type categorical
% @canonical false
% @original_name Nidecker ownership
% @values family_owned_5gen=100pct_family_owned_fifth_generation unk_nidecker_ownership=Unknown
% @importance 0.43

0.82::acc(s18, nidecker_ownership).
0.90::acc(s20, nidecker_ownership).

0.95::true_val(nidecker_ownership, family_owned_5gen); 0.05::true_val(nidecker_ownership, unk_nidecker_ownership).
measured(s18, nidecker_ownership, family_owned_5gen).
measured(s20, nidecker_ownership, family_owned_5gen).
all_consistent(nidecker_ownership) :- consistent(s18, nidecker_ownership), consistent(s20, nidecker_ownership).
evidence(all_consistent(nidecker_ownership)).
query(true_val(nidecker_ownership, family_owned_5gen)).
query(true_val(nidecker_ownership, unk_nidecker_ownership)).

% @attr oldest_european_snowboard_brand
% @type categorical
% @canonical false
% @original_name Nidecker is the oldest European snowboard brand still in operation
% @values yes_oldest=Yes_oldest_European_snowboard_brand unk_oldest_european_snowboard_brand=Unknown
% @importance 0.40

0.90::acc(s19, oldest_european_snowboard_brand).

0.93::true_val(oldest_european_snowboard_brand, yes_oldest); 0.07::true_val(oldest_european_snowboard_brand, unk_oldest_european_snowboard_brand).
measured(s19, oldest_european_snowboard_brand, yes_oldest).
all_consistent(oldest_european_snowboard_brand) :- consistent(s19, oldest_european_snowboard_brand).
evidence(all_consistent(oldest_european_snowboard_brand)).
query(true_val(oldest_european_snowboard_brand, yes_oldest)).
query(true_val(oldest_european_snowboard_brand, unk_oldest_european_snowboard_brand)).

% @attr nidecker_group_brands
% @type categorical
% @canonical false
% @original_name Nidecker Group also owns
% @values full_portfolio=Jones_YES_Rome_Bataleon_Lobster_NOW_ThirtyTwo_etnies_eS_Emerica unk_nidecker_group_brands=Unknown
% @importance 0.45

0.82::acc(s18, nidecker_group_brands).
0.90::acc(s21, nidecker_group_brands).

0.95::true_val(nidecker_group_brands, full_portfolio); 0.05::true_val(nidecker_group_brands, unk_nidecker_group_brands).
measured(s18, nidecker_group_brands, full_portfolio).
measured(s21, nidecker_group_brands, full_portfolio).
all_consistent(nidecker_group_brands) :- consistent(s18, nidecker_group_brands), consistent(s21, nidecker_group_brands).
evidence(all_consistent(nidecker_group_brands)).
query(true_val(nidecker_group_brands, full_portfolio)).
query(true_val(nidecker_group_brands, unk_nidecker_group_brands)).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values swiss_designed_asia_assembled=Swiss_designed_assembled_in_Asia unk_manufacturing_location_current=Unknown
% @importance 0.55

0.85::acc(s22, manufacturing_location_current).

0.85::true_val(manufacturing_location_current, swiss_designed_asia_assembled); 0.15::true_val(manufacturing_location_current, unk_manufacturing_location_current).
measured(s22, manufacturing_location_current, swiss_designed_asia_assembled).
all_consistent(manufacturing_location_current) :- consistent(s22, manufacturing_location_current).
evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, swiss_designed_asia_assembled)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values one_pct_planet=One_percent_for_the_Planet unk_sustainability_certification=Unknown
% @importance 0.40

0.72::acc(s12, sustainability_certification).
0.60::acc(s23, sustainability_certification).

0.90::true_val(sustainability_certification, one_pct_planet); 0.10::true_val(sustainability_certification, unk_sustainability_certification).
measured(s12, sustainability_certification, one_pct_planet).
measured(s23, sustainability_certification, one_pct_planet).
all_consistent(sustainability_certification) :- consistent(s12, sustainability_certification), (indep(s23), consistent(s23, sustainability_certification) ; \+indep(s23)).
evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, one_pct_planet)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values two_yr_ext_three=2yr_warranty_extendable_to_3yr unk_warranty=Unknown
% @importance 0.80

0.90::acc(s3, warranty).

0.90::true_val(warranty, two_yr_ext_three); 0.10::true_val(warranty, unk_warranty).
measured(s3, warranty, two_yr_ext_three).
all_consistent(warranty) :- consistent(s3, warranty).
evidence(all_consistent(warranty)).
query(true_val(warranty, two_yr_ext_three)).
query(true_val(warranty, unk_warranty)).

% @attr nidecker_committed_since
% @type categorical
% @canonical false
% @original_name Nidecker committed to snowboarding since 1984
% @values since_1984=Committed_since_1984 unk_nidecker_committed_since=Unknown
% @importance 0.30

0.90::acc(s24, nidecker_committed_since).

0.93::true_val(nidecker_committed_since, since_1984); 0.07::true_val(nidecker_committed_since, unk_nidecker_committed_since).
measured(s24, nidecker_committed_since, since_1984).
all_consistent(nidecker_committed_since) :- consistent(s24, nidecker_committed_since).
evidence(all_consistent(nidecker_committed_since)).
query(true_val(nidecker_committed_since, since_1984)).
query(true_val(nidecker_committed_since, unk_nidecker_committed_since)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values orbital_cushioning=Orbital_Cushioning_shock_absorbing_urethane_around_inserts unk_construction_material_innovation=Unknown
% @importance 0.73

0.62::acc(s6, construction_material_innovation).
0.68::acc(s15, construction_material_innovation).
0.65::acc(s14, construction_material_innovation).

0.88::true_val(construction_material_innovation, orbital_cushioning); 0.12::true_val(construction_material_innovation, unk_construction_material_innovation).
measured(s6, construction_material_innovation, orbital_cushioning).
measured(s15, construction_material_innovation, orbital_cushioning).
measured(s14, construction_material_innovation, orbital_cushioning).
all_consistent(construction_material_innovation) :- consistent(s6, construction_material_innovation), (indep(s15), consistent(s15, construction_material_innovation) ; \+indep(s15)), (indep(s14), consistent(s14, construction_material_innovation) ; \+indep(s14)).
evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, orbital_cushioning)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr topsheet_appearance_description
% @type categorical
% @canonical true
% @original_name topsheet_appearance_description
% @values wrestlers_graphic=Updated_graphics_wrestlers_depicting_Cooper_Branham_and_Taylor_Gold unk_topsheet_appearance_description=Unknown
% @importance 0.55

0.85::acc(s25, topsheet_appearance_description).

0.85::true_val(topsheet_appearance_description, wrestlers_graphic); 0.15::true_val(topsheet_appearance_description, unk_topsheet_appearance_description).
measured(s25, topsheet_appearance_description, wrestlers_graphic).
all_consistent(topsheet_appearance_description) :- consistent(s25, topsheet_appearance_description).
evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, wrestlers_graphic)).
query(true_val(topsheet_appearance_description, unk_topsheet_appearance_description)).

% @attr lineup_positioning
% @type categorical
% @canonical false
% @original_name 2027 Sensor Pro positioned between Sensor and Sensor Mons
% @values between_sensor_and_mons=Between_Sensor_softer_and_Sensor_Mons_stiffer unk_lineup_positioning=Unknown
% @importance 0.85

0.72::acc(s4, lineup_positioning).

0.82::true_val(lineup_positioning, between_sensor_and_mons); 0.18::true_val(lineup_positioning, unk_lineup_positioning).
measured(s4, lineup_positioning, between_sensor_and_mons).
all_consistent(lineup_positioning) :- consistent(s4, lineup_positioning).
evidence(all_consistent(lineup_positioning)).
query(true_val(lineup_positioning, between_sensor_and_mons)).
query(true_val(lineup_positioning, unk_lineup_positioning)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values gold_mcmorris=Taylor_Gold_Craig_McMorris unk_pro_rider_name=Unknown
% @importance 0.85

0.94::acc(s5, pro_rider_name).
0.78::acc(s7, pro_rider_name).

0.95::true_val(pro_rider_name, gold_mcmorris); 0.05::true_val(pro_rider_name, unk_pro_rider_name).
measured(s5, pro_rider_name, gold_mcmorris).
measured(s7, pro_rider_name, gold_mcmorris).
all_consistent(pro_rider_name) :- consistent(s5, pro_rider_name), (indep(s7), consistent(s7, pro_rider_name) ; \+indep(s7)).
evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, gold_mcmorris)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr mons_association
% @type categorical
% @canonical false
% @original_name Mons Røisland associated with the related Sensor Mons signature model
% @values mons_on_sensor_mons=Mons_Roisland_on_Sensor_Mons_not_Sensor_Pro unk_mons_association=Unknown
% @importance 0.75

0.62::acc(s6, mons_association).

0.72::true_val(mons_association, mons_on_sensor_mons); 0.28::true_val(mons_association, unk_mons_association).
measured(s6, mons_association, mons_on_sensor_mons).
all_consistent(mons_association) :- consistent(s6, mons_association).
evidence(all_consistent(mons_association)).
query(true_val(mons_association, mons_on_sensor_mons)).
query(true_val(mons_association, unk_mons_association)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values true_twin=True_Twin_symmetrical unk_shape=Unknown
% @importance 0.85

0.94::acc(s1, shape).
0.78::acc(s7, shape).

0.95::true_val(shape, true_twin); 0.05::true_val(shape, unk_shape).
measured(s1, shape, true_twin).
measured(s7, shape, true_twin).
all_consistent(shape) :- consistent(s1, shape), (indep(s7), consistent(s7, shape) ; \+indep(s7)).
evidence(all_consistent(shape)).
query(true_val(shape, true_twin)).
query(true_val(shape, unk_shape)).

% @attr setback
% @type numeric
% @canonical true
% @original_name setback
% @unit mm
% @values v0=0.0 unk_setback=Unknown
% @importance 0.93

0.94::acc(s1, setback).
0.82::acc(s_merchant, setback).

0.95::true_val(setback, v0); 0.05::true_val(setback, unk_setback).
measured(s1, setback, v0).
measured(s_merchant, setback, v0).
all_consistent(setback) :- consistent(s1, setback), (indep(s_merchant), consistent(s_merchant, setback) ; \+indep(s_merchant)).
evidence(all_consistent(setback)).
query(true_val(setback, v0)).
query(true_val(setback, unk_setback)).

% @attr taper
% @type numeric
% @canonical true
% @original_name taper
% @unit mm
% @values v0=0.0 unk_taper=Unknown
% @importance 1.0

0.94::acc(s1, taper).

0.95::true_val(taper, v0); 0.05::true_val(taper, unk_taper).
measured(s1, taper, v0).
all_consistent(taper) :- consistent(s1, taper).
evidence(all_consistent(taper)).
query(true_val(taper, v0)).
query(true_val(taper, unk_taper)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values camber_pro=Camber_Pro_most_aggressive unk_camber_type=Unknown
% @importance 1.0

0.94::acc(s1, camber_type).
0.94::acc(s5, camber_type).

0.95::true_val(camber_type, camber_pro); 0.05::true_val(camber_type, unk_camber_type).
measured(s1, camber_type, camber_pro).
measured(s5, camber_type, camber_pro).
all_consistent(camber_type) :- consistent(s1, camber_type), consistent(s5, camber_type).
evidence(all_consistent(camber_type)).
query(true_val(camber_type, camber_pro)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values pronounced_extended_edge=More_pronounced_camber_extended_effective_edge_explosive_pop_locked_in_feel unk_camber_description=Unknown
% @importance 1.0

0.94::acc(s5, camber_description).

0.95::true_val(camber_description, pronounced_extended_edge); 0.05::true_val(camber_description, unk_camber_description).
measured(s5, camber_description, pronounced_extended_edge).
all_consistent(camber_description) :- consistent(s5, camber_description).
evidence(all_consistent(camber_description)).
query(true_val(camber_description, pronounced_extended_edge)).
query(true_val(camber_description, unk_camber_description)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @original_name flex_rating_10
% @unit /10
% @values v6=6.0 v7=7.0 v8=8.0
% @importance 0.90

0.80::acc(s_merchant, flex_rating_10).
0.78::acc(s14, flex_rating_10).
0.75::acc(s11, flex_rating_10).
0.93::acc(s5, flex_rating_10).
0.70::acc(s4, flex_rating_10).
0.65::acc(s7, flex_rating_10).
0.65::acc(s15, flex_rating_10).

0.15::true_val(flex_rating_10, v6); 0.20::true_val(flex_rating_10, v7); 0.65::true_val(flex_rating_10, v8).

measured(s_merchant, flex_rating_10, v6).
measured(s14, flex_rating_10, v6).
measured(s11, flex_rating_10, v7).
measured(s5, flex_rating_10, v8).
measured(s4, flex_rating_10, v8).
measured(s7, flex_rating_10, v8).
measured(s15, flex_rating_10, v8).

all_consistent(flex_rating_10) :-
    consistent(s5, flex_rating_10),
    consistent(s11, flex_rating_10),
    (indep(s_merchant), consistent(s_merchant, flex_rating_10) ; \+indep(s_merchant)),
    (indep(s14), consistent(s14, flex_rating_10) ; \+indep(s14)),
    (indep(s4), consistent(s4, flex_rating_10) ; \+indep(s4)),
    (indep(s7), consistent(s7, flex_rating_10) ; \+indep(s7)),
    (indep(s15), consistent(s15, flex_rating_10) ; \+indep(s15)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v6)).
query(true_val(flex_rating_10, v7)).
query(true_val(flex_rating_10, v8)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values stiff=Stiff mid_flex=Mid_flex
% @importance 0.93

0.93::acc(s5, flex_feel).
0.80::acc(s_merchant, flex_feel).

0.65::true_val(flex_feel, stiff); 0.35::true_val(flex_feel, mid_flex).

measured(s5, flex_feel, stiff).
measured(s_merchant, flex_feel, mid_flex).

all_consistent(flex_feel) :-
    consistent(s5, flex_feel),
    (indep(s_merchant), consistent(s_merchant, flex_feel) ; \+indep(s_merchant)).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, stiff)).
query(true_val(flex_feel, mid_flex)).

% @attr flex_direction
% @type categorical
% @canonical false
% @original_name flex_direction
% @values symmetrical=Symmetrical_twin_flex unk_flex_direction=Unknown
% @importance 0.90

0.82::acc(s9, flex_direction).

0.82::true_val(flex_direction, symmetrical); 0.18::true_val(flex_direction, unk_flex_direction).
measured(s9, flex_direction, symmetrical).
all_consistent(flex_direction) :- consistent(s9, flex_direction).
evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, symmetrical)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values premium_sandwich=Premium_Sandwich_Construction_with_carbon_stringers unk_laminate=Unknown
% @importance 0.85

0.94::acc(s5, laminate).
0.78::acc(s7, laminate).

0.95::true_val(laminate, premium_sandwich); 0.05::true_val(laminate, unk_laminate).
measured(s5, laminate, premium_sandwich).
measured(s7, laminate, premium_sandwich).
all_consistent(laminate) :- consistent(s5, laminate), (indep(s7), consistent(s7, laminate) ; \+indep(s7)).
evidence(all_consistent(laminate)).
query(true_val(laminate, premium_sandwich)).
query(true_val(laminate, unk_laminate)).

% @attr laminate_fiberglass
% @type categorical
% @canonical false
% @original_name laminate (Biax Plus)
% @values biax_plus=Biax_Plus_90deg_weave_enhanced_power unk_laminate_fiberglass=Unknown
% @importance 0.85

0.94::acc(s5, laminate_fiberglass).
0.78::acc(s7, laminate_fiberglass).

0.95::true_val(laminate_fiberglass, biax_plus); 0.05::true_val(laminate_fiberglass, unk_laminate_fiberglass).
measured(s5, laminate_fiberglass, biax_plus).
measured(s7, laminate_fiberglass, biax_plus).
all_consistent(laminate_fiberglass) :- consistent(s5, laminate_fiberglass), (indep(s7), consistent(s7, laminate_fiberglass) ; \+indep(s7)).
evidence(all_consistent(laminate_fiberglass)).
query(true_val(laminate_fiberglass, biax_plus)).
query(true_val(laminate_fiberglass, unk_laminate_fiberglass)).

% @attr laminate_performance_desc
% @type categorical
% @canonical false
% @original_name laminate (description)
% @values responsive_stiff_playful=Super_responsive_stiffer_agile_still_playful unk_laminate_performance_desc=Unknown
% @importance 1.0

0.90::acc(s5, laminate_performance_desc).

0.90::true_val(laminate_performance_desc, responsive_stiff_playful); 0.10::true_val(laminate_performance_desc, unk_laminate_performance_desc).
measured(s5, laminate_performance_desc, responsive_stiff_playful).
all_consistent(laminate_performance_desc) :- consistent(s5, laminate_performance_desc).
evidence(all_consistent(laminate_performance_desc)).
query(true_val(laminate_performance_desc, responsive_stiff_playful)).
query(true_val(laminate_performance_desc, unk_laminate_performance_desc)).

% @attr construction_material_innovation_carbon
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Pop Carbon Plus)
% @values pop_carbon_plus=Pop_Carbon_Plus_carbon_both_sides_nose_to_tail unk_construction_material_innovation_carbon=Unknown
% @importance 1.0

0.94::acc(s5, construction_material_innovation_carbon).
0.78::acc(s7, construction_material_innovation_carbon).

0.95::true_val(construction_material_innovation_carbon, pop_carbon_plus); 0.05::true_val(construction_material_innovation_carbon, unk_construction_material_innovation_carbon).
measured(s5, construction_material_innovation_carbon, pop_carbon_plus).
measured(s7, construction_material_innovation_carbon, pop_carbon_plus).
all_consistent(construction_material_innovation_carbon) :- consistent(s5, construction_material_innovation_carbon), (indep(s7), consistent(s7, construction_material_innovation_carbon) ; \+indep(s7)).
evidence(all_consistent(construction_material_innovation_carbon)).
query(true_val(construction_material_innovation_carbon, pop_carbon_plus)).
query(true_val(construction_material_innovation_carbon, unk_construction_material_innovation_carbon)).

% @attr construction_kevlar
% @type categorical
% @canonical false
% @original_name Construction includes Kevlar in addition to Carbon
% @values kevlar_included=Kevlar_in_Premium_Sandwich unk_construction_kevlar=Unknown
% @importance 0.85

0.80::acc(s8, construction_kevlar).

0.80::true_val(construction_kevlar, kevlar_included); 0.20::true_val(construction_kevlar, unk_construction_kevlar).
measured(s8, construction_kevlar, kevlar_included).
all_consistent(construction_kevlar) :- consistent(s8, construction_kevlar).
evidence(all_consistent(construction_kevlar)).
query(true_val(construction_kevlar, kevlar_included)).
query(true_val(construction_kevlar, unk_construction_kevlar)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values paulownia_poplar_beech=Light_Core_Paulownia_Poplar_Beech paulownia_poplar_beech_spruce=Light_Core_Paulownia_Poplar_Beech_Spruce
% @importance 0.92

0.94::acc(s5, core_material).
0.78::acc(s7, core_material).
0.72::acc(s11, core_material).

0.70::true_val(core_material, paulownia_poplar_beech); 0.30::true_val(core_material, paulownia_poplar_beech_spruce).

measured(s5, core_material, paulownia_poplar_beech).
measured(s7, core_material, paulownia_poplar_beech).
measured(s11, core_material, paulownia_poplar_beech_spruce).

all_consistent(core_material) :-
    consistent(s5, core_material),
    consistent(s11, core_material),
    (indep(s7), consistent(s7, core_material) ; \+indep(s7)).

evidence(all_consistent(core_material)).
query(true_val(core_material, paulownia_poplar_beech)).
query(true_val(core_material, paulownia_poplar_beech_spruce)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values n9000_sintered=N9000_Sintered_super_dense_high_carbon n7000=N7000
% @importance 0.90

0.94::acc(s5, base_material).
0.78::acc(s7, base_material).
0.55::acc(s11, base_material).

0.85::true_val(base_material, n9000_sintered); 0.15::true_val(base_material, n7000).

measured(s5, base_material, n9000_sintered).
measured(s7, base_material, n9000_sintered).
measured(s11, base_material, n7000).

all_consistent(base_material) :-
    consistent(s5, base_material),
    consistent(s11, base_material),
    (indep(s7), consistent(s7, base_material) ; \+indep(s7)).

evidence(all_consistent(base_material)).
query(true_val(base_material, n9000_sintered)).
query(true_val(base_material, n7000)).

% @attr base_type
% @type categorical
% @canonical false
% @original_name base_type
% @values sintered=Sintered unk_base_type=Unknown
% @importance 1.0

0.94::acc(s5, base_type).

0.95::true_val(base_type, sintered); 0.05::true_val(base_type, unk_base_type).
measured(s5, base_type, sintered).
all_consistent(base_type) :- consistent(s5, base_type).
evidence(all_consistent(base_type)).
query(true_val(base_type, sintered)).
query(true_val(base_type, unk_base_type)).

% @attr base_graphics
% @type categorical
% @canonical false
% @original_name Base graphics
% @values diecut=Diecut_base_pure_color_jigsaw unk_base_graphics=Unknown
% @importance 1.0

0.90::acc(s5, base_graphics).

0.90::true_val(base_graphics, diecut); 0.10::true_val(base_graphics, unk_base_graphics).
measured(s5, base_graphics, diecut).
all_consistent(base_graphics) :- consistent(s5, base_graphics).
evidence(all_consistent(base_graphics)).
query(true_val(base_graphics, diecut)).
query(true_val(base_graphics, unk_base_graphics)).

% @attr topsheet
% @type categorical
% @canonical true
% @original_name topsheet
% @values absorbnid=Absorbnid_Topsheet_vibration_dampening unk_topsheet=Unknown
% @importance 0.93

0.94::acc(s5, topsheet).
0.78::acc(s7, topsheet).
0.75::acc(s11, topsheet).

0.95::true_val(topsheet, absorbnid); 0.05::true_val(topsheet, unk_topsheet).
measured(s5, topsheet, absorbnid).
measured(s7, topsheet, absorbnid).
measured(s11, topsheet, absorbnid).
all_consistent(topsheet) :- consistent(s5, topsheet), consistent(s11, topsheet), (indep(s7), consistent(s7, topsheet) ; \+indep(s7)).
evidence(all_consistent(topsheet)).
query(true_val(topsheet, absorbnid)).
query(true_val(topsheet, unk_topsheet)).

% @attr topsheet_appearance_description_finish
% @type categorical
% @canonical false
% @original_name topsheet_appearance_description (Matte finish)
% @values matte=Matte_finish unk_topsheet_appearance_description_finish=Unknown
% @importance 1.0

0.90::acc(s5, topsheet_appearance_description_finish).

0.90::true_val(topsheet_appearance_description_finish, matte); 0.10::true_val(topsheet_appearance_description_finish, unk_topsheet_appearance_description_finish).
measured(s5, topsheet_appearance_description_finish, matte).
all_consistent(topsheet_appearance_description_finish) :- consistent(s5, topsheet_appearance_description_finish).
evidence(all_consistent(topsheet_appearance_description_finish)).
query(true_val(topsheet_appearance_description_finish, matte)).
query(true_val(topsheet_appearance_description_finish, unk_topsheet_appearance_description_finish)).

% @attr topsheet_appearance_description_ink
% @type categorical
% @canonical false
% @original_name topsheet_appearance_description (Neon Color inks)
% @values neon_overprint=Neon_Color_inks_plus_Overprint unk_topsheet_appearance_description_ink=Unknown
% @importance 1.0

0.90::acc(s5, topsheet_appearance_description_ink).

0.90::true_val(topsheet_appearance_description_ink, neon_overprint); 0.10::true_val(topsheet_appearance_description_ink, unk_topsheet_appearance_description_ink).
measured(s5, topsheet_appearance_description_ink, neon_overprint).
all_consistent(topsheet_appearance_description_ink) :- consistent(s5, topsheet_appearance_description_ink).
evidence(all_consistent(topsheet_appearance_description_ink)).
query(true_val(topsheet_appearance_description_ink, neon_overprint)).
query(true_val(topsheet_appearance_description_ink, unk_topsheet_appearance_description_ink)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_inserts_6_rows_2cm_intervals unk_mounting_pattern=Unknown
% @importance 0.90

0.94::acc(s1, mounting_pattern).
0.94::acc(s5, mounting_pattern).
0.75::acc(s11, mounting_pattern).

0.95::true_val(mounting_pattern, inserts_2x4); 0.05::true_val(mounting_pattern, unk_mounting_pattern).
measured(s1, mounting_pattern, inserts_2x4).
measured(s5, mounting_pattern, inserts_2x4).
measured(s11, mounting_pattern, inserts_2x4).
all_consistent(mounting_pattern) :- consistent(s1, mounting_pattern), consistent(s5, mounting_pattern), consistent(s11, mounting_pattern).
evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr binding_compatibility
% @type categorical
% @canonical false
% @original_name binding_compatibility
% @values all_except_burton_est=All_bindings_except_Burton_EST_channel unk_binding_compatibility=Unknown
% @importance 0.85

0.75::acc(s11, binding_compatibility).

0.78::true_val(binding_compatibility, all_except_burton_est); 0.22::true_val(binding_compatibility, unk_binding_compatibility).
measured(s11, binding_compatibility, all_except_burton_est).
all_consistent(binding_compatibility) :- consistent(s11, binding_compatibility).
evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, all_except_burton_est)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values five_sizes=150_154_158_158W_162 unk_available_sizes=Unknown
% @importance 0.88

0.94::acc(s1, available_sizes).
0.82::acc(s_merchant, available_sizes).

0.95::true_val(available_sizes, five_sizes); 0.05::true_val(available_sizes, unk_available_sizes).
measured(s1, available_sizes, five_sizes).
measured(s_merchant, available_sizes, five_sizes).
all_consistent(available_sizes) :- consistent(s1, available_sizes), (indep(s_merchant), consistent(s_merchant, available_sizes) ; \+indep(s_merchant)).
evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, five_sizes)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr effective_edge_150
% @type numeric
% @canonical false
% @original_name Effective edge (150cm)
% @unit mm
% @values v1160=1160.0 unk_effective_edge_150=Unknown
% @importance 0.93

0.94::acc(s1, effective_edge_150).
0.80::acc(s_merchant, effective_edge_150).

0.95::true_val(effective_edge_150, v1160); 0.05::true_val(effective_edge_150, unk_effective_edge_150).
measured(s1, effective_edge_150, v1160).
measured(s_merchant, effective_edge_150, v1160).
all_consistent(effective_edge_150) :- consistent(s1, effective_edge_150), (indep(s_merchant), consistent(s_merchant, effective_edge_150) ; \+indep(s_merchant)).
evidence(all_consistent(effective_edge_150)).
query(true_val(effective_edge_150, v1160)).
query(true_val(effective_edge_150, unk_effective_edge_150)).

% @attr contact_length_size_150
% @type numeric
% @canonical false
% @original_name contact_length_size (150cm)
% @unit mm
% @values v1040=1040.0 unk_contact_length_size_150=Unknown
% @importance 1.0

0.94::acc(s1, contact_length_size_150).

0.95::true_val(contact_length_size_150, v1040); 0.05::true_val(contact_length_size_150, unk_contact_length_size_150).
measured(s1, contact_length_size_150, v1040).
all_consistent(contact_length_size_150) :- consistent(s1, contact_length_size_150).
evidence(all_consistent(contact_length_size_150)).
query(true_val(contact_length_size_150, v1040)).
query(true_val(contact_length_size_150, unk_contact_length_size_150)).

% @attr sidecut_radius_size_150
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (150cm)
% @unit m
% @values v7_3=7.3 unk_sidecut_radius_size_150=Unknown
% @importance 0.93

0.94::acc(s1, sidecut_radius_size_150).
0.80::acc(s_merchant, sidecut_radius_size_150).

0.95::true_val(sidecut_radius_size_150, v7_3); 0.05::true_val(sidecut_radius_size_150, unk_sidecut_radius_size_150).
measured(s1, sidecut_radius_size_150, v7_3).
measured(s_merchant, sidecut_radius_size_150, v7_3).
all_consistent(sidecut_radius_size_150) :- consistent(s1, sidecut_radius_size_150), (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_150) ; \+indep(s_merchant)).
evidence(all_consistent(sidecut_radius_size_150)).
query(true_val(sidecut_radius_size_150, v7_3)).
query(true_val(sidecut_radius_size_150, unk_sidecut_radius_size_150)).

% @attr waist_width_150
% @type numeric
% @canonical false
% @original_name Waist width (150cm)
% @unit mm
% @values v246=246.0 unk_waist_width_150=Unknown
% @importance 0.93

0.94::acc(s1, waist_width_150).
0.80::acc(s_merchant, waist_width_150).

0.95::true_val(waist_width_150, v246); 0.05::true_val(waist_width_150, unk_waist_width_150).
measured(s1, waist_width_150, v246).
measured(s_merchant, waist_width_150, v246).
all_consistent(waist_width_150) :- consistent(s1, waist_width_150), (indep(s_merchant), consistent(s_merchant, waist_width_150) ; \+indep(s_merchant)).
evidence(all_consistent(waist_width_150)).
query(true_val(waist_width_150, v246)).
query(true_val(waist_width_150, unk_waist_width_150)).

% @attr underfoot_width_150
% @type numeric
% @canonical false
% @original_name Underfoot width front/rear (150cm)
% @unit mm
% @values v255_0=255.0 unk_underfoot_width_150=Unknown
% @importance 1.0

0.94::acc(s1, underfoot_width_150).

0.95::true_val(underfoot_width_150, v255_0); 0.05::true_val(underfoot_width_150, unk_underfoot_width_150).
measured(s1, underfoot_width_150, v255_0).
all_consistent(underfoot_width_150) :- consistent(s1, underfoot_width_150).
evidence(all_consistent(underfoot_width_150)).
query(true_val(underfoot_width_150, v255_0)).
query(true_val(underfoot_width_150, unk_underfoot_width_150)).

% @attr tip_tail_width_size_150
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (150cm)
% @unit mm
% @values v286_0=286.0 unk_tip_tail_width_size_150=Unknown
% @importance 1.0

0.94::acc(s1, tip_tail_width_size_150).

0.95::true_val(tip_tail_width_size_150, v286_0); 0.05::true_val(tip_tail_width_size_150, unk_tip_tail_width_size_150).
measured(s1, tip_tail_width_size_150, v286_0).
all_consistent(tip_tail_width_size_150) :- consistent(s1, tip_tail_width_size_150).
evidence(all_consistent(tip_tail_width_size_150)).
query(true_val(tip_tail_width_size_150, v286_0)).
query(true_val(tip_tail_width_size_150, unk_tip_tail_width_size_150)).

% @attr stance_width_ref_150
% @type numeric
% @canonical false
% @original_name stance_width_range_size reference (150cm)
% @unit mm
% @values v520=520.0 unk_stance_width_ref_150=Unknown
% @importance 1.0

0.94::acc(s1, stance_width_ref_150).

0.95::true_val(stance_width_ref_150, v520); 0.05::true_val(stance_width_ref_150, unk_stance_width_ref_150).
measured(s1, stance_width_ref_150, v520).
all_consistent(stance_width_ref_150) :- consistent(s1, stance_width_ref_150).
evidence(all_consistent(stance_width_ref_150)).
query(true_val(stance_width_ref_150, v520)).
query(true_val(stance_width_ref_150, unk_stance_width_ref_150)).

% @attr stance_width_range_size_150
% @type categorical
% @canonical false
% @original_name stance_width_range_size (150cm)
% @unit mm
% @values r480_600=480-600mm unk_stance_width_range_size_150=Unknown
% @importance 1.0

0.94::acc(s1, stance_width_range_size_150).

0.95::true_val(stance_width_range_size_150, r480_600); 0.05::true_val(stance_width_range_size_150, unk_stance_width_range_size_150).
measured(s1, stance_width_range_size_150, r480_600).
all_consistent(stance_width_range_size_150) :- consistent(s1, stance_width_range_size_150).
evidence(all_consistent(stance_width_range_size_150)).
query(true_val(stance_width_range_size_150, r480_600)).
query(true_val(stance_width_range_size_150, unk_stance_width_range_size_150)).

% @attr recommended_weight_range_size_150
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (150cm)
% @values w50_75kg=50-75kg_110-165lbs unk_recommended_weight_range_size_150=Unknown
% @importance 1.0

0.94::acc(s1, recommended_weight_range_size_150).

0.95::true_val(recommended_weight_range_size_150, w50_75kg); 0.05::true_val(recommended_weight_range_size_150, unk_recommended_weight_range_size_150).
measured(s1, recommended_weight_range_size_150, w50_75kg).
all_consistent(recommended_weight_range_size_150) :- consistent(s1, recommended_weight_range_size_150).
evidence(all_consistent(recommended_weight_range_size_150)).
query(true_val(recommended_weight_range_size_150, w50_75kg)).
query(true_val(recommended_weight_range_size_150, unk_recommended_weight_range_size_150)).

% @attr rec_binding_size_150
% @type categorical
% @canonical false
% @original_name Recommended binding size (150cm)
% @values size_m=M unk_rec_binding_size_150=Unknown
% @importance 1.0

0.94::acc(s1, rec_binding_size_150).

0.95::true_val(rec_binding_size_150, size_m); 0.05::true_val(rec_binding_size_150, unk_rec_binding_size_150).
measured(s1, rec_binding_size_150, size_m).
all_consistent(rec_binding_size_150) :- consistent(s1, rec_binding_size_150).
evidence(all_consistent(rec_binding_size_150)).
query(true_val(rec_binding_size_150, size_m)).
query(true_val(rec_binding_size_150, unk_rec_binding_size_150)).

% @attr tail_length_150
% @type numeric
% @canonical false
% @original_name Tail length (150cm)
% @unit mm
% @values v230=230.0 unk_tail_length_150=Unknown
% @importance 1.0

0.94::acc(s1, tail_length_150).

0.95::true_val(tail_length_150, v230); 0.05::true_val(tail_length_150, unk_tail_length_150).
measured(s1, tail_length_150, v230).
all_consistent(tail_length_150) :- consistent(s1, tail_length_150).
evidence(all_consistent(tail_length_150)).
query(true_val(tail_length_150, v230)).
query(true_val(tail_length_150, unk_tail_length_150)).

% @attr effective_edge_154
% @type numeric
% @canonical false
% @original_name Effective edge (154cm)
% @unit mm
% @values v1200=1200.0 unk_effective_edge_154=Unknown
% @importance 0.93

0.94::acc(s1, effective_edge_154).
0.80::acc(s_merchant, effective_edge_154).

0.95::true_val(effective_edge_154, v1200); 0.05::true_val(effective_edge_154, unk_effective_edge_154).
measured(s1, effective_edge_154, v1200).
measured(s_merchant, effective_edge_154, v1200).
all_consistent(effective_edge_154) :- consistent(s1, effective_edge_154), (indep(s_merchant), consistent(s_merchant, effective_edge_154) ; \+indep(s_merchant)).
evidence(all_consistent(effective_edge_154)).
query(true_val(effective_edge_154, v1200)).
query(true_val(effective_edge_154, unk_effective_edge_154)).

% @attr contact_length_size_154
% @type numeric
% @canonical false
% @original_name contact_length_size (154cm)
% @unit mm
% @values v1080=1080.0 unk_contact_length_size_154=Unknown
% @importance 1.0

0.94::acc(s1, contact_length_size_154).

0.95::true_val(contact_length_size_154, v1080); 0.05::true_val(contact_length_size_154, unk_contact_length_size_154).
measured(s1, contact_length_size_154, v1080).
all_consistent(contact_length_size_154) :- consistent(s1, contact_length_size_154).
evidence(all_consistent(contact_length_size_154)).
query(true_val(contact_length_size_154, v1080)).
query(true_val(contact_length_size_154, unk_contact_length_size_154)).

% @attr sidecut_radius_size_154
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (154cm)
% @unit m
% @values v7_6=7.6 unk_sidecut_radius_size_154=Unknown
% @importance 0.93

0.94::acc(s1, sidecut_radius_size_154).
0.80::acc(s_merchant, sidecut_radius_size_154).

0.95::true_val(sidecut_radius_size_154, v7_6); 0.05::true_val(sidecut_radius_size_154, unk_sidecut_radius_size_154).
measured(s1, sidecut_radius_size_154, v7_6).
measured(s_merchant, sidecut_radius_size_154, v7_6).
all_consistent(sidecut_radius_size_154) :- consistent(s1, sidecut_radius_size_154), (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_154) ; \+indep(s_merchant)).
evidence(all_consistent(sidecut_radius_size_154)).
query(true_val(sidecut_radius_size_154, v7_6)).
query(true_val(sidecut_radius_size_154, unk_sidecut_radius_size_154)).

% @attr tip_tail_width_size_154
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (154cm)
% @unit mm
% @values v294=294.0 unk_tip_tail_width_size_154=Unknown
% @importance 0.93

0.94::acc(s1, tip_tail_width_size_154).
0.80::acc(s_merchant, tip_tail_width_size_154).

0.95::true_val(tip_tail_width_size_154, v294); 0.05::true_val(tip_tail_width_size_154, unk_tip_tail_width_size_154).
measured(s1, tip_tail_width_size_154, v294).
measured(s_merchant, tip_tail_width_size_154, v294).
all_consistent(tip_tail_width_size_154) :- consistent(s1, tip_tail_width_size_154), (indep(s_merchant), consistent(s_merchant, tip_tail_width_size_154) ; \+indep(s_merchant)).
evidence(all_consistent(tip_tail_width_size_154)).
query(true_val(tip_tail_width_size_154, v294)).
query(true_val(tip_tail_width_size_154, unk_tip_tail_width_size_154)).

% @attr waist_width_154
% @type numeric
% @canonical false
% @original_name Waist width (154cm)
% @unit mm
% @values v252=252.0 unk_waist_width_154=Unknown
% @importance 0.93

0.94::acc(s1, waist_width_154).
0.80::acc(s_merchant, waist_width_154).

0.95::true_val(waist_width_154, v252); 0.05::true_val(waist_width_154, unk_waist_width_154).
measured(s1, waist_width_154, v252).
measured(s_merchant, waist_width_154, v252).
all_consistent(waist_width_154) :- consistent(s1, waist_width_154), (indep(s_merchant), consistent(s_merchant, waist_width_154) ; \+indep(s_merchant)).
evidence(all_consistent(waist_width_154)).
query(true_val(waist_width_154, v252)).
query(true_val(waist_width_154, unk_waist_width_154)).

% @attr underfoot_width_154
% @type numeric
% @canonical false
% @original_name Underfoot width front/rear (154cm)
% @unit mm
% @values v261_0=261.0 unk_underfoot_width_154=Unknown
% @importance 1.0

0.94::acc(s1, underfoot_width_154).

0.95::true_val(underfoot_width_154, v261_0); 0.05::true_val(underfoot_width_154, unk_underfoot_width_154).
measured(s1, underfoot_width_154, v261_0).
all_consistent(underfoot_width_154) :- consistent(s1, underfoot_width_154).
evidence(all_consistent(underfoot_width_154)).
query(true_val(underfoot_width_154, v261_0)).
query(true_val(underfoot_width_154, unk_underfoot_width_154)).

% @attr stance_width_ref_154
% @type numeric
% @canonical false
% @original_name stance_width_range_size reference (154cm)
% @unit mm
% @values v540=540.0 unk_stance_width_ref_154=Unknown
% @importance 0.93

0.94::acc(s1, stance_width_ref_154).
0.80::acc(s_merchant, stance_width_ref_154).

0.95::true_val(stance_width_ref_154, v540); 0.05::true_val(stance_width_ref_154, unk_stance_width_ref_154).
measured(s1, stance_width_ref_154, v540).
measured(s_merchant, stance_width_ref_154, v540).
all_consistent(stance_width_ref_154) :- consistent(s1, stance_width_ref_154), (indep(s_merchant), consistent(s_merchant, stance_width_ref_154) ; \+indep(s_merchant)).
evidence(all_consistent(stance_width_ref_154)).
query(true_val(stance_width_ref_154, v540)).
query(true_val(stance_width_ref_154, unk_stance_width_ref_154)).

% @attr stance_width_range_size_154
% @type categorical
% @canonical false
% @original_name stance_width_range_size (154cm)
% @unit mm
% @values r500_620=500-620mm unk_stance_width_range_size_154=Unknown
% @importance 1.0

0.94::acc(s1, stance_width_range_size_154).

0.95::true_val(stance_width_range_size_154, r500_620); 0.05::true_val(stance_width_range_size_154, unk_stance_width_range_size_154).
measured(s1, stance_width_range_size_154, r500_620).
all_consistent(stance_width_range_size_154) :- consistent(s1, stance_width_range_size_154).
evidence(all_consistent(stance_width_range_size_154)).
query(true_val(stance_width_range_size_154, r500_620)).
query(true_val(stance_width_range_size_154, unk_stance_width_range_size_154)).

% @attr recommended_weight_range_size_154
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (154cm)
% @values w55_80kg=55-80kg_120-175lbs unk_recommended_weight_range_size_154=Unknown
% @importance 0.93

0.94::acc(s1, recommended_weight_range_size_154).
0.80::acc(s_merchant, recommended_weight_range_size_154).

0.95::true_val(recommended_weight_range_size_154, w55_80kg); 0.05::true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154).
measured(s1, recommended_weight_range_size_154, w55_80kg).
measured(s_merchant, recommended_weight_range_size_154, w55_80kg).
all_consistent(recommended_weight_range_size_154) :- consistent(s1, recommended_weight_range_size_154), (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size_154) ; \+indep(s_merchant)).
evidence(all_consistent(recommended_weight_range_size_154)).
query(true_val(recommended_weight_range_size_154, w55_80kg)).
query(true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154)).

% @attr rec_binding_size_154
% @type categorical
% @canonical false
% @original_name Recommended binding size (154cm)
% @values size_m=M unk_rec_binding_size_154=Unknown
% @importance 1.0

0.94::acc(s1, rec_binding_size_154).

0.95::true_val(rec_binding_size_154, size_m); 0.05::true_val(rec_binding_size_154, unk_rec_binding_size_154).
measured(s1, rec_binding_size_154, size_m).
all_consistent(rec_binding_size_154) :- consistent(s1, rec_binding_size_154).
evidence(all_consistent(rec_binding_size_154)).
query(true_val(rec_binding_size_154, size_m)).
query(true_val(rec_binding_size_154, unk_rec_binding_size_154)).

% @attr tail_length_154
% @type numeric
% @canonical false
% @original_name Tail length (154cm)
% @unit mm
% @values v230=230.0 unk_tail_length_154=Unknown
% @importance 1.0

0.94::acc(s1, tail_length_154).

0.95::true_val(tail_length_154, v230); 0.05::true_val(tail_length_154, unk_tail_length_154).
measured(s1, tail_length_154, v230).
all_consistent(tail_length_154) :- consistent(s1, tail_length_154).
evidence(all_consistent(tail_length_154)).
query(true_val(tail_length_154, v230)).
query(true_val(tail_length_154, unk_tail_length_154)).

% @attr effective_edge_158
% @type numeric
% @canonical false
% @original_name Effective edge (158cm)
% @unit mm
% @values v1240=1240.0 unk_effective_edge_158=Unknown
% @importance 0.93

0.94::acc(s1, effective_edge_158).
0.80::acc(s_merchant, effective_edge_158).

0.95::true_val(effective_edge_158, v1240); 0.05::true_val(effective_edge_158, unk_effective_edge_158).
measured(s1, effective_edge_158, v1240).
measured(s_merchant, effective_edge_158, v1240).
all_consistent(effective_edge_158) :- consistent(s1, effective_edge_158), (indep(s_merchant), consistent(s_merchant, effective_edge_158) ; \+indep(s_merchant)).
evidence(all_consistent(effective_edge_158)).
query(true_val(effective_edge_158, v1240)).
query(true_val(effective_edge_158, unk_effective_edge_158)).

% @attr contact_length_size
% @type numeric
% @canonical true
% @original_name contact_length_size (158cm)
% @unit mm
% @values v1120=1120.0 unk_contact_length_size=Unknown
% @importance 1.0

0.94::acc(s1, contact_length_size).

0.95::true_val(contact_length_size, v1120); 0.05::true_val(contact_length_size, unk_contact_length_size).
measured(s1, contact_length_size, v1120).
all_consistent(contact_length_size) :- consistent(s1, contact_length_size).
evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v1120)).
query(true_val(contact_length_size, unk_contact_length_size)).

% @attr sidecut_radius_size
% @type numeric
% @canonical true
% @original_name sidecut_radius_size (158cm)
% @unit m
% @values v7_9=7.9 unk_sidecut_radius_size=Unknown
% @importance 0.93

0.94::acc(s1, sidecut_radius_size).
0.80::acc(s_merchant, sidecut_radius_size).

0.95::true_val(sidecut_radius_size, v7_9); 0.05::true_val(sidecut_radius_size, unk_sidecut_radius_size).
measured(s1, sidecut_radius_size, v7_9).
measured(s_merchant, sidecut_radius_size, v7_9).
all_consistent(sidecut_radius_size) :- consistent(s1, sidecut_radius_size), (indep(s_merchant), consistent(s_merchant, sidecut_radius_size) ; \+indep(s_merchant)).
evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_9)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr tip_tail_width_size
% @type numeric
% @canonical true
% @original_name tip_tail_width_size (158cm)
% @unit mm
% @values v297=297.0 unk_tip_tail_width_size=Unknown
% @importance 0.93

0.94::acc(s1, tip_tail_width_size).
0.80::acc(s_merchant, tip_tail_width_size).

0.95::true_val(tip_tail_width_size, v297); 0.05::true_val(tip_tail_width_size, unk_tip_tail_width_size).
measured(s1, tip_tail_width_size, v297).
measured(s_merchant, tip_tail_width_size, v297).
all_consistent(tip_tail_width_size) :- consistent(s1, tip_tail_width_size), (indep(s_merchant), consistent(s_merchant, tip_tail_width_size) ; \+indep(s_merchant)).
evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v297)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr waist_width_158
% @type numeric
% @canonical false
% @original_name Waist width (158cm)
% @unit mm
% @values v254=254.0 unk_waist_width_158=Unknown
% @importance 0.93

0.94::acc(s1, waist_width_158).
0.80::acc(s_merchant, waist_width_158).

0.95::true_val(waist_width_158, v254); 0.05::true_val(waist_width_158, unk_waist_width_158).
measured(s1, waist_width_158, v254).
measured(s_merchant, waist_width_158, v254).
all_consistent(waist_width_158) :- consistent(s1, waist_width_158), (indep(s_merchant), consistent(s_merchant, waist_width_158) ; \+indep(s_merchant)).
evidence(all_consistent(waist_width_158)).
query(true_val(waist_width_158, v254)).
query(true_val(waist_width_158, unk_waist_width_158)).

% @attr underfoot_width_158
% @type numeric
% @canonical false
% @original_name Underfoot width front/rear (158cm)
% @unit mm
% @values v264_0=264.0 unk_underfoot_width_158=Unknown
% @importance 1.0

0.94::acc(s1, underfoot_width_158).

0.95::true_val(underfoot_width_158, v264_0); 0.05::true_val(underfoot_width_158, unk_underfoot_width_158).
measured(s1, underfoot_width_158, v264_0).
all_consistent(underfoot_width_158) :- consistent(s1, underfoot_width_158).
evidence(all_consistent(underfoot_width_158)).
query(true_val(underfoot_width_158, v264_0)).
query(true_val(underfoot_width_158, unk_underfoot_width_158)).

% @attr stance_width_ref_158
% @type numeric
% @canonical false
% @original_name stance_width_range_size reference (158cm)
% @unit mm
% @values v560=560.0 unk_stance_width_ref_158=Unknown
% @importance 0.93

0.94::acc(s1, stance_width_ref_158).
0.80::acc(s_merchant, stance_width_ref_158).

0.95::true_val(stance_width_ref_158, v560); 0.05::true_val(stance_width_ref_158, unk_stance_width_ref_158).
measured(s1, stance_width_ref_158, v560).
measured(s_merchant, stance_width_ref_158, v560).
all_consistent(stance_width_ref_158) :- consistent(s1, stance_width_ref_158), (indep(s_merchant), consistent(s_merchant, stance_width_ref_158) ; \+indep(s_merchant)).
evidence(all_consistent(stance_width_ref_158)).
query(true_val(stance_width_ref_158, v560)).
query(true_val(stance_width_ref_158, unk_stance_width_ref_158)).

% @attr stance_width_range_size
% @type categorical
% @canonical true
% @original_name stance_width_range_size (158cm)
% @unit mm
% @values r520_640=520-640mm unk_stance_width_range_size=Unknown
% @importance 1.0

0.94::acc(s1, stance_width_range_size).

0.95::true_val(stance_width_range_size, r520_640); 0.05::true_val(stance_width_range_size, unk_stance_width_range_size).
measured(s1, stance_width_range_size, r520_640).
all_consistent(stance_width_range_size) :- consistent(s1, stance_width_range_size).
evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, r520_640)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size (158cm)
% @values w65_90kg=65-90kg_145-200lbs unk_recommended_weight_range_size=Unknown
% @importance 0.93

0.94::acc(s1, recommended_weight_range_size).
0.80::acc(s_merchant, recommended_weight_range_size).

0.95::true_val(recommended_weight_range_size, w65_90kg); 0.05::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).
measured(s1, recommended_weight_range_size, w65_90kg).
measured(s_merchant, recommended_weight_range_size, w65_90kg).
all_consistent(recommended_weight_range_size) :- consistent(s1, recommended_weight_range_size), (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size) ; \+indep(s_merchant)).
evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w65_90kg)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr rec_binding_size_158
% @type categorical
% @canonical false
% @original_name Recommended binding size (158cm)
% @values size_l=L unk_rec_binding_size_158=Unknown
% @importance 1.0

0.94::acc(s1, rec_binding_size_158).

0.95::true_val(rec_binding_size_158, size_l); 0.05::true_val(rec_binding_size_158, unk_rec_binding_size_158).
measured(s1, rec_binding_size_158, size_l).
all_consistent(rec_binding_size_158) :- consistent(s1, rec_binding_size_158).
evidence(all_consistent(rec_binding_size_158)).
query(true_val(rec_binding_size_158, size_l)).
query(true_val(rec_binding_size_158, unk_rec_binding_size_158)).

% @attr tail_length_158
% @type numeric
% @canonical false
% @original_name Tail length (158cm)
% @unit mm
% @values v230=230.0 unk_tail_length_158=Unknown
% @importance 1.0

0.94::acc(s1, tail_length_158).

0.95::true_val(tail_length_158, v230); 0.05::true_val(tail_length_158, unk_tail_length_158).
measured(s1, tail_length_158, v230).
all_consistent(tail_length_158) :- consistent(s1, tail_length_158).
evidence(all_consistent(tail_length_158)).
query(true_val(tail_length_158, v230)).
query(true_val(tail_length_158, unk_tail_length_158)).

% @attr effective_edge_158w
% @type numeric
% @canonical false
% @original_name Effective edge (158W)
% @unit mm
% @values v1240=1240.0 unk_effective_edge_158w=Unknown
% @importance 0.93

0.94::acc(s1, effective_edge_158w).
0.80::acc(s_merchant, effective_edge_158w).

0.95::true_val(effective_edge_158w, v1240); 0.05::true_val(effective_edge_158w, unk_effective_edge_158w).
measured(s1, effective_edge_158w, v1240).
measured(s_merchant, effective_edge_158w, v1240).
all_consistent(effective_edge_158w) :- consistent(s1, effective_edge_158w), (indep(s_merchant), consistent(s_merchant, effective_edge_158w) ; \+indep(s_merchant)).
evidence(all_consistent(effective_edge_158w)).
query(true_val(effective_edge_158w, v1240)).
query(true_val(effective_edge_158w, unk_effective_edge_158w)).

% @attr contact_length_size_158w
% @type numeric
% @canonical false
% @original_name contact_length_size (158W)
% @unit mm
% @values v1120=1120.0 unk_contact_length_size_158w=Unknown
% @importance 1.0

0.94::acc(s1, contact_length_size_158w).

0.95::true_val(contact_length_size_158w, v1120); 0.05::true_val(contact_length_size_158w, unk_contact_length_size_158w).
measured(s1, contact_length_size_158w, v1120).
all_consistent(contact_length_size_158w) :- consistent(s1, contact_length_size_158w).
evidence(all_consistent(contact_length_size_158w)).
query(true_val(contact_length_size_158w, v1120)).
query(true_val(contact_length_size_158w, unk_contact_length_size_158w)).

% @attr sidecut_radius_size_158w
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (158W)
% @unit m
% @values v7_9=7.9 unk_sidecut_radius_size_158w=Unknown
% @importance 0.93

0.94::acc(s1, sidecut_radius_size_158w).
0.80::acc(s_merchant, sidecut_radius_size_158w).

0.95::true_val(sidecut_radius_size_158w, v7_9); 0.05::true_val(sidecut_radius_size_158w, unk_sidecut_radius_size_158w).
measured(s1, sidecut_radius_size_158w, v7_9).
measured(s_merchant, sidecut_radius_size_158w, v7_9).
all_consistent(sidecut_radius_size_158w) :- consistent(s1, sidecut_radius_size_158w), (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_158w) ; \+indep(s_merchant)).
evidence(all_consistent(sidecut_radius_size_158w)).
query(true_val(sidecut_radius_size_158w, v7_9)).
query(true_val(sidecut_radius_size_158w, unk_sidecut_radius_size_158w)).

% @attr tip_tail_width_size_158w
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (158W)
% @unit mm
% @values v309=309.0 unk_tip_tail_width_size_158w=Unknown
% @importance 0.93

0.94::acc(s1, tip_tail_width_size_158w).
0.80::acc(s_merchant, tip_tail_width_size_158w).

0.95::true_val(tip_tail_width_size_158w, v309); 0.05::true_val(tip_tail_width_size_158w, unk_tip_tail_width_size_158w).
measured(s1, tip_tail_width_size_158w, v309).
measured(s_merchant, tip_tail_width_size_158w, v309).
all_consistent(tip_tail_width_size_158w) :- consistent(s1, tip_tail_width_size_158w), (indep(s_merchant), consistent(s_merchant, tip_tail_width_size_158w) ; \+indep(s_merchant)).
evidence(all_consistent(tip_tail_width_size_158w)).
query(true_val(tip_tail_width_size_158w, v309)).
query(true_val(tip_tail_width_size_158w, unk_tip_tail_width_size_158w)).

% @attr waist_width_158w
% @type numeric
% @canonical false
% @original_name Waist width (158W)
% @unit mm
% @values v265=265.0 unk_waist_width_158w=Unknown
% @importance 0.93

0.94::acc(s1, waist_width_158w).
0.80::acc(s_merchant, waist_width_158w).

0.95::true_val(waist_width_158w, v265); 0.05::true_val(waist_width_158w, unk_waist_width_158w).
measured(s1, waist_width_158w, v265).
measured(s_merchant, waist_width_158w, v265).
all_consistent(waist_width_158w) :- consistent(s1, waist_width_158w), (indep(s_merchant), consistent(s_merchant, waist_width_158w) ; \+indep(s_merchant)).
evidence(all_consistent(waist_width_158w)).
query(true_val(waist_width_158w, v265)).
query(true_val(waist_width_158w, unk_waist_width_158w)).

% @attr underfoot_width_158w
% @type numeric
% @canonical false
% @original_name Underfoot width front/rear (158W)
% @unit mm
% @values v275_0=275.0 unk_underfoot_width_158w=Unknown
% @importance 1.0

0.94::acc(s1, underfoot_width_158w).

0.95::true_val(underfoot_width_158w, v275_0); 0.05::true_val(underfoot_width_158w, unk_underfoot_width_158w).
measured(s1, underfoot_width_158w, v275_0).
all_consistent(underfoot_width_158w) :- consistent(s1, underfoot_width_158w).
evidence(all_consistent(underfoot_width_158w)).
query(true_val(underfoot_width_158w, v275_0)).
query(true_val(underfoot_width_158w, unk_underfoot_width_158w)).

% @attr stance_width_ref_158w
% @type numeric
% @canonical false
% @original_name stance_width_range_size reference (158W)
% @unit mm
% @values v560=560.0 unk_stance_width_ref_158w=Unknown
% @importance 1.0

0.94::acc(s1, stance_width_ref_158w).

0.95::true_val(stance_width_ref_158w, v560); 0.05::true_val(stance_width_ref_158w, unk_stance_width_ref_158w).
measured(s1, stance_width_ref_158w, v560).
all_consistent(stance_width_ref_158w) :- consistent(s1, stance_width_ref_158w).
evidence(all_consistent(stance_width_ref_158w)).
query(true_val(stance_width_ref_158w, v560)).
query(true_val(stance_width_ref_158w, unk_stance_width_ref_158w)).

% @attr stance_width_range_size_158w
% @type categorical
% @canonical false
% @original_name stance_width_range_size (158W)
% @unit mm
% @values r520_640=520-640mm unk_stance_width_range_size_158w=Unknown
% @importance 1.0

0.94::acc(s1, stance_width_range_size_158w).

0.95::true_val(stance_width_range_size_158w, r520_640); 0.05::true_val(stance_width_range_size_158w, unk_stance_width_range_size_158w).
measured(s1, stance_width_range_size_158w, r520_640).
all_consistent(stance_width_range_size_158w) :- consistent(s1, stance_width_range_size_158w).
evidence(all_consistent(stance_width_range_size_158w)).
query(true_val(stance_width_range_size_158w, r520_640)).
query(true_val(stance_width_range_size_158w, unk_stance_width_range_size_158w)).

% @attr recommended_weight_range_size_158w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (158W)
% @values w65_90kg=65-90kg_145-200lbs unk_recommended_weight_range_size_158w=Unknown
% @importance 0.93

0.94::acc(s1, recommended_weight_range_size_158w).
0.80::acc(s_merchant, recommended_weight_range_size_158w).

0.95::true_val(recommended_weight_range_size_158w, w65_90kg); 0.05::true_val(recommended_weight_range_size_158w, unk_recommended_weight_range_size_158w).
measured(s1, recommended_weight_range_size_158w, w65_90kg).
measured(s_merchant, recommended_weight_range_size_158w, w65_90kg).
all_consistent(recommended_weight_range_size_158w) :- consistent(s1, recommended_weight_range_size_158w), (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size_158w) ; \+indep(s_merchant)).
evidence(all_consistent(recommended_weight_range_size_158w)).
query(true_val(recommended_weight_range_size_158w, w65_90kg)).
query(true_val(recommended_weight_range_size_158w, unk_recommended_weight_range_size_158w)).

% @attr rec_binding_size_158w
% @type categorical
% @canonical false
% @original_name Recommended binding size (158W)
% @values size_xl=XL unk_rec_binding_size_158w=Unknown
% @importance 1.0

0.94::acc(s1, rec_binding_size_158w).

0.95::true_val(rec_binding_size_158w, size_xl); 0.05::true_val(rec_binding_size_158w, unk_rec_binding_size_158w).
measured(s1, rec_binding_size_158w, size_xl).
all_consistent(rec_binding_size_158w) :- consistent(s1, rec_binding_size_158w).
evidence(all_consistent(rec_binding_size_158w)).
query(true_val(rec_binding_size_158w, size_xl)).
query(true_val(rec_binding_size_158w, unk_rec_binding_size_158w)).

% @attr tail_length_158w
% @type numeric
% @canonical false
% @original_name Tail length (158W)
% @unit mm
% @values v230=230.0 unk_tail_length_158w=Unknown
% @importance 1.0

0.94::acc(s1, tail_length_158w).

0.95::true_val(tail_length_158w, v230); 0.05::true_val(tail_length_158w, unk_tail_length_158w).
measured(s1, tail_length_158w, v230).
all_consistent(tail_length_158w) :- consistent(s1, tail_length_158w).
evidence(all_consistent(tail_length_158w)).
query(true_val(tail_length_158w, v230)).
query(true_val(tail_length_158w, unk_tail_length_158w)).

% @attr effective_edge_162
% @type numeric
% @canonical false
% @original_name Effective edge (162cm)
% @unit mm
% @values v1280=1280.0 unk_effective_edge_162=Unknown
% @importance 0.93

0.94::acc(s1, effective_edge_162).
0.80::acc(s_merchant, effective_edge_162).

0.95::true_val(effective_edge_162, v1280); 0.05::true_val(effective_edge_162, unk_effective_edge_162).
measured(s1, effective_edge_162, v1280).
measured(s_merchant, effective_edge_162, v1280).
all_consistent(effective_edge_162) :- consistent(s1, effective_edge_162), (indep(s_merchant), consistent(s_merchant, effective_edge_162) ; \+indep(s_merchant)).
evidence(all_consistent(effective_edge_162)).
query(true_val(effective_edge_162, v1280)).
query(true_val(effective_edge_162, unk_effective_edge_162)).

% @attr contact_length_size_162
% @type numeric
% @canonical false
% @original_name contact_length_size (162cm)
% @unit mm
% @values v1160=1160.0 unk_contact_length_size_162=Unknown
% @importance 1.0

0.94::acc(s1, contact_length_size_162).

0.95::true_val(contact_length_size_162, v1160); 0.05::true_val(contact_length_size_162, unk_contact_length_size_162).
measured(s1, contact_length_size_162, v1160).
all_consistent(contact_length_size_162) :- consistent(s1, contact_length_size_162).
evidence(all_consistent(contact_length_size_162)).
query(true_val(contact_length_size_162, v1160)).
query(true_val(contact_length_size_162, unk_contact_length_size_162)).

% @attr sidecut_radius_size_162
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (162cm)
% @unit m
% @values v8_2=8.2 unk_sidecut_radius_size_162=Unknown
% @importance 0.93

0.94::acc(s1, sidecut_radius_size_162).
0.80::acc(s_merchant, sidecut_radius_size_162).

0.95::true_val(sidecut_radius_size_162, v8_2); 0.05::true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162).
measured(s1, sidecut_radius_size_162, v8_2).
measured(s_merchant, sidecut_radius_size_162, v8_2).
all_consistent(sidecut_radius_size_162) :- consistent(s1, sidecut_radius_size_162), (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_162) ; \+indep(s_merchant)).
evidence(all_consistent(sidecut_radius_size_162)).
query(true_val(sidecut_radius_size_162, v8_2)).
query(true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162)).

% @attr waist_width_162
% @type numeric
% @canonical false
% @original_name Waist width (162cm)
% @unit mm
% @values v256=256.0 unk_waist_width_162=Unknown
% @importance 0.93

0.94::acc(s1, waist_width_162).
0.80::acc(s_merchant, waist_width_162).

0.95::true_val(waist_width_162, v256); 0.05::true_val(waist_width_162, unk_waist_width_162).
measured(s1, waist_width_162, v256).
measured(s_merchant, waist_width_162, v256).
all_consistent(waist_width_162) :- consistent(s1, waist_width_162), (indep(s_merchant), consistent(s_merchant, waist_width_162) ; \+indep(s_merchant)).
evidence(all_consistent(waist_width_162)).
query(true_val(waist_width_162, v256)).
query(true_val(waist_width_162, unk_waist_width_162)).

% @attr underfoot_width_162
% @type numeric
% @canonical false
% @original_name Underfoot width front/rear (162cm)
% @unit mm
% @values v266_0=266.0 unk_underfoot_width_162=Unknown
% @importance 1.0

0.94::acc(s1, underfoot_width_162).

0.95::true_val(underfoot_width_162, v266_0); 0.05::true_val(underfoot_width_162, unk_underfoot_width_162).
measured(s1, underfoot_width_162, v266_0).
all_consistent(underfoot_width_162) :- consistent(s1, underfoot_width_162).
evidence(all_consistent(underfoot_width_162)).
query(true_val(underfoot_width_162, v266_0)).
query(true_val(underfoot_width_162, unk_underfoot_width_162)).

% @attr tip_tail_width_size_162
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (162cm)
% @unit mm
% @values v301=301.0 unk_tip_tail_width_size_162=Unknown
% @importance 1.0

0.94::acc(s1, tip_tail_width_size_162).

0.95::true_val(tip_tail_width_size_162, v301); 0.05::true_val(tip_tail_width_size_162, unk_tip_tail_width_size_162).
measured(s1, tip_tail_width_size_162, v301).
all_consistent(tip_tail_width_size_162) :- consistent(s1, tip_tail_width_size_162).
evidence(all_consistent(tip_tail_width_size_162)).
query(true_val(tip_tail_width_size_162, v301)).
query(true_val(tip_tail_width_size_162, unk_tip_tail_width_size_162)).

% @attr stance_width_ref_162
% @type numeric
% @canonical false
% @original_name stance_width_range_size reference (162cm)
% @unit mm
% @values v560=560.0 unk_stance_width_ref_162=Unknown
% @importance 1.0

0.94::acc(s1, stance_width_ref_162).

0.95::true_val(stance_width_ref_162, v560); 0.05::true_val(stance_width_ref_162, unk_stance_width_ref_162).
measured(s1, stance_width_ref_162, v560).
all_consistent(stance_width_ref_162) :- consistent(s1, stance_width_ref_162).
evidence(all_consistent(stance_width_ref_162)).
query(true_val(stance_width_ref_162, v560)).
query(true_val(stance_width_ref_162, unk_stance_width_ref_162)).

% @attr stance_width_range_size_162
% @type categorical
% @canonical false
% @original_name stance_width_range_size (162cm)
% @unit mm
% @values r520_640=520-640mm unk_stance_width_range_size_162=Unknown
% @importance 1.0

0.94::acc(s1, stance_width_range_size_162).

0.95::true_val(stance_width_range_size_162, r520_640); 0.05::true_val(stance_width_range_size_162, unk_stance_width_range_size_162).
measured(s1, stance_width_range_size_162, r520_640).
all_consistent(stance_width_range_size_162) :- consistent(s1, stance_width_range_size_162).
evidence(all_consistent(stance_width_range_size_162)).
query(true_val(stance_width_range_size_162, r520_640)).
query(true_val(stance_width_range_size_162, unk_stance_width_range_size_162)).

% @attr recommended_weight_range_size_162
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (162cm)
% @values w75_plus=75plus_kg_165plus_lbs unk_recommended_weight_range_size_162=Unknown
% @importance 0.93

0.94::acc(s1, recommended_weight_range_size_162).
0.80::acc(s_merchant, recommended_weight_range_size_162).

0.95::true_val(recommended_weight_range_size_162, w75_plus); 0.05::true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162).
measured(s1, recommended_weight_range_size_162, w75_plus).
measured(s_merchant, recommended_weight_range_size_162, w75_plus).
all_consistent(recommended_weight_range_size_162) :- consistent(s1, recommended_weight_range_size_162), (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size_162) ; \+indep(s_merchant)).
evidence(all_consistent(recommended_weight_range_size_162)).
query(true_val(recommended_weight_range_size_162, w75_plus)).
query(true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162)).

% @attr rec_binding_size_162
% @type categorical
% @canonical false
% @original_name Recommended binding size (162cm)
% @values size_l_xl=L-XL unk_rec_binding_size_162=Unknown
% @importance 1.0

0.94::acc(s1, rec_binding_size_162).

0.95::true_val(rec_binding_size_162, size_l_xl); 0.05::true_val(rec_binding_size_162, unk_rec_binding_size_162).
measured(s1, rec_binding_size_162, size_l_xl).
all_consistent(rec_binding_size_162) :- consistent(s1, rec_binding_size_162).
evidence(all_consistent(rec_binding_size_162)).
query(true_val(rec_binding_size_162, size_l_xl)).
query(true_val(rec_binding_size_162, unk_rec_binding_size_162)).

% @attr tail_length_162
% @type numeric
% @canonical false
% @original_name Tail length (162cm)
% @unit mm
% @values v230=230.0 unk_tail_length_162=Unknown
% @importance 1.0

0.94::acc(s1, tail_length_162).

0.95::true_val(tail_length_162, v230); 0.05::true_val(tail_length_162, unk_tail_length_162).
measured(s1, tail_length_162, v230).
all_consistent(tail_length_162) :- consistent(s1, tail_length_162).
evidence(all_consistent(tail_length_162)).
query(true_val(tail_length_162, v230)).
query(true_val(tail_length_162, unk_tail_length_162)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide_158W_only unk_width_options=Unknown
% @importance 0.93

0.94::acc(s1, width_options).
0.82::acc(s_merchant, width_options).

0.95::true_val(width_options, standard_and_wide); 0.05::true_val(width_options, unk_width_options).
measured(s1, width_options, standard_and_wide).
measured(s_merchant, width_options, standard_and_wide).
all_consistent(width_options) :- consistent(s1, width_options), (indep(s_merchant), consistent(s_merchant, width_options) ; \+indep(s_merchant)).
evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values park_freestyle_am_street=Park_freestyle_all_mountain_street unk_terrain_suitability=Unknown
% @importance 0.85

0.82::acc(s_merchant, terrain_suitability).

0.90::true_val(terrain_suitability, park_freestyle_am_street); 0.10::true_val(terrain_suitability, unk_terrain_suitability).
measured(s_merchant, terrain_suitability, park_freestyle_am_street).
all_consistent(terrain_suitability) :- consistent(s_merchant, terrain_suitability).
evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, park_freestyle_am_street)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr terrain_suitability_park
% @type numeric
% @canonical false
% @original_name terrain_suitability (Park rating)
% @unit /5
% @values v5=5.0 unk_terrain_suitability_park=Unknown
% @importance 1.0

0.94::acc(s5, terrain_suitability_park).

0.95::true_val(terrain_suitability_park, v5); 0.05::true_val(terrain_suitability_park, unk_terrain_suitability_park).
measured(s5, terrain_suitability_park, v5).
all_consistent(terrain_suitability_park) :- consistent(s5, terrain_suitability_park).
evidence(all_consistent(terrain_suitability_park)).
query(true_val(terrain_suitability_park, v5)).
query(true_val(terrain_suitability_park, unk_terrain_suitability_park)).

% @attr terrain_suitability_resort
% @type numeric
% @canonical false
% @original_name terrain_suitability (Resort rating)
% @unit /5
% @values v4=4.0 unk_terrain_suitability_resort=Unknown
% @importance 1.0

0.94::acc(s5, terrain_suitability_resort).

0.95::true_val(terrain_suitability_resort, v4); 0.05::true_val(terrain_suitability_resort, unk_terrain_suitability_resort).
measured(s5, terrain_suitability_resort, v4).
all_consistent(terrain_suitability_resort) :- consistent(s5, terrain_suitability_resort).
evidence(all_consistent(terrain_suitability_resort)).
query(true_val(terrain_suitability_resort, v4)).
query(true_val(terrain_suitability_resort, unk_terrain_suitability_resort)).

% @attr terrain_suitability_powder
% @type numeric
% @canonical false
% @original_name terrain_suitability (Powder rating)
% @unit /5
% @values v3=3.0 unk_terrain_suitability_powder=Unknown
% @importance 1.0

0.94::acc(s5, terrain_suitability_powder).

0.95::true_val(terrain_suitability_powder, v3); 0.05::true_val(terrain_suitability_powder, unk_terrain_suitability_powder).
measured(s5, terrain_suitability_powder, v3).
all_consistent(terrain_suitability_powder) :- consistent(s5, terrain_suitability_powder).
evidence(all_consistent(terrain_suitability_powder)).
query(true_val(terrain_suitability_powder, v3)).
query(true_val(terrain_suitability_powder, unk_terrain_suitability_powder)).

% @attr riding_style
% @type categorical
% @canonical false
% @original_name riding_style
% @values comp_freestyle_street_park=Competition_freestyle_street_switch_park unk_riding_style=Unknown
% @importance 0.85

0.82::acc(s_merchant, riding_style).

0.90::true_val(riding_style, comp_freestyle_street_park); 0.10::true_val(riding_style, unk_riding_style).
measured(s_merchant, riding_style, comp_freestyle_street_park).
all_consistent(riding_style) :- consistent(s_merchant, riding_style).
evidence(all_consistent(riding_style)).
query(true_val(riding_style, comp_freestyle_street_park)).
query(true_val(riding_style, unk_riding_style)).

% @attr rider_level
% @type categorical
% @canonical false
% @original_name rider_level
% @values advanced=Advanced unk_rider_level=Unknown
% @importance 0.93

0.82::acc(s_merchant, rider_level).
0.94::acc(s5, rider_level).

0.95::true_val(rider_level, advanced); 0.05::true_val(rider_level, unk_rider_level).
measured(s_merchant, rider_level, advanced).
measured(s5, rider_level, advanced).
all_consistent(rider_level) :- consistent(s5, rider_level), (indep(s_merchant), consistent(s_merchant, rider_level) ; \+indep(s_merchant)).
evidence(all_consistent(rider_level)).
query(true_val(rider_level, advanced)).
query(true_val(rider_level, unk_rider_level)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values adv_expert_aggressive=Advanced_to_expert_aggressive_freestyle unk_skill_level_recommendation=Unknown
% @importance 0.95

0.82::acc(s9, skill_level_recommendation).
0.94::acc(s5, skill_level_recommendation).

0.95::true_val(skill_level_recommendation, adv_expert_aggressive); 0.05::true_val(skill_level_recommendation, unk_skill_level_recommendation).
measured(s9, skill_level_recommendation, adv_expert_aggressive).
measured(s5, skill_level_recommendation, adv_expert_aggressive).
all_consistent(skill_level_recommendation) :- consistent(s9, skill_level_recommendation), consistent(s5, skill_level_recommendation).
evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, adv_expert_aggressive)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

% @attr price_aud_merchant
% @type numeric
% @canonical false
% @original_name price_aud_merchant
% @unit AUD
% @values v899_99=899.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.95::acc(s_merchant, price_aud_merchant).

0.95::true_val(price_aud_merchant, v899_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).
measured(s_merchant, price_aud_merchant, v899_99).
all_consistent(price_aud_merchant) :- consistent(s_merchant, price_aud_merchant).
evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v899_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v549_95=549.95 unk_price_usd_msrp=Unknown
% @importance 1.0

0.94::acc(s5, price_usd_msrp).

0.95::true_val(price_usd_msrp, v549_95); 0.05::true_val(price_usd_msrp, unk_price_usd_msrp).
measured(s5, price_usd_msrp, v549_95).
all_consistent(price_usd_msrp) :- consistent(s5, price_usd_msrp).
evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v549_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_usd_msrp_2025
% @type numeric
% @canonical false
% @original_name price_usd_msrp (2025 model)
% @unit USD
% @values v579_95=579.95 unk_price_usd_msrp_2025=Unknown
% @importance 0.80

0.88::acc(s3, price_usd_msrp_2025).

0.88::true_val(price_usd_msrp_2025, v579_95); 0.12::true_val(price_usd_msrp_2025, unk_price_usd_msrp_2025).
measured(s3, price_usd_msrp_2025, v579_95).
all_consistent(price_usd_msrp_2025) :- consistent(s3, price_usd_msrp_2025).
evidence(all_consistent(price_usd_msrp_2025)).
query(true_val(price_usd_msrp_2025, v579_95)).
query(true_val(price_usd_msrp_2025, unk_price_usd_msrp_2025)).

% @attr price_usd_nzshred
% @type numeric
% @canonical false
% @original_name Price USD (NZ Shred, 2027 model)
% @unit USD
% @values v587_00=587.0 unk_price_usd_nzshred=Unknown
% @importance 0.75

0.65::acc(s10, price_usd_nzshred).

0.72::true_val(price_usd_nzshred, v587_00); 0.28::true_val(price_usd_nzshred, unk_price_usd_nzshred).
measured(s10, price_usd_nzshred, v587_00).
all_consistent(price_usd_nzshred) :- consistent(s10, price_usd_nzshred).
evidence(all_consistent(price_usd_nzshred)).
query(true_val(price_usd_nzshred, v587_00)).
query(true_val(price_usd_nzshred, unk_price_usd_nzshred)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values preorder_2027=Preorder_2027_model unk_availability_status=Unknown
% @importance 0.80

0.90::acc(s_merchant, availability_status).
0.65::acc(s10, availability_status).
0.72::acc(s4, availability_status).
0.65::acc(s14, availability_status).

0.95::true_val(availability_status, preorder_2027); 0.05::true_val(availability_status, unk_availability_status).
measured(s_merchant, availability_status, preorder_2027).
measured(s10, availability_status, preorder_2027).
measured(s4, availability_status, preorder_2027).
measured(s14, availability_status, preorder_2027).
all_consistent(availability_status) :- consistent(s_merchant, availability_status), (indep(s10), consistent(s10, availability_status) ; \+indep(s10)), (indep(s4), consistent(s4, availability_status) ; \+indep(s4)), (indep(s14), consistent(s14, availability_status) ; \+indep(s14)).
evidence(all_consistent(availability_status)).
query(true_val(availability_status, preorder_2027)).
query(true_val(availability_status, unk_availability_status)).

% @attr estimated_availability_date
% @type categorical
% @canonical true
% @original_name estimated_availability_date
% @values may_2026=May_2026 unk_estimated_availability_date=Unknown
% @importance 0.78

0.90::acc(s_merchant, estimated_availability_date).
0.88::acc(s5, estimated_availability_date).

0.95::true_val(estimated_availability_date, may_2026); 0.05::true_val(estimated_availability_date, unk_estimated_availability_date).
measured(s_merchant, estimated_availability_date, may_2026).
measured(s5, estimated_availability_date, may_2026).
all_consistent(estimated_availability_date) :- consistent(s_merchant, estimated_availability_date), consistent(s5, estimated_availability_date).
evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, may_2026)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

% @attr availability_status_nzshred_sizes
% @type categorical
% @canonical false
% @original_name availability_status (NZ Shred sizes)
% @values avail_154_158=Available_in_154_and_158 unk_availability_status_nzshred_sizes=Unknown
% @importance 0.75

0.60::acc(s10, availability_status_nzshred_sizes).

0.68::true_val(availability_status_nzshred_sizes, avail_154_158); 0.32::true_val(availability_status_nzshred_sizes, unk_availability_status_nzshred_sizes).
measured(s10, availability_status_nzshred_sizes, avail_154_158).
all_consistent(availability_status_nzshred_sizes) :- consistent(s10, availability_status_nzshred_sizes).
evidence(all_consistent(availability_status_nzshred_sizes)).
query(true_val(availability_status_nzshred_sizes, avail_154_158)).
query(true_val(availability_status_nzshred_sizes, unk_availability_status_nzshred_sizes)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status (evo)
% @values in_stock=In_stock unk_availability_status_evo=Unknown
% @importance 0.85

0.82::acc(s8, availability_status_evo).

0.82::true_val(availability_status_evo, in_stock); 0.18::true_val(availability_status_evo, unk_availability_status_evo).
measured(s8, availability_status_evo, in_stock).
all_consistent(availability_status_evo) :- consistent(s8, availability_status_evo).
evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, in_stock)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

% @attr availability_status_nidecker
% @type categorical
% @canonical false
% @original_name availability_status (Nidecker direct)
% @values partial_stock=154_158_in_stock_others_sold_out unk_availability_status_nidecker=Unknown
% @importance 1.0

0.90::acc(s5, availability_status_nidecker).

0.90::true_val(availability_status_nidecker, partial_stock); 0.10::true_val(availability_status_nidecker, unk_availability_status_nidecker).
measured(s5, availability_status_nidecker, partial_stock).
all_consistent(availability_status_nidecker) :- consistent(s5, availability_status_nidecker).
evidence(all_consistent(availability_status_nidecker)).
query(true_val(availability_status_nidecker, partial_stock)).
query(true_val(availability_status_nidecker, unk_availability_status_nidecker)).

% @attr availability_status_zezula
% @type categorical
% @canonical false
% @original_name availability_status (Snowboard Zezula)
% @values available=Available unk_availability_status_zezula=Unknown
% @importance 0.70

0.78::acc(s7, availability_status_zezula).

0.80::true_val(availability_status_zezula, available); 0.20::true_val(availability_status_zezula, unk_availability_status_zezula).
measured(s7, availability_status_zezula, available).
all_consistent(availability_status_zezula) :- consistent(s7, availability_status_zezula).
evidence(all_consistent(availability_status_zezula)).
query(true_val(availability_status_zezula, available)).
query(true_val(availability_status_zezula, unk_availability_status_zezula)).

% @attr availability_status_gearwest
% @type categorical
% @canonical false
% @original_name availability_status (Gear West)
% @values listed=Listed unk_availability_status_gearwest=Unknown
% @importance 0.50

0.60::acc(s13, availability_status_gearwest).

0.65::true_val(availability_status_gearwest, listed); 0.35::true_val(availability_status_gearwest, unk_availability_status_gearwest).
measured(s13, availability_status_gearwest, listed).
all_consistent(availability_status_gearwest) :- consistent(s13, availability_status_gearwest).
evidence(all_consistent(availability_status_gearwest)).
query(true_val(availability_status_gearwest, listed)).
query(true_val(availability_status_gearwest, unk_availability_status_gearwest)).

% @attr price_vs_average
% @type categorical
% @canonical false
% @original_name Price vs average
% @values above_avg_44_23=44_23_more_than_avg_535_72 unk_price_vs_average=Unknown
% @importance 0.85

0.70::acc(s11, price_vs_average).

0.72::true_val(price_vs_average, above_avg_44_23); 0.28::true_val(price_vs_average, unk_price_vs_average).
measured(s11, price_vs_average, above_avg_44_23).
all_consistent(price_vs_average) :- consistent(s11, price_vs_average).
evidence(all_consistent(price_vs_average)).
query(true_val(price_vs_average, above_avg_44_23)).
query(true_val(price_vs_average, unk_price_vs_average)).

% @attr availability_status_cherripow
% @type categorical
% @canonical false
% @original_name availability_status (Cherri Pow sold out)
% @values all_sold_out=All_sizes_sold_out_or_unavailable unk_availability_status_cherripow=Unknown
% @importance 0.75

0.60::acc(s10, availability_status_cherripow).

0.68::true_val(availability_status_cherripow, all_sold_out); 0.32::true_val(availability_status_cherripow, unk_availability_status_cherripow).
measured(s10, availability_status_cherripow, all_sold_out).
all_consistent(availability_status_cherripow) :- consistent(s10, availability_status_cherripow).
evidence(all_consistent(availability_status_cherripow)).
query(true_val(availability_status_cherripow, all_sold_out)).
query(true_val(availability_status_cherripow, unk_availability_status_cherripow)).

% @attr retailer_ballistyx
% @type categorical
% @canonical false
% @original_name Retailer: Ballistyx (Melbourne, AUS)
% @values trusted_since_1991=Trusted_Melbourne_store_since_1991 unk_retailer_ballistyx=Unknown
% @importance 0.85

0.72::acc(s4, retailer_ballistyx).

0.82::true_val(retailer_ballistyx, trusted_since_1991); 0.18::true_val(retailer_ballistyx, unk_retailer_ballistyx).
measured(s4, retailer_ballistyx, trusted_since_1991).
all_consistent(retailer_ballistyx) :- consistent(s4, retailer_ballistyx).
evidence(all_consistent(retailer_ballistyx)).
query(true_val(retailer_ballistyx, trusted_since_1991)).
query(true_val(retailer_ballistyx, unk_retailer_ballistyx)).

% @attr retailer_elevation107
% @type categorical
% @canonical false
% @original_name Retailer: Elevation107 (Sydney, AUS)
% @values sydney_layby=Elevation107_Sydney_layby_available unk_retailer_elevation107=Unknown
% @importance 0.70

0.65::acc(s26, retailer_elevation107).

0.72::true_val(retailer_elevation107, sydney_layby); 0.28::true_val(retailer_elevation107, unk_retailer_elevation107).
measured(s26, retailer_elevation107, sydney_layby).
all_consistent(retailer_elevation107) :- consistent(s26, retailer_elevation107).
evidence(all_consistent(retailer_elevation107)).
query(true_val(retailer_elevation107, sydney_layby)).
query(true_val(retailer_elevation107, unk_retailer_elevation107)).

% @attr retailer_cherripow
% @type categorical
% @canonical false
% @original_name Retailer: Cherri Pow (AUS)
% @values trusted_since_1987=Trusted_since_1987 unk_retailer_cherripow=Unknown
% @importance 0.75

0.60::acc(s10, retailer_cherripow).

0.68::true_val(retailer_cherripow, trusted_since_1987); 0.32::true_val(retailer_cherripow, unk_retailer_cherripow).
measured(s10, retailer_cherripow, trusted_since_1987).
all_consistent(retailer_cherripow) :- consistent(s10, retailer_cherripow).
evidence(all_consistent(retailer_cherripow)).
query(true_val(retailer_cherripow, trusted_since_1987)).
query(true_val(retailer_cherripow, unk_retailer_cherripow)).

% @attr retailer_snowcentral
% @type categorical
% @canonical false
% @original_name Retailer: Snow Central (Brisbane, AUS)
% @values small_local=Small_locally_owned_Brisbane unk_retailer_snowcentral=Unknown
% @importance 0.80

0.65::acc(s14, retailer_snowcentral).

0.68::true_val(retailer_snowcentral, small_local); 0.32::true_val(retailer_snowcentral, unk_retailer_snowcentral).
measured(s14, retailer_snowcentral, small_local).
all_consistent(retailer_snowcentral) :- consistent(s14, retailer_snowcentral).
evidence(all_consistent(retailer_snowcentral)).
query(true_val(retailer_snowcentral, small_local)).
query(true_val(retailer_snowcentral, unk_retailer_snowcentral)).

% @attr retailer_nzshred
% @type categorical
% @canonical false
% @original_name Retailer: NZ Shred (New Zealand)
% @values nz_retailer=NZ_Shred_New_Zealand unk_retailer_nzshred=Unknown
% @importance 0.75

0.60::acc(s10, retailer_nzshred).

0.68::true_val(retailer_nzshred, nz_retailer); 0.32::true_val(retailer_nzshred, unk_retailer_nzshred).
measured(s10, retailer_nzshred, nz_retailer).
all_consistent(retailer_nzshred) :- consistent(s10, retailer_nzshred).
evidence(all_consistent(retailer_nzshred)).
query(true_val(retailer_nzshred, nz_retailer)).
query(true_val(retailer_nzshred, unk_retailer_nzshred)).

% @attr retailer_evo
% @type categorical
% @canonical false
% @original_name Retailer: evo.com (USA)
% @values major_us_free_ship=Major_US_retailer_free_shipping_lowest_price unk_retailer_evo=Unknown
% @importance 0.85

0.82::acc(s8, retailer_evo).

0.82::true_val(retailer_evo, major_us_free_ship); 0.18::true_val(retailer_evo, unk_retailer_evo).
measured(s8, retailer_evo, major_us_free_ship).
all_consistent(retailer_evo) :- consistent(s8, retailer_evo).
evidence(all_consistent(retailer_evo)).
query(true_val(retailer_evo, major_us_free_ship)).
query(true_val(retailer_evo, unk_retailer_evo)).

% @attr retailer_zezula
% @type categorical
% @canonical false
% @original_name Retailer: Snowboard Zezula (Europe)
% @values major_eu_retailer=Major_European_snowboard_retailer unk_retailer_zezula=Unknown
% @importance 0.70

0.78::acc(s7, retailer_zezula).

0.80::true_val(retailer_zezula, major_eu_retailer); 0.20::true_val(retailer_zezula, unk_retailer_zezula).
measured(s7, retailer_zezula, major_eu_retailer).
all_consistent(retailer_zezula) :- consistent(s7, retailer_zezula).
evidence(all_consistent(retailer_zezula)).
query(true_val(retailer_zezula, major_eu_retailer)).
query(true_val(retailer_zezula, unk_retailer_zezula)).

% @attr retailer_gearwest
% @type categorical
% @canonical false
% @original_name Retailer: Gear West (USA, Minnesota)
% @values us_mn_retailer=Gear_West_USA_Minnesota unk_retailer_gearwest=Unknown
% @importance 0.50

0.60::acc(s13, retailer_gearwest).

0.65::true_val(retailer_gearwest, us_mn_retailer); 0.35::true_val(retailer_gearwest, unk_retailer_gearwest).
measured(s13, retailer_gearwest, us_mn_retailer).
all_consistent(retailer_gearwest) :- consistent(s13, retailer_gearwest).
evidence(all_consistent(retailer_gearwest)).
query(true_val(retailer_gearwest, us_mn_retailer)).
query(true_val(retailer_gearwest, unk_retailer_gearwest)).

% @attr retailer_blauer
% @type categorical
% @canonical false
% @original_name Retailer: Blauer Boardshop (USA)
% @values us_boardshop=Blauer_Boardshop_USA unk_retailer_blauer=Unknown
% @importance 0.70

0.65::acc(s15, retailer_blauer).

0.68::true_val(retailer_blauer, us_boardshop); 0.32::true_val(retailer_blauer, unk_retailer_blauer).
measured(s15, retailer_blauer, us_boardshop).
all_consistent(retailer_blauer) :- consistent(s15, retailer_blauer).
evidence(all_consistent(retailer_blauer)).
query(true_val(retailer_blauer, us_boardshop)).
query(true_val(retailer_blauer, unk_retailer_blauer)).

% @attr return_policy_terms
% @type categorical
% @canonical true
% @original_name return_policy_terms
% @values thirty_day_free_ship=30day_return_free_shipping_over_100 unk_return_policy_terms=Unknown
% @importance 1.0

0.90::acc(s5, return_policy_terms).

0.90::true_val(return_policy_terms, thirty_day_free_ship); 0.10::true_val(return_policy_terms, unk_return_policy_terms).
measured(s5, return_policy_terms, thirty_day_free_ship).
all_consistent(return_policy_terms) :- consistent(s5, return_policy_terms).
evidence(all_consistent(return_policy_terms)).
query(true_val(return_policy_terms, thirty_day_free_ship)).
query(true_val(return_policy_terms, unk_return_policy_terms)).

% @attr pop
% @type categorical
% @canonical false
% @original_name pop
% @values snappy_explosive=Snappy_explosive_pop_springboard_level unk_pop=Unknown
% @importance 0.85

0.72::acc(s11, pop).

0.78::true_val(pop, snappy_explosive); 0.22::true_val(pop, unk_pop).
measured(s11, pop, snappy_explosive).
all_consistent(pop) :- consistent(s11, pop).
evidence(all_consistent(pop)).
query(true_val(pop, snappy_explosive)).
query(true_val(pop, unk_pop)).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name reviewer_opinion_snowboardingprofiles
% @values pop_good_energy=Not_easiest_pop_but_good_energy_with_wind_up unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.90

0.82::acc(s9, reviewer_opinion_snowboardingprofiles).

0.82::true_val(reviewer_opinion_snowboardingprofiles, pop_good_energy); 0.18::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).
measured(s9, reviewer_opinion_snowboardingprofiles, pop_good_energy).
all_consistent(reviewer_opinion_snowboardingprofiles) :- consistent(s9, reviewer_opinion_snowboardingprofiles).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, pop_good_energy)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

% @attr reviewer_opinion_sp_stability
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (stability)
% @values very_stable=Stable_unaffected_no_matter_what unk_reviewer_opinion_sp_stability=Unknown
% @importance 0.90

0.82::acc(s9, reviewer_opinion_sp_stability).

0.82::true_val(reviewer_opinion_sp_stability, very_stable); 0.18::true_val(reviewer_opinion_sp_stability, unk_reviewer_opinion_sp_stability).
measured(s9, reviewer_opinion_sp_stability, very_stable).
all_consistent(reviewer_opinion_sp_stability) :- consistent(s9, reviewer_opinion_sp_stability).
evidence(all_consistent(reviewer_opinion_sp_stability)).
query(true_val(reviewer_opinion_sp_stability, very_stable)).
query(true_val(reviewer_opinion_sp_stability, unk_reviewer_opinion_sp_stability)).

% @attr reviewer_opinion_sp_big_jumps
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (big jumps)
% @values great_for_big_jumps=Really_stable_run_in_bigger_jump_better unk_reviewer_opinion_sp_big_jumps=Unknown
% @importance 0.90

0.82::acc(s9, reviewer_opinion_sp_big_jumps).

0.82::true_val(reviewer_opinion_sp_big_jumps, great_for_big_jumps); 0.18::true_val(reviewer_opinion_sp_big_jumps, unk_reviewer_opinion_sp_big_jumps).
measured(s9, reviewer_opinion_sp_big_jumps, great_for_big_jumps).
all_consistent(reviewer_opinion_sp_big_jumps) :- consistent(s9, reviewer_opinion_sp_big_jumps).
evidence(all_consistent(reviewer_opinion_sp_big_jumps)).
query(true_val(reviewer_opinion_sp_big_jumps, great_for_big_jumps)).
query(true_val(reviewer_opinion_sp_big_jumps, unk_reviewer_opinion_sp_big_jumps)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values easy_carve=Very_easy_to_carve_effortless_edge_to_edge unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.85

0.72::acc(s11, reviewer_opinion_the_good_ride).

0.75::true_val(reviewer_opinion_the_good_ride, easy_carve); 0.25::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).
measured(s11, reviewer_opinion_the_good_ride, easy_carve).
all_consistent(reviewer_opinion_the_good_ride) :- consistent(s11, reviewer_opinion_the_good_ride).
evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, easy_carve)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr edge_hold
% @type categorical
% @canonical false
% @original_name edge_hold
% @values strong=Strong_edge_hold_Camber_Pro_extended_edge unk_edge_hold=Unknown
% @importance 1.0

0.94::acc(s5, edge_hold).

0.95::true_val(edge_hold, strong); 0.05::true_val(edge_hold, unk_edge_hold).
measured(s5, edge_hold, strong).
all_consistent(edge_hold) :- consistent(s5, edge_hold).
evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, strong)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr switch_riding
% @type categorical
% @canonical false
% @original_name switch_riding
% @values excellent=True_twin_rides_just_as_well_switch unk_switch_riding=Unknown
% @importance 1.0

0.90::acc(s5, switch_riding).

0.90::true_val(switch_riding, excellent); 0.10::true_val(switch_riding, unk_switch_riding).
measured(s5, switch_riding, excellent).
all_consistent(switch_riding) :- consistent(s5, switch_riding).
evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, excellent)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr reviewer_opinion_sp_jibbing
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (jibbing)
% @values not_great=Not_great_for_jibbing_more_jump_board unk_reviewer_opinion_sp_jibbing=Unknown
% @importance 0.90

0.82::acc(s9, reviewer_opinion_sp_jibbing).

0.82::true_val(reviewer_opinion_sp_jibbing, not_great); 0.18::true_val(reviewer_opinion_sp_jibbing, unk_reviewer_opinion_sp_jibbing).
measured(s9, reviewer_opinion_sp_jibbing, not_great).
all_consistent(reviewer_opinion_sp_jibbing) :- consistent(s9, reviewer_opinion_sp_jibbing).
evidence(all_consistent(reviewer_opinion_sp_jibbing)).
query(true_val(reviewer_opinion_sp_jibbing, not_great)).
query(true_val(reviewer_opinion_sp_jibbing, unk_reviewer_opinion_sp_jibbing)).

% @attr reviewer_opinion_sp_pressing
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (pressing)
% @values stiff_to_press=A_little_stiff_to_press_and_hold unk_reviewer_opinion_sp_pressing=Unknown
% @importance 0.90

0.82::acc(s9, reviewer_opinion_sp_pressing).

0.82::true_val(reviewer_opinion_sp_pressing, stiff_to_press); 0.18::true_val(reviewer_opinion_sp_pressing, unk_reviewer_opinion_sp_pressing).
measured(s9, reviewer_opinion_sp_pressing, stiff_to_press).
all_consistent(reviewer_opinion_sp_pressing) :- consistent(s9, reviewer_opinion_sp_pressing).
evidence(all_consistent(reviewer_opinion_sp_pressing)).
query(true_val(reviewer_opinion_sp_pressing, stiff_to_press)).
query(true_val(reviewer_opinion_sp_pressing, unk_reviewer_opinion_sp_pressing)).

% @attr reviewer_opinion_sp_slow_speed
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (slow speed)
% @values not_great_slow=Not_great_slow_speed_better_with_speed unk_reviewer_opinion_sp_slow_speed=Unknown
% @importance 0.90

0.82::acc(s9, reviewer_opinion_sp_slow_speed).

0.82::true_val(reviewer_opinion_sp_slow_speed, not_great_slow); 0.18::true_val(reviewer_opinion_sp_slow_speed, unk_reviewer_opinion_sp_slow_speed).
measured(s9, reviewer_opinion_sp_slow_speed, not_great_slow).
all_consistent(reviewer_opinion_sp_slow_speed) :- consistent(s9, reviewer_opinion_sp_slow_speed).
evidence(all_consistent(reviewer_opinion_sp_slow_speed)).
query(true_val(reviewer_opinion_sp_slow_speed, not_great_slow)).
query(true_val(reviewer_opinion_sp_slow_speed, unk_reviewer_opinion_sp_slow_speed)).

% @attr reviewer_opinion_sp_powder
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (powder)
% @values not_powder=Definitely_not_powder_oriented_nose_diver unk_reviewer_opinion_sp_powder=Unknown
% @importance 0.90

0.82::acc(s9, reviewer_opinion_sp_powder).

0.82::true_val(reviewer_opinion_sp_powder, not_powder); 0.18::true_val(reviewer_opinion_sp_powder, unk_reviewer_opinion_sp_powder).
measured(s9, reviewer_opinion_sp_powder, not_powder).
all_consistent(reviewer_opinion_sp_powder) :- consistent(s9, reviewer_opinion_sp_powder).
evidence(all_consistent(reviewer_opinion_sp_powder)).
query(true_val(reviewer_opinion_sp_powder, not_powder)).
query(true_val(reviewer_opinion_sp_powder, unk_reviewer_opinion_sp_powder)).

% @attr reviewer_opinion_sp_crud
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (crud/chop)
% @values good_crud=Weight_stiffness_plow_through_junk_stable unk_reviewer_opinion_sp_crud=Unknown
% @importance 0.90

0.82::acc(s9, reviewer_opinion_sp_crud).

0.82::true_val(reviewer_opinion_sp_crud, good_crud); 0.18::true_val(reviewer_opinion_sp_crud, unk_reviewer_opinion_sp_crud).
measured(s9, reviewer_opinion_sp_crud, good_crud).
all_consistent(reviewer_opinion_sp_crud) :- consistent(s9, reviewer_opinion_sp_crud).
evidence(all_consistent(reviewer_opinion_sp_crud)).
query(true_val(reviewer_opinion_sp_crud, good_crud)).
query(true_val(reviewer_opinion_sp_crud, unk_reviewer_opinion_sp_crud)).

% @attr reviewer_opinion_sp_enjoyment
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (overall enjoyment)
% @values decent_but_heavy=Decent_but_too_heavy_stiff_damp_for_super_enjoyable unk_reviewer_opinion_sp_enjoyment=Unknown
% @importance 0.90

0.82::acc(s9, reviewer_opinion_sp_enjoyment).

0.82::true_val(reviewer_opinion_sp_enjoyment, decent_but_heavy); 0.18::true_val(reviewer_opinion_sp_enjoyment, unk_reviewer_opinion_sp_enjoyment).
measured(s9, reviewer_opinion_sp_enjoyment, decent_but_heavy).
all_consistent(reviewer_opinion_sp_enjoyment) :- consistent(s9, reviewer_opinion_sp_enjoyment).
evidence(all_consistent(reviewer_opinion_sp_enjoyment)).
query(true_val(reviewer_opinion_sp_enjoyment, decent_but_heavy)).
query(true_val(reviewer_opinion_sp_enjoyment, unk_reviewer_opinion_sp_enjoyment)).

% @attr reviewer_opinion_sp_confidence
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (confidence on big jumps)
% @values confidence_stability=Especially_good_bigger_jumps_confidence_stability unk_reviewer_opinion_sp_confidence=Unknown
% @importance 0.90

0.82::acc(s9, reviewer_opinion_sp_confidence).

0.82::true_val(reviewer_opinion_sp_confidence, confidence_stability); 0.18::true_val(reviewer_opinion_sp_confidence, unk_reviewer_opinion_sp_confidence).
measured(s9, reviewer_opinion_sp_confidence, confidence_stability).
all_consistent(reviewer_opinion_sp_confidence) :- consistent(s9, reviewer_opinion_sp_confidence).
evidence(all_consistent(reviewer_opinion_sp_confidence)).
query(true_val(reviewer_opinion_sp_confidence, confidence_stability)).
query(true_val(reviewer_opinion_sp_confidence, unk_reviewer_opinion_sp_confidence)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values not_super_fast=Glide_not_super_fast_needs_regular_waxing unk_base_glide_performance=Unknown
% @importance 0.90

0.80::acc(s9, base_glide_performance).

0.80::true_val(base_glide_performance, not_super_fast); 0.20::true_val(base_glide_performance, unk_base_glide_performance).
measured(s9, base_glide_performance, not_super_fast).
all_consistent(base_glide_performance) :- consistent(s9, base_glide_performance).
evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, not_super_fast)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr reviewer_opinion_sp_weight
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (weight/rotations)
% @values not_light=Not_light_takes_effort_for_rotations unk_reviewer_opinion_sp_weight=Unknown
% @importance 0.90

0.82::acc(s9, reviewer_opinion_sp_weight).

0.82::true_val(reviewer_opinion_sp_weight, not_light); 0.18::true_val(reviewer_opinion_sp_weight, unk_reviewer_opinion_sp_weight).
measured(s9, reviewer_opinion_sp_weight, not_light).
all_consistent(reviewer_opinion_sp_weight) :- consistent(s9, reviewer_opinion_sp_weight).
evidence(all_consistent(reviewer_opinion_sp_weight)).
query(true_val(reviewer_opinion_sp_weight, not_light)).
query(true_val(reviewer_opinion_sp_weight, unk_reviewer_opinion_sp_weight)).

% @attr reviewer_opinion_sp_catch
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (catch/landings)
% @values little_catchy=A_little_catchy_on_setup_landings_not_horrible unk_reviewer_opinion_sp_catch=Unknown
% @importance 0.90

0.82::acc(s9, reviewer_opinion_sp_catch).

0.82::true_val(reviewer_opinion_sp_catch, little_catchy); 0.18::true_val(reviewer_opinion_sp_catch, unk_reviewer_opinion_sp_catch).
measured(s9, reviewer_opinion_sp_catch, little_catchy).
all_consistent(reviewer_opinion_sp_catch) :- consistent(s9, reviewer_opinion_sp_catch).
evidence(all_consistent(reviewer_opinion_sp_catch)).
query(true_val(reviewer_opinion_sp_catch, little_catchy)).
query(true_val(reviewer_opinion_sp_catch, unk_reviewer_opinion_sp_catch)).

% @attr durability
% @type categorical
% @canonical false
% @original_name Durability (Board of the World)
% @values very_durable=Can_take_a_beating_keeps_bouncing_back unk_durability=Unknown
% @importance 0.85

0.72::acc(s11, durability).

0.75::true_val(durability, very_durable); 0.25::true_val(durability, unk_durability).
measured(s11, durability, very_durable).
all_consistent(durability) :- consistent(s11, durability).
evidence(all_consistent(durability)).
query(true_val(durability, very_durable)).
query(true_val(durability, unk_durability)).

% @attr overall_rating_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name overall_rating_snowboardingprofiles
% @values rank_29_38_am_26_36_park=29th_of_38_all_mountain_26th_of_36_park unk_overall_rating_snowboardingprofiles=Unknown
% @importance 0.85

0.72::acc(s11, overall_rating_snowboardingprofiles).

0.75::true_val(overall_rating_snowboardingprofiles, rank_29_38_am_26_36_park); 0.25::true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles).
measured(s11, overall_rating_snowboardingprofiles, rank_29_38_am_26_36_park).
all_consistent(overall_rating_snowboardingprofiles) :- consistent(s11, overall_rating_snowboardingprofiles).
evidence(all_consistent(overall_rating_snowboardingprofiles)).
query(true_val(overall_rating_snowboardingprofiles, rank_29_38_am_26_36_park)).
query(true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values sensor_softer_jib=Sensor_softer_better_jibbing_Pro_stiffer_jumping unk_comparable_board_same_brand=Unknown
% @importance 0.85

0.72::acc(s11, comparable_board_same_brand).

0.75::true_val(comparable_board_same_brand, sensor_softer_jib); 0.25::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).
measured(s11, comparable_board_same_brand, sensor_softer_jib).
all_consistent(comparable_board_same_brand) :- consistent(s11, comparable_board_same_brand).
evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, sensor_softer_jib)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_team
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Team)
% @values team_wider_n7000=Team_wider_N7000_hybrid_base_less_aggressive unk_comparable_board_same_brand_team=Unknown
% @importance 0.60

0.68::acc(s16, comparable_board_same_brand_team).

0.70::true_val(comparable_board_same_brand_team, team_wider_n7000); 0.30::true_val(comparable_board_same_brand_team, unk_comparable_board_same_brand_team).
measured(s16, comparable_board_same_brand_team, team_wider_n7000).
all_consistent(comparable_board_same_brand_team) :- consistent(s16, comparable_board_same_brand_team).
evidence(all_consistent(comparable_board_same_brand_team)).
query(true_val(comparable_board_same_brand_team, team_wider_n7000)).
query(true_val(comparable_board_same_brand_team, unk_comparable_board_same_brand_team)).

% @attr comparable_board_same_brand_mons
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Mons)
% @values mons_stiffer_comp=Mons_pro_level_above_Sensor_Pro_competition unk_comparable_board_same_brand_mons=Unknown
% @importance 0.85

0.72::acc(s4, comparable_board_same_brand_mons).

0.82::true_val(comparable_board_same_brand_mons, mons_stiffer_comp); 0.18::true_val(comparable_board_same_brand_mons, unk_comparable_board_same_brand_mons).
measured(s4, comparable_board_same_brand_mons, mons_stiffer_comp).
all_consistent(comparable_board_same_brand_mons) :- consistent(s4, comparable_board_same_brand_mons).
evidence(all_consistent(comparable_board_same_brand_mons)).
query(true_val(comparable_board_same_brand_mons, mons_stiffer_comp)).
query(true_val(comparable_board_same_brand_mons, unk_comparable_board_same_brand_mons)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values doa_more_playful=DOA_more_playful_buttery_hybrid_profile_Nidecker_better_edge_hold unk_comparable_board_cross_brand=Unknown
% @importance 0.70

0.55::acc(s17, comparable_board_cross_brand).

0.60::true_val(comparable_board_cross_brand, doa_more_playful); 0.40::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).
measured(s17, comparable_board_cross_brand, doa_more_playful).
all_consistent(comparable_board_cross_brand) :- consistent(s17, comparable_board_cross_brand).
evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, doa_more_playful)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_mt
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Mountain Twin)
% @values mt_directional_broader=Mountain_Twin_directional_twin_serrated_edges_broader_AM unk_comparable_board_cross_brand_mt=Unknown
% @importance 0.70

0.55::acc(s17, comparable_board_cross_brand_mt).

0.60::true_val(comparable_board_cross_brand_mt, mt_directional_broader); 0.40::true_val(comparable_board_cross_brand_mt, unk_comparable_board_cross_brand_mt).
measured(s17, comparable_board_cross_brand_mt, mt_directional_broader).
all_consistent(comparable_board_cross_brand_mt) :- consistent(s17, comparable_board_cross_brand_mt).
evidence(all_consistent(comparable_board_cross_brand_mt)).
query(true_val(comparable_board_cross_brand_mt, mt_directional_broader)).
query(true_val(comparable_board_cross_brand_mt, unk_comparable_board_cross_brand_mt)).

% @attr comparable_board_cross_brand_capita
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Capita general)
% @values capita_playful_nidecker_stable=Capita_more_playful_park_Nidecker_stable_speed_edge_hold unk_comparable_board_cross_brand_capita=Unknown
% @importance 0.70

0.55::acc(s17, comparable_board_cross_brand_capita).

0.60::true_val(comparable_board_cross_brand_capita, capita_playful_nidecker_stable); 0.40::true_val(comparable_board_cross_brand_capita, unk_comparable_board_cross_brand_capita).
measured(s17, comparable_board_cross_brand_capita, capita_playful_nidecker_stable).
all_consistent(comparable_board_cross_brand_capita) :- consistent(s17, comparable_board_cross_brand_capita).
evidence(all_consistent(comparable_board_cross_brand_capita)).
query(true_val(comparable_board_cross_brand_capita, capita_playful_nidecker_stable)).
query(true_val(comparable_board_cross_brand_capita, unk_comparable_board_cross_brand_capita)).

% @attr comparable_board_cross_brand_list
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (full list)
% @values doa_mt_standard_mercury_dpr=Capita_DOA_Jones_MT_YES_Standard_Capita_Mercury_LibTech_dPr unk_comparable_board_cross_brand_list=Unknown
% @importance 0.70

0.55::acc(s17, comparable_board_cross_brand_list).
0.82::acc(s18, comparable_board_cross_brand_list).

0.75::true_val(comparable_board_cross_brand_list, doa_mt_standard_mercury_dpr); 0.25::true_val(comparable_board_cross_brand_list, unk_comparable_board_cross_brand_list).
measured(s17, comparable_board_cross_brand_list, doa_mt_standard_mercury_dpr).
measured(s18, comparable_board_cross_brand_list, doa_mt_standard_mercury_dpr).
all_consistent(comparable_board_cross_brand_list) :- consistent(s17, comparable_board_cross_brand_list), consistent(s18, comparable_board_cross_brand_list).
evidence(all_consistent(comparable_board_cross_brand_list)).
query(true_val(comparable_board_cross_brand_list, doa_mt_standard_mercury_dpr)).
query(true_val(comparable_board_cross_brand_list, unk_comparable_board_cross_brand_list)).

% @attr youth_variant
% @type categorical
% @canonical false
% @original_name Youth variant exists
% @values yes_youth=Sensor_Pro_Youth_2027_124_136_142_146cm unk_youth_variant=Unknown
% @importance 0.85

0.82::acc(s8, youth_variant).

0.82::true_val(youth_variant, yes_youth); 0.18::true_val(youth_variant, unk_youth_variant).
measured(s8, youth_variant, yes_youth).
all_consistent(youth_variant) :- consistent(s8, youth_variant).
evidence(all_consistent(youth_variant)).
query(true_val(youth_variant, yes_youth)).
query(true_val(youth_variant, unk_youth_variant)).

% @attr craig_mcmorris_signature
% @type categorical
% @canonical false
% @original_name Craig McMorris signature variant
% @values limited_100=Limited_100_boards_worldwide_custom_graphics unk_craig_mcmorris_signature=Unknown
% @importance 0.85

0.82::acc(s8, craig_mcmorris_signature).

0.82::true_val(craig_mcmorris_signature, limited_100); 0.18::true_val(craig_mcmorris_signature, unk_craig_mcmorris_signature).
measured(s8, craig_mcmorris_signature, limited_100).
all_consistent(craig_mcmorris_signature) :- consistent(s8, craig_mcmorris_signature).
evidence(all_consistent(craig_mcmorris_signature)).
query(true_val(craig_mcmorris_signature, limited_100)).
query(true_val(craig_mcmorris_signature, unk_craig_mcmorris_signature)).

% @attr comparable_board_same_brand_mons_platform
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Mons platform)
% @values mons_based_on_sp=Mons_Roisland_signature_based_on_Sensor_Pro_platform unk_comparable_board_same_brand_mons_platform=Unknown
% @importance 0.75

0.62::acc(s6, comparable_board_same_brand_mons_platform).

0.68::true_val(comparable_board_same_brand_mons_platform, mons_based_on_sp); 0.32::true_val(comparable_board_same_brand_mons_platform, unk_comparable_board_same_brand_mons_platform).
measured(s6, comparable_board_same_brand_mons_platform, mons_based_on_sp).
all_consistent(comparable_board_same_brand_mons_platform) :- consistent(s6, comparable_board_same_brand_mons_platform).
evidence(all_consistent(comparable_board_same_brand_mons_platform)).
query(true_val(comparable_board_same_brand_mons_platform, mons_based_on_sp)).
query(true_val(comparable_board_same_brand_mons_platform, unk_comparable_board_same_brand_mons_platform)).

% @attr sidekick_technology
% @type categorical
% @canonical false
% @original_name Sidekick technology (on prior models)
% @values replaced_by_orbital=SideKick_prior_models_replaced_by_Orbital_Cushioning_2027 unk_sidekick_technology=Unknown
% @importance 0.85

0.72::acc(s11, sidekick_technology).

0.75::true_val(sidekick_technology, replaced_by_orbital); 0.25::true_val(sidekick_technology, unk_sidekick_technology).
measured(s11, sidekick_technology, replaced_by_orbital).
all_consistent(sidekick_technology) :- consistent(s11, sidekick_technology).
evidence(all_consistent(sidekick_technology)).
query(true_val(sidekick_technology, replaced_by_orbital)).
query(true_val(sidekick_technology, unk_sidekick_technology)).

% @attr industry_trend
% @type categorical
% @canonical false
% @original_name Industry trend context
% @values back_to_camber=Back_to_camber_trend_undeniable_Olympic_year unk_industry_trend=Unknown
% @importance 0.55

0.85::acc(s25, industry_trend).

0.85::true_val(industry_trend, back_to_camber); 0.15::true_val(industry_trend, unk_industry_trend).
measured(s25, industry_trend, back_to_camber).
all_consistent(industry_trend) :- consistent(s25, industry_trend).
evidence(all_consistent(industry_trend)).
query(true_val(industry_trend, back_to_camber)).
query(true_val(industry_trend, unk_industry_trend)).

% @attr recommended_bindings_mfr
% @type categorical
% @canonical false
% @original_name Recommended bindings (manufacturer)
% @values kaon_pro=Kaon_Pro_two_strap_stiff unk_recommended_bindings_mfr=Unknown
% @importance 1.0

0.90::acc(s5, recommended_bindings_mfr).

0.90::true_val(recommended_bindings_mfr, kaon_pro); 0.10::true_val(recommended_bindings_mfr, unk_recommended_bindings_mfr).
measured(s5, recommended_bindings_mfr, kaon_pro).
all_consistent(recommended_bindings_mfr) :- consistent(s5, recommended_bindings_mfr).
evidence(all_consistent(recommended_bindings_mfr)).
query(true_val(recommended_bindings_mfr, kaon_pro)).
query(true_val(recommended_bindings_mfr, unk_recommended_bindings_mfr)).

% @attr recommended_bindings_reviewer
% @type categorical
% @canonical false
% @original_name Recommended bindings (Board of the World reviewer)
% @values supermatic=Nidecker_Supermatic_pair_well unk_recommended_bindings_reviewer=Unknown
% @importance 0.85

0.72::acc(s11, recommended_bindings_reviewer).

0.75::true_val(recommended_bindings_reviewer, supermatic); 0.25::true_val(recommended_bindings_reviewer, unk_recommended_bindings_reviewer).
measured(s11, recommended_bindings_reviewer, supermatic).
all_consistent(recommended_bindings_reviewer) :- consistent(s11, recommended_bindings_reviewer).
evidence(all_consistent(recommended_bindings_reviewer)).
query(true_val(recommended_bindings_reviewer, supermatic)).
query(true_val(recommended_bindings_reviewer, unk_recommended_bindings_reviewer)).