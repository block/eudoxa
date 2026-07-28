0.20::indep(s6).
0.15::indep(s17).
0.15::indep(s18).
0.20::indep(s8).
0.15::indep(s9).
0.20::indep(s10).
0.25::indep(s11).
0.20::indep(s14).
0.20::indep(s25).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

0.95::acc(s1, brand).

% @attr brand
% @type categorical
% @canonical false
% @original_name brand
% @values lib_tech=Lib_Tech unk_brand=Unknown
% @importance 1.0

0.92::true_val(brand, lib_tech); 0.08::true_val(brand, unk_brand).
measured(s1, brand, lib_tech).
all_consistent(brand) :- consistent(s1, brand).
evidence(all_consistent(brand)).
query(true_val(brand, lib_tech)).
query(true_val(brand, unk_brand)).

0.95::acc(s1, model_name).
0.88::acc(s2, model_name).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values trs_total_ripper_series=TRS_Total_Ripper_Series unk_model_name=Unknown
% @importance 0.8

0.95::true_val(model_name, trs_total_ripper_series); 0.05::true_val(model_name, unk_model_name).
measured(s1, model_name, trs_total_ripper_series).
measured(s2, model_name, trs_total_ripper_series).
all_consistent(model_name) :- consistent(s1, model_name), consistent(s2, model_name).
evidence(all_consistent(model_name)).
query(true_val(model_name, trs_total_ripper_series)).
query(true_val(model_name, unk_model_name)).

0.95::acc(s1, manufacturer).
0.68::acc(s6, manufacturer).

% @attr manufacturer
% @type categorical
% @canonical false
% @original_name manufacturer
% @values mervin_manufacturing=Mervin_Manufacturing unk_manufacturer=Unknown
% @importance 0.675

0.95::true_val(manufacturer, mervin_manufacturing); 0.05::true_val(manufacturer, unk_manufacturer).
measured(s1, manufacturer, mervin_manufacturing).
measured(s6, manufacturer, mervin_manufacturing).
all_consistent(manufacturer) :- consistent(s1, manufacturer), (indep(s6), consistent(s6, manufacturer) ; \+indep(s6)).
evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, mervin_manufacturing)).
query(true_val(manufacturer, unk_manufacturer)).

0.95::acc(s1, model_year).

% @attr model_year
% @type categorical
% @canonical false
% @original_name model_year
% @values y2024_2025=2024-2025 unk_model_year=Unknown
% @importance 1.0

0.92::true_val(model_year, y2024_2025); 0.08::true_val(model_year, unk_model_year).
measured(s1, model_year, y2024_2025).
all_consistent(model_year) :- consistent(s1, model_year).
evidence(all_consistent(model_year)).
query(true_val(model_year, y2024_2025)).
query(true_val(model_year, unk_model_year)).

0.95::acc(s1, product_type).

% @attr product_type
% @type categorical
% @canonical false
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.92::true_val(product_type, snowboard); 0.08::true_val(product_type, unk_product_type).
measured(s1, product_type, snowboard).
all_consistent(product_type) :- consistent(s1, product_type).
evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

0.95::acc(s1, board_category).

% @attr board_category
% @type categorical
% @canonical false
% @original_name board_category
% @values freestyle_all_mountain=Freestyle_All_Mountain unk_board_category=Unknown
% @importance 1.0

0.92::true_val(board_category, freestyle_all_mountain); 0.08::true_val(board_category, unk_board_category).
measured(s1, board_category, freestyle_all_mountain).
all_consistent(board_category) :- consistent(s1, board_category).
evidence(all_consistent(board_category)).
query(true_val(board_category, freestyle_all_mountain)).
query(true_val(board_category, unk_board_category)).

0.93::acc(s1, model_name_variant).

% @attr model_name_variant
% @type categorical
% @canonical false
% @original_name model_name (HP variant)
% @values trs_hp_horsepower_pop=TRS_HP_Horsepower_Pop unk_model_name_variant=Unknown
% @importance 1.0

0.92::true_val(model_name_variant, trs_hp_horsepower_pop); 0.08::true_val(model_name_variant, unk_model_name_variant).
measured(s1, model_name_variant, trs_hp_horsepower_pop).
all_consistent(model_name_variant) :- consistent(s1, model_name_variant).
evidence(all_consistent(model_name_variant)).
query(true_val(model_name_variant, trs_hp_horsepower_pop)).
query(true_val(model_name_variant, unk_model_name_variant)).

0.95::acc(s1, sku_manufacturer).

% @attr sku_manufacturer
% @type categorical
% @canonical false
% @original_name SKU (manufacturer)
% @values trs_hp=trs-hp unk_sku_manufacturer=Unknown
% @importance 1.0

0.92::true_val(sku_manufacturer, trs_hp); 0.08::true_val(sku_manufacturer, unk_sku_manufacturer).
measured(s1, sku_manufacturer, trs_hp).
all_consistent(sku_manufacturer) :- consistent(s1, sku_manufacturer).
evidence(all_consistent(sku_manufacturer)).
query(true_val(sku_manufacturer, trs_hp)).
query(true_val(sku_manufacturer, unk_sku_manufacturer)).

0.80::acc(s3, model_first_available_year).

% @attr model_first_available_year
% @type categorical
% @canonical false
% @original_name model_first_available_year
% @values y2006=2006 unk_model_first_available_year=Unknown
% @importance 0.5

0.76::true_val(model_first_available_year, y2006); 0.24::true_val(model_first_available_year, unk_model_first_available_year).
measured(s3, model_first_available_year, y2006).
all_consistent(model_first_available_year) :- consistent(s3, model_first_available_year).
evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2006)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

0.88::acc(s2, trs_model_history).

% @attr trs_model_history
% @type categorical
% @canonical false
% @original_name TRS model history
% @values park_to_all_terrain=Originally_park_slopestyle_progressed_to_all_terrain unk_trs_model_history=Unknown
% @importance 0.6

0.81::true_val(trs_model_history, park_to_all_terrain); 0.19::true_val(trs_model_history, unk_trs_model_history).
measured(s2, trs_model_history, park_to_all_terrain).
all_consistent(trs_model_history) :- consistent(s2, trs_model_history).
evidence(all_consistent(trs_model_history)).
query(true_val(trs_model_history, park_to_all_terrain)).
query(true_val(trs_model_history, unk_trs_model_history)).

0.75::acc(s4, comparable_board_same_brand).

% @attr comparable_board_same_brand
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values lib_tech_no43=Lib_Tech_No43 unk_comparable_board_same_brand=Unknown
% @importance 0.35

0.63::true_val(comparable_board_same_brand, lib_tech_no43); 0.37::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).
measured(s4, comparable_board_same_brand, lib_tech_no43).
all_consistent(comparable_board_same_brand) :- consistent(s4, comparable_board_same_brand).
evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, lib_tech_no43)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

0.72::acc(s5, pro_rider_name).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values phil_hansen=Phil_Hansen unk_pro_rider_name=Unknown
% @importance 0.4

0.64::true_val(pro_rider_name, phil_hansen); 0.36::true_val(pro_rider_name, unk_pro_rider_name).
measured(s5, pro_rider_name, phil_hansen).
all_consistent(pro_rider_name) :- consistent(s5, pro_rider_name).
evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, phil_hansen)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

0.68::acc(s6, pro_rider_name_2).

% @attr pro_rider_name_2
% @type categorical
% @canonical false
% @original_name pro_rider_name (Joey Okesson and Liam Gill)
% @values joey_okesson_liam_gill=Joey_Okesson_and_Liam_Gill unk_pro_rider_name_2=Unknown
% @importance 0.35

0.55::true_val(pro_rider_name_2, joey_okesson_liam_gill); 0.45::true_val(pro_rider_name_2, unk_pro_rider_name_2).
measured(s6, pro_rider_name_2, joey_okesson_liam_gill).
all_consistent(pro_rider_name_2) :- consistent(s6, pro_rider_name_2).
evidence(all_consistent(pro_rider_name_2)).
query(true_val(pro_rider_name_2, joey_okesson_liam_gill)).
query(true_val(pro_rider_name_2, unk_pro_rider_name_2)).

0.80::acc(s7, pro_rider_name_3).

% @attr pro_rider_name_3
% @type categorical
% @canonical false
% @original_name pro_rider_name (EJack, Jamie Lynn, Fredi K)
% @values ejack_jamie_lynn_fredi_k=EJack_Jamie_Lynn_Fredi_K unk_pro_rider_name_3=Unknown
% @importance 0.85

0.78::true_val(pro_rider_name_3, ejack_jamie_lynn_fredi_k); 0.22::true_val(pro_rider_name_3, unk_pro_rider_name_3).
measured(s7, pro_rider_name_3, ejack_jamie_lynn_fredi_k).
all_consistent(pro_rider_name_3) :- consistent(s7, pro_rider_name_3).
evidence(all_consistent(pro_rider_name_3)).
query(true_val(pro_rider_name_3, ejack_jamie_lynn_fredi_k)).
query(true_val(pro_rider_name_3, unk_pro_rider_name_3)).

0.93::acc(s1, graphic_designer_artist).

% @attr graphic_designer_artist
% @type categorical
% @canonical false
% @original_name graphic_designer_artist
% @values phil_hansen_phliphansen=Phil_Hansen_phliphansen unk_graphic_designer_artist=Unknown
% @importance 1.0

0.92::true_val(graphic_designer_artist, phil_hansen_phliphansen); 0.08::true_val(graphic_designer_artist, unk_graphic_designer_artist).
measured(s1, graphic_designer_artist, phil_hansen_phliphansen).
all_consistent(graphic_designer_artist) :- consistent(s1, graphic_designer_artist).
evidence(all_consistent(graphic_designer_artist)).
query(true_val(graphic_designer_artist, phil_hansen_phliphansen)).
query(true_val(graphic_designer_artist, unk_graphic_designer_artist)).

0.90::acc(s1, shape).
0.65::acc(s8, shape).
0.68::acc(s9, shape).
0.65::acc(s10, shape).
0.75::acc(s11, shape).
0.82::acc(s12, shape).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values twin=Twin directional_twin=Directional_Twin true_twin=True_Twin
% @importance 0.79

0.38::true_val(shape, twin); 0.38::true_val(shape, directional_twin); 0.24::true_val(shape, true_twin).
measured(s1, shape, twin).
measured(s8, shape, twin).
measured(s9, shape, directional_twin).
measured(s10, shape, true_twin).
measured(s11, shape, directional_twin).
measured(s12, shape, directional_twin).
all_consistent(shape) :- consistent(s1, shape), consistent(s12, shape), (indep(s8), consistent(s8, shape) ; \+indep(s8)), (indep(s9), consistent(s9, shape) ; \+indep(s9)), (indep(s10), consistent(s10, shape) ; \+indep(s10)), (indep(s11), consistent(s11, shape) ; \+indep(s11)).
evidence(all_consistent(shape)).
query(true_val(shape, twin)).
query(true_val(shape, directional_twin)).
query(true_val(shape, true_twin)).

0.95::acc(s1, camber_type).

% @attr camber_type
% @type categorical
% @canonical false
% @original_name camber_type
% @values c3_camber=C3_Camber unk_camber_type=Unknown
% @importance 1.0

0.92::true_val(camber_type, c3_camber); 0.08::true_val(camber_type, unk_camber_type).
measured(s1, camber_type, c3_camber).
all_consistent(camber_type) :- consistent(s1, camber_type).
evidence(all_consistent(camber_type)).
query(true_val(camber_type, c3_camber)).
query(true_val(camber_type, unk_camber_type)).

0.82::acc(s7, camber_description).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values aggressive_camber_mild_rocker=Aggressive_dominant_camber_with_mild_rocker unk_camber_description=Unknown
% @importance 0.85

0.78::true_val(camber_description, aggressive_camber_mild_rocker); 0.22::true_val(camber_description, unk_camber_description).
measured(s7, camber_description, aggressive_camber_mild_rocker).
all_consistent(camber_description) :- consistent(s7, camber_description).
evidence(all_consistent(camber_description)).
query(true_val(camber_description, aggressive_camber_mild_rocker)).
query(true_val(camber_description, unk_camber_description)).

0.82::acc(s7, camber_description_2).

% @attr camber_description_2
% @type categorical
% @canonical false
% @original_name camber_description (subtle banana rocker)
% @values subtle_banana_freestyle_stability=Subtle_Banana_rocker_freestyle_freedom_stability unk_camber_description_2=Unknown
% @importance 0.85

0.78::true_val(camber_description_2, subtle_banana_freestyle_stability); 0.22::true_val(camber_description_2, unk_camber_description_2).
measured(s7, camber_description_2, subtle_banana_freestyle_stability).
all_consistent(camber_description_2) :- consistent(s7, camber_description_2).
evidence(all_consistent(camber_description_2)).
query(true_val(camber_description_2, subtle_banana_freestyle_stability)).
query(true_val(camber_description_2, unk_camber_description_2)).

0.85::acc(s13, camber_description_3).

% @attr camber_description_3
% @type categorical
% @canonical false
% @original_name camber_description (mellow C3)
% @values mellow_c3_less_camber=Mellow_C3_less_camber_than_Dynamo_Antigravity unk_camber_description_3=Unknown
% @importance 0.9

0.74::true_val(camber_description_3, mellow_c3_less_camber); 0.26::true_val(camber_description_3, unk_camber_description_3).
measured(s13, camber_description_3, mellow_c3_less_camber).
all_consistent(camber_description_3) :- consistent(s13, camber_description_3).
evidence(all_consistent(camber_description_3)).
query(true_val(camber_description_3, mellow_c3_less_camber)).
query(true_val(camber_description_3, unk_camber_description_3)).

0.95::acc(s1, setback).

% @attr setback
% @type numeric
% @unit inches
% @canonical false
% @original_name setback
% @values v0_5=0.5 unk_setback=Unknown
% @importance 1.0

0.92::true_val(setback, v0_5); 0.08::true_val(setback, unk_setback).
measured(s1, setback, v0_5).
all_consistent(setback) :- consistent(s1, setback).
evidence(all_consistent(setback)).
query(true_val(setback, v0_5)).
query(true_val(setback, unk_setback)).

0.93::acc(s1, flex_rating_10_manufacturer).

% @attr flex_rating_10_manufacturer
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10_manufacturer (157)
% @values v6=6.0 unk_flex_rating_10_manufacturer=Unknown
% @importance 1.0

0.92::true_val(flex_rating_10_manufacturer, v6); 0.08::true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer).
measured(s1, flex_rating_10_manufacturer, v6).
all_consistent(flex_rating_10_manufacturer) :- consistent(s1, flex_rating_10_manufacturer).
evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, v6)).
query(true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer)).

