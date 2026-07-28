0.20::indep(s3).
0.15::indep(s4).
0.10::indep(s23).
0.30::indep(s14).
0.25::indep(s15).
0.20::indep(s16).
0.25::indep(s17).
0.20::indep(s19).
0.25::indep(s20).
0.30::indep(s24).
0.35::indep(s25).
0.40::indep(s29).
0.15::indep(s31).
0.15::indep(s34).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

0.95::acc(s1, brand).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values nitro=Nitro unk_brand=Unknown
% @importance 1.0

0.91::true_val(brand, nitro); 0.09::true_val(brand, unk_brand).

measured(s1, brand, nitro).

all_consistent(brand) :- consistent(s1, brand).

evidence(all_consistent(brand)).
query(true_val(brand, nitro)).
query(true_val(brand, unk_brand)).

0.95::acc(s1, model_name).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values nomad=Nomad unk_model_name=Unknown
% @importance 1.0

0.91::true_val(model_name, nomad); 0.09::true_val(model_name, unk_model_name).

measured(s1, model_name, nomad).

all_consistent(model_name) :- consistent(s1, model_name).

evidence(all_consistent(model_name)).
query(true_val(model_name, nomad)).
query(true_val(model_name, unk_model_name)).

0.95::acc(s1, model_year).
0.93::acc(s2, model_year).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2025=2025 unk_model_year=Unknown
% @importance 0.9

0.95::true_val(model_year, y2025); 0.05::true_val(model_year, unk_model_year).

measured(s1, model_year, y2025).
measured(s2, model_year, y2025).

all_consistent(model_year) :- consistent(s1, model_year), consistent(s2, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2025)).
query(true_val(model_year, unk_model_year)).

0.95::acc(s1, product_type).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values splitboard=Splitboard unk_product_type=Unknown
% @importance 1.0

0.91::true_val(product_type, splitboard); 0.09::true_val(product_type, unk_product_type).

measured(s1, product_type, splitboard).

all_consistent(product_type) :- consistent(s1, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, splitboard)).
query(true_val(product_type, unk_product_type)).

0.95::acc(s1, board_category).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values splitboard_cat=Splitboard unk_board_category=Unknown
% @importance 1.0

0.91::true_val(board_category, splitboard_cat); 0.09::true_val(board_category, unk_board_category).

measured(s1, board_category, splitboard_cat).

all_consistent(board_category) :- consistent(s1, board_category).

evidence(all_consistent(board_category)).
query(true_val(board_category, splitboard_cat)).
query(true_val(board_category, unk_board_category)).

0.85::acc(s3, riding_style).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values powder_all_mountain=Powder_All_Mountain unk_riding_style=Unknown
% @importance 0.9

0.80::true_val(riding_style, powder_all_mountain); 0.20::true_val(riding_style, unk_riding_style).

measured(s3, riding_style, powder_all_mountain).

all_consistent(riding_style) :-
    (indep(s3), consistent(s3, riding_style) ; \+indep(s3)).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, powder_all_mountain)).
query(true_val(riding_style, unk_riding_style)).

0.70::acc(s4, gender).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values men=Men unk_gender=Unknown
% @importance 0.6

0.60::true_val(gender, men); 0.40::true_val(gender, unk_gender).

measured(s4, gender, men).

all_consistent(gender) :-
    (indep(s4), consistent(s4, gender) ; \+indep(s4)).

evidence(all_consistent(gender)).
query(true_val(gender, men)).
query(true_val(gender, unk_gender)).

0.95::acc(s5, manufacturer).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values nitro_ag_hunenberg=Nitro_AG_Hunenberg_Switzerland unk_manufacturer=Unknown
% @importance 0.7

0.93::true_val(manufacturer, nitro_ag_hunenberg); 0.07::true_val(manufacturer, unk_manufacturer).

measured(s5, manufacturer, nitro_ag_hunenberg).

all_consistent(manufacturer) :- consistent(s5, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, nitro_ag_hunenberg)).
query(true_val(manufacturer, unk_manufacturer)).

0.95::acc(s5, eu_representative).

% @attr eu_representative
% @type categorical
% @canonical false
% @original_name EU representative
% @values nitro_dist_italia=Nitro_Distribution_Italia_Arco unk_eu_representative=Unknown
% @importance 0.7

0.93::true_val(eu_representative, nitro_dist_italia); 0.07::true_val(eu_representative, unk_eu_representative).

measured(s5, eu_representative, nitro_dist_italia).

all_consistent(eu_representative) :- consistent(s5, eu_representative).

evidence(all_consistent(eu_representative)).
query(true_val(eu_representative, nitro_dist_italia)).
query(true_val(eu_representative, unk_eu_representative)).

0.93::acc(s6, manufacturer_founding_year).
0.85::acc(s8, manufacturer_founding_year).
0.72::acc(s7, manufacturer_founding_year).

% @attr manufacturer_founding_year
% @type categorical
% @canonical false
% @original_name Manufacturer founding year
% @values y1990=1990 y1989=1989
% @importance 0.37

0.65::true_val(manufacturer_founding_year, y1990); 0.35::true_val(manufacturer_founding_year, y1989).

measured(s6, manufacturer_founding_year, y1990).
measured(s8, manufacturer_founding_year, y1990).
measured(s7, manufacturer_founding_year, y1989).

all_consistent(manufacturer_founding_year) :-
    consistent(s6, manufacturer_founding_year),
    consistent(s8, manufacturer_founding_year),
    consistent(s7, manufacturer_founding_year).

evidence(all_consistent(manufacturer_founding_year)).
query(true_val(manufacturer_founding_year, y1990)).
query(true_val(manufacturer_founding_year, y1989)).

0.88::acc(s8, founders).

% @attr founders
% @type categorical
% @canonical false
% @original_name Founders
% @values delago_ardelt=Tommy_Delago_and_Sepp_Ardelt unk_founders=Unknown
% @importance 0.4

0.83::true_val(founders, delago_ardelt); 0.17::true_val(founders, unk_founders).

measured(s8, founders, delago_ardelt).

all_consistent(founders) :- consistent(s8, founders).

evidence(all_consistent(founders)).
query(true_val(founders, delago_ardelt)).
query(true_val(founders, unk_founders)).

0.88::acc(s8, brand_headquarters).

% @attr brand_headquarters
% @type categorical
% @canonical false
% @original_name Brand headquarters
% @values seattle_wa=Seattle_Washington unk_brand_headquarters=Unknown
% @importance 0.4

0.83::true_val(brand_headquarters, seattle_wa); 0.17::true_val(brand_headquarters, unk_brand_headquarters).

measured(s8, brand_headquarters, seattle_wa).

all_consistent(brand_headquarters) :- consistent(s8, brand_headquarters).

evidence(all_consistent(brand_headquarters)).
query(true_val(brand_headquarters, seattle_wa)).
query(true_val(brand_headquarters, unk_brand_headquarters)).

0.78::acc(s9, technical_rd_development_location).

% @attr technical_rd_development_location
% @type categorical
% @canonical false
% @original_name Technical R&D development location
% @values oberammergau_germany=Oberammergau_Germany unk_technical_rd_development_location=Unknown
% @importance 0.35

0.72::true_val(technical_rd_development_location, oberammergau_germany); 0.28::true_val(technical_rd_development_location, unk_technical_rd_development_location).

measured(s9, technical_rd_development_location, oberammergau_germany).

all_consistent(technical_rd_development_location) :- consistent(s9, technical_rd_development_location).

evidence(all_consistent(technical_rd_development_location)).
query(true_val(technical_rd_development_location, oberammergau_germany)).
query(true_val(technical_rd_development_location, unk_technical_rd_development_location)).

0.78::acc(s9, graphics_design_office).

% @attr graphics_design_office
% @type categorical
% @canonical false
% @original_name Graphics design office
% @values salt_lake_city_ut=Salt_Lake_City_Utah unk_graphics_design_office=Unknown
% @importance 0.35

0.72::true_val(graphics_design_office, salt_lake_city_ut); 0.28::true_val(graphics_design_office, unk_graphics_design_office).

measured(s9, graphics_design_office, salt_lake_city_ut).

all_consistent(graphics_design_office) :- consistent(s9, graphics_design_office).

evidence(all_consistent(graphics_design_office)).
query(true_val(graphics_design_office, salt_lake_city_ut)).
query(true_val(graphics_design_office, unk_graphics_design_office)).

0.80::acc(s10, brand_ownership).

% @attr brand_ownership
% @type categorical
% @canonical false
% @original_name Brand ownership
% @values rider_owned=Rider_owned_and_operated unk_brand_ownership=Unknown
% @importance 0.5

0.72::true_val(brand_ownership, rider_owned); 0.28::true_val(brand_ownership, unk_brand_ownership).

measured(s10, brand_ownership, rider_owned).

all_consistent(brand_ownership) :- consistent(s10, brand_ownership).

evidence(all_consistent(brand_ownership)).
query(true_val(brand_ownership, rider_owned)).
query(true_val(brand_ownership, unk_brand_ownership)).

0.80::acc(s10, brand_focus).

% @attr brand_focus
% @type categorical
% @canonical false
% @original_name Brand focus
% @values exclusively_snowboard=Exclusively_snowboard_market unk_brand_focus=Unknown
% @importance 0.5

0.72::true_val(brand_focus, exclusively_snowboard); 0.28::true_val(brand_focus, unk_brand_focus).

measured(s10, brand_focus, exclusively_snowboard).

all_consistent(brand_focus) :- consistent(s10, brand_focus).

evidence(all_consistent(brand_focus)).
query(true_val(brand_focus, exclusively_snowboard)).
query(true_val(brand_focus, unk_brand_focus)).

0.78::acc(s9, satellite_offices).

% @attr satellite_offices
% @type categorical
% @canonical false
% @original_name Satellite offices
% @values ch_de_it_no_ca_us=Switzerland_Germany_Italy_Norway_Canada_USA unk_satellite_offices=Unknown
% @importance 0.35

0.72::true_val(satellite_offices, ch_de_it_no_ca_us); 0.28::true_val(satellite_offices, unk_satellite_offices).

measured(s9, satellite_offices, ch_de_it_no_ca_us).

all_consistent(satellite_offices) :- consistent(s9, satellite_offices).

evidence(all_consistent(satellite_offices)).
query(true_val(satellite_offices, ch_de_it_no_ca_us)).
query(true_val(satellite_offices, unk_satellite_offices)).

0.68::acc(s11, manufacturing_location_prior).

% @attr manufacturing_location_prior
% @type categorical
% @canonical true
% @original_name manufacturing_location_prior
% @values elan_to_playmaker=Elan_Austria_then_Playmaker_Taiwan unk_manufacturing_location_prior=Unknown
% @importance 0.45

0.58::true_val(manufacturing_location_prior, elan_to_playmaker); 0.42::true_val(manufacturing_location_prior, unk_manufacturing_location_prior).

measured(s11, manufacturing_location_prior, elan_to_playmaker).

all_consistent(manufacturing_location_prior) :- consistent(s11, manufacturing_location_prior).

evidence(all_consistent(manufacturing_location_prior)).
query(true_val(manufacturing_location_prior, elan_to_playmaker)).
query(true_val(manufacturing_location_prior, unk_manufacturing_location_prior)).

0.70::acc(s12, model_first_available_year).
0.72::acc(s13, model_first_available_year).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values y2015=2015 y2018_2019=2018_2019
% @importance 0.65

0.48::true_val(model_first_available_year, y2015); 0.52::true_val(model_first_available_year, y2018_2019).

measured(s12, model_first_available_year, y2015).
measured(s13, model_first_available_year, y2018_2019).

all_consistent(model_first_available_year) :-
    consistent(s12, model_first_available_year),
    consistent(s13, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2015)).
query(true_val(model_first_available_year, y2018_2019)).

0.93::acc(s1, camber_type).
0.85::acc(s3, camber_type).
0.55::acc(s14, camber_type).
0.52::acc(s15, camber_type).
0.50::acc(s16, camber_type).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values cam_out_camber=Cam_Out_Camber flat_out_rocker=Flat_Out_Rocker
% @importance 0.88

0.70::true_val(camber_type, cam_out_camber); 0.30::true_val(camber_type, flat_out_rocker).

measured(s1, camber_type, cam_out_camber).
measured(s3, camber_type, cam_out_camber).
measured(s14, camber_type, flat_out_rocker).
measured(s15, camber_type, flat_out_rocker).
measured(s16, camber_type, flat_out_rocker).

all_consistent(camber_type) :-
    consistent(s1, camber_type),
    (indep(s3), consistent(s3, camber_type) ; \+indep(s3)),
    (indep(s14), consistent(s14, camber_type) ; \+indep(s14)),
    (indep(s15), consistent(s15, camber_type) ; \+indep(s15)),
    (indep(s16), consistent(s16, camber_type) ; \+indep(s16)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, cam_out_camber)).
query(true_val(camber_type, flat_out_rocker)).

0.85::acc(s3, camber_description).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values positive_camber_smooth_transition=Positive_camber_earlier_smoother_transition_zones unk_camber_description=Unknown
% @importance 0.9

0.80::true_val(camber_description, positive_camber_smooth_transition); 0.20::true_val(camber_description, unk_camber_description).

measured(s3, camber_description, positive_camber_smooth_transition).

