0.15::indep(s2).
0.20::indep(s3).
0.12::indep(s4).
0.15::indep(s6).
0.20::indep(s8).
0.15::indep(s14).
0.12::indep(s26).
0.25::indep(s28).
0.15::indep(smerchant).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

0.93::acc(s1, brand).
0.70::acc(s2, brand).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values burton=Burton unk_brand=Unknown
% @importance 0.925

0.97::true_val(brand, burton); 0.03::true_val(brand, unk_brand).

measured(s1, brand, burton).
measured(s2, brand, burton).

all_consistent(brand) :-
    consistent(s1, brand),
    (indep(s2), consistent(s2, brand) ; \+indep(s2)).

evidence(all_consistent(brand)).
query(true_val(brand, burton)).
query(true_val(brand, unk_brand)).

0.93::acc(s1, model_name).
0.70::acc(s2, model_name).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values cartographer=Cartographer unk_model_name=Unknown
% @importance 0.925

0.97::true_val(model_name, cartographer); 0.03::true_val(model_name, unk_model_name).

measured(s1, model_name, cartographer).
measured(s2, model_name, cartographer).

all_consistent(model_name) :-
    consistent(s1, model_name),
    (indep(s2), consistent(s2, model_name) ; \+indep(s2)).

evidence(all_consistent(model_name)).
query(true_val(model_name, cartographer)).
query(true_val(model_name, unk_model_name)).

0.93::acc(s1, full_product_name).

% @attr full_product_name
% @type categorical
% @canonical false
% @original_name Full product name
% @values burton_cartographer_camber_snowboard=Burton_Cartographer_Camber_Snowboard unk_full_product_name=Unknown
% @importance 1.0

0.81::true_val(full_product_name, burton_cartographer_camber_snowboard); 0.19::true_val(full_product_name, unk_full_product_name).

measured(s1, full_product_name, burton_cartographer_camber_snowboard).

all_consistent(full_product_name) :- consistent(s1, full_product_name).

evidence(all_consistent(full_product_name)).
query(true_val(full_product_name, burton_cartographer_camber_snowboard)).
query(true_val(full_product_name, unk_full_product_name)).

0.93::acc(s1, model_year).
0.70::acc(s2, model_year).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2026=2026 unk_model_year=Unknown
% @importance 0.925

0.97::true_val(model_year, y2026); 0.03::true_val(model_year, unk_model_year).

measured(s1, model_year, y2026).
measured(s2, model_year, y2026).

all_consistent(model_year) :-
    consistent(s1, model_year),
    (indep(s2), consistent(s2, model_year) ; \+indep(s2)).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2026)).
query(true_val(model_year, unk_model_year)).

0.93::acc(smerchant, sku).

% @attr sku
% @type categorical
% @canonical false
% @original_name SKU (merchant-provided)
% @values sku_22942102000_149=22942102000-149 unk_sku=Unknown
% @importance 0.85

0.95::true_val(sku, sku_22942102000_149); 0.05::true_val(sku, unk_sku).

measured(smerchant, sku, sku_22942102000_149).

all_consistent(sku) :- consistent(smerchant, sku).

evidence(all_consistent(sku)).
query(true_val(sku, sku_22942102000_149)).
query(true_val(sku, unk_sku)).

0.92::acc(s21, model_first_available_year).
0.93::acc(s22, model_first_available_year).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values y2022=2022 unk_model_first_available_year=Unknown
% @importance 0.70

0.95::true_val(model_first_available_year, y2022); 0.05::true_val(model_first_available_year, unk_model_first_available_year).

measured(s21, model_first_available_year, y2022).
measured(s22, model_first_available_year, y2022).

all_consistent(model_first_available_year) :-
    consistent(s21, model_first_available_year),
    consistent(s22, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2022)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

0.93::acc(s1, product_type).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.95::true_val(product_type, snowboard); 0.05::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).

all_consistent(product_type) :- consistent(s1, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

0.82::acc(s3, board_category).
0.75::acc(s4, board_category).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain_freeride=All_Mountain_Freeride unk_board_category=Unknown
% @importance 0.725

0.95::true_val(board_category, all_mountain_freeride); 0.05::true_val(board_category, unk_board_category).

measured(s3, board_category, all_mountain_freeride).
measured(s4, board_category, all_mountain_freeride).

all_consistent(board_category) :-
    consistent(s3, board_category),
    (indep(s4), consistent(s4, board_category) ; \+indep(s4)).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain_freeride)).
query(true_val(board_category, unk_board_category)).

0.75::acc(s5, gender).
0.72::acc(s6, gender).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values unisex=Unisex unk_gender=Unknown
% @importance 0.70

0.95::true_val(gender, unisex); 0.05::true_val(gender, unk_gender).

measured(s5, gender, unisex).
measured(s6, gender, unisex).

all_consistent(gender) :-
    consistent(s5, gender),
    (indep(s6), consistent(s6, gender) ; \+indep(s6)).

evidence(all_consistent(gender)).
query(true_val(gender, unisex)).
query(true_val(gender, unk_gender)).

0.75::acc(s7, graphic_designer_artist).

% @attr graphic_designer_artist
% @type categorical
% @canonical false
% @original_name graphic_designer_artist
% @values julio_desmont=Julio_Desmont_Vermont_artist unk_graphic_designer_artist=Unknown
% @importance 0.25

0.67::true_val(graphic_designer_artist, julio_desmont); 0.33::true_val(graphic_designer_artist, unk_graphic_designer_artist).

measured(s7, graphic_designer_artist, julio_desmont).

all_consistent(graphic_designer_artist) :- consistent(s7, graphic_designer_artist).

evidence(all_consistent(graphic_designer_artist)).
query(true_val(graphic_designer_artist, julio_desmont)).
query(true_val(graphic_designer_artist, unk_graphic_designer_artist)).

0.82::acc(s3, terrain_suitability).
0.78::acc(s8, terrain_suitability).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values am_freeride_powder=All_Mountain_Freeride_Powder unk_terrain_suitability=Unknown
% @importance 0.85

0.95::true_val(terrain_suitability, am_freeride_powder); 0.05::true_val(terrain_suitability, unk_terrain_suitability).

measured(s3, terrain_suitability, am_freeride_powder).
measured(s8, terrain_suitability, am_freeride_powder).

all_consistent(terrain_suitability) :-
    consistent(s3, terrain_suitability),
    (indep(s8), consistent(s8, terrain_suitability) ; \+indep(s8)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, am_freeride_powder)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

0.90::acc(smerchant, terrain_suitability_big_mountain).

% @attr terrain_suitability_big_mountain
% @type categorical
% @canonical false
% @original_name terrain_suitability (big mountain description)
% @values big_mtn_freeride_any_condition=Big_mountain_freeride_any_condition unk_terrain_suitability_big_mountain=Unknown
% @importance 0.85

0.95::true_val(terrain_suitability_big_mountain, big_mtn_freeride_any_condition); 0.05::true_val(terrain_suitability_big_mountain, unk_terrain_suitability_big_mountain).

measured(smerchant, terrain_suitability_big_mountain, big_mtn_freeride_any_condition).

all_consistent(terrain_suitability_big_mountain) :- consistent(smerchant, terrain_suitability_big_mountain).

evidence(all_consistent(terrain_suitability_big_mountain)).
query(true_val(terrain_suitability_big_mountain, big_mtn_freeride_any_condition)).
query(true_val(terrain_suitability_big_mountain, unk_terrain_suitability_big_mountain)).

0.82::acc(s9, terrain_suitability_park).

% @attr terrain_suitability_park
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability (Park rating)
% @values v3=3.0 unk_terrain_suitability_park=Unknown
% @importance 0.90

0.67::true_val(terrain_suitability_park, v3); 0.33::true_val(terrain_suitability_park, unk_terrain_suitability_park).

measured(s9, terrain_suitability_park, v3).

all_consistent(terrain_suitability_park) :- consistent(s9, terrain_suitability_park).

evidence(all_consistent(terrain_suitability_park)).
query(true_val(terrain_suitability_park, v3)).
query(true_val(terrain_suitability_park, unk_terrain_suitability_park)).

0.82::acc(s9, terrain_suitability_all_mountain).

% @attr terrain_suitability_all_mountain
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability (All Mountain rating)
% @values v7=7.0 unk_terrain_suitability_all_mountain=Unknown
% @importance 0.90

0.67::true_val(terrain_suitability_all_mountain, v7); 0.33::true_val(terrain_suitability_all_mountain, unk_terrain_suitability_all_mountain).

measured(s9, terrain_suitability_all_mountain, v7).

all_consistent(terrain_suitability_all_mountain) :- consistent(s9, terrain_suitability_all_mountain).

evidence(all_consistent(terrain_suitability_all_mountain)).
query(true_val(terrain_suitability_all_mountain, v7)).
query(true_val(terrain_suitability_all_mountain, unk_terrain_suitability_all_mountain)).

0.82::acc(s9, terrain_suitability_powder).

% @attr terrain_suitability_powder
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability (Powder rating)
% @values v8=8.0 unk_terrain_suitability_powder=Unknown
% @importance 0.90

0.67::true_val(terrain_suitability_powder, v8); 0.33::true_val(terrain_suitability_powder, unk_terrain_suitability_powder).

measured(s9, terrain_suitability_powder, v8).

all_consistent(terrain_suitability_powder) :- consistent(s9, terrain_suitability_powder).

evidence(all_consistent(terrain_suitability_powder)).
query(true_val(terrain_suitability_powder, v8)).
query(true_val(terrain_suitability_powder, unk_terrain_suitability_powder)).

0.78::acc(s3, riding_style).
0.72::acc(s10, riding_style).

% @attr riding_style
% @type categorical
% @canonical false
% @original_name riding_style
% @values big_mtn_freeride_am_versatility=Big_mountain_freeride_with_all_mountain_versatility unk_riding_style=Unknown
% @importance 0.85

0.95::true_val(riding_style, big_mtn_freeride_am_versatility); 0.05::true_val(riding_style, unk_riding_style).

measured(s3, riding_style, big_mtn_freeride_am_versatility).
measured(s10, riding_style, big_mtn_freeride_am_versatility).

all_consistent(riding_style) :-
    consistent(s3, riding_style),
    (indep(s10), consistent(s10, riding_style) ; \+indep(s10)).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, big_mtn_freeride_am_versatility)).
query(true_val(riding_style, unk_riding_style)).

0.88::acc(smerchant, rider_level).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values beginner_intermediate=Beginner_Intermediate unk_rider_level=Unknown
% @importance 0.85

0.85::true_val(rider_level, beginner_intermediate); 0.15::true_val(rider_level, unk_rider_level).

measured(smerchant, rider_level, beginner_intermediate).

all_consistent(rider_level) :- consistent(smerchant, rider_level).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, beginner_intermediate)).
query(true_val(rider_level, unk_rider_level)).

0.85::acc(s11, skill_level_recommendation).
0.90::acc(s12, skill_level_recommendation).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values intermediate_advanced=Intermediate_Advanced advanced_expert=Advanced_to_Expert
% @importance 0.95

0.45::true_val(skill_level_recommendation, intermediate_advanced); 0.55::true_val(skill_level_recommendation, advanced_expert).

measured(s11, skill_level_recommendation, intermediate_advanced).
measured(s12, skill_level_recommendation, advanced_expert).

all_consistent(skill_level_recommendation) :-
    consistent(s11, skill_level_recommendation),
    consistent(s12, skill_level_recommendation).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, intermediate_advanced)).
query(true_val(skill_level_recommendation, advanced_expert)).

0.90::acc(smerchant, shape).
0.82::acc(s13, shape).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional freeride_directional=Freeride_Directional
% @importance 0.875

0.50::true_val(shape, tapered_directional); 0.50::true_val(shape, freeride_directional).

measured(smerchant, shape, tapered_directional).
measured(s13, shape, freeride_directional).

all_consistent(shape) :-
    (indep(smerchant), consistent(smerchant, shape) ; \+indep(smerchant)),
    consistent(s13, shape).

evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, freeride_directional)).

0.82::acc(s14, camber_type).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values directional_camber=Directional_Camber unk_camber_type=Unknown
% @importance 0.90

0.67::true_val(camber_type, directional_camber); 0.33::true_val(camber_type, unk_camber_type).

measured(s14, camber_type, directional_camber).

all_consistent(camber_type) :-
    (indep(s14), consistent(s14, camber_type) ; \+indep(s14)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, directional_camber)).
query(true_val(camber_type, unk_camber_type)).

0.82::acc(s15, camber_description).
0.88::acc(s16, camber_description).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values nose_rocker_camber_underfoot=Entry_rocker_nose_camber_underfoot unk_camber_description=Unknown
% @importance 0.875

0.95::true_val(camber_description, nose_rocker_camber_underfoot); 0.05::true_val(camber_description, unk_camber_description).

measured(s15, camber_description, nose_rocker_camber_underfoot).
measured(s16, camber_description, nose_rocker_camber_underfoot).

all_consistent(camber_description) :-
    consistent(s15, camber_description),
    consistent(s16, camber_description).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, nose_rocker_camber_underfoot)).
query(true_val(camber_description, unk_camber_description)).

0.88::acc(s17, taper).

% @attr taper
% @type numeric
% @unit mm
% @canonical true
% @original_name taper
% @values v5=5.0 unk_taper=Unknown
% @importance 0.80

0.76::true_val(taper, v5); 0.24::true_val(taper, unk_taper).