0.93::acc(s1, flex_rating_10_manufacturer_154).

% @attr flex_rating_10_manufacturer_154
% @type numeric
% @unit /10
% @canonical false
% @original_name flex_rating_10_manufacturer (154)
% @values v5=5.0 unk_flex_rating_10_manufacturer_154=Unknown
% @importance 1.0

0.92::true_val(flex_rating_10_manufacturer_154, v5); 0.08::true_val(flex_rating_10_manufacturer_154, unk_flex_rating_10_manufacturer_154).
measured(s1, flex_rating_10_manufacturer_154, v5).
all_consistent(flex_rating_10_manufacturer_154) :- consistent(s1, flex_rating_10_manufacturer_154).
evidence(all_consistent(flex_rating_10_manufacturer_154)).
query(true_val(flex_rating_10_manufacturer_154, v5)).
query(true_val(flex_rating_10_manufacturer_154, unk_flex_rating_10_manufacturer_154)).

0.93::acc(s1, flex_rating_10_manufacturer_157w).

% @attr flex_rating_10_manufacturer_157w
% @type numeric
% @unit /10
% @canonical false
% @original_name flex_rating_10_manufacturer (157W)
% @values v6=6.0 unk_flex_rating_10_manufacturer_157w=Unknown
% @importance 1.0

0.92::true_val(flex_rating_10_manufacturer_157w, v6); 0.08::true_val(flex_rating_10_manufacturer_157w, unk_flex_rating_10_manufacturer_157w).
measured(s1, flex_rating_10_manufacturer_157w, v6).
all_consistent(flex_rating_10_manufacturer_157w) :- consistent(s1, flex_rating_10_manufacturer_157w).
evidence(all_consistent(flex_rating_10_manufacturer_157w)).
query(true_val(flex_rating_10_manufacturer_157w, v6)).
query(true_val(flex_rating_10_manufacturer_157w, unk_flex_rating_10_manufacturer_157w)).

0.93::acc(s1, flex_rating_10_manufacturer_159).

% @attr flex_rating_10_manufacturer_159
% @type numeric
% @unit /10
% @canonical false
% @original_name flex_rating_10_manufacturer (159)
% @values v6=6.0 unk_flex_rating_10_manufacturer_159=Unknown
% @importance 1.0

0.92::true_val(flex_rating_10_manufacturer_159, v6); 0.08::true_val(flex_rating_10_manufacturer_159, unk_flex_rating_10_manufacturer_159).
measured(s1, flex_rating_10_manufacturer_159, v6).
all_consistent(flex_rating_10_manufacturer_159) :- consistent(s1, flex_rating_10_manufacturer_159).
evidence(all_consistent(flex_rating_10_manufacturer_159)).
query(true_val(flex_rating_10_manufacturer_159, v6)).
query(true_val(flex_rating_10_manufacturer_159, unk_flex_rating_10_manufacturer_159)).

0.93::acc(s1, flex_rating_10_manufacturer_159w).

% @attr flex_rating_10_manufacturer_159w
% @type numeric
% @unit /10
% @canonical false
% @original_name flex_rating_10_manufacturer (159W)
% @values v6=6.0 unk_flex_rating_10_manufacturer_159w=Unknown
% @importance 1.0

0.92::true_val(flex_rating_10_manufacturer_159w, v6); 0.08::true_val(flex_rating_10_manufacturer_159w, unk_flex_rating_10_manufacturer_159w).
measured(s1, flex_rating_10_manufacturer_159w, v6).
all_consistent(flex_rating_10_manufacturer_159w) :- consistent(s1, flex_rating_10_manufacturer_159w).
evidence(all_consistent(flex_rating_10_manufacturer_159w)).
query(true_val(flex_rating_10_manufacturer_159w, v6)).
query(true_val(flex_rating_10_manufacturer_159w, unk_flex_rating_10_manufacturer_159w)).

0.93::acc(s1, flex_rating_10_manufacturer_162).

% @attr flex_rating_10_manufacturer_162
% @type numeric
% @unit /10
% @canonical false
% @original_name flex_rating_10_manufacturer (162)
% @values v7=7.0 unk_flex_rating_10_manufacturer_162=Unknown
% @importance 1.0

0.92::true_val(flex_rating_10_manufacturer_162, v7); 0.08::true_val(flex_rating_10_manufacturer_162, unk_flex_rating_10_manufacturer_162).
measured(s1, flex_rating_10_manufacturer_162, v7).
all_consistent(flex_rating_10_manufacturer_162) :- consistent(s1, flex_rating_10_manufacturer_162).
evidence(all_consistent(flex_rating_10_manufacturer_162)).
query(true_val(flex_rating_10_manufacturer_162, v7)).
query(true_val(flex_rating_10_manufacturer_162, unk_flex_rating_10_manufacturer_162)).

0.80::acc(s7, flex_rating_10_evo).

% @attr flex_rating_10_evo
% @type categorical
% @canonical false
% @original_name flex_rating_10_evo
% @values medium_stiff=Medium_Stiff_stout_enough_to_charge unk_flex_rating_10_evo=Unknown
% @importance 0.85

0.78::true_val(flex_rating_10_evo, medium_stiff); 0.22::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).
measured(s7, flex_rating_10_evo, medium_stiff).
all_consistent(flex_rating_10_evo) :- consistent(s7, flex_rating_10_evo).
evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, medium_stiff)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

0.70::acc(s10, flex_feel).
0.75::acc(s15, flex_feel).
0.55::acc(s16, flex_feel).
0.85::acc(s13, flex_feel).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values medium_stiff_smooth=Medium_stiff_smooth_stable medium_ish=Medium_ish_flex softer_than_rated=Feels_softer_5_10_despite_mid_stiff_label
% @importance 0.81

0.27::true_val(flex_feel, medium_stiff_smooth); 0.34::true_val(flex_feel, medium_ish); 0.39::true_val(flex_feel, softer_than_rated).
measured(s10, flex_feel, medium_stiff_smooth).
measured(s15, flex_feel, softer_than_rated).
measured(s16, flex_feel, softer_than_rated).
measured(s13, flex_feel, medium_ish).
all_consistent(flex_feel) :- consistent(s13, flex_feel), consistent(s15, flex_feel), consistent(s16, flex_feel), (indep(s10), consistent(s10, flex_feel) ; \+indep(s10)).
evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium_stiff_smooth)).
query(true_val(flex_feel, medium_ish)).
query(true_val(flex_feel, softer_than_rated)).

0.90::acc(s1, flex_rating_10).
0.55::acc(s14, flex_rating_10).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical false
% @original_name flex_rating_10 (retailer vs manufacturer)
% @values v6=6.0 v7=7.0
% @importance 0.8

0.72::true_val(flex_rating_10, v6); 0.28::true_val(flex_rating_10, v7).
measured(s1, flex_rating_10, v6).
measured(s14, flex_rating_10, v7).
all_consistent(flex_rating_10) :- consistent(s1, flex_rating_10), (indep(s14), consistent(s14, flex_rating_10) ; \+indep(s14)).
evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v6)).
query(true_val(flex_rating_10, v7)).

0.93::acc(s1, core_material).
0.72::acc(s17, core_material).

% @attr core_material
% @type categorical
% @canonical false
% @original_name core_material
% @values hpp_aspen_paulownia=HPP_60pct_Aspen_40pct_Paulownia unk_core_material=Unknown
% @importance 0.925

0.95::true_val(core_material, hpp_aspen_paulownia); 0.05::true_val(core_material, unk_core_material).
measured(s1, core_material, hpp_aspen_paulownia).
measured(s17, core_material, hpp_aspen_paulownia).
all_consistent(core_material) :- consistent(s1, core_material), (indep(s17), consistent(s17, core_material) ; \+indep(s17)).
evidence(all_consistent(core_material)).
query(true_val(core_material, hpp_aspen_paulownia)).
query(true_val(core_material, unk_core_material)).

0.93::acc(s1, sustainability_certification).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values fsc_certified=FSC_certified unk_sustainability_certification=Unknown
% @importance 1.0

0.92::true_val(sustainability_certification, fsc_certified); 0.08::true_val(sustainability_certification, unk_sustainability_certification).
measured(s1, sustainability_certification, fsc_certified).
all_consistent(sustainability_certification) :- consistent(s1, sustainability_certification).
evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, fsc_certified)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

0.72::acc(s17, laminate).

% @attr laminate
% @type categorical
% @canonical false
% @original_name laminate
% @values triax_biax_mag_carbon=Triaxial_Biaxial_Fiberglass_Magnesium_Carbon unk_laminate=Unknown
% @importance 0.85

0.71::true_val(laminate, triax_biax_mag_carbon); 0.29::true_val(laminate, unk_laminate).
measured(s17, laminate, triax_biax_mag_carbon).
all_consistent(laminate) :- consistent(s17, laminate).
evidence(all_consistent(laminate)).
query(true_val(laminate, triax_biax_mag_carbon)).
query(true_val(laminate, unk_laminate)).

0.93::acc(s1, construction_material_innovation).
0.72::acc(s17, construction_material_innovation).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation (carbon)
% @values carbon_in_construction=Carbon_included_in_construction unk_construction_material_innovation=Unknown
% @importance 0.925

0.95::true_val(construction_material_innovation, carbon_in_construction); 0.05::true_val(construction_material_innovation, unk_construction_material_innovation).
measured(s1, construction_material_innovation, carbon_in_construction).
measured(s17, construction_material_innovation, carbon_in_construction).
all_consistent(construction_material_innovation) :- consistent(s1, construction_material_innovation), (indep(s17), consistent(s17, construction_material_innovation) ; \+indep(s17)).
evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, carbon_in_construction)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

0.72::acc(s17, construction_material_innovation_magnesium).

% @attr construction_material_innovation_magnesium
% @type categorical
% @canonical false
% @original_name construction_material_innovation (magnesium fiber)
% @values high_mag_glass_fiber=High_magnesium_glass_fiber_high_tensile_strength unk_construction_material_innovation_magnesium=Unknown
% @importance 0.85

0.71::true_val(construction_material_innovation_magnesium, high_mag_glass_fiber); 0.29::true_val(construction_material_innovation_magnesium, unk_construction_material_innovation_magnesium).
measured(s17, construction_material_innovation_magnesium, high_mag_glass_fiber).
all_consistent(construction_material_innovation_magnesium) :- consistent(s17, construction_material_innovation_magnesium).
evidence(all_consistent(construction_material_innovation_magnesium)).
query(true_val(construction_material_innovation_magnesium, high_mag_glass_fiber)).
query(true_val(construction_material_innovation_magnesium, unk_construction_material_innovation_magnesium)).

0.93::acc(s1, construction_material_innovation_org_throttle).
0.60::acc(s6, construction_material_innovation_org_throttle).
0.60::acc(s18, construction_material_innovation_org_throttle).

% @attr construction_material_innovation_org_throttle
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Org-Throttle material)
% @values maple=Maple bamboo=Bamboo
% @importance 0.72

0.52::true_val(construction_material_innovation_org_throttle, maple); 0.48::true_val(construction_material_innovation_org_throttle, bamboo).
measured(s1, construction_material_innovation_org_throttle, maple).
measured(s6, construction_material_innovation_org_throttle, bamboo).
measured(s18, construction_material_innovation_org_throttle, bamboo).
all_consistent(construction_material_innovation_org_throttle) :- consistent(s1, construction_material_innovation_org_throttle), (indep(s6), consistent(s6, construction_material_innovation_org_throttle) ; \+indep(s6)), (indep(s18), consistent(s18, construction_material_innovation_org_throttle) ; \+indep(s18)).
evidence(all_consistent(construction_material_innovation_org_throttle)).
query(true_val(construction_material_innovation_org_throttle, maple)).
query(true_val(construction_material_innovation_org_throttle, bamboo)).

0.72::acc(s17, construction_material_innovation_uhmw).

% @attr construction_material_innovation_uhmw
% @type categorical
% @canonical false
% @original_name construction_material_innovation (UHMW Tip/Tail)
% @values uhmw_tip_tail=UHMW_Tip_Tail_Impact_Deflection unk_construction_material_innovation_uhmw=Unknown
% @importance 0.85

0.71::true_val(construction_material_innovation_uhmw, uhmw_tip_tail); 0.29::true_val(construction_material_innovation_uhmw, unk_construction_material_innovation_uhmw).
measured(s17, construction_material_innovation_uhmw, uhmw_tip_tail).
all_consistent(construction_material_innovation_uhmw) :- consistent(s17, construction_material_innovation_uhmw).
evidence(all_consistent(construction_material_innovation_uhmw)).
query(true_val(construction_material_innovation_uhmw, uhmw_tip_tail)).
query(true_val(construction_material_innovation_uhmw, unk_construction_material_innovation_uhmw)).

0.72::acc(s17, construction_material_innovation_hpp).

% @attr construction_material_innovation_hpp
% @type categorical
% @canonical false
% @original_name construction_material_innovation (HPP designation)
% @values hpp_mag_techno_fiber=HPP_with_Magnesium_Techno_Fiber_Bands unk_construction_material_innovation_hpp=Unknown
% @importance 0.85

0.71::true_val(construction_material_innovation_hpp, hpp_mag_techno_fiber); 0.29::true_val(construction_material_innovation_hpp, unk_construction_material_innovation_hpp).
measured(s17, construction_material_innovation_hpp, hpp_mag_techno_fiber).
all_consistent(construction_material_innovation_hpp) :- consistent(s17, construction_material_innovation_hpp).
evidence(all_consistent(construction_material_innovation_hpp)).
query(true_val(construction_material_innovation_hpp, hpp_mag_techno_fiber)).
query(true_val(construction_material_innovation_hpp, unk_construction_material_innovation_hpp)).

0.72::acc(s17, sidewall_material).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material (birch internal)
% @values birch_6ply=Birch_Internal_6ply_Sidewalls unk_sidewall_material=Unknown
% @importance 0.85

0.71::true_val(sidewall_material, birch_6ply); 0.29::true_val(sidewall_material, unk_sidewall_material).
measured(s17, sidewall_material, birch_6ply).
all_consistent(sidewall_material) :- consistent(s17, sidewall_material).
evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, birch_6ply)).
query(true_val(sidewall_material, unk_sidewall_material)).

0.72::acc(s17, sidewall_material_uhmw).

% @attr sidewall_material_uhmw
% @type categorical
% @canonical false
% @original_name sidewall_material (UHMW sintered)
% @values uhmw_sintered=UHMW_Sintered_Sidewalls unk_sidewall_material_uhmw=Unknown
% @importance 0.85

