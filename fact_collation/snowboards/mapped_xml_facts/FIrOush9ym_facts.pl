0.10::indep(s2).
0.15::indep(s13).
0.20::indep(s16).
0.15::indep(s38).
0.15::indep(s39).
0.20::indep(s15).
0.15::indep(s33).
0.20::indep(s9).
0.15::indep(s41).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values nitro=Nitro unk_brand=Unknown
% @importance 1.0

0.97::true_val(brand, nitro); 0.03::true_val(brand, unk_brand).

0.95::acc(s1, brand).
0.95::acc(s2, brand).

measured(s1, brand, nitro).
measured(s2, brand, nitro).

all_consistent(brand) :-
    consistent(s1, brand),
    (indep(s2), consistent(s2, brand) ; \+indep(s2)).

evidence(all_consistent(brand)).
query(true_val(brand, nitro)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values squash=Squash unk_model_name=Unknown
% @importance 1.0

0.97::true_val(model_name, squash); 0.03::true_val(model_name, unk_model_name).

0.95::acc(s1, model_name).
0.95::acc(s2, model_name).

measured(s1, model_name, squash).
measured(s2, model_name, squash).

all_consistent(model_name) :-
    consistent(s1, model_name),
    (indep(s2), consistent(s2, model_name) ; \+indep(s2)).

evidence(all_consistent(model_name)).
query(true_val(model_name, squash)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2026=2026 unk_model_year=Unknown
% @importance 1.0

0.97::true_val(model_year, y2026); 0.03::true_val(model_year, unk_model_year).

0.95::acc(s1, model_year).
0.95::acc(s2, model_year).

measured(s1, model_year, y2026).
measured(s2, model_year, y2026).

all_consistent(model_year) :-
    consistent(s1, model_year),
    (indep(s2), consistent(s2, model_year) ; \+indep(s2)).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2026)).
query(true_val(model_year, unk_model_year)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.97::true_val(product_type, snowboard); 0.03::true_val(product_type, unk_product_type).

0.95::acc(s1, product_type).
0.95::acc(s2, product_type).

measured(s1, product_type, snowboard).
measured(s2, product_type, snowboard).

all_consistent(product_type) :-
    consistent(s1, product_type),
    (indep(s2), consistent(s2, product_type) ; \+indep(s2)).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values nitro_ag_hunenberg=Nitro_AG_Hunenberg_Switzerland unk_manufacturer=Unknown
% @importance 0.4

0.90::true_val(manufacturer, nitro_ag_hunenberg); 0.10::true_val(manufacturer, unk_manufacturer).

0.95::acc(s3, manufacturer).

measured(s3, manufacturer, nitro_ag_hunenberg).

all_consistent(manufacturer) :-
    consistent(s3, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, nitro_ag_hunenberg)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr eu_representative
% @type categorical
% @canonical false
% @original_name EU representative
% @values nitro_dist_italia=Nitro_Distribution_Italia_Arco unk_eu_representative=Unknown
% @importance 0.4

0.90::true_val(eu_representative, nitro_dist_italia); 0.10::true_val(eu_representative, unk_eu_representative).

0.95::acc(s3, eu_representative).

measured(s3, eu_representative, nitro_dist_italia).

all_consistent(eu_representative) :-
    consistent(s3, eu_representative).

evidence(all_consistent(eu_representative)).
query(true_val(eu_representative, nitro_dist_italia)).
query(true_val(eu_representative, unk_eu_representative)).

% @attr us_distribution
% @type categorical
% @canonical false
% @original_name US distribution
% @values foundry_dist_slc=Foundry_Distribution_SLC_UT unk_us_distribution=Unknown
% @importance 0.3

0.81::true_val(us_distribution, foundry_dist_slc); 0.19::true_val(us_distribution, unk_us_distribution).

0.90::acc(s4, us_distribution).

measured(s4, us_distribution, foundry_dist_slc).

all_consistent(us_distribution) :-
    consistent(s4, us_distribution).

evidence(all_consistent(us_distribution)).
query(true_val(us_distribution, foundry_dist_slc)).
query(true_val(us_distribution, unk_us_distribution)).

% @attr manufacturer_founded
% @type categorical
% @canonical false
% @original_name manufacturer founded
% @values y1990_veras_cafe=1990_Veras_Cafe_Ballard_Seattle unk_manufacturer_founded=Unknown
% @importance 0.35

0.90::true_val(manufacturer_founded, y1990_veras_cafe); 0.10::true_val(manufacturer_founded, unk_manufacturer_founded).

0.93::acc(s5, manufacturer_founded).

measured(s5, manufacturer_founded, y1990_veras_cafe).

all_consistent(manufacturer_founded) :-
    consistent(s5, manufacturer_founded).

evidence(all_consistent(manufacturer_founded)).
query(true_val(manufacturer_founded, y1990_veras_cafe)).
query(true_val(manufacturer_founded, unk_manufacturer_founded)).

% @attr founders
% @type categorical
% @canonical false
% @original_name founders
% @values delago_ardelt=Thomas_Delago_and_Sepp_Ardelt unk_founders=Unknown
% @importance 0.35

0.86::true_val(founders, delago_ardelt); 0.14::true_val(founders, unk_founders).

0.90::acc(s6, founders).

measured(s6, founders, delago_ardelt).

all_consistent(founders) :-
    consistent(s6, founders).

evidence(all_consistent(founders)).
query(true_val(founders, delago_ardelt)).
query(true_val(founders, unk_founders)).

% @attr manufacturer_brand_heritage
% @type categorical
% @canonical false
% @original_name manufacturer brand heritage
% @values oldest_private_rider_owned=Oldest_privately_owned_rider_operated_since_1990 unk_manufacturer_brand_heritage=Unknown
% @importance 0.3

0.51::true_val(manufacturer_brand_heritage, oldest_private_rider_owned); 0.49::true_val(manufacturer_brand_heritage, unk_manufacturer_brand_heritage).

0.75::acc(s7, manufacturer_brand_heritage).

measured(s7, manufacturer_brand_heritage, oldest_private_rider_owned).

all_consistent(manufacturer_brand_heritage) :-
    consistent(s7, manufacturer_brand_heritage).

evidence(all_consistent(manufacturer_brand_heritage)).
query(true_val(manufacturer_brand_heritage, oldest_private_rider_owned)).
query(true_val(manufacturer_brand_heritage, unk_manufacturer_brand_heritage)).

% @attr manufacturer_swallowtail_heritage
% @type categorical
% @canonical false
% @original_name manufacturer swallowtail heritage
% @values retro_first_swallowtail=First_board_designed_was_swallowtail_Retro unk_manufacturer_swallowtail_heritage=Unknown
% @importance 0.3

0.81::true_val(manufacturer_swallowtail_heritage, retro_first_swallowtail); 0.19::true_val(manufacturer_swallowtail_heritage, unk_manufacturer_swallowtail_heritage).

0.90::acc(s8, manufacturer_swallowtail_heritage).

measured(s8, manufacturer_swallowtail_heritage, retro_first_swallowtail).

all_consistent(manufacturer_swallowtail_heritage) :-
    consistent(s8, manufacturer_swallowtail_heritage).

evidence(all_consistent(manufacturer_swallowtail_heritage)).
query(true_val(manufacturer_swallowtail_heritage, retro_first_swallowtail)).
query(true_val(manufacturer_swallowtail_heritage, unk_manufacturer_swallowtail_heritage)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2017_18=2017_2018_season_Quiver_Series unk_model_first_available_year=Unknown
% @importance 0.5

0.68::true_val(model_first_available_year, season_2017_18); 0.32::true_val(model_first_available_year, unk_model_first_available_year).

0.82::acc(s9, model_first_available_year).

measured(s9, model_first_available_year, season_2017_18).

all_consistent(model_first_available_year) :-
    (indep(s9), consistent(s9, model_first_available_year) ; \+indep(s9)).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2017_18)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr model_series_origin
% @type categorical
% @canonical false
% @original_name model series origin
% @values quiver_to_inline=Originally_Quiver_series_became_own_model unk_model_series_origin=Unknown
% @importance 0.6

0.63::true_val(model_series_origin, quiver_to_inline); 0.37::true_val(model_series_origin, unk_model_series_origin).

0.82::acc(s10, model_series_origin).

measured(s10, model_series_origin, quiver_to_inline).

all_consistent(model_series_origin) :-
    consistent(s10, model_series_origin).

evidence(all_consistent(model_series_origin)).
query(true_val(model_series_origin, quiver_to_inline)).
query(true_val(model_series_origin, unk_model_series_origin)).

% @attr model_graduated_to_inline
% @type categorical
% @canonical false
% @original_name model graduated to inline
% @values season_2018_19=2018_2019_season unk_model_graduated_to_inline=Unknown
% @importance 0.5

0.76::true_val(model_graduated_to_inline, season_2018_19); 0.24::true_val(model_graduated_to_inline, unk_model_graduated_to_inline).

0.82::acc(s11, model_graduated_to_inline).

measured(s11, model_graduated_to_inline, season_2018_19).

all_consistent(model_graduated_to_inline) :-
    consistent(s11, model_graduated_to_inline).

evidence(all_consistent(model_graduated_to_inline)).
query(true_val(model_graduated_to_inline, season_2018_19)).
query(true_val(model_graduated_to_inline, unk_model_graduated_to_inline)).

% @attr redesign_year
% @type categorical
% @canonical true
% @original_name redesign_year
% @values y2024_wider_nose=2024_new_shape_wider_nose unk_redesign_year=Unknown
% @importance 0.6

0.81::true_val(redesign_year, y2024_wider_nose); 0.19::true_val(redesign_year, unk_redesign_year).

0.88::acc(s12, redesign_year).

measured(s12, redesign_year, y2024_wider_nose).

all_consistent(redesign_year) :-
    consistent(s12, redesign_year).

evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, y2024_wider_nose)).
query(true_val(redesign_year, unk_redesign_year)).

% @attr what_is_new_for_2026
% @type categorical
% @canonical false
% @original_name what is new for 2026
% @values graphics_only=Graphics_only_no_structural_changes unk_what_is_new_for_2026=Unknown
% @importance 0.7

0.68::true_val(what_is_new_for_2026, graphics_only); 0.32::true_val(what_is_new_for_2026, unk_what_is_new_for_2026).

0.82::acc(s13, what_is_new_for_2026).

measured(s13, what_is_new_for_2026, graphics_only).

all_consistent(what_is_new_for_2026) :-
    (indep(s13), consistent(s13, what_is_new_for_2026) ; \+indep(s13)).

evidence(all_consistent(what_is_new_for_2026)).
query(true_val(what_is_new_for_2026, graphics_only)).
query(true_val(what_is_new_for_2026, unk_what_is_new_for_2026)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values fox_smith=Bryan_Fox_and_Austin_Smith unk_pro_rider_name=Unknown
% @importance 0.7

0.64::true_val(pro_rider_name, fox_smith); 0.36::true_val(pro_rider_name, unk_pro_rider_name).

0.80::acc(s14, pro_rider_name).

measured(s14, pro_rider_name, fox_smith).

all_consistent(pro_rider_name) :-
    consistent(s14, pro_rider_name).

evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, fox_smith)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr tommy_delago_endorsement
% @type categorical
% @canonical false
% @original_name Tommy Delago endorsement quote
% @values personal_association=Co_founder_personally_associated unk_tommy_delago_endorsement=Unknown
% @importance 0.25

0.56::true_val(tommy_delago_endorsement, personal_association); 0.44::true_val(tommy_delago_endorsement, unk_tommy_delago_endorsement).

0.72::acc(s15, tommy_delago_endorsement).

measured(s15, tommy_delago_endorsement, personal_association).

all_consistent(tommy_delago_endorsement) :-
    (indep(s15), consistent(s15, tommy_delago_endorsement) ; \+indep(s15)).

evidence(all_consistent(tommy_delago_endorsement)).
query(true_val(tommy_delago_endorsement, personal_association)).
query(true_val(tommy_delago_endorsement, unk_tommy_delago_endorsement)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values freeride_powder=Freeride_Powder all_mountain_freeride=All_Mountain_Freeride freeride_powder_carving=Freeride_Powder_Carving
% @importance 0.82

0.40::true_val(board_category, freeride_powder); 0.30::true_val(board_category, all_mountain_freeride); 0.30::true_val(board_category, freeride_powder_carving).

0.93::acc(s1, board_category).
0.85::acc(s16, board_category).
0.80::acc(s13, board_category).

measured(s1, board_category, freeride_powder).
measured(s16, board_category, all_mountain_freeride).
measured(s13, board_category, freeride_powder_carving).

all_consistent(board_category) :-
    consistent(s1, board_category),
    (indep(s16), consistent(s16, board_category) ; \+indep(s16)),
    (indep(s13), consistent(s13, board_category) ; \+indep(s13)).

evidence(all_consistent(board_category)).
query(true_val(board_category, freeride_powder)).
query(true_val(board_category, all_mountain_freeride)).
query(true_val(board_category, freeride_powder_carving)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values powder_groomers_freeride=Powder_Groomers_Freeride unk_terrain_suitability=Unknown
% @importance 1.0

0.95::true_val(terrain_suitability, powder_groomers_freeride); 0.05::true_val(terrain_suitability, unk_terrain_suitability).

0.95::acc(s1, terrain_suitability).

measured(s1, terrain_suitability, powder_groomers_freeride).

all_consistent(terrain_suitability) :-
    consistent(s1, terrain_suitability).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, powder_groomers_freeride)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr terrain_suitability_all_mountain
% @type numeric
% @canonical false
% @original_name terrain_suitability (All Mountain)
% @unit /10
% @values v10=10.0 unk_terrain_suitability_all_mountain=Unknown
% @importance 1.0

0.95::true_val(terrain_suitability_all_mountain, v10); 0.05::true_val(terrain_suitability_all_mountain, unk_terrain_suitability_all_mountain).

0.95::acc(s2, terrain_suitability_all_mountain).

measured(s2, terrain_suitability_all_mountain, v10).

all_consistent(terrain_suitability_all_mountain) :-
    (indep(s2), consistent(s2, terrain_suitability_all_mountain) ; \+indep(s2)).

evidence(all_consistent(terrain_suitability_all_mountain)).
query(true_val(terrain_suitability_all_mountain, v10)).
query(true_val(terrain_suitability_all_mountain, unk_terrain_suitability_all_mountain)).

% @attr terrain_suitability_park
% @type numeric
% @canonical false
% @original_name terrain_suitability (Park)
% @unit /10
% @values v0=0.0 unk_terrain_suitability_park=Unknown
% @importance 1.0

0.95::true_val(terrain_suitability_park, v0); 0.05::true_val(terrain_suitability_park, unk_terrain_suitability_park).

0.95::acc(s2, terrain_suitability_park).

measured(s2, terrain_suitability_park, v0).

all_consistent(terrain_suitability_park) :-
    (indep(s2), consistent(s2, terrain_suitability_park) ; \+indep(s2)).

evidence(all_consistent(terrain_suitability_park)).
query(true_val(terrain_suitability_park, v0)).
query(true_val(terrain_suitability_park, unk_terrain_suitability_park)).

% @attr terrain_suitability_backcountry
% @type numeric
% @canonical false
% @original_name terrain_suitability (Backcountry)
% @unit /10
% @values v10=10.0 unk_terrain_suitability_backcountry=Unknown
% @importance 1.0

0.95::true_val(terrain_suitability_backcountry, v10_bc); 0.05::true_val(terrain_suitability_backcountry, unk_terrain_suitability_backcountry).

0.95::acc(s2, terrain_suitability_backcountry).

measured(s2, terrain_suitability_backcountry, v10_bc).

all_consistent(terrain_suitability_backcountry) :-
    (indep(s2), consistent(s2, terrain_suitability_backcountry) ; \+indep(s2)).

evidence(all_consistent(terrain_suitability_backcountry)).
query(true_val(terrain_suitability_backcountry, v10_bc)).
query(true_val(terrain_suitability_backcountry, unk_terrain_suitability_backcountry)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values snowsurf=Snowsurf unk_riding_style=Unknown
% @importance 0.9

0.74::true_val(riding_style, snowsurf); 0.26::true_val(riding_style, unk_riding_style).

0.87::acc(s17, riding_style).

measured(s17, riding_style, snowsurf).

all_consistent(riding_style) :-
    consistent(s17, riding_style).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, snowsurf)).
query(true_val(riding_style, unk_riding_style)).

% @attr riding_style_category
% @type categorical
% @canonical false
% @original_name riding_style (Blister category)
% @values pow_groomer=Pow_groomer_category unk_riding_style_category=Unknown
% @importance 0.9

0.78::true_val(riding_style_category, pow_groomer); 0.22::true_val(riding_style_category, unk_riding_style_category).

0.88::acc(s18, riding_style_category).

measured(s18, riding_style_category, pow_groomer).

all_consistent(riding_style_category) :-
    consistent(s18, riding_style_category).

evidence(all_consistent(riding_style_category)).
query(true_val(riding_style_category, pow_groomer)).
query(true_val(riding_style_category, unk_riding_style_category)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values advanced=Advanced unk_rider_level=Unknown
% @importance 1.0

0.95::true_val(rider_level, advanced); 0.05::true_val(rider_level, unk_rider_level).

0.95::acc(s1, rider_level).

measured(s1, rider_level, advanced).

all_consistent(rider_level) :-
    consistent(s1, rider_level).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, advanced)).
