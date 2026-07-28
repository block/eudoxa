0.15::indep(s_merchant).
0.15::indep(s1).
0.20::indep(s2).
0.15::indep(s3).
0.12::indep(s5).
0.12::indep(s6).
0.12::indep(s9).
0.25::indep(s10).
0.12::indep(s14).
0.12::indep(s19).
0.15::indep(s26).
0.25::indep(s32).
0.12::indep(s34).
0.12::indep(s36).
0.30::indep(s37).
0.20::indep(s39).
0.20::indep(s79).
0.12::indep(s83).
0.15::indep(s85).
0.12::indep(s87).
0.25::indep(s93).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values burton_snowboards=Burton_Snowboards unk_brand=Unknown
% @importance 0.67

0.93::acc(s_merchant, brand).
0.85::acc(s4, brand).

0.97::true_val(brand, burton_snowboards); 0.03::true_val(brand, unk_brand).

measured(s_merchant, brand, burton_snowboards).
measured(s4, brand, burton_snowboards).

all_consistent(brand) :-
    consistent(s4, brand),
    (indep(s_merchant), consistent(s_merchant, brand) ; \+indep(s_merchant)).

evidence(all_consistent(brand)).
query(true_val(brand, burton_snowboards)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values custom_glow=Custom_Glow_Camber unk_model_name=Unknown
% @importance 0.82

0.93::acc(s_merchant, model_name).
0.88::acc(s2, model_name).

0.97::true_val(model_name, custom_glow); 0.03::true_val(model_name, unk_model_name).

measured(s_merchant, model_name, custom_glow).
measured(s2, model_name, custom_glow).

all_consistent(model_name) :-
    (indep(s_merchant), consistent(s_merchant, model_name) ; \+indep(s_merchant)),
    (indep(s2), consistent(s2, model_name) ; \+indep(s2)).

evidence(all_consistent(model_name)).
query(true_val(model_name, custom_glow)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2026=2026 unk_model_year=Unknown
% @importance 0.92

0.93::acc(s_merchant, model_year).
0.90::acc(s15, model_year).
0.85::acc(s37, model_year).

0.97::true_val(model_year, y2026); 0.03::true_val(model_year, unk_model_year).

measured(s_merchant, model_year, y2026).
measured(s15, model_year, y2026).
measured(s37, model_year, y2026).

all_consistent(model_year) :-
    consistent(s15, model_year),
    (indep(s_merchant), consistent(s_merchant, model_year) ; \+indep(s_merchant)),
    (indep(s37), consistent(s37, model_year) ; \+indep(s37)).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2026)).
query(true_val(model_year, unk_model_year)).

% @attr model_series
% @type categorical
% @canonical false
% @original_name model series
% @values burton_custom_since_1996=Burton_Custom_since_1996 unk_model_series=Unknown
% @importance 0.55

0.85::acc(s4, model_series).
0.63::acc(s1, model_series).

0.92::true_val(model_series, burton_custom_since_1996); 0.08::true_val(model_series, unk_model_series).

measured(s4, model_series, burton_custom_since_1996).
measured(s1, model_series, burton_custom_since_1996).

all_consistent(model_series) :-
    consistent(s4, model_series),
    (indep(s1), consistent(s1, model_series) ; \+indep(s1)).

evidence(all_consistent(model_series)).
query(true_val(model_series, burton_custom_since_1996)).
query(true_val(model_series, unk_model_series)).

% @attr series_first_year
% @type numeric
% @canonical false
% @original_name series first year
% @values v1996=1996 unk_series_first_year=Unknown
% @importance 0.65

0.63::acc(s1, series_first_year).
0.55::acc(s10, series_first_year).

0.88::true_val(series_first_year, v1996); 0.12::true_val(series_first_year, unk_series_first_year).

measured(s1, series_first_year, v1996).
measured(s10, series_first_year, v1996).

all_consistent(series_first_year) :-
    (indep(s1), consistent(s1, series_first_year) ; \+indep(s1)),
    (indep(s10), consistent(s10, series_first_year) ; \+indep(s10)).

evidence(all_consistent(series_first_year)).
query(true_val(series_first_year, v1996)).
query(true_val(series_first_year, unk_series_first_year)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.88

0.93::acc(s_merchant, product_type).
0.67::acc(s36, product_type).

0.97::true_val(product_type, snowboard); 0.03::true_val(product_type, unk_product_type).

measured(s_merchant, product_type, snowboard).
measured(s36, product_type, snowboard).

all_consistent(product_type) :-
    (indep(s_merchant), consistent(s_merchant, product_type) ; \+indep(s_merchant)),
    (indep(s36), consistent(s36, product_type) ; \+indep(s36)).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unisex=Unisex unk_gender=Unknown
% @importance 0.83

0.85::acc(s2, gender).
0.82::acc(s37, gender).

0.55::true_val(gender, mens); 0.40::true_val(gender, unisex); 0.05::true_val(gender, unk_gender).

measured(s2, gender, mens).
measured(s37, gender, unisex).

all_consistent(gender) :-
    (indep(s2), consistent(s2, gender) ; \+indep(s2)),
    (indep(s37), consistent(s37, gender) ; \+indep(s37)).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unisex)).
query(true_val(gender, unk_gender)).

% @attr available_colors
% @type categorical
% @canonical true
% @original_name available_colors
% @values glow=Glow unk_available_colors=Unknown
% @importance 0.45

0.85::acc(s4, available_colors).
0.85::acc(s18, available_colors).

0.95::true_val(available_colors, glow); 0.05::true_val(available_colors, unk_available_colors).

measured(s4, available_colors, glow).
measured(s18, available_colors, glow).

all_consistent(available_colors) :-
    consistent(s4, available_colors),
    consistent(s18, available_colors).

evidence(all_consistent(available_colors)).
query(true_val(available_colors, glow)).
query(true_val(available_colors, unk_available_colors)).

% @attr topsheet_appearance_description
% @type categorical
% @canonical true
% @original_name topsheet_appearance_description
% @values neon_glow_in_dark=Neon_inspired_glow_in_the_dark_ink unk_topsheet_appearance_description=Unknown
% @importance 0.60

0.80::acc(s3, topsheet_appearance_description).
0.85::acc(s4, topsheet_appearance_description).

0.95::true_val(topsheet_appearance_description, neon_glow_in_dark); 0.05::true_val(topsheet_appearance_description, unk_topsheet_appearance_description).

measured(s3, topsheet_appearance_description, neon_glow_in_dark).
measured(s4, topsheet_appearance_description, neon_glow_in_dark).

all_consistent(topsheet_appearance_description) :-
    consistent(s4, topsheet_appearance_description),
    (indep(s3), consistent(s3, topsheet_appearance_description) ; \+indep(s3)).

evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, neon_glow_in_dark)).
query(true_val(topsheet_appearance_description, unk_topsheet_appearance_description)).

% @attr jungle_graphic_ai
% @type categorical
% @canonical false
% @original_name Jungle graphic
% @values ai_used_jungle_only=AI_used_for_Jungle_graphic_only unk_jungle_graphic_ai=Unknown
% @importance 0.50

0.72::acc(s51, jungle_graphic_ai).

0.90::true_val(jungle_graphic_ai, ai_used_jungle_only); 0.10::true_val(jungle_graphic_ai, unk_jungle_graphic_ai).

measured(s51, jungle_graphic_ai, ai_used_jungle_only).

all_consistent(jungle_graphic_ai) :-
    consistent(s51, jungle_graphic_ai).

evidence(all_consistent(jungle_graphic_ai)).
query(true_val(jungle_graphic_ai, ai_used_jungle_only)).
query(true_val(jungle_graphic_ai, unk_jungle_graphic_ai)).

% @attr glow_graphic_not_ai
% @type categorical
% @canonical false
% @original_name Glow graphic is NOT AI-generated
% @values not_ai_generated=Not_AI_generated unk_glow_graphic_not_ai=Unknown
% @importance 0.50

0.72::acc(s51, glow_graphic_not_ai).

0.90::true_val(glow_graphic_not_ai, not_ai_generated); 0.10::true_val(glow_graphic_not_ai, unk_glow_graphic_not_ai).

measured(s51, glow_graphic_not_ai, not_ai_generated).

all_consistent(glow_graphic_not_ai) :-
    consistent(s51, glow_graphic_not_ai).

evidence(all_consistent(glow_graphic_not_ai)).
query(true_val(glow_graphic_not_ai, not_ai_generated)).
query(true_val(glow_graphic_not_ai, unk_glow_graphic_not_ai)).

% @attr sku
% @type categorical
% @canonical false
% @original_name SKU
% @values sku_106881aai2rg150=106881AAI2RG150 unk_sku=Unknown
% @importance 0.85

0.93::acc(s_merchant, sku).

0.95::true_val(sku, sku_106881aai2rg150); 0.05::true_val(sku, unk_sku).

measured(s_merchant, sku, sku_106881aai2rg150).

all_consistent(sku) :-
    consistent(s_merchant, sku).

evidence(all_consistent(sku)).
query(true_val(sku, sku_106881aai2rg150)).
query(true_val(sku, unk_sku)).

% @attr manufacturer
% @type categorical
% @canonical false
% @original_name manufacturer
% @values burton_founded_1977=Burton_Snowboards_founded_1977 unk_manufacturer=Unknown
% @importance 0.60

0.64::acc(s68, manufacturer).

0.85::true_val(manufacturer, burton_founded_1977); 0.15::true_val(manufacturer, unk_manufacturer).

measured(s68, manufacturer, burton_founded_1977).

all_consistent(manufacturer) :-
    consistent(s68, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, burton_founded_1977)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr manufacturer_headquarters
% @type categorical
% @canonical false
% @original_name manufacturer headquarters
% @values burlington_vt_usa=Burlington_Vermont_USA unk_manufacturer_headquarters=Unknown
% @importance 0.60

0.64::acc(s68, manufacturer_headquarters).

0.85::true_val(manufacturer_headquarters, burlington_vt_usa); 0.15::true_val(manufacturer_headquarters, unk_manufacturer_headquarters).

measured(s68, manufacturer_headquarters, burlington_vt_usa).

all_consistent(manufacturer_headquarters) :-
    consistent(s68, manufacturer_headquarters).

evidence(all_consistent(manufacturer_headquarters)).
query(true_val(manufacturer_headquarters, burlington_vt_usa)).
query(true_val(manufacturer_headquarters, unk_manufacturer_headquarters)).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values kiel_nindl_austria=Kiel_Nindl_GMBH_Austria unk_manufacturing_location_current=Unknown
% @importance 0.68

0.88::acc(s39, manufacturing_location_current).

0.92::true_val(manufacturing_location_current, kiel_nindl_austria); 0.08::true_val(manufacturing_location_current, unk_manufacturing_location_current).

measured(s39, manufacturing_location_current, kiel_nindl_austria).

all_consistent(manufacturing_location_current) :-
    (indep(s39), consistent(s39, manufacturing_location_current) ; \+indep(s39)).

evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, kiel_nindl_austria)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

% @attr prototyping_facility
% @type categorical
% @canonical false
% @original_name prototyping facility
% @values burlington_vt=Burlington_Vermont_RD unk_prototyping_facility=Unknown
% @importance 0.58

0.55::acc(s69, prototyping_facility).
0.68::acc(s70, prototyping_facility).

0.88::true_val(prototyping_facility, burlington_vt); 0.12::true_val(prototyping_facility, unk_prototyping_facility).

measured(s69, prototyping_facility, burlington_vt).
measured(s70, prototyping_facility, burlington_vt).

all_consistent(prototyping_facility) :-
    consistent(s69, prototyping_facility),
    consistent(s70, prototyping_facility).

evidence(all_consistent(prototyping_facility)).
query(true_val(prototyping_facility, burlington_vt)).
query(true_val(prototyping_facility, unk_prototyping_facility)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values b_corp=Certified_B_Corp unk_sustainability_certification=Unknown
% @importance 0.30

0.70::acc(s5, sustainability_certification).

0.82::true_val(sustainability_certification, b_corp); 0.18::true_val(sustainability_certification, unk_sustainability_certification).

measured(s5, sustainability_certification, b_corp).

all_consistent(sustainability_certification) :-
    (indep(s5), consistent(s5, sustainability_certification) ; \+indep(s5)).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, b_corp)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr anniversary_30th
% @type categorical
% @canonical false
% @original_name 30th anniversary
% @values y2026_30th=2026_marks_30th_year unk_anniversary_30th=Unknown
% @importance 0.45

0.85::acc(s4, anniversary_30th).
0.85::acc(s18, anniversary_30th).

0.95::true_val(anniversary_30th, y2026_30th); 0.05::true_val(anniversary_30th, unk_anniversary_30th).

measured(s4, anniversary_30th, y2026_30th).
measured(s18, anniversary_30th, y2026_30th).

all_consistent(anniversary_30th) :-
    consistent(s4, anniversary_30th),
    consistent(s18, anniversary_30th).

evidence(all_consistent(anniversary_30th)).
query(true_val(anniversary_30th, y2026_30th)).
query(true_val(anniversary_30th, unk_anniversary_30th)).

% @attr model_change_2026
% @type categorical
% @canonical false
% @original_name 2026 model change
% @values graphic_only=New_graphic_only_no_spec_changes unk_model_change_2026=Unknown
% @importance 0.80

0.85::acc(s12, model_change_2026).
0.78::acc(s23, model_change_2026).

0.93::true_val(model_change_2026, graphic_only); 0.07::true_val(model_change_2026, unk_model_change_2026).

measured(s12, model_change_2026, graphic_only).
measured(s23, model_change_2026, graphic_only).

all_consistent(model_change_2026) :-
    (indep(s2), consistent(s2, model_change_2026) ; \+indep(s2)).

evidence(all_consistent(model_change_2026)).
query(true_val(model_change_2026, graphic_only)).
query(true_val(model_change_2026, unk_model_change_2026)).

% @attr comparable_board_same_brand_flying_v
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values custom_flying_v=Burton_Custom_Flying_V_hybrid_rocker_camber unk_comparable_board_same_brand_flying_v=Unknown
% @importance 0.78

0.93::acc(s_merchant, comparable_board_same_brand_flying_v).
0.68::acc(s79, comparable_board_same_brand_flying_v).

0.92::true_val(comparable_board_same_brand_flying_v, custom_flying_v); 0.08::true_val(comparable_board_same_brand_flying_v, unk_comparable_board_same_brand_flying_v).

measured(s_merchant, comparable_board_same_brand_flying_v, custom_flying_v).
measured(s79, comparable_board_same_brand_flying_v, custom_flying_v).

all_consistent(comparable_board_same_brand_flying_v) :-
    (indep(s_merchant), consistent(s_merchant, comparable_board_same_brand_flying_v) ; \+indep(s_merchant)),
    (indep(s79), consistent(s79, comparable_board_same_brand_flying_v) ; \+indep(s79)).

evidence(all_consistent(comparable_board_same_brand_flying_v)).
query(true_val(comparable_board_same_brand_flying_v, custom_flying_v)).
query(true_val(comparable_board_same_brand_flying_v, unk_comparable_board_same_brand_flying_v)).

% @attr comparable_board_same_brand_jungle
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values custom_jungle=Burton_Custom_Jungle_same_specs unk_comparable_board_same_brand_jungle=Unknown
% @importance 0.45

0.85::acc(s4, comparable_board_same_brand_jungle).
0.85::acc(s18, comparable_board_same_brand_jungle).

0.95::true_val(comparable_board_same_brand_jungle, custom_jungle); 0.05::true_val(comparable_board_same_brand_jungle, unk_comparable_board_same_brand_jungle).

measured(s4, comparable_board_same_brand_jungle, custom_jungle).
measured(s18, comparable_board_same_brand_jungle, custom_jungle).

all_consistent(comparable_board_same_brand_jungle) :-
    consistent(s4, comparable_board_same_brand_jungle),
    consistent(s18, comparable_board_same_brand_jungle).

evidence(all_consistent(comparable_board_same_brand_jungle)).
query(true_val(comparable_board_same_brand_jungle, custom_jungle)).
query(true_val(comparable_board_same_brand_jungle, unk_comparable_board_same_brand_jungle)).

% @attr comparable_board_same_brand_blank
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values custom_blank=Burton_Custom_Blank_bw_graphic unk_comparable_board_same_brand_blank=Unknown
% @importance 0.40

0.85::acc(s18, comparable_board_same_brand_blank).

0.90::true_val(comparable_board_same_brand_blank, custom_blank); 0.10::true_val(comparable_board_same_brand_blank, unk_comparable_board_same_brand_blank).

measured(s18, comparable_board_same_brand_blank, custom_blank).

all_consistent(comparable_board_same_brand_blank) :-
    consistent(s18, comparable_board_same_brand_blank).

evidence(all_consistent(comparable_board_same_brand_blank)).
query(true_val(comparable_board_same_brand_blank, custom_blank)).
query(true_val(comparable_board_same_brand_blank, unk_comparable_board_same_brand_blank)).

