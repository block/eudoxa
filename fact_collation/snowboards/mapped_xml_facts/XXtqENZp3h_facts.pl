0.15::indep(s4).
0.30::indep(s5).
0.20::indep(s14).
0.15::indep(s15).
0.20::indep(s17).
0.15::indep(s18).
0.20::indep(s19).
0.15::indep(s20).
0.20::indep(s24).
0.15::indep(s25).
0.80::indep(s26).
0.15::indep(s27).
0.20::indep(s28).
0.15::indep(s29).
0.20::indep(s30).
0.20::indep(s31).
0.15::indep(s32).
0.20::indep(s33).
0.20::indep(s34).
0.15::indep(s35).
0.20::indep(s36).
0.15::indep(s37).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values academy_snowboards=Academy_Snowboards unk_brand=Unknown
% @importance 0.90

0.95::acc(s1, brand).
0.90::acc(s2, brand).

0.95::true_val(brand, academy_snowboards); 0.05::true_val(brand, unk_brand).

measured(s1, brand, academy_snowboards).
measured(s2, brand, academy_snowboards).

all_consistent(brand) :- consistent(s1, brand), consistent(s2, brand).

evidence(all_consistent(brand)).
query(true_val(brand, academy_snowboards)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values propaganda=Propaganda unk_model_name=Unknown
% @importance 0.90

0.95::acc(s1, model_name).
0.90::acc(s2, model_name).

0.95::true_val(model_name, propaganda); 0.05::true_val(model_name, unk_model_name).

measured(s1, model_name, propaganda).
measured(s2, model_name, propaganda).

all_consistent(model_name) :- consistent(s1, model_name), consistent(s2, model_name).

evidence(all_consistent(model_name)).
query(true_val(model_name, propaganda)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2024=2024 unk_model_year=Unknown
% @importance 0.90

0.95::acc(s1, model_year).
0.90::acc(s2, model_year).

0.95::true_val(model_year, y2024); 0.05::true_val(model_year, unk_model_year).

measured(s1, model_year, y2024).
measured(s2, model_year, y2024).

all_consistent(model_year) :- consistent(s1, model_year), consistent(s2, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2024)).
query(true_val(model_year, unk_model_year)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.95::acc(s1, product_type).

0.92::true_val(product_type, snowboard); 0.08::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).

all_consistent(product_type) :- consistent(s1, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values park_all_mountain=Park_All_Mountain unk_board_category=Unknown
% @importance 0.50

0.78::acc(s6, board_category).

0.64::true_val(board_category, park_all_mountain); 0.36::true_val(board_category, unk_board_category).

measured(s6, board_category, park_all_mountain).

all_consistent(board_category) :- consistent(s6, board_category).

evidence(all_consistent(board_category)).
query(true_val(board_category, park_all_mountain)).
query(true_val(board_category, unk_board_category)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.50

0.78::acc(s6, gender).

0.64::true_val(gender, mens); 0.36::true_val(gender, unk_gender).

measured(s6, gender, mens).

all_consistent(gender) :- consistent(s6, gender).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr company_founded
% @type categorical
% @canonical false
% @original_name company founded
% @values y2002=2002 y2003=2003
% @importance 0.52

0.92::acc(s3, company_founded).
0.50::acc(s4, company_founded).

0.80::true_val(company_founded, y2002); 0.20::true_val(company_founded, y2003).

measured(s3, company_founded, y2002).
measured(s4, company_founded, y2003).

all_consistent(company_founded) :-
    consistent(s3, company_founded),
    (indep(s4), consistent(s4, company_founded) ; \+indep(s4)).

evidence(all_consistent(company_founded)).
query(true_val(company_founded, y2002)).
query(true_val(company_founded, y2003)).

% @attr company_headquarters
% @type categorical
% @canonical false
% @original_name company headquarters
% @values auburn_ca=PO_Box_4628_Auburn_CA_95604 unk_company_headquarters=Unknown
% @importance 1.0

0.93::acc(s1, company_headquarters).

0.92::true_val(company_headquarters, auburn_ca); 0.08::true_val(company_headquarters, unk_company_headquarters).

measured(s1, company_headquarters, auburn_ca).

all_consistent(company_headquarters) :- consistent(s1, company_headquarters).

evidence(all_consistent(company_headquarters)).
query(true_val(company_headquarters, auburn_ca)).
query(true_val(company_headquarters, unk_company_headquarters)).

% @attr company_philosophy
% @type categorical
% @canonical false
% @original_name company philosophy
% @values rider_owned_no_gimmick=Rider_owned_and_operated_no_gimmick unk_company_philosophy=Unknown
% @importance 0.80

0.88::acc(s2, company_philosophy).

0.83::true_val(company_philosophy, rider_owned_no_gimmick); 0.17::true_val(company_philosophy, unk_company_philosophy).

measured(s2, company_philosophy, rider_owned_no_gimmick).

all_consistent(company_philosophy) :- consistent(s2, company_philosophy).

evidence(all_consistent(company_philosophy)).
query(true_val(company_philosophy, rider_owned_no_gimmick)).
query(true_val(company_philosophy, unk_company_philosophy)).

% @attr company_owners
% @type categorical
% @canonical false
% @original_name company owners
% @values otterstrom_baughn=Chad_Otterstrom_and_Jeff_Baughn unk_company_owners=Unknown
% @importance 0.65

0.75::acc(s5, company_owners).

0.63::true_val(company_owners, otterstrom_baughn); 0.37::true_val(company_owners, unk_company_owners).

measured(s5, company_owners, otterstrom_baughn).

all_consistent(company_owners) :-
    (indep(s5), consistent(s5, company_owners) ; \+indep(s5)).

evidence(all_consistent(company_owners)).
query(true_val(company_owners, otterstrom_baughn)).
query(true_val(company_owners, unk_company_owners)).

% @attr company_tagline
% @type categorical
% @canonical false
% @original_name company tagline
% @values good_people_great_snowboards=Good_People_Great_Snowboards unk_company_tagline=Unknown
% @importance 0.80

0.88::acc(s2, company_tagline).

0.83::true_val(company_tagline, good_people_great_snowboards); 0.17::true_val(company_tagline, unk_company_tagline).

measured(s2, company_tagline, good_people_great_snowboards).

all_consistent(company_tagline) :- consistent(s2, company_tagline).

evidence(all_consistent(company_tagline)).
query(true_val(company_tagline, good_people_great_snowboards)).
query(true_val(company_tagline, unk_company_tagline)).

% @attr instagram_followers
% @type categorical
% @canonical false
% @original_name Instagram followers
% @values approx_24k=Approx_24K unk_instagram_followers=Unknown
% @importance 0.50

0.70::acc(s6, instagram_followers).

0.64::true_val(instagram_followers, approx_24k); 0.36::true_val(instagram_followers, unk_instagram_followers).

measured(s6, instagram_followers, approx_24k).

all_consistent(instagram_followers) :- consistent(s6, instagram_followers).

evidence(all_consistent(instagram_followers)).
query(true_val(instagram_followers, approx_24k)).
query(true_val(instagram_followers, unk_instagram_followers)).

% @attr awards_brand_level
% @type categorical
% @canonical false
% @original_name awards (brand-level)
% @values nine_x_good_wood_top5_outside=9x_Transworld_Good_Wood_Top5_Outside_2023 unk_awards_brand_level=Unknown
% @importance 0.50

0.72::acc(s6, awards_brand_level).

0.64::true_val(awards_brand_level, nine_x_good_wood_top5_outside); 0.36::true_val(awards_brand_level, unk_awards_brand_level).

measured(s6, awards_brand_level, nine_x_good_wood_top5_outside).

all_consistent(awards_brand_level) :- consistent(s6, awards_brand_level).

evidence(all_consistent(awards_brand_level)).
query(true_val(awards_brand_level, nine_x_good_wood_top5_outside)).
query(true_val(awards_brand_level, unk_awards_brand_level)).

% @attr scholarship_program
% @type categorical
% @canonical false
% @original_name scholarship program
% @values gives_scholarships=Gives_scholarships_to_snow_lovers unk_scholarship_program=Unknown
% @importance 0.40

0.70::acc(s7, scholarship_program).

0.60::true_val(scholarship_program, gives_scholarships); 0.40::true_val(scholarship_program, unk_scholarship_program).

measured(s7, scholarship_program, gives_scholarships).

all_consistent(scholarship_program) :- consistent(s7, scholarship_program).

evidence(all_consistent(scholarship_program)).
query(true_val(scholarship_program, gives_scholarships)).
query(true_val(scholarship_program, unk_scholarship_program)).

% @attr manufacturer
% @type categorical
% @canonical false
% @original_name manufacturer
% @values never_summer_industries=Never_Summer_Industries unk_manufacturer=Unknown
% @importance 0.90

0.95::acc(s1, manufacturer).
0.90::acc(s2, manufacturer).

0.95::true_val(manufacturer, never_summer_industries); 0.05::true_val(manufacturer, unk_manufacturer).

measured(s1, manufacturer, never_summer_industries).
measured(s2, manufacturer, never_summer_industries).

all_consistent(manufacturer) :- consistent(s1, manufacturer), consistent(s2, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, never_summer_industries)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr manufacturing_location_current
% @type categorical
% @canonical false
% @original_name manufacturing_location_current
% @values denver_co_usa=Denver_Colorado_USA unk_manufacturing_location_current=Unknown
% @importance 0.70

0.82::acc(s8, manufacturing_location_current).
0.80::acc(s9, manufacturing_location_current).

0.95::true_val(manufacturing_location_current, denver_co_usa); 0.05::true_val(manufacturing_location_current, unk_manufacturing_location_current).

measured(s8, manufacturing_location_current, denver_co_usa).
measured(s9, manufacturing_location_current, denver_co_usa).

all_consistent(manufacturing_location_current) :- consistent(s8, manufacturing_location_current), consistent(s9, manufacturing_location_current).

evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, denver_co_usa)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values usa=USA unk_manufacturing_location=Unknown
% @importance 0.75

0.85::acc(s10, manufacturing_location).

0.76::true_val(manufacturing_location, usa); 0.24::true_val(manufacturing_location, unk_manufacturing_location).

measured(s10, manufacturing_location, usa).

all_consistent(manufacturing_location) :- consistent(s10, manufacturing_location).

evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, usa)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

% @attr never_summer_founded
% @type categorical
% @canonical false
% @original_name Never Summer founded
% @values y1991_canaday=1991_by_Tim_and_Tracey_Canaday unk_never_summer_founded=Unknown
% @importance 0.70

0.80::acc(s8, never_summer_founded).

0.68::true_val(never_summer_founded, y1991_canaday); 0.32::true_val(never_summer_founded, unk_never_summer_founded).

measured(s8, never_summer_founded, y1991_canaday).

all_consistent(never_summer_founded) :- consistent(s8, never_summer_founded).

evidence(all_consistent(never_summer_founded)).
query(true_val(never_summer_founded, y1991_canaday)).
query(true_val(never_summer_founded, unk_never_summer_founded)).

% @attr never_summer_factory_description
% @type categorical
% @canonical false
% @original_name Never Summer factory description
% @values handcrafted_700yrs_exp=Handcrafted_700_years_experience unk_ns_factory_desc=Unknown
% @importance 0.70

0.78::acc(s9, never_summer_factory_description).

0.68::true_val(never_summer_factory_description, handcrafted_700yrs_exp); 0.32::true_val(never_summer_factory_description, unk_ns_factory_desc).

measured(s9, never_summer_factory_description, handcrafted_700yrs_exp).

all_consistent(never_summer_factory_description) :- consistent(s9, never_summer_factory_description).

evidence(all_consistent(never_summer_factory_description)).
query(true_val(never_summer_factory_description, handcrafted_700yrs_exp)).
query(true_val(never_summer_factory_description, unk_ns_factory_desc)).

% @attr never_summer_factory_address
% @type categorical
% @canonical false
% @original_name Never Summer factory address
% @values eudora_way_denver=3838_Eudora_Way_Denver_CO_80207 unk_ns_factory_addr=Unknown
% @importance 0.20

0.65::acc(s11, never_summer_factory_address).

0.59::true_val(never_summer_factory_address, eudora_way_denver); 0.41::true_val(never_summer_factory_address, unk_ns_factory_addr).

measured(s11, never_summer_factory_address, eudora_way_denver).

all_consistent(never_summer_factory_address) :- consistent(s11, never_summer_factory_address).

evidence(all_consistent(never_summer_factory_address)).
query(true_val(never_summer_factory_address, eudora_way_denver)).
query(true_val(never_summer_factory_address, unk_ns_factory_addr)).

% @attr never_summer_quality_control
% @type categorical
% @canonical false
% @original_name Never Summer quality control
% @values twenty_point_inspection=20_point_inspection unk_ns_qc=Unknown
% @importance 0.70

0.78::acc(s9, never_summer_quality_control).

0.68::true_val(never_summer_quality_control, twenty_point_inspection); 0.32::true_val(never_summer_quality_control, unk_ns_qc).

measured(s9, never_summer_quality_control, twenty_point_inspection).

all_consistent(never_summer_quality_control) :- consistent(s9, never_summer_quality_control).

evidence(all_consistent(never_summer_quality_control)).
query(true_val(never_summer_quality_control, twenty_point_inspection)).
query(true_val(never_summer_quality_control, unk_ns_qc)).

% @attr never_summer_reputation
% @type categorical
% @canonical false
% @original_name Never Summer reputation
% @values premier_independent_mfr=Worlds_premier_independent_snowboard_manufacturer unk_ns_rep=Unknown
% @importance 0.50

0.55::acc(s12, never_summer_reputation).

0.42::true_val(never_summer_reputation, premier_independent_mfr); 0.58::true_val(never_summer_reputation, unk_ns_rep).

measured(s12, never_summer_reputation, premier_independent_mfr).

all_consistent(never_summer_reputation) :- consistent(s12, never_summer_reputation).

evidence(all_consistent(never_summer_reputation)).
query(true_val(never_summer_reputation, premier_independent_mfr)).
query(true_val(never_summer_reputation, unk_ns_rep)).

% @attr manufacturing_location_prior
% @type categorical
% @canonical true
% @original_name manufacturing_location_prior
% @values austria=Austria_pre_NS_partnership unk_manufacturing_location_prior=Unknown
% @importance 0.40

0.65::acc(s13, manufacturing_location_prior).

0.49::true_val(manufacturing_location_prior, austria); 0.51::true_val(manufacturing_location_prior, unk_manufacturing_location_prior).

measured(s13, manufacturing_location_prior, austria).

all_consistent(manufacturing_location_prior) :- consistent(s13, manufacturing_location_prior).

evidence(all_consistent(manufacturing_location_prior)).
query(true_val(manufacturing_location_prior, austria)).
query(true_val(manufacturing_location_prior, unk_manufacturing_location_prior)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values zero_camber=Zero_Camber_flat unk_camber_type=Unknown
% @importance 0.92

0.95::acc(s1, camber_type).
0.80::acc(s14, camber_type).
0.75::acc(s15, camber_type).

0.95::true_val(camber_type, zero_camber); 0.05::true_val(camber_type, unk_camber_type).

measured(s1, camber_type, zero_camber).
measured(s14, camber_type, zero_camber).
measured(s15, camber_type, zero_camber).

all_consistent(camber_type) :-
    consistent(s1, camber_type),
    (indep(s14), consistent(s14, camber_type) ; \+indep(s14)),
    (indep(s15), consistent(s15, camber_type) ; \+indep(s15)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, zero_camber)).
query(true_val(camber_type, unk_camber_type)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values true_twin=True_Twin unk_shape=Unknown
% @importance 0.95

0.95::acc(s1, shape).
0.80::acc(s14, shape).

0.95::true_val(shape, true_twin); 0.05::true_val(shape, unk_shape).

measured(s1, shape, true_twin).
measured(s14, shape, true_twin).

all_consistent(shape) :-
    consistent(s1, shape),
    (indep(s14), consistent(s14, shape) ; \+indep(s14)).

evidence(all_consistent(shape)).
query(true_val(shape, true_twin)).
query(true_val(shape, unk_shape)).

% @attr shape_description
% @type categorical
% @canonical false
% @original_name shape description
% @values identical_tip_tail_centered=Identical_tip_tail_centered_stance unk_shape_description=Unknown
% @importance 0.80

0.90::acc(s16, shape_description).

0.88::true_val(shape_description, identical_tip_tail_centered); 0.12::true_val(shape_description, unk_shape_description).

measured(s16, shape_description, identical_tip_tail_centered).

all_consistent(shape_description) :- consistent(s16, shape_description).

evidence(all_consistent(shape_description)).
query(true_val(shape_description, identical_tip_tail_centered)).
query(true_val(shape_description, unk_shape_description)).

% @attr stance_position
% @type categorical
% @canonical false
% @original_name stance position
% @values centered=Centered_Stance unk_stance_position=Unknown
% @importance 1.0

0.95::acc(s1, stance_position).

0.92::true_val(stance_position, centered); 0.08::true_val(stance_position, unk_stance_position).

measured(s1, stance_position, centered).

all_consistent(stance_position) :- consistent(s1, stance_position).

evidence(all_consistent(stance_position)).
query(true_val(stance_position, centered)).
query(true_val(stance_position, unk_stance_position)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @original_name flex_rating_10
% @unit /10
% @values v6_5=6.5 unk_flex_rating_10=Unknown
% @importance 0.93

0.95::acc(s1, flex_rating_10).
0.75::acc(s15, flex_rating_10).

0.95::true_val(flex_rating_10, v6_5); 0.05::true_val(flex_rating_10, unk_flex_rating_10).

measured(s1, flex_rating_10, v6_5).
measured(s15, flex_rating_10, v6_5).

all_consistent(flex_rating_10) :-
    consistent(s1, flex_rating_10),
    (indep(s15), consistent(s15, flex_rating_10) ; \+indep(s15)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v6_5)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

% @attr flex_feel
% @type categorical
% @canonical false
% @original_name flex_feel
% @values medium_stiff=Medium_stiff unk_flex_feel=Unknown
% @importance 0.70

0.72::acc(s17, flex_feel).

0.56::true_val(flex_feel, medium_stiff); 0.44::true_val(flex_feel, unk_flex_feel).

measured(s17, flex_feel, medium_stiff).

all_consistent(flex_feel) :-
    (indep(s17), consistent(s17, flex_feel) ; \+indep(s17)).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium_stiff)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values mtn8_pipe7_park9_street10=Mountain_8_Pipe_7_Park_9_Street_10 unk_terrain_suitability=Unknown
% @importance 1.0

0.93::acc(s1, terrain_suitability).

0.92::true_val(terrain_suitability, mtn8_pipe7_park9_street10); 0.08::true_val(terrain_suitability, unk_terrain_suitability).

measured(s1, terrain_suitability, mtn8_pipe7_park9_street10).

all_consistent(terrain_suitability) :- consistent(s1, terrain_suitability).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, mtn8_pipe7_park9_street10)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values ultralight_aspen=Ultralight_Core_Canadian_aspen ns_superlight_blend=NS_Superlight_Wood_Core_custom_blend
% @importance 0.93

0.90::acc(s1, core_material).
0.80::acc(s18, core_material).

0.55::true_val(core_material, ultralight_aspen); 0.45::true_val(core_material, ns_superlight_blend).

measured(s1, core_material, ultralight_aspen).
measured(s18, core_material, ns_superlight_blend).

all_consistent(core_material) :-
    consistent(s1, core_material),
    (indep(s18), consistent(s18, core_material) ; \+indep(s18)).

evidence(all_consistent(core_material)).
query(true_val(core_material, ultralight_aspen)).
query(true_val(core_material, ns_superlight_blend)).

% @attr core_profiling
% @type categorical
% @canonical false
% @original_name core profiling
% @values cnc_sanded=CNC_sanded_to_fraction_of_mm unk_core_profiling=Unknown
% @importance 0.85

0.78::acc(s18, core_profiling).

0.71::true_val(core_profiling, cnc_sanded); 0.29::true_val(core_profiling, unk_core_profiling).

measured(s18, core_profiling, cnc_sanded).

all_consistent(core_profiling) :-
    (indep(s18), consistent(s18, core_profiling) ; \+indep(s18)).

evidence(all_consistent(core_profiling)).
query(true_val(core_profiling, cnc_sanded)).
query(true_val(core_profiling, unk_core_profiling)).

% @attr construction
% @type categorical
% @canonical false
% @original_name construction
% @values sandwich=Sandwich_Construction unk_construction=Unknown
% @importance 0.80

0.92::acc(s16, construction).

0.88::true_val(construction, sandwich); 0.12::true_val(construction, unk_construction).

measured(s16, construction, sandwich).

all_consistent(construction) :- consistent(s16, construction).

evidence(all_consistent(construction)).
query(true_val(construction, sandwich)).
query(true_val(construction, unk_construction)).

% @attr laminate
% @type categorical
% @canonical false
% @original_name laminate
% @values bi_lite_fiberglass=Bi_Lite_Fiberglass unk_laminate=Unknown
% @importance 0.85

0.78::acc(s18, laminate).

0.71::true_val(laminate, bi_lite_fiberglass); 0.29::true_val(laminate, unk_laminate).

measured(s18, laminate, bi_lite_fiberglass).

all_consistent(laminate) :-
    (indep(s18), consistent(s18, laminate) ; \+indep(s18)).

evidence(all_consistent(laminate)).
query(true_val(laminate, bi_lite_fiberglass)).
query(true_val(laminate, unk_laminate)).

% @attr damping_system
% @type categorical
% @canonical false
% @original_name damping system
% @values featherweight=Featherweight_Damping_System unk_damping_system=Unknown
% @importance 1.0

0.93::acc(s1, damping_system).

0.92::true_val(damping_system, featherweight); 0.08::true_val(damping_system, unk_damping_system).

measured(s1, damping_system, featherweight).

all_consistent(damping_system) :- consistent(s1, damping_system).

evidence(all_consistent(damping_system)).
query(true_val(damping_system, featherweight)).
query(true_val(damping_system, unk_damping_system)).

% @attr construction_material_innovation
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values underfoot_stabilisers=Underfoot_Balancing_Stabilisers unk_construction_material_innovation=Unknown
% @importance 0.80

0.80::acc(s19, construction_material_innovation).

0.69::true_val(construction_material_innovation, underfoot_stabilisers); 0.31::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s19, construction_material_innovation, underfoot_stabilisers).

