0.12::indep(s_merchant).
0.12::indep(s2).
0.12::indep(s3).
0.12::indep(s5).
0.12::indep(s6).
0.20::indep(s4).
0.12::indep(s8).
0.15::indep(s9).
0.20::indep(s15).
0.18::indep(s16).
0.12::indep(s17).
0.12::indep(s29).
0.12::indep(s30).
0.12::indep(s31).
0.12::indep(s32).
0.15::indep(s33).
0.15::indep(s34).
0.12::indep(s36).
0.20::indep(s37).
0.15::indep(s39).
0.12::indep(s42).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

0.93::acc(s1, brand).
0.88::acc(s8, brand).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values burton=Burton unk_brand=Unknown
% @importance 1.0

0.97::true_val(brand, burton); 0.03::true_val(brand, unk_brand).

measured(s1, brand, burton).
measured(s8, brand, burton).

all_consistent(brand) :-
    consistent(s1, brand),
    (indep(s8), consistent(s8, brand) ; \+indep(s8)).

evidence(all_consistent(brand)).
query(true_val(brand, burton)).
query(true_val(brand, unk_brand)).

0.93::acc(s1, model_name).
0.88::acc(s8, model_name).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values counterbalance=Counterbalance unk_model_name=Unknown
% @importance 1.0

0.97::true_val(model_name, counterbalance); 0.03::true_val(model_name, unk_model_name).

measured(s1, model_name, counterbalance).
measured(s8, model_name, counterbalance).

all_consistent(model_name) :-
    consistent(s1, model_name),
    (indep(s8), consistent(s8, model_name) ; \+indep(s8)).

evidence(all_consistent(model_name)).
query(true_val(model_name, counterbalance)).
query(true_val(model_name, unk_model_name)).

0.85::acc(s2, model_year).
0.85::acc(s3, model_year).
0.85::acc(s5, model_year).
0.85::acc(s6, model_year).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2027=2027 unk_model_year=Unknown
% @importance 0.8

0.95::true_val(model_year, y2027); 0.05::true_val(model_year, unk_model_year).

measured(s2, model_year, y2027).
measured(s3, model_year, y2027).
measured(s5, model_year, y2027).
measured(s6, model_year, y2027).

all_consistent(model_year) :-
    (indep(s2), consistent(s2, model_year) ; \+indep(s2)),
    (indep(s3), consistent(s3, model_year) ; \+indep(s3)),
    (indep(s5), consistent(s5, model_year) ; \+indep(s5)),
    (indep(s6), consistent(s6, model_year) ; \+indep(s6)).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2027)).
query(true_val(model_year, unk_model_year)).

0.85::acc(s7, model_first_available_year).
0.85::acc(s10, model_first_available_year).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2025_26=2025-2026_season unk_model_first_available_year=Unknown
% @importance 0.8

0.92::true_val(model_first_available_year, season_2025_26); 0.08::true_val(model_first_available_year, unk_model_first_available_year).

measured(s7, model_first_available_year, season_2025_26).
measured(s10, model_first_available_year, season_2025_26).

all_consistent(model_first_available_year) :-
    consistent(s7, model_first_available_year),
    consistent(s10, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2025_26)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

0.80::acc(s31, manufacturer).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values burton_snowboards=Burton_Snowboards unk_manufacturer=Unknown
% @importance 0.4

0.90::true_val(manufacturer, burton_snowboards); 0.10::true_val(manufacturer, unk_manufacturer).

measured(s31, manufacturer, burton_snowboards).

all_consistent(manufacturer) :-
    (indep(s31), consistent(s31, manufacturer) ; \+indep(s31)).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, burton_snowboards)).
query(true_val(manufacturer, unk_manufacturer)).

0.78::acc(s26, manufacturer_reputation).

% @attr manufacturer_reputation
% @type categorical
% @canonical false
% @original_name manufacturer reputation
% @values purpose_led_heritage=Purpose_led_brand_40yr_heritage unk_manufacturer_reputation=Unknown
% @importance 0.4

0.85::true_val(manufacturer_reputation, purpose_led_heritage); 0.15::true_val(manufacturer_reputation, unk_manufacturer_reputation).

measured(s26, manufacturer_reputation, purpose_led_heritage).

all_consistent(manufacturer_reputation) :-
    (indep(s26), consistent(s26, manufacturer_reputation) ; \+indep(s26)).

evidence(all_consistent(manufacturer_reputation)).
query(true_val(manufacturer_reputation, purpose_led_heritage)).
query(true_val(manufacturer_reputation, unk_manufacturer_reputation)).

0.88::acc(s1, sustainability_certification).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values b_corp=Certified_B_Corp unk_sustainability_certification=Unknown
% @importance 1.0

0.90::true_val(sustainability_certification, b_corp); 0.10::true_val(sustainability_certification, unk_sustainability_certification).

measured(s1, sustainability_certification, b_corp).

all_consistent(sustainability_certification) :-
    consistent(s1, sustainability_certification).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, b_corp)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

0.93::acc(s1, product_type).
0.88::acc(s8, product_type).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.85

0.97::true_val(product_type, snowboard); 0.03::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).
measured(s8, product_type, snowboard).

all_consistent(product_type) :-
    consistent(s1, product_type),
    (indep(s8), consistent(s8, product_type) ; \+indep(s8)).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

0.95::acc(s_merchant, sku_merchant).

% @attr sku_merchant
% @type categorical
% @canonical false
% @original_name SKU (merchant)
% @values sku_3028810farrg146=3028810FARRG146 unk_sku_merchant=Unknown
% @importance 0.85

0.95::true_val(sku_merchant, sku_3028810farrg146); 0.05::true_val(sku_merchant, unk_sku_merchant).

measured(s_merchant, sku_merchant, sku_3028810farrg146).

all_consistent(sku_merchant) :-
    (indep(s_merchant), consistent(s_merchant, sku_merchant) ; \+indep(s_merchant)).

evidence(all_consistent(sku_merchant)).
query(true_val(sku_merchant, sku_3028810farrg146)).
query(true_val(sku_merchant, unk_sku_merchant)).

0.90::acc(s1, full_product_name_burton).

% @attr full_product_name_burton
% @type categorical
% @canonical false
% @original_name full product name on Burton.com
% @values counterbalance_camber=Burton_Counterbalance_Camber_Snowboard unk_full_product_name_burton=Unknown
% @importance 1.0

0.92::true_val(full_product_name_burton, counterbalance_camber); 0.08::true_val(full_product_name_burton, unk_full_product_name_burton).

measured(s1, full_product_name_burton, counterbalance_camber).

all_consistent(full_product_name_burton) :-
    consistent(s1, full_product_name_burton).

evidence(all_consistent(full_product_name_burton)).
query(true_val(full_product_name_burton, counterbalance_camber)).
query(true_val(full_product_name_burton, unk_full_product_name_burton)).

0.85::acc(s2, available_colors).
0.85::acc(s5, available_colors).

% @attr available_colors
% @type categorical
% @canonical true
% @original_name available_colors
% @values amoeba=Amoeba unk_available_colors=Unknown
% @importance 0.8

0.92::true_val(available_colors, amoeba); 0.08::true_val(available_colors, unk_available_colors).

measured(s2, available_colors, amoeba).
measured(s5, available_colors, amoeba).

all_consistent(available_colors) :-
    (indep(s2), consistent(s2, available_colors) ; \+indep(s2)),
    (indep(s5), consistent(s5, available_colors) ; \+indep(s5)).

evidence(all_consistent(available_colors)).
query(true_val(available_colors, amoeba)).
query(true_val(available_colors, unk_available_colors)).

0.85::acc(s3, available_colors_sun_glow).
0.85::acc(s6, available_colors_sun_glow).

% @attr available_colors_sun_glow
% @type categorical
% @canonical false
% @original_name available_colors
% @values sun_glow=Sun_Glow unk_available_colors_sun_glow=Unknown
% @importance 0.7

0.92::true_val(available_colors_sun_glow, sun_glow); 0.08::true_val(available_colors_sun_glow, unk_available_colors_sun_glow).

measured(s3, available_colors_sun_glow, sun_glow).
measured(s6, available_colors_sun_glow, sun_glow).

all_consistent(available_colors_sun_glow) :-
    (indep(s3), consistent(s3, available_colors_sun_glow) ; \+indep(s3)),
    (indep(s6), consistent(s6, available_colors_sun_glow) ; \+indep(s6)).

evidence(all_consistent(available_colors_sun_glow)).
query(true_val(available_colors_sun_glow, sun_glow)).
query(true_val(available_colors_sun_glow, unk_available_colors_sun_glow)).

0.87::acc(s7, available_colors_hallucinate).
0.78::acc(s33, available_colors_hallucinate).

% @attr available_colors_hallucinate
% @type categorical
% @canonical false
% @original_name available_colors
% @values hallucinate=Hallucinate unk_available_colors_hallucinate=Unknown
% @importance 0.8

0.92::true_val(available_colors_hallucinate, hallucinate); 0.08::true_val(available_colors_hallucinate, unk_available_colors_hallucinate).

measured(s7, available_colors_hallucinate, hallucinate).
measured(s33, available_colors_hallucinate, hallucinate).

all_consistent(available_colors_hallucinate) :-
    consistent(s7, available_colors_hallucinate),
    (indep(s33), consistent(s33, available_colors_hallucinate) ; \+indep(s33)).

evidence(all_consistent(available_colors_hallucinate)).
query(true_val(available_colors_hallucinate, hallucinate)).
query(true_val(available_colors_hallucinate, unk_available_colors_hallucinate)).

0.87::acc(s7, available_colors_deco).

% @attr available_colors_deco
% @type categorical
% @canonical false
% @original_name available_colors
% @values deco=Deco unk_available_colors_deco=Unknown
% @importance 0.8

0.88::true_val(available_colors_deco, deco); 0.12::true_val(available_colors_deco, unk_available_colors_deco).

measured(s7, available_colors_deco, deco).

all_consistent(available_colors_deco) :-
    consistent(s7, available_colors_deco).

evidence(all_consistent(available_colors_deco)).
query(true_val(available_colors_deco, deco)).
query(true_val(available_colors_deco, unk_available_colors_deco)).

0.82::acc(s32, graphic_designer_artist).

% @attr graphic_designer_artist
% @type categorical
% @canonical true
% @original_name graphic_designer_artist
% @values shawna_x=Shawna_X_abstract_microscope_view unk_graphic_designer_artist=Unknown
% @importance 0.3

0.85::true_val(graphic_designer_artist, shawna_x); 0.15::true_val(graphic_designer_artist, unk_graphic_designer_artist).

measured(s32, graphic_designer_artist, shawna_x).

all_consistent(graphic_designer_artist) :-
    (indep(s32), consistent(s32, graphic_designer_artist) ; \+indep(s32)).

evidence(all_consistent(graphic_designer_artist)).
query(true_val(graphic_designer_artist, shawna_x)).
query(true_val(graphic_designer_artist, unk_graphic_designer_artist)).

0.78::acc(s33, graphic_designer_artist_hallucinate).

% @attr graphic_designer_artist_hallucinate
% @type categorical
% @canonical false
% @original_name graphic_designer_artist
% @values dylan_sophie=Dylan_West_and_Sophie_Sellstrom unk_graphic_designer_artist_hallucinate=Unknown
% @importance 0.25

0.82::true_val(graphic_designer_artist_hallucinate, dylan_sophie); 0.18::true_val(graphic_designer_artist_hallucinate, unk_graphic_designer_artist_hallucinate).

measured(s33, graphic_designer_artist_hallucinate, dylan_sophie).

all_consistent(graphic_designer_artist_hallucinate) :-
    (indep(s33), consistent(s33, graphic_designer_artist_hallucinate) ; \+indep(s33)).

evidence(all_consistent(graphic_designer_artist_hallucinate)).
query(true_val(graphic_designer_artist_hallucinate, dylan_sophie)).
query(true_val(graphic_designer_artist_hallucinate, unk_graphic_designer_artist_hallucinate)).

0.90::acc(s_merchant, board_category).
0.82::acc(s15, board_category).
0.87::acc(s19, board_category).
0.80::acc(s11, board_category).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mtn_freeride=All_Mountain_Freeride all_mountain=All_Mountain mellow_freeride=Mellow_Freeride
% @importance 0.85

0.45::true_val(board_category, all_mtn_freeride); 0.35::true_val(board_category, all_mountain); 0.20::true_val(board_category, mellow_freeride).

measured(s_merchant, board_category, all_mtn_freeride).
measured(s15, board_category, all_mountain).
measured(s19, board_category, all_mtn_freeride).
measured(s11, board_category, mellow_freeride).

all_consistent(board_category) :-
    (indep(s_merchant), consistent(s_merchant, board_category) ; \+indep(s_merchant)),
    (indep(s15), consistent(s15, board_category) ; \+indep(s15)),
    consistent(s19, board_category),
    consistent(s11, board_category).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mtn_freeride)).
query(true_val(board_category, all_mountain)).
query(true_val(board_category, mellow_freeride)).

0.88::acc(s4, gender).
0.82::acc(s13, gender).
0.85::acc(s16, gender).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values unisex=Unisex unk_gender=Unknown
% @importance 0.7

0.95::true_val(gender, unisex); 0.05::true_val(gender, unk_gender).

measured(s4, gender, unisex).
measured(s13, gender, unisex).
measured(s16, gender, unisex).

all_consistent(gender) :-
    (indep(s4), consistent(s4, gender) ; \+indep(s4)),
    consistent(s13, gender),
    (indep(s16), consistent(s16, gender) ; \+indep(s16)).

evidence(all_consistent(gender)).
query(true_val(gender, unisex)).
query(true_val(gender, unk_gender)).

0.88::acc(s_merchant, rider_level).
0.85::acc(s15, rider_level).
0.87::acc(s10, rider_level).
0.82::acc(s11, rider_level).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate=Intermediate intermediate_advanced=Intermediate_Advanced intermediate_expert=Intermediate_Expert
% @importance 0.75

0.20::true_val(rider_level, intermediate); 0.35::true_val(rider_level, intermediate_advanced); 0.45::true_val(rider_level, intermediate_expert).

measured(s_merchant, rider_level, intermediate).
measured(s15, rider_level, intermediate_advanced).
measured(s10, rider_level, intermediate_expert).
measured(s11, rider_level, intermediate_expert).

all_consistent(rider_level) :-
    (indep(s_merchant), consistent(s_merchant, rider_level) ; \+indep(s_merchant)),
    (indep(s15), consistent(s15, rider_level) ; \+indep(s15)),
    consistent(s10, rider_level),
    consistent(s11, rider_level).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate)).
query(true_val(rider_level, intermediate_advanced)).
query(true_val(rider_level, intermediate_expert)).

0.88::acc(s10, skill_level_recommendation).
0.85::acc(s13, skill_level_recommendation).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values quiver_killer=One_board_quiver_daily_driver unk_skill_level_recommendation=Unknown
% @importance 0.9

0.92::true_val(skill_level_recommendation, quiver_killer); 0.08::true_val(skill_level_recommendation, unk_skill_level_recommendation).

measured(s10, skill_level_recommendation, quiver_killer).
measured(s13, skill_level_recommendation, quiver_killer).

all_consistent(skill_level_recommendation) :-
    consistent(s10, skill_level_recommendation),
    consistent(s13, skill_level_recommendation).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, quiver_killer)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

0.85::acc(s4, riding_style).
0.82::acc(s8, riding_style).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values groomers_powder_sidehits_park=Groomers_powder_side_hits_park unk_riding_style=Unknown
% @importance 0.7

0.92::true_val(riding_style, groomers_powder_sidehits_park); 0.08::true_val(riding_style, unk_riding_style).

measured(s4, riding_style, groomers_powder_sidehits_park).
measured(s8, riding_style, groomers_powder_sidehits_park).

all_consistent(riding_style) :-
    (indep(s4), consistent(s4, riding_style) ; \+indep(s4)),
    (indep(s8), consistent(s8, riding_style) ; \+indep(s8)).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, groomers_powder_sidehits_park)).
query(true_val(riding_style, unk_riding_style)).

0.90::acc(s22, predecessor_model_name).
0.88::acc(s10, predecessor_model_name).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values deep_thinker_story_board=Replaces_Deep_Thinker_and_Story_Board unk_predecessor_model_name=Unknown
% @importance 0.7

