0.15::indep(s4).
0.20::indep(s7).
0.15::indep(s8).
0.12::indep(s9).
0.15::indep(s10).
0.15::indep(s25).
0.20::indep(s26).
0.15::indep(s30).
0.15::indep(s32).
0.12::indep(s39).
0.25::indep(s82).
0.15::indep(s86).
0.15::indep(s61).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

0.95::acc(s1, brand).
0.72::acc(s4, brand).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values jones_snowboards=Jones_Snowboards unk_brand=Unknown
% @importance 0.90

0.95::true_val(brand, jones_snowboards); 0.05::true_val(brand, unk_brand).
measured(s1, brand, jones_snowboards).
measured(s4, brand, jones_snowboards).
all_consistent(brand) :- consistent(s1, brand), (indep(s4), consistent(s4, brand) ; \+indep(s4)).
evidence(all_consistent(brand)).
query(true_val(brand, jones_snowboards)).
query(true_val(brand, unk_brand)).

0.95::acc(s1, model_name).
0.72::acc(s4, model_name).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values mens_howler=Mens_Howler unk_model_name=Unknown
% @importance 0.90

0.95::true_val(model_name, mens_howler); 0.05::true_val(model_name, unk_model_name).
measured(s1, model_name, mens_howler).
measured(s4, model_name, mens_howler).
all_consistent(model_name) :- consistent(s1, model_name), (indep(s4), consistent(s4, model_name) ; \+indep(s4)).
evidence(all_consistent(model_name)).
query(true_val(model_name, mens_howler)).
query(true_val(model_name, unk_model_name)).

0.72::acc(s4, model_year).
0.68::acc(s8, model_year).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2027=2027 unk_model_year=Unknown
% @importance 0.80

0.92::true_val(model_year, y2027); 0.08::true_val(model_year, unk_model_year).
measured(s4, model_year, y2027).
measured(s8, model_year, y2027).
all_consistent(model_year) :- (indep(s4), consistent(s4, model_year) ; \+indep(s4)), (indep(s8), consistent(s8, model_year) ; \+indep(s8)).
evidence(all_consistent(model_year)).
query(true_val(model_year, y2027)).
query(true_val(model_year, unk_model_year)).

0.75::acc(s52, manufacturer).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values nidecker_group=Nidecker_Group_NDK unk_manufacturer=Unknown
% @importance 0.50

0.63::true_val(manufacturer, nidecker_group); 0.37::true_val(manufacturer, unk_manufacturer).
measured(s52, manufacturer, nidecker_group).
all_consistent(manufacturer) :- consistent(s52, manufacturer).
evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, nidecker_group)).
query(true_val(manufacturer, unk_manufacturer)).

0.85::acc(s56, founder).
0.75::acc(s52, founder).

% @attr founder
% @type categorical
% @canonical false
% @original_name Founder
% @values jeremy_jones=Jeremy_Jones unk_founder=Unknown
% @importance 0.40

0.95::true_val(founder, jeremy_jones); 0.05::true_val(founder, unk_founder).
measured(s52, founder, jeremy_jones).
measured(s56, founder, jeremy_jones).
all_consistent(founder) :- consistent(s52, founder), consistent(s56, founder).
evidence(all_consistent(founder)).
query(true_val(founder, jeremy_jones)).
query(true_val(founder, unk_founder)).

0.88::acc(s56, brand_founding_date).
0.75::acc(s52, brand_founding_date).

% @attr brand_founding_date
% @type categorical
% @canonical false
% @original_name Brand founding date
% @values y2009=2009 y2010=2010
% @importance 0.40

0.55::true_val(brand_founding_date, y2009); 0.45::true_val(brand_founding_date, y2010).
measured(s56, brand_founding_date, y2009).
measured(s52, brand_founding_date, y2010).
all_consistent(brand_founding_date) :- consistent(s56, brand_founding_date), consistent(s52, brand_founding_date).
evidence(all_consistent(brand_founding_date)).
query(true_val(brand_founding_date, y2009)).
query(true_val(brand_founding_date, y2010)).

0.85::acc(s56, company_headquarters).
0.75::acc(s52, company_headquarters).

% @attr company_headquarters
% @type categorical
% @canonical false
% @original_name Company headquarters
% @values truckee_ca_usa=Truckee_California_USA unk_company_headquarters=Unknown
% @importance 0.40

0.95::true_val(company_headquarters, truckee_ca_usa); 0.05::true_val(company_headquarters, unk_company_headquarters).
measured(s56, company_headquarters, truckee_ca_usa).
measured(s52, company_headquarters, truckee_ca_usa).
all_consistent(company_headquarters) :- consistent(s56, company_headquarters), consistent(s52, company_headquarters).
evidence(all_consistent(company_headquarters)).
query(true_val(company_headquarters, truckee_ca_usa)).
query(true_val(company_headquarters, unk_company_headquarters)).

0.75::acc(s52, manufacturing_location).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values dubai=Dubai unk_manufacturing_location=Unknown
% @importance 0.50

0.63::true_val(manufacturing_location, dubai); 0.37::true_val(manufacturing_location, unk_manufacturing_location).
measured(s52, manufacturing_location, dubai).
all_consistent(manufacturing_location) :- consistent(s52, manufacturing_location).
evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, dubai)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

0.70::acc(s30, sustainability_certification_solar).

% @attr sustainability_certification_solar
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values solar_100pct=100pct_solar_power_production unk_sustainability_certification_solar=Unknown
% @importance 0.50

0.60::true_val(sustainability_certification_solar, solar_100pct); 0.40::true_val(sustainability_certification_solar, unk_sustainability_certification_solar).
measured(s30, sustainability_certification_solar, solar_100pct).
all_consistent(sustainability_certification_solar) :- (indep(s30), consistent(s30, sustainability_certification_solar) ; \+indep(s30)).
evidence(all_consistent(sustainability_certification_solar)).
query(true_val(sustainability_certification_solar, solar_100pct)).
query(true_val(sustainability_certification_solar, unk_sustainability_certification_solar)).

0.70::acc(s30, sustainability_certification_1pct).
0.72::acc(s57, sustainability_certification_1pct).

% @attr sustainability_certification_1pct
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values one_pct_planet=1pct_For_The_Planet_member unk_sustainability_certification_1pct=Unknown
% @importance 0.45

0.92::true_val(sustainability_certification_1pct, one_pct_planet); 0.08::true_val(sustainability_certification_1pct, unk_sustainability_certification_1pct).
measured(s30, sustainability_certification_1pct, one_pct_planet).
measured(s57, sustainability_certification_1pct, one_pct_planet).
all_consistent(sustainability_certification_1pct) :- (indep(s30), consistent(s30, sustainability_certification_1pct) ; \+indep(s30)), consistent(s57, sustainability_certification_1pct).
evidence(all_consistent(sustainability_certification_1pct)).
query(true_val(sustainability_certification_1pct, one_pct_planet)).
query(true_val(sustainability_certification_1pct, unk_sustainability_certification_1pct)).

0.70::acc(s30, sustainability_certification).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values fair_trade=Fair_Trade_Certified_snowboards unk_sustainability_certification=Unknown
% @importance 0.50

0.60::true_val(sustainability_certification, fair_trade); 0.40::true_val(sustainability_certification, unk_sustainability_certification).
measured(s30, sustainability_certification, fair_trade).
all_consistent(sustainability_certification) :- (indep(s30), consistent(s30, sustainability_certification) ; \+indep(s30)).
evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, fair_trade)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

0.62::acc(s10, sustainability_certification_eco_perf).

% @attr sustainability_certification_eco_perf
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values eco_performance=Eco_Performance_philosophy unk_sustainability_certification_eco_perf=Unknown
% @importance 0.40

0.55::true_val(sustainability_certification_eco_perf, eco_performance); 0.45::true_val(sustainability_certification_eco_perf, unk_sustainability_certification_eco_perf).
measured(s10, sustainability_certification_eco_perf, eco_performance).
all_consistent(sustainability_certification_eco_perf) :- (indep(s10), consistent(s10, sustainability_certification_eco_perf) ; \+indep(s10)).
evidence(all_consistent(sustainability_certification_eco_perf)).
query(true_val(sustainability_certification_eco_perf, eco_performance)).
query(true_val(sustainability_certification_eco_perf, unk_sustainability_certification_eco_perf)).

0.60::acc(s61, brand_reputation).

% @attr brand_reputation
% @type categorical
% @canonical false
% @original_name Brand reputation
% @values premium_freeride=Premium_freeride_focused_brand unk_brand_reputation=Unknown
% @importance 0.40

0.55::true_val(brand_reputation, premium_freeride); 0.45::true_val(brand_reputation, unk_brand_reputation).
measured(s61, brand_reputation, premium_freeride).
all_consistent(brand_reputation) :- (indep(s61), consistent(s61, brand_reputation) ; \+indep(s61)).
evidence(all_consistent(brand_reputation)).
query(true_val(brand_reputation, premium_freeride)).
query(true_val(brand_reputation, unk_brand_reputation)).

0.88::acc(s13, model_first_available_year).
0.88::acc(s65, model_first_available_year).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2024_25=2024_2025_limited_edition unk_model_first_available_year=Unknown
% @importance 0.85

0.90::true_val(model_first_available_year, season_2024_25); 0.10::true_val(model_first_available_year, unk_model_first_available_year).
measured(s13, model_first_available_year, season_2024_25).
measured(s65, model_first_available_year, season_2024_25).
all_consistent(model_first_available_year) :- consistent(s13, model_first_available_year), consistent(s65, model_first_available_year).
evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2024_25)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

0.88::acc(s13, full_lineup_inclusion).
0.88::acc(s65, full_lineup_inclusion).

% @attr full_lineup_inclusion
% @type categorical
% @canonical false
% @original_name Full lineup inclusion
% @values season_2025_26=2025_2026_season unk_full_lineup_inclusion=Unknown
% @importance 0.85

0.90::true_val(full_lineup_inclusion, season_2025_26); 0.10::true_val(full_lineup_inclusion, unk_full_lineup_inclusion).
measured(s13, full_lineup_inclusion, season_2025_26).
measured(s65, full_lineup_inclusion, season_2025_26).
all_consistent(full_lineup_inclusion) :- consistent(s13, full_lineup_inclusion), consistent(s65, full_lineup_inclusion).
evidence(all_consistent(full_lineup_inclusion)).
query(true_val(full_lineup_inclusion, season_2025_26)).
query(true_val(full_lineup_inclusion, unk_full_lineup_inclusion)).

0.68::acc(s8, estimated_availability_date).
0.72::acc(s4, estimated_availability_date).

% @attr estimated_availability_date
% @type categorical
% @canonical true
% @original_name estimated_availability_date
% @values early_june_2026=Preorder_delivery_early_June_2026 unk_estimated_availability_date=Unknown
% @importance 0.75

0.90::true_val(estimated_availability_date, early_june_2026); 0.10::true_val(estimated_availability_date, unk_estimated_availability_date).
measured(s8, estimated_availability_date, early_june_2026).
measured(s4, estimated_availability_date, early_june_2026).
all_consistent(estimated_availability_date) :- (indep(s8), consistent(s8, estimated_availability_date) ; \+indep(s8)), (indep(s4), consistent(s4, estimated_availability_date) ; \+indep(s4)).
evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, early_june_2026)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

0.80::acc(s26, howler_ltd_variant).

% @attr howler_ltd_variant
% @type categorical
% @canonical false
% @original_name Howler LTD variant
% @values vdlr_signature=Victor_De_Le_Rue_Signature_Series unk_howler_ltd_variant=Unknown
% @importance 0.50

0.72::true_val(howler_ltd_variant, vdlr_signature); 0.28::true_val(howler_ltd_variant, unk_howler_ltd_variant).
measured(s26, howler_ltd_variant, vdlr_signature).
all_consistent(howler_ltd_variant) :- (indep(s26), consistent(s26, howler_ltd_variant) ; \+indep(s26)).
evidence(all_consistent(howler_ltd_variant)).
query(true_val(howler_ltd_variant, vdlr_signature)).
query(true_val(howler_ltd_variant, unk_howler_ltd_variant)).

0.93::acc(s1, pro_rider_name).
0.93::acc(s16, pro_rider_name).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values vdlr_and_hight=Victor_De_Le_Rue_and_Elena_Hight unk_pro_rider_name=Unknown
% @importance 0.90

0.95::true_val(pro_rider_name, vdlr_and_hight); 0.05::true_val(pro_rider_name, unk_pro_rider_name).
measured(s1, pro_rider_name, vdlr_and_hight).
measured(s16, pro_rider_name, vdlr_and_hight).
all_consistent(pro_rider_name) :- consistent(s1, pro_rider_name), consistent(s16, pro_rider_name).
evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, vdlr_and_hight)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

0.90::acc(s16, vdlr_preferred_size).
0.87::acc(s21, vdlr_preferred_size).

% @attr vdlr_preferred_size
% @type categorical
% @canonical false
% @original_name Victor De Le Rue's preferred size
% @values v161cm=161cm unk_vdlr_preferred_size=Unknown
% @importance 0.80

0.92::true_val(vdlr_preferred_size, v161cm); 0.08::true_val(vdlr_preferred_size, unk_vdlr_preferred_size).
measured(s16, vdlr_preferred_size, v161cm).
measured(s21, vdlr_preferred_size, v161cm).
all_consistent(vdlr_preferred_size) :- consistent(s16, vdlr_preferred_size), consistent(s21, vdlr_preferred_size).
evidence(all_consistent(vdlr_preferred_size)).
query(true_val(vdlr_preferred_size, v161cm)).
query(true_val(vdlr_preferred_size, unk_vdlr_preferred_size)).

0.82::acc(s7, comparable_board_same_brand).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values between_stratos_flagship=Between_Jones_Stratos_and_Flagship unk_comparable_board_same_brand=Unknown
% @importance 0.80

0.78::true_val(comparable_board_same_brand, between_stratos_flagship); 0.22::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).
measured(s7, comparable_board_same_brand, between_stratos_flagship).
all_consistent(comparable_board_same_brand) :- (indep(s7), consistent(s7, comparable_board_same_brand) ; \+indep(s7)).
evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, between_stratos_flagship)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

0.72::acc(s4, product_type).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.90

0.95::true_val(product_type, snowboard); 0.05::true_val(product_type, unk_product_type).
measured(s4, product_type, snowboard).
all_consistent(product_type) :- (indep(s4), consistent(s4, product_type) ; \+indep(s4)).
evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

0.72::acc(s4, board_category).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mtn_freeride=All_Mountain_Freeride unk_board_category=Unknown
% @importance 0.90

0.92::true_val(board_category, all_mtn_freeride); 0.08::true_val(board_category, unk_board_category).
measured(s4, board_category, all_mtn_freeride).
all_consistent(board_category) :- (indep(s4), consistent(s4, board_category) ; \+indep(s4)).
evidence(all_consistent(board_category)).
query(true_val(board_category, all_mtn_freeride)).
query(true_val(board_category, unk_board_category)).

0.95::acc(s1, gender).
0.72::acc(s4, gender).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.90

0.95::true_val(gender, mens); 0.05::true_val(gender, unk_gender).
measured(s1, gender, mens).
measured(s4, gender, mens).
all_consistent(gender) :- consistent(s1, gender), (indep(s4), consistent(s4, gender) ; \+indep(s4)).
evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

0.72::acc(s4, shape).
0.93::acc(s16, shape).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 0.90

