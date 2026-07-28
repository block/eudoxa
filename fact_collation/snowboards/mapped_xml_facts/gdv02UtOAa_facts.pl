0.15::indep(s1).
0.20::indep(s3).
0.15::indep(s5).
0.15::indep(s6).
0.12::indep(s7).
0.15::indep(s8).
0.30::indep(s9).
0.12::indep(s10).
0.12::indep(sm).
0.12::indep(s39).
0.12::indep(s56).
0.40::indep(s57).
0.15::indep(s63).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values burton=Burton unk_brand=Unknown
% @importance 0.90

0.95::true_val(brand, burton); 0.05::true_val(brand, unk_brand).

0.92::acc(s1, brand).
0.90::acc(s8, brand).
0.88::acc(sm, brand).

measured(s1, brand, burton).
measured(s8, brand, burton).
measured(sm, brand, burton).

all_consistent(brand) :-
    consistent(s1, brand),
    (indep(s8), consistent(s8, brand) ; \+indep(s8)),
    (indep(sm), consistent(sm, brand) ; \+indep(sm)).

evidence(all_consistent(brand)).
query(true_val(brand, burton)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values ft_3d_channel_surfer_flat_top=Family_Tree_3D_Channel_Surfer_Flat_Top unk_model_name=Unknown
% @importance 0.88

0.95::true_val(model_name, ft_3d_channel_surfer_flat_top); 0.05::true_val(model_name, unk_model_name).

0.92::acc(s1, model_name).
0.90::acc(s8, model_name).

measured(s1, model_name, ft_3d_channel_surfer_flat_top).
measured(s8, model_name, ft_3d_channel_surfer_flat_top).

all_consistent(model_name) :-
    consistent(s1, model_name),
    (indep(s8), consistent(s8, model_name) ; \+indep(s8)).

evidence(all_consistent(model_name)).
query(true_val(model_name, ft_3d_channel_surfer_flat_top)).
query(true_val(model_name, unk_model_name)).

% @attr model_series
% @type categorical
% @canonical false
% @original_name Model series
% @values family_tree_collection=Family_Tree_Collection unk_model_series=Unknown
% @importance 0.88

0.90::true_val(model_series, family_tree_collection); 0.10::true_val(model_series, unk_model_series).

0.93::acc(s4, model_series).
0.85::acc(s8, model_series).

measured(s4, model_series, family_tree_collection).
measured(s8, model_series, family_tree_collection).

all_consistent(model_series) :-
    consistent(s4, model_series),
    (indep(s8), consistent(s8, model_series) ; \+indep(s8)).

evidence(all_consistent(model_series)).
query(true_val(model_series, family_tree_collection)).
query(true_val(model_series, unk_model_series)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2025=2025 unk_model_year=Unknown
% @importance 0.92

0.95::true_val(model_year, y2025); 0.05::true_val(model_year, unk_model_year).

0.95::acc(s1, model_year).
0.90::acc(sm, model_year).

measured(s1, model_year, y2025).
measured(sm, model_year, y2025).

all_consistent(model_year) :-
    consistent(s1, model_year),
    (indep(sm), consistent(sm, model_year) ; \+indep(sm)).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2025)).
query(true_val(model_year, unk_model_year)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2024_25=2024_2025_season unk_model_first_available_year=Unknown
% @importance 0.91

0.95::true_val(model_first_available_year, season_2024_25); 0.05::true_val(model_first_available_year, unk_model_first_available_year).

0.92::acc(s1, model_first_available_year).
0.95::acc(s4, model_first_available_year).

measured(s1, model_first_available_year, season_2024_25).
measured(s4, model_first_available_year, season_2024_25).

all_consistent(model_first_available_year) :-
    consistent(s4, model_first_available_year),
    (indep(s1), consistent(s1, model_first_available_year) ; \+indep(s1)).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2024_25)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.95

0.97::true_val(product_type, snowboard); 0.03::true_val(product_type, unk_product_type).

0.95::acc(s1, product_type).

measured(s1, product_type, snowboard).

all_consistent(product_type) :-
    consistent(s1, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values powder=Powder unk_board_category=Unknown
% @importance 0.87

0.95::true_val(board_category, powder); 0.05::true_val(board_category, unk_board_category).

0.88::acc(sm, board_category).
0.85::acc(s80, board_category).

measured(sm, board_category, powder).
measured(s80, board_category, powder).

all_consistent(board_category) :-
    consistent(s80, board_category),
    (indep(sm), consistent(sm, board_category) ; \+indep(sm)).

evidence(all_consistent(board_category)).
query(true_val(board_category, powder)).
query(true_val(board_category, unk_board_category)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values unisex=Unisex unk_gender=Unknown
% @importance 0.75

0.85::true_val(gender, unisex); 0.15::true_val(gender, unk_gender).

0.82::acc(s7, gender).

measured(s7, gender, unisex).

all_consistent(gender) :-
    consistent(s7, gender).

evidence(all_consistent(gender)).
query(true_val(gender, unisex)).
query(true_val(gender, unk_gender)).

% @attr sku
% @type categorical
% @canonical false
% @original_name SKU
% @values w25_243711=W25_243711 unk_sku=Unknown
% @importance 0.87

0.92::true_val(sku, w25_243711); 0.08::true_val(sku, unk_sku).

0.97::acc(s2, sku).
0.90::acc(sm, sku).

measured(s2, sku, w25_243711).
measured(sm, sku, w25_243711).

all_consistent(sku) :-
    consistent(s2, sku),
    (indep(sm), consistent(sm, sku) ; \+indep(sm)).

evidence(all_consistent(sku)).
query(true_val(sku, w25_243711)).
query(true_val(sku, unk_sku)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values swallowtail=Swallowtail unk_shape=Unknown
% @importance 0.88

0.95::true_val(shape, swallowtail); 0.05::true_val(shape, unk_shape).

0.93::acc(s4, shape).
0.95::acc(s93, shape).

measured(s4, shape, swallowtail).
measured(s93, shape, swallowtail).

all_consistent(shape) :-
    consistent(s4, shape),
    consistent(s93, shape).

evidence(all_consistent(shape)).
query(true_val(shape, swallowtail)).
query(true_val(shape, unk_shape)).

% @attr graphic_designer_artist
% @type categorical
% @canonical true
% @original_name graphic_designer_artist
% @values ryan_crotty=Ryan_Crotty unk_graphic_designer_artist=Unknown
% @importance 0.82

0.90::true_val(graphic_designer_artist, ryan_crotty); 0.10::true_val(graphic_designer_artist, unk_graphic_designer_artist).

0.90::acc(s8, graphic_designer_artist).

measured(s8, graphic_designer_artist, ryan_crotty).

all_consistent(graphic_designer_artist) :-
    consistent(s8, graphic_designer_artist).

evidence(all_consistent(graphic_designer_artist)).
query(true_val(graphic_designer_artist, ryan_crotty)).
query(true_val(graphic_designer_artist, unk_graphic_designer_artist)).

% @attr topsheet_appearance_description
% @type categorical
% @canonical true
% @original_name topsheet_appearance_description
% @values audubon_puffin_mountainscapes=Abstract_mountainscapes_Audubon_puffin_motif unk_topsheet_appearance_description=Unknown
% @importance 0.53

0.88::true_val(topsheet_appearance_description, audubon_puffin_mountainscapes); 0.12::true_val(topsheet_appearance_description, unk_topsheet_appearance_description).

0.85::acc(s5, topsheet_appearance_description).
0.80::acc(s63, topsheet_appearance_description).

measured(s5, topsheet_appearance_description, audubon_puffin_mountainscapes).
measured(s63, topsheet_appearance_description, audubon_puffin_mountainscapes).

all_consistent(topsheet_appearance_description) :-
    consistent(s5, topsheet_appearance_description),
    (indep(s63), consistent(s63, topsheet_appearance_description) ; \+indep(s63)).

evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, audubon_puffin_mountainscapes)).
query(true_val(topsheet_appearance_description, unk_topsheet_appearance_description)).

% @attr design_inspiration
% @type categorical
% @canonical false
% @original_name Design inspiration
% @values surfboard_inspired=Surfboard_inspired unk_design_inspiration=Unknown
% @importance 0.91

0.92::true_val(design_inspiration, surfboard_inspired); 0.08::true_val(design_inspiration, unk_design_inspiration).

0.90::acc(s1, design_inspiration).
0.90::acc(s8, design_inspiration).

measured(s1, design_inspiration, surfboard_inspired).
measured(s8, design_inspiration, surfboard_inspired).

all_consistent(design_inspiration) :-
    consistent(s1, design_inspiration),
    (indep(s8), consistent(s8, design_inspiration) ; \+indep(s8)).

evidence(all_consistent(design_inspiration)).
query(true_val(design_inspiration, surfboard_inspired)).
query(true_val(design_inspiration, unk_design_inspiration)).

% @attr design_philosophy
% @type categorical
% @canonical false
% @original_name Design philosophy
% @values surf_freedom_precision=Bridges_surf_freedom_with_on_mountain_precision unk_design_philosophy=Unknown
% @importance 0.70

0.85::true_val(design_philosophy, surf_freedom_precision); 0.15::true_val(design_philosophy, unk_design_philosophy).

0.88::acc(s65, design_philosophy).

measured(s65, design_philosophy, surf_freedom_precision).

all_consistent(design_philosophy) :-
    consistent(s65, design_philosophy).

evidence(all_consistent(design_philosophy)).
query(true_val(design_philosophy, surf_freedom_precision)).
query(true_val(design_philosophy, unk_design_philosophy)).

% @attr terrain_suitability_park
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability
% @values v0=0.0 unk_terrain_suitability_park=Unknown
% @importance 0.87

0.95::true_val(terrain_suitability_park, v0); 0.05::true_val(terrain_suitability_park, unk_terrain_suitability_park).

0.90::acc(sm, terrain_suitability_park).
0.88::acc(s16, terrain_suitability_park).

measured(sm, terrain_suitability_park, v0).
measured(s16, terrain_suitability_park, v0).

all_consistent(terrain_suitability_park) :-
    consistent(sm, terrain_suitability_park).

evidence(all_consistent(terrain_suitability_park)).
query(true_val(terrain_suitability_park, v0)).
query(true_val(terrain_suitability_park, unk_terrain_suitability_park)).

% @attr terrain_suitability_all_mountain
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability
% @values v3=3.0 unk_terrain_suitability_all_mountain=Unknown
% @importance 0.87

0.95::true_val(terrain_suitability_all_mountain, v3); 0.05::true_val(terrain_suitability_all_mountain, unk_terrain_suitability_all_mountain).

0.90::acc(sm, terrain_suitability_all_mountain).

measured(sm, terrain_suitability_all_mountain, v3).

all_consistent(terrain_suitability_all_mountain) :-
    consistent(sm, terrain_suitability_all_mountain).

evidence(all_consistent(terrain_suitability_all_mountain)).
query(true_val(terrain_suitability_all_mountain, v3)).
query(true_val(terrain_suitability_all_mountain, unk_terrain_suitability_all_mountain)).

% @attr terrain_suitability
% @type numeric
% @unit /10
% @canonical true
% @original_name terrain_suitability
% @values v10=10.0 unk_terrain_suitability=Unknown
% @importance 0.87

0.95::true_val(terrain_suitability, v10); 0.05::true_val(terrain_suitability, unk_terrain_suitability).

0.90::acc(sm, terrain_suitability).

measured(sm, terrain_suitability, v10).

all_consistent(terrain_suitability) :-
    consistent(sm, terrain_suitability).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, v10)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values advanced=Advanced expert=Expert intermediate_advanced=Intermediate_Advanced
% @importance 0.84

0.40::true_val(skill_level_recommendation, advanced); 0.35::true_val(skill_level_recommendation, expert); 0.25::true_val(skill_level_recommendation, intermediate_advanced).

0.80::acc(sm, skill_level_recommendation).
0.78::acc(s8, skill_level_recommendation).
0.72::acc(s42, skill_level_recommendation).

measured(sm, skill_level_recommendation, advanced).
measured(s8, skill_level_recommendation, expert).
measured(s42, skill_level_recommendation, intermediate_advanced).

all_consistent(skill_level_recommendation) :-
    consistent(sm, skill_level_recommendation),
    (indep(s8), consistent(s8, skill_level_recommendation) ; \+indep(s8)),
    consistent(s42, skill_level_recommendation).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, advanced)).
query(true_val(skill_level_recommendation, expert)).
query(true_val(skill_level_recommendation, intermediate_advanced)).

% @attr terrain_suitability_freeride
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values deep_powder_surfy_freeride=Deep_powder_surfy_terrain_freeride unk_terrain_suitability_freeride=Unknown
% @importance 0.79