query(true_val(rider_level, unk_rider_level)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values advanced_expert=Advanced_Expert intermediate_to_expert=Intermediate_Advanced_Expert
% @importance 0.85

0.55::true_val(skill_level_recommendation, advanced_expert); 0.45::true_val(skill_level_recommendation, intermediate_to_expert).

0.88::acc(s17, skill_level_recommendation).
0.80::acc(s13, skill_level_recommendation).
0.87::acc(s19, skill_level_recommendation).

measured(s17, skill_level_recommendation, advanced_expert).
measured(s13, skill_level_recommendation, advanced_expert).
measured(s19, skill_level_recommendation, intermediate_to_expert).

all_consistent(skill_level_recommendation) :-
    consistent(s17, skill_level_recommendation),
    (indep(s13), consistent(s13, skill_level_recommendation) ; \+indep(s13)),
    consistent(s19, skill_level_recommendation).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, advanced_expert)).
query(true_val(skill_level_recommendation, intermediate_to_expert)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens_also_womens_youth unk_gender=Unknown
% @importance 0.6

0.63::true_val(gender, mens); 0.37::true_val(gender, unk_gender).

0.82::acc(s10, gender).

measured(s10, gender, mens).

all_consistent(gender) :-
    consistent(s10, gender).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr skill_level_recommendation_description
% @type categorical
% @canonical false
% @original_name skill_level_recommendation (description)
% @values high_speed_directional=Advanced_riders_high_speed_directional_powder_hardpack unk_skill_level_recommendation_description=Unknown
% @importance 0.7

0.68::true_val(skill_level_recommendation_description, high_speed_directional); 0.32::true_val(skill_level_recommendation_description, unk_skill_level_recommendation_description).

0.80::acc(s13, skill_level_recommendation_description).

measured(s13, skill_level_recommendation_description, high_speed_directional).

all_consistent(skill_level_recommendation_description) :-
    (indep(s13), consistent(s13, skill_level_recommendation_description) ; \+indep(s13)).

evidence(all_consistent(skill_level_recommendation_description)).
query(true_val(skill_level_recommendation_description, high_speed_directional)).
query(true_val(skill_level_recommendation_description, unk_skill_level_recommendation_description)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_swallowtail=Tapered_Swallowtail tapered_directional=Tapered_Directional
% @importance 0.95

0.60::true_val(shape, tapered_swallowtail); 0.40::true_val(shape, tapered_directional).

0.95::acc(s1, shape).
0.95::acc(s2, shape).
0.87::acc(s17, shape).

measured(s1, shape, tapered_swallowtail).
measured(s2, shape, tapered_swallowtail).
measured(s17, shape, tapered_directional).

all_consistent(shape) :-
    consistent(s1, shape),
    (indep(s2), consistent(s2, shape) ; \+indep(s2)),
    consistent(s17, shape).

evidence(all_consistent(shape)).
query(true_val(shape, tapered_swallowtail)).
query(true_val(shape, tapered_directional)).

% @attr shape_description
% @type categorical
% @canonical false
% @original_name shape description
% @values full_nose_narrow_tail=Full_width_nose_narrower_tail_swallowtail unk_shape_description=Unknown
% @importance 1.0

0.95::true_val(shape_description, full_nose_narrow_tail); 0.05::true_val(shape_description, unk_shape_description).

0.95::acc(s2, shape_description).

measured(s2, shape_description, full_nose_narrow_tail).

all_consistent(shape_description) :-
    (indep(s2), consistent(s2, shape_description) ; \+indep(s2)).

evidence(all_consistent(shape_description)).
query(true_val(shape_description, full_nose_narrow_tail)).
query(true_val(shape_description, unk_shape_description)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values true_camber=True_Camber unk_camber_type=Unknown
% @importance 1.0

0.97::true_val(camber_type, true_camber); 0.03::true_val(camber_type, unk_camber_type).

0.95::acc(s1, camber_type).
0.95::acc(s2, camber_type).

measured(s1, camber_type, true_camber).
measured(s2, camber_type, true_camber).

all_consistent(camber_type) :-
    consistent(s1, camber_type),
    (indep(s2), consistent(s2, camber_type) ; \+indep(s2)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, true_camber)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical false
% @original_name camber_description
% @values full_camber_tip_to_tail=Full_old_school_camber_tip_to_tail_locked_in_technical unk_camber_description=Unknown
% @importance 0.85

0.74::true_val(camber_description, full_camber_tip_to_tail); 0.26::true_val(camber_description, unk_camber_description).

0.87::acc(s20, camber_description).

measured(s20, camber_description, full_camber_tip_to_tail).

all_consistent(camber_description) :-
    consistent(s20, camber_description).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, full_camber_tip_to_tail)).
query(true_val(camber_description, unk_camber_description)).

% @attr core_profile
% @type categorical
% @canonical false
% @original_name core profile
% @values standard_core_profile=Standard_Core_Profile_thicker_middle unk_core_profile=Unknown
% @importance 1.0

0.95::true_val(core_profile, standard_core_profile); 0.05::true_val(core_profile, unk_core_profile).

0.95::acc(s1, core_profile).
0.95::acc(s2, core_profile).

measured(s1, core_profile, standard_core_profile).
measured(s2, core_profile, standard_core_profile).

all_consistent(core_profile) :-
    consistent(s1, core_profile),
    (indep(s2), consistent(s2, core_profile) ; \+indep(s2)).

evidence(all_consistent(core_profile)).
query(true_val(core_profile, standard_core_profile)).
query(true_val(core_profile, unk_core_profile)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @original_name flex_rating_10
% @unit /10
% @values v7=7.0 unk_flex_rating_10=Unknown
% @importance 1.0

0.95::true_val(flex_rating_10, v7); 0.05::true_val(flex_rating_10, unk_flex_rating_10).

0.95::acc(s1, flex_rating_10).
0.95::acc(s2, flex_rating_10).

measured(s1, flex_rating_10, v7).
measured(s2, flex_rating_10, v7).

all_consistent(flex_rating_10) :-
    consistent(s1, flex_rating_10),
    (indep(s2), consistent(s2, flex_rating_10) ; \+indep(s2)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v7)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values mid_flex=Mid_flex_balanced medium_stiff=Medium_Stiff stiff_overall=Stiff_overall_especially_tail
% @importance 0.87

0.35::true_val(flex_feel, mid_flex); 0.40::true_val(flex_feel, medium_stiff); 0.25::true_val(flex_feel, stiff_overall).

0.90::acc(s1, flex_feel).
0.88::acc(s17, flex_feel).
0.82::acc(s23, flex_feel).

measured(s1, flex_feel, mid_flex).
measured(s17, flex_feel, medium_stiff).
measured(s23, flex_feel, stiff_overall).

all_consistent(flex_feel) :-
    consistent(s1, flex_feel),
    consistent(s17, flex_feel),
    consistent(s23, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, mid_flex)).
query(true_val(flex_feel, medium_stiff)).
query(true_val(flex_feel, stiff_overall)).

% @attr flex_pattern_name
% @type categorical
% @canonical false
% @original_name flex pattern name
% @values directional_all_terrain=Directional_All_Terrain_Flex unk_flex_pattern_name=Unknown
% @importance 0.75

0.74::true_val(flex_pattern_name, directional_all_terrain); 0.26::true_val(flex_pattern_name, unk_flex_pattern_name).

0.85::acc(s16, flex_pattern_name).

measured(s16, flex_pattern_name, directional_all_terrain).

all_consistent(flex_pattern_name) :-
    (indep(s16), consistent(s16, flex_pattern_name) ; \+indep(s16)).

evidence(all_consistent(flex_pattern_name)).
query(true_val(flex_pattern_name, directional_all_terrain)).
query(true_val(flex_pattern_name, unk_flex_pattern_name)).

% @attr flex_direction
% @type categorical
% @canonical false
% @original_name flex_direction
% @values directional_soft_nose_stiff_tail=Directional_medium_soft_nose_stiff_tail unk_flex_direction=Unknown
% @importance 0.8

0.74::true_val(flex_direction, directional_soft_nose_stiff_tail); 0.26::true_val(flex_direction, unk_flex_direction).

0.88::acc(s21, flex_direction).

measured(s21, flex_direction, directional_soft_nose_stiff_tail).

all_consistent(flex_direction) :-
    consistent(s21, flex_direction).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional_soft_nose_stiff_tail)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr flex_rating_10_evo
% @type categorical
% @canonical false
% @original_name flex_rating_10_evo
% @values stiff_evo=Stiff_evo_scale_6_8 unk_flex_rating_10_evo=Unknown
% @importance 0.75

0.74::true_val(flex_rating_10_evo, stiff_evo); 0.26::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).

0.85::acc(s22, flex_rating_10_evo).

measured(s22, flex_rating_10_evo, stiff_evo).

all_consistent(flex_rating_10_evo) :-
    consistent(s22, flex_rating_10_evo).

evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, stiff_evo)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

% @attr flex_feel_synthesis
% @type categorical
% @canonical false
% @original_name flex_feel (synthesis)
% @values directional_flex_varies=Directional_flex_softer_nose_stiffer_tail_explains_variation unk_flex_feel_synthesis=Unknown
% @importance 0.8

0.72::true_val(flex_feel_synthesis, directional_flex_varies); 0.28::true_val(flex_feel_synthesis, unk_flex_feel_synthesis).

0.85::acc(s17, flex_feel_synthesis).
0.82::acc(s22, flex_feel_synthesis).
0.80::acc(s23, flex_feel_synthesis).
0.80::acc(s24, flex_feel_synthesis).

measured(s17, flex_feel_synthesis, directional_flex_varies).
measured(s22, flex_feel_synthesis, directional_flex_varies).
measured(s23, flex_feel_synthesis, directional_flex_varies).
measured(s24, flex_feel_synthesis, directional_flex_varies).

all_consistent(flex_feel_synthesis) :-
    consistent(s17, flex_feel_synthesis),
    consistent(s22, flex_feel_synthesis),
    consistent(s23, flex_feel_synthesis),
    consistent(s24, flex_feel_synthesis).

evidence(all_consistent(flex_feel_synthesis)).
query(true_val(flex_feel_synthesis, directional_flex_varies)).
query(true_val(flex_feel_synthesis, unk_flex_feel_synthesis)).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values progressive=Progressive_Sidecut unk_sidecut_type=Unknown
% @importance 1.0

0.95::true_val(sidecut_type, progressive); 0.05::true_val(sidecut_type, unk_sidecut_type).

0.95::acc(s1, sidecut_type).
0.95::acc(s2, sidecut_type).

measured(s1, sidecut_type, progressive).
measured(s2, sidecut_type, progressive).

all_consistent(sidecut_type) :-
    consistent(s1, sidecut_type),
    (indep(s2), consistent(s2, sidecut_type) ; \+indep(s2)).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, progressive)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr sidecut_description
% @type categorical
% @canonical false
% @original_name sidecut description
% @values larger_nose_tighter_tail=Larger_radius_nose_tighter_tail_fast_catch_free unk_sidecut_description=Unknown
% @importance 1.0

0.95::true_val(sidecut_description, larger_nose_tighter_tail); 0.05::true_val(sidecut_description, unk_sidecut_description).

0.95::acc(s1, sidecut_description).
0.95::acc(s2, sidecut_description).

measured(s1, sidecut_description, larger_nose_tighter_tail).
measured(s2, sidecut_description, larger_nose_tighter_tail).

all_consistent(sidecut_description) :-
    consistent(s1, sidecut_description),
    (indep(s2), consistent(s2, sidecut_description) ; \+indep(s2)).

evidence(all_consistent(sidecut_description)).
query(true_val(sidecut_description, larger_nose_tighter_tail)).
query(true_val(sidecut_description, unk_sidecut_description)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values mid_wide_wide=Mid_Wide_and_Wide unk_width_options=Unknown
% @importance 1.0

0.95::true_val(width_options, mid_wide_wide); 0.05::true_val(width_options, unk_width_options).

0.95::acc(s1, width_options).
0.95::acc(s2, width_options).

measured(s1, width_options, mid_wide_wide).
measured(s2, width_options, mid_wide_wide).

all_consistent(width_options) :-
    consistent(s1, width_options),
    (indep(s2), consistent(s2, width_options) ; \+indep(s2)).

evidence(all_consistent(width_options)).
query(true_val(width_options, mid_wide_wide)).
query(true_val(width_options, unk_width_options)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 1.0

0.95::true_val(mounting_pattern, inserts_2x4); 0.05::true_val(mounting_pattern, unk_mounting_pattern).

0.95::acc(s1, mounting_pattern).

measured(s1, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :-
    consistent(s1, mounting_pattern).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values three_sizes=156mw_159mw_163w two_sizes=156cm_159cm
% @importance 1.0

0.60::true_val(available_sizes, three_sizes); 0.40::true_val(available_sizes, two_sizes).

0.95::acc(s2, available_sizes).
0.93::acc(s1, available_sizes).

measured(s2, available_sizes, three_sizes).
measured(s1, available_sizes, two_sizes).

all_consistent(available_sizes) :-
    consistent(s1, available_sizes),
    (indep(s2), consistent(s2, available_sizes) ; \+indep(s2)).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, three_sizes)).
query(true_val(available_sizes, two_sizes)).

% @attr taper
% @type numeric
% @canonical true
% @original_name taper
% @unit mm
% @values v6=6.0 unk_taper=Unknown
% @importance 0.7

0.68::true_val(taper, v6); 0.32::true_val(taper, unk_taper).

0.88::acc(s25, taper).

measured(s25, taper, v6).

all_consistent(taper) :-
    consistent(s25, taper).

evidence(all_consistent(taper)).
query(true_val(taper, v6)).
query(true_val(taper, unk_taper)).

% @attr setback
% @type numeric
% @canonical true
% @original_name setback
% @unit mm
% @values vm25=negative_25mm unk_setback=Unknown
% @importance 1.0

0.95::true_val(setback, vm25); 0.05::true_val(setback, unk_setback).

0.95::acc(s1, setback).
0.95::acc(s2, setback).

measured(s1, setback, vm25).
measured(s2, setback, vm25).

all_consistent(setback) :-
    consistent(s1, setback),
    (indep(s2), consistent(s2, setback) ; \+indep(s2)).

evidence(all_consistent(setback)).
query(true_val(setback, vm25)).
query(true_val(setback, unk_setback)).

% @attr setback_at_reference
% @type categorical
% @canonical false
% @original_name setback (at reference markers)
% @values vm5_25_at_21_25=negative_5_25_inch_at_21_25_stance unk_setback_at_reference=Unknown
% @importance 0.7

0.68::true_val(setback_at_reference, vm5_25_at_21_25); 0.32::true_val(setback_at_reference, unk_setback_at_reference).

0.85::acc(s25, setback_at_reference).

measured(s25, setback_at_reference, vm5_25_at_21_25).

all_consistent(setback_at_reference) :-
    consistent(s25, setback_at_reference).

evidence(all_consistent(setback_at_reference)).
query(true_val(setback_at_reference, vm5_25_at_21_25)).
query(true_val(setback_at_reference, unk_setback_at_reference)).

% @attr contact_length_size
% @type numeric
% @canonical true
% @original_name contact_length_size (156)
% @unit mm
% @values v1120=1120.0 unk_contact_length_size=Unknown
% @importance 1.0

0.95::true_val(contact_length_size, v1120); 0.05::true_val(contact_length_size, unk_contact_length_size).

0.95::acc(s1, contact_length_size).
0.95::acc(s2, contact_length_size).

measured(s1, contact_length_size, v1120).
measured(s2, contact_length_size, v1120).

all_consistent(contact_length_size) :-
    consistent(s1, contact_length_size),
    (indep(s2), consistent(s2, contact_length_size) ; \+indep(s2)).

evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v1120)).
query(true_val(contact_length_size, unk_contact_length_size)).

% @attr tip_tail_width_size
% @type numeric
% @canonical true
% @original_name tip_tail_width_size (156 nose)
% @unit mm
% @values v299=299.0 unk_tip_tail_width_size=Unknown
% @importance 1.0

0.95::true_val(tip_tail_width_size, v299); 0.05::true_val(tip_tail_width_size, unk_tip_tail_width_size).

0.95::acc(s1, tip_tail_width_size).
0.95::acc(s2, tip_tail_width_size).

measured(s1, tip_tail_width_size, v299).
measured(s2, tip_tail_width_size, v299).

all_consistent(tip_tail_width_size) :-
    consistent(s1, tip_tail_width_size),
    (indep(s2), consistent(s2, tip_tail_width_size) ; \+indep(s2)).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v299)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr tip_tail_width_size_156_tail
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (156 tail)
% @unit mm
% @values v293=293.0 unk_tip_tail_width_size_156_tail=Unknown
% @importance 1.0

0.95::true_val(tip_tail_width_size_156_tail, v293); 0.05::true_val(tip_tail_width_size_156_tail, unk_tip_tail_width_size_156_tail).

0.95::acc(s1, tip_tail_width_size_156_tail).
0.95::acc(s2, tip_tail_width_size_156_tail).

measured(s1, tip_tail_width_size_156_tail, v293).
measured(s2, tip_tail_width_size_156_tail, v293).

