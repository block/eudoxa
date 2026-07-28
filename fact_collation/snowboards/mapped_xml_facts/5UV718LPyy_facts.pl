0.15::indep(s2).
0.15::indep(s9).
0.25::indep(s11).
0.25::indep(s18).
0.20::indep(s21).
0.20::indep(s22).
0.15::indep(s24).
0.15::indep(s25).
0.15::indep(s28).
0.80::indep(s30).
0.20::indep(s31).
0.80::indep(s32).
0.15::indep(s34).
0.15::indep(s35).
0.15::indep(s37).
0.20::indep(s40).
0.92::indep(s5).
0.95::indep(s8).
0.92::indep(s38).
0.90::indep(s39).
0.95::indep(s43).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values lib_tech=Lib_Tech unk_brand=Unknown
% @importance 1.0

0.95::true_val(brand, lib_tech); 0.05::true_val(brand, unk_brand).
0.95::acc(s1, brand).
measured(s1, brand, lib_tech).
all_consistent(brand) :- consistent(s1, brand).
evidence(all_consistent(brand)).
query(true_val(brand, lib_tech)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values mayhem_rocket=Mayhem_Rocket unk_model_name=Unknown
% @importance 1.0

0.95::true_val(model_name, mayhem_rocket); 0.05::true_val(model_name, unk_model_name).
0.95::acc(s1, model_name).
measured(s1, model_name, mayhem_rocket).
all_consistent(model_name) :- consistent(s1, model_name).
evidence(all_consistent(model_name)).
query(true_val(model_name, mayhem_rocket)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2025_2026=2025-2026 unk_model_year=Unknown
% @importance 1.0

0.95::true_val(model_year, y2025_2026); 0.05::true_val(model_year, unk_model_year).
0.95::acc(s1, model_year).
measured(s1, model_year, y2025_2026).
all_consistent(model_year) :- consistent(s1, model_year).
evidence(all_consistent(model_year)).
query(true_val(model_year, y2025_2026)).
query(true_val(model_year, unk_model_year)).

% @attr sku
% @type categorical
% @canonical true
% @original_name SKU
% @values sku_25sn043=25SN043 unk_sku=Unknown
% @importance 0.3

0.57::true_val(sku, sku_25sn043); 0.43::true_val(sku, unk_sku).
0.55::acc(s2, sku).
measured(s2, sku, sku_25sn043).
all_consistent(sku) :- (indep(s2), consistent(s2, sku) ; \+indep(s2)).
evidence(all_consistent(sku)).
query(true_val(sku, sku_25sn043)).
query(true_val(sku, unk_sku)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.95::true_val(product_type, snowboard); 0.05::true_val(product_type, unk_product_type).
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
% @values all_mountain_directional=All_Mountain_Directional freeride_powder=Freeride_Powder
% @importance 0.925

0.60::true_val(board_category, all_mountain_directional); 0.40::true_val(board_category, freeride_powder).
0.93::acc(s1, board_category).
0.85::acc(sm, board_category).
measured(s1, board_category, all_mountain_directional).
measured(sm, board_category, freeride_powder).
all_consistent(board_category) :- consistent(s1, board_category), consistent(sm, board_category).
evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain_directional)).
query(true_val(board_category, freeride_powder)).

% @attr model_series
% @type categorical
% @canonical false
% @original_name Model series
% @values lib_x_mayhem=Lib_x_Mayhem_Collection unk_model_series=Unknown
% @importance 0.5

0.86::true_val(model_series, lib_x_mayhem); 0.14::true_val(model_series, unk_model_series).
0.90::acc(s3, model_series).
measured(s3, model_series, lib_x_mayhem).
all_consistent(model_series) :- consistent(s3, model_series).
evidence(all_consistent(model_series)).
query(true_val(model_series, lib_x_mayhem)).
query(true_val(model_series, unk_model_series)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values matt_biolos=Matt_Mayhem_Biolos_Lost_Surfboards unk_pro_rider_name=Unknown
% @importance 0.7

0.90::true_val(pro_rider_name, matt_biolos); 0.10::true_val(pro_rider_name, unk_pro_rider_name).
0.94::acc(s4, pro_rider_name).
measured(s4, pro_rider_name, matt_biolos).
all_consistent(pro_rider_name) :- consistent(s4, pro_rider_name).
evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, matt_biolos)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr design_inspiration
% @type categorical
% @canonical false
% @original_name Design inspiration
% @values lost_rocket_surfboard=Based_on_Lost_Rocket_surfboard unk_design_inspiration=Unknown
% @importance 0.75

0.52::true_val(design_inspiration, lost_rocket_surfboard); 0.48::true_val(design_inspiration, unk_design_inspiration).
0.60::acc(s5, design_inspiration).
measured(s5, design_inspiration, lost_rocket_surfboard).
all_consistent(design_inspiration) :- (indep(s5), consistent(s5, design_inspiration) ; \+indep(s5)).
evidence(all_consistent(design_inspiration)).
query(true_val(design_inspiration, lost_rocket_surfboard)).
query(true_val(design_inspiration, unk_design_inspiration)).

% @attr matt_biolos_quote
% @type categorical
% @canonical false
% @original_name Matt Biolos quote
% @values rocket_original_dream_machine=The_Rocket_is_our_original_surf_inspired_directional_dream_machine unk_matt_biolos_quote=Unknown
% @importance 0.6

0.86::true_val(matt_biolos_quote, rocket_original_dream_machine); 0.14::true_val(matt_biolos_quote, unk_matt_biolos_quote).
0.90::acc(s6, matt_biolos_quote).
measured(s6, matt_biolos_quote, rocket_original_dream_machine).
all_consistent(matt_biolos_quote) :- consistent(s6, matt_biolos_quote).
evidence(all_consistent(matt_biolos_quote)).
query(true_val(matt_biolos_quote, rocket_original_dream_machine)).
query(true_val(matt_biolos_quote, unk_matt_biolos_quote)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values y2016=2016 unk_model_first_available_year=Unknown
% @importance 0.6

0.77::true_val(model_first_available_year, y2016); 0.23::true_val(model_first_available_year, unk_model_first_available_year).
0.80::acc(s7, model_first_available_year).
measured(s7, model_first_available_year, y2016).
all_consistent(model_first_available_year) :- consistent(s7, model_first_available_year).
evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2016)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr redesign_year
% @type categorical
% @canonical true
% @original_name redesign_year
% @values y2024_2025_unchanged_2025_2026=Major_overhaul_2024_25_unchanged_2025_26 unk_redesign_year=Unknown
% @importance 0.95

0.72::true_val(redesign_year, y2024_2025_unchanged_2025_2026); 0.28::true_val(redesign_year, unk_redesign_year).
0.78::acc(s8, redesign_year).
measured(s8, redesign_year, y2024_2025_unchanged_2025_2026).
all_consistent(redesign_year) :- (indep(s8), consistent(s8, redesign_year) ; \+indep(s8)).
evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, y2024_2025_unchanged_2025_2026)).
query(true_val(redesign_year, unk_redesign_year)).

% @attr graphic_designer_artist
% @type categorical
% @canonical true
% @original_name graphic_designer_artist
% @values drew_brophy=Drew_Brophy unk_graphic_designer_artist=Unknown
% @importance 0.25

0.59::true_val(graphic_designer_artist, drew_brophy); 0.41::true_val(graphic_designer_artist, unk_graphic_designer_artist).
0.60::acc(s9, graphic_designer_artist).
measured(s9, graphic_designer_artist, drew_brophy).
all_consistent(graphic_designer_artist) :- (indep(s9), consistent(s9, graphic_designer_artist) ; \+indep(s9)).
evidence(all_consistent(graphic_designer_artist)).
query(true_val(graphic_designer_artist, drew_brophy)).
query(true_val(graphic_designer_artist, unk_graphic_designer_artist)).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values lib_tech_lost_rocket=Lib_Tech_Lost_Rocket_2018_2024 unk_predecessor_model_name=Unknown
% @importance 0.95

0.72::true_val(predecessor_model_name, lib_tech_lost_rocket); 0.28::true_val(predecessor_model_name, unk_predecessor_model_name).
0.78::acc(s8, predecessor_model_name).
measured(s8, predecessor_model_name, lib_tech_lost_rocket).
all_consistent(predecessor_model_name) :- (indep(s8), consistent(s8, predecessor_model_name) ; \+indep(s8)).
evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, lib_tech_lost_rocket)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values mervin_manufacturing=Mervin_Manufacturing unk_manufacturer=Unknown
% @importance 0.7

0.90::true_val(manufacturer, mervin_manufacturing); 0.10::true_val(manufacturer, unk_manufacturer).
0.94::acc(s10, manufacturer).
measured(s10, manufacturer, mervin_manufacturing).
all_consistent(manufacturer) :- consistent(s10, manufacturer).
evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, mervin_manufacturing)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values usa_sequim_wa=Handbuilt_USA_Sequim_WA unk_manufacturing_location=Unknown
% @importance 0.7

0.95::true_val(manufacturing_location, usa_sequim_wa); 0.05::true_val(manufacturing_location, unk_manufacturing_location).
0.93::acc(s11, manufacturing_location).
0.75::acc(s34, manufacturing_location).
measured(s11, manufacturing_location, usa_sequim_wa).
measured(s34, manufacturing_location, usa_sequim_wa).
all_consistent(manufacturing_location) :-
    (indep(s11), consistent(s11, manufacturing_location) ; \+indep(s11)),
    (indep(s34), consistent(s34, manufacturing_location) ; \+indep(s34)).
evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, usa_sequim_wa)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

% @attr mervin_founded
% @type categorical
% @canonical false
% @original_name Mervin founded
% @values y1977_olson_saari=1977_by_Mike_Olson_and_Pete_Saari unk_mervin_founded=Unknown
% @importance 0.5

0.86::true_val(mervin_founded, y1977_olson_saari); 0.14::true_val(mervin_founded, unk_mervin_founded).
0.90::acc(s12, mervin_founded).
measured(s12, mervin_founded, y1977_olson_saari).
all_consistent(mervin_founded) :- consistent(s12, mervin_founded).
evidence(all_consistent(mervin_founded)).
query(true_val(mervin_founded, y1977_olson_saari)).
query(true_val(mervin_founded, unk_mervin_founded)).

% @attr mervin_distinction
% @type categorical
% @canonical false
% @original_name Mervin distinction
% @values longest_running_last_major_usa=Longest_running_last_major_US_factory unk_mervin_distinction=Unknown
% @importance 0.5

0.86::true_val(mervin_distinction, longest_running_last_major_usa); 0.14::true_val(mervin_distinction, unk_mervin_distinction).
0.88::acc(s12, mervin_distinction).
measured(s12, mervin_distinction, longest_running_last_major_usa).
all_consistent(mervin_distinction) :- consistent(s12, mervin_distinction).
evidence(all_consistent(mervin_distinction)).
query(true_val(mervin_distinction, longest_running_last_major_usa)).
query(true_val(mervin_distinction, unk_mervin_distinction)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values zero_hazardous_waste=Zero_hazardous_waste_production unk_sustainability_certification=Unknown
% @importance 0.6

0.95::true_val(sustainability_certification, zero_hazardous_waste); 0.05::true_val(sustainability_certification, unk_sustainability_certification).
0.80::acc(s13, sustainability_certification).
0.75::acc(s34, sustainability_certification).
measured(s13, sustainability_certification, zero_hazardous_waste).
measured(s34, sustainability_certification, zero_hazardous_waste).
all_consistent(sustainability_certification) :-
    consistent(s13, sustainability_certification),
    (indep(s34), consistent(s34, sustainability_certification) ; \+indep(s34)).
evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, zero_hazardous_waste)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr sustainability_certification_water_solvents
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values water_based_solvents=Water_based_solvents unk_sustainability_certification_water_solvents=Unknown
% @importance 0.5

0.72::true_val(sustainability_certification_water_solvents, water_based_solvents); 0.28::true_val(sustainability_certification_water_solvents, unk_sustainability_certification_water_solvents).
0.78::acc(s11, sustainability_certification_water_solvents).
measured(s11, sustainability_certification_water_solvents, water_based_solvents).
all_consistent(sustainability_certification_water_solvents) :-
    (indep(s11), consistent(s11, sustainability_certification_water_solvents) ; \+indep(s11)).
evidence(all_consistent(sustainability_certification_water_solvents)).
query(true_val(sustainability_certification_water_solvents, water_based_solvents)).
query(true_val(sustainability_certification_water_solvents, unk_sustainability_certification_water_solvents)).

% @attr sustainability_certification_wood_recycling
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values sawdust_recycled_scrap_donated=Wood_sawdust_recycled_scrap_wood_donated unk_sustainability_certification_wood_recycling=Unknown
% @importance 0.5

0.72::true_val(sustainability_certification_wood_recycling, sawdust_recycled_scrap_donated); 0.28::true_val(sustainability_certification_wood_recycling, unk_sustainability_certification_wood_recycling).
0.78::acc(s11, sustainability_certification_wood_recycling).
measured(s11, sustainability_certification_wood_recycling, sawdust_recycled_scrap_donated).
all_consistent(sustainability_certification_wood_recycling) :-
    (indep(s11), consistent(s11, sustainability_certification_wood_recycling) ; \+indep(s11)).
evidence(all_consistent(sustainability_certification_wood_recycling)).
query(true_val(sustainability_certification_wood_recycling, sawdust_recycled_scrap_donated)).
query(true_val(sustainability_certification_wood_recycling, unk_sustainability_certification_wood_recycling)).

% @attr sustainability_certification_eco_printing
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values eco_sublimation=Eco_sublimation_printing unk_sustainability_certification_eco_printing=Unknown
% @importance 0.45

0.95::true_val(sustainability_certification_eco_printing, eco_sublimation); 0.05::true_val(sustainability_certification_eco_printing, unk_sustainability_certification_eco_printing).
0.78::acc(s15, sustainability_certification_eco_printing).
0.78::acc(s11, sustainability_certification_eco_printing).
measured(s15, sustainability_certification_eco_printing, eco_sublimation).
measured(s11, sustainability_certification_eco_printing, eco_sublimation).
all_consistent(sustainability_certification_eco_printing) :-
    consistent(s15, sustainability_certification_eco_printing),
    (indep(s11), consistent(s11, sustainability_certification_eco_printing) ; \+indep(s11)).
