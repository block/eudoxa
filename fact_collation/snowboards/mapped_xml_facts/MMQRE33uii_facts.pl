0.15::indep(s1).
0.15::indep(s8).
0.15::indep(s9).
0.12::indep(s11).
0.15::indep(s13).
0.20::indep(s15).
0.15::indep(s16).
0.15::indep(s43).
0.15::indep(s44).
0.15::indep(s46).
0.20::indep(s66).
0.20::indep(s71).
0.15::indep(s93).
0.15::indep(s95).
0.20::indep(s99).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

0.92::acc(s1, brand).
0.95::acc(s33, brand).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values capita=CAPiTA unk_brand=Unknown
% @importance 0.85

0.95::true_val(brand, capita); 0.05::true_val(brand, unk_brand).

measured(s1, brand, capita).
measured(s33, brand, capita).

all_consistent(brand) :-
    consistent(s33, brand),
    (indep(s1), consistent(s1, brand) ; \+indep(s1)).

evidence(all_consistent(brand)).
query(true_val(brand, capita)).
query(true_val(brand, unk_brand)).

0.92::acc(s1, model_name).
0.95::acc(s39, model_name).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values mega_mercury=Mega_Mercury unk_model_name=Unknown
% @importance 0.95

0.95::true_val(model_name, mega_mercury); 0.05::true_val(model_name, unk_model_name).

measured(s1, model_name, mega_mercury).
measured(s39, model_name, mega_mercury).

all_consistent(model_name) :-
    consistent(s39, model_name),
    (indep(s1), consistent(s1, model_name) ; \+indep(s1)).

evidence(all_consistent(model_name)).
query(true_val(model_name, mega_mercury)).
query(true_val(model_name, unk_model_name)).

0.82::acc(s1, model_year).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2027=2027 unk_model_year=Unknown
% @importance 0.95

0.71::true_val(model_year, y2027); 0.29::true_val(model_year, unk_model_year).

measured(s1, model_year, y2027).

all_consistent(model_year) :- consistent(s1, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2027)).
query(true_val(model_year, unk_model_year)).

0.82::acc(s1, model_series).
0.85::acc(s7, model_series).

% @attr model_series
% @type categorical
% @canonical false
% @original_name Model series
% @values mercury_series_upgrade=Mercury_series_upgrade unk_model_series=Unknown
% @importance 0.875

0.90::true_val(model_series, mercury_series_upgrade); 0.10::true_val(model_series, unk_model_series).

measured(s1, model_series, mercury_series_upgrade).
measured(s7, model_series, mercury_series_upgrade).

all_consistent(model_series) :-
    (indep(s1), consistent(s1, model_series) ; \+indep(s1)),
    consistent(s7, model_series).

evidence(all_consistent(model_series)).
query(true_val(model_series, mercury_series_upgrade)).
query(true_val(model_series, unk_model_series)).

0.82::acc(s1, product_type).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.95

0.71::true_val(product_type, snowboard); 0.29::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).

all_consistent(product_type) :- consistent(s1, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

0.82::acc(s1, board_category).
0.95::acc(s39, board_category).
0.95::acc(s97, board_category).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain_freeride=All_Mountain_Freeride unk_board_category=Unknown
% @importance 0.967

0.97::true_val(board_category, all_mountain_freeride); 0.03::true_val(board_category, unk_board_category).

measured(s1, board_category, all_mountain_freeride).
measured(s39, board_category, all_mountain_freeride).
measured(s97, board_category, all_mountain_freeride).

all_consistent(board_category) :-
    consistent(s39, board_category),
    consistent(s97, board_category),
    (indep(s1), consistent(s1, board_category) ; \+indep(s1)).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain_freeride)).
query(true_val(board_category, unk_board_category)).

0.82::acc(s1, gender).
0.80::acc(s15, gender).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.85

0.92::true_val(gender, mens); 0.08::true_val(gender, unk_gender).

measured(s1, gender, mens).
measured(s15, gender, mens).

all_consistent(gender) :-
    (indep(s1), consistent(s1, gender) ; \+indep(s1)),
    (indep(s15), consistent(s15, gender) ; \+indep(s15)).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

0.82::acc(s102, predecessor_model_name).
0.78::acc(s105, predecessor_model_name).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values capita_mercury=CAPiTA_Mercury unk_predecessor_model_name=Unknown
% @importance 0.425

0.88::true_val(predecessor_model_name, capita_mercury); 0.12::true_val(predecessor_model_name, unk_predecessor_model_name).

measured(s102, predecessor_model_name, capita_mercury).
measured(s105, predecessor_model_name, capita_mercury).

all_consistent(predecessor_model_name) :-
    consistent(s102, predecessor_model_name),
    consistent(s105, predecessor_model_name).

evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, capita_mercury)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).

0.85::acc(s7, model_first_available_year).
0.85::acc(s36, model_first_available_year).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2021_22=2021_22_season unk_model_first_available_year=Unknown
% @importance 0.80

0.90::true_val(model_first_available_year, season_2021_22); 0.10::true_val(model_first_available_year, unk_model_first_available_year).

measured(s7, model_first_available_year, season_2021_22).
measured(s36, model_first_available_year, season_2021_22).

all_consistent(model_first_available_year) :-
    consistent(s7, model_first_available_year),
    consistent(s36, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2021_22)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

0.82::acc(s1, estimated_availability_date).

% @attr estimated_availability_date
% @type categorical
% @canonical true
% @original_name estimated_availability_date
% @values may_1_2026=May_1_2026 unk_estimated_availability_date=Unknown
% @importance 0.95

0.71::true_val(estimated_availability_date, may_1_2026); 0.29::true_val(estimated_availability_date, unk_estimated_availability_date).

measured(s1, estimated_availability_date, may_1_2026).

all_consistent(estimated_availability_date) :- consistent(s1, estimated_availability_date).

evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, may_1_2026)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

0.82::acc(s1, availability_status).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values preorder_2027=Preorder_2027 unk_availability_status=Unknown
% @importance 0.95

0.71::true_val(availability_status, preorder_2027); 0.29::true_val(availability_status, unk_availability_status).

measured(s1, availability_status, preorder_2027).

all_consistent(availability_status) :- consistent(s1, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, preorder_2027)).
query(true_val(availability_status, unk_availability_status)).

0.90::acc(s63, manufacturer).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values capita_snowboards=CAPiTA_Snowboards_founded_Seattle_2000 unk_manufacturer=Unknown
% @importance 0.50

0.86::true_val(manufacturer, capita_snowboards); 0.14::true_val(manufacturer, unk_manufacturer).

measured(s63, manufacturer, capita_snowboards).

all_consistent(manufacturer) :- consistent(s63, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, capita_snowboards)).
query(true_val(manufacturer, unk_manufacturer)).

0.95::acc(s33, manufacturing_location).
0.93::acc(s61, manufacturing_location).
0.85::acc(s64, manufacturing_location).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values mothership_feistritz_austria=The_MotherShip_Feistritz_Austria unk_manufacturing_location=Unknown
% @importance 0.55

0.97::true_val(manufacturing_location, mothership_feistritz_austria); 0.03::true_val(manufacturing_location, unk_manufacturing_location).

measured(s33, manufacturing_location, mothership_feistritz_austria).
measured(s61, manufacturing_location, mothership_feistritz_austria).
measured(s64, manufacturing_location, mothership_feistritz_austria).

all_consistent(manufacturing_location) :-
    consistent(s33, manufacturing_location),
    consistent(s61, manufacturing_location),
    consistent(s64, manufacturing_location).

evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, mothership_feistritz_austria)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

0.88::acc(s67, factory_opened).

% @attr factory_opened
% @type categorical
% @canonical false
% @original_name Factory opened
% @values nov_21_2015=November_21_2015 unk_factory_opened=Unknown
% @importance 0.35

0.81::true_val(factory_opened, nov_21_2015); 0.19::true_val(factory_opened, unk_factory_opened).

measured(s67, factory_opened, nov_21_2015).

all_consistent(factory_opened) :- consistent(s67, factory_opened).

evidence(all_consistent(factory_opened)).
query(true_val(factory_opened, nov_21_2015)).
query(true_val(factory_opened, unk_factory_opened)).

0.88::acc(s67, factory_size).

% @attr factory_size
% @type numeric
% @unit sqft
% @canonical false
% @original_name Factory size
% @values v52000=52000.0 unk_factory_size=Unknown
% @importance 0.35

0.81::true_val(factory_size, v52000); 0.19::true_val(factory_size, unk_factory_size).

measured(s67, factory_size, v52000).

all_consistent(factory_size) :- consistent(s67, factory_size).

evidence(all_consistent(factory_size)).
query(true_val(factory_size, v52000)).
query(true_val(factory_size, unk_factory_size)).

0.93::acc(s4, sustainability_certification).
0.93::acc(s61, sustainability_certification).
0.90::acc(s62, sustainability_certification).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values clean_energy_hydro_solar=100pct_clean_energy_hydroelectric_solar unk_sustainability_certification=Unknown
% @importance 0.70

0.97::true_val(sustainability_certification, clean_energy_hydro_solar); 0.03::true_val(sustainability_certification, unk_sustainability_certification).

measured(s4, sustainability_certification, clean_energy_hydro_solar).
measured(s61, sustainability_certification, clean_energy_hydro_solar).
measured(s62, sustainability_certification, clean_energy_hydro_solar).

all_consistent(sustainability_certification) :-
    consistent(s4, sustainability_certification),
    consistent(s61, sustainability_certification),
    consistent(s62, sustainability_certification).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, clean_energy_hydro_solar)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

0.80::acc(s66, sustainability_certification_energy_globe).

% @attr sustainability_certification_energy_globe
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values energy_globe_austria_2017=Energy_Globe_Award_Austria_2017 unk_sustainability_certification_energy_globe=Unknown
% @importance 0.40

0.63::true_val(sustainability_certification_energy_globe, energy_globe_austria_2017); 0.37::true_val(sustainability_certification_energy_globe, unk_sustainability_certification_energy_globe).

measured(s66, sustainability_certification_energy_globe, energy_globe_austria_2017).

all_consistent(sustainability_certification_energy_globe) :-
    (indep(s66), consistent(s66, sustainability_certification_energy_globe) ; \+indep(s66)).

evidence(all_consistent(sustainability_certification_energy_globe)).
query(true_val(sustainability_certification_energy_globe, energy_globe_austria_2017)).
query(true_val(sustainability_certification_energy_globe, unk_sustainability_certification_energy_globe)).

0.90::acc(s63, sustainability_certification_bcorp).

% @attr sustainability_certification_bcorp
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values bcorp_score_98_9=B_Corp_Score_98_9 unk_sustainability_certification_bcorp=Unknown
% @importance 0.50

0.86::true_val(sustainability_certification_bcorp, bcorp_score_98_9); 0.14::true_val(sustainability_certification_bcorp, unk_sustainability_certification_bcorp).

measured(s63, sustainability_certification_bcorp, bcorp_score_98_9).

all_consistent(sustainability_certification_bcorp) :- consistent(s63, sustainability_certification_bcorp).

evidence(all_consistent(sustainability_certification_bcorp)).
query(true_val(sustainability_certification_bcorp, bcorp_score_98_9)).
query(true_val(sustainability_certification_bcorp, unk_sustainability_certification_bcorp)).

0.75::acc(s65, sustainability_certification_local_sourcing).

% @attr sustainability_certification_local_sourcing
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values pct98_local=98pct_raw_materials_locally_sourced unk_sustainability_certification_local_sourcing=Unknown
% @importance 0.35

0.40::true_val(sustainability_certification_local_sourcing, pct98_local); 0.60::true_val(sustainability_certification_local_sourcing, unk_sustainability_certification_local_sourcing).

measured(s65, sustainability_certification_local_sourcing, pct98_local).

all_consistent(sustainability_certification_local_sourcing) :- consistent(s65, sustainability_certification_local_sourcing).

evidence(all_consistent(sustainability_certification_local_sourcing)).
query(true_val(sustainability_certification_local_sourcing, pct98_local)).
query(true_val(sustainability_certification_local_sourcing, unk_sustainability_certification_local_sourcing)).

0.90::acc(s62, sustainability_certification_recycling).

% @attr sustainability_certification_recycling
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values all_scraps_recycled=All_production_scraps_recycled unk_sustainability_certification_recycling=Unknown
% @importance 0.50

0.86::true_val(sustainability_certification_recycling, all_scraps_recycled); 0.14::true_val(sustainability_certification_recycling, unk_sustainability_certification_recycling).

measured(s62, sustainability_certification_recycling, all_scraps_recycled).

all_consistent(sustainability_certification_recycling) :- consistent(s62, sustainability_certification_recycling).

evidence(all_consistent(sustainability_certification_recycling)).
query(true_val(sustainability_certification_recycling, all_scraps_recycled)).
query(true_val(sustainability_certification_recycling, unk_sustainability_certification_recycling)).

0.90::acc(s62, sustainability_certification_shrinkwrap).

% @attr sustainability_certification_shrinkwrap
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values recyclable_shrinkwrap=100pct_recyclable_shrink_wrap unk_sustainability_certification_shrinkwrap=Unknown
% @importance 0.50

0.86::true_val(sustainability_certification_shrinkwrap, recyclable_shrinkwrap); 0.14::true_val(sustainability_certification_shrinkwrap, unk_sustainability_certification_shrinkwrap).

measured(s62, sustainability_certification_shrinkwrap, recyclable_shrinkwrap).

all_consistent(sustainability_certification_shrinkwrap) :- consistent(s62, sustainability_certification_shrinkwrap).

evidence(all_consistent(sustainability_certification_shrinkwrap)).
query(true_val(sustainability_certification_shrinkwrap, recyclable_shrinkwrap)).
query(true_val(sustainability_certification_shrinkwrap, unk_sustainability_certification_shrinkwrap)).

0.95::acc(s35, nfc_chip).
0.93::acc(s70, nfc_chip).

% @attr nfc_chip
% @type categorical
% @canonical false
% @original_name NFC chip
% @values embedded_since_2020=Embedded_NFC_since_2020 unk_nfc_chip=Unknown
% @importance 0.40

0.94::true_val(nfc_chip, embedded_since_2020); 0.06::true_val(nfc_chip, unk_nfc_chip).

measured(s35, nfc_chip, embedded_since_2020).
measured(s70, nfc_chip, embedded_since_2020).

all_consistent(nfc_chip) :-
    consistent(s35, nfc_chip),
    consistent(s70, nfc_chip).

evidence(all_consistent(nfc_chip)).
query(true_val(nfc_chip, embedded_since_2020)).
query(true_val(nfc_chip, unk_nfc_chip)).

0.95::acc(s33, warranty).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values two_year=2_years_defects_material_workmanship unk_warranty=Unknown
% @importance 0.75

0.90::true_val(warranty, two_year); 0.10::true_val(warranty, unk_warranty).

measured(s33, warranty, two_year).

all_consistent(warranty) :- consistent(s33, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, two_year)).
query(true_val(warranty, unk_warranty)).

0.82::acc(s1, shape).
0.95::acc(s97, shape).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values directional=Directional unk_shape=Unknown
% @importance 0.975

0.95::true_val(shape, directional); 0.05::true_val(shape, unk_shape).

measured(s1, shape, directional).
measured(s97, shape, directional).

all_consistent(shape) :-
    consistent(s97, shape),
    (indep(s1), consistent(s1, shape) ; \+indep(s1)).

evidence(all_consistent(shape)).
query(true_val(shape, directional)).
query(true_val(shape, unk_shape)).

0.82::acc(s1, shape_description).
0.85::acc(s37, shape_description).

% @attr shape_description
% @type categorical
% @canonical false
% @original_name Shape description
% @values dir_twin_longer_nose=Directional_twin_outline_slightly_longer_nose unk_shape_description=Unknown
% @importance 0.85

0.90::true_val(shape_description, dir_twin_longer_nose); 0.10::true_val(shape_description, unk_shape_description).

measured(s1, shape_description, dir_twin_longer_nose).
measured(s37, shape_description, dir_twin_longer_nose).

all_consistent(shape_description) :-
    (indep(s1), consistent(s1, shape_description) ; \+indep(s1)),
    consistent(s37, shape_description).

evidence(all_consistent(shape_description)).
query(true_val(shape_description, dir_twin_longer_nose)).
query(true_val(shape_description, unk_shape_description)).

0.82::acc(s1, setback).
0.78::acc(s44, setback).
0.95::acc(s97, setback).

% @attr setback
% @type numeric
% @unit mm
% @canonical true
% @original_name setback
% @values v12_7=12.7 unk_setback=Unknown
% @importance 0.88

0.97::true_val(setback, v12_7); 0.03::true_val(setback, unk_setback).

measured(s1, setback, v12_7).
measured(s44, setback, v12_7).
measured(s97, setback, v12_7).

all_consistent(setback) :-
    consistent(s97, setback),
    (indep(s1), consistent(s1, setback) ; \+indep(s1)),
    (indep(s44), consistent(s44, setback) ; \+indep(s44)).