all_consistent(tip_tail_width_size_156_tail) :-
    consistent(s1, tip_tail_width_size_156_tail),
    (indep(s2), consistent(s2, tip_tail_width_size_156_tail) ; \+indep(s2)).

evidence(all_consistent(tip_tail_width_size_156_tail)).
query(true_val(tip_tail_width_size_156_tail, v293)).
query(true_val(tip_tail_width_size_156_tail, unk_tip_tail_width_size_156_tail)).

% @attr waist_width_156
% @type numeric
% @canonical false
% @original_name waist width 156cm
% @unit mm
% @values v253=253.0 unk_waist_width_156=Unknown
% @importance 1.0

0.95::true_val(waist_width_156, v253); 0.05::true_val(waist_width_156, unk_waist_width_156).

0.95::acc(s1, waist_width_156).
0.95::acc(s2, waist_width_156).

measured(s1, waist_width_156, v253).
measured(s2, waist_width_156, v253).

all_consistent(waist_width_156) :-
    consistent(s1, waist_width_156),
    (indep(s2), consistent(s2, waist_width_156) ; \+indep(s2)).

evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v253)).
query(true_val(waist_width_156, unk_waist_width_156)).

% @attr sidecut_radius_size
% @type categorical
% @canonical true
% @original_name sidecut_radius_size (156)
% @unit m
% @values r8_2_6_2=8.2_6.2m unk_sidecut_radius_size=Unknown
% @importance 1.0

0.95::true_val(sidecut_radius_size, r8_2_6_2); 0.05::true_val(sidecut_radius_size, unk_sidecut_radius_size).

0.95::acc(s1, sidecut_radius_size).
0.95::acc(s2, sidecut_radius_size).

measured(s1, sidecut_radius_size, r8_2_6_2).
measured(s2, sidecut_radius_size, r8_2_6_2).

all_consistent(sidecut_radius_size) :-
    consistent(s1, sidecut_radius_size),
    (indep(s2), consistent(s2, sidecut_radius_size) ; \+indep(s2)).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, r8_2_6_2)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size (156)
% @unit kg
% @values w60_80=60_80kg_130_175lbs unk_recommended_weight_range_size=Unknown
% @importance 1.0

0.95::true_val(recommended_weight_range_size, w60_80); 0.05::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

0.95::acc(s1, recommended_weight_range_size).
0.95::acc(s2, recommended_weight_range_size).

measured(s1, recommended_weight_range_size, w60_80).
measured(s2, recommended_weight_range_size, w60_80).

all_consistent(recommended_weight_range_size) :-
    consistent(s1, recommended_weight_range_size),
    (indep(s2), consistent(s2, recommended_weight_range_size) ; \+indep(s2)).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w60_80)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr stance_width_range_size
% @type categorical
% @canonical true
% @original_name stance_width_range_size (156)
% @unit cm
% @values s48_60=48_60cm unk_stance_width_range_size=Unknown
% @importance 1.0

0.92::true_val(stance_width_range_size, s48_60); 0.08::true_val(stance_width_range_size, unk_stance_width_range_size).

0.95::acc(s2, stance_width_range_size).

measured(s2, stance_width_range_size, s48_60).

all_consistent(stance_width_range_size) :-
    (indep(s2), consistent(s2, stance_width_range_size) ; \+indep(s2)).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, s48_60)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr contact_length_size_159
% @type numeric
% @canonical false
% @original_name contact_length_size (159)
% @unit mm
% @values v1150=1150.0 unk_contact_length_size_159=Unknown
% @importance 1.0

0.95::true_val(contact_length_size_159, v1150); 0.05::true_val(contact_length_size_159, unk_contact_length_size_159).

0.95::acc(s1, contact_length_size_159).
0.95::acc(s2, contact_length_size_159).

measured(s1, contact_length_size_159, v1150).
measured(s2, contact_length_size_159, v1150).

all_consistent(contact_length_size_159) :-
    consistent(s1, contact_length_size_159),
    (indep(s2), consistent(s2, contact_length_size_159) ; \+indep(s2)).

evidence(all_consistent(contact_length_size_159)).
query(true_val(contact_length_size_159, v1150)).
query(true_val(contact_length_size_159, unk_contact_length_size_159)).

% @attr tip_tail_width_size_159_nose
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (159 nose)
% @unit mm
% @values v305=305.0 unk_tip_tail_width_size_159_nose=Unknown
% @importance 1.0

0.95::true_val(tip_tail_width_size_159_nose, v305); 0.05::true_val(tip_tail_width_size_159_nose, unk_tip_tail_width_size_159_nose).

0.95::acc(s1, tip_tail_width_size_159_nose).
0.95::acc(s2, tip_tail_width_size_159_nose).

measured(s1, tip_tail_width_size_159_nose, v305).
measured(s2, tip_tail_width_size_159_nose, v305).

all_consistent(tip_tail_width_size_159_nose) :-
    consistent(s1, tip_tail_width_size_159_nose),
    (indep(s2), consistent(s2, tip_tail_width_size_159_nose) ; \+indep(s2)).

evidence(all_consistent(tip_tail_width_size_159_nose)).
query(true_val(tip_tail_width_size_159_nose, v305)).
query(true_val(tip_tail_width_size_159_nose, unk_tip_tail_width_size_159_nose)).

% @attr tip_tail_width_size_159_tail
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (159 tail)
% @unit mm
% @values v299_159t=299.0 unk_tip_tail_width_size_159_tail=Unknown
% @importance 1.0

0.95::true_val(tip_tail_width_size_159_tail, v299_159t); 0.05::true_val(tip_tail_width_size_159_tail, unk_tip_tail_width_size_159_tail).

0.95::acc(s1, tip_tail_width_size_159_tail).
0.95::acc(s2, tip_tail_width_size_159_tail).

measured(s1, tip_tail_width_size_159_tail, v299_159t).
measured(s2, tip_tail_width_size_159_tail, v299_159t).

all_consistent(tip_tail_width_size_159_tail) :-
    consistent(s1, tip_tail_width_size_159_tail),
    (indep(s2), consistent(s2, tip_tail_width_size_159_tail) ; \+indep(s2)).

evidence(all_consistent(tip_tail_width_size_159_tail)).
query(true_val(tip_tail_width_size_159_tail, v299_159t)).
query(true_val(tip_tail_width_size_159_tail, unk_tip_tail_width_size_159_tail)).

% @attr waist_width_159
% @type numeric
% @canonical false
% @original_name waist width 159cm
% @unit mm
% @values v257=257.0 unk_waist_width_159=Unknown
% @importance 1.0

0.95::true_val(waist_width_159, v257); 0.05::true_val(waist_width_159, unk_waist_width_159).

0.95::acc(s1, waist_width_159).
0.95::acc(s2, waist_width_159).

measured(s1, waist_width_159, v257).
measured(s2, waist_width_159, v257).

all_consistent(waist_width_159) :-
    consistent(s1, waist_width_159),
    (indep(s2), consistent(s2, waist_width_159) ; \+indep(s2)).

evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v257)).
query(true_val(waist_width_159, unk_waist_width_159)).

% @attr sidecut_radius_size_159
% @type categorical
% @canonical false
% @original_name sidecut_radius_size (159)
% @unit m
% @values r8_4_6_4=8.4_6.4m unk_sidecut_radius_size_159=Unknown
% @importance 1.0

0.95::true_val(sidecut_radius_size_159, r8_4_6_4); 0.05::true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159).

0.95::acc(s1, sidecut_radius_size_159).
0.95::acc(s2, sidecut_radius_size_159).

measured(s1, sidecut_radius_size_159, r8_4_6_4).
measured(s2, sidecut_radius_size_159, r8_4_6_4).

all_consistent(sidecut_radius_size_159) :-
    consistent(s1, sidecut_radius_size_159),
    (indep(s2), consistent(s2, sidecut_radius_size_159) ; \+indep(s2)).

evidence(all_consistent(sidecut_radius_size_159)).
query(true_val(sidecut_radius_size_159, r8_4_6_4)).
query(true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159)).

% @attr recommended_weight_range_size_159
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (159)
% @unit kg
% @values w65_85=65_85kg_145_185lbs unk_recommended_weight_range_size_159=Unknown
% @importance 1.0

0.95::true_val(recommended_weight_range_size_159, w65_85); 0.05::true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159).

0.95::acc(s1, recommended_weight_range_size_159).
0.95::acc(s2, recommended_weight_range_size_159).

measured(s1, recommended_weight_range_size_159, w65_85).
measured(s2, recommended_weight_range_size_159, w65_85).

all_consistent(recommended_weight_range_size_159) :-
    consistent(s1, recommended_weight_range_size_159),
    (indep(s2), consistent(s2, recommended_weight_range_size_159) ; \+indep(s2)).

evidence(all_consistent(recommended_weight_range_size_159)).
query(true_val(recommended_weight_range_size_159, w65_85)).
query(true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159)).

% @attr stance_width_range_size_159
% @type categorical
% @canonical false
% @original_name stance_width_range_size (159)
% @unit cm
% @values s50_62=50_62cm unk_stance_width_range_size_159=Unknown
% @importance 1.0

0.92::true_val(stance_width_range_size_159, s50_62); 0.08::true_val(stance_width_range_size_159, unk_stance_width_range_size_159).

0.95::acc(s2, stance_width_range_size_159).

measured(s2, stance_width_range_size_159, s50_62).

all_consistent(stance_width_range_size_159) :-
    (indep(s2), consistent(s2, stance_width_range_size_159) ; \+indep(s2)).

evidence(all_consistent(stance_width_range_size_159)).
query(true_val(stance_width_range_size_159, s50_62)).
query(true_val(stance_width_range_size_159, unk_stance_width_range_size_159)).

% @attr tip_tail_width_size_163
% @type categorical
% @canonical false
% @original_name tip_tail_width_size (163)
% @unit mm
% @values v317_311=317_311mm unk_tip_tail_width_size_163=Unknown
% @importance 1.0

0.92::true_val(tip_tail_width_size_163, v317_311); 0.08::true_val(tip_tail_width_size_163, unk_tip_tail_width_size_163).

0.95::acc(s2, tip_tail_width_size_163).

measured(s2, tip_tail_width_size_163, v317_311).

all_consistent(tip_tail_width_size_163) :-
    (indep(s2), consistent(s2, tip_tail_width_size_163) ; \+indep(s2)).

evidence(all_consistent(tip_tail_width_size_163)).
query(true_val(tip_tail_width_size_163, v317_311)).
query(true_val(tip_tail_width_size_163, unk_tip_tail_width_size_163)).

% @attr waist_width_163
% @type numeric
% @canonical false
% @original_name waist width 163cm
% @unit mm
% @values v268=268.0 unk_waist_width_163=Unknown
% @importance 1.0

0.92::true_val(waist_width_163, v268); 0.08::true_val(waist_width_163, unk_waist_width_163).

0.95::acc(s2, waist_width_163).

measured(s2, waist_width_163, v268).

all_consistent(waist_width_163) :-
    (indep(s2), consistent(s2, waist_width_163) ; \+indep(s2)).

evidence(all_consistent(waist_width_163)).
query(true_val(waist_width_163, v268)).
query(true_val(waist_width_163, unk_waist_width_163)).

% @attr contact_length_size_163
% @type numeric
% @canonical false
% @original_name contact_length_size (163)
% @unit mm
% @values v1180=1180.0 unk_contact_length_size_163=Unknown
% @importance 1.0

0.92::true_val(contact_length_size_163, v1180); 0.08::true_val(contact_length_size_163, unk_contact_length_size_163).

0.95::acc(s2, contact_length_size_163).

measured(s2, contact_length_size_163, v1180).

all_consistent(contact_length_size_163) :-
    (indep(s2), consistent(s2, contact_length_size_163) ; \+indep(s2)).

evidence(all_consistent(contact_length_size_163)).
query(true_val(contact_length_size_163, v1180)).
query(true_val(contact_length_size_163, unk_contact_length_size_163)).

% @attr sidecut_radius_size_163
% @type categorical
% @canonical false
% @original_name sidecut_radius_size (163)
% @unit m
% @values r8_6_6_6=8.6_6.6m unk_sidecut_radius_size_163=Unknown
% @importance 1.0

0.92::true_val(sidecut_radius_size_163, r8_6_6_6); 0.08::true_val(sidecut_radius_size_163, unk_sidecut_radius_size_163).

0.95::acc(s2, sidecut_radius_size_163).

measured(s2, sidecut_radius_size_163, r8_6_6_6).

all_consistent(sidecut_radius_size_163) :-
    (indep(s2), consistent(s2, sidecut_radius_size_163) ; \+indep(s2)).

evidence(all_consistent(sidecut_radius_size_163)).
query(true_val(sidecut_radius_size_163, r8_6_6_6)).
query(true_val(sidecut_radius_size_163, unk_sidecut_radius_size_163)).

% @attr stance_width_range_size_163
% @type categorical
% @canonical false
% @original_name stance_width_range_size (163)
% @unit cm
% @values s50_62_163=50_62cm unk_stance_width_range_size_163=Unknown
% @importance 1.0

0.92::true_val(stance_width_range_size_163, s50_62_163); 0.08::true_val(stance_width_range_size_163, unk_stance_width_range_size_163).

0.95::acc(s2, stance_width_range_size_163).

measured(s2, stance_width_range_size_163, s50_62_163).

all_consistent(stance_width_range_size_163) :-
    (indep(s2), consistent(s2, stance_width_range_size_163) ; \+indep(s2)).

evidence(all_consistent(stance_width_range_size_163)).
query(true_val(stance_width_range_size_163, s50_62_163)).
query(true_val(stance_width_range_size_163, unk_stance_width_range_size_163)).

% @attr recommended_weight_range_size_163
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (163)
% @unit kg
% @values w70_plus=70_plus_kg_155_plus_lbs unk_recommended_weight_range_size_163=Unknown
% @importance 1.0

0.92::true_val(recommended_weight_range_size_163, w70_plus); 0.08::true_val(recommended_weight_range_size_163, unk_recommended_weight_range_size_163).

0.95::acc(s2, recommended_weight_range_size_163).

measured(s2, recommended_weight_range_size_163, w70_plus).

all_consistent(recommended_weight_range_size_163) :-
    (indep(s2), consistent(s2, recommended_weight_range_size_163) ; \+indep(s2)).

evidence(all_consistent(recommended_weight_range_size_163)).
query(true_val(recommended_weight_range_size_163, w70_plus)).
query(true_val(recommended_weight_range_size_163, unk_recommended_weight_range_size_163)).

% @attr variant_163_added
% @type categorical
% @canonical false
% @original_name 163cm wide variant added
% @values y2021_268mm=2021_waist_268mm unk_variant_163_added=Unknown
% @importance 0.6

0.63::true_val(variant_163_added, y2021_268mm); 0.37::true_val(variant_163_added, unk_variant_163_added).

0.82::acc(s10, variant_163_added).

measured(s10, variant_163_added, y2021_268mm).

all_consistent(variant_163_added) :-
    consistent(s10, variant_163_added).

evidence(all_consistent(variant_163_added)).
query(true_val(variant_163_added, y2021_268mm)).
query(true_val(variant_163_added, unk_variant_163_added)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values powercore_ii_poplar_beech=PowerCore_II_Poplar_Beech_stringers unk_core_material=Unknown
% @importance 1.0

0.95::true_val(core_material, powercore_ii_poplar_beech); 0.05::true_val(core_material, unk_core_material).

0.95::acc(s1, core_material).
0.95::acc(s2, core_material).

measured(s1, core_material, powercore_ii_poplar_beech).
measured(s2, core_material, powercore_ii_poplar_beech).

all_consistent(core_material) :-
    consistent(s1, core_material),
    (indep(s2), consistent(s2, core_material) ; \+indep(s2)).

evidence(all_consistent(core_material)).
query(true_val(core_material, powercore_ii_poplar_beech)).
query(true_val(core_material, unk_core_material)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification (FSC)
% @values fsc_certified=FSC_Certified_Wood_Core unk_sustainability_certification=Unknown
% @importance 1.0

0.92::true_val(sustainability_certification, fsc_certified); 0.08::true_val(sustainability_certification, unk_sustainability_certification).

0.95::acc(s2, sustainability_certification).

measured(s2, sustainability_certification, fsc_certified).

all_consistent(sustainability_certification) :-
    (indep(s2), consistent(s2, sustainability_certification) ; \+indep(s2)).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, fsc_certified)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values bi_lite_biaxial=Bi_Lite_Laminates_biaxial_fiberglass unk_laminate=Unknown
% @importance 1.0

0.95::true_val(laminate, bi_lite_biaxial); 0.05::true_val(laminate, unk_laminate).

0.95::acc(s1, laminate).
0.95::acc(s2, laminate).

measured(s1, laminate, bi_lite_biaxial).
measured(s2, laminate, bi_lite_biaxial).

all_consistent(laminate) :-
    consistent(s1, laminate),
    (indep(s2), consistent(s2, laminate) ; \+indep(s2)).

evidence(all_consistent(laminate)).
query(true_val(laminate, bi_lite_biaxial)).
query(true_val(laminate, unk_laminate)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_speed_hd=Sintered_Speed_Formula_HD_Base unk_base_material=Unknown
% @importance 1.0

0.95::true_val(base_material, sintered_speed_hd); 0.05::true_val(base_material, unk_base_material).

0.95::acc(s1, base_material).
0.95::acc(s2, base_material).

measured(s1, base_material, sintered_speed_hd).
measured(s2, base_material, sintered_speed_hd).

all_consistent(base_material) :-
    consistent(s1, base_material),
    (indep(s2), consistent(s2, base_material) ; \+indep(s2)).

evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_speed_hd)).
query(true_val(base_material, unk_base_material)).

