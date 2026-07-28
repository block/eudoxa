0.15::indep(s3).
0.20::indep(s4).
0.15::indep(s7).
0.15::indep(s8).
0.15::indep(s_merchant).
0.15::indep(s2).
0.20::indep(s22).
0.05::indep(s6).
0.10::indep(s21).
0.15::indep(s25).
0.15::indep(s26).
0.20::indep(s24).
0.25::indep(s20).
0.30::indep(s18).
0.30::indep(s19).
0.70::indep(s10).
0.80::indep(s23).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values gnu=GNU unk_brand=Unknown
% @importance 0.85

0.95::acc(s1, brand).
0.80::acc(s7, brand).

0.95::true_val(brand, gnu); 0.05::true_val(brand, unk_brand).

measured(s1, brand, gnu).
measured(s7, brand, gnu).

all_consistent(brand) :-
    consistent(s1, brand),
    (indep(s7), consistent(s7, brand) ; \+indep(s7)).

evidence(all_consistent(brand)).
query(true_val(brand, gnu)).
query(true_val(brand, unk_brand)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values mervin_manufacturing=Mervin_Manufacturing unk_manufacturer=Unknown
% @importance 0.78

0.95::acc(s1, manufacturer).
0.80::acc(s7, manufacturer).
0.90::acc(s18, manufacturer).

0.95::true_val(manufacturer, mervin_manufacturing); 0.05::true_val(manufacturer, unk_manufacturer).

measured(s1, manufacturer, mervin_manufacturing).
measured(s7, manufacturer, mervin_manufacturing).
measured(s18, manufacturer, mervin_manufacturing).

all_consistent(manufacturer) :-
    consistent(s1, manufacturer),
    (indep(s7), consistent(s7, manufacturer) ; \+indep(s7)),
    (indep(s18), consistent(s18, manufacturer) ; \+indep(s18)).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, mervin_manufacturing)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values banked_country=Banked_Country unk_model_name=Unknown
% @importance 0.85

0.95::acc(s1, model_name).
0.80::acc(s7, model_name).

0.95::true_val(model_name, banked_country); 0.05::true_val(model_name, unk_model_name).

measured(s1, model_name, banked_country).
measured(s7, model_name, banked_country).

all_consistent(model_name) :-
    consistent(s1, model_name),
    (indep(s7), consistent(s7, model_name) ; \+indep(s7)).

evidence(all_consistent(model_name)).
query(true_val(model_name, banked_country)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2026=2026_season_2025_2026 unk_model_year=Unknown
% @importance 0.90

0.95::acc(s1, model_year).
0.85::acc(s8, model_year).

0.95::true_val(model_year, y2026); 0.05::true_val(model_year, unk_model_year).

measured(s1, model_year, y2026).
measured(s8, model_year, y2026).

all_consistent(model_year) :-
    consistent(s1, model_year),
    (indep(s8), consistent(s8, model_year) ; \+indep(s8)).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2026)).
query(true_val(model_year, unk_model_year)).

% @attr model_series
% @type categorical
% @canonical false
% @original_name model series
% @values gnu_mens_line=GNU_Snowboards_Mens_Line unk_model_series=Unknown
% @importance 1.0

0.93::acc(s1, model_series).

0.93::true_val(model_series, gnu_mens_line); 0.07::true_val(model_series, unk_model_series).

measured(s1, model_series, gnu_mens_line).

all_consistent(model_series) :- consistent(s1, model_series).

evidence(all_consistent(model_series)).
query(true_val(model_series, gnu_mens_line)).
query(true_val(model_series, unk_model_series)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.97::acc(s1, product_type).

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
% @values all_mountain_freeride=All_Mountain_Freeride unk_board_category=Unknown
% @importance 0.92

0.95::acc(s1, board_category).
0.88::acc(s3, board_category).
0.85::acc(s24, board_category).

0.95::true_val(board_category, all_mountain_freeride); 0.05::true_val(board_category, unk_board_category).

measured(s1, board_category, all_mountain_freeride).
measured(s3, board_category, all_mountain_freeride).
measured(s24, board_category, all_mountain_freeride).

all_consistent(board_category) :-
    consistent(s1, board_category),
    (indep(s3), consistent(s3, board_category) ; \+indep(s3)),
    (indep(s24), consistent(s24, board_category) ; \+indep(s24)).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain_freeride)).
query(true_val(board_category, unk_board_category)).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values gnu_billy_goat=GNU_Billy_Goat_replaced_2021_22 unk_predecessor_model_name=Unknown
% @importance 0.65

0.82::acc(s14, predecessor_model_name).
0.82::acc(s13, predecessor_model_name).

0.95::true_val(predecessor_model_name, gnu_billy_goat); 0.05::true_val(predecessor_model_name, unk_predecessor_model_name).

measured(s14, predecessor_model_name, gnu_billy_goat).
measured(s13, predecessor_model_name, gnu_billy_goat).

all_consistent(predecessor_model_name) :-
    consistent(s14, predecessor_model_name),
    consistent(s13, predecessor_model_name).

evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, gnu_billy_goat)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2021_22=2021_2022_season unk_model_first_available_year=Unknown
% @importance 0.65

0.82::acc(s13, model_first_available_year).
0.82::acc(s14, model_first_available_year).

0.95::true_val(model_first_available_year, season_2021_22); 0.05::true_val(model_first_available_year, unk_model_first_available_year).

measured(s13, model_first_available_year, season_2021_22).
measured(s14, model_first_available_year, season_2021_22).

all_consistent(model_first_available_year) :-
    consistent(s13, model_first_available_year),
    consistent(s14, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2021_22)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values temple_and_cannon_cummins=Temple_and_Cannon_Cummins unk_pro_rider_name=Unknown
% @importance 0.85

0.95::acc(s1, pro_rider_name).
0.80::acc(s7, pro_rider_name).
0.78::acc(s11, pro_rider_name).

0.95::true_val(pro_rider_name, temple_and_cannon_cummins); 0.05::true_val(pro_rider_name, unk_pro_rider_name).

measured(s1, pro_rider_name, temple_and_cannon_cummins).
measured(s7, pro_rider_name, temple_and_cannon_cummins).
measured(s11, pro_rider_name, temple_and_cannon_cummins).

all_consistent(pro_rider_name) :-
    consistent(s1, pro_rider_name),
    (indep(s7), consistent(s7, pro_rider_name) ; \+indep(s7)),
    consistent(s11, pro_rider_name).

evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, temple_and_cannon_cummins)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr design_inspiration
% @type categorical
% @canonical false
% @original_name design inspiration
% @values mt_baker_banked_slalom=Mt_Baker_Banked_Slalom unk_design_inspiration=Unknown
% @importance 0.90

0.95::acc(s1, design_inspiration).
0.88::acc(s18, design_inspiration).
0.85::acc(s24, design_inspiration).

0.95::true_val(design_inspiration, mt_baker_banked_slalom); 0.05::true_val(design_inspiration, unk_design_inspiration).

measured(s1, design_inspiration, mt_baker_banked_slalom).
measured(s18, design_inspiration, mt_baker_banked_slalom).
measured(s24, design_inspiration, mt_baker_banked_slalom).

all_consistent(design_inspiration) :-
    consistent(s1, design_inspiration),
    (indep(s18), consistent(s18, design_inspiration) ; \+indep(s18)),
    (indep(s24), consistent(s24, design_inspiration) ; \+indep(s24)).

evidence(all_consistent(design_inspiration)).
query(true_val(design_inspiration, mt_baker_banked_slalom)).
query(true_val(design_inspiration, unk_design_inspiration)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values banked_country_split=GNU_Banked_Country_Split_1049_99_USD unk_comparable_board_same_brand=Unknown
% @importance 0.90

0.85::acc(s5, comparable_board_same_brand).

0.72::true_val(comparable_board_same_brand, banked_country_split); 0.28::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s5, comparable_board_same_brand, banked_country_split).

all_consistent(comparable_board_same_brand) :- consistent(s5, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, banked_country_split)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr graphic_designer_artist
% @type categorical
% @canonical true
% @original_name graphic_designer_artist
% @values temple_cummins=Temple_Cummins cannon_cummins=Cannon_Cummins
% @importance 0.60

0.93::acc(s1, graphic_designer_artist).
0.50::acc(s2, graphic_designer_artist).
0.55::acc(s23, graphic_designer_artist).

0.62::true_val(graphic_designer_artist, temple_cummins); 0.38::true_val(graphic_designer_artist, cannon_cummins).

measured(s1, graphic_designer_artist, temple_cummins).
measured(s2, graphic_designer_artist, cannon_cummins).
measured(s23, graphic_designer_artist, cannon_cummins).

all_consistent(graphic_designer_artist) :-
    consistent(s1, graphic_designer_artist),
    (indep(s2), consistent(s2, graphic_designer_artist) ; \+indep(s2)),
    (indep(s23), consistent(s23, graphic_designer_artist) ; \+indep(s23)).

evidence(all_consistent(graphic_designer_artist)).
query(true_val(graphic_designer_artist, temple_cummins)).
query(true_val(graphic_designer_artist, cannon_cummins)).

% @attr sku
% @type categorical
% @canonical false
% @original_name SKU
% @values banked_country_sku=banked-country unk_sku=Unknown
% @importance 1.0

0.97::acc(s1, sku).

0.95::true_val(sku, banked_country_sku); 0.05::true_val(sku, unk_sku).

measured(s1, sku, banked_country_sku).

all_consistent(sku) :- consistent(s1, sku).

evidence(all_consistent(sku)).
query(true_val(sku, banked_country_sku)).
query(true_val(sku, unk_sku)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.70

0.92::acc(s7, gender).

0.95::true_val(gender, mens); 0.05::true_val(gender, unk_gender).

measured(s7, gender, mens).

all_consistent(gender) :- (indep(s7), consistent(s7, gender) ; \+indep(s7)).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values usa_washington=Handbuilt_in_USA_Carlsborg_Sequim_WA unk_manufacturing_location=Unknown
% @importance 0.65

0.95::acc(s7, manufacturing_location).
0.90::acc(s18, manufacturing_location).
0.92::acc(s19, manufacturing_location).
0.88::acc(s20, manufacturing_location).

0.97::true_val(manufacturing_location, usa_washington); 0.03::true_val(manufacturing_location, unk_manufacturing_location).

measured(s7, manufacturing_location, usa_washington).
measured(s18, manufacturing_location, usa_washington).
measured(s19, manufacturing_location, usa_washington).
measured(s20, manufacturing_location, usa_washington).

all_consistent(manufacturing_location) :-
    (indep(s7), consistent(s7, manufacturing_location) ; \+indep(s7)),
    (indep(s18), consistent(s18, manufacturing_location) ; \+indep(s18)),
    (indep(s19), consistent(s19, manufacturing_location) ; \+indep(s19)),
    (indep(s20), consistent(s20, manufacturing_location) ; \+indep(s20)).

evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, usa_washington)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

% @attr manufacturing_location_current
% @type categorical
% @canonical false
% @original_name manufacturing_location_current
% @values mervin_last_major_usa_factory=Mervin_Manufacturing_longest_running_last_major_USA_factory unk_manufacturing_location_current=Unknown
% @importance 0.50

0.92::acc(s19, manufacturing_location_current).
0.88::acc(s18, manufacturing_location_current).
0.75::acc(s17, manufacturing_location_current).

0.95::true_val(manufacturing_location_current, mervin_last_major_usa_factory); 0.05::true_val(manufacturing_location_current, unk_manufacturing_location_current).

measured(s19, manufacturing_location_current, mervin_last_major_usa_factory).
measured(s18, manufacturing_location_current, mervin_last_major_usa_factory).
measured(s17, manufacturing_location_current, mervin_last_major_usa_factory).

all_consistent(manufacturing_location_current) :-
    (indep(s19), consistent(s19, manufacturing_location_current) ; \+indep(s19)),
    (indep(s18), consistent(s18, manufacturing_location_current) ; \+indep(s18)),
    consistent(s17, manufacturing_location_current).

evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, mervin_last_major_usa_factory)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

% @attr factory_founded
% @type categorical
% @canonical false
% @original_name factory founded
% @values y1977_olson_saari=1977_by_Mike_Olson_and_Pete_Saari unk_factory_founded=Unknown
% @importance 0.48

0.92::acc(s19, factory_founded).
0.75::acc(s17, factory_founded).

0.95::true_val(factory_founded, y1977_olson_saari); 0.05::true_val(factory_founded, unk_factory_founded).

measured(s19, factory_founded, y1977_olson_saari).
measured(s17, factory_founded, y1977_olson_saari).

all_consistent(factory_founded) :-
    (indep(s19), consistent(s19, factory_founded) ; \+indep(s19)),
    consistent(s17, factory_founded).

evidence(all_consistent(factory_founded)).
query(true_val(factory_founded, y1977_olson_saari)).
query(true_val(factory_founded, unk_factory_founded)).

% @attr factory_ownership
% @type categorical
% @canonical false
% @original_name factory ownership
% @values altamont_capital_2013=Altamont_Capital_purchased_from_Quiksilver_2013 unk_factory_ownership=Unknown
% @importance 0.68

0.90::acc(s18, factory_ownership).
0.75::acc(s17, factory_ownership).
0.82::acc(s6, factory_ownership).

0.95::true_val(factory_ownership, altamont_capital_2013); 0.05::true_val(factory_ownership, unk_factory_ownership).

measured(s18, factory_ownership, altamont_capital_2013).
measured(s17, factory_ownership, altamont_capital_2013).
measured(s6, factory_ownership, altamont_capital_2013).

all_consistent(factory_ownership) :-
    (indep(s18), consistent(s18, factory_ownership) ; \+indep(s18)),
    consistent(s17, factory_ownership),
    (indep(s6), consistent(s6, factory_ownership) ; \+indep(s6)).

evidence(all_consistent(factory_ownership)).
query(true_val(factory_ownership, altamont_capital_2013)).
query(true_val(factory_ownership, unk_factory_ownership)).

% @attr manufacturing_process
% @type categorical
% @canonical false
% @original_name manufacturing process
% @values handbuilt_wet_laminated=Handbuilt_wet_laminated_proprietary_epoxy_custom_press unk_manufacturing_process=Unknown
% @importance 0.55

0.88::acc(s20, manufacturing_process).

0.75::true_val(manufacturing_process, handbuilt_wet_laminated); 0.25::true_val(manufacturing_process, unk_manufacturing_process).

measured(s20, manufacturing_process, handbuilt_wet_laminated).

all_consistent(manufacturing_process) :- (indep(s20), consistent(s20, manufacturing_process) ; \+indep(s20)).

evidence(all_consistent(manufacturing_process)).
query(true_val(manufacturing_process, handbuilt_wet_laminated)).
query(true_val(manufacturing_process, unk_manufacturing_process)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values ecounreal_zero_waste=EcoUNREAL_Manufacturing_zero_hazardous_waste unk_sustainability_certification=Unknown
% @importance 0.58

0.88::acc(s7, sustainability_certification).
0.85::acc(s20, sustainability_certification).

0.95::true_val(sustainability_certification, ecounreal_zero_waste); 0.05::true_val(sustainability_certification, unk_sustainability_certification).

measured(s7, sustainability_certification, ecounreal_zero_waste).
measured(s20, sustainability_certification, ecounreal_zero_waste).

all_consistent(sustainability_certification) :-
    (indep(s7), consistent(s7, sustainability_certification) ; \+indep(s7)),
    (indep(s20), consistent(s20, sustainability_certification) ; \+indep(s20)).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, ecounreal_zero_waste)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr sustainability_certification_water_solvents
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values water_solvents=Water_based_solvents_not_petrochemical unk_sustainability_certification_water_solvents=Unknown
% @importance 0.58

0.88::acc(s7, sustainability_certification_water_solvents).
0.85::acc(s25, sustainability_certification_water_solvents).

0.95::true_val(sustainability_certification_water_solvents, water_solvents); 0.05::true_val(sustainability_certification_water_solvents, unk_sustainability_certification_water_solvents).

measured(s7, sustainability_certification_water_solvents, water_solvents).
measured(s25, sustainability_certification_water_solvents, water_solvents).

all_consistent(sustainability_certification_water_solvents) :-
    (indep(s7), consistent(s7, sustainability_certification_water_solvents) ; \+indep(s7)),
    (indep(s25), consistent(s25, sustainability_certification_water_solvents) ; \+indep(s25)).