0.71::true_val(sidewall_material_uhmw, uhmw_sintered); 0.29::true_val(sidewall_material_uhmw, unk_sidewall_material_uhmw).
measured(s17, sidewall_material_uhmw, uhmw_sintered).
all_consistent(sidewall_material_uhmw) :- consistent(s17, sidewall_material_uhmw).
evidence(all_consistent(sidewall_material_uhmw)).
query(true_val(sidewall_material_uhmw, uhmw_sintered)).
query(true_val(sidewall_material_uhmw, unk_sidewall_material_uhmw)).

0.72::acc(s17, topsheet).

% @attr topsheet
% @type categorical
% @canonical false
% @original_name topsheet
% @values eco_sublimated_poly=Eco_Sublimated_Poly_Top unk_topsheet=Unknown
% @importance 0.85

0.71::true_val(topsheet, eco_sublimated_poly); 0.29::true_val(topsheet, unk_topsheet).
measured(s17, topsheet, eco_sublimated_poly).
all_consistent(topsheet) :- consistent(s17, topsheet).
evidence(all_consistent(topsheet)).
query(true_val(topsheet, eco_sublimated_poly)).
query(true_val(topsheet, unk_topsheet)).

0.70::acc(s9, base_material).

% @attr base_material
% @type categorical
% @canonical false
% @original_name base_material
% @values sintered_knife_cut=Sintered_Knife_Cut_Double_Layer_UHMW unk_base_material=Unknown
% @importance 0.85

0.63::true_val(base_material, sintered_knife_cut); 0.37::true_val(base_material, unk_base_material).
measured(s9, base_material, sintered_knife_cut).
all_consistent(base_material) :- consistent(s9, base_material).
evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_knife_cut)).
query(true_val(base_material, unk_base_material)).

0.68::acc(s9, base_maintenance).

% @attr base_maintenance
% @type categorical
% @canonical false
% @original_name base maintenance
% @values regular_wax_pro_repair=Regular_waxing_professional_repairs_required unk_base_maintenance=Unknown
% @importance 0.85

0.63::true_val(base_maintenance, regular_wax_pro_repair); 0.37::true_val(base_maintenance, unk_base_maintenance).
measured(s9, base_maintenance, regular_wax_pro_repair).
all_consistent(base_maintenance) :- consistent(s9, base_maintenance).
evidence(all_consistent(base_maintenance)).
query(true_val(base_maintenance, regular_wax_pro_repair)).
query(true_val(base_maintenance, unk_base_maintenance)).

0.72::acc(s8, available_colors).

% @attr available_colors
% @type categorical
% @canonical false
% @original_name available_colors
% @values random=Random unk_available_colors=Unknown
% @importance 0.8

0.71::true_val(available_colors, random); 0.29::true_val(available_colors, unk_available_colors).
measured(s8, available_colors, random).
all_consistent(available_colors) :- consistent(s8, available_colors).
evidence(all_consistent(available_colors)).
query(true_val(available_colors, random)).
query(true_val(available_colors, unk_available_colors)).

0.70::acc(s9, edge_technology).

% @attr edge_technology
% @type categorical
% @canonical false
% @original_name edge_technology
% @values magne_traction_7pt=Magne_Traction_7_serrations unk_edge_technology=Unknown
% @importance 0.85

0.63::true_val(edge_technology, magne_traction_7pt); 0.37::true_val(edge_technology, unk_edge_technology).
measured(s9, edge_technology, magne_traction_7pt).
all_consistent(edge_technology) :- consistent(s9, edge_technology).
evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, magne_traction_7pt)).
query(true_val(edge_technology, unk_edge_technology)).

0.70::acc(s9, mounting_pattern).

% @attr mounting_pattern
% @type categorical
% @canonical false
% @original_name mounting_pattern
% @values inserts_2x4=2x4_inserts unk_mounting_pattern=Unknown
% @importance 0.85

0.63::true_val(mounting_pattern, inserts_2x4); 0.37::true_val(mounting_pattern, unk_mounting_pattern).
measured(s9, mounting_pattern, inserts_2x4).
all_consistent(mounting_pattern) :- consistent(s9, mounting_pattern).
evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

0.72::acc(s17, manufacturing_location).

% @attr manufacturing_location
% @type categorical
% @canonical false
% @original_name manufacturing_location
% @values mervin_factory_wa_usa=Mervin_Factory_Washington_USA unk_manufacturing_location=Unknown
% @importance 0.85

0.71::true_val(manufacturing_location, mervin_factory_wa_usa); 0.29::true_val(manufacturing_location, unk_manufacturing_location).
measured(s17, manufacturing_location, mervin_factory_wa_usa).
all_consistent(manufacturing_location) :- consistent(s17, manufacturing_location).
evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, mervin_factory_wa_usa)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

0.72::acc(s17, sustainability_certification_zero_waste).
0.85::acc(s19, sustainability_certification_zero_waste).

% @attr sustainability_certification_zero_waste
% @type categorical
% @canonical false
% @original_name sustainability_certification (zero hazardous waste)
% @values zero_hazardous_waste=Zero_hazardous_waste_manufacturing unk_sustainability_certification_zero_waste=Unknown
% @importance 0.675

0.95::true_val(sustainability_certification_zero_waste, zero_hazardous_waste); 0.05::true_val(sustainability_certification_zero_waste, unk_sustainability_certification_zero_waste).
measured(s17, sustainability_certification_zero_waste, zero_hazardous_waste).
measured(s19, sustainability_certification_zero_waste, zero_hazardous_waste).
all_consistent(sustainability_certification_zero_waste) :- consistent(s19, sustainability_certification_zero_waste), (indep(s17), consistent(s17, sustainability_certification_zero_waste) ; \+indep(s17)).
evidence(all_consistent(sustainability_certification_zero_waste)).
query(true_val(sustainability_certification_zero_waste, zero_hazardous_waste)).
query(true_val(sustainability_certification_zero_waste, unk_sustainability_certification_zero_waste)).

0.93::acc(s1, available_sizes).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes (regular)
% @values s154_157_159_162=154cm_157cm_159cm_162cm unk_available_sizes=Unknown
% @importance 1.0

0.92::true_val(available_sizes, s154_157_159_162); 0.08::true_val(available_sizes, unk_available_sizes).
measured(s1, available_sizes, s154_157_159_162).
all_consistent(available_sizes) :- consistent(s1, available_sizes).
evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, s154_157_159_162)).
query(true_val(available_sizes, unk_available_sizes)).

0.93::acc(s1, available_sizes_wide).

% @attr available_sizes_wide
% @type categorical
% @canonical false
% @original_name available_sizes (wide)
% @values s157w_159w=157W_159W unk_available_sizes_wide=Unknown
% @importance 1.0

0.92::true_val(available_sizes_wide, s157w_159w); 0.08::true_val(available_sizes_wide, unk_available_sizes_wide).
measured(s1, available_sizes_wide, s157w_159w).
all_consistent(available_sizes_wide) :- consistent(s1, available_sizes_wide).
evidence(all_consistent(available_sizes_wide)).
query(true_val(available_sizes_wide, s157w_159w)).
query(true_val(available_sizes_wide, unk_available_sizes_wide)).

0.93::acc(s1, contact_length_size_154).

% @attr contact_length_size_154
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size (154)
% @values v115=115.0 unk_contact_length_size_154=Unknown
% @importance 1.0

0.92::true_val(contact_length_size_154, v115); 0.08::true_val(contact_length_size_154, unk_contact_length_size_154).
measured(s1, contact_length_size_154, v115).
all_consistent(contact_length_size_154) :- consistent(s1, contact_length_size_154).
evidence(all_consistent(contact_length_size_154)).
query(true_val(contact_length_size_154, v115)).
query(true_val(contact_length_size_154, unk_contact_length_size_154)).

0.93::acc(s1, sidecut_radius_size_154).

% @attr sidecut_radius_size_154
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (154)
% @values v8_2=8.2 unk_sidecut_radius_size_154=Unknown
% @importance 1.0

0.92::true_val(sidecut_radius_size_154, v8_2); 0.08::true_val(sidecut_radius_size_154, unk_sidecut_radius_size_154).
measured(s1, sidecut_radius_size_154, v8_2).
all_consistent(sidecut_radius_size_154) :- consistent(s1, sidecut_radius_size_154).
evidence(all_consistent(sidecut_radius_size_154)).
query(true_val(sidecut_radius_size_154, v8_2)).
query(true_val(sidecut_radius_size_154, unk_sidecut_radius_size_154)).

0.93::acc(s1, tip_tail_width_size_154).

% @attr tip_tail_width_size_154
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (154)
% @values v29_2=29.2 unk_tip_tail_width_size_154=Unknown
% @importance 1.0

0.92::true_val(tip_tail_width_size_154, v29_2); 0.08::true_val(tip_tail_width_size_154, unk_tip_tail_width_size_154).
measured(s1, tip_tail_width_size_154, v29_2).
all_consistent(tip_tail_width_size_154) :- consistent(s1, tip_tail_width_size_154).
evidence(all_consistent(tip_tail_width_size_154)).
query(true_val(tip_tail_width_size_154, v29_2)).
query(true_val(tip_tail_width_size_154, unk_tip_tail_width_size_154)).

0.93::acc(s1, waist_width_154).

% @attr waist_width_154
% @type numeric
% @unit cm
% @canonical false
% @original_name waist width (154)
% @values v25_3=25.3 unk_waist_width_154=Unknown
% @importance 1.0

0.92::true_val(waist_width_154, v25_3); 0.08::true_val(waist_width_154, unk_waist_width_154).
measured(s1, waist_width_154, v25_3).
all_consistent(waist_width_154) :- consistent(s1, waist_width_154).
evidence(all_consistent(waist_width_154)).
query(true_val(waist_width_154, v25_3)).
query(true_val(waist_width_154, unk_waist_width_154)).

0.93::acc(s1, stance_width_range_size_154).

% @attr stance_width_range_size_154
% @type categorical
% @canonical false
% @original_name stance_width_range_size (154)
% @values r20_25_to_25=20.25in_to_25in_0.5in_increments unk_stance_width_range_size_154=Unknown
% @importance 1.0

0.92::true_val(stance_width_range_size_154, r20_25_to_25); 0.08::true_val(stance_width_range_size_154, unk_stance_width_range_size_154).
measured(s1, stance_width_range_size_154, r20_25_to_25).
all_consistent(stance_width_range_size_154) :- consistent(s1, stance_width_range_size_154).
evidence(all_consistent(stance_width_range_size_154)).
query(true_val(stance_width_range_size_154, r20_25_to_25)).
query(true_val(stance_width_range_size_154, unk_stance_width_range_size_154)).

0.93::acc(s1, recommended_weight_range_size_154).

% @attr recommended_weight_range_size_154
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (154)
% @values w120_plus_lbs=120_plus_lbs_54_plus_kg unk_recommended_weight_range_size_154=Unknown
% @importance 1.0

0.92::true_val(recommended_weight_range_size_154, w120_plus_lbs); 0.08::true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154).
measured(s1, recommended_weight_range_size_154, w120_plus_lbs).
all_consistent(recommended_weight_range_size_154) :- consistent(s1, recommended_weight_range_size_154).
evidence(all_consistent(recommended_weight_range_size_154)).
query(true_val(recommended_weight_range_size_154, w120_plus_lbs)).
query(true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154)).

0.93::acc(s1, contact_length_size).

% @attr contact_length_size
% @type numeric
% @unit cm
% @canonical true
% @original_name contact_length_size (157)
% @values v117=117.0 unk_contact_length_size=Unknown
% @importance 1.0

0.92::true_val(contact_length_size, v117); 0.08::true_val(contact_length_size, unk_contact_length_size).
measured(s1, contact_length_size, v117).
all_consistent(contact_length_size) :- consistent(s1, contact_length_size).
evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v117)).
query(true_val(contact_length_size, unk_contact_length_size)).

0.93::acc(s1, sidecut_radius_size).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size (157)
% @values v8_3=8.3 unk_sidecut_radius_size=Unknown
% @importance 1.0

0.92::true_val(sidecut_radius_size, v8_3); 0.08::true_val(sidecut_radius_size, unk_sidecut_radius_size).
measured(s1, sidecut_radius_size, v8_3).
all_consistent(sidecut_radius_size) :- consistent(s1, sidecut_radius_size).
evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v8_3)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

0.93::acc(s1, tip_tail_width_size).

% @attr tip_tail_width_size
% @type numeric
% @unit cm
% @canonical true
% @original_name tip_tail_width_size (157)
% @values v29_3=29.3 unk_tip_tail_width_size=Unknown
% @importance 1.0

0.92::true_val(tip_tail_width_size, v29_3); 0.08::true_val(tip_tail_width_size, unk_tip_tail_width_size).
measured(s1, tip_tail_width_size, v29_3).
all_consistent(tip_tail_width_size) :- consistent(s1, tip_tail_width_size).
evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v29_3)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

0.93::acc(s1, waist_width_157).

% @attr waist_width_157
% @type numeric
% @unit cm
% @canonical false
% @original_name waist width (157)
% @values v25_3=25.3 unk_waist_width_157=Unknown
% @importance 1.0

0.92::true_val(waist_width_157, v25_3); 0.08::true_val(waist_width_157, unk_waist_width_157).
measured(s1, waist_width_157, v25_3).
all_consistent(waist_width_157) :- consistent(s1, waist_width_157).
evidence(all_consistent(waist_width_157)).
query(true_val(waist_width_157, v25_3)).
query(true_val(waist_width_157, unk_waist_width_157)).

0.93::acc(s1, recommended_weight_range_size).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size (157)
% @values w130_plus_lbs=130_plus_lbs_59_plus_kg unk_recommended_weight_range_size=Unknown
% @importance 1.0

0.92::true_val(recommended_weight_range_size, w130_plus_lbs); 0.08::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).
measured(s1, recommended_weight_range_size, w130_plus_lbs).
all_consistent(recommended_weight_range_size) :- consistent(s1, recommended_weight_range_size).
evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w130_plus_lbs)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

0.93::acc(s1, contact_length_size_157w).

% @attr contact_length_size_157w
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size (157W)
% @values v117=117.0 unk_contact_length_size_157w=Unknown
% @importance 1.0

0.92::true_val(contact_length_size_157w, v117); 0.08::true_val(contact_length_size_157w, unk_contact_length_size_157w).
measured(s1, contact_length_size_157w, v117).
all_consistent(contact_length_size_157w) :- consistent(s1, contact_length_size_157w).
evidence(all_consistent(contact_length_size_157w)).
query(true_val(contact_length_size_157w, v117)).
query(true_val(contact_length_size_157w, unk_contact_length_size_157w)).