% @attr base_description
% @type categorical
% @canonical false
% @original_name base description
% @values hard_fast_abrasion_resistant=Hard_fast_high_abrasion_resistance_wax_absorption unk_base_description=Unknown
% @importance 1.0

0.92::true_val(base_description, hard_fast_abrasion_resistant); 0.08::true_val(base_description, unk_base_description).

0.95::acc(s2, base_description).

measured(s2, base_description, hard_fast_abrasion_resistant).

all_consistent(base_description) :-
    (indep(s2), consistent(s2, base_description) ; \+indep(s2)).

evidence(all_consistent(base_description)).
query(true_val(base_description, hard_fast_abrasion_resistant)).
query(true_val(base_description, unk_base_description)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values abs_flexible=ABS_flexible_impact_resistant unk_sidewall_material=Unknown
% @importance 1.0

0.95::true_val(sidewall_material, abs_flexible); 0.05::true_val(sidewall_material, unk_sidewall_material).

0.95::acc(s1, sidewall_material).
0.95::acc(s2, sidewall_material).

measured(s1, sidewall_material, abs_flexible).
measured(s2, sidewall_material, abs_flexible).

all_consistent(sidewall_material) :-
    consistent(s1, sidewall_material),
    (indep(s2), consistent(s2, sidewall_material) ; \+indep(s2)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, abs_flexible)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr sustainability_certification_abs_recycled
% @type categorical
% @canonical false
% @original_name sustainability_certification (ABS recycled)
% @values abs_35_recycled=ABS_sidewalls_35_percent_recycled_polymers unk_sustainability_certification_abs_recycled=Unknown
% @importance 1.0

0.92::true_val(sustainability_certification_abs_recycled, abs_35_recycled); 0.08::true_val(sustainability_certification_abs_recycled, unk_sustainability_certification_abs_recycled).

0.95::acc(s2, sustainability_certification_abs_recycled).

measured(s2, sustainability_certification_abs_recycled, abs_35_recycled).

all_consistent(sustainability_certification_abs_recycled) :-
    (indep(s2), consistent(s2, sustainability_certification_abs_recycled) ; \+indep(s2)).

evidence(all_consistent(sustainability_certification_abs_recycled)).
query(true_val(sustainability_certification_abs_recycled, abs_35_recycled)).
query(true_val(sustainability_certification_abs_recycled, unk_sustainability_certification_abs_recycled)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values recycled_steel_50=Recycled_Steel_Edge_50_percent unk_edge_technology=Unknown
% @importance 1.0

0.95::true_val(edge_technology, recycled_steel_50); 0.05::true_val(edge_technology, unk_edge_technology).

0.95::acc(s1, edge_technology).
0.95::acc(s2, edge_technology).

measured(s1, edge_technology, recycled_steel_50).
measured(s2, edge_technology, recycled_steel_50).

all_consistent(edge_technology) :-
    consistent(s1, edge_technology),
    (indep(s2), consistent(s2, edge_technology) ; \+indep(s2)).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, recycled_steel_50)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr factory_wax
% @type categorical
% @canonical false
% @original_name factory wax
% @values green_speed_natural=Green_Speed_Natural_Wax_100_biodegradable unk_factory_wax=Unknown
% @importance 0.75

0.74::true_val(factory_wax, green_speed_natural); 0.26::true_val(factory_wax, unk_factory_wax).

0.85::acc(s16, factory_wax).

measured(s16, factory_wax, green_speed_natural).

all_consistent(factory_wax) :-
    (indep(s16), consistent(s16, factory_wax) ; \+indep(s16)).

evidence(all_consistent(factory_wax)).
query(true_val(factory_wax, green_speed_natural)).
query(true_val(factory_wax, unk_factory_wax)).

% @attr sustainability_certification_solar
% @type categorical
% @canonical false
% @original_name sustainability_certification (solar)
% @values solar_100=Made_with_100_percent_solar_energy unk_sustainability_certification_solar=Unknown
% @importance 1.0

0.95::true_val(sustainability_certification_solar, solar_100); 0.05::true_val(sustainability_certification_solar, unk_sustainability_certification_solar).

0.95::acc(s1, sustainability_certification_solar).
0.95::acc(s2, sustainability_certification_solar).

measured(s1, sustainability_certification_solar, solar_100).
measured(s2, sustainability_certification_solar, solar_100).

all_consistent(sustainability_certification_solar) :-
    consistent(s1, sustainability_certification_solar),
    (indep(s2), consistent(s2, sustainability_certification_solar) ; \+indep(s2)).

evidence(all_consistent(sustainability_certification_solar)).
query(true_val(sustainability_certification_solar, solar_100)).
query(true_val(sustainability_certification_solar, unk_sustainability_certification_solar)).

% @attr sustainability_certification_recycled_raw
% @type categorical
% @canonical false
% @original_name sustainability_certification (recycled raw materials)
% @values yes_recycled_raw=Yes unk_sustainability_certification_recycled_raw=Unknown
% @importance 1.0

0.95::true_val(sustainability_certification_recycled_raw, yes_recycled_raw); 0.05::true_val(sustainability_certification_recycled_raw, unk_sustainability_certification_recycled_raw).

0.95::acc(s1, sustainability_certification_recycled_raw).
0.95::acc(s2, sustainability_certification_recycled_raw).

measured(s1, sustainability_certification_recycled_raw, yes_recycled_raw).
measured(s2, sustainability_certification_recycled_raw, yes_recycled_raw).

all_consistent(sustainability_certification_recycled_raw) :-
    consistent(s1, sustainability_certification_recycled_raw),
    (indep(s2), consistent(s2, sustainability_certification_recycled_raw) ; \+indep(s2)).

evidence(all_consistent(sustainability_certification_recycled_raw)).
query(true_val(sustainability_certification_recycled_raw, yes_recycled_raw)).
query(true_val(sustainability_certification_recycled_raw, unk_sustainability_certification_recycled_raw)).

% @attr sustainability_certification_water_inks
% @type categorical
% @canonical false
% @original_name sustainability_certification (water inks)
% @values water_based_inks=Water_based_inks unk_sustainability_certification_water_inks=Unknown
% @importance 1.0

0.95::true_val(sustainability_certification_water_inks, water_based_inks); 0.05::true_val(sustainability_certification_water_inks, unk_sustainability_certification_water_inks).

0.95::acc(s1, sustainability_certification_water_inks).
0.95::acc(s2, sustainability_certification_water_inks).

measured(s1, sustainability_certification_water_inks, water_based_inks).
measured(s2, sustainability_certification_water_inks, water_based_inks).

all_consistent(sustainability_certification_water_inks) :-
    consistent(s1, sustainability_certification_water_inks),
    (indep(s2), consistent(s2, sustainability_certification_water_inks) ; \+indep(s2)).

evidence(all_consistent(sustainability_certification_water_inks)).
query(true_val(sustainability_certification_water_inks, water_based_inks)).
query(true_val(sustainability_certification_water_inks, unk_sustainability_certification_water_inks)).

% @attr sustainability_certification_recycled_steel
% @type categorical
% @canonical false
% @original_name sustainability_certification (recycled steel)
% @values yes_recycled_steel=Yes unk_sustainability_certification_recycled_steel=Unknown
% @importance 1.0

0.95::true_val(sustainability_certification_recycled_steel, yes_recycled_steel); 0.05::true_val(sustainability_certification_recycled_steel, unk_sustainability_certification_recycled_steel).

0.95::acc(s1, sustainability_certification_recycled_steel).
0.95::acc(s2, sustainability_certification_recycled_steel).

measured(s1, sustainability_certification_recycled_steel, yes_recycled_steel).
measured(s2, sustainability_certification_recycled_steel, yes_recycled_steel).

all_consistent(sustainability_certification_recycled_steel) :-
    consistent(s1, sustainability_certification_recycled_steel),
    (indep(s2), consistent(s2, sustainability_certification_recycled_steel) ; \+indep(s2)).

evidence(all_consistent(sustainability_certification_recycled_steel)).
query(true_val(sustainability_certification_recycled_steel, yes_recycled_steel)).
query(true_val(sustainability_certification_recycled_steel, unk_sustainability_certification_recycled_steel)).

% @attr sustainability_certification_recycled_materials
% @type categorical
% @canonical false
% @original_name sustainability_certification (recycled materials general)
% @values yes_recycled_materials=Yes unk_sustainability_certification_recycled_materials=Unknown
% @importance 1.0

0.95::true_val(sustainability_certification_recycled_materials, yes_recycled_materials); 0.05::true_val(sustainability_certification_recycled_materials, unk_sustainability_certification_recycled_materials).

0.95::acc(s1, sustainability_certification_recycled_materials).
0.95::acc(s2, sustainability_certification_recycled_materials).

measured(s1, sustainability_certification_recycled_materials, yes_recycled_materials).
measured(s2, sustainability_certification_recycled_materials, yes_recycled_materials).

all_consistent(sustainability_certification_recycled_materials) :-
    consistent(s1, sustainability_certification_recycled_materials),
    (indep(s2), consistent(s2, sustainability_certification_recycled_materials) ; \+indep(s2)).

evidence(all_consistent(sustainability_certification_recycled_materials)).
query(true_val(sustainability_certification_recycled_materials, yes_recycled_materials)).
query(true_val(sustainability_certification_recycled_materials, unk_sustainability_certification_recycled_materials)).

% @attr sustainability_certification_carbon_footprint
% @type numeric
% @canonical false
% @original_name sustainability_certification (carbon footprint)
% @unit kg_CO2
% @values v32_2=32.2 unk_sustainability_certification_carbon_footprint=Unknown
% @importance 1.0

0.95::true_val(sustainability_certification_carbon_footprint, v32_2); 0.05::true_val(sustainability_certification_carbon_footprint, unk_sustainability_certification_carbon_footprint).

0.95::acc(s1, sustainability_certification_carbon_footprint).
0.95::acc(s2, sustainability_certification_carbon_footprint).

measured(s1, sustainability_certification_carbon_footprint, v32_2).
measured(s2, sustainability_certification_carbon_footprint, v32_2).

all_consistent(sustainability_certification_carbon_footprint) :-
    consistent(s1, sustainability_certification_carbon_footprint),
    (indep(s2), consistent(s2, sustainability_certification_carbon_footprint) ; \+indep(s2)).

evidence(all_consistent(sustainability_certification_carbon_footprint)).
query(true_val(sustainability_certification_carbon_footprint, v32_2)).
query(true_val(sustainability_certification_carbon_footprint, unk_sustainability_certification_carbon_footprint)).

% @attr sustainability_certification_climate_partner
% @type categorical
% @canonical false
% @original_name sustainability_certification (ClimatePartner)
% @values climate_partner=Partnership_with_ClimatePartner_lifecycle_carbon unk_sustainability_certification_climate_partner=Unknown
% @importance 0.4

0.77::true_val(sustainability_certification_climate_partner, climate_partner); 0.23::true_val(sustainability_certification_climate_partner, unk_sustainability_certification_climate_partner).

0.90::acc(s26, sustainability_certification_climate_partner).

measured(s26, sustainability_certification_climate_partner, climate_partner).

all_consistent(sustainability_certification_climate_partner) :-
    consistent(s26, sustainability_certification_climate_partner).

evidence(all_consistent(sustainability_certification_climate_partner)).
query(true_val(sustainability_certification_climate_partner, climate_partner)).
query(true_val(sustainability_certification_climate_partner, unk_sustainability_certification_climate_partner)).

% @attr price_aud_merchant
% @type numeric
% @canonical true
% @original_name price_aud_merchant (sale)
% @unit AUD
% @values v839_99=839.99 unk_price_aud_merchant=Unknown
% @importance 1.0

0.95::true_val(price_aud_merchant, v839_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).

0.95::acc(s1, price_aud_merchant).

measured(s1, price_aud_merchant, v839_99).

all_consistent(price_aud_merchant) :-
    consistent(s1, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v839_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_aud_merchant_rrp
% @type numeric
% @canonical false
% @original_name price_aud_merchant (RRP)
% @unit AUD
% @values v1049_99=1049.99 unk_price_aud_merchant_rrp=Unknown
% @importance 1.0

0.95::true_val(price_aud_merchant_rrp, v1049_99); 0.05::true_val(price_aud_merchant_rrp, unk_price_aud_merchant_rrp).

0.95::acc(s1, price_aud_merchant_rrp).

measured(s1, price_aud_merchant_rrp, v1049_99).

all_consistent(price_aud_merchant_rrp) :-
    consistent(s1, price_aud_merchant_rrp).

evidence(all_consistent(price_aud_merchant_rrp)).
query(true_val(price_aud_merchant_rrp, v1049_99)).
query(true_val(price_aud_merchant_rrp, unk_price_aud_merchant_rrp)).

% @attr merchant_discount
% @type numeric
% @canonical false
% @original_name merchant discount
% @unit percent
% @values v20=20.0 unk_merchant_discount=Unknown
% @importance 1.0

0.95::true_val(merchant_discount, v20); 0.05::true_val(merchant_discount, unk_merchant_discount).

0.95::acc(s1, merchant_discount).

measured(s1, merchant_discount, v20).

all_consistent(merchant_discount) :-
    consistent(s1, merchant_discount).

evidence(all_consistent(merchant_discount)).
query(true_val(merchant_discount, v20)).
query(true_val(merchant_discount, unk_merchant_discount)).

% @attr availability_status_nitro_au
% @type categorical
% @canonical false
% @original_name availability_status (Nitro AU)
% @values sold_out=Sold_out unk_availability_status_nitro_au=Unknown
% @importance 1.0

0.95::true_val(availability_status_nitro_au, sold_out); 0.05::true_val(availability_status_nitro_au, unk_availability_status_nitro_au).

0.95::acc(s1, availability_status_nitro_au).

measured(s1, availability_status_nitro_au, sold_out).

all_consistent(availability_status_nitro_au) :-
    consistent(s1, availability_status_nitro_au).

evidence(all_consistent(availability_status_nitro_au)).
query(true_val(availability_status_nitro_au, sold_out)).
query(true_val(availability_status_nitro_au, unk_availability_status_nitro_au)).

% @attr merchant_sku
% @type categorical
% @canonical false
% @original_name merchant SKU
% @values sku_833217_001_156=833217_001_156 unk_merchant_sku=Unknown
% @importance 1.0

0.95::true_val(merchant_sku, sku_833217_001_156); 0.05::true_val(merchant_sku, unk_merchant_sku).

0.95::acc(s1, merchant_sku).

measured(s1, merchant_sku, sku_833217_001_156).

all_consistent(merchant_sku) :-
    consistent(s1, merchant_sku).

evidence(all_consistent(merchant_sku)).
query(true_val(merchant_sku, sku_833217_001_156)).
query(true_val(merchant_sku, unk_merchant_sku)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v499=499.0 v529_99=529.99 v609_95=609.95
% @importance 0.9

0.20::true_val(price_usd_msrp, v499); 0.15::true_val(price_usd_msrp, v529_99); 0.65::true_val(price_usd_msrp, v609_95).

0.70::acc(s27, price_usd_msrp).
0.65::acc(s30, price_usd_msrp).
0.90::acc(s28, price_usd_msrp).
0.88::acc(s29, price_usd_msrp).

measured(s27, price_usd_msrp, v499).
measured(s30, price_usd_msrp, v529_99).
measured(s28, price_usd_msrp, v609_95).
measured(s29, price_usd_msrp, v609_95).

all_consistent(price_usd_msrp) :-
    consistent(s27, price_usd_msrp),
    consistent(s30, price_usd_msrp),
    consistent(s28, price_usd_msrp),
    consistent(s29, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v499)).
query(true_val(price_usd_msrp, v529_99)).
query(true_val(price_usd_msrp, v609_95)).

% @attr price_usd_rei_full
% @type numeric
% @canonical false
% @original_name price_usd_rei (full retail)
% @unit USD
% @values v609_95_rei=609.95 unk_price_usd_rei_full=Unknown
% @importance 0.95

0.86::true_val(price_usd_rei_full, v609_95_rei); 0.14::true_val(price_usd_rei_full, unk_price_usd_rei_full).

0.92::acc(s28, price_usd_rei_full).

measured(s28, price_usd_rei_full, v609_95_rei).

all_consistent(price_usd_rei_full) :-
    consistent(s28, price_usd_rei_full).

evidence(all_consistent(price_usd_rei_full)).
query(true_val(price_usd_rei_full, v609_95_rei)).
query(true_val(price_usd_rei_full, unk_price_usd_rei_full)).

% @attr price_usd_evo_full
% @type numeric
% @canonical false
% @original_name price_usd_evo (full retail)
% @unit USD
% @values v609_95_evo=609.95 unk_price_usd_evo_full=Unknown
% @importance 0.95

0.81::true_val(price_usd_evo_full, v609_95_evo); 0.19::true_val(price_usd_evo_full, unk_price_usd_evo_full).

0.90::acc(s29, price_usd_evo_full).

measured(s29, price_usd_evo_full, v609_95_evo).

all_consistent(price_usd_evo_full) :-
    consistent(s29, price_usd_evo_full).

evidence(all_consistent(price_usd_evo_full)).
query(true_val(price_usd_evo_full, v609_95_evo)).
query(true_val(price_usd_evo_full, unk_price_usd_evo_full)).

% @attr price_eur_blue_tomato
% @type numeric
% @canonical true
% @original_name price_eur_blue_tomato
% @unit EUR
% @values v639_90=639.90 unk_price_eur_blue_tomato=Unknown
% @importance 0.8

0.67::true_val(price_eur_blue_tomato, v639_90); 0.33::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).

0.85::acc(s31, price_eur_blue_tomato).

measured(s31, price_eur_blue_tomato, v639_90).

all_consistent(price_eur_blue_tomato) :-
    consistent(s31, price_eur_blue_tomato).

evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v639_90)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