evidence(all_consistent(sustainability_certification_water_solvents)).
query(true_val(sustainability_certification_water_solvents, water_solvents)).
query(true_val(sustainability_certification_water_solvents, unk_sustainability_certification_water_solvents)).

% @attr sustainability_certification_renewable_core
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values renewable_forest=Core_from_fast_growing_renewable_forest_products unk_sustainability_certification_renewable_core=Unknown
% @importance 0.58

0.88::acc(s7, sustainability_certification_renewable_core).
0.85::acc(s25, sustainability_certification_renewable_core).

0.95::true_val(sustainability_certification_renewable_core, renewable_forest); 0.05::true_val(sustainability_certification_renewable_core, unk_sustainability_certification_renewable_core).

measured(s7, sustainability_certification_renewable_core, renewable_forest).
measured(s25, sustainability_certification_renewable_core, renewable_forest).

all_consistent(sustainability_certification_renewable_core) :-
    (indep(s7), consistent(s7, sustainability_certification_renewable_core) ; \+indep(s7)),
    (indep(s25), consistent(s25, sustainability_certification_renewable_core) ; \+indep(s25)).

evidence(all_consistent(sustainability_certification_renewable_core)).
query(true_val(sustainability_certification_renewable_core, renewable_forest)).
query(true_val(sustainability_certification_renewable_core, unk_sustainability_certification_renewable_core)).

% @attr sustainability_certification_eco_printing
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values eco_sub_zero_waste=Eco_sublimation_printing_zero_hazardous_waste unk_sustainability_certification_eco_printing=Unknown
% @importance 0.45

0.85::acc(s20, sustainability_certification_eco_printing).

0.75::true_val(sustainability_certification_eco_printing, eco_sub_zero_waste); 0.25::true_val(sustainability_certification_eco_printing, unk_sustainability_certification_eco_printing).

measured(s20, sustainability_certification_eco_printing, eco_sub_zero_waste).

all_consistent(sustainability_certification_eco_printing) :- (indep(s20), consistent(s20, sustainability_certification_eco_printing) ; \+indep(s20)).

evidence(all_consistent(sustainability_certification_eco_printing)).
query(true_val(sustainability_certification_eco_printing, eco_sub_zero_waste)).
query(true_val(sustainability_certification_eco_printing, unk_sustainability_certification_eco_printing)).

% @attr sustainability_certification_clean_power
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values wind_water_power=WA_state_power_from_wind_and_water unk_sustainability_certification_clean_power=Unknown
% @importance 0.45

0.85::acc(s20, sustainability_certification_clean_power).

0.75::true_val(sustainability_certification_clean_power, wind_water_power); 0.25::true_val(sustainability_certification_clean_power, unk_sustainability_certification_clean_power).

measured(s20, sustainability_certification_clean_power, wind_water_power).

all_consistent(sustainability_certification_clean_power) :- (indep(s20), consistent(s20, sustainability_certification_clean_power) ; \+indep(s20)).

evidence(all_consistent(sustainability_certification_clean_power)).
query(true_val(sustainability_certification_clean_power, wind_water_power)).
query(true_val(sustainability_certification_clean_power, unk_sustainability_certification_clean_power)).

% @attr sustainability_certification_fsc
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values fsc_certified=FSC_Certified_wood_core unk_sustainability_certification_fsc=Unknown
% @importance 0.73

0.88::acc(s3, sustainability_certification_fsc).
0.82::acc(s22, sustainability_certification_fsc).
0.80::acc(s8, sustainability_certification_fsc).

0.95::true_val(sustainability_certification_fsc, fsc_certified); 0.05::true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc).

measured(s3, sustainability_certification_fsc, fsc_certified).
measured(s22, sustainability_certification_fsc, fsc_certified).
measured(s8, sustainability_certification_fsc, fsc_certified).

all_consistent(sustainability_certification_fsc) :-
    (indep(s3), consistent(s3, sustainability_certification_fsc) ; \+indep(s3)),
    (indep(s22), consistent(s22, sustainability_certification_fsc) ; \+indep(s22)),
    (indep(s8), consistent(s8, sustainability_certification_fsc) ; \+indep(s8)).

evidence(all_consistent(sustainability_certification_fsc)).
query(true_val(sustainability_certification_fsc, fsc_certified)).
query(true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc)).

% @attr sustainability_certification_sublimation
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values eco_sub_nontoxic=Eco_sublimation_non_toxic_no_silk_screen unk_sustainability_certification_sublimation=Unknown
% @importance 0.45

0.85::acc(s20, sustainability_certification_sublimation).

0.75::true_val(sustainability_certification_sublimation, eco_sub_nontoxic); 0.25::true_val(sustainability_certification_sublimation, unk_sustainability_certification_sublimation).

measured(s20, sustainability_certification_sublimation, eco_sub_nontoxic).

all_consistent(sustainability_certification_sublimation) :- (indep(s20), consistent(s20, sustainability_certification_sublimation) ; \+indep(s20)).

evidence(all_consistent(sustainability_certification_sublimation)).
query(true_val(sustainability_certification_sublimation, eco_sub_nontoxic)).
query(true_val(sustainability_certification_sublimation, unk_sustainability_certification_sublimation)).

% @attr sustainability_certification_overall
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values eco_another_level=Super_eco_construction_another_level_vs_any_brand unk_sustainability_certification_overall=Unknown
% @importance 0.88

0.85::acc(s6, sustainability_certification_overall).
0.82::acc(s26, sustainability_certification_overall).

0.95::true_val(sustainability_certification_overall, eco_another_level); 0.05::true_val(sustainability_certification_overall, unk_sustainability_certification_overall).

measured(s6, sustainability_certification_overall, eco_another_level).
measured(s26, sustainability_certification_overall, eco_another_level).

all_consistent(sustainability_certification_overall) :-
    (indep(s6), consistent(s6, sustainability_certification_overall) ; \+indep(s6)),
    (indep(s26), consistent(s26, sustainability_certification_overall) ; \+indep(s26)).

evidence(all_consistent(sustainability_certification_overall)).
query(true_val(sustainability_certification_overall, eco_another_level)).
query(true_val(sustainability_certification_overall, unk_sustainability_certification_overall)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 0.92

0.95::acc(s1, shape).
0.88::acc(s3, shape).
0.90::acc(s_merchant, shape).

0.97::true_val(shape, tapered_directional); 0.03::true_val(shape, unk_shape).

measured(s1, shape, tapered_directional).
measured(s3, shape, tapered_directional).
measured(s_merchant, shape, tapered_directional).

all_consistent(shape) :-
    consistent(s1, shape),
    (indep(s3), consistent(s3, shape) ; \+indep(s3)),
    (indep(s_merchant), consistent(s_merchant, shape) ; \+indep(s_merchant)).

evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

% @attr shape_description
% @type categorical
% @canonical false
% @original_name shape description
% @values tail_narrower_enhanced_pow=Tail_narrower_than_nose_enhanced_control_in_deep_snow unk_shape_description=Unknown
% @importance 0.85

0.88::acc(s3, shape_description).

0.63::true_val(shape_description, tail_narrower_enhanced_pow); 0.37::true_val(shape_description, unk_shape_description).

measured(s3, shape_description, tail_narrower_enhanced_pow).

all_consistent(shape_description) :- (indep(s3), consistent(s3, shape_description) ; \+indep(s3)).

evidence(all_consistent(shape_description)).
query(true_val(shape_description, tail_narrower_enhanced_pow)).
query(true_val(shape_description, unk_shape_description)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values c3=C3_dominant_camber_mild_rocker_between_feet unk_camber_type=Unknown
% @importance 0.93

0.95::acc(s1, camber_type).
0.88::acc(s3, camber_type).
0.85::acc(s4, camber_type).
0.90::acc(s_merchant, camber_type).

0.97::true_val(camber_type, c3); 0.03::true_val(camber_type, unk_camber_type).

measured(s1, camber_type, c3).
measured(s3, camber_type, c3).
measured(s4, camber_type, c3).
measured(s_merchant, camber_type, c3).

all_consistent(camber_type) :-
    consistent(s1, camber_type),
    (indep(s3), consistent(s3, camber_type) ; \+indep(s3)),
    (indep(s4), consistent(s4, camber_type) ; \+indep(s4)),
    (indep(s_merchant), consistent(s_merchant, camber_type) ; \+indep(s_merchant)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, c3)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values aggressive_camber_mild_rocker=Aggressive_dominant_camber_mild_rocker_between_feet full_camber_mellow_bend=Pretty_much_full_camber_tip_to_tail_mellow_passive_bend
% @importance 0.88

0.90::acc(s4, camber_description).
0.85::acc(s22, camber_description).
0.88::acc(s6, camber_description).

0.55::true_val(camber_description, aggressive_camber_mild_rocker); 0.45::true_val(camber_description, full_camber_mellow_bend).

measured(s4, camber_description, aggressive_camber_mild_rocker).
measured(s22, camber_description, aggressive_camber_mild_rocker).
measured(s6, camber_description, full_camber_mellow_bend).

all_consistent(camber_description) :-
    (indep(s4), consistent(s4, camber_description) ; \+indep(s4)),
    (indep(s22), consistent(s22, camber_description) ; \+indep(s22)),
    (indep(s6), consistent(s6, camber_description) ; \+indep(s6)).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, aggressive_camber_mild_rocker)).
query(true_val(camber_description, full_camber_mellow_bend)).

% @attr camber_height_mm
% @type numeric
% @canonical true
% @original_name camber_height_mm
% @unit mm
% @values v6=6.0 unk_camber_height_mm=Unknown
% @importance 0.90

0.92::acc(s9, camber_height_mm).

0.76::true_val(camber_height_mm, v6); 0.24::true_val(camber_height_mm, unk_camber_height_mm).

measured(s9, camber_height_mm, v6).

all_consistent(camber_height_mm) :- consistent(s9, camber_height_mm).

evidence(all_consistent(camber_height_mm)).
query(true_val(camber_height_mm, v6)).
query(true_val(camber_height_mm, unk_camber_height_mm)).

% @attr taper
% @type categorical
% @canonical false
% @original_name taper
% @values mild_2mm=Mild_taper_approximately_2mm unk_taper=Unknown
% @importance 0.95

0.93::acc(s1, taper).
0.85::acc(s5, taper).

0.95::true_val(taper, mild_2mm); 0.05::true_val(taper, unk_taper).

measured(s1, taper, mild_2mm).
measured(s5, taper, mild_2mm).

all_consistent(taper) :-
    consistent(s1, taper),
    consistent(s5, taper).

evidence(all_consistent(taper)).
query(true_val(taper, mild_2mm)).
query(true_val(taper, unk_taper)).

% @attr setback
% @type categorical
% @canonical true
% @original_name setback
% @values v1_5in=1.5_inch_38mm_sidecut_setback v2_25in=2.25_inch_at_22_75_stance
% @importance 0.92

0.93::acc(s1, setback).
0.88::acc(s3, setback).
0.85::acc(s_merchant, setback).
0.85::acc(s5, setback).

0.60::true_val(setback, v1_5in); 0.40::true_val(setback, v2_25in).

measured(s1, setback, v1_5in).
measured(s3, setback, v1_5in).
measured(s_merchant, setback, v1_5in).
measured(s5, setback, v2_25in).

all_consistent(setback) :-
    consistent(s1, setback),
    (indep(s3), consistent(s3, setback) ; \+indep(s3)),
    (indep(s_merchant), consistent(s_merchant, setback) ; \+indep(s_merchant)),
    consistent(s5, setback).

evidence(all_consistent(setback)).
query(true_val(setback, v1_5in)).
query(true_val(setback, v2_25in)).

% @attr nose_design
% @type categorical
% @canonical false
% @original_name nose design
% @values big_floaty=Big_floaty_nose_for_powder_float unk_nose_design=Unknown
% @importance 0.95

0.93::acc(s1, nose_design).
0.85::acc(s4, nose_design).

0.95::true_val(nose_design, big_floaty); 0.05::true_val(nose_design, unk_nose_design).

measured(s1, nose_design, big_floaty).
measured(s4, nose_design, big_floaty).

all_consistent(nose_design) :-
    consistent(s1, nose_design),
    (indep(s4), consistent(s4, nose_design) ; \+indep(s4)).

evidence(all_consistent(nose_design)).
query(true_val(nose_design, big_floaty)).
query(true_val(nose_design, unk_nose_design)).

% @attr tail_design
% @type categorical
% @canonical false
% @original_name tail design
% @values switch_friendly_blunted=Switch_friendly_tail_blunted_from_original_diamond unk_tail_design=Unknown
% @importance 0.82

0.93::acc(s1, tail_design).
0.82::acc(s15, tail_design).
0.70::acc(s22, tail_design).

0.95::true_val(tail_design, switch_friendly_blunted); 0.05::true_val(tail_design, unk_tail_design).

measured(s1, tail_design, switch_friendly_blunted).
measured(s15, tail_design, switch_friendly_blunted).
measured(s22, tail_design, switch_friendly_blunted).

all_consistent(tail_design) :-
    consistent(s1, tail_design),
    consistent(s15, tail_design),
    (indep(s22), consistent(s22, tail_design) ; \+indep(s22)).

evidence(all_consistent(tail_design)).
query(true_val(tail_design, switch_friendly_blunted)).
query(true_val(tail_design, unk_tail_design)).

% @attr flex_rating_10_manufacturer
% @type numeric
% @canonical true
% @original_name flex_rating_10_manufacturer
% @unit /10
% @values v6_5=6.5 unk_flex_rating_10_manufacturer=Unknown
% @importance 1.0

0.95::acc(s1, flex_rating_10_manufacturer).

0.93::true_val(flex_rating_10_manufacturer, v6_5); 0.07::true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer).

measured(s1, flex_rating_10_manufacturer, v6_5).

all_consistent(flex_rating_10_manufacturer) :- consistent(s1, flex_rating_10_manufacturer).

evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, v6_5)).
query(true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer)).

% @attr flex_rating_10_manufacturer_159
% @type numeric
% @canonical false
% @original_name flex_rating_10_manufacturer
% @unit /10
% @values v7=7.0 unk_flex_rating_10_manufacturer_159=Unknown
% @importance 1.0

0.95::acc(s1, flex_rating_10_manufacturer_159).

0.93::true_val(flex_rating_10_manufacturer_159, v7); 0.07::true_val(flex_rating_10_manufacturer_159, unk_flex_rating_10_manufacturer_159).

measured(s1, flex_rating_10_manufacturer_159, v7).

all_consistent(flex_rating_10_manufacturer_159) :- consistent(s1, flex_rating_10_manufacturer_159).

evidence(all_consistent(flex_rating_10_manufacturer_159)).
query(true_val(flex_rating_10_manufacturer_159, v7)).
query(true_val(flex_rating_10_manufacturer_159, unk_flex_rating_10_manufacturer_159)).

% @attr flex_rating_10_manufacturer_160w
% @type numeric
% @canonical false
% @original_name flex_rating_10_manufacturer
% @unit /10
% @values v7=7.0 unk_flex_rating_10_manufacturer_160w=Unknown
% @importance 1.0

0.95::acc(s1, flex_rating_10_manufacturer_160w).

0.93::true_val(flex_rating_10_manufacturer_160w, v7); 0.07::true_val(flex_rating_10_manufacturer_160w, unk_flex_rating_10_manufacturer_160w).

measured(s1, flex_rating_10_manufacturer_160w, v7).

all_consistent(flex_rating_10_manufacturer_160w) :- consistent(s1, flex_rating_10_manufacturer_160w).

evidence(all_consistent(flex_rating_10_manufacturer_160w)).
query(true_val(flex_rating_10_manufacturer_160w, v7)).
query(true_val(flex_rating_10_manufacturer_160w, unk_flex_rating_10_manufacturer_160w)).

% @attr flex_rating_10_manufacturer_162
% @type numeric
% @canonical false
% @original_name flex_rating_10_manufacturer
% @unit /10
% @values v7=7.0 unk_flex_rating_10_manufacturer_162=Unknown
% @importance 1.0

0.95::acc(s1, flex_rating_10_manufacturer_162).

0.93::true_val(flex_rating_10_manufacturer_162, v7); 0.07::true_val(flex_rating_10_manufacturer_162, unk_flex_rating_10_manufacturer_162).

measured(s1, flex_rating_10_manufacturer_162, v7).

all_consistent(flex_rating_10_manufacturer_162) :- consistent(s1, flex_rating_10_manufacturer_162).