0.93::acc(s1, sidecut_radius_size_157w).

% @attr sidecut_radius_size_157w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (157W)
% @values v8_3=8.3 unk_sidecut_radius_size_157w=Unknown
% @importance 1.0

0.92::true_val(sidecut_radius_size_157w, v8_3); 0.08::true_val(sidecut_radius_size_157w, unk_sidecut_radius_size_157w).
measured(s1, sidecut_radius_size_157w, v8_3).
all_consistent(sidecut_radius_size_157w) :- consistent(s1, sidecut_radius_size_157w).
evidence(all_consistent(sidecut_radius_size_157w)).
query(true_val(sidecut_radius_size_157w, v8_3)).
query(true_val(sidecut_radius_size_157w, unk_sidecut_radius_size_157w)).

0.93::acc(s1, tip_tail_width_size_157w).

% @attr tip_tail_width_size_157w
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (157W)
% @values v30_1=30.1 unk_tip_tail_width_size_157w=Unknown
% @importance 1.0

0.92::true_val(tip_tail_width_size_157w, v30_1); 0.08::true_val(tip_tail_width_size_157w, unk_tip_tail_width_size_157w).
measured(s1, tip_tail_width_size_157w, v30_1).
all_consistent(tip_tail_width_size_157w) :- consistent(s1, tip_tail_width_size_157w).
evidence(all_consistent(tip_tail_width_size_157w)).
query(true_val(tip_tail_width_size_157w, v30_1)).
query(true_val(tip_tail_width_size_157w, unk_tip_tail_width_size_157w)).

0.93::acc(s1, waist_width_157w).

% @attr waist_width_157w
% @type numeric
% @unit cm
% @canonical false
% @original_name waist width (157W)
% @values v26_0=26.0 unk_waist_width_157w=Unknown
% @importance 1.0

0.92::true_val(waist_width_157w, v26_0); 0.08::true_val(waist_width_157w, unk_waist_width_157w).
measured(s1, waist_width_157w, v26_0).
all_consistent(waist_width_157w) :- consistent(s1, waist_width_157w).
evidence(all_consistent(waist_width_157w)).
query(true_val(waist_width_157w, v26_0)).
query(true_val(waist_width_157w, unk_waist_width_157w)).

0.93::acc(s1, recommended_weight_range_size_157w).

% @attr recommended_weight_range_size_157w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (157W)
% @values w130_plus_lbs=130_plus_lbs_59_plus_kg unk_recommended_weight_range_size_157w=Unknown
% @importance 1.0

0.92::true_val(recommended_weight_range_size_157w, w130_plus_lbs); 0.08::true_val(recommended_weight_range_size_157w, unk_recommended_weight_range_size_157w).
measured(s1, recommended_weight_range_size_157w, w130_plus_lbs).
all_consistent(recommended_weight_range_size_157w) :- consistent(s1, recommended_weight_range_size_157w).
evidence(all_consistent(recommended_weight_range_size_157w)).
query(true_val(recommended_weight_range_size_157w, w130_plus_lbs)).
query(true_val(recommended_weight_range_size_157w, unk_recommended_weight_range_size_157w)).

0.93::acc(s1, contact_length_size_159).

% @attr contact_length_size_159
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size (159)
% @values v119=119.0 unk_contact_length_size_159=Unknown
% @importance 1.0

0.92::true_val(contact_length_size_159, v119); 0.08::true_val(contact_length_size_159, unk_contact_length_size_159).
measured(s1, contact_length_size_159, v119).
all_consistent(contact_length_size_159) :- consistent(s1, contact_length_size_159).
evidence(all_consistent(contact_length_size_159)).
query(true_val(contact_length_size_159, v119)).
query(true_val(contact_length_size_159, unk_contact_length_size_159)).

0.93::acc(s1, sidecut_radius_size_159).

% @attr sidecut_radius_size_159
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (159)
% @values v8_32=8.32 unk_sidecut_radius_size_159=Unknown
% @importance 1.0

0.92::true_val(sidecut_radius_size_159, v8_32); 0.08::true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159).
measured(s1, sidecut_radius_size_159, v8_32).
all_consistent(sidecut_radius_size_159) :- consistent(s1, sidecut_radius_size_159).
evidence(all_consistent(sidecut_radius_size_159)).
query(true_val(sidecut_radius_size_159, v8_32)).
query(true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159)).

0.93::acc(s1, tip_tail_width_size_159).

% @attr tip_tail_width_size_159
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (159)
% @values v29_4=29.4 unk_tip_tail_width_size_159=Unknown
% @importance 1.0

0.92::true_val(tip_tail_width_size_159, v29_4); 0.08::true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159).
measured(s1, tip_tail_width_size_159, v29_4).
all_consistent(tip_tail_width_size_159) :- consistent(s1, tip_tail_width_size_159).
evidence(all_consistent(tip_tail_width_size_159)).
query(true_val(tip_tail_width_size_159, v29_4)).
query(true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159)).

0.93::acc(s1, waist_width_159).

% @attr waist_width_159
% @type numeric
% @unit cm
% @canonical false
% @original_name waist width (159)
% @values v25_3=25.3 unk_waist_width_159=Unknown
% @importance 1.0

0.92::true_val(waist_width_159, v25_3); 0.08::true_val(waist_width_159, unk_waist_width_159).
measured(s1, waist_width_159, v25_3).
all_consistent(waist_width_159) :- consistent(s1, waist_width_159).
evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v25_3)).
query(true_val(waist_width_159, unk_waist_width_159)).

0.93::acc(s1, recommended_weight_range_size_159).

% @attr recommended_weight_range_size_159
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (159)
% @values w140_plus_lbs=140_plus_lbs_65_plus_kg unk_recommended_weight_range_size_159=Unknown
% @importance 1.0

0.92::true_val(recommended_weight_range_size_159, w140_plus_lbs); 0.08::true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159).
measured(s1, recommended_weight_range_size_159, w140_plus_lbs).
all_consistent(recommended_weight_range_size_159) :- consistent(s1, recommended_weight_range_size_159).
evidence(all_consistent(recommended_weight_range_size_159)).
query(true_val(recommended_weight_range_size_159, w140_plus_lbs)).
query(true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159)).

0.93::acc(s1, contact_length_size_159w).

% @attr contact_length_size_159w
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size (159W)
% @values v119=119.0 unk_contact_length_size_159w=Unknown
% @importance 1.0

0.92::true_val(contact_length_size_159w, v119); 0.08::true_val(contact_length_size_159w, unk_contact_length_size_159w).
measured(s1, contact_length_size_159w, v119).
all_consistent(contact_length_size_159w) :- consistent(s1, contact_length_size_159w).
evidence(all_consistent(contact_length_size_159w)).
query(true_val(contact_length_size_159w, v119)).
query(true_val(contact_length_size_159w, unk_contact_length_size_159w)).

0.93::acc(s1, sidecut_radius_size_159w).

% @attr sidecut_radius_size_159w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (159W)
% @values v8_32=8.32 unk_sidecut_radius_size_159w=Unknown
% @importance 1.0

0.92::true_val(sidecut_radius_size_159w, v8_32); 0.08::true_val(sidecut_radius_size_159w, unk_sidecut_radius_size_159w).
measured(s1, sidecut_radius_size_159w, v8_32).
all_consistent(sidecut_radius_size_159w) :- consistent(s1, sidecut_radius_size_159w).
evidence(all_consistent(sidecut_radius_size_159w)).
query(true_val(sidecut_radius_size_159w, v8_32)).
query(true_val(sidecut_radius_size_159w, unk_sidecut_radius_size_159w)).

0.93::acc(s1, tip_tail_width_size_159w).

% @attr tip_tail_width_size_159w
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (159W)
% @values v30_2=30.2 unk_tip_tail_width_size_159w=Unknown
% @importance 1.0

0.92::true_val(tip_tail_width_size_159w, v30_2); 0.08::true_val(tip_tail_width_size_159w, unk_tip_tail_width_size_159w).
measured(s1, tip_tail_width_size_159w, v30_2).
all_consistent(tip_tail_width_size_159w) :- consistent(s1, tip_tail_width_size_159w).
evidence(all_consistent(tip_tail_width_size_159w)).
query(true_val(tip_tail_width_size_159w, v30_2)).
query(true_val(tip_tail_width_size_159w, unk_tip_tail_width_size_159w)).

0.93::acc(s1, waist_width_159w).

% @attr waist_width_159w
% @type numeric
% @unit cm
% @canonical false
% @original_name waist width (159W)
% @values v26_0=26.0 unk_waist_width_159w=Unknown
% @importance 1.0

0.92::true_val(waist_width_159w, v26_0); 0.08::true_val(waist_width_159w, unk_waist_width_159w).
measured(s1, waist_width_159w, v26_0).
all_consistent(waist_width_159w) :- consistent(s1, waist_width_159w).
evidence(all_consistent(waist_width_159w)).
query(true_val(waist_width_159w, v26_0)).
query(true_val(waist_width_159w, unk_waist_width_159w)).

0.93::acc(s1, recommended_weight_range_size_159w).

% @attr recommended_weight_range_size_159w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (159W)
% @values w140_plus_lbs=140_plus_lbs_65_plus_kg unk_recommended_weight_range_size_159w=Unknown
% @importance 1.0

0.92::true_val(recommended_weight_range_size_159w, w140_plus_lbs); 0.08::true_val(recommended_weight_range_size_159w, unk_recommended_weight_range_size_159w).
measured(s1, recommended_weight_range_size_159w, w140_plus_lbs).
all_consistent(recommended_weight_range_size_159w) :- consistent(s1, recommended_weight_range_size_159w).
evidence(all_consistent(recommended_weight_range_size_159w)).
query(true_val(recommended_weight_range_size_159w, w140_plus_lbs)).
query(true_val(recommended_weight_range_size_159w, unk_recommended_weight_range_size_159w)).

0.93::acc(s1, contact_length_size_162).

% @attr contact_length_size_162
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size (162)
% @values v122=122.0 unk_contact_length_size_162=Unknown
% @importance 1.0

0.92::true_val(contact_length_size_162, v122); 0.08::true_val(contact_length_size_162, unk_contact_length_size_162).
measured(s1, contact_length_size_162, v122).
all_consistent(contact_length_size_162) :- consistent(s1, contact_length_size_162).
evidence(all_consistent(contact_length_size_162)).
query(true_val(contact_length_size_162, v122)).
query(true_val(contact_length_size_162, unk_contact_length_size_162)).

0.93::acc(s1, sidecut_radius_size_162).

% @attr sidecut_radius_size_162
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (162)
% @values v8_45=8.45 unk_sidecut_radius_size_162=Unknown
% @importance 1.0

0.92::true_val(sidecut_radius_size_162, v8_45); 0.08::true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162).
measured(s1, sidecut_radius_size_162, v8_45).
all_consistent(sidecut_radius_size_162) :- consistent(s1, sidecut_radius_size_162).
evidence(all_consistent(sidecut_radius_size_162)).
query(true_val(sidecut_radius_size_162, v8_45)).
query(true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162)).

0.93::acc(s1, tip_tail_width_size_162).

% @attr tip_tail_width_size_162
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (162)
% @values v29_8=29.8 unk_tip_tail_width_size_162=Unknown
% @importance 1.0

0.92::true_val(tip_tail_width_size_162, v29_8); 0.08::true_val(tip_tail_width_size_162, unk_tip_tail_width_size_162).
measured(s1, tip_tail_width_size_162, v29_8).
all_consistent(tip_tail_width_size_162) :- consistent(s1, tip_tail_width_size_162).
evidence(all_consistent(tip_tail_width_size_162)).
query(true_val(tip_tail_width_size_162, v29_8)).
query(true_val(tip_tail_width_size_162, unk_tip_tail_width_size_162)).

0.93::acc(s1, waist_width_162).

% @attr waist_width_162
% @type numeric
% @unit cm
% @canonical false
% @original_name waist width (162)
% @values v25_6=25.6 unk_waist_width_162=Unknown
% @importance 1.0

0.92::true_val(waist_width_162, v25_6); 0.08::true_val(waist_width_162, unk_waist_width_162).
measured(s1, waist_width_162, v25_6).
all_consistent(waist_width_162) :- consistent(s1, waist_width_162).
evidence(all_consistent(waist_width_162)).
query(true_val(waist_width_162, v25_6)).
query(true_val(waist_width_162, unk_waist_width_162)).

0.93::acc(s1, recommended_weight_range_size_162).

% @attr recommended_weight_range_size_162
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (162)
% @values w150_plus_lbs=150_plus_lbs_70_plus_kg unk_recommended_weight_range_size_162=Unknown
% @importance 1.0

0.92::true_val(recommended_weight_range_size_162, w150_plus_lbs); 0.08::true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162).
measured(s1, recommended_weight_range_size_162, w150_plus_lbs).
all_consistent(recommended_weight_range_size_162) :- consistent(s1, recommended_weight_range_size_162).
evidence(all_consistent(recommended_weight_range_size_162)).
query(true_val(recommended_weight_range_size_162, w150_plus_lbs)).
query(true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162)).

0.85::acc(s12, recommended_boot_sizes).

% @attr recommended_boot_sizes
% @type categorical
% @canonical false
% @original_name recommended boot sizes (The Good Ride)
% @values boot_size_chart=154_8to9_157_8p5to9p5_159_8p5to9p5_162_9p5to10p5_157w_10to11_159w_10to11 unk_recommended_boot_sizes=Unknown
% @importance 0.9

0.75::true_val(recommended_boot_sizes, boot_size_chart); 0.25::true_val(recommended_boot_sizes, unk_recommended_boot_sizes).
measured(s12, recommended_boot_sizes, boot_size_chart).
all_consistent(recommended_boot_sizes) :- consistent(s12, recommended_boot_sizes).
evidence(all_consistent(recommended_boot_sizes)).
query(true_val(recommended_boot_sizes, boot_size_chart)).
query(true_val(recommended_boot_sizes, unk_recommended_boot_sizes)).

0.95::acc(s1, price_usd_msrp).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_msrp
% @values v699_99=699.99 unk_price_usd_msrp=Unknown
% @importance 1.0

0.92::true_val(price_usd_msrp, v699_99); 0.08::true_val(price_usd_msrp, unk_price_usd_msrp).
measured(s1, price_usd_msrp, v699_99).
all_consistent(price_usd_msrp) :- consistent(s1, price_usd_msrp).
evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v699_99)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

0.88::acc(s20, price_usd_evo).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_evo (2025 model)
% @values v559_99=559.99 unk_price_usd_evo=Unknown
% @importance 0.95