% @attr price_cad_prfo
% @type numeric
% @canonical true
% @original_name price_cad_prfo
% @unit CAD
% @values v559_99=559.99 unk_price_cad_prfo=Unknown
% @importance 0.85

0.60::true_val(price_cad_prfo, v559_99); 0.40::true_val(price_cad_prfo, unk_price_cad_prfo).

0.78::acc(s32, price_cad_prfo).

measured(s32, price_cad_prfo, v559_99).

all_consistent(price_cad_prfo) :-
    consistent(s32, price_cad_prfo).

evidence(all_consistent(price_cad_prfo)).
query(true_val(price_cad_prfo, v559_99)).
query(true_val(price_cad_prfo, unk_price_cad_prfo)).

% @attr price_cad_rudeboys
% @type numeric
% @canonical false
% @original_name CAD price (Rudeboys, Banff)
% @unit CAD
% @values v699_95=699.95 unk_price_cad_rudeboys=Unknown
% @importance 0.8

0.63::true_val(price_cad_rudeboys, v699_95); 0.37::true_val(price_cad_rudeboys, unk_price_cad_rudeboys).

0.82::acc(s33, price_cad_rudeboys).

measured(s33, price_cad_rudeboys, v699_95).

all_consistent(price_cad_rudeboys) :-
    (indep(s33), consistent(s33, price_cad_rudeboys) ; \+indep(s33)).

evidence(all_consistent(price_cad_rudeboys)).
query(true_val(price_cad_rudeboys, v699_95)).
query(true_val(price_cad_rudeboys, unk_price_cad_rudeboys)).

% @attr price_gbp_blue_tomato_uk
% @type numeric
% @canonical true
% @original_name price_gbp_blue_tomato_uk
% @unit GBP
% @values v570=570.0 unk_price_gbp_blue_tomato_uk=Unknown
% @importance 0.85

0.60::true_val(price_gbp_blue_tomato_uk, v570); 0.40::true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk).

0.78::acc(s30, price_gbp_blue_tomato_uk).

measured(s30, price_gbp_blue_tomato_uk, v570).

all_consistent(price_gbp_blue_tomato_uk) :-
    consistent(s30, price_gbp_blue_tomato_uk).

evidence(all_consistent(price_gbp_blue_tomato_uk)).
query(true_val(price_gbp_blue_tomato_uk, v570)).
query(true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk)).

% @attr price_usd_evo
% @type numeric
% @canonical true
% @original_name price_usd_evo (sale)
% @unit USD
% @values v426_90=426.90 unk_price_usd_evo=Unknown
% @importance 0.95

0.81::true_val(price_usd_evo, v426_90); 0.19::true_val(price_usd_evo, unk_price_usd_evo).

0.88::acc(s29, price_usd_evo).

measured(s29, price_usd_evo, v426_90).

all_consistent(price_usd_evo) :-
    consistent(s29, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v426_90)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_blauer
% @type numeric
% @canonical false
% @original_name USD sale price (Blauer Board Shop)
% @unit USD
% @values v426_97=426.97 unk_price_usd_blauer=Unknown
% @importance 0.9

0.60::true_val(price_usd_blauer, v426_97); 0.40::true_val(price_usd_blauer, unk_price_usd_blauer).

0.78::acc(s34, price_usd_blauer).

measured(s34, price_usd_blauer, v426_97).

all_consistent(price_usd_blauer) :-
    consistent(s34, price_usd_blauer).

evidence(all_consistent(price_usd_blauer)).
query(true_val(price_usd_blauer, v426_97)).
query(true_val(price_usd_blauer, unk_price_usd_blauer)).

% @attr price_usd_rei
% @type numeric
% @canonical true
% @original_name price_usd_rei (sale)
% @unit USD
% @values v426_83=426.83 unk_price_usd_rei=Unknown
% @importance 0.9

0.60::true_val(price_usd_rei, v426_83); 0.40::true_val(price_usd_rei, unk_price_usd_rei).

0.78::acc(s35, price_usd_rei).

measured(s35, price_usd_rei, v426_83).

all_consistent(price_usd_rei) :-
    consistent(s35, price_usd_rei).

evidence(all_consistent(price_usd_rei)).
query(true_val(price_usd_rei, v426_83)).
query(true_val(price_usd_rei, unk_price_usd_rei)).

% @attr price_usd_backcountry
% @type numeric
% @canonical true
% @original_name price_usd_backcountry
% @unit USD
% @values v426_97_bc=426.97 unk_price_usd_backcountry=Unknown
% @importance 0.9

0.60::true_val(price_usd_backcountry, v426_97_bc); 0.40::true_val(price_usd_backcountry, unk_price_usd_backcountry).

0.78::acc(s34, price_usd_backcountry).

measured(s34, price_usd_backcountry, v426_97_bc).

all_consistent(price_usd_backcountry) :-
    consistent(s34, price_usd_backcountry).

evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v426_97_bc)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

% @attr price_eur_boardsports_sale
% @type numeric
% @canonical false
% @original_name EUR sale price (boardsports.eu)
% @unit EUR
% @values v447_50=447.50 unk_price_eur_boardsports_sale=Unknown
% @importance 0.8

0.55::true_val(price_eur_boardsports_sale, v447_50); 0.45::true_val(price_eur_boardsports_sale, unk_price_eur_boardsports_sale).

0.75::acc(s36, price_eur_boardsports_sale).

measured(s36, price_eur_boardsports_sale, v447_50).

all_consistent(price_eur_boardsports_sale) :-
    consistent(s36, price_eur_boardsports_sale).

evidence(all_consistent(price_eur_boardsports_sale)).
query(true_val(price_eur_boardsports_sale, v447_50)).
query(true_val(price_eur_boardsports_sale, unk_price_eur_boardsports_sale)).

% @attr price_usd_freeride
% @type numeric
% @canonical false
% @original_name USD price (Freeride Boardshop)
% @unit USD
% @values v507=507.0 unk_price_usd_freeride=Unknown
% @importance 0.8

0.59::true_val(price_usd_freeride, v507); 0.41::true_val(price_usd_freeride, unk_price_usd_freeride).

0.75::acc(s37, price_usd_freeride).

measured(s37, price_usd_freeride, v507).

all_consistent(price_usd_freeride) :-
    (indep(s15), consistent(s15, price_usd_freeride) ; \+indep(s15)).

evidence(all_consistent(price_usd_freeride)).
query(true_val(price_usd_freeride, v507)).
query(true_val(price_usd_freeride, unk_price_usd_freeride)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status (evo)
% @values in_stock_2026=In_stock_2026_evo unk_availability_status=Unknown
% @importance 0.95

0.81::true_val(availability_status, in_stock_2026); 0.19::true_val(availability_status, unk_availability_status).

0.88::acc(s29, availability_status).

measured(s29, availability_status, in_stock_2026).

all_consistent(availability_status) :-
    consistent(s29, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, in_stock_2026)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_rei
% @type categorical
% @canonical false
% @original_name availability_status (REI)
% @values pre_order=Pre_order_status unk_availability_status_rei=Unknown
% @importance 0.95

0.86::true_val(availability_status_rei, pre_order); 0.14::true_val(availability_status_rei, unk_availability_status_rei).

0.90::acc(s28, availability_status_rei).

measured(s28, availability_status_rei, pre_order).

all_consistent(availability_status_rei) :-
    consistent(s28, availability_status_rei).

evidence(all_consistent(availability_status_rei)).
query(true_val(availability_status_rei, pre_order)).
query(true_val(availability_status_rei, unk_availability_status_rei)).

% @attr availability_status_backcountry
% @type categorical
% @canonical false
% @original_name availability_status (Backcountry)
% @values available_bc=Available unk_availability_status_backcountry=Unknown
% @importance 0.9

0.60::true_val(availability_status_backcountry, available_bc); 0.40::true_val(availability_status_backcountry, unk_availability_status_backcountry).

0.78::acc(s34, availability_status_backcountry).

measured(s34, availability_status_backcountry, available_bc).

all_consistent(availability_status_backcountry) :-
    consistent(s34, availability_status_backcountry).

evidence(all_consistent(availability_status_backcountry)).
query(true_val(availability_status_backcountry, available_bc)).
query(true_val(availability_status_backcountry, unk_availability_status_backcountry)).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status (Blauer Board Shop)
% @values available_blauer=Available unk_availability_status_blauer=Unknown
% @importance 0.9

0.60::true_val(availability_status_blauer, available_blauer); 0.40::true_val(availability_status_blauer, unk_availability_status_blauer).

0.78::acc(s34, availability_status_blauer).

measured(s34, availability_status_blauer, available_blauer).

all_consistent(availability_status_blauer) :-
    consistent(s34, availability_status_blauer).

evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, available_blauer)).
query(true_val(availability_status_blauer, unk_availability_status_blauer)).

% @attr availability_status_freeride
% @type categorical
% @canonical false
% @original_name availability_status (Freeride Boardshop)
% @values available_freeride=Available_507USD unk_availability_status_freeride=Unknown
% @importance 0.8

0.59::true_val(availability_status_freeride, available_freeride); 0.41::true_val(availability_status_freeride, unk_availability_status_freeride).

0.75::acc(s37, availability_status_freeride).

measured(s37, availability_status_freeride, available_freeride).

all_consistent(availability_status_freeride) :-
    consistent(s37, availability_status_freeride).

evidence(all_consistent(availability_status_freeride)).
query(true_val(availability_status_freeride, available_freeride)).
query(true_val(availability_status_freeride, unk_availability_status_freeride)).

% @attr availability_status_rudeboys
% @type categorical
% @canonical false
% @original_name availability_status (Rudeboys Banff)
% @values available_rudeboys=Available_699_95CAD unk_availability_status_rudeboys=Unknown
% @importance 0.8

0.63::true_val(availability_status_rudeboys, available_rudeboys); 0.37::true_val(availability_status_rudeboys, unk_availability_status_rudeboys).

0.80::acc(s33, availability_status_rudeboys).

measured(s33, availability_status_rudeboys, available_rudeboys).

all_consistent(availability_status_rudeboys) :-
    (indep(s33), consistent(s33, availability_status_rudeboys) ; \+indep(s33)).

evidence(all_consistent(availability_status_rudeboys)).
query(true_val(availability_status_rudeboys, available_rudeboys)).
query(true_val(availability_status_rudeboys, unk_availability_status_rudeboys)).

% @attr availability_status_source_boards
% @type categorical
% @canonical false
% @original_name availability_status (The Source Snowboard)
% @values available_source=Available unk_availability_status_source_boards=Unknown
% @importance 0.5

0.60::true_val(availability_status_source_boards, available_source); 0.40::true_val(availability_status_source_boards, unk_availability_status_source_boards).

0.75::acc(s38, availability_status_source_boards).

measured(s38, availability_status_source_boards, available_source).

all_consistent(availability_status_source_boards) :-
    (indep(s38), consistent(s38, availability_status_source_boards) ; \+indep(s38)).

evidence(all_consistent(availability_status_source_boards)).
query(true_val(availability_status_source_boards, available_source)).
query(true_val(availability_status_source_boards, unk_availability_status_source_boards)).

% @attr availability_status_milosport
% @type categorical
% @canonical false
% @original_name availability_status (Milosport)
% @values available_milosport=Available unk_availability_status_milosport=Unknown
% @importance 0.4

0.35::true_val(availability_status_milosport, available_milosport); 0.65::true_val(availability_status_milosport, unk_availability_status_milosport).

0.60::acc(s39, availability_status_milosport).

measured(s39, availability_status_milosport, available_milosport).

all_consistent(availability_status_milosport) :-
    (indep(s39), consistent(s39, availability_status_milosport) ; \+indep(s39)).

evidence(all_consistent(availability_status_milosport)).
query(true_val(availability_status_milosport, available_milosport)).
query(true_val(availability_status_milosport, unk_availability_status_milosport)).

% @attr availability_status_boardsports_eu
% @type categorical
% @canonical false
% @original_name availability_status (boardsports.eu)
% @values available_sale_447=Available_447_50EUR_sale unk_availability_status_boardsports_eu=Unknown
% @importance 0.8

0.55::true_val(availability_status_boardsports_eu, available_sale_447); 0.45::true_val(availability_status_boardsports_eu, unk_availability_status_boardsports_eu).

0.75::acc(s36, availability_status_boardsports_eu).

measured(s36, availability_status_boardsports_eu, available_sale_447).

all_consistent(availability_status_boardsports_eu) :-
    consistent(s36, availability_status_boardsports_eu).

evidence(all_consistent(availability_status_boardsports_eu)).
query(true_val(availability_status_boardsports_eu, available_sale_447)).
query(true_val(availability_status_boardsports_eu, unk_availability_status_boardsports_eu)).

% @attr availability_status_zezula
% @type categorical
% @canonical false
% @original_name availability_status (Snowboard Zezula)
% @values available_511_90=Available_511_90EUR_20pct_off unk_availability_status_zezula=Unknown
% @importance 0.7

0.59::true_val(availability_status_zezula, available_511_90); 0.41::true_val(availability_status_zezula, unk_availability_status_zezula).

0.78::acc(s40, availability_status_zezula).

measured(s40, availability_status_zezula, available_511_90).

all_consistent(availability_status_zezula) :-
    consistent(s40, availability_status_zezula).

evidence(all_consistent(availability_status_zezula)).
query(true_val(availability_status_zezula, available_511_90)).
query(true_val(availability_status_zezula, unk_availability_status_zezula)).

% @attr availability_status_snowcountry
% @type categorical
% @canonical false
% @original_name availability_status (SnowCountry.eu)
% @values available_snowcountry=Available unk_availability_status_snowcountry=Unknown
% @importance 0.85

0.60::true_val(availability_status_snowcountry, available_snowcountry); 0.40::true_val(availability_status_snowcountry, unk_availability_status_snowcountry).

0.78::acc(s32, availability_status_snowcountry).

measured(s32, availability_status_snowcountry, available_snowcountry).

all_consistent(availability_status_snowcountry) :-
    consistent(s32, availability_status_snowcountry).

evidence(all_consistent(availability_status_snowcountry)).
query(true_val(availability_status_snowcountry, available_snowcountry)).
query(true_val(availability_status_snowcountry, unk_availability_status_snowcountry)).

% @attr availability_status_ebay
% @type categorical
% @canonical false
% @original_name availability_status (eBay)
% @values available_ebay_609=Available_609_95_via_Backcountry unk_availability_status_ebay=Unknown
% @importance 0.6

0.40::true_val(availability_status_ebay, available_ebay_609); 0.60::true_val(availability_status_ebay, unk_availability_status_ebay).

0.55::acc(s41, availability_status_ebay).

measured(s41, availability_status_ebay, available_ebay_609).

all_consistent(availability_status_ebay) :-
    (indep(s41), consistent(s41, availability_status_ebay) ; \+indep(s41)).

evidence(all_consistent(availability_status_ebay)).
query(true_val(availability_status_ebay, available_ebay_609)).
query(true_val(availability_status_ebay, unk_availability_status_ebay)).

% @attr manufacturer_direct
% @type categorical
% @canonical false
% @original_name manufacturer direct
% @values no_us_direct_eu_639_90=No_US_direct_EU_direct_639_90EUR unk_manufacturer_direct=Unknown
% @importance 1.0

0.92::true_val(manufacturer_direct, no_us_direct_eu_639_90); 0.08::true_val(manufacturer_direct, unk_manufacturer_direct).

0.95::acc(s2, manufacturer_direct).

measured(s2, manufacturer_direct, no_us_direct_eu_639_90).

all_consistent(manufacturer_direct) :-
    (indep(s2), consistent(s2, manufacturer_direct) ; \+indep(s2)).

evidence(all_consistent(manufacturer_direct)).
query(true_val(manufacturer_direct, no_us_direct_eu_639_90)).
query(true_val(manufacturer_direct, unk_manufacturer_direct)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values two_year_limited=2_year_limited_warranty_structural_defects unk_warranty=Unknown
% @importance 0.7

0.90::true_val(warranty, two_year_limited); 0.10::true_val(warranty, unk_warranty).

0.95::acc(s42, warranty).

measured(s42, warranty, two_year_limited).

all_consistent(warranty) :-
    consistent(s42, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, two_year_limited)).
