0.15::indep(s1).
0.20::indep(s3).
0.15::indep(s6).
0.15::indep(s10).
0.25::indep(s18).
0.20::indep(s20).
0.25::indep(s25).
0.15::indep(s26).
0.15::indep(s28).
0.15::indep(s41).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values rome=Rome unk_brand=Unknown
% @importance 0.90

0.95::acc(s16, brand).
0.70::acc(s1, brand).
0.97::true_val(brand, rome); 0.03::true_val(brand, unk_brand).
measured(s16, brand, rome).
measured(s1, brand, rome).
all_consistent(brand) :-
    consistent(s16, brand),
    (indep(s1), consistent(s1, brand) ; \+indep(s1)).
evidence(all_consistent(brand)).
query(true_val(brand, rome)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values artifact=Artifact unk_model_name=Unknown
% @importance 0.90

0.95::acc(s16, model_name).
0.97::true_val(model_name, artifact); 0.03::true_val(model_name, unk_model_name).
measured(s16, model_name, artifact).
all_consistent(model_name) :- consistent(s16, model_name).
evidence(all_consistent(model_name)).
query(true_val(model_name, artifact)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2027=2027 unk_model_year=Unknown
% @importance 0.88

0.95::acc(s16, model_year).
0.65::acc(s3, model_year).
0.95::true_val(model_year, y2027); 0.05::true_val(model_year, unk_model_year).
measured(s16, model_year, y2027).
measured(s3, model_year, y2027).
all_consistent(model_year) :-
    consistent(s16, model_year),
    (indep(s3), consistent(s3, model_year) ; \+indep(s3)).
evidence(all_consistent(model_year)).
query(true_val(model_year, y2027)).
query(true_val(model_year, unk_model_year)).

% @attr parent_company
% @type categorical
% @canonical false
% @original_name Parent company
% @values nidecker_group=Nidecker_Group_Low_Pressure_Studio unk_parent_company=Unknown
% @importance 0.60

0.82::acc(s4, parent_company).
0.95::acc(s5, parent_company).
0.95::true_val(parent_company, nidecker_group); 0.05::true_val(parent_company, unk_parent_company).
measured(s4, parent_company, nidecker_group).
measured(s5, parent_company, nidecker_group).
all_consistent(parent_company) :-
    consistent(s4, parent_company),
    consistent(s5, parent_company).
evidence(all_consistent(parent_company)).
query(true_val(parent_company, nidecker_group)).
query(true_val(parent_company, unk_parent_company)).

% @attr manufacturer_founded
% @type categorical
% @canonical false
% @original_name Manufacturer founded
% @values y2001_waterbury_vt=2001_Waterbury_Vermont unk_manufacturer_founded=Unknown
% @importance 0.50

0.65::acc(s6, manufacturer_founded).
0.85::acc(s7, manufacturer_founded).
0.95::true_val(manufacturer_founded, y2001_waterbury_vt); 0.05::true_val(manufacturer_founded, unk_manufacturer_founded).
measured(s6, manufacturer_founded, y2001_waterbury_vt).
measured(s7, manufacturer_founded, y2001_waterbury_vt).
all_consistent(manufacturer_founded) :-
    consistent(s6, manufacturer_founded),
    consistent(s7, manufacturer_founded).
evidence(all_consistent(manufacturer_founded)).
query(true_val(manufacturer_founded, y2001_waterbury_vt)).
query(true_val(manufacturer_founded, unk_manufacturer_founded)).

% @attr founders
% @type categorical
% @canonical false
% @original_name Founders
% @values reid_maravetz=Josh_Reid_and_Paul_Maravetz unk_founders=Unknown
% @importance 0.475

0.85::acc(s7, founders).
0.55::acc(s8, founders).
0.95::true_val(founders, reid_maravetz); 0.05::true_val(founders, unk_founders).
measured(s7, founders, reid_maravetz).
measured(s8, founders, reid_maravetz).
all_consistent(founders) :-
    consistent(s7, founders),
    consistent(s8, founders).
evidence(all_consistent(founders)).
query(true_val(founders, reid_maravetz)).
query(true_val(founders, unk_founders)).

% @attr headquarters
% @type categorical
% @canonical false
% @original_name Headquarters
% @values derby_lane_waterbury_vt=1_Derby_Lane_Suite_4_Waterbury_Vermont unk_headquarters=Unknown
% @importance 0.30

0.70::acc(s9, headquarters).
0.60::true_val(headquarters, derby_lane_waterbury_vt); 0.40::true_val(headquarters, unk_headquarters).
measured(s9, headquarters, derby_lane_waterbury_vt).
all_consistent(headquarters) :- consistent(s9, headquarters).
evidence(all_consistent(headquarters)).
query(true_val(headquarters, derby_lane_waterbury_vt)).
query(true_val(headquarters, unk_headquarters)).

% @attr brand_ethos
% @type categorical
% @canonical false
% @original_name Brand ethos
% @values all_ways_down=All_Ways_Down_rider_driven_freestyle unk_brand_ethos=Unknown
% @importance 0.35

0.60::acc(s10, brand_ethos).
0.51::true_val(brand_ethos, all_ways_down); 0.49::true_val(brand_ethos, unk_brand_ethos).
measured(s10, brand_ethos, all_ways_down).
all_consistent(brand_ethos) :-
    (indep(s10), consistent(s10, brand_ethos) ; \+indep(s10)).
evidence(all_consistent(brand_ethos)).
query(true_val(brand_ethos, all_ways_down)).
query(true_val(brand_ethos, unk_brand_ethos)).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values quebec_canada=Quebec_Canada unk_manufacturing_location=Unknown
% @importance 0.50

0.72::acc(s11, manufacturing_location).
0.60::true_val(manufacturing_location, quebec_canada); 0.40::true_val(manufacturing_location, unk_manufacturing_location).
measured(s11, manufacturing_location, quebec_canada).
all_consistent(manufacturing_location) :- consistent(s11, manufacturing_location).
evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, quebec_canada)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

% @attr rd_design_location
% @type categorical
% @canonical false
% @original_name R&D and design location
% @values waterbury_vt=Waterbury_Vermont unk_rd_design_location=Unknown
% @importance 0.45

0.82::acc(s12, rd_design_location).
0.76::true_val(rd_design_location, waterbury_vt); 0.24::true_val(rd_design_location, unk_rd_design_location).
measured(s12, rd_design_location, waterbury_vt).
all_consistent(rd_design_location) :- consistent(s12, rd_design_location).
evidence(all_consistent(rd_design_location)).
query(true_val(rd_design_location, waterbury_vt)).
query(true_val(rd_design_location, unk_rd_design_location)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.90

0.95::acc(s16, product_type).
0.97::true_val(product_type, snowboard); 0.03::true_val(product_type, unk_product_type).
measured(s16, product_type, snowboard).
all_consistent(product_type) :- consistent(s16, product_type).
evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values freestyle=Freestyle unk_board_category=Unknown
% @importance 0.85

0.95::acc(s16, board_category).
0.70::acc(s1, board_category).
0.97::true_val(board_category, freestyle); 0.03::true_val(board_category, unk_board_category).
measured(s16, board_category, freestyle).
measured(s1, board_category, freestyle).
all_consistent(board_category) :-
    consistent(s16, board_category),
    (indep(s1), consistent(s1, board_category) ; \+indep(s1)).
evidence(all_consistent(board_category)).
query(true_val(board_category, freestyle)).
query(true_val(board_category, unk_board_category)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.90

0.95::acc(s16, gender).
0.97::true_val(gender, mens); 0.03::true_val(gender, unk_gender).
measured(s16, gender, mens).
all_consistent(gender) :- consistent(s16, gender).
evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values y2004=2004 unk_model_first_available_year=Unknown
% @importance 0.70

0.93::acc(s14, model_first_available_year).
0.90::true_val(model_first_available_year, y2004); 0.10::true_val(model_first_available_year, unk_model_first_available_year).
measured(s14, model_first_available_year, y2004).
all_consistent(model_first_available_year) :- consistent(s14, model_first_available_year).
evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2004)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr description_manufacturer
% @type categorical
% @canonical false
% @original_name Description (manufacturer)
% @values pressable_freestyle=Super_pressable_ride_for_downrails_pole_jams_freestyle unk_description_manufacturer=Unknown
% @importance 1.00

0.95::acc(s15, description_manufacturer).
0.90::true_val(description_manufacturer, pressable_freestyle); 0.10::true_val(description_manufacturer, unk_description_manufacturer).
measured(s15, description_manufacturer, pressable_freestyle).
all_consistent(description_manufacturer) :- consistent(s15, description_manufacturer).
evidence(all_consistent(description_manufacturer)).
query(true_val(description_manufacturer, pressable_freestyle)).
query(true_val(description_manufacturer, unk_description_manufacturer)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values true_twin=True_Twin unk_shape=Unknown
% @importance 0.95

0.95::acc(s16, shape).
0.70::acc(s1, shape).
0.97::true_val(shape, true_twin); 0.03::true_val(shape, unk_shape).
measured(s16, shape, true_twin).
measured(s1, shape, true_twin).
all_consistent(shape) :-
    consistent(s16, shape),
    (indep(s1), consistent(s1, shape) ; \+indep(s1)).
evidence(all_consistent(shape)).
query(true_val(shape, true_twin)).
query(true_val(shape, unk_shape)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values stay_positive_camber=Stay_Positive_Camber_traditional_full unk_camber_type=Unknown
% @importance 0.95

0.95::acc(s16, camber_type).
0.70::acc(s1, camber_type).
0.97::true_val(camber_type, stay_positive_camber); 0.03::true_val(camber_type, unk_camber_type).
measured(s16, camber_type, stay_positive_camber).
measured(s1, camber_type, stay_positive_camber).
all_consistent(camber_type) :-
    consistent(s16, camber_type),
    (indep(s1), consistent(s1, camber_type) ; \+indep(s1)).
evidence(all_consistent(camber_type)).
query(true_val(camber_type, stay_positive_camber)).
query(true_val(camber_type, unk_camber_type)).

% @attr nose_tail_design
% @type categorical
% @canonical false
% @original_name Nose/tail design
% @values twin_double_kick=Twin_Double_Kick unk_nose_tail_design=Unknown
% @importance 0.95

0.95::acc(s16, nose_tail_design).
0.70::acc(s1, nose_tail_design).
0.97::true_val(nose_tail_design, twin_double_kick); 0.03::true_val(nose_tail_design, unk_nose_tail_design).
measured(s16, nose_tail_design, twin_double_kick).
measured(s1, nose_tail_design, twin_double_kick).
all_consistent(nose_tail_design) :-
    consistent(s16, nose_tail_design),
    (indep(s1), consistent(s1, nose_tail_design) ; \+indep(s1)).
evidence(all_consistent(nose_tail_design)).
query(true_val(nose_tail_design, twin_double_kick)).
query(true_val(nose_tail_design, unk_nose_tail_design)).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values radial=Radial_Sidecut_single_radius unk_sidecut_type=Unknown
% @importance 0.95

0.95::acc(s16, sidecut_type).
0.70::acc(s1, sidecut_type).
0.97::true_val(sidecut_type, radial); 0.03::true_val(sidecut_type, unk_sidecut_type).
measured(s16, sidecut_type, radial).
measured(s1, sidecut_type, radial).
all_consistent(sidecut_type) :-
    consistent(s16, sidecut_type),
    (indep(s1), consistent(s1, sidecut_type) ; \+indep(s1)).
evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, radial)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr taper
% @type numeric
% @unit mm
% @canonical true
% @original_name taper
% @values v0=0.0 unk_taper=Unknown
% @importance 0.88

0.95::acc(s16, taper).
0.65::acc(s3, taper).
0.95::true_val(taper, v0); 0.05::true_val(taper, unk_taper).
measured(s16, taper, v0).
measured(s3, taper, v0).
all_consistent(taper) :-
    consistent(s16, taper),
    (indep(s3), consistent(s3, taper) ; \+indep(s3)).
evidence(all_consistent(taper)).
query(true_val(taper, v0)).
query(true_val(taper, unk_taper)).

% @attr setback
% @type numeric
% @unit mm
% @canonical true
% @original_name setback
% @values v0=0.0 unk_setback=Unknown
% @importance 0.88

0.95::acc(s16, setback).
0.65::acc(s3, setback).
0.95::true_val(setback, v0); 0.05::true_val(setback, unk_setback).
measured(s16, setback, v0).
measured(s3, setback, v0).
all_consistent(setback) :-
    consistent(s16, setback),
    (indep(s3), consistent(s3, setback) ; \+indep(s3)).
evidence(all_consistent(setback)).
query(true_val(setback, v0)).
query(true_val(setback, unk_setback)).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values symmetrical=Symmetrical_twin unk_flex_direction=Unknown
% @importance 0.90

0.95::acc(s16, flex_direction).
0.90::true_val(flex_direction, symmetrical); 0.10::true_val(flex_direction, unk_flex_direction).
measured(s16, flex_direction, symmetrical).
all_consistent(flex_direction) :- consistent(s16, flex_direction).
evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, symmetrical)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v4=4.0 unk_flex_rating_10=Unknown
% @importance 0.92

0.95::acc(s16, flex_rating_10).
0.70::acc(s1, flex_rating_10).
0.65::acc(s3, flex_rating_10).
0.97::true_val(flex_rating_10, v4); 0.03::true_val(flex_rating_10, unk_flex_rating_10).
measured(s16, flex_rating_10, v4).
measured(s1, flex_rating_10, v4).
measured(s3, flex_rating_10, v4).
all_consistent(flex_rating_10) :-
    consistent(s16, flex_rating_10),
    (indep(s1), consistent(s1, flex_rating_10) ; \+indep(s1)),
    (indep(s3), consistent(s3, flex_rating_10) ; \+indep(s3)).
evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v4)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

% @attr flex_feel_numeric
% @type numeric
% @unit /10
% @canonical false
% @original_name flex_feel
% @values v4_5=4.5 unk_flex_feel_numeric=Unknown
% @importance 0.90

0.88::acc(s17, flex_feel_numeric).
0.72::true_val(flex_feel_numeric, v4_5); 0.28::true_val(flex_feel_numeric, unk_flex_feel_numeric).
measured(s17, flex_feel_numeric, v4_5).
all_consistent(flex_feel_numeric) :- consistent(s17, flex_feel_numeric).
evidence(all_consistent(flex_feel_numeric)).
query(true_val(flex_feel_numeric, v4_5)).
query(true_val(flex_feel_numeric, unk_flex_feel_numeric)).

% @attr flex_rating_10_evo
% @type categorical
% @canonical true
% @original_name flex_rating_10_evo
% @values soft=Soft unk_flex_rating_10_evo=Unknown
% @importance 0.85

0.80::acc(s18, flex_rating_10_evo).
0.68::true_val(flex_rating_10_evo, soft); 0.32::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).
measured(s18, flex_rating_10_evo, soft).
all_consistent(flex_rating_10_evo) :-
    (indep(s18), consistent(s18, flex_rating_10_evo) ; \+indep(s18)).
evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, soft)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values soft_playful_buttery=Soft_playful_buttery_easy_to_press_with_pop unk_flex_feel=Unknown
% @importance 0.90

0.95::acc(s15, flex_feel).
0.80::acc(s19, flex_feel).
0.93::true_val(flex_feel, soft_playful_buttery); 0.07::true_val(flex_feel, unk_flex_feel).
measured(s15, flex_feel, soft_playful_buttery).
measured(s19, flex_feel, soft_playful_buttery).
all_consistent(flex_feel) :-
    consistent(s15, flex_feel),
    consistent(s19, flex_feel).
evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, soft_playful_buttery)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values stomp_core_poplar=Stomp_Core_100pct_Poplar unk_core_material=Unknown
% @importance 0.80

0.80::acc(s20, core_material).
0.72::true_val(core_material, stomp_core_poplar); 0.28::true_val(core_material, unk_core_material).
measured(s20, core_material, stomp_core_poplar).
all_consistent(core_material) :-
    (indep(s20), consistent(s20, core_material) ; \+indep(s20)).
evidence(all_consistent(core_material)).
query(true_val(core_material, stomp_core_poplar)).
query(true_val(core_material, unk_core_material)).

% @attr core_material_blend_ratio
% @type categorical
% @canonical true
% @original_name core_material_blend_ratio
% @values poplar_paulownia=Poplar_and_paulownia_blend poplar_only=100pct_Poplar unk_core_material_blend_ratio=Unknown
% @importance 0.83

0.60::acc(s3, core_material_blend_ratio).
0.80::acc(s20, core_material_blend_ratio).
0.35::true_val(core_material_blend_ratio, poplar_paulownia); 0.60::true_val(core_material_blend_ratio, poplar_only); 0.05::true_val(core_material_blend_ratio, unk_core_material_blend_ratio).
measured(s3, core_material_blend_ratio, poplar_paulownia).
measured(s20, core_material_blend_ratio, poplar_only).
all_consistent(core_material_blend_ratio) :-
    (indep(s3), consistent(s3, core_material_blend_ratio) ; \+indep(s3)),
    (indep(s20), consistent(s20, core_material_blend_ratio) ; \+indep(s20)).
evidence(all_consistent(core_material_blend_ratio)).
query(true_val(core_material_blend_ratio, poplar_paulownia)).
query(true_val(core_material_blend_ratio, poplar_only)).
query(true_val(core_material_blend_ratio, unk_core_material_blend_ratio)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values biaxial=Biaxial_fiberglass_torsionally_playful unk_laminate=Unknown
% @importance 0.88

0.95::acc(s16, laminate).
0.97::true_val(laminate, biaxial); 0.03::true_val(laminate, unk_laminate).
measured(s16, laminate, biaxial).
all_consistent(laminate) :- consistent(s16, laminate).
evidence(all_consistent(laminate)).
query(true_val(laminate, biaxial)).
query(true_val(laminate, unk_laminate)).

% @attr laminate_upper
% @type categorical
% @canonical false
% @original_name laminate (upper)
% @values biax_upper=Biax_Upper_Glass unk_laminate_upper=Unknown
% @importance 0.88

0.95::acc(s16, laminate_upper).
0.65::acc(s3, laminate_upper).
0.95::true_val(laminate_upper, biax_upper); 0.05::true_val(laminate_upper, unk_laminate_upper).
measured(s16, laminate_upper, biax_upper).
measured(s3, laminate_upper, biax_upper).
all_consistent(laminate_upper) :-
    consistent(s16, laminate_upper),
    (indep(s3), consistent(s3, laminate_upper) ; \+indep(s3)).
evidence(all_consistent(laminate_upper)).
query(true_val(laminate_upper, biax_upper)).
query(true_val(laminate_upper, unk_laminate_upper)).

% @attr laminate_lower
% @type categorical
% @canonical false
% @original_name laminate (lower)
% @values biax_lower=Biax_Lower_Glass unk_laminate_lower=Unknown
% @importance 0.88

0.95::acc(s16, laminate_lower).
0.65::acc(s3, laminate_lower).
0.95::true_val(laminate_lower, biax_lower); 0.05::true_val(laminate_lower, unk_laminate_lower).
measured(s16, laminate_lower, biax_lower).
measured(s3, laminate_lower, biax_lower).
all_consistent(laminate_lower) :-
    consistent(s16, laminate_lower),
    (indep(s3), consistent(s3, laminate_lower) ; \+indep(s3)).
evidence(all_consistent(laminate_lower)).
query(true_val(laminate_lower, biax_lower)).
query(true_val(laminate_lower, unk_laminate_lower)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values bamboo_hotrod=Twin_Single_Bamboo_HotRods bamboo_omega_hotrod=Bamboo_Omega_HotRods unk_construction_material_innovation=Unknown
% @importance 0.90

0.95::acc(s15, construction_material_innovation).
0.60::acc(s3, construction_material_innovation).
0.65::true_val(construction_material_innovation, bamboo_hotrod); 0.30::true_val(construction_material_innovation, bamboo_omega_hotrod); 0.05::true_val(construction_material_innovation, unk_construction_material_innovation).
measured(s15, construction_material_innovation, bamboo_hotrod).
measured(s3, construction_material_innovation, bamboo_omega_hotrod).
all_consistent(construction_material_innovation) :-
    consistent(s15, construction_material_innovation),
    (indep(s3), consistent(s3, construction_material_innovation) ; \+indep(s3)).
evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, bamboo_hotrod)).
query(true_val(construction_material_innovation, bamboo_omega_hotrod)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr flax_impact_plates
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Flax)
% @values flax_mats_around_inserts=Flax_Impact_Plates_woven_flax_around_inserts unk_flax_impact_plates=Unknown
% @importance 0.98

0.95::acc(s15, flax_impact_plates).
0.95::acc(s16, flax_impact_plates).
0.97::true_val(flax_impact_plates, flax_mats_around_inserts); 0.03::true_val(flax_impact_plates, unk_flax_impact_plates).
measured(s15, flax_impact_plates, flax_mats_around_inserts).
measured(s16, flax_impact_plates, flax_mats_around_inserts).
all_consistent(flax_impact_plates) :-
    consistent(s15, flax_impact_plates),
    consistent(s16, flax_impact_plates).
evidence(all_consistent(flax_impact_plates)).
query(true_val(flax_impact_plates, flax_mats_around_inserts)).
query(true_val(flax_impact_plates, unk_flax_impact_plates)).

% @attr flax_impact_plates_function
% @type categorical
% @canonical false
% @original_name Flax Impact Plates function
% @values absorb_distribute_impact=Withstand_landings_distribute_impact_increase_lifespan unk_flax_impact_plates_function=Unknown
% @importance 1.00

0.95::acc(s15, flax_impact_plates_function).
0.90::true_val(flax_impact_plates_function, absorb_distribute_impact); 0.10::true_val(flax_impact_plates_function, unk_flax_impact_plates_function).
measured(s15, flax_impact_plates_function, absorb_distribute_impact).
all_consistent(flax_impact_plates_function) :- consistent(s15, flax_impact_plates_function).
evidence(all_consistent(flax_impact_plates_function)).
query(true_val(flax_impact_plates_function, absorb_distribute_impact)).
query(true_val(flax_impact_plates_function, unk_flax_impact_plates_function)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values dampening_sidewall=Dampening_sidewall_material unk_sidewall_material=Unknown
% @importance 0.85

0.92::acc(s21, sidewall_material).
0.87::true_val(sidewall_material, dampening_sidewall); 0.13::true_val(sidewall_material, unk_sidewall_material).
measured(s21, sidewall_material, dampening_sidewall).
all_consistent(sidewall_material) :- consistent(s21, sidewall_material).
evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, dampening_sidewall)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr edge_material
% @type categorical
% @canonical false
% @original_name Edge material
% @values stainless_steel=Stainless_steel unk_edge_material=Unknown
% @importance 0.85

