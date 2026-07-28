0.12::indep(s_merchant).
0.20::indep(s_evo).
0.15::indep(s_christy).
0.15::indep(s_blauer).
0.12::indep(s_glacier).
0.15::indep(s_ski_ess).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values never_summer=Never_Summer unk_brand=Unknown
% @importance 0.95

0.95::acc(s1, brand).
0.85::acc(s2, brand).

0.95::true_val(brand, never_summer); 0.05::true_val(brand, unk_brand).

measured(s1, brand, never_summer).
measured(s2, brand, never_summer).

all_consistent(brand) :-
    consistent(s1, brand),
    (indep(s_evo), consistent(s2, brand) ; \+indep(s_evo)).

evidence(all_consistent(brand)).
query(true_val(brand, never_summer)).
query(true_val(brand, unk_brand)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values never_summer_industries=Never_Summer_Industries unk_manufacturer=Unknown
% @importance 0.8

0.82::acc(s3, manufacturer).

0.90::true_val(manufacturer, never_summer_industries); 0.10::true_val(manufacturer, unk_manufacturer).

measured(s3, manufacturer, never_summer_industries).

all_consistent(manufacturer) :-
    consistent(s3, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, never_summer_industries)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values denver_colorado_usa=Denver_Colorado_USA unk_manufacturing_location=Unknown
% @importance 0.6

0.95::acc(s4, manufacturing_location_current).
0.90::acc(s5, manufacturing_location_current).
0.78::acc(s6, manufacturing_location_current).
0.72::acc(s7, manufacturing_location_current).

0.95::true_val(manufacturing_location_current, denver_colorado_usa); 0.05::true_val(manufacturing_location_current, unk_manufacturing_location).

measured(s4, manufacturing_location_current, denver_colorado_usa).
measured(s5, manufacturing_location_current, denver_colorado_usa).
measured(s6, manufacturing_location_current, denver_colorado_usa).
measured(s7, manufacturing_location_current, denver_colorado_usa).

all_consistent(manufacturing_location_current) :-
    consistent(s4, manufacturing_location_current),
    consistent(s5, manufacturing_location_current),
    consistent(s6, manufacturing_location_current),
    consistent(s7, manufacturing_location_current).

evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, denver_colorado_usa)).
query(true_val(manufacturing_location_current, unk_manufacturing_location)).

% @attr company_founded
% @type categorical
% @canonical false
% @original_name Company founded
% @values y1991_swift1983=1991_NS_1983_Swift unk_company_founded=Unknown
% @importance 0.375

0.80::acc(s8, company_founded).
0.80::acc(s9, company_founded).

0.95::true_val(company_founded, y1991_swift1983); 0.05::true_val(company_founded, unk_company_founded).

measured(s8, company_founded, y1991_swift1983).
measured(s9, company_founded, y1991_swift1983).

all_consistent(company_founded) :-
    consistent(s8, company_founded),
    consistent(s9, company_founded).

evidence(all_consistent(company_founded)).
query(true_val(company_founded, y1991_swift1983)).
query(true_val(company_founded, unk_company_founded)).

% @attr founders
% @type categorical
% @canonical false
% @original_name Founders
% @values tim_tracey_canaday=Tim_and_Tracey_Canaday unk_founders=Unknown
% @importance 0.35

0.82::acc(s10, founders).

0.88::true_val(founders, tim_tracey_canaday); 0.12::true_val(founders, unk_founders).

measured(s10, founders, tim_tracey_canaday).

all_consistent(founders) :-
    consistent(s10, founders).

evidence(all_consistent(founders)).
query(true_val(founders, tim_tracey_canaday)).
query(true_val(founders, unk_founders)).

% @attr company_type
% @type categorical
% @canonical false
% @original_name Company type
% @values independent_family_owned=Independent_family_owned unk_company_type=Unknown
% @importance 0.5

0.82::acc(s11, company_type).

0.85::true_val(company_type, independent_family_owned); 0.15::true_val(company_type, unk_company_type).

measured(s11, company_type, independent_family_owned).

all_consistent(company_type) :-
    consistent(s11, company_type).

evidence(all_consistent(company_type)).
query(true_val(company_type, independent_family_owned)).
query(true_val(company_type, unk_company_type)).

% @attr annual_production
% @type categorical
% @canonical false
% @original_name Annual production
% @values approx_30000=Approximately_30000_per_year unk_annual_production=Unknown
% @importance 0.3

0.83::acc(s12, annual_production).

0.85::true_val(annual_production, approx_30000); 0.15::true_val(annual_production, unk_annual_production).

measured(s12, annual_production, approx_30000).

all_consistent(annual_production) :-
    consistent(s12, annual_production).

evidence(all_consistent(annual_production)).
query(true_val(annual_production, approx_30000)).
query(true_val(annual_production, unk_annual_production)).

% @attr employees
% @type categorical
% @canonical false
% @original_name Employees
% @values about_70_floor_20_office=70_factory_20_office unk_employees=Unknown
% @importance 0.2

0.92::acc(s13, employees).

0.92::true_val(employees, about_70_floor_20_office); 0.08::true_val(employees, unk_employees).

measured(s13, employees, about_70_floor_20_office).

all_consistent(employees) :-
    consistent(s13, employees).

evidence(all_consistent(employees)).
query(true_val(employees, about_70_floor_20_office)).
query(true_val(employees, unk_employees)).

% @attr domestic_retailers
% @type categorical
% @canonical false
% @original_name Domestic retailers
% @values approx_250=Approximately_250_US_dealers unk_domestic_retailers=Unknown
% @importance 0.4

0.82::acc(s14, domestic_retailers).

0.85::true_val(domestic_retailers, approx_250); 0.15::true_val(domestic_retailers, unk_domestic_retailers).

measured(s14, domestic_retailers, approx_250).

all_consistent(domestic_retailers) :-
    consistent(s14, domestic_retailers).

evidence(all_consistent(domestic_retailers)).
query(true_val(domestic_retailers, approx_250)).
query(true_val(domestic_retailers, unk_domestic_retailers)).

% @attr international_distributors
% @type categorical
% @canonical false
% @original_name International distributors
% @values approx_20=Approximately_20 unk_intl_distributors=Unknown
% @importance 0.35

0.82::acc(s15, international_distributors).

0.85::true_val(international_distributors, approx_20); 0.15::true_val(international_distributors, unk_intl_distributors).

measured(s15, international_distributors, approx_20).

all_consistent(international_distributors) :-
    consistent(s15, international_distributors).

evidence(all_consistent(international_distributors)).
query(true_val(international_distributors, approx_20)).
query(true_val(international_distributors, unk_intl_distributors)).

% @attr uk_distributor
% @type categorical
% @canonical false
% @original_name UK distributor
% @values maxtrack=Maxtrack unk_uk_distributor=Unknown
% @importance 0.25

0.87::acc(s16, uk_distributor).

0.88::true_val(uk_distributor, maxtrack); 0.12::true_val(uk_distributor, unk_uk_distributor).

measured(s16, uk_distributor, maxtrack).

all_consistent(uk_distributor) :-
    consistent(s16, uk_distributor).

evidence(all_consistent(uk_distributor)).
query(true_val(uk_distributor, maxtrack)).
query(true_val(uk_distributor, unk_uk_distributor)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values three_year_limited=3_year_limited_warranty unk_warranty=Unknown
% @importance 0.8

0.95::acc(s17, warranty).
0.95::acc(s18, warranty).

0.96::true_val(warranty, three_year_limited); 0.04::true_val(warranty, unk_warranty).

measured(s17, warranty, three_year_limited).
measured(s18, warranty, three_year_limited).

all_consistent(warranty) :-
    consistent(s17, warranty),
    consistent(s18, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, three_year_limited)).
query(true_val(warranty, unk_warranty)).

% @attr edge_bevel_spec
% @type categorical
% @canonical true
% @original_name edge_bevel_spec
% @values flat_0_90=0_90_degree_flat_grind unk_edge_bevel=Unknown
% @importance 0.5

0.95::acc(s19, edge_bevel_spec).

0.93::true_val(edge_bevel_spec, flat_0_90); 0.07::true_val(edge_bevel_spec, unk_edge_bevel).

measured(s19, edge_bevel_spec, flat_0_90).

all_consistent(edge_bevel_spec) :-
    consistent(s19, edge_bevel_spec).

evidence(all_consistent(edge_bevel_spec)).
query(true_val(edge_bevel_spec, flat_0_90)).
query(true_val(edge_bevel_spec, unk_edge_bevel)).

% @attr hybrid_camber_patent
% @type categorical
% @canonical false
% @original_name Hybrid camber patent
% @values first_patent=First_patent_on_hybrid_camber unk_hybrid_patent=Unknown
% @importance 0.4

0.85::acc(s20, hybrid_camber_patent).

0.87::true_val(hybrid_camber_patent, first_patent); 0.13::true_val(hybrid_camber_patent, unk_hybrid_patent).

measured(s20, hybrid_camber_patent, first_patent).

all_consistent(hybrid_camber_patent) :-
    consistent(s20, hybrid_camber_patent).

evidence(all_consistent(hybrid_camber_patent)).
query(true_val(hybrid_camber_patent, first_patent)).
query(true_val(hybrid_camber_patent, unk_hybrid_patent)).

% @attr ptex_sidewall_innovation
% @type categorical
% @canonical false
% @original_name P-Tex sidewall innovation
% @values first_to_use=First_company_sintered_PTex_sidewalls unk_ptex_innovation=Unknown
% @importance 0.55

0.80::acc(s21, ptex_sidewall_innovation).

0.82::true_val(ptex_sidewall_innovation, first_to_use); 0.18::true_val(ptex_sidewall_innovation, unk_ptex_innovation).

measured(s21, ptex_sidewall_innovation, first_to_use).

all_consistent(ptex_sidewall_innovation) :-
    (indep(s_evo), consistent(s21, ptex_sidewall_innovation) ; \+indep(s_evo)).