all_consistent(construction_material_innovation) :-
    (indep(s19), consistent(s19, construction_material_innovation) ; \+indep(s19)).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, underfoot_stabilisers)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values durasurf_sintered_4501=Durasurf_Sintered_4501 unk_base_material=Unknown
% @importance 1.0

0.95::acc(s1, base_material).

0.92::true_val(base_material, durasurf_sintered_4501); 0.08::true_val(base_material, unk_base_material).

measured(s1, base_material, durasurf_sintered_4501).

all_consistent(base_material) :- consistent(s1, base_material).

evidence(all_consistent(base_material)).
query(true_val(base_material, durasurf_sintered_4501)).
query(true_val(base_material, unk_base_material)).

% @attr base_exclusivity
% @type categorical
% @canonical false
% @original_name base exclusivity
% @values exclusive_for_ns=Crown_Plastics_exclusive_for_Never_Summer unk_base_exclusivity=Unknown
% @importance 0.78

0.78::acc(s18, base_exclusivity).
0.68::acc(s20, base_exclusivity).

0.95::true_val(base_exclusivity, exclusive_for_ns); 0.05::true_val(base_exclusivity, unk_base_exclusivity).

measured(s18, base_exclusivity, exclusive_for_ns).
measured(s20, base_exclusivity, exclusive_for_ns).

all_consistent(base_exclusivity) :-
    (indep(s18), consistent(s18, base_exclusivity) ; \+indep(s18)),
    (indep(s20), consistent(s20, base_exclusivity) ; \+indep(s20)).

evidence(all_consistent(base_exclusivity)).
query(true_val(base_exclusivity, exclusive_for_ns)).
query(true_val(base_exclusivity, unk_base_exclusivity)).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values sintered=Sintered unk_base_type=Unknown
% @importance 0.70

0.72::acc(s17, base_type).

0.56::true_val(base_type, sintered); 0.44::true_val(base_type, unk_base_type).

measured(s17, base_type, sintered).

all_consistent(base_type) :-
    (indep(s17), consistent(s17, base_type) ; \+indep(s17)).

evidence(all_consistent(base_type)).
query(true_val(base_type, sintered)).
query(true_val(base_type, unk_base_type)).

% @attr base_colour
% @type categorical
% @canonical false
% @original_name base colour
% @values random=Random unk_base_colour=Unknown
% @importance 1.0

0.90::acc(s1, base_colour).

0.92::true_val(base_colour, random); 0.08::true_val(base_colour, unk_base_colour).

measured(s1, base_colour, random).

all_consistent(base_colour) :- consistent(s1, base_colour).

evidence(all_consistent(base_colour)).
query(true_val(base_colour, random)).
query(true_val(base_colour, unk_base_colour)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values sintered_ptex=Sintered_P_Tex_Sidewall unk_sidewall_material=Unknown
% @importance 1.0

0.95::acc(s1, sidewall_material).

0.92::true_val(sidewall_material, sintered_ptex); 0.08::true_val(sidewall_material, unk_sidewall_material).

measured(s1, sidewall_material, sintered_ptex).

all_consistent(sidewall_material) :- consistent(s1, sidewall_material).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, sintered_ptex)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr sidewall_advantage
% @type categorical
% @canonical false
% @original_name sidewall advantage
% @values no_crack_cold=Wont_crack_in_cold_temperatures unk_sidewall_advantage=Unknown
% @importance 0.70

0.68::acc(s20, sidewall_advantage).

0.57::true_val(sidewall_advantage, no_crack_cold); 0.43::true_val(sidewall_advantage, unk_sidewall_advantage).

measured(s20, sidewall_advantage, no_crack_cold).

all_consistent(sidewall_advantage) :-
    (indep(s20), consistent(s20, sidewall_advantage) ; \+indep(s20)).

