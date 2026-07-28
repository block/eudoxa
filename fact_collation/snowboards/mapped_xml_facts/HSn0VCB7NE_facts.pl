0.15::indep(s1).
0.15::indep(s2).
0.15::indep(s3).
0.15::indep(s5).
0.15::indep(s12).
0.15::indep(s13).
0.20::indep(s20).
0.20::indep(s21).
0.15::indep(s22).
0.15::indep(s23).
0.20::indep(s24).
0.15::indep(s25).
0.20::indep(s27).
0.15::indep(s29).
0.15::indep(s30).
0.15::indep(s31).
0.20::indep(s11).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

0.78::acc(s1, brand).
0.72::acc(s2, brand).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values salomon=Salomon unk_brand=Unknown
% @importance 0.90

0.95::true_val(brand, salomon); 0.05::true_val(brand, unk_brand).

measured(s1, brand, salomon).
measured(s2, brand, salomon).

all_consistent(brand) :-
    consistent(s2, brand),
    (indep(s1), consistent(s1, brand) ; \+indep(s1)).

evidence(all_consistent(brand)).
query(true_val(brand, salomon)).
query(true_val(brand, unk_brand)).

0.78::acc(s1, model_name).
0.72::acc(s2, model_name).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values hps_takaharu_nakai=HPS_Takaharu_Nakai unk_model_name=Unknown
% @importance 0.90

0.95::true_val(model_name, hps_takaharu_nakai); 0.05::true_val(model_name, unk_model_name).

measured(s1, model_name, hps_takaharu_nakai).
measured(s2, model_name, hps_takaharu_nakai).

all_consistent(model_name) :-
    consistent(s2, model_name),
    (indep(s1), consistent(s1, model_name) ; \+indep(s1)).

evidence(all_consistent(model_name)).
query(true_val(model_name, hps_takaharu_nakai)).
query(true_val(model_name, unk_model_name)).

0.78::acc(s1, model_year).
0.72::acc(s2, model_year).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2024=2024 unk_model_year=Unknown
% @importance 0.90

0.95::true_val(model_year, y2024); 0.05::true_val(model_year, unk_model_year).

measured(s1, model_year, y2024).
measured(s2, model_year, y2024).

all_consistent(model_year) :-
    consistent(s2, model_year),
    (indep(s1), consistent(s1, model_year) ; \+indep(s1)).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2024)).
query(true_val(model_year, unk_model_year)).

0.78::acc(s1, product_type).
0.72::acc(s2, product_type).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.90

0.95::true_val(product_type, snowboard); 0.05::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).
measured(s2, product_type, snowboard).

all_consistent(product_type) :-
    consistent(s2, product_type),
    (indep(s1), consistent(s1, product_type) ; \+indep(s1)).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

0.60::acc(s3, board_category).
0.93::acc(s4, board_category).
0.68::acc(s2, board_category).
0.65::acc(s5, board_category).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values freeride=Freeride all_mountain_freeride=All_Mountain_Freeride_Versatile_Powder
% @importance 0.80

0.55::true_val(board_category, freeride); 0.45::true_val(board_category, all_mountain_freeride).

measured(s3, board_category, freeride).
measured(s4, board_category, freeride).
measured(s2, board_category, all_mountain_freeride).
measured(s5, board_category, all_mountain_freeride).

all_consistent(board_category) :-
    consistent(s4, board_category),
    (indep(s3), consistent(s3, board_category) ; \+indep(s3)),
    (indep(s2), consistent(s2, board_category) ; \+indep(s2)),
    (indep(s5), consistent(s5, board_category) ; \+indep(s5)).

evidence(all_consistent(board_category)).
query(true_val(board_category, freeride)).
query(true_val(board_category, all_mountain_freeride)).

0.82::acc(s6, manufacturer).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values salomon_sas=Salomon_SAS unk_manufacturer=Unknown
% @importance 0.60

0.81::true_val(manufacturer, salomon_sas); 0.19::true_val(manufacturer, unk_manufacturer).

measured(s6, manufacturer, salomon_sas).

all_consistent(manufacturer) :-
    consistent(s6, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, salomon_sas)).
query(true_val(manufacturer, unk_manufacturer)).

0.82::acc(s6, manufacturer_headquarters).
0.55::acc(s7, manufacturer_headquarters).

% @attr manufacturer_headquarters
% @type categorical
% @canonical false
% @original_name Manufacturer headquarters
% @values annecy_france=Annecy_France unk_manufacturer_headquarters=Unknown
% @importance 0.50

0.95::true_val(manufacturer_headquarters, annecy_france); 0.05::true_val(manufacturer_headquarters, unk_manufacturer_headquarters).

measured(s6, manufacturer_headquarters, annecy_france).
measured(s7, manufacturer_headquarters, annecy_france).

all_consistent(manufacturer_headquarters) :-
    consistent(s6, manufacturer_headquarters),
    (indep(s7), consistent(s7, manufacturer_headquarters) ; \+indep(s7)).

evidence(all_consistent(manufacturer_headquarters)).
query(true_val(manufacturer_headquarters, annecy_france)).
query(true_val(manufacturer_headquarters, unk_manufacturer_headquarters)).

0.82::acc(s6, parent_company).
0.55::acc(s7, parent_company).

% @attr parent_company
% @type categorical
% @canonical false
% @original_name Parent company
% @values amer_sports=Amer_Sports unk_parent_company=Unknown
% @importance 0.50

0.95::true_val(parent_company, amer_sports); 0.05::true_val(parent_company, unk_parent_company).

measured(s6, parent_company, amer_sports).
measured(s7, parent_company, amer_sports).

all_consistent(parent_company) :-
    consistent(s6, parent_company),
    (indep(s7), consistent(s7, parent_company) ; \+indep(s7)).

evidence(all_consistent(parent_company)).
query(true_val(parent_company, amer_sports)).
query(true_val(parent_company, unk_parent_company)).

0.78::acc(s8, snowboard_design_location).

% @attr snowboard_design_location
% @type categorical
% @canonical false
% @original_name Snowboard design location
% @values annecy_france=Annecy_France unk_snowboard_design_location=Unknown
% @importance 0.50

0.72::true_val(snowboard_design_location, annecy_france); 0.28::true_val(snowboard_design_location, unk_snowboard_design_location).

measured(s8, snowboard_design_location, annecy_france).

all_consistent(snowboard_design_location) :-
    consistent(s8, snowboard_design_location).

evidence(all_consistent(snowboard_design_location)).
query(true_val(snowboard_design_location, annecy_france)).
query(true_val(snowboard_design_location, unk_snowboard_design_location)).

0.60::acc(s9, manufacturing_location_current).
0.70::acc(s10, manufacturing_location_current).
0.72::acc(s11, manufacturing_location_current).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values china=China unk_manufacturing_location_current=Unknown
% @importance 0.53

0.95::true_val(manufacturing_location_current, china); 0.05::true_val(manufacturing_location_current, unk_manufacturing_location_current).

measured(s9, manufacturing_location_current, china).
measured(s10, manufacturing_location_current, china).
measured(s11, manufacturing_location_current, china).

all_consistent(manufacturing_location_current) :-
    consistent(s9, manufacturing_location_current),
    consistent(s10, manufacturing_location_current),
    (indep(s11), consistent(s11, manufacturing_location_current) ; \+indep(s11)).

evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, china)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

0.82::acc(s6, manufacturer_founded).
0.55::acc(s7, manufacturer_founded).

% @attr manufacturer_founded
% @type categorical
% @canonical false
% @original_name Manufacturer founded
% @values y1947=1947 unk_manufacturer_founded=Unknown
% @importance 0.50

0.95::true_val(manufacturer_founded, y1947); 0.05::true_val(manufacturer_founded, unk_manufacturer_founded).

measured(s6, manufacturer_founded, y1947).
measured(s7, manufacturer_founded, y1947).

all_consistent(manufacturer_founded) :-
    consistent(s6, manufacturer_founded),
    (indep(s7), consistent(s7, manufacturer_founded) ; \+indep(s7)).

evidence(all_consistent(manufacturer_founded)).
query(true_val(manufacturer_founded, y1947)).
query(true_val(manufacturer_founded, unk_manufacturer_founded)).

0.70::acc(s12, model_series).
0.65::acc(s13, model_series).

% @attr model_series
% @type categorical
% @canonical false
% @original_name Model series
% @values hps=Hillside_Project_Series unk_model_series=Unknown
% @importance 0.75

0.95::true_val(model_series, hps); 0.05::true_val(model_series, unk_model_series).

measured(s12, model_series, hps).
measured(s13, model_series, hps).

all_consistent(model_series) :-
    (indep(s12), consistent(s12, model_series) ; \+indep(s12)),
    (indep(s13), consistent(s13, model_series) ; \+indep(s13)).

evidence(all_consistent(model_series)).
query(true_val(model_series, hps)).
query(true_val(model_series, unk_model_series)).

0.85::acc(s14, series_first_available).

% @attr series_first_available
% @type categorical
% @canonical false
% @original_name Series first available
% @values y2017=2017 unk_series_first_available=Unknown
% @importance 0.70

0.81::true_val(series_first_available, y2017); 0.19::true_val(series_first_available, unk_series_first_available).

measured(s14, series_first_available, y2017).

all_consistent(series_first_available) :-
    consistent(s14, series_first_available).

evidence(all_consistent(series_first_available)).
query(true_val(series_first_available, y2017)).
query(true_val(series_first_available, unk_series_first_available)).

0.82::acc(s15, model_first_available_year).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values y2019=2019 unk_model_first_available_year=Unknown
% @importance 0.95

0.78::true_val(model_first_available_year, y2019); 0.22::true_val(model_first_available_year, unk_model_first_available_year).

measured(s15, model_first_available_year, y2019).

all_consistent(model_first_available_year) :-
    consistent(s15, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2019)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

0.78::acc(s1, pro_rider_name).
0.70::acc(s12, pro_rider_name).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values nyvelt_nakai=Wolle_Nyvelt_and_Takaharu_Nakai unk_pro_rider_name=Unknown
% @importance 0.85

0.95::true_val(pro_rider_name, nyvelt_nakai); 0.05::true_val(pro_rider_name, unk_pro_rider_name).

measured(s1, pro_rider_name, nyvelt_nakai).
measured(s12, pro_rider_name, nyvelt_nakai).

all_consistent(pro_rider_name) :-
    (indep(s1), consistent(s1, pro_rider_name) ; \+indep(s1)),
    (indep(s12), consistent(s12, pro_rider_name) ; \+indep(s12)).

evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, nyvelt_nakai)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

0.70::acc(s12, designer_description).
0.75::acc(s16, designer_description).

% @attr designer_description
% @type categorical
% @canonical false
% @original_name Designer description
% @values legendary_shaper_soul_shredder=Legendary_shaper_and_soul_shredder unk_designer_description=Unknown
% @importance 0.73

0.95::true_val(designer_description, legendary_shaper_soul_shredder); 0.05::true_val(designer_description, unk_designer_description).

measured(s12, designer_description, legendary_shaper_soul_shredder).
measured(s16, designer_description, legendary_shaper_soul_shredder).

all_consistent(designer_description) :-
    (indep(s12), consistent(s12, designer_description) ; \+indep(s12)),
    consistent(s16, designer_description).

evidence(all_consistent(designer_description)).
query(true_val(designer_description, legendary_shaper_soul_shredder)).
query(true_val(designer_description, unk_designer_description)).

0.85::acc(s14, design_philosophy).

% @attr design_philosophy
% @type categorical
% @canonical false
% @original_name Design philosophy
% @values hand_shaped_powder=Hand_shaped_fine_tuned_powder unk_design_philosophy=Unknown
% @importance 0.70

0.81::true_val(design_philosophy, hand_shaped_powder); 0.19::true_val(design_philosophy, unk_design_philosophy).

measured(s14, design_philosophy, hand_shaped_powder).

all_consistent(design_philosophy) :-
    consistent(s14, design_philosophy).

evidence(all_consistent(design_philosophy)).
query(true_val(design_philosophy, hand_shaped_powder)).
query(true_val(design_philosophy, unk_design_philosophy)).

0.60::acc(s3, gender).
0.93::acc(s17, gender).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens_unisex=Mens_Unisex unk_gender=Unknown
% @importance 0.80

0.95::true_val(gender, mens_unisex); 0.05::true_val(gender, unk_gender).

measured(s3, gender, mens_unisex).
measured(s17, gender, mens_unisex).

all_consistent(gender) :-
    consistent(s17, gender),
    (indep(s3), consistent(s3, gender) ; \+indep(s3)).

evidence(all_consistent(gender)).
query(true_val(gender, mens_unisex)).
query(true_val(gender, unk_gender)).

0.72::acc(s2, sku_155).

% @attr sku_155
% @type categorical
% @canonical false
% @original_name SKU (155cm)
% @values l41505000_155=L41505000_155 unk_sku_155=Unknown
% @importance 1.00

0.71::true_val(sku_155, l41505000_155); 0.29::true_val(sku_155, unk_sku_155).

measured(s2, sku_155, l41505000_155).

all_consistent(sku_155) :-
    consistent(s2, sku_155).

evidence(all_consistent(sku_155)).
query(true_val(sku_155, l41505000_155)).
query(true_val(sku_155, unk_sku_155)).

0.72::acc(s2, available_sizes).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values s155_158_161=155_158_161cm unk_available_sizes=Unknown
% @importance 1.00

0.71::true_val(available_sizes, s155_158_161); 0.29::true_val(available_sizes, unk_available_sizes).

measured(s2, available_sizes, s155_158_161).

all_consistent(available_sizes) :-
    consistent(s2, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, s155_158_161)).
query(true_val(available_sizes, unk_available_sizes)).

0.72::acc(s2, waist_width_158).

% @attr waist_width_158
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width (158cm)
% @values v262=262.0
% @importance 1.00

0.71::true_val(waist_width_158, v262); 0.29::true_val(waist_width_158, unk_waist_width_158).

