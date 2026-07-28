0.15::indep(s2).
0.12::indep(s5).
0.15::indep(s7).
0.12::indep(s8).
0.12::indep(s10).
0.12::indep(s11).
0.15::indep(s17).
0.15::indep(s18).
0.15::indep(s19).
0.15::indep(s20).
0.12::indep(s22).
0.12::indep(s27).
0.15::indep(s_merchant).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values burton=Burton unk_brand=Unknown
% @importance 0.95

0.95::acc(s1, brand).
0.93::acc(s3, brand).

0.97::true_val(brand, burton); 0.03::true_val(brand, unk_brand).

measured(s1, brand, burton).
measured(s3, brand, burton).

all_consistent(brand) :-
    consistent(s1, brand),
    consistent(s3, brand).

evidence(all_consistent(brand)).
query(true_val(brand, burton)).
query(true_val(brand, unk_brand)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values burton_snowboards_1977=Burton_Snowboards_founded_1977 unk_manufacturer=Unknown
% @importance 0.93

0.90::acc(s2, manufacturer).
0.95::acc(s3, manufacturer).

0.95::true_val(manufacturer, burton_snowboards_1977); 0.05::true_val(manufacturer, unk_manufacturer).

measured(s2, manufacturer, burton_snowboards_1977).
measured(s3, manufacturer, burton_snowboards_1977).

all_consistent(manufacturer) :-
    consistent(s3, manufacturer),
    (indep(s2), consistent(s2, manufacturer) ; \+indep(s2)).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, burton_snowboards_1977)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values family_tree_smooth_operator=Family_Tree_Smooth_Operator unk_model_name=Unknown
% @importance 0.98

0.97::acc(s1, model_name).
0.95::acc(s3, model_name).

0.97::true_val(model_name, family_tree_smooth_operator); 0.03::true_val(model_name, unk_model_name).

measured(s1, model_name, family_tree_smooth_operator).
measured(s3, model_name, family_tree_smooth_operator).

all_consistent(model_name) :-
    consistent(s1, model_name),
    consistent(s3, model_name).

evidence(all_consistent(model_name)).
query(true_val(model_name, family_tree_smooth_operator)).
query(true_val(model_name, unk_model_name)).

% @attr model_series
% @type categorical
% @canonical false
% @original_name model series
% @values family_tree=Family_Tree_limited_edition_freeride_powder unk_model_series=Unknown
% @importance 0.83

0.95::acc(s3, model_series).
0.85::acc(s4, model_series).

0.95::true_val(model_series, family_tree); 0.05::true_val(model_series, unk_model_series).

measured(s3, model_series, family_tree).
measured(s4, model_series, family_tree).

all_consistent(model_series) :-
    consistent(s3, model_series),
    consistent(s4, model_series).

evidence(all_consistent(model_series)).
query(true_val(model_series, family_tree)).
query(true_val(model_series, unk_model_series)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2026=2026 unk_model_year=Unknown
% @importance 0.98

0.97::acc(s1, model_year).
0.90::acc(s2, model_year).

0.97::true_val(model_year, y2026); 0.03::true_val(model_year, unk_model_year).

measured(s1, model_year, y2026).
measured(s2, model_year, y2026).

all_consistent(model_year) :-
    consistent(s1, model_year),
    (indep(s2), consistent(s2, model_year) ; \+indep(s2)).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2026)).
query(true_val(model_year, unk_model_year)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values new_for_2026=New_to_Family_Tree_2026_first_year unk_model_first_available_year=Unknown
% @importance 0.83

0.95::acc(s3, model_first_available_year).
0.85::acc(s4, model_first_available_year).

0.93::true_val(model_first_available_year, new_for_2026); 0.07::true_val(model_first_available_year, unk_model_first_available_year).

measured(s3, model_first_available_year, new_for_2026).
measured(s4, model_first_available_year, new_for_2026).

all_consistent(model_first_available_year) :-
    consistent(s3, model_first_available_year),
    consistent(s4, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, new_for_2026)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.98

0.97::acc(s1, product_type).
0.90::acc(s2, product_type).

0.97::true_val(product_type, snowboard); 0.03::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).
measured(s2, product_type, snowboard).

all_consistent(product_type) :-
    consistent(s1, product_type),
    (indep(s2), consistent(s2, product_type) ; \+indep(s2)).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain_powder=All_Mountain_Powder unk_board_category=Unknown
% @importance 0.85

0.82::acc(s5, board_category).

0.82::true_val(board_category, all_mountain_powder); 0.18::true_val(board_category, unk_board_category).

measured(s5, board_category, all_mountain_powder).

all_consistent(board_category) :-
    (indep(s5), consistent(s5, board_category) ; \+indep(s5)).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain_powder)).
query(true_val(board_category, unk_board_category)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values unisex=Unisex unk_gender=Unknown
% @importance 0.85

0.85::acc(s7, gender).
0.80::acc(s8, gender).

0.95::true_val(gender, unisex); 0.05::true_val(gender, unk_gender).

measured(s7, gender, unisex).
measured(s8, gender, unisex).

all_consistent(gender) :-
    (indep(s7), consistent(s7, gender) ; \+indep(s7)),
    (indep(s8), consistent(s8, gender) ; \+indep(s8)).

evidence(all_consistent(gender)).
query(true_val(gender, unisex)).
query(true_val(gender, unk_gender)).

% @attr limited_edition
% @type categorical
% @canonical false
% @original_name limited edition
% @values yes=Yes_Family_Tree_limited_edition unk_limited_edition=Unknown
% @importance 0.65

0.95::acc(s3, limited_edition).
0.93::acc(s9, limited_edition).

0.97::true_val(limited_edition, yes); 0.03::true_val(limited_edition, unk_limited_edition).

measured(s3, limited_edition, yes).
measured(s9, limited_edition, yes).

all_consistent(limited_edition) :-
    consistent(s3, limited_edition),
    consistent(s9, limited_edition).

evidence(all_consistent(limited_edition)).
query(true_val(limited_edition, yes)).
query(true_val(limited_edition, unk_limited_edition)).

% @attr topsheet_appearance_description
% @type categorical
% @canonical true
% @original_name topsheet_appearance_description
% @values audubon_bird_themed=Audubon_bird_themed_topsheets_2026 unk_topsheet_appearance_description=Unknown
% @importance 0.70

0.93::acc(s3, topsheet_appearance_description).
0.80::acc(s10, topsheet_appearance_description).

0.95::true_val(topsheet_appearance_description, audubon_bird_themed); 0.05::true_val(topsheet_appearance_description, unk_topsheet_appearance_description).

measured(s3, topsheet_appearance_description, audubon_bird_themed).
measured(s10, topsheet_appearance_description, audubon_bird_themed).

all_consistent(topsheet_appearance_description) :-
    consistent(s3, topsheet_appearance_description),
    (indep(s10), consistent(s10, topsheet_appearance_description) ; \+indep(s10)).

evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, audubon_bird_themed)).
query(true_val(topsheet_appearance_description, unk_topsheet_appearance_description)).

% @attr topsheet_appearance_description_detail
% @type categorical
% @canonical false
% @original_name topsheet_appearance_description
% @values crested_ibis=Crested_Ibis_artful_motion_grace_at_speed unk_topsheet_appearance_description_detail=Unknown
% @importance 0.60

0.80::acc(s10, topsheet_appearance_description_detail).
0.78::acc(s11, topsheet_appearance_description_detail).

0.90::true_val(topsheet_appearance_description_detail, crested_ibis); 0.10::true_val(topsheet_appearance_description_detail, unk_topsheet_appearance_description_detail).

measured(s10, topsheet_appearance_description_detail, crested_ibis).
measured(s11, topsheet_appearance_description_detail, crested_ibis).

all_consistent(topsheet_appearance_description_detail) :-
    (indep(s10), consistent(s10, topsheet_appearance_description_detail) ; \+indep(s10)),
    (indep(s11), consistent(s11, topsheet_appearance_description_detail) ; \+indep(s11)).

evidence(all_consistent(topsheet_appearance_description_detail)).
query(true_val(topsheet_appearance_description_detail, crested_ibis)).
query(true_val(topsheet_appearance_description_detail, unk_topsheet_appearance_description_detail)).

% @attr sku
% @type categorical
% @canonical false
% @original_name SKU
% @values w26_302911=W26_302911 unk_sku=Unknown
% @importance 0.93

0.97::acc(s1, sku).
0.93::acc(s_merchant, sku).

0.97::true_val(sku, w26_302911); 0.03::true_val(sku, unk_sku).

measured(s1, sku, w26_302911).
measured(s_merchant, sku, w26_302911).

all_consistent(sku) :-
    consistent(s1, sku),
    (indep(s_merchant), consistent(s_merchant, sku) ; \+indep(s_merchant)).

evidence(all_consistent(sku)).
query(true_val(sku, w26_302911)).
query(true_val(sku, unk_sku)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values masanori_takeuchi=Masanori_Takeuchi unk_pro_rider_name=Unknown
% @importance 0.78

0.80::acc(s5, pro_rider_name).
0.85::acc(s7, pro_rider_name).
0.95::acc(s12, pro_rider_name).

0.95::true_val(pro_rider_name, masanori_takeuchi); 0.05::true_val(pro_rider_name, unk_pro_rider_name).

measured(s5, pro_rider_name, masanori_takeuchi).
measured(s7, pro_rider_name, masanori_takeuchi).
measured(s12, pro_rider_name, masanori_takeuchi).

all_consistent(pro_rider_name) :-
    consistent(s12, pro_rider_name),
    (indep(s5), consistent(s5, pro_rider_name) ; \+indep(s5)),
    (indep(s7), consistent(s7, pro_rider_name) ; \+indep(s7)).

evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, masanori_takeuchi)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr designer_bio
% @type categorical
% @canonical false
% @original_name designer bio
% @values masa_team_rider_ak457_hikarigahara=Burton_team_rider_AK457_developer_Hikarigahara_founder unk_designer_bio=Unknown
% @importance 0.43

0.93::acc(s13, designer_bio).
0.80::acc(s14, designer_bio).

0.90::true_val(designer_bio, masa_team_rider_ak457_hikarigahara); 0.10::true_val(designer_bio, unk_designer_bio).

measured(s13, designer_bio, masa_team_rider_ak457_hikarigahara).
measured(s14, designer_bio, masa_team_rider_ak457_hikarigahara).

all_consistent(designer_bio) :-
    consistent(s13, designer_bio),
    consistent(s14, designer_bio).

evidence(all_consistent(designer_bio)).
query(true_val(designer_bio, masa_team_rider_ak457_hikarigahara)).
query(true_val(designer_bio, unk_designer_bio)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 0.85

0.93::acc(s_merchant, shape).
0.80::acc(s5, shape).

0.95::true_val(shape, tapered_directional); 0.05::true_val(shape, unk_shape).

measured(s_merchant, shape, tapered_directional).
measured(s5, shape, tapered_directional).

all_consistent(shape) :-
    (indep(s_merchant), consistent(s_merchant, shape) ; \+indep(s_merchant)),
    (indep(s5), consistent(s5, shape) ; \+indep(s5)).

evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

% @attr taper
% @type numeric
% @unit mm
% @canonical true
% @original_name taper
% @values v10=10.0 unk_taper=Unknown
% @importance 0.88

0.82::acc(s8, taper).
0.85::acc(s15, taper).

0.95::true_val(taper, v10); 0.05::true_val(taper, unk_taper).

measured(s8, taper, v10).
measured(s15, taper, v10).

all_consistent(taper) :-
    (indep(s8), consistent(s8, taper) ; \+indep(s8)),
    consistent(s15, taper).

evidence(all_consistent(taper)).
query(true_val(taper, v10)).
query(true_val(taper, unk_taper)).

% @attr setback
% @type numeric
% @unit mm
% @canonical true
% @original_name setback
% @values v_neg12_5=-12.5 unk_setback=Unknown
% @importance 0.90

0.93::acc(s_merchant, setback).
0.88::acc(s16, setback).

0.95::true_val(setback, v_neg12_5); 0.05::true_val(setback, unk_setback).

measured(s_merchant, setback, v_neg12_5).
measured(s16, setback, v_neg12_5).

all_consistent(setback) :-
    (indep(s_merchant), consistent(s_merchant, setback) ; \+indep(s_merchant)),
    consistent(s16, setback).

evidence(all_consistent(setback)).
query(true_val(setback, v_neg12_5)).
query(true_val(setback, unk_setback)).

% @attr ride_geometry
% @type categorical
% @canonical false
% @original_name ride geometry
% @values balanced_freeride=Balanced_Freeride_Geometry unk_ride_geometry=Unknown
% @importance 0.88

0.88::acc(s2, ride_geometry).
0.88::acc(s17, ride_geometry).

0.90::true_val(ride_geometry, balanced_freeride); 0.10::true_val(ride_geometry, unk_ride_geometry).

measured(s2, ride_geometry, balanced_freeride).
measured(s17, ride_geometry, balanced_freeride).

all_consistent(ride_geometry) :-
    (indep(s2), consistent(s2, ride_geometry) ; \+indep(s2)),
    (indep(s17), consistent(s17, ride_geometry) ; \+indep(s17)).

evidence(all_consistent(ride_geometry)).
query(true_val(ride_geometry, balanced_freeride)).
query(true_val(ride_geometry, unk_ride_geometry)).

% @attr three_d_base_technology
% @type categorical
% @canonical false
% @original_name 3D base technology
% @values surfboard_concave_tip_tail=Surfboard_inspired_concave_tip_tail unk_three_d_base_technology=Unknown
% @importance 0.60

0.80::acc(s10, three_d_base_technology).
0.78::acc(s11, three_d_base_technology).

0.88::true_val(three_d_base_technology, surfboard_concave_tip_tail); 0.12::true_val(three_d_base_technology, unk_three_d_base_technology).

measured(s10, three_d_base_technology, surfboard_concave_tip_tail).
measured(s11, three_d_base_technology, surfboard_concave_tip_tail).

all_consistent(three_d_base_technology) :-
    (indep(s10), consistent(s10, three_d_base_technology) ; \+indep(s10)),
    (indep(s11), consistent(s11, three_d_base_technology) ; \+indep(s11)).

evidence(all_consistent(three_d_base_technology)).
query(true_val(three_d_base_technology, surfboard_concave_tip_tail)).
query(true_val(three_d_base_technology, unk_three_d_base_technology)).

% @attr tail_design
% @type categorical
% @canonical false
% @original_name tail design
% @values swallow_tail=Swallow_tail unk_tail_design=Unknown
% @importance 0.95

0.88::acc(s16, tail_design).

0.85::true_val(tail_design, swallow_tail); 0.15::true_val(tail_design, unk_tail_design).

measured(s16, tail_design, swallow_tail).

all_consistent(tail_design) :-
    consistent(s16, tail_design).

evidence(all_consistent(tail_design)).
query(true_val(tail_design, swallow_tail)).
query(true_val(tail_design, unk_tail_design)).

% @attr nose_design
% @type categorical
% @canonical false
% @original_name nose design
% @values long_nose_early_rise=Long_nose_with_early_rise_rocker unk_nose_design=Unknown
% @importance 0.88

0.82::acc(s8, nose_design).
0.85::acc(s15, nose_design).

0.90::true_val(nose_design, long_nose_early_rise); 0.10::true_val(nose_design, unk_nose_design).

measured(s8, nose_design, long_nose_early_rise).
measured(s15, nose_design, long_nose_early_rise).

all_consistent(nose_design) :-
    (indep(s8), consistent(s8, nose_design) ; \+indep(s8)),
    consistent(s15, nose_design).

evidence(all_consistent(nose_design)).
query(true_val(nose_design, long_nose_early_rise)).
query(true_val(nose_design, unk_nose_design)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values directional_camber=Directional_Camber_rocker_nose_camber_back unk_camber_type=Unknown
% @importance 0.88

0.93::acc(s_merchant, camber_type).
0.88::acc(s2, camber_type).
0.85::acc(s7, camber_type).

0.96::true_val(camber_type, directional_camber); 0.04::true_val(camber_type, unk_camber_type).

measured(s_merchant, camber_type, directional_camber).
measured(s2, camber_type, directional_camber).
measured(s7, camber_type, directional_camber).

all_consistent(camber_type) :-
    (indep(s_merchant), consistent(s_merchant, camber_type) ; \+indep(s_merchant)),
    (indep(s2), consistent(s2, camber_type) ; \+indep(s2)),
    (indep(s7), consistent(s7, camber_type) ; \+indep(s7)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, directional_camber)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical false
% @original_name camber_description
% @values camber_both_feet_rockered_nose=Camber_under_both_feet_rockered_nose unk_camber_description=Unknown
% @importance 0.83

0.82::acc(s8, camber_description).
0.85::acc(s18, camber_description).

0.90::true_val(camber_description, camber_both_feet_rockered_nose); 0.10::true_val(camber_description, unk_camber_description).

measured(s8, camber_description, camber_both_feet_rockered_nose).
measured(s18, camber_description, camber_both_feet_rockered_nose).

all_consistent(camber_description) :-
    (indep(s8), consistent(s8, camber_description) ; \+indep(s8)),
    (indep(s18), consistent(s18, camber_description) ; \+indep(s18)).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, camber_both_feet_rockered_nose)).
