0.20::indep(s2).
0.15::indep(s3).
0.15::indep(s4).
0.20::indep(s10).
0.15::indep(s13).
0.20::indep(s15).
0.20::indep(s16).
0.30::indep(s17).
0.20::indep(s22).
0.25::indep(s25).
0.30::indep(s30).
0.15::indep(s32).
0.25::indep(s35).
0.25::indep(s36).
0.15::indep(s37).
0.20::indep(s39).
0.15::indep(s42).
0.25::indep(s43).
0.15::indep(s44).
0.15::indep(s45).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values nitro=Nitro unk_brand=Unknown
% @importance 1.0

0.90::true_val(brand, nitro); 0.10::true_val(brand, unk_brand).
0.95::acc(s1, brand).
measured(s1, brand, nitro).
all_consistent(brand) :- consistent(s1, brand).
evidence(all_consistent(brand)).
query(true_val(brand, nitro)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values dinghy=Dinghy unk_model_name=Unknown
% @importance 1.0

0.90::true_val(model_name, dinghy); 0.10::true_val(model_name, unk_model_name).
0.95::acc(s1, model_name).
measured(s1, model_name, dinghy).
all_consistent(model_name) :- consistent(s1, model_name).
evidence(all_consistent(model_name)).
query(true_val(model_name, dinghy)).
query(true_val(model_name, unk_model_name)).

% @attr model_series
% @type categorical
% @canonical false
% @original_name model series
% @values quiver_series=Quiver_Series unk_model_series=Unknown
% @importance 0.6

0.72::true_val(model_series, quiver_series); 0.28::true_val(model_series, unk_model_series).
0.80::acc(s2, model_series).
measured(s2, model_series, quiver_series).
all_consistent(model_series) :-
    (indep(s2), consistent(s2, model_series) ; \+indep(s2)).
evidence(all_consistent(model_series)).
query(true_val(model_series, quiver_series)).
query(true_val(model_series, unk_model_series)).

% @attr model_year
% @type numeric
% @canonical true
% @original_name model_year
% @values v2027=2027 unk_model_year=Unknown
% @importance 0.9

0.71::true_val(model_year, v2027); 0.29::true_val(model_year, unk_model_year).
0.80::acc(s3, model_year).
measured(s3, model_year, v2027).
all_consistent(model_year) :-
    (indep(s3), consistent(s3, model_year) ; \+indep(s3)).
evidence(all_consistent(model_year)).
query(true_val(model_year, v2027)).
query(true_val(model_year, unk_model_year)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

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
% @values freeride_powder=Freeride-Powder unk_board_category=Unknown
% @importance 0.85

0.71::true_val(board_category, freeride_powder); 0.29::true_val(board_category, unk_board_category).
0.80::acc(s4, board_category).
measured(s4, board_category, freeride_powder).
all_consistent(board_category) :-
    (indep(s4), consistent(s4, board_category) ; \+indep(s4)).
evidence(all_consistent(board_category)).
query(true_val(board_category, freeride_powder)).
query(true_val(board_category, unk_board_category)).

% @attr tagline
% @type categorical
% @canonical false
% @original_name tagline
% @values wider_powder_wayfarer=The_Wider_Powder_Wayfarer unk_tagline=Unknown
% @importance 1.0

0.90::true_val(tagline, wider_powder_wayfarer); 0.10::true_val(tagline, unk_tagline).
0.93::acc(s5, tagline).
measured(s5, tagline, wider_powder_wayfarer).
all_consistent(tagline) :- consistent(s5, tagline).
evidence(all_consistent(tagline)).
query(true_val(tagline, wider_powder_wayfarer)).
query(true_val(tagline, unk_tagline)).

% @attr manufacturer
% @type categorical
% @canonical false
% @original_name manufacturer
% @values nitro_ag_hunenberg=Nitro_AG_Hunenberg_Switzerland unk_manufacturer=Unknown
% @importance 0.5

0.90::true_val(manufacturer, nitro_ag_hunenberg); 0.10::true_val(manufacturer, unk_manufacturer).
0.95::acc(s6, manufacturer).
measured(s6, manufacturer, nitro_ag_hunenberg).
all_consistent(manufacturer) :- consistent(s6, manufacturer).
evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, nitro_ag_hunenberg)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr eu_representative
% @type categorical
% @canonical false
% @original_name EU representative
% @values nitro_dist_italia=Nitro_Distribution_Italia_Arco unk_eu_representative=Unknown
% @importance 0.5

0.90::true_val(eu_representative, nitro_dist_italia); 0.10::true_val(eu_representative, unk_eu_representative).
0.95::acc(s6, eu_representative).
measured(s6, eu_representative, nitro_dist_italia).
all_consistent(eu_representative) :- consistent(s6, eu_representative).
evidence(all_consistent(eu_representative)).
query(true_val(eu_representative, nitro_dist_italia)).
query(true_val(eu_representative, unk_eu_representative)).

% @attr manufacturer_founded
% @type categorical
% @canonical false
% @original_name manufacturer founded
% @values y1990=1990_by_Delago_and_Ardelt_Seattle y1989=1989_development_started
% @importance 0.4

0.55::true_val(manufacturer_founded, y1990); 0.45::true_val(manufacturer_founded, y1989).
0.88::acc(s7, manufacturer_founded).
0.92::acc(s8, manufacturer_founded).
measured(s7, manufacturer_founded, y1990).
measured(s8, manufacturer_founded, y1989).
all_consistent(manufacturer_founded) :-
    consistent(s7, manufacturer_founded),
    consistent(s8, manufacturer_founded).
evidence(all_consistent(manufacturer_founded)).
query(true_val(manufacturer_founded, y1990)).
query(true_val(manufacturer_founded, y1989)).

% @attr manufacturer_brand_philosophy
% @type categorical
% @canonical false
% @original_name manufacturer brand philosophy
% @values rider_owned_family=Rider_owned_family_oriented_global unk_manufacturer_brand_philosophy=Unknown
% @importance 0.4

0.60::true_val(manufacturer_brand_philosophy, rider_owned_family); 0.40::true_val(manufacturer_brand_philosophy, unk_manufacturer_brand_philosophy).
0.72::acc(s9, manufacturer_brand_philosophy).
measured(s9, manufacturer_brand_philosophy, rider_owned_family).
all_consistent(manufacturer_brand_philosophy) :- consistent(s9, manufacturer_brand_philosophy).
evidence(all_consistent(manufacturer_brand_philosophy)).
query(true_val(manufacturer_brand_philosophy, rider_owned_family)).
query(true_val(manufacturer_brand_philosophy, unk_manufacturer_brand_philosophy)).

% @attr product_development_location
% @type categorical
% @canonical false
% @original_name product development location
% @values oberammergau_germany=Oberammergau_Germany unk_product_development_location=Unknown
% @importance 0.45

0.59::true_val(product_development_location, oberammergau_germany); 0.41::true_val(product_development_location, unk_product_development_location).
0.68::acc(s10, product_development_location).
measured(s10, product_development_location, oberammergau_germany).
all_consistent(product_development_location) :-
    (indep(s10), consistent(s10, product_development_location) ; \+indep(s10)).
evidence(all_consistent(product_development_location)).
query(true_val(product_development_location, oberammergau_germany)).
query(true_val(product_development_location, unk_product_development_location)).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values playmaker_taiwan=Playmaker_factory_Taiwan unk_manufacturing_location_current=Unknown
% @importance 0.65

0.36::true_val(manufacturing_location_current, playmaker_taiwan); 0.64::true_val(manufacturing_location_current, unk_manufacturing_location_current).
0.72::acc(s11, manufacturing_location_current).
measured(s11, manufacturing_location_current, playmaker_taiwan).
all_consistent(manufacturing_location_current) :- consistent(s11, manufacturing_location_current).
evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, playmaker_taiwan)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

% @attr manufacturing_location_prior
% @type categorical
% @canonical false
% @original_name manufacturing_location_prior
% @values elan_austria=Elan_factory_Austria unk_manufacturing_location_prior=Unknown
% @importance 0.55

0.54::true_val(manufacturing_location_prior, elan_austria); 0.46::true_val(manufacturing_location_prior, unk_manufacturing_location_prior).
0.65::acc(s12, manufacturing_location_prior).
measured(s12, manufacturing_location_prior, elan_austria).
all_consistent(manufacturing_location_prior) :- consistent(s12, manufacturing_location_prior).
evidence(all_consistent(manufacturing_location_prior)).
query(true_val(manufacturing_location_prior, elan_austria)).
query(true_val(manufacturing_location_prior, unk_manufacturing_location_prior)).

% @attr company_headquarters
% @type categorical
% @canonical false
% @original_name company headquarters
% @values hunenberg_switzerland=Hunenberg_Switzerland_with_satellite_offices unk_company_headquarters=Unknown
% @importance 0.35

0.51::true_val(company_headquarters, hunenberg_switzerland); 0.49::true_val(company_headquarters, unk_company_headquarters).
0.65::acc(s13, company_headquarters).
measured(s13, company_headquarters, hunenberg_switzerland).
all_consistent(company_headquarters) :-
    (indep(s13), consistent(s13, company_headquarters) ; \+indep(s13)).
evidence(all_consistent(company_headquarters)).
query(true_val(company_headquarters, hunenberg_switzerland)).
query(true_val(company_headquarters, unk_company_headquarters)).

% @attr sales_channel_policy
% @type categorical
% @canonical false
% @original_name Nitro does not sell direct online
% @values no_direct_online=No_direct_online_retailer_channel unk_sales_channel_policy=Unknown
% @importance 0.7

0.81::true_val(sales_channel_policy, no_direct_online); 0.19::true_val(sales_channel_policy, unk_sales_channel_policy).
0.90::acc(s14, sales_channel_policy).
measured(s14, sales_channel_policy, no_direct_online).
all_consistent(sales_channel_policy) :- consistent(s14, sales_channel_policy).
evidence(all_consistent(sales_channel_policy)).
query(true_val(sales_channel_policy, no_direct_online)).
query(true_val(sales_channel_policy, unk_sales_channel_policy)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values unisex=Unisex unk_gender=Unknown
% @importance 0.65

0.72::true_val(gender, unisex); 0.28::true_val(gender, unk_gender).
0.82::acc(s15, gender).
measured(s15, gender, unisex).
all_consistent(gender) :-
    (indep(s15), consistent(s15, gender) ; \+indep(s15)).
evidence(all_consistent(gender)).
query(true_val(gender, unisex)).
query(true_val(gender, unk_gender)).

% @attr model_first_available_year
% @type numeric
% @canonical true
% @original_name model_first_available_year
% @values v2023=2023 unk_model_first_available_year=Unknown
% @importance 0.7

0.59::true_val(model_first_available_year, v2023); 0.41::true_val(model_first_available_year, unk_model_first_available_year).
0.72::acc(s16, model_first_available_year).
measured(s16, model_first_available_year, v2023).
all_consistent(model_first_available_year) :-
    (indep(s16), consistent(s16, model_first_available_year) ; \+indep(s16)).
evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, v2023)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr redesign_year
% @type categorical
% @canonical true
% @original_name redesign_year
% @values new_150_size=New_150cm_size_added unk_redesign_year=Unknown
% @importance 0.75

0.72::true_val(redesign_year, new_150_size); 0.28::true_val(redesign_year, unk_redesign_year).
0.82::acc(s17, redesign_year).
measured(s17, redesign_year, new_150_size).
all_consistent(redesign_year) :-
    (indep(s17), consistent(s17, redesign_year) ; \+indep(s17)).
evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, new_150_size)).
query(true_val(redesign_year, unk_redesign_year)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values preorder=Preorder unk_availability_status=Unknown
% @importance 0.9

0.71::true_val(availability_status, preorder); 0.29::true_val(availability_status, unk_availability_status).
0.80::acc(s3, availability_status).
measured(s3, availability_status, preorder).
all_consistent(availability_status) :-
    (indep(s3), consistent(s3, availability_status) ; \+indep(s3)).
evidence(all_consistent(availability_status)).
query(true_val(availability_status, preorder)).
query(true_val(availability_status, unk_availability_status)).

% @attr estimated_availability_date
% @type categorical
% @canonical false
% @original_name estimated_availability_date
% @values apr_may_2026=April_May_2026 unk_estimated_availability_date=Unknown
% @importance 0.8

0.63::true_val(estimated_availability_date, apr_may_2026); 0.37::true_val(estimated_availability_date, unk_estimated_availability_date).
0.75::acc(s18, estimated_availability_date).
measured(s18, estimated_availability_date, apr_may_2026).
all_consistent(estimated_availability_date) :- consistent(s18, estimated_availability_date).
evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, apr_may_2026)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

% @attr early_availability_region
% @type categorical
% @canonical false
% @original_name 2027 boards landing in AU/NZ before rest of world
% @values au_nz_first=AU_NZ_before_rest_of_world unk_early_availability_region=Unknown
% @importance 0.8

