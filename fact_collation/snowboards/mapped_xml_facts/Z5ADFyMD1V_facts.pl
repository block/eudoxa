0.15::indep(s18).
0.20::indep(s21).
0.15::indep(s27).
0.15::indep(s32).
0.15::indep(s38).
0.25::indep(s40).
0.10::indep(s41).
0.15::indep(s42).
0.15::indep(s50).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values lib_tech=Lib_Tech unk_brand=Unknown
% @importance 1.0

0.95::acc(s1, brand).
0.90::true_val(brand, lib_tech); 0.10::true_val(brand, unk_brand).
measured(s1, brand, lib_tech).
all_consistent(brand) :- consistent(s1, brand).
evidence(all_consistent(brand)).
query(true_val(brand, lib_tech)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values mayhem_ripper=Mayhem_Ripper_2027 unk_model_name=Unknown
% @importance 1.0

0.95::acc(s1, model_name).
0.88::acc(s2, model_name).
0.95::true_val(model_name, mayhem_ripper); 0.05::true_val(model_name, unk_model_name).
measured(s1, model_name, mayhem_ripper).
measured(s2, model_name, mayhem_ripper).
all_consistent(model_name) :- consistent(s1, model_name), consistent(s2, model_name).
evidence(all_consistent(model_name)).
query(true_val(model_name, mayhem_ripper)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2027=2027 unk_model_year=Unknown
% @importance 1.0

0.88::acc(s2, model_year).
0.81::true_val(model_year, y2027); 0.19::true_val(model_year, unk_model_year).
measured(s2, model_year, y2027).
all_consistent(model_year) :- consistent(s2, model_year).
evidence(all_consistent(model_year)).
query(true_val(model_year, y2027)).
query(true_val(model_year, unk_model_year)).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values mayhem_rad_ripper=Lib_Tech_Mayhem_Rad_Ripper unk_predecessor_model_name=Unknown
% @importance 0.6

0.70::acc(s3, predecessor_model_name).
0.51::true_val(predecessor_model_name, mayhem_rad_ripper); 0.49::true_val(predecessor_model_name, unk_predecessor_model_name).
measured(s3, predecessor_model_name, mayhem_rad_ripper).
all_consistent(predecessor_model_name) :- consistent(s3, predecessor_model_name).
evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, mayhem_rad_ripper)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).

% @attr model_series
% @type categorical
% @canonical false
% @original_name Model series
% @values lib_x_mayhem=Lib_x_Mayhem_Collection unk_model_series=Unknown
% @importance 0.5

0.92::acc(s4, model_series).
0.86::true_val(model_series, lib_x_mayhem); 0.14::true_val(model_series, unk_model_series).
measured(s4, model_series, lib_x_mayhem).
all_consistent(model_series) :- consistent(s4, model_series).
evidence(all_consistent(model_series)).
query(true_val(model_series, lib_x_mayhem)).
query(true_val(model_series, unk_model_series)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values mervin_manufacturing=Mervin_Manufacturing unk_manufacturer=Unknown
% @importance 0.9

0.95::acc(s5, manufacturer).
0.90::true_val(manufacturer, mervin_manufacturing); 0.10::true_val(manufacturer, unk_manufacturer).
measured(s5, manufacturer, mervin_manufacturing).
all_consistent(manufacturer) :- consistent(s5, manufacturer).
evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, mervin_manufacturing)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr manufacturer_founded
% @type categorical
% @canonical false
% @original_name Manufacturer founded
% @values y1977_olson_saari=1977_by_Mike_Olson_and_Pete_Saari unk_manufacturer_founded=Unknown
% @importance 0.4

0.93::acc(s6, manufacturer_founded).
0.90::true_val(manufacturer_founded, y1977_olson_saari); 0.10::true_val(manufacturer_founded, unk_manufacturer_founded).
measured(s6, manufacturer_founded, y1977_olson_saari).
all_consistent(manufacturer_founded) :- consistent(s6, manufacturer_founded).
evidence(all_consistent(manufacturer_founded)).
query(true_val(manufacturer_founded, y1977_olson_saari)).
query(true_val(manufacturer_founded, unk_manufacturer_founded)).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values sequim_wa_usa=Sequim_Washington_USA unk_manufacturing_location=Unknown
% @importance 0.5

0.78::acc(s7, manufacturing_location).
0.71::true_val(manufacturing_location, sequim_wa_usa); 0.29::true_val(manufacturing_location, unk_manufacturing_location).
measured(s7, manufacturing_location, sequim_wa_usa).
all_consistent(manufacturing_location) :- consistent(s7, manufacturing_location).
evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, sequim_wa_usa)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

% @attr manufacturing_claim
% @type categorical
% @canonical false
% @original_name Manufacturing claim
% @values handbuilt_usa=Handbuilt_in_the_USA_by_snowboarders unk_manufacturing_claim=Unknown
% @importance 0.6

0.78::acc(s8, manufacturing_claim).
0.72::true_val(manufacturing_claim, handbuilt_usa); 0.28::true_val(manufacturing_claim, unk_manufacturing_claim).
measured(s8, manufacturing_claim, handbuilt_usa).
all_consistent(manufacturing_claim) :- consistent(s8, manufacturing_claim).
evidence(all_consistent(manufacturing_claim)).
query(true_val(manufacturing_claim, handbuilt_usa)).
query(true_val(manufacturing_claim, unk_manufacturing_claim)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values zero_hazardous_waste=Zero_hazardous_waste_production unk_sustainability_certification=Unknown
% @importance 0.5

0.83::acc(s9, sustainability_certification).
0.77::true_val(sustainability_certification, zero_hazardous_waste); 0.23::true_val(sustainability_certification, unk_sustainability_certification).
measured(s9, sustainability_certification, zero_hazardous_waste).
all_consistent(sustainability_certification) :- consistent(s9, sustainability_certification).
evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, zero_hazardous_waste)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr parent_company_ownership_history
% @type categorical
% @canonical false
% @original_name Parent company ownership history
% @values quiksilver_1997_altamont_2013=Purchased_Quiksilver_1997_sold_Altamont_2013 unk_parent_company_ownership_history=Unknown
% @importance 0.3

0.72::acc(s10, parent_company_ownership_history).
0.71::true_val(parent_company_ownership_history, quiksilver_1997_altamont_2013); 0.29::true_val(parent_company_ownership_history, unk_parent_company_ownership_history).
measured(s10, parent_company_ownership_history, quiksilver_1997_altamont_2013).
all_consistent(parent_company_ownership_history) :- consistent(s10, parent_company_ownership_history).
evidence(all_consistent(parent_company_ownership_history)).
query(true_val(parent_company_ownership_history, quiksilver_1997_altamont_2013)).
query(true_val(parent_company_ownership_history, unk_parent_company_ownership_history)).

% @attr manufacturer_brands
% @type categorical
% @canonical false
% @original_name Manufacturer brands
% @values lt_gnu_roxy_bm=Lib_Tech_GNU_Roxy_Bent_Metal unk_manufacturer_brands=Unknown
% @importance 0.4

0.93::acc(s11, manufacturer_brands).
0.90::true_val(manufacturer_brands, lt_gnu_roxy_bm); 0.10::true_val(manufacturer_brands, unk_manufacturer_brands).
measured(s11, manufacturer_brands, lt_gnu_roxy_bm).
all_consistent(manufacturer_brands) :- consistent(s11, manufacturer_brands).
evidence(all_consistent(manufacturer_brands)).
query(true_val(manufacturer_brands, lt_gnu_roxy_bm)).
query(true_val(manufacturer_brands, unk_manufacturer_brands)).

% @attr manufacturer_reputation
% @type categorical
% @canonical false
% @original_name Manufacturer reputation
% @values longest_running_last_us_factory=Longest_running_last_major_US_factory unk_manufacturer_reputation=Unknown
% @importance 0.5

0.82::acc(s12, manufacturer_reputation).
0.68::true_val(manufacturer_reputation, longest_running_last_us_factory); 0.32::true_val(manufacturer_reputation, unk_manufacturer_reputation).
measured(s12, manufacturer_reputation, longest_running_last_us_factory).
all_consistent(manufacturer_reputation) :- consistent(s12, manufacturer_reputation).
evidence(all_consistent(manufacturer_reputation)).
query(true_val(manufacturer_reputation, longest_running_last_us_factory)).
query(true_val(manufacturer_reputation, unk_manufacturer_reputation)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values preorder=Preorder_not_yet_released unk_availability_status=Unknown
% @importance 1.0

0.85::acc(s2, availability_status).
0.81::true_val(availability_status, preorder); 0.19::true_val(availability_status, unk_availability_status).
measured(s2, availability_status, preorder).
all_consistent(availability_status) :- consistent(s2, availability_status).
evidence(all_consistent(availability_status)).
query(true_val(availability_status, preorder)).
query(true_val(availability_status, unk_availability_status)).

% @attr estimated_availability_date
% @type categorical
% @canonical true
% @original_name estimated_availability_date
% @values may_1_2026=May_1_2026 unk_estimated_availability_date=Unknown
% @importance 1.0

0.85::acc(s2, estimated_availability_date).
0.81::true_val(estimated_availability_date, may_1_2026); 0.19::true_val(estimated_availability_date, unk_estimated_availability_date).
measured(s2, estimated_availability_date, may_1_2026).
all_consistent(estimated_availability_date) :- consistent(s2, estimated_availability_date).
evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, may_1_2026)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2024_2025=2024_2025_season unk_model_first_available_year=Unknown
% @importance 0.6

0.70::acc(s3, model_first_available_year).
0.51::true_val(model_first_available_year, season_2024_2025); 0.49::true_val(model_first_available_year, unk_model_first_available_year).
measured(s3, model_first_available_year, season_2024_2025).
all_consistent(model_first_available_year) :- consistent(s3, model_first_available_year).
evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2024_2025)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values matt_biolos=Matt_Mayhem_Biolos_Lost_Surfboards unk_pro_rider_name=Unknown
% @importance 0.7

0.95::acc(s13, pro_rider_name).
0.90::true_val(pro_rider_name, matt_biolos); 0.10::true_val(pro_rider_name, unk_pro_rider_name).
measured(s13, pro_rider_name, matt_biolos).
all_consistent(pro_rider_name) :- consistent(s13, pro_rider_name).
evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, matt_biolos)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr design_philosophy
% @type categorical
% @canonical false
% @original_name Design philosophy
% @values surf_to_snow_crossover=Surf_to_snow_crossover_shaping_feedback_loop unk_design_philosophy=Unknown
% @importance 0.4

0.85::acc(s14, design_philosophy).
0.72::true_val(design_philosophy, surf_to_snow_crossover); 0.28::true_val(design_philosophy, unk_design_philosophy).
measured(s14, design_philosophy, surf_to_snow_crossover).
all_consistent(design_philosophy) :- consistent(s14, design_philosophy).
evidence(all_consistent(design_philosophy)).
query(true_val(design_philosophy, surf_to_snow_crossover)).
query(true_val(design_philosophy, unk_design_philosophy)).

% @attr pro_rider_name_secondary
% @type categorical
% @canonical false
% @original_name pro_rider_name (Devin Tubbs)
% @values devin_tubbs=Devin_Tubbs_Mammoth_freestyle unk_pro_rider_name_secondary=Unknown
% @importance 0.65

0.95::acc(s15, pro_rider_name_secondary).
0.90::true_val(pro_rider_name_secondary, devin_tubbs); 0.10::true_val(pro_rider_name_secondary, unk_pro_rider_name_secondary).
measured(s15, pro_rider_name_secondary, devin_tubbs).
all_consistent(pro_rider_name_secondary) :- consistent(s15, pro_rider_name_secondary).
evidence(all_consistent(pro_rider_name_secondary)).
query(true_val(pro_rider_name_secondary, devin_tubbs)).
query(true_val(pro_rider_name_secondary, unk_pro_rider_name_secondary)).

% @attr graphic_designer_artist
% @type categorical
% @canonical true
% @original_name graphic_designer_artist
% @values steve_carranza=Steve_Carranza unk_graphic_designer_artist=Unknown
% @importance 0.2

