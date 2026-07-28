0.20::indep(s_merchant).
0.25::indep(s2).
0.20::indep(s4).
0.20::indep(s13).
0.25::indep(s15).
0.40::indep(s21).
0.55::indep(s14).
0.90::indep(s24).
0.95::indep(s26).
0.90::indep(s27).
0.20::indep(s30).
0.20::indep(s32).
0.15::indep(s34).
0.25::indep(s36).
0.20::indep(s37).
0.20::indep(s38).
0.30::indep(s35).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values gnu=GNU unk_brand=Unknown
% @importance 1.0

0.95::acc(s1, brand).

0.95::true_val(brand, gnu); 0.05::true_val(brand, unk_brand).

measured(s1, brand, gnu).

all_consistent(brand) :- consistent(s1, brand).

evidence(all_consistent(brand)).
query(true_val(brand, gnu)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values facts=Facts unk_model_name=Unknown
% @importance 1.0

0.95::acc(s1, model_name).

0.95::true_val(model_name, facts); 0.05::true_val(model_name, unk_model_name).

measured(s1, model_name, facts).

all_consistent(model_name) :- consistent(s1, model_name).

evidence(all_consistent(model_name)).
query(true_val(model_name, facts)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2026=2026 unk_model_year=Unknown
% @importance 1.0

0.95::acc(s1, model_year).

0.95::true_val(model_year, y2026); 0.05::true_val(model_year, unk_model_year).

measured(s1, model_year, y2026).

all_consistent(model_year) :- consistent(s1, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2026)).
query(true_val(model_year, unk_model_year)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values new_for_2026=New_model_for_2026 unk_model_first_available_year=Unknown
% @importance 0.85

0.80::acc(s4, model_first_available_year).

0.69::true_val(model_first_available_year, new_for_2026); 0.31::true_val(model_first_available_year, unk_model_first_available_year).

measured(s4, model_first_available_year, new_for_2026).

all_consistent(model_first_available_year) :-
    (indep(s4), consistent(s4, model_first_available_year) ; \+indep(s4)).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, new_for_2026)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values mervin_manufacturing=Mervin_Manufacturing unk_manufacturer=Unknown
% @importance 0.7

0.85::acc(s2, manufacturer).
0.93::acc(s1, manufacturer).

0.95::true_val(manufacturer, mervin_manufacturing); 0.05::true_val(manufacturer, unk_manufacturer).

measured(s2, manufacturer, mervin_manufacturing).
measured(s1, manufacturer, mervin_manufacturing).

all_consistent(manufacturer) :-
    consistent(s1, manufacturer),
    (indep(s2), consistent(s2, manufacturer) ; \+indep(s2)).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, mervin_manufacturing)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr parent_company_ownership
% @type categorical
% @canonical false
% @original_name Parent company ownership
% @values altamont_capital_2013=Altamont_Capital_since_2013 unk_parent_company_ownership=Unknown
% @importance 0.5

0.80::acc(s3, parent_company_ownership).

0.76::true_val(parent_company_ownership, altamont_capital_2013); 0.24::true_val(parent_company_ownership, unk_parent_company_ownership).

measured(s3, parent_company_ownership, altamont_capital_2013).

all_consistent(parent_company_ownership) :- consistent(s3, parent_company_ownership).

evidence(all_consistent(parent_company_ownership)).
query(true_val(parent_company_ownership, altamont_capital_2013)).
query(true_val(parent_company_ownership, unk_parent_company_ownership)).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values sequim_wa_usa=Sequim_Carlsborg_Washington_USA unk_manufacturing_location=Unknown
% @importance 0.55

0.88::acc(s3, manufacturing_location).
0.92::acc(s5, manufacturing_location).

0.95::true_val(manufacturing_location, sequim_wa_usa); 0.05::true_val(manufacturing_location, unk_manufacturing_location).

measured(s3, manufacturing_location, sequim_wa_usa).
measured(s5, manufacturing_location, sequim_wa_usa).

all_consistent(manufacturing_location) :-
    consistent(s3, manufacturing_location),
    consistent(s5, manufacturing_location).

evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, sequim_wa_usa)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

% @attr mervin_manufacturing_founded
% @type categorical
% @canonical false
% @original_name Mervin Manufacturing founded
% @values founded_1977=1977_by_Olson_and_Saari unk_mervin_manufacturing_founded=Unknown
% @importance 0.6

0.90::acc(s5, mervin_manufacturing_founded).

0.86::true_val(mervin_manufacturing_founded, founded_1977); 0.14::true_val(mervin_manufacturing_founded, unk_mervin_manufacturing_founded).

measured(s5, mervin_manufacturing_founded, founded_1977).

all_consistent(mervin_manufacturing_founded) :- consistent(s5, mervin_manufacturing_founded).

evidence(all_consistent(mervin_manufacturing_founded)).
query(true_val(mervin_manufacturing_founded, founded_1977)).
query(true_val(mervin_manufacturing_founded, unk_mervin_manufacturing_founded)).

% @attr gnu_brand_founding
% @type categorical
% @canonical false
% @original_name GNU brand founding
% @values early_80s_olson=Early_80s_by_Mike_Olson unk_gnu_brand_founding=Unknown
% @importance 0.3

0.82::acc(s6, gnu_brand_founding).

0.77::true_val(gnu_brand_founding, early_80s_olson); 0.23::true_val(gnu_brand_founding, unk_gnu_brand_founding).

measured(s6, gnu_brand_founding, early_80s_olson).

all_consistent(gnu_brand_founding) :- consistent(s6, gnu_brand_founding).

evidence(all_consistent(gnu_brand_founding)).
query(true_val(gnu_brand_founding, early_80s_olson)).
query(true_val(gnu_brand_founding, unk_gnu_brand_founding)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values zero_hazardous_waste=Zero_hazardous_waste_factory unk_sustainability_certification=Unknown
% @importance 0.5

0.87::acc(s7, sustainability_certification).
0.82::acc(s2, sustainability_certification).

0.95::true_val(sustainability_certification, zero_hazardous_waste); 0.05::true_val(sustainability_certification, unk_sustainability_certification).

measured(s7, sustainability_certification, zero_hazardous_waste).
measured(s2, sustainability_certification, zero_hazardous_waste).

all_consistent(sustainability_certification) :-
    consistent(s7, sustainability_certification),
    (indep(s2), consistent(s2, sustainability_certification) ; \+indep(s2)).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, zero_hazardous_waste)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr sustainability_certification_eco_sublimation
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values eco_sublimation_zero_waste=Eco_sublimation_printing_zero_hazardous_waste unk_sc_eco_sub=Unknown
% @importance 0.5

0.83::acc(s8, sustainability_certification_eco_sublimation).

0.72::true_val(sustainability_certification_eco_sublimation, eco_sublimation_zero_waste); 0.28::true_val(sustainability_certification_eco_sublimation, unk_sc_eco_sub).

measured(s8, sustainability_certification_eco_sublimation, eco_sublimation_zero_waste).

all_consistent(sustainability_certification_eco_sublimation) :- consistent(s8, sustainability_certification_eco_sublimation).

evidence(all_consistent(sustainability_certification_eco_sublimation)).
query(true_val(sustainability_certification_eco_sublimation, eco_sublimation_zero_waste)).
query(true_val(sustainability_certification_eco_sublimation, unk_sc_eco_sub)).

% @attr graphic_designer_artist
% @type categorical
% @canonical true
% @original_name graphic_designer_artist
% @values sam_davidson=Sam_Davidson_Anti_Hero unk_graphic_designer_artist=Unknown
% @importance 0.2

0.70::acc(s9, graphic_designer_artist).

0.56::true_val(graphic_designer_artist, sam_davidson); 0.44::true_val(graphic_designer_artist, unk_graphic_designer_artist).

measured(s9, graphic_designer_artist, sam_davidson).

all_consistent(graphic_designer_artist) :- consistent(s9, graphic_designer_artist).

evidence(all_consistent(graphic_designer_artist)).
query(true_val(graphic_designer_artist, sam_davidson)).
query(true_val(graphic_designer_artist, unk_graphic_designer_artist)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.95::acc(s1, product_type).

0.95::true_val(product_type, snowboard); 0.05::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).

all_consistent(product_type) :- consistent(s1, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values freestyle_all_mountain=Freestyle_All_Mountain unk_board_category=Unknown
% @importance 1.0

0.95::acc(s1, board_category).

0.95::true_val(board_category, freestyle_all_mountain); 0.05::true_val(board_category, unk_board_category).

measured(s1, board_category, freestyle_all_mountain).

all_consistent(board_category) :- consistent(s1, board_category).

evidence(all_consistent(board_category)).
query(true_val(board_category, freestyle_all_mountain)).
query(true_val(board_category, unk_board_category)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.7

0.95::acc(s10, gender).

0.90::true_val(gender, mens); 0.10::true_val(gender, unk_gender).

measured(s10, gender, mens).

all_consistent(gender) :- consistent(s10, gender).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values gnu_fiction=GNU_Fiction_directional_twin_softer_flex unk_comparable_board_same_brand=Unknown
% @importance 0.5

0.90::acc(s11, comparable_board_same_brand).

0.81::true_val(comparable_board_same_brand, gnu_fiction); 0.19::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s11, comparable_board_same_brand, gnu_fiction).

all_consistent(comparable_board_same_brand) :- consistent(s11, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, gnu_fiction)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_fiction_price
% @type numeric
% @canonical false
% @original_name comparable_board_same_brand
% @unit USD
% @values v399_99=399.99 unk_cbsb_fiction_price=Unknown
% @importance 0.4

0.82::acc(s2, comparable_board_same_brand_fiction_price).

0.77::true_val(comparable_board_same_brand_fiction_price, v399_99); 0.23::true_val(comparable_board_same_brand_fiction_price, unk_cbsb_fiction_price).

measured(s2, comparable_board_same_brand_fiction_price, v399_99).

all_consistent(comparable_board_same_brand_fiction_price) :-
    (indep(s2), consistent(s2, comparable_board_same_brand_fiction_price) ; \+indep(s2)).

evidence(all_consistent(comparable_board_same_brand_fiction_price)).
query(true_val(comparable_board_same_brand_fiction_price, v399_99)).
query(true_val(comparable_board_same_brand_fiction_price, unk_cbsb_fiction_price)).

% @attr sku_156w
% @type categorical
% @canonical false
% @original_name SKU (156cm Wide)
% @values sku_25sn001_156w=25SN001_156W unk_sku_156w=Unknown
% @importance 0.85

0.92::acc(s_merchant, sku_156w).

0.92::true_val(sku_156w, sku_25sn001_156w); 0.08::true_val(sku_156w, unk_sku_156w).

measured(s_merchant, sku_156w, sku_25sn001_156w).

all_consistent(sku_156w) :-
    (indep(s_merchant), consistent(s_merchant, sku_156w) ; \+indep(s_merchant)).

evidence(all_consistent(sku_156w)).
query(true_val(sku_156w, sku_25sn001_156w)).
query(true_val(sku_156w, unk_sku_156w)).

% @attr gnu_com_user_rating
% @type categorical
% @canonical false
% @original_name Gnu.com user rating
% @values pct100_of_100=100pct_of_100_1_review unk_gnu_com_user_rating=Unknown
% @importance 1.0

0.88::acc(s1, gnu_com_user_rating).

0.92::true_val(gnu_com_user_rating, pct100_of_100); 0.08::true_val(gnu_com_user_rating, unk_gnu_com_user_rating).

measured(s1, gnu_com_user_rating, pct100_of_100).

all_consistent(gnu_com_user_rating) :- consistent(s1, gnu_com_user_rating).

evidence(all_consistent(gnu_com_user_rating)).
query(true_val(gnu_com_user_rating, pct100_of_100)).
query(true_val(gnu_com_user_rating, unk_gnu_com_user_rating)).

% @attr factory_tuning
% @type categorical
% @canonical false
% @original_name Factory tuning
% @values waxed_ready=Board_comes_waxed_and_ready unk_factory_tuning=Unknown
% @importance 0.6

0.80::acc(s13, factory_tuning).

0.69::true_val(factory_tuning, waxed_ready); 0.31::true_val(factory_tuning, unk_factory_tuning).

measured(s13, factory_tuning, waxed_ready).

all_consistent(factory_tuning) :-
    (indep(s13), consistent(s13, factory_tuning) ; \+indep(s13)).

evidence(all_consistent(factory_tuning)).
query(true_val(factory_tuning, waxed_ready)).
query(true_val(factory_tuning, unk_factory_tuning)).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values bent_metal=Bent_Metal_bindings_same_factory unk_binding_compatibility=Unknown
% @importance 0.5

0.70::acc(s14, binding_compatibility).

0.52::true_val(binding_compatibility, bent_metal); 0.48::true_val(binding_compatibility, unk_binding_compatibility).

measured(s14, binding_compatibility, bent_metal).

all_consistent(binding_compatibility) :-
    (indep(s14), consistent(s14, binding_compatibility) ; \+indep(s14)).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, bent_metal)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values directional_twin=Directional_Twin unk_shape=Unknown
% @importance 1.0

0.95::acc(s1, shape).
0.80::acc(s15, shape).

0.95::true_val(shape, directional_twin); 0.05::true_val(shape, unk_shape).

measured(s1, shape, directional_twin).
measured(s15, shape, directional_twin).

all_consistent(shape) :-
    consistent(s1, shape),
    (indep(s15), consistent(s15, shape) ; \+indep(s15)).

evidence(all_consistent(shape)).
query(true_val(shape, directional_twin)).
query(true_val(shape, unk_shape)).

% @attr shape_description
% @type categorical
% @canonical false
% @original_name Shape description
% @values sym_flex_longer_nose=Symmetrical_flex_longer_nose_shorter_tail unk_shape_description=Unknown
% @importance 0.8

0.78::acc(s15, shape_description).

0.60::true_val(shape_description, sym_flex_longer_nose); 0.40::true_val(shape_description, unk_shape_description).

measured(s15, shape_description, sym_flex_longer_nose).

all_consistent(shape_description) :-
    (indep(s15), consistent(s15, shape_description) ; \+indep(s15)).

evidence(all_consistent(shape_description)).
query(true_val(shape_description, sym_flex_longer_nose)).
query(true_val(shape_description, unk_shape_description)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values original_banana_btx=Original_Banana_BTX_Hybrid unk_camber_type=Unknown
% @importance 1.0

0.95::acc(s1, camber_type).

0.95::true_val(camber_type, original_banana_btx); 0.05::true_val(camber_type, unk_camber_type).

measured(s1, camber_type, original_banana_btx).

all_consistent(camber_type) :- consistent(s1, camber_type).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, original_banana_btx)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values mild_rocker_mild_camber=Mild_rocker_between_feet_mild_camber_to_tips unk_camber_description=Unknown
% @importance 0.85

0.90::acc(s16, camber_description).

0.81::true_val(camber_description, mild_rocker_mild_camber); 0.19::true_val(camber_description, unk_camber_description).

measured(s16, camber_description, mild_rocker_mild_camber).

all_consistent(camber_description) :- consistent(s16, camber_description).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, mild_rocker_mild_camber)).
query(true_val(camber_description, unk_camber_description)).

% @attr camber_description_benefits
% @type categorical
% @canonical false
% @original_name camber_description
% @values catch_free_float=Catch_free_float_smooth_turn_playful unk_camber_desc_benefits=Unknown
% @importance 0.85

0.80::acc(s4, camber_description_benefits).

0.69::true_val(camber_description_benefits, catch_free_float); 0.31::true_val(camber_description_benefits, unk_camber_desc_benefits).

measured(s4, camber_description_benefits, catch_free_float).

all_consistent(camber_description_benefits) :-
    (indep(s4), consistent(s4, camber_description_benefits) ; \+indep(s4)).

evidence(all_consistent(camber_description_benefits)).
query(true_val(camber_description_benefits, catch_free_float)).
query(true_val(camber_description_benefits, unk_camber_desc_benefits)).

% @attr setback
% @type numeric
% @canonical true
% @original_name setback
% @unit inches
% @values v0_75=0.75 unk_setback=Unknown
% @importance 0.93

0.95::acc(s1, setback).
0.88::acc(s_merchant, setback).

0.95::true_val(setback, v0_75); 0.05::true_val(setback, unk_setback).

measured(s1, setback, v0_75).
measured(s_merchant, setback, v0_75).

all_consistent(setback) :-
    consistent(s1, setback),
    (indep(s_merchant), consistent(s_merchant, setback) ; \+indep(s_merchant)).

