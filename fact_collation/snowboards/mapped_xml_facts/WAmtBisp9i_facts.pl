0.15::indep(s1).
0.15::indep(s2).
0.12::indep(s3).
0.10::indep(s8).
0.12::indep(s9).
0.20::indep(s10).
0.12::indep(s14).
0.15::indep(s15).
0.15::indep(s20).
0.15::indep(s21).
0.15::indep(s_merchant).
0.15::indep(s26).
0.15::indep(s28).
0.80::indep(s42).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values burton=Burton unk_brand=Unknown
% @importance 0.95

0.95::acc(s6, brand).
0.88::acc(s1, brand).

0.97::true_val(brand, burton); 0.03::true_val(brand, unk_brand).

measured(s6, brand, burton).
measured(s1, brand, burton).

all_consistent(brand) :-
    consistent(s6, brand),
    (indep(s1), consistent(s1, brand) ; \+indep(s1)).

evidence(all_consistent(brand)).
query(true_val(brand, burton)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values custom_x=Custom_X unk_model_name=Unknown
% @importance 0.95

0.95::acc(s6, model_name).
0.88::acc(s1, model_name).

0.97::true_val(model_name, custom_x); 0.03::true_val(model_name, unk_model_name).

measured(s6, model_name, custom_x).
measured(s1, model_name, custom_x).

all_consistent(model_name) :-
    consistent(s6, model_name),
    (indep(s1), consistent(s1, model_name) ; \+indep(s1)).

evidence(all_consistent(model_name)).
query(true_val(model_name, custom_x)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2025=2025 unk_model_year=Unknown
% @importance 1.0

0.93::acc(s6, model_year).

0.90::true_val(model_year, y2025); 0.10::true_val(model_year, unk_model_year).

measured(s6, model_year, y2025).

all_consistent(model_year) :- consistent(s6, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2025)).
query(true_val(model_year, unk_model_year)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.9

0.88::acc(s1, product_type).

0.90::true_val(product_type, snowboard); 0.10::true_val(product_type, unk_product_type).

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
% @values all_mountain=All_Mountain unk_board_category=Unknown
% @importance 1.0

0.93::acc(s6, board_category).

0.92::true_val(board_category, all_mountain); 0.08::true_val(board_category, unk_board_category).

measured(s6, board_category, all_mountain).

all_consistent(board_category) :- consistent(s6, board_category).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain)).
query(true_val(board_category, unk_board_category)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values aggressive_all_mountain=Aggressive_All_Mountain unk_riding_style=Unknown
% @importance 0.85

0.87::acc(s11, riding_style).

0.92::true_val(riding_style, aggressive_all_mountain); 0.08::true_val(riding_style, unk_riding_style).

measured(s11, riding_style, aggressive_all_mountain).

all_consistent(riding_style) :- consistent(s11, riding_style).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, aggressive_all_mountain)).
query(true_val(riding_style, unk_riding_style)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 1.0

0.93::acc(s6, gender).

0.92::true_val(gender, mens); 0.08::true_val(gender, unk_gender).

measured(s6, gender, mens).

all_consistent(gender) :- consistent(s6, gender).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values burton_snowboards=Burton_Snowboards_founded_1977_Vermont unk_manufacturer=Unknown
% @importance 0.5

0.82::acc(s20, manufacturer).
0.75::acc(s42, manufacturer).

0.95::true_val(manufacturer, burton_snowboards); 0.05::true_val(manufacturer, unk_manufacturer).

measured(s20, manufacturer, burton_snowboards).
measured(s42, manufacturer, burton_snowboards).

all_consistent(manufacturer) :-
    (indep(s20), consistent(s20, manufacturer) ; \+indep(s20)),
    (indep(s42), consistent(s42, manufacturer) ; \+indep(s42)).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, burton_snowboards)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr burton_founded_location
% @type categorical
% @canonical false
% @original_name Burton founded location
% @values manchester_vt=Manchester_Vermont unk_burton_founded_location=Unknown
% @importance 0.4

0.75::acc(s42, burton_founded_location).

0.82::true_val(burton_founded_location, manchester_vt); 0.18::true_val(burton_founded_location, unk_burton_founded_location).

measured(s42, burton_founded_location, manchester_vt).

all_consistent(burton_founded_location) :-
    (indep(s42), consistent(s42, burton_founded_location) ; \+indep(s42)).

evidence(all_consistent(burton_founded_location)).
query(true_val(burton_founded_location, manchester_vt)).
query(true_val(burton_founded_location, unk_burton_founded_location)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values y2004=2004 unk_model_first_available_year=Unknown
% @importance 0.6

0.95::acc(s35, model_first_available_year).

0.95::true_val(model_first_available_year, y2004); 0.05::true_val(model_first_available_year, unk_model_first_available_year).

measured(s35, model_first_available_year, y2004).

all_consistent(model_first_available_year) :- consistent(s35, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2004)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr custom_parent_first_launched
% @type categorical
% @canonical false
% @original_name Burton Custom (parent model) first launched
% @values y1996=1996 unk_custom_parent_first_launched=Unknown
% @importance 0.55

0.75::acc(s34, custom_parent_first_launched).
0.95::acc(s35, custom_parent_first_launched).

0.95::true_val(custom_parent_first_launched, y1996); 0.05::true_val(custom_parent_first_launched, unk_custom_parent_first_launched).

measured(s34, custom_parent_first_launched, y1996).
measured(s35, custom_parent_first_launched, y1996).

all_consistent(custom_parent_first_launched) :-
    consistent(s34, custom_parent_first_launched),
    consistent(s35, custom_parent_first_launched).

evidence(all_consistent(custom_parent_first_launched)).
query(true_val(custom_parent_first_launched, y1996)).
query(true_val(custom_parent_first_launched, unk_custom_parent_first_launched)).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values austria=Austria unk_manufacturing_location=Unknown
% @importance 0.775

0.82::acc(s7, manufacturing_location).
0.60::acc(s45, manufacturing_location).

0.92::true_val(manufacturing_location, austria); 0.08::true_val(manufacturing_location, unk_manufacturing_location).

measured(s7, manufacturing_location, austria).
measured(s45, manufacturing_location, austria).

all_consistent(manufacturing_location) :-
    consistent(s7, manufacturing_location),
    consistent(s45, manufacturing_location).

evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, austria)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

% @attr graphic_designer_artist
% @type categorical
% @canonical true
% @original_name graphic_designer_artist
% @values bruno_penabranca=Bruno_Penabranca unk_graphic_designer_artist=Unknown
% @importance 0.6

0.78::acc(s21, graphic_designer_artist).

0.82::true_val(graphic_designer_artist, bruno_penabranca); 0.18::true_val(graphic_designer_artist, unk_graphic_designer_artist).

measured(s21, graphic_designer_artist, bruno_penabranca).

all_consistent(graphic_designer_artist) :-
    (indep(s21), consistent(s21, graphic_designer_artist) ; \+indep(s21)).

evidence(all_consistent(graphic_designer_artist)).
query(true_val(graphic_designer_artist, bruno_penabranca)).
query(true_val(graphic_designer_artist, unk_graphic_designer_artist)).

% @attr topsheet_appearance_description
% @type categorical
% @canonical true
% @original_name topsheet_appearance_description
% @values lenticular_motion=Lenticular_style_graphics_illusion_of_motion unk_topsheet_appearance_description=Unknown
% @importance 0.7

0.85::acc(s2, topsheet_appearance_description).

0.85::true_val(topsheet_appearance_description, lenticular_motion); 0.15::true_val(topsheet_appearance_description, unk_topsheet_appearance_description).

measured(s2, topsheet_appearance_description, lenticular_motion).

all_consistent(topsheet_appearance_description) :-
    (indep(s2), consistent(s2, topsheet_appearance_description) ; \+indep(s2)).

evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, lenticular_motion)).
query(true_val(topsheet_appearance_description, unk_topsheet_appearance_description)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values b_corp=Yes_B_Corporation unk_sustainability_certification=Unknown
% @importance 1.0

0.90::acc(s6, sustainability_certification).

0.88::true_val(sustainability_certification, b_corp); 0.12::true_val(sustainability_certification, unk_sustainability_certification).

measured(s6, sustainability_certification, b_corp).

all_consistent(sustainability_certification) :- consistent(s6, sustainability_certification).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, b_corp)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr warranty_period_years
% @type numeric
% @unit years
% @canonical true
% @original_name warranty_period_years
% @values v3=3.0 unk_warranty_period_years=Unknown
% @importance 0.8

0.88::acc(s2, warranty_period_years).
0.95::acc(s55, warranty_period_years).

0.97::true_val(warranty_period_years, v3); 0.03::true_val(warranty_period_years, unk_warranty_period_years).

measured(s2, warranty_period_years, v3).
measured(s55, warranty_period_years, v3).

all_consistent(warranty_period_years) :-
    (indep(s2), consistent(s2, warranty_period_years) ; \+indep(s2)),
    consistent(s55, warranty_period_years).

evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v3)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values one_year_defects=1_year_warranty_against_defects unk_warranty=Unknown
% @importance 0.75

0.95::acc(s58, warranty).

0.93::true_val(warranty, one_year_defects); 0.07::true_val(warranty, unk_warranty).

measured(s58, warranty, one_year_defects).

all_consistent(warranty) :- consistent(s58, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, one_year_defects)).
query(true_val(warranty, unk_warranty)).

% @attr warranty_conditions
% @type categorical
% @canonical false
% @original_name warranty
% @values original_purchaser_auth_dealer=Original_purchaser_only_authorized_dealer unk_warranty_conditions=Unknown
% @importance 0.8

0.93::acc(s55, warranty_conditions).

0.92::true_val(warranty_conditions, original_purchaser_auth_dealer); 0.08::true_val(warranty_conditions, unk_warranty_conditions).

measured(s55, warranty_conditions, original_purchaser_auth_dealer).

all_consistent(warranty_conditions) :- consistent(s55, warranty_conditions).

evidence(all_consistent(warranty_conditions)).
query(true_val(warranty_conditions, original_purchaser_auth_dealer)).
query(true_val(warranty_conditions, unk_warranty_conditions)).

% @attr resin
% @type categorical
% @canonical true
% @original_name resin
% @values super_sap_epoxy=Super_Sap_Epoxy_bio_based_50pct_less_carbon unk_resin=Unknown
% @importance 0.85

0.88::acc(s9, resin).
0.88::acc(s15, resin).

0.95::true_val(resin, super_sap_epoxy); 0.05::true_val(resin, unk_resin).

measured(s9, resin, super_sap_epoxy).
measured(s15, resin, super_sap_epoxy).

all_consistent(resin) :-
    (indep(s9), consistent(s9, resin) ; \+indep(s9)),
    (indep(s15), consistent(s15, resin) ; \+indep(s15)).

evidence(all_consistent(resin)).
query(true_val(resin, super_sap_epoxy)).
query(true_val(resin, unk_resin)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values directional=Directional unk_shape=Unknown
% @importance 0.875

0.90::acc(s1, shape).
0.90::acc(s9, shape).

0.95::true_val(shape, directional); 0.05::true_val(shape, unk_shape).

measured(s1, shape, directional).
measured(s9, shape, directional).

all_consistent(shape) :-
    (indep(s1), consistent(s1, shape) ; \+indep(s1)),
    (indep(s9), consistent(s9, shape) ; \+indep(s9)).

evidence(all_consistent(shape)).
query(true_val(shape, directional)).
query(true_val(shape, unk_shape)).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values twin_flex=Twin_Flex unk_flex_direction=Unknown
% @importance 0.85

0.88::acc(s1, flex_direction).
0.85::acc(s14, flex_direction).

0.95::true_val(flex_direction, twin_flex); 0.05::true_val(flex_direction, unk_flex_direction).

measured(s1, flex_direction, twin_flex).
measured(s14, flex_direction, twin_flex).

all_consistent(flex_direction) :-
    (indep(s1), consistent(s1, flex_direction) ; \+indep(s1)),
    (indep(s14), consistent(s14, flex_direction) ; \+indep(s14)).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, twin_flex)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values traditional_camber=Traditional_Camber unk_camber_type=Unknown
% @importance 0.825

0.88::acc(s1, camber_type).
0.78::acc(s10, camber_type).

0.95::true_val(camber_type, traditional_camber); 0.05::true_val(camber_type, unk_camber_type).

measured(s1, camber_type, traditional_camber).
measured(s10, camber_type, traditional_camber).

all_consistent(camber_type) :-
    (indep(s1), consistent(s1, camber_type) ; \+indep(s1)),
    (indep(s10), consistent(s10, camber_type) ; \+indep(s10)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, traditional_camber)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_height_mm
% @type numeric
% @unit mm
% @canonical true
% @original_name camber_height_mm
% @values v12=12.0 unk_camber_height_mm=Unknown
% @importance 0.9

0.88::acc(s4, camber_height_mm).

0.85::true_val(camber_height_mm, v12); 0.15::true_val(camber_height_mm, unk_camber_height_mm).

measured(s4, camber_height_mm, v12).

all_consistent(camber_height_mm) :- consistent(s4, camber_height_mm).

evidence(all_consistent(camber_height_mm)).
query(true_val(camber_height_mm, v12)).
query(true_val(camber_height_mm, unk_camber_height_mm)).

% @attr setback
% @type numeric
% @unit mm
% @canonical true
% @original_name setback
% @values vm12_5=-12.5 unk_setback=Unknown
% @importance 0.875

0.92::acc(s_merchant, setback).
0.88::acc(s4, setback).

0.95::true_val(setback, vm12_5); 0.05::true_val(setback, unk_setback).

measured(s_merchant, setback, vm12_5).
measured(s4, setback, vm12_5).

all_consistent(setback) :-
    (indep(s_merchant), consistent(s_merchant, setback) ; \+indep(s_merchant)),
    consistent(s4, setback).

evidence(all_consistent(setback)).
query(true_val(setback, vm12_5)).
query(true_val(setback, unk_setback)).

% @attr taper
% @type categorical
% @canonical true
% @original_name taper
% @values zero=Zero_no_taper unk_taper=Unknown
% @importance 0.7

0.60::acc(s45, taper).

0.72::true_val(taper, zero); 0.28::true_val(taper, unk_taper).

measured(s45, taper, zero).

all_consistent(taper) :- consistent(s45, taper).

evidence(all_consistent(taper)).
query(true_val(taper, zero)).
query(true_val(taper, unk_taper)).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v7_5=7.5 v8=8.0
% @importance 0.87

0.88::acc(s3, flex_rating_10).
0.88::acc(s1, flex_rating_10).
0.90::acc(s_merchant, flex_rating_10).
0.87::acc(s4, flex_rating_10).

0.55::true_val(flex_rating_10, v7_5); 0.45::true_val(flex_rating_10, v8).

measured(s3, flex_rating_10, v7_5).
measured(s1, flex_rating_10, v7_5).
measured(s_merchant, flex_rating_10, v7_5).
measured(s4, flex_rating_10, v8).

all_consistent(flex_rating_10) :-
    (indep(s3), consistent(s3, flex_rating_10) ; \+indep(s3)),
    (indep(s1), consistent(s1, flex_rating_10) ; \+indep(s1)),
    (indep(s_merchant), consistent(s_merchant, flex_rating_10) ; \+indep(s_merchant)),
    consistent(s4, flex_rating_10).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v7_5)).
