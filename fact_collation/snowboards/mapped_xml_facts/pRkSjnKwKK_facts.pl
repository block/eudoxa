0.15::indep(s1).
0.20::indep(s2).
0.20::indep(s8).
0.25::indep(s9).
0.20::indep(s13).
0.20::indep(s14).
0.20::indep(s15).
0.15::indep(s16).
0.85::indep(s17).
0.20::indep(s18).
0.15::indep(s21).
0.20::indep(s22).
0.15::indep(s25).
0.25::indep(s26).
0.20::indep(s27).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

0.80::acc(s1, brand).
% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values nitro=Nitro unk_brand=Unknown
% @importance 0.90
0.95::true_val(brand, nitro); 0.05::true_val(brand, unk_brand).
measured(s1, brand, nitro).
all_consistent(brand) :- (indep(s1), consistent(s1, brand) ; \+indep(s1)).
evidence(all_consistent(brand)).
query(true_val(brand, nitro)).
query(true_val(brand, unk_brand)).

0.80::acc(s1, model_name).
% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values banker=Banker unk_model_name=Unknown
% @importance 0.90
0.95::true_val(model_name, banker); 0.05::true_val(model_name, unk_model_name).
measured(s1, model_name, banker).
all_consistent(model_name) :- (indep(s1), consistent(s1, model_name) ; \+indep(s1)).
evidence(all_consistent(model_name)).
query(true_val(model_name, banker)).
query(true_val(model_name, unk_model_name)).

0.80::acc(s1, model_series).
% @attr model_series
% @type categorical
% @canonical false
% @original_name Model series
% @values quiver_series=Quiver_Series unk_model_series=Unknown
% @importance 0.90
0.92::true_val(model_series, quiver_series); 0.08::true_val(model_series, unk_model_series).
measured(s1, model_series, quiver_series).
all_consistent(model_series) :- (indep(s1), consistent(s1, model_series) ; \+indep(s1)).
evidence(all_consistent(model_series)).
query(true_val(model_series, quiver_series)).
query(true_val(model_series, unk_model_series)).

0.85::acc(s2, model_year).
% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2027=2027 unk_model_year=Unknown
% @importance 0.95
0.93::true_val(model_year, y2027); 0.07::true_val(model_year, unk_model_year).
measured(s2, model_year, y2027).
all_consistent(model_year) :- (indep(s2), consistent(s2, model_year) ; \+indep(s2)).
evidence(all_consistent(model_year)).
query(true_val(model_year, y2027)).
query(true_val(model_year, unk_model_year)).

0.96::acc(s3, manufacturer).
% @attr manufacturer
% @type categorical
% @canonical false
% @original_name manufacturer
% @values nitro_ag_switzerland=Nitro_AG_Hunenberg_Switzerland unk_manufacturer=Unknown
% @importance 1.00
0.97::true_val(manufacturer, nitro_ag_switzerland); 0.03::true_val(manufacturer, unk_manufacturer).
measured(s3, manufacturer, nitro_ag_switzerland).
all_consistent(manufacturer) :- consistent(s3, manufacturer).
evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, nitro_ag_switzerland)).
query(true_val(manufacturer, unk_manufacturer)).

0.96::acc(s3, eu_representative).
% @attr eu_representative
% @type categorical
% @canonical false
% @original_name EU Representative
% @values nitro_dist_italia=Nitro_Distribution_Italia_Arco_TN unk_eu_representative=Unknown
% @importance 1.00
0.97::true_val(eu_representative, nitro_dist_italia); 0.03::true_val(eu_representative, unk_eu_representative).
measured(s3, eu_representative, nitro_dist_italia).
all_consistent(eu_representative) :- consistent(s3, eu_representative).
evidence(all_consistent(eu_representative)).
query(true_val(eu_representative, nitro_dist_italia)).
query(true_val(eu_representative, unk_eu_representative)).

0.95::acc(s4, brand_founded).
% @attr brand_founded
% @type categorical
% @canonical false
% @original_name Brand founded
% @values y1990_veras_cafe=1990_Veras_Cafe_Ballard_Seattle unk_brand_founded=Unknown
% @importance 0.45
0.97::true_val(brand_founded, y1990_veras_cafe); 0.03::true_val(brand_founded, unk_brand_founded).
measured(s4, brand_founded, y1990_veras_cafe).
all_consistent(brand_founded) :- consistent(s4, brand_founded).
evidence(all_consistent(brand_founded)).
query(true_val(brand_founded, y1990_veras_cafe)).
query(true_val(brand_founded, unk_brand_founded)).

0.90::acc(s5, founders).
% @attr founders
% @type categorical
% @canonical false
% @original_name Founders
% @values delago_ardelt=Thomas_Delago_and_Sepp_Ardelt unk_founders=Unknown
% @importance 0.50
0.95::true_val(founders, delago_ardelt); 0.05::true_val(founders, unk_founders).
measured(s5, founders, delago_ardelt).
all_consistent(founders) :- consistent(s5, founders).
evidence(all_consistent(founders)).
query(true_val(founders, delago_ardelt)).
query(true_val(founders, unk_founders)).

0.90::acc(s6, brand_ownership).
% @attr brand_ownership
% @type categorical
% @canonical false
% @original_name Brand ownership
% @values private_rider_owned=Privately_owned_rider_owner_operated unk_brand_ownership=Unknown
% @importance 0.40
0.95::true_val(brand_ownership, private_rider_owned); 0.05::true_val(brand_ownership, unk_brand_ownership).
measured(s6, brand_ownership, private_rider_owned).
all_consistent(brand_ownership) :- consistent(s6, brand_ownership).
evidence(all_consistent(brand_ownership)).
query(true_val(brand_ownership, private_rider_owned)).
query(true_val(brand_ownership, unk_brand_ownership)).

0.78::acc(s7, brand_reputation).
% @attr brand_reputation
% @type categorical
% @canonical false
% @original_name Brand reputation
% @values authentic_independent_leader=Authentic_independent_market_leader unk_brand_reputation=Unknown
% @importance 0.40
0.85::true_val(brand_reputation, authentic_independent_leader); 0.15::true_val(brand_reputation, unk_brand_reputation).
measured(s7, brand_reputation, authentic_independent_leader).
all_consistent(brand_reputation) :- consistent(s7, brand_reputation).
evidence(all_consistent(brand_reputation)).
query(true_val(brand_reputation, authentic_independent_leader)).
query(true_val(brand_reputation, unk_brand_reputation)).

0.65::acc(s8, product_development_location).
% @attr product_development_location
% @type categorical
% @canonical false
% @original_name Product development location
% @values oberammergau_germany=Oberammergau_Germany unk_product_development_location=Unknown
% @importance 0.35
0.85::true_val(product_development_location, oberammergau_germany); 0.15::true_val(product_development_location, unk_product_development_location).
measured(s8, product_development_location, oberammergau_germany).
all_consistent(product_development_location) :- (indep(s8), consistent(s8, product_development_location) ; \+indep(s8)).
evidence(all_consistent(product_development_location)).
query(true_val(product_development_location, oberammergau_germany)).
query(true_val(product_development_location, unk_product_development_location)).

0.62::acc(s9, manufacturing_location_current).
% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values austria=Austria unk_manufacturing_location_current=Unknown
% @importance 0.55
0.82::true_val(manufacturing_location_current, austria); 0.18::true_val(manufacturing_location_current, unk_manufacturing_location_current).
measured(s9, manufacturing_location_current, austria).
all_consistent(manufacturing_location_current) :- (indep(s9), consistent(s9, manufacturing_location_current) ; \+indep(s9)).
evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, austria)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

0.55::acc(s10, manufacturing_location_prior).
% @attr manufacturing_location_prior
% @type categorical
% @canonical true
% @original_name manufacturing_location_prior
% @values elan_to_playmaker_back=Elan_Austria_to_Playmaker_Taiwan_back_Austria unk_manufacturing_location_prior=Unknown
% @importance 0.30
0.75::true_val(manufacturing_location_prior, elan_to_playmaker_back); 0.25::true_val(manufacturing_location_prior, unk_manufacturing_location_prior).
measured(s10, manufacturing_location_prior, elan_to_playmaker_back).
all_consistent(manufacturing_location_prior) :- consistent(s10, manufacturing_location_prior).
evidence(all_consistent(manufacturing_location_prior)).
query(true_val(manufacturing_location_prior, elan_to_playmaker_back)).
query(true_val(manufacturing_location_prior, unk_manufacturing_location_prior)).

0.65::acc(s8, design_location).
% @attr design_location
% @type categorical
% @canonical false
% @original_name Design location
% @values seattle_usa=Seattle_USA unk_design_location=Unknown
% @importance 0.35
0.85::true_val(design_location, seattle_usa); 0.15::true_val(design_location, unk_design_location).
measured(s8, design_location, seattle_usa).
all_consistent(design_location) :- (indep(s8), consistent(s8, design_location) ; \+indep(s8)).
evidence(all_consistent(design_location)).
query(true_val(design_location, seattle_usa)).
query(true_val(design_location, unk_design_location)).

0.65::acc(s8, global_offices).
% @attr global_offices
% @type categorical
% @canonical false
% @original_name Global offices
% @values ch_de_it_no_ca_us=Switzerland_Germany_Italy_Norway_Canada_US unk_global_offices=Unknown
% @importance 0.35
0.85::true_val(global_offices, ch_de_it_no_ca_us); 0.15::true_val(global_offices, unk_global_offices).
measured(s8, global_offices, ch_de_it_no_ca_us).
all_consistent(global_offices) :- (indep(s8), consistent(s8, global_offices) ; \+indep(s8)).
evidence(all_consistent(global_offices)).
query(true_val(global_offices, ch_de_it_no_ca_us)).
query(true_val(global_offices, unk_global_offices)).

0.55::acc(s11, approximate_employee_count).
% @attr approximate_employee_count
% @type numeric
% @canonical false
% @original_name Approximate employee count
% @values v81=81
% @importance 0.20
0.72::true_val(approximate_employee_count, v81); 0.28::true_val(approximate_employee_count, unk_approximate_employee_count).
measured(s11, approximate_employee_count, v81).
all_consistent(approximate_employee_count) :- consistent(s11, approximate_employee_count).
evidence(all_consistent(approximate_employee_count)).
query(true_val(approximate_employee_count, v81)).
query(true_val(approximate_employee_count, unk_approximate_employee_count)).

0.80::acc(s1, product_type).
% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.90
0.95::true_val(product_type, snowboard); 0.05::true_val(product_type, unk_product_type).
measured(s1, product_type, snowboard).
all_consistent(product_type) :- (indep(s1), consistent(s1, product_type) ; \+indep(s1)).
evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

0.85::acc(s2, board_category).
% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain_freeride=All_Mountain_Freeride unk_board_category=Unknown
% @importance 0.95
0.93::true_val(board_category, all_mountain_freeride); 0.07::true_val(board_category, unk_board_category).
measured(s2, board_category, all_mountain_freeride).
all_consistent(board_category) :- (indep(s2), consistent(s2, board_category) ; \+indep(s2)).
evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain_freeride)).
query(true_val(board_category, unk_board_category)).

0.82::acc(s1, board_subtype).
% @attr board_subtype
% @type categorical
% @canonical false
% @original_name Board subtype
% @values directional_am_carver=Directional_all_mountain_carver_banked_slalom_specialist unk_board_subtype=Unknown
% @importance 0.90
0.92::true_val(board_subtype, directional_am_carver); 0.08::true_val(board_subtype, unk_board_subtype).
measured(s1, board_subtype, directional_am_carver).
all_consistent(board_subtype) :- (indep(s1), consistent(s1, board_subtype) ; \+indep(s1)).
evidence(all_consistent(board_subtype)).
query(true_val(board_subtype, directional_am_carver)).
query(true_val(board_subtype, unk_board_subtype)).

0.82::acc(s12, design_inspiration).
% @attr design_inspiration
% @type categorical
% @canonical false
% @original_name Design inspiration
% @values baker_banked_slalom=Created_for_Baker_Banked_Slalom unk_design_inspiration=Unknown
% @importance 0.80
0.88::true_val(design_inspiration, baker_banked_slalom); 0.12::true_val(design_inspiration, unk_design_inspiration).
measured(s12, design_inspiration, baker_banked_slalom).
all_consistent(design_inspiration) :- consistent(s12, design_inspiration).
evidence(all_consistent(design_inspiration)).
query(true_val(design_inspiration, baker_banked_slalom)).
query(true_val(design_inspiration, unk_design_inspiration)).

0.93::acc(s3, design_philosophy_tagline).
% @attr design_philosophy_tagline
% @type categorical
% @canonical false
% @original_name Design philosophy tagline
% @values turning_burning_champion=The_Official_Turning_and_Burning_Champion unk_design_philosophy_tagline=Unknown
% @importance 1.00
0.97::true_val(design_philosophy_tagline, turning_burning_champion); 0.03::true_val(design_philosophy_tagline, unk_design_philosophy_tagline).
measured(s3, design_philosophy_tagline, turning_burning_champion).
all_consistent(design_philosophy_tagline) :- consistent(s3, design_philosophy_tagline).
evidence(all_consistent(design_philosophy_tagline)).
query(true_val(design_philosophy_tagline, turning_burning_champion)).
query(true_val(design_philosophy_tagline, unk_design_philosophy_tagline)).

0.75::acc(s13, pro_rider_name).
% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values fox_delago_prior=Bryan_Fox_Tommy_Delago_Christy_Prior unk_pro_rider_name=Unknown
% @importance 0.75
0.90::true_val(pro_rider_name, fox_delago_prior); 0.10::true_val(pro_rider_name, unk_pro_rider_name).
measured(s13, pro_rider_name, fox_delago_prior).
all_consistent(pro_rider_name) :- (indep(s13), consistent(s13, pro_rider_name) ; \+indep(s13)).
evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, fox_delago_prior)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

0.75::acc(s13, bryan_fox_endorsement).
% @attr bryan_fox_endorsement
% @type categorical
% @canonical false
% @original_name Bryan Fox endorsement quote
% @values atv_everyday_love=ATV_everyday_love_go_to_snowboard unk_bryan_fox_endorsement=Unknown
% @importance 0.75
0.90::true_val(bryan_fox_endorsement, atv_everyday_love); 0.10::true_val(bryan_fox_endorsement, unk_bryan_fox_endorsement).
measured(s13, bryan_fox_endorsement, atv_everyday_love).
all_consistent(bryan_fox_endorsement) :- (indep(s13), consistent(s13, bryan_fox_endorsement) ; \+indep(s13)).
evidence(all_consistent(bryan_fox_endorsement)).
query(true_val(bryan_fox_endorsement, atv_everyday_love)).
query(true_val(bryan_fox_endorsement, unk_bryan_fox_endorsement)).