evidence(all_consistent(flex_rating_10_manufacturer_162)).
query(true_val(flex_rating_10_manufacturer_162, v7)).
query(true_val(flex_rating_10_manufacturer_162, unk_flex_rating_10_manufacturer_162)).

% @attr flex_rating_10_manufacturer_163w
% @type numeric
% @canonical false
% @original_name flex_rating_10_manufacturer
% @unit /10
% @values v7=7.0 unk_flex_rating_10_manufacturer_163w=Unknown
% @importance 1.0

0.95::acc(s1, flex_rating_10_manufacturer_163w).

0.93::true_val(flex_rating_10_manufacturer_163w, v7); 0.07::true_val(flex_rating_10_manufacturer_163w, unk_flex_rating_10_manufacturer_163w).

measured(s1, flex_rating_10_manufacturer_163w, v7).

all_consistent(flex_rating_10_manufacturer_163w) :- consistent(s1, flex_rating_10_manufacturer_163w).

evidence(all_consistent(flex_rating_10_manufacturer_163w)).
query(true_val(flex_rating_10_manufacturer_163w, v7)).
query(true_val(flex_rating_10_manufacturer_163w, unk_flex_rating_10_manufacturer_163w)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @original_name flex_rating_10
% @unit /10
% @values v7=7.0 v8=8.0
% @importance 0.88

0.90::acc(s1, flex_rating_10).
0.82::acc(s11, flex_rating_10).
0.70::acc(s_merchant, flex_rating_10).
0.55::acc(s16, flex_rating_10).

0.60::true_val(flex_rating_10, v7); 0.40::true_val(flex_rating_10, v8).

measured(s1, flex_rating_10, v7).
measured(s11, flex_rating_10, v7).
measured(s_merchant, flex_rating_10, v8).
measured(s16, flex_rating_10, v8).

all_consistent(flex_rating_10) :-
    consistent(s1, flex_rating_10),
    consistent(s11, flex_rating_10),
    (indep(s_merchant), consistent(s_merchant, flex_rating_10) ; \+indep(s_merchant)),
    consistent(s16, flex_rating_10).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v7)).
query(true_val(flex_rating_10, v8)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values stiff=Stiff mid_stiff=Mid_Stiff medium_bordering_stiff=Medium_bordering_medium_stiff
% @importance 0.87

0.85::acc(s_merchant, flex_feel).
0.90::acc(s9, flex_feel).
0.82::acc(s10, flex_feel).
0.85::acc(s5, flex_feel).

0.25::true_val(flex_feel, stiff); 0.40::true_val(flex_feel, mid_stiff); 0.35::true_val(flex_feel, medium_bordering_stiff).

measured(s_merchant, flex_feel, stiff).
measured(s9, flex_feel, mid_stiff).
measured(s10, flex_feel, stiff).
measured(s5, flex_feel, medium_bordering_stiff).

all_consistent(flex_feel) :-
    (indep(s_merchant), consistent(s_merchant, flex_feel) ; \+indep(s_merchant)),
    consistent(s9, flex_feel),
    (indep(s10), consistent(s10, flex_feel) ; \+indep(s10)),
    consistent(s5, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, stiff)).
query(true_val(flex_feel, mid_stiff)).
query(true_val(flex_feel, medium_bordering_stiff)).

% @attr flex_direction
% @type categorical
% @canonical false
% @original_name flex_direction
% @values directional_nose_softer=Directional_nose_softer_than_tail unk_flex_direction=Unknown
% @importance 0.78

0.82::acc(s12, flex_direction).

0.65::true_val(flex_direction, directional_nose_softer); 0.35::true_val(flex_direction, unk_flex_direction).

measured(s12, flex_direction, directional_nose_softer).

all_consistent(flex_direction) :- consistent(s12, flex_direction).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional_nose_softer)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr flex_rating_10_evo
% @type categorical
% @canonical false
% @original_name flex_rating_10_evo
% @values very_stiff=Very_Stiff_evo_categorization unk_flex_rating_10_evo=Unknown
% @importance 0.85

0.75::acc(s21, flex_rating_10_evo).

0.68::true_val(flex_rating_10_evo, very_stiff); 0.32::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).

measured(s21, flex_rating_10_evo, very_stiff).

all_consistent(flex_rating_10_evo) :- (indep(s21), consistent(s21, flex_rating_10_evo) ; \+indep(s21)).

evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, very_stiff)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

% @attr flex_change_2024
% @type categorical
% @canonical false
% @original_name flex change (2024+)
% @values softer_snappier=2024_model_felt_softer_more_snappy_than_prior unk_flex_change_2024=Unknown
% @importance 0.80

0.82::acc(s12, flex_change_2024).
0.80::acc(s9, flex_change_2024).
0.78::acc(s11, flex_change_2024).

0.95::true_val(flex_change_2024, softer_snappier); 0.05::true_val(flex_change_2024, unk_flex_change_2024).

measured(s12, flex_change_2024, softer_snappier).
measured(s9, flex_change_2024, softer_snappier).
measured(s11, flex_change_2024, softer_snappier).

all_consistent(flex_change_2024) :-
    consistent(s12, flex_change_2024),
    consistent(s9, flex_change_2024),
    consistent(s11, flex_change_2024).

evidence(all_consistent(flex_change_2024)).
query(true_val(flex_change_2024, softer_snappier)).
query(true_val(flex_change_2024, unk_flex_change_2024)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values hand_flex_deceptive=Hand_flex_deceptive_stiff_cambered_zones_under_inserts unk_user_review_forum=Unknown
% @importance 0.65

0.55::acc(s16, user_review_forum).

0.40::true_val(user_review_forum, hand_flex_deceptive); 0.60::true_val(user_review_forum, unk_user_review_forum).

measured(s16, user_review_forum, hand_flex_deceptive).

all_consistent(user_review_forum) :- consistent(s16, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, hand_flex_deceptive)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values g_lite_3=G_Lite_3_FSC_Aspen_Paulownia_Carbon_Power_Bands unk_core_material=Unknown
% @importance 0.91

0.95::acc(s1, core_material).
0.88::acc(s3, core_material).
0.85::acc(s22, core_material).
0.90::acc(s_merchant, core_material).
0.85::acc(s8, core_material).

0.97::true_val(core_material, g_lite_3); 0.03::true_val(core_material, unk_core_material).

measured(s1, core_material, g_lite_3).
measured(s3, core_material, g_lite_3).
measured(s22, core_material, g_lite_3).
measured(s_merchant, core_material, g_lite_3).
measured(s8, core_material, g_lite_3).

all_consistent(core_material) :-
    consistent(s1, core_material),
    (indep(s3), consistent(s3, core_material) ; \+indep(s3)),
    (indep(s22), consistent(s22, core_material) ; \+indep(s22)),
    (indep(s_merchant), consistent(s_merchant, core_material) ; \+indep(s_merchant)),
    (indep(s8), consistent(s8, core_material) ; \+indep(s8)).

evidence(all_consistent(core_material)).
query(true_val(core_material, g_lite_3)).
query(true_val(core_material, unk_core_material)).

% @attr construction_material_innovation
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values carbon_power_bands=Carbon_Power_Bands_radical_response_and_pop unk_construction_material_innovation=Unknown
% @importance 0.88

0.95::acc(s1, construction_material_innovation).
0.80::acc(s23, construction_material_innovation).
0.90::acc(s_merchant, construction_material_innovation).

0.95::true_val(construction_material_innovation, carbon_power_bands); 0.05::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s1, construction_material_innovation, carbon_power_bands).
measured(s23, construction_material_innovation, carbon_power_bands).
measured(s_merchant, construction_material_innovation, carbon_power_bands).

all_consistent(construction_material_innovation) :-
    consistent(s1, construction_material_innovation),
    (indep(s23), consistent(s23, construction_material_innovation) ; \+indep(s23)),
    (indep(s_merchant), consistent(s_merchant, construction_material_innovation) ; \+indep(s_merchant)).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, carbon_power_bands)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values triax_biax_carbon=Tri_Ax_Bi_Ax_fiberglass_Carbon_Power_Bands unk_laminate=Unknown
% @importance 0.92

0.95::acc(s1, laminate).
0.85::acc(s4, laminate).
0.90::acc(s_merchant, laminate).
0.82::acc(s22, laminate).

0.97::true_val(laminate, triax_biax_carbon); 0.03::true_val(laminate, unk_laminate).

measured(s1, laminate, triax_biax_carbon).
measured(s4, laminate, triax_biax_carbon).
measured(s_merchant, laminate, triax_biax_carbon).
measured(s22, laminate, triax_biax_carbon).

all_consistent(laminate) :-
    consistent(s1, laminate),
    (indep(s4), consistent(s4, laminate) ; \+indep(s4)),
    (indep(s_merchant), consistent(s_merchant, laminate) ; \+indep(s_merchant)),
    (indep(s22), consistent(s22, laminate) ; \+indep(s22)).

evidence(all_consistent(laminate)).
query(true_val(laminate, triax_biax_carbon)).
query(true_val(laminate, unk_laminate)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values uhmw=UHMW_wraps_around_tip_tail unk_sidewall_material=Unknown
% @importance 0.88

0.88::acc(s3, sidewall_material).
0.90::acc(s_merchant, sidewall_material).
0.85::acc(s6, sidewall_material).

0.95::true_val(sidewall_material, uhmw); 0.05::true_val(sidewall_material, unk_sidewall_material).

measured(s3, sidewall_material, uhmw).
measured(s_merchant, sidewall_material, uhmw).
measured(s6, sidewall_material, uhmw).

all_consistent(sidewall_material) :-
    (indep(s3), consistent(s3, sidewall_material) ; \+indep(s3)),
    (indep(s_merchant), consistent(s_merchant, sidewall_material) ; \+indep(s_merchant)),
    (indep(s6), consistent(s6, sidewall_material) ; \+indep(s6)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, uhmw)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_knife_cut=Sintered_Knife_Cut_Base unk_base_material=Unknown
% @importance 0.88

0.90::acc(s3, base_material).
0.90::acc(s_merchant, base_material).

0.95::true_val(base_material, sintered_knife_cut); 0.05::true_val(base_material, unk_base_material).

measured(s3, base_material, sintered_knife_cut).
measured(s_merchant, base_material, sintered_knife_cut).

all_consistent(base_material) :-
    (indep(s3), consistent(s3, base_material) ; \+indep(s3)),
    (indep(s_merchant), consistent(s_merchant, base_material) ; \+indep(s_merchant)).

evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_knife_cut)).
query(true_val(base_material, unk_base_material)).

% @attr base_type
% @type categorical
% @canonical false
% @original_name base_type
% @values die_cut_reduce_waste=Die_cut_base_to_reduce_waste unk_base_type=Unknown
% @importance 0.85

0.88::acc(s3, base_type).

0.63::true_val(base_type, die_cut_reduce_waste); 0.37::true_val(base_type, unk_base_type).

measured(s3, base_type, die_cut_reduce_waste).

all_consistent(base_type) :- (indep(s3), consistent(s3, base_type) ; \+indep(s3)).

evidence(all_consistent(base_type)).
query(true_val(base_type, die_cut_reduce_waste)).
query(true_val(base_type, unk_base_type)).

% @attr topsheet
% @type categorical
% @canonical false
% @original_name topsheet
% @values eco_sublimated_poly=Eco_Sublimated_Poly_Topsheet unk_topsheet=Unknown
% @importance 0.85

0.90::acc(s_merchant, topsheet).

0.95::true_val(topsheet, eco_sublimated_poly); 0.05::true_val(topsheet, unk_topsheet).

measured(s_merchant, topsheet, eco_sublimated_poly).

all_consistent(topsheet) :- (indep(s_merchant), consistent(s_merchant, topsheet) ; \+indep(s_merchant)).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, eco_sublimated_poly)).
query(true_val(topsheet, unk_topsheet)).

% @attr topsheet_appearance
% @type categorical
% @canonical false
% @original_name topsheet_appearance_description
% @values scuffs_easy_reliable=Scuffs_easy_but_pretty_reliable unk_topsheet_appearance=Unknown
% @importance 0.85

0.82::acc(s6, topsheet_appearance).

0.72::true_val(topsheet_appearance, scuffs_easy_reliable); 0.28::true_val(topsheet_appearance, unk_topsheet_appearance).

measured(s6, topsheet_appearance, scuffs_easy_reliable).

all_consistent(topsheet_appearance) :- (indep(s6), consistent(s6, topsheet_appearance) ; \+indep(s6)).

evidence(all_consistent(topsheet_appearance)).
query(true_val(topsheet_appearance, scuffs_easy_reliable)).
query(true_val(topsheet_appearance, unk_topsheet_appearance)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values progressive_pro_magne_traction=Progressive_Pro_Magne_Traction_directional unk_edge_technology=Unknown
% @importance 0.88

0.95::acc(s1, edge_technology).
0.90::acc(s_merchant, edge_technology).

0.97::true_val(edge_technology, progressive_pro_magne_traction); 0.03::true_val(edge_technology, unk_edge_technology).

measured(s1, edge_technology, progressive_pro_magne_traction).
measured(s_merchant, edge_technology, progressive_pro_magne_traction).

all_consistent(edge_technology) :-
    consistent(s1, edge_technology),
    (indep(s_merchant), consistent(s_merchant, edge_technology) ; \+indep(s_merchant)).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, progressive_pro_magne_traction)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr edge_technology_detail
% @type categorical
% @canonical false
% @original_name edge_technology
% @values fewer_front_more_tail=Fewer_contact_points_front_more_aggressive_tail unk_edge_technology_detail=Unknown
% @importance 0.78

0.78::acc(s12, edge_technology_detail).

0.64::true_val(edge_technology_detail, fewer_front_more_tail); 0.36::true_val(edge_technology_detail, unk_edge_technology_detail).

measured(s12, edge_technology_detail, fewer_front_more_tail).

all_consistent(edge_technology_detail) :- consistent(s12, edge_technology_detail).

evidence(all_consistent(edge_technology_detail)).
query(true_val(edge_technology_detail, fewer_front_more_tail)).
query(true_val(edge_technology_detail, unk_edge_technology_detail)).

% @attr edge_technology_effect
% @type categorical
% @canonical false
% @original_name edge_technology
% @values mtx_waist_wider=MTX_bumps_make_waist_seem_3_4mm_wider unk_edge_technology_effect=Unknown
% @importance 0.90

0.85::acc(s5, edge_technology_effect).

0.72::true_val(edge_technology_effect, mtx_waist_wider); 0.28::true_val(edge_technology_effect, unk_edge_technology_effect).

measured(s5, edge_technology_effect, mtx_waist_wider).

all_consistent(edge_technology_effect) :- consistent(s5, edge_technology_effect).

evidence(all_consistent(edge_technology_effect)).
query(true_val(edge_technology_effect, mtx_waist_wider)).
query(true_val(edge_technology_effect, unk_edge_technology_effect)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 0.85

0.90::acc(s_merchant, mounting_pattern).

0.95::true_val(mounting_pattern, inserts_2x4); 0.05::true_val(mounting_pattern, unk_mounting_pattern).

measured(s_merchant, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :- (indep(s_merchant), consistent(s_merchant, mounting_pattern) ; \+indep(s_merchant)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values five_sizes=155_159_160W_162_163W three_sizes_merchant=155_159_160W
% @importance 0.90

0.95::acc(s1, available_sizes).
0.80::acc(s_merchant, available_sizes).

0.70::true_val(available_sizes, five_sizes); 0.30::true_val(available_sizes, three_sizes_merchant).

measured(s1, available_sizes, five_sizes).
measured(s_merchant, available_sizes, three_sizes_merchant).

all_consistent(available_sizes) :-
    consistent(s1, available_sizes),
    (indep(s_merchant), consistent(s_merchant, available_sizes) ; \+indep(s_merchant)).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, five_sizes)).
query(true_val(available_sizes, three_sizes_merchant)).

% @attr contact_length_size
% @type numeric
% @canonical true
% @original_name contact_length_size
% @unit cm
% @values v112=112.0 unk_contact_length_size=Unknown
% @importance 0.93

0.95::acc(s1, contact_length_size).
0.90::acc(s_merchant, contact_length_size).

0.95::true_val(contact_length_size, v112); 0.05::true_val(contact_length_size, unk_contact_length_size).

measured(s1, contact_length_size, v112).
measured(s_merchant, contact_length_size, v112).

all_consistent(contact_length_size) :-
    consistent(s1, contact_length_size),
    (indep(s_merchant), consistent(s_merchant, contact_length_size) ; \+indep(s_merchant)).

evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v112)).
query(true_val(contact_length_size, unk_contact_length_size)).