evidence(all_consistent(setback)).
query(true_val(setback, v0_75)).
query(true_val(setback, unk_setback)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @original_name flex_rating_10
% @unit /10
% @values v6=6.0 v5=5.0 unk_flex_rating_10=Unknown
% @importance 0.9

0.93::acc(s1, flex_rating_10).
0.72::acc(s15, flex_rating_10).

0.65::true_val(flex_rating_10, v6); 0.30::true_val(flex_rating_10, v5); 0.05::true_val(flex_rating_10, unk_flex_rating_10).

measured(s1, flex_rating_10, v6).
measured(s15, flex_rating_10, v5).

all_consistent(flex_rating_10) :-
    consistent(s1, flex_rating_10),
    (indep(s15), consistent(s15, flex_rating_10) ; \+indep(s15)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v6)).
query(true_val(flex_rating_10, v5)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

% @attr flex_rating_10_147
% @type numeric
% @canonical false
% @original_name flex_rating_10
% @unit /10
% @values v4=4.0 v5_gen=5.0 unk_flex_147=Unknown
% @importance 0.9

0.93::acc(s1, flex_rating_10_147).
0.85::acc(s_merchant, flex_rating_10_147).
0.72::acc(s15, flex_rating_10_147).

0.55::true_val(flex_rating_10_147, v4); 0.35::true_val(flex_rating_10_147, v5_gen); 0.10::true_val(flex_rating_10_147, unk_flex_147).

measured(s1, flex_rating_10_147, v4).
measured(s_merchant, flex_rating_10_147, v4).
measured(s15, flex_rating_10_147, v5_gen).

all_consistent(flex_rating_10_147) :-
    consistent(s1, flex_rating_10_147),
    (indep(s_merchant), consistent(s_merchant, flex_rating_10_147) ; \+indep(s_merchant)),
    (indep(s15), consistent(s15, flex_rating_10_147) ; \+indep(s15)).

evidence(all_consistent(flex_rating_10_147)).
query(true_val(flex_rating_10_147, v4)).
query(true_val(flex_rating_10_147, v5_gen)).
query(true_val(flex_rating_10_147, unk_flex_147)).

% @attr flex_rating_10_150
% @type numeric
% @canonical false
% @original_name flex_rating_10
% @unit /10
% @values v4_5=4.5 unk_flex_150=Unknown
% @importance 1.0

0.93::acc(s1, flex_rating_10_150).

0.92::true_val(flex_rating_10_150, v4_5); 0.08::true_val(flex_rating_10_150, unk_flex_150).

measured(s1, flex_rating_10_150, v4_5).

all_consistent(flex_rating_10_150) :- consistent(s1, flex_rating_10_150).

evidence(all_consistent(flex_rating_10_150)).
query(true_val(flex_rating_10_150, v4_5)).
query(true_val(flex_rating_10_150, unk_flex_150)).

% @attr flex_rating_10_153
% @type numeric
% @canonical false
% @original_name flex_rating_10
% @unit /10
% @values v5_153=5.0 unk_flex_153=Unknown
% @importance 1.0

0.93::acc(s1, flex_rating_10_153).

0.92::true_val(flex_rating_10_153, v5_153); 0.08::true_val(flex_rating_10_153, unk_flex_153).

measured(s1, flex_rating_10_153, v5_153).

all_consistent(flex_rating_10_153) :- consistent(s1, flex_rating_10_153).

evidence(all_consistent(flex_rating_10_153)).
query(true_val(flex_rating_10_153, v5_153)).
query(true_val(flex_rating_10_153, unk_flex_153)).

% @attr flex_rating_10_156w
% @type numeric
% @canonical false
% @original_name flex_rating_10
% @unit /10
% @values v5_156w=5.0 unk_flex_156w=Unknown
% @importance 1.0

0.93::acc(s1, flex_rating_10_156w).

0.92::true_val(flex_rating_10_156w, v5_156w); 0.08::true_val(flex_rating_10_156w, unk_flex_156w).

measured(s1, flex_rating_10_156w, v5_156w).

all_consistent(flex_rating_10_156w) :- consistent(s1, flex_rating_10_156w).

evidence(all_consistent(flex_rating_10_156w)).
query(true_val(flex_rating_10_156w, v5_156w)).
query(true_val(flex_rating_10_156w, unk_flex_156w)).

% @attr flex_rating_10_159
% @type numeric
% @canonical false
% @original_name flex_rating_10
% @unit /10
% @values v6_159=6.0 unk_flex_159=Unknown
% @importance 1.0

0.93::acc(s1, flex_rating_10_159).

0.92::true_val(flex_rating_10_159, v6_159); 0.08::true_val(flex_rating_10_159, unk_flex_159).

measured(s1, flex_rating_10_159, v6_159).

all_consistent(flex_rating_10_159) :- consistent(s1, flex_rating_10_159).

evidence(all_consistent(flex_rating_10_159)).
query(true_val(flex_rating_10_159, v6_159)).
query(true_val(flex_rating_10_159, unk_flex_159)).

% @attr flex_rating_10_162w
% @type numeric
% @canonical false
% @original_name flex_rating_10
% @unit /10
% @values v7_162w=7.0 unk_flex_162w=Unknown
% @importance 1.0

0.93::acc(s1, flex_rating_10_162w).

0.92::true_val(flex_rating_10_162w, v7_162w); 0.08::true_val(flex_rating_10_162w, unk_flex_162w).

measured(s1, flex_rating_10_162w, v7_162w).

all_consistent(flex_rating_10_162w) :- consistent(s1, flex_rating_10_162w).

evidence(all_consistent(flex_rating_10_162w)).
query(true_val(flex_rating_10_162w, v7_162w)).
query(true_val(flex_rating_10_162w, unk_flex_162w)).

% @attr flex_feel
% @type categorical
% @canonical false
% @original_name flex_feel
% @values medium_soft=Medium_Soft_easy_flexing unk_flex_feel=Unknown
% @importance 0.85

0.80::acc(s4, flex_feel).

0.69::true_val(flex_feel, medium_soft); 0.31::true_val(flex_feel, unk_flex_feel).

measured(s4, flex_feel, medium_soft).

all_consistent(flex_feel) :-
    (indep(s4), consistent(s4, flex_feel) ; \+indep(s4)).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium_soft)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr flex_rating_10_evo
% @type categorical
% @canonical false
% @original_name flex_rating_10_evo
% @values medium=Medium unk_flex_rating_10_evo=Unknown
% @importance 0.9

0.83::acc(s2, flex_rating_10_evo).

0.77::true_val(flex_rating_10_evo, medium); 0.23::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).

measured(s2, flex_rating_10_evo, medium).

all_consistent(flex_rating_10_evo) :-
    (indep(s2), consistent(s2, flex_rating_10_evo) ; \+indep(s2)).

evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, medium)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

% @attr flex_direction
% @type categorical
% @canonical false
% @original_name flex_direction
% @values not_asymmetric=Not_asymmetric unk_flex_direction=Unknown
% @importance 1.0

0.93::acc(s1, flex_direction).

0.92::true_val(flex_direction, not_asymmetric); 0.08::true_val(flex_direction, unk_flex_direction).

measured(s1, flex_direction, not_asymmetric).

all_consistent(flex_direction) :- consistent(s1, flex_direction).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, not_asymmetric)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values poplar_paulownia=Poplar_Paulownia_G_Lite_1 aspen_paulownia=Aspen_Paulownia_G_Lite_1
% @importance 0.78

0.93::acc(s1, core_material).
0.82::acc(s2, core_material).
0.78::acc(s21, core_material).
0.75::acc(s22, core_material).
0.70::acc(s13, core_material).
0.72::acc(s4, core_material).

0.60::true_val(core_material, poplar_paulownia); 0.40::true_val(core_material, aspen_paulownia).

measured(s1, core_material, poplar_paulownia).
measured(s2, core_material, poplar_paulownia).
measured(s21, core_material, poplar_paulownia).
measured(s22, core_material, poplar_paulownia).
measured(s13, core_material, aspen_paulownia).
measured(s4, core_material, aspen_paulownia).

all_consistent(core_material) :-
    consistent(s1, core_material),
    (indep(s2), consistent(s2, core_material) ; \+indep(s2)),
    (indep(s21), consistent(s21, core_material) ; \+indep(s21)),
    (indep(s_merchant), consistent(s22, core_material) ; \+indep(s_merchant)),
    (indep(s13), consistent(s13, core_material) ; \+indep(s13)),
    (indep(s4), consistent(s4, core_material) ; \+indep(s4)).

evidence(all_consistent(core_material)).
query(true_val(core_material, poplar_paulownia)).
query(true_val(core_material, aspen_paulownia)).

% @attr sustainability_certification_fsc_core
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values fsc_certified_wood=FSC_certified_wood_core unk_sc_fsc=Unknown
% @importance 0.73

0.93::acc(s1, sustainability_certification_fsc_core).
0.82::acc(s2, sustainability_certification_fsc_core).
0.80::acc(s8, sustainability_certification_fsc_core).

0.95::true_val(sustainability_certification_fsc_core, fsc_certified_wood); 0.05::true_val(sustainability_certification_fsc_core, unk_sc_fsc).

measured(s1, sustainability_certification_fsc_core, fsc_certified_wood).
measured(s2, sustainability_certification_fsc_core, fsc_certified_wood).
measured(s8, sustainability_certification_fsc_core, fsc_certified_wood).

all_consistent(sustainability_certification_fsc_core) :-
    consistent(s1, sustainability_certification_fsc_core),
    (indep(s2), consistent(s2, sustainability_certification_fsc_core) ; \+indep(s2)),
    consistent(s8, sustainability_certification_fsc_core).

evidence(all_consistent(sustainability_certification_fsc_core)).
query(true_val(sustainability_certification_fsc_core, fsc_certified_wood)).
query(true_val(sustainability_certification_fsc_core, unk_sc_fsc)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values tri_ax_bi_ax_fiberglass=Tri_Ax_Bi_Ax_Fiberglass unk_laminate=Unknown
% @importance 0.88

0.93::acc(s1, laminate).
0.82::acc(s2, laminate).

0.95::true_val(laminate, tri_ax_bi_ax_fiberglass); 0.05::true_val(laminate, unk_laminate).

measured(s1, laminate, tri_ax_bi_ax_fiberglass).
measured(s2, laminate, tri_ax_bi_ax_fiberglass).

all_consistent(laminate) :-
    consistent(s1, laminate),
    (indep(s2), consistent(s2, laminate) ; \+indep(s2)).

evidence(all_consistent(laminate)).
query(true_val(laminate, tri_ax_bi_ax_fiberglass)).
query(true_val(laminate, unk_laminate)).

% @attr topsheet
% @type categorical
% @canonical true
% @original_name topsheet
% @values eco_sublimated_poly=Eco_Sublimated_Poly_Topsheet unk_topsheet=Unknown
% @importance 0.98

0.93::acc(s1, topsheet).
0.82::acc(s2, topsheet).

0.95::true_val(topsheet, eco_sublimated_poly); 0.05::true_val(topsheet, unk_topsheet).

measured(s1, topsheet, eco_sublimated_poly).
measured(s2, topsheet, eco_sublimated_poly).

all_consistent(topsheet) :-
    consistent(s1, topsheet),
    (indep(s2), consistent(s2, topsheet) ; \+indep(s2)).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, eco_sublimated_poly)).
query(true_val(topsheet, unk_topsheet)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values uhmw=UHMW_Polyethylene unk_sidewall_material=Unknown
% @importance 0.88

0.93::acc(s1, sidewall_material).
0.82::acc(s2, sidewall_material).
0.78::acc(s22, sidewall_material).

0.95::true_val(sidewall_material, uhmw); 0.05::true_val(sidewall_material, unk_sidewall_material).

measured(s1, sidewall_material, uhmw).
measured(s2, sidewall_material, uhmw).
measured(s22, sidewall_material, uhmw).

all_consistent(sidewall_material) :-
    consistent(s1, sidewall_material),
    (indep(s2), consistent(s2, sidewall_material) ; \+indep(s2)),
    (indep(s_merchant), consistent(s22, sidewall_material) ; \+indep(s_merchant)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, uhmw)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr tip_tail_protection
% @type categorical
% @canonical false
% @original_name Tip/tail protection
% @values uhmw_deflection=UHMW_Tip_Tail_Impact_Deflection unk_tip_tail_protection=Unknown
% @importance 0.6

0.78::acc(s13, tip_tail_protection).

0.69::true_val(tip_tail_protection, uhmw_deflection); 0.31::true_val(tip_tail_protection, unk_tip_tail_protection).

measured(s13, tip_tail_protection, uhmw_deflection).

all_consistent(tip_tail_protection) :-
    (indep(s13), consistent(s13, tip_tail_protection) ; \+indep(s13)).

evidence(all_consistent(tip_tail_protection)).
query(true_val(tip_tail_protection, uhmw_deflection)).
query(true_val(tip_tail_protection, unk_tip_tail_protection)).

% @attr edge_technology
% @type categorical
% @canonical false
% @original_name edge_technology
% @values magne_traction_7=Magne_Traction_7_serrations unk_edge_technology=Unknown
% @importance 0.93

0.95::acc(s1, edge_technology).
0.90::acc(s16, edge_technology).

0.95::true_val(edge_technology, magne_traction_7); 0.05::true_val(edge_technology, unk_edge_technology).

measured(s1, edge_technology, magne_traction_7).
measured(s16, edge_technology, magne_traction_7).

all_consistent(edge_technology) :-
    consistent(s1, edge_technology),
    consistent(s16, edge_technology).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, magne_traction_7)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values unreal_all_conditions=Unreal_edge_hold_all_conditions unk_edge_hold=Unknown
% @importance 0.93

0.90::acc(s16, edge_hold).
0.93::acc(s1, edge_hold).

0.95::true_val(edge_hold, unreal_all_conditions); 0.05::true_val(edge_hold, unk_edge_hold).

measured(s16, edge_hold, unreal_all_conditions).
measured(s1, edge_hold, unreal_all_conditions).

all_consistent(edge_hold) :-
    consistent(s1, edge_hold),
    consistent(s16, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, unreal_all_conditions)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr mounting_pattern
% @type categorical
% @canonical false
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 0.98

0.93::acc(s1, mounting_pattern).
0.82::acc(s2, mounting_pattern).

0.95::true_val(mounting_pattern, inserts_2x4); 0.05::true_val(mounting_pattern, unk_mounting_pattern).