all_consistent(camber_description) :-
    (indep(s3), consistent(s3, camber_description) ; \+indep(s3)).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, positive_camber_smooth_transition)).
query(true_val(camber_description, unk_camber_description)).

0.85::acc(s3, camber_description_ride_feel).

% @attr camber_description_ride_feel
% @type categorical
% @canonical false
% @original_name camber_description
% @values fun_responsive_forgiving=Fun_responsive_easier_turn_initiation_forgiving unk_camber_description_ride_feel=Unknown
% @importance 0.9

0.80::true_val(camber_description_ride_feel, fun_responsive_forgiving); 0.20::true_val(camber_description_ride_feel, unk_camber_description_ride_feel).

measured(s3, camber_description_ride_feel, fun_responsive_forgiving).

all_consistent(camber_description_ride_feel) :-
    (indep(s3), consistent(s3, camber_description_ride_feel) ; \+indep(s3)).

evidence(all_consistent(camber_description_ride_feel)).
query(true_val(camber_description_ride_feel, fun_responsive_forgiving)).
query(true_val(camber_description_ride_feel, unk_camber_description_ride_feel)).

0.94::acc(s1, shape).
0.85::acc(s3, shape).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values directional_split=Directional_Splitboard unk_shape=Unknown
% @importance 0.95

0.95::true_val(shape, directional_split); 0.05::true_val(shape, unk_shape).

measured(s1, shape, directional_split).
measured(s3, shape, directional_split).

all_consistent(shape) :-
    consistent(s1, shape),
    (indep(s3), consistent(s3, shape) ; \+indep(s3)).

evidence(all_consistent(shape)).
query(true_val(shape, directional_split)).
query(true_val(shape, unk_shape)).

0.94::acc(s1, flex_rating_10).
0.85::acc(s3, flex_rating_10).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v6=6.0
% @importance 0.95

0.95::true_val(flex_rating_10, v6); 0.05::true_val(flex_rating_10, unk_flex_rating_10).

measured(s1, flex_rating_10, v6).
measured(s3, flex_rating_10, v6).

all_consistent(flex_rating_10) :-
    consistent(s1, flex_rating_10),
    (indep(s3), consistent(s3, flex_rating_10) ; \+indep(s3)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v6)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

0.88::acc(s3, flex_feel).
0.75::acc(s14, flex_feel).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values all_terrain=All_Terrain_Flex medium=Medium
% @importance 0.9

0.58::true_val(flex_feel, all_terrain); 0.42::true_val(flex_feel, medium).

measured(s3, flex_feel, all_terrain).
measured(s14, flex_feel, medium).

all_consistent(flex_feel) :-
    (indep(s3), consistent(s3, flex_feel) ; \+indep(s3)),
    (indep(s14), consistent(s14, flex_feel) ; \+indep(s14)).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, all_terrain)).
query(true_val(flex_feel, medium)).

0.88::acc(s3, flex_direction).

% @attr flex_direction
% @type categorical
% @canonical false
% @original_name flex_direction
% @values directional_flex=Directional_Flex_stiffer_tail unk_flex_direction=Unknown
% @importance 0.9

0.80::true_val(flex_direction, directional_flex); 0.20::true_val(flex_direction, unk_flex_direction).

measured(s3, flex_direction, directional_flex).

all_consistent(flex_direction) :-
    (indep(s3), consistent(s3, flex_direction) ; \+indep(s3)).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional_flex)).
query(true_val(flex_direction, unk_flex_direction)).

0.94::acc(s1, width_options).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values mid_wide=Mid_Wide unk_width_options=Unknown
% @importance 1.0

0.91::true_val(width_options, mid_wide); 0.09::true_val(width_options, unk_width_options).

measured(s1, width_options, mid_wide).

all_consistent(width_options) :- consistent(s1, width_options).

evidence(all_consistent(width_options)).
query(true_val(width_options, mid_wide)).
query(true_val(width_options, unk_width_options)).

0.93::acc(s1, sidecut_type).
0.78::acc(s17, sidecut_type).
0.82::acc(s18, sidecut_type).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values radial=Radial_Sidecut dual_degressive=Dual_Degressive_Sidecut
% @importance 0.87

0.55::true_val(sidecut_type, radial); 0.45::true_val(sidecut_type, dual_degressive).

measured(s1, sidecut_type, radial).
measured(s17, sidecut_type, dual_degressive).
measured(s18, sidecut_type, dual_degressive).

all_consistent(sidecut_type) :-
    consistent(s1, sidecut_type),
    (indep(s17), consistent(s17, sidecut_type) ; \+indep(s17)),
    consistent(s18, sidecut_type).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, radial)).
query(true_val(sidecut_type, dual_degressive)).

0.93::acc(sM, available_sizes).
0.82::acc(s19, available_sizes).
0.82::acc(s20, available_sizes).
0.60::acc(s21, available_sizes).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values s156_159_162=156_159_162cm s159_162=159_162cm s156_161_165=156_161_165cm
% @importance 0.89

0.55::true_val(available_sizes, s156_159_162); 0.30::true_val(available_sizes, s159_162); 0.15::true_val(available_sizes, s156_161_165).

measured(sM, available_sizes, s159_162).
measured(s19, available_sizes, s156_159_162).
measured(s20, available_sizes, s156_159_162).
measured(s21, available_sizes, s156_161_165).

all_consistent(available_sizes) :-
    consistent(sM, available_sizes),
    (indep(s19), consistent(s19, available_sizes) ; \+indep(s19)),
    (indep(s20), consistent(s20, available_sizes) ; \+indep(s20)),
    (indep(s21), consistent(s21, available_sizes) ; \+indep(s21)).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, s156_159_162)).
query(true_val(available_sizes, s159_162)).
query(true_val(available_sizes, s156_161_165)).

0.93::acc(sM, contact_length_size_159).

% @attr contact_length_size_159
% @type numeric
% @unit mm
% @canonical false
% @original_name contact_length_size
% @values v1090=1090.0
% @importance 0.85

0.93::true_val(contact_length_size_159, v1090); 0.07::true_val(contact_length_size_159, unk_contact_length_size_159).

measured(sM, contact_length_size_159, v1090).

all_consistent(contact_length_size_159) :- consistent(sM, contact_length_size_159).

evidence(all_consistent(contact_length_size_159)).
query(true_val(contact_length_size_159, v1090)).
query(true_val(contact_length_size_159, unk_contact_length_size_159)).

0.93::acc(sM, waist_width_159).

% @attr waist_width_159
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width (159cm)
% @values v256=256.0
% @importance 0.85

0.93::true_val(waist_width_159, v256); 0.07::true_val(waist_width_159, unk_waist_width_159).

measured(sM, waist_width_159, v256).

all_consistent(waist_width_159) :- consistent(sM, waist_width_159).

evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v256)).
query(true_val(waist_width_159, unk_waist_width_159)).

0.93::acc(sM, tip_tail_width_size).

% @attr tip_tail_width_size
% @type numeric
% @unit mm
% @canonical true
% @original_name tip_tail_width_size
% @values v305=305.0
% @importance 0.85

0.93::true_val(tip_tail_width_size, v305); 0.07::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(sM, tip_tail_width_size, v305).

all_consistent(tip_tail_width_size) :- consistent(sM, tip_tail_width_size).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v305)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

0.93::acc(sM, tail_width_159).

% @attr tail_width_159
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size
% @values v304=304.0
% @importance 0.85

0.93::true_val(tail_width_159, v304); 0.07::true_val(tail_width_159, unk_tail_width_159).

measured(sM, tail_width_159, v304).

all_consistent(tail_width_159) :- consistent(sM, tail_width_159).

evidence(all_consistent(tail_width_159)).
query(true_val(tail_width_159, v304)).
query(true_val(tail_width_159, unk_tail_width_159)).

0.93::acc(sM, sidecut_radius_size_159).

% @attr sidecut_radius_size_159
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values r7_0_4_1_7_0=7.0_4.1_7.0m
% @importance 0.85

0.93::true_val(sidecut_radius_size_159, r7_0_4_1_7_0); 0.07::true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159).

measured(sM, sidecut_radius_size_159, r7_0_4_1_7_0).

all_consistent(sidecut_radius_size_159) :- consistent(sM, sidecut_radius_size_159).

evidence(all_consistent(sidecut_radius_size_159)).
query(true_val(sidecut_radius_size_159, r7_0_4_1_7_0)).
query(true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159)).

0.93::acc(sM, setback).

% @attr setback
% @type numeric
% @unit mm
% @canonical true
% @original_name setback
% @values vm25=neg25.0
% @importance 0.85

0.93::true_val(setback, vm25); 0.07::true_val(setback, unk_setback).

measured(sM, setback, vm25).

all_consistent(setback) :- consistent(sM, setback).

evidence(all_consistent(setback)).
query(true_val(setback, vm25)).
query(true_val(setback, unk_setback)).

0.93::acc(sM, recommended_weight_range_size_159).

% @attr recommended_weight_range_size_159
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values w60_plus=60_plus_kg
% @importance 0.85

0.93::true_val(recommended_weight_range_size_159, w60_plus); 0.07::true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159).

measured(sM, recommended_weight_range_size_159, w60_plus).

all_consistent(recommended_weight_range_size_159) :- consistent(sM, recommended_weight_range_size_159).

evidence(all_consistent(recommended_weight_range_size_159)).
query(true_val(recommended_weight_range_size_159, w60_plus)).
query(true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159)).

0.93::acc(sM, contact_length_size_162).

% @attr contact_length_size_162
% @type numeric
% @unit mm
% @canonical false
% @original_name contact_length_size
% @values v1120=1120.0
% @importance 0.85

0.93::true_val(contact_length_size_162, v1120); 0.07::true_val(contact_length_size_162, unk_contact_length_size_162).

measured(sM, contact_length_size_162, v1120).

all_consistent(contact_length_size_162) :- consistent(sM, contact_length_size_162).

evidence(all_consistent(contact_length_size_162)).
query(true_val(contact_length_size_162, v1120)).
query(true_val(contact_length_size_162, unk_contact_length_size_162)).

0.93::acc(sM, waist_width_162).

% @attr waist_width_162
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width (162cm)
% @values v256=256.0
% @importance 0.85

0.93::true_val(waist_width_162, v256); 0.07::true_val(waist_width_162, unk_waist_width_162).

measured(sM, waist_width_162, v256).

all_consistent(waist_width_162) :- consistent(sM, waist_width_162).

evidence(all_consistent(waist_width_162)).
query(true_val(waist_width_162, v256)).
query(true_val(waist_width_162, unk_waist_width_162)).

0.93::acc(sM, nose_width_162).

% @attr nose_width_162
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size
% @values v307=307.0
% @importance 0.85

0.93::true_val(nose_width_162, v307); 0.07::true_val(nose_width_162, unk_nose_width_162).

measured(sM, nose_width_162, v307).

all_consistent(nose_width_162) :- consistent(sM, nose_width_162).

evidence(all_consistent(nose_width_162)).
query(true_val(nose_width_162, v307)).
query(true_val(nose_width_162, unk_nose_width_162)).

0.93::acc(sM, tail_width_162).

% @attr tail_width_162
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size
% @values v306=306.0
% @importance 0.85

0.93::true_val(tail_width_162, v306); 0.07::true_val(tail_width_162, unk_tail_width_162).

measured(sM, tail_width_162, v306).

all_consistent(tail_width_162) :- consistent(sM, tail_width_162).

evidence(all_consistent(tail_width_162)).
query(true_val(tail_width_162, v306)).
query(true_val(tail_width_162, unk_tail_width_162)).

0.93::acc(sM, sidecut_radius_size_162).

% @attr sidecut_radius_size_162
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values r7_0_4_1_7_0=7.0_4.1_7.0m
% @importance 0.85

0.93::true_val(sidecut_radius_size_162, r7_0_4_1_7_0); 0.07::true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162).

measured(sM, sidecut_radius_size_162, r7_0_4_1_7_0).

all_consistent(sidecut_radius_size_162) :- consistent(sM, sidecut_radius_size_162).

evidence(all_consistent(sidecut_radius_size_162)).
query(true_val(sidecut_radius_size_162, r7_0_4_1_7_0)).
query(true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162)).

0.93::acc(sM, setback_162).

% @attr setback_162
% @type numeric
% @unit mm
% @canonical false
% @original_name setback
% @values vm25=neg25.0
% @importance 0.85

0.93::true_val(setback_162, vm25); 0.07::true_val(setback_162, unk_setback_162).

measured(sM, setback_162, vm25).

all_consistent(setback_162) :- consistent(sM, setback_162).

evidence(all_consistent(setback_162)).
query(true_val(setback_162, vm25)).
query(true_val(setback_162, unk_setback_162)).

0.93::acc(sM, recommended_weight_range_size_162).

% @attr recommended_weight_range_size_162
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values w70_plus=70_plus_kg
% @importance 0.85

0.93::true_val(recommended_weight_range_size_162, w70_plus); 0.07::true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162).

measured(sM, recommended_weight_range_size_162, w70_plus).

all_consistent(recommended_weight_range_size_162) :- consistent(sM, recommended_weight_range_size_162).

evidence(all_consistent(recommended_weight_range_size_162)).
query(true_val(recommended_weight_range_size_162, w70_plus)).
query(true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162)).