0.95::true_val(predecessor_model_name, deep_thinker_story_board); 0.05::true_val(predecessor_model_name, unk_predecessor_model_name).

measured(s22, predecessor_model_name, deep_thinker_story_board).
measured(s10, predecessor_model_name, deep_thinker_story_board).

all_consistent(predecessor_model_name) :-
    consistent(s22, predecessor_model_name),
    consistent(s10, predecessor_model_name).

evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, deep_thinker_story_board)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).

0.87::acc(s7, design_inspiration).
0.85::acc(s24, design_inspiration).

% @attr design_inspiration
% @type categorical
% @canonical false
% @original_name design inspiration
% @values mid90s_terje_custom=Mid_90s_Burton_shapes_Terje_Balance_Custom_DNA unk_design_inspiration=Unknown
% @importance 0.8

0.90::true_val(design_inspiration, mid90s_terje_custom); 0.10::true_val(design_inspiration, unk_design_inspiration).

measured(s7, design_inspiration, mid90s_terje_custom).
measured(s24, design_inspiration, mid90s_terje_custom).

all_consistent(design_inspiration) :-
    consistent(s7, design_inspiration),
    consistent(s24, design_inspiration).

evidence(all_consistent(design_inspiration)).
query(true_val(design_inspiration, mid90s_terje_custom)).
query(true_val(design_inspiration, unk_design_inspiration)).

0.92::acc(s_merchant, shape).
0.88::acc(s10, shape).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 0.85

0.96::true_val(shape, tapered_directional); 0.04::true_val(shape, unk_shape).

measured(s_merchant, shape, tapered_directional).
measured(s10, shape, tapered_directional).

all_consistent(shape) :-
    (indep(s_merchant), consistent(s_merchant, shape) ; \+indep(s_merchant)),
    consistent(s10, shape).

evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

0.92::acc(s2, taper).
0.90::acc(s8, taper).
0.85::acc(s16, taper).

% @attr taper
% @type numeric
% @unit mm
% @canonical true
% @original_name taper
% @values v8=8.0
% @importance 0.8

0.95::true_val(taper, v8); 0.05::true_val(taper, unk_taper).

measured(s2, taper, v8).
measured(s8, taper, v8).
measured(s16, taper, v8).

all_consistent(taper) :-
    (indep(s2), consistent(s2, taper) ; \+indep(s2)),
    (indep(s8), consistent(s8, taper) ; \+indep(s8)),
    (indep(s16), consistent(s16, taper) ; \+indep(s16)).

evidence(all_consistent(taper)).
query(true_val(taper, v8)).
query(true_val(taper, unk_taper)).

0.92::acc(s_merchant, camber_type).
0.88::acc(s15, camber_type).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values directional_camber=Directional_Camber unk_camber_type=Unknown
% @importance 0.85

0.96::true_val(camber_type, directional_camber); 0.04::true_val(camber_type, unk_camber_type).

measured(s_merchant, camber_type, directional_camber).
measured(s15, camber_type, directional_camber).

all_consistent(camber_type) :-
    (indep(s_merchant), consistent(s_merchant, camber_type) ; \+indep(s_merchant)),
    (indep(s15), consistent(s15, camber_type) ; \+indep(s15)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, directional_camber)).
query(true_val(camber_type, unk_camber_type)).

0.88::acc(s15, camber_description).
0.85::acc(s8, camber_description).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values camber_underfoot_rocker_nose=Camber_under_feet_rockered_nose unk_camber_description=Unknown
% @importance 0.85

0.93::true_val(camber_description, camber_underfoot_rocker_nose); 0.07::true_val(camber_description, unk_camber_description).

measured(s15, camber_description, camber_underfoot_rocker_nose).
measured(s8, camber_description, camber_underfoot_rocker_nose).

all_consistent(camber_description) :-
    (indep(s15), consistent(s15, camber_description) ; \+indep(s15)),
    (indep(s8), consistent(s8, camber_description) ; \+indep(s8)).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, camber_underfoot_rocker_nose)).
query(true_val(camber_description, unk_camber_description)).

0.92::acc(s11, camber_height_mm).

% @attr camber_height_mm
% @type numeric
% @unit mm
% @canonical true
% @original_name camber_height_mm
% @values v9=9.0 unk_camber_height_mm=Unknown
% @importance 0.9

0.88::true_val(camber_height_mm, v9); 0.12::true_val(camber_height_mm, unk_camber_height_mm).

measured(s11, camber_height_mm, v9).

all_consistent(camber_height_mm) :-
    consistent(s11, camber_height_mm).

evidence(all_consistent(camber_height_mm)).
query(true_val(camber_height_mm, v9)).
query(true_val(camber_height_mm, unk_camber_height_mm)).

0.93::acc(s_merchant, setback).

% @attr setback
% @type numeric
% @unit cm
% @canonical true
% @original_name setback
% @values v_neg2_5=neg2.5 unk_setback=Unknown
% @importance 0.85

0.95::true_val(setback, v_neg2_5); 0.05::true_val(setback, unk_setback).

measured(s_merchant, setback, v_neg2_5).

all_consistent(setback) :-
    (indep(s_merchant), consistent(s_merchant, setback) ; \+indep(s_merchant)).

evidence(all_consistent(setback)).
query(true_val(setback, v_neg2_5)).
query(true_val(setback, unk_setback)).

0.92::acc(s_merchant, flex_rating_10).
0.88::acc(s19, flex_rating_10).
0.78::acc(s20, flex_rating_10).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v6_5=6.5 v7=7.0 v6=6.0
% @importance 0.85

0.45::true_val(flex_rating_10, v6_5); 0.35::true_val(flex_rating_10, v7); 0.20::true_val(flex_rating_10, v6).

measured(s_merchant, flex_rating_10, v6_5).
measured(s19, flex_rating_10, v7).
measured(s20, flex_rating_10, v6).

all_consistent(flex_rating_10) :-
    (indep(s_merchant), consistent(s_merchant, flex_rating_10) ; \+indep(s_merchant)),
    consistent(s19, flex_rating_10),
    (indep(s20), consistent(s20, flex_rating_10) ; \+indep(s20)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v6_5)).
query(true_val(flex_rating_10, v7)).
query(true_val(flex_rating_10, v6)).

0.85::acc(s16, flex_feel).
0.88::acc(s11, flex_feel).
0.82::acc(s13, flex_feel).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values medium_aggressive=Medium_aggressive unk_flex_feel=Unknown
% @importance 0.8

0.93::true_val(flex_feel, medium_aggressive); 0.07::true_val(flex_feel, unk_flex_feel).

measured(s16, flex_feel, medium_aggressive).
measured(s11, flex_feel, medium_aggressive).
measured(s13, flex_feel, medium_aggressive).

all_consistent(flex_feel) :-
    (indep(s16), consistent(s16, flex_feel) ; \+indep(s16)),
    consistent(s11, flex_feel),
    consistent(s13, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium_aggressive)).
query(true_val(flex_feel, unk_flex_feel)).

0.92::acc(s_merchant, flex_direction).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values directional_flex=Directional_stiffer_nose_more_pop_tail unk_flex_direction=Unknown
% @importance 0.85

0.95::true_val(flex_direction, directional_flex); 0.05::true_val(flex_direction, unk_flex_direction).

measured(s_merchant, flex_direction, directional_flex).

all_consistent(flex_direction) :-
    (indep(s_merchant), consistent(s_merchant, flex_direction) ; \+indep(s_merchant)).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional_flex)).
query(true_val(flex_direction, unk_flex_direction)).

0.92::acc(s_merchant, terrain_suitability_park).

% @attr terrain_suitability_park
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability
% @values v6=6.0 unk_terrain_suitability_park=Unknown
% @importance 0.85

0.93::true_val(terrain_suitability_park, v6); 0.07::true_val(terrain_suitability_park, unk_terrain_suitability_park).

measured(s_merchant, terrain_suitability_park, v6).

all_consistent(terrain_suitability_park) :-
    (indep(s_merchant), consistent(s_merchant, terrain_suitability_park) ; \+indep(s_merchant)).

evidence(all_consistent(terrain_suitability_park)).
query(true_val(terrain_suitability_park, v6)).
query(true_val(terrain_suitability_park, unk_terrain_suitability_park)).

0.92::acc(s_merchant, terrain_suitability).

% @attr terrain_suitability
% @type numeric
% @unit /10
% @canonical true
% @original_name terrain_suitability
% @values v8=8.0 unk_terrain_suitability=Unknown
% @importance 0.85

0.93::true_val(terrain_suitability, v8); 0.07::true_val(terrain_suitability, unk_terrain_suitability).

measured(s_merchant, terrain_suitability, v8).

all_consistent(terrain_suitability) :-
    (indep(s_merchant), consistent(s_merchant, terrain_suitability) ; \+indep(s_merchant)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, v8)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

0.92::acc(s_merchant, terrain_suitability_powder).

% @attr terrain_suitability_powder
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability
% @values v7=7.0 unk_terrain_suitability_powder=Unknown
% @importance 0.85

0.93::true_val(terrain_suitability_powder, v7); 0.07::true_val(terrain_suitability_powder, unk_terrain_suitability_powder).

measured(s_merchant, terrain_suitability_powder, v7).

all_consistent(terrain_suitability_powder) :-
    (indep(s_merchant), consistent(s_merchant, terrain_suitability_powder) ; \+indep(s_merchant)).

evidence(all_consistent(terrain_suitability_powder)).
query(true_val(terrain_suitability_powder, v7)).
query(true_val(terrain_suitability_powder, unk_terrain_suitability_powder)).

0.92::acc(s11, overall_rating_snowboardingprofiles).

% @attr overall_rating_snowboardingprofiles
% @type numeric
% @unit /100
% @canonical true
% @original_name overall_rating_snowboardingprofiles
% @values v86_1=86.1 unk_overall_rating_snowboardingprofiles=Unknown
% @importance 0.9

0.90::true_val(overall_rating_snowboardingprofiles, v86_1); 0.10::true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles).

measured(s11, overall_rating_snowboardingprofiles, v86_1).

all_consistent(overall_rating_snowboardingprofiles) :-
    consistent(s11, overall_rating_snowboardingprofiles).

evidence(all_consistent(overall_rating_snowboardingprofiles)).
query(true_val(overall_rating_snowboardingprofiles, v86_1)).
query(true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles)).

0.92::acc(s11, powder_score_snowboardingprofiles).

% @attr powder_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical true
% @original_name powder_score_snowboardingprofiles
% @values v4=4.0 unk_powder_score_sp=Unknown
% @importance 0.9

0.90::true_val(powder_score_snowboardingprofiles, v4); 0.10::true_val(powder_score_snowboardingprofiles, unk_powder_score_sp).

measured(s11, powder_score_snowboardingprofiles, v4).

all_consistent(powder_score_snowboardingprofiles) :-
    consistent(s11, powder_score_snowboardingprofiles).

evidence(all_consistent(powder_score_snowboardingprofiles)).
query(true_val(powder_score_snowboardingprofiles, v4)).
query(true_val(powder_score_snowboardingprofiles, unk_powder_score_sp)).

0.92::acc(s11, carving_score_snowboardingprofiles).

% @attr carving_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical true
% @original_name carving_score_snowboardingprofiles
% @values v4=4.0 unk_carving_score_sp=Unknown
% @importance 0.9

0.90::true_val(carving_score_snowboardingprofiles, v4); 0.10::true_val(carving_score_snowboardingprofiles, unk_carving_score_sp).

measured(s11, carving_score_snowboardingprofiles, v4).

all_consistent(carving_score_snowboardingprofiles) :-
    consistent(s11, carving_score_snowboardingprofiles).

evidence(all_consistent(carving_score_snowboardingprofiles)).
query(true_val(carving_score_snowboardingprofiles, v4)).
query(true_val(carving_score_snowboardingprofiles, unk_carving_score_sp)).

0.92::acc(s11, turns_score_sp).

% @attr turns_score_sp
% @type numeric
% @unit /5
% @canonical false
% @original_name SnowboardingProfiles turns score
% @values v3_5=3.5 unk_turns_score_sp=Unknown
% @importance 0.9

0.90::true_val(turns_score_sp, v3_5); 0.10::true_val(turns_score_sp, unk_turns_score_sp).

measured(s11, turns_score_sp, v3_5).

all_consistent(turns_score_sp) :-
    consistent(s11, turns_score_sp).

evidence(all_consistent(turns_score_sp)).
query(true_val(turns_score_sp, v3_5)).
query(true_val(turns_score_sp, unk_turns_score_sp)).

0.92::acc(s11, trees_score_sp).

% @attr trees_score_sp
% @type numeric
% @unit /5
% @canonical false
% @original_name SnowboardingProfiles trees score
% @values v4=4.0 unk_trees_score_sp=Unknown
% @importance 0.9

0.90::true_val(trees_score_sp, v4); 0.10::true_val(trees_score_sp, unk_trees_score_sp).

measured(s11, trees_score_sp, v4).

all_consistent(trees_score_sp) :-
    consistent(s11, trees_score_sp).

evidence(all_consistent(trees_score_sp)).
query(true_val(trees_score_sp, v4)).
query(true_val(trees_score_sp, unk_trees_score_sp)).

0.92::acc(s11, crud_score_sp).

% @attr crud_score_sp
% @type numeric
% @unit /5
% @canonical false
% @original_name SnowboardingProfiles crud score
% @values v4=4.0 unk_crud_score_sp=Unknown
% @importance 0.9

0.90::true_val(crud_score_sp, v4); 0.10::true_val(crud_score_sp, unk_crud_score_sp).

measured(s11, crud_score_sp, v4).

all_consistent(crud_score_sp) :-
    consistent(s11, crud_score_sp).

evidence(all_consistent(crud_score_sp)).
query(true_val(crud_score_sp, v4)).
query(true_val(crud_score_sp, unk_crud_score_sp)).

0.92::acc(s11, speed_score_sp).

% @attr speed_score_sp
% @type numeric
% @unit /5
% @canonical false
% @original_name SnowboardingProfiles speed score
% @values v4=4.0 unk_speed_score_sp=Unknown
% @importance 0.9

0.90::true_val(speed_score_sp, v4); 0.10::true_val(speed_score_sp, unk_speed_score_sp).

measured(s11, speed_score_sp, v4).

all_consistent(speed_score_sp) :-
    consistent(s11, speed_score_sp).

evidence(all_consistent(speed_score_sp)).
query(true_val(speed_score_sp, v4)).
query(true_val(speed_score_sp, unk_speed_score_sp)).

0.92::acc(s11, jumps_score_sp).

% @attr jumps_score_sp
% @type numeric
% @unit /5
% @canonical false
% @original_name SnowboardingProfiles jumps score
% @values v4=4.0 unk_jumps_score_sp=Unknown
% @importance 0.9

0.90::true_val(jumps_score_sp, v4); 0.10::true_val(jumps_score_sp, unk_jumps_score_sp).

measured(s11, jumps_score_sp, v4).

all_consistent(jumps_score_sp) :-
    consistent(s11, jumps_score_sp).

evidence(all_consistent(jumps_score_sp)).
query(true_val(jumps_score_sp, v4)).
query(true_val(jumps_score_sp, unk_jumps_score_sp)).

0.92::acc(s11, switch_score_sp).

% @attr switch_score_sp
% @type numeric
% @unit /5
% @canonical false
% @original_name SnowboardingProfiles switch score
% @values v3=3.0 unk_switch_score_sp=Unknown
% @importance 0.9

0.90::true_val(switch_score_sp, v3); 0.10::true_val(switch_score_sp, unk_switch_score_sp).

measured(s11, switch_score_sp, v3).

all_consistent(switch_score_sp) :-
    consistent(s11, switch_score_sp).

evidence(all_consistent(switch_score_sp)).
query(true_val(switch_score_sp, v3)).
query(true_val(switch_score_sp, unk_switch_score_sp)).

0.88::acc(s10, powder_rating_tgr).

% @attr powder_rating_tgr
% @type categorical
% @canonical true
% @original_name powder_rating_tgr
% @values good=Good unk_powder_rating_tgr=Unknown
% @importance 0.9

0.90::true_val(powder_rating_tgr, good); 0.10::true_val(powder_rating_tgr, unk_powder_rating_tgr).

measured(s10, powder_rating_tgr, good).

all_consistent(powder_rating_tgr) :-
    consistent(s10, powder_rating_tgr).

evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, good)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

0.88::acc(s10, carving_rating_tgr).