measured(s1, mounting_pattern, inserts_2x4).
measured(s2, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :-
    consistent(s1, mounting_pattern),
    (indep(s2), consistent(s2, mounting_pattern) ; \+indep(s2)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values extruded_co_ex=Extruded_Knife_Cut_Co_Ex sintered_co_ex=Sintered_Knife_Cut_Co_Ex
% @importance 0.82

0.80::acc(s22, base_type).
0.78::acc(s_merchant, base_type).
0.82::acc(s2, base_type).
0.75::acc(s21, base_type).
0.60::acc(s14, base_type).
0.88::acc(s1, base_type).

0.45::true_val(base_type, extruded_co_ex); 0.55::true_val(base_type, sintered_co_ex).

measured(s22, base_type, extruded_co_ex).
measured(s_merchant, base_type, extruded_co_ex).
measured(s2, base_type, sintered_co_ex).
measured(s21, base_type, sintered_co_ex).
measured(s14, base_type, sintered_co_ex).
measured(s1, base_type, extruded_co_ex).

all_consistent(base_type) :-
    consistent(s1, base_type),
    (indep(s_merchant), consistent(s_merchant, base_type) ; \+indep(s_merchant)),
    (indep(s22), consistent(s22, base_type) ; \+indep(s_merchant)),
    (indep(s2), consistent(s2, base_type) ; \+indep(s2)),
    (indep(s21), consistent(s21, base_type) ; \+indep(s21)),
    (indep(s14), consistent(s14, base_type) ; \+indep(s14)).

evidence(all_consistent(base_type)).
query(true_val(base_type, extruded_co_ex)).
query(true_val(base_type, sintered_co_ex)).

% @attr available_colors
% @type categorical
% @canonical false
% @original_name available_colors
% @values random_base=Random_base_colours_vary unk_available_colors=Unknown
% @importance 0.8

0.80::acc(s22, available_colors).

0.69::true_val(available_colors, random_base); 0.31::true_val(available_colors, unk_available_colors).

measured(s22, available_colors, random_base).

all_consistent(available_colors) :-
    (indep(s_merchant), consistent(s22, available_colors) ; \+indep(s_merchant)).

evidence(all_consistent(available_colors)).
query(true_val(available_colors, random_base)).
query(true_val(available_colors, unk_available_colors)).

% @attr available_sizes
% @type categorical
% @canonical false
% @original_name available_sizes
% @values eight_sizes=147_150_153_156_156W_159_159W_162W unk_available_sizes=Unknown
% @importance 1.0

0.95::acc(s1, available_sizes).

0.95::true_val(available_sizes, eight_sizes); 0.05::true_val(available_sizes, unk_available_sizes).

measured(s1, available_sizes, eight_sizes).

all_consistent(available_sizes) :- consistent(s1, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, eight_sizes)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 0.85

0.88::acc(s_merchant, width_options).

0.88::true_val(width_options, standard_and_wide); 0.12::true_val(width_options, unk_width_options).

measured(s_merchant, width_options, standard_and_wide).

all_consistent(width_options) :-
    (indep(s_merchant), consistent(s_merchant, width_options) ; \+indep(s_merchant)).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

% @attr contact_length_size_147
% @type numeric
% @canonical false
% @original_name contact_length_size
% @unit cm
% @values v109=109.0 unk_cl_147=Unknown
% @importance 1.0

0.93::acc(s1, contact_length_size_147).

0.92::true_val(contact_length_size_147, v109); 0.08::true_val(contact_length_size_147, unk_cl_147).

measured(s1, contact_length_size_147, v109).

all_consistent(contact_length_size_147) :- consistent(s1, contact_length_size_147).

evidence(all_consistent(contact_length_size_147)).
query(true_val(contact_length_size_147, v109)).
query(true_val(contact_length_size_147, unk_cl_147)).

% @attr sidecut_radius_size_147
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v8_0=8.0 unk_sr_147=Unknown
% @importance 1.0

0.93::acc(s1, sidecut_radius_size_147).

0.92::true_val(sidecut_radius_size_147, v8_0); 0.08::true_val(sidecut_radius_size_147, unk_sr_147).

measured(s1, sidecut_radius_size_147, v8_0).

all_consistent(sidecut_radius_size_147) :- consistent(s1, sidecut_radius_size_147).

evidence(all_consistent(sidecut_radius_size_147)).
query(true_val(sidecut_radius_size_147, v8_0)).
query(true_val(sidecut_radius_size_147, unk_sr_147)).

% @attr tip_tail_width_size_147
% @type numeric
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v28_1=28.1 unk_ttw_147=Unknown
% @importance 1.0

0.93::acc(s1, tip_tail_width_size_147).

0.92::true_val(tip_tail_width_size_147, v28_1); 0.08::true_val(tip_tail_width_size_147, unk_ttw_147).

measured(s1, tip_tail_width_size_147, v28_1).

all_consistent(tip_tail_width_size_147) :- consistent(s1, tip_tail_width_size_147).

evidence(all_consistent(tip_tail_width_size_147)).
query(true_val(tip_tail_width_size_147, v28_1)).
query(true_val(tip_tail_width_size_147, unk_ttw_147)).

% @attr waist_width_147
% @type numeric
% @canonical false
% @original_name Waist width (147cm)
% @unit cm
% @values v24_2=24.2 unk_ww_147=Unknown
% @importance 1.0

0.93::acc(s1, waist_width_147).

0.92::true_val(waist_width_147, v24_2); 0.08::true_val(waist_width_147, unk_ww_147).

measured(s1, waist_width_147, v24_2).

all_consistent(waist_width_147) :- consistent(s1, waist_width_147).

evidence(all_consistent(waist_width_147)).
query(true_val(waist_width_147, v24_2)).
query(true_val(waist_width_147, unk_ww_147)).

% @attr stance_width_range_size_147
% @type categorical
% @canonical false
% @original_name stance_width_range_size
% @values range_17_22=17in_to_22in unk_swr_147=Unknown
% @importance 1.0

0.93::acc(s1, stance_width_range_size_147).

0.92::true_val(stance_width_range_size_147, range_17_22); 0.08::true_val(stance_width_range_size_147, unk_swr_147).

measured(s1, stance_width_range_size_147, range_17_22).

all_consistent(stance_width_range_size_147) :- consistent(s1, stance_width_range_size_147).

evidence(all_consistent(stance_width_range_size_147)).
query(true_val(stance_width_range_size_147, range_17_22)).
query(true_val(stance_width_range_size_147, unk_swr_147)).

% @attr recommended_weight_range_size_147
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values wt_80_plus_lbs=80_plus_lbs_35_plus_kg unk_rwr_147=Unknown
% @importance 1.0

0.93::acc(s1, recommended_weight_range_size_147).

0.92::true_val(recommended_weight_range_size_147, wt_80_plus_lbs); 0.08::true_val(recommended_weight_range_size_147, unk_rwr_147).

measured(s1, recommended_weight_range_size_147, wt_80_plus_lbs).

all_consistent(recommended_weight_range_size_147) :- consistent(s1, recommended_weight_range_size_147).

evidence(all_consistent(recommended_weight_range_size_147)).
query(true_val(recommended_weight_range_size_147, wt_80_plus_lbs)).
query(true_val(recommended_weight_range_size_147, unk_rwr_147)).

% @attr contact_length_size_150
% @type numeric
% @canonical false
% @original_name contact_length_size
% @unit cm
% @values v111=111.0 unk_cl_150=Unknown
% @importance 0.93

0.93::acc(s1, contact_length_size_150).
0.88::acc(s_merchant, contact_length_size_150).

0.95::true_val(contact_length_size_150, v111); 0.05::true_val(contact_length_size_150, unk_cl_150).

measured(s1, contact_length_size_150, v111).
measured(s_merchant, contact_length_size_150, v111).

all_consistent(contact_length_size_150) :-
    consistent(s1, contact_length_size_150),
    (indep(s_merchant), consistent(s_merchant, contact_length_size_150) ; \+indep(s_merchant)).

evidence(all_consistent(contact_length_size_150)).
query(true_val(contact_length_size_150, v111)).
query(true_val(contact_length_size_150, unk_cl_150)).

% @attr sidecut_radius_size_150
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v8_1=8.1 unk_sr_150=Unknown
% @importance 0.93

0.93::acc(s1, sidecut_radius_size_150).
0.88::acc(s_merchant, sidecut_radius_size_150).

0.95::true_val(sidecut_radius_size_150, v8_1); 0.05::true_val(sidecut_radius_size_150, unk_sr_150).

measured(s1, sidecut_radius_size_150, v8_1).
measured(s_merchant, sidecut_radius_size_150, v8_1).

all_consistent(sidecut_radius_size_150) :-
    consistent(s1, sidecut_radius_size_150),
    (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_150) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_radius_size_150)).
query(true_val(sidecut_radius_size_150, v8_1)).
query(true_val(sidecut_radius_size_150, unk_sr_150)).

% @attr tip_tail_width_size_150
% @type numeric
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v28_2=28.2 unk_ttw_150=Unknown
% @importance 0.93

0.93::acc(s1, tip_tail_width_size_150).
0.88::acc(s_merchant, tip_tail_width_size_150).

0.95::true_val(tip_tail_width_size_150, v28_2); 0.05::true_val(tip_tail_width_size_150, unk_ttw_150).

measured(s1, tip_tail_width_size_150, v28_2).
measured(s_merchant, tip_tail_width_size_150, v28_2).

all_consistent(tip_tail_width_size_150) :-
    consistent(s1, tip_tail_width_size_150),
    (indep(s_merchant), consistent(s_merchant, tip_tail_width_size_150) ; \+indep(s_merchant)).

evidence(all_consistent(tip_tail_width_size_150)).
query(true_val(tip_tail_width_size_150, v28_2)).
query(true_val(tip_tail_width_size_150, unk_ttw_150)).

% @attr waist_width_150
% @type numeric
% @canonical false
% @original_name Waist width (150cm)
% @unit cm
% @values v24_5=24.5 unk_ww_150=Unknown
% @importance 0.93

0.93::acc(s1, waist_width_150).
0.88::acc(s_merchant, waist_width_150).

0.95::true_val(waist_width_150, v24_5); 0.05::true_val(waist_width_150, unk_ww_150).

measured(s1, waist_width_150, v24_5).
measured(s_merchant, waist_width_150, v24_5).

all_consistent(waist_width_150) :-
    consistent(s1, waist_width_150),
    (indep(s_merchant), consistent(s_merchant, waist_width_150) ; \+indep(s_merchant)).

evidence(all_consistent(waist_width_150)).
query(true_val(waist_width_150, v24_5)).
query(true_val(waist_width_150, unk_ww_150)).

% @attr stance_width_range_size
% @type categorical
% @canonical true
% @original_name stance_width_range_size
% @values range_19_24=19_24in_to_24in unk_stance_width_range_size=Unknown
% @importance 0.93

0.93::acc(s1, stance_width_range_size).
0.88::acc(s_merchant, stance_width_range_size).

0.95::true_val(stance_width_range_size, range_19_24); 0.05::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s1, stance_width_range_size, range_19_24).
measured(s_merchant, stance_width_range_size, range_19_24).

all_consistent(stance_width_range_size) :-
    consistent(s1, stance_width_range_size),
    (indep(s_merchant), consistent(s_merchant, stance_width_range_size) ; \+indep(s_merchant)).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, range_19_24)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr recommended_weight_range_size_150
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values wt_90_plus_lbs=90_plus_lbs_40_plus_kg unk_rwr_150=Unknown
% @importance 0.93

0.93::acc(s1, recommended_weight_range_size_150).
0.88::acc(s_merchant, recommended_weight_range_size_150).

0.95::true_val(recommended_weight_range_size_150, wt_90_plus_lbs); 0.05::true_val(recommended_weight_range_size_150, unk_rwr_150).

measured(s1, recommended_weight_range_size_150, wt_90_plus_lbs).
measured(s_merchant, recommended_weight_range_size_150, wt_90_plus_lbs).

all_consistent(recommended_weight_range_size_150) :-
    consistent(s1, recommended_weight_range_size_150),
    (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size_150) ; \+indep(s_merchant)).

evidence(all_consistent(recommended_weight_range_size_150)).
query(true_val(recommended_weight_range_size_150, wt_90_plus_lbs)).
query(true_val(recommended_weight_range_size_150, unk_rwr_150)).

% @attr contact_length_size_153
% @type numeric
% @canonical false
% @original_name contact_length_size
% @unit cm
% @values v114_5=114.5 unk_cl_153=Unknown
% @importance 0.93

0.93::acc(s1, contact_length_size_153).
0.88::acc(s_merchant, contact_length_size_153).

0.95::true_val(contact_length_size_153, v114_5); 0.05::true_val(contact_length_size_153, unk_cl_153).

measured(s1, contact_length_size_153, v114_5).
measured(s_merchant, contact_length_size_153, v114_5).

all_consistent(contact_length_size_153) :-
    consistent(s1, contact_length_size_153),
    (indep(s_merchant), consistent(s_merchant, contact_length_size_153) ; \+indep(s_merchant)).

evidence(all_consistent(contact_length_size_153)).
query(true_val(contact_length_size_153, v114_5)).
query(true_val(contact_length_size_153, unk_cl_153)).

% @attr sidecut_radius_size_153
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v8_2_153=8.2 unk_sr_153=Unknown
% @importance 0.93

0.93::acc(s1, sidecut_radius_size_153).
0.88::acc(s_merchant, sidecut_radius_size_153).

0.95::true_val(sidecut_radius_size_153, v8_2_153); 0.05::true_val(sidecut_radius_size_153, unk_sr_153).

measured(s1, sidecut_radius_size_153, v8_2_153).
measured(s_merchant, sidecut_radius_size_153, v8_2_153).

all_consistent(sidecut_radius_size_153) :-
    consistent(s1, sidecut_radius_size_153),
    (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_153) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_radius_size_153)).
query(true_val(sidecut_radius_size_153, v8_2_153)).
query(true_val(sidecut_radius_size_153, unk_sr_153)).

% @attr tip_tail_width_size_153
% @type numeric
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v28_9=28.9 unk_ttw_153=Unknown
% @importance 0.93

0.93::acc(s1, tip_tail_width_size_153).
0.88::acc(s_merchant, tip_tail_width_size_153).

0.95::true_val(tip_tail_width_size_153, v28_9); 0.05::true_val(tip_tail_width_size_153, unk_ttw_153).

measured(s1, tip_tail_width_size_153, v28_9).
measured(s_merchant, tip_tail_width_size_153, v28_9).

all_consistent(tip_tail_width_size_153) :-
    consistent(s1, tip_tail_width_size_153),
    (indep(s_merchant), consistent(s_merchant, tip_tail_width_size_153) ; \+indep(s_merchant)).

evidence(all_consistent(tip_tail_width_size_153)).
query(true_val(tip_tail_width_size_153, v28_9)).
query(true_val(tip_tail_width_size_153, unk_ttw_153)).

% @attr waist_width_153
% @type numeric
% @canonical false
% @original_name Waist width (153cm)
% @unit cm
% @values v24_8=24.8 unk_ww_153=Unknown
% @importance 0.93

0.93::acc(s1, waist_width_153).
0.88::acc(s_merchant, waist_width_153).

0.95::true_val(waist_width_153, v24_8); 0.05::true_val(waist_width_153, unk_ww_153).

measured(s1, waist_width_153, v24_8).
measured(s_merchant, waist_width_153, v24_8).

all_consistent(waist_width_153) :-
    consistent(s1, waist_width_153),
    (indep(s_merchant), consistent(s_merchant, waist_width_153) ; \+indep(s_merchant)).

evidence(all_consistent(waist_width_153)).
query(true_val(waist_width_153, v24_8)).
query(true_val(waist_width_153, unk_ww_153)).

% @attr recommended_weight_range_size_153
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values wt_100_plus_lbs=100_plus_lbs_45_plus_kg unk_rwr_153=Unknown
% @importance 0.93

0.93::acc(s1, recommended_weight_range_size_153).
0.88::acc(s_merchant, recommended_weight_range_size_153).

0.95::true_val(recommended_weight_range_size_153, wt_100_plus_lbs); 0.05::true_val(recommended_weight_range_size_153, unk_rwr_153).

measured(s1, recommended_weight_range_size_153, wt_100_plus_lbs).
measured(s_merchant, recommended_weight_range_size_153, wt_100_plus_lbs).

all_consistent(recommended_weight_range_size_153) :-
    consistent(s1, recommended_weight_range_size_153),
    (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size_153) ; \+indep(s_merchant)).

evidence(all_consistent(recommended_weight_range_size_153)).
query(true_val(recommended_weight_range_size_153, wt_100_plus_lbs)).
query(true_val(recommended_weight_range_size_153, unk_rwr_153)).

% @attr contact_length_size
% @type numeric
% @canonical true
% @original_name contact_length_size
% @unit cm
% @values v119=119.0 unk_contact_length_size=Unknown
% @importance 0.93

0.93::acc(s1, contact_length_size).
0.88::acc(s_merchant, contact_length_size).

0.95::true_val(contact_length_size, v119); 0.05::true_val(contact_length_size, unk_contact_length_size).

measured(s1, contact_length_size, v119).
measured(s_merchant, contact_length_size, v119).

all_consistent(contact_length_size) :-
    consistent(s1, contact_length_size),
    (indep(s_merchant), consistent(s_merchant, contact_length_size) ; \+indep(s_merchant)).

evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v119)).
query(true_val(contact_length_size, unk_contact_length_size)).

% @attr sidecut_radius_size
% @type numeric
% @canonical true
% @original_name sidecut_radius_size
% @unit m
% @values v8_2=8.2 unk_sidecut_radius_size=Unknown
% @importance 0.93

0.93::acc(s1, sidecut_radius_size).
0.88::acc(s_merchant, sidecut_radius_size).

0.95::true_val(sidecut_radius_size, v8_2); 0.05::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s1, sidecut_radius_size, v8_2).
measured(s_merchant, sidecut_radius_size, v8_2).

all_consistent(sidecut_radius_size) :-
    consistent(s1, sidecut_radius_size),
    (indep(s_merchant), consistent(s_merchant, sidecut_radius_size) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v8_2)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr tip_tail_width_size
% @type numeric
% @canonical true
% @original_name tip_tail_width_size
% @unit cm
% @values v29_8=29.8 unk_tip_tail_width_size=Unknown
% @importance 0.93