query(true_val(camber_description, unk_camber_description)).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v6_5=6.5 v5_8_range=5-8_range
% @importance 0.87

0.90::acc(s_merchant, flex_rating_10).
0.78::acc(s20, flex_rating_10).

0.70::true_val(flex_rating_10, v6_5); 0.30::true_val(flex_rating_10, v5_8_range).

measured(s_merchant, flex_rating_10, v6_5).
measured(s20, flex_rating_10, v5_8_range).

all_consistent(flex_rating_10) :-
    (indep(s_merchant), consistent(s_merchant, flex_rating_10) ; \+indep(s_merchant)),
    (indep(s20), consistent(s20, flex_rating_10) ; \+indep(s20)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v6_5)).
query(true_val(flex_rating_10, v5_8_range)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values medium_stiff=Medium_Stiff unk_flex_feel=Unknown
% @importance 0.95

0.88::acc(s16, flex_feel).

0.85::true_val(flex_feel, medium_stiff); 0.15::true_val(flex_feel, unk_flex_feel).

measured(s16, flex_feel, medium_stiff).

all_consistent(flex_feel) :-
    consistent(s16, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium_stiff)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr flex_feel_alt
% @type categorical
% @canonical false
% @original_name flex_feel
% @values mid_stiff=Mid_stiff_flex unk_flex_feel_alt=Unknown
% @importance 0.85

0.80::acc(s19, flex_feel_alt).

0.78::true_val(flex_feel_alt, mid_stiff); 0.22::true_val(flex_feel_alt, unk_flex_feel_alt).

measured(s19, flex_feel_alt, mid_stiff).

all_consistent(flex_feel_alt) :-
    (indep(s19), consistent(s19, flex_feel_alt) ; \+indep(s19)).

evidence(all_consistent(flex_feel_alt)).
query(true_val(flex_feel_alt, mid_stiff)).
query(true_val(flex_feel_alt, unk_flex_feel_alt)).

% @attr flex_pattern
% @type categorical
% @canonical false
% @original_name flex pattern
% @values directional_flex=Directional_Flex_pop_tail_stiff_nose unk_flex_pattern=Unknown
% @importance 0.85

0.93::acc(s_merchant, flex_pattern).
0.82::acc(s19, flex_pattern).

0.93::true_val(flex_pattern, directional_flex); 0.07::true_val(flex_pattern, unk_flex_pattern).

measured(s_merchant, flex_pattern, directional_flex).
measured(s19, flex_pattern, directional_flex).

all_consistent(flex_pattern) :-
    (indep(s_merchant), consistent(s_merchant, flex_pattern) ; \+indep(s_merchant)),
    (indep(s19), consistent(s19, flex_pattern) ; \+indep(s19)).

evidence(all_consistent(flex_pattern)).
query(true_val(flex_pattern, directional_flex)).
query(true_val(flex_pattern, unk_flex_pattern)).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values directional=Directional unk_flex_direction=Unknown
% @importance 0.85

0.93::acc(s_merchant, flex_direction).

0.93::true_val(flex_direction, directional); 0.07::true_val(flex_direction, unk_flex_direction).

measured(s_merchant, flex_direction, directional).

all_consistent(flex_direction) :-
    (indep(s_merchant), consistent(s_merchant, flex_direction) ; \+indep(s_merchant)).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr flex_feel_detail
% @type categorical
% @canonical false
% @original_name flex_feel
% @values stiff_tail_soft_nose_poppy=Very_stiff_tail_soft_buttery_nose_poppy unk_flex_feel_detail=Unknown
% @importance 0.95

0.88::acc(s16, flex_feel_detail).

0.85::true_val(flex_feel_detail, stiff_tail_soft_nose_poppy); 0.15::true_val(flex_feel_detail, unk_flex_feel_detail).

measured(s16, flex_feel_detail, stiff_tail_soft_nose_poppy).

all_consistent(flex_feel_detail) :-
    consistent(s16, flex_feel_detail).

evidence(all_consistent(flex_feel_detail)).
query(true_val(flex_feel_detail, stiff_tail_soft_nose_poppy)).
query(true_val(flex_feel_detail, unk_flex_feel_detail)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values dragonfly_600g=Dragonfly_600G_Core super_fly_600g=Super_Fly_600G_Core
% @importance 0.90

0.95::acc(s3, core_material).
0.82::acc(s19, core_material).
0.80::acc(s_merchant, core_material).
0.78::acc(s2, core_material).

0.75::true_val(core_material, dragonfly_600g); 0.25::true_val(core_material, super_fly_600g).

measured(s3, core_material, dragonfly_600g).
measured(s19, core_material, dragonfly_600g).
measured(s_merchant, core_material, dragonfly_600g).
measured(s2, core_material, super_fly_600g).

all_consistent(core_material) :-
    consistent(s3, core_material),
    (indep(s19), consistent(s19, core_material) ; \+indep(s19)),
    (indep(s_merchant), consistent(s_merchant, core_material) ; \+indep(s_merchant)),
    (indep(s2), consistent(s2, core_material) ; \+indep(s2)).

evidence(all_consistent(core_material)).
query(true_val(core_material, dragonfly_600g)).
query(true_val(core_material, super_fly_600g)).

% @attr core_material_description
% @type categorical
% @canonical false
% @original_name core_material
% @values lightest_core_targeted_woods=One_of_lightest_cores_targeted_woods_end_grain unk_core_material_description=Unknown
% @importance 0.88

0.93::acc(s3, core_material_description).
0.82::acc(s19, core_material_description).

0.93::true_val(core_material_description, lightest_core_targeted_woods); 0.07::true_val(core_material_description, unk_core_material_description).

measured(s3, core_material_description, lightest_core_targeted_woods).
measured(s19, core_material_description, lightest_core_targeted_woods).

all_consistent(core_material_description) :-
    consistent(s3, core_material_description),
    (indep(s19), consistent(s19, core_material_description) ; \+indep(s19)).

evidence(all_consistent(core_material_description)).
query(true_val(core_material_description, lightest_core_targeted_woods)).
query(true_val(core_material_description, unk_core_material_description)).

% @attr core_zones
% @type categorical
% @canonical false
% @original_name core zones
% @values multizone_egd=Multizone_EGD_wood_grain_aligned_four_zones unk_core_zones=Unknown
% @importance 0.85

0.93::acc(s_merchant, core_zones).
0.82::acc(s19, core_zones).

0.93::true_val(core_zones, multizone_egd); 0.07::true_val(core_zones, unk_core_zones).

measured(s_merchant, core_zones, multizone_egd).
measured(s19, core_zones, multizone_egd).

all_consistent(core_zones) :-
    (indep(s_merchant), consistent(s_merchant, core_zones) ; \+indep(s_merchant)),
    (indep(s19), consistent(s19, core_zones) ; \+indep(s19)).

evidence(all_consistent(core_zones)).
query(true_val(core_zones, multizone_egd)).
query(true_val(core_zones, unk_core_zones)).

% @attr core_profiling
% @type categorical
% @canonical false
% @original_name core profiling
% @values squeezebox=Squeezebox_thick_thin_sections_energy_transfer unk_core_profiling=Unknown
% @importance 0.90

0.88::acc(s2, core_profiling).
0.82::acc(s19, core_profiling).

0.90::true_val(core_profiling, squeezebox); 0.10::true_val(core_profiling, unk_core_profiling).

measured(s2, core_profiling, squeezebox).
measured(s19, core_profiling, squeezebox).

all_consistent(core_profiling) :-
    (indep(s2), consistent(s2, core_profiling) ; \+indep(s2)),
    (indep(s19), consistent(s19, core_profiling) ; \+indep(s19)).

evidence(all_consistent(core_profiling)).
query(true_val(core_profiling, squeezebox)).
query(true_val(core_profiling, unk_core_profiling)).

% @attr core_weight_class
% @type categorical
% @canonical false
% @original_name core weight class
% @values ultralight=Ultralight unk_core_weight_class=Unknown
% @importance 0.88

0.93::acc(s3, core_weight_class).
0.82::acc(s19, core_weight_class).

0.93::true_val(core_weight_class, ultralight); 0.07::true_val(core_weight_class, unk_core_weight_class).

measured(s3, core_weight_class, ultralight).
measured(s19, core_weight_class, ultralight).

all_consistent(core_weight_class) :-
    consistent(s3, core_weight_class),
    (indep(s19), consistent(s19, core_weight_class) ; \+indep(s19)).

evidence(all_consistent(core_weight_class)).
query(true_val(core_weight_class, ultralight)).
query(true_val(core_weight_class, unk_core_weight_class)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values carbon_highlights_45deg=45_degree_Carbon_Highlights_tip_to_tail unk_laminate=Unknown
% @importance 0.88

0.93::acc(s_merchant, laminate).
0.88::acc(s2, laminate).
0.82::acc(s19, laminate).

0.95::true_val(laminate, carbon_highlights_45deg); 0.05::true_val(laminate, unk_laminate).

measured(s_merchant, laminate, carbon_highlights_45deg).
measured(s2, laminate, carbon_highlights_45deg).
measured(s19, laminate, carbon_highlights_45deg).

all_consistent(laminate) :-
    (indep(s_merchant), consistent(s_merchant, laminate) ; \+indep(s_merchant)),
    (indep(s2), consistent(s2, laminate) ; \+indep(s2)),
    (indep(s19), consistent(s19, laminate) ; \+indep(s19)).

evidence(all_consistent(laminate)).
query(true_val(laminate, carbon_highlights_45deg)).
query(true_val(laminate, unk_laminate)).

% @attr construction_material_innovation
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values yes_tip_to_tail_carbon=Yes_tip_to_tail_carbon_layer unk_construction_material_innovation=Unknown
% @importance 0.90

0.88::acc(s2, construction_material_innovation).
0.82::acc(s19, construction_material_innovation).

0.90::true_val(construction_material_innovation, yes_tip_to_tail_carbon); 0.10::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s2, construction_material_innovation, yes_tip_to_tail_carbon).
measured(s19, construction_material_innovation, yes_tip_to_tail_carbon).

all_consistent(construction_material_innovation) :-
    (indep(s2), consistent(s2, construction_material_innovation) ; \+indep(s2)),
    (indep(s19), consistent(s19, construction_material_innovation) ; \+indep(s19)).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, yes_tip_to_tail_carbon)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr laminate_detail
% @type categorical
% @canonical false
% @original_name laminate
% @values angle_45_aggressive_torsion=45_degree_fiber_aggressive_torsional_flex unk_laminate_detail=Unknown
% @importance 0.95

0.88::acc(s2, laminate_detail).

0.85::true_val(laminate_detail, angle_45_aggressive_torsion); 0.15::true_val(laminate_detail, unk_laminate_detail).

measured(s2, laminate_detail, angle_45_aggressive_torsion).

all_consistent(laminate_detail) :-
    (indep(s2), consistent(s2, laminate_detail) ; \+indep(s2)).

evidence(all_consistent(laminate_detail)).
query(true_val(laminate_detail, angle_45_aggressive_torsion)).
query(true_val(laminate_detail, unk_laminate_detail)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_wfo=Sintered_WFO unk_base_material=Unknown
% @importance 0.90

0.93::acc(s_merchant, base_material).
0.88::acc(s2, base_material).

0.95::true_val(base_material, sintered_wfo); 0.05::true_val(base_material, unk_base_material).

measured(s_merchant, base_material, sintered_wfo).
measured(s2, base_material, sintered_wfo).

all_consistent(base_material) :-
    (indep(s_merchant), consistent(s_merchant, base_material) ; \+indep(s_merchant)),
    (indep(s2), consistent(s2, base_material) ; \+indep(s2)).

evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_wfo)).
query(true_val(base_material, unk_base_material)).

% @attr base_material_description
% @type categorical
% @canonical false
% @original_name base_material
% @values extra_absorbent_high_density=Extra_absorbent_high_density_sintered_wax_infused unk_base_material_description=Unknown
% @importance 0.90

0.88::acc(s2, base_material_description).
0.82::acc(s19, base_material_description).

0.90::true_val(base_material_description, extra_absorbent_high_density); 0.10::true_val(base_material_description, unk_base_material_description).

measured(s2, base_material_description, extra_absorbent_high_density).
measured(s19, base_material_description, extra_absorbent_high_density).

all_consistent(base_material_description) :-
    (indep(s2), consistent(s2, base_material_description) ; \+indep(s2)),
    (indep(s19), consistent(s19, base_material_description) ; \+indep(s19)).

evidence(all_consistent(base_material_description)).
query(true_val(base_material_description, extra_absorbent_high_density)).
query(true_val(base_material_description, unk_base_material_description)).

% @attr base_type
% @type categorical
% @canonical false
% @original_name base_type
% @values sintered=Sintered unk_base_type=Unknown
% @importance 0.85

0.93::acc(s_merchant, base_type).

0.93::true_val(base_type, sintered); 0.07::true_val(base_type, unk_base_type).

measured(s_merchant, base_type, sintered).

all_consistent(base_type) :-
    (indep(s_merchant), consistent(s_merchant, base_type) ; \+indep(s_merchant)).

evidence(all_consistent(base_type)).
query(true_val(base_type, sintered)).
query(true_val(base_type, unk_base_type)).

% @attr resin
% @type categorical
% @canonical false
% @original_name resin
% @values super_sap_epoxy=Super_Sap_Epoxy_bio_based_50pct_less_carbon unk_resin=Unknown
% @importance 0.85

0.93::acc(s_merchant, resin).
0.82::acc(s19, resin).

0.93::true_val(resin, super_sap_epoxy); 0.07::true_val(resin, unk_resin).

measured(s_merchant, resin, super_sap_epoxy).
measured(s19, resin, super_sap_epoxy).

all_consistent(resin) :-
    (indep(s_merchant), consistent(s_merchant, resin) ; \+indep(s_merchant)),
    (indep(s19), consistent(s19, resin) ; \+indep(s19)).

evidence(all_consistent(resin)).
query(true_val(resin, super_sap_epoxy)).
query(true_val(resin, unk_resin)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values fsc_certified=FSC_Certified_C124994 unk_sustainability_certification=Unknown
% @importance 0.85

0.87::acc(s7, sustainability_certification).

0.87::true_val(sustainability_certification, fsc_certified); 0.13::true_val(sustainability_certification, unk_sustainability_certification).

measured(s7, sustainability_certification, fsc_certified).

all_consistent(sustainability_certification) :-
    (indep(s7), consistent(s7, sustainability_certification) ; \+indep(s7)).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, fsc_certified)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr sustainability_certification_detail
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values bio_resin_fsc_wood=Bio_based_Super_Sap_resin_FSC_wood_core unk_sustainability_certification_detail=Unknown
% @importance 0.85