% @attr carving_rating_tgr
% @type categorical
% @canonical true
% @original_name carving_rating_tgr
% @values great=Great unk_carving_rating_tgr=Unknown
% @importance 0.9

0.90::true_val(carving_rating_tgr, great); 0.10::true_val(carving_rating_tgr, unk_carving_rating_tgr).

measured(s10, carving_rating_tgr, great).

all_consistent(carving_rating_tgr) :-
    consistent(s10, carving_rating_tgr).

evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, great)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

0.88::acc(s10, speed_rating_tgr).

% @attr speed_rating_tgr
% @type categorical
% @canonical true
% @original_name speed_rating_tgr
% @values good=Good unk_speed_rating_tgr=Unknown
% @importance 0.9

0.90::true_val(speed_rating_tgr, good); 0.10::true_val(speed_rating_tgr, unk_speed_rating_tgr).

measured(s10, speed_rating_tgr, good).

all_consistent(speed_rating_tgr) :-
    consistent(s10, speed_rating_tgr).

evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, good)).
query(true_val(speed_rating_tgr, unk_speed_rating_tgr)).

0.88::acc(s10, jumps_rating_tgr).

% @attr jumps_rating_tgr
% @type categorical
% @canonical true
% @original_name jumps_rating_tgr
% @values great=Great unk_jumps_rating_tgr=Unknown
% @importance 0.9

0.90::true_val(jumps_rating_tgr, great); 0.10::true_val(jumps_rating_tgr, unk_jumps_rating_tgr).

measured(s10, jumps_rating_tgr, great).

all_consistent(jumps_rating_tgr) :-
    consistent(s10, jumps_rating_tgr).

evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, great)).
query(true_val(jumps_rating_tgr, unk_jumps_rating_tgr)).

0.88::acc(s10, jibbing_rating_tgr).

% @attr jibbing_rating_tgr
% @type categorical
% @canonical true
% @original_name jibbing_rating_tgr
% @values average=Average unk_jibbing_rating_tgr=Unknown
% @importance 0.9

0.90::true_val(jibbing_rating_tgr, average); 0.10::true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr).

measured(s10, jibbing_rating_tgr, average).

all_consistent(jibbing_rating_tgr) :-
    consistent(s10, jibbing_rating_tgr).

evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, average)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr)).

0.88::acc(s10, edge_hold).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values hard_snow_capable=Hard_Snow_capable unk_edge_hold=Unknown
% @importance 0.9

0.90::true_val(edge_hold, hard_snow_capable); 0.10::true_val(edge_hold, unk_edge_hold).

measured(s10, edge_hold, hard_snow_capable).

all_consistent(edge_hold) :-
    consistent(s10, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, hard_snow_capable)).
query(true_val(edge_hold, unk_edge_hold)).

0.88::acc(s10, on_snow_feel_tgr).

% @attr on_snow_feel_tgr
% @type categorical
% @canonical true
% @original_name on_snow_feel_tgr
% @values stable=Stable unk_on_snow_feel_tgr=Unknown
% @importance 0.9

0.90::true_val(on_snow_feel_tgr, stable); 0.10::true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr).

measured(s10, on_snow_feel_tgr, stable).

all_consistent(on_snow_feel_tgr) :-
    consistent(s10, on_snow_feel_tgr).

evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, stable)).
query(true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr)).

0.88::acc(s10, turn_initiation_performance).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values medium_fast=Medium_Fast unk_turn_initiation_performance=Unknown
% @importance 0.9

0.90::true_val(turn_initiation_performance, medium_fast); 0.10::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s10, turn_initiation_performance, medium_fast).

all_consistent(turn_initiation_performance) :-
    consistent(s10, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, medium_fast)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

0.92::acc(s_merchant, core_material).
0.88::acc(s8, core_material).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values super_fly_ii_700g=Super_Fly_II_700G_dual_species_wood unk_core_material=Unknown
% @importance 0.85

0.96::true_val(core_material, super_fly_ii_700g); 0.04::true_val(core_material, unk_core_material).

measured(s_merchant, core_material, super_fly_ii_700g).
measured(s8, core_material, super_fly_ii_700g).

all_consistent(core_material) :-
    (indep(s_merchant), consistent(s_merchant, core_material) ; \+indep(s_merchant)),
    (indep(s8), consistent(s8, core_material) ; \+indep(s8)).

evidence(all_consistent(core_material)).
query(true_val(core_material, super_fly_ii_700g)).
query(true_val(core_material, unk_core_material)).

0.92::acc(s_merchant, construction_material_innovation).
0.88::acc(s8, construction_material_innovation).
0.85::acc(s16, construction_material_innovation).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values dualzone_egd=Dualzone_EGD_wood_grain_edge_hold unk_construction_material_innovation=Unknown
% @importance 0.85

0.95::true_val(construction_material_innovation, dualzone_egd); 0.05::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s_merchant, construction_material_innovation, dualzone_egd).
measured(s8, construction_material_innovation, dualzone_egd).
measured(s16, construction_material_innovation, dualzone_egd).

all_consistent(construction_material_innovation) :-
    (indep(s_merchant), consistent(s_merchant, construction_material_innovation) ; \+indep(s_merchant)),
    (indep(s8), consistent(s8, construction_material_innovation) ; \+indep(s8)),
    (indep(s16), consistent(s16, construction_material_innovation) ; \+indep(s16)).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, dualzone_egd)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

0.92::acc(s_merchant, construction_squeezebox).
0.88::acc(s16, construction_squeezebox).

% @attr construction_squeezebox
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values squeezebox=Squeezebox_thicker_outside_thinner_underfoot unk_construction_squeezebox=Unknown
% @importance 0.85

0.95::true_val(construction_squeezebox, squeezebox); 0.05::true_val(construction_squeezebox, unk_construction_squeezebox).

measured(s_merchant, construction_squeezebox, squeezebox).
measured(s16, construction_squeezebox, squeezebox).

all_consistent(construction_squeezebox) :-
    (indep(s_merchant), consistent(s_merchant, construction_squeezebox) ; \+indep(s_merchant)),
    (indep(s16), consistent(s16, construction_squeezebox) ; \+indep(s16)).

evidence(all_consistent(construction_squeezebox)).
query(true_val(construction_squeezebox, squeezebox)).
query(true_val(construction_squeezebox, unk_construction_squeezebox)).

0.92::acc(s_merchant, laminate).
0.88::acc(s8, laminate).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values carbon_highlights_45=45deg_Carbon_Highlights_tip_to_tail unk_laminate=Unknown
% @importance 0.85

0.96::true_val(laminate, carbon_highlights_45); 0.04::true_val(laminate, unk_laminate).

measured(s_merchant, laminate, carbon_highlights_45).
measured(s8, laminate, carbon_highlights_45).

all_consistent(laminate) :-
    (indep(s_merchant), consistent(s_merchant, laminate) ; \+indep(s_merchant)),
    (indep(s8), consistent(s8, laminate) ; \+indep(s8)).

evidence(all_consistent(laminate)).
query(true_val(laminate, carbon_highlights_45)).
query(true_val(laminate, unk_laminate)).

0.92::acc(s_merchant, edge_technology).
0.88::acc(s8, edge_technology).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values frostbite_edges=Frostbite_Edges_enhanced_edge_hold unk_edge_technology=Unknown
% @importance 0.85

0.96::true_val(edge_technology, frostbite_edges); 0.04::true_val(edge_technology, unk_edge_technology).

measured(s_merchant, edge_technology, frostbite_edges).
measured(s8, edge_technology, frostbite_edges).

all_consistent(edge_technology) :-
    (indep(s_merchant), consistent(s_merchant, edge_technology) ; \+indep(s_merchant)),
    (indep(s8), consistent(s8, edge_technology) ; \+indep(s8)).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, frostbite_edges)).
query(true_val(edge_technology, unk_edge_technology)).

0.92::acc(s_merchant, base_material).
0.88::acc(s37, base_material).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_wfo=Sintered_WFO_high_density unk_base_material=Unknown
% @importance 0.85

0.96::true_val(base_material, sintered_wfo); 0.04::true_val(base_material, unk_base_material).

measured(s_merchant, base_material, sintered_wfo).
measured(s37, base_material, sintered_wfo).

all_consistent(base_material) :-
    (indep(s_merchant), consistent(s_merchant, base_material) ; \+indep(s_merchant)),
    (indep(s37), consistent(s37, base_material) ; \+indep(s37)).

evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_wfo)).
query(true_val(base_material, unk_base_material)).

0.87::acc(s19, base_type).
0.85::acc(s25, base_type).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values sintered=Sintered unk_base_type=Unknown
% @importance 0.7

0.93::true_val(base_type, sintered); 0.07::true_val(base_type, unk_base_type).

measured(s19, base_type, sintered).
measured(s25, base_type, sintered).

all_consistent(base_type) :-
    consistent(s19, base_type),
    consistent(s25, base_type).

evidence(all_consistent(base_type)).
query(true_val(base_type, sintered)).
query(true_val(base_type, unk_base_type)).

0.92::acc(s_merchant, resin).
0.88::acc(s37, resin).

% @attr resin
% @type categorical
% @canonical true
% @original_name resin
% @values super_sap_epoxy=Super_Sap_Epoxy_bio_based unk_resin=Unknown
% @importance 0.85

0.96::true_val(resin, super_sap_epoxy); 0.04::true_val(resin, unk_resin).

measured(s_merchant, resin, super_sap_epoxy).
measured(s37, resin, super_sap_epoxy).

all_consistent(resin) :-
    (indep(s_merchant), consistent(s_merchant, resin) ; \+indep(s_merchant)),
    (indep(s37), consistent(s37, resin) ; \+indep(s37)).

evidence(all_consistent(resin)).
query(true_val(resin, super_sap_epoxy)).
query(true_val(resin, unk_resin)).

0.90::acc(s_merchant, sustainability_resin).
0.88::acc(s17, sustainability_resin).

% @attr sustainability_resin
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values carbon_footprint_50pct_reduction=50pct_reduction_vs_petroleum_epoxy unk_sustainability_resin=Unknown
% @importance 0.85

0.94::true_val(sustainability_resin, carbon_footprint_50pct_reduction); 0.06::true_val(sustainability_resin, unk_sustainability_resin).

measured(s_merchant, sustainability_resin, carbon_footprint_50pct_reduction).
measured(s17, sustainability_resin, carbon_footprint_50pct_reduction).

all_consistent(sustainability_resin) :-
    (indep(s_merchant), consistent(s_merchant, sustainability_resin) ; \+indep(s_merchant)),
    (indep(s17), consistent(s17, sustainability_resin) ; \+indep(s17)).

evidence(all_consistent(sustainability_resin)).
query(true_val(sustainability_resin, carbon_footprint_50pct_reduction)).
query(true_val(sustainability_resin, unk_sustainability_resin)).

0.92::acc(s_merchant, mounting_pattern).
0.88::acc(s17, mounting_pattern).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values the_channel=The_Channel_two_parallel_slots unk_mounting_pattern=Unknown
% @importance 0.85

0.96::true_val(mounting_pattern, the_channel); 0.04::true_val(mounting_pattern, unk_mounting_pattern).

measured(s_merchant, mounting_pattern, the_channel).
measured(s17, mounting_pattern, the_channel).

all_consistent(mounting_pattern) :-
    (indep(s_merchant), consistent(s_merchant, mounting_pattern) ; \+indep(s_merchant)),
    (indep(s17), consistent(s17, mounting_pattern) ; \+indep(s17)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, the_channel)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

0.90::acc(s_merchant, binding_compatibility).
0.88::acc(s15, binding_compatibility).
0.82::acc(s39, binding_compatibility).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values all_major_best_est=All_major_brands_best_with_EST unk_binding_compatibility=Unknown
% @importance 0.85

0.95::true_val(binding_compatibility, all_major_best_est); 0.05::true_val(binding_compatibility, unk_binding_compatibility).

measured(s_merchant, binding_compatibility, all_major_best_est).
measured(s15, binding_compatibility, all_major_best_est).
measured(s39, binding_compatibility, all_major_best_est).

all_consistent(binding_compatibility) :-
    (indep(s_merchant), consistent(s_merchant, binding_compatibility) ; \+indep(s_merchant)),
    (indep(s15), consistent(s15, binding_compatibility) ; \+indep(s15)),
    (indep(s39), consistent(s39, binding_compatibility) ; \+indep(s39)).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, all_major_best_est)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

0.90::acc(s_merchant, construction_infinite_ride).
0.88::acc(s17, construction_infinite_ride).

% @attr construction_infinite_ride
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values infinite_ride=Infinite_Ride_factory_broken_in unk_construction_infinite_ride=Unknown
% @importance 0.85

0.94::true_val(construction_infinite_ride, infinite_ride); 0.06::true_val(construction_infinite_ride, unk_construction_infinite_ride).

measured(s_merchant, construction_infinite_ride, infinite_ride).
measured(s17, construction_infinite_ride, infinite_ride).

all_consistent(construction_infinite_ride) :-
    (indep(s_merchant), consistent(s_merchant, construction_infinite_ride) ; \+indep(s_merchant)),
    (indep(s17), consistent(s17, construction_infinite_ride) ; \+indep(s17)).

evidence(all_consistent(construction_infinite_ride)).
query(true_val(construction_infinite_ride, infinite_ride)).
query(true_val(construction_infinite_ride, unk_construction_infinite_ride)).

0.90::acc(s_merchant, construction_pro_tip).

% @attr construction_pro_tip
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values pro_tip=Pro_Tip_reduced_swing_weight unk_construction_pro_tip=Unknown
% @importance 0.85

0.93::true_val(construction_pro_tip, pro_tip); 0.07::true_val(construction_pro_tip, unk_construction_pro_tip).

measured(s_merchant, construction_pro_tip, pro_tip).

all_consistent(construction_pro_tip) :-
    (indep(s_merchant), consistent(s_merchant, construction_pro_tip) ; \+indep(s_merchant)).

evidence(all_consistent(construction_pro_tip)).
query(true_val(construction_pro_tip, pro_tip)).
query(true_val(construction_pro_tip, unk_construction_pro_tip)).

0.88::acc(s17, factory_tuning).

% @attr factory_tuning
% @type categorical
% @canonical false
% @original_name factory tuning
% @values waxed_ready=Waxed_and_ready unk_factory_tuning=Unknown
% @importance 0.65

0.88::true_val(factory_tuning, waxed_ready); 0.12::true_val(factory_tuning, unk_factory_tuning).

measured(s17, factory_tuning, waxed_ready).

all_consistent(factory_tuning) :-
    (indep(s17), consistent(s17, factory_tuning) ; \+indep(s17)).

evidence(all_consistent(factory_tuning)).
query(true_val(factory_tuning, waxed_ready)).
query(true_val(factory_tuning, unk_factory_tuning)).

0.93::acc(s_merchant, available_sizes).
0.82::acc(s13, available_sizes).
0.80::acc(s34, available_sizes).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values sizes_no_154w=142_146_150_154_158_158W_162_162W sizes_with_154w=142_146_150_154_154W_158_158W_162_162W
% @importance 0.8

0.45::true_val(available_sizes, sizes_no_154w); 0.55::true_val(available_sizes, sizes_with_154w).

measured(s_merchant, available_sizes, sizes_no_154w).
measured(s13, available_sizes, sizes_with_154w).
measured(s34, available_sizes, sizes_with_154w).

all_consistent(available_sizes) :-
    (indep(s_merchant), consistent(s_merchant, available_sizes) ; \+indep(s_merchant)),
    consistent(s13, available_sizes),
    (indep(s34), consistent(s34, available_sizes) ; \+indep(s34)).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, sizes_no_154w)).
query(true_val(available_sizes, sizes_with_154w)).

0.93::acc(s_merchant, width_options).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 0.85

0.95::true_val(width_options, standard_wide); 0.05::true_val(width_options, unk_width_options).

measured(s_merchant, width_options, standard_wide).

all_consistent(width_options) :-
    (indep(s_merchant), consistent(s_merchant, width_options) ; \+indep(s_merchant)).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_wide)).
query(true_val(width_options, unk_width_options)).

0.93::acc(s_merchant, effective_edge_146).

% @attr effective_edge_146
% @type numeric
% @unit cm
% @canonical false
% @original_name effective edge 146cm
% @values v110_6=110.6 unk_effective_edge_146=Unknown
% @importance 0.85