0.93::acc(s1, tip_tail_width_size).
0.88::acc(s_merchant, tip_tail_width_size).

0.95::true_val(tip_tail_width_size, v29_8); 0.05::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s1, tip_tail_width_size, v29_8).
measured(s_merchant, tip_tail_width_size, v29_8).

all_consistent(tip_tail_width_size) :-
    consistent(s1, tip_tail_width_size),
    (indep(s_merchant), consistent(s_merchant, tip_tail_width_size) ; \+indep(s_merchant)).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v29_8)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr waist_width_156
% @type numeric
% @canonical false
% @original_name Waist width (156cm)
% @unit cm
% @values v25_4=25.4 unk_ww_156=Unknown
% @importance 0.93

0.93::acc(s1, waist_width_156).
0.88::acc(s_merchant, waist_width_156).

0.95::true_val(waist_width_156, v25_4); 0.05::true_val(waist_width_156, unk_ww_156).

measured(s1, waist_width_156, v25_4).
measured(s_merchant, waist_width_156, v25_4).

all_consistent(waist_width_156) :-
    consistent(s1, waist_width_156),
    (indep(s_merchant), consistent(s_merchant, waist_width_156) ; \+indep(s_merchant)).

evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v25_4)).
query(true_val(waist_width_156, unk_ww_156)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size
% @values wt_110_plus_lbs=110_plus_lbs_50_plus_kg unk_recommended_weight_range_size=Unknown
% @importance 0.93

0.93::acc(s1, recommended_weight_range_size).
0.88::acc(s_merchant, recommended_weight_range_size).

0.95::true_val(recommended_weight_range_size, wt_110_plus_lbs); 0.05::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s1, recommended_weight_range_size, wt_110_plus_lbs).
measured(s_merchant, recommended_weight_range_size, wt_110_plus_lbs).

all_consistent(recommended_weight_range_size) :-
    consistent(s1, recommended_weight_range_size),
    (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size) ; \+indep(s_merchant)).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, wt_110_plus_lbs)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr contact_length_size_156w
% @type numeric
% @canonical false
% @original_name contact_length_size
% @unit cm
% @values v119_156w=119.0 unk_cl_156w=Unknown
% @importance 0.93

0.93::acc(s1, contact_length_size_156w).
0.88::acc(s_merchant, contact_length_size_156w).

0.95::true_val(contact_length_size_156w, v119_156w); 0.05::true_val(contact_length_size_156w, unk_cl_156w).

measured(s1, contact_length_size_156w, v119_156w).
measured(s_merchant, contact_length_size_156w, v119_156w).

all_consistent(contact_length_size_156w) :-
    consistent(s1, contact_length_size_156w),
    (indep(s_merchant), consistent(s_merchant, contact_length_size_156w) ; \+indep(s_merchant)).

evidence(all_consistent(contact_length_size_156w)).
query(true_val(contact_length_size_156w, v119_156w)).
query(true_val(contact_length_size_156w, unk_cl_156w)).

% @attr sidecut_radius_size_156w
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v8_3_156w=8.3 unk_sr_156w=Unknown
% @importance 0.93

0.93::acc(s1, sidecut_radius_size_156w).
0.88::acc(s_merchant, sidecut_radius_size_156w).

0.95::true_val(sidecut_radius_size_156w, v8_3_156w); 0.05::true_val(sidecut_radius_size_156w, unk_sr_156w).

measured(s1, sidecut_radius_size_156w, v8_3_156w).
measured(s_merchant, sidecut_radius_size_156w, v8_3_156w).

all_consistent(sidecut_radius_size_156w) :-
    consistent(s1, sidecut_radius_size_156w),
    (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_156w) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_radius_size_156w)).
query(true_val(sidecut_radius_size_156w, v8_3_156w)).
query(true_val(sidecut_radius_size_156w, unk_sr_156w)).

% @attr tip_tail_width_size_156w
% @type numeric
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v31_1=31.1 unk_ttw_156w=Unknown
% @importance 0.93

0.93::acc(s1, tip_tail_width_size_156w).
0.88::acc(s_merchant, tip_tail_width_size_156w).

0.95::true_val(tip_tail_width_size_156w, v31_1); 0.05::true_val(tip_tail_width_size_156w, unk_ttw_156w).

measured(s1, tip_tail_width_size_156w, v31_1).
measured(s_merchant, tip_tail_width_size_156w, v31_1).

all_consistent(tip_tail_width_size_156w) :-
    consistent(s1, tip_tail_width_size_156w),
    (indep(s_merchant), consistent(s_merchant, tip_tail_width_size_156w) ; \+indep(s_merchant)).

evidence(all_consistent(tip_tail_width_size_156w)).
query(true_val(tip_tail_width_size_156w, v31_1)).
query(true_val(tip_tail_width_size_156w, unk_ttw_156w)).

% @attr waist_width_156w
% @type numeric
% @canonical false
% @original_name Waist width (156cm Wide)
% @unit cm
% @values v26_7_156w=26.7 unk_ww_156w=Unknown
% @importance 0.93

0.93::acc(s1, waist_width_156w).
0.88::acc(s_merchant, waist_width_156w).

0.95::true_val(waist_width_156w, v26_7_156w); 0.05::true_val(waist_width_156w, unk_ww_156w).

measured(s1, waist_width_156w, v26_7_156w).
measured(s_merchant, waist_width_156w, v26_7_156w).

all_consistent(waist_width_156w) :-
    consistent(s1, waist_width_156w),
    (indep(s_merchant), consistent(s_merchant, waist_width_156w) ; \+indep(s_merchant)).

evidence(all_consistent(waist_width_156w)).
query(true_val(waist_width_156w, v26_7_156w)).
query(true_val(waist_width_156w, unk_ww_156w)).

% @attr recommended_weight_range_size_156w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values wt_110_plus_lbs_156w=110_plus_lbs_50_plus_kg unk_rwr_156w=Unknown
% @importance 0.93

0.93::acc(s1, recommended_weight_range_size_156w).
0.88::acc(s_merchant, recommended_weight_range_size_156w).

0.95::true_val(recommended_weight_range_size_156w, wt_110_plus_lbs_156w); 0.05::true_val(recommended_weight_range_size_156w, unk_rwr_156w).

measured(s1, recommended_weight_range_size_156w, wt_110_plus_lbs_156w).
measured(s_merchant, recommended_weight_range_size_156w, wt_110_plus_lbs_156w).

all_consistent(recommended_weight_range_size_156w) :-
    consistent(s1, recommended_weight_range_size_156w),
    (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size_156w) ; \+indep(s_merchant)).

evidence(all_consistent(recommended_weight_range_size_156w)).
query(true_val(recommended_weight_range_size_156w, wt_110_plus_lbs_156w)).
query(true_val(recommended_weight_range_size_156w, unk_rwr_156w)).

% @attr contact_length_size_159
% @type numeric
% @canonical false
% @original_name contact_length_size
% @unit cm
% @values v121_159=121.0 unk_cl_159=Unknown
% @importance 0.93

0.93::acc(s1, contact_length_size_159).
0.88::acc(s_merchant, contact_length_size_159).

0.95::true_val(contact_length_size_159, v121_159); 0.05::true_val(contact_length_size_159, unk_cl_159).

measured(s1, contact_length_size_159, v121_159).
measured(s_merchant, contact_length_size_159, v121_159).

all_consistent(contact_length_size_159) :-
    consistent(s1, contact_length_size_159),
    (indep(s_merchant), consistent(s_merchant, contact_length_size_159) ; \+indep(s_merchant)).

evidence(all_consistent(contact_length_size_159)).
query(true_val(contact_length_size_159, v121_159)).
query(true_val(contact_length_size_159, unk_cl_159)).

% @attr sidecut_radius_size_159
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v8_3_159=8.3 unk_sr_159=Unknown
% @importance 0.93

0.93::acc(s1, sidecut_radius_size_159).
0.88::acc(s_merchant, sidecut_radius_size_159).

0.95::true_val(sidecut_radius_size_159, v8_3_159); 0.05::true_val(sidecut_radius_size_159, unk_sr_159).

measured(s1, sidecut_radius_size_159, v8_3_159).
measured(s_merchant, sidecut_radius_size_159, v8_3_159).

all_consistent(sidecut_radius_size_159) :-
    consistent(s1, sidecut_radius_size_159),
    (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_159) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_radius_size_159)).
query(true_val(sidecut_radius_size_159, v8_3_159)).
query(true_val(sidecut_radius_size_159, unk_sr_159)).

% @attr tip_tail_width_size_159
% @type numeric
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v30_2=30.2 unk_ttw_159=Unknown
% @importance 0.93

0.93::acc(s1, tip_tail_width_size_159).
0.88::acc(s_merchant, tip_tail_width_size_159).

0.95::true_val(tip_tail_width_size_159, v30_2); 0.05::true_val(tip_tail_width_size_159, unk_ttw_159).

measured(s1, tip_tail_width_size_159, v30_2).
measured(s_merchant, tip_tail_width_size_159, v30_2).

all_consistent(tip_tail_width_size_159) :-
    consistent(s1, tip_tail_width_size_159),
    (indep(s_merchant), consistent(s_merchant, tip_tail_width_size_159) ; \+indep(s_merchant)).

evidence(all_consistent(tip_tail_width_size_159)).
query(true_val(tip_tail_width_size_159, v30_2)).
query(true_val(tip_tail_width_size_159, unk_ttw_159)).

% @attr waist_width_159
% @type numeric
% @canonical false
% @original_name Waist width (159cm)
% @unit cm
% @values v25_5=25.5 unk_ww_159=Unknown
% @importance 0.93

0.93::acc(s1, waist_width_159).
0.88::acc(s_merchant, waist_width_159).

0.95::true_val(waist_width_159, v25_5); 0.05::true_val(waist_width_159, unk_ww_159).

measured(s1, waist_width_159, v25_5).
measured(s_merchant, waist_width_159, v25_5).

all_consistent(waist_width_159) :-
    consistent(s1, waist_width_159),
    (indep(s_merchant), consistent(s_merchant, waist_width_159) ; \+indep(s_merchant)).

evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v25_5)).
query(true_val(waist_width_159, unk_ww_159)).

% @attr recommended_weight_range_size_159
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values wt_130_plus_lbs=130_plus_lbs_60_plus_kg unk_rwr_159=Unknown
% @importance 0.93

0.93::acc(s1, recommended_weight_range_size_159).
0.88::acc(s_merchant, recommended_weight_range_size_159).

0.95::true_val(recommended_weight_range_size_159, wt_130_plus_lbs); 0.05::true_val(recommended_weight_range_size_159, unk_rwr_159).

measured(s1, recommended_weight_range_size_159, wt_130_plus_lbs).
measured(s_merchant, recommended_weight_range_size_159, wt_130_plus_lbs).

all_consistent(recommended_weight_range_size_159) :-
    consistent(s1, recommended_weight_range_size_159),
    (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size_159) ; \+indep(s_merchant)).

evidence(all_consistent(recommended_weight_range_size_159)).
query(true_val(recommended_weight_range_size_159, wt_130_plus_lbs)).
query(true_val(recommended_weight_range_size_159, unk_rwr_159)).

% @attr contact_length_size_159w
% @type numeric
% @canonical false
% @original_name contact_length_size
% @unit cm
% @values v121_159w=121.0 unk_cl_159w=Unknown
% @importance 0.93

0.93::acc(s1, contact_length_size_159w).
0.88::acc(s_merchant, contact_length_size_159w).

0.95::true_val(contact_length_size_159w, v121_159w); 0.05::true_val(contact_length_size_159w, unk_cl_159w).

measured(s1, contact_length_size_159w, v121_159w).
measured(s_merchant, contact_length_size_159w, v121_159w).

all_consistent(contact_length_size_159w) :-
    consistent(s1, contact_length_size_159w),
    (indep(s_merchant), consistent(s_merchant, contact_length_size_159w) ; \+indep(s_merchant)).

evidence(all_consistent(contact_length_size_159w)).
query(true_val(contact_length_size_159w, v121_159w)).
query(true_val(contact_length_size_159w, unk_cl_159w)).

% @attr sidecut_radius_size_159w
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v8_3_159w=8.3 unk_sr_159w=Unknown
% @importance 0.93

0.93::acc(s1, sidecut_radius_size_159w).
0.88::acc(s_merchant, sidecut_radius_size_159w).

0.95::true_val(sidecut_radius_size_159w, v8_3_159w); 0.05::true_val(sidecut_radius_size_159w, unk_sr_159w).

measured(s1, sidecut_radius_size_159w, v8_3_159w).
measured(s_merchant, sidecut_radius_size_159w, v8_3_159w).

all_consistent(sidecut_radius_size_159w) :-
    consistent(s1, sidecut_radius_size_159w),
    (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_159w) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_radius_size_159w)).
query(true_val(sidecut_radius_size_159w, v8_3_159w)).
query(true_val(sidecut_radius_size_159w, unk_sr_159w)).

% @attr tip_tail_width_size_159w
% @type numeric
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v31_2=31.2 unk_ttw_159w=Unknown
% @importance 0.93

0.93::acc(s1, tip_tail_width_size_159w).
0.88::acc(s_merchant, tip_tail_width_size_159w).

0.95::true_val(tip_tail_width_size_159w, v31_2); 0.05::true_val(tip_tail_width_size_159w, unk_ttw_159w).

measured(s1, tip_tail_width_size_159w, v31_2).
measured(s_merchant, tip_tail_width_size_159w, v31_2).

all_consistent(tip_tail_width_size_159w) :-
    consistent(s1, tip_tail_width_size_159w),
    (indep(s_merchant), consistent(s_merchant, tip_tail_width_size_159w) ; \+indep(s_merchant)).

evidence(all_consistent(tip_tail_width_size_159w)).
query(true_val(tip_tail_width_size_159w, v31_2)).
query(true_val(tip_tail_width_size_159w, unk_ttw_159w)).

% @attr waist_width_159w
% @type numeric
% @canonical false
% @original_name Waist width (159cm Wide)
% @unit cm
% @values v26_7_159w=26.7 unk_ww_159w=Unknown
% @importance 0.93

0.93::acc(s1, waist_width_159w).
0.88::acc(s_merchant, waist_width_159w).

0.95::true_val(waist_width_159w, v26_7_159w); 0.05::true_val(waist_width_159w, unk_ww_159w).

measured(s1, waist_width_159w, v26_7_159w).
measured(s_merchant, waist_width_159w, v26_7_159w).

all_consistent(waist_width_159w) :-
    consistent(s1, waist_width_159w),
    (indep(s_merchant), consistent(s_merchant, waist_width_159w) ; \+indep(s_merchant)).

evidence(all_consistent(waist_width_159w)).
query(true_val(waist_width_159w, v26_7_159w)).
query(true_val(waist_width_159w, unk_ww_159w)).

% @attr recommended_weight_range_size_159w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values wt_130_plus_lbs_159w=130_plus_lbs_60_plus_kg unk_rwr_159w=Unknown
% @importance 0.93

0.93::acc(s1, recommended_weight_range_size_159w).
0.88::acc(s_merchant, recommended_weight_range_size_159w).

0.95::true_val(recommended_weight_range_size_159w, wt_130_plus_lbs_159w); 0.05::true_val(recommended_weight_range_size_159w, unk_rwr_159w).

measured(s1, recommended_weight_range_size_159w, wt_130_plus_lbs_159w).
measured(s_merchant, recommended_weight_range_size_159w, wt_130_plus_lbs_159w).

all_consistent(recommended_weight_range_size_159w) :-
    consistent(s1, recommended_weight_range_size_159w),
    (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size_159w) ; \+indep(s_merchant)).

evidence(all_consistent(recommended_weight_range_size_159w)).
query(true_val(recommended_weight_range_size_159w, wt_130_plus_lbs_159w)).
query(true_val(recommended_weight_range_size_159w, unk_rwr_159w)).

% @attr contact_length_size_162w
% @type numeric
% @canonical false
% @original_name contact_length_size
% @unit cm
% @values v122=122.0 unk_cl_162w=Unknown
% @importance 0.93

0.93::acc(s1, contact_length_size_162w).
0.88::acc(s_merchant, contact_length_size_162w).

0.95::true_val(contact_length_size_162w, v122); 0.05::true_val(contact_length_size_162w, unk_cl_162w).