evidence(all_consistent(ptex_sidewall_innovation)).
query(true_val(ptex_sidewall_innovation, first_to_use)).
query(true_val(ptex_sidewall_innovation, unk_ptex_innovation)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values mens_swift=Mens_Swift unk_model_name=Unknown
% @importance 1.0

0.97::acc(s22, model_name).

0.97::true_val(model_name, mens_swift); 0.03::true_val(model_name, unk_model_name).

measured(s22, model_name, mens_swift).

all_consistent(model_name) :-
    consistent(s22, model_name).

evidence(all_consistent(model_name)).
query(true_val(model_name, mens_swift)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2026=2026 unk_model_year=Unknown
% @importance 1.0

0.97::acc(s22b, model_year).

0.97::true_val(model_year, y2026); 0.03::true_val(model_year, unk_model_year).

measured(s22b, model_year, y2026).

all_consistent(model_year) :-
    consistent(s22b, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2026)).
query(true_val(model_year, unk_model_year)).

% @attr sku_153cm
% @type categorical
% @canonical false
% @original_name SKU (153cm)
% @values qswi153=QSWI153 unk_sku=Unknown
% @importance 0.85

0.92::acc(s_merchant, sku_153cm).

0.93::true_val(sku_153cm, qswi153); 0.07::true_val(sku_153cm, unk_sku).

measured(s_merchant, sku_153cm, qswi153).

all_consistent(sku_153cm) :-
    (indep(s_merchant), consistent(s_merchant, sku_153cm) ; \+indep(s_merchant)).

evidence(all_consistent(sku_153cm)).
query(true_val(sku_153cm, qswi153)).
query(true_val(sku_153cm, unk_sku)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.97::acc(s22c, product_type).

0.97::true_val(product_type, snowboard); 0.03::true_val(product_type, unk_product_type).

measured(s22c, product_type, snowboard).

all_consistent(product_type) :-
    consistent(s22c, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values freeride_powder=Freeride_Powder mellow_freeride_snowsurf=Mellow_Freeride_Snowsurf
% @importance 0.77

0.88::acc(s_merchant, board_category).
0.85::acc(s23, board_category).
0.85::acc(s24, board_category).

0.35::true_val(board_category, freeride_powder); 0.65::true_val(board_category, mellow_freeride_snowsurf).

measured(s_merchant, board_category, freeride_powder).
measured(s23, board_category, mellow_freeride_snowsurf).
measured(s24, board_category, mellow_freeride_snowsurf).

all_consistent(board_category) :-
    (indep(s_merchant), consistent(s_merchant, board_category) ; \+indep(s_merchant)),
    consistent(s23, board_category),
    consistent(s24, board_category).

evidence(all_consistent(board_category)).
query(true_val(board_category, freeride_powder)).
query(true_val(board_category, mellow_freeride_snowsurf)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.85

0.92::acc(s_merchant, gender).

0.95::true_val(gender, mens); 0.05::true_val(gender, unk_gender).

measured(s_merchant, gender, mens).

all_consistent(gender) :-
    (indep(s_merchant), consistent(s_merchant, gender) ; \+indep(s_merchant)).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr model_series
% @type categorical
% @canonical false
% @original_name Model series
% @values shaper_series=Shaper_Series unk_model_series=Unknown
% @importance 0.5

0.80::acc(s25, model_series).
0.82::acc(s26, model_series).

0.95::true_val(model_series, shaper_series); 0.05::true_val(model_series, unk_model_series).

measured(s25, model_series, shaper_series).
measured(s26, model_series, shaper_series).

all_consistent(model_series) :-
    (indep(s_blauer), consistent(s25, model_series) ; \+indep(s_blauer)),
    (indep(s_christy), consistent(s26, model_series) ; \+indep(s_christy)).

evidence(all_consistent(model_series)).
query(true_val(model_series, shaper_series)).
query(true_val(model_series, unk_model_series)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values y2016=2016 unk_first_year=Unknown
% @importance 0.6

0.87::acc(s27, model_first_available_year).

0.88::true_val(model_first_available_year, y2016); 0.12::true_val(model_first_available_year, unk_first_year).

measured(s27, model_first_available_year, y2016).

all_consistent(model_first_available_year) :-
    consistent(s27, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2016)).
query(true_val(model_first_available_year, unk_first_year)).

% @attr shaper_series_introduced
% @type categorical
% @canonical false
% @original_name Shaper Series introduced
% @values y2017=2017 unk_shaper_intro=Unknown
% @importance 0.4

0.80::acc(s28, shaper_series_introduced).

0.84::true_val(shaper_series_introduced, y2017); 0.16::true_val(shaper_series_introduced, unk_shaper_intro).

measured(s28, shaper_series_introduced, y2017).

all_consistent(shaper_series_introduced) :-
    consistent(s28, shaper_series_introduced).

evidence(all_consistent(shaper_series_introduced)).
query(true_val(shaper_series_introduced, y2017)).
query(true_val(shaper_series_introduced, unk_shaper_intro)).

% @attr swift_brand_history
% @type categorical
% @canonical false
% @original_name Original Swift Snowboards brand history
% @values first_boards_1983_logo_used=Pressed_first_boards_1983_logo_still_used unk_swift_history=Unknown
% @importance 0.35

0.85::acc(s29, swift_brand_history).

0.87::true_val(swift_brand_history, first_boards_1983_logo_used); 0.13::true_val(swift_brand_history, unk_swift_history).

measured(s29, swift_brand_history, first_boards_1983_logo_used).

all_consistent(swift_brand_history) :-
    consistent(s29, swift_brand_history).

evidence(all_consistent(swift_brand_history)).
query(true_val(swift_brand_history, first_boards_1983_logo_used)).
query(true_val(swift_brand_history, unk_swift_history)).

% @attr graphic_designer_artist
% @type categorical
% @canonical true
% @original_name graphic_designer_artist
% @values tim_canaday=Tim_Canaday unk_designer=Unknown
% @importance 0.375

0.82::acc(s30, graphic_designer_artist).
0.85::acc(s31, graphic_designer_artist).

0.95::true_val(graphic_designer_artist, tim_canaday); 0.05::true_val(graphic_designer_artist, unk_designer).

measured(s30, graphic_designer_artist, tim_canaday).
measured(s31, graphic_designer_artist, tim_canaday).

all_consistent(graphic_designer_artist) :-
    (indep(s_christy), consistent(s30, graphic_designer_artist) ; \+indep(s_christy)),
    consistent(s31, graphic_designer_artist).

evidence(all_consistent(graphic_designer_artist)).
query(true_val(graphic_designer_artist, tim_canaday)).
query(true_val(graphic_designer_artist, unk_designer)).

% @attr current_model_release_date
% @type categorical
% @canonical false
% @original_name Current model release date
% @values season_2025_26=2025_26_season unk_release_date=Unknown
% @importance 1.0

0.97::acc(s22d, current_model_release_date).

0.97::true_val(current_model_release_date, season_2025_26); 0.03::true_val(current_model_release_date, unk_release_date).

measured(s22d, current_model_release_date, season_2025_26).

all_consistent(current_model_release_date) :-
    consistent(s22d, current_model_release_date).

evidence(all_consistent(current_model_release_date)).
query(true_val(current_model_release_date, season_2025_26)).
query(true_val(current_model_release_date, unk_release_date)).

% @attr predecessor_changes
% @type categorical
% @canonical false
% @original_name Predecessor changes
% @values slight_shape_2024=Slight_shape_update_2024_less_pointy_nose unk_predecessor=Unknown
% @importance 0.5

0.85::acc(s32, predecessor_changes).

0.85::true_val(predecessor_changes, slight_shape_2024); 0.15::true_val(predecessor_changes, unk_predecessor).

measured(s32, predecessor_changes, slight_shape_2024).

all_consistent(predecessor_changes) :-
    consistent(s32, predecessor_changes).

evidence(all_consistent(predecessor_changes)).
query(true_val(predecessor_changes, slight_shape_2024)).
query(true_val(predecessor_changes, unk_predecessor)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values s153_158_163=153cm_158cm_163cm unk_available_sizes=Unknown
% @importance 0.875

0.92::acc(s_merchant, available_sizes).
0.87::acc(s33, available_sizes).

0.96::true_val(available_sizes, s153_158_163); 0.04::true_val(available_sizes, unk_available_sizes).

measured(s_merchant, available_sizes, s153_158_163).
measured(s33, available_sizes, s153_158_163).

all_consistent(available_sizes) :-
    (indep(s_merchant), consistent(s_merchant, available_sizes) ; \+indep(s_merchant)),
    (indep(s_christy), consistent(s33, available_sizes) ; \+indep(s_christy)).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, s153_158_163)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr available_sizes_df
% @type categorical
% @canonical false
% @original_name available_sizes (DF variant)
% @values s164df=164cm_DF unk_sizes_df=Unknown
% @importance 0.85

0.92::acc(s_merchant, available_sizes_df).

0.93::true_val(available_sizes_df, s164df); 0.07::true_val(available_sizes_df, unk_sizes_df).

measured(s_merchant, available_sizes_df, s164df).

all_consistent(available_sizes_df) :-
    (indep(s_merchant), consistent(s_merchant, available_sizes_df) ; \+indep(s_merchant)).

evidence(all_consistent(available_sizes_df)).
query(true_val(available_sizes_df, s164df)).
query(true_val(available_sizes_df, unk_sizes_df)).

% @attr drag_free_variant_description
% @type categorical
% @canonical false
% @original_name Drag Free variant description
% @values volume_shifted_wide=Volume_shifted_wide_for_size_10_5_plus unk_df_desc=Unknown
% @importance 0.8

0.80::acc(s34, drag_free_variant_description).

0.82::true_val(drag_free_variant_description, volume_shifted_wide); 0.18::true_val(drag_free_variant_description, unk_df_desc).

measured(s34, drag_free_variant_description, volume_shifted_wide).

all_consistent(drag_free_variant_description) :-
    (indep(s_blauer), consistent(s34, drag_free_variant_description) ; \+indep(s_blauer)).

evidence(all_consistent(drag_free_variant_description)).
query(true_val(drag_free_variant_description, volume_shifted_wide)).
query(true_val(drag_free_variant_description, unk_df_desc)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values mid_wide_and_df=Mid_Wide_standard_Drag_Free_164DF unk_width_options=Unknown
% @importance 0.85

0.92::acc(s_merchant, width_options).

0.93::true_val(width_options, mid_wide_and_df); 0.07::true_val(width_options, unk_width_options).

measured(s_merchant, width_options, mid_wide_and_df).

all_consistent(width_options) :-
    (indep(s_merchant), consistent(s_merchant, width_options) ; \+indep(s_merchant)).

evidence(all_consistent(width_options)).
query(true_val(width_options, mid_wide_and_df)).
query(true_val(width_options, unk_width_options)).

% @attr waist_width_153
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 153cm
% @values v257=257.0 unk_ww153=Unknown
% @importance 0.85

0.92::acc(s_merchant, waist_width_153).

0.93::true_val(waist_width_153, v257); 0.07::true_val(waist_width_153, unk_ww153).

measured(s_merchant, waist_width_153, v257).

all_consistent(waist_width_153) :-
    (indep(s_merchant), consistent(s_merchant, waist_width_153) ; \+indep(s_merchant)).

evidence(all_consistent(waist_width_153)).
query(true_val(waist_width_153, v257)).
query(true_val(waist_width_153, unk_ww153)).

% @attr waist_width_158
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 158cm
% @values v259=259.0 unk_ww158=Unknown
% @importance 0.85

0.92::acc(s_merchant, waist_width_158).

0.93::true_val(waist_width_158, v259); 0.07::true_val(waist_width_158, unk_ww158).

measured(s_merchant, waist_width_158, v259).

all_consistent(waist_width_158) :-
    (indep(s_merchant), consistent(s_merchant, waist_width_158) ; \+indep(s_merchant)).

evidence(all_consistent(waist_width_158)).
query(true_val(waist_width_158, v259)).
query(true_val(waist_width_158, unk_ww158)).

% @attr waist_width_163
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 163cm
% @values v262=262.0 unk_ww163=Unknown
% @importance 0.85

0.92::acc(s_merchant, waist_width_163).

0.93::true_val(waist_width_163, v262); 0.07::true_val(waist_width_163, unk_ww163).

measured(s_merchant, waist_width_163, v262).

all_consistent(waist_width_163) :-
    (indep(s_merchant), consistent(s_merchant, waist_width_163) ; \+indep(s_merchant)).

evidence(all_consistent(waist_width_163)).
query(true_val(waist_width_163, v262)).
query(true_val(waist_width_163, unk_ww163)).

% @attr waist_width_164df
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 164DF
% @values v280=280.0 unk_ww164df=Unknown
% @importance 0.85

0.92::acc(s_merchant, waist_width_164df).

0.93::true_val(waist_width_164df, v280); 0.07::true_val(waist_width_164df, unk_ww164df).

measured(s_merchant, waist_width_164df, v280).

all_consistent(waist_width_164df) :-
    (indep(s_merchant), consistent(s_merchant, waist_width_164df) ; \+indep(s_merchant)).

evidence(all_consistent(waist_width_164df)).
query(true_val(waist_width_164df, v280)).
query(true_val(waist_width_164df, unk_ww164df)).

% @attr effective_edge_153
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 153cm
% @values v1120=1120.0 unk_ee153=Unknown
% @importance 0.85

0.92::acc(s_merchant, effective_edge_153).

0.93::true_val(effective_edge_153, v1120); 0.07::true_val(effective_edge_153, unk_ee153).

measured(s_merchant, effective_edge_153, v1120).

all_consistent(effective_edge_153) :-
    (indep(s_merchant), consistent(s_merchant, effective_edge_153) ; \+indep(s_merchant)).

evidence(all_consistent(effective_edge_153)).
query(true_val(effective_edge_153, v1120)).
query(true_val(effective_edge_153, unk_ee153)).

% @attr effective_edge_158
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 158cm
% @values v1170=1170.0 unk_ee158=Unknown
% @importance 0.85

0.92::acc(s_merchant, effective_edge_158).

0.93::true_val(effective_edge_158, v1170); 0.07::true_val(effective_edge_158, unk_ee158).

measured(s_merchant, effective_edge_158, v1170).

all_consistent(effective_edge_158) :-
    (indep(s_merchant), consistent(s_merchant, effective_edge_158) ; \+indep(s_merchant)).

evidence(all_consistent(effective_edge_158)).
query(true_val(effective_edge_158, v1170)).
query(true_val(effective_edge_158, unk_ee158)).

% @attr effective_edge_163
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 163cm
% @values v1210=1210.0 unk_ee163=Unknown
% @importance 0.85

0.92::acc(s_merchant, effective_edge_163).

0.93::true_val(effective_edge_163, v1210); 0.07::true_val(effective_edge_163, unk_ee163).

measured(s_merchant, effective_edge_163, v1210).

all_consistent(effective_edge_163) :-
    (indep(s_merchant), consistent(s_merchant, effective_edge_163) ; \+indep(s_merchant)).

evidence(all_consistent(effective_edge_163)).
query(true_val(effective_edge_163, v1210)).
query(true_val(effective_edge_163, unk_ee163)).

% @attr effective_edge_164df
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 164DF
% @values v1260=1260.0 unk_ee164df=Unknown
% @importance 0.85

0.92::acc(s_merchant, effective_edge_164df).

0.93::true_val(effective_edge_164df, v1260); 0.07::true_val(effective_edge_164df, unk_ee164df).

measured(s_merchant, effective_edge_164df, v1260).

all_consistent(effective_edge_164df) :-
    (indep(s_merchant), consistent(s_merchant, effective_edge_164df) ; \+indep(s_merchant)).

evidence(all_consistent(effective_edge_164df)).
query(true_val(effective_edge_164df, v1260)).
query(true_val(effective_edge_164df, unk_ee164df)).

% @attr tip_tail_width_size_153
% @type categorical
% @canonical false
% @original_name tip_tail_width_size (153cm)
% @values w314_294=314mm_294mm unk_ttw153=Unknown
% @importance 0.85

0.92::acc(s_merchant, tip_tail_width_size_153).

0.93::true_val(tip_tail_width_size_153, w314_294); 0.07::true_val(tip_tail_width_size_153, unk_ttw153).

measured(s_merchant, tip_tail_width_size_153, w314_294).

all_consistent(tip_tail_width_size_153) :-
    (indep(s_merchant), consistent(s_merchant, tip_tail_width_size_153) ; \+indep(s_merchant)).

evidence(all_consistent(tip_tail_width_size_153)).
query(true_val(tip_tail_width_size_153, w314_294)).
query(true_val(tip_tail_width_size_153, unk_ttw153)).

% @attr tip_tail_width_size
% @type categorical
% @canonical true
% @original_name tip_tail_width_size (158cm)
% @values w316_296=316mm_296mm unk_ttw158=Unknown
% @importance 0.85

0.92::acc(s_merchant, tip_tail_width_size).

0.93::true_val(tip_tail_width_size, w316_296); 0.07::true_val(tip_tail_width_size, unk_ttw158).

measured(s_merchant, tip_tail_width_size, w316_296).

all_consistent(tip_tail_width_size) :-
    (indep(s_merchant), consistent(s_merchant, tip_tail_width_size) ; \+indep(s_merchant)).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, w316_296)).
query(true_val(tip_tail_width_size, unk_ttw158)).

% @attr tip_tail_width_size_163
% @type categorical
% @canonical false
% @original_name tip_tail_width_size (163cm)
% @values w318_298=318mm_298mm unk_ttw163=Unknown
% @importance 0.85

0.92::acc(s_merchant, tip_tail_width_size_163).

0.93::true_val(tip_tail_width_size_163, w318_298); 0.07::true_val(tip_tail_width_size_163, unk_ttw163).

measured(s_merchant, tip_tail_width_size_163, w318_298).

all_consistent(tip_tail_width_size_163) :-
    (indep(s_merchant), consistent(s_merchant, tip_tail_width_size_163) ; \+indep(s_merchant)).

evidence(all_consistent(tip_tail_width_size_163)).
query(true_val(tip_tail_width_size_163, w318_298)).
query(true_val(tip_tail_width_size_163, unk_ttw163)).

% @attr tip_tail_width_size_164df
% @type categorical
% @canonical false
% @original_name tip_tail_width_size (164DF)
% @values w323_301=323mm_301mm unk_ttw164df=Unknown
% @importance 0.85

0.92::acc(s_merchant, tip_tail_width_size_164df).

0.93::true_val(tip_tail_width_size_164df, w323_301); 0.07::true_val(tip_tail_width_size_164df, unk_ttw164df).

measured(s_merchant, tip_tail_width_size_164df, w323_301).

all_consistent(tip_tail_width_size_164df) :-
    (indep(s_merchant), consistent(s_merchant, tip_tail_width_size_164df) ; \+indep(s_merchant)).

evidence(all_consistent(tip_tail_width_size_164df)).
query(true_val(tip_tail_width_size_164df, w323_301)).
query(true_val(tip_tail_width_size_164df, unk_ttw164df)).

% @attr taper
% @type numeric
% @unit mm
% @canonical true
% @original_name taper
% @values v20=20.0 unk_taper=Unknown
% @importance 0.85

0.92::acc(s_merchant, taper).
0.88::acc(s35, taper).

0.96::true_val(taper, v20); 0.04::true_val(taper, unk_taper).

measured(s_merchant, taper, v20).
measured(s35, taper, v20).

all_consistent(taper) :-
    (indep(s_merchant), consistent(s_merchant, taper) ; \+indep(s_merchant)),
    consistent(s35, taper).

evidence(all_consistent(taper)).
query(true_val(taper, v20)).
query(true_val(taper, unk_taper)).

% @attr sidecut_radius_size_153
% @type categorical
% @canonical false
% @original_name sidecut_radius_size (153cm)
% @values vario_759=Vario_759 unk_scr153=Unknown
% @importance 0.85

0.92::acc(s_merchant, sidecut_radius_size_153).

0.93::true_val(sidecut_radius_size_153, vario_759); 0.07::true_val(sidecut_radius_size_153, unk_scr153).

measured(s_merchant, sidecut_radius_size_153, vario_759).

all_consistent(sidecut_radius_size_153) :-
    (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_153) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_radius_size_153)).
query(true_val(sidecut_radius_size_153, vario_759)).
query(true_val(sidecut_radius_size_153, unk_scr153)).

% @attr sidecut_radius_size
% @type categorical
% @canonical true
% @original_name sidecut_radius_size (158cm)
% @values vario_800=Vario_800 unk_scr158=Unknown
% @importance 0.85

0.92::acc(s_merchant, sidecut_radius_size).

0.93::true_val(sidecut_radius_size, vario_800); 0.07::true_val(sidecut_radius_size, unk_scr158).

measured(s_merchant, sidecut_radius_size, vario_800).

all_consistent(sidecut_radius_size) :-
    (indep(s_merchant), consistent(s_merchant, sidecut_radius_size) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, vario_800)).