0.95::true_val(shape, tapered_directional); 0.05::true_val(shape, unk_shape).
measured(s4, shape, tapered_directional).
measured(s16, shape, tapered_directional).
all_consistent(shape) :- (indep(s4), consistent(s4, shape) ; \+indep(s4)), consistent(s16, shape).
evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

0.93::acc(s16, shape_description).
0.87::acc(s21, shape_description).

% @attr shape_description
% @type categorical
% @canonical false
% @original_name Shape description
% @values blunted_min_taper=Blunted_minimally_tapered_directional_maximizes_effective_edge unk_shape_description=Unknown
% @importance 0.80

0.92::true_val(shape_description, blunted_min_taper); 0.08::true_val(shape_description, unk_shape_description).
measured(s16, shape_description, blunted_min_taper).
measured(s21, shape_description, blunted_min_taper).
all_consistent(shape_description) :- consistent(s16, shape_description), consistent(s21, shape_description).
evidence(all_consistent(shape_description)).
query(true_val(shape_description, blunted_min_taper)).
query(true_val(shape_description, unk_shape_description)).

0.93::acc(s1, taper).
0.72::acc(s4, taper).

% @attr taper
% @type numeric
% @unit mm
% @canonical true
% @original_name taper
% @values v8=8.0
% @importance 0.90

0.95::true_val(taper, v8); 0.05::true_val(taper, unk_taper).
measured(s1, taper, v8).
measured(s4, taper, v8).
all_consistent(taper) :- consistent(s1, taper), (indep(s4), consistent(s4, taper) ; \+indep(s4)).
evidence(all_consistent(taper)).
query(true_val(taper, v8)).
query(true_val(taper, unk_taper)).

0.72::acc(s4, camber_type).
0.68::acc(s8, camber_type).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values true_camber=Jones_True_Camber_High_Power_Camber unk_camber_type=Unknown
% @importance 0.80

0.92::true_val(camber_type, true_camber); 0.08::true_val(camber_type, unk_camber_type).
measured(s4, camber_type, true_camber).
measured(s8, camber_type, true_camber).
all_consistent(camber_type) :- (indep(s4), consistent(s4, camber_type) ; \+indep(s4)), (indep(s8), consistent(s8, camber_type) ; \+indep(s8)).
evidence(all_consistent(camber_type)).
query(true_val(camber_type, true_camber)).
query(true_val(camber_type, unk_camber_type)).

0.93::acc(s16, camber_description).
0.87::acc(s21, camber_description).
0.68::acc(s8, camber_description).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values full_camber_past_inserts=Full_camber_extends_past_back_inserts_tip_to_tail unk_camber_description=Unknown
% @importance 0.83

0.95::true_val(camber_description, full_camber_past_inserts); 0.05::true_val(camber_description, unk_camber_description).
measured(s16, camber_description, full_camber_past_inserts).
measured(s21, camber_description, full_camber_past_inserts).
measured(s8, camber_description, full_camber_past_inserts).
all_consistent(camber_description) :- consistent(s16, camber_description), consistent(s21, camber_description), (indep(s8), consistent(s8, camber_description) ; \+indep(s8)).
evidence(all_consistent(camber_description)).
query(true_val(camber_description, full_camber_past_inserts)).
query(true_val(camber_description, unk_camber_description)).

0.72::acc(s4, base_3d_technology).
0.65::acc(s9, base_3d_technology).

% @attr base_3d_technology
% @type categorical
% @canonical false
% @original_name 3D base technology
% @values medium_3d_contour=Medium_3D_Contour_Base_4mm_spoon_nose_0to4mm_tail unk_base_3d_technology=Unknown
% @importance 0.75

0.90::true_val(base_3d_technology, medium_3d_contour); 0.10::true_val(base_3d_technology, unk_base_3d_technology).
measured(s4, base_3d_technology, medium_3d_contour).
measured(s9, base_3d_technology, medium_3d_contour).
all_consistent(base_3d_technology) :- (indep(s4), consistent(s4, base_3d_technology) ; \+indep(s4)), (indep(s9), consistent(s9, base_3d_technology) ; \+indep(s9)).
evidence(all_consistent(base_3d_technology)).
query(true_val(base_3d_technology, medium_3d_contour)).
query(true_val(base_3d_technology, unk_base_3d_technology)).

0.80::acc(s26, flip_tips_3d).

% @attr flip_tips_3d
% @type categorical
% @canonical false
% @original_name 3D Flip Tips
% @values maximizes_float=Maximizes_float_enhances_glide_reduces_catch unk_flip_tips_3d=Unknown
% @importance 0.50

0.72::true_val(flip_tips_3d, maximizes_float); 0.28::true_val(flip_tips_3d, unk_flip_tips_3d).
measured(s26, flip_tips_3d, maximizes_float).
all_consistent(flip_tips_3d) :- (indep(s26), consistent(s26, flip_tips_3d) ; \+indep(s26)).
evidence(all_consistent(flip_tips_3d)).
query(true_val(flip_tips_3d, maximizes_float)).
query(true_val(flip_tips_3d, unk_flip_tips_3d)).

0.72::acc(s4, flex_rating_10).
0.93::acc(s1, flex_rating_10).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v8=8.0 unk_flex_rating_10=Unknown
% @importance 0.90

0.95::true_val(flex_rating_10, v8); 0.05::true_val(flex_rating_10, unk_flex_rating_10).
measured(s4, flex_rating_10, v8).
measured(s1, flex_rating_10, v8).
all_consistent(flex_rating_10) :- consistent(s1, flex_rating_10), (indep(s4), consistent(s4, flex_rating_10) ; \+indep(s4)).
evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v8)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

0.82::acc(s7, flex_feel).
0.93::acc(s16, flex_feel).
0.65::acc(s46, flex_feel).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values mid_stiff=Mid_stiff softer_than_specs=Softer_than_specs_softer_than_Aviator_2_0
% @importance 0.77

0.65::true_val(flex_feel, mid_stiff); 0.35::true_val(flex_feel, softer_than_specs).
measured(s7, flex_feel, mid_stiff).
measured(s16, flex_feel, mid_stiff).
measured(s46, flex_feel, softer_than_specs).
all_consistent(flex_feel) :- (indep(s7), consistent(s7, flex_feel) ; \+indep(s7)), consistent(s16, flex_feel), consistent(s46, flex_feel).
evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, mid_stiff)).
query(true_val(flex_feel, softer_than_specs)).

0.82::acc(s11, flex_pattern).
0.80::acc(s35, flex_pattern).

% @attr flex_pattern
% @type categorical
% @canonical false
% @original_name Flex pattern
% @values easier_mid_stiffer_tips=Easier_between_feet_stiffer_tip_and_tail unk_flex_pattern=Unknown
% @importance 0.80

0.88::true_val(flex_pattern, easier_mid_stiffer_tips); 0.12::true_val(flex_pattern, unk_flex_pattern).
measured(s11, flex_pattern, easier_mid_stiffer_tips).
measured(s35, flex_pattern, easier_mid_stiffer_tips).
all_consistent(flex_pattern) :- consistent(s11, flex_pattern), consistent(s35, flex_pattern).
evidence(all_consistent(flex_pattern)).
query(true_val(flex_pattern, easier_mid_stiffer_tips)).
query(true_val(flex_pattern, unk_flex_pattern)).

0.93::acc(s16, flex_direction).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values directional_flex=Directional_flex unk_flex_direction=Unknown
% @importance 0.90

0.90::true_val(flex_direction, directional_flex); 0.10::true_val(flex_direction, unk_flex_direction).
measured(s16, flex_direction, directional_flex).
all_consistent(flex_direction) :- consistent(s16, flex_direction).
evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional_flex)).
query(true_val(flex_direction, unk_flex_direction)).

0.93::acc(s1, core_material).
0.72::acc(s4, core_material).
0.88::acc(s13, core_material).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values power_core_bbp=Power_Core_Bamboo_Paulownia_Poplar_triple_density unk_core_material=Unknown
% @importance 0.88

0.95::true_val(core_material, power_core_bbp); 0.05::true_val(core_material, unk_core_material).
measured(s1, core_material, power_core_bbp).
measured(s4, core_material, power_core_bbp).
measured(s13, core_material, power_core_bbp).
all_consistent(core_material) :- consistent(s1, core_material), (indep(s4), consistent(s4, core_material) ; \+indep(s4)), consistent(s13, core_material).
evidence(all_consistent(core_material)).
query(true_val(core_material, power_core_bbp)).
query(true_val(core_material, unk_core_material)).

0.82::acc(s7, construction_material_innovation).
0.88::acc(s13, construction_material_innovation).
0.68::acc(s25, construction_material_innovation).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values koroyd=Koroyd_aerospace_synthetic_core_in_nose_95pct_air_75pct_lighter unk_construction_material_innovation=Unknown
% @importance 0.73

0.93::true_val(construction_material_innovation, koroyd); 0.07::true_val(construction_material_innovation, unk_construction_material_innovation).
measured(s7, construction_material_innovation, koroyd).
measured(s13, construction_material_innovation, koroyd).
measured(s25, construction_material_innovation, koroyd).
all_consistent(construction_material_innovation) :- (indep(s7), consistent(s7, construction_material_innovation) ; \+indep(s7)), consistent(s13, construction_material_innovation), (indep(s25), consistent(s25, construction_material_innovation) ; \+indep(s25)).
evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, koroyd)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

0.72::acc(s4, laminate).
0.82::acc(s7, laminate).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values triax_fiberglass=Triax_Fiberglass_triaxial_stitched unk_laminate=Unknown
% @importance 0.85

0.93::true_val(laminate, triax_fiberglass); 0.07::true_val(laminate, unk_laminate).
measured(s4, laminate, triax_fiberglass).
measured(s7, laminate, triax_fiberglass).
all_consistent(laminate) :- (indep(s4), consistent(s4, laminate) ; \+indep(s4)), (indep(s7), consistent(s7, laminate) ; \+indep(s7)).
evidence(all_consistent(laminate)).
query(true_val(laminate, triax_fiberglass)).
query(true_val(laminate, unk_laminate)).

0.72::acc(s4, construction_material_innovation_bcomp).
0.88::acc(s13, construction_material_innovation_bcomp).
0.70::acc(s30, construction_material_innovation_bcomp).
0.75::acc(s15, construction_material_innovation_bcomp).
0.68::acc(s25, construction_material_innovation_bcomp).

% @attr construction_material_innovation_bcomp
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values bcomp_carbon_flax=BComp_Carbon_Flax_Stringer_V_shape_Swiss_collab_pop_and_dampening unk_construction_material_innovation_bcomp=Unknown
% @importance 0.60

0.95::true_val(construction_material_innovation_bcomp, bcomp_carbon_flax); 0.05::true_val(construction_material_innovation_bcomp, unk_construction_material_innovation_bcomp).
measured(s4, construction_material_innovation_bcomp, bcomp_carbon_flax).
measured(s13, construction_material_innovation_bcomp, bcomp_carbon_flax).
measured(s30, construction_material_innovation_bcomp, bcomp_carbon_flax).
measured(s15, construction_material_innovation_bcomp, bcomp_carbon_flax).
measured(s25, construction_material_innovation_bcomp, bcomp_carbon_flax).
all_consistent(construction_material_innovation_bcomp) :- (indep(s4), consistent(s4, construction_material_innovation_bcomp) ; \+indep(s4)), consistent(s13, construction_material_innovation_bcomp), (indep(s30), consistent(s30, construction_material_innovation_bcomp) ; \+indep(s30)), consistent(s15, construction_material_innovation_bcomp), (indep(s25), consistent(s25, construction_material_innovation_bcomp) ; \+indep(s25)).
evidence(all_consistent(construction_material_innovation_bcomp)).
query(true_val(construction_material_innovation_bcomp, bcomp_carbon_flax)).
query(true_val(construction_material_innovation_bcomp, unk_construction_material_innovation_bcomp)).

0.68::acc(s25, resin).
0.80::acc(s26, resin).
0.93::acc(s1, resin).

% @attr resin
% @type categorical
% @canonical true
% @original_name resin
% @values super_sap=Super_Sap_Bio_Resin_27pct_plant_based_33pct_less_CO2 unk_resin=Unknown
% @importance 0.67

0.95::true_val(resin, super_sap); 0.05::true_val(resin, unk_resin).
measured(s25, resin, super_sap).
measured(s26, resin, super_sap).
measured(s1, resin, super_sap).
all_consistent(resin) :- (indep(s25), consistent(s25, resin) ; \+indep(s25)), (indep(s26), consistent(s26, resin) ; \+indep(s26)), consistent(s1, resin).
evidence(all_consistent(resin)).
query(true_val(resin, super_sap)).
query(true_val(resin, unk_resin)).

0.82::acc(s7, base_material).
0.88::acc(s13, base_material).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_8000=Sintered_8000_UHMWPE_carbon unk_base_material=Unknown
% @importance 0.83

0.93::true_val(base_material, sintered_8000); 0.07::true_val(base_material, unk_base_material).
measured(s7, base_material, sintered_8000).
measured(s13, base_material, sintered_8000).
all_consistent(base_material) :- (indep(s7), consistent(s7, base_material) ; \+indep(s7)), consistent(s13, base_material).
evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_8000)).
query(true_val(base_material, unk_base_material)).

0.72::acc(s4, sidewall_material).
0.82::acc(s7, sidewall_material).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values recycled_abs=Recycled_ABS_rounded_finish unk_sidewall_material=Unknown
% @importance 0.85

0.93::true_val(sidewall_material, recycled_abs); 0.07::true_val(sidewall_material, unk_sidewall_material).
measured(s4, sidewall_material, recycled_abs).
measured(s7, sidewall_material, recycled_abs).
all_consistent(sidewall_material) :- (indep(s4), consistent(s4, sidewall_material) ; \+indep(s4)), (indep(s7), consistent(s7, sidewall_material) ; \+indep(s7)).
evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, recycled_abs)).
query(true_val(sidewall_material, unk_sidewall_material)).

0.72::acc(s4, edge_technology).
0.88::acc(s13, edge_technology).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values oversized_recycled_steel=Oversized_recycled_German_steel_3mm unk_edge_technology=Unknown
% @importance 0.75

0.93::true_val(edge_technology, oversized_recycled_steel); 0.07::true_val(edge_technology, unk_edge_technology).
measured(s4, edge_technology, oversized_recycled_steel).
measured(s13, edge_technology, oversized_recycled_steel).
all_consistent(edge_technology) :- (indep(s4), consistent(s4, edge_technology) ; \+indep(s4)), consistent(s13, edge_technology).
evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, oversized_recycled_steel)).
query(true_val(edge_technology, unk_edge_technology)).

0.80::acc(s26, topsheet).
0.70::acc(s30, topsheet).

% @attr topsheet
% @type categorical
% @canonical true
% @original_name topsheet
% @values eco_topsheet=Premium_Eco_Topsheet_castor_bean_bio_plastic unk_topsheet=Unknown
% @importance 0.50

0.88::true_val(topsheet, eco_topsheet); 0.12::true_val(topsheet, unk_topsheet).
measured(s26, topsheet, eco_topsheet).
measured(s30, topsheet, eco_topsheet).
all_consistent(topsheet) :- (indep(s26), consistent(s26, topsheet) ; \+indep(s26)), (indep(s30), consistent(s30, topsheet) ; \+indep(s30)).
evidence(all_consistent(topsheet)).
query(true_val(topsheet, eco_topsheet)).
query(true_val(topsheet, unk_topsheet)).