evidence(all_consistent(setback)).
query(true_val(setback, v12_7)).
query(true_val(setback, unk_setback)).

0.85::acc(s37, taper).

% @attr taper
% @type categorical
% @canonical false
% @original_name taper
% @values no_taper=No_taper_twin_outline unk_taper=Unknown
% @importance 0.75

0.72::true_val(taper, no_taper); 0.28::true_val(taper, unk_taper).

measured(s37, taper, no_taper).

all_consistent(taper) :- consistent(s37, taper).

evidence(all_consistent(taper)).
query(true_val(taper, no_taper)).
query(true_val(taper, unk_taper)).

0.85::acc(s37, flex_symmetry).

% @attr flex_symmetry
% @type categorical
% @canonical false
% @original_name Flex symmetry
% @values symmetrical=Symmetrical_flex_pattern unk_flex_symmetry=Unknown
% @importance 0.75

0.72::true_val(flex_symmetry, symmetrical); 0.28::true_val(flex_symmetry, unk_flex_symmetry).

measured(s37, flex_symmetry, symmetrical).

all_consistent(flex_symmetry) :- consistent(s37, flex_symmetry).

evidence(all_consistent(flex_symmetry)).
query(true_val(flex_symmetry, symmetrical)).
query(true_val(flex_symmetry, unk_flex_symmetry)).

0.82::acc(s1, camber_type).
0.80::acc(s15, camber_type).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values resort_v2_dir_flat_kick=Resort_V2_Directional_Flat_Kick_Tech unk_camber_type=Unknown
% @importance 0.85

0.90::true_val(camber_type, resort_v2_dir_flat_kick); 0.10::true_val(camber_type, unk_camber_type).

measured(s1, camber_type, resort_v2_dir_flat_kick).
measured(s15, camber_type, resort_v2_dir_flat_kick).

all_consistent(camber_type) :-
    (indep(s1), consistent(s1, camber_type) ; \+indep(s1)),
    (indep(s15), consistent(s15, camber_type) ; \+indep(s15)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, resort_v2_dir_flat_kick)).
query(true_val(camber_type, unk_camber_type)).

0.82::acc(s1, camber_description).
0.80::acc(s15, camber_description).
0.93::acc(s31, camber_description).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values raised_camber_elevated_contacts_flat_kick=Raised_camber_platform_elevated_contacts_flat_kick unk_camber_description=Unknown
% @importance 0.87

0.95::true_val(camber_description, raised_camber_elevated_contacts_flat_kick); 0.05::true_val(camber_description, unk_camber_description).

measured(s1, camber_description, raised_camber_elevated_contacts_flat_kick).
measured(s15, camber_description, raised_camber_elevated_contacts_flat_kick).
measured(s31, camber_description, raised_camber_elevated_contacts_flat_kick).

all_consistent(camber_description) :-
    consistent(s31, camber_description),
    (indep(s1), consistent(s1, camber_description) ; \+indep(s1)),
    (indep(s15), consistent(s15, camber_description) ; \+indep(s15)).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, raised_camber_elevated_contacts_flat_kick)).
query(true_val(camber_description, unk_camber_description)).

0.85::acc(s36, camber_description_detail).

% @attr camber_description_detail
% @type categorical
% @canonical false
% @original_name camber_description
% @values camber_5cm_outside_inserts=Camber_from_5cm_outside_inserts_reverse_tip_tail unk_camber_description_detail=Unknown
% @importance 0.80

0.72::true_val(camber_description_detail, camber_5cm_outside_inserts); 0.28::true_val(camber_description_detail, unk_camber_description_detail).

measured(s36, camber_description_detail, camber_5cm_outside_inserts).

all_consistent(camber_description_detail) :- consistent(s36, camber_description_detail).

evidence(all_consistent(camber_description_detail)).
query(true_val(camber_description_detail, camber_5cm_outside_inserts)).
query(true_val(camber_description_detail, unk_camber_description_detail)).

0.82::acc(s1, sidecut_type).
0.80::acc(s13, sidecut_type).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values new_age_progressive_death_grip=New_Age_Progressive_Death_Grip unk_sidecut_type=Unknown
% @importance 0.85

0.90::true_val(sidecut_type, new_age_progressive_death_grip); 0.10::true_val(sidecut_type, unk_sidecut_type).

measured(s1, sidecut_type, new_age_progressive_death_grip).
measured(s13, sidecut_type, new_age_progressive_death_grip).

all_consistent(sidecut_type) :-
    (indep(s1), consistent(s1, sidecut_type) ; \+indep(s1)),
    (indep(s13), consistent(s13, sidecut_type) ; \+indep(s13)).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, new_age_progressive_death_grip)).
query(true_val(sidecut_type, unk_sidecut_type)).

0.80::acc(s13, sidecut_description).
0.85::acc(s36, sidecut_description).

% @attr sidecut_description
% @type categorical
% @canonical false
% @original_name Sidecut description
% @values multi_radii_progressive_reverse_midsection=Multi_radii_progressive_reverse_sidecut_midsection unk_sidecut_description=Unknown
% @importance 0.775

0.88::true_val(sidecut_description, multi_radii_progressive_reverse_midsection); 0.12::true_val(sidecut_description, unk_sidecut_description).

measured(s13, sidecut_description, multi_radii_progressive_reverse_midsection).
measured(s36, sidecut_description, multi_radii_progressive_reverse_midsection).

all_consistent(sidecut_description) :-
    (indep(s13), consistent(s13, sidecut_description) ; \+indep(s13)),
    consistent(s36, sidecut_description).

evidence(all_consistent(sidecut_description)).
query(true_val(sidecut_description, multi_radii_progressive_reverse_midsection)).
query(true_val(sidecut_description, unk_sidecut_description)).

0.88::acc(s81, edge_technology).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values bump_1_5mm_each_edge_3mm_waist=1_5mm_bump_each_edge_3mm_extra_waist unk_edge_technology=Unknown
% @importance 0.70

0.68::true_val(edge_technology, bump_1_5mm_each_edge_3mm_waist); 0.32::true_val(edge_technology, unk_edge_technology).

measured(s81, edge_technology, bump_1_5mm_each_edge_3mm_waist).

all_consistent(edge_technology) :- consistent(s81, edge_technology).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, bump_1_5mm_each_edge_3mm_waist)).
query(true_val(edge_technology, unk_edge_technology)).

0.82::acc(s1, flex_rating_10).
0.78::acc(s43, flex_rating_10).
0.72::acc(s8, flex_rating_10).

% @attr flex_rating_10
% @type numeric
% @unit per_10
% @canonical true
% @original_name flex_rating_10
% @values v7=7.0 v6_5=6.5
% @importance 0.85

0.65::true_val(flex_rating_10, v7); 0.35::true_val(flex_rating_10, v6_5).

measured(s1, flex_rating_10, v7).
measured(s43, flex_rating_10, v7).
measured(s8, flex_rating_10, v6_5).

all_consistent(flex_rating_10) :-
    (indep(s1), consistent(s1, flex_rating_10) ; \+indep(s1)),
    (indep(s43), consistent(s43, flex_rating_10) ; \+indep(s43)),
    (indep(s8), consistent(s8, flex_rating_10) ; \+indep(s8)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v7)).
query(true_val(flex_rating_10, v6_5)).

0.95::acc(s97, flex_rating_10_manufacturer).
0.80::acc(s34, flex_rating_10_manufacturer).
0.78::acc(s85, flex_rating_10_manufacturer).

% @attr flex_rating_10_manufacturer
% @type numeric
% @unit per_10
% @canonical true
% @original_name flex_rating_10_manufacturer
% @values v7=7.0 v6_5=6.5
% @importance 0.87

0.55::true_val(flex_rating_10_manufacturer, v7); 0.45::true_val(flex_rating_10_manufacturer, v6_5).

measured(s97, flex_rating_10_manufacturer, v7).
measured(s34, flex_rating_10_manufacturer, v6_5).
measured(s85, flex_rating_10_manufacturer, v6_5).

all_consistent(flex_rating_10_manufacturer) :-
    consistent(s97, flex_rating_10_manufacturer),
    consistent(s34, flex_rating_10_manufacturer),
    consistent(s85, flex_rating_10_manufacturer).

evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, v7)).
query(true_val(flex_rating_10_manufacturer, v6_5)).

0.80::acc(s15, flex_feel).
0.82::acc(s1, flex_feel).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values stiff=Stiff mid_stiff=Mid_stiff
% @importance 0.85

0.45::true_val(flex_feel, stiff); 0.55::true_val(flex_feel, mid_stiff).

measured(s15, flex_feel, stiff).
measured(s1, flex_feel, mid_stiff).

all_consistent(flex_feel) :-
    (indep(s15), consistent(s15, flex_feel) ; \+indep(s15)),
    (indep(s1), consistent(s1, flex_feel) ; \+indep(s1)).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, stiff)).
query(true_val(flex_feel, mid_stiff)).

0.82::acc(s1, flex_direction).
0.78::acc(s44, flex_direction).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values directional_flex=Directional_flex unk_flex_direction=Unknown
% @importance 0.825

0.90::true_val(flex_direction, directional_flex); 0.10::true_val(flex_direction, unk_flex_direction).

measured(s1, flex_direction, directional_flex).
measured(s44, flex_direction, directional_flex).

all_consistent(flex_direction) :-
    (indep(s1), consistent(s1, flex_direction) ; \+indep(s1)),
    (indep(s44), consistent(s44, flex_direction) ; \+indep(s44)).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional_flex)).
query(true_val(flex_direction, unk_flex_direction)).

0.80::acc(s34, flex_feel_vs_rated).

% @attr flex_feel_vs_rated
% @type categorical
% @canonical false
% @original_name flex_feel
% @values stiffer_than_rated=Feels_stiffer_than_rated unk_flex_feel_vs_rated=Unknown
% @importance 0.80

0.55::true_val(flex_feel_vs_rated, stiffer_than_rated); 0.45::true_val(flex_feel_vs_rated, unk_flex_feel_vs_rated).

measured(s34, flex_feel_vs_rated, stiffer_than_rated).

all_consistent(flex_feel_vs_rated) :- consistent(s34, flex_feel_vs_rated).

evidence(all_consistent(flex_feel_vs_rated)).
query(true_val(flex_feel_vs_rated, stiffer_than_rated)).
query(true_val(flex_feel_vs_rated, unk_flex_feel_vs_rated)).

0.85::acc(s38, flex_feel_vs_mercury).

% @attr flex_feel_vs_mercury
% @type categorical
% @canonical false
% @original_name flex_feel
% @values stiffer_than_mercury=Definitely_stiffer_than_Mercury unk_flex_feel_vs_mercury=Unknown
% @importance 0.85

0.66::true_val(flex_feel_vs_mercury, stiffer_than_mercury); 0.34::true_val(flex_feel_vs_mercury, unk_flex_feel_vs_mercury).

measured(s38, flex_feel_vs_mercury, stiffer_than_mercury).

all_consistent(flex_feel_vs_mercury) :- consistent(s38, flex_feel_vs_mercury).

evidence(all_consistent(flex_feel_vs_mercury)).
query(true_val(flex_feel_vs_mercury, stiffer_than_mercury)).
query(true_val(flex_feel_vs_mercury, unk_flex_feel_vs_mercury)).

0.82::acc(s1, core_material).
0.93::acc(s16, core_material).
0.95::acc(s31, core_material).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values thermopolymer_starship=3D_Thermopolymer_Starship_Core unk_core_material=Unknown
% @importance 0.82

0.97::true_val(core_material, thermopolymer_starship); 0.03::true_val(core_material, unk_core_material).

measured(s1, core_material, thermopolymer_starship).
measured(s16, core_material, thermopolymer_starship).
measured(s31, core_material, thermopolymer_starship).

all_consistent(core_material) :-
    consistent(s31, core_material),
    (indep(s1), consistent(s1, core_material) ; \+indep(s1)),
    (indep(s16), consistent(s16, core_material) ; \+indep(s16)).

evidence(all_consistent(core_material)).
query(true_val(core_material, thermopolymer_starship)).
query(true_val(core_material, unk_core_material)).

0.82::acc(s1, core_material_wood).
0.93::acc(s4, core_material_wood).
0.78::acc(s16, core_material_wood).

% @attr core_material_wood
% @type categorical
% @canonical false
% @original_name core_material
% @values premium_poplar_fsc=Mega_premium_reforestation_Poplar_sorted_graded unk_core_material_wood=Unknown
% @importance 0.88

0.95::true_val(core_material_wood, premium_poplar_fsc); 0.05::true_val(core_material_wood, unk_core_material_wood).

measured(s1, core_material_wood, premium_poplar_fsc).
measured(s4, core_material_wood, premium_poplar_fsc).
measured(s16, core_material_wood, premium_poplar_fsc).

all_consistent(core_material_wood) :-
    consistent(s4, core_material_wood),
    (indep(s1), consistent(s1, core_material_wood) ; \+indep(s1)),
    (indep(s16), consistent(s16, core_material_wood) ; \+indep(s16)).

evidence(all_consistent(core_material_wood)).
query(true_val(core_material_wood, premium_poplar_fsc)).
query(true_val(core_material_wood, unk_core_material_wood)).

0.82::acc(s1, core_material_pet).
0.93::acc(s4, core_material_pet).
0.78::acc(s16, core_material_pet).
0.80::acc(s85, core_material_pet).

% @attr core_material_pet
% @type categorical
% @canonical false
% @original_name core_material
% @values recycled_pet_channels=Bonded_post_consumer_recycled_PET_channels unk_core_material_pet=Unknown
% @importance 0.82

0.95::true_val(core_material_pet, recycled_pet_channels); 0.05::true_val(core_material_pet, unk_core_material_pet).

measured(s1, core_material_pet, recycled_pet_channels).
measured(s4, core_material_pet, recycled_pet_channels).
measured(s16, core_material_pet, recycled_pet_channels).
measured(s85, core_material_pet, recycled_pet_channels).

all_consistent(core_material_pet) :-
    consistent(s4, core_material_pet),
    consistent(s85, core_material_pet),
    (indep(s1), consistent(s1, core_material_pet) ; \+indep(s1)),
    (indep(s16), consistent(s16, core_material_pet) ; \+indep(s16)).

evidence(all_consistent(core_material_pet)).
query(true_val(core_material_pet, recycled_pet_channels)).
query(true_val(core_material_pet, unk_core_material_pet)).

0.90::acc(s4, core_strength_to_weight).
0.78::acc(s16, core_strength_to_weight).

% @attr core_strength_to_weight
% @type categorical
% @canonical false
% @original_name Core strength-to-weight
% @values comparable_paulownia=Comparable_to_Paulownia_retains_Poplar_poppiness unk_core_strength_to_weight=Unknown
% @importance 0.85

0.90::true_val(core_strength_to_weight, comparable_paulownia); 0.10::true_val(core_strength_to_weight, unk_core_strength_to_weight).

measured(s4, core_strength_to_weight, comparable_paulownia).
measured(s16, core_strength_to_weight, comparable_paulownia).

all_consistent(core_strength_to_weight) :-
    consistent(s4, core_strength_to_weight),
    (indep(s16), consistent(s16, core_strength_to_weight) ; \+indep(s16)).

evidence(all_consistent(core_strength_to_weight)).
query(true_val(core_strength_to_weight, comparable_paulownia)).
query(true_val(core_strength_to_weight, unk_core_strength_to_weight)).

0.93::acc(s4, sustainability_certification_fsc).
0.78::acc(s16, sustainability_certification_fsc).
0.78::acc(s46, sustainability_certification_fsc).

% @attr sustainability_certification_fsc
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values fsc_certified=FSC_Certified unk_sustainability_certification_fsc=Unknown
% @importance 0.78

0.95::true_val(sustainability_certification_fsc, fsc_certified); 0.05::true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc).

measured(s4, sustainability_certification_fsc, fsc_certified).
measured(s16, sustainability_certification_fsc, fsc_certified).
measured(s46, sustainability_certification_fsc, fsc_certified).

all_consistent(sustainability_certification_fsc) :-
    consistent(s4, sustainability_certification_fsc),
    (indep(s16), consistent(s16, sustainability_certification_fsc) ; \+indep(s16)),
    (indep(s46), consistent(s46, sustainability_certification_fsc) ; \+indep(s46)).

evidence(all_consistent(sustainability_certification_fsc)).
query(true_val(sustainability_certification_fsc, fsc_certified)).
query(true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc)).

0.85::acc(s37, core_3d_profiling).
0.80::acc(s85, core_3d_profiling).

% @attr core_3d_profiling
% @type categorical
% @canonical false
% @original_name Core 3D profiling
% @values visible_3d_milled=3D_cut_milled_core_visible_through_topsheet unk_core_3d_profiling=Unknown
% @importance 0.775

0.88::true_val(core_3d_profiling, visible_3d_milled); 0.12::true_val(core_3d_profiling, unk_core_3d_profiling).

measured(s37, core_3d_profiling, visible_3d_milled).
measured(s85, core_3d_profiling, visible_3d_milled).

