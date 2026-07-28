0.15::indep(s3).
0.15::indep(s4).
0.20::indep(s5).
0.12::indep(s27).
0.15::indep(s31).
0.15::indep(s32).
0.30::indep(s9).
0.15::indep(s43).
0.25::indep(s36).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values academy_snowboard_co=Academy_Snowboard_Co unk_brand=Unknown
% @importance 0.85

0.95::acc(s1, brand).
0.93::acc(s2, brand).
0.97::true_val(brand, academy_snowboard_co); 0.03::true_val(brand, unk_brand).
measured(s1, brand, academy_snowboard_co).
measured(s2, brand, academy_snowboard_co).
all_consistent(brand) :- consistent(s1, brand), consistent(s2, brand).
evidence(all_consistent(brand)).
query(true_val(brand, academy_snowboard_co)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values propacamba=Propacamba unk_model_name=Unknown
% @importance 0.95

0.95::acc(s1, model_name).
0.80::acc(s3, model_name).
0.97::true_val(model_name, propacamba); 0.03::true_val(model_name, unk_model_name).
measured(s1, model_name, propacamba).
measured(s3, model_name, propacamba).
all_consistent(model_name) :- consistent(s1, model_name), (indep(s3), consistent(s3, model_name) ; \+indep(s3)).
evidence(all_consistent(model_name)).
query(true_val(model_name, propacamba)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2024=2024 unk_model_year=Unknown
% @importance 0.925

0.90::acc(s3, model_year).
0.90::acc(s4, model_year).
0.95::true_val(model_year, y2024); 0.05::true_val(model_year, unk_model_year).
measured(s3, model_year, y2024).
measured(s4, model_year, y2024).
all_consistent(model_year) :- consistent(s3, model_year), consistent(s4, model_year).
evidence(all_consistent(model_year)).
query(true_val(model_year, y2024)).
query(true_val(model_year, unk_model_year)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.95

0.95::acc(s1, product_type).
0.85::acc(s3, product_type).
0.97::true_val(product_type, snowboard); 0.03::true_val(product_type, unk_product_type).
measured(s1, product_type, snowboard).
measured(s3, product_type, snowboard).
all_consistent(product_type) :- consistent(s1, product_type), (indep(s3), consistent(s3, product_type) ; \+indep(s3)).
evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr company_slogan
% @type categorical
% @canonical false
% @original_name Company slogan
% @values good_people_great_snowboards=Good_People_Great_Snowboards unk_company_slogan=Unknown
% @importance 0.30

0.88::acc(s2, company_slogan).
0.65::acc(s5, company_slogan).
0.93::true_val(company_slogan, good_people_great_snowboards); 0.07::true_val(company_slogan, unk_company_slogan).
measured(s2, company_slogan, good_people_great_snowboards).
measured(s5, company_slogan, good_people_great_snowboards).
all_consistent(company_slogan) :- consistent(s2, company_slogan), (indep(s5), consistent(s5, company_slogan) ; \+indep(s5)).
evidence(all_consistent(company_slogan)).
query(true_val(company_slogan, good_people_great_snowboards)).
query(true_val(company_slogan, unk_company_slogan)).

% @attr company_founded
% @type categorical
% @canonical false
% @original_name Company founded
% @values fall_2002_jb_matt=Fall_2002_by_JB_and_Matt_Peterson unk_company_founded=Unknown
% @importance 0.50

0.92::acc(s6, company_founded).
0.88::acc(s7, company_founded).
0.96::true_val(company_founded, fall_2002_jb_matt); 0.04::true_val(company_founded, unk_company_founded).
measured(s6, company_founded, fall_2002_jb_matt).
measured(s7, company_founded, fall_2002_jb_matt).
all_consistent(company_founded) :- consistent(s6, company_founded), consistent(s7, company_founded).
evidence(all_consistent(company_founded)).
query(true_val(company_founded, fall_2002_jb_matt)).
query(true_val(company_founded, unk_company_founded)).

% @attr founder_president
% @type categorical
% @canonical false
% @original_name Founder & President
% @values jeff_baughn=Jeff_Baughn unk_founder_president=Unknown
% @importance 0.35

0.85::acc(s8, founder_president).
0.82::true_val(founder_president, jeff_baughn); 0.18::true_val(founder_president, unk_founder_president).
measured(s8, founder_president, jeff_baughn).
all_consistent(founder_president) :- consistent(s8, founder_president).
evidence(all_consistent(founder_president)).
query(true_val(founder_president, jeff_baughn)).
query(true_val(founder_president, unk_founder_president)).

% @attr co_owner
% @type categorical
% @canonical false
% @original_name Co-owner
% @values chad_otterstrom=Chad_Otterstrom unk_co_owner=Unknown
% @importance 0.425

0.90::acc(s6, co_owner).
0.78::acc(s9, co_owner).
0.95::true_val(co_owner, chad_otterstrom); 0.05::true_val(co_owner, unk_co_owner).
measured(s6, co_owner, chad_otterstrom).
measured(s9, co_owner, chad_otterstrom).
all_consistent(co_owner) :- consistent(s6, co_owner), (indep(s9), consistent(s9, co_owner) ; \+indep(s9)).
evidence(all_consistent(co_owner)).
query(true_val(co_owner, chad_otterstrom)).
query(true_val(co_owner, unk_co_owner)).

% @attr company_headquarters
% @type categorical
% @canonical false
% @original_name Company headquarters
% @values auburn_ca=Auburn_California unk_company_headquarters=Unknown
% @importance 0.20

0.92::acc(s10, company_headquarters).
0.72::acc(s11, company_headquarters).
0.95::true_val(company_headquarters, auburn_ca); 0.05::true_val(company_headquarters, unk_company_headquarters).
measured(s10, company_headquarters, auburn_ca).
measured(s11, company_headquarters, auburn_ca).
all_consistent(company_headquarters) :- consistent(s10, company_headquarters), consistent(s11, company_headquarters).
evidence(all_consistent(company_headquarters)).
query(true_val(company_headquarters, auburn_ca)).
query(true_val(company_headquarters, unk_company_headquarters)).

% @attr company_origin
% @type categorical
% @canonical false
% @original_name Company origin
% @values tahoe_california=Tahoe_California unk_company_origin=Unknown
% @importance 0.30

0.78::acc(s12, company_origin).
0.80::acc(s13, company_origin).
0.93::true_val(company_origin, tahoe_california); 0.07::true_val(company_origin, unk_company_origin).
measured(s12, company_origin, tahoe_california).
measured(s13, company_origin, tahoe_california).
all_consistent(company_origin) :- consistent(s12, company_origin), consistent(s13, company_origin).
evidence(all_consistent(company_origin)).
query(true_val(company_origin, tahoe_california)).
query(true_val(company_origin, unk_company_origin)).

% @attr company_description
% @type categorical
% @canonical false
% @original_name Company description
% @values rider_owned_no_gimmick=Rider_owned_operated_no_gimmick unk_company_description=Unknown
% @importance 0.70

0.82::acc(s2, company_description).
0.79::true_val(company_description, rider_owned_no_gimmick); 0.21::true_val(company_description, unk_company_description).
measured(s2, company_description, rider_owned_no_gimmick).
all_consistent(company_description) :- consistent(s2, company_description).
evidence(all_consistent(company_description)).
query(true_val(company_description, rider_owned_no_gimmick)).
query(true_val(company_description, unk_company_description)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values never_summer_denver=Never_Summer_Industries_Denver_CO unk_manufacturer=Unknown
% @importance 0.70

0.90::acc(s2, manufacturer).
0.88::acc(s14, manufacturer).
0.96::true_val(manufacturer, never_summer_denver); 0.04::true_val(manufacturer, unk_manufacturer).
measured(s2, manufacturer, never_summer_denver).
measured(s14, manufacturer, never_summer_denver).
all_consistent(manufacturer) :- consistent(s2, manufacturer), consistent(s14, manufacturer).
evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, never_summer_denver)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr never_summer_partnership_began
% @type categorical
% @canonical false
% @original_name Never Summer partnership began
% @values season_2018_2019=2018_2019_season unk_ns_partnership=Unknown
% @importance 0.55

0.82::acc(s15, never_summer_partnership_began).
0.78::acc(s16, never_summer_partnership_began).
0.91::true_val(never_summer_partnership_began, season_2018_2019); 0.09::true_val(never_summer_partnership_began, unk_ns_partnership).
measured(s15, never_summer_partnership_began, season_2018_2019).
measured(s16, never_summer_partnership_began, season_2018_2019).
all_consistent(never_summer_partnership_began) :- consistent(s15, never_summer_partnership_began), consistent(s16, never_summer_partnership_began).
evidence(all_consistent(never_summer_partnership_began)).
query(true_val(never_summer_partnership_began, season_2018_2019)).
query(true_val(never_summer_partnership_began, unk_ns_partnership)).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values denver_co_usa=Denver_Colorado_USA unk_manufacturing_location=Unknown
% @importance 0.60

0.90::acc(s14, manufacturing_location).
0.88::acc(s17, manufacturing_location).
0.96::true_val(manufacturing_location, denver_co_usa); 0.04::true_val(manufacturing_location, unk_manufacturing_location).
measured(s14, manufacturing_location, denver_co_usa).
measured(s17, manufacturing_location, denver_co_usa).
all_consistent(manufacturing_location) :- consistent(s14, manufacturing_location), consistent(s17, manufacturing_location).
evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, denver_co_usa)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

% @attr manufacturing_location_usa
% @type categorical
% @canonical false
% @original_name manufacturing_location (Made in USA)
% @values made_in_usa=Yes_Made_in_USA unk_mfg_usa=Unknown
% @importance 0.60

0.88::acc(s18, manufacturing_location_usa).
0.85::acc(s19, manufacturing_location_usa).
0.95::true_val(manufacturing_location_usa, made_in_usa); 0.05::true_val(manufacturing_location_usa, unk_mfg_usa).
measured(s18, manufacturing_location_usa, made_in_usa).
measured(s19, manufacturing_location_usa, made_in_usa).
all_consistent(manufacturing_location_usa) :- consistent(s18, manufacturing_location_usa), consistent(s19, manufacturing_location_usa).
evidence(all_consistent(manufacturing_location_usa)).
query(true_val(manufacturing_location_usa, made_in_usa)).
query(true_val(manufacturing_location_usa, unk_mfg_usa)).

% @attr never_summer_founded
% @type categorical
% @canonical false
% @original_name Never Summer founded
% @values ns_1991_canaday=1991_by_Tim_and_Tracey_Canaday unk_ns_founded=Unknown
% @importance 0.50

0.88::acc(s17, never_summer_founded).
0.85::acc(s20, never_summer_founded).
0.94::true_val(never_summer_founded, ns_1991_canaday); 0.06::true_val(never_summer_founded, unk_ns_founded).
measured(s17, never_summer_founded, ns_1991_canaday).
measured(s20, never_summer_founded, ns_1991_canaday).
all_consistent(never_summer_founded) :- consistent(s17, never_summer_founded), consistent(s20, never_summer_founded).
evidence(all_consistent(never_summer_founded)).
query(true_val(never_summer_founded, ns_1991_canaday)).
query(true_val(never_summer_founded, unk_ns_founded)).

% @attr never_summer_reputation
% @type categorical
% @canonical false
% @original_name Never Summer reputation
% @values last_independent_us_factory=Last_independent_US_factory_quality_durability unk_ns_reputation=Unknown
% @importance 0.50

0.85::acc(s17, never_summer_reputation).
0.82::acc(s21, never_summer_reputation).
0.93::true_val(never_summer_reputation, last_independent_us_factory); 0.07::true_val(never_summer_reputation, unk_ns_reputation).
measured(s17, never_summer_reputation, last_independent_us_factory).
measured(s21, never_summer_reputation, last_independent_us_factory).
all_consistent(never_summer_reputation) :- consistent(s17, never_summer_reputation), consistent(s21, never_summer_reputation).
evidence(all_consistent(never_summer_reputation)).
query(true_val(never_summer_reputation, last_independent_us_factory)).
query(true_val(never_summer_reputation, unk_ns_reputation)).

% @attr never_summer_also_manufactures_for
% @type categorical
% @canonical false
% @original_name Never Summer also manufactures for
% @values sims_high_society_others=Sims_High_Society_others unk_ns_clients=Unknown
% @importance 0.50

0.75::acc(s22, never_summer_also_manufactures_for).
0.72::true_val(never_summer_also_manufactures_for, sims_high_society_others); 0.28::true_val(never_summer_also_manufactures_for, unk_ns_clients).
measured(s22, never_summer_also_manufactures_for, sims_high_society_others).
all_consistent(never_summer_also_manufactures_for) :- consistent(s22, never_summer_also_manufactures_for).
evidence(all_consistent(never_summer_also_manufactures_for)).
query(true_val(never_summer_also_manufactures_for, sims_high_society_others)).
query(true_val(never_summer_also_manufactures_for, unk_ns_clients)).

% @attr awards_claimed
% @type categorical
% @canonical false
% @original_name Awards claimed (brand-wide)
% @values nine_good_wood_top5_outside=9x_TW_Good_Wood_Top5_Outside_2023 unk_awards_claimed=Unknown
% @importance 0.40

0.72::acc(s23, awards_claimed).
0.70::true_val(awards_claimed, nine_good_wood_top5_outside); 0.30::true_val(awards_claimed, unk_awards_claimed).
measured(s23, awards_claimed, nine_good_wood_top5_outside).
all_consistent(awards_claimed) :- consistent(s23, awards_claimed).
evidence(all_consistent(awards_claimed)).
query(true_val(awards_claimed, nine_good_wood_top5_outside)).
query(true_val(awards_claimed, unk_awards_claimed)).

% @attr award_good_wood_2019
% @type categorical
% @canonical false
% @original_name Award (Good Wood 2019)
% @values tw_good_wood_2019_park=TransWorld_Good_Wood_2019_Mens_Park_Winner unk_award_2019=Unknown
% @importance 0.90

0.90::acc(s24, award_good_wood_2019).
0.82::acc(s25, award_good_wood_2019).
0.96::true_val(award_good_wood_2019, tw_good_wood_2019_park); 0.04::true_val(award_good_wood_2019, unk_award_2019).
measured(s24, award_good_wood_2019, tw_good_wood_2019_park).
measured(s25, award_good_wood_2019, tw_good_wood_2019_park).
all_consistent(award_good_wood_2019) :- consistent(s24, award_good_wood_2019), consistent(s25, award_good_wood_2019).
evidence(all_consistent(award_good_wood_2019)).
query(true_val(award_good_wood_2019, tw_good_wood_2019_park)).
query(true_val(award_good_wood_2019, unk_award_2019)).

% @attr award_good_wood_2020
% @type categorical
% @canonical false
% @original_name Award (Good Wood 2020)
% @values tw_good_wood_2020_park=TransWorld_Good_Wood_2020_Mens_Park unk_award_2020=Unknown
% @importance 0.55

0.90::acc(s26, award_good_wood_2020).
0.72::acc(s27, award_good_wood_2020).
0.96::true_val(award_good_wood_2020, tw_good_wood_2020_park); 0.04::true_val(award_good_wood_2020, unk_award_2020).
measured(s26, award_good_wood_2020, tw_good_wood_2020_park).
measured(s27, award_good_wood_2020, tw_good_wood_2020_park).
all_consistent(award_good_wood_2020) :- consistent(s26, award_good_wood_2020), (indep(s27), consistent(s27, award_good_wood_2020) ; \+indep(s27)).
evidence(all_consistent(award_good_wood_2020)).
query(true_val(award_good_wood_2020, tw_good_wood_2020_park)).
query(true_val(award_good_wood_2020, unk_award_2020)).

% @attr warranty_period_years
% @type categorical
% @canonical true
% @original_name warranty_period_years
% @values two_years=2_years three_years=3_years
% @importance 0.80

0.88::acc(s4, warranty_period_years).
0.85::acc(s28, warranty_period_years).
0.72::acc(s25, warranty_period_years).
0.65::true_val(warranty_period_years, two_years); 0.35::true_val(warranty_period_years, three_years).
measured(s4, warranty_period_years, two_years).
measured(s28, warranty_period_years, two_years).
measured(s25, warranty_period_years, three_years).
all_consistent(warranty_period_years) :- (indep(s4), consistent(s4, warranty_period_years) ; \+indep(s4)), consistent(s28, warranty_period_years), consistent(s25, warranty_period_years).
evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, two_years)).
query(true_val(warranty_period_years, three_years)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values park=Park unk_board_category=Unknown
% @importance 0.925

0.88::acc(s3, board_category).
0.88::acc(s4, board_category).
0.95::true_val(board_category, park); 0.05::true_val(board_category, unk_board_category).
measured(s3, board_category, park).
measured(s4, board_category, park).
all_consistent(board_category) :- consistent(s3, board_category), consistent(s4, board_category).
evidence(all_consistent(board_category)).
query(true_val(board_category, park)).
query(true_val(board_category, unk_board_category)).

% @attr board_category_detailed
% @type categorical
% @canonical false
% @original_name board_category (detailed)
% @values park_street_jib=Park_Street_Jib_focused unk_board_category_detailed=Unknown
% @importance 0.75

0.80::acc(s15, board_category_detailed).
0.82::acc(s29, board_category_detailed).
0.93::true_val(board_category_detailed, park_street_jib); 0.07::true_val(board_category_detailed, unk_board_category_detailed).
measured(s15, board_category_detailed, park_street_jib).
measured(s29, board_category_detailed, park_street_jib).
all_consistent(board_category_detailed) :- consistent(s15, board_category_detailed), consistent(s29, board_category_detailed).
evidence(all_consistent(board_category_detailed)).
query(true_val(board_category_detailed, park_street_jib)).
query(true_val(board_category_detailed, unk_board_category_detailed)).

% @attr terrain_suitability_park_description
% @type categorical
% @canonical false
% @original_name terrain_suitability (Park description)
% @values butter_jump_jib_slide=Terrain_park_butter_jump_jib_slide unk_terrain_park_desc=Unknown
% @importance 0.95

0.85::acc(s4, terrain_suitability_park_description).
0.81::true_val(terrain_suitability_park_description, butter_jump_jib_slide); 0.19::true_val(terrain_suitability_park_description, unk_terrain_park_desc).
measured(s4, terrain_suitability_park_description, butter_jump_jib_slide).
all_consistent(terrain_suitability_park_description) :- (indep(s4), consistent(s4, terrain_suitability_park_description) ; \+indep(s4)).
evidence(all_consistent(terrain_suitability_park_description)).
query(true_val(terrain_suitability_park_description, butter_jump_jib_slide)).
query(true_val(terrain_suitability_park_description, unk_terrain_park_desc)).

% @attr terrain_suitability_all_mountain
% @type categorical
% @canonical false
% @original_name terrain_suitability (All-mountain)
% @values holds_own_all_mountain=Can_hold_its_own_all_mountain unk_terrain_allmtn=Unknown
% @importance 0.90

0.82::acc(s3, terrain_suitability_all_mountain).
0.77::true_val(terrain_suitability_all_mountain, holds_own_all_mountain); 0.23::true_val(terrain_suitability_all_mountain, unk_terrain_allmtn).
measured(s3, terrain_suitability_all_mountain, holds_own_all_mountain).
all_consistent(terrain_suitability_all_mountain) :- (indep(s3), consistent(s3, terrain_suitability_all_mountain) ; \+indep(s3)).
evidence(all_consistent(terrain_suitability_all_mountain)).
query(true_val(terrain_suitability_all_mountain, holds_own_all_mountain)).
query(true_val(terrain_suitability_all_mountain, unk_terrain_allmtn)).

% @attr terrain_suitability
% @type numeric
% @canonical true
% @original_name terrain_suitability (Park)
% @unit /10
% @values v10=10.0 unk_terrain_suitability=Unknown
% @importance 1.0

0.92::acc(s1, terrain_suitability).
0.90::true_val(terrain_suitability, v10); 0.10::true_val(terrain_suitability, unk_terrain_suitability).
measured(s1, terrain_suitability, v10).
all_consistent(terrain_suitability) :- consistent(s1, terrain_suitability).
evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, v10)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr terrain_suitability_street
% @type numeric
% @canonical false
% @original_name terrain_suitability (Street)
% @unit /10
% @values v10=10.0 unk_terrain_street=Unknown
% @importance 1.0