query(true_val(warranty, unk_warranty)).

% @attr warranty_transferable
% @type categorical
% @canonical false
% @original_name warranty (transferable)
% @values not_transferable=No_original_purchaser_only unk_warranty_transferable=Unknown
% @importance 0.65

0.90::true_val(warranty_transferable, not_transferable); 0.10::true_val(warranty_transferable, unk_warranty_transferable).

0.95::acc(s43, warranty_transferable).

measured(s43, warranty_transferable, not_transferable).

all_consistent(warranty_transferable) :-
    consistent(s43, warranty_transferable).

evidence(all_consistent(warranty_transferable)).
query(true_val(warranty_transferable, not_transferable)).
query(true_val(warranty_transferable, unk_warranty_transferable)).

% @attr warranty_process
% @type categorical
% @canonical false
% @original_name warranty (process)
% @values dealer_repair_replace=Through_dealer_repair_or_replace_at_Nitro_discretion unk_warranty_process=Unknown
% @importance 0.65

0.90::true_val(warranty_process, dealer_repair_replace); 0.10::true_val(warranty_process, unk_warranty_process).

0.95::acc(s43, warranty_process).

measured(s43, warranty_process, dealer_repair_replace).

all_consistent(warranty_process) :-
    consistent(s43, warranty_process).

evidence(all_consistent(warranty_process)).
query(true_val(warranty_process, dealer_repair_replace)).
query(true_val(warranty_process, unk_warranty_process)).

% @attr carving_rating_tgr
% @type categorical
% @canonical true
% @original_name carving_rating_tgr
% @values great=Great unk_carving_rating_tgr=Unknown
% @importance 0.9

0.74::true_val(carving_rating_tgr, great); 0.26::true_val(carving_rating_tgr, unk_carving_rating_tgr).

0.88::acc(s17, carving_rating_tgr).

measured(s17, carving_rating_tgr, great).

all_consistent(carving_rating_tgr) :-
    consistent(s17, carving_rating_tgr).

evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, great)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

% @attr speed_rating_tgr
% @type categorical
% @canonical true
% @original_name speed_rating_tgr
% @values great=Great unk_speed_rating_tgr=Unknown
% @importance 0.9

0.74::true_val(speed_rating_tgr, great_spd); 0.26::true_val(speed_rating_tgr, unk_speed_rating_tgr).

0.88::acc(s17, speed_rating_tgr).

measured(s17, speed_rating_tgr, great_spd).

all_consistent(speed_rating_tgr) :-
    consistent(s17, speed_rating_tgr).

evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, great_spd)).
query(true_val(speed_rating_tgr, unk_speed_rating_tgr)).

% @attr powder_rating_tgr
% @type categorical
% @canonical true
% @original_name powder_rating_tgr
% @values good=Good unk_powder_rating_tgr=Unknown
% @importance 0.9

0.74::true_val(powder_rating_tgr, good_pow); 0.26::true_val(powder_rating_tgr, unk_powder_rating_tgr).

0.88::acc(s17, powder_rating_tgr).

measured(s17, powder_rating_tgr, good_pow).

all_consistent(powder_rating_tgr) :-
    consistent(s17, powder_rating_tgr).

evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, good_pow)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values good=Good unk_base_glide_performance=Unknown
% @importance 0.9

0.74::true_val(base_glide_performance, good_glide); 0.26::true_val(base_glide_performance, unk_base_glide_performance).

0.88::acc(s17, base_glide_performance).

measured(s17, base_glide_performance, good_glide).

all_consistent(base_glide_performance) :-
    consistent(s17, base_glide_performance).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, good_glide)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride (uneven snow)
% @values good_uneven=Good unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.9

0.74::true_val(reviewer_opinion_the_good_ride, good_uneven); 0.26::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

0.88::acc(s17, reviewer_opinion_the_good_ride).

measured(s17, reviewer_opinion_the_good_ride, good_uneven).

all_consistent(reviewer_opinion_the_good_ride) :-
    consistent(s17, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, good_uneven)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values poor=Poor unk_switch_riding=Unknown
% @importance 0.9

0.74::true_val(switch_riding, poor); 0.26::true_val(switch_riding, unk_switch_riding).

0.88::acc(s17, switch_riding).

measured(s17, switch_riding, poor).

all_consistent(switch_riding) :-
    consistent(s17, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, poor)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr jumps_rating_tgr
% @type categorical
% @canonical true
% @original_name jumps_rating_tgr
% @values good=Good unk_jumps_rating_tgr=Unknown
% @importance 0.9

0.74::true_val(jumps_rating_tgr, good_jumps); 0.26::true_val(jumps_rating_tgr, unk_jumps_rating_tgr).

0.88::acc(s17, jumps_rating_tgr).

measured(s17, jumps_rating_tgr, good_jumps).

all_consistent(jumps_rating_tgr) :-
    consistent(s17, jumps_rating_tgr).

evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, good_jumps)).
query(true_val(jumps_rating_tgr, unk_jumps_rating_tgr)).

% @attr jibbing_rating_tgr
% @type categorical
% @canonical true
% @original_name jibbing_rating_tgr
% @values poor=Poor unk_jibbing_rating_tgr=Unknown
% @importance 0.9

0.74::true_val(jibbing_rating_tgr, poor_jib); 0.26::true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr).

0.88::acc(s17, jibbing_rating_tgr).

measured(s17, jibbing_rating_tgr, poor_jib).

all_consistent(jibbing_rating_tgr) :-
    consistent(s17, jibbing_rating_tgr).

evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, poor_jib)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr)).

% @attr pipe_rating_tgr
% @type categorical
% @canonical true
% @original_name pipe_rating_tgr
% @values average=Average unk_pipe_rating_tgr=Unknown
% @importance 0.9

0.74::true_val(pipe_rating_tgr, average_pipe); 0.26::true_val(pipe_rating_tgr, unk_pipe_rating_tgr).

0.88::acc(s17, pipe_rating_tgr).

measured(s17, pipe_rating_tgr, average_pipe).

all_consistent(pipe_rating_tgr) :-
    consistent(s17, pipe_rating_tgr).

evidence(all_consistent(pipe_rating_tgr)).
query(true_val(pipe_rating_tgr, average_pipe)).
query(true_val(pipe_rating_tgr, unk_pipe_rating_tgr)).

% @attr on_snow_feel_tgr
% @type categorical
% @canonical false
% @original_name on_snow_feel_tgr
% @values locked_in=Locked_In unk_on_snow_feel_tgr=Unknown
% @importance 0.9

0.74::true_val(on_snow_feel_tgr, locked_in); 0.26::true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr).

0.88::acc(s17, on_snow_feel_tgr).

measured(s17, on_snow_feel_tgr, locked_in).

all_consistent(on_snow_feel_tgr) :-
    consistent(s17, on_snow_feel_tgr).

evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, locked_in)).
query(true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values medium=Medium unk_turn_initiation_performance=Unknown
% @importance 0.9

0.74::true_val(turn_initiation_performance, medium_turn); 0.26::true_val(turn_initiation_performance, unk_turn_initiation_performance).

0.88::acc(s17, turn_initiation_performance).

measured(s17, turn_initiation_performance, medium_turn).

all_consistent(turn_initiation_performance) :-
    consistent(s17, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, medium_turn)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr reviewer_opinion_the_good_ride_skidded_turns
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (skidded turns)
% @values semi_hard=Semi_Hard unk_reviewer_opinion_the_good_ride_skidded_turns=Unknown
% @importance 0.9

0.74::true_val(reviewer_opinion_the_good_ride_skidded_turns, semi_hard); 0.26::true_val(reviewer_opinion_the_good_ride_skidded_turns, unk_reviewer_opinion_the_good_ride_skidded_turns).

0.88::acc(s17, reviewer_opinion_the_good_ride_skidded_turns).

measured(s17, reviewer_opinion_the_good_ride_skidded_turns, semi_hard).

all_consistent(reviewer_opinion_the_good_ride_skidded_turns) :-
    consistent(s17, reviewer_opinion_the_good_ride_skidded_turns).

evidence(all_consistent(reviewer_opinion_the_good_ride_skidded_turns)).
query(true_val(reviewer_opinion_the_good_ride_skidded_turns, semi_hard)).
query(true_val(reviewer_opinion_the_good_ride_skidded_turns, unk_reviewer_opinion_the_good_ride_skidded_turns)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values hard_snow=Hard_Snow unk_edge_hold=Unknown
% @importance 0.9

0.74::true_val(edge_hold, hard_snow); 0.26::true_val(edge_hold, unk_edge_hold).

0.88::acc(s17, edge_hold).

measured(s17, edge_hold, hard_snow).

all_consistent(edge_hold) :-
    consistent(s17, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, hard_snow)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr reviewer_opinion_the_good_ride_buttering
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (buttering)
% @values semi_hard_butter=Semi_Hard unk_reviewer_opinion_the_good_ride_buttering=Unknown
% @importance 0.9

0.74::true_val(reviewer_opinion_the_good_ride_buttering, semi_hard_butter); 0.26::true_val(reviewer_opinion_the_good_ride_buttering, unk_reviewer_opinion_the_good_ride_buttering).

0.88::acc(s17, reviewer_opinion_the_good_ride_buttering).

measured(s17, reviewer_opinion_the_good_ride_buttering, semi_hard_butter).

all_consistent(reviewer_opinion_the_good_ride_buttering) :-
    consistent(s17, reviewer_opinion_the_good_ride_buttering).

evidence(all_consistent(reviewer_opinion_the_good_ride_buttering)).
query(true_val(reviewer_opinion_the_good_ride_buttering, semi_hard_butter)).
query(true_val(reviewer_opinion_the_good_ride_buttering, unk_reviewer_opinion_the_good_ride_buttering)).

% @attr approximate_weight_feel
% @type categorical
% @canonical false
% @original_name approximate weight feel
% @values normal_light=Feels_normal_touch_light unk_approximate_weight_feel=Unknown
% @importance 0.5

0.60::true_val(approximate_weight_feel, normal_light); 0.40::true_val(approximate_weight_feel, unk_approximate_weight_feel).

0.80::acc(s44, approximate_weight_feel).

measured(s44, approximate_weight_feel, normal_light).

all_consistent(approximate_weight_feel) :-
    consistent(s44, approximate_weight_feel).

evidence(all_consistent(approximate_weight_feel)).
query(true_val(approximate_weight_feel, normal_light)).
query(true_val(approximate_weight_feel, unk_approximate_weight_feel)).

% @attr boot_size_fit_156
% @type categorical
% @canonical false
% @original_name boot size fit 156cm
% @unit US
% @values us8_5_9_5=8_5_to_9_5_US unk_boot_size_fit_156=Unknown
% @importance 0.9

0.74::true_val(boot_size_fit_156, us8_5_9_5); 0.26::true_val(boot_size_fit_156, unk_boot_size_fit_156).

0.85::acc(s17, boot_size_fit_156).

measured(s17, boot_size_fit_156, us8_5_9_5).

all_consistent(boot_size_fit_156) :-
    consistent(s17, boot_size_fit_156).

evidence(all_consistent(boot_size_fit_156)).
query(true_val(boot_size_fit_156, us8_5_9_5)).
query(true_val(boot_size_fit_156, unk_boot_size_fit_156)).

% @attr boot_size_fit_159
% @type categorical
% @canonical false
% @original_name boot size fit 159cm
% @unit US
% @values us9_5_10_5=9_5_to_10_5_US unk_boot_size_fit_159=Unknown
% @importance 0.9

0.74::true_val(boot_size_fit_159, us9_5_10_5); 0.26::true_val(boot_size_fit_159, unk_boot_size_fit_159).

0.85::acc(s17, boot_size_fit_159).

measured(s17, boot_size_fit_159, us9_5_10_5).

all_consistent(boot_size_fit_159) :-
    consistent(s17, boot_size_fit_159).

evidence(all_consistent(boot_size_fit_159)).
query(true_val(boot_size_fit_159, us9_5_10_5)).
query(true_val(boot_size_fit_159, unk_boot_size_fit_159)).

% @attr boot_size_fit_163
% @type categorical
% @canonical false
% @original_name boot size fit 163cm
% @unit US
% @values us11_12=11_to_12_US unk_boot_size_fit_163=Unknown
% @importance 0.9

0.74::true_val(boot_size_fit_163, us11_12); 0.26::true_val(boot_size_fit_163, unk_boot_size_fit_163).

0.85::acc(s17, boot_size_fit_163).

measured(s17, boot_size_fit_163, us11_12).

all_consistent(boot_size_fit_163) :-
    consistent(s17, boot_size_fit_163).

evidence(all_consistent(boot_size_fit_163)).
query(true_val(boot_size_fit_163, us11_12)).
query(true_val(boot_size_fit_163, unk_boot_size_fit_163)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect (pop and drive)
% @values excellent_pop_drive=Excellent_Pop_and_Drive unk_positive_aspect=Unknown
% @importance 0.9

0.64::true_val(positive_aspect, excellent_pop_drive); 0.36::true_val(positive_aspect, unk_positive_aspect).

0.82::acc(s27, positive_aspect).

measured(s27, positive_aspect, excellent_pop_drive).

all_consistent(positive_aspect) :-
    consistent(s27, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, excellent_pop_drive)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr positive_aspect_speed
% @type categorical
% @canonical false
% @original_name positive_aspect (speedy swallowtail)
% @values speedy_swallowtail=Speedy_for_a_Swallow_Tail unk_positive_aspect_speed=Unknown
% @importance 0.9

0.64::true_val(positive_aspect_speed, speedy_swallowtail); 0.36::true_val(positive_aspect_speed, unk_positive_aspect_speed).

0.82::acc(s27, positive_aspect_speed).

measured(s27, positive_aspect_speed, speedy_swallowtail).

all_consistent(positive_aspect_speed) :-
    consistent(s27, positive_aspect_speed).

evidence(all_consistent(positive_aspect_speed)).
query(true_val(positive_aspect_speed, speedy_swallowtail)).
query(true_val(positive_aspect_speed, unk_positive_aspect_speed)).

% @attr positive_aspect_carves
% @type categorical
% @canonical false
% @original_name positive_aspect (fun carves)
% @values fun_down_line_carves=Very_Fun_Down_The_Line_Carves unk_positive_aspect_carves=Unknown
% @importance 0.9

0.64::true_val(positive_aspect_carves, fun_down_line_carves); 0.36::true_val(positive_aspect_carves, unk_positive_aspect_carves).

0.82::acc(s27, positive_aspect_carves).

measured(s27, positive_aspect_carves, fun_down_line_carves).

all_consistent(positive_aspect_carves) :-
    consistent(s27, positive_aspect_carves).

evidence(all_consistent(positive_aspect_carves)).
query(true_val(positive_aspect_carves, fun_down_line_carves)).
query(true_val(positive_aspect_carves, unk_positive_aspect_carves)).

% @attr positive_aspect_groomer
% @type categorical
% @canonical false
% @original_name positive_aspect (groomer edge hold)
% @values fantastic_groomer_edge_hold=Fantastic_groomer_impressive_edge_hold unk_positive_aspect_groomer=Unknown
% @importance 0.9

0.78::true_val(positive_aspect_groomer, fantastic_groomer_edge_hold); 0.22::true_val(positive_aspect_groomer, unk_positive_aspect_groomer).

0.87::acc(s18, positive_aspect_groomer).

measured(s18, positive_aspect_groomer, fantastic_groomer_edge_hold).

all_consistent(positive_aspect_groomer) :-
    consistent(s18, positive_aspect_groomer).

evidence(all_consistent(positive_aspect_groomer)).
query(true_val(positive_aspect_groomer, fantastic_groomer_edge_hold)).
query(true_val(positive_aspect_groomer, unk_positive_aspect_groomer)).

% @attr positive_aspect_ice_bite
% @type categorical
% @canonical false
% @original_name positive_aspect (ice bite)
% @values bites_ice_firm_snow=Bites_into_ice_and_firm_snow_better_than_comparable unk_positive_aspect_ice_bite=Unknown
% @importance 0.9

0.78::true_val(positive_aspect_ice_bite, bites_ice_firm_snow); 0.22::true_val(positive_aspect_ice_bite, unk_positive_aspect_ice_bite).

0.87::acc(s18, positive_aspect_ice_bite).

measured(s18, positive_aspect_ice_bite, bites_ice_firm_snow).

all_consistent(positive_aspect_ice_bite) :-
    consistent(s18, positive_aspect_ice_bite).

evidence(all_consistent(positive_aspect_ice_bite)).
query(true_val(positive_aspect_ice_bite, bites_ice_firm_snow)).
query(true_val(positive_aspect_ice_bite, unk_positive_aspect_ice_bite)).

% @attr positive_aspect_tail_support
% @type categorical
% @canonical false
% @original_name positive_aspect (tail support)
% @values supportive_tail=Surprisingly_supportive_swallowtail_tail unk_positive_aspect_tail_support=Unknown
% @importance 0.85

0.77::true_val(positive_aspect_tail_support, supportive_tail); 0.23::true_val(positive_aspect_tail_support, unk_positive_aspect_tail_support).

0.87::acc(s19, positive_aspect_tail_support).

measured(s19, positive_aspect_tail_support, supportive_tail).

all_consistent(positive_aspect_tail_support) :-
    consistent(s19, positive_aspect_tail_support).

evidence(all_consistent(positive_aspect_tail_support)).
query(true_val(positive_aspect_tail_support, supportive_tail)).
query(true_val(positive_aspect_tail_support, unk_positive_aspect_tail_support)).

% @attr positive_aspect_stability
% @type categorical
% @canonical false
% @original_name positive_aspect (stability)
% @values stable_true_camber=Very_stable_feel_from_True_Camber unk_positive_aspect_stability=Unknown
% @importance 0.8

0.63::true_val(positive_aspect_stability, stable_true_camber); 0.37::true_val(positive_aspect_stability, unk_positive_aspect_stability).

0.80::acc(s23, positive_aspect_stability).

measured(s23, positive_aspect_stability, stable_true_camber).

all_consistent(positive_aspect_stability) :-
    consistent(s23, positive_aspect_stability).

evidence(all_consistent(positive_aspect_stability)).
query(true_val(positive_aspect_stability, stable_true_camber)).
query(true_val(positive_aspect_stability, unk_positive_aspect_stability)).

% @attr positive_aspect_edge_hold_ice
% @type categorical
% @canonical false
% @original_name positive_aspect (edge hold icy)
% @values zero_complaints_icy=Zero_complaints_even_icy_Australian_conditions unk_positive_aspect_edge_hold_ice=Unknown
% @importance 0.8

0.63::true_val(positive_aspect_edge_hold_ice, zero_complaints_icy); 0.37::true_val(positive_aspect_edge_hold_ice, unk_positive_aspect_edge_hold_ice).

0.80::acc(s23, positive_aspect_edge_hold_ice).

measured(s23, positive_aspect_edge_hold_ice, zero_complaints_icy).

all_consistent(positive_aspect_edge_hold_ice) :-
    consistent(s23, positive_aspect_edge_hold_ice).

evidence(all_consistent(positive_aspect_edge_hold_ice)).
query(true_val(positive_aspect_edge_hold_ice, zero_complaints_icy)).
query(true_val(positive_aspect_edge_hold_ice, unk_positive_aspect_edge_hold_ice)).

% @attr positive_aspect_base_quality
% @type categorical
% @canonical false
% @original_name positive_aspect (base quality)
% @values best_sintered_durability_wax=Nitro_sintered_bases_among_best_durability_wax unk_positive_aspect_base_quality=Unknown
% @importance 0.75

0.66::true_val(positive_aspect_base_quality, best_sintered_durability_wax); 0.34::true_val(positive_aspect_base_quality, unk_positive_aspect_base_quality).

0.82::acc(s45, positive_aspect_base_quality).

measured(s45, positive_aspect_base_quality, best_sintered_durability_wax).

all_consistent(positive_aspect_base_quality) :-
    consistent(s45, positive_aspect_base_quality).

evidence(all_consistent(positive_aspect_base_quality)).
query(true_val(positive_aspect_base_quality, best_sintered_durability_wax)).
query(true_val(positive_aspect_base_quality, unk_positive_aspect_base_quality)).

% @attr positive_aspect_carving_quality
% @type categorical
% @canonical false
% @original_name positive_aspect (carving quality)
% @values high_quality_carving_smooth=High_quality_carving_smooth_lines_torsional_flex unk_positive_aspect_carving_quality=Unknown
% @importance 0.75

0.66::true_val(positive_aspect_carving_quality, high_quality_carving_smooth); 0.34::true_val(positive_aspect_carving_quality, unk_positive_aspect_carving_quality).

0.82::acc(s45, positive_aspect_carving_quality).

measured(s45, positive_aspect_carving_quality, high_quality_carving_smooth).

all_consistent(positive_aspect_carving_quality) :-
    consistent(s45, positive_aspect_carving_quality).

evidence(all_consistent(positive_aspect_carving_quality)).
query(true_val(positive_aspect_carving_quality, high_quality_carving_smooth)).
query(true_val(positive_aspect_carving_quality, unk_positive_aspect_carving_quality)).

% @attr positive_aspect_phenomenal_edge
% @type categorical
% @canonical false
% @original_name positive_aspect (phenomenal edge hold)
% @values phenomenal_edge_rails_turns=Phenomenal_edge_hold_progressive_sidecut_rails_turns unk_positive_aspect_phenomenal_edge=Unknown
% @importance 0.65

0.30::true_val(positive_aspect_phenomenal_edge, phenomenal_edge_rails_turns); 0.70::true_val(positive_aspect_phenomenal_edge, unk_positive_aspect_phenomenal_edge).

0.65::acc(s46, positive_aspect_phenomenal_edge).

measured(s46, positive_aspect_phenomenal_edge, phenomenal_edge_rails_turns).

all_consistent(positive_aspect_phenomenal_edge) :-
    consistent(s46, positive_aspect_phenomenal_edge).

evidence(all_consistent(positive_aspect_phenomenal_edge)).
query(true_val(positive_aspect_phenomenal_edge, phenomenal_edge_rails_turns)).
query(true_val(positive_aspect_phenomenal_edge, unk_positive_aspect_phenomenal_edge)).

% @attr positive_aspect_quiver_killer
% @type categorical
% @canonical false
% @original_name positive_aspect (holy grail quiver)
% @values holy_grail_one_board=Described_as_potential_holy_grail_one_board_quiver unk_positive_aspect_quiver_killer=Unknown
% @importance 0.5

0.49::true_val(positive_aspect_quiver_killer, holy_grail_one_board); 0.51::true_val(positive_aspect_quiver_killer, unk_positive_aspect_quiver_killer).

0.72::acc(s47, positive_aspect_quiver_killer).

measured(s47, positive_aspect_quiver_killer, holy_grail_one_board).

all_consistent(positive_aspect_quiver_killer) :-
    consistent(s47, positive_aspect_quiver_killer).

evidence(all_consistent(positive_aspect_quiver_killer)).
query(true_val(positive_aspect_quiver_killer, holy_grail_one_board)).
query(true_val(positive_aspect_quiver_killer, unk_positive_aspect_quiver_killer)).

% @attr positive_aspect_versatility
% @type categorical
% @canonical false
% @original_name positive_aspect (versatility)
% @values stays_in_quiver=Would_stay_in_quiver_versatile_pow_and_firm unk_positive_aspect_versatility=Unknown
% @importance 0.7

0.72::true_val(positive_aspect_versatility, stays_in_quiver); 0.28::true_val(positive_aspect_versatility, unk_positive_aspect_versatility).

0.85::acc(s48, positive_aspect_versatility).

measured(s48, positive_aspect_versatility, stays_in_quiver).

all_consistent(positive_aspect_versatility) :-
    consistent(s48, positive_aspect_versatility).

evidence(all_consistent(positive_aspect_versatility)).
query(true_val(positive_aspect_versatility, stays_in_quiver)).
query(true_val(positive_aspect_versatility, unk_positive_aspect_versatility)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect (technical catchy)
% @values technical_locked_catchy=Very_Technical_Locked_In_Catchy unk_negative_aspect=Unknown
% @importance 0.9

0.64::true_val(negative_aspect, technical_locked_catchy); 0.36::true_val(negative_aspect, unk_negative_aspect).

0.82::acc(s27, negative_aspect).

measured(s27, negative_aspect, technical_locked_catchy).

all_consistent(negative_aspect) :-
    consistent(s27, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, technical_locked_catchy)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_not_turny
% @type categorical
% @canonical false
% @original_name negative_aspect (not turny)
% @values not_turny_slashy=Not_That_Turny_Slashy unk_negative_aspect_not_turny=Unknown
% @importance 0.9

0.64::true_val(negative_aspect_not_turny, not_turny_slashy); 0.36::true_val(negative_aspect_not_turny, unk_negative_aspect_not_turny).

0.82::acc(s27, negative_aspect_not_turny).

measured(s27, negative_aspect_not_turny, not_turny_slashy).

all_consistent(negative_aspect_not_turny) :-
    consistent(s27, negative_aspect_not_turny).

evidence(all_consistent(negative_aspect_not_turny)).
query(true_val(negative_aspect_not_turny, not_turny_slashy)).
query(true_val(negative_aspect_not_turny, unk_negative_aspect_not_turny)).

% @attr negative_aspect_switch
% @type categorical
% @canonical false
% @original_name negative_aspect (switch)
% @values not_ideal_switch=Not_ideal_for_riding_switch unk_negative_aspect_switch=Unknown
% @importance 0.85

0.60::true_val(negative_aspect_switch, not_ideal_switch); 0.40::true_val(negative_aspect_switch, unk_negative_aspect_switch).

0.78::acc(s30, negative_aspect_switch).

measured(s30, negative_aspect_switch, not_ideal_switch).

all_consistent(negative_aspect_switch) :-
    consistent(s30, negative_aspect_switch).

evidence(all_consistent(negative_aspect_switch)).
query(true_val(negative_aspect_switch, not_ideal_switch)).
query(true_val(negative_aspect_switch, unk_negative_aspect_switch)).

% @attr negative_aspect_stiff
% @type categorical
% @canonical false
% @original_name negative_aspect (stiffer than expected)
% @values stiffer_than_expected=May_feel_stiffer_than_expected unk_negative_aspect_stiff=Unknown
% @importance 0.85

0.60::true_val(negative_aspect_stiff, stiffer_than_expected); 0.40::true_val(negative_aspect_stiff, unk_negative_aspect_stiff).

0.78::acc(s30, negative_aspect_stiff).

measured(s30, negative_aspect_stiff, stiffer_than_expected).

all_consistent(negative_aspect_stiff) :-
    consistent(s30, negative_aspect_stiff).

evidence(all_consistent(negative_aspect_stiff)).
query(true_val(negative_aspect_stiff, stiffer_than_expected)).
query(true_val(negative_aspect_stiff, unk_negative_aspect_stiff)).

% @attr negative_aspect_nose_chatter
% @type categorical
% @canonical false
% @original_name negative_aspect (nose chatter)
% @values nose_chatters_high_speed=Nose_chatters_at_high_speed_on_groomed_runs unk_negative_aspect_nose_chatter=Unknown
% @importance 0.8

0.63::true_val(negative_aspect_nose_chatter, nose_chatters_high_speed); 0.37::true_val(negative_aspect_nose_chatter, unk_negative_aspect_nose_chatter).

0.80::acc(s23, negative_aspect_nose_chatter).

measured(s23, negative_aspect_nose_chatter, nose_chatters_high_speed).

all_consistent(negative_aspect_nose_chatter) :-
    consistent(s23, negative_aspect_nose_chatter).

evidence(all_consistent(negative_aspect_nose_chatter)).
query(true_val(negative_aspect_nose_chatter, nose_chatters_high_speed)).
query(true_val(negative_aspect_nose_chatter, unk_negative_aspect_nose_chatter)).

% @attr negative_aspect_powerful_rider
% @type categorical
% @canonical false
% @original_name negative_aspect (powerful rider needed)
% @values need_powerful_rider=Not_easy_to_manipulate_need_powerful_rider unk_negative_aspect_powerful_rider=Unknown
% @importance 0.7

0.64::true_val(negative_aspect_powerful_rider, need_powerful_rider); 0.36::true_val(negative_aspect_powerful_rider, unk_negative_aspect_powerful_rider).

0.78::acc(s14, negative_aspect_powerful_rider).

measured(s14, negative_aspect_powerful_rider, need_powerful_rider).

all_consistent(negative_aspect_powerful_rider) :-
    consistent(s14, negative_aspect_powerful_rider).

evidence(all_consistent(negative_aspect_powerful_rider)).
query(true_val(negative_aspect_powerful_rider, need_powerful_rider)).
query(true_val(negative_aspect_powerful_rider, unk_negative_aspect_powerful_rider)).

% @attr negative_aspect_beginner
% @type categorical
% @canonical false
% @original_name negative_aspect (not for beginners)
% @values not_beginner_intermediate=Not_easy_to_skid_far_from_ideal_beginner_intermediates unk_negative_aspect_beginner=Unknown
% @importance 0.85

0.74::true_val(negative_aspect_beginner, not_beginner_intermediate); 0.26::true_val(negative_aspect_beginner, unk_negative_aspect_beginner).

0.85::acc(s20, negative_aspect_beginner).

measured(s20, negative_aspect_beginner, not_beginner_intermediate).

all_consistent(negative_aspect_beginner) :-
    consistent(s20, negative_aspect_beginner).

evidence(all_consistent(negative_aspect_beginner)).
query(true_val(negative_aspect_beginner, not_beginner_intermediate)).
query(true_val(negative_aspect_beginner, unk_negative_aspect_beginner)).

% @attr negative_aspect_deep_powder
% @type categorical
% @canonical false
% @original_name negative_aspect (deep powder)
% @values nose_dives_deep_pow=In_very_deep_snow_16_plus_inches_nose_stays_under unk_negative_aspect_deep_powder=Unknown
% @importance 0.85

0.77::true_val(negative_aspect_deep_powder, nose_dives_deep_pow); 0.23::true_val(negative_aspect_deep_powder, unk_negative_aspect_deep_powder).

0.87::acc(s49, negative_aspect_deep_powder).

measured(s49, negative_aspect_deep_powder, nose_dives_deep_pow).

all_consistent(negative_aspect_deep_powder) :-
    consistent(s49, negative_aspect_deep_powder).

evidence(all_consistent(negative_aspect_deep_powder)).
query(true_val(negative_aspect_deep_powder, nose_dives_deep_pow)).
query(true_val(negative_aspect_deep_powder, unk_negative_aspect_deep_powder)).

% @attr reviewer_opinion_the_good_ride_weight_note
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (weight range note)
% @values conservative_weight_20lbs_more=Nitro_conservative_with_weight_handles_20_plus_lbs_heavier unk_reviewer_opinion_the_good_ride_weight_note=Unknown
% @importance 0.8

0.64::true_val(reviewer_opinion_the_good_ride_weight_note, conservative_weight_20lbs_more); 0.36::true_val(reviewer_opinion_the_good_ride_weight_note, unk_reviewer_opinion_the_good_ride_weight_note).

0.82::acc(s50, reviewer_opinion_the_good_ride_weight_note).

measured(s50, reviewer_opinion_the_good_ride_weight_note, conservative_weight_20lbs_more).

all_consistent(reviewer_opinion_the_good_ride_weight_note) :-
    consistent(s50, reviewer_opinion_the_good_ride_weight_note).

evidence(all_consistent(reviewer_opinion_the_good_ride_weight_note)).
query(true_val(reviewer_opinion_the_good_ride_weight_note, conservative_weight_20lbs_more)).
query(true_val(reviewer_opinion_the_good_ride_weight_note, unk_reviewer_opinion_the_good_ride_weight_note)).

% @attr reviewer_opinion_the_good_ride_sizing
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (sizing note)
% @values ride_shorter=Designed_to_be_ridden_shorter_than_standard unk_reviewer_opinion_the_good_ride_sizing=Unknown
% @importance 0.7

0.68::true_val(reviewer_opinion_the_good_ride_sizing, ride_shorter); 0.32::true_val(reviewer_opinion_the_good_ride_sizing, unk_reviewer_opinion_the_good_ride_sizing).

0.80::acc(s13, reviewer_opinion_the_good_ride_sizing).

measured(s13, reviewer_opinion_the_good_ride_sizing, ride_shorter).

all_consistent(reviewer_opinion_the_good_ride_sizing) :-
    (indep(s13), consistent(s13, reviewer_opinion_the_good_ride_sizing) ; \+indep(s13)).

evidence(all_consistent(reviewer_opinion_the_good_ride_sizing)).
query(true_val(reviewer_opinion_the_good_ride_sizing, ride_shorter)).
query(true_val(reviewer_opinion_the_good_ride_sizing, unk_reviewer_opinion_the_good_ride_sizing)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand (Jones Hovercraft)
% @values jones_hovercraft_2=Jones_Hovercraft_2_0 unk_comparable_board_cross_brand=Unknown
% @importance 0.9

0.74::true_val(comparable_board_cross_brand, jones_hovercraft_2); 0.26::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

0.85::acc(s17, comparable_board_cross_brand).

measured(s17, comparable_board_cross_brand, jones_hovercraft_2).

all_consistent(comparable_board_cross_brand) :-
    consistent(s17, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, jones_hovercraft_2)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_nidecker
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Nidecker Beta)
% @values nidecker_beta=Nidecker_Beta_APX unk_comparable_board_cross_brand_nidecker=Unknown
% @importance 0.9

0.74::true_val(comparable_board_cross_brand_nidecker, nidecker_beta); 0.26::true_val(comparable_board_cross_brand_nidecker, unk_comparable_board_cross_brand_nidecker).

0.85::acc(s17, comparable_board_cross_brand_nidecker).

measured(s17, comparable_board_cross_brand_nidecker, nidecker_beta).

all_consistent(comparable_board_cross_brand_nidecker) :-
    consistent(s17, comparable_board_cross_brand_nidecker).

evidence(all_consistent(comparable_board_cross_brand_nidecker)).
query(true_val(comparable_board_cross_brand_nidecker, nidecker_beta)).
query(true_val(comparable_board_cross_brand_nidecker, unk_comparable_board_cross_brand_nidecker)).

% @attr comparable_board_cross_brand_korua
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Korua)
% @values korua_transition_finder=Korua_Transition_Finder unk_comparable_board_cross_brand_korua=Unknown
% @importance 0.9

0.74::true_val(comparable_board_cross_brand_korua, korua_transition_finder); 0.26::true_val(comparable_board_cross_brand_korua, unk_comparable_board_cross_brand_korua).

0.85::acc(s17, comparable_board_cross_brand_korua).

measured(s17, comparable_board_cross_brand_korua, korua_transition_finder).

all_consistent(comparable_board_cross_brand_korua) :-
    consistent(s17, comparable_board_cross_brand_korua).

evidence(all_consistent(comparable_board_cross_brand_korua)).
query(true_val(comparable_board_cross_brand_korua, korua_transition_finder)).
query(true_val(comparable_board_cross_brand_korua, unk_comparable_board_cross_brand_korua)).

% @attr comparable_board_cross_brand_rome
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Rome Stale Fish)
% @values rome_stale_fish=Rome_Stale_Fish unk_comparable_board_cross_brand_rome=Unknown
% @importance 0.9

0.74::true_val(comparable_board_cross_brand_rome, rome_stale_fish); 0.26::true_val(comparable_board_cross_brand_rome, unk_comparable_board_cross_brand_rome).

0.85::acc(s17, comparable_board_cross_brand_rome).

measured(s17, comparable_board_cross_brand_rome, rome_stale_fish).

all_consistent(comparable_board_cross_brand_rome) :-
    consistent(s17, comparable_board_cross_brand_rome).

evidence(all_consistent(comparable_board_cross_brand_rome)).
query(true_val(comparable_board_cross_brand_rome, rome_stale_fish)).
query(true_val(comparable_board_cross_brand_rome, unk_comparable_board_cross_brand_rome)).

% @attr comparable_board_cross_brand_stranda
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Stranda Tree Surfer)
% @values stranda_tree_surfer=Stranda_Tree_Surfer unk_comparable_board_cross_brand_stranda=Unknown
% @importance 0.9

0.74::true_val(comparable_board_cross_brand_stranda, stranda_tree_surfer); 0.26::true_val(comparable_board_cross_brand_stranda, unk_comparable_board_cross_brand_stranda).

0.85::acc(s17, comparable_board_cross_brand_stranda).

measured(s17, comparable_board_cross_brand_stranda, stranda_tree_surfer).

all_consistent(comparable_board_cross_brand_stranda) :-
    consistent(s17, comparable_board_cross_brand_stranda).

evidence(all_consistent(comparable_board_cross_brand_stranda)).
query(true_val(comparable_board_cross_brand_stranda, stranda_tree_surfer)).
query(true_val(comparable_board_cross_brand_stranda, unk_comparable_board_cross_brand_stranda)).

% @attr comparable_board_cross_brand_storm_wolf
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Jones Storm Wolf)
% @values jones_storm_wolf=Jones_Storm_Wolf_deeper_powder unk_comparable_board_cross_brand_storm_wolf=Unknown
% @importance 0.85