0.72::acc(s22, waist_width_156).
0.60::acc(s23, waist_width_156).

% @attr waist_width_156
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width (156cm)
% @values v252=252.0
% @importance 0.78

0.95::true_val(waist_width_156, v252); 0.05::true_val(waist_width_156, unk_waist_width_156).

measured(s22, waist_width_156, v252).
measured(s23, waist_width_156, v252).

all_consistent(waist_width_156) :-
    (indep(s4), consistent(s22, waist_width_156) ; \+indep(s4)),
    (indep(s23), consistent(s23, waist_width_156) ; \+indep(s23)).

evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v252)).
query(true_val(waist_width_156, unk_waist_width_156)).

0.75::acc(s21, contact_length_size).

% @attr contact_length_size
% @type numeric
% @unit mm
% @canonical true
% @original_name contact_length_size
% @values v1040=1040.0
% @importance 0.95

0.72::true_val(contact_length_size, v1040); 0.28::true_val(contact_length_size, unk_contact_length_size).

measured(s21, contact_length_size, v1040).

all_consistent(contact_length_size) :-
    (indep(s14), consistent(s21, contact_length_size) ; \+indep(s14)).

evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v1040)).
query(true_val(contact_length_size, unk_contact_length_size)).

0.78::acc(s24, recommended_weight_range_size).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size
% @values w50_plus=50_plus_kg
% @importance 0.85

0.70::true_val(recommended_weight_range_size, w50_plus); 0.30::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s24, recommended_weight_range_size, w50_plus).

all_consistent(recommended_weight_range_size) :-
    (indep(s24), consistent(s24, recommended_weight_range_size) ; \+indep(s24)).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w50_plus)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

0.75::acc(s21, contact_length_size_161).

% @attr contact_length_size_161
% @type numeric
% @unit mm
% @canonical false
% @original_name contact_length_size
% @values v1090=1090.0
% @importance 0.95

0.72::true_val(contact_length_size_161, v1090); 0.28::true_val(contact_length_size_161, unk_contact_length_size_161).

measured(s21, contact_length_size_161, v1090).

all_consistent(contact_length_size_161) :-
    (indep(s14), consistent(s21, contact_length_size_161) ; \+indep(s14)).

evidence(all_consistent(contact_length_size_161)).
query(true_val(contact_length_size_161, v1090)).
query(true_val(contact_length_size_161, unk_contact_length_size_161)).

0.75::acc(s21, effective_edge_165).

% @attr effective_edge_165
% @type numeric
% @unit mm
% @canonical true
% @original_name effective_edge_165
% @values v1130=1130.0
% @importance 0.95

0.72::true_val(effective_edge_165, v1130); 0.28::true_val(effective_edge_165, unk_effective_edge_165).

measured(s21, effective_edge_165, v1130).

all_consistent(effective_edge_165) :-
    (indep(s14), consistent(s21, effective_edge_165) ; \+indep(s14)).

evidence(all_consistent(effective_edge_165)).
query(true_val(effective_edge_165, v1130)).
query(true_val(effective_edge_165, unk_effective_edge_165)).

0.75::acc(s21, waist_width_161).

% @attr waist_width_161
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width (161cm)
% @values v258=258.0
% @importance 0.95

0.72::true_val(waist_width_161, v258); 0.28::true_val(waist_width_161, unk_waist_width_161).

measured(s21, waist_width_161, v258).

all_consistent(waist_width_161) :-
    (indep(s14), consistent(s21, waist_width_161) ; \+indep(s14)).

evidence(all_consistent(waist_width_161)).
query(true_val(waist_width_161, v258)).
query(true_val(waist_width_161, unk_waist_width_161)).

0.75::acc(s21, waist_width_165).

% @attr waist_width_165
% @type numeric
% @unit mm
% @canonical true
% @original_name waist_width_165
% @values v260=260.0
% @importance 0.95

0.72::true_val(waist_width_165, v260); 0.28::true_val(waist_width_165, unk_waist_width_165).

measured(s21, waist_width_165, v260).

all_consistent(waist_width_165) :-
    (indep(s14), consistent(s21, waist_width_165) ; \+indep(s14)).

evidence(all_consistent(waist_width_165)).
query(true_val(waist_width_165, v260)).
query(true_val(waist_width_165, unk_waist_width_165)).

0.75::acc(s21, sidecut_radius_size).

% @attr sidecut_radius_size
% @type categorical
% @unit m
% @canonical true
% @original_name sidecut_radius_size
% @values r9_7_9=9_7_9m
% @importance 0.95

0.72::true_val(sidecut_radius_size, r9_7_9); 0.28::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s21, sidecut_radius_size, r9_7_9).

all_consistent(sidecut_radius_size) :-
    (indep(s14), consistent(s21, sidecut_radius_size) ; \+indep(s14)).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, r9_7_9)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

0.75::acc(s21, sidecut_radius_size_161).

% @attr sidecut_radius_size_161
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values r9_7_9=9_7_9m
% @importance 0.95

0.72::true_val(sidecut_radius_size_161, r9_7_9); 0.28::true_val(sidecut_radius_size_161, unk_sidecut_radius_size_161).

measured(s21, sidecut_radius_size_161, r9_7_9).

all_consistent(sidecut_radius_size_161) :-
    (indep(s14), consistent(s21, sidecut_radius_size_161) ; \+indep(s14)).

evidence(all_consistent(sidecut_radius_size_161)).
query(true_val(sidecut_radius_size_161, r9_7_9)).
query(true_val(sidecut_radius_size_161, unk_sidecut_radius_size_161)).

0.75::acc(s21, sidecut_radius_165).

% @attr sidecut_radius_165
% @type categorical
% @unit m
% @canonical true
% @original_name sidecut_radius_165
% @values r10_8_10=10_8_10m
% @importance 0.95

0.72::true_val(sidecut_radius_165, r10_8_10); 0.28::true_val(sidecut_radius_165, unk_sidecut_radius_165).

measured(s21, sidecut_radius_165, r10_8_10).

all_consistent(sidecut_radius_165) :-
    (indep(s14), consistent(s21, sidecut_radius_165) ; \+indep(s14)).

evidence(all_consistent(sidecut_radius_165)).
query(true_val(sidecut_radius_165, r10_8_10)).
query(true_val(sidecut_radius_165, unk_sidecut_radius_165)).

0.75::acc(s21, sidecut_radius_note).

% @attr sidecut_radius_note
% @type categorical
% @canonical false
% @original_name sidecut_radius_size
% @values different_model_year_geometry=Different_model_year_geometry_discrepancy unk_sidecut_radius_note=Unknown
% @importance 0.95

0.72::true_val(sidecut_radius_note, different_model_year_geometry); 0.28::true_val(sidecut_radius_note, unk_sidecut_radius_note).

measured(s21, sidecut_radius_note, different_model_year_geometry).

all_consistent(sidecut_radius_note) :-
    (indep(s14), consistent(s21, sidecut_radius_note) ; \+indep(s14)).

evidence(all_consistent(sidecut_radius_note)).
query(true_val(sidecut_radius_note, different_model_year_geometry)).
query(true_val(sidecut_radius_note, unk_sidecut_radius_note)).

0.82::acc(s25, board_weight_grams).
0.78::acc(s26, board_weight_grams).

% @attr board_weight_grams
% @type numeric
% @unit grams
% @canonical true
% @original_name board_weight_grams
% @values v3300=3300.0
% @importance 0.85

0.95::true_val(board_weight_grams, v3300); 0.05::true_val(board_weight_grams, unk_board_weight_grams).

measured(s25, board_weight_grams, v3300).
measured(s26, board_weight_grams, v3300).

all_consistent(board_weight_grams) :-
    (indep(s25), consistent(s25, board_weight_grams) ; \+indep(s25)),
    consistent(s26, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v3300)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

0.94::acc(s1, core_material).
0.85::acc(s3, core_material).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values powercore_poplar=PowerCore_tip_to_tail_Poplar unk_core_material=Unknown
% @importance 0.95

0.95::true_val(core_material, powercore_poplar); 0.05::true_val(core_material, unk_core_material).

measured(s1, core_material, powercore_poplar).
measured(s3, core_material, powercore_poplar).

all_consistent(core_material) :-
    consistent(s1, core_material),
    (indep(s3), consistent(s3, core_material) ; \+indep(s3)).

evidence(all_consistent(core_material)).
query(true_val(core_material, powercore_poplar)).
query(true_val(core_material, unk_core_material)).

0.75::acc(s27, core_material_blend_ratio).

% @attr core_material_blend_ratio
% @type categorical
% @canonical false
% @original_name core_material_blend_ratio
% @values single_species_100pct=100pct_woodcore_single_species unk_core_material_blend_ratio=Unknown
% @importance 0.8

0.62::true_val(core_material_blend_ratio, single_species_100pct); 0.38::true_val(core_material_blend_ratio, unk_core_material_blend_ratio).

measured(s27, core_material_blend_ratio, single_species_100pct).

all_consistent(core_material_blend_ratio) :- consistent(s27, core_material_blend_ratio).

evidence(all_consistent(core_material_blend_ratio)).
query(true_val(core_material_blend_ratio, single_species_100pct)).
query(true_val(core_material_blend_ratio, unk_core_material_blend_ratio)).

0.94::acc(s1, core_profile_technology).

% @attr core_profile_technology
% @type categorical
% @canonical false
% @original_name Core profile technology
% @values splitgrip=Splitgrip_Core_Profile unk_core_profile_technology=Unknown
% @importance 1.0

0.91::true_val(core_profile_technology, splitgrip); 0.09::true_val(core_profile_technology, unk_core_profile_technology).

measured(s1, core_profile_technology, splitgrip).

all_consistent(core_profile_technology) :- consistent(s1, core_profile_technology).

evidence(all_consistent(core_profile_technology)).
query(true_val(core_profile_technology, splitgrip)).
query(true_val(core_profile_technology, unk_core_profile_technology)).

0.94::acc(s1, laminate).
0.85::acc(s3, laminate).

% @attr laminate
% @type categorical
% @canonical false
% @original_name laminate
% @values bi_lite=Bi_Lite_Laminates_two_direction unk_laminate=Unknown
% @importance 0.95

0.95::true_val(laminate, bi_lite); 0.05::true_val(laminate, unk_laminate).

measured(s1, laminate, bi_lite).
measured(s3, laminate, bi_lite).

all_consistent(laminate) :-
    consistent(s1, laminate),
    (indep(s3), consistent(s3, laminate) ; \+indep(s3)).

evidence(all_consistent(laminate)).
query(true_val(laminate, bi_lite)).
query(true_val(laminate, unk_laminate)).

0.94::acc(s1, base_type).
0.85::acc(s3, base_type).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values premium_extruded_fh=Premium_Extruded_FH_Base unk_base_type=Unknown
% @importance 0.95

0.95::true_val(base_type, premium_extruded_fh); 0.05::true_val(base_type, unk_base_type).

measured(s1, base_type, premium_extruded_fh).
measured(s3, base_type, premium_extruded_fh).

all_consistent(base_type) :-
    consistent(s1, base_type),
    (indep(s3), consistent(s3, base_type) ; \+indep(s3)).

evidence(all_consistent(base_type)).
query(true_val(base_type, premium_extruded_fh)).
query(true_val(base_type, unk_base_type)).

0.82::acc(s28, base_material).

% @attr base_material
% @type categorical
% @canonical false
% @original_name base_material
% @values low_maint_ultra_clear=Low_maintenance_ultra_clear unk_base_material=Unknown
% @importance 0.75

0.75::true_val(base_material, low_maint_ultra_clear); 0.25::true_val(base_material, unk_base_material).

measured(s28, base_material, low_maint_ultra_clear).

all_consistent(base_material) :-
    (indep(s15), consistent(s28, base_material) ; \+indep(s15)).

evidence(all_consistent(base_material)).
query(true_val(base_material, low_maint_ultra_clear)).
query(true_val(base_material, unk_base_material)).

0.80::acc(s29, edge_technology).

% @attr edge_technology
% @type categorical
% @canonical false
% @original_name edge_technology
% @values standard_steel=Standard_Steel_Edges unk_edge_technology=Unknown
% @importance 0.7

0.72::true_val(edge_technology, standard_steel); 0.28::true_val(edge_technology, unk_edge_technology).

measured(s29, edge_technology, standard_steel).

all_consistent(edge_technology) :-
    (indep(s29), consistent(s29, edge_technology) ; \+indep(s29)).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, standard_steel)).
query(true_val(edge_technology, unk_edge_technology)).

0.90::acc(s30, sustainability_certification_recycled_edges).
0.94::acc(s1, sustainability_certification_recycled_edges).

% @attr sustainability_certification_recycled_edges
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values pct50_recycled_steel=50pct_recycled_steel_edges unk_sustainability_certification_recycled_edges=Unknown
% @importance 0.7

0.95::true_val(sustainability_certification_recycled_edges, pct50_recycled_steel); 0.05::true_val(sustainability_certification_recycled_edges, unk_sustainability_certification_recycled_edges).

measured(s30, sustainability_certification_recycled_edges, pct50_recycled_steel).
measured(s1, sustainability_certification_recycled_edges, pct50_recycled_steel).