0.60::acc(s16, graphic_designer_artist).
0.51::true_val(graphic_designer_artist, steve_carranza); 0.49::true_val(graphic_designer_artist, unk_graphic_designer_artist).
measured(s16, graphic_designer_artist, steve_carranza).
all_consistent(graphic_designer_artist) :- consistent(s16, graphic_designer_artist).
evidence(all_consistent(graphic_designer_artist)).
query(true_val(graphic_designer_artist, steve_carranza)).
query(true_val(graphic_designer_artist, unk_graphic_designer_artist)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.92::acc(s2, product_type).
0.81::true_val(product_type, snowboard); 0.19::true_val(product_type, unk_product_type).
measured(s2, product_type, snowboard).
all_consistent(product_type) :- consistent(s2, product_type).
evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values freestyle_all_mountain=Freestyle_All_Mountain unk_board_category=Unknown
% @importance 1.0

0.88::acc(s2, board_category).
0.81::true_val(board_category, freestyle_all_mountain); 0.19::true_val(board_category, unk_board_category).
measured(s2, board_category, freestyle_all_mountain).
all_consistent(board_category) :- consistent(s2, board_category).
evidence(all_consistent(board_category)).
query(true_val(board_category, freestyle_all_mountain)).
query(true_val(board_category, unk_board_category)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values true_twin=True_Twin unk_shape=Unknown
% @importance 0.925

0.90::acc(s2, shape).
0.88::acc(s17, shape).
0.95::true_val(shape, true_twin); 0.05::true_val(shape, unk_shape).
measured(s2, shape, true_twin).
measured(s17, shape, true_twin).
all_consistent(shape) :- consistent(s2, shape), consistent(s17, shape).
evidence(all_consistent(shape)).
query(true_val(shape, true_twin)).
query(true_val(shape, unk_shape)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values traditional_camber=Traditional_positive_camber unk_camber_type=Unknown
% @importance 0.925

0.90::acc(s2, camber_type).
0.75::acc(s18, camber_type).
0.95::true_val(camber_type, traditional_camber); 0.05::true_val(camber_type, unk_camber_type).
measured(s2, camber_type, traditional_camber).
measured(s18, camber_type, traditional_camber).
all_consistent(camber_type) :- consistent(s2, camber_type), (indep(s18), consistent(s18, camber_type) ; \+indep(s18)).
evidence(all_consistent(camber_type)).
query(true_val(camber_type, traditional_camber)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_height_mm
% @type numeric
% @unit mm
% @canonical true
% @original_name camber_height_mm
% @values v6=6.0 unk_camber_height_mm=Unknown
% @importance 0.95

0.90::acc(s19, camber_height_mm).
0.71::true_val(camber_height_mm, v6); 0.29::true_val(camber_height_mm, unk_camber_height_mm).
measured(s19, camber_height_mm, v6).
all_consistent(camber_height_mm) :- consistent(s19, camber_height_mm).
evidence(all_consistent(camber_height_mm)).
query(true_val(camber_height_mm, v6)).
query(true_val(camber_height_mm, unk_camber_height_mm)).

% @attr camber_description
% @type categorical
% @canonical false
% @original_name camber_description
% @values max_control_power=Traditional_camber_maximum_control_and_power unk_camber_description=Unknown
% @importance 0.85

0.80::acc(s20, camber_description).
0.72::true_val(camber_description, max_control_power); 0.28::true_val(camber_description, unk_camber_description).
measured(s20, camber_description, max_control_power).
all_consistent(camber_description) :- consistent(s20, camber_description).
evidence(all_consistent(camber_description)).
query(true_val(camber_description, max_control_power)).
query(true_val(camber_description, unk_camber_description)).

% @attr setback
% @type numeric
% @unit inches
% @canonical true
% @original_name setback
% @values v0=0.0 unk_setback=Unknown
% @importance 1.0

0.88::acc(s2, setback).
0.81::true_val(setback, v0); 0.19::true_val(setback, unk_setback).
measured(s2, setback, v0).
all_consistent(setback) :- consistent(s2, setback).
evidence(all_consistent(setback)).
query(true_val(setback, v0)).
query(true_val(setback, unk_setback)).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values progressive_twin=Progressive_twin_sidecut unk_sidecut_type=Unknown
% @importance 0.875

0.88::acc(s2, sidecut_type).
0.75::acc(s21, sidecut_type).
0.95::true_val(sidecut_type, progressive_twin); 0.05::true_val(sidecut_type, unk_sidecut_type).
measured(s2, sidecut_type, progressive_twin).
measured(s21, sidecut_type, progressive_twin).
all_consistent(sidecut_type) :- consistent(s2, sidecut_type), (indep(s21), consistent(s21, sidecut_type) ; \+indep(s21)).
evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, progressive_twin)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr sidecut_description
% @type categorical
% @canonical false
% @original_name Sidecut description
% @values carves_ice_hardpack_both=Carves_ice_and_hardpack_in_both_directions unk_sidecut_description=Unknown
% @importance 0.85

0.90::acc(s22, sidecut_description).
0.81::true_val(sidecut_description, carves_ice_hardpack_both); 0.19::true_val(sidecut_description, unk_sidecut_description).
measured(s22, sidecut_description, carves_ice_hardpack_both).
all_consistent(sidecut_description) :- consistent(s22, sidecut_description).
evidence(all_consistent(sidecut_description)).
query(true_val(sidecut_description, carves_ice_hardpack_both)).
query(true_val(sidecut_description, unk_sidecut_description)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_only=Standard_no_wide_option unk_width_options=Unknown
% @importance 1.0

0.85::acc(s2, width_options).
0.81::true_val(width_options, standard_only); 0.19::true_val(width_options, unk_width_options).
measured(s2, width_options, standard_only).
all_consistent(width_options) :- consistent(s2, width_options).
evidence(all_consistent(width_options)).
query(true_val(width_options, standard_only)).
query(true_val(width_options, unk_width_options)).

% @attr board_designs
% @type categorical
% @canonical false
% @original_name Board designs
% @values size_specific=Size_specific_graphics_not_swappable unk_board_designs=Unknown
% @importance 1.0

0.85::acc(s2, board_designs).
0.81::true_val(board_designs, size_specific); 0.19::true_val(board_designs, unk_board_designs).
measured(s2, board_designs, size_specific).
all_consistent(board_designs) :- consistent(s2, board_designs).
evidence(all_consistent(board_designs)).
query(true_val(board_designs, size_specific)).
query(true_val(board_designs, unk_board_designs)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values s153_156_159=153cm_156cm_159cm unk_available_sizes=Unknown
% @importance 1.0

0.88::acc(s2, available_sizes).
0.81::true_val(available_sizes, s153_156_159); 0.19::true_val(available_sizes, unk_available_sizes).
measured(s2, available_sizes, s153_156_159).
all_consistent(available_sizes) :- consistent(s2, available_sizes).
evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, s153_156_159)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr contact_length_size_153
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size (153cm)
% @values v110_0=110.0 unk_contact_length_size_153=Unknown
% @importance 1.0

0.85::acc(s2, contact_length_size_153).
0.81::true_val(contact_length_size_153, v110_0); 0.19::true_val(contact_length_size_153, unk_contact_length_size_153).
measured(s2, contact_length_size_153, v110_0).
all_consistent(contact_length_size_153) :- consistent(s2, contact_length_size_153).
evidence(all_consistent(contact_length_size_153)).
query(true_val(contact_length_size_153, v110_0)).
query(true_val(contact_length_size_153, unk_contact_length_size_153)).

% @attr contact_length_size
% @type numeric
% @unit cm
% @canonical true
% @original_name contact_length_size (156cm)
% @values v113_0=113.0 unk_contact_length_size=Unknown
% @importance 1.0

0.85::acc(s2, contact_length_size).
0.81::true_val(contact_length_size, v113_0); 0.19::true_val(contact_length_size, unk_contact_length_size).
measured(s2, contact_length_size, v113_0).
all_consistent(contact_length_size) :- consistent(s2, contact_length_size).
evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v113_0)).
query(true_val(contact_length_size, unk_contact_length_size)).

% @attr contact_length_size_159
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size (159cm)
% @values v115_0=115.0 unk_contact_length_size_159=Unknown
% @importance 1.0

0.85::acc(s2, contact_length_size_159).
0.81::true_val(contact_length_size_159, v115_0); 0.19::true_val(contact_length_size_159, unk_contact_length_size_159).
measured(s2, contact_length_size_159, v115_0).
all_consistent(contact_length_size_159) :- consistent(s2, contact_length_size_159).
evidence(all_consistent(contact_length_size_159)).
query(true_val(contact_length_size_159, v115_0)).
query(true_val(contact_length_size_159, unk_contact_length_size_159)).

% @attr sidecut_radius_size_153
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size (153cm)
% @values v8_0_8_3_8_0=8.0_8.3_8.0 unk_sidecut_radius_size_153=Unknown
% @importance 1.0

0.85::acc(s2, sidecut_radius_size_153).
0.81::true_val(sidecut_radius_size_153, v8_0_8_3_8_0); 0.19::true_val(sidecut_radius_size_153, unk_sidecut_radius_size_153).
measured(s2, sidecut_radius_size_153, v8_0_8_3_8_0).
all_consistent(sidecut_radius_size_153) :- consistent(s2, sidecut_radius_size_153).
evidence(all_consistent(sidecut_radius_size_153)).
query(true_val(sidecut_radius_size_153, v8_0_8_3_8_0)).
query(true_val(sidecut_radius_size_153, unk_sidecut_radius_size_153)).

% @attr sidecut_radius_size
% @type categorical
% @unit m
% @canonical true
% @original_name sidecut_radius_size (156cm)
% @values v8_0_8_3_8_0=8.0_8.3_8.0 unk_sidecut_radius_size=Unknown
% @importance 1.0

0.85::acc(s2, sidecut_radius_size).
0.81::true_val(sidecut_radius_size, v8_0_8_3_8_0); 0.19::true_val(sidecut_radius_size, unk_sidecut_radius_size).
measured(s2, sidecut_radius_size, v8_0_8_3_8_0).
all_consistent(sidecut_radius_size) :- consistent(s2, sidecut_radius_size).
evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v8_0_8_3_8_0)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr sidecut_radius_size_159
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size (159cm)
% @values v8_0_8_3_8_0=8.0_8.3_8.0 unk_sidecut_radius_size_159=Unknown
% @importance 1.0

0.85::acc(s2, sidecut_radius_size_159).
0.81::true_val(sidecut_radius_size_159, v8_0_8_3_8_0); 0.19::true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159).
measured(s2, sidecut_radius_size_159, v8_0_8_3_8_0).
all_consistent(sidecut_radius_size_159) :- consistent(s2, sidecut_radius_size_159).
evidence(all_consistent(sidecut_radius_size_159)).
query(true_val(sidecut_radius_size_159, v8_0_8_3_8_0)).
query(true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159)).

% @attr tip_tail_width_size_153
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (153cm)
% @values v29_4=29.4 v29_6=29.6
% @importance 1.0

0.83::acc(s2, tip_tail_width_size_153).
0.88::acc(s23, tip_tail_width_size_153).
0.45::true_val(tip_tail_width_size_153, v29_4); 0.55::true_val(tip_tail_width_size_153, v29_6).
measured(s2, tip_tail_width_size_153, v29_4).
measured(s23, tip_tail_width_size_153, v29_6).
all_consistent(tip_tail_width_size_153) :- consistent(s2, tip_tail_width_size_153), consistent(s23, tip_tail_width_size_153).
evidence(all_consistent(tip_tail_width_size_153)).
query(true_val(tip_tail_width_size_153, v29_4)).
query(true_val(tip_tail_width_size_153, v29_6)).

% @attr tip_tail_width_size
% @type numeric
% @unit cm
% @canonical true
% @original_name tip_tail_width_size (156cm)
% @values v29_7=29.7 v29_9=29.9
% @importance 1.0

0.83::acc(s2, tip_tail_width_size).
0.88::acc(s23, tip_tail_width_size).
0.45::true_val(tip_tail_width_size, v29_7); 0.55::true_val(tip_tail_width_size, v29_9).
measured(s2, tip_tail_width_size, v29_7).
measured(s23, tip_tail_width_size, v29_9).
all_consistent(tip_tail_width_size) :- consistent(s2, tip_tail_width_size), consistent(s23, tip_tail_width_size).
evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v29_7)).
query(true_val(tip_tail_width_size, v29_9)).