0.88::true_val(terrain_suitability_freeride, deep_powder_surfy_freeride); 0.12::true_val(terrain_suitability_freeride, unk_terrain_suitability_freeride).

0.78::acc(s9, terrain_suitability_freeride).
0.90::acc(s65, terrain_suitability_freeride).

measured(s9, terrain_suitability_freeride, deep_powder_surfy_freeride).
measured(s65, terrain_suitability_freeride, deep_powder_surfy_freeride).

all_consistent(terrain_suitability_freeride) :-
    consistent(s65, terrain_suitability_freeride),
    (indep(s9), consistent(s9, terrain_suitability_freeride) ; \+indep(s9)).

evidence(all_consistent(terrain_suitability_freeride)).
query(true_val(terrain_suitability_freeride, deep_powder_surfy_freeride)).
query(true_val(terrain_suitability_freeride, unk_terrain_suitability_freeride)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values surf_freeride=Surf_inspired_freeride_carving_cruising unk_riding_style=Unknown
% @importance 0.91

0.93::true_val(riding_style, surf_freeride); 0.07::true_val(riding_style, unk_riding_style).

0.93::acc(s4, riding_style).
0.88::acc(s1, riding_style).

measured(s4, riding_style, surf_freeride).
measured(s1, riding_style, surf_freeride).

all_consistent(riding_style) :-
    consistent(s4, riding_style),
    (indep(s1), consistent(s1, riding_style) ; \+indep(s1)).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, surf_freeride)).
query(true_val(riding_style, unk_riding_style)).

% @attr terrain_suitability_deep_powder
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values deep_powder_days=Deep_powder_days unk_terrain_suitability_deep_powder=Unknown
% @importance 0.89

0.92::true_val(terrain_suitability_deep_powder, deep_powder_days); 0.08::true_val(terrain_suitability_deep_powder, unk_terrain_suitability_deep_powder).

0.78::acc(s9, terrain_suitability_deep_powder).
0.88::acc(sm, terrain_suitability_deep_powder).

measured(s9, terrain_suitability_deep_powder, deep_powder_days).
measured(sm, terrain_suitability_deep_powder, deep_powder_days).

all_consistent(terrain_suitability_deep_powder) :-
    (indep(s9), consistent(s9, terrain_suitability_deep_powder) ; \+indep(s9)),
    (indep(sm), consistent(sm, terrain_suitability_deep_powder) ; \+indep(sm)).

evidence(all_consistent(terrain_suitability_deep_powder)).
query(true_val(terrain_suitability_deep_powder, deep_powder_days)).
query(true_val(terrain_suitability_deep_powder, unk_terrain_suitability_deep_powder)).

% @attr terrain_suitability_versatility
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values powder_plus_groomers=Dedicated_powder_also_handles_fresh_groomers unk_terrain_suitability_versatility=Unknown
% @importance 0.91

0.92::true_val(terrain_suitability_versatility, powder_plus_groomers); 0.08::true_val(terrain_suitability_versatility, unk_terrain_suitability_versatility).

0.93::acc(s4, terrain_suitability_versatility).
0.88::acc(s1, terrain_suitability_versatility).

measured(s4, terrain_suitability_versatility, powder_plus_groomers).
measured(s1, terrain_suitability_versatility, powder_plus_groomers).

all_consistent(terrain_suitability_versatility) :-
    consistent(s4, terrain_suitability_versatility),
    (indep(s1), consistent(s1, terrain_suitability_versatility) ; \+indep(s1)).

evidence(all_consistent(terrain_suitability_versatility)).
query(true_val(terrain_suitability_versatility, powder_plus_groomers)).
query(true_val(terrain_suitability_versatility, unk_terrain_suitability_versatility)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values stiff=Stiff medium=Medium
% @importance 0.83

0.35::true_val(flex_feel, stiff); 0.65::true_val(flex_feel, medium).

0.70::acc(s80, flex_feel).
0.78::acc(s20, flex_feel).

measured(s80, flex_feel, stiff).
measured(s20, flex_feel, medium).

all_consistent(flex_feel) :-
    consistent(s80, flex_feel),
    consistent(s20, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, stiff)).
query(true_val(flex_feel, medium)).

% @attr freeride_rating
% @type categorical
% @canonical false
% @original_name Freeride rating
% @values freeride_focused=Designed_for_freeride_mindset unk_freeride_rating=Unknown
% @importance 0.82

0.88::true_val(freeride_rating, freeride_focused); 0.12::true_val(freeride_rating, unk_freeride_rating).

0.85::acc(s8, freeride_rating).

measured(s8, freeride_rating, freeride_focused).

all_consistent(freeride_rating) :-
    consistent(s8, freeride_rating).

evidence(all_consistent(freeride_rating)).
query(true_val(freeride_rating, freeride_focused)).
query(true_val(freeride_rating, unk_freeride_rating)).

% @attr shape_directional
% @type categorical
% @canonical false
% @original_name shape
% @values freeride_directional=Freeride_Directional_25mm_taper unk_shape_directional=Unknown
% @importance 0.87

0.95::true_val(shape_directional, freeride_directional); 0.05::true_val(shape_directional, unk_shape_directional).

0.90::acc(sm, shape_directional).

measured(sm, shape_directional, freeride_directional).

all_consistent(shape_directional) :-
    consistent(sm, shape_directional).

evidence(all_consistent(shape_directional)).
query(true_val(shape_directional, freeride_directional)).
query(true_val(shape_directional, unk_shape_directional)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values directional_flat_top=Directional_Flat_Top_rocker_nose unk_camber_type=Unknown
% @importance 0.91

0.95::true_val(camber_type, directional_flat_top); 0.05::true_val(camber_type, unk_camber_type).

0.90::acc(s1, camber_type).
0.88::acc(sm, camber_type).

measured(s1, camber_type, directional_flat_top).
measured(sm, camber_type, directional_flat_top).

all_consistent(camber_type) :-
    consistent(s1, camber_type),
    (indep(sm), consistent(sm, camber_type) ; \+indep(sm)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, directional_flat_top)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical false
% @original_name camber_description
% @values flat_rocker_nose_stable_float=Flat_with_rocker_nose_stability_effortless_float unk_camber_description=Unknown
% @importance 0.91

0.93::true_val(camber_description, flat_rocker_nose_stable_float); 0.07::true_val(camber_description, unk_camber_description).

0.90::acc(s1, camber_description).

measured(s1, camber_description, flat_rocker_nose_stable_float).

all_consistent(camber_description) :-
    consistent(s1, camber_description).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, flat_rocker_nose_stable_float)).
query(true_val(camber_description, unk_camber_description)).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v4_5=4.5 unk_flex_rating_10=Unknown
% @importance 0.87

0.95::true_val(flex_rating_10, v4_5); 0.05::true_val(flex_rating_10, unk_flex_rating_10).

0.90::acc(sm, flex_rating_10).

measured(sm, flex_rating_10, v4_5).

all_consistent(flex_rating_10) :-
    consistent(sm, flex_rating_10).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v4_5)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values directional=Directional_Flex unk_flex_direction=Unknown
% @importance 0.88

0.95::true_val(flex_direction, directional); 0.05::true_val(flex_direction, unk_flex_direction).

0.90::acc(s1, flex_direction).
0.88::acc(sm, flex_direction).
0.87::acc(s8, flex_direction).

measured(s1, flex_direction, directional).
measured(sm, flex_direction, directional).
measured(s8, flex_direction, directional).

all_consistent(flex_direction) :-
    consistent(s1, flex_direction),
    (indep(sm), consistent(sm, flex_direction) ; \+indep(sm)),
    (indep(s8), consistent(s8, flex_direction) ; \+indep(s8)).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr flex_feel_directional
% @type categorical
% @canonical false
% @original_name flex_feel
% @values pop_tail_stiff_nose=More_pop_in_tail_stiffer_nose unk_flex_feel_directional=Unknown
% @importance 0.91

0.90::true_val(flex_feel_directional, pop_tail_stiff_nose); 0.10::true_val(flex_feel_directional, unk_flex_feel_directional).

0.90::acc(s1, flex_feel_directional).

measured(s1, flex_feel_directional, pop_tail_stiff_nose).

all_consistent(flex_feel_directional) :-
    consistent(s1, flex_feel_directional).

evidence(all_consistent(flex_feel_directional)).
query(true_val(flex_feel_directional, pop_tail_stiff_nose)).
query(true_val(flex_feel_directional, unk_flex_feel_directional)).

% @attr taper
% @type numeric
% @unit mm
% @canonical true
% @original_name taper
% @values v25=25.0 unk_taper=Unknown
% @importance 0.87

0.95::true_val(taper, v25); 0.05::true_val(taper, unk_taper).

0.90::acc(sm, taper).
0.87::acc(s8, taper).

measured(sm, taper, v25).
measured(s8, taper, v25).

all_consistent(taper) :-
    (indep(sm), consistent(sm, taper) ; \+indep(sm)),
    (indep(s8), consistent(s8, taper) ; \+indep(s8)).

evidence(all_consistent(taper)).
query(true_val(taper, v25)).
query(true_val(taper, unk_taper)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values surfboard_3d_shaping=Surfboard_inspired_convex_3D_shaping_tip_tail unk_construction_material_innovation=Unknown
% @importance 0.82

0.90::true_val(construction_material_innovation, surfboard_3d_shaping); 0.10::true_val(construction_material_innovation, unk_construction_material_innovation).

0.88::acc(s8, construction_material_innovation).

measured(s8, construction_material_innovation, surfboard_3d_shaping).

all_consistent(construction_material_innovation) :-
    consistent(s8, construction_material_innovation).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, surfboard_3d_shaping)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr construction_material_innovation_3d_full
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values full_board_3d=3D_elements_through_entire_board unk_construction_material_innovation_3d_full=Unknown
% @importance 0.89

0.88::true_val(construction_material_innovation_3d_full, full_board_3d); 0.12::true_val(construction_material_innovation_3d_full, unk_construction_material_innovation_3d_full).

0.78::acc(s9, construction_material_innovation_3d_full).
0.88::acc(sm, construction_material_innovation_3d_full).

measured(s9, construction_material_innovation_3d_full, full_board_3d).
measured(sm, construction_material_innovation_3d_full, full_board_3d).

all_consistent(construction_material_innovation_3d_full) :-
    (indep(s9), consistent(s9, construction_material_innovation_3d_full) ; \+indep(s9)),
    (indep(sm), consistent(sm, construction_material_innovation_3d_full) ; \+indep(sm)).