all_consistent(sustainability_certification_recycled_edges) :-
    consistent(s30, sustainability_certification_recycled_edges),
    consistent(s1, sustainability_certification_recycled_edges).

evidence(all_consistent(sustainability_certification_recycled_edges)).
query(true_val(sustainability_certification_recycled_edges, pct50_recycled_steel)).
query(true_val(sustainability_certification_recycled_edges, unk_sustainability_certification_recycled_edges)).

0.94::acc(s1, mounting_pattern).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values voile_compatible=Voile_Compatible unk_mounting_pattern=Unknown
% @importance 1.0

0.91::true_val(mounting_pattern, voile_compatible); 0.09::true_val(mounting_pattern, unk_mounting_pattern).

measured(s1, mounting_pattern, voile_compatible).

all_consistent(mounting_pattern) :- consistent(s1, mounting_pattern).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, voile_compatible)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

0.94::acc(s1, construction_material_innovation).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values t7075_aluminium_hooks=T7075_Forged_Aluminium_Hooks unk_construction_material_innovation=Unknown
% @importance 1.0

0.91::true_val(construction_material_innovation, t7075_aluminium_hooks); 0.09::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s1, construction_material_innovation, t7075_aluminium_hooks).

all_consistent(construction_material_innovation) :- consistent(s1, construction_material_innovation).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, t7075_aluminium_hooks)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

0.72::acc(s31, construction_material_innovation_hooks_detail).

% @attr construction_material_innovation_hooks_detail
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values raised_hole_free=Raised_design_base_hole_free unk_construction_material_innovation_hooks_detail=Unknown
% @importance 0.7

0.62::true_val(construction_material_innovation_hooks_detail, raised_hole_free); 0.38::true_val(construction_material_innovation_hooks_detail, unk_construction_material_innovation_hooks_detail).

measured(s31, construction_material_innovation_hooks_detail, raised_hole_free).

all_consistent(construction_material_innovation_hooks_detail) :-
    (indep(s31), consistent(s31, construction_material_innovation_hooks_detail) ; \+indep(s31)).

evidence(all_consistent(construction_material_innovation_hooks_detail)).
query(true_val(construction_material_innovation_hooks_detail, raised_hole_free)).
query(true_val(construction_material_innovation_hooks_detail, unk_construction_material_innovation_hooks_detail)).

0.94::acc(s1, construction_material_innovation_locks).

% @attr construction_material_innovation_locks
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values tip_n_tail_locks=Tip_N_Tail_Locks unk_construction_material_innovation_locks=Unknown
% @importance 1.0

0.91::true_val(construction_material_innovation_locks, tip_n_tail_locks); 0.09::true_val(construction_material_innovation_locks, unk_construction_material_innovation_locks).

measured(s1, construction_material_innovation_locks, tip_n_tail_locks).

all_consistent(construction_material_innovation_locks) :- consistent(s1, construction_material_innovation_locks).

evidence(all_consistent(construction_material_innovation_locks)).
query(true_val(construction_material_innovation_locks, tip_n_tail_locks)).
query(true_val(construction_material_innovation_locks, unk_construction_material_innovation_locks)).

0.94::acc(s1, construction_material_innovation_kohla).

% @attr construction_material_innovation_kohla
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values nitro_kohla_system=Nitro_x_Kohla_Attachment_System unk_construction_material_innovation_kohla=Unknown
% @importance 1.0

0.91::true_val(construction_material_innovation_kohla, nitro_kohla_system); 0.09::true_val(construction_material_innovation_kohla, unk_construction_material_innovation_kohla).

measured(s1, construction_material_innovation_kohla, nitro_kohla_system).

all_consistent(construction_material_innovation_kohla) :- consistent(s1, construction_material_innovation_kohla).

evidence(all_consistent(construction_material_innovation_kohla)).
query(true_val(construction_material_innovation_kohla, nitro_kohla_system)).
query(true_val(construction_material_innovation_kohla, unk_construction_material_innovation_kohla)).

0.94::acc(s1, sustainability_certification_wax).
0.85::acc(s3, sustainability_certification_wax).

% @attr sustainability_certification_wax
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values natural_speed_wax=100pct_Natural_Speed_Wax_Kandahars unk_sustainability_certification_wax=Unknown
% @importance 0.95

0.95::true_val(sustainability_certification_wax, natural_speed_wax); 0.05::true_val(sustainability_certification_wax, unk_sustainability_certification_wax).

measured(s1, sustainability_certification_wax, natural_speed_wax).
measured(s3, sustainability_certification_wax, natural_speed_wax).

all_consistent(sustainability_certification_wax) :-
    consistent(s1, sustainability_certification_wax),
    (indep(s3), consistent(s3, sustainability_certification_wax) ; \+indep(s3)).

evidence(all_consistent(sustainability_certification_wax)).
query(true_val(sustainability_certification_wax, natural_speed_wax)).
query(true_val(sustainability_certification_wax, unk_sustainability_certification_wax)).

0.94::acc(s1, topsheet).

% @attr topsheet
% @type categorical
% @canonical false
% @original_name topsheet
% @values water_based_inks=Water_based_inks unk_topsheet=Unknown
% @importance 1.0

0.91::true_val(topsheet, water_based_inks); 0.09::true_val(topsheet, unk_topsheet).

measured(s1, topsheet, water_based_inks).

all_consistent(topsheet) :- consistent(s1, topsheet).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, water_based_inks)).
query(true_val(topsheet, unk_topsheet)).

0.94::acc(s1, sustainability_certification).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values yes_carbon_neutral=Yes_Carbon_Neutral unk_sustainability_certification=Unknown
% @importance 1.0

0.91::true_val(sustainability_certification, yes_carbon_neutral); 0.09::true_val(sustainability_certification, unk_sustainability_certification).

measured(s1, sustainability_certification, yes_carbon_neutral).

all_consistent(sustainability_certification) :- consistent(s1, sustainability_certification).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, yes_carbon_neutral)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

0.94::acc(s1, sustainability_certification_fsc).
0.70::acc(s32, sustainability_certification_fsc).

% @attr sustainability_certification_fsc
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values fsc_certified=FSC_Certified_wood unk_sustainability_certification_fsc=Unknown
% @importance 0.68

0.95::true_val(sustainability_certification_fsc, fsc_certified); 0.05::true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc).

measured(s1, sustainability_certification_fsc, fsc_certified).
measured(s32, sustainability_certification_fsc, fsc_certified).

all_consistent(sustainability_certification_fsc) :-
    consistent(s1, sustainability_certification_fsc),
    (indep(s4), consistent(s32, sustainability_certification_fsc) ; \+indep(s4)).

evidence(all_consistent(sustainability_certification_fsc)).
query(true_val(sustainability_certification_fsc, fsc_certified)).
query(true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc)).

0.94::acc(s1, sustainability_certification_inks).

% @attr sustainability_certification_inks
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values water_based_inks_cert=Water_based_inks unk_sustainability_certification_inks=Unknown
% @importance 1.0

0.91::true_val(sustainability_certification_inks, water_based_inks_cert); 0.09::true_val(sustainability_certification_inks, unk_sustainability_certification_inks).

measured(s1, sustainability_certification_inks, water_based_inks_cert).

all_consistent(sustainability_certification_inks) :- consistent(s1, sustainability_certification_inks).

evidence(all_consistent(sustainability_certification_inks)).
query(true_val(sustainability_certification_inks, water_based_inks_cert)).
query(true_val(sustainability_certification_inks, unk_sustainability_certification_inks)).

0.94::acc(s1, sustainability_certification_recycled_materials).

% @attr sustainability_certification_recycled_materials
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values yes_recycled=Yes_Recycled_Raw_Materials unk_sustainability_certification_recycled_materials=Unknown
% @importance 1.0

0.91::true_val(sustainability_certification_recycled_materials, yes_recycled); 0.09::true_val(sustainability_certification_recycled_materials, unk_sustainability_certification_recycled_materials).

measured(s1, sustainability_certification_recycled_materials, yes_recycled).

all_consistent(sustainability_certification_recycled_materials) :- consistent(s1, sustainability_certification_recycled_materials).

evidence(all_consistent(sustainability_certification_recycled_materials)).
query(true_val(sustainability_certification_recycled_materials, yes_recycled)).
query(true_val(sustainability_certification_recycled_materials, unk_sustainability_certification_recycled_materials)).

0.94::acc(s1, sustainability_certification_solar).

% @attr sustainability_certification_solar
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values solar_100pct=Made_with_100pct_Solar_Power unk_sustainability_certification_solar=Unknown
% @importance 1.0

0.91::true_val(sustainability_certification_solar, solar_100pct); 0.09::true_val(sustainability_certification_solar, unk_sustainability_certification_solar).

measured(s1, sustainability_certification_solar, solar_100pct).

all_consistent(sustainability_certification_solar) :- consistent(s1, sustainability_certification_solar).

evidence(all_consistent(sustainability_certification_solar)).
query(true_val(sustainability_certification_solar, solar_100pct)).
query(true_val(sustainability_certification_solar, unk_sustainability_certification_solar)).

0.88::acc(s33, sustainability_certification_climate_partner).

% @attr sustainability_certification_climate_partner
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values climate_partner=ClimatePartner unk_sustainability_certification_climate_partner=Unknown
% @importance 0.3

0.80::true_val(sustainability_certification_climate_partner, climate_partner); 0.20::true_val(sustainability_certification_climate_partner, unk_sustainability_certification_climate_partner).

measured(s33, sustainability_certification_climate_partner, climate_partner).

all_consistent(sustainability_certification_climate_partner) :- consistent(s33, sustainability_certification_climate_partner).

evidence(all_consistent(sustainability_certification_climate_partner)).
query(true_val(sustainability_certification_climate_partner, climate_partner)).
query(true_val(sustainability_certification_climate_partner, unk_sustainability_certification_climate_partner)).

0.93::acc(sM, price_aud_merchant_rrp).

% @attr price_aud_merchant_rrp
% @type numeric
% @unit AUD
% @canonical false
% @original_name price_aud_merchant
% @values v1199_99=1199.99
% @importance 0.85

0.95::true_val(price_aud_merchant_rrp, v1199_99); 0.05::true_val(price_aud_merchant_rrp, unk_price_aud_merchant_rrp).

measured(sM, price_aud_merchant_rrp, v1199_99).

all_consistent(price_aud_merchant_rrp) :- consistent(sM, price_aud_merchant_rrp).

evidence(all_consistent(price_aud_merchant_rrp)).
query(true_val(price_aud_merchant_rrp, v1199_99)).
query(true_val(price_aud_merchant_rrp, unk_price_aud_merchant_rrp)).

0.95::acc(sM, price_aud_merchant).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v839_99=839.99
% @importance 0.85

0.95::true_val(price_aud_merchant, v839_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(sM, price_aud_merchant, v839_99).

all_consistent(price_aud_merchant) :- consistent(sM, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v839_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

0.93::acc(sM, availability_status).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values sold_out=Sold_out unk_availability_status=Unknown
% @importance 0.85

0.93::true_val(availability_status, sold_out); 0.07::true_val(availability_status, unk_availability_status).

measured(sM, availability_status, sold_out).

all_consistent(availability_status) :- consistent(sM, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, sold_out)).
query(true_val(availability_status, unk_availability_status)).

0.93::acc(sM, sku_159).

% @attr sku_159
% @type categorical
% @canonical false
% @original_name SKU 159cm
% @values sku_833011_001=833011_001_159cm unk_sku_159=Unknown
% @importance 0.85

0.93::true_val(sku_159, sku_833011_001); 0.07::true_val(sku_159, unk_sku_159).

measured(sM, sku_159, sku_833011_001).

all_consistent(sku_159) :- consistent(sM, sku_159).

evidence(all_consistent(sku_159)).
query(true_val(sku_159, sku_833011_001)).
query(true_val(sku_159, unk_sku_159)).

0.88::acc(s20, price_usd_milosport).

% @attr price_usd_milosport
% @type numeric
% @unit USD
% @canonical false
% @original_name Price USD (Milosport)
% @values v579_95=579.95
% @importance 0.9

0.82::true_val(price_usd_milosport, v579_95); 0.18::true_val(price_usd_milosport, unk_price_usd_milosport).

measured(s20, price_usd_milosport, v579_95).

all_consistent(price_usd_milosport) :-
    (indep(s20), consistent(s20, price_usd_milosport) ; \+indep(s20)).

evidence(all_consistent(price_usd_milosport)).
query(true_val(price_usd_milosport, v579_95)).
query(true_val(price_usd_milosport, unk_price_usd_milosport)).

0.78::acc(s34, price_usd_backcountry).

% @attr price_usd_backcountry
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_backcountry
% @values v579_95=579.95
% @importance 0.9

0.72::true_val(price_usd_backcountry, v579_95); 0.28::true_val(price_usd_backcountry, unk_price_usd_backcountry).

measured(s34, price_usd_backcountry, v579_95).

all_consistent(price_usd_backcountry) :-
    (indep(s34), consistent(s34, price_usd_backcountry) ; \+indep(s34)).

evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v579_95)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

0.78::acc(s35, price_eur_splitboards_eu).

% @attr price_eur_splitboards_eu
% @type numeric
% @unit EUR
% @canonical false
% @original_name Price EUR (Splitboards Europe)
% @values v651_16=651.16
% @importance 0.85