0.87::acc(s7, sustainability_certification_detail).
0.82::acc(s19, sustainability_certification_detail).

0.90::true_val(sustainability_certification_detail, bio_resin_fsc_wood); 0.10::true_val(sustainability_certification_detail, unk_sustainability_certification_detail).

measured(s7, sustainability_certification_detail, bio_resin_fsc_wood).
measured(s19, sustainability_certification_detail, bio_resin_fsc_wood).

all_consistent(sustainability_certification_detail) :-
    (indep(s7), consistent(s7, sustainability_certification_detail) ; \+indep(s7)),
    (indep(s19), consistent(s19, sustainability_certification_detail) ; \+indep(s19)).

evidence(all_consistent(sustainability_certification_detail)).
query(true_val(sustainability_certification_detail, bio_resin_fsc_wood)).
query(true_val(sustainability_certification_detail, unk_sustainability_certification_detail)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values the_channel=The_Channel_single_channel_system unk_mounting_pattern=Unknown
% @importance 0.85

0.93::acc(s_merchant, mounting_pattern).
0.87::acc(s7, mounting_pattern).

0.95::true_val(mounting_pattern, the_channel); 0.05::true_val(mounting_pattern, unk_mounting_pattern).

measured(s_merchant, mounting_pattern, the_channel).
measured(s7, mounting_pattern, the_channel).

all_consistent(mounting_pattern) :-
    (indep(s_merchant), consistent(s_merchant, mounting_pattern) ; \+indep(s_merchant)),
    (indep(s7), consistent(s7, mounting_pattern) ; \+indep(s7)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, the_channel)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr mounting_pattern_description
% @type categorical
% @canonical false
% @original_name mounting_pattern
% @values micro_adjust_stance_rebound=Central_spine_micro_adjust_stance_rebound unk_mounting_pattern_description=Unknown
% @importance 0.85

0.87::acc(s7, mounting_pattern_description).

0.85::true_val(mounting_pattern_description, micro_adjust_stance_rebound); 0.15::true_val(mounting_pattern_description, unk_mounting_pattern_description).

measured(s7, mounting_pattern_description, micro_adjust_stance_rebound).

all_consistent(mounting_pattern_description) :-
    (indep(s7), consistent(s7, mounting_pattern_description) ; \+indep(s7)).

evidence(all_consistent(mounting_pattern_description)).
query(true_val(mounting_pattern_description, micro_adjust_stance_rebound)).
query(true_val(mounting_pattern_description, unk_mounting_pattern_description)).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values all_channel_compatible=All_Channel_compatible_bindings_best_with_EST unk_binding_compatibility=Unknown
% @importance 0.85

0.87::acc(s7, binding_compatibility).
0.82::acc(s19, binding_compatibility).

0.90::true_val(binding_compatibility, all_channel_compatible); 0.10::true_val(binding_compatibility, unk_binding_compatibility).

measured(s7, binding_compatibility, all_channel_compatible).
measured(s19, binding_compatibility, all_channel_compatible).

all_consistent(binding_compatibility) :-
    (indep(s7), consistent(s7, binding_compatibility) ; \+indep(s7)),
    (indep(s19), consistent(s19, binding_compatibility) ; \+indep(s19)).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, all_channel_compatible)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

% @attr mounting_pattern_extended
% @type categorical
% @canonical false
% @original_name mounting_pattern
% @values extended_channel_limitless=Extended_channel_limitless_stance_options unk_mounting_pattern_extended=Unknown
% @importance 0.83

0.85::acc(s4, mounting_pattern_extended).
0.85::acc(s15, mounting_pattern_extended).

0.90::true_val(mounting_pattern_extended, extended_channel_limitless); 0.10::true_val(mounting_pattern_extended, unk_mounting_pattern_extended).

measured(s4, mounting_pattern_extended, extended_channel_limitless).
measured(s15, mounting_pattern_extended, extended_channel_limitless).

all_consistent(mounting_pattern_extended) :-
    consistent(s4, mounting_pattern_extended),
    consistent(s15, mounting_pattern_extended).

evidence(all_consistent(mounting_pattern_extended)).
query(true_val(mounting_pattern_extended, extended_channel_limitless)).
query(true_val(mounting_pattern_extended, unk_mounting_pattern_extended)).

% @attr binding_compatibility_est
% @type categorical
% @canonical false
% @original_name binding_compatibility
% @values est_only_channel=EST_bindings_ONLY_compatible_with_Channel unk_binding_compatibility_est=Unknown
% @importance 0.85

0.82::acc(s5, binding_compatibility_est).

0.82::true_val(binding_compatibility_est, est_only_channel); 0.18::true_val(binding_compatibility_est, unk_binding_compatibility_est).

measured(s5, binding_compatibility_est, est_only_channel).

all_consistent(binding_compatibility_est) :-
    (indep(s5), consistent(s5, binding_compatibility_est) ; \+indep(s5)).

evidence(all_consistent(binding_compatibility_est)).
query(true_val(binding_compatibility_est, est_only_channel)).
query(true_val(binding_compatibility_est, unk_binding_compatibility_est)).

% @attr flex_technology
% @type categorical
% @canonical false
% @original_name flex technology
% @values infinite_ride=Infinite_Ride_factory_overbuilt_broken_in unk_flex_technology=Unknown
% @importance 0.88

0.93::acc(s_merchant, flex_technology).
0.88::acc(s2, flex_technology).
0.87::acc(s7, flex_technology).

0.95::true_val(flex_technology, infinite_ride); 0.05::true_val(flex_technology, unk_flex_technology).

measured(s_merchant, flex_technology, infinite_ride).
measured(s2, flex_technology, infinite_ride).
measured(s7, flex_technology, infinite_ride).

all_consistent(flex_technology) :-
    (indep(s_merchant), consistent(s_merchant, flex_technology) ; \+indep(s_merchant)),
    (indep(s2), consistent(s2, flex_technology) ; \+indep(s2)),
    (indep(s7), consistent(s7, flex_technology) ; \+indep(s7)).

evidence(all_consistent(flex_technology)).
query(true_val(flex_technology, infinite_ride)).
query(true_val(flex_technology, unk_flex_technology)).

% @attr available_sizes_148
% @type categorical
% @canonical false
% @original_name available_sizes
% @values v148cm=148cm unk_available_sizes_148=Unknown
% @importance 0.85

0.93::acc(s_merchant, available_sizes_148).

0.93::true_val(available_sizes_148, v148cm); 0.07::true_val(available_sizes_148, unk_available_sizes_148).

measured(s_merchant, available_sizes_148, v148cm).

all_consistent(available_sizes_148) :-
    (indep(s_merchant), consistent(s_merchant, available_sizes_148) ; \+indep(s_merchant)).

evidence(all_consistent(available_sizes_148)).
query(true_val(available_sizes_148, v148cm)).
query(true_val(available_sizes_148, unk_available_sizes_148)).

% @attr effective_edge_148
% @type numeric
% @unit cm
% @canonical false
% @original_name effective edge (148cm)
% @values v111_5=111.5 unk_effective_edge_148=Unknown
% @importance 0.85

0.93::acc(s_merchant, effective_edge_148).

0.93::true_val(effective_edge_148, v111_5); 0.07::true_val(effective_edge_148, unk_effective_edge_148).

measured(s_merchant, effective_edge_148, v111_5).

all_consistent(effective_edge_148) :-
    (indep(s_merchant), consistent(s_merchant, effective_edge_148) ; \+indep(s_merchant)).

evidence(all_consistent(effective_edge_148)).
query(true_val(effective_edge_148, v111_5)).
query(true_val(effective_edge_148, unk_effective_edge_148)).

% @attr sidecut_radius_size_148
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v8_4=8.4 unk_sidecut_radius_size_148=Unknown
% @importance 0.85

0.93::acc(s_merchant, sidecut_radius_size_148).

0.93::true_val(sidecut_radius_size_148, v8_4); 0.07::true_val(sidecut_radius_size_148, unk_sidecut_radius_size_148).

measured(s_merchant, sidecut_radius_size_148, v8_4).

all_consistent(sidecut_radius_size_148) :-
    (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_148) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_radius_size_148)).
query(true_val(sidecut_radius_size_148, v8_4)).
query(true_val(sidecut_radius_size_148, unk_sidecut_radius_size_148)).

% @attr tip_tail_width_size_148
% @type categorical
% @unit cm
% @canonical false
% @original_name tip_tail_width_size
% @values v28_07_27_07=28.07_27.07 unk_tip_tail_width_size_148=Unknown
% @importance 0.85

0.93::acc(s_merchant, tip_tail_width_size_148).

0.93::true_val(tip_tail_width_size_148, v28_07_27_07); 0.07::true_val(tip_tail_width_size_148, unk_tip_tail_width_size_148).

measured(s_merchant, tip_tail_width_size_148, v28_07_27_07).

all_consistent(tip_tail_width_size_148) :-
    (indep(s_merchant), consistent(s_merchant, tip_tail_width_size_148) ; \+indep(s_merchant)).

evidence(all_consistent(tip_tail_width_size_148)).
query(true_val(tip_tail_width_size_148, v28_07_27_07)).
query(true_val(tip_tail_width_size_148, unk_tip_tail_width_size_148)).

% @attr waist_width_148
% @type numeric
% @unit cm
% @canonical false
% @original_name waist width (148cm)
% @values v24_3=24.3 unk_waist_width_148=Unknown
% @importance 0.85

0.93::acc(s_merchant, waist_width_148).

0.93::true_val(waist_width_148, v24_3); 0.07::true_val(waist_width_148, unk_waist_width_148).

measured(s_merchant, waist_width_148, v24_3).

all_consistent(waist_width_148) :-
    (indep(s_merchant), consistent(s_merchant, waist_width_148) ; \+indep(s_merchant)).

evidence(all_consistent(waist_width_148)).
query(true_val(waist_width_148, v24_3)).
query(true_val(waist_width_148, unk_waist_width_148)).

% @attr stance_width_range_size_148
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size
% @values v51_0=51.0 unk_stance_width_range_size_148=Unknown
% @importance 0.85

0.93::acc(s_merchant, stance_width_range_size_148).

0.93::true_val(stance_width_range_size_148, v51_0); 0.07::true_val(stance_width_range_size_148, unk_stance_width_range_size_148).

measured(s_merchant, stance_width_range_size_148, v51_0).

all_consistent(stance_width_range_size_148) :-
    (indep(s_merchant), consistent(s_merchant, stance_width_range_size_148) ; \+indep(s_merchant)).

evidence(all_consistent(stance_width_range_size_148)).
query(true_val(stance_width_range_size_148, v51_0)).
query(true_val(stance_width_range_size_148, unk_stance_width_range_size_148)).

% @attr recommended_weight_range_size_148
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values v45_68kg=45-68kg unk_recommended_weight_range_size_148=Unknown
% @importance 0.85

0.93::acc(s_merchant, recommended_weight_range_size_148).

0.93::true_val(recommended_weight_range_size_148, v45_68kg); 0.07::true_val(recommended_weight_range_size_148, unk_recommended_weight_range_size_148).

measured(s_merchant, recommended_weight_range_size_148, v45_68kg).

all_consistent(recommended_weight_range_size_148) :-
    (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size_148) ; \+indep(s_merchant)).

evidence(all_consistent(recommended_weight_range_size_148)).
query(true_val(recommended_weight_range_size_148, v45_68kg)).
query(true_val(recommended_weight_range_size_148, unk_recommended_weight_range_size_148)).

% @attr available_sizes_152
% @type categorical
% @canonical false
% @original_name available_sizes
% @values v152cm=152cm unk_available_sizes_152=Unknown
% @importance 0.85

0.93::acc(s_merchant, available_sizes_152).

0.93::true_val(available_sizes_152, v152cm); 0.07::true_val(available_sizes_152, unk_available_sizes_152).

measured(s_merchant, available_sizes_152, v152cm).

all_consistent(available_sizes_152) :-
    (indep(s_merchant), consistent(s_merchant, available_sizes_152) ; \+indep(s_merchant)).

evidence(all_consistent(available_sizes_152)).
query(true_val(available_sizes_152, v152cm)).
query(true_val(available_sizes_152, unk_available_sizes_152)).

% @attr effective_edge_152
% @type numeric
% @unit cm
% @canonical false
% @original_name effective edge (152cm)
% @values v114_5=114.5 unk_effective_edge_152=Unknown
% @importance 0.85

0.93::acc(s_merchant, effective_edge_152).

0.93::true_val(effective_edge_152, v114_5); 0.07::true_val(effective_edge_152, unk_effective_edge_152).

measured(s_merchant, effective_edge_152, v114_5).

all_consistent(effective_edge_152) :-
    (indep(s_merchant), consistent(s_merchant, effective_edge_152) ; \+indep(s_merchant)).

evidence(all_consistent(effective_edge_152)).
query(true_val(effective_edge_152, v114_5)).
query(true_val(effective_edge_152, unk_effective_edge_152)).

% @attr sidecut_radius_size_152
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v8_6=8.6 unk_sidecut_radius_size_152=Unknown
% @importance 0.85

0.93::acc(s_merchant, sidecut_radius_size_152).

0.93::true_val(sidecut_radius_size_152, v8_6); 0.07::true_val(sidecut_radius_size_152, unk_sidecut_radius_size_152).

measured(s_merchant, sidecut_radius_size_152, v8_6).

all_consistent(sidecut_radius_size_152) :-
    (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_152) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_radius_size_152)).
query(true_val(sidecut_radius_size_152, v8_6)).
query(true_val(sidecut_radius_size_152, unk_sidecut_radius_size_152)).

% @attr tip_tail_width_size_152
% @type categorical
% @unit cm
% @canonical false
% @original_name tip_tail_width_size
% @values v28_56_27_56=28.56_27.56 unk_tip_tail_width_size_152=Unknown
% @importance 0.85

0.93::acc(s_merchant, tip_tail_width_size_152).

0.93::true_val(tip_tail_width_size_152, v28_56_27_56); 0.07::true_val(tip_tail_width_size_152, unk_tip_tail_width_size_152).

measured(s_merchant, tip_tail_width_size_152, v28_56_27_56).

all_consistent(tip_tail_width_size_152) :-
    (indep(s_merchant), consistent(s_merchant, tip_tail_width_size_152) ; \+indep(s_merchant)).

evidence(all_consistent(tip_tail_width_size_152)).
query(true_val(tip_tail_width_size_152, v28_56_27_56)).
query(true_val(tip_tail_width_size_152, unk_tip_tail_width_size_152)).

% @attr waist_width_152
% @type numeric
% @unit cm
% @canonical false
% @original_name waist width (152cm)
% @values v24_7=24.7 unk_waist_width_152=Unknown
% @importance 0.85

0.93::acc(s_merchant, waist_width_152).

0.93::true_val(waist_width_152, v24_7); 0.07::true_val(waist_width_152, unk_waist_width_152).

measured(s_merchant, waist_width_152, v24_7).

all_consistent(waist_width_152) :-
    (indep(s_merchant), consistent(s_merchant, waist_width_152) ; \+indep(s_merchant)).

evidence(all_consistent(waist_width_152)).
query(true_val(waist_width_152, v24_7)).
query(true_val(waist_width_152, unk_waist_width_152)).

% @attr stance_width_range_size_152
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size
% @values v51_0=51.0 unk_stance_width_range_size_152=Unknown
% @importance 0.85

0.93::acc(s_merchant, stance_width_range_size_152).

0.93::true_val(stance_width_range_size_152, v51_0); 0.07::true_val(stance_width_range_size_152, unk_stance_width_range_size_152).