0.95::true_val(effective_edge_146, v110_6); 0.05::true_val(effective_edge_146, unk_effective_edge_146).

measured(s_merchant, effective_edge_146, v110_6).

all_consistent(effective_edge_146) :-
    (indep(s_merchant), consistent(s_merchant, effective_edge_146) ; \+indep(s_merchant)).

evidence(all_consistent(effective_edge_146)).
query(true_val(effective_edge_146, v110_6)).
query(true_val(effective_edge_146, unk_effective_edge_146)).

0.93::acc(s_merchant, sidecut_radius_size_146).

% @attr sidecut_radius_size_146
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v6_9=6.9 unk_sidecut_radius_size_146=Unknown
% @importance 0.85

0.95::true_val(sidecut_radius_size_146, v6_9); 0.05::true_val(sidecut_radius_size_146, unk_sidecut_radius_size_146).

measured(s_merchant, sidecut_radius_size_146, v6_9).

all_consistent(sidecut_radius_size_146) :-
    (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_146) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_radius_size_146)).
query(true_val(sidecut_radius_size_146, v6_9)).
query(true_val(sidecut_radius_size_146, unk_sidecut_radius_size_146)).

0.93::acc(s_merchant, tip_width_146).

% @attr tip_width_146
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size
% @values v284_5=284.5 unk_tip_width_146=Unknown
% @importance 0.85

0.95::true_val(tip_width_146, v284_5); 0.05::true_val(tip_width_146, unk_tip_width_146).

measured(s_merchant, tip_width_146, v284_5).

all_consistent(tip_width_146) :-
    (indep(s_merchant), consistent(s_merchant, tip_width_146) ; \+indep(s_merchant)).

evidence(all_consistent(tip_width_146)).
query(true_val(tip_width_146, v284_5)).
query(true_val(tip_width_146, unk_tip_width_146)).

0.93::acc(s_merchant, tail_width_146).

% @attr tail_width_146
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size
% @values v276_5=276.5 unk_tail_width_146=Unknown
% @importance 0.85

0.95::true_val(tail_width_146, v276_5); 0.05::true_val(tail_width_146, unk_tail_width_146).

measured(s_merchant, tail_width_146, v276_5).

all_consistent(tail_width_146) :-
    (indep(s_merchant), consistent(s_merchant, tail_width_146) ; \+indep(s_merchant)).

evidence(all_consistent(tail_width_146)).
query(true_val(tail_width_146, v276_5)).
query(true_val(tail_width_146, unk_tail_width_146)).

0.93::acc(s_merchant, waist_width_146).

% @attr waist_width_146
% @type numeric
% @unit mm
% @canonical false
% @original_name waist width 146cm
% @values v240_0=240.0 unk_waist_width_146=Unknown
% @importance 0.85

0.95::true_val(waist_width_146, v240_0); 0.05::true_val(waist_width_146, unk_waist_width_146).

measured(s_merchant, waist_width_146, v240_0).

all_consistent(waist_width_146) :-
    (indep(s_merchant), consistent(s_merchant, waist_width_146) ; \+indep(s_merchant)).

evidence(all_consistent(waist_width_146)).
query(true_val(waist_width_146, v240_0)).
query(true_val(waist_width_146, unk_waist_width_146)).

0.93::acc(s_merchant, stance_width_range_size).

% @attr stance_width_range_size
% @type numeric
% @unit cm
% @canonical true
% @original_name stance_width_range_size
% @values v50_5=50.5 unk_stance_width_range_size=Unknown
% @importance 0.85

0.95::true_val(stance_width_range_size, v50_5); 0.05::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s_merchant, stance_width_range_size, v50_5).

all_consistent(stance_width_range_size) :-
    (indep(s_merchant), consistent(s_merchant, stance_width_range_size) ; \+indep(s_merchant)).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v50_5)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

0.93::acc(s_merchant, recommended_weight_range_size_146).

% @attr recommended_weight_range_size_146
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values w45_68kg=45-68kg unk_recommended_weight_range_size_146=Unknown
% @importance 0.85

0.95::true_val(recommended_weight_range_size_146, w45_68kg); 0.05::true_val(recommended_weight_range_size_146, unk_recommended_weight_range_size_146).

measured(s_merchant, recommended_weight_range_size_146, w45_68kg).

all_consistent(recommended_weight_range_size_146) :-
    (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size_146) ; \+indep(s_merchant)).

evidence(all_consistent(recommended_weight_range_size_146)).
query(true_val(recommended_weight_range_size_146, w45_68kg)).
query(true_val(recommended_weight_range_size_146, unk_recommended_weight_range_size_146)).

0.93::acc(s_merchant, effective_edge_158).

% @attr effective_edge_158
% @type numeric
% @unit cm
% @canonical false
% @original_name effective edge 158cm
% @values v120_0=120.0 unk_effective_edge_158=Unknown
% @importance 0.85

0.95::true_val(effective_edge_158, v120_0); 0.05::true_val(effective_edge_158, unk_effective_edge_158).

measured(s_merchant, effective_edge_158, v120_0).

all_consistent(effective_edge_158) :-
    (indep(s_merchant), consistent(s_merchant, effective_edge_158) ; \+indep(s_merchant)).

evidence(all_consistent(effective_edge_158)).
query(true_val(effective_edge_158, v120_0)).
query(true_val(effective_edge_158, unk_effective_edge_158)).

0.93::acc(s_merchant, sidecut_radius_size_158).

% @attr sidecut_radius_size_158
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v7_5=7.5 unk_sidecut_radius_size_158=Unknown
% @importance 0.85

0.95::true_val(sidecut_radius_size_158, v7_5); 0.05::true_val(sidecut_radius_size_158, unk_sidecut_radius_size_158).

measured(s_merchant, sidecut_radius_size_158, v7_5).

all_consistent(sidecut_radius_size_158) :-
    (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_158) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_radius_size_158)).
query(true_val(sidecut_radius_size_158, v7_5)).
query(true_val(sidecut_radius_size_158, unk_sidecut_radius_size_158)).

0.93::acc(s_merchant, tip_tail_width_size).

% @attr tip_tail_width_size
% @type numeric
% @unit mm
% @canonical true
% @original_name tip_tail_width_size
% @values v301_0=301.0 unk_tip_tail_width_size=Unknown
% @importance 0.85

0.95::true_val(tip_tail_width_size, v301_0); 0.05::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s_merchant, tip_tail_width_size, v301_0).

all_consistent(tip_tail_width_size) :-
    (indep(s_merchant), consistent(s_merchant, tip_tail_width_size) ; \+indep(s_merchant)).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v301_0)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

0.60::acc(s_merchant, tail_width_158).

% @attr tail_width_158
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size
% @values v393_0=393.0 unk_tail_width_158=Unknown
% @importance 0.85

0.55::true_val(tail_width_158, v393_0); 0.45::true_val(tail_width_158, unk_tail_width_158).

measured(s_merchant, tail_width_158, v393_0).

all_consistent(tail_width_158) :-
    (indep(s_merchant), consistent(s_merchant, tail_width_158) ; \+indep(s_merchant)).

evidence(all_consistent(tail_width_158)).
query(true_val(tail_width_158, v393_0)).
query(true_val(tail_width_158, unk_tail_width_158)).

0.93::acc(s_merchant, waist_width_158).

% @attr waist_width_158
% @type numeric
% @unit mm
% @canonical false
% @original_name waist width 158cm
% @values v253_0=253.0 unk_waist_width_158=Unknown
% @importance 0.85

0.95::true_val(waist_width_158, v253_0); 0.05::true_val(waist_width_158, unk_waist_width_158).

measured(s_merchant, waist_width_158, v253_0).

all_consistent(waist_width_158) :-
    (indep(s_merchant), consistent(s_merchant, waist_width_158) ; \+indep(s_merchant)).

evidence(all_consistent(waist_width_158)).
query(true_val(waist_width_158, v253_0)).
query(true_val(waist_width_158, unk_waist_width_158)).

0.93::acc(s_merchant, recommended_weight_range_size_158).

% @attr recommended_weight_range_size_158
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values w68_91kg=68-91kg unk_recommended_weight_range_size_158=Unknown
% @importance 0.85

0.95::true_val(recommended_weight_range_size_158, w68_91kg); 0.05::true_val(recommended_weight_range_size_158, unk_recommended_weight_range_size_158).

measured(s_merchant, recommended_weight_range_size_158, w68_91kg).

all_consistent(recommended_weight_range_size_158) :-
    (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size_158) ; \+indep(s_merchant)).

evidence(all_consistent(recommended_weight_range_size_158)).
query(true_val(recommended_weight_range_size_158, w68_91kg)).
query(true_val(recommended_weight_range_size_158, unk_recommended_weight_range_size_158)).

0.94::acc(s11, board_weight_grams).

% @attr board_weight_grams
% @type numeric
% @unit g
% @canonical true
% @original_name board_weight_grams
% @values v2680=2680.0 unk_board_weight_grams=Unknown
% @importance 0.9

0.90::true_val(board_weight_grams, v2680); 0.10::true_val(board_weight_grams, unk_board_weight_grams).

measured(s11, board_weight_grams, v2680).

all_consistent(board_weight_grams) :-
    consistent(s11, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v2680)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

0.94::acc(s11, weight_per_cm).

% @attr weight_per_cm
% @type numeric
% @unit g/cm
% @canonical true
% @original_name weight_per_cm
% @values v16_96=16.96 unk_weight_per_cm=Unknown
% @importance 0.9

0.90::true_val(weight_per_cm, v16_96); 0.10::true_val(weight_per_cm, unk_weight_per_cm).

measured(s11, weight_per_cm, v16_96).

all_consistent(weight_per_cm) :-
    consistent(s11, weight_per_cm).

evidence(all_consistent(weight_per_cm)).
query(true_val(weight_per_cm, v16_96)).
query(true_val(weight_per_cm, unk_weight_per_cm)).

0.88::acc(s11, reviewer_opinion_snowboardingprofiles).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name reviewer_opinion_snowboardingprofiles
% @values felt_lighter=Felt_lighter_than_normal unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.9

0.88::true_val(reviewer_opinion_snowboardingprofiles, felt_lighter); 0.12::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).

measured(s11, reviewer_opinion_snowboardingprofiles, felt_lighter).

all_consistent(reviewer_opinion_snowboardingprofiles) :-
    consistent(s11, reviewer_opinion_snowboardingprofiles).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, felt_lighter)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

0.85::acc(s10, reviewer_opinion_the_good_ride).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values feels_normal_lighter_side=Feels_Normal_lighter_side_of_heavy unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.9

0.87::true_val(reviewer_opinion_the_good_ride, feels_normal_lighter_side); 0.13::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s10, reviewer_opinion_the_good_ride, feels_normal_lighter_side).

all_consistent(reviewer_opinion_the_good_ride) :-
    consistent(s10, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, feels_normal_lighter_side)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

0.82::acc(s16, subjective_weight_feel_peter_glenn).

% @attr subjective_weight_feel_peter_glenn
% @type categorical
% @canonical false
% @original_name subjective weight feel (Peter Glenn)
% @values poppy_lightweight=Poppy_strong_very_lightweight unk_subjective_weight_feel_peter_glenn=Unknown
% @importance 0.7

0.82::true_val(subjective_weight_feel_peter_glenn, poppy_lightweight); 0.18::true_val(subjective_weight_feel_peter_glenn, unk_subjective_weight_feel_peter_glenn).

measured(s16, subjective_weight_feel_peter_glenn, poppy_lightweight).

all_consistent(subjective_weight_feel_peter_glenn) :-
    (indep(s16), consistent(s16, subjective_weight_feel_peter_glenn) ; \+indep(s16)).

evidence(all_consistent(subjective_weight_feel_peter_glenn)).
query(true_val(subjective_weight_feel_peter_glenn, poppy_lightweight)).
query(true_val(subjective_weight_feel_peter_glenn, unk_subjective_weight_feel_peter_glenn)).

0.93::acc(s25, warranty_period_years).
0.88::acc(s17, warranty_period_years).

% @attr warranty_period_years
% @type numeric
% @unit years
% @canonical false
% @original_name warranty_period_years
% @values v3=3.0 unk_warranty_period_years=Unknown
% @importance 0.8

0.97::true_val(warranty_period_years, v3); 0.03::true_val(warranty_period_years, unk_warranty_period_years).

measured(s25, warranty_period_years, v3).
measured(s17, warranty_period_years, v3).

all_consistent(warranty_period_years) :-
    consistent(s25, warranty_period_years),
    (indep(s17), consistent(s17, warranty_period_years) ; \+indep(s17)).

evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v3)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

0.93::acc(s35, warranty).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values w48_2day=W48_claim_processed_2_business_days unk_warranty=Unknown
% @importance 0.7

0.92::true_val(warranty, w48_2day); 0.08::true_val(warranty, unk_warranty).

measured(s35, warranty, w48_2day).

all_consistent(warranty) :-
    consistent(s35, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, w48_2day)).
query(true_val(warranty, unk_warranty)).

0.93::acc(s25, warranty_exclusions).

% @attr warranty_exclusions
% @type categorical
% @canonical false
% @original_name warranty
% @values misuse_abuse_neglect_normal_wear=Misuse_abuse_neglect_rock_damage_normal_wear unk_warranty_exclusions=Unknown
% @importance 0.8

0.93::true_val(warranty_exclusions, misuse_abuse_neglect_normal_wear); 0.07::true_val(warranty_exclusions, unk_warranty_exclusions).

measured(s25, warranty_exclusions, misuse_abuse_neglect_normal_wear).

all_consistent(warranty_exclusions) :-
    consistent(s25, warranty_exclusions).

evidence(all_consistent(warranty_exclusions)).
query(true_val(warranty_exclusions, misuse_abuse_neglect_normal_wear)).
query(true_val(warranty_exclusions, unk_warranty_exclusions)).

0.93::acc(s25, warranty_conditions).

% @attr warranty_conditions
% @type categorical
% @canonical false
% @original_name warranty
% @values original_owner_authorized_dealer=Original_owner_proof_of_purchase_authorized_dealer unk_warranty_conditions=Unknown
% @importance 0.8

0.93::true_val(warranty_conditions, original_owner_authorized_dealer); 0.07::true_val(warranty_conditions, unk_warranty_conditions).

measured(s25, warranty_conditions, original_owner_authorized_dealer).

all_consistent(warranty_conditions) :-
    consistent(s25, warranty_conditions).

evidence(all_consistent(warranty_conditions)).
query(true_val(warranty_conditions, original_owner_authorized_dealer)).
query(true_val(warranty_conditions, unk_warranty_conditions)).

0.95::acc(s_merchant, price_aud_merchant).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v949_99=949.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.97::true_val(price_aud_merchant, v949_99); 0.03::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s_merchant, price_aud_merchant, v949_99).

all_consistent(price_aud_merchant) :-
    (indep(s_merchant), consistent(s_merchant, price_aud_merchant) ; \+indep(s_merchant)).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v949_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

0.90::acc(s10, price_usd_msrp).
0.88::acc(s19, price_usd_msrp).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v659=659.0 unk_price_usd_msrp=Unknown
% @importance 0.85

0.95::true_val(price_usd_msrp, v659); 0.05::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s10, price_usd_msrp, v659).
measured(s19, price_usd_msrp, v659).

all_consistent(price_usd_msrp) :-
    consistent(s10, price_usd_msrp),
    consistent(s19, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v659)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

0.90::acc(s10, price_usd_evo).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_evo
% @values v419_99=419.99 unk_price_usd_evo=Unknown
% @importance 0.9

0.92::true_val(price_usd_evo, v419_99); 0.08::true_val(price_usd_evo, unk_price_usd_evo).

measured(s10, price_usd_evo, v419_99).

all_consistent(price_usd_evo) :-
    consistent(s10, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v419_99)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

0.90::acc(s10, price_usd_backcountry).

% @attr price_usd_backcountry
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_backcountry
% @values v395_97=395.97 unk_price_usd_backcountry=Unknown
% @importance 0.9

0.92::true_val(price_usd_backcountry, v395_97); 0.08::true_val(price_usd_backcountry, unk_price_usd_backcountry).

measured(s10, price_usd_backcountry, v395_97).

all_consistent(price_usd_backcountry) :-
    consistent(s10, price_usd_backcountry).

evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v395_97)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

0.90::acc(s10, price_usd_tactics).