0.68::true_val(price_eur_splitboards_eu, v651_16); 0.32::true_val(price_eur_splitboards_eu, unk_price_eur_splitboards_eu).

measured(s35, price_eur_splitboards_eu, v651_16).

all_consistent(price_eur_splitboards_eu) :-
    (indep(s29), consistent(s35, price_eur_splitboards_eu) ; \+indep(s29)).

evidence(all_consistent(price_eur_splitboards_eu)).
query(true_val(price_eur_splitboards_eu, v651_16)).
query(true_val(price_eur_splitboards_eu, unk_price_eur_splitboards_eu)).

0.72::acc(s13, price_eur_ski_rando).

% @attr price_eur_ski_rando
% @type numeric
% @unit EUR
% @canonical false
% @original_name Price EUR (Ski Rando Mag, older version)
% @values v489=489.0
% @importance 0.7

0.62::true_val(price_eur_ski_rando, v489); 0.38::true_val(price_eur_ski_rando, unk_price_eur_ski_rando).

measured(s13, price_eur_ski_rando, v489).

all_consistent(price_eur_ski_rando) :- consistent(s13, price_eur_ski_rando).

evidence(all_consistent(price_eur_ski_rando)).
query(true_val(price_eur_ski_rando, v489)).
query(true_val(price_eur_ski_rando, unk_price_eur_ski_rando)).

0.78::acc(s36, compatible_climbing_skins).

% @attr compatible_climbing_skins
% @type categorical
% @canonical false
% @original_name Compatible climbing skins
% @values kohla_peak_64_35=Nitro_x_Kohla_Peak_Skins_64pct_Mohair_35pct_Nylon unk_compatible_climbing_skins=Unknown
% @importance 0.6

0.70::true_val(compatible_climbing_skins, kohla_peak_64_35); 0.30::true_val(compatible_climbing_skins, unk_compatible_climbing_skins).

measured(s36, compatible_climbing_skins, kohla_peak_64_35).

all_consistent(compatible_climbing_skins) :-
    (indep(s31), consistent(s36, compatible_climbing_skins) ; \+indep(s31)).

evidence(all_consistent(compatible_climbing_skins)).
query(true_val(compatible_climbing_skins, kohla_peak_64_35)).
query(true_val(compatible_climbing_skins, unk_compatible_climbing_skins)).

0.80::acc(s21, availability_status_backcountry).

% @attr availability_status_backcountry
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_backcountry=Available_Backcountry_com unk_availability_status_backcountry=Unknown
% @importance 0.95

0.72::true_val(availability_status_backcountry, available_backcountry); 0.28::true_val(availability_status_backcountry, unk_availability_status_backcountry).

measured(s21, availability_status_backcountry, available_backcountry).

all_consistent(availability_status_backcountry) :-
    (indep(s14), consistent(s21, availability_status_backcountry) ; \+indep(s14)).

evidence(all_consistent(availability_status_backcountry)).
query(true_val(availability_status_backcountry, available_backcountry)).
query(true_val(availability_status_backcountry, unk_availability_status_backcountry)).

0.82::acc(s20, availability_status_milosport).

% @attr availability_status_milosport
% @type categorical
% @canonical false
% @original_name availability_status
% @values sold_out_milosport=Sold_out_Milosport unk_availability_status_milosport=Unknown
% @importance 0.9

0.75::true_val(availability_status_milosport, sold_out_milosport); 0.25::true_val(availability_status_milosport, unk_availability_status_milosport).

measured(s20, availability_status_milosport, sold_out_milosport).

all_consistent(availability_status_milosport) :-
    (indep(s20), consistent(s20, availability_status_milosport) ; \+indep(s20)).

evidence(all_consistent(availability_status_milosport)).
query(true_val(availability_status_milosport, sold_out_milosport)).
query(true_val(availability_status_milosport, unk_availability_status_milosport)).

0.80::acc(s15, availability_status_evo).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_evo=Available_evo unk_availability_status_evo=Unknown
% @importance 0.85

0.70::true_val(availability_status_evo, available_evo); 0.30::true_val(availability_status_evo, unk_availability_status_evo).

measured(s15, availability_status_evo, available_evo).

all_consistent(availability_status_evo) :-
    (indep(s15), consistent(s15, availability_status_evo) ; \+indep(s15)).

evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, available_evo)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

0.72::acc(s36, availability_status_amazon).

% @attr availability_status_amazon
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_amazon=Available_Amazon unk_availability_status_amazon=Unknown
% @importance 0.6

0.62::true_val(availability_status_amazon, available_amazon); 0.38::true_val(availability_status_amazon, unk_availability_status_amazon).

measured(s36, availability_status_amazon, available_amazon).

all_consistent(availability_status_amazon) :-
    (indep(s31), consistent(s36, availability_status_amazon) ; \+indep(s31)).

evidence(all_consistent(availability_status_amazon)).
query(true_val(availability_status_amazon, available_amazon)).
query(true_val(availability_status_amazon, unk_availability_status_amazon)).

0.80::acc(s19, availability_status_directive).

% @attr availability_status_directive
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_directive=Available_Directive_Board_Shop unk_availability_status_directive=Unknown
% @importance 0.85

0.72::true_val(availability_status_directive, available_directive); 0.28::true_val(availability_status_directive, unk_availability_status_directive).

measured(s19, availability_status_directive, available_directive).

all_consistent(availability_status_directive) :-
    (indep(s19), consistent(s19, availability_status_directive) ; \+indep(s19)).

evidence(all_consistent(availability_status_directive)).
query(true_val(availability_status_directive, available_directive)).
query(true_val(availability_status_directive, unk_availability_status_directive)).

0.85::acc(s3, availability_status_melbourne).

% @attr availability_status_melbourne
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_melbourne=Available_Melbourne_Snowboard_Centre unk_availability_status_melbourne=Unknown
% @importance 0.9

0.80::true_val(availability_status_melbourne, available_melbourne); 0.20::true_val(availability_status_melbourne, unk_availability_status_melbourne).

measured(s3, availability_status_melbourne, available_melbourne).

all_consistent(availability_status_melbourne) :-
    (indep(s3), consistent(s3, availability_status_melbourne) ; \+indep(s3)).

evidence(all_consistent(availability_status_melbourne)).
query(true_val(availability_status_melbourne, available_melbourne)).
query(true_val(availability_status_melbourne, unk_availability_status_melbourne)).

0.75::acc(s16, availability_status_cripple_creek).

% @attr availability_status_cripple_creek
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_cripple_creek=Available_Cripple_Creek_BC unk_availability_status_cripple_creek=Unknown
% @importance 0.7

0.65::true_val(availability_status_cripple_creek, available_cripple_creek); 0.35::true_val(availability_status_cripple_creek, unk_availability_status_cripple_creek).

measured(s16, availability_status_cripple_creek, available_cripple_creek).

all_consistent(availability_status_cripple_creek) :-
    (indep(s16), consistent(s16, availability_status_cripple_creek) ; \+indep(s16)).

evidence(all_consistent(availability_status_cripple_creek)).
query(true_val(availability_status_cripple_creek, available_cripple_creek)).
query(true_val(availability_status_cripple_creek, unk_availability_status_cripple_creek)).

0.78::acc(s25, availability_status_sport_conrad).

% @attr availability_status_sport_conrad
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_sport_conrad=Available_Sport_Conrad unk_availability_status_sport_conrad=Unknown
% @importance 0.85

0.70::true_val(availability_status_sport_conrad, available_sport_conrad); 0.30::true_val(availability_status_sport_conrad, unk_availability_status_sport_conrad).

measured(s25, availability_status_sport_conrad, available_sport_conrad).

all_consistent(availability_status_sport_conrad) :-
    (indep(s25), consistent(s25, availability_status_sport_conrad) ; \+indep(s25)).

evidence(all_consistent(availability_status_sport_conrad)).
query(true_val(availability_status_sport_conrad, available_sport_conrad)).
query(true_val(availability_status_sport_conrad, unk_availability_status_sport_conrad)).

0.75::acc(s17, availability_status_snowcountry).

% @attr availability_status_snowcountry
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_snowcountry=Available_Snowcountry_eu unk_availability_status_snowcountry=Unknown
% @importance 0.8

0.68::true_val(availability_status_snowcountry, available_snowcountry); 0.32::true_val(availability_status_snowcountry, unk_availability_status_snowcountry).

measured(s17, availability_status_snowcountry, available_snowcountry).

all_consistent(availability_status_snowcountry) :-
    (indep(s17), consistent(s17, availability_status_snowcountry) ; \+indep(s17)).

evidence(all_consistent(availability_status_snowcountry)).
query(true_val(availability_status_snowcountry, available_snowcountry)).
query(true_val(availability_status_snowcountry, unk_availability_status_snowcountry)).

0.78::acc(s29, availability_status_splitboards_eu).

% @attr availability_status_splitboards_eu
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_splitboards_eu=Available_Splitboards_Europe unk_availability_status_splitboards_eu=Unknown
% @importance 0.7

0.68::true_val(availability_status_splitboards_eu, available_splitboards_eu); 0.32::true_val(availability_status_splitboards_eu, unk_availability_status_splitboards_eu).

measured(s29, availability_status_splitboards_eu, available_splitboards_eu).

all_consistent(availability_status_splitboards_eu) :-
    (indep(s29), consistent(s29, availability_status_splitboards_eu) ; \+indep(s29)).

evidence(all_consistent(availability_status_splitboards_eu)).
query(true_val(availability_status_splitboards_eu, available_splitboards_eu)).
query(true_val(availability_status_splitboards_eu, unk_availability_status_splitboards_eu)).

0.75::acc(s24, availability_status_speck_sports).

% @attr availability_status_speck_sports
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_speck_sports=Available_Speck_Sports unk_availability_status_speck_sports=Unknown
% @importance 0.85

0.68::true_val(availability_status_speck_sports, available_speck_sports); 0.32::true_val(availability_status_speck_sports, unk_availability_status_speck_sports).

measured(s24, availability_status_speck_sports, available_speck_sports).

all_consistent(availability_status_speck_sports) :-
    (indep(s24), consistent(s24, availability_status_speck_sports) ; \+indep(s24)).

evidence(all_consistent(availability_status_speck_sports)).
query(true_val(availability_status_speck_sports, available_speck_sports)).
query(true_val(availability_status_speck_sports, unk_availability_status_speck_sports)).

0.68::acc(s22, availability_status_vt_snowboarder).

% @attr availability_status_vt_snowboarder
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_vt=Available_VT_Snowboarder unk_availability_status_vt_snowboarder=Unknown
% @importance 0.85

0.58::true_val(availability_status_vt_snowboarder, available_vt); 0.42::true_val(availability_status_vt_snowboarder, unk_availability_status_vt_snowboarder).

measured(s22, availability_status_vt_snowboarder, available_vt).

all_consistent(availability_status_vt_snowboarder) :-
    (indep(s4), consistent(s22, availability_status_vt_snowboarder) ; \+indep(s4)).

evidence(all_consistent(availability_status_vt_snowboarder)).
query(true_val(availability_status_vt_snowboarder, available_vt)).
query(true_val(availability_status_vt_snowboarder, unk_availability_status_vt_snowboarder)).

0.82::acc(s37, availability_status_nitro_usa).

% @attr availability_status_nitro_usa
% @type categorical
% @canonical false
% @original_name availability_status
% @values no_direct_online_sales=No_direct_online_US_sales unk_availability_status_nitro_usa=Unknown
% @importance 0.4

0.72::true_val(availability_status_nitro_usa, no_direct_online_sales); 0.28::true_val(availability_status_nitro_usa, unk_availability_status_nitro_usa).

measured(s37, availability_status_nitro_usa, no_direct_online_sales).

all_consistent(availability_status_nitro_usa) :- consistent(s37, availability_status_nitro_usa).

evidence(all_consistent(availability_status_nitro_usa)).
query(true_val(availability_status_nitro_usa, no_direct_online_sales)).
query(true_val(availability_status_nitro_usa, unk_availability_status_nitro_usa)).

0.95::acc(s38, warranty_period_years).

% @attr warranty_period_years
% @type numeric
% @unit years
% @canonical false
% @original_name warranty_period_years
% @values v2=2.0
% @importance 0.8

0.93::true_val(warranty_period_years, v2); 0.07::true_val(warranty_period_years, unk_warranty_period_years).

measured(s38, warranty_period_years, v2).

all_consistent(warranty_period_years) :- consistent(s38, warranty_period_years).

evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v2)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

0.95::acc(s38, warranty).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values defects_material_workmanship=Defects_in_material_and_workmanship unk_warranty=Unknown
% @importance 0.8

0.93::true_val(warranty, defects_material_workmanship); 0.07::true_val(warranty, unk_warranty).

measured(s38, warranty, defects_material_workmanship).

all_consistent(warranty) :- consistent(s38, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, defects_material_workmanship)).
query(true_val(warranty, unk_warranty)).

0.95::acc(s38, warranty_transferability).

% @attr warranty_transferability
% @type categorical
% @canonical false
% @original_name warranty
% @values not_transferable=Not_transferable_original_purchaser_only unk_warranty_transferability=Unknown
% @importance 0.8

0.93::true_val(warranty_transferability, not_transferable); 0.07::true_val(warranty_transferability, unk_warranty_transferability).