query(true_val(sidecut_radius_size, unk_scr158)).

% @attr sidecut_radius_size_163
% @type categorical
% @canonical false
% @original_name sidecut_radius_size (163cm)
% @values vario_833=Vario_833 unk_scr163=Unknown
% @importance 0.85

0.92::acc(s_merchant, sidecut_radius_size_163).

0.93::true_val(sidecut_radius_size_163, vario_833); 0.07::true_val(sidecut_radius_size_163, unk_scr163).

measured(s_merchant, sidecut_radius_size_163, vario_833).

all_consistent(sidecut_radius_size_163) :-
    (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_163) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_radius_size_163)).
query(true_val(sidecut_radius_size_163, vario_833)).
query(true_val(sidecut_radius_size_163, unk_scr163)).

% @attr sidecut_radius_size_164df
% @type categorical
% @canonical false
% @original_name sidecut_radius_size (164DF)
% @values vario_833_df=Vario_833 unk_scr164df=Unknown
% @importance 0.85

0.92::acc(s_merchant, sidecut_radius_size_164df).

0.93::true_val(sidecut_radius_size_164df, vario_833_df); 0.07::true_val(sidecut_radius_size_164df, unk_scr164df).

measured(s_merchant, sidecut_radius_size_164df, vario_833_df).

all_consistent(sidecut_radius_size_164df) :-
    (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_164df) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_radius_size_164df)).
query(true_val(sidecut_radius_size_164df, vario_833_df)).
query(true_val(sidecut_radius_size_164df, unk_scr164df)).

% @attr setback
% @type numeric
% @unit mm
% @canonical true
% @original_name setback
% @values v83=83.0 v85=85.0
% @importance 0.73

0.88::acc(s_merchant, setback).
0.85::acc(s36, setback).
0.80::acc(s48, setback).
0.92::acc(s37, setback).

0.50::true_val(setback, v83); 0.50::true_val(setback, v85).

measured(s_merchant, setback, v83).
measured(s36, setback, v83).
measured(s48, setback, v83).
measured(s37, setback, v85).

all_consistent(setback) :-
    (indep(s_merchant), consistent(s_merchant, setback) ; \+indep(s_merchant)),
    (indep(s_christy), consistent(s36, setback) ; \+indep(s_christy)),
    (indep(s_blauer), consistent(s48, setback) ; \+indep(s_blauer)),
    consistent(s37, setback).

evidence(all_consistent(setback)).
query(true_val(setback, v83)).
query(true_val(setback, v85)).

% @attr recommended_weight_range_size_153
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (153cm)
% @values w54_82kg=54_82kg_120_180lbs unk_rwr153=Unknown
% @importance 0.85

0.92::acc(s_merchant, recommended_weight_range_size_153).

0.93::true_val(recommended_weight_range_size_153, w54_82kg); 0.07::true_val(recommended_weight_range_size_153, unk_rwr153).

measured(s_merchant, recommended_weight_range_size_153, w54_82kg).

all_consistent(recommended_weight_range_size_153) :-
    (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size_153) ; \+indep(s_merchant)).

evidence(all_consistent(recommended_weight_range_size_153)).
query(true_val(recommended_weight_range_size_153, w54_82kg)).
query(true_val(recommended_weight_range_size_153, unk_rwr153)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size (158cm)
% @values w63_90kg=63_90kg_140_200lbs unk_rwr158=Unknown
% @importance 0.85

0.92::acc(s_merchant, recommended_weight_range_size).

0.93::true_val(recommended_weight_range_size, w63_90kg); 0.07::true_val(recommended_weight_range_size, unk_rwr158).

measured(s_merchant, recommended_weight_range_size, w63_90kg).

all_consistent(recommended_weight_range_size) :-
    (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size) ; \+indep(s_merchant)).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w63_90kg)).
query(true_val(recommended_weight_range_size, unk_rwr158)).

% @attr recommended_weight_range_size_163
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (163cm)
% @values w72_90kg=72_90plus_kg_160_200plus_lbs unk_rwr163=Unknown
% @importance 0.85

0.92::acc(s_merchant, recommended_weight_range_size_163).

0.93::true_val(recommended_weight_range_size_163, w72_90kg); 0.07::true_val(recommended_weight_range_size_163, unk_rwr163).

measured(s_merchant, recommended_weight_range_size_163, w72_90kg).

all_consistent(recommended_weight_range_size_163) :-
    (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size_163) ; \+indep(s_merchant)).

evidence(all_consistent(recommended_weight_range_size_163)).
query(true_val(recommended_weight_range_size_163, w72_90kg)).
query(true_val(recommended_weight_range_size_163, unk_rwr163)).

% @attr recommended_weight_range_size_164df
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (164DF)
% @values w71_100kg=71_100plus_kg_170_220plus_lbs unk_rwr164df=Unknown
% @importance 0.85

0.92::acc(s_merchant, recommended_weight_range_size_164df).

0.93::true_val(recommended_weight_range_size_164df, w71_100kg); 0.07::true_val(recommended_weight_range_size_164df, unk_rwr164df).

measured(s_merchant, recommended_weight_range_size_164df, w71_100kg).

all_consistent(recommended_weight_range_size_164df) :-
    (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size_164df) ; \+indep(s_merchant)).

evidence(all_consistent(recommended_weight_range_size_164df)).
query(true_val(recommended_weight_range_size_164df, w71_100kg)).
query(true_val(recommended_weight_range_size_164df, unk_rwr164df)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 0.875

0.92::acc(s_merchant, shape).
0.87::acc(s38, shape).

0.96::true_val(shape, tapered_directional); 0.04::true_val(shape, unk_shape).

measured(s_merchant, shape, tapered_directional).
measured(s38, shape, tapered_directional).

all_consistent(shape) :-
    (indep(s_merchant), consistent(s_merchant, shape) ; \+indep(s_merchant)),
    (indep(s_christy), consistent(s38, shape) ; \+indep(s_christy)).

evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

% @attr tail_design
% @type categorical
% @canonical false
% @original_name Tail design
% @values swallowtail=Swallowtail_crescent_moon unk_tail_design=Unknown
% @importance 0.725

0.88::acc(s39, tail_design).
0.93::acc(s40, tail_design).

0.96::true_val(tail_design, swallowtail); 0.04::true_val(tail_design, unk_tail_design).

measured(s39, tail_design, swallowtail).
measured(s40, tail_design, swallowtail).

all_consistent(tail_design) :-
    consistent(s39, tail_design),
    consistent(s40, tail_design).

evidence(all_consistent(tail_design)).
query(true_val(tail_design, swallowtail)).
query(true_val(tail_design, unk_tail_design)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values rocker_camber_crc=Rocker_Camber_CRC unk_camber_type=Unknown
% @importance 0.9

0.92::acc(s_merchant, camber_type).
0.87::acc(s41, camber_type).

0.96::true_val(camber_type, rocker_camber_crc); 0.04::true_val(camber_type, unk_camber_type).

measured(s_merchant, camber_type, rocker_camber_crc).
measured(s41, camber_type, rocker_camber_crc).

all_consistent(camber_type) :-
    (indep(s_merchant), consistent(s_merchant, camber_type) ; \+indep(s_merchant)),
    (indep(s_christy), consistent(s41, camber_type) ; \+indep(s_christy)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, rocker_camber_crc)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values rocker_between_camber_under_feet=Rocker_between_bindings_camber_underfoot unk_camber_desc=Unknown
% @importance 0.9

0.85::acc(s42, camber_description).

0.90::true_val(camber_description, rocker_between_camber_under_feet); 0.10::true_val(camber_description, unk_camber_desc).

measured(s42, camber_description, rocker_between_camber_under_feet).

all_consistent(camber_description) :-
    (indep(s_evo), consistent(s42, camber_description) ; \+indep(s_evo)).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, rocker_between_camber_under_feet)).
query(true_val(camber_description, unk_camber_desc)).

% @attr camber_description_asymmetry
% @type categorical
% @canonical false
% @original_name camber_description (asymmetry)
% @values back_more_pronounced=Back_camber_more_pronounced_front_flattens unk_camber_asym=Unknown
% @importance 0.75

0.88::acc(s43, camber_description_asymmetry).
0.88::acc(s44, camber_description_asymmetry).

0.95::true_val(camber_description_asymmetry, back_more_pronounced); 0.05::true_val(camber_description_asymmetry, unk_camber_asym).

measured(s43, camber_description_asymmetry, back_more_pronounced).
measured(s44, camber_description_asymmetry, back_more_pronounced).

all_consistent(camber_description_asymmetry) :-
    consistent(s43, camber_description_asymmetry),
    consistent(s44, camber_description_asymmetry).

evidence(all_consistent(camber_description_asymmetry)).
query(true_val(camber_description_asymmetry, back_more_pronounced)).
query(true_val(camber_description_asymmetry, unk_camber_asym)).

% @attr camber_height_mm
% @type numeric
% @unit mm
% @canonical true
% @original_name camber_height_mm
% @values v10=10.0 unk_camber_height=Unknown
% @importance 0.5

0.90::acc(s45, camber_height_mm).

0.85::true_val(camber_height_mm, v10); 0.15::true_val(camber_height_mm, unk_camber_height).

measured(s45, camber_height_mm, v10).

all_consistent(camber_height_mm) :-
    consistent(s45, camber_height_mm).

evidence(all_consistent(camber_height_mm)).
query(true_val(camber_height_mm, v10)).
query(true_val(camber_height_mm, unk_camber_height)).

% @attr nose_design
% @type categorical
% @canonical false
% @original_name Nose design
% @values early_rise_nose=Early_Rise_Nose unk_nose_design=Unknown
% @importance 0.7

0.85::acc(s46, nose_design).

0.88::true_val(nose_design, early_rise_nose); 0.12::true_val(nose_design, unk_nose_design).

measured(s46, nose_design, early_rise_nose).

all_consistent(nose_design) :-
    (indep(s_evo), consistent(s46, nose_design) ; \+indep(s_evo)).

evidence(all_consistent(nose_design)).
query(true_val(nose_design, early_rise_nose)).
query(true_val(nose_design, unk_nose_design)).

% @attr camber_description_flat_section
% @type categorical
% @canonical false
% @original_name camber_description (flat section)
% @values flat_between_camber_zones=Flat_section_improves_turn_initiation_float unk_camber_flat=Unknown
% @importance 0.6

0.83::acc(s47, camber_description_flat_section).

0.87::true_val(camber_description_flat_section, flat_between_camber_zones); 0.13::true_val(camber_description_flat_section, unk_camber_flat).

measured(s47, camber_description_flat_section, flat_between_camber_zones).

all_consistent(camber_description_flat_section) :-
    (indep(s_evo), consistent(s47, camber_description_flat_section) ; \+indep(s_evo)).

evidence(all_consistent(camber_description_flat_section)).
query(true_val(camber_description_flat_section, flat_between_camber_zones)).
query(true_val(camber_description_flat_section, unk_camber_flat)).

% @attr most_directional_in_lineup
% @type categorical
% @canonical false
% @original_name Most directional board in NS lineup
% @values most_aggressive_taper=Most_aggressive_taper_in_Shaper_Series unk_most_dir=Unknown
% @importance 0.65

0.85::acc(s49, most_directional_in_lineup).

0.87::true_val(most_directional_in_lineup, most_aggressive_taper); 0.13::true_val(most_directional_in_lineup, unk_most_dir).

measured(s49, most_directional_in_lineup, most_aggressive_taper).

all_consistent(most_directional_in_lineup) :-
    consistent(s49, most_directional_in_lineup).