0.92::acc(s1, terrain_suitability_street).
0.90::true_val(terrain_suitability_street, v10); 0.10::true_val(terrain_suitability_street, unk_terrain_street).
measured(s1, terrain_suitability_street, v10).
all_consistent(terrain_suitability_street) :- consistent(s1, terrain_suitability_street).
evidence(all_consistent(terrain_suitability_street)).
query(true_val(terrain_suitability_street, v10)).
query(true_val(terrain_suitability_street, unk_terrain_street)).

% @attr terrain_suitability_mountain
% @type numeric
% @canonical false
% @original_name terrain_suitability (Mountain)
% @unit /10
% @values v8=8.0 unk_terrain_mountain=Unknown
% @importance 1.0

0.92::acc(s1, terrain_suitability_mountain).
0.90::true_val(terrain_suitability_mountain, v8); 0.10::true_val(terrain_suitability_mountain, unk_terrain_mountain).
measured(s1, terrain_suitability_mountain, v8).
all_consistent(terrain_suitability_mountain) :- consistent(s1, terrain_suitability_mountain).
evidence(all_consistent(terrain_suitability_mountain)).
query(true_val(terrain_suitability_mountain, v8)).
query(true_val(terrain_suitability_mountain, unk_terrain_mountain)).

% @attr terrain_suitability_pipe
% @type numeric
% @canonical false
% @original_name terrain_suitability (Pipe)
% @unit /10
% @values v7=7.0 unk_terrain_pipe=Unknown
% @importance 1.0

0.92::acc(s1, terrain_suitability_pipe).
0.90::true_val(terrain_suitability_pipe, v7); 0.10::true_val(terrain_suitability_pipe, unk_terrain_pipe).
measured(s1, terrain_suitability_pipe, v7).
all_consistent(terrain_suitability_pipe) :- consistent(s1, terrain_suitability_pipe).
evidence(all_consistent(terrain_suitability_pipe)).
query(true_val(terrain_suitability_pipe, v7)).
query(true_val(terrain_suitability_pipe, unk_terrain_pipe)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values freestyle_park_all_mtn=Freestyle_park_with_all_mountain_versatility unk_riding_style=Unknown
% @importance 0.875

0.85::acc(s3, riding_style).
0.82::acc(s30, riding_style).
0.93::true_val(riding_style, freestyle_park_all_mtn); 0.07::true_val(riding_style, unk_riding_style).
measured(s3, riding_style, freestyle_park_all_mtn).
measured(s30, riding_style, freestyle_park_all_mtn).
all_consistent(riding_style) :- (indep(s3), consistent(s3, riding_style) ; \+indep(s3)), consistent(s30, riding_style).
evidence(all_consistent(riding_style)).
query(true_val(riding_style, freestyle_park_all_mtn)).
query(true_val(riding_style, unk_riding_style)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values true_twin=True_Twin unk_shape=Unknown
% @importance 0.875

0.90::acc(s4, shape).
0.85::acc(s31, shape).
0.96::true_val(shape, true_twin); 0.04::true_val(shape, unk_shape).
measured(s4, shape, true_twin).
measured(s31, shape, true_twin).
all_consistent(shape) :- (indep(s4), consistent(s4, shape) ; \+indep(s4)), (indep(s31), consistent(s31, shape) ; \+indep(s31)).
evidence(all_consistent(shape)).
query(true_val(shape, true_twin)).
query(true_val(shape, unk_shape)).

% @attr shape_description
% @type categorical
% @canonical false
% @original_name shape (description)
% @values identical_tip_tail_centered=Identical_tip_tail_centered_stance_switch_riding unk_shape_desc=Unknown
% @importance 0.80

0.82::acc(s31, shape_description).
0.75::true_val(shape_description, identical_tip_tail_centered); 0.25::true_val(shape_description, unk_shape_desc).
measured(s31, shape_description, identical_tip_tail_centered).
all_consistent(shape_description) :- (indep(s31), consistent(s31, shape_description) ; \+indep(s31)).
evidence(all_consistent(shape_description)).
query(true_val(shape_description, identical_tip_tail_centered)).
query(true_val(shape_description, unk_shape_desc)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values micro_camber_2_3mm=Micro_Camber_2_3mm unk_camber_type=Unknown
% @importance 0.925

0.90::acc(s4, camber_type).
0.87::acc(s3, camber_type).
0.96::true_val(camber_type, micro_camber_2_3mm); 0.04::true_val(camber_type, unk_camber_type).
measured(s4, camber_type, micro_camber_2_3mm).
measured(s3, camber_type, micro_camber_2_3mm).
all_consistent(camber_type) :- consistent(s4, camber_type), consistent(s3, camber_type).
evidence(all_consistent(camber_type)).
query(true_val(camber_type, micro_camber_2_3mm)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical false
% @original_name camber_description
% @values toned_down_pop_stability=Toned_down_positive_camber_pop_stability_not_aggressive unk_camber_desc=Unknown
% @importance 0.90

0.85::acc(s3, camber_description).
0.80::true_val(camber_description, toned_down_pop_stability); 0.20::true_val(camber_description, unk_camber_desc).
measured(s3, camber_description, toned_down_pop_stability).
all_consistent(camber_description) :- (indep(s3), consistent(s3, camber_description) ; \+indep(s3)).
evidence(all_consistent(camber_description)).
query(true_val(camber_description, toned_down_pop_stability)).
query(true_val(camber_description, unk_camber_desc)).

% @attr camber_height_mm
% @type categorical
% @canonical true
% @original_name camber_height_mm
% @values zero_deg_2_3mm=0_deg_progression_2_3mm unk_camber_height=Unknown
% @importance 0.80

0.83::acc(s31, camber_height_mm).
0.77::true_val(camber_height_mm, zero_deg_2_3mm); 0.23::true_val(camber_height_mm, unk_camber_height).
measured(s31, camber_height_mm, zero_deg_2_3mm).
all_consistent(camber_height_mm) :- (indep(s31), consistent(s31, camber_height_mm) ; \+indep(s31)).
evidence(all_consistent(camber_height_mm)).
query(true_val(camber_height_mm, zero_deg_2_3mm)).
query(true_val(camber_height_mm, unk_camber_height)).

% @attr stance_position
% @type categorical
% @canonical false
% @original_name Stance position
% @values centered=Centered_Stance unk_stance_position=Unknown
% @importance 0.60

0.88::acc(s26, stance_position).
0.87::true_val(stance_position, centered); 0.13::true_val(stance_position, unk_stance_position).
measured(s26, stance_position, centered).
all_consistent(stance_position) :- consistent(s26, stance_position).
evidence(all_consistent(stance_position)).
query(true_val(stance_position, centered)).
query(true_val(stance_position, unk_stance_position)).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values twin_symmetrical=Twin_Symmetrical unk_flex_direction=Unknown
% @importance 0.95

0.88::acc(s4, flex_direction).
0.86::true_val(flex_direction, twin_symmetrical); 0.14::true_val(flex_direction, unk_flex_direction).
measured(s4, flex_direction, twin_symmetrical).
all_consistent(flex_direction) :- (indep(s4), consistent(s4, flex_direction) ; \+indep(s4)).
evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, twin_symmetrical)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr flex_rating_10_manufacturer
% @type numeric
% @canonical true
% @original_name flex_rating_10_manufacturer
% @unit /10
% @values v7=7.0 unk_flex_rating=Unknown
% @importance 0.95

0.93::acc(s4, flex_rating_10_manufacturer).
0.90::acc(s3, flex_rating_10_manufacturer).
0.96::true_val(flex_rating_10_manufacturer, v7); 0.04::true_val(flex_rating_10_manufacturer, unk_flex_rating).
measured(s4, flex_rating_10_manufacturer, v7).
measured(s3, flex_rating_10_manufacturer, v7).
all_consistent(flex_rating_10_manufacturer) :- consistent(s4, flex_rating_10_manufacturer), consistent(s3, flex_rating_10_manufacturer).
evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, v7)).
query(true_val(flex_rating_10_manufacturer, unk_flex_rating)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values medium_stiff=Medium_stiff soft_playful=Soft_and_playful_responsive
% @importance 0.825

0.82::acc(s4, flex_feel).
0.86::acc(s24, flex_feel).
0.45::true_val(flex_feel, medium_stiff); 0.55::true_val(flex_feel, soft_playful).
measured(s4, flex_feel, medium_stiff).
measured(s24, flex_feel, soft_playful).
all_consistent(flex_feel) :- (indep(s4), consistent(s4, flex_feel) ; \+indep(s4)), consistent(s24, flex_feel).
evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium_stiff)).
query(true_val(flex_feel, soft_playful)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values ultralight_core_aspen=Ultralight_Core_Canadian_aspen unk_core_material=Unknown
% @importance 0.925

0.90::acc(s4, core_material).
0.87::acc(s3, core_material).
0.95::true_val(core_material, ultralight_core_aspen); 0.05::true_val(core_material, unk_core_material).
measured(s4, core_material, ultralight_core_aspen).
measured(s3, core_material, ultralight_core_aspen).
all_consistent(core_material) :- consistent(s4, core_material), consistent(s3, core_material).
evidence(all_consistent(core_material)).
query(true_val(core_material, ultralight_core_aspen)).
query(true_val(core_material, unk_core_material)).

% @attr core_material_ns_detail
% @type categorical
% @canonical false
% @original_name core_material (NS detail)
% @values ns_superlight_wood_core=NS_Superlight_Wood_Core_custom_blend unk_core_ns=Unknown
% @importance 0.85

0.82::acc(s32, core_material_ns_detail).
0.78::true_val(core_material_ns_detail, ns_superlight_wood_core); 0.22::true_val(core_material_ns_detail, unk_core_ns).
measured(s32, core_material_ns_detail, ns_superlight_wood_core).
all_consistent(core_material_ns_detail) :- (indep(s32), consistent(s32, core_material_ns_detail) ; \+indep(s32)).
evidence(all_consistent(core_material_ns_detail)).
query(true_val(core_material_ns_detail, ns_superlight_wood_core)).
query(true_val(core_material_ns_detail, unk_core_ns)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values bi_lite_fibreglass=Bi_Lite_Fibreglass unk_laminate=Unknown
% @importance 0.90

0.88::acc(s4, laminate).
0.82::acc(s32, laminate).
0.95::true_val(laminate, bi_lite_fibreglass); 0.05::true_val(laminate, unk_laminate).
measured(s4, laminate, bi_lite_fibreglass).
measured(s32, laminate, bi_lite_fibreglass).
all_consistent(laminate) :- (indep(s4), consistent(s4, laminate) ; \+indep(s4)), (indep(s32), consistent(s32, laminate) ; \+indep(s32)).
evidence(all_consistent(laminate)).
query(true_val(laminate, bi_lite_fibreglass)).
query(true_val(laminate, unk_laminate)).

% @attr laminate_description
% @type categorical
% @canonical false
% @original_name laminate (description)
% @values sts_ultralight_glass_matrix=STS_fiberglass_with_ultralight_glass_fiber_matrix unk_laminate_desc=Unknown
% @importance 0.85

0.80::acc(s32, laminate_description).
0.76::true_val(laminate_description, sts_ultralight_glass_matrix); 0.24::true_val(laminate_description, unk_laminate_desc).
measured(s32, laminate_description, sts_ultralight_glass_matrix).
all_consistent(laminate_description) :- (indep(s32), consistent(s32, laminate_description) ; \+indep(s32)).
evidence(all_consistent(laminate_description)).
query(true_val(laminate_description, sts_ultralight_glass_matrix)).
query(true_val(laminate_description, unk_laminate_desc)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values durasurf_sintered_4501=Durasurf_Sintered_4501_UHMWPE unk_base_material=Unknown
% @importance 0.875

0.90::acc(s4, base_material).
0.85::acc(s31, base_material).
0.96::true_val(base_material, durasurf_sintered_4501); 0.04::true_val(base_material, unk_base_material).
measured(s4, base_material, durasurf_sintered_4501).
measured(s31, base_material, durasurf_sintered_4501).
all_consistent(base_material) :- (indep(s4), consistent(s4, base_material) ; \+indep(s4)), (indep(s31), consistent(s31, base_material) ; \+indep(s31)).
evidence(all_consistent(base_material)).
query(true_val(base_material, durasurf_sintered_4501)).
query(true_val(base_material, unk_base_material)).

% @attr base_glide_performance
% @type categorical
% @canonical false
% @original_name base_glide_performance
% @values excellent_wax_absorption=Excellent_wax_absorption_greater_speed unk_base_glide=Unknown
% @importance 0.80

0.82::acc(s31, base_glide_performance).
0.77::true_val(base_glide_performance, excellent_wax_absorption); 0.23::true_val(base_glide_performance, unk_base_glide).
measured(s31, base_glide_performance, excellent_wax_absorption).
all_consistent(base_glide_performance) :- (indep(s31), consistent(s31, base_glide_performance) ; \+indep(s31)).
evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, excellent_wax_absorption)).
query(true_val(base_glide_performance, unk_base_glide)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values sintered_ptex=Sintered_P_Tex_Sidewall unk_sidewall_material=Unknown
% @importance 0.90

0.88::acc(s4, sidewall_material).
0.82::acc(s32, sidewall_material).
0.95::true_val(sidewall_material, sintered_ptex); 0.05::true_val(sidewall_material, unk_sidewall_material).
measured(s4, sidewall_material, sintered_ptex).
measured(s32, sidewall_material, sintered_ptex).
all_consistent(sidewall_material) :- (indep(s4), consistent(s4, sidewall_material) ; \+indep(s4)), (indep(s32), consistent(s32, sidewall_material) ; \+indep(s32)).
evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, sintered_ptex)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr sidewall_material_properties
% @type categorical
% @canonical false
% @original_name sidewall_material (properties)
% @values integrity_any_temp=Maintains_integrity_any_temperature_no_crack unk_sidewall_prop=Unknown
% @importance 0.90

0.85::acc(s4, sidewall_material_properties).
0.82::acc(s32, sidewall_material_properties).
0.94::true_val(sidewall_material_properties, integrity_any_temp); 0.06::true_val(sidewall_material_properties, unk_sidewall_prop).
measured(s4, sidewall_material_properties, integrity_any_temp).
measured(s32, sidewall_material_properties, integrity_any_temp).
all_consistent(sidewall_material_properties) :- (indep(s4), consistent(s4, sidewall_material_properties) ; \+indep(s4)), (indep(s32), consistent(s32, sidewall_material_properties) ; \+indep(s32)).
evidence(all_consistent(sidewall_material_properties)).
query(true_val(sidewall_material_properties, integrity_any_temp)).
query(true_val(sidewall_material_properties, unk_sidewall_prop)).

% @attr sidewall_material_history
% @type categorical
% @canonical false
% @original_name sidewall_material (history)
% @values ns_first_to_use=NS_first_to_use_and_perfect_sintered_ptex_sidewalls unk_sidewall_hist=Unknown
% @importance 0.85

0.78::acc(s32, sidewall_material_history).
0.73::true_val(sidewall_material_history, ns_first_to_use); 0.27::true_val(sidewall_material_history, unk_sidewall_hist).
measured(s32, sidewall_material_history, ns_first_to_use).
all_consistent(sidewall_material_history) :- (indep(s32), consistent(s32, sidewall_material_history) ; \+indep(s32)).
evidence(all_consistent(sidewall_material_history)).
query(true_val(sidewall_material_history, ns_first_to_use)).
query(true_val(sidewall_material_history, unk_sidewall_hist)).

% @attr topsheet
% @type categorical
% @canonical false
% @original_name topsheet
% @values poly_thermo=Poly_Thermo_durable_lightweight_scratch_chip_resistant unk_topsheet=Unknown
% @importance 0.925

0.90::acc(s4, topsheet).
0.87::acc(s3, topsheet).
0.95::true_val(topsheet, poly_thermo); 0.05::true_val(topsheet, unk_topsheet).
measured(s4, topsheet, poly_thermo).
measured(s3, topsheet, poly_thermo).
all_consistent(topsheet) :- consistent(s4, topsheet), consistent(s3, topsheet).
evidence(all_consistent(topsheet)).
query(true_val(topsheet, poly_thermo)).
query(true_val(topsheet, unk_topsheet)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values full_wrap_metal=Full_Wrap_Metal_Edges unk_edge_technology=Unknown
% @importance 0.975

0.93::acc(s1, edge_technology).
0.88::acc(s4, edge_technology).
0.96::true_val(edge_technology, full_wrap_metal); 0.04::true_val(edge_technology, unk_edge_technology).
measured(s1, edge_technology, full_wrap_metal).
measured(s4, edge_technology, full_wrap_metal).
all_consistent(edge_technology) :- consistent(s1, edge_technology), (indep(s4), consistent(s4, edge_technology) ; \+indep(s4)).
evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, full_wrap_metal)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4_stainless=2x4_Inserts_stainless_10mm unk_mounting_pattern=Unknown
% @importance 0.95

0.90::acc(s4, mounting_pattern).
0.88::true_val(mounting_pattern, inserts_2x4_stainless); 0.12::true_val(mounting_pattern, unk_mounting_pattern).
measured(s4, mounting_pattern, inserts_2x4_stainless).
all_consistent(mounting_pattern) :- (indep(s4), consistent(s4, mounting_pattern) ; \+indep(s4)).
evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4_stainless)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values featherweight_damping=Featherweight_Damping_System unk_cmi=Unknown
% @importance 0.975