measured(s_merchant, stance_width_range_size_152, v51_0).

all_consistent(stance_width_range_size_152) :-
    (indep(s_merchant), consistent(s_merchant, stance_width_range_size_152) ; \+indep(s_merchant)).

evidence(all_consistent(stance_width_range_size_152)).
query(true_val(stance_width_range_size_152, v51_0)).
query(true_val(stance_width_range_size_152, unk_stance_width_range_size_152)).

% @attr recommended_weight_range_size_152
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values v54_82kg=54-82kg unk_recommended_weight_range_size_152=Unknown
% @importance 0.85

0.93::acc(s_merchant, recommended_weight_range_size_152).

0.93::true_val(recommended_weight_range_size_152, v54_82kg); 0.07::true_val(recommended_weight_range_size_152, unk_recommended_weight_range_size_152).

measured(s_merchant, recommended_weight_range_size_152, v54_82kg).

all_consistent(recommended_weight_range_size_152) :-
    (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size_152) ; \+indep(s_merchant)).

evidence(all_consistent(recommended_weight_range_size_152)).
query(true_val(recommended_weight_range_size_152, v54_82kg)).
query(true_val(recommended_weight_range_size_152, unk_recommended_weight_range_size_152)).

% @attr available_sizes_156
% @type categorical
% @canonical false
% @original_name available_sizes
% @values v156cm=156cm unk_available_sizes_156=Unknown
% @importance 0.85

0.93::acc(s_merchant, available_sizes_156).

0.93::true_val(available_sizes_156, v156cm); 0.07::true_val(available_sizes_156, unk_available_sizes_156).

measured(s_merchant, available_sizes_156, v156cm).

all_consistent(available_sizes_156) :-
    (indep(s_merchant), consistent(s_merchant, available_sizes_156) ; \+indep(s_merchant)).

evidence(all_consistent(available_sizes_156)).
query(true_val(available_sizes_156, v156cm)).
query(true_val(available_sizes_156, unk_available_sizes_156)).

% @attr effective_edge_156
% @type numeric
% @unit cm
% @canonical false
% @original_name effective edge (156cm)
% @values v117_5=117.5 unk_effective_edge_156=Unknown
% @importance 0.85

0.93::acc(s_merchant, effective_edge_156).

0.93::true_val(effective_edge_156, v117_5); 0.07::true_val(effective_edge_156, unk_effective_edge_156).

measured(s_merchant, effective_edge_156, v117_5).

all_consistent(effective_edge_156) :-
    (indep(s_merchant), consistent(s_merchant, effective_edge_156) ; \+indep(s_merchant)).

evidence(all_consistent(effective_edge_156)).
query(true_val(effective_edge_156, v117_5)).
query(true_val(effective_edge_156, unk_effective_edge_156)).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size
% @values v8_8=8.8 unk_sidecut_radius_size=Unknown
% @importance 0.85

0.93::acc(s_merchant, sidecut_radius_size).

0.93::true_val(sidecut_radius_size, v8_8); 0.07::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s_merchant, sidecut_radius_size, v8_8).

all_consistent(sidecut_radius_size) :-
    (indep(s_merchant), consistent(s_merchant, sidecut_radius_size) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v8_8)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr tip_tail_width_size
% @type categorical
% @unit cm
% @canonical true
% @original_name tip_tail_width_size
% @values v29_06_28_06=29.06_28.06 unk_tip_tail_width_size=Unknown
% @importance 0.85

0.93::acc(s_merchant, tip_tail_width_size).

0.93::true_val(tip_tail_width_size, v29_06_28_06); 0.07::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s_merchant, tip_tail_width_size, v29_06_28_06).

all_consistent(tip_tail_width_size) :-
    (indep(s_merchant), consistent(s_merchant, tip_tail_width_size) ; \+indep(s_merchant)).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v29_06_28_06)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr waist_width_156
% @type numeric
% @unit cm
% @canonical false
% @original_name waist width (156cm)
% @values v25_1=25.1 unk_waist_width_156=Unknown
% @importance 0.85

0.93::acc(s_merchant, waist_width_156).

0.93::true_val(waist_width_156, v25_1); 0.07::true_val(waist_width_156, unk_waist_width_156).

measured(s_merchant, waist_width_156, v25_1).

all_consistent(waist_width_156) :-
    (indep(s_merchant), consistent(s_merchant, waist_width_156) ; \+indep(s_merchant)).

evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v25_1)).
query(true_val(waist_width_156, unk_waist_width_156)).

% @attr stance_width_range_size
% @type numeric
% @unit cm
% @canonical true
% @original_name stance_width_range_size
% @values v54_0=54.0 unk_stance_width_range_size=Unknown
% @importance 0.85

0.93::acc(s_merchant, stance_width_range_size).

0.93::true_val(stance_width_range_size, v54_0); 0.07::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s_merchant, stance_width_range_size, v54_0).

all_consistent(stance_width_range_size) :-
    (indep(s_merchant), consistent(s_merchant, stance_width_range_size) ; \+indep(s_merchant)).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v54_0)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size
% @values v68_91kg=68-91kg unk_recommended_weight_range_size=Unknown
% @importance 0.85

0.93::acc(s_merchant, recommended_weight_range_size).

0.93::true_val(recommended_weight_range_size, v68_91kg); 0.07::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s_merchant, recommended_weight_range_size, v68_91kg).

all_consistent(recommended_weight_range_size) :-
    (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size) ; \+indep(s_merchant)).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, v68_91kg)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr available_sizes_144
% @type categorical
% @canonical false
% @original_name available_sizes
% @values v144cm=144cm unk_available_sizes_144=Unknown
% @importance 0.90

0.80::acc(s15, available_sizes_144).

0.75::true_val(available_sizes_144, v144cm); 0.25::true_val(available_sizes_144, unk_available_sizes_144).

measured(s15, available_sizes_144, v144cm).

all_consistent(available_sizes_144) :-
    consistent(s15, available_sizes_144).

evidence(all_consistent(available_sizes_144)).
query(true_val(available_sizes_144, v144cm)).
query(true_val(available_sizes_144, unk_available_sizes_144)).

% @attr available_sizes_160
% @type categorical
% @canonical false
% @original_name available_sizes
% @values v160cm=160cm unk_available_sizes_160=Unknown
% @importance 0.90

0.82::acc(s8, available_sizes_160).
0.88::acc(s16, available_sizes_160).

0.92::true_val(available_sizes_160, v160cm); 0.08::true_val(available_sizes_160, unk_available_sizes_160).

measured(s8, available_sizes_160, v160cm).
measured(s16, available_sizes_160, v160cm).

all_consistent(available_sizes_160) :-
    (indep(s8), consistent(s8, available_sizes_160) ; \+indep(s8)),
    consistent(s16, available_sizes_160).

evidence(all_consistent(available_sizes_160)).
query(true_val(available_sizes_160, v160cm)).
query(true_val(available_sizes_160, unk_available_sizes_160)).

% @attr available_sizes_164
% @type categorical
% @canonical false
% @original_name available_sizes
% @values v164cm=164cm unk_available_sizes_164=Unknown
% @importance 0.90

0.82::acc(s8, available_sizes_164).
0.88::acc(s16, available_sizes_164).

0.92::true_val(available_sizes_164, v164cm); 0.08::true_val(available_sizes_164, unk_available_sizes_164).

measured(s8, available_sizes_164, v164cm).
measured(s16, available_sizes_164, v164cm).

all_consistent(available_sizes_164) :-
    (indep(s8), consistent(s8, available_sizes_164) ; \+indep(s8)),
    consistent(s16, available_sizes_164).

evidence(all_consistent(available_sizes_164)).
query(true_val(available_sizes_164, v164cm)).
query(true_val(available_sizes_164, unk_available_sizes_164)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values six_sizes=144_148_152_156_160_164 four_sizes=152_156_160_164
% @importance 0.88

0.82::acc(s15, available_sizes).
0.80::acc(s8, available_sizes).

0.55::true_val(available_sizes, six_sizes); 0.45::true_val(available_sizes, four_sizes).

measured(s15, available_sizes, six_sizes).
measured(s8, available_sizes, four_sizes).

all_consistent(available_sizes) :-
    consistent(s15, available_sizes),
    (indep(s8), consistent(s8, available_sizes) ; \+indep(s8)).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, six_sizes)).
query(true_val(available_sizes, four_sizes)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_only=Standard_no_wide unk_width_options=Unknown
% @importance 0.85

0.93::acc(s_merchant, width_options).
0.82::acc(s19, width_options).

0.93::true_val(width_options, standard_only); 0.07::true_val(width_options, unk_width_options).

measured(s_merchant, width_options, standard_only).
measured(s19, width_options, standard_only).

all_consistent(width_options) :-
    (indep(s_merchant), consistent(s_merchant, width_options) ; \+indep(s_merchant)),
    (indep(s19), consistent(s19, width_options) ; \+indep(s19)).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_only)).
query(true_val(width_options, unk_width_options)).

% @attr terrain_suitability_park
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability
% @values v1=1.0 unk_terrain_suitability_park=Unknown
% @importance 0.85

0.90::acc(s_merchant, terrain_suitability_park).

0.90::true_val(terrain_suitability_park, v1); 0.10::true_val(terrain_suitability_park, unk_terrain_suitability_park).

measured(s_merchant, terrain_suitability_park, v1).

all_consistent(terrain_suitability_park) :-
    (indep(s_merchant), consistent(s_merchant, terrain_suitability_park) ; \+indep(s_merchant)).

evidence(all_consistent(terrain_suitability_park)).
query(true_val(terrain_suitability_park, v1)).
query(true_val(terrain_suitability_park, unk_terrain_suitability_park)).

% @attr terrain_suitability_am
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability
% @values v7=7.0 unk_terrain_suitability_am=Unknown
% @importance 0.85

0.90::acc(s_merchant, terrain_suitability_am).

0.90::true_val(terrain_suitability_am, v7); 0.10::true_val(terrain_suitability_am, unk_terrain_suitability_am).

measured(s_merchant, terrain_suitability_am, v7).

all_consistent(terrain_suitability_am) :-
    (indep(s_merchant), consistent(s_merchant, terrain_suitability_am) ; \+indep(s_merchant)).

evidence(all_consistent(terrain_suitability_am)).
query(true_val(terrain_suitability_am, v7)).
query(true_val(terrain_suitability_am, unk_terrain_suitability_am)).

% @attr terrain_suitability
% @type numeric
% @unit /10
% @canonical true
% @original_name terrain_suitability
% @values v10=10.0 unk_terrain_suitability=Unknown
% @importance 0.90

0.93::acc(s_merchant, terrain_suitability).
0.90::acc(s2, terrain_suitability).

0.96::true_val(terrain_suitability, v10); 0.04::true_val(terrain_suitability, unk_terrain_suitability).

measured(s_merchant, terrain_suitability, v10).
measured(s2, terrain_suitability, v10).

all_consistent(terrain_suitability) :-
    (indep(s_merchant), consistent(s_merchant, terrain_suitability) ; \+indep(s_merchant)),
    (indep(s2), consistent(s2, terrain_suitability) ; \+indep(s2)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, v10)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr rider_level
% @type categorical
% @canonical false
% @original_name rider_level
% @values intermediate_advanced=Intermediate_Advanced unk_rider_level=Unknown
% @importance 0.85

0.90::acc(s_merchant, rider_level).

0.90::true_val(rider_level, intermediate_advanced); 0.10::true_val(rider_level, unk_rider_level).

measured(s_merchant, rider_level, intermediate_advanced).

all_consistent(rider_level) :-
    (indep(s_merchant), consistent(s_merchant, rider_level) ; \+indep(s_merchant)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate_advanced)).
query(true_val(rider_level, unk_rider_level)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values expert=Expert intermediate_to_expert=Intermediate_to_Expert intermediate_advanced=Intermediate_Advanced
% @importance 0.88

0.85::acc(s7, skill_level_recommendation).
0.88::acc(s16, skill_level_recommendation).
0.78::acc(s20, skill_level_recommendation).
0.85::acc(s_merchant, skill_level_recommendation).

0.25::true_val(skill_level_recommendation, expert); 0.50::true_val(skill_level_recommendation, intermediate_to_expert); 0.25::true_val(skill_level_recommendation, intermediate_advanced_skill).

measured(s7, skill_level_recommendation, expert).
measured(s16, skill_level_recommendation, intermediate_to_expert).
measured(s20, skill_level_recommendation, intermediate_to_expert).
measured(s_merchant, skill_level_recommendation, intermediate_advanced_skill).

all_consistent(skill_level_recommendation) :-
    (indep(s7), consistent(s7, skill_level_recommendation) ; \+indep(s7)),
    consistent(s16, skill_level_recommendation),
    (indep(s20), consistent(s20, skill_level_recommendation) ; \+indep(s20)),
    (indep(s_merchant), consistent(s_merchant, skill_level_recommendation) ; \+indep(s_merchant)).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, expert)).
query(true_val(skill_level_recommendation, intermediate_to_expert)).
query(true_val(skill_level_recommendation, intermediate_advanced_skill)).

% @attr terrain_suitability_terrain_list
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values powder_trees_natural_steep=Powder_Trees_Natural_transitions_Steep_Deep unk_terrain_suitability_terrain_list=Unknown
% @importance 0.85

0.90::acc(s_merchant, terrain_suitability_terrain_list).

0.90::true_val(terrain_suitability_terrain_list, powder_trees_natural_steep); 0.10::true_val(terrain_suitability_terrain_list, unk_terrain_suitability_terrain_list).

measured(s_merchant, terrain_suitability_terrain_list, powder_trees_natural_steep).

all_consistent(terrain_suitability_terrain_list) :-
    (indep(s_merchant), consistent(s_merchant, terrain_suitability_terrain_list) ; \+indep(s_merchant)).

evidence(all_consistent(terrain_suitability_terrain_list)).
query(true_val(terrain_suitability_terrain_list, powder_trees_natural_steep)).
query(true_val(terrain_suitability_terrain_list, unk_terrain_suitability_terrain_list)).

% @attr terrain_suitability_japan
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values deep_japanese_powder=Deep_Japanese_style_powder unk_terrain_suitability_japan=Unknown
% @importance 0.88

0.93::acc(s3, terrain_suitability_japan).
0.82::acc(s5, terrain_suitability_japan).

0.93::true_val(terrain_suitability_japan, deep_japanese_powder); 0.07::true_val(terrain_suitability_japan, unk_terrain_suitability_japan).

measured(s3, terrain_suitability_japan, deep_japanese_powder).
measured(s5, terrain_suitability_japan, deep_japanese_powder).

all_consistent(terrain_suitability_japan) :-
    consistent(s3, terrain_suitability_japan),
    (indep(s5), consistent(s5, terrain_suitability_japan) ; \+indep(s5)).

evidence(all_consistent(terrain_suitability_japan)).
query(true_val(terrain_suitability_japan, deep_japanese_powder)).
query(true_val(terrain_suitability_japan, unk_terrain_suitability_japan)).

% @attr riding_style
% @type categorical
% @canonical false
% @original_name riding_style
% @values snowsurf=Snowsurf unk_riding_style=Unknown
% @importance 0.95

0.88::acc(s16, riding_style).

0.85::true_val(riding_style, snowsurf); 0.15::true_val(riding_style, unk_riding_style).

measured(s16, riding_style, snowsurf).

all_consistent(riding_style) :-
    consistent(s16, riding_style).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, snowsurf)).
query(true_val(riding_style, unk_riding_style)).

% @attr design_inspiration
% @type categorical
% @canonical false
% @original_name design inspiration
% @values japanese_mountains_steep_deep=Developed_for_steep_deep_Japanese_mountains unk_design_inspiration=Unknown
% @importance 0.88

0.93::acc(s3, design_inspiration).
0.82::acc(s19, design_inspiration).