evidence(all_consistent(most_directional_in_lineup)).
query(true_val(most_directional_in_lineup, most_aggressive_taper)).
query(true_val(most_directional_in_lineup, unk_most_dir)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values powersurf_paulownia_poplar_birch=PowerSurf_Paulownia_Poplar_Birch unk_core=Unknown
% @importance 0.75

0.92::acc(s_merchant, core_material).
0.83::acc(s50, core_material).

0.96::true_val(core_material, powersurf_paulownia_poplar_birch); 0.04::true_val(core_material, unk_core).

measured(s_merchant, core_material, powersurf_paulownia_poplar_birch).
measured(s50, core_material, powersurf_paulownia_poplar_birch).

all_consistent(core_material) :-
    (indep(s_merchant), consistent(s_merchant, core_material) ; \+indep(s_merchant)),
    (indep(s_evo), consistent(s50, core_material) ; \+indep(s_evo)).

evidence(all_consistent(core_material)).
query(true_val(core_material, powersurf_paulownia_poplar_birch)).
query(true_val(core_material, unk_core)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values bi_lite_fiberglass=Bi_Lite_Fiberglass unk_laminate=Unknown
% @importance 0.85

0.92::acc(s_merchant, laminate).

0.93::true_val(laminate, bi_lite_fiberglass); 0.07::true_val(laminate, unk_laminate).

measured(s_merchant, laminate, bi_lite_fiberglass).

all_consistent(laminate) :-
    (indep(s_merchant), consistent(s_merchant, laminate) ; \+indep(s_merchant)).

evidence(all_consistent(laminate)).
query(true_val(laminate, bi_lite_fiberglass)).
query(true_val(laminate, unk_laminate)).

% @attr laminate_carbon
% @type categorical
% @canonical false
% @original_name laminate (Carbon Max)
% @values carbon_max=Carbon_Max_Laminate_Technology unk_laminate_carbon=Unknown
% @importance 0.75

0.92::acc(s_merchant, laminate_carbon).
0.80::acc(s51, laminate_carbon).

0.95::true_val(laminate_carbon, carbon_max); 0.05::true_val(laminate_carbon, unk_laminate_carbon).

measured(s_merchant, laminate_carbon, carbon_max).
measured(s51, laminate_carbon, carbon_max).

all_consistent(laminate_carbon) :-
    (indep(s_merchant), consistent(s_merchant, laminate_carbon) ; \+indep(s_merchant)),
    (indep(s_glacier), consistent(s51, laminate_carbon) ; \+indep(s_glacier)).

evidence(all_consistent(laminate_carbon)).
query(true_val(laminate_carbon, carbon_max)).
query(true_val(laminate_carbon, unk_laminate_carbon)).

% @attr laminate_sts
% @type categorical
% @canonical false
% @original_name laminate (STS Pre-Tensioned)
% @values sts_pre_tensioned=STS_Pre_Tensioned_Fiberglass_elastomer_stringers unk_laminate_sts=Unknown
% @importance 0.725

0.92::acc(s_merchant, laminate_sts).
0.80::acc(s52, laminate_sts).

0.95::true_val(laminate_sts, sts_pre_tensioned); 0.05::true_val(laminate_sts, unk_laminate_sts).

measured(s_merchant, laminate_sts, sts_pre_tensioned).
measured(s52, laminate_sts, sts_pre_tensioned).

all_consistent(laminate_sts) :-
    (indep(s_merchant), consistent(s_merchant, laminate_sts) ; \+indep(s_merchant)),
    (indep(s_glacier), consistent(s52, laminate_sts) ; \+indep(s_glacier)).

evidence(all_consistent(laminate_sts)).
query(true_val(laminate_sts, sts_pre_tensioned)).
query(true_val(laminate_sts, unk_laminate_sts)).

% @attr damping_system
% @type categorical
% @canonical false
% @original_name Damping system
% @values triple_layer_rds1=Triple_Layer_RDS1_Underfoot_Stabiliser unk_damping_sys=Unknown
% @importance 0.85

0.92::acc(s_merchant, damping_system).

0.93::true_val(damping_system, triple_layer_rds1); 0.07::true_val(damping_system, unk_damping_sys).

measured(s_merchant, damping_system, triple_layer_rds1).

all_consistent(damping_system) :-
    (indep(s_merchant), consistent(s_merchant, damping_system) ; \+indep(s_merchant)).

evidence(all_consistent(damping_system)).
query(true_val(damping_system, triple_layer_rds1)).
query(true_val(damping_system, unk_damping_sys)).

% @attr damping_detail
% @type categorical
% @canonical false
% @original_name Damping detail
% @values elastomeric_rubber_edge=Elastomeric_rubber_along_effective_edge unk_damping_detail=Unknown
% @importance 0.85

0.92::acc(s_merchant, damping_detail).

0.93::true_val(damping_detail, elastomeric_rubber_edge); 0.07::true_val(damping_detail, unk_damping_detail).

measured(s_merchant, damping_detail, elastomeric_rubber_edge).

all_consistent(damping_detail) :-
    (indep(s_merchant), consistent(s_merchant, damping_detail) ; \+indep(s_merchant)).

evidence(all_consistent(damping_detail)).
query(true_val(damping_detail, elastomeric_rubber_edge)).
query(true_val(damping_detail, unk_damping_detail)).

% @attr underfoot_stabiliser
% @type categorical
% @canonical false
% @original_name Underfoot stabiliser
% @values elastomeric_beneath_mount=Elastomeric_stabilisers_beneath_mounting_area unk_underfoot=Unknown
% @importance 0.85

0.92::acc(s_merchant, underfoot_stabiliser).

0.93::true_val(underfoot_stabiliser, elastomeric_beneath_mount); 0.07::true_val(underfoot_stabiliser, unk_underfoot).

measured(s_merchant, underfoot_stabiliser, elastomeric_beneath_mount).

all_consistent(underfoot_stabiliser) :-
    (indep(s_merchant), consistent(s_merchant, underfoot_stabiliser) ; \+indep(s_merchant)).

evidence(all_consistent(underfoot_stabiliser)).
query(true_val(underfoot_stabiliser, elastomeric_beneath_mount)).
query(true_val(underfoot_stabiliser, unk_underfoot)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values uhmw_pe=UHMW_Sidewalls unk_sidewall=Unknown
% @importance 0.85

0.92::acc(s_merchant, sidewall_material).

0.93::true_val(sidewall_material, uhmw_pe); 0.07::true_val(sidewall_material, unk_sidewall).

measured(s_merchant, sidewall_material, uhmw_pe).

all_consistent(sidewall_material) :-
    (indep(s_merchant), consistent(s_merchant, sidewall_material) ; \+indep(s_merchant)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, uhmw_pe)).
query(true_val(sidewall_material, unk_sidewall)).

% @attr sidewall_advantage
% @type categorical
% @canonical false
% @original_name Sidewall advantage
% @values cold_crack_resistant=More_resistant_to_cracking_in_cold unk_sidewall_adv=Unknown
% @importance 0.6

0.78::acc(s53, sidewall_advantage).
0.76::acc(s54, sidewall_advantage).

0.92::true_val(sidewall_advantage, cold_crack_resistant); 0.08::true_val(sidewall_advantage, unk_sidewall_adv).

measured(s53, sidewall_advantage, cold_crack_resistant).
measured(s54, sidewall_advantage, cold_crack_resistant).

all_consistent(sidewall_advantage) :-
    (indep(s_glacier), consistent(s53, sidewall_advantage) ; \+indep(s_glacier)),
    (indep(s_glacier), consistent(s54, sidewall_advantage) ; \+indep(s_glacier)).

evidence(all_consistent(sidewall_advantage)).
query(true_val(sidewall_advantage, cold_crack_resistant)).
query(true_val(sidewall_advantage, unk_sidewall_adv)).

% @attr edge_technology
% @type categorical
% @canonical false
% @original_name edge_technology
% @values fullwrap_aluminium_tail=Fullwrap_Metal_Edge_Aluminium_Tail unk_edge_tech=Unknown
% @importance 0.85

0.92::acc(s_merchant, edge_technology).

0.93::true_val(edge_technology, fullwrap_aluminium_tail); 0.07::true_val(edge_technology, unk_edge_tech).

measured(s_merchant, edge_technology, fullwrap_aluminium_tail).

all_consistent(edge_technology) :-
    (indep(s_merchant), consistent(s_merchant, edge_technology) ; \+indep(s_merchant)).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, fullwrap_aluminium_tail)).
query(true_val(edge_technology, unk_edge_tech)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values durasurf_xt_sintered_5501=Durasurf_XT_Sintered_5501_graphite unk_base=Unknown
% @importance 0.75

0.92::acc(s_merchant, base_material).
0.80::acc(s55, base_material).

0.95::true_val(base_material, durasurf_xt_sintered_5501); 0.05::true_val(base_material, unk_base).

measured(s_merchant, base_material, durasurf_xt_sintered_5501).
measured(s55, base_material, durasurf_xt_sintered_5501).

all_consistent(base_material) :-
    (indep(s_merchant), consistent(s_merchant, base_material) ; \+indep(s_merchant)),
    (indep(s_glacier), consistent(s55, base_material) ; \+indep(s_glacier)).

evidence(all_consistent(base_material)).
query(true_val(base_material, durasurf_xt_sintered_5501)).
query(true_val(base_material, unk_base)).

% @attr topsheet
% @type categorical
% @canonical false
% @original_name topsheet
% @values coextruded_polymer=Co_Extruded_Polymer_Topsheet unk_topsheet=Unknown
% @importance 0.675

0.92::acc(s_merchant, topsheet).
0.83::acc(s56, topsheet).

0.95::true_val(topsheet, coextruded_polymer); 0.05::true_val(topsheet, unk_topsheet).

measured(s_merchant, topsheet, coextruded_polymer).
measured(s56, topsheet, coextruded_polymer).

all_consistent(topsheet) :-
    (indep(s_merchant), consistent(s_merchant, topsheet) ; \+indep(s_merchant)),
    (indep(s_evo), consistent(s56, topsheet) ; \+indep(s_evo)).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, coextruded_polymer)).
query(true_val(topsheet, unk_topsheet)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting=Unknown
% @importance 0.85

0.92::acc(s_merchant, mounting_pattern).

0.93::true_val(mounting_pattern, inserts_2x4); 0.07::true_val(mounting_pattern, unk_mounting).

measured(s_merchant, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :-
    (indep(s_merchant), consistent(s_merchant, mounting_pattern) ; \+indep(s_merchant)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting)).

% @attr additional_protection
% @type categorical
% @canonical false
% @original_name Additional protection
% @values ptex_nose_tail=P_Tex_Nose_Tail_Protection unk_add_protect=Unknown
% @importance 0.85

0.92::acc(s_merchant, additional_protection).

0.93::true_val(additional_protection, ptex_nose_tail); 0.07::true_val(additional_protection, unk_add_protect).

measured(s_merchant, additional_protection, ptex_nose_tail).

all_consistent(additional_protection) :-
    (indep(s_merchant), consistent(s_merchant, additional_protection) ; \+indep(s_merchant)).

evidence(all_consistent(additional_protection)).
query(true_val(additional_protection, ptex_nose_tail)).
query(true_val(additional_protection, unk_add_protect)).

% @attr flex_rating_10_manufacturer
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10_manufacturer
% @values v7=7.0 unk_flex_mfr=Unknown
% @importance 0.875

0.92::acc(s_merchant, flex_rating_10_manufacturer).
0.87::acc(s57, flex_rating_10_manufacturer).

0.96::true_val(flex_rating_10_manufacturer, v7); 0.04::true_val(flex_rating_10_manufacturer, unk_flex_mfr).

measured(s_merchant, flex_rating_10_manufacturer, v7).
measured(s57, flex_rating_10_manufacturer, v7).

all_consistent(flex_rating_10_manufacturer) :-
    (indep(s_merchant), consistent(s_merchant, flex_rating_10_manufacturer) ; \+indep(s_merchant)),
    (indep(s_christy), consistent(s57, flex_rating_10_manufacturer) ; \+indep(s_christy)).

evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, v7)).
query(true_val(flex_rating_10_manufacturer, unk_flex_mfr)).

% @attr flex_feel
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_feel
% @values v6=6.0 unk_flex_feel=Unknown
% @importance 0.825

0.90::acc(s58, flex_feel).
0.78::acc(s59, flex_feel).

0.92::true_val(flex_feel, v6); 0.08::true_val(flex_feel, unk_flex_feel).

measured(s58, flex_feel, v6).
measured(s59, flex_feel, v6).

all_consistent(flex_feel) :-
    consistent(s58, flex_feel),
    (indep(s_christy), consistent(s59, flex_feel) ; \+indep(s_christy)).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, v6)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr flex_direction
% @type categorical
% @canonical false
% @original_name flex_direction
% @values directional_tail_stiffer=Directional_tail_stiffer_than_nose unk_flex_dir=Unknown
% @importance 0.75

0.88::acc(s60, flex_direction).

0.88::true_val(flex_direction, directional_tail_stiffer); 0.12::true_val(flex_direction, unk_flex_dir).

measured(s60, flex_direction, directional_tail_stiffer).

all_consistent(flex_direction) :-
    consistent(s60, flex_direction).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional_tail_stiffer)).
query(true_val(flex_direction, unk_flex_dir)).

% @attr torsional_flex
% @type categorical
% @canonical false
% @original_name Torsional flex
% @values easy_going=Easy_going_not_stiff unk_torsional=Unknown
% @importance 0.7

0.85::acc(s61, torsional_flex).

0.85::true_val(torsional_flex, easy_going); 0.15::true_val(torsional_flex, unk_torsional).

measured(s61, torsional_flex, easy_going).

all_consistent(torsional_flex) :-
    consistent(s61, torsional_flex).

evidence(all_consistent(torsional_flex)).
query(true_val(torsional_flex, easy_going)).
query(true_val(torsional_flex, unk_torsional)).

% @attr dampness_rating
% @type numeric
% @unit /10
% @canonical false
% @original_name Dampness rating
% @values v8=8.0 v6=6.0
% @importance 0.7

0.82::acc(s62, dampness_rating).
0.90::acc(s63, dampness_rating).

0.40::true_val(dampness_rating, v8); 0.60::true_val(dampness_rating, v6).

