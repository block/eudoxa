0.20::indep(s2).
0.20::indep(s3).
0.15::indep(s5).
0.15::indep(s6).
0.15::indep(s7).
0.25::indep(s8).
0.25::indep(s9).
0.25::indep(s14).
0.15::indep(s16).
0.25::indep(s21).
0.20::indep(s22).
0.20::indep(s24).
0.15::indep(s25).
0.20::indep(s33).
0.15::indep(s34).
0.15::indep(s35).
0.25::indep(s36).
0.20::indep(s37).
0.20::indep(s38).
0.20::indep(s56).
0.25::indep(s58).
0.15::indep(s74).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values burton=Burton unk_brand=Unknown
% @importance 0.93

0.95::true_val(brand, burton); 0.05::true_val(brand, unk_brand).

0.95::acc(s1, brand).
0.80::acc(s2, brand).
0.75::acc(s3, brand).

measured(s1, brand, burton).
measured(s2, brand, burton).
measured(s3, brand, burton).

all_consistent(brand) :-
    consistent(s1, brand),
    (indep(s2), consistent(s2, brand) ; \+indep(s2)),
    (indep(s3), consistent(s3, brand) ; \+indep(s3)).

evidence(all_consistent(brand)).
query(true_val(brand, burton)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values family_tree_smooth_operator=Family_Tree_Smooth_Operator unk_model_name=Unknown
% @importance 0.93

0.95::true_val(model_name, family_tree_smooth_operator); 0.05::true_val(model_name, unk_model_name).

0.95::acc(s1, model_name).
0.80::acc(s2, model_name).
0.75::acc(s3, model_name).

measured(s1, model_name, family_tree_smooth_operator).
measured(s2, model_name, family_tree_smooth_operator).
measured(s3, model_name, family_tree_smooth_operator).

all_consistent(model_name) :-
    consistent(s1, model_name),
    (indep(s2), consistent(s2, model_name) ; \+indep(s2)),
    (indep(s3), consistent(s3, model_name) ; \+indep(s3)).

evidence(all_consistent(model_name)).
query(true_val(model_name, family_tree_smooth_operator)).
query(true_val(model_name, unk_model_name)).

% @attr model_series
% @type categorical
% @canonical true
% @original_name Model series
% @values family_tree_freeride=Family_Tree_freeride_limited_edition unk_model_series=Unknown
% @importance 0.65

0.92::true_val(model_series, family_tree_freeride); 0.08::true_val(model_series, unk_model_series).

0.95::acc(s4, model_series).
0.70::acc(s5, model_series).

measured(s4, model_series, family_tree_freeride).
measured(s5, model_series, family_tree_freeride).

all_consistent(model_series) :-
    consistent(s4, model_series),
    (indep(s5), consistent(s5, model_series) ; \+indep(s5)).

evidence(all_consistent(model_series)).
query(true_val(model_series, family_tree_freeride)).
query(true_val(model_series, unk_model_series)).

% @attr model_year_au
% @type categorical
% @canonical false
% @original_name model_year (AU hemisphere 2027)
% @values v2027=2027 unk_model_year_au=Unknown
% @importance 0.80

0.90::true_val(model_year_au, v2027); 0.10::true_val(model_year_au, unk_model_year_au).

0.80::acc(s6, model_year_au).
0.75::acc(s7, model_year_au).

measured(s6, model_year_au, v2027).
measured(s7, model_year_au, v2027).

all_consistent(model_year_au) :-
    (indep(s6), consistent(s6, model_year_au) ; \+indep(s6)),
    (indep(s7), consistent(s7, model_year_au) ; \+indep(s7)).

evidence(all_consistent(model_year_au)).
query(true_val(model_year_au, v2027)).
query(true_val(model_year_au, unk_model_year_au)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values v2026=2026 unk_model_year=Unknown
% @importance 0.80

0.95::true_val(model_year, v2026); 0.05::true_val(model_year, unk_model_year).

0.85::acc(s8, model_year).
0.85::acc(s9, model_year).

measured(s8, model_year, v2026).
measured(s9, model_year, v2026).

all_consistent(model_year) :-
    (indep(s8), consistent(s8, model_year) ; \+indep(s8)),
    (indep(s9), consistent(s9, model_year) ; \+indep(s9)).

evidence(all_consistent(model_year)).
query(true_val(model_year, v2026)).
query(true_val(model_year, unk_model_year)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2025_2026=2025_2026_NH_season unk_model_first_available_year=Unknown
% @importance 0.70

0.81::true_val(model_first_available_year, season_2025_2026); 0.19::true_val(model_first_available_year, unk_model_first_available_year).

0.93::acc(s10, model_first_available_year).

measured(s10, model_first_available_year, season_2025_2026).

all_consistent(model_first_available_year) :- consistent(s10, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2025_2026)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr new_model_status
% @type categorical
% @canonical false
% @original_name New model status
% @values brand_new=Brand_new_model unk_new_model_status=Unknown
% @importance 0.70

0.71::true_val(new_model_status, brand_new); 0.29::true_val(new_model_status, unk_new_model_status).

0.78::acc(s11, new_model_status).

measured(s11, new_model_status, brand_new).

all_consistent(new_model_status) :- consistent(s11, new_model_status).

evidence(all_consistent(new_model_status)).
query(true_val(new_model_status, brand_new)).
query(true_val(new_model_status, unk_new_model_status)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.00

0.90::true_val(product_type, snowboard); 0.10::true_val(product_type, unk_product_type).

0.95::acc(s1, product_type).

measured(s1, product_type, snowboard).

all_consistent(product_type) :- consistent(s1, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values powder_freeride=Powder_Freeride unk_board_category=Unknown
% @importance 1.00

0.76::true_val(board_category, powder_freeride); 0.24::true_val(board_category, unk_board_category).

0.85::acc(s12, board_category).

measured(s12, board_category, powder_freeride).

all_consistent(board_category) :- consistent(s12, board_category).

evidence(all_consistent(board_category)).
query(true_val(board_category, powder_freeride)).
query(true_val(board_category, unk_board_category)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values masanori_takeuchi=Masanori_Takeuchi unk_pro_rider_name=Unknown
% @importance 0.70

0.95::true_val(pro_rider_name, masanori_takeuchi); 0.05::true_val(pro_rider_name, unk_pro_rider_name).

0.95::acc(s13, pro_rider_name).
0.82::acc(s14, pro_rider_name).

measured(s13, pro_rider_name, masanori_takeuchi).
measured(s14, pro_rider_name, masanori_takeuchi).

all_consistent(pro_rider_name) :-
    consistent(s13, pro_rider_name),
    (indep(s14), consistent(s14, pro_rider_name) ; \+indep(s14)).

evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, masanori_takeuchi)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values burton_snowboards=Burton_Snowboards_1977_Burlington_VT unk_manufacturer=Unknown
% @importance 0.45

0.90::true_val(manufacturer, burton_snowboards); 0.10::true_val(manufacturer, unk_manufacturer).

0.82::acc(s15, manufacturer).
0.70::acc(s16, manufacturer).

measured(s15, manufacturer, burton_snowboards).
measured(s16, manufacturer, burton_snowboards).

all_consistent(manufacturer) :-
    consistent(s15, manufacturer),
    (indep(s16), consistent(s16, manufacturer) ; \+indep(s16)).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, burton_snowboards)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values china_and_austria=China_and_Austria_Keil europe=Europe unk_manufacturing_location_current=Unknown
% @importance 0.63

0.45::true_val(manufacturing_location_current, china_and_austria); 0.45::true_val(manufacturing_location_current, europe); 0.10::true_val(manufacturing_location_current, unk_manufacturing_location_current).

0.78::acc(s17, manufacturing_location_current).
0.65::acc(s18, manufacturing_location_current).
0.88::acc(s19, manufacturing_location_current).

measured(s17, manufacturing_location_current, china_and_austria).
measured(s18, manufacturing_location_current, china_and_austria).
measured(s19, manufacturing_location_current, europe).

all_consistent(manufacturing_location_current) :-
    consistent(s17, manufacturing_location_current),
    consistent(s18, manufacturing_location_current),
    consistent(s19, manufacturing_location_current).

evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, china_and_austria)).
query(true_val(manufacturing_location_current, europe)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

% @attr sustainability_certification_bcorp
% @type categorical
% @canonical false
% @original_name sustainability_certification (B Corp)
% @values b_corporation=Certified_B_Corporation unk_sustainability_certification_bcorp=Unknown
% @importance 0.40

0.71::true_val(sustainability_certification_bcorp, b_corporation); 0.29::true_val(sustainability_certification_bcorp, unk_sustainability_certification_bcorp).

0.88::acc(s20, sustainability_certification_bcorp).

measured(s20, sustainability_certification_bcorp, b_corporation).

all_consistent(sustainability_certification_bcorp) :- consistent(s20, sustainability_certification_bcorp).

evidence(all_consistent(sustainability_certification_bcorp)).
query(true_val(sustainability_certification_bcorp, b_corporation)).
query(true_val(sustainability_certification_bcorp, unk_sustainability_certification_bcorp)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification (FSC)
% @values fsc_c124994=FSC_C124994_certified unk_sustainability_certification=Unknown
% @importance 0.50

0.95::true_val(sustainability_certification, fsc_c124994); 0.05::true_val(sustainability_certification, unk_sustainability_certification).

0.85::acc(s21, sustainability_certification).
0.75::acc(s22, sustainability_certification).

measured(s21, sustainability_certification, fsc_c124994).
measured(s22, sustainability_certification, fsc_c124994).

all_consistent(sustainability_certification) :-
    (indep(s21), consistent(s21, sustainability_certification) ; \+indep(s21)),
    (indep(s22), consistent(s22, sustainability_certification) ; \+indep(s22)).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, fsc_c124994)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values three_year=3_year_warranty_from_purchase unk_warranty=Unknown
% @importance 0.80

0.95::true_val(warranty, three_year); 0.05::true_val(warranty, unk_warranty).

0.95::acc(s23, warranty).
0.75::acc(s24, warranty).
0.75::acc(s25, warranty).

measured(s23, warranty, three_year).
measured(s24, warranty, three_year).
measured(s25, warranty, three_year).

all_consistent(warranty) :-
    consistent(s23, warranty),
    (indep(s24), consistent(s24, warranty) ; \+indep(s24)),
    (indep(s25), consistent(s25, warranty) ; \+indep(s25)).

evidence(all_consistent(warranty)).
query(true_val(warranty, three_year)).
query(true_val(warranty, unk_warranty)).

% @attr warranty_conditions
% @type categorical
% @canonical false
% @original_name warranty (conditions)
% @values original_purchaser_authorized=Original_purchaser_authorized_dealer_only unk_warranty_conditions=Unknown
% @importance 0.70

0.90::true_val(warranty_conditions, original_purchaser_authorized); 0.10::true_val(warranty_conditions, unk_warranty_conditions).

0.95::acc(s26, warranty_conditions).

measured(s26, warranty_conditions, original_purchaser_authorized).

all_consistent(warranty_conditions) :- consistent(s26, warranty_conditions).

evidence(all_consistent(warranty_conditions)).
query(true_val(warranty_conditions, original_purchaser_authorized)).
query(true_val(warranty_conditions, unk_warranty_conditions)).

% @attr topsheet_appearance_description
% @type categorical
% @canonical true
% @original_name topsheet_appearance_description
% @values audubon_bird_themed=Audubon_bird_themed_graphics unk_topsheet_appearance_description=Unknown
% @importance 0.30

0.90::true_val(topsheet_appearance_description, audubon_bird_themed); 0.10::true_val(topsheet_appearance_description, unk_topsheet_appearance_description).

0.95::acc(s27, topsheet_appearance_description).

measured(s27, topsheet_appearance_description, audubon_bird_themed).

all_consistent(topsheet_appearance_description) :- consistent(s27, topsheet_appearance_description).

evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, audubon_bird_themed)).
query(true_val(topsheet_appearance_description, unk_topsheet_appearance_description)).

% @attr topsheet_appearance_description_bird
% @type categorical
% @canonical false
% @original_name topsheet_appearance_description (crested ibis)
% @values crested_ibis=Crested_ibis_graceful_speed unk_topsheet_appearance_description_bird=Unknown
% @importance 0.30

0.71::true_val(topsheet_appearance_description_bird, crested_ibis); 0.29::true_val(topsheet_appearance_description_bird, unk_topsheet_appearance_description_bird).

0.75::acc(s28, topsheet_appearance_description_bird).

measured(s28, topsheet_appearance_description_bird, crested_ibis).

all_consistent(topsheet_appearance_description_bird) :- consistent(s28, topsheet_appearance_description_bird).

evidence(all_consistent(topsheet_appearance_description_bird)).
query(true_val(topsheet_appearance_description_bird, crested_ibis)).
query(true_val(topsheet_appearance_description_bird, unk_topsheet_appearance_description_bird)).

% @attr design_philosophy
% @type categorical
% @canonical false
% @original_name Design philosophy
% @values freeride_off_piste=Freeride_mindset_best_off_piste_turns unk_design_philosophy=Unknown
% @importance 0.60

0.68::true_val(design_philosophy, freeride_off_piste); 0.32::true_val(design_philosophy, unk_design_philosophy).

0.75::acc(s29, design_philosophy).

measured(s29, design_philosophy, freeride_off_piste).

all_consistent(design_philosophy) :- consistent(s29, design_philosophy).

evidence(all_consistent(design_philosophy)).
query(true_val(design_philosophy, freeride_off_piste)).
query(true_val(design_philosophy, unk_design_philosophy)).

% @attr design_inspiration
% @type categorical
% @canonical false
% @original_name Design inspiration
% @values japanese_steep_deep=Japanese_mountain_steep_deep_tree_powder unk_design_inspiration=Unknown
% @importance 0.70

0.72::true_val(design_inspiration, japanese_steep_deep); 0.28::true_val(design_inspiration, unk_design_inspiration).

0.80::acc(s30, design_inspiration).

measured(s30, design_inspiration, japanese_steep_deep).

all_consistent(design_inspiration) :- consistent(s30, design_inspiration).

evidence(all_consistent(design_inspiration)).
query(true_val(design_inspiration, japanese_steep_deep)).
query(true_val(design_inspiration, unk_design_inspiration)).

% @attr base_technology_3d
% @type categorical
% @canonical false
% @original_name 3D base technology
% @values surfboard_concave_tip_tail=Surfboard_concave_tip_tail_traditional_middle unk_base_technology_3d=Unknown
% @importance 0.80

0.71::true_val(base_technology_3d, surfboard_concave_tip_tail); 0.29::true_val(base_technology_3d, unk_base_technology_3d).

0.78::acc(s31, base_technology_3d).

measured(s31, base_technology_3d, surfboard_concave_tip_tail).

all_consistent(base_technology_3d) :- consistent(s31, base_technology_3d).

evidence(all_consistent(base_technology_3d)).
query(true_val(base_technology_3d, surfboard_concave_tip_tail)).
query(true_val(base_technology_3d, unk_base_technology_3d)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values directional=Directional unk_shape=Unknown
% @importance 0.90

0.71::true_val(shape, directional); 0.29::true_val(shape, unk_shape).

0.80::acc(s32, shape).

measured(s32, shape, directional).

all_consistent(shape) :- consistent(s32, shape).

evidence(all_consistent(shape)).
query(true_val(shape, directional)).
query(true_val(shape, unk_shape)).

% @attr taper
% @type numeric
% @canonical true
% @original_name taper
% @unit mm
% @values v10=10.0 unk_taper=Unknown
% @importance 0.85

0.95::true_val(taper, v10); 0.05::true_val(taper, unk_taper).

0.80::acc(s33, taper).
0.78::acc(s34, taper).

measured(s33, taper, v10).
measured(s34, taper, v10).

all_consistent(taper) :-
    (indep(s33), consistent(s33, taper) ; \+indep(s33)),
    (indep(s34), consistent(s34, taper) ; \+indep(s34)).

evidence(all_consistent(taper)).
query(true_val(taper, v10)).
query(true_val(taper, unk_taper)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values directional_camber=Directional_Camber_rockered_nose unk_camber_type=Unknown
% @importance 0.90

0.95::true_val(camber_type, directional_camber); 0.05::true_val(camber_type, unk_camber_type).

0.78::acc(s35, camber_type).
0.85::acc(s36, camber_type).

measured(s35, camber_type, directional_camber).
measured(s36, camber_type, directional_camber).

all_consistent(camber_type) :-
    (indep(s35), consistent(s35, camber_type) ; \+indep(s35)),
    (indep(s36), consistent(s36, camber_type) ; \+indep(s36)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, directional_camber)).
query(true_val(camber_type, unk_camber_type)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @original_name flex_rating_10
% @unit /10
% @values v6_5=6.5 v5_to_8=5-8 unk_flex_rating_10=Unknown
% @importance 0.93

0.55::true_val(flex_rating_10, v6_5); 0.40::true_val(flex_rating_10, v5_to_8); 0.05::true_val(flex_rating_10, unk_flex_rating_10).

0.85::acc(s37, flex_rating_10).
0.75::acc(s38, flex_rating_10).

measured(s37, flex_rating_10, v6_5).
measured(s38, flex_rating_10, v5_to_8).

all_consistent(flex_rating_10) :-
    (indep(s37), consistent(s37, flex_rating_10) ; \+indep(s37)),
    (indep(s38), consistent(s38, flex_rating_10) ; \+indep(s38)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v6_5)).
query(true_val(flex_rating_10, v5_to_8)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values directional_flex=Directional_Flex_pop_tail_stiffer_nose unk_flex_direction=Unknown
% @importance 0.85

0.72::true_val(flex_direction, directional_flex); 0.28::true_val(flex_direction, unk_flex_direction).

0.82::acc(s39, flex_direction).

measured(s39, flex_direction, directional_flex).

all_consistent(flex_direction) :- consistent(s39, flex_direction).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional_flex)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values mid_stiff=Mid_stiff unk_flex_feel=Unknown
% @importance 0.85

0.72::true_val(flex_feel, mid_stiff); 0.28::true_val(flex_feel, unk_flex_feel).

0.82::acc(s40, flex_feel).

measured(s40, flex_feel, mid_stiff).

all_consistent(flex_feel) :- consistent(s40, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, mid_stiff)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr flex_feel_zonal
% @type categorical
% @canonical false
% @original_name flex_feel (zonal breakdown)
% @values tail_stiff_nose_soft=Tail_very_stiff_between_stiff_nose_soft_butterable unk_flex_feel_zonal=Unknown
% @importance 0.80

0.72::true_val(flex_feel_zonal, tail_stiff_nose_soft); 0.28::true_val(flex_feel_zonal, unk_flex_feel_zonal).

0.88::acc(s41, flex_feel_zonal).

measured(s41, flex_feel_zonal, tail_stiff_nose_soft).

all_consistent(flex_feel_zonal) :- consistent(s41, flex_feel_zonal).

evidence(all_consistent(flex_feel_zonal)).
query(true_val(flex_feel_zonal, tail_stiff_nose_soft)).
query(true_val(flex_feel_zonal, unk_flex_feel_zonal)).

% @attr width_options
% @type categorical
% @canonical true
% @original_name width_options
% @values standard=Standard unk_width_options=Unknown
% @importance 1.00

0.76::true_val(width_options, standard); 0.24::true_val(width_options, unk_width_options).

0.85::acc(s37, width_options).

measured(s37, width_options, standard).

all_consistent(width_options) :- consistent(s37, width_options).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard)).
query(true_val(width_options, unk_width_options)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values the_channel=The_Channel_Burton_single_channel_full_length unk_mounting_pattern=Unknown
% @importance 0.90

0.81::true_val(mounting_pattern, the_channel); 0.19::true_val(mounting_pattern, unk_mounting_pattern).

0.87::acc(s42, mounting_pattern).

measured(s42, mounting_pattern, the_channel).

all_consistent(mounting_pattern) :- consistent(s42, mounting_pattern).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, the_channel)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values channel_compatible_est_best=Compatible_most_brands_EST_best unk_binding_compatibility=Unknown
% @importance 0.85