measured(s17, taper, v5).

all_consistent(taper) :- consistent(s17, taper).

evidence(all_consistent(taper)).
query(true_val(taper, v5)).
query(true_val(taper, unk_taper)).

0.72::acc(s18, taper_nose_length).

% @attr taper_nose_length
% @type numeric
% @unit mm
% @canonical false
% @original_name taper (nose length taper)
% @values v15=15.0 unk_taper_nose_length=Unknown
% @importance 0.75

0.60::true_val(taper_nose_length, v15); 0.40::true_val(taper_nose_length, unk_taper_nose_length).

measured(s18, taper_nose_length, v15).

all_consistent(taper_nose_length) :- consistent(s18, taper_nose_length).

evidence(all_consistent(taper_nose_length)).
query(true_val(taper_nose_length, v15)).
query(true_val(taper_nose_length, unk_taper_nose_length)).

0.90::acc(smerchant, flex_rating_10).
0.78::acc(s19, flex_rating_10).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v5_5=5.5 v4_7=4-7
% @importance 0.85

0.55::true_val(flex_rating_10, v5_5); 0.45::true_val(flex_rating_10, v4_7).

measured(smerchant, flex_rating_10, v5_5).
measured(s19, flex_rating_10, v4_7).

all_consistent(flex_rating_10) :-
    (indep(smerchant), consistent(smerchant, flex_rating_10) ; \+indep(smerchant)),
    consistent(s19, flex_rating_10).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v5_5)).
query(true_val(flex_rating_10, v4_7)).

0.90::acc(smerchant, flex_direction).
0.82::acc(s13, flex_direction).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values directional_flex=Directional_Flex unk_flex_direction=Unknown
% @importance 0.875

0.95::true_val(flex_direction, directional_flex); 0.05::true_val(flex_direction, unk_flex_direction).

measured(smerchant, flex_direction, directional_flex).
measured(s13, flex_direction, directional_flex).

all_consistent(flex_direction) :-
    (indep(smerchant), consistent(smerchant, flex_direction) ; \+indep(smerchant)),
    consistent(s13, flex_direction).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional_flex)).
query(true_val(flex_direction, unk_flex_direction)).

0.88::acc(s20, flex_feel).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values med_stiff_underfoot_poppy_damp=Medium_stiff_underfoot_poppy_damp unk_flex_feel=Unknown
% @importance 0.85

0.76::true_val(flex_feel, med_stiff_underfoot_poppy_damp); 0.24::true_val(flex_feel, unk_flex_feel).

measured(s20, flex_feel, med_stiff_underfoot_poppy_damp).

all_consistent(flex_feel) :- consistent(s20, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, med_stiff_underfoot_poppy_damp)).
query(true_val(flex_feel, unk_flex_feel)).

0.93::acc(smerchant, available_sizes).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values seven_sizes=144_149_154_159_162_154W_159W unk_available_sizes=Unknown
% @importance 0.85

0.95::true_val(available_sizes, seven_sizes); 0.05::true_val(available_sizes, unk_available_sizes).

measured(smerchant, available_sizes, seven_sizes).

all_consistent(available_sizes) :- consistent(smerchant, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, seven_sizes)).
query(true_val(available_sizes, unk_available_sizes)).

0.93::acc(smerchant, width_options).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_and_wide=Standard_Wide unk_width_options=Unknown
% @importance 0.85

0.95::true_val(width_options, standard_and_wide); 0.05::true_val(width_options, unk_width_options).

measured(smerchant, width_options, standard_and_wide).

all_consistent(width_options) :- consistent(smerchant, width_options).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

0.93::acc(smerchant, effective_edge_144).
0.85::acc(s21, effective_edge_144).

% @attr effective_edge_144
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 144cm
% @values v1062=1062.0 unk_effective_edge_144=Unknown
% @importance 0.825

0.95::true_val(effective_edge_144, v1062); 0.05::true_val(effective_edge_144, unk_effective_edge_144).

measured(smerchant, effective_edge_144, v1062).
measured(s21, effective_edge_144, v1062).

all_consistent(effective_edge_144) :-
    (indep(smerchant), consistent(smerchant, effective_edge_144) ; \+indep(smerchant)),
    consistent(s21, effective_edge_144).

evidence(all_consistent(effective_edge_144)).
query(true_val(effective_edge_144, v1062)).
query(true_val(effective_edge_144, unk_effective_edge_144)).

0.93::acc(smerchant, effective_edge_149).
0.85::acc(s21, effective_edge_149).

% @attr effective_edge_149
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 149cm
% @values v1092=1092.0 unk_effective_edge_149=Unknown
% @importance 0.825

0.95::true_val(effective_edge_149, v1092); 0.05::true_val(effective_edge_149, unk_effective_edge_149).

measured(smerchant, effective_edge_149, v1092).
measured(s21, effective_edge_149, v1092).

all_consistent(effective_edge_149) :-
    (indep(smerchant), consistent(smerchant, effective_edge_149) ; \+indep(smerchant)),
    consistent(s21, effective_edge_149).

evidence(all_consistent(effective_edge_149)).
query(true_val(effective_edge_149, v1092)).
query(true_val(effective_edge_149, unk_effective_edge_149)).

0.93::acc(smerchant, effective_edge_154).
0.85::acc(s21, effective_edge_154).

% @attr effective_edge_154
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 154cm
% @values v1142=1142.0 unk_effective_edge_154=Unknown
% @importance 0.825

0.95::true_val(effective_edge_154, v1142); 0.05::true_val(effective_edge_154, unk_effective_edge_154).

measured(smerchant, effective_edge_154, v1142).
measured(s21, effective_edge_154, v1142).

all_consistent(effective_edge_154) :-
    (indep(smerchant), consistent(smerchant, effective_edge_154) ; \+indep(smerchant)),
    consistent(s21, effective_edge_154).

evidence(all_consistent(effective_edge_154)).
query(true_val(effective_edge_154, v1142)).
query(true_val(effective_edge_154, unk_effective_edge_154)).

0.93::acc(smerchant, effective_edge_159).
0.85::acc(s21, effective_edge_159).

% @attr effective_edge_159
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 159cm
% @values v1192=1192.0 unk_effective_edge_159=Unknown
% @importance 0.825

0.95::true_val(effective_edge_159, v1192); 0.05::true_val(effective_edge_159, unk_effective_edge_159).

measured(smerchant, effective_edge_159, v1192).
measured(s21, effective_edge_159, v1192).

all_consistent(effective_edge_159) :-
    (indep(smerchant), consistent(smerchant, effective_edge_159) ; \+indep(smerchant)),
    consistent(s21, effective_edge_159).

evidence(all_consistent(effective_edge_159)).
query(true_val(effective_edge_159, v1192)).
query(true_val(effective_edge_159, unk_effective_edge_159)).

0.93::acc(smerchant, effective_edge_162).
0.85::acc(s21, effective_edge_162).

% @attr effective_edge_162
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 162cm
% @values v1222=1222.0 unk_effective_edge_162=Unknown
% @importance 0.825

0.95::true_val(effective_edge_162, v1222); 0.05::true_val(effective_edge_162, unk_effective_edge_162).

measured(smerchant, effective_edge_162, v1222).
measured(s21, effective_edge_162, v1222).

all_consistent(effective_edge_162) :-
    (indep(smerchant), consistent(smerchant, effective_edge_162) ; \+indep(smerchant)),
    consistent(s21, effective_edge_162).

evidence(all_consistent(effective_edge_162)).
query(true_val(effective_edge_162, v1222)).
query(true_val(effective_edge_162, unk_effective_edge_162)).

0.93::acc(smerchant, effective_edge_154w).
0.85::acc(s21, effective_edge_154w).

% @attr effective_edge_154w
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 154W
% @values v1142=1142.0 unk_effective_edge_154w=Unknown
% @importance 0.825

0.95::true_val(effective_edge_154w, v1142); 0.05::true_val(effective_edge_154w, unk_effective_edge_154w).

measured(smerchant, effective_edge_154w, v1142).
measured(s21, effective_edge_154w, v1142).

all_consistent(effective_edge_154w) :-
    (indep(smerchant), consistent(smerchant, effective_edge_154w) ; \+indep(smerchant)),
    consistent(s21, effective_edge_154w).

evidence(all_consistent(effective_edge_154w)).
query(true_val(effective_edge_154w, v1142)).
query(true_val(effective_edge_154w, unk_effective_edge_154w)).

0.93::acc(smerchant, effective_edge_159w).
0.85::acc(s21, effective_edge_159w).

% @attr effective_edge_159w
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 159W
% @values v1192=1192.0 unk_effective_edge_159w=Unknown
% @importance 0.825

0.95::true_val(effective_edge_159w, v1192); 0.05::true_val(effective_edge_159w, unk_effective_edge_159w).

measured(smerchant, effective_edge_159w, v1192).
measured(s21, effective_edge_159w, v1192).

all_consistent(effective_edge_159w) :-
    (indep(smerchant), consistent(smerchant, effective_edge_159w) ; \+indep(smerchant)),
    consistent(s21, effective_edge_159w).

evidence(all_consistent(effective_edge_159w)).
query(true_val(effective_edge_159w, v1192)).
query(true_val(effective_edge_159w, unk_effective_edge_159w)).

0.93::acc(smerchant, sidecut_radius_size_144).

% @attr sidecut_radius_size_144
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (144cm)
% @values v6_5=6.5 unk_sidecut_radius_size_144=Unknown
% @importance 0.85

0.95::true_val(sidecut_radius_size_144, v6_5); 0.05::true_val(sidecut_radius_size_144, unk_sidecut_radius_size_144).

measured(smerchant, sidecut_radius_size_144, v6_5).

all_consistent(sidecut_radius_size_144) :- consistent(smerchant, sidecut_radius_size_144).

evidence(all_consistent(sidecut_radius_size_144)).
query(true_val(sidecut_radius_size_144, v6_5)).
query(true_val(sidecut_radius_size_144, unk_sidecut_radius_size_144)).

0.93::acc(smerchant, sidecut_radius_size_149).

% @attr sidecut_radius_size_149
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (149cm)
% @values v6_7=6.7 unk_sidecut_radius_size_149=Unknown
% @importance 0.85

0.95::true_val(sidecut_radius_size_149, v6_7); 0.05::true_val(sidecut_radius_size_149, unk_sidecut_radius_size_149).

measured(smerchant, sidecut_radius_size_149, v6_7).

all_consistent(sidecut_radius_size_149) :- consistent(smerchant, sidecut_radius_size_149).

evidence(all_consistent(sidecut_radius_size_149)).
query(true_val(sidecut_radius_size_149, v6_7)).
query(true_val(sidecut_radius_size_149, unk_sidecut_radius_size_149)).

0.93::acc(smerchant, sidecut_radius_size).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size (154cm)
% @values v7_0=7.0 unk_sidecut_radius_size=Unknown
% @importance 0.85

0.95::true_val(sidecut_radius_size, v7_0); 0.05::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(smerchant, sidecut_radius_size, v7_0).

all_consistent(sidecut_radius_size) :- consistent(smerchant, sidecut_radius_size).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_0)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

0.93::acc(smerchant, sidecut_radius_size_159).

% @attr sidecut_radius_size_159
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (159cm)
% @values v7_3=7.3 unk_sidecut_radius_size_159=Unknown
% @importance 0.85

0.95::true_val(sidecut_radius_size_159, v7_3); 0.05::true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159).

measured(smerchant, sidecut_radius_size_159, v7_3).

all_consistent(sidecut_radius_size_159) :- consistent(smerchant, sidecut_radius_size_159).

evidence(all_consistent(sidecut_radius_size_159)).
query(true_val(sidecut_radius_size_159, v7_3)).
query(true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159)).

0.93::acc(smerchant, sidecut_radius_size_162).

% @attr sidecut_radius_size_162
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (162cm)
% @values v7_5=7.5 unk_sidecut_radius_size_162=Unknown
% @importance 0.85

0.95::true_val(sidecut_radius_size_162, v7_5); 0.05::true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162).

measured(smerchant, sidecut_radius_size_162, v7_5).

all_consistent(sidecut_radius_size_162) :- consistent(smerchant, sidecut_radius_size_162).

evidence(all_consistent(sidecut_radius_size_162)).
query(true_val(sidecut_radius_size_162, v7_5)).
query(true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162)).

0.93::acc(smerchant, sidecut_radius_size_154w).

% @attr sidecut_radius_size_154w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (154W)
% @values v7_0=7.0 unk_sidecut_radius_size_154w=Unknown
% @importance 0.85

0.95::true_val(sidecut_radius_size_154w, v7_0); 0.05::true_val(sidecut_radius_size_154w, unk_sidecut_radius_size_154w).

measured(smerchant, sidecut_radius_size_154w, v7_0).

all_consistent(sidecut_radius_size_154w) :- consistent(smerchant, sidecut_radius_size_154w).

evidence(all_consistent(sidecut_radius_size_154w)).
query(true_val(sidecut_radius_size_154w, v7_0)).
query(true_val(sidecut_radius_size_154w, unk_sidecut_radius_size_154w)).

0.93::acc(smerchant, sidecut_radius_size_159w).

% @attr sidecut_radius_size_159w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (159W)
% @values v7_3=7.3 unk_sidecut_radius_size_159w=Unknown
% @importance 0.85

0.95::true_val(sidecut_radius_size_159w, v7_3); 0.05::true_val(sidecut_radius_size_159w, unk_sidecut_radius_size_159w).