0.81::true_val(price_usd_evo, v559_99); 0.19::true_val(price_usd_evo, unk_price_usd_evo).
measured(s20, price_usd_evo, v559_99).
all_consistent(price_usd_evo) :- consistent(s20, price_usd_evo).
evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v559_99)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

0.85::acc(s21, price_usd_evo_2024).

% @attr price_usd_evo_2024
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_evo (2024 model)
% @values v489_99=489.99 unk_price_usd_evo_2024=Unknown
% @importance 0.85

0.77::true_val(price_usd_evo_2024, v489_99); 0.23::true_val(price_usd_evo_2024, unk_price_usd_evo_2024).
measured(s21, price_usd_evo_2024, v489_99).
all_consistent(price_usd_evo_2024) :- consistent(s21, price_usd_evo_2024).
evidence(all_consistent(price_usd_evo_2024)).
query(true_val(price_usd_evo_2024, v489_99)).
query(true_val(price_usd_evo_2024, unk_price_usd_evo_2024)).

0.70::acc(s22, price_usd_the_house).

% @attr price_usd_the_house
% @type numeric
% @unit USD
% @canonical false
% @original_name sale price (The House)
% @values v454_99_to_489_99=454.99_to_489.99 unk_price_usd_the_house=Unknown
% @importance 0.9

0.53::true_val(price_usd_the_house, v454_99_to_489_99); 0.47::true_val(price_usd_the_house, unk_price_usd_the_house).
measured(s22, price_usd_the_house, v454_99_to_489_99).
all_consistent(price_usd_the_house) :- consistent(s22, price_usd_the_house).
evidence(all_consistent(price_usd_the_house)).
query(true_val(price_usd_the_house, v454_99_to_489_99)).
query(true_val(price_usd_the_house, unk_price_usd_the_house)).

0.70::acc(s22, price_eur_blue_tomato).

% @attr price_eur_blue_tomato
% @type numeric
% @unit EUR
% @canonical false
% @original_name price_eur_blue_tomato
% @values v489_95=489.95 unk_price_eur_blue_tomato=Unknown
% @importance 0.9

0.53::true_val(price_eur_blue_tomato, v489_95); 0.47::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).
measured(s22, price_eur_blue_tomato, v489_95).
all_consistent(price_eur_blue_tomato) :- consistent(s22, price_eur_blue_tomato).
evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v489_95)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

0.72::acc(s8, price_aud_merchant).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical false
% @original_name price_aud_merchant
% @values v818_99=818.99 unk_price_aud_merchant=Unknown
% @importance 0.8

0.71::true_val(price_aud_merchant, v818_99); 0.29::true_val(price_aud_merchant, unk_price_aud_merchant).
measured(s8, price_aud_merchant, v818_99).
all_consistent(price_aud_merchant) :- consistent(s8, price_aud_merchant).
evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v818_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

0.93::acc(s1, manufacturer_review_rating).

% @attr manufacturer_review_rating
% @type categorical
% @canonical false
% @original_name manufacturer review rating
% @values pct95_24reviews=95pct_of_100_24_reviews unk_manufacturer_review_rating=Unknown
% @importance 1.0

0.92::true_val(manufacturer_review_rating, pct95_24reviews); 0.08::true_val(manufacturer_review_rating, unk_manufacturer_review_rating).
measured(s1, manufacturer_review_rating, pct95_24reviews).
all_consistent(manufacturer_review_rating) :- consistent(s1, manufacturer_review_rating).
evidence(all_consistent(manufacturer_review_rating)).
query(true_val(manufacturer_review_rating, pct95_24reviews)).
query(true_val(manufacturer_review_rating, unk_manufacturer_review_rating)).

0.88::acc(s20, availability_status).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status (evo.com)
% @values available_evo=Available_evo_com unk_availability_status=Unknown
% @importance 0.95

0.81::true_val(availability_status, available_evo); 0.19::true_val(availability_status, unk_availability_status).
measured(s20, availability_status, available_evo).
all_consistent(availability_status) :- consistent(s20, availability_status).
evidence(all_consistent(availability_status)).
query(true_val(availability_status, available_evo)).
query(true_val(availability_status, unk_availability_status)).

0.70::acc(s22, availability_status_the_house).

% @attr availability_status_the_house
% @type categorical
% @canonical false
% @original_name availability_status (The House)
% @values available_the_house=Available_The_House unk_availability_status_the_house=Unknown
% @importance 0.9

0.53::true_val(availability_status_the_house, available_the_house); 0.47::true_val(availability_status_the_house, unk_availability_status_the_house).
measured(s22, availability_status_the_house, available_the_house).
all_consistent(availability_status_the_house) :- consistent(s22, availability_status_the_house).
evidence(all_consistent(availability_status_the_house)).
query(true_val(availability_status_the_house, available_the_house)).
query(true_val(availability_status_the_house, unk_availability_status_the_house)).

0.70::acc(s22, availability_status_stoked).

% @attr availability_status_stoked
% @type categorical
% @canonical false
% @original_name availability_status (Stoked Board Shop)
% @values available_stoked=Available_Stoked_Board_Shop unk_availability_status_stoked=Unknown
% @importance 0.9

0.53::true_val(availability_status_stoked, available_stoked); 0.47::true_val(availability_status_stoked, unk_availability_status_stoked).
measured(s22, availability_status_stoked, available_stoked).
all_consistent(availability_status_stoked) :- consistent(s22, availability_status_stoked).
evidence(all_consistent(availability_status_stoked)).
query(true_val(availability_status_stoked, available_stoked)).
query(true_val(availability_status_stoked, unk_availability_status_stoked)).

0.72::acc(s17, availability_status_blauer).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status (Blauer Board Shop)
% @values available_blauer=Available_Blauer_Board_Shop unk_availability_status_blauer=Unknown
% @importance 0.85

0.71::true_val(availability_status_blauer, available_blauer); 0.29::true_val(availability_status_blauer, unk_availability_status_blauer).
measured(s17, availability_status_blauer, available_blauer).
all_consistent(availability_status_blauer) :- consistent(s17, availability_status_blauer).
evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, available_blauer)).
query(true_val(availability_status_blauer, unk_availability_status_blauer)).

0.65::acc(s23, availability_status_rude_boys).

% @attr availability_status_rude_boys
% @type categorical
% @canonical false
% @original_name availability_status (Rude Boys)
% @values available_rude_boys=Available_Rude_Boys_Banff unk_availability_status_rude_boys=Unknown
% @importance 0.5

0.52::true_val(availability_status_rude_boys, available_rude_boys); 0.48::true_val(availability_status_rude_boys, unk_availability_status_rude_boys).
measured(s23, availability_status_rude_boys, available_rude_boys).
all_consistent(availability_status_rude_boys) :- consistent(s23, availability_status_rude_boys).
evidence(all_consistent(availability_status_rude_boys)).
query(true_val(availability_status_rude_boys, available_rude_boys)).
query(true_val(availability_status_rude_boys, unk_availability_status_rude_boys)).

0.72::acc(s8, availability_status_melbourne).

% @attr availability_status_melbourne
% @type categorical
% @canonical false
% @original_name availability_status (Melbourne Snowboard Centre)
% @values available_melbourne=Available_Melbourne_Snowboard_Centre unk_availability_status_melbourne=Unknown
% @importance 0.8

0.71::true_val(availability_status_melbourne, available_melbourne); 0.29::true_val(availability_status_melbourne, unk_availability_status_melbourne).
measured(s8, availability_status_melbourne, available_melbourne).
all_consistent(availability_status_melbourne) :- consistent(s8, availability_status_melbourne).
evidence(all_consistent(availability_status_melbourne)).
query(true_val(availability_status_melbourne, available_melbourne)).
query(true_val(availability_status_melbourne, unk_availability_status_melbourne)).

0.68::acc(s6, availability_status_empire).

% @attr availability_status_empire
% @type categorical
% @canonical false
% @original_name availability_status (Empire)
% @values available_empire=Available_Empire_thinkempire unk_availability_status_empire=Unknown
% @importance 0.35

0.55::true_val(availability_status_empire, available_empire); 0.45::true_val(availability_status_empire, unk_availability_status_empire).
measured(s6, availability_status_empire, available_empire).
all_consistent(availability_status_empire) :- consistent(s6, availability_status_empire).
evidence(all_consistent(availability_status_empire)).
query(true_val(availability_status_empire, available_empire)).
query(true_val(availability_status_empire, unk_availability_status_empire)).

0.68::acc(s10, availability_status_blue_tomato).

% @attr availability_status_blue_tomato
% @type categorical
% @canonical false
% @original_name availability_status (Blue Tomato)
% @values available_blue_tomato=Available_Blue_Tomato unk_availability_status_blue_tomato=Unknown
% @importance 0.7

0.60::true_val(availability_status_blue_tomato, available_blue_tomato); 0.40::true_val(availability_status_blue_tomato, unk_availability_status_blue_tomato).
measured(s10, availability_status_blue_tomato, available_blue_tomato).
all_consistent(availability_status_blue_tomato) :- consistent(s10, availability_status_blue_tomato).
evidence(all_consistent(availability_status_blue_tomato)).
query(true_val(availability_status_blue_tomato, available_blue_tomato)).
query(true_val(availability_status_blue_tomato, unk_availability_status_blue_tomato)).

0.60::acc(s24, availability_status_shoreline).

% @attr availability_status_shoreline
% @type categorical
% @canonical false
% @original_name availability_status (Shoreline of Tahoe)
% @values available_shoreline=Available_Shoreline_of_Tahoe unk_availability_status_shoreline=Unknown
% @importance 0.35

0.45::true_val(availability_status_shoreline, available_shoreline); 0.55::true_val(availability_status_shoreline, unk_availability_status_shoreline).
measured(s24, availability_status_shoreline, available_shoreline).
all_consistent(availability_status_shoreline) :- consistent(s24, availability_status_shoreline).
evidence(all_consistent(availability_status_shoreline)).
query(true_val(availability_status_shoreline, available_shoreline)).
query(true_val(availability_status_shoreline, unk_availability_status_shoreline)).

0.93::acc(s1, availability_status_lib_tech).

% @attr availability_status_lib_tech
% @type categorical
% @canonical false
% @original_name availability_status (lib-tech.com)
% @values available_lib_tech=Available_lib_tech_com unk_availability_status_lib_tech=Unknown
% @importance 1.0

0.92::true_val(availability_status_lib_tech, available_lib_tech); 0.08::true_val(availability_status_lib_tech, unk_availability_status_lib_tech).
measured(s1, availability_status_lib_tech, available_lib_tech).
all_consistent(availability_status_lib_tech) :- consistent(s1, availability_status_lib_tech).
evidence(all_consistent(availability_status_lib_tech)).
query(true_val(availability_status_lib_tech, available_lib_tech)).
query(true_val(availability_status_lib_tech, unk_availability_status_lib_tech)).

0.65::acc(s25, availability_status_salty_peaks).

% @attr availability_status_salty_peaks
% @type categorical
% @canonical false
% @original_name availability_status (Salty Peaks)
% @values available_salty_peaks=Available_Salty_Peaks unk_availability_status_salty_peaks=Unknown
% @importance 0.4

0.52::true_val(availability_status_salty_peaks, available_salty_peaks); 0.48::true_val(availability_status_salty_peaks, unk_availability_status_salty_peaks).
measured(s25, availability_status_salty_peaks, available_salty_peaks).
all_consistent(availability_status_salty_peaks) :- consistent(s25, availability_status_salty_peaks).
evidence(all_consistent(availability_status_salty_peaks)).
query(true_val(availability_status_salty_peaks, available_salty_peaks)).
query(true_val(availability_status_salty_peaks, unk_availability_status_salty_peaks)).

0.58::acc(s14, availability_status_source).

% @attr availability_status_source
% @type categorical
% @canonical false
% @original_name availability_status (The Source)
% @values available_source=Available_The_Source unk_availability_status_source=Unknown
% @importance 0.8

0.39::true_val(availability_status_source, available_source); 0.61::true_val(availability_status_source, unk_availability_status_source).
measured(s14, availability_status_source, available_source).
all_consistent(availability_status_source) :- consistent(s14, availability_status_source).
evidence(all_consistent(availability_status_source)).
query(true_val(availability_status_source, available_source)).
query(true_val(availability_status_source, unk_availability_status_source)).

0.95::acc(s26, warranty).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values one_year_mfg_defects=1_year_against_manufacturer_defects unk_warranty=Unknown
% @importance 0.8

0.93::true_val(warranty, one_year_mfg_defects); 0.07::true_val(warranty, unk_warranty).
measured(s26, warranty, one_year_mfg_defects).
all_consistent(warranty) :- consistent(s26, warranty).
evidence(all_consistent(warranty)).
query(true_val(warranty, one_year_mfg_defects)).
query(true_val(warranty, unk_warranty)).

0.95::acc(s26, warranty_exclusions).

% @attr warranty_exclusions
% @type categorical
% @canonical false
% @original_name warranty (exclusions)
% @values defects_only_no_abuse=Covers_defects_only_not_impact_abuse_wear unk_warranty_exclusions=Unknown
% @importance 0.8

0.93::true_val(warranty_exclusions, defects_only_no_abuse); 0.07::true_val(warranty_exclusions, unk_warranty_exclusions).
measured(s26, warranty_exclusions, defects_only_no_abuse).
all_consistent(warranty_exclusions) :- consistent(s26, warranty_exclusions).
evidence(all_consistent(warranty_exclusions)).
query(true_val(warranty_exclusions, defects_only_no_abuse)).
query(true_val(warranty_exclusions, unk_warranty_exclusions)).

0.80::acc(s27, comparable_board_cross_brand_doa_warranty).

% @attr comparable_board_cross_brand_doa_warranty
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (DOA 2-year warranty)
% @values two_year_warranty=2_year_warranty unk_comparable_board_cross_brand_doa_warranty=Unknown
% @importance 0.75

0.76::true_val(comparable_board_cross_brand_doa_warranty, two_year_warranty); 0.24::true_val(comparable_board_cross_brand_doa_warranty, unk_comparable_board_cross_brand_doa_warranty).
measured(s27, comparable_board_cross_brand_doa_warranty, two_year_warranty).
all_consistent(comparable_board_cross_brand_doa_warranty) :- consistent(s27, comparable_board_cross_brand_doa_warranty).
evidence(all_consistent(comparable_board_cross_brand_doa_warranty)).
query(true_val(comparable_board_cross_brand_doa_warranty, two_year_warranty)).
query(true_val(comparable_board_cross_brand_doa_warranty, unk_comparable_board_cross_brand_doa_warranty)).

0.45::acc(s28, user_review_forum).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum (warranty service)
% @values warranty_top_notch=Warranty_department_top_notch_praised unk_user_review_forum=Unknown
% @importance 0.65