% @attr sidecut_radius_size
% @type numeric
% @canonical true
% @original_name sidecut_radius_size
% @unit m
% @values v8_2=8.2 unk_sidecut_radius_size=Unknown
% @importance 0.93

0.95::acc(s1, sidecut_radius_size).
0.90::acc(s_merchant, sidecut_radius_size).

0.95::true_val(sidecut_radius_size, v8_2); 0.05::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s1, sidecut_radius_size, v8_2).
measured(s_merchant, sidecut_radius_size, v8_2).

all_consistent(sidecut_radius_size) :-
    consistent(s1, sidecut_radius_size),
    (indep(s_merchant), consistent(s_merchant, sidecut_radius_size) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v8_2)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr tip_tail_width_size
% @type categorical
% @canonical true
% @original_name tip_tail_width_size
% @unit cm
% @values v29_4_29_2=29.4_29.2 unk_tip_tail_width_size=Unknown
% @importance 0.93

0.95::acc(s1, tip_tail_width_size).
0.90::acc(s_merchant, tip_tail_width_size).

0.95::true_val(tip_tail_width_size, v29_4_29_2); 0.05::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s1, tip_tail_width_size, v29_4_29_2).
measured(s_merchant, tip_tail_width_size, v29_4_29_2).

all_consistent(tip_tail_width_size) :-
    consistent(s1, tip_tail_width_size),
    (indep(s_merchant), consistent(s_merchant, tip_tail_width_size) ; \+indep(s_merchant)).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v29_4_29_2)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr waist_width_155
% @type numeric
% @canonical false
% @original_name waist width 155cm
% @unit cm
% @values v25_3=25.3 unk_waist_width_155=Unknown
% @importance 0.93

0.95::acc(s1, waist_width_155).
0.90::acc(s_merchant, waist_width_155).

0.95::true_val(waist_width_155, v25_3); 0.05::true_val(waist_width_155, unk_waist_width_155).

measured(s1, waist_width_155, v25_3).
measured(s_merchant, waist_width_155, v25_3).

all_consistent(waist_width_155) :-
    consistent(s1, waist_width_155),
    (indep(s_merchant), consistent(s_merchant, waist_width_155) ; \+indep(s_merchant)).

evidence(all_consistent(waist_width_155)).
query(true_val(waist_width_155, v25_3)).
query(true_val(waist_width_155, unk_waist_width_155)).

% @attr stance_width_range_size
% @type categorical
% @canonical true
% @original_name stance_width_range_size
% @unit inches
% @values r19_24_sb1_5=19_to_24_inch_setback_1_5 unk_stance_width_range_size=Unknown
% @importance 0.93

0.95::acc(s1, stance_width_range_size).
0.90::acc(s_merchant, stance_width_range_size).

0.95::true_val(stance_width_range_size, r19_24_sb1_5); 0.05::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s1, stance_width_range_size, r19_24_sb1_5).
measured(s_merchant, stance_width_range_size, r19_24_sb1_5).

all_consistent(stance_width_range_size) :-
    consistent(s1, stance_width_range_size),
    (indep(s_merchant), consistent(s_merchant, stance_width_range_size) ; \+indep(s_merchant)).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, r19_24_sb1_5)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size
% @values w130_plus=130_plus_lbs_55_plus_kg unk_recommended_weight_range_size=Unknown
% @importance 0.93

0.95::acc(s1, recommended_weight_range_size).
0.90::acc(s_merchant, recommended_weight_range_size).

0.95::true_val(recommended_weight_range_size, w130_plus); 0.05::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s1, recommended_weight_range_size, w130_plus).
measured(s_merchant, recommended_weight_range_size, w130_plus).

all_consistent(recommended_weight_range_size) :-
    consistent(s1, recommended_weight_range_size),
    (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size) ; \+indep(s_merchant)).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w130_plus)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr contact_length_size_159
% @type numeric
% @canonical false
% @original_name contact_length_size
% @unit cm
% @values v114=114.0 unk_contact_length_size_159=Unknown
% @importance 0.93

0.95::acc(s1, contact_length_size_159).
0.90::acc(s_merchant, contact_length_size_159).

0.95::true_val(contact_length_size_159, v114); 0.05::true_val(contact_length_size_159, unk_contact_length_size_159).

measured(s1, contact_length_size_159, v114).
measured(s_merchant, contact_length_size_159, v114).

all_consistent(contact_length_size_159) :-
    consistent(s1, contact_length_size_159),
    (indep(s_merchant), consistent(s_merchant, contact_length_size_159) ; \+indep(s_merchant)).

evidence(all_consistent(contact_length_size_159)).
query(true_val(contact_length_size_159, v114)).
query(true_val(contact_length_size_159, unk_contact_length_size_159)).

% @attr sidecut_radius_size_159
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v8_3=8.3 unk_sidecut_radius_size_159=Unknown
% @importance 0.93

0.95::acc(s1, sidecut_radius_size_159).
0.90::acc(s_merchant, sidecut_radius_size_159).

0.95::true_val(sidecut_radius_size_159, v8_3); 0.05::true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159).

measured(s1, sidecut_radius_size_159, v8_3).
measured(s_merchant, sidecut_radius_size_159, v8_3).

all_consistent(sidecut_radius_size_159) :-
    consistent(s1, sidecut_radius_size_159),
    (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_159) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_radius_size_159)).
query(true_val(sidecut_radius_size_159, v8_3)).
query(true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159)).

% @attr tip_tail_width_size_159
% @type categorical
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v29_6_29_4=29.6_29.4 unk_tip_tail_width_size_159=Unknown
% @importance 0.93

0.95::acc(s1, tip_tail_width_size_159).
0.90::acc(s_merchant, tip_tail_width_size_159).

0.95::true_val(tip_tail_width_size_159, v29_6_29_4); 0.05::true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159).

measured(s1, tip_tail_width_size_159, v29_6_29_4).
measured(s_merchant, tip_tail_width_size_159, v29_6_29_4).

all_consistent(tip_tail_width_size_159) :-
    consistent(s1, tip_tail_width_size_159),
    (indep(s_merchant), consistent(s_merchant, tip_tail_width_size_159) ; \+indep(s_merchant)).

evidence(all_consistent(tip_tail_width_size_159)).
query(true_val(tip_tail_width_size_159, v29_6_29_4)).
query(true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159)).

% @attr waist_width_159
% @type numeric
% @canonical false
% @original_name waist width 159cm
% @unit cm
% @values v25_4=25.4 unk_waist_width_159=Unknown
% @importance 0.93

0.95::acc(s1, waist_width_159).
0.90::acc(s_merchant, waist_width_159).

0.95::true_val(waist_width_159, v25_4); 0.05::true_val(waist_width_159, unk_waist_width_159).

measured(s1, waist_width_159, v25_4).
measured(s_merchant, waist_width_159, v25_4).

all_consistent(waist_width_159) :-
    consistent(s1, waist_width_159),
    (indep(s_merchant), consistent(s_merchant, waist_width_159) ; \+indep(s_merchant)).

evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v25_4)).
query(true_val(waist_width_159, unk_waist_width_159)).

% @attr stance_width_range_size_159
% @type categorical
% @canonical false
% @original_name stance_width_range_size
% @unit inches
% @values r20_25_sb1_5=20_to_25_inch_setback_1_5 unk_stance_width_range_size_159=Unknown
% @importance 0.93

0.95::acc(s1, stance_width_range_size_159).
0.90::acc(s_merchant, stance_width_range_size_159).

0.95::true_val(stance_width_range_size_159, r20_25_sb1_5); 0.05::true_val(stance_width_range_size_159, unk_stance_width_range_size_159).

measured(s1, stance_width_range_size_159, r20_25_sb1_5).
measured(s_merchant, stance_width_range_size_159, r20_25_sb1_5).

all_consistent(stance_width_range_size_159) :-
    consistent(s1, stance_width_range_size_159),
    (indep(s_merchant), consistent(s_merchant, stance_width_range_size_159) ; \+indep(s_merchant)).

evidence(all_consistent(stance_width_range_size_159)).
query(true_val(stance_width_range_size_159, r20_25_sb1_5)).
query(true_val(stance_width_range_size_159, unk_stance_width_range_size_159)).

% @attr recommended_weight_range_size_159
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values w140_plus=140_plus_lbs_60_plus_kg unk_recommended_weight_range_size_159=Unknown
% @importance 0.93

0.95::acc(s1, recommended_weight_range_size_159).
0.90::acc(s_merchant, recommended_weight_range_size_159).

0.95::true_val(recommended_weight_range_size_159, w140_plus); 0.05::true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159).

measured(s1, recommended_weight_range_size_159, w140_plus).
measured(s_merchant, recommended_weight_range_size_159, w140_plus).

all_consistent(recommended_weight_range_size_159) :-
    consistent(s1, recommended_weight_range_size_159),
    (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size_159) ; \+indep(s_merchant)).

evidence(all_consistent(recommended_weight_range_size_159)).
query(true_val(recommended_weight_range_size_159, w140_plus)).
query(true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159)).

% @attr contact_length_size_160w
% @type numeric
% @canonical false
% @original_name contact_length_size
% @unit cm
% @values v114=114.0 unk_contact_length_size_160w=Unknown
% @importance 0.93

0.95::acc(s1, contact_length_size_160w).

0.93::true_val(contact_length_size_160w, v114); 0.07::true_val(contact_length_size_160w, unk_contact_length_size_160w).

measured(s1, contact_length_size_160w, v114).

all_consistent(contact_length_size_160w) :- consistent(s1, contact_length_size_160w).

evidence(all_consistent(contact_length_size_160w)).
query(true_val(contact_length_size_160w, v114)).
query(true_val(contact_length_size_160w, unk_contact_length_size_160w)).

% @attr sidecut_radius_size_160w
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v8_3=8.3 unk_sidecut_radius_size_160w=Unknown
% @importance 0.93

0.95::acc(s1, sidecut_radius_size_160w).

0.93::true_val(sidecut_radius_size_160w, v8_3); 0.07::true_val(sidecut_radius_size_160w, unk_sidecut_radius_size_160w).

measured(s1, sidecut_radius_size_160w, v8_3).

all_consistent(sidecut_radius_size_160w) :- consistent(s1, sidecut_radius_size_160w).

evidence(all_consistent(sidecut_radius_size_160w)).
query(true_val(sidecut_radius_size_160w, v8_3)).
query(true_val(sidecut_radius_size_160w, unk_sidecut_radius_size_160w)).

% @attr tip_tail_width_size_160w
% @type categorical
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v30_8_30_6=30.8_30.6 unk_tip_tail_width_size_160w=Unknown
% @importance 0.93

0.95::acc(s1, tip_tail_width_size_160w).

0.93::true_val(tip_tail_width_size_160w, v30_8_30_6); 0.07::true_val(tip_tail_width_size_160w, unk_tip_tail_width_size_160w).

measured(s1, tip_tail_width_size_160w, v30_8_30_6).

all_consistent(tip_tail_width_size_160w) :- consistent(s1, tip_tail_width_size_160w).

evidence(all_consistent(tip_tail_width_size_160w)).
query(true_val(tip_tail_width_size_160w, v30_8_30_6)).
query(true_val(tip_tail_width_size_160w, unk_tip_tail_width_size_160w)).

% @attr waist_width_160w
% @type numeric
% @canonical false
% @original_name waist width 160W
% @unit cm
% @values v26_5=26.5 unk_waist_width_160w=Unknown
% @importance 0.93

0.95::acc(s1, waist_width_160w).

0.93::true_val(waist_width_160w, v26_5); 0.07::true_val(waist_width_160w, unk_waist_width_160w).

measured(s1, waist_width_160w, v26_5).

all_consistent(waist_width_160w) :- consistent(s1, waist_width_160w).

evidence(all_consistent(waist_width_160w)).
query(true_val(waist_width_160w, v26_5)).
query(true_val(waist_width_160w, unk_waist_width_160w)).

% @attr stance_width_range_size_160w
% @type categorical
% @canonical false
% @original_name stance_width_range_size
% @unit inches
% @values r20_25_sb1_5=20_to_25_inch_setback_1_5 unk_stance_width_range_size_160w=Unknown
% @importance 0.93

0.95::acc(s1, stance_width_range_size_160w).

0.93::true_val(stance_width_range_size_160w, r20_25_sb1_5); 0.07::true_val(stance_width_range_size_160w, unk_stance_width_range_size_160w).

measured(s1, stance_width_range_size_160w, r20_25_sb1_5).

all_consistent(stance_width_range_size_160w) :- consistent(s1, stance_width_range_size_160w).

evidence(all_consistent(stance_width_range_size_160w)).
query(true_val(stance_width_range_size_160w, r20_25_sb1_5)).
query(true_val(stance_width_range_size_160w, unk_stance_width_range_size_160w)).

% @attr recommended_weight_range_size_160w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values w145_plus=145_plus_lbs_60_plus_kg unk_recommended_weight_range_size_160w=Unknown
% @importance 0.93

0.95::acc(s1, recommended_weight_range_size_160w).

0.93::true_val(recommended_weight_range_size_160w, w145_plus); 0.07::true_val(recommended_weight_range_size_160w, unk_recommended_weight_range_size_160w).

measured(s1, recommended_weight_range_size_160w, w145_plus).

all_consistent(recommended_weight_range_size_160w) :- consistent(s1, recommended_weight_range_size_160w).

evidence(all_consistent(recommended_weight_range_size_160w)).
query(true_val(recommended_weight_range_size_160w, w145_plus)).
query(true_val(recommended_weight_range_size_160w, unk_recommended_weight_range_size_160w)).

% @attr contact_length_size_162
% @type numeric
% @canonical false
% @original_name contact_length_size
% @unit cm
% @values v116=116.0 unk_contact_length_size_162=Unknown
% @importance 0.93

0.95::acc(s1, contact_length_size_162).
0.90::acc(s_merchant, contact_length_size_162).

0.95::true_val(contact_length_size_162, v116); 0.05::true_val(contact_length_size_162, unk_contact_length_size_162).

measured(s1, contact_length_size_162, v116).
measured(s_merchant, contact_length_size_162, v116).

all_consistent(contact_length_size_162) :-
    consistent(s1, contact_length_size_162),
    (indep(s_merchant), consistent(s_merchant, contact_length_size_162) ; \+indep(s_merchant)).

evidence(all_consistent(contact_length_size_162)).
query(true_val(contact_length_size_162, v116)).
query(true_val(contact_length_size_162, unk_contact_length_size_162)).

% @attr sidecut_radius_size_162
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v8_4=8.4 unk_sidecut_radius_size_162=Unknown
% @importance 0.93

0.95::acc(s1, sidecut_radius_size_162).
0.90::acc(s_merchant, sidecut_radius_size_162).

0.95::true_val(sidecut_radius_size_162, v8_4); 0.05::true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162).

measured(s1, sidecut_radius_size_162, v8_4).
measured(s_merchant, sidecut_radius_size_162, v8_4).

all_consistent(sidecut_radius_size_162) :-
    consistent(s1, sidecut_radius_size_162),
    (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_162) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_radius_size_162)).
query(true_val(sidecut_radius_size_162, v8_4)).
query(true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162)).

% @attr tip_tail_width_size_162
% @type categorical
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v29_8_29_6=29.8_29.6 unk_tip_tail_width_size_162=Unknown
% @importance 0.93

0.95::acc(s1, tip_tail_width_size_162).
0.90::acc(s_merchant, tip_tail_width_size_162).

0.95::true_val(tip_tail_width_size_162, v29_8_29_6); 0.05::true_val(tip_tail_width_size_162, unk_tip_tail_width_size_162).

measured(s1, tip_tail_width_size_162, v29_8_29_6).
measured(s_merchant, tip_tail_width_size_162, v29_8_29_6).

all_consistent(tip_tail_width_size_162) :-
    consistent(s1, tip_tail_width_size_162),
    (indep(s_merchant), consistent(s_merchant, tip_tail_width_size_162) ; \+indep(s_merchant)).

evidence(all_consistent(tip_tail_width_size_162)).
query(true_val(tip_tail_width_size_162, v29_8_29_6)).
query(true_val(tip_tail_width_size_162, unk_tip_tail_width_size_162)).