measured(s1, contact_length_size_162w, v122).
measured(s_merchant, contact_length_size_162w, v122).

all_consistent(contact_length_size_162w) :-
    consistent(s1, contact_length_size_162w),
    (indep(s_merchant), consistent(s_merchant, contact_length_size_162w) ; \+indep(s_merchant)).

evidence(all_consistent(contact_length_size_162w)).
query(true_val(contact_length_size_162w, v122)).
query(true_val(contact_length_size_162w, unk_cl_162w)).

% @attr sidecut_radius_size_162w
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v8_4=8.4 unk_sr_162w=Unknown
% @importance 0.93

0.93::acc(s1, sidecut_radius_size_162w).
0.88::acc(s_merchant, sidecut_radius_size_162w).

0.95::true_val(sidecut_radius_size_162w, v8_4); 0.05::true_val(sidecut_radius_size_162w, unk_sr_162w).

measured(s1, sidecut_radius_size_162w, v8_4).
measured(s_merchant, sidecut_radius_size_162w, v8_4).

all_consistent(sidecut_radius_size_162w) :-
    consistent(s1, sidecut_radius_size_162w),
    (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_162w) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_radius_size_162w)).
query(true_val(sidecut_radius_size_162w, v8_4)).
query(true_val(sidecut_radius_size_162w, unk_sr_162w)).

% @attr tip_tail_width_size_162w
% @type numeric
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v31_4=31.4 unk_ttw_162w=Unknown
% @importance 0.93

0.93::acc(s1, tip_tail_width_size_162w).
0.88::acc(s_merchant, tip_tail_width_size_162w).

0.95::true_val(tip_tail_width_size_162w, v31_4); 0.05::true_val(tip_tail_width_size_162w, unk_ttw_162w).

measured(s1, tip_tail_width_size_162w, v31_4).
measured(s_merchant, tip_tail_width_size_162w, v31_4).

all_consistent(tip_tail_width_size_162w) :-
    consistent(s1, tip_tail_width_size_162w),
    (indep(s_merchant), consistent(s_merchant, tip_tail_width_size_162w) ; \+indep(s_merchant)).

evidence(all_consistent(tip_tail_width_size_162w)).
query(true_val(tip_tail_width_size_162w, v31_4)).
query(true_val(tip_tail_width_size_162w, unk_ttw_162w)).

% @attr waist_width_162w
% @type numeric
% @canonical false
% @original_name Waist width (162cm Wide)
% @unit cm
% @values v26_7_162w=26.7 unk_ww_162w=Unknown
% @importance 0.93

0.93::acc(s1, waist_width_162w).
0.88::acc(s_merchant, waist_width_162w).

0.95::true_val(waist_width_162w, v26_7_162w); 0.05::true_val(waist_width_162w, unk_ww_162w).

measured(s1, waist_width_162w, v26_7_162w).
measured(s_merchant, waist_width_162w, v26_7_162w).

all_consistent(waist_width_162w) :-
    consistent(s1, waist_width_162w),
    (indep(s_merchant), consistent(s_merchant, waist_width_162w) ; \+indep(s_merchant)).

evidence(all_consistent(waist_width_162w)).
query(true_val(waist_width_162w, v26_7_162w)).
query(true_val(waist_width_162w, unk_ww_162w)).

% @attr recommended_weight_range_size_162w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values wt_140_plus_lbs=140_plus_lbs_65_plus_kg unk_rwr_162w=Unknown
% @importance 0.93

0.93::acc(s1, recommended_weight_range_size_162w).
0.88::acc(s_merchant, recommended_weight_range_size_162w).

0.95::true_val(recommended_weight_range_size_162w, wt_140_plus_lbs); 0.05::true_val(recommended_weight_range_size_162w, unk_rwr_162w).

measured(s1, recommended_weight_range_size_162w, wt_140_plus_lbs).
measured(s_merchant, recommended_weight_range_size_162w, wt_140_plus_lbs).

all_consistent(recommended_weight_range_size_162w) :-
    consistent(s1, recommended_weight_range_size_162w),
    (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size_162w) ; \+indep(s_merchant)).

evidence(all_consistent(recommended_weight_range_size_162w)).
query(true_val(recommended_weight_range_size_162w, wt_140_plus_lbs)).
query(true_val(recommended_weight_range_size_162w, unk_rwr_162w)).

% @attr rider_level
% @type categorical
% @canonical false
% @original_name rider_level
% @values beginner_intermediate=Beginner_Intermediate unk_rider_level=Unknown
% @importance 0.88

0.85::acc(s2, rider_level).
0.85::acc(s_merchant, rider_level).

0.95::true_val(rider_level, beginner_intermediate); 0.05::true_val(rider_level, unk_rider_level).

measured(s2, rider_level, beginner_intermediate).
measured(s_merchant, rider_level, beginner_intermediate).

all_consistent(rider_level) :-
    (indep(s2), consistent(s2, rider_level) ; \+indep(s2)),
    (indep(s_merchant), consistent(s_merchant, rider_level) ; \+indep(s_merchant)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, beginner_intermediate)).
query(true_val(rider_level, unk_rider_level)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values beginner_to_intermediate=Beginner_to_intermediate_versatile_easy unk_skill_level_recommendation=Unknown
% @importance 0.83

0.78::acc(s4, skill_level_recommendation).
0.78::acc(s22, skill_level_recommendation).

0.95::true_val(skill_level_recommendation, beginner_to_intermediate); 0.05::true_val(skill_level_recommendation, unk_skill_level_recommendation).

measured(s4, skill_level_recommendation, beginner_to_intermediate).
measured(s22, skill_level_recommendation, beginner_to_intermediate).

all_consistent(skill_level_recommendation) :-
    (indep(s4), consistent(s4, skill_level_recommendation) ; \+indep(s4)),
    (indep(s_merchant), consistent(s22, skill_level_recommendation) ; \+indep(s_merchant)).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, beginner_to_intermediate)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values freestyle_all_mountain_ts=Freestyle_All_Mountain unk_terrain_suitability=Unknown
% @importance 1.0

0.95::acc(s1, terrain_suitability).

0.95::true_val(terrain_suitability, freestyle_all_mountain_ts); 0.05::true_val(terrain_suitability, unk_terrain_suitability).

measured(s1, terrain_suitability, freestyle_all_mountain_ts).

all_consistent(terrain_suitability) :- consistent(s1, terrain_suitability).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, freestyle_all_mountain_ts)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr terrain_suitability_progression
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values progression_park_am=Progression_park_all_mountain_side_hits unk_ts_prog=Unknown
% @importance 0.85

0.78::acc(s4, terrain_suitability_progression).

0.69::true_val(terrain_suitability_progression, progression_park_am); 0.31::true_val(terrain_suitability_progression, unk_ts_prog).

measured(s4, terrain_suitability_progression, progression_park_am).

all_consistent(terrain_suitability_progression) :-
    (indep(s4), consistent(s4, terrain_suitability_progression) ; \+indep(s4)).

evidence(all_consistent(terrain_suitability_progression)).
query(true_val(terrain_suitability_progression, progression_park_am)).
query(true_val(terrain_suitability_progression, unk_ts_prog)).

% @attr riding_style
% @type categorical
% @canonical false
% @original_name riding_style
% @values freestyle_progression_park=Freestyle_progression_park unk_riding_style=Unknown
% @importance 0.85

0.85::acc(s_merchant, riding_style).

0.85::true_val(riding_style, freestyle_progression_park); 0.15::true_val(riding_style, unk_riding_style).

measured(s_merchant, riding_style, freestyle_progression_park).

all_consistent(riding_style) :-
    (indep(s_merchant), consistent(s_merchant, riding_style) ; \+indep(s_merchant)).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, freestyle_progression_park)).
query(true_val(riding_style, unk_riding_style)).

% @attr terrain_suitability_resort
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values resort_groomers_park_powder=Resort_groomers_park_light_powder unk_ts_resort=Unknown
% @importance 0.9

0.80::acc(s24, terrain_suitability_resort).

0.68::true_val(terrain_suitability_resort, resort_groomers_park_powder); 0.32::true_val(terrain_suitability_resort, unk_ts_resort).

measured(s24, terrain_suitability_resort, resort_groomers_park_powder).

all_consistent(terrain_suitability_resort) :-
    (indep(s24), consistent(s24, terrain_suitability_resort) ; \+indep(s24)).

evidence(all_consistent(terrain_suitability_resort)).
query(true_val(terrain_suitability_resort, resort_groomers_park_powder)).
query(true_val(terrain_suitability_resort, unk_ts_resort)).

% @attr camber_description_btx
% @type categorical
% @canonical false
% @original_name camber_description
% @values btx_catch_free=BTX_catch_free_easy_learning unk_camber_desc_btx=Unknown
% @importance 1.0

0.93::acc(s1, camber_description_btx).

0.92::true_val(camber_description_btx, btx_catch_free); 0.08::true_val(camber_description_btx, unk_camber_desc_btx).

measured(s1, camber_description_btx, btx_catch_free).

all_consistent(camber_description_btx) :- consistent(s1, camber_description_btx).

evidence(all_consistent(camber_description_btx)).
query(true_val(camber_description_btx, btx_catch_free)).
query(true_val(camber_description_btx, unk_camber_desc_btx)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values floats_jibs=Floats_in_powder_jibs_everything unk_positive_aspect=Unknown
% @importance 0.85

0.88::acc(s16, positive_aspect).

0.81::true_val(positive_aspect, floats_jibs); 0.19::true_val(positive_aspect, unk_positive_aspect).

measured(s16, positive_aspect, floats_jibs).

all_consistent(positive_aspect) :- consistent(s16, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, floats_jibs)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values perfect_beginner_fun=Perfect_board_for_beginners_fun_forgiving unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.9

0.82::acc(s24, reviewer_opinion_the_good_ride).

0.68::true_val(reviewer_opinion_the_good_ride, perfect_beginner_fun); 0.32::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s24, reviewer_opinion_the_good_ride, perfect_beginner_fun).

all_consistent(reviewer_opinion_the_good_ride) :-
    (indep(s24), consistent(s24, reviewer_opinion_the_good_ride) ; \+indep(s24)).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, perfect_beginner_fun)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr reviewer_opinion_the_good_ride_flex
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values playful_skateboard=Soft_mid_flex_playful_skateboard_like unk_rotgr_flex=Unknown
% @importance 0.9

0.82::acc(s24, reviewer_opinion_the_good_ride_flex).

0.68::true_val(reviewer_opinion_the_good_ride_flex, playful_skateboard); 0.32::true_val(reviewer_opinion_the_good_ride_flex, unk_rotgr_flex).

measured(s24, reviewer_opinion_the_good_ride_flex, playful_skateboard).

all_consistent(reviewer_opinion_the_good_ride_flex) :-
    (indep(s24), consistent(s24, reviewer_opinion_the_good_ride_flex) ; \+indep(s24)).

evidence(all_consistent(reviewer_opinion_the_good_ride_flex)).
query(true_val(reviewer_opinion_the_good_ride_flex, playful_skateboard)).
query(true_val(reviewer_opinion_the_good_ride_flex, unk_rotgr_flex)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values more_edge_grip=More_edge_grip_stability_via_Magne_Traction unk_comparable_board_cross_brand=Unknown
% @importance 0.85

0.78::acc(s21, comparable_board_cross_brand).

0.60::true_val(comparable_board_cross_brand, more_edge_grip); 0.40::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s21, comparable_board_cross_brand, more_edge_grip).

all_consistent(comparable_board_cross_brand) :-
    (indep(s21), consistent(s21, comparable_board_cross_brand) ; \+indep(s21)).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, more_edge_grip)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_forgiveness
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values more_forgiving_livelier=More_forgiving_than_camber_livelier_than_rocker unk_cbcb_forgive=Unknown
% @importance 0.85

0.78::acc(s21, comparable_board_cross_brand_forgiveness).

0.60::true_val(comparable_board_cross_brand_forgiveness, more_forgiving_livelier); 0.40::true_val(comparable_board_cross_brand_forgiveness, unk_cbcb_forgive).

measured(s21, comparable_board_cross_brand_forgiveness, more_forgiving_livelier).

all_consistent(comparable_board_cross_brand_forgiveness) :-
    (indep(s21), consistent(s21, comparable_board_cross_brand_forgiveness) ; \+indep(s21)).

evidence(all_consistent(comparable_board_cross_brand_forgiveness)).
query(true_val(comparable_board_cross_brand_forgiveness, more_forgiving_livelier)).
query(true_val(comparable_board_cross_brand_forgiveness, unk_cbcb_forgive)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values nervous_at_speed=Nerve_wracking_at_high_speed unk_negative_aspect=Unknown
% @importance 0.75

0.65::acc(s14, negative_aspect).

0.44::true_val(negative_aspect, nervous_at_speed); 0.56::true_val(negative_aspect, unk_negative_aspect).

measured(s14, negative_aspect, nervous_at_speed).

all_consistent(negative_aspect) :-
    (indep(s14), consistent(s14, negative_aspect) ; \+indep(s14)).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, nervous_at_speed)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr review_video_angry_snowboarder
% @type categorical
% @canonical false
% @original_name Review video (Angry Snowboarder)
% @values published_nov_2025=YouTube_review_Nov_15_2025 unk_rv_as=Unknown
% @importance 0.8

0.80::acc(s26, review_video_angry_snowboarder).

0.64::true_val(review_video_angry_snowboarder, published_nov_2025); 0.36::true_val(review_video_angry_snowboarder, unk_rv_as).

measured(s26, review_video_angry_snowboarder, published_nov_2025).

all_consistent(review_video_angry_snowboarder) :-
    (indep(s26), consistent(s26, review_video_angry_snowboarder) ; \+indep(s26)).

evidence(all_consistent(review_video_angry_snowboarder)).
query(true_val(review_video_angry_snowboarder, published_nov_2025)).
query(true_val(review_video_angry_snowboarder, unk_rv_as)).

% @attr review_video_board_archive
% @type categorical
% @canonical false
% @original_name Review video (Board Archive)
% @values published_dec_2025=YouTube_review_Dec_21_2025 unk_rv_ba=Unknown
% @importance 0.7

0.72::acc(s27, review_video_board_archive).

0.53::true_val(review_video_board_archive, published_dec_2025); 0.47::true_val(review_video_board_archive, unk_rv_ba).

measured(s27, review_video_board_archive, published_dec_2025).

all_consistent(review_video_board_archive) :-
    (indep(s27), consistent(s27, review_video_board_archive) ; \+indep(s27)).

evidence(all_consistent(review_video_board_archive)).
query(true_val(review_video_board_archive, published_dec_2025)).
query(true_val(review_video_board_archive, unk_rv_ba)).

% @attr manufacturer_promo_video
% @type categorical
% @canonical false
% @original_name Manufacturer promo video
% @values published_sep_2025=GNU_official_video_Sep_3_2025 unk_mpv=Unknown
% @importance 0.3

0.82::acc(s28, manufacturer_promo_video).

0.68::true_val(manufacturer_promo_video, published_sep_2025); 0.32::true_val(manufacturer_promo_video, unk_mpv).

measured(s28, manufacturer_promo_video, published_sep_2025).

all_consistent(manufacturer_promo_video) :- consistent(s28, manufacturer_promo_video).

evidence(all_consistent(manufacturer_promo_video)).
query(true_val(manufacturer_promo_video, published_sep_2025)).
query(true_val(manufacturer_promo_video, unk_mpv)).

% @attr binding_compatibility_recommended
% @type categorical
% @canonical false
% @original_name binding_compatibility
% @values axtion_str_edb=Bent_Metal_Axtion_Union_STR_Salomon_EDB unk_bc_rec=Unknown
% @importance 0.8

0.78::acc(s26, binding_compatibility_recommended).

0.64::true_val(binding_compatibility_recommended, axtion_str_edb); 0.36::true_val(binding_compatibility_recommended, unk_bc_rec).

measured(s26, binding_compatibility_recommended, axtion_str_edb).

all_consistent(binding_compatibility_recommended) :-
    (indep(s26), consistent(s26, binding_compatibility_recommended) ; \+indep(s26)).

evidence(all_consistent(binding_compatibility_recommended)).
query(true_val(binding_compatibility_recommended, axtion_str_edb)).
query(true_val(binding_compatibility_recommended, unk_bc_rec)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v429_99=429.99 unk_price_usd_msrp=Unknown
% @importance 1.0

0.95::acc(s1, price_usd_msrp).

0.95::true_val(price_usd_msrp, v429_99); 0.05::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s1, price_usd_msrp, v429_99).