% @attr tip_tail_width_size_159
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (159cm)
% @values v30_2=30.2 v30_4=30.4
% @importance 1.0

0.83::acc(s2, tip_tail_width_size_159).
0.88::acc(s23, tip_tail_width_size_159).
0.45::true_val(tip_tail_width_size_159, v30_2); 0.55::true_val(tip_tail_width_size_159, v30_4).
measured(s2, tip_tail_width_size_159, v30_2).
measured(s23, tip_tail_width_size_159, v30_4).
all_consistent(tip_tail_width_size_159) :- consistent(s2, tip_tail_width_size_159), consistent(s23, tip_tail_width_size_159).
evidence(all_consistent(tip_tail_width_size_159)).
query(true_val(tip_tail_width_size_159, v30_2)).
query(true_val(tip_tail_width_size_159, v30_4)).

% @attr waist_width_153
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 153cm
% @values v25_2=25.2 v25_4=25.4
% @importance 1.0

0.83::acc(s2, waist_width_153).
0.88::acc(s23, waist_width_153).
0.45::true_val(waist_width_153, v25_2); 0.55::true_val(waist_width_153, v25_4).
measured(s2, waist_width_153, v25_2).
measured(s23, waist_width_153, v25_4).
all_consistent(waist_width_153) :- consistent(s2, waist_width_153), consistent(s23, waist_width_153).
evidence(all_consistent(waist_width_153)).
query(true_val(waist_width_153, v25_2)).
query(true_val(waist_width_153, v25_4)).

% @attr waist_width_156
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 156cm
% @values v25_5=25.5 v25_7=25.7
% @importance 1.0

0.83::acc(s2, waist_width_156).
0.88::acc(s23, waist_width_156).
0.45::true_val(waist_width_156, v25_5); 0.55::true_val(waist_width_156, v25_7).
measured(s2, waist_width_156, v25_5).
measured(s23, waist_width_156, v25_7).
all_consistent(waist_width_156) :- consistent(s2, waist_width_156), consistent(s23, waist_width_156).
evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v25_5)).
query(true_val(waist_width_156, v25_7)).

% @attr waist_width_159
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 159cm
% @values v25_8=25.8 v26_1=26.1
% @importance 1.0

0.83::acc(s2, waist_width_159).
0.88::acc(s23, waist_width_159).
0.45::true_val(waist_width_159, v25_8); 0.55::true_val(waist_width_159, v26_1).
measured(s2, waist_width_159, v25_8).
measured(s23, waist_width_159, v26_1).
all_consistent(waist_width_159) :- consistent(s2, waist_width_159), consistent(s23, waist_width_159).
evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v25_8)).
query(true_val(waist_width_159, v26_1)).

% @attr stance_width_range_size_153
% @type categorical
% @unit inches
% @canonical false
% @original_name stance_width_range_size (153cm)
% @values v20_25_to_25_0=20.25_to_25.0_inches unk_stance_width_range_size_153=Unknown
% @importance 1.0

0.85::acc(s2, stance_width_range_size_153).
0.81::true_val(stance_width_range_size_153, v20_25_to_25_0); 0.19::true_val(stance_width_range_size_153, unk_stance_width_range_size_153).
measured(s2, stance_width_range_size_153, v20_25_to_25_0).
all_consistent(stance_width_range_size_153) :- consistent(s2, stance_width_range_size_153).
evidence(all_consistent(stance_width_range_size_153)).
query(true_val(stance_width_range_size_153, v20_25_to_25_0)).
query(true_val(stance_width_range_size_153, unk_stance_width_range_size_153)).

% @attr stance_width_range_size
% @type categorical
% @unit inches
% @canonical true
% @original_name stance_width_range_size (156cm)
% @values v20_25_to_25_0=20.25_to_25.0_inches unk_stance_width_range_size=Unknown
% @importance 1.0

0.85::acc(s2, stance_width_range_size).
0.81::true_val(stance_width_range_size, v20_25_to_25_0); 0.19::true_val(stance_width_range_size, unk_stance_width_range_size).
measured(s2, stance_width_range_size, v20_25_to_25_0).
all_consistent(stance_width_range_size) :- consistent(s2, stance_width_range_size).
evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v20_25_to_25_0)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr stance_width_range_size_159
% @type categorical
% @unit inches
% @canonical false
% @original_name stance_width_range_size (159cm)
% @values v20_25_to_25_0=20.25_to_25.0_inches unk_stance_width_range_size_159=Unknown
% @importance 1.0

0.85::acc(s2, stance_width_range_size_159).
0.81::true_val(stance_width_range_size_159, v20_25_to_25_0); 0.19::true_val(stance_width_range_size_159, unk_stance_width_range_size_159).
measured(s2, stance_width_range_size_159, v20_25_to_25_0).
all_consistent(stance_width_range_size_159) :- consistent(s2, stance_width_range_size_159).
evidence(all_consistent(stance_width_range_size_159)).
query(true_val(stance_width_range_size_159, v20_25_to_25_0)).
query(true_val(stance_width_range_size_159, unk_stance_width_range_size_159)).

% @attr recommended_weight_range_size_153
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (153cm)
% @values v45_plus_kg=45_plus_kg_95_plus_lbs unk_recommended_weight_range_size_153=Unknown
% @importance 1.0

0.85::acc(s2, recommended_weight_range_size_153).
0.81::true_val(recommended_weight_range_size_153, v45_plus_kg); 0.19::true_val(recommended_weight_range_size_153, unk_recommended_weight_range_size_153).
measured(s2, recommended_weight_range_size_153, v45_plus_kg).
all_consistent(recommended_weight_range_size_153) :- consistent(s2, recommended_weight_range_size_153).
evidence(all_consistent(recommended_weight_range_size_153)).
query(true_val(recommended_weight_range_size_153, v45_plus_kg)).
query(true_val(recommended_weight_range_size_153, unk_recommended_weight_range_size_153)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size (156cm)
% @values v50_plus_kg=50_plus_kg_110_plus_lbs unk_recommended_weight_range_size=Unknown
% @importance 1.0

0.85::acc(s2, recommended_weight_range_size).
0.81::true_val(recommended_weight_range_size, v50_plus_kg); 0.19::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).
measured(s2, recommended_weight_range_size, v50_plus_kg).
all_consistent(recommended_weight_range_size) :- consistent(s2, recommended_weight_range_size).
evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, v50_plus_kg)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr recommended_weight_range_size_159
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (159cm)
% @values v60_plus_kg=60_plus_kg_130_plus_lbs unk_recommended_weight_range_size_159=Unknown
% @importance 1.0

0.85::acc(s2, recommended_weight_range_size_159).
0.81::true_val(recommended_weight_range_size_159, v60_plus_kg); 0.19::true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159).
measured(s2, recommended_weight_range_size_159, v60_plus_kg).
all_consistent(recommended_weight_range_size_159) :- consistent(s2, recommended_weight_range_size_159).
evidence(all_consistent(recommended_weight_range_size_159)).
query(true_val(recommended_weight_range_size_159, v60_plus_kg)).
query(true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159)).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v6=6.0 v7=7.0
% @importance 0.93

0.82::acc(s2, flex_rating_10).
0.93::acc(s23, flex_rating_10).
0.78::acc(s24, flex_rating_10).
0.70::true_val(flex_rating_10, v6); 0.30::true_val(flex_rating_10, v7).
measured(s2, flex_rating_10, v7).
measured(s23, flex_rating_10, v6).
measured(s24, flex_rating_10, v6).
all_consistent(flex_rating_10) :- consistent(s2, flex_rating_10), consistent(s23, flex_rating_10), consistent(s24, flex_rating_10).
evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v6)).
query(true_val(flex_rating_10, v7)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values mid_stiff_7_10=Mid_Stiff_7_of_10 unk_flex_feel=Unknown
% @importance 0.95

0.85::acc(s19, flex_feel).
0.71::true_val(flex_feel, mid_stiff_7_10); 0.29::true_val(flex_feel, unk_flex_feel).
measured(s19, flex_feel, mid_stiff_7_10).
all_consistent(flex_feel) :- consistent(s19, flex_feel).
evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, mid_stiff_7_10)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr flex_rating_10_evo
% @type categorical
% @canonical false
% @original_name flex_rating_10 (evo classification)
% @values medium=Medium_most_versatile unk_flex_rating_10_evo=Unknown
% @importance 0.8

0.75::acc(s25, flex_rating_10_evo).
0.64::true_val(flex_rating_10_evo, medium); 0.36::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).
measured(s25, flex_rating_10_evo, medium).
all_consistent(flex_rating_10_evo) :- consistent(s25, flex_rating_10_evo).
evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, medium)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

% @attr flex_feel_qualitative
% @type categorical
% @canonical false
% @original_name flex_feel (qualitative description)
% @values stiffer_tips_softer_mid=Stiffer_tips_tails_softer_between_feet unk_flex_feel_qualitative=Unknown
% @importance 0.75

0.72::acc(s26, flex_feel_qualitative).
0.55::true_val(flex_feel_qualitative, stiffer_tips_softer_mid); 0.45::true_val(flex_feel_qualitative, unk_flex_feel_qualitative).
measured(s26, flex_feel_qualitative, stiffer_tips_softer_mid).
all_consistent(flex_feel_qualitative) :- consistent(s26, flex_feel_qualitative).
evidence(all_consistent(flex_feel_qualitative)).
query(true_val(flex_feel_qualitative, stiffer_tips_softer_mid)).
query(true_val(flex_feel_qualitative, unk_flex_feel_qualitative)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values op_aspen_paulownia=OP_75pct_Aspen_25pct_Paulownia_TriAx_BiAx unk_core_material=Unknown
% @importance 0.9

0.88::acc(s2, core_material).
0.75::acc(s27, core_material).
0.95::true_val(core_material, op_aspen_paulownia); 0.05::true_val(core_material, unk_core_material).
measured(s2, core_material, op_aspen_paulownia).
measured(s27, core_material, op_aspen_paulownia).
all_consistent(core_material) :- consistent(s2, core_material), (indep(s27), consistent(s27, core_material) ; \+indep(s27)).
evidence(all_consistent(core_material)).
query(true_val(core_material, op_aspen_paulownia)).
query(true_val(core_material, unk_core_material)).

% @attr core_material_description
% @type categorical
% @canonical false
% @original_name core_material (description)
% @values light_strong_durable=Light_strong_durable_go_to_construction unk_core_material_description=Unknown
% @importance 0.6

0.72::acc(s28, core_material_description).
0.60::true_val(core_material_description, light_strong_durable); 0.40::true_val(core_material_description, unk_core_material_description).
measured(s28, core_material_description, light_strong_durable).
all_consistent(core_material_description) :- consistent(s28, core_material_description).
evidence(all_consistent(core_material_description)).
query(true_val(core_material_description, light_strong_durable)).
query(true_val(core_material_description, unk_core_material_description)).

% @attr core_material_blend_ratio
% @type categorical
% @canonical false
% @original_name core_material_blend_ratio
% @values aspen_75_paulownia_25=Aspen_75pct_Paulownia_25pct unk_core_material_blend_ratio=Unknown
% @importance 1.0

0.85::acc(s2, core_material_blend_ratio).
0.81::true_val(core_material_blend_ratio, aspen_75_paulownia_25); 0.19::true_val(core_material_blend_ratio, unk_core_material_blend_ratio).
measured(s2, core_material_blend_ratio, aspen_75_paulownia_25).
all_consistent(core_material_blend_ratio) :- consistent(s2, core_material_blend_ratio).
evidence(all_consistent(core_material_blend_ratio)).
query(true_val(core_material_blend_ratio, aspen_75_paulownia_25)).
query(true_val(core_material_blend_ratio, unk_core_material_blend_ratio)).

% @attr sustainability_certification_fsc
% @type categorical
% @canonical false
% @original_name sustainability_certification (FSC)
% @values fsc_certified=FSC_certified_fast_growing_renewable unk_sustainability_certification_fsc=Unknown
% @importance 0.5

0.83::acc(s29, sustainability_certification_fsc).
0.77::true_val(sustainability_certification_fsc, fsc_certified); 0.23::true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc).
measured(s29, sustainability_certification_fsc, fsc_certified).
all_consistent(sustainability_certification_fsc) :- consistent(s29, sustainability_certification_fsc).
evidence(all_consistent(sustainability_certification_fsc)).
query(true_val(sustainability_certification_fsc, fsc_certified)).
query(true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc)).