0.93::true_val(design_inspiration, japanese_mountains_steep_deep); 0.07::true_val(design_inspiration, unk_design_inspiration).

measured(s3, design_inspiration, japanese_mountains_steep_deep).
measured(s19, design_inspiration, japanese_mountains_steep_deep).

all_consistent(design_inspiration) :-
    consistent(s3, design_inspiration),
    (indep(s19), consistent(s19, design_inspiration) ; \+indep(s19)).

evidence(all_consistent(design_inspiration)).
query(true_val(design_inspiration, japanese_mountains_steep_deep)).
query(true_val(design_inspiration, unk_design_inspiration)).

% @attr terrain_suitability_detailed
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values powder_surf_tree_slash_carve_groomers=Powder_surfing_tree_riding_slashing_carving_groomers unk_terrain_suitability_detailed=Unknown
% @importance 0.95

0.88::acc(s16, terrain_suitability_detailed).

0.85::true_val(terrain_suitability_detailed, powder_surf_tree_slash_carve_groomers); 0.15::true_val(terrain_suitability_detailed, unk_terrain_suitability_detailed).

measured(s16, terrain_suitability_detailed, powder_surf_tree_slash_carve_groomers).

all_consistent(terrain_suitability_detailed) :-
    consistent(s16, terrain_suitability_detailed).

evidence(all_consistent(terrain_suitability_detailed)).
query(true_val(terrain_suitability_detailed, powder_surf_tree_slash_carve_groomers)).
query(true_val(terrain_suitability_detailed, unk_terrain_suitability_detailed)).

% @attr powder_rating_tgr
% @type categorical
% @canonical false
% @original_name powder_rating_tgr
% @values great=Great unk_powder_rating_tgr=Unknown
% @importance 0.95

0.88::acc(s16, powder_rating_tgr).

0.85::true_val(powder_rating_tgr, great); 0.15::true_val(powder_rating_tgr, unk_powder_rating_tgr).

measured(s16, powder_rating_tgr, great).

all_consistent(powder_rating_tgr) :-
    consistent(s16, powder_rating_tgr).

evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, great)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

% @attr base_glide_performance
% @type categorical
% @canonical false
% @original_name base_glide_performance
% @values good=Good unk_base_glide_performance=Unknown
% @importance 0.95

0.88::acc(s16, base_glide_performance).

0.85::true_val(base_glide_performance, good); 0.15::true_val(base_glide_performance, unk_base_glide_performance).

measured(s16, base_glide_performance, good).

all_consistent(base_glide_performance) :-
    consistent(s16, base_glide_performance).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, good)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr carving_rating_tgr
% @type categorical
% @canonical false
% @original_name carving_rating_tgr
% @values great=Great unk_carving_rating_tgr=Unknown
% @importance 0.95

0.88::acc(s16, carving_rating_tgr).

0.85::true_val(carving_rating_tgr, great); 0.15::true_val(carving_rating_tgr, unk_carving_rating_tgr).

measured(s16, carving_rating_tgr, great).

all_consistent(carving_rating_tgr) :-
    consistent(s16, carving_rating_tgr).

evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, great)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

% @attr speed_rating_tgr
% @type categorical
% @canonical false
% @original_name speed_rating_tgr
% @values good=Good unk_speed_rating_tgr=Unknown
% @importance 0.95

0.88::acc(s16, speed_rating_tgr).

0.85::true_val(speed_rating_tgr, good); 0.15::true_val(speed_rating_tgr, unk_speed_rating_tgr).

measured(s16, speed_rating_tgr, good).

all_consistent(speed_rating_tgr) :-
    consistent(s16, speed_rating_tgr).

evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, good)).
query(true_val(speed_rating_tgr, unk_speed_rating_tgr)).

% @attr reviewer_opinion_the_good_ride_uneven_terrain
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values good=Good unk_reviewer_opinion_the_good_ride_uneven_terrain=Unknown
% @importance 0.95

0.88::acc(s16, reviewer_opinion_the_good_ride_uneven_terrain).

0.85::true_val(reviewer_opinion_the_good_ride_uneven_terrain, good); 0.15::true_val(reviewer_opinion_the_good_ride_uneven_terrain, unk_reviewer_opinion_the_good_ride_uneven_terrain).

measured(s16, reviewer_opinion_the_good_ride_uneven_terrain, good).

all_consistent(reviewer_opinion_the_good_ride_uneven_terrain) :-
    consistent(s16, reviewer_opinion_the_good_ride_uneven_terrain).

evidence(all_consistent(reviewer_opinion_the_good_ride_uneven_terrain)).
query(true_val(reviewer_opinion_the_good_ride_uneven_terrain, good)).
query(true_val(reviewer_opinion_the_good_ride_uneven_terrain, unk_reviewer_opinion_the_good_ride_uneven_terrain)).

% @attr switch_riding
% @type categorical
% @canonical false
% @original_name switch_riding
% @values poor=Poor unk_switch_riding=Unknown
% @importance 0.95

0.88::acc(s16, switch_riding).

0.85::true_val(switch_riding, poor); 0.15::true_val(switch_riding, unk_switch_riding).

measured(s16, switch_riding, poor).

all_consistent(switch_riding) :-
    consistent(s16, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, poor)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr jumps_rating_tgr
% @type categorical
% @canonical false
% @original_name jumps_rating_tgr
% @values good=Good unk_jumps_rating_tgr=Unknown
% @importance 0.95

0.88::acc(s16, jumps_rating_tgr).

0.85::true_val(jumps_rating_tgr, good); 0.15::true_val(jumps_rating_tgr, unk_jumps_rating_tgr).

measured(s16, jumps_rating_tgr, good).

all_consistent(jumps_rating_tgr) :-
    consistent(s16, jumps_rating_tgr).

evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, good)).
query(true_val(jumps_rating_tgr, unk_jumps_rating_tgr)).

% @attr jibbing_rating_tgr
% @type categorical
% @canonical false
% @original_name jibbing_rating_tgr
% @values poor=Poor unk_jibbing_rating_tgr=Unknown
% @importance 0.95

0.88::acc(s16, jibbing_rating_tgr).

0.85::true_val(jibbing_rating_tgr, poor); 0.15::true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr).

measured(s16, jibbing_rating_tgr, poor).

all_consistent(jibbing_rating_tgr) :-
    consistent(s16, jibbing_rating_tgr).

evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, poor)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr)).

% @attr pipe_rating_tgr
% @type categorical
% @canonical false
% @original_name pipe_rating_tgr
% @values good=Good unk_pipe_rating_tgr=Unknown
% @importance 0.95

0.88::acc(s16, pipe_rating_tgr).

0.85::true_val(pipe_rating_tgr, good); 0.15::true_val(pipe_rating_tgr, unk_pipe_rating_tgr).

measured(s16, pipe_rating_tgr, good).

all_consistent(pipe_rating_tgr) :-
    consistent(s16, pipe_rating_tgr).

evidence(all_consistent(pipe_rating_tgr)).
query(true_val(pipe_rating_tgr, good)).
query(true_val(pipe_rating_tgr, unk_pipe_rating_tgr)).

% @attr on_snow_feel_tgr
% @type categorical
% @canonical false
% @original_name on_snow_feel_tgr
% @values stable=Stable unk_on_snow_feel_tgr=Unknown
% @importance 0.95

0.88::acc(s16, on_snow_feel_tgr).

0.85::true_val(on_snow_feel_tgr, stable); 0.15::true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr).

measured(s16, on_snow_feel_tgr, stable).

all_consistent(on_snow_feel_tgr) :-
    consistent(s16, on_snow_feel_tgr).

evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, stable)).
query(true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr)).

% @attr turn_initiation_performance
% @type categorical
% @canonical false
% @original_name turn_initiation_performance
% @values fast=Fast unk_turn_initiation_performance=Unknown
% @importance 0.95

0.88::acc(s16, turn_initiation_performance).

0.85::true_val(turn_initiation_performance, fast); 0.15::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s16, turn_initiation_performance, fast).

all_consistent(turn_initiation_performance) :-
    consistent(s16, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, fast)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr reviewer_opinion_the_good_ride_buttering
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values moderate=Moderate unk_reviewer_opinion_the_good_ride_buttering=Unknown
% @importance 0.95

0.88::acc(s16, reviewer_opinion_the_good_ride_buttering).

0.85::true_val(reviewer_opinion_the_good_ride_buttering, moderate); 0.15::true_val(reviewer_opinion_the_good_ride_buttering, unk_reviewer_opinion_the_good_ride_buttering).

measured(s16, reviewer_opinion_the_good_ride_buttering, moderate).

all_consistent(reviewer_opinion_the_good_ride_buttering) :-
    consistent(s16, reviewer_opinion_the_good_ride_buttering).

evidence(all_consistent(reviewer_opinion_the_good_ride_buttering)).
query(true_val(reviewer_opinion_the_good_ride_buttering, moderate)).
query(true_val(reviewer_opinion_the_good_ride_buttering, unk_reviewer_opinion_the_good_ride_buttering)).

% @attr reviewer_opinion_the_good_ride_chatter
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values moderate=Moderate unk_reviewer_opinion_the_good_ride_chatter=Unknown
% @importance 0.95

0.88::acc(s16, reviewer_opinion_the_good_ride_chatter).

0.85::true_val(reviewer_opinion_the_good_ride_chatter, moderate); 0.15::true_val(reviewer_opinion_the_good_ride_chatter, unk_reviewer_opinion_the_good_ride_chatter).

measured(s16, reviewer_opinion_the_good_ride_chatter, moderate).

all_consistent(reviewer_opinion_the_good_ride_chatter) :-
    consistent(s16, reviewer_opinion_the_good_ride_chatter).

evidence(all_consistent(reviewer_opinion_the_good_ride_chatter)).
query(true_val(reviewer_opinion_the_good_ride_chatter, moderate)).
query(true_val(reviewer_opinion_the_good_ride_chatter, unk_reviewer_opinion_the_good_ride_chatter)).

% @attr edge_hold
% @type categorical
% @canonical false
% @original_name edge_hold
% @values medium_snow_competent=Medium_snow_competent_firm_not_amazing unk_edge_hold=Unknown
% @importance 0.95

0.88::acc(s16, edge_hold).

0.85::true_val(edge_hold, medium_snow_competent); 0.15::true_val(edge_hold, unk_edge_hold).

measured(s16, edge_hold, medium_snow_competent).

all_consistent(edge_hold) :-
    consistent(s16, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, medium_snow_competent)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values fun_to_turn_tight_radius=Really_fun_to_turn_tighter_radius_than_expected unk_positive_aspect=Unknown
% @importance 0.95

0.88::acc(s16, positive_aspect).

0.85::true_val(positive_aspect, fun_to_turn_tight_radius); 0.15::true_val(positive_aspect, unk_positive_aspect).

measured(s16, positive_aspect, fun_to_turn_tight_radius).

all_consistent(positive_aspect) :-
    consistent(s16, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, fun_to_turn_tight_radius)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr positive_aspect_pop
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values solid_pop_no_chatter=Solid_pop_without_chatter unk_positive_aspect_pop=Unknown
% @importance 0.95

0.88::acc(s16, positive_aspect_pop).

0.85::true_val(positive_aspect_pop, solid_pop_no_chatter); 0.15::true_val(positive_aspect_pop, unk_positive_aspect_pop).

measured(s16, positive_aspect_pop, solid_pop_no_chatter).

all_consistent(positive_aspect_pop) :-
    consistent(s16, positive_aspect_pop).

evidence(all_consistent(positive_aspect_pop)).
query(true_val(positive_aspect_pop, solid_pop_no_chatter)).
query(true_val(positive_aspect_pop, unk_positive_aspect_pop)).

% @attr positive_aspect_channel
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values channel_stance_experimentation=Single_channel_extensive_stance_experimentation unk_positive_aspect_channel=Unknown
% @importance 0.95

0.88::acc(s16, positive_aspect_channel).

0.85::true_val(positive_aspect_channel, channel_stance_experimentation); 0.15::true_val(positive_aspect_channel, unk_positive_aspect_channel).

measured(s16, positive_aspect_channel, channel_stance_experimentation).

all_consistent(positive_aspect_channel) :-
    consistent(s16, positive_aspect_channel).

evidence(all_consistent(positive_aspect_channel)).
query(true_val(positive_aspect_channel, channel_stance_experimentation)).
query(true_val(positive_aspect_channel, unk_positive_aspect_channel)).

% @attr positive_aspect_setback
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values setback_no_backfoot_weight=Really_set_back_no_back_foot_weight_needed unk_positive_aspect_setback=Unknown
% @importance 0.95

0.88::acc(s16, positive_aspect_setback).

0.85::true_val(positive_aspect_setback, setback_no_backfoot_weight); 0.15::true_val(positive_aspect_setback, unk_positive_aspect_setback).

measured(s16, positive_aspect_setback, setback_no_backfoot_weight).

all_consistent(positive_aspect_setback) :-
    consistent(s16, positive_aspect_setback).

evidence(all_consistent(positive_aspect_setback)).
query(true_val(positive_aspect_setback, setback_no_backfoot_weight)).
query(true_val(positive_aspect_setback, unk_positive_aspect_setback)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values channel_hard_to_wax=Channel_base_hard_to_wax_and_scrape unk_negative_aspect=Unknown
% @importance 0.95

0.88::acc(s16, negative_aspect).

0.85::true_val(negative_aspect, channel_hard_to_wax); 0.15::true_val(negative_aspect, unk_negative_aspect).

measured(s16, negative_aspect, channel_hard_to_wax).

all_consistent(negative_aspect) :-
    consistent(s16, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, channel_hard_to_wax)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_edge_hold
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values better_boards_for_ice=Better_boards_for_hard_icy_snow unk_negative_aspect_edge_hold=Unknown
% @importance 0.95

0.88::acc(s16, negative_aspect_edge_hold).

0.85::true_val(negative_aspect_edge_hold, better_boards_for_ice); 0.15::true_val(negative_aspect_edge_hold, unk_negative_aspect_edge_hold).

measured(s16, negative_aspect_edge_hold, better_boards_for_ice).

all_consistent(negative_aspect_edge_hold) :-
    consistent(s16, negative_aspect_edge_hold).

evidence(all_consistent(negative_aspect_edge_hold)).
query(true_val(negative_aspect_edge_hold, better_boards_for_ice)).
query(true_val(negative_aspect_edge_hold, unk_negative_aspect_edge_hold)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values highlight_snowsurf_fun_springy=Highlight_of_Burton_testing_snowsurf_fun_springy unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.95

0.90::acc(s16, reviewer_opinion_the_good_ride).

0.88::true_val(reviewer_opinion_the_good_ride, highlight_snowsurf_fun_springy); 0.12::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s16, reviewer_opinion_the_good_ride, highlight_snowsurf_fun_springy).

all_consistent(reviewer_opinion_the_good_ride) :-
    consistent(s16, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, highlight_snowsurf_fun_springy)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr award
% @type categorical
% @canonical false
% @original_name award
% @values platinum_pick_2026=Snowboard_Magazine_Platinum_Pick_2026 unk_award=Unknown
% @importance 0.83

0.87::acc(s4, award).
0.85::acc(s15, award).

0.92::true_val(award, platinum_pick_2026); 0.08::true_val(award, unk_award).

measured(s4, award, platinum_pick_2026).
measured(s15, award, platinum_pick_2026).

all_consistent(award) :-
    consistent(s4, award),
    consistent(s15, award).

evidence(all_consistent(award)).
query(true_val(award, platinum_pick_2026)).
query(true_val(award, unk_award)).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v899_95=899.95 v849_95=849.95
% @importance 0.93

0.82::acc(s15, price_usd_msrp).
0.88::acc(s16, price_usd_msrp).
0.85::acc(s21, price_usd_msrp).

0.30::true_val(price_usd_msrp, v849_95); 0.70::true_val(price_usd_msrp, v899_95).

measured(s15, price_usd_msrp, v849_95).
measured(s16, price_usd_msrp, v899_95).
measured(s21, price_usd_msrp, v899_95).

all_consistent(price_usd_msrp) :-
    consistent(s15, price_usd_msrp),
    consistent(s16, price_usd_msrp),
    consistent(s21, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v849_95)).