0.93::acc(s1, construction_material_innovation).
0.88::acc(s4, construction_material_innovation).
0.96::true_val(construction_material_innovation, featherweight_damping); 0.04::true_val(construction_material_innovation, unk_cmi).
measured(s1, construction_material_innovation, featherweight_damping).
measured(s4, construction_material_innovation, featherweight_damping).
all_consistent(construction_material_innovation) :- consistent(s1, construction_material_innovation), (indep(s4), consistent(s4, construction_material_innovation) ; \+indep(s4)).
evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, featherweight_damping)).
query(true_val(construction_material_innovation, unk_cmi)).

% @attr construction_material_innovation_stabilisers
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Stabilisers)
% @values underfoot_balancing_stab=Underfoot_Balancing_Stabilisers_vibration_absorption unk_cmi_stab=Unknown
% @importance 0.90

0.88::acc(s4, construction_material_innovation_stabilisers).
0.82::acc(s32, construction_material_innovation_stabilisers).
0.95::true_val(construction_material_innovation_stabilisers, underfoot_balancing_stab); 0.05::true_val(construction_material_innovation_stabilisers, unk_cmi_stab).
measured(s4, construction_material_innovation_stabilisers, underfoot_balancing_stab).
measured(s32, construction_material_innovation_stabilisers, underfoot_balancing_stab).
all_consistent(construction_material_innovation_stabilisers) :- (indep(s4), consistent(s4, construction_material_innovation_stabilisers) ; \+indep(s4)), (indep(s32), consistent(s32, construction_material_innovation_stabilisers) ; \+indep(s32)).
evidence(all_consistent(construction_material_innovation_stabilisers)).
query(true_val(construction_material_innovation_stabilisers, underfoot_balancing_stab)).
query(true_val(construction_material_innovation_stabilisers, unk_cmi_stab)).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values vario_power_grip=Vario_Power_Grip_Sidecut unk_sidecut_type=Unknown
% @importance 0.90

0.90::acc(s4, sidecut_type).
0.82::acc(s32, sidecut_type).
0.95::true_val(sidecut_type, vario_power_grip); 0.05::true_val(sidecut_type, unk_sidecut_type).
measured(s4, sidecut_type, vario_power_grip).
measured(s32, sidecut_type, vario_power_grip).
all_consistent(sidecut_type) :- (indep(s4), consistent(s4, sidecut_type) ; \+indep(s4)), (indep(s32), consistent(s32, sidecut_type) ; \+indep(s32)).
evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, vario_power_grip)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr sidecut_type_description
% @type categorical
% @canonical false
% @original_name sidecut_type (description)
% @values multi_radius_contact=Multiple_radiuses_extra_contact_points unk_sidecut_desc=Unknown
% @importance 0.85

0.80::acc(s32, sidecut_type_description).
0.76::true_val(sidecut_type_description, multi_radius_contact); 0.24::true_val(sidecut_type_description, unk_sidecut_desc).
measured(s32, sidecut_type_description, multi_radius_contact).
all_consistent(sidecut_type_description) :- (indep(s32), consistent(s32, sidecut_type_description) ; \+indep(s32)).
evidence(all_consistent(sidecut_type_description)).
query(true_val(sidecut_type_description, multi_radius_contact)).
query(true_val(sidecut_type_description, unk_sidecut_desc)).

% @attr sidecut_type_patent
% @type categorical
% @canonical false
% @original_name sidecut_type (patent)
% @values us_patent_ns_hybrid_camber=Under_US_Patent_NS_hybrid_camber unk_sidecut_patent=Unknown
% @importance 0.50

0.72::acc(s33, sidecut_type_patent).
0.68::true_val(sidecut_type_patent, us_patent_ns_hybrid_camber); 0.32::true_val(sidecut_type_patent, unk_sidecut_patent).
measured(s33, sidecut_type_patent, us_patent_ns_hybrid_camber).
all_consistent(sidecut_type_patent) :- consistent(s33, sidecut_type_patent).
evidence(all_consistent(sidecut_type_patent)).
query(true_val(sidecut_type_patent, us_patent_ns_hybrid_camber)).
query(true_val(sidecut_type_patent, unk_sidecut_patent)).

% @attr tip_tail_profile
% @type categorical
% @canonical false
% @original_name Tip/tail profile
% @values low_profile=Low_Profile_Tip_Tail unk_tip_tail_profile=Unknown
% @importance 0.925

0.90::acc(s4, tip_tail_profile).
0.87::acc(s3, tip_tail_profile).
0.95::true_val(tip_tail_profile, low_profile); 0.05::true_val(tip_tail_profile, unk_tip_tail_profile).
measured(s4, tip_tail_profile, low_profile).
measured(s3, tip_tail_profile, low_profile).
all_consistent(tip_tail_profile) :- consistent(s4, tip_tail_profile), consistent(s3, tip_tail_profile).
evidence(all_consistent(tip_tail_profile)).
query(true_val(tip_tail_profile, low_profile)).
query(true_val(tip_tail_profile, unk_tip_tail_profile)).

% @attr tip_tail_benefit
% @type categorical
% @canonical false
% @original_name Tip/tail benefit
% @values max_contact_pop_float=Max_contact_pop_landing_stability_float unk_tip_tail_benefit=Unknown
% @importance 0.90

0.85::acc(s3, tip_tail_benefit).
0.80::true_val(tip_tail_benefit, max_contact_pop_float); 0.20::true_val(tip_tail_benefit, unk_tip_tail_benefit).
measured(s3, tip_tail_benefit, max_contact_pop_float).
all_consistent(tip_tail_benefit) :- (indep(s3), consistent(s3, tip_tail_benefit) ; \+indep(s3)).
evidence(all_consistent(tip_tail_benefit)).
query(true_val(tip_tail_benefit, max_contact_pop_float)).
query(true_val(tip_tail_benefit, unk_tip_tail_benefit)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values sizes_145_150_153_155_156w_158w=145_150_153_155_156W_158W unk_available_sizes=Unknown
% @importance 1.0

0.93::acc(s1, available_sizes).
0.95::true_val(available_sizes, sizes_145_150_153_155_156w_158w); 0.05::true_val(available_sizes, unk_available_sizes).
measured(s1, available_sizes, sizes_145_150_153_155_156w_158w).
all_consistent(available_sizes) :- consistent(s1, available_sizes).
evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, sizes_145_150_153_155_156w_158w)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr available_sizes_retailer
% @type categorical
% @canonical false
% @original_name available_sizes (retailer)
% @values sizes_153_155_156w=153_155_156W unk_avail_sizes_ret=Unknown
% @importance 0.95

0.82::acc(s4, available_sizes_retailer).
0.78::true_val(available_sizes_retailer, sizes_153_155_156w); 0.22::true_val(available_sizes_retailer, unk_avail_sizes_ret).
measured(s4, available_sizes_retailer, sizes_153_155_156w).
all_consistent(available_sizes_retailer) :- (indep(s4), consistent(s4, available_sizes_retailer) ; \+indep(s4)).
evidence(all_consistent(available_sizes_retailer)).
query(true_val(available_sizes_retailer, sizes_153_155_156w)).
query(true_val(available_sizes_retailer, unk_avail_sizes_ret)).

% @attr waist_width_145
% @type numeric
% @canonical false
% @original_name Waist width 145cm
% @unit cm
% @values v24_6=24.6 v24_1=24.1
% @importance 0.975