all_consistent(price_usd_msrp) :- consistent(s1, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v429_99)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_eur_blue_tomato
% @type numeric
% @canonical true
% @original_name price_eur_blue_tomato
% @unit EUR
% @values v429_99_eur=429.99 unk_price_eur_blue_tomato=Unknown
% @importance 0.85

0.95::acc(s29, price_eur_blue_tomato).

0.90::true_val(price_eur_blue_tomato, v429_99_eur); 0.10::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).

measured(s29, price_eur_blue_tomato, v429_99_eur).

all_consistent(price_eur_blue_tomato) :- consistent(s29, price_eur_blue_tomato).

evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v429_99_eur)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

% @attr price_aud_merchant_rrp
% @type numeric
% @canonical false
% @original_name price_aud_merchant
% @unit AUD
% @values v699_99=699.99 unk_price_aud_rrp=Unknown
% @importance 0.85

0.90::acc(s_merchant, price_aud_merchant_rrp).

0.90::true_val(price_aud_merchant_rrp, v699_99); 0.10::true_val(price_aud_merchant_rrp, unk_price_aud_rrp).

measured(s_merchant, price_aud_merchant_rrp, v699_99).

all_consistent(price_aud_merchant_rrp) :-
    (indep(s_merchant), consistent(s_merchant, price_aud_merchant_rrp) ; \+indep(s_merchant)).

evidence(all_consistent(price_aud_merchant_rrp)).
query(true_val(price_aud_merchant_rrp, v699_99)).
query(true_val(price_aud_merchant_rrp, unk_price_aud_rrp)).

% @attr price_aud_merchant
% @type numeric
% @canonical true
% @original_name price_aud_merchant
% @unit AUD
% @values v559_99=559.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.92::acc(s_merchant, price_aud_merchant).

0.92::true_val(price_aud_merchant, v559_99); 0.08::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s_merchant, price_aud_merchant, v559_99).

all_consistent(price_aud_merchant) :-
    (indep(s_merchant), consistent(s_merchant, price_aud_merchant) ; \+indep(s_merchant)).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v559_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_cad_prfo
% @type numeric
% @canonical false
% @original_name price_cad_prfo
% @unit CAD
% @values v529_99=529.99 unk_price_cad_prfo=Unknown
% @importance 0.8

0.80::acc(s30, price_cad_prfo).

0.68::true_val(price_cad_prfo, v529_99); 0.32::true_val(price_cad_prfo, unk_price_cad_prfo).

measured(s30, price_cad_prfo, v529_99).

all_consistent(price_cad_prfo) :-
    (indep(s30), consistent(s30, price_cad_prfo) ; \+indep(s30)).

evidence(all_consistent(price_cad_prfo)).
query(true_val(price_cad_prfo, v529_99)).
query(true_val(price_cad_prfo, unk_price_cad_prfo)).

% @attr price_usd_msrp_sale
% @type numeric
% @canonical false
% @original_name price_usd_msrp
% @unit USD
% @values v343_99=343.99 unk_price_usd_msrp_sale=Unknown
% @importance 1.0

0.80::acc(s1, price_usd_msrp_sale).

0.78::true_val(price_usd_msrp_sale, v343_99); 0.22::true_val(price_usd_msrp_sale, unk_price_usd_msrp_sale).

measured(s1, price_usd_msrp_sale, v343_99).

all_consistent(price_usd_msrp_sale) :- consistent(s1, price_usd_msrp_sale).

evidence(all_consistent(price_usd_msrp_sale)).
query(true_val(price_usd_msrp_sale, v343_99)).
query(true_val(price_usd_msrp_sale, unk_price_usd_msrp_sale)).

% @attr price_usd_evo
% @type numeric
% @canonical true
% @original_name price_usd_evo
% @unit USD
% @values v300_99=300.99 unk_price_usd_evo=Unknown
% @importance 0.9

0.88::acc(s2, price_usd_evo).

0.77::true_val(price_usd_evo, v300_99); 0.23::true_val(price_usd_evo, unk_price_usd_evo).

measured(s2, price_usd_evo, v300_99).

all_consistent(price_usd_evo) :-
    (indep(s2), consistent(s2, price_usd_evo) ; \+indep(s2)).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v300_99)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_evo_blem
% @type numeric
% @canonical false
% @original_name price_usd_evo
% @unit USD
% @values v257_99=257.99 unk_price_evo_blem=Unknown
% @importance 0.9

0.85::acc(s2, price_usd_evo_blem).

0.77::true_val(price_usd_evo_blem, v257_99); 0.23::true_val(price_usd_evo_blem, unk_price_evo_blem).

measured(s2, price_usd_evo_blem, v257_99).

all_consistent(price_usd_evo_blem) :-
    (indep(s2), consistent(s2, price_usd_evo_blem) ; \+indep(s2)).

evidence(all_consistent(price_usd_evo_blem)).
query(true_val(price_usd_evo_blem, v257_99)).
query(true_val(price_usd_evo_blem, unk_price_evo_blem)).

% @attr price_usd_buzzs
% @type numeric
% @canonical false
% @original_name Buzz's Boards sale price
% @unit USD
% @values v329_99=329.99 unk_price_usd_buzzs=Unknown
% @importance 0.85

0.82::acc(s32, price_usd_buzzs).

0.63::true_val(price_usd_buzzs, v329_99); 0.37::true_val(price_usd_buzzs, unk_price_usd_buzzs).

measured(s32, price_usd_buzzs, v329_99).

all_consistent(price_usd_buzzs) :-
    (indep(s32), consistent(s32, price_usd_buzzs) ; \+indep(s32)).

evidence(all_consistent(price_usd_buzzs)).
query(true_val(price_usd_buzzs, v329_99)).
query(true_val(price_usd_buzzs, unk_price_usd_buzzs)).

% @attr price_usd_source
% @type numeric
% @canonical false
% @original_name The Source Snowboard price
% @unit USD
% @values v387_00=387.0 unk_price_usd_source=Unknown
% @importance 0.8

0.80::acc(s15, price_usd_source).

0.60::true_val(price_usd_source, v387_00); 0.40::true_val(price_usd_source, unk_price_usd_source).

measured(s15, price_usd_source, v387_00).

all_consistent(price_usd_source) :-
    (indep(s15), consistent(s15, price_usd_source) ; \+indep(s15)).

evidence(all_consistent(price_usd_source)).
query(true_val(price_usd_source, v387_00)).
query(true_val(price_usd_source, unk_price_usd_source)).

% @attr price_usd_proctor
% @type numeric
% @canonical false
% @original_name Proctor Ski price
% @unit USD
% @values v429_99_proctor=429.99 unk_price_usd_proctor=Unknown
% @importance 0.7

0.75::acc(s34, price_usd_proctor).

0.59::true_val(price_usd_proctor, v429_99_proctor); 0.41::true_val(price_usd_proctor, unk_price_usd_proctor).

measured(s34, price_usd_proctor, v429_99_proctor).

all_consistent(price_usd_proctor) :-
    (indep(s34), consistent(s34, price_usd_proctor) ; \+indep(s34)).

evidence(all_consistent(price_usd_proctor)).
query(true_val(price_usd_proctor, v429_99_proctor)).
query(true_val(price_usd_proctor, unk_price_usd_proctor)).

% @attr price_eur_blue_tomato_sale
% @type numeric
% @canonical false
% @original_name price_eur_blue_tomato
% @unit EUR
% @values v321_90=321.9 unk_price_eur_bt_sale=Unknown
% @importance 0.7

0.75::acc(s35, price_eur_blue_tomato_sale).

0.60::true_val(price_eur_blue_tomato_sale, v321_90); 0.40::true_val(price_eur_blue_tomato_sale, unk_price_eur_bt_sale).

measured(s35, price_eur_blue_tomato_sale, v321_90).

all_consistent(price_eur_blue_tomato_sale) :-
    (indep(s35), consistent(s35, price_eur_blue_tomato_sale) ; \+indep(s35)).

evidence(all_consistent(price_eur_blue_tomato_sale)).
query(true_val(price_eur_blue_tomato_sale, v321_90)).
query(true_val(price_eur_blue_tomato_sale, unk_price_eur_bt_sale)).

% @attr availability_status_gnu
% @type categorical
% @canonical false
% @original_name availability_status
% @values coming_soon=Coming_Soon_notify_available unk_as_gnu=Unknown
% @importance 1.0

0.90::acc(s1, availability_status_gnu).

0.92::true_val(availability_status_gnu, coming_soon); 0.08::true_val(availability_status_gnu, unk_as_gnu).

measured(s1, availability_status_gnu, coming_soon).

all_consistent(availability_status_gnu) :- consistent(s1, availability_status_gnu).

evidence(all_consistent(availability_status_gnu)).
query(true_val(availability_status_gnu, coming_soon)).
query(true_val(availability_status_gnu, unk_as_gnu)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values in_stock=In_stock_evo unk_availability_status=Unknown
% @importance 0.9

0.88::acc(s2, availability_status).

0.77::true_val(availability_status, in_stock); 0.23::true_val(availability_status, unk_availability_status).

measured(s2, availability_status, in_stock).

all_consistent(availability_status) :-
    (indep(s2), consistent(s2, availability_status) ; \+indep(s2)).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, in_stock)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_buzzs
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_147_backordered=Available_147_backordered unk_as_buzzs=Unknown
% @importance 0.85

0.80::acc(s32, availability_status_buzzs).

0.63::true_val(availability_status_buzzs, available_147_backordered); 0.37::true_val(availability_status_buzzs, unk_as_buzzs).

measured(s32, availability_status_buzzs, available_147_backordered).

all_consistent(availability_status_buzzs) :-
    (indep(s32), consistent(s32, availability_status_buzzs) ; \+indep(s32)).

evidence(all_consistent(availability_status_buzzs)).
query(true_val(availability_status_buzzs, available_147_backordered)).
query(true_val(availability_status_buzzs, unk_as_buzzs)).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_blauer=Available unk_as_blauer=Unknown
% @importance 0.85

0.78::acc(s4, availability_status_blauer).

0.69::true_val(availability_status_blauer, available_blauer); 0.31::true_val(availability_status_blauer, unk_as_blauer).

measured(s4, availability_status_blauer, available_blauer).

all_consistent(availability_status_blauer) :-
    (indep(s4), consistent(s4, availability_status_blauer) ; \+indep(s4)).

evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, available_blauer)).
query(true_val(availability_status_blauer, unk_as_blauer)).

% @attr availability_status_ridge
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_ridge=Available unk_as_ridge=Unknown
% @importance 0.5

0.72::acc(s36, availability_status_ridge).

0.56::true_val(availability_status_ridge, available_ridge); 0.44::true_val(availability_status_ridge, unk_as_ridge).

measured(s36, availability_status_ridge, available_ridge).

all_consistent(availability_status_ridge) :-
    (indep(s36), consistent(s36, availability_status_ridge) ; \+indep(s36)).

evidence(all_consistent(availability_status_ridge)).
query(true_val(availability_status_ridge, available_ridge)).
query(true_val(availability_status_ridge, unk_as_ridge)).

% @attr availability_status_source
% @type categorical
% @canonical false
% @original_name availability_status
% @values mostly_sold_out_1_left=Mostly_sold_out_1_left unk_as_source=Unknown
% @importance 0.8

0.78::acc(s15, availability_status_source).

0.60::true_val(availability_status_source, mostly_sold_out_1_left); 0.40::true_val(availability_status_source, unk_as_source).

measured(s15, availability_status_source, mostly_sold_out_1_left).

all_consistent(availability_status_source) :-
    (indep(s15), consistent(s15, availability_status_source) ; \+indep(s15)).

evidence(all_consistent(availability_status_source)).
query(true_val(availability_status_source, mostly_sold_out_1_left)).
query(true_val(availability_status_source, unk_as_source)).

% @attr availability_status_proctor
% @type categorical
% @canonical false
% @original_name availability_status
% @values low_stock_3=Low_stock_3_units unk_as_proctor=Unknown
% @importance 0.7

0.75::acc(s34, availability_status_proctor).

0.59::true_val(availability_status_proctor, low_stock_3); 0.41::true_val(availability_status_proctor, unk_as_proctor).

measured(s34, availability_status_proctor, low_stock_3).

all_consistent(availability_status_proctor) :-
    (indep(s34), consistent(s34, availability_status_proctor) ; \+indep(s34)).

evidence(all_consistent(availability_status_proctor)).
query(true_val(availability_status_proctor, low_stock_3)).
query(true_val(availability_status_proctor, unk_as_proctor)).

% @attr availability_status_skiis
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_standard_ca=Available_standard_widths_Canada unk_as_skiis=Unknown
% @importance 0.8

0.78::acc(s30, availability_status_skiis).

0.68::true_val(availability_status_skiis, available_standard_ca); 0.32::true_val(availability_status_skiis, unk_as_skiis).

measured(s30, availability_status_skiis, available_standard_ca).

all_consistent(availability_status_skiis) :-
    (indep(s30), consistent(s30, availability_status_skiis) ; \+indep(s30)).

evidence(all_consistent(availability_status_skiis)).
query(true_val(availability_status_skiis, available_standard_ca)).
query(true_val(availability_status_skiis, unk_as_skiis)).

% @attr availability_status_skipro
% @type categorical
% @canonical false
% @original_name availability_status
% @values mostly_sold_out_sp=Mostly_sold_out unk_as_skipro=Unknown
% @importance 0.85

0.75::acc(s21, availability_status_skipro).

0.60::true_val(availability_status_skipro, mostly_sold_out_sp); 0.40::true_val(availability_status_skipro, unk_as_skipro).

measured(s21, availability_status_skipro, mostly_sold_out_sp).

all_consistent(availability_status_skipro) :-
    (indep(s21), consistent(s21, availability_status_skipro) ; \+indep(s21)).

evidence(all_consistent(availability_status_skipro)).
query(true_val(availability_status_skipro, mostly_sold_out_sp)).
query(true_val(availability_status_skipro, unk_as_skipro)).

% @attr availability_status_melbourne
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_melb=Available unk_as_melb=Unknown
% @importance 0.8

0.82::acc(s22, availability_status_melbourne).

0.69::true_val(availability_status_melbourne, available_melb); 0.31::true_val(availability_status_melbourne, unk_as_melb).

measured(s22, availability_status_melbourne, available_melb).

all_consistent(availability_status_melbourne) :-
    (indep(s_merchant), consistent(s22, availability_status_melbourne) ; \+indep(s_merchant)).

evidence(all_consistent(availability_status_melbourne)).
query(true_val(availability_status_melbourne, available_melb)).
query(true_val(availability_status_melbourne, unk_as_melb)).

% @attr availability_status_levelnine
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_l9=Available unk_as_l9=Unknown
% @importance 0.5

0.72::acc(s37, availability_status_levelnine).

0.56::true_val(availability_status_levelnine, available_l9); 0.44::true_val(availability_status_levelnine, unk_as_l9).

measured(s37, availability_status_levelnine, available_l9).

all_consistent(availability_status_levelnine) :-
    (indep(s37), consistent(s37, availability_status_levelnine) ; \+indep(s37)).

evidence(all_consistent(availability_status_levelnine)).
query(true_val(availability_status_levelnine, available_l9)).
query(true_val(availability_status_levelnine, unk_as_l9)).

% @attr availability_status_eriks
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_eriks=Available unk_as_eriks=Unknown
% @importance 0.4

0.70::acc(s38, availability_status_eriks).

0.53::true_val(availability_status_eriks, available_eriks); 0.47::true_val(availability_status_eriks, unk_as_eriks).

measured(s38, availability_status_eriks, available_eriks).

all_consistent(availability_status_eriks) :-
    (indep(s38), consistent(s38, availability_status_eriks) ; \+indep(s38)).

evidence(all_consistent(availability_status_eriks)).
query(true_val(availability_status_eriks, available_eriks)).
query(true_val(availability_status_eriks, unk_as_eriks)).

% @attr availability_status_snowboards_com
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_sbcom=Available unk_as_sbcom=Unknown
% @importance 0.6

0.78::acc(s13, availability_status_snowboards_com).

0.69::true_val(availability_status_snowboards_com, available_sbcom); 0.31::true_val(availability_status_snowboards_com, unk_as_sbcom).

measured(s13, availability_status_snowboards_com, available_sbcom).