all_consistent(core_3d_profiling) :-
    consistent(s37, core_3d_profiling),
    consistent(s85, core_3d_profiling).

evidence(all_consistent(core_3d_profiling)).
query(true_val(core_3d_profiling, visible_3d_milled)).
query(true_val(core_3d_profiling, unk_core_3d_profiling)).

0.82::acc(s1, laminate).
0.78::acc(s16, laminate).
0.95::acc(s31, laminate).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values hybrid_carbon_holysheet_tri_tri=Hybrid_Carbon_Holysheet_Tri_Tri unk_laminate=Unknown
% @importance 0.82

0.97::true_val(laminate, hybrid_carbon_holysheet_tri_tri); 0.03::true_val(laminate, unk_laminate).

measured(s1, laminate, hybrid_carbon_holysheet_tri_tri).
measured(s16, laminate, hybrid_carbon_holysheet_tri_tri).
measured(s31, laminate, hybrid_carbon_holysheet_tri_tri).

all_consistent(laminate) :-
    consistent(s31, laminate),
    (indep(s1), consistent(s1, laminate) ; \+indep(s1)),
    (indep(s16), consistent(s16, laminate) ; \+indep(s16)).

evidence(all_consistent(laminate)).
query(true_val(laminate, hybrid_carbon_holysheet_tri_tri)).
query(true_val(laminate, unk_laminate)).

0.82::acc(s1, laminate_detail).
0.78::acc(s16, laminate_detail).

% @attr laminate_detail
% @type categorical
% @canonical false
% @original_name laminate
% @values triax_glass_top_bottom=Triaxial_fiberglass_top_and_bottom unk_laminate_detail=Unknown
% @importance 0.82

0.90::true_val(laminate_detail, triax_glass_top_bottom); 0.10::true_val(laminate_detail, unk_laminate_detail).

measured(s1, laminate_detail, triax_glass_top_bottom).
measured(s16, laminate_detail, triax_glass_top_bottom).

all_consistent(laminate_detail) :-
    (indep(s1), consistent(s1, laminate_detail) ; \+indep(s1)),
    (indep(s16), consistent(s16, laminate_detail) ; \+indep(s16)).

evidence(all_consistent(laminate_detail)).
query(true_val(laminate_detail, triax_glass_top_bottom)).
query(true_val(laminate_detail, unk_laminate_detail)).

0.80::acc(s12, construction_material_innovation).
0.95::acc(s31, construction_material_innovation).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values hybrid_holysheet_carbon=Carbon_interwoven_into_Holysheet_fiberglass unk_construction_material_innovation=Unknown
% @importance 0.825

0.93::true_val(construction_material_innovation, hybrid_holysheet_carbon); 0.07::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s12, construction_material_innovation, hybrid_holysheet_carbon).
measured(s31, construction_material_innovation, hybrid_holysheet_carbon).

all_consistent(construction_material_innovation) :-
    consistent(s12, construction_material_innovation),
    consistent(s31, construction_material_innovation).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, hybrid_holysheet_carbon)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

0.75::acc(s8, construction_material_innovation_megacarbon).
0.78::acc(s16, construction_material_innovation_megacarbon).

% @attr construction_material_innovation_megacarbon
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values megacarbon_array=Megacarbon_Array_4x_power_response unk_construction_material_innovation_megacarbon=Unknown
% @importance 0.775

0.85::true_val(construction_material_innovation_megacarbon, megacarbon_array); 0.15::true_val(construction_material_innovation_megacarbon, unk_construction_material_innovation_megacarbon).

measured(s8, construction_material_innovation_megacarbon, megacarbon_array).
measured(s16, construction_material_innovation_megacarbon, megacarbon_array).

all_consistent(construction_material_innovation_megacarbon) :-
    (indep(s8), consistent(s8, construction_material_innovation_megacarbon) ; \+indep(s8)),
    (indep(s16), consistent(s16, construction_material_innovation_megacarbon) ; \+indep(s16)).

evidence(all_consistent(construction_material_innovation_megacarbon)).
query(true_val(construction_material_innovation_megacarbon, megacarbon_array)).
query(true_val(construction_material_innovation_megacarbon, unk_construction_material_innovation_megacarbon)).

0.82::acc(s1, resin).
0.80::acc(s11, resin).

% @attr resin
% @type categorical
% @canonical true
% @original_name resin
% @values megacarbon_magic_bean=Megacarbon_Magic_Bean_Resin_plant_based unk_resin=Unknown
% @importance 0.825

0.90::true_val(resin, megacarbon_magic_bean); 0.10::true_val(resin, unk_resin).

measured(s1, resin, megacarbon_magic_bean).
measured(s11, resin, megacarbon_magic_bean).

all_consistent(resin) :-
    (indep(s1), consistent(s1, resin) ; \+indep(s1)),
    (indep(s11), consistent(s11, resin) ; \+indep(s11)).

evidence(all_consistent(resin)).
query(true_val(resin, megacarbon_magic_bean)).
query(true_val(resin, unk_resin)).

0.80::acc(s11, resin_detail).
0.78::acc(s45, resin_detail).

% @attr resin_detail
% @type categorical
% @canonical false
% @original_name resin
% @values three_yr_dev_low_temp=3yr_development_low_temp_thinner_core unk_resin_detail=Unknown
% @importance 0.70

0.82::true_val(resin_detail, three_yr_dev_low_temp); 0.18::true_val(resin_detail, unk_resin_detail).

measured(s11, resin_detail, three_yr_dev_low_temp).
measured(s45, resin_detail, three_yr_dev_low_temp).

all_consistent(resin_detail) :-
    (indep(s11), consistent(s11, resin_detail) ; \+indep(s11)),
    consistent(s45, resin_detail).

evidence(all_consistent(resin_detail)).
query(true_val(resin_detail, three_yr_dev_low_temp)).
query(true_val(resin_detail, unk_resin_detail)).

0.82::acc(s1, topsheet).
0.75::acc(s8, topsheet).
0.78::acc(s16, topsheet).

% @attr topsheet
% @type categorical
% @canonical true
% @original_name topsheet
% @values megalite_skin=Megalite_Skin_Topsheet_super_thin_matte unk_topsheet=Unknown
% @importance 0.80

0.95::true_val(topsheet, megalite_skin); 0.05::true_val(topsheet, unk_topsheet).

measured(s1, topsheet, megalite_skin).
measured(s8, topsheet, megalite_skin).
measured(s16, topsheet, megalite_skin).

all_consistent(topsheet) :-
    (indep(s1), consistent(s1, topsheet) ; \+indep(s1)),
    (indep(s8), consistent(s8, topsheet) ; \+indep(s8)),
    (indep(s16), consistent(s16, topsheet) ; \+indep(s16)).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, megalite_skin)).
query(true_val(topsheet, unk_topsheet)).

0.82::acc(s1, topsheet_weight_reduction).
0.75::acc(s8, topsheet_weight_reduction).
0.78::acc(s16, topsheet_weight_reduction).
0.95::acc(s31, topsheet_weight_reduction).

% @attr topsheet_weight_reduction
% @type categorical
% @canonical false
% @original_name topsheet
% @values pct60_weight_reduction=60pct_weight_reduction unk_topsheet_weight_reduction=Unknown
% @importance 0.80

0.97::true_val(topsheet_weight_reduction, pct60_weight_reduction); 0.03::true_val(topsheet_weight_reduction, unk_topsheet_weight_reduction).

measured(s1, topsheet_weight_reduction, pct60_weight_reduction).
measured(s8, topsheet_weight_reduction, pct60_weight_reduction).
measured(s16, topsheet_weight_reduction, pct60_weight_reduction).
measured(s31, topsheet_weight_reduction, pct60_weight_reduction).

all_consistent(topsheet_weight_reduction) :-
    consistent(s31, topsheet_weight_reduction),
    (indep(s1), consistent(s1, topsheet_weight_reduction) ; \+indep(s1)),
    (indep(s8), consistent(s8, topsheet_weight_reduction) ; \+indep(s8)),
    (indep(s16), consistent(s16, topsheet_weight_reduction) ; \+indep(s16)).

evidence(all_consistent(topsheet_weight_reduction)).
query(true_val(topsheet_weight_reduction, pct60_weight_reduction)).
query(true_val(topsheet_weight_reduction, unk_topsheet_weight_reduction)).

0.78::acc(s16, topsheet_plt).
0.93::acc(s70, topsheet_plt).

% @attr topsheet_plt
% @type categorical
% @canonical false
% @original_name topsheet
% @values plt_bonding=PLT_bonds_topsheet_no_lacquer unk_topsheet_plt=Unknown
% @importance 0.55

0.90::true_val(topsheet_plt, plt_bonding); 0.10::true_val(topsheet_plt, unk_topsheet_plt).

measured(s16, topsheet_plt, plt_bonding).
measured(s70, topsheet_plt, plt_bonding).

all_consistent(topsheet_plt) :-
    consistent(s70, topsheet_plt),
    (indep(s16), consistent(s16, topsheet_plt) ; \+indep(s16)).

evidence(all_consistent(topsheet_plt)).
query(true_val(topsheet_plt, plt_bonding)).
query(true_val(topsheet_plt, unk_topsheet_plt)).

0.82::acc(s1, topsheet_print).
0.80::acc(s11, topsheet_print).

% @attr topsheet_print
% @type categorical
% @canonical false
% @original_name topsheet
% @values digital_screen_chrome_pam16000=Digital_Screen_Print_Chrome_Silver_PAM16000 unk_topsheet_print=Unknown
% @importance 0.825

0.90::true_val(topsheet_print, digital_screen_chrome_pam16000); 0.10::true_val(topsheet_print, unk_topsheet_print).

measured(s1, topsheet_print, digital_screen_chrome_pam16000).
measured(s11, topsheet_print, digital_screen_chrome_pam16000).

all_consistent(topsheet_print) :-
    (indep(s1), consistent(s1, topsheet_print) ; \+indep(s1)),
    (indep(s11), consistent(s11, topsheet_print) ; \+indep(s11)).

evidence(all_consistent(topsheet_print)).
query(true_val(topsheet_print, digital_screen_chrome_pam16000)).
query(true_val(topsheet_print, unk_topsheet_print)).

0.82::acc(s1, base_material).
0.95::acc(s12, base_material).
0.95::acc(s31, base_material).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values megadrive_xt=Megadrive_XT_sintered_race_base_UHMW_carbon_fluoro unk_base_material=Unknown
% @importance 0.87

0.97::true_val(base_material, megadrive_xt); 0.03::true_val(base_material, unk_base_material).

measured(s1, base_material, megadrive_xt).
measured(s12, base_material, megadrive_xt).
measured(s31, base_material, megadrive_xt).

all_consistent(base_material) :-
    consistent(s12, base_material),
    consistent(s31, base_material),
    (indep(s1), consistent(s1, base_material) ; \+indep(s1)).

evidence(all_consistent(base_material)).
query(true_val(base_material, megadrive_xt)).
query(true_val(base_material, unk_base_material)).

0.95::acc(s12, base_thickness).
0.78::acc(s16, base_thickness).

% @attr base_thickness
% @type categorical
% @canonical false
% @original_name Base thickness
% @values xt_increased=XT_increased_thickness_enhanced_durability unk_base_thickness=Unknown
% @importance 0.75

0.93::true_val(base_thickness, xt_increased); 0.07::true_val(base_thickness, unk_base_thickness).

measured(s12, base_thickness, xt_increased).
measured(s16, base_thickness, xt_increased).

all_consistent(base_thickness) :-
    consistent(s12, base_thickness),
    (indep(s16), consistent(s16, base_thickness) ; \+indep(s16)).

evidence(all_consistent(base_thickness)).
query(true_val(base_thickness, xt_increased)).
query(true_val(base_thickness, unk_base_thickness)).

0.82::acc(s1, base_tune).
0.95::acc(s12, base_tune).
0.78::acc(s26, base_tune).

% @attr base_tune
% @type categorical
% @canonical false
% @original_name Base tune
% @values moonshot_omni_tune=Moonshot_Omni_Tune_stone_grind_45deg unk_base_tune=Unknown
% @importance 0.82

0.95::true_val(base_tune, moonshot_omni_tune); 0.05::true_val(base_tune, unk_base_tune).

measured(s1, base_tune, moonshot_omni_tune).
measured(s12, base_tune, moonshot_omni_tune).

all_consistent(base_tune) :-
    consistent(s12, base_tune),
    (indep(s1), consistent(s1, base_tune) ; \+indep(s1)).

evidence(all_consistent(base_tune)).
query(true_val(base_tune, moonshot_omni_tune)).
query(true_val(base_tune, unk_base_tune)).

0.82::acc(s1, base_graphics).
0.78::acc(s9, base_graphics).

% @attr base_graphics
% @type categorical
% @canonical false
% @original_name Base graphics
% @values laser_die_cut=Laser_guided_die_cutting unk_base_graphics=Unknown
% @importance 0.65

0.85::true_val(base_graphics, laser_die_cut); 0.15::true_val(base_graphics, unk_base_graphics).

measured(s1, base_graphics, laser_die_cut).
measured(s9, base_graphics, laser_die_cut).

all_consistent(base_graphics) :-
    (indep(s1), consistent(s1, base_graphics) ; \+indep(s1)),
    (indep(s9), consistent(s9, base_graphics) ; \+indep(s9)).

evidence(all_consistent(base_graphics)).
query(true_val(base_graphics, laser_die_cut)).
query(true_val(base_graphics, unk_base_graphics)).

0.90::acc(s4, base_colour_variations).
0.95::acc(s12, base_colour_variations).

% @attr base_colour_variations
% @type categorical
% @canonical false
% @original_name Base colour variations
% @values two_per_size_minimize_waste=Die_cut_two_colour_variations_per_size unk_base_colour_variations=Unknown
% @importance 0.90

0.93::true_val(base_colour_variations, two_per_size_minimize_waste); 0.07::true_val(base_colour_variations, unk_base_colour_variations).

measured(s4, base_colour_variations, two_per_size_minimize_waste).
measured(s12, base_colour_variations, two_per_size_minimize_waste).

all_consistent(base_colour_variations) :-
    consistent(s4, base_colour_variations),
    consistent(s12, base_colour_variations).

evidence(all_consistent(base_colour_variations)).
query(true_val(base_colour_variations, two_per_size_minimize_waste)).
query(true_val(base_colour_variations, unk_base_colour_variations)).

0.78::acc(s6, sidewall_material).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values milled_sidewalls=Milled_sidewalls_added_strength unk_sidewall_material=Unknown
% @importance 0.70

0.55::true_val(sidewall_material, milled_sidewalls); 0.45::true_val(sidewall_material, unk_sidewall_material).

measured(s6, sidewall_material, milled_sidewalls).

all_consistent(sidewall_material) :- consistent(s6, sidewall_material).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, milled_sidewalls)).
query(true_val(sidewall_material, unk_sidewall_material)).

0.82::acc(s1, mounting_pattern).
0.78::acc(s46, mounting_pattern).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4_stainless=2x4_Stainless_Steel_Inserts unk_mounting_pattern=Unknown
% @importance 0.80

0.90::true_val(mounting_pattern, inserts_2x4_stainless); 0.10::true_val(mounting_pattern, unk_mounting_pattern).

measured(s1, mounting_pattern, inserts_2x4_stainless).
measured(s46, mounting_pattern, inserts_2x4_stainless).

all_consistent(mounting_pattern) :-
    (indep(s1), consistent(s1, mounting_pattern) ; \+indep(s1)),
    (indep(s46), consistent(s46, mounting_pattern) ; \+indep(s46)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4_stainless)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

0.93::acc(s70, insert_drilling).

% @attr insert_drilling
% @type categorical
% @canonical false
% @original_name Insert drilling
% @values automated_thermal_robotic=Automated_thermal_insert_drilling_robotic_precision unk_insert_drilling=Unknown
% @importance 0.40

0.86::true_val(insert_drilling, automated_thermal_robotic); 0.14::true_val(insert_drilling, unk_insert_drilling).

measured(s70, insert_drilling, automated_thermal_robotic).

all_consistent(insert_drilling) :- consistent(s70, insert_drilling).

evidence(all_consistent(insert_drilling)).
query(true_val(insert_drilling, automated_thermal_robotic)).
query(true_val(insert_drilling, unk_insert_drilling)).

0.82::acc(s1, available_sizes).
0.95::acc(s97, available_sizes).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values merchant_5_sizes=155_157_159_158W_160W full_lineup_8_sizes=153_155_157_159_161_156W_158W_160W
% @importance 0.93

0.40::true_val(available_sizes, merchant_5_sizes); 0.60::true_val(available_sizes, full_lineup_8_sizes).

measured(s1, available_sizes, merchant_5_sizes).
measured(s97, available_sizes, full_lineup_8_sizes).

all_consistent(available_sizes) :-
    (indep(s1), consistent(s1, available_sizes) ; \+indep(s1)),
    consistent(s97, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, merchant_5_sizes)).
query(true_val(available_sizes, full_lineup_8_sizes)).

0.82::acc(s1, width_options).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 0.95

0.71::true_val(width_options, standard_and_wide); 0.29::true_val(width_options, unk_width_options).