measured(smerchant, sidecut_radius_size_159w, v7_3).

all_consistent(sidecut_radius_size_159w) :- consistent(smerchant, sidecut_radius_size_159w).

evidence(all_consistent(sidecut_radius_size_159w)).
query(true_val(sidecut_radius_size_159w, v7_3)).
query(true_val(sidecut_radius_size_159w, unk_sidecut_radius_size_159w)).

0.93::acc(smerchant, tip_tail_width_size_144).

% @attr tip_tail_width_size_144
% @type categorical
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (144cm)
% @values w28_7_28_2=28.7/28.2 unk_tip_tail_width_size_144=Unknown
% @importance 0.85

0.95::true_val(tip_tail_width_size_144, w28_7_28_2); 0.05::true_val(tip_tail_width_size_144, unk_tip_tail_width_size_144).

measured(smerchant, tip_tail_width_size_144, w28_7_28_2).

all_consistent(tip_tail_width_size_144) :- consistent(smerchant, tip_tail_width_size_144).

evidence(all_consistent(tip_tail_width_size_144)).
query(true_val(tip_tail_width_size_144, w28_7_28_2)).
query(true_val(tip_tail_width_size_144, unk_tip_tail_width_size_144)).

0.93::acc(smerchant, tip_tail_width_size_149).

% @attr tip_tail_width_size_149
% @type categorical
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (149cm)
% @values w29_3_28_8=29.3/28.8 unk_tip_tail_width_size_149=Unknown
% @importance 0.85

0.95::true_val(tip_tail_width_size_149, w29_3_28_8); 0.05::true_val(tip_tail_width_size_149, unk_tip_tail_width_size_149).

measured(smerchant, tip_tail_width_size_149, w29_3_28_8).

all_consistent(tip_tail_width_size_149) :- consistent(smerchant, tip_tail_width_size_149).

evidence(all_consistent(tip_tail_width_size_149)).
query(true_val(tip_tail_width_size_149, w29_3_28_8)).
query(true_val(tip_tail_width_size_149, unk_tip_tail_width_size_149)).

0.93::acc(smerchant, tip_tail_width_size).

% @attr tip_tail_width_size
% @type categorical
% @unit cm
% @canonical true
% @original_name tip_tail_width_size (154cm)
% @values w30_0_29_5=30.0/29.5 unk_tip_tail_width_size=Unknown
% @importance 0.85

0.95::true_val(tip_tail_width_size, w30_0_29_5); 0.05::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(smerchant, tip_tail_width_size, w30_0_29_5).

all_consistent(tip_tail_width_size) :- consistent(smerchant, tip_tail_width_size).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, w30_0_29_5)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

0.93::acc(smerchant, tip_tail_width_size_159).

% @attr tip_tail_width_size_159
% @type categorical
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (159cm)
% @values w30_5_30_0=30.5/30.0 unk_tip_tail_width_size_159=Unknown
% @importance 0.85

0.95::true_val(tip_tail_width_size_159, w30_5_30_0); 0.05::true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159).

measured(smerchant, tip_tail_width_size_159, w30_5_30_0).

all_consistent(tip_tail_width_size_159) :- consistent(smerchant, tip_tail_width_size_159).

evidence(all_consistent(tip_tail_width_size_159)).
query(true_val(tip_tail_width_size_159, w30_5_30_0)).
query(true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159)).

0.93::acc(smerchant, tip_tail_width_size_162).

% @attr tip_tail_width_size_162
% @type categorical
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (162cm)
% @values w30_8_30_3=30.8/30.3 unk_tip_tail_width_size_162=Unknown
% @importance 0.85

0.95::true_val(tip_tail_width_size_162, w30_8_30_3); 0.05::true_val(tip_tail_width_size_162, unk_tip_tail_width_size_162).

measured(smerchant, tip_tail_width_size_162, w30_8_30_3).

all_consistent(tip_tail_width_size_162) :- consistent(smerchant, tip_tail_width_size_162).

evidence(all_consistent(tip_tail_width_size_162)).
query(true_val(tip_tail_width_size_162, w30_8_30_3)).
query(true_val(tip_tail_width_size_162, unk_tip_tail_width_size_162)).

0.93::acc(smerchant, tip_tail_width_size_154w).

% @attr tip_tail_width_size_154w
% @type categorical
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (154W)
% @values w30_8_30_3=30.8/30.3 unk_tip_tail_width_size_154w=Unknown
% @importance 0.85

0.95::true_val(tip_tail_width_size_154w, w30_8_30_3); 0.05::true_val(tip_tail_width_size_154w, unk_tip_tail_width_size_154w).

measured(smerchant, tip_tail_width_size_154w, w30_8_30_3).

all_consistent(tip_tail_width_size_154w) :- consistent(smerchant, tip_tail_width_size_154w).

evidence(all_consistent(tip_tail_width_size_154w)).
query(true_val(tip_tail_width_size_154w, w30_8_30_3)).
query(true_val(tip_tail_width_size_154w, unk_tip_tail_width_size_154w)).

0.93::acc(smerchant, tip_tail_width_size_159w).

% @attr tip_tail_width_size_159w
% @type categorical
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (159W)
% @values w31_3_30_8=31.3/30.8 unk_tip_tail_width_size_159w=Unknown
% @importance 0.85

0.95::true_val(tip_tail_width_size_159w, w31_3_30_8); 0.05::true_val(tip_tail_width_size_159w, unk_tip_tail_width_size_159w).

measured(smerchant, tip_tail_width_size_159w, w31_3_30_8).

all_consistent(tip_tail_width_size_159w) :- consistent(smerchant, tip_tail_width_size_159w).

evidence(all_consistent(tip_tail_width_size_159w)).
query(true_val(tip_tail_width_size_159w, w31_3_30_8)).
query(true_val(tip_tail_width_size_159w, unk_tip_tail_width_size_159w)).

0.93::acc(smerchant, waist_width_144).

% @attr waist_width_144
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 144cm
% @values v24_5=24.5 unk_waist_width_144=Unknown
% @importance 0.85

0.95::true_val(waist_width_144, v24_5); 0.05::true_val(waist_width_144, unk_waist_width_144).

measured(smerchant, waist_width_144, v24_5).

all_consistent(waist_width_144) :- consistent(smerchant, waist_width_144).

evidence(all_consistent(waist_width_144)).
query(true_val(waist_width_144, v24_5)).
query(true_val(waist_width_144, unk_waist_width_144)).

0.93::acc(smerchant, waist_width_149).

% @attr waist_width_149
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 149cm
% @values v25_0=25.0 unk_waist_width_149=Unknown
% @importance 0.85

0.95::true_val(waist_width_149, v25_0); 0.05::true_val(waist_width_149, unk_waist_width_149).

measured(smerchant, waist_width_149, v25_0).

all_consistent(waist_width_149) :- consistent(smerchant, waist_width_149).

evidence(all_consistent(waist_width_149)).
query(true_val(waist_width_149, v25_0)).
query(true_val(waist_width_149, unk_waist_width_149)).

0.93::acc(smerchant, waist_width_154).

% @attr waist_width_154
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 154cm
% @values v25_5=25.5 unk_waist_width_154=Unknown
% @importance 0.85

0.95::true_val(waist_width_154, v25_5); 0.05::true_val(waist_width_154, unk_waist_width_154).

measured(smerchant, waist_width_154, v25_5).

all_consistent(waist_width_154) :- consistent(smerchant, waist_width_154).

evidence(all_consistent(waist_width_154)).
query(true_val(waist_width_154, v25_5)).
query(true_val(waist_width_154, unk_waist_width_154)).

0.93::acc(smerchant, waist_width_159).

% @attr waist_width_159
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 159cm
% @values v25_8=25.8 unk_waist_width_159=Unknown
% @importance 0.85

0.95::true_val(waist_width_159, v25_8); 0.05::true_val(waist_width_159, unk_waist_width_159).

measured(smerchant, waist_width_159, v25_8).

all_consistent(waist_width_159) :- consistent(smerchant, waist_width_159).

evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v25_8)).
query(true_val(waist_width_159, unk_waist_width_159)).

0.93::acc(smerchant, waist_width_162).

% @attr waist_width_162
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 162cm
% @values v26_0=26.0 unk_waist_width_162=Unknown
% @importance 0.85

0.95::true_val(waist_width_162, v26_0); 0.05::true_val(waist_width_162, unk_waist_width_162).

measured(smerchant, waist_width_162, v26_0).

all_consistent(waist_width_162) :- consistent(smerchant, waist_width_162).

evidence(all_consistent(waist_width_162)).
query(true_val(waist_width_162, v26_0)).
query(true_val(waist_width_162, unk_waist_width_162)).

0.93::acc(smerchant, waist_width_154w).

% @attr waist_width_154w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 154W
% @values v26_3=26.3 unk_waist_width_154w=Unknown
% @importance 0.85

0.95::true_val(waist_width_154w, v26_3); 0.05::true_val(waist_width_154w, unk_waist_width_154w).

measured(smerchant, waist_width_154w, v26_3).

all_consistent(waist_width_154w) :- consistent(smerchant, waist_width_154w).

evidence(all_consistent(waist_width_154w)).
query(true_val(waist_width_154w, v26_3)).
query(true_val(waist_width_154w, unk_waist_width_154w)).

0.93::acc(smerchant, waist_width_159w).

% @attr waist_width_159w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 159W
% @values v26_6=26.6 unk_waist_width_159w=Unknown
% @importance 0.85

0.95::true_val(waist_width_159w, v26_6); 0.05::true_val(waist_width_159w, unk_waist_width_159w).

measured(smerchant, waist_width_159w, v26_6).

all_consistent(waist_width_159w) :- consistent(smerchant, waist_width_159w).

evidence(all_consistent(waist_width_159w)).
query(true_val(waist_width_159w, v26_6)).
query(true_val(waist_width_159w, unk_waist_width_159w)).

0.93::acc(smerchant, stance_width_range_size_144).

% @attr stance_width_range_size_144
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size (144cm)
% @values v50_5=50.5 unk_stance_width_range_size_144=Unknown
% @importance 0.85

0.95::true_val(stance_width_range_size_144, v50_5); 0.05::true_val(stance_width_range_size_144, unk_stance_width_range_size_144).

measured(smerchant, stance_width_range_size_144, v50_5).

all_consistent(stance_width_range_size_144) :- consistent(smerchant, stance_width_range_size_144).

evidence(all_consistent(stance_width_range_size_144)).
query(true_val(stance_width_range_size_144, v50_5)).
query(true_val(stance_width_range_size_144, unk_stance_width_range_size_144)).

0.93::acc(smerchant, stance_width_range_size_149).

% @attr stance_width_range_size_149
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size (149cm)
% @values v53_0=53.0 unk_stance_width_range_size_149=Unknown
% @importance 0.85

0.95::true_val(stance_width_range_size_149, v53_0); 0.05::true_val(stance_width_range_size_149, unk_stance_width_range_size_149).

measured(smerchant, stance_width_range_size_149, v53_0).

all_consistent(stance_width_range_size_149) :- consistent(smerchant, stance_width_range_size_149).

evidence(all_consistent(stance_width_range_size_149)).
query(true_val(stance_width_range_size_149, v53_0)).
query(true_val(stance_width_range_size_149, unk_stance_width_range_size_149)).

0.93::acc(smerchant, stance_width_range_size).

% @attr stance_width_range_size
% @type numeric
% @unit cm
% @canonical true
% @original_name stance_width_range_size (154cm)
% @values v56_0=56.0 unk_stance_width_range_size=Unknown
% @importance 0.85

0.95::true_val(stance_width_range_size, v56_0); 0.05::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(smerchant, stance_width_range_size, v56_0).

all_consistent(stance_width_range_size) :- consistent(smerchant, stance_width_range_size).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v56_0)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

0.93::acc(smerchant, stance_width_range_size_wide).

% @attr stance_width_range_size_wide
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size (wide)
% @values v56_0=56.0 unk_stance_width_range_size_wide=Unknown
% @importance 0.85

0.95::true_val(stance_width_range_size_wide, v56_0); 0.05::true_val(stance_width_range_size_wide, unk_stance_width_range_size_wide).

measured(smerchant, stance_width_range_size_wide, v56_0).

all_consistent(stance_width_range_size_wide) :- consistent(smerchant, stance_width_range_size_wide).

evidence(all_consistent(stance_width_range_size_wide)).
query(true_val(stance_width_range_size_wide, v56_0)).
query(true_val(stance_width_range_size_wide, unk_stance_width_range_size_wide)).

0.93::acc(smerchant, setback).

% @attr setback
% @type numeric
% @unit cm
% @canonical true
% @original_name setback
% @values vm2_5=-2.5 unk_setback=Unknown
% @importance 0.85

0.95::true_val(setback, vm2_5); 0.05::true_val(setback, unk_setback).

measured(smerchant, setback, vm2_5).

all_consistent(setback) :- consistent(smerchant, setback).

evidence(all_consistent(setback)).
query(true_val(setback, vm2_5)).
query(true_val(setback, unk_setback)).

0.93::acc(smerchant, recommended_weight_range_size_144).

% @attr recommended_weight_range_size_144
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (144cm)
% @values w45_68=45-68kg unk_recommended_weight_range_size_144=Unknown
% @importance 0.85

0.95::true_val(recommended_weight_range_size_144, w45_68); 0.05::true_val(recommended_weight_range_size_144, unk_recommended_weight_range_size_144).