% @attr comparable_board_same_brand_30th
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values anniversary_30th_custom=Burton_30th_Anniversary_Custom_limited_edition unk_comparable_board_same_brand_30th=Unknown
% @importance 0.40

0.85::acc(s18, comparable_board_same_brand_30th).

0.90::true_val(comparable_board_same_brand_30th, anniversary_30th_custom); 0.10::true_val(comparable_board_same_brand_30th, unk_comparable_board_same_brand_30th).

measured(s18, comparable_board_same_brand_30th, anniversary_30th_custom).

all_consistent(comparable_board_same_brand_30th) :-
    consistent(s18, comparable_board_same_brand_30th).

evidence(all_consistent(comparable_board_same_brand_30th)).
query(true_val(comparable_board_same_brand_30th, anniversary_30th_custom)).
query(true_val(comparable_board_same_brand_30th, unk_comparable_board_same_brand_30th)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain=All_Mountain unk_board_category=Unknown
% @importance 0.88

0.93::acc(s_merchant, board_category).
0.67::acc(s36, board_category).

0.97::true_val(board_category, all_mountain); 0.03::true_val(board_category, unk_board_category).

measured(s_merchant, board_category, all_mountain).
measured(s36, board_category, all_mountain).

all_consistent(board_category) :-
    (indep(s_merchant), consistent(s_merchant, board_category) ; \+indep(s_merchant)),
    (indep(s36), consistent(s36, board_category) ; \+indep(s36)).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain)).
query(true_val(board_category, unk_board_category)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values directional_twin=Directional_Twin unk_shape=Unknown
% @importance 0.85

0.93::acc(s_merchant, shape).
0.85::acc(s23, shape).
0.82::acc(s37, shape).

0.97::true_val(shape, directional_twin); 0.03::true_val(shape, unk_shape).

measured(s_merchant, shape, directional_twin).
measured(s23, shape, directional_twin).
measured(s37, shape, directional_twin).

all_consistent(shape) :-
    (indep(s_merchant), consistent(s_merchant, shape) ; \+indep(s_merchant)),
    (indep(s2), consistent(s2, shape) ; \+indep(s2)),
    (indep(s37), consistent(s37, shape) ; \+indep(s37)).

evidence(all_consistent(shape)).
query(true_val(shape, directional_twin)).
query(true_val(shape, unk_shape)).

% @attr shape_description
% @type categorical
% @canonical false
% @original_name shape description
% @values longer_nose_twin_flex=Slightly_longer_nose_twin_flex_for_float_and_switch unk_shape_description=Unknown
% @importance 0.85

0.72::acc(s32, shape_description).
0.82::acc(s37, shape_description).

0.92::true_val(shape_description, longer_nose_twin_flex); 0.08::true_val(shape_description, unk_shape_description).

measured(s32, shape_description, longer_nose_twin_flex).
measured(s37, shape_description, longer_nose_twin_flex).

all_consistent(shape_description) :-
    (indep(s32), consistent(s32, shape_description) ; \+indep(s32)),
    (indep(s37), consistent(s37, shape_description) ; \+indep(s37)).

evidence(all_consistent(shape_description)).
query(true_val(shape_description, longer_nose_twin_flex)).
query(true_val(shape_description, unk_shape_description)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values traditional_camber=Traditional_Camber unk_camber_type=Unknown
% @importance 0.85

0.93::acc(s_merchant, camber_type).
0.85::acc(s23, camber_type).

0.97::true_val(camber_type, traditional_camber); 0.03::true_val(camber_type, unk_camber_type).

measured(s_merchant, camber_type, traditional_camber).
measured(s23, camber_type, traditional_camber).

all_consistent(camber_type) :-
    (indep(s_merchant), consistent(s_merchant, camber_type) ; \+indep(s_merchant)),
    (indep(s2), consistent(s2, camber_type) ; \+indep(s2)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, traditional_camber)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical false
% @original_name camber_description
% @values even_weight_full_edge=Weight_distributed_evenly_smooth_continuous_edge_control unk_camber_description=Unknown
% @importance 0.85

0.72::acc(s32, camber_description).
0.82::acc(s37, camber_description).

0.92::true_val(camber_description, even_weight_full_edge); 0.08::true_val(camber_description, unk_camber_description).

measured(s32, camber_description, even_weight_full_edge).
measured(s37, camber_description, even_weight_full_edge).

all_consistent(camber_description) :-
    (indep(s32), consistent(s32, camber_description) ; \+indep(s32)),
    (indep(s37), consistent(s37, camber_description) ; \+indep(s37)).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, even_weight_full_edge)).
query(true_val(camber_description, unk_camber_description)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @original_name flex_rating_10
% @unit /10
% @values v5=5.0 v5_5=5.5 v6=6.0
% @importance 0.86

0.88::acc(s_merchant, flex_rating_10).
0.78::acc(s2, flex_rating_10).
0.85::acc(s39, flex_rating_10).
0.82::acc(s42, flex_rating_10).

0.30::true_val(flex_rating_10, v5); 0.30::true_val(flex_rating_10, v5_5); 0.40::true_val(flex_rating_10, v6).

measured(s_merchant, flex_rating_10, v5_5).
measured(s2, flex_rating_10, v5_5).
measured(s39, flex_rating_10, v6).
measured(s42, flex_rating_10, v5).

all_consistent(flex_rating_10) :-
    (indep(s_merchant), consistent(s_merchant, flex_rating_10) ; \+indep(s_merchant)),
    (indep(s2), consistent(s2, flex_rating_10) ; \+indep(s2)),
    (indep(s39), consistent(s39, flex_rating_10) ; \+indep(s39)),
    consistent(s42, flex_rating_10).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v5)).
query(true_val(flex_rating_10, v5_5)).
query(true_val(flex_rating_10, v6)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values twin_flex=Twin_flex_symmetrical_tip_to_tail unk_flex_feel=Unknown
% @importance 0.80

0.85::acc(s23, flex_feel).
0.72::acc(s32, flex_feel).

0.95::true_val(flex_feel, twin_flex); 0.05::true_val(flex_feel, unk_flex_feel).

measured(s23, flex_feel, twin_flex).
measured(s32, flex_feel, twin_flex).

all_consistent(flex_feel) :-
    (indep(s2), consistent(s2, flex_feel) ; \+indep(s2)),
    (indep(s32), consistent(s32, flex_feel) ; \+indep(s32)).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, twin_flex)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr flex_direction
% @type categorical
% @canonical false
% @original_name flex_direction
% @values twin_symmetrical=Twin_symmetrical unk_flex_direction=Unknown
% @importance 0.85

0.93::acc(s_merchant, flex_direction).

0.95::true_val(flex_direction, twin_symmetrical); 0.05::true_val(flex_direction, unk_flex_direction).

measured(s_merchant, flex_direction, twin_symmetrical).

all_consistent(flex_direction) :-
    consistent(s_merchant, flex_direction).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, twin_symmetrical)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 0.85

0.93::acc(s_merchant, width_options).

0.95::true_val(width_options, standard_and_wide); 0.05::true_val(width_options, unk_width_options).

measured(s_merchant, width_options, standard_and_wide).

all_consistent(width_options) :-
    consistent(s_merchant, width_options).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

% @attr available_sizes
% @type categorical
% @canonical false
% @original_name available_sizes
% @values nine_sizes=150_154_156_158_162_158W_162W_166W_170W unk_available_sizes=Unknown
% @importance 0.85

0.93::acc(s_merchant, available_sizes).

0.95::true_val(available_sizes, nine_sizes); 0.05::true_val(available_sizes, unk_available_sizes).

measured(s_merchant, available_sizes, nine_sizes).

all_consistent(available_sizes) :-
    consistent(s_merchant, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, nine_sizes)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr setback
% @type numeric
% @canonical true
% @original_name setback
% @unit mm
% @values vm12_5=-12.5 unk_setback=Unknown
% @importance 0.88

0.93::acc(s_merchant, setback).
0.80::acc(s42, setback).

0.95::true_val(setback, vm12_5); 0.05::true_val(setback, unk_setback).

measured(s_merchant, setback, vm12_5).
measured(s42, setback, vm12_5).

all_consistent(setback) :-
    (indep(s_merchant), consistent(s_merchant, setback) ; \+indep(s_merchant)),
    consistent(s42, setback).

evidence(all_consistent(setback)).
query(true_val(setback, vm12_5)).
query(true_val(setback, unk_setback)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values super_fly_ii_700g=FSC_Certified_Super_Fly_II_700G_Core unk_core_material=Unknown
% @importance 0.85

0.58::acc(s14, core_material).
0.67::acc(s36, core_material).

0.95::true_val(core_material, super_fly_ii_700g); 0.05::true_val(core_material, unk_core_material).

measured(s14, core_material, super_fly_ii_700g).
measured(s36, core_material, super_fly_ii_700g).

all_consistent(core_material) :-
    (indep(s14), consistent(s14, core_material) ; \+indep(s14)),
    (indep(s36), consistent(s36, core_material) ; \+indep(s36)).

evidence(all_consistent(core_material)).
query(true_val(core_material, super_fly_ii_700g)).
query(true_val(core_material, unk_core_material)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values dualzone_egd=Dualzone_EGD_wood_grain_aligned_toe_heel unk_construction_material_innovation=Unknown
% @importance 0.82

0.93::acc(s_merchant, construction_material_innovation).
0.85::acc(s23, construction_material_innovation).
0.72::acc(s32, construction_material_innovation).

0.97::true_val(construction_material_innovation, dualzone_egd); 0.03::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s_merchant, construction_material_innovation, dualzone_egd).
measured(s23, construction_material_innovation, dualzone_egd).
measured(s32, construction_material_innovation, dualzone_egd).

all_consistent(construction_material_innovation) :-
    (indep(s_merchant), consistent(s_merchant, construction_material_innovation) ; \+indep(s_merchant)),
    (indep(s2), consistent(s2, construction_material_innovation) ; \+indep(s2)),
    (indep(s32), consistent(s32, construction_material_innovation) ; \+indep(s32)).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, dualzone_egd)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr construction_material_innovation_squeezebox
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values squeezebox=Squeezebox_thicker_thinner_core_sections unk_construction_material_innovation_squeezebox=Unknown
% @importance 0.82

0.93::acc(s_merchant, construction_material_innovation_squeezebox).
0.72::acc(s32, construction_material_innovation_squeezebox).

0.95::true_val(construction_material_innovation_squeezebox, squeezebox); 0.05::true_val(construction_material_innovation_squeezebox, unk_construction_material_innovation_squeezebox).

measured(s_merchant, construction_material_innovation_squeezebox, squeezebox).
measured(s32, construction_material_innovation_squeezebox, squeezebox).

all_consistent(construction_material_innovation_squeezebox) :-
    (indep(s_merchant), consistent(s_merchant, construction_material_innovation_squeezebox) ; \+indep(s_merchant)),
    (indep(s32), consistent(s32, construction_material_innovation_squeezebox) ; \+indep(s32)).

evidence(all_consistent(construction_material_innovation_squeezebox)).
query(true_val(construction_material_innovation_squeezebox, squeezebox)).
query(true_val(construction_material_innovation_squeezebox, unk_construction_material_innovation_squeezebox)).

% @attr core_material_blend_ratio
% @type categorical
% @canonical false
% @original_name core_material_blend_ratio
% @values dual_species=Dual_species_alternating_softwood_hardwood unk_core_material_blend_ratio=Unknown
% @importance 0.78

0.65::acc(s85, core_material_blend_ratio).
0.72::acc(s32, core_material_blend_ratio).

0.90::true_val(core_material_blend_ratio, dual_species); 0.10::true_val(core_material_blend_ratio, unk_core_material_blend_ratio).

measured(s85, core_material_blend_ratio, dual_species).
measured(s32, core_material_blend_ratio, dual_species).

all_consistent(core_material_blend_ratio) :-
    (indep(s85), consistent(s85, core_material_blend_ratio) ; \+indep(s85)),
    (indep(s32), consistent(s32, core_material_blend_ratio) ; \+indep(s32)).

evidence(all_consistent(core_material_blend_ratio)).
query(true_val(core_material_blend_ratio, dual_species)).
query(true_val(core_material_blend_ratio, unk_core_material_blend_ratio)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values carbon_45_deg=45_degree_Carbon_Highlights unk_laminate=Unknown
% @importance 0.83

0.93::acc(s_merchant, laminate).
0.67::acc(s36, laminate).

0.97::true_val(laminate, carbon_45_deg); 0.03::true_val(laminate, unk_laminate).

measured(s_merchant, laminate, carbon_45_deg).
measured(s36, laminate, carbon_45_deg).

all_consistent(laminate) :-
    (indep(s_merchant), consistent(s_merchant, laminate) ; \+indep(s_merchant)),
    (indep(s36), consistent(s36, laminate) ; \+indep(s36)).

evidence(all_consistent(laminate)).
query(true_val(laminate, carbon_45_deg)).
query(true_val(laminate, unk_laminate)).

% @attr construction_material_innovation_carbon
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values full_tip_tail_carbon_45=Full_tip_to_tail_carbon_45_degree unk_construction_material_innovation_carbon=Unknown
% @importance 0.78

0.68::acc(s79, construction_material_innovation_carbon).
0.72::acc(s93, construction_material_innovation_carbon).

0.90::true_val(construction_material_innovation_carbon, full_tip_tail_carbon_45); 0.10::true_val(construction_material_innovation_carbon, unk_construction_material_innovation_carbon).

measured(s79, construction_material_innovation_carbon, full_tip_tail_carbon_45).
measured(s93, construction_material_innovation_carbon, full_tip_tail_carbon_45).

all_consistent(construction_material_innovation_carbon) :-
    (indep(s79), consistent(s79, construction_material_innovation_carbon) ; \+indep(s79)),
    (indep(s93), consistent(s93, construction_material_innovation_carbon) ; \+indep(s93)).

evidence(all_consistent(construction_material_innovation_carbon)).
query(true_val(construction_material_innovation_carbon, full_tip_tail_carbon_45)).
query(true_val(construction_material_innovation_carbon, unk_construction_material_innovation_carbon)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_wfo=Sintered_WFO unk_base_material=Unknown
% @importance 0.83

0.93::acc(s_merchant, base_material).
0.62::acc(s27, base_material).
0.67::acc(s36, base_material).

0.97::true_val(base_material, sintered_wfo); 0.03::true_val(base_material, unk_base_material).

measured(s_merchant, base_material, sintered_wfo).
measured(s27, base_material, sintered_wfo).
measured(s36, base_material, sintered_wfo).

all_consistent(base_material) :-
    (indep(s_merchant), consistent(s_merchant, base_material) ; \+indep(s_merchant)),
    (indep(s6), consistent(s6, base_material) ; \+indep(s6)),
    (indep(s36), consistent(s36, base_material) ; \+indep(s36)).

evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_wfo)).
query(true_val(base_material, unk_base_material)).

% @attr base_type
% @type categorical
% @canonical false
% @original_name base_type
% @values high_density_sintered_wax=Extra_absorbent_high_density_sintered_wax_infused unk_base_type=Unknown
% @importance 0.75

0.72::acc(s93, base_type).

0.90::true_val(base_type, high_density_sintered_wax); 0.10::true_val(base_type, unk_base_type).

measured(s93, base_type, high_density_sintered_wax).

all_consistent(base_type) :-
    (indep(s93), consistent(s93, base_type) ; \+indep(s93)).

evidence(all_consistent(base_type)).
query(true_val(base_type, high_density_sintered_wax)).
query(true_val(base_type, unk_base_type)).

% @attr resin
% @type categorical
% @canonical true
% @original_name resin
% @values super_sap_epoxy=Super_Sap_Epoxy_bio_based_50pct_less_carbon unk_resin=Unknown
% @importance 0.78

0.93::acc(s_merchant, resin).
0.68::acc(s79, resin).
0.58::acc(s85, resin).

0.97::true_val(resin, super_sap_epoxy); 0.03::true_val(resin, unk_resin).

measured(s_merchant, resin, super_sap_epoxy).
measured(s79, resin, super_sap_epoxy).
measured(s85, resin, super_sap_epoxy).

all_consistent(resin) :-
    (indep(s_merchant), consistent(s_merchant, resin) ; \+indep(s_merchant)),
    (indep(s79), consistent(s79, resin) ; \+indep(s79)),
    (indep(s85), consistent(s85, resin) ; \+indep(s85)).

evidence(all_consistent(resin)).
query(true_val(resin, super_sap_epoxy)).
query(true_val(resin, unk_resin)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values frostbite_edges=Frostbite_Edges_extend_under_bindings unk_edge_technology=Unknown
% @importance 0.80

0.93::acc(s_merchant, edge_technology).
0.58::acc(s14, edge_technology).
0.58::acc(s85, edge_technology).

0.97::true_val(edge_technology, frostbite_edges); 0.03::true_val(edge_technology, unk_edge_technology).

measured(s_merchant, edge_technology, frostbite_edges).
measured(s14, edge_technology, frostbite_edges).
measured(s85, edge_technology, frostbite_edges).

all_consistent(edge_technology) :-
    (indep(s_merchant), consistent(s_merchant, edge_technology) ; \+indep(s_merchant)),
    (indep(s14), consistent(s14, edge_technology) ; \+indep(s14)),
    (indep(s85), consistent(s85, edge_technology) ; \+indep(s85)).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, frostbite_edges)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr construction_material_innovation_protip
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values pro_tip=Pro_Tip_tapered_tip_tail_reduced_swing_weight unk_construction_material_innovation_protip=Unknown
% @importance 0.73