measured(s1, width_options, standard_and_wide).

all_consistent(width_options) :- consistent(s1, width_options).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

0.82::acc(s90, wide_sizes_first_introduced).

% @attr wide_sizes_first_introduced
% @type categorical
% @canonical false
% @original_name Wide sizes first introduced
% @values y2023=2023_model_156W_158W_160W unk_wide_sizes_first_introduced=Unknown
% @importance 0.80

0.63::true_val(wide_sizes_first_introduced, y2023); 0.37::true_val(wide_sizes_first_introduced, unk_wide_sizes_first_introduced).

measured(s90, wide_sizes_first_introduced, y2023).

all_consistent(wide_sizes_first_introduced) :- consistent(s90, wide_sizes_first_introduced).

evidence(all_consistent(wide_sizes_first_introduced)).
query(true_val(wide_sizes_first_introduced, y2023)).
query(true_val(wide_sizes_first_introduced, unk_wide_sizes_first_introduced)).

0.82::acc(s1, effective_edge_155).

% @attr effective_edge_155
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 155cm
% @values v1199=1199.0 unk_effective_edge_155=Unknown
% @importance 0.95

0.71::true_val(effective_edge_155, v1199); 0.29::true_val(effective_edge_155, unk_effective_edge_155).

measured(s1, effective_edge_155, v1199).

all_consistent(effective_edge_155) :- consistent(s1, effective_edge_155).

evidence(all_consistent(effective_edge_155)).
query(true_val(effective_edge_155, v1199)).
query(true_val(effective_edge_155, unk_effective_edge_155)).

0.82::acc(s1, sidecut_radius_size_155).

% @attr sidecut_radius_size_155
% @type categorical
% @canonical false
% @original_name sidecut_radius_size
% @values r7_7_n1_5_7_7=7_7_neg1_5_7_7m unk_sidecut_radius_size_155=Unknown
% @importance 0.95

0.71::true_val(sidecut_radius_size_155, r7_7_n1_5_7_7); 0.29::true_val(sidecut_radius_size_155, unk_sidecut_radius_size_155).

measured(s1, sidecut_radius_size_155, r7_7_n1_5_7_7).

all_consistent(sidecut_radius_size_155) :- consistent(s1, sidecut_radius_size_155).

evidence(all_consistent(sidecut_radius_size_155)).
query(true_val(sidecut_radius_size_155, r7_7_n1_5_7_7)).
query(true_val(sidecut_radius_size_155, unk_sidecut_radius_size_155)).

0.82::acc(s1, waist_width_155).

% @attr waist_width_155
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 155cm
% @values v25_5=25.5 unk_waist_width_155=Unknown
% @importance 0.95

0.71::true_val(waist_width_155, v25_5); 0.29::true_val(waist_width_155, unk_waist_width_155).

measured(s1, waist_width_155, v25_5).

all_consistent(waist_width_155) :- consistent(s1, waist_width_155).

evidence(all_consistent(waist_width_155)).
query(true_val(waist_width_155, v25_5)).
query(true_val(waist_width_155, unk_waist_width_155)).

0.82::acc(s1, tip_tail_width_size).

% @attr tip_tail_width_size
% @type numeric
% @unit cm
% @canonical true
% @original_name tip_tail_width_size
% @values v29_8=29.8 unk_tip_tail_width_size=Unknown
% @importance 0.95

0.71::true_val(tip_tail_width_size, v29_8); 0.29::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s1, tip_tail_width_size, v29_8).

all_consistent(tip_tail_width_size) :- consistent(s1, tip_tail_width_size).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v29_8)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

0.82::acc(s1, stance_width_range_size_155).

% @attr stance_width_range_size_155
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size
% @values v55_9=55.9 unk_stance_width_range_size_155=Unknown
% @importance 0.95

0.71::true_val(stance_width_range_size_155, v55_9); 0.29::true_val(stance_width_range_size_155, unk_stance_width_range_size_155).

measured(s1, stance_width_range_size_155, v55_9).

all_consistent(stance_width_range_size_155) :- consistent(s1, stance_width_range_size_155).

evidence(all_consistent(stance_width_range_size_155)).
query(true_val(stance_width_range_size_155, v55_9)).
query(true_val(stance_width_range_size_155, unk_stance_width_range_size_155)).

0.82::acc(s1, recommended_weight_range_size_155).

% @attr recommended_weight_range_size_155
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values r54_81kg=54_81kg unk_recommended_weight_range_size_155=Unknown
% @importance 0.95

0.71::true_val(recommended_weight_range_size_155, r54_81kg); 0.29::true_val(recommended_weight_range_size_155, unk_recommended_weight_range_size_155).

measured(s1, recommended_weight_range_size_155, r54_81kg).

all_consistent(recommended_weight_range_size_155) :- consistent(s1, recommended_weight_range_size_155).

evidence(all_consistent(recommended_weight_range_size_155)).
query(true_val(recommended_weight_range_size_155, r54_81kg)).
query(true_val(recommended_weight_range_size_155, unk_recommended_weight_range_size_155)).

0.82::acc(s1, effective_edge_157).

% @attr effective_edge_157
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 157cm
% @values v1215=1215.0 unk_effective_edge_157=Unknown
% @importance 0.95

0.71::true_val(effective_edge_157, v1215); 0.29::true_val(effective_edge_157, unk_effective_edge_157).

measured(s1, effective_edge_157, v1215).

all_consistent(effective_edge_157) :- consistent(s1, effective_edge_157).

evidence(all_consistent(effective_edge_157)).
query(true_val(effective_edge_157, v1215)).
query(true_val(effective_edge_157, unk_effective_edge_157)).

0.82::acc(s1, sidecut_radius_size).

% @attr sidecut_radius_size
% @type categorical
% @canonical true
% @original_name sidecut_radius_size
% @values r7_8_n1_5_7_8=7_8_neg1_5_7_8m unk_sidecut_radius_size=Unknown
% @importance 0.95

0.71::true_val(sidecut_radius_size, r7_8_n1_5_7_8); 0.29::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s1, sidecut_radius_size, r7_8_n1_5_7_8).

all_consistent(sidecut_radius_size) :- consistent(s1, sidecut_radius_size).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, r7_8_n1_5_7_8)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

0.82::acc(s1, waist_width_157).

% @attr waist_width_157
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 157cm
% @values v25_7=25.7 unk_waist_width_157=Unknown
% @importance 0.95

0.71::true_val(waist_width_157, v25_7); 0.29::true_val(waist_width_157, unk_waist_width_157).

measured(s1, waist_width_157, v25_7).

all_consistent(waist_width_157) :- consistent(s1, waist_width_157).

evidence(all_consistent(waist_width_157)).
query(true_val(waist_width_157, v25_7)).
query(true_val(waist_width_157, unk_waist_width_157)).

0.82::acc(s1, stance_width_range_size).

% @attr stance_width_range_size
% @type numeric
% @unit cm
% @canonical true
% @original_name stance_width_range_size
% @values v55_9=55.9 unk_stance_width_range_size=Unknown
% @importance 0.95

0.71::true_val(stance_width_range_size, v55_9); 0.29::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s1, stance_width_range_size, v55_9).

all_consistent(stance_width_range_size) :- consistent(s1, stance_width_range_size).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v55_9)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

0.82::acc(s1, recommended_weight_range_size).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size
% @values r59_86kg=59_86kg unk_recommended_weight_range_size=Unknown
% @importance 0.95

0.71::true_val(recommended_weight_range_size, r59_86kg); 0.29::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s1, recommended_weight_range_size, r59_86kg).

all_consistent(recommended_weight_range_size) :- consistent(s1, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, r59_86kg)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

0.82::acc(s1, effective_edge_159).

% @attr effective_edge_159
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 159cm
% @values v1223=1223.0 unk_effective_edge_159=Unknown
% @importance 0.95

0.71::true_val(effective_edge_159, v1223); 0.29::true_val(effective_edge_159, unk_effective_edge_159).

measured(s1, effective_edge_159, v1223).

all_consistent(effective_edge_159) :- consistent(s1, effective_edge_159).

evidence(all_consistent(effective_edge_159)).
query(true_val(effective_edge_159, v1223)).
query(true_val(effective_edge_159, unk_effective_edge_159)).

0.82::acc(s1, sidecut_radius_size_159).

% @attr sidecut_radius_size_159
% @type categorical
% @canonical false
% @original_name sidecut_radius_size
% @values r8_0_n1_5_8_0=8_0_neg1_5_8_0m unk_sidecut_radius_size_159=Unknown
% @importance 0.95

0.71::true_val(sidecut_radius_size_159, r8_0_n1_5_8_0); 0.29::true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159).

measured(s1, sidecut_radius_size_159, r8_0_n1_5_8_0).

all_consistent(sidecut_radius_size_159) :- consistent(s1, sidecut_radius_size_159).

evidence(all_consistent(sidecut_radius_size_159)).
query(true_val(sidecut_radius_size_159, r8_0_n1_5_8_0)).
query(true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159)).

0.82::acc(s1, waist_width_159).

% @attr waist_width_159
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 159cm
% @values v25_9=25.9 unk_waist_width_159=Unknown
% @importance 0.95

0.71::true_val(waist_width_159, v25_9); 0.29::true_val(waist_width_159, unk_waist_width_159).

measured(s1, waist_width_159, v25_9).

all_consistent(waist_width_159) :- consistent(s1, waist_width_159).

evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v25_9)).
query(true_val(waist_width_159, unk_waist_width_159)).

0.82::acc(s1, recommended_weight_range_size_159).

% @attr recommended_weight_range_size_159
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values r63_90kg=63_90kg unk_recommended_weight_range_size_159=Unknown
% @importance 0.95

0.71::true_val(recommended_weight_range_size_159, r63_90kg); 0.29::true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159).

measured(s1, recommended_weight_range_size_159, r63_90kg).

all_consistent(recommended_weight_range_size_159) :- consistent(s1, recommended_weight_range_size_159).

evidence(all_consistent(recommended_weight_range_size_159)).
query(true_val(recommended_weight_range_size_159, r63_90kg)).
query(true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159)).

0.82::acc(s1, effective_edge_158w).

% @attr effective_edge_158w
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 158W
% @values v1223=1223.0 unk_effective_edge_158w=Unknown
% @importance 0.95

0.71::true_val(effective_edge_158w, v1223); 0.29::true_val(effective_edge_158w, unk_effective_edge_158w).

measured(s1, effective_edge_158w, v1223).

all_consistent(effective_edge_158w) :- consistent(s1, effective_edge_158w).

evidence(all_consistent(effective_edge_158w)).
query(true_val(effective_edge_158w, v1223)).
query(true_val(effective_edge_158w, unk_effective_edge_158w)).

0.82::acc(s1, sidecut_radius_size_158w).

% @attr sidecut_radius_size_158w
% @type categorical
% @canonical false
% @original_name sidecut_radius_size
% @values r7_9_n1_5_7_9=7_9_neg1_5_7_9m unk_sidecut_radius_size_158w=Unknown
% @importance 0.95

0.71::true_val(sidecut_radius_size_158w, r7_9_n1_5_7_9); 0.29::true_val(sidecut_radius_size_158w, unk_sidecut_radius_size_158w).

measured(s1, sidecut_radius_size_158w, r7_9_n1_5_7_9).

all_consistent(sidecut_radius_size_158w) :- consistent(s1, sidecut_radius_size_158w).

evidence(all_consistent(sidecut_radius_size_158w)).
query(true_val(sidecut_radius_size_158w, r7_9_n1_5_7_9)).
query(true_val(sidecut_radius_size_158w, unk_sidecut_radius_size_158w)).

0.82::acc(s1, waist_width_158w).

% @attr waist_width_158w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 158W
% @values v26_3=26.3 unk_waist_width_158w=Unknown
% @importance 0.95

0.71::true_val(waist_width_158w, v26_3); 0.29::true_val(waist_width_158w, unk_waist_width_158w).

measured(s1, waist_width_158w, v26_3).

all_consistent(waist_width_158w) :- consistent(s1, waist_width_158w).

evidence(all_consistent(waist_width_158w)).
query(true_val(waist_width_158w, v26_3)).
query(true_val(waist_width_158w, unk_waist_width_158w)).

0.82::acc(s1, recommended_weight_range_size_158w).

% @attr recommended_weight_range_size_158w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values r59_86kg=59_86kg unk_recommended_weight_range_size_158w=Unknown
% @importance 0.95

0.71::true_val(recommended_weight_range_size_158w, r59_86kg); 0.29::true_val(recommended_weight_range_size_158w, unk_recommended_weight_range_size_158w).

measured(s1, recommended_weight_range_size_158w, r59_86kg).

all_consistent(recommended_weight_range_size_158w) :- consistent(s1, recommended_weight_range_size_158w).

evidence(all_consistent(recommended_weight_range_size_158w)).
query(true_val(recommended_weight_range_size_158w, r59_86kg)).
query(true_val(recommended_weight_range_size_158w, unk_recommended_weight_range_size_158w)).

0.82::acc(s1, effective_edge_160w).

% @attr effective_edge_160w
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 160W
% @values v1239=1239.0 unk_effective_edge_160w=Unknown
% @importance 0.95

0.71::true_val(effective_edge_160w, v1239); 0.29::true_val(effective_edge_160w, unk_effective_edge_160w).

measured(s1, effective_edge_160w, v1239).

all_consistent(effective_edge_160w) :- consistent(s1, effective_edge_160w).

evidence(all_consistent(effective_edge_160w)).
query(true_val(effective_edge_160w, v1239)).
query(true_val(effective_edge_160w, unk_effective_edge_160w)).

0.82::acc(s1, waist_width_160w).

% @attr waist_width_160w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 160W
% @values v26_5=26.5 unk_waist_width_160w=Unknown
% @importance 0.95

0.71::true_val(waist_width_160w, v26_5); 0.29::true_val(waist_width_160w, unk_waist_width_160w).

measured(s1, waist_width_160w, v26_5).

all_consistent(waist_width_160w) :- consistent(s1, waist_width_160w).

evidence(all_consistent(waist_width_160w)).
query(true_val(waist_width_160w, v26_5)).
query(true_val(waist_width_160w, unk_waist_width_160w)).

0.82::acc(s1, recommended_weight_range_size_160w).

% @attr recommended_weight_range_size_160w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values r63_90kg=63_90kg unk_recommended_weight_range_size_160w=Unknown
% @importance 0.95

0.71::true_val(recommended_weight_range_size_160w, r63_90kg); 0.29::true_val(recommended_weight_range_size_160w, unk_recommended_weight_range_size_160w).

measured(s1, recommended_weight_range_size_160w, r63_90kg).

all_consistent(recommended_weight_range_size_160w) :- consistent(s1, recommended_weight_range_size_160w).

evidence(all_consistent(recommended_weight_range_size_160w)).
query(true_val(recommended_weight_range_size_160w, r63_90kg)).
query(true_val(recommended_weight_range_size_160w, unk_recommended_weight_range_size_160w)).

0.85::acc(s38, boot_size_guide).

% @attr boot_size_guide
% @type categorical
% @canonical false
% @original_name Boot size guide
% @values full_range=153_8to8_5_thru_160W_11_5to12 unk_boot_size_guide=Unknown
% @importance 0.85

0.66::true_val(boot_size_guide, full_range); 0.34::true_val(boot_size_guide, unk_boot_size_guide).

measured(s38, boot_size_guide, full_range).

all_consistent(boot_size_guide) :- consistent(s38, boot_size_guide).

evidence(all_consistent(boot_size_guide)).
query(true_val(boot_size_guide, full_range)).
query(true_val(boot_size_guide, unk_boot_size_guide)).

0.82::acc(s1, price_aud_merchant).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v1699_99=1699.99 unk_price_aud_merchant=Unknown
% @importance 0.95

0.71::true_val(price_aud_merchant, v1699_99); 0.29::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s1, price_aud_merchant, v1699_99).

all_consistent(price_aud_merchant) :- consistent(s1, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v1699_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

0.95::acc(s39, price_usd_msrp).
0.85::acc(s93, price_usd_msrp).
0.75::acc(s38, price_usd_msrp).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v949_95=949.95 v759_95=759.95
% @importance 0.88

0.75::true_val(price_usd_msrp, v949_95); 0.25::true_val(price_usd_msrp, v759_95).

measured(s39, price_usd_msrp, v949_95).
measured(s93, price_usd_msrp, v949_95).
measured(s38, price_usd_msrp, v759_95).

all_consistent(price_usd_msrp) :-
    consistent(s39, price_usd_msrp),
    (indep(s93), consistent(s93, price_usd_msrp) ; \+indep(s93)),
    consistent(s38, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v949_95)).
query(true_val(price_usd_msrp, v759_95)).

0.85::acc(s71, price_usd_evo).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_evo
% @values v759_96=759.96 unk_price_usd_evo=Unknown
% @importance 0.85

0.72::true_val(price_usd_evo, v759_96); 0.28::true_val(price_usd_evo, unk_price_usd_evo).

measured(s71, price_usd_evo, v759_96).