query(true_val(flex_rating_10, v8)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values stiff=Stiff medium_stiff=Medium_Stiff
% @importance 0.875

0.85::acc(s4, flex_feel).
0.82::acc(s7, flex_feel).

0.50::true_val(flex_feel, stiff); 0.50::true_val(flex_feel, medium_stiff).

measured(s4, flex_feel, stiff).
measured(s7, flex_feel, medium_stiff).

all_consistent(flex_feel) :-
    consistent(s4, flex_feel),
    consistent(s7, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, stiff)).
query(true_val(flex_feel, medium_stiff)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values dragonfly_600g=Dragonfly_600G_strongest_lightest unk_core_material=Unknown
% @importance 0.85

0.88::acc(s1, core_material).
0.88::acc(s15, core_material).

0.95::true_val(core_material, dragonfly_600g); 0.05::true_val(core_material, unk_core_material).

measured(s1, core_material, dragonfly_600g).
measured(s15, core_material, dragonfly_600g).

all_consistent(core_material) :-
    (indep(s1), consistent(s1, core_material) ; \+indep(s1)),
    (indep(s15), consistent(s15, core_material) ; \+indep(s15)).

evidence(all_consistent(core_material)).
query(true_val(core_material, dragonfly_600g)).
query(true_val(core_material, unk_core_material)).

% @attr core_material_multizone
% @type categorical
% @canonical false
% @original_name core_material
% @values multizone_egd=Multizone_EGD_end_grain_woods unk_core_material_multizone=Unknown
% @importance 0.8

0.88::acc(s14, core_material_multizone).
0.85::acc(s9, core_material_multizone).

0.95::true_val(core_material_multizone, multizone_egd); 0.05::true_val(core_material_multizone, unk_core_material_multizone).

measured(s14, core_material_multizone, multizone_egd).
measured(s9, core_material_multizone, multizone_egd).

all_consistent(core_material_multizone) :-
    (indep(s14), consistent(s14, core_material_multizone) ; \+indep(s14)),
    (indep(s9), consistent(s9, core_material_multizone) ; \+indep(s9)).

evidence(all_consistent(core_material_multizone)).
query(true_val(core_material_multizone, multizone_egd)).
query(true_val(core_material_multizone, unk_core_material_multizone)).

% @attr core_material_squeezebox
% @type categorical
% @canonical false
% @original_name core_material
% @values squeezebox=Squeezebox_variable_thickness unk_core_material_squeezebox=Unknown
% @importance 0.85

0.88::acc(s1, core_material_squeezebox).
0.88::acc(s15, core_material_squeezebox).

0.95::true_val(core_material_squeezebox, squeezebox); 0.05::true_val(core_material_squeezebox, unk_core_material_squeezebox).

measured(s1, core_material_squeezebox, squeezebox).
measured(s15, core_material_squeezebox, squeezebox).

all_consistent(core_material_squeezebox) :-
    (indep(s1), consistent(s1, core_material_squeezebox) ; \+indep(s1)),
    (indep(s15), consistent(s15, core_material_squeezebox) ; \+indep(s15)).

evidence(all_consistent(core_material_squeezebox)).
query(true_val(core_material_squeezebox, squeezebox)).
query(true_val(core_material_squeezebox, unk_core_material_squeezebox)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values carbon_45_high_voltage=45_degree_Carbon_Highlights_High_Voltage unk_construction_material_innovation=Unknown
% @importance 0.8

0.88::acc(s14, construction_material_innovation).
0.88::acc(s15, construction_material_innovation).

0.95::true_val(construction_material_innovation, carbon_45_high_voltage); 0.05::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s14, construction_material_innovation, carbon_45_high_voltage).
measured(s15, construction_material_innovation, carbon_45_high_voltage).

all_consistent(construction_material_innovation) :-
    (indep(s14), consistent(s14, construction_material_innovation) ; \+indep(s14)),
    (indep(s15), consistent(s15, construction_material_innovation) ; \+indep(s15)).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, carbon_45_high_voltage)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_wfo=Sintered_WFO_high_density unk_base_material=Unknown
% @importance 0.85

0.88::acc(s15, base_material).
0.85::acc(s9, base_material).

0.95::true_val(base_material, sintered_wfo); 0.05::true_val(base_material, unk_base_material).

measured(s15, base_material, sintered_wfo).
measured(s9, base_material, sintered_wfo).

all_consistent(base_material) :-
    (indep(s15), consistent(s15, base_material) ; \+indep(s15)),
    (indep(s9), consistent(s9, base_material) ; \+indep(s9)).

evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_wfo)).
query(true_val(base_material, unk_base_material)).

% @attr construction_material_innovation_infinite_ride
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values infinite_ride=Infinite_Ride_factory_overbuilt_broken_in unk_cmi_ir=Unknown
% @importance 0.8

0.85::acc(s3, construction_material_innovation_infinite_ride).
0.88::acc(s14, construction_material_innovation_infinite_ride).

0.95::true_val(construction_material_innovation_infinite_ride, infinite_ride); 0.05::true_val(construction_material_innovation_infinite_ride, unk_cmi_ir).

measured(s3, construction_material_innovation_infinite_ride, infinite_ride).
measured(s14, construction_material_innovation_infinite_ride, infinite_ride).

all_consistent(construction_material_innovation_infinite_ride) :-
    (indep(s3), consistent(s3, construction_material_innovation_infinite_ride) ; \+indep(s3)),
    (indep(s14), consistent(s14, construction_material_innovation_infinite_ride) ; \+indep(s14)).

evidence(all_consistent(construction_material_innovation_infinite_ride)).
query(true_val(construction_material_innovation_infinite_ride, infinite_ride)).
query(true_val(construction_material_innovation_infinite_ride, unk_cmi_ir)).

% @attr construction_material_innovation_pro_tip
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values pro_tip=Pro_Tip_tapered_tip_tail unk_cmi_pt=Unknown
% @importance 0.825

0.88::acc(s1, construction_material_innovation_pro_tip).
0.78::acc(s10, construction_material_innovation_pro_tip).

0.95::true_val(construction_material_innovation_pro_tip, pro_tip); 0.05::true_val(construction_material_innovation_pro_tip, unk_cmi_pt).

measured(s1, construction_material_innovation_pro_tip, pro_tip).
measured(s10, construction_material_innovation_pro_tip, pro_tip).

all_consistent(construction_material_innovation_pro_tip) :-
    (indep(s1), consistent(s1, construction_material_innovation_pro_tip) ; \+indep(s1)),
    (indep(s10), consistent(s10, construction_material_innovation_pro_tip) ; \+indep(s10)).

evidence(all_consistent(construction_material_innovation_pro_tip)).
query(true_val(construction_material_innovation_pro_tip, pro_tip)).
query(true_val(construction_material_innovation_pro_tip, unk_cmi_pt)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values frostbite_edges=Frostbite_Edges_enhanced_edge_hold unk_edge_technology=Unknown
% @importance 0.75

0.78::acc(s10, edge_technology).

0.82::true_val(edge_technology, frostbite_edges); 0.18::true_val(edge_technology, unk_edge_technology).

measured(s10, edge_technology, frostbite_edges).

all_consistent(edge_technology) :-
    (indep(s10), consistent(s10, edge_technology) ; \+indep(s10)).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, frostbite_edges)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values the_channel=The_Channel_single_slot unk_mounting_pattern=Unknown
% @importance 0.825

0.88::acc(s1, mounting_pattern).
0.78::acc(s10, mounting_pattern).

0.95::true_val(mounting_pattern, the_channel); 0.05::true_val(mounting_pattern, unk_mounting_pattern).

measured(s1, mounting_pattern, the_channel).
measured(s10, mounting_pattern, the_channel).

all_consistent(mounting_pattern) :-
    (indep(s1), consistent(s1, mounting_pattern) ; \+indep(s1)),
    (indep(s10), consistent(s10, mounting_pattern) ; \+indep(s10)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, the_channel)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values all_major_est_optimized=All_major_brands_optimized_Burton_EST unk_binding_compatibility=Unknown
% @importance 0.75

0.78::acc(s10, binding_compatibility).

0.82::true_val(binding_compatibility, all_major_est_optimized); 0.18::true_val(binding_compatibility, unk_binding_compatibility).

measured(s10, binding_compatibility, all_major_est_optimized).

all_consistent(binding_compatibility) :-
    (indep(s10), consistent(s10, binding_compatibility) ; \+indep(s10)).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, all_major_est_optimized)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values eight_sizes=150_154_156_158_162_158W_162W_166W unk_available_sizes=Unknown
% @importance 0.85

0.92::acc(s_merchant, available_sizes).

0.92::true_val(available_sizes, eight_sizes); 0.08::true_val(available_sizes, unk_available_sizes).

measured(s_merchant, available_sizes, eight_sizes).

all_consistent(available_sizes) :-
    (indep(s_merchant), consistent(s_merchant, available_sizes) ; \+indep(s_merchant)).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, eight_sizes)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr effective_edge_150
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 150cm
% @values v113_5=113.5 unk_effective_edge_150=Unknown
% @importance 0.85

0.92::acc(s_merchant, effective_edge_150).
0.90::true_val(effective_edge_150, v113_5); 0.10::true_val(effective_edge_150, unk_effective_edge_150).
measured(s_merchant, effective_edge_150, v113_5).
all_consistent(effective_edge_150) :- (indep(s_merchant), consistent(s_merchant, effective_edge_150) ; \+indep(s_merchant)).
evidence(all_consistent(effective_edge_150)).
query(true_val(effective_edge_150, v113_5)).
query(true_val(effective_edge_150, unk_effective_edge_150)).

% @attr effective_edge_154
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 154cm
% @values v117_5=117.5 unk_effective_edge_154=Unknown
% @importance 0.85

0.92::acc(s_merchant, effective_edge_154).
0.90::true_val(effective_edge_154, v117_5); 0.10::true_val(effective_edge_154, unk_effective_edge_154).
measured(s_merchant, effective_edge_154, v117_5).
all_consistent(effective_edge_154) :- (indep(s_merchant), consistent(s_merchant, effective_edge_154) ; \+indep(s_merchant)).
evidence(all_consistent(effective_edge_154)).
query(true_val(effective_edge_154, v117_5)).
query(true_val(effective_edge_154, unk_effective_edge_154)).

% @attr effective_edge_156
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 156cm
% @values v119_5=119.5 unk_effective_edge_156=Unknown
% @importance 0.85

0.92::acc(s_merchant, effective_edge_156).
0.90::true_val(effective_edge_156, v119_5); 0.10::true_val(effective_edge_156, unk_effective_edge_156).
measured(s_merchant, effective_edge_156, v119_5).
all_consistent(effective_edge_156) :- (indep(s_merchant), consistent(s_merchant, effective_edge_156) ; \+indep(s_merchant)).
evidence(all_consistent(effective_edge_156)).
query(true_val(effective_edge_156, v119_5)).
query(true_val(effective_edge_156, unk_effective_edge_156)).

% @attr effective_edge_158
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 158cm
% @values v121_5=121.5 unk_effective_edge_158=Unknown
% @importance 0.85

0.92::acc(s_merchant, effective_edge_158).
0.90::true_val(effective_edge_158, v121_5); 0.10::true_val(effective_edge_158, unk_effective_edge_158).
measured(s_merchant, effective_edge_158, v121_5).
all_consistent(effective_edge_158) :- (indep(s_merchant), consistent(s_merchant, effective_edge_158) ; \+indep(s_merchant)).
evidence(all_consistent(effective_edge_158)).
query(true_val(effective_edge_158, v121_5)).
query(true_val(effective_edge_158, unk_effective_edge_158)).

% @attr effective_edge_162
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 162cm
% @values v125_5=125.5 unk_effective_edge_162=Unknown
% @importance 0.85

0.92::acc(s_merchant, effective_edge_162).
0.90::true_val(effective_edge_162, v125_5); 0.10::true_val(effective_edge_162, unk_effective_edge_162).
measured(s_merchant, effective_edge_162, v125_5).
all_consistent(effective_edge_162) :- (indep(s_merchant), consistent(s_merchant, effective_edge_162) ; \+indep(s_merchant)).
evidence(all_consistent(effective_edge_162)).
query(true_val(effective_edge_162, v125_5)).
query(true_val(effective_edge_162, unk_effective_edge_162)).

% @attr effective_edge_158w
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 158W
% @values v121_5=121.5 unk_effective_edge_158w=Unknown
% @importance 0.85

0.92::acc(s_merchant, effective_edge_158w).
0.90::true_val(effective_edge_158w, v121_5); 0.10::true_val(effective_edge_158w, unk_effective_edge_158w).
measured(s_merchant, effective_edge_158w, v121_5).
all_consistent(effective_edge_158w) :- (indep(s_merchant), consistent(s_merchant, effective_edge_158w) ; \+indep(s_merchant)).
evidence(all_consistent(effective_edge_158w)).
query(true_val(effective_edge_158w, v121_5)).
query(true_val(effective_edge_158w, unk_effective_edge_158w)).

% @attr effective_edge_162w
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 162W
% @values v125_5=125.5 unk_effective_edge_162w=Unknown
% @importance 0.85

0.92::acc(s_merchant, effective_edge_162w).
0.90::true_val(effective_edge_162w, v125_5); 0.10::true_val(effective_edge_162w, unk_effective_edge_162w).
measured(s_merchant, effective_edge_162w, v125_5).
all_consistent(effective_edge_162w) :- (indep(s_merchant), consistent(s_merchant, effective_edge_162w) ; \+indep(s_merchant)).
evidence(all_consistent(effective_edge_162w)).
query(true_val(effective_edge_162w, v125_5)).
query(true_val(effective_edge_162w, unk_effective_edge_162w)).

% @attr effective_edge_166w
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 166W
% @values v129_5=129.5 unk_effective_edge_166w=Unknown
% @importance 0.775

0.92::acc(s_merchant, effective_edge_166w).
0.60::acc(s45, effective_edge_166w).

0.92::true_val(effective_edge_166w, v129_5); 0.08::true_val(effective_edge_166w, unk_effective_edge_166w).

measured(s_merchant, effective_edge_166w, v129_5).
measured(s45, effective_edge_166w, v129_5).

all_consistent(effective_edge_166w) :-
    (indep(s_merchant), consistent(s_merchant, effective_edge_166w) ; \+indep(s_merchant)),
    consistent(s45, effective_edge_166w).

evidence(all_consistent(effective_edge_166w)).
query(true_val(effective_edge_166w, v129_5)).
query(true_val(effective_edge_166w, unk_effective_edge_166w)).

% @attr sidecut_radius_size_150
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v7_4=7.4 unk_scr_150=Unknown
% @importance 0.85

0.92::acc(s_merchant, sidecut_radius_size_150).
0.90::true_val(sidecut_radius_size_150, v7_4); 0.10::true_val(sidecut_radius_size_150, unk_scr_150).
measured(s_merchant, sidecut_radius_size_150, v7_4).
all_consistent(sidecut_radius_size_150) :- (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_150) ; \+indep(s_merchant)).
evidence(all_consistent(sidecut_radius_size_150)).
query(true_val(sidecut_radius_size_150, v7_4)).
query(true_val(sidecut_radius_size_150, unk_scr_150)).

% @attr sidecut_radius_size_154
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v7_6=7.6 unk_scr_154=Unknown
% @importance 0.85