evidence(all_consistent(sustainability_certification_eco_printing)).
query(true_val(sustainability_certification_eco_printing, eco_sublimation)).
query(true_val(sustainability_certification_eco_printing, unk_sustainability_certification_eco_printing)).

% @attr sustainability_certification_renewable_power
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values wind_water_power=Wind_and_water_generated_power unk_sustainability_certification_renewable_power=Unknown
% @importance 0.4

0.95::true_val(sustainability_certification_renewable_power, wind_water_power); 0.05::true_val(sustainability_certification_renewable_power, unk_sustainability_certification_renewable_power).
0.75::acc(s16, sustainability_certification_renewable_power).
0.72::acc(s42, sustainability_certification_renewable_power).
measured(s16, sustainability_certification_renewable_power, wind_water_power).
measured(s42, sustainability_certification_renewable_power, wind_water_power).
all_consistent(sustainability_certification_renewable_power) :-
    consistent(s16, sustainability_certification_renewable_power),
    consistent(s42, sustainability_certification_renewable_power).
evidence(all_consistent(sustainability_certification_renewable_power)).
query(true_val(sustainability_certification_renewable_power, wind_water_power)).
query(true_val(sustainability_certification_renewable_power, unk_sustainability_certification_renewable_power)).

% @attr sustainability_certification_renewable_wood
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values renewable_forest_products=Fast_growing_renewable_forest_products unk_sustainability_certification_renewable_wood=Unknown
% @importance 0.5

0.72::true_val(sustainability_certification_renewable_wood, renewable_forest_products); 0.28::true_val(sustainability_certification_renewable_wood, unk_sustainability_certification_renewable_wood).
0.78::acc(s11, sustainability_certification_renewable_wood).
measured(s11, sustainability_certification_renewable_wood, renewable_forest_products).
all_consistent(sustainability_certification_renewable_wood) :-
    (indep(s11), consistent(s11, sustainability_certification_renewable_wood) ; \+indep(s11)).
evidence(all_consistent(sustainability_certification_renewable_wood)).
query(true_val(sustainability_certification_renewable_wood, renewable_forest_products)).
query(true_val(sustainability_certification_renewable_wood, unk_sustainability_certification_renewable_wood)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values one_year_structural=1_year_manufacturer_warranty_structural_defects_only unk_warranty=Unknown
% @importance 0.85

0.95::true_val(warranty, one_year_structural); 0.05::true_val(warranty, unk_warranty).
0.90::acc(s11, warranty).
measured(s11, warranty, one_year_structural).
all_consistent(warranty) :-
    (indep(s11), consistent(s11, warranty) ; \+indep(s11)).
evidence(all_consistent(warranty)).
query(true_val(warranty, one_year_structural)).
query(true_val(warranty, unk_warranty)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 0.925

0.97::true_val(shape, tapered_directional); 0.03::true_val(shape, unk_shape).
0.93::acc(sm, shape).
0.93::acc(s1, shape).
measured(sm, shape, tapered_directional).
measured(s1, shape, tapered_directional).
all_consistent(shape) :- consistent(s1, shape), consistent(sm, shape).
evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values early_rise_directional_c3=Early_Rise_Directional_Camber_C3 unk_camber_type=Unknown
% @importance 0.9

0.81::true_val(camber_type, early_rise_directional_c3); 0.19::true_val(camber_type, unk_camber_type).
0.85::acc(s18, camber_type).
measured(s18, camber_type, early_rise_directional_c3).
all_consistent(camber_type) :-
    (indep(s18), consistent(s18, camber_type) ; \+indep(s18)).
evidence(all_consistent(camber_type)).
query(true_val(camber_type, early_rise_directional_c3)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values setback_camber_early_rise_nose=Setback_camber_early_rise_nose_float_turn_initiation unk_camber_description=Unknown
% @importance 0.9

0.81::true_val(camber_description, setback_camber_early_rise_nose); 0.19::true_val(camber_description, unk_camber_description).
0.85::acc(s18, camber_description).
measured(s18, camber_description, setback_camber_early_rise_nose).
all_consistent(camber_description) :-
    (indep(s18), consistent(s18, camber_description) ; \+indep(s18)).
evidence(all_consistent(camber_description)).
query(true_val(camber_description, setback_camber_early_rise_nose)).
query(true_val(camber_description, unk_camber_description)).

% @attr width_options
% @type categorical
% @canonical true
% @original_name width_options
% @values mid_wide=Mid_Wide unk_width_options=Unknown
% @importance 1.0

0.90::true_val(width_options, mid_wide); 0.10::true_val(width_options, unk_width_options).
0.93::acc(s1, width_options).
measured(s1, width_options, mid_wide).
all_consistent(width_options) :- consistent(s1, width_options).
evidence(all_consistent(width_options)).
query(true_val(width_options, mid_wide)).
query(true_val(width_options, unk_width_options)).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values progressive_elliptical=Progressive_Elliptical unk_sidecut_type=Unknown
% @importance 1.0

0.90::true_val(sidecut_type, progressive_elliptical); 0.10::true_val(sidecut_type, unk_sidecut_type).
0.93::acc(s1, sidecut_type).
measured(s1, sidecut_type, progressive_elliptical).
all_consistent(sidecut_type) :- consistent(s1, sidecut_type).
evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, progressive_elliptical)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr taper
% @type numeric
% @unit mm
% @canonical true
% @original_name taper
% @values v20=20.0 unk_taper=Unknown
% @importance 0.7

0.68::true_val(taper, v20); 0.32::true_val(taper, unk_taper).
0.82::acc(s8, taper).
measured(s8, taper, v20).
all_consistent(taper) :- (indep(s8), consistent(s8, taper) ; \+indep(s8)).
evidence(all_consistent(taper)).
query(true_val(taper, v20)).
query(true_val(taper, unk_taper)).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values directional_flex=Directional_flex unk_flex_direction=Unknown
% @importance 1.0

0.90::true_val(flex_direction, directional_flex); 0.10::true_val(flex_direction, unk_flex_direction).
0.93::acc(s1, flex_direction).
measured(s1, flex_direction, directional_flex).
all_consistent(flex_direction) :- consistent(s1, flex_direction).
evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional_flex)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values firm=Firm medium_stiff=Medium_Stiff
% @importance 0.95

0.50::true_val(flex_feel, firm); 0.50::true_val(flex_feel, medium_stiff).
0.90::acc(s1, flex_feel).
0.83::acc(s18, flex_feel).
measured(s1, flex_feel, firm).
measured(s18, flex_feel, medium_stiff).
all_consistent(flex_feel) :-
    consistent(s1, flex_feel),
    (indep(s18), consistent(s18, flex_feel) ; \+indep(s18)).
evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, firm)).
query(true_val(flex_feel, medium_stiff)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 0.85

0.95::true_val(mounting_pattern, inserts_2x4); 0.05::true_val(mounting_pattern, unk_mounting_pattern).
0.90::acc(sm, mounting_pattern).
measured(sm, mounting_pattern, inserts_2x4).
all_consistent(mounting_pattern) :- consistent(sm, mounting_pattern).
evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v6_5=6.5 v7=7.0 v8=8.0
% @importance 0.88

0.38::true_val(flex_rating_10, v6_5); 0.42::true_val(flex_rating_10, v7); 0.20::true_val(flex_rating_10, v8).
0.92::acc(s20, flex_rating_10).
0.70::acc(sm, flex_rating_10).
0.60::acc(s21, flex_rating_10).
0.65::acc(s22, flex_rating_10).
measured(s20, flex_rating_10, v6_5).
measured(sm, flex_rating_10, v8).
measured(s21, flex_rating_10, v7).
measured(s22, flex_rating_10, v7).
all_consistent(flex_rating_10) :-
    consistent(s20, flex_rating_10),
    consistent(sm, flex_rating_10),
    (indep(s21), consistent(s21, flex_rating_10) ; \+indep(s21)),
    (indep(s22), consistent(s22, flex_rating_10) ; \+indep(s22)).
evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v6_5)).
query(true_val(flex_rating_10, v7)).
query(true_val(flex_rating_10, v8)).

% @attr flex_rating_10_manufacturer_152_5
% @type numeric
% @unit /10
% @canonical false
% @original_name flex_rating_10_manufacturer
% @values v6=6.0 unk_flex_rating_10_manufacturer_152_5=Unknown
% @importance 1.0

0.95::true_val(flex_rating_10_manufacturer_152_5, v6); 0.05::true_val(flex_rating_10_manufacturer_152_5, unk_flex_rating_10_manufacturer_152_5).
0.95::acc(s20, flex_rating_10_manufacturer_152_5).
measured(s20, flex_rating_10_manufacturer_152_5, v6).
all_consistent(flex_rating_10_manufacturer_152_5) :- consistent(s20, flex_rating_10_manufacturer_152_5).
evidence(all_consistent(flex_rating_10_manufacturer_152_5)).
query(true_val(flex_rating_10_manufacturer_152_5, v6)).
query(true_val(flex_rating_10_manufacturer_152_5, unk_flex_rating_10_manufacturer_152_5)).

% @attr flex_rating_10_manufacturer_161_5
% @type numeric
% @unit /10
% @canonical false
% @original_name flex_rating_10_manufacturer
% @values v7=7.0 unk_flex_rating_10_manufacturer_161_5=Unknown
% @importance 1.0

0.95::true_val(flex_rating_10_manufacturer_161_5, v7); 0.05::true_val(flex_rating_10_manufacturer_161_5, unk_flex_rating_10_manufacturer_161_5).
0.95::acc(s20, flex_rating_10_manufacturer_161_5).
measured(s20, flex_rating_10_manufacturer_161_5, v7).
all_consistent(flex_rating_10_manufacturer_161_5) :- consistent(s20, flex_rating_10_manufacturer_161_5).
evidence(all_consistent(flex_rating_10_manufacturer_161_5)).
query(true_val(flex_rating_10_manufacturer_161_5, v7)).
query(true_val(flex_rating_10_manufacturer_161_5, unk_flex_rating_10_manufacturer_161_5)).

% @attr flex_rating_10_the_good_ride
% @type categorical
% @canonical false
% @original_name flex_rating_10_the_good_ride
% @values medium=Medium unk_flex_rating_10_the_good_ride=Unknown
% @importance 0.95

0.72::true_val(flex_rating_10_the_good_ride, medium); 0.28::true_val(flex_rating_10_the_good_ride, unk_flex_rating_10_the_good_ride).
0.80::acc(s8, flex_rating_10_the_good_ride).
measured(s8, flex_rating_10_the_good_ride, medium).
all_consistent(flex_rating_10_the_good_ride) :- (indep(s8), consistent(s8, flex_rating_10_the_good_ride) ; \+indep(s8)).
evidence(all_consistent(flex_rating_10_the_good_ride)).
query(true_val(flex_rating_10_the_good_ride, medium)).
query(true_val(flex_rating_10_the_good_ride, unk_flex_rating_10_the_good_ride)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values s152_5_157_5_161_5=152.5_157.5_161.5cm unk_available_sizes=Unknown
% @importance 1.0

0.95::true_val(available_sizes, s152_5_157_5_161_5); 0.05::true_val(available_sizes, unk_available_sizes).
0.96::acc(s20, available_sizes).
measured(s20, available_sizes, s152_5_157_5_161_5).
all_consistent(available_sizes) :- consistent(s20, available_sizes).
evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, s152_5_157_5_161_5)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr contact_length_size_152_5
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size
% @values v110_5=110.5 unk_contact_length_size_152_5=Unknown
% @importance 1.0

0.95::true_val(contact_length_size_152_5, v110_5); 0.05::true_val(contact_length_size_152_5, unk_contact_length_size_152_5).
0.96::acc(s20, contact_length_size_152_5).
measured(s20, contact_length_size_152_5, v110_5).
all_consistent(contact_length_size_152_5) :- consistent(s20, contact_length_size_152_5).
evidence(all_consistent(contact_length_size_152_5)).
query(true_val(contact_length_size_152_5, v110_5)).
query(true_val(contact_length_size_152_5, unk_contact_length_size_152_5)).

% @attr sidecut_radius_size_152_5
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v7_5_6_5=7.5-6.5 unk_sidecut_radius_size_152_5=Unknown
% @importance 1.0

0.95::true_val(sidecut_radius_size_152_5, v7_5_6_5); 0.05::true_val(sidecut_radius_size_152_5, unk_sidecut_radius_size_152_5).
0.96::acc(s20, sidecut_radius_size_152_5).
measured(s20, sidecut_radius_size_152_5, v7_5_6_5).
all_consistent(sidecut_radius_size_152_5) :- consistent(s20, sidecut_radius_size_152_5).
evidence(all_consistent(sidecut_radius_size_152_5)).
query(true_val(sidecut_radius_size_152_5, v7_5_6_5)).
query(true_val(sidecut_radius_size_152_5, unk_sidecut_radius_size_152_5)).

% @attr tip_tail_width_size_152_5
% @type categorical
% @unit cm
% @canonical false
% @original_name tip_tail_width_size
% @values v30_7_28_7=30.7_28.7 unk_tip_tail_width_size_152_5=Unknown
% @importance 1.0

0.95::true_val(tip_tail_width_size_152_5, v30_7_28_7); 0.05::true_val(tip_tail_width_size_152_5, unk_tip_tail_width_size_152_5).
0.96::acc(s20, tip_tail_width_size_152_5).
measured(s20, tip_tail_width_size_152_5, v30_7_28_7).
all_consistent(tip_tail_width_size_152_5) :- consistent(s20, tip_tail_width_size_152_5).
evidence(all_consistent(tip_tail_width_size_152_5)).
query(true_val(tip_tail_width_size_152_5, v30_7_28_7)).
query(true_val(tip_tail_width_size_152_5, unk_tip_tail_width_size_152_5)).

% @attr waist_width_152_5
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 152.5cm
% @values v25_6=25.6 unk_waist_width_152_5=Unknown
% @importance 1.0