% @attr waist_width_162
% @type numeric
% @canonical false
% @original_name waist width 162cm
% @unit cm
% @values v25_5=25.5 unk_waist_width_162=Unknown
% @importance 0.93

0.95::acc(s1, waist_width_162).
0.90::acc(s_merchant, waist_width_162).

0.95::true_val(waist_width_162, v25_5); 0.05::true_val(waist_width_162, unk_waist_width_162).

measured(s1, waist_width_162, v25_5).
measured(s_merchant, waist_width_162, v25_5).

all_consistent(waist_width_162) :-
    consistent(s1, waist_width_162),
    (indep(s_merchant), consistent(s_merchant, waist_width_162) ; \+indep(s_merchant)).

evidence(all_consistent(waist_width_162)).
query(true_val(waist_width_162, v25_5)).
query(true_val(waist_width_162, unk_waist_width_162)).

% @attr stance_width_range_size_162
% @type categorical
% @canonical false
% @original_name stance_width_range_size
% @unit inches
% @values r20_25_sb1_5=20_to_25_inch_setback_1_5 unk_stance_width_range_size_162=Unknown
% @importance 0.93

0.95::acc(s1, stance_width_range_size_162).
0.90::acc(s_merchant, stance_width_range_size_162).

0.95::true_val(stance_width_range_size_162, r20_25_sb1_5); 0.05::true_val(stance_width_range_size_162, unk_stance_width_range_size_162).

measured(s1, stance_width_range_size_162, r20_25_sb1_5).
measured(s_merchant, stance_width_range_size_162, r20_25_sb1_5).

all_consistent(stance_width_range_size_162) :-
    consistent(s1, stance_width_range_size_162),
    (indep(s_merchant), consistent(s_merchant, stance_width_range_size_162) ; \+indep(s_merchant)).

evidence(all_consistent(stance_width_range_size_162)).
query(true_val(stance_width_range_size_162, r20_25_sb1_5)).
query(true_val(stance_width_range_size_162, unk_stance_width_range_size_162)).

% @attr recommended_weight_range_size_162
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values w150_plus=150_plus_lbs_65_plus_kg unk_recommended_weight_range_size_162=Unknown
% @importance 0.93

0.95::acc(s1, recommended_weight_range_size_162).
0.90::acc(s_merchant, recommended_weight_range_size_162).

0.95::true_val(recommended_weight_range_size_162, w150_plus); 0.05::true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162).

measured(s1, recommended_weight_range_size_162, w150_plus).
measured(s_merchant, recommended_weight_range_size_162, w150_plus).

all_consistent(recommended_weight_range_size_162) :-
    consistent(s1, recommended_weight_range_size_162),
    (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size_162) ; \+indep(s_merchant)).

evidence(all_consistent(recommended_weight_range_size_162)).
query(true_val(recommended_weight_range_size_162, w150_plus)).
query(true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162)).

% @attr contact_length_size_163w
% @type numeric
% @canonical false
% @original_name contact_length_size
% @unit cm
% @values v116=116.0 unk_contact_length_size_163w=Unknown
% @importance 0.93

0.95::acc(s1, contact_length_size_163w).
0.90::acc(s_merchant, contact_length_size_163w).

0.95::true_val(contact_length_size_163w, v116); 0.05::true_val(contact_length_size_163w, unk_contact_length_size_163w).

measured(s1, contact_length_size_163w, v116).
measured(s_merchant, contact_length_size_163w, v116).

all_consistent(contact_length_size_163w) :-
    consistent(s1, contact_length_size_163w),
    (indep(s_merchant), consistent(s_merchant, contact_length_size_163w) ; \+indep(s_merchant)).

evidence(all_consistent(contact_length_size_163w)).
query(true_val(contact_length_size_163w, v116)).
query(true_val(contact_length_size_163w, unk_contact_length_size_163w)).

% @attr sidecut_radius_size_163w
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v8_3=8.3 unk_sidecut_radius_size_163w=Unknown
% @importance 0.93

0.95::acc(s1, sidecut_radius_size_163w).
0.90::acc(s_merchant, sidecut_radius_size_163w).

0.95::true_val(sidecut_radius_size_163w, v8_3); 0.05::true_val(sidecut_radius_size_163w, unk_sidecut_radius_size_163w).

measured(s1, sidecut_radius_size_163w, v8_3).
measured(s_merchant, sidecut_radius_size_163w, v8_3).

all_consistent(sidecut_radius_size_163w) :-
    consistent(s1, sidecut_radius_size_163w),
    (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_163w) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_radius_size_163w)).
query(true_val(sidecut_radius_size_163w, v8_3)).
query(true_val(sidecut_radius_size_163w, unk_sidecut_radius_size_163w)).

% @attr tip_tail_width_size_163w
% @type categorical
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v31_2_31_0=31.2_31.0 unk_tip_tail_width_size_163w=Unknown
% @importance 0.93

0.95::acc(s1, tip_tail_width_size_163w).
0.90::acc(s_merchant, tip_tail_width_size_163w).

0.95::true_val(tip_tail_width_size_163w, v31_2_31_0); 0.05::true_val(tip_tail_width_size_163w, unk_tip_tail_width_size_163w).

measured(s1, tip_tail_width_size_163w, v31_2_31_0).
measured(s_merchant, tip_tail_width_size_163w, v31_2_31_0).

all_consistent(tip_tail_width_size_163w) :-
    consistent(s1, tip_tail_width_size_163w),
    (indep(s_merchant), consistent(s_merchant, tip_tail_width_size_163w) ; \+indep(s_merchant)).

evidence(all_consistent(tip_tail_width_size_163w)).
query(true_val(tip_tail_width_size_163w, v31_2_31_0)).
query(true_val(tip_tail_width_size_163w, unk_tip_tail_width_size_163w)).

% @attr waist_width_163w
% @type numeric
% @canonical false
% @original_name waist width 163W
% @unit cm
% @values v26_8=26.8 unk_waist_width_163w=Unknown
% @importance 0.93

0.95::acc(s1, waist_width_163w).
0.90::acc(s_merchant, waist_width_163w).

0.95::true_val(waist_width_163w, v26_8); 0.05::true_val(waist_width_163w, unk_waist_width_163w).

measured(s1, waist_width_163w, v26_8).
measured(s_merchant, waist_width_163w, v26_8).

all_consistent(waist_width_163w) :-
    consistent(s1, waist_width_163w),
    (indep(s_merchant), consistent(s_merchant, waist_width_163w) ; \+indep(s_merchant)).

evidence(all_consistent(waist_width_163w)).
query(true_val(waist_width_163w, v26_8)).
query(true_val(waist_width_163w, unk_waist_width_163w)).

% @attr stance_width_range_size_163w
% @type categorical
% @canonical false
% @original_name stance_width_range_size
% @unit inches
% @values r20_25_sb1_5=20_to_25_inch_setback_1_5 unk_stance_width_range_size_163w=Unknown
% @importance 0.93

0.95::acc(s1, stance_width_range_size_163w).
0.90::acc(s_merchant, stance_width_range_size_163w).

0.95::true_val(stance_width_range_size_163w, r20_25_sb1_5); 0.05::true_val(stance_width_range_size_163w, unk_stance_width_range_size_163w).

measured(s1, stance_width_range_size_163w, r20_25_sb1_5).
measured(s_merchant, stance_width_range_size_163w, r20_25_sb1_5).

all_consistent(stance_width_range_size_163w) :-
    consistent(s1, stance_width_range_size_163w),
    (indep(s_merchant), consistent(s_merchant, stance_width_range_size_163w) ; \+indep(s_merchant)).

evidence(all_consistent(stance_width_range_size_163w)).
query(true_val(stance_width_range_size_163w, r20_25_sb1_5)).
query(true_val(stance_width_range_size_163w, unk_stance_width_range_size_163w)).

% @attr recommended_weight_range_size_163w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values w150_plus=150_plus_lbs_65_plus_kg unk_recommended_weight_range_size_163w=Unknown
% @importance 0.93

0.95::acc(s1, recommended_weight_range_size_163w).
0.90::acc(s_merchant, recommended_weight_range_size_163w).

0.95::true_val(recommended_weight_range_size_163w, w150_plus); 0.05::true_val(recommended_weight_range_size_163w, unk_recommended_weight_range_size_163w).

measured(s1, recommended_weight_range_size_163w, w150_plus).
measured(s_merchant, recommended_weight_range_size_163w, w150_plus).

all_consistent(recommended_weight_range_size_163w) :-
    consistent(s1, recommended_weight_range_size_163w),
    (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size_163w) ; \+indep(s_merchant)).

evidence(all_consistent(recommended_weight_range_size_163w)).
query(true_val(recommended_weight_range_size_163w, w150_plus)).
query(true_val(recommended_weight_range_size_163w, unk_recommended_weight_range_size_163w)).

% @attr board_weight_grams
% @type numeric
% @canonical true
% @original_name board_weight_grams
% @unit grams
% @values v2960=2960.0 v3140=3140.0
% @importance 0.83

0.92::acc(s9, board_weight_grams).
0.85::acc(s10, board_weight_grams).

0.60::true_val(board_weight_grams, v2960); 0.40::true_val(board_weight_grams, v3140).

measured(s9, board_weight_grams, v2960).
measured(s10, board_weight_grams, v3140).

all_consistent(board_weight_grams) :-
    consistent(s9, board_weight_grams),
    (indep(s10), consistent(s10, board_weight_grams) ; \+indep(s10)).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v2960)).
query(true_val(board_weight_grams, v3140)).

% @attr weight_per_cm
% @type numeric
% @canonical true
% @original_name weight_per_cm
% @unit grams_per_cm
% @values v18_62=18.62 v19_75=19.75
% @importance 0.83

0.92::acc(s9, weight_per_cm).
0.85::acc(s10, weight_per_cm).

0.60::true_val(weight_per_cm, v18_62); 0.40::true_val(weight_per_cm, v19_75).

measured(s9, weight_per_cm, v18_62).
measured(s10, weight_per_cm, v19_75).

all_consistent(weight_per_cm) :-
    consistent(s9, weight_per_cm),
    (indep(s10), consistent(s10, weight_per_cm) ; \+indep(s10)).

evidence(all_consistent(weight_per_cm)).
query(true_val(weight_per_cm, v18_62)).
query(true_val(weight_per_cm, v19_75)).

% @attr reviewer_opinion_the_good_ride_weight
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values not_heavy_not_ultralight=Far_from_heavy_but_no_ultralight_either unk_reviewer_opinion_the_good_ride_weight=Unknown
% @importance 0.88

0.85::acc(s6, reviewer_opinion_the_good_ride_weight).

0.72::true_val(reviewer_opinion_the_good_ride_weight, not_heavy_not_ultralight); 0.28::true_val(reviewer_opinion_the_good_ride_weight, unk_reviewer_opinion_the_good_ride_weight).

measured(s6, reviewer_opinion_the_good_ride_weight, not_heavy_not_ultralight).

all_consistent(reviewer_opinion_the_good_ride_weight) :- (indep(s6), consistent(s6, reviewer_opinion_the_good_ride_weight) ; \+indep(s6)).

evidence(all_consistent(reviewer_opinion_the_good_ride_weight)).
query(true_val(reviewer_opinion_the_good_ride_weight, not_heavy_not_ultralight)).
query(true_val(reviewer_opinion_the_good_ride_weight, unk_reviewer_opinion_the_good_ride_weight)).

% @attr reviewer_opinion_whitelines_weight
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values not_lightest=Not_the_lightest_board_on_market unk_reviewer_opinion_whitelines_weight=Unknown
% @importance 0.70

0.82::acc(s14, reviewer_opinion_whitelines_weight).

0.72::true_val(reviewer_opinion_whitelines_weight, not_lightest); 0.28::true_val(reviewer_opinion_whitelines_weight, unk_reviewer_opinion_whitelines_weight).

measured(s14, reviewer_opinion_whitelines_weight, not_lightest).

all_consistent(reviewer_opinion_whitelines_weight) :- consistent(s14, reviewer_opinion_whitelines_weight).

evidence(all_consistent(reviewer_opinion_whitelines_weight)).
query(true_val(reviewer_opinion_whitelines_weight, not_lightest)).
query(true_val(reviewer_opinion_whitelines_weight, unk_reviewer_opinion_whitelines_weight)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v629_99=629.99 unk_price_usd_msrp=Unknown
% @importance 0.93

0.97::acc(s1, price_usd_msrp).

0.95::true_val(price_usd_msrp, v629_99); 0.05::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s1, price_usd_msrp, v629_99).

all_consistent(price_usd_msrp) :- consistent(s1, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v629_99)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr sale_price_gnu
% @type numeric
% @canonical false
% @original_name sale price at GNU.com
% @unit USD
% @values v440_99=440.99 unk_sale_price_gnu=Unknown
% @importance 1.0

0.97::acc(s1, sale_price_gnu).

0.95::true_val(sale_price_gnu, v440_99); 0.05::true_val(sale_price_gnu, unk_sale_price_gnu).

measured(s1, sale_price_gnu, v440_99).

all_consistent(sale_price_gnu) :- consistent(s1, sale_price_gnu).

evidence(all_consistent(sale_price_gnu)).
query(true_val(sale_price_gnu, v440_99)).
query(true_val(sale_price_gnu, unk_sale_price_gnu)).

% @attr price_usd_evo
% @type numeric
% @canonical true
% @original_name price_usd_evo
% @unit USD
% @values v440_99=440.99 unk_price_usd_evo=Unknown
% @importance 0.88

0.92::acc(s5, price_usd_evo).

0.95::true_val(price_usd_evo, v440_99); 0.05::true_val(price_usd_evo, unk_price_usd_evo).

measured(s5, price_usd_evo, v440_99).

all_consistent(price_usd_evo) :- consistent(s5, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v440_99)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_rei
% @type numeric
% @canonical true
% @original_name price_usd_rei
% @unit USD
% @values v440_83=440.83 unk_price_usd_rei=Unknown
% @importance 0.88

0.92::acc(s5, price_usd_rei).

0.72::true_val(price_usd_rei, v440_83); 0.28::true_val(price_usd_rei, unk_price_usd_rei).

measured(s5, price_usd_rei, v440_83).

all_consistent(price_usd_rei) :- consistent(s5, price_usd_rei).

evidence(all_consistent(price_usd_rei)).
query(true_val(price_usd_rei, v440_83)).
query(true_val(price_usd_rei, unk_price_usd_rei)).

% @attr price_usd_tactics
% @type numeric
% @canonical true
% @original_name price_usd_tactics
% @unit USD
% @values v440_99=440.99 unk_price_usd_tactics=Unknown
% @importance 0.88

0.88::acc(s5, price_usd_tactics).

0.72::true_val(price_usd_tactics, v440_99); 0.28::true_val(price_usd_tactics, unk_price_usd_tactics).

measured(s5, price_usd_tactics, v440_99).

all_consistent(price_usd_tactics) :- consistent(s5, price_usd_tactics).

evidence(all_consistent(price_usd_tactics)).
query(true_val(price_usd_tactics, v440_99)).
query(true_val(price_usd_tactics, unk_price_usd_tactics)).

% @attr price_blauer_board_shop
% @type numeric
% @canonical false
% @original_name price at Blauer Board Shop
% @unit USD
% @values v440_99=440.99 unk_price_blauer_board_shop=Unknown
% @importance 0.90

0.88::acc(s5, price_blauer_board_shop).

0.72::true_val(price_blauer_board_shop, v440_99); 0.28::true_val(price_blauer_board_shop, unk_price_blauer_board_shop).

measured(s5, price_blauer_board_shop, v440_99).

all_consistent(price_blauer_board_shop) :- consistent(s5, price_blauer_board_shop).

evidence(all_consistent(price_blauer_board_shop)).
query(true_val(price_blauer_board_shop, v440_99)).
query(true_val(price_blauer_board_shop, unk_price_blauer_board_shop)).

% @attr price_christy_sports
% @type numeric
% @canonical false
% @original_name price at Christy Sports
% @unit USD
% @values v441_97=441.97 unk_price_christy_sports=Unknown
% @importance 0.90

0.88::acc(s5, price_christy_sports).

0.72::true_val(price_christy_sports, v441_97); 0.28::true_val(price_christy_sports, unk_price_christy_sports).

measured(s5, price_christy_sports, v441_97).

all_consistent(price_christy_sports) :- consistent(s5, price_christy_sports).

evidence(all_consistent(price_christy_sports)).
query(true_val(price_christy_sports, v441_97)).
query(true_val(price_christy_sports, unk_price_christy_sports)).