0.92::acc(s21, edge_material).
0.87::true_val(edge_material, stainless_steel); 0.13::true_val(edge_material, unk_edge_material).
measured(s21, edge_material, stainless_steel).
all_consistent(edge_material) :- consistent(s21, edge_material).
evidence(all_consistent(edge_material)).
query(true_val(edge_material, stainless_steel)).
query(true_val(edge_material, unk_edge_material)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_inserts unk_mounting_pattern=Unknown
% @importance 0.90

0.95::acc(s16, mounting_pattern).
0.90::true_val(mounting_pattern, inserts_2x4); 0.10::true_val(mounting_pattern, unk_mounting_pattern).
measured(s16, mounting_pattern, inserts_2x4).
all_consistent(mounting_pattern) :- consistent(s16, mounting_pattern).
evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr insert_count
% @type numeric
% @unit inserts
% @canonical false
% @original_name Insert count
% @values v24=24.0 unk_insert_count=Unknown
% @importance 1.00

0.95::acc(s16, insert_count).
0.90::true_val(insert_count, v24); 0.10::true_val(insert_count, unk_insert_count).
measured(s16, insert_count, v24).
all_consistent(insert_count) :- consistent(s16, insert_count).
evidence(all_consistent(insert_count)).
query(true_val(insert_count, v24)).
query(true_val(insert_count, unk_insert_count)).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values powerslide_extruded=PowerSlide_Base_extruded sinterstrong=SinterStrong_sintered unk_base_type=Unknown
% @importance 0.90

0.95::acc(s15, base_type).
0.92::acc(s21, base_type).
0.70::acc(s1, base_type).
0.55::acc(s3, base_type).
0.82::acc(s37, base_type).
0.85::true_val(base_type, powerslide_extruded); 0.12::true_val(base_type, sinterstrong); 0.03::true_val(base_type, unk_base_type).
measured(s15, base_type, powerslide_extruded).
measured(s21, base_type, powerslide_extruded).
measured(s1, base_type, powerslide_extruded).
measured(s3, base_type, sinterstrong).
measured(s37, base_type, powerslide_extruded).
all_consistent(base_type) :-
    consistent(s15, base_type),
    consistent(s21, base_type),
    (indep(s1), consistent(s1, base_type) ; \+indep(s1)),
    (indep(s3), consistent(s3, base_type) ; \+indep(s3)),
    consistent(s37, base_type).
evidence(all_consistent(base_type)).
query(true_val(base_type, powerslide_extruded)).
query(true_val(base_type, sinterstrong)).
query(true_val(base_type, unk_base_type)).

% @attr base_material
% @type categorical
% @canonical false
% @original_name base_material
% @values high_end_extruded=High_end_durable_faster_than_expected_extruded unk_base_material=Unknown
% @importance 1.00

0.95::acc(s15, base_material).
0.90::true_val(base_material, high_end_extruded); 0.10::true_val(base_material, unk_base_material).
measured(s15, base_material, high_end_extruded).
all_consistent(base_material) :- consistent(s15, base_material).
evidence(all_consistent(base_material)).
query(true_val(base_material, high_end_extruded)).
query(true_val(base_material, unk_base_material)).

% @attr user_review_forum_base_speed
% @type categorical
% @canonical false
% @original_name user_review_forum (base speed)
% @values extruded_slower_easier_repair=Extruded_slower_than_sintered_easier_to_repair unk_user_review_forum_base_speed=Unknown
% @importance 0.75

0.60::acc(s22, user_review_forum_base_speed).
0.34::true_val(user_review_forum_base_speed, extruded_slower_easier_repair); 0.66::true_val(user_review_forum_base_speed, unk_user_review_forum_base_speed).
measured(s22, user_review_forum_base_speed, extruded_slower_easier_repair).
all_consistent(user_review_forum_base_speed) :- consistent(s22, user_review_forum_base_speed).
evidence(all_consistent(user_review_forum_base_speed)).
query(true_val(user_review_forum_base_speed, extruded_slower_easier_repair)).
query(true_val(user_review_forum_base_speed, unk_user_review_forum_base_speed)).

% @attr user_review_forum_wax_issue
% @type categorical
% @canonical false
% @original_name user_review_forum (wax issue)
% @values no_wax_couldnt_glide=Board_arrived_with_no_wax_unable_to_glide unk_user_review_forum_wax_issue=Unknown
% @importance 0.85

0.55::acc(s23, user_review_forum_wax_issue).
0.43::true_val(user_review_forum_wax_issue, no_wax_couldnt_glide); 0.57::true_val(user_review_forum_wax_issue, unk_user_review_forum_wax_issue).
measured(s23, user_review_forum_wax_issue, no_wax_couldnt_glide).
all_consistent(user_review_forum_wax_issue) :- consistent(s23, user_review_forum_wax_issue).
evidence(all_consistent(user_review_forum_wax_issue)).
query(true_val(user_review_forum_wax_issue, no_wax_couldnt_glide)).
query(true_val(user_review_forum_wax_issue, unk_user_review_forum_wax_issue)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values eight_sizes=147_150_153_154W_156_157W_159_160W unk_available_sizes=Unknown
% @importance 1.00

0.95::acc(s16, available_sizes).
0.90::true_val(available_sizes, eight_sizes); 0.10::true_val(available_sizes, unk_available_sizes).
measured(s16, available_sizes, eight_sizes).
all_consistent(available_sizes) :- consistent(s16, available_sizes).
evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, eight_sizes)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 0.90

0.95::acc(s16, width_options).
0.90::true_val(width_options, standard_and_wide); 0.10::true_val(width_options, unk_width_options).
measured(s16, width_options, standard_and_wide).
all_consistent(width_options) :- consistent(s16, width_options).
evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

% @attr effective_edge_147
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 147cm
% @values v112_0=112.0 unk_effective_edge_147=Unknown
% @importance 1.00

0.95::acc(s16, effective_edge_147).
0.90::true_val(effective_edge_147, v112_0); 0.10::true_val(effective_edge_147, unk_effective_edge_147).
measured(s16, effective_edge_147, v112_0).
all_consistent(effective_edge_147) :- consistent(s16, effective_edge_147).
evidence(all_consistent(effective_edge_147)).
query(true_val(effective_edge_147, v112_0)).
query(true_val(effective_edge_147, unk_effective_edge_147)).

% @attr effective_edge_150
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 150cm
% @values v114_6=114.6 unk_effective_edge_150=Unknown
% @importance 1.00

0.95::acc(s16, effective_edge_150).
0.90::true_val(effective_edge_150, v114_6); 0.10::true_val(effective_edge_150, unk_effective_edge_150).
measured(s16, effective_edge_150, v114_6).
all_consistent(effective_edge_150) :- consistent(s16, effective_edge_150).
evidence(all_consistent(effective_edge_150)).
query(true_val(effective_edge_150, v114_6)).
query(true_val(effective_edge_150, unk_effective_edge_150)).

% @attr effective_edge_153
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 153cm
% @values v117_3=117.3 unk_effective_edge_153=Unknown
% @importance 1.00

0.95::acc(s16, effective_edge_153).
0.90::true_val(effective_edge_153, v117_3); 0.10::true_val(effective_edge_153, unk_effective_edge_153).
measured(s16, effective_edge_153, v117_3).
all_consistent(effective_edge_153) :- consistent(s16, effective_edge_153).
evidence(all_consistent(effective_edge_153)).
query(true_val(effective_edge_153, v117_3)).
query(true_val(effective_edge_153, unk_effective_edge_153)).

% @attr effective_edge_154w
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 154W
% @values v118_2=118.2 unk_effective_edge_154w=Unknown
% @importance 1.00

0.95::acc(s16, effective_edge_154w).
0.90::true_val(effective_edge_154w, v118_2); 0.10::true_val(effective_edge_154w, unk_effective_edge_154w).
measured(s16, effective_edge_154w, v118_2).
all_consistent(effective_edge_154w) :- consistent(s16, effective_edge_154w).
evidence(all_consistent(effective_edge_154w)).
query(true_val(effective_edge_154w, v118_2)).
query(true_val(effective_edge_154w, unk_effective_edge_154w)).

% @attr effective_edge_156
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 156cm
% @values v120_0=120.0 unk_effective_edge_156=Unknown
% @importance 1.00

0.95::acc(s16, effective_edge_156).
0.90::true_val(effective_edge_156, v120_0); 0.10::true_val(effective_edge_156, unk_effective_edge_156).
measured(s16, effective_edge_156, v120_0).
all_consistent(effective_edge_156) :- consistent(s16, effective_edge_156).
evidence(all_consistent(effective_edge_156)).
query(true_val(effective_edge_156, v120_0)).
query(true_val(effective_edge_156, unk_effective_edge_156)).

% @attr effective_edge_157w
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 157W
% @values v120_9=120.9 unk_effective_edge_157w=Unknown
% @importance 1.00

0.95::acc(s16, effective_edge_157w).
0.90::true_val(effective_edge_157w, v120_9); 0.10::true_val(effective_edge_157w, unk_effective_edge_157w).
measured(s16, effective_edge_157w, v120_9).
all_consistent(effective_edge_157w) :- consistent(s16, effective_edge_157w).
evidence(all_consistent(effective_edge_157w)).
query(true_val(effective_edge_157w, v120_9)).
query(true_val(effective_edge_157w, unk_effective_edge_157w)).

% @attr effective_edge_159
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 159cm
% @values v122_7=122.7 unk_effective_edge_159=Unknown
% @importance 1.00

0.95::acc(s16, effective_edge_159).
0.90::true_val(effective_edge_159, v122_7); 0.10::true_val(effective_edge_159, unk_effective_edge_159).
measured(s16, effective_edge_159, v122_7).
all_consistent(effective_edge_159) :- consistent(s16, effective_edge_159).
evidence(all_consistent(effective_edge_159)).
query(true_val(effective_edge_159, v122_7)).
query(true_val(effective_edge_159, unk_effective_edge_159)).

% @attr effective_edge_160w
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 160W
% @values v123_6=123.6 unk_effective_edge_160w=Unknown
% @importance 1.00

0.95::acc(s16, effective_edge_160w).
0.90::true_val(effective_edge_160w, v123_6); 0.10::true_val(effective_edge_160w, unk_effective_edge_160w).
measured(s16, effective_edge_160w, v123_6).
all_consistent(effective_edge_160w) :- consistent(s16, effective_edge_160w).
evidence(all_consistent(effective_edge_160w)).
query(true_val(effective_edge_160w, v123_6)).
query(true_val(effective_edge_160w, unk_effective_edge_160w)).

% @attr waist_width_147
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 147cm
% @values v25_2=25.2 unk_waist_width_147=Unknown
% @importance 1.00

0.95::acc(s16, waist_width_147).
0.90::true_val(waist_width_147, v25_2); 0.10::true_val(waist_width_147, unk_waist_width_147).
measured(s16, waist_width_147, v25_2).
all_consistent(waist_width_147) :- consistent(s16, waist_width_147).
evidence(all_consistent(waist_width_147)).
query(true_val(waist_width_147, v25_2)).
query(true_val(waist_width_147, unk_waist_width_147)).

% @attr waist_width_150
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 150cm
% @values v25_3=25.3 unk_waist_width_150=Unknown
% @importance 1.00

0.95::acc(s16, waist_width_150).
0.90::true_val(waist_width_150, v25_3); 0.10::true_val(waist_width_150, unk_waist_width_150).
measured(s16, waist_width_150, v25_3).
all_consistent(waist_width_150) :- consistent(s16, waist_width_150).
evidence(all_consistent(waist_width_150)).
query(true_val(waist_width_150, v25_3)).
query(true_val(waist_width_150, unk_waist_width_150)).

% @attr waist_width_153
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 153cm
% @values v25_5=25.5 unk_waist_width_153=Unknown
% @importance 1.00

0.95::acc(s16, waist_width_153).
0.90::true_val(waist_width_153, v25_5); 0.10::true_val(waist_width_153, unk_waist_width_153).
measured(s16, waist_width_153, v25_5).
all_consistent(waist_width_153) :- consistent(s16, waist_width_153).
evidence(all_consistent(waist_width_153)).
query(true_val(waist_width_153, v25_5)).
query(true_val(waist_width_153, unk_waist_width_153)).

% @attr waist_width_154w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 154W
% @values v26_5=26.5 unk_waist_width_154w=Unknown
% @importance 1.00

0.95::acc(s16, waist_width_154w).
0.90::true_val(waist_width_154w, v26_5); 0.10::true_val(waist_width_154w, unk_waist_width_154w).
measured(s16, waist_width_154w, v26_5).
all_consistent(waist_width_154w) :- consistent(s16, waist_width_154w).
evidence(all_consistent(waist_width_154w)).
query(true_val(waist_width_154w, v26_5)).
query(true_val(waist_width_154w, unk_waist_width_154w)).

% @attr waist_width_156
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 156cm
% @values v25_7=25.7 unk_waist_width_156=Unknown
% @importance 1.00

0.95::acc(s16, waist_width_156).
0.90::true_val(waist_width_156, v25_7); 0.10::true_val(waist_width_156, unk_waist_width_156).
measured(s16, waist_width_156, v25_7).
all_consistent(waist_width_156) :- consistent(s16, waist_width_156).
evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v25_7)).
query(true_val(waist_width_156, unk_waist_width_156)).

% @attr waist_width_157w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 157W
% @values v26_7=26.7 unk_waist_width_157w=Unknown
% @importance 1.00

0.95::acc(s16, waist_width_157w).
0.90::true_val(waist_width_157w, v26_7); 0.10::true_val(waist_width_157w, unk_waist_width_157w).
measured(s16, waist_width_157w, v26_7).
all_consistent(waist_width_157w) :- consistent(s16, waist_width_157w).
evidence(all_consistent(waist_width_157w)).
query(true_val(waist_width_157w, v26_7)).
query(true_val(waist_width_157w, unk_waist_width_157w)).

% @attr waist_width_159
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 159cm
% @values v25_8=25.8 unk_waist_width_159=Unknown
% @importance 1.00

0.95::acc(s16, waist_width_159).
0.90::true_val(waist_width_159, v25_8); 0.10::true_val(waist_width_159, unk_waist_width_159).
measured(s16, waist_width_159, v25_8).
all_consistent(waist_width_159) :- consistent(s16, waist_width_159).
evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v25_8)).
query(true_val(waist_width_159, unk_waist_width_159)).

% @attr waist_width_160w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 160W
% @values v26_9=26.9 unk_waist_width_160w=Unknown
% @importance 1.00

0.95::acc(s16, waist_width_160w).
0.90::true_val(waist_width_160w, v26_9); 0.10::true_val(waist_width_160w, unk_waist_width_160w).
measured(s16, waist_width_160w, v26_9).
all_consistent(waist_width_160w) :- consistent(s16, waist_width_160w).
evidence(all_consistent(waist_width_160w)).
query(true_val(waist_width_160w, v26_9)).
query(true_val(waist_width_160w, unk_waist_width_160w)).

% @attr sidecut_radius_size_147
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (small)
% @values v7_36=7.36 unk_sidecut_radius_size_147=Unknown
% @importance 1.00

0.95::acc(s16, sidecut_radius_size_147).
0.90::true_val(sidecut_radius_size_147, v7_36); 0.10::true_val(sidecut_radius_size_147, unk_sidecut_radius_size_147).
measured(s16, sidecut_radius_size_147, v7_36).
all_consistent(sidecut_radius_size_147) :- consistent(s16, sidecut_radius_size_147).
evidence(all_consistent(sidecut_radius_size_147)).
query(true_val(sidecut_radius_size_147, v7_36)).
query(true_val(sidecut_radius_size_147, unk_sidecut_radius_size_147)).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size
% @values v7_90=7.90 unk_sidecut_radius_size=Unknown
% @importance 1.00

0.95::acc(s16, sidecut_radius_size).
0.90::true_val(sidecut_radius_size, v7_90); 0.10::true_val(sidecut_radius_size, unk_sidecut_radius_size).
measured(s16, sidecut_radius_size, v7_90).
all_consistent(sidecut_radius_size) :- consistent(s16, sidecut_radius_size).
evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_90)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr sidecut_radius_size_159
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (large)
% @values v8_14=8.14 unk_sidecut_radius_size_159=Unknown
% @importance 1.00

0.95::acc(s16, sidecut_radius_size_159).
0.90::true_val(sidecut_radius_size_159, v8_14); 0.10::true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159).
measured(s16, sidecut_radius_size_159, v8_14).
all_consistent(sidecut_radius_size_159) :- consistent(s16, sidecut_radius_size_159).
evidence(all_consistent(sidecut_radius_size_159)).
query(true_val(sidecut_radius_size_159, v8_14)).
query(true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159)).

% @attr contact_length_size_147
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size (small)
% @values v107_2=107.2 unk_contact_length_size_147=Unknown
% @importance 1.00

0.95::acc(s16, contact_length_size_147).
0.90::true_val(contact_length_size_147, v107_2); 0.10::true_val(contact_length_size_147, unk_contact_length_size_147).
measured(s16, contact_length_size_147, v107_2).
all_consistent(contact_length_size_147) :- consistent(s16, contact_length_size_147).
evidence(all_consistent(contact_length_size_147)).
query(true_val(contact_length_size_147, v107_2)).
query(true_val(contact_length_size_147, unk_contact_length_size_147)).

% @attr contact_length_size
% @type numeric
% @unit cm
% @canonical true
% @original_name contact_length_size
% @values v115_0=115.0 unk_contact_length_size=Unknown
% @importance 1.00

0.95::acc(s16, contact_length_size).
0.90::true_val(contact_length_size, v115_0); 0.10::true_val(contact_length_size, unk_contact_length_size).
measured(s16, contact_length_size, v115_0).
all_consistent(contact_length_size) :- consistent(s16, contact_length_size).
evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v115_0)).
query(true_val(contact_length_size, unk_contact_length_size)).

% @attr contact_length_size_159
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size (large)
% @values v118_5=118.5 unk_contact_length_size_159=Unknown
% @importance 1.00

0.95::acc(s16, contact_length_size_159).
0.90::true_val(contact_length_size_159, v118_5); 0.10::true_val(contact_length_size_159, unk_contact_length_size_159).
measured(s16, contact_length_size_159, v118_5).
all_consistent(contact_length_size_159) :- consistent(s16, contact_length_size_159).
evidence(all_consistent(contact_length_size_159)).
query(true_val(contact_length_size_159, v118_5)).
query(true_val(contact_length_size_159, unk_contact_length_size_159)).

% @attr stance_width_range_size_147
% @type categorical
% @unit cm
% @canonical false
% @original_name stance_width_range_size (small)
% @values v46_8_58_8=46.8-58.8 unk_stance_width_range_size_147=Unknown
% @importance 1.00

0.95::acc(s16, stance_width_range_size_147).
0.90::true_val(stance_width_range_size_147, v46_8_58_8); 0.10::true_val(stance_width_range_size_147, unk_stance_width_range_size_147).
measured(s16, stance_width_range_size_147, v46_8_58_8).
all_consistent(stance_width_range_size_147) :- consistent(s16, stance_width_range_size_147).
evidence(all_consistent(stance_width_range_size_147)).
query(true_val(stance_width_range_size_147, v46_8_58_8)).
query(true_val(stance_width_range_size_147, unk_stance_width_range_size_147)).

% @attr stance_width_range_size
% @type categorical
% @unit cm
% @canonical true
% @original_name stance_width_range_size
% @values v49_3_61_3=49.3-61.3 unk_stance_width_range_size=Unknown
% @importance 1.00

0.95::acc(s16, stance_width_range_size).
0.90::true_val(stance_width_range_size, v49_3_61_3); 0.10::true_val(stance_width_range_size, unk_stance_width_range_size).
measured(s16, stance_width_range_size, v49_3_61_3).
all_consistent(stance_width_range_size) :- consistent(s16, stance_width_range_size).
evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v49_3_61_3)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr stance_width_range_size_159
% @type categorical
% @unit cm
% @canonical false
% @original_name stance_width_range_size (large)
% @values v51_9_63_9=51.9-63.9 unk_stance_width_range_size_159=Unknown
% @importance 1.00

0.95::acc(s16, stance_width_range_size_159).
0.90::true_val(stance_width_range_size_159, v51_9_63_9); 0.10::true_val(stance_width_range_size_159, unk_stance_width_range_size_159).
measured(s16, stance_width_range_size_159, v51_9_63_9).
all_consistent(stance_width_range_size_159) :- consistent(s16, stance_width_range_size_159).
evidence(all_consistent(stance_width_range_size_159)).
query(true_val(stance_width_range_size_159, v51_9_63_9)).
query(true_val(stance_width_range_size_159, unk_stance_width_range_size_159)).