measured(s62, dampness_rating, v8).
measured(s63, dampness_rating, v6).

all_consistent(dampness_rating) :-
    (indep(s_christy), consistent(s62, dampness_rating) ; \+indep(s_christy)),
    consistent(s63, dampness_rating).

evidence(all_consistent(dampness_rating)).
query(true_val(dampness_rating, v8)).
query(true_val(dampness_rating, v6)).

% @attr buttering
% @type categorical
% @canonical false
% @original_name Buttering
% @values moderate=Moderate unk_buttering=Unknown
% @importance 0.5

0.85::acc(s64, buttering).

0.85::true_val(buttering, moderate); 0.15::true_val(buttering, unk_buttering).

measured(s64, buttering, moderate).

all_consistent(buttering) :-
    consistent(s64, buttering).

evidence(all_consistent(buttering)).
query(true_val(buttering, moderate)).
query(true_val(buttering, unk_buttering)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values powder_freeride_am_groomers=Powder_Freeride_AllMountain_Groomers unk_terrain=Unknown
% @importance 0.85

0.92::acc(s_merchant, terrain_suitability).

0.93::true_val(terrain_suitability, powder_freeride_am_groomers); 0.07::true_val(terrain_suitability, unk_terrain).

measured(s_merchant, terrain_suitability, powder_freeride_am_groomers).

all_consistent(terrain_suitability) :-
    (indep(s_merchant), consistent(s_merchant, terrain_suitability) ; \+indep(s_merchant)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, powder_freeride_am_groomers)).
query(true_val(terrain_suitability, unk_terrain)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values powder_surfing_carving_charging=Powder_surfing_carving_groomers_charging unk_riding_style=Unknown
% @importance 0.85

0.92::acc(s_merchant, riding_style).

0.93::true_val(riding_style, powder_surfing_carving_charging); 0.07::true_val(riding_style, unk_riding_style).

measured(s_merchant, riding_style, powder_surfing_carving_charging).

all_consistent(riding_style) :-
    (indep(s_merchant), consistent(s_merchant, riding_style) ; \+indep(s_merchant)).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, powder_surfing_carving_charging)).
query(true_val(riding_style, unk_riding_style)).

% @attr terrain_suitability_powder
% @type categorical
% @canonical false
% @original_name terrain_suitability (deep powder)
% @values deep_powder_storm_chasing=Deep_powder_days_storm_chasing unk_terrain_pow=Unknown
% @importance 0.75

0.90::acc(s65, terrain_suitability_powder).

0.90::true_val(terrain_suitability_powder, deep_powder_storm_chasing); 0.10::true_val(terrain_suitability_powder, unk_terrain_pow).

measured(s65, terrain_suitability_powder, deep_powder_storm_chasing).

all_consistent(terrain_suitability_powder) :-
    consistent(s65, terrain_suitability_powder).

evidence(all_consistent(terrain_suitability_powder)).
query(true_val(terrain_suitability_powder, deep_powder_storm_chasing)).
query(true_val(terrain_suitability_powder, unk_terrain_pow)).

% @attr terrain_suitability_trees
% @type categorical
% @canonical false
% @original_name terrain_suitability (trees)
% @values tree_riding_powder_hunting=Tree_riding_and_powder_hunting unk_terrain_trees=Unknown
% @importance 0.85

0.88::acc(s66, terrain_suitability_trees).

0.88::true_val(terrain_suitability_trees, tree_riding_powder_hunting); 0.12::true_val(terrain_suitability_trees, unk_terrain_trees).

measured(s66, terrain_suitability_trees, tree_riding_powder_hunting).

all_consistent(terrain_suitability_trees) :-
    consistent(s66, terrain_suitability_trees).

evidence(all_consistent(terrain_suitability_trees)).
query(true_val(terrain_suitability_trees, tree_riding_powder_hunting)).
query(true_val(terrain_suitability_trees, unk_terrain_trees)).

% @attr terrain_suitability_groomers
% @type categorical
% @canonical false
% @original_name terrain_suitability (groomers)
% @values groomer_carving_moderate=Groomer_carving_at_moderate_speeds unk_terrain_groom=Unknown
% @importance 0.8

0.88::acc(s67, terrain_suitability_groomers).

0.88::true_val(terrain_suitability_groomers, groomer_carving_moderate); 0.12::true_val(terrain_suitability_groomers, unk_terrain_groom).

measured(s67, terrain_suitability_groomers, groomer_carving_moderate).

all_consistent(terrain_suitability_groomers) :-
    consistent(s67, terrain_suitability_groomers).

evidence(all_consistent(terrain_suitability_groomers)).
query(true_val(terrain_suitability_groomers, groomer_carving_moderate)).
query(true_val(terrain_suitability_groomers, unk_terrain_groom)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate_to_expert=Intermediate_to_Expert beginner_to_expert=Beginner_to_Expert
% @importance 0.825

0.87::acc(s68, rider_level).
0.85::acc(s69, rider_level).

0.55::true_val(rider_level, intermediate_to_expert); 0.45::true_val(rider_level, beginner_to_expert).

measured(s68, rider_level, intermediate_to_expert).
measured(s69, rider_level, beginner_to_expert).

all_consistent(rider_level) :-
    consistent(s68, rider_level),
    consistent(s69, rider_level).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate_to_expert)).
query(true_val(rider_level, beginner_to_expert)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values poor=Poor unk_switch=Unknown
% @importance 0.77

0.88::acc(s70, switch_riding).
0.88::acc(s71, switch_riding).
0.88::acc(s72, switch_riding).

0.96::true_val(switch_riding, poor); 0.04::true_val(switch_riding, unk_switch).

measured(s70, switch_riding, poor).
measured(s71, switch_riding, poor).
measured(s72, switch_riding, poor).

all_consistent(switch_riding) :-
    consistent(s70, switch_riding),
    consistent(s71, switch_riding),
    consistent(s72, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, poor)).
query(true_val(switch_riding, unk_switch)).

% @attr powder_rating_tgr
% @type categorical
% @canonical true
% @original_name powder_rating_tgr
% @values great=Great unk_powder_tgr=Unknown
% @importance 0.9

0.88::acc(s72a, powder_rating_tgr).

0.90::true_val(powder_rating_tgr, great); 0.10::true_val(powder_rating_tgr, unk_powder_tgr).

measured(s72a, powder_rating_tgr, great).

all_consistent(powder_rating_tgr) :-
    consistent(s72a, powder_rating_tgr).

evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, great)).
query(true_val(powder_rating_tgr, unk_powder_tgr)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values great=Great unk_base_glide=Unknown
% @importance 0.9

0.88::acc(s72b, base_glide_performance).

0.90::true_val(base_glide_performance, great); 0.10::true_val(base_glide_performance, unk_base_glide).

measured(s72b, base_glide_performance, great).

all_consistent(base_glide_performance) :-
    consistent(s72b, base_glide_performance).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, great)).
query(true_val(base_glide_performance, unk_base_glide)).

% @attr carving_rating_tgr
% @type categorical
% @canonical true
% @original_name carving_rating_tgr
% @values good=Good unk_carving_tgr=Unknown
% @importance 0.9

0.88::acc(s72c, carving_rating_tgr).

0.90::true_val(carving_rating_tgr, good); 0.10::true_val(carving_rating_tgr, unk_carving_tgr).

measured(s72c, carving_rating_tgr, good).

all_consistent(carving_rating_tgr) :-
    consistent(s72c, carving_rating_tgr).

evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, good)).
query(true_val(carving_rating_tgr, unk_carving_tgr)).

% @attr speed_rating_tgr
% @type categorical
% @canonical true
% @original_name speed_rating_tgr
% @values good=Good unk_speed_tgr=Unknown
% @importance 0.9

0.88::acc(s72d, speed_rating_tgr).

0.90::true_val(speed_rating_tgr, good); 0.10::true_val(speed_rating_tgr, unk_speed_tgr).

measured(s72d, speed_rating_tgr, good).

all_consistent(speed_rating_tgr) :-
    consistent(s72d, speed_rating_tgr).

evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, good)).
query(true_val(speed_rating_tgr, unk_speed_tgr)).

% @attr uneven_snow_rating
% @type categorical
% @canonical false
% @original_name Uneven snow
% @values great=Great unk_uneven_snow=Unknown
% @importance 0.9

0.88::acc(s72e, uneven_snow_rating).

0.90::true_val(uneven_snow_rating, great); 0.10::true_val(uneven_snow_rating, unk_uneven_snow).

measured(s72e, uneven_snow_rating, great).

all_consistent(uneven_snow_rating) :-
    consistent(s72e, uneven_snow_rating).

evidence(all_consistent(uneven_snow_rating)).
query(true_val(uneven_snow_rating, great)).
query(true_val(uneven_snow_rating, unk_uneven_snow)).

% @attr jumps_rating_tgr
% @type categorical
% @canonical true
% @original_name jumps_rating_tgr
% @values good=Good unk_jumps_tgr=Unknown
% @importance 0.9

0.88::acc(s72f, jumps_rating_tgr).

0.90::true_val(jumps_rating_tgr, good); 0.10::true_val(jumps_rating_tgr, unk_jumps_tgr).

measured(s72f, jumps_rating_tgr, good).

all_consistent(jumps_rating_tgr) :-
    consistent(s72f, jumps_rating_tgr).

evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, good)).
query(true_val(jumps_rating_tgr, unk_jumps_tgr)).

% @attr on_snow_feel_tgr
% @type categorical
% @canonical true
% @original_name on_snow_feel_tgr
% @values semi_stable=Semi_Stable unk_on_snow_feel=Unknown
% @importance 0.9

0.88::acc(s72g, on_snow_feel_tgr).

0.90::true_val(on_snow_feel_tgr, semi_stable); 0.10::true_val(on_snow_feel_tgr, unk_on_snow_feel).

measured(s72g, on_snow_feel_tgr, semi_stable).

all_consistent(on_snow_feel_tgr) :-
    consistent(s72g, on_snow_feel_tgr).

evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, semi_stable)).
query(true_val(on_snow_feel_tgr, unk_on_snow_feel)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values medium_fast=Medium_Fast unk_turn_init=Unknown
% @importance 0.9

0.88::acc(s72h, turn_initiation_performance).

0.90::true_val(turn_initiation_performance, medium_fast); 0.10::true_val(turn_initiation_performance, unk_turn_init).

measured(s72h, turn_initiation_performance, medium_fast).

all_consistent(turn_initiation_performance) :-
    consistent(s72h, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, medium_fast)).