measured(s2, waist_width_158, v262).

all_consistent(waist_width_158) :-
    consistent(s2, waist_width_158).

evidence(all_consistent(waist_width_158)).
query(true_val(waist_width_158, v262)).
query(true_val(waist_width_158, unk_waist_width_158)).

0.72::acc(s2, setback).

% @attr setback
% @type numeric
% @unit mm
% @canonical true
% @original_name setback
% @values v30=30.0 unk_setback=Unknown
% @importance 1.00

0.71::true_val(setback, v30); 0.29::true_val(setback, unk_setback).

measured(s2, setback, v30).

all_consistent(setback) :-
    consistent(s2, setback).

evidence(all_consistent(setback)).
query(true_val(setback, v30)).
query(true_val(setback, unk_setback)).

0.72::acc(s2, tip_tail_width_size).

% @attr tip_tail_width_size
% @type categorical
% @unit mm
% @canonical true
% @original_name tip_tail_width_size
% @values v310_298=310_298mm unk_tip_tail_width_size=Unknown
% @importance 1.00

0.71::true_val(tip_tail_width_size, v310_298); 0.29::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s2, tip_tail_width_size, v310_298).

all_consistent(tip_tail_width_size) :-
    consistent(s2, tip_tail_width_size).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v310_298)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

0.72::acc(s2, effective_edge_158).

% @attr effective_edge_158
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge (158cm)
% @values v1170=1170.0 unk_effective_edge_158=Unknown
% @importance 1.00

0.71::true_val(effective_edge_158, v1170); 0.29::true_val(effective_edge_158, unk_effective_edge_158).

measured(s2, effective_edge_158, v1170).

all_consistent(effective_edge_158) :-
    consistent(s2, effective_edge_158).

evidence(all_consistent(effective_edge_158)).
query(true_val(effective_edge_158, v1170)).
query(true_val(effective_edge_158, unk_effective_edge_158)).

0.72::acc(s2, recommended_weight_range_size).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size
% @values r70_100=70_100kg unk_recommended_weight_range_size=Unknown
% @importance 1.00

0.71::true_val(recommended_weight_range_size, r70_100); 0.29::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s2, recommended_weight_range_size, r70_100).

all_consistent(recommended_weight_range_size) :-
    consistent(s2, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, r70_100)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

0.72::acc(s2, waist_width_161).

% @attr waist_width_161
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width (161cm)
% @values v264=264.0 unk_waist_width_161=Unknown
% @importance 1.00

0.71::true_val(waist_width_161, v264); 0.29::true_val(waist_width_161, unk_waist_width_161).

measured(s2, waist_width_161, v264).

all_consistent(waist_width_161) :-
    consistent(s2, waist_width_161).

evidence(all_consistent(waist_width_161)).
query(true_val(waist_width_161, v264)).
query(true_val(waist_width_161, unk_waist_width_161)).

0.72::acc(s2, setback_161).

% @attr setback_161
% @type numeric
% @unit mm
% @canonical false
% @original_name setback (161cm)
% @values v30=30.0 unk_setback_161=Unknown
% @importance 1.00

0.71::true_val(setback_161, v30); 0.29::true_val(setback_161, unk_setback_161).

measured(s2, setback_161, v30).

all_consistent(setback_161) :-
    consistent(s2, setback_161).

evidence(all_consistent(setback_161)).
query(true_val(setback_161, v30)).
query(true_val(setback_161, unk_setback_161)).

0.72::acc(s2, tip_tail_width_size_161).

% @attr tip_tail_width_size_161
% @type categorical
% @unit mm
% @canonical false
% @original_name tip_tail_width_size (161cm)
% @values v312_300=312_300mm unk_tip_tail_width_size_161=Unknown
% @importance 1.00

0.71::true_val(tip_tail_width_size_161, v312_300); 0.29::true_val(tip_tail_width_size_161, unk_tip_tail_width_size_161).

measured(s2, tip_tail_width_size_161, v312_300).

all_consistent(tip_tail_width_size_161) :-
    consistent(s2, tip_tail_width_size_161).

evidence(all_consistent(tip_tail_width_size_161)).
query(true_val(tip_tail_width_size_161, v312_300)).
query(true_val(tip_tail_width_size_161, unk_tip_tail_width_size_161)).

0.72::acc(s2, effective_edge_161).

% @attr effective_edge_161
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge (161cm)
% @values v1190=1190.0 unk_effective_edge_161=Unknown
% @importance 1.00

0.71::true_val(effective_edge_161, v1190); 0.29::true_val(effective_edge_161, unk_effective_edge_161).

measured(s2, effective_edge_161, v1190).

all_consistent(effective_edge_161) :-
    consistent(s2, effective_edge_161).

evidence(all_consistent(effective_edge_161)).
query(true_val(effective_edge_161, v1190)).
query(true_val(effective_edge_161, unk_effective_edge_161)).

0.72::acc(s2, recommended_weight_range_size_161).

% @attr recommended_weight_range_size_161
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (161cm)
% @values r80_plus=80plus_kg unk_recommended_weight_range_size_161=Unknown
% @importance 1.00

0.71::true_val(recommended_weight_range_size_161, r80_plus); 0.29::true_val(recommended_weight_range_size_161, unk_recommended_weight_range_size_161).

measured(s2, recommended_weight_range_size_161, r80_plus).

all_consistent(recommended_weight_range_size_161) :-
    consistent(s2, recommended_weight_range_size_161).

evidence(all_consistent(recommended_weight_range_size_161)).
query(true_val(recommended_weight_range_size_161, r80_plus)).
query(true_val(recommended_weight_range_size_161, unk_recommended_weight_range_size_161)).

0.78::acc(s1, shape).
0.72::acc(s2, shape).
0.70::acc(s12, shape).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 0.90

0.95::true_val(shape, tapered_directional); 0.05::true_val(shape, unk_shape).

measured(s1, shape, tapered_directional).
measured(s2, shape, tapered_directional).
measured(s12, shape, tapered_directional).

all_consistent(shape) :-
    consistent(s2, shape),
    (indep(s1), consistent(s1, shape) ; \+indep(s1)),
    (indep(s12), consistent(s12, shape) ; \+indep(s12)).

evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

0.78::acc(s1, shape_detail).
0.70::acc(s12, shape_detail).

% @attr shape_detail
% @type categorical
% @canonical false
% @original_name shape (detail)
% @values longer_nose_tapered_tail=Longer_nose_tapered_tail unk_shape_detail=Unknown
% @importance 0.85

0.95::true_val(shape_detail, longer_nose_tapered_tail); 0.05::true_val(shape_detail, unk_shape_detail).

measured(s1, shape_detail, longer_nose_tapered_tail).
measured(s12, shape_detail, longer_nose_tapered_tail).

all_consistent(shape_detail) :-
    (indep(s1), consistent(s1, shape_detail) ; \+indep(s1)),
    (indep(s12), consistent(s12, shape_detail) ; \+indep(s12)).

evidence(all_consistent(shape_detail)).
query(true_val(shape_detail, longer_nose_tapered_tail)).
query(true_val(shape_detail, unk_shape_detail)).

0.85::acc(s15, taper).
0.85::acc(s18, taper).

% @attr taper
% @type numeric
% @unit mm
% @canonical true
% @original_name taper
% @values v12=12.0 unk_taper=Unknown
% @importance 0.83

0.95::true_val(taper, v12); 0.05::true_val(taper, unk_taper).

measured(s15, taper, v12).
measured(s18, taper, v12).

all_consistent(taper) :-
    consistent(s15, taper),
    consistent(s18, taper).

evidence(all_consistent(taper)).
query(true_val(taper, v12)).
query(true_val(taper, unk_taper)).

0.78::acc(s1, camber_type).
0.72::acc(s2, camber_type).
0.70::acc(s12, camber_type).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values powder_camber=Powder_Camber unk_camber_type=Unknown
% @importance 0.90

0.95::true_val(camber_type, powder_camber); 0.05::true_val(camber_type, unk_camber_type).

measured(s1, camber_type, powder_camber).
measured(s2, camber_type, powder_camber).
measured(s12, camber_type, powder_camber).

all_consistent(camber_type) :-
    consistent(s2, camber_type),
    (indep(s1), consistent(s1, camber_type) ; \+indep(s1)),
    (indep(s12), consistent(s12, camber_type) ; \+indep(s12)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, powder_camber)).
query(true_val(camber_type, unk_camber_type)).

0.72::acc(s2, camber_description).
0.70::acc(s12, camber_description).
0.93::acc(s19, camber_description).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values camber_with_rocker_nose=Traditional_camber_with_reverse_camber_nose unk_camber_description=Unknown
% @importance 0.90

0.95::true_val(camber_description, camber_with_rocker_nose); 0.05::true_val(camber_description, unk_camber_description).

measured(s2, camber_description, camber_with_rocker_nose).
measured(s12, camber_description, camber_with_rocker_nose).
measured(s19, camber_description, camber_with_rocker_nose).

all_consistent(camber_description) :-
    consistent(s19, camber_description),
    (indep(s2), consistent(s2, camber_description) ; \+indep(s2)),
    (indep(s12), consistent(s12, camber_description) ; \+indep(s12)).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, camber_with_rocker_nose)).
query(true_val(camber_description, unk_camber_description)).

0.70::acc(s2, sidecut_type).
0.93::acc(s19, sidecut_type).
0.58::acc(s20, sidecut_type).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values quadratic=Quadratic radial=Radial
% @importance 0.77

0.40::true_val(sidecut_type, quadratic); 0.60::true_val(sidecut_type, radial).

measured(s2, sidecut_type, quadratic).
measured(s19, sidecut_type, radial).
measured(s20, sidecut_type, radial).

all_consistent(sidecut_type) :-
    consistent(s19, sidecut_type),
    (indep(s2), consistent(s2, sidecut_type) ; \+indep(s2)),
    (indep(s20), consistent(s20, sidecut_type) ; \+indep(s20)).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, quadratic)).
query(true_val(sidecut_type, radial)).

0.82::acc(s15, stance_width_range_size).

% @attr stance_width_range_size
% @type categorical
% @canonical true
% @original_name stance_width_range_size
% @values setback_over_20mm=Setback_over_20mm unk_stance_width_range_size=Unknown
% @importance 0.95

0.78::true_val(stance_width_range_size, setback_over_20mm); 0.22::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s15, stance_width_range_size, setback_over_20mm).

all_consistent(stance_width_range_size) :-
    consistent(s15, stance_width_range_size).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, setback_over_20mm)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

0.82::acc(s15, stance_width_range_size_detail).

% @attr stance_width_range_size_detail
% @type categorical
% @canonical false
% @original_name stance_width_range_size (detail)
% @values unique_5x2_7x2=Unique_5x2_front_7x2_back unk_stance_width_range_size_detail=Unknown
% @importance 0.95

0.78::true_val(stance_width_range_size_detail, unique_5x2_7x2); 0.22::true_val(stance_width_range_size_detail, unk_stance_width_range_size_detail).

measured(s15, stance_width_range_size_detail, unique_5x2_7x2).

all_consistent(stance_width_range_size_detail) :-
    consistent(s15, stance_width_range_size_detail).

evidence(all_consistent(stance_width_range_size_detail)).
query(true_val(stance_width_range_size_detail, unique_5x2_7x2)).
query(true_val(stance_width_range_size_detail, unk_stance_width_range_size_detail)).

0.70::acc(s2, flex_rating_10).
0.93::acc(s17, flex_rating_10).
0.82::acc(s15, flex_rating_10).

% @attr flex_rating_10
% @type categorical
% @canonical true
% @original_name flex_rating_10
% @values soft=Soft medium=Medium
% @importance 0.95

0.35::true_val(flex_rating_10, soft); 0.65::true_val(flex_rating_10, medium).

measured(s2, flex_rating_10, soft).
measured(s17, flex_rating_10, medium).
measured(s15, flex_rating_10, medium).

all_consistent(flex_rating_10) :-
    consistent(s17, flex_rating_10),
    consistent(s15, flex_rating_10),
    (indep(s2), consistent(s2, flex_rating_10) ; \+indep(s2)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, soft)).
query(true_val(flex_rating_10, medium)).

0.82::acc(s15, flex_feel).

% @attr flex_feel
% @type categorical
% @canonical false
% @original_name flex_feel
% @values softer_middle_mellow=Softer_flex_middle_mellow unk_flex_feel=Unknown
% @importance 0.95

0.78::true_val(flex_feel, softer_middle_mellow); 0.22::true_val(flex_feel, unk_flex_feel).

measured(s15, flex_feel, softer_middle_mellow).

all_consistent(flex_feel) :-
    consistent(s15, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, softer_middle_mellow)).
query(true_val(flex_feel, unk_flex_feel)).

0.82::acc(s15, flex_direction).

% @attr flex_direction
% @type categorical
% @canonical false
% @original_name flex_direction
% @values directional_tail_stiffer=Directional_tail_stiffer unk_flex_direction=Unknown
% @importance 0.95

0.78::true_val(flex_direction, directional_tail_stiffer); 0.22::true_val(flex_direction, unk_flex_direction).

measured(s15, flex_direction, directional_tail_stiffer).

all_consistent(flex_direction) :-
    consistent(s15, flex_direction).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional_tail_stiffer)).
query(true_val(flex_direction, unk_flex_direction)).

0.72::acc(s2, core_material).
0.93::acc(s19, core_material).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values ghost_green_core=Ghost_Green_Core unk_core_material=Unknown
% @importance 0.98

0.95::true_val(core_material, ghost_green_core); 0.05::true_val(core_material, unk_core_material).

measured(s2, core_material, ghost_green_core).
measured(s19, core_material, ghost_green_core).

all_consistent(core_material) :-
    consistent(s19, core_material),
    (indep(s2), consistent(s2, core_material) ; \+indep(s2)).