0.78::acc(s14, tommy_delago_endorsement).
% @attr tommy_delago_endorsement
% @type categorical
% @canonical false
% @original_name Tommy Delago endorsement
% @values favourite_am_carver=Favourite_all_mountain_carver_since_first_designed unk_tommy_delago_endorsement=Unknown
% @importance 0.85
0.90::true_val(tommy_delago_endorsement, favourite_am_carver); 0.10::true_val(tommy_delago_endorsement, unk_tommy_delago_endorsement).
measured(s14, tommy_delago_endorsement, favourite_am_carver).
all_consistent(tommy_delago_endorsement) :- (indep(s14), consistent(s14, tommy_delago_endorsement) ; \+indep(s14)).
evidence(all_consistent(tommy_delago_endorsement)).
query(true_val(tommy_delago_endorsement, favourite_am_carver)).
query(true_val(tommy_delago_endorsement, unk_tommy_delago_endorsement)).

0.75::acc(s13, gender).
% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values unisex_2027=Unisex_for_2027 unk_gender=Unknown
% @importance 0.75
0.90::true_val(gender, unisex_2027); 0.10::true_val(gender, unk_gender).
measured(s13, gender, unisex_2027).
all_consistent(gender) :- (indep(s13), consistent(s13, gender) ; \+indep(s13)).
evidence(all_consistent(gender)).
query(true_val(gender, unisex_2027)).
query(true_val(gender, unk_gender)).

0.75::acc(s15, womens_variant_2027).
% @attr womens_variant_2027
% @type categorical
% @canonical false
% @original_name 2027 women's variant
% @values exists_148_152=Exists_148cm_152cm unk_womens_variant_2027=Unknown
% @importance 0.70
0.88::true_val(womens_variant_2027, exists_148_152); 0.12::true_val(womens_variant_2027, unk_womens_variant_2027).
measured(s15, womens_variant_2027, exists_148_152).
all_consistent(womens_variant_2027) :- (indep(s15), consistent(s15, womens_variant_2027) ; \+indep(s15)).
evidence(all_consistent(womens_variant_2027)).
query(true_val(womens_variant_2027, exists_148_152)).
query(true_val(womens_variant_2027, unk_womens_variant_2027)).

0.82::acc(s16, rider_level).
% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values advanced_expert=Advanced_to_Expert unk_rider_level=Unknown
% @importance 0.85
0.92::true_val(rider_level, advanced_expert); 0.08::true_val(rider_level, unk_rider_level).
measured(s16, rider_level, advanced_expert).
all_consistent(rider_level) :- (indep(s16), consistent(s16, rider_level) ; \+indep(s16)).
evidence(all_consistent(rider_level)).
query(true_val(rider_level, advanced_expert)).
query(true_val(rider_level, unk_rider_level)).

0.82::acc(s12, skill_level_recommendation).
0.90::acc(s19, skill_level_recommendation).
% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values advanced_expert=Advanced_Expert unk_skill_level_recommendation=Unknown
% @importance 0.875
0.95::true_val(skill_level_recommendation, advanced_expert); 0.05::true_val(skill_level_recommendation, unk_skill_level_recommendation).
measured(s12, skill_level_recommendation, advanced_expert).
measured(s19, skill_level_recommendation, advanced_expert).
all_consistent(skill_level_recommendation) :- consistent(s12, skill_level_recommendation), consistent(s19, skill_level_recommendation).
evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, advanced_expert)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

0.85::acc(s2, terrain_suitability).
% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values banked_slalom_groomers_powder=Banked_slalom_groomers_powder unk_terrain_suitability=Unknown
% @importance 0.95
0.93::true_val(terrain_suitability, banked_slalom_groomers_powder); 0.07::true_val(terrain_suitability, unk_terrain_suitability).
measured(s2, terrain_suitability, banked_slalom_groomers_powder).
all_consistent(terrain_suitability) :- (indep(s2), consistent(s2, terrain_suitability) ; \+indep(s2)).
evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, banked_slalom_groomers_powder)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

0.85::acc(s2, riding_style).
% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values freeride_carving_highspeed=Freeride_carving_high_speed unk_riding_style=Unknown
% @importance 0.95
0.93::true_val(riding_style, freeride_carving_highspeed); 0.07::true_val(riding_style, unk_riding_style).
measured(s2, riding_style, freeride_carving_highspeed).
all_consistent(riding_style) :- (indep(s2), consistent(s2, riding_style) ; \+indep(s2)).
evidence(all_consistent(riding_style)).
query(true_val(riding_style, freeride_carving_highspeed)).
query(true_val(riding_style, unk_riding_style)).

0.80::acc(s14, terrain_all_mountain_rating).
% @attr terrain_all_mountain_rating
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability (All Mountain)
% @values v10=10.0 unk_terrain_all_mountain_rating=Unknown
% @importance 0.85
0.90::true_val(terrain_all_mountain_rating, v10); 0.10::true_val(terrain_all_mountain_rating, unk_terrain_all_mountain_rating).
measured(s14, terrain_all_mountain_rating, v10).
all_consistent(terrain_all_mountain_rating) :- (indep(s14), consistent(s14, terrain_all_mountain_rating) ; \+indep(s14)).
evidence(all_consistent(terrain_all_mountain_rating)).
query(true_val(terrain_all_mountain_rating, v10)).
query(true_val(terrain_all_mountain_rating, unk_terrain_all_mountain_rating)).

0.88::acc(s3, terrain_park_rating).
0.82::acc(s14, terrain_park_rating).
% @attr terrain_park_rating
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability (Park)
% @values v0=0.0 v2=2.0
% @importance 0.925
0.35::true_val(terrain_park_rating, v0); 0.65::true_val(terrain_park_rating, v2).
measured(s3, terrain_park_rating, v0).
measured(s14, terrain_park_rating, v2).
all_consistent(terrain_park_rating) :- consistent(s3, terrain_park_rating), (indep(s14), consistent(s14, terrain_park_rating) ; \+indep(s14)).
evidence(all_consistent(terrain_park_rating)).
query(true_val(terrain_park_rating, v0)).
query(true_val(terrain_park_rating, v2)).

0.88::acc(s3, terrain_backcountry_rating).
0.82::acc(s14, terrain_backcountry_rating).
% @attr terrain_backcountry_rating
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability (Backcountry)
% @values v9=9.0 v10=10.0
% @importance 0.925
0.40::true_val(terrain_backcountry_rating, v9); 0.60::true_val(terrain_backcountry_rating, v10).
measured(s3, terrain_backcountry_rating, v9).
measured(s14, terrain_backcountry_rating, v10).
all_consistent(terrain_backcountry_rating) :- consistent(s3, terrain_backcountry_rating), (indep(s14), consistent(s14, terrain_backcountry_rating) ; \+indep(s14)).
evidence(all_consistent(terrain_backcountry_rating)).
query(true_val(terrain_backcountry_rating, v9)).
query(true_val(terrain_backcountry_rating, v10)).

0.82::acc(s17, fastest_in_quiver_series).
% @attr fastest_in_quiver_series
% @type categorical
% @canonical false
% @original_name Described as fastest board in Quiver Series
% @values yes=Yes unk_fastest_in_quiver_series=Unknown
% @importance 0.50
0.85::true_val(fastest_in_quiver_series, yes); 0.15::true_val(fastest_in_quiver_series, unk_fastest_in_quiver_series).
measured(s17, fastest_in_quiver_series, yes).
all_consistent(fastest_in_quiver_series) :- (indep(s17), consistent(s17, fastest_in_quiver_series) ; \+indep(s17)).
evidence(all_consistent(fastest_in_quiver_series)).
query(true_val(fastest_in_quiver_series, yes)).
query(true_val(fastest_in_quiver_series, unk_fastest_in_quiver_series)).

0.75::acc(s18, use_case_banked_slalom).
% @attr use_case_banked_slalom
% @type categorical
% @canonical false
% @original_name Use case — banked slalom
% @values essential=Foolish_to_consider_anything_else unk_use_case_banked_slalom=Unknown
% @importance 0.65
0.85::true_val(use_case_banked_slalom, essential); 0.15::true_val(use_case_banked_slalom, unk_use_case_banked_slalom).
measured(s18, use_case_banked_slalom, essential).
all_consistent(use_case_banked_slalom) :- (indep(s18), consistent(s18, use_case_banked_slalom) ; \+indep(s18)).
evidence(all_consistent(use_case_banked_slalom)).
query(true_val(use_case_banked_slalom, essential)).
query(true_val(use_case_banked_slalom, unk_use_case_banked_slalom)).

0.82::acc(s1, shape).
% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values directional=Directional unk_shape=Unknown
% @importance 0.90
0.95::true_val(shape, directional); 0.05::true_val(shape, unk_shape).
measured(s1, shape, directional).
all_consistent(shape) :- (indep(s1), consistent(s1, shape) ; \+indep(s1)).
evidence(all_consistent(shape)).
query(true_val(shape, directional)).
query(true_val(shape, unk_shape)).

0.90::acc(s19, taper).
% @attr taper
% @type categorical
% @canonical false
% @original_name taper
% @values tapered_few_mm=Tapered_directional_few_mm unk_taper=Unknown
% @importance 0.95
0.92::true_val(taper, tapered_few_mm); 0.08::true_val(taper, unk_taper).
measured(s19, taper, tapered_few_mm).
all_consistent(taper) :- consistent(s19, taper).
evidence(all_consistent(taper)).
query(true_val(taper, tapered_few_mm)).
query(true_val(taper, unk_taper)).

0.82::acc(s1, camber_type).
% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values true_camber=True_Camber unk_camber_type=Unknown
% @importance 0.90
0.95::true_val(camber_type, true_camber); 0.05::true_val(camber_type, unk_camber_type).
measured(s1, camber_type, true_camber).
all_consistent(camber_type) :- (indep(s1), consistent(s1, camber_type) ; \+indep(s1)).
evidence(all_consistent(camber_type)).
query(true_val(camber_type, true_camber)).
query(true_val(camber_type, unk_camber_type)).

0.95::acc(s3, camber_description).
% @attr camber_description
% @type categorical
% @canonical false
% @original_name camber_description
% @values stability_pop=Stability_and_pop_arch_underfoot unk_camber_description=Unknown
% @importance 1.00
0.97::true_val(camber_description, stability_pop); 0.03::true_val(camber_description, unk_camber_description).
measured(s3, camber_description, stability_pop).
all_consistent(camber_description) :- consistent(s3, camber_description).
evidence(all_consistent(camber_description)).
query(true_val(camber_description, stability_pop)).
query(true_val(camber_description, unk_camber_description)).

0.95::acc(s3, core_profile).
% @attr core_profile
% @type categorical
% @canonical false
% @original_name Core profile
% @values reflex=Reflex_Core_Profile_thinner_between_feet unk_core_profile=Unknown
% @importance 1.00
0.97::true_val(core_profile, reflex); 0.03::true_val(core_profile, unk_core_profile).
measured(s3, core_profile, reflex).
all_consistent(core_profile) :- consistent(s3, core_profile).
evidence(all_consistent(core_profile)).
query(true_val(core_profile, reflex)).
query(true_val(core_profile, unk_core_profile)).

0.95::acc(s3, width_options).
% @attr width_options
% @type categorical
% @canonical true
% @original_name width_options
% @values mid_wide=Mid_Wide unk_width_options=Unknown
% @importance 1.00
0.97::true_val(width_options, mid_wide); 0.03::true_val(width_options, unk_width_options).
measured(s3, width_options, mid_wide).
all_consistent(width_options) :- consistent(s3, width_options).
evidence(all_consistent(width_options)).
query(true_val(width_options, mid_wide)).
query(true_val(width_options, unk_width_options)).

0.85::acc(s2, flex_rating_10_manufacturer).
0.80::acc(s14, flex_rating_10_manufacturer).
% @attr flex_rating_10_manufacturer
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10_manufacturer
% @values v8=8.0 unk_flex_rating_10_manufacturer=Unknown
% @importance 0.90
0.95::true_val(flex_rating_10_manufacturer, v8); 0.05::true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer).
measured(s2, flex_rating_10_manufacturer, v8).
measured(s14, flex_rating_10_manufacturer, v8).
all_consistent(flex_rating_10_manufacturer) :- (indep(s2), consistent(s2, flex_rating_10_manufacturer) ; \+indep(s2)), (indep(s14), consistent(s14, flex_rating_10_manufacturer) ; \+indep(s14)).
evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, v8)).
query(true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer)).

0.82::acc(s1, flex_pattern).
% @attr flex_pattern
% @type categorical
% @canonical false
% @original_name Flex pattern
% @values directional_all_terrain=Directional_All_Terrain_Flex unk_flex_pattern=Unknown
% @importance 0.90
0.92::true_val(flex_pattern, directional_all_terrain); 0.08::true_val(flex_pattern, unk_flex_pattern).
measured(s1, flex_pattern, directional_all_terrain).
all_consistent(flex_pattern) :- (indep(s1), consistent(s1, flex_pattern) ; \+indep(s1)).
evidence(all_consistent(flex_pattern)).
query(true_val(flex_pattern, directional_all_terrain)).
query(true_val(flex_pattern, unk_flex_pattern)).

0.82::acc(s1, flex_description).
% @attr flex_description
% @type categorical
% @canonical false
% @original_name Flex description
% @values versatile_pop_smooth=Most_versatile_flex_AM_pop_smooth_response unk_flex_description=Unknown
% @importance 0.90
0.92::true_val(flex_description, versatile_pop_smooth); 0.08::true_val(flex_description, unk_flex_description).
measured(s1, flex_description, versatile_pop_smooth).
all_consistent(flex_description) :- (indep(s1), consistent(s1, flex_description) ; \+indep(s1)).
evidence(all_consistent(flex_description)).
query(true_val(flex_description, versatile_pop_smooth)).
query(true_val(flex_description, unk_flex_description)).

0.90::acc(s19, flex_direction).
% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values directional_softer_nose=Directional_softer_nose_stiffer_tail unk_flex_direction=Unknown
% @importance 0.95
0.92::true_val(flex_direction, directional_softer_nose); 0.08::true_val(flex_direction, unk_flex_direction).
measured(s19, flex_direction, directional_softer_nose).
all_consistent(flex_direction) :- consistent(s19, flex_direction).
evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional_softer_nose)).
query(true_val(flex_direction, unk_flex_direction)).

0.90::acc(s19, flex_feel).
% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values medium_rubbery=Medium_rubbery_lively_camber_pop unk_flex_feel=Unknown
% @importance 0.95
0.92::true_val(flex_feel, medium_rubbery); 0.08::true_val(flex_feel, unk_flex_feel).
measured(s19, flex_feel, medium_rubbery).
all_consistent(flex_feel) :- consistent(s19, flex_feel).
evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium_rubbery)).
query(true_val(flex_feel, unk_flex_feel)).

0.85::acc(s2, sidecut_type).
% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values progressive=Progressive_Sidecut unk_sidecut_type=Unknown
% @importance 0.95
0.93::true_val(sidecut_type, progressive); 0.07::true_val(sidecut_type, unk_sidecut_type).
measured(s2, sidecut_type, progressive).
all_consistent(sidecut_type) :- (indep(s2), consistent(s2, sidecut_type) ; \+indep(s2)).
evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, progressive)).
query(true_val(sidecut_type, unk_sidecut_type)).