0.92::acc(s_merchant, sidecut_radius_size_154).
0.90::true_val(sidecut_radius_size_154, v7_6); 0.10::true_val(sidecut_radius_size_154, unk_scr_154).
measured(s_merchant, sidecut_radius_size_154, v7_6).
all_consistent(sidecut_radius_size_154) :- (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_154) ; \+indep(s_merchant)).
evidence(all_consistent(sidecut_radius_size_154)).
query(true_val(sidecut_radius_size_154, v7_6)).
query(true_val(sidecut_radius_size_154, unk_scr_154)).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size
% @values v7_8=7.8 unk_sidecut_radius_size=Unknown
% @importance 0.85

0.92::acc(s_merchant, sidecut_radius_size).
0.90::true_val(sidecut_radius_size, v7_8); 0.10::true_val(sidecut_radius_size, unk_sidecut_radius_size).
measured(s_merchant, sidecut_radius_size, v7_8).
all_consistent(sidecut_radius_size) :- (indep(s_merchant), consistent(s_merchant, sidecut_radius_size) ; \+indep(s_merchant)).
evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_8)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr sidecut_radius_size_158
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v7_9=7.9 unk_scr_158=Unknown
% @importance 0.85

0.92::acc(s_merchant, sidecut_radius_size_158).
0.90::true_val(sidecut_radius_size_158, v7_9); 0.10::true_val(sidecut_radius_size_158, unk_scr_158).
measured(s_merchant, sidecut_radius_size_158, v7_9).
all_consistent(sidecut_radius_size_158) :- (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_158) ; \+indep(s_merchant)).
evidence(all_consistent(sidecut_radius_size_158)).
query(true_val(sidecut_radius_size_158, v7_9)).
query(true_val(sidecut_radius_size_158, unk_scr_158)).

% @attr sidecut_radius_size_162
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v8_2=8.2 unk_scr_162=Unknown
% @importance 0.85

0.92::acc(s_merchant, sidecut_radius_size_162).
0.90::true_val(sidecut_radius_size_162, v8_2); 0.10::true_val(sidecut_radius_size_162, unk_scr_162).
measured(s_merchant, sidecut_radius_size_162, v8_2).
all_consistent(sidecut_radius_size_162) :- (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_162) ; \+indep(s_merchant)).
evidence(all_consistent(sidecut_radius_size_162)).
query(true_val(sidecut_radius_size_162, v8_2)).
query(true_val(sidecut_radius_size_162, unk_scr_162)).

% @attr sidecut_radius_size_158w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v7_9=7.9 unk_scr_158w=Unknown
% @importance 0.85

0.92::acc(s_merchant, sidecut_radius_size_158w).
0.90::true_val(sidecut_radius_size_158w, v7_9); 0.10::true_val(sidecut_radius_size_158w, unk_scr_158w).
measured(s_merchant, sidecut_radius_size_158w, v7_9).
all_consistent(sidecut_radius_size_158w) :- (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_158w) ; \+indep(s_merchant)).
evidence(all_consistent(sidecut_radius_size_158w)).
query(true_val(sidecut_radius_size_158w, v7_9)).
query(true_val(sidecut_radius_size_158w, unk_scr_158w)).

% @attr sidecut_radius_size_162w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v8_2=8.2 unk_scr_162w=Unknown
% @importance 0.85

0.92::acc(s_merchant, sidecut_radius_size_162w).
0.90::true_val(sidecut_radius_size_162w, v8_2); 0.10::true_val(sidecut_radius_size_162w, unk_scr_162w).
measured(s_merchant, sidecut_radius_size_162w, v8_2).
all_consistent(sidecut_radius_size_162w) :- (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_162w) ; \+indep(s_merchant)).
evidence(all_consistent(sidecut_radius_size_162w)).
query(true_val(sidecut_radius_size_162w, v8_2)).
query(true_val(sidecut_radius_size_162w, unk_scr_162w)).

% @attr sidecut_radius_size_166w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v8_4=8.4 unk_scr_166w=Unknown
% @importance 0.775

0.92::acc(s_merchant, sidecut_radius_size_166w).
0.60::acc(s45, sidecut_radius_size_166w).

0.92::true_val(sidecut_radius_size_166w, v8_4); 0.08::true_val(sidecut_radius_size_166w, unk_scr_166w).

measured(s_merchant, sidecut_radius_size_166w, v8_4).
measured(s45, sidecut_radius_size_166w, v8_4).

all_consistent(sidecut_radius_size_166w) :-
    (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_166w) ; \+indep(s_merchant)),
    consistent(s45, sidecut_radius_size_166w).

evidence(all_consistent(sidecut_radius_size_166w)).
query(true_val(sidecut_radius_size_166w, v8_4)).
query(true_val(sidecut_radius_size_166w, unk_scr_166w)).

% @attr waist_width_150
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 150cm
% @values v24_8=24.8 unk_ww_150=Unknown
% @importance 0.85

0.92::acc(s_merchant, waist_width_150).
0.90::true_val(waist_width_150, v24_8); 0.10::true_val(waist_width_150, unk_ww_150).
measured(s_merchant, waist_width_150, v24_8).
all_consistent(waist_width_150) :- (indep(s_merchant), consistent(s_merchant, waist_width_150) ; \+indep(s_merchant)).
evidence(all_consistent(waist_width_150)).
query(true_val(waist_width_150, v24_8)).
query(true_val(waist_width_150, unk_ww_150)).

% @attr waist_width_154
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 154cm
% @values v25_0=25.0 unk_ww_154=Unknown
% @importance 0.85

0.92::acc(s_merchant, waist_width_154).
0.90::true_val(waist_width_154, v25_0); 0.10::true_val(waist_width_154, unk_ww_154).
measured(s_merchant, waist_width_154, v25_0).
all_consistent(waist_width_154) :- (indep(s_merchant), consistent(s_merchant, waist_width_154) ; \+indep(s_merchant)).
evidence(all_consistent(waist_width_154)).
query(true_val(waist_width_154, v25_0)).
query(true_val(waist_width_154, unk_ww_154)).

% @attr waist_width_156
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 156cm
% @values v25_2=25.2 unk_ww_156=Unknown
% @importance 0.85

0.92::acc(s_merchant, waist_width_156).
0.90::true_val(waist_width_156, v25_2); 0.10::true_val(waist_width_156, unk_ww_156).
measured(s_merchant, waist_width_156, v25_2).
all_consistent(waist_width_156) :- (indep(s_merchant), consistent(s_merchant, waist_width_156) ; \+indep(s_merchant)).
evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v25_2)).
query(true_val(waist_width_156, unk_ww_156)).

% @attr waist_width_158
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 158cm
% @values v25_4=25.4 unk_ww_158=Unknown
% @importance 0.85

0.92::acc(s_merchant, waist_width_158).
0.90::true_val(waist_width_158, v25_4); 0.10::true_val(waist_width_158, unk_ww_158).
measured(s_merchant, waist_width_158, v25_4).
all_consistent(waist_width_158) :- (indep(s_merchant), consistent(s_merchant, waist_width_158) ; \+indep(s_merchant)).
evidence(all_consistent(waist_width_158)).
query(true_val(waist_width_158, v25_4)).
query(true_val(waist_width_158, unk_ww_158)).

% @attr waist_width_162
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 162cm
% @values v25_6=25.6 unk_ww_162=Unknown
% @importance 0.85

0.92::acc(s_merchant, waist_width_162).
0.90::true_val(waist_width_162, v25_6); 0.10::true_val(waist_width_162, unk_ww_162).
measured(s_merchant, waist_width_162, v25_6).
all_consistent(waist_width_162) :- (indep(s_merchant), consistent(s_merchant, waist_width_162) ; \+indep(s_merchant)).
evidence(all_consistent(waist_width_162)).
query(true_val(waist_width_162, v25_6)).
query(true_val(waist_width_162, unk_ww_162)).

% @attr waist_width_158w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 158W
% @values v26_2=26.2 unk_ww_158w=Unknown
% @importance 0.85

0.92::acc(s_merchant, waist_width_158w).
0.90::true_val(waist_width_158w, v26_2); 0.10::true_val(waist_width_158w, unk_ww_158w).
measured(s_merchant, waist_width_158w, v26_2).
all_consistent(waist_width_158w) :- (indep(s_merchant), consistent(s_merchant, waist_width_158w) ; \+indep(s_merchant)).
evidence(all_consistent(waist_width_158w)).
query(true_val(waist_width_158w, v26_2)).
query(true_val(waist_width_158w, unk_ww_158w)).

% @attr waist_width_162w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 162W
% @values v26_4=26.4 unk_ww_162w=Unknown
% @importance 0.85

0.92::acc(s_merchant, waist_width_162w).
0.90::true_val(waist_width_162w, v26_4); 0.10::true_val(waist_width_162w, unk_ww_162w).
measured(s_merchant, waist_width_162w, v26_4).
all_consistent(waist_width_162w) :- (indep(s_merchant), consistent(s_merchant, waist_width_162w) ; \+indep(s_merchant)).
evidence(all_consistent(waist_width_162w)).
query(true_val(waist_width_162w, v26_4)).
query(true_val(waist_width_162w, unk_ww_162w)).

% @attr waist_width_166w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 166W
% @values v26_6=26.6 unk_ww_166w=Unknown
% @importance 0.775

0.92::acc(s_merchant, waist_width_166w).
0.60::acc(s45, waist_width_166w).

0.92::true_val(waist_width_166w, v26_6); 0.08::true_val(waist_width_166w, unk_ww_166w).

measured(s_merchant, waist_width_166w, v26_6).
measured(s45, waist_width_166w, v26_6).

all_consistent(waist_width_166w) :-
    (indep(s_merchant), consistent(s_merchant, waist_width_166w) ; \+indep(s_merchant)),
    consistent(s45, waist_width_166w).

evidence(all_consistent(waist_width_166w)).
query(true_val(waist_width_166w, v26_6)).
query(true_val(waist_width_166w, unk_ww_166w)).

% @attr stance_width_range_size_150
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size
% @values v50_5=50.5 unk_sw_150=Unknown
% @importance 0.85

0.92::acc(s_merchant, stance_width_range_size_150).
0.90::true_val(stance_width_range_size_150, v50_5); 0.10::true_val(stance_width_range_size_150, unk_sw_150).
measured(s_merchant, stance_width_range_size_150, v50_5).
all_consistent(stance_width_range_size_150) :- (indep(s_merchant), consistent(s_merchant, stance_width_range_size_150) ; \+indep(s_merchant)).
evidence(all_consistent(stance_width_range_size_150)).
query(true_val(stance_width_range_size_150, v50_5)).
query(true_val(stance_width_range_size_150, unk_sw_150)).

% @attr stance_width_range_size_154
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size
% @values v53_0=53.0 unk_sw_154=Unknown
% @importance 0.85

0.92::acc(s_merchant, stance_width_range_size_154).
0.90::true_val(stance_width_range_size_154, v53_0); 0.10::true_val(stance_width_range_size_154, unk_sw_154).
measured(s_merchant, stance_width_range_size_154, v53_0).
all_consistent(stance_width_range_size_154) :- (indep(s_merchant), consistent(s_merchant, stance_width_range_size_154) ; \+indep(s_merchant)).
evidence(all_consistent(stance_width_range_size_154)).
query(true_val(stance_width_range_size_154, v53_0)).
query(true_val(stance_width_range_size_154, unk_sw_154)).

% @attr stance_width_range_size
% @type numeric
% @unit cm
% @canonical true
% @original_name stance_width_range_size
% @values v53_0=53.0 unk_stance_width_range_size=Unknown
% @importance 0.85

0.92::acc(s_merchant, stance_width_range_size).
0.90::true_val(stance_width_range_size, v53_0); 0.10::true_val(stance_width_range_size, unk_stance_width_range_size).
measured(s_merchant, stance_width_range_size, v53_0).
all_consistent(stance_width_range_size) :- (indep(s_merchant), consistent(s_merchant, stance_width_range_size) ; \+indep(s_merchant)).
evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v53_0)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr stance_width_range_size_158
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size
% @values v56_0=56.0 unk_sw_158=Unknown
% @importance 0.85

0.92::acc(s_merchant, stance_width_range_size_158).
0.90::true_val(stance_width_range_size_158, v56_0); 0.10::true_val(stance_width_range_size_158, unk_sw_158).
measured(s_merchant, stance_width_range_size_158, v56_0).
all_consistent(stance_width_range_size_158) :- (indep(s_merchant), consistent(s_merchant, stance_width_range_size_158) ; \+indep(s_merchant)).
evidence(all_consistent(stance_width_range_size_158)).
query(true_val(stance_width_range_size_158, v56_0)).
query(true_val(stance_width_range_size_158, unk_sw_158)).

% @attr stance_width_range_size_162
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size
% @values v56_0=56.0 unk_sw_162=Unknown
% @importance 0.85

0.92::acc(s_merchant, stance_width_range_size_162).
0.90::true_val(stance_width_range_size_162, v56_0); 0.10::true_val(stance_width_range_size_162, unk_sw_162).
measured(s_merchant, stance_width_range_size_162, v56_0).
all_consistent(stance_width_range_size_162) :- (indep(s_merchant), consistent(s_merchant, stance_width_range_size_162) ; \+indep(s_merchant)).
evidence(all_consistent(stance_width_range_size_162)).
query(true_val(stance_width_range_size_162, v56_0)).
query(true_val(stance_width_range_size_162, unk_sw_162)).

% @attr stance_width_range_size_158w
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size
% @values v56_0=56.0 unk_sw_158w=Unknown
% @importance 0.85

0.92::acc(s_merchant, stance_width_range_size_158w).
0.90::true_val(stance_width_range_size_158w, v56_0); 0.10::true_val(stance_width_range_size_158w, unk_sw_158w).
measured(s_merchant, stance_width_range_size_158w, v56_0).
all_consistent(stance_width_range_size_158w) :- (indep(s_merchant), consistent(s_merchant, stance_width_range_size_158w) ; \+indep(s_merchant)).
evidence(all_consistent(stance_width_range_size_158w)).
query(true_val(stance_width_range_size_158w, v56_0)).
query(true_val(stance_width_range_size_158w, unk_sw_158w)).

% @attr recommended_weight_range_size_150
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values w54_82kg=54_82kg unk_rwr_150=Unknown
% @importance 0.85

0.92::acc(s_merchant, recommended_weight_range_size_150).
0.90::true_val(recommended_weight_range_size_150, w54_82kg); 0.10::true_val(recommended_weight_range_size_150, unk_rwr_150).
measured(s_merchant, recommended_weight_range_size_150, w54_82kg).
all_consistent(recommended_weight_range_size_150) :- (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size_150) ; \+indep(s_merchant)).
evidence(all_consistent(recommended_weight_range_size_150)).
query(true_val(recommended_weight_range_size_150, w54_82kg)).
query(true_val(recommended_weight_range_size_150, unk_rwr_150)).

% @attr recommended_weight_range_size_154
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values w54_82kg=54_82kg unk_rwr_154=Unknown
% @importance 0.85