evidence(all_consistent(core_material)).
query(true_val(core_material, ghost_green_core)).
query(true_val(core_material, unk_core_material)).

0.93::acc(s19, core_material_wood).
0.65::acc(s21, core_material_wood).

% @attr core_material_wood
% @type categorical
% @canonical false
% @original_name core_material (wood species)
% @values paulownia=Paulownia unk_core_material_wood=Unknown
% @importance 0.85

0.95::true_val(core_material_wood, paulownia); 0.05::true_val(core_material_wood, unk_core_material_wood).

measured(s19, core_material_wood, paulownia).
measured(s21, core_material_wood, paulownia).

all_consistent(core_material_wood) :-
    consistent(s19, core_material_wood),
    (indep(s21), consistent(s21, core_material_wood) ; \+indep(s21)).

evidence(all_consistent(core_material_wood)).
query(true_val(core_material_wood, paulownia)).
query(true_val(core_material_wood, unk_core_material_wood)).

0.72::acc(s2, core_material_profile).
0.93::acc(s19, core_material_profile).

% @attr core_material_profile
% @type categorical
% @canonical false
% @original_name core_material (profile tech)
% @values popster=Popster unk_core_material_profile=Unknown
% @importance 0.98

0.95::true_val(core_material_profile, popster); 0.05::true_val(core_material_profile, unk_core_material_profile).

measured(s2, core_material_profile, popster).
measured(s19, core_material_profile, popster).

all_consistent(core_material_profile) :-
    consistent(s19, core_material_profile),
    (indep(s2), consistent(s2, core_material_profile) ; \+indep(s2)).

evidence(all_consistent(core_material_profile)).
query(true_val(core_material_profile, popster)).
query(true_val(core_material_profile, unk_core_material_profile)).

0.65::acc(s22, sustainability_certification).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values fsc_certified=FSC_certified_woodcore unk_sustainability_certification=Unknown
% @importance 0.80

0.63::true_val(sustainability_certification, fsc_certified); 0.37::true_val(sustainability_certification, unk_sustainability_certification).

measured(s22, sustainability_certification, fsc_certified).

all_consistent(sustainability_certification) :-
    consistent(s22, sustainability_certification).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, fsc_certified)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

0.72::acc(s2, construction_material_innovation).
0.93::acc(s19, construction_material_innovation).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values abc_wrapper=ABC_Wrapper_bamboo_veneers_40pct_reduction unk_construction_material_innovation=Unknown
% @importance 0.88

0.95::true_val(construction_material_innovation, abc_wrapper); 0.05::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s2, construction_material_innovation, abc_wrapper).
measured(s19, construction_material_innovation, abc_wrapper).

all_consistent(construction_material_innovation) :-
    consistent(s19, construction_material_innovation),
    (indep(s2), consistent(s2, construction_material_innovation) ; \+indep(s2)).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, abc_wrapper)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

0.72::acc(s2, laminate).
0.65::acc(s21, laminate).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values ba_md_glass=BA_MD_Glass_medium_density_fiberglass unk_laminate=Unknown
% @importance 0.88

0.95::true_val(laminate, ba_md_glass); 0.05::true_val(laminate, unk_laminate).

measured(s2, laminate, ba_md_glass).
measured(s21, laminate, ba_md_glass).

all_consistent(laminate) :-
    (indep(s2), consistent(s2, laminate) ; \+indep(s2)),
    (indep(s21), consistent(s21, laminate) ; \+indep(s21)).

evidence(all_consistent(laminate)).
query(true_val(laminate, ba_md_glass)).
query(true_val(laminate, unk_laminate)).

0.65::acc(s22, construction_material_innovation_carbon).
0.65::acc(s23, construction_material_innovation_carbon).

% @attr construction_material_innovation_carbon
% @type categorical
% @canonical false
% @original_name construction_material_innovation (carbon stringers)
% @values ghost_carbon_stringers=Ghost_Carbon_Stringers unk_construction_material_innovation_carbon=Unknown
% @importance 0.75

0.95::true_val(construction_material_innovation_carbon, ghost_carbon_stringers); 0.05::true_val(construction_material_innovation_carbon, unk_construction_material_innovation_carbon).

measured(s22, construction_material_innovation_carbon, ghost_carbon_stringers).
measured(s23, construction_material_innovation_carbon, ghost_carbon_stringers).

all_consistent(construction_material_innovation_carbon) :-
    (indep(s22), consistent(s22, construction_material_innovation_carbon) ; \+indep(s22)),
    (indep(s23), consistent(s23, construction_material_innovation_carbon) ; \+indep(s23)).

evidence(all_consistent(construction_material_innovation_carbon)).
query(true_val(construction_material_innovation_carbon, ghost_carbon_stringers)).
query(true_val(construction_material_innovation_carbon, unk_construction_material_innovation_carbon)).

0.72::acc(s2, resin).
0.65::acc(s23, resin).

% @attr resin
% @type categorical
% @canonical true
% @original_name resin
% @values bio_resin_30pct=30pct_Bio_Resin unk_resin=Unknown
% @importance 0.85

0.95::true_val(resin, bio_resin_30pct); 0.05::true_val(resin, unk_resin).

measured(s2, resin, bio_resin_30pct).
measured(s23, resin, bio_resin_30pct).

all_consistent(resin) :-
    (indep(s2), consistent(s2, resin) ; \+indep(s2)),
    (indep(s23), consistent(s23, resin) ; \+indep(s23)).

evidence(all_consistent(resin)).
query(true_val(resin, bio_resin_30pct)).
query(true_val(resin, unk_resin)).

0.70::acc(s2, sidewall_material).
0.88::acc(s19, sidewall_material).
0.70::acc(s24, sidewall_material).
0.82::acc(s15, sidewall_material).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values recycled_abs=Recycled_ABS bamboo_cork=Bamboo_Cork_Rails
% @importance 0.85

0.45::true_val(sidewall_material, recycled_abs); 0.55::true_val(sidewall_material, bamboo_cork).

measured(s2, sidewall_material, recycled_abs).
measured(s15, sidewall_material, recycled_abs).
measured(s19, sidewall_material, bamboo_cork).
measured(s24, sidewall_material, bamboo_cork).

all_consistent(sidewall_material) :-
    consistent(s19, sidewall_material),
    consistent(s15, sidewall_material),
    (indep(s2), consistent(s2, sidewall_material) ; \+indep(s2)),
    (indep(s24), consistent(s24, sidewall_material) ; \+indep(s24)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, recycled_abs)).
query(true_val(sidewall_material, bamboo_cork)).

0.65::acc(s21, construction_material_innovation_damplifier).
0.65::acc(s23, construction_material_innovation_damplifier).

% @attr construction_material_innovation_damplifier
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Damplifier)
% @values damplifier_lite=Damplifier_Lite_cork_honeycomb unk_construction_material_innovation_damplifier=Unknown
% @importance 0.73

0.95::true_val(construction_material_innovation_damplifier, damplifier_lite); 0.05::true_val(construction_material_innovation_damplifier, unk_construction_material_innovation_damplifier).

measured(s21, construction_material_innovation_damplifier, damplifier_lite).
measured(s23, construction_material_innovation_damplifier, damplifier_lite).

all_consistent(construction_material_innovation_damplifier) :-
    (indep(s21), consistent(s21, construction_material_innovation_damplifier) ; \+indep(s21)),
    (indep(s23), consistent(s23, construction_material_innovation_damplifier) ; \+indep(s23)).

evidence(all_consistent(construction_material_innovation_damplifier)).
query(true_val(construction_material_innovation_damplifier, damplifier_lite)).
query(true_val(construction_material_innovation_damplifier, unk_construction_material_innovation_damplifier)).

0.72::acc(s2, base_material).
0.93::acc(s19, base_material).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_eg=Sintered_EG_Electra_Gallium unk_base_material=Unknown
% @importance 0.98

0.95::true_val(base_material, sintered_eg); 0.05::true_val(base_material, unk_base_material).

measured(s2, base_material, sintered_eg).
measured(s19, base_material, sintered_eg).

all_consistent(base_material) :-
    consistent(s19, base_material),
    (indep(s2), consistent(s2, base_material) ; \+indep(s2)).

evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_eg)).
query(true_val(base_material, unk_base_material)).

0.72::acc(s2, base_type).
0.93::acc(s19, base_type).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values fine_stone_finish=Fine_Stone_Finish unk_base_type=Unknown
% @importance 0.98

0.95::true_val(base_type, fine_stone_finish); 0.05::true_val(base_type, unk_base_type).

measured(s2, base_type, fine_stone_finish).
measured(s19, base_type, fine_stone_finish).

all_consistent(base_type) :-
    consistent(s19, base_type),
    (indep(s2), consistent(s2, base_type) ; \+indep(s2)).

evidence(all_consistent(base_type)).
query(true_val(base_type, fine_stone_finish)).
query(true_val(base_type, unk_base_type)).

0.93::acc(s17, sustainability_certification_wax).

% @attr sustainability_certification_wax
% @type categorical
% @canonical false
% @original_name sustainability_certification (natural wax)
% @values natural_wax=Natural_paraffin_free_wax unk_sustainability_certification_wax=Unknown
% @importance 0.90

0.90::true_val(sustainability_certification_wax, natural_wax); 0.10::true_val(sustainability_certification_wax, unk_sustainability_certification_wax).

measured(s17, sustainability_certification_wax, natural_wax).

all_consistent(sustainability_certification_wax) :-
    consistent(s17, sustainability_certification_wax).

evidence(all_consistent(sustainability_certification_wax)).
query(true_val(sustainability_certification_wax, natural_wax)).
query(true_val(sustainability_certification_wax, unk_sustainability_certification_wax)).

0.72::acc(s2, edge_technology).
0.70::acc(s24, edge_technology).

% @attr edge_technology
% @type categorical
% @canonical false
% @original_name edge_technology
% @values all_mountain_edge_bevel=All_Mountain_Edge_Bevel unk_edge_technology=Unknown
% @importance 0.88

0.95::true_val(edge_technology, all_mountain_edge_bevel); 0.05::true_val(edge_technology, unk_edge_technology).

measured(s2, edge_technology, all_mountain_edge_bevel).
measured(s24, edge_technology, all_mountain_edge_bevel).

all_consistent(edge_technology) :-
    (indep(s2), consistent(s2, edge_technology) ; \+indep(s2)),
    (indep(s24), consistent(s24, edge_technology) ; \+indep(s24)).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, all_mountain_edge_bevel)).
query(true_val(edge_technology, unk_edge_technology)).

0.70::acc(s24, edge_bevel_spec).

% @attr edge_bevel_spec
% @type categorical
% @canonical false
% @original_name edge_bevel_spec
% @values deg1_nose_tail_deg2_feet=1deg_nose_tail_2deg_between_feet unk_edge_bevel_spec=Unknown
% @importance 0.75

0.68::true_val(edge_bevel_spec, deg1_nose_tail_deg2_feet); 0.32::true_val(edge_bevel_spec, unk_edge_bevel_spec).

measured(s24, edge_bevel_spec, deg1_nose_tail_deg2_feet).

all_consistent(edge_bevel_spec) :-
    consistent(s24, edge_bevel_spec).

evidence(all_consistent(edge_bevel_spec)).
query(true_val(edge_bevel_spec, deg1_nose_tail_deg2_feet)).
query(true_val(edge_bevel_spec, unk_edge_bevel_spec)).

0.72::acc(s2, mounting_pattern).
0.70::acc(s24, mounting_pattern).

% @attr mounting_pattern
% @type categorical
% @canonical false
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 0.88

0.95::true_val(mounting_pattern, inserts_2x4); 0.05::true_val(mounting_pattern, unk_mounting_pattern).