0.95::true_val(waist_width_152_5, v25_6); 0.05::true_val(waist_width_152_5, unk_waist_width_152_5).
0.96::acc(s20, waist_width_152_5).
measured(s20, waist_width_152_5, v25_6).
all_consistent(waist_width_152_5) :- consistent(s20, waist_width_152_5).
evidence(all_consistent(waist_width_152_5)).
query(true_val(waist_width_152_5, v25_6)).
query(true_val(waist_width_152_5, unk_waist_width_152_5)).

% @attr planing_surface_152_5
% @type numeric
% @unit sqin
% @canonical false
% @original_name Planing surface 152.5cm
% @values v613=613.0 unk_planing_surface_152_5=Unknown
% @importance 1.0

0.95::true_val(planing_surface_152_5, v613); 0.05::true_val(planing_surface_152_5, unk_planing_surface_152_5).
0.96::acc(s20, planing_surface_152_5).
measured(s20, planing_surface_152_5, v613).
all_consistent(planing_surface_152_5) :- consistent(s20, planing_surface_152_5).
evidence(all_consistent(planing_surface_152_5)).
query(true_val(planing_surface_152_5, v613)).
query(true_val(planing_surface_152_5, unk_planing_surface_152_5)).

% @attr stance_width_range_size_152_5
% @type categorical
% @unit inches_and_cm
% @canonical false
% @original_name stance_width_range_size
% @values v19_5_24_25_2_5sb=19.5_to_24.25in_2.5in_setback unk_stance_width_range_size_152_5=Unknown
% @importance 1.0

0.95::true_val(stance_width_range_size_152_5, v19_5_24_25_2_5sb); 0.05::true_val(stance_width_range_size_152_5, unk_stance_width_range_size_152_5).
0.96::acc(s20, stance_width_range_size_152_5).
measured(s20, stance_width_range_size_152_5, v19_5_24_25_2_5sb).
all_consistent(stance_width_range_size_152_5) :- consistent(s20, stance_width_range_size_152_5).
evidence(all_consistent(stance_width_range_size_152_5)).
query(true_val(stance_width_range_size_152_5, v19_5_24_25_2_5sb)).
query(true_val(stance_width_range_size_152_5, unk_stance_width_range_size_152_5)).

% @attr recommended_weight_range_size_152_5
% @type categorical
% @unit lbs
% @canonical false
% @original_name recommended_weight_range_size
% @values v110_plus_mfr=110_plus_lbs v110_170_tgr=110_to_170_lbs
% @importance 0.975

0.50::true_val(recommended_weight_range_size_152_5, v110_plus_mfr); 0.50::true_val(recommended_weight_range_size_152_5, v110_170_tgr).
0.92::acc(s20, recommended_weight_range_size_152_5).
0.82::acc(s8, recommended_weight_range_size_152_5).
measured(s20, recommended_weight_range_size_152_5, v110_plus_mfr).
measured(s8, recommended_weight_range_size_152_5, v110_170_tgr).
all_consistent(recommended_weight_range_size_152_5) :-
    consistent(s20, recommended_weight_range_size_152_5),
    (indep(s8), consistent(s8, recommended_weight_range_size_152_5) ; \+indep(s8)).
evidence(all_consistent(recommended_weight_range_size_152_5)).
query(true_val(recommended_weight_range_size_152_5, v110_plus_mfr)).
query(true_val(recommended_weight_range_size_152_5, v110_170_tgr)).

% @attr contact_length_size
% @type numeric
% @unit cm
% @canonical true
% @original_name contact_length_size
% @values v114_5=114.5 unk_contact_length_size=Unknown
% @importance 1.0

0.95::true_val(contact_length_size, v114_5); 0.05::true_val(contact_length_size, unk_contact_length_size).
0.96::acc(s20, contact_length_size).
measured(s20, contact_length_size, v114_5).
all_consistent(contact_length_size) :- consistent(s20, contact_length_size).
evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v114_5)).
query(true_val(contact_length_size, unk_contact_length_size)).

% @attr sidecut_radius_size
% @type categorical
% @unit m
% @canonical true
% @original_name sidecut_radius_size
% @values v7_5_6_5=7.5-6.5 unk_sidecut_radius_size=Unknown
% @importance 1.0

0.95::true_val(sidecut_radius_size, v7_5_6_5); 0.05::true_val(sidecut_radius_size, unk_sidecut_radius_size).
0.96::acc(s20, sidecut_radius_size).
measured(s20, sidecut_radius_size, v7_5_6_5).
all_consistent(sidecut_radius_size) :- consistent(s20, sidecut_radius_size).
evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_5_6_5)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr tip_tail_width_size
% @type categorical
% @unit cm
% @canonical true
% @original_name tip_tail_width_size
% @values v31_7_29_7=31.7_29.7 unk_tip_tail_width_size=Unknown
% @importance 1.0

0.95::true_val(tip_tail_width_size, v31_7_29_7); 0.05::true_val(tip_tail_width_size, unk_tip_tail_width_size).
0.96::acc(s20, tip_tail_width_size).
measured(s20, tip_tail_width_size, v31_7_29_7).
all_consistent(tip_tail_width_size) :- consistent(s20, tip_tail_width_size).
evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v31_7_29_7)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr waist_width_157_5
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 157.5cm
% @values v26_4=26.4 unk_waist_width_157_5=Unknown
% @importance 1.0

0.95::true_val(waist_width_157_5, v26_4); 0.05::true_val(waist_width_157_5, unk_waist_width_157_5).
0.96::acc(s20, waist_width_157_5).
measured(s20, waist_width_157_5, v26_4).
all_consistent(waist_width_157_5) :- consistent(s20, waist_width_157_5).
evidence(all_consistent(waist_width_157_5)).
query(true_val(waist_width_157_5, v26_4)).
query(true_val(waist_width_157_5, unk_waist_width_157_5)).

% @attr planing_surface_157_5
% @type numeric
% @unit sqin
% @canonical false
% @original_name Planing surface 157.5cm
% @values v654=654.0 unk_planing_surface_157_5=Unknown
% @importance 1.0

0.95::true_val(planing_surface_157_5, v654); 0.05::true_val(planing_surface_157_5, unk_planing_surface_157_5).
0.96::acc(s20, planing_surface_157_5).
measured(s20, planing_surface_157_5, v654).
all_consistent(planing_surface_157_5) :- consistent(s20, planing_surface_157_5).
evidence(all_consistent(planing_surface_157_5)).
query(true_val(planing_surface_157_5, v654)).
query(true_val(planing_surface_157_5, unk_planing_surface_157_5)).

% @attr stance_width_range_size
% @type categorical
% @unit inches
% @canonical true
% @original_name stance_width_range_size
% @values v19_5_24_25_2_5sb=19.5_to_24.25in_2.5in_setback unk_stance_width_range_size=Unknown
% @importance 1.0

0.95::true_val(stance_width_range_size, v19_5_24_25_2_5sb); 0.05::true_val(stance_width_range_size, unk_stance_width_range_size).
0.96::acc(s20, stance_width_range_size).
measured(s20, stance_width_range_size, v19_5_24_25_2_5sb).
all_consistent(stance_width_range_size) :- consistent(s20, stance_width_range_size).
evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v19_5_24_25_2_5sb)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr recommended_weight_range_size
% @type categorical
% @unit lbs
% @canonical true
% @original_name recommended_weight_range_size
% @values v140_plus_mfr=140_plus_lbs v150_210_tgr=150_to_210_lbs
% @importance 0.975

0.50::true_val(recommended_weight_range_size, v140_plus_mfr); 0.50::true_val(recommended_weight_range_size, v150_210_tgr).
0.92::acc(s20, recommended_weight_range_size).
0.82::acc(s8, recommended_weight_range_size).
measured(s20, recommended_weight_range_size, v140_plus_mfr).
measured(s8, recommended_weight_range_size, v150_210_tgr).
all_consistent(recommended_weight_range_size) :-
    consistent(s20, recommended_weight_range_size),
    (indep(s8), consistent(s8, recommended_weight_range_size) ; \+indep(s8)).
evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, v140_plus_mfr)).
query(true_val(recommended_weight_range_size, v150_210_tgr)).

% @attr contact_length_size_161_5
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size
% @values v118_5=118.5 unk_contact_length_size_161_5=Unknown
% @importance 1.0

0.95::true_val(contact_length_size_161_5, v118_5); 0.05::true_val(contact_length_size_161_5, unk_contact_length_size_161_5).
0.96::acc(s20, contact_length_size_161_5).
measured(s20, contact_length_size_161_5, v118_5).
all_consistent(contact_length_size_161_5) :- consistent(s20, contact_length_size_161_5).
evidence(all_consistent(contact_length_size_161_5)).
query(true_val(contact_length_size_161_5, v118_5)).
query(true_val(contact_length_size_161_5, unk_contact_length_size_161_5)).

% @attr sidecut_radius_size_161_5
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v7_5_6_5=7.5-6.5 unk_sidecut_radius_size_161_5=Unknown
% @importance 1.0

0.95::true_val(sidecut_radius_size_161_5, v7_5_6_5); 0.05::true_val(sidecut_radius_size_161_5, unk_sidecut_radius_size_161_5).
0.96::acc(s20, sidecut_radius_size_161_5).
measured(s20, sidecut_radius_size_161_5, v7_5_6_5).
all_consistent(sidecut_radius_size_161_5) :- consistent(s20, sidecut_radius_size_161_5).
evidence(all_consistent(sidecut_radius_size_161_5)).
query(true_val(sidecut_radius_size_161_5, v7_5_6_5)).
query(true_val(sidecut_radius_size_161_5, unk_sidecut_radius_size_161_5)).

% @attr tip_tail_width_size_161_5
% @type categorical
% @unit cm
% @canonical false
% @original_name tip_tail_width_size
% @values v31_9_29_9=31.9_29.9 unk_tip_tail_width_size_161_5=Unknown
% @importance 1.0

0.95::true_val(tip_tail_width_size_161_5, v31_9_29_9); 0.05::true_val(tip_tail_width_size_161_5, unk_tip_tail_width_size_161_5).
0.96::acc(s20, tip_tail_width_size_161_5).
measured(s20, tip_tail_width_size_161_5, v31_9_29_9).
all_consistent(tip_tail_width_size_161_5) :- consistent(s20, tip_tail_width_size_161_5).
evidence(all_consistent(tip_tail_width_size_161_5)).
query(true_val(tip_tail_width_size_161_5, v31_9_29_9)).
query(true_val(tip_tail_width_size_161_5, unk_tip_tail_width_size_161_5)).

% @attr waist_width_161_5
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 161.5cm
% @values v26_5=26.5 unk_waist_width_161_5=Unknown
% @importance 1.0

0.95::true_val(waist_width_161_5, v26_5); 0.05::true_val(waist_width_161_5, unk_waist_width_161_5).
0.96::acc(s20, waist_width_161_5).
measured(s20, waist_width_161_5, v26_5).
all_consistent(waist_width_161_5) :- consistent(s20, waist_width_161_5).
evidence(all_consistent(waist_width_161_5)).
query(true_val(waist_width_161_5, v26_5)).
query(true_val(waist_width_161_5, unk_waist_width_161_5)).

% @attr planing_surface_161_5
% @type numeric
% @unit sqin
% @canonical false
% @original_name Planing surface 161.5cm
% @values v674=674.0 unk_planing_surface_161_5=Unknown
% @importance 1.0

0.95::true_val(planing_surface_161_5, v674); 0.05::true_val(planing_surface_161_5, unk_planing_surface_161_5).
0.96::acc(s20, planing_surface_161_5).
measured(s20, planing_surface_161_5, v674).
all_consistent(planing_surface_161_5) :- consistent(s20, planing_surface_161_5).
evidence(all_consistent(planing_surface_161_5)).
query(true_val(planing_surface_161_5, v674)).
query(true_val(planing_surface_161_5, unk_planing_surface_161_5)).

% @attr stance_width_range_size_161_5
% @type categorical
% @unit inches
% @canonical false
% @original_name stance_width_range_size
% @values v19_5_24_25_2_5sb=19.5_to_24.25in_2.5in_setback unk_stance_width_range_size_161_5=Unknown
% @importance 1.0

0.95::true_val(stance_width_range_size_161_5, v19_5_24_25_2_5sb); 0.05::true_val(stance_width_range_size_161_5, unk_stance_width_range_size_161_5).
0.96::acc(s20, stance_width_range_size_161_5).
measured(s20, stance_width_range_size_161_5, v19_5_24_25_2_5sb).
all_consistent(stance_width_range_size_161_5) :- consistent(s20, stance_width_range_size_161_5).
evidence(all_consistent(stance_width_range_size_161_5)).
query(true_val(stance_width_range_size_161_5, v19_5_24_25_2_5sb)).
query(true_val(stance_width_range_size_161_5, unk_stance_width_range_size_161_5)).

% @attr recommended_weight_range_size_161_5
% @type categorical
% @unit lbs
% @canonical false
% @original_name recommended_weight_range_size
% @values v150_plus_mfr=150_plus_lbs v150_220_tgr=150_to_220_lbs
% @importance 0.975

0.50::true_val(recommended_weight_range_size_161_5, v150_plus_mfr); 0.50::true_val(recommended_weight_range_size_161_5, v150_220_tgr).
0.92::acc(s20, recommended_weight_range_size_161_5).
0.82::acc(s8, recommended_weight_range_size_161_5).
measured(s20, recommended_weight_range_size_161_5, v150_plus_mfr).
measured(s8, recommended_weight_range_size_161_5, v150_220_tgr).
all_consistent(recommended_weight_range_size_161_5) :-
    consistent(s20, recommended_weight_range_size_161_5),
    (indep(s8), consistent(s8, recommended_weight_range_size_161_5) ; \+indep(s8)).