% @attr recommended_weight_range_size_147
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (147)
% @values v45_63=45-63kg unk_recommended_weight_range_size_147=Unknown
% @importance 1.00

0.95::acc(s16, recommended_weight_range_size_147).
0.90::true_val(recommended_weight_range_size_147, v45_63); 0.10::true_val(recommended_weight_range_size_147, unk_recommended_weight_range_size_147).
measured(s16, recommended_weight_range_size_147, v45_63).
all_consistent(recommended_weight_range_size_147) :- consistent(s16, recommended_weight_range_size_147).
evidence(all_consistent(recommended_weight_range_size_147)).
query(true_val(recommended_weight_range_size_147, v45_63)).
query(true_val(recommended_weight_range_size_147, unk_recommended_weight_range_size_147)).

% @attr recommended_weight_range_size_150
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (150)
% @values v47_5_66=47.5-66kg unk_recommended_weight_range_size_150=Unknown
% @importance 1.00

0.95::acc(s16, recommended_weight_range_size_150).
0.90::true_val(recommended_weight_range_size_150, v47_5_66); 0.10::true_val(recommended_weight_range_size_150, unk_recommended_weight_range_size_150).
measured(s16, recommended_weight_range_size_150, v47_5_66).
all_consistent(recommended_weight_range_size_150) :- consistent(s16, recommended_weight_range_size_150).
evidence(all_consistent(recommended_weight_range_size_150)).
query(true_val(recommended_weight_range_size_150, v47_5_66)).
query(true_val(recommended_weight_range_size_150, unk_recommended_weight_range_size_150)).

% @attr recommended_weight_range_size_153
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (153)
% @values v53_5_72=53.5-72kg unk_recommended_weight_range_size_153=Unknown
% @importance 1.00

0.95::acc(s16, recommended_weight_range_size_153).
0.90::true_val(recommended_weight_range_size_153, v53_5_72); 0.10::true_val(recommended_weight_range_size_153, unk_recommended_weight_range_size_153).
measured(s16, recommended_weight_range_size_153, v53_5_72).
all_consistent(recommended_weight_range_size_153) :- consistent(s16, recommended_weight_range_size_153).
evidence(all_consistent(recommended_weight_range_size_153)).
query(true_val(recommended_weight_range_size_153, v53_5_72)).
query(true_val(recommended_weight_range_size_153, unk_recommended_weight_range_size_153)).

% @attr recommended_weight_range_size_154w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (154W)
% @values v58_76_5=58-76.5kg unk_recommended_weight_range_size_154w=Unknown
% @importance 1.00

0.95::acc(s16, recommended_weight_range_size_154w).
0.90::true_val(recommended_weight_range_size_154w, v58_76_5); 0.10::true_val(recommended_weight_range_size_154w, unk_recommended_weight_range_size_154w).
measured(s16, recommended_weight_range_size_154w, v58_76_5).
all_consistent(recommended_weight_range_size_154w) :- consistent(s16, recommended_weight_range_size_154w).
evidence(all_consistent(recommended_weight_range_size_154w)).
query(true_val(recommended_weight_range_size_154w, v58_76_5)).
query(true_val(recommended_weight_range_size_154w, unk_recommended_weight_range_size_154w)).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size (156)
% @values v59_77_5=59-77.5kg v65_85=65-85kg
% @importance 0.93

0.95::acc(s16, recommended_weight_range_size).
0.60::acc(s3, recommended_weight_range_size).
0.60::true_val(recommended_weight_range_size, v59_77_5); 0.40::true_val(recommended_weight_range_size, v65_85).
measured(s16, recommended_weight_range_size, v59_77_5).
measured(s3, recommended_weight_range_size, v65_85).
all_consistent(recommended_weight_range_size) :-
    consistent(s16, recommended_weight_range_size),
    (indep(s3), consistent(s3, recommended_weight_range_size) ; \+indep(s3)).
evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, v59_77_5)).
query(true_val(recommended_weight_range_size, v65_85)).

% @attr recommended_weight_range_size_157w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (157W)
% @values v63_5_82=63.5-82kg v75_95=75-95kg
% @importance 0.93

0.95::acc(s16, recommended_weight_range_size_157w).
0.60::acc(s3, recommended_weight_range_size_157w).
0.60::true_val(recommended_weight_range_size_157w, v63_5_82); 0.40::true_val(recommended_weight_range_size_157w, v75_95).
measured(s16, recommended_weight_range_size_157w, v63_5_82).
measured(s3, recommended_weight_range_size_157w, v75_95).
all_consistent(recommended_weight_range_size_157w) :-
    consistent(s16, recommended_weight_range_size_157w),
    (indep(s3), consistent(s3, recommended_weight_range_size_157w) ; \+indep(s3)).
evidence(all_consistent(recommended_weight_range_size_157w)).
query(true_val(recommended_weight_range_size_157w, v63_5_82)).
query(true_val(recommended_weight_range_size_157w, v75_95)).

% @attr recommended_weight_range_size_159
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (159)
% @values v64_5_82_5=64.5-82.5kg v71_91=71-91kg
% @importance 0.93

0.95::acc(s16, recommended_weight_range_size_159).
0.60::acc(s3, recommended_weight_range_size_159).
0.55::true_val(recommended_weight_range_size_159, v64_5_82_5); 0.45::true_val(recommended_weight_range_size_159, v71_91).
measured(s16, recommended_weight_range_size_159, v64_5_82_5).
measured(s3, recommended_weight_range_size_159, v71_91).
all_consistent(recommended_weight_range_size_159) :-
    consistent(s16, recommended_weight_range_size_159),
    (indep(s3), consistent(s3, recommended_weight_range_size_159) ; \+indep(s3)).
evidence(all_consistent(recommended_weight_range_size_159)).
query(true_val(recommended_weight_range_size_159, v64_5_82_5)).
query(true_val(recommended_weight_range_size_159, v71_91)).

% @attr recommended_weight_range_size_160w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (160W)
% @values v69_87_5=69-87.5kg unk_recommended_weight_range_size_160w=Unknown
% @importance 1.00

0.95::acc(s16, recommended_weight_range_size_160w).
0.90::true_val(recommended_weight_range_size_160w, v69_87_5); 0.10::true_val(recommended_weight_range_size_160w, unk_recommended_weight_range_size_160w).
measured(s16, recommended_weight_range_size_160w, v69_87_5).
all_consistent(recommended_weight_range_size_160w) :- consistent(s16, recommended_weight_range_size_160w).
evidence(all_consistent(recommended_weight_range_size_160w)).
query(true_val(recommended_weight_range_size_160w, v69_87_5)).
query(true_val(recommended_weight_range_size_160w, unk_recommended_weight_range_size_160w)).

% @attr boot_size_147_153
% @type categorical
% @unit us
% @canonical false
% @original_name Boot size (US) for 147-153cm
% @values us6_9=6-9_US unk_boot_size_147_153=Unknown
% @importance 1.00

0.95::acc(s16, boot_size_147_153).
0.90::true_val(boot_size_147_153, us6_9); 0.10::true_val(boot_size_147_153, unk_boot_size_147_153).
measured(s16, boot_size_147_153, us6_9).
all_consistent(boot_size_147_153) :- consistent(s16, boot_size_147_153).
evidence(all_consistent(boot_size_147_153)).
query(true_val(boot_size_147_153, us6_9)).
query(true_val(boot_size_147_153, unk_boot_size_147_153)).

% @attr boot_size_154w_157w
% @type categorical
% @unit us
% @canonical false
% @original_name Boot size (US) for 154W-157W
% @values us8_12=8-12_US unk_boot_size_154w_157w=Unknown
% @importance 1.00

0.95::acc(s16, boot_size_154w_157w).
0.90::true_val(boot_size_154w_157w, us8_12); 0.10::true_val(boot_size_154w_157w, unk_boot_size_154w_157w).
measured(s16, boot_size_154w_157w, us8_12).
all_consistent(boot_size_154w_157w) :- consistent(s16, boot_size_154w_157w).
evidence(all_consistent(boot_size_154w_157w)).
query(true_val(boot_size_154w_157w, us8_12)).
query(true_val(boot_size_154w_157w, unk_boot_size_154w_157w)).

% @attr boot_size_156_159
% @type categorical
% @unit us
% @canonical false
% @original_name Boot size (US) for 156-159cm
% @values us7_10=7-10_US unk_boot_size_156_159=Unknown
% @importance 1.00

0.95::acc(s16, boot_size_156_159).
0.90::true_val(boot_size_156_159, us7_10); 0.10::true_val(boot_size_156_159, unk_boot_size_156_159).
measured(s16, boot_size_156_159, us7_10).
all_consistent(boot_size_156_159) :- consistent(s16, boot_size_156_159).
evidence(all_consistent(boot_size_156_159)).
query(true_val(boot_size_156_159, us7_10)).
query(true_val(boot_size_156_159, unk_boot_size_156_159)).

% @attr boot_size_160w
% @type categorical
% @unit us
% @canonical false
% @original_name Boot size (US) for 160W
% @values us9_12=9-12_US unk_boot_size_160w=Unknown
% @importance 1.00

0.95::acc(s16, boot_size_160w).
0.90::true_val(boot_size_160w, us9_12); 0.10::true_val(boot_size_160w, unk_boot_size_160w).
measured(s16, boot_size_160w, us9_12).
all_consistent(boot_size_160w) :- consistent(s16, boot_size_160w).
evidence(all_consistent(boot_size_160w)).
query(true_val(boot_size_160w, us9_12)).
query(true_val(boot_size_160w, unk_boot_size_160w)).

% @attr terrain_suitability
% @type numeric
% @unit /10
% @canonical true
% @original_name terrain_suitability (Park)
% @values v9=9.0 unk_terrain_suitability=Unknown
% @importance 0.85

0.95::acc(s16, terrain_suitability).
0.70::acc(s1, terrain_suitability).
0.97::true_val(terrain_suitability, v9); 0.03::true_val(terrain_suitability, unk_terrain_suitability).
measured(s16, terrain_suitability, v9).
measured(s1, terrain_suitability, v9).
all_consistent(terrain_suitability) :-
    consistent(s16, terrain_suitability),
    (indep(s1), consistent(s1, terrain_suitability) ; \+indep(s1)).
evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, v9)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr terrain_suitability_all_mountain
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability (All Mountain)
% @values v6=6.0 unk_terrain_suitability_all_mountain=Unknown
% @importance 0.85

0.95::acc(s16, terrain_suitability_all_mountain).
0.70::acc(s1, terrain_suitability_all_mountain).
0.95::true_val(terrain_suitability_all_mountain, v6); 0.05::true_val(terrain_suitability_all_mountain, unk_terrain_suitability_all_mountain).
measured(s16, terrain_suitability_all_mountain, v6).
measured(s1, terrain_suitability_all_mountain, v6).
all_consistent(terrain_suitability_all_mountain) :-
    consistent(s16, terrain_suitability_all_mountain),
    (indep(s1), consistent(s1, terrain_suitability_all_mountain) ; \+indep(s1)).
evidence(all_consistent(terrain_suitability_all_mountain)).
query(true_val(terrain_suitability_all_mountain, v6)).
query(true_val(terrain_suitability_all_mountain, unk_terrain_suitability_all_mountain)).

% @attr terrain_suitability_powder
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability (Powder)
% @values v4=4.0 unk_terrain_suitability_powder=Unknown
% @importance 0.85

0.95::acc(s16, terrain_suitability_powder).
0.70::acc(s1, terrain_suitability_powder).
0.95::true_val(terrain_suitability_powder, v4); 0.05::true_val(terrain_suitability_powder, unk_terrain_suitability_powder).
measured(s16, terrain_suitability_powder, v4).
measured(s1, terrain_suitability_powder, v4).
all_consistent(terrain_suitability_powder) :-
    consistent(s16, terrain_suitability_powder),
    (indep(s1), consistent(s1, terrain_suitability_powder) ; \+indep(s1)).
evidence(all_consistent(terrain_suitability_powder)).
query(true_val(terrain_suitability_powder, v4)).
query(true_val(terrain_suitability_powder, unk_terrain_suitability_powder)).

% @attr terrain_suitability_description
% @type categorical
% @canonical false
% @original_name terrain_suitability (description)
% @values park_rails_bonks_sidehits=Park_rails_bonk_features_side_hits unk_terrain_suitability_description=Unknown
% @importance 0.90

0.95::acc(s16, terrain_suitability_description).
0.90::true_val(terrain_suitability_description, park_rails_bonks_sidehits); 0.10::true_val(terrain_suitability_description, unk_terrain_suitability_description).
measured(s16, terrain_suitability_description, park_rails_bonks_sidehits).
all_consistent(terrain_suitability_description) :- consistent(s16, terrain_suitability_description).
evidence(all_consistent(terrain_suitability_description)).
query(true_val(terrain_suitability_description, park_rails_bonks_sidehits)).
query(true_val(terrain_suitability_description, unk_terrain_suitability_description)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values freestyle_park_creative=Freestyle_park_creativity_progression unk_riding_style=Unknown
% @importance 0.90

0.95::acc(s16, riding_style).
0.90::true_val(riding_style, freestyle_park_creative); 0.10::true_val(riding_style, unk_riding_style).
measured(s16, riding_style, freestyle_park_creative).
all_consistent(riding_style) :- consistent(s16, riding_style).
evidence(all_consistent(riding_style)).
query(true_val(riding_style, freestyle_park_creative)).
query(true_val(riding_style, unk_riding_style)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values beginner_intermediate=Beginner-Intermediate intermediate_advanced=Intermediate-Advanced
% @importance 0.88

0.70::acc(s1, skill_level_recommendation).
0.80::acc(s18, skill_level_recommendation).
0.85::acc(s17, skill_level_recommendation).
0.35::true_val(skill_level_recommendation, beginner_intermediate); 0.65::true_val(skill_level_recommendation, intermediate_advanced).
measured(s1, skill_level_recommendation, beginner_intermediate).
measured(s18, skill_level_recommendation, intermediate_advanced).
measured(s17, skill_level_recommendation, intermediate_advanced).
all_consistent(skill_level_recommendation) :-
    (indep(s1), consistent(s1, skill_level_recommendation) ; \+indep(s1)),
    (indep(s18), consistent(s18, skill_level_recommendation) ; \+indep(s18)),
    consistent(s17, skill_level_recommendation).
evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, beginner_intermediate)).
query(true_val(skill_level_recommendation, intermediate_advanced)).