0.82::acc(s1, sidecut_description).
% @attr sidecut_description
% @type categorical
% @canonical false
% @original_name Sidecut description
% @values accelerate_turns_catchfree=Accelerate_out_of_turns_catch_free_nose unk_sidecut_description=Unknown
% @importance 0.90
0.92::true_val(sidecut_description, accelerate_turns_catchfree); 0.08::true_val(sidecut_description, unk_sidecut_description).
measured(s1, sidecut_description, accelerate_turns_catchfree).
all_consistent(sidecut_description) :- (indep(s1), consistent(s1, sidecut_description) ; \+indep(s1)).
evidence(all_consistent(sidecut_description)).
query(true_val(sidecut_description, accelerate_turns_catchfree)).
query(true_val(sidecut_description, unk_sidecut_description)).

0.95::acc(s3, core_material).
% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values powercore_ii_poplar_beech=PowerCore_II_Poplar_Beech_stringers unk_core_material=Unknown
% @importance 1.00
0.97::true_val(core_material, powercore_ii_poplar_beech); 0.03::true_val(core_material, unk_core_material).
measured(s3, core_material, powercore_ii_poplar_beech).
all_consistent(core_material) :- consistent(s3, core_material).
evidence(all_consistent(core_material)).
query(true_val(core_material, powercore_ii_poplar_beech)).
query(true_val(core_material, unk_core_material)).

0.85::acc(s2, sustainability_certification).
% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values fsc_sourced=FSC_responsibly_sourced unk_sustainability_certification=Unknown
% @importance 0.95
0.93::true_val(sustainability_certification, fsc_sourced); 0.07::true_val(sustainability_certification, unk_sustainability_certification).
measured(s2, sustainability_certification, fsc_sourced).
all_consistent(sustainability_certification) :- (indep(s2), consistent(s2, sustainability_certification) ; \+indep(s2)).
evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, fsc_sourced)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

0.95::acc(s3, laminate).
% @attr laminate
% @type categorical
% @canonical false
% @original_name laminate
% @values bi_lite=Bi_Lite_Laminates_two_direction_fibres unk_laminate=Unknown
% @importance 1.00
0.97::true_val(laminate, bi_lite); 0.03::true_val(laminate, unk_laminate).
measured(s3, laminate, bi_lite).
all_consistent(laminate) :- consistent(s3, laminate).
evidence(all_consistent(laminate)).
query(true_val(laminate, bi_lite)).
query(true_val(laminate, unk_laminate)).

0.95::acc(s3, sidewall_material).
% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values abs_35pct_recycled=ABS_Sidewalls_35pct_recycled unk_sidewall_material=Unknown
% @importance 1.00
0.97::true_val(sidewall_material, abs_35pct_recycled); 0.03::true_val(sidewall_material, unk_sidewall_material).
measured(s3, sidewall_material, abs_35pct_recycled).
all_consistent(sidewall_material) :- consistent(s3, sidewall_material).
evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, abs_35pct_recycled)).
query(true_val(sidewall_material, unk_sidewall_material)).

0.85::acc(s2, base_material).
% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_ecospeed_hd=Sintered_EcoSpeed_HD_Base unk_base_material=Unknown
% @importance 0.95
0.93::true_val(base_material, sintered_ecospeed_hd); 0.07::true_val(base_material, unk_base_material).
measured(s2, base_material, sintered_ecospeed_hd).
all_consistent(base_material) :- (indep(s2), consistent(s2, base_material) ; \+indep(s2)).
evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_ecospeed_hd)).
query(true_val(base_material, unk_base_material)).

0.85::acc(s2, sustainability_ptex_recycled).
% @attr sustainability_ptex_recycled
% @type categorical
% @canonical false
% @original_name sustainability_certification (85% Ptex)
% @values pct85_post_industrial=85pct_post_industrial_Ptex unk_sustainability_ptex_recycled=Unknown
% @importance 0.95
0.93::true_val(sustainability_ptex_recycled, pct85_post_industrial); 0.07::true_val(sustainability_ptex_recycled, unk_sustainability_ptex_recycled).
measured(s2, sustainability_ptex_recycled, pct85_post_industrial).
all_consistent(sustainability_ptex_recycled) :- (indep(s2), consistent(s2, sustainability_ptex_recycled) ; \+indep(s2)).
evidence(all_consistent(sustainability_ptex_recycled)).
query(true_val(sustainability_ptex_recycled, pct85_post_industrial)).
query(true_val(sustainability_ptex_recycled, unk_sustainability_ptex_recycled)).

0.95::acc(s3, base_description).
% @attr base_description
% @type categorical
% @canonical false
% @original_name Base description
% @values sustainable_durable_fast=Sustainable_durable_fast_recycled unk_base_description=Unknown
% @importance 1.00
0.97::true_val(base_description, sustainable_durable_fast); 0.03::true_val(base_description, unk_base_description).
measured(s3, base_description, sustainable_durable_fast).
all_consistent(base_description) :- consistent(s3, base_description).
evidence(all_consistent(base_description)).
query(true_val(base_description, sustainable_durable_fast)).
query(true_val(base_description, unk_base_description)).

0.95::acc(s3, edge_technology).
% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values recycled_steel_50pct=Recycled_Steel_Edge_50pct unk_edge_technology=Unknown
% @importance 1.00
0.97::true_val(edge_technology, recycled_steel_50pct); 0.03::true_val(edge_technology, unk_edge_technology).
measured(s3, edge_technology, recycled_steel_50pct).
all_consistent(edge_technology) :- consistent(s3, edge_technology).
evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, recycled_steel_50pct)).
query(true_val(edge_technology, unk_edge_technology)).

0.85::acc(s2, resin).
% @attr resin
% @type categorical
% @canonical false
% @original_name resin
% @values ecopoxy_33=EcoPoxy_33_bio_based_33pct_plant unk_resin=Unknown
% @importance 0.95
0.93::true_val(resin, ecopoxy_33); 0.07::true_val(resin, unk_resin).
measured(s2, resin, ecopoxy_33).
all_consistent(resin) :- (indep(s2), consistent(s2, resin) ; \+indep(s2)).
evidence(all_consistent(resin)).
query(true_val(resin, ecopoxy_33)).
query(true_val(resin, unk_resin)).

0.85::acc(s2, topsheet).
% @attr topsheet
% @type categorical
% @canonical true
% @original_name topsheet
% @values ecoguard_90pct=EcoGuard_Topsheet_90pct_recycled unk_topsheet=Unknown
% @importance 0.95
0.93::true_val(topsheet, ecoguard_90pct); 0.07::true_val(topsheet, unk_topsheet).
measured(s2, topsheet, ecoguard_90pct).
all_consistent(topsheet) :- (indep(s2), consistent(s2, topsheet) ; \+indep(s2)).
evidence(all_consistent(topsheet)).
query(true_val(topsheet, ecoguard_90pct)).
query(true_val(topsheet, unk_topsheet)).

0.80::acc(s1, factory_wax).
% @attr factory_wax
% @type categorical
% @canonical false
% @original_name Factory wax
% @values green_speed_natural=Green_Speed_Natural_Wax_biodegradable unk_factory_wax=Unknown
% @importance 0.90
0.92::true_val(factory_wax, green_speed_natural); 0.08::true_val(factory_wax, unk_factory_wax).
measured(s1, factory_wax, green_speed_natural).
all_consistent(factory_wax) :- (indep(s1), consistent(s1, factory_wax) ; \+indep(s1)).
evidence(all_consistent(factory_wax)).
query(true_val(factory_wax, green_speed_natural)).
query(true_val(factory_wax, unk_factory_wax)).

0.85::acc(s2, ink_type).
% @attr ink_type
% @type categorical
% @canonical false
% @original_name Ink type
% @values water_based=Water_based_inks unk_ink_type=Unknown
% @importance 0.95
0.93::true_val(ink_type, water_based); 0.07::true_val(ink_type, unk_ink_type).
measured(s2, ink_type, water_based).
all_consistent(ink_type) :- (indep(s2), consistent(s2, ink_type) ; \+indep(s2)).
evidence(all_consistent(ink_type)).
query(true_val(ink_type, water_based)).
query(true_val(ink_type, unk_ink_type)).

0.85::acc(s2, mounting_pattern).
0.90::acc(s19, mounting_pattern).
% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 0.95
0.95::true_val(mounting_pattern, inserts_2x4); 0.05::true_val(mounting_pattern, unk_mounting_pattern).
measured(s2, mounting_pattern, inserts_2x4).
measured(s19, mounting_pattern, inserts_2x4).
all_consistent(mounting_pattern) :- (indep(s2), consistent(s2, mounting_pattern) ; \+indep(s2)), consistent(s19, mounting_pattern).
evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

0.75::acc(s18, binding_compatibility).
% @attr binding_compatibility
% @type categorical
% @canonical false
% @original_name binding_compatibility
% @values standard_mini_disk=Standard_or_mini_disk_bindings unk_binding_compatibility=Unknown
% @importance 0.65
0.85::true_val(binding_compatibility, standard_mini_disk); 0.15::true_val(binding_compatibility, unk_binding_compatibility).
measured(s18, binding_compatibility, standard_mini_disk).
all_consistent(binding_compatibility) :- (indep(s18), consistent(s18, binding_compatibility) ; \+indep(s18)).
evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, standard_mini_disk)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

0.85::acc(s2, sustainability_solar_energy).
0.95::acc(s3, sustainability_solar_energy).
% @attr sustainability_solar_energy
% @type categorical
% @canonical false
% @original_name sustainability_certification (Solar)
% @values solar_100pct=100pct_solar_energy unk_sustainability_solar_energy=Unknown
% @importance 0.975
0.97::true_val(sustainability_solar_energy, solar_100pct); 0.03::true_val(sustainability_solar_energy, unk_sustainability_solar_energy).
measured(s2, sustainability_solar_energy, solar_100pct).
measured(s3, sustainability_solar_energy, solar_100pct).
all_consistent(sustainability_solar_energy) :- consistent(s3, sustainability_solar_energy), (indep(s2), consistent(s2, sustainability_solar_energy) ; \+indep(s2)).
evidence(all_consistent(sustainability_solar_energy)).
query(true_val(sustainability_solar_energy, solar_100pct)).
query(true_val(sustainability_solar_energy, unk_sustainability_solar_energy)).

0.95::acc(s3, sustainability_carbon_footprint).
% @attr sustainability_carbon_footprint
% @type numeric
% @unit kg_CO2
% @canonical false
% @original_name sustainability_certification (CO2)
% @values v32_2=32.2 unk_sustainability_carbon_footprint=Unknown
% @importance 1.00
0.97::true_val(sustainability_carbon_footprint, v32_2); 0.03::true_val(sustainability_carbon_footprint, unk_sustainability_carbon_footprint).
measured(s3, sustainability_carbon_footprint, v32_2).
all_consistent(sustainability_carbon_footprint) :- consistent(s3, sustainability_carbon_footprint).
evidence(all_consistent(sustainability_carbon_footprint)).
query(true_val(sustainability_carbon_footprint, v32_2)).
query(true_val(sustainability_carbon_footprint, unk_sustainability_carbon_footprint)).

0.95::acc(s3, sustainability_recycled_steel_standard).
% @attr sustainability_recycled_steel_standard
% @type categorical
% @canonical false
% @original_name sustainability_certification (recycled steel standard)
% @values standard_all_boards=Standard_on_all_boards unk_sustainability_recycled_steel_standard=Unknown
% @importance 1.00
0.97::true_val(sustainability_recycled_steel_standard, standard_all_boards); 0.03::true_val(sustainability_recycled_steel_standard, unk_sustainability_recycled_steel_standard).
measured(s3, sustainability_recycled_steel_standard, standard_all_boards).
all_consistent(sustainability_recycled_steel_standard) :- consistent(s3, sustainability_recycled_steel_standard).
evidence(all_consistent(sustainability_recycled_steel_standard)).
query(true_val(sustainability_recycled_steel_standard, standard_all_boards)).
query(true_val(sustainability_recycled_steel_standard, unk_sustainability_recycled_steel_standard)).

0.95::acc(s3, sustainability_recycled_sidewalls).
% @attr sustainability_recycled_sidewalls
% @type categorical
% @canonical false
% @original_name sustainability_certification (35% recycled sidewalls)
% @values pct35_recycled_abs=35pct_recycled_ABS unk_sustainability_recycled_sidewalls=Unknown
% @importance 1.00
0.97::true_val(sustainability_recycled_sidewalls, pct35_recycled_abs); 0.03::true_val(sustainability_recycled_sidewalls, unk_sustainability_recycled_sidewalls).
measured(s3, sustainability_recycled_sidewalls, pct35_recycled_abs).
all_consistent(sustainability_recycled_sidewalls) :- consistent(s3, sustainability_recycled_sidewalls).
evidence(all_consistent(sustainability_recycled_sidewalls)).
query(true_val(sustainability_recycled_sidewalls, pct35_recycled_abs)).
query(true_val(sustainability_recycled_sidewalls, unk_sustainability_recycled_sidewalls)).

0.93::acc(s3, available_sizes).
0.88::acc(s19, available_sizes).
0.82::acc(s2, available_sizes).
% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values two_sizes_156_159=156_159_only four_sizes_148_152_156_160=148_152_156_160
% @importance 0.87
0.40::true_val(available_sizes, two_sizes_156_159); 0.60::true_val(available_sizes, four_sizes_148_152_156_160).
measured(s3, available_sizes, two_sizes_156_159).
measured(s19, available_sizes, two_sizes_156_159).
measured(s2, available_sizes, four_sizes_148_152_156_160).
all_consistent(available_sizes) :- consistent(s3, available_sizes), consistent(s19, available_sizes), (indep(s2), consistent(s2, available_sizes) ; \+indep(s2)).
evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, two_sizes_156_159)).
query(true_val(available_sizes, four_sizes_148_152_156_160)).

0.95::acc(s3, tip_tail_width_size).
% @attr tip_tail_width_size
% @type categorical
% @unit mm
% @canonical true
% @original_name tip_tail_width_size (156mw)
% @values v298_294=298mm_294mm unk_tip_tail_width_size=Unknown
% @importance 1.00
0.97::true_val(tip_tail_width_size, v298_294); 0.03::true_val(tip_tail_width_size, unk_tip_tail_width_size).
measured(s3, tip_tail_width_size, v298_294).
all_consistent(tip_tail_width_size) :- consistent(s3, tip_tail_width_size).
evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v298_294)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

0.93::acc(s3, waist_width_156).
0.82::acc(s2, waist_width_156).
% @attr waist_width_156
% @type numeric
% @unit cm
% @canonical false
% @original_name 156mw/156 waist width
% @values v25_3=25.3 v25_5=25.5
% @importance 0.975
0.45::true_val(waist_width_156, v25_3); 0.55::true_val(waist_width_156, v25_5).
measured(s3, waist_width_156, v25_3).
measured(s2, waist_width_156, v25_5).
all_consistent(waist_width_156) :- consistent(s3, waist_width_156), (indep(s2), consistent(s2, waist_width_156) ; \+indep(s2)).
evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v25_3)).
query(true_val(waist_width_156, v25_5)).