0.76::true_val(binding_compatibility, channel_compatible_est_best); 0.24::true_val(binding_compatibility, unk_binding_compatibility).

0.82::acc(s43, binding_compatibility).

measured(s43, binding_compatibility, channel_compatible_est_best).

all_consistent(binding_compatibility) :- consistent(s43, binding_compatibility).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, channel_compatible_est_best)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

% @attr binding_compatibility_est_note
% @type categorical
% @canonical false
% @original_name binding_compatibility (EST restriction)
% @values est_channel_only=EST_bindings_ONLY_compatible_Burton_Channel unk_binding_compatibility_est_note=Unknown
% @importance 0.80

0.71::true_val(binding_compatibility_est_note, est_channel_only); 0.29::true_val(binding_compatibility_est_note, unk_binding_compatibility_est_note).

0.78::acc(s44, binding_compatibility_est_note).

measured(s44, binding_compatibility_est_note, est_channel_only).

all_consistent(binding_compatibility_est_note) :- consistent(s44, binding_compatibility_est_note).

evidence(all_consistent(binding_compatibility_est_note)).
query(true_val(binding_compatibility_est_note, est_channel_only)).
query(true_val(binding_compatibility_est_note, unk_binding_compatibility_est_note)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values dragonfly_600g_egd_squeezebox=Dragonfly_600G_Core_Multizone_EGD_Squeezebox unk_core_material=Unknown
% @importance 0.90

0.76::true_val(core_material, dragonfly_600g_egd_squeezebox); 0.24::true_val(core_material, unk_core_material).

0.85::acc(s45, core_material).

measured(s45, core_material, dragonfly_600g_egd_squeezebox).

all_consistent(core_material) :- consistent(s45, core_material).

evidence(all_consistent(core_material)).
query(true_val(core_material, dragonfly_600g_egd_squeezebox)).
query(true_val(core_material, unk_core_material)).

% @attr core_material_weight_note
% @type categorical
% @canonical false
% @original_name core_material (weight note)
% @values lightest_core=One_of_lightest_cores_Burton_makes unk_core_material_weight_note=Unknown
% @importance 0.80

0.90::true_val(core_material_weight_note, lightest_core); 0.10::true_val(core_material_weight_note, unk_core_material_weight_note).

0.95::acc(s46, core_material_weight_note).

measured(s46, core_material_weight_note, lightest_core).

all_consistent(core_material_weight_note) :- consistent(s46, core_material_weight_note).

evidence(all_consistent(core_material_weight_note)).
query(true_val(core_material_weight_note, lightest_core)).
query(true_val(core_material_weight_note, unk_core_material_weight_note)).

% @attr core_material_wood_detail
% @type categorical
% @canonical false
% @original_name core_material (wood detail)
% @values dual_species_endgrain=Dual_species_end_grain_woods_impact_zones unk_core_material_wood_detail=Unknown
% @importance 0.70

0.72::true_val(core_material_wood_detail, dual_species_endgrain); 0.28::true_val(core_material_wood_detail, unk_core_material_wood_detail).

0.82::acc(s47, core_material_wood_detail).

measured(s47, core_material_wood_detail, dual_species_endgrain).

all_consistent(core_material_wood_detail) :- consistent(s47, core_material_wood_detail).

evidence(all_consistent(core_material_wood_detail)).
query(true_val(core_material_wood_detail, dual_species_endgrain)).
query(true_val(core_material_wood_detail, unk_core_material_wood_detail)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation (Multizone EGD)
% @values multizone_egd=Multizone_EGD_perpendicular_grain_4_zones_channel unk_construction_material_innovation=Unknown
% @importance 0.70

0.76::true_val(construction_material_innovation, multizone_egd); 0.24::true_val(construction_material_innovation, unk_construction_material_innovation).

0.82::acc(s48, construction_material_innovation).

measured(s48, construction_material_innovation, multizone_egd).

all_consistent(construction_material_innovation) :- consistent(s48, construction_material_innovation).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, multizone_egd)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr construction_material_innovation_squeezebox
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Squeezebox)
% @values squeezebox=Squeezebox_thick_thin_profiled_core_pop unk_construction_material_innovation_squeezebox=Unknown
% @importance 0.70

0.81::true_val(construction_material_innovation_squeezebox, squeezebox); 0.19::true_val(construction_material_innovation_squeezebox, unk_construction_material_innovation_squeezebox).

0.85::acc(s49, construction_material_innovation_squeezebox).

measured(s49, construction_material_innovation_squeezebox, squeezebox).

all_consistent(construction_material_innovation_squeezebox) :- consistent(s49, construction_material_innovation_squeezebox).

evidence(all_consistent(construction_material_innovation_squeezebox)).
query(true_val(construction_material_innovation_squeezebox, squeezebox)).
query(true_val(construction_material_innovation_squeezebox, unk_construction_material_innovation_squeezebox)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values carbon_highlights_45=45_degree_Carbon_Highlights_tip_to_tail unk_laminate=Unknown
% @importance 0.80

0.81::true_val(laminate, carbon_highlights_45); 0.19::true_val(laminate, unk_laminate).

0.85::acc(s50, laminate).

measured(s50, laminate, carbon_highlights_45).

all_consistent(laminate) :- consistent(s50, laminate).

evidence(all_consistent(laminate)).
query(true_val(laminate, carbon_highlights_45)).
query(true_val(laminate, unk_laminate)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_wfo=Sintered_WFO_high_density_wax_infused unk_base_material=Unknown
% @importance 0.80

0.81::true_val(base_material, sintered_wfo); 0.19::true_val(base_material, unk_base_material).

0.85::acc(s51, base_material).

measured(s51, base_material, sintered_wfo).

all_consistent(base_material) :- consistent(s51, base_material).

evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_wfo)).
query(true_val(base_material, unk_base_material)).

% @attr resin
% @type categorical
% @canonical true
% @original_name resin
% @values super_sap_epoxy=Super_Sap_bio_based_50pct_lower_carbon unk_resin=Unknown
% @importance 0.50

0.76::true_val(resin, super_sap_epoxy); 0.24::true_val(resin, unk_resin).

0.82::acc(s52, resin).

measured(s52, resin, super_sap_epoxy).

all_consistent(resin) :- consistent(s52, resin).

evidence(all_consistent(resin)).
query(true_val(resin, super_sap_epoxy)).
query(true_val(resin, unk_resin)).

% @attr construction_material_innovation_infinite_ride
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Infinite Ride)
% @values infinite_ride=Infinite_Ride_overbuilt_broken_in_consistent_flex unk_construction_material_innovation_infinite_ride=Unknown
% @importance 0.70

0.77::true_val(construction_material_innovation_infinite_ride, infinite_ride); 0.23::true_val(construction_material_innovation_infinite_ride, unk_construction_material_innovation_infinite_ride).

0.85::acc(s53, construction_material_innovation_infinite_ride).

measured(s53, construction_material_innovation_infinite_ride, infinite_ride).

all_consistent(construction_material_innovation_infinite_ride) :- consistent(s53, construction_material_innovation_infinite_ride).