0.63::true_val(early_availability_region, au_nz_first); 0.37::true_val(early_availability_region, unk_early_availability_region).
0.75::acc(s18, early_availability_region).
measured(s18, early_availability_region, au_nz_first).
all_consistent(early_availability_region) :- consistent(s18, early_availability_region).
evidence(all_consistent(early_availability_region)).
query(true_val(early_availability_region, au_nz_first)).
query(true_val(early_availability_region, unk_early_availability_region)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 1.0

0.90::true_val(shape, tapered_directional); 0.10::true_val(shape, unk_shape).
0.95::acc(s5, shape).
measured(s5, shape, tapered_directional).
all_consistent(shape) :- consistent(s5, shape).
evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

% @attr shape_description
% @type categorical
% @canonical false
% @original_name shape description
% @values wider_nose_narrower_tail=Wider_nose_narrower_tail_for_floatation unk_shape_description=Unknown
% @importance 0.8

0.81::true_val(shape_description, wider_nose_narrower_tail); 0.19::true_val(shape_description, unk_shape_description).
0.90::acc(s19, shape_description).
measured(s19, shape_description, wider_nose_narrower_tail).
all_consistent(shape_description) :- consistent(s19, shape_description).
evidence(all_consistent(shape_description)).
query(true_val(shape_description, wider_nose_narrower_tail)).
query(true_val(shape_description, unk_shape_description)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values true_camber=True_Camber_full_traditional unk_camber_type=Unknown
% @importance 1.0

0.95::true_val(camber_type, true_camber); 0.05::true_val(camber_type, unk_camber_type).
0.93::acc(s5, camber_type).
0.88::acc(s20, camber_type).
measured(s5, camber_type, true_camber).
measured(s20, camber_type, true_camber).
all_consistent(camber_type) :-
    consistent(s5, camber_type),
    consistent(s20, camber_type).
evidence(all_consistent(camber_type)).
query(true_val(camber_type, true_camber)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical false
% @original_name camber_description
% @values full_camber_minor_spoon_nose=Full_camber_tip_to_tail_minor_spoon_nose unk_camber_description=Unknown
% @importance 0.9

0.81::true_val(camber_description, full_camber_minor_spoon_nose); 0.19::true_val(camber_description, unk_camber_description).
0.88::acc(s20, camber_description).
measured(s20, camber_description, full_camber_minor_spoon_nose).
all_consistent(camber_description) :- consistent(s20, camber_description).
evidence(all_consistent(camber_description)).
query(true_val(camber_description, full_camber_minor_spoon_nose)).
query(true_val(camber_description, unk_camber_description)).

% @attr core_profile
% @type categorical
% @canonical false
% @original_name core profile
% @values reflex_core=Reflex_Core_Profile_thinner_between_feet unk_core_profile=Unknown
% @importance 1.0

0.90::true_val(core_profile, reflex_core); 0.10::true_val(core_profile, unk_core_profile).
0.93::acc(s5, core_profile).
measured(s5, core_profile, reflex_core).
all_consistent(core_profile) :- consistent(s5, core_profile).
evidence(all_consistent(core_profile)).
query(true_val(core_profile, reflex_core)).
query(true_val(core_profile, unk_core_profile)).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values progressive=Progressive_Sidecut unk_sidecut_type=Unknown
% @importance 1.0

0.90::true_val(sidecut_type, progressive); 0.10::true_val(sidecut_type, unk_sidecut_type).
0.93::acc(s5, sidecut_type).
measured(s5, sidecut_type, progressive).
all_consistent(sidecut_type) :- consistent(s5, sidecut_type).
evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, progressive)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr sidecut_benefit
% @type categorical
% @canonical false
% @original_name sidecut benefit
% @values accel_turns_catch_free=Accelerating_out_of_turns_catch_free_nose unk_sidecut_benefit=Unknown
% @importance 0.75

0.81::true_val(sidecut_benefit, accel_turns_catch_free); 0.19::true_val(sidecut_benefit, unk_sidecut_benefit).
0.88::acc(s21, sidecut_benefit).
measured(s21, sidecut_benefit, accel_turns_catch_free).
all_consistent(sidecut_benefit) :- consistent(s21, sidecut_benefit).
evidence(all_consistent(sidecut_benefit)).
query(true_val(sidecut_benefit, accel_turns_catch_free)).
query(true_val(sidecut_benefit, unk_sidecut_benefit)).

% @attr flex_rating_10_manufacturer
% @type numeric
% @canonical true
% @original_name flex_rating_10_manufacturer
% @unit /10
% @values v7=7.0 unk_flex_rating_10_manufacturer=Unknown
% @importance 1.0

0.90::true_val(flex_rating_10_manufacturer, v7); 0.10::true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer).
0.93::acc(s5, flex_rating_10_manufacturer).
measured(s5, flex_rating_10_manufacturer, v7).
all_consistent(flex_rating_10_manufacturer) :- consistent(s5, flex_rating_10_manufacturer).
evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, v7)).
query(true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer)).

% @attr flex_pattern
% @type categorical
% @canonical false
% @original_name flex pattern
% @values all_terrain=All_Terrain_most_versatile unk_flex_pattern=Unknown
% @importance 0.7

0.72::true_val(flex_pattern, all_terrain); 0.28::true_val(flex_pattern, unk_flex_pattern).
0.80::acc(s22, flex_pattern).
measured(s22, flex_pattern, all_terrain).
all_consistent(flex_pattern) :-
    (indep(s22), consistent(s22, flex_pattern) ; \+indep(s22)).
evidence(all_consistent(flex_pattern)).
query(true_val(flex_pattern, all_terrain)).
query(true_val(flex_pattern, unk_flex_pattern)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values med_med_stiff_snappy=Medium_to_medium_stiff_rubbery_snaps_back unk_flex_feel=Unknown
% @importance 0.85

0.77::true_val(flex_feel, med_med_stiff_snappy); 0.23::true_val(flex_feel, unk_flex_feel).
0.85::acc(s23, flex_feel).
measured(s23, flex_feel, med_med_stiff_snappy).
all_consistent(flex_feel) :- consistent(s23, flex_feel).
evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, med_med_stiff_snappy)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values directional=Directional unk_flex_direction=Unknown
% @importance 0.85

0.71::true_val(flex_direction, directional); 0.29::true_val(flex_direction, unk_flex_direction).
0.80::acc(s4, flex_direction).
measured(s4, flex_direction, directional).
all_consistent(flex_direction) :-
    (indep(s4), consistent(s4, flex_direction) ; \+indep(s4)).
evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr width_options
% @type categorical
% @canonical true
% @original_name width_options
% @values wide=Wide unk_width_options=Unknown
% @importance 1.0

0.90::true_val(width_options, wide); 0.10::true_val(width_options, unk_width_options).
0.93::acc(s5, width_options).
measured(s5, width_options, wide).
all_consistent(width_options) :- consistent(s5, width_options).
evidence(all_consistent(width_options)).
query(true_val(width_options, wide)).
query(true_val(width_options, unk_width_options)).

% @attr width_description
% @type categorical
% @canonical false
% @original_name width description
% @values floatation_not_bathroom_door=Additional_floatation_less_drag_not_bathroom_door unk_width_description=Unknown
% @importance 0.7

0.68::true_val(width_description, floatation_not_bathroom_door); 0.32::true_val(width_description, unk_width_description).
0.82::acc(s24, width_description).
measured(s24, width_description, floatation_not_bathroom_door).
all_consistent(width_description) :- consistent(s24, width_description).
evidence(all_consistent(width_description)).
query(true_val(width_description, floatation_not_bathroom_door)).
query(true_val(width_description, unk_width_description)).

% @attr base_tech_3d
% @type categorical
% @canonical false
% @original_name 3D base technology
% @values has_3d_surf_tech=Has_3D_Surf_Tech no_3d_surf_tech=No_3D_Surf_Tech_on_2026plus
% @importance 0.7

0.40::true_val(base_tech_3d, has_3d_surf_tech); 0.60::true_val(base_tech_3d, no_3d_surf_tech).
0.78::acc(s25, base_tech_3d).
0.75::acc(s26, base_tech_3d).
measured(s25, base_tech_3d, has_3d_surf_tech).
measured(s26, base_tech_3d, no_3d_surf_tech).
all_consistent(base_tech_3d) :-
    (indep(s25), consistent(s25, base_tech_3d) ; \+indep(s25)),
    consistent(s26, base_tech_3d).
evidence(all_consistent(base_tech_3d)).
query(true_val(base_tech_3d, has_3d_surf_tech)).
query(true_val(base_tech_3d, no_3d_surf_tech)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values powercore_ii=PowerCore_II_Poplar_Beech_stringers unk_core_material=Unknown
% @importance 0.85

0.90::true_val(core_material, powercore_ii); 0.10::true_val(core_material, unk_core_material).
0.95::acc(s27, core_material).
measured(s27, core_material, powercore_ii).
all_consistent(core_material) :- consistent(s27, core_material).
evidence(all_consistent(core_material)).
query(true_val(core_material, powercore_ii)).
query(true_val(core_material, unk_core_material)).

% @attr core_construction
% @type categorical
% @canonical false
% @original_name core construction
% @values poplar_beech_stringers=Tip_to_tail_poplar_beech_stringers_strength_snap unk_core_construction=Unknown
% @importance 0.85

0.90::true_val(core_construction, poplar_beech_stringers); 0.10::true_val(core_construction, unk_core_construction).
0.95::acc(s27, core_construction).
measured(s27, core_construction, poplar_beech_stringers).
all_consistent(core_construction) :- consistent(s27, core_construction).
evidence(all_consistent(core_construction)).
query(true_val(core_construction, poplar_beech_stringers)).
query(true_val(core_construction, unk_core_construction)).

% @attr laminate
% @type categorical
% @canonical false
% @original_name laminate
% @values bi_lite=Bi_Lite_Laminates_two_direction_fibers unk_laminate=Unknown
% @importance 0.75

0.86::true_val(laminate, bi_lite); 0.14::true_val(laminate, unk_laminate).
0.93::acc(s28, laminate).
measured(s28, laminate, bi_lite).
all_consistent(laminate) :- consistent(s28, laminate).
evidence(all_consistent(laminate)).
query(true_val(laminate, bi_lite)).
query(true_val(laminate, unk_laminate)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values abs_recycled=ABS_Sidewalls_35pct_recycled_polymers ureshred=Ureshred_Sidewalls
% @importance 0.55

0.70::true_val(sidewall_material, abs_recycled); 0.30::true_val(sidewall_material, ureshred).
0.93::acc(s29, sidewall_material).
0.60::acc(s30, sidewall_material).
measured(s29, sidewall_material, abs_recycled).
measured(s30, sidewall_material, ureshred).
all_consistent(sidewall_material) :-
    consistent(s29, sidewall_material),
    (indep(s30), consistent(s30, sidewall_material) ; \+indep(s30)).
evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, abs_recycled)).
query(true_val(sidewall_material, ureshred)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_ecospeed_hd=Sintered_EcoSpeed_HD_Base unk_base_material=Unknown
% @importance 0.8

0.90::true_val(base_material, sintered_ecospeed_hd); 0.10::true_val(base_material, unk_base_material).
0.95::acc(s31, base_material).
measured(s31, base_material, sintered_ecospeed_hd).
all_consistent(base_material) :- consistent(s31, base_material).
evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_ecospeed_hd)).
query(true_val(base_material, unk_base_material)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values solar_100pct=Made_with_100pct_solar_power unk_sustainability_certification=Unknown
% @importance 1.0

0.90::true_val(sustainability_certification, solar_100pct); 0.10::true_val(sustainability_certification, unk_sustainability_certification).
0.93::acc(s5, sustainability_certification).
measured(s5, sustainability_certification, solar_100pct).
all_consistent(sustainability_certification) :- consistent(s5, sustainability_certification).
evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, solar_100pct)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr sustainability_certification_ptex
% @type categorical
% @canonical false
% @original_name sustainability_certification (85% post-industrial Ptex)
% @values ptex_85pct=85pct_post_industrial_Ptex_base unk_sustainability_certification_ptex=Unknown
% @importance 0.55

0.68::true_val(sustainability_certification_ptex, ptex_85pct); 0.32::true_val(sustainability_certification_ptex, unk_sustainability_certification_ptex).
0.78::acc(s32, sustainability_certification_ptex).
measured(s32, sustainability_certification_ptex, ptex_85pct).
all_consistent(sustainability_certification_ptex) :-
    (indep(s32), consistent(s32, sustainability_certification_ptex) ; \+indep(s32)).
evidence(all_consistent(sustainability_certification_ptex)).
query(true_val(sustainability_certification_ptex, ptex_85pct)).
query(true_val(sustainability_certification_ptex, unk_sustainability_certification_ptex)).

% @attr edge_technology
% @type categorical
% @canonical false
% @original_name edge_technology
% @values recycled_steel_50pct=Recycled_Steel_Edge_50pct unk_edge_technology=Unknown
% @importance 0.55

0.90::true_val(edge_technology, recycled_steel_50pct); 0.10::true_val(edge_technology, unk_edge_technology).
0.95::acc(s33, edge_technology).
measured(s33, edge_technology, recycled_steel_50pct).
all_consistent(edge_technology) :- consistent(s33, edge_technology).
evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, recycled_steel_50pct)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr topsheet
% @type categorical
% @canonical false
% @original_name topsheet
% @values ecoguard_90pct=EcoGuard_Topsheet_90pct_recycled unk_topsheet=Unknown
% @importance 0.5

0.90::true_val(topsheet, ecoguard_90pct); 0.10::true_val(topsheet, unk_topsheet).
0.95::acc(s34, topsheet).
measured(s34, topsheet, ecoguard_90pct).
all_consistent(topsheet) :- consistent(s34, topsheet).
evidence(all_consistent(topsheet)).
query(true_val(topsheet, ecoguard_90pct)).
query(true_val(topsheet, unk_topsheet)).

% @attr resin
% @type categorical
% @canonical false
% @original_name resin
% @values ecopoxy_33=EcoPoxy_33_over_33pct_plant_derived unk_resin=Unknown
% @importance 0.5

0.72::true_val(resin, ecopoxy_33); 0.28::true_val(resin, unk_resin).
0.80::acc(s35, resin).
measured(s35, resin, ecopoxy_33).
all_consistent(resin) :-
    (indep(s35), consistent(s35, resin) ; \+indep(s35)).
evidence(all_consistent(resin)).
query(true_val(resin, ecopoxy_33)).
query(true_val(resin, unk_resin)).

% @attr factory_wax
% @type categorical
% @canonical false
% @original_name factory wax
% @values green_speed_natural=Green_Speed_Natural_Wax_100pct_biodegradable unk_factory_wax=Unknown
% @importance 0.4

0.72::true_val(factory_wax, green_speed_natural); 0.28::true_val(factory_wax, unk_factory_wax).
0.80::acc(s36, factory_wax).
measured(s36, factory_wax, green_speed_natural).
all_consistent(factory_wax) :-
    (indep(s36), consistent(s36, factory_wax) ; \+indep(s36)).