0.95::acc(s3, contact_length_size).
0.82::acc(s2, contact_length_size).
% @attr contact_length_size
% @type numeric
% @unit mm
% @canonical true
% @original_name contact_length_size (156)
% @values v1120=1120.0 unk_contact_length_size=Unknown
% @importance 0.975
0.97::true_val(contact_length_size, v1120); 0.03::true_val(contact_length_size, unk_contact_length_size).
measured(s3, contact_length_size, v1120).
measured(s2, contact_length_size, v1120).
all_consistent(contact_length_size) :- consistent(s3, contact_length_size), (indep(s2), consistent(s2, contact_length_size) ; \+indep(s2)).
evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v1120)).
query(true_val(contact_length_size, unk_contact_length_size)).

0.95::acc(s3, sidecut_radius_size).
0.82::acc(s2, sidecut_radius_size).
% @attr sidecut_radius_size
% @type categorical
% @unit m
% @canonical true
% @original_name sidecut_radius_size (156)
% @values v8_0_6_3=8.0_6.3m unk_sidecut_radius_size=Unknown
% @importance 0.975
0.97::true_val(sidecut_radius_size, v8_0_6_3); 0.03::true_val(sidecut_radius_size, unk_sidecut_radius_size).
measured(s3, sidecut_radius_size, v8_0_6_3).
measured(s2, sidecut_radius_size, v8_0_6_3).
all_consistent(sidecut_radius_size) :- consistent(s3, sidecut_radius_size), (indep(s2), consistent(s2, sidecut_radius_size) ; \+indep(s2)).
evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v8_0_6_3)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

0.95::acc(s3, stance_width_range_size).
% @attr stance_width_range_size
% @type categorical
% @unit cm
% @canonical true
% @original_name stance_width_range_size (156mw)
% @values v48_60=48_60cm unk_stance_width_range_size=Unknown
% @importance 1.00
0.97::true_val(stance_width_range_size, v48_60); 0.03::true_val(stance_width_range_size, unk_stance_width_range_size).
measured(s3, stance_width_range_size, v48_60).
all_consistent(stance_width_range_size) :- consistent(s3, stance_width_range_size).
evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v48_60)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

0.95::acc(s3, recommended_weight_range_size).
0.82::acc(s2, recommended_weight_range_size).
% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size (156)
% @values v50_plus=50_plus_kg unk_recommended_weight_range_size=Unknown
% @importance 0.975
0.97::true_val(recommended_weight_range_size, v50_plus); 0.03::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).
measured(s3, recommended_weight_range_size, v50_plus).
measured(s2, recommended_weight_range_size, v50_plus).
all_consistent(recommended_weight_range_size) :- consistent(s3, recommended_weight_range_size), (indep(s2), consistent(s2, recommended_weight_range_size) ; \+indep(s2)).
evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, v50_plus)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

0.95::acc(s3, setback).
0.82::acc(s2, setback).
% @attr setback
% @type numeric
% @unit mm
% @canonical true
% @original_name setback (156)
% @values v_neg15=neg15.0 unk_setback=Unknown
% @importance 0.975
0.97::true_val(setback, v_neg15); 0.03::true_val(setback, unk_setback).
measured(s3, setback, v_neg15).
measured(s2, setback, v_neg15).
all_consistent(setback) :- consistent(s3, setback), (indep(s2), consistent(s2, setback) ; \+indep(s2)).
evidence(all_consistent(setback)).
query(true_val(setback, v_neg15)).
query(true_val(setback, unk_setback)).

0.95::acc(s3, tip_tail_width_size_159mw).
% @attr tip_tail_width_size_159mw
% @type categorical
% @unit mm
% @canonical false
% @original_name tip_tail_width_size (159mw)
% @values v302_298=302mm_298mm unk_tip_tail_width_size_159mw=Unknown
% @importance 1.00
0.97::true_val(tip_tail_width_size_159mw, v302_298); 0.03::true_val(tip_tail_width_size_159mw, unk_tip_tail_width_size_159mw).
measured(s3, tip_tail_width_size_159mw, v302_298).
all_consistent(tip_tail_width_size_159mw) :- consistent(s3, tip_tail_width_size_159mw).
evidence(all_consistent(tip_tail_width_size_159mw)).
query(true_val(tip_tail_width_size_159mw, v302_298)).
query(true_val(tip_tail_width_size_159mw, unk_tip_tail_width_size_159mw)).

0.95::acc(s3, waist_width_159mw).
% @attr waist_width_159mw
% @type numeric
% @unit mm
% @canonical false
% @original_name 159mw waist width
% @values v256=256.0 unk_waist_width_159mw=Unknown
% @importance 1.00
0.97::true_val(waist_width_159mw, v256); 0.03::true_val(waist_width_159mw, unk_waist_width_159mw).
measured(s3, waist_width_159mw, v256).
all_consistent(waist_width_159mw) :- consistent(s3, waist_width_159mw).
evidence(all_consistent(waist_width_159mw)).
query(true_val(waist_width_159mw, v256)).
query(true_val(waist_width_159mw, unk_waist_width_159mw)).

0.95::acc(s3, contact_length_size_159mw).
% @attr contact_length_size_159mw
% @type numeric
% @unit mm
% @canonical false
% @original_name contact_length_size (159mw)
% @values v1150=1150.0 unk_contact_length_size_159mw=Unknown
% @importance 1.00
0.97::true_val(contact_length_size_159mw, v1150); 0.03::true_val(contact_length_size_159mw, unk_contact_length_size_159mw).
measured(s3, contact_length_size_159mw, v1150).
all_consistent(contact_length_size_159mw) :- consistent(s3, contact_length_size_159mw).
evidence(all_consistent(contact_length_size_159mw)).
query(true_val(contact_length_size_159mw, v1150)).
query(true_val(contact_length_size_159mw, unk_contact_length_size_159mw)).

0.95::acc(s3, sidecut_radius_size_159mw).
% @attr sidecut_radius_size_159mw
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size (159mw)
% @values v8_2_6_5=8.2_6.5m unk_sidecut_radius_size_159mw=Unknown
% @importance 1.00
0.97::true_val(sidecut_radius_size_159mw, v8_2_6_5); 0.03::true_val(sidecut_radius_size_159mw, unk_sidecut_radius_size_159mw).
measured(s3, sidecut_radius_size_159mw, v8_2_6_5).
all_consistent(sidecut_radius_size_159mw) :- consistent(s3, sidecut_radius_size_159mw).
evidence(all_consistent(sidecut_radius_size_159mw)).
query(true_val(sidecut_radius_size_159mw, v8_2_6_5)).
query(true_val(sidecut_radius_size_159mw, unk_sidecut_radius_size_159mw)).

0.95::acc(s3, stance_width_range_size_159mw).
% @attr stance_width_range_size_159mw
% @type categorical
% @unit cm
% @canonical false
% @original_name stance_width_range_size (159mw)
% @values v50_62=50_62cm unk_stance_width_range_size_159mw=Unknown
% @importance 1.00
0.97::true_val(stance_width_range_size_159mw, v50_62); 0.03::true_val(stance_width_range_size_159mw, unk_stance_width_range_size_159mw).
measured(s3, stance_width_range_size_159mw, v50_62).
all_consistent(stance_width_range_size_159mw) :- consistent(s3, stance_width_range_size_159mw).
evidence(all_consistent(stance_width_range_size_159mw)).
query(true_val(stance_width_range_size_159mw, v50_62)).
query(true_val(stance_width_range_size_159mw, unk_stance_width_range_size_159mw)).

0.95::acc(s3, recommended_weight_range_size_159mw).
% @attr recommended_weight_range_size_159mw
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (159mw)
% @values v60_plus=60_plus_kg unk_recommended_weight_range_size_159mw=Unknown
% @importance 1.00
0.97::true_val(recommended_weight_range_size_159mw, v60_plus); 0.03::true_val(recommended_weight_range_size_159mw, unk_recommended_weight_range_size_159mw).
measured(s3, recommended_weight_range_size_159mw, v60_plus).
all_consistent(recommended_weight_range_size_159mw) :- consistent(s3, recommended_weight_range_size_159mw).
evidence(all_consistent(recommended_weight_range_size_159mw)).
query(true_val(recommended_weight_range_size_159mw, v60_plus)).
query(true_val(recommended_weight_range_size_159mw, unk_recommended_weight_range_size_159mw)).

0.95::acc(s3, setback_159mw).
% @attr setback_159mw
% @type numeric
% @unit mm
% @canonical false
% @original_name setback (159mw)
% @values v_neg15=neg15.0 unk_setback_159mw=Unknown
% @importance 1.00
0.97::true_val(setback_159mw, v_neg15); 0.03::true_val(setback_159mw, unk_setback_159mw).
measured(s3, setback_159mw, v_neg15).
all_consistent(setback_159mw) :- consistent(s3, setback_159mw).
evidence(all_consistent(setback_159mw)).
query(true_val(setback_159mw, v_neg15)).
query(true_val(setback_159mw, unk_setback_159mw)).

0.82::acc(s2, contact_length_size_148).
% @attr contact_length_size_148
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size (148)
% @values v106_0=106.0 unk_contact_length_size_148=Unknown
% @importance 0.95
0.90::true_val(contact_length_size_148, v106_0); 0.10::true_val(contact_length_size_148, unk_contact_length_size_148).
measured(s2, contact_length_size_148, v106_0).
all_consistent(contact_length_size_148) :- (indep(s2), consistent(s2, contact_length_size_148) ; \+indep(s2)).
evidence(all_consistent(contact_length_size_148)).
query(true_val(contact_length_size_148, v106_0)).
query(true_val(contact_length_size_148, unk_contact_length_size_148)).

0.82::acc(s2, tip_width_size_148).
% @attr tip_width_size_148
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (148 tip)
% @values v28_6=28.6 unk_tip_width_size_148=Unknown
% @importance 0.95
0.90::true_val(tip_width_size_148, v28_6); 0.10::true_val(tip_width_size_148, unk_tip_width_size_148).
measured(s2, tip_width_size_148, v28_6).
all_consistent(tip_width_size_148) :- (indep(s2), consistent(s2, tip_width_size_148) ; \+indep(s2)).
evidence(all_consistent(tip_width_size_148)).
query(true_val(tip_width_size_148, v28_6)).
query(true_val(tip_width_size_148, unk_tip_width_size_148)).

0.82::acc(s2, tail_width_size_148).
% @attr tail_width_size_148
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (148 tail)
% @values v28_2=28.2 unk_tail_width_size_148=Unknown
% @importance 0.95
0.90::true_val(tail_width_size_148, v28_2); 0.10::true_val(tail_width_size_148, unk_tail_width_size_148).
measured(s2, tail_width_size_148, v28_2).
all_consistent(tail_width_size_148) :- (indep(s2), consistent(s2, tail_width_size_148) ; \+indep(s2)).
evidence(all_consistent(tail_width_size_148)).
query(true_val(tail_width_size_148, v28_2)).
query(true_val(tail_width_size_148, unk_tail_width_size_148)).

0.82::acc(s2, waist_width_148).
% @attr waist_width_148
% @type numeric
% @unit cm
% @canonical false
% @original_name 148cm waist width
% @values v24_3=24.3 unk_waist_width_148=Unknown
% @importance 0.95
0.90::true_val(waist_width_148, v24_3); 0.10::true_val(waist_width_148, unk_waist_width_148).
measured(s2, waist_width_148, v24_3).
all_consistent(waist_width_148) :- (indep(s2), consistent(s2, waist_width_148) ; \+indep(s2)).
evidence(all_consistent(waist_width_148)).
query(true_val(waist_width_148, v24_3)).
query(true_val(waist_width_148, unk_waist_width_148)).

0.82::acc(s2, sidecut_radius_size_148).
% @attr sidecut_radius_size_148
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size (148)
% @values v7_5_5_9=7.5_5.9m unk_sidecut_radius_size_148=Unknown
% @importance 0.95
0.90::true_val(sidecut_radius_size_148, v7_5_5_9); 0.10::true_val(sidecut_radius_size_148, unk_sidecut_radius_size_148).
measured(s2, sidecut_radius_size_148, v7_5_5_9).
all_consistent(sidecut_radius_size_148) :- (indep(s2), consistent(s2, sidecut_radius_size_148) ; \+indep(s2)).
evidence(all_consistent(sidecut_radius_size_148)).
query(true_val(sidecut_radius_size_148, v7_5_5_9)).
query(true_val(sidecut_radius_size_148, unk_sidecut_radius_size_148)).

0.82::acc(s2, setback_148).
% @attr setback_148
% @type numeric
% @unit cm
% @canonical false
% @original_name setback (148)
% @values v_neg1_5=neg1.5 unk_setback_148=Unknown
% @importance 0.95
0.90::true_val(setback_148, v_neg1_5); 0.10::true_val(setback_148, unk_setback_148).
measured(s2, setback_148, v_neg1_5).
all_consistent(setback_148) :- (indep(s2), consistent(s2, setback_148) ; \+indep(s2)).
evidence(all_consistent(setback_148)).
query(true_val(setback_148, v_neg1_5)).
query(true_val(setback_148, unk_setback_148)).

0.82::acc(s2, recommended_weight_range_size_148).
% @attr recommended_weight_range_size_148
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (148)
% @values v45_65=45_65_kg unk_recommended_weight_range_size_148=Unknown
% @importance 0.95
0.90::true_val(recommended_weight_range_size_148, v45_65); 0.10::true_val(recommended_weight_range_size_148, unk_recommended_weight_range_size_148).
measured(s2, recommended_weight_range_size_148, v45_65).
all_consistent(recommended_weight_range_size_148) :- (indep(s2), consistent(s2, recommended_weight_range_size_148) ; \+indep(s2)).
evidence(all_consistent(recommended_weight_range_size_148)).
query(true_val(recommended_weight_range_size_148, v45_65)).
query(true_val(recommended_weight_range_size_148, unk_recommended_weight_range_size_148)).

0.82::acc(s2, contact_length_size_152).
% @attr contact_length_size_152
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size (152)
% @values v109_0=109.0 unk_contact_length_size_152=Unknown
% @importance 0.95
0.90::true_val(contact_length_size_152, v109_0); 0.10::true_val(contact_length_size_152, unk_contact_length_size_152).
measured(s2, contact_length_size_152, v109_0).
all_consistent(contact_length_size_152) :- (indep(s2), consistent(s2, contact_length_size_152) ; \+indep(s2)).
evidence(all_consistent(contact_length_size_152)).
query(true_val(contact_length_size_152, v109_0)).
query(true_val(contact_length_size_152, unk_contact_length_size_152)).

0.82::acc(s2, tip_width_size_152).
% @attr tip_width_size_152
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (152 tip)
% @values v28_9=28.9 unk_tip_width_size_152=Unknown
% @importance 0.95
0.90::true_val(tip_width_size_152, v28_9); 0.10::true_val(tip_width_size_152, unk_tip_width_size_152).
measured(s2, tip_width_size_152, v28_9).
all_consistent(tip_width_size_152) :- (indep(s2), consistent(s2, tip_width_size_152) ; \+indep(s2)).
evidence(all_consistent(tip_width_size_152)).
query(true_val(tip_width_size_152, v28_9)).
query(true_val(tip_width_size_152, unk_tip_width_size_152)).