0.90::acc(s1, waist_width_145).
0.72::acc(s4, waist_width_145).
0.65::true_val(waist_width_145, v24_6); 0.35::true_val(waist_width_145, v24_1).
measured(s1, waist_width_145, v24_6).
measured(s4, waist_width_145, v24_1).
all_consistent(waist_width_145) :- consistent(s1, waist_width_145), (indep(s4), consistent(s4, waist_width_145) ; \+indep(s4)).
evidence(all_consistent(waist_width_145)).
query(true_val(waist_width_145, v24_6)).
query(true_val(waist_width_145, v24_1)).

% @attr effective_edge_145
% @type numeric
% @canonical false
% @original_name Effective edge 145cm
% @unit cm
% @values v105_9=105.9 v116=116.0
% @importance 0.975

0.90::acc(s1, effective_edge_145).
0.65::acc(s4, effective_edge_145).
0.70::true_val(effective_edge_145, v105_9); 0.30::true_val(effective_edge_145, v116).
measured(s1, effective_edge_145, v105_9).
measured(s4, effective_edge_145, v116).
all_consistent(effective_edge_145) :- consistent(s1, effective_edge_145), (indep(s4), consistent(s4, effective_edge_145) ; \+indep(s4)).
evidence(all_consistent(effective_edge_145)).
query(true_val(effective_edge_145, v105_9)).
query(true_val(effective_edge_145, v116)).

% @attr sidecut_radius_size_145
% @type categorical
% @canonical false
% @original_name sidecut_radius_size (145)
% @values vario_700=Vario_700 unk_scr_145=Unknown
% @importance 0.975

0.93::acc(s1, sidecut_radius_size_145).
0.85::acc(s4, sidecut_radius_size_145).
0.97::true_val(sidecut_radius_size_145, vario_700); 0.03::true_val(sidecut_radius_size_145, unk_scr_145).
measured(s1, sidecut_radius_size_145, vario_700).
measured(s4, sidecut_radius_size_145, vario_700).
all_consistent(sidecut_radius_size_145) :- consistent(s1, sidecut_radius_size_145), (indep(s4), consistent(s4, sidecut_radius_size_145) ; \+indep(s4)).
evidence(all_consistent(sidecut_radius_size_145)).
query(true_val(sidecut_radius_size_145, vario_700)).
query(true_val(sidecut_radius_size_145, unk_scr_145)).

% @attr tip_tail_width_size_145
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (145)
% @unit cm
% @values v28_2=28.2 unk_ttw_145=Unknown
% @importance 0.975

0.93::acc(s1, tip_tail_width_size_145).
0.85::acc(s4, tip_tail_width_size_145).
0.97::true_val(tip_tail_width_size_145, v28_2); 0.03::true_val(tip_tail_width_size_145, unk_ttw_145).
measured(s1, tip_tail_width_size_145, v28_2).
measured(s4, tip_tail_width_size_145, v28_2).
all_consistent(tip_tail_width_size_145) :- consistent(s1, tip_tail_width_size_145), (indep(s4), consistent(s4, tip_tail_width_size_145) ; \+indep(s4)).
evidence(all_consistent(tip_tail_width_size_145)).
query(true_val(tip_tail_width_size_145, v28_2)).
query(true_val(tip_tail_width_size_145, unk_ttw_145)).

% @attr recommended_weight_range_size_145
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (145)
% @unit kg
% @values w50_63=50_63kg unk_rwr_145=Unknown
% @importance 0.95

0.85::acc(s4, recommended_weight_range_size_145).
0.81::true_val(recommended_weight_range_size_145, w50_63); 0.19::true_val(recommended_weight_range_size_145, unk_rwr_145).
measured(s4, recommended_weight_range_size_145, w50_63).
all_consistent(recommended_weight_range_size_145) :- (indep(s4), consistent(s4, recommended_weight_range_size_145) ; \+indep(s4)).
evidence(all_consistent(recommended_weight_range_size_145)).
query(true_val(recommended_weight_range_size_145, w50_63)).
query(true_val(recommended_weight_range_size_145, unk_rwr_145)).

% @attr waist_width_150
% @type numeric
% @canonical false
% @original_name Waist width 150cm
% @unit cm
% @values v25_0=25.0 v24_3=24.3
% @importance 0.975

0.90::acc(s1, waist_width_150).
0.72::acc(s4, waist_width_150).
0.65::true_val(waist_width_150, v25_0); 0.35::true_val(waist_width_150, v24_3).
measured(s1, waist_width_150, v25_0).
measured(s4, waist_width_150, v24_3).
all_consistent(waist_width_150) :- consistent(s1, waist_width_150), (indep(s4), consistent(s4, waist_width_150) ; \+indep(s4)).
evidence(all_consistent(waist_width_150)).
query(true_val(waist_width_150, v25_0)).
query(true_val(waist_width_150, v24_3)).

% @attr effective_edge_150
% @type numeric
% @canonical false
% @original_name Effective edge 150cm
% @unit cm
% @values v112_6=112.6 v119=119.0
% @importance 0.975

0.90::acc(s1, effective_edge_150).
0.65::acc(s4, effective_edge_150).
0.70::true_val(effective_edge_150, v112_6); 0.30::true_val(effective_edge_150, v119).
measured(s1, effective_edge_150, v112_6).
measured(s4, effective_edge_150, v119).
all_consistent(effective_edge_150) :- consistent(s1, effective_edge_150), (indep(s4), consistent(s4, effective_edge_150) ; \+indep(s4)).
evidence(all_consistent(effective_edge_150)).
query(true_val(effective_edge_150, v112_6)).
query(true_val(effective_edge_150, v119)).

% @attr sidecut_radius_size_150
% @type categorical
% @canonical false
% @original_name sidecut_radius_size (150)
% @values vario_702=Vario_702 unk_scr_150=Unknown
% @importance 0.975

0.93::acc(s1, sidecut_radius_size_150).
0.85::acc(s4, sidecut_radius_size_150).
0.97::true_val(sidecut_radius_size_150, vario_702); 0.03::true_val(sidecut_radius_size_150, unk_scr_150).
measured(s1, sidecut_radius_size_150, vario_702).
measured(s4, sidecut_radius_size_150, vario_702).
all_consistent(sidecut_radius_size_150) :- consistent(s1, sidecut_radius_size_150), (indep(s4), consistent(s4, sidecut_radius_size_150) ; \+indep(s4)).
evidence(all_consistent(sidecut_radius_size_150)).
query(true_val(sidecut_radius_size_150, vario_702)).
query(true_val(sidecut_radius_size_150, unk_scr_150)).

% @attr tip_tail_width_size_150
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (150)
% @unit cm
% @values v28_7=28.7 unk_ttw_150=Unknown
% @importance 0.975

0.93::acc(s1, tip_tail_width_size_150).
0.85::acc(s4, tip_tail_width_size_150).
0.97::true_val(tip_tail_width_size_150, v28_7); 0.03::true_val(tip_tail_width_size_150, unk_ttw_150).
measured(s1, tip_tail_width_size_150, v28_7).
measured(s4, tip_tail_width_size_150, v28_7).
all_consistent(tip_tail_width_size_150) :- consistent(s1, tip_tail_width_size_150), (indep(s4), consistent(s4, tip_tail_width_size_150) ; \+indep(s4)).
evidence(all_consistent(tip_tail_width_size_150)).
query(true_val(tip_tail_width_size_150, v28_7)).
query(true_val(tip_tail_width_size_150, unk_ttw_150)).

% @attr recommended_weight_range_size_150
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (150)
% @unit kg
% @values w63_77=63_77kg unk_rwr_150=Unknown
% @importance 0.95

0.85::acc(s4, recommended_weight_range_size_150).
0.81::true_val(recommended_weight_range_size_150, w63_77); 0.19::true_val(recommended_weight_range_size_150, unk_rwr_150).
measured(s4, recommended_weight_range_size_150, w63_77).
all_consistent(recommended_weight_range_size_150) :- (indep(s4), consistent(s4, recommended_weight_range_size_150) ; \+indep(s4)).
evidence(all_consistent(recommended_weight_range_size_150)).
query(true_val(recommended_weight_range_size_150, w63_77)).
query(true_val(recommended_weight_range_size_150, unk_rwr_150)).

% @attr waist_width_153
% @type numeric
% @canonical false
% @original_name Waist width 153cm
% @unit cm
% @values v25_0=25.0 v24_4=24.4
% @importance 0.975

0.90::acc(s1, waist_width_153).
0.72::acc(s4, waist_width_153).
0.65::true_val(waist_width_153, v25_0); 0.35::true_val(waist_width_153, v24_4).
measured(s1, waist_width_153, v25_0).
measured(s4, waist_width_153, v24_4).
all_consistent(waist_width_153) :- consistent(s1, waist_width_153), (indep(s4), consistent(s4, waist_width_153) ; \+indep(s4)).
evidence(all_consistent(waist_width_153)).
query(true_val(waist_width_153, v25_0)).
query(true_val(waist_width_153, v24_4)).

% @attr effective_edge_153
% @type numeric
% @canonical false
% @original_name Effective edge 153cm
% @unit cm
% @values v112_6=112.6 v122=122.0
% @importance 0.975

0.90::acc(s1, effective_edge_153).
0.65::acc(s4, effective_edge_153).
0.70::true_val(effective_edge_153, v112_6); 0.30::true_val(effective_edge_153, v122).
measured(s1, effective_edge_153, v112_6).
measured(s4, effective_edge_153, v122).
all_consistent(effective_edge_153) :- consistent(s1, effective_edge_153), (indep(s4), consistent(s4, effective_edge_153) ; \+indep(s4)).
evidence(all_consistent(effective_edge_153)).
query(true_val(effective_edge_153, v112_6)).
query(true_val(effective_edge_153, v122)).

% @attr sidecut_radius_size_153
% @type categorical
% @canonical false
% @original_name sidecut_radius_size (153)
% @values vario_720=Vario_720 unk_scr_153=Unknown
% @importance 0.975

0.93::acc(s1, sidecut_radius_size_153).
0.85::acc(s4, sidecut_radius_size_153).
0.97::true_val(sidecut_radius_size_153, vario_720); 0.03::true_val(sidecut_radius_size_153, unk_scr_153).
measured(s1, sidecut_radius_size_153, vario_720).
measured(s4, sidecut_radius_size_153, vario_720).
all_consistent(sidecut_radius_size_153) :- consistent(s1, sidecut_radius_size_153), (indep(s4), consistent(s4, sidecut_radius_size_153) ; \+indep(s4)).
evidence(all_consistent(sidecut_radius_size_153)).
query(true_val(sidecut_radius_size_153, vario_720)).
query(true_val(sidecut_radius_size_153, unk_scr_153)).

% @attr tip_tail_width_size_153
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (153)
% @unit cm
% @values v28_8=28.8 unk_ttw_153=Unknown
% @importance 0.975

0.93::acc(s1, tip_tail_width_size_153).
0.85::acc(s4, tip_tail_width_size_153).
0.97::true_val(tip_tail_width_size_153, v28_8); 0.03::true_val(tip_tail_width_size_153, unk_ttw_153).
measured(s1, tip_tail_width_size_153, v28_8).
measured(s4, tip_tail_width_size_153, v28_8).
all_consistent(tip_tail_width_size_153) :- consistent(s1, tip_tail_width_size_153), (indep(s4), consistent(s4, tip_tail_width_size_153) ; \+indep(s4)).
evidence(all_consistent(tip_tail_width_size_153)).
query(true_val(tip_tail_width_size_153, v28_8)).
query(true_val(tip_tail_width_size_153, unk_ttw_153)).

% @attr recommended_weight_range_size_153
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (153)
% @unit kg
% @values w68_86=68_86kg unk_rwr_153=Unknown
% @importance 0.95

0.85::acc(s4, recommended_weight_range_size_153).
0.81::true_val(recommended_weight_range_size_153, w68_86); 0.19::true_val(recommended_weight_range_size_153, unk_rwr_153).
measured(s4, recommended_weight_range_size_153, w68_86).
all_consistent(recommended_weight_range_size_153) :- (indep(s4), consistent(s4, recommended_weight_range_size_153) ; \+indep(s4)).
evidence(all_consistent(recommended_weight_range_size_153)).
query(true_val(recommended_weight_range_size_153, w68_86)).
query(true_val(recommended_weight_range_size_153, unk_rwr_153)).

% @attr waist_width_155
% @type numeric
% @canonical false
% @original_name Waist width 155cm
% @unit cm
% @values v25_1=25.1 unk_ww_155=Unknown
% @importance 0.975

0.93::acc(s1, waist_width_155).
0.88::acc(s4, waist_width_155).
0.97::true_val(waist_width_155, v25_1); 0.03::true_val(waist_width_155, unk_ww_155).
measured(s1, waist_width_155, v25_1).
measured(s4, waist_width_155, v25_1).
all_consistent(waist_width_155) :- consistent(s1, waist_width_155), (indep(s4), consistent(s4, waist_width_155) ; \+indep(s4)).
evidence(all_consistent(waist_width_155)).
query(true_val(waist_width_155, v25_1)).
query(true_val(waist_width_155, unk_ww_155)).

% @attr effective_edge_155
% @type numeric
% @canonical false
% @original_name Effective edge 155cm
% @unit cm
% @values v114_3=114.3 v122=122.0
% @importance 0.975

0.90::acc(s1, effective_edge_155).
0.65::acc(s4, effective_edge_155).
0.70::true_val(effective_edge_155, v114_3); 0.30::true_val(effective_edge_155, v122).
measured(s1, effective_edge_155, v114_3).
measured(s4, effective_edge_155, v122).
all_consistent(effective_edge_155) :- consistent(s1, effective_edge_155), (indep(s4), consistent(s4, effective_edge_155) ; \+indep(s4)).
evidence(all_consistent(effective_edge_155)).
query(true_val(effective_edge_155, v114_3)).
query(true_val(effective_edge_155, v122)).

% @attr sidecut_radius_size_155
% @type categorical
% @canonical false
% @original_name sidecut_radius_size (155)
% @values vario_722=Vario_722 unk_scr_155=Unknown
% @importance 0.975

0.93::acc(s1, sidecut_radius_size_155).
0.85::acc(s4, sidecut_radius_size_155).
0.97::true_val(sidecut_radius_size_155, vario_722); 0.03::true_val(sidecut_radius_size_155, unk_scr_155).
measured(s1, sidecut_radius_size_155, vario_722).
measured(s4, sidecut_radius_size_155, vario_722).
all_consistent(sidecut_radius_size_155) :- consistent(s1, sidecut_radius_size_155), (indep(s4), consistent(s4, sidecut_radius_size_155) ; \+indep(s4)).
evidence(all_consistent(sidecut_radius_size_155)).
query(true_val(sidecut_radius_size_155, vario_722)).
query(true_val(sidecut_radius_size_155, unk_scr_155)).

% @attr tip_tail_width_size_155
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (155)
% @unit cm
% @values v29_5=29.5 unk_ttw_155=Unknown
% @importance 0.975