% @attr price_usd_tactics
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_tactics
% @values v461_95=461.95 unk_price_usd_tactics=Unknown
% @importance 0.9

0.92::true_val(price_usd_tactics, v461_95); 0.08::true_val(price_usd_tactics, unk_price_usd_tactics).

measured(s10, price_usd_tactics, v461_95).

all_consistent(price_usd_tactics) :-
    consistent(s10, price_usd_tactics).

evidence(all_consistent(price_usd_tactics)).
query(true_val(price_usd_tactics, v461_95)).
query(true_val(price_usd_tactics, unk_price_usd_tactics)).

0.88::acc(s10, price_usd_sun_ski).

% @attr price_usd_sun_ski
% @type numeric
% @unit USD
% @canonical false
% @original_name price USD (Sun & Ski Sports)
% @values v527_93=527.93 unk_price_usd_sun_ski=Unknown
% @importance 0.9

0.90::true_val(price_usd_sun_ski, v527_93); 0.10::true_val(price_usd_sun_ski, unk_price_usd_sun_ski).

measured(s10, price_usd_sun_ski, v527_93).

all_consistent(price_usd_sun_ski) :-
    consistent(s10, price_usd_sun_ski).

evidence(all_consistent(price_usd_sun_ski)).
query(true_val(price_usd_sun_ski, v527_93)).
query(true_val(price_usd_sun_ski, unk_price_usd_sun_ski)).

0.88::acc(s10, price_usd_blauer_board).

% @attr price_usd_blauer_board
% @type numeric
% @unit USD
% @canonical false
% @original_name price USD (Blauer Board Shop)
% @values v659_00=659.0 unk_price_usd_blauer_board=Unknown
% @importance 0.9

0.90::true_val(price_usd_blauer_board, v659_00); 0.10::true_val(price_usd_blauer_board, unk_price_usd_blauer_board).

measured(s10, price_usd_blauer_board, v659_00).

all_consistent(price_usd_blauer_board) :-
    consistent(s10, price_usd_blauer_board).

evidence(all_consistent(price_usd_blauer_board)).
query(true_val(price_usd_blauer_board, v659_00)).
query(true_val(price_usd_blauer_board, unk_price_usd_blauer_board)).

0.85::acc(s34, price_usd_darkside).

% @attr price_usd_darkside
% @type numeric
% @unit USD
% @canonical false
% @original_name price USD (Darkside Snowboards)
% @values v659_95=659.95 unk_price_usd_darkside=Unknown
% @importance 0.7

0.88::true_val(price_usd_darkside, v659_95); 0.12::true_val(price_usd_darkside, unk_price_usd_darkside).

measured(s34, price_usd_darkside, v659_95).

all_consistent(price_usd_darkside) :-
    (indep(s34), consistent(s34, price_usd_darkside) ; \+indep(s34)).

evidence(all_consistent(price_usd_darkside)).
query(true_val(price_usd_darkside, v659_95)).
query(true_val(price_usd_darkside, unk_price_usd_darkside)).

0.88::acc(s19, price_gbp_blue_tomato_uk).

% @attr price_gbp_blue_tomato_uk
% @type numeric
% @unit GBP
% @canonical true
% @original_name price_gbp_blue_tomato_uk
% @values v610=610.0 unk_price_gbp_blue_tomato_uk=Unknown
% @importance 0.85

0.90::true_val(price_gbp_blue_tomato_uk, v610); 0.10::true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk).

measured(s19, price_gbp_blue_tomato_uk, v610).

all_consistent(price_gbp_blue_tomato_uk) :-
    consistent(s19, price_gbp_blue_tomato_uk).

evidence(all_consistent(price_gbp_blue_tomato_uk)).
query(true_val(price_gbp_blue_tomato_uk, v610)).
query(true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk)).

0.88::acc(s10, price_eur_blue_tomato).

% @attr price_eur_blue_tomato
% @type numeric
% @unit EUR
% @canonical true
% @original_name price_eur_blue_tomato
% @values v599=599.0 unk_price_eur_blue_tomato=Unknown
% @importance 0.9

0.90::true_val(price_eur_blue_tomato, v599); 0.10::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).

measured(s10, price_eur_blue_tomato, v599).

all_consistent(price_eur_blue_tomato) :-
    consistent(s10, price_eur_blue_tomato).

evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v599)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

0.88::acc(s19, price_eur_blue_tomato_rrp).

% @attr price_eur_blue_tomato_rrp
% @type numeric
% @unit EUR
% @canonical false
% @original_name price_eur_blue_tomato
% @values v680=680.0 unk_price_eur_blue_tomato_rrp=Unknown
% @importance 0.85

0.90::true_val(price_eur_blue_tomato_rrp, v680); 0.10::true_val(price_eur_blue_tomato_rrp, unk_price_eur_blue_tomato_rrp).

measured(s19, price_eur_blue_tomato_rrp, v680).

all_consistent(price_eur_blue_tomato_rrp) :-
    consistent(s19, price_eur_blue_tomato_rrp).

evidence(all_consistent(price_eur_blue_tomato_rrp)).
query(true_val(price_eur_blue_tomato_rrp, v680)).
query(true_val(price_eur_blue_tomato_rrp, unk_price_eur_blue_tomato_rrp)).

0.88::acc(s10, price_eur_snowcountry).

% @attr price_eur_snowcountry
% @type numeric
% @unit EUR
% @canonical false
% @original_name price EUR (SnowCountry)
% @values v499=499.0 unk_price_eur_snowcountry=Unknown
% @importance 0.9

0.90::true_val(price_eur_snowcountry, v499); 0.10::true_val(price_eur_snowcountry, unk_price_eur_snowcountry).

measured(s10, price_eur_snowcountry, v499).

all_consistent(price_eur_snowcountry) :-
    consistent(s10, price_eur_snowcountry).

evidence(all_consistent(price_eur_snowcountry)).
query(true_val(price_eur_snowcountry, v499)).
query(true_val(price_eur_snowcountry, unk_price_eur_snowcountry)).

0.88::acc(s10, price_cad_burton_ca).

% @attr price_cad_burton_ca
% @type numeric
% @unit CAD
% @canonical false
% @original_name price CAD (Burton Canada)
% @values v839_99=839.99 unk_price_cad_burton_ca=Unknown
% @importance 0.9

0.90::true_val(price_cad_burton_ca, v839_99); 0.10::true_val(price_cad_burton_ca, unk_price_cad_burton_ca).

measured(s10, price_cad_burton_ca, v839_99).

all_consistent(price_cad_burton_ca) :-
    consistent(s10, price_cad_burton_ca).

evidence(all_consistent(price_cad_burton_ca)).
query(true_val(price_cad_burton_ca, v839_99)).
query(true_val(price_cad_burton_ca, unk_price_cad_burton_ca)).

0.88::acc(s10, price_cad_prfo).

% @attr price_cad_prfo
% @type numeric
% @unit CAD
% @canonical true
% @original_name price_cad_prfo
% @values v587_99=587.99 unk_price_cad_prfo=Unknown
% @importance 0.9

0.90::true_val(price_cad_prfo, v587_99); 0.10::true_val(price_cad_prfo, unk_price_cad_prfo).

measured(s10, price_cad_prfo, v587_99).

all_consistent(price_cad_prfo) :-
    consistent(s10, price_cad_prfo).

evidence(all_consistent(price_cad_prfo)).
query(true_val(price_cad_prfo, v587_99)).
query(true_val(price_cad_prfo, unk_price_cad_prfo)).

0.85::acc(s8, availability_status).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values available_rhythm=Rhythm_Snowsports_AU unk_availability_status=Unknown
% @importance 0.85

0.90::true_val(availability_status, available_rhythm); 0.10::true_val(availability_status, unk_availability_status).

measured(s8, availability_status, available_rhythm).

all_consistent(availability_status) :-
    (indep(s8), consistent(s8, availability_status) ; \+indep(s8)).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, available_rhythm)).
query(true_val(availability_status, unk_availability_status)).

0.82::acc(s29, estimated_availability_date).

% @attr estimated_availability_date
% @type categorical
% @canonical false
% @original_name estimated_availability_date
% @values apr_may_2026=Elevation107_April_May_2026 unk_estimated_availability_date=Unknown
% @importance 0.65

0.85::true_val(estimated_availability_date, apr_may_2026); 0.15::true_val(estimated_availability_date, unk_estimated_availability_date).

measured(s29, estimated_availability_date, apr_may_2026).

all_consistent(estimated_availability_date) :-
    (indep(s29), consistent(s29, estimated_availability_date) ; \+indep(s29)).

evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, apr_may_2026)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

0.82::acc(s31, availability_status_auski).

% @attr availability_status_auski
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_auski=Auski_Australia unk_availability_status_auski=Unknown
% @importance 0.4

0.85::true_val(availability_status_auski, available_auski); 0.15::true_val(availability_status_auski, unk_availability_status_auski).

measured(s31, availability_status_auski, available_auski).

all_consistent(availability_status_auski) :-
    (indep(s31), consistent(s31, availability_status_auski) ; \+indep(s31)).

evidence(all_consistent(availability_status_auski)).
query(true_val(availability_status_auski, available_auski)).
query(true_val(availability_status_auski, unk_availability_status_auski)).

0.82::acc(s30, availability_status_balmoral).

% @attr availability_status_balmoral
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_balmoral=Balmoral_Boards_AU unk_availability_status_balmoral=Unknown
% @importance 0.75

0.85::true_val(availability_status_balmoral, available_balmoral); 0.15::true_val(availability_status_balmoral, unk_availability_status_balmoral).

measured(s30, availability_status_balmoral, available_balmoral).

all_consistent(availability_status_balmoral) :-
    (indep(s30), consistent(s30, availability_status_balmoral) ; \+indep(s30)).

evidence(all_consistent(availability_status_balmoral)).
query(true_val(availability_status_balmoral, available_balmoral)).
query(true_val(availability_status_balmoral, unk_availability_status_balmoral)).

0.80::acc(s8, availability_status_snowbiz).

% @attr availability_status_snowbiz
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_snowbiz=Snowbiz_AU unk_availability_status_snowbiz=Unknown
% @importance 0.85

0.82::true_val(availability_status_snowbiz, available_snowbiz); 0.18::true_val(availability_status_snowbiz, unk_availability_status_snowbiz).

measured(s8, availability_status_snowbiz, available_snowbiz).

all_consistent(availability_status_snowbiz) :-
    (indep(s8), consistent(s8, availability_status_snowbiz) ; \+indep(s8)).

evidence(all_consistent(availability_status_snowbiz)).
query(true_val(availability_status_snowbiz, available_snowbiz)).
query(true_val(availability_status_snowbiz, unk_availability_status_snowbiz)).

0.82::acc(s9, availability_status_melb_snowboard).

% @attr availability_status_melb_snowboard
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_melb_preorder=Melbourne_Snowboard_Centre_preorder unk_availability_status_melb_snowboard=Unknown
% @importance 0.6

0.85::true_val(availability_status_melb_snowboard, available_melb_preorder); 0.15::true_val(availability_status_melb_snowboard, unk_availability_status_melb_snowboard).

measured(s9, availability_status_melb_snowboard, available_melb_preorder).

all_consistent(availability_status_melb_snowboard) :-
    (indep(s9), consistent(s9, availability_status_melb_snowboard) ; \+indep(s9)).

evidence(all_consistent(availability_status_melb_snowboard)).
query(true_val(availability_status_melb_snowboard, available_melb_preorder)).
query(true_val(availability_status_melb_snowboard, unk_availability_status_melb_snowboard)).

0.85::acc(s2, availability_status_basenz).

% @attr availability_status_basenz
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_basenz=BaseNZ unk_availability_status_basenz=Unknown
% @importance 0.8

0.88::true_val(availability_status_basenz, available_basenz); 0.12::true_val(availability_status_basenz, unk_availability_status_basenz).

measured(s2, availability_status_basenz, available_basenz).

all_consistent(availability_status_basenz) :-
    (indep(s2), consistent(s2, availability_status_basenz) ; \+indep(s2)).

evidence(all_consistent(availability_status_basenz)).
query(true_val(availability_status_basenz, available_basenz)).
query(true_val(availability_status_basenz, unk_availability_status_basenz)).

0.88::acc(s4, availability_status_evo).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_evo=evo_com unk_availability_status_evo=Unknown
% @importance 0.9

0.90::true_val(availability_status_evo, available_evo); 0.10::true_val(availability_status_evo, unk_availability_status_evo).

measured(s4, availability_status_evo, available_evo).

all_consistent(availability_status_evo) :-
    (indep(s4), consistent(s4, availability_status_evo) ; \+indep(s4)).

evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, available_evo)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

0.88::acc(s10, availability_status_backcountry).

% @attr availability_status_backcountry
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_backcountry=Backcountry_com unk_availability_status_backcountry=Unknown
% @importance 0.9

0.90::true_val(availability_status_backcountry, available_backcountry); 0.10::true_val(availability_status_backcountry, unk_availability_status_backcountry).

measured(s10, availability_status_backcountry, available_backcountry).

all_consistent(availability_status_backcountry) :-
    consistent(s10, availability_status_backcountry).

evidence(all_consistent(availability_status_backcountry)).
query(true_val(availability_status_backcountry, available_backcountry)).
query(true_val(availability_status_backcountry, unk_availability_status_backcountry)).

0.88::acc(s10, availability_status_tactics).

% @attr availability_status_tactics
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_tactics=Tactics unk_availability_status_tactics=Unknown
% @importance 0.9

0.90::true_val(availability_status_tactics, available_tactics); 0.10::true_val(availability_status_tactics, unk_availability_status_tactics).

measured(s10, availability_status_tactics, available_tactics).

all_consistent(availability_status_tactics) :-
    consistent(s10, availability_status_tactics).

evidence(all_consistent(availability_status_tactics)).
query(true_val(availability_status_tactics, available_tactics)).
query(true_val(availability_status_tactics, unk_availability_status_tactics)).

0.88::acc(s10, availability_status_sun_ski).

% @attr availability_status_sun_ski
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_sun_ski=Sun_Ski_Sports unk_availability_status_sun_ski=Unknown
% @importance 0.9

0.90::true_val(availability_status_sun_ski, available_sun_ski); 0.10::true_val(availability_status_sun_ski, unk_availability_status_sun_ski).

measured(s10, availability_status_sun_ski, available_sun_ski).

all_consistent(availability_status_sun_ski) :-
    consistent(s10, availability_status_sun_ski).

evidence(all_consistent(availability_status_sun_ski)).
query(true_val(availability_status_sun_ski, available_sun_ski)).
query(true_val(availability_status_sun_ski, unk_availability_status_sun_ski)).

0.88::acc(s10, availability_status_blauer).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_blauer=Blauer_Board_Shop unk_availability_status_blauer=Unknown
% @importance 0.9

0.90::true_val(availability_status_blauer, available_blauer); 0.10::true_val(availability_status_blauer, unk_availability_status_blauer).

measured(s10, availability_status_blauer, available_blauer).

all_consistent(availability_status_blauer) :-
    consistent(s10, availability_status_blauer).

evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, available_blauer)).
query(true_val(availability_status_blauer, unk_availability_status_blauer)).

0.82::acc(s16, availability_status_peter_glenn).

% @attr availability_status_peter_glenn
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_peter_glenn=Peter_Glenn unk_availability_status_peter_glenn=Unknown
% @importance 0.7

0.85::true_val(availability_status_peter_glenn, available_peter_glenn); 0.15::true_val(availability_status_peter_glenn, unk_availability_status_peter_glenn).

measured(s16, availability_status_peter_glenn, available_peter_glenn).

all_consistent(availability_status_peter_glenn) :-
    (indep(s16), consistent(s16, availability_status_peter_glenn) ; \+indep(s16)).

evidence(all_consistent(availability_status_peter_glenn)).
query(true_val(availability_status_peter_glenn, available_peter_glenn)).
query(true_val(availability_status_peter_glenn, unk_availability_status_peter_glenn)).

0.82::acc(s17, availability_status_utahskis).

% @attr availability_status_utahskis
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_utahskis=UtahSkis unk_availability_status_utahskis=Unknown
% @importance 0.85

0.85::true_val(availability_status_utahskis, available_utahskis); 0.15::true_val(availability_status_utahskis, unk_availability_status_utahskis).

measured(s17, availability_status_utahskis, available_utahskis).