0.82::acc(s2, tail_width_size_152).
% @attr tail_width_size_152
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (152 tail)
% @values v28_6=28.6 unk_tail_width_size_152=Unknown
% @importance 0.95
0.90::true_val(tail_width_size_152, v28_6); 0.10::true_val(tail_width_size_152, unk_tail_width_size_152).
measured(s2, tail_width_size_152, v28_6).
all_consistent(tail_width_size_152) :- (indep(s2), consistent(s2, tail_width_size_152) ; \+indep(s2)).
evidence(all_consistent(tail_width_size_152)).
query(true_val(tail_width_size_152, v28_6)).
query(true_val(tail_width_size_152, unk_tail_width_size_152)).

0.82::acc(s2, waist_width_152).
% @attr waist_width_152
% @type numeric
% @unit cm
% @canonical false
% @original_name 152cm waist width
% @values v24_6=24.6 unk_waist_width_152=Unknown
% @importance 0.95
0.90::true_val(waist_width_152, v24_6); 0.10::true_val(waist_width_152, unk_waist_width_152).
measured(s2, waist_width_152, v24_6).
all_consistent(waist_width_152) :- (indep(s2), consistent(s2, waist_width_152) ; \+indep(s2)).
evidence(all_consistent(waist_width_152)).
query(true_val(waist_width_152, v24_6)).
query(true_val(waist_width_152, unk_waist_width_152)).

0.82::acc(s2, sidecut_radius_size_152).
% @attr sidecut_radius_size_152
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size (152)
% @values v7_8_6_1=7.8_6.1m unk_sidecut_radius_size_152=Unknown
% @importance 0.95
0.90::true_val(sidecut_radius_size_152, v7_8_6_1); 0.10::true_val(sidecut_radius_size_152, unk_sidecut_radius_size_152).
measured(s2, sidecut_radius_size_152, v7_8_6_1).
all_consistent(sidecut_radius_size_152) :- (indep(s2), consistent(s2, sidecut_radius_size_152) ; \+indep(s2)).
evidence(all_consistent(sidecut_radius_size_152)).
query(true_val(sidecut_radius_size_152, v7_8_6_1)).
query(true_val(sidecut_radius_size_152, unk_sidecut_radius_size_152)).

0.82::acc(s2, setback_152).
% @attr setback_152
% @type numeric
% @unit cm
% @canonical false
% @original_name setback (152)
% @values v_neg1_5=neg1.5 unk_setback_152=Unknown
% @importance 0.95
0.90::true_val(setback_152, v_neg1_5); 0.10::true_val(setback_152, unk_setback_152).
measured(s2, setback_152, v_neg1_5).
all_consistent(setback_152) :- (indep(s2), consistent(s2, setback_152) ; \+indep(s2)).
evidence(all_consistent(setback_152)).
query(true_val(setback_152, v_neg1_5)).
query(true_val(setback_152, unk_setback_152)).

0.82::acc(s2, recommended_weight_range_size_152).
% @attr recommended_weight_range_size_152
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (152)
% @values v55_plus=55_plus_kg unk_recommended_weight_range_size_152=Unknown
% @importance 0.95
0.90::true_val(recommended_weight_range_size_152, v55_plus); 0.10::true_val(recommended_weight_range_size_152, unk_recommended_weight_range_size_152).
measured(s2, recommended_weight_range_size_152, v55_plus).
all_consistent(recommended_weight_range_size_152) :- (indep(s2), consistent(s2, recommended_weight_range_size_152) ; \+indep(s2)).
evidence(all_consistent(recommended_weight_range_size_152)).
query(true_val(recommended_weight_range_size_152, v55_plus)).
query(true_val(recommended_weight_range_size_152, unk_recommended_weight_range_size_152)).

0.82::acc(s2, tip_width_size_156).
% @attr tip_width_size_156
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (156 tip)
% @values v30_0=30.0 unk_tip_width_size_156=Unknown
% @importance 0.95
0.90::true_val(tip_width_size_156, v30_0); 0.10::true_val(tip_width_size_156, unk_tip_width_size_156).
measured(s2, tip_width_size_156, v30_0).
all_consistent(tip_width_size_156) :- (indep(s2), consistent(s2, tip_width_size_156) ; \+indep(s2)).
evidence(all_consistent(tip_width_size_156)).
query(true_val(tip_width_size_156, v30_0)).
query(true_val(tip_width_size_156, unk_tip_width_size_156)).

0.82::acc(s2, tail_width_size_156).
% @attr tail_width_size_156
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (156 tail)
% @values v29_6=29.6 unk_tail_width_size_156=Unknown
% @importance 0.95
0.90::true_val(tail_width_size_156, v29_6); 0.10::true_val(tail_width_size_156, unk_tail_width_size_156).
measured(s2, tail_width_size_156, v29_6).
all_consistent(tail_width_size_156) :- (indep(s2), consistent(s2, tail_width_size_156) ; \+indep(s2)).
evidence(all_consistent(tail_width_size_156)).
query(true_val(tail_width_size_156, v29_6)).
query(true_val(tail_width_size_156, unk_tail_width_size_156)).

0.82::acc(s2, contact_length_size_160).
% @attr contact_length_size_160
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size (160)
% @values v115_0=115.0 unk_contact_length_size_160=Unknown
% @importance 0.95
0.90::true_val(contact_length_size_160, v115_0); 0.10::true_val(contact_length_size_160, unk_contact_length_size_160).
measured(s2, contact_length_size_160, v115_0).
all_consistent(contact_length_size_160) :- (indep(s2), consistent(s2, contact_length_size_160) ; \+indep(s2)).
evidence(all_consistent(contact_length_size_160)).
query(true_val(contact_length_size_160, v115_0)).
query(true_val(contact_length_size_160, unk_contact_length_size_160)).

0.82::acc(s2, tip_width_size_160).
% @attr tip_width_size_160
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (160 tip)
% @values v30_6=30.6 unk_tip_width_size_160=Unknown
% @importance 0.95
0.90::true_val(tip_width_size_160, v30_6); 0.10::true_val(tip_width_size_160, unk_tip_width_size_160).
measured(s2, tip_width_size_160, v30_6).
all_consistent(tip_width_size_160) :- (indep(s2), consistent(s2, tip_width_size_160) ; \+indep(s2)).
evidence(all_consistent(tip_width_size_160)).
query(true_val(tip_width_size_160, v30_6)).
query(true_val(tip_width_size_160, unk_tip_width_size_160)).

0.82::acc(s2, tail_width_size_160).
% @attr tail_width_size_160
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (160 tail)
% @values v30_2=30.2 unk_tail_width_size_160=Unknown
% @importance 0.95
0.90::true_val(tail_width_size_160, v30_2); 0.10::true_val(tail_width_size_160, unk_tail_width_size_160).
measured(s2, tail_width_size_160, v30_2).
all_consistent(tail_width_size_160) :- (indep(s2), consistent(s2, tail_width_size_160) ; \+indep(s2)).
evidence(all_consistent(tail_width_size_160)).
query(true_val(tail_width_size_160, v30_2)).
query(true_val(tail_width_size_160, unk_tail_width_size_160)).

0.82::acc(s2, waist_width_160).
% @attr waist_width_160
% @type numeric
% @unit cm
% @canonical false
% @original_name 160cm waist width
% @values v26_0=26.0 unk_waist_width_160=Unknown
% @importance 0.95
0.90::true_val(waist_width_160, v26_0); 0.10::true_val(waist_width_160, unk_waist_width_160).
measured(s2, waist_width_160, v26_0).
all_consistent(waist_width_160) :- (indep(s2), consistent(s2, waist_width_160) ; \+indep(s2)).
evidence(all_consistent(waist_width_160)).
query(true_val(waist_width_160, v26_0)).
query(true_val(waist_width_160, unk_waist_width_160)).

0.82::acc(s2, sidecut_radius_size_160).
% @attr sidecut_radius_size_160
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size (160)
% @values v8_2_6_5=8.2_6.5m unk_sidecut_radius_size_160=Unknown
% @importance 0.95
0.90::true_val(sidecut_radius_size_160, v8_2_6_5); 0.10::true_val(sidecut_radius_size_160, unk_sidecut_radius_size_160).
measured(s2, sidecut_radius_size_160, v8_2_6_5).
all_consistent(sidecut_radius_size_160) :- (indep(s2), consistent(s2, sidecut_radius_size_160) ; \+indep(s2)).
evidence(all_consistent(sidecut_radius_size_160)).
query(true_val(sidecut_radius_size_160, v8_2_6_5)).
query(true_val(sidecut_radius_size_160, unk_sidecut_radius_size_160)).

0.82::acc(s2, setback_160).
% @attr setback_160
% @type numeric
% @unit cm
% @canonical false
% @original_name setback (160)
% @values v_neg1_5=neg1.5 unk_setback_160=Unknown
% @importance 0.95
0.90::true_val(setback_160, v_neg1_5); 0.10::true_val(setback_160, unk_setback_160).
measured(s2, setback_160, v_neg1_5).
all_consistent(setback_160) :- (indep(s2), consistent(s2, setback_160) ; \+indep(s2)).
evidence(all_consistent(setback_160)).
query(true_val(setback_160, v_neg1_5)).
query(true_val(setback_160, unk_setback_160)).

0.82::acc(s2, recommended_weight_range_size_160).
% @attr recommended_weight_range_size_160
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (160)
% @values v60_plus=60_plus_kg unk_recommended_weight_range_size_160=Unknown
% @importance 0.95
0.90::true_val(recommended_weight_range_size_160, v60_plus); 0.10::true_val(recommended_weight_range_size_160, unk_recommended_weight_range_size_160).
measured(s2, recommended_weight_range_size_160, v60_plus).
all_consistent(recommended_weight_range_size_160) :- (indep(s2), consistent(s2, recommended_weight_range_size_160) ; \+indep(s2)).
evidence(all_consistent(recommended_weight_range_size_160)).
query(true_val(recommended_weight_range_size_160, v60_plus)).
query(true_val(recommended_weight_range_size_160, unk_recommended_weight_range_size_160)).

0.95::acc(s20, warranty_period_years).
0.80::acc(s21, warranty_period_years).
% @attr warranty_period_years
% @type numeric
% @unit years
% @canonical true
% @original_name warranty_period_years
% @values v2=2.0 unk_warranty_period_years=Unknown
% @importance 0.725
0.97::true_val(warranty_period_years, v2); 0.03::true_val(warranty_period_years, unk_warranty_period_years).
measured(s20, warranty_period_years, v2).
measured(s21, warranty_period_years, v2).
all_consistent(warranty_period_years) :- consistent(s20, warranty_period_years), (indep(s21), consistent(s21, warranty_period_years) ; \+indep(s21)).
evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v2)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

0.82::acc(s21, warranty).
% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values structural_only=Structural_defects_only_no_impact_abuse_wear unk_warranty=Unknown
% @importance 0.70
0.92::true_val(warranty, structural_only); 0.08::true_val(warranty, unk_warranty).
measured(s21, warranty, structural_only).
all_consistent(warranty) :- (indep(s21), consistent(s21, warranty) ; \+indep(s21)).
evidence(all_consistent(warranty)).
query(true_val(warranty, structural_only)).
query(true_val(warranty, unk_warranty)).

0.95::acc(s20, warranty_conditions).
% @attr warranty_conditions
% @type categorical
% @canonical false
% @original_name warranty (conditions)
% @values authorised_dealer_original=Authorised_dealers_only_original_purchaser unk_warranty_conditions=Unknown
% @importance 0.75
0.97::true_val(warranty_conditions, authorised_dealer_original); 0.03::true_val(warranty_conditions, unk_warranty_conditions).
measured(s20, warranty_conditions, authorised_dealer_original).
all_consistent(warranty_conditions) :- consistent(s20, warranty_conditions).
evidence(all_consistent(warranty_conditions)).
query(true_val(warranty_conditions, authorised_dealer_original)).
query(true_val(warranty_conditions, unk_warranty_conditions)).

0.82::acc(s2, price_aud_merchant_melbourne).
% @attr price_aud_merchant_melbourne
% @type numeric
% @unit AUD
% @canonical false
% @original_name price_aud_merchant (Melbourne Snowboard)
% @values v999_99=999.99 unk_price_aud_merchant_melbourne=Unknown
% @importance 0.95
0.90::true_val(price_aud_merchant_melbourne, v999_99); 0.10::true_val(price_aud_merchant_melbourne, unk_price_aud_merchant_melbourne).
measured(s2, price_aud_merchant_melbourne, v999_99).
all_consistent(price_aud_merchant_melbourne) :- (indep(s2), consistent(s2, price_aud_merchant_melbourne) ; \+indep(s2)).
evidence(all_consistent(price_aud_merchant_melbourne)).
query(true_val(price_aud_merchant_melbourne, v999_99)).
query(true_val(price_aud_merchant_melbourne, unk_price_aud_merchant_melbourne)).

0.78::acc(s22, price_aud_merchant).
% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v999=999.0 unk_price_aud_merchant=Unknown
% @importance 0.90
0.88::true_val(price_aud_merchant, v999); 0.12::true_val(price_aud_merchant, unk_price_aud_merchant).
measured(s22, price_aud_merchant, v999).
all_consistent(price_aud_merchant) :- (indep(s22), consistent(s22, price_aud_merchant) ; \+indep(s22)).
evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v999)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

0.90::acc(s23, price_usd_msrp).
0.88::acc(s19, price_usd_msrp).
% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v599_95=599.95 v599=599.0
% @importance 0.925
0.55::true_val(price_usd_msrp, v599_95); 0.45::true_val(price_usd_msrp, v599).
measured(s23, price_usd_msrp, v599_95).
measured(s19, price_usd_msrp, v599).
all_consistent(price_usd_msrp) :- consistent(s23, price_usd_msrp), consistent(s19, price_usd_msrp).
evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v599_95)).
query(true_val(price_usd_msrp, v599)).

0.65::acc(s12, price_usd_msrp_2021).
% @attr price_usd_msrp_2021
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_msrp (2020-2021 model)
% @values v519_95=519.95 unk_price_usd_msrp_2021=Unknown
% @importance 0.80
0.75::true_val(price_usd_msrp_2021, v519_95); 0.25::true_val(price_usd_msrp_2021, unk_price_usd_msrp_2021).
measured(s12, price_usd_msrp_2021, v519_95).
all_consistent(price_usd_msrp_2021) :- consistent(s12, price_usd_msrp_2021).
evidence(all_consistent(price_usd_msrp_2021)).
query(true_val(price_usd_msrp_2021, v519_95)).
query(true_val(price_usd_msrp_2021, unk_price_usd_msrp_2021)).

0.88::acc(s19, price_eur_blue_tomato).
% @attr price_eur_blue_tomato
% @type numeric
% @unit EUR
% @canonical false
% @original_name price_eur_blue_tomato
% @values v649_95=649.95 unk_price_eur_blue_tomato=Unknown
% @importance 0.95
0.92::true_val(price_eur_blue_tomato, v649_95); 0.08::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).
measured(s19, price_eur_blue_tomato, v649_95).
all_consistent(price_eur_blue_tomato) :- consistent(s19, price_eur_blue_tomato).
evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v649_95)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