0.93::acc(s1, tip_tail_width_size_155).
0.85::acc(s4, tip_tail_width_size_155).
0.97::true_val(tip_tail_width_size_155, v29_5); 0.03::true_val(tip_tail_width_size_155, unk_ttw_155).
measured(s1, tip_tail_width_size_155, v29_5).
measured(s4, tip_tail_width_size_155, v29_5).
all_consistent(tip_tail_width_size_155) :- consistent(s1, tip_tail_width_size_155), (indep(s4), consistent(s4, tip_tail_width_size_155) ; \+indep(s4)).
evidence(all_consistent(tip_tail_width_size_155)).
query(true_val(tip_tail_width_size_155, v29_5)).
query(true_val(tip_tail_width_size_155, unk_ttw_155)).

% @attr recommended_weight_range_size_155
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (155)
% @unit kg
% @values w73_91=73_91kg unk_rwr_155=Unknown
% @importance 0.95

0.85::acc(s4, recommended_weight_range_size_155).
0.81::true_val(recommended_weight_range_size_155, w73_91); 0.19::true_val(recommended_weight_range_size_155, unk_rwr_155).
measured(s4, recommended_weight_range_size_155, w73_91).
all_consistent(recommended_weight_range_size_155) :- (indep(s4), consistent(s4, recommended_weight_range_size_155) ; \+indep(s4)).
evidence(all_consistent(recommended_weight_range_size_155)).
query(true_val(recommended_weight_range_size_155, w73_91)).
query(true_val(recommended_weight_range_size_155, unk_rwr_155)).

% @attr waist_width_156w
% @type numeric
% @canonical false
% @original_name Waist width 156W
% @unit cm
% @values v26_1=26.1 unk_ww_156w=Unknown
% @importance 0.975

0.93::acc(s1, waist_width_156w).
0.88::acc(s4, waist_width_156w).
0.97::true_val(waist_width_156w, v26_1); 0.03::true_val(waist_width_156w, unk_ww_156w).
measured(s1, waist_width_156w, v26_1).
measured(s4, waist_width_156w, v26_1).
all_consistent(waist_width_156w) :- consistent(s1, waist_width_156w), (indep(s4), consistent(s4, waist_width_156w) ; \+indep(s4)).
evidence(all_consistent(waist_width_156w)).
query(true_val(waist_width_156w, v26_1)).
query(true_val(waist_width_156w, unk_ww_156w)).

% @attr effective_edge_156w
% @type numeric
% @canonical false
% @original_name Effective edge 156W
% @unit cm
% @values v122=122.0 unk_ee_156w=Unknown
% @importance 0.975

0.93::acc(s1, effective_edge_156w).
0.88::acc(s4, effective_edge_156w).
0.97::true_val(effective_edge_156w, v122); 0.03::true_val(effective_edge_156w, unk_ee_156w).
measured(s1, effective_edge_156w, v122).
measured(s4, effective_edge_156w, v122).
all_consistent(effective_edge_156w) :- consistent(s1, effective_edge_156w), (indep(s4), consistent(s4, effective_edge_156w) ; \+indep(s4)).
evidence(all_consistent(effective_edge_156w)).
query(true_val(effective_edge_156w, v122)).
query(true_val(effective_edge_156w, unk_ee_156w)).

% @attr sidecut_radius_size
% @type categorical
% @canonical true
% @original_name sidecut_radius_size (156W)
% @values vario_728=Vario_728 unk_scr_156w=Unknown
% @importance 0.975

0.93::acc(s1, sidecut_radius_size).
0.85::acc(s4, sidecut_radius_size).
0.97::true_val(sidecut_radius_size, vario_728); 0.03::true_val(sidecut_radius_size, unk_scr_156w).
measured(s1, sidecut_radius_size, vario_728).
measured(s4, sidecut_radius_size, vario_728).
all_consistent(sidecut_radius_size) :- consistent(s1, sidecut_radius_size), (indep(s4), consistent(s4, sidecut_radius_size) ; \+indep(s4)).
evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, vario_728)).
query(true_val(sidecut_radius_size, unk_scr_156w)).

% @attr tip_tail_width_size
% @type numeric
% @canonical true
% @original_name tip_tail_width_size (156W)
% @unit cm
% @values v30_5=30.5 unk_ttw_156w=Unknown
% @importance 0.975

0.93::acc(s1, tip_tail_width_size).
0.85::acc(s4, tip_tail_width_size).
0.97::true_val(tip_tail_width_size, v30_5); 0.03::true_val(tip_tail_width_size, unk_ttw_156w).
measured(s1, tip_tail_width_size, v30_5).
measured(s4, tip_tail_width_size, v30_5).
all_consistent(tip_tail_width_size) :- consistent(s1, tip_tail_width_size), (indep(s4), consistent(s4, tip_tail_width_size) ; \+indep(s4)).
evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v30_5)).
query(true_val(tip_tail_width_size, unk_ttw_156w)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size (156W)
% @unit kg
% @values w73_91=73_91kg unk_rwr_156w=Unknown
% @importance 0.95

0.85::acc(s4, recommended_weight_range_size).
0.81::true_val(recommended_weight_range_size, w73_91); 0.19::true_val(recommended_weight_range_size, unk_rwr_156w).
measured(s4, recommended_weight_range_size, w73_91).
all_consistent(recommended_weight_range_size) :- (indep(s4), consistent(s4, recommended_weight_range_size) ; \+indep(s4)).
evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w73_91)).
query(true_val(recommended_weight_range_size, unk_rwr_156w)).

% @attr waist_width_158w
% @type numeric
% @canonical false
% @original_name Waist width 158W
% @unit cm
% @values v26_4=26.4 unk_ww_158w=Unknown
% @importance 0.975

0.93::acc(s1, waist_width_158w).
0.88::acc(s4, waist_width_158w).
0.97::true_val(waist_width_158w, v26_4); 0.03::true_val(waist_width_158w, unk_ww_158w).
measured(s1, waist_width_158w, v26_4).
measured(s4, waist_width_158w, v26_4).
all_consistent(waist_width_158w) :- consistent(s1, waist_width_158w), (indep(s4), consistent(s4, waist_width_158w) ; \+indep(s4)).
evidence(all_consistent(waist_width_158w)).
query(true_val(waist_width_158w, v26_4)).
query(true_val(waist_width_158w, unk_ww_158w)).

% @attr effective_edge_158w
% @type numeric
% @canonical false
% @original_name Effective edge 158W
% @unit cm
% @values v125=125.0 unk_ee_158w=Unknown
% @importance 0.975

0.93::acc(s1, effective_edge_158w).
0.88::acc(s4, effective_edge_158w).
0.97::true_val(effective_edge_158w, v125); 0.03::true_val(effective_edge_158w, unk_ee_158w).
measured(s1, effective_edge_158w, v125).
measured(s4, effective_edge_158w, v125).
all_consistent(effective_edge_158w) :- consistent(s1, effective_edge_158w), (indep(s4), consistent(s4, effective_edge_158w) ; \+indep(s4)).
evidence(all_consistent(effective_edge_158w)).
query(true_val(effective_edge_158w, v125)).
query(true_val(effective_edge_158w, unk_ee_158w)).

% @attr sidecut_radius_size_158w
% @type categorical
% @canonical false
% @original_name sidecut_radius_size (158W)
% @values vario_735=Vario_735 unk_scr_158w=Unknown
% @importance 0.975

0.93::acc(s1, sidecut_radius_size_158w).
0.85::acc(s4, sidecut_radius_size_158w).
0.97::true_val(sidecut_radius_size_158w, vario_735); 0.03::true_val(sidecut_radius_size_158w, unk_scr_158w).
measured(s1, sidecut_radius_size_158w, vario_735).
measured(s4, sidecut_radius_size_158w, vario_735).
all_consistent(sidecut_radius_size_158w) :- consistent(s1, sidecut_radius_size_158w), (indep(s4), consistent(s4, sidecut_radius_size_158w) ; \+indep(s4)).
evidence(all_consistent(sidecut_radius_size_158w)).
query(true_val(sidecut_radius_size_158w, vario_735)).
query(true_val(sidecut_radius_size_158w, unk_scr_158w)).

% @attr tip_tail_width_size_158w
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (158W)
% @unit cm
% @values v31_0=31.0 unk_ttw_158w=Unknown
% @importance 0.975

0.93::acc(s1, tip_tail_width_size_158w).
0.85::acc(s4, tip_tail_width_size_158w).
0.97::true_val(tip_tail_width_size_158w, v31_0); 0.03::true_val(tip_tail_width_size_158w, unk_ttw_158w).
measured(s1, tip_tail_width_size_158w, v31_0).
measured(s4, tip_tail_width_size_158w, v31_0).
all_consistent(tip_tail_width_size_158w) :- consistent(s1, tip_tail_width_size_158w), (indep(s4), consistent(s4, tip_tail_width_size_158w) ; \+indep(s4)).
evidence(all_consistent(tip_tail_width_size_158w)).
query(true_val(tip_tail_width_size_158w, v31_0)).
query(true_val(tip_tail_width_size_158w, unk_ttw_158w)).

% @attr recommended_weight_range_size_158w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (158W)
% @unit kg
% @values w82_100=82_100kg unk_rwr_158w=Unknown
% @importance 0.95

0.85::acc(s4, recommended_weight_range_size_158w).
0.81::true_val(recommended_weight_range_size_158w, w82_100); 0.19::true_val(recommended_weight_range_size_158w, unk_rwr_158w).
measured(s4, recommended_weight_range_size_158w, w82_100).
all_consistent(recommended_weight_range_size_158w) :- (indep(s4), consistent(s4, recommended_weight_range_size_158w) ; \+indep(s4)).
evidence(all_consistent(recommended_weight_range_size_158w)).
query(true_val(recommended_weight_range_size_158w, w82_100)).
query(true_val(recommended_weight_range_size_158w, unk_rwr_158w)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v471_20=471.20 unk_price_usd=Unknown
% @importance 1.0

0.90::acc(s1, price_usd_msrp).
0.88::true_val(price_usd_msrp, v471_20); 0.12::true_val(price_usd_msrp, unk_price_usd).
measured(s1, price_usd_msrp, v471_20).
all_consistent(price_usd_msrp) :- consistent(s1, price_usd_msrp).
evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v471_20)).
query(true_val(price_usd_msrp, unk_price_usd)).

% @attr price_getboards
% @type categorical
% @canonical false
% @original_name Getboards.com original price (2024)
% @unit USD
% @values msrp_589_sale_471=MSRP_589_sale_471_20 unk_price_getboards=Unknown
% @importance 0.90

0.85::acc(s34, price_getboards).
0.83::true_val(price_getboards, msrp_589_sale_471); 0.17::true_val(price_getboards, unk_price_getboards).
measured(s34, price_getboards, msrp_589_sale_471).
all_consistent(price_getboards) :- consistent(s34, price_getboards).
evidence(all_consistent(price_getboards)).
query(true_val(price_getboards, msrp_589_sale_471)).
query(true_val(price_getboards, unk_price_getboards)).

% @attr price_baker_street_2026
% @type numeric
% @canonical false
% @original_name Baker Street Snow price (2026 model)
% @unit USD
% @values v589=589.0 unk_price_baker=Unknown
% @importance 0.70

0.78::acc(s35, price_baker_street_2026).
0.72::true_val(price_baker_street_2026, v589); 0.28::true_val(price_baker_street_2026, unk_price_baker).
measured(s35, price_baker_street_2026, v589).
all_consistent(price_baker_street_2026) :- consistent(s35, price_baker_street_2026).
evidence(all_consistent(price_baker_street_2026)).
query(true_val(price_baker_street_2026, v589)).
query(true_val(price_baker_street_2026, unk_price_baker)).

% @attr price_aud_merchant
% @type categorical
% @canonical true
% @original_name price_aud_merchant
% @unit AUD
% @values aud_599_99_rrp_999_99=AUD_599_99_sale_RRP_999_99 unk_price_aud=Unknown
% @importance 0.95

0.88::acc(s4, price_aud_merchant).
0.84::true_val(price_aud_merchant, aud_599_99_rrp_999_99); 0.16::true_val(price_aud_merchant, unk_price_aud).
measured(s4, price_aud_merchant, aud_599_99_rrp_999_99).
all_consistent(price_aud_merchant) :- (indep(s4), consistent(s4, price_aud_merchant) ; \+indep(s4)).
evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, aud_599_99_rrp_999_99)).
query(true_val(price_aud_merchant, unk_price_aud)).

% @attr price_ebay
% @type categorical
% @canonical false
% @original_name eBay price (via Dreamruns, 2024 model)
% @values available_34_35_mo=Available_approx_34_35_per_month_12mo unk_price_ebay=Unknown
% @importance 0.60