0.72::acc(s4, factory_wax).
0.82::acc(s7, factory_wax).

% @attr factory_wax
% @type categorical
% @canonical false
% @original_name Factory wax
% @values wend_natural=WEND_Natural_Wax unk_factory_wax=Unknown
% @importance 0.85

0.93::true_val(factory_wax, wend_natural); 0.07::true_val(factory_wax, unk_factory_wax).
measured(s4, factory_wax, wend_natural).
measured(s7, factory_wax, wend_natural).
all_consistent(factory_wax) :- (indep(s4), consistent(s4, factory_wax) ; \+indep(s4)), (indep(s7), consistent(s7, factory_wax) ; \+indep(s7)).
evidence(all_consistent(factory_wax)).
query(true_val(factory_wax, wend_natural)).
query(true_val(factory_wax, unk_factory_wax)).

0.72::acc(s4, factory_tuned).
0.82::acc(s7, factory_tuned).

% @attr factory_tuned
% @type categorical
% @canonical false
% @original_name Factory tuned
% @values yes_detuned=Yes_detuned_tip_tail unk_factory_tuned=Unknown
% @importance 0.85

0.93::true_val(factory_tuned, yes_detuned); 0.07::true_val(factory_tuned, unk_factory_tuned).
measured(s4, factory_tuned, yes_detuned).
measured(s7, factory_tuned, yes_detuned).
all_consistent(factory_tuned) :- (indep(s4), consistent(s4, factory_tuned) ; \+indep(s4)), (indep(s7), consistent(s7, factory_tuned) ; \+indep(s7)).
evidence(all_consistent(factory_tuned)).
query(true_val(factory_tuned, yes_detuned)).
query(true_val(factory_tuned, unk_factory_tuned)).

0.72::acc(s4, forever_flex).
0.82::acc(s7, forever_flex).
0.88::acc(s13, forever_flex).

% @attr forever_flex
% @type categorical
% @canonical false
% @original_name Forever Flex technology
% @values yes_overbuilt=Yes_overbuilt_breaks_in_stabilizes_flex unk_forever_flex=Unknown
% @importance 0.82

0.95::true_val(forever_flex, yes_overbuilt); 0.05::true_val(forever_flex, unk_forever_flex).
measured(s4, forever_flex, yes_overbuilt).
measured(s7, forever_flex, yes_overbuilt).
measured(s13, forever_flex, yes_overbuilt).
all_consistent(forever_flex) :- (indep(s4), consistent(s4, forever_flex) ; \+indep(s4)), (indep(s7), consistent(s7, forever_flex) ; \+indep(s7)), consistent(s13, forever_flex).
evidence(all_consistent(forever_flex)).
query(true_val(forever_flex, yes_overbuilt)).
query(true_val(forever_flex, unk_forever_flex)).

0.72::acc(s4, edge_technology_traction).
0.72::acc(s36, edge_technology_traction).

% @attr edge_technology_traction
% @type categorical
% @canonical false
% @original_name edge_technology
% @values traction_tech=Traction_Tech_strategic_contact_points unk_edge_technology_traction=Unknown
% @importance 0.80

0.90::true_val(edge_technology_traction, traction_tech); 0.10::true_val(edge_technology_traction, unk_edge_technology_traction).
measured(s4, edge_technology_traction, traction_tech).
measured(s36, edge_technology_traction, traction_tech).
all_consistent(edge_technology_traction) :- (indep(s4), consistent(s4, edge_technology_traction) ; \+indep(s4)), (indep(s4), consistent(s4, edge_technology_traction) ; \+indep(s4)).
evidence(all_consistent(edge_technology_traction)).
query(true_val(edge_technology_traction, traction_tech)).
query(true_val(edge_technology_traction, unk_edge_technology_traction)).

0.72::acc(s4, mounting_pattern).
0.93::acc(s1, mounting_pattern).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts_Standard_Pack unk_mounting_pattern=Unknown
% @importance 0.90

0.95::true_val(mounting_pattern, inserts_2x4); 0.05::true_val(mounting_pattern, unk_mounting_pattern).
measured(s4, mounting_pattern, inserts_2x4).
measured(s1, mounting_pattern, inserts_2x4).
all_consistent(mounting_pattern) :- consistent(s1, mounting_pattern), (indep(s4), consistent(s4, mounting_pattern) ; \+indep(s4)).
evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

0.72::acc(s4, sustainability_certification_bio_resin).
0.68::acc(s25, sustainability_certification_bio_resin).
0.80::acc(s26, sustainability_certification_bio_resin).
0.70::acc(s30, sustainability_certification_bio_resin).

% @attr sustainability_certification_bio_resin
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values bio_resin_yes=Yes_plant_based_resin_33pct_less_GHG unk_sustainability_certification_bio_resin=Unknown
% @importance 0.55

0.93::true_val(sustainability_certification_bio_resin, bio_resin_yes); 0.07::true_val(sustainability_certification_bio_resin, unk_sustainability_certification_bio_resin).
measured(s4, sustainability_certification_bio_resin, bio_resin_yes).
measured(s25, sustainability_certification_bio_resin, bio_resin_yes).
measured(s26, sustainability_certification_bio_resin, bio_resin_yes).
measured(s30, sustainability_certification_bio_resin, bio_resin_yes).
all_consistent(sustainability_certification_bio_resin) :- (indep(s4), consistent(s4, sustainability_certification_bio_resin) ; \+indep(s4)), (indep(s25), consistent(s25, sustainability_certification_bio_resin) ; \+indep(s25)), (indep(s26), consistent(s26, sustainability_certification_bio_resin) ; \+indep(s26)), (indep(s30), consistent(s30, sustainability_certification_bio_resin) ; \+indep(s30)).
evidence(all_consistent(sustainability_certification_bio_resin)).
query(true_val(sustainability_certification_bio_resin, bio_resin_yes)).
query(true_val(sustainability_certification_bio_resin, unk_sustainability_certification_bio_resin)).

0.72::acc(s4, sustainability_certification_recycled_edges).
0.70::acc(s30, sustainability_certification_recycled_edges).

% @attr sustainability_certification_recycled_edges
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values recycled_steel_yes=Yes_recycled_German_steel_edges unk_sustainability_certification_recycled_edges=Unknown
% @importance 0.70

0.90::true_val(sustainability_certification_recycled_edges, recycled_steel_yes); 0.10::true_val(sustainability_certification_recycled_edges, unk_sustainability_certification_recycled_edges).
measured(s4, sustainability_certification_recycled_edges, recycled_steel_yes).
measured(s30, sustainability_certification_recycled_edges, recycled_steel_yes).
all_consistent(sustainability_certification_recycled_edges) :- (indep(s4), consistent(s4, sustainability_certification_recycled_edges) ; \+indep(s4)), (indep(s30), consistent(s30, sustainability_certification_recycled_edges) ; \+indep(s30)).
evidence(all_consistent(sustainability_certification_recycled_edges)).
query(true_val(sustainability_certification_recycled_edges, recycled_steel_yes)).
query(true_val(sustainability_certification_recycled_edges, unk_sustainability_certification_recycled_edges)).

0.72::acc(s4, sustainability_certification_recycled_sidewalls).
0.82::acc(s7, sustainability_certification_recycled_sidewalls).

% @attr sustainability_certification_recycled_sidewalls
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values recycled_abs_yes=Yes_recycled_ABS_sidewalls unk_sustainability_certification_recycled_sidewalls=Unknown
% @importance 0.85

0.93::true_val(sustainability_certification_recycled_sidewalls, recycled_abs_yes); 0.07::true_val(sustainability_certification_recycled_sidewalls, unk_sustainability_certification_recycled_sidewalls).
measured(s4, sustainability_certification_recycled_sidewalls, recycled_abs_yes).
measured(s7, sustainability_certification_recycled_sidewalls, recycled_abs_yes).
all_consistent(sustainability_certification_recycled_sidewalls) :- (indep(s4), consistent(s4, sustainability_certification_recycled_sidewalls) ; \+indep(s4)), (indep(s7), consistent(s7, sustainability_certification_recycled_sidewalls) ; \+indep(s7)).
evidence(all_consistent(sustainability_certification_recycled_sidewalls)).
query(true_val(sustainability_certification_recycled_sidewalls, recycled_abs_yes)).
query(true_val(sustainability_certification_recycled_sidewalls, unk_sustainability_certification_recycled_sidewalls)).

0.70::acc(s30, sustainability_certification_sustainable_wood).

% @attr sustainability_certification_sustainable_wood
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values sustainable_wood_yes=All_core_wood_sustainably_grown unk_sustainability_certification_sustainable_wood=Unknown
% @importance 0.50

0.60::true_val(sustainability_certification_sustainable_wood, sustainable_wood_yes); 0.40::true_val(sustainability_certification_sustainable_wood, unk_sustainability_certification_sustainable_wood).
measured(s30, sustainability_certification_sustainable_wood, sustainable_wood_yes).
all_consistent(sustainability_certification_sustainable_wood) :- (indep(s30), consistent(s30, sustainability_certification_sustainable_wood) ; \+indep(s30)).
evidence(all_consistent(sustainability_certification_sustainable_wood)).
query(true_val(sustainability_certification_sustainable_wood, sustainable_wood_yes)).
query(true_val(sustainability_certification_sustainable_wood, unk_sustainability_certification_sustainable_wood)).

0.80::acc(s26, topsheet_castor_bean).
0.70::acc(s30, topsheet_castor_bean).

% @attr topsheet_castor_bean
% @type categorical
% @canonical false
% @original_name Topsheet made from castor bean bio-plastic
% @values castor_bean_yes=Castor_bean_bio_plastic unk_topsheet_castor_bean=Unknown
% @importance 0.50

0.88::true_val(topsheet_castor_bean, castor_bean_yes); 0.12::true_val(topsheet_castor_bean, unk_topsheet_castor_bean).
measured(s26, topsheet_castor_bean, castor_bean_yes).
measured(s30, topsheet_castor_bean, castor_bean_yes).
all_consistent(topsheet_castor_bean) :- (indep(s26), consistent(s26, topsheet_castor_bean) ; \+indep(s26)), (indep(s30), consistent(s30, topsheet_castor_bean) ; \+indep(s30)).
evidence(all_consistent(topsheet_castor_bean)).
query(true_val(topsheet_castor_bean, castor_bean_yes)).
query(true_val(topsheet_castor_bean, unk_topsheet_castor_bean)).

0.72::acc(s4, width_options).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 0.90

0.90::true_val(width_options, standard_and_wide); 0.10::true_val(width_options, unk_width_options).
measured(s4, width_options, standard_and_wide).
all_consistent(width_options) :- (indep(s4), consistent(s4, width_options) ; \+indep(s4)).
evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

0.93::acc(s1, available_sizes).
0.72::acc(s4, available_sizes).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values full_range=152_155_158_161_157W_160W_163W subset_merchant=155_158_157W_160W
% @importance 0.90

0.70::true_val(available_sizes, full_range); 0.30::true_val(available_sizes, subset_merchant).
measured(s1, available_sizes, full_range).
measured(s4, available_sizes, subset_merchant).
all_consistent(available_sizes) :- consistent(s1, available_sizes), (indep(s4), consistent(s4, available_sizes) ; \+indep(s4)).
evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, full_range)).
query(true_val(available_sizes, subset_merchant)).

0.90::acc(s1, board_weight_grams_152).

% @attr board_weight_grams_152
% @type numeric
% @unit grams
% @canonical false
% @original_name board_weight_grams
% @values v2600=2600.0
% @importance 0.85

0.88::true_val(board_weight_grams_152, v2600); 0.12::true_val(board_weight_grams_152, unk_board_weight_grams_152).
measured(s1, board_weight_grams_152, v2600).
all_consistent(board_weight_grams_152) :- consistent(s1, board_weight_grams_152).
evidence(all_consistent(board_weight_grams_152)).
query(true_val(board_weight_grams_152, v2600)).
query(true_val(board_weight_grams_152, unk_board_weight_grams_152)).

0.90::acc(s1, board_weight_grams).

% @attr board_weight_grams
% @type numeric
% @unit grams
% @canonical true
% @original_name board_weight_grams
% @values v2700=2700.0
% @importance 0.85

0.88::true_val(board_weight_grams, v2700); 0.12::true_val(board_weight_grams, unk_board_weight_grams).
measured(s1, board_weight_grams, v2700).
all_consistent(board_weight_grams) :- consistent(s1, board_weight_grams).
evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v2700)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

0.90::acc(s1, board_weight_grams_158).

% @attr board_weight_grams_158
% @type numeric
% @unit grams
% @canonical false
% @original_name board_weight_grams
% @values v2800=2800.0
% @importance 0.85

0.88::true_val(board_weight_grams_158, v2800); 0.12::true_val(board_weight_grams_158, unk_board_weight_grams_158).
measured(s1, board_weight_grams_158, v2800).
all_consistent(board_weight_grams_158) :- consistent(s1, board_weight_grams_158).
evidence(all_consistent(board_weight_grams_158)).
query(true_val(board_weight_grams_158, v2800)).
query(true_val(board_weight_grams_158, unk_board_weight_grams_158)).

0.85::acc(s1, board_weight_grams_160w).
0.95::acc(s13, board_weight_grams_160w).

% @attr board_weight_grams_160w
% @type numeric
% @unit grams
% @canonical false
% @original_name board_weight_grams
% @values v3000=3000.0 v3210=3210.0
% @importance 0.85

0.40::true_val(board_weight_grams_160w, v3000); 0.60::true_val(board_weight_grams_160w, v3210).
measured(s1, board_weight_grams_160w, v3000).
measured(s13, board_weight_grams_160w, v3210).
all_consistent(board_weight_grams_160w) :- consistent(s1, board_weight_grams_160w), consistent(s13, board_weight_grams_160w).
evidence(all_consistent(board_weight_grams_160w)).
query(true_val(board_weight_grams_160w, v3000)).
query(true_val(board_weight_grams_160w, v3210)).

0.90::acc(s1, board_weight_grams_157w).

% @attr board_weight_grams_157w
% @type numeric
% @unit grams
% @canonical false
% @original_name board_weight_grams
% @values v2900=2900.0
% @importance 0.85

0.88::true_val(board_weight_grams_157w, v2900); 0.12::true_val(board_weight_grams_157w, unk_board_weight_grams_157w).
measured(s1, board_weight_grams_157w, v2900).
all_consistent(board_weight_grams_157w) :- consistent(s1, board_weight_grams_157w).
evidence(all_consistent(board_weight_grams_157w)).
query(true_val(board_weight_grams_157w, v2900)).
query(true_val(board_weight_grams_157w, unk_board_weight_grams_157w)).

0.90::acc(s1, board_weight_grams_163w).

% @attr board_weight_grams_163w
% @type numeric
% @unit grams
% @canonical false
% @original_name board_weight_grams
% @values v3100=3100.0
% @importance 0.85

0.88::true_val(board_weight_grams_163w, v3100); 0.12::true_val(board_weight_grams_163w, unk_board_weight_grams_163w).
measured(s1, board_weight_grams_163w, v3100).
all_consistent(board_weight_grams_163w) :- consistent(s1, board_weight_grams_163w).
evidence(all_consistent(board_weight_grams_163w)).
query(true_val(board_weight_grams_163w, v3100)).
query(true_val(board_weight_grams_163w, unk_board_weight_grams_163w)).