0.93::acc(s_merchant, construction_material_innovation_protip).
0.85::acc(s23, construction_material_innovation_protip).
0.51::acc(s87, construction_material_innovation_protip).

0.97::true_val(construction_material_innovation_protip, pro_tip); 0.03::true_val(construction_material_innovation_protip, unk_construction_material_innovation_protip).

measured(s_merchant, construction_material_innovation_protip, pro_tip).
measured(s23, construction_material_innovation_protip, pro_tip).
measured(s87, construction_material_innovation_protip, pro_tip).

all_consistent(construction_material_innovation_protip) :-
    (indep(s_merchant), consistent(s_merchant, construction_material_innovation_protip) ; \+indep(s_merchant)),
    (indep(s2), consistent(s2, construction_material_innovation_protip) ; \+indep(s2)),
    (indep(s87), consistent(s87, construction_material_innovation_protip) ; \+indep(s87)).

evidence(all_consistent(construction_material_innovation_protip)).
query(true_val(construction_material_innovation_protip, pro_tip)).
query(true_val(construction_material_innovation_protip, unk_construction_material_innovation_protip)).

% @attr construction_material_innovation_infinite_ride
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values infinite_ride=Infinite_Ride_overbuilt_then_machine_broken_in unk_construction_material_innovation_infinite_ride=Unknown
% @importance 0.80

0.93::acc(s_merchant, construction_material_innovation_infinite_ride).
0.68::acc(s79, construction_material_innovation_infinite_ride).
0.72::acc(s93, construction_material_innovation_infinite_ride).

0.97::true_val(construction_material_innovation_infinite_ride, infinite_ride); 0.03::true_val(construction_material_innovation_infinite_ride, unk_construction_material_innovation_infinite_ride).

measured(s_merchant, construction_material_innovation_infinite_ride, infinite_ride).
measured(s79, construction_material_innovation_infinite_ride, infinite_ride).
measured(s93, construction_material_innovation_infinite_ride, infinite_ride).

all_consistent(construction_material_innovation_infinite_ride) :-
    (indep(s_merchant), consistent(s_merchant, construction_material_innovation_infinite_ride) ; \+indep(s_merchant)),
    (indep(s79), consistent(s79, construction_material_innovation_infinite_ride) ; \+indep(s79)),
    (indep(s93), consistent(s93, construction_material_innovation_infinite_ride) ; \+indep(s93)).

evidence(all_consistent(construction_material_innovation_infinite_ride)).
query(true_val(construction_material_innovation_infinite_ride, infinite_ride)).
query(true_val(construction_material_innovation_infinite_ride, unk_construction_material_innovation_infinite_ride)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values the_channel=The_Channel_all_brands_best_with_EST unk_mounting_pattern=Unknown
% @importance 0.80

0.93::acc(s_merchant, mounting_pattern).
0.72::acc(s32, mounting_pattern).

0.97::true_val(mounting_pattern, the_channel); 0.03::true_val(mounting_pattern, unk_mounting_pattern).

measured(s_merchant, mounting_pattern, the_channel).
measured(s32, mounting_pattern, the_channel).

all_consistent(mounting_pattern) :-
    (indep(s_merchant), consistent(s_merchant, mounting_pattern) ; \+indep(s_merchant)),
    (indep(s32), consistent(s32, mounting_pattern) ; \+indep(s32)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, the_channel)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values est_channel_only_all_brands_channel=EST_only_Channel_but_Channel_accepts_all_brands unk_binding_compatibility=Unknown
% @importance 0.80

0.62::acc(s26, binding_compatibility).
0.58::acc(s40, binding_compatibility).

0.92::true_val(binding_compatibility, est_channel_only_all_brands_channel); 0.08::true_val(binding_compatibility, unk_binding_compatibility).

measured(s26, binding_compatibility, est_channel_only_all_brands_channel).
measured(s40, binding_compatibility, est_channel_only_all_brands_channel).

all_consistent(binding_compatibility) :-
    (indep(s26), consistent(s26, binding_compatibility) ; \+indep(s26)),
    consistent(s40, binding_compatibility).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, est_channel_only_all_brands_channel)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

% @attr binding_compatibility_2x4
% @type categorical
% @canonical false
% @original_name binding_compatibility
% @values channel_accepts_2x4=Channel_accepts_2x4_pattern_all_brands unk_binding_compatibility_2x4=Unknown
% @importance 0.85

0.62::acc(s26, binding_compatibility_2x4).

0.85::true_val(binding_compatibility_2x4, channel_accepts_2x4); 0.15::true_val(binding_compatibility_2x4, unk_binding_compatibility_2x4).

measured(s26, binding_compatibility_2x4, channel_accepts_2x4).

all_consistent(binding_compatibility_2x4) :-
    (indep(s26), consistent(s26, binding_compatibility_2x4) ; \+indep(s26)).

evidence(all_consistent(binding_compatibility_2x4)).
query(true_val(binding_compatibility_2x4, channel_accepts_2x4)).
query(true_val(binding_compatibility_2x4, unk_binding_compatibility_2x4)).

% @attr sustainability_certification_fsc
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values fsc_c124994_100pct=FSC_C124994_FSC_100pct_NC_COC_007445 unk_sustainability_certification_fsc=Unknown
% @importance 0.60

0.62::acc(s83, sustainability_certification_fsc).
0.67::acc(s84, sustainability_certification_fsc).

0.92::true_val(sustainability_certification_fsc, fsc_c124994_100pct); 0.08::true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc).

measured(s83, sustainability_certification_fsc, fsc_c124994_100pct).
measured(s84, sustainability_certification_fsc, fsc_c124994_100pct).

all_consistent(sustainability_certification_fsc) :-
    (indep(s83), consistent(s83, sustainability_certification_fsc) ; \+indep(s83)),
    (indep(s36), consistent(s36, sustainability_certification_fsc) ; \+indep(s36)).

evidence(all_consistent(sustainability_certification_fsc)).
query(true_val(sustainability_certification_fsc, fsc_c124994_100pct)).
query(true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values three_year=3_year_warranty_2014_and_newer_Channel unk_warranty=Unknown
% @importance 0.70

0.63::acc(s3, warranty).
0.67::acc(s84, warranty).

0.92::true_val(warranty, three_year); 0.08::true_val(warranty, unk_warranty).

measured(s3, warranty, three_year).
measured(s84, warranty, three_year).

all_consistent(warranty) :-
    (indep(s3), consistent(s3, warranty) ; \+indep(s3)),
    (indep(s36), consistent(s36, warranty) ; \+indep(s36)).

evidence(all_consistent(warranty)).
query(true_val(warranty, three_year)).
query(true_val(warranty, unk_warranty)).

% @attr effective_edge_150
% @type numeric
% @unit mm
% @canonical false
% @original_name effective edge 150cm
% @values v1135=1135.0 unk_effective_edge_150=Unknown
% @importance 0.85

0.93::acc(s_merchant, effective_edge_150).

0.95::true_val(effective_edge_150, v1135); 0.05::true_val(effective_edge_150, unk_effective_edge_150).

measured(s_merchant, effective_edge_150, v1135).

all_consistent(effective_edge_150) :-
    consistent(s_merchant, effective_edge_150).

evidence(all_consistent(effective_edge_150)).
query(true_val(effective_edge_150, v1135)).
query(true_val(effective_edge_150, unk_effective_edge_150)).

% @attr sidecut_radius_size_150
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v7_4=7.4 unk_sidecut_radius_size_150=Unknown
% @importance 0.85

0.93::acc(s_merchant, sidecut_radius_size_150).

0.95::true_val(sidecut_radius_size_150, v7_4); 0.05::true_val(sidecut_radius_size_150, unk_sidecut_radius_size_150).

measured(s_merchant, sidecut_radius_size_150, v7_4).

all_consistent(sidecut_radius_size_150) :-
    consistent(s_merchant, sidecut_radius_size_150).

evidence(all_consistent(sidecut_radius_size_150)).
query(true_val(sidecut_radius_size_150, v7_4)).
query(true_val(sidecut_radius_size_150, unk_sidecut_radius_size_150)).

% @attr waist_width_150
% @type numeric
% @unit mm
% @canonical false
% @original_name waist width 150cm
% @values v248=248.0 unk_waist_width_150=Unknown
% @importance 0.85

0.93::acc(s_merchant, waist_width_150).

0.95::true_val(waist_width_150, v248); 0.05::true_val(waist_width_150, unk_waist_width_150).

measured(s_merchant, waist_width_150, v248).

all_consistent(waist_width_150) :-
    consistent(s_merchant, waist_width_150).

evidence(all_consistent(waist_width_150)).
query(true_val(waist_width_150, v248)).
query(true_val(waist_width_150, unk_waist_width_150)).

% @attr tip_tail_width_size
% @type numeric
% @unit mm
% @canonical true
% @original_name tip_tail_width_size
% @values v288=288.0 unk_tip_tail_width_size=Unknown
% @importance 0.85

0.93::acc(s_merchant, tip_tail_width_size).

0.95::true_val(tip_tail_width_size, v288); 0.05::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s_merchant, tip_tail_width_size, v288).

all_consistent(tip_tail_width_size) :-
    consistent(s_merchant, tip_tail_width_size).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v288)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr stance_width_range_size
% @type numeric
% @unit mm
% @canonical true
% @original_name stance_width_range_size
% @values v505=505.0 unk_stance_width_range_size=Unknown
% @importance 0.85

0.93::acc(s_merchant, stance_width_range_size).

0.95::true_val(stance_width_range_size, v505); 0.05::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s_merchant, stance_width_range_size, v505).

all_consistent(stance_width_range_size) :-
    consistent(s_merchant, stance_width_range_size).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v505)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr recommended_weight_range_size_150
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values r54_82=54_82kg unk_recommended_weight_range_size_150=Unknown
% @importance 0.85

0.93::acc(s_merchant, recommended_weight_range_size_150).

0.95::true_val(recommended_weight_range_size_150, r54_82); 0.05::true_val(recommended_weight_range_size_150, unk_recommended_weight_range_size_150).

measured(s_merchant, recommended_weight_range_size_150, r54_82).

all_consistent(recommended_weight_range_size_150) :-
    consistent(s_merchant, recommended_weight_range_size_150).

evidence(all_consistent(recommended_weight_range_size_150)).
query(true_val(recommended_weight_range_size_150, r54_82)).
query(true_val(recommended_weight_range_size_150, unk_recommended_weight_range_size_150)).

% @attr effective_edge_154
% @type numeric
% @unit mm
% @canonical false
% @original_name effective edge 154cm
% @values v1175=1175.0 unk_effective_edge_154=Unknown
% @importance 0.85

0.93::acc(s_merchant, effective_edge_154).

0.95::true_val(effective_edge_154, v1175); 0.05::true_val(effective_edge_154, unk_effective_edge_154).

measured(s_merchant, effective_edge_154, v1175).

all_consistent(effective_edge_154) :-
    consistent(s_merchant, effective_edge_154).

evidence(all_consistent(effective_edge_154)).
query(true_val(effective_edge_154, v1175)).
query(true_val(effective_edge_154, unk_effective_edge_154)).

% @attr sidecut_radius_size_154
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v7_6=7.6 unk_sidecut_radius_size_154=Unknown
% @importance 0.85

0.93::acc(s_merchant, sidecut_radius_size_154).

0.95::true_val(sidecut_radius_size_154, v7_6); 0.05::true_val(sidecut_radius_size_154, unk_sidecut_radius_size_154).

measured(s_merchant, sidecut_radius_size_154, v7_6).

all_consistent(sidecut_radius_size_154) :-
    consistent(s_merchant, sidecut_radius_size_154).

evidence(all_consistent(sidecut_radius_size_154)).
query(true_val(sidecut_radius_size_154, v7_6)).
query(true_val(sidecut_radius_size_154, unk_sidecut_radius_size_154)).

% @attr waist_width_154
% @type numeric
% @unit mm
% @canonical false
% @original_name waist width 154cm
% @values v250=250.0 unk_waist_width_154=Unknown
% @importance 0.85

0.93::acc(s_merchant, waist_width_154).

0.95::true_val(waist_width_154, v250); 0.05::true_val(waist_width_154, unk_waist_width_154).

measured(s_merchant, waist_width_154, v250).

all_consistent(waist_width_154) :-
    consistent(s_merchant, waist_width_154).

evidence(all_consistent(waist_width_154)).
query(true_val(waist_width_154, v250)).
query(true_val(waist_width_154, unk_waist_width_154)).

% @attr recommended_weight_range_size_154
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values r54_82=54_82kg unk_recommended_weight_range_size_154=Unknown
% @importance 0.85

0.93::acc(s_merchant, recommended_weight_range_size_154).

0.95::true_val(recommended_weight_range_size_154, r54_82_154); 0.05::true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154).

measured(s_merchant, recommended_weight_range_size_154, r54_82_154).

all_consistent(recommended_weight_range_size_154) :-
    consistent(s_merchant, recommended_weight_range_size_154).

evidence(all_consistent(recommended_weight_range_size_154)).
query(true_val(recommended_weight_range_size_154, r54_82_154)).
query(true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154)).

% @attr effective_edge_156
% @type numeric
% @unit mm
% @canonical false
% @original_name effective edge 156cm
% @values v1195=1195.0 unk_effective_edge_156=Unknown
% @importance 0.85

0.93::acc(s_merchant, effective_edge_156).

0.95::true_val(effective_edge_156, v1195); 0.05::true_val(effective_edge_156, unk_effective_edge_156).

measured(s_merchant, effective_edge_156, v1195).

all_consistent(effective_edge_156) :-
    consistent(s_merchant, effective_edge_156).

evidence(all_consistent(effective_edge_156)).
query(true_val(effective_edge_156, v1195)).
query(true_val(effective_edge_156, unk_effective_edge_156)).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size
% @values v7_8=7.8 unk_sidecut_radius_size=Unknown
% @importance 0.85

0.93::acc(s_merchant, sidecut_radius_size).

0.95::true_val(sidecut_radius_size, v7_8); 0.05::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s_merchant, sidecut_radius_size, v7_8).

all_consistent(sidecut_radius_size) :-
    consistent(s_merchant, sidecut_radius_size).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_8)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr waist_width_156
% @type numeric
% @unit mm
% @canonical false
% @original_name waist width 156cm
% @values v252=252.0 unk_waist_width_156=Unknown
% @importance 0.85

0.93::acc(s_merchant, waist_width_156).

0.95::true_val(waist_width_156, v252); 0.05::true_val(waist_width_156, unk_waist_width_156).

measured(s_merchant, waist_width_156, v252).

all_consistent(waist_width_156) :-
    consistent(s_merchant, waist_width_156).

evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v252)).
query(true_val(waist_width_156, unk_waist_width_156)).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size
% @values r68_91=68_91kg unk_recommended_weight_range_size=Unknown
% @importance 0.85

0.93::acc(s_merchant, recommended_weight_range_size).

0.95::true_val(recommended_weight_range_size, r68_91); 0.05::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s_merchant, recommended_weight_range_size, r68_91).

all_consistent(recommended_weight_range_size) :-
    consistent(s_merchant, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, r68_91)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr effective_edge_158
% @type numeric
% @unit mm
% @canonical false
% @original_name effective edge 158cm
% @values v1215=1215.0 unk_effective_edge_158=Unknown
% @importance 0.85

0.93::acc(s_merchant, effective_edge_158).

0.95::true_val(effective_edge_158, v1215); 0.05::true_val(effective_edge_158, unk_effective_edge_158).

measured(s_merchant, effective_edge_158, v1215).

all_consistent(effective_edge_158) :-
    consistent(s_merchant, effective_edge_158).

evidence(all_consistent(effective_edge_158)).
query(true_val(effective_edge_158, v1215)).
query(true_val(effective_edge_158, unk_effective_edge_158)).

% @attr sidecut_radius_size_158
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v7_9=7.9 unk_sidecut_radius_size_158=Unknown
% @importance 0.85

0.93::acc(s_merchant, sidecut_radius_size_158).

0.95::true_val(sidecut_radius_size_158, v7_9); 0.05::true_val(sidecut_radius_size_158, unk_sidecut_radius_size_158).

measured(s_merchant, sidecut_radius_size_158, v7_9).

all_consistent(sidecut_radius_size_158) :-
    consistent(s_merchant, sidecut_radius_size_158).

evidence(all_consistent(sidecut_radius_size_158)).
query(true_val(sidecut_radius_size_158, v7_9)).
query(true_val(sidecut_radius_size_158, unk_sidecut_radius_size_158)).

% @attr waist_width_158
% @type numeric
% @unit mm
% @canonical false
% @original_name waist width 158cm
% @values v254=254.0 unk_waist_width_158=Unknown
% @importance 0.85