% @attr board_weight_grams
% @type numeric
% @unit g
% @canonical true
% @original_name board_weight_grams
% @values v3080=3080.0 unk_board_weight_grams=Unknown
% @importance 0.90

0.90::acc(s17, board_weight_grams).
0.72::true_val(board_weight_grams, v3080); 0.28::true_val(board_weight_grams, unk_board_weight_grams).
measured(s17, board_weight_grams, v3080).
all_consistent(board_weight_grams) :- consistent(s17, board_weight_grams).
evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v3080)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr weight_per_cm
% @type numeric
% @unit g/cm
% @canonical false
% @original_name weight_per_cm
% @values v19_74=19.74 unk_weight_per_cm=Unknown
% @importance 0.90

0.88::acc(s17, weight_per_cm).
0.72::true_val(weight_per_cm, v19_74); 0.28::true_val(weight_per_cm, unk_weight_per_cm).
measured(s17, weight_per_cm, v19_74).
all_consistent(weight_per_cm) :- consistent(s17, weight_per_cm).
evidence(all_consistent(weight_per_cm)).
query(true_val(weight_per_cm, v19_74)).
query(true_val(weight_per_cm, unk_weight_per_cm)).

% @attr reviewer_opinion_snowboardingprofiles_weight
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (weight)
% @values normal_touch_heavier=Felt_normal_maybe_touch_heavier unk_reviewer_opinion_snowboardingprofiles_weight=Unknown
% @importance 0.90

0.82::acc(s17, reviewer_opinion_snowboardingprofiles_weight).
0.72::true_val(reviewer_opinion_snowboardingprofiles_weight, normal_touch_heavier); 0.28::true_val(reviewer_opinion_snowboardingprofiles_weight, unk_reviewer_opinion_snowboardingprofiles_weight).
measured(s17, reviewer_opinion_snowboardingprofiles_weight, normal_touch_heavier).
all_consistent(reviewer_opinion_snowboardingprofiles_weight) :- consistent(s17, reviewer_opinion_snowboardingprofiles_weight).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles_weight)).
query(true_val(reviewer_opinion_snowboardingprofiles_weight, normal_touch_heavier)).
query(true_val(reviewer_opinion_snowboardingprofiles_weight, unk_reviewer_opinion_snowboardingprofiles_weight)).

% @attr reviewer_opinion_the_good_ride_weight
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (weight)
% @values feels_normal=Feels_normal unk_reviewer_opinion_the_good_ride_weight=Unknown
% @importance 0.80

0.78::acc(s19, reviewer_opinion_the_good_ride_weight).
0.56::true_val(reviewer_opinion_the_good_ride_weight, feels_normal); 0.44::true_val(reviewer_opinion_the_good_ride_weight, unk_reviewer_opinion_the_good_ride_weight).
measured(s19, reviewer_opinion_the_good_ride_weight, feels_normal).
all_consistent(reviewer_opinion_the_good_ride_weight) :- consistent(s19, reviewer_opinion_the_good_ride_weight).
evidence(all_consistent(reviewer_opinion_the_good_ride_weight)).
query(true_val(reviewer_opinion_the_good_ride_weight, feels_normal)).
query(true_val(reviewer_opinion_the_good_ride_weight, unk_reviewer_opinion_the_good_ride_weight)).

% @attr camber_height_mm
% @type numeric
% @unit mm
% @canonical true
% @original_name camber_height_mm
% @values v4_5=4.5 unk_camber_height_mm=Unknown
% @importance 0.65

0.90::acc(s24, camber_height_mm).
0.68::true_val(camber_height_mm, v4_5); 0.32::true_val(camber_height_mm, unk_camber_height_mm).
measured(s24, camber_height_mm, v4_5).
all_consistent(camber_height_mm) :- consistent(s24, camber_height_mm).
evidence(all_consistent(camber_height_mm)).
query(true_val(camber_height_mm, v4_5)).
query(true_val(camber_height_mm, unk_camber_height_mm)).

% @attr price_usd_msrp
% @type numeric
% @unit usd
% @canonical true
% @original_name price_usd_msrp
% @values v499_95=499.95 v499=499.0
% @importance 0.87

0.95::acc(s16, price_usd_msrp).
0.82::acc(s17, price_usd_msrp).
0.65::acc(s26, price_usd_msrp).
0.65::true_val(price_usd_msrp, v499_95); 0.30::true_val(price_usd_msrp, v499); 0.05::true_val(price_usd_msrp, unk_price_usd_msrp).
measured(s16, price_usd_msrp, v499_95).
measured(s17, price_usd_msrp, v499).
measured(s26, price_usd_msrp, v499_95).
all_consistent(price_usd_msrp) :-
    consistent(s16, price_usd_msrp),
    consistent(s17, price_usd_msrp),
    (indep(s26), consistent(s26, price_usd_msrp) ; \+indep(s26)).
evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v499_95)).
query(true_val(price_usd_msrp, v499)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_usd_evo
% @type numeric
% @unit usd
% @canonical true
% @original_name price_usd_evo
% @values v499_95=499.95 unk_price_usd_evo=Unknown
% @importance 0.90

0.85::acc(s25, price_usd_evo).
0.81::true_val(price_usd_evo, v499_95); 0.19::true_val(price_usd_evo, unk_price_usd_evo).
measured(s25, price_usd_evo, v499_95).
all_consistent(price_usd_evo) :-
    (indep(s25), consistent(s25, price_usd_evo) ; \+indep(s25)).
evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v499_95)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_evo_sale
% @type numeric
% @unit usd
% @canonical false
% @original_name price_usd_evo (sale)
% @values v247_47=247.47 unk_price_usd_evo_sale=Unknown
% @importance 0.90

0.85::acc(s25, price_usd_evo_sale).
0.81::true_val(price_usd_evo_sale, v247_47); 0.19::true_val(price_usd_evo_sale, unk_price_usd_evo_sale).
measured(s25, price_usd_evo_sale, v247_47).
all_consistent(price_usd_evo_sale) :-
    (indep(s25), consistent(s25, price_usd_evo_sale) ; \+indep(s25)).
evidence(all_consistent(price_usd_evo_sale)).
query(true_val(price_usd_evo_sale, v247_47)).
query(true_val(price_usd_evo_sale, unk_price_usd_evo_sale)).

% @attr price_aud_merchant
% @type numeric
% @unit aud
% @canonical true
% @original_name price_aud_merchant
% @values v849_99=849.99 unk_price_aud_merchant=Unknown
% @importance 0.83

0.65::acc(s3, price_aud_merchant).
0.70::acc(s1, price_aud_merchant).
0.90::true_val(price_aud_merchant, v849_99); 0.10::true_val(price_aud_merchant, unk_price_aud_merchant).
measured(s3, price_aud_merchant, v849_99).
measured(s1, price_aud_merchant, v849_99).
all_consistent(price_aud_merchant) :-
    (indep(s3), consistent(s3, price_aud_merchant) ; \+indep(s3)),
    (indep(s1), consistent(s1, price_aud_merchant) ; \+indep(s1)).
evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v849_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_aud_merchant_preorder
% @type categorical
% @canonical false
% @original_name price_aud_merchant (preorder status)
% @values available_preorder=Available_for_preorder unk_price_aud_merchant_preorder=Unknown
% @importance 0.80

0.70::acc(s1, price_aud_merchant_preorder).
0.63::true_val(price_aud_merchant_preorder, available_preorder); 0.37::true_val(price_aud_merchant_preorder, unk_price_aud_merchant_preorder).
measured(s1, price_aud_merchant_preorder, available_preorder).
all_consistent(price_aud_merchant_preorder) :-
    (indep(s1), consistent(s1, price_aud_merchant_preorder) ; \+indep(s1)).
evidence(all_consistent(price_aud_merchant_preorder)).
query(true_val(price_aud_merchant_preorder, available_preorder)).
query(true_val(price_aud_merchant_preorder, unk_price_aud_merchant_preorder)).

% @attr price_usd_backcountry
% @type numeric
% @unit usd
% @canonical false
% @original_name price_usd_backcountry
% @values v447_96=447.96 unk_price_usd_backcountry=Unknown
% @importance 0.80

0.78::acc(s19, price_usd_backcountry).
0.56::true_val(price_usd_backcountry, v447_96); 0.44::true_val(price_usd_backcountry, unk_price_usd_backcountry).
measured(s19, price_usd_backcountry, v447_96).
all_consistent(price_usd_backcountry) :- consistent(s19, price_usd_backcountry).
evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v447_96)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

% @attr ebay_prices
% @type categorical
% @unit usd
% @canonical false
% @original_name eBay prices (various years/conditions)
% @values range_280_480=280-480_USD_various unk_ebay_prices=Unknown
% @importance 0.50

0.55::acc(s27, ebay_prices).
0.30::true_val(ebay_prices, range_280_480); 0.70::true_val(ebay_prices, unk_ebay_prices).
measured(s27, ebay_prices, range_280_480).
all_consistent(ebay_prices) :- consistent(s27, ebay_prices).
evidence(all_consistent(ebay_prices)).
query(true_val(ebay_prices, range_280_480)).
query(true_val(ebay_prices, unk_ebay_prices)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status (Rome US)
% @values mostly_sold_out_160w_left=Most_sizes_sold_out_160W_left unk_availability_status=Unknown
% @importance 1.00

0.95::acc(s16, availability_status).
0.90::true_val(availability_status, mostly_sold_out_160w_left); 0.10::true_val(availability_status, unk_availability_status).
measured(s16, availability_status, mostly_sold_out_160w_left).
all_consistent(availability_status) :- consistent(s16, availability_status).
evidence(all_consistent(availability_status)).
query(true_val(availability_status, mostly_sold_out_160w_left)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_rome_eu
% @type categorical
% @canonical false
% @original_name availability_status (Rome EU)
% @values all_sold_out=All_sizes_sold_out unk_availability_status_rome_eu=Unknown
% @importance 0.70

0.92::acc(s14, availability_status_rome_eu).
0.90::true_val(availability_status_rome_eu, all_sold_out); 0.10::true_val(availability_status_rome_eu, unk_availability_status_rome_eu).
measured(s14, availability_status_rome_eu, all_sold_out).
all_consistent(availability_status_rome_eu) :- consistent(s14, availability_status_rome_eu).
evidence(all_consistent(availability_status_rome_eu)).
query(true_val(availability_status_rome_eu, all_sold_out)).
query(true_val(availability_status_rome_eu, unk_availability_status_rome_eu)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status (evo)
% @values in_stock=In_stock unk_availability_status_evo=Unknown
% @importance 0.90

0.85::acc(s25, availability_status_evo).
0.81::true_val(availability_status_evo, in_stock); 0.19::true_val(availability_status_evo, unk_availability_status_evo).
measured(s25, availability_status_evo, in_stock).
all_consistent(availability_status_evo) :-
    (indep(s25), consistent(s25, availability_status_evo) ; \+indep(s25)).
evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, in_stock)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

% @attr estimated_availability_date
% @type categorical
% @canonical false
% @original_name estimated_availability_date
% @values may_2026_preorder=Preorder_estimated_May_2026_delivery unk_estimated_availability_date=Unknown
% @importance 0.85

0.65::acc(s3, estimated_availability_date).
0.48::true_val(estimated_availability_date, may_2026_preorder); 0.52::true_val(estimated_availability_date, unk_estimated_availability_date).
measured(s3, estimated_availability_date, may_2026_preorder).
all_consistent(estimated_availability_date) :-
    (indep(s3), consistent(s3, estimated_availability_date) ; \+indep(s3)).
evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, may_2026_preorder)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

% @attr availability_status_melbourne
% @type categorical
% @canonical false
% @original_name availability_status (Melbourne)
% @values available_preorder=Available_for_preorder unk_availability_status_melbourne=Unknown
% @importance 0.80

0.70::acc(s1, availability_status_melbourne).
0.63::true_val(availability_status_melbourne, available_preorder); 0.37::true_val(availability_status_melbourne, unk_availability_status_melbourne).
measured(s1, availability_status_melbourne, available_preorder).
all_consistent(availability_status_melbourne) :-
    (indep(s1), consistent(s1, availability_status_melbourne) ; \+indep(s1)).
evidence(all_consistent(availability_status_melbourne)).
query(true_val(availability_status_melbourne, available_preorder)).
query(true_val(availability_status_melbourne, unk_availability_status_melbourne)).

% @attr availability_status_skipro
% @type categorical
% @canonical false
% @original_name availability_status (SkiPro)
% @values sold_out=Sold_out_all_sizes unk_availability_status_skipro=Unknown
% @importance 0.70

0.65::acc(s26, availability_status_skipro).
0.55::true_val(availability_status_skipro, sold_out); 0.45::true_val(availability_status_skipro, unk_availability_status_skipro).
measured(s26, availability_status_skipro, sold_out).
all_consistent(availability_status_skipro) :-
    (indep(s26), consistent(s26, availability_status_skipro) ; \+indep(s26)).
evidence(all_consistent(availability_status_skipro)).
query(true_val(availability_status_skipro, sold_out)).
query(true_val(availability_status_skipro, unk_availability_status_skipro)).

% @attr availability_status_skatepro
% @type categorical
% @canonical false
% @original_name availability_status (SkatePro)
% @values listed_available=Listed_as_available unk_availability_status_skatepro=Unknown
% @importance 0.50

0.65::acc(s28, availability_status_skatepro).
0.52::true_val(availability_status_skatepro, listed_available); 0.48::true_val(availability_status_skatepro, unk_availability_status_skatepro).
measured(s28, availability_status_skatepro, listed_available).
all_consistent(availability_status_skatepro) :-
    (indep(s28), consistent(s28, availability_status_skatepro) ; \+indep(s28)).
evidence(all_consistent(availability_status_skatepro)).
query(true_val(availability_status_skatepro, listed_available)).
query(true_val(availability_status_skatepro, unk_availability_status_skatepro)).

% @attr availability_status_ebay
% @type categorical
% @canonical false
% @original_name availability_status (eBay)
% @values secondary_market=Secondary_market_various unk_availability_status_ebay=Unknown
% @importance 0.50

0.55::acc(s27, availability_status_ebay).
0.30::true_val(availability_status_ebay, secondary_market); 0.70::true_val(availability_status_ebay, unk_availability_status_ebay).
measured(s27, availability_status_ebay, secondary_market).
all_consistent(availability_status_ebay) :- consistent(s27, availability_status_ebay).
evidence(all_consistent(availability_status_ebay)).
query(true_val(availability_status_ebay, secondary_market)).
query(true_val(availability_status_ebay, unk_availability_status_ebay)).

% @attr warranty_period_years
% @type categorical
% @unit years
% @canonical true
% @original_name warranty_period_years
% @values two_year_limited=2_year_limited_warranty unk_warranty_period_years=Unknown
% @importance 0.80

0.95::acc(s29, warranty_period_years).
0.90::true_val(warranty_period_years, two_year_limited); 0.10::true_val(warranty_period_years, unk_warranty_period_years).
measured(s29, warranty_period_years, two_year_limited).
all_consistent(warranty_period_years) :- consistent(s29, warranty_period_years).
evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, two_year_limited)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