measured(s2, mounting_pattern, inserts_2x4).
measured(s24, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :-
    (indep(s2), consistent(s2, mounting_pattern) ; \+indep(s2)),
    (indep(s24), consistent(s24, mounting_pattern) ; \+indep(s24)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

0.72::acc(s2, price_aud_merchant).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v569_99=569.99 unk_price_aud_merchant=Unknown
% @importance 1.00

0.71::true_val(price_aud_merchant, v569_99); 0.29::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s2, price_aud_merchant, v569_99).

all_consistent(price_aud_merchant) :-
    consistent(s2, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v569_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

0.72::acc(s2, price_aud_merchant_rrp).

% @attr price_aud_merchant_rrp
% @type numeric
% @unit AUD
% @canonical false
% @original_name price_aud_merchant (RRP)
% @values v949_99=949.99 unk_price_aud_merchant_rrp=Unknown
% @importance 1.00

0.71::true_val(price_aud_merchant_rrp, v949_99); 0.29::true_val(price_aud_merchant_rrp, unk_price_aud_merchant_rrp).

measured(s2, price_aud_merchant_rrp, v949_99).

all_consistent(price_aud_merchant_rrp) :-
    consistent(s2, price_aud_merchant_rrp).

evidence(all_consistent(price_aud_merchant_rrp)).
query(true_val(price_aud_merchant_rrp, v949_99)).
query(true_val(price_aud_merchant_rrp, unk_price_aud_merchant_rrp)).

0.72::acc(s2, availability_status_155_soldout).

% @attr availability_status_155_soldout
% @type categorical
% @canonical false
% @original_name availability_status (155cm sold out)
% @values sold_out=Sold_out_155cm unk_availability_status_155_soldout=Unknown
% @importance 1.00

0.71::true_val(availability_status_155_soldout, sold_out); 0.29::true_val(availability_status_155_soldout, unk_availability_status_155_soldout).

measured(s2, availability_status_155_soldout, sold_out).

all_consistent(availability_status_155_soldout) :-
    consistent(s2, availability_status_155_soldout).

evidence(all_consistent(availability_status_155_soldout)).
query(true_val(availability_status_155_soldout, sold_out)).
query(true_val(availability_status_155_soldout, unk_availability_status_155_soldout)).

0.82::acc(s15, price_usd_msrp).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v669=669.0 unk_price_usd_msrp=Unknown
% @importance 0.95

0.78::true_val(price_usd_msrp, v669); 0.22::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s15, price_usd_msrp, v669).

all_consistent(price_usd_msrp) :-
    consistent(s15, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v669)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

0.55::acc(s25, price_usd_sundance_ep).

% @attr price_usd_sundance_ep
% @type numeric
% @unit USD
% @canonical false
% @original_name USD price (Sundance Ski Shop, E.P. variant)
% @values v432=432.0 unk_price_usd_sundance_ep=Unknown
% @importance 0.80

0.46::true_val(price_usd_sundance_ep, v432); 0.54::true_val(price_usd_sundance_ep, unk_price_usd_sundance_ep).

measured(s25, price_usd_sundance_ep, v432).

all_consistent(price_usd_sundance_ep) :-
    consistent(s25, price_usd_sundance_ep).

evidence(all_consistent(price_usd_sundance_ep)).
query(true_val(price_usd_sundance_ep, v432)).
query(true_val(price_usd_sundance_ep, unk_price_usd_sundance_ep)).

0.65::acc(s22, price_cad_comor).

% @attr price_cad_comor
% @type numeric
% @unit CAD
% @canonical false
% @original_name CAD price (Comor Sports, 2024 clearance)
% @values v461_99=461.99 unk_price_cad_comor=Unknown
% @importance 0.80

0.63::true_val(price_cad_comor, v461_99); 0.37::true_val(price_cad_comor, unk_price_cad_comor).

measured(s22, price_cad_comor, v461_99).

all_consistent(price_cad_comor) :-
    consistent(s22, price_cad_comor).

evidence(all_consistent(price_cad_comor)).
query(true_val(price_cad_comor, v461_99)).
query(true_val(price_cad_comor, unk_price_cad_comor)).

0.82::acc(s15, price_eur_snowcountry).

% @attr price_eur_snowcountry
% @type numeric
% @unit EUR
% @canonical false
% @original_name EUR price (SnowCountry, 2025 model)
% @values v389=389.0 unk_price_eur_snowcountry=Unknown
% @importance 0.95

0.78::true_val(price_eur_snowcountry, v389); 0.22::true_val(price_eur_snowcountry, unk_price_eur_snowcountry).

measured(s15, price_eur_snowcountry, v389).

all_consistent(price_eur_snowcountry) :-
    consistent(s15, price_eur_snowcountry).

evidence(all_consistent(price_eur_snowcountry)).
query(true_val(price_eur_snowcountry, v389)).
query(true_val(price_eur_snowcountry, unk_price_eur_snowcountry)).

0.82::acc(s15, price_cad_prfo).

% @attr price_cad_prfo
% @type numeric
% @unit CAD
% @canonical true
% @original_name price_cad_prfo
% @values v394_99=394.99 unk_price_cad_prfo=Unknown
% @importance 0.95

0.78::true_val(price_cad_prfo, v394_99); 0.22::true_val(price_cad_prfo, unk_price_cad_prfo).

measured(s15, price_cad_prfo, v394_99).

all_consistent(price_cad_prfo) :-
    consistent(s15, price_cad_prfo).

evidence(all_consistent(price_cad_prfo)).
query(true_val(price_cad_prfo, v394_99)).
query(true_val(price_cad_prfo, unk_price_cad_prfo)).

0.50::acc(s26, price_cad_local_demo).

% @attr price_cad_local_demo
% @type numeric
% @unit CAD
% @canonical false
% @original_name CAD price (The Local Skate Shop, demo)
% @values v435=435.0 unk_price_cad_local_demo=Unknown
% @importance 0.70

0.41::true_val(price_cad_local_demo, v435); 0.59::true_val(price_cad_local_demo, unk_price_cad_local_demo).

measured(s26, price_cad_local_demo, v435).

all_consistent(price_cad_local_demo) :-
    consistent(s26, price_cad_local_demo).

evidence(all_consistent(price_cad_local_demo)).
query(true_val(price_cad_local_demo, v435)).
query(true_val(price_cad_local_demo, unk_price_cad_local_demo)).

0.90::acc(s17, availability_status_salomon).
0.90::acc(s19, availability_status_salomon).

% @attr availability_status_salomon
% @type categorical
% @canonical false
% @original_name availability_status (Salomon official)
% @values listed_freeride=Listed_as_Freeride unk_availability_status_salomon=Unknown
% @importance 0.78

0.95::true_val(availability_status_salomon, listed_freeride); 0.05::true_val(availability_status_salomon, unk_availability_status_salomon).

measured(s17, availability_status_salomon, listed_freeride).
measured(s19, availability_status_salomon, listed_freeride).

all_consistent(availability_status_salomon) :-
    consistent(s17, availability_status_salomon),
    consistent(s19, availability_status_salomon).

evidence(all_consistent(availability_status_salomon)).
query(true_val(availability_status_salomon, listed_freeride)).
query(true_val(availability_status_salomon, unk_availability_status_salomon)).

0.72::acc(s27, availability_status_evo).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status (evo.com)
% @values listed=Listed unk_availability_status_evo=Unknown
% @importance 0.65

0.64::true_val(availability_status_evo, listed); 0.36::true_val(availability_status_evo, unk_availability_status_evo).

measured(s27, availability_status_evo, listed).

all_consistent(availability_status_evo) :-
    consistent(s27, availability_status_evo).

evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, listed)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

0.78::acc(s1, availability_status_backcountry).

% @attr availability_status_backcountry
% @type categorical
% @canonical false
% @original_name availability_status (Backcountry.com)
% @values listed=Listed unk_availability_status_backcountry=Unknown
% @importance 0.90

0.72::true_val(availability_status_backcountry, listed); 0.28::true_val(availability_status_backcountry, unk_availability_status_backcountry).

measured(s1, availability_status_backcountry, listed).

all_consistent(availability_status_backcountry) :-
    consistent(s1, availability_status_backcountry).

evidence(all_consistent(availability_status_backcountry)).
query(true_val(availability_status_backcountry, listed)).
query(true_val(availability_status_backcountry, unk_availability_status_backcountry)).

0.70::acc(s12, availability_status_boyne).

% @attr availability_status_boyne
% @type categorical
% @canonical false
% @original_name availability_status (Boyne Country Sports)
% @values listed=Listed unk_availability_status_boyne=Unknown
% @importance 0.80

0.68::true_val(availability_status_boyne, listed); 0.32::true_val(availability_status_boyne, unk_availability_status_boyne).

measured(s12, availability_status_boyne, listed).

all_consistent(availability_status_boyne) :-
    consistent(s12, availability_status_boyne).

evidence(all_consistent(availability_status_boyne)).
query(true_val(availability_status_boyne, listed)).
query(true_val(availability_status_boyne, unk_availability_status_boyne)).

0.65::acc(s22, availability_status_comor).

% @attr availability_status_comor
% @type categorical
% @canonical false
% @original_name availability_status (Comor Sports)
% @values listed=Listed unk_availability_status_comor=Unknown
% @importance 0.80

0.63::true_val(availability_status_comor, listed); 0.37::true_val(availability_status_comor, unk_availability_status_comor).

measured(s22, availability_status_comor, listed).

all_consistent(availability_status_comor) :-
    consistent(s22, availability_status_comor).

evidence(all_consistent(availability_status_comor)).
query(true_val(availability_status_comor, listed)).
query(true_val(availability_status_comor, unk_availability_status_comor)).

0.65::acc(s21, availability_status_snowcountry).

% @attr availability_status_snowcountry
% @type categorical
% @canonical false
% @original_name availability_status (SnowCountry.eu)
% @values listed=Listed unk_availability_status_snowcountry=Unknown
% @importance 0.75

0.63::true_val(availability_status_snowcountry, listed); 0.37::true_val(availability_status_snowcountry, unk_availability_status_snowcountry).

measured(s21, availability_status_snowcountry, listed).

all_consistent(availability_status_snowcountry) :-
    consistent(s21, availability_status_snowcountry).

evidence(all_consistent(availability_status_snowcountry)).
query(true_val(availability_status_snowcountry, listed)).
query(true_val(availability_status_snowcountry, unk_availability_status_snowcountry)).

0.58::acc(s20, availability_status_behindthepines).

% @attr availability_status_behindthepines
% @type categorical
% @canonical false
% @original_name availability_status (Behind The Pines)
% @values listed=Listed unk_availability_status_behindthepines=Unknown
% @importance 0.70

0.52::true_val(availability_status_behindthepines, listed); 0.48::true_val(availability_status_behindthepines, unk_availability_status_behindthepines).

measured(s20, availability_status_behindthepines, listed).

all_consistent(availability_status_behindthepines) :-
    consistent(s20, availability_status_behindthepines).

evidence(all_consistent(availability_status_behindthepines)).
query(true_val(availability_status_behindthepines, listed)).
query(true_val(availability_status_behindthepines, unk_availability_status_behindthepines)).

0.60::acc(s3, availability_status_skipro).

% @attr availability_status_skipro
% @type categorical
% @canonical false
% @original_name availability_status (Ski Pro AZ)
% @values listed=Listed unk_availability_status_skipro=Unknown
% @importance 0.70

0.55::true_val(availability_status_skipro, listed); 0.45::true_val(availability_status_skipro, unk_availability_status_skipro).

measured(s3, availability_status_skipro, listed).

all_consistent(availability_status_skipro) :-
    consistent(s3, availability_status_skipro).

evidence(all_consistent(availability_status_skipro)).
query(true_val(availability_status_skipro, listed)).
query(true_val(availability_status_skipro, unk_availability_status_skipro)).

0.55::acc(s28, availability_status_powder7).

% @attr availability_status_powder7
% @type categorical
% @canonical false
% @original_name availability_status (Powder7)
% @values listed_used_demo=Listed_used_demo unk_availability_status_powder7=Unknown
% @importance 0.50

0.46::true_val(availability_status_powder7, listed_used_demo); 0.54::true_val(availability_status_powder7, unk_availability_status_powder7).

measured(s28, availability_status_powder7, listed_used_demo).

all_consistent(availability_status_powder7) :-
    consistent(s28, availability_status_powder7).

evidence(all_consistent(availability_status_powder7)).
query(true_val(availability_status_powder7, listed_used_demo)).
query(true_val(availability_status_powder7, unk_availability_status_powder7)).

0.68::acc(s5, availability_status_wilderness).

% @attr availability_status_wilderness
% @type categorical
% @canonical false
% @original_name availability_status (Wilderness Safe Co)
% @values listed=Listed unk_availability_status_wilderness=Unknown
% @importance 0.80

0.63::true_val(availability_status_wilderness, listed); 0.37::true_val(availability_status_wilderness, unk_availability_status_wilderness).

measured(s5, availability_status_wilderness, listed).

all_consistent(availability_status_wilderness) :-
    consistent(s5, availability_status_wilderness).

evidence(all_consistent(availability_status_wilderness)).
query(true_val(availability_status_wilderness, listed)).
query(true_val(availability_status_wilderness, unk_availability_status_wilderness)).

0.50::acc(s29, availability_status_melbourne).

% @attr availability_status_melbourne
% @type categorical
% @canonical false
% @original_name availability_status (Melbourne Snowboard)
% @values listed=Listed unk_availability_status_melbourne=Unknown
% @importance 0.50

0.42::true_val(availability_status_melbourne, listed); 0.58::true_val(availability_status_melbourne, unk_availability_status_melbourne).

measured(s29, availability_status_melbourne, listed).

all_consistent(availability_status_melbourne) :-
    consistent(s29, availability_status_melbourne).

evidence(all_consistent(availability_status_melbourne)).
query(true_val(availability_status_melbourne, listed)).
query(true_val(availability_status_melbourne, unk_availability_status_melbourne)).

0.55::acc(s30, availability_status_absolutesnow).

% @attr availability_status_absolutesnow
% @type categorical
% @canonical false
% @original_name availability_status (Absolute-Snow.com)
% @values listed=Listed unk_availability_status_absolutesnow=Unknown
% @importance 0.50

0.46::true_val(availability_status_absolutesnow, listed); 0.54::true_val(availability_status_absolutesnow, unk_availability_status_absolutesnow).

measured(s30, availability_status_absolutesnow, listed).

all_consistent(availability_status_absolutesnow) :-
    consistent(s30, availability_status_absolutesnow).

evidence(all_consistent(availability_status_absolutesnow)).
query(true_val(availability_status_absolutesnow, listed)).
query(true_val(availability_status_absolutesnow, unk_availability_status_absolutesnow)).

0.65::acc(s15, availability_status_prfo).

% @attr availability_status_prfo
% @type categorical
% @canonical false
% @original_name availability_status (PRFO Sports)
% @values listed=Listed unk_availability_status_prfo=Unknown
% @importance 0.95

0.78::true_val(availability_status_prfo, listed); 0.22::true_val(availability_status_prfo, unk_availability_status_prfo).

measured(s15, availability_status_prfo, listed).

all_consistent(availability_status_prfo) :-
    consistent(s15, availability_status_prfo).

evidence(all_consistent(availability_status_prfo)).
query(true_val(availability_status_prfo, listed)).
query(true_val(availability_status_prfo, unk_availability_status_prfo)).

0.70::acc(s24, availability_status_altitude).

% @attr availability_status_altitude
% @type categorical
% @canonical false
% @original_name availability_status (Altitude Sports)
% @values listed=Listed unk_availability_status_altitude=Unknown
% @importance 0.75

0.68::true_val(availability_status_altitude, listed); 0.32::true_val(availability_status_altitude, unk_availability_status_altitude).

measured(s24, availability_status_altitude, listed).

all_consistent(availability_status_altitude) :-
    consistent(s24, availability_status_altitude).

evidence(all_consistent(availability_status_altitude)).
query(true_val(availability_status_altitude, listed)).
query(true_val(availability_status_altitude, unk_availability_status_altitude)).

0.55::acc(s31, availability_status_tactics).