evidence(all_consistent(recommended_weight_range_size_161_5)).
query(true_val(recommended_weight_range_size_161_5, v150_plus_mfr)).
query(true_val(recommended_weight_range_size_161_5, v150_220_tgr)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values op_aspen_paulownia=OP_75pct_Aspen_25pct_Paulownia unk_core_material=Unknown
% @importance 0.925

0.97::true_val(core_material, op_aspen_paulownia); 0.03::true_val(core_material, unk_core_material).
0.93::acc(s1, core_material).
0.80::acc(s23, core_material).
measured(s1, core_material, op_aspen_paulownia).
measured(s23, core_material, op_aspen_paulownia).
all_consistent(core_material) :-
    consistent(s1, core_material),
    (indep(s2), consistent(s23, core_material) ; \+indep(s2)).
evidence(all_consistent(core_material)).
query(true_val(core_material, op_aspen_paulownia)).
query(true_val(core_material, unk_core_material)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values triax_biax_fiberglass=Triaxial_Biaxial_Fiberglass unk_laminate=Unknown
% @importance 0.85

0.62::true_val(laminate, triax_biax_fiberglass); 0.38::true_val(laminate, unk_laminate).
0.65::acc(s23, laminate).
measured(s23, laminate, triax_biax_fiberglass).
all_consistent(laminate) :- (indep(s2), consistent(s23, laminate) ; \+indep(s2)).
evidence(all_consistent(laminate)).
query(true_val(laminate, triax_biax_fiberglass)).
query(true_val(laminate, unk_laminate)).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values sintered_knife_cut_uhmw=Sintered_Knife_Cut_UHMW unk_base_type=Unknown
% @importance 0.9

0.81::true_val(base_type, sintered_knife_cut_uhmw); 0.19::true_val(base_type, unk_base_type).
0.85::acc(s18, base_type).
measured(s18, base_type, sintered_knife_cut_uhmw).
all_consistent(base_type) :-
    (indep(s18), consistent(s18, base_type) ; \+indep(s18)).
evidence(all_consistent(base_type)).
query(true_val(base_type, sintered_knife_cut_uhmw)).
query(true_val(base_type, unk_base_type)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values optimized_wax_retention=Optimized_wax_retention_and_toughness unk_base_material=Unknown
% @importance 0.9

0.81::true_val(base_material, optimized_wax_retention); 0.19::true_val(base_material, unk_base_material).
0.85::acc(s18, base_material).
measured(s18, base_material, optimized_wax_retention).
all_consistent(base_material) :-
    (indep(s18), consistent(s18, base_material) ; \+indep(s18)).
evidence(all_consistent(base_material)).
query(true_val(base_material, optimized_wax_retention)).
query(true_val(base_material, unk_base_material)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values birch_internal=Birch_Internal_Sidewalls unk_sidewall_material=Unknown
% @importance 0.85

0.81::true_val(sidewall_material, birch_internal); 0.19::true_val(sidewall_material, unk_sidewall_material).
0.85::acc(s11, sidewall_material).
measured(s11, sidewall_material, birch_internal).
all_consistent(sidewall_material) :-
    (indep(s11), consistent(s11, sidewall_material) ; \+indep(s11)).
evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, birch_internal)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr sidewall_material_uhmw
% @type categorical
% @canonical false
% @original_name sidewall_material
% @values uhmw_sintered=UHMW_Sintered_Sidewalls unk_sidewall_material_uhmw=Unknown
% @importance 0.85

0.81::true_val(sidewall_material_uhmw, uhmw_sintered); 0.19::true_val(sidewall_material_uhmw, unk_sidewall_material_uhmw).
0.85::acc(s11, sidewall_material_uhmw).
measured(s11, sidewall_material_uhmw, uhmw_sintered).
all_consistent(sidewall_material_uhmw) :-
    (indep(s11), consistent(s11, sidewall_material_uhmw) ; \+indep(s11)).
evidence(all_consistent(sidewall_material_uhmw)).
query(true_val(sidewall_material_uhmw, uhmw_sintered)).
query(true_val(sidewall_material_uhmw, unk_sidewall_material_uhmw)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values uhmw_tip_tail_deflection=UHMW_Tip_Tail_Impact_Deflection unk_construction_material_innovation=Unknown
% @importance 0.825

0.90::true_val(construction_material_innovation, uhmw_tip_tail_deflection); 0.10::true_val(construction_material_innovation, unk_construction_material_innovation).
0.88::acc(sm, construction_material_innovation).
0.82::acc(s8, construction_material_innovation).
measured(sm, construction_material_innovation, uhmw_tip_tail_deflection).
measured(s8, construction_material_innovation, uhmw_tip_tail_deflection).
all_consistent(construction_material_innovation) :-
    consistent(sm, construction_material_innovation),
    (indep(s8), consistent(s8, construction_material_innovation) ; \+indep(s8)).
evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, uhmw_tip_tail_deflection)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values magne_traction_present=Magne_Traction_present not_present_older=Not_present_on_older_models
% @importance 0.8

0.90::true_val(edge_technology, magne_traction_present); 0.10::true_val(edge_technology, not_present_older).
0.88::acc(s11, edge_technology).
0.80::acc(s23, edge_technology).
0.78::acc(s22, edge_technology).
0.78::acc(s31, edge_technology).
0.35::acc(s5, edge_technology).
0.35::acc(s38, edge_technology).
measured(s11, edge_technology, magne_traction_present).
measured(s23, edge_technology, magne_traction_present).
measured(s22, edge_technology, magne_traction_present).
measured(s31, edge_technology, magne_traction_present).
measured(s5, edge_technology, not_present_older).
measured(s38, edge_technology, not_present_older).
all_consistent(edge_technology) :-
    (indep(s11), consistent(s11, edge_technology) ; \+indep(s11)),
    (indep(s2), consistent(s23, edge_technology) ; \+indep(s2)),
    (indep(s22), consistent(s22, edge_technology) ; \+indep(s22)),
    (indep(s31), consistent(s31, edge_technology) ; \+indep(s31)),
    (indep(s5), consistent(s5, edge_technology) ; \+indep(s5)),
    (indep(s38), consistent(s38, edge_technology) ; \+indep(s38)).
evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, magne_traction_present)).
query(true_val(edge_technology, not_present_older)).

% @attr topsheet
% @type categorical
% @canonical true
% @original_name topsheet
% @values eco_sub_poly=Eco_Sublimated_Poly_Topsheet unk_topsheet=Unknown
% @importance 0.85

0.62::true_val(topsheet, eco_sub_poly); 0.38::true_val(topsheet, unk_topsheet).
0.65::acc(s23, topsheet).
measured(s23, topsheet, eco_sub_poly).
all_consistent(topsheet) :- (indep(s2), consistent(s23, topsheet) ; \+indep(s2)).
evidence(all_consistent(topsheet)).
query(true_val(topsheet, eco_sub_poly)).
query(true_val(topsheet, unk_topsheet)).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v659_99=659.99 unk_price_usd_msrp=Unknown
% @importance 0.9

0.97::true_val(price_usd_msrp, v659_99); 0.03::true_val(price_usd_msrp, unk_price_usd_msrp).
0.95::acc(s20, price_usd_msrp).
0.80::acc(s24, price_usd_msrp).
0.80::acc(s25, price_usd_msrp).
measured(s20, price_usd_msrp, v659_99).
measured(s24, price_usd_msrp, v659_99).
measured(s25, price_usd_msrp, v659_99).
all_consistent(price_usd_msrp) :-
    consistent(s20, price_usd_msrp),
    (indep(s24), consistent(s24, price_usd_msrp) ; \+indep(s24)),
    (indep(s25), consistent(s25, price_usd_msrp) ; \+indep(s25)).
evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v659_99)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_evo
% @values v461_99=461.99 unk_price_usd_evo=Unknown
% @importance 0.95

0.64::true_val(price_usd_evo, v461_99); 0.36::true_val(price_usd_evo, unk_price_usd_evo).
0.72::acc(s26, price_usd_evo).
measured(s26, price_usd_evo, v461_99).
all_consistent(price_usd_evo) :- (indep(s8), consistent(s26, price_usd_evo) ; \+indep(s8)).
evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v461_99)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_tactics
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_tactics
% @values v461_99=461.99 unk_price_usd_tactics=Unknown
% @importance 0.9

0.95::true_val(price_usd_tactics, v461_99); 0.05::true_val(price_usd_tactics, unk_price_usd_tactics).
0.88::acc(s27, price_usd_tactics).
0.72::acc(s26, price_usd_tactics).
measured(s27, price_usd_tactics, v461_99).
measured(s26, price_usd_tactics, v461_99).
all_consistent(price_usd_tactics) :-
    (indep(s11), consistent(s27, price_usd_tactics) ; \+indep(s11)),
    (indep(s8), consistent(s26, price_usd_tactics) ; \+indep(s8)).
evidence(all_consistent(price_usd_tactics)).
query(true_val(price_usd_tactics, v461_99)).
query(true_val(price_usd_tactics, unk_price_usd_tactics)).

% @attr sale_price_the_house
% @type numeric
% @unit USD
% @canonical false
% @original_name Sale price (The House)
% @values v461_99=461.99 unk_sale_price_the_house=Unknown
% @importance 0.95

0.64::true_val(sale_price_the_house, v461_99); 0.36::true_val(sale_price_the_house, unk_sale_price_the_house).
0.72::acc(s26, sale_price_the_house).
measured(s26, sale_price_the_house, v461_99).
all_consistent(sale_price_the_house) :- (indep(s8), consistent(s26, sale_price_the_house) ; \+indep(s8)).
evidence(all_consistent(sale_price_the_house)).
query(true_val(sale_price_the_house, v461_99)).
query(true_val(sale_price_the_house, unk_sale_price_the_house)).

% @attr price_usd_backcountry
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_backcountry
% @values v527_99=527.99 unk_price_usd_backcountry=Unknown
% @importance 0.95

0.64::true_val(price_usd_backcountry, v527_99); 0.36::true_val(price_usd_backcountry, unk_price_usd_backcountry).
0.72::acc(s26, price_usd_backcountry).
measured(s26, price_usd_backcountry, v527_99).
all_consistent(price_usd_backcountry) :- (indep(s8), consistent(s26, price_usd_backcountry) ; \+indep(s8)).
evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v527_99)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

% @attr sale_price_sun_ski
% @type numeric
% @unit USD
% @canonical false
% @original_name Sale price (Sun & Ski Sports)
% @values v527_93=527.93 unk_sale_price_sun_ski=Unknown
% @importance 0.95

0.64::true_val(sale_price_sun_ski, v527_93); 0.36::true_val(sale_price_sun_ski, unk_sale_price_sun_ski).
0.72::acc(s26, sale_price_sun_ski).
measured(s26, sale_price_sun_ski, v527_93).
all_consistent(sale_price_sun_ski) :- (indep(s8), consistent(s26, sale_price_sun_ski) ; \+indep(s8)).
evidence(all_consistent(sale_price_sun_ski)).
query(true_val(sale_price_sun_ski, v527_93)).
query(true_val(sale_price_sun_ski, unk_sale_price_sun_ski)).

% @attr sale_price_gravity_coalition
% @type numeric
% @unit USD
% @canonical false
% @original_name Sale price (Gravity Coalition)
% @values v499_97=499.97 unk_sale_price_gravity_coalition=Unknown
% @importance 0.95

0.64::true_val(sale_price_gravity_coalition, v499_97); 0.36::true_val(sale_price_gravity_coalition, unk_sale_price_gravity_coalition).
0.72::acc(s26, sale_price_gravity_coalition).
measured(s26, sale_price_gravity_coalition, v499_97).
all_consistent(sale_price_gravity_coalition) :- (indep(s8), consistent(s26, sale_price_gravity_coalition) ; \+indep(s8)).
evidence(all_consistent(sale_price_gravity_coalition)).
query(true_val(sale_price_gravity_coalition, v499_97)).
query(true_val(sale_price_gravity_coalition, unk_sale_price_gravity_coalition)).

% @attr sale_price_ski_country
% @type numeric
% @unit USD
% @canonical false
% @original_name Sale price (Ski Country Sports)
% @values v520_98=520.98 unk_sale_price_ski_country=Unknown
% @importance 0.7

0.51::true_val(sale_price_ski_country, v520_98); 0.49::true_val(sale_price_ski_country, unk_sale_price_ski_country).
0.55::acc(s28, sale_price_ski_country).
measured(s28, sale_price_ski_country, v520_98).
all_consistent(sale_price_ski_country) :- (indep(s28), consistent(s28, sale_price_ski_country) ; \+indep(s28)).
evidence(all_consistent(sale_price_ski_country)).
query(true_val(sale_price_ski_country, v520_98)).
query(true_val(sale_price_ski_country, unk_sale_price_ski_country)).

% @attr price_usd_msrp_implied_sale
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_msrp
% @values v461_99=461.99 unk_price_usd_msrp_implied_sale=Unknown
% @importance 0.85

0.72::true_val(price_usd_msrp_implied_sale, v461_99); 0.28::true_val(price_usd_msrp_implied_sale, unk_price_usd_msrp_implied_sale).
0.82::acc(s29, price_usd_msrp_implied_sale).
measured(s29, price_usd_msrp_implied_sale, v461_99).
all_consistent(price_usd_msrp_implied_sale) :- consistent(s29, price_usd_msrp_implied_sale).
evidence(all_consistent(price_usd_msrp_implied_sale)).
query(true_val(price_usd_msrp_implied_sale, v461_99)).
query(true_val(price_usd_msrp_implied_sale, unk_price_usd_msrp_implied_sale)).

% @attr price_gbp_lib_tech
% @type numeric
% @unit GBP
% @canonical false
% @original_name Price (GBP, Lib Tech UK site)
% @values v584_99=584.99 unk_price_gbp_lib_tech=Unknown
% @importance 0.7

0.86::true_val(price_gbp_lib_tech, v584_99); 0.14::true_val(price_gbp_lib_tech, unk_price_gbp_lib_tech).
0.90::acc(s30, price_gbp_lib_tech).
measured(s30, price_gbp_lib_tech, v584_99).
all_consistent(price_gbp_lib_tech) :- (indep(s30), consistent(s30, price_gbp_lib_tech) ; \+indep(s30)).
evidence(all_consistent(price_gbp_lib_tech)).
query(true_val(price_gbp_lib_tech, v584_99)).
query(true_val(price_gbp_lib_tech, unk_price_gbp_lib_tech)).