all_consistent(price_usd_evo) :- consistent(s71, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v759_96)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

0.88::acc(s99, price_usd_rei).

% @attr price_usd_rei
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_rei
% @values v949_95=949.95 unk_price_usd_rei=Unknown
% @importance 0.80

0.77::true_val(price_usd_rei, v949_95); 0.23::true_val(price_usd_rei, unk_price_usd_rei).

measured(s99, price_usd_rei, v949_95).

all_consistent(price_usd_rei) :- consistent(s99, price_usd_rei).

evidence(all_consistent(price_usd_rei)).
query(true_val(price_usd_rei, v949_95)).
query(true_val(price_usd_rei, unk_price_usd_rei)).

0.78::acc(s95, price_usd_christy_sports).

% @attr price_usd_christy_sports
% @type numeric
% @unit USD
% @canonical false
% @original_name Price — USD (Christy Sports, 2026, on sale)
% @values v759_96=759.96 unk_price_usd_christy_sports=Unknown
% @importance 0.80

0.60::true_val(price_usd_christy_sports, v759_96); 0.40::true_val(price_usd_christy_sports, unk_price_usd_christy_sports).

measured(s95, price_usd_christy_sports, v759_96).

all_consistent(price_usd_christy_sports) :- consistent(s95, price_usd_christy_sports).

evidence(all_consistent(price_usd_christy_sports)).
query(true_val(price_usd_christy_sports, v759_96)).
query(true_val(price_usd_christy_sports, unk_price_usd_christy_sports)).

0.82::acc(s38, price_eur_blue_tomato).

% @attr price_eur_blue_tomato
% @type numeric
% @unit EUR
% @canonical true
% @original_name price_eur_blue_tomato
% @values v749=749.0 unk_price_eur_blue_tomato=Unknown
% @importance 0.85

0.66::true_val(price_eur_blue_tomato, v749); 0.34::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).

measured(s38, price_eur_blue_tomato, v749).

all_consistent(price_eur_blue_tomato) :- consistent(s38, price_eur_blue_tomato).

evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v749)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

0.82::acc(s38, price_cad_prfo).

% @attr price_cad_prfo
% @type numeric
% @unit CAD
% @canonical true
% @original_name price_cad_prfo
% @values v959_99=959.99 unk_price_cad_prfo=Unknown
% @importance 0.85

0.66::true_val(price_cad_prfo, v959_99); 0.34::true_val(price_cad_prfo, unk_price_cad_prfo).

measured(s38, price_cad_prfo, v959_99).

all_consistent(price_cad_prfo) :- consistent(s38, price_cad_prfo).

evidence(all_consistent(price_cad_prfo)).
query(true_val(price_cad_prfo, v959_99)).
query(true_val(price_cad_prfo, unk_price_cad_prfo)).

0.70::acc(s44, price_cad_sbf).

% @attr price_cad_sbf
% @type numeric
% @unit CAD
% @canonical false
% @original_name Price — CAD (SBF Boardshop, 2026)
% @values v1040=1040.0 unk_price_cad_sbf=Unknown
% @importance 0.70

0.47::true_val(price_cad_sbf, v1040); 0.53::true_val(price_cad_sbf, unk_price_cad_sbf).

measured(s44, price_cad_sbf, v1040).

all_consistent(price_cad_sbf) :- consistent(s44, price_cad_sbf).

evidence(all_consistent(price_cad_sbf)).
query(true_val(price_cad_sbf, v1040)).
query(true_val(price_cad_sbf, unk_price_cad_sbf)).

0.65::acc(s41, price_usd_ebay).

% @attr price_usd_ebay
% @type categorical
% @unit USD
% @canonical false
% @original_name Price — USD (eBay, 2026 new)
% @values range_759_96_to_949_95=759_96_to_949_95 unk_price_usd_ebay=Unknown
% @importance 0.70

0.35::true_val(price_usd_ebay, range_759_96_to_949_95); 0.65::true_val(price_usd_ebay, unk_price_usd_ebay).

measured(s41, price_usd_ebay, range_759_96_to_949_95).

all_consistent(price_usd_ebay) :- consistent(s41, price_usd_ebay).

evidence(all_consistent(price_usd_ebay)).
query(true_val(price_usd_ebay, range_759_96_to_949_95)).
query(true_val(price_usd_ebay, unk_price_usd_ebay)).

0.95::acc(s33, availability_status_capita_direct).
0.95::acc(s97, availability_status_capita_direct).

% @attr availability_status_capita_direct
% @type categorical
% @canonical false
% @original_name availability_status
% @values in_stock_2026_no_preorder=2026_in_stock_no_preorder unk_availability_status_capita_direct=Unknown
% @importance 0.875

0.93::true_val(availability_status_capita_direct, in_stock_2026_no_preorder); 0.07::true_val(availability_status_capita_direct, unk_availability_status_capita_direct).

measured(s33, availability_status_capita_direct, in_stock_2026_no_preorder).
measured(s97, availability_status_capita_direct, in_stock_2026_no_preorder).

all_consistent(availability_status_capita_direct) :-
    consistent(s33, availability_status_capita_direct),
    consistent(s97, availability_status_capita_direct).

evidence(all_consistent(availability_status_capita_direct)).
query(true_val(availability_status_capita_direct, in_stock_2026_no_preorder)).
query(true_val(availability_status_capita_direct, unk_availability_status_capita_direct)).

0.85::acc(s71, availability_status_evo).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status
% @values on_sale_2026=2026_on_sale_older_oos unk_availability_status_evo=Unknown
% @importance 0.85

0.72::true_val(availability_status_evo, on_sale_2026); 0.28::true_val(availability_status_evo, unk_availability_status_evo).

measured(s71, availability_status_evo, on_sale_2026).

all_consistent(availability_status_evo) :- consistent(s71, availability_status_evo).

evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, on_sale_2026)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

0.80::acc(s93, availability_status_the_house).

% @attr availability_status_the_house
% @type categorical
% @canonical false
% @original_name availability_status
% @values in_stock_2027=2027_in_stock_5_sizes unk_availability_status_the_house=Unknown
% @importance 0.90

0.71::true_val(availability_status_the_house, in_stock_2027); 0.29::true_val(availability_status_the_house, unk_availability_status_the_house).

measured(s93, availability_status_the_house, in_stock_2027).

all_consistent(availability_status_the_house) :-
    (indep(s93), consistent(s93, availability_status_the_house) ; \+indep(s93)).

evidence(all_consistent(availability_status_the_house)).
query(true_val(availability_status_the_house, in_stock_2027)).
query(true_val(availability_status_the_house, unk_availability_status_the_house)).

0.85::acc(s99, availability_status_rei).

% @attr availability_status_rei
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed_2025_26=Listed_2025_2026_at_MSRP unk_availability_status_rei=Unknown
% @importance 0.80

0.77::true_val(availability_status_rei, listed_2025_26); 0.23::true_val(availability_status_rei, unk_availability_status_rei).

measured(s99, availability_status_rei, listed_2025_26).

all_consistent(availability_status_rei) :-
    (indep(s99), consistent(s99, availability_status_rei) ; \+indep(s99)).

evidence(all_consistent(availability_status_rei)).
query(true_val(availability_status_rei, listed_2025_26)).
query(true_val(availability_status_rei, unk_availability_status_rei)).

0.72::acc(s42, availability_status_other_retailer).

% @attr availability_status_other_retailer
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed_2027=2027_model_listed unk_availability_status_other_retailer=Unknown
% @importance 0.80

0.50::true_val(availability_status_other_retailer, listed_2027); 0.50::true_val(availability_status_other_retailer, unk_availability_status_other_retailer).

measured(s42, availability_status_other_retailer, listed_2027).

all_consistent(availability_status_other_retailer) :- consistent(s42, availability_status_other_retailer).

evidence(all_consistent(availability_status_other_retailer)).
query(true_val(availability_status_other_retailer, listed_2027)).
query(true_val(availability_status_other_retailer, unk_availability_status_other_retailer)).

0.78::acc(s95, availability_status_christy).

% @attr availability_status_christy
% @type categorical
% @canonical false
% @original_name availability_status
% @values on_sale_2026_low_inv=2026_on_sale_low_inventory unk_availability_status_christy=Unknown
% @importance 0.80

0.60::true_val(availability_status_christy, on_sale_2026_low_inv); 0.40::true_val(availability_status_christy, unk_availability_status_christy).

measured(s95, availability_status_christy, on_sale_2026_low_inv).

all_consistent(availability_status_christy) :-
    (indep(s95), consistent(s95, availability_status_christy) ; \+indep(s95)).

evidence(all_consistent(availability_status_christy)).
query(true_val(availability_status_christy, on_sale_2026_low_inv)).
query(true_val(availability_status_christy, unk_availability_status_christy)).

0.72::acc(s92, availability_status_oos).

% @attr availability_status_oos
% @type categorical
% @canonical false
% @original_name availability_status
% @values oos_2026=Out_of_stock_2026 unk_availability_status_oos=Unknown
% @importance 0.80

0.50::true_val(availability_status_oos, oos_2026); 0.50::true_val(availability_status_oos, unk_availability_status_oos).

measured(s92, availability_status_oos, oos_2026).

all_consistent(availability_status_oos) :- consistent(s92, availability_status_oos).

evidence(all_consistent(availability_status_oos)).
query(true_val(availability_status_oos, oos_2026)).
query(true_val(availability_status_oos, unk_availability_status_oos)).

0.70::acc(s44, availability_status_sbf).

% @attr availability_status_sbf
% @type categorical
% @canonical false
% @original_name availability_status
% @values on_sale_2026=2026_on_sale unk_availability_status_sbf=Unknown
% @importance 0.70

0.47::true_val(availability_status_sbf, on_sale_2026); 0.53::true_val(availability_status_sbf, unk_availability_status_sbf).

measured(s44, availability_status_sbf, on_sale_2026).

all_consistent(availability_status_sbf) :-
    (indep(s44), consistent(s44, availability_status_sbf) ; \+indep(s44)).

evidence(all_consistent(availability_status_sbf)).
query(true_val(availability_status_sbf, on_sale_2026)).
query(true_val(availability_status_sbf, unk_availability_status_sbf)).

0.85::acc(s71, retailer_evo).

% @attr retailer_evo
% @type categorical
% @canonical false
% @original_name evo.com
% @values major_specialty_retailer=Major_US_specialty_free_ship_price_match unk_retailer_evo=Unknown
% @importance 0.775

0.72::true_val(retailer_evo, major_specialty_retailer); 0.28::true_val(retailer_evo, unk_retailer_evo).

measured(s71, retailer_evo, major_specialty_retailer).

all_consistent(retailer_evo) :- consistent(s71, retailer_evo).

evidence(all_consistent(retailer_evo)).
query(true_val(retailer_evo, major_specialty_retailer)).
query(true_val(retailer_evo, unk_retailer_evo)).

0.88::acc(s99, retailer_rei).

% @attr retailer_rei
% @type categorical
% @canonical false
% @original_name REI
% @values major_outdoor_coop=Major_outdoor_coop_member_rewards unk_retailer_rei=Unknown
% @importance 0.80

0.77::true_val(retailer_rei, major_outdoor_coop); 0.23::true_val(retailer_rei, unk_retailer_rei).

measured(s99, retailer_rei, major_outdoor_coop).

all_consistent(retailer_rei) :- consistent(s99, retailer_rei).

evidence(all_consistent(retailer_rei)).
query(true_val(retailer_rei, major_outdoor_coop)).
query(true_val(retailer_rei, unk_retailer_rei)).

0.80::acc(s38, retailer_the_house).
0.80::acc(s93, retailer_the_house).

% @attr retailer_the_house
% @type categorical
% @canonical false
% @original_name The House
% @values established_board_shop=Established_online_board_shop_free_ship_100day unk_retailer_the_house=Unknown
% @importance 0.875

0.88::true_val(retailer_the_house, established_board_shop); 0.12::true_val(retailer_the_house, unk_retailer_the_house).

measured(s38, retailer_the_house, established_board_shop).
measured(s93, retailer_the_house, established_board_shop).

all_consistent(retailer_the_house) :-
    consistent(s38, retailer_the_house),
    (indep(s93), consistent(s93, retailer_the_house) ; \+indep(s93)).

evidence(all_consistent(retailer_the_house)).
query(true_val(retailer_the_house, established_board_shop)).
query(true_val(retailer_the_house, unk_retailer_the_house)).

0.95::acc(s97, retailer_capita_direct).

% @attr retailer_capita_direct
% @type categorical
% @canonical false
% @original_name CAPiTA Direct
% @values official_store=Official_manufacturer_store_free_ship_75 unk_retailer_capita_direct=Unknown
% @importance 1.00

0.90::true_val(retailer_capita_direct, official_store); 0.10::true_val(retailer_capita_direct, unk_retailer_capita_direct).

measured(s97, retailer_capita_direct, official_store).

all_consistent(retailer_capita_direct) :- consistent(s97, retailer_capita_direct).

evidence(all_consistent(retailer_capita_direct)).
query(true_val(retailer_capita_direct, official_store)).
query(true_val(retailer_capita_direct, unk_retailer_capita_direct)).

0.82::acc(s1, retailer_melbourne_sc).

% @attr retailer_melbourne_sc
% @type categorical
% @canonical false
% @original_name Melbourne Snowboard Centre
% @values established_au_retailer=Established_Australian_retailer_free_ship_100AUD unk_retailer_melbourne_sc=Unknown
% @importance 0.95

0.71::true_val(retailer_melbourne_sc, established_au_retailer); 0.29::true_val(retailer_melbourne_sc, unk_retailer_melbourne_sc).

measured(s1, retailer_melbourne_sc, established_au_retailer).

all_consistent(retailer_melbourne_sc) :- consistent(s1, retailer_melbourne_sc).

evidence(all_consistent(retailer_melbourne_sc)).
query(true_val(retailer_melbourne_sc, established_au_retailer)).
query(true_val(retailer_melbourne_sc, unk_retailer_melbourne_sc)).

0.78::acc(s95, retailer_christy_sports).

% @attr retailer_christy_sports
% @type categorical
% @canonical false
% @original_name Christy Sports
% @values us_chain=US_chain_ski_snowboard_in_store unk_retailer_christy_sports=Unknown
% @importance 0.80

0.60::true_val(retailer_christy_sports, us_chain); 0.40::true_val(retailer_christy_sports, unk_retailer_christy_sports).

measured(s95, retailer_christy_sports, us_chain).

all_consistent(retailer_christy_sports) :- consistent(s95, retailer_christy_sports).

evidence(all_consistent(retailer_christy_sports)).
query(true_val(retailer_christy_sports, us_chain)).
query(true_val(retailer_christy_sports, unk_retailer_christy_sports)).

0.82::acc(s1, terrain_suitability).
0.85::acc(s7, terrain_suitability).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values powder_freeride_all_mtn_resort=Powder_freeride_all_mountain_in_resort unk_terrain_suitability=Unknown
% @importance 0.875

0.90::true_val(terrain_suitability, powder_freeride_all_mtn_resort); 0.10::true_val(terrain_suitability, unk_terrain_suitability).

measured(s1, terrain_suitability, powder_freeride_all_mtn_resort).

all_consistent(terrain_suitability) :-
    (indep(s1), consistent(s1, terrain_suitability) ; \+indep(s1)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, powder_freeride_all_mtn_resort)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

0.95::acc(s97, riding_style).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values all_mtn_freeride=All_Mtn_Freeride unk_riding_style=Unknown
% @importance 1.00

0.90::true_val(riding_style, all_mtn_freeride); 0.10::true_val(riding_style, unk_riding_style).

measured(s97, riding_style, all_mtn_freeride).

all_consistent(riding_style) :- consistent(s97, riding_style).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, all_mtn_freeride)).
query(true_val(riding_style, unk_riding_style)).

0.82::acc(s1, rider_level).
0.80::acc(s15, rider_level).
0.78::acc(s46, rider_level).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values advanced_to_expert=Advanced_to_Expert unk_rider_level=Unknown
% @importance 0.80

0.95::true_val(rider_level, advanced_to_expert); 0.05::true_val(rider_level, unk_rider_level).

measured(s1, rider_level, advanced_to_expert).
measured(s15, rider_level, advanced_to_expert).
measured(s46, rider_level, advanced_to_expert).

all_consistent(rider_level) :-
    (indep(s1), consistent(s1, rider_level) ; \+indep(s1)),
    (indep(s15), consistent(s15, rider_level) ; \+indep(s15)),
    (indep(s46), consistent(s46, rider_level) ; \+indep(s46)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, advanced_to_expert)).
query(true_val(rider_level, unk_rider_level)).

0.82::acc(s3, riding_style_aggressive).
0.82::acc(s14, riding_style_aggressive).
0.82::acc(s32, riding_style_aggressive).

% @attr riding_style_aggressive
% @type categorical
% @canonical false
% @original_name riding_style
% @values aggressive_charge_hard=Aggressive_all_mountain_charge_hard_ride_fast unk_riding_style_aggressive=Unknown
% @importance 0.85