0.93::acc(s_merchant, waist_width_158).

0.95::true_val(waist_width_158, v254); 0.05::true_val(waist_width_158, unk_waist_width_158).

measured(s_merchant, waist_width_158, v254).

all_consistent(waist_width_158) :-
    consistent(s_merchant, waist_width_158).

evidence(all_consistent(waist_width_158)).
query(true_val(waist_width_158, v254)).
query(true_val(waist_width_158, unk_waist_width_158)).

% @attr recommended_weight_range_size_158
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values r68_91_158=68_91kg unk_recommended_weight_range_size_158=Unknown
% @importance 0.85

0.93::acc(s_merchant, recommended_weight_range_size_158).

0.95::true_val(recommended_weight_range_size_158, r68_91_158); 0.05::true_val(recommended_weight_range_size_158, unk_recommended_weight_range_size_158).

measured(s_merchant, recommended_weight_range_size_158, r68_91_158).

all_consistent(recommended_weight_range_size_158) :-
    consistent(s_merchant, recommended_weight_range_size_158).

evidence(all_consistent(recommended_weight_range_size_158)).
query(true_val(recommended_weight_range_size_158, r68_91_158)).
query(true_val(recommended_weight_range_size_158, unk_recommended_weight_range_size_158)).

% @attr effective_edge_162
% @type numeric
% @unit mm
% @canonical false
% @original_name effective edge 162cm
% @values v1255=1255.0 unk_effective_edge_162=Unknown
% @importance 0.85

0.93::acc(s_merchant, effective_edge_162).

0.95::true_val(effective_edge_162, v1255); 0.05::true_val(effective_edge_162, unk_effective_edge_162).

measured(s_merchant, effective_edge_162, v1255).

all_consistent(effective_edge_162) :-
    consistent(s_merchant, effective_edge_162).

evidence(all_consistent(effective_edge_162)).
query(true_val(effective_edge_162, v1255)).
query(true_val(effective_edge_162, unk_effective_edge_162)).

% @attr sidecut_radius_size_162
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v8_2=8.2 unk_sidecut_radius_size_162=Unknown
% @importance 0.85

0.93::acc(s_merchant, sidecut_radius_size_162).

0.95::true_val(sidecut_radius_size_162, v8_2); 0.05::true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162).

measured(s_merchant, sidecut_radius_size_162, v8_2).

all_consistent(sidecut_radius_size_162) :-
    consistent(s_merchant, sidecut_radius_size_162).

evidence(all_consistent(sidecut_radius_size_162)).
query(true_val(sidecut_radius_size_162, v8_2)).
query(true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162)).

% @attr waist_width_162
% @type numeric
% @unit mm
% @canonical false
% @original_name waist width 162cm
% @values v256=256.0 unk_waist_width_162=Unknown
% @importance 0.85

0.93::acc(s_merchant, waist_width_162).

0.95::true_val(waist_width_162, v256); 0.05::true_val(waist_width_162, unk_waist_width_162).

measured(s_merchant, waist_width_162, v256).

all_consistent(waist_width_162) :-
    consistent(s_merchant, waist_width_162).

evidence(all_consistent(waist_width_162)).
query(true_val(waist_width_162, v256)).
query(true_val(waist_width_162, unk_waist_width_162)).

% @attr recommended_weight_range_size_162
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values r82_118plus=82_118plus_kg unk_recommended_weight_range_size_162=Unknown
% @importance 0.85

0.93::acc(s_merchant, recommended_weight_range_size_162).

0.95::true_val(recommended_weight_range_size_162, r82_118plus); 0.05::true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162).

measured(s_merchant, recommended_weight_range_size_162, r82_118plus).

all_consistent(recommended_weight_range_size_162) :-
    consistent(s_merchant, recommended_weight_range_size_162).

evidence(all_consistent(recommended_weight_range_size_162)).
query(true_val(recommended_weight_range_size_162, r82_118plus)).
query(true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162)).

% @attr effective_edge_158w
% @type numeric
% @unit mm
% @canonical false
% @original_name effective edge 158W
% @values v1215w=1215.0 unk_effective_edge_158w=Unknown
% @importance 0.85

0.93::acc(s_merchant, effective_edge_158w).

0.95::true_val(effective_edge_158w, v1215w); 0.05::true_val(effective_edge_158w, unk_effective_edge_158w).

measured(s_merchant, effective_edge_158w, v1215w).

all_consistent(effective_edge_158w) :-
    consistent(s_merchant, effective_edge_158w).

evidence(all_consistent(effective_edge_158w)).
query(true_val(effective_edge_158w, v1215w)).
query(true_val(effective_edge_158w, unk_effective_edge_158w)).

% @attr waist_width_158w
% @type numeric
% @unit mm
% @canonical false
% @original_name waist width 158W
% @values v262=262.0 unk_waist_width_158w=Unknown
% @importance 0.85

0.93::acc(s_merchant, waist_width_158w).

0.95::true_val(waist_width_158w, v262); 0.05::true_val(waist_width_158w, unk_waist_width_158w).

measured(s_merchant, waist_width_158w, v262).

all_consistent(waist_width_158w) :-
    consistent(s_merchant, waist_width_158w).

evidence(all_consistent(waist_width_158w)).
query(true_val(waist_width_158w, v262)).
query(true_val(waist_width_158w, unk_waist_width_158w)).

% @attr recommended_weight_range_size_158w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values r68_91_158w=68_91kg unk_recommended_weight_range_size_158w=Unknown
% @importance 0.85

0.93::acc(s_merchant, recommended_weight_range_size_158w).

0.95::true_val(recommended_weight_range_size_158w, r68_91_158w); 0.05::true_val(recommended_weight_range_size_158w, unk_recommended_weight_range_size_158w).

measured(s_merchant, recommended_weight_range_size_158w, r68_91_158w).

all_consistent(recommended_weight_range_size_158w) :-
    consistent(s_merchant, recommended_weight_range_size_158w).

evidence(all_consistent(recommended_weight_range_size_158w)).
query(true_val(recommended_weight_range_size_158w, r68_91_158w)).
query(true_val(recommended_weight_range_size_158w, unk_recommended_weight_range_size_158w)).

% @attr effective_edge_162w
% @type numeric
% @unit mm
% @canonical false
% @original_name effective edge 162W
% @values v1255w=1255.0 unk_effective_edge_162w=Unknown
% @importance 0.85

0.93::acc(s_merchant, effective_edge_162w).

0.95::true_val(effective_edge_162w, v1255w); 0.05::true_val(effective_edge_162w, unk_effective_edge_162w).

measured(s_merchant, effective_edge_162w, v1255w).

all_consistent(effective_edge_162w) :-
    consistent(s_merchant, effective_edge_162w).

evidence(all_consistent(effective_edge_162w)).
query(true_val(effective_edge_162w, v1255w)).
query(true_val(effective_edge_162w, unk_effective_edge_162w)).

% @attr waist_width_162w
% @type numeric
% @unit mm
% @canonical false
% @original_name waist width 162W
% @values v264=264.0 unk_waist_width_162w=Unknown
% @importance 0.85

0.93::acc(s_merchant, waist_width_162w).

0.95::true_val(waist_width_162w, v264); 0.05::true_val(waist_width_162w, unk_waist_width_162w).

measured(s_merchant, waist_width_162w, v264).

all_consistent(waist_width_162w) :-
    consistent(s_merchant, waist_width_162w).

evidence(all_consistent(waist_width_162w)).
query(true_val(waist_width_162w, v264)).
query(true_val(waist_width_162w, unk_waist_width_162w)).

% @attr recommended_weight_range_size_162w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values r82_118plus_162w=82_118plus_kg unk_recommended_weight_range_size_162w=Unknown
% @importance 0.85

0.93::acc(s_merchant, recommended_weight_range_size_162w).

0.95::true_val(recommended_weight_range_size_162w, r82_118plus_162w); 0.05::true_val(recommended_weight_range_size_162w, unk_recommended_weight_range_size_162w).

measured(s_merchant, recommended_weight_range_size_162w, r82_118plus_162w).

all_consistent(recommended_weight_range_size_162w) :-
    consistent(s_merchant, recommended_weight_range_size_162w).

evidence(all_consistent(recommended_weight_range_size_162w)).
query(true_val(recommended_weight_range_size_162w, r82_118plus_162w)).
query(true_val(recommended_weight_range_size_162w, unk_recommended_weight_range_size_162w)).

% @attr effective_edge_166w
% @type numeric
% @unit mm
% @canonical false
% @original_name effective edge 166W
% @values v1295=1295.0 unk_effective_edge_166w=Unknown
% @importance 0.85

0.93::acc(s_merchant, effective_edge_166w).

0.95::true_val(effective_edge_166w, v1295); 0.05::true_val(effective_edge_166w, unk_effective_edge_166w).

measured(s_merchant, effective_edge_166w, v1295).

all_consistent(effective_edge_166w) :-
    consistent(s_merchant, effective_edge_166w).

evidence(all_consistent(effective_edge_166w)).
query(true_val(effective_edge_166w, v1295)).
query(true_val(effective_edge_166w, unk_effective_edge_166w)).

% @attr waist_width_166w
% @type numeric
% @unit mm
% @canonical false
% @original_name waist width 166W
% @values v266=266.0 unk_waist_width_166w=Unknown
% @importance 0.85

0.93::acc(s_merchant, waist_width_166w).

0.95::true_val(waist_width_166w, v266); 0.05::true_val(waist_width_166w, unk_waist_width_166w).

measured(s_merchant, waist_width_166w, v266).

all_consistent(waist_width_166w) :-
    consistent(s_merchant, waist_width_166w).

evidence(all_consistent(waist_width_166w)).
query(true_val(waist_width_166w, v266)).
query(true_val(waist_width_166w, unk_waist_width_166w)).

% @attr recommended_weight_range_size_166w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values r82_118plus_166w=82_118plus_kg unk_recommended_weight_range_size_166w=Unknown
% @importance 0.85

0.93::acc(s_merchant, recommended_weight_range_size_166w).

0.95::true_val(recommended_weight_range_size_166w, r82_118plus_166w); 0.05::true_val(recommended_weight_range_size_166w, unk_recommended_weight_range_size_166w).

measured(s_merchant, recommended_weight_range_size_166w, r82_118plus_166w).

all_consistent(recommended_weight_range_size_166w) :-
    consistent(s_merchant, recommended_weight_range_size_166w).

evidence(all_consistent(recommended_weight_range_size_166w)).
query(true_val(recommended_weight_range_size_166w, r82_118plus_166w)).
query(true_val(recommended_weight_range_size_166w, unk_recommended_weight_range_size_166w)).

% @attr effective_edge_170w
% @type numeric
% @unit mm
% @canonical false
% @original_name effective edge 170W
% @values v1335=1335.0 unk_effective_edge_170w=Unknown
% @importance 0.85

0.93::acc(s_merchant, effective_edge_170w).

0.95::true_val(effective_edge_170w, v1335); 0.05::true_val(effective_edge_170w, unk_effective_edge_170w).

measured(s_merchant, effective_edge_170w, v1335).

all_consistent(effective_edge_170w) :-
    consistent(s_merchant, effective_edge_170w).

evidence(all_consistent(effective_edge_170w)).
query(true_val(effective_edge_170w, v1335)).
query(true_val(effective_edge_170w, unk_effective_edge_170w)).

% @attr waist_width_170w
% @type numeric
% @unit mm
% @canonical false
% @original_name waist width 170W
% @values v270=270.0 unk_waist_width_170w=Unknown
% @importance 0.85

0.93::acc(s_merchant, waist_width_170w).

0.95::true_val(waist_width_170w, v270); 0.05::true_val(waist_width_170w, unk_waist_width_170w).

measured(s_merchant, waist_width_170w, v270).

all_consistent(waist_width_170w) :-
    consistent(s_merchant, waist_width_170w).

evidence(all_consistent(waist_width_170w)).
query(true_val(waist_width_170w, v270)).
query(true_val(waist_width_170w, unk_waist_width_170w)).

% @attr recommended_weight_range_size_170w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values r82_118plus_170w=82_118plus_kg unk_recommended_weight_range_size_170w=Unknown
% @importance 0.85

0.93::acc(s_merchant, recommended_weight_range_size_170w).

0.95::true_val(recommended_weight_range_size_170w, r82_118plus_170w); 0.05::true_val(recommended_weight_range_size_170w, unk_recommended_weight_range_size_170w).

measured(s_merchant, recommended_weight_range_size_170w, r82_118plus_170w).

all_consistent(recommended_weight_range_size_170w) :-
    consistent(s_merchant, recommended_weight_range_size_170w).

evidence(all_consistent(recommended_weight_range_size_170w)).
query(true_val(recommended_weight_range_size_170w, r82_118plus_170w)).
query(true_val(recommended_weight_range_size_170w, unk_recommended_weight_range_size_170w)).

% @attr terrain_suitability_park
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability
% @values v6_park=6.0 unk_terrain_suitability_park=Unknown
% @importance 0.85

0.93::acc(s_merchant, terrain_suitability_park).
0.62::acc(s19, terrain_suitability_park).

0.95::true_val(terrain_suitability_park, v6_park); 0.05::true_val(terrain_suitability_park, unk_terrain_suitability_park).

measured(s_merchant, terrain_suitability_park, v6_park).
measured(s19, terrain_suitability_park, v6_park).

all_consistent(terrain_suitability_park) :-
    (indep(s_merchant), consistent(s_merchant, terrain_suitability_park) ; \+indep(s_merchant)),
    (indep(s19), consistent(s19, terrain_suitability_park) ; \+indep(s19)).

evidence(all_consistent(terrain_suitability_park)).
query(true_val(terrain_suitability_park, v6_park)).
query(true_val(terrain_suitability_park, unk_terrain_suitability_park)).

% @attr terrain_suitability
% @type numeric
% @unit /10
% @canonical true
% @original_name terrain_suitability
% @values v10_am=10.0 unk_terrain_suitability=Unknown
% @importance 0.85

0.93::acc(s_merchant, terrain_suitability).
0.62::acc(s19, terrain_suitability).

0.95::true_val(terrain_suitability, v10_am); 0.05::true_val(terrain_suitability, unk_terrain_suitability).

measured(s_merchant, terrain_suitability, v10_am).
measured(s19, terrain_suitability, v10_am).

all_consistent(terrain_suitability) :-
    (indep(s_merchant), consistent(s_merchant, terrain_suitability) ; \+indep(s_merchant)),
    (indep(s19), consistent(s19, terrain_suitability) ; \+indep(s19)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, v10_am)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr terrain_suitability_powder
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability
% @values v6_powder=6.0 unk_terrain_suitability_powder=Unknown
% @importance 0.85

0.93::acc(s_merchant, terrain_suitability_powder).
0.62::acc(s19, terrain_suitability_powder).

0.95::true_val(terrain_suitability_powder, v6_powder); 0.05::true_val(terrain_suitability_powder, unk_terrain_suitability_powder).

measured(s_merchant, terrain_suitability_powder, v6_powder).
measured(s19, terrain_suitability_powder, v6_powder).

all_consistent(terrain_suitability_powder) :-
    (indep(s_merchant), consistent(s_merchant, terrain_suitability_powder) ; \+indep(s_merchant)),
    (indep(s19), consistent(s19, terrain_suitability_powder) ; \+indep(s19)).

evidence(all_consistent(terrain_suitability_powder)).
query(true_val(terrain_suitability_powder, v6_powder)).
query(true_val(terrain_suitability_powder, unk_terrain_suitability_powder)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate_to_expert=Intermediate_to_Expert unk_rider_level=Unknown
% @importance 0.85

0.93::acc(s_merchant, rider_level).
0.67::acc(s36, rider_level).
0.67::acc(s84, rider_level).

0.97::true_val(rider_level, intermediate_to_expert); 0.03::true_val(rider_level, unk_rider_level).

measured(s_merchant, rider_level, intermediate_to_expert).
measured(s36, rider_level, intermediate_to_expert).
measured(s84, rider_level, intermediate_to_expert).

all_consistent(rider_level) :-
    (indep(s_merchant), consistent(s_merchant, rider_level) ; \+indep(s_merchant)),
    (indep(s36), consistent(s36, rider_level) ; \+indep(s36)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate_to_expert)).
query(true_val(rider_level, unk_rider_level)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values all_mountain_freestyle=All_Mountain_Freestyle unk_riding_style=Unknown
% @importance 0.85

0.85::acc(s12, riding_style).
0.85::acc(s23, riding_style).

0.95::true_val(riding_style, all_mountain_freestyle); 0.05::true_val(riding_style, unk_riding_style).

measured(s12, riding_style, all_mountain_freestyle).
measured(s23, riding_style, all_mountain_freestyle).

all_consistent(riding_style) :-
    (indep(s2), consistent(s2, riding_style) ; \+indep(s2)).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, all_mountain_freestyle)).
query(true_val(riding_style, unk_riding_style)).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v799_99=799.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.93::acc(s_merchant, price_aud_merchant).