measured(s38, warranty_transferability, not_transferable).

all_consistent(warranty_transferability) :- consistent(s38, warranty_transferability).

evidence(all_consistent(warranty_transferability)).
query(true_val(warranty_transferability, not_transferable)).
query(true_val(warranty_transferability, unk_warranty_transferability)).

0.95::acc(s39, warranty_ebay_exclusion).

% @attr warranty_ebay_exclusion
% @type categorical
% @canonical false
% @original_name warranty
% @values not_valid_ebay_unauthorized=Not_valid_eBay_or_unauthorized_dealers unk_warranty_ebay_exclusion=Unknown
% @importance 0.75

0.93::true_val(warranty_ebay_exclusion, not_valid_ebay_unauthorized); 0.07::true_val(warranty_ebay_exclusion, unk_warranty_ebay_exclusion).

measured(s39, warranty_ebay_exclusion, not_valid_ebay_unauthorized).

all_consistent(warranty_ebay_exclusion) :- consistent(s39, warranty_ebay_exclusion).

evidence(all_consistent(warranty_ebay_exclusion)).
query(true_val(warranty_ebay_exclusion, not_valid_ebay_unauthorized)).
query(true_val(warranty_ebay_exclusion, unk_warranty_ebay_exclusion)).

0.95::acc(s38, warranty_remedy).

% @attr warranty_remedy
% @type categorical
% @canonical false
% @original_name warranty
% @values repair_or_replace=Repair_or_replacement_at_Nitro_discretion unk_warranty_remedy=Unknown
% @importance 0.8

0.93::true_val(warranty_remedy, repair_or_replace); 0.07::true_val(warranty_remedy, unk_warranty_remedy).

measured(s38, warranty_remedy, repair_or_replace).

all_consistent(warranty_remedy) :- consistent(s38, warranty_remedy).

evidence(all_consistent(warranty_remedy)).
query(true_val(warranty_remedy, repair_or_replace)).
query(true_val(warranty_remedy, unk_warranty_remedy)).

0.93::acc(s1, edge_hold).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values hike_pods=Hike_Pods_edge_grip_icy_traverse unk_edge_hold=Unknown
% @importance 1.0

0.91::true_val(edge_hold, hike_pods); 0.09::true_val(edge_hold, unk_edge_hold).

measured(s1, edge_hold, hike_pods).

all_consistent(edge_hold) :- consistent(s1, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, hike_pods)).
query(true_val(edge_hold, unk_edge_hold)).

0.82::acc(s28, edge_hold_powerpods).

% @attr edge_hold_powerpods
% @type categorical
% @canonical false
% @original_name edge_hold
% @values powerpods_extended_width=Extended_board_width_better_edge_control unk_edge_hold_powerpods=Unknown
% @importance 0.75

0.75::true_val(edge_hold_powerpods, powerpods_extended_width); 0.25::true_val(edge_hold_powerpods, unk_edge_hold_powerpods).

measured(s28, edge_hold_powerpods, powerpods_extended_width).

all_consistent(edge_hold_powerpods) :-
    (indep(s15), consistent(s28, edge_hold_powerpods) ; \+indep(s15)).

evidence(all_consistent(edge_hold_powerpods)).
query(true_val(edge_hold_powerpods, powerpods_extended_width)).
query(true_val(edge_hold_powerpods, unk_edge_hold_powerpods)).

0.68::acc(s22, binding_compatibility).
0.82::acc(s40, binding_compatibility).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values splitboard_specific_only=Requires_splitboard_specific_bindings unk_binding_compatibility=Unknown
% @importance 0.85

0.95::true_val(binding_compatibility, splitboard_specific_only); 0.05::true_val(binding_compatibility, unk_binding_compatibility).

measured(s22, binding_compatibility, splitboard_specific_only).
measured(s40, binding_compatibility, splitboard_specific_only).

all_consistent(binding_compatibility) :-
    (indep(s4), consistent(s22, binding_compatibility) ; \+indep(s4)),
    (indep(s15), consistent(s40, binding_compatibility) ; \+indep(s15)).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, splitboard_specific_only)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

0.78::acc(s14, rider_level).
0.72::acc(s27, rider_level).

% @attr rider_level
% @type categorical
% @canonical false
% @original_name rider_level
% @values entry_to_intermediate=Entry_level_to_intermediate unk_rider_level=Unknown
% @importance 0.85

0.95::true_val(rider_level, entry_to_intermediate); 0.05::true_val(rider_level, unk_rider_level).

measured(s14, rider_level, entry_to_intermediate).
measured(s27, rider_level, entry_to_intermediate).

all_consistent(rider_level) :-
    (indep(s14), consistent(s14, rider_level) ; \+indep(s14)),
    consistent(s27, rider_level).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, entry_to_intermediate)).
query(true_val(rider_level, unk_rider_level)).

0.80::acc(s41, skill_level_recommendation).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values intermediate_advanced=Intermediate_Advanced unk_skill_level_recommendation=Unknown
% @importance 0.75

0.70::true_val(skill_level_recommendation, intermediate_advanced); 0.30::true_val(skill_level_recommendation, unk_skill_level_recommendation).

measured(s41, skill_level_recommendation, intermediate_advanced).

all_consistent(skill_level_recommendation) :-
    (indep(s15), consistent(s41, skill_level_recommendation) ; \+indep(s15)).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, intermediate_advanced)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

0.88::acc(s3, terrain_suitability).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values powder_all_mtn_bc=Powder_All_Mountain_backcountry unk_terrain_suitability=Unknown
% @importance 0.9

0.80::true_val(terrain_suitability, powder_all_mtn_bc); 0.20::true_val(terrain_suitability, unk_terrain_suitability).

measured(s3, terrain_suitability, powder_all_mtn_bc).

all_consistent(terrain_suitability) :-
    (indep(s3), consistent(s3, terrain_suitability) ; \+indep(s3)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, powder_all_mtn_bc)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

0.85::acc(s42, terrain_suitability_powder).

% @attr terrain_suitability_powder
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values deep_powder=Deep_powder_snow unk_terrain_suitability_powder=Unknown
% @importance 0.85

0.75::true_val(terrain_suitability_powder, deep_powder); 0.25::true_val(terrain_suitability_powder, unk_terrain_suitability_powder).

measured(s42, terrain_suitability_powder, deep_powder).

all_consistent(terrain_suitability_powder) :- consistent(s42, terrain_suitability_powder).

evidence(all_consistent(terrain_suitability_powder)).
query(true_val(terrain_suitability_powder, deep_powder)).
query(true_val(terrain_suitability_powder, unk_terrain_suitability_powder)).

0.82::acc(s43, positive_aspect_transitions).

% @attr positive_aspect_transitions
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values easy_edge_to_edge=Easy_edge_to_edge_sweet_flex_smooth_torsion unk_positive_aspect_transitions=Unknown
% @importance 0.9

0.75::true_val(positive_aspect_transitions, easy_edge_to_edge); 0.25::true_val(positive_aspect_transitions, unk_positive_aspect_transitions).

measured(s43, positive_aspect_transitions, easy_edge_to_edge).

all_consistent(positive_aspect_transitions) :- consistent(s43, positive_aspect_transitions).

evidence(all_consistent(positive_aspect_transitions)).
query(true_val(positive_aspect_transitions, easy_edge_to_edge)).
query(true_val(positive_aspect_transitions, unk_positive_aspect_transitions)).

0.82::acc(s43, negative_aspect).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values medium_flex_not_hard_snow=Medium_flex_not_best_on_variable_hard_snow_gnarly_terrain unk_negative_aspect=Unknown
% @importance 0.9

0.75::true_val(negative_aspect, medium_flex_not_hard_snow); 0.25::true_val(negative_aspect, unk_negative_aspect).

measured(s43, negative_aspect, medium_flex_not_hard_snow).

all_consistent(negative_aspect) :- consistent(s43, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, medium_flex_not_hard_snow)).
query(true_val(negative_aspect, unk_negative_aspect)).

0.82::acc(s43, positive_aspect_pressure).

% @attr positive_aspect_pressure
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values better_than_expected=Better_than_expected_with_right_pressure unk_positive_aspect_pressure=Unknown
% @importance 0.9

0.75::true_val(positive_aspect_pressure, better_than_expected); 0.25::true_val(positive_aspect_pressure, unk_positive_aspect_pressure).

measured(s43, positive_aspect_pressure, better_than_expected).

all_consistent(positive_aspect_pressure) :- consistent(s43, positive_aspect_pressure).

evidence(all_consistent(positive_aspect_pressure)).
query(true_val(positive_aspect_pressure, better_than_expected)).
query(true_val(positive_aspect_pressure, unk_positive_aspect_pressure)).

0.82::acc(s43, terrain_suitability_freestyle).

% @attr terrain_suitability_freestyle
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values deep_pow_tricks_switch=Ideal_deep_powder_tricks_riding_switch unk_terrain_suitability_freestyle=Unknown
% @importance 0.9

0.75::true_val(terrain_suitability_freestyle, deep_pow_tricks_switch); 0.25::true_val(terrain_suitability_freestyle, unk_terrain_suitability_freestyle).

measured(s43, terrain_suitability_freestyle, deep_pow_tricks_switch).

all_consistent(terrain_suitability_freestyle) :- consistent(s43, terrain_suitability_freestyle).

evidence(all_consistent(terrain_suitability_freestyle)).
query(true_val(terrain_suitability_freestyle, deep_pow_tricks_switch)).
query(true_val(terrain_suitability_freestyle, unk_terrain_suitability_freestyle)).

0.93::acc(s1, positive_aspect).
0.85::acc(s42, positive_aspect).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values splitgrip_uphill=Splitgrip_Core_better_uphill_performance unk_positive_aspect=Unknown
% @importance 0.93

0.95::true_val(positive_aspect, splitgrip_uphill); 0.05::true_val(positive_aspect, unk_positive_aspect).

measured(s1, positive_aspect, splitgrip_uphill).
measured(s42, positive_aspect, splitgrip_uphill).

all_consistent(positive_aspect) :-
    consistent(s1, positive_aspect),
    consistent(s42, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, splitgrip_uphill)).
query(true_val(positive_aspect, unk_positive_aspect)).

0.82::acc(s25, powder_rating_sport_conrad).

% @attr powder_rating_sport_conrad
% @type numeric
% @unit /10
% @canonical false
% @original_name Powder rating (Sport-Conrad)
% @values v7=7.0
% @importance 0.85

0.72::true_val(powder_rating_sport_conrad, v7); 0.28::true_val(powder_rating_sport_conrad, unk_powder_rating_sport_conrad).

measured(s25, powder_rating_sport_conrad, v7).

all_consistent(powder_rating_sport_conrad) :-
    (indep(s25), consistent(s25, powder_rating_sport_conrad) ; \+indep(s25)).

evidence(all_consistent(powder_rating_sport_conrad)).
query(true_val(powder_rating_sport_conrad, v7)).
query(true_val(powder_rating_sport_conrad, unk_powder_rating_sport_conrad)).

0.82::acc(s25, technical_terrain_rating).

% @attr technical_terrain_rating
% @type numeric
% @unit /10
% @canonical false
% @original_name Technical terrain rating (Sport-Conrad)
% @values v6=6.0
% @importance 0.85

0.72::true_val(technical_terrain_rating, v6); 0.28::true_val(technical_terrain_rating, unk_technical_terrain_rating).

measured(s25, technical_terrain_rating, v6).

all_consistent(technical_terrain_rating) :-
    (indep(s25), consistent(s25, technical_terrain_rating) ; \+indep(s25)).

evidence(all_consistent(technical_terrain_rating)).
query(true_val(technical_terrain_rating, v6)).
query(true_val(technical_terrain_rating, unk_technical_terrain_rating)).

0.82::acc(s25, uphill_performance_rating).

% @attr uphill_performance_rating
% @type numeric
% @unit /10
% @canonical false
% @original_name Uphill performance rating (Sport-Conrad)
% @values v6=6.0
% @importance 0.85

0.72::true_val(uphill_performance_rating, v6); 0.28::true_val(uphill_performance_rating, unk_uphill_performance_rating).

measured(s25, uphill_performance_rating, v6).

all_consistent(uphill_performance_rating) :-
    (indep(s25), consistent(s25, uphill_performance_rating) ; \+indep(s25)).

evidence(all_consistent(uphill_performance_rating)).
query(true_val(uphill_performance_rating, v6)).
query(true_val(uphill_performance_rating, unk_uphill_performance_rating)).

0.93::acc(s1, positioning).
0.72::acc(s27, positioning).

% @attr positioning
% @type categorical
% @canonical false
% @original_name Positioning
% @values most_affordable_entry=Most_affordable_entry_level_splitboard unk_positioning=Unknown
% @importance 0.9

0.95::true_val(positioning, most_affordable_entry); 0.05::true_val(positioning, unk_positioning).

measured(s1, positioning, most_affordable_entry).
measured(s27, positioning, most_affordable_entry).

all_consistent(positioning) :-
    consistent(s1, positioning),
    consistent(s27, positioning).

evidence(all_consistent(positioning)).
query(true_val(positioning, most_affordable_entry)).
query(true_val(positioning, unk_positioning)).

0.70::acc(s31, value_proposition).