0.72::acc(s4, effective_edge_155).
0.93::acc(s1, effective_edge_155).

% @attr effective_edge_155
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 155cm
% @values v1201=1201.0
% @importance 0.90

0.95::true_val(effective_edge_155, v1201); 0.05::true_val(effective_edge_155, unk_effective_edge_155).
measured(s4, effective_edge_155, v1201).
measured(s1, effective_edge_155, v1201).
all_consistent(effective_edge_155) :- consistent(s1, effective_edge_155), (indep(s4), consistent(s4, effective_edge_155) ; \+indep(s4)).
evidence(all_consistent(effective_edge_155)).
query(true_val(effective_edge_155, v1201)).
query(true_val(effective_edge_155, unk_effective_edge_155)).

0.72::acc(s4, effective_edge_158).
0.93::acc(s1, effective_edge_158).

% @attr effective_edge_158
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 158cm
% @values v1225=1225.0
% @importance 0.90

0.95::true_val(effective_edge_158, v1225); 0.05::true_val(effective_edge_158, unk_effective_edge_158).
measured(s4, effective_edge_158, v1225).
measured(s1, effective_edge_158, v1225).
all_consistent(effective_edge_158) :- consistent(s1, effective_edge_158), (indep(s4), consistent(s4, effective_edge_158) ; \+indep(s4)).
evidence(all_consistent(effective_edge_158)).
query(true_val(effective_edge_158, v1225)).
query(true_val(effective_edge_158, unk_effective_edge_158)).

0.72::acc(s4, effective_edge_160w).
0.93::acc(s1, effective_edge_160w).

% @attr effective_edge_160w
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 160W
% @values v1239=1239.0
% @importance 0.90

0.95::true_val(effective_edge_160w, v1239); 0.05::true_val(effective_edge_160w, unk_effective_edge_160w).
measured(s4, effective_edge_160w, v1239).
measured(s1, effective_edge_160w, v1239).
all_consistent(effective_edge_160w) :- consistent(s1, effective_edge_160w), (indep(s4), consistent(s4, effective_edge_160w) ; \+indep(s4)).
evidence(all_consistent(effective_edge_160w)).
query(true_val(effective_edge_160w, v1239)).
query(true_val(effective_edge_160w, unk_effective_edge_160w)).

0.93::acc(s1, waist_width_152).
0.72::acc(s4, waist_width_152).

% @attr waist_width_152
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 152cm
% @values v25_1=25.1
% @importance 0.90

0.95::true_val(waist_width_152, v25_1); 0.05::true_val(waist_width_152, unk_waist_width_152).
measured(s1, waist_width_152, v25_1).
measured(s4, waist_width_152, v25_1).
all_consistent(waist_width_152) :- consistent(s1, waist_width_152), (indep(s4), consistent(s4, waist_width_152) ; \+indep(s4)).
evidence(all_consistent(waist_width_152)).
query(true_val(waist_width_152, v25_1)).
query(true_val(waist_width_152, unk_waist_width_152)).

0.93::acc(s1, waist_width_155).
0.72::acc(s4, waist_width_155).

% @attr waist_width_155
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 155cm
% @values v25_4=25.4
% @importance 0.90

0.95::true_val(waist_width_155, v25_4); 0.05::true_val(waist_width_155, unk_waist_width_155).
measured(s1, waist_width_155, v25_4).
measured(s4, waist_width_155, v25_4).
all_consistent(waist_width_155) :- consistent(s1, waist_width_155), (indep(s4), consistent(s4, waist_width_155) ; \+indep(s4)).
evidence(all_consistent(waist_width_155)).
query(true_val(waist_width_155, v25_4)).
query(true_val(waist_width_155, unk_waist_width_155)).

0.93::acc(s1, waist_width_157w).
0.72::acc(s4, waist_width_157w).

% @attr waist_width_157w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 157W
% @values v26_4=26.4
% @importance 0.90

0.95::true_val(waist_width_157w, v26_4); 0.05::true_val(waist_width_157w, unk_waist_width_157w).
measured(s1, waist_width_157w, v26_4).
measured(s4, waist_width_157w, v26_4).
all_consistent(waist_width_157w) :- consistent(s1, waist_width_157w), (indep(s4), consistent(s4, waist_width_157w) ; \+indep(s4)).
evidence(all_consistent(waist_width_157w)).
query(true_val(waist_width_157w, v26_4)).
query(true_val(waist_width_157w, unk_waist_width_157w)).

0.93::acc(s1, waist_width_158).
0.72::acc(s4, waist_width_158).

% @attr waist_width_158
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 158cm
% @values v25_7=25.7
% @importance 0.90

0.95::true_val(waist_width_158, v25_7); 0.05::true_val(waist_width_158, unk_waist_width_158).
measured(s1, waist_width_158, v25_7).
measured(s4, waist_width_158, v25_7).
all_consistent(waist_width_158) :- consistent(s1, waist_width_158), (indep(s4), consistent(s4, waist_width_158) ; \+indep(s4)).
evidence(all_consistent(waist_width_158)).
query(true_val(waist_width_158, v25_7)).
query(true_val(waist_width_158, unk_waist_width_158)).

0.93::acc(s1, waist_width_160w).
0.72::acc(s4, waist_width_160w).

% @attr waist_width_160w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 160W
% @values v26_7=26.7
% @importance 0.90

0.95::true_val(waist_width_160w, v26_7); 0.05::true_val(waist_width_160w, unk_waist_width_160w).
measured(s1, waist_width_160w, v26_7).
measured(s4, waist_width_160w, v26_7).
all_consistent(waist_width_160w) :- consistent(s1, waist_width_160w), (indep(s4), consistent(s4, waist_width_160w) ; \+indep(s4)).
evidence(all_consistent(waist_width_160w)).
query(true_val(waist_width_160w, v26_7)).
query(true_val(waist_width_160w, unk_waist_width_160w)).

0.93::acc(s1, waist_width_161).

% @attr waist_width_161
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 161cm
% @values v26_0=26.0
% @importance 0.90

0.90::true_val(waist_width_161, v26_0); 0.10::true_val(waist_width_161, unk_waist_width_161).
measured(s1, waist_width_161, v26_0).
all_consistent(waist_width_161) :- consistent(s1, waist_width_161).
evidence(all_consistent(waist_width_161)).
query(true_val(waist_width_161, v26_0)).
query(true_val(waist_width_161, unk_waist_width_161)).

0.93::acc(s1, waist_width_163w).

% @attr waist_width_163w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 163W
% @values v27_0=27.0
% @importance 0.90

0.90::true_val(waist_width_163w, v27_0); 0.10::true_val(waist_width_163w, unk_waist_width_163w).
measured(s1, waist_width_163w, v27_0).
all_consistent(waist_width_163w) :- consistent(s1, waist_width_163w).
evidence(all_consistent(waist_width_163w)).
query(true_val(waist_width_163w, v27_0)).
query(true_val(waist_width_163w, unk_waist_width_163w)).

0.93::acc(s1, sidecut_radius_size).
0.72::acc(s4, sidecut_radius_size).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size
% @values v8_4=8.4
% @importance 0.90

0.95::true_val(sidecut_radius_size, v8_4); 0.05::true_val(sidecut_radius_size, unk_sidecut_radius_size).
measured(s1, sidecut_radius_size, v8_4).
measured(s4, sidecut_radius_size, v8_4).
all_consistent(sidecut_radius_size) :- consistent(s1, sidecut_radius_size), (indep(s4), consistent(s4, sidecut_radius_size) ; \+indep(s4)).
evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v8_4)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

0.93::acc(s1, sidecut_radius_size_lg).
0.72::acc(s12, sidecut_radius_size_lg).

% @attr sidecut_radius_size_lg
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v8_6=8.6
% @importance 0.88

0.93::true_val(sidecut_radius_size_lg, v8_6); 0.07::true_val(sidecut_radius_size_lg, unk_sidecut_radius_size_lg).
measured(s1, sidecut_radius_size_lg, v8_6).
measured(s12, sidecut_radius_size_lg, v8_6).
all_consistent(sidecut_radius_size_lg) :- consistent(s1, sidecut_radius_size_lg), consistent(s12, sidecut_radius_size_lg).
evidence(all_consistent(sidecut_radius_size_lg)).
query(true_val(sidecut_radius_size_lg, v8_6)).
query(true_val(sidecut_radius_size_lg, unk_sidecut_radius_size_lg)).

0.93::acc(s1, setback).

% @attr setback
% @type numeric
% @unit cm
% @canonical true
% @original_name setback
% @values v2=2.0
% @importance 0.90

0.90::true_val(setback, v2); 0.10::true_val(setback, unk_setback).
measured(s1, setback, v2).
all_consistent(setback) :- consistent(s1, setback).
evidence(all_consistent(setback)).
query(true_val(setback, v2)).
query(true_val(setback, unk_setback)).

0.93::acc(s1, stance_width_range_size).

% @attr stance_width_range_size
% @type numeric
% @unit cm
% @canonical true
% @original_name stance_width_range_size
% @values v56_0=56.0
% @importance 0.90

0.90::true_val(stance_width_range_size, v56_0); 0.10::true_val(stance_width_range_size, unk_stance_width_range_size).
measured(s1, stance_width_range_size, v56_0).
all_consistent(stance_width_range_size) :- consistent(s1, stance_width_range_size).
evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v56_0)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

0.93::acc(s1, tip_tail_width_size).

% @attr tip_tail_width_size
% @type numeric
% @unit cm
% @canonical true
% @original_name tip_tail_width_size
% @values v26_0=26.0
% @importance 0.90

0.90::true_val(tip_tail_width_size, v26_0); 0.10::true_val(tip_tail_width_size, unk_tip_tail_width_size).
measured(s1, tip_tail_width_size, v26_0).
all_consistent(tip_tail_width_size) :- consistent(s1, tip_tail_width_size).
evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v26_0)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

0.93::acc(s1, tail_width_size).

% @attr tail_width_size
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size
% @values v19_5=19.5
% @importance 0.90

0.90::true_val(tail_width_size, v19_5); 0.10::true_val(tail_width_size, unk_tail_width_size).
measured(s1, tail_width_size, v19_5).
all_consistent(tail_width_size) :- consistent(s1, tail_width_size).
evidence(all_consistent(tail_width_size)).
query(true_val(tail_width_size, v19_5)).
query(true_val(tail_width_size, unk_tail_width_size)).

0.93::acc(s1, contact_length_size).

% @attr contact_length_size
% @type numeric
% @unit cm
% @canonical true
% @original_name contact_length_size
% @values v112_5=112.5
% @importance 0.90

0.90::true_val(contact_length_size, v112_5); 0.10::true_val(contact_length_size, unk_contact_length_size).
measured(s1, contact_length_size, v112_5).
all_consistent(contact_length_size) :- consistent(s1, contact_length_size).
evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v112_5)).
query(true_val(contact_length_size, unk_contact_length_size)).

0.93::acc(s1, terrain_suitability).
0.72::acc(s4, terrain_suitability).

% @attr terrain_suitability
% @type numeric
% @unit /10
% @canonical true
% @original_name terrain_suitability
% @values v7=7.0 v8=8.0
% @importance 0.90

0.50::true_val(terrain_suitability, v7); 0.50::true_val(terrain_suitability, v8).
measured(s1, terrain_suitability, v7).
measured(s4, terrain_suitability, v8).
all_consistent(terrain_suitability) :- consistent(s1, terrain_suitability), (indep(s4), consistent(s4, terrain_suitability) ; \+indep(s4)).
evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, v7)).
query(true_val(terrain_suitability, v8)).

0.93::acc(s1, terrain_suitability_powder).
0.72::acc(s4, terrain_suitability_powder).
0.68::acc(s25, terrain_suitability_powder).

% @attr terrain_suitability_powder
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability
% @values v9=9.0
% @importance 0.80

0.95::true_val(terrain_suitability_powder, v9); 0.05::true_val(terrain_suitability_powder, unk_terrain_suitability_powder).
measured(s1, terrain_suitability_powder, v9).
measured(s4, terrain_suitability_powder, v9).
measured(s25, terrain_suitability_powder, v9).
all_consistent(terrain_suitability_powder) :- consistent(s1, terrain_suitability_powder), (indep(s4), consistent(s4, terrain_suitability_powder) ; \+indep(s4)), (indep(s25), consistent(s25, terrain_suitability_powder) ; \+indep(s25)).
evidence(all_consistent(terrain_suitability_powder)).
query(true_val(terrain_suitability_powder, v9)).
query(true_val(terrain_suitability_powder, unk_terrain_suitability_powder)).

0.93::acc(s1, freestyle_park_rating).
0.72::acc(s4, freestyle_park_rating).

% @attr freestyle_park_rating
% @type numeric
% @unit /10
% @canonical true
% @original_name freestyle_park_rating
% @values v9=9.0 v8=8.0
% @importance 0.90

0.50::true_val(freestyle_park_rating, v9); 0.50::true_val(freestyle_park_rating, v8).
measured(s1, freestyle_park_rating, v9).
measured(s4, freestyle_park_rating, v8).
all_consistent(freestyle_park_rating) :- consistent(s1, freestyle_park_rating), (indep(s4), consistent(s4, freestyle_park_rating) ; \+indep(s4)).
evidence(all_consistent(freestyle_park_rating)).
query(true_val(freestyle_park_rating, v9)).
query(true_val(freestyle_park_rating, v8)).

0.72::acc(s4, rider_level).
0.70::acc(s19, rider_level).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate_to_expert=Intermediate_to_Expert unk_rider_level=Unknown
% @importance 0.83

0.90::true_val(rider_level, intermediate_to_expert); 0.10::true_val(rider_level, unk_rider_level).
measured(s4, rider_level, intermediate_to_expert).
measured(s19, rider_level, intermediate_to_expert).
all_consistent(rider_level) :- (indep(s4), consistent(s4, rider_level) ; \+indep(s4)), consistent(s19, rider_level).
evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate_to_expert)).
query(true_val(rider_level, unk_rider_level)).

0.93::acc(s16, skill_level_recommendation).
0.70::acc(s19, skill_level_recommendation).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values aggressive_freeride_freestyle=Aggressive_freeride_riders_freestyle_versatility unk_skill_level_recommendation=Unknown
% @importance 0.83

0.92::true_val(skill_level_recommendation, aggressive_freeride_freestyle); 0.08::true_val(skill_level_recommendation, unk_skill_level_recommendation).
measured(s16, skill_level_recommendation, aggressive_freeride_freestyle).
measured(s19, skill_level_recommendation, aggressive_freeride_freestyle).
all_consistent(skill_level_recommendation) :- consistent(s16, skill_level_recommendation), consistent(s19, skill_level_recommendation).
evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, aggressive_freeride_freestyle)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

0.78::acc(s76, negative_aspect_beginner).
0.75::acc(s15, negative_aspect_beginner).

% @attr negative_aspect_beginner
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values not_beginner_friendly=Far_from_beginner_friendly unk_negative_aspect_beginner=Unknown
% @importance 0.70

0.88::true_val(negative_aspect_beginner, not_beginner_friendly); 0.12::true_val(negative_aspect_beginner, unk_negative_aspect_beginner).
measured(s76, negative_aspect_beginner, not_beginner_friendly).
measured(s15, negative_aspect_beginner, not_beginner_friendly).
all_consistent(negative_aspect_beginner) :- consistent(s76, negative_aspect_beginner), consistent(s15, negative_aspect_beginner).
evidence(all_consistent(negative_aspect_beginner)).
query(true_val(negative_aspect_beginner, not_beginner_friendly)).
query(true_val(negative_aspect_beginner, unk_negative_aspect_beginner)).