evidence(all_consistent(sidewall_advantage)).
query(true_val(sidewall_advantage, no_crack_cold)).
query(true_val(sidewall_advantage, unk_sidewall_advantage)).

% @attr sidewall_innovation
% @type categorical
% @canonical false
% @original_name sidewall innovation
% @values ns_first_ptex=NS_first_to_use_P_Tex_sidewalls unk_sidewall_innovation=Unknown
% @importance 0.68

0.78::acc(s18, sidewall_innovation).
0.75::acc(s46, sidewall_innovation).

0.95::true_val(sidewall_innovation, ns_first_ptex); 0.05::true_val(sidewall_innovation, unk_sidewall_innovation).

measured(s18, sidewall_innovation, ns_first_ptex).
measured(s46, sidewall_innovation, ns_first_ptex).

all_consistent(sidewall_innovation) :-
    (indep(s18), consistent(s18, sidewall_innovation) ; \+indep(s18)),
    consistent(s46, sidewall_innovation).

evidence(all_consistent(sidewall_innovation)).
query(true_val(sidewall_innovation, ns_first_ptex)).
query(true_val(sidewall_innovation, unk_sidewall_innovation)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values full_wrap_metal=Full_Wrap_Metal_Edges unk_edge_technology=Unknown
% @importance 1.0

0.95::acc(s1, edge_technology).

0.92::true_val(edge_technology, full_wrap_metal); 0.08::true_val(edge_technology, unk_edge_technology).

measured(s1, edge_technology, full_wrap_metal).

all_consistent(edge_technology) :- consistent(s1, edge_technology).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, full_wrap_metal)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr topsheet
% @type categorical
% @canonical false
% @original_name topsheet
% @values poly_thermo=Poly_Thermo_Topsheet unk_topsheet=Unknown
% @importance 0.90

0.95::acc(s1, topsheet).
0.80::acc(s19, topsheet).

0.95::true_val(topsheet, poly_thermo); 0.05::true_val(topsheet, unk_topsheet).

measured(s1, topsheet, poly_thermo).
measured(s19, topsheet, poly_thermo).

all_consistent(topsheet) :-
    consistent(s1, topsheet),
    (indep(s19), consistent(s19, topsheet) ; \+indep(s19)).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, poly_thermo)).
query(true_val(topsheet, unk_topsheet)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values stainless_10mm_2x4=Stainless_10mm_2x4_Inserts unk_mounting_pattern=Unknown
% @importance 1.0

0.95::acc(s1, mounting_pattern).

0.92::true_val(mounting_pattern, stainless_10mm_2x4); 0.08::true_val(mounting_pattern, unk_mounting_pattern).

measured(s1, mounting_pattern, stainless_10mm_2x4).

all_consistent(mounting_pattern) :- consistent(s1, mounting_pattern).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, stainless_10mm_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr sidecut_type
% @type categorical
% @canonical false
% @original_name sidecut_type
% @values vario_power_grip=Vario_Power_Grip_Sidecut unk_sidecut_type=Unknown
% @importance 1.0

0.95::acc(s1, sidecut_type).

0.92::true_val(sidecut_type, vario_power_grip); 0.08::true_val(sidecut_type, unk_sidecut_type).

measured(s1, sidecut_type, vario_power_grip).

all_consistent(sidecut_type) :- consistent(s1, sidecut_type).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, vario_power_grip)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr sidecut_description
% @type categorical
% @canonical false
% @original_name sidecut description
% @values multiple_radiuses_extra_contact=Multiple_radiuses_extra_contact_points unk_sidecut_description=Unknown
% @importance 0.85

0.78::acc(s18, sidecut_description).

0.71::true_val(sidecut_description, multiple_radiuses_extra_contact); 0.29::true_val(sidecut_description, unk_sidecut_description).

measured(s18, sidecut_description, multiple_radiuses_extra_contact).

all_consistent(sidecut_description) :-
    (indep(s18), consistent(s18, sidecut_description) ; \+indep(s18)).

evidence(all_consistent(sidecut_description)).
query(true_val(sidecut_description, multiple_radiuses_extra_contact)).
query(true_val(sidecut_description, unk_sidecut_description)).

% @attr sidecut_mechanism
% @type categorical
% @canonical false
% @original_name sidecut mechanism
% @values flat_section_shallow_deep_radii=Flat_section_with_shallow_and_deep_radii unk_sidecut_mechanism=Unknown
% @importance 0.85

0.78::acc(s18, sidecut_mechanism).

0.71::true_val(sidecut_mechanism, flat_section_shallow_deep_radii); 0.29::true_val(sidecut_mechanism, unk_sidecut_mechanism).

measured(s18, sidecut_mechanism, flat_section_shallow_deep_radii).

all_consistent(sidecut_mechanism) :-
    (indep(s18), consistent(s18, sidecut_mechanism) ; \+indep(s18)).

evidence(all_consistent(sidecut_mechanism)).
query(true_val(sidecut_mechanism, flat_section_shallow_deep_radii)).
query(true_val(sidecut_mechanism, unk_sidecut_mechanism)).

% @attr sidecut_patent
% @type categorical
% @canonical false
% @original_name sidecut patent
% @values us_patent_7798514=US_Patent_7798514 unk_sidecut_patent=Unknown
% @importance 0.53

0.70::acc(s21, sidecut_patent).

0.59::true_val(sidecut_patent, us_patent_7798514); 0.41::true_val(sidecut_patent, unk_sidecut_patent).

measured(s21, sidecut_patent, us_patent_7798514).

all_consistent(sidecut_patent) :- consistent(s21, sidecut_patent).

evidence(all_consistent(sidecut_patent)).
query(true_val(sidecut_patent, us_patent_7798514)).
query(true_val(sidecut_patent, unk_sidecut_patent)).

% @attr nose_tail_profile
% @type categorical
% @canonical false
% @original_name nose/tail profile
% @values low_profile=Low_Profile_Tip_Tail unk_nose_tail_profile=Unknown
% @importance 1.0

0.95::acc(s1, nose_tail_profile).

0.92::true_val(nose_tail_profile, low_profile); 0.08::true_val(nose_tail_profile, unk_nose_tail_profile).

measured(s1, nose_tail_profile, low_profile).

all_consistent(nose_tail_profile) :- consistent(s1, nose_tail_profile).

evidence(all_consistent(nose_tail_profile)).
query(true_val(nose_tail_profile, low_profile)).
query(true_val(nose_tail_profile, unk_nose_tail_profile)).

% @attr nose_tail_description
% @type categorical
% @canonical false
% @original_name nose/tail description
% @values pop_stability_glide=Maximizes_pop_stability_and_glide unk_nose_tail_description=Unknown
% @importance 0.85

0.78::acc(s18, nose_tail_description).

0.71::true_val(nose_tail_description, pop_stability_glide); 0.29::true_val(nose_tail_description, unk_nose_tail_description).

measured(s18, nose_tail_description, pop_stability_glide).

all_consistent(nose_tail_description) :-
    (indep(s18), consistent(s18, nose_tail_description) ; \+indep(s18)).

evidence(all_consistent(nose_tail_description)).
query(true_val(nose_tail_description, pop_stability_glide)).
query(true_val(nose_tail_description, unk_nose_tail_description)).

% @attr waist_width_146
% @type numeric
% @canonical false
% @original_name waist width 146cm (manufacturer site)
% @unit cm
% @values v24_1=24.1 unk_waist_width_146=Unknown
% @importance 1.0

0.88::acc(s1, waist_width_146).

0.92::true_val(waist_width_146, v24_1); 0.08::true_val(waist_width_146, unk_waist_width_146).

measured(s1, waist_width_146, v24_1).

all_consistent(waist_width_146) :- consistent(s1, waist_width_146).

evidence(all_consistent(waist_width_146)).
query(true_val(waist_width_146, v24_1)).
query(true_val(waist_width_146, unk_waist_width_146)).

% @attr waist_width_149
% @type numeric
% @canonical false
% @original_name waist width 149cm
% @unit cm
% @values v25_2=25.2 v24_3=24.3
% @importance 0.98

0.82::acc(s1, waist_width_149).
0.85::acc(s22, waist_width_149).

0.45::true_val(waist_width_149, v25_2); 0.55::true_val(waist_width_149, v24_3).

measured(s1, waist_width_149, v25_2).
measured(s22, waist_width_149, v24_3).

all_consistent(waist_width_149) :-
    consistent(s1, waist_width_149),
    consistent(s22, waist_width_149).

evidence(all_consistent(waist_width_149)).
query(true_val(waist_width_149, v25_2)).
query(true_val(waist_width_149, v24_3)).

% @attr waist_width_152
% @type numeric
% @canonical false
% @original_name waist width 152cm
% @unit cm
% @values v25_35=25.35 v24_4=24.4
% @importance 0.92

0.82::acc(s1, waist_width_152).
0.85::acc(s22, waist_width_152).
0.72::acc(s23, waist_width_152).

0.35::true_val(waist_width_152, v25_35); 0.65::true_val(waist_width_152, v24_4).

measured(s1, waist_width_152, v25_35).
measured(s22, waist_width_152, v24_4).
measured(s23, waist_width_152, v24_4).

all_consistent(waist_width_152) :-
    consistent(s1, waist_width_152),
    consistent(s22, waist_width_152),
    consistent(s23, waist_width_152).

evidence(all_consistent(waist_width_152)).
query(true_val(waist_width_152, v25_35)).
query(true_val(waist_width_152, v24_4)).

% @attr waist_width_156
% @type numeric
% @canonical false
% @original_name waist width 156cm
% @unit cm
% @values v25_5=25.5 v25_1=25.1
% @importance 0.98

0.82::acc(s1, waist_width_156).
0.85::acc(s22, waist_width_156).

0.45::true_val(waist_width_156, v25_5); 0.55::true_val(waist_width_156, v25_1).

measured(s1, waist_width_156, v25_5).
measured(s22, waist_width_156, v25_1).

all_consistent(waist_width_156) :-
    consistent(s1, waist_width_156),
    consistent(s22, waist_width_156).

evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v25_5)).
query(true_val(waist_width_156, v25_1)).

% @attr waist_width_154w
% @type numeric
% @canonical false
% @original_name waist width 154W
% @unit cm
% @values v26_1=26.1 unk_waist_width_154w=Unknown
% @importance 0.98

0.90::acc(s1, waist_width_154w).
0.85::acc(s22, waist_width_154w).

0.95::true_val(waist_width_154w, v26_1); 0.05::true_val(waist_width_154w, unk_waist_width_154w).

measured(s1, waist_width_154w, v26_1).
measured(s22, waist_width_154w, v26_1).

all_consistent(waist_width_154w) :-
    consistent(s1, waist_width_154w),
    consistent(s22, waist_width_154w).

evidence(all_consistent(waist_width_154w)).
query(true_val(waist_width_154w, v26_1)).
query(true_val(waist_width_154w, unk_waist_width_154w)).

% @attr waist_width_157w
% @type numeric
% @canonical false
% @original_name waist width 157W
% @unit cm
% @values v26_4=26.4 unk_waist_width_157w=Unknown
% @importance 0.98

0.90::acc(s1, waist_width_157w).
0.85::acc(s22, waist_width_157w).

0.95::true_val(waist_width_157w, v26_4); 0.05::true_val(waist_width_157w, unk_waist_width_157w).

measured(s1, waist_width_157w, v26_4).
measured(s22, waist_width_157w, v26_4).

all_consistent(waist_width_157w) :-
    consistent(s1, waist_width_157w),
    consistent(s22, waist_width_157w).

evidence(all_consistent(waist_width_157w)).
query(true_val(waist_width_157w, v26_4)).
query(true_val(waist_width_157w, unk_waist_width_157w)).

% @attr effective_edge_146
% @type numeric
% @canonical false
% @original_name effective edge 146cm
% @unit cm
% @values v116=116.0 unk_effective_edge_146=Unknown
% @importance 1.0

0.93::acc(s1, effective_edge_146).

0.92::true_val(effective_edge_146, v116); 0.08::true_val(effective_edge_146, unk_effective_edge_146).

measured(s1, effective_edge_146, v116).

all_consistent(effective_edge_146) :- consistent(s1, effective_edge_146).

evidence(all_consistent(effective_edge_146)).
query(true_val(effective_edge_146, v116)).
query(true_val(effective_edge_146, unk_effective_edge_146)).

% @attr effective_edge_149
% @type numeric
% @canonical false
% @original_name effective edge 149cm
% @unit cm
% @values v119=119.0 unk_effective_edge_149=Unknown
% @importance 1.0

0.93::acc(s1, effective_edge_149).

0.92::true_val(effective_edge_149, v119); 0.08::true_val(effective_edge_149, unk_effective_edge_149).

measured(s1, effective_edge_149, v119).

all_consistent(effective_edge_149) :- consistent(s1, effective_edge_149).

evidence(all_consistent(effective_edge_149)).
query(true_val(effective_edge_149, v119)).
query(true_val(effective_edge_149, unk_effective_edge_149)).