0.30::true_val(user_review_forum, warranty_top_notch); 0.70::true_val(user_review_forum, unk_user_review_forum).
measured(s28, user_review_forum, warranty_top_notch).
all_consistent(user_review_forum) :- consistent(s28, user_review_forum).
evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, warranty_top_notch)).
query(true_val(user_review_forum, unk_user_review_forum)).

0.70::acc(s29, sustainability_certification_renewable_power).

% @attr sustainability_certification_renewable_power
% @type categorical
% @canonical false
% @original_name sustainability_certification (renewable power)
% @values pct89_wind_water=89pct_power_from_wind_or_water unk_sustainability_certification_renewable_power=Unknown
% @importance 0.4

0.63::true_val(sustainability_certification_renewable_power, pct89_wind_water); 0.37::true_val(sustainability_certification_renewable_power, unk_sustainability_certification_renewable_power).
measured(s29, sustainability_certification_renewable_power, pct89_wind_water).
all_consistent(sustainability_certification_renewable_power) :- consistent(s29, sustainability_certification_renewable_power).
evidence(all_consistent(sustainability_certification_renewable_power)).
query(true_val(sustainability_certification_renewable_power, pct89_wind_water)).
query(true_val(sustainability_certification_renewable_power, unk_sustainability_certification_renewable_power)).

0.70::acc(s30, manufacturing_location_current).

% @attr manufacturing_location_current
% @type categorical
% @canonical false
% @original_name manufacturing_location_current
% @values carlsborg_wa_usa=Carlsborg_Sequim_Washington_USA unk_manufacturing_location_current=Unknown
% @importance 0.35

0.63::true_val(manufacturing_location_current, carlsborg_wa_usa); 0.37::true_val(manufacturing_location_current, unk_manufacturing_location_current).
measured(s30, manufacturing_location_current, carlsborg_wa_usa).
all_consistent(manufacturing_location_current) :- consistent(s30, manufacturing_location_current).
evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, carlsborg_wa_usa)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

0.85::acc(s31, sustainability_certification_eco_materials).

% @attr sustainability_certification_eco_materials
% @type categorical
% @canonical false
% @original_name sustainability_certification (eco materials)
% @values bio_plastics_soy_fsc=Bio_plastics_soy_sidewalls_low_VOC_FSC_Pure unk_sustainability_certification_eco_materials=Unknown
% @importance 0.45

0.78::true_val(sustainability_certification_eco_materials, bio_plastics_soy_fsc); 0.22::true_val(sustainability_certification_eco_materials, unk_sustainability_certification_eco_materials).
measured(s31, sustainability_certification_eco_materials, bio_plastics_soy_fsc).
all_consistent(sustainability_certification_eco_materials) :- consistent(s31, sustainability_certification_eco_materials).
evidence(all_consistent(sustainability_certification_eco_materials)).
query(true_val(sustainability_certification_eco_materials, bio_plastics_soy_fsc)).
query(true_val(sustainability_certification_eco_materials, unk_sustainability_certification_eco_materials)).

0.83::acc(s32, sustainability_certification_eco_printing).

% @attr sustainability_certification_eco_printing
% @type categorical
% @canonical false
% @original_name sustainability_certification (eco sublimation printing)
% @values eco_sublimation_zero_waste=Eco_sublimation_not_silkscreen_zero_hazardous_waste unk_sustainability_certification_eco_printing=Unknown
% @importance 0.3

0.77::true_val(sustainability_certification_eco_printing, eco_sublimation_zero_waste); 0.23::true_val(sustainability_certification_eco_printing, unk_sustainability_certification_eco_printing).
measured(s32, sustainability_certification_eco_printing, eco_sublimation_zero_waste).
all_consistent(sustainability_certification_eco_printing) :- consistent(s32, sustainability_certification_eco_printing).
evidence(all_consistent(sustainability_certification_eco_printing)).
query(true_val(sustainability_certification_eco_printing, eco_sublimation_zero_waste)).
query(true_val(sustainability_certification_eco_printing, unk_sustainability_certification_eco_printing)).

0.65::acc(s33, mervin_recent_acquisition).

% @attr mervin_recent_acquisition
% @type categorical
% @canonical false
% @original_name Mervin recent acquisition
% @values spring_capital_2026=Acquired_by_Spring_Capital_Group_2026 unk_mervin_recent_acquisition=Unknown
% @importance 0.5

0.56::true_val(mervin_recent_acquisition, spring_capital_2026); 0.44::true_val(mervin_recent_acquisition, unk_mervin_recent_acquisition).
measured(s33, mervin_recent_acquisition, spring_capital_2026).
all_consistent(mervin_recent_acquisition) :- consistent(s33, mervin_recent_acquisition).
evidence(all_consistent(mervin_recent_acquisition)).
query(true_val(mervin_recent_acquisition, spring_capital_2026)).
query(true_val(mervin_recent_acquisition, unk_mervin_recent_acquisition)).

0.72::acc(s5, awards).

% @attr awards
% @type categorical
% @canonical false
% @original_name awards
% @values multiple_good_wood=Multiple_Transworld_Good_Wood_awards unk_awards=Unknown
% @importance 0.4

0.64::true_val(awards, multiple_good_wood); 0.36::true_val(awards, unk_awards).
measured(s5, awards, multiple_good_wood).
all_consistent(awards) :- consistent(s5, awards).
evidence(all_consistent(awards)).
query(true_val(awards, multiple_good_wood)).
query(true_val(awards, unk_awards)).

0.85::acc(s34, good_wood_streak).

% @attr good_wood_streak
% @type categorical
% @canonical false
% @original_name Good Wood streak
% @values ten_years_as_of_2014=10_years_in_a_row_as_of_2014 unk_good_wood_streak=Unknown
% @importance 0.6

0.81::true_val(good_wood_streak, ten_years_as_of_2014); 0.19::true_val(good_wood_streak, unk_good_wood_streak).
measured(s34, good_wood_streak, ten_years_as_of_2014).
all_consistent(good_wood_streak) :- consistent(s34, good_wood_streak).
evidence(all_consistent(good_wood_streak)).
query(true_val(good_wood_streak, ten_years_as_of_2014)).
query(true_val(good_wood_streak, unk_good_wood_streak)).

0.90::acc(s1, competitive_wins).

% @attr competitive_wins
% @type categorical
% @canonical false
% @original_name competitive wins referenced
% @values olympic_wft_slopestyle=Olympic_medals_World_Freeride_Tour_slopestyle unk_competitive_wins=Unknown
% @importance 1.0

0.92::true_val(competitive_wins, olympic_wft_slopestyle); 0.08::true_val(competitive_wins, unk_competitive_wins).
measured(s1, competitive_wins, olympic_wft_slopestyle).
all_consistent(competitive_wins) :- consistent(s1, competitive_wins).
evidence(all_consistent(competitive_wins)).
query(true_val(competitive_wins, olympic_wft_slopestyle)).
query(true_val(competitive_wins, unk_competitive_wins)).

0.87::acc(s12, reviewer_opinion_the_good_ride).
0.85::acc(s13, reviewer_opinion_the_good_ride).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride (overall verdict)
% @values great_hard_snow_not_powder=Great_mtn_freestyle_twin_for_hard_icy_snow_not_powder unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.9

0.95::true_val(reviewer_opinion_the_good_ride, great_hard_snow_not_powder); 0.05::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).
measured(s12, reviewer_opinion_the_good_ride, great_hard_snow_not_powder).
measured(s13, reviewer_opinion_the_good_ride, great_hard_snow_not_powder).
all_consistent(reviewer_opinion_the_good_ride) :- consistent(s12, reviewer_opinion_the_good_ride), consistent(s13, reviewer_opinion_the_good_ride).
evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, great_hard_snow_not_powder)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

0.87::acc(s13, edge_hold).
0.78::acc(s36, edge_hold).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values excellent_aggressive_grip=Excellent_aggressive_sidecut_grip_standout unk_edge_hold=Unknown
% @importance 0.85

0.95::true_val(edge_hold, excellent_aggressive_grip); 0.05::true_val(edge_hold, unk_edge_hold).
measured(s13, edge_hold, excellent_aggressive_grip).
measured(s36, edge_hold, excellent_aggressive_grip).
all_consistent(edge_hold) :- consistent(s13, edge_hold), consistent(s36, edge_hold).
evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, excellent_aggressive_grip)).
query(true_val(edge_hold, unk_edge_hold)).

0.85::acc(s13, carving_rating_tgr).

% @attr carving_rating_tgr
% @type categorical
% @canonical false
% @original_name carving_rating_tgr
% @values good_quick_turns_balanced=Quick_turn_initiation_balanced_carves_well_for_twin unk_carving_rating_tgr=Unknown
% @importance 0.9

0.74::true_val(carving_rating_tgr, good_quick_turns_balanced); 0.26::true_val(carving_rating_tgr, unk_carving_rating_tgr).
measured(s13, carving_rating_tgr, good_quick_turns_balanced).
all_consistent(carving_rating_tgr) :- consistent(s13, carving_rating_tgr).
evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, good_quick_turns_balanced)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

0.87::acc(s35, base_glide_performance).

% @attr base_glide_performance
% @type categorical
% @canonical false
% @original_name base_glide_performance
% @values below_avg_for_price=Below_average_base_glide_for_price_point unk_base_glide_performance=Unknown
% @importance 0.85

0.76::true_val(base_glide_performance, below_avg_for_price); 0.24::true_val(base_glide_performance, unk_base_glide_performance).
measured(s35, base_glide_performance, below_avg_for_price).
all_consistent(base_glide_performance) :- consistent(s35, base_glide_performance).
evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, below_avg_for_price)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

0.87::acc(s35, powder_rating_tgr).

% @attr powder_rating_tgr
% @type categorical
% @canonical false
% @original_name powder_rating_tgr
% @values poor_never_floated=Poor_never_floated_well_vs_peers unk_powder_rating_tgr=Unknown
% @importance 0.85

0.76::true_val(powder_rating_tgr, poor_never_floated); 0.24::true_val(powder_rating_tgr, unk_powder_rating_tgr).
measured(s35, powder_rating_tgr, poor_never_floated).
all_consistent(powder_rating_tgr) :- consistent(s35, powder_rating_tgr).
evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, poor_never_floated)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

0.85::acc(s13, pop).

% @attr pop
% @type categorical
% @canonical false
% @original_name pop
% @values good_for_mellow_camber=Pops_pretty_well_for_mellow_camber unk_pop=Unknown
% @importance 0.9

0.74::true_val(pop, good_for_mellow_camber); 0.26::true_val(pop, unk_pop).
measured(s13, pop, good_for_mellow_camber).
all_consistent(pop) :- consistent(s13, pop).
evidence(all_consistent(pop)).
query(true_val(pop, good_for_mellow_camber)).
query(true_val(pop, unk_pop)).

0.85::acc(s13, reviewer_opinion_the_good_ride_dampening).

% @attr reviewer_opinion_the_good_ride_dampening
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (dampening)
% @values better_dampening_with_plates=Org_Throttle_dampens_ride_better_in_uneven_snow unk_reviewer_opinion_the_good_ride_dampening=Unknown
% @importance 0.9

0.74::true_val(reviewer_opinion_the_good_ride_dampening, better_dampening_with_plates); 0.26::true_val(reviewer_opinion_the_good_ride_dampening, unk_reviewer_opinion_the_good_ride_dampening).
measured(s13, reviewer_opinion_the_good_ride_dampening, better_dampening_with_plates).
all_consistent(reviewer_opinion_the_good_ride_dampening) :- consistent(s13, reviewer_opinion_the_good_ride_dampening).
evidence(all_consistent(reviewer_opinion_the_good_ride_dampening)).
query(true_val(reviewer_opinion_the_good_ride_dampening, better_dampening_with_plates)).
query(true_val(reviewer_opinion_the_good_ride_dampening, unk_reviewer_opinion_the_good_ride_dampening)).

0.78::acc(s36, turn_initiation_performance).

% @attr turn_initiation_performance
% @type categorical
% @canonical false
% @original_name turn_initiation_performance
% @values super_fast_edge_to_edge=Super_fast_edge_to_edge_short_tight_turns unk_turn_initiation_performance=Unknown
% @importance 0.8

0.53::true_val(turn_initiation_performance, super_fast_edge_to_edge); 0.47::true_val(turn_initiation_performance, unk_turn_initiation_performance).
measured(s36, turn_initiation_performance, super_fast_edge_to_edge).
all_consistent(turn_initiation_performance) :- consistent(s36, turn_initiation_performance).
evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, super_fast_edge_to_edge)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

0.75::acc(s37, powder_score_snowboardingprofiles).

% @attr powder_score_snowboardingprofiles
% @type categorical
% @canonical false
% @original_name powder_score_snowboardingprofiles
% @values not_powder_machine=Not_a_powder_machine_no_rocker_true_twin unk_powder_score_snowboardingprofiles=Unknown
% @importance 0.8

0.56::true_val(powder_score_snowboardingprofiles, not_powder_machine); 0.44::true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles).
measured(s37, powder_score_snowboardingprofiles, not_powder_machine).
all_consistent(powder_score_snowboardingprofiles) :- consistent(s37, powder_score_snowboardingprofiles).
evidence(all_consistent(powder_score_snowboardingprofiles)).
query(true_val(powder_score_snowboardingprofiles, not_powder_machine)).
query(true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles)).

0.75::acc(s37, reviewer_opinion_snowboardingprofiles).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name reviewer_opinion_snowboardingprofiles (dampness)
% @values average_weight_balanced=Average_weight_not_overly_damp_or_chattery unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.8

0.56::true_val(reviewer_opinion_snowboardingprofiles, average_weight_balanced); 0.44::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).
measured(s37, reviewer_opinion_snowboardingprofiles, average_weight_balanced).
all_consistent(reviewer_opinion_snowboardingprofiles) :- consistent(s37, reviewer_opinion_snowboardingprofiles).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, average_weight_balanced)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

0.75::acc(s37, chatter_performance).

% @attr chatter_performance
% @type categorical
% @canonical false
% @original_name chatter_performance
% @values more_snappy_than_smooth=More_snappy_than_smooth_just_snappy_side_of_middle unk_chatter_performance=Unknown
% @importance 0.8

0.56::true_val(chatter_performance, more_snappy_than_smooth); 0.44::true_val(chatter_performance, unk_chatter_performance).
measured(s37, chatter_performance, more_snappy_than_smooth).
all_consistent(chatter_performance) :- consistent(s37, chatter_performance).
evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, more_snappy_than_smooth)).
query(true_val(chatter_performance, unk_chatter_performance)).