0.92::acc(s_merchant, recommended_weight_range_size_154).
0.90::true_val(recommended_weight_range_size_154, w54_82kg); 0.10::true_val(recommended_weight_range_size_154, unk_rwr_154).
measured(s_merchant, recommended_weight_range_size_154, w54_82kg).
all_consistent(recommended_weight_range_size_154) :- (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size_154) ; \+indep(s_merchant)).
evidence(all_consistent(recommended_weight_range_size_154)).
query(true_val(recommended_weight_range_size_154, w54_82kg)).
query(true_val(recommended_weight_range_size_154, unk_rwr_154)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size
% @values w68_91kg=68_91kg unk_recommended_weight_range_size=Unknown
% @importance 0.85

0.92::acc(s_merchant, recommended_weight_range_size).
0.90::true_val(recommended_weight_range_size, w68_91kg); 0.10::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).
measured(s_merchant, recommended_weight_range_size, w68_91kg).
all_consistent(recommended_weight_range_size) :- (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size) ; \+indep(s_merchant)).
evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w68_91kg)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr recommended_weight_range_size_158
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values w68_91kg=68_91kg unk_rwr_158=Unknown
% @importance 0.85

0.92::acc(s_merchant, recommended_weight_range_size_158).
0.90::true_val(recommended_weight_range_size_158, w68_91kg); 0.10::true_val(recommended_weight_range_size_158, unk_rwr_158).
measured(s_merchant, recommended_weight_range_size_158, w68_91kg).
all_consistent(recommended_weight_range_size_158) :- (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size_158) ; \+indep(s_merchant)).
evidence(all_consistent(recommended_weight_range_size_158)).
query(true_val(recommended_weight_range_size_158, w68_91kg)).
query(true_val(recommended_weight_range_size_158, unk_rwr_158)).

% @attr recommended_weight_range_size_162
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values w82_118kg=82_118_plus_kg unk_rwr_162=Unknown
% @importance 0.85

0.92::acc(s_merchant, recommended_weight_range_size_162).
0.90::true_val(recommended_weight_range_size_162, w82_118kg); 0.10::true_val(recommended_weight_range_size_162, unk_rwr_162).
measured(s_merchant, recommended_weight_range_size_162, w82_118kg).
all_consistent(recommended_weight_range_size_162) :- (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size_162) ; \+indep(s_merchant)).
evidence(all_consistent(recommended_weight_range_size_162)).
query(true_val(recommended_weight_range_size_162, w82_118kg)).
query(true_val(recommended_weight_range_size_162, unk_rwr_162)).

% @attr recommended_weight_range_size_158w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values w68_91kg=68_91kg unk_rwr_158w=Unknown
% @importance 0.85

0.92::acc(s_merchant, recommended_weight_range_size_158w).
0.90::true_val(recommended_weight_range_size_158w, w68_91kg); 0.10::true_val(recommended_weight_range_size_158w, unk_rwr_158w).
measured(s_merchant, recommended_weight_range_size_158w, w68_91kg).
all_consistent(recommended_weight_range_size_158w) :- (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size_158w) ; \+indep(s_merchant)).
evidence(all_consistent(recommended_weight_range_size_158w)).
query(true_val(recommended_weight_range_size_158w, w68_91kg)).
query(true_val(recommended_weight_range_size_158w, unk_rwr_158w)).

% @attr recommended_weight_range_size_162w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values w82_118kg=82_118_plus_kg unk_rwr_162w=Unknown
% @importance 0.85

0.92::acc(s_merchant, recommended_weight_range_size_162w).
0.90::true_val(recommended_weight_range_size_162w, w82_118kg); 0.10::true_val(recommended_weight_range_size_162w, unk_rwr_162w).
measured(s_merchant, recommended_weight_range_size_162w, w82_118kg).
all_consistent(recommended_weight_range_size_162w) :- (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size_162w) ; \+indep(s_merchant)).
evidence(all_consistent(recommended_weight_range_size_162w)).
query(true_val(recommended_weight_range_size_162w, w82_118kg)).
query(true_val(recommended_weight_range_size_162w, unk_rwr_162w)).

% @attr recommended_weight_166w
% @type categorical
% @canonical false
% @original_name recommended_weight_165
% @values w82_118kg=82_118_plus_kg unk_rw_166w=Unknown
% @importance 0.85

0.92::acc(s_merchant, recommended_weight_166w).
0.90::true_val(recommended_weight_166w, w82_118kg); 0.10::true_val(recommended_weight_166w, unk_rw_166w).
measured(s_merchant, recommended_weight_166w, w82_118kg).
all_consistent(recommended_weight_166w) :- (indep(s_merchant), consistent(s_merchant, recommended_weight_166w) ; \+indep(s_merchant)).
evidence(all_consistent(recommended_weight_166w)).
query(true_val(recommended_weight_166w, w82_118kg)).
query(true_val(recommended_weight_166w, unk_rw_166w)).

% @attr tip_tail_width_size_150
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size
% @values v28_81=28.81 unk_ttw_150=Unknown
% @importance 0.85

0.92::acc(s_merchant, tip_tail_width_size_150).
0.90::true_val(tip_tail_width_size_150, v28_81); 0.10::true_val(tip_tail_width_size_150, unk_ttw_150).
measured(s_merchant, tip_tail_width_size_150, v28_81).
all_consistent(tip_tail_width_size_150) :- (indep(s_merchant), consistent(s_merchant, tip_tail_width_size_150) ; \+indep(s_merchant)).
evidence(all_consistent(tip_tail_width_size_150)).
query(true_val(tip_tail_width_size_150, v28_81)).
query(true_val(tip_tail_width_size_150, unk_ttw_150)).

% @attr tip_tail_width_size_154
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size
% @values v29_43=29.43 unk_ttw_154=Unknown
% @importance 0.85

0.92::acc(s_merchant, tip_tail_width_size_154).
0.90::true_val(tip_tail_width_size_154, v29_43); 0.10::true_val(tip_tail_width_size_154, unk_ttw_154).
measured(s_merchant, tip_tail_width_size_154, v29_43).
all_consistent(tip_tail_width_size_154) :- (indep(s_merchant), consistent(s_merchant, tip_tail_width_size_154) ; \+indep(s_merchant)).
evidence(all_consistent(tip_tail_width_size_154)).
query(true_val(tip_tail_width_size_154, v29_43)).
query(true_val(tip_tail_width_size_154, unk_ttw_154)).

% @attr tip_tail_width_size
% @type numeric
% @unit cm
% @canonical true
% @original_name tip_tail_width_size
% @values v30_05=30.05 unk_tip_tail_width_size=Unknown
% @importance 0.85

0.92::acc(s_merchant, tip_tail_width_size).
0.90::true_val(tip_tail_width_size, v30_05); 0.10::true_val(tip_tail_width_size, unk_tip_tail_width_size).
measured(s_merchant, tip_tail_width_size, v30_05).
all_consistent(tip_tail_width_size) :- (indep(s_merchant), consistent(s_merchant, tip_tail_width_size) ; \+indep(s_merchant)).
evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v30_05)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr nose_tail_width_166w
% @type numeric
% @unit cm
% @canonical false
% @original_name nose_tail_width_165
% @values v31_2=31.2 unk_ntw_166w=Unknown
% @importance 0.85

0.92::acc(s_merchant, nose_tail_width_166w).
0.90::true_val(nose_tail_width_166w, v31_2); 0.10::true_val(nose_tail_width_166w, unk_ntw_166w).
measured(s_merchant, nose_tail_width_166w, v31_2).
all_consistent(nose_tail_width_166w) :- (indep(s_merchant), consistent(s_merchant, nose_tail_width_166w) ; \+indep(s_merchant)).
evidence(all_consistent(nose_tail_width_166w)).
query(true_val(nose_tail_width_166w, v31_2)).
query(true_val(nose_tail_width_166w, unk_ntw_166w)).

% @attr board_weight_grams
% @type numeric
% @unit g
% @canonical true
% @original_name board_weight_grams
% @values v2720=2720.0 unk_board_weight_grams=Unknown
% @importance 0.9

0.88::acc(s4, board_weight_grams).

0.85::true_val(board_weight_grams, v2720); 0.15::true_val(board_weight_grams, unk_board_weight_grams).

measured(s4, board_weight_grams, v2720).

all_consistent(board_weight_grams) :- consistent(s4, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v2720)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr weight_per_cm
% @type numeric
% @unit g/cm
% @canonical false
% @original_name weight_per_cm
% @values v16_79=16.79 unk_weight_per_cm=Unknown
% @importance 0.9

0.88::acc(s4, weight_per_cm).

0.85::true_val(weight_per_cm, v16_79); 0.15::true_val(weight_per_cm, unk_weight_per_cm).

measured(s4, weight_per_cm, v16_79).

all_consistent(weight_per_cm) :- consistent(s4, weight_per_cm).

evidence(all_consistent(weight_per_cm)).
query(true_val(weight_per_cm, v16_79)).
query(true_val(weight_per_cm, unk_weight_per_cm)).

% @attr board_weight_grams_166w
% @type numeric
% @unit g
% @canonical false
% @original_name board_weight_grams
% @values v3520=3520.0 unk_bwg_166w=Unknown
% @importance 0.7

0.60::acc(s45, board_weight_grams_166w).

0.65::true_val(board_weight_grams_166w, v3520); 0.35::true_val(board_weight_grams_166w, unk_bwg_166w).

measured(s45, board_weight_grams_166w, v3520).

all_consistent(board_weight_grams_166w) :- consistent(s45, board_weight_grams_166w).

evidence(all_consistent(board_weight_grams_166w)).
query(true_val(board_weight_grams_166w, v3520)).
query(true_val(board_weight_grams_166w, unk_bwg_166w)).

% @attr approximate_weight_feel
% @type categorical
% @canonical false
% @original_name Approximate weight feel
% @values very_light=Very_light unk_approximate_weight_feel=Unknown
% @importance 0.875

0.85::acc(s7, approximate_weight_feel).
0.85::acc(s4, approximate_weight_feel).

0.95::true_val(approximate_weight_feel, very_light); 0.05::true_val(approximate_weight_feel, unk_approximate_weight_feel).

measured(s7, approximate_weight_feel, very_light).
measured(s4, approximate_weight_feel, very_light).

all_consistent(approximate_weight_feel) :-
    consistent(s7, approximate_weight_feel),
    consistent(s4, approximate_weight_feel).

evidence(all_consistent(approximate_weight_feel)).
query(true_val(approximate_weight_feel, very_light)).
query(true_val(approximate_weight_feel, unk_approximate_weight_feel)).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v899=899.0 v839=839.0
% @importance 0.88

0.88::acc(s4, price_usd_msrp).
0.80::acc(s7, price_usd_msrp).
0.88::acc(s1, price_usd_msrp).

0.75::true_val(price_usd_msrp, v899); 0.25::true_val(price_usd_msrp, v839).

measured(s4, price_usd_msrp, v899).
measured(s1, price_usd_msrp, v899).
measured(s7, price_usd_msrp, v839).

all_consistent(price_usd_msrp) :-
    consistent(s4, price_usd_msrp),
    consistent(s7, price_usd_msrp),
    (indep(s1), consistent(s1, price_usd_msrp) ; \+indep(s1)).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v899)).
query(true_val(price_usd_msrp, v839)).

% @attr price_aud_merchant_rrp
% @type numeric
% @unit AUD
% @canonical false
% @original_name price_aud_merchant
% @values v1099_99=1099.99 unk_pam_rrp=Unknown
% @importance 0.85

0.95::acc(s_merchant, price_aud_merchant_rrp).

0.93::true_val(price_aud_merchant_rrp, v1099_99); 0.07::true_val(price_aud_merchant_rrp, unk_pam_rrp).

measured(s_merchant, price_aud_merchant_rrp, v1099_99).

all_consistent(price_aud_merchant_rrp) :- consistent(s_merchant, price_aud_merchant_rrp).

evidence(all_consistent(price_aud_merchant_rrp)).
query(true_val(price_aud_merchant_rrp, v1099_99)).
query(true_val(price_aud_merchant_rrp, unk_pam_rrp)).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v769_99=769.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.95::acc(s_merchant, price_aud_merchant).

0.93::true_val(price_aud_merchant, v769_99); 0.07::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s_merchant, price_aud_merchant, v769_99).

all_consistent(price_aud_merchant) :- consistent(s_merchant, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v769_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_usd_backcountry
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_backcountry
% @values v899_95=899.95 unk_price_usd_backcountry=Unknown
% @importance 0.85

0.85::acc(s7, price_usd_backcountry).

0.82::true_val(price_usd_backcountry, v899_95); 0.18::true_val(price_usd_backcountry, unk_price_usd_backcountry).

measured(s7, price_usd_backcountry, v899_95).

all_consistent(price_usd_backcountry) :- consistent(s7, price_usd_backcountry).

evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v899_95)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

% @attr price_usd_evo_full
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_evo
% @values v899_95=899.95 unk_pue_full=Unknown
% @importance 0.85

0.85::acc(s7, price_usd_evo_full).

0.82::true_val(price_usd_evo_full, v899_95); 0.18::true_val(price_usd_evo_full, unk_pue_full).

measured(s7, price_usd_evo_full, v899_95).

all_consistent(price_usd_evo_full) :- consistent(s7, price_usd_evo_full).

evidence(all_consistent(price_usd_evo_full)).
query(true_val(price_usd_evo_full, v899_95)).
query(true_val(price_usd_evo_full, unk_pue_full)).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_evo
% @values v629_97=629.97 unk_price_usd_evo=Unknown
% @importance 0.85

0.85::acc(s7, price_usd_evo).

0.82::true_val(price_usd_evo, v629_97); 0.18::true_val(price_usd_evo, unk_price_usd_evo).

measured(s7, price_usd_evo, v629_97).

all_consistent(price_usd_evo) :- consistent(s7, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v629_97)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_shoreline
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at Shoreline Tahoe (2025 sale)
% @values v679_95=679.95 unk_price_usd_shoreline=Unknown
% @importance 0.6

0.82::acc(s21, price_usd_shoreline).

0.80::true_val(price_usd_shoreline, v679_95); 0.20::true_val(price_usd_shoreline, unk_price_usd_shoreline).

measured(s21, price_usd_shoreline, v679_95).

all_consistent(price_usd_shoreline) :-
    (indep(s21), consistent(s21, price_usd_shoreline) ; \+indep(s21)).

evidence(all_consistent(price_usd_shoreline)).
query(true_val(price_usd_shoreline, v679_95)).
query(true_val(price_usd_shoreline, unk_price_usd_shoreline)).

% @attr price_eur_blue_tomato
% @type numeric
% @unit EUR
% @canonical true
% @original_name price_eur_blue_tomato
% @values v879_95=879.95 unk_price_eur_blue_tomato=Unknown
% @importance 0.9

0.82::acc(s24, price_eur_blue_tomato).

0.80::true_val(price_eur_blue_tomato, v879_95); 0.20::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).

measured(s24, price_eur_blue_tomato, v879_95).

all_consistent(price_eur_blue_tomato) :- consistent(s24, price_eur_blue_tomato).

evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v879_95)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

% @attr price_eur_snow_country
% @type numeric
% @unit EUR
% @canonical false
% @original_name Price at SnowCountry (Europe)
% @values v749_00=749.0 unk_price_eur_snow_country=Unknown
% @importance 0.9

0.82::acc(s24, price_eur_snow_country).

0.80::true_val(price_eur_snow_country, v749_00); 0.20::true_val(price_eur_snow_country, unk_price_eur_snow_country).

measured(s24, price_eur_snow_country, v749_00).