% @attr effective_edge_152
% @type numeric
% @canonical false
% @original_name effective edge 152cm
% @unit cm
% @values v122=122.0 unk_effective_edge_152=Unknown
% @importance 1.0

0.93::acc(s1, effective_edge_152).

0.92::true_val(effective_edge_152, v122); 0.08::true_val(effective_edge_152, unk_effective_edge_152).

measured(s1, effective_edge_152, v122).

all_consistent(effective_edge_152) :- consistent(s1, effective_edge_152).

evidence(all_consistent(effective_edge_152)).
query(true_val(effective_edge_152, v122)).
query(true_val(effective_edge_152, unk_effective_edge_152)).

% @attr effective_edge_156
% @type numeric
% @canonical false
% @original_name effective edge 156cm
% @unit cm
% @values v125=125.0 unk_effective_edge_156=Unknown
% @importance 1.0

0.93::acc(s1, effective_edge_156).

0.92::true_val(effective_edge_156, v125); 0.08::true_val(effective_edge_156, unk_effective_edge_156).

measured(s1, effective_edge_156, v125).

all_consistent(effective_edge_156) :- consistent(s1, effective_edge_156).

evidence(all_consistent(effective_edge_156)).
query(true_val(effective_edge_156, v125)).
query(true_val(effective_edge_156, unk_effective_edge_156)).

% @attr effective_edge_154w
% @type numeric
% @canonical false
% @original_name effective edge 154W
% @unit cm
% @values v122=122.0 unk_effective_edge_154w=Unknown
% @importance 1.0

0.93::acc(s1, effective_edge_154w).

0.92::true_val(effective_edge_154w, v122); 0.08::true_val(effective_edge_154w, unk_effective_edge_154w).

measured(s1, effective_edge_154w, v122).

all_consistent(effective_edge_154w) :- consistent(s1, effective_edge_154w).

evidence(all_consistent(effective_edge_154w)).
query(true_val(effective_edge_154w, v122)).
query(true_val(effective_edge_154w, unk_effective_edge_154w)).

% @attr effective_edge_157w
% @type numeric
% @canonical false
% @original_name effective edge 157W
% @unit cm
% @values v125=125.0 unk_effective_edge_157w=Unknown
% @importance 1.0

0.93::acc(s1, effective_edge_157w).

0.92::true_val(effective_edge_157w, v125); 0.08::true_val(effective_edge_157w, unk_effective_edge_157w).

measured(s1, effective_edge_157w, v125).

all_consistent(effective_edge_157w) :- consistent(s1, effective_edge_157w).

evidence(all_consistent(effective_edge_157w)).
query(true_val(effective_edge_157w, v125)).
query(true_val(effective_edge_157w, unk_effective_edge_157w)).

% @attr sidecut_radius_size_146
% @type categorical
% @canonical false
% @original_name sidecut_radius_size 146cm
% @values vario_700=Vario_700 unk_sidecut_radius_size_146=Unknown
% @importance 1.0

0.93::acc(s1, sidecut_radius_size_146).

0.92::true_val(sidecut_radius_size_146, vario_700); 0.08::true_val(sidecut_radius_size_146, unk_sidecut_radius_size_146).

measured(s1, sidecut_radius_size_146, vario_700).

all_consistent(sidecut_radius_size_146) :- consistent(s1, sidecut_radius_size_146).

evidence(all_consistent(sidecut_radius_size_146)).
query(true_val(sidecut_radius_size_146, vario_700)).
query(true_val(sidecut_radius_size_146, unk_sidecut_radius_size_146)).

% @attr sidecut_radius_size_149
% @type categorical
% @canonical false
% @original_name sidecut_radius_size 149cm
% @values vario_702=Vario_702 unk_sidecut_radius_size_149=Unknown
% @importance 1.0

0.93::acc(s1, sidecut_radius_size_149).

0.92::true_val(sidecut_radius_size_149, vario_702); 0.08::true_val(sidecut_radius_size_149, unk_sidecut_radius_size_149).

measured(s1, sidecut_radius_size_149, vario_702).

all_consistent(sidecut_radius_size_149) :- consistent(s1, sidecut_radius_size_149).

evidence(all_consistent(sidecut_radius_size_149)).
query(true_val(sidecut_radius_size_149, vario_702)).
query(true_val(sidecut_radius_size_149, unk_sidecut_radius_size_149)).

% @attr sidecut_radius_size_152
% @type categorical
% @canonical false
% @original_name sidecut_radius_size 152cm
% @values vario_720=Vario_720 unk_sidecut_radius_size_152=Unknown
% @importance 1.0

0.93::acc(s1, sidecut_radius_size_152).

0.92::true_val(sidecut_radius_size_152, vario_720); 0.08::true_val(sidecut_radius_size_152, unk_sidecut_radius_size_152).

measured(s1, sidecut_radius_size_152, vario_720).

all_consistent(sidecut_radius_size_152) :- consistent(s1, sidecut_radius_size_152).

evidence(all_consistent(sidecut_radius_size_152)).
query(true_val(sidecut_radius_size_152, vario_720)).
query(true_val(sidecut_radius_size_152, unk_sidecut_radius_size_152)).

% @attr sidecut_radius_size
% @type categorical
% @canonical true
% @original_name sidecut_radius_size
% @values vario_735=Vario_735 unk_sidecut_radius_size=Unknown
% @importance 1.0

0.93::acc(s1, sidecut_radius_size).

0.92::true_val(sidecut_radius_size, vario_735); 0.08::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s1, sidecut_radius_size, vario_735).

all_consistent(sidecut_radius_size) :- consistent(s1, sidecut_radius_size).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, vario_735)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr sidecut_radius_size_154w
% @type categorical
% @canonical false
% @original_name sidecut_radius_size 154W
% @values vario_728=Vario_728 unk_sidecut_radius_size_154w=Unknown
% @importance 1.0

0.93::acc(s1, sidecut_radius_size_154w).

0.92::true_val(sidecut_radius_size_154w, vario_728); 0.08::true_val(sidecut_radius_size_154w, unk_sidecut_radius_size_154w).

measured(s1, sidecut_radius_size_154w, vario_728).

all_consistent(sidecut_radius_size_154w) :- consistent(s1, sidecut_radius_size_154w).

evidence(all_consistent(sidecut_radius_size_154w)).
query(true_val(sidecut_radius_size_154w, vario_728)).
query(true_val(sidecut_radius_size_154w, unk_sidecut_radius_size_154w)).

% @attr sidecut_radius_size_157w
% @type categorical
% @canonical false
% @original_name sidecut_radius_size 157W
% @values vario_735=Vario_735 unk_sidecut_radius_size_157w=Unknown
% @importance 1.0

0.93::acc(s1, sidecut_radius_size_157w).

0.92::true_val(sidecut_radius_size_157w, vario_735); 0.08::true_val(sidecut_radius_size_157w, unk_sidecut_radius_size_157w).

measured(s1, sidecut_radius_size_157w, vario_735).

all_consistent(sidecut_radius_size_157w) :- consistent(s1, sidecut_radius_size_157w).

evidence(all_consistent(sidecut_radius_size_157w)).
query(true_val(sidecut_radius_size_157w, vario_735)).
query(true_val(sidecut_radius_size_157w, unk_sidecut_radius_size_157w)).

% @attr tip_tail_width_size_146
% @type numeric
% @canonical false
% @original_name tip_tail_width_size 146cm
% @unit cm
% @values v28_2=28.2 unk_tip_tail_width_size_146=Unknown
% @importance 1.0

0.93::acc(s1, tip_tail_width_size_146).

0.92::true_val(tip_tail_width_size_146, v28_2); 0.08::true_val(tip_tail_width_size_146, unk_tip_tail_width_size_146).

measured(s1, tip_tail_width_size_146, v28_2).

all_consistent(tip_tail_width_size_146) :- consistent(s1, tip_tail_width_size_146).

evidence(all_consistent(tip_tail_width_size_146)).
query(true_val(tip_tail_width_size_146, v28_2)).
query(true_val(tip_tail_width_size_146, unk_tip_tail_width_size_146)).

% @attr tip_tail_width_size_149
% @type numeric
% @canonical false
% @original_name tip_tail_width_size 149cm
% @unit cm
% @values v29_19=29.19 unk_tip_tail_width_size_149=Unknown
% @importance 1.0

0.93::acc(s1, tip_tail_width_size_149).

0.92::true_val(tip_tail_width_size_149, v29_19); 0.08::true_val(tip_tail_width_size_149, unk_tip_tail_width_size_149).

measured(s1, tip_tail_width_size_149, v29_19).

all_consistent(tip_tail_width_size_149) :- consistent(s1, tip_tail_width_size_149).

evidence(all_consistent(tip_tail_width_size_149)).
query(true_val(tip_tail_width_size_149, v29_19)).
query(true_val(tip_tail_width_size_149, unk_tip_tail_width_size_149)).

% @attr tip_tail_width_size_152
% @type numeric
% @canonical false
% @original_name tip_tail_width_size 152cm
% @unit cm
% @values v29_46=29.46 unk_tip_tail_width_size_152=Unknown
% @importance 1.0

0.93::acc(s1, tip_tail_width_size_152).

0.92::true_val(tip_tail_width_size_152, v29_46); 0.08::true_val(tip_tail_width_size_152, unk_tip_tail_width_size_152).

measured(s1, tip_tail_width_size_152, v29_46).

all_consistent(tip_tail_width_size_152) :- consistent(s1, tip_tail_width_size_152).

evidence(all_consistent(tip_tail_width_size_152)).
query(true_val(tip_tail_width_size_152, v29_46)).
query(true_val(tip_tail_width_size_152, unk_tip_tail_width_size_152)).

% @attr tip_tail_width_size
% @type numeric
% @canonical true
% @original_name tip_tail_width_size
% @unit cm
% @values v29_72=29.72 unk_tip_tail_width_size=Unknown
% @importance 1.0

0.93::acc(s1, tip_tail_width_size).

0.92::true_val(tip_tail_width_size, v29_72); 0.08::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s1, tip_tail_width_size, v29_72).

all_consistent(tip_tail_width_size) :- consistent(s1, tip_tail_width_size).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v29_72)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr tip_tail_width_size_154w
% @type numeric
% @canonical false
% @original_name tip_tail_width_size 154W
% @unit cm
% @values v30_5=30.5 unk_tip_tail_width_size_154w=Unknown
% @importance 1.0

0.93::acc(s1, tip_tail_width_size_154w).

0.92::true_val(tip_tail_width_size_154w, v30_5); 0.08::true_val(tip_tail_width_size_154w, unk_tip_tail_width_size_154w).

measured(s1, tip_tail_width_size_154w, v30_5).

all_consistent(tip_tail_width_size_154w) :- consistent(s1, tip_tail_width_size_154w).

evidence(all_consistent(tip_tail_width_size_154w)).
query(true_val(tip_tail_width_size_154w, v30_5)).
query(true_val(tip_tail_width_size_154w, unk_tip_tail_width_size_154w)).

% @attr tip_tail_width_size_157w
% @type numeric
% @canonical false
% @original_name tip_tail_width_size 157W
% @unit cm
% @values v31_0=31.0 unk_tip_tail_width_size_157w=Unknown
% @importance 1.0

0.93::acc(s1, tip_tail_width_size_157w).

0.92::true_val(tip_tail_width_size_157w, v31_0); 0.08::true_val(tip_tail_width_size_157w, unk_tip_tail_width_size_157w).

measured(s1, tip_tail_width_size_157w, v31_0).

all_consistent(tip_tail_width_size_157w) :- consistent(s1, tip_tail_width_size_157w).

evidence(all_consistent(tip_tail_width_size_157w)).
query(true_val(tip_tail_width_size_157w, v31_0)).
query(true_val(tip_tail_width_size_157w, unk_tip_tail_width_size_157w)).

% @attr tail_equals_nose
% @type categorical
% @canonical false
% @original_name tail width equals nose width (true twin)
% @values yes=Yes unk_tail_equals_nose=Unknown
% @importance 1.0

0.93::acc(s1, tail_equals_nose).

0.92::true_val(tail_equals_nose, yes); 0.08::true_val(tail_equals_nose, unk_tail_equals_nose).

measured(s1, tail_equals_nose, yes).

all_consistent(tail_equals_nose) :- consistent(s1, tail_equals_nose).

evidence(all_consistent(tail_equals_nose)).
query(true_val(tail_equals_nose, yes)).
query(true_val(tail_equals_nose, unk_tail_equals_nose)).

% @attr recommended_weight_range_size_146
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size 146cm
% @unit kg
% @values w40_68=40-68kg unk_recommended_weight_range_size_146=Unknown
% @importance 0.95

0.82::acc(s22, recommended_weight_range_size_146).

0.72::true_val(recommended_weight_range_size_146, w40_68); 0.28::true_val(recommended_weight_range_size_146, unk_recommended_weight_range_size_146).

measured(s22, recommended_weight_range_size_146, w40_68).

all_consistent(recommended_weight_range_size_146) :- consistent(s22, recommended_weight_range_size_146).

evidence(all_consistent(recommended_weight_range_size_146)).
query(true_val(recommended_weight_range_size_146, w40_68)).
query(true_val(recommended_weight_range_size_146, unk_recommended_weight_range_size_146)).