0.95::acc(s3, price_eur_nitro_official).
% @attr price_eur_nitro_official
% @type numeric
% @unit EUR
% @canonical false
% @original_name Price EUR (Nitro official EU, 2026 model)
% @values v649_90=649.90 unk_price_eur_nitro_official=Unknown
% @importance 1.00
0.97::true_val(price_eur_nitro_official, v649_90); 0.03::true_val(price_eur_nitro_official, unk_price_eur_nitro_official).
measured(s3, price_eur_nitro_official, v649_90).
all_consistent(price_eur_nitro_official) :- consistent(s3, price_eur_nitro_official).
evidence(all_consistent(price_eur_nitro_official)).
query(true_val(price_eur_nitro_official, v649_90)).
query(true_val(price_eur_nitro_official, unk_price_eur_nitro_official)).

0.88::acc(s19, price_usd_evo).
% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_evo
% @values v479_96=479.96 unk_price_usd_evo=Unknown
% @importance 0.95
0.92::true_val(price_usd_evo, v479_96); 0.08::true_val(price_usd_evo, unk_price_usd_evo).
measured(s19, price_usd_evo, v479_96).
all_consistent(price_usd_evo) :- consistent(s19, price_usd_evo).
evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v479_96)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

0.85::acc(s19, price_usd_christy_sports_sale).
% @attr price_usd_christy_sports_sale
% @type numeric
% @unit USD
% @canonical false
% @original_name Sale price USD (Christy Sports, 2026 clearance)
% @values v359_97=359.97 unk_price_usd_christy_sports_sale=Unknown
% @importance 0.95
0.90::true_val(price_usd_christy_sports_sale, v359_97); 0.10::true_val(price_usd_christy_sports_sale, unk_price_usd_christy_sports_sale).
measured(s19, price_usd_christy_sports_sale, v359_97).
all_consistent(price_usd_christy_sports_sale) :- consistent(s19, price_usd_christy_sports_sale).
evidence(all_consistent(price_usd_christy_sports_sale)).
query(true_val(price_usd_christy_sports_sale, v359_97)).
query(true_val(price_usd_christy_sports_sale, unk_price_usd_christy_sports_sale)).

0.85::acc(s19, price_usd_gravity_coalition_sale).
% @attr price_usd_gravity_coalition_sale
% @type numeric
% @unit USD
% @canonical false
% @original_name Sale price USD (Gravity Coalition, 2025 model)
% @values v398_97=398.97 unk_price_usd_gravity_coalition_sale=Unknown
% @importance 0.95
0.90::true_val(price_usd_gravity_coalition_sale, v398_97); 0.10::true_val(price_usd_gravity_coalition_sale, unk_price_usd_gravity_coalition_sale).
measured(s19, price_usd_gravity_coalition_sale, v398_97).
all_consistent(price_usd_gravity_coalition_sale) :- consistent(s19, price_usd_gravity_coalition_sale).
evidence(all_consistent(price_usd_gravity_coalition_sale)).
query(true_val(price_usd_gravity_coalition_sale, v398_97)).
query(true_val(price_usd_gravity_coalition_sale, unk_price_usd_gravity_coalition_sale)).

0.55::acc(s24, price_usd_east_fork_sale).
% @attr price_usd_east_fork_sale
% @type numeric
% @unit USD
% @canonical false
% @original_name Sale price USD (East Fork Bikes, older model)
% @values v450=450.0 unk_price_usd_east_fork_sale=Unknown
% @importance 0.60
0.68::true_val(price_usd_east_fork_sale, v450); 0.32::true_val(price_usd_east_fork_sale, unk_price_usd_east_fork_sale).
measured(s24, price_usd_east_fork_sale, v450).
all_consistent(price_usd_east_fork_sale) :- consistent(s24, price_usd_east_fork_sale).
evidence(all_consistent(price_usd_east_fork_sale)).
query(true_val(price_usd_east_fork_sale, v450)).
query(true_val(price_usd_east_fork_sale, unk_price_usd_east_fork_sale)).

0.88::acc(s19, price_gbp_blue_tomato_uk).
% @attr price_gbp_blue_tomato_uk
% @type numeric
% @unit GBP
% @canonical true
% @original_name price_gbp_blue_tomato_uk
% @values v580=580.0 unk_price_gbp_blue_tomato_uk=Unknown
% @importance 0.95
0.92::true_val(price_gbp_blue_tomato_uk, v580); 0.08::true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk).
measured(s19, price_gbp_blue_tomato_uk, v580).
all_consistent(price_gbp_blue_tomato_uk) :- consistent(s19, price_gbp_blue_tomato_uk).
evidence(all_consistent(price_gbp_blue_tomato_uk)).
query(true_val(price_gbp_blue_tomato_uk, v580)).
query(true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk)).

0.88::acc(s19, price_sek_blue_tomato).
% @attr price_sek_blue_tomato
% @type numeric
% @unit SEK
% @canonical false
% @original_name Price SEK (BlueTomato Sweden)
% @values v6999=6999.0 unk_price_sek_blue_tomato=Unknown
% @importance 0.95
0.92::true_val(price_sek_blue_tomato, v6999); 0.08::true_val(price_sek_blue_tomato, unk_price_sek_blue_tomato).
measured(s19, price_sek_blue_tomato, v6999).
all_consistent(price_sek_blue_tomato) :- consistent(s19, price_sek_blue_tomato).
evidence(all_consistent(price_sek_blue_tomato)).
query(true_val(price_sek_blue_tomato, v6999)).
query(true_val(price_sek_blue_tomato, unk_price_sek_blue_tomato)).

0.88::acc(s19, price_dkk_blue_tomato).
% @attr price_dkk_blue_tomato
% @type numeric
% @unit DKK
% @canonical false
% @original_name Price DKK (BlueTomato Denmark)
% @values v4850=4850.0 unk_price_dkk_blue_tomato=Unknown
% @importance 0.95
0.92::true_val(price_dkk_blue_tomato, v4850); 0.08::true_val(price_dkk_blue_tomato, unk_price_dkk_blue_tomato).
measured(s19, price_dkk_blue_tomato, v4850).
all_consistent(price_dkk_blue_tomato) :- consistent(s19, price_dkk_blue_tomato).
evidence(all_consistent(price_dkk_blue_tomato)).
query(true_val(price_dkk_blue_tomato, v4850)).
query(true_val(price_dkk_blue_tomato, unk_price_dkk_blue_tomato)).

0.88::acc(s19, price_eur_snowcountry).
% @attr price_eur_snowcountry
% @type numeric
% @unit EUR
% @canonical false
% @original_name Price EUR (SnowCountry, discounted)
% @values v519_96=519.96 unk_price_eur_snowcountry=Unknown
% @importance 0.95
0.92::true_val(price_eur_snowcountry, v519_96); 0.08::true_val(price_eur_snowcountry, unk_price_eur_snowcountry).
measured(s19, price_eur_snowcountry, v519_96).
all_consistent(price_eur_snowcountry) :- consistent(s19, price_eur_snowcountry).
evidence(all_consistent(price_eur_snowcountry)).
query(true_val(price_eur_snowcountry, v519_96)).
query(true_val(price_eur_snowcountry, unk_price_eur_snowcountry)).

0.82::acc(s2, availability_status).
% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values preorder=Preorder unk_availability_status=Unknown
% @importance 0.95
0.90::true_val(availability_status, preorder); 0.10::true_val(availability_status, unk_availability_status).
measured(s2, availability_status, preorder).
all_consistent(availability_status) :- (indep(s2), consistent(s2, availability_status) ; \+indep(s2)).
evidence(all_consistent(availability_status)).
query(true_val(availability_status, preorder)).
query(true_val(availability_status, unk_availability_status)).

0.82::acc(s2, estimated_availability_date).
0.75::acc(s15, estimated_availability_date).
% @attr estimated_availability_date
% @type categorical
% @canonical true
% @original_name estimated_availability_date
% @values may_2026=May_2026 unk_estimated_availability_date=Unknown
% @importance 0.825
0.92::true_val(estimated_availability_date, may_2026); 0.08::true_val(estimated_availability_date, unk_estimated_availability_date).
measured(s2, estimated_availability_date, may_2026).
measured(s15, estimated_availability_date, may_2026).
all_consistent(estimated_availability_date) :- (indep(s2), consistent(s2, estimated_availability_date) ; \+indep(s2)), (indep(s15), consistent(s15, estimated_availability_date) ; \+indep(s15)).
evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, may_2026)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

0.75::acc(s15, early_release_anz).
% @attr early_release_anz
% @type categorical
% @canonical false
% @original_name 2027 boards landing first in AU/NZ
% @values yes_anz_first=AU_NZ_before_rest_of_world unk_early_release_anz=Unknown
% @importance 0.70
0.88::true_val(early_release_anz, yes_anz_first); 0.12::true_val(early_release_anz, unk_early_release_anz).
measured(s15, early_release_anz, yes_anz_first).
all_consistent(early_release_anz) :- (indep(s15), consistent(s15, early_release_anz) ; \+indep(s15)).
evidence(all_consistent(early_release_anz)).
query(true_val(early_release_anz, yes_anz_first)).
query(true_val(early_release_anz, unk_early_release_anz)).

0.80::acc(s16, retailer_evo).
% @attr retailer_evo
% @type categorical
% @canonical false
% @original_name Retailer evo
% @values available=Available_evo_com unk_retailer_evo=Unknown
% @importance 0.85
0.92::true_val(retailer_evo, available); 0.08::true_val(retailer_evo, unk_retailer_evo).
measured(s16, retailer_evo, available).
all_consistent(retailer_evo) :- (indep(s16), consistent(s16, retailer_evo) ; \+indep(s16)).
evidence(all_consistent(retailer_evo)).
query(true_val(retailer_evo, available)).
query(true_val(retailer_evo, unk_retailer_evo)).

0.80::acc(s21, retailer_tactics).
% @attr retailer_tactics
% @type categorical
% @canonical false
% @original_name Retailer Tactics
% @values available=Available_tactics_com unk_retailer_tactics=Unknown
% @importance 0.70
0.90::true_val(retailer_tactics, available); 0.10::true_val(retailer_tactics, unk_retailer_tactics).
measured(s21, retailer_tactics, available).
all_consistent(retailer_tactics) :- (indep(s21), consistent(s21, retailer_tactics) ; \+indep(s21)).
evidence(all_consistent(retailer_tactics)).
query(true_val(retailer_tactics, available)).
query(true_val(retailer_tactics, unk_retailer_tactics)).

0.88::acc(s19, retailer_christy_sports).
% @attr retailer_christy_sports
% @type categorical
% @canonical false
% @original_name Retailer Christy Sports
% @values available=Available_Christy_Sports unk_retailer_christy_sports=Unknown
% @importance 0.95
0.92::true_val(retailer_christy_sports, available); 0.08::true_val(retailer_christy_sports, unk_retailer_christy_sports).
measured(s19, retailer_christy_sports, available).
all_consistent(retailer_christy_sports) :- consistent(s19, retailer_christy_sports).
evidence(all_consistent(retailer_christy_sports)).
query(true_val(retailer_christy_sports, available)).
query(true_val(retailer_christy_sports, unk_retailer_christy_sports)).

0.88::acc(s19, retailer_gravity_coalition).
% @attr retailer_gravity_coalition
% @type categorical
% @canonical false
% @original_name Retailer Gravity Coalition
% @values available=Available_Gravity_Coalition unk_retailer_gravity_coalition=Unknown
% @importance 0.95
0.92::true_val(retailer_gravity_coalition, available); 0.08::true_val(retailer_gravity_coalition, unk_retailer_gravity_coalition).
measured(s19, retailer_gravity_coalition, available).
all_consistent(retailer_gravity_coalition) :- consistent(s19, retailer_gravity_coalition).
evidence(all_consistent(retailer_gravity_coalition)).
query(true_val(retailer_gravity_coalition, available)).
query(true_val(retailer_gravity_coalition, unk_retailer_gravity_coalition)).

0.88::acc(s19, retailer_blauer_board).
% @attr retailer_blauer_board
% @type categorical
% @canonical false
% @original_name Retailer Blauer Board Shop
% @values available=Available_Blauer_Board_Shop unk_retailer_blauer_board=Unknown
% @importance 0.95
0.92::true_val(retailer_blauer_board, available); 0.08::true_val(retailer_blauer_board, unk_retailer_blauer_board).
measured(s19, retailer_blauer_board, available).
all_consistent(retailer_blauer_board) :- consistent(s19, retailer_blauer_board).
evidence(all_consistent(retailer_blauer_board)).
query(true_val(retailer_blauer_board, available)).
query(true_val(retailer_blauer_board, unk_retailer_blauer_board)).

0.65::acc(s25, retailer_rudeboys).
% @attr retailer_rudeboys
% @type categorical
% @canonical false
% @original_name Retailer Rudeboys
% @values available=Available_Rudeboys_Banff unk_retailer_rudeboys=Unknown
% @importance 0.50
0.80::true_val(retailer_rudeboys, available); 0.20::true_val(retailer_rudeboys, unk_retailer_rudeboys).
measured(s25, retailer_rudeboys, available).
all_consistent(retailer_rudeboys) :- (indep(s25), consistent(s25, retailer_rudeboys) ; \+indep(s25)).
evidence(all_consistent(retailer_rudeboys)).
query(true_val(retailer_rudeboys, available)).
query(true_val(retailer_rudeboys, unk_retailer_rudeboys)).

0.65::acc(s26, retailer_edge_of_world).
% @attr retailer_edge_of_world
% @type categorical
% @canonical false
% @original_name Retailer Edge of the World
% @values available=Available_Edge_of_World_Fernie unk_retailer_edge_of_world=Unknown
% @importance 0.40
0.78::true_val(retailer_edge_of_world, available); 0.22::true_val(retailer_edge_of_world, unk_retailer_edge_of_world).
measured(s26, retailer_edge_of_world, available).
all_consistent(retailer_edge_of_world) :- (indep(s26), consistent(s26, retailer_edge_of_world) ; \+indep(s26)).
evidence(all_consistent(retailer_edge_of_world)).
query(true_val(retailer_edge_of_world, available)).
query(true_val(retailer_edge_of_world, unk_retailer_edge_of_world)).

0.88::acc(s19, retailer_blue_tomato).
% @attr retailer_blue_tomato
% @type categorical
% @canonical false
% @original_name Retailer BlueTomato
% @values available=Available_BlueTomato_EU unk_retailer_blue_tomato=Unknown
% @importance 0.95
0.92::true_val(retailer_blue_tomato, available); 0.08::true_val(retailer_blue_tomato, unk_retailer_blue_tomato).
measured(s19, retailer_blue_tomato, available).
all_consistent(retailer_blue_tomato) :- consistent(s19, retailer_blue_tomato).
evidence(all_consistent(retailer_blue_tomato)).
query(true_val(retailer_blue_tomato, available)).
query(true_val(retailer_blue_tomato, unk_retailer_blue_tomato)).

0.88::acc(s19, retailer_snowcountry).
% @attr retailer_snowcountry
% @type categorical
% @canonical false
% @original_name Retailer SnowCountry
% @values available=Available_SnowCountry_EU unk_retailer_snowcountry=Unknown
% @importance 0.95
0.92::true_val(retailer_snowcountry, available); 0.08::true_val(retailer_snowcountry, unk_retailer_snowcountry).
measured(s19, retailer_snowcountry, available).
all_consistent(retailer_snowcountry) :- consistent(s19, retailer_snowcountry).
evidence(all_consistent(retailer_snowcountry)).
query(true_val(retailer_snowcountry, available)).
query(true_val(retailer_snowcountry, unk_retailer_snowcountry)).