% @attr warranty_period_years_extended
% @type categorical
% @unit years
% @canonical false
% @original_name warranty_period_years (extended)
% @values two_plus_one=2_plus_1_year_3_total_if_registered unk_warranty_period_years_extended=Unknown
% @importance 0.75

0.95::acc(s30, warranty_period_years_extended).
0.90::true_val(warranty_period_years_extended, two_plus_one); 0.10::true_val(warranty_period_years_extended, unk_warranty_period_years_extended).
measured(s30, warranty_period_years_extended, two_plus_one).
all_consistent(warranty_period_years_extended) :- consistent(s30, warranty_period_years_extended).
evidence(all_consistent(warranty_period_years_extended)).
query(true_val(warranty_period_years_extended, two_plus_one)).
query(true_val(warranty_period_years_extended, unk_warranty_period_years_extended)).

% @attr warranty_coverage
% @type categorical
% @canonical false
% @original_name warranty (coverage details)
% @values delam_inserts_topsheet=Delamination_inserts_cracked_topsheet unk_warranty_coverage=Unknown
% @importance 0.80

0.95::acc(s29, warranty_coverage).
0.90::true_val(warranty_coverage, delam_inserts_topsheet); 0.10::true_val(warranty_coverage, unk_warranty_coverage).
measured(s29, warranty_coverage, delam_inserts_topsheet).
all_consistent(warranty_coverage) :- consistent(s29, warranty_coverage).
evidence(all_consistent(warranty_coverage)).
query(true_val(warranty_coverage, delam_inserts_topsheet)).
query(true_val(warranty_coverage, unk_warranty_coverage)).

% @attr return_policy_terms
% @type categorical
% @canonical true
% @original_name return_policy_terms
% @values forty_five_day=45_day_return_period unk_return_policy_terms=Unknown
% @importance 0.80

0.95::acc(s31, return_policy_terms).
0.95::acc(s16, return_policy_terms).
0.95::true_val(return_policy_terms, forty_five_day); 0.05::true_val(return_policy_terms, unk_return_policy_terms).
measured(s31, return_policy_terms, forty_five_day).
measured(s16, return_policy_terms, forty_five_day).
all_consistent(return_policy_terms) :-
    consistent(s31, return_policy_terms),
    consistent(s16, return_policy_terms).
evidence(all_consistent(return_policy_terms)).
query(true_val(return_policy_terms, forty_five_day)).
query(true_val(return_policy_terms, unk_return_policy_terms)).

% @attr binding_warranty
% @type categorical
% @canonical false
% @original_name Binding warranty
% @values lifetime_parts=Lifetime_parts_warranty_on_bindings unk_binding_warranty=Unknown
% @importance 0.55

0.72::acc(s32, binding_warranty).
0.56::true_val(binding_warranty, lifetime_parts); 0.44::true_val(binding_warranty, unk_binding_warranty).
measured(s32, binding_warranty, lifetime_parts).
all_consistent(binding_warranty) :- consistent(s32, binding_warranty).
evidence(all_consistent(binding_warranty)).
query(true_val(binding_warranty, lifetime_parts)).
query(true_val(binding_warranty, unk_binding_warranty)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum (overall)
% @values high_rated_86rev_90pct_5star=86_reviews_90pct_five_star unk_user_review_forum=Unknown
% @importance 1.00

0.95::acc(s16, user_review_forum).
0.90::true_val(user_review_forum, high_rated_86rev_90pct_5star); 0.10::true_val(user_review_forum, unk_user_review_forum).
measured(s16, user_review_forum, high_rated_86rev_90pct_5star).
all_consistent(user_review_forum) :- consistent(s16, user_review_forum).
evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, high_rated_86rev_90pct_5star)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr overall_rating_snowboardingprofiles
% @type numeric
% @unit /100
% @canonical true
% @original_name overall_rating_snowboardingprofiles
% @values v83_2=83.2 unk_overall_rating_snowboardingprofiles=Unknown
% @importance 0.90

0.88::acc(s17, overall_rating_snowboardingprofiles).
0.72::true_val(overall_rating_snowboardingprofiles, v83_2); 0.28::true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles).
measured(s17, overall_rating_snowboardingprofiles, v83_2).
all_consistent(overall_rating_snowboardingprofiles) :- consistent(s17, overall_rating_snowboardingprofiles).
evidence(all_consistent(overall_rating_snowboardingprofiles)).
query(true_val(overall_rating_snowboardingprofiles, v83_2)).
query(true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles)).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name reviewer_opinion_snowboardingprofiles (ranking)
% @values rank_19_of_28=19th_out_of_28_freestyle_boards unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.90

0.85::acc(s17, reviewer_opinion_snowboardingprofiles).
0.72::true_val(reviewer_opinion_snowboardingprofiles, rank_19_of_28); 0.28::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).
measured(s17, reviewer_opinion_snowboardingprofiles, rank_19_of_28).
all_consistent(reviewer_opinion_snowboardingprofiles) :- consistent(s17, reviewer_opinion_snowboardingprofiles).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, rank_19_of_28)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

% @attr jump_rating_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical false
% @original_name SnowboardingProfiles jump rating
% @values v4_5=4.5 unk_jump_rating_snowboardingprofiles=Unknown
% @importance 0.90

0.88::acc(s17, jump_rating_snowboardingprofiles).
0.72::true_val(jump_rating_snowboardingprofiles, v4_5); 0.28::true_val(jump_rating_snowboardingprofiles, unk_jump_rating_snowboardingprofiles).
measured(s17, jump_rating_snowboardingprofiles, v4_5).
all_consistent(jump_rating_snowboardingprofiles) :- consistent(s17, jump_rating_snowboardingprofiles).
evidence(all_consistent(jump_rating_snowboardingprofiles)).
query(true_val(jump_rating_snowboardingprofiles, v4_5)).
query(true_val(jump_rating_snowboardingprofiles, unk_jump_rating_snowboardingprofiles)).

% @attr jibbing_rating_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical false
% @original_name SnowboardingProfiles jibbing rating
% @values v3_0=3.0 unk_jibbing_rating_snowboardingprofiles=Unknown
% @importance 0.90

0.88::acc(s17, jibbing_rating_snowboardingprofiles).
0.72::true_val(jibbing_rating_snowboardingprofiles, v3_0); 0.28::true_val(jibbing_rating_snowboardingprofiles, unk_jibbing_rating_snowboardingprofiles).
measured(s17, jibbing_rating_snowboardingprofiles, v3_0).
all_consistent(jibbing_rating_snowboardingprofiles) :- consistent(s17, jibbing_rating_snowboardingprofiles).
evidence(all_consistent(jibbing_rating_snowboardingprofiles)).
query(true_val(jibbing_rating_snowboardingprofiles, v3_0)).
query(true_val(jibbing_rating_snowboardingprofiles, unk_jibbing_rating_snowboardingprofiles)).

% @attr spin_rating_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical false
% @original_name SnowboardingProfiles spin rating
% @values v4_5=4.5 unk_spin_rating_snowboardingprofiles=Unknown
% @importance 0.90

0.88::acc(s17, spin_rating_snowboardingprofiles).
0.72::true_val(spin_rating_snowboardingprofiles, v4_5); 0.28::true_val(spin_rating_snowboardingprofiles, unk_spin_rating_snowboardingprofiles).
measured(s17, spin_rating_snowboardingprofiles, v4_5).
all_consistent(spin_rating_snowboardingprofiles) :- consistent(s17, spin_rating_snowboardingprofiles).
evidence(all_consistent(spin_rating_snowboardingprofiles)).
query(true_val(spin_rating_snowboardingprofiles, v4_5)).
query(true_val(spin_rating_snowboardingprofiles, unk_spin_rating_snowboardingprofiles)).

% @attr switch_rating_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical false
% @original_name SnowboardingProfiles switch rating
% @values v4_5=4.5 unk_switch_rating_snowboardingprofiles=Unknown
% @importance 0.90

0.88::acc(s17, switch_rating_snowboardingprofiles).
0.72::true_val(switch_rating_snowboardingprofiles, v4_5); 0.28::true_val(switch_rating_snowboardingprofiles, unk_switch_rating_snowboardingprofiles).
measured(s17, switch_rating_snowboardingprofiles, v4_5).
all_consistent(switch_rating_snowboardingprofiles) :- consistent(s17, switch_rating_snowboardingprofiles).
evidence(all_consistent(switch_rating_snowboardingprofiles)).
query(true_val(switch_rating_snowboardingprofiles, v4_5)).
query(true_val(switch_rating_snowboardingprofiles, unk_switch_rating_snowboardingprofiles)).

% @attr butter_rating_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical false
% @original_name SnowboardingProfiles butter rating
% @values v4_0=4.0 unk_butter_rating_snowboardingprofiles=Unknown
% @importance 0.90

0.88::acc(s17, butter_rating_snowboardingprofiles).
0.72::true_val(butter_rating_snowboardingprofiles, v4_0); 0.28::true_val(butter_rating_snowboardingprofiles, unk_butter_rating_snowboardingprofiles).
measured(s17, butter_rating_snowboardingprofiles, v4_0).
all_consistent(butter_rating_snowboardingprofiles) :- consistent(s17, butter_rating_snowboardingprofiles).
evidence(all_consistent(butter_rating_snowboardingprofiles)).
query(true_val(butter_rating_snowboardingprofiles, v4_0)).
query(true_val(butter_rating_snowboardingprofiles, unk_butter_rating_snowboardingprofiles)).

% @attr powder_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical true
% @original_name powder_score_snowboardingprofiles
% @values v2_0=2.0 unk_powder_score_snowboardingprofiles=Unknown
% @importance 0.90

0.88::acc(s17, powder_score_snowboardingprofiles).
0.72::true_val(powder_score_snowboardingprofiles, v2_0); 0.28::true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles).
measured(s17, powder_score_snowboardingprofiles, v2_0).
all_consistent(powder_score_snowboardingprofiles) :- consistent(s17, powder_score_snowboardingprofiles).
evidence(all_consistent(powder_score_snowboardingprofiles)).
query(true_val(powder_score_snowboardingprofiles, v2_0)).
query(true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles)).

% @attr speed_rating_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical false
% @original_name SnowboardingProfiles speed rating
% @values v3_0=3.0 unk_speed_rating_snowboardingprofiles=Unknown
% @importance 0.90

0.88::acc(s17, speed_rating_snowboardingprofiles).
0.72::true_val(speed_rating_snowboardingprofiles, v3_0); 0.28::true_val(speed_rating_snowboardingprofiles, unk_speed_rating_snowboardingprofiles).
measured(s17, speed_rating_snowboardingprofiles, v3_0).
all_consistent(speed_rating_snowboardingprofiles) :- consistent(s17, speed_rating_snowboardingprofiles).
evidence(all_consistent(speed_rating_snowboardingprofiles)).
query(true_val(speed_rating_snowboardingprofiles, v3_0)).
query(true_val(speed_rating_snowboardingprofiles, unk_speed_rating_snowboardingprofiles)).

% @attr carving_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical true
% @original_name carving_score_snowboardingprofiles
% @values v3_5=3.5 unk_carving_score_snowboardingprofiles=Unknown
% @importance 0.90

0.88::acc(s17, carving_score_snowboardingprofiles).
0.72::true_val(carving_score_snowboardingprofiles, v3_5); 0.28::true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles).
measured(s17, carving_score_snowboardingprofiles, v3_5).
all_consistent(carving_score_snowboardingprofiles) :- consistent(s17, carving_score_snowboardingprofiles).
evidence(all_consistent(carving_score_snowboardingprofiles)).
query(true_val(carving_score_snowboardingprofiles, v3_5)).
query(true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values true_camber_jib_park=One_of_few_true_camber_boards_in_jib_park unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.80

0.80::acc(s19, reviewer_opinion_the_good_ride).
0.56::true_val(reviewer_opinion_the_good_ride, true_camber_jib_park); 0.44::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).
measured(s19, reviewer_opinion_the_good_ride, true_camber_jib_park).
all_consistent(reviewer_opinion_the_good_ride) :- consistent(s19, reviewer_opinion_the_good_ride).
evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, true_camber_jib_park)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr on_snow_feel_tgr
% @type categorical
% @canonical true
% @original_name on_snow_feel_tgr
% @values stable_easy_jib=Nice_stable_easy_feel_wants_to_play_in_jib_park unk_on_snow_feel_tgr=Unknown
% @importance 0.80

0.80::acc(s19, on_snow_feel_tgr).
0.56::true_val(on_snow_feel_tgr, stable_easy_jib); 0.44::true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr).
measured(s19, on_snow_feel_tgr, stable_easy_jib).
all_consistent(on_snow_feel_tgr) :- consistent(s19, on_snow_feel_tgr).
evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, stable_easy_jib)).
query(true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values very_quick_easy=Very_quick_and_easy_edge_to_edge unk_turn_initiation_performance=Unknown
% @importance 0.80

0.80::acc(s19, turn_initiation_performance).
0.56::true_val(turn_initiation_performance, very_quick_easy); 0.44::true_val(turn_initiation_performance, unk_turn_initiation_performance).
measured(s19, turn_initiation_performance, very_quick_easy).
all_consistent(turn_initiation_performance) :- consistent(s19, turn_initiation_performance).
evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, very_quick_easy)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr flex_rating_10_the_good_ride
% @type categorical
% @canonical true
% @original_name flex_rating_10_the_good_ride
% @values soft_playful_buttery=Nice_soft_playful_buttery_easy_to_butter unk_flex_rating_10_the_good_ride=Unknown
% @importance 0.80