0.95::true_val(price_aud_merchant, v799_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s_merchant, price_aud_merchant, v799_99).

all_consistent(price_aud_merchant) :-
    consistent(s_merchant, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v799_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_aud_merchant_rrp
% @type numeric
% @unit AUD
% @canonical false
% @original_name price_aud_merchant
% @values v999_99=999.99 unk_price_aud_merchant_rrp=Unknown
% @importance 0.85

0.93::acc(s_merchant, price_aud_merchant_rrp).

0.95::true_val(price_aud_merchant_rrp, v999_99); 0.05::true_val(price_aud_merchant_rrp, unk_price_aud_merchant_rrp).

measured(s_merchant, price_aud_merchant_rrp, v999_99).

all_consistent(price_aud_merchant_rrp) :-
    consistent(s_merchant, price_aud_merchant_rrp).

evidence(all_consistent(price_aud_merchant_rrp)).
query(true_val(price_aud_merchant_rrp, v999_99)).
query(true_val(price_aud_merchant_rrp, unk_price_aud_merchant_rrp)).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v679_95=679.95 v679_99=679.99
% @importance 0.88

0.88::acc(s21, price_usd_msrp).
0.80::acc(s42, price_usd_msrp).
0.62::acc(s34, price_usd_msrp).

0.80::true_val(price_usd_msrp, v679_95); 0.20::true_val(price_usd_msrp, v679_99).

measured(s21, price_usd_msrp, v679_95).
measured(s42, price_usd_msrp, v679_95).
measured(s34, price_usd_msrp, v679_99).

all_consistent(price_usd_msrp) :-
    consistent(s21, price_usd_msrp),
    consistent(s42, price_usd_msrp),
    (indep(s34), consistent(s34, price_usd_msrp) ; \+indep(s34)).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v679_95)).
query(true_val(price_usd_msrp, v679_99)).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_evo
% @values v475_96=475.96 unk_price_usd_evo=Unknown
% @importance 0.80

0.72::acc(s32, price_usd_evo).
0.72::acc(s93, price_usd_evo).

0.92::true_val(price_usd_evo, v475_96); 0.08::true_val(price_usd_evo, unk_price_usd_evo).

measured(s32, price_usd_evo, v475_96).
measured(s93, price_usd_evo, v475_96).

all_consistent(price_usd_evo) :-
    consistent(s32, price_usd_evo),
    consistent(s93, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v475_96)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_darkside_2nd
% @type numeric
% @unit USD
% @canonical false
% @original_name USD sale price (Darkside 2nd Quality)
% @values v475_96_ds=475.96 unk_price_usd_darkside_2nd=Unknown
% @importance 0.85

0.62::acc(s26, price_usd_darkside_2nd).

0.85::true_val(price_usd_darkside_2nd, v475_96_ds); 0.15::true_val(price_usd_darkside_2nd, unk_price_usd_darkside_2nd).

measured(s26, price_usd_darkside_2nd, v475_96_ds).

all_consistent(price_usd_darkside_2nd) :-
    consistent(s26, price_usd_darkside_2nd).

evidence(all_consistent(price_usd_darkside_2nd)).
query(true_val(price_usd_darkside_2nd, v475_96_ds)).
query(true_val(price_usd_darkside_2nd, unk_price_usd_darkside_2nd)).

% @attr price_usd_ebay
% @type numeric
% @unit USD
% @canonical false
% @original_name USD sale price (eBay)
% @values v509_96=509.96 unk_price_usd_ebay=Unknown
% @importance 0.80

0.42::acc(s28, price_usd_ebay).

0.75::true_val(price_usd_ebay, v509_96); 0.25::true_val(price_usd_ebay, unk_price_usd_ebay).

measured(s28, price_usd_ebay, v509_96).

all_consistent(price_usd_ebay) :-
    consistent(s28, price_usd_ebay).

evidence(all_consistent(price_usd_ebay)).
query(true_val(price_usd_ebay, v509_96)).
query(true_val(price_usd_ebay, unk_price_usd_ebay)).

% @attr price_eur_blue_tomato
% @type categorical
% @unit EUR
% @canonical true
% @original_name price_eur_blue_tomato
% @values eur_359_95_prior_year=359.95_EUR_prior_year_discounted unk_price_eur_blue_tomato=Unknown
% @importance 0.70

0.60::acc(s95, price_eur_blue_tomato).

0.78::true_val(price_eur_blue_tomato, eur_359_95_prior_year); 0.22::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).

measured(s95, price_eur_blue_tomato, eur_359_95_prior_year).

all_consistent(price_eur_blue_tomato) :-
    consistent(s95, price_eur_blue_tomato).

evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, eur_359_95_prior_year)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

% @attr comparable_board_cross_brand_doa_price
% @type numeric
% @unit USD
% @canonical false
% @original_name comparable_board_cross_brand
% @values v579_95_doa=579.95 unk_comparable_board_cross_brand_doa_price=Unknown
% @importance 0.80

0.68::acc(s60, comparable_board_cross_brand_doa_price).

0.88::true_val(comparable_board_cross_brand_doa_price, v579_95_doa); 0.12::true_val(comparable_board_cross_brand_doa_price, unk_comparable_board_cross_brand_doa_price).

measured(s60, comparable_board_cross_brand_doa_price, v579_95_doa).

all_consistent(comparable_board_cross_brand_doa_price) :-
    consistent(s60, comparable_board_cross_brand_doa_price).

evidence(all_consistent(comparable_board_cross_brand_doa_price)).
query(true_val(comparable_board_cross_brand_doa_price, v579_95_doa)).
query(true_val(comparable_board_cross_brand_doa_price, unk_comparable_board_cross_brand_doa_price)).

% @attr comparable_board_cross_brand_jones_price
% @type numeric
% @unit USD
% @canonical false
% @original_name comparable_board_cross_brand
% @values v579_95_jones=579.95 unk_comparable_board_cross_brand_jones_price=Unknown
% @importance 0.85

0.63::acc(s56, comparable_board_cross_brand_jones_price).

0.88::true_val(comparable_board_cross_brand_jones_price, v579_95_jones); 0.12::true_val(comparable_board_cross_brand_jones_price, unk_comparable_board_cross_brand_jones_price).

measured(s56, comparable_board_cross_brand_jones_price, v579_95_jones).

all_consistent(comparable_board_cross_brand_jones_price) :-
    consistent(s56, comparable_board_cross_brand_jones_price).

evidence(all_consistent(comparable_board_cross_brand_jones_price)).
query(true_val(comparable_board_cross_brand_jones_price, v579_95_jones)).
query(true_val(comparable_board_cross_brand_jones_price, unk_comparable_board_cross_brand_jones_price)).

% @attr comparable_board_same_brand_custom_x_price
% @type numeric
% @unit USD
% @canonical false
% @original_name comparable_board_same_brand
% @values v899_95=899.95 unk_comparable_board_same_brand_custom_x_price=Unknown
% @importance 0.75

0.72::acc(s96, comparable_board_same_brand_custom_x_price).

0.90::true_val(comparable_board_same_brand_custom_x_price, v899_95); 0.10::true_val(comparable_board_same_brand_custom_x_price, unk_comparable_board_same_brand_custom_x_price).

measured(s96, comparable_board_same_brand_custom_x_price, v899_95).

all_consistent(comparable_board_same_brand_custom_x_price) :-
    consistent(s96, comparable_board_same_brand_custom_x_price).

evidence(all_consistent(comparable_board_same_brand_custom_x_price)).
query(true_val(comparable_board_same_brand_custom_x_price, v899_95)).
query(true_val(comparable_board_same_brand_custom_x_price, unk_comparable_board_same_brand_custom_x_price)).

% @attr comparable_board_cross_brand_mercury_price
% @type numeric
% @unit USD
% @canonical false
% @original_name comparable_board_cross_brand
% @values v629_95=629.95 unk_comparable_board_cross_brand_mercury_price=Unknown
% @importance 0.85

0.63::acc(s56, comparable_board_cross_brand_mercury_price).

0.88::true_val(comparable_board_cross_brand_mercury_price, v629_95); 0.12::true_val(comparable_board_cross_brand_mercury_price, unk_comparable_board_cross_brand_mercury_price).

measured(s56, comparable_board_cross_brand_mercury_price, v629_95).

all_consistent(comparable_board_cross_brand_mercury_price) :-
    consistent(s56, comparable_board_cross_brand_mercury_price).

evidence(all_consistent(comparable_board_cross_brand_mercury_price)).
query(true_val(comparable_board_cross_brand_mercury_price, v629_95)).
query(true_val(comparable_board_cross_brand_mercury_price, unk_comparable_board_cross_brand_mercury_price)).

% @attr comparable_board_cross_brand_ns_price
% @type numeric
% @unit USD
% @canonical false
% @original_name comparable_board_cross_brand
% @values v699_99=699.99 unk_comparable_board_cross_brand_ns_price=Unknown
% @importance 0.85

0.63::acc(s56, comparable_board_cross_brand_ns_price).

0.88::true_val(comparable_board_cross_brand_ns_price, v699_99); 0.12::true_val(comparable_board_cross_brand_ns_price, unk_comparable_board_cross_brand_ns_price).

measured(s56, comparable_board_cross_brand_ns_price, v699_99).

all_consistent(comparable_board_cross_brand_ns_price) :-
    consistent(s56, comparable_board_cross_brand_ns_price).

evidence(all_consistent(comparable_board_cross_brand_ns_price)).
query(true_val(comparable_board_cross_brand_ns_price, v699_99)).
query(true_val(comparable_board_cross_brand_ns_price, unk_comparable_board_cross_brand_ns_price)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values available_burton_com=Available_Burton_com unk_availability_status=Unknown
% @importance 1.00

0.90::acc(s15, availability_status).

0.95::true_val(availability_status, available_burton_com); 0.05::true_val(availability_status, unk_availability_status).

measured(s15, availability_status, available_burton_com).

all_consistent(availability_status) :-
    consistent(s15, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, available_burton_com)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_rei
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_rei=Available_REI_Co_op unk_availability_status_rei=Unknown
% @importance 0.90

0.82::acc(s37, availability_status_rei).

0.92::true_val(availability_status_rei, available_rei); 0.08::true_val(availability_status_rei, unk_availability_status_rei).

measured(s37, availability_status_rei, available_rei).

all_consistent(availability_status_rei) :-
    consistent(s37, availability_status_rei).

evidence(all_consistent(availability_status_rei)).
query(true_val(availability_status_rei, available_rei)).
query(true_val(availability_status_rei, unk_availability_status_rei)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_evo=Available_evo_com_blem_discount unk_availability_status_evo=Unknown
% @importance 0.80

0.72::acc(s32, availability_status_evo).

0.90::true_val(availability_status_evo, available_evo); 0.10::true_val(availability_status_evo, unk_availability_status_evo).

measured(s32, availability_status_evo, available_evo).

all_consistent(availability_status_evo) :-
    consistent(s32, availability_status_evo).

evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, available_evo)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

% @attr availability_status_willis
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_willis=Available_Willis_Ski_some_sizes_oos unk_availability_status_willis=Unknown
% @importance 0.80

0.70::acc(s21, availability_status_willis).

0.88::true_val(availability_status_willis, available_willis); 0.12::true_val(availability_status_willis, unk_availability_status_willis).

measured(s21, availability_status_willis, available_willis).

all_consistent(availability_status_willis) :-
    consistent(s21, availability_status_willis).

evidence(all_consistent(availability_status_willis)).
query(true_val(availability_status_willis, available_willis)).
query(true_val(availability_status_willis, unk_availability_status_willis)).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_blauer=Available_Blauer_Board_Shop unk_availability_status_blauer=Unknown
% @importance 0.83

0.75::acc(s2, availability_status_blauer).

0.90::true_val(availability_status_blauer, available_blauer); 0.10::true_val(availability_status_blauer, unk_availability_status_blauer).

measured(s2, availability_status_blauer, available_blauer).

all_consistent(availability_status_blauer) :-
    consistent(s2, availability_status_blauer).

evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, available_blauer)).
query(true_val(availability_status_blauer, unk_availability_status_blauer)).

% @attr availability_status_focus
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_focus=Available_Focus_Boardshop_156_backordered unk_availability_status_focus=Unknown
% @importance 0.70

0.63::acc(s3, availability_status_focus).

0.88::true_val(availability_status_focus, available_focus); 0.12::true_val(availability_status_focus, unk_availability_status_focus).

measured(s3, availability_status_focus, available_focus).

all_consistent(availability_status_focus) :-
    consistent(s3, availability_status_focus).

evidence(all_consistent(availability_status_focus)).
query(true_val(availability_status_focus, available_focus)).
query(true_val(availability_status_focus, unk_availability_status_focus)).

% @attr availability_status_pacific
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_pacific=Available_Pacific_Boarder_Vancouver unk_availability_status_pacific=Unknown
% @importance 0.58

0.55::acc(s9, availability_status_pacific).

0.85::true_val(availability_status_pacific, available_pacific); 0.15::true_val(availability_status_pacific, unk_availability_status_pacific).

measured(s9, availability_status_pacific, available_pacific).

all_consistent(availability_status_pacific) :-
    consistent(s9, availability_status_pacific).

evidence(all_consistent(availability_status_pacific)).
query(true_val(availability_status_pacific, available_pacific)).
query(true_val(availability_status_pacific, unk_availability_status_pacific)).

% @attr availability_status_aspen
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_aspen=Available_Aspen_Ski_backordered unk_availability_status_aspen=Unknown
% @importance 0.85

0.58::acc(s34, availability_status_aspen).

0.85::true_val(availability_status_aspen, available_aspen); 0.15::true_val(availability_status_aspen, unk_availability_status_aspen).

measured(s34, availability_status_aspen, available_aspen).

all_consistent(availability_status_aspen) :-
    consistent(s34, availability_status_aspen).

evidence(all_consistent(availability_status_aspen)).
query(true_val(availability_status_aspen, available_aspen)).
query(true_val(availability_status_aspen, unk_availability_status_aspen)).

% @attr availability_status_corbetts
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_corbetts=Available_Corbetts unk_availability_status_corbetts=Unknown
% @importance 0.60

0.63::acc(s1, availability_status_corbetts).

0.88::true_val(availability_status_corbetts, available_corbetts); 0.12::true_val(availability_status_corbetts, unk_availability_status_corbetts).

measured(s1, availability_status_corbetts, available_corbetts).

all_consistent(availability_status_corbetts) :-
    consistent(s1, availability_status_corbetts).

evidence(all_consistent(availability_status_corbetts)).
query(true_val(availability_status_corbetts, available_corbetts)).
query(true_val(availability_status_corbetts, unk_availability_status_corbetts)).

% @attr availability_status_shoreline
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_shoreline=Available_Shoreline_Tahoe unk_availability_status_shoreline=Unknown
% @importance 0.80

0.67::acc(s36, availability_status_shoreline).

0.88::true_val(availability_status_shoreline, available_shoreline); 0.12::true_val(availability_status_shoreline, unk_availability_status_shoreline).

measured(s36, availability_status_shoreline, available_shoreline).

all_consistent(availability_status_shoreline) :-
    consistent(s36, availability_status_shoreline).

evidence(all_consistent(availability_status_shoreline)).
query(true_val(availability_status_shoreline, available_shoreline)).
query(true_val(availability_status_shoreline, unk_availability_status_shoreline)).

% @attr availability_status_source
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_source=Available_The_Source unk_availability_status_source=Unknown
% @importance 0.55

0.55::acc(s6, availability_status_source).

0.85::true_val(availability_status_source, available_source); 0.15::true_val(availability_status_source, unk_availability_status_source).

measured(s6, availability_status_source, available_source).

all_consistent(availability_status_source) :-
    consistent(s6, availability_status_source).

evidence(all_consistent(availability_status_source)).
query(true_val(availability_status_source, available_source)).
query(true_val(availability_status_source, unk_availability_status_source)).

% @attr availability_status_darkside
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_darkside=Available_Darkside_Snowboards unk_availability_status_darkside=Unknown
% @importance 0.75

0.58::acc(s26, availability_status_darkside).

0.85::true_val(availability_status_darkside, available_darkside); 0.15::true_val(availability_status_darkside, unk_availability_status_darkside).

measured(s26, availability_status_darkside, available_darkside).

all_consistent(availability_status_darkside) :-
    consistent(s26, availability_status_darkside).

evidence(all_consistent(availability_status_darkside)).
query(true_val(availability_status_darkside, available_darkside)).
query(true_val(availability_status_darkside, unk_availability_status_darkside)).

% @attr availability_status_ebay
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_ebay=Available_eBay_limited_sizes unk_availability_status_ebay=Unknown
% @importance 0.80

0.42::acc(s28, availability_status_ebay).

0.75::true_val(availability_status_ebay, available_ebay); 0.25::true_val(availability_status_ebay, unk_availability_status_ebay).

measured(s28, availability_status_ebay, available_ebay).

all_consistent(availability_status_ebay) :-
    consistent(s28, availability_status_ebay).

evidence(all_consistent(availability_status_ebay)).
query(true_val(availability_status_ebay, available_ebay)).
query(true_val(availability_status_ebay, unk_availability_status_ebay)).