% @attr recommended_weight_range_size_149
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size 149cm
% @unit kg
% @values w45_70=45-70kg unk_recommended_weight_range_size_149=Unknown
% @importance 0.95

0.82::acc(s22, recommended_weight_range_size_149).

0.72::true_val(recommended_weight_range_size_149, w45_70); 0.28::true_val(recommended_weight_range_size_149, unk_recommended_weight_range_size_149).

measured(s22, recommended_weight_range_size_149, w45_70).

all_consistent(recommended_weight_range_size_149) :- consistent(s22, recommended_weight_range_size_149).

evidence(all_consistent(recommended_weight_range_size_149)).
query(true_val(recommended_weight_range_size_149, w45_70)).
query(true_val(recommended_weight_range_size_149, unk_recommended_weight_range_size_149)).

% @attr recommended_weight_range_size_152
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size 152cm
% @unit kg
% @values w50_75=50-75kg unk_recommended_weight_range_size_152=Unknown
% @importance 0.95

0.82::acc(s22, recommended_weight_range_size_152).

0.72::true_val(recommended_weight_range_size_152, w50_75); 0.28::true_val(recommended_weight_range_size_152, unk_recommended_weight_range_size_152).

measured(s22, recommended_weight_range_size_152, w50_75).

all_consistent(recommended_weight_range_size_152) :- consistent(s22, recommended_weight_range_size_152).

evidence(all_consistent(recommended_weight_range_size_152)).
query(true_val(recommended_weight_range_size_152, w50_75)).
query(true_val(recommended_weight_range_size_152, unk_recommended_weight_range_size_152)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size
% @unit kg
% @values w55_80=55-80kg unk_recommended_weight_range_size=Unknown
% @importance 0.95

0.82::acc(s22, recommended_weight_range_size).

0.72::true_val(recommended_weight_range_size, w55_80); 0.28::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s22, recommended_weight_range_size, w55_80).

all_consistent(recommended_weight_range_size) :- consistent(s22, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w55_80)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr recommended_weight_range_size_154w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size 154W
% @unit kg
% @values w55_plus=55+kg unk_recommended_weight_range_size_154w=Unknown
% @importance 0.95

0.82::acc(s22, recommended_weight_range_size_154w).

0.72::true_val(recommended_weight_range_size_154w, w55_plus); 0.28::true_val(recommended_weight_range_size_154w, unk_recommended_weight_range_size_154w).

measured(s22, recommended_weight_range_size_154w, w55_plus).

all_consistent(recommended_weight_range_size_154w) :- consistent(s22, recommended_weight_range_size_154w).

evidence(all_consistent(recommended_weight_range_size_154w)).
query(true_val(recommended_weight_range_size_154w, w55_plus)).
query(true_val(recommended_weight_range_size_154w, unk_recommended_weight_range_size_154w)).

% @attr recommended_weight_range_size_157w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size 157W
% @unit kg
% @values w60_plus=60+kg unk_recommended_weight_range_size_157w=Unknown
% @importance 0.95

0.82::acc(s22, recommended_weight_range_size_157w).

0.72::true_val(recommended_weight_range_size_157w, w60_plus); 0.28::true_val(recommended_weight_range_size_157w, unk_recommended_weight_range_size_157w).

measured(s22, recommended_weight_range_size_157w, w60_plus).

all_consistent(recommended_weight_range_size_157w) :- consistent(s22, recommended_weight_range_size_157w).

evidence(all_consistent(recommended_weight_range_size_157w)).
query(true_val(recommended_weight_range_size_157w, w60_plus)).
query(true_val(recommended_weight_range_size_157w, unk_recommended_weight_range_size_157w)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values six_sizes=146_149_152_156_154W_157W unk_available_sizes=Unknown
% @importance 1.0

0.95::acc(s1, available_sizes).

0.92::true_val(available_sizes, six_sizes); 0.08::true_val(available_sizes, unk_available_sizes).

measured(s1, available_sizes, six_sizes).

all_consistent(available_sizes) :- consistent(s1, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, six_sizes)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr available_sizes_merchant
% @type categorical
% @canonical false
% @original_name available_sizes (merchant)
% @values two_sizes=152cm_156cm unk_available_sizes_merchant=Unknown
% @importance 0.95

0.82::acc(s22, available_sizes_merchant).

0.72::true_val(available_sizes_merchant, two_sizes); 0.28::true_val(available_sizes_merchant, unk_available_sizes_merchant).

measured(s22, available_sizes_merchant, two_sizes).

all_consistent(available_sizes_merchant) :- consistent(s22, available_sizes_merchant).

evidence(all_consistent(available_sizes_merchant)).
query(true_val(available_sizes_merchant, two_sizes)).
query(true_val(available_sizes_merchant, unk_available_sizes_merchant)).

% @attr warranty_period_years
% @type numeric
% @canonical true
% @original_name warranty_period_years
% @unit years
% @values v2=2.0 v3=3.0
% @importance 0.87

0.78::acc(s22, warranty_period_years).
0.78::acc(s24, warranty_period_years).
0.85::acc(s3, warranty_period_years).

0.55::true_val(warranty_period_years, v2); 0.45::true_val(warranty_period_years, v3).

measured(s22, warranty_period_years, v2).
measured(s24, warranty_period_years, v2).
measured(s3, warranty_period_years, v3).

all_consistent(warranty_period_years) :-
    consistent(s22, warranty_period_years),
    (indep(s24), consistent(s24, warranty_period_years) ; \+indep(s24)),
    consistent(s3, warranty_period_years).

evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v2)).
query(true_val(warranty_period_years, v3)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v589=589.0 unk_price_usd_msrp=Unknown
% @importance 0.90

0.92::acc(s25, price_usd_msrp).
0.90::acc(s26, price_usd_msrp).

0.95::true_val(price_usd_msrp, v589); 0.05::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s25, price_usd_msrp, v589).
measured(s26, price_usd_msrp, v589).

all_consistent(price_usd_msrp) :-
    (indep(s25), consistent(s25, price_usd_msrp) ; \+indep(s25)),
    (indep(s26), consistent(s26, price_usd_msrp) ; \+indep(s26)).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v589)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_aud_merchant_rrp
% @type numeric
% @canonical false
% @original_name price_aud_merchant (RRP)
% @unit AUD
% @values v999_99=999.99 unk_price_aud_merchant_rrp=Unknown
% @importance 0.95

0.82::acc(s22, price_aud_merchant_rrp).

0.72::true_val(price_aud_merchant_rrp, v999_99); 0.28::true_val(price_aud_merchant_rrp, unk_price_aud_merchant_rrp).

measured(s22, price_aud_merchant_rrp, v999_99).

all_consistent(price_aud_merchant_rrp) :- consistent(s22, price_aud_merchant_rrp).

evidence(all_consistent(price_aud_merchant_rrp)).
query(true_val(price_aud_merchant_rrp, v999_99)).
query(true_val(price_aud_merchant_rrp, unk_price_aud_merchant_rrp)).

% @attr price_aud_merchant
% @type numeric
% @canonical true
% @original_name price_aud_merchant
% @unit AUD
% @values v599_99=599.99 unk_price_aud_merchant=Unknown
% @importance 0.95

0.85::acc(s22, price_aud_merchant).

0.72::true_val(price_aud_merchant, v599_99); 0.28::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s22, price_aud_merchant, v599_99).

all_consistent(price_aud_merchant) :- consistent(s22, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v599_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_usd_academy_direct
% @type numeric
% @canonical false
% @original_name price USD (Academy direct, 2024 model on sale)
% @unit USD
% @values v471_20=471.20 unk_price_usd_academy_direct=Unknown
% @importance 0.90

0.92::acc(s1, price_usd_academy_direct).

0.92::true_val(price_usd_academy_direct, v471_20); 0.08::true_val(price_usd_academy_direct, unk_price_usd_academy_direct).

measured(s1, price_usd_academy_direct, v471_20).

all_consistent(price_usd_academy_direct) :- consistent(s1, price_usd_academy_direct).

evidence(all_consistent(price_usd_academy_direct)).
query(true_val(price_usd_academy_direct, v471_20)).
query(true_val(price_usd_academy_direct, unk_price_usd_academy_direct)).

% @attr price_usd_getboards
% @type numeric
% @canonical false
% @original_name price USD (Getboards.com, 2024 model on sale)
% @unit USD
% @values v471_20=471.20 unk_price_usd_getboards=Unknown
% @importance 0.85

0.78::acc(s27, price_usd_getboards).

0.64::true_val(price_usd_getboards, v471_20); 0.36::true_val(price_usd_getboards, unk_price_usd_getboards).

measured(s27, price_usd_getboards, v471_20).

all_consistent(price_usd_getboards) :-
    (indep(s27), consistent(s27, price_usd_getboards) ; \+indep(s27)).

evidence(all_consistent(price_usd_getboards)).
query(true_val(price_usd_getboards, v471_20)).
query(true_val(price_usd_getboards, unk_price_usd_getboards)).

% @attr price_usd_baker_st
% @type numeric
% @canonical false
% @original_name price USD (Baker Street Snow, 2024 model on sale)
% @unit USD
% @values v353_40=353.40 unk_price_usd_baker_st=Unknown
% @importance 0.90

0.75::acc(s28, price_usd_baker_st).

0.60::true_val(price_usd_baker_st, v353_40); 0.40::true_val(price_usd_baker_st, unk_price_usd_baker_st).

measured(s28, price_usd_baker_st, v353_40).

all_consistent(price_usd_baker_st) :-
    (indep(s28), consistent(s28, price_usd_baker_st) ; \+indep(s28)).

evidence(all_consistent(price_usd_baker_st)).
query(true_val(price_usd_baker_st, v353_40)).
query(true_val(price_usd_baker_st, unk_price_usd_baker_st)).

% @attr price_usd_blauer
% @type numeric
% @canonical false
% @original_name price USD (Blauer Board Shop, 2024 closeout)
% @unit USD
% @values v249_99=249.99 unk_price_usd_blauer=Unknown
% @importance 0.85

0.75::acc(s29, price_usd_blauer).

0.63::true_val(price_usd_blauer, v249_99); 0.37::true_val(price_usd_blauer, unk_price_usd_blauer).

measured(s29, price_usd_blauer, v249_99).

all_consistent(price_usd_blauer) :-
    (indep(s29), consistent(s29, price_usd_blauer) ; \+indep(s29)).

evidence(all_consistent(price_usd_blauer)).
query(true_val(price_usd_blauer, v249_99)).
query(true_val(price_usd_blauer, unk_price_usd_blauer)).

% @attr price_usd_modern_skate
% @type numeric
% @canonical false
% @original_name price USD (Modern Skate & Surf)
% @unit USD
% @values v599=599.0 unk_price_usd_modern_skate=Unknown
% @importance 0.70

0.65::acc(s30, price_usd_modern_skate).

0.51::true_val(price_usd_modern_skate, v599); 0.49::true_val(price_usd_modern_skate, unk_price_usd_modern_skate).

measured(s30, price_usd_modern_skate, v599).

all_consistent(price_usd_modern_skate) :-
    (indep(s30), consistent(s30, price_usd_modern_skate) ; \+indep(s30)).

evidence(all_consistent(price_usd_modern_skate)).
query(true_val(price_usd_modern_skate, v599)).
query(true_val(price_usd_modern_skate, unk_price_usd_modern_skate)).

% @attr price_usd_cookies_variant
% @type numeric
% @canonical false
% @original_name price USD (Cookies SF Collab variant, Baker St)
% @unit USD
% @values v469=469.0 unk_price_usd_cookies_variant=Unknown
% @importance 0.60

0.72::acc(s31, price_usd_cookies_variant).

0.59::true_val(price_usd_cookies_variant, v469); 0.41::true_val(price_usd_cookies_variant, unk_price_usd_cookies_variant).

measured(s31, price_usd_cookies_variant, v469).

all_consistent(price_usd_cookies_variant) :-
    (indep(s31), consistent(s31, price_usd_cookies_variant) ; \+indep(s31)).

evidence(all_consistent(price_usd_cookies_variant)).
query(true_val(price_usd_cookies_variant, v469)).
query(true_val(price_usd_cookies_variant, unk_price_usd_cookies_variant)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values available=Available unk_availability_status=Unknown
% @importance 1.0

0.95::acc(s1, availability_status).

0.92::true_val(availability_status, available); 0.08::true_val(availability_status, unk_availability_status).

measured(s1, availability_status, available).

all_consistent(availability_status) :- consistent(s1, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, available)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_getboards
% @type categorical
% @canonical false
% @original_name availability_status (Getboards.com)
% @values available=Available unk_availability_status_getboards=Unknown
% @importance 0.85

0.78::acc(s27, availability_status_getboards).

0.64::true_val(availability_status_getboards, available); 0.36::true_val(availability_status_getboards, unk_availability_status_getboards).

measured(s27, availability_status_getboards, available).

all_consistent(availability_status_getboards) :-
    (indep(s27), consistent(s27, availability_status_getboards) ; \+indep(s27)).

evidence(all_consistent(availability_status_getboards)).
query(true_val(availability_status_getboards, available)).
query(true_val(availability_status_getboards, unk_availability_status_getboards)).

% @attr availability_status_baker_st
% @type categorical
% @canonical false
% @original_name availability_status (Baker Street Snow)
% @values available=Available unk_availability_status_baker_st=Unknown
% @importance 0.90

0.75::acc(s28, availability_status_baker_st).

0.60::true_val(availability_status_baker_st, available); 0.40::true_val(availability_status_baker_st, unk_availability_status_baker_st).

measured(s28, availability_status_baker_st, available).

all_consistent(availability_status_baker_st) :-
    (indep(s28), consistent(s28, availability_status_baker_st) ; \+indep(s28)).

evidence(all_consistent(availability_status_baker_st)).
query(true_val(availability_status_baker_st, available)).
query(true_val(availability_status_baker_st, unk_availability_status_baker_st)).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status (Blauer Board Shop)
% @values closeout=Available_closeout unk_availability_status_blauer=Unknown
% @importance 0.85

0.75::acc(s29, availability_status_blauer).

0.63::true_val(availability_status_blauer, closeout); 0.37::true_val(availability_status_blauer, unk_availability_status_blauer).

measured(s29, availability_status_blauer, closeout).

all_consistent(availability_status_blauer) :-
    (indep(s29), consistent(s29, availability_status_blauer) ; \+indep(s29)).

evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, closeout)).
query(true_val(availability_status_blauer, unk_availability_status_blauer)).