evidence(all_consistent(construction_material_innovation_infinite_ride)).
query(true_val(construction_material_innovation_infinite_ride, infinite_ride)).
query(true_val(construction_material_innovation_infinite_ride, unk_construction_material_innovation_infinite_ride)).

% @attr balanced_freeride_geometry
% @type categorical
% @canonical false
% @original_name Balanced Freeride Geometry
% @values setback_camber_centred_sidecut=Setback_camber_stance_centred_sidecut unk_balanced_freeride_geometry=Unknown
% @importance 0.80

0.77::true_val(balanced_freeride_geometry, setback_camber_centred_sidecut); 0.23::true_val(balanced_freeride_geometry, unk_balanced_freeride_geometry).

0.85::acc(s54, balanced_freeride_geometry).

measured(s54, balanced_freeride_geometry, setback_camber_centred_sidecut).

all_consistent(balanced_freeride_geometry) :- consistent(s54, balanced_freeride_geometry).

evidence(all_consistent(balanced_freeride_geometry)).
query(true_val(balanced_freeride_geometry, setback_camber_centred_sidecut)).
query(true_val(balanced_freeride_geometry, unk_balanced_freeride_geometry)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes (full range)
% @values s144_148_152_156_160_164=144_148_152_156_160_164cm unk_available_sizes=Unknown
% @importance 1.00

0.76::true_val(available_sizes, s144_148_152_156_160_164); 0.24::true_val(available_sizes, unk_available_sizes).

0.85::acc(s37, available_sizes).

measured(s37, available_sizes, s144_148_152_156_160_164).

all_consistent(available_sizes) :- consistent(s37, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, s144_148_152_156_160_164)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr available_sizes_limited
% @type categorical
% @canonical false
% @original_name available_sizes (limited/in-stock)
% @values s152_156=152_156cm unk_available_sizes_limited=Unknown
% @importance 1.00

0.76::true_val(available_sizes_limited, s152_156); 0.24::true_val(available_sizes_limited, unk_available_sizes_limited).

0.82::acc(s37, available_sizes_limited).

measured(s37, available_sizes_limited, s152_156).

all_consistent(available_sizes_limited) :- consistent(s37, available_sizes_limited).

evidence(all_consistent(available_sizes_limited)).
query(true_val(available_sizes_limited, s152_156)).
query(true_val(available_sizes_limited, unk_available_sizes_limited)).

% @attr setback
% @type numeric
% @canonical true
% @original_name setback
% @unit mm
% @values v_neg12_5=-12.5 unk_setback=Unknown
% @importance 0.90

0.95::true_val(setback, v_neg12_5); 0.05::true_val(setback, unk_setback).

0.85::acc(s37, setback).
0.88::acc(s55, setback).

measured(s37, setback, v_neg12_5).
measured(s55, setback, v_neg12_5).

all_consistent(setback) :-
    (indep(s37), consistent(s37, setback) ; \+indep(s37)),
    consistent(s55, setback).

evidence(all_consistent(setback)).
query(true_val(setback, v_neg12_5)).
query(true_val(setback, unk_setback)).

% @attr effective_edge_144
% @type numeric
% @canonical false
% @original_name Effective edge 144cm
% @unit cm
% @values v108_5=108.5 unk_effective_edge_144=Unknown
% @importance 1.00

0.76::true_val(effective_edge_144, v108_5); 0.24::true_val(effective_edge_144, unk_effective_edge_144).

0.85::acc(s37, effective_edge_144).

measured(s37, effective_edge_144, v108_5).

all_consistent(effective_edge_144) :- consistent(s37, effective_edge_144).

evidence(all_consistent(effective_edge_144)).
query(true_val(effective_edge_144, v108_5)).
query(true_val(effective_edge_144, unk_effective_edge_144)).

% @attr effective_edge_148
% @type numeric
% @canonical false
% @original_name Effective edge 148cm
% @unit cm
% @values v111_5=111.5 unk_effective_edge_148=Unknown
% @importance 1.00

0.76::true_val(effective_edge_148, v111_5); 0.24::true_val(effective_edge_148, unk_effective_edge_148).

0.85::acc(s37, effective_edge_148).

measured(s37, effective_edge_148, v111_5).

all_consistent(effective_edge_148) :- consistent(s37, effective_edge_148).

evidence(all_consistent(effective_edge_148)).
query(true_val(effective_edge_148, v111_5)).
query(true_val(effective_edge_148, unk_effective_edge_148)).

% @attr effective_edge_152
% @type numeric
% @canonical false
% @original_name Effective edge 152cm
% @unit cm
% @values v114_5=114.5 unk_effective_edge_152=Unknown
% @importance 1.00

0.76::true_val(effective_edge_152, v114_5); 0.24::true_val(effective_edge_152, unk_effective_edge_152).

0.85::acc(s37, effective_edge_152).

measured(s37, effective_edge_152, v114_5).

all_consistent(effective_edge_152) :- consistent(s37, effective_edge_152).

evidence(all_consistent(effective_edge_152)).
query(true_val(effective_edge_152, v114_5)).
query(true_val(effective_edge_152, unk_effective_edge_152)).

% @attr effective_edge_156
% @type numeric
% @canonical false
% @original_name Effective edge 156cm
% @unit cm
% @values v117_5=117.5 unk_effective_edge_156=Unknown
% @importance 1.00

0.76::true_val(effective_edge_156, v117_5); 0.24::true_val(effective_edge_156, unk_effective_edge_156).

0.85::acc(s37, effective_edge_156).

measured(s37, effective_edge_156, v117_5).

all_consistent(effective_edge_156) :- consistent(s37, effective_edge_156).

evidence(all_consistent(effective_edge_156)).
query(true_val(effective_edge_156, v117_5)).
query(true_val(effective_edge_156, unk_effective_edge_156)).

% @attr effective_edge_160
% @type numeric
% @canonical false
% @original_name Effective edge 160cm
% @unit cm
% @values v120_5=120.5 unk_effective_edge_160=Unknown
% @importance 1.00

0.76::true_val(effective_edge_160, v120_5); 0.24::true_val(effective_edge_160, unk_effective_edge_160).

0.85::acc(s37, effective_edge_160).

measured(s37, effective_edge_160, v120_5).

all_consistent(effective_edge_160) :- consistent(s37, effective_edge_160).

evidence(all_consistent(effective_edge_160)).
query(true_val(effective_edge_160, v120_5)).
query(true_val(effective_edge_160, unk_effective_edge_160)).

% @attr effective_edge_164
% @type numeric
% @canonical false
% @original_name Effective edge 164cm
% @unit cm
% @values v123_5=123.5 unk_effective_edge_164=Unknown
% @importance 1.00

0.76::true_val(effective_edge_164, v123_5); 0.24::true_val(effective_edge_164, unk_effective_edge_164).

0.85::acc(s37, effective_edge_164).

measured(s37, effective_edge_164, v123_5).

all_consistent(effective_edge_164) :- consistent(s37, effective_edge_164).

evidence(all_consistent(effective_edge_164)).
query(true_val(effective_edge_164, v123_5)).
query(true_val(effective_edge_164, unk_effective_edge_164)).

% @attr sidecut_radius_size_144
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (144cm)
% @unit m
% @values v8_1=8.1 unk_sidecut_radius_size_144=Unknown
% @importance 1.00

0.76::true_val(sidecut_radius_size_144, v8_1); 0.24::true_val(sidecut_radius_size_144, unk_sidecut_radius_size_144).

0.85::acc(s37, sidecut_radius_size_144).

measured(s37, sidecut_radius_size_144, v8_1).

all_consistent(sidecut_radius_size_144) :- consistent(s37, sidecut_radius_size_144).

evidence(all_consistent(sidecut_radius_size_144)).
query(true_val(sidecut_radius_size_144, v8_1)).
query(true_val(sidecut_radius_size_144, unk_sidecut_radius_size_144)).

% @attr sidecut_radius_size_148
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (148cm)
% @unit m
% @values v8_4=8.4 unk_sidecut_radius_size_148=Unknown
% @importance 1.00

0.76::true_val(sidecut_radius_size_148, v8_4); 0.24::true_val(sidecut_radius_size_148, unk_sidecut_radius_size_148).

0.85::acc(s37, sidecut_radius_size_148).

measured(s37, sidecut_radius_size_148, v8_4).

all_consistent(sidecut_radius_size_148) :- consistent(s37, sidecut_radius_size_148).

evidence(all_consistent(sidecut_radius_size_148)).
query(true_val(sidecut_radius_size_148, v8_4)).
query(true_val(sidecut_radius_size_148, unk_sidecut_radius_size_148)).

% @attr sidecut_radius_size_152
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (152cm)
% @unit m
% @values v8_6=8.6 unk_sidecut_radius_size_152=Unknown
% @importance 1.00

0.76::true_val(sidecut_radius_size_152, v8_6); 0.24::true_val(sidecut_radius_size_152, unk_sidecut_radius_size_152).

0.85::acc(s37, sidecut_radius_size_152).

measured(s37, sidecut_radius_size_152, v8_6).

all_consistent(sidecut_radius_size_152) :- consistent(s37, sidecut_radius_size_152).

evidence(all_consistent(sidecut_radius_size_152)).
query(true_val(sidecut_radius_size_152, v8_6)).
query(true_val(sidecut_radius_size_152, unk_sidecut_radius_size_152)).

% @attr sidecut_radius_size
% @type numeric
% @canonical true
% @original_name sidecut_radius_size (156cm)
% @unit m
% @values v8_8=8.8 unk_sidecut_radius_size=Unknown
% @importance 1.00

0.76::true_val(sidecut_radius_size, v8_8); 0.24::true_val(sidecut_radius_size, unk_sidecut_radius_size).

0.85::acc(s37, sidecut_radius_size).

measured(s37, sidecut_radius_size, v8_8).

all_consistent(sidecut_radius_size) :- consistent(s37, sidecut_radius_size).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v8_8)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr sidecut_radius_size_160
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (160cm)
% @unit m
% @values v9_1=9.1 unk_sidecut_radius_size_160=Unknown
% @importance 1.00

0.76::true_val(sidecut_radius_size_160, v9_1); 0.24::true_val(sidecut_radius_size_160, unk_sidecut_radius_size_160).

0.85::acc(s37, sidecut_radius_size_160).

measured(s37, sidecut_radius_size_160, v9_1).

all_consistent(sidecut_radius_size_160) :- consistent(s37, sidecut_radius_size_160).

evidence(all_consistent(sidecut_radius_size_160)).
query(true_val(sidecut_radius_size_160, v9_1)).
query(true_val(sidecut_radius_size_160, unk_sidecut_radius_size_160)).

% @attr sidecut_radius_size_164
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (164cm)
% @unit m
% @values v9_3=9.3 unk_sidecut_radius_size_164=Unknown
% @importance 1.00

0.76::true_val(sidecut_radius_size_164, v9_3); 0.24::true_val(sidecut_radius_size_164, unk_sidecut_radius_size_164).

0.85::acc(s37, sidecut_radius_size_164).

measured(s37, sidecut_radius_size_164, v9_3).

all_consistent(sidecut_radius_size_164) :- consistent(s37, sidecut_radius_size_164).

evidence(all_consistent(sidecut_radius_size_164)).
query(true_val(sidecut_radius_size_164, v9_3)).
query(true_val(sidecut_radius_size_164, unk_sidecut_radius_size_164)).

% @attr tip_width_152
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (nose 152cm)
% @unit cm
% @values v28_56=28.56 unk_tip_width_152=Unknown
% @importance 1.00

0.76::true_val(tip_width_152, v28_56); 0.24::true_val(tip_width_152, unk_tip_width_152).

0.85::acc(s37, tip_width_152).

measured(s37, tip_width_152, v28_56).

all_consistent(tip_width_152) :- consistent(s37, tip_width_152).

evidence(all_consistent(tip_width_152)).
query(true_val(tip_width_152, v28_56)).
query(true_val(tip_width_152, unk_tip_width_152)).

% @attr tail_width_152
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (tail 152cm)
% @unit cm
% @values v27_56=27.56 unk_tail_width_152=Unknown
% @importance 1.00

0.76::true_val(tail_width_152, v27_56); 0.24::true_val(tail_width_152, unk_tail_width_152).

0.85::acc(s37, tail_width_152).

measured(s37, tail_width_152, v27_56).

all_consistent(tail_width_152) :- consistent(s37, tail_width_152).

evidence(all_consistent(tail_width_152)).
query(true_val(tail_width_152, v27_56)).
query(true_val(tail_width_152, unk_tail_width_152)).

% @attr waist_width_152
% @type numeric
% @canonical false
% @original_name Waist width 152cm
% @unit cm
% @values v24_7=24.7 unk_waist_width_152=Unknown
% @importance 1.00

0.76::true_val(waist_width_152, v24_7); 0.24::true_val(waist_width_152, unk_waist_width_152).

0.85::acc(s37, waist_width_152).

measured(s37, waist_width_152, v24_7).

all_consistent(waist_width_152) :- consistent(s37, waist_width_152).

evidence(all_consistent(waist_width_152)).
query(true_val(waist_width_152, v24_7)).
query(true_val(waist_width_152, unk_waist_width_152)).

% @attr tip_tail_width_size
% @type numeric
% @canonical true
% @original_name tip_tail_width_size (nose 156cm)
% @unit cm
% @values v29_06=29.06 unk_tip_tail_width_size=Unknown
% @importance 1.00

0.76::true_val(tip_tail_width_size, v29_06); 0.24::true_val(tip_tail_width_size, unk_tip_tail_width_size).