all_consistent(availability_status_utahskis) :-
    (indep(s17), consistent(s17, availability_status_utahskis) ; \+indep(s17)).

evidence(all_consistent(availability_status_utahskis)).
query(true_val(availability_status_utahskis, available_utahskis)).
query(true_val(availability_status_utahskis, unk_availability_status_utahskis)).

0.82::acc(s34, availability_status_darkside).

% @attr availability_status_darkside
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_darkside=Darkside_Snowboards unk_availability_status_darkside=Unknown
% @importance 0.7

0.85::true_val(availability_status_darkside, available_darkside); 0.15::true_val(availability_status_darkside, unk_availability_status_darkside).

measured(s34, availability_status_darkside, available_darkside).

all_consistent(availability_status_darkside) :-
    (indep(s34), consistent(s34, availability_status_darkside) ; \+indep(s34)).

evidence(all_consistent(availability_status_darkside)).
query(true_val(availability_status_darkside, available_darkside)).
query(true_val(availability_status_darkside, unk_availability_status_darkside)).

0.82::acc(s29, availability_status_pathfinder).

% @attr availability_status_pathfinder
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_pathfinder=Pathfinder_of_WV unk_availability_status_pathfinder=Unknown
% @importance 0.65

0.85::true_val(availability_status_pathfinder, available_pathfinder); 0.15::true_val(availability_status_pathfinder, unk_availability_status_pathfinder).

measured(s29, availability_status_pathfinder, available_pathfinder).

all_consistent(availability_status_pathfinder) :-
    (indep(s29), consistent(s29, availability_status_pathfinder) ; \+indep(s29)).

evidence(all_consistent(availability_status_pathfinder)).
query(true_val(availability_status_pathfinder, available_pathfinder)).
query(true_val(availability_status_pathfinder, unk_availability_status_pathfinder)).

0.80::acc(s33, availability_status_eriks).

% @attr availability_status_eriks
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_eriks=ERIKS_Bike_Board_Ski unk_availability_status_eriks=Unknown
% @importance 0.25

0.82::true_val(availability_status_eriks, available_eriks); 0.18::true_val(availability_status_eriks, unk_availability_status_eriks).

measured(s33, availability_status_eriks, available_eriks).

all_consistent(availability_status_eriks) :-
    (indep(s33), consistent(s33, availability_status_eriks) ; \+indep(s33)).

evidence(all_consistent(availability_status_eriks)).
query(true_val(availability_status_eriks, available_eriks)).
query(true_val(availability_status_eriks, unk_availability_status_eriks)).

0.90::acc(s1, availability_status_burton_com).

% @attr availability_status_burton_com
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_burton_com=Burton_com_official unk_availability_status_burton_com=Unknown
% @importance 1.0

0.92::true_val(availability_status_burton_com, available_burton_com); 0.08::true_val(availability_status_burton_com, unk_availability_status_burton_com).

measured(s1, availability_status_burton_com, available_burton_com).

all_consistent(availability_status_burton_com) :-
    consistent(s1, availability_status_burton_com).

evidence(all_consistent(availability_status_burton_com)).
query(true_val(availability_status_burton_com, available_burton_com)).
query(true_val(availability_status_burton_com, unk_availability_status_burton_com)).

0.88::acc(s10, availability_status_blue_tomato).

% @attr availability_status_blue_tomato
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_blue_tomato=BlueTomato_EU unk_availability_status_blue_tomato=Unknown
% @importance 0.9

0.90::true_val(availability_status_blue_tomato, available_blue_tomato); 0.10::true_val(availability_status_blue_tomato, unk_availability_status_blue_tomato).

measured(s10, availability_status_blue_tomato, available_blue_tomato).

all_consistent(availability_status_blue_tomato) :-
    consistent(s10, availability_status_blue_tomato).

evidence(all_consistent(availability_status_blue_tomato)).
query(true_val(availability_status_blue_tomato, available_blue_tomato)).
query(true_val(availability_status_blue_tomato, unk_availability_status_blue_tomato)).

0.88::acc(s10, availability_status_snowcountry).

% @attr availability_status_snowcountry
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_snowcountry=SnowCountry unk_availability_status_snowcountry=Unknown
% @importance 0.9

0.90::true_val(availability_status_snowcountry, available_snowcountry); 0.10::true_val(availability_status_snowcountry, unk_availability_status_snowcountry).

measured(s10, availability_status_snowcountry, available_snowcountry).

all_consistent(availability_status_snowcountry) :-
    consistent(s10, availability_status_snowcountry).

evidence(all_consistent(availability_status_snowcountry)).
query(true_val(availability_status_snowcountry, available_snowcountry)).
query(true_val(availability_status_snowcountry, unk_availability_status_snowcountry)).

0.88::acc(s10, availability_status_burton_ca).

% @attr availability_status_burton_ca
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_burton_ca=Burton_Snowboards_Canada unk_availability_status_burton_ca=Unknown
% @importance 0.9

0.90::true_val(availability_status_burton_ca, available_burton_ca); 0.10::true_val(availability_status_burton_ca, unk_availability_status_burton_ca).

measured(s10, availability_status_burton_ca, available_burton_ca).

all_consistent(availability_status_burton_ca) :-
    consistent(s10, availability_status_burton_ca).

evidence(all_consistent(availability_status_burton_ca)).
query(true_val(availability_status_burton_ca, available_burton_ca)).
query(true_val(availability_status_burton_ca, unk_availability_status_burton_ca)).

0.88::acc(s10, availability_status_prfo).

% @attr availability_status_prfo
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_prfo=PRFO_Sports_Canada unk_availability_status_prfo=Unknown
% @importance 0.9

0.90::true_val(availability_status_prfo, available_prfo); 0.10::true_val(availability_status_prfo, unk_availability_status_prfo).

measured(s10, availability_status_prfo, available_prfo).

all_consistent(availability_status_prfo) :-
    consistent(s10, availability_status_prfo).

evidence(all_consistent(availability_status_prfo)).
query(true_val(availability_status_prfo, available_prfo)).
query(true_val(availability_status_prfo, unk_availability_status_prfo)).

0.93::acc(s_merchant, shipping_restriction).

% @attr shipping_restriction
% @type categorical
% @canonical false
% @original_name shipping restriction (merchant)
% @values au_only=Australia_only unk_shipping_restriction=Unknown
% @importance 0.85

0.95::true_val(shipping_restriction, au_only); 0.05::true_val(shipping_restriction, unk_shipping_restriction).

measured(s_merchant, shipping_restriction, au_only).

all_consistent(shipping_restriction) :-
    (indep(s_merchant), consistent(s_merchant, shipping_restriction) ; \+indep(s_merchant)).

evidence(all_consistent(shipping_restriction)).
query(true_val(shipping_restriction, au_only)).
query(true_val(shipping_restriction, unk_shipping_restriction)).

0.88::acc(s10, positive_aspect).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values better_edge_hold=Better_Edge_Hold_Than_Most_Burton_Boards unk_positive_aspect=Unknown
% @importance 0.9

0.90::true_val(positive_aspect, better_edge_hold); 0.10::true_val(positive_aspect, unk_positive_aspect).

measured(s10, positive_aspect, better_edge_hold).

all_consistent(positive_aspect) :-
    consistent(s10, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, better_edge_hold)).
query(true_val(positive_aspect, unk_positive_aspect)).

0.88::acc(s10, positive_aspect_pop).

% @attr positive_aspect_pop
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values excellent_pop=Typical_Excellent_Burton_Pop unk_positive_aspect_pop=Unknown
% @importance 0.9

0.90::true_val(positive_aspect_pop, excellent_pop); 0.10::true_val(positive_aspect_pop, unk_positive_aspect_pop).

measured(s10, positive_aspect_pop, excellent_pop).

all_consistent(positive_aspect_pop) :-
    consistent(s10, positive_aspect_pop).

evidence(all_consistent(positive_aspect_pop)).
query(true_val(positive_aspect_pop, excellent_pop)).
query(true_val(positive_aspect_pop, unk_positive_aspect_pop)).

0.88::acc(s10, positive_aspect_chatter).

% @attr positive_aspect_chatter
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values less_chatter=Not_As_Much_Chatter_For_This_Much_Pop unk_positive_aspect_chatter=Unknown
% @importance 0.9

0.90::true_val(positive_aspect_chatter, less_chatter); 0.10::true_val(positive_aspect_chatter, unk_positive_aspect_chatter).

measured(s10, positive_aspect_chatter, less_chatter).

all_consistent(positive_aspect_chatter) :-
    consistent(s10, positive_aspect_chatter).

evidence(all_consistent(positive_aspect_chatter)).
query(true_val(positive_aspect_chatter, less_chatter)).
query(true_val(positive_aspect_chatter, unk_positive_aspect_chatter)).

0.88::acc(s10, positive_aspect_daily_driver).

% @attr positive_aspect_daily_driver
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values great_daily_driver=Great_Directional_Daily_Driver unk_positive_aspect_daily_driver=Unknown
% @importance 0.9

0.90::true_val(positive_aspect_daily_driver, great_daily_driver); 0.10::true_val(positive_aspect_daily_driver, unk_positive_aspect_daily_driver).

measured(s10, positive_aspect_daily_driver, great_daily_driver).

all_consistent(positive_aspect_daily_driver) :-
    consistent(s10, positive_aspect_daily_driver).

evidence(all_consistent(positive_aspect_daily_driver)).
query(true_val(positive_aspect_daily_driver, great_daily_driver)).
query(true_val(positive_aspect_daily_driver, unk_positive_aspect_daily_driver)).

0.85::acc(s10, negative_aspect).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values setback_wider_than_ref=Set_All_Way_Back_Much_Wider_Than_Reference unk_negative_aspect=Unknown
% @importance 0.9

0.87::true_val(negative_aspect, setback_wider_than_ref); 0.13::true_val(negative_aspect, unk_negative_aspect).

measured(s10, negative_aspect, setback_wider_than_ref).

all_consistent(negative_aspect) :-
    consistent(s10, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, setback_wider_than_ref)).
query(true_val(negative_aspect, unk_negative_aspect)).

0.85::acc(s10, negative_aspect_base_glide).
0.85::acc(s23, negative_aspect_base_glide).

% @attr negative_aspect_base_glide
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values base_glide_good_not_amazing=Base_glide_good_not_amazing unk_negative_aspect_base_glide=Unknown
% @importance 0.85

0.90::true_val(negative_aspect_base_glide, base_glide_good_not_amazing); 0.10::true_val(negative_aspect_base_glide, unk_negative_aspect_base_glide).

measured(s10, negative_aspect_base_glide, base_glide_good_not_amazing).
measured(s23, negative_aspect_base_glide, base_glide_good_not_amazing).

all_consistent(negative_aspect_base_glide) :-
    consistent(s10, negative_aspect_base_glide),
    consistent(s23, negative_aspect_base_glide).

evidence(all_consistent(negative_aspect_base_glide)).
query(true_val(negative_aspect_base_glide, base_glide_good_not_amazing)).
query(true_val(negative_aspect_base_glide, unk_negative_aspect_base_glide)).

0.87::acc(s23, reviewer_opinion_tgr_recommend).

% @attr reviewer_opinion_tgr_recommend
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values will_recommend=Will_recommend_a_lot unk_reviewer_opinion_tgr_recommend=Unknown
% @importance 0.85

0.90::true_val(reviewer_opinion_tgr_recommend, will_recommend); 0.10::true_val(reviewer_opinion_tgr_recommend, unk_reviewer_opinion_tgr_recommend).

measured(s23, reviewer_opinion_tgr_recommend, will_recommend).

all_consistent(reviewer_opinion_tgr_recommend) :-
    consistent(s23, reviewer_opinion_tgr_recommend).

evidence(all_consistent(reviewer_opinion_tgr_recommend)).
query(true_val(reviewer_opinion_tgr_recommend, will_recommend)).
query(true_val(reviewer_opinion_tgr_recommend, unk_reviewer_opinion_tgr_recommend)).

0.87::acc(s23, reviewer_opinion_tgr_quiver_killer).

% @attr reviewer_opinion_tgr_quiver_killer
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values quiver_killer=Ability_to_be_quiver_killer unk_reviewer_opinion_tgr_quiver_killer=Unknown
% @importance 0.85

0.90::true_val(reviewer_opinion_tgr_quiver_killer, quiver_killer); 0.10::true_val(reviewer_opinion_tgr_quiver_killer, unk_reviewer_opinion_tgr_quiver_killer).

measured(s23, reviewer_opinion_tgr_quiver_killer, quiver_killer).

all_consistent(reviewer_opinion_tgr_quiver_killer) :-
    consistent(s23, reviewer_opinion_tgr_quiver_killer).

evidence(all_consistent(reviewer_opinion_tgr_quiver_killer)).
query(true_val(reviewer_opinion_tgr_quiver_killer, quiver_killer)).
query(true_val(reviewer_opinion_tgr_quiver_killer, unk_reviewer_opinion_tgr_quiver_killer)).

0.85::acc(s7, reviewer_opinion_whitelines).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values boosts_stable=Boosts_off_side_hits_super_stable_landing unk_reviewer_opinion_whitelines=Unknown
% @importance 0.8

0.88::true_val(reviewer_opinion_whitelines, boosts_stable); 0.12::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

measured(s7, reviewer_opinion_whitelines, boosts_stable).

all_consistent(reviewer_opinion_whitelines) :-
    consistent(s7, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, boosts_stable)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

0.85::acc(s18, reviewer_opinion_whitelines_edge).

% @attr reviewer_opinion_whitelines_edge
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values edge_hold_not_twitchy=Incredible_edge_hold_not_twitchy unk_reviewer_opinion_whitelines_edge=Unknown
% @importance 0.8

0.88::true_val(reviewer_opinion_whitelines_edge, edge_hold_not_twitchy); 0.12::true_val(reviewer_opinion_whitelines_edge, unk_reviewer_opinion_whitelines_edge).

measured(s18, reviewer_opinion_whitelines_edge, edge_hold_not_twitchy).

all_consistent(reviewer_opinion_whitelines_edge) :-
    consistent(s18, reviewer_opinion_whitelines_edge).

evidence(all_consistent(reviewer_opinion_whitelines_edge)).
query(true_val(reviewer_opinion_whitelines_edge, edge_hold_not_twitchy)).
query(true_val(reviewer_opinion_whitelines_edge, unk_reviewer_opinion_whitelines_edge)).

0.85::acc(s18, reviewer_opinion_whitelines_soft).

% @attr reviewer_opinion_whitelines_soft
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values softer_freeride_lively=Softer_side_for_freeride_lively_turning unk_reviewer_opinion_whitelines_soft=Unknown
% @importance 0.8

0.88::true_val(reviewer_opinion_whitelines_soft, softer_freeride_lively); 0.12::true_val(reviewer_opinion_whitelines_soft, unk_reviewer_opinion_whitelines_soft).

measured(s18, reviewer_opinion_whitelines_soft, softer_freeride_lively).

all_consistent(reviewer_opinion_whitelines_soft) :-
    consistent(s18, reviewer_opinion_whitelines_soft).

evidence(all_consistent(reviewer_opinion_whitelines_soft)).
query(true_val(reviewer_opinion_whitelines_soft, softer_freeride_lively)).
query(true_val(reviewer_opinion_whitelines_soft, unk_reviewer_opinion_whitelines_soft)).

0.82::acc(s12, review_positive_kingsnow).

% @attr review_positive_kingsnow
% @type categorical
% @canonical false
% @original_name review positive (KingSNOWBoard Aari)
% @values easy_quick_turns_pop=Super_easy_quick_turns_tons_of_pop unk_review_positive_kingsnow=Unknown
% @importance 0.75

0.85::true_val(review_positive_kingsnow, easy_quick_turns_pop); 0.15::true_val(review_positive_kingsnow, unk_review_positive_kingsnow).

measured(s12, review_positive_kingsnow, easy_quick_turns_pop).

all_consistent(review_positive_kingsnow) :-
    consistent(s12, review_positive_kingsnow).

evidence(all_consistent(review_positive_kingsnow)).
query(true_val(review_positive_kingsnow, easy_quick_turns_pop)).
query(true_val(review_positive_kingsnow, unk_review_positive_kingsnow)).

0.87::acc(s7, reviewer_opinion_whitelines_equilibrium).

% @attr reviewer_opinion_whitelines_equilibrium
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values rare_equilibrium=Strikes_rare_equilibrium_freestyle_freeride unk_reviewer_opinion_whitelines_equilibrium=Unknown
% @importance 0.8