measured(smerchant, recommended_weight_range_size_144, w45_68).

all_consistent(recommended_weight_range_size_144) :- consistent(smerchant, recommended_weight_range_size_144).

evidence(all_consistent(recommended_weight_range_size_144)).
query(true_val(recommended_weight_range_size_144, w45_68)).
query(true_val(recommended_weight_range_size_144, unk_recommended_weight_range_size_144)).

0.93::acc(smerchant, recommended_weight_range_size_149).

% @attr recommended_weight_range_size_149
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (149cm)
% @values w45_68=45-68kg unk_recommended_weight_range_size_149=Unknown
% @importance 0.85

0.95::true_val(recommended_weight_range_size_149, w45_68); 0.05::true_val(recommended_weight_range_size_149, unk_recommended_weight_range_size_149).

measured(smerchant, recommended_weight_range_size_149, w45_68).

all_consistent(recommended_weight_range_size_149) :- consistent(smerchant, recommended_weight_range_size_149).

evidence(all_consistent(recommended_weight_range_size_149)).
query(true_val(recommended_weight_range_size_149, w45_68)).
query(true_val(recommended_weight_range_size_149, unk_recommended_weight_range_size_149)).

0.93::acc(smerchant, recommended_weight_range_size).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size (154cm)
% @values w54_82=54-82kg unk_recommended_weight_range_size=Unknown
% @importance 0.85

0.95::true_val(recommended_weight_range_size, w54_82); 0.05::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(smerchant, recommended_weight_range_size, w54_82).

all_consistent(recommended_weight_range_size) :- consistent(smerchant, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w54_82)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

0.93::acc(smerchant, recommended_weight_range_size_159).

% @attr recommended_weight_range_size_159
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (159cm)
% @values w68_91=68-91kg unk_recommended_weight_range_size_159=Unknown
% @importance 0.85

0.95::true_val(recommended_weight_range_size_159, w68_91); 0.05::true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159).

measured(smerchant, recommended_weight_range_size_159, w68_91).

all_consistent(recommended_weight_range_size_159) :- consistent(smerchant, recommended_weight_range_size_159).

evidence(all_consistent(recommended_weight_range_size_159)).
query(true_val(recommended_weight_range_size_159, w68_91)).
query(true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159)).

0.93::acc(smerchant, recommended_weight_range_size_162).

% @attr recommended_weight_range_size_162
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (162cm)
% @values w82_118=82-118kg unk_recommended_weight_range_size_162=Unknown
% @importance 0.85

0.95::true_val(recommended_weight_range_size_162, w82_118); 0.05::true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162).

measured(smerchant, recommended_weight_range_size_162, w82_118).

all_consistent(recommended_weight_range_size_162) :- consistent(smerchant, recommended_weight_range_size_162).

evidence(all_consistent(recommended_weight_range_size_162)).
query(true_val(recommended_weight_range_size_162, w82_118)).
query(true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162)).

0.93::acc(smerchant, recommended_weight_range_size_154w).

% @attr recommended_weight_range_size_154w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (154W)
% @values w54_82=54-82kg unk_recommended_weight_range_size_154w=Unknown
% @importance 0.85

0.95::true_val(recommended_weight_range_size_154w, w54_82); 0.05::true_val(recommended_weight_range_size_154w, unk_recommended_weight_range_size_154w).

measured(smerchant, recommended_weight_range_size_154w, w54_82).

all_consistent(recommended_weight_range_size_154w) :- consistent(smerchant, recommended_weight_range_size_154w).

evidence(all_consistent(recommended_weight_range_size_154w)).
query(true_val(recommended_weight_range_size_154w, w54_82)).
query(true_val(recommended_weight_range_size_154w, unk_recommended_weight_range_size_154w)).

0.93::acc(smerchant, recommended_weight_range_size_159w).

% @attr recommended_weight_range_size_159w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (159W)
% @values w68_91=68-91kg unk_recommended_weight_range_size_159w=Unknown
% @importance 0.85

0.95::true_val(recommended_weight_range_size_159w, w68_91); 0.05::true_val(recommended_weight_range_size_159w, unk_recommended_weight_range_size_159w).

measured(smerchant, recommended_weight_range_size_159w, w68_91).

all_consistent(recommended_weight_range_size_159w) :- consistent(smerchant, recommended_weight_range_size_159w).

evidence(all_consistent(recommended_weight_range_size_159w)).
query(true_val(recommended_weight_range_size_159w, w68_91)).
query(true_val(recommended_weight_range_size_159w, unk_recommended_weight_range_size_159w)).

0.88::acc(s22, core_material).
0.82::acc(s23, core_material).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values fsc_super_fly_800g=FSC_Certified_Super_Fly_800G unk_core_material=Unknown
% @importance 0.75

0.95::true_val(core_material, fsc_super_fly_800g); 0.05::true_val(core_material, unk_core_material).

measured(s22, core_material, fsc_super_fly_800g).
measured(s23, core_material, fsc_super_fly_800g).

all_consistent(core_material) :-
    consistent(s22, core_material),
    (indep(s23), consistent(s23, core_material) ; \+indep(s23)).

evidence(all_consistent(core_material)).
query(true_val(core_material, fsc_super_fly_800g)).
query(true_val(core_material, unk_core_material)).

0.90::acc(smerchant, construction_material_innovation).
0.82::acc(s24, construction_material_innovation).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation (Dualzone EGD)
% @values dualzone_egd=Dualzone_EGD_perpendicular_wood_grain unk_construction_material_innovation=Unknown
% @importance 0.80

0.95::true_val(construction_material_innovation, dualzone_egd); 0.05::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(smerchant, construction_material_innovation, dualzone_egd).
measured(s24, construction_material_innovation, dualzone_egd).

all_consistent(construction_material_innovation) :-
    (indep(smerchant), consistent(smerchant, construction_material_innovation) ; \+indep(smerchant)),
    consistent(s24, construction_material_innovation).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, dualzone_egd)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

0.90::acc(smerchant, construction_squeezebox).
0.82::acc(s25, construction_squeezebox).

% @attr construction_squeezebox
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Squeezebox)
% @values squeezebox=Squeezebox_core_profiling unk_construction_squeezebox=Unknown
% @importance 0.80

0.95::true_val(construction_squeezebox, squeezebox); 0.05::true_val(construction_squeezebox, unk_construction_squeezebox).

measured(smerchant, construction_squeezebox, squeezebox).
measured(s25, construction_squeezebox, squeezebox).

all_consistent(construction_squeezebox) :-
    (indep(smerchant), consistent(smerchant, construction_squeezebox) ; \+indep(smerchant)),
    consistent(s25, construction_squeezebox).

evidence(all_consistent(construction_squeezebox)).
query(true_val(construction_squeezebox, squeezebox)).
query(true_val(construction_squeezebox, unk_construction_squeezebox)).

0.82::acc(s23, sustainability_certification).
0.78::acc(s26, sustainability_certification).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification (FSC wood)
% @values fsc_certified_wood=FSC_Certified_core_wood unk_sustainability_certification=Unknown
% @importance 0.70

0.95::true_val(sustainability_certification, fsc_certified_wood); 0.05::true_val(sustainability_certification, unk_sustainability_certification).

measured(s23, sustainability_certification, fsc_certified_wood).
measured(s26, sustainability_certification, fsc_certified_wood).

all_consistent(sustainability_certification) :-
    (indep(s26), consistent(s26, sustainability_certification) ; \+indep(s26)),
    consistent(s23, sustainability_certification).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, fsc_certified_wood)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

0.90::acc(smerchant, laminate).
0.85::acc(s27, laminate).
0.50::acc(s28, laminate).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values triax_fiberglass=Triax_Fiberglass mystery_glass=Mystery_Glass
% @importance 0.85

0.85::true_val(laminate, triax_fiberglass); 0.15::true_val(laminate, mystery_glass).

measured(smerchant, laminate, triax_fiberglass).
measured(s27, laminate, triax_fiberglass).
measured(s28, laminate, mystery_glass).

all_consistent(laminate) :-
    (indep(smerchant), consistent(smerchant, laminate) ; \+indep(smerchant)),
    consistent(s27, laminate),
    (indep(s28), consistent(s28, laminate) ; \+indep(s28)).

evidence(all_consistent(laminate)).
query(true_val(laminate, triax_fiberglass)).
query(true_val(laminate, mystery_glass)).

0.93::acc(smerchant, base_material).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_wfo=Sintered_WFO unk_base_material=Unknown
% @importance 0.85

0.95::true_val(base_material, sintered_wfo); 0.05::true_val(base_material, unk_base_material).

measured(smerchant, base_material, sintered_wfo).

all_consistent(base_material) :- consistent(smerchant, base_material).

evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_wfo)).
query(true_val(base_material, unk_base_material)).

0.85::acc(s27, base_type).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values sintered=Sintered unk_base_type=Unknown
% @importance 0.85

0.76::true_val(base_type, sintered); 0.24::true_val(base_type, unk_base_type).

measured(s27, base_type, sintered).

all_consistent(base_type) :- consistent(s27, base_type).

evidence(all_consistent(base_type)).
query(true_val(base_type, sintered)).
query(true_val(base_type, unk_base_type)).

0.90::acc(smerchant, resin).
0.85::acc(s29, resin).

% @attr resin
% @type categorical
% @canonical false
% @original_name resin
% @values super_sap_epoxy=Super_Sap_Epoxy_bio_based unk_resin=Unknown
% @importance 0.70

0.95::true_val(resin, super_sap_epoxy); 0.05::true_val(resin, unk_resin).

measured(smerchant, resin, super_sap_epoxy).
measured(s29, resin, super_sap_epoxy).

all_consistent(resin) :-
    (indep(smerchant), consistent(smerchant, resin) ; \+indep(smerchant)),
    consistent(s29, resin).

evidence(all_consistent(resin)).
query(true_val(resin, super_sap_epoxy)).
query(true_val(resin, unk_resin)).

0.90::acc(smerchant, mounting_pattern).
0.85::acc(s30, mounting_pattern).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values the_channel=The_Channel unk_mounting_pattern=Unknown
% @importance 0.875

0.95::true_val(mounting_pattern, the_channel); 0.05::true_val(mounting_pattern, unk_mounting_pattern).

measured(smerchant, mounting_pattern, the_channel).
measured(s30, mounting_pattern, the_channel).

all_consistent(mounting_pattern) :-
    (indep(smerchant), consistent(smerchant, mounting_pattern) ; \+indep(smerchant)),
    consistent(s30, mounting_pattern).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, the_channel)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

0.90::acc(smerchant, construction_infinite_ride).
0.82::acc(s31, construction_infinite_ride).

% @attr construction_infinite_ride
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Infinite Ride)
% @values infinite_ride=Infinite_Ride_factory_broken_in unk_construction_infinite_ride=Unknown
% @importance 0.775

0.95::true_val(construction_infinite_ride, infinite_ride); 0.05::true_val(construction_infinite_ride, unk_construction_infinite_ride).

measured(smerchant, construction_infinite_ride, infinite_ride).
measured(s31, construction_infinite_ride, infinite_ride).

all_consistent(construction_infinite_ride) :-
    (indep(smerchant), consistent(smerchant, construction_infinite_ride) ; \+indep(smerchant)),
    consistent(s31, construction_infinite_ride).

evidence(all_consistent(construction_infinite_ride)).
query(true_val(construction_infinite_ride, infinite_ride)).
query(true_val(construction_infinite_ride, unk_construction_infinite_ride)).

0.90::acc(smerchant, construction_pro_tip).
0.82::acc(s32, construction_pro_tip).

% @attr construction_pro_tip
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Pro-Tip)
% @values pro_tip=Pro_Tip_tapered_tip_tail unk_construction_pro_tip=Unknown
% @importance 0.75

0.95::true_val(construction_pro_tip, pro_tip); 0.05::true_val(construction_pro_tip, unk_construction_pro_tip).

measured(smerchant, construction_pro_tip, pro_tip).
measured(s32, construction_pro_tip, pro_tip).

all_consistent(construction_pro_tip) :-
    (indep(smerchant), consistent(smerchant, construction_pro_tip) ; \+indep(smerchant)),
    consistent(s32, construction_pro_tip).

evidence(all_consistent(construction_pro_tip)).
query(true_val(construction_pro_tip, pro_tip)).
query(true_val(construction_pro_tip, unk_construction_pro_tip)).

0.90::acc(smerchant, construction_setback_sidecut).

% @attr construction_setback_sidecut
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Setback camber sidecut)
% @values setback_camber_centred_sidecut=Setback_camber_stance_centred_sidecut unk_construction_setback_sidecut=Unknown
% @importance 0.85

0.95::true_val(construction_setback_sidecut, setback_camber_centred_sidecut); 0.05::true_val(construction_setback_sidecut, unk_construction_setback_sidecut).

measured(smerchant, construction_setback_sidecut, setback_camber_centred_sidecut).

all_consistent(construction_setback_sidecut) :- consistent(smerchant, construction_setback_sidecut).

evidence(all_consistent(construction_setback_sidecut)).
query(true_val(construction_setback_sidecut, setback_camber_centred_sidecut)).
query(true_val(construction_setback_sidecut, unk_construction_setback_sidecut)).

0.70::acc(s33, factory_wax).

% @attr factory_wax
% @type categorical
% @canonical false
% @original_name Factory wax
% @values factory_waxed_rewax_recommended=Factory_waxed_rewax_before_first_use unk_factory_wax=Unknown
% @importance 0.55