0.93::acc(s16, terrain_suitability_steep).
0.78::acc(s18, terrain_suitability_steep).

% @attr terrain_suitability_steep
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values steep_powder_variable=Steep_technical_terrain_powder_variable_conditions unk_terrain_suitability_steep=Unknown
% @importance 0.83

0.92::true_val(terrain_suitability_steep, steep_powder_variable); 0.08::true_val(terrain_suitability_steep, unk_terrain_suitability_steep).
measured(s16, terrain_suitability_steep, steep_powder_variable).
measured(s18, terrain_suitability_steep, steep_powder_variable).
all_consistent(terrain_suitability_steep) :- consistent(s16, terrain_suitability_steep), consistent(s18, terrain_suitability_steep).
evidence(all_consistent(terrain_suitability_steep)).
query(true_val(terrain_suitability_steep, steep_powder_variable)).
query(true_val(terrain_suitability_steep, unk_terrain_suitability_steep)).

0.93::acc(s1, price_usd_msrp).
0.93::acc(s16, price_usd_msrp).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v699_95=699.95
% @importance 0.90

0.95::true_val(price_usd_msrp, v699_95); 0.05::true_val(price_usd_msrp, unk_price_usd_msrp).
measured(s1, price_usd_msrp, v699_95).
measured(s16, price_usd_msrp, v699_95).
all_consistent(price_usd_msrp) :- consistent(s1, price_usd_msrp), consistent(s16, price_usd_msrp).
evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v699_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

0.82::acc(s11, price_usd_backcountry).
0.80::acc(s35, price_usd_backcountry).

% @attr price_usd_backcountry
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_backcountry
% @values v559_96=559.96
% @importance 0.85

0.88::true_val(price_usd_backcountry, v559_96); 0.12::true_val(price_usd_backcountry, unk_price_usd_backcountry).
measured(s11, price_usd_backcountry, v559_96).
measured(s35, price_usd_backcountry, v559_96).
all_consistent(price_usd_backcountry) :- consistent(s11, price_usd_backcountry), consistent(s35, price_usd_backcountry).
evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v559_96)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

0.82::acc(s11, price_usd_gravity_coalition).
0.80::acc(s35, price_usd_gravity_coalition).

% @attr price_usd_gravity_coalition
% @type numeric
% @unit USD
% @canonical false
% @original_name Price (Gravity Coalition, USD)
% @values v699_95=699.95
% @importance 0.85

0.88::true_val(price_usd_gravity_coalition, v699_95); 0.12::true_val(price_usd_gravity_coalition, unk_price_usd_gravity_coalition).
measured(s11, price_usd_gravity_coalition, v699_95).
measured(s35, price_usd_gravity_coalition, v699_95).
all_consistent(price_usd_gravity_coalition) :- consistent(s11, price_usd_gravity_coalition), consistent(s35, price_usd_gravity_coalition).
evidence(all_consistent(price_usd_gravity_coalition)).
query(true_val(price_usd_gravity_coalition, v699_95)).
query(true_val(price_usd_gravity_coalition, unk_price_usd_gravity_coalition)).

0.85::acc(s89, price_usd_rei).

% @attr price_usd_rei
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_rei
% @values v699_95=699.95
% @importance 0.75

0.85::true_val(price_usd_rei, v699_95); 0.15::true_val(price_usd_rei, unk_price_usd_rei).
measured(s89, price_usd_rei, v699_95).
all_consistent(price_usd_rei) :- (indep(s82), consistent(s89, price_usd_rei) ; \+indep(s82)).
evidence(all_consistent(price_usd_rei)).
query(true_val(price_usd_rei, v699_95)).
query(true_val(price_usd_rei, unk_price_usd_rei)).

0.65::acc(s86, price_usd_wws).

% @attr price_usd_wws
% @type categorical
% @canonical false
% @original_name Price (WWS Boardshop, regular/sale)
% @values regular_699_99_sale_559_96=Regular_699_99_Sale_559_96 unk_price_usd_wws=Unknown
% @importance 0.75

0.62::true_val(price_usd_wws, regular_699_99_sale_559_96); 0.38::true_val(price_usd_wws, unk_price_usd_wws).
measured(s86, price_usd_wws, regular_699_99_sale_559_96).
all_consistent(price_usd_wws) :- (indep(s86), consistent(s86, price_usd_wws) ; \+indep(s86)).
evidence(all_consistent(price_usd_wws)).
query(true_val(price_usd_wws, regular_699_99_sale_559_96)).
query(true_val(price_usd_wws, unk_price_usd_wws)).

0.93::acc(s1, comparable_board_same_brand_flagship_price).

% @attr comparable_board_same_brand_flagship_price
% @type numeric
% @unit USD
% @canonical false
% @original_name comparable_board_same_brand
% @values v899_95=899.95
% @importance 0.90

0.90::true_val(comparable_board_same_brand_flagship_price, v899_95); 0.10::true_val(comparable_board_same_brand_flagship_price, unk_comparable_board_same_brand_flagship_price).
measured(s1, comparable_board_same_brand_flagship_price, v899_95).
all_consistent(comparable_board_same_brand_flagship_price) :- consistent(s1, comparable_board_same_brand_flagship_price).
evidence(all_consistent(comparable_board_same_brand_flagship_price)).
query(true_val(comparable_board_same_brand_flagship_price, v899_95)).
query(true_val(comparable_board_same_brand_flagship_price, unk_comparable_board_same_brand_flagship_price)).

0.93::acc(s1, comparable_board_same_brand_stratos_price).

% @attr comparable_board_same_brand_stratos_price
% @type numeric
% @unit USD
% @canonical false
% @original_name comparable_board_same_brand
% @values v669_95=669.95
% @importance 0.90

0.90::true_val(comparable_board_same_brand_stratos_price, v669_95); 0.10::true_val(comparable_board_same_brand_stratos_price, unk_comparable_board_same_brand_stratos_price).
measured(s1, comparable_board_same_brand_stratos_price, v669_95).
all_consistent(comparable_board_same_brand_stratos_price) :- consistent(s1, comparable_board_same_brand_stratos_price).
evidence(all_consistent(comparable_board_same_brand_stratos_price)).
query(true_val(comparable_board_same_brand_stratos_price, v669_95)).
query(true_val(comparable_board_same_brand_stratos_price, unk_comparable_board_same_brand_stratos_price)).

0.82::acc(s11, price_eur_blue_tomato).
0.68::acc(s25, price_eur_blue_tomato).

% @attr price_eur_blue_tomato
% @type numeric
% @unit EUR
% @canonical true
% @original_name price_eur_blue_tomato
% @values v599=599.0
% @importance 0.73

0.88::true_val(price_eur_blue_tomato, v599); 0.12::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).
measured(s11, price_eur_blue_tomato, v599).
measured(s25, price_eur_blue_tomato, v599).
all_consistent(price_eur_blue_tomato) :- consistent(s11, price_eur_blue_tomato), (indep(s25), consistent(s25, price_eur_blue_tomato) ; \+indep(s25)).
evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v599)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

0.72::acc(s4, price_aud_merchant_preorder).

% @attr price_aud_merchant_preorder
% @type numeric
% @unit AUD
% @canonical false
% @original_name price_aud_merchant
% @values v1199_99=1199.99
% @importance 0.90

0.90::true_val(price_aud_merchant_preorder, v1199_99); 0.10::true_val(price_aud_merchant_preorder, unk_price_aud_merchant_preorder).
measured(s4, price_aud_merchant_preorder, v1199_99).
all_consistent(price_aud_merchant_preorder) :- (indep(s4), consistent(s4, price_aud_merchant_preorder) ; \+indep(s4)).
evidence(all_consistent(price_aud_merchant_preorder)).
query(true_val(price_aud_merchant_preorder, v1199_99)).
query(true_val(price_aud_merchant_preorder, unk_price_aud_merchant_preorder)).

0.62::acc(s39, price_aud_merchant).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v784=784.0
% @importance 0.80

0.60::true_val(price_aud_merchant, v784); 0.40::true_val(price_aud_merchant, unk_price_aud_merchant).
measured(s39, price_aud_merchant, v784).
all_consistent(price_aud_merchant) :- (indep(s39), consistent(s39, price_aud_merchant) ; \+indep(s39)).
evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v784)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

0.93::acc(s1, availability_status_jones_2026).

% @attr availability_status_jones_2026
% @type categorical
% @canonical false
% @original_name availability_status
% @values sold_out=Sold_out_2025_2026 unk_availability_status_jones_2026=Unknown
% @importance 0.90

0.90::true_val(availability_status_jones_2026, sold_out); 0.10::true_val(availability_status_jones_2026, unk_availability_status_jones_2026).
measured(s1, availability_status_jones_2026, sold_out).
all_consistent(availability_status_jones_2026) :- consistent(s1, availability_status_jones_2026).
evidence(all_consistent(availability_status_jones_2026)).
query(true_val(availability_status_jones_2026, sold_out)).
query(true_val(availability_status_jones_2026, unk_availability_status_jones_2026)).

0.82::acc(s7, availability_status_evo_2026).

% @attr availability_status_evo_2026
% @type categorical
% @canonical false
% @original_name availability_status
% @values sold_out_2026=Sold_out_2026_model unk_availability_status_evo_2026=Unknown
% @importance 0.80

0.80::true_val(availability_status_evo_2026, sold_out_2026); 0.20::true_val(availability_status_evo_2026, unk_availability_status_evo_2026).
measured(s7, availability_status_evo_2026, sold_out_2026).
all_consistent(availability_status_evo_2026) :- (indep(s7), consistent(s7, availability_status_evo_2026) ; \+indep(s7)).
evidence(all_consistent(availability_status_evo_2026)).
query(true_val(availability_status_evo_2026, sold_out_2026)).
query(true_val(availability_status_evo_2026, unk_availability_status_evo_2026)).

0.85::acc(s82, availability_status_rei_2026).
0.85::acc(s89, availability_status_rei_2026).

% @attr availability_status_rei_2026
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed_2025_26=Listed_2025_2026 unk_availability_status_rei_2026=Unknown
% @importance 0.70

0.90::true_val(availability_status_rei_2026, listed_2025_26); 0.10::true_val(availability_status_rei_2026, unk_availability_status_rei_2026).
measured(s82, availability_status_rei_2026, listed_2025_26).
measured(s89, availability_status_rei_2026, listed_2025_26).
all_consistent(availability_status_rei_2026) :- (indep(s82), consistent(s82, availability_status_rei_2026) ; \+indep(s82)), (indep(s82), consistent(s89, availability_status_rei_2026) ; \+indep(s82)).
evidence(all_consistent(availability_status_rei_2026)).
query(true_val(availability_status_rei_2026, listed_2025_26)).
query(true_val(availability_status_rei_2026, unk_availability_status_rei_2026)).

0.82::acc(s11, availability_status_backcountry).

% @attr availability_status_backcountry
% @type categorical
% @canonical false
% @original_name availability_status
% @values discounted_available=Available_discounted_2026_model unk_availability_status_backcountry=Unknown
% @importance 0.85

0.80::true_val(availability_status_backcountry, discounted_available); 0.20::true_val(availability_status_backcountry, unk_availability_status_backcountry).
measured(s11, availability_status_backcountry, discounted_available).
all_consistent(availability_status_backcountry) :- consistent(s11, availability_status_backcountry).
evidence(all_consistent(availability_status_backcountry)).
query(true_val(availability_status_backcountry, discounted_available)).
query(true_val(availability_status_backcountry, unk_availability_status_backcountry)).

0.72::acc(s4, availability_status).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values preorder_2027_june=Preorder_2027_estimated_June_2026 unk_availability_status=Unknown
% @importance 0.90

0.90::true_val(availability_status, preorder_2027_june); 0.10::true_val(availability_status, unk_availability_status).
measured(s4, availability_status, preorder_2027_june).
all_consistent(availability_status) :- (indep(s4), consistent(s4, availability_status) ; \+indep(s4)).
evidence(all_consistent(availability_status)).
query(true_val(availability_status, preorder_2027_june)).
query(true_val(availability_status, unk_availability_status)).

0.68::acc(s8, availability_status_balmoral).

% @attr availability_status_balmoral
% @type categorical
% @canonical false
% @original_name availability_status
% @values preorder_2027_june_bal=Preorder_2027_early_June_2026 unk_availability_status_balmoral=Unknown
% @importance 0.70

0.70::true_val(availability_status_balmoral, preorder_2027_june_bal); 0.30::true_val(availability_status_balmoral, unk_availability_status_balmoral).
measured(s8, availability_status_balmoral, preorder_2027_june_bal).
all_consistent(availability_status_balmoral) :- (indep(s8), consistent(s8, availability_status_balmoral) ; \+indep(s8)).
evidence(all_consistent(availability_status_balmoral)).
query(true_val(availability_status_balmoral, preorder_2027_june_bal)).
query(true_val(availability_status_balmoral, unk_availability_status_balmoral)).

0.62::acc(s39, availability_status_xdream).

% @attr availability_status_xdream
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_2027=2027_model_available unk_availability_status_xdream=Unknown
% @importance 0.80

0.60::true_val(availability_status_xdream, available_2027); 0.40::true_val(availability_status_xdream, unk_availability_status_xdream).
measured(s39, availability_status_xdream, available_2027).
all_consistent(availability_status_xdream) :- (indep(s39), consistent(s39, availability_status_xdream) ; \+indep(s39)).
evidence(all_consistent(availability_status_xdream)).
query(true_val(availability_status_xdream, available_2027)).
query(true_val(availability_status_xdream, unk_availability_status_xdream)).

0.65::acc(s9, availability_status_cardrona).

% @attr availability_status_cardrona
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed_2027=2027_model_listed unk_availability_status_cardrona=Unknown
% @importance 0.60

0.58::true_val(availability_status_cardrona, listed_2027); 0.42::true_val(availability_status_cardrona, unk_availability_status_cardrona).
measured(s9, availability_status_cardrona, listed_2027).
all_consistent(availability_status_cardrona) :- (indep(s9), consistent(s9, availability_status_cardrona) ; \+indep(s9)).
evidence(all_consistent(availability_status_cardrona)).
query(true_val(availability_status_cardrona, listed_2027)).
query(true_val(availability_status_cardrona, unk_availability_status_cardrona)).

0.72::acc(s32, availability_status_milosport).

% @attr availability_status_milosport
% @type categorical
% @canonical false
% @original_name availability_status
% @values in_stock_womens_2027=2027_Womens_699_95_in_stock unk_availability_status_milosport=Unknown
% @importance 0.70

0.68::true_val(availability_status_milosport, in_stock_womens_2027); 0.32::true_val(availability_status_milosport, unk_availability_status_milosport).
measured(s32, availability_status_milosport, in_stock_womens_2027).
all_consistent(availability_status_milosport) :- (indep(s32), consistent(s32, availability_status_milosport) ; \+indep(s32)).
evidence(all_consistent(availability_status_milosport)).
query(true_val(availability_status_milosport, in_stock_womens_2027)).
query(true_val(availability_status_milosport, unk_availability_status_milosport)).

0.70::acc(s30, availability_status_zezula).