0.93::true_val(riding_style_aggressive, aggressive_charge_hard); 0.07::true_val(riding_style_aggressive, unk_riding_style_aggressive).

measured(s3, riding_style_aggressive, aggressive_charge_hard).
measured(s14, riding_style_aggressive, aggressive_charge_hard).
measured(s32, riding_style_aggressive, aggressive_charge_hard).

all_consistent(riding_style_aggressive) :-
    consistent(s3, riding_style_aggressive),
    consistent(s14, riding_style_aggressive),
    consistent(s32, riding_style_aggressive).

evidence(all_consistent(riding_style_aggressive)).
query(true_val(riding_style_aggressive, aggressive_charge_hard)).
query(true_val(riding_style_aggressive, unk_riding_style_aggressive)).

0.82::acc(s32, terrain_suitability_quiver).
0.82::acc(s90, terrain_suitability_quiver).

% @attr terrain_suitability_quiver
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values one_board_quiver_or_daily_driver=One_board_quiver_or_daily_driver unk_terrain_suitability_quiver=Unknown
% @importance 0.85

0.88::true_val(terrain_suitability_quiver, one_board_quiver_or_daily_driver); 0.12::true_val(terrain_suitability_quiver, unk_terrain_suitability_quiver).

measured(s32, terrain_suitability_quiver, one_board_quiver_or_daily_driver).
measured(s90, terrain_suitability_quiver, one_board_quiver_or_daily_driver).

all_consistent(terrain_suitability_quiver) :-
    consistent(s32, terrain_suitability_quiver),
    consistent(s90, terrain_suitability_quiver).

evidence(all_consistent(terrain_suitability_quiver)).
query(true_val(terrain_suitability_quiver, one_board_quiver_or_daily_driver)).
query(true_val(terrain_suitability_quiver, unk_terrain_suitability_quiver)).

0.85::acc(s37, skill_level_recommendation_whitelines).

% @attr skill_level_recommendation_whitelines
% @type categorical
% @canonical false
% @original_name skill_level_recommendation
% @values experienced_not_afraid_cash=Experienced_rider_not_afraid_to_splash_cash unk_skill_level_recommendation_whitelines=Unknown
% @importance 0.75

0.72::true_val(skill_level_recommendation_whitelines, experienced_not_afraid_cash); 0.28::true_val(skill_level_recommendation_whitelines, unk_skill_level_recommendation_whitelines).

measured(s37, skill_level_recommendation_whitelines, experienced_not_afraid_cash).

all_consistent(skill_level_recommendation_whitelines) :- consistent(s37, skill_level_recommendation_whitelines).

evidence(all_consistent(skill_level_recommendation_whitelines)).
query(true_val(skill_level_recommendation_whitelines, experienced_not_afraid_cash)).
query(true_val(skill_level_recommendation_whitelines, unk_skill_level_recommendation_whitelines)).

0.85::acc(s7, terrain_suitability_variable).
0.82::acc(s19, terrain_suitability_variable).

% @attr terrain_suitability_variable
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values groomers_powder_park_sidehits=Groomers_powder_park_jumps_sidehits_banked_slaloms unk_terrain_suitability_variable=Unknown
% @importance 0.80

0.88::true_val(terrain_suitability_variable, groomers_powder_park_sidehits); 0.12::true_val(terrain_suitability_variable, unk_terrain_suitability_variable).

measured(s7, terrain_suitability_variable, groomers_powder_park_sidehits).

all_consistent(terrain_suitability_variable) :- consistent(s7, terrain_suitability_variable).

evidence(all_consistent(terrain_suitability_variable)).
query(true_val(terrain_suitability_variable, groomers_powder_park_sidehits)).
query(true_val(terrain_suitability_variable, unk_terrain_suitability_variable)).

0.88::acc(s38, pop).

% @attr pop
% @type categorical
% @canonical true
% @original_name pop
% @values exceptional=Exceptional_never_felt_pop_like_this unk_pop=Unknown
% @importance 0.85

0.66::true_val(pop, exceptional); 0.34::true_val(pop, unk_pop).

measured(s38, pop, exceptional).

all_consistent(pop) :- consistent(s38, pop).

evidence(all_consistent(pop)).
query(true_val(pop, exceptional)).
query(true_val(pop, unk_pop)).

0.85::acc(s7, weight_feel).
0.82::acc(s34, weight_feel).
0.82::acc(s52, weight_feel).

% @attr weight_feel
% @type categorical
% @canonical false
% @original_name Weight feel
% @values extremely_lightweight=Extremely_lightweight_remarkably_light unk_weight_feel=Unknown
% @importance 0.72

0.93::true_val(weight_feel, extremely_lightweight); 0.07::true_val(weight_feel, unk_weight_feel).

measured(s7, weight_feel, extremely_lightweight).
measured(s34, weight_feel, extremely_lightweight).
measured(s52, weight_feel, extremely_lightweight).

all_consistent(weight_feel) :-
    consistent(s7, weight_feel),
    consistent(s34, weight_feel),
    consistent(s52, weight_feel).

evidence(all_consistent(weight_feel)).
query(true_val(weight_feel, extremely_lightweight)).
query(true_val(weight_feel, unk_weight_feel)).

0.85::acc(s34, base_glide_performance).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values very_fast=Very_fast_wanting_to_accelerate unk_base_glide_performance=Unknown
% @importance 0.80

0.55::true_val(base_glide_performance, very_fast); 0.45::true_val(base_glide_performance, unk_base_glide_performance).

measured(s34, base_glide_performance, very_fast).

all_consistent(base_glide_performance) :- consistent(s34, base_glide_performance).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, very_fast)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

0.82::acc(s82, base_glide_performance_vs_mercury).
0.78::acc(s84, base_glide_performance_vs_mercury).

% @attr base_glide_performance_vs_mercury
% @type categorical
% @canonical false
% @original_name base_glide_performance
% @values faster_than_mercury=Faster_than_regular_Mercury unk_base_glide_performance_vs_mercury=Unknown
% @importance 0.65

0.85::true_val(base_glide_performance_vs_mercury, faster_than_mercury); 0.15::true_val(base_glide_performance_vs_mercury, unk_base_glide_performance_vs_mercury).

measured(s82, base_glide_performance_vs_mercury, faster_than_mercury).
measured(s84, base_glide_performance_vs_mercury, faster_than_mercury).

all_consistent(base_glide_performance_vs_mercury) :-
    consistent(s82, base_glide_performance_vs_mercury),
    consistent(s84, base_glide_performance_vs_mercury).

evidence(all_consistent(base_glide_performance_vs_mercury)).
query(true_val(base_glide_performance_vs_mercury, faster_than_mercury)).
query(true_val(base_glide_performance_vs_mercury, unk_base_glide_performance_vs_mercury)).

0.78::acc(s5, stability_at_speed).
0.75::acc(s30, stability_at_speed).

% @attr stability_at_speed
% @type categorical
% @canonical false
% @original_name Stability at speed
% @values excellent=Excellent_locked_in_edge_to_edge_easy unk_stability_at_speed=Unknown
% @importance 0.70

0.80::true_val(stability_at_speed, excellent); 0.20::true_val(stability_at_speed, unk_stability_at_speed).

measured(s5, stability_at_speed, excellent).
measured(s30, stability_at_speed, excellent).

all_consistent(stability_at_speed) :-
    consistent(s5, stability_at_speed),
    consistent(s30, stability_at_speed).

evidence(all_consistent(stability_at_speed)).
query(true_val(stability_at_speed, excellent)).
query(true_val(stability_at_speed, unk_stability_at_speed)).

0.82::acc(s14, carving_rating_tgr).
0.82::acc(s32, carving_rating_tgr).

% @attr carving_rating_tgr
% @type categorical
% @canonical true
% @original_name carving_rating_tgr
% @values good_slightly_less_invincible=Still_good_slightly_less_invincible_2025 unk_carving_rating_tgr=Unknown
% @importance 0.85

0.66::true_val(carving_rating_tgr, good_slightly_less_invincible); 0.34::true_val(carving_rating_tgr, unk_carving_rating_tgr).

measured(s14, carving_rating_tgr, good_slightly_less_invincible).
measured(s32, carving_rating_tgr, good_slightly_less_invincible).

all_consistent(carving_rating_tgr) :-
    consistent(s14, carving_rating_tgr),
    consistent(s32, carving_rating_tgr).

evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, good_slightly_less_invincible)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

0.82::acc(s14, carving_rating_tgr_spring).
0.82::acc(s32, carving_rating_tgr_spring).

% @attr carving_rating_tgr_spring
% @type categorical
% @canonical false
% @original_name carving_rating_tgr
% @values improved_spring_pop=Improved_spring_pop_out_of_carves_moderate_speed unk_carving_rating_tgr_spring=Unknown
% @importance 0.85

0.66::true_val(carving_rating_tgr_spring, improved_spring_pop); 0.34::true_val(carving_rating_tgr_spring, unk_carving_rating_tgr_spring).

measured(s14, carving_rating_tgr_spring, improved_spring_pop).
measured(s32, carving_rating_tgr_spring, improved_spring_pop).

all_consistent(carving_rating_tgr_spring) :-
    consistent(s14, carving_rating_tgr_spring),
    consistent(s32, carving_rating_tgr_spring).

evidence(all_consistent(carving_rating_tgr_spring)).
query(true_val(carving_rating_tgr_spring, improved_spring_pop)).
query(true_val(carving_rating_tgr_spring, unk_carving_rating_tgr_spring)).

0.88::acc(s81, edge_hold).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values pretty_good_not_top=Pretty_good_Death_Grip_helps_not_on_par_hard_snow unk_edge_hold=Unknown
% @importance 0.70

0.68::true_val(edge_hold, pretty_good_not_top); 0.32::true_val(edge_hold, unk_edge_hold).

measured(s81, edge_hold, pretty_good_not_top).

all_consistent(edge_hold) :- consistent(s81, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, pretty_good_not_top)).
query(true_val(edge_hold, unk_edge_hold)).

0.85::acc(s25, reviewer_opinion_the_good_ride).
0.85::acc(s38, reviewer_opinion_the_good_ride).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values expensive_lively_mercury=Expensive_but_much_more_lively_Mercury unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.825

0.80::true_val(reviewer_opinion_the_good_ride, expensive_lively_mercury); 0.20::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s25, reviewer_opinion_the_good_ride, expensive_lively_mercury).
measured(s38, reviewer_opinion_the_good_ride, expensive_lively_mercury).

all_consistent(reviewer_opinion_the_good_ride) :-
    consistent(s25, reviewer_opinion_the_good_ride),
    consistent(s38, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, expensive_lively_mercury)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

0.85::acc(s25, tgr_dampness).
0.85::acc(s38, tgr_dampness).

% @attr tgr_dampness
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values not_super_damp_no_sacrifice=Not_super_damp_but_no_sacrifice_vs_Mercury unk_tgr_dampness=Unknown
% @importance 0.825

0.80::true_val(tgr_dampness, not_super_damp_no_sacrifice); 0.20::true_val(tgr_dampness, unk_tgr_dampness).

measured(s25, tgr_dampness, not_super_damp_no_sacrifice).
measured(s38, tgr_dampness, not_super_damp_no_sacrifice).

all_consistent(tgr_dampness) :-
    consistent(s25, tgr_dampness),
    consistent(s38, tgr_dampness).

evidence(all_consistent(tgr_dampness)).
query(true_val(tgr_dampness, not_super_damp_no_sacrifice)).
query(true_val(tgr_dampness, unk_tgr_dampness)).

0.82::acc(s14, tgr_crud_stability).

% @attr tgr_crud_stability
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values stable_crud_has_limits=Stable_in_crud_but_has_limits unk_tgr_crud_stability=Unknown
% @importance 0.85

0.66::true_val(tgr_crud_stability, stable_crud_has_limits); 0.34::true_val(tgr_crud_stability, unk_tgr_crud_stability).

measured(s14, tgr_crud_stability, stable_crud_has_limits).

all_consistent(tgr_crud_stability) :- consistent(s14, tgr_crud_stability).

evidence(all_consistent(tgr_crud_stability)).
query(true_val(tgr_crud_stability, stable_crud_has_limits)).
query(true_val(tgr_crud_stability, unk_tgr_crud_stability)).

0.85::acc(s38, tgr_bounce_tendency).

% @attr tgr_bounce_tendency
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values poppy_buck_bounce_soft=Poppy_boards_buck_bounce_in_soft_uneven unk_tgr_bounce_tendency=Unknown
% @importance 0.85

0.66::true_val(tgr_bounce_tendency, poppy_buck_bounce_soft); 0.34::true_val(tgr_bounce_tendency, unk_tgr_bounce_tendency).

measured(s38, tgr_bounce_tendency, poppy_buck_bounce_soft).

all_consistent(tgr_bounce_tendency) :- consistent(s38, tgr_bounce_tendency).

evidence(all_consistent(tgr_bounce_tendency)).
query(true_val(tgr_bounce_tendency, poppy_buck_bounce_soft)).
query(true_val(tgr_bounce_tendency, unk_tgr_bounce_tendency)).

0.82::acc(s14, powder_rating_tgr).
0.82::acc(s32, powder_rating_tgr).

% @attr powder_rating_tgr
% @type categorical
% @canonical true
% @original_name powder_rating_tgr
% @values above_average=Above_average_rocker_directional_setback unk_powder_rating_tgr=Unknown
% @importance 0.85

0.66::true_val(powder_rating_tgr, above_average); 0.34::true_val(powder_rating_tgr, unk_powder_rating_tgr).

measured(s14, powder_rating_tgr, above_average).
measured(s32, powder_rating_tgr, above_average).

all_consistent(powder_rating_tgr) :-
    consistent(s14, powder_rating_tgr),
    consistent(s32, powder_rating_tgr).

evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, above_average)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

0.82::acc(s14, powder_rating_tgr_detail).

% @attr powder_rating_tgr_detail
% @type categorical
% @canonical false
% @original_name powder_rating_tgr
% @values not_amazing_little_above_avg=Not_amazing_deep_powder_little_above_average unk_powder_rating_tgr_detail=Unknown
% @importance 0.85

0.66::true_val(powder_rating_tgr_detail, not_amazing_little_above_avg); 0.34::true_val(powder_rating_tgr_detail, unk_powder_rating_tgr_detail).

measured(s14, powder_rating_tgr_detail, not_amazing_little_above_avg).

all_consistent(powder_rating_tgr_detail) :- consistent(s14, powder_rating_tgr_detail).

evidence(all_consistent(powder_rating_tgr_detail)).
query(true_val(powder_rating_tgr_detail, not_amazing_little_above_avg)).
query(true_val(powder_rating_tgr_detail, unk_powder_rating_tgr_detail)).

0.75::acc(s27, user_review_forum).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values prefers_speed_irritating_slow=Board_prefers_speed_irritating_at_slow unk_user_review_forum=Unknown
% @importance 0.80

0.32::true_val(user_review_forum, prefers_speed_irritating_slow); 0.68::true_val(user_review_forum, unk_user_review_forum).

measured(s27, user_review_forum, prefers_speed_irritating_slow).

all_consistent(user_review_forum) :- consistent(s27, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, prefers_speed_irritating_slow)).
query(true_val(user_review_forum, unk_user_review_forum)).

0.82::acc(s14, switch_riding).
0.82::acc(s52, switch_riding).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values doable_not_effortless=Doable_not_effortless_some_catch_risk unk_switch_riding=Unknown
% @importance 0.75

0.80::true_val(switch_riding, doable_not_effortless); 0.20::true_val(switch_riding, unk_switch_riding).

measured(s14, switch_riding, doable_not_effortless).
measured(s52, switch_riding, doable_not_effortless).

all_consistent(switch_riding) :-
    consistent(s14, switch_riding),
    consistent(s52, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, doable_not_effortless)).
query(true_val(switch_riding, unk_switch_riding)).

0.85::acc(s7, jumps_rating_tgr).
0.82::acc(s22, jumps_rating_tgr).

% @attr jumps_rating_tgr
% @type categorical
% @canonical true
% @original_name jumps_rating_tgr
% @values surprisingly_capable=Surprisingly_capable_great_pop_stable_tracking unk_jumps_rating_tgr=Unknown
% @importance 0.80

0.85::true_val(jumps_rating_tgr, surprisingly_capable); 0.15::true_val(jumps_rating_tgr, unk_jumps_rating_tgr).

measured(s7, jumps_rating_tgr, surprisingly_capable).

all_consistent(jumps_rating_tgr) :- consistent(s7, jumps_rating_tgr).

evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, surprisingly_capable)).
query(true_val(jumps_rating_tgr, unk_jumps_rating_tgr)).

0.82::acc(s14, jibbing_rating_tgr).
0.82::acc(s52, jibbing_rating_tgr).

% @attr jibbing_rating_tgr
% @type categorical
% @canonical true
% @original_name jibbing_rating_tgr
% @values better_than_expected_not_best=Better_than_expected_not_best_for_jibs unk_jibbing_rating_tgr=Unknown
% @importance 0.75