evidence(all_consistent(factory_wax)).
query(true_val(factory_wax, green_speed_natural)).
query(true_val(factory_wax, unk_factory_wax)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 0.85

0.71::true_val(mounting_pattern, inserts_2x4); 0.29::true_val(mounting_pattern, unk_mounting_pattern).
0.80::acc(s4, mounting_pattern).
measured(s4, mounting_pattern, inserts_2x4).
all_consistent(mounting_pattern) :-
    (indep(s4), consistent(s4, mounting_pattern) ; \+indep(s4)).
evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr mounting_system_description
% @type categorical
% @canonical false
% @original_name mounting system description
% @values tighter_pattern_precise=Tighter_hole_pattern_precise_stance_adjustments unk_mounting_system_description=Unknown
% @importance 0.65

0.64::true_val(mounting_system_description, tighter_pattern_precise); 0.36::true_val(mounting_system_description, unk_mounting_system_description).
0.75::acc(s37, mounting_system_description).
measured(s37, mounting_system_description, tighter_pattern_precise).
all_consistent(mounting_system_description) :-
    (indep(s37), consistent(s37, mounting_system_description) ; \+indep(s37)).
evidence(all_consistent(mounting_system_description)).
query(true_val(mounting_system_description, tighter_pattern_precise)).
query(true_val(mounting_system_description, unk_mounting_system_description)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values w150_w155_w160=150W_155W_160W unk_available_sizes=Unknown
% @importance 1.0

0.90::true_val(available_sizes, w150_w155_w160); 0.10::true_val(available_sizes, unk_available_sizes).
0.95::acc(s5, available_sizes).
measured(s5, available_sizes, w150_w155_w160).
all_consistent(available_sizes) :- consistent(s5, available_sizes).
evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, w150_w155_w160)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr contact_length_size_150
% @type numeric
% @canonical false
% @original_name contact_length_size (150W)
% @unit mm
% @values v1090=1090.0 unk_contact_length_size_150=Unknown
% @importance 1.0

0.90::true_val(contact_length_size_150, v1090); 0.10::true_val(contact_length_size_150, unk_contact_length_size_150).
0.95::acc(s38, contact_length_size_150).
measured(s38, contact_length_size_150, v1090).
all_consistent(contact_length_size_150) :- consistent(s38, contact_length_size_150).
evidence(all_consistent(contact_length_size_150)).
query(true_val(contact_length_size_150, v1090)).
query(true_val(contact_length_size_150, unk_contact_length_size_150)).

% @attr tip_tail_width_size_150
% @type categorical
% @canonical false
% @original_name tip_tail_width_size (150W)
% @unit mm
% @values v307_302=307/302 unk_tip_tail_width_size_150=Unknown
% @importance 1.0

0.90::true_val(tip_tail_width_size_150, v307_302); 0.10::true_val(tip_tail_width_size_150, unk_tip_tail_width_size_150).
0.95::acc(s38, tip_tail_width_size_150).
measured(s38, tip_tail_width_size_150, v307_302).
all_consistent(tip_tail_width_size_150) :- consistent(s38, tip_tail_width_size_150).
evidence(all_consistent(tip_tail_width_size_150)).
query(true_val(tip_tail_width_size_150, v307_302)).
query(true_val(tip_tail_width_size_150, unk_tip_tail_width_size_150)).

% @attr waist_width_150
% @type numeric
% @canonical false
% @original_name waist width 150W
% @unit mm
% @values v262=262.0 unk_waist_width_150=Unknown
% @importance 1.0

0.90::true_val(waist_width_150, v262); 0.10::true_val(waist_width_150, unk_waist_width_150).
0.95::acc(s38, waist_width_150).
measured(s38, waist_width_150, v262).
all_consistent(waist_width_150) :- consistent(s38, waist_width_150).
evidence(all_consistent(waist_width_150)).
query(true_val(waist_width_150, v262)).
query(true_val(waist_width_150, unk_waist_width_150)).

% @attr sidecut_radius_size_150
% @type categorical
% @canonical false
% @original_name sidecut_radius_size (150W)
% @unit m
% @values v7_4_6_1=7.4/6.1 unk_sidecut_radius_size_150=Unknown
% @importance 1.0

0.90::true_val(sidecut_radius_size_150, v7_4_6_1); 0.10::true_val(sidecut_radius_size_150, unk_sidecut_radius_size_150).
0.95::acc(s38, sidecut_radius_size_150).
measured(s38, sidecut_radius_size_150, v7_4_6_1).
all_consistent(sidecut_radius_size_150) :- consistent(s38, sidecut_radius_size_150).
evidence(all_consistent(sidecut_radius_size_150)).
query(true_val(sidecut_radius_size_150, v7_4_6_1)).
query(true_val(sidecut_radius_size_150, unk_sidecut_radius_size_150)).

% @attr stance_width_range_size_150
% @type categorical
% @canonical false
% @original_name stance_width_range_size (150W)
% @unit cm
% @values v48_60=48-60cm unk_stance_width_range_size_150=Unknown
% @importance 1.0

0.90::true_val(stance_width_range_size_150, v48_60); 0.10::true_val(stance_width_range_size_150, unk_stance_width_range_size_150).
0.95::acc(s38, stance_width_range_size_150).
measured(s38, stance_width_range_size_150, v48_60).
all_consistent(stance_width_range_size_150) :- consistent(s38, stance_width_range_size_150).
evidence(all_consistent(stance_width_range_size_150)).
query(true_val(stance_width_range_size_150, v48_60)).
query(true_val(stance_width_range_size_150, unk_stance_width_range_size_150)).

% @attr recommended_weight_range_size_150
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (150W)
% @unit kg
% @values v60_plus=60+kg unk_recommended_weight_range_size_150=Unknown
% @importance 1.0

0.90::true_val(recommended_weight_range_size_150, v60_plus); 0.10::true_val(recommended_weight_range_size_150, unk_recommended_weight_range_size_150).
0.95::acc(s38, recommended_weight_range_size_150).
measured(s38, recommended_weight_range_size_150, v60_plus).
all_consistent(recommended_weight_range_size_150) :- consistent(s38, recommended_weight_range_size_150).
evidence(all_consistent(recommended_weight_range_size_150)).
query(true_val(recommended_weight_range_size_150, v60_plus)).
query(true_val(recommended_weight_range_size_150, unk_recommended_weight_range_size_150)).

% @attr setback
% @type numeric
% @canonical true
% @original_name setback
% @unit mm
% @values v_neg15=neg15.0 unk_setback=Unknown
% @importance 1.0

0.90::true_val(setback, v_neg15); 0.10::true_val(setback, unk_setback).
0.95::acc(s38, setback).
measured(s38, setback, v_neg15).
all_consistent(setback) :- consistent(s38, setback).
evidence(all_consistent(setback)).
query(true_val(setback, v_neg15)).
query(true_val(setback, unk_setback)).

% @attr contact_length_size
% @type numeric
% @canonical true
% @original_name contact_length_size (155W)
% @unit mm
% @values v1130=1130.0 unk_contact_length_size=Unknown
% @importance 1.0

0.90::true_val(contact_length_size, v1130); 0.10::true_val(contact_length_size, unk_contact_length_size).
0.95::acc(s38, contact_length_size).
measured(s38, contact_length_size, v1130).
all_consistent(contact_length_size) :- consistent(s38, contact_length_size).
evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v1130)).
query(true_val(contact_length_size, unk_contact_length_size)).

% @attr tip_tail_width_size
% @type categorical
% @canonical true
% @original_name tip_tail_width_size (155W)
% @unit mm
% @values v314_308=314/308 unk_tip_tail_width_size=Unknown
% @importance 1.0

0.90::true_val(tip_tail_width_size, v314_308); 0.10::true_val(tip_tail_width_size, unk_tip_tail_width_size).
0.95::acc(s38, tip_tail_width_size).
measured(s38, tip_tail_width_size, v314_308).
all_consistent(tip_tail_width_size) :- consistent(s38, tip_tail_width_size).
evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v314_308)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr waist_width_155
% @type numeric
% @canonical false
% @original_name waist width 155W
% @unit mm
% @values v267=267.0 unk_waist_width_155=Unknown
% @importance 1.0

0.90::true_val(waist_width_155, v267); 0.10::true_val(waist_width_155, unk_waist_width_155).
0.95::acc(s38, waist_width_155).
measured(s38, waist_width_155, v267).
all_consistent(waist_width_155) :- consistent(s38, waist_width_155).
evidence(all_consistent(waist_width_155)).
query(true_val(waist_width_155, v267)).
query(true_val(waist_width_155, unk_waist_width_155)).

% @attr sidecut_radius_size
% @type categorical
% @canonical true
% @original_name sidecut_radius_size (155W)
% @unit m
% @values v7_6_6_3=7.6/6.3 unk_sidecut_radius_size=Unknown
% @importance 1.0

0.90::true_val(sidecut_radius_size, v7_6_6_3); 0.10::true_val(sidecut_radius_size, unk_sidecut_radius_size).
0.95::acc(s38, sidecut_radius_size).
measured(s38, sidecut_radius_size, v7_6_6_3).
all_consistent(sidecut_radius_size) :- consistent(s38, sidecut_radius_size).
evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_6_6_3)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr stance_width_range_size
% @type categorical
% @canonical true
% @original_name stance_width_range_size (155W)
% @unit cm
% @values v48_60=48-60cm unk_stance_width_range_size=Unknown
% @importance 1.0

0.90::true_val(stance_width_range_size, v48_60); 0.10::true_val(stance_width_range_size, unk_stance_width_range_size).
0.95::acc(s38, stance_width_range_size).
measured(s38, stance_width_range_size, v48_60).
all_consistent(stance_width_range_size) :- consistent(s38, stance_width_range_size).
evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v48_60)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size (155W)
% @unit kg
% @values v70_plus=70+kg unk_recommended_weight_range_size=Unknown
% @importance 1.0

0.90::true_val(recommended_weight_range_size, v70_plus); 0.10::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).
0.95::acc(s38, recommended_weight_range_size).
measured(s38, recommended_weight_range_size, v70_plus).
all_consistent(recommended_weight_range_size) :- consistent(s38, recommended_weight_range_size).
evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, v70_plus)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr contact_length_size_160
% @type numeric
% @canonical false
% @original_name contact_length_size (160W)
% @unit mm
% @values v1180=1180.0 unk_contact_length_size_160=Unknown
% @importance 1.0

0.90::true_val(contact_length_size_160, v1180); 0.10::true_val(contact_length_size_160, unk_contact_length_size_160).
0.95::acc(s38, contact_length_size_160).
measured(s38, contact_length_size_160, v1180).
all_consistent(contact_length_size_160) :- consistent(s38, contact_length_size_160).
evidence(all_consistent(contact_length_size_160)).
query(true_val(contact_length_size_160, v1180)).
query(true_val(contact_length_size_160, unk_contact_length_size_160)).

% @attr tip_tail_width_size_160
% @type categorical
% @canonical false
% @original_name tip_tail_width_size (160W)
% @unit mm
% @values v318_312=318/312 unk_tip_tail_width_size_160=Unknown
% @importance 1.0

0.90::true_val(tip_tail_width_size_160, v318_312); 0.10::true_val(tip_tail_width_size_160, unk_tip_tail_width_size_160).
0.95::acc(s38, tip_tail_width_size_160).
measured(s38, tip_tail_width_size_160, v318_312).
all_consistent(tip_tail_width_size_160) :- consistent(s38, tip_tail_width_size_160).
evidence(all_consistent(tip_tail_width_size_160)).
query(true_val(tip_tail_width_size_160, v318_312)).
query(true_val(tip_tail_width_size_160, unk_tip_tail_width_size_160)).

% @attr waist_width_160
% @type numeric
% @canonical false
% @original_name waist width 160W
% @unit mm
% @values v269=269.0 unk_waist_width_160=Unknown
% @importance 1.0

0.90::true_val(waist_width_160, v269); 0.10::true_val(waist_width_160, unk_waist_width_160).
0.95::acc(s38, waist_width_160).
measured(s38, waist_width_160, v269).
all_consistent(waist_width_160) :- consistent(s38, waist_width_160).
evidence(all_consistent(waist_width_160)).
query(true_val(waist_width_160, v269)).
query(true_val(waist_width_160, unk_waist_width_160)).

% @attr sidecut_radius_size_160
% @type categorical
% @canonical false
% @original_name sidecut_radius_size (160W)
% @unit m
% @values v8_0_6_6=8.0/6.6 unk_sidecut_radius_size_160=Unknown
% @importance 1.0

0.90::true_val(sidecut_radius_size_160, v8_0_6_6); 0.10::true_val(sidecut_radius_size_160, unk_sidecut_radius_size_160).
0.95::acc(s38, sidecut_radius_size_160).
measured(s38, sidecut_radius_size_160, v8_0_6_6).
all_consistent(sidecut_radius_size_160) :- consistent(s38, sidecut_radius_size_160).
evidence(all_consistent(sidecut_radius_size_160)).
query(true_val(sidecut_radius_size_160, v8_0_6_6)).
query(true_val(sidecut_radius_size_160, unk_sidecut_radius_size_160)).

% @attr stance_width_range_size_160
% @type categorical
% @canonical false
% @original_name stance_width_range_size (160W)
% @unit cm
% @values v50_62=50-62cm unk_stance_width_range_size_160=Unknown
% @importance 1.0

0.90::true_val(stance_width_range_size_160, v50_62); 0.10::true_val(stance_width_range_size_160, unk_stance_width_range_size_160).
0.95::acc(s38, stance_width_range_size_160).
measured(s38, stance_width_range_size_160, v50_62).
all_consistent(stance_width_range_size_160) :- consistent(s38, stance_width_range_size_160).
evidence(all_consistent(stance_width_range_size_160)).
query(true_val(stance_width_range_size_160, v50_62)).
query(true_val(stance_width_range_size_160, unk_stance_width_range_size_160)).

% @attr recommended_weight_range_size_160
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (160W)
% @unit kg
% @values v75_plus=75+kg unk_recommended_weight_range_size_160=Unknown
% @importance 1.0

0.90::true_val(recommended_weight_range_size_160, v75_plus); 0.10::true_val(recommended_weight_range_size_160, unk_recommended_weight_range_size_160).
0.95::acc(s38, recommended_weight_range_size_160).
measured(s38, recommended_weight_range_size_160, v75_plus).
all_consistent(recommended_weight_range_size_160) :- consistent(s38, recommended_weight_range_size_160).
evidence(all_consistent(recommended_weight_range_size_160)).
query(true_val(recommended_weight_range_size_160, v75_plus)).
query(true_val(recommended_weight_range_size_160, unk_recommended_weight_range_size_160)).

% @attr terrain_suitability_all_mountain
% @type numeric
% @canonical false
% @original_name terrain_suitability (All Mountain)
% @unit /10
% @values v10=10.0 unk_terrain_suitability_all_mountain=Unknown
% @importance 1.0

0.90::true_val(terrain_suitability_all_mountain, v10); 0.10::true_val(terrain_suitability_all_mountain, unk_terrain_suitability_all_mountain).
0.93::acc(s5, terrain_suitability_all_mountain).
measured(s5, terrain_suitability_all_mountain, v10).
all_consistent(terrain_suitability_all_mountain) :- consistent(s5, terrain_suitability_all_mountain).
evidence(all_consistent(terrain_suitability_all_mountain)).
query(true_val(terrain_suitability_all_mountain, v10)).
query(true_val(terrain_suitability_all_mountain, unk_terrain_suitability_all_mountain)).

% @attr terrain_suitability_park
% @type numeric
% @canonical false
% @original_name terrain_suitability (Park)
% @unit /10
% @values v4=4.0 unk_terrain_suitability_park=Unknown
% @importance 1.0

0.90::true_val(terrain_suitability_park, v4); 0.10::true_val(terrain_suitability_park, unk_terrain_suitability_park).
0.93::acc(s5, terrain_suitability_park).
measured(s5, terrain_suitability_park, v4).
all_consistent(terrain_suitability_park) :- consistent(s5, terrain_suitability_park).
evidence(all_consistent(terrain_suitability_park)).
query(true_val(terrain_suitability_park, v4)).
query(true_val(terrain_suitability_park, unk_terrain_suitability_park)).

% @attr terrain_suitability_backcountry
% @type numeric
% @canonical false
% @original_name terrain_suitability (Backcountry)
% @unit /10
% @values v10=10.0 unk_terrain_suitability_backcountry=Unknown
% @importance 1.0