evidence(all_consistent(construction_material_innovation_3d_full)).
query(true_val(construction_material_innovation_3d_full, full_board_3d)).
query(true_val(construction_material_innovation_3d_full, unk_construction_material_innovation_3d_full)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values super_fly_ii_700g=Super_Fly_II_700G unk_core_material=Unknown
% @importance 0.85

0.95::true_val(core_material, super_fly_ii_700g); 0.05::true_val(core_material, unk_core_material).

0.88::acc(s8, core_material).
0.85::acc(s90, core_material).

measured(s8, core_material, super_fly_ii_700g).
measured(s90, core_material, super_fly_ii_700g).

all_consistent(core_material) :-
    consistent(s8, core_material).

evidence(all_consistent(core_material)).
query(true_val(core_material, super_fly_ii_700g)).
query(true_val(core_material, unk_core_material)).

% @attr core_material_description
% @type categorical
% @canonical false
% @original_name core_material
% @values dual_species_wood=Dual_species_wood_stronger_lighter_more_pop unk_core_material_description=Unknown
% @importance 0.88

0.92::true_val(core_material_description, dual_species_wood); 0.08::true_val(core_material_description, unk_core_material_description).

0.88::acc(s21, core_material_description).
0.78::acc(s24, core_material_description).

measured(s21, core_material_description, dual_species_wood).
measured(s24, core_material_description, dual_species_wood).

all_consistent(core_material_description) :-
    consistent(s21, core_material_description),
    consistent(s24, core_material_description).

evidence(all_consistent(core_material_description)).
query(true_val(core_material_description, dual_species_wood)).
query(true_val(core_material_description, unk_core_material_description)).

% @attr core_material_egd
% @type categorical
% @canonical false
% @original_name core_material
% @values dualzone_egd=Dualzone_EGD_perpendicular_wood_grain unk_core_material_egd=Unknown
% @importance 0.85

0.92::true_val(core_material_egd, dualzone_egd); 0.08::true_val(core_material_egd, unk_core_material_egd).

0.88::acc(s21, core_material_egd).
0.78::acc(s24, core_material_egd).
0.88::acc(sm, core_material_egd).

measured(s21, core_material_egd, dualzone_egd).
measured(s24, core_material_egd, dualzone_egd).
measured(sm, core_material_egd, dualzone_egd).

all_consistent(core_material_egd) :-
    consistent(s21, core_material_egd),
    consistent(s24, core_material_egd),
    (indep(sm), consistent(sm, core_material_egd) ; \+indep(sm)).

evidence(all_consistent(core_material_egd)).
query(true_val(core_material_egd, dualzone_egd)).
query(true_val(core_material_egd, unk_core_material_egd)).

% @attr construction_material_innovation_carbon
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values carbon_45_highlights=45_degree_Carbon_Highlights_tip_to_tail unk_construction_material_innovation_carbon=Unknown
% @importance 0.85

0.93::true_val(construction_material_innovation_carbon, carbon_45_highlights); 0.07::true_val(construction_material_innovation_carbon, unk_construction_material_innovation_carbon).

0.88::acc(s21, construction_material_innovation_carbon).
0.78::acc(s24, construction_material_innovation_carbon).
0.88::acc(sm, construction_material_innovation_carbon).

measured(s21, construction_material_innovation_carbon, carbon_45_highlights).
measured(s24, construction_material_innovation_carbon, carbon_45_highlights).
measured(sm, construction_material_innovation_carbon, carbon_45_highlights).

all_consistent(construction_material_innovation_carbon) :-
    consistent(s21, construction_material_innovation_carbon),
    consistent(s24, construction_material_innovation_carbon),
    (indep(sm), consistent(sm, construction_material_innovation_carbon) ; \+indep(sm)).

evidence(all_consistent(construction_material_innovation_carbon)).
query(true_val(construction_material_innovation_carbon, carbon_45_highlights)).
query(true_val(construction_material_innovation_carbon, unk_construction_material_innovation_carbon)).

% @attr construction_material_innovation_fiber_angle
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values fiber_60_playful_45_aggressive=60_degree_playful_45_degree_aggressive unk_construction_material_innovation_fiber_angle=Unknown
% @importance 0.81

0.88::true_val(construction_material_innovation_fiber_angle, fiber_60_playful_45_aggressive); 0.12::true_val(construction_material_innovation_fiber_angle, unk_construction_material_innovation_fiber_angle).

0.85::acc(s21, construction_material_innovation_fiber_angle).
0.82::acc(s94, construction_material_innovation_fiber_angle).

measured(s21, construction_material_innovation_fiber_angle, fiber_60_playful_45_aggressive).
measured(s94, construction_material_innovation_fiber_angle, fiber_60_playful_45_aggressive).

all_consistent(construction_material_innovation_fiber_angle) :-
    consistent(s21, construction_material_innovation_fiber_angle),
    consistent(s94, construction_material_innovation_fiber_angle).

evidence(all_consistent(construction_material_innovation_fiber_angle)).
query(true_val(construction_material_innovation_fiber_angle, fiber_60_playful_45_aggressive)).
query(true_val(construction_material_innovation_fiber_angle, unk_construction_material_innovation_fiber_angle)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_wfo=Sintered_WFO unk_base_material=Unknown
% @importance 0.85

0.95::true_val(base_material, sintered_wfo); 0.05::true_val(base_material, unk_base_material).

0.88::acc(s8, base_material).
0.88::acc(sm, base_material).

measured(s8, base_material, sintered_wfo).
measured(sm, base_material, sintered_wfo).

all_consistent(base_material) :-
    consistent(s8, base_material),
    (indep(sm), consistent(sm, base_material) ; \+indep(sm)).

evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_wfo)).
query(true_val(base_material, unk_base_material)).

% @attr base_material_description
% @type categorical
% @canonical false
% @original_name base_material
% @values high_density_sintered_wax=Extra_absorbent_high_density_sintered_wax_infused unk_base_material_description=Unknown
% @importance 0.85

0.92::true_val(base_material_description, high_density_sintered_wax); 0.08::true_val(base_material_description, unk_base_material_description).

0.88::acc(s21, base_material_description).
0.78::acc(s24, base_material_description).
0.88::acc(sm, base_material_description).

measured(s21, base_material_description, high_density_sintered_wax).
measured(s24, base_material_description, high_density_sintered_wax).
measured(sm, base_material_description, high_density_sintered_wax).

all_consistent(base_material_description) :-
    consistent(s21, base_material_description),
    consistent(s24, base_material_description),
    (indep(sm), consistent(sm, base_material_description) ; \+indep(sm)).

evidence(all_consistent(base_material_description)).
query(true_val(base_material_description, high_density_sintered_wax)).
query(true_val(base_material_description, unk_base_material_description)).

% @attr resin
% @type categorical
% @canonical true
% @original_name resin
% @values super_sap_epoxy=Super_Sap_Epoxy_bio_based_50pct_lower_carbon unk_resin=Unknown
% @importance 0.91

0.95::true_val(resin, super_sap_epoxy); 0.05::true_val(resin, unk_resin).

0.90::acc(s1, resin).
0.88::acc(sm, resin).

measured(s1, resin, super_sap_epoxy).
measured(sm, resin, super_sap_epoxy).

all_consistent(resin) :-
    consistent(s1, resin),
    (indep(sm), consistent(sm, resin) ; \+indep(sm)).

evidence(all_consistent(resin)).
query(true_val(resin, super_sap_epoxy)).
query(true_val(resin, unk_resin)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values the_channel=The_Channel unk_mounting_pattern=Unknown
% @importance 0.85

0.95::true_val(mounting_pattern, the_channel); 0.05::true_val(mounting_pattern, unk_mounting_pattern).

0.88::acc(s8, mounting_pattern).
0.88::acc(sm, mounting_pattern).

measured(s8, mounting_pattern, the_channel).
measured(sm, mounting_pattern, the_channel).

all_consistent(mounting_pattern) :-
    consistent(s8, mounting_pattern),
    (indep(sm), consistent(sm, mounting_pattern) ; \+indep(sm)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, the_channel)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr mounting_pattern_detail
% @type categorical
% @canonical false
% @original_name mounting_pattern
% @values channel_adjustable_stance=Channel_fine_tuned_stance_width_and_location unk_mounting_pattern_detail=Unknown
% @importance 0.89

0.92::true_val(mounting_pattern_detail, channel_adjustable_stance); 0.08::true_val(mounting_pattern_detail, unk_mounting_pattern_detail).

0.85::acc(s9, mounting_pattern_detail).
0.88::acc(sm, mounting_pattern_detail).

measured(s9, mounting_pattern_detail, channel_adjustable_stance).
measured(sm, mounting_pattern_detail, channel_adjustable_stance).

all_consistent(mounting_pattern_detail) :-
    (indep(s9), consistent(s9, mounting_pattern_detail) ; \+indep(s9)),
    (indep(sm), consistent(sm, mounting_pattern_detail) ; \+indep(sm)).

evidence(all_consistent(mounting_pattern_detail)).
query(true_val(mounting_pattern_detail, channel_adjustable_stance)).
query(true_val(mounting_pattern_detail, unk_mounting_pattern_detail)).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values most_major_brands_est_best=Compatible_most_brands_best_with_Burton_EST unk_binding_compatibility=Unknown
% @importance 0.85

0.92::true_val(binding_compatibility, most_major_brands_est_best); 0.08::true_val(binding_compatibility, unk_binding_compatibility).

0.82::acc(s9, binding_compatibility).
0.88::acc(sm, binding_compatibility).

measured(s9, binding_compatibility, most_major_brands_est_best).
measured(sm, binding_compatibility, most_major_brands_est_best).

all_consistent(binding_compatibility) :-
    (indep(s9), consistent(s9, binding_compatibility) ; \+indep(s9)),
    (indep(sm), consistent(sm, binding_compatibility) ; \+indep(sm)).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, most_major_brands_est_best)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

% @attr construction_material_innovation_infinite_ride
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values infinite_ride=Infinite_Ride_overbuilt_broken_in_consistent_day1_to_100 unk_construction_material_innovation_infinite_ride=Unknown
% @importance 0.87

0.92::true_val(construction_material_innovation_infinite_ride, infinite_ride); 0.08::true_val(construction_material_innovation_infinite_ride, unk_construction_material_innovation_infinite_ride).

0.88::acc(s1, construction_material_innovation_infinite_ride).
0.82::acc(s9, construction_material_innovation_infinite_ride).
0.88::acc(sm, construction_material_innovation_infinite_ride).

measured(s1, construction_material_innovation_infinite_ride, infinite_ride).
measured(s9, construction_material_innovation_infinite_ride, infinite_ride).
measured(sm, construction_material_innovation_infinite_ride, infinite_ride).

all_consistent(construction_material_innovation_infinite_ride) :-
    consistent(s1, construction_material_innovation_infinite_ride),
    (indep(s9), consistent(s9, construction_material_innovation_infinite_ride) ; \+indep(s9)),
    (indep(sm), consistent(sm, construction_material_innovation_infinite_ride) ; \+indep(sm)).

evidence(all_consistent(construction_material_innovation_infinite_ride)).
query(true_val(construction_material_innovation_infinite_ride, infinite_ride)).
query(true_val(construction_material_innovation_infinite_ride, unk_construction_material_innovation_infinite_ride)).

% @attr construction_material_innovation_pro_tip
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values pro_tip=Pro_Tip_tapered_thickness_reduces_swing_weight unk_construction_material_innovation_pro_tip=Unknown
% @importance 0.81

0.88::true_val(construction_material_innovation_pro_tip, pro_tip); 0.12::true_val(construction_material_innovation_pro_tip, unk_construction_material_innovation_pro_tip).

0.82::acc(s94, construction_material_innovation_pro_tip).
0.85::acc(s8, construction_material_innovation_pro_tip).

measured(s94, construction_material_innovation_pro_tip, pro_tip).
measured(s8, construction_material_innovation_pro_tip, pro_tip).

all_consistent(construction_material_innovation_pro_tip) :-
    consistent(s94, construction_material_innovation_pro_tip),
    consistent(s8, construction_material_innovation_pro_tip).

evidence(all_consistent(construction_material_innovation_pro_tip)).
query(true_val(construction_material_innovation_pro_tip, pro_tip)).
query(true_val(construction_material_innovation_pro_tip, unk_construction_material_innovation_pro_tip)).

% @attr construction_material_innovation_filet_o_flex
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values filet_o_flex=Filet_O_Flex unk_construction_material_innovation_filet_o_flex=Unknown
% @importance 0.87

0.85::true_val(construction_material_innovation_filet_o_flex, filet_o_flex); 0.15::true_val(construction_material_innovation_filet_o_flex, unk_construction_material_innovation_filet_o_flex).

0.85::acc(s8, construction_material_innovation_filet_o_flex).

measured(s8, construction_material_innovation_filet_o_flex, filet_o_flex).

all_consistent(construction_material_innovation_filet_o_flex) :-
    consistent(s8, construction_material_innovation_filet_o_flex).

evidence(all_consistent(construction_material_innovation_filet_o_flex)).
query(true_val(construction_material_innovation_filet_o_flex, filet_o_flex)).
query(true_val(construction_material_innovation_filet_o_flex, unk_construction_material_innovation_filet_o_flex)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values super_sap_bio_resin=Super_Sap_Epoxy_bio_based_50pct_lower_footprint unk_sustainability_certification=Unknown
% @importance 0.91

0.93::true_val(sustainability_certification, super_sap_bio_resin); 0.07::true_val(sustainability_certification, unk_sustainability_certification).

0.90::acc(s1, sustainability_certification).
0.88::acc(sm, sustainability_certification).

measured(s1, sustainability_certification, super_sap_bio_resin).
measured(sm, sustainability_certification, super_sap_bio_resin).

all_consistent(sustainability_certification) :-
    consistent(s1, sustainability_certification),
    (indep(sm), consistent(sm, sustainability_certification) ; \+indep(sm)).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, super_sap_bio_resin)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr available_sizes_144
% @type categorical
% @canonical false
% @original_name available_sizes
% @values v144=144cm unk_available_sizes_144=Unknown
% @importance 0.85

0.93::true_val(available_sizes_144, v144); 0.07::true_val(available_sizes_144, unk_available_sizes_144).

0.93::acc(sm, available_sizes_144).

measured(sm, available_sizes_144, v144).

all_consistent(available_sizes_144) :-
    consistent(sm, available_sizes_144).

evidence(all_consistent(available_sizes_144)).
query(true_val(available_sizes_144, v144)).
query(true_val(available_sizes_144, unk_available_sizes_144)).