0.75::true_val(jibbing_rating_tgr, better_than_expected_not_best); 0.25::true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr).

measured(s14, jibbing_rating_tgr, better_than_expected_not_best).
measured(s52, jibbing_rating_tgr, better_than_expected_not_best).

all_consistent(jibbing_rating_tgr) :-
    consistent(s14, jibbing_rating_tgr),
    consistent(s52, jibbing_rating_tgr).

evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, better_than_expected_not_best)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr)).

0.85::acc(s38, tgr_requires_muscle).
0.82::acc(s90, tgr_requires_muscle).

% @attr tgr_requires_muscle
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values requires_muscle_locks_in=Requires_muscle_but_locks_into_place unk_tgr_requires_muscle=Unknown
% @importance 0.825

0.80::true_val(tgr_requires_muscle, requires_muscle_locks_in); 0.20::true_val(tgr_requires_muscle, unk_tgr_requires_muscle).

measured(s38, tgr_requires_muscle, requires_muscle_locks_in).
measured(s90, tgr_requires_muscle, requires_muscle_locks_in).

all_consistent(tgr_requires_muscle) :-
    consistent(s38, tgr_requires_muscle),
    consistent(s90, tgr_requires_muscle).

evidence(all_consistent(tgr_requires_muscle)).
query(true_val(tgr_requires_muscle, requires_muscle_locks_in)).
query(true_val(tgr_requires_muscle, unk_tgr_requires_muscle)).

0.82::acc(s43, responsiveness).

% @attr responsiveness
% @type categorical
% @canonical false
% @original_name Responsiveness
% @values very_responsive_energetic=Very_responsive_energetic_from_carbon unk_responsiveness=Unknown
% @importance 0.75

0.59::true_val(responsiveness, very_responsive_energetic); 0.41::true_val(responsiveness, unk_responsiveness).

measured(s43, responsiveness, very_responsive_energetic).

all_consistent(responsiveness) :-
    (indep(s43), consistent(s43, responsiveness) ; \+indep(s43)).

evidence(all_consistent(responsiveness)).
query(true_val(responsiveness, very_responsive_energetic)).
query(true_val(responsiveness, unk_responsiveness)).

0.82::acc(s14, forgiveness).
0.82::acc(s32, forgiveness).

% @attr forgiveness
% @type categorical
% @canonical false
% @original_name Forgiveness
% @values more_forgiving_than_expected=More_forgiving_than_expected_2025_mellowed unk_forgiveness=Unknown
% @importance 0.85

0.80::true_val(forgiveness, more_forgiving_than_expected); 0.20::true_val(forgiveness, unk_forgiveness).

measured(s14, forgiveness, more_forgiving_than_expected).
measured(s32, forgiveness, more_forgiving_than_expected).

all_consistent(forgiveness) :-
    consistent(s14, forgiveness),
    consistent(s32, forgiveness).

evidence(all_consistent(forgiveness)).
query(true_val(forgiveness, more_forgiving_than_expected)).
query(true_val(forgiveness, unk_forgiveness)).

0.82::acc(s14, catchiness).

% @attr catchiness
% @type categorical
% @canonical false
% @original_name Catchiness
% @values not_catch_free_less_than_bsod=Not_catch_free_less_catchy_than_BSOD unk_catchiness=Unknown
% @importance 0.85

0.66::true_val(catchiness, not_catch_free_less_than_bsod); 0.34::true_val(catchiness, unk_catchiness).

measured(s14, catchiness, not_catch_free_less_than_bsod).

all_consistent(catchiness) :- consistent(s14, catchiness).

evidence(all_consistent(catchiness)).
query(true_val(catchiness, not_catch_free_less_than_bsod)).
query(true_val(catchiness, unk_catchiness)).

0.72::acc(s5, user_review_forum_auto_spinny).

% @attr user_review_forum_auto_spinny
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values auto_spinny_flat_not_speed=Bit_auto_spinny_flat_cats_not_at_speed unk_user_review_forum_auto_spinny=Unknown
% @importance 0.70

0.30::true_val(user_review_forum_auto_spinny, auto_spinny_flat_not_speed); 0.70::true_val(user_review_forum_auto_spinny, unk_user_review_forum_auto_spinny).

measured(s5, user_review_forum_auto_spinny, auto_spinny_flat_not_speed).

all_consistent(user_review_forum_auto_spinny) :- consistent(s5, user_review_forum_auto_spinny).

evidence(all_consistent(user_review_forum_auto_spinny)).
query(true_val(user_review_forum_auto_spinny, auto_spinny_flat_not_speed)).
query(true_val(user_review_forum_auto_spinny, unk_user_review_forum_auto_spinny)).

0.85::acc(s23, reviewer_opinion_whitelines).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values top_100_selected=Selected_top_100_snowboard_products unk_reviewer_opinion_whitelines=Unknown
% @importance 0.70

0.68::true_val(reviewer_opinion_whitelines, top_100_selected); 0.32::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

measured(s23, reviewer_opinion_whitelines, top_100_selected).

all_consistent(reviewer_opinion_whitelines) :- consistent(s23, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, top_100_selected)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

0.85::acc(s24, reviewer_opinion_whitelines_repeat).

% @attr reviewer_opinion_whitelines_repeat
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values top_100_again=Again_selected_top_100 unk_reviewer_opinion_whitelines_repeat=Unknown
% @importance 0.65

0.68::true_val(reviewer_opinion_whitelines_repeat, top_100_again); 0.32::true_val(reviewer_opinion_whitelines_repeat, unk_reviewer_opinion_whitelines_repeat).

measured(s24, reviewer_opinion_whitelines_repeat, top_100_again).

all_consistent(reviewer_opinion_whitelines_repeat) :- consistent(s24, reviewer_opinion_whitelines_repeat).

evidence(all_consistent(reviewer_opinion_whitelines_repeat)).
query(true_val(reviewer_opinion_whitelines_repeat, top_100_again)).
query(true_val(reviewer_opinion_whitelines_repeat, unk_reviewer_opinion_whitelines_repeat)).

0.82::acc(s90, overall_rating_snowboardingprofiles).

% @attr overall_rating_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name overall_rating_snowboardingprofiles
% @values ranked_1st_of_19=Ranked_1st_out_of_19_aggressive_all_mtn unk_overall_rating_snowboardingprofiles=Unknown
% @importance 0.80

0.63::true_val(overall_rating_snowboardingprofiles, ranked_1st_of_19); 0.37::true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles).

measured(s90, overall_rating_snowboardingprofiles, ranked_1st_of_19).

all_consistent(overall_rating_snowboardingprofiles) :- consistent(s90, overall_rating_snowboardingprofiles).

evidence(all_consistent(overall_rating_snowboardingprofiles)).
query(true_val(overall_rating_snowboardingprofiles, ranked_1st_of_19)).
query(true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles)).

0.85::acc(s7, evo_review_summary).
0.85::acc(s36, evo_review_summary).

% @attr evo_review_summary
% @type categorical
% @canonical false
% @original_name evo review summary
% @values favorite_all_mtn_dir_twin=One_of_favorite_all_mountain_directional_twins unk_evo_review_summary=Unknown
% @importance 0.80

0.80::true_val(evo_review_summary, favorite_all_mtn_dir_twin); 0.20::true_val(evo_review_summary, unk_evo_review_summary).

measured(s7, evo_review_summary, favorite_all_mtn_dir_twin).
measured(s36, evo_review_summary, favorite_all_mtn_dir_twin).

all_consistent(evo_review_summary) :-
    consistent(s7, evo_review_summary),
    consistent(s36, evo_review_summary).

evidence(all_consistent(evo_review_summary)).
query(true_val(evo_review_summary, favorite_all_mtn_dir_twin)).
query(true_val(evo_review_summary, unk_evo_review_summary)).

0.82::acc(s34, snowboard_robot_summary).

% @attr snowboard_robot_summary
% @type categorical
% @canonical false
% @original_name Snowboard Robot summary
% @values would_choose_mega_merc=Would_choose_Mega_Merc_over_Mercury unk_snowboard_robot_summary=Unknown
% @importance 0.80

0.55::true_val(snowboard_robot_summary, would_choose_mega_merc); 0.45::true_val(snowboard_robot_summary, unk_snowboard_robot_summary).

measured(s34, snowboard_robot_summary, would_choose_mega_merc).

all_consistent(snowboard_robot_summary) :- consistent(s34, snowboard_robot_summary).

evidence(all_consistent(snowboard_robot_summary)).
query(true_val(snowboard_robot_summary, would_choose_mega_merc)).
query(true_val(snowboard_robot_summary, unk_snowboard_robot_summary)).

0.82::acc(s27, comparable_board_same_brand).
0.82::acc(s34, comparable_board_same_brand).
0.82::acc(s82, comparable_board_same_brand).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values mercury_calmer_less_demanding=Mercury_calmer_less_demanding_Mega_lighter_faster unk_comparable_board_same_brand=Unknown
% @importance 0.75

0.88::true_val(comparable_board_same_brand, mercury_calmer_less_demanding); 0.12::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s27, comparable_board_same_brand, mercury_calmer_less_demanding).
measured(s34, comparable_board_same_brand, mercury_calmer_less_demanding).
measured(s82, comparable_board_same_brand, mercury_calmer_less_demanding).

all_consistent(comparable_board_same_brand) :-
    consistent(s27, comparable_board_same_brand),
    consistent(s34, comparable_board_same_brand),
    consistent(s82, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, mercury_calmer_less_demanding)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

0.82::acc(s14, comparable_board_same_brand_bsod).
0.82::acc(s32, comparable_board_same_brand_bsod).

% @attr comparable_board_same_brand_bsod
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values bsod_better_long_carves=BSOD_better_long_radius_Mega_better_moderate unk_comparable_board_same_brand_bsod=Unknown
% @importance 0.85

0.80::true_val(comparable_board_same_brand_bsod, bsod_better_long_carves); 0.20::true_val(comparable_board_same_brand_bsod, unk_comparable_board_same_brand_bsod).

measured(s14, comparable_board_same_brand_bsod, bsod_better_long_carves).
measured(s32, comparable_board_same_brand_bsod, bsod_better_long_carves).

all_consistent(comparable_board_same_brand_bsod) :-
    consistent(s14, comparable_board_same_brand_bsod),
    consistent(s32, comparable_board_same_brand_bsod).

evidence(all_consistent(comparable_board_same_brand_bsod)).
query(true_val(comparable_board_same_brand_bsod, bsod_better_long_carves)).
query(true_val(comparable_board_same_brand_bsod, unk_comparable_board_same_brand_bsod)).

0.93::acc(s39, comparable_board_same_brand_mega_lineup).

% @attr comparable_board_same_brand_mega_lineup
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values higher_end_mega_lineup=Higher_end_sibling_in_Mega_lineup unk_comparable_board_same_brand_mega_lineup=Unknown
% @importance 0.95

0.88::true_val(comparable_board_same_brand_mega_lineup, higher_end_mega_lineup); 0.12::true_val(comparable_board_same_brand_mega_lineup, unk_comparable_board_same_brand_mega_lineup).

measured(s39, comparable_board_same_brand_mega_lineup, higher_end_mega_lineup).

all_consistent(comparable_board_same_brand_mega_lineup) :- consistent(s39, comparable_board_same_brand_mega_lineup).

evidence(all_consistent(comparable_board_same_brand_mega_lineup)).
query(true_val(comparable_board_same_brand_mega_lineup, higher_end_mega_lineup)).
query(true_val(comparable_board_same_brand_mega_lineup, unk_comparable_board_same_brand_mega_lineup)).

0.80::acc(s85, comparable_board_same_brand_sdoa).
0.93::acc(s39, comparable_board_same_brand_sdoa).

% @attr comparable_board_same_brand_sdoa
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values sdoa_true_twin_park=SDOA_true_twin_park_focused_similar_core unk_comparable_board_same_brand_sdoa=Unknown
% @importance 0.875

0.85::true_val(comparable_board_same_brand_sdoa, sdoa_true_twin_park); 0.15::true_val(comparable_board_same_brand_sdoa, unk_comparable_board_same_brand_sdoa).

measured(s85, comparable_board_same_brand_sdoa, sdoa_true_twin_park).
measured(s39, comparable_board_same_brand_sdoa, sdoa_true_twin_park).

all_consistent(comparable_board_same_brand_sdoa) :-
    consistent(s85, comparable_board_same_brand_sdoa),
    consistent(s39, comparable_board_same_brand_sdoa).

evidence(all_consistent(comparable_board_same_brand_sdoa)).
query(true_val(comparable_board_same_brand_sdoa, sdoa_true_twin_park)).
query(true_val(comparable_board_same_brand_sdoa, unk_comparable_board_same_brand_sdoa)).

0.82::acc(s10, comparable_board_cross_brand).
0.85::acc(s38, comparable_board_cross_brand).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values jones_bataleon_salomon_etc=Jones_Ultra_Bataleon_Plus_Salomon_Pro_Nitro_Pro_NS_Proto_Burton_GC unk_comparable_board_cross_brand=Unknown
% @importance 0.80

0.80::true_val(comparable_board_cross_brand, jones_bataleon_salomon_etc); 0.20::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s10, comparable_board_cross_brand, jones_bataleon_salomon_etc).
measured(s38, comparable_board_cross_brand, jones_bataleon_salomon_etc).

all_consistent(comparable_board_cross_brand) :-
    consistent(s10, comparable_board_cross_brand),
    consistent(s38, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, jones_bataleon_salomon_etc)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

0.80::acc(s10, comparable_board_same_brand_most_riders).
0.82::acc(s34, comparable_board_same_brand_most_riders).

% @attr comparable_board_same_brand_most_riders
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values most_riders_mercury_enough=Most_riders_get_everything_from_Mercury unk_comparable_board_same_brand_most_riders=Unknown
% @importance 0.80

0.80::true_val(comparable_board_same_brand_most_riders, most_riders_mercury_enough); 0.20::true_val(comparable_board_same_brand_most_riders, unk_comparable_board_same_brand_most_riders).

measured(s10, comparable_board_same_brand_most_riders, most_riders_mercury_enough).
measured(s34, comparable_board_same_brand_most_riders, most_riders_mercury_enough).

all_consistent(comparable_board_same_brand_most_riders) :-
    consistent(s10, comparable_board_same_brand_most_riders),
    consistent(s34, comparable_board_same_brand_most_riders).

evidence(all_consistent(comparable_board_same_brand_most_riders)).
query(true_val(comparable_board_same_brand_most_riders, most_riders_mercury_enough)).
query(true_val(comparable_board_same_brand_most_riders, unk_comparable_board_same_brand_most_riders)).

0.82::acc(s1, design_inspiration).
0.90::acc(s4, design_inspiration).

% @attr design_inspiration
% @type categorical
% @canonical false
% @original_name Design inspiration
% @values mercury_series=Mercury_snowboard_series unk_design_inspiration=Unknown
% @importance 0.975

0.92::true_val(design_inspiration, mercury_series); 0.08::true_val(design_inspiration, unk_design_inspiration).

measured(s1, design_inspiration, mercury_series).
measured(s4, design_inspiration, mercury_series).

all_consistent(design_inspiration) :-
    consistent(s4, design_inspiration),
    (indep(s1), consistent(s1, design_inspiration) ; \+indep(s1)).

evidence(all_consistent(design_inspiration)).
query(true_val(design_inspiration, mercury_series)).
query(true_val(design_inspiration, unk_design_inspiration)).

0.80::acc(s85, topsheet_appearance_description).

% @attr topsheet_appearance_description
% @type categorical
% @canonical true
% @original_name topsheet_appearance_description
% @values space_theme_3d_core=Space_theme_visible_3D_core_shaping unk_topsheet_appearance_description=Unknown
% @importance 0.80

0.55::true_val(topsheet_appearance_description, space_theme_3d_core); 0.45::true_val(topsheet_appearance_description, unk_topsheet_appearance_description).

measured(s85, topsheet_appearance_description, space_theme_3d_core).

all_consistent(topsheet_appearance_description) :- consistent(s85, topsheet_appearance_description).

evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, space_theme_3d_core)).
query(true_val(topsheet_appearance_description, unk_topsheet_appearance_description)).

0.82::acc(s23, topsheet_appearance_description_detail).
0.80::acc(s85, topsheet_appearance_description_detail).

% @attr topsheet_appearance_description_detail
% @type categorical
% @canonical false
% @original_name topsheet_appearance_description
% @values black_chrome_silver_texture=Black_chrome_silver_underlay_thermopolymer_textures unk_topsheet_appearance_description_detail=Unknown
% @importance 0.75

0.80::true_val(topsheet_appearance_description_detail, black_chrome_silver_texture); 0.20::true_val(topsheet_appearance_description_detail, unk_topsheet_appearance_description_detail).

measured(s23, topsheet_appearance_description_detail, black_chrome_silver_texture).
measured(s85, topsheet_appearance_description_detail, black_chrome_silver_texture).

all_consistent(topsheet_appearance_description_detail) :-
    consistent(s23, topsheet_appearance_description_detail),
    consistent(s85, topsheet_appearance_description_detail).