all_consistent(availability_status_snowboards_com) :-
    (indep(s13), consistent(s13, availability_status_snowboards_com) ; \+indep(s13)).

evidence(all_consistent(availability_status_snowboards_com)).
query(true_val(availability_status_snowboards_com, available_sbcom)).
query(true_val(availability_status_snowboards_com, unk_as_sbcom)).

% @attr availability_status_glisshop
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_gliss=Available_Europe unk_as_gliss=Unknown
% @importance 0.7

0.75::acc(s35, availability_status_glisshop).

0.60::true_val(availability_status_glisshop, available_gliss); 0.40::true_val(availability_status_glisshop, unk_as_gliss).

measured(s35, availability_status_glisshop, available_gliss).

all_consistent(availability_status_glisshop) :-
    (indep(s35), consistent(s35, availability_status_glisshop) ; \+indep(s35)).

evidence(all_consistent(availability_status_glisshop)).
query(true_val(availability_status_glisshop, available_gliss)).
query(true_val(availability_status_glisshop, unk_as_gliss)).

% @attr availability_status_gnu_eu
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_gnu_eu=Available unk_as_gnu_eu=Unknown
% @importance 0.85

0.90::acc(s29, availability_status_gnu_eu).

0.90::true_val(availability_status_gnu_eu, available_gnu_eu); 0.10::true_val(availability_status_gnu_eu, unk_as_gnu_eu).

measured(s29, availability_status_gnu_eu, available_gnu_eu).

all_consistent(availability_status_gnu_eu) :- consistent(s29, availability_status_gnu_eu).

evidence(all_consistent(availability_status_gnu_eu)).
query(true_val(availability_status_gnu_eu, available_gnu_eu)).
query(true_val(availability_status_gnu_eu, unk_as_gnu_eu)).

% @attr gnu_shipping_policy
% @type categorical
% @canonical false
% @original_name GNU shipping policy
% @values free_over_75=Free_shipping_over_75_excl_AK_HI unk_gnu_shipping=Unknown
% @importance 1.0

0.88::acc(s1, gnu_shipping_policy).

0.92::true_val(gnu_shipping_policy, free_over_75); 0.08::true_val(gnu_shipping_policy, unk_gnu_shipping).

measured(s1, gnu_shipping_policy, free_over_75).

all_consistent(gnu_shipping_policy) :- consistent(s1, gnu_shipping_policy).

evidence(all_consistent(gnu_shipping_policy)).
query(true_val(gnu_shipping_policy, free_over_75)).
query(true_val(gnu_shipping_policy, unk_gnu_shipping)).

% @attr warranty_period_years
% @type numeric
% @canonical false
% @original_name warranty_period_years
% @unit years
% @values v1=1.0 unk_warranty_period=Unknown
% @importance 0.85

0.95::acc(s39, warranty_period_years).

0.90::true_val(warranty_period_years, v1); 0.10::true_val(warranty_period_years, unk_warranty_period).

measured(s39, warranty_period_years, v1).

all_consistent(warranty_period_years) :- consistent(s39, warranty_period_years).

evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v1)).
query(true_val(warranty_period_years, unk_warranty_period)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values defects_materials_workmanship=Defects_in_materials_and_workmanship unk_warranty=Unknown
% @importance 0.85

0.95::acc(s39, warranty).

0.90::true_val(warranty, defects_materials_workmanship); 0.10::true_val(warranty, unk_warranty).

measured(s39, warranty, defects_materials_workmanship).

all_consistent(warranty) :- consistent(s39, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, defects_materials_workmanship)).
query(true_val(warranty, unk_warranty)).

% @attr warranty_exclusions
% @type categorical
% @canonical false
% @original_name warranty
% @values no_wear_abuse_impact=No_normal_wear_abuse_impacts_cosmetic_modifications unk_warranty_excl=Unknown
% @importance 0.85

0.95::acc(s39, warranty_exclusions).

0.90::true_val(warranty_exclusions, no_wear_abuse_impact); 0.10::true_val(warranty_exclusions, unk_warranty_excl).

measured(s39, warranty_exclusions, no_wear_abuse_impact).

all_consistent(warranty_exclusions) :- consistent(s39, warranty_exclusions).

evidence(all_consistent(warranty_exclusions)).
query(true_val(warranty_exclusions, no_wear_abuse_impact)).
query(true_val(warranty_exclusions, unk_warranty_excl)).

% @attr warranty_authorized_dealer
% @type categorical
% @canonical false
% @original_name warranty
% @values authorized_dealer_required=Must_purchase_from_Mervin_Authorized_Dealer unk_warranty_ad=Unknown
% @importance 0.85

0.95::acc(s39, warranty_authorized_dealer).

0.90::true_val(warranty_authorized_dealer, authorized_dealer_required); 0.10::true_val(warranty_authorized_dealer, unk_warranty_ad).

measured(s39, warranty_authorized_dealer, authorized_dealer_required).

all_consistent(warranty_authorized_dealer) :- consistent(s39, warranty_authorized_dealer).

evidence(all_consistent(warranty_authorized_dealer)).
query(true_val(warranty_authorized_dealer, authorized_dealer_required)).
query(true_val(warranty_authorized_dealer, unk_warranty_ad)).

% @attr warranty_void_unauthorized
% @type categorical
% @canonical false
% @original_name warranty
% @values void_ebay_craigslist=Void_if_unauthorized_dealer_eBay_Craigslist unk_warranty_void=Unknown
% @importance 0.85

0.95::acc(s39, warranty_void_unauthorized).

0.90::true_val(warranty_void_unauthorized, void_ebay_craigslist); 0.10::true_val(warranty_void_unauthorized, unk_warranty_void).

measured(s39, warranty_void_unauthorized, void_ebay_craigslist).

all_consistent(warranty_void_unauthorized) :- consistent(s39, warranty_void_unauthorized).

evidence(all_consistent(warranty_void_unauthorized)).
query(true_val(warranty_void_unauthorized, void_ebay_craigslist)).
query(true_val(warranty_void_unauthorized, unk_warranty_void)).

% @attr sustainability_certification_renewable_energy
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values wind_water_power=WA_State_wind_and_water_power unk_sc_energy=Unknown
% @importance 0.5

0.80::acc(s8, sustainability_certification_renewable_energy).

0.72::true_val(sustainability_certification_renewable_energy, wind_water_power); 0.28::true_val(sustainability_certification_renewable_energy, unk_sc_energy).

measured(s8, sustainability_certification_renewable_energy, wind_water_power).

all_consistent(sustainability_certification_renewable_energy) :- consistent(s8, sustainability_certification_renewable_energy).

evidence(all_consistent(sustainability_certification_renewable_energy)).
query(true_val(sustainability_certification_renewable_energy, wind_water_power)).
query(true_val(sustainability_certification_renewable_energy, unk_sc_energy)).

% @attr resin
% @type categorical
% @canonical false
% @original_name resin
% @values low_voc_epoxy=Non_stinky_low_VOC_proprietary_epoxy unk_resin=Unknown
% @importance 0.45

0.85::acc(s8, resin).
0.88::acc(s5, resin).

0.95::true_val(resin, low_voc_epoxy); 0.05::true_val(resin, unk_resin).

measured(s8, resin, low_voc_epoxy).
measured(s5, resin, low_voc_epoxy).

all_consistent(resin) :-
    consistent(s8, resin),
    consistent(s5, resin).

evidence(all_consistent(resin)).
query(true_val(resin, low_voc_epoxy)).
query(true_val(resin, unk_resin)).

% @attr sustainability_certification_die_cut
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values die_cut_waste_reduction=Die_cut_base_to_reduce_waste unk_sc_diecut=Unknown
% @importance 0.8

0.78::acc(s22, sustainability_certification_die_cut).

0.69::true_val(sustainability_certification_die_cut, die_cut_waste_reduction); 0.31::true_val(sustainability_certification_die_cut, unk_sc_diecut).

measured(s22, sustainability_certification_die_cut, die_cut_waste_reduction).

all_consistent(sustainability_certification_die_cut) :-
    (indep(s_merchant), consistent(s22, sustainability_certification_die_cut) ; \+indep(s_merchant)).

evidence(all_consistent(sustainability_certification_die_cut)).
query(true_val(sustainability_certification_die_cut, die_cut_waste_reduction)).
query(true_val(sustainability_certification_die_cut, unk_sc_diecut)).

% @attr longest_running_us_factory
% @type categorical
% @canonical false
% @original_name Longest running US factory
% @values mervin_longest=Mervin_longest_running_last_major_US_factory unk_longest_factory=Unknown
% @importance 0.6

0.88::acc(s5, longest_running_us_factory).

0.86::true_val(longest_running_us_factory, mervin_longest); 0.14::true_val(longest_running_us_factory, unk_longest_factory).

measured(s5, longest_running_us_factory, mervin_longest).

all_consistent(longest_running_us_factory) :- consistent(s5, longest_running_us_factory).

evidence(all_consistent(longest_running_us_factory)).
query(true_val(longest_running_us_factory, mervin_longest)).
query(true_val(longest_running_us_factory, unk_longest_factory)).

% @attr comparable_board_cross_brand_rome_mechanic
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values rome_mechanic=Rome_Mechanic unk_cbcb_rome=Unknown
% @importance 0.8

0.80::acc(s26, comparable_board_cross_brand_rome_mechanic).

0.64::true_val(comparable_board_cross_brand_rome_mechanic, rome_mechanic); 0.36::true_val(comparable_board_cross_brand_rome_mechanic, unk_cbcb_rome).

measured(s26, comparable_board_cross_brand_rome_mechanic, rome_mechanic).

all_consistent(comparable_board_cross_brand_rome_mechanic) :-
    (indep(s26), consistent(s26, comparable_board_cross_brand_rome_mechanic) ; \+indep(s26)).

evidence(all_consistent(comparable_board_cross_brand_rome_mechanic)).
query(true_val(comparable_board_cross_brand_rome_mechanic, rome_mechanic)).
query(true_val(comparable_board_cross_brand_rome_mechanic, unk_cbcb_rome)).

% @attr comparable_board_cross_brand_rome_price
% @type numeric
% @canonical false
% @original_name comparable_board_cross_brand
% @unit USD
% @values v449_95=449.95 unk_cbcb_rome_price=Unknown
% @importance 0.8

0.85::acc(s41, comparable_board_cross_brand_rome_price).

0.81::true_val(comparable_board_cross_brand_rome_price, v449_95); 0.19::true_val(comparable_board_cross_brand_rome_price, unk_cbcb_rome_price).

measured(s41, comparable_board_cross_brand_rome_price, v449_95).

all_consistent(comparable_board_cross_brand_rome_price) :- consistent(s41, comparable_board_cross_brand_rome_price).

evidence(all_consistent(comparable_board_cross_brand_rome_price)).
query(true_val(comparable_board_cross_brand_rome_price, v449_95)).
query(true_val(comparable_board_cross_brand_rome_price, unk_cbcb_rome_price)).

% @attr comparable_board_cross_brand_rome_camber
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values contact_rocker=Contact_Rocker_flat_between_bindings unk_cbcb_rome_camber=Unknown
% @importance 0.8

0.78::acc(s42, comparable_board_cross_brand_rome_camber).

0.68::true_val(comparable_board_cross_brand_rome_camber, contact_rocker); 0.32::true_val(comparable_board_cross_brand_rome_camber, unk_cbcb_rome_camber).

measured(s42, comparable_board_cross_brand_rome_camber, contact_rocker).

all_consistent(comparable_board_cross_brand_rome_camber) :- consistent(s42, comparable_board_cross_brand_rome_camber).

evidence(all_consistent(comparable_board_cross_brand_rome_camber)).
query(true_val(comparable_board_cross_brand_rome_camber, contact_rocker)).
query(true_val(comparable_board_cross_brand_rome_camber, unk_cbcb_rome_camber)).

% @attr comparable_board_cross_brand_rome_shape
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values true_twin=True_Twin unk_cbcb_rome_shape=Unknown
% @importance 0.8

0.78::acc(s42, comparable_board_cross_brand_rome_shape).

0.68::true_val(comparable_board_cross_brand_rome_shape, true_twin); 0.32::true_val(comparable_board_cross_brand_rome_shape, unk_cbcb_rome_shape).

measured(s42, comparable_board_cross_brand_rome_shape, true_twin).

all_consistent(comparable_board_cross_brand_rome_shape) :- consistent(s42, comparable_board_cross_brand_rome_shape).

evidence(all_consistent(comparable_board_cross_brand_rome_shape)).
query(true_val(comparable_board_cross_brand_rome_shape, true_twin)).
query(true_val(comparable_board_cross_brand_rome_shape, unk_cbcb_rome_shape)).

% @attr comparable_board_cross_brand_rome_base
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values extruded_impact=Extruded_Impact_Base unk_cbcb_rome_base=Unknown
% @importance 0.8

0.78::acc(s42, comparable_board_cross_brand_rome_base).

0.68::true_val(comparable_board_cross_brand_rome_base, extruded_impact); 0.32::true_val(comparable_board_cross_brand_rome_base, unk_cbcb_rome_base).

measured(s42, comparable_board_cross_brand_rome_base, extruded_impact).

all_consistent(comparable_board_cross_brand_rome_base) :- consistent(s42, comparable_board_cross_brand_rome_base).

evidence(all_consistent(comparable_board_cross_brand_rome_base)).
query(true_val(comparable_board_cross_brand_rome_base, extruded_impact)).
query(true_val(comparable_board_cross_brand_rome_base, unk_cbcb_rome_base)).

% @attr comparable_board_cross_brand_rome_core
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values poplar_stomp_bamboo=Poplar_Stomp_Core_bamboo_hot_rods unk_cbcb_rome_core=Unknown
% @importance 0.8

0.78::acc(s42, comparable_board_cross_brand_rome_core).

0.68::true_val(comparable_board_cross_brand_rome_core, poplar_stomp_bamboo); 0.32::true_val(comparable_board_cross_brand_rome_core, unk_cbcb_rome_core).

measured(s42, comparable_board_cross_brand_rome_core, poplar_stomp_bamboo).

all_consistent(comparable_board_cross_brand_rome_core) :- consistent(s42, comparable_board_cross_brand_rome_core).

evidence(all_consistent(comparable_board_cross_brand_rome_core)).
query(true_val(comparable_board_cross_brand_rome_core, poplar_stomp_bamboo)).
query(true_val(comparable_board_cross_brand_rome_core, unk_cbcb_rome_core)).

% @attr comparable_board_cross_brand_rome_edge
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values standard_no_mt=Standard_no_Magne_Traction unk_cbcb_rome_edge=Unknown
% @importance 0.8

0.78::acc(s42, comparable_board_cross_brand_rome_edge).

0.68::true_val(comparable_board_cross_brand_rome_edge, standard_no_mt); 0.32::true_val(comparable_board_cross_brand_rome_edge, unk_cbcb_rome_edge).

measured(s42, comparable_board_cross_brand_rome_edge, standard_no_mt).

all_consistent(comparable_board_cross_brand_rome_edge) :- consistent(s42, comparable_board_cross_brand_rome_edge).

evidence(all_consistent(comparable_board_cross_brand_rome_edge)).
query(true_val(comparable_board_cross_brand_rome_edge, standard_no_mt)).
query(true_val(comparable_board_cross_brand_rome_edge, unk_cbcb_rome_edge)).

% @attr comparable_board_cross_brand_mt_advantage
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values mt_superior_ice=Magne_Traction_superior_edge_hold_ice_hardpack unk_cbcb_mt_adv=Unknown
% @importance 0.85

0.78::acc(s21, comparable_board_cross_brand_mt_advantage).

0.60::true_val(comparable_board_cross_brand_mt_advantage, mt_superior_ice); 0.40::true_val(comparable_board_cross_brand_mt_advantage, unk_cbcb_mt_adv).

measured(s21, comparable_board_cross_brand_mt_advantage, mt_superior_ice).

all_consistent(comparable_board_cross_brand_mt_advantage) :-
    (indep(s21), consistent(s21, comparable_board_cross_brand_mt_advantage) ; \+indep(s21)).

evidence(all_consistent(comparable_board_cross_brand_mt_advantage)).
query(true_val(comparable_board_cross_brand_mt_advantage, mt_superior_ice)).
query(true_val(comparable_board_cross_brand_mt_advantage, unk_cbcb_mt_adv)).

% @attr comparable_board_cross_brand_ride_manic
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values ride_manic=Ride_Manic unk_cbcb_ride=Unknown
% @importance 0.8