% @attr availability_status_zezula
% @type categorical
% @canonical false
% @original_name availability_status
% @values in_stock_2025_26=In_stock_2025_2026 unk_availability_status_zezula=Unknown
% @importance 0.50

0.60::true_val(availability_status_zezula, in_stock_2025_26); 0.40::true_val(availability_status_zezula, unk_availability_status_zezula).
measured(s30, availability_status_zezula, in_stock_2025_26).
all_consistent(availability_status_zezula) :- (indep(s30), consistent(s30, availability_status_zezula) ; \+indep(s30)).
evidence(all_consistent(availability_status_zezula)).
query(true_val(availability_status_zezula, in_stock_2025_26)).
query(true_val(availability_status_zezula, unk_availability_status_zezula)).

0.68::acc(s25, availability_status_snowcountry).

% @attr availability_status_snowcountry
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed_sc=Listed unk_availability_status_snowcountry=Unknown
% @importance 0.60

0.58::true_val(availability_status_snowcountry, listed_sc); 0.42::true_val(availability_status_snowcountry, unk_availability_status_snowcountry).
measured(s25, availability_status_snowcountry, listed_sc).
all_consistent(availability_status_snowcountry) :- (indep(s25), consistent(s25, availability_status_snowcountry) ; \+indep(s25)).
evidence(all_consistent(availability_status_snowcountry)).
query(true_val(availability_status_snowcountry, listed_sc)).
query(true_val(availability_status_snowcountry, unk_availability_status_snowcountry)).

0.68::acc(s8, warranty_period_years).

% @attr warranty_period_years
% @type numeric
% @unit years
% @canonical true
% @original_name warranty_period_years
% @values v3=3.0
% @importance 0.70

0.70::true_val(warranty_period_years, v3); 0.30::true_val(warranty_period_years, unk_warranty_period_years).
measured(s8, warranty_period_years, v3).
all_consistent(warranty_period_years) :- (indep(s8), consistent(s8, warranty_period_years) ; \+indep(s8)).
evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v3)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

0.93::acc(s1, return_policy_terms).

% @attr return_policy_terms
% @type categorical
% @canonical true
% @original_name return_policy_terms
% @values thirty_day_returns=30_day_returns_unused_buyer_ships_discounted_final unk_return_policy_terms=Unknown
% @importance 0.90

0.90::true_val(return_policy_terms, thirty_day_returns); 0.10::true_val(return_policy_terms, unk_return_policy_terms).
measured(s1, return_policy_terms, thirty_day_returns).
all_consistent(return_policy_terms) :- consistent(s1, return_policy_terms).
evidence(all_consistent(return_policy_terms)).
query(true_val(return_policy_terms, thirty_day_returns)).
query(true_val(return_policy_terms, unk_return_policy_terms)).

0.90::acc(s67, reviewer_opinion_whitelines).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values best_overall=Best_overall_snowboard_1_of_59_at_Kirkwood unk_reviewer_opinion_whitelines=Unknown
% @importance 0.95

0.90::true_val(reviewer_opinion_whitelines, best_overall); 0.10::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).
measured(s67, reviewer_opinion_whitelines, best_overall).
all_consistent(reviewer_opinion_whitelines) :- consistent(s67, reviewer_opinion_whitelines).
evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, best_overall)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

0.90::acc(s67, outside_editors_choice).

% @attr outside_editors_choice
% @type categorical
% @canonical false
% @original_name Outside Online Editors' Choice
% @values won_both=Won_mens_and_womens_tests unk_outside_editors_choice=Unknown
% @importance 0.95

0.90::true_val(outside_editors_choice, won_both); 0.10::true_val(outside_editors_choice, unk_outside_editors_choice).
measured(s67, outside_editors_choice, won_both).
all_consistent(outside_editors_choice) :- consistent(s67, outside_editors_choice).
evidence(all_consistent(outside_editors_choice)).
query(true_val(outside_editors_choice, won_both)).
query(true_val(outside_editors_choice, unk_outside_editors_choice)).

0.93::acc(s1, user_review_forum).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values five_stars_22=5_stars_22_reviews unk_user_review_forum=Unknown
% @importance 0.90

0.90::true_val(user_review_forum, five_stars_22); 0.10::true_val(user_review_forum, unk_user_review_forum).
measured(s1, user_review_forum, five_stars_22).
all_consistent(user_review_forum) :- consistent(s1, user_review_forum).
evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, five_stars_22)).
query(true_val(user_review_forum, unk_user_review_forum)).

0.87::acc(s49, ogl_assessment).
0.87::acc(s62, ogl_assessment).

% @attr ogl_assessment
% @type categorical
% @canonical false
% @original_name Outdoor Gear Lab assessment
% @values fav_carving=Testers_favorite_board_for_carving_groomed_runs unk_ogl_assessment=Unknown
% @importance 0.85

0.90::true_val(ogl_assessment, fav_carving); 0.10::true_val(ogl_assessment, unk_ogl_assessment).
measured(s49, ogl_assessment, fav_carving).
measured(s62, ogl_assessment, fav_carving).
all_consistent(ogl_assessment) :- consistent(s49, ogl_assessment), consistent(s62, ogl_assessment).
evidence(all_consistent(ogl_assessment)).
query(true_val(ogl_assessment, fav_carving)).
query(true_val(ogl_assessment, unk_ogl_assessment)).

0.87::acc(s49, positive_aspect).
0.87::acc(s62, positive_aspect).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values exceptional_carving=Exceptional_carving_favorite_for_corduroy unk_positive_aspect=Unknown
% @importance 0.85

0.90::true_val(positive_aspect, exceptional_carving); 0.10::true_val(positive_aspect, unk_positive_aspect).
measured(s49, positive_aspect, exceptional_carving).
measured(s62, positive_aspect, exceptional_carving).
all_consistent(positive_aspect) :- consistent(s49, positive_aspect), consistent(s62, positive_aspect).
evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, exceptional_carving)).
query(true_val(positive_aspect, unk_positive_aspect)).

0.87::acc(s12, edge_hold).
0.87::acc(s49, edge_hold).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values outstanding=Outstanding_edge_grip_hardpack_icy unk_edge_hold=Unknown
% @importance 0.85

0.90::true_val(edge_hold, outstanding); 0.10::true_val(edge_hold, unk_edge_hold).
measured(s12, edge_hold, outstanding).
measured(s49, edge_hold, outstanding).
all_consistent(edge_hold) :- consistent(s12, edge_hold), consistent(s49, edge_hold).
evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, outstanding)).
query(true_val(edge_hold, unk_edge_hold)).

0.70::acc(s19, pop).
0.65::acc(s71, pop).

% @attr pop
% @type categorical
% @canonical true
% @original_name pop
% @values exceptional=Exceptional_pop_from_tail unk_pop=Unknown
% @importance 0.73

0.85::true_val(pop, exceptional); 0.15::true_val(pop, unk_pop).
measured(s19, pop, exceptional).
measured(s71, pop, exceptional).
all_consistent(pop) :- consistent(s19, pop), consistent(s71, pop).
evidence(all_consistent(pop)).
query(true_val(pop, exceptional)).
query(true_val(pop, unk_pop)).

0.87::acc(s12, positive_aspect_stability).
0.87::acc(s62, positive_aspect_stability).

% @attr positive_aspect_stability
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values high_speed_stable=Astounding_stability_at_high_speeds unk_positive_aspect_stability=Unknown
% @importance 0.83

0.90::true_val(positive_aspect_stability, high_speed_stable); 0.10::true_val(positive_aspect_stability, unk_positive_aspect_stability).
measured(s12, positive_aspect_stability, high_speed_stable).
measured(s62, positive_aspect_stability, high_speed_stable).
all_consistent(positive_aspect_stability) :- consistent(s12, positive_aspect_stability), consistent(s62, positive_aspect_stability).
evidence(all_consistent(positive_aspect_stability)).
query(true_val(positive_aspect_stability, high_speed_stable)).
query(true_val(positive_aspect_stability, unk_positive_aspect_stability)).

0.87::acc(s12, positive_aspect_float).
0.70::acc(s19, positive_aspect_float).

% @attr positive_aspect_float
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values good_float=Good_float_for_cambered_board unk_positive_aspect_float=Unknown
% @importance 0.83

0.88::true_val(positive_aspect_float, good_float); 0.12::true_val(positive_aspect_float, unk_positive_aspect_float).
measured(s12, positive_aspect_float, good_float).
measured(s19, positive_aspect_float, good_float).
all_consistent(positive_aspect_float) :- consistent(s12, positive_aspect_float), consistent(s19, positive_aspect_float).
evidence(all_consistent(positive_aspect_float)).
query(true_val(positive_aspect_float, good_float)).
query(true_val(positive_aspect_float, unk_positive_aspect_float)).

0.85::acc(s15, chatter_performance).
0.87::acc(s62, chatter_performance).

% @attr chatter_performance
% @type categorical
% @canonical true
% @original_name chatter_performance
% @values minimal_chatter=Minimal_chatter_at_speed_crud_slush_groomers unk_chatter_performance=Unknown
% @importance 0.68

0.90::true_val(chatter_performance, minimal_chatter); 0.10::true_val(chatter_performance, unk_chatter_performance).
measured(s15, chatter_performance, minimal_chatter).
measured(s62, chatter_performance, minimal_chatter).
all_consistent(chatter_performance) :- consistent(s15, chatter_performance), consistent(s62, chatter_performance).
evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, minimal_chatter)).
query(true_val(chatter_performance, unk_chatter_performance)).

0.87::acc(s12, positive_aspect_versatility).
0.90::acc(s67, positive_aspect_versatility).

% @attr positive_aspect_versatility
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values handles_all_terrain=Handles_groomers_powder_steeps_freestyle unk_positive_aspect_versatility=Unknown
% @importance 0.93

0.92::true_val(positive_aspect_versatility, handles_all_terrain); 0.08::true_val(positive_aspect_versatility, unk_positive_aspect_versatility).
measured(s12, positive_aspect_versatility, handles_all_terrain).
measured(s67, positive_aspect_versatility, handles_all_terrain).
all_consistent(positive_aspect_versatility) :- consistent(s12, positive_aspect_versatility), consistent(s67, positive_aspect_versatility).
evidence(all_consistent(positive_aspect_versatility)).
query(true_val(positive_aspect_versatility, handles_all_terrain)).
query(true_val(positive_aspect_versatility, unk_positive_aspect_versatility)).

0.93::acc(s16, positive_aspect_ride_shorter).
0.87::acc(s21, positive_aspect_ride_shorter).

% @attr positive_aspect_ride_shorter
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values ride_shorter=Can_be_ridden_shorter_due_to_maximized_effective_edge unk_positive_aspect_ride_shorter=Unknown
% @importance 0.80

0.92::true_val(positive_aspect_ride_shorter, ride_shorter); 0.08::true_val(positive_aspect_ride_shorter, unk_positive_aspect_ride_shorter).
measured(s16, positive_aspect_ride_shorter, ride_shorter).
measured(s21, positive_aspect_ride_shorter, ride_shorter).
all_consistent(positive_aspect_ride_shorter) :- consistent(s16, positive_aspect_ride_shorter), consistent(s21, positive_aspect_ride_shorter).
evidence(all_consistent(positive_aspect_ride_shorter)).
query(true_val(positive_aspect_ride_shorter, ride_shorter)).
query(true_val(positive_aspect_ride_shorter, unk_positive_aspect_ride_shorter)).

0.82::acc(s28, positive_aspect_build_quality).
0.80::acc(s35, positive_aspect_build_quality).

% @attr positive_aspect_build_quality
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values well_made=Pretty_well_made_upper_middle_reliability unk_positive_aspect_build_quality=Unknown
% @importance 0.70

0.85::true_val(positive_aspect_build_quality, well_made); 0.15::true_val(positive_aspect_build_quality, unk_positive_aspect_build_quality).
measured(s28, positive_aspect_build_quality, well_made).
measured(s35, positive_aspect_build_quality, well_made).
all_consistent(positive_aspect_build_quality) :- consistent(s28, positive_aspect_build_quality), consistent(s35, positive_aspect_build_quality).
evidence(all_consistent(positive_aspect_build_quality)).
query(true_val(positive_aspect_build_quality, well_made)).
query(true_val(positive_aspect_build_quality, unk_positive_aspect_build_quality)).

0.88::acc(s13, positive_aspect_base_durability).

% @attr positive_aspect_base_durability
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values durable_base=Sintered_8000_great_after_20_days unk_positive_aspect_base_durability=Unknown
% @importance 0.85

0.85::true_val(positive_aspect_base_durability, durable_base); 0.15::true_val(positive_aspect_base_durability, unk_positive_aspect_base_durability).
measured(s13, positive_aspect_base_durability, durable_base).
all_consistent(positive_aspect_base_durability) :- consistent(s13, positive_aspect_base_durability).
evidence(all_consistent(positive_aspect_base_durability)).
query(true_val(positive_aspect_base_durability, durable_base)).
query(true_val(positive_aspect_base_durability, unk_positive_aspect_base_durability)).

0.88::acc(s13, positive_aspect_forever_flex).

% @attr positive_aspect_forever_flex
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values flex_maintained=Forever_Flex_maintains_consistent_flex unk_positive_aspect_forever_flex=Unknown
% @importance 0.85

0.85::true_val(positive_aspect_forever_flex, flex_maintained); 0.15::true_val(positive_aspect_forever_flex, unk_positive_aspect_forever_flex).
measured(s13, positive_aspect_forever_flex, flex_maintained).
all_consistent(positive_aspect_forever_flex) :- consistent(s13, positive_aspect_forever_flex).
evidence(all_consistent(positive_aspect_forever_flex)).
query(true_val(positive_aspect_forever_flex, flex_maintained)).
query(true_val(positive_aspect_forever_flex, unk_positive_aspect_forever_flex)).

0.87::acc(s12, negative_aspect).
0.87::acc(s49, negative_aspect).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values too_stiff_park=Too_stiff_for_rails_buttering_park unk_negative_aspect=Unknown
% @importance 0.85

0.90::true_val(negative_aspect, too_stiff_park); 0.10::true_val(negative_aspect, unk_negative_aspect).
measured(s12, negative_aspect, too_stiff_park).
measured(s49, negative_aspect, too_stiff_park).
all_consistent(negative_aspect) :- consistent(s12, negative_aspect), consistent(s49, negative_aspect).
evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, too_stiff_park)).
query(true_val(negative_aspect, unk_negative_aspect)).

0.87::acc(s12, negative_aspect_buttering).
0.87::acc(s49, negative_aspect_buttering).

% @attr negative_aspect_buttering
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values butter_effort=Pressing_buttering_requires_decent_effort unk_negative_aspect_buttering=Unknown
% @importance 0.85

0.90::true_val(negative_aspect_buttering, butter_effort); 0.10::true_val(negative_aspect_buttering, unk_negative_aspect_buttering).
measured(s12, negative_aspect_buttering, butter_effort).
measured(s49, negative_aspect_buttering, butter_effort).
all_consistent(negative_aspect_buttering) :- consistent(s12, negative_aspect_buttering), consistent(s49, negative_aspect_buttering).
evidence(all_consistent(negative_aspect_buttering)).
query(true_val(negative_aspect_buttering, butter_effort)).
query(true_val(negative_aspect_buttering, unk_negative_aspect_buttering)).

0.78::acc(s18, negative_aspect_wide_sluggish).