% @attr laminate
% @type categorical
% @canonical false
% @original_name laminate
% @values tri_ax_bi_ax=Tri_Ax_Bi_Ax_Fiber unk_laminate=Unknown
% @importance 1.0

0.85::acc(s2, laminate).
0.81::true_val(laminate, tri_ax_bi_ax); 0.19::true_val(laminate, unk_laminate).
measured(s2, laminate, tri_ax_bi_ax).
all_consistent(laminate) :- consistent(s2, laminate).
evidence(all_consistent(laminate)).
query(true_val(laminate, tri_ax_bi_ax)).
query(true_val(laminate, unk_laminate)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation (Tri-Ax)
% @values tri_ax_3way=3way_fiber_snap_decrease_vibrations unk_construction_material_innovation=Unknown
% @importance 0.6

0.78::acc(s30, construction_material_innovation).
0.72::true_val(construction_material_innovation, tri_ax_3way); 0.28::true_val(construction_material_innovation, unk_construction_material_innovation).
measured(s30, construction_material_innovation, tri_ax_3way).
all_consistent(construction_material_innovation) :- consistent(s30, construction_material_innovation).
evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, tri_ax_3way)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr construction_material_innovation_biax
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Bi-Ax)
% @values bi_ax_2way=2way_fiber_max_snap_decrease_chatter unk_construction_material_innovation_biax=Unknown
% @importance 0.6

0.78::acc(s31, construction_material_innovation_biax).
0.72::true_val(construction_material_innovation_biax, bi_ax_2way); 0.28::true_val(construction_material_innovation_biax, unk_construction_material_innovation_biax).
measured(s31, construction_material_innovation_biax, bi_ax_2way).
all_consistent(construction_material_innovation_biax) :- consistent(s31, construction_material_innovation_biax).
evidence(all_consistent(construction_material_innovation_biax)).
query(true_val(construction_material_innovation_biax, bi_ax_2way)).
query(true_val(construction_material_innovation_biax, unk_construction_material_innovation_biax)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values birch_uhmw=Birch_Internal_plus_UHMW_Sintered unk_sidewall_material=Unknown
% @importance 0.8

0.85::acc(s2, sidewall_material).
0.72::acc(s32, sidewall_material).
0.95::true_val(sidewall_material, birch_uhmw); 0.05::true_val(sidewall_material, unk_sidewall_material).
measured(s2, sidewall_material, birch_uhmw).
measured(s32, sidewall_material, birch_uhmw).
all_consistent(sidewall_material) :- consistent(s2, sidewall_material), (indep(s32), consistent(s32, sidewall_material) ; \+indep(s32)).
evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, birch_uhmw)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr sidewall_material_birch_desc
% @type categorical
% @canonical false
% @original_name sidewall_material (Birch description)
% @values birch_pop_durability=Rugged_lightweight_vertical_endgrain_Birch_pop_durability unk_sidewall_material_birch_desc=Unknown
% @importance 0.55

0.78::acc(s33, sidewall_material_birch_desc).
0.72::true_val(sidewall_material_birch_desc, birch_pop_durability); 0.28::true_val(sidewall_material_birch_desc, unk_sidewall_material_birch_desc).
measured(s33, sidewall_material_birch_desc, birch_pop_durability).
all_consistent(sidewall_material_birch_desc) :- consistent(s33, sidewall_material_birch_desc).
evidence(all_consistent(sidewall_material_birch_desc)).
query(true_val(sidewall_material_birch_desc, birch_pop_durability)).
query(true_val(sidewall_material_birch_desc, unk_sidewall_material_birch_desc)).

% @attr sidewall_material_uhmw_desc
% @type categorical
% @canonical false
% @original_name sidewall_material (UHMW description)
% @values uhmw_twice_sintered=UHMW_twice_sintered_durability_response_control unk_sidewall_material_uhmw_desc=Unknown
% @importance 0.55

0.78::acc(s34, sidewall_material_uhmw_desc).
0.68::true_val(sidewall_material_uhmw_desc, uhmw_twice_sintered); 0.32::true_val(sidewall_material_uhmw_desc, unk_sidewall_material_uhmw_desc).
measured(s34, sidewall_material_uhmw_desc, uhmw_twice_sintered).
all_consistent(sidewall_material_uhmw_desc) :- consistent(s34, sidewall_material_uhmw_desc).
evidence(all_consistent(sidewall_material_uhmw_desc)).
query(true_val(sidewall_material_uhmw_desc, uhmw_twice_sintered)).
query(true_val(sidewall_material_uhmw_desc, unk_sidewall_material_uhmw_desc)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_knife_cut=Sintered_Knife_Cut_Base unk_base_material=Unknown
% @importance 1.0

0.88::acc(s2, base_material).
0.81::true_val(base_material, sintered_knife_cut); 0.19::true_val(base_material, unk_base_material).
measured(s2, base_material, sintered_knife_cut).
all_consistent(base_material) :- consistent(s2, base_material).
evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_knife_cut)).
query(true_val(base_material, unk_base_material)).

% @attr base_material_description
% @type categorical
% @canonical false
% @original_name base_material (description)
% @values high_density_uhmw=High_density_UHMW_optimized_wax_retention unk_base_material_description=Unknown
% @importance 0.7

0.78::acc(s35, base_material_description).
0.72::true_val(base_material_description, high_density_uhmw); 0.28::true_val(base_material_description, unk_base_material_description).
measured(s35, base_material_description, high_density_uhmw).
all_consistent(base_material_description) :- consistent(s35, base_material_description).
evidence(all_consistent(base_material_description)).
query(true_val(base_material_description, high_density_uhmw)).
query(true_val(base_material_description, unk_base_material_description)).

% @attr base_type
% @type categorical
% @canonical false
% @original_name base_type
% @values sintered_die_cut=Sintered_fast_die_cut_reduce_waste unk_base_type=Unknown
% @importance 1.0

0.85::acc(s2, base_type).
0.81::true_val(base_type, sintered_die_cut); 0.19::true_val(base_type, unk_base_type).
measured(s2, base_type, sintered_die_cut).
all_consistent(base_type) :- consistent(s2, base_type).
evidence(all_consistent(base_type)).
query(true_val(base_type, sintered_die_cut)).
query(true_val(base_type, unk_base_type)).

% @attr topsheet
% @type categorical
% @canonical false
% @original_name topsheet
% @values eco_sublimated_poly=Eco_Sublimated_Poly_Topsheet unk_topsheet=Unknown
% @importance 1.0

0.85::acc(s2, topsheet).
0.81::true_val(topsheet, eco_sublimated_poly); 0.19::true_val(topsheet, unk_topsheet).
measured(s2, topsheet, eco_sublimated_poly).
all_consistent(topsheet) :- consistent(s2, topsheet).
evidence(all_consistent(topsheet)).
query(true_val(topsheet, eco_sublimated_poly)).
query(true_val(topsheet, unk_topsheet)).

% @attr topsheet_appearance_description
% @type categorical
% @canonical false
% @original_name topsheet_appearance_description
% @values high_strength_eco=High_strength_impact_resistant_UV_resistant_eco_sublimation unk_topsheet_appearance_description=Unknown
% @importance 0.5

0.78::acc(s36, topsheet_appearance_description).
0.68::true_val(topsheet_appearance_description, high_strength_eco); 0.32::true_val(topsheet_appearance_description, unk_topsheet_appearance_description).
measured(s36, topsheet_appearance_description, high_strength_eco).
all_consistent(topsheet_appearance_description) :- consistent(s36, topsheet_appearance_description).
evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, high_strength_eco)).
query(true_val(topsheet_appearance_description, unk_topsheet_appearance_description)).

% @attr construction_material_innovation_tip_tail
% @type categorical
% @canonical false
% @original_name construction_material_innovation (UHMW Tip/Tail)
% @values uhmw_tip_tail=UHMW_Tip_Tail_Impact_Deflection_edge_not_beyond_contact unk_construction_material_innovation_tip_tail=Unknown
% @importance 0.8

0.85::acc(s2, construction_material_innovation_tip_tail).
0.75::acc(s37, construction_material_innovation_tip_tail).
0.95::true_val(construction_material_innovation_tip_tail, uhmw_tip_tail); 0.05::true_val(construction_material_innovation_tip_tail, unk_construction_material_innovation_tip_tail).
measured(s2, construction_material_innovation_tip_tail, uhmw_tip_tail).
measured(s37, construction_material_innovation_tip_tail, uhmw_tip_tail).
all_consistent(construction_material_innovation_tip_tail) :- consistent(s2, construction_material_innovation_tip_tail), consistent(s37, construction_material_innovation_tip_tail).
evidence(all_consistent(construction_material_innovation_tip_tail)).
query(true_val(construction_material_innovation_tip_tail, uhmw_tip_tail)).
query(true_val(construction_material_innovation_tip_tail, unk_construction_material_innovation_tip_tail)).

% @attr mounting_pattern
% @type categorical
% @canonical false
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 1.0

0.88::acc(s2, mounting_pattern).
0.81::true_val(mounting_pattern, inserts_2x4); 0.19::true_val(mounting_pattern, unk_mounting_pattern).
measured(s2, mounting_pattern, inserts_2x4).
all_consistent(mounting_pattern) :- consistent(s2, mounting_pattern).
evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values all_2x4_no_burton_3d_est=All_standard_2x4_excludes_Burton_3D_EST unk_binding_compatibility=Unknown
% @importance 0.7

0.85::acc(s2, binding_compatibility).
0.75::acc(s38, binding_compatibility).
0.95::true_val(binding_compatibility, all_2x4_no_burton_3d_est); 0.05::true_val(binding_compatibility, unk_binding_compatibility).
measured(s2, binding_compatibility, all_2x4_no_burton_3d_est).
measured(s38, binding_compatibility, all_2x4_no_burton_3d_est).
all_consistent(binding_compatibility) :- consistent(s2, binding_compatibility), (indep(s38), consistent(s38, binding_compatibility) ; \+indep(s38)).
evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, all_2x4_no_burton_3d_est)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values no_mag=No_Magne_Traction_traditional_edges has_mag=Magne_Traction_serrated_edges
% @importance 0.9

0.95::acc(s39, edge_technology).
0.65::acc(s40, edge_technology).
0.50::acc(s41, edge_technology).
0.72::acc(s2, edge_technology).
0.75::acc(s42, edge_technology).
0.75::true_val(edge_technology, no_mag); 0.25::true_val(edge_technology, has_mag).
measured(s39, edge_technology, no_mag).
measured(s40, edge_technology, has_mag).
measured(s41, edge_technology, has_mag).
measured(s2, edge_technology, no_mag).
measured(s42, edge_technology, no_mag).
all_consistent(edge_technology) :- consistent(s39, edge_technology), consistent(s2, edge_technology), (indep(s40), consistent(s40, edge_technology) ; \+indep(s40)), (indep(s41), consistent(s41, edge_technology) ; \+indep(s41)), (indep(s42), consistent(s42, edge_technology) ; \+indep(s42)).
evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, no_mag)).
query(true_val(edge_technology, has_mag)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values resort_park=Resort_Park unk_terrain_suitability=Unknown
% @importance 1.0

0.85::acc(s2, terrain_suitability).
0.81::true_val(terrain_suitability, resort_park); 0.19::true_val(terrain_suitability, unk_terrain_suitability).
measured(s2, terrain_suitability, resort_park).
all_consistent(terrain_suitability) :- consistent(s2, terrain_suitability).
evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, resort_park)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr riding_style
% @type categorical
% @canonical false
% @original_name riding_style
% @values freestyle_all_mountain=Freestyle_All_Mountain unk_riding_style=Unknown
% @importance 1.0