0.90::true_val(terrain_suitability_backcountry, v10); 0.10::true_val(terrain_suitability_backcountry, unk_terrain_suitability_backcountry).
0.93::acc(s5, terrain_suitability_backcountry).
measured(s5, terrain_suitability_backcountry, v10).
all_consistent(terrain_suitability_backcountry) :- consistent(s5, terrain_suitability_backcountry).
evidence(all_consistent(terrain_suitability_backcountry)).
query(true_val(terrain_suitability_backcountry, v10)).
query(true_val(terrain_suitability_backcountry, unk_terrain_suitability_backcountry)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values trees_pow_faces_groomers=Tree_runs_powder_wide_open_faces_groomers unk_terrain_suitability=Unknown
% @importance 0.85

0.71::true_val(terrain_suitability, trees_pow_faces_groomers); 0.29::true_val(terrain_suitability, unk_terrain_suitability).
0.80::acc(s4, terrain_suitability).
measured(s4, terrain_suitability, trees_pow_faces_groomers).
all_consistent(terrain_suitability) :-
    (indep(s4), consistent(s4, terrain_suitability) ; \+indep(s4)).
evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, trees_pow_faces_groomers)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr riding_style
% @type categorical
% @canonical false
% @original_name riding_style
% @values freeride_pow_surfy=Freeride_powder_surfy_all_terrain unk_riding_style=Unknown
% @importance 0.85

0.71::true_val(riding_style, freeride_pow_surfy); 0.29::true_val(riding_style, unk_riding_style).
0.80::acc(s4, riding_style).
measured(s4, riding_style, freeride_pow_surfy).
all_consistent(riding_style) :-
    (indep(s4), consistent(s4, riding_style) ; \+indep(s4)).
evidence(all_consistent(riding_style)).
query(true_val(riding_style, freeride_pow_surfy)).
query(true_val(riding_style, unk_riding_style)).

% @attr skill_level_recommendation_detail
% @type categorical
% @canonical false
% @original_name skill_level_recommendation (detail)
% @values experienced_larger_foot=Experienced_rider_larger_footprint_or_shorter_wider unk_skill_level_recommendation_detail=Unknown
% @importance 0.85

0.71::true_val(skill_level_recommendation_detail, experienced_larger_foot); 0.29::true_val(skill_level_recommendation_detail, unk_skill_level_recommendation_detail).
0.78::acc(s4, skill_level_recommendation_detail).
measured(s4, skill_level_recommendation_detail, experienced_larger_foot).
all_consistent(skill_level_recommendation_detail) :-
    (indep(s4), consistent(s4, skill_level_recommendation_detail) ; \+indep(s4)).
evidence(all_consistent(skill_level_recommendation_detail)).
query(true_val(skill_level_recommendation_detail, experienced_larger_foot)).
query(true_val(skill_level_recommendation_detail, unk_skill_level_recommendation_detail)).

% @attr sustainability_certification_fsc
% @type categorical
% @canonical false
% @original_name sustainability_certification (FSC)
% @values fsc_certified=FSC_Certified_Wood_Core unk_sustainability_certification_fsc=Unknown
% @importance 1.0

0.90::true_val(sustainability_certification_fsc, fsc_certified); 0.10::true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc).
0.93::acc(s5, sustainability_certification_fsc).
measured(s5, sustainability_certification_fsc, fsc_certified).
all_consistent(sustainability_certification_fsc) :- consistent(s5, sustainability_certification_fsc).
evidence(all_consistent(sustainability_certification_fsc)).
query(true_val(sustainability_certification_fsc, fsc_certified)).
query(true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc)).

% @attr sustainability_certification_inks
% @type categorical
% @canonical false
% @original_name sustainability_certification (inks)
% @values water_based_inks=Water_based_inks unk_sustainability_certification_inks=Unknown
% @importance 1.0

0.90::true_val(sustainability_certification_inks, water_based_inks); 0.10::true_val(sustainability_certification_inks, unk_sustainability_certification_inks).
0.93::acc(s5, sustainability_certification_inks).
measured(s5, sustainability_certification_inks, water_based_inks).
all_consistent(sustainability_certification_inks) :- consistent(s5, sustainability_certification_inks).
evidence(all_consistent(sustainability_certification_inks)).
query(true_val(sustainability_certification_inks, water_based_inks)).
query(true_val(sustainability_certification_inks, unk_sustainability_certification_inks)).

% @attr sustainability_certification_recycled
% @type categorical
% @canonical false
% @original_name sustainability_certification (recycled materials)
% @values recycled_raw_materials=Recycled_raw_materials_used unk_sustainability_certification_recycled=Unknown
% @importance 1.0

0.90::true_val(sustainability_certification_recycled, recycled_raw_materials); 0.10::true_val(sustainability_certification_recycled, unk_sustainability_certification_recycled).
0.93::acc(s5, sustainability_certification_recycled).
measured(s5, sustainability_certification_recycled, recycled_raw_materials).
all_consistent(sustainability_certification_recycled) :- consistent(s5, sustainability_certification_recycled).
evidence(all_consistent(sustainability_certification_recycled)).
query(true_val(sustainability_certification_recycled, recycled_raw_materials)).
query(true_val(sustainability_certification_recycled, unk_sustainability_certification_recycled)).

% @attr sustainability_certification_steel
% @type categorical
% @canonical false
% @original_name sustainability_certification (steel)
% @values recycled_steel_50pct=50pct_recycled_steel_standard unk_sustainability_certification_steel=Unknown
% @importance 0.55

0.90::true_val(sustainability_certification_steel, recycled_steel_50pct); 0.10::true_val(sustainability_certification_steel, unk_sustainability_certification_steel).
0.95::acc(s33, sustainability_certification_steel).
measured(s33, sustainability_certification_steel, recycled_steel_50pct).
all_consistent(sustainability_certification_steel) :- consistent(s33, sustainability_certification_steel).
evidence(all_consistent(sustainability_certification_steel)).
query(true_val(sustainability_certification_steel, recycled_steel_50pct)).
query(true_val(sustainability_certification_steel, unk_sustainability_certification_steel)).

% @attr sustainability_certification_carbon
% @type numeric
% @canonical false
% @original_name sustainability_certification (carbon footprint)
% @unit kg_CO2
% @values v32_2=32.2 unk_sustainability_certification_carbon=Unknown
% @importance 1.0

0.90::true_val(sustainability_certification_carbon, v32_2); 0.10::true_val(sustainability_certification_carbon, unk_sustainability_certification_carbon).
0.93::acc(s5, sustainability_certification_carbon).
measured(s5, sustainability_certification_carbon, v32_2).
all_consistent(sustainability_certification_carbon) :- consistent(s5, sustainability_certification_carbon).
evidence(all_consistent(sustainability_certification_carbon)).
query(true_val(sustainability_certification_carbon, v32_2)).
query(true_val(sustainability_certification_carbon, unk_sustainability_certification_carbon)).

% @attr sustainability_certification_polymers
% @type categorical
% @canonical false
% @original_name sustainability_certification (polymers)
% @values recycled_polymers_35pct=35pct_recycled_polymers unk_sustainability_certification_polymers=Unknown
% @importance 0.6

0.90::true_val(sustainability_certification_polymers, recycled_polymers_35pct); 0.10::true_val(sustainability_certification_polymers, unk_sustainability_certification_polymers).
0.95::acc(s29, sustainability_certification_polymers).
measured(s29, sustainability_certification_polymers, recycled_polymers_35pct).
all_consistent(sustainability_certification_polymers) :- consistent(s29, sustainability_certification_polymers).
evidence(all_consistent(sustainability_certification_polymers)).
query(true_val(sustainability_certification_polymers, recycled_polymers_35pct)).
query(true_val(sustainability_certification_polymers, unk_sustainability_certification_polymers)).

% @attr warranty_period_years
% @type numeric
% @canonical true
% @original_name warranty_period_years
% @unit years
% @values v2=2.0 unk_warranty_period_years=Unknown
% @importance 0.8

0.76::true_val(warranty_period_years, v2); 0.24::true_val(warranty_period_years, unk_warranty_period_years).
0.82::acc(s39, warranty_period_years).
measured(s39, warranty_period_years, v2).
all_consistent(warranty_period_years) :-
    (indep(s39), consistent(s39, warranty_period_years) ; \+indep(s39)).
evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v2)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

% @attr warranty_coverage
% @type categorical
% @canonical false
% @original_name warranty
% @values structural_defects_only=Structural_defects_only_no_impact_abuse unk_warranty_coverage=Unknown
% @importance 0.8

0.76::true_val(warranty_coverage, structural_defects_only); 0.24::true_val(warranty_coverage, unk_warranty_coverage).
0.82::acc(s39, warranty_coverage).
measured(s39, warranty_coverage, structural_defects_only).
all_consistent(warranty_coverage) :-
    (indep(s39), consistent(s39, warranty_coverage) ; \+indep(s39)).
evidence(all_consistent(warranty_coverage)).
query(true_val(warranty_coverage, structural_defects_only)).
query(true_val(warranty_coverage, unk_warranty_coverage)).

% @attr price_aud_merchant
% @type numeric
% @canonical true
% @original_name price_aud_merchant
% @unit AUD
% @values v999_99=999.99 unk_price_aud_merchant=Unknown
% @importance 0.9

0.71::true_val(price_aud_merchant, v999_99); 0.29::true_val(price_aud_merchant, unk_price_aud_merchant).
0.80::acc(s3, price_aud_merchant).
measured(s3, price_aud_merchant, v999_99).
all_consistent(price_aud_merchant) :- consistent(s3, price_aud_merchant).
evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v999_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v599_95=599.95 unk_price_usd_msrp=Unknown
% @importance 0.925

0.95::true_val(price_usd_msrp, v599_95); 0.05::true_val(price_usd_msrp, unk_price_usd_msrp).
0.88::acc(s40, price_usd_msrp).
0.85::acc(s47, price_usd_msrp).
measured(s40, price_usd_msrp, v599_95).
measured(s47, price_usd_msrp, v599_95).
all_consistent(price_usd_msrp) :-
    consistent(s40, price_usd_msrp),
    consistent(s47, price_usd_msrp).
evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v599_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_eur_msrp
% @type numeric
% @canonical false
% @original_name price EUR (manufacturer)
% @unit EUR
% @values v649_90=649.90 unk_price_eur_msrp=Unknown
% @importance 1.0

0.90::true_val(price_eur_msrp, v649_90); 0.10::true_val(price_eur_msrp, unk_price_eur_msrp).
0.93::acc(s5, price_eur_msrp).
measured(s5, price_eur_msrp, v649_90).
all_consistent(price_eur_msrp) :- consistent(s5, price_eur_msrp).
evidence(all_consistent(price_eur_msrp)).
query(true_val(price_eur_msrp, v649_90)).
query(true_val(price_eur_msrp, unk_price_eur_msrp)).

% @attr price_usd_blauer
% @type numeric
% @canonical false
% @original_name price USD at Blauer Board Shop
% @unit USD
% @values v479_96=479.96 unk_price_usd_blauer=Unknown
% @importance 0.95

0.64::true_val(price_usd_blauer, v479_96); 0.36::true_val(price_usd_blauer, unk_price_usd_blauer).
0.80::acc(s41, price_usd_blauer).
measured(s41, price_usd_blauer, v479_96).
all_consistent(price_usd_blauer) :- consistent(s41, price_usd_blauer).
evidence(all_consistent(price_usd_blauer)).
query(true_val(price_usd_blauer, v479_96)).
query(true_val(price_usd_blauer, unk_price_usd_blauer)).

% @attr price_usd_evo
% @type numeric
% @canonical true
% @original_name price_usd_evo
% @unit USD
% @values v479_96=479.96 unk_price_usd_evo=Unknown
% @importance 0.95

0.64::true_val(price_usd_evo, v479_96); 0.36::true_val(price_usd_evo, unk_price_usd_evo).
0.80::acc(s41, price_usd_evo).
measured(s41, price_usd_evo, v479_96).
all_consistent(price_usd_evo) :- consistent(s41, price_usd_evo).
evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v479_96)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_christy
% @type numeric
% @canonical false
% @original_name price USD at Christy Sports
% @unit USD
% @values v479_96=479.96 unk_price_usd_christy=Unknown
% @importance 0.95

0.64::true_val(price_usd_christy, v479_96); 0.36::true_val(price_usd_christy, unk_price_usd_christy).
0.80::acc(s41, price_usd_christy).
measured(s41, price_usd_christy, v479_96).
all_consistent(price_usd_christy) :- consistent(s41, price_usd_christy).
evidence(all_consistent(price_usd_christy)).
query(true_val(price_usd_christy, v479_96)).
query(true_val(price_usd_christy, unk_price_usd_christy)).

% @attr price_eur_blue_tomato
% @type numeric
% @canonical true
% @original_name price_eur_blue_tomato
% @unit EUR
% @values v649_95=649.95 unk_price_eur_blue_tomato=Unknown
% @importance 0.95

0.64::true_val(price_eur_blue_tomato, v649_95); 0.36::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).
0.80::acc(s41, price_eur_blue_tomato).
measured(s41, price_eur_blue_tomato, v649_95).
all_consistent(price_eur_blue_tomato) :- consistent(s41, price_eur_blue_tomato).
evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v649_95)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

% @attr price_gbp_blue_tomato_uk
% @type numeric
% @canonical true
% @original_name price_gbp_blue_tomato_uk
% @unit GBP
% @values v580=580.0 unk_price_gbp_blue_tomato_uk=Unknown
% @importance 0.95

0.64::true_val(price_gbp_blue_tomato_uk, v580); 0.36::true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk).
0.80::acc(s41, price_gbp_blue_tomato_uk).
measured(s41, price_gbp_blue_tomato_uk, v580).
all_consistent(price_gbp_blue_tomato_uk) :- consistent(s41, price_gbp_blue_tomato_uk).
evidence(all_consistent(price_gbp_blue_tomato_uk)).
query(true_val(price_gbp_blue_tomato_uk, v580)).
query(true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk)).

% @attr price_sek_blue_tomato
% @type numeric
% @canonical false
% @original_name price SEK at BlueTomato Sweden
% @unit SEK
% @values v6999=6999.0 unk_price_sek_blue_tomato=Unknown
% @importance 0.95

0.64::true_val(price_sek_blue_tomato, v6999); 0.36::true_val(price_sek_blue_tomato, unk_price_sek_blue_tomato).
0.80::acc(s41, price_sek_blue_tomato).
measured(s41, price_sek_blue_tomato, v6999).
all_consistent(price_sek_blue_tomato) :- consistent(s41, price_sek_blue_tomato).
evidence(all_consistent(price_sek_blue_tomato)).
query(true_val(price_sek_blue_tomato, v6999)).
query(true_val(price_sek_blue_tomato, unk_price_sek_blue_tomato)).

% @attr price_dkk_blue_tomato
% @type numeric
% @canonical false
% @original_name price DKK at BlueTomato Denmark
% @unit DKK
% @values v4850=4850.0 unk_price_dkk_blue_tomato=Unknown
% @importance 0.95