% @attr availability_status_tactics
% @type categorical
% @canonical false
% @original_name availability_status (Tactics Boardshop)
% @values listed=Listed unk_availability_status_tactics=Unknown
% @importance 0.40

0.45::true_val(availability_status_tactics, listed); 0.55::true_val(availability_status_tactics, unk_availability_status_tactics).

measured(s31, availability_status_tactics, listed).

all_consistent(availability_status_tactics) :-
    consistent(s31, availability_status_tactics).

evidence(all_consistent(availability_status_tactics)).
query(true_val(availability_status_tactics, listed)).
query(true_val(availability_status_tactics, unk_availability_status_tactics)).

0.72::acc(s2, availability_status).
0.82::acc(s15, availability_status).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values widely_sold_out_2024=2024_widely_sold_out_2025_select unk_availability_status=Unknown
% @importance 0.98

0.95::true_val(availability_status, widely_sold_out_2024); 0.05::true_val(availability_status, unk_availability_status).

measured(s2, availability_status, widely_sold_out_2024).
measured(s15, availability_status, widely_sold_out_2024).

all_consistent(availability_status) :-
    consistent(s15, availability_status),
    (indep(s2), consistent(s2, availability_status) ; \+indep(s2)).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, widely_sold_out_2024)).
query(true_val(availability_status, unk_availability_status)).

0.72::acc(s2, customer_rating_merchant).

% @attr customer_rating_merchant
% @type numeric
% @canonical false
% @original_name Customer rating (merchant)
% @values v5_0=5.0 unk_customer_rating_merchant=Unknown
% @importance 1.00

0.71::true_val(customer_rating_merchant, v5_0); 0.29::true_val(customer_rating_merchant, unk_customer_rating_merchant).

measured(s2, customer_rating_merchant, v5_0).

all_consistent(customer_rating_merchant) :-
    consistent(s2, customer_rating_merchant).

evidence(all_consistent(customer_rating_merchant)).
query(true_val(customer_rating_merchant, v5_0)).
query(true_val(customer_rating_merchant, unk_customer_rating_merchant)).

0.88::acc(s15, reviewer_opinion_the_good_ride).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values powder_great_carving_great_speed_good=Powder_Great_Carving_Great_Speed_Good_Uneven_Good_Switch_Avg_Jumps_Great_Jib_Good_Pipe_Good unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.95

0.78::true_val(reviewer_opinion_the_good_ride, powder_great_carving_great_speed_good); 0.22::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s15, reviewer_opinion_the_good_ride, powder_great_carving_great_speed_good).

all_consistent(reviewer_opinion_the_good_ride) :-
    consistent(s15, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, powder_great_carving_great_speed_good)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

0.88::acc(s15, reviewer_opinion_tgr_category).

% @attr reviewer_opinion_tgr_category
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (category)
% @values alternative_freeride=Alternative_Freeride unk_reviewer_opinion_tgr_category=Unknown
% @importance 0.95

0.78::true_val(reviewer_opinion_tgr_category, alternative_freeride); 0.22::true_val(reviewer_opinion_tgr_category, unk_reviewer_opinion_tgr_category).

measured(s15, reviewer_opinion_tgr_category, alternative_freeride).

all_consistent(reviewer_opinion_tgr_category) :-
    consistent(s15, reviewer_opinion_tgr_category).

evidence(all_consistent(reviewer_opinion_tgr_category)).
query(true_val(reviewer_opinion_tgr_category, alternative_freeride)).
query(true_val(reviewer_opinion_tgr_category, unk_reviewer_opinion_tgr_category)).

0.88::acc(s15, reviewer_opinion_tgr_level).

% @attr reviewer_opinion_tgr_level
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (rider level)
% @values intermediate_expert=Intermediate_to_Expert unk_reviewer_opinion_tgr_level=Unknown
% @importance 0.95

0.78::true_val(reviewer_opinion_tgr_level, intermediate_expert); 0.22::true_val(reviewer_opinion_tgr_level, unk_reviewer_opinion_tgr_level).

measured(s15, reviewer_opinion_tgr_level, intermediate_expert).

all_consistent(reviewer_opinion_tgr_level) :-
    consistent(s15, reviewer_opinion_tgr_level).

evidence(all_consistent(reviewer_opinion_tgr_level)).
query(true_val(reviewer_opinion_tgr_level, intermediate_expert)).
query(true_val(reviewer_opinion_tgr_level, unk_reviewer_opinion_tgr_level)).

0.85::acc(s15, on_snow_feel_tgr).

% @attr on_snow_feel_tgr
% @type categorical
% @canonical true
% @original_name on_snow_feel_tgr
% @values stable=Stable unk_on_snow_feel_tgr=Unknown
% @importance 0.95

0.78::true_val(on_snow_feel_tgr, stable); 0.22::true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr).

measured(s15, on_snow_feel_tgr, stable).

all_consistent(on_snow_feel_tgr) :-
    consistent(s15, on_snow_feel_tgr).

evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, stable)).
query(true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr)).

0.85::acc(s15, turn_initiation_performance).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values medium_fast=Medium_Fast unk_turn_initiation_performance=Unknown
% @importance 0.95

0.78::true_val(turn_initiation_performance, medium_fast); 0.22::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s15, turn_initiation_performance, medium_fast).

all_consistent(turn_initiation_performance) :-
    consistent(s15, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, medium_fast)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

0.85::acc(s15, edge_hold).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values hard_snow=Hard_Snow unk_edge_hold=Unknown
% @importance 0.95

0.78::true_val(edge_hold, hard_snow); 0.22::true_val(edge_hold, unk_edge_hold).

measured(s15, edge_hold, hard_snow).

all_consistent(edge_hold) :-
    consistent(s15, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, hard_snow)).
query(true_val(edge_hold, unk_edge_hold)).

0.85::acc(s15, flex_rating_10_the_good_ride).

% @attr flex_rating_10_the_good_ride
% @type categorical
% @canonical true
% @original_name flex_rating_10_the_good_ride
% @values medium=Medium unk_flex_rating_10_the_good_ride=Unknown
% @importance 0.95

0.78::true_val(flex_rating_10_the_good_ride, medium); 0.22::true_val(flex_rating_10_the_good_ride, unk_flex_rating_10_the_good_ride).

measured(s15, flex_rating_10_the_good_ride, medium).

all_consistent(flex_rating_10_the_good_ride) :-
    consistent(s15, flex_rating_10_the_good_ride).

evidence(all_consistent(flex_rating_10_the_good_ride)).
query(true_val(flex_rating_10_the_good_ride, medium)).
query(true_val(flex_rating_10_the_good_ride, unk_flex_rating_10_the_good_ride)).

0.85::acc(s15, reviewer_opinion_tgr_ease).

% @attr reviewer_opinion_tgr_ease
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (turn ease)
% @values semi_easy=Semi_Easy unk_reviewer_opinion_tgr_ease=Unknown
% @importance 0.95

0.78::true_val(reviewer_opinion_tgr_ease, semi_easy); 0.22::true_val(reviewer_opinion_tgr_ease, unk_reviewer_opinion_tgr_ease).

measured(s15, reviewer_opinion_tgr_ease, semi_easy).

all_consistent(reviewer_opinion_tgr_ease) :-
    consistent(s15, reviewer_opinion_tgr_ease).

evidence(all_consistent(reviewer_opinion_tgr_ease)).
query(true_val(reviewer_opinion_tgr_ease, semi_easy)).
query(true_val(reviewer_opinion_tgr_ease, unk_reviewer_opinion_tgr_ease)).

0.85::acc(s15, reviewer_opinion_tgr_weight).

% @attr reviewer_opinion_tgr_weight
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (weight feel)
% @values normal_bordering_light=Normal_bordering_light unk_reviewer_opinion_tgr_weight=Unknown
% @importance 0.95

0.78::true_val(reviewer_opinion_tgr_weight, normal_bordering_light); 0.22::true_val(reviewer_opinion_tgr_weight, unk_reviewer_opinion_tgr_weight).

measured(s15, reviewer_opinion_tgr_weight, normal_bordering_light).

all_consistent(reviewer_opinion_tgr_weight) :-
    consistent(s15, reviewer_opinion_tgr_weight).

evidence(all_consistent(reviewer_opinion_tgr_weight)).
query(true_val(reviewer_opinion_tgr_weight, normal_bordering_light)).
query(true_val(reviewer_opinion_tgr_weight, unk_reviewer_opinion_tgr_weight)).

0.85::acc(s15, positive_aspect).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values med_soft_poppy_flex=Med_Soft_but_Poppy_Flex unk_positive_aspect=Unknown
% @importance 0.95

0.78::true_val(positive_aspect, med_soft_poppy_flex); 0.22::true_val(positive_aspect, unk_positive_aspect).

measured(s15, positive_aspect, med_soft_poppy_flex).

all_consistent(positive_aspect) :-
    consistent(s15, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, med_soft_poppy_flex)).
query(true_val(positive_aspect, unk_positive_aspect)).

0.85::acc(s15, positive_aspect_fast_base).

% @attr positive_aspect_fast_base
% @type categorical
% @canonical false
% @original_name positive_aspect (fast base)
% @values fast_base=Fast_Base unk_positive_aspect_fast_base=Unknown
% @importance 0.95

0.78::true_val(positive_aspect_fast_base, fast_base); 0.22::true_val(positive_aspect_fast_base, unk_positive_aspect_fast_base).

measured(s15, positive_aspect_fast_base, fast_base).

all_consistent(positive_aspect_fast_base) :-
    consistent(s15, positive_aspect_fast_base).

evidence(all_consistent(positive_aspect_fast_base)).
query(true_val(positive_aspect_fast_base, fast_base)).
query(true_val(positive_aspect_fast_base, unk_positive_aspect_fast_base)).

0.85::acc(s15, positive_aspect_easy_turn).

% @attr positive_aspect_easy_turn
% @type categorical
% @canonical false
% @original_name positive_aspect (easy to turn)
% @values easy_turn_for_width=Very_Easy_To_Turn_For_Width unk_positive_aspect_easy_turn=Unknown
% @importance 0.95

0.78::true_val(positive_aspect_easy_turn, easy_turn_for_width); 0.22::true_val(positive_aspect_easy_turn, unk_positive_aspect_easy_turn).

measured(s15, positive_aspect_easy_turn, easy_turn_for_width).

all_consistent(positive_aspect_easy_turn) :-
    consistent(s15, positive_aspect_easy_turn).

evidence(all_consistent(positive_aspect_easy_turn)).
query(true_val(positive_aspect_easy_turn, easy_turn_for_width)).
query(true_val(positive_aspect_easy_turn, unk_positive_aspect_easy_turn)).

0.85::acc(s15, positive_aspect_fun_turn).

% @attr positive_aspect_fun_turn
% @type categorical
% @canonical false
% @original_name positive_aspect (fun to turn)
% @values fun_to_turn=Fun_to_Turn unk_positive_aspect_fun_turn=Unknown
% @importance 0.95

0.78::true_val(positive_aspect_fun_turn, fun_to_turn); 0.22::true_val(positive_aspect_fun_turn, unk_positive_aspect_fun_turn).

measured(s15, positive_aspect_fun_turn, fun_to_turn).

all_consistent(positive_aspect_fun_turn) :-
    consistent(s15, positive_aspect_fun_turn).

evidence(all_consistent(positive_aspect_fun_turn)).
query(true_val(positive_aspect_fun_turn, fun_to_turn)).
query(true_val(positive_aspect_fun_turn, unk_positive_aspect_fun_turn)).

0.85::acc(s15, positive_aspect_chatter).

% @attr positive_aspect_chatter
% @type categorical
% @canonical false
% @original_name positive_aspect (chatter absorption)
% @values better_chatter_absorption=Much_Better_Chatter_Absorption unk_positive_aspect_chatter=Unknown
% @importance 0.95

0.78::true_val(positive_aspect_chatter, better_chatter_absorption); 0.22::true_val(positive_aspect_chatter, unk_positive_aspect_chatter).

measured(s15, positive_aspect_chatter, better_chatter_absorption).

all_consistent(positive_aspect_chatter) :-
    consistent(s15, positive_aspect_chatter).

evidence(all_consistent(positive_aspect_chatter)).
query(true_val(positive_aspect_chatter, better_chatter_absorption)).
query(true_val(positive_aspect_chatter, unk_positive_aspect_chatter)).

0.85::acc(s15, positive_aspect_base_glide).

% @attr positive_aspect_base_glide
% @type categorical
% @canonical false
% @original_name positive_aspect (base glide)
% @values excellent_base_glide=Excellent_base_glide_upper_tier unk_positive_aspect_base_glide=Unknown
% @importance 0.95

0.78::true_val(positive_aspect_base_glide, excellent_base_glide); 0.22::true_val(positive_aspect_base_glide, unk_positive_aspect_base_glide).

measured(s15, positive_aspect_base_glide, excellent_base_glide).

all_consistent(positive_aspect_base_glide) :-
    consistent(s15, positive_aspect_base_glide).

evidence(all_consistent(positive_aspect_base_glide)).
query(true_val(positive_aspect_base_glide, excellent_base_glide)).
query(true_val(positive_aspect_base_glide, unk_positive_aspect_base_glide)).

0.85::acc(s15, positive_aspect_ollie_pop).

% @attr positive_aspect_ollie_pop
% @type categorical
% @canonical false
% @original_name positive_aspect (ollie pop)
% @values easy_lively_ollie=Easy_lively_ollie_pop unk_positive_aspect_ollie_pop=Unknown
% @importance 0.95

0.78::true_val(positive_aspect_ollie_pop, easy_lively_ollie); 0.22::true_val(positive_aspect_ollie_pop, unk_positive_aspect_ollie_pop).

measured(s15, positive_aspect_ollie_pop, easy_lively_ollie).

all_consistent(positive_aspect_ollie_pop) :-
    consistent(s15, positive_aspect_ollie_pop).