all_consistent(price_eur_snow_country) :- consistent(s24, price_eur_snow_country).

evidence(all_consistent(price_eur_snow_country)).
query(true_val(price_eur_snow_country, v749_00)).
query(true_val(price_eur_snow_country, unk_price_eur_snow_country)).

% @attr price_cad_prfo
% @type numeric
% @unit CAD
% @canonical true
% @original_name price_cad_prfo
% @values v879_99=879.99 unk_price_cad_prfo=Unknown
% @importance 0.9

0.82::acc(s24, price_cad_prfo).

0.80::true_val(price_cad_prfo, v879_99); 0.20::true_val(price_cad_prfo, unk_price_cad_prfo).

measured(s24, price_cad_prfo, v879_99).

all_consistent(price_cad_prfo) :- consistent(s24, price_cad_prfo).

evidence(all_consistent(price_cad_prfo)).
query(true_val(price_cad_prfo, v879_99)).
query(true_val(price_cad_prfo, unk_price_cad_prfo)).

% @attr price_cad_burton_canada
% @type numeric
% @unit CAD
% @canonical false
% @original_name Price at Burton Canada
% @values v1099_99=1099.99 unk_price_cad_burton_ca=Unknown
% @importance 0.9

0.82::acc(s24, price_cad_burton_canada).

0.80::true_val(price_cad_burton_canada, v1099_99); 0.20::true_val(price_cad_burton_canada, unk_price_cad_burton_ca).

measured(s24, price_cad_burton_canada, v1099_99).

all_consistent(price_cad_burton_canada) :- consistent(s24, price_cad_burton_canada).

evidence(all_consistent(price_cad_burton_canada)).
query(true_val(price_cad_burton_canada, v1099_99)).
query(true_val(price_cad_burton_canada, unk_price_cad_burton_ca)).

% @attr price_gbp_blue_tomato_uk
% @type numeric
% @unit GBP
% @canonical true
% @original_name price_gbp_blue_tomato_uk
% @values v785_00=785.0 unk_price_gbp_blue_tomato_uk=Unknown
% @importance 0.85

0.82::acc(s7, price_gbp_blue_tomato_uk).

0.80::true_val(price_gbp_blue_tomato_uk, v785_00); 0.20::true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk).

measured(s7, price_gbp_blue_tomato_uk, v785_00).

all_consistent(price_gbp_blue_tomato_uk) :- consistent(s7, price_gbp_blue_tomato_uk).

evidence(all_consistent(price_gbp_blue_tomato_uk)).
query(true_val(price_gbp_blue_tomato_uk, v785_00)).
query(true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values available_burton=Available_Burton_com unk_availability_status=Unknown
% @importance 1.0

0.90::acc(s6, availability_status).

0.92::true_val(availability_status, available_burton); 0.08::true_val(availability_status, unk_availability_status).

measured(s6, availability_status, available_burton).

all_consistent(availability_status) :- consistent(s6, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, available_burton)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_evo=Available_evo_com unk_as_evo=Unknown
% @importance 0.9

0.88::acc(s1, availability_status_evo).

0.90::true_val(availability_status_evo, available_evo); 0.10::true_val(availability_status_evo, unk_as_evo).

measured(s1, availability_status_evo, available_evo).

all_consistent(availability_status_evo) :-
    (indep(s1), consistent(s1, availability_status_evo) ; \+indep(s1)).

evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, available_evo)).
query(true_val(availability_status_evo, unk_as_evo)).

% @attr availability_status_rei
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_rei=Available_REI unk_as_rei=Unknown
% @importance 0.7

0.88::acc(s2, availability_status_rei).

0.88::true_val(availability_status_rei, available_rei); 0.12::true_val(availability_status_rei, unk_as_rei).

measured(s2, availability_status_rei, available_rei).

all_consistent(availability_status_rei) :-
    (indep(s2), consistent(s2, availability_status_rei) ; \+indep(s2)).

evidence(all_consistent(availability_status_rei)).
query(true_val(availability_status_rei, available_rei)).
query(true_val(availability_status_rei, unk_as_rei)).

% @attr availability_status_backcountry
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_backcountry=Available_Backcountry_com unk_as_bc=Unknown
% @importance 0.85

0.82::acc(s7, availability_status_backcountry).

0.82::true_val(availability_status_backcountry, available_backcountry); 0.18::true_val(availability_status_backcountry, unk_as_bc).

measured(s7, availability_status_backcountry, available_backcountry).

all_consistent(availability_status_backcountry) :- consistent(s7, availability_status_backcountry).

evidence(all_consistent(availability_status_backcountry)).
query(true_val(availability_status_backcountry, available_backcountry)).
query(true_val(availability_status_backcountry, unk_as_bc)).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_blauer=Available_Blauer_Board_Shop unk_as_blauer=Unknown
% @importance 0.8

0.82::acc(s3, availability_status_blauer).

0.82::true_val(availability_status_blauer, available_blauer); 0.18::true_val(availability_status_blauer, unk_as_blauer).

measured(s3, availability_status_blauer, available_blauer).

all_consistent(availability_status_blauer) :-
    (indep(s3), consistent(s3, availability_status_blauer) ; \+indep(s3)).

evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, available_blauer)).
query(true_val(availability_status_blauer, unk_as_blauer)).

% @attr availability_status_source
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_source=Available_The_Source unk_as_source=Unknown
% @importance 0.8

0.78::acc(s9, availability_status_source).

0.80::true_val(availability_status_source, available_source); 0.20::true_val(availability_status_source, unk_as_source).

measured(s9, availability_status_source, available_source).

all_consistent(availability_status_source) :-
    (indep(s9), consistent(s9, availability_status_source) ; \+indep(s9)).

evidence(all_consistent(availability_status_source)).
query(true_val(availability_status_source, available_source)).
query(true_val(availability_status_source, unk_as_source)).

% @attr availability_status_absolute_snow
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_abs=Available_Absolute_Snow unk_as_abs=Unknown
% @importance 0.6

0.75::acc(s20, availability_status_absolute_snow).

0.78::true_val(availability_status_absolute_snow, available_abs); 0.22::true_val(availability_status_absolute_snow, unk_as_abs).

measured(s20, availability_status_absolute_snow, available_abs).

all_consistent(availability_status_absolute_snow) :-
    (indep(s20), consistent(s20, availability_status_absolute_snow) ; \+indep(s20)).

evidence(all_consistent(availability_status_absolute_snow)).
query(true_val(availability_status_absolute_snow, available_abs)).
query(true_val(availability_status_absolute_snow, unk_as_abs)).

% @attr availability_status_blue_tomato
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_bt=Available_BlueTomato unk_as_bt=Unknown
% @importance 0.9

0.82::acc(s24, availability_status_blue_tomato).

0.82::true_val(availability_status_blue_tomato, available_bt); 0.18::true_val(availability_status_blue_tomato, unk_as_bt).

measured(s24, availability_status_blue_tomato, available_bt).

all_consistent(availability_status_blue_tomato) :- consistent(s24, availability_status_blue_tomato).

evidence(all_consistent(availability_status_blue_tomato)).
query(true_val(availability_status_blue_tomato, available_bt)).
query(true_val(availability_status_blue_tomato, unk_as_bt)).

% @attr availability_status_snow_country
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_sc=Available_SnowCountry unk_as_sc=Unknown
% @importance 0.9

0.82::acc(s24, availability_status_snow_country).

0.82::true_val(availability_status_snow_country, available_sc); 0.18::true_val(availability_status_snow_country, unk_as_sc).

measured(s24, availability_status_snow_country, available_sc).

all_consistent(availability_status_snow_country) :- consistent(s24, availability_status_snow_country).

evidence(all_consistent(availability_status_snow_country)).
query(true_val(availability_status_snow_country, available_sc)).
query(true_val(availability_status_snow_country, unk_as_sc)).

% @attr availability_status_prfo
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_prfo=Available_PRFO unk_as_prfo=Unknown
% @importance 0.9

0.82::acc(s24, availability_status_prfo).

0.82::true_val(availability_status_prfo, available_prfo); 0.18::true_val(availability_status_prfo, unk_as_prfo).

measured(s24, availability_status_prfo, available_prfo).

all_consistent(availability_status_prfo) :- consistent(s24, availability_status_prfo).

evidence(all_consistent(availability_status_prfo)).
query(true_val(availability_status_prfo, available_prfo)).
query(true_val(availability_status_prfo, unk_as_prfo)).

% @attr availability_status_shoreline
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_shore=Available_Shoreline_Tahoe unk_as_shore=Unknown
% @importance 0.6

0.78::acc(s21, availability_status_shoreline).

0.80::true_val(availability_status_shoreline, available_shore); 0.20::true_val(availability_status_shoreline, unk_as_shore).

measured(s21, availability_status_shoreline, available_shore).

all_consistent(availability_status_shoreline) :-
    (indep(s21), consistent(s21, availability_status_shoreline) ; \+indep(s21)).

evidence(all_consistent(availability_status_shoreline)).
query(true_val(availability_status_shoreline, available_shore)).
query(true_val(availability_status_shoreline, unk_as_shore)).

% @attr availability_status_outdoor_sports
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_os=Available_OutdoorSports unk_as_os=Unknown
% @importance 0.5

0.72::acc(s8, availability_status_outdoor_sports).

0.75::true_val(availability_status_outdoor_sports, available_os); 0.25::true_val(availability_status_outdoor_sports, unk_as_os).

measured(s8, availability_status_outdoor_sports, available_os).

all_consistent(availability_status_outdoor_sports) :-
    (indep(s8), consistent(s8, availability_status_outdoor_sports) ; \+indep(s8)).

evidence(all_consistent(availability_status_outdoor_sports)).
query(true_val(availability_status_outdoor_sports, available_os)).
query(true_val(availability_status_outdoor_sports, unk_as_os)).

% @attr availability_status_snowbindx
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_sbx=Available_snowbindx unk_as_sbx=Unknown
% @importance 0.75

0.72::acc(s10, availability_status_snowbindx).

0.78::true_val(availability_status_snowbindx, available_sbx); 0.22::true_val(availability_status_snowbindx, unk_as_sbx).

measured(s10, availability_status_snowbindx, available_sbx).

all_consistent(availability_status_snowbindx) :-
    (indep(s10), consistent(s10, availability_status_snowbindx) ; \+indep(s10)).

evidence(all_consistent(availability_status_snowbindx)).
query(true_val(availability_status_snowbindx, available_sbx)).
query(true_val(availability_status_snowbindx, unk_as_sbx)).

% @attr availability_status_ski_monster
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_sm=Available_The_Ski_Monster unk_as_sm=Unknown
% @importance 0.4

0.68::acc(s28, availability_status_ski_monster).

0.72::true_val(availability_status_ski_monster, available_sm); 0.28::true_val(availability_status_ski_monster, unk_as_sm).

measured(s28, availability_status_ski_monster, available_sm).

all_consistent(availability_status_ski_monster) :-
    (indep(s28), consistent(s28, availability_status_ski_monster) ; \+indep(s28)).

evidence(all_consistent(availability_status_ski_monster)).
query(true_val(availability_status_ski_monster, available_sm)).
query(true_val(availability_status_ski_monster, unk_as_sm)).

% @attr availability_status_rei_soldout
% @type categorical
% @canonical false
% @original_name availability_status
% @values sold_out_rei=Sold_out_REI_2025_model unk_as_rei_so=Unknown
% @importance 0.7

0.88::acc(s26, availability_status_rei_soldout).

0.88::true_val(availability_status_rei_soldout, sold_out_rei); 0.12::true_val(availability_status_rei_soldout, unk_as_rei_so).

measured(s26, availability_status_rei_soldout, sold_out_rei).

all_consistent(availability_status_rei_soldout) :-
    (indep(s26), consistent(s26, availability_status_rei_soldout) ; \+indep(s26)).

evidence(all_consistent(availability_status_rei_soldout)).
query(true_val(availability_status_rei_soldout, sold_out_rei)).
query(true_val(availability_status_rei_soldout, unk_as_rei_so)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values expert=Expert unk_rider_level=Unknown
% @importance 0.875

0.92::acc(s_merchant, rider_level).
0.88::acc(s1, rider_level).

0.95::true_val(rider_level, expert); 0.05::true_val(rider_level, unk_rider_level).

measured(s_merchant, rider_level, expert).
measured(s1, rider_level, expert).

all_consistent(rider_level) :-
    (indep(s_merchant), consistent(s_merchant, rider_level) ; \+indep(s_merchant)),
    (indep(s1), consistent(s1, rider_level) ; \+indep(s1)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, expert)).
query(true_val(rider_level, unk_rider_level)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values steep_comp_highspeed=Steep_backcountry_competitions_high_speed unk_terrain_suitability=Unknown
% @importance 0.85

0.90::acc(s_merchant, terrain_suitability).

0.90::true_val(terrain_suitability, steep_comp_highspeed); 0.10::true_val(terrain_suitability, unk_terrain_suitability).

measured(s_merchant, terrain_suitability, steep_comp_highspeed).

all_consistent(terrain_suitability) :-
    (indep(s_merchant), consistent(s_merchant, terrain_suitability) ; \+indep(s_merchant)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, steep_comp_highspeed)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr on_snow_feel_tgr
% @type categorical
% @canonical true
% @original_name on_snow_feel_tgr
% @values locked_in=Locked_in unk_on_snow_feel_tgr=Unknown
% @importance 0.875

0.85::acc(s4, on_snow_feel_tgr).
0.82::acc(s7, on_snow_feel_tgr).

0.95::true_val(on_snow_feel_tgr, locked_in); 0.05::true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr).

measured(s4, on_snow_feel_tgr, locked_in).
measured(s7, on_snow_feel_tgr, locked_in).

all_consistent(on_snow_feel_tgr) :-
    consistent(s4, on_snow_feel_tgr),
    consistent(s7, on_snow_feel_tgr).

evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, locked_in)).
query(true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr)).

% @attr carving_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical true
% @original_name carving_score_snowboardingprofiles
% @values v5=5.0 unk_carving_score_sp=Unknown
% @importance 0.9

0.88::acc(s4, carving_score_snowboardingprofiles).

0.85::true_val(carving_score_snowboardingprofiles, v5); 0.15::true_val(carving_score_snowboardingprofiles, unk_carving_score_sp).

measured(s4, carving_score_snowboardingprofiles, v5).

all_consistent(carving_score_snowboardingprofiles) :- consistent(s4, carving_score_snowboardingprofiles).

evidence(all_consistent(carving_score_snowboardingprofiles)).
query(true_val(carving_score_snowboardingprofiles, v5)).
query(true_val(carving_score_snowboardingprofiles, unk_carving_score_sp)).

% @attr carving_rating_tgr
% @type categorical
% @canonical true
% @original_name carving_rating_tgr
% @values great=Great unk_carving_rating_tgr=Unknown
% @importance 0.85

0.82::acc(s7, carving_rating_tgr).

0.82::true_val(carving_rating_tgr, great); 0.18::true_val(carving_rating_tgr, unk_carving_rating_tgr).

measured(s7, carving_rating_tgr, great).

all_consistent(carving_rating_tgr) :- consistent(s7, carving_rating_tgr).

evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, great)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

% @attr speed_rating_sp
% @type numeric
% @unit /5
% @canonical false
% @original_name Speed rating (SnowboardingProfiles)
% @values v4_5=4.5 unk_speed_rating_sp=Unknown
% @importance 0.9