0.75::acc(s37, reviewer_opinion_snowboardingprofiles_rider_type).

% @attr reviewer_opinion_snowboardingprofiles_rider_type
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (rider type)
% @values aggressive_mountain_park=Best_for_aggressive_whole_mountain_as_park_riders unk_reviewer_opinion_snowboardingprofiles_rider_type=Unknown
% @importance 0.8

0.56::true_val(reviewer_opinion_snowboardingprofiles_rider_type, aggressive_mountain_park); 0.44::true_val(reviewer_opinion_snowboardingprofiles_rider_type, unk_reviewer_opinion_snowboardingprofiles_rider_type).
measured(s37, reviewer_opinion_snowboardingprofiles_rider_type, aggressive_mountain_park).
all_consistent(reviewer_opinion_snowboardingprofiles_rider_type) :- consistent(s37, reviewer_opinion_snowboardingprofiles_rider_type).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles_rider_type)).
query(true_val(reviewer_opinion_snowboardingprofiles_rider_type, aggressive_mountain_park)).
query(true_val(reviewer_opinion_snowboardingprofiles_rider_type, unk_reviewer_opinion_snowboardingprofiles_rider_type)).

0.85::acc(s38, pipe_rating_tgr).

% @attr pipe_rating_tgr
% @type categorical
% @canonical false
% @original_name pipe_rating_tgr
% @values one_of_best_for_pipe=One_of_the_best_boards_for_pipe_riding unk_pipe_rating_tgr=Unknown
% @importance 0.7

0.70::true_val(pipe_rating_tgr, one_of_best_for_pipe); 0.30::true_val(pipe_rating_tgr, unk_pipe_rating_tgr).
measured(s38, pipe_rating_tgr, one_of_best_for_pipe).
all_consistent(pipe_rating_tgr) :- consistent(s38, pipe_rating_tgr).
evidence(all_consistent(pipe_rating_tgr)).
query(true_val(pipe_rating_tgr, one_of_best_for_pipe)).
query(true_val(pipe_rating_tgr, unk_pipe_rating_tgr)).

0.68::acc(s8, skill_level_recommendation).
0.80::acc(s7, skill_level_recommendation).
0.65::acc(s10, skill_level_recommendation).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values intermediate_advanced=Intermediate_Advanced advanced_expert=Advanced_Expert intermediate_to_pro=Intermediate_to_Pro
% @importance 0.78

0.32::true_val(skill_level_recommendation, intermediate_advanced); 0.38::true_val(skill_level_recommendation, advanced_expert); 0.30::true_val(skill_level_recommendation, intermediate_to_pro).
measured(s8, skill_level_recommendation, intermediate_advanced).
measured(s7, skill_level_recommendation, advanced_expert).
measured(s10, skill_level_recommendation, intermediate_to_pro).
all_consistent(skill_level_recommendation) :- (indep(s8), consistent(s8, skill_level_recommendation) ; \+indep(s8)), consistent(s7, skill_level_recommendation), (indep(s10), consistent(s10, skill_level_recommendation) ; \+indep(s10)).
evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, intermediate_advanced)).
query(true_val(skill_level_recommendation, advanced_expert)).
query(true_val(skill_level_recommendation, intermediate_to_pro)).

0.85::acc(s13, reviewer_opinion_the_good_ride_stability).

% @attr reviewer_opinion_the_good_ride_stability
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (stability/catchiness)
% @values border_stable_catchy=Border_between_stable_forgiving_and_semi_catchy unk_reviewer_opinion_the_good_ride_stability=Unknown
% @importance 0.9

0.74::true_val(reviewer_opinion_the_good_ride_stability, border_stable_catchy); 0.26::true_val(reviewer_opinion_the_good_ride_stability, unk_reviewer_opinion_the_good_ride_stability).
measured(s13, reviewer_opinion_the_good_ride_stability, border_stable_catchy).
all_consistent(reviewer_opinion_the_good_ride_stability) :- consistent(s13, reviewer_opinion_the_good_ride_stability).
evidence(all_consistent(reviewer_opinion_the_good_ride_stability)).
query(true_val(reviewer_opinion_the_good_ride_stability, border_stable_catchy)).
query(true_val(reviewer_opinion_the_good_ride_stability, unk_reviewer_opinion_the_good_ride_stability)).

0.93::acc(s1, riding_style).

% @attr riding_style
% @type categorical
% @canonical false
% @original_name riding_style
% @values aggressive_freestyle_all_mtn=Aggressive_freestyle_shredding_park_to_backcountry unk_riding_style=Unknown
% @importance 1.0

0.92::true_val(riding_style, aggressive_freestyle_all_mtn); 0.08::true_val(riding_style, unk_riding_style).
measured(s1, riding_style, aggressive_freestyle_all_mtn).
all_consistent(riding_style) :- consistent(s1, riding_style).
evidence(all_consistent(riding_style)).
query(true_val(riding_style, aggressive_freestyle_all_mtn)).
query(true_val(riding_style, unk_riding_style)).

0.85::acc(s12, switch_riding).

% @attr switch_riding
% @type categorical
% @canonical false
% @original_name switch_riding
% @values very_centered_near_twin=Very_centered_feel_near_true_twin_0p5in_setback unk_switch_riding=Unknown
% @importance 0.9

0.76::true_val(switch_riding, very_centered_near_twin); 0.24::true_val(switch_riding, unk_switch_riding).
measured(s12, switch_riding, very_centered_near_twin).
all_consistent(switch_riding) :- consistent(s12, switch_riding).
evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, very_centered_near_twin)).
query(true_val(switch_riding, unk_switch_riding)).

0.85::acc(s13, reviewer_opinion_the_good_ride_flex).

% @attr reviewer_opinion_the_good_ride_flex
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (buttering/flex)
% @values medium_ish_butter_ok=Decent_medium_ish_flex_not_super_easy_or_hard_to_butter unk_reviewer_opinion_the_good_ride_flex=Unknown
% @importance 0.9

0.74::true_val(reviewer_opinion_the_good_ride_flex, medium_ish_butter_ok); 0.26::true_val(reviewer_opinion_the_good_ride_flex, unk_reviewer_opinion_the_good_ride_flex).
measured(s13, reviewer_opinion_the_good_ride_flex, medium_ish_butter_ok).
all_consistent(reviewer_opinion_the_good_ride_flex) :- consistent(s13, reviewer_opinion_the_good_ride_flex).
evidence(all_consistent(reviewer_opinion_the_good_ride_flex)).
query(true_val(reviewer_opinion_the_good_ride_flex, medium_ish_butter_ok)).
query(true_val(reviewer_opinion_the_good_ride_flex, unk_reviewer_opinion_the_good_ride_flex)).

0.45::acc(s39, user_review_forum_jib).

% @attr user_review_forum_jib
% @type categorical
% @canonical false
% @original_name user_review_forum (jib/rail performance)
% @values not_great_jib_too_stiff=Not_great_jib_rail_board_stiff_better_pipe_jumps unk_user_review_forum_jib=Unknown
% @importance 0.7

0.28::true_val(user_review_forum_jib, not_great_jib_too_stiff); 0.72::true_val(user_review_forum_jib, unk_user_review_forum_jib).
measured(s39, user_review_forum_jib, not_great_jib_too_stiff).
all_consistent(user_review_forum_jib) :- consistent(s39, user_review_forum_jib).
evidence(all_consistent(user_review_forum_jib)).
query(true_val(user_review_forum_jib, not_great_jib_too_stiff)).
query(true_val(user_review_forum_jib, unk_user_review_forum_jib)).

0.70::acc(s40, negative_aspect).

% @attr negative_aspect
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values durability_topsheet_delam=Durability_concern_topsheet_delamination_no_full_wrapped_edges unk_negative_aspect=Unknown
% @importance 0.8

0.55::true_val(negative_aspect, durability_topsheet_delam); 0.45::true_val(negative_aspect, unk_negative_aspect).
measured(s40, negative_aspect, durability_topsheet_delam).
all_consistent(negative_aspect) :- consistent(s40, negative_aspect).
evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, durability_topsheet_delam)).
query(true_val(negative_aspect, unk_negative_aspect)).

0.70::acc(s40, terrain_suitability).

% @attr terrain_suitability
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values great_wet_powder_pnw=Great_in_wet_powder_recommended_PNW_coastal unk_terrain_suitability=Unknown
% @importance 0.8

0.55::true_val(terrain_suitability, great_wet_powder_pnw); 0.45::true_val(terrain_suitability, unk_terrain_suitability).
measured(s40, terrain_suitability, great_wet_powder_pnw).
all_consistent(terrain_suitability) :- consistent(s40, terrain_suitability).
evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, great_wet_powder_pnw)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

0.72::acc(s41, comparable_board_cross_brand).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand (Capita DOA)
% @values capita_doa=Capita_Defenders_of_Awesome unk_comparable_board_cross_brand=Unknown
% @importance 0.85

0.56::true_val(comparable_board_cross_brand, capita_doa); 0.44::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).
measured(s41, comparable_board_cross_brand, capita_doa).
all_consistent(comparable_board_cross_brand) :- consistent(s41, comparable_board_cross_brand).
evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, capita_doa)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

0.65::acc(s42, comparable_board_cross_brand_jones_mt).

% @attr comparable_board_cross_brand_jones_mt
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Jones Mountain Twin)
% @values jones_mountain_twin=Jones_Mountain_Twin_MSRP_579p95 unk_comparable_board_cross_brand_jones_mt=Unknown
% @importance 0.7

0.52::true_val(comparable_board_cross_brand_jones_mt, jones_mountain_twin); 0.48::true_val(comparable_board_cross_brand_jones_mt, unk_comparable_board_cross_brand_jones_mt).
measured(s42, comparable_board_cross_brand_jones_mt, jones_mountain_twin).
all_consistent(comparable_board_cross_brand_jones_mt) :- consistent(s42, comparable_board_cross_brand_jones_mt).
evidence(all_consistent(comparable_board_cross_brand_jones_mt)).
query(true_val(comparable_board_cross_brand_jones_mt, jones_mountain_twin)).
query(true_val(comparable_board_cross_brand_jones_mt, unk_comparable_board_cross_brand_jones_mt)).

0.85::acc(s13, comparable_board_cross_brand_gnu_rc).

% @attr comparable_board_cross_brand_gnu_rc
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (GNU Rider's Choice)
% @values gnu_riders_choice=GNU_Riders_Choice_sister_board_C3_asymmetric unk_comparable_board_cross_brand_gnu_rc=Unknown
% @importance 0.9

0.74::true_val(comparable_board_cross_brand_gnu_rc, gnu_riders_choice); 0.26::true_val(comparable_board_cross_brand_gnu_rc, unk_comparable_board_cross_brand_gnu_rc).
measured(s13, comparable_board_cross_brand_gnu_rc, gnu_riders_choice).
all_consistent(comparable_board_cross_brand_gnu_rc) :- consistent(s13, comparable_board_cross_brand_gnu_rc).
evidence(all_consistent(comparable_board_cross_brand_gnu_rc)).
query(true_val(comparable_board_cross_brand_gnu_rc, gnu_riders_choice)).
query(true_val(comparable_board_cross_brand_gnu_rc, unk_comparable_board_cross_brand_gnu_rc)).

0.58::acc(s43, comparable_board_cross_brand_burton_ct).

% @attr comparable_board_cross_brand_burton_ct
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Burton Custom Twin)
% @values burton_custom_twin=Burton_Custom_Twin unk_comparable_board_cross_brand_burton_ct=Unknown
% @importance 0.65

0.44::true_val(comparable_board_cross_brand_burton_ct, burton_custom_twin); 0.56::true_val(comparable_board_cross_brand_burton_ct, unk_comparable_board_cross_brand_burton_ct).
measured(s43, comparable_board_cross_brand_burton_ct, burton_custom_twin).
all_consistent(comparable_board_cross_brand_burton_ct) :- consistent(s43, comparable_board_cross_brand_burton_ct).
evidence(all_consistent(comparable_board_cross_brand_burton_ct)).
query(true_val(comparable_board_cross_brand_burton_ct, burton_custom_twin)).
query(true_val(comparable_board_cross_brand_burton_ct, unk_comparable_board_cross_brand_burton_ct)).

0.58::acc(s43, comparable_board_cross_brand_salomon_assassin).

% @attr comparable_board_cross_brand_salomon_assassin
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Salomon Assassin)
% @values salomon_assassin=Salomon_Assassin_softer_buttery_feel unk_comparable_board_cross_brand_salomon_assassin=Unknown
% @importance 0.65

0.44::true_val(comparable_board_cross_brand_salomon_assassin, salomon_assassin); 0.56::true_val(comparable_board_cross_brand_salomon_assassin, unk_comparable_board_cross_brand_salomon_assassin).
measured(s43, comparable_board_cross_brand_salomon_assassin, salomon_assassin).
all_consistent(comparable_board_cross_brand_salomon_assassin) :- consistent(s43, comparable_board_cross_brand_salomon_assassin).
evidence(all_consistent(comparable_board_cross_brand_salomon_assassin)).
query(true_val(comparable_board_cross_brand_salomon_assassin, salomon_assassin)).
query(true_val(comparable_board_cross_brand_salomon_assassin, unk_comparable_board_cross_brand_salomon_assassin)).

0.85::acc(s38, comparable_board_cross_brand_ride_twinpig).

% @attr comparable_board_cross_brand_ride_twinpig
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Ride TwinPig)
% @values ride_twinpig=Ride_TwinPig unk_comparable_board_cross_brand_ride_twinpig=Unknown
% @importance 0.7

0.70::true_val(comparable_board_cross_brand_ride_twinpig, ride_twinpig); 0.30::true_val(comparable_board_cross_brand_ride_twinpig, unk_comparable_board_cross_brand_ride_twinpig).
measured(s38, comparable_board_cross_brand_ride_twinpig, ride_twinpig).
all_consistent(comparable_board_cross_brand_ride_twinpig) :- consistent(s38, comparable_board_cross_brand_ride_twinpig).
evidence(all_consistent(comparable_board_cross_brand_ride_twinpig)).
query(true_val(comparable_board_cross_brand_ride_twinpig, ride_twinpig)).
query(true_val(comparable_board_cross_brand_ride_twinpig, unk_comparable_board_cross_brand_ride_twinpig)).

0.45::acc(s44, user_review_forum_trs_vs_doa).

% @attr user_review_forum_trs_vs_doa
% @type categorical
% @canonical false
% @original_name user_review_forum (TRS vs DOA)
% @values trs_more_playful=TRS_more_playful_DOA_more_Good_Wood_TRS_better_edge_hold unk_user_review_forum_trs_vs_doa=Unknown
% @importance 0.7