query(true_val(price_usd_msrp, v899_95)).

% @attr price_usd_tactics
% @type numeric
% @unit USD
% @canonical false
% @original_name price USD (Tactics sale)
% @values v719_95=719.95 unk_price_usd_tactics=Unknown
% @importance 0.95

0.88::acc(s16, price_usd_tactics).

0.85::true_val(price_usd_tactics, v719_95); 0.15::true_val(price_usd_tactics, unk_price_usd_tactics).

measured(s16, price_usd_tactics, v719_95).

all_consistent(price_usd_tactics) :-
    consistent(s16, price_usd_tactics).

evidence(all_consistent(price_usd_tactics)).
query(true_val(price_usd_tactics, v719_95)).
query(true_val(price_usd_tactics, unk_price_usd_tactics)).

% @attr price_usd_gravity_coalition
% @type numeric
% @unit USD
% @canonical false
% @original_name price USD (Gravity Coalition discounted)
% @values v699_97=699.97 unk_price_usd_gravity_coalition=Unknown
% @importance 0.95

0.88::acc(s16, price_usd_gravity_coalition).

0.85::true_val(price_usd_gravity_coalition, v699_97); 0.15::true_val(price_usd_gravity_coalition, unk_price_usd_gravity_coalition).

measured(s16, price_usd_gravity_coalition, v699_97).

all_consistent(price_usd_gravity_coalition) :-
    consistent(s16, price_usd_gravity_coalition).

evidence(all_consistent(price_usd_gravity_coalition)).
query(true_val(price_usd_gravity_coalition, v699_97)).
query(true_val(price_usd_gravity_coalition, unk_price_usd_gravity_coalition)).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical false
% @original_name price_aud_merchant
% @values v1199_99=1199.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.95::acc(s_merchant, price_aud_merchant).

0.95::true_val(price_aud_merchant, v1199_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s_merchant, price_aud_merchant, v1199_99).

all_consistent(price_aud_merchant) :-
    (indep(s_merchant), consistent(s_merchant, price_aud_merchant) ; \+indep(s_merchant)).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v1199_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_cad_pacific_boarder
% @type numeric
% @unit CAD
% @canonical false
% @original_name price CAD (Pacific Boarder)
% @values v1099_99=1099.99 unk_price_cad_pacific_boarder=Unknown
% @importance 0.85

0.82::acc(s8, price_cad_pacific_boarder).

0.82::true_val(price_cad_pacific_boarder, v1099_99); 0.18::true_val(price_cad_pacific_boarder, unk_price_cad_pacific_boarder).

measured(s8, price_cad_pacific_boarder, v1099_99).

all_consistent(price_cad_pacific_boarder) :-
    (indep(s8), consistent(s8, price_cad_pacific_boarder) ; \+indep(s8)).

evidence(all_consistent(price_cad_pacific_boarder)).
query(true_val(price_cad_pacific_boarder, v1099_99)).
query(true_val(price_cad_pacific_boarder, unk_price_cad_pacific_boarder)).

% @attr price_cad_prfo
% @type numeric
% @unit CAD
% @canonical false
% @original_name price_cad_prfo
% @values v1099_99=1099.99 unk_price_cad_prfo=Unknown
% @importance 0.95

0.88::acc(s16, price_cad_prfo).

0.85::true_val(price_cad_prfo, v1099_99); 0.15::true_val(price_cad_prfo, unk_price_cad_prfo).

measured(s16, price_cad_prfo, v1099_99).

all_consistent(price_cad_prfo) :-
    consistent(s16, price_cad_prfo).

evidence(all_consistent(price_cad_prfo)).
query(true_val(price_cad_prfo, v1099_99)).
query(true_val(price_cad_prfo, unk_price_cad_prfo)).

% @attr price_eur_blue_tomato
% @type numeric
% @unit EUR
% @canonical false
% @original_name price_eur_blue_tomato
% @values v879_95=879.95 unk_price_eur_blue_tomato=Unknown
% @importance 0.95

0.88::acc(s16, price_eur_blue_tomato).

0.85::true_val(price_eur_blue_tomato, v879_95); 0.15::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).

measured(s16, price_eur_blue_tomato, v879_95).

all_consistent(price_eur_blue_tomato) :-
    consistent(s16, price_eur_blue_tomato).

evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v879_95)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

% @attr price_eur_snowcountry
% @type numeric
% @unit EUR
% @canonical false
% @original_name price EUR (SnowCountry)
% @values v799_00=799.00 unk_price_eur_snowcountry=Unknown
% @importance 0.95

0.88::acc(s16, price_eur_snowcountry).

0.85::true_val(price_eur_snowcountry, v799_00); 0.15::true_val(price_eur_snowcountry, unk_price_eur_snowcountry).

measured(s16, price_eur_snowcountry, v799_00).

all_consistent(price_eur_snowcountry) :-
    consistent(s16, price_eur_snowcountry).

evidence(all_consistent(price_eur_snowcountry)).
query(true_val(price_eur_snowcountry, v799_00)).
query(true_val(price_eur_snowcountry, unk_price_eur_snowcountry)).

% @attr price_gbp_blue_tomato_uk
% @type numeric
% @unit GBP
% @canonical false
% @original_name price_gbp_blue_tomato_uk
% @values v785_00=785.00 unk_price_gbp_blue_tomato_uk=Unknown
% @importance 0.95

0.88::acc(s16, price_gbp_blue_tomato_uk).

0.85::true_val(price_gbp_blue_tomato_uk, v785_00); 0.15::true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk).

measured(s16, price_gbp_blue_tomato_uk, v785_00).

all_consistent(price_gbp_blue_tomato_uk) :-
    consistent(s16, price_gbp_blue_tomato_uk).

evidence(all_consistent(price_gbp_blue_tomato_uk)).
query(true_val(price_gbp_blue_tomato_uk, v785_00)).
query(true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk)).

% @attr price_sek_blue_tomato
% @type numeric
% @unit SEK
% @canonical false
% @original_name price SEK (Blue Tomato Sweden)
% @values v9999_00=9999.00 unk_price_sek_blue_tomato=Unknown
% @importance 0.95

0.88::acc(s16, price_sek_blue_tomato).

0.85::true_val(price_sek_blue_tomato, v9999_00); 0.15::true_val(price_sek_blue_tomato, unk_price_sek_blue_tomato).

measured(s16, price_sek_blue_tomato, v9999_00).

all_consistent(price_sek_blue_tomato) :-
    consistent(s16, price_sek_blue_tomato).

evidence(all_consistent(price_sek_blue_tomato)).
query(true_val(price_sek_blue_tomato, v9999_00)).
query(true_val(price_sek_blue_tomato, unk_price_sek_blue_tomato)).

% @attr price_dkk_blue_tomato
% @type numeric
% @unit DKK
% @canonical false
% @original_name price DKK (Blue Tomato Denmark)
% @values v6599_00=6599.00 unk_price_dkk_blue_tomato=Unknown
% @importance 0.95

0.88::acc(s16, price_dkk_blue_tomato).

0.85::true_val(price_dkk_blue_tomato, v6599_00); 0.15::true_val(price_dkk_blue_tomato, unk_price_dkk_blue_tomato).

measured(s16, price_dkk_blue_tomato, v6599_00).

all_consistent(price_dkk_blue_tomato) :-
    consistent(s16, price_dkk_blue_tomato).

evidence(all_consistent(price_dkk_blue_tomato)).
query(true_val(price_dkk_blue_tomato, v6599_00)).
query(true_val(price_dkk_blue_tomato, unk_price_dkk_blue_tomato)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values three_year=3_year_warranty_from_purchase_date unk_warranty=Unknown
% @importance 0.83

0.88::acc(s22, warranty).
0.95::acc(s23, warranty).

0.95::true_val(warranty, three_year); 0.05::true_val(warranty, unk_warranty).

measured(s22, warranty, three_year).
measured(s23, warranty, three_year).

all_consistent(warranty) :-
    (indep(s22), consistent(s22, warranty) ; \+indep(s22)),
    consistent(s23, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, three_year)).
query(true_val(warranty, unk_warranty)).

% @attr warranty_terms
% @type categorical
% @canonical false
% @original_name warranty
% @values mfr_defects_original_purchaser=Covers_manufacturer_defects_original_purchaser_only unk_warranty_terms=Unknown
% @importance 0.80

0.93::acc(s23, warranty_terms).

0.93::true_val(warranty_terms, mfr_defects_original_purchaser); 0.07::true_val(warranty_terms, unk_warranty_terms).

measured(s23, warranty_terms, mfr_defects_original_purchaser).

all_consistent(warranty_terms) :-
    consistent(s23, warranty_terms).

evidence(all_consistent(warranty_terms)).
query(true_val(warranty_terms, mfr_defects_original_purchaser)).
query(true_val(warranty_terms, unk_warranty_terms)).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values austria_keil_uttendorf=Austria_Keil_facility_Uttendorf unk_manufacturing_location_current=Unknown
% @importance 0.63

0.88::acc(s16, manufacturing_location_current).
0.78::acc(s24, manufacturing_location_current).
0.70::acc(s25, manufacturing_location_current).

0.90::true_val(manufacturing_location_current, austria_keil_uttendorf); 0.10::true_val(manufacturing_location_current, unk_manufacturing_location_current).

measured(s16, manufacturing_location_current, austria_keil_uttendorf).
measured(s24, manufacturing_location_current, austria_keil_uttendorf).
measured(s25, manufacturing_location_current, austria_keil_uttendorf).

all_consistent(manufacturing_location_current) :-
    consistent(s16, manufacturing_location_current),
    consistent(s24, manufacturing_location_current),
    consistent(s25, manufacturing_location_current).

evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, austria_keil_uttendorf)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

% @attr prototyping_location
% @type categorical
% @canonical false
% @original_name prototyping location
% @values burlington_vt=Burlington_Vermont_USA unk_prototyping_location=Unknown
% @importance 0.50

0.70::acc(s25, prototyping_location).

0.65::true_val(prototyping_location, burlington_vt); 0.35::true_val(prototyping_location, unk_prototyping_location).

measured(s25, prototyping_location, burlington_vt).

all_consistent(prototyping_location) :-
    consistent(s25, prototyping_location).

evidence(all_consistent(prototyping_location)).
query(true_val(prototyping_location, burlington_vt)).
query(true_val(prototyping_location, unk_prototyping_location)).

% @attr headquarters
% @type categorical
% @canonical false
% @original_name headquarters
% @values burlington_vt=Burlington_Vermont_USA unk_headquarters=Unknown
% @importance 0.60

0.80::acc(s26, headquarters).

0.78::true_val(headquarters, burlington_vt); 0.22::true_val(headquarters, unk_headquarters).

measured(s26, headquarters, burlington_vt).

all_consistent(headquarters) :-
    consistent(s26, headquarters).

evidence(all_consistent(headquarters)).
query(true_val(headquarters, burlington_vt)).
query(true_val(headquarters, unk_headquarters)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values available_899_95=Burton_com_US_Available_899_95 unk_availability_status=Unknown
% @importance 0.95

0.88::acc(s21, availability_status).

0.88::true_val(availability_status, available_899_95); 0.12::true_val(availability_status, unk_availability_status).

measured(s21, availability_status, available_899_95).

all_consistent(availability_status) :-
    consistent(s21, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, available_899_95)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status
% @values in_stock_899_95=evo_In_stock_899_95_free_shipping unk_availability_status_evo=Unknown
% @importance 0.95

0.88::acc(s21, availability_status_evo).
0.85::acc(s16, availability_status_evo).

0.92::true_val(availability_status_evo, in_stock_899_95); 0.08::true_val(availability_status_evo, unk_availability_status_evo).

measured(s21, availability_status_evo, in_stock_899_95).
measured(s16, availability_status_evo, in_stock_899_95).

all_consistent(availability_status_evo) :-
    consistent(s21, availability_status_evo),
    consistent(s16, availability_status_evo).

evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, in_stock_899_95)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

% @attr availability_status_backcountry
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_899_95=Backcountry_Available_899_95 unk_availability_status_backcountry=Unknown
% @importance 0.95

0.85::acc(s16, availability_status_backcountry).

0.85::true_val(availability_status_backcountry, available_899_95_bc); 0.15::true_val(availability_status_backcountry, unk_availability_status_backcountry).

measured(s16, availability_status_backcountry, available_899_95_bc).

all_consistent(availability_status_backcountry) :-
    consistent(s16, availability_status_backcountry).

evidence(all_consistent(availability_status_backcountry)).
query(true_val(availability_status_backcountry, available_899_95_bc)).
query(true_val(availability_status_backcountry, unk_availability_status_backcountry)).

% @attr availability_status_tactics
% @type categorical
% @canonical false
% @original_name availability_status
% @values in_stock_899_95_sale=Tactics_In_stock_899_95_sale_719_95 unk_availability_status_tactics=Unknown
% @importance 0.90

0.87::acc(s7, availability_status_tactics).
0.85::acc(s16, availability_status_tactics).

0.90::true_val(availability_status_tactics, in_stock_899_95_sale); 0.10::true_val(availability_status_tactics, unk_availability_status_tactics).

measured(s7, availability_status_tactics, in_stock_899_95_sale).
measured(s16, availability_status_tactics, in_stock_899_95_sale).

all_consistent(availability_status_tactics) :-
    (indep(s7), consistent(s7, availability_status_tactics) ; \+indep(s7)),
    consistent(s16, availability_status_tactics).

evidence(all_consistent(availability_status_tactics)).
query(true_val(availability_status_tactics, in_stock_899_95_sale)).
query(true_val(availability_status_tactics, unk_availability_status_tactics)).

% @attr availability_status_pacific_boarder
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_1099_99_cad=Pacific_Boarder_Available_152_156_160_164_1099_99_CAD unk_availability_status_pacific_boarder=Unknown
% @importance 0.85

0.82::acc(s8, availability_status_pacific_boarder).

0.82::true_val(availability_status_pacific_boarder, available_1099_99_cad); 0.18::true_val(availability_status_pacific_boarder, unk_availability_status_pacific_boarder).

measured(s8, availability_status_pacific_boarder, available_1099_99_cad).

all_consistent(availability_status_pacific_boarder) :-
    (indep(s8), consistent(s8, availability_status_pacific_boarder) ; \+indep(s8)).

evidence(all_consistent(availability_status_pacific_boarder)).
query(true_val(availability_status_pacific_boarder, available_1099_99_cad)).
query(true_val(availability_status_pacific_boarder, unk_availability_status_pacific_boarder)).

% @attr availability_status_darkside
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_ships_48h=Darkside_Available_ships_48h unk_availability_status_darkside=Unknown
% @importance 0.85

0.80::acc(s5, availability_status_darkside).
0.85::acc(s22, availability_status_darkside).

0.88::true_val(availability_status_darkside, available_ships_48h); 0.12::true_val(availability_status_darkside, unk_availability_status_darkside).

measured(s5, availability_status_darkside, available_ships_48h).
measured(s22, availability_status_darkside, available_ships_48h).

all_consistent(availability_status_darkside) :-
    (indep(s5), consistent(s5, availability_status_darkside) ; \+indep(s5)),
    (indep(s22), consistent(s22, availability_status_darkside) ; \+indep(s22)).

evidence(all_consistent(availability_status_darkside)).
query(true_val(availability_status_darkside, available_ships_48h)).
query(true_val(availability_status_darkside, unk_availability_status_darkside)).