% @attr effective_edge_144
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge (144cm)
% @values v995=995.0 unk_effective_edge_144=Unknown
% @importance 0.85

0.93::true_val(effective_edge_144, v995); 0.07::true_val(effective_edge_144, unk_effective_edge_144).

0.93::acc(sm, effective_edge_144).

measured(sm, effective_edge_144, v995).

all_consistent(effective_edge_144) :-
    consistent(sm, effective_edge_144).

evidence(all_consistent(effective_edge_144)).
query(true_val(effective_edge_144, v995)).
query(true_val(effective_edge_144, unk_effective_edge_144)).

% @attr sidecut_radius_size_144
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v6_0=6.0 unk_sidecut_radius_size_144=Unknown
% @importance 0.85

0.93::true_val(sidecut_radius_size_144, v6_0); 0.07::true_val(sidecut_radius_size_144, unk_sidecut_radius_size_144).

0.93::acc(sm, sidecut_radius_size_144).

measured(sm, sidecut_radius_size_144, v6_0).

all_consistent(sidecut_radius_size_144) :-
    consistent(sm, sidecut_radius_size_144).

evidence(all_consistent(sidecut_radius_size_144)).
query(true_val(sidecut_radius_size_144, v6_0)).
query(true_val(sidecut_radius_size_144, unk_sidecut_radius_size_144)).

% @attr tip_tail_width_size_144_nose
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size
% @values v306_2=306.2 unk_tip_tail_width_size_144_nose=Unknown
% @importance 0.85

0.93::true_val(tip_tail_width_size_144_nose, v306_2); 0.07::true_val(tip_tail_width_size_144_nose, unk_tip_tail_width_size_144_nose).

0.93::acc(sm, tip_tail_width_size_144_nose).

measured(sm, tip_tail_width_size_144_nose, v306_2).

all_consistent(tip_tail_width_size_144_nose) :-
    consistent(sm, tip_tail_width_size_144_nose).

evidence(all_consistent(tip_tail_width_size_144_nose)).
query(true_val(tip_tail_width_size_144_nose, v306_2)).
query(true_val(tip_tail_width_size_144_nose, unk_tip_tail_width_size_144_nose)).

% @attr tip_tail_width_size_144_tail
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size
% @values v281_2=281.2 unk_tip_tail_width_size_144_tail=Unknown
% @importance 0.85

0.93::true_val(tip_tail_width_size_144_tail, v281_2); 0.07::true_val(tip_tail_width_size_144_tail, unk_tip_tail_width_size_144_tail).

0.93::acc(sm, tip_tail_width_size_144_tail).

measured(sm, tip_tail_width_size_144_tail, v281_2).

all_consistent(tip_tail_width_size_144_tail) :-
    consistent(sm, tip_tail_width_size_144_tail).

evidence(all_consistent(tip_tail_width_size_144_tail)).
query(true_val(tip_tail_width_size_144_tail, v281_2)).
query(true_val(tip_tail_width_size_144_tail, unk_tip_tail_width_size_144_tail)).

% @attr waist_width_144
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width (144cm)
% @values v257=257.0 unk_waist_width_144=Unknown
% @importance 0.85

0.93::true_val(waist_width_144, v257); 0.07::true_val(waist_width_144, unk_waist_width_144).

0.93::acc(sm, waist_width_144).

measured(sm, waist_width_144, v257).

all_consistent(waist_width_144) :-
    consistent(sm, waist_width_144).

evidence(all_consistent(waist_width_144)).
query(true_val(waist_width_144, v257)).
query(true_val(waist_width_144, unk_waist_width_144)).

% @attr stance_width_range_size_144
% @type numeric
% @unit mm
% @canonical false
% @original_name stance_width_range_size
% @values v505=505.0 unk_stance_width_range_size_144=Unknown
% @importance 0.85

0.93::true_val(stance_width_range_size_144, v505); 0.07::true_val(stance_width_range_size_144, unk_stance_width_range_size_144).

0.93::acc(sm, stance_width_range_size_144).

measured(sm, stance_width_range_size_144, v505).

all_consistent(stance_width_range_size_144) :-
    consistent(sm, stance_width_range_size_144).

evidence(all_consistent(stance_width_range_size_144)).
query(true_val(stance_width_range_size_144, v505)).
query(true_val(stance_width_range_size_144, unk_stance_width_range_size_144)).

% @attr setback_144
% @type numeric
% @unit mm
% @canonical false
% @original_name setback
% @values vn12_5=-12.5 unk_setback_144=Unknown
% @importance 0.85

0.93::true_val(setback_144, vn12_5); 0.07::true_val(setback_144, unk_setback_144).

0.93::acc(sm, setback_144).

measured(sm, setback_144, vn12_5).

all_consistent(setback_144) :-
    consistent(sm, setback_144).

evidence(all_consistent(setback_144)).
query(true_val(setback_144, vn12_5)).
query(true_val(setback_144, unk_setback_144)).

% @attr recommended_weight_range_size_144
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values kg45_68=45_68kg unk_recommended_weight_range_size_144=Unknown
% @importance 0.85

0.93::true_val(recommended_weight_range_size_144, kg45_68); 0.07::true_val(recommended_weight_range_size_144, unk_recommended_weight_range_size_144).

0.93::acc(sm, recommended_weight_range_size_144).

measured(sm, recommended_weight_range_size_144, kg45_68).

all_consistent(recommended_weight_range_size_144) :-
    consistent(sm, recommended_weight_range_size_144).

evidence(all_consistent(recommended_weight_range_size_144)).
query(true_val(recommended_weight_range_size_144, kg45_68)).
query(true_val(recommended_weight_range_size_144, unk_recommended_weight_range_size_144)).

% @attr available_sizes_150
% @type categorical
% @canonical false
% @original_name available_sizes
% @values v150=150cm unk_available_sizes_150=Unknown
% @importance 0.85

0.93::true_val(available_sizes_150, v150); 0.07::true_val(available_sizes_150, unk_available_sizes_150).

0.93::acc(sm, available_sizes_150).

measured(sm, available_sizes_150, v150).

all_consistent(available_sizes_150) :-
    consistent(sm, available_sizes_150).

evidence(all_consistent(available_sizes_150)).
query(true_val(available_sizes_150, v150)).
query(true_val(available_sizes_150, unk_available_sizes_150)).

% @attr effective_edge_150
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge (150cm)
% @values v1055=1055.0 unk_effective_edge_150=Unknown
% @importance 0.85

0.93::true_val(effective_edge_150, v1055); 0.07::true_val(effective_edge_150, unk_effective_edge_150).

0.93::acc(sm, effective_edge_150).

measured(sm, effective_edge_150, v1055).

all_consistent(effective_edge_150) :-
    consistent(sm, effective_edge_150).

evidence(all_consistent(effective_edge_150)).
query(true_val(effective_edge_150, v1055)).
query(true_val(effective_edge_150, unk_effective_edge_150)).

% @attr sidecut_radius_size_150
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v6_4=6.4 unk_sidecut_radius_size_150=Unknown
% @importance 0.85

0.93::true_val(sidecut_radius_size_150, v6_4); 0.07::true_val(sidecut_radius_size_150, unk_sidecut_radius_size_150).

0.93::acc(sm, sidecut_radius_size_150).

measured(sm, sidecut_radius_size_150, v6_4).

all_consistent(sidecut_radius_size_150) :-
    consistent(sm, sidecut_radius_size_150).

evidence(all_consistent(sidecut_radius_size_150)).
query(true_val(sidecut_radius_size_150, v6_4)).
query(true_val(sidecut_radius_size_150, unk_sidecut_radius_size_150)).

% @attr tip_tail_width_size_150_nose
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size
% @values v318_5=318.5 unk_tip_tail_width_size_150_nose=Unknown
% @importance 0.85

0.93::true_val(tip_tail_width_size_150_nose, v318_5); 0.07::true_val(tip_tail_width_size_150_nose, unk_tip_tail_width_size_150_nose).

0.93::acc(sm, tip_tail_width_size_150_nose).

measured(sm, tip_tail_width_size_150_nose, v318_5).

all_consistent(tip_tail_width_size_150_nose) :-
    consistent(sm, tip_tail_width_size_150_nose).

evidence(all_consistent(tip_tail_width_size_150_nose)).
query(true_val(tip_tail_width_size_150_nose, v318_5)).
query(true_val(tip_tail_width_size_150_nose, unk_tip_tail_width_size_150_nose)).

% @attr tip_tail_width_size_150_tail
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size
% @values v293_5=293.5 unk_tip_tail_width_size_150_tail=Unknown
% @importance 0.85

0.93::true_val(tip_tail_width_size_150_tail, v293_5); 0.07::true_val(tip_tail_width_size_150_tail, unk_tip_tail_width_size_150_tail).

0.93::acc(sm, tip_tail_width_size_150_tail).

measured(sm, tip_tail_width_size_150_tail, v293_5).

all_consistent(tip_tail_width_size_150_tail) :-
    consistent(sm, tip_tail_width_size_150_tail).

evidence(all_consistent(tip_tail_width_size_150_tail)).
query(true_val(tip_tail_width_size_150_tail, v293_5)).
query(true_val(tip_tail_width_size_150_tail, unk_tip_tail_width_size_150_tail)).

% @attr waist_width_150
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width (150cm)
% @values v267=267.0 unk_waist_width_150=Unknown
% @importance 0.85

0.93::true_val(waist_width_150, v267); 0.07::true_val(waist_width_150, unk_waist_width_150).

0.93::acc(sm, waist_width_150).

measured(sm, waist_width_150, v267).

all_consistent(waist_width_150) :-
    consistent(sm, waist_width_150).

evidence(all_consistent(waist_width_150)).
query(true_val(waist_width_150, v267)).
query(true_val(waist_width_150, unk_waist_width_150)).

% @attr stance_width_range_size_150
% @type numeric
% @unit mm
% @canonical false
% @original_name stance_width_range_size
% @values v530=530.0 unk_stance_width_range_size_150=Unknown
% @importance 0.85

0.93::true_val(stance_width_range_size_150, v530); 0.07::true_val(stance_width_range_size_150, unk_stance_width_range_size_150).

0.93::acc(sm, stance_width_range_size_150).

measured(sm, stance_width_range_size_150, v530).

all_consistent(stance_width_range_size_150) :-
    consistent(sm, stance_width_range_size_150).

evidence(all_consistent(stance_width_range_size_150)).
query(true_val(stance_width_range_size_150, v530)).
query(true_val(stance_width_range_size_150, unk_stance_width_range_size_150)).

% @attr setback_150
% @type numeric
% @unit mm
% @canonical false
% @original_name setback
% @values vn12_5=-12.5 unk_setback_150=Unknown
% @importance 0.85

0.93::true_val(setback_150, vn12_5); 0.07::true_val(setback_150, unk_setback_150).

0.93::acc(sm, setback_150).

measured(sm, setback_150, vn12_5).

all_consistent(setback_150) :-
    consistent(sm, setback_150).

evidence(all_consistent(setback_150)).
query(true_val(setback_150, vn12_5)).
query(true_val(setback_150, unk_setback_150)).

% @attr recommended_weight_range_size_150
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values kg54_82=54_82kg unk_recommended_weight_range_size_150=Unknown
% @importance 0.85

0.93::true_val(recommended_weight_range_size_150, kg54_82); 0.07::true_val(recommended_weight_range_size_150, unk_recommended_weight_range_size_150).

0.93::acc(sm, recommended_weight_range_size_150).

measured(sm, recommended_weight_range_size_150, kg54_82).

all_consistent(recommended_weight_range_size_150) :-
    consistent(sm, recommended_weight_range_size_150).

evidence(all_consistent(recommended_weight_range_size_150)).
query(true_val(recommended_weight_range_size_150, kg54_82)).
query(true_val(recommended_weight_range_size_150, unk_recommended_weight_range_size_150)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values v156=156cm unk_available_sizes=Unknown
% @importance 0.85

0.93::true_val(available_sizes, v156); 0.07::true_val(available_sizes, unk_available_sizes).

0.93::acc(sm, available_sizes).

measured(sm, available_sizes, v156).

all_consistent(available_sizes) :-
    consistent(sm, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, v156)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr effective_edge_156
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge (156cm)
% @values v1155=1155.0 unk_effective_edge_156=Unknown
% @importance 0.85

0.93::true_val(effective_edge_156, v1155); 0.07::true_val(effective_edge_156, unk_effective_edge_156).

0.93::acc(sm, effective_edge_156).

measured(sm, effective_edge_156, v1155).

all_consistent(effective_edge_156) :-
    consistent(sm, effective_edge_156).

evidence(all_consistent(effective_edge_156)).
query(true_val(effective_edge_156, v1155)).
query(true_val(effective_edge_156, unk_effective_edge_156)).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size
% @values v6_8=6.8 unk_sidecut_radius_size=Unknown
% @importance 0.85

0.93::true_val(sidecut_radius_size, v6_8); 0.07::true_val(sidecut_radius_size, unk_sidecut_radius_size).

0.93::acc(sm, sidecut_radius_size).

measured(sm, sidecut_radius_size, v6_8).

all_consistent(sidecut_radius_size) :-
    consistent(sm, sidecut_radius_size).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v6_8)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr tip_tail_width_size