evidence(all_consistent(positive_aspect_ollie_pop)).
query(true_val(positive_aspect_ollie_pop, easy_lively_ollie)).
query(true_val(positive_aspect_ollie_pop, unk_positive_aspect_ollie_pop)).

0.85::acc(s15, positive_aspect_stability).

% @attr positive_aspect_stability
% @type categorical
% @canonical false
% @original_name positive_aspect (stability)
% @values stable_camber_forgiving=Stable_camber_like_forgiving unk_positive_aspect_stability=Unknown
% @importance 0.95

0.78::true_val(positive_aspect_stability, stable_camber_forgiving); 0.22::true_val(positive_aspect_stability, unk_positive_aspect_stability).

measured(s15, positive_aspect_stability, stable_camber_forgiving).

all_consistent(positive_aspect_stability) :-
    consistent(s15, positive_aspect_stability).

evidence(all_consistent(positive_aspect_stability)).
query(true_val(positive_aspect_stability, stable_camber_forgiving)).
query(true_val(positive_aspect_stability, unk_positive_aspect_stability)).

0.85::acc(s15, positive_aspect_powder_float).

% @attr positive_aspect_powder_float
% @type categorical
% @canonical false
% @original_name positive_aspect (powder float)
% @values good_powder_float=Very_good_powder_float unk_positive_aspect_powder_float=Unknown
% @importance 0.95

0.78::true_val(positive_aspect_powder_float, good_powder_float); 0.22::true_val(positive_aspect_powder_float, unk_positive_aspect_powder_float).

measured(s15, positive_aspect_powder_float, good_powder_float).

all_consistent(positive_aspect_powder_float) :-
    consistent(s15, positive_aspect_powder_float).

evidence(all_consistent(positive_aspect_powder_float)).
query(true_val(positive_aspect_powder_float, good_powder_float)).
query(true_val(positive_aspect_powder_float, unk_positive_aspect_powder_float)).

0.75::acc(s16, reviewer_opinion_whitelines).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values smooth_soulful=Smooth_easy_edge_to_edge_soulful unk_reviewer_opinion_whitelines=Unknown
% @importance 0.65

0.68::true_val(reviewer_opinion_whitelines, smooth_soulful); 0.32::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

measured(s16, reviewer_opinion_whitelines, smooth_soulful).

all_consistent(reviewer_opinion_whitelines) :-
    consistent(s16, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, smooth_soulful)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

0.60::acc(s32, positive_aspect_speed_stability).

% @attr positive_aspect_speed_stability
% @type categorical
% @canonical false
% @original_name positive_aspect (stable at speed)
% @values stable_high_speed=Stable_high_speeds_no_washout unk_positive_aspect_speed_stability=Unknown
% @importance 0.80

0.51::true_val(positive_aspect_speed_stability, stable_high_speed); 0.49::true_val(positive_aspect_speed_stability, unk_positive_aspect_speed_stability).

measured(s32, positive_aspect_speed_stability, stable_high_speed).

all_consistent(positive_aspect_speed_stability) :-
    consistent(s32, positive_aspect_speed_stability).

evidence(all_consistent(positive_aspect_speed_stability)).
query(true_val(positive_aspect_speed_stability, stable_high_speed)).
query(true_val(positive_aspect_speed_stability, unk_positive_aspect_speed_stability)).

0.45::acc(s33, user_review_forum).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values fantastic_love_flex=Fantastic_board_love_the_flex unk_user_review_forum=Unknown
% @importance 0.80

0.32::true_val(user_review_forum, fantastic_love_flex); 0.68::true_val(user_review_forum, unk_user_review_forum).

measured(s33, user_review_forum, fantastic_love_flex).

all_consistent(user_review_forum) :-
    consistent(s33, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, fantastic_love_flex)).
query(true_val(user_review_forum, unk_user_review_forum)).

0.50::acc(s34, user_review_forum_playful).

% @attr user_review_forum_playful
% @type categorical
% @canonical false
% @original_name user_review_forum (playful surfy)
% @values playful_surfy=Playful_surfy_good_powder unk_user_review_forum_playful=Unknown
% @importance 0.85

0.38::true_val(user_review_forum_playful, playful_surfy); 0.62::true_val(user_review_forum_playful, unk_user_review_forum_playful).

measured(s34, user_review_forum_playful, playful_surfy).

all_consistent(user_review_forum_playful) :-
    consistent(s34, user_review_forum_playful).

evidence(all_consistent(user_review_forum_playful)).
query(true_val(user_review_forum_playful, playful_surfy)).
query(true_val(user_review_forum_playful, unk_user_review_forum_playful)).

0.50::acc(s34, user_review_forum_turns_carves).

% @attr user_review_forum_turns_carves
% @type categorical
% @canonical false
% @original_name user_review_forum (turns great)
% @values turns_carves_floats=Turns_great_carves_great_floats unk_user_review_forum_turns_carves=Unknown
% @importance 0.85

0.38::true_val(user_review_forum_turns_carves, turns_carves_floats); 0.62::true_val(user_review_forum_turns_carves, unk_user_review_forum_turns_carves).

measured(s34, user_review_forum_turns_carves, turns_carves_floats).

all_consistent(user_review_forum_turns_carves) :-
    consistent(s34, user_review_forum_turns_carves).

evidence(all_consistent(user_review_forum_turns_carves)).
query(true_val(user_review_forum_turns_carves, turns_carves_floats)).
query(true_val(user_review_forum_turns_carves, unk_user_review_forum_turns_carves)).

0.85::acc(s15, negative_aspect).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values bouncy_uneven_snow=Still_Bouncy_In_Uneven_Snow unk_negative_aspect=Unknown
% @importance 0.95

0.78::true_val(negative_aspect, bouncy_uneven_snow); 0.22::true_val(negative_aspect, unk_negative_aspect).

measured(s15, negative_aspect, bouncy_uneven_snow).

all_consistent(negative_aspect) :-
    consistent(s15, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, bouncy_uneven_snow)).
query(true_val(negative_aspect, unk_negative_aspect)).

0.85::acc(s15, negative_aspect_soft_flex).

% @attr negative_aspect_soft_flex
% @type categorical
% @canonical false
% @original_name negative_aspect (softer flex)
% @values softer_flex_freeride=Softer_Flex_For_Freeride unk_negative_aspect_soft_flex=Unknown
% @importance 0.95

0.78::true_val(negative_aspect_soft_flex, softer_flex_freeride); 0.22::true_val(negative_aspect_soft_flex, unk_negative_aspect_soft_flex).

measured(s15, negative_aspect_soft_flex, softer_flex_freeride).

all_consistent(negative_aspect_soft_flex) :-
    consistent(s15, negative_aspect_soft_flex).

evidence(all_consistent(negative_aspect_soft_flex)).
query(true_val(negative_aspect_soft_flex, softer_flex_freeride)).
query(true_val(negative_aspect_soft_flex, unk_negative_aspect_soft_flex)).

0.85::acc(s15, negative_aspect_chunder).

% @attr negative_aspect_chunder
% @type categorical
% @canonical false
% @original_name negative_aspect (chunder micro bumps)
% @values no_buffer_chunder=No_buffer_chunder_microbumps unk_negative_aspect_chunder=Unknown
% @importance 0.95

0.78::true_val(negative_aspect_chunder, no_buffer_chunder); 0.22::true_val(negative_aspect_chunder, unk_negative_aspect_chunder).

measured(s15, negative_aspect_chunder, no_buffer_chunder).

all_consistent(negative_aspect_chunder) :-
    consistent(s15, negative_aspect_chunder).

evidence(all_consistent(negative_aspect_chunder)).
query(true_val(negative_aspect_chunder, no_buffer_chunder)).
query(true_val(negative_aspect_chunder, unk_negative_aspect_chunder)).

0.50::acc(s34, user_review_forum_nose_soft).

% @attr user_review_forum_nose_soft
% @type categorical
% @canonical false
% @original_name user_review_forum (nose too soft)
% @values nose_too_soft=Nose_too_soft_folds unk_user_review_forum_nose_soft=Unknown
% @importance 0.85

0.38::true_val(user_review_forum_nose_soft, nose_too_soft); 0.62::true_val(user_review_forum_nose_soft, unk_user_review_forum_nose_soft).

measured(s34, user_review_forum_nose_soft, nose_too_soft).

all_consistent(user_review_forum_nose_soft) :-
    consistent(s34, user_review_forum_nose_soft).

evidence(all_consistent(user_review_forum_nose_soft)).
query(true_val(user_review_forum_nose_soft, nose_too_soft)).
query(true_val(user_review_forum_nose_soft, unk_user_review_forum_nose_soft)).

0.50::acc(s34, user_review_forum_speed).

% @attr user_review_forum_speed
% @type categorical
% @canonical false
% @original_name user_review_forum (not fast enough)
% @values not_fast_enough=Not_fast_enough_vs_FA unk_user_review_forum_speed=Unknown
% @importance 0.85

0.38::true_val(user_review_forum_speed, not_fast_enough); 0.62::true_val(user_review_forum_speed, unk_user_review_forum_speed).

measured(s34, user_review_forum_speed, not_fast_enough).

all_consistent(user_review_forum_speed) :-
    consistent(s34, user_review_forum_speed).

evidence(all_consistent(user_review_forum_speed)).
query(true_val(user_review_forum_speed, not_fast_enough)).
query(true_val(user_review_forum_speed, unk_user_review_forum_speed)).

0.85::acc(s15, negative_aspect_ice).

% @attr negative_aspect_ice
% @type categorical
% @canonical false
% @original_name negative_aspect (ice edge hold)
% @values not_ideal_icy=Not_ideal_icy_specialist unk_negative_aspect_ice=Unknown
% @importance 0.95

0.78::true_val(negative_aspect_ice, not_ideal_icy); 0.22::true_val(negative_aspect_ice, unk_negative_aspect_ice).

measured(s15, negative_aspect_ice, not_ideal_icy).

all_consistent(negative_aspect_ice) :-
    consistent(s15, negative_aspect_ice).

evidence(all_consistent(negative_aspect_ice)).
query(true_val(negative_aspect_ice, not_ideal_icy)).
query(true_val(negative_aspect_ice, unk_negative_aspect_ice)).

0.50::acc(s34, negative_aspect_sizes).

% @attr negative_aspect_sizes
% @type categorical
% @canonical false
% @original_name negative_aspect (limited sizes)
% @values limited_three_sizes=Limited_only_three_sizes unk_negative_aspect_sizes=Unknown
% @importance 0.85

0.38::true_val(negative_aspect_sizes, limited_three_sizes); 0.62::true_val(negative_aspect_sizes, unk_negative_aspect_sizes).

measured(s34, negative_aspect_sizes, limited_three_sizes).

all_consistent(negative_aspect_sizes) :-
    consistent(s34, negative_aspect_sizes).

evidence(all_consistent(negative_aspect_sizes)).
query(true_val(negative_aspect_sizes, limited_three_sizes)).
query(true_val(negative_aspect_sizes, unk_negative_aspect_sizes)).

0.85::acc(s15, negative_aspect_narrow_feel).

% @attr negative_aspect_narrow_feel
% @type categorical
% @canonical false
% @original_name negative_aspect (narrower feel)
% @values feels_narrower=Feels_1cm_narrower_best_US8_9 unk_negative_aspect_narrow_feel=Unknown
% @importance 0.95

0.78::true_val(negative_aspect_narrow_feel, feels_narrower); 0.22::true_val(negative_aspect_narrow_feel, unk_negative_aspect_narrow_feel).

measured(s15, negative_aspect_narrow_feel, feels_narrower).

all_consistent(negative_aspect_narrow_feel) :-
    consistent(s15, negative_aspect_narrow_feel).

evidence(all_consistent(negative_aspect_narrow_feel)).
query(true_val(negative_aspect_narrow_feel, feels_narrower)).
query(true_val(negative_aspect_narrow_feel, unk_negative_aspect_narrow_feel)).

0.45::acc(s33, user_review_forum_icy_groomer).

% @attr user_review_forum_icy_groomer
% @type categorical
% @canonical false
% @original_name user_review_forum (icy groomer)
% @values icy_groomer_weak=Icy_groomer_soft_flex_poor_edge unk_user_review_forum_icy_groomer=Unknown
% @importance 0.80

0.32::true_val(user_review_forum_icy_groomer, icy_groomer_weak); 0.68::true_val(user_review_forum_icy_groomer, unk_user_review_forum_icy_groomer).

measured(s33, user_review_forum_icy_groomer, icy_groomer_weak).

all_consistent(user_review_forum_icy_groomer) :-
    consistent(s33, user_review_forum_icy_groomer).

evidence(all_consistent(user_review_forum_icy_groomer)).
query(true_val(user_review_forum_icy_groomer, icy_groomer_weak)).
query(true_val(user_review_forum_icy_groomer, unk_user_review_forum_icy_groomer)).

0.85::acc(s15, negative_aspect_bomber).

% @attr negative_aspect_bomber
% @type categorical
% @canonical false
% @original_name negative_aspect (not a bomber)
% @values not_a_bomber=Not_straight_line_bomber unk_negative_aspect_bomber=Unknown
% @importance 0.95

0.78::true_val(negative_aspect_bomber, not_a_bomber); 0.22::true_val(negative_aspect_bomber, unk_negative_aspect_bomber).

measured(s15, negative_aspect_bomber, not_a_bomber).

all_consistent(negative_aspect_bomber) :-
    consistent(s15, negative_aspect_bomber).

evidence(all_consistent(negative_aspect_bomber)).
query(true_val(negative_aspect_bomber, not_a_bomber)).
query(true_val(negative_aspect_bomber, unk_negative_aspect_bomber)).

0.82::acc(s15, recommended_boot_sizes_155).

% @attr recommended_boot_sizes_155
% @type categorical
% @canonical false
% @original_name Recommended boot sizes (155cm)
% @values us8_10=US_8_10 unk_recommended_boot_sizes_155=Unknown
% @importance 0.95