% @attr availability_status_melbourne
% @type categorical
% @canonical false
% @original_name availability_status (Melbourne Snowboard Centre)
% @values available=Available unk_availability_status_melbourne=Unknown
% @importance 0.85

0.78::acc(s24, availability_status_melbourne).

0.71::true_val(availability_status_melbourne, available); 0.29::true_val(availability_status_melbourne, unk_availability_status_melbourne).

measured(s24, availability_status_melbourne, available).

all_consistent(availability_status_melbourne) :-
    (indep(s24), consistent(s24, availability_status_melbourne) ; \+indep(s24)).

evidence(all_consistent(availability_status_melbourne)).
query(true_val(availability_status_melbourne, available)).
query(true_val(availability_status_melbourne, unk_availability_status_melbourne)).

% @attr availability_status_dreamruns
% @type categorical
% @canonical false
% @original_name availability_status (Dreamruns.com)
% @values available=Available unk_availability_status_dreamruns=Unknown
% @importance 0.70

0.72::acc(s32, availability_status_dreamruns).

0.55::true_val(availability_status_dreamruns, available); 0.45::true_val(availability_status_dreamruns, unk_availability_status_dreamruns).

measured(s32, availability_status_dreamruns, available).

all_consistent(availability_status_dreamruns) :-
    (indep(s32), consistent(s32, availability_status_dreamruns) ; \+indep(s32)).

evidence(all_consistent(availability_status_dreamruns)).
query(true_val(availability_status_dreamruns, available)).
query(true_val(availability_status_dreamruns, unk_availability_status_dreamruns)).

% @attr availability_status_shoreline
% @type categorical
% @canonical false
% @original_name availability_status (Shoreline of Tahoe)
% @values available=Available unk_availability_status_shoreline=Unknown
% @importance 0.60

0.72::acc(s33, availability_status_shoreline).

0.55::true_val(availability_status_shoreline, available); 0.45::true_val(availability_status_shoreline, unk_availability_status_shoreline).

measured(s33, availability_status_shoreline, available).

all_consistent(availability_status_shoreline) :-
    (indep(s33), consistent(s33, availability_status_shoreline) ; \+indep(s33)).

evidence(all_consistent(availability_status_shoreline)).
query(true_val(availability_status_shoreline, available)).
query(true_val(availability_status_shoreline, unk_availability_status_shoreline)).

% @attr availability_status_eriks
% @type categorical
% @canonical false
% @original_name availability_status (ERIKS Bike Board & Ski)
% @values closeout=CLOSEOUT unk_availability_status_eriks=Unknown
% @importance 0.75

0.75::acc(s34, availability_status_eriks).

0.61::true_val(availability_status_eriks, closeout); 0.39::true_val(availability_status_eriks, unk_availability_status_eriks).

measured(s34, availability_status_eriks, closeout).

all_consistent(availability_status_eriks) :-
    (indep(s34), consistent(s34, availability_status_eriks) ; \+indep(s34)).

evidence(all_consistent(availability_status_eriks)).
query(true_val(availability_status_eriks, closeout)).
query(true_val(availability_status_eriks, unk_availability_status_eriks)).

% @attr availability_status_ebay
% @type categorical
% @canonical false
% @original_name availability_status (eBay via Dreamruns)
% @values available=Available unk_availability_status_ebay=Unknown
% @importance 0.50

0.62::acc(s35, availability_status_ebay).

0.44::true_val(availability_status_ebay, available); 0.56::true_val(availability_status_ebay, unk_availability_status_ebay).

measured(s35, availability_status_ebay, available).

all_consistent(availability_status_ebay) :-
    (indep(s35), consistent(s35, availability_status_ebay) ; \+indep(s35)).

evidence(all_consistent(availability_status_ebay)).
query(true_val(availability_status_ebay, available)).
query(true_val(availability_status_ebay, unk_availability_status_ebay)).

% @attr availability_status_modern_skate
% @type categorical
% @canonical false
% @original_name availability_status (Modern Skate & Surf)
% @values available=Available unk_availability_status_modern_skate=Unknown
% @importance 0.70

0.65::acc(s30, availability_status_modern_skate).

0.51::true_val(availability_status_modern_skate, available); 0.49::true_val(availability_status_modern_skate, unk_availability_status_modern_skate).

measured(s30, availability_status_modern_skate, available).

all_consistent(availability_status_modern_skate) :-
    (indep(s30), consistent(s30, availability_status_modern_skate) ; \+indep(s30)).

evidence(all_consistent(availability_status_modern_skate)).
query(true_val(availability_status_modern_skate, available)).
query(true_val(availability_status_modern_skate, unk_availability_status_modern_skate)).

% @attr availability_status_christy
% @type categorical
% @canonical false
% @original_name availability_status (Christy Sports)
% @values listed=Listed unk_availability_status_christy=Unknown
% @importance 0.60

0.72::acc(s36, availability_status_christy).

0.56::true_val(availability_status_christy, listed); 0.44::true_val(availability_status_christy, unk_availability_status_christy).

measured(s36, availability_status_christy, listed).

all_consistent(availability_status_christy) :-
    (indep(s36), consistent(s36, availability_status_christy) ; \+indep(s36)).

evidence(all_consistent(availability_status_christy)).
query(true_val(availability_status_christy, listed)).
query(true_val(availability_status_christy, unk_availability_status_christy)).

% @attr availability_status_board_paradise
% @type categorical
% @canonical false
% @original_name availability_status (Board Paradise)
% @values academy_dealer=Academy_dealer unk_availability_status_board_paradise=Unknown
% @importance 0.65

0.72::acc(s5, availability_status_board_paradise).

0.63::true_val(availability_status_board_paradise, academy_dealer); 0.37::true_val(availability_status_board_paradise, unk_availability_status_board_paradise).

measured(s5, availability_status_board_paradise, academy_dealer).

all_consistent(availability_status_board_paradise) :-
    (indep(s5), consistent(s5, availability_status_board_paradise) ; \+indep(s5)).

evidence(all_consistent(availability_status_board_paradise)).
query(true_val(availability_status_board_paradise, academy_dealer)).
query(true_val(availability_status_board_paradise, unk_availability_status_board_paradise)).

% @attr variant
% @type categorical
% @canonical false
% @original_name variant
% @values cookies_sf_collab=Academy_x_Cookies_SF_420_units unk_variant=Unknown
% @importance 0.45

0.72::acc(s37, variant).

0.60::true_val(variant, cookies_sf_collab); 0.40::true_val(variant, unk_variant).

measured(s37, variant, cookies_sf_collab).

all_consistent(variant) :-
    (indep(s37), consistent(s37, variant) ; \+indep(s37)).

evidence(all_consistent(variant)).
query(true_val(variant, cookies_sf_collab)).
query(true_val(variant, unk_variant)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values propacamba_micro_camber=Academy_Propacamba_Micro_Camber unk_comparable_board_same_brand=Unknown
% @importance 0.80

0.80::acc(s38, comparable_board_same_brand).

0.68::true_val(comparable_board_same_brand, propacamba_micro_camber); 0.32::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s38, comparable_board_same_brand, propacamba_micro_camber).

all_consistent(comparable_board_same_brand) :- consistent(s38, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, propacamba_micro_camber)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values wide_154w_157w=Wide_154W_and_157W unk_width_options=Unknown
% @importance 1.0

0.93::acc(s1, width_options).

0.92::true_val(width_options, wide_154w_157w); 0.08::true_val(width_options, unk_width_options).

measured(s1, width_options, wide_154w_157w).

all_consistent(width_options) :- consistent(s1, width_options).

evidence(all_consistent(width_options)).
query(true_val(width_options, wide_154w_157w)).
query(true_val(width_options, unk_width_options)).

% @attr award_good_wood_2018
% @type categorical
% @canonical false
% @original_name award (Good Wood 2018)
% @values park_bang_for_buck=Park_Bang_for_Buck_2018 unk_award_good_wood_2018=Unknown
% @importance 0.75

0.72::acc(s39, award_good_wood_2018).
0.88::acc(s40, award_good_wood_2018).

0.95::true_val(award_good_wood_2018, park_bang_for_buck); 0.05::true_val(award_good_wood_2018, unk_award_good_wood_2018).

measured(s39, award_good_wood_2018, park_bang_for_buck).
measured(s40, award_good_wood_2018, park_bang_for_buck).

all_consistent(award_good_wood_2018) :-
    consistent(s39, award_good_wood_2018),
    consistent(s40, award_good_wood_2018).

evidence(all_consistent(award_good_wood_2018)).
query(true_val(award_good_wood_2018, park_bang_for_buck)).
query(true_val(award_good_wood_2018, unk_award_good_wood_2018)).

% @attr award_good_wood_2020
% @type categorical
% @canonical false
% @original_name award (Good Wood 2020)
% @values good_wood_2020=Transworld_Good_Wood_2020 unk_award_good_wood_2020=Unknown
% @importance 0.95

0.93::acc(s1, award_good_wood_2020).
0.78::acc(s25, award_good_wood_2020).

0.95::true_val(award_good_wood_2020, good_wood_2020); 0.05::true_val(award_good_wood_2020, unk_award_good_wood_2020).

measured(s1, award_good_wood_2020, good_wood_2020).
measured(s25, award_good_wood_2020, good_wood_2020).

all_consistent(award_good_wood_2020) :-
    consistent(s1, award_good_wood_2020),
    (indep(s25), consistent(s25, award_good_wood_2020) ; \+indep(s25)).

evidence(all_consistent(award_good_wood_2020)).
query(true_val(award_good_wood_2020, good_wood_2020)).
query(true_val(award_good_wood_2020, unk_award_good_wood_2020)).

% @attr manufacturer_site_review_score
% @type categorical
% @canonical false
% @original_name manufacturer site review score
% @values five_of_five=5_out_of_5_stars unk_manufacturer_site_review_score=Unknown
% @importance 1.0

0.80::acc(s1, manufacturer_site_review_score).

0.92::true_val(manufacturer_site_review_score, five_of_five); 0.08::true_val(manufacturer_site_review_score, unk_manufacturer_site_review_score).

measured(s1, manufacturer_site_review_score, five_of_five).

all_consistent(manufacturer_site_review_score) :- consistent(s1, manufacturer_site_review_score).

evidence(all_consistent(manufacturer_site_review_score)).
query(true_val(manufacturer_site_review_score, five_of_five)).
query(true_val(manufacturer_site_review_score, unk_manufacturer_site_review_score)).

% @attr positive_aspect_buttering
% @type categorical
% @canonical false
% @original_name positive_aspect (buttering/pressing)
% @values excellent_buttering=Butters_better_than_margarine unk_positive_aspect_buttering=Unknown
% @importance 0.80

0.72::acc(s23, positive_aspect_buttering).

0.43::true_val(positive_aspect_buttering, excellent_buttering); 0.57::true_val(positive_aspect_buttering, unk_positive_aspect_buttering).

measured(s23, positive_aspect_buttering, excellent_buttering).

all_consistent(positive_aspect_buttering) :- consistent(s23, positive_aspect_buttering).

evidence(all_consistent(positive_aspect_buttering)).
query(true_val(positive_aspect_buttering, excellent_buttering)).
query(true_val(positive_aspect_buttering, unk_positive_aspect_buttering)).

% @attr positive_aspect_edge_hold
% @type categorical
% @canonical false
% @original_name positive_aspect (edge hold for flat board)
% @values good_edge_hold_flat=Better_edge_hold_than_most_flat_boards unk_positive_aspect_edge_hold=Unknown
% @importance 0.80

0.72::acc(s23, positive_aspect_edge_hold).