query(true_val(turn_initiation_performance, unk_turn_init)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values hard_snow=Hard_Snow unk_edge_hold=Unknown
% @importance 0.825

0.88::acc(s72i, edge_hold).
0.85::acc(s73, edge_hold).

0.92::true_val(edge_hold, hard_snow); 0.08::true_val(edge_hold, unk_edge_hold).

measured(s72i, edge_hold, hard_snow).
measured(s73, edge_hold, hard_snow).

all_consistent(edge_hold) :-
    consistent(s72i, edge_hold),
    consistent(s73, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, hard_snow)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr overall_rating_snowboardingprofiles
% @type numeric
% @unit /100
% @canonical true
% @original_name overall_rating_snowboardingprofiles
% @values v92_8=92.8 unk_overall_rating=Unknown
% @importance 0.9

0.90::acc(s74, overall_rating_snowboardingprofiles).

0.90::true_val(overall_rating_snowboardingprofiles, v92_8); 0.10::true_val(overall_rating_snowboardingprofiles, unk_overall_rating).

measured(s74, overall_rating_snowboardingprofiles, v92_8).

all_consistent(overall_rating_snowboardingprofiles) :-
    consistent(s74, overall_rating_snowboardingprofiles).

evidence(all_consistent(overall_rating_snowboardingprofiles)).
query(true_val(overall_rating_snowboardingprofiles, v92_8)).
query(true_val(overall_rating_snowboardingprofiles, unk_overall_rating)).

% @attr overall_ranking_snowboardingprofiles
% @type categorical
% @canonical false
% @original_name overall_rating_snowboardingprofiles (ranking)
% @values first_of_28=1st_out_of_28_mellow_freeride unk_ranking=Unknown
% @importance 0.9

0.90::acc(s74b, overall_ranking_snowboardingprofiles).

0.90::true_val(overall_ranking_snowboardingprofiles, first_of_28); 0.10::true_val(overall_ranking_snowboardingprofiles, unk_ranking).

measured(s74b, overall_ranking_snowboardingprofiles, first_of_28).

all_consistent(overall_ranking_snowboardingprofiles) :-
    consistent(s74b, overall_ranking_snowboardingprofiles).

evidence(all_consistent(overall_ranking_snowboardingprofiles)).
query(true_val(overall_ranking_snowboardingprofiles, first_of_28)).
query(true_val(overall_ranking_snowboardingprofiles, unk_ranking)).

% @attr powder_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical true
% @original_name powder_score_snowboardingprofiles
% @values v4_5=4.5 unk_powder_score=Unknown
% @importance 0.9

0.90::acc(s74c, powder_score_snowboardingprofiles).

0.90::true_val(powder_score_snowboardingprofiles, v4_5); 0.10::true_val(powder_score_snowboardingprofiles, unk_powder_score).

measured(s74c, powder_score_snowboardingprofiles, v4_5).

all_consistent(powder_score_snowboardingprofiles) :-
    consistent(s74c, powder_score_snowboardingprofiles).

evidence(all_consistent(powder_score_snowboardingprofiles)).
query(true_val(powder_score_snowboardingprofiles, v4_5)).
query(true_val(powder_score_snowboardingprofiles, unk_powder_score)).

% @attr turns_score
% @type numeric
% @unit /5
% @canonical false
% @original_name Turns score
% @values v5=5.0 unk_turns_score=Unknown
% @importance 0.9

0.90::acc(s74d, turns_score).

0.90::true_val(turns_score, v5); 0.10::true_val(turns_score, unk_turns_score).

measured(s74d, turns_score, v5).

all_consistent(turns_score) :-
    consistent(s74d, turns_score).

evidence(all_consistent(turns_score)).
query(true_val(turns_score, v5)).
query(true_val(turns_score, unk_turns_score)).

% @attr trees_score
% @type numeric
% @unit /5
% @canonical false
% @original_name Trees score
% @values v5=5.0 unk_trees_score=Unknown
% @importance 0.9

0.90::acc(s74e, trees_score).

0.90::true_val(trees_score, v5); 0.10::true_val(trees_score, unk_trees_score).

measured(s74e, trees_score, v5).

all_consistent(trees_score) :-
    consistent(s74e, trees_score).

evidence(all_consistent(trees_score)).
query(true_val(trees_score, v5)).
query(true_val(trees_score, unk_trees_score)).

% @attr carving_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical true
% @original_name carving_score_snowboardingprofiles
% @values v4=4.0 unk_carving_score=Unknown
% @importance 0.9

0.90::acc(s74f, carving_score_snowboardingprofiles).

0.90::true_val(carving_score_snowboardingprofiles, v4); 0.10::true_val(carving_score_snowboardingprofiles, unk_carving_score).

measured(s74f, carving_score_snowboardingprofiles, v4).

all_consistent(carving_score_snowboardingprofiles) :-
    consistent(s74f, carving_score_snowboardingprofiles).

evidence(all_consistent(carving_score_snowboardingprofiles)).
query(true_val(carving_score_snowboardingprofiles, v4)).
query(true_val(carving_score_snowboardingprofiles, unk_carving_score)).

% @attr crud_score
% @type numeric
% @unit /5
% @canonical false
% @original_name Crud score
% @values v3_5=3.5 unk_crud_score=Unknown
% @importance 0.9

0.90::acc(s74g, crud_score).

0.90::true_val(crud_score, v3_5); 0.10::true_val(crud_score, unk_crud_score).

measured(s74g, crud_score, v3_5).

all_consistent(crud_score) :-
    consistent(s74g, crud_score).

evidence(all_consistent(crud_score)).
query(true_val(crud_score, v3_5)).
query(true_val(crud_score, unk_crud_score)).

% @attr speed_score
% @type numeric
% @unit /5
% @canonical false
% @original_name Speed score
% @values v3_5=3.5 unk_speed_score=Unknown
% @importance 0.9

0.90::acc(s74h, speed_score).

0.90::true_val(speed_score, v3_5); 0.10::true_val(speed_score, unk_speed_score).

measured(s74h, speed_score, v3_5).

all_consistent(speed_score) :-
    consistent(s74h, speed_score).

evidence(all_consistent(speed_score)).
query(true_val(speed_score, v3_5)).
query(true_val(speed_score, unk_speed_score)).

% @attr jumps_score
% @type numeric
% @unit /5
% @canonical false
% @original_name Jumps score
% @values v3_5=3.5 unk_jumps_score=Unknown
% @importance 0.9

0.90::acc(s74i, jumps_score).

0.90::true_val(jumps_score, v3_5); 0.10::true_val(jumps_score, unk_jumps_score).

measured(s74i, jumps_score, v3_5).

all_consistent(jumps_score) :-
    consistent(s74i, jumps_score).

evidence(all_consistent(jumps_score)).
query(true_val(jumps_score, v3_5)).
query(true_val(jumps_score, unk_jumps_score)).

% @attr switch_score
% @type numeric
% @unit /5
% @canonical false
% @original_name Switch score
% @values v1=1.0 unk_switch_score=Unknown
% @importance 0.9

0.90::acc(s74j, switch_score).

0.90::true_val(switch_score, v1); 0.10::true_val(switch_score, unk_switch_score).

measured(s74j, switch_score, v1).

all_consistent(switch_score) :-
    consistent(s74j, switch_score).

evidence(all_consistent(switch_score)).
query(true_val(switch_score, v1)).
query(true_val(switch_score, unk_switch_score)).

% @attr board_weight_grams
% @type numeric
% @unit g
% @canonical true
% @original_name board_weight_grams
% @values v3140=3140.0 unk_weight=Unknown
% @importance 0.7

0.93::acc(s75, board_weight_grams).

0.90::true_val(board_weight_grams, v3140); 0.10::true_val(board_weight_grams, unk_weight).

measured(s75, board_weight_grams, v3140).

all_consistent(board_weight_grams) :-
    consistent(s75, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v3140)).
query(true_val(board_weight_grams, unk_weight)).

% @attr weight_per_cm
% @type numeric
% @unit g/cm
% @canonical false
% @original_name weight_per_cm
% @values v19_87=19.87 unk_wpc=Unknown
% @importance 0.7

0.93::acc(s75b, weight_per_cm).

0.90::true_val(weight_per_cm, v19_87); 0.10::true_val(weight_per_cm, unk_wpc).

measured(s75b, weight_per_cm, v19_87).

all_consistent(weight_per_cm) :-
    consistent(s75b, weight_per_cm).

evidence(all_consistent(weight_per_cm)).
query(true_val(weight_per_cm, v19_87)).
query(true_val(weight_per_cm, unk_wpc)).

% @attr on_snow_weight_feel
% @type categorical
% @canonical false
% @original_name On-snow weight feel
% @values feels_normal=Feels_normal unk_weight_feel=Unknown
% @importance 0.575

0.83::acc(s76, on_snow_weight_feel).
0.85::acc(s77, on_snow_weight_feel).

0.93::true_val(on_snow_weight_feel, feels_normal); 0.07::true_val(on_snow_weight_feel, unk_weight_feel).

measured(s76, on_snow_weight_feel, feels_normal).
measured(s77, on_snow_weight_feel, feels_normal).

all_consistent(on_snow_weight_feel) :-
    consistent(s76, on_snow_weight_feel),
    consistent(s77, on_snow_weight_feel).

evidence(all_consistent(on_snow_weight_feel)).
query(true_val(on_snow_weight_feel, feels_normal)).
query(true_val(on_snow_weight_feel, unk_weight_feel)).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v699_99=699.99 unk_msrp=Unknown
% @importance 0.95

0.97::acc(s78, price_usd_msrp).

0.97::true_val(price_usd_msrp, v699_99); 0.03::true_val(price_usd_msrp, unk_msrp).

measured(s78, price_usd_msrp, v699_99).

all_consistent(price_usd_msrp) :-
    consistent(s78, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v699_99)).
query(true_val(price_usd_msrp, unk_msrp)).

% @attr price_usd_ns_sale
% @type numeric
% @unit USD
% @canonical false
% @original_name MSRP sale price (neversummer.com)
% @values v559_99=559.99 unk_ns_sale=Unknown
% @importance 0.9

0.95::acc(s79, price_usd_ns_sale).

0.95::true_val(price_usd_ns_sale, v559_99); 0.05::true_val(price_usd_ns_sale, unk_ns_sale).

measured(s79, price_usd_ns_sale, v559_99).

all_consistent(price_usd_ns_sale) :-
    consistent(s79, price_usd_ns_sale).

evidence(all_consistent(price_usd_ns_sale)).
query(true_val(price_usd_ns_sale, v559_99)).
query(true_val(price_usd_ns_sale, unk_ns_sale)).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v1049_99=1049.99 unk_aud=Unknown
% @importance 0.85

0.95::acc(s_merchant, price_aud_merchant).

0.95::true_val(price_aud_merchant, v1049_99); 0.05::true_val(price_aud_merchant, unk_aud).

measured(s_merchant, price_aud_merchant, v1049_99).

all_consistent(price_aud_merchant) :-
    consistent(s_merchant, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v1049_99)).
query(true_val(price_aud_merchant, unk_aud)).

% @attr price_usd_christy
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at Christy Sports
% @values v559_99=559.99 unk_christy_price=Unknown
% @importance 0.9

0.78::acc(s80, price_usd_christy).

0.82::true_val(price_usd_christy, v559_99); 0.18::true_val(price_usd_christy, unk_christy_price).

measured(s80, price_usd_christy, v559_99).

all_consistent(price_usd_christy) :-
    consistent(s80, price_usd_christy).

evidence(all_consistent(price_usd_christy)).
query(true_val(price_usd_christy, v559_99)).
query(true_val(price_usd_christy, unk_christy_price)).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_evo
% @values v559_99=559.99 unk_evo_price=Unknown
% @importance 0.85

0.85::acc(s81, price_usd_evo).

0.88::true_val(price_usd_evo, v559_99); 0.12::true_val(price_usd_evo, unk_evo_price).

measured(s81, price_usd_evo, v559_99).

all_consistent(price_usd_evo) :-
    consistent(s81, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v559_99)).
query(true_val(price_usd_evo, unk_evo_price)).

% @attr price_usd_blauer
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at Blauer Board Shop
% @values v559_99=559.99 unk_blauer_price=Unknown
% @importance 0.85

0.78::acc(s82, price_usd_blauer).

0.82::true_val(price_usd_blauer, v559_99); 0.18::true_val(price_usd_blauer, unk_blauer_price).

measured(s82, price_usd_blauer, v559_99).

all_consistent(price_usd_blauer) :-
    consistent(s82, price_usd_blauer).

evidence(all_consistent(price_usd_blauer)).
query(true_val(price_usd_blauer, v559_99)).
query(true_val(price_usd_blauer, unk_blauer_price)).

% @attr price_usd_glacier
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at Glacier Ski Shop
% @values v699=699.0 unk_glacier_price=Unknown
% @importance 0.85

0.80::acc(s83, price_usd_glacier).

0.83::true_val(price_usd_glacier, v699); 0.17::true_val(price_usd_glacier, unk_glacier_price).

measured(s83, price_usd_glacier, v699).

all_consistent(price_usd_glacier) :-
    consistent(s83, price_usd_glacier).

evidence(all_consistent(price_usd_glacier)).
query(true_val(price_usd_glacier, v699)).
query(true_val(price_usd_glacier, unk_glacier_price)).

% @attr price_eur_snowcountry
% @type numeric
% @unit EUR
% @canonical false
% @original_name Price at SnowCountry (EU)
% @values v659=659.0 unk_eu_price=Unknown
% @importance 0.8

0.75::acc(s84, price_eur_snowcountry).

0.78::true_val(price_eur_snowcountry, v659); 0.22::true_val(price_eur_snowcountry, unk_eu_price).

measured(s84, price_eur_snowcountry, v659).

all_consistent(price_eur_snowcountry) :-
    consistent(s84, price_eur_snowcountry).

evidence(all_consistent(price_eur_snowcountry)).
query(true_val(price_eur_snowcountry, v659)).
query(true_val(price_eur_snowcountry, unk_eu_price)).

% @attr price_eur_snowcountry_alt
% @type numeric
% @unit EUR
% @canonical false
% @original_name Price at SnowCountry (EU, also listed as)
% @values v649_98=649.98 unk_eu_alt=Unknown
% @importance 0.7

0.72::acc(s85, price_eur_snowcountry_alt).

0.75::true_val(price_eur_snowcountry_alt, v649_98); 0.25::true_val(price_eur_snowcountry_alt, unk_eu_alt).

measured(s85, price_eur_snowcountry_alt, v649_98).

all_consistent(price_eur_snowcountry_alt) :-
    consistent(s85, price_eur_snowcountry_alt).

evidence(all_consistent(price_eur_snowcountry_alt)).
query(true_val(price_eur_snowcountry_alt, v649_98)).
query(true_val(price_eur_snowcountry_alt, unk_eu_alt)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values in_stock_free_shipping=In_stock_free_shipping unk_avail_ns=Unknown
% @importance 0.85

0.93::acc(s86, availability_status).

0.92::true_val(availability_status, in_stock_free_shipping); 0.08::true_val(availability_status, unk_avail_ns).

measured(s86, availability_status, in_stock_free_shipping).

all_consistent(availability_status) :-
    consistent(s86, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, in_stock_free_shipping)).
query(true_val(availability_status, unk_avail_ns)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status (evo)
% @values in_stock=In_stock unk_avail_evo=Unknown
% @importance 0.85

0.85::acc(s87, availability_status_evo).

0.88::true_val(availability_status_evo, in_stock); 0.12::true_val(availability_status_evo, unk_avail_evo).

measured(s87, availability_status_evo, in_stock).

all_consistent(availability_status_evo) :-
    consistent(s87, availability_status_evo).

evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, in_stock)).
query(true_val(availability_status_evo, unk_avail_evo)).

% @attr availability_status_christy
% @type categorical
% @canonical false
% @original_name availability_status (Christy Sports)
% @values available_low_inventory=Available_153_158_163_low_inventory unk_avail_christy=Unknown
% @importance 0.85

0.85::acc(s88, availability_status_christy).

0.88::true_val(availability_status_christy, available_low_inventory); 0.12::true_val(availability_status_christy, unk_avail_christy).

measured(s88, availability_status_christy, available_low_inventory).

all_consistent(availability_status_christy) :-
    consistent(s88, availability_status_christy).

evidence(all_consistent(availability_status_christy)).
query(true_val(availability_status_christy, available_low_inventory)).
query(true_val(availability_status_christy, unk_avail_christy)).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status (Blauer)
% @values available=Available unk_avail_blauer=Unknown
% @importance 0.8

0.78::acc(s89, availability_status_blauer).

0.82::true_val(availability_status_blauer, available); 0.18::true_val(availability_status_blauer, unk_avail_blauer).

measured(s89, availability_status_blauer, available).

all_consistent(availability_status_blauer) :-
    consistent(s89, availability_status_blauer).

evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, available)).
query(true_val(availability_status_blauer, unk_avail_blauer)).

% @attr availability_status_glacier
% @type categorical
% @canonical false
% @original_name availability_status (Glacier)
% @values available=Available unk_avail_glacier=Unknown
% @importance 0.85

0.80::acc(s83b, availability_status_glacier).

0.83::true_val(availability_status_glacier, available); 0.17::true_val(availability_status_glacier, unk_avail_glacier).

measured(s83b, availability_status_glacier, available).

all_consistent(availability_status_glacier) :-
    consistent(s83b, availability_status_glacier).

evidence(all_consistent(availability_status_glacier)).
query(true_val(availability_status_glacier, available)).
query(true_val(availability_status_glacier, unk_avail_glacier)).

% @attr availability_status_ski_ess
% @type categorical
% @canonical false
% @original_name availability_status (Ski Essentials)
% @values listed_for_sale=Listed_for_sale unk_avail_ski=Unknown
% @importance 0.8