% @attr negative_aspect_wide_sluggish
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values wide_sluggish=Wide_variants_sluggish_edge_to_edge unk_negative_aspect_wide_sluggish=Unknown
% @importance 0.75

0.72::true_val(negative_aspect_wide_sluggish, wide_sluggish); 0.28::true_val(negative_aspect_wide_sluggish, unk_negative_aspect_wide_sluggish).
measured(s18, negative_aspect_wide_sluggish, wide_sluggish).
all_consistent(negative_aspect_wide_sluggish) :- consistent(s18, negative_aspect_wide_sluggish).
evidence(all_consistent(negative_aspect_wide_sluggish)).
query(true_val(negative_aspect_wide_sluggish, wide_sluggish)).
query(true_val(negative_aspect_wide_sluggish, unk_negative_aspect_wide_sluggish)).

0.82::acc(s64, negative_aspect_line_length).

% @attr negative_aspect_line_length
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values short_medium_lines=Better_for_short_to_medium_lines unk_negative_aspect_line_length=Unknown
% @importance 0.80

0.80::true_val(negative_aspect_line_length, short_medium_lines); 0.20::true_val(negative_aspect_line_length, unk_negative_aspect_line_length).
measured(s64, negative_aspect_line_length, short_medium_lines).
all_consistent(negative_aspect_line_length) :- consistent(s64, negative_aspect_line_length).
evidence(all_consistent(negative_aspect_line_length)).
query(true_val(negative_aspect_line_length, short_medium_lines)).
query(true_val(negative_aspect_line_length, unk_negative_aspect_line_length)).

0.65::acc(s43, negative_aspect_camber_catch).

% @attr negative_aspect_camber_catch
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values camber_catch=Full_camber_low_setback_can_catch_in_variable_terrain unk_negative_aspect_camber_catch=Unknown
% @importance 0.70

0.55::true_val(negative_aspect_camber_catch, camber_catch); 0.45::true_val(negative_aspect_camber_catch, unk_negative_aspect_camber_catch).
measured(s43, negative_aspect_camber_catch, camber_catch).
all_consistent(negative_aspect_camber_catch) :- consistent(s43, negative_aspect_camber_catch).
evidence(all_consistent(negative_aspect_camber_catch)).
query(true_val(negative_aspect_camber_catch, camber_catch)).
query(true_val(negative_aspect_camber_catch, unk_negative_aspect_camber_catch)).

0.82::acc(s28, negative_aspect_topsheet).
0.80::acc(s35, negative_aspect_topsheet).

% @attr negative_aspect_topsheet
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values topsheet_scuffing=Topsheet_prone_to_minor_scuffing unk_negative_aspect_topsheet=Unknown
% @importance 0.70

0.85::true_val(negative_aspect_topsheet, topsheet_scuffing); 0.15::true_val(negative_aspect_topsheet, unk_negative_aspect_topsheet).
measured(s28, negative_aspect_topsheet, topsheet_scuffing).
measured(s35, negative_aspect_topsheet, topsheet_scuffing).
all_consistent(negative_aspect_topsheet) :- consistent(s28, negative_aspect_topsheet), consistent(s35, negative_aspect_topsheet).
evidence(all_consistent(negative_aspect_topsheet)).
query(true_val(negative_aspect_topsheet, topsheet_scuffing)).
query(true_val(negative_aspect_topsheet, unk_negative_aspect_topsheet)).

0.65::acc(s43, user_review_forum_inserts).
0.65::acc(s77, user_review_forum_inserts).

% @attr user_review_forum_inserts
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values insert_layout_bad=Insert_layout_very_stupid_limited_stance_width unk_user_review_forum_inserts=Unknown
% @importance 0.70

0.70::true_val(user_review_forum_inserts, insert_layout_bad); 0.30::true_val(user_review_forum_inserts, unk_user_review_forum_inserts).
measured(s43, user_review_forum_inserts, insert_layout_bad).
measured(s77, user_review_forum_inserts, insert_layout_bad).
all_consistent(user_review_forum_inserts) :- consistent(s43, user_review_forum_inserts), consistent(s77, user_review_forum_inserts).
evidence(all_consistent(user_review_forum_inserts)).
query(true_val(user_review_forum_inserts, insert_layout_bad)).
query(true_val(user_review_forum_inserts, unk_user_review_forum_inserts)).

0.82::acc(s64, negative_aspect_powder).

% @attr negative_aspect_powder
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values better_powder_exists=Better_powder_boards_in_Jones_lineup unk_negative_aspect_powder=Unknown
% @importance 0.80

0.80::true_val(negative_aspect_powder, better_powder_exists); 0.20::true_val(negative_aspect_powder, unk_negative_aspect_powder).
measured(s64, negative_aspect_powder, better_powder_exists).
all_consistent(negative_aspect_powder) :- consistent(s64, negative_aspect_powder).
evidence(all_consistent(negative_aspect_powder)).
query(true_val(negative_aspect_powder, better_powder_exists)).
query(true_val(negative_aspect_powder, unk_negative_aspect_powder)).

0.60::acc(s42, user_review_forum_sizing).
0.62::acc(s48, user_review_forum_sizing).

% @attr user_review_forum_sizing
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values want_164=200lb_riders_on_161_wish_for_164 unk_user_review_forum_sizing=Unknown
% @importance 0.75

0.68::true_val(user_review_forum_sizing, want_164); 0.32::true_val(user_review_forum_sizing, unk_user_review_forum_sizing).
measured(s42, user_review_forum_sizing, want_164).
measured(s48, user_review_forum_sizing, want_164).
all_consistent(user_review_forum_sizing) :- consistent(s42, user_review_forum_sizing), consistent(s48, user_review_forum_sizing).
evidence(all_consistent(user_review_forum_sizing)).
query(true_val(user_review_forum_sizing, want_164)).
query(true_val(user_review_forum_sizing, unk_user_review_forum_sizing)).

0.82::acc(s11, reviewer_opinion_the_good_ride).
0.80::acc(s35, reviewer_opinion_the_good_ride).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values tapered_aviator=More_tapered_directional_Aviator_2_0 unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.85

0.85::true_val(reviewer_opinion_the_good_ride, tapered_aviator); 0.15::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).
measured(s11, reviewer_opinion_the_good_ride, tapered_aviator).
measured(s35, reviewer_opinion_the_good_ride, tapered_aviator).
all_consistent(reviewer_opinion_the_good_ride) :- consistent(s11, reviewer_opinion_the_good_ride), consistent(s35, reviewer_opinion_the_good_ride).
evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, tapered_aviator)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

0.65::acc(s46, reviewer_opinion_softer_feel).

% @attr reviewer_opinion_softer_feel
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values softer_than_specs=Board_feels_softer_than_specs unk_reviewer_opinion_softer_feel=Unknown
% @importance 0.70

0.55::true_val(reviewer_opinion_softer_feel, softer_than_specs); 0.45::true_val(reviewer_opinion_softer_feel, unk_reviewer_opinion_softer_feel).
measured(s46, reviewer_opinion_softer_feel, softer_than_specs).
all_consistent(reviewer_opinion_softer_feel) :- consistent(s46, reviewer_opinion_softer_feel).
evidence(all_consistent(reviewer_opinion_softer_feel)).
query(true_val(reviewer_opinion_softer_feel, softer_than_specs)).
query(true_val(reviewer_opinion_softer_feel, unk_reviewer_opinion_softer_feel)).

0.60::acc(s51, reviewer_opinion_aggressiveness).

% @attr reviewer_opinion_aggressiveness
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values overstated=Aggressiveness_overstated_fairly_friendly_if_sized_smaller unk_reviewer_opinion_aggressiveness=Unknown
% @importance 0.65

0.50::true_val(reviewer_opinion_aggressiveness, overstated); 0.50::true_val(reviewer_opinion_aggressiveness, unk_reviewer_opinion_aggressiveness).
measured(s51, reviewer_opinion_aggressiveness, overstated).
all_consistent(reviewer_opinion_aggressiveness) :- consistent(s51, reviewer_opinion_aggressiveness).
evidence(all_consistent(reviewer_opinion_aggressiveness)).
query(true_val(reviewer_opinion_aggressiveness, overstated)).
query(true_val(reviewer_opinion_aggressiveness, unk_reviewer_opinion_aggressiveness)).

0.70::acc(s19, board_rides_longer).

% @attr board_rides_longer
% @type categorical
% @canonical false
% @original_name Board rides longer than stated length
% @values feels_171=161cm_feels_like_171cm_stability_float unk_board_rides_longer=Unknown
% @importance 0.75

0.65::true_val(board_rides_longer, feels_171); 0.35::true_val(board_rides_longer, unk_board_rides_longer).
measured(s19, board_rides_longer, feels_171).
all_consistent(board_rides_longer) :- consistent(s19, board_rides_longer).
evidence(all_consistent(board_rides_longer)).
query(true_val(board_rides_longer, feels_171)).
query(true_val(board_rides_longer, unk_board_rides_longer)).

0.78::acc(s18, reviewer_opinion_whitelines_precise).

% @attr reviewer_opinion_whitelines_precise
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values take_anywhere=For_precise_imaginative_freeriders_Howler_takes_you_anywhere unk_reviewer_opinion_whitelines_precise=Unknown
% @importance 0.75

0.72::true_val(reviewer_opinion_whitelines_precise, take_anywhere); 0.28::true_val(reviewer_opinion_whitelines_precise, unk_reviewer_opinion_whitelines_precise).
measured(s18, reviewer_opinion_whitelines_precise, take_anywhere).
all_consistent(reviewer_opinion_whitelines_precise) :- consistent(s18, reviewer_opinion_whitelines_precise).
evidence(all_consistent(reviewer_opinion_whitelines_precise)).
query(true_val(reviewer_opinion_whitelines_precise, take_anywhere)).
query(true_val(reviewer_opinion_whitelines_precise, unk_reviewer_opinion_whitelines_precise)).

0.78::acc(s76, reviewer_opinion_whitelines_few_gripes).

% @attr reviewer_opinion_whitelines_few_gripes
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values few_gripes=Few_gripes_top_choice_freeride_freestyle unk_reviewer_opinion_whitelines_few_gripes=Unknown
% @importance 0.80

0.75::true_val(reviewer_opinion_whitelines_few_gripes, few_gripes); 0.25::true_val(reviewer_opinion_whitelines_few_gripes, unk_reviewer_opinion_whitelines_few_gripes).
measured(s76, reviewer_opinion_whitelines_few_gripes, few_gripes).
all_consistent(reviewer_opinion_whitelines_few_gripes) :- consistent(s76, reviewer_opinion_whitelines_few_gripes).
evidence(all_consistent(reviewer_opinion_whitelines_few_gripes)).
query(true_val(reviewer_opinion_whitelines_few_gripes, few_gripes)).
query(true_val(reviewer_opinion_whitelines_few_gripes, unk_reviewer_opinion_whitelines_few_gripes)).

0.90::acc(s67, reviewer_opinion_whitelines_best_all_around).

% @attr reviewer_opinion_whitelines_best_all_around
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values best_all_around=Best_all_around_board_freeriders_jibbers unk_reviewer_opinion_whitelines_best_all_around=Unknown
% @importance 0.95

0.90::true_val(reviewer_opinion_whitelines_best_all_around, best_all_around); 0.10::true_val(reviewer_opinion_whitelines_best_all_around, unk_reviewer_opinion_whitelines_best_all_around).
measured(s67, reviewer_opinion_whitelines_best_all_around, best_all_around).
all_consistent(reviewer_opinion_whitelines_best_all_around) :- consistent(s67, reviewer_opinion_whitelines_best_all_around).
evidence(all_consistent(reviewer_opinion_whitelines_best_all_around)).
query(true_val(reviewer_opinion_whitelines_best_all_around, best_all_around)).
query(true_val(reviewer_opinion_whitelines_best_all_around, unk_reviewer_opinion_whitelines_best_all_around)).

0.93::acc(s1, comparable_board_same_brand_flagship).
0.82::acc(s64, comparable_board_same_brand_flagship).

% @attr comparable_board_same_brand_flagship
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values flagship=Flagship_stiffer_rocker_camber_better_powder unk_comparable_board_same_brand_flagship=Unknown
% @importance 0.85

0.92::true_val(comparable_board_same_brand_flagship, flagship); 0.08::true_val(comparable_board_same_brand_flagship, unk_comparable_board_same_brand_flagship).
measured(s1, comparable_board_same_brand_flagship, flagship).
measured(s64, comparable_board_same_brand_flagship, flagship).
all_consistent(comparable_board_same_brand_flagship) :- consistent(s1, comparable_board_same_brand_flagship), consistent(s64, comparable_board_same_brand_flagship).
evidence(all_consistent(comparable_board_same_brand_flagship)).
query(true_val(comparable_board_same_brand_flagship, flagship)).
query(true_val(comparable_board_same_brand_flagship, unk_comparable_board_same_brand_flagship)).

0.93::acc(s1, comparable_board_same_brand_stratos).
0.65::acc(s77, comparable_board_same_brand_stratos).

% @attr comparable_board_same_brand_stratos
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values stratos=Stratos_cheaper_freestyle_hybrid_camber unk_comparable_board_same_brand_stratos=Unknown
% @importance 0.80

0.90::true_val(comparable_board_same_brand_stratos, stratos); 0.10::true_val(comparable_board_same_brand_stratos, unk_comparable_board_same_brand_stratos).
measured(s1, comparable_board_same_brand_stratos, stratos).
measured(s77, comparable_board_same_brand_stratos, stratos).
all_consistent(comparable_board_same_brand_stratos) :- consistent(s1, comparable_board_same_brand_stratos), consistent(s77, comparable_board_same_brand_stratos).
evidence(all_consistent(comparable_board_same_brand_stratos)).
query(true_val(comparable_board_same_brand_stratos, stratos)).
query(true_val(comparable_board_same_brand_stratos, unk_comparable_board_same_brand_stratos)).

0.82::acc(s11, comparable_board_same_brand_aviator).
0.60::acc(s42, comparable_board_same_brand_aviator).

% @attr comparable_board_same_brand_aviator
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values aviator_2_0=Aviator_2_0_twin_full_camber_predecessor unk_comparable_board_same_brand_aviator=Unknown
% @importance 0.78

0.85::true_val(comparable_board_same_brand_aviator, aviator_2_0); 0.15::true_val(comparable_board_same_brand_aviator, unk_comparable_board_same_brand_aviator).
measured(s11, comparable_board_same_brand_aviator, aviator_2_0).
measured(s42, comparable_board_same_brand_aviator, aviator_2_0).
all_consistent(comparable_board_same_brand_aviator) :- consistent(s11, comparable_board_same_brand_aviator), consistent(s42, comparable_board_same_brand_aviator).
evidence(all_consistent(comparable_board_same_brand_aviator)).
query(true_val(comparable_board_same_brand_aviator, aviator_2_0)).
query(true_val(comparable_board_same_brand_aviator, unk_comparable_board_same_brand_aviator)).

0.78::acc(s18, comparable_board_same_brand_mtn_twin).

% @attr comparable_board_same_brand_mtn_twin
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values mtn_twin=Mountain_Twin_more_playful_freestyle unk_comparable_board_same_brand_mtn_twin=Unknown
% @importance 0.75