0.64::true_val(price_dkk_blue_tomato, v4850); 0.36::true_val(price_dkk_blue_tomato, unk_price_dkk_blue_tomato).
0.80::acc(s41, price_dkk_blue_tomato).
measured(s41, price_dkk_blue_tomato, v4850).
all_consistent(price_dkk_blue_tomato) :- consistent(s41, price_dkk_blue_tomato).
evidence(all_consistent(price_dkk_blue_tomato)).
query(true_val(price_dkk_blue_tomato, v4850)).
query(true_val(price_dkk_blue_tomato, unk_price_dkk_blue_tomato)).

% @attr price_eur_snowcountry
% @type numeric
% @canonical false
% @original_name price EUR at SnowCountry
% @unit EUR
% @values v499=499.0 unk_price_eur_snowcountry=Unknown
% @importance 0.95

0.64::true_val(price_eur_snowcountry, v499); 0.36::true_val(price_eur_snowcountry, unk_price_eur_snowcountry).
0.80::acc(s41, price_eur_snowcountry).
measured(s41, price_eur_snowcountry, v499).
all_consistent(price_eur_snowcountry) :- consistent(s41, price_eur_snowcountry).
evidence(all_consistent(price_eur_snowcountry)).
query(true_val(price_eur_snowcountry, v499)).
query(true_val(price_eur_snowcountry, unk_price_eur_snowcountry)).

% @attr price_cad_prfo
% @type numeric
% @canonical true
% @original_name price_cad_prfo
% @unit CAD
% @values v555_99=555.99 unk_price_cad_prfo=Unknown
% @importance 0.95

0.64::true_val(price_cad_prfo, v555_99); 0.36::true_val(price_cad_prfo, unk_price_cad_prfo).
0.80::acc(s41, price_cad_prfo).
measured(s41, price_cad_prfo, v555_99).
all_consistent(price_cad_prfo) :- consistent(s41, price_cad_prfo).
evidence(all_consistent(price_cad_prfo)).
query(true_val(price_cad_prfo, v555_99)).
query(true_val(price_cad_prfo, unk_price_cad_prfo)).

% @attr availability_status_melbourne
% @type categorical
% @canonical false
% @original_name availability_status (Melbourne Snowboard)
% @values au_indie_preorder=Independently_owned_AU_store_preorder_2027 unk_availability_status_melbourne=Unknown
% @importance 0.75

0.68::true_val(availability_status_melbourne, au_indie_preorder); 0.32::true_val(availability_status_melbourne, unk_availability_status_melbourne).
0.78::acc(s42, availability_status_melbourne).
measured(s42, availability_status_melbourne, au_indie_preorder).
all_consistent(availability_status_melbourne) :- consistent(s42, availability_status_melbourne).
evidence(all_consistent(availability_status_melbourne)).
query(true_val(availability_status_melbourne, au_indie_preorder)).
query(true_val(availability_status_melbourne, unk_availability_status_melbourne)).

% @attr availability_status_balmoral
% @type categorical
% @canonical false
% @original_name availability_status (Balmoral Boards)
% @values au_sydney_preorder_layby=Sydney_AU_preorder_lay_by_10_flat_shipping unk_availability_status_balmoral=Unknown
% @importance 0.8

0.63::true_val(availability_status_balmoral, au_sydney_preorder_layby); 0.37::true_val(availability_status_balmoral, unk_availability_status_balmoral).
0.75::acc(s18, availability_status_balmoral).
measured(s18, availability_status_balmoral, au_sydney_preorder_layby).
all_consistent(availability_status_balmoral) :- consistent(s18, availability_status_balmoral).
evidence(all_consistent(availability_status_balmoral)).
query(true_val(availability_status_balmoral, au_sydney_preorder_layby)).
query(true_val(availability_status_balmoral, unk_availability_status_balmoral)).

% @attr availability_status_ess
% @type categorical
% @canonical false
% @original_name availability_status (ESS Board Store)
% @values family_run_30yr_preorder=Family_run_30plus_years_preorder_2027 unk_availability_status_ess=Unknown
% @importance 0.5

0.39::true_val(availability_status_ess, family_run_30yr_preorder); 0.61::true_val(availability_status_ess, unk_availability_status_ess).
0.60::acc(s30, availability_status_ess).
measured(s30, availability_status_ess, family_run_30yr_preorder).
all_consistent(availability_status_ess) :- consistent(s30, availability_status_ess).
evidence(all_consistent(availability_status_ess)).
query(true_val(availability_status_ess, family_run_30yr_preorder)).
query(true_val(availability_status_ess, unk_availability_status_ess)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status (Evo)
% @values major_us_online_price_match=Major_US_online_price_match_1yr_return unk_availability_status_evo=Unknown
% @importance 0.6

0.68::true_val(availability_status_evo, major_us_online_price_match); 0.32::true_val(availability_status_evo, unk_availability_status_evo).
0.80::acc(s43, availability_status_evo).
measured(s43, availability_status_evo, major_us_online_price_match).
all_consistent(availability_status_evo) :- consistent(s43, availability_status_evo).
evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, major_us_online_price_match)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status (Blauer Board Shop)
% @values specialist_indie_tgr_fave=Specialist_independent_TGR_recommended_store unk_availability_status_blauer=Unknown
% @importance 0.95

0.64::true_val(availability_status_blauer, specialist_indie_tgr_fave); 0.36::true_val(availability_status_blauer, unk_availability_status_blauer).
0.80::acc(s41, availability_status_blauer).
measured(s41, availability_status_blauer, specialist_indie_tgr_fave).
all_consistent(availability_status_blauer) :- consistent(s41, availability_status_blauer).
evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, specialist_indie_tgr_fave)).
query(true_val(availability_status_blauer, unk_availability_status_blauer)).

% @attr availability_status_christy
% @type categorical
% @canonical false
% @original_name availability_status (Christy Sports)
% @values established_us_chain=Established_US_chain_snow_sports unk_availability_status_christy=Unknown
% @importance 0.95

0.64::true_val(availability_status_christy, established_us_chain); 0.36::true_val(availability_status_christy, unk_availability_status_christy).
0.80::acc(s41, availability_status_christy).
measured(s41, availability_status_christy, established_us_chain).
all_consistent(availability_status_christy) :- consistent(s41, availability_status_christy).
evidence(all_consistent(availability_status_christy)).
query(true_val(availability_status_christy, established_us_chain)).
query(true_val(availability_status_christy, unk_availability_status_christy)).

% @attr availability_status_tactics
% @type categorical
% @canonical false
% @original_name availability_status (Tactics)
% @values specialist_online_detailed=Specialist_online_snowboard_retailer_detailed unk_availability_status_tactics=Unknown
% @importance 0.65

0.72::true_val(availability_status_tactics, specialist_online_detailed); 0.28::true_val(availability_status_tactics, unk_availability_status_tactics).
0.80::acc(s15, availability_status_tactics).
measured(s15, availability_status_tactics, specialist_online_detailed).
all_consistent(availability_status_tactics) :- consistent(s15, availability_status_tactics).
evidence(all_consistent(availability_status_tactics)).
query(true_val(availability_status_tactics, specialist_online_detailed)).
query(true_val(availability_status_tactics, unk_availability_status_tactics)).

% @attr availability_status_blue_tomato
% @type categorical
% @canonical false
% @original_name availability_status (BlueTomato)
% @values major_eu_action_sports=Major_European_action_sports_retailer_10plus_countries unk_availability_status_blue_tomato=Unknown
% @importance 0.95

0.64::true_val(availability_status_blue_tomato, major_eu_action_sports); 0.36::true_val(availability_status_blue_tomato, unk_availability_status_blue_tomato).
0.80::acc(s41, availability_status_blue_tomato).
measured(s41, availability_status_blue_tomato, major_eu_action_sports).
all_consistent(availability_status_blue_tomato) :- consistent(s41, availability_status_blue_tomato).
evidence(all_consistent(availability_status_blue_tomato)).
query(true_val(availability_status_blue_tomato, major_eu_action_sports)).
query(true_val(availability_status_blue_tomato, unk_availability_status_blue_tomato)).

% @attr availability_status_snowcountry
% @type categorical
% @canonical false
% @original_name availability_status (SnowCountry)
% @values eu_snowboard_retailer=European_snowboard_retailer unk_availability_status_snowcountry=Unknown
% @importance 0.95

0.64::true_val(availability_status_snowcountry, eu_snowboard_retailer); 0.36::true_val(availability_status_snowcountry, unk_availability_status_snowcountry).
0.80::acc(s41, availability_status_snowcountry).
measured(s41, availability_status_snowcountry, eu_snowboard_retailer).
all_consistent(availability_status_snowcountry) :- consistent(s41, availability_status_snowcountry).
evidence(all_consistent(availability_status_snowcountry)).
query(true_val(availability_status_snowcountry, eu_snowboard_retailer)).
query(true_val(availability_status_snowcountry, unk_availability_status_snowcountry)).

% @attr availability_status_prfo
% @type categorical
% @canonical false
% @original_name availability_status (PRFO Canada)
% @values canadian_snow_sports=Canadian_snow_sports_retailer unk_availability_status_prfo=Unknown
% @importance 0.95

0.64::true_val(availability_status_prfo, canadian_snow_sports); 0.36::true_val(availability_status_prfo, unk_availability_status_prfo).
0.80::acc(s41, availability_status_prfo).
measured(s41, availability_status_prfo, canadian_snow_sports).
all_consistent(availability_status_prfo) :- consistent(s41, availability_status_prfo).
evidence(all_consistent(availability_status_prfo)).
query(true_val(availability_status_prfo, canadian_snow_sports)).
query(true_val(availability_status_prfo, unk_availability_status_prfo)).

% @attr availability_status_auski
% @type categorical
% @canonical false
% @original_name availability_status (Auski)
% @values au_retailer_prev_stocked=AU_ski_snowboard_retailer_2025_previously_stocked unk_availability_status_auski=Unknown
% @importance 0.5

0.52::true_val(availability_status_auski, au_retailer_prev_stocked); 0.48::true_val(availability_status_auski, unk_availability_status_auski).
0.68::acc(s44, availability_status_auski).
measured(s44, availability_status_auski, au_retailer_prev_stocked).
all_consistent(availability_status_auski) :- consistent(s44, availability_status_auski).
evidence(all_consistent(availability_status_auski)).
query(true_val(availability_status_auski, au_retailer_prev_stocked)).
query(true_val(availability_status_auski, unk_availability_status_auski)).

% @attr availability_status_snow_skiers
% @type categorical
% @canonical false
% @original_name availability_status (Snow Skiers Warehouse)
% @values sydney_high_sellout=Sydney_retailer_high_sell_out_risk unk_availability_status_snow_skiers=Unknown
% @importance 0.6

0.45::true_val(availability_status_snow_skiers, sydney_high_sellout); 0.55::true_val(availability_status_snow_skiers, unk_availability_status_snow_skiers).
0.62::acc(s45, availability_status_snow_skiers).
measured(s45, availability_status_snow_skiers, sydney_high_sellout).
all_consistent(availability_status_snow_skiers) :- consistent(s45, availability_status_snow_skiers).
evidence(all_consistent(availability_status_snow_skiers)).
query(true_val(availability_status_snow_skiers, sydney_high_sellout)).
query(true_val(availability_status_snow_skiers, unk_availability_status_snow_skiers)).

% @attr tgr_reviewer_credentials
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (reviewer credentials)
% @values tested_800_plus_independent=Tested_800plus_boards_independent_no_brand_oversight unk_tgr_reviewer_credentials=Unknown
% @importance 0.9

0.77::true_val(tgr_reviewer_credentials, tested_800_plus_independent); 0.23::true_val(tgr_reviewer_credentials, unk_tgr_reviewer_credentials).
0.88::acc(s46, tgr_reviewer_credentials).
measured(s46, tgr_reviewer_credentials, tested_800_plus_independent).
all_consistent(tgr_reviewer_credentials) :- consistent(s46, tgr_reviewer_credentials).
evidence(all_consistent(tgr_reviewer_credentials)).
query(true_val(tgr_reviewer_credentials, tested_800_plus_independent)).
query(true_val(tgr_reviewer_credentials, unk_tgr_reviewer_credentials)).

% @attr tgr_test_size
% @type numeric
% @canonical false
% @original_name reviewer_opinion_the_good_ride (test size)
% @unit cm
% @values v160=160.0 unk_tgr_test_size=Unknown
% @importance 0.9

0.77::true_val(tgr_test_size, v160); 0.23::true_val(tgr_test_size, unk_tgr_test_size).
0.90::acc(s46, tgr_test_size).
measured(s46, tgr_test_size, v160).
all_consistent(tgr_test_size) :- consistent(s46, tgr_test_size).
evidence(all_consistent(tgr_test_size)).
query(true_val(tgr_test_size, v160)).
query(true_val(tgr_test_size, unk_tgr_test_size)).

% @attr tgr_test_days
% @type numeric
% @canonical false
% @original_name reviewer_opinion_the_good_ride (test days)
% @unit days
% @values v3=3.0 unk_tgr_test_days=Unknown
% @importance 0.9

0.77::true_val(tgr_test_days, v3); 0.23::true_val(tgr_test_days, unk_tgr_test_days).
0.90::acc(s46, tgr_test_days).
measured(s46, tgr_test_days, v3).
all_consistent(tgr_test_days) :- consistent(s46, tgr_test_days).
evidence(all_consistent(tgr_test_days)).
query(true_val(tgr_test_days, v3)).
query(true_val(tgr_test_days, unk_tgr_test_days)).

% @attr tgr_test_conditions
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (test conditions)
% @values spring_groomers_powder=Decent_spring_groomers_and_good_powder unk_tgr_test_conditions=Unknown
% @importance 0.9

0.77::true_val(tgr_test_conditions, spring_groomers_powder); 0.23::true_val(tgr_test_conditions, unk_tgr_test_conditions).
0.88::acc(s46, tgr_test_conditions).
measured(s46, tgr_test_conditions, spring_groomers_powder).
all_consistent(tgr_test_conditions) :- consistent(s46, tgr_test_conditions).
evidence(all_consistent(tgr_test_conditions)).
query(true_val(tgr_test_conditions, spring_groomers_powder)).
query(true_val(tgr_test_conditions, unk_tgr_test_conditions)).

% @attr tgr_riding_style_classification
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (riding style)
% @values alternative_freeride=Alternative_Freeride unk_tgr_riding_style_classification=Unknown
% @importance 0.95