0.72::acc(s36, price_ebay).
0.65::true_val(price_ebay, available_34_35_mo); 0.35::true_val(price_ebay, unk_price_ebay).
measured(s36, price_ebay, available_34_35_mo).
all_consistent(price_ebay) :- (indep(s36), consistent(s36, price_ebay) ; \+indep(s36)).
evidence(all_consistent(price_ebay)).
query(true_val(price_ebay, available_34_35_mo)).
query(true_val(price_ebay, unk_price_ebay)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values available_amazon_2025=Available_on_Amazon_2025_model unk_availability=Unknown
% @importance 0.60

0.75::acc(s37, availability_status).
0.70::true_val(availability_status, available_amazon_2025); 0.30::true_val(availability_status, unk_availability).
measured(s37, availability_status, available_amazon_2025).
all_consistent(availability_status) :- consistent(s37, availability_status).
evidence(all_consistent(availability_status)).
query(true_val(availability_status, available_amazon_2025)).
query(true_val(availability_status, unk_availability)).

% @attr availability_status_zumiez
% @type categorical
% @canonical false
% @original_name availability_status (Zumiez)
% @values listed_limited_detail=Listed_but_limited_details unk_avail_zumiez=Unknown
% @importance 0.50

0.65::acc(s38, availability_status_zumiez).
0.60::true_val(availability_status_zumiez, listed_limited_detail); 0.40::true_val(availability_status_zumiez, unk_avail_zumiez).
measured(s38, availability_status_zumiez, listed_limited_detail).
all_consistent(availability_status_zumiez) :- consistent(s38, availability_status_zumiez).
evidence(all_consistent(availability_status_zumiez)).
query(true_val(availability_status_zumiez, listed_limited_detail)).
query(true_val(availability_status_zumiez, unk_avail_zumiez)).

% @attr seller_academy_direct
% @type categorical
% @canonical false
% @original_name Seller (AcademySnowboards.com)
% @values excellent_service_small_brand=Excellent_customer_service_small_brand unk_seller_academy=Unknown
% @importance 0.675

0.85::acc(s2, seller_academy_direct).
0.78::acc(s39, seller_academy_direct).
0.93::true_val(seller_academy_direct, excellent_service_small_brand); 0.07::true_val(seller_academy_direct, unk_seller_academy).
measured(s2, seller_academy_direct, excellent_service_small_brand).
measured(s39, seller_academy_direct, excellent_service_small_brand).
all_consistent(seller_academy_direct) :- consistent(s2, seller_academy_direct), consistent(s39, seller_academy_direct).
evidence(all_consistent(seller_academy_direct)).
query(true_val(seller_academy_direct, excellent_service_small_brand)).
query(true_val(seller_academy_direct, unk_seller_academy)).

% @attr seller_getboards
% @type categorical
% @canonical false
% @original_name Seller (Getboards.com)
% @values authorized_30day_1yr=Authorized_dealer_30day_returns_1yr_warranty unk_seller_getboards=Unknown
% @importance 0.70

0.80::acc(s34, seller_getboards).
0.75::acc(s40, seller_getboards).
0.90::true_val(seller_getboards, authorized_30day_1yr); 0.10::true_val(seller_getboards, unk_seller_getboards).
measured(s34, seller_getboards, authorized_30day_1yr).
measured(s40, seller_getboards, authorized_30day_1yr).
all_consistent(seller_getboards) :- consistent(s34, seller_getboards), consistent(s40, seller_getboards).
evidence(all_consistent(seller_getboards)).
query(true_val(seller_getboards, authorized_30day_1yr)).
query(true_val(seller_getboards, unk_seller_getboards)).

% @attr seller_melbourne
% @type categorical
% @canonical false
% @original_name Seller (Melbourne Snowboard Centre)
% @values local_independent_au=Local_independent_AU_no_change_of_mind unk_seller_melb=Unknown
% @importance 0.95

0.85::acc(s4, seller_melbourne).
0.81::true_val(seller_melbourne, local_independent_au); 0.19::true_val(seller_melbourne, unk_seller_melb).
measured(s4, seller_melbourne, local_independent_au).
all_consistent(seller_melbourne) :- (indep(s4), consistent(s4, seller_melbourne) ; \+indep(s4)).
evidence(all_consistent(seller_melbourne)).
query(true_val(seller_melbourne, local_independent_au)).
query(true_val(seller_melbourne, unk_seller_melb)).

% @attr seller_blauer
% @type categorical
% @canonical false
% @original_name Seller (Blauer Board Shop)
% @values authorized_dealer=Authorized_snowboard_dealer unk_seller_blauer=Unknown
% @importance 0.85

0.78::acc(s32, seller_blauer).
0.73::true_val(seller_blauer, authorized_dealer); 0.27::true_val(seller_blauer, unk_seller_blauer).
measured(s32, seller_blauer, authorized_dealer).
all_consistent(seller_blauer) :- (indep(s32), consistent(s32, seller_blauer) ; \+indep(s32)).
evidence(all_consistent(seller_blauer)).
query(true_val(seller_blauer, authorized_dealer)).
query(true_val(seller_blauer, unk_seller_blauer)).

% @attr seller_dreamruns
% @type categorical
% @canonical false
% @original_name Seller (Dreamruns.com)
% @values retail_superstore_socal=5000sqft_retail_superstore_SoCal unk_seller_dreamruns=Unknown
% @importance 0.60

0.72::acc(s36, seller_dreamruns).
0.65::true_val(seller_dreamruns, retail_superstore_socal); 0.35::true_val(seller_dreamruns, unk_seller_dreamruns).
measured(s36, seller_dreamruns, retail_superstore_socal).
all_consistent(seller_dreamruns) :- (indep(s36), consistent(s36, seller_dreamruns) ; \+indep(s36)).
evidence(all_consistent(seller_dreamruns)).
query(true_val(seller_dreamruns, retail_superstore_socal)).
query(true_val(seller_dreamruns, unk_seller_dreamruns)).

% @attr seller_ebay_dreamruns
% @type categorical
% @canonical false
% @original_name Seller (eBay via Dreamruns)
% @values ebay_30day_buyer_pays=eBay_30day_returns_buyer_pays_shipping unk_seller_ebay=Unknown
% @importance 0.60

0.70::acc(s36, seller_ebay_dreamruns).
0.62::true_val(seller_ebay_dreamruns, ebay_30day_buyer_pays); 0.38::true_val(seller_ebay_dreamruns, unk_seller_ebay).
measured(s36, seller_ebay_dreamruns, ebay_30day_buyer_pays).
all_consistent(seller_ebay_dreamruns) :- (indep(s36), consistent(s36, seller_ebay_dreamruns) ; \+indep(s36)).
evidence(all_consistent(seller_ebay_dreamruns)).
query(true_val(seller_ebay_dreamruns, ebay_30day_buyer_pays)).
query(true_val(seller_ebay_dreamruns, unk_seller_ebay)).

% @attr seller_board_paradise
% @type categorical
% @canonical false
% @original_name Seller (Board Paradise)
% @values authorized_personal_knowledge=Authorized_dealer_personal_brand_knowledge unk_seller_bp=Unknown
% @importance 0.50

0.72::acc(s41, seller_board_paradise).
0.66::true_val(seller_board_paradise, authorized_personal_knowledge); 0.34::true_val(seller_board_paradise, unk_seller_bp).
measured(s41, seller_board_paradise, authorized_personal_knowledge).
all_consistent(seller_board_paradise) :- consistent(s41, seller_board_paradise).
evidence(all_consistent(seller_board_paradise)).
query(true_val(seller_board_paradise, authorized_personal_knowledge)).
query(true_val(seller_board_paradise, unk_seller_bp)).

% @attr seller_baker_street
% @type categorical
% @canonical false
% @original_name Seller (Baker Street Snow)
% @values specialty_retailer=Specialty_snowboard_retailer unk_seller_baker=Unknown
% @importance 0.70

0.75::acc(s35, seller_baker_street).
0.68::true_val(seller_baker_street, specialty_retailer); 0.32::true_val(seller_baker_street, unk_seller_baker).
measured(s35, seller_baker_street, specialty_retailer).
all_consistent(seller_baker_street) :- consistent(s35, seller_baker_street).
evidence(all_consistent(seller_baker_street)).
query(true_val(seller_baker_street, specialty_retailer)).
query(true_val(seller_baker_street, unk_seller_baker)).

% @attr seller_amazon
% @type categorical
% @canonical false
% @original_name Seller (Amazon)
% @values academy_storefront=ACADEMY_SNOWBOARD_CO_storefront unk_seller_amazon=Unknown
% @importance 0.60

0.75::acc(s37, seller_amazon).
0.70::true_val(seller_amazon, academy_storefront); 0.30::true_val(seller_amazon, unk_seller_amazon).
measured(s37, seller_amazon, academy_storefront).
all_consistent(seller_amazon) :- consistent(s37, seller_amazon).
evidence(all_consistent(seller_amazon)).
query(true_val(seller_amazon, academy_storefront)).
query(true_val(seller_amazon, unk_seller_amazon)).

% @attr seller_zumiez
% @type categorical
% @canonical false
% @original_name Seller (Zumiez)
% @values leading_action_sports=Leading_specialty_action_sports_retailer unk_seller_zumiez=Unknown
% @importance 0.50

0.72::acc(s38, seller_zumiez).
0.66::true_val(seller_zumiez, leading_action_sports); 0.34::true_val(seller_zumiez, unk_seller_zumiez).
measured(s38, seller_zumiez, leading_action_sports).
all_consistent(seller_zumiez) :- consistent(s38, seller_zumiez).
evidence(all_consistent(seller_zumiez)).
query(true_val(seller_zumiez, leading_action_sports)).
query(true_val(seller_zumiez, unk_seller_zumiez)).

% @attr seller_modern_skate
% @type categorical
% @canonical false
% @original_name Seller (Modern Skate & Surf)
% @values modern_skate_retailer=Modern_Skate_and_Surf unk_seller_modern=Unknown
% @importance 0.50

0.70::acc(s27, seller_modern_skate).
0.62::true_val(seller_modern_skate, modern_skate_retailer); 0.38::true_val(seller_modern_skate, unk_seller_modern).
measured(s27, seller_modern_skate, modern_skate_retailer).
all_consistent(seller_modern_skate) :- (indep(s27), consistent(s27, seller_modern_skate) ; \+indep(s27)).
evidence(all_consistent(seller_modern_skate)).
query(true_val(seller_modern_skate, modern_skate_retailer)).
query(true_val(seller_modern_skate, unk_seller_modern)).

% @attr seller_tactics
% @type categorical
% @canonical false
% @original_name Seller (Tactics)
% @values reputable_retailer=Reputable_snowboard_retailer unk_seller_tactics=Unknown
% @importance 0.60

0.78::acc(s42, seller_tactics).
0.72::true_val(seller_tactics, reputable_retailer); 0.28::true_val(seller_tactics, unk_seller_tactics).
measured(s42, seller_tactics, reputable_retailer).
all_consistent(seller_tactics) :- consistent(s42, seller_tactics).
evidence(all_consistent(seller_tactics)).
query(true_val(seller_tactics, reputable_retailer)).
query(true_val(seller_tactics, unk_seller_tactics)).

% @attr distributor_uk_eu
% @type categorical
% @canonical false
% @original_name UK/European distributor
% @values maxtrack=Maxtrack_Distribution unk_distributor=Unknown
% @importance 0.40

0.75::acc(s43, distributor_uk_eu).
0.68::true_val(distributor_uk_eu, maxtrack); 0.32::true_val(distributor_uk_eu, unk_distributor).
measured(s43, distributor_uk_eu, maxtrack).
all_consistent(distributor_uk_eu) :- (indep(s43), consistent(s43, distributor_uk_eu) ; \+indep(s43)).
evidence(all_consistent(distributor_uk_eu)).
query(true_val(distributor_uk_eu, maxtrack)).
query(true_val(distributor_uk_eu, unk_distributor)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.95

0.90::acc(s4, gender).
0.86::true_val(gender, mens); 0.14::true_val(gender, unk_gender).
measured(s4, gender, mens).
all_consistent(gender) :- (indep(s4), consistent(s4, gender) ; \+indep(s4)).
evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate_advanced_park=Intermediate_to_advanced_park_riders unk_rider_level=Unknown
% @importance 0.90

0.85::acc(s4, rider_level).
0.82::acc(s30, rider_level).
0.93::true_val(rider_level, intermediate_advanced_park); 0.07::true_val(rider_level, unk_rider_level).
measured(s4, rider_level, intermediate_advanced_park).
measured(s30, rider_level, intermediate_advanced_park).
all_consistent(rider_level) :- (indep(s4), consistent(s4, rider_level) ; \+indep(s4)), consistent(s30, rider_level).
evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate_advanced_park)).
query(true_val(rider_level, unk_rider_level)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values park_freestyle_camber_pop=Park_freestyle_riders_wanting_camber_pop_stability unk_skill_rec=Unknown
% @importance 0.80

0.85::acc(s3, skill_level_recommendation).
0.80::acc(s29, skill_level_recommendation).
0.92::true_val(skill_level_recommendation, park_freestyle_camber_pop); 0.08::true_val(skill_level_recommendation, unk_skill_rec).
measured(s3, skill_level_recommendation, park_freestyle_camber_pop).
measured(s29, skill_level_recommendation, park_freestyle_camber_pop).
all_consistent(skill_level_recommendation) :- (indep(s3), consistent(s3, skill_level_recommendation) ; \+indep(s3)), consistent(s29, skill_level_recommendation).
evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, park_freestyle_camber_pop)).
query(true_val(skill_level_recommendation, unk_skill_rec)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect (Beginners)
% @values not_for_beginners=Beginners_trying_to_learn_basics unk_negative_aspect=Unknown
% @importance 0.85

0.82::acc(s30, negative_aspect).
0.80::true_val(negative_aspect, not_for_beginners); 0.20::true_val(negative_aspect, unk_negative_aspect).
measured(s30, negative_aspect, not_for_beginners).
all_consistent(negative_aspect) :- consistent(s30, negative_aspect).
evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, not_for_beginners)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_large_jumps
% @type categorical
% @canonical false
% @original_name negative_aspect (Large jump lines)
% @values not_best_large_jumps=Large_jump_lines_better_for_technical_rail unk_neg_jumps=Unknown
% @importance 0.90

0.88::acc(s24, negative_aspect_large_jumps).
0.85::true_val(negative_aspect_large_jumps, not_best_large_jumps); 0.15::true_val(negative_aspect_large_jumps, unk_neg_jumps).
measured(s24, negative_aspect_large_jumps, not_best_large_jumps).
all_consistent(negative_aspect_large_jumps) :- consistent(s24, negative_aspect_large_jumps).
evidence(all_consistent(negative_aspect_large_jumps)).
query(true_val(negative_aspect_large_jumps, not_best_large_jumps)).
query(true_val(negative_aspect_large_jumps, unk_neg_jumps)).

% @attr negative_aspect_backcountry
% @type categorical
% @canonical false
% @original_name negative_aspect (Backcountry)
% @values not_for_backcountry=Backcountry_deep_powder_camber_lacks_float unk_neg_bc=Unknown
% @importance 0.85

0.85::acc(s44, negative_aspect_backcountry).
0.82::true_val(negative_aspect_backcountry, not_for_backcountry); 0.18::true_val(negative_aspect_backcountry, unk_neg_bc).
measured(s44, negative_aspect_backcountry, not_for_backcountry).
all_consistent(negative_aspect_backcountry) :- consistent(s44, negative_aspect_backcountry).
evidence(all_consistent(negative_aspect_backcountry)).
query(true_val(negative_aspect_backcountry, not_for_backcountry)).
query(true_val(negative_aspect_backcountry, unk_neg_bc)).

% @attr negative_aspect_tree_riding
% @type categorical
% @canonical false
% @original_name negative_aspect (Tree riding)
% @values not_quickest_edge_trees=Tree_riding_not_quickest_edge_to_edge unk_neg_trees=Unknown
% @importance 0.85

0.85::acc(s44, negative_aspect_tree_riding).
0.82::true_val(negative_aspect_tree_riding, not_quickest_edge_trees); 0.18::true_val(negative_aspect_tree_riding, unk_neg_trees).
measured(s44, negative_aspect_tree_riding, not_quickest_edge_trees).
all_consistent(negative_aspect_tree_riding) :- consistent(s44, negative_aspect_tree_riding).
evidence(all_consistent(negative_aspect_tree_riding)).
query(true_val(negative_aspect_tree_riding, not_quickest_edge_trees)).
query(true_val(negative_aspect_tree_riding, unk_neg_trees)).

% @attr pop
% @type categorical
% @canonical true
% @original_name pop
% @values excellent=Excellent_lots_of_pop_poppy_takeoffs unk_pop=Unknown
% @importance 0.825