0.85::acc(s37, tip_tail_width_size).

measured(s37, tip_tail_width_size, v29_06).

all_consistent(tip_tail_width_size) :- consistent(s37, tip_tail_width_size).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v29_06)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr tail_width_156
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (tail 156cm)
% @unit cm
% @values v28_06=28.06 unk_tail_width_156=Unknown
% @importance 1.00

0.76::true_val(tail_width_156, v28_06); 0.24::true_val(tail_width_156, unk_tail_width_156).

0.85::acc(s37, tail_width_156).

measured(s37, tail_width_156, v28_06).

all_consistent(tail_width_156) :- consistent(s37, tail_width_156).

evidence(all_consistent(tail_width_156)).
query(true_val(tail_width_156, v28_06)).
query(true_val(tail_width_156, unk_tail_width_156)).

% @attr waist_width_156
% @type numeric
% @canonical false
% @original_name Waist width 156cm
% @unit cm
% @values v25_1=25.1 unk_waist_width_156=Unknown
% @importance 0.93

0.95::true_val(waist_width_156, v25_1); 0.05::true_val(waist_width_156, unk_waist_width_156).

0.85::acc(s37, waist_width_156).
0.78::acc(s56, waist_width_156).

measured(s37, waist_width_156, v25_1).
measured(s56, waist_width_156, v25_1).

all_consistent(waist_width_156) :-
    (indep(s37), consistent(s37, waist_width_156) ; \+indep(s37)),
    (indep(s56), consistent(s56, waist_width_156) ; \+indep(s56)).

evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v25_1)).
query(true_val(waist_width_156, unk_waist_width_156)).

% @attr stance_width_range_size_small
% @type numeric
% @canonical false
% @original_name stance_width_range_size (small sizes)
% @unit cm
% @values v51_0=51.0 unk_stance_width_range_size_small=Unknown
% @importance 1.00

0.76::true_val(stance_width_range_size_small, v51_0); 0.24::true_val(stance_width_range_size_small, unk_stance_width_range_size_small).

0.85::acc(s37, stance_width_range_size_small).

measured(s37, stance_width_range_size_small, v51_0).

all_consistent(stance_width_range_size_small) :- consistent(s37, stance_width_range_size_small).

evidence(all_consistent(stance_width_range_size_small)).
query(true_val(stance_width_range_size_small, v51_0)).
query(true_val(stance_width_range_size_small, unk_stance_width_range_size_small)).

% @attr stance_width_range_size
% @type numeric
% @canonical true
% @original_name stance_width_range_size (156cm+)
% @unit cm
% @values v54_0=54.0 unk_stance_width_range_size=Unknown
% @importance 1.00

0.76::true_val(stance_width_range_size, v54_0); 0.24::true_val(stance_width_range_size, unk_stance_width_range_size).

0.85::acc(s37, stance_width_range_size).

measured(s37, stance_width_range_size, v54_0).

all_consistent(stance_width_range_size) :- consistent(s37, stance_width_range_size).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v54_0)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr recommended_weight_range_size_small
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (small sizes)
% @unit kg
% @values w54_82=54-82kg unk_recommended_weight_range_size_small=Unknown
% @importance 1.00

0.76::true_val(recommended_weight_range_size_small, w54_82); 0.24::true_val(recommended_weight_range_size_small, unk_recommended_weight_range_size_small).

0.85::acc(s37, recommended_weight_range_size_small).

measured(s37, recommended_weight_range_size_small, w54_82).

all_consistent(recommended_weight_range_size_small) :- consistent(s37, recommended_weight_range_size_small).

evidence(all_consistent(recommended_weight_range_size_small)).
query(true_val(recommended_weight_range_size_small, w54_82)).
query(true_val(recommended_weight_range_size_small, unk_recommended_weight_range_size_small)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size (156cm+)
% @unit kg
% @values w68_91=68-91kg unk_recommended_weight_range_size=Unknown
% @importance 1.00

0.76::true_val(recommended_weight_range_size, w68_91); 0.24::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

0.85::acc(s37, recommended_weight_range_size).

measured(s37, recommended_weight_range_size, w68_91).

all_consistent(recommended_weight_range_size) :- consistent(s37, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w68_91)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr terrain_suitability_park
% @type numeric
% @canonical false
% @original_name terrain_suitability (Park)
% @unit /10
% @values v1=1.0 unk_terrain_suitability_park=Unknown
% @importance 1.00

0.76::true_val(terrain_suitability_park, v1); 0.24::true_val(terrain_suitability_park, unk_terrain_suitability_park).

0.85::acc(s37, terrain_suitability_park).

measured(s37, terrain_suitability_park, v1).

all_consistent(terrain_suitability_park) :- consistent(s37, terrain_suitability_park).

evidence(all_consistent(terrain_suitability_park)).
query(true_val(terrain_suitability_park, v1)).
query(true_val(terrain_suitability_park, unk_terrain_suitability_park)).

% @attr terrain_suitability_all_mountain
% @type numeric
% @canonical false
% @original_name terrain_suitability (All Mountain)
% @unit /10
% @values v7=7.0 unk_terrain_suitability_all_mountain=Unknown
% @importance 1.00

0.76::true_val(terrain_suitability_all_mountain, v7); 0.24::true_val(terrain_suitability_all_mountain, unk_terrain_suitability_all_mountain).

0.85::acc(s37, terrain_suitability_all_mountain).

measured(s37, terrain_suitability_all_mountain, v7).

all_consistent(terrain_suitability_all_mountain) :- consistent(s37, terrain_suitability_all_mountain).

evidence(all_consistent(terrain_suitability_all_mountain)).
query(true_val(terrain_suitability_all_mountain, v7)).
query(true_val(terrain_suitability_all_mountain, unk_terrain_suitability_all_mountain)).

% @attr terrain_suitability
% @type numeric
% @canonical true
% @original_name terrain_suitability (Powder)
% @unit /10
% @values v10=10.0 unk_terrain_suitability=Unknown
% @importance 1.00

0.76::true_val(terrain_suitability, v10); 0.24::true_val(terrain_suitability, unk_terrain_suitability).

0.85::acc(s37, terrain_suitability).

measured(s37, terrain_suitability, v10).

all_consistent(terrain_suitability) :- consistent(s37, terrain_suitability).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, v10)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values unisex=Unisex unk_gender=Unknown
% @importance 0.70

0.81::true_val(gender, unisex); 0.19::true_val(gender, unk_gender).

0.87::acc(s57, gender).

measured(s57, gender, unisex).

all_consistent(gender) :- consistent(s57, gender).

evidence(all_consistent(gender)).
query(true_val(gender, unisex)).
query(true_val(gender, unk_gender)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values intermediate_advanced=Intermediate_Advanced expert=Expert
% @importance 0.90

0.30::true_val(skill_level_recommendation, intermediate_advanced); 0.70::true_val(skill_level_recommendation, expert).

0.80::acc(s37, skill_level_recommendation).
0.87::acc(s58, skill_level_recommendation).
0.78::acc(s56, skill_level_recommendation).

measured(s37, skill_level_recommendation, intermediate_advanced).
measured(s58, skill_level_recommendation, expert).
measured(s56, skill_level_recommendation, expert).

all_consistent(skill_level_recommendation) :-
    (indep(s37), consistent(s37, skill_level_recommendation) ; \+indep(s37)),
    (indep(s58), consistent(s58, skill_level_recommendation) ; \+indep(s58)),
    (indep(s56), consistent(s56, skill_level_recommendation) ; \+indep(s56)).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, intermediate_advanced)).
query(true_val(skill_level_recommendation, expert)).

% @attr price_aud_melbourne
% @type numeric
% @canonical false
% @original_name price_aud_merchant (Melbourne preorder)
% @unit AUD
% @values v1299_99=1299.99 unk_price_aud_melbourne=Unknown
% @importance 1.00

0.76::true_val(price_aud_melbourne, v1299_99); 0.24::true_val(price_aud_melbourne, unk_price_aud_melbourne).

0.85::acc(s37, price_aud_melbourne).

measured(s37, price_aud_melbourne, v1299_99).

all_consistent(price_aud_melbourne) :- consistent(s37, price_aud_melbourne).

evidence(all_consistent(price_aud_melbourne)).
query(true_val(price_aud_melbourne, v1299_99)).
query(true_val(price_aud_melbourne, unk_price_aud_melbourne)).

% @attr price_aud_merchant
% @type numeric
% @canonical true
% @original_name price_aud_merchant (Balmoral)
% @unit AUD
% @values v1199_99=1199.99 unk_price_aud_merchant=Unknown
% @importance 0.90

0.68::true_val(price_aud_merchant, v1199_99); 0.32::true_val(price_aud_merchant, unk_price_aud_merchant).

0.80::acc(s59, price_aud_merchant).

measured(s59, price_aud_merchant, v1199_99).

all_consistent(price_aud_merchant) :- consistent(s59, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v1199_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v899_95=899.95 unk_price_usd_msrp=Unknown
% @importance 0.95

0.77::true_val(price_usd_msrp, v899_95); 0.23::true_val(price_usd_msrp, unk_price_usd_msrp).

0.88::acc(s60, price_usd_msrp).

measured(s60, price_usd_msrp, v899_95).

all_consistent(price_usd_msrp) :- consistent(s60, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v899_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_usd_evo
% @type numeric
% @canonical true
% @original_name price_usd_evo
% @unit USD
% @values v899_95=899.95 unk_price_usd_evo=Unknown
% @importance 0.95

0.77::true_val(price_usd_evo, v899_95); 0.23::true_val(price_usd_evo, unk_price_usd_evo).

0.88::acc(s61, price_usd_evo).

measured(s61, price_usd_evo, v899_95).

all_consistent(price_usd_evo) :- consistent(s61, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v899_95)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_backcountry
% @type numeric
% @canonical true
% @original_name price_usd_backcountry
% @unit USD
% @values v899_95=899.95 unk_price_usd_backcountry=Unknown
% @importance 0.95

0.77::true_val(price_usd_backcountry, v899_95); 0.23::true_val(price_usd_backcountry, unk_price_usd_backcountry).

0.88::acc(s62, price_usd_backcountry).

measured(s62, price_usd_backcountry, v899_95).

all_consistent(price_usd_backcountry) :- consistent(s62, price_usd_backcountry).

evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v899_95)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

% @attr price_usd_tactics
% @type numeric
% @canonical true
% @original_name price_usd_tactics
% @unit USD
% @values v899_95=899.95 unk_price_usd_tactics=Unknown
% @importance 0.90

0.77::true_val(price_usd_tactics, v899_95); 0.23::true_val(price_usd_tactics, unk_price_usd_tactics).

0.88::acc(s63, price_usd_tactics).

measured(s63, price_usd_tactics, v899_95).

all_consistent(price_usd_tactics) :- consistent(s63, price_usd_tactics).

evidence(all_consistent(price_usd_tactics)).
query(true_val(price_usd_tactics, v899_95)).
query(true_val(price_usd_tactics, unk_price_usd_tactics)).

% @attr price_usd_gravity_coalition
% @type numeric
% @canonical false
% @original_name Price (USD, Gravity Coalition)
% @unit USD
% @values v699_97=699.97 unk_price_usd_gravity_coalition=Unknown
% @importance 0.90

0.77::true_val(price_usd_gravity_coalition, v699_97); 0.23::true_val(price_usd_gravity_coalition, unk_price_usd_gravity_coalition).

0.88::acc(s64, price_usd_gravity_coalition).

measured(s64, price_usd_gravity_coalition, v699_97).

all_consistent(price_usd_gravity_coalition) :- consistent(s64, price_usd_gravity_coalition).

evidence(all_consistent(price_usd_gravity_coalition)).
query(true_val(price_usd_gravity_coalition, v699_97)).
query(true_val(price_usd_gravity_coalition, unk_price_usd_gravity_coalition)).

% @attr price_usd_snowboard_mag
% @type numeric
% @canonical false
% @original_name Price (USD, Snowboard Magazine)
% @unit USD
% @values v849_95=849.95 unk_price_usd_snowboard_mag=Unknown
% @importance 0.90

0.77::true_val(price_usd_snowboard_mag, v849_95); 0.23::true_val(price_usd_snowboard_mag, unk_price_usd_snowboard_mag).

0.85::acc(s65, price_usd_snowboard_mag).

measured(s65, price_usd_snowboard_mag, v849_95).

all_consistent(price_usd_snowboard_mag) :- consistent(s65, price_usd_snowboard_mag).

evidence(all_consistent(price_usd_snowboard_mag)).
query(true_val(price_usd_snowboard_mag, v849_95)).
query(true_val(price_usd_snowboard_mag, unk_price_usd_snowboard_mag)).

% @attr price_usd_tgr_list
% @type numeric
% @canonical false
% @original_name Price (USD, The Good Ride list price)
% @unit USD
% @values v899=899.0 unk_price_usd_tgr_list=Unknown
% @importance 0.90

0.77::true_val(price_usd_tgr_list, v899); 0.23::true_val(price_usd_tgr_list, unk_price_usd_tgr_list).

0.88::acc(s66, price_usd_tgr_list).

measured(s66, price_usd_tgr_list, v899).

all_consistent(price_usd_tgr_list) :- consistent(s66, price_usd_tgr_list).

evidence(all_consistent(price_usd_tgr_list)).
query(true_val(price_usd_tgr_list, v899)).
query(true_val(price_usd_tgr_list, unk_price_usd_tgr_list)).

% @attr price_cad_burton_canada
% @type numeric
% @canonical false
% @original_name Price (CAD, Burton Canada)
% @unit CAD
% @values v1099_99=1099.99 unk_price_cad_burton_canada=Unknown
% @importance 0.90

0.77::true_val(price_cad_burton_canada, v1099_99); 0.23::true_val(price_cad_burton_canada, unk_price_cad_burton_canada).

0.88::acc(s67, price_cad_burton_canada).

measured(s67, price_cad_burton_canada, v1099_99).

all_consistent(price_cad_burton_canada) :- consistent(s67, price_cad_burton_canada).

evidence(all_consistent(price_cad_burton_canada)).
query(true_val(price_cad_burton_canada, v1099_99)).
query(true_val(price_cad_burton_canada, unk_price_cad_burton_canada)).

% @attr price_cad_prfo
% @type numeric
% @canonical true
% @original_name price_cad_prfo
% @unit CAD
% @values v1099_99=1099.99 unk_price_cad_prfo=Unknown
% @importance 0.90

0.77::true_val(price_cad_prfo, v1099_99); 0.23::true_val(price_cad_prfo, unk_price_cad_prfo).

0.88::acc(s68, price_cad_prfo).

measured(s68, price_cad_prfo, v1099_99).

all_consistent(price_cad_prfo) :- consistent(s68, price_cad_prfo).

evidence(all_consistent(price_cad_prfo)).
query(true_val(price_cad_prfo, v1099_99)).
query(true_val(price_cad_prfo, unk_price_cad_prfo)).

% @attr price_eur_blue_tomato
% @type numeric
% @canonical true
% @original_name price_eur_blue_tomato
% @unit EUR
% @values v879_95=879.95 unk_price_eur_blue_tomato=Unknown
% @importance 0.90

0.77::true_val(price_eur_blue_tomato, v879_95); 0.23::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).