% @attr availability_status_twelve
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_twelve=Available_Twelve_Board_Store_AU unk_availability_status_twelve=Unknown
% @importance 0.80

0.58::acc(s14, availability_status_twelve).

0.85::true_val(availability_status_twelve, available_twelve); 0.15::true_val(availability_status_twelve, unk_availability_status_twelve).

measured(s14, availability_status_twelve, available_twelve).

all_consistent(availability_status_twelve) :-
    consistent(s14, availability_status_twelve).

evidence(all_consistent(availability_status_twelve)).
query(true_val(availability_status_twelve, available_twelve)).
query(true_val(availability_status_twelve, unk_availability_status_twelve)).

% @attr availability_status_balmoral
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_balmoral=Available_Balmoral_Boards_AU unk_availability_status_balmoral=Unknown
% @importance 0.85

0.62::acc(s19, availability_status_balmoral).

0.85::true_val(availability_status_balmoral, available_balmoral); 0.15::true_val(availability_status_balmoral, unk_availability_status_balmoral).

measured(s19, availability_status_balmoral, available_balmoral).

all_consistent(availability_status_balmoral) :-
    consistent(s19, availability_status_balmoral).

evidence(all_consistent(availability_status_balmoral)).
query(true_val(availability_status_balmoral, available_balmoral)).
query(true_val(availability_status_balmoral, unk_availability_status_balmoral)).

% @attr availability_status_btp
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_btp=Available_Behind_The_Pines_EU unk_availability_status_btp=Unknown
% @importance 0.70

0.55::acc(s10, availability_status_btp).

0.85::true_val(availability_status_btp, available_btp); 0.15::true_val(availability_status_btp, unk_availability_status_btp).

measured(s10, availability_status_btp, available_btp).

all_consistent(availability_status_btp) :-
    consistent(s10, availability_status_btp).

evidence(all_consistent(availability_status_btp)).
query(true_val(availability_status_btp, available_btp)).
query(true_val(availability_status_btp, unk_availability_status_btp)).

% @attr availability_status_sartorius
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_sartorius=Available_Sartorius_Sports unk_availability_status_sartorius=Unknown
% @importance 0.65

0.55::acc(s8, availability_status_sartorius).

0.80::true_val(availability_status_sartorius, available_sartorius); 0.20::true_val(availability_status_sartorius, unk_availability_status_sartorius).

measured(s8, availability_status_sartorius, available_sartorius).

all_consistent(availability_status_sartorius) :-
    consistent(s8, availability_status_sartorius).

evidence(all_consistent(availability_status_sartorius)).
query(true_val(availability_status_sartorius, available_sartorius)).
query(true_val(availability_status_sartorius, unk_availability_status_sartorius)).

% @attr availability_status_rudeboys
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_rudeboys=Available_Rude_Boys_Banff unk_availability_status_rudeboys=Unknown
% @importance 0.50

0.62::acc(s83, availability_status_rudeboys).

0.85::true_val(availability_status_rudeboys, available_rudeboys); 0.15::true_val(availability_status_rudeboys, unk_availability_status_rudeboys).

measured(s83, availability_status_rudeboys, available_rudeboys).

all_consistent(availability_status_rudeboys) :-
    consistent(s83, availability_status_rudeboys).

evidence(all_consistent(availability_status_rudeboys)).
query(true_val(availability_status_rudeboys, available_rudeboys)).
query(true_val(availability_status_rudeboys, unk_availability_status_rudeboys)).

% @attr availability_status_skimonster
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_skimonster=Available_The_Ski_Monster_showing_2027 unk_availability_status_skimonster=Unknown
% @importance 0.85

0.71::acc(s39, availability_status_skimonster).

0.88::true_val(availability_status_skimonster, available_skimonster); 0.12::true_val(availability_status_skimonster, unk_availability_status_skimonster).

measured(s39, availability_status_skimonster, available_skimonster).

all_consistent(availability_status_skimonster) :-
    consistent(s39, availability_status_skimonster).

evidence(all_consistent(availability_status_skimonster)).
query(true_val(availability_status_skimonster, available_skimonster)).
query(true_val(availability_status_skimonster, unk_availability_status_skimonster)).

% @attr availability_status_peterglenn
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_peterglenn=Available_Peter_Glenn unk_availability_status_peterglenn=Unknown
% @importance 0.65

0.55::acc(s38, availability_status_peterglenn).

0.80::true_val(availability_status_peterglenn, available_peterglenn); 0.20::true_val(availability_status_peterglenn, unk_availability_status_peterglenn).

measured(s38, availability_status_peterglenn, available_peterglenn).

all_consistent(availability_status_peterglenn) :-
    consistent(s38, availability_status_peterglenn).

evidence(all_consistent(availability_status_peterglenn)).
query(true_val(availability_status_peterglenn, available_peterglenn)).
query(true_val(availability_status_peterglenn, unk_availability_status_peterglenn)).

% @attr availability_status_alpine
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_alpine=Available_Alpine_Shop unk_availability_status_alpine=Unknown
% @importance 0.65

0.55::acc(s89, availability_status_alpine).

0.80::true_val(availability_status_alpine, available_alpine); 0.20::true_val(availability_status_alpine, unk_availability_status_alpine).

measured(s89, availability_status_alpine, available_alpine).

all_consistent(availability_status_alpine) :-
    consistent(s89, availability_status_alpine).

evidence(all_consistent(availability_status_alpine)).
query(true_val(availability_status_alpine, available_alpine)).
query(true_val(availability_status_alpine, unk_availability_status_alpine)).

% @attr availability_status_bergs
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_bergs=Available_Bergs_Ski_Shop unk_availability_status_bergs=Unknown
% @importance 0.75

0.58::acc(s85, availability_status_bergs).

0.85::true_val(availability_status_bergs, available_bergs); 0.15::true_val(availability_status_bergs, unk_availability_status_bergs).

measured(s85, availability_status_bergs, available_bergs).

all_consistent(availability_status_bergs) :-
    consistent(s85, availability_status_bergs).

evidence(all_consistent(availability_status_bergs)).
query(true_val(availability_status_bergs, available_bergs)).
query(true_val(availability_status_bergs, unk_availability_status_bergs)).

% @attr shipping_restriction
% @type categorical
% @canonical false
% @original_name shipping restriction (merchant site)
% @values australia_only=Only_available_shipping_within_Australia unk_shipping_restriction=Unknown
% @importance 0.85

0.93::acc(s_merchant, shipping_restriction).

0.95::true_val(shipping_restriction, australia_only); 0.05::true_val(shipping_restriction, unk_shipping_restriction).

measured(s_merchant, shipping_restriction, australia_only).

all_consistent(shipping_restriction) :-
    consistent(s_merchant, shipping_restriction).

evidence(all_consistent(shipping_restriction)).
query(true_val(shipping_restriction, australia_only)).
query(true_val(shipping_restriction, unk_shipping_restriction)).

% @attr reviewer_opinion_whitelines
% @type numeric
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values v89_52=89.52 unk_reviewer_opinion_whitelines=Unknown
% @importance 0.90

0.82::acc(s42, reviewer_opinion_whitelines).

0.88::true_val(reviewer_opinion_whitelines, v89_52); 0.12::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

measured(s42, reviewer_opinion_whitelines, v89_52).

all_consistent(reviewer_opinion_whitelines) :-
    consistent(s42, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, v89_52)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

% @attr reviewer_opinion_whitelines_rank
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values rank_9_of_38=9th_of_38_all_mountain_8th_of_36_park unk_reviewer_opinion_whitelines_rank=Unknown
% @importance 0.90

0.82::acc(s42, reviewer_opinion_whitelines_rank).

0.88::true_val(reviewer_opinion_whitelines_rank, rank_9_of_38); 0.12::true_val(reviewer_opinion_whitelines_rank, unk_reviewer_opinion_whitelines_rank).

measured(s42, reviewer_opinion_whitelines_rank, rank_9_of_38).

all_consistent(reviewer_opinion_whitelines_rank) :-
    consistent(s42, reviewer_opinion_whitelines_rank).

evidence(all_consistent(reviewer_opinion_whitelines_rank)).
query(true_val(reviewer_opinion_whitelines_rank, rank_9_of_38)).
query(true_val(reviewer_opinion_whitelines_rank, unk_reviewer_opinion_whitelines_rank)).

% @attr overall_rating_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name overall_rating_snowboardingprofiles
% @values rank_4_top_am=Number_4_Top_All_Mountain_2026 unk_overall_rating_snowboardingprofiles=Unknown
% @importance 0.85

0.63::acc(s61, overall_rating_snowboardingprofiles).

0.88::true_val(overall_rating_snowboardingprofiles, rank_4_top_am); 0.12::true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles).

measured(s61, overall_rating_snowboardingprofiles, rank_4_top_am).

all_consistent(overall_rating_snowboardingprofiles) :-
    consistent(s61, overall_rating_snowboardingprofiles).

evidence(all_consistent(overall_rating_snowboardingprofiles)).
query(true_val(overall_rating_snowboardingprofiles, rank_4_top_am)).
query(true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles)).

% @attr inertia_2026_opinion
% @type categorical
% @canonical false
% @original_name The Inertia 2026
% @values worthy_not_top_pick=Not_top_pick_but_still_worthy unk_inertia_2026_opinion=Unknown
% @importance 0.80

0.68::acc(s60, inertia_2026_opinion).

0.88::true_val(inertia_2026_opinion, worthy_not_top_pick); 0.12::true_val(inertia_2026_opinion, unk_inertia_2026_opinion).

measured(s60, inertia_2026_opinion, worthy_not_top_pick).

all_consistent(inertia_2026_opinion) :-
    consistent(s60, inertia_2026_opinion).

evidence(all_consistent(inertia_2026_opinion)).
query(true_val(inertia_2026_opinion, worthy_not_top_pick)).
query(true_val(inertia_2026_opinion, unk_inertia_2026_opinion)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values five_stars_brilliant=5_of_5_stars_absolutely_brilliant unk_user_review_forum=Unknown
% @importance 0.65

0.35::acc(s44, user_review_forum).

0.75::true_val(user_review_forum, five_stars_brilliant); 0.25::true_val(user_review_forum, unk_user_review_forum).

measured(s44, user_review_forum, five_stars_brilliant).

all_consistent(user_review_forum) :-
    consistent(s44, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, five_stars_brilliant)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr user_review_forum_build
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values build_quality_10_10=Build_quality_top_tier_10_of_10 unk_user_review_forum_build=Unknown
% @importance 0.85

0.65::acc(s39, user_review_forum_build).

0.82::true_val(user_review_forum_build, build_quality_10_10); 0.18::true_val(user_review_forum_build, unk_user_review_forum_build).

measured(s39, user_review_forum_build, build_quality_10_10).

all_consistent(user_review_forum_build) :-
    consistent(s39, user_review_forum_build).

evidence(all_consistent(user_review_forum_build)).
query(true_val(user_review_forum_build, build_quality_10_10)).
query(true_val(user_review_forum_build, unk_user_review_forum_build)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values not_one_board_quiver=Not_one_board_quiver_missing_float_edge_hold_but_fun_springy unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.90

0.64::acc(s45, reviewer_opinion_the_good_ride).

0.85::true_val(reviewer_opinion_the_good_ride, not_one_board_quiver); 0.15::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s45, reviewer_opinion_the_good_ride, not_one_board_quiver).

all_consistent(reviewer_opinion_the_good_ride) :-
    consistent(s45, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, not_one_board_quiver)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr reviewer_opinion_the_good_ride_edge
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values let_go_hard_patches=Let_go_pretty_easy_on_hard_patches unk_reviewer_opinion_the_good_ride_edge=Unknown
% @importance 0.90

0.64::acc(s45, reviewer_opinion_the_good_ride_edge).

0.85::true_val(reviewer_opinion_the_good_ride_edge, let_go_hard_patches); 0.15::true_val(reviewer_opinion_the_good_ride_edge, unk_reviewer_opinion_the_good_ride_edge).

measured(s45, reviewer_opinion_the_good_ride_edge, let_go_hard_patches).

all_consistent(reviewer_opinion_the_good_ride_edge) :-
    consistent(s45, reviewer_opinion_the_good_ride_edge).

evidence(all_consistent(reviewer_opinion_the_good_ride_edge)).
query(true_val(reviewer_opinion_the_good_ride_edge, let_go_hard_patches)).
query(true_val(reviewer_opinion_the_good_ride_edge, unk_reviewer_opinion_the_good_ride_edge)).

% @attr reviewer_opinion_whitelines_responsive
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values responsive_power_pop=Responsive_feel_added_power_pop_for_carving unk_reviewer_opinion_whitelines_responsive=Unknown
% @importance 0.90

0.82::acc(s42, reviewer_opinion_whitelines_responsive).

0.88::true_val(reviewer_opinion_whitelines_responsive, responsive_power_pop); 0.12::true_val(reviewer_opinion_whitelines_responsive, unk_reviewer_opinion_whitelines_responsive).

measured(s42, reviewer_opinion_whitelines_responsive, responsive_power_pop).

all_consistent(reviewer_opinion_whitelines_responsive) :-
    consistent(s42, reviewer_opinion_whitelines_responsive).

evidence(all_consistent(reviewer_opinion_whitelines_responsive)).
query(true_val(reviewer_opinion_whitelines_responsive, responsive_power_pop)).
query(true_val(reviewer_opinion_whitelines_responsive, unk_reviewer_opinion_whitelines_responsive)).

% @attr flex_feel_detail
% @type categorical
% @canonical false
% @original_name flex_feel
% @values nose_tail_softer=Nose_tail_softer_center_stiffer_playful_stable unk_flex_feel_detail=Unknown
% @importance 0.90

0.82::acc(s42, flex_feel_detail).

0.88::true_val(flex_feel_detail, nose_tail_softer); 0.12::true_val(flex_feel_detail, unk_flex_feel_detail).

measured(s42, flex_feel_detail, nose_tail_softer).

all_consistent(flex_feel_detail) :-
    consistent(s42, flex_feel_detail).

evidence(all_consistent(flex_feel_detail)).
query(true_val(flex_feel_detail, nose_tail_softer)).
query(true_val(flex_feel_detail, unk_flex_feel_detail)).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name reviewer_opinion_snowboardingprofiles
% @values not_awesome_powder=Not_awesome_for_powder_back_leg_burner_handles_shallow_ok unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.85

0.60::acc(s43, reviewer_opinion_snowboardingprofiles).

0.85::true_val(reviewer_opinion_snowboardingprofiles, not_awesome_powder); 0.15::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).

measured(s43, reviewer_opinion_snowboardingprofiles, not_awesome_powder).

all_consistent(reviewer_opinion_snowboardingprofiles) :-
    consistent(s43, reviewer_opinion_snowboardingprofiles).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, not_awesome_powder)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

% @attr reviewer_opinion_snowboardingprofiles_carve
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles
% @values fun_to_carve=Fun_to_carve_at_medium_to_mod_high_speeds unk_reviewer_opinion_snowboardingprofiles_carve=Unknown
% @importance 0.85

0.60::acc(s43, reviewer_opinion_snowboardingprofiles_carve).

0.85::true_val(reviewer_opinion_snowboardingprofiles_carve, fun_to_carve); 0.15::true_val(reviewer_opinion_snowboardingprofiles_carve, unk_reviewer_opinion_snowboardingprofiles_carve).

measured(s43, reviewer_opinion_snowboardingprofiles_carve, fun_to_carve).

all_consistent(reviewer_opinion_snowboardingprofiles_carve) :-
    consistent(s43, reviewer_opinion_snowboardingprofiles_carve).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_carve)).
query(true_val(reviewer_opinion_snowboardingprofiles_carve, fun_to_carve)).
query(true_val(reviewer_opinion_snowboardingprofiles_carve, unk_reviewer_opinion_snowboardingprofiles_carve)).

% @attr reviewer_opinion_whitelines_price
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values costs_7_95_above_avg=Costs_7_95_more_than_avg_468_01 unk_reviewer_opinion_whitelines_price=Unknown
% @importance 0.90

0.82::acc(s42, reviewer_opinion_whitelines_price).

0.88::true_val(reviewer_opinion_whitelines_price, costs_7_95_above_avg); 0.12::true_val(reviewer_opinion_whitelines_price, unk_reviewer_opinion_whitelines_price).

measured(s42, reviewer_opinion_whitelines_price, costs_7_95_above_avg).

all_consistent(reviewer_opinion_whitelines_price) :-
    consistent(s42, reviewer_opinion_whitelines_price).

evidence(all_consistent(reviewer_opinion_whitelines_price)).
query(true_val(reviewer_opinion_whitelines_price, costs_7_95_above_avg)).
query(true_val(reviewer_opinion_whitelines_price, unk_reviewer_opinion_whitelines_price)).

% @attr reviewer_opinion_the_good_ride_weight
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values light_side_medium=Feels_light_side_of_medium_bordering_lightweight unk_reviewer_opinion_the_good_ride_weight=Unknown
% @importance 0.65

0.64::acc(s74, reviewer_opinion_the_good_ride_weight).