0.82::acc(s15, pop).
0.83::acc(s45, pop).
0.93::true_val(pop, excellent); 0.07::true_val(pop, unk_pop).
measured(s15, pop, excellent).
measured(s45, pop, excellent).
all_consistent(pop) :- consistent(s15, pop), consistent(s45, pop).
evidence(all_consistent(pop)).
query(true_val(pop, excellent)).
query(true_val(pop, unk_pop)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect (Rails)
% @values excels_rails_micro_camber=Excels_on_rails_street_features_micro_camber_locks unk_positive_aspect=Unknown
% @importance 0.85

0.82::acc(s15, positive_aspect).
0.88::acc(s24, positive_aspect).
0.93::true_val(positive_aspect, excels_rails_micro_camber); 0.07::true_val(positive_aspect, unk_positive_aspect).
measured(s15, positive_aspect, excels_rails_micro_camber).
measured(s24, positive_aspect, excels_rails_micro_camber).
all_consistent(positive_aspect) :- consistent(s15, positive_aspect), consistent(s24, positive_aspect).
evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, excels_rails_micro_camber)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values superb_knife_edge=Superb_holds_edge_like_knife_vario_contact unk_edge_hold=Unknown
% @importance 0.825

0.85::acc(s44, edge_hold).
0.80::acc(s15, edge_hold).
0.93::true_val(edge_hold, superb_knife_edge); 0.07::true_val(edge_hold, unk_edge_hold).
measured(s44, edge_hold, superb_knife_edge).
measured(s15, edge_hold, superb_knife_edge).
all_consistent(edge_hold) :- consistent(s44, edge_hold), consistent(s15, edge_hold).
evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, superb_knife_edge)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr positive_aspect_carving
% @type categorical
% @canonical false
% @original_name positive_aspect (Carving)
% @values noteworthy_responsive_fun=Noteworthy_responsive_edge_to_edge_fun_to_carve unk_pos_carve=Unknown
% @importance 0.80

0.80::acc(s15, positive_aspect_carving).
0.74::true_val(positive_aspect_carving, noteworthy_responsive_fun); 0.26::true_val(positive_aspect_carving, unk_pos_carve).
measured(s15, positive_aspect_carving, noteworthy_responsive_fun).
all_consistent(positive_aspect_carving) :- consistent(s15, positive_aspect_carving).
evidence(all_consistent(positive_aspect_carving)).
query(true_val(positive_aspect_carving, noteworthy_responsive_fun)).
query(true_val(positive_aspect_carving, unk_pos_carve)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values dream_true_twin=True_twin_makes_switch_riding_a_dream unk_switch=Unknown
% @importance 0.85

0.82::acc(s45, switch_riding).
0.78::true_val(switch_riding, dream_true_twin); 0.22::true_val(switch_riding, unk_switch).
measured(s45, switch_riding, dream_true_twin).
all_consistent(switch_riding) :- consistent(s45, switch_riding).
evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, dream_true_twin)).
query(true_val(switch_riding, unk_switch)).

% @attr positive_aspect_swing_weight
% @type categorical
% @canonical false
% @original_name positive_aspect (Swing weight)
% @values feels_very_low_spin_easy=Feels_very_low_spinning_is_easy unk_pos_swing=Unknown
% @importance 0.85

0.82::acc(s45, positive_aspect_swing_weight).
0.78::true_val(positive_aspect_swing_weight, feels_very_low_spin_easy); 0.22::true_val(positive_aspect_swing_weight, unk_pos_swing).
measured(s45, positive_aspect_swing_weight, feels_very_low_spin_easy).
all_consistent(positive_aspect_swing_weight) :- consistent(s45, positive_aspect_swing_weight).
evidence(all_consistent(positive_aspect_swing_weight)).
query(true_val(positive_aspect_swing_weight, feels_very_low_spin_easy)).
query(true_val(positive_aspect_swing_weight, unk_pos_swing)).

% @attr positive_aspect_stability
% @type categorical
% @canonical false
% @original_name positive_aspect (High speed stability)
% @values holds_well_high_speed=Holds_well_high_speed_micro_camber_stabilisers unk_pos_stab=Unknown
% @importance 0.85

0.85::acc(s44, positive_aspect_stability).
0.82::true_val(positive_aspect_stability, holds_well_high_speed); 0.18::true_val(positive_aspect_stability, unk_pos_stab).
measured(s44, positive_aspect_stability, holds_well_high_speed).
all_consistent(positive_aspect_stability) :- consistent(s44, positive_aspect_stability).
evidence(all_consistent(positive_aspect_stability)).
query(true_val(positive_aspect_stability, holds_well_high_speed)).
query(true_val(positive_aspect_stability, unk_pos_stab)).

% @attr positive_aspect_butters
% @type categorical
% @canonical false
% @original_name positive_aspect (Butters/Presses)
% @values presses_nicely=Board_presses_butters_nicely_nose_tail_ease unk_pos_butter=Unknown
% @importance 0.775

0.80::acc(s39, positive_aspect_butters).
0.86::acc(s24, positive_aspect_butters).
0.92::true_val(positive_aspect_butters, presses_nicely); 0.08::true_val(positive_aspect_butters, unk_pos_butter).
measured(s39, positive_aspect_butters, presses_nicely).
measured(s24, positive_aspect_butters, presses_nicely).
all_consistent(positive_aspect_butters) :- consistent(s39, positive_aspect_butters), consistent(s24, positive_aspect_butters).
evidence(all_consistent(positive_aspect_butters)).
query(true_val(positive_aspect_butters, presses_nicely)).
query(true_val(positive_aspect_butters, unk_pos_butter)).

% @attr positive_aspect_dampening
% @type categorical
% @canonical false
% @original_name positive_aspect (Dampening)
% @values absorbs_flat_landings=Dampening_absorbs_flat_landings_well unk_pos_damp=Unknown
% @importance 0.85

0.82::acc(s45, positive_aspect_dampening).
0.78::true_val(positive_aspect_dampening, absorbs_flat_landings); 0.22::true_val(positive_aspect_dampening, unk_pos_damp).
measured(s45, positive_aspect_dampening, absorbs_flat_landings).
all_consistent(positive_aspect_dampening) :- consistent(s45, positive_aspect_dampening).
evidence(all_consistent(positive_aspect_dampening)).
query(true_val(positive_aspect_dampening, absorbs_flat_landings)).
query(true_val(positive_aspect_dampening, unk_pos_damp)).

% @attr positive_aspect_build
% @type categorical
% @canonical false
% @original_name positive_aspect (Build quality)
% @values very_solid_bomber_build=Very_solid_feel_bomber_build unk_pos_build=Unknown
% @importance 0.75

0.82::acc(s45, positive_aspect_build).
0.78::acc(s39, positive_aspect_build).
0.92::true_val(positive_aspect_build, very_solid_bomber_build); 0.08::true_val(positive_aspect_build, unk_pos_build).
measured(s45, positive_aspect_build, very_solid_bomber_build).
measured(s39, positive_aspect_build, very_solid_bomber_build).
all_consistent(positive_aspect_build) :- consistent(s45, positive_aspect_build), consistent(s39, positive_aspect_build).
evidence(all_consistent(positive_aspect_build)).
query(true_val(positive_aspect_build, very_solid_bomber_build)).
query(true_val(positive_aspect_build, unk_pos_build)).

% @attr positive_aspect_value
% @type categorical
% @canonical false
% @original_name positive_aspect (Value)
% @values great_tech_great_value=Chock_full_of_great_tech_great_overall_value unk_pos_value=Unknown
% @importance 0.85

0.82::acc(s45, positive_aspect_value).
0.78::true_val(positive_aspect_value, great_tech_great_value); 0.22::true_val(positive_aspect_value, unk_pos_value).
measured(s45, positive_aspect_value, great_tech_great_value).
all_consistent(positive_aspect_value) :- consistent(s45, positive_aspect_value).
evidence(all_consistent(positive_aspect_value)).
query(true_val(positive_aspect_value, great_tech_great_value)).
query(true_val(positive_aspect_value, unk_pos_value)).

% @attr overall_user_rating
% @type categorical
% @canonical false
% @original_name Overall user rating (manufacturer site)
% @values five_star_100pct_10reviews=100pct_5star_10_reviews unk_user_rating=Unknown
% @importance 1.0

0.78::acc(s1, overall_user_rating).
0.76::true_val(overall_user_rating, five_star_100pct_10reviews); 0.24::true_val(overall_user_rating, unk_user_rating).
measured(s1, overall_user_rating, five_star_100pct_10reviews).
all_consistent(overall_user_rating) :- consistent(s1, overall_user_rating).
evidence(all_consistent(overall_user_rating)).
query(true_val(overall_user_rating, five_star_100pct_10reviews)).
query(true_val(overall_user_rating, unk_user_rating)).

% @attr negative_aspect_air_stability
% @type categorical
% @canonical false
% @original_name negative_aspect (Air stability)
% @values squirrely_wash_out=If_squirrely_in_air_expect_wash_out_or_bucked unk_neg_air=Unknown
% @importance 0.85

0.82::acc(s45, negative_aspect_air_stability).
0.78::true_val(negative_aspect_air_stability, squirrely_wash_out); 0.22::true_val(negative_aspect_air_stability, unk_neg_air).
measured(s45, negative_aspect_air_stability, squirrely_wash_out).
all_consistent(negative_aspect_air_stability) :- consistent(s45, negative_aspect_air_stability).
evidence(all_consistent(negative_aspect_air_stability)).
query(true_val(negative_aspect_air_stability, squirrely_wash_out)).
query(true_val(negative_aspect_air_stability, unk_neg_air)).

% @attr negative_aspect_powder
% @type categorical
% @canonical false
% @original_name negative_aspect (Powder)
% @values not_park_board_strength=Not_where_park_board_excels unk_neg_powder=Unknown
% @importance 0.85

0.85::acc(s44, negative_aspect_powder).
0.82::true_val(negative_aspect_powder, not_park_board_strength); 0.18::true_val(negative_aspect_powder, unk_neg_powder).
measured(s44, negative_aspect_powder, not_park_board_strength).
all_consistent(negative_aspect_powder) :- consistent(s44, negative_aspect_powder).
evidence(all_consistent(negative_aspect_powder)).
query(true_val(negative_aspect_powder, not_park_board_strength)).
query(true_val(negative_aspect_powder, unk_neg_powder)).

% @attr negative_aspect_all_conditions
% @type categorical
% @canonical false
% @original_name negative_aspect (All conditions)
% @values not_everyday_board=Not_ideal_everyday_all_conditions_board unk_neg_allcond=Unknown
% @importance 0.85

0.82::acc(s45, negative_aspect_all_conditions).
0.78::true_val(negative_aspect_all_conditions, not_everyday_board); 0.22::true_val(negative_aspect_all_conditions, unk_neg_allcond).
measured(s45, negative_aspect_all_conditions, not_everyday_board).
all_consistent(negative_aspect_all_conditions) :- consistent(s45, negative_aspect_all_conditions).
evidence(all_consistent(negative_aspect_all_conditions)).
query(true_val(negative_aspect_all_conditions, not_everyday_board)).
query(true_val(negative_aspect_all_conditions, unk_neg_allcond)).

% @attr comparable_board_cross_brand_gang_plank
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Rome Gang Plank)
% @values rome_gang_plank=Rome_Gang_Plank_true_twin_medium_flex_rocker unk_comp_gp=Unknown
% @importance 0.575

0.80::acc(s46, comparable_board_cross_brand_gang_plank).
0.75::acc(s47, comparable_board_cross_brand_gang_plank).
0.90::true_val(comparable_board_cross_brand_gang_plank, rome_gang_plank); 0.10::true_val(comparable_board_cross_brand_gang_plank, unk_comp_gp).
measured(s46, comparable_board_cross_brand_gang_plank, rome_gang_plank).
measured(s47, comparable_board_cross_brand_gang_plank, rome_gang_plank).
all_consistent(comparable_board_cross_brand_gang_plank) :- consistent(s46, comparable_board_cross_brand_gang_plank), consistent(s47, comparable_board_cross_brand_gang_plank).
evidence(all_consistent(comparable_board_cross_brand_gang_plank)).
query(true_val(comparable_board_cross_brand_gang_plank, rome_gang_plank)).
query(true_val(comparable_board_cross_brand_gang_plank, unk_comp_gp)).

% @attr comparable_board_cross_brand_indoor_survival
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Capita Indoor Survival)
% @values capita_indoor_survival=Capita_Indoor_Survival_park_v1_camber_sintered unk_comp_is=Unknown
% @importance 0.50

0.78::acc(s48, comparable_board_cross_brand_indoor_survival).
0.72::acc(s49, comparable_board_cross_brand_indoor_survival).
0.88::true_val(comparable_board_cross_brand_indoor_survival, capita_indoor_survival); 0.12::true_val(comparable_board_cross_brand_indoor_survival, unk_comp_is).
measured(s48, comparable_board_cross_brand_indoor_survival, capita_indoor_survival).
measured(s49, comparable_board_cross_brand_indoor_survival, capita_indoor_survival).
all_consistent(comparable_board_cross_brand_indoor_survival) :- consistent(s48, comparable_board_cross_brand_indoor_survival), consistent(s49, comparable_board_cross_brand_indoor_survival).
evidence(all_consistent(comparable_board_cross_brand_indoor_survival)).
query(true_val(comparable_board_cross_brand_indoor_survival, capita_indoor_survival)).
query(true_val(comparable_board_cross_brand_indoor_survival, unk_comp_is)).

% @attr comparable_board_cross_brand_ride_kink
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Ride Kink)
% @values ride_kink=Ride_Kink_comparable_park_freestyle_twin unk_comp_rk=Unknown
% @importance 0.70

0.72::acc(s50, comparable_board_cross_brand_ride_kink).
0.65::true_val(comparable_board_cross_brand_ride_kink, ride_kink); 0.35::true_val(comparable_board_cross_brand_ride_kink, unk_comp_rk).
measured(s50, comparable_board_cross_brand_ride_kink, ride_kink).
all_consistent(comparable_board_cross_brand_ride_kink) :- consistent(s50, comparable_board_cross_brand_ride_kink).
evidence(all_consistent(comparable_board_cross_brand_ride_kink)).
query(true_val(comparable_board_cross_brand_ride_kink, ride_kink)).
query(true_val(comparable_board_cross_brand_ride_kink, unk_comp_rk)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand (CAPiTA DOA)
% @values capita_doa=CAPiTA_DOA_safest_park_recommendation_poppy unk_comp_cross=Unknown
% @importance 0.60

0.78::acc(s51, comparable_board_cross_brand).
0.72::true_val(comparable_board_cross_brand, capita_doa); 0.28::true_val(comparable_board_cross_brand, unk_comp_cross).
measured(s51, comparable_board_cross_brand, capita_doa).
all_consistent(comparable_board_cross_brand) :- consistent(s51, comparable_board_cross_brand).
evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, capita_doa)).
query(true_val(comparable_board_cross_brand, unk_comp_cross)).

% @attr comparable_board_cross_brand_burton_custom
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Burton Custom)
% @values burton_custom=Burton_Custom_PropaCamba_more_predictable_fun unk_comp_bc=Unknown
% @importance 0.85