0.88::acc(s69, price_eur_blue_tomato).

measured(s69, price_eur_blue_tomato, v879_95).

all_consistent(price_eur_blue_tomato) :- consistent(s69, price_eur_blue_tomato).

evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v879_95)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

% @attr price_eur_snowcountry
% @type numeric
% @canonical false
% @original_name Price (EUR, SnowCountry)
% @unit EUR
% @values v799=799.0 unk_price_eur_snowcountry=Unknown
% @importance 0.90

0.77::true_val(price_eur_snowcountry, v799); 0.23::true_val(price_eur_snowcountry, unk_price_eur_snowcountry).

0.88::acc(s70, price_eur_snowcountry).

measured(s70, price_eur_snowcountry, v799).

all_consistent(price_eur_snowcountry) :- consistent(s70, price_eur_snowcountry).

evidence(all_consistent(price_eur_snowcountry)).
query(true_val(price_eur_snowcountry, v799)).
query(true_val(price_eur_snowcountry, unk_price_eur_snowcountry)).

% @attr price_gbp_blue_tomato_uk
% @type numeric
% @canonical true
% @original_name price_gbp_blue_tomato_uk
% @unit GBP
% @values v785=785.0 unk_price_gbp_blue_tomato_uk=Unknown
% @importance 0.85

0.77::true_val(price_gbp_blue_tomato_uk, v785); 0.23::true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk).

0.88::acc(s71, price_gbp_blue_tomato_uk).

measured(s71, price_gbp_blue_tomato_uk, v785).

all_consistent(price_gbp_blue_tomato_uk) :- consistent(s71, price_gbp_blue_tomato_uk).

evidence(all_consistent(price_gbp_blue_tomato_uk)).
query(true_val(price_gbp_blue_tomato_uk, v785)).
query(true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk)).

% @attr price_sek_blue_tomato
% @type numeric
% @canonical false
% @original_name Price (SEK, Blue Tomato Sweden)
% @unit SEK
% @values v9999=9999.0 unk_price_sek_blue_tomato=Unknown
% @importance 0.80

0.77::true_val(price_sek_blue_tomato, v9999); 0.23::true_val(price_sek_blue_tomato, unk_price_sek_blue_tomato).

0.88::acc(s72, price_sek_blue_tomato).

measured(s72, price_sek_blue_tomato, v9999).

all_consistent(price_sek_blue_tomato) :- consistent(s72, price_sek_blue_tomato).

evidence(all_consistent(price_sek_blue_tomato)).
query(true_val(price_sek_blue_tomato, v9999)).
query(true_val(price_sek_blue_tomato, unk_price_sek_blue_tomato)).

% @attr price_dkk_blue_tomato
% @type numeric
% @canonical false
% @original_name Price (DKK, Blue Tomato Denmark)
% @unit DKK
% @values v6599=6599.0 unk_price_dkk_blue_tomato=Unknown
% @importance 0.80

0.77::true_val(price_dkk_blue_tomato, v6599); 0.23::true_val(price_dkk_blue_tomato, unk_price_dkk_blue_tomato).

0.88::acc(s73, price_dkk_blue_tomato).

measured(s73, price_dkk_blue_tomato, v6599).

all_consistent(price_dkk_blue_tomato) :- consistent(s73, price_dkk_blue_tomato).

evidence(all_consistent(price_dkk_blue_tomato)).
query(true_val(price_dkk_blue_tomato, v6599)).
query(true_val(price_dkk_blue_tomato, unk_price_dkk_blue_tomato)).

% @attr estimated_availability_date
% @type categorical
% @canonical true
% @original_name estimated_availability_date
% @values may_1_2026=May_1_2026 april_may_2026=April_May_2026
% @importance 0.90

0.50::true_val(estimated_availability_date, may_1_2026); 0.50::true_val(estimated_availability_date, april_may_2026).

0.82::acc(s37, estimated_availability_date).
0.75::acc(s74, estimated_availability_date).

measured(s37, estimated_availability_date, may_1_2026).
measured(s74, estimated_availability_date, april_may_2026).

all_consistent(estimated_availability_date) :-
    (indep(s37), consistent(s37, estimated_availability_date) ; \+indep(s37)),
    (indep(s74), consistent(s74, estimated_availability_date) ; \+indep(s74)).

evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, may_1_2026)).
query(true_val(estimated_availability_date, april_may_2026)).

% @attr shipping_restriction_au
% @type categorical
% @canonical false
% @original_name Shipping restriction (AU merchant)
% @values au_only=Only_available_shipping_within_Australia unk_shipping_restriction_au=Unknown
% @importance 0.85

0.76::true_val(shipping_restriction_au, au_only); 0.24::true_val(shipping_restriction_au, unk_shipping_restriction_au).

0.85::acc(s37, shipping_restriction_au).

measured(s37, shipping_restriction_au, au_only).

all_consistent(shipping_restriction_au) :- consistent(s37, shipping_restriction_au).