0.80::acc(s26, comparable_board_cross_brand_ride_manic).

0.64::true_val(comparable_board_cross_brand_ride_manic, ride_manic); 0.36::true_val(comparable_board_cross_brand_ride_manic, unk_cbcb_ride).

measured(s26, comparable_board_cross_brand_ride_manic, ride_manic).

all_consistent(comparable_board_cross_brand_ride_manic) :-
    (indep(s26), consistent(s26, comparable_board_cross_brand_ride_manic) ; \+indep(s26)).

evidence(all_consistent(comparable_board_cross_brand_ride_manic)).
query(true_val(comparable_board_cross_brand_ride_manic, ride_manic)).
query(true_val(comparable_board_cross_brand_ride_manic, unk_cbcb_ride)).

% @attr comparable_board_cross_brand_ride_base
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values extruded_stone_ground=Extruded_Stone_Ground_Race_Base unk_cbcb_ride_base=Unknown
% @importance 0.7

0.75::acc(s43, comparable_board_cross_brand_ride_base).

0.60::true_val(comparable_board_cross_brand_ride_base, extruded_stone_ground); 0.40::true_val(comparable_board_cross_brand_ride_base, unk_cbcb_ride_base).

measured(s43, comparable_board_cross_brand_ride_base, extruded_stone_ground).

all_consistent(comparable_board_cross_brand_ride_base) :- consistent(s43, comparable_board_cross_brand_ride_base).

evidence(all_consistent(comparable_board_cross_brand_ride_base)).
query(true_val(comparable_board_cross_brand_ride_base, extruded_stone_ground)).
query(true_val(comparable_board_cross_brand_ride_base, unk_cbcb_ride_base)).

% @attr comparable_board_cross_brand_ride_tech
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values slimewalls_carbon=Slimewalls_Linear_Carbon_Quadratic_Sidecut unk_cbcb_ride_tech=Unknown
% @importance 0.7

0.75::acc(s43, comparable_board_cross_brand_ride_tech).

0.60::true_val(comparable_board_cross_brand_ride_tech, slimewalls_carbon); 0.40::true_val(comparable_board_cross_brand_ride_tech, unk_cbcb_ride_tech).

measured(s43, comparable_board_cross_brand_ride_tech, slimewalls_carbon).

all_consistent(comparable_board_cross_brand_ride_tech) :- consistent(s43, comparable_board_cross_brand_ride_tech).

evidence(all_consistent(comparable_board_cross_brand_ride_tech)).
query(true_val(comparable_board_cross_brand_ride_tech, slimewalls_carbon)).
query(true_val(comparable_board_cross_brand_ride_tech, unk_cbcb_ride_tech)).

% @attr comparable_board_cross_brand_salomon_sight
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values salomon_sight=Salomon_Sight unk_cbcb_sal=Unknown
% @importance 0.8

0.80::acc(s26, comparable_board_cross_brand_salomon_sight).

0.64::true_val(comparable_board_cross_brand_salomon_sight, salomon_sight); 0.36::true_val(comparable_board_cross_brand_salomon_sight, unk_cbcb_sal).

measured(s26, comparable_board_cross_brand_salomon_sight, salomon_sight).

all_consistent(comparable_board_cross_brand_salomon_sight) :-
    (indep(s26), consistent(s26, comparable_board_cross_brand_salomon_sight) ; \+indep(s26)).

evidence(all_consistent(comparable_board_cross_brand_salomon_sight)).
query(true_val(comparable_board_cross_brand_salomon_sight, salomon_sight)).
query(true_val(comparable_board_cross_brand_salomon_sight, unk_cbcb_sal)).

% @attr comparable_board_cross_brand_salomon_specs
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values tapered_cross_camber_cork=Tapered_directional_Cross_Profile_camber_cork_rails unk_cbcb_sal_specs=Unknown
% @importance 0.65

0.72::acc(s44, comparable_board_cross_brand_salomon_specs).

0.56::true_val(comparable_board_cross_brand_salomon_specs, tapered_cross_camber_cork); 0.44::true_val(comparable_board_cross_brand_salomon_specs, unk_cbcb_sal_specs).

measured(s44, comparable_board_cross_brand_salomon_specs, tapered_cross_camber_cork).

all_consistent(comparable_board_cross_brand_salomon_specs) :- consistent(s44, comparable_board_cross_brand_salomon_specs).

evidence(all_consistent(comparable_board_cross_brand_salomon_specs)).
query(true_val(comparable_board_cross_brand_salomon_specs, tapered_cross_camber_cork)).
query(true_val(comparable_board_cross_brand_salomon_specs, unk_cbcb_sal_specs)).

% @attr comparable_board_cross_brand_lib_tech
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values lib_tech_skate_banana_579=Lib_Tech_Skate_Banana_at_579_99 unk_cbcb_libtech=Unknown
% @importance 0.9

0.82::acc(s24, comparable_board_cross_brand_lib_tech).

0.68::true_val(comparable_board_cross_brand_lib_tech, lib_tech_skate_banana_579); 0.32::true_val(comparable_board_cross_brand_lib_tech, unk_cbcb_libtech).

measured(s24, comparable_board_cross_brand_lib_tech, lib_tech_skate_banana_579).

all_consistent(comparable_board_cross_brand_lib_tech) :-
    (indep(s24), consistent(s24, comparable_board_cross_brand_lib_tech) ; \+indep(s24)).

evidence(all_consistent(comparable_board_cross_brand_lib_tech)).
query(true_val(comparable_board_cross_brand_lib_tech, lib_tech_skate_banana_579)).
query(true_val(comparable_board_cross_brand_lib_tech, unk_cbcb_libtech)).

% @attr comparable_board_cross_brand_burton_custom
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values burton_custom_camber_679=Burton_Custom_Camber_at_679_95 unk_cbcb_burton=Unknown
% @importance 0.9

0.82::acc(s24, comparable_board_cross_brand_burton_custom).

0.68::true_val(comparable_board_cross_brand_burton_custom, burton_custom_camber_679); 0.32::true_val(comparable_board_cross_brand_burton_custom, unk_cbcb_burton).

measured(s24, comparable_board_cross_brand_burton_custom, burton_custom_camber_679).

all_consistent(comparable_board_cross_brand_burton_custom) :-
    (indep(s24), consistent(s24, comparable_board_cross_brand_burton_custom) ; \+indep(s24)).

evidence(all_consistent(comparable_board_cross_brand_burton_custom)).
query(true_val(comparable_board_cross_brand_burton_custom, burton_custom_camber_679)).
query(true_val(comparable_board_cross_brand_burton_custom, unk_cbcb_burton)).

% @attr comparable_board_same_brand_antigravity
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values gnu_antigravity_c3_479=GNU_Antigravity_C3_at_479_99 unk_cbsb_antigrav=Unknown
% @importance 0.75

0.85::acc(s2, comparable_board_same_brand_antigravity).

0.77::true_val(comparable_board_same_brand_antigravity, gnu_antigravity_c3_479); 0.23::true_val(comparable_board_same_brand_antigravity, unk_cbsb_antigrav).

measured(s2, comparable_board_same_brand_antigravity, gnu_antigravity_c3_479).

all_consistent(comparable_board_same_brand_antigravity) :-
    (indep(s2), consistent(s2, comparable_board_same_brand_antigravity) ; \+indep(s2)).

evidence(all_consistent(comparable_board_same_brand_antigravity)).
query(true_val(comparable_board_same_brand_antigravity, gnu_antigravity_c3_479)).
query(true_val(comparable_board_same_brand_antigravity, unk_cbsb_antigrav)).

% @attr comparable_board_same_brand_money
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values gnu_money_c2e_449=GNU_Money_C2E_at_449_99 unk_cbsb_money=Unknown
% @importance 0.6

0.82::acc(s2, comparable_board_same_brand_money).

0.77::true_val(comparable_board_same_brand_money, gnu_money_c2e_449); 0.23::true_val(comparable_board_same_brand_money, unk_cbsb_money).

measured(s2, comparable_board_same_brand_money, gnu_money_c2e_449).

all_consistent(comparable_board_same_brand_money) :-
    (indep(s2), consistent(s2, comparable_board_same_brand_money) ; \+indep(s2)).

evidence(all_consistent(comparable_board_same_brand_money)).
query(true_val(comparable_board_same_brand_money, gnu_money_c2e_449)).
query(true_val(comparable_board_same_brand_money, unk_cbsb_money)).

% @attr comparable_board_same_brand_most_affordable
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values most_affordable_gnu=Most_affordable_in_GNU_mens_lineup unk_cbsb_afford=Unknown
% @importance 0.75

0.85::acc(s2, comparable_board_same_brand_most_affordable).

0.77::true_val(comparable_board_same_brand_most_affordable, most_affordable_gnu); 0.23::true_val(comparable_board_same_brand_most_affordable, unk_cbsb_afford).

measured(s2, comparable_board_same_brand_most_affordable, most_affordable_gnu).

all_consistent(comparable_board_same_brand_most_affordable) :-
    (indep(s2), consistent(s2, comparable_board_same_brand_most_affordable) ; \+indep(s2)).

evidence(all_consistent(comparable_board_same_brand_most_affordable)).
query(true_val(comparable_board_same_brand_most_affordable, most_affordable_gnu)).
query(true_val(comparable_board_same_brand_most_affordable, unk_cbsb_afford)).

% @attr positive_aspect_value
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values american_handmade_value=American_handmade_at_429_strong_value unk_pa_value=Unknown
% @importance 0.95

0.90::acc(s1, positive_aspect_value).
0.82::acc(s24, positive_aspect_value).

0.95::true_val(positive_aspect_value, american_handmade_value); 0.05::true_val(positive_aspect_value, unk_pa_value).

measured(s1, positive_aspect_value, american_handmade_value).
measured(s24, positive_aspect_value, american_handmade_value).

all_consistent(positive_aspect_value) :-
    consistent(s1, positive_aspect_value),
    (indep(s24), consistent(s24, positive_aspect_value) ; \+indep(s24)).

evidence(all_consistent(positive_aspect_value)).
query(true_val(positive_aspect_value, american_handmade_value)).
query(true_val(positive_aspect_value, unk_pa_value)).

% @attr positive_aspect_edge_tech
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values key_differentiator_edge=Key_differentiator_vs_competitors_serrated_edge unk_pa_edge=Unknown
% @importance 0.85

0.78::acc(s21, positive_aspect_edge_tech).

0.60::true_val(positive_aspect_edge_tech, key_differentiator_edge); 0.40::true_val(positive_aspect_edge_tech, unk_pa_edge).

measured(s21, positive_aspect_edge_tech, key_differentiator_edge).

all_consistent(positive_aspect_edge_tech) :-
    (indep(s21), consistent(s21, positive_aspect_edge_tech) ; \+indep(s21)).

evidence(all_consistent(positive_aspect_edge_tech)).
query(true_val(positive_aspect_edge_tech, key_differentiator_edge)).
query(true_val(positive_aspect_edge_tech, unk_pa_edge)).

% @attr positive_aspect_catch_free
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values banana_reduces_catch=Original_Banana_reduces_edge_catching_beginners unk_pa_catch=Unknown
% @importance 0.85

0.80::acc(s4, positive_aspect_catch_free).

0.69::true_val(positive_aspect_catch_free, banana_reduces_catch); 0.31::true_val(positive_aspect_catch_free, unk_pa_catch).

measured(s4, positive_aspect_catch_free, banana_reduces_catch).

all_consistent(positive_aspect_catch_free) :-
    (indep(s4), consistent(s4, positive_aspect_catch_free) ; \+indep(s4)).

evidence(all_consistent(positive_aspect_catch_free)).
query(true_val(positive_aspect_catch_free, banana_reduces_catch)).
query(true_val(positive_aspect_catch_free, unk_pa_catch)).

% @attr positive_aspect_progression
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values grows_with_rider=Board_grows_with_rider_beginner_to_intermediate unk_pa_prog=Unknown
% @importance 0.85

0.80::acc(s4, positive_aspect_progression).

0.69::true_val(positive_aspect_progression, grows_with_rider); 0.31::true_val(positive_aspect_progression, unk_pa_prog).

measured(s4, positive_aspect_progression, grows_with_rider).

all_consistent(positive_aspect_progression) :-
    (indep(s4), consistent(s4, positive_aspect_progression) ; \+indep(s4)).

evidence(all_consistent(positive_aspect_progression)).
query(true_val(positive_aspect_progression, grows_with_rider)).
query(true_val(positive_aspect_progression, unk_pa_prog)).

% @attr switch_riding
% @type categorical
% @canonical false
% @original_name switch_riding
% @values performs_well_switch=Directional_twin_good_both_ways_excels_one unk_switch_riding=Unknown
% @importance 0.8

0.78::acc(s22, switch_riding).

0.69::true_val(switch_riding, performs_well_switch); 0.31::true_val(switch_riding, unk_switch_riding).

measured(s22, switch_riding, performs_well_switch).

all_consistent(switch_riding) :-
    (indep(s_merchant), consistent(s22, switch_riding) ; \+indep(s_merchant)).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, performs_well_switch)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr negative_aspect_speed
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values nervous_speed_soft=Board_nervous_at_speed_typical_soft_flex unk_na_speed=Unknown
% @importance 0.75

0.65::acc(s14, negative_aspect_speed).

0.44::true_val(negative_aspect_speed, nervous_speed_soft); 0.56::true_val(negative_aspect_speed, unk_na_speed).

measured(s14, negative_aspect_speed, nervous_speed_soft).

all_consistent(negative_aspect_speed) :-
    (indep(s14), consistent(s14, negative_aspect_speed) ; \+indep(s14)).

evidence(all_consistent(negative_aspect_speed)).
query(true_val(negative_aspect_speed, nervous_speed_soft)).
query(true_val(negative_aspect_speed, unk_na_speed)).

% @attr positive_aspect_flex_playful
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values soft_mid_playful=Soft_to_mid_flex_playful_butters_presses_rails unk_pa_flex=Unknown
% @importance 0.9

0.82::acc(s24, positive_aspect_flex_playful).

0.68::true_val(positive_aspect_flex_playful, soft_mid_playful); 0.32::true_val(positive_aspect_flex_playful, unk_pa_flex).

measured(s24, positive_aspect_flex_playful, soft_mid_playful).

all_consistent(positive_aspect_flex_playful) :-
    (indep(s24), consistent(s24, positive_aspect_flex_playful) ; \+indep(s24)).

evidence(all_consistent(positive_aspect_flex_playful)).
query(true_val(positive_aspect_flex_playful, soft_mid_playful)).
query(true_val(positive_aspect_flex_playful, unk_pa_flex)).

% @attr positive_aspect_float
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values btx_rocker_float=BTX_rocker_directional_natural_float unk_pa_float=Unknown
% @importance 0.85

0.80::acc(s4, positive_aspect_float).

0.69::true_val(positive_aspect_float, btx_rocker_float); 0.31::true_val(positive_aspect_float, unk_pa_float).

measured(s4, positive_aspect_float, btx_rocker_float).

all_consistent(positive_aspect_float) :-
    (indep(s4), consistent(s4, positive_aspect_float) ; \+indep(s4)).

evidence(all_consistent(positive_aspect_float)).
query(true_val(positive_aspect_float, btx_rocker_float)).
query(true_val(positive_aspect_float, unk_pa_float)).

% @attr negative_aspect_soft_heavy
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values too_soft_heavy_advanced=Too_soft_for_heavier_advanced_riders_high_speed unk_na_soft=Unknown
% @importance 0.83

0.65::acc(s14, negative_aspect_soft_heavy).
0.80::acc(s24, negative_aspect_soft_heavy).

0.75::true_val(negative_aspect_soft_heavy, too_soft_heavy_advanced); 0.25::true_val(negative_aspect_soft_heavy, unk_na_soft).

measured(s14, negative_aspect_soft_heavy, too_soft_heavy_advanced).
measured(s24, negative_aspect_soft_heavy, too_soft_heavy_advanced).

all_consistent(negative_aspect_soft_heavy) :-
    (indep(s14), consistent(s14, negative_aspect_soft_heavy) ; \+indep(s14)),
    (indep(s24), consistent(s24, negative_aspect_soft_heavy) ; \+indep(s24)).

evidence(all_consistent(negative_aspect_soft_heavy)).
query(true_val(negative_aspect_soft_heavy, too_soft_heavy_advanced)).
query(true_val(negative_aspect_soft_heavy, unk_na_soft)).