0.34::true_val(factory_wax, factory_waxed_rewax_recommended); 0.66::true_val(factory_wax, unk_factory_wax).

measured(s33, factory_wax, factory_waxed_rewax_recommended).

all_consistent(factory_wax) :- consistent(s33, factory_wax).

evidence(all_consistent(factory_wax)).
query(true_val(factory_wax, factory_waxed_rewax_recommended)).
query(true_val(factory_wax, unk_factory_wax)).

0.90::acc(s34, warranty).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values three_year=3_year_warranty_from_purchase unk_warranty=Unknown
% @importance 0.80

0.86::true_val(warranty, three_year); 0.14::true_val(warranty, unk_warranty).

measured(s34, warranty, three_year).

all_consistent(warranty) :- consistent(s34, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, three_year)).
query(true_val(warranty, unk_warranty)).

0.82::acc(s35, price_usd_msrp).
0.80::acc(s36, price_usd_msrp).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v529_95=529.95 unk_price_usd_msrp=Unknown
% @importance 0.925

0.95::true_val(price_usd_msrp, v529_95); 0.05::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s35, price_usd_msrp, v529_95).
measured(s36, price_usd_msrp, v529_95).

all_consistent(price_usd_msrp) :-
    consistent(s35, price_usd_msrp),
    consistent(s36, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v529_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

0.80::acc(s37, price_usd_ski_bum).

% @attr price_usd_ski_bum
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at The Ski Bum (sale)
% @values v423_96=423.96 unk_price_usd_ski_bum=Unknown
% @importance 0.90

0.59::true_val(price_usd_ski_bum, v423_96); 0.41::true_val(price_usd_ski_bum, unk_price_usd_ski_bum).

measured(s37, price_usd_ski_bum, v423_96).

all_consistent(price_usd_ski_bum) :- consistent(s37, price_usd_ski_bum).

evidence(all_consistent(price_usd_ski_bum)).
query(true_val(price_usd_ski_bum, v423_96)).
query(true_val(price_usd_ski_bum, unk_price_usd_ski_bum)).

0.85::acc(s38, price_usd_the_house).

% @attr price_usd_the_house
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at The House (sale)
% @values v370_95=370.95 unk_price_usd_the_house=Unknown
% @importance 0.90

0.67::true_val(price_usd_the_house, v370_95); 0.33::true_val(price_usd_the_house, unk_price_usd_the_house).

measured(s38, price_usd_the_house, v370_95).

all_consistent(price_usd_the_house) :- consistent(s38, price_usd_the_house).

evidence(all_consistent(price_usd_the_house)).
query(true_val(price_usd_the_house, v370_95)).
query(true_val(price_usd_the_house, unk_price_usd_the_house)).

0.80::acc(s39, price_usd_evo).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_evo
% @values v370_96=370.96 unk_price_usd_evo=Unknown
% @importance 0.90

0.64::true_val(price_usd_evo, v370_96); 0.36::true_val(price_usd_evo, unk_price_usd_evo).

measured(s39, price_usd_evo, v370_96).

all_consistent(price_usd_evo) :- consistent(s39, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v370_96)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

0.80::acc(s40, price_usd_ski_country).

% @attr price_usd_ski_country
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at Ski Country Sports (sale)
% @values v418_98=418.98 unk_price_usd_ski_country=Unknown
% @importance 0.85

0.59::true_val(price_usd_ski_country, v418_98); 0.41::true_val(price_usd_ski_country, unk_price_usd_ski_country).

measured(s40, price_usd_ski_country, v418_98).

all_consistent(price_usd_ski_country) :- consistent(s40, price_usd_ski_country).

evidence(all_consistent(price_usd_ski_country)).
query(true_val(price_usd_ski_country, v418_98)).
query(true_val(price_usd_ski_country, unk_price_usd_ski_country)).

0.78::acc(s41, price_usd_source_boards).

% @attr price_usd_source_boards
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at Source Boards (sale)
% @values v462_00=462.0 unk_price_usd_source_boards=Unknown
% @importance 0.85

0.54::true_val(price_usd_source_boards, v462_00); 0.46::true_val(price_usd_source_boards, unk_price_usd_source_boards).

measured(s41, price_usd_source_boards, v462_00).

all_consistent(price_usd_source_boards) :- consistent(s41, price_usd_source_boards).

evidence(all_consistent(price_usd_source_boards)).
query(true_val(price_usd_source_boards, v462_00)).
query(true_val(price_usd_source_boards, unk_price_usd_source_boards)).

0.82::acc(s35, price_usd_evo_full).

% @attr price_usd_evo_full
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_evo (full price)
% @values v529_95=529.95 unk_price_usd_evo_full=Unknown
% @importance 0.95

0.68::true_val(price_usd_evo_full, v529_95); 0.32::true_val(price_usd_evo_full, unk_price_usd_evo_full).

measured(s35, price_usd_evo_full, v529_95).

all_consistent(price_usd_evo_full) :- consistent(s35, price_usd_evo_full).

evidence(all_consistent(price_usd_evo_full)).
query(true_val(price_usd_evo_full, v529_95)).
query(true_val(price_usd_evo_full, unk_price_usd_evo_full)).

0.80::acc(s36, price_usd_eriks).

% @attr price_usd_eriks
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at ERIK'S
% @values v529_95=529.95 unk_price_usd_eriks=Unknown
% @importance 0.90

0.63::true_val(price_usd_eriks, v529_95); 0.37::true_val(price_usd_eriks, unk_price_usd_eriks).

measured(s36, price_usd_eriks, v529_95).

all_consistent(price_usd_eriks) :- consistent(s36, price_usd_eriks).

evidence(all_consistent(price_usd_eriks)).
query(true_val(price_usd_eriks, v529_95)).
query(true_val(price_usd_eriks, unk_price_usd_eriks)).

0.88::acc(s42, price_usd_rei).

% @attr price_usd_rei
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_rei
% @values v211_83=211.83 unk_price_usd_rei=Unknown
% @importance 0.90

0.81::true_val(price_usd_rei, v211_83); 0.19::true_val(price_usd_rei, unk_price_usd_rei).

measured(s42, price_usd_rei, v211_83).

all_consistent(price_usd_rei) :- consistent(s42, price_usd_rei).

evidence(all_consistent(price_usd_rei)).
query(true_val(price_usd_rei, v211_83)).
query(true_val(price_usd_rei, unk_price_usd_rei)).

0.78::acc(s43, price_cad_burton_canada).

% @attr price_cad_burton_canada
% @type numeric
% @unit CAD
% @canonical false
% @original_name Price (CAD, Burton Canada)
% @values v649_99=649.99 unk_price_cad_burton_canada=Unknown
% @importance 0.80

0.64::true_val(price_cad_burton_canada, v649_99); 0.36::true_val(price_cad_burton_canada, unk_price_cad_burton_canada).

measured(s43, price_cad_burton_canada, v649_99).

all_consistent(price_cad_burton_canada) :- consistent(s43, price_cad_burton_canada).

evidence(all_consistent(price_cad_burton_canada)).
query(true_val(price_cad_burton_canada, v649_99)).
query(true_val(price_cad_burton_canada, unk_price_cad_burton_canada)).

0.78::acc(s39, price_eur_snowcountry).

% @attr price_eur_snowcountry
% @type numeric
% @unit EUR
% @canonical false
% @original_name Price (EUR, SnowCountry)
% @values v439_96=439.96 unk_price_eur_snowcountry=Unknown
% @importance 0.90

0.64::true_val(price_eur_snowcountry, v439_96); 0.36::true_val(price_eur_snowcountry, unk_price_eur_snowcountry).

measured(s39, price_eur_snowcountry, v439_96).

all_consistent(price_eur_snowcountry) :- consistent(s39, price_eur_snowcountry).

evidence(all_consistent(price_eur_snowcountry)).
query(true_val(price_eur_snowcountry, v439_96)).
query(true_val(price_eur_snowcountry, unk_price_eur_snowcountry)).

0.93::acc(smerchant, price_aud_merchant).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v639_99=639.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.95::true_val(price_aud_merchant, v639_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(smerchant, price_aud_merchant, v639_99).

all_consistent(price_aud_merchant) :- consistent(smerchant, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v639_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

0.93::acc(smerchant, shipping_restriction_merchant).

% @attr shipping_restriction_merchant
% @type categorical
% @canonical false
% @original_name Merchant shipping restriction
% @values australia_only=Only_available_shipping_within_Australia unk_shipping_restriction_merchant=Unknown
% @importance 0.85

0.95::true_val(shipping_restriction_merchant, australia_only); 0.05::true_val(shipping_restriction_merchant, unk_shipping_restriction_merchant).

measured(smerchant, shipping_restriction_merchant, australia_only).

all_consistent(shipping_restriction_merchant) :- consistent(smerchant, shipping_restriction_merchant).

evidence(all_consistent(shipping_restriction_merchant)).
query(true_val(shipping_restriction_merchant, australia_only)).
query(true_val(shipping_restriction_merchant, unk_shipping_restriction_merchant)).

0.90::acc(s1, availability_status).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status (Burton.com)
% @values available_burton=Available_Burton_com unk_availability_status=Unknown
% @importance 1.0

0.81::true_val(availability_status, available_burton); 0.19::true_val(availability_status, unk_availability_status).

measured(s1, availability_status, available_burton).

all_consistent(availability_status) :- consistent(s1, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, available_burton)).
query(true_val(availability_status, unk_availability_status)).

0.85::acc(s44, availability_status_evo).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status (evo.com)
% @values in_stock=In_stock unk_availability_status_evo=Unknown
% @importance 0.80

0.72::true_val(availability_status_evo, in_stock); 0.28::true_val(availability_status_evo, unk_availability_status_evo).

measured(s44, availability_status_evo, in_stock).

all_consistent(availability_status_evo) :- consistent(s44, availability_status_evo).

evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, in_stock)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

0.82::acc(s45, availability_status_backcountry).

% @attr availability_status_backcountry
% @type categorical
% @canonical false
% @original_name availability_status (Backcountry.com)
% @values available=Available unk_availability_status_backcountry=Unknown
% @importance 0.75

0.68::true_val(availability_status_backcountry, available); 0.32::true_val(availability_status_backcountry, unk_availability_status_backcountry).

measured(s45, availability_status_backcountry, available).

all_consistent(availability_status_backcountry) :- consistent(s45, availability_status_backcountry).

evidence(all_consistent(availability_status_backcountry)).
query(true_val(availability_status_backcountry, available)).
query(true_val(availability_status_backcountry, unk_availability_status_backcountry)).

0.88::acc(s42, availability_status_rei).

% @attr availability_status_rei
% @type categorical
% @canonical false
% @original_name availability_status (REI)
% @values discontinued_clearance=Discontinued_clearance_2024_2025 unk_availability_status_rei=Unknown
% @importance 0.90

0.81::true_val(availability_status_rei, discontinued_clearance); 0.19::true_val(availability_status_rei, unk_availability_status_rei).

measured(s42, availability_status_rei, discontinued_clearance).

all_consistent(availability_status_rei) :- consistent(s42, availability_status_rei).

evidence(all_consistent(availability_status_rei)).
query(true_val(availability_status_rei, discontinued_clearance)).
query(true_val(availability_status_rei, unk_availability_status_rei)).

0.72::acc(s18, availability_status_peter_glenn).

% @attr availability_status_peter_glenn
% @type categorical
% @canonical false
% @original_name availability_status (Peter Glenn)
% @values available=Available unk_availability_status_peter_glenn=Unknown
% @importance 0.75

0.60::true_val(availability_status_peter_glenn, available); 0.40::true_val(availability_status_peter_glenn, unk_availability_status_peter_glenn).

measured(s18, availability_status_peter_glenn, available).

all_consistent(availability_status_peter_glenn) :- consistent(s18, availability_status_peter_glenn).

evidence(all_consistent(availability_status_peter_glenn)).
query(true_val(availability_status_peter_glenn, available)).
query(true_val(availability_status_peter_glenn, unk_availability_status_peter_glenn)).

0.85::acc(s38, availability_status_the_house).

% @attr availability_status_the_house
% @type categorical
% @canonical false
% @original_name availability_status (The House)
% @values available=Available unk_availability_status_the_house=Unknown
% @importance 0.90

0.67::true_val(availability_status_the_house, available); 0.33::true_val(availability_status_the_house, unk_availability_status_the_house).

measured(s38, availability_status_the_house, available).

all_consistent(availability_status_the_house) :- consistent(s38, availability_status_the_house).

evidence(all_consistent(availability_status_the_house)).
query(true_val(availability_status_the_house, available)).
query(true_val(availability_status_the_house, unk_availability_status_the_house)).

0.80::acc(s37, availability_status_ski_bum).

% @attr availability_status_ski_bum
% @type categorical
% @canonical false
% @original_name availability_status (The Ski Bum)
% @values available=Available unk_availability_status_ski_bum=Unknown
% @importance 0.90

0.59::true_val(availability_status_ski_bum, available); 0.41::true_val(availability_status_ski_bum, unk_availability_status_ski_bum).

measured(s37, availability_status_ski_bum, available).

all_consistent(availability_status_ski_bum) :- consistent(s37, availability_status_ski_bum).

evidence(all_consistent(availability_status_ski_bum)).
query(true_val(availability_status_ski_bum, available)).
query(true_val(availability_status_ski_bum, unk_availability_status_ski_bum)).

0.80::acc(s36, availability_status_eriks).
0.80::acc(s46, availability_status_eriks).

% @attr availability_status_eriks
% @type categorical
% @canonical false
% @original_name availability_status (ERIK'S)
% @values closeout=Closeout_item unk_availability_status_eriks=Unknown
% @importance 0.825

0.95::true_val(availability_status_eriks, closeout); 0.05::true_val(availability_status_eriks, unk_availability_status_eriks).

measured(s36, availability_status_eriks, closeout).
measured(s46, availability_status_eriks, closeout).

all_consistent(availability_status_eriks) :-
    consistent(s36, availability_status_eriks),
    consistent(s46, availability_status_eriks).

evidence(all_consistent(availability_status_eriks)).
query(true_val(availability_status_eriks, closeout)).
query(true_val(availability_status_eriks, unk_availability_status_eriks)).

0.78::acc(s47, availability_status_focus).

% @attr availability_status_focus
% @type categorical
% @canonical false
% @original_name availability_status (Focus Boardshop)
% @values backordered_154=Backordered_154cm unk_availability_status_focus=Unknown
% @importance 0.70

0.59::true_val(availability_status_focus, backordered_154); 0.41::true_val(availability_status_focus, unk_availability_status_focus).

measured(s47, availability_status_focus, backordered_154).

all_consistent(availability_status_focus) :- consistent(s47, availability_status_focus).

evidence(all_consistent(availability_status_focus)).
query(true_val(availability_status_focus, backordered_154)).
query(true_val(availability_status_focus, unk_availability_status_focus)).

0.78::acc(s40, availability_status_ski_country).

% @attr availability_status_ski_country
% @type categorical
% @canonical false
% @original_name availability_status (Ski Country Sports)
% @values some_backordered=Some_sizes_backordered unk_availability_status_ski_country=Unknown
% @importance 0.85

0.59::true_val(availability_status_ski_country, some_backordered); 0.41::true_val(availability_status_ski_country, unk_availability_status_ski_country).

measured(s40, availability_status_ski_country, some_backordered).

all_consistent(availability_status_ski_country) :- consistent(s40, availability_status_ski_country).

evidence(all_consistent(availability_status_ski_country)).
query(true_val(availability_status_ski_country, some_backordered)).
query(true_val(availability_status_ski_country, unk_availability_status_ski_country)).

0.78::acc(s19, availability_status_blauer).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status (Blauer Board Shop)
% @values available=Available unk_availability_status_blauer=Unknown
% @importance 0.85

0.63::true_val(availability_status_blauer, available); 0.37::true_val(availability_status_blauer, unk_availability_status_blauer).

measured(s19, availability_status_blauer, available).

all_consistent(availability_status_blauer) :- consistent(s19, availability_status_blauer).

evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, available)).
query(true_val(availability_status_blauer, unk_availability_status_blauer)).