0.82::acc(s30, comparable_board_cross_brand_burton_custom).
0.80::true_val(comparable_board_cross_brand_burton_custom, burton_custom); 0.20::true_val(comparable_board_cross_brand_burton_custom, unk_comp_bc).
measured(s30, comparable_board_cross_brand_burton_custom, burton_custom).
all_consistent(comparable_board_cross_brand_burton_custom) :- consistent(s30, comparable_board_cross_brand_burton_custom).
evidence(all_consistent(comparable_board_cross_brand_burton_custom)).
query(true_val(comparable_board_cross_brand_burton_custom, burton_custom)).
query(true_val(comparable_board_cross_brand_burton_custom, unk_comp_bc)).

% @attr comparable_board_cross_brand_libtech_box_knife
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (LibTech Box Knife)
% @values libtech_box_knife=LibTech_Box_Knife_too_loose_vs_PropaCamba unk_comp_lb=Unknown
% @importance 0.85

0.82::acc(s30, comparable_board_cross_brand_libtech_box_knife).
0.80::true_val(comparable_board_cross_brand_libtech_box_knife, libtech_box_knife); 0.20::true_val(comparable_board_cross_brand_libtech_box_knife, unk_comp_lb).
measured(s30, comparable_board_cross_brand_libtech_box_knife, libtech_box_knife).
all_consistent(comparable_board_cross_brand_libtech_box_knife) :- consistent(s30, comparable_board_cross_brand_libtech_box_knife).
evidence(all_consistent(comparable_board_cross_brand_libtech_box_knife)).
query(true_val(comparable_board_cross_brand_libtech_box_knife, libtech_box_knife)).
query(true_val(comparable_board_cross_brand_libtech_box_knife, unk_comp_lb)).

% @attr comparable_board_cross_brand_price_comparison
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Price comparison)
% @values propacamba_589_vs_doa_440=PropaCamba_589_MSRP_vs_DOA_440_GoodWood2019 unk_comp_price=Unknown
% @importance 0.75

0.80::acc(s25, comparable_board_cross_brand_price_comparison).
0.76::true_val(comparable_board_cross_brand_price_comparison, propacamba_589_vs_doa_440); 0.24::true_val(comparable_board_cross_brand_price_comparison, unk_comp_price).
measured(s25, comparable_board_cross_brand_price_comparison, propacamba_589_vs_doa_440).
all_consistent(comparable_board_cross_brand_price_comparison) :- consistent(s25, comparable_board_cross_brand_price_comparison).
evidence(all_consistent(comparable_board_cross_brand_price_comparison)).
query(true_val(comparable_board_cross_brand_price_comparison, propacamba_589_vs_doa_440)).
query(true_val(comparable_board_cross_brand_price_comparison, unk_comp_price)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand (Propaganda)
% @values propaganda=Propaganda_flat_camber_cost_effective_forgiving unk_comp_same=Unknown
% @importance 0.70

0.82::acc(s2, comparable_board_same_brand).
0.80::acc(s29, comparable_board_same_brand).
0.92::true_val(comparable_board_same_brand, propaganda); 0.08::true_val(comparable_board_same_brand, unk_comp_same).
measured(s2, comparable_board_same_brand, propaganda).
measured(s29, comparable_board_same_brand, propaganda).
all_consistent(comparable_board_same_brand) :- consistent(s2, comparable_board_same_brand), consistent(s29, comparable_board_same_brand).
evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, propaganda)).
query(true_val(comparable_board_same_brand, unk_comp_same)).

% @attr comparable_board_same_brand_graduate
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Graduate)
% @values graduate=Graduate_directional_twin_camber_early_rise_all_mtn unk_comp_grad=Unknown
% @importance 0.70

0.82::acc(s2, comparable_board_same_brand_graduate).
0.79::true_val(comparable_board_same_brand_graduate, graduate); 0.21::true_val(comparable_board_same_brand_graduate, unk_comp_grad).
measured(s2, comparable_board_same_brand_graduate, graduate).
all_consistent(comparable_board_same_brand_graduate) :- consistent(s2, comparable_board_same_brand_graduate).
evidence(all_consistent(comparable_board_same_brand_graduate)).
query(true_val(comparable_board_same_brand_graduate, graduate)).
query(true_val(comparable_board_same_brand_graduate, unk_comp_grad)).

% @attr comparable_board_same_brand_masters
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Masters)
% @values masters=Masters_directional_all_mtn_freeride_639 unk_comp_mast=Unknown
% @importance 0.90

0.82::acc(s34, comparable_board_same_brand_masters).
0.80::true_val(comparable_board_same_brand_masters, masters); 0.20::true_val(comparable_board_same_brand_masters, unk_comp_mast).
measured(s34, comparable_board_same_brand_masters, masters).
all_consistent(comparable_board_same_brand_masters) :- consistent(s34, comparable_board_same_brand_masters).
evidence(all_consistent(comparable_board_same_brand_masters)).
query(true_val(comparable_board_same_brand_masters, masters)).
query(true_val(comparable_board_same_brand_masters, unk_comp_mast)).

% @attr comparable_board_same_brand_hybrid
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Hybrid 2.0)
% @values hybrid_2_0=Hybrid_2_0_directional_hybrid_twin_camber_rocker unk_comp_hyb=Unknown
% @importance 0.70

0.82::acc(s2, comparable_board_same_brand_hybrid).
0.79::true_val(comparable_board_same_brand_hybrid, hybrid_2_0); 0.21::true_val(comparable_board_same_brand_hybrid, unk_comp_hyb).
measured(s2, comparable_board_same_brand_hybrid, hybrid_2_0).
all_consistent(comparable_board_same_brand_hybrid) :- consistent(s2, comparable_board_same_brand_hybrid).
evidence(all_consistent(comparable_board_same_brand_hybrid)).
query(true_val(comparable_board_same_brand_hybrid, hybrid_2_0)).
query(true_val(comparable_board_same_brand_hybrid, unk_comp_hyb)).

% @attr available_colors
% @type categorical
% @canonical true
% @original_name available_colors
% @values random_not_selectable=Random_not_selectable unk_available_colors=Unknown
% @importance 0.925

0.88::acc(s4, available_colors).
0.85::acc(s3, available_colors).
0.95::true_val(available_colors, random_not_selectable); 0.05::true_val(available_colors, unk_available_colors).
measured(s4, available_colors, random_not_selectable).
measured(s3, available_colors, random_not_selectable).
all_consistent(available_colors) :- consistent(s4, available_colors), consistent(s3, available_colors).
evidence(all_consistent(available_colors)).
query(true_val(available_colors, random_not_selectable)).
query(true_val(available_colors, unk_available_colors)).

% @attr topsheet_appearance_description
% @type categorical
% @canonical true
% @original_name topsheet_appearance_description
% @values simplistic_graphics=Simplistic_graphics_and_artwork unk_topsheet_desc=Unknown
% @importance 0.50

0.75::acc(s41, topsheet_appearance_description).
0.68::true_val(topsheet_appearance_description, simplistic_graphics); 0.32::true_val(topsheet_appearance_description, unk_topsheet_desc).
measured(s41, topsheet_appearance_description, simplistic_graphics).
all_consistent(topsheet_appearance_description) :- consistent(s41, topsheet_appearance_description).
evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, simplistic_graphics)).
query(true_val(topsheet_appearance_description, unk_topsheet_desc)).

% @attr topsheet_appearance_description_finish
% @type categorical
% @canonical false
% @original_name topsheet_appearance_description (finish)
% @values matte_finished=Matte_finished unk_topsheet_finish=Unknown
% @importance 0.85

0.78::acc(s45, topsheet_appearance_description_finish).
0.73::true_val(topsheet_appearance_description_finish, matte_finished); 0.27::true_val(topsheet_appearance_description_finish, unk_topsheet_finish).
measured(s45, topsheet_appearance_description_finish, matte_finished).
all_consistent(topsheet_appearance_description_finish) :- consistent(s45, topsheet_appearance_description_finish).
evidence(all_consistent(topsheet_appearance_description_finish)).
query(true_val(topsheet_appearance_description_finish, matte_finished)).
query(true_val(topsheet_appearance_description_finish, unk_topsheet_finish)).

% @attr brand_first_year
% @type categorical
% @canonical false
% @original_name Brand first year
% @values y2002=2002 unk_brand_first_year=Unknown
% @importance 0.40

0.88::acc(s7, brand_first_year).
0.80::acc(s12, brand_first_year).
0.80::acc(s13, brand_first_year).
0.96::true_val(brand_first_year, y2002); 0.04::true_val(brand_first_year, unk_brand_first_year).
measured(s7, brand_first_year, y2002).
measured(s12, brand_first_year, y2002).
measured(s13, brand_first_year, y2002).
all_consistent(brand_first_year) :- consistent(s7, brand_first_year), consistent(s12, brand_first_year), consistent(s13, brand_first_year).
evidence(all_consistent(brand_first_year)).
query(true_val(brand_first_year, y2002)).
query(true_val(brand_first_year, unk_brand_first_year)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2018_2019=Available_since_2018_2019_season unk_model_first=Unknown
% @importance 0.90

0.88::acc(s24, model_first_available_year).
0.82::acc(s25, model_first_available_year).
0.93::true_val(model_first_available_year, season_2018_2019); 0.07::true_val(model_first_available_year, unk_model_first).
measured(s24, model_first_available_year, season_2018_2019).
measured(s25, model_first_available_year, season_2018_2019).
all_consistent(model_first_available_year) :- consistent(s24, model_first_available_year), consistent(s25, model_first_available_year).
evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2018_2019)).
query(true_val(model_first_available_year, unk_model_first)).

% @attr estimated_availability_date
% @type categorical
% @canonical false
% @original_name estimated_availability_date
% @values late_2023=Shipping_by_late_2023 unk_est_avail=Unknown
% @importance 0.40

0.75::acc(s52, estimated_availability_date).
0.72::true_val(estimated_availability_date, late_2023); 0.28::true_val(estimated_availability_date, unk_est_avail).
measured(s52, estimated_availability_date, late_2023).
all_consistent(estimated_availability_date) :- consistent(s52, estimated_availability_date).
evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, late_2023)).
query(true_val(estimated_availability_date, unk_est_avail)).

% @attr successor
% @type categorical
% @canonical false
% @original_name Successor
% @values y2025_2026_similar_pricing=2025_and_2026_models_similar_pricing_589 unk_successor=Unknown
% @importance 0.80

0.80::acc(s34, successor).
0.75::acc(s35, successor).
0.90::true_val(successor, y2025_2026_similar_pricing); 0.10::true_val(successor, unk_successor).
measured(s34, successor, y2025_2026_similar_pricing).
measured(s35, successor, y2025_2026_similar_pricing).
all_consistent(successor) :- consistent(s34, successor), consistent(s35, successor).
evidence(all_consistent(successor)).
query(true_val(successor, y2025_2026_similar_pricing)).
query(true_val(successor, unk_successor)).

% @attr board_evolution
% @type categorical
% @canonical false
% @original_name Board evolution
% @values largely_unchanged_yearly=Specs_construction_largely_unchanged_year_to_year unk_evolution=Unknown
% @importance 0.50

0.78::acc(s53, board_evolution).
0.72::true_val(board_evolution, largely_unchanged_yearly); 0.28::true_val(board_evolution, unk_evolution).
measured(s53, board_evolution, largely_unchanged_yearly).
all_consistent(board_evolution) :- consistent(s53, board_evolution).
evidence(all_consistent(board_evolution)).
query(true_val(board_evolution, largely_unchanged_yearly)).
query(true_val(board_evolution, unk_evolution)).

% @attr social_media_following
% @type categorical
% @canonical false
% @original_name Social media following
% @values instagram_24k=Approx_24K_Instagram_followers unk_social=Unknown
% @importance 0.40

0.72::acc(s23, social_media_following).
0.70::true_val(social_media_following, instagram_24k); 0.30::true_val(social_media_following, unk_social).
measured(s23, social_media_following, instagram_24k).
all_consistent(social_media_following) :- consistent(s23, social_media_following).
evidence(all_consistent(social_media_following)).
query(true_val(social_media_following, instagram_24k)).
query(true_val(social_media_following, unk_social)).

% @attr facebook_likes
% @type categorical
% @canonical false
% @original_name Facebook
% @values fb_5060_likes=Approx_5060_likes unk_facebook=Unknown
% @importance 0.20

0.75::acc(s54, facebook_likes).
0.73::true_val(facebook_likes, fb_5060_likes); 0.27::true_val(facebook_likes, unk_facebook).
measured(s54, facebook_likes, fb_5060_likes).
all_consistent(facebook_likes) :- consistent(s54, facebook_likes).
evidence(all_consistent(facebook_likes)).
query(true_val(facebook_likes, fb_5060_likes)).
query(true_val(facebook_likes, unk_facebook)).

% @attr customer_service_reputation
% @type categorical
% @canonical false
% @original_name Customer service reputation
% @values highly_praised_personal=Highly_praised_owners_personally_help unk_cs_rep=Unknown
% @importance 0.575

0.80::acc(s39, customer_service_reputation).
0.75::acc(s41, customer_service_reputation).
0.90::true_val(customer_service_reputation, highly_praised_personal); 0.10::true_val(customer_service_reputation, unk_cs_rep).
measured(s39, customer_service_reputation, highly_praised_personal).
measured(s41, customer_service_reputation, highly_praised_personal).
all_consistent(customer_service_reputation) :- consistent(s39, customer_service_reputation), consistent(s41, customer_service_reputation).
evidence(all_consistent(customer_service_reputation)).
query(true_val(customer_service_reputation, highly_praised_personal)).
query(true_val(customer_service_reputation, unk_cs_rep)).

% @attr brand_loyalty
% @type categorical
% @canonical false
% @original_name Brand loyalty
% @values multiple_repeat_buyers=Multiple_repeat_buyer_testimonials unk_brand_loyalty=Unknown
% @importance 0.625

0.78::acc(s2, brand_loyalty).
0.76::acc(s39, brand_loyalty).
0.88::true_val(brand_loyalty, multiple_repeat_buyers); 0.12::true_val(brand_loyalty, unk_brand_loyalty).
measured(s2, brand_loyalty, multiple_repeat_buyers).
measured(s39, brand_loyalty, multiple_repeat_buyers).
all_consistent(brand_loyalty) :- consistent(s2, brand_loyalty), consistent(s39, brand_loyalty).
evidence(all_consistent(brand_loyalty)).
query(true_val(brand_loyalty, multiple_repeat_buyers)).
query(true_val(brand_loyalty, unk_brand_loyalty)).

% @attr community_perception
% @type categorical
% @canonical false
% @original_name Community perception
% @values niche_cult_following_park=Niche_rider_owned_strong_cult_following_park unk_community=Unknown
% @importance 0.45

0.75::acc(s41, community_perception).
0.78::acc(s13, community_perception).
0.90::true_val(community_perception, niche_cult_following_park); 0.10::true_val(community_perception, unk_community).
measured(s41, community_perception, niche_cult_following_park).
measured(s13, community_perception, niche_cult_following_park).
all_consistent(community_perception) :- consistent(s41, community_perception), consistent(s13, community_perception).
evidence(all_consistent(community_perception)).
query(true_val(community_perception, niche_cult_following_park)).
query(true_val(community_perception, unk_community)).