0.43::true_val(positive_aspect_edge_hold, good_edge_hold_flat); 0.57::true_val(positive_aspect_edge_hold, unk_positive_aspect_edge_hold).

measured(s23, positive_aspect_edge_hold, good_edge_hold_flat).

all_consistent(positive_aspect_edge_hold) :- consistent(s23, positive_aspect_edge_hold).

evidence(all_consistent(positive_aspect_edge_hold)).
query(true_val(positive_aspect_edge_hold, good_edge_hold_flat)).
query(true_val(positive_aspect_edge_hold, unk_positive_aspect_edge_hold)).

% @attr positive_aspect_pop
% @type categorical
% @canonical false
% @original_name positive_aspect (pop)
% @values tonnes_of_pop=Tonnes_of_pop_durable unk_positive_aspect_pop=Unknown
% @importance 0.80

0.72::acc(s23, positive_aspect_pop).

0.43::true_val(positive_aspect_pop, tonnes_of_pop); 0.57::true_val(positive_aspect_pop, unk_positive_aspect_pop).

measured(s23, positive_aspect_pop, tonnes_of_pop).

all_consistent(positive_aspect_pop) :- consistent(s23, positive_aspect_pop).

evidence(all_consistent(positive_aspect_pop)).
query(true_val(positive_aspect_pop, tonnes_of_pop)).
query(true_val(positive_aspect_pop, unk_positive_aspect_pop)).

% @attr positive_aspect_lightweight
% @type categorical
% @canonical false
% @original_name positive_aspect (lightweight)
% @values light_easy_ride=Light_and_easy_to_ride unk_positive_aspect_lightweight=Unknown
% @importance 0.80

0.72::acc(s23, positive_aspect_lightweight).

0.43::true_val(positive_aspect_lightweight, light_easy_ride); 0.57::true_val(positive_aspect_lightweight, unk_positive_aspect_lightweight).

measured(s23, positive_aspect_lightweight, light_easy_ride).

all_consistent(positive_aspect_lightweight) :- consistent(s23, positive_aspect_lightweight).

evidence(all_consistent(positive_aspect_lightweight)).
query(true_val(positive_aspect_lightweight, light_easy_ride)).
query(true_val(positive_aspect_lightweight, unk_positive_aspect_lightweight)).

% @attr positive_aspect_jibs_jumps
% @type categorical
% @canonical false
% @original_name positive_aspect (jibs and jumps)
% @values good_jibs_jumps=Good_for_jibs_and_jumps unk_positive_aspect_jibs_jumps=Unknown
% @importance 0.80

0.72::acc(s23, positive_aspect_jibs_jumps).

0.43::true_val(positive_aspect_jibs_jumps, good_jibs_jumps); 0.57::true_val(positive_aspect_jibs_jumps, unk_positive_aspect_jibs_jumps).

measured(s23, positive_aspect_jibs_jumps, good_jibs_jumps).

all_consistent(positive_aspect_jibs_jumps) :- consistent(s23, positive_aspect_jibs_jumps).

evidence(all_consistent(positive_aspect_jibs_jumps)).
query(true_val(positive_aspect_jibs_jumps, good_jibs_jumps)).
query(true_val(positive_aspect_jibs_jumps, unk_positive_aspect_jibs_jumps)).

% @attr positive_aspect_customer_service
% @type categorical
% @canonical false
% @original_name positive_aspect (customer service)
% @values owners_respond_personal=Owners_personally_respond_stickers_thank_you unk_positive_aspect_customer_service=Unknown
% @importance 0.80

0.72::acc(s23, positive_aspect_customer_service).

0.43::true_val(positive_aspect_customer_service, owners_respond_personal); 0.57::true_val(positive_aspect_customer_service, unk_positive_aspect_customer_service).

measured(s23, positive_aspect_customer_service, owners_respond_personal).

all_consistent(positive_aspect_customer_service) :- consistent(s23, positive_aspect_customer_service).

evidence(all_consistent(positive_aspect_customer_service)).
query(true_val(positive_aspect_customer_service, owners_respond_personal)).
query(true_val(positive_aspect_customer_service, unk_positive_aspect_customer_service)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values waist_too_narrow=Waist_width_too_narrow_for_size_9_10_boots unk_negative_aspect=Unknown
% @importance 0.80

0.72::acc(s23, negative_aspect).

0.43::true_val(negative_aspect, waist_too_narrow); 0.57::true_val(negative_aspect, unk_negative_aspect).

measured(s23, negative_aspect, waist_too_narrow).

all_consistent(negative_aspect) :- consistent(s23, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, waist_too_narrow)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_carving_pop
% @type categorical
% @canonical false
% @original_name negative_aspect (carving and pop limitations)
% @values carving_pop_needs_work=Carving_and_pop_could_use_work unk_negative_aspect_carving_pop=Unknown
% @importance 0.80

0.72::acc(s23, negative_aspect_carving_pop).

0.43::true_val(negative_aspect_carving_pop, carving_pop_needs_work); 0.57::true_val(negative_aspect_carving_pop, unk_negative_aspect_carving_pop).

measured(s23, negative_aspect_carving_pop, carving_pop_needs_work).

all_consistent(negative_aspect_carving_pop) :- consistent(s23, negative_aspect_carving_pop).

evidence(all_consistent(negative_aspect_carving_pop)).
query(true_val(negative_aspect_carving_pop, carving_pop_needs_work)).
query(true_val(negative_aspect_carving_pop, unk_negative_aspect_carving_pop)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values all_rounder_beast=All_around_beast_destroys_park unk_positive_aspect=Unknown
% @importance 0.80

0.72::acc(s23, positive_aspect).

0.43::true_val(positive_aspect, all_rounder_beast); 0.57::true_val(positive_aspect, unk_positive_aspect).

measured(s23, positive_aspect, all_rounder_beast).

all_consistent(positive_aspect) :- consistent(s23, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, all_rounder_beast)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr transworld_2018_tester_comments
% @type categorical
% @canonical false
% @original_name Transworld Good Wood 2018 tester comments
% @values balanced_easy_going_pressing=Balanced_easy_going_exceptional_pressing unk_transworld_2018_tester_comments=Unknown
% @importance 0.85

0.88::acc(s40, transworld_2018_tester_comments).

0.79::true_val(transworld_2018_tester_comments, balanced_easy_going_pressing); 0.21::true_val(transworld_2018_tester_comments, unk_transworld_2018_tester_comments).

measured(s40, transworld_2018_tester_comments, balanced_easy_going_pressing).

all_consistent(transworld_2018_tester_comments) :- consistent(s40, transworld_2018_tester_comments).

evidence(all_consistent(transworld_2018_tester_comments)).
query(true_val(transworld_2018_tester_comments, balanced_easy_going_pressing)).
query(true_val(transworld_2018_tester_comments, unk_transworld_2018_tester_comments)).

% @attr negative_aspect_stability
% @type categorical
% @canonical false
% @original_name negative_aspect (stability)
% @values lacked_stability=Some_testers_felt_lacked_stability unk_negative_aspect_stability=Unknown
% @importance 0.85

0.88::acc(s40, negative_aspect_stability).

0.79::true_val(negative_aspect_stability, lacked_stability); 0.21::true_val(negative_aspect_stability, unk_negative_aspect_stability).

measured(s40, negative_aspect_stability, lacked_stability).

all_consistent(negative_aspect_stability) :- consistent(s40, negative_aspect_stability).

evidence(all_consistent(negative_aspect_stability)).
query(true_val(negative_aspect_stability, lacked_stability)).
query(true_val(negative_aspect_stability, unk_negative_aspect_stability)).

% @attr transworld_tester_profile
% @type categorical
% @canonical false
% @original_name Transworld tester profile
% @values triple_kinks_not_80ft=Comfortable_triple_kinks_not_80_footers unk_transworld_tester_profile=Unknown
% @importance 0.85

0.85::acc(s40, transworld_tester_profile).

0.79::true_val(transworld_tester_profile, triple_kinks_not_80ft); 0.21::true_val(transworld_tester_profile, unk_transworld_tester_profile).

measured(s40, transworld_tester_profile, triple_kinks_not_80ft).

all_consistent(transworld_tester_profile) :- consistent(s40, transworld_tester_profile).

evidence(all_consistent(transworld_tester_profile)).
query(true_val(transworld_tester_profile, triple_kinks_not_80ft)).
query(true_val(transworld_tester_profile, unk_transworld_tester_profile)).

% @attr tactics_review
% @type categorical
% @canonical false
% @original_name Tactics review
% @values budget_park_top_construction=Budget_friendly_park_board_top_construction unk_tactics_review=Unknown
% @importance 0.80

0.80::acc(s38, tactics_review).

0.68::true_val(tactics_review, budget_park_top_construction); 0.32::true_val(tactics_review, unk_tactics_review).

measured(s38, tactics_review, budget_park_top_construction).

all_consistent(tactics_review) :- consistent(s38, tactics_review).

evidence(all_consistent(tactics_review)).
query(true_val(tactics_review, budget_park_top_construction)).
query(true_val(tactics_review, unk_tactics_review)).

% @attr academy_youtube_review
% @type categorical
% @canonical false
% @original_name Academy brand YouTube review
% @values best_park_jib_board=Best_park_jib_board_in_the_world unk_academy_youtube_review=Unknown
% @importance 0.40

0.45::acc(s41, academy_youtube_review).

0.32::true_val(academy_youtube_review, best_park_jib_board); 0.68::true_val(academy_youtube_review, unk_academy_youtube_review).

measured(s41, academy_youtube_review, best_park_jib_board).

all_consistent(academy_youtube_review) :- consistent(s41, academy_youtube_review).

evidence(all_consistent(academy_youtube_review)).
query(true_val(academy_youtube_review, best_park_jib_board)).
query(true_val(academy_youtube_review, unk_academy_youtube_review)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values flex_5_jib_priority=Flex_5_intermediate_advanced_jib_priority unk_reviewer_opinion_whitelines=Unknown
% @importance 0.40

0.65::acc(s7, reviewer_opinion_whitelines).

0.60::true_val(reviewer_opinion_whitelines, flex_5_jib_priority); 0.40::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

measured(s7, reviewer_opinion_whitelines, flex_5_jib_priority).

all_consistent(reviewer_opinion_whitelines) :- consistent(s7, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, flex_5_jib_priority)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

% @attr user_review_forum
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values presses_like_no_other=Presses_like_no_other_board unk_user_review_forum=Unknown
% @importance 0.60

0.45::acc(s42, user_review_forum).

0.25::true_val(user_review_forum, presses_like_no_other); 0.75::true_val(user_review_forum, unk_user_review_forum).

measured(s42, user_review_forum, presses_like_no_other).

all_consistent(user_review_forum) :- consistent(s42, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, presses_like_no_other)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr board_paradise_editorial
% @type categorical
% @canonical false
% @original_name Board Paradise editorial
% @values park_rats_slashers_rejoice=Park_rats_slashers_rejoice_price_performance unk_board_paradise_editorial=Unknown
% @importance 0.65

0.72::acc(s5, board_paradise_editorial).

0.63::true_val(board_paradise_editorial, park_rats_slashers_rejoice); 0.37::true_val(board_paradise_editorial, unk_board_paradise_editorial).

measured(s5, board_paradise_editorial, park_rats_slashers_rejoice).

all_consistent(board_paradise_editorial) :-
    (indep(s5), consistent(s5, board_paradise_editorial) ; \+indep(s5)).

evidence(all_consistent(board_paradise_editorial)).
query(true_val(board_paradise_editorial, park_rats_slashers_rejoice)).
query(true_val(board_paradise_editorial, unk_board_paradise_editorial)).

% @attr ride_forgiving
% @type categorical
% @canonical false
% @original_name ride characteristics: forgiving
% @values super_forgiving=Super_forgiving_and_easy_to_shred unk_ride_forgiving=Unknown
% @importance 1.0

0.88::acc(s1, ride_forgiving).

0.92::true_val(ride_forgiving, super_forgiving); 0.08::true_val(ride_forgiving, unk_ride_forgiving).

measured(s1, ride_forgiving, super_forgiving).

all_consistent(ride_forgiving) :- consistent(s1, ride_forgiving).

evidence(all_consistent(ride_forgiving)).
query(true_val(ride_forgiving, super_forgiving)).
query(true_val(ride_forgiving, unk_ride_forgiving)).

% @attr ride_no_wash_out
% @type categorical
% @canonical false
% @original_name ride characteristics: no wash out
% @values no_wash_out=Will_never_wash_out_like_reverse_camber unk_ride_no_wash_out=Unknown
% @importance 1.0

0.85::acc(s1, ride_no_wash_out).

0.92::true_val(ride_no_wash_out, no_wash_out); 0.08::true_val(ride_no_wash_out, unk_ride_no_wash_out).

measured(s1, ride_no_wash_out, no_wash_out).

all_consistent(ride_no_wash_out) :- consistent(s1, ride_no_wash_out).

evidence(all_consistent(ride_no_wash_out)).
query(true_val(ride_no_wash_out, no_wash_out)).
query(true_val(ride_no_wash_out, unk_ride_no_wash_out)).

% @attr edge_hold
% @type categorical
% @canonical false
% @original_name edge_hold
% @values edge_hold_not_catchy=Edge_hold_without_being_catchy unk_edge_hold=Unknown
% @importance 0.80

0.80::acc(s19, edge_hold).

0.69::true_val(edge_hold, edge_hold_not_catchy); 0.31::true_val(edge_hold, unk_edge_hold).

measured(s19, edge_hold, edge_hold_not_catchy).

all_consistent(edge_hold) :-
    (indep(s19), consistent(s19, edge_hold) ; \+indep(s19)).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, edge_hold_not_catchy)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr ride_playfulness
% @type categorical
% @canonical false
% @original_name ride characteristics: playfulness
% @values playful_not_too_loose=Playfulness_without_being_too_loose unk_ride_playfulness=Unknown
% @importance 0.80

0.80::acc(s19, ride_playfulness).

0.69::true_val(ride_playfulness, playful_not_too_loose); 0.31::true_val(ride_playfulness, unk_ride_playfulness).

measured(s19, ride_playfulness, playful_not_too_loose).

all_consistent(ride_playfulness) :-
    (indep(s19), consistent(s19, ride_playfulness) ; \+indep(s19)).

evidence(all_consistent(ride_playfulness)).
query(true_val(ride_playfulness, playful_not_too_loose)).
query(true_val(ride_playfulness, unk_ride_playfulness)).

% @attr switch_riding
% @type categorical
% @canonical false
% @original_name switch_riding
% @values easy_switch=True_twin_enables_easy_switch unk_switch_riding=Unknown
% @importance 0.80

0.90::acc(s16, switch_riding).

0.88::true_val(switch_riding, easy_switch); 0.12::true_val(switch_riding, unk_switch_riding).

measured(s16, switch_riding, easy_switch).

all_consistent(switch_riding) :- consistent(s16, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, easy_switch)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr chatter_performance
% @type categorical
% @canonical false
% @original_name chatter_performance
% @values chatter_free=Carves_chatter_free_rubber_dampening unk_chatter_performance=Unknown
% @importance 0.75

0.75::acc(s34, chatter_performance).

0.61::true_val(chatter_performance, chatter_free); 0.39::true_val(chatter_performance, unk_chatter_performance).

measured(s34, chatter_performance, chatter_free).

all_consistent(chatter_performance) :-
    (indep(s34), consistent(s34, chatter_performance) ; \+indep(s34)).

evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, chatter_free)).
query(true_val(chatter_performance, unk_chatter_performance)).