0.85::true_val(reviewer_opinion_the_good_ride_weight, light_side_medium); 0.15::true_val(reviewer_opinion_the_good_ride_weight, unk_reviewer_opinion_the_good_ride_weight).

measured(s74, reviewer_opinion_the_good_ride_weight, light_side_medium).

all_consistent(reviewer_opinion_the_good_ride_weight) :-
    consistent(s74, reviewer_opinion_the_good_ride_weight).

evidence(all_consistent(reviewer_opinion_the_good_ride_weight)).
query(true_val(reviewer_opinion_the_good_ride_weight, light_side_medium)).
query(true_val(reviewer_opinion_the_good_ride_weight, unk_reviewer_opinion_the_good_ride_weight)).

% @attr reviewer_opinion_the_good_ride_no_weight
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values no_exact_weight_wood_varies=Does_not_publish_exact_weight_wood_cores_vary unk_reviewer_opinion_the_good_ride_no_weight=Unknown
% @importance 0.65

0.64::acc(s74, reviewer_opinion_the_good_ride_no_weight).

0.85::true_val(reviewer_opinion_the_good_ride_no_weight, no_exact_weight_wood_varies); 0.15::true_val(reviewer_opinion_the_good_ride_no_weight, unk_reviewer_opinion_the_good_ride_no_weight).

measured(s74, reviewer_opinion_the_good_ride_no_weight, no_exact_weight_wood_varies).

all_consistent(reviewer_opinion_the_good_ride_no_weight) :-
    consistent(s74, reviewer_opinion_the_good_ride_no_weight).

evidence(all_consistent(reviewer_opinion_the_good_ride_no_weight)).
query(true_val(reviewer_opinion_the_good_ride_no_weight, no_exact_weight_wood_varies)).
query(true_val(reviewer_opinion_the_good_ride_no_weight, unk_reviewer_opinion_the_good_ride_no_weight)).

% @attr board_weight_grams
% @type numeric
% @unit grams
% @canonical true
% @original_name board_weight_grams
% @values v3550=3550.0 unk_board_weight_grams=Unknown
% @importance 0.65

0.35::acc(s44, board_weight_grams).

0.65::true_val(board_weight_grams, v3550); 0.35::true_val(board_weight_grams, unk_board_weight_grams).

measured(s44, board_weight_grams, v3550).

all_consistent(board_weight_grams) :-
    consistent(s44, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v3550)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr comparable_board_cross_brand_jones_vs
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values custom_carving_jones_forgiving=Custom_better_carving_jumping_Jones_more_forgiving_ice unk_comparable_board_cross_brand_jones_vs=Unknown
% @importance 0.85

0.62::acc(s53, comparable_board_cross_brand_jones_vs).

0.85::true_val(comparable_board_cross_brand_jones_vs, custom_carving_jones_forgiving); 0.15::true_val(comparable_board_cross_brand_jones_vs, unk_comparable_board_cross_brand_jones_vs).

measured(s53, comparable_board_cross_brand_jones_vs, custom_carving_jones_forgiving).

all_consistent(comparable_board_cross_brand_jones_vs) :-
    consistent(s53, comparable_board_cross_brand_jones_vs).

evidence(all_consistent(comparable_board_cross_brand_jones_vs)).
query(true_val(comparable_board_cross_brand_jones_vs, custom_carving_jones_forgiving)).
query(true_val(comparable_board_cross_brand_jones_vs, unk_comparable_board_cross_brand_jones_vs)).

% @attr comparable_board_cross_brand_doa_vs
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values custom_versatile_doa_park=Custom_more_versatile_DOA_better_park_explosive_pop unk_comparable_board_cross_brand_doa_vs=Unknown
% @importance 0.80

0.62::acc(s55, comparable_board_cross_brand_doa_vs).

0.85::true_val(comparable_board_cross_brand_doa_vs, custom_versatile_doa_park); 0.15::true_val(comparable_board_cross_brand_doa_vs, unk_comparable_board_cross_brand_doa_vs).

measured(s55, comparable_board_cross_brand_doa_vs, custom_versatile_doa_park).

all_consistent(comparable_board_cross_brand_doa_vs) :-
    consistent(s55, comparable_board_cross_brand_doa_vs).

evidence(all_consistent(comparable_board_cross_brand_doa_vs)).
query(true_val(comparable_board_cross_brand_doa_vs, custom_versatile_doa_park)).
query(true_val(comparable_board_cross_brand_doa_vs, unk_comparable_board_cross_brand_doa_vs)).

% @attr user_review_forum_camber_precise
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values full_camber_more_precise=Full_camber_will_be_more_precise_vs_hybrid unk_user_review_forum_camber_precise=Unknown
% @importance 0.80

0.36::acc(s54, user_review_forum_camber_precise).

0.72::true_val(user_review_forum_camber_precise, full_camber_more_precise); 0.28::true_val(user_review_forum_camber_precise, unk_user_review_forum_camber_precise).

measured(s54, user_review_forum_camber_precise, full_camber_more_precise).

all_consistent(user_review_forum_camber_precise) :-
    consistent(s54, user_review_forum_camber_precise).

evidence(all_consistent(user_review_forum_camber_precise)).
query(true_val(user_review_forum_camber_precise, full_camber_more_precise)).
query(true_val(user_review_forum_camber_precise, unk_user_review_forum_camber_precise)).

% @attr user_review_forum_tech_behind
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values burton_left_behind_tech=Burton_left_behind_board_tech_other_options unk_user_review_forum_tech_behind=Unknown
% @importance 0.65

0.28::acc(s47, user_review_forum_tech_behind).

0.60::true_val(user_review_forum_tech_behind, burton_left_behind_tech); 0.40::true_val(user_review_forum_tech_behind, unk_user_review_forum_tech_behind).

measured(s47, user_review_forum_tech_behind, burton_left_behind_tech).

all_consistent(user_review_forum_tech_behind) :-
    consistent(s47, user_review_forum_tech_behind).

evidence(all_consistent(user_review_forum_tech_behind)).
query(true_val(user_review_forum_tech_behind, burton_left_behind_tech)).
query(true_val(user_review_forum_tech_behind, unk_user_review_forum_tech_behind)).

% @attr user_review_forum_tried_true
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values twin_camber_tried_true=Twin_camber_medium_stiffness_tried_and_true unk_user_review_forum_tried_true=Unknown
% @importance 0.65

0.28::acc(s47, user_review_forum_tried_true).

0.60::true_val(user_review_forum_tried_true, twin_camber_tried_true); 0.40::true_val(user_review_forum_tried_true, unk_user_review_forum_tried_true).

measured(s47, user_review_forum_tried_true, twin_camber_tried_true).

all_consistent(user_review_forum_tried_true) :-
    consistent(s47, user_review_forum_tried_true).

evidence(all_consistent(user_review_forum_tried_true)).
query(true_val(user_review_forum_tried_true, twin_camber_tried_true)).
query(true_val(user_review_forum_tried_true, unk_user_review_forum_tried_true)).

% @attr ride_characteristics
% @type categorical
% @canonical false
% @original_name ride characteristics
% @values poppy_precise_versatile_stable=Poppy_precise_versatile_stable_at_speed unk_ride_characteristics=Unknown
% @importance 0.80

0.75::acc(s2, ride_characteristics).
0.55::acc(s10, ride_characteristics).

0.90::true_val(ride_characteristics, poppy_precise_versatile_stable); 0.10::true_val(ride_characteristics, unk_ride_characteristics).

measured(s2, ride_characteristics, poppy_precise_versatile_stable).
measured(s10, ride_characteristics, poppy_precise_versatile_stable).

all_consistent(ride_characteristics) :-
    (indep(s2), consistent(s2, ride_characteristics) ; \+indep(s2)),
    (indep(s10), consistent(s10, ride_characteristics) ; \+indep(s10)).

evidence(all_consistent(ride_characteristics)).
query(true_val(ride_characteristics, poppy_precise_versatile_stable)).
query(true_val(ride_characteristics, unk_ride_characteristics)).

% @attr pop
% @type categorical
% @canonical false
% @original_name pop
% @values excellent=Excellent_especially_ollies_jump_boosting unk_pop=Unknown
% @importance 0.90

0.82::acc(s42, pop).
0.64::acc(s45, pop).

0.92::true_val(pop, excellent); 0.08::true_val(pop, unk_pop).

measured(s42, pop, excellent).
measured(s45, pop, excellent).

all_consistent(pop) :-
    consistent(s42, pop),
    consistent(s45, pop).

evidence(all_consistent(pop)).
query(true_val(pop, excellent)).
query(true_val(pop, unk_pop)).

% @attr positive_aspect
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values strong_firm_snow=Strong_particularly_on_firm_snow unk_positive_aspect=Unknown
% @importance 0.68

0.55::acc(s10, positive_aspect).
0.35::acc(s44, positive_aspect).

0.85::true_val(positive_aspect, strong_firm_snow); 0.15::true_val(positive_aspect, unk_positive_aspect).

measured(s10, positive_aspect, strong_firm_snow).
measured(s44, positive_aspect, strong_firm_snow).

all_consistent(positive_aspect) :-
    consistent(s10, positive_aspect),
    consistent(s44, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, strong_firm_snow)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values good_frostbite_limited_ice=Good_with_Frostbite_but_loses_grip_hard_ice_vs_disrupted unk_edge_hold=Unknown
% @importance 0.83

0.64::acc(s45, edge_hold).
0.58::acc(s85, edge_hold).

0.88::true_val(edge_hold, good_frostbite_limited_ice); 0.12::true_val(edge_hold, unk_edge_hold).

measured(s45, edge_hold, good_frostbite_limited_ice).
measured(s85, edge_hold, good_frostbite_limited_ice).

all_consistent(edge_hold) :-
    consistent(s45, edge_hold),
    (indep(s85), consistent(s85, edge_hold) ; \+indep(s85)).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, good_frostbite_limited_ice)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values limited_deep_powder=Limited_in_deep_powder_setback_helps_shallow_only unk_negative_aspect=Unknown
% @importance 0.85

0.60::acc(s43, negative_aspect).

0.85::true_val(negative_aspect, limited_deep_powder); 0.15::true_val(negative_aspect, unk_negative_aspect).

measured(s43, negative_aspect, limited_deep_powder).

all_consistent(negative_aspect) :-
    consistent(s43, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, limited_deep_powder)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values high_snappy=High_carbon_highlights_EGD_snappy_energy unk_turn_initiation_performance=Unknown
% @importance 0.85

0.82::acc(s42, turn_initiation_performance).

0.88::true_val(turn_initiation_performance, high_snappy); 0.12::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s42, turn_initiation_performance, high_snappy).

all_consistent(turn_initiation_performance) :-
    consistent(s42, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, high_snappy)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr chatter_performance
% @type categorical
% @canonical true
% @original_name chatter_performance
% @values medium_some_high_speed=Medium_some_chatter_very_high_speeds_heavier_riders unk_chatter_performance=Unknown
% @importance 0.68

0.64::acc(s74, chatter_performance).
0.60::acc(s95, chatter_performance).

0.85::true_val(chatter_performance, medium_some_high_speed); 0.15::true_val(chatter_performance, unk_chatter_performance).

measured(s74, chatter_performance, medium_some_high_speed).
measured(s95, chatter_performance, medium_some_high_speed).

all_consistent(chatter_performance) :-
    consistent(s74, chatter_performance),
    consistent(s95, chatter_performance).

evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, medium_some_high_speed)).
query(true_val(chatter_performance, unk_chatter_performance)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values good_twin_flex=Good_twin_flex_confident_switch_despite_directional unk_switch_riding=Unknown
% @importance 0.80

0.85::acc(s23, switch_riding).
0.72::acc(s32, switch_riding).

0.92::true_val(switch_riding, good_twin_flex); 0.08::true_val(switch_riding, unk_switch_riding).

measured(s23, switch_riding, good_twin_flex).
measured(s32, switch_riding, good_twin_flex).

all_consistent(switch_riding) :-
    (indep(s2), consistent(s2, switch_riding) ; \+indep(s2)),
    (indep(s32), consistent(s32, switch_riding) ; \+indep(s32)).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, good_twin_flex)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr buttering
% @type categorical
% @canonical false
% @original_name buttering
% @values possible_old_school_strength=Possible_but_requires_old_school_camber_strength unk_buttering=Unknown
% @importance 0.65

0.64::acc(s74, buttering).

0.85::true_val(buttering, possible_old_school_strength); 0.15::true_val(buttering, unk_buttering).

measured(s74, buttering, possible_old_school_strength).

all_consistent(buttering) :-
    consistent(s74, buttering).

evidence(all_consistent(buttering)).
query(true_val(buttering, possible_old_school_strength)).
query(true_val(buttering, unk_buttering)).

% @attr terrain_suitability_description
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values groomed_sidehits_natural_light_powder=Groomed_runs_side_hits_natural_features_light_powder unk_terrain_suitability_description=Unknown
% @importance 0.70

0.75::acc(s2, terrain_suitability_description).
0.55::acc(s10, terrain_suitability_description).

0.90::true_val(terrain_suitability_description, groomed_sidehits_natural_light_powder); 0.10::true_val(terrain_suitability_description, unk_terrain_suitability_description).

measured(s2, terrain_suitability_description, groomed_sidehits_natural_light_powder).
measured(s10, terrain_suitability_description, groomed_sidehits_natural_light_powder).

all_consistent(terrain_suitability_description) :-
    (indep(s2), consistent(s2, terrain_suitability_description) ; \+indep(s2)),
    (indep(s10), consistent(s10, terrain_suitability_description) ; \+indep(s10)).

evidence(all_consistent(terrain_suitability_description)).
query(true_val(terrain_suitability_description, groomed_sidehits_natural_light_powder)).
query(true_val(terrain_suitability_description, unk_terrain_suitability_description)).

% @attr negative_aspect_ice
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values deep_powder_hard_ice=Deep_powder_limited_float_very_hard_ice_limited_edge unk_negative_aspect_ice=Unknown
% @importance 0.88

0.60::acc(s43, negative_aspect_ice).
0.64::acc(s45, negative_aspect_ice).

0.88::true_val(negative_aspect_ice, deep_powder_hard_ice); 0.12::true_val(negative_aspect_ice, unk_negative_aspect_ice).

measured(s43, negative_aspect_ice, deep_powder_hard_ice).
measured(s45, negative_aspect_ice, deep_powder_hard_ice).

all_consistent(negative_aspect_ice) :-
    consistent(s43, negative_aspect_ice),
    consistent(s45, negative_aspect_ice).

evidence(all_consistent(negative_aspect_ice)).
query(true_val(negative_aspect_ice, deep_powder_hard_ice)).
query(true_val(negative_aspect_ice, unk_negative_aspect_ice)).

% @attr terrain_suitability_rider_profile
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values resort_int_adv_carve_jump_park=Primary_resort_board_int_to_adv_carve_jump_park unk_terrain_suitability_rider_profile=Unknown
% @importance 0.88

0.82::acc(s42, terrain_suitability_rider_profile).
0.62::acc(s53, terrain_suitability_rider_profile).

0.90::true_val(terrain_suitability_rider_profile, resort_int_adv_carve_jump_park); 0.10::true_val(terrain_suitability_rider_profile, unk_terrain_suitability_rider_profile).

measured(s42, terrain_suitability_rider_profile, resort_int_adv_carve_jump_park).
measured(s53, terrain_suitability_rider_profile, resort_int_adv_carve_jump_park).

all_consistent(terrain_suitability_rider_profile) :-
    consistent(s42, terrain_suitability_rider_profile),
    consistent(s53, terrain_suitability_rider_profile).

evidence(all_consistent(terrain_suitability_rider_profile)).
query(true_val(terrain_suitability_rider_profile, resort_int_adv_carve_jump_park)).
query(true_val(terrain_suitability_rider_profile, unk_terrain_suitability_rider_profile)).

% @attr recommended_binding_pairings
% @type categorical
% @canonical false
% @original_name recommended binding pairings
% @values cartel_genesis_atlas_strata=Cartel_EST_Genesis_EST_Union_Atlas_Union_Strata unk_recommended_binding_pairings=Unknown
% @importance 0.78

0.64::acc(s74, recommended_binding_pairings).
0.64::acc(s45, recommended_binding_pairings).

0.88::true_val(recommended_binding_pairings, cartel_genesis_atlas_strata); 0.12::true_val(recommended_binding_pairings, unk_recommended_binding_pairings).

measured(s74, recommended_binding_pairings, cartel_genesis_atlas_strata).
measured(s45, recommended_binding_pairings, cartel_genesis_atlas_strata).

all_consistent(recommended_binding_pairings) :-
    consistent(s74, recommended_binding_pairings),
    consistent(s45, recommended_binding_pairings).