% @attr price_usd_backcountry
% @type numeric
% @canonical true
% @original_name price_usd_backcountry
% @unit USD
% @values v503_99=503.99 unk_price_usd_backcountry=Unknown
% @importance 0.88

0.88::acc(s5, price_usd_backcountry).

0.72::true_val(price_usd_backcountry, v503_99); 0.28::true_val(price_usd_backcountry, unk_price_usd_backcountry).

measured(s5, price_usd_backcountry, v503_99).

all_consistent(price_usd_backcountry) :- consistent(s5, price_usd_backcountry).

evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v503_99)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

% @attr price_the_house
% @type numeric
% @canonical false
% @original_name price at The House
% @unit USD
% @values v440_99=440.99 unk_price_the_house=Unknown
% @importance 0.85

0.85::acc(s6, price_the_house).

0.72::true_val(price_the_house, v440_99); 0.28::true_val(price_the_house, unk_price_the_house).

measured(s6, price_the_house, v440_99).

all_consistent(price_the_house) :- (indep(s6), consistent(s6, price_the_house) ; \+indep(s6)).

evidence(all_consistent(price_the_house)).
query(true_val(price_the_house, v440_99)).
query(true_val(price_the_house, unk_price_the_house)).

% @attr price_eur_blue_tomato
% @type numeric
% @canonical true
% @original_name price_eur_blue_tomato
% @unit EUR
% @values v639_99=639.99 unk_price_eur_blue_tomato=Unknown
% @importance 0.70

0.95::acc(s24, price_eur_blue_tomato).

0.87::true_val(price_eur_blue_tomato, v639_99); 0.13::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).

measured(s24, price_eur_blue_tomato, v639_99).

all_consistent(price_eur_blue_tomato) :- (indep(s24), consistent(s24, price_eur_blue_tomato) ; \+indep(s24)).

evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v639_99)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

% @attr price_eur_blue_tomato_sale
% @type numeric
% @canonical false
% @original_name price_eur_blue_tomato
% @unit EUR
% @values v579=579.0 unk_price_eur_blue_tomato_sale=Unknown
% @importance 0.90

0.88::acc(s5, price_eur_blue_tomato_sale).

0.72::true_val(price_eur_blue_tomato_sale, v579); 0.28::true_val(price_eur_blue_tomato_sale, unk_price_eur_blue_tomato_sale).

measured(s5, price_eur_blue_tomato_sale, v579).

all_consistent(price_eur_blue_tomato_sale) :- consistent(s5, price_eur_blue_tomato_sale).

evidence(all_consistent(price_eur_blue_tomato_sale)).
query(true_val(price_eur_blue_tomato_sale, v579)).
query(true_val(price_eur_blue_tomato_sale, unk_price_eur_blue_tomato_sale)).

% @attr price_cad_prfo
% @type numeric
% @canonical false
% @original_name price_cad_prfo
% @unit CAD
% @values v671_99=671.99 unk_price_cad_prfo=Unknown
% @importance 0.90

0.88::acc(s5, price_cad_prfo).

0.72::true_val(price_cad_prfo, v671_99); 0.28::true_val(price_cad_prfo, unk_price_cad_prfo).

measured(s5, price_cad_prfo, v671_99).

all_consistent(price_cad_prfo) :- consistent(s5, price_cad_prfo).

evidence(all_consistent(price_cad_prfo)).
query(true_val(price_cad_prfo, v671_99)).
query(true_val(price_cad_prfo, unk_price_cad_prfo)).

% @attr price_aud_merchant
% @type numeric
% @canonical false
% @original_name price_aud_merchant
% @unit AUD
% @values v1049_99=1049.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.95::acc(s_merchant, price_aud_merchant).

0.95::true_val(price_aud_merchant, v1049_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s_merchant, price_aud_merchant, v1049_99).

all_consistent(price_aud_merchant) :- (indep(s_merchant), consistent(s_merchant, price_aud_merchant) ; \+indep(s_merchant)).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v1049_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_usd_msrp_historical
% @type categorical
% @canonical false
% @original_name price_usd_msrp
% @unit USD
% @values v599_2022_v629_2024=599_2022_model_629_2024_model unk_price_usd_msrp_historical=Unknown
% @importance 0.90

0.88::acc(s9, price_usd_msrp_historical).

0.76::true_val(price_usd_msrp_historical, v599_2022_v629_2024); 0.24::true_val(price_usd_msrp_historical, unk_price_usd_msrp_historical).

measured(s9, price_usd_msrp_historical, v599_2022_v629_2024).

all_consistent(price_usd_msrp_historical) :- consistent(s9, price_usd_msrp_historical).

evidence(all_consistent(price_usd_msrp_historical)).
query(true_val(price_usd_msrp_historical, v599_2022_v629_2024)).
query(true_val(price_usd_msrp_historical, unk_price_usd_msrp_historical)).

% @attr price_perception
% @type categorical
% @canonical false
% @original_name price perception (The Inertia)
% @values solid_value=Not_inexpensive_but_loaded_with_premium_tech_solid_value unk_price_perception=Unknown
% @importance 0.85

0.82::acc(s11, price_perception).

0.69::true_val(price_perception, solid_value); 0.31::true_val(price_perception, unk_price_perception).

measured(s11, price_perception, solid_value).

all_consistent(price_perception) :- consistent(s11, price_perception).

evidence(all_consistent(price_perception)).
query(true_val(price_perception, solid_value)).
query(true_val(price_perception, unk_price_perception)).

% @attr avg_price_comparable_freeride
% @type numeric
% @canonical false
% @original_name average price of comparable freeride boards
% @unit USD
% @values v689=689.0 unk_avg_price_comparable_freeride=Unknown
% @importance 0.90

0.90::acc(s9, avg_price_comparable_freeride).

0.76::true_val(avg_price_comparable_freeride, v689); 0.24::true_val(avg_price_comparable_freeride, unk_avg_price_comparable_freeride).

measured(s9, avg_price_comparable_freeride, v689).

all_consistent(avg_price_comparable_freeride) :- consistent(s9, avg_price_comparable_freeride).

evidence(all_consistent(avg_price_comparable_freeride)).
query(true_val(avg_price_comparable_freeride, v689)).
query(true_val(avg_price_comparable_freeride, unk_avg_price_comparable_freeride)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values widely_available=Widely_available_on_sale limited_stock=Limited_closeout sold_out_some=Sold_out_at_some_retailers
% @importance 0.60

0.92::acc(s1, availability_status).
0.85::acc(s4, availability_status).
0.85::acc(s8, availability_status).
0.80::acc(s7, availability_status).
0.85::acc(s5, availability_status).
0.75::acc(s2, availability_status).
0.60::acc(s26, availability_status).
0.65::acc(s25, availability_status).
0.55::acc(s27, availability_status).

0.82::true_val(availability_status, widely_available); 0.08::true_val(availability_status, limited_stock); 0.10::true_val(availability_status, sold_out_some).

measured(s1, availability_status, widely_available).
measured(s4, availability_status, widely_available).
measured(s8, availability_status, widely_available).
measured(s7, availability_status, widely_available).
measured(s5, availability_status, widely_available).
measured(s2, availability_status, widely_available).
measured(s27, availability_status, widely_available).
measured(s26, availability_status, limited_stock).
measured(s25, availability_status, sold_out_some).

all_consistent(availability_status) :-
    consistent(s1, availability_status),
    (indep(s4), consistent(s4, availability_status) ; \+indep(s4)),
    (indep(s8), consistent(s8, availability_status) ; \+indep(s8)),
    (indep(s7), consistent(s7, availability_status) ; \+indep(s7)),
    consistent(s5, availability_status),
    (indep(s2), consistent(s2, availability_status) ; \+indep(s2)),
    consistent(s27, availability_status),
    (indep(s26), consistent(s26, availability_status) ; \+indep(s26)),
    (indep(s25), consistent(s25, availability_status) ; \+indep(s25)).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, widely_available)).
query(true_val(availability_status, limited_stock)).
query(true_val(availability_status, sold_out_some)).

% @attr overall_rating_snowboardingprofiles
% @type numeric
% @canonical true
% @original_name overall_rating_snowboardingprofiles
% @unit /100
% @values v87_5=87.5 v85_9=85.9
% @importance 0.90

0.92::acc(s9, overall_rating_snowboardingprofiles).
0.85::acc(s10, overall_rating_snowboardingprofiles).

0.60::true_val(overall_rating_snowboardingprofiles, v87_5); 0.40::true_val(overall_rating_snowboardingprofiles, v85_9).

measured(s9, overall_rating_snowboardingprofiles, v87_5).
measured(s10, overall_rating_snowboardingprofiles, v85_9).

all_consistent(overall_rating_snowboardingprofiles) :-
    consistent(s9, overall_rating_snowboardingprofiles),
    (indep(s10), consistent(s10, overall_rating_snowboardingprofiles) ; \+indep(s10)).

evidence(all_consistent(overall_rating_snowboardingprofiles)).
query(true_val(overall_rating_snowboardingprofiles, v87_5)).
query(true_val(overall_rating_snowboardingprofiles, v85_9)).

% @attr overall_rating_snowboardingprofiles_rank
% @type categorical
% @canonical false
% @original_name overall_rating_snowboardingprofiles
% @values rank_7_of_27=Ranked_7th_out_of_27_freeride_boards unk_overall_rating_snowboardingprofiles_rank=Unknown
% @importance 0.85

0.88::acc(s9, overall_rating_snowboardingprofiles_rank).
0.82::acc(s23, overall_rating_snowboardingprofiles_rank).

0.95::true_val(overall_rating_snowboardingprofiles_rank, rank_7_of_27); 0.05::true_val(overall_rating_snowboardingprofiles_rank, unk_overall_rating_snowboardingprofiles_rank).

measured(s9, overall_rating_snowboardingprofiles_rank, rank_7_of_27).
measured(s23, overall_rating_snowboardingprofiles_rank, rank_7_of_27).

all_consistent(overall_rating_snowboardingprofiles_rank) :-
    consistent(s9, overall_rating_snowboardingprofiles_rank),
    (indep(s23), consistent(s23, overall_rating_snowboardingprofiles_rank) ; \+indep(s23)).

evidence(all_consistent(overall_rating_snowboardingprofiles_rank)).
query(true_val(overall_rating_snowboardingprofiles_rank, rank_7_of_27)).
query(true_val(overall_rating_snowboardingprofiles_rank, unk_overall_rating_snowboardingprofiles_rank)).

% @attr review_rating_gnu_users
% @type numeric
% @canonical false
% @original_name review rating (GNU.com user reviews)
% @unit percent
% @values v99_pct_28_reviews=99_percent_of_100_from_28_reviews unk_review_rating_gnu_users=Unknown
% @importance 1.0

0.90::acc(s1, review_rating_gnu_users).

0.93::true_val(review_rating_gnu_users, v99_pct_28_reviews); 0.07::true_val(review_rating_gnu_users, unk_review_rating_gnu_users).

measured(s1, review_rating_gnu_users, v99_pct_28_reviews).

all_consistent(review_rating_gnu_users) :- consistent(s1, review_rating_gnu_users).

evidence(all_consistent(review_rating_gnu_users)).
query(true_val(review_rating_gnu_users, v99_pct_28_reviews)).
query(true_val(review_rating_gnu_users, unk_review_rating_gnu_users)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values whitelines_100_two_years=Selected_Whitelines_100_two_years_running unk_reviewer_opinion_whitelines=Unknown
% @importance 0.65

0.88::acc(s13, reviewer_opinion_whitelines).
0.85::acc(s14, reviewer_opinion_whitelines).

0.95::true_val(reviewer_opinion_whitelines, whitelines_100_two_years); 0.05::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

measured(s13, reviewer_opinion_whitelines, whitelines_100_two_years).
measured(s14, reviewer_opinion_whitelines, whitelines_100_two_years).

all_consistent(reviewer_opinion_whitelines) :-
    consistent(s13, reviewer_opinion_whitelines),
    consistent(s14, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, whitelines_100_two_years)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values poppy_carves_grip_fun=Very_Poppy_Carves_Super_Well_Excellent_Grip_Good_All_Conditions unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.90

0.88::acc(s5, reviewer_opinion_the_good_ride).

0.72::true_val(reviewer_opinion_the_good_ride, poppy_carves_grip_fun); 0.28::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s5, reviewer_opinion_the_good_ride, poppy_carves_grip_fun).

all_consistent(reviewer_opinion_the_good_ride) :- consistent(s5, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, poppy_carves_grip_fun)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr review_verdict_the_inertia
% @type categorical
% @canonical false
% @original_name review verdict (The Inertia)
% @values one_of_best_quiver_killer=One_of_the_best_this_year_quiver_killer_for_aggressive_riders unk_review_verdict_the_inertia=Unknown
% @importance 0.85

0.82::acc(s11, review_verdict_the_inertia).

0.69::true_val(review_verdict_the_inertia, one_of_best_quiver_killer); 0.31::true_val(review_verdict_the_inertia, unk_review_verdict_the_inertia).

measured(s11, review_verdict_the_inertia, one_of_best_quiver_killer).

all_consistent(review_verdict_the_inertia) :- consistent(s11, review_verdict_the_inertia).

evidence(all_consistent(review_verdict_the_inertia)).
query(true_val(review_verdict_the_inertia, one_of_best_quiver_killer)).
query(true_val(review_verdict_the_inertia, unk_review_verdict_the_inertia)).

% @attr carving_rating_tgr
% @type categorical
% @canonical true
% @original_name carving_rating_tgr
% @values great=Great unk_carving_rating_tgr=Unknown
% @importance 0.90

0.88::acc(s5, carving_rating_tgr).

0.72::true_val(carving_rating_tgr, great); 0.28::true_val(carving_rating_tgr, unk_carving_rating_tgr).

measured(s5, carving_rating_tgr, great).

all_consistent(carving_rating_tgr) :- consistent(s5, carving_rating_tgr).

evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, great)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

% @attr speed_rating_tgr
% @type categorical
% @canonical true
% @original_name speed_rating_tgr
% @values great=Great unk_speed_rating_tgr=Unknown
% @importance 0.90

0.88::acc(s5, speed_rating_tgr).

0.72::true_val(speed_rating_tgr, great); 0.28::true_val(speed_rating_tgr, unk_speed_rating_tgr).

measured(s5, speed_rating_tgr, great).

all_consistent(speed_rating_tgr) :- consistent(s5, speed_rating_tgr).

evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, great)).
query(true_val(speed_rating_tgr, unk_speed_rating_tgr)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values excellent_hard_icy=Grips_like_champ_excellent_on_hard_to_icy_snow unk_edge_hold=Unknown
% @importance 0.90

0.88::acc(s6, edge_hold).
0.88::acc(s9, edge_hold).

0.95::true_val(edge_hold, excellent_hard_icy); 0.05::true_val(edge_hold, unk_edge_hold).

measured(s6, edge_hold, excellent_hard_icy).
measured(s9, edge_hold, excellent_hard_icy).

all_consistent(edge_hold) :-
    (indep(s6), consistent(s6, edge_hold) ; \+indep(s6)),
    consistent(s9, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, excellent_hard_icy)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr powder_rating_tgr
% @type categorical
% @canonical true
% @original_name powder_rating_tgr
% @values average=Average unk_powder_rating_tgr=Unknown
% @importance 0.90

0.88::acc(s5, powder_rating_tgr).

0.72::true_val(powder_rating_tgr, average); 0.28::true_val(powder_rating_tgr, unk_powder_rating_tgr).

measured(s5, powder_rating_tgr, average).

all_consistent(powder_rating_tgr) :- consistent(s5, powder_rating_tgr).

evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, average)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

% @attr chatter_performance
% @type categorical
% @canonical true
% @original_name chatter_performance
% @values good_stable_predictable=Good_stays_stable_predictable_without_being_bucky unk_chatter_performance=Unknown
% @importance 0.85

0.85::acc(s6, chatter_performance).

0.72::true_val(chatter_performance, good_stable_predictable); 0.28::true_val(chatter_performance, unk_chatter_performance).

measured(s6, chatter_performance, good_stable_predictable).

all_consistent(chatter_performance) :- (indep(s6), consistent(s6, chatter_performance) ; \+indep(s6)).

evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, good_stable_predictable)).
query(true_val(chatter_performance, unk_chatter_performance)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values good_centered_sidecut=Good_can_land_and_ride_switch_well_centered_on_sidecut unk_switch_riding=Unknown
% @importance 0.90

0.85::acc(s5, switch_riding).

0.72::true_val(switch_riding, good_centered_sidecut); 0.28::true_val(switch_riding, unk_switch_riding).

measured(s5, switch_riding, good_centered_sidecut).

all_consistent(switch_riding) :- consistent(s5, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, good_centered_sidecut)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr jumps_rating_tgr
% @type categorical
% @canonical true
% @original_name jumps_rating_tgr
% @values great=Great unk_jumps_rating_tgr=Unknown
% @importance 0.90

0.88::acc(s5, jumps_rating_tgr).

0.72::true_val(jumps_rating_tgr, great); 0.28::true_val(jumps_rating_tgr, unk_jumps_rating_tgr).

measured(s5, jumps_rating_tgr, great).

all_consistent(jumps_rating_tgr) :- consistent(s5, jumps_rating_tgr).

evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, great)).
query(true_val(jumps_rating_tgr, unk_jumps_rating_tgr)).

% @attr jibbing_rating_tgr
% @type categorical
% @canonical true
% @original_name jibbing_rating_tgr
% @values average=Average unk_jibbing_rating_tgr=Unknown
% @importance 0.90

0.88::acc(s5, jibbing_rating_tgr).

0.72::true_val(jibbing_rating_tgr, average); 0.28::true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr).

measured(s5, jibbing_rating_tgr, average).

all_consistent(jibbing_rating_tgr) :- consistent(s5, jibbing_rating_tgr).

evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, average)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr)).

% @attr pipe_rating_tgr
% @type categorical
% @canonical true
% @original_name pipe_rating_tgr
% @values great=Great unk_pipe_rating_tgr=Unknown
% @importance 0.90

0.88::acc(s5, pipe_rating_tgr).

0.72::true_val(pipe_rating_tgr, great); 0.28::true_val(pipe_rating_tgr, unk_pipe_rating_tgr).

measured(s5, pipe_rating_tgr, great).

all_consistent(pipe_rating_tgr) :- consistent(s5, pipe_rating_tgr).

evidence(all_consistent(pipe_rating_tgr)).
query(true_val(pipe_rating_tgr, great)).
query(true_val(pipe_rating_tgr, unk_pipe_rating_tgr)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values average_when_waxed=Average_not_exceptional_but_pretty_good_when_waxed unk_base_glide_performance=Unknown
% @importance 0.90

0.85::acc(s5, base_glide_performance).

0.72::true_val(base_glide_performance, average_when_waxed); 0.28::true_val(base_glide_performance, unk_base_glide_performance).

measured(s5, base_glide_performance, average_when_waxed).

all_consistent(base_glide_performance) :- consistent(s5, base_glide_performance).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, average_when_waxed)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr on_snow_feel_tgr
% @type categorical
% @canonical true
% @original_name on_snow_feel_tgr
% @values semi_locked_in=Semi_Locked_In unk_on_snow_feel_tgr=Unknown
% @importance 0.90

0.85::acc(s5, on_snow_feel_tgr).

0.72::true_val(on_snow_feel_tgr, semi_locked_in); 0.28::true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr).

measured(s5, on_snow_feel_tgr, semi_locked_in).

all_consistent(on_snow_feel_tgr) :- consistent(s5, on_snow_feel_tgr).

evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, semi_locked_in)).
query(true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values fast=Fast unk_turn_initiation_performance=Unknown
% @importance 0.90

0.85::acc(s5, turn_initiation_performance).

0.72::true_val(turn_initiation_performance, fast); 0.28::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s5, turn_initiation_performance, fast).

all_consistent(turn_initiation_performance) :- consistent(s5, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, fast)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr reviewer_opinion_the_good_ride_boot_flex
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values semi_hard=Semi_Hard unk_reviewer_opinion_the_good_ride_boot_flex=Unknown
% @importance 0.90

0.85::acc(s5, reviewer_opinion_the_good_ride_boot_flex).

0.72::true_val(reviewer_opinion_the_good_ride_boot_flex, semi_hard); 0.28::true_val(reviewer_opinion_the_good_ride_boot_flex, unk_reviewer_opinion_the_good_ride_boot_flex).

measured(s5, reviewer_opinion_the_good_ride_boot_flex, semi_hard).

all_consistent(reviewer_opinion_the_good_ride_boot_flex) :- consistent(s5, reviewer_opinion_the_good_ride_boot_flex).

evidence(all_consistent(reviewer_opinion_the_good_ride_boot_flex)).
query(true_val(reviewer_opinion_the_good_ride_boot_flex, semi_hard)).
query(true_val(reviewer_opinion_the_good_ride_boot_flex, unk_reviewer_opinion_the_good_ride_boot_flex)).

% @attr pop
% @type categorical
% @canonical false
% @original_name pop
% @values upper_tier=Upper_tier_not_unreal_but_very_good unk_pop=Unknown
% @importance 0.88

0.85::acc(s6, pop).

0.72::true_val(pop, upper_tier); 0.28::true_val(pop, unk_pop).

measured(s6, pop, upper_tier).

all_consistent(pop) :- (indep(s6), consistent(s6, pop) ; \+indep(s6)).

evidence(all_consistent(pop)).
query(true_val(pop, upper_tier)).
query(true_val(pop, unk_pop)).

% @attr dampening
% @type categorical
% @canonical false
% @original_name dampening (Old Guys Rip Too)
% @values unreal_absorbed_everything=Unreal_absorbed_everything unk_dampening=Unknown
% @importance 0.75

0.70::acc(s12, dampening).

0.45::true_val(dampening, unreal_absorbed_everything); 0.55::true_val(dampening, unk_dampening).

measured(s12, dampening, unreal_absorbed_everything).

all_consistent(dampening) :- consistent(s12, dampening).

evidence(all_consistent(dampening)).
query(true_val(dampening, unreal_absorbed_everything)).
query(true_val(dampening, unk_dampening)).

% @attr stability
% @type categorical
% @canonical false
% @original_name stability
% @values excellent_high_speed=Excellent_at_high_speed_blasts_through_uneven_snow unk_stability=Unknown
% @importance 0.75

0.70::acc(s12, stability).

0.45::true_val(stability, excellent_high_speed); 0.55::true_val(stability, unk_stability).

measured(s12, stability, excellent_high_speed).

all_consistent(stability) :- consistent(s12, stability).

evidence(all_consistent(stability)).
query(true_val(stability, excellent_high_speed)).
query(true_val(stability, unk_stability)).

% @attr responsiveness
% @type categorical
% @canonical false
% @original_name responsiveness
% @values snappy_smooth_locked_in=Snappy_response_smooth_locked_in_feel_fast_turns unk_responsiveness=Unknown
% @importance 0.70

0.70::acc(s22, responsiveness).

0.60::true_val(responsiveness, snappy_smooth_locked_in); 0.40::true_val(responsiveness, unk_responsiveness).

measured(s22, responsiveness, snappy_smooth_locked_in).

all_consistent(responsiveness) :- (indep(s22), consistent(s22, responsiveness) ; \+indep(s22)).

evidence(all_consistent(responsiveness)).
query(true_val(responsiveness, snappy_smooth_locked_in)).
query(true_val(responsiveness, unk_responsiveness)).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles
% @values smashes_crud=Absolutely_smashes_through_crud unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.90

0.88::acc(s9, reviewer_opinion_snowboardingprofiles).

0.76::true_val(reviewer_opinion_snowboardingprofiles, smashes_crud); 0.24::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).

measured(s9, reviewer_opinion_snowboardingprofiles, smashes_crud).

all_consistent(reviewer_opinion_snowboardingprofiles) :- consistent(s9, reviewer_opinion_snowboardingprofiles).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, smashes_crud)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values thirsty_base=Sintered_base_extremely_thirsty_needs_waxing_daily unk_negative_aspect=Unknown
% @importance 0.88

0.90::acc(s6, negative_aspect).
0.85::acc(s5, negative_aspect).

0.95::true_val(negative_aspect, thirsty_base); 0.05::true_val(negative_aspect, unk_negative_aspect).

measured(s6, negative_aspect, thirsty_base).
measured(s5, negative_aspect, thirsty_base).

all_consistent(negative_aspect) :-
    (indep(s6), consistent(s6, negative_aspect) ; \+indep(s6)),
    consistent(s5, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, thirsty_base)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_wax_detail
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values base_grind_wax_nothing_worked=Tried_base_grind_waxed_repeatedly_nothing_worked unk_negative_aspect_wax_detail=Unknown
% @importance 0.85

0.88::acc(s6, negative_aspect_wax_detail).

0.72::true_val(negative_aspect_wax_detail, base_grind_wax_nothing_worked); 0.28::true_val(negative_aspect_wax_detail, unk_negative_aspect_wax_detail).

measured(s6, negative_aspect_wax_detail, base_grind_wax_nothing_worked).

all_consistent(negative_aspect_wax_detail) :- (indep(s6), consistent(s6, negative_aspect_wax_detail) ; \+indep(s6)).

evidence(all_consistent(negative_aspect_wax_detail)).
query(true_val(negative_aspect_wax_detail, base_grind_wax_nothing_worked)).
query(true_val(negative_aspect_wax_detail, unk_negative_aspect_wax_detail)).

% @attr negative_aspect_grabby
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values grabby_back_foot_soft_snow=Can_feel_grabby_near_back_foot_in_softer_snow unk_negative_aspect_grabby=Unknown
% @importance 0.85

0.85::acc(s6, negative_aspect_grabby).

0.72::true_val(negative_aspect_grabby, grabby_back_foot_soft_snow); 0.28::true_val(negative_aspect_grabby, unk_negative_aspect_grabby).

measured(s6, negative_aspect_grabby, grabby_back_foot_soft_snow).

all_consistent(negative_aspect_grabby) :- (indep(s6), consistent(s6, negative_aspect_grabby) ; \+indep(s6)).

evidence(all_consistent(negative_aspect_grabby)).
query(true_val(negative_aspect_grabby, grabby_back_foot_soft_snow)).
query(true_val(negative_aspect_grabby, unk_negative_aspect_grabby)).

% @attr negative_aspect_unforgiving
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values technical_unforgiving=Board_is_technical_unforgiving_not_for_beginners unk_negative_aspect_unforgiving=Unknown
% @importance 0.80

0.78::acc(s12, negative_aspect_unforgiving).
0.82::acc(s5, negative_aspect_unforgiving).

0.95::true_val(negative_aspect_unforgiving, technical_unforgiving); 0.05::true_val(negative_aspect_unforgiving, unk_negative_aspect_unforgiving).

measured(s12, negative_aspect_unforgiving, technical_unforgiving).
measured(s5, negative_aspect_unforgiving, technical_unforgiving).

all_consistent(negative_aspect_unforgiving) :-
    consistent(s12, negative_aspect_unforgiving),
    consistent(s5, negative_aspect_unforgiving).

evidence(all_consistent(negative_aspect_unforgiving)).
query(true_val(negative_aspect_unforgiving, technical_unforgiving)).
query(true_val(negative_aspect_unforgiving, unk_negative_aspect_unforgiving)).

% @attr negative_aspect_heavy_jumping
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values heavy_when_jumping=Felt_heavy_when_jumping_more_effort_for_air unk_negative_aspect_heavy_jumping=Unknown
% @importance 0.75

0.70::acc(s12, negative_aspect_heavy_jumping).

0.45::true_val(negative_aspect_heavy_jumping, heavy_when_jumping); 0.55::true_val(negative_aspect_heavy_jumping, unk_negative_aspect_heavy_jumping).

measured(s12, negative_aspect_heavy_jumping, heavy_when_jumping).

all_consistent(negative_aspect_heavy_jumping) :- consistent(s12, negative_aspect_heavy_jumping).

evidence(all_consistent(negative_aspect_heavy_jumping)).
query(true_val(negative_aspect_heavy_jumping, heavy_when_jumping)).
query(true_val(negative_aspect_heavy_jumping, unk_negative_aspect_heavy_jumping)).

% @attr negative_aspect_switch
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values setback_taper_switch_unnatural=Significant_setback_taper_make_switch_less_natural unk_negative_aspect_switch=Unknown
% @importance 0.85

0.82::acc(s11, negative_aspect_switch).

0.69::true_val(negative_aspect_switch, setback_taper_switch_unnatural); 0.31::true_val(negative_aspect_switch, unk_negative_aspect_switch).

measured(s11, negative_aspect_switch, setback_taper_switch_unnatural).

all_consistent(negative_aspect_switch) :- consistent(s11, negative_aspect_switch).

evidence(all_consistent(negative_aspect_switch)).
query(true_val(negative_aspect_switch, setback_taper_switch_unnatural)).
query(true_val(negative_aspect_switch, unk_negative_aspect_switch)).

% @attr negative_aspect_topsheet
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values poly_topsheet_scuffs=Poly_topsheet_scuffs_easily unk_negative_aspect_topsheet=Unknown
% @importance 0.85

0.85::acc(s6, negative_aspect_topsheet).

0.72::true_val(negative_aspect_topsheet, poly_topsheet_scuffs); 0.28::true_val(negative_aspect_topsheet, unk_negative_aspect_topsheet).

measured(s6, negative_aspect_topsheet, poly_topsheet_scuffs).

all_consistent(negative_aspect_topsheet) :- (indep(s6), consistent(s6, negative_aspect_topsheet) ; \+indep(s6)).

evidence(all_consistent(negative_aspect_topsheet)).
query(true_val(negative_aspect_topsheet, poly_topsheet_scuffs)).
query(true_val(negative_aspect_topsheet, unk_negative_aspect_topsheet)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values advanced_expert=Advanced_to_Expert unk_rider_level=Unknown
% @importance 0.90

0.95::acc(s1, rider_level).
0.80::acc(s7, rider_level).
0.82::acc(s11, rider_level).
0.90::acc(s_merchant, rider_level).

0.97::true_val(rider_level, advanced_expert); 0.03::true_val(rider_level, unk_rider_level).

measured(s1, rider_level, advanced_expert).
measured(s7, rider_level, advanced_expert).
measured(s11, rider_level, advanced_expert).
measured(s_merchant, rider_level, advanced_expert).

all_consistent(rider_level) :-
    consistent(s1, rider_level),
    (indep(s7), consistent(s7, rider_level) ; \+indep(s7)),
    consistent(s11, rider_level),
    (indep(s_merchant), consistent(s_merchant, rider_level) ; \+indep(s_merchant)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, advanced_expert)).
query(true_val(rider_level, unk_rider_level)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values aggressive_hard_charging=Aggressive_hard_charging_resort_riders intermediate_advanced=Intermediate_to_advanced
% @importance 0.80

0.90::acc(s1, skill_level_recommendation).
0.80::acc(s7, skill_level_recommendation).
0.65::acc(s12, skill_level_recommendation).

0.60::true_val(skill_level_recommendation, aggressive_hard_charging); 0.40::true_val(skill_level_recommendation, intermediate_advanced).

measured(s1, skill_level_recommendation, aggressive_hard_charging).
measured(s7, skill_level_recommendation, aggressive_hard_charging).
measured(s12, skill_level_recommendation, intermediate_advanced).

all_consistent(skill_level_recommendation) :-
    consistent(s1, skill_level_recommendation),
    (indep(s7), consistent(s7, skill_level_recommendation) ; \+indep(s7)),
    consistent(s12, skill_level_recommendation).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, aggressive_hard_charging)).
query(true_val(skill_level_recommendation, intermediate_advanced)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values aggressive_high_speed_carving=Aggressive_high_speed_carving unk_riding_style=Unknown
% @importance 0.85

0.90::acc(s_merchant, riding_style).

0.95::true_val(riding_style, aggressive_high_speed_carving); 0.05::true_val(riding_style, unk_riding_style).

measured(s_merchant, riding_style, aggressive_high_speed_carving).

all_consistent(riding_style) :- (indep(s_merchant), consistent(s_merchant, riding_style) ; \+indep(s_merchant)).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, aggressive_high_speed_carving)).
query(true_val(riding_style, unk_riding_style)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values all_mtn_freeride_offpiste=All_Mountain_Freeride_Off_piste_Steep_excels_hardpack_icy_powder unk_terrain_suitability=Unknown
% @importance 0.88

0.88::acc(s_merchant, terrain_suitability).
0.85::acc(s6, terrain_suitability).
0.82::acc(s11, terrain_suitability).

0.95::true_val(terrain_suitability, all_mtn_freeride_offpiste); 0.05::true_val(terrain_suitability, unk_terrain_suitability).

measured(s_merchant, terrain_suitability, all_mtn_freeride_offpiste).
measured(s6, terrain_suitability, all_mtn_freeride_offpiste).
measured(s11, terrain_suitability, all_mtn_freeride_offpiste).

all_consistent(terrain_suitability) :-
    (indep(s_merchant), consistent(s_merchant, terrain_suitability) ; \+indep(s_merchant)),
    (indep(s6), consistent(s6, terrain_suitability) ; \+indep(s6)),
    consistent(s11, terrain_suitability).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, all_mtn_freeride_offpiste)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr recommended_stance