0.72::true_val(comparable_board_same_brand_mtn_twin, mtn_twin); 0.28::true_val(comparable_board_same_brand_mtn_twin, unk_comparable_board_same_brand_mtn_twin).
measured(s18, comparable_board_same_brand_mtn_twin, mtn_twin).
all_consistent(comparable_board_same_brand_mtn_twin) :- consistent(s18, comparable_board_same_brand_mtn_twin).
evidence(all_consistent(comparable_board_same_brand_mtn_twin)).
query(true_val(comparable_board_same_brand_mtn_twin, mtn_twin)).
query(true_val(comparable_board_same_brand_mtn_twin, unk_comparable_board_same_brand_mtn_twin)).

0.65::acc(s46, comparable_board_cross_brand).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values similar_freeride=Similar_stats_comparable_freeride_option unk_comparable_board_cross_brand=Unknown
% @importance 0.70

0.55::true_val(comparable_board_cross_brand, similar_freeride); 0.45::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).
measured(s46, comparable_board_cross_brand, similar_freeride).
all_consistent(comparable_board_cross_brand) :- consistent(s46, comparable_board_cross_brand).
evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, similar_freeride)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

0.90::acc(s65, comparable_board_cross_brand_k2).

% @attr comparable_board_cross_brand_k2
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values k2_alchemist=K2_Alchemist_comparable_chop_handling unk_comparable_board_cross_brand_k2=Unknown
% @importance 0.85

0.85::true_val(comparable_board_cross_brand_k2, k2_alchemist); 0.15::true_val(comparable_board_cross_brand_k2, unk_comparable_board_cross_brand_k2).
measured(s65, comparable_board_cross_brand_k2, k2_alchemist).
all_consistent(comparable_board_cross_brand_k2) :- consistent(s65, comparable_board_cross_brand_k2).
evidence(all_consistent(comparable_board_cross_brand_k2)).
query(true_val(comparable_board_cross_brand_k2, k2_alchemist)).
query(true_val(comparable_board_cross_brand_k2, unk_comparable_board_cross_brand_k2)).

0.90::acc(s65, comparable_board_cross_brand_nitro).

% @attr comparable_board_cross_brand_nitro
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values nitro_squash=Nitro_Squash_similar_chop_performance unk_comparable_board_cross_brand_nitro=Unknown
% @importance 0.85

0.85::true_val(comparable_board_cross_brand_nitro, nitro_squash); 0.15::true_val(comparable_board_cross_brand_nitro, unk_comparable_board_cross_brand_nitro).
measured(s65, comparable_board_cross_brand_nitro, nitro_squash).
all_consistent(comparable_board_cross_brand_nitro) :- consistent(s65, comparable_board_cross_brand_nitro).
evidence(all_consistent(comparable_board_cross_brand_nitro)).
query(true_val(comparable_board_cross_brand_nitro, nitro_squash)).
query(true_val(comparable_board_cross_brand_nitro, unk_comparable_board_cross_brand_nitro)).

0.90::acc(s65, comparable_board_cross_brand_head).

% @attr comparable_board_cross_brand_head
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values head_ebi_lyt=Head_EBI_LYT_softer_shoveled_Howler_handles_chop_better unk_comparable_board_cross_brand_head=Unknown
% @importance 0.85

0.85::true_val(comparable_board_cross_brand_head, head_ebi_lyt); 0.15::true_val(comparable_board_cross_brand_head, unk_comparable_board_cross_brand_head).
measured(s65, comparable_board_cross_brand_head, head_ebi_lyt).
all_consistent(comparable_board_cross_brand_head) :- consistent(s65, comparable_board_cross_brand_head).
evidence(all_consistent(comparable_board_cross_brand_head)).
query(true_val(comparable_board_cross_brand_head, head_ebi_lyt)).
query(true_val(comparable_board_cross_brand_head, unk_comparable_board_cross_brand_head)).

0.75::acc(s11, comparable_board_cross_brand_korua).

% @attr comparable_board_cross_brand_korua
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values korua_similar=Similar_aggressive_profile unk_comparable_board_cross_brand_korua=Unknown
% @importance 0.83

0.75::true_val(comparable_board_cross_brand_korua, korua_similar); 0.25::true_val(comparable_board_cross_brand_korua, unk_comparable_board_cross_brand_korua).
measured(s11, comparable_board_cross_brand_korua, korua_similar).
all_consistent(comparable_board_cross_brand_korua) :- consistent(s11, comparable_board_cross_brand_korua).
evidence(all_consistent(comparable_board_cross_brand_korua)).
query(true_val(comparable_board_cross_brand_korua, korua_similar)).
query(true_val(comparable_board_cross_brand_korua, unk_comparable_board_cross_brand_korua)).

0.70::acc(s162, comparable_board_cross_brand_burton).

% @attr comparable_board_cross_brand_burton
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values burton_alt=Popular_all_mountain_alternative_similar_price unk_comparable_board_cross_brand_burton=Unknown
% @importance 0.60

0.50::true_val(comparable_board_cross_brand_burton, burton_alt); 0.50::true_val(comparable_board_cross_brand_burton, unk_comparable_board_cross_brand_burton).
measured(s162, comparable_board_cross_brand_burton, burton_alt).
all_consistent(comparable_board_cross_brand_burton) :- consistent(s162, comparable_board_cross_brand_burton).
evidence(all_consistent(comparable_board_cross_brand_burton)).
query(true_val(comparable_board_cross_brand_burton, burton_alt)).
query(true_val(comparable_board_cross_brand_burton, unk_comparable_board_cross_brand_burton)).

0.93::acc(s1, retailer_jones_direct).

% @attr retailer_jones_direct
% @type categorical
% @canonical false
% @original_name Jones Direct (jonessnowboards.com)
% @values mfr_store=Manufacturer_store_free_ship_over_100_30day_returns unk_retailer_jones_direct=Unknown
% @importance 0.90

0.90::true_val(retailer_jones_direct, mfr_store); 0.10::true_val(retailer_jones_direct, unk_retailer_jones_direct).
measured(s1, retailer_jones_direct, mfr_store).
all_consistent(retailer_jones_direct) :- consistent(s1, retailer_jones_direct).
evidence(all_consistent(retailer_jones_direct)).
query(true_val(retailer_jones_direct, mfr_store)).
query(true_val(retailer_jones_direct, unk_retailer_jones_direct)).

0.85::acc(s85, retailer_rei).

% @attr retailer_rei
% @type categorical
% @canonical false
% @original_name REI Co-op
% @values rei_coop=Major_US_outdoor_retailer_100pct_satisfaction_guarantee unk_retailer_rei=Unknown
% @importance 0.50

0.80::true_val(retailer_rei, rei_coop); 0.20::true_val(retailer_rei, unk_retailer_rei).
measured(s85, retailer_rei, rei_coop).
all_consistent(retailer_rei) :- (indep(s82), consistent(s85, retailer_rei) ; \+indep(s82)).
evidence(all_consistent(retailer_rei)).
query(true_val(retailer_rei, rei_coop)).
query(true_val(retailer_rei, unk_retailer_rei)).

0.80::acc(s34, retailer_evo).

% @attr retailer_evo
% @type categorical
% @canonical false
% @original_name Evo
% @values evo_retailer=Reputable_US_retailer_price_match unk_retailer_evo=Unknown
% @importance 0.50

0.75::true_val(retailer_evo, evo_retailer); 0.25::true_val(retailer_evo, unk_retailer_evo).
measured(s34, retailer_evo, evo_retailer).
all_consistent(retailer_evo) :- (indep(s7), consistent(s34, retailer_evo) ; \+indep(s7)).
evidence(all_consistent(retailer_evo)).
query(true_val(retailer_evo, evo_retailer)).
query(true_val(retailer_evo, unk_retailer_evo)).

0.82::acc(s11, retailer_backcountry).

% @attr retailer_backcountry
% @type categorical
% @canonical false
% @original_name Backcountry.com
% @values backcountry_retailer=Major_US_online_retailer_discounted_prior_season unk_retailer_backcountry=Unknown
% @importance 0.85

0.80::true_val(retailer_backcountry, backcountry_retailer); 0.20::true_val(retailer_backcountry, unk_retailer_backcountry).
measured(s11, retailer_backcountry, backcountry_retailer).
all_consistent(retailer_backcountry) :- consistent(s11, retailer_backcountry).
evidence(all_consistent(retailer_backcountry)).
query(true_val(retailer_backcountry, backcountry_retailer)).
query(true_val(retailer_backcountry, unk_retailer_backcountry)).

0.72::acc(s32, retailer_milosport).

% @attr retailer_milosport
% @type categorical
% @canonical false
% @original_name Milosport
% @values milosport_shop=Specialty_shop_Salt_Lake_City_in_store_pickup unk_retailer_milosport=Unknown
% @importance 0.70

0.68::true_val(retailer_milosport, milosport_shop); 0.32::true_val(retailer_milosport, unk_retailer_milosport).
measured(s32, retailer_milosport, milosport_shop).
all_consistent(retailer_milosport) :- (indep(s32), consistent(s32, retailer_milosport) ; \+indep(s32)).
evidence(all_consistent(retailer_milosport)).
query(true_val(retailer_milosport, milosport_shop)).
query(true_val(retailer_milosport, unk_retailer_milosport)).

0.72::acc(s4, retailer_melbourne_snowboard).

% @attr retailer_melbourne_snowboard
% @type categorical
% @canonical false
% @original_name Melbourne Snowboard (AU)
% @values melb_snow=Independent_Australian_snowboard_shop unk_retailer_melbourne_snowboard=Unknown
% @importance 0.90

0.90::true_val(retailer_melbourne_snowboard, melb_snow); 0.10::true_val(retailer_melbourne_snowboard, unk_retailer_melbourne_snowboard).
measured(s4, retailer_melbourne_snowboard, melb_snow).
all_consistent(retailer_melbourne_snowboard) :- (indep(s4), consistent(s4, retailer_melbourne_snowboard) ; \+indep(s4)).
evidence(all_consistent(retailer_melbourne_snowboard)).
query(true_val(retailer_melbourne_snowboard, melb_snow)).
query(true_val(retailer_melbourne_snowboard, unk_retailer_melbourne_snowboard)).

0.68::acc(s8, retailer_balmoral_boards).

% @attr retailer_balmoral_boards
% @type categorical
% @canonical false
% @original_name Balmoral Boards (AU)
% @values balmoral=Sydney_area_shop_10_flat_rate_shipping unk_retailer_balmoral_boards=Unknown
% @importance 0.70

0.70::true_val(retailer_balmoral_boards, balmoral); 0.30::true_val(retailer_balmoral_boards, unk_retailer_balmoral_boards).
measured(s8, retailer_balmoral_boards, balmoral).
all_consistent(retailer_balmoral_boards) :- (indep(s8), consistent(s8, retailer_balmoral_boards) ; \+indep(s8)).
evidence(all_consistent(retailer_balmoral_boards)).
query(true_val(retailer_balmoral_boards, balmoral)).
query(true_val(retailer_balmoral_boards, unk_retailer_balmoral_boards)).

0.62::acc(s39, retailer_xdream).

% @attr retailer_xdream
% @type categorical
% @canonical false
% @original_name X-Dream (AU)
% @values xdream=Australian_ski_snowboard_retailer unk_retailer_xdream=Unknown
% @importance 0.80

0.60::true_val(retailer_xdream, xdream); 0.40::true_val(retailer_xdream, unk_retailer_xdream).
measured(s39, retailer_xdream, xdream).
all_consistent(retailer_xdream) :- (indep(s39), consistent(s39, retailer_xdream) ; \+indep(s39)).
evidence(all_consistent(retailer_xdream)).
query(true_val(retailer_xdream, xdream)).
query(true_val(retailer_xdream, unk_retailer_xdream)).

0.68::acc(s25, retailer_snowcountry).

% @attr retailer_snowcountry
% @type categorical
% @canonical false
% @original_name SnowCountry (EU)
% @values snowcountry_eu=European_retailer_worldwide_shipping unk_retailer_snowcountry=Unknown
% @importance 0.60

0.58::true_val(retailer_snowcountry, snowcountry_eu); 0.42::true_val(retailer_snowcountry, unk_retailer_snowcountry).
measured(s25, retailer_snowcountry, snowcountry_eu).
all_consistent(retailer_snowcountry) :- (indep(s25), consistent(s25, retailer_snowcountry) ; \+indep(s25)).
evidence(all_consistent(retailer_snowcountry)).
query(true_val(retailer_snowcountry, snowcountry_eu)).
query(true_val(retailer_snowcountry, unk_retailer_snowcountry)).

0.70::acc(s30, retailer_snowboard_zezula).

% @attr retailer_snowboard_zezula
% @type categorical
% @canonical false
% @original_name Snowboard Zezula (EU)
% @values zezula=Czech_Republic_EU_retailer_loyalty_program unk_retailer_snowboard_zezula=Unknown
% @importance 0.50

0.60::true_val(retailer_snowboard_zezula, zezula); 0.40::true_val(retailer_snowboard_zezula, unk_retailer_snowboard_zezula).
measured(s30, retailer_snowboard_zezula, zezula).
all_consistent(retailer_snowboard_zezula) :- (indep(s30), consistent(s30, retailer_snowboard_zezula) ; \+indep(s30)).
evidence(all_consistent(retailer_snowboard_zezula)).
query(true_val(retailer_snowboard_zezula, zezula)).
query(true_val(retailer_snowboard_zezula, unk_retailer_snowboard_zezula)).

0.93::acc(s1, binding_compatibility).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values standard_2x4=2x4_insert_pattern_ML_standard_L_wide unk_binding_compatibility=Unknown
% @importance 0.90

0.90::true_val(binding_compatibility, standard_2x4); 0.10::true_val(binding_compatibility, unk_binding_compatibility).
measured(s1, binding_compatibility, standard_2x4).
all_consistent(binding_compatibility) :- consistent(s1, binding_compatibility).
evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, standard_2x4)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

0.93::acc(s1, binding_compatibility_fase).

% @attr binding_compatibility_fase
% @type categorical
% @canonical false
% @original_name binding_compatibility
% @values fase_system=FASE_binding_proprietary_fast_entry_sizes_listed unk_binding_compatibility_fase=Unknown
% @importance 0.90

0.90::true_val(binding_compatibility_fase, fase_system); 0.10::true_val(binding_compatibility_fase, unk_binding_compatibility_fase).
measured(s1, binding_compatibility_fase, fase_system).
all_consistent(binding_compatibility_fase) :- consistent(s1, binding_compatibility_fase).
evidence(all_consistent(binding_compatibility_fase)).
query(true_val(binding_compatibility_fase, fase_system)).
query(true_val(binding_compatibility_fase, unk_binding_compatibility_fase)).

0.93::acc(s1, big_horn_series_sizing).

% @attr big_horn_series_sizing
% @type categorical
% @canonical false
% @original_name Big Horn Series
% @values boot_11_5_plus=US_Mens_11_5_plus_min_26_3cm_waist unk_big_horn_series_sizing=Unknown
% @importance 0.90

0.90::true_val(big_horn_series_sizing, boot_11_5_plus); 0.10::true_val(big_horn_series_sizing, unk_big_horn_series_sizing).
measured(s1, big_horn_series_sizing, boot_11_5_plus).
all_consistent(big_horn_series_sizing) :- consistent(s1, big_horn_series_sizing).
evidence(all_consistent(big_horn_series_sizing)).
query(true_val(big_horn_series_sizing, boot_11_5_plus)).
query(true_val(big_horn_series_sizing, unk_big_horn_series_sizing)).