% @attr price_gbp_snowboard_asylum
% @type categorical
% @unit GBP
% @canonical false
% @original_name Price (GBP, Snowboard Asylum)
% @values v584_95_sale_409_46=584.95_sale_409.46 unk_price_gbp_snowboard_asylum=Unknown
% @importance 0.7

0.68::true_val(price_gbp_snowboard_asylum, v584_95_sale_409_46); 0.32::true_val(price_gbp_snowboard_asylum, unk_price_gbp_snowboard_asylum).
0.72::acc(s31, price_gbp_snowboard_asylum).
measured(s31, price_gbp_snowboard_asylum, v584_95_sale_409_46).
all_consistent(price_gbp_snowboard_asylum) :- (indep(s31), consistent(s31, price_gbp_snowboard_asylum) ; \+indep(s31)).
evidence(all_consistent(price_gbp_snowboard_asylum)).
query(true_val(price_gbp_snowboard_asylum, v584_95_sale_409_46)).
query(true_val(price_gbp_snowboard_asylum, unk_price_gbp_snowboard_asylum)).

% @attr price_eur_lib_tech
% @type numeric
% @unit EUR
% @canonical false
% @original_name Price (EUR, eur.lib-tech.com)
% @values v659_99=659.99 unk_price_eur_lib_tech=Unknown
% @importance 0.3

0.86::true_val(price_eur_lib_tech, v659_99); 0.14::true_val(price_eur_lib_tech, unk_price_eur_lib_tech).
0.90::acc(s32, price_eur_lib_tech).
measured(s32, price_eur_lib_tech, v659_99).
all_consistent(price_eur_lib_tech) :- (indep(s32), consistent(s32, price_eur_lib_tech) ; \+indep(s32)).
evidence(all_consistent(price_eur_lib_tech)).
query(true_val(price_eur_lib_tech, v659_99)).
query(true_val(price_eur_lib_tech, unk_price_eur_lib_tech)).

% @attr price_eur_snowcountry
% @type numeric
% @unit EUR
% @canonical false
% @original_name Price (EUR, SnowCountry EU)
% @values v522_56=522.56 unk_price_eur_snowcountry=Unknown
% @importance 0.95

0.64::true_val(price_eur_snowcountry, v522_56); 0.36::true_val(price_eur_snowcountry, unk_price_eur_snowcountry).
0.72::acc(s26, price_eur_snowcountry).
measured(s26, price_eur_snowcountry, v522_56).
all_consistent(price_eur_snowcountry) :- (indep(s8), consistent(s26, price_eur_snowcountry) ; \+indep(s8)).
evidence(all_consistent(price_eur_snowcountry)).
query(true_val(price_eur_snowcountry, v522_56)).
query(true_val(price_eur_snowcountry, unk_price_eur_snowcountry)).

% @attr price_cad_prfo
% @type numeric
% @unit CAD
% @canonical true
% @original_name price_cad_prfo
% @values v587_99=587.99 unk_price_cad_prfo=Unknown
% @importance 0.95

0.64::true_val(price_cad_prfo, v587_99); 0.36::true_val(price_cad_prfo, unk_price_cad_prfo).
0.72::acc(s26, price_cad_prfo).
measured(s26, price_cad_prfo, v587_99).
all_consistent(price_cad_prfo) :- (indep(s8), consistent(s26, price_cad_prfo) ; \+indep(s8)).
evidence(all_consistent(price_cad_prfo)).
query(true_val(price_cad_prfo, v587_99)).
query(true_val(price_cad_prfo, unk_price_cad_prfo)).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v1099_99=1099.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.95::true_val(price_aud_merchant, v1099_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).
0.93::acc(sm, price_aud_merchant).
measured(sm, price_aud_merchant, v1099_99).
all_consistent(price_aud_merchant) :- consistent(sm, price_aud_merchant).
evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v1099_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values in_stock_lib_tech=In_stock_lib_tech_com unk_availability_status=Unknown
% @importance 1.0

0.95::true_val(availability_status, in_stock_lib_tech); 0.05::true_val(availability_status, unk_availability_status).
0.93::acc(s20, availability_status).
measured(s20, availability_status, in_stock_lib_tech).
all_consistent(availability_status) :- consistent(s20, availability_status).
evidence(all_consistent(availability_status)).
query(true_val(availability_status, in_stock_lib_tech)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status
% @values in_stock_evo=In_stock_evo_free_shipping_price_match unk_availability_status_evo=Unknown
% @importance 0.85

0.77::true_val(availability_status_evo, in_stock_evo); 0.23::true_val(availability_status_evo, unk_availability_status_evo).
0.82::acc(s33, availability_status_evo).
measured(s33, availability_status_evo, in_stock_evo).
all_consistent(availability_status_evo) :- (indep(s18), consistent(s33, availability_status_evo) ; \+indep(s18)).
evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, in_stock_evo)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

% @attr availability_status_tactics
% @type categorical
% @canonical false
% @original_name availability_status
% @values in_stock_tactics=In_stock_Tactics_free_shipping unk_availability_status_tactics=Unknown
% @importance 0.9

0.81::true_val(availability_status_tactics, in_stock_tactics); 0.19::true_val(availability_status_tactics, unk_availability_status_tactics).
0.85::acc(s27, availability_status_tactics).
measured(s27, availability_status_tactics, in_stock_tactics).
all_consistent(availability_status_tactics) :- (indep(s11), consistent(s27, availability_status_tactics) ; \+indep(s11)).
evidence(all_consistent(availability_status_tactics)).
query(true_val(availability_status_tactics, in_stock_tactics)).
query(true_val(availability_status_tactics, unk_availability_status_tactics)).

% @attr availability_status_backcountry
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_backcountry=Available_Backcountry unk_availability_status_backcountry=Unknown
% @importance 0.95

0.64::true_val(availability_status_backcountry, available_backcountry); 0.36::true_val(availability_status_backcountry, unk_availability_status_backcountry).
0.72::acc(s26, availability_status_backcountry).
measured(s26, availability_status_backcountry, available_backcountry).
all_consistent(availability_status_backcountry) :- (indep(s8), consistent(s26, availability_status_backcountry) ; \+indep(s8)).
evidence(all_consistent(availability_status_backcountry)).
query(true_val(availability_status_backcountry, available_backcountry)).
query(true_val(availability_status_backcountry, unk_availability_status_backcountry)).

% @attr availability_status_the_house
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_the_house=Available_The_House unk_availability_status_the_house=Unknown
% @importance 0.95

0.64::true_val(availability_status_the_house, available_the_house); 0.36::true_val(availability_status_the_house, unk_availability_status_the_house).
0.72::acc(s26, availability_status_the_house).
measured(s26, availability_status_the_house, available_the_house).
all_consistent(availability_status_the_house) :- (indep(s8), consistent(s26, availability_status_the_house) ; \+indep(s8)).
evidence(all_consistent(availability_status_the_house)).
query(true_val(availability_status_the_house, available_the_house)).
query(true_val(availability_status_the_house, unk_availability_status_the_house)).

% @attr availability_status_sun_ski
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_sun_ski=Available_Sun_Ski unk_availability_status_sun_ski=Unknown
% @importance 0.95

0.64::true_val(availability_status_sun_ski, available_sun_ski); 0.36::true_val(availability_status_sun_ski, unk_availability_status_sun_ski).
0.72::acc(s26, availability_status_sun_ski).
measured(s26, availability_status_sun_ski, available_sun_ski).
all_consistent(availability_status_sun_ski) :- (indep(s8), consistent(s26, availability_status_sun_ski) ; \+indep(s8)).
evidence(all_consistent(availability_status_sun_ski)).
query(true_val(availability_status_sun_ski, available_sun_ski)).
query(true_val(availability_status_sun_ski, unk_availability_status_sun_ski)).

% @attr availability_status_gravity_coalition
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_gravity_coalition=Available_Gravity_Coalition unk_availability_status_gravity_coalition=Unknown
% @importance 0.95

0.64::true_val(availability_status_gravity_coalition, available_gravity_coalition); 0.36::true_val(availability_status_gravity_coalition, unk_availability_status_gravity_coalition).
0.72::acc(s26, availability_status_gravity_coalition).
measured(s26, availability_status_gravity_coalition, available_gravity_coalition).
all_consistent(availability_status_gravity_coalition) :- (indep(s8), consistent(s26, availability_status_gravity_coalition) ; \+indep(s8)).
evidence(all_consistent(availability_status_gravity_coalition)).
query(true_val(availability_status_gravity_coalition, available_gravity_coalition)).
query(true_val(availability_status_gravity_coalition, unk_availability_status_gravity_coalition)).

% @attr availability_status_arlberg
% @type categorical
% @canonical false
% @original_name availability_status
% @values only_1_in_stock_157_5=Only_1_in_stock_157_5cm unk_availability_status_arlberg=Unknown
% @importance 0.7

0.54::true_val(availability_status_arlberg, only_1_in_stock_157_5); 0.46::true_val(availability_status_arlberg, unk_availability_status_arlberg).
0.58::acc(s25, availability_status_arlberg).
measured(s25, availability_status_arlberg, only_1_in_stock_157_5).
all_consistent(availability_status_arlberg) :- (indep(s25), consistent(s25, availability_status_arlberg) ; \+indep(s25)).
evidence(all_consistent(availability_status_arlberg)).
query(true_val(availability_status_arlberg, only_1_in_stock_157_5)).
query(true_val(availability_status_arlberg, unk_availability_status_arlberg)).

% @attr availability_status_buzzs
% @type categorical
% @canonical false
% @original_name availability_status
% @values sold_out_backordered=Sold_out_backordered unk_availability_status_buzzs=Unknown
% @importance 0.7

0.54::true_val(availability_status_buzzs, sold_out_backordered); 0.46::true_val(availability_status_buzzs, unk_availability_status_buzzs).
0.58::acc(s24, availability_status_buzzs).
measured(s24, availability_status_buzzs, sold_out_backordered).
all_consistent(availability_status_buzzs) :- (indep(s24), consistent(s24, availability_status_buzzs) ; \+indep(s24)).
evidence(all_consistent(availability_status_buzzs)).
query(true_val(availability_status_buzzs, sold_out_backordered)).
query(true_val(availability_status_buzzs, unk_availability_status_buzzs)).

% @attr availability_status_amazon
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed_amazon=Listed_Amazon unk_availability_status_amazon=Unknown
% @importance 0.6

0.56::true_val(availability_status_amazon, listed_amazon); 0.44::true_val(availability_status_amazon, unk_availability_status_amazon).
0.62::acc(s34, availability_status_amazon).
measured(s34, availability_status_amazon, listed_amazon).
all_consistent(availability_status_amazon) :- (indep(s34), consistent(s34, availability_status_amazon) ; \+indep(s34)).
evidence(all_consistent(availability_status_amazon)).
query(true_val(availability_status_amazon, listed_amazon)).
query(true_val(availability_status_amazon, unk_availability_status_amazon)).

% @attr availability_status_salty_peaks
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed_salty_peaks=Listed_Salty_Peaks unk_availability_status_salty_peaks=Unknown
% @importance 0.75

0.63::true_val(availability_status_salty_peaks, listed_salty_peaks); 0.37::true_val(availability_status_salty_peaks, unk_availability_status_salty_peaks).
0.68::acc(s22, availability_status_salty_peaks).
measured(s22, availability_status_salty_peaks, listed_salty_peaks).
all_consistent(availability_status_salty_peaks) :- (indep(s22), consistent(s22, availability_status_salty_peaks) ; \+indep(s22)).
evidence(all_consistent(availability_status_salty_peaks)).
query(true_val(availability_status_salty_peaks, listed_salty_peaks)).
query(true_val(availability_status_salty_peaks, unk_availability_status_salty_peaks)).

% @attr availability_status_snowboard_asylum
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_sa_409_46=Available_Snowboard_Asylum_409_46_GBP unk_availability_status_snowboard_asylum=Unknown
% @importance 0.7

0.68::true_val(availability_status_snowboard_asylum, available_sa_409_46); 0.32::true_val(availability_status_snowboard_asylum, unk_availability_status_snowboard_asylum).
0.72::acc(s31, availability_status_snowboard_asylum).
measured(s31, availability_status_snowboard_asylum, available_sa_409_46).
all_consistent(availability_status_snowboard_asylum) :- (indep(s31), consistent(s31, availability_status_snowboard_asylum) ; \+indep(s31)).
evidence(all_consistent(availability_status_snowboard_asylum)).
query(true_val(availability_status_snowboard_asylum, available_sa_409_46)).
query(true_val(availability_status_snowboard_asylum, unk_availability_status_snowboard_asylum)).

% @attr availability_status_snowlab
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed_snowlab=Listed_Snowlab_UK unk_availability_status_snowlab=Unknown
% @importance 0.7

0.55::true_val(availability_status_snowlab, listed_snowlab); 0.45::true_val(availability_status_snowlab, unk_availability_status_snowlab).
0.60::acc(s21, availability_status_snowlab).
measured(s21, availability_status_snowlab, listed_snowlab).
all_consistent(availability_status_snowlab) :- (indep(s21), consistent(s21, availability_status_snowlab) ; \+indep(s21)).
evidence(all_consistent(availability_status_snowlab)).
query(true_val(availability_status_snowlab, listed_snowlab)).
query(true_val(availability_status_snowlab, unk_availability_status_snowlab)).

% @attr availability_status_snowcountry
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_snowcountry_522_56=Available_SnowCountry_522_56_EUR unk_availability_status_snowcountry=Unknown
% @importance 0.95

0.64::true_val(availability_status_snowcountry, available_snowcountry_522_56); 0.36::true_val(availability_status_snowcountry, unk_availability_status_snowcountry).
0.72::acc(s26, availability_status_snowcountry).
measured(s26, availability_status_snowcountry, available_snowcountry_522_56).
all_consistent(availability_status_snowcountry) :- (indep(s8), consistent(s26, availability_status_snowcountry) ; \+indep(s8)).
evidence(all_consistent(availability_status_snowcountry)).
query(true_val(availability_status_snowcountry, available_snowcountry_522_56)).
query(true_val(availability_status_snowcountry, unk_availability_status_snowcountry)).