0.80::acc(s19, flex_rating_10_the_good_ride).
0.56::true_val(flex_rating_10_the_good_ride, soft_playful_buttery); 0.44::true_val(flex_rating_10_the_good_ride, unk_flex_rating_10_the_good_ride).
measured(s19, flex_rating_10_the_good_ride, soft_playful_buttery).
all_consistent(flex_rating_10_the_good_ride) :- consistent(s19, flex_rating_10_the_good_ride).
evidence(all_consistent(flex_rating_10_the_good_ride)).
query(true_val(flex_rating_10_the_good_ride, soft_playful_buttery)).
query(true_val(flex_rating_10_the_good_ride, unk_flex_rating_10_the_good_ride)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values best_park_board=One_of_the_best_park_boards_regardless_of_ability unk_reviewer_opinion_whitelines=Unknown
% @importance 0.65

0.78::acc(s33, reviewer_opinion_whitelines).
0.56::true_val(reviewer_opinion_whitelines, best_park_board); 0.44::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).
measured(s33, reviewer_opinion_whitelines, best_park_board).
all_consistent(reviewer_opinion_whitelines) :- consistent(s33, reviewer_opinion_whitelines).
evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, best_park_board)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

% @attr youtube_archive_review
% @type categorical
% @canonical false
% @original_name YouTube Archive review (2026)
% @values standard_jib_board=Just_a_standard_jib_board unk_youtube_archive_review=Unknown
% @importance 0.50

0.55::acc(s34, youtube_archive_review).
0.29::true_val(youtube_archive_review, standard_jib_board); 0.71::true_val(youtube_archive_review, unk_youtube_archive_review).
measured(s34, youtube_archive_review, standard_jib_board).
all_consistent(youtube_archive_review) :- consistent(s34, youtube_archive_review).
evidence(all_consistent(youtube_archive_review)).
query(true_val(youtube_archive_review, standard_jib_board)).
query(true_val(youtube_archive_review, unk_youtube_archive_review)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect (pop and power)
% @values pop_power_camber_hotrods=Pop_and_power_from_camber_HotRods_soft_flex unk_positive_aspect=Unknown
% @importance 0.85

0.55::acc(s23, positive_aspect).
0.43::true_val(positive_aspect, pop_power_camber_hotrods); 0.57::true_val(positive_aspect, unk_positive_aspect).
measured(s23, positive_aspect, pop_power_camber_hotrods).
all_consistent(positive_aspect) :- consistent(s23, positive_aspect).
evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, pop_power_camber_hotrods)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr positive_aspect_comfort
% @type categorical
% @canonical false
% @original_name positive_aspect (comfort)
% @values comfortable_day_one=Comfortable_from_day_one_like_old_friend unk_positive_aspect_comfort=Unknown
% @importance 0.85

0.55::acc(s23, positive_aspect_comfort).
0.43::true_val(positive_aspect_comfort, comfortable_day_one); 0.57::true_val(positive_aspect_comfort, unk_positive_aspect_comfort).
measured(s23, positive_aspect_comfort, comfortable_day_one).
all_consistent(positive_aspect_comfort) :- consistent(s23, positive_aspect_comfort).
evidence(all_consistent(positive_aspect_comfort)).
query(true_val(positive_aspect_comfort, comfortable_day_one)).
query(true_val(positive_aspect_comfort, unk_positive_aspect_comfort)).

% @attr positive_aspect_versatility
% @type categorical
% @canonical false
% @original_name positive_aspect (versatility)
% @values versatile_instructor_park_powder=Versatile_for_instructor_work_park_groomers_light_powder unk_positive_aspect_versatility=Unknown
% @importance 0.85

0.55::acc(s23, positive_aspect_versatility).
0.43::true_val(positive_aspect_versatility, versatile_instructor_park_powder); 0.57::true_val(positive_aspect_versatility, unk_positive_aspect_versatility).
measured(s23, positive_aspect_versatility, versatile_instructor_park_powder).
all_consistent(positive_aspect_versatility) :- consistent(s23, positive_aspect_versatility).
evidence(all_consistent(positive_aspect_versatility)).
query(true_val(positive_aspect_versatility, versatile_instructor_park_powder)).
query(true_val(positive_aspect_versatility, unk_positive_aspect_versatility)).

% @attr positive_aspect_carving
% @type categorical
% @canonical false
% @original_name positive_aspect (carving)
% @values easy_carve_wide_playful=Easy_to_carve_hard_wide_version_playful_flat_tricks unk_positive_aspect_carving=Unknown
% @importance 0.85

0.55::acc(s23, positive_aspect_carving).
0.43::true_val(positive_aspect_carving, easy_carve_wide_playful); 0.57::true_val(positive_aspect_carving, unk_positive_aspect_carving).
measured(s23, positive_aspect_carving, easy_carve_wide_playful).
all_consistent(positive_aspect_carving) :- consistent(s23, positive_aspect_carving).
evidence(all_consistent(positive_aspect_carving)).
query(true_val(positive_aspect_carving, easy_carve_wide_playful)).
query(true_val(positive_aspect_carving, unk_positive_aspect_carving)).

% @attr positive_aspect_longevity
% @type categorical
% @canonical false
% @original_name positive_aspect (longevity)
% @values good_longevity_13_seasons=Good_longevity_13_seasons_reported unk_positive_aspect_longevity=Unknown
% @importance 0.85

0.55::acc(s23, positive_aspect_longevity).
0.43::true_val(positive_aspect_longevity, good_longevity_13_seasons); 0.57::true_val(positive_aspect_longevity, unk_positive_aspect_longevity).
measured(s23, positive_aspect_longevity, good_longevity_13_seasons).
all_consistent(positive_aspect_longevity) :- consistent(s23, positive_aspect_longevity).
evidence(all_consistent(positive_aspect_longevity)).
query(true_val(positive_aspect_longevity, good_longevity_13_seasons)).
query(true_val(positive_aspect_longevity, unk_positive_aspect_longevity)).

% @attr positive_aspect_jibbing
% @type categorical
% @canonical false
% @original_name positive_aspect (jibbing)
% @values jibbing_monster_go_to=Jibbing_Monster_go_to_board_for_park unk_positive_aspect_jibbing=Unknown
% @importance 1.00

0.90::acc(s16, positive_aspect_jibbing).
0.90::true_val(positive_aspect_jibbing, jibbing_monster_go_to); 0.10::true_val(positive_aspect_jibbing, unk_positive_aspect_jibbing).
measured(s16, positive_aspect_jibbing, jibbing_monster_go_to).
all_consistent(positive_aspect_jibbing) :- consistent(s16, positive_aspect_jibbing).
evidence(all_consistent(positive_aspect_jibbing)).
query(true_val(positive_aspect_jibbing, jibbing_monster_go_to)).
query(true_val(positive_aspect_jibbing, unk_positive_aspect_jibbing)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect (base chipping)
% @values base_chipping_14_days=Base_chipping_crumbling_after_14_days_warranty_rejected unk_negative_aspect=Unknown
% @importance 0.85

0.55::acc(s23, negative_aspect).
0.43::true_val(negative_aspect, base_chipping_14_days); 0.57::true_val(negative_aspect, unk_negative_aspect).
measured(s23, negative_aspect, base_chipping_14_days).
all_consistent(negative_aspect) :- consistent(s23, negative_aspect).
evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, base_chipping_14_days)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_wax
% @type categorical
% @canonical false
% @original_name negative_aspect (shipped without wax)
% @values shipped_no_wax=Board_shipped_without_adequate_wax unk_negative_aspect_wax=Unknown
% @importance 0.85

0.55::acc(s23, negative_aspect_wax).
0.43::true_val(negative_aspect_wax, shipped_no_wax); 0.57::true_val(negative_aspect_wax, unk_negative_aspect_wax).
measured(s23, negative_aspect_wax, shipped_no_wax).
all_consistent(negative_aspect_wax) :- consistent(s23, negative_aspect_wax).
evidence(all_consistent(negative_aspect_wax)).
query(true_val(negative_aspect_wax, shipped_no_wax)).
query(true_val(negative_aspect_wax, unk_negative_aspect_wax)).

% @attr negative_aspect_delamination
% @type categorical
% @canonical false
% @original_name negative_aspect (delamination)
% @values topsheet_delamination_5_days=Topsheet_delamination_bubbling_after_5_days unk_negative_aspect_delamination=Unknown
% @importance 0.75

0.50::acc(s35, negative_aspect_delamination).
0.36::true_val(negative_aspect_delamination, topsheet_delamination_5_days); 0.64::true_val(negative_aspect_delamination, unk_negative_aspect_delamination).
measured(s35, negative_aspect_delamination, topsheet_delamination_5_days).
all_consistent(negative_aspect_delamination) :- consistent(s35, negative_aspect_delamination).
evidence(all_consistent(negative_aspect_delamination)).
query(true_val(negative_aspect_delamination, topsheet_delamination_5_days)).
query(true_val(negative_aspect_delamination, unk_negative_aspect_delamination)).

% @attr negative_aspect_base_speed
% @type categorical
% @canonical false
% @original_name negative_aspect (extruded base speed)
% @values extruded_slower_at_price=Extruded_base_slower_than_sintered_competitors_at_price unk_negative_aspect_base_speed=Unknown
% @importance 0.75

0.60::acc(s22, negative_aspect_base_speed).
0.34::true_val(negative_aspect_base_speed, extruded_slower_at_price); 0.66::true_val(negative_aspect_base_speed, unk_negative_aspect_base_speed).
measured(s22, negative_aspect_base_speed, extruded_slower_at_price).
all_consistent(negative_aspect_base_speed) :- consistent(s22, negative_aspect_base_speed).
evidence(all_consistent(negative_aspect_base_speed)).
query(true_val(negative_aspect_base_speed, extruded_slower_at_price)).
query(true_val(negative_aspect_base_speed, unk_negative_aspect_base_speed)).

% @attr negative_aspect_powder
% @type categorical
% @canonical false
% @original_name negative_aspect (powder)
% @values not_suitable_powder=Not_suitable_for_powder_only_major_weakness unk_negative_aspect_powder=Unknown
% @importance 0.90

0.85::acc(s17, negative_aspect_powder).
0.72::true_val(negative_aspect_powder, not_suitable_powder); 0.28::true_val(negative_aspect_powder, unk_negative_aspect_powder).
measured(s17, negative_aspect_powder, not_suitable_powder).
all_consistent(negative_aspect_powder) :- consistent(s17, negative_aspect_powder).
evidence(all_consistent(negative_aspect_powder)).
query(true_val(negative_aspect_powder, not_suitable_powder)).
query(true_val(negative_aspect_powder, unk_negative_aspect_powder)).

% @attr negative_aspect_speed_stability
% @type categorical
% @canonical false
% @original_name negative_aspect (speed stability)
% @values unstable_high_speed=Soft_flex_unstable_at_higher_speeds unk_negative_aspect_speed_stability=Unknown
% @importance 0.90

0.85::acc(s17, negative_aspect_speed_stability).
0.72::true_val(negative_aspect_speed_stability, unstable_high_speed); 0.28::true_val(negative_aspect_speed_stability, unk_negative_aspect_speed_stability).
measured(s17, negative_aspect_speed_stability, unstable_high_speed).
all_consistent(negative_aspect_speed_stability) :- consistent(s17, negative_aspect_speed_stability).
evidence(all_consistent(negative_aspect_speed_stability)).
query(true_val(negative_aspect_speed_stability, unstable_high_speed)).
query(true_val(negative_aspect_speed_stability, unk_negative_aspect_speed_stability)).

% @attr negative_aspect_weight
% @type categorical
% @canonical false
% @original_name negative_aspect (weight)
% @values slightly_above_avg=Weight_slightly_above_average_for_category unk_negative_aspect_weight=Unknown
% @importance 0.90

0.85::acc(s17, negative_aspect_weight).
0.72::true_val(negative_aspect_weight, slightly_above_avg); 0.28::true_val(negative_aspect_weight, unk_negative_aspect_weight).
measured(s17, negative_aspect_weight, slightly_above_avg).
all_consistent(negative_aspect_weight) :- consistent(s17, negative_aspect_weight).
evidence(all_consistent(negative_aspect_weight)).
query(true_val(negative_aspect_weight, slightly_above_avg)).
query(true_val(negative_aspect_weight, unk_negative_aspect_weight)).

% @attr negative_aspect_pro_topsheet
% @type categorical
% @canonical false
% @original_name negative_aspect (Pro topsheet)
% @values pro_topsheet_cracking=Artifact_Pro_topsheet_cracking_near_inserts unk_negative_aspect_pro_topsheet=Unknown
% @importance 0.70

0.50::acc(s36, negative_aspect_pro_topsheet).
0.29::true_val(negative_aspect_pro_topsheet, pro_topsheet_cracking); 0.71::true_val(negative_aspect_pro_topsheet, unk_negative_aspect_pro_topsheet).
measured(s36, negative_aspect_pro_topsheet, pro_topsheet_cracking).
all_consistent(negative_aspect_pro_topsheet) :- consistent(s36, negative_aspect_pro_topsheet).
evidence(all_consistent(negative_aspect_pro_topsheet)).
query(true_val(negative_aspect_pro_topsheet, pro_topsheet_cracking)).
query(true_val(negative_aspect_pro_topsheet, unk_negative_aspect_pro_topsheet)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values artifact_pro=Rome_Artifact_Pro_stiffer_sintered_carbon unk_comparable_board_same_brand=Unknown
% @importance 0.80

0.82::acc(s37, comparable_board_same_brand).
0.68::acc(s38, comparable_board_same_brand).
0.90::true_val(comparable_board_same_brand, artifact_pro); 0.10::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).
measured(s37, comparable_board_same_brand, artifact_pro).
measured(s38, comparable_board_same_brand, artifact_pro).
all_consistent(comparable_board_same_brand) :-
    consistent(s37, comparable_board_same_brand),
    consistent(s38, comparable_board_same_brand).
evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, artifact_pro)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_cross_brand_horrorscope
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Horrorscope)
% @values capita_horrorscope=Capita_Horrorscope_softer_reverse_camber unk_comparable_board_cross_brand_horrorscope=Unknown
% @importance 0.60