0.85::acc(s2, riding_style).
0.81::true_val(riding_style, freestyle_all_mountain); 0.19::true_val(riding_style, unk_riding_style).
measured(s2, riding_style, freestyle_all_mountain).
all_consistent(riding_style) :- consistent(s2, riding_style).
evidence(all_consistent(riding_style)).
query(true_val(riding_style, freestyle_all_mountain)).
query(true_val(riding_style, unk_riding_style)).

% @attr rider_level
% @type categorical
% @canonical false
% @original_name rider_level
% @values intermediate_advanced=Intermediate_Advanced unk_rider_level=Unknown
% @importance 1.0

0.85::acc(s2, rider_level).
0.81::true_val(rider_level, intermediate_advanced); 0.19::true_val(rider_level, unk_rider_level).
measured(s2, rider_level, intermediate_advanced).
all_consistent(rider_level) :- consistent(s2, rider_level).
evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate_advanced)).
query(true_val(rider_level, unk_rider_level)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values adv_to_expert=Advanced_to_Expert int_to_expert=Intermediate_to_Expert
% @importance 0.825

0.82::acc(s19, skill_level_recommendation).
0.75::acc(s43, skill_level_recommendation).
0.50::true_val(skill_level_recommendation, adv_to_expert); 0.50::true_val(skill_level_recommendation, int_to_expert).
measured(s19, skill_level_recommendation, adv_to_expert).
measured(s43, skill_level_recommendation, int_to_expert).
all_consistent(skill_level_recommendation) :- consistent(s19, skill_level_recommendation), consistent(s43, skill_level_recommendation).
evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, adv_to_expert)).
query(true_val(skill_level_recommendation, int_to_expert)).

% @attr terrain_suitability_detailed
% @type categorical
% @canonical false
% @original_name terrain_suitability (detailed)
% @values pipe_park_streets_resort=Pipe_park_streets_resort_freestyle unk_terrain_suitability_detailed=Unknown
% @importance 0.8

0.90::acc(s44, terrain_suitability_detailed).
0.81::true_val(terrain_suitability_detailed, pipe_park_streets_resort); 0.19::true_val(terrain_suitability_detailed, unk_terrain_suitability_detailed).
measured(s44, terrain_suitability_detailed, pipe_park_streets_resort).
all_consistent(terrain_suitability_detailed) :- consistent(s44, terrain_suitability_detailed).
evidence(all_consistent(terrain_suitability_detailed)).
query(true_val(terrain_suitability_detailed, pipe_park_streets_resort)).
query(true_val(terrain_suitability_detailed, unk_terrain_suitability_detailed)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 1.0

0.88::acc(s2, gender).
0.81::true_val(gender, mens); 0.19::true_val(gender, unk_gender).
measured(s2, gender, mens).
all_consistent(gender) :- consistent(s2, gender).
evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr skill_level_recommendation_profile
% @type categorical
% @canonical false
% @original_name skill_level_recommendation (rider profile)
% @values aggressive_freestyle=Aggressive_minded_freestyle_riders unk_skill_level_recommendation_profile=Unknown
% @importance 0.85

0.88::acc(s22, skill_level_recommendation_profile).
0.81::true_val(skill_level_recommendation_profile, aggressive_freestyle); 0.19::true_val(skill_level_recommendation_profile, unk_skill_level_recommendation_profile).
measured(s22, skill_level_recommendation_profile, aggressive_freestyle).
all_consistent(skill_level_recommendation_profile) :- consistent(s22, skill_level_recommendation_profile).
evidence(all_consistent(skill_level_recommendation_profile)).
query(true_val(skill_level_recommendation_profile, aggressive_freestyle)).
query(true_val(skill_level_recommendation_profile, unk_skill_level_recommendation_profile)).

% @attr terrain_suitability_conditions
% @type categorical
% @canonical false
% @original_name terrain_suitability (conditions)
% @values ice_hardpack_groomed_park=Ice_hardpack_groomed_park_features unk_terrain_suitability_conditions=Unknown
% @importance 0.85

0.88::acc(s22, terrain_suitability_conditions).
0.81::true_val(terrain_suitability_conditions, ice_hardpack_groomed_park); 0.19::true_val(terrain_suitability_conditions, unk_terrain_suitability_conditions).
measured(s22, terrain_suitability_conditions, ice_hardpack_groomed_park).
all_consistent(terrain_suitability_conditions) :- consistent(s22, terrain_suitability_conditions).
evidence(all_consistent(terrain_suitability_conditions)).
query(true_val(terrain_suitability_conditions, ice_hardpack_groomed_park)).
query(true_val(terrain_suitability_conditions, unk_terrain_suitability_conditions)).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v1199_99=1199.99 unk_price_aud_merchant=Unknown
% @importance 0.9

0.85::acc(s2, price_aud_merchant).
0.72::acc(s50, price_aud_merchant).
0.95::true_val(price_aud_merchant, v1199_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).
measured(s2, price_aud_merchant, v1199_99).
measured(s50, price_aud_merchant, v1199_99).
all_consistent(price_aud_merchant) :- consistent(s2, price_aud_merchant), (indep(s50), consistent(s50, price_aud_merchant) ; \+indep(s50)).
evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v1199_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v699_99=699.99 unk_price_usd_msrp=Unknown
% @importance 0.95

0.95::acc(s45, price_usd_msrp).
0.90::true_val(price_usd_msrp, v699_99); 0.10::true_val(price_usd_msrp, unk_price_usd_msrp).
measured(s45, price_usd_msrp, v699_99).
all_consistent(price_usd_msrp) :- consistent(s45, price_usd_msrp).
evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v699_99)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_eur_blue_tomato
% @type numeric
% @unit EUR
% @canonical false
% @original_name price_eur_blue_tomato
% @values v699_99=699.99 unk_price_eur_blue_tomato=Unknown
% @importance 0.8

0.93::acc(s46, price_eur_blue_tomato).
0.90::true_val(price_eur_blue_tomato, v699_99); 0.10::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).
measured(s46, price_eur_blue_tomato, v699_99).
all_consistent(price_eur_blue_tomato) :- consistent(s46, price_eur_blue_tomato).
evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v699_99)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

% @attr price_gbp_blue_tomato_uk
% @type numeric
% @unit GBP
% @canonical false
% @original_name price_gbp_blue_tomato_uk
% @values v609_99=609.99 unk_price_gbp_blue_tomato_uk=Unknown
% @importance 0.8

0.90::acc(s47, price_gbp_blue_tomato_uk).
0.86::true_val(price_gbp_blue_tomato_uk, v609_99); 0.14::true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk).
measured(s47, price_gbp_blue_tomato_uk, v609_99).
all_consistent(price_gbp_blue_tomato_uk) :- consistent(s47, price_gbp_blue_tomato_uk).
evidence(all_consistent(price_gbp_blue_tomato_uk)).
query(true_val(price_gbp_blue_tomato_uk, v609_99)).
query(true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk)).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_evo
% @values v489_99=489.99 unk_price_usd_evo=Unknown
% @importance 0.9

0.82::acc(s48, price_usd_evo).
0.72::true_val(price_usd_evo, v489_99); 0.28::true_val(price_usd_evo, unk_price_usd_evo).
measured(s48, price_usd_evo, v489_99).
all_consistent(price_usd_evo) :- consistent(s48, price_usd_evo).
evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v489_99)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_cbs_2025
% @type numeric
% @unit USD
% @canonical false
% @original_name USD sale price (CBS Boardshop, 2025 model)
% @values v489_00=489.0 unk_price_usd_cbs_2025=Unknown
% @importance 0.75

0.65::acc(s49, price_usd_cbs_2025).
0.51::true_val(price_usd_cbs_2025, v489_00); 0.49::true_val(price_usd_cbs_2025, unk_price_usd_cbs_2025).
measured(s49, price_usd_cbs_2025, v489_00).
all_consistent(price_usd_cbs_2025) :- consistent(s49, price_usd_cbs_2025).
evidence(all_consistent(price_usd_cbs_2025)).
query(true_val(price_usd_cbs_2025, v489_00)).
query(true_val(price_usd_cbs_2025, unk_price_usd_cbs_2025)).

% @attr availability_status_libtech
% @type categorical
% @canonical false
% @original_name availability_status (Lib Tech direct)
% @values available=Available_manufacturer_direct unk_availability_status_libtech=Unknown
% @importance 0.95

0.93::acc(s45, availability_status_libtech).
0.90::true_val(availability_status_libtech, available); 0.10::true_val(availability_status_libtech, unk_availability_status_libtech).
measured(s45, availability_status_libtech, available).
all_consistent(availability_status_libtech) :- consistent(s45, availability_status_libtech).
evidence(all_consistent(availability_status_libtech)).
query(true_val(availability_status_libtech, available)).
query(true_val(availability_status_libtech, unk_availability_status_libtech)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status (evo.com)
% @values available=Available_evo unk_availability_status_evo=Unknown
% @importance 0.9

0.80::acc(s48, availability_status_evo).
0.72::true_val(availability_status_evo, available); 0.28::true_val(availability_status_evo, unk_availability_status_evo).
measured(s48, availability_status_evo, available).
all_consistent(availability_status_evo) :- consistent(s48, availability_status_evo).
evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, available)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

% @attr availability_status_tactics
% @type categorical
% @canonical false
% @original_name availability_status (Tactics.com)
% @values available=Available_tactics unk_availability_status_tactics=Unknown
% @importance 0.5

0.75::acc(s51, availability_status_tactics).
0.56::true_val(availability_status_tactics, available); 0.44::true_val(availability_status_tactics, unk_availability_status_tactics).
measured(s51, availability_status_tactics, available).
all_consistent(availability_status_tactics) :- consistent(s51, availability_status_tactics).
evidence(all_consistent(availability_status_tactics)).
query(true_val(availability_status_tactics, available)).
query(true_val(availability_status_tactics, unk_availability_status_tactics)).

% @attr availability_status_amazon
% @type categorical
% @canonical false
% @original_name availability_status (Amazon.com)
% @values available=Available_amazon unk_availability_status_amazon=Unknown
% @importance 0.5

0.68::acc(s52, availability_status_amazon).
0.49::true_val(availability_status_amazon, available); 0.51::true_val(availability_status_amazon, unk_availability_status_amazon).
measured(s52, availability_status_amazon, available).
all_consistent(availability_status_amazon) :- consistent(s52, availability_status_amazon).
evidence(all_consistent(availability_status_amazon)).
query(true_val(availability_status_amazon, available)).
query(true_val(availability_status_amazon, unk_availability_status_amazon)).

% @attr availability_status_melbourne
% @type categorical
% @canonical false
% @original_name availability_status (Melbourne Snowboard Centre)
% @values available=Available_melbourne unk_availability_status_melbourne=Unknown
% @importance 0.8

0.72::acc(s50, availability_status_melbourne).
0.60::true_val(availability_status_melbourne, available); 0.40::true_val(availability_status_melbourne, unk_availability_status_melbourne).
measured(s50, availability_status_melbourne, available).
all_consistent(availability_status_melbourne) :- consistent(s50, availability_status_melbourne).
evidence(all_consistent(availability_status_melbourne)).
query(true_val(availability_status_melbourne, available)).
query(true_val(availability_status_melbourne, unk_availability_status_melbourne)).

% @attr availability_status_rhythm
% @type categorical
% @canonical false
% @original_name availability_status (Rhythm Snowsports)
% @values available=Available_rhythm unk_availability_status_rhythm=Unknown
% @importance 0.5

0.68::acc(s53, availability_status_rhythm).
0.49::true_val(availability_status_rhythm, available); 0.51::true_val(availability_status_rhythm, unk_availability_status_rhythm).
measured(s53, availability_status_rhythm, available).
all_consistent(availability_status_rhythm) :- consistent(s53, availability_status_rhythm).
evidence(all_consistent(availability_status_rhythm)).
query(true_val(availability_status_rhythm, available)).
query(true_val(availability_status_rhythm, unk_availability_status_rhythm)).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status (Blauer Board Shop)
% @values available=Available_blauer unk_availability_status_blauer=Unknown
% @importance 0.7

0.72::acc(s43, availability_status_blauer).
0.60::true_val(availability_status_blauer, available); 0.40::true_val(availability_status_blauer, unk_availability_status_blauer).
measured(s43, availability_status_blauer, available).
all_consistent(availability_status_blauer) :- consistent(s43, availability_status_blauer).
evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, available)).
query(true_val(availability_status_blauer, unk_availability_status_blauer)).