% @type numeric
% @unit mm
% @canonical true
% @original_name tip_tail_width_size
% @values v325_8=325.8 unk_tip_tail_width_size=Unknown
% @importance 0.85

0.93::true_val(tip_tail_width_size, v325_8); 0.07::true_val(tip_tail_width_size, unk_tip_tail_width_size).

0.93::acc(sm, tip_tail_width_size).

measured(sm, tip_tail_width_size, v325_8).

all_consistent(tip_tail_width_size) :-
    consistent(sm, tip_tail_width_size).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v325_8)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr tip_tail_width_size_tail
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size
% @values v300_8=300.8 unk_tip_tail_width_size_tail=Unknown
% @importance 0.85

0.93::true_val(tip_tail_width_size_tail, v300_8); 0.07::true_val(tip_tail_width_size_tail, unk_tip_tail_width_size_tail).

0.93::acc(sm, tip_tail_width_size_tail).

measured(sm, tip_tail_width_size_tail, v300_8).

all_consistent(tip_tail_width_size_tail) :-
    consistent(sm, tip_tail_width_size_tail).

evidence(all_consistent(tip_tail_width_size_tail)).
query(true_val(tip_tail_width_size_tail, v300_8)).
query(true_val(tip_tail_width_size_tail, unk_tip_tail_width_size_tail)).

% @attr waist_width_156
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width (156cm)
% @values v272=272.0 unk_waist_width_156=Unknown
% @importance 0.85

0.93::true_val(waist_width_156, v272); 0.07::true_val(waist_width_156, unk_waist_width_156).

0.93::acc(sm, waist_width_156).

measured(sm, waist_width_156, v272).

all_consistent(waist_width_156) :-
    consistent(sm, waist_width_156).

evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v272)).
query(true_val(waist_width_156, unk_waist_width_156)).

% @attr stance_width_range_size
% @type numeric
% @unit mm
% @canonical true
% @original_name stance_width_range_size
% @values v560=560.0 unk_stance_width_range_size=Unknown
% @importance 0.85

0.93::true_val(stance_width_range_size, v560); 0.07::true_val(stance_width_range_size, unk_stance_width_range_size).

0.93::acc(sm, stance_width_range_size).

measured(sm, stance_width_range_size, v560).

all_consistent(stance_width_range_size) :-
    consistent(sm, stance_width_range_size).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v560)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr setback
% @type numeric
% @unit mm
% @canonical true
% @original_name setback
% @values vn12_5=-12.5 unk_setback=Unknown
% @importance 0.85

0.93::true_val(setback, vn12_5); 0.07::true_val(setback, unk_setback).

0.93::acc(sm, setback).

measured(sm, setback, vn12_5).

all_consistent(setback) :-
    consistent(sm, setback).

evidence(all_consistent(setback)).
query(true_val(setback, vn12_5)).
query(true_val(setback, unk_setback)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size
% @values kg68_91=68_91kg unk_recommended_weight_range_size=Unknown
% @importance 0.85

0.93::true_val(recommended_weight_range_size, kg68_91); 0.07::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

0.93::acc(sm, recommended_weight_range_size).

measured(sm, recommended_weight_range_size, kg68_91).

all_consistent(recommended_weight_range_size) :-
    consistent(sm, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, kg68_91)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr available_sizes_162
% @type categorical
% @canonical false
% @original_name available_sizes
% @values v162=162cm unk_available_sizes_162=Unknown
% @importance 0.85

0.93::true_val(available_sizes_162, v162); 0.07::true_val(available_sizes_162, unk_available_sizes_162).

0.93::acc(sm, available_sizes_162).

measured(sm, available_sizes_162, v162).

all_consistent(available_sizes_162) :-
    consistent(sm, available_sizes_162).

evidence(all_consistent(available_sizes_162)).
query(true_val(available_sizes_162, v162)).
query(true_val(available_sizes_162, unk_available_sizes_162)).

% @attr effective_edge_162
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge (162cm)
% @values v1175=1175.0 unk_effective_edge_162=Unknown
% @importance 0.85

0.93::true_val(effective_edge_162, v1175); 0.07::true_val(effective_edge_162, unk_effective_edge_162).

0.93::acc(sm, effective_edge_162).

measured(sm, effective_edge_162, v1175).

all_consistent(effective_edge_162) :-
    consistent(sm, effective_edge_162).

evidence(all_consistent(effective_edge_162)).
query(true_val(effective_edge_162, v1175)).
query(true_val(effective_edge_162, unk_effective_edge_162)).

% @attr sidecut_radius_size_162
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v7_2=7.2 unk_sidecut_radius_size_162=Unknown
% @importance 0.85

0.93::true_val(sidecut_radius_size_162, v7_2); 0.07::true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162).

0.93::acc(sm, sidecut_radius_size_162).

measured(sm, sidecut_radius_size_162, v7_2).

all_consistent(sidecut_radius_size_162) :-
    consistent(sm, sidecut_radius_size_162).

evidence(all_consistent(sidecut_radius_size_162)).
query(true_val(sidecut_radius_size_162, v7_2)).
query(true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162)).

% @attr tip_tail_width_size_162_nose
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size
% @values v333_2=333.2 unk_tip_tail_width_size_162_nose=Unknown
% @importance 0.85

0.93::true_val(tip_tail_width_size_162_nose, v333_2); 0.07::true_val(tip_tail_width_size_162_nose, unk_tip_tail_width_size_162_nose).

0.93::acc(sm, tip_tail_width_size_162_nose).

measured(sm, tip_tail_width_size_162_nose, v333_2).

all_consistent(tip_tail_width_size_162_nose) :-
    consistent(sm, tip_tail_width_size_162_nose).

evidence(all_consistent(tip_tail_width_size_162_nose)).
query(true_val(tip_tail_width_size_162_nose, v333_2)).
query(true_val(tip_tail_width_size_162_nose, unk_tip_tail_width_size_162_nose)).

% @attr tip_tail_width_size_162_tail
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size
% @values v308_2=308.2 unk_tip_tail_width_size_162_tail=Unknown
% @importance 0.85

0.93::true_val(tip_tail_width_size_162_tail, v308_2); 0.07::true_val(tip_tail_width_size_162_tail, unk_tip_tail_width_size_162_tail).

0.93::acc(sm, tip_tail_width_size_162_tail).

measured(sm, tip_tail_width_size_162_tail, v308_2).

all_consistent(tip_tail_width_size_162_tail) :-
    consistent(sm, tip_tail_width_size_162_tail).

evidence(all_consistent(tip_tail_width_size_162_tail)).
query(true_val(tip_tail_width_size_162_tail, v308_2)).
query(true_val(tip_tail_width_size_162_tail, unk_tip_tail_width_size_162_tail)).

% @attr waist_width_162
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width (162cm)
% @values v277=277.0 unk_waist_width_162=Unknown
% @importance 0.85

0.93::true_val(waist_width_162, v277); 0.07::true_val(waist_width_162, unk_waist_width_162).

0.93::acc(sm, waist_width_162).

measured(sm, waist_width_162, v277).

all_consistent(waist_width_162) :-
    consistent(sm, waist_width_162).

evidence(all_consistent(waist_width_162)).
query(true_val(waist_width_162, v277)).
query(true_val(waist_width_162, unk_waist_width_162)).

% @attr stance_width_range_size_162
% @type numeric
% @unit mm
% @canonical false
% @original_name stance_width_range_size
% @values v560=560.0 unk_stance_width_range_size_162=Unknown
% @importance 0.85

0.93::true_val(stance_width_range_size_162, v560_162); 0.07::true_val(stance_width_range_size_162, unk_stance_width_range_size_162).

0.93::acc(sm, stance_width_range_size_162).

measured(sm, stance_width_range_size_162, v560_162).

all_consistent(stance_width_range_size_162) :-
    consistent(sm, stance_width_range_size_162).

evidence(all_consistent(stance_width_range_size_162)).
query(true_val(stance_width_range_size_162, v560_162)).
query(true_val(stance_width_range_size_162, unk_stance_width_range_size_162)).

% @attr setback_162
% @type numeric
% @unit mm
% @canonical false
% @original_name setback
% @values vn12_5=-12.5 unk_setback_162=Unknown
% @importance 0.85

0.93::true_val(setback_162, vn12_5_162); 0.07::true_val(setback_162, unk_setback_162).

0.93::acc(sm, setback_162).

measured(sm, setback_162, vn12_5_162).

all_consistent(setback_162) :-
    consistent(sm, setback_162).

evidence(all_consistent(setback_162)).
query(true_val(setback_162, vn12_5_162)).
query(true_val(setback_162, unk_setback_162)).

% @attr recommended_weight_range_size_162
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values kg82_118plus=82_118plus_kg unk_recommended_weight_range_size_162=Unknown
% @importance 0.85

0.93::true_val(recommended_weight_range_size_162, kg82_118plus); 0.07::true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162).

0.93::acc(sm, recommended_weight_range_size_162).

measured(sm, recommended_weight_range_size_162, kg82_118plus).

all_consistent(recommended_weight_range_size_162) :-
    consistent(sm, recommended_weight_range_size_162).