evidence(all_consistent(shipping_restriction_au)).
query(true_val(shipping_restriction_au, au_only)).
query(true_val(shipping_restriction_au, unk_shipping_restriction_au)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status (evo in stock)
% @values in_stock=In_stock unk_availability_status=Unknown
% @importance 0.80

0.77::true_val(availability_status, in_stock); 0.23::true_val(availability_status, unk_availability_status).

0.85::acc(s76, availability_status).

measured(s76, availability_status, in_stock).

all_consistent(availability_status) :- consistent(s76, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, in_stock)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_backordered
% @type categorical
% @canonical false
% @original_name availability_status (backordered 152/156)
% @values backordered_152_156=Backordered_152cm_156cm unk_availability_status_backordered=Unknown
% @importance 0.85

0.63::true_val(availability_status_backordered, backordered_152_156); 0.37::true_val(availability_status_backordered, unk_availability_status_backordered).

0.75::acc(s77, availability_status_backordered).

measured(s77, availability_status_backordered, backordered_152_156).

all_consistent(availability_status_backordered) :- consistent(s77, availability_status_backordered).

evidence(all_consistent(availability_status_backordered)).
query(true_val(availability_status_backordered, backordered_152_156)).
query(true_val(availability_status_backordered, unk_availability_status_backordered)).

% @attr availability_status_darkside
% @type categorical
% @canonical false
% @original_name availability_status (Darkside available)
% @values available_free_shipping=Available_free_shipping_over_99 unk_availability_status_darkside=Unknown
% @importance 0.50

0.64::true_val(availability_status_darkside, available_free_shipping); 0.36::true_val(availability_status_darkside, unk_availability_status_darkside).

0.75::acc(s78, availability_status_darkside).

measured(s78, availability_status_darkside, available_free_shipping).

all_consistent(availability_status_darkside) :- consistent(s78, availability_status_darkside).

evidence(all_consistent(availability_status_darkside)).
query(true_val(availability_status_darkside, available_free_shipping)).
query(true_val(availability_status_darkside, unk_availability_status_darkside)).

% @attr au_market_note
% @type categorical
% @canonical false
% @original_name AU market note
% @values au_exclusive_early=Boards_landing_exclusively_Australia_before_world_2027 unk_au_market_note=Unknown
% @importance 0.80

0.63::true_val(au_market_note, au_exclusive_early); 0.37::true_val(au_market_note, unk_au_market_note).

0.72::acc(s74, au_market_note).

measured(s74, au_market_note, au_exclusive_early).

all_consistent(au_market_note) :- consistent(s74, au_market_note).

evidence(all_consistent(au_market_note)).
query(true_val(au_market_note, au_exclusive_early)).
query(true_val(au_market_note, unk_au_market_note)).

% @attr retailer_info_burton_us
% @type categorical
% @canonical false
% @original_name Burton.com (US)
% @values manufacturer_direct=Manufacturer_direct_highest_authority unk_retailer_info_burton_us=Unknown
% @importance 0.40

0.71::true_val(retailer_info_burton_us, manufacturer_direct); 0.29::true_val(retailer_info_burton_us, unk_retailer_info_burton_us).

0.90::acc(s20, retailer_info_burton_us).

measured(s20, retailer_info_burton_us, manufacturer_direct).

all_consistent(retailer_info_burton_us) :- consistent(s20, retailer_info_burton_us).

evidence(all_consistent(retailer_info_burton_us)).
query(true_val(retailer_info_burton_us, manufacturer_direct)).
query(true_val(retailer_info_burton_us, unk_retailer_info_burton_us)).

% @attr retailer_info_evo
% @type categorical
% @canonical false
% @original_name evo
% @values major_us_retailer=Major_US_online_retailer_price_match unk_retailer_info_evo=Unknown
% @importance 0.80

0.77::true_val(retailer_info_evo, major_us_retailer); 0.23::true_val(retailer_info_evo, unk_retailer_info_evo).

0.85::acc(s76, retailer_info_evo).

measured(s76, retailer_info_evo, major_us_retailer).

all_consistent(retailer_info_evo) :- consistent(s76, retailer_info_evo).

evidence(all_consistent(retailer_info_evo)).
query(true_val(retailer_info_evo, major_us_retailer)).
query(true_val(retailer_info_evo, unk_retailer_info_evo)).

% @attr retailer_info_backcountry
% @type categorical
% @canonical false
% @original_name Backcountry
% @values major_us_outdoor=Major_US_online_outdoor_retailer unk_retailer_info_backcountry=Unknown
% @importance 0.95

0.77::true_val(retailer_info_backcountry, major_us_outdoor); 0.23::true_val(retailer_info_backcountry, unk_retailer_info_backcountry).

0.85::acc(s62, retailer_info_backcountry).

measured(s62, retailer_info_backcountry, major_us_outdoor).

all_consistent(retailer_info_backcountry) :- consistent(s62, retailer_info_backcountry).

evidence(all_consistent(retailer_info_backcountry)).
query(true_val(retailer_info_backcountry, major_us_outdoor)).
query(true_val(retailer_info_backcountry, unk_retailer_info_backcountry)).

% @attr retailer_info_tactics
% @type categorical
% @canonical false
% @original_name Tactics
% @values us_snowboard_specialist=US_online_snowboard_specialist_free_shipping unk_retailer_info_tactics=Unknown
% @importance 0.90

0.77::true_val(retailer_info_tactics, us_snowboard_specialist); 0.23::true_val(retailer_info_tactics, unk_retailer_info_tactics).

0.85::acc(s63, retailer_info_tactics).

measured(s63, retailer_info_tactics, us_snowboard_specialist).

all_consistent(retailer_info_tactics) :- consistent(s63, retailer_info_tactics).

evidence(all_consistent(retailer_info_tactics)).
query(true_val(retailer_info_tactics, us_snowboard_specialist)).
query(true_val(retailer_info_tactics, unk_retailer_info_tactics)).

% @attr retailer_info_darkside
% @type categorical
% @canonical false
% @original_name Darkside Snowboards
% @values vermont_est_1989=Vermont_retailer_est_1989_expert_service unk_retailer_info_darkside=Unknown
% @importance 0.50

0.64::true_val(retailer_info_darkside, vermont_est_1989); 0.36::true_val(retailer_info_darkside, unk_retailer_info_darkside).

0.75::acc(s78, retailer_info_darkside).

measured(s78, retailer_info_darkside, vermont_est_1989).

all_consistent(retailer_info_darkside) :- consistent(s78, retailer_info_darkside).

evidence(all_consistent(retailer_info_darkside)).
query(true_val(retailer_info_darkside, vermont_est_1989)).
query(true_val(retailer_info_darkside, unk_retailer_info_darkside)).

% @attr retailer_info_gravity_coalition
% @type categorical
% @canonical false
% @original_name Gravity Coalition
% @values us_retailer_discounted=US_retailer_discounted_pricing unk_retailer_info_gravity_coalition=Unknown
% @importance 0.90

0.77::true_val(retailer_info_gravity_coalition, us_retailer_discounted); 0.23::true_val(retailer_info_gravity_coalition, unk_retailer_info_gravity_coalition).

0.85::acc(s64, retailer_info_gravity_coalition).

measured(s64, retailer_info_gravity_coalition, us_retailer_discounted).

all_consistent(retailer_info_gravity_coalition) :- consistent(s64, retailer_info_gravity_coalition).

evidence(all_consistent(retailer_info_gravity_coalition)).
query(true_val(retailer_info_gravity_coalition, us_retailer_discounted)).
query(true_val(retailer_info_gravity_coalition, unk_retailer_info_gravity_coalition)).

% @attr retailer_info_prfo
% @type categorical
% @canonical false
% @original_name PRFO Sports
% @values canadian_retailer=Canadian_retailer unk_retailer_info_prfo=Unknown
% @importance 0.90

0.77::true_val(retailer_info_prfo, canadian_retailer); 0.23::true_val(retailer_info_prfo, unk_retailer_info_prfo).

0.85::acc(s68, retailer_info_prfo).

measured(s68, retailer_info_prfo, canadian_retailer).

all_consistent(retailer_info_prfo) :- consistent(s68, retailer_info_prfo).

evidence(all_consistent(retailer_info_prfo)).
query(true_val(retailer_info_prfo, canadian_retailer)).
query(true_val(retailer_info_prfo, unk_retailer_info_prfo)).

% @attr retailer_info_blue_tomato
% @type categorical
% @canonical false
% @original_name Blue Tomato
% @values major_eu_multi_country=Major_European_multi_country_retailer unk_retailer_info_blue_tomato=Unknown
% @importance 0.90

0.77::true_val(retailer_info_blue_tomato, major_eu_multi_country); 0.23::true_val(retailer_info_blue_tomato, unk_retailer_info_blue_tomato).

0.85::acc(s69, retailer_info_blue_tomato).

measured(s69, retailer_info_blue_tomato, major_eu_multi_country).

all_consistent(retailer_info_blue_tomato) :- consistent(s69, retailer_info_blue_tomato).

evidence(all_consistent(retailer_info_blue_tomato)).
query(true_val(retailer_info_blue_tomato, major_eu_multi_country)).
query(true_val(retailer_info_blue_tomato, unk_retailer_info_blue_tomato)).

% @attr retailer_info_snowcountry
% @type categorical
% @canonical false
% @original_name SnowCountry
% @values european_retailer=European_retailer unk_retailer_info_snowcountry=Unknown
% @importance 0.90

0.77::true_val(retailer_info_snowcountry, european_retailer); 0.23::true_val(retailer_info_snowcountry, unk_retailer_info_snowcountry).

0.85::acc(s70, retailer_info_snowcountry).

measured(s70, retailer_info_snowcountry, european_retailer).

all_consistent(retailer_info_snowcountry) :- consistent(s70, retailer_info_snowcountry).

evidence(all_consistent(retailer_info_snowcountry)).
query(true_val(retailer_info_snowcountry, european_retailer)).
query(true_val(retailer_info_snowcountry, unk_retailer_info_snowcountry)).

% @attr retailer_info_melbourne
% @type categorical
% @canonical false
% @original_name Melbourne Snowboard Centre
% @values au_local_independent=Australian_local_independently_owned unk_retailer_info_melbourne=Unknown
% @importance 0.70

0.72::true_val(retailer_info_melbourne, au_local_independent); 0.28::true_val(retailer_info_melbourne, unk_retailer_info_melbourne).

0.80::acc(s75, retailer_info_melbourne).

measured(s75, retailer_info_melbourne, au_local_independent).

all_consistent(retailer_info_melbourne) :- consistent(s75, retailer_info_melbourne).

evidence(all_consistent(retailer_info_melbourne)).
query(true_val(retailer_info_melbourne, au_local_independent)).
query(true_val(retailer_info_melbourne, unk_retailer_info_melbourne)).

% @attr retailer_info_auski
% @type categorical
% @canonical false
% @original_name Auski Australia
% @values au_retailer_no_intl_burton=AU_retailer_no_intl_Burton_shipping unk_retailer_info_auski=Unknown
% @importance 0.50

0.56::true_val(retailer_info_auski, au_retailer_no_intl_burton); 0.44::true_val(retailer_info_auski, unk_retailer_info_auski).

0.72::acc(s79, retailer_info_auski).

measured(s79, retailer_info_auski, au_retailer_no_intl_burton).

all_consistent(retailer_info_auski) :- consistent(s79, retailer_info_auski).

evidence(all_consistent(retailer_info_auski)).
query(true_val(retailer_info_auski, au_retailer_no_intl_burton)).
query(true_val(retailer_info_auski, unk_retailer_info_auski)).

% @attr retailer_info_elevation107
% @type categorical
% @canonical false
% @original_name Elevation107 Australia
% @values au_retailer_layby=AU_retailer_layby_available unk_retailer_info_elevation107=Unknown
% @importance 0.80

0.63::true_val(retailer_info_elevation107, au_retailer_layby); 0.37::true_val(retailer_info_elevation107, unk_retailer_info_elevation107).

0.72::acc(s74, retailer_info_elevation107).

measured(s74, retailer_info_elevation107, au_retailer_layby).

all_consistent(retailer_info_elevation107) :- consistent(s74, retailer_info_elevation107).

evidence(all_consistent(retailer_info_elevation107)).
query(true_val(retailer_info_elevation107, au_retailer_layby)).
query(true_val(retailer_info_elevation107, unk_retailer_info_elevation107)).

% @attr retailer_info_balmoral
% @type categorical
% @canonical false
% @original_name Balmoral Boards
% @values au_retailer=Australian_retailer unk_retailer_info_balmoral=Unknown
% @importance 0.90

0.68::true_val(retailer_info_balmoral, au_retailer); 0.32::true_val(retailer_info_balmoral, unk_retailer_info_balmoral).

0.75::acc(s59, retailer_info_balmoral).

measured(s59, retailer_info_balmoral, au_retailer).

all_consistent(retailer_info_balmoral) :- consistent(s59, retailer_info_balmoral).

evidence(all_consistent(retailer_info_balmoral)).
query(true_val(retailer_info_balmoral, au_retailer)).
query(true_val(retailer_info_balmoral, unk_retailer_info_balmoral)).

% @attr retailer_info_pacific_boarder
% @type categorical
% @canonical false
% @original_name Pacific Boarder
% @values vancouver_premier=Vancouver_premier_snowboard_store unk_retailer_info_pacific_boarder=Unknown
% @importance 0.40

0.56::true_val(retailer_info_pacific_boarder, vancouver_premier); 0.44::true_val(retailer_info_pacific_boarder, unk_retailer_info_pacific_boarder).

0.70::acc(s80, retailer_info_pacific_boarder).

measured(s80, retailer_info_pacific_boarder, vancouver_premier).

all_consistent(retailer_info_pacific_boarder) :- consistent(s80, retailer_info_pacific_boarder).

evidence(all_consistent(retailer_info_pacific_boarder)).
query(true_val(retailer_info_pacific_boarder, vancouver_premier)).
query(true_val(retailer_info_pacific_boarder, unk_retailer_info_pacific_boarder)).

% @attr retailer_info_blauer
% @type categorical
% @canonical false
% @original_name Blauer Board Shop (Powder Control)
% @values us_specialist=US_specialist_retailer unk_retailer_info_blauer=Unknown
% @importance 0.70

0.64::true_val(retailer_info_blauer, us_specialist); 0.36::true_val(retailer_info_blauer, unk_retailer_info_blauer).

0.75::acc(s81, retailer_info_blauer).

measured(s81, retailer_info_blauer, us_specialist).

all_consistent(retailer_info_blauer) :- consistent(s81, retailer_info_blauer).

evidence(all_consistent(retailer_info_blauer)).
query(true_val(retailer_info_blauer, us_specialist)).
query(true_val(retailer_info_blauer, unk_retailer_info_blauer)).

% @attr retailer_info_rude_boys
% @type categorical
% @canonical false
% @original_name Rude Boys
% @values banff_canada=Banff_Alberta_Canada_retailer unk_retailer_info_rude_boys=Unknown
% @importance 0.85

0.68::true_val(retailer_info_rude_boys, banff_canada); 0.32::true_val(retailer_info_rude_boys, unk_retailer_info_rude_boys).

0.75::acc(s56, retailer_info_rude_boys).

measured(s56, retailer_info_rude_boys, banff_canada).

all_consistent(retailer_info_rude_boys) :- consistent(s56, retailer_info_rude_boys).

evidence(all_consistent(retailer_info_rude_boys)).
query(true_val(retailer_info_rude_boys, banff_canada)).
query(true_val(retailer_info_rude_boys, unk_retailer_info_rude_boys)).

% @attr award_snowboard_magazine
% @type categorical
% @canonical false
% @original_name Snowboard Magazine award
% @values platinum_pick_2026=Platinum_Pick_2026_best_powder_board unk_award_snowboard_magazine=Unknown
% @importance 0.90

0.77::true_val(award_snowboard_magazine, platinum_pick_2026); 0.23::true_val(award_snowboard_magazine, unk_award_snowboard_magazine).

0.88::acc(s65, award_snowboard_magazine).

measured(s65, award_snowboard_magazine, platinum_pick_2026).

all_consistent(award_snowboard_magazine) :- consistent(s65, award_snowboard_magazine).

evidence(all_consistent(award_snowboard_magazine)).
query(true_val(award_snowboard_magazine, platinum_pick_2026)).
query(true_val(award_snowboard_magazine, unk_award_snowboard_magazine)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values snowsurf=Snowsurf unk_riding_style=Unknown
% @importance 0.90

0.81::true_val(riding_style, snowsurf); 0.19::true_val(riding_style, unk_riding_style).

0.88::acc(s19, riding_style).

measured(s19, riding_style, snowsurf).

all_consistent(riding_style) :- consistent(s19, riding_style).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, snowsurf)).
query(true_val(riding_style, unk_riding_style)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect (fun to turn)
% @values really_fun_to_turn=Really_fun_to_turn unk_positive_aspect=Unknown
% @importance 0.90

0.81::true_val(positive_aspect, really_fun_to_turn); 0.19::true_val(positive_aspect, unk_positive_aspect).

0.88::acc(s82, positive_aspect).

measured(s82, positive_aspect, really_fun_to_turn).

all_consistent(positive_aspect) :- consistent(s82, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, really_fun_to_turn)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr positive_aspect_pop
% @type categorical
% @canonical false
% @original_name positive_aspect (solid pop)
% @values solid_pop_no_chatter=Solid_pop_without_chatter unk_positive_aspect_pop=Unknown
% @importance 0.90

0.81::true_val(positive_aspect_pop, solid_pop_no_chatter); 0.19::true_val(positive_aspect_pop, unk_positive_aspect_pop).

0.88::acc(s82, positive_aspect_pop).

measured(s82, positive_aspect_pop, solid_pop_no_chatter).

all_consistent(positive_aspect_pop) :- consistent(s82, positive_aspect_pop).

evidence(all_consistent(positive_aspect_pop)).
query(true_val(positive_aspect_pop, solid_pop_no_chatter)).
query(true_val(positive_aspect_pop, unk_positive_aspect_pop)).

% @attr positive_aspect_channel
% @type categorical
% @canonical false
% @original_name positive_aspect (channel stance)
% @values channel_stance_experiment=Single_Channel_stance_experimentation unk_positive_aspect_channel=Unknown
% @importance 0.90

0.81::true_val(positive_aspect_channel, channel_stance_experiment); 0.19::true_val(positive_aspect_channel, unk_positive_aspect_channel).

0.88::acc(s82, positive_aspect_channel).

measured(s82, positive_aspect_channel, channel_stance_experiment).

all_consistent(positive_aspect_channel) :- consistent(s82, positive_aspect_channel).

evidence(all_consistent(positive_aspect_channel)).
query(true_val(positive_aspect_channel, channel_stance_experiment)).
query(true_val(positive_aspect_channel, unk_positive_aspect_channel)).

% @attr positive_aspect_powder
% @type categorical
% @canonical false
% @original_name positive_aspect (great in pow)
% @values great_in_pow=Seems_great_in_pow unk_positive_aspect_powder=Unknown
% @importance 0.90

0.81::true_val(positive_aspect_powder, great_in_pow); 0.19::true_val(positive_aspect_powder, unk_positive_aspect_powder).

0.88::acc(s82, positive_aspect_powder).

measured(s82, positive_aspect_powder, great_in_pow).

all_consistent(positive_aspect_powder) :- consistent(s82, positive_aspect_powder).

evidence(all_consistent(positive_aspect_powder)).
query(true_val(positive_aspect_powder, great_in_pow)).
query(true_val(positive_aspect_powder, unk_positive_aspect_powder)).

% @attr positive_aspect_setback
% @type categorical
% @canonical false
% @original_name positive_aspect (setback no back foot weight)
% @values setback_no_weight=Really_set_back_no_back_foot_weight unk_positive_aspect_setback=Unknown
% @importance 0.90

0.81::true_val(positive_aspect_setback, setback_no_weight); 0.19::true_val(positive_aspect_setback, unk_positive_aspect_setback).

0.88::acc(s82, positive_aspect_setback).

measured(s82, positive_aspect_setback, setback_no_weight).

all_consistent(positive_aspect_setback) :- consistent(s82, positive_aspect_setback).

evidence(all_consistent(positive_aspect_setback)).
query(true_val(positive_aspect_setback, setback_no_weight)).
query(true_val(positive_aspect_setback, unk_positive_aspect_setback)).

% @attr positive_aspect_radius
% @type categorical
% @canonical false
% @original_name positive_aspect (tight turn radius)
% @values tighter_radius_than_expected=Turns_tighter_radius_than_sidecut_suggests unk_positive_aspect_radius=Unknown
% @importance 0.90

0.81::true_val(positive_aspect_radius, tighter_radius_than_expected); 0.19::true_val(positive_aspect_radius, unk_positive_aspect_radius).

0.88::acc(s82, positive_aspect_radius).

measured(s82, positive_aspect_radius, tighter_radius_than_expected).

all_consistent(positive_aspect_radius) :- consistent(s82, positive_aspect_radius).

evidence(all_consistent(positive_aspect_radius)).
query(true_val(positive_aspect_radius, tighter_radius_than_expected)).
query(true_val(positive_aspect_radius, unk_positive_aspect_radius)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect (wax/scrape)
% @values channels_hard_wax_scrape=Channels_hard_to_wax_and_scrape unk_negative_aspect=Unknown
% @importance 0.90

0.81::true_val(negative_aspect, channels_hard_wax_scrape); 0.19::true_val(negative_aspect, unk_negative_aspect).

0.88::acc(s82, negative_aspect).

measured(s82, negative_aspect, channels_hard_wax_scrape).

all_consistent(negative_aspect) :- consistent(s82, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, channels_hard_wax_scrape)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_ice
% @type categorical
% @canonical false
% @original_name negative_aspect (ice/hard snow)
% @values better_boards_for_ice=Better_boards_for_hard_icy_snow unk_negative_aspect_ice=Unknown
% @importance 0.90

0.81::true_val(negative_aspect_ice, better_boards_for_ice); 0.19::true_val(negative_aspect_ice, unk_negative_aspect_ice).

0.88::acc(s82, negative_aspect_ice).

measured(s82, negative_aspect_ice, better_boards_for_ice).

all_consistent(negative_aspect_ice) :- consistent(s82, negative_aspect_ice).

evidence(all_consistent(negative_aspect_ice)).
query(true_val(negative_aspect_ice, better_boards_for_ice)).
query(true_val(negative_aspect_ice, unk_negative_aspect_ice)).

% @attr on_snow_feel_tgr
% @type categorical
% @canonical true
% @original_name on_snow_feel_tgr
% @values stable=Stable unk_on_snow_feel_tgr=Unknown
% @importance 0.90

0.81::true_val(on_snow_feel_tgr, stable); 0.19::true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr).

0.88::acc(s19, on_snow_feel_tgr).

measured(s19, on_snow_feel_tgr, stable).

all_consistent(on_snow_feel_tgr) :- consistent(s19, on_snow_feel_tgr).

evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, stable)).
query(true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values fast=Fast unk_turn_initiation_performance=Unknown
% @importance 0.90

0.81::true_val(turn_initiation_performance, fast); 0.19::true_val(turn_initiation_performance, unk_turn_initiation_performance).

0.88::acc(s19, turn_initiation_performance).

measured(s19, turn_initiation_performance, fast).

all_consistent(turn_initiation_performance) :- consistent(s19, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, fast)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr reviewer_opinion_tgr_uneven_terrain
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (uneven terrain)
% @values moderate=Moderate unk_reviewer_opinion_tgr_uneven_terrain=Unknown
% @importance 0.90

0.81::true_val(reviewer_opinion_tgr_uneven_terrain, moderate); 0.19::true_val(reviewer_opinion_tgr_uneven_terrain, unk_reviewer_opinion_tgr_uneven_terrain).

0.88::acc(s19, reviewer_opinion_tgr_uneven_terrain).

measured(s19, reviewer_opinion_tgr_uneven_terrain, moderate).

all_consistent(reviewer_opinion_tgr_uneven_terrain) :- consistent(s19, reviewer_opinion_tgr_uneven_terrain).

evidence(all_consistent(reviewer_opinion_tgr_uneven_terrain)).
query(true_val(reviewer_opinion_tgr_uneven_terrain, moderate)).
query(true_val(reviewer_opinion_tgr_uneven_terrain, unk_reviewer_opinion_tgr_uneven_terrain)).

% @attr flex_rating_10_the_good_ride
% @type categorical
% @canonical true
% @original_name flex_rating_10_the_good_ride
% @values medium_stiff=Medium_Stiff unk_flex_rating_10_the_good_ride=Unknown
% @importance 0.90

0.81::true_val(flex_rating_10_the_good_ride, medium_stiff); 0.19::true_val(flex_rating_10_the_good_ride, unk_flex_rating_10_the_good_ride).

0.88::acc(s19, flex_rating_10_the_good_ride).

measured(s19, flex_rating_10_the_good_ride, medium_stiff).

all_consistent(flex_rating_10_the_good_ride) :- consistent(s19, flex_rating_10_the_good_ride).

evidence(all_consistent(flex_rating_10_the_good_ride)).
query(true_val(flex_rating_10_the_good_ride, medium_stiff)).
query(true_val(flex_rating_10_the_good_ride, unk_flex_rating_10_the_good_ride)).

% @attr reviewer_opinion_tgr_buttering
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (buttering)
% @values moderate=Moderate unk_reviewer_opinion_tgr_buttering=Unknown
% @importance 0.90

0.81::true_val(reviewer_opinion_tgr_buttering, moderate); 0.19::true_val(reviewer_opinion_tgr_buttering, unk_reviewer_opinion_tgr_buttering).

0.88::acc(s19, reviewer_opinion_tgr_buttering).

measured(s19, reviewer_opinion_tgr_buttering, moderate).

all_consistent(reviewer_opinion_tgr_buttering) :- consistent(s19, reviewer_opinion_tgr_buttering).

evidence(all_consistent(reviewer_opinion_tgr_buttering)).
query(true_val(reviewer_opinion_tgr_buttering, moderate)).
query(true_val(reviewer_opinion_tgr_buttering, unk_reviewer_opinion_tgr_buttering)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values medium_snow=Medium_adequate_not_amazing_on_ice unk_edge_hold=Unknown
% @importance 0.88

0.81::true_val(edge_hold, medium_snow); 0.19::true_val(edge_hold, unk_edge_hold).

0.88::acc(s19, edge_hold).
0.88::acc(s83, edge_hold).

measured(s19, edge_hold, medium_snow).
measured(s83, edge_hold, medium_snow).

all_consistent(edge_hold) :-
    consistent(s19, edge_hold),
    consistent(s83, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, medium_snow)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr powder_rating_tgr
% @type categorical
% @canonical true
% @original_name powder_rating_tgr
% @values great=Great unk_powder_rating_tgr=Unknown
% @importance 0.90

0.81::true_val(powder_rating_tgr, great); 0.19::true_val(powder_rating_tgr, unk_powder_rating_tgr).

0.88::acc(s19, powder_rating_tgr).

measured(s19, powder_rating_tgr, great).

all_consistent(powder_rating_tgr) :- consistent(s19, powder_rating_tgr).

evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, great)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

% @attr carving_rating_tgr
% @type categorical
% @canonical true
% @original_name carving_rating_tgr
% @values great=Great unk_carving_rating_tgr=Unknown
% @importance 0.90

0.81::true_val(carving_rating_tgr, great); 0.19::true_val(carving_rating_tgr, unk_carving_rating_tgr).

0.88::acc(s19, carving_rating_tgr).

measured(s19, carving_rating_tgr, great).

all_consistent(carving_rating_tgr) :- consistent(s19, carving_rating_tgr).

evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, great)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