0.78::true_val(recommended_boot_sizes_155, us8_10); 0.22::true_val(recommended_boot_sizes_155, unk_recommended_boot_sizes_155).

measured(s15, recommended_boot_sizes_155, us8_10).

all_consistent(recommended_boot_sizes_155) :-
    consistent(s15, recommended_boot_sizes_155).

evidence(all_consistent(recommended_boot_sizes_155)).
query(true_val(recommended_boot_sizes_155, us8_10)).
query(true_val(recommended_boot_sizes_155, unk_recommended_boot_sizes_155)).

0.82::acc(s15, recommended_boot_sizes_158).

% @attr recommended_boot_sizes_158
% @type categorical
% @canonical false
% @original_name Recommended boot sizes (158cm)
% @values us9_11=US_9_11 unk_recommended_boot_sizes_158=Unknown
% @importance 0.95

0.78::true_val(recommended_boot_sizes_158, us9_11); 0.22::true_val(recommended_boot_sizes_158, unk_recommended_boot_sizes_158).

measured(s15, recommended_boot_sizes_158, us9_11).

all_consistent(recommended_boot_sizes_158) :-
    consistent(s15, recommended_boot_sizes_158).

evidence(all_consistent(recommended_boot_sizes_158)).
query(true_val(recommended_boot_sizes_158, us9_11)).
query(true_val(recommended_boot_sizes_158, unk_recommended_boot_sizes_158)).

0.82::acc(s15, recommended_boot_sizes_161).

% @attr recommended_boot_sizes_161
% @type categorical
% @canonical false
% @original_name Recommended boot sizes (161cm)
% @values us10_12=US_10_12 unk_recommended_boot_sizes_161=Unknown
% @importance 0.95

0.78::true_val(recommended_boot_sizes_161, us10_12); 0.22::true_val(recommended_boot_sizes_161, unk_recommended_boot_sizes_161).

measured(s15, recommended_boot_sizes_161, us10_12).

all_consistent(recommended_boot_sizes_161) :-
    consistent(s15, recommended_boot_sizes_161).

evidence(all_consistent(recommended_boot_sizes_161)).
query(true_val(recommended_boot_sizes_161, us10_12)).
query(true_val(recommended_boot_sizes_161, unk_recommended_boot_sizes_161)).

0.85::acc(s15, reviewer_opinion_tgr_weight_ranges).

% @attr reviewer_opinion_tgr_weight_ranges
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (weight ranges)
% @values stay_under_recommended=Stay_well_under_recommended_weight unk_reviewer_opinion_tgr_weight_ranges=Unknown
% @importance 0.95

0.78::true_val(reviewer_opinion_tgr_weight_ranges, stay_under_recommended); 0.22::true_val(reviewer_opinion_tgr_weight_ranges, unk_reviewer_opinion_tgr_weight_ranges).

measured(s15, reviewer_opinion_tgr_weight_ranges, stay_under_recommended).

all_consistent(reviewer_opinion_tgr_weight_ranges) :-
    consistent(s15, reviewer_opinion_tgr_weight_ranges).

evidence(all_consistent(reviewer_opinion_tgr_weight_ranges)).
query(true_val(reviewer_opinion_tgr_weight_ranges, stay_under_recommended)).
query(true_val(reviewer_opinion_tgr_weight_ranges, unk_reviewer_opinion_tgr_weight_ranges)).

0.85::acc(s15, reviewer_opinion_tgr_width_feel).

% @attr reviewer_opinion_tgr_width_feel
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (width feel)
% @values narrower_best_8_9=Feels_narrower_best_boot_8_9_on_158 unk_reviewer_opinion_tgr_width_feel=Unknown
% @importance 0.95

0.78::true_val(reviewer_opinion_tgr_width_feel, narrower_best_8_9); 0.22::true_val(reviewer_opinion_tgr_width_feel, unk_reviewer_opinion_tgr_width_feel).

measured(s15, reviewer_opinion_tgr_width_feel, narrower_best_8_9).

all_consistent(reviewer_opinion_tgr_width_feel) :-
    consistent(s15, reviewer_opinion_tgr_width_feel).

evidence(all_consistent(reviewer_opinion_tgr_width_feel)).
query(true_val(reviewer_opinion_tgr_width_feel, narrower_best_8_9)).
query(true_val(reviewer_opinion_tgr_width_feel, unk_reviewer_opinion_tgr_width_feel)).

0.82::acc(s15, comparable_board_cross_brand).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values amplid_souly_grail=Amplid_Souly_Grail unk_comparable_board_cross_brand=Unknown
% @importance 0.95

0.78::true_val(comparable_board_cross_brand, amplid_souly_grail); 0.22::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s15, comparable_board_cross_brand, amplid_souly_grail).

all_consistent(comparable_board_cross_brand) :-
    consistent(s15, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, amplid_souly_grail)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

0.82::acc(s15, comparable_cross_k2_alchemist).

% @attr comparable_cross_k2_alchemist
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (K2 Alchemist)
% @values k2_alchemist=K2_Alchemist unk_comparable_cross_k2_alchemist=Unknown
% @importance 0.95

0.78::true_val(comparable_cross_k2_alchemist, k2_alchemist); 0.22::true_val(comparable_cross_k2_alchemist, unk_comparable_cross_k2_alchemist).

measured(s15, comparable_cross_k2_alchemist, k2_alchemist).

all_consistent(comparable_cross_k2_alchemist) :-
    consistent(s15, comparable_cross_k2_alchemist).

evidence(all_consistent(comparable_cross_k2_alchemist)).
query(true_val(comparable_cross_k2_alchemist, k2_alchemist)).
query(true_val(comparable_cross_k2_alchemist, unk_comparable_cross_k2_alchemist)).

0.82::acc(s15, comparable_cross_yes_pyl).

% @attr comparable_cross_yes_pyl
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (YES PYL)
% @values yes_pyl_uninc=YES_PYL_Uninc unk_comparable_cross_yes_pyl=Unknown
% @importance 0.95

0.78::true_val(comparable_cross_yes_pyl, yes_pyl_uninc); 0.22::true_val(comparable_cross_yes_pyl, unk_comparable_cross_yes_pyl).

measured(s15, comparable_cross_yes_pyl, yes_pyl_uninc).

all_consistent(comparable_cross_yes_pyl) :-
    consistent(s15, comparable_cross_yes_pyl).

evidence(all_consistent(comparable_cross_yes_pyl)).
query(true_val(comparable_cross_yes_pyl, yes_pyl_uninc)).
query(true_val(comparable_cross_yes_pyl, unk_comparable_cross_yes_pyl)).

0.82::acc(s15, comparable_cross_weston).

% @attr comparable_cross_weston
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Weston Backwoods)
% @values weston_backwoods=Weston_Backwoods unk_comparable_cross_weston=Unknown
% @importance 0.95

0.78::true_val(comparable_cross_weston, weston_backwoods); 0.22::true_val(comparable_cross_weston, unk_comparable_cross_weston).

measured(s15, comparable_cross_weston, weston_backwoods).

all_consistent(comparable_cross_weston) :-
    consistent(s15, comparable_cross_weston).

evidence(all_consistent(comparable_cross_weston)).
query(true_val(comparable_cross_weston, weston_backwoods)).
query(true_val(comparable_cross_weston, unk_comparable_cross_weston)).

0.82::acc(s15, comparable_cross_us_cadet).

% @attr comparable_cross_us_cadet
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (United Shapes Cadet)
% @values united_shapes_cadet=United_Shapes_Cadet unk_comparable_cross_us_cadet=Unknown
% @importance 0.95

0.78::true_val(comparable_cross_us_cadet, united_shapes_cadet); 0.22::true_val(comparable_cross_us_cadet, unk_comparable_cross_us_cadet).

measured(s15, comparable_cross_us_cadet, united_shapes_cadet).

all_consistent(comparable_cross_us_cadet) :-
    consistent(s15, comparable_cross_us_cadet).

evidence(all_consistent(comparable_cross_us_cadet)).
query(true_val(comparable_cross_us_cadet, united_shapes_cadet)).
query(true_val(comparable_cross_us_cadet, unk_comparable_cross_us_cadet)).

0.82::acc(s15, comparable_cross_burton_gril).

% @attr comparable_cross_burton_gril
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Burton Gril Master)
% @values burton_gril_master=Burton_Gril_Master unk_comparable_cross_burton_gril=Unknown
% @importance 0.95

0.78::true_val(comparable_cross_burton_gril, burton_gril_master); 0.22::true_val(comparable_cross_burton_gril, unk_comparable_cross_burton_gril).

measured(s15, comparable_cross_burton_gril, burton_gril_master).

all_consistent(comparable_cross_burton_gril) :-
    consistent(s15, comparable_cross_burton_gril).

evidence(all_consistent(comparable_cross_burton_gril)).
query(true_val(comparable_cross_burton_gril, burton_gril_master)).
query(true_val(comparable_cross_burton_gril, unk_comparable_cross_burton_gril)).

0.82::acc(s15, comparable_cross_jones_flagship).

% @attr comparable_cross_jones_flagship
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Jones Flagship Pro)
% @values jones_flagship_pro=Jones_Flagship_Pro unk_comparable_cross_jones_flagship=Unknown
% @importance 0.95

0.78::true_val(comparable_cross_jones_flagship, jones_flagship_pro); 0.22::true_val(comparable_cross_jones_flagship, unk_comparable_cross_jones_flagship).

measured(s15, comparable_cross_jones_flagship, jones_flagship_pro).

all_consistent(comparable_cross_jones_flagship) :-
    consistent(s15, comparable_cross_jones_flagship).

evidence(all_consistent(comparable_cross_jones_flagship)).
query(true_val(comparable_cross_jones_flagship, jones_flagship_pro)).
query(true_val(comparable_cross_jones_flagship, unk_comparable_cross_jones_flagship)).

0.50::acc(s35, comparable_cross_nidecker_nitro).

% @attr comparable_cross_nidecker_nitro
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Nidecker Beta, Nitro Cannon)
% @values nidecker_beta_nitro_cannon=Nidecker_Beta_Nitro_Quiver_Cannon unk_comparable_cross_nidecker_nitro=Unknown
% @importance 0.70

0.39::true_val(comparable_cross_nidecker_nitro, nidecker_beta_nitro_cannon); 0.61::true_val(comparable_cross_nidecker_nitro, unk_comparable_cross_nidecker_nitro).

measured(s35, comparable_cross_nidecker_nitro, nidecker_beta_nitro_cannon).

all_consistent(comparable_cross_nidecker_nitro) :-
    consistent(s35, comparable_cross_nidecker_nitro).

evidence(all_consistent(comparable_cross_nidecker_nitro)).
query(true_val(comparable_cross_nidecker_nitro, nidecker_beta_nitro_cannon)).
query(true_val(comparable_cross_nidecker_nitro, unk_comparable_cross_nidecker_nitro)).

0.70::acc(s36, comparable_board_same_brand).
0.58::acc(s20, comparable_board_same_brand).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values hps_taka_ep=HPS_Takaharu_Nakai_EP unk_comparable_board_same_brand=Unknown
% @importance 0.70

0.95::true_val(comparable_board_same_brand, hps_taka_ep); 0.05::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s36, comparable_board_same_brand, hps_taka_ep).
measured(s20, comparable_board_same_brand, hps_taka_ep).

all_consistent(comparable_board_same_brand) :-
    consistent(s36, comparable_board_same_brand),
    (indep(s20), consistent(s20, comparable_board_same_brand) ; \+indep(s20)).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, hps_taka_ep)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

0.45::acc(s33, comparable_same_sick_stick).

% @attr comparable_same_sick_stick
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Sick Stick)
% @values salomon_sick_stick=Salomon_Sick_Stick unk_comparable_same_sick_stick=Unknown
% @importance 0.80

0.32::true_val(comparable_same_sick_stick, salomon_sick_stick); 0.68::true_val(comparable_same_sick_stick, unk_comparable_same_sick_stick).

measured(s33, comparable_same_sick_stick, salomon_sick_stick).

all_consistent(comparable_same_sick_stick) :-
    consistent(s33, comparable_same_sick_stick).

evidence(all_consistent(comparable_same_sick_stick)).
query(true_val(comparable_same_sick_stick, salomon_sick_stick)).
query(true_val(comparable_same_sick_stick, unk_comparable_same_sick_stick)).

0.50::acc(s34, compared_vs_burton_fa).

% @attr compared_vs_burton_fa
% @type categorical
% @canonical false
% @original_name Compared against Burton Flight Attendant
% @values fa_stiffer_faster=FA_stiffer_and_faster unk_compared_vs_burton_fa=Unknown
% @importance 0.85

0.38::true_val(compared_vs_burton_fa, fa_stiffer_faster); 0.62::true_val(compared_vs_burton_fa, unk_compared_vs_burton_fa).

measured(s34, compared_vs_burton_fa, fa_stiffer_faster).

all_consistent(compared_vs_burton_fa) :-
    consistent(s34, compared_vs_burton_fa).

evidence(all_consistent(compared_vs_burton_fa)).
query(true_val(compared_vs_burton_fa, fa_stiffer_faster)).
query(true_val(compared_vs_burton_fa, unk_compared_vs_burton_fa)).

0.85::acc(s37, comparable_same_taka_split).

% @attr comparable_same_taka_split
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Taka Split)
% @values hps_taka_split=HPS_Taka_Split_touring unk_comparable_same_taka_split=Unknown
% @importance 0.55

0.81::true_val(comparable_same_taka_split, hps_taka_split); 0.19::true_val(comparable_same_taka_split, unk_comparable_same_taka_split).

measured(s37, comparable_same_taka_split, hps_taka_split).

all_consistent(comparable_same_taka_split) :-
    consistent(s37, comparable_same_taka_split).

evidence(all_consistent(comparable_same_taka_split)).
query(true_val(comparable_same_taka_split, hps_taka_split)).
query(true_val(comparable_same_taka_split, unk_comparable_same_taka_split)).