0.75::acc(s48, availability_status_corbetts).

% @attr availability_status_corbetts
% @type categorical
% @canonical false
% @original_name availability_status (Corbetts)
% @values available=Available unk_availability_status_corbetts=Unknown
% @importance 0.50

0.52::true_val(availability_status_corbetts, available); 0.48::true_val(availability_status_corbetts, unk_availability_status_corbetts).

measured(s48, availability_status_corbetts, available).

all_consistent(availability_status_corbetts) :- consistent(s48, availability_status_corbetts).

evidence(all_consistent(availability_status_corbetts)).
query(true_val(availability_status_corbetts, available)).
query(true_val(availability_status_corbetts, unk_availability_status_corbetts)).

0.75::acc(s49, availability_status_pathfinder).

% @attr availability_status_pathfinder
% @type categorical
% @canonical false
% @original_name availability_status (Pathfinder of WV)
% @values available=Available unk_availability_status_pathfinder=Unknown
% @importance 0.50

0.54::true_val(availability_status_pathfinder, available); 0.46::true_val(availability_status_pathfinder, unk_availability_status_pathfinder).

measured(s49, availability_status_pathfinder, available).

all_consistent(availability_status_pathfinder) :- consistent(s49, availability_status_pathfinder).

evidence(all_consistent(availability_status_pathfinder)).
query(true_val(availability_status_pathfinder, available)).
query(true_val(availability_status_pathfinder, unk_availability_status_pathfinder)).

0.78::acc(s50, availability_status_amazon).

% @attr availability_status_amazon
% @type categorical
% @canonical false
% @original_name availability_status (Amazon.com)
% @values available=Available unk_availability_status_amazon=Unknown
% @importance 0.60

0.60::true_val(availability_status_amazon, available); 0.40::true_val(availability_status_amazon, unk_availability_status_amazon).

measured(s50, availability_status_amazon, available).

all_consistent(availability_status_amazon) :- consistent(s50, availability_status_amazon).

evidence(all_consistent(availability_status_amazon)).
query(true_val(availability_status_amazon, available)).
query(true_val(availability_status_amazon, unk_availability_status_amazon)).

0.78::acc(s9, availability_status_melbourne).

% @attr availability_status_melbourne
% @type categorical
% @canonical false
% @original_name availability_status (Melbourne Snowboard Centre)
% @values available=Available unk_availability_status_melbourne=Unknown
% @importance 0.90

0.67::true_val(availability_status_melbourne, available); 0.33::true_val(availability_status_melbourne, unk_availability_status_melbourne).

measured(s9, availability_status_melbourne, available).

all_consistent(availability_status_melbourne) :- consistent(s9, availability_status_melbourne).

evidence(all_consistent(availability_status_melbourne)).
query(true_val(availability_status_melbourne, available)).
query(true_val(availability_status_melbourne, unk_availability_status_melbourne)).

0.72::acc(s51, availability_status_tustablas).

% @attr availability_status_tustablas
% @type categorical
% @canonical false
% @original_name availability_status (TusTablas.com)
% @values available=Available unk_availability_status_tustablas=Unknown
% @importance 0.50

0.44::true_val(availability_status_tustablas, available); 0.56::true_val(availability_status_tustablas, unk_availability_status_tustablas).

measured(s51, availability_status_tustablas, available).

all_consistent(availability_status_tustablas) :- consistent(s51, availability_status_tustablas).

evidence(all_consistent(availability_status_tustablas)).
query(true_val(availability_status_tustablas, available)).
query(true_val(availability_status_tustablas, unk_availability_status_tustablas)).

0.90::acc(s52, manufacturer).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values burton_snowboards_bcorp=Burton_Snowboards_B_Corp_Burlington_VT unk_manufacturer=Unknown
% @importance 0.70

0.76::true_val(manufacturer, burton_snowboards_bcorp); 0.24::true_val(manufacturer, unk_manufacturer).

measured(s52, manufacturer, burton_snowboards_bcorp).

all_consistent(manufacturer) :- consistent(s52, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, burton_snowboards_bcorp)).
query(true_val(manufacturer, unk_manufacturer)).

0.85::acc(s52, manufacturer_reputation).

% @attr manufacturer_reputation
% @type categorical
% @canonical false
% @original_name Manufacturer reputation
% @values world_largest_pioneer=Worlds_largest_snowboard_manufacturer_pioneer_since_1977 unk_manufacturer_reputation=Unknown
% @importance 0.70

0.76::true_val(manufacturer_reputation, world_largest_pioneer); 0.24::true_val(manufacturer_reputation, unk_manufacturer_reputation).

measured(s52, manufacturer_reputation, world_largest_pioneer).

all_consistent(manufacturer_reputation) :- consistent(s52, manufacturer_reputation).

evidence(all_consistent(manufacturer_reputation)).
query(true_val(manufacturer_reputation, world_largest_pioneer)).
query(true_val(manufacturer_reputation, unk_manufacturer_reputation)).

0.88::acc(s16, on_snow_feel_tgr).

% @attr on_snow_feel_tgr
% @type categorical
% @canonical true
% @original_name on_snow_feel_tgr
% @values semi_locked_in_tracks_well=Semi_locked_in_tracks_well_hard_to_skid unk_on_snow_feel_tgr=Unknown
% @importance 0.85

0.76::true_val(on_snow_feel_tgr, semi_locked_in_tracks_well); 0.24::true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr).

measured(s16, on_snow_feel_tgr, semi_locked_in_tracks_well).

all_consistent(on_snow_feel_tgr) :- consistent(s16, on_snow_feel_tgr).

evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, semi_locked_in_tracks_well)).
query(true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr)).

0.85::acc(s53, turn_initiation_performance).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values quick_for_waist_width=Turns_quickly_for_25_5cm_waist_turny_sidecut unk_turn_initiation_performance=Unknown
% @importance 0.75

0.72::true_val(turn_initiation_performance, quick_for_waist_width); 0.28::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s53, turn_initiation_performance, quick_for_waist_width).

all_consistent(turn_initiation_performance) :- consistent(s53, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, quick_for_waist_width)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

0.85::acc(s54, positive_aspect).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect (ollie power)
% @values ollie_power_easy_pops_well=Ollie_power_easy_to_access_pops_well unk_positive_aspect=Unknown
% @importance 0.70

0.72::true_val(positive_aspect, ollie_power_easy_pops_well); 0.28::true_val(positive_aspect, unk_positive_aspect).

measured(s54, positive_aspect, ollie_power_easy_pops_well).

all_consistent(positive_aspect) :- consistent(s54, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, ollie_power_easy_pops_well)).
query(true_val(positive_aspect, unk_positive_aspect)).

0.85::acc(s54, reviewer_opinion_the_good_ride_buttering).

% @attr reviewer_opinion_the_good_ride_buttering
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (buttering)
% @values butters_well_tail_effort_nose_easy=Butters_well_off_tail_with_effort_nose_easier unk_reviewer_opinion_the_good_ride_buttering=Unknown
% @importance 0.70

0.72::true_val(reviewer_opinion_the_good_ride_buttering, butters_well_tail_effort_nose_easy); 0.28::true_val(reviewer_opinion_the_good_ride_buttering, unk_reviewer_opinion_the_good_ride_buttering).

measured(s54, reviewer_opinion_the_good_ride_buttering, butters_well_tail_effort_nose_easy).

all_consistent(reviewer_opinion_the_good_ride_buttering) :- consistent(s54, reviewer_opinion_the_good_ride_buttering).

evidence(all_consistent(reviewer_opinion_the_good_ride_buttering)).
query(true_val(reviewer_opinion_the_good_ride_buttering, butters_well_tail_effort_nose_easy)).
query(true_val(reviewer_opinion_the_good_ride_buttering, unk_reviewer_opinion_the_good_ride_buttering)).

0.85::acc(s55, reviewer_opinion_the_good_ride_dampness).

% @attr reviewer_opinion_the_good_ride_dampness
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (dampness)
% @values pretty_damp_handles_uneven_snow=Pretty_damp_handles_uneven_snow_incredibly_well unk_reviewer_opinion_the_good_ride_dampness=Unknown
% @importance 0.80

0.72::true_val(reviewer_opinion_the_good_ride_dampness, pretty_damp_handles_uneven_snow); 0.28::true_val(reviewer_opinion_the_good_ride_dampness, unk_reviewer_opinion_the_good_ride_dampness).

measured(s55, reviewer_opinion_the_good_ride_dampness, pretty_damp_handles_uneven_snow).

all_consistent(reviewer_opinion_the_good_ride_dampness) :- consistent(s55, reviewer_opinion_the_good_ride_dampness).

evidence(all_consistent(reviewer_opinion_the_good_ride_dampness)).
query(true_val(reviewer_opinion_the_good_ride_dampness, pretty_damp_handles_uneven_snow)).
query(true_val(reviewer_opinion_the_good_ride_dampness, unk_reviewer_opinion_the_good_ride_dampness)).

0.85::acc(s55, reviewer_opinion_the_good_ride_straight_line).

% @attr reviewer_opinion_the_good_ride_straight_line
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (straight line)
% @values can_hang_not_bomber=Can_hang_occasional_straight_line_not_a_bomber unk_reviewer_opinion_the_good_ride_straight_line=Unknown
% @importance 0.80

0.72::true_val(reviewer_opinion_the_good_ride_straight_line, can_hang_not_bomber); 0.28::true_val(reviewer_opinion_the_good_ride_straight_line, unk_reviewer_opinion_the_good_ride_straight_line).

measured(s55, reviewer_opinion_the_good_ride_straight_line, can_hang_not_bomber).

all_consistent(reviewer_opinion_the_good_ride_straight_line) :- consistent(s55, reviewer_opinion_the_good_ride_straight_line).

evidence(all_consistent(reviewer_opinion_the_good_ride_straight_line)).
query(true_val(reviewer_opinion_the_good_ride_straight_line, can_hang_not_bomber)).
query(true_val(reviewer_opinion_the_good_ride_straight_line, unk_reviewer_opinion_the_good_ride_straight_line)).

0.85::acc(s56, powder_rating_tgr).

% @attr powder_rating_tgr
% @type categorical
% @canonical true
% @original_name powder_rating_tgr
% @values pretty_well_3_5_inches=Did_pretty_well_in_3_to_5_inches_powder unk_powder_rating_tgr=Unknown
% @importance 0.85

0.64::true_val(powder_rating_tgr, pretty_well_3_5_inches); 0.36::true_val(powder_rating_tgr, unk_powder_rating_tgr).

measured(s56, powder_rating_tgr, pretty_well_3_5_inches).

all_consistent(powder_rating_tgr) :- consistent(s56, powder_rating_tgr).

evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, pretty_well_3_5_inches)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