0.81::true_val(tgr_riding_style_classification, alternative_freeride); 0.19::true_val(tgr_riding_style_classification, unk_tgr_riding_style_classification).
0.88::acc(s47, tgr_riding_style_classification).
measured(s47, tgr_riding_style_classification, alternative_freeride).
all_consistent(tgr_riding_style_classification) :- consistent(s47, tgr_riding_style_classification).
evidence(all_consistent(tgr_riding_style_classification)).
query(true_val(tgr_riding_style_classification, alternative_freeride)).
query(true_val(tgr_riding_style_classification, unk_tgr_riding_style_classification)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values advanced_expert=Advanced_Expert unk_skill_level_recommendation=Unknown
% @importance 0.95

0.81::true_val(skill_level_recommendation, advanced_expert); 0.19::true_val(skill_level_recommendation, unk_skill_level_recommendation).
0.88::acc(s47, skill_level_recommendation).
measured(s47, skill_level_recommendation, advanced_expert).
all_consistent(skill_level_recommendation) :- consistent(s47, skill_level_recommendation).
evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, advanced_expert)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

% @attr tgr_boot_size_fit
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (boot size fit)
% @values us_8_10_and_10_12=US_8to10_10to12 unk_tgr_boot_size_fit=Unknown
% @importance 0.95

0.81::true_val(tgr_boot_size_fit, us_8_10_and_10_12); 0.19::true_val(tgr_boot_size_fit, unk_tgr_boot_size_fit).
0.88::acc(s47, tgr_boot_size_fit).
measured(s47, tgr_boot_size_fit, us_8_10_and_10_12).
all_consistent(tgr_boot_size_fit) :- consistent(s47, tgr_boot_size_fit).
evidence(all_consistent(tgr_boot_size_fit)).
query(true_val(tgr_boot_size_fit, us_8_10_and_10_12)).
query(true_val(tgr_boot_size_fit, unk_tgr_boot_size_fit)).

% @attr powder_rating_tgr
% @type categorical
% @canonical true
% @original_name powder_rating_tgr
% @values great=Great unk_powder_rating_tgr=Unknown
% @importance 0.95

0.81::true_val(powder_rating_tgr, great); 0.19::true_val(powder_rating_tgr, unk_powder_rating_tgr).
0.88::acc(s47, powder_rating_tgr).
measured(s47, powder_rating_tgr, great).
all_consistent(powder_rating_tgr) :- consistent(s47, powder_rating_tgr).
evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, great)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

% @attr carving_rating_tgr
% @type categorical
% @canonical true
% @original_name carving_rating_tgr
% @values great=Great unk_carving_rating_tgr=Unknown
% @importance 0.95

0.81::true_val(carving_rating_tgr, great); 0.19::true_val(carving_rating_tgr, unk_carving_rating_tgr).
0.88::acc(s47, carving_rating_tgr).
measured(s47, carving_rating_tgr, great).
all_consistent(carving_rating_tgr) :- consistent(s47, carving_rating_tgr).
evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, great)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

% @attr tgr_uneven_snow_rating
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (uneven snow)
% @values great=Great unk_tgr_uneven_snow_rating=Unknown
% @importance 0.95

0.81::true_val(tgr_uneven_snow_rating, great); 0.19::true_val(tgr_uneven_snow_rating, unk_tgr_uneven_snow_rating).
0.88::acc(s47, tgr_uneven_snow_rating).
measured(s47, tgr_uneven_snow_rating, great).
all_consistent(tgr_uneven_snow_rating) :- consistent(s47, tgr_uneven_snow_rating).
evidence(all_consistent(tgr_uneven_snow_rating)).
query(true_val(tgr_uneven_snow_rating, great)).
query(true_val(tgr_uneven_snow_rating, unk_tgr_uneven_snow_rating)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values good=Good unk_base_glide_performance=Unknown
% @importance 0.95

0.81::true_val(base_glide_performance, good); 0.19::true_val(base_glide_performance, unk_base_glide_performance).
0.88::acc(s47, base_glide_performance).
measured(s47, base_glide_performance, good).
all_consistent(base_glide_performance) :- consistent(s47, base_glide_performance).
evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, good)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr speed_rating_tgr
% @type categorical
% @canonical true
% @original_name speed_rating_tgr
% @values good=Good unk_speed_rating_tgr=Unknown
% @importance 0.95

0.81::true_val(speed_rating_tgr, good); 0.19::true_val(speed_rating_tgr, unk_speed_rating_tgr).
0.88::acc(s47, speed_rating_tgr).
measured(s47, speed_rating_tgr, good).
all_consistent(speed_rating_tgr) :- consistent(s47, speed_rating_tgr).
evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, good)).
query(true_val(speed_rating_tgr, unk_speed_rating_tgr)).

% @attr tgr_switch_rating
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (switch)
% @values average=Average unk_tgr_switch_rating=Unknown
% @importance 0.95

0.81::true_val(tgr_switch_rating, average); 0.19::true_val(tgr_switch_rating, unk_tgr_switch_rating).
0.88::acc(s47, tgr_switch_rating).
measured(s47, tgr_switch_rating, average).
all_consistent(tgr_switch_rating) :- consistent(s47, tgr_switch_rating).
evidence(all_consistent(tgr_switch_rating)).
query(true_val(tgr_switch_rating, average)).
query(true_val(tgr_switch_rating, unk_tgr_switch_rating)).

% @attr jumps_rating_tgr
% @type categorical
% @canonical true
% @original_name jumps_rating_tgr
% @values good=Good unk_jumps_rating_tgr=Unknown
% @importance 0.95

0.81::true_val(jumps_rating_tgr, good); 0.19::true_val(jumps_rating_tgr, unk_jumps_rating_tgr).
0.88::acc(s47, jumps_rating_tgr).
measured(s47, jumps_rating_tgr, good).
all_consistent(jumps_rating_tgr) :- consistent(s47, jumps_rating_tgr).
evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, good)).
query(true_val(jumps_rating_tgr, unk_jumps_rating_tgr)).

% @attr jibbing_rating_tgr
% @type categorical
% @canonical true
% @original_name jibbing_rating_tgr
% @values average=Average unk_jibbing_rating_tgr=Unknown
% @importance 0.95

0.81::true_val(jibbing_rating_tgr, average); 0.19::true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr).
0.88::acc(s47, jibbing_rating_tgr).
measured(s47, jibbing_rating_tgr, average).
all_consistent(jibbing_rating_tgr) :- consistent(s47, jibbing_rating_tgr).
evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, average)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr)).

% @attr pipe_rating_tgr
% @type categorical
% @canonical true
% @original_name pipe_rating_tgr
% @values average=Average unk_pipe_rating_tgr=Unknown
% @importance 0.95

0.81::true_val(pipe_rating_tgr, average); 0.19::true_val(pipe_rating_tgr, unk_pipe_rating_tgr).
0.88::acc(s47, pipe_rating_tgr).
measured(s47, pipe_rating_tgr, average).
all_consistent(pipe_rating_tgr) :- consistent(s47, pipe_rating_tgr).
evidence(all_consistent(pipe_rating_tgr)).
query(true_val(pipe_rating_tgr, average)).
query(true_val(pipe_rating_tgr, unk_pipe_rating_tgr)).

% @attr on_snow_feel_tgr
% @type categorical
% @canonical true
% @original_name on_snow_feel_tgr
% @values semi_locked_in=Semi_Locked_In unk_on_snow_feel_tgr=Unknown
% @importance 0.95

0.81::true_val(on_snow_feel_tgr, semi_locked_in); 0.19::true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr).
0.88::acc(s47, on_snow_feel_tgr).
measured(s47, on_snow_feel_tgr, semi_locked_in).
all_consistent(on_snow_feel_tgr) :- consistent(s47, on_snow_feel_tgr).
evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, semi_locked_in)).
query(true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values medium=Medium unk_turn_initiation_performance=Unknown
% @importance 0.95

0.81::true_val(turn_initiation_performance, medium); 0.19::true_val(turn_initiation_performance, unk_turn_initiation_performance).
0.88::acc(s47, turn_initiation_performance).
measured(s47, turn_initiation_performance, medium).
all_consistent(turn_initiation_performance) :- consistent(s47, turn_initiation_performance).
evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, medium)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr tgr_buttering
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (buttering)
% @values semi_hard=Semi_Hard unk_tgr_buttering=Unknown
% @importance 0.95

0.81::true_val(tgr_buttering, semi_hard); 0.19::true_val(tgr_buttering, unk_tgr_buttering).
0.88::acc(s47, tgr_buttering).
measured(s47, tgr_buttering, semi_hard).
all_consistent(tgr_buttering) :- consistent(s47, tgr_buttering).
evidence(all_consistent(tgr_buttering)).
query(true_val(tgr_buttering, semi_hard)).
query(true_val(tgr_buttering, unk_tgr_buttering)).

% @attr flex_rating_10_the_good_ride
% @type categorical
% @canonical true
% @original_name flex_rating_10_the_good_ride
% @values medium_stiff=Medium_Stiff unk_flex_rating_10_the_good_ride=Unknown
% @importance 0.95

0.81::true_val(flex_rating_10_the_good_ride, medium_stiff); 0.19::true_val(flex_rating_10_the_good_ride, unk_flex_rating_10_the_good_ride).
0.88::acc(s47, flex_rating_10_the_good_ride).
measured(s47, flex_rating_10_the_good_ride, medium_stiff).
all_consistent(flex_rating_10_the_good_ride) :- consistent(s47, flex_rating_10_the_good_ride).
evidence(all_consistent(flex_rating_10_the_good_ride)).
query(true_val(flex_rating_10_the_good_ride, medium_stiff)).
query(true_val(flex_rating_10_the_good_ride, unk_flex_rating_10_the_good_ride)).

% @attr tgr_tip_tail_pressure
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (tip/tail pressure)
% @values semi_hard=Semi_Hard unk_tgr_tip_tail_pressure=Unknown
% @importance 0.95

0.81::true_val(tgr_tip_tail_pressure, semi_hard); 0.19::true_val(tgr_tip_tail_pressure, unk_tgr_tip_tail_pressure).
0.88::acc(s47, tgr_tip_tail_pressure).
measured(s47, tgr_tip_tail_pressure, semi_hard).
all_consistent(tgr_tip_tail_pressure) :- consistent(s47, tgr_tip_tail_pressure).
evidence(all_consistent(tgr_tip_tail_pressure)).
query(true_val(tgr_tip_tail_pressure, semi_hard)).
query(true_val(tgr_tip_tail_pressure, unk_tgr_tip_tail_pressure)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values hard_snow_capable=Hard_Snow_capable_great_edge_from_camber unk_edge_hold=Unknown
% @importance 0.875

0.90::true_val(edge_hold, hard_snow_capable); 0.10::true_val(edge_hold, unk_edge_hold).
0.88::acc(s47, edge_hold).
0.78::acc(s51, edge_hold).
measured(s47, edge_hold, hard_snow_capable).
measured(s51, edge_hold, hard_snow_capable).
all_consistent(edge_hold) :-
    consistent(s47, edge_hold),
    consistent(s51, edge_hold).
evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, hard_snow_capable)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr tgr_setback_observation
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (setback observation)
% @values neg15_rides_centered=neg15mm_setback_rides_more_centered_than_peers unk_tgr_setback_observation=Unknown
% @importance 0.85

0.77::true_val(tgr_setback_observation, neg15_rides_centered); 0.23::true_val(tgr_setback_observation, unk_tgr_setback_observation).
0.85::acc(s48, tgr_setback_observation).
measured(s48, tgr_setback_observation, neg15_rides_centered).
all_consistent(tgr_setback_observation) :- consistent(s48, tgr_setback_observation).
evidence(all_consistent(tgr_setback_observation)).
query(true_val(tgr_setback_observation, neg15_rides_centered)).
query(true_val(tgr_setback_observation, unk_tgr_setback_observation)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values fun_centered_turning=Fun_centered_feel_when_turning unk_positive_aspect=Unknown
% @importance 0.95

0.81::true_val(positive_aspect, fun_centered_turning); 0.19::true_val(positive_aspect, unk_positive_aspect).
0.88::acc(s47, positive_aspect).
measured(s47, positive_aspect, fun_centered_turning).
all_consistent(positive_aspect) :- consistent(s47, positive_aspect).
evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, fun_centered_turning)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr positive_aspect_float
% @type categorical
% @canonical false
% @original_name positive_aspect (float)
% @values pretty_good_float=Pretty_good_float unk_positive_aspect_float=Unknown
% @importance 0.95

0.81::true_val(positive_aspect_float, pretty_good_float); 0.19::true_val(positive_aspect_float, unk_positive_aspect_float).
0.88::acc(s47, positive_aspect_float).
measured(s47, positive_aspect_float, pretty_good_float).
all_consistent(positive_aspect_float) :- consistent(s47, positive_aspect_float).
evidence(all_consistent(positive_aspect_float)).
query(true_val(positive_aspect_float, pretty_good_float)).
query(true_val(positive_aspect_float, unk_positive_aspect_float)).

% @attr positive_aspect_pop
% @type categorical
% @canonical false
% @original_name positive_aspect (pop)
% @values very_good_pop=Very_good_pop unk_positive_aspect_pop=Unknown
% @importance 0.95

0.81::true_val(positive_aspect_pop, very_good_pop); 0.19::true_val(positive_aspect_pop, unk_positive_aspect_pop).
0.88::acc(s47, positive_aspect_pop).
measured(s47, positive_aspect_pop, very_good_pop).
all_consistent(positive_aspect_pop) :- consistent(s47, positive_aspect_pop).
evidence(all_consistent(positive_aspect_pop)).
query(true_val(positive_aspect_pop, very_good_pop)).
query(true_val(positive_aspect_pop, unk_positive_aspect_pop)).

% @attr positive_aspect_spoon_nose
% @type categorical
% @canonical false
% @original_name positive_aspect (spoon nose)
% @values spoon_nose_only_pow=Minor_spoon_nose_felt_only_in_pow unk_positive_aspect_spoon_nose=Unknown
% @importance 0.95

0.81::true_val(positive_aspect_spoon_nose, spoon_nose_only_pow); 0.19::true_val(positive_aspect_spoon_nose, unk_positive_aspect_spoon_nose).
0.88::acc(s47, positive_aspect_spoon_nose).
measured(s47, positive_aspect_spoon_nose, spoon_nose_only_pow).
all_consistent(positive_aspect_spoon_nose) :- consistent(s47, positive_aspect_spoon_nose).
evidence(all_consistent(positive_aspect_spoon_nose)).
query(true_val(positive_aspect_spoon_nose, spoon_nose_only_pow)).
query(true_val(positive_aspect_spoon_nose, unk_positive_aspect_spoon_nose)).

% @attr negative_aspect
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values hard_turn_uneven_small_boots=Hard_to_turn_uneven_snow_size_10_and_under unk_negative_aspect=Unknown
% @importance 0.95

0.81::true_val(negative_aspect, hard_turn_uneven_small_boots); 0.19::true_val(negative_aspect, unk_negative_aspect).
0.88::acc(s47, negative_aspect).
measured(s47, negative_aspect, hard_turn_uneven_small_boots).
all_consistent(negative_aspect) :- consistent(s47, negative_aspect).
evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, hard_turn_uneven_small_boots)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr board_weight_grams
% @type categorical
% @canonical true
% @original_name board_weight_grams
% @values normal_weight=Feels_normal_for_surface_area_not_precisely_measured unk_board_weight_grams=Unknown
% @importance 0.55