0.85::acc(s14, comparable_same_ep_backcountry).

% @attr comparable_same_ep_backcountry
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (EP backcountry)
% @values ep_faster_open_bowls=EP_designed_faster_open_bowls_deep_backcountry unk_comparable_same_ep_backcountry=Unknown
% @importance 0.70

0.81::true_val(comparable_same_ep_backcountry, ep_faster_open_bowls); 0.19::true_val(comparable_same_ep_backcountry, unk_comparable_same_ep_backcountry).

measured(s14, comparable_same_ep_backcountry, ep_faster_open_bowls).

all_consistent(comparable_same_ep_backcountry) :-
    consistent(s14, comparable_same_ep_backcountry).

evidence(all_consistent(comparable_same_ep_backcountry)).
query(true_val(comparable_same_ep_backcountry, ep_faster_open_bowls)).
query(true_val(comparable_same_ep_backcountry, unk_comparable_same_ep_backcountry)).

0.65::acc(s22, sustainability_certification_recycled_abs).

% @attr sustainability_certification_recycled_abs
% @type categorical
% @canonical false
% @original_name sustainability_certification (recycled ABS)
% @values recycled_abs_sidewalls=Recycled_ABS_sidewalls unk_sustainability_certification_recycled_abs=Unknown
% @importance 0.80

0.63::true_val(sustainability_certification_recycled_abs, recycled_abs_sidewalls); 0.37::true_val(sustainability_certification_recycled_abs, unk_sustainability_certification_recycled_abs).

measured(s22, sustainability_certification_recycled_abs, recycled_abs_sidewalls).

all_consistent(sustainability_certification_recycled_abs) :-
    consistent(s22, sustainability_certification_recycled_abs).

evidence(all_consistent(sustainability_certification_recycled_abs)).
query(true_val(sustainability_certification_recycled_abs, recycled_abs_sidewalls)).
query(true_val(sustainability_certification_recycled_abs, unk_sustainability_certification_recycled_abs)).

0.55::acc(s38, sustainability_certification_recycled_base).

% @attr sustainability_certification_recycled_base
% @type categorical
% @canonical false
% @original_name sustainability_certification (recycled base)
% @values recycled_base_50pct=50pct_recycled_base_materials unk_sustainability_certification_recycled_base=Unknown
% @importance 0.55

0.45::true_val(sustainability_certification_recycled_base, recycled_base_50pct); 0.55::true_val(sustainability_certification_recycled_base, unk_sustainability_certification_recycled_base).

measured(s38, sustainability_certification_recycled_base, recycled_base_50pct).

all_consistent(sustainability_certification_recycled_base) :-
    consistent(s38, sustainability_certification_recycled_base).

evidence(all_consistent(sustainability_certification_recycled_base)).
query(true_val(sustainability_certification_recycled_base, recycled_base_50pct)).
query(true_val(sustainability_certification_recycled_base, unk_sustainability_certification_recycled_base)).

0.72::acc(s2, terrain_suitability).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values versatile_powder=Versatile_powder_board unk_terrain_suitability=Unknown
% @importance 1.00

0.71::true_val(terrain_suitability, versatile_powder); 0.29::true_val(terrain_suitability, unk_terrain_suitability).

measured(s2, terrain_suitability, versatile_powder).

all_consistent(terrain_suitability) :-
    consistent(s2, terrain_suitability).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, versatile_powder)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

0.70::acc(s12, terrain_suitability_deep_powder).

% @attr terrain_suitability_deep_powder
% @type categorical
% @canonical false
% @original_name terrain_suitability (deep powder)
% @values deep_powder_fresh=Deep_powder_fresh_snow unk_terrain_suitability_deep_powder=Unknown
% @importance 0.80

0.68::true_val(terrain_suitability_deep_powder, deep_powder_fresh); 0.32::true_val(terrain_suitability_deep_powder, unk_terrain_suitability_deep_powder).

measured(s12, terrain_suitability_deep_powder, deep_powder_fresh).

all_consistent(terrain_suitability_deep_powder) :-
    consistent(s12, terrain_suitability_deep_powder).

evidence(all_consistent(terrain_suitability_deep_powder)).
query(true_val(terrain_suitability_deep_powder, deep_powder_fresh)).
query(true_val(terrain_suitability_deep_powder, unk_terrain_suitability_deep_powder)).

0.70::acc(s12, terrain_suitability_varied).
0.75::acc(s16, terrain_suitability_varied).

% @attr terrain_suitability_varied
% @type categorical
% @canonical false
% @original_name terrain_suitability (varied terrain)
% @values trees_powder_freeride_groomed=Trees_powder_freeride_groomed unk_terrain_suitability_varied=Unknown
% @importance 0.73

0.95::true_val(terrain_suitability_varied, trees_powder_freeride_groomed); 0.05::true_val(terrain_suitability_varied, unk_terrain_suitability_varied).

measured(s12, terrain_suitability_varied, trees_powder_freeride_groomed).
measured(s16, terrain_suitability_varied, trees_powder_freeride_groomed).

all_consistent(terrain_suitability_varied) :-
    (indep(s12), consistent(s12, terrain_suitability_varied) ; \+indep(s12)),
    consistent(s16, terrain_suitability_varied).

evidence(all_consistent(terrain_suitability_varied)).
query(true_val(terrain_suitability_varied, trees_powder_freeride_groomed)).
query(true_val(terrain_suitability_varied, unk_terrain_suitability_varied)).

0.70::acc(s12, riding_style).

% @attr riding_style
% @type categorical
% @canonical false
% @original_name riding_style
% @values setback_surfy_arcing=Setback_surfy_big_arcing_powder unk_riding_style=Unknown
% @importance 0.80

0.68::true_val(riding_style, setback_surfy_arcing); 0.32::true_val(riding_style, unk_riding_style).

measured(s12, riding_style, setback_surfy_arcing).

all_consistent(riding_style) :-
    consistent(s12, riding_style).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, setback_surfy_arcing)).
query(true_val(riding_style, unk_riding_style)).

0.82::acc(s15, switch_riding).
0.60::acc(s32, switch_riding).

% @attr switch_riding
% @type categorical
% @canonical false
% @original_name switch_riding
% @values doable_pulls_back=Doable_but_directional_pulls_back unk_switch_riding=Unknown
% @importance 0.88

0.95::true_val(switch_riding, doable_pulls_back); 0.05::true_val(switch_riding, unk_switch_riding).

measured(s15, switch_riding, doable_pulls_back).
measured(s32, switch_riding, doable_pulls_back).

all_consistent(switch_riding) :-
    consistent(s15, switch_riding),
    consistent(s32, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, doable_pulls_back)).
query(true_val(switch_riding, unk_switch_riding)).

0.82::acc(s15, terrain_suitability_park).

% @attr terrain_suitability_park
% @type categorical
% @canonical false
% @original_name terrain_suitability (park)
% @values not_for_park=Not_designed_for_park_can_jib unk_terrain_suitability_park=Unknown
% @importance 0.95

0.78::true_val(terrain_suitability_park, not_for_park); 0.22::true_val(terrain_suitability_park, unk_terrain_suitability_park).

measured(s15, terrain_suitability_park, not_for_park).

all_consistent(terrain_suitability_park) :-
    consistent(s15, terrain_suitability_park).

evidence(all_consistent(terrain_suitability_park)).
query(true_val(terrain_suitability_park, not_for_park)).
query(true_val(terrain_suitability_park, unk_terrain_suitability_park)).

0.70::acc(s12, terrain_suitability_groomed).

% @attr terrain_suitability_groomed
% @type categorical
% @canonical false
% @original_name terrain_suitability (groomed runs)
% @values endless_fun_groomed=Endless_fun_groomed_runs unk_terrain_suitability_groomed=Unknown
% @importance 0.80

0.68::true_val(terrain_suitability_groomed, endless_fun_groomed); 0.32::true_val(terrain_suitability_groomed, unk_terrain_suitability_groomed).

measured(s12, terrain_suitability_groomed, endless_fun_groomed).

all_consistent(terrain_suitability_groomed) :-
    consistent(s12, terrain_suitability_groomed).

evidence(all_consistent(terrain_suitability_groomed)).
query(true_val(terrain_suitability_groomed, endless_fun_groomed)).
query(true_val(terrain_suitability_groomed, unk_terrain_suitability_groomed)).

0.72::acc(s2, skill_level_recommendation).
0.82::acc(s15, skill_level_recommendation).

% @attr skill_level_recommendation
% @type categorical
% @canonical false
% @original_name skill_level_recommendation
% @values intermediate_expert=Intermediate_to_Advanced_Expert unk_skill_level_recommendation=Unknown
% @importance 0.98

0.95::true_val(skill_level_recommendation, intermediate_expert); 0.05::true_val(skill_level_recommendation, unk_skill_level_recommendation).

measured(s2, skill_level_recommendation, intermediate_expert).
measured(s15, skill_level_recommendation, intermediate_expert).

all_consistent(skill_level_recommendation) :-
    consistent(s15, skill_level_recommendation),
    (indep(s2), consistent(s2, skill_level_recommendation) ; \+indep(s2)).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, intermediate_expert)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

0.70::acc(s36, graphics_unchanged).

% @attr graphics_unchanged
% @type categorical
% @canonical false
% @original_name Graphics remained the same for 2024
% @values same_as_previous=Same_graphics_as_previous_year unk_graphics_unchanged=Unknown
% @importance 0.70

0.68::true_val(graphics_unchanged, same_as_previous); 0.32::true_val(graphics_unchanged, unk_graphics_unchanged).

measured(s36, graphics_unchanged, same_as_previous).

all_consistent(graphics_unchanged) :-
    consistent(s36, graphics_unchanged).

evidence(all_consistent(graphics_unchanged)).
query(true_val(graphics_unchanged, same_as_previous)).
query(true_val(graphics_unchanged, unk_graphics_unchanged)).

0.70::acc(s36, lineup_2024_info).

% @attr lineup_2024_info
% @type categorical
% @canonical false
% @original_name 2024 lineup
% @values all_2023_returned_ep_new=All_2023_models_returned_EP_new unk_lineup_2024_info=Unknown
% @importance 0.70

0.68::true_val(lineup_2024_info, all_2023_returned_ep_new); 0.32::true_val(lineup_2024_info, unk_lineup_2024_info).

measured(s36, lineup_2024_info, all_2023_returned_ep_new).

all_consistent(lineup_2024_info) :-
    consistent(s36, lineup_2024_info).

evidence(all_consistent(lineup_2024_info)).
query(true_val(lineup_2024_info, all_2023_returned_ep_new)).
query(true_val(lineup_2024_info, unk_lineup_2024_info)).

0.70::acc(s39, available_sizes_161_added).

% @attr available_sizes_161_added
% @type categorical
% @canonical false
% @original_name available_sizes (161cm added)
% @values size_161_added=161cm_size_added unk_available_sizes_161_added=Unknown
% @importance 0.50

0.68::true_val(available_sizes_161_added, size_161_added); 0.32::true_val(available_sizes_161_added, unk_available_sizes_161_added).

measured(s39, available_sizes_161_added, size_161_added).

all_consistent(available_sizes_161_added) :-
    consistent(s39, available_sizes_161_added).

evidence(all_consistent(available_sizes_161_added)).
query(true_val(available_sizes_161_added, size_161_added)).
query(true_val(available_sizes_161_added, unk_available_sizes_161_added)).

0.85::acc(s14, hillside_project_history).

% @attr hillside_project_history
% @type categorical
% @canonical false
% @original_name Hillside Project history
% @values favorite_since_2017=Favorite_collection_since_2017 unk_hillside_project_history=Unknown
% @importance 0.70

0.81::true_val(hillside_project_history, favorite_since_2017); 0.19::true_val(hillside_project_history, unk_hillside_project_history).

measured(s14, hillside_project_history, favorite_since_2017).

all_consistent(hillside_project_history) :-
    consistent(s14, hillside_project_history).

evidence(all_consistent(hillside_project_history)).
query(true_val(hillside_project_history, favorite_since_2017)).
query(true_val(hillside_project_history, unk_hillside_project_history)).

0.78::acc(s40, taka_design_inspiration).

% @attr taka_design_inspiration
% @type categorical
% @canonical false
% @original_name Taka shape/design inspiration
% @values japanese_powder_style=Inspired_by_Japanese_powder_riding unk_taka_design_inspiration=Unknown
% @importance 0.65

0.72::true_val(taka_design_inspiration, japanese_powder_style); 0.28::true_val(taka_design_inspiration, unk_taka_design_inspiration).

measured(s40, taka_design_inspiration, japanese_powder_style).

all_consistent(taka_design_inspiration) :-
    consistent(s40, taka_design_inspiration).

evidence(all_consistent(taka_design_inspiration)).
query(true_val(taka_design_inspiration, japanese_powder_style)).
query(true_val(taka_design_inspiration, unk_taka_design_inspiration)).

0.93::acc(s19, construction_material_innovation_reduction).

% @attr construction_material_innovation_reduction
% @type categorical
% @canonical false
% @original_name construction_material_innovation (40pct reduction)
% @values reduces_fg_resin_40pct=Reduces_fiberglass_resin_40pct unk_construction_material_innovation_reduction=Unknown
% @importance 0.95

0.90::true_val(construction_material_innovation_reduction, reduces_fg_resin_40pct); 0.10::true_val(construction_material_innovation_reduction, unk_construction_material_innovation_reduction).

measured(s19, construction_material_innovation_reduction, reduces_fg_resin_40pct).

all_consistent(construction_material_innovation_reduction) :-
    consistent(s19, construction_material_innovation_reduction).

evidence(all_consistent(construction_material_innovation_reduction)).
query(true_val(construction_material_innovation_reduction, reduces_fg_resin_40pct)).
query(true_val(construction_material_innovation_reduction, unk_construction_material_innovation_reduction)).