0.28::true_val(user_review_forum_trs_vs_doa, trs_more_playful); 0.72::true_val(user_review_forum_trs_vs_doa, unk_user_review_forum_trs_vs_doa).
measured(s44, user_review_forum_trs_vs_doa, trs_more_playful).
all_consistent(user_review_forum_trs_vs_doa) :- consistent(s44, user_review_forum_trs_vs_doa).
evidence(all_consistent(user_review_forum_trs_vs_doa)).
query(true_val(user_review_forum_trs_vs_doa, trs_more_playful)).
query(true_val(user_review_forum_trs_vs_doa, unk_user_review_forum_trs_vs_doa)).

0.75::acc(s45, reviewer_opinion_snowboardingprofiles_vs_mt).

% @attr reviewer_opinion_snowboardingprofiles_vs_mt
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (TRS vs Mountain Twin)
% @values trs_jumps_switch_mt_speed_powder=TRS_better_jumps_switch_spins_MT_better_speed_powder unk_reviewer_opinion_snowboardingprofiles_vs_mt=Unknown
% @importance 0.75

0.60::true_val(reviewer_opinion_snowboardingprofiles_vs_mt, trs_jumps_switch_mt_speed_powder); 0.40::true_val(reviewer_opinion_snowboardingprofiles_vs_mt, unk_reviewer_opinion_snowboardingprofiles_vs_mt).
measured(s45, reviewer_opinion_snowboardingprofiles_vs_mt, trs_jumps_switch_mt_speed_powder).
all_consistent(reviewer_opinion_snowboardingprofiles_vs_mt) :- consistent(s45, reviewer_opinion_snowboardingprofiles_vs_mt).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles_vs_mt)).
query(true_val(reviewer_opinion_snowboardingprofiles_vs_mt, trs_jumps_switch_mt_speed_powder)).
query(true_val(reviewer_opinion_snowboardingprofiles_vs_mt, unk_reviewer_opinion_snowboardingprofiles_vs_mt)).

0.45::acc(s46, user_review_forum_trs_vs_boxknife).

% @attr user_review_forum_trs_vs_boxknife
% @type categorical
% @canonical false
% @original_name user_review_forum (TRS vs Box Knife)
% @values trs_all_mtn_bk_freestyle=TRS_more_all_mountain_Box_Knife_more_freestyle unk_user_review_forum_trs_vs_boxknife=Unknown
% @importance 0.55

0.30::true_val(user_review_forum_trs_vs_boxknife, trs_all_mtn_bk_freestyle); 0.70::true_val(user_review_forum_trs_vs_boxknife, unk_user_review_forum_trs_vs_boxknife).
measured(s46, user_review_forum_trs_vs_boxknife, trs_all_mtn_bk_freestyle).
all_consistent(user_review_forum_trs_vs_boxknife) :- consistent(s46, user_review_forum_trs_vs_boxknife).
evidence(all_consistent(user_review_forum_trs_vs_boxknife)).
query(true_val(user_review_forum_trs_vs_boxknife, trs_all_mtn_bk_freestyle)).
query(true_val(user_review_forum_trs_vs_boxknife, unk_user_review_forum_trs_vs_boxknife)).

0.72::acc(s41, comparable_board_cross_brand_doa_price).
0.88::acc(s20, comparable_board_cross_brand_doa_price).

% @attr comparable_board_cross_brand_doa_price
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (DOA price comparison)
% @values doa_cheaper=DOA_463p96_sale_vs_TRS_559p99_sale unk_comparable_board_cross_brand_doa_price=Unknown
% @importance 0.9

0.95::true_val(comparable_board_cross_brand_doa_price, doa_cheaper); 0.05::true_val(comparable_board_cross_brand_doa_price, unk_comparable_board_cross_brand_doa_price).
measured(s41, comparable_board_cross_brand_doa_price, doa_cheaper).
measured(s20, comparable_board_cross_brand_doa_price, doa_cheaper).
all_consistent(comparable_board_cross_brand_doa_price) :- consistent(s41, comparable_board_cross_brand_doa_price), consistent(s20, comparable_board_cross_brand_doa_price).
evidence(all_consistent(comparable_board_cross_brand_doa_price)).
query(true_val(comparable_board_cross_brand_doa_price, doa_cheaper)).
query(true_val(comparable_board_cross_brand_doa_price, unk_comparable_board_cross_brand_doa_price)).

0.80::acc(s27, comparable_board_cross_brand_warranty_compare).
0.93::acc(s26, comparable_board_cross_brand_warranty_compare).

% @attr comparable_board_cross_brand_warranty_compare
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (warranty comparison)
% @values doa_2yr_vs_trs_1yr=Capita_2yr_warranty_vs_Lib_Tech_1yr unk_comparable_board_cross_brand_warranty_compare=Unknown
% @importance 0.775

0.95::true_val(comparable_board_cross_brand_warranty_compare, doa_2yr_vs_trs_1yr); 0.05::true_val(comparable_board_cross_brand_warranty_compare, unk_comparable_board_cross_brand_warranty_compare).
measured(s27, comparable_board_cross_brand_warranty_compare, doa_2yr_vs_trs_1yr).
measured(s26, comparable_board_cross_brand_warranty_compare, doa_2yr_vs_trs_1yr).
all_consistent(comparable_board_cross_brand_warranty_compare) :- consistent(s27, comparable_board_cross_brand_warranty_compare), consistent(s26, comparable_board_cross_brand_warranty_compare).
evidence(all_consistent(comparable_board_cross_brand_warranty_compare)).
query(true_val(comparable_board_cross_brand_warranty_compare, doa_2yr_vs_trs_1yr)).
query(true_val(comparable_board_cross_brand_warranty_compare, unk_comparable_board_cross_brand_warranty_compare)).

0.80::acc(s3, reviewer_opinion_the_good_ride_evolution).

% @attr reviewer_opinion_the_good_ride_evolution
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (camber evolution)
% @values camber_to_btx_to_c2_to_c3=Camber_MTX_BTX_C2_XC2_to_C3_evolution unk_reviewer_opinion_the_good_ride_evolution=Unknown
% @importance 0.5

0.76::true_val(reviewer_opinion_the_good_ride_evolution, camber_to_btx_to_c2_to_c3); 0.24::true_val(reviewer_opinion_the_good_ride_evolution, unk_reviewer_opinion_the_good_ride_evolution).
measured(s3, reviewer_opinion_the_good_ride_evolution, camber_to_btx_to_c2_to_c3).
all_consistent(reviewer_opinion_the_good_ride_evolution) :- consistent(s3, reviewer_opinion_the_good_ride_evolution).
evidence(all_consistent(reviewer_opinion_the_good_ride_evolution)).
query(true_val(reviewer_opinion_the_good_ride_evolution, camber_to_btx_to_c2_to_c3)).
query(true_val(reviewer_opinion_the_good_ride_evolution, unk_reviewer_opinion_the_good_ride_evolution)).

0.75::acc(s47, redesign_year).

% @attr redesign_year
% @type categorical
% @canonical false
% @original_name redesign_year
% @values changes_2024_not_significant=2024_changes_not_super_significant unk_redesign_year=Unknown
% @importance 0.7

0.63::true_val(redesign_year, changes_2024_not_significant); 0.37::true_val(redesign_year, unk_redesign_year).
measured(s47, redesign_year, changes_2024_not_significant).
all_consistent(redesign_year) :- consistent(s47, redesign_year).
evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, changes_2024_not_significant)).
query(true_val(redesign_year, unk_redesign_year)).

0.72::acc(s8, predecessor_flex_evolution).

% @attr predecessor_flex_evolution
% @type categorical
% @canonical false
% @original_name predecessor flex evolution
% @values park_soft_to_all_mtn_stiff=Evolved_from_park_soft_to_all_mountain_powerhouse unk_predecessor_flex_evolution=Unknown
% @importance 0.8

0.71::true_val(predecessor_flex_evolution, park_soft_to_all_mtn_stiff); 0.29::true_val(predecessor_flex_evolution, unk_predecessor_flex_evolution).
measured(s8, predecessor_flex_evolution, park_soft_to_all_mtn_stiff).
all_consistent(predecessor_flex_evolution) :- consistent(s8, predecessor_flex_evolution).
evidence(all_consistent(predecessor_flex_evolution)).
query(true_val(predecessor_flex_evolution, park_soft_to_all_mtn_stiff)).
query(true_val(predecessor_flex_evolution, unk_predecessor_flex_evolution)).

0.82::acc(s48, lib_tech_brand_history).

% @attr lib_tech_brand_history
% @type categorical
% @canonical false
% @original_name Lib Tech brand history
% @values olson_saari_liberace=Co_founded_Mike_Olson_Pete_Saari_Liberace_Technologies unk_lib_tech_brand_history=Unknown
% @importance 0.35

0.77::true_val(lib_tech_brand_history, olson_saari_liberace); 0.23::true_val(lib_tech_brand_history, unk_lib_tech_brand_history).
measured(s48, lib_tech_brand_history, olson_saari_liberace).
all_consistent(lib_tech_brand_history) :- consistent(s48, lib_tech_brand_history).
evidence(all_consistent(lib_tech_brand_history)).
query(true_val(lib_tech_brand_history, olson_saari_liberace)).
query(true_val(lib_tech_brand_history, unk_lib_tech_brand_history)).

0.75::acc(s30, mervin_founding).

% @attr mervin_founding
% @type categorical
% @canonical false
% @original_name Mervin founding
% @values roots_1977_official_1988=Roots_1977_officially_formed_1988 unk_mervin_founding=Unknown
% @importance 0.35

0.63::true_val(mervin_founding, roots_1977_official_1988); 0.37::true_val(mervin_founding, unk_mervin_founding).
measured(s30, mervin_founding, roots_1977_official_1988).
all_consistent(mervin_founding) :- consistent(s30, mervin_founding).
evidence(all_consistent(mervin_founding)).
query(true_val(mervin_founding, roots_1977_official_1988)).
query(true_val(mervin_founding, unk_mervin_founding)).

0.75::acc(s30, mervin_factory_opened).

% @attr mervin_factory_opened
% @type categorical
% @canonical false
% @original_name Mervin factory opened
% @values y1995_current_location=1995_in_current_location unk_mervin_factory_opened=Unknown
% @importance 0.35

0.63::true_val(mervin_factory_opened, y1995_current_location); 0.37::true_val(mervin_factory_opened, unk_mervin_factory_opened).
measured(s30, mervin_factory_opened, y1995_current_location).
all_consistent(mervin_factory_opened) :- consistent(s30, mervin_factory_opened).
evidence(all_consistent(mervin_factory_opened)).
query(true_val(mervin_factory_opened, y1995_current_location)).
query(true_val(mervin_factory_opened, unk_mervin_factory_opened)).

0.75::acc(s30, mervin_brands).

% @attr mervin_brands
% @type categorical
% @canonical false
% @original_name Mervin brands
% @values lib_gnu_bent_roxy=Lib_Tech_GNU_Bent_Metal_Roxy unk_mervin_brands=Unknown
% @importance 0.35

0.63::true_val(mervin_brands, lib_gnu_bent_roxy); 0.37::true_val(mervin_brands, unk_mervin_brands).
measured(s30, mervin_brands, lib_gnu_bent_roxy).
all_consistent(mervin_brands) :- consistent(s30, mervin_brands).
evidence(all_consistent(mervin_brands)).
query(true_val(mervin_brands, lib_gnu_bent_roxy)).
query(true_val(mervin_brands, unk_mervin_brands)).

0.75::acc(s30, brand_reputation).

% @attr brand_reputation
% @type categorical
% @canonical false
% @original_name brand reputation
% @values design_mfg_same_place_usa=One_of_few_designing_and_manufacturing_in_same_place_USA unk_brand_reputation=Unknown
% @importance 0.35

0.63::true_val(brand_reputation, design_mfg_same_place_usa); 0.37::true_val(brand_reputation, unk_brand_reputation).
measured(s30, brand_reputation, design_mfg_same_place_usa).
all_consistent(brand_reputation) :- consistent(s30, brand_reputation).
evidence(all_consistent(brand_reputation)).
query(true_val(brand_reputation, design_mfg_same_place_usa)).
query(true_val(brand_reputation, unk_brand_reputation)).

0.82::acc(s48, mervin_founder_background).

% @attr mervin_founder_background
% @type categorical
% @canonical false
% @original_name Mervin founder background
% @values forty_plus_years_innovation=40_plus_years_board_building_technology_innovation unk_mervin_founder_background=Unknown
% @importance 0.35

0.77::true_val(mervin_founder_background, forty_plus_years_innovation); 0.23::true_val(mervin_founder_background, unk_mervin_founder_background).
measured(s48, mervin_founder_background, forty_plus_years_innovation).
all_consistent(mervin_founder_background) :- consistent(s48, mervin_founder_background).
evidence(all_consistent(mervin_founder_background)).
query(true_val(mervin_founder_background, forty_plus_years_innovation)).
query(true_val(mervin_founder_background, unk_mervin_founder_background)).

0.82::acc(s48, magne_traction_invention).

% @attr magne_traction_invention
% @type categorical
% @canonical false
% @original_name Magne-Traction invention
% @values lib_tech_pioneered=Lib_Tech_pioneered_Magne_Traction_serrated_edge unk_magne_traction_invention=Unknown
% @importance 0.35

0.77::true_val(magne_traction_invention, lib_tech_pioneered); 0.23::true_val(magne_traction_invention, unk_magne_traction_invention).
measured(s48, magne_traction_invention, lib_tech_pioneered).
all_consistent(magne_traction_invention) :- consistent(s48, magne_traction_invention).
evidence(all_consistent(magne_traction_invention)).
query(true_val(magne_traction_invention, lib_tech_pioneered)).
query(true_val(magne_traction_invention, unk_magne_traction_invention)).

0.82::acc(s48, banana_tech_invention).

% @attr banana_tech_invention
% @type categorical
% @canonical false
% @original_name Banana Tech invention
% @values skate_banana_2007=Lib_Tech_Skate_Banana_2007_reversed_camber unk_banana_tech_invention=Unknown
% @importance 0.35

0.77::true_val(banana_tech_invention, skate_banana_2007); 0.23::true_val(banana_tech_invention, unk_banana_tech_invention).
measured(s48, banana_tech_invention, skate_banana_2007).
all_consistent(banana_tech_invention) :- consistent(s48, banana_tech_invention).
evidence(all_consistent(banana_tech_invention)).
query(true_val(banana_tech_invention, skate_banana_2007)).
query(true_val(banana_tech_invention, unk_banana_tech_invention)).