0.72::true_val(board_weight_grams, normal_weight); 0.28::true_val(board_weight_grams, unk_board_weight_grams).
0.82::acc(s49, board_weight_grams).
measured(s49, board_weight_grams, normal_weight).
all_consistent(board_weight_grams) :- consistent(s49, board_weight_grams).
evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, normal_weight)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr tgr_second_reviewer_credentials
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (second reviewer)
% @values exp_20yr_100days_coach=20yr_experience_100plus_days_per_year_coach unk_tgr_second_reviewer_credentials=Unknown
% @importance 0.6

0.60::true_val(tgr_second_reviewer_credentials, exp_20yr_100days_coach); 0.40::true_val(tgr_second_reviewer_credentials, unk_tgr_second_reviewer_credentials).
0.75::acc(s50, tgr_second_reviewer_credentials).
measured(s50, tgr_second_reviewer_credentials, exp_20yr_100days_coach).
all_consistent(tgr_second_reviewer_credentials) :- consistent(s50, tgr_second_reviewer_credentials).
evidence(all_consistent(tgr_second_reviewer_credentials)).
query(true_val(tgr_second_reviewer_credentials, exp_20yr_100days_coach)).
query(true_val(tgr_second_reviewer_credentials, unk_tgr_second_reviewer_credentials)).

% @attr tgr_comfort_quote
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (comfort)
% @values turnkey_comfortable=Really_turnkey_comfortable_right_away unk_tgr_comfort_quote=Unknown
% @importance 0.8

0.60::true_val(tgr_comfort_quote, turnkey_comfortable); 0.40::true_val(tgr_comfort_quote, unk_tgr_comfort_quote).
0.75::acc(s51, tgr_comfort_quote).
measured(s51, tgr_comfort_quote, turnkey_comfortable).
all_consistent(tgr_comfort_quote) :- consistent(s51, tgr_comfort_quote).
evidence(all_consistent(tgr_comfort_quote)).
query(true_val(tgr_comfort_quote, turnkey_comfortable)).
query(true_val(tgr_comfort_quote, unk_tgr_comfort_quote)).

% @attr tgr_freeride_excellence
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (freeride)
% @values excelled_freeriding_resort=Definitely_excelled_in_freeriding_around_resort unk_tgr_freeride_excellence=Unknown
% @importance 0.8

0.60::true_val(tgr_freeride_excellence, excelled_freeriding_resort); 0.40::true_val(tgr_freeride_excellence, unk_tgr_freeride_excellence).
0.75::acc(s51, tgr_freeride_excellence).
measured(s51, tgr_freeride_excellence, excelled_freeriding_resort).
all_consistent(tgr_freeride_excellence) :- consistent(s51, tgr_freeride_excellence).
evidence(all_consistent(tgr_freeride_excellence)).
query(true_val(tgr_freeride_excellence, excelled_freeriding_resort)).
query(true_val(tgr_freeride_excellence, unk_tgr_freeride_excellence)).

% @attr tgr_deep_snow_performance
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (deep snow)
% @values excels_deep_snow_slush_trees=Excels_deeper_snow_slush_trees_nimble_turny unk_tgr_deep_snow_performance=Unknown
% @importance 0.8

0.60::true_val(tgr_deep_snow_performance, excels_deep_snow_slush_trees); 0.40::true_val(tgr_deep_snow_performance, unk_tgr_deep_snow_performance).
0.75::acc(s51, tgr_deep_snow_performance).
measured(s51, tgr_deep_snow_performance, excels_deep_snow_slush_trees).
all_consistent(tgr_deep_snow_performance) :- consistent(s51, tgr_deep_snow_performance).
evidence(all_consistent(tgr_deep_snow_performance)).
query(true_val(tgr_deep_snow_performance, excels_deep_snow_slush_trees)).
query(true_val(tgr_deep_snow_performance, unk_tgr_deep_snow_performance)).

% @attr pop
% @type categorical
% @canonical false
% @original_name pop
% @values lot_of_snap=A_lot_of_snap_in_and_out_of_turns unk_pop=Unknown
% @importance 0.8

0.60::true_val(pop, lot_of_snap); 0.40::true_val(pop, unk_pop).
0.75::acc(s51, pop).
measured(s51, pop, lot_of_snap).
all_consistent(pop) :- consistent(s51, pop).
evidence(all_consistent(pop)).
query(true_val(pop, lot_of_snap)).
query(true_val(pop, unk_pop)).

% @attr tgr_park_assessment
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (park)
% @values side_hits_jumps_great=Side_hits_great_park_jumps_great unk_tgr_park_assessment=Unknown
% @importance 0.8

0.60::true_val(tgr_park_assessment, side_hits_jumps_great); 0.40::true_val(tgr_park_assessment, unk_tgr_park_assessment).
0.75::acc(s51, tgr_park_assessment).
measured(s51, tgr_park_assessment, side_hits_jumps_great).
all_consistent(tgr_park_assessment) :- consistent(s51, tgr_park_assessment).
evidence(all_consistent(tgr_park_assessment)).
query(true_val(tgr_park_assessment, side_hits_jumps_great)).
query(true_val(tgr_park_assessment, unk_tgr_park_assessment)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values best_freeride_bigmtn_some_park=Best_for_freeriding_big_mountain_bit_of_park unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.85

0.63::true_val(reviewer_opinion_the_good_ride, best_freeride_bigmtn_some_park); 0.37::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).
0.78::acc(s52, reviewer_opinion_the_good_ride).
measured(s52, reviewer_opinion_the_good_ride, best_freeride_bigmtn_some_park).
all_consistent(reviewer_opinion_the_good_ride) :- consistent(s52, reviewer_opinion_the_good_ride).
evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, best_freeride_bigmtn_some_park)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr review_independence_king_snow
% @type categorical
% @canonical false
% @original_name review independence
% @values independently_written=Independently_written_no_brand_oversight unk_review_independence_king_snow=Unknown
% @importance 0.3

0.63::true_val(review_independence_king_snow, independently_written); 0.37::true_val(review_independence_king_snow, unk_review_independence_king_snow).
0.75::acc(s53, review_independence_king_snow).
measured(s53, review_independence_king_snow, independently_written).
all_consistent(review_independence_king_snow) :- consistent(s53, review_independence_king_snow).
evidence(all_consistent(review_independence_king_snow)).
query(true_val(review_independence_king_snow, independently_written)).
query(true_val(review_independence_king_snow, unk_review_independence_king_snow)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values gremlin_similar_specs_stiffer=Nearly_identical_specs_Gremlin_stiffer_Dinghy_more_torsional unk_user_review_forum=Unknown
% @importance 0.8

0.38::true_val(user_review_forum, gremlin_similar_specs_stiffer); 0.62::true_val(user_review_forum, unk_user_review_forum).
0.72::acc(s54, user_review_forum).
measured(s54, user_review_forum, gremlin_similar_specs_stiffer).
all_consistent(user_review_forum) :- consistent(s54, user_review_forum).
evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, gremlin_similar_specs_stiffer)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr user_review_forum_flex_feel
% @type categorical
% @canonical false
% @original_name user_review_forum (flex feel)
% @values smooth_snappy_not_dead_fish=Smooth_and_snappy_yet_not_a_dead_fish unk_user_review_forum_flex_feel=Unknown
% @importance 0.6

0.32::true_val(user_review_forum_flex_feel, smooth_snappy_not_dead_fish); 0.68::true_val(user_review_forum_flex_feel, unk_user_review_forum_flex_feel).
0.70::acc(s55, user_review_forum_flex_feel).
measured(s55, user_review_forum_flex_feel, smooth_snappy_not_dead_fish).
all_consistent(user_review_forum_flex_feel) :- consistent(s55, user_review_forum_flex_feel).
evidence(all_consistent(user_review_forum_flex_feel)).
query(true_val(user_review_forum_flex_feel, smooth_snappy_not_dead_fish)).
query(true_val(user_review_forum_flex_feel, unk_user_review_forum_flex_feel)).

% @attr user_review_forum_slow_speed
% @type categorical
% @canonical false
% @original_name user_review_forum (slow speed)
% @values good_slow_speed_forgiving=Does_well_slower_speed_more_forgiving_than_Gremlin unk_user_review_forum_slow_speed=Unknown
% @importance 0.75

0.34::true_val(user_review_forum_slow_speed, good_slow_speed_forgiving); 0.66::true_val(user_review_forum_slow_speed, unk_user_review_forum_slow_speed).
0.72::acc(s56, user_review_forum_slow_speed).
measured(s56, user_review_forum_slow_speed, good_slow_speed_forgiving).
all_consistent(user_review_forum_slow_speed) :- consistent(s56, user_review_forum_slow_speed).
evidence(all_consistent(user_review_forum_slow_speed)).
query(true_val(user_review_forum_slow_speed, good_slow_speed_forgiving)).
query(true_val(user_review_forum_slow_speed, unk_user_review_forum_slow_speed)).

% @attr user_review_forum_ride_style
% @type categorical
% @canonical false
% @original_name user_review_forum (ride over stuff)
% @values goes_over_not_through=Goes_over_stuff_rather_than_blasting_through unk_user_review_forum_ride_style=Unknown
% @importance 0.75

0.34::true_val(user_review_forum_ride_style, goes_over_not_through); 0.66::true_val(user_review_forum_ride_style, unk_user_review_forum_ride_style).
0.72::acc(s57, user_review_forum_ride_style).
measured(s57, user_review_forum_ride_style, goes_over_not_through).
all_consistent(user_review_forum_ride_style) :- consistent(s57, user_review_forum_ride_style).
evidence(all_consistent(user_review_forum_ride_style)).
query(true_val(user_review_forum_ride_style, goes_over_not_through)).
query(true_val(user_review_forum_ride_style, unk_user_review_forum_ride_style)).

% @attr user_review_forum_comfort
% @type categorical
% @canonical false
% @original_name user_review_forum (comfort/dampness)
% @values smooth_damp_easy_on_body=Smooth_damp_in_chop_easy_on_49yr_old_back_knees unk_user_review_forum_comfort=Unknown
% @importance 0.6

0.28::true_val(user_review_forum_comfort, smooth_damp_easy_on_body); 0.72::true_val(user_review_forum_comfort, unk_user_review_forum_comfort).
0.68::acc(s58, user_review_forum_comfort).
measured(s58, user_review_forum_comfort, smooth_damp_easy_on_body).
all_consistent(user_review_forum_comfort) :- consistent(s58, user_review_forum_comfort).
evidence(all_consistent(user_review_forum_comfort)).
query(true_val(user_review_forum_comfort, smooth_damp_easy_on_body)).
query(true_val(user_review_forum_comfort, unk_user_review_forum_comfort)).

% @attr user_review_forum_speed_limit
% @type categorical
% @canonical false
% @original_name user_review_forum (speed limit)
% @values has_speed_limit=Has_speed_limit_vs_more_aggressive_boards unk_user_review_forum_speed_limit=Unknown
% @importance 0.75

0.34::true_val(user_review_forum_speed_limit, has_speed_limit); 0.66::true_val(user_review_forum_speed_limit, unk_user_review_forum_speed_limit).
0.72::acc(s57, user_review_forum_speed_limit).
measured(s57, user_review_forum_speed_limit, has_speed_limit).
all_consistent(user_review_forum_speed_limit) :- consistent(s57, user_review_forum_speed_limit).
evidence(all_consistent(user_review_forum_speed_limit)).
query(true_val(user_review_forum_speed_limit, has_speed_limit)).
query(true_val(user_review_forum_speed_limit, unk_user_review_forum_speed_limit)).

% @attr user_review_forum_carving
% @type categorical
% @canonical false
% @original_name user_review_forum (carving)
% @values not_first_choice_doesnt_suck=Not_first_choice_for_carve_days_but_doesnt_suck unk_user_review_forum_carving=Unknown
% @importance 0.7

0.32::true_val(user_review_forum_carving, not_first_choice_doesnt_suck); 0.68::true_val(user_review_forum_carving, unk_user_review_forum_carving).
0.70::acc(s59, user_review_forum_carving).
measured(s59, user_review_forum_carving, not_first_choice_doesnt_suck).
all_consistent(user_review_forum_carving) :- consistent(s59, user_review_forum_carving).
evidence(all_consistent(user_review_forum_carving)).
query(true_val(user_review_forum_carving, not_first_choice_doesnt_suck)).
query(true_val(user_review_forum_carving, unk_user_review_forum_carving)).

% @attr user_review_forum_powder_float
% @type categorical
% @canonical false
% @original_name user_review_forum (powder float)
% @values floats_super_well_deep_low_angle=Floats_super_well_deep_low_angle_better_than_Grem unk_user_review_forum_powder_float=Unknown
% @importance 0.8

0.34::true_val(user_review_forum_powder_float, floats_super_well_deep_low_angle); 0.66::true_val(user_review_forum_powder_float, unk_user_review_forum_powder_float).
0.72::acc(s60, user_review_forum_powder_float).
measured(s60, user_review_forum_powder_float, floats_super_well_deep_low_angle).
all_consistent(user_review_forum_powder_float) :- consistent(s60, user_review_forum_powder_float).
evidence(all_consistent(user_review_forum_powder_float)).
query(true_val(user_review_forum_powder_float, floats_super_well_deep_low_angle)).
query(true_val(user_review_forum_powder_float, unk_user_review_forum_powder_float)).

% @attr user_review_forum_surfy_feel
% @type categorical
% @canonical false
% @original_name user_review_forum (surfy feel)
% @values surfier_off_tail_than_gremlin=Surfier_feel_off_tail_than_Gremlin unk_user_review_forum_surfy_feel=Unknown
% @importance 0.65

0.34::true_val(user_review_forum_surfy_feel, surfier_off_tail_than_gremlin); 0.66::true_val(user_review_forum_surfy_feel, unk_user_review_forum_surfy_feel).
0.72::acc(s61, user_review_forum_surfy_feel).
measured(s61, user_review_forum_surfy_feel, surfier_off_tail_than_gremlin).
all_consistent(user_review_forum_surfy_feel) :- consistent(s61, user_review_forum_surfy_feel).
evidence(all_consistent(user_review_forum_surfy_feel)).
query(true_val(user_review_forum_surfy_feel, surfier_off_tail_than_gremlin)).
query(true_val(user_review_forum_surfy_feel, unk_user_review_forum_surfy_feel)).

% @attr user_review_forum_sizing
% @type categorical
% @canonical false
% @original_name user_review_forum (sizing)
% @values large_rider_160_rec_155_sportier=6ft4_220lbs_uses_160_recommends_155_sportier unk_user_review_forum_sizing=Unknown
% @importance 0.7