% @attr availability_status_glacier
% @type categorical
% @canonical false
% @original_name availability_status (Glacier Ski Shop)
% @values available=Available_glacier unk_availability_status_glacier=Unknown
% @importance 0.5

0.68::acc(s54, availability_status_glacier).
0.49::true_val(availability_status_glacier, available); 0.51::true_val(availability_status_glacier, unk_availability_status_glacier).
measured(s54, availability_status_glacier, available).
all_consistent(availability_status_glacier) :- consistent(s54, availability_status_glacier).
evidence(all_consistent(availability_status_glacier)).
query(true_val(availability_status_glacier, available)).
query(true_val(availability_status_glacier, unk_availability_status_glacier)).

% @attr availability_status_source_ca
% @type categorical
% @canonical false
% @original_name availability_status (Source Snowboard Canada)
% @values available=Available_source_ca unk_availability_status_source_ca=Unknown
% @importance 0.5

0.68::acc(s55, availability_status_source_ca).
0.49::true_val(availability_status_source_ca, available); 0.51::true_val(availability_status_source_ca, unk_availability_status_source_ca).
measured(s55, availability_status_source_ca, available).
all_consistent(availability_status_source_ca) :- consistent(s55, availability_status_source_ca).
evidence(all_consistent(availability_status_source_ca)).
query(true_val(availability_status_source_ca, available)).
query(true_val(availability_status_source_ca, unk_availability_status_source_ca)).

% @attr availability_status_skiworld
% @type categorical
% @canonical false
% @original_name availability_status (Ski World)
% @values available=Available_skiworld unk_availability_status_skiworld=Unknown
% @importance 0.75

0.65::acc(s56, availability_status_skiworld).
0.51::true_val(availability_status_skiworld, available); 0.49::true_val(availability_status_skiworld, unk_availability_status_skiworld).
measured(s56, availability_status_skiworld, available).
all_consistent(availability_status_skiworld) :- consistent(s56, availability_status_skiworld).
evidence(all_consistent(availability_status_skiworld)).
query(true_val(availability_status_skiworld, available)).
query(true_val(availability_status_skiworld, unk_availability_status_skiworld)).

% @attr availability_status_asylum
% @type categorical
% @canonical false
% @original_name availability_status (Snowboard Asylum)
% @values available=Available_asylum unk_availability_status_asylum=Unknown
% @importance 0.5

0.68::acc(s57, availability_status_asylum).
0.46::true_val(availability_status_asylum, available); 0.54::true_val(availability_status_asylum, unk_availability_status_asylum).
measured(s57, availability_status_asylum, available).
all_consistent(availability_status_asylum) :- consistent(s57, availability_status_asylum).
evidence(all_consistent(availability_status_asylum)).
query(true_val(availability_status_asylum, available)).
query(true_val(availability_status_asylum, unk_availability_status_asylum)).

% @attr availability_status_snowcountry
% @type categorical
% @canonical false
% @original_name availability_status (Snowcountry.eu)
% @values available=Available_snowcountry unk_availability_status_snowcountry=Unknown
% @importance 0.5

0.68::acc(s58, availability_status_snowcountry).
0.49::true_val(availability_status_snowcountry, available); 0.51::true_val(availability_status_snowcountry, unk_availability_status_snowcountry).
measured(s58, availability_status_snowcountry, available).
all_consistent(availability_status_snowcountry) :- consistent(s58, availability_status_snowcountry).
evidence(all_consistent(availability_status_snowcountry)).
query(true_val(availability_status_snowcountry, available)).
query(true_val(availability_status_snowcountry, unk_availability_status_snowcountry)).

% @attr warranty_period_years
% @type numeric
% @unit years
% @canonical false
% @original_name warranty_period_years
% @values v1=1.0 unk_warranty_period_years=Unknown
% @importance 0.7

0.82::acc(s59, warranty_period_years).
0.72::true_val(warranty_period_years, v1); 0.28::true_val(warranty_period_years, unk_warranty_period_years).
measured(s59, warranty_period_years, v1).
all_consistent(warranty_period_years) :- consistent(s59, warranty_period_years).
evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v1)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values structural_defects_only=Structural_defects_only unk_warranty=Unknown
% @importance 0.7

0.82::acc(s60, warranty).
0.76::true_val(warranty, structural_defects_only); 0.24::true_val(warranty, unk_warranty).
measured(s60, warranty, structural_defects_only).
all_consistent(warranty) :- consistent(s60, warranty).
evidence(all_consistent(warranty)).
query(true_val(warranty, structural_defects_only)).
query(true_val(warranty, unk_warranty)).

% @attr warranty_exclusions
% @type categorical
% @canonical false
% @original_name warranty (exclusions)
% @values no_impact_abuse_wear=No_impact_damage_abuse_misuse_normal_wear unk_warranty_exclusions=Unknown
% @importance 0.7

0.82::acc(s60, warranty_exclusions).
0.76::true_val(warranty_exclusions, no_impact_abuse_wear); 0.24::true_val(warranty_exclusions, unk_warranty_exclusions).
measured(s60, warranty_exclusions, no_impact_abuse_wear).
all_consistent(warranty_exclusions) :- consistent(s60, warranty_exclusions).
evidence(all_consistent(warranty_exclusions)).
query(true_val(warranty_exclusions, no_impact_abuse_wear)).
query(true_val(warranty_exclusions, unk_warranty_exclusions)).

% @attr sustainability_certification_cleaners
% @type categorical
% @canonical false
% @original_name sustainability_certification (cleaners)
% @values water_citrus_based=Water_citrus_based_cleaners_no_petrochemical unk_sustainability_certification_cleaners=Unknown
% @importance 0.4

0.78::acc(s61, sustainability_certification_cleaners).
0.68::true_val(sustainability_certification_cleaners, water_citrus_based); 0.32::true_val(sustainability_certification_cleaners, unk_sustainability_certification_cleaners).
measured(s61, sustainability_certification_cleaners, water_citrus_based).
all_consistent(sustainability_certification_cleaners) :- consistent(s61, sustainability_certification_cleaners).
evidence(all_consistent(sustainability_certification_cleaners)).
query(true_val(sustainability_certification_cleaners, water_citrus_based)).
query(true_val(sustainability_certification_cleaners, unk_sustainability_certification_cleaners)).

% @attr sustainability_certification_recycling
% @type categorical
% @canonical false
% @original_name sustainability_certification (recycling)
% @values sawdust_scrap_recycled=Sawdust_soil_additive_scrap_wood_kindling unk_sustainability_certification_recycling=Unknown
% @importance 0.35

0.78::acc(s62, sustainability_certification_recycling).
0.68::true_val(sustainability_certification_recycling, sawdust_scrap_recycled); 0.32::true_val(sustainability_certification_recycling, unk_sustainability_certification_recycling).
measured(s62, sustainability_certification_recycling, sawdust_scrap_recycled).
all_consistent(sustainability_certification_recycling) :- consistent(s62, sustainability_certification_recycling).
evidence(all_consistent(sustainability_certification_recycling)).
query(true_val(sustainability_certification_recycling, sawdust_scrap_recycled)).
query(true_val(sustainability_certification_recycling, unk_sustainability_certification_recycling)).

% @attr sustainability_certification_base_waste
% @type categorical
% @canonical false
% @original_name sustainability_certification (base waste)
% @values knife_cut_recycle=Knife_cut_base_reduces_waste_sublimation_recycles unk_sustainability_certification_base_waste=Unknown
% @importance 0.3

0.80::acc(s63, sustainability_certification_base_waste).
0.68::true_val(sustainability_certification_base_waste, knife_cut_recycle); 0.32::true_val(sustainability_certification_base_waste, unk_sustainability_certification_base_waste).
measured(s63, sustainability_certification_base_waste, knife_cut_recycle).
all_consistent(sustainability_certification_base_waste) :- consistent(s63, sustainability_certification_base_waste).
evidence(all_consistent(sustainability_certification_base_waste)).
query(true_val(sustainability_certification_base_waste, knife_cut_recycle)).
query(true_val(sustainability_certification_base_waste, unk_sustainability_certification_base_waste)).

% @attr sustainability_certification_sublimation
% @type categorical
% @canonical false
% @original_name sustainability_certification (sublimation)
% @values eco_sublimation=Eco_sublimation_no_silkscreen_no_toxic_lacquer unk_sustainability_certification_sublimation=Unknown
% @importance 0.3

0.82::acc(s64, sustainability_certification_sublimation).
0.72::true_val(sustainability_certification_sublimation, eco_sublimation); 0.28::true_val(sustainability_certification_sublimation, unk_sustainability_certification_sublimation).
measured(s64, sustainability_certification_sublimation, eco_sublimation).
all_consistent(sustainability_certification_sublimation) :- consistent(s64, sustainability_certification_sublimation).
evidence(all_consistent(sustainability_certification_sublimation)).
query(true_val(sustainability_certification_sublimation, eco_sublimation)).
query(true_val(sustainability_certification_sublimation, unk_sustainability_certification_sublimation)).

% @attr sustainability_certification_green_power
% @type categorical
% @canonical false
% @original_name sustainability_certification (green power)
% @values green_power_biodiesel=Green_power_PUD_biodiesel_heating unk_sustainability_certification_green_power=Unknown
% @importance 0.3

0.78::acc(s65, sustainability_certification_green_power).
0.64::true_val(sustainability_certification_green_power, green_power_biodiesel); 0.36::true_val(sustainability_certification_green_power, unk_sustainability_certification_green_power).
measured(s65, sustainability_certification_green_power, green_power_biodiesel).
all_consistent(sustainability_certification_green_power) :- consistent(s65, sustainability_certification_green_power).
evidence(all_consistent(sustainability_certification_green_power)).
query(true_val(sustainability_certification_green_power, green_power_biodiesel)).
query(true_val(sustainability_certification_green_power, unk_sustainability_certification_green_power)).

% @attr overall_rating_snowboardingprofiles
% @type numeric
% @unit /100
% @canonical false
% @original_name overall_rating_snowboardingprofiles
% @values v72_8=72.8 unk_overall_rating_snowboardingprofiles=Unknown
% @importance 0.95

0.85::acc(s19, overall_rating_snowboardingprofiles).
0.71::true_val(overall_rating_snowboardingprofiles, v72_8); 0.29::true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles).
measured(s19, overall_rating_snowboardingprofiles, v72_8).
all_consistent(overall_rating_snowboardingprofiles) :- consistent(s19, overall_rating_snowboardingprofiles).
evidence(all_consistent(overall_rating_snowboardingprofiles)).
query(true_val(overall_rating_snowboardingprofiles, v72_8)).
query(true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles)).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name reviewer_opinion_snowboardingprofiles
% @values negative_exception=Seldom_bad_time_sadly_Rad_Ripper_exception unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.9

0.82::acc(s66, reviewer_opinion_snowboardingprofiles).
0.71::true_val(reviewer_opinion_snowboardingprofiles, negative_exception); 0.29::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).
measured(s66, reviewer_opinion_snowboardingprofiles, negative_exception).
all_consistent(reviewer_opinion_snowboardingprofiles) :- consistent(s66, reviewer_opinion_snowboardingprofiles).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, negative_exception)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

% @attr reviewer_opinion_snowboardingprofiles_demands
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (demands)
% @values demands_technique=Demands_good_technique_high_energy_input unk_reviewer_opinion_snowboardingprofiles_demands=Unknown
% @importance 0.85