% @attr availability_status_prfo
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_prfo_587_99=Available_PRFO_587_99_CAD unk_availability_status_prfo=Unknown
% @importance 0.95

0.64::true_val(availability_status_prfo, available_prfo_587_99); 0.36::true_val(availability_status_prfo, unk_availability_status_prfo).
0.72::acc(s26, availability_status_prfo).
measured(s26, availability_status_prfo, available_prfo_587_99).
all_consistent(availability_status_prfo) :- (indep(s8), consistent(s26, availability_status_prfo) ; \+indep(s8)).
evidence(all_consistent(availability_status_prfo)).
query(true_val(availability_status_prfo, available_prfo_587_99)).
query(true_val(availability_status_prfo, unk_availability_status_prfo)).

% @attr availability_status_glisshop
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_glisshop=Available_Glisshop unk_availability_status_glisshop=Unknown
% @importance 0.5

0.42::true_val(availability_status_glisshop, available_glisshop); 0.58::true_val(availability_status_glisshop, unk_availability_status_glisshop).
0.50::acc(s35, availability_status_glisshop).
measured(s35, availability_status_glisshop, available_glisshop).
all_consistent(availability_status_glisshop) :- (indep(s35), consistent(s35, availability_status_glisshop) ; \+indep(s35)).
evidence(all_consistent(availability_status_glisshop)).
query(true_val(availability_status_glisshop, available_glisshop)).
query(true_val(availability_status_glisshop, unk_availability_status_glisshop)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values advanced_expert=Advanced_Expert unk_rider_level=Unknown
% @importance 0.85

0.72::true_val(rider_level, advanced_expert); 0.28::true_val(rider_level, unk_rider_level).
0.80::acc(s8, rider_level).
measured(s8, rider_level, advanced_expert).
all_consistent(rider_level) :- (indep(s8), consistent(s8, rider_level) ; \+indep(s8)).
evidence(all_consistent(rider_level)).
query(true_val(rider_level, advanced_expert)).
query(true_val(rider_level, unk_rider_level)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values intermediate_advanced=Intermediate_Advanced advanced_expert=Advanced_Expert
% @importance 0.8

0.45::true_val(skill_level_recommendation, intermediate_advanced); 0.55::true_val(skill_level_recommendation, advanced_expert).
0.82::acc(s18, skill_level_recommendation).
0.60::acc(s21, skill_level_recommendation).
measured(s18, skill_level_recommendation, intermediate_advanced).
measured(s21, skill_level_recommendation, advanced_expert).
all_consistent(skill_level_recommendation) :-
    (indep(s18), consistent(s18, skill_level_recommendation) ; \+indep(s18)),
    (indep(s21), consistent(s21, skill_level_recommendation) ; \+indep(s21)).
evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, intermediate_advanced)).
query(true_val(skill_level_recommendation, advanced_expert)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values unisex_mens=Unisex_listed_as_Mens unk_gender=Unknown
% @importance 0.4

0.51::true_val(gender, unisex_mens); 0.49::true_val(gender, unk_gender).
0.55::acc(s37, gender).
measured(s37, gender, unisex_mens).
all_consistent(gender) :- (indep(s37), consistent(s37, gender) ; \+indep(s37)).
evidence(all_consistent(gender)).
query(true_val(gender, unisex_mens)).
query(true_val(gender, unk_gender)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values all_mountain=All_Mountain freeride_powder_all_terrain=Freeride_Powder_All_terrain resort_pow_groomer_trees=Resort_powder_groomer_carving_trees
% @importance 0.9

0.40::true_val(terrain_suitability, all_mountain); 0.30::true_val(terrain_suitability, freeride_powder_all_terrain); 0.30::true_val(terrain_suitability, resort_pow_groomer_trees).
0.90::acc(s1, terrain_suitability).
0.82::acc(sm, terrain_suitability).
0.80::acc(s11, terrain_suitability).
0.78::acc(s8, terrain_suitability).
measured(s1, terrain_suitability, all_mountain).
measured(sm, terrain_suitability, freeride_powder_all_terrain).
measured(s11, terrain_suitability, resort_pow_groomer_trees).
measured(s8, terrain_suitability, resort_pow_groomer_trees).
all_consistent(terrain_suitability) :-
    consistent(s1, terrain_suitability),
    consistent(sm, terrain_suitability),
    (indep(s11), consistent(s11, terrain_suitability) ; \+indep(s11)),
    (indep(s8), consistent(s8, terrain_suitability) ; \+indep(s8)).
evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, all_mountain)).
query(true_val(terrain_suitability, freeride_powder_all_terrain)).
query(true_val(terrain_suitability, resort_pow_groomer_trees)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values carving_slashing_surf=Carving_slashing_surf_like_flow alternative_freeride=Alternative_Freeride
% @importance 0.9

0.45::true_val(riding_style, carving_slashing_surf); 0.55::true_val(riding_style, alternative_freeride).
0.82::acc(sm, riding_style).
0.80::acc(s8, riding_style).
measured(sm, riding_style, carving_slashing_surf).
measured(s8, riding_style, alternative_freeride).
all_consistent(riding_style) :-
    consistent(sm, riding_style),
    (indep(s8), consistent(s8, riding_style) ; \+indep(s8)).
evidence(all_consistent(riding_style)).
query(true_val(riding_style, carving_slashing_surf)).
query(true_val(riding_style, alternative_freeride)).

% @attr powder_rating_tgr
% @type categorical
% @canonical true
% @original_name powder_rating_tgr
% @values good=Good unk_powder_rating_tgr=Unknown
% @importance 0.95

0.72::true_val(powder_rating_tgr, good); 0.28::true_val(powder_rating_tgr, unk_powder_rating_tgr).
0.80::acc(s8, powder_rating_tgr).
measured(s8, powder_rating_tgr, good).
all_consistent(powder_rating_tgr) :- (indep(s8), consistent(s8, powder_rating_tgr) ; \+indep(s8)).
evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, good)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values good=Good unk_base_glide_performance=Unknown
% @importance 0.95

0.72::true_val(base_glide_performance, good); 0.28::true_val(base_glide_performance, unk_base_glide_performance).
0.80::acc(s8, base_glide_performance).
measured(s8, base_glide_performance, good).
all_consistent(base_glide_performance) :- (indep(s8), consistent(s8, base_glide_performance) ; \+indep(s8)).
evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, good)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr carving_rating_tgr
% @type categorical
% @canonical true
% @original_name carving_rating_tgr
% @values great=Great unk_carving_rating_tgr=Unknown
% @importance 0.95

0.72::true_val(carving_rating_tgr, great); 0.28::true_val(carving_rating_tgr, unk_carving_rating_tgr).
0.80::acc(s8, carving_rating_tgr).
measured(s8, carving_rating_tgr, great).
all_consistent(carving_rating_tgr) :- (indep(s8), consistent(s8, carving_rating_tgr) ; \+indep(s8)).
evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, great)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

% @attr speed_rating_tgr
% @type categorical
% @canonical true
% @original_name speed_rating_tgr
% @values great=Great unk_speed_rating_tgr=Unknown
% @importance 0.95

0.72::true_val(speed_rating_tgr, great); 0.28::true_val(speed_rating_tgr, unk_speed_rating_tgr).
0.80::acc(s8, speed_rating_tgr).
measured(s8, speed_rating_tgr, great).
all_consistent(speed_rating_tgr) :- (indep(s8), consistent(s8, speed_rating_tgr) ; \+indep(s8)).
evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, great)).
query(true_val(speed_rating_tgr, unk_speed_rating_tgr)).

% @attr chatter_performance
% @type categorical
% @canonical true
% @original_name chatter_performance
% @values good=Good unk_chatter_performance=Unknown
% @importance 0.95

0.72::true_val(chatter_performance, good); 0.28::true_val(chatter_performance, unk_chatter_performance).
0.80::acc(s8, chatter_performance).
measured(s8, chatter_performance, good).
all_consistent(chatter_performance) :- (indep(s8), consistent(s8, chatter_performance) ; \+indep(s8)).
evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, good)).
query(true_val(chatter_performance, unk_chatter_performance)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values average=Average unk_switch_riding=Unknown
% @importance 0.95

0.72::true_val(switch_riding, average); 0.28::true_val(switch_riding, unk_switch_riding).
0.80::acc(s8, switch_riding).
measured(s8, switch_riding, average).
all_consistent(switch_riding) :- (indep(s8), consistent(s8, switch_riding) ; \+indep(s8)).
evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, average)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr jumps_rating_tgr
% @type categorical
% @canonical true
% @original_name jumps_rating_tgr
% @values good=Good unk_jumps_rating_tgr=Unknown
% @importance 0.95

0.72::true_val(jumps_rating_tgr, good); 0.28::true_val(jumps_rating_tgr, unk_jumps_rating_tgr).
0.80::acc(s8, jumps_rating_tgr).
measured(s8, jumps_rating_tgr, good).
all_consistent(jumps_rating_tgr) :- (indep(s8), consistent(s8, jumps_rating_tgr) ; \+indep(s8)).
evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, good)).
query(true_val(jumps_rating_tgr, unk_jumps_rating_tgr)).

% @attr jibbing_rating_tgr
% @type categorical
% @canonical true
% @original_name jibbing_rating_tgr
% @values poor=Poor unk_jibbing_rating_tgr=Unknown
% @importance 0.95

0.72::true_val(jibbing_rating_tgr, poor); 0.28::true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr).
0.80::acc(s8, jibbing_rating_tgr).
measured(s8, jibbing_rating_tgr, poor).
all_consistent(jibbing_rating_tgr) :- (indep(s8), consistent(s8, jibbing_rating_tgr) ; \+indep(s8)).
evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, poor)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr)).

% @attr pipe_rating_tgr
% @type categorical
% @canonical true
% @original_name pipe_rating_tgr
% @values good=Good unk_pipe_rating_tgr=Unknown
% @importance 0.95

0.72::true_val(pipe_rating_tgr, good); 0.28::true_val(pipe_rating_tgr, unk_pipe_rating_tgr).
0.80::acc(s8, pipe_rating_tgr).
measured(s8, pipe_rating_tgr, good).
all_consistent(pipe_rating_tgr) :- (indep(s8), consistent(s8, pipe_rating_tgr) ; \+indep(s8)).
evidence(all_consistent(pipe_rating_tgr)).
query(true_val(pipe_rating_tgr, good)).
query(true_val(pipe_rating_tgr, unk_pipe_rating_tgr)).

% @attr on_snow_feel_tgr
% @type categorical
% @canonical true
% @original_name on_snow_feel_tgr
% @values stable=Stable unk_on_snow_feel_tgr=Unknown
% @importance 0.95

0.72::true_val(on_snow_feel_tgr, stable); 0.28::true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr).
0.80::acc(s8, on_snow_feel_tgr).
measured(s8, on_snow_feel_tgr, stable).
all_consistent(on_snow_feel_tgr) :- (indep(s8), consistent(s8, on_snow_feel_tgr) ; \+indep(s8)).
evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, stable)).
query(true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values medium_fast=Medium_Fast unk_turn_initiation_performance=Unknown
% @importance 0.95

0.72::true_val(turn_initiation_performance, medium_fast); 0.28::true_val(turn_initiation_performance, unk_turn_initiation_performance).
0.80::acc(s8, turn_initiation_performance).
measured(s8, turn_initiation_performance, medium_fast).
all_consistent(turn_initiation_performance) :- (indep(s8), consistent(s8, turn_initiation_performance) ; \+indep(s8)).
evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, medium_fast)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values moderate=Moderate unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.95

0.72::true_val(reviewer_opinion_the_good_ride, moderate); 0.28::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).
0.80::acc(s8, reviewer_opinion_the_good_ride).
measured(s8, reviewer_opinion_the_good_ride, moderate).
all_consistent(reviewer_opinion_the_good_ride) :- (indep(s8), consistent(s8, reviewer_opinion_the_good_ride) ; \+indep(s8)).
evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, moderate)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr reviewer_opinion_the_good_ride_2
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values moderate=Moderate unk_reviewer_opinion_the_good_ride_2=Unknown
% @importance 0.95

0.72::true_val(reviewer_opinion_the_good_ride_2, moderate); 0.28::true_val(reviewer_opinion_the_good_ride_2, unk_reviewer_opinion_the_good_ride_2).
0.80::acc(s8, reviewer_opinion_the_good_ride_2).
measured(s8, reviewer_opinion_the_good_ride_2, moderate).
all_consistent(reviewer_opinion_the_good_ride_2) :- (indep(s8), consistent(s8, reviewer_opinion_the_good_ride_2) ; \+indep(s8)).
evidence(all_consistent(reviewer_opinion_the_good_ride_2)).
query(true_val(reviewer_opinion_the_good_ride_2, moderate)).
query(true_val(reviewer_opinion_the_good_ride_2, unk_reviewer_opinion_the_good_ride_2)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values medium_snow=Medium_Snow unk_edge_hold=Unknown
% @importance 0.95

0.72::true_val(edge_hold, medium_snow); 0.28::true_val(edge_hold, unk_edge_hold).
0.80::acc(s8, edge_hold).
measured(s8, edge_hold, medium_snow).
all_consistent(edge_hold) :- (indep(s8), consistent(s8, edge_hold) ; \+indep(s8)).
evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, medium_snow)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr reviewer_opinion_the_good_ride_3
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values feels_normal=Feels_Normal unk_reviewer_opinion_the_good_ride_3=Unknown
% @importance 0.95

0.72::true_val(reviewer_opinion_the_good_ride_3, feels_normal); 0.28::true_val(reviewer_opinion_the_good_ride_3, unk_reviewer_opinion_the_good_ride_3).
0.80::acc(s8, reviewer_opinion_the_good_ride_3).
measured(s8, reviewer_opinion_the_good_ride_3, feels_normal).
all_consistent(reviewer_opinion_the_good_ride_3) :- (indep(s8), consistent(s8, reviewer_opinion_the_good_ride_3) ; \+indep(s8)).
evidence(all_consistent(reviewer_opinion_the_good_ride_3)).
query(true_val(reviewer_opinion_the_good_ride_3, feels_normal)).
query(true_val(reviewer_opinion_the_good_ride_3, unk_reviewer_opinion_the_good_ride_3)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values easy_float=Easy_float unk_positive_aspect=Unknown
% @importance 0.95

0.72::true_val(positive_aspect, easy_float); 0.28::true_val(positive_aspect, unk_positive_aspect).
0.80::acc(s8, positive_aspect).
measured(s8, positive_aspect, easy_float).
all_consistent(positive_aspect) :- (indep(s8), consistent(s8, positive_aspect) ; \+indep(s8)).
evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, easy_float)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr positive_aspect_2
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values very_fun_to_turn=Very_fun_to_turn unk_positive_aspect_2=Unknown
% @importance 0.95