0.88::acc(s57, negative_aspect).
0.88::acc(s58, negative_aspect).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect (edge hold)
% @values poor_edge_hold_hard_snow=Poor_edge_hold_washy_deeper_carves_not_ideal_hard_snow unk_negative_aspect=Unknown
% @importance 0.90

0.95::true_val(negative_aspect, poor_edge_hold_hard_snow); 0.05::true_val(negative_aspect, unk_negative_aspect).

measured(s57, negative_aspect, poor_edge_hold_hard_snow).
measured(s58, negative_aspect, poor_edge_hold_hard_snow).

all_consistent(negative_aspect) :-
    consistent(s57, negative_aspect),
    consistent(s58, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, poor_edge_hold_hard_snow)).
query(true_val(negative_aspect, unk_negative_aspect)).

0.85::acc(s59, base_glide_performance).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values improved_2025_good_for_price=Base_improved_2025_good_for_price_point unk_base_glide_performance=Unknown
% @importance 0.80

0.72::true_val(base_glide_performance, improved_2025_good_for_price); 0.28::true_val(base_glide_performance, unk_base_glide_performance).

measured(s59, base_glide_performance, improved_2025_good_for_price).

all_consistent(base_glide_performance) :- consistent(s59, base_glide_performance).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, improved_2025_good_for_price)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

0.85::acc(s60, positive_aspect_carve_spring).

% @attr positive_aspect_carve_spring
% @type categorical
% @canonical false
% @original_name positive_aspect (carve spring)
% @values great_spring_out_of_carve=Springs_well_out_of_hard_carve_good_conditions unk_positive_aspect_carve_spring=Unknown
% @importance 0.75

0.72::true_val(positive_aspect_carve_spring, great_spring_out_of_carve); 0.28::true_val(positive_aspect_carve_spring, unk_positive_aspect_carve_spring).

measured(s60, positive_aspect_carve_spring, great_spring_out_of_carve).

all_consistent(positive_aspect_carve_spring) :- consistent(s60, positive_aspect_carve_spring).

evidence(all_consistent(positive_aspect_carve_spring)).
query(true_val(positive_aspect_carve_spring, great_spring_out_of_carve)).
query(true_val(positive_aspect_carve_spring, unk_positive_aspect_carve_spring)).

0.85::acc(s61, board_weight_grams).

% @attr board_weight_grams
% @type categorical
% @canonical true
% @original_name board_weight_grams
% @values middle_for_size_not_published=Middle_weight_for_size_exact_not_published unk_board_weight_grams=Unknown
% @importance 0.65

0.72::true_val(board_weight_grams, middle_for_size_not_published); 0.28::true_val(board_weight_grams, unk_board_weight_grams).

measured(s61, board_weight_grams, middle_for_size_not_published).

all_consistent(board_weight_grams) :- consistent(s61, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, middle_for_size_not_published)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

0.88::acc(s62, recommended_boot_size_165).

% @attr recommended_boot_size_165
% @type categorical
% @canonical true
% @original_name recommended_boot_size_165
% @values boot_chart_us=149_US8_9_154_US8p5_9p5_159_US9p5_10p5_162_US10_11_154W_US10_11_159W_US11_12 unk_recommended_boot_size_165=Unknown
% @importance 0.85

0.76::true_val(recommended_boot_size_165, boot_chart_us); 0.24::true_val(recommended_boot_size_165, unk_recommended_boot_size_165).

measured(s62, recommended_boot_size_165, boot_chart_us).

all_consistent(recommended_boot_size_165) :- consistent(s62, recommended_boot_size_165).

evidence(all_consistent(recommended_boot_size_165)).
query(true_val(recommended_boot_size_165, boot_chart_us)).
query(true_val(recommended_boot_size_165, unk_recommended_boot_size_165)).

0.70::acc(s63, user_review_forum).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum (overall)
% @values good_for_progressing_rider=Good_board_for_someone_who_can_turn_moving_from_rentals unk_user_review_forum=Unknown
% @importance 0.80

0.34::true_val(user_review_forum, good_for_progressing_rider); 0.66::true_val(user_review_forum, unk_user_review_forum).

measured(s63, user_review_forum, good_for_progressing_rider).

all_consistent(user_review_forum) :- consistent(s63, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, good_for_progressing_rider)).
query(true_val(user_review_forum, unk_user_review_forum)).

0.70::acc(s64, user_review_forum_turn_initiation).

% @attr user_review_forum_turn_initiation
% @type categorical
% @canonical false
% @original_name user_review_forum (turn initiation)
% @values turns_easily_more_grip=Initiated_turns_easily_more_grip_than_rentals unk_user_review_forum_turn_initiation=Unknown
% @importance 0.75

0.34::true_val(user_review_forum_turn_initiation, turns_easily_more_grip); 0.66::true_val(user_review_forum_turn_initiation, unk_user_review_forum_turn_initiation).

measured(s64, user_review_forum_turn_initiation, turns_easily_more_grip).

all_consistent(user_review_forum_turn_initiation) :- consistent(s64, user_review_forum_turn_initiation).

evidence(all_consistent(user_review_forum_turn_initiation)).
query(true_val(user_review_forum_turn_initiation, turns_easily_more_grip)).
query(true_val(user_review_forum_turn_initiation, unk_user_review_forum_turn_initiation)).

0.65::acc(s65, user_review_forum_weight).

% @attr user_review_forum_weight
% @type categorical
% @canonical false
% @original_name user_review_forum (weight feel)
% @values significantly_lighter_than_rentals=Setup_with_Cartels_felt_significantly_lighter unk_user_review_forum_weight=Unknown
% @importance 0.60

0.28::true_val(user_review_forum_weight, significantly_lighter_than_rentals); 0.72::true_val(user_review_forum_weight, unk_user_review_forum_weight).

measured(s65, user_review_forum_weight, significantly_lighter_than_rentals).

all_consistent(user_review_forum_weight) :- consistent(s65, user_review_forum_weight).

evidence(all_consistent(user_review_forum_weight)).
query(true_val(user_review_forum_weight, significantly_lighter_than_rentals)).
query(true_val(user_review_forum_weight, unk_user_review_forum_weight)).

0.65::acc(s65, user_review_forum_binding_pairing).

% @attr user_review_forum_binding_pairing
% @type categorical
% @canonical false
% @original_name user_review_forum (binding pairing)
% @values cartel_bindings_common=Burton_Cartel_bindings_commonly_paired unk_user_review_forum_binding_pairing=Unknown
% @importance 0.60

0.28::true_val(user_review_forum_binding_pairing, cartel_bindings_common); 0.72::true_val(user_review_forum_binding_pairing, unk_user_review_forum_binding_pairing).

measured(s65, user_review_forum_binding_pairing, cartel_bindings_common).

all_consistent(user_review_forum_binding_pairing) :- consistent(s65, user_review_forum_binding_pairing).

evidence(all_consistent(user_review_forum_binding_pairing)).
query(true_val(user_review_forum_binding_pairing, cartel_bindings_common)).
query(true_val(user_review_forum_binding_pairing, unk_user_review_forum_binding_pairing)).

0.68::acc(s66, user_review_forum_vs_competitors).

% @attr user_review_forum_vs_competitors
% @type categorical
% @canonical false
% @original_name user_review_forum (vs competitors)
% @values better_than_sk_hh_for_intermediates=Better_bet_than_Skeleton_Key_or_Hometown_Hero_for_intermediates unk_user_review_forum_vs_competitors=Unknown
% @importance 0.70

0.32::true_val(user_review_forum_vs_competitors, better_than_sk_hh_for_intermediates); 0.68::true_val(user_review_forum_vs_competitors, unk_user_review_forum_vs_competitors).

measured(s66, user_review_forum_vs_competitors, better_than_sk_hh_for_intermediates).

all_consistent(user_review_forum_vs_competitors) :- consistent(s66, user_review_forum_vs_competitors).

evidence(all_consistent(user_review_forum_vs_competitors)).
query(true_val(user_review_forum_vs_competitors, better_than_sk_hh_for_intermediates)).
query(true_val(user_review_forum_vs_competitors, unk_user_review_forum_vs_competitors)).

0.68::acc(s67, user_review_forum_edge_hold).

% @attr user_review_forum_edge_hold
% @type categorical
% @canonical false
% @original_name user_review_forum (edge hold general)
% @values burton_lacks_edge_disruption=Burton_boards_dont_grip_well_vs_magnetraction unk_user_review_forum_edge_hold=Unknown
% @importance 0.80

0.32::true_val(user_review_forum_edge_hold, burton_lacks_edge_disruption); 0.68::true_val(user_review_forum_edge_hold, unk_user_review_forum_edge_hold).

measured(s67, user_review_forum_edge_hold, burton_lacks_edge_disruption).

all_consistent(user_review_forum_edge_hold) :- consistent(s67, user_review_forum_edge_hold).

evidence(all_consistent(user_review_forum_edge_hold)).
query(true_val(user_review_forum_edge_hold, burton_lacks_edge_disruption)).
query(true_val(user_review_forum_edge_hold, unk_user_review_forum_edge_hold)).

0.88::acc(s57, reviewer_opinion_the_good_ride).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride (summary)
% @values fun_daily_driver_edge_hold_weak=Fun_tapered_directional_daily_driver_edge_hold_could_be_better unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.90

0.76::true_val(reviewer_opinion_the_good_ride, fun_daily_driver_edge_hold_weak); 0.24::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s57, reviewer_opinion_the_good_ride, fun_daily_driver_edge_hold_weak).

all_consistent(reviewer_opinion_the_good_ride) :- consistent(s57, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, fun_daily_driver_edge_hold_weak)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

0.88::acc(s68, reviewer_opinion_the_good_ride_overall).

% @attr reviewer_opinion_the_good_ride_overall
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (overall enjoyment)
% @values really_enjoyed_shape_camber_flex=Really_enjoyed_shape_camber_flex_at_price_point unk_reviewer_opinion_the_good_ride_overall=Unknown
% @importance 0.90

0.76::true_val(reviewer_opinion_the_good_ride_overall, really_enjoyed_shape_camber_flex); 0.24::true_val(reviewer_opinion_the_good_ride_overall, unk_reviewer_opinion_the_good_ride_overall).

measured(s68, reviewer_opinion_the_good_ride_overall, really_enjoyed_shape_camber_flex).

all_consistent(reviewer_opinion_the_good_ride_overall) :- consistent(s68, reviewer_opinion_the_good_ride_overall).

evidence(all_consistent(reviewer_opinion_the_good_ride_overall)).
query(true_val(reviewer_opinion_the_good_ride_overall, really_enjoyed_shape_camber_flex)).
query(true_val(reviewer_opinion_the_good_ride_overall, unk_reviewer_opinion_the_good_ride_overall)).

0.85::acc(s69, reviewer_opinion_the_good_ride_testing).

% @attr reviewer_opinion_the_good_ride_testing
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (testing conditions)
% @values six_plus_days_varied_spring=Tested_6plus_days_varied_spring_hard_soft_powder unk_reviewer_opinion_the_good_ride_testing=Unknown
% @importance 0.50

0.72::true_val(reviewer_opinion_the_good_ride_testing, six_plus_days_varied_spring); 0.28::true_val(reviewer_opinion_the_good_ride_testing, unk_reviewer_opinion_the_good_ride_testing).

measured(s69, reviewer_opinion_the_good_ride_testing, six_plus_days_varied_spring).

all_consistent(reviewer_opinion_the_good_ride_testing) :- consistent(s69, reviewer_opinion_the_good_ride_testing).

evidence(all_consistent(reviewer_opinion_the_good_ride_testing)).
query(true_val(reviewer_opinion_the_good_ride_testing, six_plus_days_varied_spring)).
query(true_val(reviewer_opinion_the_good_ride_testing, unk_reviewer_opinion_the_good_ride_testing)).

0.72::acc(s70, snowboards_eu_assessment).

% @attr snowboards_eu_assessment
% @type categorical
% @canonical false
% @original_name snowboards.eu assessment
% @values versatile_accessible_more_forgiving=Versatile_accessible_snowboard_more_forgiving_than_stiffer_counterparts unk_snowboards_eu_assessment=Unknown
% @importance 0.55

0.41::true_val(snowboards_eu_assessment, versatile_accessible_more_forgiving); 0.59::true_val(snowboards_eu_assessment, unk_snowboards_eu_assessment).

measured(s70, snowboards_eu_assessment, versatile_accessible_more_forgiving).

all_consistent(snowboards_eu_assessment) :- consistent(s70, snowboards_eu_assessment).

evidence(all_consistent(snowboards_eu_assessment)).
query(true_val(snowboards_eu_assessment, versatile_accessible_more_forgiving)).
query(true_val(snowboards_eu_assessment, unk_snowboards_eu_assessment)).

0.75::acc(s71, snowboard_robot_assessment).

% @attr snowboard_robot_assessment
% @type categorical
% @canonical false
% @original_name Snowboard Robot assessment
% @values good_am_directional_heavier_core_sintered=Good_AM_directional_shape_heavier_core_lower_price_sintered_base unk_snowboard_robot_assessment=Unknown
% @importance 0.80

0.51::true_val(snowboard_robot_assessment, good_am_directional_heavier_core_sintered); 0.49::true_val(snowboard_robot_assessment, unk_snowboard_robot_assessment).

measured(s71, snowboard_robot_assessment, good_am_directional_heavier_core_sintered).