0.55::acc(s39, comparable_board_cross_brand_horrorscope).
0.23::true_val(comparable_board_cross_brand_horrorscope, capita_horrorscope); 0.77::true_val(comparable_board_cross_brand_horrorscope, unk_comparable_board_cross_brand_horrorscope).
measured(s39, comparable_board_cross_brand_horrorscope, capita_horrorscope).
all_consistent(comparable_board_cross_brand_horrorscope) :- consistent(s39, comparable_board_cross_brand_horrorscope).
evidence(all_consistent(comparable_board_cross_brand_horrorscope)).
query(true_val(comparable_board_cross_brand_horrorscope, capita_horrorscope)).
query(true_val(comparable_board_cross_brand_horrorscope, unk_comparable_board_cross_brand_horrorscope)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand (DOA)
% @values capita_doa=Capita_DOA_hybrid_camber_forgiving unk_comparable_board_cross_brand=Unknown
% @importance 0.70

0.68::acc(s38, comparable_board_cross_brand).
0.52::true_val(comparable_board_cross_brand, capita_doa); 0.48::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).
measured(s38, comparable_board_cross_brand, capita_doa).
all_consistent(comparable_board_cross_brand) :- consistent(s38, comparable_board_cross_brand).
evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, capita_doa)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_huck_knife
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Huck Knife)
% @values salomon_huck_knife=Salomon_Huck_Knife_similar_soft_freestyle_twin unk_comparable_board_cross_brand_huck_knife=Unknown
% @importance 0.70

0.55::acc(s40, comparable_board_cross_brand_huck_knife).
0.25::true_val(comparable_board_cross_brand_huck_knife, salomon_huck_knife); 0.75::true_val(comparable_board_cross_brand_huck_knife, unk_comparable_board_cross_brand_huck_knife).
measured(s40, comparable_board_cross_brand_huck_knife, salomon_huck_knife).
all_consistent(comparable_board_cross_brand_huck_knife) :- consistent(s40, comparable_board_cross_brand_huck_knife).
evidence(all_consistent(comparable_board_cross_brand_huck_knife)).
query(true_val(comparable_board_cross_brand_huck_knife, salomon_huck_knife)).
query(true_val(comparable_board_cross_brand_huck_knife, unk_comparable_board_cross_brand_huck_knife)).

% @attr comparable_board_cross_brand_www
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (K2 WWW)
% @values k2_www=K2_WWW_reverse_camber_park_twin unk_comparable_board_cross_brand_www=Unknown
% @importance 0.60

0.55::acc(s39, comparable_board_cross_brand_www).
0.23::true_val(comparable_board_cross_brand_www, k2_www); 0.77::true_val(comparable_board_cross_brand_www, unk_comparable_board_cross_brand_www).
measured(s39, comparable_board_cross_brand_www, k2_www).
all_consistent(comparable_board_cross_brand_www) :- consistent(s39, comparable_board_cross_brand_www).
evidence(all_consistent(comparable_board_cross_brand_www)).
query(true_val(comparable_board_cross_brand_www, k2_www)).
query(true_val(comparable_board_cross_brand_www, unk_comparable_board_cross_brand_www)).

% @attr comparable_board_cross_brand_evil_twin
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Evil Twin)
% @values bataleon_evil_twin=Bataleon_Evil_Twin_3BT_catch_free unk_comparable_board_cross_brand_evil_twin=Unknown
% @importance 0.70

0.55::acc(s40, comparable_board_cross_brand_evil_twin).
0.25::true_val(comparable_board_cross_brand_evil_twin, bataleon_evil_twin); 0.75::true_val(comparable_board_cross_brand_evil_twin, unk_comparable_board_cross_brand_evil_twin).
measured(s40, comparable_board_cross_brand_evil_twin, bataleon_evil_twin).
all_consistent(comparable_board_cross_brand_evil_twin) :- consistent(s40, comparable_board_cross_brand_evil_twin).
evidence(all_consistent(comparable_board_cross_brand_evil_twin)).
query(true_val(comparable_board_cross_brand_evil_twin, bataleon_evil_twin)).
query(true_val(comparable_board_cross_brand_evil_twin, unk_comparable_board_cross_brand_evil_twin)).

% @attr comparable_board_cross_brand_yes_basic
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (YES Basic)
% @values yes_basic=YES_Basic_freestyle_twin unk_comparable_board_cross_brand_yes_basic=Unknown
% @importance 0.70

0.55::acc(s40, comparable_board_cross_brand_yes_basic).
0.25::true_val(comparable_board_cross_brand_yes_basic, yes_basic); 0.75::true_val(comparable_board_cross_brand_yes_basic, unk_comparable_board_cross_brand_yes_basic).
measured(s40, comparable_board_cross_brand_yes_basic, yes_basic).
all_consistent(comparable_board_cross_brand_yes_basic) :- consistent(s40, comparable_board_cross_brand_yes_basic).
evidence(all_consistent(comparable_board_cross_brand_yes_basic)).
query(true_val(comparable_board_cross_brand_yes_basic, yes_basic)).
query(true_val(comparable_board_cross_brand_yes_basic, unk_comparable_board_cross_brand_yes_basic)).

% @attr reviewer_opinion_snowboardingprofiles_price
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (price comparison)
% @values below_avg_price=Artifact_499_below_518_avg_for_comparable unk_reviewer_opinion_snowboardingprofiles_price=Unknown
% @importance 0.90

0.82::acc(s17, reviewer_opinion_snowboardingprofiles_price).
0.72::true_val(reviewer_opinion_snowboardingprofiles_price, below_avg_price); 0.28::true_val(reviewer_opinion_snowboardingprofiles_price, unk_reviewer_opinion_snowboardingprofiles_price).
measured(s17, reviewer_opinion_snowboardingprofiles_price, below_avg_price).
all_consistent(reviewer_opinion_snowboardingprofiles_price) :- consistent(s17, reviewer_opinion_snowboardingprofiles_price).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles_price)).
query(true_val(reviewer_opinion_snowboardingprofiles_price, below_avg_price)).
query(true_val(reviewer_opinion_snowboardingprofiles_price, unk_reviewer_opinion_snowboardingprofiles_price)).

% @attr rome_reputation_skatepro
% @type categorical
% @canonical false
% @original_name Rome SDS reputation (SkatePro)
% @values serious_player_since_2001=Serious_player_on_snowboard_market_since_2001 unk_rome_reputation_skatepro=Unknown
% @importance 0.40

0.60::acc(s41, rome_reputation_skatepro).
0.42::true_val(rome_reputation_skatepro, serious_player_since_2001); 0.58::true_val(rome_reputation_skatepro, unk_rome_reputation_skatepro).
measured(s41, rome_reputation_skatepro, serious_player_since_2001).
all_consistent(rome_reputation_skatepro) :-
    (indep(s41), consistent(s41, rome_reputation_skatepro) ; \+indep(s41)).
evidence(all_consistent(rome_reputation_skatepro)).
query(true_val(rome_reputation_skatepro, serious_player_since_2001)).
query(true_val(rome_reputation_skatepro, unk_rome_reputation_skatepro)).

% @attr rome_reputation_curated
% @type categorical
% @canonical false
% @original_name Rome SDS reputation (Curated.com)
% @values well_known_respected_best=Most_well_known_respected_best_snowboarding_brands unk_rome_reputation_curated=Unknown
% @importance 0.50

0.72::acc(s11, rome_reputation_curated).
0.60::true_val(rome_reputation_curated, well_known_respected_best); 0.40::true_val(rome_reputation_curated, unk_rome_reputation_curated).
measured(s11, rome_reputation_curated, well_known_respected_best).
all_consistent(rome_reputation_curated) :- consistent(s11, rome_reputation_curated).
evidence(all_consistent(rome_reputation_curated)).
query(true_val(rome_reputation_curated, well_known_respected_best)).
query(true_val(rome_reputation_curated, unk_rome_reputation_curated)).

% @attr brand_philosophy
% @type categorical
% @canonical false
% @original_name Brand philosophy
% @values anti_establishment_diy=Anti_establishment_by_snowboarders_for_snowboarders_DIY unk_brand_philosophy=Unknown
% @importance 0.40

0.80::acc(s42, brand_philosophy).
0.64::true_val(brand_philosophy, anti_establishment_diy); 0.36::true_val(brand_philosophy, unk_brand_philosophy).
measured(s42, brand_philosophy, anti_establishment_diy).
all_consistent(brand_philosophy) :- consistent(s42, brand_philosophy).
evidence(all_consistent(brand_philosophy)).
query(true_val(brand_philosophy, anti_establishment_diy)).
query(true_val(brand_philosophy, unk_brand_philosophy)).

% @attr notable_team_riders
% @type categorical
% @canonical false
% @original_name Notable team riders
% @values stale_sandbech=Stale_Sandbech_Olympic_silver_medallist unk_notable_team_riders=Unknown
% @importance 0.40

0.80::acc(s42, notable_team_riders).
0.64::true_val(notable_team_riders, stale_sandbech); 0.36::true_val(notable_team_riders, unk_notable_team_riders).
measured(s42, notable_team_riders, stale_sandbech).
all_consistent(notable_team_riders) :- consistent(s42, notable_team_riders).
evidence(all_consistent(notable_team_riders)).
query(true_val(notable_team_riders, stale_sandbech)).
query(true_val(notable_team_riders, unk_notable_team_riders)).

% @attr evo_retailer_info
% @type categorical
% @canonical false
% @original_name evo.com retailer info
% @values major_us_retailer=Major_US_retailer_price_match_free_shipping unk_evo_retailer_info=Unknown
% @importance 0.90

0.85::acc(s25, evo_retailer_info).
0.81::true_val(evo_retailer_info, major_us_retailer); 0.19::true_val(evo_retailer_info, unk_evo_retailer_info).
measured(s25, evo_retailer_info, major_us_retailer).
all_consistent(evo_retailer_info) :-
    (indep(s25), consistent(s25, evo_retailer_info) ; \+indep(s25)).
evidence(all_consistent(evo_retailer_info)).
query(true_val(evo_retailer_info, major_us_retailer)).
query(true_val(evo_retailer_info, unk_evo_retailer_info)).

% @attr ballistyx_retailer_info
% @type categorical
% @canonical false
% @original_name Ballistyx.com.au retailer info
% @values melbourne_since_1992=Melbourne_based_since_1992_rider_owned unk_ballistyx_retailer_info=Unknown
% @importance 0.85

0.65::acc(s3, ballistyx_retailer_info).
0.48::true_val(ballistyx_retailer_info, melbourne_since_1992); 0.52::true_val(ballistyx_retailer_info, unk_ballistyx_retailer_info).
measured(s3, ballistyx_retailer_info, melbourne_since_1992).
all_consistent(ballistyx_retailer_info) :-
    (indep(s3), consistent(s3, ballistyx_retailer_info) ; \+indep(s3)).
evidence(all_consistent(ballistyx_retailer_info)).
query(true_val(ballistyx_retailer_info, melbourne_since_1992)).
query(true_val(ballistyx_retailer_info, unk_ballistyx_retailer_info)).

% @attr melbourne_snowboard_centre_info
% @type categorical
% @canonical false
% @original_name Melbourne Snowboard Centre info
% @values au_retailer_20pct_restock=Australian_retailer_392_Plenty_Rd_20pct_restocking_fee unk_melbourne_snowboard_centre_info=Unknown
% @importance 0.80

0.70::acc(s1, melbourne_snowboard_centre_info).
0.63::true_val(melbourne_snowboard_centre_info, au_retailer_20pct_restock); 0.37::true_val(melbourne_snowboard_centre_info, unk_melbourne_snowboard_centre_info).
measured(s1, melbourne_snowboard_centre_info, au_retailer_20pct_restock).
all_consistent(melbourne_snowboard_centre_info) :-
    (indep(s1), consistent(s1, melbourne_snowboard_centre_info) ; \+indep(s1)).
evidence(all_consistent(melbourne_snowboard_centre_info)).
query(true_val(melbourne_snowboard_centre_info, au_retailer_20pct_restock)).
query(true_val(melbourne_snowboard_centre_info, unk_melbourne_snowboard_centre_info)).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values compatible_2x4_all_major=2x4_insert_compatible_all_major_bindings unk_binding_compatibility=Unknown
% @importance 0.85

0.65::acc(s3, binding_compatibility).
0.48::true_val(binding_compatibility, compatible_2x4_all_major); 0.52::true_val(binding_compatibility, unk_binding_compatibility).
measured(s3, binding_compatibility, compatible_2x4_all_major).
all_consistent(binding_compatibility) :-
    (indep(s3), consistent(s3, binding_compatibility) ; \+indep(s3)).
evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, compatible_2x4_all_major)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

% @attr camber_description
% @type categorical
% @canonical false
% @original_name camber_description
% @values traditional_positive=Traditional_positive_camber_not_hybrid_rocker unk_camber_description=Unknown
% @importance 0.95

0.95::acc(s16, camber_description).
0.88::acc(s17, camber_description).
0.95::true_val(camber_description, traditional_positive); 0.05::true_val(camber_description, unk_camber_description).
measured(s16, camber_description, traditional_positive).
measured(s17, camber_description, traditional_positive).
all_consistent(camber_description) :-
    consistent(s16, camber_description),
    consistent(s17, camber_description).
evidence(all_consistent(camber_description)).
query(true_val(camber_description, traditional_positive)).
query(true_val(camber_description, unk_camber_description)).

% @attr user_review_forum_repair
% @type categorical
% @canonical false
% @original_name user_review_forum (repair)
% @values easier_ptex_repair=Easier_to_repair_with_Ptex_than_sintered unk_user_review_forum_repair=Unknown
% @importance 0.75

0.60::acc(s22, user_review_forum_repair).
0.34::true_val(user_review_forum_repair, easier_ptex_repair); 0.66::true_val(user_review_forum_repair, unk_user_review_forum_repair).
measured(s22, user_review_forum_repair, easier_ptex_repair).
all_consistent(user_review_forum_repair) :- consistent(s22, user_review_forum_repair).
evidence(all_consistent(user_review_forum_repair)).
query(true_val(user_review_forum_repair, easier_ptex_repair)).
query(true_val(user_review_forum_repair, unk_user_review_forum_repair)).

% @attr user_review_forum_wax_retention
% @type categorical
% @canonical false
% @original_name user_review_forum (wax retention)
% @values does_not_hold_wax_slower=Does_not_hold_wax_inherently_slower_than_sintered unk_user_review_forum_wax_retention=Unknown
% @importance 0.75

0.60::acc(s22, user_review_forum_wax_retention).
0.34::true_val(user_review_forum_wax_retention, does_not_hold_wax_slower); 0.66::true_val(user_review_forum_wax_retention, unk_user_review_forum_wax_retention).
measured(s22, user_review_forum_wax_retention, does_not_hold_wax_slower).
all_consistent(user_review_forum_wax_retention) :- consistent(s22, user_review_forum_wax_retention).
evidence(all_consistent(user_review_forum_wax_retention)).
query(true_val(user_review_forum_wax_retention, does_not_hold_wax_slower)).
query(true_val(user_review_forum_wax_retention, unk_user_review_forum_wax_retention)).