0.75::acc(s18, retailer_melbourne_snowboard).
% @attr retailer_melbourne_snowboard
% @type categorical
% @canonical false
% @original_name Retailer Melbourne Snowboard Centre
% @values available=Available_Melbourne_Snowboard unk_retailer_melbourne_snowboard=Unknown
% @importance 0.65
0.85::true_val(retailer_melbourne_snowboard, available); 0.15::true_val(retailer_melbourne_snowboard, unk_retailer_melbourne_snowboard).
measured(s18, retailer_melbourne_snowboard, available).
all_consistent(retailer_melbourne_snowboard) :- (indep(s18), consistent(s18, retailer_melbourne_snowboard) ; \+indep(s18)).
evidence(all_consistent(retailer_melbourne_snowboard)).
query(true_val(retailer_melbourne_snowboard, available)).
query(true_val(retailer_melbourne_snowboard, unk_retailer_melbourne_snowboard)).

0.78::acc(s22, retailer_x_dream).
% @attr retailer_x_dream
% @type categorical
% @canonical false
% @original_name Retailer x-dream
% @values available=Available_x_dream_AU unk_retailer_x_dream=Unknown
% @importance 0.90
0.88::true_val(retailer_x_dream, available); 0.12::true_val(retailer_x_dream, unk_retailer_x_dream).
measured(s22, retailer_x_dream, available).
all_consistent(retailer_x_dream) :- (indep(s22), consistent(s22, retailer_x_dream) ; \+indep(s22)).
evidence(all_consistent(retailer_x_dream)).
query(true_val(retailer_x_dream, available)).
query(true_val(retailer_x_dream, unk_retailer_x_dream)).

0.75::acc(s15, retailer_balmoral_boards).
% @attr retailer_balmoral_boards
% @type categorical
% @canonical false
% @original_name Retailer Balmoral Boards
% @values available=Available_Balmoral_Boards_AU unk_retailer_balmoral_boards=Unknown
% @importance 0.70
0.88::true_val(retailer_balmoral_boards, available); 0.12::true_val(retailer_balmoral_boards, unk_retailer_balmoral_boards).
measured(s15, retailer_balmoral_boards, available).
all_consistent(retailer_balmoral_boards) :- (indep(s15), consistent(s15, retailer_balmoral_boards) ; \+indep(s15)).
evidence(all_consistent(retailer_balmoral_boards)).
query(true_val(retailer_balmoral_boards, available)).
query(true_val(retailer_balmoral_boards, unk_retailer_balmoral_boards)).

0.75::acc(s27, retailer_auski).
% @attr retailer_auski
% @type categorical
% @canonical false
% @original_name Retailer Auski Australia
% @values available=Available_Auski_AU unk_retailer_auski=Unknown
% @importance 0.55
0.85::true_val(retailer_auski, available); 0.15::true_val(retailer_auski, unk_retailer_auski).
measured(s27, retailer_auski, available).
all_consistent(retailer_auski) :- (indep(s27), consistent(s27, retailer_auski) ; \+indep(s27)).
evidence(all_consistent(retailer_auski)).
query(true_val(retailer_auski, available)).
query(true_val(retailer_auski, unk_retailer_auski)).

0.90::acc(s5, no_direct_online_sales).
% @attr no_direct_online_sales
% @type categorical
% @canonical false
% @original_name Nitro USA does not sell direct online
% @values confirmed=Relies_on_authorized_dealers unk_no_direct_online_sales=Unknown
% @importance 0.50
0.93::true_val(no_direct_online_sales, confirmed); 0.07::true_val(no_direct_online_sales, unk_no_direct_online_sales).
measured(s5, no_direct_online_sales, confirmed).
all_consistent(no_direct_online_sales) :- consistent(s5, no_direct_online_sales).
evidence(all_consistent(no_direct_online_sales)).
query(true_val(no_direct_online_sales, confirmed)).
query(true_val(no_direct_online_sales, unk_no_direct_online_sales)).

0.92::acc(s19, reviewer_opinion_the_good_ride).
% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values unique_springy_pop=Unique_springy_turning_good_float_great_pop unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.95
0.92::true_val(reviewer_opinion_the_good_ride, unique_springy_pop); 0.08::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).
measured(s19, reviewer_opinion_the_good_ride, unique_springy_pop).
all_consistent(reviewer_opinion_the_good_ride) :- consistent(s19, reviewer_opinion_the_good_ride).
evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, unique_springy_pop)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

0.90::acc(s19, carving_rating_tgr).
% @attr carving_rating_tgr
% @type categorical
% @canonical true
% @original_name carving_rating_tgr
% @values great=Great unk_carving_rating_tgr=Unknown
% @importance 0.95
0.92::true_val(carving_rating_tgr, great); 0.08::true_val(carving_rating_tgr, unk_carving_rating_tgr).
measured(s19, carving_rating_tgr, great).
all_consistent(carving_rating_tgr) :- consistent(s19, carving_rating_tgr).
evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, great)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

0.90::acc(s19, speed_rating_tgr).
% @attr speed_rating_tgr
% @type categorical
% @canonical true
% @original_name speed_rating_tgr
% @values great=Great unk_speed_rating_tgr=Unknown
% @importance 0.95
0.92::true_val(speed_rating_tgr, great); 0.08::true_val(speed_rating_tgr, unk_speed_rating_tgr).
measured(s19, speed_rating_tgr, great).
all_consistent(speed_rating_tgr) :- consistent(s19, speed_rating_tgr).
evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, great)).
query(true_val(speed_rating_tgr, unk_speed_rating_tgr)).

0.90::acc(s19, turning_rating_tgr).
% @attr turning_rating_tgr
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (Turning)
% @values great=Great unk_turning_rating_tgr=Unknown
% @importance 0.95
0.92::true_val(turning_rating_tgr, great); 0.08::true_val(turning_rating_tgr, unk_turning_rating_tgr).
measured(s19, turning_rating_tgr, great).
all_consistent(turning_rating_tgr) :- consistent(s19, turning_rating_tgr).
evidence(all_consistent(turning_rating_tgr)).
query(true_val(turning_rating_tgr, great)).
query(true_val(turning_rating_tgr, unk_turning_rating_tgr)).

0.90::acc(s19, jumps_rating_tgr).
% @attr jumps_rating_tgr
% @type categorical
% @canonical true
% @original_name jumps_rating_tgr
% @values great=Great unk_jumps_rating_tgr=Unknown
% @importance 0.95
0.92::true_val(jumps_rating_tgr, great); 0.08::true_val(jumps_rating_tgr, unk_jumps_rating_tgr).
measured(s19, jumps_rating_tgr, great).
all_consistent(jumps_rating_tgr) :- consistent(s19, jumps_rating_tgr).
evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, great)).
query(true_val(jumps_rating_tgr, unk_jumps_rating_tgr)).

0.90::acc(s19, powder_rating_tgr).
% @attr powder_rating_tgr
% @type categorical
% @canonical true
% @original_name powder_rating_tgr
% @values good=Good unk_powder_rating_tgr=Unknown
% @importance 0.95
0.92::true_val(powder_rating_tgr, good); 0.08::true_val(powder_rating_tgr, unk_powder_rating_tgr).
measured(s19, powder_rating_tgr, good).
all_consistent(powder_rating_tgr) :- consistent(s19, powder_rating_tgr).
evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, good)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

0.90::acc(s19, base_glide_performance).
% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values good=Good unk_base_glide_performance=Unknown
% @importance 0.95
0.92::true_val(base_glide_performance, good); 0.08::true_val(base_glide_performance, unk_base_glide_performance).
measured(s19, base_glide_performance, good).
all_consistent(base_glide_performance) :- consistent(s19, base_glide_performance).
evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, good)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

0.90::acc(s19, switch_riding).
% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values good=Good unk_switch_riding=Unknown
% @importance 0.95
0.92::true_val(switch_riding, good); 0.08::true_val(switch_riding, unk_switch_riding).
measured(s19, switch_riding, good).
all_consistent(switch_riding) :- consistent(s19, switch_riding).
evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, good)).
query(true_val(switch_riding, unk_switch_riding)).

0.90::acc(s19, jibbing_rating_tgr).
% @attr jibbing_rating_tgr
% @type categorical
% @canonical true
% @original_name jibbing_rating_tgr
% @values average=Average unk_jibbing_rating_tgr=Unknown
% @importance 0.95
0.92::true_val(jibbing_rating_tgr, average); 0.08::true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr).
measured(s19, jibbing_rating_tgr, average).
all_consistent(jibbing_rating_tgr) :- consistent(s19, jibbing_rating_tgr).
evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, average)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr)).

0.90::acc(s19, pipe_rating_tgr).
% @attr pipe_rating_tgr
% @type categorical
% @canonical true
% @original_name pipe_rating_tgr
% @values good=Good unk_pipe_rating_tgr=Unknown
% @importance 0.95
0.92::true_val(pipe_rating_tgr, good); 0.08::true_val(pipe_rating_tgr, unk_pipe_rating_tgr).
measured(s19, pipe_rating_tgr, good).
all_consistent(pipe_rating_tgr) :- consistent(s19, pipe_rating_tgr).
evidence(all_consistent(pipe_rating_tgr)).
query(true_val(pipe_rating_tgr, good)).
query(true_val(pipe_rating_tgr, unk_pipe_rating_tgr)).

0.90::acc(s19, on_snow_feel_tgr).
% @attr on_snow_feel_tgr
% @type categorical
% @canonical true
% @original_name on_snow_feel_tgr
% @values semi_locked_in=Semi_Locked_In unk_on_snow_feel_tgr=Unknown
% @importance 0.95
0.92::true_val(on_snow_feel_tgr, semi_locked_in); 0.08::true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr).
measured(s19, on_snow_feel_tgr, semi_locked_in).
all_consistent(on_snow_feel_tgr) :- consistent(s19, on_snow_feel_tgr).
evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, semi_locked_in)).
query(true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr)).

0.90::acc(s19, turn_initiation_performance).
% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values medium_fast=Medium_Fast unk_turn_initiation_performance=Unknown
% @importance 0.95
0.92::true_val(turn_initiation_performance, medium_fast); 0.08::true_val(turn_initiation_performance, unk_turn_initiation_performance).
measured(s19, turn_initiation_performance, medium_fast).
all_consistent(turn_initiation_performance) :- consistent(s19, turn_initiation_performance).
evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, medium_fast)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

0.90::acc(s19, boot_support_tgr).
% @attr boot_support_tgr
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (Boot Support)
% @values semi_hard=Semi_Hard unk_boot_support_tgr=Unknown
% @importance 0.95
0.92::true_val(boot_support_tgr, semi_hard); 0.08::true_val(boot_support_tgr, unk_boot_support_tgr).
measured(s19, boot_support_tgr, semi_hard).
all_consistent(boot_support_tgr) :- consistent(s19, boot_support_tgr).
evidence(all_consistent(boot_support_tgr)).
query(true_val(boot_support_tgr, semi_hard)).
query(true_val(boot_support_tgr, unk_boot_support_tgr)).

0.90::acc(s19, edge_hold).
% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values hard_snow=Hard_Snow unk_edge_hold=Unknown
% @importance 0.95
0.92::true_val(edge_hold, hard_snow); 0.08::true_val(edge_hold, unk_edge_hold).
measured(s19, edge_hold, hard_snow).
all_consistent(edge_hold) :- consistent(s19, edge_hold).
evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, hard_snow)).
query(true_val(edge_hold, unk_edge_hold)).

0.90::acc(s19, uneven_terrain_tgr).
% @attr uneven_terrain_tgr
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (Uneven Terrain)
% @values moderate=Moderate unk_uneven_terrain_tgr=Unknown
% @importance 0.95
0.92::true_val(uneven_terrain_tgr, moderate); 0.08::true_val(uneven_terrain_tgr, unk_uneven_terrain_tgr).
measured(s19, uneven_terrain_tgr, moderate).
all_consistent(uneven_terrain_tgr) :- consistent(s19, uneven_terrain_tgr).
evidence(all_consistent(uneven_terrain_tgr)).
query(true_val(uneven_terrain_tgr, moderate)).
query(true_val(uneven_terrain_tgr, unk_uneven_terrain_tgr)).

0.88::acc(s19, tgr_boot_fit_159).
% @attr tgr_boot_fit_159
% @type categorical
% @canonical false
% @original_name The Good Ride boot size fit (159)
% @values us9_10=US_9_10 unk_tgr_boot_fit_159=Unknown
% @importance 0.95
0.90::true_val(tgr_boot_fit_159, us9_10); 0.10::true_val(tgr_boot_fit_159, unk_tgr_boot_fit_159).
measured(s19, tgr_boot_fit_159, us9_10).
all_consistent(tgr_boot_fit_159) :- consistent(s19, tgr_boot_fit_159).
evidence(all_consistent(tgr_boot_fit_159)).
query(true_val(tgr_boot_fit_159, us9_10)).
query(true_val(tgr_boot_fit_159, unk_tgr_boot_fit_159)).

0.88::acc(s19, tgr_boot_fit_156).
% @attr tgr_boot_fit_156
% @type categorical
% @canonical false
% @original_name The Good Ride boot size fit (156)
% @values us8_9=US_8_9 unk_tgr_boot_fit_156=Unknown
% @importance 0.95
0.90::true_val(tgr_boot_fit_156, us8_9); 0.10::true_val(tgr_boot_fit_156, unk_tgr_boot_fit_156).
measured(s19, tgr_boot_fit_156, us8_9).
all_consistent(tgr_boot_fit_156) :- consistent(s19, tgr_boot_fit_156).
evidence(all_consistent(tgr_boot_fit_156)).
query(true_val(tgr_boot_fit_156, us8_9)).
query(true_val(tgr_boot_fit_156, unk_tgr_boot_fit_156)).

0.90::acc(s19, positive_aspect).
% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values great_spring_turn_ollie=Great_spring_on_turn_and_ollie unk_positive_aspect=Unknown
% @importance 0.95
0.92::true_val(positive_aspect, great_spring_turn_ollie); 0.08::true_val(positive_aspect, unk_positive_aspect).
measured(s19, positive_aspect, great_spring_turn_ollie).
all_consistent(positive_aspect) :- consistent(s19, positive_aspect).
evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, great_spring_turn_ollie)).
query(true_val(positive_aspect, unk_positive_aspect)).

0.90::acc(s19, positive_aspect_2).
% @attr positive_aspect_2
% @type categorical
% @canonical false
% @original_name positive_aspect (banked slalom fun)
% @values fun_banked_slalom=Obviously_fun_for_banked_slaloms unk_positive_aspect_2=Unknown
% @importance 0.95
0.92::true_val(positive_aspect_2, fun_banked_slalom); 0.08::true_val(positive_aspect_2, unk_positive_aspect_2).
measured(s19, positive_aspect_2, fun_banked_slalom).
all_consistent(positive_aspect_2) :- consistent(s19, positive_aspect_2).
evidence(all_consistent(positive_aspect_2)).
query(true_val(positive_aspect_2, fun_banked_slalom)).
query(true_val(positive_aspect_2, unk_positive_aspect_2)).