0.80::acc(s90, availability_status_ski_ess).

0.82::true_val(availability_status_ski_ess, listed_for_sale); 0.18::true_val(availability_status_ski_ess, unk_avail_ski).

measured(s90, availability_status_ski_ess, listed_for_sale).

all_consistent(availability_status_ski_ess) :-
    consistent(s90, availability_status_ski_ess).

evidence(all_consistent(availability_status_ski_ess)).
query(true_val(availability_status_ski_ess, listed_for_sale)).
query(true_val(availability_status_ski_ess, unk_avail_ski)).

% @attr availability_status_intl
% @type categorical
% @canonical false
% @original_name availability_status (international)
% @values not_direct_must_import=Not_directly_sold_must_import unk_avail_intl=Unknown
% @importance 0.5

0.62::acc(s91, availability_status_intl).

0.65::true_val(availability_status_intl, not_direct_must_import); 0.35::true_val(availability_status_intl, unk_avail_intl).

measured(s91, availability_status_intl, not_direct_must_import).

all_consistent(availability_status_intl) :-
    consistent(s91, availability_status_intl).

evidence(all_consistent(availability_status_intl)).
query(true_val(availability_status_intl, not_direct_must_import)).
query(true_val(availability_status_intl, unk_avail_intl)).

% @attr retailer_evo_info
% @type categorical
% @canonical false
% @original_name evo.com
% @values major_retailer_price_match=Major_retailer_1yr_returns_price_guarantee unk_evo_info=Unknown
% @importance 0.6

0.83::acc(s92, retailer_evo_info).

0.85::true_val(retailer_evo_info, major_retailer_price_match); 0.15::true_val(retailer_evo_info, unk_evo_info).

measured(s92, retailer_evo_info, major_retailer_price_match).

all_consistent(retailer_evo_info) :-
    consistent(s92, retailer_evo_info).

evidence(all_consistent(retailer_evo_info)).
query(true_val(retailer_evo_info, major_retailer_price_match)).
query(true_val(retailer_evo_info, unk_evo_info)).

% @attr retailer_christy_info
% @type categorical
% @canonical false
% @original_name Christy Sports
% @values co_chain_365_returns=Colorado_chain_365plus2_day_returns_price_match unk_christy_info=Unknown
% @importance 0.55

0.83::acc(s93, retailer_christy_info).

0.85::true_val(retailer_christy_info, co_chain_365_returns); 0.15::true_val(retailer_christy_info, unk_christy_info).

measured(s93, retailer_christy_info, co_chain_365_returns).

all_consistent(retailer_christy_info) :-
    consistent(s93, retailer_christy_info).

evidence(all_consistent(retailer_christy_info)).
query(true_val(retailer_christy_info, co_chain_365_returns)).
query(true_val(retailer_christy_info, unk_christy_info)).

% @attr retailer_blauer_info
% @type categorical
% @canonical false
% @original_name Blauer Board Shop
% @values specialty_shop_recommended=Specialty_shop_recommended_by_TGR unk_blauer_info=Unknown
% @importance 0.85

0.78::acc(s82b, retailer_blauer_info).

0.80::true_val(retailer_blauer_info, specialty_shop_recommended); 0.20::true_val(retailer_blauer_info, unk_blauer_info).

measured(s82b, retailer_blauer_info, specialty_shop_recommended).

all_consistent(retailer_blauer_info) :-
    consistent(s82b, retailer_blauer_info).

evidence(all_consistent(retailer_blauer_info)).
query(true_val(retailer_blauer_info, specialty_shop_recommended)).
query(true_val(retailer_blauer_info, unk_blauer_info)).

% @attr retailer_glacier_info
% @type categorical
% @canonical false
% @original_name Glacier Ski Shop
% @values specialty_daily_service=Specialty_retailer_daily_service_free_shipping unk_glacier_info=Unknown
% @importance 0.4

0.75::acc(s94, retailer_glacier_info).

0.78::true_val(retailer_glacier_info, specialty_daily_service); 0.22::true_val(retailer_glacier_info, unk_glacier_info).

measured(s94, retailer_glacier_info, specialty_daily_service).

all_consistent(retailer_glacier_info) :-
    consistent(s94, retailer_glacier_info).

evidence(all_consistent(retailer_glacier_info)).
query(true_val(retailer_glacier_info, specialty_daily_service)).
query(true_val(retailer_glacier_info, unk_glacier_info)).

% @attr retailer_ns_direct_info
% @type categorical
% @canonical false
% @original_name Never Summer direct
% @values mfr_store_free_ship_rewards=Manufacturer_store_free_shipping_Fresh_Tracks unk_ns_direct=Unknown
% @importance 0.85

0.93::acc(s86b, retailer_ns_direct_info).

0.93::true_val(retailer_ns_direct_info, mfr_store_free_ship_rewards); 0.07::true_val(retailer_ns_direct_info, unk_ns_direct).

measured(s86b, retailer_ns_direct_info, mfr_store_free_ship_rewards).

all_consistent(retailer_ns_direct_info) :-
    consistent(s86b, retailer_ns_direct_info).

evidence(all_consistent(retailer_ns_direct_info)).
query(true_val(retailer_ns_direct_info, mfr_store_free_ship_rewards)).
query(true_val(retailer_ns_direct_info, unk_ns_direct)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values powder_float_effortless=Powder_float_universally_praised_effortless unk_pos1=Unknown
% @importance 0.85

0.65::acc(s95, positive_aspect).
0.87::acc(s96, positive_aspect).

0.92::true_val(positive_aspect, powder_float_effortless); 0.08::true_val(positive_aspect, unk_pos1).

measured(s95, positive_aspect, powder_float_effortless).
measured(s96, positive_aspect, powder_float_effortless).

all_consistent(positive_aspect) :-
    consistent(s95, positive_aspect),
    consistent(s96, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, powder_float_effortless)).
query(true_val(positive_aspect, unk_pos1)).

% @attr positive_aspect_trees
% @type categorical
% @canonical false
% @original_name positive_aspect (trees)
% @values perfect_for_trees=About_as_perfect_as_it_gets_for_trees unk_pos_trees=Unknown
% @importance 0.85

0.85::acc(s97, positive_aspect_trees).

0.85::true_val(positive_aspect_trees, perfect_for_trees); 0.15::true_val(positive_aspect_trees, unk_pos_trees).

measured(s97, positive_aspect_trees, perfect_for_trees).

all_consistent(positive_aspect_trees) :-
    consistent(s97, positive_aspect_trees).

evidence(all_consistent(positive_aspect_trees)).
query(true_val(positive_aspect_trees, perfect_for_trees)).
query(true_val(positive_aspect_trees, unk_pos_trees)).

% @attr positive_aspect_versatility
% @type categorical
% @canonical false
% @original_name positive_aspect (quiver killer)
% @values quiver_killer=Quiver_killer_capable_daily_driver unk_pos_versa=Unknown
% @importance 0.8

0.60::acc(s98, positive_aspect_versatility).

0.65::true_val(positive_aspect_versatility, quiver_killer); 0.35::true_val(positive_aspect_versatility, unk_pos_versa).

measured(s98, positive_aspect_versatility, quiver_killer).

all_consistent(positive_aspect_versatility) :-
    consistent(s98, positive_aspect_versatility).

evidence(all_consistent(positive_aspect_versatility)).
query(true_val(positive_aspect_versatility, quiver_killer)).
query(true_val(positive_aspect_versatility, unk_pos_versa)).

% @attr positive_aspect_quality
% @type categorical
% @canonical false
% @original_name positive_aspect (quality)
% @values excellent_quality_finish=Excellent_quality_fit_and_finish unk_pos_qual=Unknown
% @importance 0.7

0.58::acc(s99, positive_aspect_quality).

0.62::true_val(positive_aspect_quality, excellent_quality_finish); 0.38::true_val(positive_aspect_quality, unk_pos_qual).

measured(s99, positive_aspect_quality, excellent_quality_finish).

all_consistent(positive_aspect_quality) :-
    consistent(s99, positive_aspect_quality).

evidence(all_consistent(positive_aspect_quality)).
query(true_val(positive_aspect_quality, excellent_quality_finish)).
query(true_val(positive_aspect_quality, unk_pos_qual)).

% @attr positive_aspect_groomers
% @type categorical
% @canonical false
% @original_name positive_aspect (groomers)
% @values surprisingly_good_groomers=Surprisingly_good_on_groomers unk_pos_groom=Unknown
% @importance 0.75

0.58::acc(s100, positive_aspect_groomers).

0.62::true_val(positive_aspect_groomers, surprisingly_good_groomers); 0.38::true_val(positive_aspect_groomers, unk_pos_groom).

measured(s100, positive_aspect_groomers, surprisingly_good_groomers).

all_consistent(positive_aspect_groomers) :-
    consistent(s100, positive_aspect_groomers).

evidence(all_consistent(positive_aspect_groomers)).
query(true_val(positive_aspect_groomers, surprisingly_good_groomers)).
query(true_val(positive_aspect_groomers, unk_pos_groom)).

% @attr positive_aspect_nimble
% @type categorical
% @canonical false
% @original_name positive_aspect (nimble)
% @values quick_turns_nimble=Quick_turn_initiation_nimble_easy_control unk_pos_nimble=Unknown
% @importance 0.8

0.60::acc(s101, positive_aspect_nimble).

0.62::true_val(positive_aspect_nimble, quick_turns_nimble); 0.38::true_val(positive_aspect_nimble, unk_pos_nimble).

measured(s101, positive_aspect_nimble, quick_turns_nimble).

all_consistent(positive_aspect_nimble) :-
    consistent(s101, positive_aspect_nimble).

evidence(all_consistent(positive_aspect_nimble)).
query(true_val(positive_aspect_nimble, quick_turns_nimble)).
query(true_val(positive_aspect_nimble, unk_pos_nimble)).

% @attr positive_aspect_construction
% @type categorical
% @canonical false
% @original_name positive_aspect (construction)
% @values bombproof_construction=Bombproof_construction unk_pos_constr=Unknown
% @importance 0.75

0.58::acc(s102, positive_aspect_construction).

0.62::true_val(positive_aspect_construction, bombproof_construction); 0.38::true_val(positive_aspect_construction, unk_pos_constr).

measured(s102, positive_aspect_construction, bombproof_construction).

all_consistent(positive_aspect_construction) :-
    consistent(s102, positive_aspect_construction).

evidence(all_consistent(positive_aspect_construction)).
query(true_val(positive_aspect_construction, bombproof_construction)).
query(true_val(positive_aspect_construction, unk_pos_constr)).

% @attr positive_aspect_base_glide
% @type categorical
% @canonical false
% @original_name positive_aspect (base glide)
% @values impressive_base_glide=Impressive_base_glide_good_traverses unk_pos_glide=Unknown
% @importance 0.65

0.85::acc(s103, positive_aspect_base_glide).

0.85::true_val(positive_aspect_base_glide, impressive_base_glide); 0.15::true_val(positive_aspect_base_glide, unk_pos_glide).

measured(s103, positive_aspect_base_glide, impressive_base_glide).

all_consistent(positive_aspect_base_glide) :-
    consistent(s103, positive_aspect_base_glide).

evidence(all_consistent(positive_aspect_base_glide)).
query(true_val(positive_aspect_base_glide, impressive_base_glide)).
query(true_val(positive_aspect_base_glide, unk_pos_glide)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values switch_difficult_catchy=Switch_very_difficult_nose_catches unk_neg1=Unknown
% @importance 0.7

0.55::acc(s104, negative_aspect).
0.88::acc(s105, negative_aspect).

0.90::true_val(negative_aspect, switch_difficult_catchy); 0.10::true_val(negative_aspect, unk_neg1).

measured(s104, negative_aspect, switch_difficult_catchy).
measured(s105, negative_aspect, switch_difficult_catchy).

all_consistent(negative_aspect) :-
    consistent(s104, negative_aspect),
    consistent(s105, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, switch_difficult_catchy)).
query(true_val(negative_aspect, unk_neg1)).

% @attr negative_aspect_ice
% @type categorical
% @canonical false
% @original_name negative_aspect (ice)
% @values washy_icy_conditions=Washy_in_icy_conditions unk_neg_ice=Unknown
% @importance 0.8

0.70::acc(s106, negative_aspect_ice).

0.72::true_val(negative_aspect_ice, washy_icy_conditions); 0.28::true_val(negative_aspect_ice, unk_neg_ice).

measured(s106, negative_aspect_ice, washy_icy_conditions).

all_consistent(negative_aspect_ice) :-
    consistent(s106, negative_aspect_ice).

evidence(all_consistent(negative_aspect_ice)).
query(true_val(negative_aspect_ice, washy_icy_conditions)).
query(true_val(negative_aspect_ice, unk_neg_ice)).

% @attr negative_aspect_speed
% @type categorical
% @canonical false
% @original_name negative_aspect (speed stability)
% @values not_stable_at_speed=Not_very_stable_at_speed unk_neg_speed=Unknown
% @importance 0.75

0.68::acc(s107, negative_aspect_speed).

0.70::true_val(negative_aspect_speed, not_stable_at_speed); 0.30::true_val(negative_aspect_speed, unk_neg_speed).

measured(s107, negative_aspect_speed, not_stable_at_speed).

all_consistent(negative_aspect_speed) :-
    consistent(s107, negative_aspect_speed).

evidence(all_consistent(negative_aspect_speed)).
query(true_val(negative_aspect_speed, not_stable_at_speed)).
query(true_val(negative_aspect_speed, unk_neg_speed)).

% @attr negative_aspect_width
% @type categorical
% @canonical false
% @original_name negative_aspect (width)
% @values slow_edge_to_edge=Width_causes_slower_edge_to_edge_for_small_boots unk_neg_width=Unknown
% @importance 0.7

0.65::acc(s108, negative_aspect_width).

0.68::true_val(negative_aspect_width, slow_edge_to_edge); 0.32::true_val(negative_aspect_width, unk_neg_width).

measured(s108, negative_aspect_width, slow_edge_to_edge).

all_consistent(negative_aspect_width) :-
    consistent(s108, negative_aspect_width).