0.80::acc(s67, reviewer_opinion_snowboardingprofiles_demands).
0.68::true_val(reviewer_opinion_snowboardingprofiles_demands, demands_technique); 0.32::true_val(reviewer_opinion_snowboardingprofiles_demands, unk_reviewer_opinion_snowboardingprofiles_demands).
measured(s67, reviewer_opinion_snowboardingprofiles_demands, demands_technique).
all_consistent(reviewer_opinion_snowboardingprofiles_demands) :- consistent(s67, reviewer_opinion_snowboardingprofiles_demands).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles_demands)).
query(true_val(reviewer_opinion_snowboardingprofiles_demands, demands_technique)).
query(true_val(reviewer_opinion_snowboardingprofiles_demands, unk_reviewer_opinion_snowboardingprofiles_demands)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values responsive_fast_edge=Super_responsive_fast_edge_to_edge unk_positive_aspect=Unknown
% @importance 0.8

0.75::acc(s68, positive_aspect).
0.54::true_val(positive_aspect, responsive_fast_edge); 0.46::true_val(positive_aspect, unk_positive_aspect).
measured(s68, positive_aspect, responsive_fast_edge).
all_consistent(positive_aspect) :- consistent(s68, positive_aspect).
evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, responsive_fast_edge)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr positive_aspect_pop
% @type categorical
% @canonical false
% @original_name positive_aspect (pop and versatility)
% @values snap_pop_versatile=Plenty_snap_pop_performed_well_everywhere unk_positive_aspect_pop=Unknown
% @importance 0.8

0.75::acc(s69, positive_aspect_pop).
0.54::true_val(positive_aspect_pop, snap_pop_versatile); 0.46::true_val(positive_aspect_pop, unk_positive_aspect_pop).
measured(s69, positive_aspect_pop, snap_pop_versatile).
all_consistent(positive_aspect_pop) :- consistent(s69, positive_aspect_pop).
evidence(all_consistent(positive_aspect_pop)).
query(true_val(positive_aspect_pop, snap_pop_versatile)).
query(true_val(positive_aspect_pop, unk_positive_aspect_pop)).

% @attr positive_aspect_stability
% @type categorical
% @canonical false
% @original_name positive_aspect (stability)
% @values stable_uneven_snow=Very_stable_pushed_through_uneven_snow_with_ease unk_positive_aspect_stability=Unknown
% @importance 0.75

0.72::acc(s70, positive_aspect_stability).
0.51::true_val(positive_aspect_stability, stable_uneven_snow); 0.49::true_val(positive_aspect_stability, unk_positive_aspect_stability).
measured(s70, positive_aspect_stability, stable_uneven_snow).
all_consistent(positive_aspect_stability) :- consistent(s70, positive_aspect_stability).
evidence(all_consistent(positive_aspect_stability)).
query(true_val(positive_aspect_stability, stable_uneven_snow)).
query(true_val(positive_aspect_stability, unk_positive_aspect_stability)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values catchy=Catchy_feel_one_of_more_catchy_boards unk_negative_aspect=Unknown
% @importance 0.85

0.82::acc(s71, negative_aspect).
0.68::true_val(negative_aspect, catchy); 0.32::true_val(negative_aspect, unk_negative_aspect).
measured(s71, negative_aspect, catchy).
all_consistent(negative_aspect) :- consistent(s71, negative_aspect).
evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, catchy)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_speed
% @type categorical
% @canonical false
% @original_name negative_aspect (speed stability)
% @values wobbly_chattery=Smaller_speed_limit_before_wobbly_chattery unk_negative_aspect_speed=Unknown
% @importance 0.85

0.82::acc(s72, negative_aspect_speed).
0.68::true_val(negative_aspect_speed, wobbly_chattery); 0.32::true_val(negative_aspect_speed, unk_negative_aspect_speed).
measured(s72, negative_aspect_speed, wobbly_chattery).
all_consistent(negative_aspect_speed) :- consistent(s72, negative_aspect_speed).
evidence(all_consistent(negative_aspect_speed)).
query(true_val(negative_aspect_speed, wobbly_chattery)).
query(true_val(negative_aspect_speed, unk_negative_aspect_speed)).

% @attr negative_aspect_powder
% @type categorical
% @canonical false
% @original_name negative_aspect (powder)
% @values dives_in_powder=Not_suitable_powder_dive_dive_dive unk_negative_aspect_powder=Unknown
% @importance 0.7

0.78::acc(s73, negative_aspect_powder).
0.64::true_val(negative_aspect_powder, dives_in_powder); 0.36::true_val(negative_aspect_powder, unk_negative_aspect_powder).
measured(s73, negative_aspect_powder, dives_in_powder).
all_consistent(negative_aspect_powder) :- consistent(s73, negative_aspect_powder).
evidence(all_consistent(negative_aspect_powder)).
query(true_val(negative_aspect_powder, dives_in_powder)).
query(true_val(negative_aspect_powder, unk_negative_aspect_powder)).

% @attr carving_score_snowboardingprofiles
% @type categorical
% @canonical false
% @original_name carving_score_snowboardingprofiles
% @values good_long_radius=Really_good_long_radius_carves_less_impressive_short unk_carving_score_snowboardingprofiles=Unknown
% @importance 0.8

0.82::acc(s74, carving_score_snowboardingprofiles).
0.68::true_val(carving_score_snowboardingprofiles, good_long_radius); 0.32::true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles).
measured(s74, carving_score_snowboardingprofiles, good_long_radius).
all_consistent(carving_score_snowboardingprofiles) :- consistent(s74, carving_score_snowboardingprofiles).
evidence(all_consistent(carving_score_snowboardingprofiles)).
query(true_val(carving_score_snowboardingprofiles, good_long_radius)).
query(true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles)).

% @attr edge_hold
% @type categorical
% @canonical false
% @original_name edge_hold
% @values suitable_icy=Suitable_for_icy_snow_conditions unk_edge_hold=Unknown
% @importance 0.95

0.82::acc(s19, edge_hold).
0.71::true_val(edge_hold, suitable_icy); 0.29::true_val(edge_hold, unk_edge_hold).
measured(s19, edge_hold, suitable_icy).
all_consistent(edge_hold) :- consistent(s19, edge_hold).
evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, suitable_icy)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr review_count_momentum
% @type numeric
% @canonical false
% @original_name Review count (Momentum Blog)
% @values v48=48.0 unk_review_count_momentum=Unknown
% @importance 0.5

0.55::acc(s75, review_count_momentum).
0.35::true_val(review_count_momentum, v48); 0.65::true_val(review_count_momentum, unk_review_count_momentum).
measured(s75, review_count_momentum, v48).
all_consistent(review_count_momentum) :- consistent(s75, review_count_momentum).
evidence(all_consistent(review_count_momentum)).
query(true_val(review_count_momentum, v48)).
query(true_val(review_count_momentum, unk_review_count_momentum)).

% @attr review_rating_libtech
% @type categorical
% @canonical false
% @original_name Review rating (Lib Tech website)
% @values pct100_3reviews=100pct_of_100_3_reviews unk_review_rating_libtech=Unknown
% @importance 0.95

0.85::acc(s45, review_rating_libtech).
0.90::true_val(review_rating_libtech, pct100_3reviews); 0.10::true_val(review_rating_libtech, unk_review_rating_libtech).
measured(s45, review_rating_libtech, pct100_3reviews).
all_consistent(review_rating_libtech) :- consistent(s45, review_rating_libtech).
evidence(all_consistent(review_rating_libtech)).
query(true_val(review_rating_libtech, pct100_3reviews)).
query(true_val(review_rating_libtech, unk_review_rating_libtech)).

% @attr board_weight_grams
% @type numeric
% @unit grams
% @canonical true
% @original_name board_weight_grams
% @values v2760=2760.0 unk_board_weight_grams=Unknown
% @importance 0.95

0.90::acc(s19, board_weight_grams).
0.71::true_val(board_weight_grams, v2760); 0.29::true_val(board_weight_grams, unk_board_weight_grams).
measured(s19, board_weight_grams, v2760).
all_consistent(board_weight_grams) :- consistent(s19, board_weight_grams).
evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v2760)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr weight_per_cm
% @type numeric
% @unit g/cm
% @canonical false
% @original_name weight_per_cm
% @values v17_69=17.69 unk_weight_per_cm=Unknown
% @importance 0.95

0.88::acc(s19, weight_per_cm).
0.71::true_val(weight_per_cm, v17_69); 0.29::true_val(weight_per_cm, unk_weight_per_cm).
measured(s19, weight_per_cm, v17_69).
all_consistent(weight_per_cm) :- consistent(s19, weight_per_cm).
evidence(all_consistent(weight_per_cm)).
query(true_val(weight_per_cm, v17_69)).
query(true_val(weight_per_cm, unk_weight_per_cm)).

% @attr pop
% @type categorical
% @canonical false
% @original_name pop
% @values good_requires_effort=Good_total_pop_requires_significant_effort unk_pop=Unknown
% @importance 0.9

0.80::acc(s66, pop).
0.71::true_val(pop, good_requires_effort); 0.29::true_val(pop, unk_pop).
measured(s66, pop, good_requires_effort).
all_consistent(pop) :- consistent(s66, pop).
evidence(all_consistent(pop)).
query(true_val(pop, good_requires_effort)).
query(true_val(pop, unk_pop)).

% @attr switch_riding
% @type categorical
% @canonical false
% @original_name switch_riding
% @values fine_same_both=Fine_same_both_directions_transitions_require_concentration unk_switch_riding=Unknown
% @importance 0.9

0.80::acc(s66, switch_riding).
0.71::true_val(switch_riding, fine_same_both); 0.29::true_val(switch_riding, unk_switch_riding).
measured(s66, switch_riding, fine_same_both).
all_consistent(switch_riding) :- consistent(s66, switch_riding).
evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, fine_same_both)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr jibbing_rating_tgr
% @type categorical
% @canonical false
% @original_name jibbing_rating_tgr
% @values not_recommended=Not_recommended_catchy_not_agile unk_jibbing_rating_tgr=Unknown
% @importance 0.9

0.80::acc(s66, jibbing_rating_tgr).
0.71::true_val(jibbing_rating_tgr, not_recommended); 0.29::true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr).
measured(s66, jibbing_rating_tgr, not_recommended).
all_consistent(jibbing_rating_tgr) :- consistent(s66, jibbing_rating_tgr).
evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, not_recommended)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr)).

% @attr reviewer_opinion_snowboardingprofiles_press
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (press)
% @values more_effort_to_press=Slightly_more_effort_to_press_but_achievable unk_reviewer_opinion_snowboardingprofiles_press=Unknown
% @importance 0.9

0.80::acc(s66, reviewer_opinion_snowboardingprofiles_press).
0.71::true_val(reviewer_opinion_snowboardingprofiles_press, more_effort_to_press); 0.29::true_val(reviewer_opinion_snowboardingprofiles_press, unk_reviewer_opinion_snowboardingprofiles_press).
measured(s66, reviewer_opinion_snowboardingprofiles_press, more_effort_to_press).
all_consistent(reviewer_opinion_snowboardingprofiles_press) :- consistent(s66, reviewer_opinion_snowboardingprofiles_press).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles_press)).
query(true_val(reviewer_opinion_snowboardingprofiles_press, more_effort_to_press)).
query(true_val(reviewer_opinion_snowboardingprofiles_press, unk_reviewer_opinion_snowboardingprofiles_press)).

% @attr chatter_performance
% @type categorical
% @canonical false
% @original_name chatter_performance
% @values below_average=Below_average_chattery_feel unk_chatter_performance=Unknown
% @importance 0.95

0.82::acc(s19, chatter_performance).
0.71::true_val(chatter_performance, below_average); 0.29::true_val(chatter_performance, unk_chatter_performance).
measured(s19, chatter_performance, below_average).
all_consistent(chatter_performance) :- consistent(s19, chatter_performance).
evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, below_average)).
query(true_val(chatter_performance, unk_chatter_performance)).

% @attr reviewer_opinion_snowboardingprofiles_aggressive
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (aggressive)
% @values aggressive_8_10=Very_aggressive_character_8_of_10 unk_reviewer_opinion_snowboardingprofiles_aggressive=Unknown
% @importance 0.95

0.82::acc(s19, reviewer_opinion_snowboardingprofiles_aggressive).
0.71::true_val(reviewer_opinion_snowboardingprofiles_aggressive, aggressive_8_10); 0.29::true_val(reviewer_opinion_snowboardingprofiles_aggressive, unk_reviewer_opinion_snowboardingprofiles_aggressive).
measured(s19, reviewer_opinion_snowboardingprofiles_aggressive, aggressive_8_10).
all_consistent(reviewer_opinion_snowboardingprofiles_aggressive) :- consistent(s19, reviewer_opinion_snowboardingprofiles_aggressive).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles_aggressive)).
query(true_val(reviewer_opinion_snowboardingprofiles_aggressive, aggressive_8_10)).
query(true_val(reviewer_opinion_snowboardingprofiles_aggressive, unk_reviewer_opinion_snowboardingprofiles_aggressive)).