0.90::acc(s19, positive_aspect_3).
% @attr positive_aspect_3
% @type categorical
% @canonical false
% @original_name positive_aspect (AM float)
% @values decent_am_float=Decent_all_mountain_float unk_positive_aspect_3=Unknown
% @importance 0.95
0.92::true_val(positive_aspect_3, decent_am_float); 0.08::true_val(positive_aspect_3, unk_positive_aspect_3).
measured(s19, positive_aspect_3, decent_am_float).
all_consistent(positive_aspect_3) :- consistent(s19, positive_aspect_3).
evidence(all_consistent(positive_aspect_3)).
query(true_val(positive_aspect_3, decent_am_float)).
query(true_val(positive_aspect_3, unk_positive_aspect_3)).

0.90::acc(s19, positive_aspect_4).
% @attr positive_aspect_4
% @type categorical
% @canonical false
% @original_name positive_aspect (multi-radius sidecut)
% @values unique_turning=Multi_radius_sidecut_unique_turning unk_positive_aspect_4=Unknown
% @importance 0.95
0.92::true_val(positive_aspect_4, unique_turning); 0.08::true_val(positive_aspect_4, unk_positive_aspect_4).
measured(s19, positive_aspect_4, unique_turning).
all_consistent(positive_aspect_4) :- consistent(s19, positive_aspect_4).
evidence(all_consistent(positive_aspect_4)).
query(true_val(positive_aspect_4, unique_turning)).
query(true_val(positive_aspect_4, unk_positive_aspect_4)).

0.82::acc(s12, positive_aspect_5).
% @attr positive_aspect_5
% @type categorical
% @canonical false
% @original_name positive_aspect (damp smooth)
% @values damp_smooth_no_chatter=Damp_smooth_hardly_any_chatter_high_speeds unk_positive_aspect_5=Unknown
% @importance 0.80
0.88::true_val(positive_aspect_5, damp_smooth_no_chatter); 0.12::true_val(positive_aspect_5, unk_positive_aspect_5).
measured(s12, positive_aspect_5, damp_smooth_no_chatter).
all_consistent(positive_aspect_5) :- consistent(s12, positive_aspect_5).
evidence(all_consistent(positive_aspect_5)).
query(true_val(positive_aspect_5, damp_smooth_no_chatter)).
query(true_val(positive_aspect_5, unk_positive_aspect_5)).

0.82::acc(s12, positive_aspect_6).
% @attr positive_aspect_6
% @type categorical
% @canonical false
% @original_name positive_aspect (powder float)
% @values excellent_powder_float=Excellent_float_powder_wide_nose_surfy unk_positive_aspect_6=Unknown
% @importance 0.80
0.88::true_val(positive_aspect_6, excellent_powder_float); 0.12::true_val(positive_aspect_6, unk_positive_aspect_6).
measured(s12, positive_aspect_6, excellent_powder_float).
all_consistent(positive_aspect_6) :- consistent(s12, positive_aspect_6).
evidence(all_consistent(positive_aspect_6)).
query(true_val(positive_aspect_6, excellent_powder_float)).
query(true_val(positive_aspect_6, unk_positive_aspect_6)).

0.82::acc(s12, positive_aspect_7).
% @attr positive_aspect_7
% @type categorical
% @canonical false
% @original_name positive_aspect (groomers chop)
% @values excels_groomers_chop=Excels_groomers_chop_absorbs_bumps unk_positive_aspect_7=Unknown
% @importance 0.80
0.88::true_val(positive_aspect_7, excels_groomers_chop); 0.12::true_val(positive_aspect_7, unk_positive_aspect_7).
measured(s12, positive_aspect_7, excels_groomers_chop).
all_consistent(positive_aspect_7) :- consistent(s12, positive_aspect_7).
evidence(all_consistent(positive_aspect_7)).
query(true_val(positive_aspect_7, excels_groomers_chop)).
query(true_val(positive_aspect_7, unk_positive_aspect_7)).

0.82::acc(s12, positive_aspect_8).
% @attr positive_aspect_8
% @type categorical
% @canonical false
% @original_name positive_aspect (fast base)
% @values fast_base_retains_wax=Really_fast_base_retains_wax_longer unk_positive_aspect_8=Unknown
% @importance 0.80
0.88::true_val(positive_aspect_8, fast_base_retains_wax); 0.12::true_val(positive_aspect_8, unk_positive_aspect_8).
measured(s12, positive_aspect_8, fast_base_retains_wax).
all_consistent(positive_aspect_8) :- consistent(s12, positive_aspect_8).
evidence(all_consistent(positive_aspect_8)).
query(true_val(positive_aspect_8, fast_base_retains_wax)).
query(true_val(positive_aspect_8, unk_positive_aspect_8)).

0.68::acc(s28, user_review_forum).
% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values perfect_do_it_all=Perfect_do_it_all_aggressive_nimble_freestyle unk_user_review_forum=Unknown
% @importance 0.75
0.78::true_val(user_review_forum, perfect_do_it_all); 0.22::true_val(user_review_forum, unk_user_review_forum).
measured(s28, user_review_forum, perfect_do_it_all).
all_consistent(user_review_forum) :- consistent(s28, user_review_forum).
evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, perfect_do_it_all)).
query(true_val(user_review_forum, unk_user_review_forum)).

0.68::acc(s28, user_review_forum_2).
% @attr user_review_forum_2
% @type categorical
% @canonical false
% @original_name user_review_forum (daily driver)
% @values daily_driver_bought_second=Daily_driver_bought_second_as_backup unk_user_review_forum_2=Unknown
% @importance 0.75
0.78::true_val(user_review_forum_2, daily_driver_bought_second); 0.22::true_val(user_review_forum_2, unk_user_review_forum_2).
measured(s28, user_review_forum_2, daily_driver_bought_second).
all_consistent(user_review_forum_2) :- consistent(s28, user_review_forum_2).
evidence(all_consistent(user_review_forum_2)).
query(true_val(user_review_forum_2, daily_driver_bought_second)).
query(true_val(user_review_forum_2, unk_user_review_forum_2)).

0.90::acc(s19, negative_aspect).
% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values catchy_technical=Catchy_technical_for_beginners_intermediates unk_negative_aspect=Unknown
% @importance 0.95
0.92::true_val(negative_aspect, catchy_technical); 0.08::true_val(negative_aspect, unk_negative_aspect).
measured(s19, negative_aspect, catchy_technical).
all_consistent(negative_aspect) :- consistent(s19, negative_aspect).
evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, catchy_technical)).
query(true_val(negative_aspect, unk_negative_aspect)).

0.90::acc(s19, negative_aspect_2).
% @attr negative_aspect_2
% @type categorical
% @canonical false
% @original_name negative_aspect (not as floaty)
% @values not_as_floaty=Not_as_floaty_as_dedicated_freeride unk_negative_aspect_2=Unknown
% @importance 0.95
0.92::true_val(negative_aspect_2, not_as_floaty); 0.08::true_val(negative_aspect_2, unk_negative_aspect_2).
measured(s19, negative_aspect_2, not_as_floaty).
all_consistent(negative_aspect_2) :- consistent(s19, negative_aspect_2).
evidence(all_consistent(negative_aspect_2)).
query(true_val(negative_aspect_2, not_as_floaty)).
query(true_val(negative_aspect_2, unk_negative_aspect_2)).

0.82::acc(s12, negative_aspect_3).
% @attr negative_aspect_3
% @type categorical
% @canonical false
% @original_name negative_aspect (stiff wide first day)
% @values stiff_wide_needs_aggression=Stiff_wide_first_day_requires_aggressive_riding unk_negative_aspect_3=Unknown
% @importance 0.80
0.88::true_val(negative_aspect_3, stiff_wide_needs_aggression); 0.12::true_val(negative_aspect_3, unk_negative_aspect_3).
measured(s12, negative_aspect_3, stiff_wide_needs_aggression).
all_consistent(negative_aspect_3) :- consistent(s12, negative_aspect_3).
evidence(all_consistent(negative_aspect_3)).
query(true_val(negative_aspect_3, stiff_wide_needs_aggression)).
query(true_val(negative_aspect_3, unk_negative_aspect_3)).

0.90::acc(s19, negative_aspect_4).
% @attr negative_aspect_4
% @type categorical
% @canonical false
% @original_name negative_aspect (base burn)
% @values base_burn_sides=Base_can_get_base_burn_on_sides unk_negative_aspect_4=Unknown
% @importance 0.95
0.92::true_val(negative_aspect_4, base_burn_sides); 0.08::true_val(negative_aspect_4, unk_negative_aspect_4).
measured(s19, negative_aspect_4, base_burn_sides).
all_consistent(negative_aspect_4) :- consistent(s19, negative_aspect_4).
evidence(all_consistent(negative_aspect_4)).
query(true_val(negative_aspect_4, base_burn_sides)).
query(true_val(negative_aspect_4, unk_negative_aspect_4)).

0.68::acc(s28, user_review_forum_3).
% @attr user_review_forum_3
% @type categorical
% @canonical false
% @original_name user_review_forum (stiff needs pushing)
% @values stiff_needs_pushing=Stiffer_needs_to_be_pushed_not_forgiving unk_user_review_forum_3=Unknown
% @importance 0.75
0.78::true_val(user_review_forum_3, stiff_needs_pushing); 0.22::true_val(user_review_forum_3, unk_user_review_forum_3).
measured(s28, user_review_forum_3, stiff_needs_pushing).
all_consistent(user_review_forum_3) :- consistent(s28, user_review_forum_3).
evidence(all_consistent(user_review_forum_3)).
query(true_val(user_review_forum_3, stiff_needs_pushing)).
query(true_val(user_review_forum_3, unk_user_review_forum_3)).

0.90::acc(s19, comparable_board_cross_brand).
% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values multi_board_list=Amplid_Souly_Grail_K2_Alchemist_Jones_Flagship_Pro_etc unk_comparable_board_cross_brand=Unknown
% @importance 0.95
0.92::true_val(comparable_board_cross_brand, multi_board_list); 0.08::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).
measured(s19, comparable_board_cross_brand, multi_board_list).
all_consistent(comparable_board_cross_brand) :- consistent(s19, comparable_board_cross_brand).
evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, multi_board_list)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

0.68::acc(s28, comparable_board_cross_brand_burton).
% @attr comparable_board_cross_brand_burton
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Burton comparison)
% @values banker_vs_custom_x=Less_stiff_than_Custom_X_more_like_Custom_prefers_powder_bumps_trees unk_comparable_board_cross_brand_burton=Unknown
% @importance 0.75
0.78::true_val(comparable_board_cross_brand_burton, banker_vs_custom_x); 0.22::true_val(comparable_board_cross_brand_burton, unk_comparable_board_cross_brand_burton).
measured(s28, comparable_board_cross_brand_burton, banker_vs_custom_x).
all_consistent(comparable_board_cross_brand_burton) :- consistent(s28, comparable_board_cross_brand_burton).
evidence(all_consistent(comparable_board_cross_brand_burton)).
query(true_val(comparable_board_cross_brand_burton, banker_vs_custom_x)).
query(true_val(comparable_board_cross_brand_burton, unk_comparable_board_cross_brand_burton)).

0.90::acc(s19, comparable_board_same_brand).
% @attr comparable_board_same_brand
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values alternator_similar=Nitro_Alternator_also_directional_AM_slightly_better_powder_float unk_comparable_board_same_brand=Unknown
% @importance 0.95
0.92::true_val(comparable_board_same_brand, alternator_similar); 0.08::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).
measured(s19, comparable_board_same_brand, alternator_similar).
all_consistent(comparable_board_same_brand) :- consistent(s19, comparable_board_same_brand).
evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, alternator_similar)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

0.80::acc(s29, womens_expansion_2027).
% @attr womens_expansion_2027
% @type categorical
% @canonical false
% @original_name For 2027 season Nitro expanded womens options
% @values christy_prior_quiver=Christy_Prior_in_Quiver_design_crew_additional_sizes unk_womens_expansion_2027=Unknown
% @importance 0.70
0.88::true_val(womens_expansion_2027, christy_prior_quiver); 0.12::true_val(womens_expansion_2027, unk_womens_expansion_2027).
measured(s29, womens_expansion_2027, christy_prior_quiver).
all_consistent(womens_expansion_2027) :- consistent(s29, womens_expansion_2027).
evidence(all_consistent(womens_expansion_2027)).
query(true_val(womens_expansion_2027, christy_prior_quiver)).
query(true_val(womens_expansion_2027, unk_womens_expansion_2027)).

0.75::acc(s12, model_first_available_year).
0.55::acc(s30, model_first_available_year).
% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values y2019_2020=2019_2020_model_year unk_model_first_available_year=Unknown
% @importance 0.65
0.85::true_val(model_first_available_year, y2019_2020); 0.15::true_val(model_first_available_year, unk_model_first_available_year).
measured(s12, model_first_available_year, y2019_2020).
measured(s30, model_first_available_year, y2019_2020).
all_consistent(model_first_available_year) :- consistent(s12, model_first_available_year), consistent(s30, model_first_available_year).
evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2019_2020)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

0.75::acc(s13, redesign_year).
% @attr redesign_year
% @type categorical
% @canonical true
% @original_name redesign_year
% @values y2027_expanded_sizes=2027_expanded_size_run_men_women unk_redesign_year=Unknown
% @importance 0.75
0.88::true_val(redesign_year, y2027_expanded_sizes); 0.12::true_val(redesign_year, unk_redesign_year).
measured(s13, redesign_year, y2027_expanded_sizes).
all_consistent(redesign_year) :- (indep(s13), consistent(s13, redesign_year) ; \+indep(s13)).
evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, y2027_expanded_sizes)).
query(true_val(redesign_year, unk_redesign_year)).

0.85::acc(s19, board_weight_grams).
% @attr board_weight_grams
% @type categorical
% @canonical true
% @original_name board_weight_grams
% @values normal_for_area=Feels_normal_no_exact_weight_published unk_board_weight_grams=Unknown
% @importance 0.95
0.88::true_val(board_weight_grams, normal_for_area); 0.12::true_val(board_weight_grams, unk_board_weight_grams).
measured(s19, board_weight_grams, normal_for_area).
all_consistent(board_weight_grams) :- consistent(s19, board_weight_grams).
evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, normal_for_area)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

0.85::acc(s19, setback_from_center_inches).
% @attr setback_from_center_inches
% @type numeric
% @unit inches
% @canonical false
% @original_name setback (inches from center)
% @values v3_1875=3.1875 unk_setback_from_center_inches=Unknown
% @importance 0.95
0.88::true_val(setback_from_center_inches, v3_1875); 0.12::true_val(setback_from_center_inches, unk_setback_from_center_inches).
measured(s19, setback_from_center_inches, v3_1875).
all_consistent(setback_from_center_inches) :- consistent(s19, setback_from_center_inches).
evidence(all_consistent(setback_from_center_inches)).
query(true_val(setback_from_center_inches, v3_1875)).
query(true_val(setback_from_center_inches, unk_setback_from_center_inches)).