% @attr availability_status_rudeboys
% @type categorical
% @canonical false
% @original_name availability_status
% @values available=Rudeboys_Available unk_availability_status_rudeboys=Unknown
% @importance 0.50

0.78::acc(s10, availability_status_rudeboys).

0.78::true_val(availability_status_rudeboys, available_rb); 0.22::true_val(availability_status_rudeboys, unk_availability_status_rudeboys).

measured(s10, availability_status_rudeboys, available_rb).

all_consistent(availability_status_rudeboys) :-
    (indep(s10), consistent(s10, availability_status_rudeboys) ; \+indep(s10)).

evidence(all_consistent(availability_status_rudeboys)).
query(true_val(availability_status_rudeboys, available_rb)).
query(true_val(availability_status_rudeboys, unk_availability_status_rudeboys)).

% @attr availability_status_balmoral
% @type categorical
% @canonical false
% @original_name availability_status
% @values available=Balmoral_Available unk_availability_status_balmoral=Unknown
% @importance 0.80

0.78::acc(s20, availability_status_balmoral).

0.78::true_val(availability_status_balmoral, available_bal); 0.22::true_val(availability_status_balmoral, unk_availability_status_balmoral).

measured(s20, availability_status_balmoral, available_bal).

all_consistent(availability_status_balmoral) :-
    (indep(s20), consistent(s20, availability_status_balmoral) ; \+indep(s20)).

evidence(all_consistent(availability_status_balmoral)).
query(true_val(availability_status_balmoral, available_bal)).
query(true_val(availability_status_balmoral, unk_availability_status_balmoral)).

% @attr availability_status_melbourne
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_au_only=Melbourne_Snowboard_Available_Australia_only unk_availability_status_melbourne=Unknown
% @importance 0.85

0.82::acc(s19, availability_status_melbourne).

0.82::true_val(availability_status_melbourne, available_au_only); 0.18::true_val(availability_status_melbourne, unk_availability_status_melbourne).

measured(s19, availability_status_melbourne, available_au_only).

all_consistent(availability_status_melbourne) :-
    (indep(s19), consistent(s19, availability_status_melbourne) ; \+indep(s19)).

evidence(all_consistent(availability_status_melbourne)).
query(true_val(availability_status_melbourne, available_au_only)).
query(true_val(availability_status_melbourne, unk_availability_status_melbourne)).

% @attr availability_status_aspen
% @type categorical
% @canonical false
% @original_name availability_status
% @values backordered_152_899_95=Aspen_899_95_152cm_backordered unk_availability_status_aspen=Unknown
% @importance 0.75

0.78::acc(s27, availability_status_aspen).

0.75::true_val(availability_status_aspen, backordered_152_899_95); 0.25::true_val(availability_status_aspen, unk_availability_status_aspen).

measured(s27, availability_status_aspen, backordered_152_899_95).

all_consistent(availability_status_aspen) :-
    (indep(s27), consistent(s27, availability_status_aspen) ; \+indep(s27)).

evidence(all_consistent(availability_status_aspen)).
query(true_val(availability_status_aspen, backordered_152_899_95)).
query(true_val(availability_status_aspen, unk_availability_status_aspen)).

% @attr availability_status_gravity_coalition
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_699_97=Gravity_Coalition_699_97_discounted unk_availability_status_gravity_coalition=Unknown
% @importance 0.95

0.85::acc(s16, availability_status_gravity_coalition).

0.85::true_val(availability_status_gravity_coalition, available_699_97); 0.15::true_val(availability_status_gravity_coalition, unk_availability_status_gravity_coalition).

measured(s16, availability_status_gravity_coalition, available_699_97).

all_consistent(availability_status_gravity_coalition) :-
    consistent(s16, availability_status_gravity_coalition).

evidence(all_consistent(availability_status_gravity_coalition)).
query(true_val(availability_status_gravity_coalition, available_699_97)).
query(true_val(availability_status_gravity_coalition, unk_availability_status_gravity_coalition)).

% @attr availability_status_blue_tomato
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_multi_eu=Blue_Tomato_multi_EU_markets_available unk_availability_status_blue_tomato=Unknown
% @importance 0.95

0.85::acc(s16, availability_status_blue_tomato).

0.85::true_val(availability_status_blue_tomato, available_multi_eu); 0.15::true_val(availability_status_blue_tomato, unk_availability_status_blue_tomato).

measured(s16, availability_status_blue_tomato, available_multi_eu).

all_consistent(availability_status_blue_tomato) :-
    consistent(s16, availability_status_blue_tomato).

evidence(all_consistent(availability_status_blue_tomato)).
query(true_val(availability_status_blue_tomato, available_multi_eu)).
query(true_val(availability_status_blue_tomato, unk_availability_status_blue_tomato)).

% @attr availability_status_snowcountry
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_799_eur=SnowCountry_799_EUR unk_availability_status_snowcountry=Unknown
% @importance 0.95

0.85::acc(s16, availability_status_snowcountry).

0.85::true_val(availability_status_snowcountry, available_799_eur); 0.15::true_val(availability_status_snowcountry, unk_availability_status_snowcountry).

measured(s16, availability_status_snowcountry, available_799_eur).

all_consistent(availability_status_snowcountry) :-
    consistent(s16, availability_status_snowcountry).

evidence(all_consistent(availability_status_snowcountry)).
query(true_val(availability_status_snowcountry, available_799_eur)).
query(true_val(availability_status_snowcountry, unk_availability_status_snowcountry)).

% @attr availability_status_prfo
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_1099_99_cad=PRFO_1099_99_CAD unk_availability_status_prfo=Unknown
% @importance 0.95

0.85::acc(s16, availability_status_prfo).

0.85::true_val(availability_status_prfo, available_1099_99_cad_prfo); 0.15::true_val(availability_status_prfo, unk_availability_status_prfo).

measured(s16, availability_status_prfo, available_1099_99_cad_prfo).

all_consistent(availability_status_prfo) :-
    consistent(s16, availability_status_prfo).

evidence(all_consistent(availability_status_prfo)).
query(true_val(availability_status_prfo, available_1099_99_cad_prfo)).
query(true_val(availability_status_prfo, unk_availability_status_prfo)).

% @attr availability_status_burton_canada
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_1099_99_cad=Burton_Canada_1099_99_CAD unk_availability_status_burton_canada=Unknown
% @importance 0.95

0.85::acc(s16, availability_status_burton_canada).

0.85::true_val(availability_status_burton_canada, available_1099_99_cad_bc); 0.15::true_val(availability_status_burton_canada, unk_availability_status_burton_canada).

measured(s16, availability_status_burton_canada, available_1099_99_cad_bc).

all_consistent(availability_status_burton_canada) :-
    consistent(s16, availability_status_burton_canada).

evidence(all_consistent(availability_status_burton_canada)).
query(true_val(availability_status_burton_canada, available_1099_99_cad_bc)).
query(true_val(availability_status_burton_canada, unk_availability_status_burton_canada)).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_tgr_rec=Blauer_Board_Shop_Available_TGR_recommended unk_availability_status_blauer=Unknown
% @importance 0.95

0.85::acc(s16, availability_status_blauer).

0.85::true_val(availability_status_blauer, available_tgr_rec); 0.15::true_val(availability_status_blauer, unk_availability_status_blauer).

measured(s16, availability_status_blauer, available_tgr_rec).

all_consistent(availability_status_blauer) :-
    consistent(s16, availability_status_blauer).

evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, available_tgr_rec)).
query(true_val(availability_status_blauer, unk_availability_status_blauer)).

% @attr brand_reputation
% @type categorical
% @canonical false
% @original_name brand reputation
% @values largest_established_40pct_market=Worlds_largest_snowboard_brand_40_45pct_market unk_brand_reputation=Unknown
% @importance 0.60

0.78::acc(s26, brand_reputation).

0.75::true_val(brand_reputation, largest_established_40pct_market); 0.25::true_val(brand_reputation, unk_brand_reputation).

measured(s26, brand_reputation, largest_established_40pct_market).

all_consistent(brand_reputation) :-
    consistent(s26, brand_reputation).

evidence(all_consistent(brand_reputation)).
query(true_val(brand_reputation, largest_established_40pct_market)).
query(true_val(brand_reputation, unk_brand_reputation)).

% @attr brand_heritage
% @type categorical
% @canonical false
% @original_name brand heritage
% @values pioneer_1977_innsbruck_1985=Pioneer_of_snowboarding_EU_offices_1985_Innsbruck unk_brand_heritage=Unknown
% @importance 0.60

0.78::acc(s26, brand_heritage).

0.75::true_val(brand_heritage, pioneer_1977_innsbruck_1985); 0.25::true_val(brand_heritage, unk_brand_heritage).

measured(s26, brand_heritage, pioneer_1977_innsbruck_1985).

all_consistent(brand_heritage) :-
    consistent(s26, brand_heritage).

evidence(all_consistent(brand_heritage)).
query(true_val(brand_heritage, pioneer_1977_innsbruck_1985)).
query(true_val(brand_heritage, unk_brand_heritage)).

% @attr sustainability_certification_bcorp
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values b_corporation=Certified_B_Corporation unk_sustainability_certification_bcorp=Unknown
% @importance 1.00

0.93::acc(s1, sustainability_certification_bcorp).

0.93::true_val(sustainability_certification_bcorp, b_corporation); 0.07::true_val(sustainability_certification_bcorp, unk_sustainability_certification_bcorp).

measured(s1, sustainability_certification_bcorp, b_corporation).

all_consistent(sustainability_certification_bcorp) :-
    consistent(s1, sustainability_certification_bcorp).

evidence(all_consistent(sustainability_certification_bcorp)).
query(true_val(sustainability_certification_bcorp, b_corporation)).
query(true_val(sustainability_certification_bcorp, unk_sustainability_certification_bcorp)).

% @attr reviewer_opinion_the_good_ride_construction
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values great_construction_semi_durable=Great_construction_semi_durable_topsheet unk_reviewer_opinion_the_good_ride_construction=Unknown
% @importance 0.95

0.88::acc(s16, reviewer_opinion_the_good_ride_construction).

0.85::true_val(reviewer_opinion_the_good_ride_construction, great_construction_semi_durable); 0.15::true_val(reviewer_opinion_the_good_ride_construction, unk_reviewer_opinion_the_good_ride_construction).

measured(s16, reviewer_opinion_the_good_ride_construction, great_construction_semi_durable).

all_consistent(reviewer_opinion_the_good_ride_construction) :-
    consistent(s16, reviewer_opinion_the_good_ride_construction).

evidence(all_consistent(reviewer_opinion_the_good_ride_construction)).
query(true_val(reviewer_opinion_the_good_ride_construction, great_construction_semi_durable)).
query(true_val(reviewer_opinion_the_good_ride_construction, unk_reviewer_opinion_the_good_ride_construction)).

% @attr reviewer_opinion_the_good_ride_weight
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values light_side_of_middle=Not_heavy_or_light_light_side_of_middle unk_reviewer_opinion_the_good_ride_weight=Unknown
% @importance 0.95

0.88::acc(s16, reviewer_opinion_the_good_ride_weight).

0.85::true_val(reviewer_opinion_the_good_ride_weight, light_side_of_middle); 0.15::true_val(reviewer_opinion_the_good_ride_weight, unk_reviewer_opinion_the_good_ride_weight).

measured(s16, reviewer_opinion_the_good_ride_weight, light_side_of_middle).

all_consistent(reviewer_opinion_the_good_ride_weight) :-
    consistent(s16, reviewer_opinion_the_good_ride_weight).

evidence(all_consistent(reviewer_opinion_the_good_ride_weight)).
query(true_val(reviewer_opinion_the_good_ride_weight, light_side_of_middle)).
query(true_val(reviewer_opinion_the_good_ride_weight, unk_reviewer_opinion_the_good_ride_weight)).

% @attr recommended_boot_size_152
% @type categorical
% @unit US
% @canonical false
% @original_name recommended boot size 152cm
% @values us7_8=US_7_8 unk_recommended_boot_size_152=Unknown
% @importance 0.95

0.85::acc(s16, recommended_boot_size_152).

0.82::true_val(recommended_boot_size_152, us7_8); 0.18::true_val(recommended_boot_size_152, unk_recommended_boot_size_152).

measured(s16, recommended_boot_size_152, us7_8).

all_consistent(recommended_boot_size_152) :-
    consistent(s16, recommended_boot_size_152).

evidence(all_consistent(recommended_boot_size_152)).
query(true_val(recommended_boot_size_152, us7_8)).
query(true_val(recommended_boot_size_152, unk_recommended_boot_size_152)).

% @attr recommended_boot_size_156
% @type categorical
% @unit US
% @canonical false
% @original_name recommended boot size 156cm
% @values us8_9=US_8_9 unk_recommended_boot_size_156=Unknown
% @importance 0.95

0.85::acc(s16, recommended_boot_size_156).

0.82::true_val(recommended_boot_size_156, us8_9); 0.18::true_val(recommended_boot_size_156, unk_recommended_boot_size_156).

measured(s16, recommended_boot_size_156, us8_9).

all_consistent(recommended_boot_size_156) :-
    consistent(s16, recommended_boot_size_156).

evidence(all_consistent(recommended_boot_size_156)).
query(true_val(recommended_boot_size_156, us8_9)).
query(true_val(recommended_boot_size_156, unk_recommended_boot_size_156)).

% @attr recommended_boot_size_160
% @type categorical
% @unit US
% @canonical false
% @original_name recommended boot size 160cm
% @values us9_10=US_9_10 unk_recommended_boot_size_160=Unknown
% @importance 0.95

0.85::acc(s16, recommended_boot_size_160).

0.82::true_val(recommended_boot_size_160, us9_10); 0.18::true_val(recommended_boot_size_160, unk_recommended_boot_size_160).

measured(s16, recommended_boot_size_160, us9_10).

all_consistent(recommended_boot_size_160) :-
    consistent(s16, recommended_boot_size_160).

evidence(all_consistent(recommended_boot_size_160)).
query(true_val(recommended_boot_size_160, us9_10)).
query(true_val(recommended_boot_size_160, unk_recommended_boot_size_160)).

% @attr recommended_boot_size_164
% @type categorical
% @unit US
% @canonical false
% @original_name recommended boot size 164cm
% @values us10_11=US_10_11 unk_recommended_boot_size_164=Unknown
% @importance 0.95

0.85::acc(s16, recommended_boot_size_164).

0.82::true_val(recommended_boot_size_164, us10_11); 0.18::true_val(recommended_boot_size_164, unk_recommended_boot_size_164).

measured(s16, recommended_boot_size_164, us10_11).

all_consistent(recommended_boot_size_164) :-
    consistent(s16, recommended_boot_size_164).

evidence(all_consistent(recommended_boot_size_164)).
query(true_val(recommended_boot_size_164, us10_11)).
query(true_val(recommended_boot_size_164, unk_recommended_boot_size_164)).

% @attr reviewer_opinion_the_good_ride_sizing
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values liberal_boot_fair_weight=Liberal_boot_sizes_fair_weight_prioritize_boot_fit unk_reviewer_opinion_the_good_ride_sizing=Unknown
% @importance 0.95

0.88::acc(s16, reviewer_opinion_the_good_ride_sizing).

0.85::true_val(reviewer_opinion_the_good_ride_sizing, liberal_boot_fair_weight); 0.15::true_val(reviewer_opinion_the_good_ride_sizing, unk_reviewer_opinion_the_good_ride_sizing).

measured(s16, reviewer_opinion_the_good_ride_sizing, liberal_boot_fair_weight).

all_consistent(reviewer_opinion_the_good_ride_sizing) :-
    consistent(s16, reviewer_opinion_the_good_ride_sizing).