0.72::true_val(positive_aspect_2, very_fun_to_turn); 0.28::true_val(positive_aspect_2, unk_positive_aspect_2).
0.80::acc(s8, positive_aspect_2).
measured(s8, positive_aspect_2, very_fun_to_turn).
all_consistent(positive_aspect_2) :- (indep(s8), consistent(s8, positive_aspect_2) ; \+indep(s8)).
evidence(all_consistent(positive_aspect_2)).
query(true_val(positive_aspect_2, very_fun_to_turn)).
query(true_val(positive_aspect_2, unk_positive_aspect_2)).

% @attr positive_aspect_3
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values not_too_set_back_for_air=Not_too_set_back_to_get_air unk_positive_aspect_3=Unknown
% @importance 0.95

0.72::true_val(positive_aspect_3, not_too_set_back_for_air); 0.28::true_val(positive_aspect_3, unk_positive_aspect_3).
0.80::acc(s8, positive_aspect_3).
measured(s8, positive_aspect_3, not_too_set_back_for_air).
all_consistent(positive_aspect_3) :- (indep(s8), consistent(s8, positive_aspect_3) ; \+indep(s8)).
evidence(all_consistent(positive_aspect_3)).
query(true_val(positive_aspect_3, not_too_set_back_for_air)).
query(true_val(positive_aspect_3, unk_positive_aspect_3)).

% @attr positive_aspect_4
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values very_good_pop=Very_good_pop unk_positive_aspect_4=Unknown
% @importance 0.95

0.72::true_val(positive_aspect_4, very_good_pop); 0.28::true_val(positive_aspect_4, unk_positive_aspect_4).
0.80::acc(s8, positive_aspect_4).
measured(s8, positive_aspect_4, very_good_pop).
all_consistent(positive_aspect_4) :- (indep(s8), consistent(s8, positive_aspect_4) ; \+indep(s8)).
evidence(all_consistent(positive_aspect_4)).
query(true_val(positive_aspect_4, very_good_pop)).
query(true_val(positive_aspect_4, unk_positive_aspect_4)).

% @attr positive_aspect_5
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values pretty_forgiving=Pretty_forgiving_for_its_camber_type unk_positive_aspect_5=Unknown
% @importance 0.95

0.72::true_val(positive_aspect_5, pretty_forgiving); 0.28::true_val(positive_aspect_5, unk_positive_aspect_5).
0.80::acc(s8, positive_aspect_5).
measured(s8, positive_aspect_5, pretty_forgiving).
all_consistent(positive_aspect_5) :- (indep(s8), consistent(s8, positive_aspect_5) ; \+indep(s8)).
evidence(all_consistent(positive_aspect_5)).
query(true_val(positive_aspect_5, pretty_forgiving)).
query(true_val(positive_aspect_5, unk_positive_aspect_5)).

% @attr positive_aspect_6
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values responsive_not_squirrely=Very_responsive_never_squirrely_at_speed unk_positive_aspect_6=Unknown
% @importance 0.7

0.56::true_val(positive_aspect_6, responsive_not_squirrely); 0.44::true_val(positive_aspect_6, unk_positive_aspect_6).
0.65::acc(s38, positive_aspect_6).
measured(s38, positive_aspect_6, responsive_not_squirrely).
all_consistent(positive_aspect_6) :- (indep(s38), consistent(s38, positive_aspect_6) ; \+indep(s38)).
evidence(all_consistent(positive_aspect_6)).
query(true_val(positive_aspect_6, responsive_not_squirrely)).
query(true_val(positive_aspect_6, unk_positive_aspect_6)).

% @attr positive_aspect_7
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values surfing_endless_wave=Made_riders_feel_like_surfing_endless_wave unk_positive_aspect_7=Unknown
% @importance 0.7

0.56::true_val(positive_aspect_7, surfing_endless_wave); 0.44::true_val(positive_aspect_7, unk_positive_aspect_7).
0.65::acc(s38, positive_aspect_7).
measured(s38, positive_aspect_7, surfing_endless_wave).
all_consistent(positive_aspect_7) :- (indep(s38), consistent(s38, positive_aspect_7) ; \+indep(s38)).
evidence(all_consistent(positive_aspect_7)).
query(true_val(positive_aspect_7, surfing_endless_wave)).
query(true_val(positive_aspect_7, unk_positive_aspect_7)).

% @attr positive_aspect_8
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values nimble_stable_pow_board=Feels_like_nimble_yet_stable_160_plus_powder_board unk_positive_aspect_8=Unknown
% @importance 0.75

0.52::true_val(positive_aspect_8, nimble_stable_pow_board); 0.48::true_val(positive_aspect_8, unk_positive_aspect_8).
0.60::acc(s5, positive_aspect_8).
measured(s5, positive_aspect_8, nimble_stable_pow_board).
all_consistent(positive_aspect_8) :- (indep(s5), consistent(s5, positive_aspect_8) ; \+indep(s5)).
evidence(all_consistent(positive_aspect_8)).
query(true_val(positive_aspect_8, nimble_stable_pow_board)).
query(true_val(positive_aspect_8, unk_positive_aspect_8)).

% @attr positive_aspect_9
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values daily_driver=Can_work_as_daily_driver_board unk_positive_aspect_9=Unknown
% @importance 0.75

0.52::true_val(positive_aspect_9, daily_driver); 0.48::true_val(positive_aspect_9, unk_positive_aspect_9).
0.60::acc(s5, positive_aspect_9).
measured(s5, positive_aspect_9, daily_driver).
all_consistent(positive_aspect_9) :- (indep(s5), consistent(s5, positive_aspect_9) ; \+indep(s5)).
evidence(all_consistent(positive_aspect_9)).
query(true_val(positive_aspect_9, daily_driver)).
query(true_val(positive_aspect_9, unk_positive_aspect_9)).

% @attr positive_aspect_10
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values well_built_not_heavy=Board_well_built_not_too_heavy unk_positive_aspect_10=Unknown
% @importance 0.95

0.72::true_val(positive_aspect_10, well_built_not_heavy); 0.28::true_val(positive_aspect_10, unk_positive_aspect_10).
0.80::acc(s8, positive_aspect_10).
measured(s8, positive_aspect_10, well_built_not_heavy).
all_consistent(positive_aspect_10) :- (indep(s8), consistent(s8, positive_aspect_10) ; \+indep(s8)).
evidence(all_consistent(positive_aspect_10)).
query(true_val(positive_aspect_10, well_built_not_heavy)).
query(true_val(positive_aspect_10, unk_positive_aspect_10)).

% @attr positive_aspect_11
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values dreamy_tail_lines=Staff_described_tail_lines_dreamy_camber_quick_smooth_powerful unk_positive_aspect_11=Unknown
% @importance 0.65

0.56::true_val(positive_aspect_11, dreamy_tail_lines); 0.44::true_val(positive_aspect_11, unk_positive_aspect_11).
0.62::acc(s39, positive_aspect_11).
measured(s39, positive_aspect_11, dreamy_tail_lines).
all_consistent(positive_aspect_11) :- (indep(s39), consistent(s39, positive_aspect_11) ; \+indep(s39)).
evidence(all_consistent(positive_aspect_11)).
query(true_val(positive_aspect_11, dreamy_tail_lines)).
query(true_val(positive_aspect_11, unk_positive_aspect_11)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values thirsty_base=Base_needs_daily_waxing_thirsty_base unk_negative_aspect=Unknown
% @importance 0.95

0.72::true_val(negative_aspect, thirsty_base); 0.28::true_val(negative_aspect, unk_negative_aspect).
0.80::acc(s8, negative_aspect).
measured(s8, negative_aspect, thirsty_base).
all_consistent(negative_aspect) :- (indep(s8), consistent(s8, negative_aspect) ; \+indep(s8)).
evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, thirsty_base)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_2
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values too_wide_size9=157_5_too_wide_for_size_9_boots unk_negative_aspect_2=Unknown
% @importance 0.95

0.72::true_val(negative_aspect_2, too_wide_size9); 0.28::true_val(negative_aspect_2, unk_negative_aspect_2).
0.80::acc(s8, negative_aspect_2).
measured(s8, negative_aspect_2, too_wide_size9).
all_consistent(negative_aspect_2) :- (indep(s8), consistent(s8, negative_aspect_2) ; \+indep(s8)).
evidence(all_consistent(negative_aspect_2)).
query(true_val(negative_aspect_2, too_wide_size9)).
query(true_val(negative_aspect_2, unk_negative_aspect_2)).

% @attr negative_aspect_3
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values edge_hold_medium_only=Edge_hold_only_medium_snow_not_exceptional_ice unk_negative_aspect_3=Unknown
% @importance 0.95

0.72::true_val(negative_aspect_3, edge_hold_medium_only); 0.28::true_val(negative_aspect_3, unk_negative_aspect_3).
0.80::acc(s8, negative_aspect_3).
measured(s8, negative_aspect_3, edge_hold_medium_only).
all_consistent(negative_aspect_3) :- (indep(s8), consistent(s8, negative_aspect_3) ; \+indep(s8)).
evidence(all_consistent(negative_aspect_3)).
query(true_val(negative_aspect_3, edge_hold_medium_only)).
query(true_val(negative_aspect_3, unk_negative_aspect_3)).

% @attr negative_aspect_4
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values tail_short_switch_pow=Tail_not_long_enough_for_switch_riding_in_powder unk_negative_aspect_4=Unknown
% @importance 0.75

0.52::true_val(negative_aspect_4, tail_short_switch_pow); 0.48::true_val(negative_aspect_4, unk_negative_aspect_4).
0.60::acc(s5, negative_aspect_4).
measured(s5, negative_aspect_4, tail_short_switch_pow).
all_consistent(negative_aspect_4) :- (indep(s5), consistent(s5, negative_aspect_4) ; \+indep(s5)).
evidence(all_consistent(negative_aspect_4)).
query(true_val(negative_aspect_4, tail_short_switch_pow)).
query(true_val(negative_aspect_4, unk_negative_aspect_4)).

% @attr negative_aspect_5
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values topsheet_scuffs=Topsheet_prone_to_scuffing_scratching unk_negative_aspect_5=Unknown
% @importance 0.95

0.72::true_val(negative_aspect_5, topsheet_scuffs); 0.28::true_val(negative_aspect_5, unk_negative_aspect_5).
0.80::acc(s8, negative_aspect_5).
measured(s8, negative_aspect_5, topsheet_scuffs).
all_consistent(negative_aspect_5) :- (indep(s8), consistent(s8, negative_aspect_5) ; \+indep(s8)).
evidence(all_consistent(negative_aspect_5)).
query(true_val(negative_aspect_5, topsheet_scuffs)).
query(true_val(negative_aspect_5, unk_negative_aspect_5)).

% @attr negative_aspect_6
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values core_soft_over_170=Riders_over_170lbs_found_core_too_soft_at_speed unk_negative_aspect_6=Unknown
% @importance 0.65

0.56::true_val(negative_aspect_6, core_soft_over_170); 0.44::true_val(negative_aspect_6, unk_negative_aspect_6).
0.62::acc(s39, negative_aspect_6).
measured(s39, negative_aspect_6, core_soft_over_170).
all_consistent(negative_aspect_6) :- (indep(s39), consistent(s39, negative_aspect_6) ; \+indep(s39)).
evidence(all_consistent(negative_aspect_6)).
query(true_val(negative_aspect_6, core_soft_over_170)).
query(true_val(negative_aspect_6, unk_negative_aspect_6)).

% @attr negative_aspect_7
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values graphic_unfortunate=Topsheet_graphic_described_as_unfortunate_for_non_Americans unk_negative_aspect_7=Unknown
% @importance 0.75

0.52::true_val(negative_aspect_7, graphic_unfortunate); 0.48::true_val(negative_aspect_7, unk_negative_aspect_7).
0.60::acc(s5, negative_aspect_7).
measured(s5, negative_aspect_7, graphic_unfortunate).
all_consistent(negative_aspect_7) :- (indep(s5), consistent(s5, negative_aspect_7) ; \+indep(s5)).
evidence(all_consistent(negative_aspect_7)).
query(true_val(negative_aspect_7, graphic_unfortunate)).
query(true_val(negative_aspect_7, unk_negative_aspect_7)).

% @attr negative_aspect_8
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values poor_jibbing=Poor_jibbing_rating unk_negative_aspect_8=Unknown
% @importance 0.95

0.72::true_val(negative_aspect_8, poor_jibbing); 0.28::true_val(negative_aspect_8, unk_negative_aspect_8).
0.80::acc(s8, negative_aspect_8).
measured(s8, negative_aspect_8, poor_jibbing).
all_consistent(negative_aspect_8) :- (indep(s8), consistent(s8, negative_aspect_8) ; \+indep(s8)).
evidence(all_consistent(negative_aspect_8)).
query(true_val(negative_aspect_8, poor_jibbing)).
query(true_val(negative_aspect_8, unk_negative_aspect_8)).

% @attr negative_aspect_9
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values not_switch_board=Not_a_primary_switch_riding_board unk_negative_aspect_9=Unknown
% @importance 0.75

0.52::true_val(negative_aspect_9, not_switch_board); 0.48::true_val(negative_aspect_9, unk_negative_aspect_9).
0.60::acc(s5, negative_aspect_9).
measured(s5, negative_aspect_9, not_switch_board).
all_consistent(negative_aspect_9) :- (indep(s5), consistent(s5, negative_aspect_9) ; \+indep(s5)).
evidence(all_consistent(negative_aspect_9)).
query(true_val(negative_aspect_9, not_switch_board)).
query(true_val(negative_aspect_9, unk_negative_aspect_9)).