evidence(all_consistent(recommended_binding_pairings)).
query(true_val(recommended_binding_pairings, cartel_genesis_atlas_strata)).
query(true_val(recommended_binding_pairings, unk_recommended_binding_pairings)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values jones_mountain_twin=Jones_Mountain_Twin_more_forgiving_hybrid_better_powder_ice unk_comparable_board_cross_brand=Unknown
% @importance 0.83

0.62::acc(s53, comparable_board_cross_brand).
0.36::acc(s54, comparable_board_cross_brand).

0.88::true_val(comparable_board_cross_brand, jones_mountain_twin); 0.12::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s53, comparable_board_cross_brand, jones_mountain_twin).
measured(s54, comparable_board_cross_brand, jones_mountain_twin).

all_consistent(comparable_board_cross_brand) :-
    consistent(s53, comparable_board_cross_brand),
    consistent(s54, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, jones_mountain_twin)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_doa
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values capita_doa=Capita_DOA_true_twin_park_focused_explosive_pop unk_comparable_board_cross_brand_doa=Unknown
% @importance 0.80

0.62::acc(s55, comparable_board_cross_brand_doa).
0.68::acc(s60, comparable_board_cross_brand_doa).

0.88::true_val(comparable_board_cross_brand_doa, capita_doa); 0.12::true_val(comparable_board_cross_brand_doa, unk_comparable_board_cross_brand_doa).

measured(s55, comparable_board_cross_brand_doa, capita_doa).
measured(s60, comparable_board_cross_brand_doa, capita_doa).

all_consistent(comparable_board_cross_brand_doa) :-
    consistent(s55, comparable_board_cross_brand_doa),
    consistent(s60, comparable_board_cross_brand_doa).

evidence(all_consistent(comparable_board_cross_brand_doa)).
query(true_val(comparable_board_cross_brand_doa, capita_doa)).
query(true_val(comparable_board_cross_brand_doa, unk_comparable_board_cross_brand_doa)).

% @attr comparable_board_cross_brand_mercury
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values capita_mercury=Capita_Mercury_directional_all_mountain_629_95 unk_comparable_board_cross_brand_mercury=Unknown
% @importance 0.85

0.63::acc(s56, comparable_board_cross_brand_mercury).

0.88::true_val(comparable_board_cross_brand_mercury, capita_mercury); 0.12::true_val(comparable_board_cross_brand_mercury, unk_comparable_board_cross_brand_mercury).

measured(s56, comparable_board_cross_brand_mercury, capita_mercury).

all_consistent(comparable_board_cross_brand_mercury) :-
    consistent(s56, comparable_board_cross_brand_mercury).

evidence(all_consistent(comparable_board_cross_brand_mercury)).
query(true_val(comparable_board_cross_brand_mercury, capita_mercury)).
query(true_val(comparable_board_cross_brand_mercury, unk_comparable_board_cross_brand_mercury)).

% @attr comparable_board_cross_brand_ns
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values ns_proto_type_3=Never_Summer_Proto_Type_3_Ultra_triple_camber_699_99 unk_comparable_board_cross_brand_ns=Unknown
% @importance 0.85

0.63::acc(s56, comparable_board_cross_brand_ns).

0.88::true_val(comparable_board_cross_brand_ns, ns_proto_type_3); 0.12::true_val(comparable_board_cross_brand_ns, unk_comparable_board_cross_brand_ns).

measured(s56, comparable_board_cross_brand_ns, ns_proto_type_3).

all_consistent(comparable_board_cross_brand_ns) :-
    consistent(s56, comparable_board_cross_brand_ns).

evidence(all_consistent(comparable_board_cross_brand_ns)).
query(true_val(comparable_board_cross_brand_ns, ns_proto_type_3)).
query(true_val(comparable_board_cross_brand_ns, unk_comparable_board_cross_brand_ns)).

% @attr comparable_board_cross_brand_yes
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values yes_standard=YES_Standard_rank_2_SnowboardingProfiles_2026 unk_comparable_board_cross_brand_yes=Unknown
% @importance 0.85

0.63::acc(s61, comparable_board_cross_brand_yes).

0.88::true_val(comparable_board_cross_brand_yes, yes_standard); 0.12::true_val(comparable_board_cross_brand_yes, unk_comparable_board_cross_brand_yes).

measured(s61, comparable_board_cross_brand_yes, yes_standard).

all_consistent(comparable_board_cross_brand_yes) :-
    consistent(s61, comparable_board_cross_brand_yes).

evidence(all_consistent(comparable_board_cross_brand_yes)).
query(true_val(comparable_board_cross_brand_yes, yes_standard)).
query(true_val(comparable_board_cross_brand_yes, unk_comparable_board_cross_brand_yes)).

% @attr comparable_board_cross_brand_gnu
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values gnu_forest_bailey=GNU_Forest_Bailey_4x4_rank_3_SnowboardingProfiles unk_comparable_board_cross_brand_gnu=Unknown
% @importance 0.85

0.63::acc(s61, comparable_board_cross_brand_gnu).

0.88::true_val(comparable_board_cross_brand_gnu, gnu_forest_bailey); 0.12::true_val(comparable_board_cross_brand_gnu, unk_comparable_board_cross_brand_gnu).

measured(s61, comparable_board_cross_brand_gnu, gnu_forest_bailey).

all_consistent(comparable_board_cross_brand_gnu) :-
    consistent(s61, comparable_board_cross_brand_gnu).

evidence(all_consistent(comparable_board_cross_brand_gnu)).
query(true_val(comparable_board_cross_brand_gnu, gnu_forest_bailey)).
query(true_val(comparable_board_cross_brand_gnu, unk_comparable_board_cross_brand_gnu)).

% @attr comparable_board_cross_brand_slash
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values slash_atv=Slash_ATV_rank_1_SnowboardingProfiles_2026 unk_comparable_board_cross_brand_slash=Unknown
% @importance 0.85

0.63::acc(s61, comparable_board_cross_brand_slash).

0.88::true_val(comparable_board_cross_brand_slash, slash_atv); 0.12::true_val(comparable_board_cross_brand_slash, unk_comparable_board_cross_brand_slash).

measured(s61, comparable_board_cross_brand_slash, slash_atv).

all_consistent(comparable_board_cross_brand_slash) :-
    consistent(s61, comparable_board_cross_brand_slash).

evidence(all_consistent(comparable_board_cross_brand_slash)).
query(true_val(comparable_board_cross_brand_slash, slash_atv)).
query(true_val(comparable_board_cross_brand_slash, unk_comparable_board_cross_brand_slash)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values custom_x=Burton_Custom_X_899_95_stiffer_carbon_expert unk_comparable_board_same_brand=Unknown
% @importance 0.75

0.72::acc(s96, comparable_board_same_brand).

0.90::true_val(comparable_board_same_brand, custom_x); 0.10::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s96, comparable_board_same_brand, custom_x).

all_consistent(comparable_board_same_brand) :-
    consistent(s96, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, custom_x)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_feelgood
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values burton_feelgood=Burton_Feelgood_same_core_tech_womens unk_comparable_board_same_brand_feelgood=Unknown
% @importance 0.90

0.82::acc(s42, comparable_board_same_brand_feelgood).

0.88::true_val(comparable_board_same_brand_feelgood, burton_feelgood); 0.12::true_val(comparable_board_same_brand_feelgood, unk_comparable_board_same_brand_feelgood).

measured(s42, comparable_board_same_brand_feelgood, burton_feelgood).

all_consistent(comparable_board_same_brand_feelgood) :-
    consistent(s42, comparable_board_same_brand_feelgood).

evidence(all_consistent(comparable_board_same_brand_feelgood)).
query(true_val(comparable_board_same_brand_feelgood, burton_feelgood)).
query(true_val(comparable_board_same_brand_feelgood, unk_comparable_board_same_brand_feelgood)).

% @attr comparable_board_same_brand_smalls
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values custom_smalls=Burton_Custom_Smalls_PurePop_Camber_youth unk_comparable_board_same_brand_smalls=Unknown
% @importance 0.65

0.55::acc(s92, comparable_board_same_brand_smalls).

0.80::true_val(comparable_board_same_brand_smalls, custom_smalls); 0.20::true_val(comparable_board_same_brand_smalls, unk_comparable_board_same_brand_smalls).

measured(s92, comparable_board_same_brand_smalls, custom_smalls).

all_consistent(comparable_board_same_brand_smalls) :-
    consistent(s92, comparable_board_same_brand_smalls).

evidence(all_consistent(comparable_board_same_brand_smalls)).
query(true_val(comparable_board_same_brand_smalls, custom_smalls)).
query(true_val(comparable_board_same_brand_smalls, unk_comparable_board_same_brand_smalls)).

% @attr sustainability_certification_fsc_core
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values fsc_100_core_wood=FSC_100pct_certified_core_wood unk_sustainability_certification_fsc_core=Unknown
% @importance 0.60

0.62::acc(s83, sustainability_certification_fsc_core).
0.67::acc(s84, sustainability_certification_fsc_core).

0.92::true_val(sustainability_certification_fsc_core, fsc_100_core_wood); 0.08::true_val(sustainability_certification_fsc_core, unk_sustainability_certification_fsc_core).

measured(s83, sustainability_certification_fsc_core, fsc_100_core_wood).
measured(s84, sustainability_certification_fsc_core, fsc_100_core_wood).

all_consistent(sustainability_certification_fsc_core) :-
    (indep(s83), consistent(s83, sustainability_certification_fsc_core) ; \+indep(s83)),
    (indep(s36), consistent(s36, sustainability_certification_fsc_core) ; \+indep(s36)).

evidence(all_consistent(sustainability_certification_fsc_core)).
query(true_val(sustainability_certification_fsc_core, fsc_100_core_wood)).
query(true_val(sustainability_certification_fsc_core, unk_sustainability_certification_fsc_core)).

% @attr sustainability_certification_supersap
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values super_sap_50pct_reduction=Super_Sap_Epoxy_50pct_less_carbon_vs_petroleum unk_sustainability_certification_supersap=Unknown
% @importance 0.75

0.68::acc(s79, sustainability_certification_supersap).
0.58::acc(s85, sustainability_certification_supersap).

0.90::true_val(sustainability_certification_supersap, super_sap_50pct_reduction); 0.10::true_val(sustainability_certification_supersap, unk_sustainability_certification_supersap).

measured(s79, sustainability_certification_supersap, super_sap_50pct_reduction).
measured(s85, sustainability_certification_supersap, super_sap_50pct_reduction).

all_consistent(sustainability_certification_supersap) :-
    (indep(s79), consistent(s79, sustainability_certification_supersap) ; \+indep(s79)),
    (indep(s85), consistent(s85, sustainability_certification_supersap) ; \+indep(s85)).

evidence(all_consistent(sustainability_certification_supersap)).
query(true_val(sustainability_certification_supersap, super_sap_50pct_reduction)).
query(true_val(sustainability_certification_supersap, unk_sustainability_certification_supersap)).

% @attr sustainability_certification_mission
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values fighting_future_people_planet_sport=Fighting_for_future_of_people_planet_sport unk_sustainability_certification_mission=Unknown
% @importance 0.40

0.52::acc(s5, sustainability_certification_mission).
0.58::acc(s14, sustainability_certification_mission).

0.82::true_val(sustainability_certification_mission, fighting_future_people_planet_sport); 0.18::true_val(sustainability_certification_mission, unk_sustainability_certification_mission).

measured(s5, sustainability_certification_mission, fighting_future_people_planet_sport).
measured(s14, sustainability_certification_mission, fighting_future_people_planet_sport).

all_consistent(sustainability_certification_mission) :-
    (indep(s5), consistent(s5, sustainability_certification_mission) ; \+indep(s5)),
    (indep(s14), consistent(s14, sustainability_certification_mission) ; \+indep(s14)).

evidence(all_consistent(sustainability_certification_mission)).
query(true_val(sustainability_certification_mission, fighting_future_people_planet_sport)).
query(true_val(sustainability_certification_mission, unk_sustainability_certification_mission)).

% @attr brand_privately_held
% @type categorical
% @canonical false
% @original_name brand privately held
% @values never_sold_pe=Burton_never_sold_to_PE_not_for_sale unk_brand_privately_held=Unknown
% @importance 0.50

0.72::acc(s51, brand_privately_held).

0.90::true_val(brand_privately_held, never_sold_pe); 0.10::true_val(brand_privately_held, unk_brand_privately_held).

measured(s51, brand_privately_held, never_sold_pe).

all_consistent(brand_privately_held) :-
    consistent(s51, brand_privately_held).

evidence(all_consistent(brand_privately_held)).
query(true_val(brand_privately_held, never_sold_pe)).
query(true_val(brand_privately_held, unk_brand_privately_held)).

% @attr topsheet_appearance_description_ink
% @type categorical
% @canonical false
% @original_name topsheet_appearance_description
% @values neon_glow_dark_ink=Neon_inspired_glow_in_the_dark_ink_design unk_topsheet_appearance_description_ink=Unknown
% @importance 0.60

0.80::acc(s3, topsheet_appearance_description_ink).
0.85::acc(s4, topsheet_appearance_description_ink).

0.95::true_val(topsheet_appearance_description_ink, neon_glow_dark_ink); 0.05::true_val(topsheet_appearance_description_ink, unk_topsheet_appearance_description_ink).

measured(s3, topsheet_appearance_description_ink, neon_glow_dark_ink).
measured(s4, topsheet_appearance_description_ink, neon_glow_dark_ink).

all_consistent(topsheet_appearance_description_ink) :-
    consistent(s4, topsheet_appearance_description_ink),
    (indep(s3), consistent(s3, topsheet_appearance_description_ink) ; \+indep(s3)).

evidence(all_consistent(topsheet_appearance_description_ink)).
query(true_val(topsheet_appearance_description_ink, neon_glow_dark_ink)).
query(true_val(topsheet_appearance_description_ink, unk_topsheet_appearance_description_ink)).

% @attr topsheet_appearance_description_channel
% @type categorical
% @canonical false
% @original_name topsheet_appearance_description
% @values channel_base_glow=Channel_and_base_lettering_light_up_in_dark unk_topsheet_appearance_description_channel=Unknown
% @importance 0.60

0.80::acc(s3, topsheet_appearance_description_channel).
0.85::acc(s4, topsheet_appearance_description_channel).

0.95::true_val(topsheet_appearance_description_channel, channel_base_glow); 0.05::true_val(topsheet_appearance_description_channel, unk_topsheet_appearance_description_channel).

measured(s3, topsheet_appearance_description_channel, channel_base_glow).
measured(s4, topsheet_appearance_description_channel, channel_base_glow).

all_consistent(topsheet_appearance_description_channel) :-
    consistent(s4, topsheet_appearance_description_channel),
    (indep(s3), consistent(s3, topsheet_appearance_description_channel) ; \+indep(s3)).

evidence(all_consistent(topsheet_appearance_description_channel)).
query(true_val(topsheet_appearance_description_channel, channel_base_glow)).
query(true_val(topsheet_appearance_description_channel, unk_topsheet_appearance_description_channel)).

% @attr available_colors_jungle
% @type categorical
% @canonical false
% @original_name available_colors
% @values jungle=Jungle_colorful_paradise_scene unk_available_colors_jungle=Unknown
% @importance 0.45

0.80::acc(s3, available_colors_jungle).
0.85::acc(s4, available_colors_jungle).

0.95::true_val(available_colors_jungle, jungle); 0.05::true_val(available_colors_jungle, unk_available_colors_jungle).

measured(s3, available_colors_jungle, jungle).
measured(s4, available_colors_jungle, jungle).

all_consistent(available_colors_jungle) :-
    consistent(s4, available_colors_jungle),
    (indep(s3), consistent(s3, available_colors_jungle) ; \+indep(s3)).

evidence(all_consistent(available_colors_jungle)).
query(true_val(available_colors_jungle, jungle)).
query(true_val(available_colors_jungle, unk_available_colors_jungle)).

% @attr available_colors_blank
% @type categorical
% @canonical false
% @original_name available_colors
% @values blank_bw=Blank_black_and_white_minimalist unk_available_colors_blank=Unknown
% @importance 0.40

0.85::acc(s18, available_colors_blank).

0.90::true_val(available_colors_blank, blank_bw); 0.10::true_val(available_colors_blank, unk_available_colors_blank).

measured(s18, available_colors_blank, blank_bw).

all_consistent(available_colors_blank) :-
    consistent(s18, available_colors_blank).

evidence(all_consistent(available_colors_blank)).
query(true_val(available_colors_blank, blank_bw)).
query(true_val(available_colors_blank, unk_available_colors_blank)).

% @attr graphic_designer_artist
% @type categorical
% @canonical false
% @original_name graphic_designer_artist
% @values casey_callahan=Casey_Callahan_Burton_Design_Lead unk_graphic_designer_artist=Unknown
% @importance 0.50

0.85::acc(s4, graphic_designer_artist).

0.90::true_val(graphic_designer_artist, casey_callahan); 0.10::true_val(graphic_designer_artist, unk_graphic_designer_artist).

measured(s4, graphic_designer_artist, casey_callahan).

all_consistent(graphic_designer_artist) :-
    consistent(s4, graphic_designer_artist).

evidence(all_consistent(graphic_designer_artist)).
query(true_val(graphic_designer_artist, casey_callahan)).
query(true_val(graphic_designer_artist, unk_graphic_designer_artist)).