0.88::true_val(reviewer_opinion_whitelines_equilibrium, rare_equilibrium); 0.12::true_val(reviewer_opinion_whitelines_equilibrium, unk_reviewer_opinion_whitelines_equilibrium).

measured(s7, reviewer_opinion_whitelines_equilibrium, rare_equilibrium).

all_consistent(reviewer_opinion_whitelines_equilibrium) :-
    consistent(s7, reviewer_opinion_whitelines_equilibrium).

evidence(all_consistent(reviewer_opinion_whitelines_equilibrium)).
query(true_val(reviewer_opinion_whitelines_equilibrium, rare_equilibrium)).
query(true_val(reviewer_opinion_whitelines_equilibrium, unk_reviewer_opinion_whitelines_equilibrium)).

0.88::acc(s11, reviewer_opinion_sp_score).

% @attr reviewer_opinion_sp_score
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles
% @values ranked_10th_of_28=Scored_86_1_ranked_10th_of_28_mellow_freeride unk_reviewer_opinion_sp_score=Unknown
% @importance 0.9

0.90::true_val(reviewer_opinion_sp_score, ranked_10th_of_28); 0.10::true_val(reviewer_opinion_sp_score, unk_reviewer_opinion_sp_score).

measured(s11, reviewer_opinion_sp_score, ranked_10th_of_28).

all_consistent(reviewer_opinion_sp_score) :-
    consistent(s11, reviewer_opinion_sp_score).

evidence(all_consistent(reviewer_opinion_sp_score)).
query(true_val(reviewer_opinion_sp_score, ranked_10th_of_28)).
query(true_val(reviewer_opinion_sp_score, unk_reviewer_opinion_sp_score)).

0.88::acc(s11, reviewer_opinion_sp_vs_deep_thinker).

% @attr reviewer_opinion_sp_vs_deep_thinker
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles
% @values deep_thinker_slightly_better=Deep_Thinker_slightly_better_but_close unk_reviewer_opinion_sp_vs_deep_thinker=Unknown
% @importance 0.9

0.88::true_val(reviewer_opinion_sp_vs_deep_thinker, deep_thinker_slightly_better); 0.12::true_val(reviewer_opinion_sp_vs_deep_thinker, unk_reviewer_opinion_sp_vs_deep_thinker).

measured(s11, reviewer_opinion_sp_vs_deep_thinker, deep_thinker_slightly_better).

all_consistent(reviewer_opinion_sp_vs_deep_thinker) :-
    consistent(s11, reviewer_opinion_sp_vs_deep_thinker).

evidence(all_consistent(reviewer_opinion_sp_vs_deep_thinker)).
query(true_val(reviewer_opinion_sp_vs_deep_thinker, deep_thinker_slightly_better)).
query(true_val(reviewer_opinion_sp_vs_deep_thinker, unk_reviewer_opinion_sp_vs_deep_thinker)).

0.88::acc(s11, reviewer_opinion_sp_dampness).

% @attr reviewer_opinion_sp_dampness
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles
% @values more_damp_absorbs_chatter=More_damp_spongy_absorbs_chatter_in_crud unk_reviewer_opinion_sp_dampness=Unknown
% @importance 0.9

0.88::true_val(reviewer_opinion_sp_dampness, more_damp_absorbs_chatter); 0.12::true_val(reviewer_opinion_sp_dampness, unk_reviewer_opinion_sp_dampness).

measured(s11, reviewer_opinion_sp_dampness, more_damp_absorbs_chatter).

all_consistent(reviewer_opinion_sp_dampness) :-
    consistent(s11, reviewer_opinion_sp_dampness).

evidence(all_consistent(reviewer_opinion_sp_dampness)).
query(true_val(reviewer_opinion_sp_dampness, more_damp_absorbs_chatter)).
query(true_val(reviewer_opinion_sp_dampness, unk_reviewer_opinion_sp_dampness)).

0.82::acc(s7, reviewer_opinion_whitelines_channel).

% @attr reviewer_opinion_whitelines_channel
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values channel_affects_flex=Channel_system_can_affect_flex unk_reviewer_opinion_whitelines_channel=Unknown
% @importance 0.8

0.85::true_val(reviewer_opinion_whitelines_channel, channel_affects_flex); 0.15::true_val(reviewer_opinion_whitelines_channel, unk_reviewer_opinion_whitelines_channel).

measured(s7, reviewer_opinion_whitelines_channel, channel_affects_flex).

all_consistent(reviewer_opinion_whitelines_channel) :-
    consistent(s7, reviewer_opinion_whitelines_channel).

evidence(all_consistent(reviewer_opinion_whitelines_channel)).
query(true_val(reviewer_opinion_whitelines_channel, channel_affects_flex)).
query(true_val(reviewer_opinion_whitelines_channel, unk_reviewer_opinion_whitelines_channel)).

0.85::acc(s10, reviewer_opinion_tgr_channel).

% @attr reviewer_opinion_tgr_channel
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values prefers_four_screws=Not_biggest_fan_of_channel_want_four_screws unk_reviewer_opinion_tgr_channel=Unknown
% @importance 0.9

0.87::true_val(reviewer_opinion_tgr_channel, prefers_four_screws); 0.13::true_val(reviewer_opinion_tgr_channel, unk_reviewer_opinion_tgr_channel).

measured(s10, reviewer_opinion_tgr_channel, prefers_four_screws).

all_consistent(reviewer_opinion_tgr_channel) :-
    consistent(s10, reviewer_opinion_tgr_channel).

evidence(all_consistent(reviewer_opinion_tgr_channel)).
query(true_val(reviewer_opinion_tgr_channel, prefers_four_screws)).
query(true_val(reviewer_opinion_tgr_channel, unk_reviewer_opinion_tgr_channel)).

0.65::acc(s28, user_review_forum).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values sloppy_nose_underwhelmed=Sloppy_flappy_nose_severely_underwhelmed unk_user_review_forum=Unknown
% @importance 0.75

0.70::true_val(user_review_forum, sloppy_nose_underwhelmed); 0.30::true_val(user_review_forum, unk_user_review_forum).

measured(s28, user_review_forum, sloppy_nose_underwhelmed).

all_consistent(user_review_forum) :-
    consistent(s28, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, sloppy_nose_underwhelmed)).
query(true_val(user_review_forum, unk_user_review_forum)).

0.60::acc(s40, user_review_forum_stability).

% @attr user_review_forum_stability
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values lacked_power_vs_hometown_hero=Lacked_power_stability_vs_Hometown_Hero unk_user_review_forum_stability=Unknown
% @importance 0.7

0.65::true_val(user_review_forum_stability, lacked_power_vs_hometown_hero); 0.35::true_val(user_review_forum_stability, unk_user_review_forum_stability).

measured(s40, user_review_forum_stability, lacked_power_vs_hometown_hero).

all_consistent(user_review_forum_stability) :-
    consistent(s40, user_review_forum_stability).

evidence(all_consistent(user_review_forum_stability)).
query(true_val(user_review_forum_stability, lacked_power_vs_hometown_hero)).
query(true_val(user_review_forum_stability, unk_user_review_forum_stability)).

0.82::acc(s11, skill_level_recommendation_beginners).
0.85::acc(s10, skill_level_recommendation_beginners).

% @attr skill_level_recommendation_beginners
% @type categorical
% @canonical false
% @original_name skill_level_recommendation
% @values not_for_beginners=Not_recommended_for_beginners unk_skill_level_recommendation_beginners=Unknown
% @importance 0.9

0.90::true_val(skill_level_recommendation_beginners, not_for_beginners); 0.10::true_val(skill_level_recommendation_beginners, unk_skill_level_recommendation_beginners).

measured(s11, skill_level_recommendation_beginners, not_for_beginners).
measured(s10, skill_level_recommendation_beginners, not_for_beginners).

all_consistent(skill_level_recommendation_beginners) :-
    consistent(s11, skill_level_recommendation_beginners),
    consistent(s10, skill_level_recommendation_beginners).

evidence(all_consistent(skill_level_recommendation_beginners)).
query(true_val(skill_level_recommendation_beginners, not_for_beginners)).
query(true_val(skill_level_recommendation_beginners, unk_skill_level_recommendation_beginners)).

0.88::acc(s23, comparable_board_same_brand).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values carving_better_than_deep_thinker=Carving_better_on_Counterbalance_than_Deep_Thinker unk_comparable_board_same_brand=Unknown
% @importance 0.8

0.88::true_val(comparable_board_same_brand, carving_better_than_deep_thinker); 0.12::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s23, comparable_board_same_brand, carving_better_than_deep_thinker).

all_consistent(comparable_board_same_brand) :-
    consistent(s23, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, carving_better_than_deep_thinker)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

0.88::acc(s10, comparable_board_cross_brand).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values amplid_k2_us_jones_salomon_yes=Amplid_Souly_Grail_K2_Alchemist_Jones_Flagship_Pro_etc unk_comparable_board_cross_brand=Unknown
% @importance 0.9

0.88::true_val(comparable_board_cross_brand, amplid_k2_us_jones_salomon_yes); 0.12::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s10, comparable_board_cross_brand, amplid_k2_us_jones_salomon_yes).

all_consistent(comparable_board_cross_brand) :-
    consistent(s10, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, amplid_k2_us_jones_salomon_yes)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

0.85::acc(s23, comparable_board_same_brand_high_fidelity).

% @attr comparable_board_same_brand_high_fidelity
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values high_fidelity=Burton_High_Fidelity_recommended unk_comparable_board_same_brand_high_fidelity=Unknown
% @importance 0.8

0.87::true_val(comparable_board_same_brand_high_fidelity, high_fidelity); 0.13::true_val(comparable_board_same_brand_high_fidelity, unk_comparable_board_same_brand_high_fidelity).

measured(s23, comparable_board_same_brand_high_fidelity, high_fidelity).

all_consistent(comparable_board_same_brand_high_fidelity) :-
    consistent(s23, comparable_board_same_brand_high_fidelity).

evidence(all_consistent(comparable_board_same_brand_high_fidelity)).
query(true_val(comparable_board_same_brand_high_fidelity, high_fidelity)).
query(true_val(comparable_board_same_brand_high_fidelity, unk_comparable_board_same_brand_high_fidelity)).

0.80::acc(s9, comparable_board_same_brand_alternatives).
0.65::acc(s28, comparable_board_same_brand_alternatives).

% @attr comparable_board_same_brand_alternatives
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values free_thinker_good_company=Free_Thinker_or_Good_Company unk_comparable_board_same_brand_alternatives=Unknown
% @importance 0.6

0.82::true_val(comparable_board_same_brand_alternatives, free_thinker_good_company); 0.18::true_val(comparable_board_same_brand_alternatives, unk_comparable_board_same_brand_alternatives).

measured(s9, comparable_board_same_brand_alternatives, free_thinker_good_company).
measured(s28, comparable_board_same_brand_alternatives, free_thinker_good_company).

all_consistent(comparable_board_same_brand_alternatives) :-
    (indep(s9), consistent(s9, comparable_board_same_brand_alternatives) ; \+indep(s9)),
    consistent(s28, comparable_board_same_brand_alternatives).

evidence(all_consistent(comparable_board_same_brand_alternatives)).
query(true_val(comparable_board_same_brand_alternatives, free_thinker_good_company)).
query(true_val(comparable_board_same_brand_alternatives, unk_comparable_board_same_brand_alternatives)).

0.60::acc(s41, comparable_board_cross_brand_forum).

% @attr comparable_board_cross_brand_forum
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values capita_nitro_salomon_k2_yes_jones=Capita_Mercury_Nitro_Team_Salomon_Assassin_etc unk_comparable_board_cross_brand_forum=Unknown
% @importance 0.65

0.65::true_val(comparable_board_cross_brand_forum, capita_nitro_salomon_k2_yes_jones); 0.35::true_val(comparable_board_cross_brand_forum, unk_comparable_board_cross_brand_forum).

measured(s41, comparable_board_cross_brand_forum, capita_nitro_salomon_k2_yes_jones).

all_consistent(comparable_board_cross_brand_forum) :-
    consistent(s41, comparable_board_cross_brand_forum).

evidence(all_consistent(comparable_board_cross_brand_forum)).
query(true_val(comparable_board_cross_brand_forum, capita_nitro_salomon_k2_yes_jones)).
query(true_val(comparable_board_cross_brand_forum, unk_comparable_board_cross_brand_forum)).

0.88::acc(s11, avg_price_competing_mellow_freeride).

% @attr avg_price_competing_mellow_freeride
% @type numeric
% @unit USD
% @canonical false
% @original_name average price of competing mellow freeride boards
% @values v600=600.0 unk_avg_price_competing_mellow_freeride=Unknown
% @importance 0.9

0.88::true_val(avg_price_competing_mellow_freeride, v600); 0.12::true_val(avg_price_competing_mellow_freeride, unk_avg_price_competing_mellow_freeride).

measured(s11, avg_price_competing_mellow_freeride, v600).

all_consistent(avg_price_competing_mellow_freeride) :-
    consistent(s11, avg_price_competing_mellow_freeride).

evidence(all_consistent(avg_price_competing_mellow_freeride)).
query(true_val(avg_price_competing_mellow_freeride, v600)).
query(true_val(avg_price_competing_mellow_freeride, unk_avg_price_competing_mellow_freeride)).

0.88::acc(s11, price_position).

% @attr price_position
% @type categorical
% @canonical false
% @original_name price position
% @values slightly_above_avg=659_USD_slightly_above_600_category_avg unk_price_position=Unknown
% @importance 0.9

0.88::true_val(price_position, slightly_above_avg); 0.12::true_val(price_position, unk_price_position).

measured(s11, price_position, slightly_above_avg).

all_consistent(price_position) :-
    consistent(s11, price_position).

evidence(all_consistent(price_position)).
query(true_val(price_position, slightly_above_avg)).
query(true_val(price_position, unk_price_position)).

0.88::acc(s17, sustainability_super_sap).

% @attr sustainability_super_sap
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values super_sap_50pct=Super_Sap_Epoxy_50pct_carbon_reduction unk_sustainability_super_sap=Unknown
% @importance 0.85

0.90::true_val(sustainability_super_sap, super_sap_50pct); 0.10::true_val(sustainability_super_sap, unk_sustainability_super_sap).

measured(s17, sustainability_super_sap, super_sap_50pct).

all_consistent(sustainability_super_sap) :-
    (indep(s17), consistent(s17, sustainability_super_sap) ; \+indep(s17)).

evidence(all_consistent(sustainability_super_sap)).
query(true_val(sustainability_super_sap, super_sap_50pct)).
query(true_val(sustainability_super_sap, unk_sustainability_super_sap)).

0.78::acc(s26, brand_ethos).

% @attr brand_ethos
% @type categorical
% @canonical false
% @original_name brand ethos
% @values purpose_led_people_planet_sport=Purpose_led_positively_impacting_people_planet_sport unk_brand_ethos=Unknown
% @importance 0.4

0.80::true_val(brand_ethos, purpose_led_people_planet_sport); 0.20::true_val(brand_ethos, unk_brand_ethos).

measured(s26, brand_ethos, purpose_led_people_planet_sport).

all_consistent(brand_ethos) :-
    (indep(s26), consistent(s26, brand_ethos) ; \+indep(s26)).

evidence(all_consistent(brand_ethos)).
query(true_val(brand_ethos, purpose_led_people_planet_sport)).
query(true_val(brand_ethos, unk_brand_ethos)).

0.85::acc(s36, channel_history).

% @attr channel_history
% @type categorical
% @canonical false
% @original_name Channel mount replaced Burton 3D pattern in 2014
% @values replaced_3d_in_2014=Channel_replaced_3D_in_2014 unk_channel_history=Unknown
% @importance 0.65

0.87::true_val(channel_history, replaced_3d_in_2014); 0.13::true_val(channel_history, unk_channel_history).

measured(s36, channel_history, replaced_3d_in_2014).

all_consistent(channel_history) :-
    (indep(s36), consistent(s36, channel_history) ; \+indep(s36)).

evidence(all_consistent(channel_history)).
query(true_val(channel_history, replaced_3d_in_2014)).
query(true_val(channel_history, unk_channel_history)).

0.85::acc(s36, channel_design).