% @attr value_proposition
% @type categorical
% @canonical false
% @original_name Value proposition
% @values most_affordable_market=Most_affordable_splitboard_on_market unk_value_proposition=Unknown
% @importance 0.7

0.62::true_val(value_proposition, most_affordable_market); 0.38::true_val(value_proposition, unk_value_proposition).

measured(s31, value_proposition, most_affordable_market).

all_consistent(value_proposition) :-
    (indep(s31), consistent(s31, value_proposition) ; \+indep(s31)).

evidence(all_consistent(value_proposition)).
query(true_val(value_proposition, most_affordable_market)).
query(true_val(value_proposition, unk_value_proposition)).

0.80::acc(s44, switchback_travel_opinion).

% @attr switchback_travel_opinion
% @type categorical
% @canonical false
% @original_name Switchback Travel opinion
% @values dir_twin_common_well_rounded=Directional_twin_most_common_well_rounded unk_switchback_travel_opinion=Unknown
% @importance 0.6

0.70::true_val(switchback_travel_opinion, dir_twin_common_well_rounded); 0.30::true_val(switchback_travel_opinion, unk_switchback_travel_opinion).

measured(s44, switchback_travel_opinion, dir_twin_common_well_rounded).

all_consistent(switchback_travel_opinion) :- consistent(s44, switchback_travel_opinion).

evidence(all_consistent(switchback_travel_opinion)).
query(true_val(switchback_travel_opinion, dir_twin_common_well_rounded)).
query(true_val(switchback_travel_opinion, unk_switchback_travel_opinion)).

0.80::acc(s45, switchback_travel_negative_profile).

% @attr switchback_travel_negative_profile
% @type categorical
% @canonical false
% @original_name Switchback Travel negative
% @values flat_rocker_slower_less_aggressive=Flat_rocker_slower_less_aggressive unk_switchback_travel_negative_profile=Unknown
% @importance 0.9

0.72::true_val(switchback_travel_negative_profile, flat_rocker_slower_less_aggressive); 0.28::true_val(switchback_travel_negative_profile, unk_switchback_travel_negative_profile).

measured(s45, switchback_travel_negative_profile, flat_rocker_slower_less_aggressive).

all_consistent(switchback_travel_negative_profile) :- consistent(s45, switchback_travel_negative_profile).

evidence(all_consistent(switchback_travel_negative_profile)).
query(true_val(switchback_travel_negative_profile, flat_rocker_slower_less_aggressive)).
query(true_val(switchback_travel_negative_profile, unk_switchback_travel_negative_profile)).

0.80::acc(s45, switchback_travel_negative_flex).

% @attr switchback_travel_negative_flex
% @type categorical
% @canonical false
% @original_name Switchback Travel negative
% @values soft_not_capable_steep_speed=Soft_flex_not_capable_steep_terrain_or_speed unk_switchback_travel_negative_flex=Unknown
% @importance 0.9

0.72::true_val(switchback_travel_negative_flex, soft_not_capable_steep_speed); 0.28::true_val(switchback_travel_negative_flex, unk_switchback_travel_negative_flex).

measured(s45, switchback_travel_negative_flex, soft_not_capable_steep_speed).

all_consistent(switchback_travel_negative_flex) :- consistent(s45, switchback_travel_negative_flex).

evidence(all_consistent(switchback_travel_negative_flex)).
query(true_val(switchback_travel_negative_flex, soft_not_capable_steep_speed)).
query(true_val(switchback_travel_negative_flex, unk_switchback_travel_negative_flex)).

0.80::acc(s45, switchback_travel_positive).

% @attr switchback_travel_positive
% @type categorical
% @canonical false
% @original_name Switchback Travel positive
% @values price_right_playful_reliable=Price_right_playful_reliable_backcountry unk_switchback_travel_positive=Unknown
% @importance 0.9

0.72::true_val(switchback_travel_positive, price_right_playful_reliable); 0.28::true_val(switchback_travel_positive, unk_switchback_travel_positive).

measured(s45, switchback_travel_positive, price_right_playful_reliable).

all_consistent(switchback_travel_positive) :- consistent(s45, switchback_travel_positive).

evidence(all_consistent(switchback_travel_positive)).
query(true_val(switchback_travel_positive, price_right_playful_reliable)).
query(true_val(switchback_travel_positive, unk_switchback_travel_positive)).

0.85::acc(s42, mtn_weekly_news_featured).

% @attr mtn_weekly_news_featured
% @type categorical
% @canonical false
% @original_name Mountain Weekly News
% @values featured_price_fun=Featured_best_splitboards_praised_price_fun unk_mtn_weekly_news_featured=Unknown
% @importance 0.85

0.75::true_val(mtn_weekly_news_featured, featured_price_fun); 0.25::true_val(mtn_weekly_news_featured, unk_mtn_weekly_news_featured).

measured(s42, mtn_weekly_news_featured, featured_price_fun).

all_consistent(mtn_weekly_news_featured) :- consistent(s42, mtn_weekly_news_featured).

evidence(all_consistent(mtn_weekly_news_featured)).
query(true_val(mtn_weekly_news_featured, featured_price_fun)).
query(true_val(mtn_weekly_news_featured, unk_mtn_weekly_news_featured)).

0.85::acc(s42, mtn_weekly_news_powder).

% @attr mtn_weekly_news_powder
% @type categorical
% @canonical false
% @original_name Mountain Weekly News
% @values wants_deep_powder=Wants_to_be_ridden_in_deep_powder unk_mtn_weekly_news_powder=Unknown
% @importance 0.85

0.75::true_val(mtn_weekly_news_powder, wants_deep_powder); 0.25::true_val(mtn_weekly_news_powder, unk_mtn_weekly_news_powder).

measured(s42, mtn_weekly_news_powder, wants_deep_powder).

all_consistent(mtn_weekly_news_powder) :- consistent(s42, mtn_weekly_news_powder).

evidence(all_consistent(mtn_weekly_news_powder)).
query(true_val(mtn_weekly_news_powder, wants_deep_powder)).
query(true_val(mtn_weekly_news_powder, unk_mtn_weekly_news_powder)).

0.85::acc(s42, mtn_weekly_news_beginner).

% @attr mtn_weekly_news_beginner
% @type categorical
% @canonical false
% @original_name Mountain Weekly News
% @values great_place_to_start=Great_place_to_start_splitboarding unk_mtn_weekly_news_beginner=Unknown
% @importance 0.85

0.75::true_val(mtn_weekly_news_beginner, great_place_to_start); 0.25::true_val(mtn_weekly_news_beginner, unk_mtn_weekly_news_beginner).

measured(s42, mtn_weekly_news_beginner, great_place_to_start).

all_consistent(mtn_weekly_news_beginner) :- consistent(s42, mtn_weekly_news_beginner).

evidence(all_consistent(mtn_weekly_news_beginner)).
query(true_val(mtn_weekly_news_beginner, great_place_to_start)).
query(true_val(mtn_weekly_news_beginner, unk_mtn_weekly_news_beginner)).

0.82::acc(s43, splitboard_mag_edge).

% @attr splitboard_mag_edge
% @type categorical
% @canonical false
% @original_name Splitboard Magazine review
% @values easy_edge_to_edge_favorable=Easy_board_quick_edge_to_edge_favorable_conditions unk_splitboard_mag_edge=Unknown
% @importance 0.9

0.75::true_val(splitboard_mag_edge, easy_edge_to_edge_favorable); 0.25::true_val(splitboard_mag_edge, unk_splitboard_mag_edge).

measured(s43, splitboard_mag_edge, easy_edge_to_edge_favorable).

all_consistent(splitboard_mag_edge) :- consistent(s43, splitboard_mag_edge).

evidence(all_consistent(splitboard_mag_edge)).
query(true_val(splitboard_mag_edge, easy_edge_to_edge_favorable)).
query(true_val(splitboard_mag_edge, unk_splitboard_mag_edge)).

0.82::acc(s43, splitboard_mag_freestyle).

% @attr splitboard_mag_freestyle
% @type categorical
% @canonical false
% @original_name Splitboard Magazine review
% @values perfect_freestyle_beyond_park=Perfect_for_freestyle_beyond_local_park unk_splitboard_mag_freestyle=Unknown
% @importance 0.9

0.75::true_val(splitboard_mag_freestyle, perfect_freestyle_beyond_park); 0.25::true_val(splitboard_mag_freestyle, unk_splitboard_mag_freestyle).

measured(s43, splitboard_mag_freestyle, perfect_freestyle_beyond_park).

all_consistent(splitboard_mag_freestyle) :- consistent(s43, splitboard_mag_freestyle).

evidence(all_consistent(splitboard_mag_freestyle)).
query(true_val(splitboard_mag_freestyle, perfect_freestyle_beyond_park)).
query(true_val(splitboard_mag_freestyle, unk_splitboard_mag_freestyle)).

0.78::acc(s46, snowleader_review_uphill).

% @attr snowleader_review_uphill
% @type categorical
% @canonical false
% @original_name Snowleader review
% @values easy_handle_pleasant_up_down=Easy_to_handle_pleasant_up_easy_down unk_snowleader_review_uphill=Unknown
% @importance 0.85

0.70::true_val(snowleader_review_uphill, easy_handle_pleasant_up_down); 0.30::true_val(snowleader_review_uphill, unk_snowleader_review_uphill).

measured(s46, snowleader_review_uphill, easy_handle_pleasant_up_down).

all_consistent(snowleader_review_uphill) :- consistent(s46, snowleader_review_uphill).

evidence(all_consistent(snowleader_review_uphill)).
query(true_val(snowleader_review_uphill, easy_handle_pleasant_up_down)).
query(true_val(snowleader_review_uphill, unk_snowleader_review_uphill)).

0.78::acc(s46, snowleader_review_limitation).

% @attr snowleader_review_limitation
% @type categorical
% @canonical false
% @original_name Snowleader review
% @values flat_camber_flex_no_ice=Flat_camber_6_10_flex_not_for_icy_spots unk_snowleader_review_limitation=Unknown
% @importance 0.85

0.70::true_val(snowleader_review_limitation, flat_camber_flex_no_ice); 0.30::true_val(snowleader_review_limitation, unk_snowleader_review_limitation).

measured(s46, snowleader_review_limitation, flat_camber_flex_no_ice).

all_consistent(snowleader_review_limitation) :- consistent(s46, snowleader_review_limitation).

evidence(all_consistent(snowleader_review_limitation)).
query(true_val(snowleader_review_limitation, flat_camber_flex_no_ice)).
query(true_val(snowleader_review_limitation, unk_snowleader_review_limitation)).

0.72::acc(s27, snowboard_robot_entry).

% @attr snowboard_robot_entry
% @type categorical
% @canonical false
% @original_name Snowboard Robot review
% @values basic_affordable_entry=Basic_affordable_entry_level_option unk_snowboard_robot_entry=Unknown
% @importance 0.8

0.62::true_val(snowboard_robot_entry, basic_affordable_entry); 0.38::true_val(snowboard_robot_entry, unk_snowboard_robot_entry).

measured(s27, snowboard_robot_entry, basic_affordable_entry).

all_consistent(snowboard_robot_entry) :- consistent(s27, snowboard_robot_entry).

evidence(all_consistent(snowboard_robot_entry)).
query(true_val(snowboard_robot_entry, basic_affordable_entry)).
query(true_val(snowboard_robot_entry, unk_snowboard_robot_entry)).

0.72::acc(s27, snowboard_robot_construction).

% @attr snowboard_robot_construction
% @type categorical
% @canonical false
% @original_name Snowboard Robot review
% @values one_wood_cheap_base=One_type_wood_cheap_extruded_base unk_snowboard_robot_construction=Unknown
% @importance 0.8

0.62::true_val(snowboard_robot_construction, one_wood_cheap_base); 0.38::true_val(snowboard_robot_construction, unk_snowboard_robot_construction).

measured(s27, snowboard_robot_construction, one_wood_cheap_base).

all_consistent(snowboard_robot_construction) :- consistent(s27, snowboard_robot_construction).

evidence(all_consistent(snowboard_robot_construction)).
query(true_val(snowboard_robot_construction, one_wood_cheap_base)).
query(true_val(snowboard_robot_construction, unk_snowboard_robot_construction)).

0.72::acc(s27, snowboard_robot_narrow).

% @attr snowboard_robot_narrow
% @type categorical
% @canonical false
% @original_name Snowboard Robot review
% @values nitro_fairly_narrow=Boards_from_Nitro_fairly_narrow unk_snowboard_robot_narrow=Unknown
% @importance 0.8

0.62::true_val(snowboard_robot_narrow, nitro_fairly_narrow); 0.38::true_val(snowboard_robot_narrow, unk_snowboard_robot_narrow).

measured(s27, snowboard_robot_narrow, nitro_fairly_narrow).

all_consistent(snowboard_robot_narrow) :- consistent(s27, snowboard_robot_narrow).

evidence(all_consistent(snowboard_robot_narrow)).
query(true_val(snowboard_robot_narrow, nitro_fairly_narrow)).
query(true_val(snowboard_robot_narrow, unk_snowboard_robot_narrow)).

0.80::acc(s29, splitboards_eu_reliable).

% @attr splitboards_eu_reliable
% @type categorical
% @canonical false
% @original_name Splitboards Europe expert
% @values reliable_balanced_on_off_trail=Reliable_balanced_performs_well_on_off_trails unk_splitboards_eu_reliable=Unknown
% @importance 0.7