0.32::true_val(user_review_forum_sizing, large_rider_160_rec_155_sportier); 0.68::true_val(user_review_forum_sizing, unk_user_review_forum_sizing).
0.70::acc(s62, user_review_forum_sizing).
measured(s62, user_review_forum_sizing, large_rider_160_rec_155_sportier).
all_consistent(user_review_forum_sizing) :- consistent(s62, user_review_forum_sizing).
evidence(all_consistent(user_review_forum_sizing)).
query(true_val(user_review_forum_sizing, large_rider_160_rec_155_sportier)).
query(true_val(user_review_forum_sizing, unk_user_review_forum_sizing)).

% @attr user_review_forum_use_case
% @type categorical
% @canonical false
% @original_name user_review_forum (use case)
% @values resort_pow_day_chewed_up=Excellent_resort_pow_day_board_when_chewed_up unk_user_review_forum_use_case=Unknown
% @importance 0.7

0.34::true_val(user_review_forum_use_case, resort_pow_day_chewed_up); 0.66::true_val(user_review_forum_use_case, unk_user_review_forum_use_case).
0.72::acc(s63, user_review_forum_use_case).
measured(s63, user_review_forum_use_case, resort_pow_day_chewed_up).
all_consistent(user_review_forum_use_case) :- consistent(s63, user_review_forum_use_case).
evidence(all_consistent(user_review_forum_use_case)).
query(true_val(user_review_forum_use_case, resort_pow_day_chewed_up)).
query(true_val(user_review_forum_use_case, unk_user_review_forum_use_case)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values gnu_gremlin=Gnu_Gremlin_similar_specs_stiffer_better_carve_worse_powder unk_comparable_board_cross_brand=Unknown
% @importance 0.775

0.55::true_val(comparable_board_cross_brand, gnu_gremlin); 0.45::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).
0.78::acc(s54, comparable_board_cross_brand).
0.82::acc(s64, comparable_board_cross_brand).
measured(s54, comparable_board_cross_brand, gnu_gremlin).
measured(s64, comparable_board_cross_brand, gnu_gremlin).
all_consistent(comparable_board_cross_brand) :-
    consistent(s54, comparable_board_cross_brand),
    consistent(s64, comparable_board_cross_brand).
evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, gnu_gremlin)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_hovercraft
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Hovercraft)
% @values jones_hovercraft_2=Jones_Hovercraft_2_more_setback_rockered_nose unk_comparable_board_hovercraft=Unknown
% @importance 0.85

0.77::true_val(comparable_board_hovercraft, jones_hovercraft_2); 0.23::true_val(comparable_board_hovercraft, unk_comparable_board_hovercraft).
0.85::acc(s65, comparable_board_hovercraft).
measured(s65, comparable_board_hovercraft, jones_hovercraft_2).
all_consistent(comparable_board_hovercraft) :- consistent(s65, comparable_board_hovercraft).
evidence(all_consistent(comparable_board_hovercraft)).
query(true_val(comparable_board_hovercraft, jones_hovercraft_2)).
query(true_val(comparable_board_hovercraft, unk_comparable_board_hovercraft)).

% @attr comparable_board_transition_finder
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Transition Finder)
% @values korua_transition_finder=Korua_Transition_Finder unk_comparable_board_transition_finder=Unknown
% @importance 0.85

0.77::true_val(comparable_board_transition_finder, korua_transition_finder); 0.23::true_val(comparable_board_transition_finder, unk_comparable_board_transition_finder).
0.85::acc(s65, comparable_board_transition_finder).
measured(s65, comparable_board_transition_finder, korua_transition_finder).
all_consistent(comparable_board_transition_finder) :- consistent(s65, comparable_board_transition_finder).
evidence(all_consistent(comparable_board_transition_finder)).
query(true_val(comparable_board_transition_finder, korua_transition_finder)).
query(true_val(comparable_board_transition_finder, unk_comparable_board_transition_finder)).

% @attr comparable_board_mind_expander
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Mind Expander)
% @values jones_mind_expander=Jones_Mind_Expander unk_comparable_board_mind_expander=Unknown
% @importance 0.85

0.77::true_val(comparable_board_mind_expander, jones_mind_expander); 0.23::true_val(comparable_board_mind_expander, unk_comparable_board_mind_expander).
0.85::acc(s65, comparable_board_mind_expander).
measured(s65, comparable_board_mind_expander, jones_mind_expander).
all_consistent(comparable_board_mind_expander) :- consistent(s65, comparable_board_mind_expander).
evidence(all_consistent(comparable_board_mind_expander)).
query(true_val(comparable_board_mind_expander, jones_mind_expander)).
query(true_val(comparable_board_mind_expander, unk_comparable_board_mind_expander)).

% @attr comparable_board_powgoda
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Powgoda)
% @values cardiff_powgoda=Cardiff_Powgoda_surfier_tree_board_carves_well unk_comparable_board_powgoda=Unknown
% @importance 0.65

0.30::true_val(comparable_board_powgoda, cardiff_powgoda); 0.70::true_val(comparable_board_powgoda, unk_comparable_board_powgoda).
0.70::acc(s66, comparable_board_powgoda).
measured(s66, comparable_board_powgoda, cardiff_powgoda).
all_consistent(comparable_board_powgoda) :- consistent(s66, comparable_board_powgoda).
evidence(all_consistent(comparable_board_powgoda)).
query(true_val(comparable_board_powgoda, cardiff_powgoda)).
query(true_val(comparable_board_powgoda, unk_comparable_board_powgoda)).

% @attr comparable_board_stale_fish
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Stale Fish)
% @values rome_stale_fish=Rome_Stale_Fish unk_comparable_board_stale_fish=Unknown
% @importance 0.85

0.77::true_val(comparable_board_stale_fish, rome_stale_fish); 0.23::true_val(comparable_board_stale_fish, unk_comparable_board_stale_fish).
0.85::acc(s65, comparable_board_stale_fish).
measured(s65, comparable_board_stale_fish, rome_stale_fish).
all_consistent(comparable_board_stale_fish) :- consistent(s65, comparable_board_stale_fish).
evidence(all_consistent(comparable_board_stale_fish)).
query(true_val(comparable_board_stale_fish, rome_stale_fish)).
query(true_val(comparable_board_stale_fish, unk_comparable_board_stale_fish)).

% @attr comparable_board_pyl_uninc
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (PYL Uninc)
% @values yes_pyl_uninc=Yes_PYL_Uninc unk_comparable_board_pyl_uninc=Unknown
% @importance 0.85

0.77::true_val(comparable_board_pyl_uninc, yes_pyl_uninc); 0.23::true_val(comparable_board_pyl_uninc, unk_comparable_board_pyl_uninc).
0.85::acc(s65, comparable_board_pyl_uninc).
measured(s65, comparable_board_pyl_uninc, yes_pyl_uninc).
all_consistent(comparable_board_pyl_uninc) :- consistent(s65, comparable_board_pyl_uninc).
evidence(all_consistent(comparable_board_pyl_uninc)).
query(true_val(comparable_board_pyl_uninc, yes_pyl_uninc)).
query(true_val(comparable_board_pyl_uninc, unk_comparable_board_pyl_uninc)).

% @attr comparable_board_mantaray
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Mantaray)
% @values gentemstick_mantaray=Gentemstick_Mantaray unk_comparable_board_mantaray=Unknown
% @importance 0.85

0.77::true_val(comparable_board_mantaray, gentemstick_mantaray); 0.23::true_val(comparable_board_mantaray, unk_comparable_board_mantaray).
0.85::acc(s65, comparable_board_mantaray).
measured(s65, comparable_board_mantaray, gentemstick_mantaray).
all_consistent(comparable_board_mantaray) :- consistent(s65, comparable_board_mantaray).
evidence(all_consistent(comparable_board_mantaray)).
query(true_val(comparable_board_mantaray, gentemstick_mantaray)).
query(true_val(comparable_board_mantaray, unk_comparable_board_mantaray)).

% @attr comparable_board_flex_comparison
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (flex comparison)
% @values gremlin_6_10_feels_5_5_dinghy_7=Gremlin_6_10_feels_5_5_Dinghy_7_10 unk_comparable_board_flex_comparison=Unknown
% @importance 0.6

0.48::true_val(comparable_board_flex_comparison, gremlin_6_10_feels_5_5_dinghy_7); 0.52::true_val(comparable_board_flex_comparison, unk_comparable_board_flex_comparison).
0.65::acc(s67, comparable_board_flex_comparison).
measured(s67, comparable_board_flex_comparison, gremlin_6_10_feels_5_5_dinghy_7).
all_consistent(comparable_board_flex_comparison) :- consistent(s67, comparable_board_flex_comparison).
evidence(all_consistent(comparable_board_flex_comparison)).
query(true_val(comparable_board_flex_comparison, gremlin_6_10_feels_5_5_dinghy_7)).
query(true_val(comparable_board_flex_comparison, unk_comparable_board_flex_comparison)).

% @attr comparable_board_price_range
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (price range)
% @unit USD
% @values v407_to_479=407_to_479_at_US_retailers_on_sale unk_comparable_board_price_range=Unknown
% @importance 0.7

0.56::true_val(comparable_board_price_range, v407_to_479); 0.44::true_val(comparable_board_price_range, unk_comparable_board_price_range).
0.75::acc(s68, comparable_board_price_range).
measured(s68, comparable_board_price_range, v407_to_479).
all_consistent(comparable_board_price_range) :- consistent(s68, comparable_board_price_range).
evidence(all_consistent(comparable_board_price_range)).
query(true_val(comparable_board_price_range, v407_to_479)).
query(true_val(comparable_board_price_range, unk_comparable_board_price_range)).

% @attr key_decision_boot_size
% @type categorical
% @canonical false
% @original_name key decision factor — boot size
% @values larger_boots_us10_under_hard=Designed_larger_boots_US10_under_hard_turning unk_key_decision_boot_size=Unknown
% @importance 0.925

0.85::true_val(key_decision_boot_size, larger_boots_us10_under_hard); 0.15::true_val(key_decision_boot_size, unk_key_decision_boot_size).
0.87::acc(s20, key_decision_boot_size).
0.88::acc(s47, key_decision_boot_size).
measured(s20, key_decision_boot_size, larger_boots_us10_under_hard).
measured(s47, key_decision_boot_size, larger_boots_us10_under_hard).
all_consistent(key_decision_boot_size) :-
    consistent(s20, key_decision_boot_size),
    consistent(s47, key_decision_boot_size).
evidence(all_consistent(key_decision_boot_size)).
query(true_val(key_decision_boot_size, larger_boots_us10_under_hard)).
query(true_val(key_decision_boot_size, unk_key_decision_boot_size)).

% @attr key_decision_centered_ride
% @type categorical
% @canonical false
% @original_name key decision factor — centered vs setback ride
% @values rides_centered_prefer_centered_pow=Rides_more_centered_than_peers_prefer_if_like_centered unk_key_decision_centered_ride=Unknown
% @importance 0.85

0.77::true_val(key_decision_centered_ride, rides_centered_prefer_centered_pow); 0.23::true_val(key_decision_centered_ride, unk_key_decision_centered_ride).
0.85::acc(s48, key_decision_centered_ride).
measured(s48, key_decision_centered_ride, rides_centered_prefer_centered_pow).
all_consistent(key_decision_centered_ride) :- consistent(s48, key_decision_centered_ride).
evidence(all_consistent(key_decision_centered_ride)).
query(true_val(key_decision_centered_ride, rides_centered_prefer_centered_pow)).
query(true_val(key_decision_centered_ride, unk_key_decision_centered_ride)).

% @attr key_decision_sustainability
% @type categorical
% @canonical false
% @original_name key decision factor — sustainability
% @values strong_credentials_decisive=Strong_sustainability_across_all_components_decisive_eco unk_key_decision_sustainability=Unknown
% @importance 1.0

0.90::true_val(key_decision_sustainability, strong_credentials_decisive); 0.10::true_val(key_decision_sustainability, unk_key_decision_sustainability).
0.90::acc(s5, key_decision_sustainability).
measured(s5, key_decision_sustainability, strong_credentials_decisive).
all_consistent(key_decision_sustainability) :- consistent(s5, key_decision_sustainability).
evidence(all_consistent(key_decision_sustainability)).
query(true_val(key_decision_sustainability, strong_credentials_decisive)).
query(true_val(key_decision_sustainability, unk_key_decision_sustainability)).

% @attr key_decision_versatility
% @type categorical
% @canonical false
% @original_name key decision factor — versatility
% @values quiver_pow_groomers_not_park=Excels_quiver_pow_groomers_not_one_board_for_park unk_key_decision_versatility=Unknown
% @importance 0.85

0.63::true_val(key_decision_versatility, quiver_pow_groomers_not_park); 0.37::true_val(key_decision_versatility, unk_key_decision_versatility).
0.78::acc(s52, key_decision_versatility).
measured(s52, key_decision_versatility, quiver_pow_groomers_not_park).
all_consistent(key_decision_versatility) :- consistent(s52, key_decision_versatility).
evidence(all_consistent(key_decision_versatility)).
query(true_val(key_decision_versatility, quiver_pow_groomers_not_park)).
query(true_val(key_decision_versatility, unk_key_decision_versatility)).

% @attr key_decision_volume_shifted
% @type categorical
% @canonical false
% @original_name key decision factor — volume shifted sizing
% @values ride_shorter_wider=Designed_to_ride_shorter_and_wider_than_typical unk_key_decision_volume_shifted=Unknown
% @importance 0.75

0.72::true_val(key_decision_volume_shifted, ride_shorter_wider); 0.28::true_val(key_decision_volume_shifted, unk_key_decision_volume_shifted).
0.80::acc(s17, key_decision_volume_shifted).
measured(s17, key_decision_volume_shifted, ride_shorter_wider).
all_consistent(key_decision_volume_shifted) :-
    (indep(s17), consistent(s17, key_decision_volume_shifted) ; \+indep(s17)).
evidence(all_consistent(key_decision_volume_shifted)).
query(true_val(key_decision_volume_shifted, ride_shorter_wider)).
query(true_val(key_decision_volume_shifted, unk_key_decision_volume_shifted)).

% @attr pro_rider_name
% @type categorical
% @canonical false
% @original_name pro_rider_name
% @values bryan_fox_austin_smith=Bryan_Fox_and_Austin_Smith_Quiver_lineup unk_pro_rider_name=Unknown
% @importance 0.75

0.72::true_val(pro_rider_name, bryan_fox_austin_smith); 0.28::true_val(pro_rider_name, unk_pro_rider_name).
0.80::acc(s17, pro_rider_name).
measured(s17, pro_rider_name, bryan_fox_austin_smith).
all_consistent(pro_rider_name) :-
    (indep(s17), consistent(s17, pro_rider_name) ; \+indep(s17)).
evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, bryan_fox_austin_smith)).
query(true_val(pro_rider_name, unk_pro_rider_name)).