% @attr channel_design
% @type categorical
% @canonical false
% @original_name Channel uses two parallel slots with two screws per binding
% @values two_slots_two_screws=Two_parallel_slots_two_screws_per_binding unk_channel_design=Unknown
% @importance 0.65

0.87::true_val(channel_design, two_slots_two_screws); 0.13::true_val(channel_design, unk_channel_design).

measured(s36, channel_design, two_slots_two_screws).

all_consistent(channel_design) :-
    (indep(s36), consistent(s36, channel_design) ; \+indep(s36)).

evidence(all_consistent(channel_design)).
query(true_val(channel_design, two_slots_two_screws)).
query(true_val(channel_design, unk_channel_design)).

0.82::acc(s39, est_binding_lock_in).

% @attr est_binding_lock_in
% @type categorical
% @canonical false
% @original_name EST bindings are only compatible with the Channel system
% @values est_channel_only=EST_bindings_only_compatible_Channel unk_est_binding_lock_in=Unknown
% @importance 0.65

0.85::true_val(est_binding_lock_in, est_channel_only); 0.15::true_val(est_binding_lock_in, unk_est_binding_lock_in).

measured(s39, est_binding_lock_in, est_channel_only).

all_consistent(est_binding_lock_in) :-
    (indep(s39), consistent(s39, est_binding_lock_in) ; \+indep(s39)).

evidence(all_consistent(est_binding_lock_in)).
query(true_val(est_binding_lock_in, est_channel_only)).
query(true_val(est_binding_lock_in, unk_est_binding_lock_in)).

0.93::acc(s_merchant, effective_edge_142).

% @attr effective_edge_142
% @type numeric
% @unit cm
% @canonical false
% @original_name effective edge 142cm
% @values v107_5=107.5 unk_effective_edge_142=Unknown
% @importance 0.85

0.95::true_val(effective_edge_142, v107_5); 0.05::true_val(effective_edge_142, unk_effective_edge_142).

measured(s_merchant, effective_edge_142, v107_5).

all_consistent(effective_edge_142) :-
    (indep(s_merchant), consistent(s_merchant, effective_edge_142) ; \+indep(s_merchant)).

evidence(all_consistent(effective_edge_142)).
query(true_val(effective_edge_142, v107_5)).
query(true_val(effective_edge_142, unk_effective_edge_142)).

0.93::acc(s_merchant, sidecut_radius_size_142).

% @attr sidecut_radius_size_142
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v6_7=6.7 unk_sidecut_radius_size_142=Unknown
% @importance 0.85

0.95::true_val(sidecut_radius_size_142, v6_7); 0.05::true_val(sidecut_radius_size_142, unk_sidecut_radius_size_142).

measured(s_merchant, sidecut_radius_size_142, v6_7).

all_consistent(sidecut_radius_size_142) :-
    (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_142) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_radius_size_142)).
query(true_val(sidecut_radius_size_142, v6_7)).
query(true_val(sidecut_radius_size_142, unk_sidecut_radius_size_142)).

0.93::acc(s_merchant, waist_width_142).

% @attr waist_width_142
% @type numeric
% @unit mm
% @canonical false
% @original_name waist width 142cm
% @values v237_0=237.0 unk_waist_width_142=Unknown
% @importance 0.85

0.95::true_val(waist_width_142, v237_0); 0.05::true_val(waist_width_142, unk_waist_width_142).

measured(s_merchant, waist_width_142, v237_0).

all_consistent(waist_width_142) :-
    (indep(s_merchant), consistent(s_merchant, waist_width_142) ; \+indep(s_merchant)).

evidence(all_consistent(waist_width_142)).
query(true_val(waist_width_142, v237_0)).
query(true_val(waist_width_142, unk_waist_width_142)).

0.93::acc(s_merchant, recommended_weight_range_size_142).

% @attr recommended_weight_range_size_142
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values w45_68kg=45-68kg unk_recommended_weight_range_size_142=Unknown
% @importance 0.85

0.95::true_val(recommended_weight_range_size_142, w45_68kg); 0.05::true_val(recommended_weight_range_size_142, unk_recommended_weight_range_size_142).

measured(s_merchant, recommended_weight_range_size_142, w45_68kg).

all_consistent(recommended_weight_range_size_142) :-
    (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size_142) ; \+indep(s_merchant)).

evidence(all_consistent(recommended_weight_range_size_142)).
query(true_val(recommended_weight_range_size_142, w45_68kg)).
query(true_val(recommended_weight_range_size_142, unk_recommended_weight_range_size_142)).

0.93::acc(s_merchant, effective_edge_150).

% @attr effective_edge_150
% @type numeric
% @unit cm
% @canonical false
% @original_name effective edge 150cm
% @values v113_7=113.7 unk_effective_edge_150=Unknown
% @importance 0.85

0.95::true_val(effective_edge_150, v113_7); 0.05::true_val(effective_edge_150, unk_effective_edge_150).

measured(s_merchant, effective_edge_150, v113_7).

all_consistent(effective_edge_150) :-
    (indep(s_merchant), consistent(s_merchant, effective_edge_150) ; \+indep(s_merchant)).

evidence(all_consistent(effective_edge_150)).
query(true_val(effective_edge_150, v113_7)).
query(true_val(effective_edge_150, unk_effective_edge_150)).

0.93::acc(s_merchant, sidecut_radius_size_150).

% @attr sidecut_radius_size_150
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v7_1=7.1 unk_sidecut_radius_size_150=Unknown
% @importance 0.85

0.95::true_val(sidecut_radius_size_150, v7_1); 0.05::true_val(sidecut_radius_size_150, unk_sidecut_radius_size_150).

measured(s_merchant, sidecut_radius_size_150, v7_1).

all_consistent(sidecut_radius_size_150) :-
    (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_150) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_radius_size_150)).
query(true_val(sidecut_radius_size_150, v7_1)).
query(true_val(sidecut_radius_size_150, unk_sidecut_radius_size_150)).

0.93::acc(s_merchant, waist_width_150).

% @attr waist_width_150
% @type numeric
% @unit mm
% @canonical false
% @original_name waist width 150cm
% @values v245_0=245.0 unk_waist_width_150=Unknown
% @importance 0.85

0.95::true_val(waist_width_150, v245_0); 0.05::true_val(waist_width_150, unk_waist_width_150).

measured(s_merchant, waist_width_150, v245_0).

all_consistent(waist_width_150) :-
    (indep(s_merchant), consistent(s_merchant, waist_width_150) ; \+indep(s_merchant)).

evidence(all_consistent(waist_width_150)).
query(true_val(waist_width_150, v245_0)).
query(true_val(waist_width_150, unk_waist_width_150)).

0.93::acc(s_merchant, recommended_weight_range_size_150).

% @attr recommended_weight_range_size_150
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values w54_82kg=54-82kg unk_recommended_weight_range_size_150=Unknown
% @importance 0.85

0.95::true_val(recommended_weight_range_size_150, w54_82kg); 0.05::true_val(recommended_weight_range_size_150, unk_recommended_weight_range_size_150).

measured(s_merchant, recommended_weight_range_size_150, w54_82kg).

all_consistent(recommended_weight_range_size_150) :-
    (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size_150) ; \+indep(s_merchant)).

evidence(all_consistent(recommended_weight_range_size_150)).
query(true_val(recommended_weight_range_size_150, w54_82kg)).
query(true_val(recommended_weight_range_size_150, unk_recommended_weight_range_size_150)).

0.93::acc(s_merchant, effective_edge_154).

% @attr effective_edge_154
% @type numeric
% @unit cm
% @canonical false
% @original_name effective edge 154cm
% @values v116_8=116.8 unk_effective_edge_154=Unknown
% @importance 0.85

0.95::true_val(effective_edge_154, v116_8); 0.05::true_val(effective_edge_154, unk_effective_edge_154).

measured(s_merchant, effective_edge_154, v116_8).

all_consistent(effective_edge_154) :-
    (indep(s_merchant), consistent(s_merchant, effective_edge_154) ; \+indep(s_merchant)).

evidence(all_consistent(effective_edge_154)).
query(true_val(effective_edge_154, v116_8)).
query(true_val(effective_edge_154, unk_effective_edge_154)).

0.93::acc(s_merchant, sidecut_radius_size).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size
% @values v7_3=7.3 unk_sidecut_radius_size=Unknown
% @importance 0.85

0.95::true_val(sidecut_radius_size, v7_3); 0.05::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s_merchant, sidecut_radius_size, v7_3).

all_consistent(sidecut_radius_size) :-
    (indep(s_merchant), consistent(s_merchant, sidecut_radius_size) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_3)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

0.93::acc(s_merchant, waist_width_154).

% @attr waist_width_154
% @type numeric
% @unit mm
% @canonical false
% @original_name waist width 154cm
% @values v249_0=249.0 unk_waist_width_154=Unknown
% @importance 0.85

0.95::true_val(waist_width_154, v249_0); 0.05::true_val(waist_width_154, unk_waist_width_154).

measured(s_merchant, waist_width_154, v249_0).

all_consistent(waist_width_154) :-
    (indep(s_merchant), consistent(s_merchant, waist_width_154) ; \+indep(s_merchant)).

evidence(all_consistent(waist_width_154)).
query(true_val(waist_width_154, v249_0)).
query(true_val(waist_width_154, unk_waist_width_154)).

0.93::acc(s_merchant, recommended_weight_range_size).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size
% @values w54_82kg=54-82kg unk_recommended_weight_range_size=Unknown
% @importance 0.85

0.95::true_val(recommended_weight_range_size, w54_82kg); 0.05::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s_merchant, recommended_weight_range_size, w54_82kg).

all_consistent(recommended_weight_range_size) :-
    (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size) ; \+indep(s_merchant)).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w54_82kg)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

0.93::acc(s_merchant, effective_edge_162).

% @attr effective_edge_162
% @type numeric
% @unit cm
% @canonical false
% @original_name effective edge 162cm
% @values v123_1=123.1 unk_effective_edge_162=Unknown
% @importance 0.85

0.95::true_val(effective_edge_162, v123_1); 0.05::true_val(effective_edge_162, unk_effective_edge_162).

measured(s_merchant, effective_edge_162, v123_1).

all_consistent(effective_edge_162) :-
    (indep(s_merchant), consistent(s_merchant, effective_edge_162) ; \+indep(s_merchant)).

evidence(all_consistent(effective_edge_162)).
query(true_val(effective_edge_162, v123_1)).
query(true_val(effective_edge_162, unk_effective_edge_162)).

0.93::acc(s_merchant, sidecut_radius_size_162).

% @attr sidecut_radius_size_162
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v7_7=7.7 unk_sidecut_radius_size_162=Unknown
% @importance 0.85

0.95::true_val(sidecut_radius_size_162, v7_7); 0.05::true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162).

measured(s_merchant, sidecut_radius_size_162, v7_7).

all_consistent(sidecut_radius_size_162) :-
    (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_162) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_radius_size_162)).
query(true_val(sidecut_radius_size_162, v7_7)).
query(true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162)).

0.93::acc(s_merchant, waist_width_162).

% @attr waist_width_162
% @type numeric
% @unit mm
% @canonical false
% @original_name waist width 162cm
% @values v257_0=257.0 unk_waist_width_162=Unknown
% @importance 0.85

0.95::true_val(waist_width_162, v257_0); 0.05::true_val(waist_width_162, unk_waist_width_162).

measured(s_merchant, waist_width_162, v257_0).

all_consistent(waist_width_162) :-
    (indep(s_merchant), consistent(s_merchant, waist_width_162) ; \+indep(s_merchant)).

evidence(all_consistent(waist_width_162)).
query(true_val(waist_width_162, v257_0)).
query(true_val(waist_width_162, unk_waist_width_162)).

0.93::acc(s_merchant, recommended_weight_range_size_162).

% @attr recommended_weight_range_size_162
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values w82_118plus=82-118+kg unk_recommended_weight_range_size_162=Unknown
% @importance 0.85

0.95::true_val(recommended_weight_range_size_162, w82_118plus); 0.05::true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162).

measured(s_merchant, recommended_weight_range_size_162, w82_118plus).

all_consistent(recommended_weight_range_size_162) :-
    (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size_162) ; \+indep(s_merchant)).

evidence(all_consistent(recommended_weight_range_size_162)).
query(true_val(recommended_weight_range_size_162, w82_118plus)).
query(true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162)).

0.93::acc(s_merchant, waist_width_158w).

% @attr waist_width_158w
% @type numeric
% @unit mm
% @canonical false
% @original_name waist width 158cm Wide
% @values v261_0=261.0 unk_waist_width_158w=Unknown
% @importance 0.85

0.95::true_val(waist_width_158w, v261_0); 0.05::true_val(waist_width_158w, unk_waist_width_158w).

measured(s_merchant, waist_width_158w, v261_0).

all_consistent(waist_width_158w) :-
    (indep(s_merchant), consistent(s_merchant, waist_width_158w) ; \+indep(s_merchant)).

evidence(all_consistent(waist_width_158w)).
query(true_val(waist_width_158w, v261_0)).
query(true_val(waist_width_158w, unk_waist_width_158w)).

0.93::acc(s_merchant, recommended_weight_range_size_158w).

% @attr recommended_weight_range_size_158w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values w68_91kg=68-91kg unk_recommended_weight_range_size_158w=Unknown
% @importance 0.85

0.95::true_val(recommended_weight_range_size_158w, w68_91kg); 0.05::true_val(recommended_weight_range_size_158w, unk_recommended_weight_range_size_158w).

measured(s_merchant, recommended_weight_range_size_158w, w68_91kg).

all_consistent(recommended_weight_range_size_158w) :-
    (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size_158w) ; \+indep(s_merchant)).

evidence(all_consistent(recommended_weight_range_size_158w)).
query(true_val(recommended_weight_range_size_158w, w68_91kg)).
query(true_val(recommended_weight_range_size_158w, unk_recommended_weight_range_size_158w)).

0.93::acc(s_merchant, waist_width_162w).

% @attr waist_width_162w
% @type numeric
% @unit mm
% @canonical false
% @original_name waist width 162cm Wide
% @values v265_0=265.0 unk_waist_width_162w=Unknown
% @importance 0.85

0.95::true_val(waist_width_162w, v265_0); 0.05::true_val(waist_width_162w, unk_waist_width_162w).

measured(s_merchant, waist_width_162w, v265_0).

all_consistent(waist_width_162w) :-
    (indep(s_merchant), consistent(s_merchant, waist_width_162w) ; \+indep(s_merchant)).

evidence(all_consistent(waist_width_162w)).
query(true_val(waist_width_162w, v265_0)).
query(true_val(waist_width_162w, unk_waist_width_162w)).

0.93::acc(s_merchant, recommended_weight_range_size_162w).

% @attr recommended_weight_range_size_162w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values w82_118plus=82-118+kg unk_recommended_weight_range_size_162w=Unknown
% @importance 0.85

0.95::true_val(recommended_weight_range_size_162w, w82_118plus); 0.05::true_val(recommended_weight_range_size_162w, unk_recommended_weight_range_size_162w).

measured(s_merchant, recommended_weight_range_size_162w, w82_118plus).

all_consistent(recommended_weight_range_size_162w) :-
    (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size_162w) ; \+indep(s_merchant)).

evidence(all_consistent(recommended_weight_range_size_162w)).
query(true_val(recommended_weight_range_size_162w, w82_118plus)).
query(true_val(recommended_weight_range_size_162w, unk_recommended_weight_range_size_162w)).

0.88::acc(s11, deep_thinker_taper_comparison).

% @attr deep_thinker_taper_comparison
% @type categorical
% @canonical false
% @original_name Deep Thinker had 7mm taper vs Counterbalance 8mm
% @values dt_7mm_cb_8mm=Deep_Thinker_7mm_vs_Counterbalance_8mm unk_deep_thinker_taper_comparison=Unknown
% @importance 0.9

0.88::true_val(deep_thinker_taper_comparison, dt_7mm_cb_8mm); 0.12::true_val(deep_thinker_taper_comparison, unk_deep_thinker_taper_comparison).

measured(s11, deep_thinker_taper_comparison, dt_7mm_cb_8mm).

all_consistent(deep_thinker_taper_comparison) :-
    consistent(s11, deep_thinker_taper_comparison).

evidence(all_consistent(deep_thinker_taper_comparison)).
query(true_val(deep_thinker_taper_comparison, dt_7mm_cb_8mm)).
query(true_val(deep_thinker_taper_comparison, unk_deep_thinker_taper_comparison)).