evidence(all_consistent(negative_aspect_width)).
query(true_val(negative_aspect_width, slow_edge_to_edge)).
query(true_val(negative_aspect_width, unk_neg_width)).

% @attr negative_aspect_tight_trees
% @type categorical
% @canonical false
% @original_name negative_aspect (tight trees)
% @values liability_tight_icy_trees=Liability_tight_techy_trees_on_icy_traverses unk_neg_trees=Unknown
% @importance 0.75

0.85::acc(s109, negative_aspect_tight_trees).

0.85::true_val(negative_aspect_tight_trees, liability_tight_icy_trees); 0.15::true_val(negative_aspect_tight_trees, unk_neg_trees).

measured(s109, negative_aspect_tight_trees, liability_tight_icy_trees).

all_consistent(negative_aspect_tight_trees) :-
    consistent(s109, negative_aspect_tight_trees).

evidence(all_consistent(negative_aspect_tight_trees)).
query(true_val(negative_aspect_tight_trees, liability_tight_icy_trees)).
query(true_val(negative_aspect_tight_trees, unk_neg_trees)).

% @attr negative_aspect_weight
% @type categorical
% @canonical false
% @original_name negative_aspect (weight)
% @values heavier_than_average=Heavier_than_average_for_length unk_neg_weight=Unknown
% @importance 0.7

0.90::acc(s75c, negative_aspect_weight).

0.90::true_val(negative_aspect_weight, heavier_than_average); 0.10::true_val(negative_aspect_weight, unk_neg_weight).

measured(s75c, negative_aspect_weight, heavier_than_average).

all_consistent(negative_aspect_weight) :-
    consistent(s75c, negative_aspect_weight).

evidence(all_consistent(negative_aspect_weight)).
query(true_val(negative_aspect_weight, heavier_than_average)).
query(true_val(negative_aspect_weight, unk_neg_weight)).

% @attr negative_aspect_front_foot
% @type categorical
% @canonical false
% @original_name negative_aspect (front foot carving)
% @values no_front_foot_carve=Doesnt_carve_well_front_foot_weighting unk_neg_ff=Unknown
% @importance 0.7

0.85::acc(s110, negative_aspect_front_foot).

0.85::true_val(negative_aspect_front_foot, no_front_foot_carve); 0.15::true_val(negative_aspect_front_foot, unk_neg_ff).

measured(s110, negative_aspect_front_foot, no_front_foot_carve).

all_consistent(negative_aspect_front_foot) :-
    consistent(s110, negative_aspect_front_foot).

evidence(all_consistent(negative_aspect_front_foot)).
query(true_val(negative_aspect_front_foot, no_front_foot_carve)).
query(true_val(negative_aspect_front_foot, unk_neg_ff)).

% @attr negative_aspect_flat_base
% @type categorical
% @canonical false
% @original_name negative_aspect (flat basing)
% @values loose_flat_basing=Feels_loose_harder_snow_flat_basing unk_neg_flat=Unknown
% @importance 0.65

0.85::acc(s111, negative_aspect_flat_base).

0.85::true_val(negative_aspect_flat_base, loose_flat_basing); 0.15::true_val(negative_aspect_flat_base, unk_neg_flat).

measured(s111, negative_aspect_flat_base, loose_flat_basing).

all_consistent(negative_aspect_flat_base) :-
    consistent(s111, negative_aspect_flat_base).

evidence(all_consistent(negative_aspect_flat_base)).
query(true_val(negative_aspect_flat_base, loose_flat_basing)).
query(true_val(negative_aspect_flat_base, unk_neg_flat)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values tgr_similar_list=Korua_Dart_Cafe_Racer_Weston_Japow_Moss_Jellyfish_Gentemstick_Barracuda_Soul_Shift_Nidecker_Beta unk_comp_cross=Unknown
% @importance 0.85

0.85::acc(s112, comparable_board_cross_brand).

0.87::true_val(comparable_board_cross_brand, tgr_similar_list); 0.13::true_val(comparable_board_cross_brand, unk_comp_cross).

measured(s112, comparable_board_cross_brand, tgr_similar_list).

all_consistent(comparable_board_cross_brand) :-
    consistent(s112, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, tgr_similar_list)).
query(true_val(comparable_board_cross_brand, unk_comp_cross)).

% @attr comparable_board_cross_brand_forum
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (forum cross-shopping)
% @values jones_me_hovercraft_orca_chuter=Jones_Mind_Expander_Hovercraft_Lib_Tech_Orca_Burton_Straight_Chuter unk_comp_forum=Unknown
% @importance 0.775

0.55::acc(s113, comparable_board_cross_brand_forum).
0.85::acc(s114, comparable_board_cross_brand_forum).

0.82::true_val(comparable_board_cross_brand_forum, jones_me_hovercraft_orca_chuter); 0.18::true_val(comparable_board_cross_brand_forum, unk_comp_forum).

measured(s113, comparable_board_cross_brand_forum, jones_me_hovercraft_orca_chuter).
measured(s114, comparable_board_cross_brand_forum, jones_me_hovercraft_orca_chuter).

all_consistent(comparable_board_cross_brand_forum) :-
    consistent(s113, comparable_board_cross_brand_forum),
    consistent(s114, comparable_board_cross_brand_forum).

evidence(all_consistent(comparable_board_cross_brand_forum)).
query(true_val(comparable_board_cross_brand_forum, jones_me_hovercraft_orca_chuter)).
query(true_val(comparable_board_cross_brand_forum, unk_comp_forum)).

% @attr comparable_board_same_brand_valhalla
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Valhalla test)
% @values tested_vs_valhalla=TGR_tested_Swift_directly_against_Valhalla unk_comp_val=Unknown
% @importance 0.7

0.85::acc(s115, comparable_board_same_brand_valhalla).

0.85::true_val(comparable_board_same_brand_valhalla, tested_vs_valhalla); 0.15::true_val(comparable_board_same_brand_valhalla, unk_comp_val).

measured(s115, comparable_board_same_brand_valhalla, tested_vs_valhalla).

all_consistent(comparable_board_same_brand_valhalla) :-
    consistent(s115, comparable_board_same_brand_valhalla).

evidence(all_consistent(comparable_board_same_brand_valhalla)).
query(true_val(comparable_board_same_brand_valhalla, tested_vs_valhalla)).
query(true_val(comparable_board_same_brand_valhalla, unk_comp_val)).

% @attr comparable_board_cross_brand_vs_dart
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (vs Korua Dart)
% @values better_float_less_stable=Better_float_but_less_stable_when_bombing unk_comp_dart=Unknown
% @importance 0.8

0.70::acc(s116, comparable_board_cross_brand_vs_dart).

0.72::true_val(comparable_board_cross_brand_vs_dart, better_float_less_stable); 0.28::true_val(comparable_board_cross_brand_vs_dart, unk_comp_dart).

measured(s116, comparable_board_cross_brand_vs_dart, better_float_less_stable).

all_consistent(comparable_board_cross_brand_vs_dart) :-
    consistent(s116, comparable_board_cross_brand_vs_dart).

evidence(all_consistent(comparable_board_cross_brand_vs_dart)).
query(true_val(comparable_board_cross_brand_vs_dart, better_float_less_stable)).
query(true_val(comparable_board_cross_brand_vs_dart, unk_comp_dart)).

% @attr comparable_board_cross_brand_powder_forum
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (powder forum)
% @values storm_chaser_sushi_excavator_squash=Jones_Storm_Chaser_Rossignol_Sushi_K2_Excavator_Nitro_Squash unk_comp_pow=Unknown
% @importance 0.7

0.50::acc(s117, comparable_board_cross_brand_powder_forum).

0.55::true_val(comparable_board_cross_brand_powder_forum, storm_chaser_sushi_excavator_squash); 0.45::true_val(comparable_board_cross_brand_powder_forum, unk_comp_pow).

measured(s117, comparable_board_cross_brand_powder_forum, storm_chaser_sushi_excavator_squash).

all_consistent(comparable_board_cross_brand_powder_forum) :-
    consistent(s117, comparable_board_cross_brand_powder_forum).

evidence(all_consistent(comparable_board_cross_brand_powder_forum)).
query(true_val(comparable_board_cross_brand_powder_forum, storm_chaser_sushi_excavator_squash)).
query(true_val(comparable_board_cross_brand_powder_forum, unk_comp_pow)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values nokhu_valhalla_west_bound=Nokhu_Valhalla_West_Bound unk_comp_same=Unknown
% @importance 0.65

0.88::acc(s118, comparable_board_same_brand).

0.88::true_val(comparable_board_same_brand, nokhu_valhalla_west_bound); 0.12::true_val(comparable_board_same_brand, unk_comp_same).

measured(s118, comparable_board_same_brand, nokhu_valhalla_west_bound).

all_consistent(comparable_board_same_brand) :-
    consistent(s118, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, nokhu_valhalla_west_bound)).
query(true_val(comparable_board_same_brand, unk_comp_same)).

% @attr splitboard_variant_exists
% @type categorical
% @canonical false
% @original_name Splitboard variant exists
% @values yes_2026_swift_split=Yes_Mens_2026_Swift_Splitboard unk_split=Unknown
% @importance 0.55

0.93::acc(s119, splitboard_variant_exists).

0.93::true_val(splitboard_variant_exists, yes_2026_swift_split); 0.07::true_val(splitboard_variant_exists, unk_split).

measured(s119, splitboard_variant_exists, yes_2026_swift_split).

all_consistent(splitboard_variant_exists) :-
    consistent(s119, splitboard_variant_exists).

evidence(all_consistent(splitboard_variant_exists)).
query(true_val(splitboard_variant_exists, yes_2026_swift_split)).
query(true_val(splitboard_variant_exists, unk_split)).

% @attr splitboard_msrp
% @type categorical
% @canonical false
% @original_name Splitboard MSRP
% @values msrp_1119_99_sale_895_99=MSRP_1119_99_sale_895_99 unk_split_msrp=Unknown
% @importance 0.55

0.95::acc(s120, splitboard_msrp).

0.95::true_val(splitboard_msrp, msrp_1119_99_sale_895_99); 0.05::true_val(splitboard_msrp, unk_split_msrp).

measured(s120, splitboard_msrp, msrp_1119_99_sale_895_99).

all_consistent(splitboard_msrp) :-
    consistent(s120, splitboard_msrp).

evidence(all_consistent(splitboard_msrp)).
query(true_val(splitboard_msrp, msrp_1119_99_sale_895_99)).
query(true_val(splitboard_msrp, unk_split_msrp)).

% @attr ideal_boot_size_153
% @type categorical
% @canonical false
% @original_name Ideal boot size 153cm
% @values us_8_9=US_8_to_9 unk_boot153=Unknown
% @importance 0.85

0.85::acc(s121a, ideal_boot_size_153).

0.85::true_val(ideal_boot_size_153, us_8_9); 0.15::true_val(ideal_boot_size_153, unk_boot153).

measured(s121a, ideal_boot_size_153, us_8_9).

all_consistent(ideal_boot_size_153) :-
    consistent(s121a, ideal_boot_size_153).

evidence(all_consistent(ideal_boot_size_153)).
query(true_val(ideal_boot_size_153, us_8_9)).
query(true_val(ideal_boot_size_153, unk_boot153)).

% @attr ideal_boot_size_158
% @type categorical
% @canonical false
% @original_name Ideal boot size 158cm
% @values us_9_10=US_9_to_10 unk_boot158=Unknown
% @importance 0.85

0.85::acc(s121b, ideal_boot_size_158).

0.85::true_val(ideal_boot_size_158, us_9_10); 0.15::true_val(ideal_boot_size_158, unk_boot158).

measured(s121b, ideal_boot_size_158, us_9_10).

all_consistent(ideal_boot_size_158) :-
    consistent(s121b, ideal_boot_size_158).

evidence(all_consistent(ideal_boot_size_158)).
query(true_val(ideal_boot_size_158, us_9_10)).
query(true_val(ideal_boot_size_158, unk_boot158)).

% @attr ideal_boot_size_163
% @type categorical
% @canonical false
% @original_name Ideal boot size 163cm
% @values us_9_5_10_5=US_9_5_to_10_5 unk_boot163=Unknown
% @importance 0.85

0.85::acc(s121c, ideal_boot_size_163).

0.85::true_val(ideal_boot_size_163, us_9_5_10_5); 0.15::true_val(ideal_boot_size_163, unk_boot163).

measured(s121c, ideal_boot_size_163, us_9_5_10_5).

all_consistent(ideal_boot_size_163) :-
    consistent(s121c, ideal_boot_size_163).

evidence(all_consistent(ideal_boot_size_163)).
query(true_val(ideal_boot_size_163, us_9_5_10_5)).
query(true_val(ideal_boot_size_163, unk_boot163)).

% @attr sidecut_type
% @type categorical
% @canonical false
% @original_name sidecut_type
% @values power_grip_multi_radii=Power_Grip_Sidecut_multiple_radii_flat_middle unk_sidecut_type=Unknown
% @importance 0.85

0.92::acc(s_merchant, sidecut_type).

0.93::true_val(sidecut_type, power_grip_multi_radii); 0.07::true_val(sidecut_type, unk_sidecut_type).

measured(s_merchant, sidecut_type, power_grip_multi_radii).

all_consistent(sidecut_type) :-
    (indep(s_merchant), consistent(s_merchant, sidecut_type) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, power_grip_multi_radii)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr swallowtail_aluminium
% @type categorical
% @canonical false
% @original_name Swallowtail with aluminium reinforcement
% @values aluminium_reinforced=Aluminium_reinforced_swallowtail_durability_power unk_swallow_al=Unknown
% @importance 0.6

0.80::acc(s122, swallowtail_aluminium).

0.82::true_val(swallowtail_aluminium, aluminium_reinforced); 0.18::true_val(swallowtail_aluminium, unk_swallow_al).

measured(s122, swallowtail_aluminium, aluminium_reinforced).

all_consistent(swallowtail_aluminium) :-
    (indep(s_blauer), consistent(s122, swallowtail_aluminium) ; \+indep(s_blauer)).

evidence(all_consistent(swallowtail_aluminium)).
query(true_val(swallowtail_aluminium, aluminium_reinforced)).
query(true_val(swallowtail_aluminium, unk_swallow_al)).