0.77::true_val(comparable_board_cross_brand_storm_wolf, jones_storm_wolf); 0.23::true_val(comparable_board_cross_brand_storm_wolf, unk_comparable_board_cross_brand_storm_wolf).

0.87::acc(s49, comparable_board_cross_brand_storm_wolf).

measured(s49, comparable_board_cross_brand_storm_wolf, jones_storm_wolf).

all_consistent(comparable_board_cross_brand_storm_wolf) :-
    consistent(s49, comparable_board_cross_brand_storm_wolf).

evidence(all_consistent(comparable_board_cross_brand_storm_wolf)).
query(true_val(comparable_board_cross_brand_storm_wolf, jones_storm_wolf)).
query(true_val(comparable_board_cross_brand_storm_wolf, unk_comparable_board_cross_brand_storm_wolf)).

% @attr comparable_board_cross_brand_japow
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Weston Japow)
% @values weston_japow=Weston_Japow_deeper_powder unk_comparable_board_cross_brand_japow=Unknown
% @importance 0.85

0.77::true_val(comparable_board_cross_brand_japow, weston_japow); 0.23::true_val(comparable_board_cross_brand_japow, unk_comparable_board_cross_brand_japow).

0.87::acc(s49, comparable_board_cross_brand_japow).

measured(s49, comparable_board_cross_brand_japow, weston_japow).

all_consistent(comparable_board_cross_brand_japow) :-
    consistent(s49, comparable_board_cross_brand_japow).

evidence(all_consistent(comparable_board_cross_brand_japow)).
query(true_val(comparable_board_cross_brand_japow, weston_japow)).
query(true_val(comparable_board_cross_brand_japow, unk_comparable_board_cross_brand_japow)).

% @attr comparable_board_cross_brand_forma
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Season Forma)
% @values season_forma=Season_Forma_groomer_carving unk_comparable_board_cross_brand_forma=Unknown
% @importance 0.9

0.78::true_val(comparable_board_cross_brand_forma, season_forma); 0.22::true_val(comparable_board_cross_brand_forma, unk_comparable_board_cross_brand_forma).

0.87::acc(s18, comparable_board_cross_brand_forma).

measured(s18, comparable_board_cross_brand_forma, season_forma).

all_consistent(comparable_board_cross_brand_forma) :-
    consistent(s18, comparable_board_cross_brand_forma).

evidence(all_consistent(comparable_board_cross_brand_forma)).
query(true_val(comparable_board_cross_brand_forma, season_forma)).
query(true_val(comparable_board_cross_brand_forma, unk_comparable_board_cross_brand_forma)).

% @attr comparable_board_cross_brand_vs_jones
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (vs Jones stiffness)
% @values stiffer_than_jones=Considerably_stiffer_than_Jones_Hovercraft_Ultracraft unk_comparable_board_cross_brand_vs_jones=Unknown
% @importance 0.7

0.64::true_val(comparable_board_cross_brand_vs_jones, stiffer_than_jones); 0.36::true_val(comparable_board_cross_brand_vs_jones, unk_comparable_board_cross_brand_vs_jones).

0.78::acc(s14, comparable_board_cross_brand_vs_jones).

measured(s14, comparable_board_cross_brand_vs_jones, stiffer_than_jones).

all_consistent(comparable_board_cross_brand_vs_jones) :-
    consistent(s14, comparable_board_cross_brand_vs_jones).

evidence(all_consistent(comparable_board_cross_brand_vs_jones)).
query(true_val(comparable_board_cross_brand_vs_jones, stiffer_than_jones)).
query(true_val(comparable_board_cross_brand_vs_jones, unk_comparable_board_cross_brand_vs_jones)).

% @attr comparable_board_cross_brand_deep_snow_note
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (deep snow comparison)
% @values not_as_good_deep_better_everyday=Not_as_good_deep_pow_but_better_everyday unk_comparable_board_cross_brand_deep_snow_note=Unknown
% @importance 0.85

0.77::true_val(comparable_board_cross_brand_deep_snow_note, not_as_good_deep_better_everyday); 0.23::true_val(comparable_board_cross_brand_deep_snow_note, unk_comparable_board_cross_brand_deep_snow_note).

0.87::acc(s49, comparable_board_cross_brand_deep_snow_note).

measured(s49, comparable_board_cross_brand_deep_snow_note, not_as_good_deep_better_everyday).

all_consistent(comparable_board_cross_brand_deep_snow_note) :-
    consistent(s49, comparable_board_cross_brand_deep_snow_note).

evidence(all_consistent(comparable_board_cross_brand_deep_snow_note)).
query(true_val(comparable_board_cross_brand_deep_snow_note, not_as_good_deep_better_everyday)).
query(true_val(comparable_board_cross_brand_deep_snow_note, unk_comparable_board_cross_brand_deep_snow_note)).

% @attr volume_shifted
% @type categorical
% @canonical false
% @original_name volume shifted
% @values not_volume_shifted=No_NOT_volume_shifted unk_volume_shifted=Unknown
% @importance 0.65

0.30::true_val(volume_shifted, not_volume_shifted); 0.70::true_val(volume_shifted, unk_volume_shifted).

0.60::acc(s46, volume_shifted).

measured(s46, volume_shifted, not_volume_shifted).

all_consistent(volume_shifted) :-
    consistent(s46, volume_shifted).

evidence(all_consistent(volume_shifted)).
query(true_val(volume_shifted, not_volume_shifted)).
query(true_val(volume_shifted, unk_volume_shifted)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand (self)
% @values squash_mens_solid=Nitro_Squash_mens_solid_board_under_review unk_comparable_board_same_brand=Unknown
% @importance 1.0

0.92::true_val(comparable_board_same_brand, squash_mens_solid); 0.08::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

0.95::acc(s2, comparable_board_same_brand).

measured(s2, comparable_board_same_brand, squash_mens_solid).

all_consistent(comparable_board_same_brand) :-
    (indep(s2), consistent(s2, comparable_board_same_brand) ; \+indep(s2)).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, squash_mens_solid)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_womens
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Women's)
% @values squash_womens=Nitro_Squash_Womens unk_comparable_board_same_brand_womens=Unknown
% @importance 0.5

0.49::true_val(comparable_board_same_brand_womens, squash_womens); 0.51::true_val(comparable_board_same_brand_womens, unk_comparable_board_same_brand_womens).

0.72::acc(s47, comparable_board_same_brand_womens).

measured(s47, comparable_board_same_brand_womens, squash_womens).

all_consistent(comparable_board_same_brand_womens) :-
    consistent(s47, comparable_board_same_brand_womens).

evidence(all_consistent(comparable_board_same_brand_womens)).
query(true_val(comparable_board_same_brand_womens, squash_womens)).
query(true_val(comparable_board_same_brand_womens, unk_comparable_board_same_brand_womens)).

% @attr comparable_board_same_brand_split
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Split)
% @values squash_split_599=Nitro_Squash_Split_599_99USD unk_comparable_board_same_brand_split=Unknown
% @importance 0.5

0.86::true_val(comparable_board_same_brand_split, squash_split_599); 0.14::true_val(comparable_board_same_brand_split, unk_comparable_board_same_brand_split).

0.92::acc(s51, comparable_board_same_brand_split).

measured(s51, comparable_board_same_brand_split, squash_split_599).

all_consistent(comparable_board_same_brand_split) :-
    consistent(s51, comparable_board_same_brand_split).

evidence(all_consistent(comparable_board_same_brand_split)).
query(true_val(comparable_board_same_brand_split, squash_split_599)).
query(true_val(comparable_board_same_brand_split, unk_comparable_board_same_brand_split)).

% @attr comparable_board_same_brand_split_womens
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Split Women's)
% @values squash_split_womens=Nitro_Squash_Split_Womens unk_comparable_board_same_brand_split_womens=Unknown
% @importance 0.6

0.63::true_val(comparable_board_same_brand_split_womens, squash_split_womens); 0.37::true_val(comparable_board_same_brand_split_womens, unk_comparable_board_same_brand_split_womens).

0.82::acc(s10, comparable_board_same_brand_split_womens).

measured(s10, comparable_board_same_brand_split_womens, squash_split_womens).

all_consistent(comparable_board_same_brand_split_womens) :-
    consistent(s10, comparable_board_same_brand_split_womens).

evidence(all_consistent(comparable_board_same_brand_split_womens)).
query(true_val(comparable_board_same_brand_split_womens, squash_split_womens)).
query(true_val(comparable_board_same_brand_split_womens, unk_comparable_board_same_brand_split_womens)).

% @attr comparable_board_same_brand_youth
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Youth)
% @values youth_sizes_available=Youth_sizes_also_available unk_comparable_board_same_brand_youth=Unknown
% @importance 0.6

0.63::true_val(comparable_board_same_brand_youth, youth_sizes_available); 0.37::true_val(comparable_board_same_brand_youth, unk_comparable_board_same_brand_youth).

0.82::acc(s10, comparable_board_same_brand_youth).

measured(s10, comparable_board_same_brand_youth, youth_sizes_available).

all_consistent(comparable_board_same_brand_youth) :-
    consistent(s10, comparable_board_same_brand_youth).

evidence(all_consistent(comparable_board_same_brand_youth)).
query(true_val(comparable_board_same_brand_youth, youth_sizes_available)).
query(true_val(comparable_board_same_brand_youth, unk_comparable_board_same_brand_youth)).

% @attr pro_rider_name_team
% @type categorical
% @canonical false
% @original_name pro_rider_name (full team)
% @values smith_fox_elston_siebert=Austin_Smith_Bryan_Fox_Jared_Elston_Griffin_Siebert unk_pro_rider_name_team=Unknown
% @importance 0.85

0.60::true_val(pro_rider_name_team, smith_fox_elston_siebert); 0.40::true_val(pro_rider_name_team, unk_pro_rider_name_team).

0.78::acc(s30, pro_rider_name_team).

measured(s30, pro_rider_name_team, smith_fox_elston_siebert).

all_consistent(pro_rider_name_team) :-
    consistent(s30, pro_rider_name_team).

evidence(all_consistent(pro_rider_name_team)).
query(true_val(pro_rider_name_team, smith_fox_elston_siebert)).
query(true_val(pro_rider_name_team, unk_pro_rider_name_team)).

% @attr award_winning
% @type categorical
% @canonical false
% @original_name award winning
% @values award_winning_23_24=Described_as_award_winning_on_23_24_page unk_award_winning=Unknown
% @importance 0.4

0.77::true_val(award_winning, award_winning_23_24); 0.23::true_val(award_winning, unk_award_winning).

0.85::acc(s26, award_winning).

measured(s26, award_winning, award_winning_23_24).

all_consistent(award_winning) :-
    consistent(s26, award_winning).

evidence(all_consistent(award_winning)).
query(true_val(award_winning, award_winning_23_24)).
query(true_val(award_winning, unk_award_winning)).

% @attr quiver_killer_designation
% @type categorical
% @canonical false
% @original_name quiver killer designation
% @values true_quiver_killer=Splitboard_Mag_classifies_as_true_quiver_killer unk_quiver_killer_designation=Unknown
% @importance 0.5

0.56::true_val(quiver_killer_designation, true_quiver_killer); 0.44::true_val(quiver_killer_designation, unk_quiver_killer_designation).

0.75::acc(s52, quiver_killer_designation).

measured(s52, quiver_killer_designation, true_quiver_killer).

all_consistent(quiver_killer_designation) :-
    consistent(s52, quiver_killer_designation).

evidence(all_consistent(quiver_killer_designation)).
query(true_val(quiver_killer_designation, true_quiver_killer)).
query(true_val(quiver_killer_designation, unk_quiver_killer_designation)).

% @attr best_selling_status
% @type categorical
% @canonical false
% @original_name became one of Nitro's best selling boards
% @values best_seller_team_fav=Best_selling_board_and_team_favorite unk_best_selling_status=Unknown
% @importance 0.85

0.60::true_val(best_selling_status, best_seller_team_fav); 0.40::true_val(best_selling_status, unk_best_selling_status).

0.78::acc(s30, best_selling_status).

measured(s30, best_selling_status, best_seller_team_fav).

all_consistent(best_selling_status) :-
    consistent(s30, best_selling_status).

evidence(all_consistent(best_selling_status)).
query(true_val(best_selling_status, best_seller_team_fav)).
query(true_val(best_selling_status, unk_best_selling_status)).

% @attr recommended_bindings
% @type categorical
% @canonical false
% @original_name recommended bindings tested with
% @values union_force=Union_Force unk_recommended_bindings=Unknown
% @importance 0.9

0.74::true_val(recommended_bindings, union_force); 0.26::true_val(recommended_bindings, unk_recommended_bindings).

0.85::acc(s17, recommended_bindings).

measured(s17, recommended_bindings, union_force).

all_consistent(recommended_bindings) :-
    consistent(s17, recommended_bindings).

evidence(all_consistent(recommended_bindings)).
query(true_val(recommended_bindings, union_force)).
query(true_val(recommended_bindings, unk_recommended_bindings)).

% @attr recommended_stance_angles
% @type categorical
% @canonical false
% @original_name recommended stance angles
% @values p18_p3_or_p24_p6=Plus18_Plus3_or_Plus24_Plus6 unk_recommended_stance_angles=Unknown
% @importance 0.9

0.74::true_val(recommended_stance_angles, p18_p3_or_p24_p6); 0.26::true_val(recommended_stance_angles, unk_recommended_stance_angles).

0.85::acc(s17, recommended_stance_angles).

measured(s17, recommended_stance_angles, p18_p3_or_p24_p6).

all_consistent(recommended_stance_angles) :-
    consistent(s17, recommended_stance_angles).

evidence(all_consistent(recommended_stance_angles)).
query(true_val(recommended_stance_angles, p18_p3_or_p24_p6)).
query(true_val(recommended_stance_angles, unk_recommended_stance_angles)).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values nitro_quiver_squash_2017_18=Nitro_Quiver_Squash_2017_2018 unk_predecessor_model_name=Unknown
% @importance 0.5

0.68::true_val(predecessor_model_name, nitro_quiver_squash_2017_18); 0.32::true_val(predecessor_model_name, unk_predecessor_model_name).

0.82::acc(s9, predecessor_model_name).

measured(s9, predecessor_model_name, nitro_quiver_squash_2017_18).

all_consistent(predecessor_model_name) :-
    (indep(s9), consistent(s9, predecessor_model_name) ; \+indep(s9)).

evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, nitro_quiver_squash_2017_18)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).