% @attr on_snow_feel_tgr
% @type categorical
% @canonical false
% @original_name on_snow_feel_tgr
% @values locked_in=Locked_in unk_on_snow_feel_tgr=Unknown
% @importance 0.95

0.82::acc(s19, on_snow_feel_tgr).
0.71::true_val(on_snow_feel_tgr, locked_in); 0.29::true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr).
measured(s19, on_snow_feel_tgr, locked_in).
all_consistent(on_snow_feel_tgr) :- consistent(s19, on_snow_feel_tgr).
evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, locked_in)).
query(true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values burton_custom_camber=Burton_Custom_Camber_679_95 unk_comparable_board_cross_brand=Unknown
% @importance 0.8

0.75::acc(s76, comparable_board_cross_brand).
0.60::true_val(comparable_board_cross_brand, burton_custom_camber); 0.40::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).
measured(s76, comparable_board_cross_brand, burton_custom_camber).
all_consistent(comparable_board_cross_brand) :- consistent(s76, comparable_board_cross_brand).
evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, burton_custom_camber)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_capita_doa
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (CAPiTA DOA)
% @values capita_doa=CAPiTA_DOA_579_95 unk_comparable_board_cross_brand_capita_doa=Unknown
% @importance 0.8

0.75::acc(s77, comparable_board_cross_brand_capita_doa).
0.60::true_val(comparable_board_cross_brand_capita_doa, capita_doa); 0.40::true_val(comparable_board_cross_brand_capita_doa, unk_comparable_board_cross_brand_capita_doa).
measured(s77, comparable_board_cross_brand_capita_doa, capita_doa).
all_consistent(comparable_board_cross_brand_capita_doa) :- consistent(s77, comparable_board_cross_brand_capita_doa).
evidence(all_consistent(comparable_board_cross_brand_capita_doa)).
query(true_val(comparable_board_cross_brand_capita_doa, capita_doa)).
query(true_val(comparable_board_cross_brand_capita_doa, unk_comparable_board_cross_brand_capita_doa)).

% @attr comparable_board_cross_brand_capita_resort_twin
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (CAPiTA Resort Twin)
% @values capita_resort_twin=CAPiTA_Spring_Break_Resort_Twin unk_comparable_board_cross_brand_capita_resort_twin=Unknown
% @importance 0.7

0.72::acc(s78, comparable_board_cross_brand_capita_resort_twin).
0.53::true_val(comparable_board_cross_brand_capita_resort_twin, capita_resort_twin); 0.47::true_val(comparable_board_cross_brand_capita_resort_twin, unk_comparable_board_cross_brand_capita_resort_twin).
measured(s78, comparable_board_cross_brand_capita_resort_twin, capita_resort_twin).
all_consistent(comparable_board_cross_brand_capita_resort_twin) :- consistent(s78, comparable_board_cross_brand_capita_resort_twin).
evidence(all_consistent(comparable_board_cross_brand_capita_resort_twin)).
query(true_val(comparable_board_cross_brand_capita_resort_twin, capita_resort_twin)).
query(true_val(comparable_board_cross_brand_capita_resort_twin, unk_comparable_board_cross_brand_capita_resort_twin)).

% @attr comparable_board_cross_brand_ns_proto_t3
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Never Summer Proto T3)
% @values ns_proto_t3=Never_Summer_Proto_T3_699_99 unk_comparable_board_cross_brand_ns_proto_t3=Unknown
% @importance 0.8

0.75::acc(s79, comparable_board_cross_brand_ns_proto_t3).
0.60::true_val(comparable_board_cross_brand_ns_proto_t3, ns_proto_t3); 0.40::true_val(comparable_board_cross_brand_ns_proto_t3, unk_comparable_board_cross_brand_ns_proto_t3).
measured(s79, comparable_board_cross_brand_ns_proto_t3, ns_proto_t3).
all_consistent(comparable_board_cross_brand_ns_proto_t3) :- consistent(s79, comparable_board_cross_brand_ns_proto_t3).
evidence(all_consistent(comparable_board_cross_brand_ns_proto_t3)).
query(true_val(comparable_board_cross_brand_ns_proto_t3, ns_proto_t3)).
query(true_val(comparable_board_cross_brand_ns_proto_t3, unk_comparable_board_cross_brand_ns_proto_t3)).

% @attr comparable_board_cross_brand_capita_super_doa
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (CAPiTA Super DOA)
% @values capita_super_doa=CAPiTA_Super_DOA_plus7_4pct_above_avg unk_comparable_board_cross_brand_capita_super_doa=Unknown
% @importance 0.7

0.72::acc(s80, comparable_board_cross_brand_capita_super_doa).
0.56::true_val(comparable_board_cross_brand_capita_super_doa, capita_super_doa); 0.44::true_val(comparable_board_cross_brand_capita_super_doa, unk_comparable_board_cross_brand_capita_super_doa).
measured(s80, comparable_board_cross_brand_capita_super_doa, capita_super_doa).
all_consistent(comparable_board_cross_brand_capita_super_doa) :- consistent(s80, comparable_board_cross_brand_capita_super_doa).
evidence(all_consistent(comparable_board_cross_brand_capita_super_doa)).
query(true_val(comparable_board_cross_brand_capita_super_doa, capita_super_doa)).
query(true_val(comparable_board_cross_brand_capita_super_doa, unk_comparable_board_cross_brand_capita_super_doa)).

% @attr comparable_board_cross_brand_burton_blossom
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Burton Blossom)
% @values burton_blossom=Burton_Blossom_true_twin_camber_park unk_comparable_board_cross_brand_burton_blossom=Unknown
% @importance 0.7

0.72::acc(s81, comparable_board_cross_brand_burton_blossom).
0.53::true_val(comparable_board_cross_brand_burton_blossom, burton_blossom); 0.47::true_val(comparable_board_cross_brand_burton_blossom, unk_comparable_board_cross_brand_burton_blossom).
measured(s81, comparable_board_cross_brand_burton_blossom, burton_blossom).
all_consistent(comparable_board_cross_brand_burton_blossom) :- consistent(s81, comparable_board_cross_brand_burton_blossom).
evidence(all_consistent(comparable_board_cross_brand_burton_blossom)).
query(true_val(comparable_board_cross_brand_burton_blossom, burton_blossom)).
query(true_val(comparable_board_cross_brand_burton_blossom, unk_comparable_board_cross_brand_burton_blossom)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values mayhem_rocket=Mayhem_Rocket_659_99_directional_all_mountain unk_comparable_board_same_brand=Unknown
% @importance 0.7

0.82::acc(s82, comparable_board_same_brand).
0.72::true_val(comparable_board_same_brand, mayhem_rocket); 0.28::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).
measured(s82, comparable_board_same_brand, mayhem_rocket).
all_consistent(comparable_board_same_brand) :- consistent(s82, comparable_board_same_brand).
evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, mayhem_rocket)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_sweetfish
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Sweetfish)
% @values mayhem_sweetfish=Mayhem_Sweetfish_749_99_freeride_swallowtail unk_comparable_board_same_brand_sweetfish=Unknown
% @importance 0.6

0.78::acc(s83, comparable_board_same_brand_sweetfish).
0.63::true_val(comparable_board_same_brand_sweetfish, mayhem_sweetfish); 0.37::true_val(comparable_board_same_brand_sweetfish, unk_comparable_board_same_brand_sweetfish).
measured(s83, comparable_board_same_brand_sweetfish, mayhem_sweetfish).
all_consistent(comparable_board_same_brand_sweetfish) :- consistent(s83, comparable_board_same_brand_sweetfish).
evidence(all_consistent(comparable_board_same_brand_sweetfish)).
query(true_val(comparable_board_same_brand_sweetfish, mayhem_sweetfish)).
query(true_val(comparable_board_same_brand_sweetfish, unk_comparable_board_same_brand_sweetfish)).

% @attr comparable_board_same_brand_skunk_ape
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Skunk Ape Twin)
% @values skunk_ape_twin=Skunk_Ape_Twin_699_99_wider_freestyle unk_comparable_board_same_brand_skunk_ape=Unknown
% @importance 0.6

0.78::acc(s84, comparable_board_same_brand_skunk_ape).
0.68::true_val(comparable_board_same_brand_skunk_ape, skunk_ape_twin); 0.32::true_val(comparable_board_same_brand_skunk_ape, unk_comparable_board_same_brand_skunk_ape).
measured(s84, comparable_board_same_brand_skunk_ape, skunk_ape_twin).
all_consistent(comparable_board_same_brand_skunk_ape) :- consistent(s84, comparable_board_same_brand_skunk_ape).
evidence(all_consistent(comparable_board_same_brand_skunk_ape)).
query(true_val(comparable_board_same_brand_skunk_ape, skunk_ape_twin)).
query(true_val(comparable_board_same_brand_skunk_ape, unk_comparable_board_same_brand_skunk_ape)).

% @attr edge_technology_patent_info
% @type categorical
% @canonical false
% @original_name edge_technology (patent info)
% @values mervin_exclusive=Patented_exclusive_to_Mervin_Lib_Tech_GNU_Roxy unk_edge_technology_patent_info=Unknown
% @importance 0.65

0.72::acc(s85, edge_technology_patent_info).
0.60::true_val(edge_technology_patent_info, mervin_exclusive); 0.40::true_val(edge_technology_patent_info, unk_edge_technology_patent_info).
measured(s85, edge_technology_patent_info, mervin_exclusive).
all_consistent(edge_technology_patent_info) :- consistent(s85, edge_technology_patent_info).
evidence(all_consistent(edge_technology_patent_info)).
query(true_val(edge_technology_patent_info, mervin_exclusive)).
query(true_val(edge_technology_patent_info, unk_edge_technology_patent_info)).

% @attr description
% @type categorical
% @canonical false
% @original_name Description
% @values high_perf_twin_resort_park=High_performance_twin_resort_park_progressive_sidecut_wider unk_description=Unknown
% @importance 1.0

0.85::acc(s2, description).
0.81::true_val(description, high_perf_twin_resort_park); 0.19::true_val(description, unk_description).
measured(s2, description, high_perf_twin_resort_park).
all_consistent(description) :- consistent(s2, description).
evidence(all_consistent(description)).
query(true_val(description, high_perf_twin_resort_park)).
query(true_val(description, unk_description)).

% @attr board_width_note
% @type categorical
% @canonical false
% @original_name Board width note
% @values wider_no_toe_drag=Enough_width_keep_toes_from_dragging_natural_wider unk_board_width_note=Unknown
% @importance 0.85

0.88::acc(s22, board_width_note).
0.81::true_val(board_width_note, wider_no_toe_drag); 0.19::true_val(board_width_note, unk_board_width_note).
measured(s22, board_width_note, wider_no_toe_drag).
all_consistent(board_width_note) :- consistent(s22, board_width_note).
evidence(all_consistent(board_width_note)).
query(true_val(board_width_note, wider_no_toe_drag)).
query(true_val(board_width_note, unk_board_width_note)).

% @attr negative_aspect_unsuitable_for
% @type categorical
% @canonical false
% @original_name negative_aspect (unsuitable for)
% @values powder_beginners_casual=Deep_powder_beginners_casual_low_effort_riders unk_negative_aspect_unsuitable_for=Unknown
% @importance 0.9

0.80::acc(s66, negative_aspect_unsuitable_for).
0.71::true_val(negative_aspect_unsuitable_for, powder_beginners_casual); 0.29::true_val(negative_aspect_unsuitable_for, unk_negative_aspect_unsuitable_for).
measured(s66, negative_aspect_unsuitable_for, powder_beginners_casual).
all_consistent(negative_aspect_unsuitable_for) :- consistent(s66, negative_aspect_unsuitable_for).
evidence(all_consistent(negative_aspect_unsuitable_for)).
query(true_val(negative_aspect_unsuitable_for, powder_beginners_casual)).
query(true_val(negative_aspect_unsuitable_for, unk_negative_aspect_unsuitable_for)).