% @type categorical
% @canonical false
% @original_name recommended stance (The Inertia)
% @values posi_posi=Natural_fit_for_posi_posi_stance_both_feet_positive unk_recommended_stance=Unknown
% @importance 0.85

0.80::acc(s11, recommended_stance).

0.69::true_val(recommended_stance, posi_posi); 0.31::true_val(recommended_stance, unk_recommended_stance).

measured(s11, recommended_stance, posi_posi).

all_consistent(recommended_stance) :- consistent(s11, recommended_stance).

evidence(all_consistent(recommended_stance)).
query(true_val(recommended_stance, posi_posi)).
query(true_val(recommended_stance, unk_recommended_stance)).

% @attr best_use_case
% @type categorical
% @canonical false
% @original_name best use case (The Inertia)
% @values bomber_side_country_resort=Bomber_side_country_board_95pct_resort unk_best_use_case=Unknown
% @importance 0.85

0.82::acc(s11, best_use_case).

0.69::true_val(best_use_case, bomber_side_country_resort); 0.31::true_val(best_use_case, unk_best_use_case).

measured(s11, best_use_case, bomber_side_country_resort).

all_consistent(best_use_case) :- consistent(s11, best_use_case).

evidence(all_consistent(best_use_case)).
query(true_val(best_use_case, bomber_side_country_resort)).
query(true_val(best_use_case, unk_best_use_case)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values ranked_jones_flagship_1_valhalla_2_pypl_3=Jones_Flagship_1_Never_Summer_Valhalla_2_YES_PYL_3_and_more unk_comparable_board_cross_brand=Unknown
% @importance 0.82

0.82::acc(s23, comparable_board_cross_brand).

0.70::true_val(comparable_board_cross_brand, ranked_jones_flagship_1_valhalla_2_pypl_3); 0.30::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s23, comparable_board_cross_brand, ranked_jones_flagship_1_valhalla_2_pypl_3).

all_consistent(comparable_board_cross_brand) :- (indep(s23), consistent(s23, comparable_board_cross_brand) ; \+indep(s23)).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, ranked_jones_flagship_1_valhalla_2_pypl_3)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_list1
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values amplid_k2_us_ride_capita=Amplid_Souly_Grail_K2_Alchemist_US_Cadet_Ride_Algorythm_and_more unk_comparable_board_cross_brand_list1=Unknown
% @importance 0.82

0.75::acc(s5, comparable_board_cross_brand_list1).

0.72::true_val(comparable_board_cross_brand_list1, amplid_k2_us_ride_capita); 0.28::true_val(comparable_board_cross_brand_list1, unk_comparable_board_cross_brand_list1).

measured(s5, comparable_board_cross_brand_list1, amplid_k2_us_ride_capita).

all_consistent(comparable_board_cross_brand_list1) :- consistent(s5, comparable_board_cross_brand_list1).

evidence(all_consistent(comparable_board_cross_brand_list1)).
query(true_val(comparable_board_cross_brand_list1, amplid_k2_us_ride_capita)).
query(true_val(comparable_board_cross_brand_list1, unk_comparable_board_cross_brand_list1)).

% @attr comparable_board_cross_brand_list2
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values yes_pypl_burton_fa_jones_flagship=YES_PYL_Burton_Flight_Attendant_Jones_Flagship_Rossignol_XV_Lib_BRD unk_comparable_board_cross_brand_list2=Unknown
% @importance 0.82

0.75::acc(s5, comparable_board_cross_brand_list2).

0.72::true_val(comparable_board_cross_brand_list2, yes_pypl_burton_fa_jones_flagship); 0.28::true_val(comparable_board_cross_brand_list2, unk_comparable_board_cross_brand_list2).

measured(s5, comparable_board_cross_brand_list2, yes_pypl_burton_fa_jones_flagship).

all_consistent(comparable_board_cross_brand_list2) :- consistent(s5, comparable_board_cross_brand_list2).

evidence(all_consistent(comparable_board_cross_brand_list2)).
query(true_val(comparable_board_cross_brand_list2, yes_pypl_burton_fa_jones_flagship)).
query(true_val(comparable_board_cross_brand_list2, unk_comparable_board_cross_brand_list2)).

% @attr comparable_board_cross_brand_lib_rig
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values lib_rig_same_base_issue=Lib_Tech_Lib_Rig_same_base_issue unk_comparable_board_cross_brand_lib_rig=Unknown
% @importance 0.82

0.75::acc(s5, comparable_board_cross_brand_lib_rig).

0.72::true_val(comparable_board_cross_brand_lib_rig, lib_rig_same_base_issue); 0.28::true_val(comparable_board_cross_brand_lib_rig, unk_comparable_board_cross_brand_lib_rig).

measured(s5, comparable_board_cross_brand_lib_rig, lib_rig_same_base_issue).

all_consistent(comparable_board_cross_brand_lib_rig) :- consistent(s5, comparable_board_cross_brand_lib_rig).

evidence(all_consistent(comparable_board_cross_brand_lib_rig)).
query(true_val(comparable_board_cross_brand_lib_rig, lib_rig_same_base_issue)).
query(true_val(comparable_board_cross_brand_lib_rig, unk_comparable_board_cross_brand_lib_rig)).

% @attr comparable_board_cross_brand_dynamo
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values lib_dynamo_base_doesnt_dry=Lib_Tech_Dynamo_almost_full_camber_base_doesnt_dry_as_fast unk_comparable_board_cross_brand_dynamo=Unknown
% @importance 0.82

0.75::acc(s5, comparable_board_cross_brand_dynamo).

0.72::true_val(comparable_board_cross_brand_dynamo, lib_dynamo_base_doesnt_dry); 0.28::true_val(comparable_board_cross_brand_dynamo, unk_comparable_board_cross_brand_dynamo).

measured(s5, comparable_board_cross_brand_dynamo, lib_dynamo_base_doesnt_dry).

all_consistent(comparable_board_cross_brand_dynamo) :- consistent(s5, comparable_board_cross_brand_dynamo).

evidence(all_consistent(comparable_board_cross_brand_dynamo)).
query(true_val(comparable_board_cross_brand_dynamo, lib_dynamo_base_doesnt_dry)).
query(true_val(comparable_board_cross_brand_dynamo, unk_comparable_board_cross_brand_dynamo)).

% @attr user_review_forum_ice
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values totally_inferior_competitors_icy=Other_boards_TOTALLY_inferior_to_Banked_Country_on_icy unk_user_review_forum_ice=Unknown
% @importance 0.70

0.55::acc(s15, user_review_forum_ice).

0.34::true_val(user_review_forum_ice, totally_inferior_competitors_icy); 0.66::true_val(user_review_forum_ice, unk_user_review_forum_ice).

measured(s15, user_review_forum_ice, totally_inferior_competitors_icy).

all_consistent(user_review_forum_ice) :- consistent(s15, user_review_forum_ice).

evidence(all_consistent(user_review_forum_ice)).
query(true_val(user_review_forum_ice, totally_inferior_competitors_icy)).
query(true_val(user_review_forum_ice, unk_user_review_forum_ice)).

% @attr user_review_forum_quiver
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values best_board_quiver_killer=By_far_best_board_in_quiver_quiver_killer unk_user_review_forum_quiver=Unknown
% @importance 0.65

0.55::acc(s16, user_review_forum_quiver).

0.29::true_val(user_review_forum_quiver, best_board_quiver_killer); 0.71::true_val(user_review_forum_quiver, unk_user_review_forum_quiver).

measured(s16, user_review_forum_quiver, best_board_quiver_killer).

all_consistent(user_review_forum_quiver) :- consistent(s16, user_review_forum_quiver).

evidence(all_consistent(user_review_forum_quiver)).
query(true_val(user_review_forum_quiver, best_board_quiver_killer)).
query(true_val(user_review_forum_quiver, unk_user_review_forum_quiver)).

% @attr redesign_year
% @type categorical
% @canonical true
% @original_name redesign_year
% @values refined_tail_switch=Refined_tail_shape_for_improved_switch_performance unk_redesign_year=Unknown
% @importance 0.70

0.78::acc(s22, redesign_year).

0.60::true_val(redesign_year, refined_tail_switch); 0.40::true_val(redesign_year, unk_redesign_year).

measured(s22, redesign_year, refined_tail_switch).

all_consistent(redesign_year) :- (indep(s22), consistent(s22, redesign_year) ; \+indep(s22)).

evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, refined_tail_switch)).
query(true_val(redesign_year, unk_redesign_year)).

% @attr redesign_year_art
% @type categorical
% @canonical false
% @original_name redesign_year
% @values art_by_temple=Board_art_by_Temple_Cummins_previously_Cannon unk_redesign_year_art=Unknown
% @importance 0.70

0.90::acc(s1, redesign_year_art).

0.93::true_val(redesign_year_art, art_by_temple); 0.07::true_val(redesign_year_art, unk_redesign_year_art).

measured(s1, redesign_year_art, art_by_temple).

all_consistent(redesign_year_art) :- consistent(s1, redesign_year_art).

evidence(all_consistent(redesign_year_art)).
query(true_val(redesign_year_art, art_by_temple)).
query(true_val(redesign_year_art, unk_redesign_year_art)).

% @attr redesign_year_tail
% @type categorical
% @canonical false
% @original_name redesign_year
% @values blunted_tail=Blunted_rounded_tail_replaced_mini_diamond_from_2022_2023 unk_redesign_year_tail=Unknown
% @importance 0.73

0.82::acc(s15, redesign_year_tail).
0.78::acc(s12, redesign_year_tail).
0.88::acc(s9, redesign_year_tail).

0.95::true_val(redesign_year_tail, blunted_tail); 0.05::true_val(redesign_year_tail, unk_redesign_year_tail).

measured(s15, redesign_year_tail, blunted_tail).
measured(s12, redesign_year_tail, blunted_tail).
measured(s9, redesign_year_tail, blunted_tail).

all_consistent(redesign_year_tail) :-
    consistent(s15, redesign_year_tail),
    consistent(s12, redesign_year_tail),
    consistent(s9, redesign_year_tail).

evidence(all_consistent(redesign_year_tail)).
query(true_val(redesign_year_tail, blunted_tail)).
query(true_val(redesign_year_tail, unk_redesign_year_tail)).

% @attr redesign_year_core
% @type categorical
% @canonical false
% @original_name redesign_year
% @values more_paulownia_carbon=Added_more_Paulownia_to_reduce_weight_Carbon_Power_Bands unk_redesign_year_core=Unknown
% @importance 0.70

0.82::acc(s14, redesign_year_core).

0.72::true_val(redesign_year_core, more_paulownia_carbon); 0.28::true_val(redesign_year_core, unk_redesign_year_core).

measured(s14, redesign_year_core, more_paulownia_carbon).

all_consistent(redesign_year_core) :- consistent(s14, redesign_year_core).

evidence(all_consistent(redesign_year_core)).
query(true_val(redesign_year_core, more_paulownia_carbon)).
query(true_val(redesign_year_core, unk_redesign_year_core)).

% @attr redesign_year_sizes
% @type categorical
% @canonical false
% @original_name redesign_year
% @values added_163w_removed_151=Added_163W_removed_151 unk_redesign_year_sizes=Unknown
% @importance 0.78

0.88::acc(s9, redesign_year_sizes).

0.76::true_val(redesign_year_sizes, added_163w_removed_151); 0.24::true_val(redesign_year_sizes, unk_redesign_year_sizes).

measured(s9, redesign_year_sizes, added_163w_removed_151).

all_consistent(redesign_year_sizes) :- consistent(s9, redesign_year_sizes).

evidence(all_consistent(redesign_year_sizes)).
query(true_val(redesign_year_sizes, added_163w_removed_151)).
query(true_val(redesign_year_sizes, unk_redesign_year_sizes)).

% @attr recommended_boot_size_155
% @type categorical
% @canonical false
% @original_name recommended boot size 155cm
% @values us_7_5_8_5=US_7_5_to_8_5 unk_recommended_boot_size_155=Unknown
% @importance 0.90

0.85::acc(s5, recommended_boot_size_155).

0.72::true_val(recommended_boot_size_155, us_7_5_8_5); 0.28::true_val(recommended_boot_size_155, unk_recommended_boot_size_155).

measured(s5, recommended_boot_size_155, us_7_5_8_5).

all_consistent(recommended_boot_size_155) :- consistent(s5, recommended_boot_size_155).

evidence(all_consistent(recommended_boot_size_155)).
query(true_val(recommended_boot_size_155, us_7_5_8_5)).
query(true_val(recommended_boot_size_155, unk_recommended_boot_size_155)).

% @attr recommended_boot_size_159
% @type categorical
% @canonical false
% @original_name recommended boot size 159cm
% @values us_8_5_9_5=US_8_5_to_9_5 unk_recommended_boot_size_159=Unknown
% @importance 0.90

0.85::acc(s5, recommended_boot_size_159).

0.72::true_val(recommended_boot_size_159, us_8_5_9_5); 0.28::true_val(recommended_boot_size_159, unk_recommended_boot_size_159).

measured(s5, recommended_boot_size_159, us_8_5_9_5).

all_consistent(recommended_boot_size_159) :- consistent(s5, recommended_boot_size_159).

evidence(all_consistent(recommended_boot_size_159)).
query(true_val(recommended_boot_size_159, us_8_5_9_5)).
query(true_val(recommended_boot_size_159, unk_recommended_boot_size_159)).

% @attr recommended_boot_size_162
% @type categorical
% @canonical false
% @original_name recommended boot size 162cm
% @values us_9_10=US_9_to_10 unk_recommended_boot_size_162=Unknown
% @importance 0.90

0.85::acc(s5, recommended_boot_size_162).

0.72::true_val(recommended_boot_size_162, us_9_10); 0.28::true_val(recommended_boot_size_162, unk_recommended_boot_size_162).

measured(s5, recommended_boot_size_162, us_9_10).

all_consistent(recommended_boot_size_162) :- consistent(s5, recommended_boot_size_162).

evidence(all_consistent(recommended_boot_size_162)).
query(true_val(recommended_boot_size_162, us_9_10)).
query(true_val(recommended_boot_size_162, unk_recommended_boot_size_162)).

% @attr recommended_boot_size_160w
% @type categorical
% @canonical false
% @original_name recommended boot size 160W
% @values us_10_5_11_5=US_10_5_to_11_5 unk_recommended_boot_size_160w=Unknown
% @importance 0.90

0.85::acc(s5, recommended_boot_size_160w).

0.72::true_val(recommended_boot_size_160w, us_10_5_11_5); 0.28::true_val(recommended_boot_size_160w, unk_recommended_boot_size_160w).

measured(s5, recommended_boot_size_160w, us_10_5_11_5).

all_consistent(recommended_boot_size_160w) :- consistent(s5, recommended_boot_size_160w).

evidence(all_consistent(recommended_boot_size_160w)).
query(true_val(recommended_boot_size_160w, us_10_5_11_5)).
query(true_val(recommended_boot_size_160w, unk_recommended_boot_size_160w)).

% @attr recommended_boot_size_163w
% @type categorical
% @canonical false
% @original_name recommended boot size 163W
% @values us_11_12=US_11_to_12 unk_recommended_boot_size_163w=Unknown
% @importance 0.90

0.85::acc(s5, recommended_boot_size_163w).

0.72::true_val(recommended_boot_size_163w, us_11_12); 0.28::true_val(recommended_boot_size_163w, unk_recommended_boot_size_163w).

measured(s5, recommended_boot_size_163w, us_11_12).

all_consistent(recommended_boot_size_163w) :- consistent(s5, recommended_boot_size_163w).

evidence(all_consistent(recommended_boot_size_163w)).
query(true_val(recommended_boot_size_163w, us_11_12)).
query(true_val(recommended_boot_size_163w, unk_recommended_boot_size_163w)).