% @attr speed_rating_tgr
% @type categorical
% @canonical true
% @original_name speed_rating_tgr
% @values good=Good unk_speed_rating_tgr=Unknown
% @importance 0.90

0.81::true_val(speed_rating_tgr, good); 0.19::true_val(speed_rating_tgr, unk_speed_rating_tgr).

0.88::acc(s19, speed_rating_tgr).

measured(s19, speed_rating_tgr, good).

all_consistent(speed_rating_tgr) :- consistent(s19, speed_rating_tgr).

evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, good)).
query(true_val(speed_rating_tgr, unk_speed_rating_tgr)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values good=Good_upper_tier unk_base_glide_performance=Unknown
% @importance 0.90

0.81::true_val(base_glide_performance, good); 0.19::true_val(base_glide_performance, unk_base_glide_performance).

0.88::acc(s19, base_glide_performance).

measured(s19, base_glide_performance, good).

all_consistent(base_glide_performance) :- consistent(s19, base_glide_performance).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, good)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr reviewer_opinion_tgr_steeps
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (steeps/bumps)
% @values good=Good unk_reviewer_opinion_tgr_steeps=Unknown
% @importance 0.90

0.81::true_val(reviewer_opinion_tgr_steeps, good); 0.19::true_val(reviewer_opinion_tgr_steeps, unk_reviewer_opinion_tgr_steeps).

0.88::acc(s19, reviewer_opinion_tgr_steeps).

measured(s19, reviewer_opinion_tgr_steeps, good).

all_consistent(reviewer_opinion_tgr_steeps) :- consistent(s19, reviewer_opinion_tgr_steeps).

evidence(all_consistent(reviewer_opinion_tgr_steeps)).
query(true_val(reviewer_opinion_tgr_steeps, good)).
query(true_val(reviewer_opinion_tgr_steeps, unk_reviewer_opinion_tgr_steeps)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values poor=Poor unk_switch_riding=Unknown
% @importance 0.90

0.81::true_val(switch_riding, poor); 0.19::true_val(switch_riding, unk_switch_riding).

0.88::acc(s19, switch_riding).

measured(s19, switch_riding, poor).

all_consistent(switch_riding) :- consistent(s19, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, poor)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr jibbing_rating_tgr
% @type categorical
% @canonical true
% @original_name jibbing_rating_tgr
% @values poor=Poor unk_jibbing_rating_tgr=Unknown
% @importance 0.90

0.81::true_val(jibbing_rating_tgr, poor); 0.19::true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr).

0.88::acc(s19, jibbing_rating_tgr).

measured(s19, jibbing_rating_tgr, poor).

all_consistent(jibbing_rating_tgr) :- consistent(s19, jibbing_rating_tgr).

evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, poor)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr)).

% @attr jumps_rating_tgr
% @type categorical
% @canonical true
% @original_name jumps_rating_tgr
% @values good=Good unk_jumps_rating_tgr=Unknown
% @importance 0.90

0.81::true_val(jumps_rating_tgr, good); 0.19::true_val(jumps_rating_tgr, unk_jumps_rating_tgr).

0.88::acc(s19, jumps_rating_tgr).

measured(s19, jumps_rating_tgr, good).

all_consistent(jumps_rating_tgr) :- consistent(s19, jumps_rating_tgr).

evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, good)).
query(true_val(jumps_rating_tgr, unk_jumps_rating_tgr)).

% @attr pipe_rating_tgr
% @type categorical
% @canonical true
% @original_name pipe_rating_tgr
% @values good=Good unk_pipe_rating_tgr=Unknown
% @importance 0.90

0.81::true_val(pipe_rating_tgr, good); 0.19::true_val(pipe_rating_tgr, unk_pipe_rating_tgr).

0.88::acc(s19, pipe_rating_tgr).

measured(s19, pipe_rating_tgr, good).

all_consistent(pipe_rating_tgr) :- consistent(s19, pipe_rating_tgr).

evidence(all_consistent(pipe_rating_tgr)).
query(true_val(pipe_rating_tgr, good)).
query(true_val(pipe_rating_tgr, unk_pipe_rating_tgr)).

% @attr reviewer_opinion_tgr_weight
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (weight feel)
% @values feels_normal=Feels_Normal_light_side_of_middle unk_reviewer_opinion_tgr_weight=Unknown
% @importance 0.90

0.81::true_val(reviewer_opinion_tgr_weight, feels_normal); 0.19::true_val(reviewer_opinion_tgr_weight, unk_reviewer_opinion_tgr_weight).

0.88::acc(s19, reviewer_opinion_tgr_weight).

measured(s19, reviewer_opinion_tgr_weight, feels_normal).

all_consistent(reviewer_opinion_tgr_weight) :- consistent(s19, reviewer_opinion_tgr_weight).