0.70::true_val(splitboards_eu_reliable, reliable_balanced_on_off_trail); 0.30::true_val(splitboards_eu_reliable, unk_splitboards_eu_reliable).

measured(s29, splitboards_eu_reliable, reliable_balanced_on_off_trail).

all_consistent(splitboards_eu_reliable) :-
    (indep(s29), consistent(s29, splitboards_eu_reliable) ; \+indep(s29)).

evidence(all_consistent(splitboards_eu_reliable)).
query(true_val(splitboards_eu_reliable, reliable_balanced_on_off_trail)).
query(true_val(splitboards_eu_reliable, unk_splitboards_eu_reliable)).

0.80::acc(s29, splitboards_eu_touring).

% @attr splitboards_eu_touring
% @type categorical
% @canonical false
% @original_name Splitboards Europe expert
% @values excellent_stable_wide_conditions=Excellent_choice_stable_wide_range_conditions unk_splitboards_eu_touring=Unknown
% @importance 0.7

0.70::true_val(splitboards_eu_touring, excellent_stable_wide_conditions); 0.30::true_val(splitboards_eu_touring, unk_splitboards_eu_touring).

measured(s29, splitboards_eu_touring, excellent_stable_wide_conditions).

all_consistent(splitboards_eu_touring) :-
    (indep(s29), consistent(s29, splitboards_eu_touring) ; \+indep(s29)).

evidence(all_consistent(splitboards_eu_touring)).
query(true_val(splitboards_eu_touring, excellent_stable_wide_conditions)).
query(true_val(splitboards_eu_touring, unk_splitboards_eu_touring)).

0.75::acc(s16, cripple_creek_durability).

% @attr cripple_creek_durability
% @type categorical
% @canonical false
% @original_name Cripple Creek BC
% @values made_to_last_shred_affordable=Made_to_last_shred_not_break_bank unk_cripple_creek_durability=Unknown
% @importance 0.7

0.65::true_val(cripple_creek_durability, made_to_last_shred_affordable); 0.35::true_val(cripple_creek_durability, unk_cripple_creek_durability).

measured(s16, cripple_creek_durability, made_to_last_shred_affordable).

all_consistent(cripple_creek_durability) :-
    (indep(s16), consistent(s16, cripple_creek_durability) ; \+indep(s16)).

evidence(all_consistent(cripple_creek_durability)).
query(true_val(cripple_creek_durability, made_to_last_shred_affordable)).
query(true_val(cripple_creek_durability, unk_cripple_creek_durability)).

0.75::acc(s16, cripple_creek_versatility).

% @attr cripple_creek_versatility
% @type categorical
% @canonical false
% @original_name Cripple Creek BC
% @values widest_range_styles_terrain=Complement_largest_range_styles_terrain unk_cripple_creek_versatility=Unknown
% @importance 0.7

0.65::true_val(cripple_creek_versatility, widest_range_styles_terrain); 0.35::true_val(cripple_creek_versatility, unk_cripple_creek_versatility).

measured(s16, cripple_creek_versatility, widest_range_styles_terrain).

all_consistent(cripple_creek_versatility) :-
    (indep(s16), consistent(s16, cripple_creek_versatility) ; \+indep(s16)).

evidence(all_consistent(cripple_creek_versatility)).
query(true_val(cripple_creek_versatility, widest_range_styles_terrain)).
query(true_val(cripple_creek_versatility, unk_cripple_creek_versatility)).

0.82::acc(s47, comparable_board_same_brand).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values nitro_doppelganger=Nitro_Doppelganger_800USD unk_comparable_board_same_brand=Unknown
% @importance 0.65

0.72::true_val(comparable_board_same_brand, nitro_doppelganger); 0.28::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s47, comparable_board_same_brand, nitro_doppelganger).

all_consistent(comparable_board_same_brand) :- consistent(s47, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, nitro_doppelganger)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

0.80::acc(s48, comparable_board_cross_brand).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values rossignol_escaper=Rossignol_Escaper_affordable unk_comparable_board_cross_brand=Unknown
% @importance 0.65

0.68::true_val(comparable_board_cross_brand, rossignol_escaper); 0.32::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s48, comparable_board_cross_brand, rossignol_escaper).

all_consistent(comparable_board_cross_brand) :- consistent(s48, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, rossignol_escaper)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

0.78::acc(s49, comparable_board_cross_brand_k2_marauder).

% @attr comparable_board_cross_brand_k2_marauder
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values k2_marauder_package=K2_Marauder_all_in_one_package unk_comparable_board_cross_brand_k2_marauder=Unknown
% @importance 0.65

0.65::true_val(comparable_board_cross_brand_k2_marauder, k2_marauder_package); 0.35::true_val(comparable_board_cross_brand_k2_marauder, unk_comparable_board_cross_brand_k2_marauder).

measured(s49, comparable_board_cross_brand_k2_marauder, k2_marauder_package).

all_consistent(comparable_board_cross_brand_k2_marauder) :- consistent(s49, comparable_board_cross_brand_k2_marauder).

evidence(all_consistent(comparable_board_cross_brand_k2_marauder)).
query(true_val(comparable_board_cross_brand_k2_marauder, k2_marauder_package)).
query(true_val(comparable_board_cross_brand_k2_marauder, unk_comparable_board_cross_brand_k2_marauder)).

0.65::acc(s50, comparable_board_cross_brand_jones_solution).

% @attr comparable_board_cross_brand_jones_solution
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values jones_solution=Jones_Solution_best_overall unk_comparable_board_cross_brand_jones_solution=Unknown
% @importance 0.6

0.52::true_val(comparable_board_cross_brand_jones_solution, jones_solution); 0.48::true_val(comparable_board_cross_brand_jones_solution, unk_comparable_board_cross_brand_jones_solution).

measured(s50, comparable_board_cross_brand_jones_solution, jones_solution).

all_consistent(comparable_board_cross_brand_jones_solution) :- consistent(s50, comparable_board_cross_brand_jones_solution).

evidence(all_consistent(comparable_board_cross_brand_jones_solution)).
query(true_val(comparable_board_cross_brand_jones_solution, jones_solution)).
query(true_val(comparable_board_cross_brand_jones_solution, unk_comparable_board_cross_brand_jones_solution)).

0.78::acc(s51, comparable_board_cross_brand_xv_sushi).

% @attr comparable_board_cross_brand_xv_sushi
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values rossignol_xv_sushi=Rossignol_XV_Sushi_affordable_powder unk_comparable_board_cross_brand_xv_sushi=Unknown
% @importance 0.6

0.65::true_val(comparable_board_cross_brand_xv_sushi, rossignol_xv_sushi); 0.35::true_val(comparable_board_cross_brand_xv_sushi, unk_comparable_board_cross_brand_xv_sushi).

measured(s51, comparable_board_cross_brand_xv_sushi, rossignol_xv_sushi).

all_consistent(comparable_board_cross_brand_xv_sushi) :- consistent(s51, comparable_board_cross_brand_xv_sushi).

evidence(all_consistent(comparable_board_cross_brand_xv_sushi)).
query(true_val(comparable_board_cross_brand_xv_sushi, rossignol_xv_sushi)).
query(true_val(comparable_board_cross_brand_xv_sushi, unk_comparable_board_cross_brand_xv_sushi)).

0.80::acc(s52, comparable_board_cross_brand_burton_ft).

% @attr comparable_board_cross_brand_burton_ft
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values burton_family_tree=Burton_Family_Tree_Straight_Chuter_high_end unk_comparable_board_cross_brand_burton_ft=Unknown
% @importance 0.55

0.68::true_val(comparable_board_cross_brand_burton_ft, burton_family_tree); 0.32::true_val(comparable_board_cross_brand_burton_ft, unk_comparable_board_cross_brand_burton_ft).

measured(s52, comparable_board_cross_brand_burton_ft, burton_family_tree).

all_consistent(comparable_board_cross_brand_burton_ft) :- consistent(s52, comparable_board_cross_brand_burton_ft).

evidence(all_consistent(comparable_board_cross_brand_burton_ft)).
query(true_val(comparable_board_cross_brand_burton_ft, burton_family_tree)).
query(true_val(comparable_board_cross_brand_burton_ft, unk_comparable_board_cross_brand_burton_ft)).

0.78::acc(s53, comparable_board_cross_brand_k2_isolator).

% @attr comparable_board_cross_brand_k2_isolator
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values k2_isolator=K2_Isolator_1050USD_volume_shifted unk_comparable_board_cross_brand_k2_isolator=Unknown
% @importance 0.55

0.65::true_val(comparable_board_cross_brand_k2_isolator, k2_isolator); 0.35::true_val(comparable_board_cross_brand_k2_isolator, unk_comparable_board_cross_brand_k2_isolator).

measured(s53, comparable_board_cross_brand_k2_isolator, k2_isolator).

all_consistent(comparable_board_cross_brand_k2_isolator) :- consistent(s53, comparable_board_cross_brand_k2_isolator).

evidence(all_consistent(comparable_board_cross_brand_k2_isolator)).
query(true_val(comparable_board_cross_brand_k2_isolator, k2_isolator)).
query(true_val(comparable_board_cross_brand_k2_isolator, unk_comparable_board_cross_brand_k2_isolator)).

0.75::acc(s54, comparable_board_cross_brand_capita_navigator).

% @attr comparable_board_cross_brand_capita_navigator
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values capita_navigator=CAPiTA_Navigator_premium_carbon unk_comparable_board_cross_brand_capita_navigator=Unknown
% @importance 0.5

0.62::true_val(comparable_board_cross_brand_capita_navigator, capita_navigator); 0.38::true_val(comparable_board_cross_brand_capita_navigator, unk_comparable_board_cross_brand_capita_navigator).

measured(s54, comparable_board_cross_brand_capita_navigator, capita_navigator).

all_consistent(comparable_board_cross_brand_capita_navigator) :- consistent(s54, comparable_board_cross_brand_capita_navigator).

evidence(all_consistent(comparable_board_cross_brand_capita_navigator)).
query(true_val(comparable_board_cross_brand_capita_navigator, capita_navigator)).
query(true_val(comparable_board_cross_brand_capita_navigator, unk_comparable_board_cross_brand_capita_navigator)).

0.80::acc(s10, nitro_industry_standing).

% @attr nitro_industry_standing
% @type categorical
% @canonical false
% @original_name Nitro industry standing
% @values few_remaining_rider_owned=One_of_few_remaining_larger_rider_owned_brands unk_nitro_industry_standing=Unknown
% @importance 0.5

0.72::true_val(nitro_industry_standing, few_remaining_rider_owned); 0.28::true_val(nitro_industry_standing, unk_nitro_industry_standing).

measured(s10, nitro_industry_standing, few_remaining_rider_owned).

all_consistent(nitro_industry_standing) :- consistent(s10, nitro_industry_standing).

evidence(all_consistent(nitro_industry_standing)).
query(true_val(nitro_industry_standing, few_remaining_rider_owned)).
query(true_val(nitro_industry_standing, unk_nitro_industry_standing)).

0.85::acc(s42, nitro_splitboarding_reputation).

% @attr nitro_splitboarding_reputation
% @type categorical
% @canonical false
% @original_name Nitro splitboarding reputation
% @values on_fire_splitboard_game=On_fire_in_splitboard_game_bindings_boots unk_nitro_splitboarding_reputation=Unknown
% @importance 0.85

0.75::true_val(nitro_splitboarding_reputation, on_fire_splitboard_game); 0.25::true_val(nitro_splitboarding_reputation, unk_nitro_splitboarding_reputation).

measured(s42, nitro_splitboarding_reputation, on_fire_splitboard_game).

all_consistent(nitro_splitboarding_reputation) :- consistent(s42, nitro_splitboarding_reputation).

evidence(all_consistent(nitro_splitboarding_reputation)).
query(true_val(nitro_splitboarding_reputation, on_fire_splitboard_game)).
query(true_val(nitro_splitboarding_reputation, unk_nitro_splitboarding_reputation)).

0.40::acc(s55, user_review_forum).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values burton_better_resale=Burton_may_hold_better_resale_value unk_user_review_forum=Unknown
% @importance 0.4

0.25::true_val(user_review_forum, burton_better_resale); 0.75::true_val(user_review_forum, unk_user_review_forum).

measured(s55, user_review_forum, burton_better_resale).

all_consistent(user_review_forum) :- consistent(s55, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, burton_better_resale)).
query(true_val(user_review_forum, unk_user_review_forum)).

0.85::acc(s56, sustainability_certification_eog).

% @attr sustainability_certification_eog
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values eog_full_member_2018=EOG_full_member_since_summer_2018 unk_sustainability_certification_eog=Unknown
% @importance 0.25

0.78::true_val(sustainability_certification_eog, eog_full_member_2018); 0.22::true_val(sustainability_certification_eog, unk_sustainability_certification_eog).

measured(s56, sustainability_certification_eog, eog_full_member_2018).

all_consistent(sustainability_certification_eog) :- consistent(s56, sustainability_certification_eog).

evidence(all_consistent(sustainability_certification_eog)).
query(true_val(sustainability_certification_eog, eog_full_member_2018)).
query(true_val(sustainability_certification_eog, unk_sustainability_certification_eog)).