% @attr terrain_suitability_park
% @type categorical
% @canonical false
% @original_name terrain_suitability (park primary)
% @values park_primary=Built_for_park_boxes_rails_tubes unk_terrain_suitability_park=Unknown
% @importance 0.80

0.80::acc(s19, terrain_suitability_park).

0.69::true_val(terrain_suitability_park, park_primary); 0.31::true_val(terrain_suitability_park, unk_terrain_suitability_park).

measured(s19, terrain_suitability_park, park_primary).

all_consistent(terrain_suitability_park) :-
    (indep(s19), consistent(s19, terrain_suitability_park) ; \+indep(s19)).

evidence(all_consistent(terrain_suitability_park)).
query(true_val(terrain_suitability_park, park_primary)).
query(true_val(terrain_suitability_park, unk_terrain_suitability_park)).

% @attr terrain_suitability_all_mountain
% @type categorical
% @canonical false
% @original_name terrain_suitability (all mountain)
% @values all_mountain_capable=Can_haul_entire_mountain_hit_any_jump unk_terrain_suitability_all_mountain=Unknown
% @importance 0.80

0.80::acc(s19, terrain_suitability_all_mountain).

0.69::true_val(terrain_suitability_all_mountain, all_mountain_capable); 0.31::true_val(terrain_suitability_all_mountain, unk_terrain_suitability_all_mountain).

measured(s19, terrain_suitability_all_mountain, all_mountain_capable).

all_consistent(terrain_suitability_all_mountain) :-
    (indep(s19), consistent(s19, terrain_suitability_all_mountain) ; \+indep(s19)).

evidence(all_consistent(terrain_suitability_all_mountain)).
query(true_val(terrain_suitability_all_mountain, all_mountain_capable)).
query(true_val(terrain_suitability_all_mountain, unk_terrain_suitability_all_mountain)).

% @attr rider_level
% @type categorical
% @canonical false
% @original_name rider_level
% @values beginner_to_advanced=Beginner_to_advanced_jibbers unk_rider_level=Unknown
% @importance 0.75

0.75::acc(s34, rider_level).

0.61::true_val(rider_level, beginner_to_advanced); 0.39::true_val(rider_level, unk_rider_level).

measured(s34, rider_level, beginner_to_advanced).

all_consistent(rider_level) :-
    (indep(s34), consistent(s34, rider_level) ; \+indep(s34)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, beginner_to_advanced)).
query(true_val(rider_level, unk_rider_level)).

% @attr float_in_powder
% @type categorical
% @canonical false
% @original_name float in powder
% @values superior_float_deep=Low_profile_tip_tail_superior_float unk_float_in_powder=Unknown
% @importance 0.85

0.78::acc(s18, float_in_powder).

0.71::true_val(float_in_powder, superior_float_deep); 0.29::true_val(float_in_powder, unk_float_in_powder).

measured(s18, float_in_powder, superior_float_deep).

all_consistent(float_in_powder) :-
    (indep(s18), consistent(s18, float_in_powder) ; \+indep(s18)).

evidence(all_consistent(float_in_powder)).
query(true_val(float_in_powder, superior_float_deep)).
query(true_val(float_in_powder, unk_float_in_powder)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values capita_doa=CAPiTA_DOA_Defenders_of_Awesome unk_comparable_board_cross_brand=Unknown
% @importance 0.65

0.65::acc(s39, comparable_board_cross_brand).

0.51::true_val(comparable_board_cross_brand, capita_doa); 0.49::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s39, comparable_board_cross_brand, capita_doa).

all_consistent(comparable_board_cross_brand) :- consistent(s39, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, capita_doa)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_burton_free_thinker
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Burton Free Thinker)
% @values burton_free_thinker=Burton_Free_Thinker_stiffer_full_camber unk_comparable_board_burton_free_thinker=Unknown
% @importance 0.60

0.62::acc(s43, comparable_board_burton_free_thinker).

0.49::true_val(comparable_board_burton_free_thinker, burton_free_thinker); 0.51::true_val(comparable_board_burton_free_thinker, unk_comparable_board_burton_free_thinker).

measured(s43, comparable_board_burton_free_thinker, burton_free_thinker).

all_consistent(comparable_board_burton_free_thinker) :- consistent(s43, comparable_board_burton_free_thinker).

evidence(all_consistent(comparable_board_burton_free_thinker)).
query(true_val(comparable_board_burton_free_thinker, burton_free_thinker)).
query(true_val(comparable_board_burton_free_thinker, unk_comparable_board_burton_free_thinker)).

% @attr comparable_board_burton_good_company
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Burton Good Company)
% @values burton_good_company=Burton_Good_Company_entry_level_park unk_comparable_board_burton_good_company=Unknown
% @importance 0.50

0.55::acc(s44, comparable_board_burton_good_company).

0.39::true_val(comparable_board_burton_good_company, burton_good_company); 0.61::true_val(comparable_board_burton_good_company, unk_comparable_board_burton_good_company).

measured(s44, comparable_board_burton_good_company, burton_good_company).

all_consistent(comparable_board_burton_good_company) :- consistent(s44, comparable_board_burton_good_company).

evidence(all_consistent(comparable_board_burton_good_company)).
query(true_val(comparable_board_burton_good_company, burton_good_company)).
query(true_val(comparable_board_burton_good_company, unk_comparable_board_burton_good_company)).

% @attr comparable_board_bataleon_disaster
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Bataleon Disaster+)
% @values bataleon_disaster_plus=Bataleon_Disaster_plus_best_jib_2026 unk_comparable_board_bataleon_disaster=Unknown
% @importance 0.50

0.62::acc(s45, comparable_board_bataleon_disaster).

0.49::true_val(comparable_board_bataleon_disaster, bataleon_disaster_plus); 0.51::true_val(comparable_board_bataleon_disaster, unk_comparable_board_bataleon_disaster).

measured(s45, comparable_board_bataleon_disaster, bataleon_disaster_plus).

all_consistent(comparable_board_bataleon_disaster) :- consistent(s45, comparable_board_bataleon_disaster).

evidence(all_consistent(comparable_board_bataleon_disaster)).
query(true_val(comparable_board_bataleon_disaster, bataleon_disaster_plus)).
query(true_val(comparable_board_bataleon_disaster, unk_comparable_board_bataleon_disaster)).

% @attr value_proposition
% @type categorical
% @canonical false
% @original_name value proposition
% @values ns_quality_lower_price=NS_factory_quality_at_lower_price unk_value_proposition=Unknown
% @importance 0.73

0.80::acc(s38, value_proposition).
0.72::acc(s5, value_proposition).

0.95::true_val(value_proposition, ns_quality_lower_price); 0.05::true_val(value_proposition, unk_value_proposition).

measured(s38, value_proposition, ns_quality_lower_price).
measured(s5, value_proposition, ns_quality_lower_price).

all_consistent(value_proposition) :-
    consistent(s38, value_proposition),
    (indep(s5), consistent(s5, value_proposition) ; \+indep(s5)).

evidence(all_consistent(value_proposition)).
query(true_val(value_proposition, ns_quality_lower_price)).
query(true_val(value_proposition, unk_value_proposition)).

% @attr model_first_available_year
% @type categorical
% @canonical false
% @original_name model_first_available_year
% @values y2010_11=2010_2011 unk_model_first_available_year=Unknown
% @importance 0.40

0.65::acc(s7, model_first_available_year).

0.60::true_val(model_first_available_year, y2010_11); 0.40::true_val(model_first_available_year, unk_model_first_available_year).

measured(s7, model_first_available_year, y2010_11).

all_consistent(model_first_available_year) :- consistent(s7, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2010_11)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr current_model_release_date
% @type categorical
% @canonical false
% @original_name current model release date
% @values y2024_shipping_mid_2023=2024_model_year_shipping_mid_2023 unk_current_model_release_date=Unknown
% @importance 1.0

0.90::acc(s1, current_model_release_date).

0.92::true_val(current_model_release_date, y2024_shipping_mid_2023); 0.08::true_val(current_model_release_date, unk_current_model_release_date).

measured(s1, current_model_release_date, y2024_shipping_mid_2023).

all_consistent(current_model_release_date) :- consistent(s1, current_model_release_date).

evidence(all_consistent(current_model_release_date)).
query(true_val(current_model_release_date, y2024_shipping_mid_2023)).
query(true_val(current_model_release_date, unk_current_model_release_date)).

% @attr successor
% @type categorical
% @canonical false
% @original_name successor
% @values y2025_2026_at_588_95=2025_2026_models_at_588_95 unk_successor=Unknown
% @importance 0.85

0.78::acc(s27, successor).

0.64::true_val(successor, y2025_2026_at_588_95); 0.36::true_val(successor, unk_successor).

measured(s27, successor, y2025_2026_at_588_95).

all_consistent(successor) :-
    (indep(s27), consistent(s27, successor) ; \+indep(s27)).

evidence(all_consistent(successor)).
query(true_val(successor, y2025_2026_at_588_95)).
query(true_val(successor, unk_successor)).

% @attr sustainability_certification
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values none_stated=None_explicitly_stated unk_sustainability_certification=Unknown
% @importance 0.50

0.50::true_val(sustainability_certification, none_stated); 0.50::true_val(sustainability_certification, unk_sustainability_certification).

0.40::acc(s1, sustainability_certification).

measured(s1, sustainability_certification, none_stated).

all_consistent(sustainability_certification) :- consistent(s1, sustainability_certification).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, none_stated)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr skill_level_recommendation
% @type categorical
% @canonical false
% @original_name skill_level_recommendation
% @values new_to_advanced_jibber=New_to_park_or_highly_advanced_jibber unk_skill_level_recommendation=Unknown
% @importance 0.75

0.75::acc(s34, skill_level_recommendation).

0.61::true_val(skill_level_recommendation, new_to_advanced_jibber); 0.39::true_val(skill_level_recommendation, unk_skill_level_recommendation).

measured(s34, skill_level_recommendation, new_to_advanced_jibber).

all_consistent(skill_level_recommendation) :-
    (indep(s34), consistent(s34, skill_level_recommendation) ; \+indep(s34)).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, new_to_advanced_jibber)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

% @attr camber_description
% @type categorical
% @canonical false
% @original_name camber_description
% @values zero_deg_flat_center=Zero_degree_flat_center unk_camber_description=Unknown
% @importance 0.85

0.75::acc(s15, camber_description).

0.67::true_val(camber_description, zero_deg_flat_center); 0.33::true_val(camber_description, unk_camber_description).

measured(s15, camber_description, zero_deg_flat_center).

all_consistent(camber_description) :-
    (indep(s15), consistent(s15, camber_description) ; \+indep(s15)).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, zero_deg_flat_center)).
query(true_val(camber_description, unk_camber_description)).