% @attr boot_size_152_5
% @type categorical
% @canonical false
% @original_name Recommended boot size 152.5cm
% @values us_8_9=US_8_to_9 unk_boot_size_152_5=Unknown
% @importance 0.95

0.72::true_val(boot_size_152_5, us_8_9); 0.28::true_val(boot_size_152_5, unk_boot_size_152_5).
0.80::acc(s8, boot_size_152_5).
measured(s8, boot_size_152_5, us_8_9).
all_consistent(boot_size_152_5) :- (indep(s8), consistent(s8, boot_size_152_5) ; \+indep(s8)).
evidence(all_consistent(boot_size_152_5)).
query(true_val(boot_size_152_5, us_8_9)).
query(true_val(boot_size_152_5, unk_boot_size_152_5)).

% @attr boot_size_157_5
% @type categorical
% @canonical false
% @original_name Recommended boot size 157.5cm
% @values us_10_11=US_10_to_11 unk_boot_size_157_5=Unknown
% @importance 0.95

0.72::true_val(boot_size_157_5, us_10_11); 0.28::true_val(boot_size_157_5, unk_boot_size_157_5).
0.80::acc(s8, boot_size_157_5).
measured(s8, boot_size_157_5, us_10_11).
all_consistent(boot_size_157_5) :- (indep(s8), consistent(s8, boot_size_157_5) ; \+indep(s8)).
evidence(all_consistent(boot_size_157_5)).
query(true_val(boot_size_157_5, us_10_11)).
query(true_val(boot_size_157_5, unk_boot_size_157_5)).

% @attr boot_size_161_5
% @type categorical
% @canonical false
% @original_name Recommended boot size 161.5cm
% @values us_10_5_11_5=US_10_5_to_11_5 unk_boot_size_161_5=Unknown
% @importance 0.95

0.72::true_val(boot_size_161_5, us_10_5_11_5); 0.28::true_val(boot_size_161_5, unk_boot_size_161_5).
0.80::acc(s8, boot_size_161_5).
measured(s8, boot_size_161_5, us_10_5_11_5).
all_consistent(boot_size_161_5) :- (indep(s8), consistent(s8, boot_size_161_5) ; \+indep(s8)).
evidence(all_consistent(boot_size_161_5)).
query(true_val(boot_size_161_5, us_10_5_11_5)).
query(true_val(boot_size_161_5, unk_boot_size_161_5)).

% @attr setback
% @type numeric
% @unit inches
% @canonical true
% @original_name setback
% @values v_neg3_625=3.625 unk_setback=Unknown
% @importance 0.95

0.72::true_val(setback, v_neg3_625); 0.28::true_val(setback, unk_setback).
0.80::acc(s8, setback).
measured(s8, setback, v_neg3_625).
all_consistent(setback) :- (indep(s8), consistent(s8, setback) ; \+indep(s8)).
evidence(all_consistent(setback)).
query(true_val(setback, v_neg3_625)).
query(true_val(setback, unk_setback)).

% @attr setback_at_stance
% @type categorical
% @unit inches
% @canonical false
% @original_name setback
% @values v4_75_at_22_75=4.75in_back_at_22.75in_stance unk_setback_at_stance=Unknown
% @importance 0.95

0.72::true_val(setback_at_stance, v4_75_at_22_75); 0.28::true_val(setback_at_stance, unk_setback_at_stance).
0.80::acc(s8, setback_at_stance).
measured(s8, setback_at_stance, v4_75_at_22_75).
all_consistent(setback_at_stance) :- (indep(s8), consistent(s8, setback_at_stance) ; \+indep(s8)).
evidence(all_consistent(setback_at_stance)).
query(true_val(setback_at_stance, v4_75_at_22_75)).
query(true_val(setback_at_stance, unk_setback_at_stance)).

% @attr no_reference_stance
% @type categorical
% @canonical false
% @original_name Lib Tech does not disclose a reference stance
% @values not_disclosed=Lib_Tech_does_not_disclose_reference_stance unk_no_reference_stance=Unknown
% @importance 0.95

0.72::true_val(no_reference_stance, not_disclosed); 0.28::true_val(no_reference_stance, unk_no_reference_stance).
0.80::acc(s8, no_reference_stance).
measured(s8, no_reference_stance, not_disclosed).
all_consistent(no_reference_stance) :- (indep(s8), consistent(s8, no_reference_stance) ; \+indep(s8)).
evidence(all_consistent(no_reference_stance)).
query(true_val(no_reference_stance, not_disclosed)).
query(true_val(no_reference_stance, unk_no_reference_stance)).

% @attr lib_tech_user_rating
% @type categorical
% @canonical false
% @original_name Lib Tech website user rating
% @values pct99_of_100_26_reviews=99pct_of_100_based_on_26_reviews unk_lib_tech_user_rating=Unknown
% @importance 1.0

0.95::true_val(lib_tech_user_rating, pct99_of_100_26_reviews); 0.05::true_val(lib_tech_user_rating, unk_lib_tech_user_rating).
0.93::acc(s20, lib_tech_user_rating).
measured(s20, lib_tech_user_rating, pct99_of_100_26_reviews).
all_consistent(lib_tech_user_rating) :- consistent(s20, lib_tech_user_rating).
evidence(all_consistent(lib_tech_user_rating)).
query(true_val(lib_tech_user_rating, pct99_of_100_26_reviews)).
query(true_val(lib_tech_user_rating, unk_lib_tech_user_rating)).

% @attr eur_lib_tech_reviews
% @type categorical
% @canonical false
% @original_name EUR Lib Tech website
% @values reviews_22=22_reviews unk_eur_lib_tech_reviews=Unknown
% @importance 0.3

0.77::true_val(eur_lib_tech_reviews, reviews_22); 0.23::true_val(eur_lib_tech_reviews, unk_eur_lib_tech_reviews).
0.82::acc(s32, eur_lib_tech_reviews).
measured(s32, eur_lib_tech_reviews, reviews_22).
all_consistent(eur_lib_tech_reviews) :- (indep(s32), consistent(s32, eur_lib_tech_reviews) ; \+indep(s32)).
evidence(all_consistent(eur_lib_tech_reviews)).
query(true_val(eur_lib_tech_reviews, reviews_22)).
query(true_val(eur_lib_tech_reviews, unk_eur_lib_tech_reviews)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values sweetfish_749_99=Mayhem_Sweetfish_749_99_swallow_tail unk_comparable_board_same_brand=Unknown
% @importance 0.775

0.88::true_val(comparable_board_same_brand, sweetfish_749_99); 0.12::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).
0.85::acc(s6, comparable_board_same_brand).
0.78::acc(s8, comparable_board_same_brand).
measured(s6, comparable_board_same_brand, sweetfish_749_99).
measured(s8, comparable_board_same_brand, sweetfish_749_99).
all_consistent(comparable_board_same_brand) :-
    consistent(s6, comparable_board_same_brand),
    (indep(s8), consistent(s8, comparable_board_same_brand) ; \+indep(s8)).
evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, sweetfish_749_99)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_2
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values rad_ripper_699_99=Mayhem_Rad_Ripper_699_99 unk_comparable_board_same_brand_2=Unknown
% @importance 0.6

0.86::true_val(comparable_board_same_brand_2, rad_ripper_699_99); 0.14::true_val(comparable_board_same_brand_2, unk_comparable_board_same_brand_2).
0.85::acc(s6, comparable_board_same_brand_2).
measured(s6, comparable_board_same_brand_2, rad_ripper_699_99).
all_consistent(comparable_board_same_brand_2) :- consistent(s6, comparable_board_same_brand_2).
evidence(all_consistent(comparable_board_same_brand_2)).
query(true_val(comparable_board_same_brand_2, rad_ripper_699_99)).
query(true_val(comparable_board_same_brand_2, unk_comparable_board_same_brand_2)).

% @attr comparable_board_same_brand_3
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values smoother_than_trice_more_pow_than_cold_brew=Smoother_than_TRice_Pro_more_responsive_than_Cold_Brew unk_comparable_board_same_brand_3=Unknown
% @importance 0.75

0.48::true_val(comparable_board_same_brand_3, smoother_than_trice_more_pow_than_cold_brew); 0.52::true_val(comparable_board_same_brand_3, unk_comparable_board_same_brand_3).
0.55::acc(s40, comparable_board_same_brand_3).
measured(s40, comparable_board_same_brand_3, smoother_than_trice_more_pow_than_cold_brew).
all_consistent(comparable_board_same_brand_3) :- (indep(s40), consistent(s40, comparable_board_same_brand_3) ; \+indep(s40)).
evidence(all_consistent(comparable_board_same_brand_3)).
query(true_val(comparable_board_same_brand_3, smoother_than_trice_more_pow_than_cold_brew)).
query(true_val(comparable_board_same_brand_3, unk_comparable_board_same_brand_3)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values korua_dart_jones_hovercraft_etc=Korua_Dart_Cafe_Racer_Weston_Japow_Jones_Hovercraft_Storm_Chaser_etc unk_comparable_board_cross_brand=Unknown
% @importance 0.95

0.72::true_val(comparable_board_cross_brand, korua_dart_jones_hovercraft_etc); 0.28::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).
0.78::acc(s8, comparable_board_cross_brand).
measured(s8, comparable_board_cross_brand, korua_dart_jones_hovercraft_etc).
all_consistent(comparable_board_cross_brand) :- (indep(s8), consistent(s8, comparable_board_cross_brand) ; \+indep(s8)).
evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, korua_dart_jones_hovercraft_etc)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr sustainability_certification_biodiesel
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values biodiesel_heating=Biodiesel_factory_heating unk_sustainability_certification_biodiesel=Unknown
% @importance 0.35

0.64::true_val(sustainability_certification_biodiesel, biodiesel_heating); 0.36::true_val(sustainability_certification_biodiesel, unk_sustainability_certification_biodiesel).
0.72::acc(s42, sustainability_certification_biodiesel).
measured(s42, sustainability_certification_biodiesel, biodiesel_heating).
all_consistent(sustainability_certification_biodiesel) :- consistent(s42, sustainability_certification_biodiesel).
evidence(all_consistent(sustainability_certification_biodiesel)).
query(true_val(sustainability_certification_biodiesel, biodiesel_heating)).
query(true_val(sustainability_certification_biodiesel, unk_sustainability_certification_biodiesel)).

% @attr resin
% @type categorical
% @canonical true
% @original_name resin
% @values low_voc_epoxy=Low_VOC_epoxy_resin_systems unk_resin=Unknown
% @importance 0.35

0.64::true_val(resin, low_voc_epoxy); 0.36::true_val(resin, unk_resin).
0.72::acc(s41, resin).
measured(s41, resin, low_voc_epoxy).
all_consistent(resin) :- consistent(s41, resin).
evidence(all_consistent(resin)).
query(true_val(resin, low_voc_epoxy)).
query(true_val(resin, unk_resin)).

% @attr mervin_wikipedia
% @type categorical
% @canonical false
% @original_name Mervin/Lib Tech Wikipedia
% @values magne_traction_patent_altamont=Owns_Magne_Traction_patent_parent_Altamont_since_2013 unk_mervin_wikipedia=Unknown
% @importance 0.5

0.60::true_val(mervin_wikipedia, magne_traction_patent_altamont); 0.40::true_val(mervin_wikipedia, unk_mervin_wikipedia).
0.68::acc(s43, mervin_wikipedia).
measured(s43, mervin_wikipedia, magne_traction_patent_altamont).
all_consistent(mervin_wikipedia) :- (indep(s43), consistent(s43, mervin_wikipedia) ; \+indep(s43)).
evidence(all_consistent(mervin_wikipedia)).
query(true_val(mervin_wikipedia, magne_traction_patent_altamont)).
query(true_val(mervin_wikipedia, unk_mervin_wikipedia)).

% @attr wikipedia_awards
% @type categorical
% @canonical false
% @original_name Wikipedia awards
% @values over_15_good_wood=Magne_Traction_won_over_15_Transworld_Good_Wood_Awards unk_wikipedia_awards=Unknown
% @importance 0.5

0.60::true_val(wikipedia_awards, over_15_good_wood); 0.40::true_val(wikipedia_awards, unk_wikipedia_awards).
0.68::acc(s43, wikipedia_awards).
measured(s43, wikipedia_awards, over_15_good_wood).
all_consistent(wikipedia_awards) :- (indep(s43), consistent(s43, wikipedia_awards) ; \+indep(s43)).
evidence(all_consistent(wikipedia_awards)).
query(true_val(wikipedia_awards, over_15_good_wood)).
query(true_val(wikipedia_awards, unk_wikipedia_awards)).

% @attr industry_standing
% @type categorical
% @canonical false
% @original_name Industry standing
% @values few_remaining_us_mfr=One_of_few_remaining_US_based_snowboard_manufacturers unk_industry_standing=Unknown
% @importance 0.5

0.86::true_val(industry_standing, few_remaining_us_mfr); 0.14::true_val(industry_standing, unk_industry_standing).
0.88::acc(s12, industry_standing).
measured(s12, industry_standing, few_remaining_us_mfr).
all_consistent(industry_standing) :- consistent(s12, industry_standing).
evidence(all_consistent(industry_standing)).
query(true_val(industry_standing, few_remaining_us_mfr)).
query(true_val(industry_standing, unk_industry_standing)).

% @attr brand_ethos
% @type categorical
% @canonical false
% @original_name Brand ethos
% @values rider_owned_handmade=Rider_owned_culture_handmade_by_snowboarders unk_brand_ethos=Unknown
% @importance 0.85

0.81::true_val(brand_ethos, rider_owned_handmade); 0.19::true_val(brand_ethos, unk_brand_ethos).
0.85::acc(s11, brand_ethos).
measured(s11, brand_ethos, rider_owned_handmade).
all_consistent(brand_ethos) :- (indep(s11), consistent(s11, brand_ethos) ; \+indep(s11)).
evidence(all_consistent(brand_ethos)).
query(true_val(brand_ethos, rider_owned_handmade)).
query(true_val(brand_ethos, unk_brand_ethos)).