evidence(all_consistent(reviewer_opinion_the_good_ride_sizing)).
query(true_val(reviewer_opinion_the_good_ride_sizing, liberal_boot_fair_weight)).
query(true_val(reviewer_opinion_the_good_ride_sizing, unk_reviewer_opinion_the_good_ride_sizing)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values korua_dart_cafe_racer_weston_japow_etc=Korua_Dart_Cafe_Racer_Weston_Japow_Moss_Gentemstick_etc unk_comparable_board_cross_brand=Unknown
% @importance 0.95

0.88::acc(s16, comparable_board_cross_brand).

0.85::true_val(comparable_board_cross_brand, korua_dart_cafe_racer_weston_japow_etc); 0.15::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s16, comparable_board_cross_brand, korua_dart_cafe_racer_weston_japow_etc).

all_consistent(comparable_board_cross_brand) :-
    consistent(s16, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, korua_dart_cafe_racer_weston_japow_etc)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_storm_chaser
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values storm_chaser_699_95=Jones_Storm_Chaser_699_95_stiffer_wider unk_comparable_board_cross_brand_storm_chaser=Unknown
% @importance 0.78

0.82::acc(s28, comparable_board_cross_brand_storm_chaser).
0.55::acc(s29, comparable_board_cross_brand_storm_chaser).

0.80::true_val(comparable_board_cross_brand_storm_chaser, storm_chaser_699_95); 0.20::true_val(comparable_board_cross_brand_storm_chaser, unk_comparable_board_cross_brand_storm_chaser).

measured(s28, comparable_board_cross_brand_storm_chaser, storm_chaser_699_95).
measured(s29, comparable_board_cross_brand_storm_chaser, storm_chaser_699_95).

all_consistent(comparable_board_cross_brand_storm_chaser) :-
    consistent(s28, comparable_board_cross_brand_storm_chaser),
    consistent(s29, comparable_board_cross_brand_storm_chaser).

evidence(all_consistent(comparable_board_cross_brand_storm_chaser)).
query(true_val(comparable_board_cross_brand_storm_chaser, storm_chaser_699_95)).
query(true_val(comparable_board_cross_brand_storm_chaser, unk_comparable_board_cross_brand_storm_chaser)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values counterbalance_2026=Burton_Counterbalance_new_2026_replaces_Deep_Thinker unk_comparable_board_same_brand=Unknown
% @importance 0.95

0.88::acc(s16, comparable_board_same_brand).

0.85::true_val(comparable_board_same_brand, counterbalance_2026); 0.15::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s16, comparable_board_same_brand, counterbalance_2026).

all_consistent(comparable_board_same_brand) :-
    consistent(s16, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, counterbalance_2026)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_sketch_artist
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values sketch_artist_729_95=Family_Tree_Sketch_Artist_729_95_freestyle_powder unk_comparable_board_same_brand_sketch_artist=Unknown
% @importance 0.90

0.90::acc(s3, comparable_board_same_brand_sketch_artist).

0.88::true_val(comparable_board_same_brand_sketch_artist, sketch_artist_729_95); 0.12::true_val(comparable_board_same_brand_sketch_artist, unk_comparable_board_same_brand_sketch_artist).

measured(s3, comparable_board_same_brand_sketch_artist, sketch_artist_729_95).

all_consistent(comparable_board_same_brand_sketch_artist) :-
    consistent(s3, comparable_board_same_brand_sketch_artist).

evidence(all_consistent(comparable_board_same_brand_sketch_artist)).
query(true_val(comparable_board_same_brand_sketch_artist, sketch_artist_729_95)).
query(true_val(comparable_board_same_brand_sketch_artist, unk_comparable_board_same_brand_sketch_artist)).

% @attr comparable_board_same_brand_high_fidelity
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values high_fidelity=Family_Tree_High_Fidelity_advanced_freeride_7mm_taper unk_comparable_board_same_brand_high_fidelity=Unknown
% @importance 0.90

0.90::acc(s3, comparable_board_same_brand_high_fidelity).

0.88::true_val(comparable_board_same_brand_high_fidelity, high_fidelity); 0.12::true_val(comparable_board_same_brand_high_fidelity, unk_comparable_board_same_brand_high_fidelity).

measured(s3, comparable_board_same_brand_high_fidelity, high_fidelity).

all_consistent(comparable_board_same_brand_high_fidelity) :-
    consistent(s3, comparable_board_same_brand_high_fidelity).

evidence(all_consistent(comparable_board_same_brand_high_fidelity)).
query(true_val(comparable_board_same_brand_high_fidelity, high_fidelity)).
query(true_val(comparable_board_same_brand_high_fidelity, unk_comparable_board_same_brand_high_fidelity)).

% @attr comparable_board_same_brand_alekesam
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values alekesam=Family_Tree_Alekesam_surf_inspired_all_mountain unk_comparable_board_same_brand_alekesam=Unknown
% @importance 0.90

0.90::acc(s3, comparable_board_same_brand_alekesam).

0.88::true_val(comparable_board_same_brand_alekesam, alekesam); 0.12::true_val(comparable_board_same_brand_alekesam, unk_comparable_board_same_brand_alekesam).

measured(s3, comparable_board_same_brand_alekesam, alekesam).

all_consistent(comparable_board_same_brand_alekesam) :-
    consistent(s3, comparable_board_same_brand_alekesam).

evidence(all_consistent(comparable_board_same_brand_alekesam)).
query(true_val(comparable_board_same_brand_alekesam, alekesam)).
query(true_val(comparable_board_same_brand_alekesam, unk_comparable_board_same_brand_alekesam)).

% @attr comparable_board_cross_brand_barracuda
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values barracuda_1150=Gentemstick_Barracuda_1150_premium_japanese unk_comparable_board_cross_brand_barracuda=Unknown
% @importance 0.85

0.82::acc(s28, comparable_board_cross_brand_barracuda).

0.80::true_val(comparable_board_cross_brand_barracuda, barracuda_1150); 0.20::true_val(comparable_board_cross_brand_barracuda, unk_comparable_board_cross_brand_barracuda).

measured(s28, comparable_board_cross_brand_barracuda, barracuda_1150).

all_consistent(comparable_board_cross_brand_barracuda) :-
    consistent(s28, comparable_board_cross_brand_barracuda).

evidence(all_consistent(comparable_board_cross_brand_barracuda)).
query(true_val(comparable_board_cross_brand_barracuda, barracuda_1150)).
query(true_val(comparable_board_cross_brand_barracuda, unk_comparable_board_cross_brand_barracuda)).

% @attr comparable_board_cross_brand_storm_wolf
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values storm_wolf_699_95=Jones_Storm_Wolf_699_95_stiffer_groomer unk_comparable_board_cross_brand_storm_wolf=Unknown
% @importance 0.70

0.55::acc(s29, comparable_board_cross_brand_storm_wolf).

0.50::true_val(comparable_board_cross_brand_storm_wolf, storm_wolf_699_95); 0.50::true_val(comparable_board_cross_brand_storm_wolf, unk_comparable_board_cross_brand_storm_wolf).

measured(s29, comparable_board_cross_brand_storm_wolf, storm_wolf_699_95).

all_consistent(comparable_board_cross_brand_storm_wolf) :-
    consistent(s29, comparable_board_cross_brand_storm_wolf).

evidence(all_consistent(comparable_board_cross_brand_storm_wolf)).
query(true_val(comparable_board_cross_brand_storm_wolf, storm_wolf_699_95)).
query(true_val(comparable_board_cross_brand_storm_wolf, unk_comparable_board_cross_brand_storm_wolf)).

% @attr comparable_board_cross_brand_price_comparison
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values mid_price_899_95=Smooth_Operator_899_95_mid_range_vs_competitors unk_comparable_board_cross_brand_price_comparison=Unknown
% @importance 0.85

0.82::acc(s28, comparable_board_cross_brand_price_comparison).

0.80::true_val(comparable_board_cross_brand_price_comparison, mid_price_899_95); 0.20::true_val(comparable_board_cross_brand_price_comparison, unk_comparable_board_cross_brand_price_comparison).

measured(s28, comparable_board_cross_brand_price_comparison, mid_price_899_95).

all_consistent(comparable_board_cross_brand_price_comparison) :-
    consistent(s28, comparable_board_cross_brand_price_comparison).

evidence(all_consistent(comparable_board_cross_brand_price_comparison)).
query(true_val(comparable_board_cross_brand_price_comparison, mid_price_899_95)).
query(true_val(comparable_board_cross_brand_price_comparison, unk_comparable_board_cross_brand_price_comparison)).

% @attr taper_comparison_note
% @type categorical
% @canonical false
% @original_name taper comparison note
% @values only_10mm_less_than_competitors=Only_10mm_taper_less_than_many_snowsurf_boards unk_taper_comparison_note=Unknown
% @importance 0.95

0.88::acc(s16, taper_comparison_note).

0.85::true_val(taper_comparison_note, only_10mm_less_than_competitors); 0.15::true_val(taper_comparison_note, unk_taper_comparison_note).

measured(s16, taper_comparison_note, only_10mm_less_than_competitors).

all_consistent(taper_comparison_note) :-
    consistent(s16, taper_comparison_note).

evidence(all_consistent(taper_comparison_note)).
query(true_val(taper_comparison_note, only_10mm_less_than_competitors)).
query(true_val(taper_comparison_note, unk_taper_comparison_note)).

% @attr width_over_inserts
% @type categorical
% @canonical false
% @original_name width over inserts
% @values same_width_balanced_groomers=Same_width_over_inserts_balanced_turning_groomers unk_width_over_inserts=Unknown
% @importance 0.95

0.88::acc(s16, width_over_inserts).

0.85::true_val(width_over_inserts, same_width_balanced_groomers); 0.15::true_val(width_over_inserts, unk_width_over_inserts).

measured(s16, width_over_inserts, same_width_balanced_groomers).

all_consistent(width_over_inserts) :-
    consistent(s16, width_over_inserts).

evidence(all_consistent(width_over_inserts)).
query(true_val(width_over_inserts, same_width_balanced_groomers)).
query(true_val(width_over_inserts, unk_width_over_inserts)).

% @attr mounting_pattern_surf_stance
% @type categorical
% @canonical false
% @original_name mounting_pattern
% @values full_length_extreme_stance=Full_length_channel_extreme_stance_surf_emulation unk_mounting_pattern_surf_stance=Unknown
% @importance 0.95

0.88::acc(s16, mounting_pattern_surf_stance).

0.85::true_val(mounting_pattern_surf_stance, full_length_extreme_stance); 0.15::true_val(mounting_pattern_surf_stance, unk_mounting_pattern_surf_stance).

measured(s16, mounting_pattern_surf_stance, full_length_extreme_stance).

all_consistent(mounting_pattern_surf_stance) :-
    consistent(s16, mounting_pattern_surf_stance).

evidence(all_consistent(mounting_pattern_surf_stance)).
query(true_val(mounting_pattern_surf_stance, full_length_extreme_stance)).
query(true_val(mounting_pattern_surf_stance, unk_mounting_pattern_surf_stance)).

% @attr reviewer_opinion_the_good_ride_groomers
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values excellent_on_groomers=Excellent_on_groomers_lives_to_carve unk_reviewer_opinion_the_good_ride_groomers=Unknown
% @importance 0.95

0.88::acc(s16, reviewer_opinion_the_good_ride_groomers).

0.85::true_val(reviewer_opinion_the_good_ride_groomers, excellent_on_groomers); 0.15::true_val(reviewer_opinion_the_good_ride_groomers, unk_reviewer_opinion_the_good_ride_groomers).

measured(s16, reviewer_opinion_the_good_ride_groomers, excellent_on_groomers).

all_consistent(reviewer_opinion_the_good_ride_groomers) :-
    consistent(s16, reviewer_opinion_the_good_ride_groomers).

evidence(all_consistent(reviewer_opinion_the_good_ride_groomers)).
query(true_val(reviewer_opinion_the_good_ride_groomers, excellent_on_groomers)).
query(true_val(reviewer_opinion_the_good_ride_groomers, unk_reviewer_opinion_the_good_ride_groomers)).

% @attr reviewer_opinion_the_good_ride_sidecut
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values tighter_than_expected=Sidecuts_felt_tighter_balanced_than_expected unk_reviewer_opinion_the_good_ride_sidecut=Unknown
% @importance 0.95

0.88::acc(s16, reviewer_opinion_the_good_ride_sidecut).

0.85::true_val(reviewer_opinion_the_good_ride_sidecut, tighter_than_expected); 0.15::true_val(reviewer_opinion_the_good_ride_sidecut, unk_reviewer_opinion_the_good_ride_sidecut).

measured(s16, reviewer_opinion_the_good_ride_sidecut, tighter_than_expected).

all_consistent(reviewer_opinion_the_good_ride_sidecut) :-
    consistent(s16, reviewer_opinion_the_good_ride_sidecut).

evidence(all_consistent(reviewer_opinion_the_good_ride_sidecut)).
query(true_val(reviewer_opinion_the_good_ride_sidecut, tighter_than_expected)).
query(true_val(reviewer_opinion_the_good_ride_sidecut, unk_reviewer_opinion_the_good_ride_sidecut)).

% @attr reviewer_opinion_the_good_ride_stance
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values wide_stance_range=Works_well_plus27_9_to_plus18_neg3 unk_reviewer_opinion_the_good_ride_stance=Unknown
% @importance 0.95

0.88::acc(s16, reviewer_opinion_the_good_ride_stance).

0.85::true_val(reviewer_opinion_the_good_ride_stance, wide_stance_range); 0.15::true_val(reviewer_opinion_the_good_ride_stance, unk_reviewer_opinion_the_good_ride_stance).

measured(s16, reviewer_opinion_the_good_ride_stance, wide_stance_range).

all_consistent(reviewer_opinion_the_good_ride_stance) :-
    consistent(s16, reviewer_opinion_the_good_ride_stance).

evidence(all_consistent(reviewer_opinion_the_good_ride_stance)).
query(true_val(reviewer_opinion_the_good_ride_stance, wide_stance_range)).
query(true_val(reviewer_opinion_the_good_ride_stance, unk_reviewer_opinion_the_good_ride_stance)).

% @attr surf_inspired_3d_shaping
% @type categorical
% @canonical false
% @original_name surf-inspired 3D shaping
% @values concave_tip_tail_edge_surfy=Concave_tip_tail_traditional_middle_edge_control_surfy unk_surf_inspired_3d_shaping=Unknown
% @importance 0.60

0.80::acc(s10, surf_inspired_3d_shaping).
0.78::acc(s11, surf_inspired_3d_shaping).

0.88::true_val(surf_inspired_3d_shaping, concave_tip_tail_edge_surfy); 0.12::true_val(surf_inspired_3d_shaping, unk_surf_inspired_3d_shaping).

measured(s10, surf_inspired_3d_shaping, concave_tip_tail_edge_surfy).
measured(s11, surf_inspired_3d_shaping, concave_tip_tail_edge_surfy).

all_consistent(surf_inspired_3d_shaping) :-
    (indep(s10), consistent(s10, surf_inspired_3d_shaping) ; \+indep(s10)),
    (indep(s11), consistent(s11, surf_inspired_3d_shaping) ; \+indep(s11)).

evidence(all_consistent(surf_inspired_3d_shaping)).
query(true_val(surf_inspired_3d_shaping, concave_tip_tail_edge_surfy)).
query(true_val(surf_inspired_3d_shaping, unk_surf_inspired_3d_shaping)).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values family_tree_sensei=Family_Tree_Sensei_by_Takeuchi unk_predecessor_model_name=Unknown
% @importance 0.40

0.65::acc(s30, predecessor_model_name).

0.60::true_val(predecessor_model_name, family_tree_sensei); 0.40::true_val(predecessor_model_name, unk_predecessor_model_name).

measured(s30, predecessor_model_name, family_tree_sensei).

all_consistent(predecessor_model_name) :-
    consistent(s30, predecessor_model_name).

evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, family_tree_sensei)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).