evidence(all_consistent(topsheet_appearance_description_detail)).
query(true_val(topsheet_appearance_description_detail, black_chrome_silver_texture)).
query(true_val(topsheet_appearance_description_detail, unk_topsheet_appearance_description_detail)).

0.90::acc(s4, base_graphics_design).
0.78::acc(s9, base_graphics_design).
0.95::acc(s12, base_graphics_design).

% @attr base_graphics_design
% @type categorical
% @canonical false
% @original_name Base graphics
% @values die_cut_laser_two_colours=Die_cut_laser_two_colour_per_size unk_base_graphics_design=Unknown
% @importance 0.63

0.95::true_val(base_graphics_design, die_cut_laser_two_colours); 0.05::true_val(base_graphics_design, unk_base_graphics_design).

measured(s4, base_graphics_design, die_cut_laser_two_colours).
measured(s9, base_graphics_design, die_cut_laser_two_colours).
measured(s12, base_graphics_design, die_cut_laser_two_colours).

all_consistent(base_graphics_design) :-
    consistent(s4, base_graphics_design),
    consistent(s12, base_graphics_design),
    (indep(s9), consistent(s9, base_graphics_design) ; \+indep(s9)).

evidence(all_consistent(base_graphics_design)).
query(true_val(base_graphics_design, die_cut_laser_two_colours)).
query(true_val(base_graphics_design, unk_base_graphics_design)).

0.85::acc(s7, sustainability_certification_zero_emissions).
0.85::acc(s36, sustainability_certification_zero_emissions).

% @attr sustainability_certification_zero_emissions
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values zero_co2_ozone_gwp=100pct_zero_CO2_zero_ozone_zero_GWP unk_sustainability_certification_zero_emissions=Unknown
% @importance 0.80

0.80::true_val(sustainability_certification_zero_emissions, zero_co2_ozone_gwp); 0.20::true_val(sustainability_certification_zero_emissions, unk_sustainability_certification_zero_emissions).

measured(s7, sustainability_certification_zero_emissions, zero_co2_ozone_gwp).
measured(s36, sustainability_certification_zero_emissions, zero_co2_ozone_gwp).

all_consistent(sustainability_certification_zero_emissions) :-
    consistent(s7, sustainability_certification_zero_emissions),
    consistent(s36, sustainability_certification_zero_emissions).

evidence(all_consistent(sustainability_certification_zero_emissions)).
query(true_val(sustainability_certification_zero_emissions, zero_co2_ozone_gwp)).
query(true_val(sustainability_certification_zero_emissions, unk_sustainability_certification_zero_emissions)).

0.93::acc(s4, sustainability_certification_fsc_poplar).
0.78::acc(s16, sustainability_certification_fsc_poplar).

% @attr sustainability_certification_fsc_poplar
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values fsc_reforestation_poplar=FSC_Certified_reforestation_Poplar unk_sustainability_certification_fsc_poplar=Unknown
% @importance 0.85

0.90::true_val(sustainability_certification_fsc_poplar, fsc_reforestation_poplar); 0.10::true_val(sustainability_certification_fsc_poplar, unk_sustainability_certification_fsc_poplar).

measured(s4, sustainability_certification_fsc_poplar, fsc_reforestation_poplar).
measured(s16, sustainability_certification_fsc_poplar, fsc_reforestation_poplar).

all_consistent(sustainability_certification_fsc_poplar) :-
    consistent(s4, sustainability_certification_fsc_poplar),
    (indep(s16), consistent(s16, sustainability_certification_fsc_poplar) ; \+indep(s16)).

evidence(all_consistent(sustainability_certification_fsc_poplar)).
query(true_val(sustainability_certification_fsc_poplar, fsc_reforestation_poplar)).
query(true_val(sustainability_certification_fsc_poplar, unk_sustainability_certification_fsc_poplar)).

0.93::acc(s4, sustainability_certification_pet_core).
0.78::acc(s16, sustainability_certification_pet_core).

% @attr sustainability_certification_pet_core
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values recycled_pet_core_channels=Post_consumer_recycled_PET_channels unk_sustainability_certification_pet_core=Unknown
% @importance 0.85

0.90::true_val(sustainability_certification_pet_core, recycled_pet_core_channels); 0.10::true_val(sustainability_certification_pet_core, unk_sustainability_certification_pet_core).

measured(s4, sustainability_certification_pet_core, recycled_pet_core_channels).
measured(s16, sustainability_certification_pet_core, recycled_pet_core_channels).

all_consistent(sustainability_certification_pet_core) :-
    consistent(s4, sustainability_certification_pet_core),
    (indep(s16), consistent(s16, sustainability_certification_pet_core) ; \+indep(s16)).

evidence(all_consistent(sustainability_certification_pet_core)).
query(true_val(sustainability_certification_pet_core, recycled_pet_core_channels)).
query(true_val(sustainability_certification_pet_core, unk_sustainability_certification_pet_core)).

0.82::acc(s1, sustainability_certification_resin).
0.80::acc(s11, sustainability_certification_resin).

% @attr sustainability_certification_resin
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values magic_bean_resin_plant=Plant_based_Magic_Bean_Resin_zero_waste unk_sustainability_certification_resin=Unknown
% @importance 0.825

0.90::true_val(sustainability_certification_resin, magic_bean_resin_plant); 0.10::true_val(sustainability_certification_resin, unk_sustainability_certification_resin).

measured(s1, sustainability_certification_resin, magic_bean_resin_plant).
measured(s11, sustainability_certification_resin, magic_bean_resin_plant).

all_consistent(sustainability_certification_resin) :-
    (indep(s1), consistent(s1, sustainability_certification_resin) ; \+indep(s1)),
    (indep(s11), consistent(s11, sustainability_certification_resin) ; \+indep(s11)).

evidence(all_consistent(sustainability_certification_resin)).
query(true_val(sustainability_certification_resin, magic_bean_resin_plant)).
query(true_val(sustainability_certification_resin, unk_sustainability_certification_resin)).

0.82::acc(s1, sustainability_certification_ink).
0.80::acc(s11, sustainability_certification_ink).

% @attr sustainability_certification_ink
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values solventless_water_uv=Solventless_water_based_UV_ink unk_sustainability_certification_ink=Unknown
% @importance 0.825

0.90::true_val(sustainability_certification_ink, solventless_water_uv); 0.10::true_val(sustainability_certification_ink, unk_sustainability_certification_ink).

measured(s1, sustainability_certification_ink, solventless_water_uv).
measured(s11, sustainability_certification_ink, solventless_water_uv).

all_consistent(sustainability_certification_ink) :-
    (indep(s1), consistent(s1, sustainability_certification_ink) ; \+indep(s1)),
    (indep(s11), consistent(s11, sustainability_certification_ink) ; \+indep(s11)).

evidence(all_consistent(sustainability_certification_ink)).
query(true_val(sustainability_certification_ink, solventless_water_uv)).
query(true_val(sustainability_certification_ink, unk_sustainability_certification_ink)).

0.90::acc(s62, sustainability_certification_low_temp).

% @attr sustainability_certification_low_temp
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values low_temp_press_reduced_cycle=Boards_pressed_lower_temps_reduced_cycle unk_sustainability_certification_low_temp=Unknown
% @importance 0.50

0.86::true_val(sustainability_certification_low_temp, low_temp_press_reduced_cycle); 0.14::true_val(sustainability_certification_low_temp, unk_sustainability_certification_low_temp).

measured(s62, sustainability_certification_low_temp, low_temp_press_reduced_cycle).

all_consistent(sustainability_certification_low_temp) :- consistent(s62, sustainability_certification_low_temp).

evidence(all_consistent(sustainability_certification_low_temp)).
query(true_val(sustainability_certification_low_temp, low_temp_press_reduced_cycle)).
query(true_val(sustainability_certification_low_temp, unk_sustainability_certification_low_temp)).

0.93::acc(s39, comparable_board_same_brand_price_diff).

% @attr comparable_board_same_brand_price_diff
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values usd270_more_than_mercury=Approx_270USD_more_than_Mercury unk_comparable_board_same_brand_price_diff=Unknown
% @importance 0.95

0.88::true_val(comparable_board_same_brand_price_diff, usd270_more_than_mercury); 0.12::true_val(comparable_board_same_brand_price_diff, unk_comparable_board_same_brand_price_diff).

measured(s39, comparable_board_same_brand_price_diff, usd270_more_than_mercury).

all_consistent(comparable_board_same_brand_price_diff) :- consistent(s39, comparable_board_same_brand_price_diff).

evidence(all_consistent(comparable_board_same_brand_price_diff)).
query(true_val(comparable_board_same_brand_price_diff, usd270_more_than_mercury)).
query(true_val(comparable_board_same_brand_price_diff, unk_comparable_board_same_brand_price_diff)).

0.82::acc(s14, negative_aspect).
0.82::acc(s32, negative_aspect).
0.82::acc(s90, negative_aspect).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values not_for_casual_beginners=Not_for_casual_playful_beginners_intermediates unk_negative_aspect=Unknown
% @importance 0.82

0.88::true_val(negative_aspect, not_for_casual_beginners); 0.12::true_val(negative_aspect, unk_negative_aspect).

measured(s14, negative_aspect, not_for_casual_beginners).
measured(s32, negative_aspect, not_for_casual_beginners).
measured(s90, negative_aspect, not_for_casual_beginners).

all_consistent(negative_aspect) :-
    consistent(s14, negative_aspect),
    consistent(s32, negative_aspect),
    consistent(s90, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, not_for_casual_beginners)).
query(true_val(negative_aspect, unk_negative_aspect)).

0.82::acc(s32, skill_level_recommendation).
0.82::acc(s90, skill_level_recommendation).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values adv_expert_aggressive_quiver=Advanced_expert_aggressive_one_board_quiver unk_skill_level_recommendation=Unknown
% @importance 0.85

0.80::true_val(skill_level_recommendation, adv_expert_aggressive_quiver); 0.20::true_val(skill_level_recommendation, unk_skill_level_recommendation).

measured(s32, skill_level_recommendation, adv_expert_aggressive_quiver).
measured(s90, skill_level_recommendation, adv_expert_aggressive_quiver).

all_consistent(skill_level_recommendation) :-
    consistent(s32, skill_level_recommendation),
    consistent(s90, skill_level_recommendation).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, adv_expert_aggressive_quiver)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

0.82::acc(s3, skill_level_recommendation_purposeful).
0.82::acc(s14, skill_level_recommendation_purposeful).

% @attr skill_level_recommendation_purposeful
% @type categorical
% @canonical false
% @original_name skill_level_recommendation
% @values requires_purposeful_riding=Requires_purposeful_riding_intent_energy unk_skill_level_recommendation_purposeful=Unknown
% @importance 0.85

0.80::true_val(skill_level_recommendation_purposeful, requires_purposeful_riding); 0.20::true_val(skill_level_recommendation_purposeful, unk_skill_level_recommendation_purposeful).

measured(s3, skill_level_recommendation_purposeful, requires_purposeful_riding).
measured(s14, skill_level_recommendation_purposeful, requires_purposeful_riding).

all_consistent(skill_level_recommendation_purposeful) :-
    consistent(s3, skill_level_recommendation_purposeful),
    consistent(s14, skill_level_recommendation_purposeful).

evidence(all_consistent(skill_level_recommendation_purposeful)).
query(true_val(skill_level_recommendation_purposeful, requires_purposeful_riding)).
query(true_val(skill_level_recommendation_purposeful, unk_skill_level_recommendation_purposeful)).

0.75::acc(s27, user_review_forum_slow_speed).

% @attr user_review_forum_slow_speed
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values irritating_slow_speeds=Almost_irritating_at_slower_speeds unk_user_review_forum_slow_speed=Unknown
% @importance 0.80

0.32::true_val(user_review_forum_slow_speed, irritating_slow_speeds); 0.68::true_val(user_review_forum_slow_speed, unk_user_review_forum_slow_speed).

measured(s27, user_review_forum_slow_speed, irritating_slow_speeds).

all_consistent(user_review_forum_slow_speed) :- consistent(s27, user_review_forum_slow_speed).

evidence(all_consistent(user_review_forum_slow_speed)).
query(true_val(user_review_forum_slow_speed, irritating_slow_speeds)).
query(true_val(user_review_forum_slow_speed, unk_user_review_forum_slow_speed)).

0.82::acc(s14, negative_aspect_powder).
0.82::acc(s32, negative_aspect_powder).

% @attr negative_aspect_powder
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values not_dedicated_powder=Not_dedicated_powder_board_specialists_outperform unk_negative_aspect_powder=Unknown
% @importance 0.85

0.80::true_val(negative_aspect_powder, not_dedicated_powder); 0.20::true_val(negative_aspect_powder, unk_negative_aspect_powder).

measured(s14, negative_aspect_powder, not_dedicated_powder).
measured(s32, negative_aspect_powder, not_dedicated_powder).

all_consistent(negative_aspect_powder) :-
    consistent(s14, negative_aspect_powder),
    consistent(s32, negative_aspect_powder).

evidence(all_consistent(negative_aspect_powder)).
query(true_val(negative_aspect_powder, not_dedicated_powder)).
query(true_val(negative_aspect_powder, unk_negative_aspect_powder)).

0.85::acc(s38, tgr_weight_note).

% @attr tgr_weight_note
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values no_exact_weight_wood_varies=No_exact_weight_wood_cores_inconsistent unk_tgr_weight_note=Unknown
% @importance 0.85

0.66::true_val(tgr_weight_note, no_exact_weight_wood_varies); 0.34::true_val(tgr_weight_note, unk_tgr_weight_note).

measured(s38, tgr_weight_note, no_exact_weight_wood_varies).

all_consistent(tgr_weight_note) :- consistent(s38, tgr_weight_note).

evidence(all_consistent(tgr_weight_note)).
query(true_val(tgr_weight_note, no_exact_weight_wood_varies)).
query(true_val(tgr_weight_note, unk_tgr_weight_note)).

0.72::acc(s5, user_review_forum_enthusiastic).
0.72::acc(s27, user_review_forum_enthusiastic).
0.70::acc(s30, user_review_forum_enthusiastic).

% @attr user_review_forum_enthusiastic
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values multiple_enthusiastic_owners=Multiple_enthusiastic_owners unk_user_review_forum_enthusiastic=Unknown
% @importance 0.70

0.78::true_val(user_review_forum_enthusiastic, multiple_enthusiastic_owners); 0.22::true_val(user_review_forum_enthusiastic, unk_user_review_forum_enthusiastic).

measured(s5, user_review_forum_enthusiastic, multiple_enthusiastic_owners).
measured(s27, user_review_forum_enthusiastic, multiple_enthusiastic_owners).
measured(s30, user_review_forum_enthusiastic, multiple_enthusiastic_owners).

all_consistent(user_review_forum_enthusiastic) :-
    consistent(s5, user_review_forum_enthusiastic),
    consistent(s27, user_review_forum_enthusiastic),
    consistent(s30, user_review_forum_enthusiastic).

evidence(all_consistent(user_review_forum_enthusiastic)).
query(true_val(user_review_forum_enthusiastic, multiple_enthusiastic_owners)).
query(true_val(user_review_forum_enthusiastic, unk_user_review_forum_enthusiastic)).

0.82::acc(s34, value_assessment).

% @attr value_assessment
% @type categorical
% @canonical false
% @original_name Value assessment (Snowboard Robot)
% @values no_downsides_if_money_ok=No_downsides_if_money_not_issue unk_value_assessment=Unknown
% @importance 0.80

0.55::true_val(value_assessment, no_downsides_if_money_ok); 0.45::true_val(value_assessment, unk_value_assessment).

measured(s34, value_assessment, no_downsides_if_money_ok).

all_consistent(value_assessment) :- consistent(s34, value_assessment).

evidence(all_consistent(value_assessment)).
query(true_val(value_assessment, no_downsides_if_money_ok)).
query(true_val(value_assessment, unk_value_assessment)).

0.85::acc(s23, reviewer_opinion_whitelines_price).
0.85::acc(s24, reviewer_opinion_whitelines_price).

% @attr reviewer_opinion_whitelines_price
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values price_ensures_committed_riders=Price_ensures_most_committed_riders unk_reviewer_opinion_whitelines_price=Unknown
% @importance 0.675

0.80::true_val(reviewer_opinion_whitelines_price, price_ensures_committed_riders); 0.20::true_val(reviewer_opinion_whitelines_price, unk_reviewer_opinion_whitelines_price).

measured(s23, reviewer_opinion_whitelines_price, price_ensures_committed_riders).
measured(s24, reviewer_opinion_whitelines_price, price_ensures_committed_riders).

all_consistent(reviewer_opinion_whitelines_price) :-
    consistent(s23, reviewer_opinion_whitelines_price),
    consistent(s24, reviewer_opinion_whitelines_price).

evidence(all_consistent(reviewer_opinion_whitelines_price)).
query(true_val(reviewer_opinion_whitelines_price, price_ensures_committed_riders)).
query(true_val(reviewer_opinion_whitelines_price, unk_reviewer_opinion_whitelines_price)).