evidence(all_consistent(reviewer_opinion_tgr_weight)).
query(true_val(reviewer_opinion_tgr_weight, feels_normal)).
query(true_val(reviewer_opinion_tgr_weight, unk_reviewer_opinion_tgr_weight)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride (overall highlight)
% @values top_snowsurf_quiver=Top_snowsurf_board_Burton_testing_quiver_worthy unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.80

0.72::true_val(reviewer_opinion_the_good_ride, top_snowsurf_quiver); 0.28::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

0.85::acc(s84, reviewer_opinion_the_good_ride).

measured(s84, reviewer_opinion_the_good_ride, top_snowsurf_quiver).

all_consistent(reviewer_opinion_the_good_ride) :- consistent(s84, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, top_snowsurf_quiver)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand (TGR list)
% @values korua_dart_cafe_weston_japow_etc=Korua_Dart_Cafe_Racer_Weston_Japow_Moss_Gentemstick_etc unk_comparable_board_cross_brand=Unknown
% @importance 0.85

0.81::true_val(comparable_board_cross_brand, korua_dart_cafe_weston_japow_etc); 0.19::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

0.88::acc(s85, comparable_board_cross_brand).

measured(s85, comparable_board_cross_brand, korua_dart_cafe_weston_japow_etc).

all_consistent(comparable_board_cross_brand) :- consistent(s85, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, korua_dart_cafe_weston_japow_etc)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values stance_channel_discussion=Stance_options_large_EST_bindings_channel_placement unk_user_review_forum=Unknown
% @importance 0.50

0.27::true_val(user_review_forum, stance_channel_discussion); 0.73::true_val(user_review_forum, unk_user_review_forum).

0.50::acc(s86, user_review_forum).

measured(s86, user_review_forum, stance_channel_discussion).

all_consistent(user_review_forum) :- consistent(s86, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, stance_channel_discussion)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr reviewer_opinion_tgr_taper_note
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (taper comparison)
% @values only_10mm_not_a_lot=Only_10mm_taper_not_a_lot_vs_other_snowsurf unk_reviewer_opinion_tgr_taper_note=Unknown
% @importance 0.80

0.77::true_val(reviewer_opinion_tgr_taper_note, only_10mm_not_a_lot); 0.23::true_val(reviewer_opinion_tgr_taper_note, unk_reviewer_opinion_tgr_taper_note).

0.88::acc(s87, reviewer_opinion_tgr_taper_note).

measured(s87, reviewer_opinion_tgr_taper_note, only_10mm_not_a_lot).

all_consistent(reviewer_opinion_tgr_taper_note) :- consistent(s87, reviewer_opinion_tgr_taper_note).

evidence(all_consistent(reviewer_opinion_tgr_taper_note)).
query(true_val(reviewer_opinion_tgr_taper_note, only_10mm_not_a_lot)).
query(true_val(reviewer_opinion_tgr_taper_note, unk_reviewer_opinion_tgr_taper_note)).

% @attr reviewer_opinion_tgr_shape_note
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (directional/swallow tail)
% @values very_directional_swallow_tail=Very_directional_more_nose_than_tail_swallow_tail unk_reviewer_opinion_tgr_shape_note=Unknown
% @importance 0.70

0.72::true_val(reviewer_opinion_tgr_shape_note, very_directional_swallow_tail); 0.28::true_val(reviewer_opinion_tgr_shape_note, unk_reviewer_opinion_tgr_shape_note).

0.85::acc(s88, reviewer_opinion_tgr_shape_note).

measured(s88, reviewer_opinion_tgr_shape_note, very_directional_swallow_tail).

all_consistent(reviewer_opinion_tgr_shape_note) :- consistent(s88, reviewer_opinion_tgr_shape_note).

evidence(all_consistent(reviewer_opinion_tgr_shape_note)).
query(true_val(reviewer_opinion_tgr_shape_note, very_directional_swallow_tail)).
query(true_val(reviewer_opinion_tgr_shape_note, unk_reviewer_opinion_tgr_shape_note)).

% @attr reviewer_opinion_tgr_stance_note
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (channel stance experimentation)
% @values extreme_stance_experiment=Open_unit_channel_extreme_stance_experimentation unk_reviewer_opinion_tgr_stance_note=Unknown
% @importance 0.70

0.72::true_val(reviewer_opinion_tgr_stance_note, extreme_stance_experiment); 0.28::true_val(reviewer_opinion_tgr_stance_note, unk_reviewer_opinion_tgr_stance_note).

0.85::acc(s89, reviewer_opinion_tgr_stance_note).

measured(s89, reviewer_opinion_tgr_stance_note, extreme_stance_experiment).

all_consistent(reviewer_opinion_tgr_stance_note) :- consistent(s89, reviewer_opinion_tgr_stance_note).

evidence(all_consistent(reviewer_opinion_tgr_stance_note)).
query(true_val(reviewer_opinion_tgr_stance_note, extreme_stance_experiment)).
query(true_val(reviewer_opinion_tgr_stance_note, unk_reviewer_opinion_tgr_stance_note)).

% @attr reviewer_opinion_tgr_construction
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (construction quality)
% @values great_construction_semi_durable=Great_construction_semi_durable_topsheet unk_reviewer_opinion_tgr_construction=Unknown
% @importance 0.70

0.72::true_val(reviewer_opinion_tgr_construction, great_construction_semi_durable); 0.28::true_val(reviewer_opinion_tgr_construction, unk_reviewer_opinion_tgr_construction).

0.85::acc(s90, reviewer_opinion_tgr_construction).

measured(s90, reviewer_opinion_tgr_construction, great_construction_semi_durable).

all_consistent(reviewer_opinion_tgr_construction) :- consistent(s90, reviewer_opinion_tgr_construction).

evidence(all_consistent(reviewer_opinion_tgr_construction)).
query(true_val(reviewer_opinion_tgr_construction, great_construction_semi_durable)).
query(true_val(reviewer_opinion_tgr_construction, unk_reviewer_opinion_tgr_construction)).

% @attr reviewer_opinion_tgr_weight_note
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (no weight published)
% @values no_exact_weight=No_exact_weight_published_wood_cores_inconsistent unk_reviewer_opinion_tgr_weight_note=Unknown
% @importance 0.70

0.72::true_val(reviewer_opinion_tgr_weight_note, no_exact_weight); 0.28::true_val(reviewer_opinion_tgr_weight_note, unk_reviewer_opinion_tgr_weight_note).

0.85::acc(s90, reviewer_opinion_tgr_weight_note).

measured(s90, reviewer_opinion_tgr_weight_note, no_exact_weight).

all_consistent(reviewer_opinion_tgr_weight_note) :- consistent(s90, reviewer_opinion_tgr_weight_note).

evidence(all_consistent(reviewer_opinion_tgr_weight_note)).
query(true_val(reviewer_opinion_tgr_weight_note, no_exact_weight)).
query(true_val(reviewer_opinion_tgr_weight_note, unk_reviewer_opinion_tgr_weight_note)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand (Hometown Hero)
% @values hometown_hero=Hometown_Hero_679_95_12mm_taper_all_mountain unk_comparable_board_same_brand=Unknown
% @importance 0.65

0.71::true_val(comparable_board_same_brand, hometown_hero); 0.29::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

0.90::acc(s91, comparable_board_same_brand).

measured(s91, comparable_board_same_brand, hometown_hero).

all_consistent(comparable_board_same_brand) :- consistent(s91, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, hometown_hero)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_channel_surfer
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Channel Surfer)
% @values channel_surfer=Channel_Surfer_swallowtail_surf_3d unk_comparable_board_same_brand_channel_surfer=Unknown
% @importance 0.60

0.67::true_val(comparable_board_same_brand_channel_surfer, channel_surfer); 0.33::true_val(comparable_board_same_brand_channel_surfer, unk_comparable_board_same_brand_channel_surfer).

0.90::acc(s92, comparable_board_same_brand_channel_surfer).

measured(s92, comparable_board_same_brand_channel_surfer, channel_surfer).

all_consistent(comparable_board_same_brand_channel_surfer) :- consistent(s92, comparable_board_same_brand_channel_surfer).

evidence(all_consistent(comparable_board_same_brand_channel_surfer)).
query(true_val(comparable_board_same_brand_channel_surfer, channel_surfer)).
query(true_val(comparable_board_same_brand_channel_surfer, unk_comparable_board_same_brand_channel_surfer)).

% @attr comparable_board_cross_brand_pricing
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (pricing context)
% @values jones_flagship_korua_dart_etc=Jones_Flagship_Pro_899_Korua_Dart_599_649 unk_comparable_board_cross_brand_pricing=Unknown
% @importance 0.80

0.68::true_val(comparable_board_cross_brand_pricing, jones_flagship_korua_dart_etc); 0.32::true_val(comparable_board_cross_brand_pricing, unk_comparable_board_cross_brand_pricing).

0.82::acc(s93, comparable_board_cross_brand_pricing).

measured(s93, comparable_board_cross_brand_pricing, jones_flagship_korua_dart_etc).

all_consistent(comparable_board_cross_brand_pricing) :- consistent(s93, comparable_board_cross_brand_pricing).

evidence(all_consistent(comparable_board_cross_brand_pricing)).
query(true_val(comparable_board_cross_brand_pricing, jones_flagship_korua_dart_etc)).
query(true_val(comparable_board_cross_brand_pricing, unk_comparable_board_cross_brand_pricing)).

% @attr comparable_board_cross_brand_value
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (value comparison)
% @values korua_cheaper_jones_less=Korua_Dart_significantly_cheaper_Jones_Storm_Chaser_less unk_comparable_board_cross_brand_value=Unknown
% @importance 0.80

0.68::true_val(comparable_board_cross_brand_value, korua_cheaper_jones_less); 0.32::true_val(comparable_board_cross_brand_value, unk_comparable_board_cross_brand_value).

0.82::acc(s93, comparable_board_cross_brand_value).

measured(s93, comparable_board_cross_brand_value, korua_cheaper_jones_less).

all_consistent(comparable_board_cross_brand_value) :- consistent(s93, comparable_board_cross_brand_value).

evidence(all_consistent(comparable_board_cross_brand_value)).
query(true_val(comparable_board_cross_brand_value, korua_cheaper_jones_less)).
query(true_val(comparable_board_cross_brand_value, unk_comparable_board_cross_brand_value)).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values single_radius=Single_sidecut_radius_standard unk_sidecut_type=Unknown
% @importance 1.00

0.76::true_val(sidecut_type, single_radius); 0.24::true_val(sidecut_type, unk_sidecut_type).

0.85::acc(s37, sidecut_type).

measured(s37, sidecut_type, single_radius).

all_consistent(sidecut_type) :- consistent(s37, sidecut_type).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, single_radius)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr nose_tail_feature_3d
% @type categorical
% @canonical false
% @original_name Nose/tail feature
% @values concave_3d_surfboard=3D_surfboard_inspired_concave_tip_tail unk_nose_tail_feature_3d=Unknown
% @importance 0.80

0.68::true_val(nose_tail_feature_3d, concave_3d_surfboard); 0.32::true_val(nose_tail_feature_3d, unk_nose_tail_feature_3d).

0.78::acc(s94, nose_tail_feature_3d).

measured(s94, nose_tail_feature_3d, concave_3d_surfboard).

all_consistent(nose_tail_feature_3d) :- consistent(s94, nose_tail_feature_3d).

evidence(all_consistent(nose_tail_feature_3d)).
query(true_val(nose_tail_feature_3d, concave_3d_surfboard)).
query(true_val(nose_tail_feature_3d, unk_nose_tail_feature_3d)).

% @attr reviewer_opinion_tgr_boot_sizes
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (boot size recs)
% @values us7_8_152_us8_9_156_us9_10_160_us10_11_164=152_US7_8_156_US8_9_160_US9_10_164_US10_11 unk_reviewer_opinion_tgr_boot_sizes=Unknown
% @importance 0.80

0.72::true_val(reviewer_opinion_tgr_boot_sizes, us7_8_152_us8_9_156_us9_10_160_us10_11_164); 0.28::true_val(reviewer_opinion_tgr_boot_sizes, unk_reviewer_opinion_tgr_boot_sizes).

0.85::acc(s95, reviewer_opinion_tgr_boot_sizes).

measured(s95, reviewer_opinion_tgr_boot_sizes, us7_8_152_us8_9_156_us9_10_160_us10_11_164).

all_consistent(reviewer_opinion_tgr_boot_sizes) :- consistent(s95, reviewer_opinion_tgr_boot_sizes).

evidence(all_consistent(reviewer_opinion_tgr_boot_sizes)).
query(true_val(reviewer_opinion_tgr_boot_sizes, us7_8_152_us8_9_156_us9_10_160_us10_11_164)).
query(true_val(reviewer_opinion_tgr_boot_sizes, unk_reviewer_opinion_tgr_boot_sizes)).

% @attr reviewer_opinion_tgr_stance_angles
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (stance angles tested)
% @values p18_n3_p18_p3_p24_p6_p27_p9=Plus18_neg3_Plus18_pos3_Plus24_pos6_Plus27_pos9 unk_reviewer_opinion_tgr_stance_angles=Unknown
% @importance 0.60

0.77::true_val(reviewer_opinion_tgr_stance_angles, p18_n3_p18_p3_p24_p6_p27_p9); 0.23::true_val(reviewer_opinion_tgr_stance_angles, unk_reviewer_opinion_tgr_stance_angles).

0.88::acc(s96, reviewer_opinion_tgr_stance_angles).

measured(s96, reviewer_opinion_tgr_stance_angles, p18_n3_p18_p3_p24_p6_p27_p9).

all_consistent(reviewer_opinion_tgr_stance_angles) :- consistent(s96, reviewer_opinion_tgr_stance_angles).

evidence(all_consistent(reviewer_opinion_tgr_stance_angles)).
query(true_val(reviewer_opinion_tgr_stance_angles, p18_n3_p18_p3_p24_p6_p27_p9)).
query(true_val(reviewer_opinion_tgr_stance_angles, unk_reviewer_opinion_tgr_stance_angles)).

% @attr reviewer_opinion_tgr_test_conditions
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (test conditions)
% @values five_days_spring_1in_pow_groomers=5_days_varied_spring_1in_powder_good_groomers unk_reviewer_opinion_tgr_test_conditions=Unknown
% @importance 0.50

0.81::true_val(reviewer_opinion_tgr_test_conditions, five_days_spring_1in_pow_groomers); 0.19::true_val(reviewer_opinion_tgr_test_conditions, unk_reviewer_opinion_tgr_test_conditions).

0.90::acc(s97, reviewer_opinion_tgr_test_conditions).

measured(s97, reviewer_opinion_tgr_test_conditions, five_days_spring_1in_pow_groomers).

all_consistent(reviewer_opinion_tgr_test_conditions) :- consistent(s97, reviewer_opinion_tgr_test_conditions).

evidence(all_consistent(reviewer_opinion_tgr_test_conditions)).
query(true_val(reviewer_opinion_tgr_test_conditions, five_days_spring_1in_pow_groomers)).
query(true_val(reviewer_opinion_tgr_test_conditions, unk_reviewer_opinion_tgr_test_conditions)).