all_consistent(snowboard_robot_assessment) :- consistent(s71, snowboard_robot_assessment).

evidence(all_consistent(snowboard_robot_assessment)).
query(true_val(snowboard_robot_assessment, good_am_directional_heavier_core_sintered)).
query(true_val(snowboard_robot_assessment, unk_snowboard_robot_assessment)).

0.88::acc(s68, reviewer_opinion_the_good_ride_value).

% @attr reviewer_opinion_the_good_ride_value
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (value for money)
% @values great_ride_for_price=Great_ride_for_price_point_shape_camber_flex unk_reviewer_opinion_the_good_ride_value=Unknown
% @importance 0.90

0.76::true_val(reviewer_opinion_the_good_ride_value, great_ride_for_price); 0.24::true_val(reviewer_opinion_the_good_ride_value, unk_reviewer_opinion_the_good_ride_value).

measured(s68, reviewer_opinion_the_good_ride_value, great_ride_for_price).

all_consistent(reviewer_opinion_the_good_ride_value) :- consistent(s68, reviewer_opinion_the_good_ride_value).

evidence(all_consistent(reviewer_opinion_the_good_ride_value)).
query(true_val(reviewer_opinion_the_good_ride_value, great_ride_for_price)).
query(true_val(reviewer_opinion_the_good_ride_value, unk_reviewer_opinion_the_good_ride_value)).

0.78::acc(s9, value_assessment_merchant).

% @attr value_assessment_merchant
% @type categorical
% @canonical false
% @original_name Value assessment (Melbourne Snowboard Centre)
% @values big_mtn_without_high_price=Big_mountain_freeride_without_high_end_price_tag unk_value_assessment_merchant=Unknown
% @importance 0.90

0.67::true_val(value_assessment_merchant, big_mtn_without_high_price); 0.33::true_val(value_assessment_merchant, unk_value_assessment_merchant).

measured(s9, value_assessment_merchant, big_mtn_without_high_price).

all_consistent(value_assessment_merchant) :- consistent(s9, value_assessment_merchant).

evidence(all_consistent(value_assessment_merchant)).
query(true_val(value_assessment_merchant, big_mtn_without_high_price)).
query(true_val(value_assessment_merchant, unk_value_assessment_merchant)).

0.62::acc(s72, user_review_forum_discounts).

% @attr user_review_forum_discounts
% @type categorical
% @canonical false
% @original_name user_review_forum (discounts)
% @values easy_to_find_discounts=Burton_boards_easy_to_find_at_good_discounts unk_user_review_forum_discounts=Unknown
% @importance 0.70

0.26::true_val(user_review_forum_discounts, easy_to_find_discounts); 0.74::true_val(user_review_forum_discounts, unk_user_review_forum_discounts).

measured(s72, user_review_forum_discounts, easy_to_find_discounts).

all_consistent(user_review_forum_discounts) :- consistent(s72, user_review_forum_discounts).

evidence(all_consistent(user_review_forum_discounts)).
query(true_val(user_review_forum_discounts, easy_to_find_discounts)).
query(true_val(user_review_forum_discounts, unk_user_review_forum_discounts)).

0.62::acc(s73, user_review_forum_value_critique).

% @attr user_review_forum_value_critique
% @type categorical
% @canonical false
% @original_name user_review_forum (value critique)
% @values expensive_for_materials_tech=A_bit_expensive_for_materials_and_lack_of_tech unk_user_review_forum_value_critique=Unknown
% @importance 0.75

0.28::true_val(user_review_forum_value_critique, expensive_for_materials_tech); 0.72::true_val(user_review_forum_value_critique, unk_user_review_forum_value_critique).

measured(s73, user_review_forum_value_critique, expensive_for_materials_tech).

all_consistent(user_review_forum_value_critique) :- consistent(s73, user_review_forum_value_critique).

evidence(all_consistent(user_review_forum_value_critique)).
query(true_val(user_review_forum_value_critique, expensive_for_materials_tech)).
query(true_val(user_review_forum_value_critique, unk_user_review_forum_value_critique)).

0.85::acc(s74, comparable_board_same_brand).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand (Counterbalance)
% @values counterbalance_2026=Burton_Counterbalance_2026_more_edge_hold_lighter_core_659_95 unk_comparable_board_same_brand=Unknown
% @importance 0.85

0.68::true_val(comparable_board_same_brand, counterbalance_2026); 0.32::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s74, comparable_board_same_brand, counterbalance_2026).

all_consistent(comparable_board_same_brand) :- consistent(s74, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, counterbalance_2026)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

0.82::acc(s75, comparable_board_same_brand_skeleton_key).

% @attr comparable_board_same_brand_skeleton_key
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Skeleton Key)
% @values skeleton_key=Burton_Skeleton_Key_more_surfy_10mm_taper_softer_flex unk_comparable_board_same_brand_skeleton_key=Unknown
% @importance 0.70

0.64::true_val(comparable_board_same_brand_skeleton_key, skeleton_key); 0.36::true_val(comparable_board_same_brand_skeleton_key, unk_comparable_board_same_brand_skeleton_key).

measured(s75, comparable_board_same_brand_skeleton_key, skeleton_key).

all_consistent(comparable_board_same_brand_skeleton_key) :- consistent(s75, comparable_board_same_brand_skeleton_key).

evidence(all_consistent(comparable_board_same_brand_skeleton_key)).
query(true_val(comparable_board_same_brand_skeleton_key, skeleton_key)).
query(true_val(comparable_board_same_brand_skeleton_key, unk_comparable_board_same_brand_skeleton_key)).

0.82::acc(s76, comparable_board_same_brand_flight_attendant).

% @attr comparable_board_same_brand_flight_attendant
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Flight Attendant)
% @values flight_attendant=Burton_Flight_Attendant_stiffer_carbon_stringers_expert unk_comparable_board_same_brand_flight_attendant=Unknown
% @importance 0.70

0.64::true_val(comparable_board_same_brand_flight_attendant, flight_attendant); 0.36::true_val(comparable_board_same_brand_flight_attendant, unk_comparable_board_same_brand_flight_attendant).

measured(s76, comparable_board_same_brand_flight_attendant, flight_attendant).

all_consistent(comparable_board_same_brand_flight_attendant) :- consistent(s76, comparable_board_same_brand_flight_attendant).

evidence(all_consistent(comparable_board_same_brand_flight_attendant)).
query(true_val(comparable_board_same_brand_flight_attendant, flight_attendant)).
query(true_val(comparable_board_same_brand_flight_attendant, unk_comparable_board_same_brand_flight_attendant)).

0.68::acc(s77, comparable_board_cross_brand).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand (Nidecker Escape)
% @values nidecker_escape=Nidecker_Escape_similar_price_AM_Freeride unk_comparable_board_cross_brand=Unknown
% @importance 0.65

0.32::true_val(comparable_board_cross_brand, nidecker_escape); 0.68::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s77, comparable_board_cross_brand, nidecker_escape).

all_consistent(comparable_board_cross_brand) :- consistent(s77, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, nidecker_escape)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

0.62::acc(s78, comparable_board_cross_brand_list).

% @attr comparable_board_cross_brand_list
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (broader list)
% @values multi_brand_list=Jones_Flagship_Rossignol_XV_Lib_Tech_BRD_K2_Manifest_Arbor_Rome_Yes unk_comparable_board_cross_brand_list=Unknown
% @importance 0.65

0.28::true_val(comparable_board_cross_brand_list, multi_brand_list); 0.72::true_val(comparable_board_cross_brand_list, unk_comparable_board_cross_brand_list).

measured(s78, comparable_board_cross_brand_list, multi_brand_list).

all_consistent(comparable_board_cross_brand_list) :- consistent(s78, comparable_board_cross_brand_list).

evidence(all_consistent(comparable_board_cross_brand_list)).
query(true_val(comparable_board_cross_brand_list, multi_brand_list)).
query(true_val(comparable_board_cross_brand_list, unk_comparable_board_cross_brand_list)).

0.82::acc(s29, sustainability_certification_resin).

% @attr sustainability_certification_resin
% @type categorical
% @canonical false
% @original_name sustainability_certification (Super Sap Epoxy)
% @values super_sap_50pct_reduction=Super_Sap_Epoxy_50pct_carbon_reduction unk_sustainability_certification_resin=Unknown
% @importance 0.55

0.76::true_val(sustainability_certification_resin, super_sap_50pct_reduction); 0.24::true_val(sustainability_certification_resin, unk_sustainability_certification_resin).

measured(s29, sustainability_certification_resin, super_sap_50pct_reduction).

all_consistent(sustainability_certification_resin) :- consistent(s29, sustainability_certification_resin).

evidence(all_consistent(sustainability_certification_resin)).
query(true_val(sustainability_certification_resin, super_sap_50pct_reduction)).
query(true_val(sustainability_certification_resin, unk_sustainability_certification_resin)).

0.85::acc(s52, sustainability_certification_company).

% @attr sustainability_certification_company
% @type categorical
% @canonical false
% @original_name sustainability_certification (B Corp)
% @values b_corp_certified=Burton_Snowboards_B_Corp_certified unk_sustainability_certification_company=Unknown
% @importance 0.70

0.76::true_val(sustainability_certification_company, b_corp_certified); 0.24::true_val(sustainability_certification_company, unk_sustainability_certification_company).

measured(s52, sustainability_certification_company, b_corp_certified).

all_consistent(sustainability_certification_company) :- consistent(s52, sustainability_certification_company).

evidence(all_consistent(sustainability_certification_company)).
query(true_val(sustainability_certification_company, b_corp_certified)).
query(true_val(sustainability_certification_company, unk_sustainability_certification_company)).

0.85::acc(s79, return_policy_terms).

% @attr return_policy_terms
% @type categorical
% @canonical true
% @original_name return_policy_terms (evo)
% @values one_year_return=Up_to_one_full_year_to_return unk_return_policy_terms=Unknown
% @importance 0.55

0.72::true_val(return_policy_terms, one_year_return); 0.28::true_val(return_policy_terms, unk_return_policy_terms).

measured(s79, return_policy_terms, one_year_return).

all_consistent(return_policy_terms) :- consistent(s79, return_policy_terms).

evidence(all_consistent(return_policy_terms)).
query(true_val(return_policy_terms, one_year_return)).
query(true_val(return_policy_terms, unk_return_policy_terms)).

0.85::acc(s79, evo_price_match).

% @attr evo_price_match
% @type categorical
% @canonical false
% @original_name evo.com price match
% @values beat_by_5pct=Will_beat_competitor_prices_by_5pct unk_evo_price_match=Unknown
% @importance 0.55

0.72::true_val(evo_price_match, beat_by_5pct); 0.28::true_val(evo_price_match, unk_evo_price_match).

measured(s79, evo_price_match, beat_by_5pct).

all_consistent(evo_price_match) :- consistent(s79, evo_price_match).

evidence(all_consistent(evo_price_match)).
query(true_val(evo_price_match, beat_by_5pct)).
query(true_val(evo_price_match, unk_evo_price_match)).

0.78::acc(s47, return_policy_terms_focus).

% @attr return_policy_terms_focus
% @type categorical
% @canonical false
% @original_name return_policy_terms (Focus Boardshop)
% @values fourteen_day_return=14_day_return_policy_online unk_return_policy_terms_focus=Unknown
% @importance 0.70

0.59::true_val(return_policy_terms_focus, fourteen_day_return); 0.41::true_val(return_policy_terms_focus, unk_return_policy_terms_focus).

measured(s47, return_policy_terms_focus, fourteen_day_return).

all_consistent(return_policy_terms_focus) :- consistent(s47, return_policy_terms_focus).

evidence(all_consistent(return_policy_terms_focus)).
query(true_val(return_policy_terms_focus, fourteen_day_return)).
query(true_val(return_policy_terms_focus, unk_return_policy_terms_focus)).

0.75::acc(s49, return_policy_terms_pathfinder).

% @attr return_policy_terms_pathfinder
% @type categorical
% @canonical false
% @original_name return_policy_terms (Pathfinder of WV)
% @values thirty_day_return=30_day_return_new_unused_original_tags unk_return_policy_terms_pathfinder=Unknown
% @importance 0.50

0.54::true_val(return_policy_terms_pathfinder, thirty_day_return); 0.46::true_val(return_policy_terms_pathfinder, unk_return_policy_terms_pathfinder).

measured(s49, return_policy_terms_pathfinder, thirty_day_return).

all_consistent(return_policy_terms_pathfinder) :- consistent(s49, return_policy_terms_pathfinder).

evidence(all_consistent(return_policy_terms_pathfinder)).
query(true_val(return_policy_terms_pathfinder, thirty_day_return)).
query(true_val(return_policy_terms_pathfinder, unk_return_policy_terms_pathfinder)).

0.78::acc(s80, eriks_added_services).

% @attr eriks_added_services
% @type categorical
% @canonical false
% @original_name ERIK'S added services
% @values free_binding_install_wax=Free_binding_installation_and_wax_with_purchase unk_eriks_added_services=Unknown
% @importance 0.50

0.63::true_val(eriks_added_services, free_binding_install_wax); 0.37::true_val(eriks_added_services, unk_eriks_added_services).

measured(s80, eriks_added_services, free_binding_install_wax).

all_consistent(eriks_added_services) :- consistent(s80, eriks_added_services).

evidence(all_consistent(eriks_added_services)).
query(true_val(eriks_added_services, free_binding_install_wax)).
query(true_val(eriks_added_services, unk_eriks_added_services)).