0.88::acc(s4, speed_rating_sp).

0.85::true_val(speed_rating_sp, v4_5); 0.15::true_val(speed_rating_sp, unk_speed_rating_sp).

measured(s4, speed_rating_sp, v4_5).

all_consistent(speed_rating_sp) :- consistent(s4, speed_rating_sp).

evidence(all_consistent(speed_rating_sp)).
query(true_val(speed_rating_sp, v4_5)).
query(true_val(speed_rating_sp, unk_speed_rating_sp)).

% @attr speed_rating_tgr
% @type categorical
% @canonical true
% @original_name speed_rating_tgr
% @values good=Good unk_speed_rating_tgr=Unknown
% @importance 0.85

0.82::acc(s7, speed_rating_tgr).

0.82::true_val(speed_rating_tgr, good); 0.18::true_val(speed_rating_tgr, unk_speed_rating_tgr).

measured(s7, speed_rating_tgr, good).

all_consistent(speed_rating_tgr) :- consistent(s7, speed_rating_tgr).

evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, good)).
query(true_val(speed_rating_tgr, unk_speed_rating_tgr)).

% @attr jump_pop_rating_sp
% @type numeric
% @unit /5
% @canonical false
% @original_name Jump/Pop rating (SnowboardingProfiles)
% @values v4=4.0 unk_jump_pop_rating_sp=Unknown
% @importance 0.9

0.88::acc(s4, jump_pop_rating_sp).

0.85::true_val(jump_pop_rating_sp, v4); 0.15::true_val(jump_pop_rating_sp, unk_jump_pop_rating_sp).

measured(s4, jump_pop_rating_sp, v4).

all_consistent(jump_pop_rating_sp) :- consistent(s4, jump_pop_rating_sp).

evidence(all_consistent(jump_pop_rating_sp)).
query(true_val(jump_pop_rating_sp, v4)).
query(true_val(jump_pop_rating_sp, unk_jump_pop_rating_sp)).

% @attr jumps_rating_tgr
% @type categorical
% @canonical true
% @original_name jumps_rating_tgr
% @values excellent=Excellent unk_jumps_rating_tgr=Unknown
% @importance 0.85

0.82::acc(s7, jumps_rating_tgr).

0.82::true_val(jumps_rating_tgr, excellent); 0.18::true_val(jumps_rating_tgr, unk_jumps_rating_tgr).

measured(s7, jumps_rating_tgr, excellent).

all_consistent(jumps_rating_tgr) :- consistent(s7, jumps_rating_tgr).

evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, excellent)).
query(true_val(jumps_rating_tgr, unk_jumps_rating_tgr)).

% @attr powder_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical true
% @original_name powder_score_snowboardingprofiles
% @values v2_5=2.5 unk_powder_score_sp=Unknown
% @importance 0.9

0.88::acc(s4, powder_score_snowboardingprofiles).

0.85::true_val(powder_score_snowboardingprofiles, v2_5); 0.15::true_val(powder_score_snowboardingprofiles, unk_powder_score_sp).

measured(s4, powder_score_snowboardingprofiles, v2_5).

all_consistent(powder_score_snowboardingprofiles) :- consistent(s4, powder_score_snowboardingprofiles).

evidence(all_consistent(powder_score_snowboardingprofiles)).
query(true_val(powder_score_snowboardingprofiles, v2_5)).
query(true_val(powder_score_snowboardingprofiles, unk_powder_score_sp)).

% @attr powder_rating_tgr
% @type categorical
% @canonical true
% @original_name powder_rating_tgr
% @values poor=Poor unk_powder_rating_tgr=Unknown
% @importance 0.85

0.82::acc(s7, powder_rating_tgr).

0.82::true_val(powder_rating_tgr, poor); 0.18::true_val(powder_rating_tgr, unk_powder_rating_tgr).

measured(s7, powder_rating_tgr, poor).

all_consistent(powder_rating_tgr) :- consistent(s7, powder_rating_tgr).

evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, poor)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

% @attr crud_uneven_terrain_sp
% @type numeric
% @unit /5
% @canonical false
% @original_name Crud/uneven terrain (SnowboardingProfiles)
% @values v4=4.0 unk_crud_sp=Unknown
% @importance 0.9

0.88::acc(s4, crud_uneven_terrain_sp).

0.85::true_val(crud_uneven_terrain_sp, v4); 0.15::true_val(crud_uneven_terrain_sp, unk_crud_sp).

measured(s4, crud_uneven_terrain_sp, v4).

all_consistent(crud_uneven_terrain_sp) :- consistent(s4, crud_uneven_terrain_sp).

evidence(all_consistent(crud_uneven_terrain_sp)).
query(true_val(crud_uneven_terrain_sp, v4)).
query(true_val(crud_uneven_terrain_sp, unk_crud_sp)).

% @attr chatter_performance
% @type categorical
% @canonical true
% @original_name chatter_performance
% @values average=Average v6_10=6_out_of_10
% @importance 0.875

0.82::acc(s7, chatter_performance).
0.85::acc(s4, chatter_performance).

0.50::true_val(chatter_performance, average); 0.50::true_val(chatter_performance, v6_10).

measured(s7, chatter_performance, average).
measured(s4, chatter_performance, v6_10).

all_consistent(chatter_performance) :-
    consistent(s7, chatter_performance),
    consistent(s4, chatter_performance).

evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, average)).
query(true_val(chatter_performance, v6_10)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values v3_5_of_5=3_5_out_of_5 good_switch=Good
% @importance 0.875

0.85::acc(s4, switch_riding).
0.82::acc(s7, switch_riding).

0.50::true_val(switch_riding, v3_5_of_5); 0.50::true_val(switch_riding, good_switch).

measured(s4, switch_riding, v3_5_of_5).
measured(s7, switch_riding, good_switch).

all_consistent(switch_riding) :-
    consistent(s4, switch_riding),
    consistent(s7, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, v3_5_of_5)).
query(true_val(switch_riding, good_switch)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values great=Great unk_base_glide_performance=Unknown
% @importance 0.85

0.82::acc(s7, base_glide_performance).

0.82::true_val(base_glide_performance, great); 0.18::true_val(base_glide_performance, unk_base_glide_performance).

measured(s7, base_glide_performance, great).

all_consistent(base_glide_performance) :- consistent(s7, base_glide_performance).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, great)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values medium_snow=Medium_lets_go_hard_patches good_hard=Good_on_hard_snow
% @importance 0.875

0.82::acc(s7, edge_hold).
0.85::acc(s4, edge_hold).

0.45::true_val(edge_hold, medium_snow); 0.55::true_val(edge_hold, good_hard).

measured(s7, edge_hold, medium_snow).
measured(s4, edge_hold, good_hard).

all_consistent(edge_hold) :-
    consistent(s7, edge_hold),
    consistent(s4, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, medium_snow)).
query(true_val(edge_hold, good_hard)).

% @attr jibbing_rating_tgr
% @type categorical
% @canonical true
% @original_name jibbing_rating_tgr
% @values not_recommended=Not_recommended unk_jibbing_rating_tgr=Unknown
% @importance 0.875

0.85::acc(s4, jibbing_rating_tgr).
0.82::acc(s7, jibbing_rating_tgr).

0.95::true_val(jibbing_rating_tgr, not_recommended); 0.05::true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr).

measured(s4, jibbing_rating_tgr, not_recommended).
measured(s7, jibbing_rating_tgr, not_recommended).

all_consistent(jibbing_rating_tgr) :-
    consistent(s4, jibbing_rating_tgr),
    consistent(s7, jibbing_rating_tgr).

evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, not_recommended)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr)).

% @attr buttering_difficulty
% @type categorical
% @canonical false
% @original_name Buttering difficulty
% @values semi_hard=Semi_Hard unk_buttering_difficulty=Unknown
% @importance 0.9

0.85::acc(s4, buttering_difficulty).

0.85::true_val(buttering_difficulty, semi_hard); 0.15::true_val(buttering_difficulty, unk_buttering_difficulty).

measured(s4, buttering_difficulty, semi_hard).

all_consistent(buttering_difficulty) :- consistent(s4, buttering_difficulty).

evidence(all_consistent(buttering_difficulty)).
query(true_val(buttering_difficulty, semi_hard)).
query(true_val(buttering_difficulty, unk_buttering_difficulty)).

% @attr pipe_rating_tgr
% @type categorical
% @canonical true
% @original_name pipe_rating_tgr
% @values great=Great unk_pipe_rating_tgr=Unknown
% @importance 0.85

0.82::acc(s7, pipe_rating_tgr).

0.82::true_val(pipe_rating_tgr, great); 0.18::true_val(pipe_rating_tgr, unk_pipe_rating_tgr).

measured(s7, pipe_rating_tgr, great).

all_consistent(pipe_rating_tgr) :- consistent(s7, pipe_rating_tgr).

evidence(all_consistent(pipe_rating_tgr)).
query(true_val(pipe_rating_tgr, great)).
query(true_val(pipe_rating_tgr, unk_pipe_rating_tgr)).

% @attr catchiness
% @type categorical
% @canonical false
% @original_name Catchiness
% @values most_catchy_slow=Most_catchy_at_slow_speeds_manageable unk_catchiness=Unknown
% @importance 0.85

0.85::acc(s11, catchiness).

0.85::true_val(catchiness, most_catchy_slow); 0.15::true_val(catchiness, unk_catchiness).

measured(s11, catchiness, most_catchy_slow).

all_consistent(catchiness) :- consistent(s11, catchiness).

evidence(all_consistent(catchiness)).
query(true_val(catchiness, most_catchy_slow)).
query(true_val(catchiness, unk_catchiness)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values not_forte=Not_a_forte_less_nimble unk_turn_initiation_performance=Unknown
% @importance 0.85

0.85::acc(s11, turn_initiation_performance).

0.85::true_val(turn_initiation_performance, not_forte); 0.15::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s11, turn_initiation_performance, not_forte).

all_consistent(turn_initiation_performance) :- consistent(s11, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, not_forte)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr playful_aggressive_scale
% @type numeric
% @unit /10
% @canonical false
% @original_name Playful/Aggressive scale
% @values v8=8.0 unk_playful_aggressive=Unknown
% @importance 0.9

0.85::acc(s4, playful_aggressive_scale).

0.85::true_val(playful_aggressive_scale, v8); 0.15::true_val(playful_aggressive_scale, unk_playful_aggressive).

measured(s4, playful_aggressive_scale, v8).

all_consistent(playful_aggressive_scale) :- consistent(s4, playful_aggressive_scale).

evidence(all_consistent(playful_aggressive_scale)).
query(true_val(playful_aggressive_scale, v8)).
query(true_val(playful_aggressive_scale, unk_playful_aggressive)).

% @attr overall_rating_snowboardingprofiles
% @type numeric
% @unit /100
% @canonical true
% @original_name overall_rating_snowboardingprofiles
% @values v91_5=91.5 unk_overall_rating_sp=Unknown
% @importance 0.9

0.88::acc(s4, overall_rating_snowboardingprofiles).

0.85::true_val(overall_rating_snowboardingprofiles, v91_5); 0.15::true_val(overall_rating_snowboardingprofiles, unk_overall_rating_sp).

measured(s4, overall_rating_snowboardingprofiles, v91_5).

all_consistent(overall_rating_snowboardingprofiles) :- consistent(s4, overall_rating_snowboardingprofiles).

evidence(all_consistent(overall_rating_snowboardingprofiles)).
query(true_val(overall_rating_snowboardingprofiles, v91_5)).
query(true_val(overall_rating_snowboardingprofiles, unk_overall_rating_sp)).

% @attr overall_rating_sp_general
% @type numeric
% @unit /100
% @canonical false
% @original_name overall_rating_snowboardingprofiles
% @values v85_5=85.5 unk_overall_rating_sp_gen=Unknown
% @importance 0.9

0.85::acc(s4, overall_rating_sp_general).

0.82::true_val(overall_rating_sp_general, v85_5); 0.18::true_val(overall_rating_sp_general, unk_overall_rating_sp_gen).

measured(s4, overall_rating_sp_general, v85_5).

all_consistent(overall_rating_sp_general) :- consistent(s4, overall_rating_sp_general).

evidence(all_consistent(overall_rating_sp_general)).
query(true_val(overall_rating_sp_general, v85_5)).
query(true_val(overall_rating_sp_general, unk_overall_rating_sp_gen)).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name reviewer_opinion_snowboardingprofiles
% @values num1_aggressive_am=Number_1_pick_aggressive_all_mountain_2025_2026 unk_ro_sp=Unknown
% @importance 0.9

0.88::acc(s66, reviewer_opinion_snowboardingprofiles).

0.88::true_val(reviewer_opinion_snowboardingprofiles, num1_aggressive_am); 0.12::true_val(reviewer_opinion_snowboardingprofiles, unk_ro_sp).

measured(s66, reviewer_opinion_snowboardingprofiles, num1_aggressive_am).

all_consistent(reviewer_opinion_snowboardingprofiles) :- consistent(s66, reviewer_opinion_snowboardingprofiles).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, num1_aggressive_am)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_ro_sp)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values special_pop_chatter_downside=Special_ride_pop_but_chatter_technical unk_ro_tgr=Unknown
% @importance 0.85

0.82::acc(s7, reviewer_opinion_the_good_ride).

0.82::true_val(reviewer_opinion_the_good_ride, special_pop_chatter_downside); 0.18::true_val(reviewer_opinion_the_good_ride, unk_ro_tgr).

measured(s7, reviewer_opinion_the_good_ride, special_pop_chatter_downside).