evidence(all_consistent(recommended_weight_range_size_162)).
query(true_val(recommended_weight_range_size_162, kg82_118plus)).
query(true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values three_year=3_year_warranty_from_purchase unk_warranty=Unknown
% @importance 0.80

0.93::true_val(warranty, three_year); 0.07::true_val(warranty, unk_warranty).

0.88::acc(s5, warranty).
0.88::acc(s8, warranty).

measured(s5, warranty, three_year).
measured(s8, warranty, three_year).

all_consistent(warranty) :-
    consistent(s5, warranty),
    (indep(s8), consistent(s8, warranty) ; \+indep(s8)).

evidence(all_consistent(warranty)).
query(true_val(warranty, three_year)).
query(true_val(warranty, unk_warranty)).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v775=775.0 unk_price_usd_msrp=Unknown
% @importance 0.90

0.92::true_val(price_usd_msrp, v775); 0.08::true_val(price_usd_msrp, unk_price_usd_msrp).

0.85::acc(s20, price_usd_msrp).

measured(s20, price_usd_msrp, v775).

all_consistent(price_usd_msrp) :-
    consistent(s20, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v775)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_evo
% @values v829_95=829.95 unk_price_usd_evo=Unknown
% @importance 0.85

0.92::true_val(price_usd_evo, v829_95); 0.08::true_val(price_usd_evo, unk_price_usd_evo).

0.88::acc(s32, price_usd_evo).

measured(s32, price_usd_evo, v829_95).

all_consistent(price_usd_evo) :-
    consistent(s32, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v829_95)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_rei
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_rei
% @values v829_95=829.95 unk_price_usd_rei=Unknown
% @importance 0.82

0.92::true_val(price_usd_rei, v829_95_rei); 0.08::true_val(price_usd_rei, unk_price_usd_rei).

0.88::acc(s80, price_usd_rei).

measured(s80, price_usd_rei, v829_95_rei).

all_consistent(price_usd_rei) :-
    consistent(s80, price_usd_rei).

evidence(all_consistent(price_usd_rei)).
query(true_val(price_usd_rei, v829_95_rei)).
query(true_val(price_usd_rei, unk_price_usd_rei)).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v979_99=979.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.95::true_val(price_aud_merchant, v979_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).

0.95::acc(sm, price_aud_merchant).

measured(sm, price_aud_merchant, v979_99).

all_consistent(price_aud_merchant) :-
    consistent(sm, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v979_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values sold_out=Burton_com_sold_out unk_availability_status=Unknown
% @importance 0.85

0.90::true_val(availability_status, sold_out); 0.10::true_val(availability_status, unk_availability_status).

0.92::acc(s2, availability_status).

measured(s2, availability_status, sold_out).

all_consistent(availability_status) :-
    consistent(s2, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, sold_out)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed_2025_2026=evo_2025_listed_2026_at_829_95 unk_availability_status_evo=Unknown
% @importance 0.85

0.90::true_val(availability_status_evo, listed_2025_2026); 0.10::true_val(availability_status_evo, unk_availability_status_evo).

0.88::acc(s1, availability_status_evo).

measured(s1, availability_status_evo, listed_2025_2026).

all_consistent(availability_status_evo) :-
    consistent(s1, availability_status_evo).

evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, listed_2025_2026)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

% @attr availability_status_rei
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed_both_years=REI_2024_25_and_2025_26_listed unk_availability_status_rei=Unknown
% @importance 0.85

0.90::true_val(availability_status_rei, listed_both_years); 0.10::true_val(availability_status_rei, unk_availability_status_rei).

0.88::acc(s3, availability_status_rei).

measured(s3, availability_status_rei, listed_both_years).

all_consistent(availability_status_rei) :-
    consistent(s3, availability_status_rei).

evidence(all_consistent(availability_status_rei)).
query(true_val(availability_status_rei, listed_both_years)).
query(true_val(availability_status_rei, unk_availability_status_rei)).

% @attr availability_status_backcountry
% @type categorical
% @canonical false
% @original_name availability_status
% @values available=Backcountry_available unk_availability_status_backcountry=Unknown
% @importance 0.67

0.85::true_val(availability_status_backcountry, available); 0.15::true_val(availability_status_backcountry, unk_availability_status_backcountry).

0.82::acc(s6, availability_status_backcountry).

measured(s6, availability_status_backcountry, available).

all_consistent(availability_status_backcountry) :-
    consistent(s6, availability_status_backcountry).

evidence(all_consistent(availability_status_backcountry)).
query(true_val(availability_status_backcountry, available)).
query(true_val(availability_status_backcountry, unk_availability_status_backcountry)).

% @attr availability_status_dreamruns
% @type categorical
% @canonical false
% @original_name availability_status
% @values available=Dreamruns_available unk_availability_status_dreamruns=Unknown
% @importance 0.82

0.85::true_val(availability_status_dreamruns, available_dr); 0.15::true_val(availability_status_dreamruns, unk_availability_status_dreamruns).

0.82::acc(s8, availability_status_dreamruns).

measured(s8, availability_status_dreamruns, available_dr).

all_consistent(availability_status_dreamruns) :-
    consistent(s8, availability_status_dreamruns).

evidence(all_consistent(availability_status_dreamruns)).
query(true_val(availability_status_dreamruns, available_dr)).
query(true_val(availability_status_dreamruns, unk_availability_status_dreamruns)).

% @attr availability_status_rudeboys
% @type categorical
% @canonical false
% @original_name availability_status
% @values available=Rudeboys_available unk_availability_status_rudeboys=Unknown
% @importance 0.75

0.82::true_val(availability_status_rudeboys, available_rb); 0.18::true_val(availability_status_rudeboys, unk_availability_status_rudeboys).

0.75::acc(s7, availability_status_rudeboys).

measured(s7, availability_status_rudeboys, available_rb).

all_consistent(availability_status_rudeboys) :-
    consistent(s7, availability_status_rudeboys).

evidence(all_consistent(availability_status_rudeboys)).
query(true_val(availability_status_rudeboys, available_rb)).
query(true_val(availability_status_rudeboys, unk_availability_status_rudeboys)).

% @attr availability_status_melbourne
% @type categorical
% @canonical false
% @original_name availability_status
% @values available=Melbourne_Snowboard_available unk_availability_status_melbourne=Unknown
% @importance 0.87

0.90::true_val(availability_status_melbourne, available_mel); 0.10::true_val(availability_status_melbourne, unk_availability_status_melbourne).

0.88::acc(sm, availability_status_melbourne).

measured(sm, availability_status_melbourne, available_mel).

all_consistent(availability_status_melbourne) :-
    consistent(sm, availability_status_melbourne).

evidence(all_consistent(availability_status_melbourne)).
query(true_val(availability_status_melbourne, available_mel)).
query(true_val(availability_status_melbourne, unk_availability_status_melbourne)).

% @attr availability_status_board_of_provo
% @type categorical
% @canonical false
% @original_name availability_status
% @values available=Board_of_Provo_available unk_availability_status_board_of_provo=Unknown
% @importance 0.40

0.78::true_val(availability_status_board_of_provo, available_bp); 0.22::true_val(availability_status_board_of_provo, unk_availability_status_board_of_provo).

0.70::acc(s10, availability_status_board_of_provo).

measured(s10, availability_status_board_of_provo, available_bp).

all_consistent(availability_status_board_of_provo) :-
    consistent(s10, availability_status_board_of_provo).

evidence(all_consistent(availability_status_board_of_provo)).
query(true_val(availability_status_board_of_provo, available_bp)).
query(true_val(availability_status_board_of_provo, unk_availability_status_board_of_provo)).

% @attr availability_status_salty_peaks
% @type categorical
% @canonical false
% @original_name availability_status
% @values available=Salty_Peaks_available unk_availability_status_salty_peaks=Unknown
% @importance 0.40

0.75::true_val(availability_status_salty_peaks, available_sp); 0.25::true_val(availability_status_salty_peaks, unk_availability_status_salty_peaks).

0.68::acc(s39, availability_status_salty_peaks).

measured(s39, availability_status_salty_peaks, available_sp).

all_consistent(availability_status_salty_peaks) :-
    consistent(s39, availability_status_salty_peaks).

evidence(all_consistent(availability_status_salty_peaks)).
query(true_val(availability_status_salty_peaks, available_sp)).
query(true_val(availability_status_salty_peaks, unk_availability_status_salty_peaks)).

% @attr availability_status_splinters
% @type categorical
% @canonical false
% @original_name availability_status
% @values available=Splinters_available unk_availability_status_splinters=Unknown
% @importance 0.40

0.75::true_val(availability_status_splinters, available_spl); 0.25::true_val(availability_status_splinters, unk_availability_status_splinters).

0.68::acc(s56, availability_status_splinters).

measured(s56, availability_status_splinters, available_spl).

all_consistent(availability_status_splinters) :-
    consistent(s56, availability_status_splinters).

evidence(all_consistent(availability_status_splinters)).
query(true_val(availability_status_splinters, available_spl)).
query(true_val(availability_status_splinters, unk_availability_status_splinters)).

% @attr availability_status_darkside
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_2026=Darkside_2026_model unk_availability_status_darkside=Unknown
% @importance 0.35

0.78::true_val(availability_status_darkside, available_2026); 0.22::true_val(availability_status_darkside, unk_availability_status_darkside).

0.72::acc(s63, availability_status_darkside).

measured(s63, availability_status_darkside, available_2026).

all_consistent(availability_status_darkside) :-
    consistent(s63, availability_status_darkside).

evidence(all_consistent(availability_status_darkside)).
query(true_val(availability_status_darkside, available_2026)).
query(true_val(availability_status_darkside, unk_availability_status_darkside)).

% @attr availability_status_ebay
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed_secondary=eBay_new_2025_156cm_listed unk_availability_status_ebay=Unknown
% @importance 0.55

0.72::true_val(availability_status_ebay, listed_secondary); 0.28::true_val(availability_status_ebay, unk_availability_status_ebay).

0.65::acc(s57, availability_status_ebay).

measured(s57, availability_status_ebay, listed_secondary).

all_consistent(availability_status_ebay) :-
    consistent(s57, availability_status_ebay).

evidence(all_consistent(availability_status_ebay)).
query(true_val(availability_status_ebay, listed_secondary)).
query(true_val(availability_status_ebay, unk_availability_status_ebay)).

% @attr shipping_restriction_melbourne
% @type categorical
% @canonical false
% @original_name Shipping restriction (Melbourne Snowboard)
% @values australia_only=Only_ships_within_Australia unk_shipping_restriction_melbourne=Unknown
% @importance 0.45

0.88::true_val(shipping_restriction_melbourne, australia_only); 0.12::true_val(shipping_restriction_melbourne, unk_shipping_restriction_melbourne).

0.85::acc(sm, shipping_restriction_melbourne).

measured(sm, shipping_restriction_melbourne, australia_only).

all_consistent(shipping_restriction_melbourne) :-
    consistent(sm, shipping_restriction_melbourne).

evidence(all_consistent(shipping_restriction_melbourne)).
query(true_val(shipping_restriction_melbourne, australia_only)).
query(true_val(shipping_restriction_melbourne, unk_shipping_restriction_melbourne)).

% @attr evo_reputation
% @type categorical
% @canonical false
% @original_name evo.com reputation
% @values major_established=Major_US_retailer_price_match_1yr_return unk_evo_reputation=Unknown
% @importance 0.66

0.88::true_val(evo_reputation, major_established); 0.12::true_val(evo_reputation, unk_evo_reputation).

0.82::acc(s32, evo_reputation).
0.82::acc(s102, evo_reputation).

measured(s32, evo_reputation, major_established).
measured(s102, evo_reputation, major_established).

all_consistent(evo_reputation) :-
    consistent(s32, evo_reputation).

evidence(all_consistent(evo_reputation)).
query(true_val(evo_reputation, major_established)).
query(true_val(evo_reputation, unk_evo_reputation)).

% @attr rei_reputation
% @type categorical
% @canonical false
% @original_name REI Co-op reputation
% @values major_coop=Major_US_coop_great_return_policy_0_reviews unk_rei_reputation=Unknown
% @importance 0.82

0.88::true_val(rei_reputation, major_coop); 0.12::true_val(rei_reputation, unk_rei_reputation).

0.85::acc(s80, rei_reputation).

measured(s80, rei_reputation, major_coop).

all_consistent(rei_reputation) :-
    consistent(s80, rei_reputation).

evidence(all_consistent(rei_reputation)).
query(true_val(rei_reputation, major_coop)).
query(true_val(rei_reputation, unk_rei_reputation)).

% @attr backcountry_reputation
% @type categorical
% @canonical false
% @original_name Backcountry.com reputation
% @values major_online=Major_US_online_outdoor_retailer unk_backcountry_reputation=Unknown
% @importance 0.65

0.85::true_val(backcountry_reputation, major_online); 0.15::true_val(backcountry_reputation, unk_backcountry_reputation).

0.82::acc(s35, backcountry_reputation).

measured(s35, backcountry_reputation, major_online).

all_consistent(backcountry_reputation) :-
    consistent(s35, backcountry_reputation).

evidence(all_consistent(backcountry_reputation)).
query(true_val(backcountry_reputation, major_online)).
query(true_val(backcountry_reputation, unk_backcountry_reputation)).

% @attr burton_reputation
% @type categorical
% @canonical false
% @original_name Burton.com reputation
% @values official_manufacturer_bcorp=Official_manufacturer_B_Corp_certified unk_burton_reputation=Unknown
% @importance 0.85

0.95::true_val(burton_reputation, official_manufacturer_bcorp); 0.05::true_val(burton_reputation, unk_burton_reputation).

0.95::acc(s2, burton_reputation).

measured(s2, burton_reputation, official_manufacturer_bcorp).

all_consistent(burton_reputation) :-
    consistent(s2, burton_reputation).

evidence(all_consistent(burton_reputation)).
query(true_val(burton_reputation, official_manufacturer_bcorp)).
query(true_val(burton_reputation, unk_burton_reputation)).

% @attr melbourne_snowboard_reputation
% @type categorical
% @canonical false
% @original_name Melbourne Snowboard Centre reputation
% @values au_indie_no_refunds=Australian_independent_store_credit_exchange_only unk_melbourne_snowboard_reputation=Unknown
% @importance 0.45

0.80::true_val(melbourne_snowboard_reputation, au_indie_no_refunds); 0.20::true_val(melbourne_snowboard_reputation, unk_melbourne_snowboard_reputation).

0.75::acc(s28, melbourne_snowboard_reputation).

measured(s28, melbourne_snowboard_reputation, au_indie_no_refunds).

all_consistent(melbourne_snowboard_reputation) :-
    consistent(s28, melbourne_snowboard_reputation).

evidence(all_consistent(melbourne_snowboard_reputation)).
query(true_val(melbourne_snowboard_reputation, au_indie_no_refunds)).
query(true_val(melbourne_snowboard_reputation, unk_melbourne_snowboard_reputation)).

% @attr flex_feel_character
% @type categorical
% @canonical false
% @original_name flex_feel
% @values catch_free_buttery=Catch_free_and_buttery_tip_to_tail unk_flex_feel_character=Unknown
% @importance 0.88

0.90::true_val(flex_feel_character, catch_free_buttery); 0.10::true_val(flex_feel_character, unk_flex_feel_character).

0.88::acc(s1, flex_feel_character).
0.85::acc(s8, flex_feel_character).

measured(s1, flex_feel_character, catch_free_buttery).
measured(s8, flex_feel_character, catch_free_buttery).

all_consistent(flex_feel_character) :-
    consistent(s1, flex_feel_character),
    (indep(s8), consistent(s8, flex_feel_character) ; \+indep(s8)).

evidence(all_consistent(flex_feel_character)).
query(true_val(flex_feel_character, catch_free_buttery)).
query(true_val(flex_feel_character, unk_flex_feel_character)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values rolls_easy_any_direction=Rolls_into_turns_easily_any_direction unk_turn_initiation_performance=Unknown
% @importance 0.82

0.88::true_val(turn_initiation_performance, rolls_easy_any_direction); 0.12::true_val(turn_initiation_performance, unk_turn_initiation_performance).

0.85::acc(s8, turn_initiation_performance).

measured(s8, turn_initiation_performance, rolls_easy_any_direction).

all_consistent(turn_initiation_performance) :-
    consistent(s8, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, rolls_easy_any_direction)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values effortless_powder_float=Effortless_float_in_powder_flat_top_wide_surface unk_positive_aspect=Unknown
% @importance 0.89

0.92::true_val(positive_aspect, effortless_powder_float); 0.08::true_val(positive_aspect, unk_positive_aspect).

0.82::acc(s9, positive_aspect).
0.88::acc(sm, positive_aspect).

measured(s9, positive_aspect, effortless_powder_float).
measured(sm, positive_aspect, effortless_powder_float).

all_consistent(positive_aspect) :-
    (indep(s9), consistent(s9, positive_aspect) ; \+indep(s9)),
    (indep(sm), consistent(sm, positive_aspect) ; \+indep(sm)).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, effortless_powder_float)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr pop
% @type categorical
% @canonical true
% @original_name pop
% @values snappy_carbon_no_stiff=Snappy_pop_45_carbon_without_stiffness unk_pop=Unknown
% @importance 0.77

0.87::true_val(pop, snappy_carbon_no_stiff); 0.13::true_val(pop, unk_pop).

0.82::acc(s8, pop).
0.80::acc(s30, pop).

measured(s8, pop, snappy_carbon_no_stiff).
measured(s30, pop, snappy_carbon_no_stiff).

all_consistent(pop) :-
    consistent(s8, pop).

evidence(all_consistent(pop)).
query(true_val(pop, snappy_carbon_no_stiff)).
query(true_val(pop, unk_pop)).

% @attr versatility_marketing
% @type categorical
% @canonical false
% @original_name Versatility (marketing claim)
% @values more_versatile_than_looks=More_versatile_than_exterior_suggests unk_versatility_marketing=Unknown
% @importance 0.88

0.85::true_val(versatility_marketing, more_versatile_than_looks); 0.15::true_val(versatility_marketing, unk_versatility_marketing).

0.82::acc(s4, versatility_marketing).

measured(s4, versatility_marketing, more_versatile_than_looks).

all_consistent(versatility_marketing) :-
    consistent(s4, versatility_marketing).

evidence(all_consistent(versatility_marketing)).
query(true_val(versatility_marketing, more_versatile_than_looks)).
query(true_val(versatility_marketing, unk_versatility_marketing)).

% @attr positive_aspect_surf_feel
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values surf_float_maneuverability=Surf_inspired_float_and_maneuverability unk_positive_aspect_surf_feel=Unknown
% @importance 0.95

0.90::true_val(positive_aspect_surf_feel, surf_float_maneuverability); 0.10::true_val(positive_aspect_surf_feel, unk_positive_aspect_surf_feel).

0.88::acc(s1, positive_aspect_surf_feel).

measured(s1, positive_aspect_surf_feel, surf_float_maneuverability).

all_consistent(positive_aspect_surf_feel) :-
    consistent(s1, positive_aspect_surf_feel).

evidence(all_consistent(positive_aspect_surf_feel)).
query(true_val(positive_aspect_surf_feel, surf_float_maneuverability)).
query(true_val(positive_aspect_surf_feel, unk_positive_aspect_surf_feel)).

% @attr positive_aspect_responsive
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values ultra_responsive_playful=Ultra_responsive_and_playful_experience unk_positive_aspect_responsive=Unknown
% @importance 0.95

0.90::true_val(positive_aspect_responsive, ultra_responsive_playful); 0.10::true_val(positive_aspect_responsive, unk_positive_aspect_responsive).

0.88::acc(s1, positive_aspect_responsive).

measured(s1, positive_aspect_responsive, ultra_responsive_playful).

all_consistent(positive_aspect_responsive) :-
    consistent(s1, positive_aspect_responsive).

evidence(all_consistent(positive_aspect_responsive)).
query(true_val(positive_aspect_responsive, ultra_responsive_playful)).
query(true_val(positive_aspect_responsive, unk_positive_aspect_responsive)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values limited_versatility=Purpose_built_powder_limited_all_mountain_3_10 unk_negative_aspect=Unknown
% @importance 0.89

0.90::true_val(negative_aspect, limited_versatility); 0.10::true_val(negative_aspect, unk_negative_aspect).

0.82::acc(s9, negative_aspect).
0.88::acc(sm, negative_aspect).

measured(s9, negative_aspect, limited_versatility).
measured(sm, negative_aspect, limited_versatility).

all_consistent(negative_aspect) :-
    (indep(s9), consistent(s9, negative_aspect) ; \+indep(s9)),
    (indep(sm), consistent(sm, negative_aspect) ; \+indep(sm)).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, limited_versatility)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_no_park
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values no_park=Park_rating_0_10_not_suitable unk_negative_aspect_no_park=Unknown
% @importance 0.87

0.92::true_val(negative_aspect_no_park, no_park); 0.08::true_val(negative_aspect_no_park, unk_negative_aspect_no_park).

0.88::acc(sm, negative_aspect_no_park).

measured(sm, negative_aspect_no_park, no_park).

all_consistent(negative_aspect_no_park) :-
    consistent(sm, negative_aspect_no_park).

evidence(all_consistent(negative_aspect_no_park)).
query(true_val(negative_aspect_no_park, no_park)).
query(true_val(negative_aspect_no_park, unk_negative_aspect_no_park)).

% @attr negative_aspect_hardpack
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values catchy_nose_firm_snow=Nose_catchy_in_firm_snow_not_at_home_hard_conditions unk_negative_aspect_hardpack=Unknown
% @importance 0.75

0.72::true_val(negative_aspect_hardpack, catchy_nose_firm_snow); 0.28::true_val(negative_aspect_hardpack, unk_negative_aspect_hardpack).

0.55::acc(s75, negative_aspect_hardpack).

measured(s75, negative_aspect_hardpack, catchy_nose_firm_snow).

all_consistent(negative_aspect_hardpack) :-
    consistent(s75, negative_aspect_hardpack).

evidence(all_consistent(negative_aspect_hardpack)).
query(true_val(negative_aspect_hardpack, catchy_nose_firm_snow)).
query(true_val(negative_aspect_hardpack, unk_negative_aspect_hardpack)).

% @attr user_reviews_snowbindx
% @type categorical
% @canonical false
% @original_name No user reviews yet on Snowbindx
% @values no_reviews=No_user_reviews unk_user_reviews_snowbindx=Unknown
% @importance 0.85

0.85::true_val(user_reviews_snowbindx, no_reviews); 0.15::true_val(user_reviews_snowbindx, unk_user_reviews_snowbindx).

0.78::acc(s9, user_reviews_snowbindx).

measured(s9, user_reviews_snowbindx, no_reviews).

all_consistent(user_reviews_snowbindx) :-
    consistent(s9, user_reviews_snowbindx).

evidence(all_consistent(user_reviews_snowbindx)).
query(true_val(user_reviews_snowbindx, no_reviews)).
query(true_val(user_reviews_snowbindx, unk_user_reviews_snowbindx)).

% @attr user_reviews_rei
% @type categorical
% @canonical false
% @original_name No user reviews yet on REI
% @values no_reviews=No_user_reviews unk_user_reviews_rei=Unknown
% @importance 0.82

0.88::true_val(user_reviews_rei, no_reviews_rei); 0.12::true_val(user_reviews_rei, unk_user_reviews_rei).

0.85::acc(s80, user_reviews_rei).

measured(s80, user_reviews_rei, no_reviews_rei).

all_consistent(user_reviews_rei) :-
    consistent(s80, user_reviews_rei).

evidence(all_consistent(user_reviews_rei)).
query(true_val(user_reviews_rei, no_reviews_rei)).
query(true_val(user_reviews_rei, unk_user_reviews_rei)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values fish_3d=Burton_Family_Tree_3D_Fish_30mm_taper unk_comparable_board_same_brand=Unknown
% @importance 0.66

0.80::true_val(comparable_board_same_brand, fish_3d); 0.20::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

0.65::acc(s44, comparable_board_same_brand).
0.60::acc(s77, comparable_board_same_brand).

measured(s44, comparable_board_same_brand, fish_3d).
measured(s77, comparable_board_same_brand, fish_3d).

all_consistent(comparable_board_same_brand) :-
    consistent(s44, comparable_board_same_brand),
    consistent(s77, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, fish_3d)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_hero
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values hometown_hero=Burton_Family_Tree_Hometown_Hero_directional_camber unk_comparable_board_same_brand_hero=Unknown
% @importance 0.72

0.75::true_val(comparable_board_same_brand_hero, hometown_hero); 0.25::true_val(comparable_board_same_brand_hero, unk_comparable_board_same_brand_hero).

0.60::acc(s79, comparable_board_same_brand_hero).

measured(s79, comparable_board_same_brand_hero, hometown_hero).

all_consistent(comparable_board_same_brand_hero) :-
    consistent(s79, comparable_board_same_brand_hero).

evidence(all_consistent(comparable_board_same_brand_hero)).
query(true_val(comparable_board_same_brand_hero, hometown_hero)).
query(true_val(comparable_board_same_brand_hero, unk_comparable_board_same_brand_hero)).

% @attr comparable_board_same_brand_deep_daze
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values deep_daze=Burton_Family_Tree_Deep_Daze_3d_powder unk_comparable_board_same_brand_deep_daze=Unknown
% @importance 0.72

0.72::true_val(comparable_board_same_brand_deep_daze, deep_daze); 0.28::true_val(comparable_board_same_brand_deep_daze, unk_comparable_board_same_brand_deep_daze).

0.58::acc(s71, comparable_board_same_brand_deep_daze).

measured(s71, comparable_board_same_brand_deep_daze, deep_daze).

all_consistent(comparable_board_same_brand_deep_daze) :-
    consistent(s71, comparable_board_same_brand_deep_daze).

evidence(all_consistent(comparable_board_same_brand_deep_daze)).
query(true_val(comparable_board_same_brand_deep_daze, deep_daze)).
query(true_val(comparable_board_same_brand_deep_daze, unk_comparable_board_same_brand_deep_daze)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values bataleon_surfer=Bataleon_Surfer_3BT_28mm_taper unk_comparable_board_cross_brand=Unknown
% @importance 0.68

0.78::true_val(comparable_board_cross_brand, bataleon_surfer); 0.22::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

0.60::acc(s44, comparable_board_cross_brand).
0.55::acc(s81, comparable_board_cross_brand).

measured(s44, comparable_board_cross_brand, bataleon_surfer).
measured(s81, comparable_board_cross_brand, bataleon_surfer).

all_consistent(comparable_board_cross_brand) :-
    consistent(s44, comparable_board_cross_brand),
    consistent(s81, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, bataleon_surfer)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_storm_chaser
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values jones_storm_chaser=Jones_Storm_Chaser unk_comparable_board_cross_brand_storm_chaser=Unknown
% @importance 0.72

0.75::true_val(comparable_board_cross_brand_storm_chaser, jones_storm_chaser); 0.25::true_val(comparable_board_cross_brand_storm_chaser, unk_comparable_board_cross_brand_storm_chaser).

0.60::acc(s79, comparable_board_cross_brand_storm_chaser).

measured(s79, comparable_board_cross_brand_storm_chaser, jones_storm_chaser).

all_consistent(comparable_board_cross_brand_storm_chaser) :-
    consistent(s79, comparable_board_cross_brand_storm_chaser).

evidence(all_consistent(comparable_board_cross_brand_storm_chaser)).
query(true_val(comparable_board_cross_brand_storm_chaser, jones_storm_chaser)).
query(true_val(comparable_board_cross_brand_storm_chaser, unk_comparable_board_cross_brand_storm_chaser)).

% @attr comparable_board_cross_brand_korua
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values korua_dart_pencil=Korua_Dart_Pencil unk_comparable_board_cross_brand_korua=Unknown
% @importance 0.72

0.72::true_val(comparable_board_cross_brand_korua, korua_dart_pencil); 0.28::true_val(comparable_board_cross_brand_korua, unk_comparable_board_cross_brand_korua).

0.55::acc(s81, comparable_board_cross_brand_korua).

measured(s81, comparable_board_cross_brand_korua, korua_dart_pencil).

all_consistent(comparable_board_cross_brand_korua) :-
    consistent(s81, comparable_board_cross_brand_korua).

evidence(all_consistent(comparable_board_cross_brand_korua)).
query(true_val(comparable_board_cross_brand_korua, korua_dart_pencil)).
query(true_val(comparable_board_cross_brand_korua, unk_comparable_board_cross_brand_korua)).

% @attr comparable_board_cross_brand_nidecker
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values nidecker_mellow=Nidecker_Mellow unk_comparable_board_cross_brand_nidecker=Unknown
% @importance 0.72

0.72::true_val(comparable_board_cross_brand_nidecker, nidecker_mellow); 0.28::true_val(comparable_board_cross_brand_nidecker, unk_comparable_board_cross_brand_nidecker).

0.55::acc(s81, comparable_board_cross_brand_nidecker).

measured(s81, comparable_board_cross_brand_nidecker, nidecker_mellow).

all_consistent(comparable_board_cross_brand_nidecker) :-
    consistent(s81, comparable_board_cross_brand_nidecker).

evidence(all_consistent(comparable_board_cross_brand_nidecker)).
query(true_val(comparable_board_cross_brand_nidecker, nidecker_mellow)).
query(true_val(comparable_board_cross_brand_nidecker, unk_comparable_board_cross_brand_nidecker)).

% @attr comparable_board_same_brand_2026_return
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values returns_2026=Channel_Surfer_returns_2026_second_season unk_comparable_board_same_brand_2026_return=Unknown
% @importance 0.88

0.93::true_val(comparable_board_same_brand_2026_return, returns_2026); 0.07::true_val(comparable_board_same_brand_2026_return, unk_comparable_board_same_brand_2026_return).

0.92::acc(s93, comparable_board_same_brand_2026_return).

measured(s93, comparable_board_same_brand_2026_return, returns_2026).

all_consistent(comparable_board_same_brand_2026_return) :-
    consistent(s93, comparable_board_same_brand_2026_return).

evidence(all_consistent(comparable_board_same_brand_2026_return)).
query(true_val(comparable_board_same_brand_2026_return, returns_2026)).
query(true_val(comparable_board_same_brand_2026_return, unk_comparable_board_same_brand_2026_return)).

% @attr fish_3d_weight_related
% @type numeric
% @unit g
% @canonical false
% @original_name Burton Fish 3D weight (related board, 161cm)
% @values v2900=2900.0 unk_fish_3d_weight_related=Unknown
% @importance 0.65

0.68::true_val(fish_3d_weight_related, v2900); 0.32::true_val(fish_3d_weight_related, unk_fish_3d_weight_related).

0.60::acc(s44, fish_3d_weight_related).

measured(s44, fish_3d_weight_related, v2900).

all_consistent(fish_3d_weight_related) :-
    consistent(s44, fish_3d_weight_related).

evidence(all_consistent(fish_3d_weight_related)).
query(true_val(fish_3d_weight_related, v2900)).
query(true_val(fish_3d_weight_related, unk_fish_3d_weight_related)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values happy_rated_strongly=Really_happy_responded_rated_strongly unk_user_review_forum=Unknown
% @importance 0.68

0.72::true_val(user_review_forum, happy_rated_strongly); 0.28::true_val(user_review_forum, unk_user_review_forum).

0.60::acc(s44, user_review_forum).
0.55::acc(s79, user_review_forum).

measured(s44, user_review_forum, happy_rated_strongly).
measured(s79, user_review_forum, happy_rated_strongly).

all_consistent(user_review_forum) :-
    consistent(s44, user_review_forum),
    consistent(s79, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, happy_rated_strongly)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr heli_skiing_fleet
% @type categorical
% @canonical false
% @original_name Heli-skiing fleet usage
% @values bc_heli_stocks_fish=Largest_BC_heli_operator_stocks_Fish_3D unk_heli_skiing_fleet=Unknown
% @importance 0.72

0.65::true_val(heli_skiing_fleet, bc_heli_stocks_fish); 0.35::true_val(heli_skiing_fleet, unk_heli_skiing_fleet).

0.50::acc(s79, heli_skiing_fleet).

measured(s79, heli_skiing_fleet, bc_heli_stocks_fish).

all_consistent(heli_skiing_fleet) :-
    consistent(s79, heli_skiing_fleet).

evidence(all_consistent(heli_skiing_fleet)).
query(true_val(heli_skiing_fleet, bc_heli_stocks_fish)).
query(true_val(heli_skiing_fleet, unk_heli_skiing_fleet)).

% @attr user_review_forum_fish_surfers
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values fish_3d_151_for_surfers=Fish_3D_151_recommended_for_surfers unk_user_review_forum_fish_surfers=Unknown
% @importance 0.72

0.70::true_val(user_review_forum_fish_surfers, fish_3d_151_for_surfers); 0.30::true_val(user_review_forum_fish_surfers, unk_user_review_forum_fish_surfers).

0.55::acc(s81, user_review_forum_fish_surfers).

measured(s81, user_review_forum_fish_surfers, fish_3d_151_for_surfers).

all_consistent(user_review_forum_fish_surfers) :-
    consistent(s81, user_review_forum_fish_surfers).

evidence(all_consistent(user_review_forum_fish_surfers)).
query(true_val(user_review_forum_fish_surfers, fish_3d_151_for_surfers)).
query(true_val(user_review_forum_fish_surfers, unk_user_review_forum_fish_surfers)).

% @attr au_stock_limited
% @type categorical
% @canonical false
% @original_name Burton 3D boards noted for limited stock in Australia
% @values limited_au_stock=Limited_stock_in_Australia unk_au_stock_limited=Unknown
% @importance 0.65

0.68::true_val(au_stock_limited, limited_au_stock); 0.32::true_val(au_stock_limited, unk_au_stock_limited).

0.55::acc(s44, au_stock_limited).

measured(s44, au_stock_limited, limited_au_stock).

all_consistent(au_stock_limited) :-
    consistent(s44, au_stock_limited).

evidence(all_consistent(au_stock_limited)).
query(true_val(au_stock_limited, limited_au_stock)).
query(true_val(au_stock_limited, unk_au_stock_limited)).

% @attr user_review_forum_binding_compat
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values all_new_bindings_mount=Almost_all_new_bindings_mount_on_Channel unk_user_review_forum_binding_compat=Unknown
% @importance 0.78

0.82::true_val(user_review_forum_binding_compat, all_new_bindings_mount); 0.18::true_val(user_review_forum_binding_compat, unk_user_review_forum_binding_compat).

0.72::acc(s20, user_review_forum_binding_compat).
0.68::acc(s72, user_review_forum_binding_compat).

measured(s20, user_review_forum_binding_compat, all_new_bindings_mount).
measured(s72, user_review_forum_binding_compat, all_new_bindings_mount).

all_consistent(user_review_forum_binding_compat) :-
    consistent(s20, user_review_forum_binding_compat).

evidence(all_consistent(user_review_forum_binding_compat)).
query(true_val(user_review_forum_binding_compat, all_new_bindings_mount)).
query(true_val(user_review_forum_binding_compat, unk_user_review_forum_binding_compat)).

% @attr user_review_forum_base_issue
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values chalky_base_2021_fixed_2023=Chalky_base_2021_reportedly_fixed_2023 unk_user_review_forum_base_issue=Unknown
% @importance 0.68

0.68::true_val(user_review_forum_base_issue, chalky_base_2021_fixed_2023); 0.32::true_val(user_review_forum_base_issue, unk_user_review_forum_base_issue).

0.62::acc(s77, user_review_forum_base_issue).

measured(s77, user_review_forum_base_issue, chalky_base_2021_fixed_2023).

all_consistent(user_review_forum_base_issue) :-
    consistent(s77, user_review_forum_base_issue).

evidence(all_consistent(user_review_forum_base_issue)).
query(true_val(user_review_forum_base_issue, chalky_base_2021_fixed_2023)).
query(true_val(user_review_forum_base_issue, unk_user_review_forum_base_issue)).

% @attr burton_blog_description
% @type categorical
% @canonical false
% @original_name Burton blog description
% @values expert_carve_cruise_wave=For_expert_riders_carve_cruise_entire_mountain_endless_wave unk_burton_blog_description=Unknown
% @importance 0.88

0.90::true_val(burton_blog_description, expert_carve_cruise_wave); 0.10::true_val(burton_blog_description, unk_burton_blog_description).

0.90::acc(s4, burton_blog_description).

measured(s4, burton_blog_description, expert_carve_cruise_wave).

all_consistent(burton_blog_description) :-
    consistent(s4, burton_blog_description).

evidence(all_consistent(burton_blog_description)).
query(true_val(burton_blog_description, expert_carve_cruise_wave)).
query(true_val(burton_blog_description, unk_burton_blog_description)).

% @attr development_process
% @type categorical
% @canonical false
% @original_name Development process
% @values extensive_on_snow_testing=Hours_days_months_on_snow_testing_team_riders unk_development_process=Unknown
% @importance 0.70

0.85::true_val(development_process, extensive_on_snow_testing); 0.15::true_val(development_process, unk_development_process).

0.88::acc(s65, development_process).

measured(s65, development_process, extensive_on_snow_testing).

all_consistent(development_process) :-
    consistent(s65, development_process).

evidence(all_consistent(development_process)).
query(true_val(development_process, extensive_on_snow_testing)).
query(true_val(development_process, unk_development_process)).

% @attr burton_new_offering
% @type categorical
% @canonical false
% @original_name Burton describes the board as an all-new Family Tree offering
% @values all_new_winter_25=All_new_Family_Tree_offering_Winter_25 unk_burton_new_offering=Unknown
% @importance 0.70

0.88::true_val(burton_new_offering, all_new_winter_25); 0.12::true_val(burton_new_offering, unk_burton_new_offering).

0.90::acc(s65, burton_new_offering).

measured(s65, burton_new_offering, all_new_winter_25).

all_consistent(burton_new_offering) :-
    consistent(s65, burton_new_offering).

evidence(all_consistent(burton_new_offering)).
query(true_val(burton_new_offering, all_new_winter_25)).
query(true_val(burton_new_offering, unk_burton_new_offering)).

% @attr snowboard_robot_flex_note
% @type categorical
% @canonical false
% @original_name Snowboard Robot notes
% @values few_new_models_mostly_graphic=No_huge_changes_2025_few_new_models_mostly_graphics unk_snowboard_robot_flex_note=Unknown
% @importance 0.90

0.82::true_val(snowboard_robot_flex_note, few_new_models_mostly_graphic); 0.18::true_val(snowboard_robot_flex_note, unk_snowboard_robot_flex_note).

0.75::acc(s20, snowboard_robot_flex_note).

measured(s20, snowboard_robot_flex_note, few_new_models_mostly_graphic).

all_consistent(snowboard_robot_flex_note) :-
    consistent(s20, snowboard_robot_flex_note).

evidence(all_consistent(snowboard_robot_flex_note)).
query(true_val(snowboard_robot_flex_note, few_new_models_mostly_graphic)).
query(true_val(snowboard_robot_flex_note, unk_snowboard_robot_flex_note)).

% @attr size_chart_units
% @type categorical
% @canonical false
% @original_name Size chart units
% @values millimetres=Millimetres unk_size_chart_units=Unknown
% @importance 0.85

0.95::true_val(size_chart_units, millimetres); 0.05::true_val(size_chart_units, unk_size_chart_units).

0.93::acc(sm, size_chart_units).

measured(sm, size_chart_units, millimetres).

all_consistent(size_chart_units) :-
    consistent(sm, size_chart_units).

evidence(all_consistent(size_chart_units)).
query(true_val(size_chart_units, millimetres)).
query(true_val(size_chart_units, unk_size_chart_units)).

% @attr available_sizes_all
% @type categorical
% @canonical false
% @original_name available_sizes
% @values four_sizes=144_150_156_162cm unk_available_sizes_all=Unknown
% @importance 0.85

0.93::true_val(available_sizes_all, four_sizes); 0.07::true_val(available_sizes_all, unk_available_sizes_all).

0.93::acc(sm, available_sizes_all).

measured(sm, available_sizes_all, four_sizes).

all_consistent(available_sizes_all) :-
    consistent(sm, available_sizes_all).

evidence(all_consistent(available_sizes_all)).
query(true_val(available_sizes_all, four_sizes)).
query(true_val(available_sizes_all, unk_available_sizes_all)).