all_consistent(reviewer_opinion_the_good_ride) :- consistent(s7, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, special_pop_chatter_downside)).
query(true_val(reviewer_opinion_the_good_ride, unk_ro_tgr)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values exceptional_pop=Exceptional_pop_off_jumps_and_turns unk_positive_aspect=Unknown
% @importance 0.875

0.82::acc(s7, positive_aspect).
0.85::acc(s4, positive_aspect).

0.95::true_val(positive_aspect, exceptional_pop); 0.05::true_val(positive_aspect, unk_positive_aspect).

measured(s7, positive_aspect, exceptional_pop).
measured(s4, positive_aspect, exceptional_pop).

all_consistent(positive_aspect) :-
    consistent(s7, positive_aspect),
    consistent(s4, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, exceptional_pop)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr positive_aspect_weight
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values very_light_weight=Very_light_weight_for_class unk_pa_weight=Unknown
% @importance 0.875

0.85::acc(s4, positive_aspect_weight).
0.82::acc(s7, positive_aspect_weight).

0.95::true_val(positive_aspect_weight, very_light_weight); 0.05::true_val(positive_aspect_weight, unk_pa_weight).

measured(s4, positive_aspect_weight, very_light_weight).
measured(s7, positive_aspect_weight, very_light_weight).

all_consistent(positive_aspect_weight) :-
    consistent(s4, positive_aspect_weight),
    consistent(s7, positive_aspect_weight).

evidence(all_consistent(positive_aspect_weight)).
query(true_val(positive_aspect_weight, very_light_weight)).
query(true_val(positive_aspect_weight, unk_pa_weight)).

% @attr positive_aspect_carving
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values excellent_carving=Excellent_carving_one_of_best unk_pa_carving=Unknown
% @importance 0.9

0.88::acc(s4, positive_aspect_carving).

0.85::true_val(positive_aspect_carving, excellent_carving); 0.15::true_val(positive_aspect_carving, unk_pa_carving).

measured(s4, positive_aspect_carving, excellent_carving).

all_consistent(positive_aspect_carving) :- consistent(s4, positive_aspect_carving).

evidence(all_consistent(positive_aspect_carving)).
query(true_val(positive_aspect_carving, excellent_carving)).
query(true_val(positive_aspect_carving, unk_pa_carving)).

% @attr positive_aspect_glide
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values upper_tier_glide=Upper_tier_base_glide_speed unk_pa_glide=Unknown
% @importance 0.85

0.82::acc(s7, positive_aspect_glide).

0.82::true_val(positive_aspect_glide, upper_tier_glide); 0.18::true_val(positive_aspect_glide, unk_pa_glide).

measured(s7, positive_aspect_glide, upper_tier_glide).

all_consistent(positive_aspect_glide) :- consistent(s7, positive_aspect_glide).

evidence(all_consistent(positive_aspect_glide)).
query(true_val(positive_aspect_glide, upper_tier_glide)).
query(true_val(positive_aspect_glide, unk_pa_glide)).

% @attr positive_aspect_stability
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values good_highspeed_stability=Good_high_speed_stability unk_pa_stability=Unknown
% @importance 0.85

0.85::acc(s11, positive_aspect_stability).

0.85::true_val(positive_aspect_stability, good_highspeed_stability); 0.15::true_val(positive_aspect_stability, unk_pa_stability).

measured(s11, positive_aspect_stability, good_highspeed_stability).

all_consistent(positive_aspect_stability) :- consistent(s11, positive_aspect_stability).

evidence(all_consistent(positive_aspect_stability)).
query(true_val(positive_aspect_stability, good_highspeed_stability)).
query(true_val(positive_aspect_stability, unk_pa_stability)).

% @attr positive_aspect_forgiving
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values more_forgiving_than_older=More_forgiving_than_older_Custom_X unk_pa_forgiving=Unknown
% @importance 0.9

0.85::acc(s4, positive_aspect_forgiving).

0.85::true_val(positive_aspect_forgiving, more_forgiving_than_older); 0.15::true_val(positive_aspect_forgiving, unk_pa_forgiving).

measured(s4, positive_aspect_forgiving, more_forgiving_than_older).

all_consistent(positive_aspect_forgiving) :- consistent(s4, positive_aspect_forgiving).

evidence(all_consistent(positive_aspect_forgiving)).
query(true_val(positive_aspect_forgiving, more_forgiving_than_older)).
query(true_val(positive_aspect_forgiving, unk_pa_forgiving)).

% @attr positive_aspect_infinite_ride
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values consistent_flex_day1=Infinite_Ride_consistent_flex_from_day_one unk_pa_ir=Unknown
% @importance 0.8

0.82::acc(s3, positive_aspect_infinite_ride).

0.80::true_val(positive_aspect_infinite_ride, consistent_flex_day1); 0.20::true_val(positive_aspect_infinite_ride, unk_pa_ir).

measured(s3, positive_aspect_infinite_ride, consistent_flex_day1).

all_consistent(positive_aspect_infinite_ride) :-
    (indep(s3), consistent(s3, positive_aspect_infinite_ride) ; \+indep(s3)).

evidence(all_consistent(positive_aspect_infinite_ride)).
query(true_val(positive_aspect_infinite_ride, consistent_flex_day1)).
query(true_val(positive_aspect_infinite_ride, unk_pa_ir)).

% @attr positive_aspect_switch
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values doable_switch=Doable_switch_riding_despite_directional unk_pa_switch=Unknown
% @importance 0.85

0.82::acc(s7, positive_aspect_switch).

0.82::true_val(positive_aspect_switch, doable_switch); 0.18::true_val(positive_aspect_switch, unk_pa_switch).

measured(s7, positive_aspect_switch, doable_switch).

all_consistent(positive_aspect_switch) :- consistent(s7, positive_aspect_switch).

evidence(all_consistent(positive_aspect_switch)).
query(true_val(positive_aspect_switch, doable_switch)).
query(true_val(positive_aspect_switch, unk_pa_switch)).

% @attr negative_aspect_soft_snow
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values bucks_uneven_soft=Bucks_in_uneven_soft_snow unk_na_soft=Unknown
% @importance 0.85

0.82::acc(s7, negative_aspect_soft_snow).

0.82::true_val(negative_aspect_soft_snow, bucks_uneven_soft); 0.18::true_val(negative_aspect_soft_snow, unk_na_soft).

measured(s7, negative_aspect_soft_snow, bucks_uneven_soft).

all_consistent(negative_aspect_soft_snow) :- consistent(s7, negative_aspect_soft_snow).

evidence(all_consistent(negative_aspect_soft_snow)).
query(true_val(negative_aspect_soft_snow, bucks_uneven_soft)).
query(true_val(negative_aspect_soft_snow, unk_na_soft)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values chatters_hard_uneven=Chatters_in_hard_uneven_snow unk_negative_aspect=Unknown
% @importance 0.85

0.82::acc(s7, negative_aspect).

0.82::true_val(negative_aspect, chatters_hard_uneven); 0.18::true_val(negative_aspect, unk_negative_aspect).

measured(s7, negative_aspect, chatters_hard_uneven).

all_consistent(negative_aspect) :- consistent(s7, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, chatters_hard_uneven)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_powder
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values poor_powder_float=Poor_powder_float_back_leg_burner unk_na_powder=Unknown
% @importance 0.875

0.85::acc(s4, negative_aspect_powder).
0.82::acc(s7, negative_aspect_powder).

0.95::true_val(negative_aspect_powder, poor_powder_float); 0.05::true_val(negative_aspect_powder, unk_na_powder).

measured(s4, negative_aspect_powder, poor_powder_float).
measured(s7, negative_aspect_powder, poor_powder_float).

all_consistent(negative_aspect_powder) :-
    consistent(s4, negative_aspect_powder),
    consistent(s7, negative_aspect_powder).

evidence(all_consistent(negative_aspect_powder)).
query(true_val(negative_aspect_powder, poor_powder_float)).
query(true_val(negative_aspect_powder, unk_na_powder)).

% @attr negative_aspect_edge
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values edge_hold_lets_go=Edge_hold_lets_go_very_hard_icy unk_na_edge=Unknown
% @importance 0.85

0.82::acc(s7, negative_aspect_edge).

0.82::true_val(negative_aspect_edge, edge_hold_lets_go); 0.18::true_val(negative_aspect_edge, unk_na_edge).

measured(s7, negative_aspect_edge, edge_hold_lets_go).

all_consistent(negative_aspect_edge) :- consistent(s7, negative_aspect_edge).

evidence(all_consistent(negative_aspect_edge)).
query(true_val(negative_aspect_edge, edge_hold_lets_go)).
query(true_val(negative_aspect_edge, unk_na_edge)).

% @attr negative_aspect_catchy
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values technical_catchy=Technical_and_catchy_especially_slow_speeds unk_na_catchy=Unknown
% @importance 0.85

0.82::acc(s7, negative_aspect_catchy).
0.85::acc(s11, negative_aspect_catchy).

0.95::true_val(negative_aspect_catchy, technical_catchy); 0.05::true_val(negative_aspect_catchy, unk_na_catchy).

measured(s7, negative_aspect_catchy, technical_catchy).
measured(s11, negative_aspect_catchy, technical_catchy).

all_consistent(negative_aspect_catchy) :-
    consistent(s7, negative_aspect_catchy),
    consistent(s11, negative_aspect_catchy).

evidence(all_consistent(negative_aspect_catchy)).
query(true_val(negative_aspect_catchy, technical_catchy)).
query(true_val(negative_aspect_catchy, unk_na_catchy)).

% @attr negative_aspect_jibbing
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values not_suitable_jibbing=Not_suitable_for_jibbing unk_na_jibbing=Unknown
% @importance 0.85

0.82::acc(s7, negative_aspect_jibbing).

0.82::true_val(negative_aspect_jibbing, not_suitable_jibbing); 0.18::true_val(negative_aspect_jibbing, unk_na_jibbing).

measured(s7, negative_aspect_jibbing, not_suitable_jibbing).

all_consistent(negative_aspect_jibbing) :- consistent(s7, negative_aspect_jibbing).

evidence(all_consistent(negative_aspect_jibbing)).
query(true_val(negative_aspect_jibbing, not_suitable_jibbing)).
query(true_val(negative_aspect_jibbing, unk_na_jibbing)).

% @attr negative_aspect_pop
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values not_easy_pop=Not_easy_to_access_pop_requires_effort unk_na_pop=Unknown
% @importance 0.9

0.85::acc(s4, negative_aspect_pop).

0.85::true_val(negative_aspect_pop, not_easy_pop); 0.15::true_val(negative_aspect_pop, unk_na_pop).

measured(s4, negative_aspect_pop, not_easy_pop).

all_consistent(negative_aspect_pop) :- consistent(s4, negative_aspect_pop).

evidence(all_consistent(negative_aspect_pop)).
query(true_val(negative_aspect_pop, not_easy_pop)).
query(true_val(negative_aspect_pop, unk_na_pop)).

% @attr negative_aspect_corrosion
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values edge_corrosion_1yr=Edge_corrosion_after_one_year_not_stainless unk_na_corrosion=Unknown
% @importance 0.7

0.55::acc(s12, negative_aspect_corrosion).

0.55::true_val(negative_aspect_corrosion, edge_corrosion_1yr); 0.45::true_val(negative_aspect_corrosion, unk_na_corrosion).

measured(s12, negative_aspect_corrosion, edge_corrosion_1yr).

all_consistent(negative_aspect_corrosion) :- consistent(s12, negative_aspect_corrosion).

evidence(all_consistent(negative_aspect_corrosion)).
query(true_val(negative_aspect_corrosion, edge_corrosion_1yr)).
query(true_val(negative_aspect_corrosion, unk_na_corrosion)).

% @attr negative_aspect_durability
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values break_apart_3_4_seasons=Break_apart_after_3_4_seasons_heavy_use unk_na_durability=Unknown
% @importance 0.75

0.55::acc(s44, negative_aspect_durability).

0.55::true_val(negative_aspect_durability, break_apart_3_4_seasons); 0.45::true_val(negative_aspect_durability, unk_na_durability).

measured(s44, negative_aspect_durability, break_apart_3_4_seasons).

all_consistent(negative_aspect_durability) :- consistent(s44, negative_aspect_durability).

evidence(all_consistent(negative_aspect_durability)).
query(true_val(negative_aspect_durability, break_apart_3_4_seasons)).
query(true_val(negative_aspect_durability, unk_na_durability)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values adv_expert_aggressive=Advanced_expert_aggressive_carving_stiff_camber unk_skill_level_recommendation=Unknown
% @importance 0.85

0.85::acc(s11, skill_level_recommendation).
0.85::acc(s4, skill_level_recommendation).

0.95::true_val(skill_level_recommendation, adv_expert_aggressive); 0.05::true_val(skill_level_recommendation, unk_skill_level_recommendation).

measured(s11, skill_level_recommendation, adv_expert_aggressive).
measured(s4, skill_level_recommendation, adv_expert_aggressive).

all_consistent(skill_level_recommendation) :-
    consistent(s11, skill_level_recommendation),
    consistent(s4, skill_level_recommendation).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, adv_expert_aggressive)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

% @attr skill_level_recommendation_not_beginner
% @type categorical
% @canonical false
% @original_name skill_level_recommendation
% @values not_for_beginners=Beginners_intermediates_will_find_hard_work unk_slr_nb=Unknown
% @importance 0.9

0.85::acc(s4, skill_level_recommendation_not_beginner).

0.85::true_val(skill_level_recommendation_not_beginner, not_for_beginners); 0.15::true_val(skill_level_recommendation_not_beginner, unk_slr_nb).

measured(s4, skill_level_recommendation_not_beginner, not_for_beginners).

all_consistent(skill_level_recommendation_not_beginner) :- consistent(s4, skill_level_recommendation_not_beginner).

evidence(all_consistent(skill_level_recommendation_not_beginner)).
query(true_val(skill_level_recommendation_not_beginner, not_for_beginners)).
query(true_val(skill_level_recommendation_not_beginner, unk_slr_nb)).

% @attr skill_level_recommendation_terrain
% @type categorical
% @canonical false
% @original_name skill_level_recommendation
% @values aggressive_no_deep_powder=Aggressive_rider_no_deep_powder unk_slr_terrain=Unknown
% @importance 0.9

0.85::acc(s4, skill_level_recommendation_terrain).

0.85::true_val(skill_level_recommendation_terrain, aggressive_no_deep_powder); 0.15::true_val(skill_level_recommendation_terrain, unk_slr_terrain).

measured(s4, skill_level_recommendation_terrain, aggressive_no_deep_powder).

all_consistent(skill_level_recommendation_terrain) :- consistent(s4, skill_level_recommendation_terrain).

evidence(all_consistent(skill_level_recommendation_terrain)).
query(true_val(skill_level_recommendation_terrain, aggressive_no_deep_powder)).
query(true_val(skill_level_recommendation_terrain, unk_slr_terrain)).

% @attr terrain_suitability_competition
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values olympics_weapon=Weapon_of_choice_competitions_Olympics unk_ts_comp=Unknown
% @importance 0.75

0.72::acc(s10, terrain_suitability_competition).

0.75::true_val(terrain_suitability_competition, olympics_weapon); 0.25::true_val(terrain_suitability_competition, unk_ts_comp).

measured(s10, terrain_suitability_competition, olympics_weapon).

all_consistent(terrain_suitability_competition) :-
    (indep(s10), consistent(s10, terrain_suitability_competition) ; \+indep(s10)).

evidence(all_consistent(terrain_suitability_competition)).
query(true_val(terrain_suitability_competition, olympics_weapon)).
query(true_val(terrain_suitability_competition, unk_ts_comp)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values capita_mega_mercury=Capita_Mega_Mercury_hybrid_camber_better_powder unk_comparable_board_cross_brand=Unknown
% @importance 0.7

0.60::acc(s67, comparable_board_cross_brand).

0.62::true_val(comparable_board_cross_brand, capita_mega_mercury); 0.38::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s67, comparable_board_cross_brand, capita_mega_mercury).

all_consistent(comparable_board_cross_brand) :- consistent(s67, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, capita_mega_mercury)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_mercury
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values capita_mercury=Capita_Mercury_87_3_of_100 unk_cbcb_mercury=Unknown
% @importance 0.7

0.80::acc(s65, comparable_board_cross_brand_mercury).

0.78::true_val(comparable_board_cross_brand_mercury, capita_mercury); 0.22::true_val(comparable_board_cross_brand_mercury, unk_cbcb_mercury).

measured(s65, comparable_board_cross_brand_mercury, capita_mercury).

all_consistent(comparable_board_cross_brand_mercury) :- consistent(s65, comparable_board_cross_brand_mercury).

evidence(all_consistent(comparable_board_cross_brand_mercury)).
query(true_val(comparable_board_cross_brand_mercury, capita_mercury)).
query(true_val(comparable_board_cross_brand_mercury, unk_cbcb_mercury)).

% @attr comparable_board_cross_brand_jones_mt
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values jones_mountain_twin=Jones_Mountain_Twin_more_versatile_forgiving unk_cbcb_jmt=Unknown
% @importance 0.7

0.80::acc(s65, comparable_board_cross_brand_jones_mt).

0.78::true_val(comparable_board_cross_brand_jones_mt, jones_mountain_twin); 0.22::true_val(comparable_board_cross_brand_jones_mt, unk_cbcb_jmt).

measured(s65, comparable_board_cross_brand_jones_mt, jones_mountain_twin).

all_consistent(comparable_board_cross_brand_jones_mt) :- consistent(s65, comparable_board_cross_brand_jones_mt).

evidence(all_consistent(comparable_board_cross_brand_jones_mt)).
query(true_val(comparable_board_cross_brand_jones_mt, jones_mountain_twin)).
query(true_val(comparable_board_cross_brand_jones_mt, unk_cbcb_jmt)).

% @attr comparable_board_cross_brand_yes
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values yes_optimistic=YES_Optimistic_aggressive_full_camber unk_cbcb_yes=Unknown
% @importance 0.65

0.65::acc(s52, comparable_board_cross_brand_yes).

0.62::true_val(comparable_board_cross_brand_yes, yes_optimistic); 0.38::true_val(comparable_board_cross_brand_yes, unk_cbcb_yes).

measured(s52, comparable_board_cross_brand_yes, yes_optimistic).

all_consistent(comparable_board_cross_brand_yes) :- consistent(s52, comparable_board_cross_brand_yes).

evidence(all_consistent(comparable_board_cross_brand_yes)).
query(true_val(comparable_board_cross_brand_yes, yes_optimistic)).
query(true_val(comparable_board_cross_brand_yes, unk_cbcb_yes)).

% @attr comparable_board_cross_brand_aviator
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values jones_aviator=Jones_Aviator_2_0_aggressive_damp_snappy unk_cbcb_aviator=Unknown
% @importance 0.9

0.85::acc(s66, comparable_board_cross_brand_aviator).

0.82::true_val(comparable_board_cross_brand_aviator, jones_aviator); 0.18::true_val(comparable_board_cross_brand_aviator, unk_cbcb_aviator).

measured(s66, comparable_board_cross_brand_aviator, jones_aviator).

all_consistent(comparable_board_cross_brand_aviator) :- consistent(s66, comparable_board_cross_brand_aviator).

evidence(all_consistent(comparable_board_cross_brand_aviator)).
query(true_val(comparable_board_cross_brand_aviator, jones_aviator)).
query(true_val(comparable_board_cross_brand_aviator, unk_cbcb_aviator)).

% @attr comparable_board_cross_brand_rome
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values rome_renegade=Rome_Rene_Gade_stiff_damp_aggressive unk_cbcb_rome=Unknown
% @importance 0.9

0.85::acc(s66, comparable_board_cross_brand_rome).

0.82::true_val(comparable_board_cross_brand_rome, rome_renegade); 0.18::true_val(comparable_board_cross_brand_rome, unk_cbcb_rome).

measured(s66, comparable_board_cross_brand_rome, rome_renegade).

all_consistent(comparable_board_cross_brand_rome) :- consistent(s66, comparable_board_cross_brand_rome).

evidence(all_consistent(comparable_board_cross_brand_rome)).
query(true_val(comparable_board_cross_brand_rome, rome_renegade)).
query(true_val(comparable_board_cross_brand_rome, unk_cbcb_rome)).

% @attr comparable_board_cross_brand_arbor
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values arbor_a_frame=Arbor_A_Frame_aggressive_full_camber unk_cbcb_arbor=Unknown
% @importance 0.65

0.65::acc(s52, comparable_board_cross_brand_arbor).

0.62::true_val(comparable_board_cross_brand_arbor, arbor_a_frame); 0.38::true_val(comparable_board_cross_brand_arbor, unk_cbcb_arbor).

measured(s52, comparable_board_cross_brand_arbor, arbor_a_frame).

all_consistent(comparable_board_cross_brand_arbor) :- consistent(s52, comparable_board_cross_brand_arbor).

evidence(all_consistent(comparable_board_cross_brand_arbor)).
query(true_val(comparable_board_cross_brand_arbor, arbor_a_frame)).
query(true_val(comparable_board_cross_brand_arbor, unk_cbcb_arbor)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values burton_custom_camber=Burton_Custom_Camber_softer_more_versatile unk_comparable_board_same_brand=Unknown
% @importance 0.725

0.78::acc(s13, comparable_board_same_brand).
0.80::acc(s65, comparable_board_same_brand).

0.90::true_val(comparable_board_same_brand, burton_custom_camber); 0.10::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s13, comparable_board_same_brand, burton_custom_camber).
measured(s65, comparable_board_same_brand, burton_custom_camber).

all_consistent(comparable_board_same_brand) :-
    consistent(s13, comparable_board_same_brand),
    consistent(s65, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, burton_custom_camber)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_flyingv
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values custom_x_flyingv=Burton_Custom_X_Flying_V_rocker_better_powder unk_cbsb_fv=Unknown
% @importance 0.85

0.82::acc(s7, comparable_board_same_brand_flyingv).

0.82::true_val(comparable_board_same_brand_flyingv, custom_x_flyingv); 0.18::true_val(comparable_board_same_brand_flyingv, unk_cbsb_fv).

measured(s7, comparable_board_same_brand_flyingv, custom_x_flyingv).

all_consistent(comparable_board_same_brand_flyingv) :- consistent(s7, comparable_board_same_brand_flyingv).

evidence(all_consistent(comparable_board_same_brand_flyingv)).
query(true_val(comparable_board_same_brand_flyingv, custom_x_flyingv)).
query(true_val(comparable_board_same_brand_flyingv, unk_cbsb_fv)).

% @attr comparable_board_same_brand_flight_att
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values flight_attendant=Burton_Flight_Attendant_better_powder_float unk_cbsb_fa=Unknown
% @importance 0.85

0.82::acc(s7, comparable_board_same_brand_flight_att).

0.82::true_val(comparable_board_same_brand_flight_att, flight_attendant); 0.18::true_val(comparable_board_same_brand_flight_att, unk_cbsb_fa).

measured(s7, comparable_board_same_brand_flight_att, flight_attendant).

all_consistent(comparable_board_same_brand_flight_att) :- consistent(s7, comparable_board_same_brand_flight_att).

evidence(all_consistent(comparable_board_same_brand_flight_att)).
query(true_val(comparable_board_same_brand_flight_att, flight_attendant)).
query(true_val(comparable_board_same_brand_flight_att, unk_cbsb_fa)).

% @attr recommended_boot_sizes
% @type categorical
% @canonical false
% @original_name Recommended boot sizes (TheGoodRide)
% @values boot_size_chart=150_US7_5_to_166W_US12 unk_recommended_boot_sizes=Unknown
% @importance 0.85

0.82::acc(s7, recommended_boot_sizes).

0.82::true_val(recommended_boot_sizes, boot_size_chart); 0.18::true_val(recommended_boot_sizes, unk_recommended_boot_sizes).

measured(s7, recommended_boot_sizes, boot_size_chart).

all_consistent(recommended_boot_sizes) :- consistent(s7, recommended_boot_sizes).

evidence(all_consistent(recommended_boot_sizes)).
query(true_val(recommended_boot_sizes, boot_size_chart)).
query(true_val(recommended_boot_sizes, unk_recommended_boot_sizes)).

% @attr reviewer_opinion_the_good_ride_weight
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values stay_low_mid_weight=Stay_low_to_middle_recommended_weight unk_ro_tgr_w=Unknown
% @importance 0.85

0.82::acc(s7, reviewer_opinion_the_good_ride_weight).

0.82::true_val(reviewer_opinion_the_good_ride_weight, stay_low_mid_weight); 0.18::true_val(reviewer_opinion_the_good_ride_weight, unk_ro_tgr_w).

measured(s7, reviewer_opinion_the_good_ride_weight, stay_low_mid_weight).

all_consistent(reviewer_opinion_the_good_ride_weight) :- consistent(s7, reviewer_opinion_the_good_ride_weight).

evidence(all_consistent(reviewer_opinion_the_good_ride_weight)).
query(true_val(reviewer_opinion_the_good_ride_weight, stay_low_mid_weight)).
query(true_val(reviewer_opinion_the_good_ride_weight, unk_ro_tgr_w)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values precise_clinical_scalpel=Precise_clinical_scalpel_carver_requires_focus unk_user_review_forum=Unknown
% @importance 0.75

0.58::acc(s44, user_review_forum).

0.58::true_val(user_review_forum, precise_clinical_scalpel); 0.42::true_val(user_review_forum, unk_user_review_forum).

measured(s44, user_review_forum, precise_clinical_scalpel).

all_consistent(user_review_forum) :- consistent(s44, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, precise_clinical_scalpel)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr user_review_forum_speed
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values more_enjoyable_faster=More_enjoyable_the_faster_you_go unk_urf_speed=Unknown
% @importance 0.75

0.58::acc(s44, user_review_forum_speed).

0.58::true_val(user_review_forum_speed, more_enjoyable_faster); 0.42::true_val(user_review_forum_speed, unk_urf_speed).

measured(s44, user_review_forum_speed, more_enjoyable_faster).

all_consistent(user_review_forum_speed) :- consistent(s44, user_review_forum_speed).

evidence(all_consistent(user_review_forum_speed)).
query(true_val(user_review_forum_speed, more_enjoyable_faster)).
query(true_val(user_review_forum_speed, unk_urf_speed)).

% @attr user_review_forum_groomers
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values excellent_groomers_not_allday=Excellent_groomers_not_all_day_board unk_urf_groomers=Unknown
% @importance 0.7

0.52::acc(s48, user_review_forum_groomers).

0.52::true_val(user_review_forum_groomers, excellent_groomers_not_allday); 0.48::true_val(user_review_forum_groomers, unk_urf_groomers).

measured(s48, user_review_forum_groomers, excellent_groomers_not_allday).

all_consistent(user_review_forum_groomers) :- consistent(s48, user_review_forum_groomers).

evidence(all_consistent(user_review_forum_groomers)).
query(true_val(user_review_forum_groomers, excellent_groomers_not_allday)).
query(true_val(user_review_forum_groomers, unk_urf_groomers)).

% @attr user_review_forum_bindings
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values cartel_recommended=Cartel_or_Cartel_X_bindings_recommended unk_urf_bindings=Unknown
% @importance 0.75

0.55::acc(s44, user_review_forum_bindings).

0.55::true_val(user_review_forum_bindings, cartel_recommended); 0.45::true_val(user_review_forum_bindings, unk_urf_bindings).

measured(s44, user_review_forum_bindings, cartel_recommended).

all_consistent(user_review_forum_bindings) :- consistent(s44, user_review_forum_bindings).

evidence(all_consistent(user_review_forum_bindings)).
query(true_val(user_review_forum_bindings, cartel_recommended)).
query(true_val(user_review_forum_bindings, unk_urf_bindings)).

% @attr user_review_forum_durability
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values fourth_board_3_4_season_life=Bought_4th_Custom_X_boards_break_3_4_seasons unk_urf_durability=Unknown
% @importance 0.75

0.55::acc(s44, user_review_forum_durability).

0.55::true_val(user_review_forum_durability, fourth_board_3_4_season_life); 0.45::true_val(user_review_forum_durability, unk_urf_durability).

measured(s44, user_review_forum_durability, fourth_board_3_4_season_life).

all_consistent(user_review_forum_durability) :- consistent(s44, user_review_forum_durability).

evidence(all_consistent(user_review_forum_durability)).
query(true_val(user_review_forum_durability, fourth_board_3_4_season_life)).
query(true_val(user_review_forum_durability, unk_urf_durability)).

% @attr contact_length_size
% @type numeric
% @unit mm
% @canonical true
% @original_name contact_length_size
% @values v1245=1245.0 unk_contact_length_size=Unknown
% @importance 0.7

0.60::acc(s45, contact_length_size).

0.65::true_val(contact_length_size, v1245); 0.35::true_val(contact_length_size, unk_contact_length_size).

measured(s45, contact_length_size, v1245).

all_consistent(contact_length_size) :- consistent(s45, contact_length_size).

evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v1245)).
query(true_val(contact_length_size, unk_contact_length_size)).

% @attr camber_height_mm_166w
% @type numeric
% @unit mm
% @canonical false
% @original_name camber_height_mm
% @values v13=13.0 unk_camber_height_mm_166w=Unknown
% @importance 0.7

0.60::acc(s45, camber_height_mm_166w).

0.65::true_val(camber_height_mm_166w, v13); 0.35::true_val(camber_height_mm_166w, unk_camber_height_mm_166w).

measured(s45, camber_height_mm_166w, v13).

all_consistent(camber_height_mm_166w) :- consistent(s45, camber_height_mm_166w).

evidence(all_consistent(camber_height_mm_166w)).
query(true_val(camber_height_mm_166w, v13)).
query(true_val(camber_height_mm_166w, unk_camber_height_mm_166w)).

% @attr sku_merchant
% @type categorical
% @canonical false
% @original_name SKU (merchant)
% @values sku_10689111000_150=10689111000_150 unk_sku_merchant=Unknown
% @importance 0.85

0.95::acc(s_merchant, sku_merchant).

0.93::true_val(sku_merchant, sku_10689111000_150); 0.07::true_val(sku_merchant, unk_sku_merchant).

measured(s_merchant, sku_merchant, sku_10689111000_150).

all_consistent(sku_merchant) :- consistent(s_merchant, sku_merchant).

evidence(all_consistent(sku_merchant)).
query(true_val(sku_merchant, sku_10689111000_150)).
query(true_val(sku_merchant, unk_sku_merchant)).

% @attr shipping_restriction
% @type categorical
% @canonical false
% @original_name Shipping restriction (merchant)
% @values australia_only=Australia_only unk_shipping_restriction=Unknown
% @importance 0.85

0.95::acc(s_merchant, shipping_restriction).

0.93::true_val(shipping_restriction, australia_only); 0.07::true_val(shipping_restriction, unk_shipping_restriction).

measured(s_merchant, shipping_restriction, australia_only).

all_consistent(shipping_restriction) :- consistent(s_merchant, shipping_restriction).

evidence(all_consistent(shipping_restriction)).
query(true_val(shipping_restriction, australia_only)).
query(true_val(shipping_restriction, unk_shipping_restriction)).

% @attr flex_rating_10_manufacturer
% @type categorical
% @canonical false
% @original_name flex_rating_10_manufacturer
% @values range_6_9=6_to_9_out_of_10 unk_flex_rating_mfr=Unknown
% @importance 0.8

0.88::acc(s3, flex_rating_10_manufacturer).
0.85::acc(s14, flex_rating_10_manufacturer).

0.92::true_val(flex_rating_10_manufacturer, range_6_9); 0.08::true_val(flex_rating_10_manufacturer, unk_flex_rating_mfr).

measured(s3, flex_rating_10_manufacturer, range_6_9).
measured(s14, flex_rating_10_manufacturer, range_6_9).

all_consistent(flex_rating_10_manufacturer) :-
    (indep(s3), consistent(s3, flex_rating_10_manufacturer) ; \+indep(s3)),
    (indep(s14), consistent(s14, flex_rating_10_manufacturer) ; \+indep(s14)).

evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, range_6_9)).
query(true_val(flex_rating_10_manufacturer, unk_flex_rating_mfr)).