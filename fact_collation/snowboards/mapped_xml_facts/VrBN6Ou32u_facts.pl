0.25::indep(sm).
0.20::indep(s2).
0.15::indep(s3).
0.20::indep(s4).
0.25::indep(s7).
0.25::indep(s8).
0.15::indep(s14).
0.35::indep(s19).
0.15::indep(s20).
0.20::indep(s24).
0.25::indep(s25).
0.20::indep(s26).
0.15::indep(s32).
0.15::indep(s33).
0.20::indep(s34).
0.15::indep(s36).
0.35::indep(s37).
0.20::indep(s31).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical false
% @original_name brand
% @values thirtytwo=thirtytwo unk_brand=Unknown
% @importance 0.90

0.93::acc(s1, brand).
0.88::acc(s2, brand).

0.97::true_val(brand, thirtytwo); 0.03::true_val(brand, unk_brand).

measured(s1, brand, thirtytwo).
measured(s2, brand, thirtytwo).

all_consistent(brand) :-
    consistent(s1, brand),
    (indep(s2), consistent(s2, brand) ; \+indep(s2)).

evidence(all_consistent(brand)).
query(true_val(brand, thirtytwo)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values me_stevens_pro_ltd=Middle_Earth_Stevens_Pro_LTD_Snowboard me_pro_ltd=Middle_Earth_Pro_LTD
% @importance 0.83

0.93::acc(s1, model_name).
0.70::acc(s2, model_name).
0.65::acc(s3, model_name).

0.55::true_val(model_name, me_stevens_pro_ltd); 0.45::true_val(model_name, me_pro_ltd).

measured(s1, model_name, me_stevens_pro_ltd).
measured(s2, model_name, me_pro_ltd).
measured(s3, model_name, me_pro_ltd).

all_consistent(model_name) :-
    consistent(s1, model_name),
    (indep(s2), consistent(s2, model_name) ; \+indep(s2)),
    (indep(s3), consistent(s3, model_name) ; \+indep(s3)).

evidence(all_consistent(model_name)).
query(true_val(model_name, me_stevens_pro_ltd)).
query(true_val(model_name, me_pro_ltd)).

% @attr product_type
% @type categorical
% @canonical false
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
% @canonical false
% @original_name board_category
% @values freestyle_all_mountain=Freestyle_All_Mountain unk_board_category=Unknown
% @importance 0.75

0.70::acc(s2, board_category).
0.65::acc(s3, board_category).

0.92::true_val(board_category, freestyle_all_mountain); 0.08::true_val(board_category, unk_board_category).

measured(s2, board_category, freestyle_all_mountain).
measured(s3, board_category, freestyle_all_mountain).

all_consistent(board_category) :-
    (indep(s2), consistent(s2, board_category) ; \+indep(s2)),
    (indep(s3), consistent(s3, board_category) ; \+indep(s3)).

evidence(all_consistent(board_category)).
query(true_val(board_category, freestyle_all_mountain)).
query(true_val(board_category, unk_board_category)).

% @attr gender
% @type categorical
% @canonical false
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.80

0.80::acc(s4, gender).

0.90::true_val(gender, mens); 0.10::true_val(gender, unk_gender).

measured(s4, gender, mens).

all_consistent(gender) :-
    (indep(s4), consistent(s4, gender) ; \+indep(s4)).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values scott_stevens=Scott_Stevens unk_pro_rider_name=Unknown
% @importance 0.875

0.90::acc(s5, pro_rider_name).
0.90::acc(s6, pro_rider_name).

0.97::true_val(pro_rider_name, scott_stevens); 0.03::true_val(pro_rider_name, unk_pro_rider_name).

measured(s5, pro_rider_name, scott_stevens).
measured(s6, pro_rider_name, scott_stevens).

all_consistent(pro_rider_name) :-
    consistent(s5, pro_rider_name),
    consistent(s6, pro_rider_name).

evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, scott_stevens)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr debut_pro_model
% @type categorical
% @canonical false
% @original_name Scott Stevens debut pro model
% @values yes_first_pro=Yes_first_ever_pro_model_with_ThirtyTwo unk_debut_pro_model=Unknown
% @importance 0.85

0.85::acc(s7, debut_pro_model).
0.88::acc(s5, debut_pro_model).

0.94::true_val(debut_pro_model, yes_first_pro); 0.06::true_val(debut_pro_model, unk_debut_pro_model).

measured(s7, debut_pro_model, yes_first_pro).
measured(s5, debut_pro_model, yes_first_pro).

all_consistent(debut_pro_model) :-
    (indep(s7), consistent(s7, debut_pro_model) ; \+indep(s7)),
    consistent(s5, debut_pro_model).

evidence(all_consistent(debut_pro_model)).
query(true_val(debut_pro_model, yes_first_pro)).
query(true_val(debut_pro_model, unk_debut_pro_model)).

% @attr graphic_designer_artist
% @type categorical
% @canonical true
% @original_name graphic_designer_artist
% @values todd_bratrud=Todd_Bratrud unk_graphic_designer_artist=Unknown
% @importance 1.0

0.93::acc(s1, graphic_designer_artist).

0.90::true_val(graphic_designer_artist, todd_bratrud); 0.10::true_val(graphic_designer_artist, unk_graphic_designer_artist).

measured(s1, graphic_designer_artist, todd_bratrud).

all_consistent(graphic_designer_artist) :- consistent(s1, graphic_designer_artist).

evidence(all_consistent(graphic_designer_artist)).
query(true_val(graphic_designer_artist, todd_bratrud)).
query(true_val(graphic_designer_artist, unk_graphic_designer_artist)).

% @attr graphic_designer_artist_bio
% @type categorical
% @canonical false
% @original_name graphic_designer_artist bio
% @values influential_skate_artist=American_graphic_artist_influential_in_modern_skateboarding unk_graphic_designer_artist_bio=Unknown
% @importance 1.0

0.90::acc(s1, graphic_designer_artist_bio).

0.90::true_val(graphic_designer_artist_bio, influential_skate_artist); 0.10::true_val(graphic_designer_artist_bio, unk_graphic_designer_artist_bio).

measured(s1, graphic_designer_artist_bio, influential_skate_artist).

all_consistent(graphic_designer_artist_bio) :- consistent(s1, graphic_designer_artist_bio).

evidence(all_consistent(graphic_designer_artist_bio)).
query(true_val(graphic_designer_artist_bio, influential_skate_artist)).
query(true_val(graphic_designer_artist_bio, unk_graphic_designer_artist_bio)).

% @attr limited_edition
% @type categorical
% @canonical false
% @original_name Limited edition
% @values yes_extremely_limited=Yes_extremely_limited unk_limited_edition=Unknown
% @importance 0.85

0.85::acc(s7, limited_edition).

0.92::true_val(limited_edition, yes_extremely_limited); 0.08::true_val(limited_edition, unk_limited_edition).

measured(s7, limited_edition, yes_extremely_limited).

all_consistent(limited_edition) :-
    (indep(s7), consistent(s7, limited_edition) ; \+indep(s7)).

evidence(all_consistent(limited_edition)).
query(true_val(limited_edition, yes_extremely_limited)).
query(true_val(limited_edition, unk_limited_edition)).

% @attr design_inspiration
% @type categorical
% @canonical false
% @original_name Design inspiration
% @values retro_popsicle_skate=Retro_popsicle_silhouette_with_skate_driven_graphics unk_design_inspiration=Unknown
% @importance 0.90

0.90::acc(s8, design_inspiration).
0.93::acc(s1, design_inspiration).

0.95::true_val(design_inspiration, retro_popsicle_skate); 0.05::true_val(design_inspiration, unk_design_inspiration).

measured(s8, design_inspiration, retro_popsicle_skate).
measured(s1, design_inspiration, retro_popsicle_skate).

all_consistent(design_inspiration) :-
    consistent(s1, design_inspiration),
    (indep(s8), consistent(s8, design_inspiration) ; \+indep(s8)).

evidence(all_consistent(design_inspiration)).
query(true_val(design_inspiration, retro_popsicle_skate)).
query(true_val(design_inspiration, unk_design_inspiration)).

% @attr manufacturer
% @type categorical
% @canonical false
% @original_name manufacturer
% @values thirtytwo_nidecker=thirtytwo_within_Nidecker_Group unk_manufacturer=Unknown
% @importance 0.70

0.90::acc(s9, manufacturer).
0.80::acc(s10, manufacturer).

0.97::true_val(manufacturer, thirtytwo_nidecker); 0.03::true_val(manufacturer, unk_manufacturer).

measured(s9, manufacturer, thirtytwo_nidecker).
measured(s10, manufacturer, thirtytwo_nidecker).

all_consistent(manufacturer) :-
    consistent(s9, manufacturer),
    consistent(s10, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, thirtytwo_nidecker)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr parent_company
% @type categorical
% @canonical false
% @original_name Parent company
% @values nidecker_group=Nidecker_Group_NDK_Swiss_founded_1887 unk_parent_company=Unknown
% @importance 0.50

0.88::acc(s10, parent_company).
0.90::acc(s11, parent_company).

0.97::true_val(parent_company, nidecker_group); 0.03::true_val(parent_company, unk_parent_company).

measured(s10, parent_company, nidecker_group).
measured(s11, parent_company, nidecker_group).

all_consistent(parent_company) :-
    consistent(s10, parent_company),
    consistent(s11, parent_company).

evidence(all_consistent(parent_company)).
query(true_val(parent_company, nidecker_group)).
query(true_val(parent_company, unk_parent_company)).

% @attr nidecker_acquisition
% @type categorical
% @canonical false
% @original_name Nidecker acquisition of ThirtyTwo
% @values may_2024_from_sole_tech=Acquired_from_Sole_Technology_May_2024 unk_nidecker_acquisition=Unknown
% @importance 0.60

0.88::acc(s12, nidecker_acquisition).
0.85::acc(s13, nidecker_acquisition).

0.97::true_val(nidecker_acquisition, may_2024_from_sole_tech); 0.03::true_val(nidecker_acquisition, unk_nidecker_acquisition).

measured(s12, nidecker_acquisition, may_2024_from_sole_tech).
measured(s13, nidecker_acquisition, may_2024_from_sole_tech).

all_consistent(nidecker_acquisition) :-
    consistent(s12, nidecker_acquisition),
    consistent(s13, nidecker_acquisition).

evidence(all_consistent(nidecker_acquisition)).
query(true_val(nidecker_acquisition, may_2024_from_sole_tech)).
query(true_val(nidecker_acquisition, unk_nidecker_acquisition)).

% @attr thirtytwo_established_year
% @type categorical
% @canonical false
% @original_name ThirtyTwo established year
% @values y1995=1995_originally_snowboard_boot_brand unk_thirtytwo_established_year=Unknown
% @importance 0.60

0.80::acc(s14, thirtytwo_established_year).
0.88::acc(s9, thirtytwo_established_year).

0.95::true_val(thirtytwo_established_year, y1995); 0.05::true_val(thirtytwo_established_year, unk_thirtytwo_established_year).

measured(s14, thirtytwo_established_year, y1995).
measured(s9, thirtytwo_established_year, y1995).

all_consistent(thirtytwo_established_year) :-
    (indep(s14), consistent(s14, thirtytwo_established_year) ; \+indep(s14)),
    consistent(s9, thirtytwo_established_year).

evidence(all_consistent(thirtytwo_established_year)).
query(true_val(thirtytwo_established_year, y1995)).
query(true_val(thirtytwo_established_year, unk_thirtytwo_established_year)).

% @attr brand_headquarters
% @type categorical
% @canonical false
% @original_name ThirtyTwo brand headquarters
% @values lake_forest_ca_rolle_ch=Lake_Forest_CA_and_Rolle_Switzerland unk_brand_headquarters=Unknown
% @importance 0.50

0.82::acc(s15, brand_headquarters).

0.80::true_val(brand_headquarters, lake_forest_ca_rolle_ch); 0.20::true_val(brand_headquarters, unk_brand_headquarters).

measured(s15, brand_headquarters, lake_forest_ca_rolle_ch).

all_consistent(brand_headquarters) :- consistent(s15, brand_headquarters).

evidence(all_consistent(brand_headquarters)).
query(true_val(brand_headquarters, lake_forest_ca_rolle_ch)).
query(true_val(brand_headquarters, unk_brand_headquarters)).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values sws_dubai=SWS_Solico_Winter_Sport_Dubai unk_manufacturing_location_current=Unknown
% @importance 0.875

0.90::acc(s6, manufacturing_location_current).
0.88::acc(s16, manufacturing_location_current).

0.97::true_val(manufacturing_location_current, sws_dubai); 0.03::true_val(manufacturing_location_current, unk_manufacturing_location_current).

measured(s6, manufacturing_location_current, sws_dubai).
measured(s16, manufacturing_location_current, sws_dubai).

all_consistent(manufacturing_location_current) :-
    consistent(s6, manufacturing_location_current),
    consistent(s16, manufacturing_location_current).

evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, sws_dubai)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

% @attr all_boards_sws
% @type categorical
% @canonical false
% @original_name All thirtytwo boards built at SWS
% @values yes_all_at_sws=Yes_all_boards_at_SWS unk_all_boards_sws=Unknown
% @importance 0.85

0.88::acc(s16, all_boards_sws).

0.90::true_val(all_boards_sws, yes_all_at_sws); 0.10::true_val(all_boards_sws, unk_all_boards_sws).

measured(s16, all_boards_sws, yes_all_at_sws).

all_consistent(all_boards_sws) :- consistent(s16, all_boards_sws).

evidence(all_consistent(all_boards_sws)).
query(true_val(all_boards_sws, yes_all_at_sws)).
query(true_val(all_boards_sws, unk_all_boards_sws)).

% @attr first_snowboard_line
% @type categorical
% @canonical false
% @original_name ThirtyTwo first-ever snowboard line
% @values yes_first_after_30yrs=Yes_first_ever_after_30_years_on_snow unk_first_snowboard_line=Unknown
% @importance 0.775

0.88::acc(s17, first_snowboard_line).
0.88::acc(s16, first_snowboard_line).

0.95::true_val(first_snowboard_line, yes_first_after_30yrs); 0.05::true_val(first_snowboard_line, unk_first_snowboard_line).

measured(s17, first_snowboard_line, yes_first_after_30yrs).
measured(s16, first_snowboard_line, yes_first_after_30yrs).

all_consistent(first_snowboard_line) :-
    consistent(s17, first_snowboard_line),
    consistent(s16, first_snowboard_line).

evidence(all_consistent(first_snowboard_line)).
query(true_val(first_snowboard_line, yes_first_after_30yrs)).
query(true_val(first_snowboard_line, unk_first_snowboard_line)).

% @attr board_development_timeline
% @type categorical
% @canonical false
% @original_name Board development timeline
% @values apr_jun_aug_2025=Started_Apr2025_shapes_Jun2025_testing_Aug2025 unk_board_development_timeline=Unknown
% @importance 0.80

0.92::acc(s18, board_development_timeline).

0.90::true_val(board_development_timeline, apr_jun_aug_2025); 0.10::true_val(board_development_timeline, unk_board_development_timeline).

measured(s18, board_development_timeline, apr_jun_aug_2025).

all_consistent(board_development_timeline) :- consistent(s18, board_development_timeline).

evidence(all_consistent(board_development_timeline)).
query(true_val(board_development_timeline, apr_jun_aug_2025)).
query(true_val(board_development_timeline, unk_board_development_timeline)).

% @attr full_line_scope
% @type categorical
% @canonical false
% @original_name ThirtyTwo full 26/27 line scope
% @values twelve_shapes_108_sizes_86_models=12_custom_shapes_108_sizes_86_models unk_full_line_scope=Unknown
% @importance 0.825

0.88::acc(s16, full_line_scope).
0.92::acc(s18, full_line_scope).

0.95::true_val(full_line_scope, twelve_shapes_108_sizes_86_models); 0.05::true_val(full_line_scope, unk_full_line_scope).

measured(s16, full_line_scope, twelve_shapes_108_sizes_86_models).
measured(s18, full_line_scope, twelve_shapes_108_sizes_86_models).

all_consistent(full_line_scope) :-
    consistent(s16, full_line_scope),
    consistent(s18, full_line_scope).

evidence(all_consistent(full_line_scope)).
query(true_val(full_line_scope, twelve_shapes_108_sizes_86_models)).
query(true_val(full_line_scope, unk_full_line_scope)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values season_2025_26=Season_2025_2026 y2025=2025 y2026=2026 y2027=2027
% @importance 0.79

0.75::acc(sm, model_year).
0.88::acc(s19, model_year).
0.82::acc(s4, model_year).
0.65::acc(s20, model_year).

0.50::true_val(model_year, season_2025_26); 0.20::true_val(model_year, y2025); 0.10::true_val(model_year, y2026); 0.20::true_val(model_year, y2027).

measured(sm, model_year, y2025).
measured(s19, model_year, y2027).
measured(s4, model_year, season_2025_26).
measured(s20, model_year, y2026).

all_consistent(model_year) :-
    (indep(sm), consistent(sm, model_year) ; \+indep(sm)),
    (indep(s19), consistent(s19, model_year) ; \+indep(s19)),
    (indep(s4), consistent(s4, model_year) ; \+indep(s4)),
    (indep(s20), consistent(s20, model_year) ; \+indep(s20)).

evidence(all_consistent(model_year)).
query(true_val(model_year, season_2025_26)).
query(true_val(model_year, y2025)).
query(true_val(model_year, y2026)).
query(true_val(model_year, y2027)).

% @attr announcement_date
% @type categorical
% @canonical false
% @original_name Scott Stevens joining announcement date
% @values jan_16_2026=January_16_2026 unk_announcement_date=Unknown
% @importance 0.80

0.88::acc(s21, announcement_date).

0.90::true_val(announcement_date, jan_16_2026); 0.10::true_val(announcement_date, unk_announcement_date).

measured(s21, announcement_date, jan_16_2026).

all_consistent(announcement_date) :- consistent(s21, announcement_date).

evidence(all_consistent(announcement_date)).
query(true_val(announcement_date, jan_16_2026)).
query(true_val(announcement_date, unk_announcement_date)).

% @attr drop_date
% @type categorical
% @canonical false
% @original_name Board drop date
% @values mid_jan_2026=Mid_January_2026 unk_drop_date=Unknown
% @importance 0.85

0.88::acc(s21, drop_date).
0.88::acc(s6, drop_date).

0.95::true_val(drop_date, mid_jan_2026); 0.05::true_val(drop_date, unk_drop_date).

measured(s21, drop_date, mid_jan_2026).
measured(s6, drop_date, mid_jan_2026).

all_consistent(drop_date) :-
    consistent(s21, drop_date),
    consistent(s6, drop_date).

evidence(all_consistent(drop_date)).
query(true_val(drop_date, mid_jan_2026)).
query(true_val(drop_date, unk_drop_date)).

% @attr early_release_status
% @type categorical
% @canonical false
% @original_name Early release limited edition status
% @values yes_pre_full_line=Yes_predates_full_line_arriving_Fall_2026 unk_early_release_status=Unknown
% @importance 0.775

0.90::acc(s22, early_release_status).
0.88::acc(s16, early_release_status).

0.95::true_val(early_release_status, yes_pre_full_line); 0.05::true_val(early_release_status, unk_early_release_status).

measured(s22, early_release_status, yes_pre_full_line).
measured(s16, early_release_status, yes_pre_full_line).

all_consistent(early_release_status) :-
    consistent(s22, early_release_status),
    consistent(s16, early_release_status).

evidence(all_consistent(early_release_status)).
query(true_val(early_release_status, yes_pre_full_line)).
query(true_val(early_release_status, unk_early_release_status)).

% @attr price_usd_msrp
% @type numeric
% @canonical false
% @original_name price_usd_msrp
% @unit USD
% @values v599_95=599.95 unk_price_usd_msrp=Unknown
% @importance 1.0

0.95::acc(s23, price_usd_msrp).

0.95::true_val(price_usd_msrp, v599_95); 0.05::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s23, price_usd_msrp, v599_95).

all_consistent(price_usd_msrp) :- consistent(s23, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v599_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_aud_merchant
% @type numeric
% @canonical false
% @original_name price_aud_merchant
% @unit AUD
% @values v1079_99=1079.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.95::acc(sm, price_aud_merchant).

0.95::true_val(price_aud_merchant, v1079_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(sm, price_aud_merchant, v1079_99).

all_consistent(price_aud_merchant) :- consistent(sm, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v1079_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_usd_evo
% @type numeric
% @canonical false
% @original_name price_usd_evo
% @unit USD
% @values v599_95=599.95 unk_price_usd_evo=Unknown
% @importance 0.95

0.92::acc(s19, price_usd_evo).

0.95::true_val(price_usd_evo, v599_95); 0.05::true_val(price_usd_evo, unk_price_usd_evo).

measured(s19, price_usd_evo, v599_95).

all_consistent(price_usd_evo) :-
    (indep(s19), consistent(s19, price_usd_evo) ; \+indep(s19)).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v599_95)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_backwoods
% @type numeric
% @canonical false
% @original_name Price Backwoods
% @unit USD
% @values v599_95=599.95 unk_price_usd_backwoods=Unknown
% @importance 0.90

0.85::acc(s24, price_usd_backwoods).

0.90::true_val(price_usd_backwoods, v599_95); 0.10::true_val(price_usd_backwoods, unk_price_usd_backwoods).

measured(s24, price_usd_backwoods, v599_95).

all_consistent(price_usd_backwoods) :-
    (indep(s24), consistent(s24, price_usd_backwoods) ; \+indep(s24)).

evidence(all_consistent(price_usd_backwoods)).
query(true_val(price_usd_backwoods, v599_95)).
query(true_val(price_usd_backwoods, unk_price_usd_backwoods)).

% @attr price_usd_eastern_boarder
% @type categorical
% @canonical false
% @original_name Price Eastern Boarder
% @unit USD
% @values regular_599_95_sale_539_96=Regular_599_95_sale_539_96 unk_price_usd_eastern_boarder=Unknown
% @importance 0.90

0.88::acc(s25, price_usd_eastern_boarder).

0.90::true_val(price_usd_eastern_boarder, regular_599_95_sale_539_96); 0.10::true_val(price_usd_eastern_boarder, unk_price_usd_eastern_boarder).

measured(s25, price_usd_eastern_boarder, regular_599_95_sale_539_96).

all_consistent(price_usd_eastern_boarder) :-
    (indep(s25), consistent(s25, price_usd_eastern_boarder) ; \+indep(s25)).

evidence(all_consistent(price_usd_eastern_boarder)).
query(true_val(price_usd_eastern_boarder, regular_599_95_sale_539_96)).
query(true_val(price_usd_eastern_boarder, unk_price_usd_eastern_boarder)).

% @attr price_usd_freeride
% @type numeric
% @canonical false
% @original_name Price Freeride Boardshop
% @unit USD
% @values v558_00=558.0 unk_price_usd_freeride=Unknown
% @importance 0.90

0.85::acc(s26, price_usd_freeride).

0.88::true_val(price_usd_freeride, v558_00); 0.12::true_val(price_usd_freeride, unk_price_usd_freeride).

measured(s26, price_usd_freeride, v558_00).

all_consistent(price_usd_freeride) :-
    (indep(s26), consistent(s26, price_usd_freeride) ; \+indep(s26)).

evidence(all_consistent(price_usd_freeride)).
query(true_val(price_usd_freeride, v558_00)).
query(true_val(price_usd_freeride, unk_price_usd_freeride)).

% @attr price_usd_evo_bundle
% @type numeric
% @canonical false
% @original_name Price evo board+binding bundle
% @unit USD
% @values v949_90=949.9 unk_price_usd_evo_bundle=Unknown
% @importance 0.70

0.88::acc(s27, price_usd_evo_bundle).

0.90::true_val(price_usd_evo_bundle, v949_90); 0.10::true_val(price_usd_evo_bundle, unk_price_usd_evo_bundle).

measured(s27, price_usd_evo_bundle, v949_90).

all_consistent(price_usd_evo_bundle) :-
    (indep(s19), consistent(s19, price_usd_evo_bundle) ; \+indep(s19)).

evidence(all_consistent(price_usd_evo_bundle)).
query(true_val(price_usd_evo_bundle, v949_90)).
query(true_val(price_usd_evo_bundle, unk_price_usd_evo_bundle)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values capita_doa_burton_custom_endeavor_pioneer_spring_break=CAPiTA_DOA_Burton_Custom_Endeavor_Pioneer_Spring_Break unk_comparable_board_cross_brand=Unknown
% @importance 0.775

0.70::acc(s28, comparable_board_cross_brand).
0.70::acc(s29, comparable_board_cross_brand).
0.75::acc(s30, comparable_board_cross_brand).

0.90::true_val(comparable_board_cross_brand, capita_doa_burton_custom_endeavor_pioneer_spring_break); 0.10::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s28, comparable_board_cross_brand, capita_doa_burton_custom_endeavor_pioneer_spring_break).
measured(s29, comparable_board_cross_brand, capita_doa_burton_custom_endeavor_pioneer_spring_break).
measured(s30, comparable_board_cross_brand, capita_doa_burton_custom_endeavor_pioneer_spring_break).

all_consistent(comparable_board_cross_brand) :-
    consistent(s28, comparable_board_cross_brand),
    consistent(s29, comparable_board_cross_brand),
    consistent(s30, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, capita_doa_burton_custom_endeavor_pioneer_spring_break)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values available_direct=Available_thirtytwo_com_direct unk_availability_status=Unknown
% @importance 1.0

0.95::acc(s23, availability_status).

0.95::true_val(availability_status, available_direct); 0.05::true_val(availability_status, unk_availability_status).

measured(s23, availability_status, available_direct).

all_consistent(availability_status) :- consistent(s23, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, available_direct)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status evo
% @values in_stock=In_stock_evo unk_availability_status_evo=Unknown
% @importance 0.95

0.90::acc(s19, availability_status_evo).

0.95::true_val(availability_status_evo, in_stock); 0.05::true_val(availability_status_evo, unk_availability_status_evo).

measured(s19, availability_status_evo, in_stock).

all_consistent(availability_status_evo) :-
    (indep(s19), consistent(s19, availability_status_evo) ; \+indep(s19)).

evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, in_stock)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

% @attr availability_status_snowboards_com
% @type categorical
% @canonical false
% @original_name availability_status Snowboards.com
% @values available=Available_Snowboards_com unk_availability_status_snowboards_com=Unknown
% @importance 0.80

0.80::acc(s4, availability_status_snowboards_com).

0.90::true_val(availability_status_snowboards_com, available); 0.10::true_val(availability_status_snowboards_com, unk_availability_status_snowboards_com).

measured(s4, availability_status_snowboards_com, available).

all_consistent(availability_status_snowboards_com) :-
    (indep(s4), consistent(s4, availability_status_snowboards_com) ; \+indep(s4)).

evidence(all_consistent(availability_status_snowboards_com)).
query(true_val(availability_status_snowboards_com, available)).
query(true_val(availability_status_snowboards_com, unk_availability_status_snowboards_com)).

% @attr availability_status_eastern_boarder
% @type categorical
% @canonical false
% @original_name availability_status Eastern Boarder
% @values low_stock_1_left_155=Low_stock_1_item_left_155cm unk_availability_status_eastern_boarder=Unknown
% @importance 0.90

0.88::acc(s25, availability_status_eastern_boarder).

0.90::true_val(availability_status_eastern_boarder, low_stock_1_left_155); 0.10::true_val(availability_status_eastern_boarder, unk_availability_status_eastern_boarder).

measured(s25, availability_status_eastern_boarder, low_stock_1_left_155).

all_consistent(availability_status_eastern_boarder) :-
    (indep(s25), consistent(s25, availability_status_eastern_boarder) ; \+indep(s25)).

evidence(all_consistent(availability_status_eastern_boarder)).
query(true_val(availability_status_eastern_boarder, low_stock_1_left_155)).
query(true_val(availability_status_eastern_boarder, unk_availability_status_eastern_boarder)).

% @attr availability_status_backwoods
% @type categorical
% @canonical false
% @original_name availability_status Backwoods
% @values available=Available_Backwoods unk_availability_status_backwoods=Unknown
% @importance 0.90

0.85::acc(s24, availability_status_backwoods).

0.88::true_val(availability_status_backwoods, available); 0.12::true_val(availability_status_backwoods, unk_availability_status_backwoods).

measured(s24, availability_status_backwoods, available).

all_consistent(availability_status_backwoods) :-
    (indep(s24), consistent(s24, availability_status_backwoods) ; \+indep(s24)).

evidence(all_consistent(availability_status_backwoods)).
query(true_val(availability_status_backwoods, available)).
query(true_val(availability_status_backwoods, unk_availability_status_backwoods)).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status Blauer Board Shop
% @values available=Available_Blauer unk_availability_status_blauer=Unknown
% @importance 0.80

0.82::acc(s8, availability_status_blauer).

0.88::true_val(availability_status_blauer, available); 0.12::true_val(availability_status_blauer, unk_availability_status_blauer).

measured(s8, availability_status_blauer, available).

all_consistent(availability_status_blauer) :-
    (indep(s8), consistent(s8, availability_status_blauer) ; \+indep(s8)).

evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, available)).
query(true_val(availability_status_blauer, unk_availability_status_blauer)).

% @attr availability_status_freeride
% @type categorical
% @canonical false
% @original_name availability_status Freeride Boardshop
% @values available_558usd=Available_Freeride_558USD unk_availability_status_freeride=Unknown
% @importance 0.90

0.85::acc(s26, availability_status_freeride).

0.88::true_val(availability_status_freeride, available_558usd); 0.12::true_val(availability_status_freeride, unk_availability_status_freeride).

measured(s26, availability_status_freeride, available_558usd).

all_consistent(availability_status_freeride) :-
    (indep(s26), consistent(s26, availability_status_freeride) ; \+indep(s26)).

evidence(all_consistent(availability_status_freeride)).
query(true_val(availability_status_freeride, available_558usd)).
query(true_val(availability_status_freeride, unk_availability_status_freeride)).

% @attr availability_status_melbourne
% @type categorical
% @canonical false
% @original_name availability_status Melbourne Snowboard Centre
% @values available=Available_Melbourne unk_availability_status_melbourne=Unknown
% @importance 0.85

0.85::acc(s31, availability_status_melbourne).

0.90::true_val(availability_status_melbourne, available); 0.10::true_val(availability_status_melbourne, unk_availability_status_melbourne).

measured(s31, availability_status_melbourne, available).

all_consistent(availability_status_melbourne) :-
    (indep(s31), consistent(s31, availability_status_melbourne) ; \+indep(s31)).

evidence(all_consistent(availability_status_melbourne)).
query(true_val(availability_status_melbourne, available)).
query(true_val(availability_status_melbourne, unk_availability_status_melbourne)).

% @attr availability_status_sessions
% @type categorical
% @canonical false
% @original_name availability_status Sessions Ride Co
% @values early_release_secured=Early_release_boards_secured unk_availability_status_sessions=Unknown
% @importance 0.85

0.82::acc(s7, availability_status_sessions).

0.88::true_val(availability_status_sessions, early_release_secured); 0.12::true_val(availability_status_sessions, unk_availability_status_sessions).

measured(s7, availability_status_sessions, early_release_secured).

all_consistent(availability_status_sessions) :-
    (indep(s7), consistent(s7, availability_status_sessions) ; \+indep(s7)).

evidence(all_consistent(availability_status_sessions)).
query(true_val(availability_status_sessions, early_release_secured)).
query(true_val(availability_status_sessions, unk_availability_status_sessions)).

% @attr availability_status_think_empire
% @type categorical
% @canonical false
% @original_name availability_status Think Empire
% @values listed_2026_5=Listed_as_2026_5 unk_availability_status_think_empire=Unknown
% @importance 0.50

0.65::acc(s32, availability_status_think_empire).

0.78::true_val(availability_status_think_empire, listed_2026_5); 0.22::true_val(availability_status_think_empire, unk_availability_status_think_empire).

measured(s32, availability_status_think_empire, listed_2026_5).

all_consistent(availability_status_think_empire) :-
    (indep(s32), consistent(s32, availability_status_think_empire) ; \+indep(s32)).

evidence(all_consistent(availability_status_think_empire)).
query(true_val(availability_status_think_empire, listed_2026_5)).
query(true_val(availability_status_think_empire, unk_availability_status_think_empire)).

% @attr availability_status_boyne
% @type categorical
% @canonical false
% @original_name availability_status Boyne Country Sports
% @values available=Available_Boyne unk_availability_status_boyne=Unknown
% @importance 0.70

0.75::acc(s33, availability_status_boyne).

0.85::true_val(availability_status_boyne, available); 0.15::true_val(availability_status_boyne, unk_availability_status_boyne).

measured(s33, availability_status_boyne, available).

all_consistent(availability_status_boyne) :-
    (indep(s33), consistent(s33, availability_status_boyne) ; \+indep(s33)).

evidence(all_consistent(availability_status_boyne)).
query(true_val(availability_status_boyne, available)).
query(true_val(availability_status_boyne, unk_availability_status_boyne)).

% @attr availability_status_ski_pro_az
% @type categorical
% @canonical false
% @original_name availability_status Ski Pro AZ
% @values sold_out_all_sizes=All_three_sizes_sold_out unk_availability_status_ski_pro_az=Unknown
% @importance 0.80

0.80::acc(s34, availability_status_ski_pro_az).

0.88::true_val(availability_status_ski_pro_az, sold_out_all_sizes); 0.12::true_val(availability_status_ski_pro_az, unk_availability_status_ski_pro_az).

measured(s34, availability_status_ski_pro_az, sold_out_all_sizes).

all_consistent(availability_status_ski_pro_az) :-
    (indep(s34), consistent(s34, availability_status_ski_pro_az) ; \+indep(s34)).

evidence(all_consistent(availability_status_ski_pro_az)).
query(true_val(availability_status_ski_pro_az, sold_out_all_sizes)).
query(true_val(availability_status_ski_pro_az, unk_availability_status_ski_pro_az)).

% @attr availability_status_aspen
% @type categorical
% @canonical false
% @original_name availability_status Aspen Ski and Board
% @values backordered_157=Backordered_157cm unk_availability_status_aspen=Unknown
% @importance 0.70

0.72::acc(s20, availability_status_aspen).

0.82::true_val(availability_status_aspen, backordered_157); 0.18::true_val(availability_status_aspen, unk_availability_status_aspen).

measured(s20, availability_status_aspen, backordered_157).

all_consistent(availability_status_aspen) :-
    (indep(s20), consistent(s20, availability_status_aspen) ; \+indep(s20)).

evidence(all_consistent(availability_status_aspen)).
query(true_val(availability_status_aspen, backordered_157)).
query(true_val(availability_status_aspen, unk_availability_status_aspen)).

% @attr available_sizes
% @type categorical
% @canonical false
% @original_name available_sizes
% @values s155_157_158w=155cm_157cm_158cm_Wide unk_available_sizes=Unknown
% @importance 0.875

0.92::acc(s6, available_sizes).
0.93::acc(sm, available_sizes).

0.97::true_val(available_sizes, s155_157_158w); 0.03::true_val(available_sizes, unk_available_sizes).

measured(s6, available_sizes, s155_157_158w).
measured(sm, available_sizes, s155_157_158w).

all_consistent(available_sizes) :-
    consistent(s6, available_sizes),
    (indep(sm), consistent(sm, available_sizes) ; \+indep(sm)).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, s155_157_158w)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr waist_width_155
% @type numeric
% @canonical false
% @original_name Variant 155cm waist width
% @unit cm
% @values v25_5=25.5 unk_waist_width_155=Unknown
% @importance 0.85

0.92::acc(sm, waist_width_155).

0.95::true_val(waist_width_155, v25_5); 0.05::true_val(waist_width_155, unk_waist_width_155).

measured(sm, waist_width_155, v25_5).

all_consistent(waist_width_155) :-
    (indep(sm), consistent(sm, waist_width_155) ; \+indep(sm)).

evidence(all_consistent(waist_width_155)).
query(true_val(waist_width_155, v25_5)).
query(true_val(waist_width_155, unk_waist_width_155)).

% @attr waist_width_157
% @type numeric
% @canonical false
% @original_name Variant 157cm waist width
% @unit cm
% @values v25_7=25.7 unk_waist_width_157=Unknown
% @importance 0.85

0.92::acc(sm, waist_width_157).

0.95::true_val(waist_width_157, v25_7); 0.05::true_val(waist_width_157, unk_waist_width_157).

measured(sm, waist_width_157, v25_7).

all_consistent(waist_width_157) :-
    (indep(sm), consistent(sm, waist_width_157) ; \+indep(sm)).

evidence(all_consistent(waist_width_157)).
query(true_val(waist_width_157, v25_7)).
query(true_val(waist_width_157, unk_waist_width_157)).

% @attr waist_width_158w
% @type numeric
% @canonical false
% @original_name Variant 158W cm waist width
% @unit cm
% @values v26_4=26.4 unk_waist_width_158w=Unknown
% @importance 0.85

0.92::acc(sm, waist_width_158w).

0.95::true_val(waist_width_158w, v26_4); 0.05::true_val(waist_width_158w, unk_waist_width_158w).

measured(sm, waist_width_158w, v26_4).

all_consistent(waist_width_158w) :-
    (indep(sm), consistent(sm, waist_width_158w) ; \+indep(sm)).

evidence(all_consistent(waist_width_158w)).
query(true_val(waist_width_158w, v26_4)).
query(true_val(waist_width_158w, unk_waist_width_158w)).

% @attr sidecut_radius_size_155
% @type categorical
% @canonical false
% @original_name sidecut_radius_size 155cm
% @unit m
% @values r8_0_7_6_7_2_7_6_8_0=8.0_7.6_7.2_7.6_8.0m unk_sidecut_radius_size_155=Unknown
% @importance 0.85

0.92::acc(sm, sidecut_radius_size_155).

0.95::true_val(sidecut_radius_size_155, r8_0_7_6_7_2_7_6_8_0); 0.05::true_val(sidecut_radius_size_155, unk_sidecut_radius_size_155).

measured(sm, sidecut_radius_size_155, r8_0_7_6_7_2_7_6_8_0).

all_consistent(sidecut_radius_size_155) :-
    (indep(sm), consistent(sm, sidecut_radius_size_155) ; \+indep(sm)).

evidence(all_consistent(sidecut_radius_size_155)).
query(true_val(sidecut_radius_size_155, r8_0_7_6_7_2_7_6_8_0)).
query(true_val(sidecut_radius_size_155, unk_sidecut_radius_size_155)).

% @attr sidecut_radius_size
% @type categorical
% @canonical true
% @original_name sidecut_radius_size 157cm
% @unit m
% @values r8_1_7_7_7_3_7_7_8_1=8.1_7.7_7.3_7.7_8.1m unk_sidecut_radius_size=Unknown
% @importance 0.85

0.92::acc(sm, sidecut_radius_size).

0.95::true_val(sidecut_radius_size, r8_1_7_7_7_3_7_7_8_1); 0.05::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(sm, sidecut_radius_size, r8_1_7_7_7_3_7_7_8_1).

all_consistent(sidecut_radius_size) :-
    (indep(sm), consistent(sm, sidecut_radius_size) ; \+indep(sm)).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, r8_1_7_7_7_3_7_7_8_1)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr sidecut_radius_size_158w
% @type categorical
% @canonical false
% @original_name sidecut_radius_size 158W
% @unit m
% @values r8_2_7_8_7_4_7_8_8_2=8.2_7.8_7.4_7.8_8.2m unk_sidecut_radius_size_158w=Unknown
% @importance 0.85

0.92::acc(sm, sidecut_radius_size_158w).

0.95::true_val(sidecut_radius_size_158w, r8_2_7_8_7_4_7_8_8_2); 0.05::true_val(sidecut_radius_size_158w, unk_sidecut_radius_size_158w).

measured(sm, sidecut_radius_size_158w, r8_2_7_8_7_4_7_8_8_2).

all_consistent(sidecut_radius_size_158w) :-
    (indep(sm), consistent(sm, sidecut_radius_size_158w) ; \+indep(sm)).

evidence(all_consistent(sidecut_radius_size_158w)).
query(true_val(sidecut_radius_size_158w, r8_2_7_8_7_4_7_8_8_2)).
query(true_val(sidecut_radius_size_158w, unk_sidecut_radius_size_158w)).

% @attr effective_edge_155
% @type numeric
% @canonical false
% @original_name Effective edge 155cm
% @unit cm
% @values v118_0=118.0 unk_effective_edge_155=Unknown
% @importance 0.85

0.92::acc(sm, effective_edge_155).

0.95::true_val(effective_edge_155, v118_0); 0.05::true_val(effective_edge_155, unk_effective_edge_155).

measured(sm, effective_edge_155, v118_0).

all_consistent(effective_edge_155) :-
    (indep(sm), consistent(sm, effective_edge_155) ; \+indep(sm)).

evidence(all_consistent(effective_edge_155)).
query(true_val(effective_edge_155, v118_0)).
query(true_val(effective_edge_155, unk_effective_edge_155)).

% @attr effective_edge_157
% @type numeric
% @canonical false
% @original_name Effective edge 157cm
% @unit cm
% @values v119_6=119.6 unk_effective_edge_157=Unknown
% @importance 0.85

0.92::acc(sm, effective_edge_157).

0.95::true_val(effective_edge_157, v119_6); 0.05::true_val(effective_edge_157, unk_effective_edge_157).

measured(sm, effective_edge_157, v119_6).

all_consistent(effective_edge_157) :-
    (indep(sm), consistent(sm, effective_edge_157) ; \+indep(sm)).

evidence(all_consistent(effective_edge_157)).
query(true_val(effective_edge_157, v119_6)).
query(true_val(effective_edge_157, unk_effective_edge_157)).

% @attr effective_edge_158w
% @type numeric
% @canonical false
% @original_name Effective edge 158W cm
% @unit cm
% @values v120_4=120.4 unk_effective_edge_158w=Unknown
% @importance 0.85

0.92::acc(sm, effective_edge_158w).

0.95::true_val(effective_edge_158w, v120_4); 0.05::true_val(effective_edge_158w, unk_effective_edge_158w).

measured(sm, effective_edge_158w, v120_4).

all_consistent(effective_edge_158w) :-
    (indep(sm), consistent(sm, effective_edge_158w) ; \+indep(sm)).

evidence(all_consistent(effective_edge_158w)).
query(true_val(effective_edge_158w, v120_4)).
query(true_val(effective_edge_158w, unk_effective_edge_158w)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 0.85

0.92::acc(sm, width_options).

0.95::true_val(width_options, standard_and_wide); 0.05::true_val(width_options, unk_width_options).

measured(sm, width_options, standard_and_wide).

all_consistent(width_options) :-
    (indep(sm), consistent(sm, width_options) ; \+indep(sm)).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

% @attr sku_155
% @type categorical
% @canonical false
% @original_name SKU 155cm
% @values t_26_snu_mep_155=T.26.SNU.MEP-155 unk_sku_155=Unknown
% @importance 0.85

0.92::acc(sm, sku_155).

0.95::true_val(sku_155, t_26_snu_mep_155); 0.05::true_val(sku_155, unk_sku_155).

measured(sm, sku_155, t_26_snu_mep_155).

all_consistent(sku_155) :-
    (indep(sm), consistent(sm, sku_155) ; \+indep(sm)).

evidence(all_consistent(sku_155)).
query(true_val(sku_155, t_26_snu_mep_155)).
query(true_val(sku_155, unk_sku_155)).

% @attr item_code
% @type categorical
% @canonical false
% @original_name Item code
% @values t_26_snu_mep_xx=T.26.SNU.MEP.XX unk_item_code=Unknown
% @importance 1.0

0.95::acc(s1, item_code).

0.95::true_val(item_code, t_26_snu_mep_xx); 0.05::true_val(item_code, unk_item_code).

measured(s1, item_code, t_26_snu_mep_xx).

all_consistent(item_code) :- consistent(s1, item_code).

evidence(all_consistent(item_code)).
query(true_val(item_code, t_26_snu_mep_xx)).
query(true_val(item_code, unk_item_code)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values true_twin=True_Twin_Twin_Tip unk_shape=Unknown
% @importance 0.925

0.95::acc(s1, shape).
0.92::acc(sm, shape).

0.97::true_val(shape, true_twin); 0.03::true_val(shape, unk_shape).

measured(s1, shape, true_twin).
measured(sm, shape, true_twin).

all_consistent(shape) :-
    consistent(s1, shape),
    (indep(sm), consistent(sm, shape) ; \+indep(sm)).

evidence(all_consistent(shape)).
query(true_val(shape, true_twin)).
query(true_val(shape, unk_shape)).

% @attr shape_silhouette
% @type categorical
% @canonical false
% @original_name shape silhouette
% @values retro_popsicle=Retro_popsicle_shape unk_shape_silhouette=Unknown
% @importance 1.0

0.90::acc(s1, shape_silhouette).

0.90::true_val(shape_silhouette, retro_popsicle); 0.10::true_val(shape_silhouette, unk_shape_silhouette).

measured(s1, shape_silhouette, retro_popsicle).

all_consistent(shape_silhouette) :- consistent(s1, shape_silhouette).

evidence(all_consistent(shape_silhouette)).
query(true_val(shape_silhouette, retro_popsicle)).
query(true_val(shape_silhouette, unk_shape_silhouette)).

% @attr setback
% @type categorical
% @canonical false
% @original_name setback
% @values centered=Centered unk_setback=Unknown
% @importance 1.0

0.95::acc(s1, setback).

0.95::true_val(setback, centered); 0.05::true_val(setback, unk_setback).

measured(s1, setback, centered).

all_consistent(setback) :- consistent(s1, setback).

evidence(all_consistent(setback)).
query(true_val(setback, centered)).
query(true_val(setback, unk_setback)).

% @attr taper
% @type categorical
% @canonical false
% @original_name taper
% @values no_taper=No_Taper unk_taper=Unknown
% @importance 1.0

0.95::acc(s1, taper).

0.95::true_val(taper, no_taper); 0.05::true_val(taper, unk_taper).

measured(s1, taper, no_taper).

all_consistent(taper) :- consistent(s1, taper).

evidence(all_consistent(taper)).
query(true_val(taper, no_taper)).
query(true_val(taper, unk_taper)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values medium_camber=True_Medium_Camber traditional_camber=Traditional_Camber hybrid_camber=Hybrid_Camber
% @importance 0.85

0.88::acc(sm, camber_type).
0.72::acc(s34, camber_type).
0.75::acc(s31, camber_type).

0.50::true_val(camber_type, medium_camber); 0.25::true_val(camber_type, traditional_camber); 0.25::true_val(camber_type, hybrid_camber).

measured(sm, camber_type, medium_camber).
measured(s34, camber_type, traditional_camber).
measured(s31, camber_type, hybrid_camber).

all_consistent(camber_type) :-
    (indep(sm), consistent(sm, camber_type) ; \+indep(sm)),
    (indep(s34), consistent(s34, camber_type) ; \+indep(s34)),
    (indep(s31), consistent(s31, camber_type) ; \+indep(s31)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, medium_camber)).
query(true_val(camber_type, traditional_camber)).
query(true_val(camber_type, hybrid_camber)).

% @attr nose_tail_rise
% @type categorical
% @canonical false
% @original_name Nose and tail rise
% @values all_terrain_kick=All_Terrain_Kick unk_nose_tail_rise=Unknown
% @importance 1.0

0.95::acc(s1, nose_tail_rise).

0.95::true_val(nose_tail_rise, all_terrain_kick); 0.05::true_val(nose_tail_rise, unk_nose_tail_rise).

measured(s1, nose_tail_rise, all_terrain_kick).

all_consistent(nose_tail_rise) :- consistent(s1, nose_tail_rise).

evidence(all_consistent(nose_tail_rise)).
query(true_val(nose_tail_rise, all_terrain_kick)).
query(true_val(nose_tail_rise, unk_nose_tail_rise)).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values progressive_five_radius=Progressive_Five_Radius_Blend unk_sidecut_type=Unknown
% @importance 0.90

0.95::acc(s1, sidecut_type).
0.92::acc(sm, sidecut_type).
0.82::acc(s31, sidecut_type).

0.97::true_val(sidecut_type, progressive_five_radius); 0.03::true_val(sidecut_type, unk_sidecut_type).

measured(s1, sidecut_type, progressive_five_radius).
measured(sm, sidecut_type, progressive_five_radius).
measured(s31, sidecut_type, progressive_five_radius).

all_consistent(sidecut_type) :-
    consistent(s1, sidecut_type),
    (indep(sm), consistent(sm, sidecut_type) ; \+indep(sm)),
    (indep(s31), consistent(s31, sidecut_type) ; \+indep(s31)).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, progressive_five_radius)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr flex_rating_10
% @type numeric
% @canonical false
% @original_name flex_rating_10
% @unit /10
% @values v5=5.0 unk_flex_rating_10=Unknown
% @importance 0.875

0.92::acc(sm, flex_rating_10).
0.85::acc(s26, flex_rating_10).

0.95::true_val(flex_rating_10, v5); 0.05::true_val(flex_rating_10, unk_flex_rating_10).

measured(sm, flex_rating_10, v5).
measured(s26, flex_rating_10, v5).

all_consistent(flex_rating_10) :-
    (indep(sm), consistent(sm, flex_rating_10) ; \+indep(sm)),
    (indep(s26), consistent(s26, flex_rating_10) ; \+indep(s26)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v5)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values medium_happy_medium=Medium_Happy_Medium unk_flex_feel=Unknown
% @importance 0.87

0.93::acc(s1, flex_feel).
0.90::acc(sm, flex_feel).
0.82::acc(s7, flex_feel).

0.95::true_val(flex_feel, medium_happy_medium); 0.05::true_val(flex_feel, unk_flex_feel).

measured(s1, flex_feel, medium_happy_medium).
measured(sm, flex_feel, medium_happy_medium).
measured(s7, flex_feel, medium_happy_medium).

all_consistent(flex_feel) :-
    consistent(s1, flex_feel),
    (indep(sm), consistent(sm, flex_feel) ; \+indep(sm)),
    (indep(s7), consistent(s7, flex_feel) ; \+indep(s7)).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium_happy_medium)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr flex_direction
% @type categorical
% @canonical false
% @original_name flex_direction
% @values twin_symmetrical=Twin_symmetrical_flex unk_flex_direction=Unknown
% @importance 0.85

0.88::acc(sm, flex_direction).

0.92::true_val(flex_direction, twin_symmetrical); 0.08::true_val(flex_direction, unk_flex_direction).

measured(sm, flex_direction, twin_symmetrical).

all_consistent(flex_direction) :-
    (indep(sm), consistent(sm, flex_direction) ; \+indep(sm)).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, twin_symmetrical)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values p10_pa10_bamboo=10mm_Poplar_10mm_Paulownia_Bamboo_Rails p10_pa20_bamboo=10mm_Poplar_20mm_Paulownia_Bamboo_Rails p20_pa20_bamboo=20mm_Poplar_20mm_Paulownia_Bamboo_Rails
% @importance 0.90

0.75::acc(s1, core_material).
0.80::acc(s35, core_material).
0.82::acc(s26, core_material).
0.82::acc(s31, core_material).
0.88::acc(sm, core_material).
0.72::acc(s36, core_material).
0.85::acc(s37, core_material).

0.25::true_val(core_material, p10_pa10_bamboo); 0.60::true_val(core_material, p10_pa20_bamboo); 0.15::true_val(core_material, p20_pa20_bamboo).

measured(s1, core_material, p10_pa10_bamboo).
measured(s35, core_material, p20_pa20_bamboo).
measured(s26, core_material, p10_pa20_bamboo).
measured(s31, core_material, p10_pa20_bamboo).
measured(sm, core_material, p10_pa20_bamboo).
measured(s36, core_material, p10_pa10_bamboo).
measured(s37, core_material, p10_pa20_bamboo).

all_consistent(core_material) :-
    consistent(s1, core_material),
    consistent(s35, core_material),
    (indep(s26), consistent(s26, core_material) ; \+indep(s26)),
    (indep(s31), consistent(s31, core_material) ; \+indep(s31)),
    (indep(sm), consistent(sm, core_material) ; \+indep(sm)),
    (indep(s36), consistent(s36, core_material) ; \+indep(s36)),
    (indep(s37), consistent(s37, core_material) ; \+indep(s37)).

evidence(all_consistent(core_material)).
query(true_val(core_material, p10_pa10_bamboo)).
query(true_val(core_material, p10_pa20_bamboo)).
query(true_val(core_material, p20_pa20_bamboo)).

% @attr core_description
% @type categorical
% @canonical false
% @original_name core_material description
% @values strongest_responsive=Strongest_most_responsive_core_best_strength_to_light_ratio unk_core_description=Unknown
% @importance 0.85

0.82::acc(s31, core_description).

0.85::true_val(core_description, strongest_responsive); 0.15::true_val(core_description, unk_core_description).

measured(s31, core_description, strongest_responsive).

all_consistent(core_description) :-
    (indep(s31), consistent(s31, core_description) ; \+indep(s31)).

evidence(all_consistent(core_description)).
query(true_val(core_description, strongest_responsive)).
query(true_val(core_description, unk_core_description)).

% @attr core_summary
% @type categorical
% @canonical false
% @original_name core_material summary
% @values poplar_paulownia_bamboo=Poplar_Paulownia_Bamboo unk_core_summary=Unknown
% @importance 0.925

0.92::acc(sm, core_summary).
0.93::acc(s1, core_summary).

0.97::true_val(core_summary, poplar_paulownia_bamboo); 0.03::true_val(core_summary, unk_core_summary).

measured(sm, core_summary, poplar_paulownia_bamboo).
measured(s1, core_summary, poplar_paulownia_bamboo).

all_consistent(core_summary) :-
    consistent(s1, core_summary),
    (indep(sm), consistent(sm, core_summary) ; \+indep(sm)).

evidence(all_consistent(core_summary)).
query(true_val(core_summary, poplar_paulownia_bamboo)).
query(true_val(core_summary, unk_core_summary)).

% @attr bamboo_rails
% @type categorical
% @canonical false
% @original_name Bamboo rails
% @values bamboo_edge_durability_snap=Bamboo_rails_along_edges_for_durability_and_snap unk_bamboo_rails=Unknown
% @importance 0.825

0.82::acc(s31, bamboo_rails).
0.85::acc(s8, bamboo_rails).

0.92::true_val(bamboo_rails, bamboo_edge_durability_snap); 0.08::true_val(bamboo_rails, unk_bamboo_rails).

measured(s31, bamboo_rails, bamboo_edge_durability_snap).
measured(s8, bamboo_rails, bamboo_edge_durability_snap).

all_consistent(bamboo_rails) :-
    (indep(s31), consistent(s31, bamboo_rails) ; \+indep(s31)),
    (indep(s8), consistent(s8, bamboo_rails) ; \+indep(s8)).

evidence(all_consistent(bamboo_rails)).
query(true_val(bamboo_rails, bamboo_edge_durability_snap)).
query(true_val(bamboo_rails, unk_bamboo_rails)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values biax=Biax_Fiberglass triax=Triax_Fiberglass both_biax_triax=Both_Biax_and_Triax
% @importance 0.90

0.82::acc(s26, laminate).
0.88::acc(sm, laminate).
0.75::acc(s35, laminate).
0.85::acc(s37, laminate).

0.55::true_val(laminate, biax); 0.15::true_val(laminate, triax); 0.30::true_val(laminate, both_biax_triax).

measured(s26, laminate, biax).
measured(sm, laminate, biax).
measured(s35, laminate, triax).
measured(s37, laminate, both_biax_triax).

all_consistent(laminate) :-
    (indep(s26), consistent(s26, laminate) ; \+indep(s26)),
    (indep(sm), consistent(sm, laminate) ; \+indep(sm)),
    consistent(s35, laminate),
    (indep(s37), consistent(s37, laminate) ; \+indep(s37)).

evidence(all_consistent(laminate)).
query(true_val(laminate, biax)).
query(true_val(laminate, triax)).
query(true_val(laminate, both_biax_triax)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values twin_carbon_boost_stringers=Twin_Carbon_Boost_Stringers unk_construction_material_innovation=Unknown
% @importance 0.87

0.93::acc(s1, construction_material_innovation).
0.90::acc(sm, construction_material_innovation).
0.78::acc(s34, construction_material_innovation).

0.97::true_val(construction_material_innovation, twin_carbon_boost_stringers); 0.03::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s1, construction_material_innovation, twin_carbon_boost_stringers).
measured(sm, construction_material_innovation, twin_carbon_boost_stringers).
measured(s34, construction_material_innovation, twin_carbon_boost_stringers).

all_consistent(construction_material_innovation) :-
    consistent(s1, construction_material_innovation),
    (indep(sm), consistent(sm, construction_material_innovation) ; \+indep(sm)),
    (indep(s34), consistent(s34, construction_material_innovation) ; \+indep(s34)).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, twin_carbon_boost_stringers)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr resin
% @type categorical
% @canonical true
% @original_name resin
% @values bio_epoxy_30pct=30pct_Bio_Epoxy_Resin unk_resin=Unknown
% @importance 0.875

0.90::acc(sm, resin).
0.85::acc(s26, resin).

0.95::true_val(resin, bio_epoxy_30pct); 0.05::true_val(resin, unk_resin).

measured(sm, resin, bio_epoxy_30pct).
measured(s26, resin, bio_epoxy_30pct).

all_consistent(resin) :-
    (indep(sm), consistent(sm, resin) ; \+indep(sm)),
    (indep(s26), consistent(s26, resin) ; \+indep(s26)).

evidence(all_consistent(resin)).
query(true_val(resin, bio_epoxy_30pct)).
query(true_val(resin, unk_resin)).

% @attr base_type
% @type categorical
% @canonical false
% @original_name base_type
% @values premium_sintered=Premium_Sintered_Base unk_base_type=Unknown
% @importance 0.875

0.90::acc(sm, base_type).
0.85::acc(s26, base_type).

0.95::true_val(base_type, premium_sintered); 0.05::true_val(base_type, unk_base_type).

measured(sm, base_type, premium_sintered).
measured(s26, base_type, premium_sintered).

all_consistent(base_type) :-
    (indep(sm), consistent(sm, base_type) ; \+indep(sm)),
    (indep(s26), consistent(s26, base_type) ; \+indep(s26)).

evidence(all_consistent(base_type)).
query(true_val(base_type, premium_sintered)).
query(true_val(base_type, unk_base_type)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_8_4m=8_4M_Sintered unk_base_material=Unknown
% @importance 0.875

0.78::acc(s34, base_material).
0.80::acc(s35, base_material).
0.80::acc(s31, base_material).

0.95::true_val(base_material, sintered_8_4m); 0.05::true_val(base_material, unk_base_material).

measured(s34, base_material, sintered_8_4m).
measured(s35, base_material, sintered_8_4m).
measured(s31, base_material, sintered_8_4m).

all_consistent(base_material) :-
    (indep(s34), consistent(s34, base_material) ; \+indep(s34)),
    consistent(s35, base_material),
    (indep(s31), consistent(s31, base_material) ; \+indep(s31)).

evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_8_4m)).
query(true_val(base_material, unk_base_material)).

% @attr factory_wax
% @type categorical
% @canonical false
% @original_name Wax
% @values fast_wend_natural=Fast_Wend_Natural_Wax_factory_waxed unk_factory_wax=Unknown
% @importance 0.825

0.90::acc(sm, factory_wax).
0.82::acc(s8, factory_wax).

0.95::true_val(factory_wax, fast_wend_natural); 0.05::true_val(factory_wax, unk_factory_wax).

measured(sm, factory_wax, fast_wend_natural).
measured(s8, factory_wax, fast_wend_natural).

all_consistent(factory_wax) :-
    (indep(sm), consistent(sm, factory_wax) ; \+indep(sm)),
    (indep(s8), consistent(s8, factory_wax) ; \+indep(s8)).

evidence(all_consistent(factory_wax)).
query(true_val(factory_wax, fast_wend_natural)).
query(true_val(factory_wax, unk_factory_wax)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values hardened_steel=Hardened_Steel_Edge_modified_stronger unk_edge_technology=Unknown
% @importance 0.825

0.90::acc(sm, edge_technology).
0.82::acc(s31, edge_technology).

0.95::true_val(edge_technology, hardened_steel); 0.05::true_val(edge_technology, unk_edge_technology).

measured(sm, edge_technology, hardened_steel).
measured(s31, edge_technology, hardened_steel).

all_consistent(edge_technology) :-
    (indep(sm), consistent(sm, edge_technology) ; \+indep(sm)),
    (indep(s31), consistent(s31, edge_technology) ; \+indep(s31)).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, hardened_steel)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values railguard=RailGuard_Sidewall_flexible_impact_resistant unk_sidewall_material=Unknown
% @importance 0.825

0.90::acc(sm, sidewall_material).
0.82::acc(s8, sidewall_material).
0.80::acc(s31, sidewall_material).

0.95::true_val(sidewall_material, railguard); 0.05::true_val(sidewall_material, unk_sidewall_material).

measured(sm, sidewall_material, railguard).
measured(s8, sidewall_material, railguard).
measured(s31, sidewall_material, railguard).

all_consistent(sidewall_material) :-
    (indep(sm), consistent(sm, sidewall_material) ; \+indep(sm)),
    (indep(s8), consistent(s8, sidewall_material) ; \+indep(s8)),
    (indep(s31), consistent(s31, sidewall_material) ; \+indep(s31)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, railguard)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr topsheet
% @type categorical
% @canonical false
% @original_name topsheet
% @values impact_shield=Impact_Shield_Topsheet unk_topsheet=Unknown
% @importance 0.825

0.90::acc(sm, topsheet).
0.85::acc(s8, topsheet).

0.95::true_val(topsheet, impact_shield); 0.05::true_val(topsheet, unk_topsheet).

measured(sm, topsheet, impact_shield).
measured(s8, topsheet, impact_shield).

all_consistent(topsheet) :-
    (indep(sm), consistent(sm, topsheet) ; \+indep(sm)),
    (indep(s8), consistent(s8, topsheet) ; \+indep(s8)).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, impact_shield)).
query(true_val(topsheet, unk_topsheet)).

% @attr topsheet_protection
% @type categorical
% @canonical false
% @original_name topsheet protection description
% @values resists_chipping_impact=Protective_resists_chipping_high_impact_damage unk_topsheet_protection=Unknown
% @importance 0.80

0.85::acc(s8, topsheet_protection).

0.88::true_val(topsheet_protection, resists_chipping_impact); 0.12::true_val(topsheet_protection, unk_topsheet_protection).

measured(s8, topsheet_protection, resists_chipping_impact).

all_consistent(topsheet_protection) :-
    (indep(s8), consistent(s8, topsheet_protection) ; \+indep(s8)).

evidence(all_consistent(topsheet_protection)).
query(true_val(topsheet_protection, resists_chipping_impact)).
query(true_val(topsheet_protection, unk_topsheet_protection)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 0.85

0.92::acc(sm, mounting_pattern).
0.82::acc(s31, mounting_pattern).

0.97::true_val(mounting_pattern, inserts_2x4); 0.03::true_val(mounting_pattern, unk_mounting_pattern).

measured(sm, mounting_pattern, inserts_2x4).
measured(s31, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :-
    (indep(sm), consistent(sm, mounting_pattern) ; \+indep(sm)),
    (indep(s31), consistent(s31, mounting_pattern) ; \+indep(s31)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values park_jib_all_mountain=Park_Jib_All_Mountain unk_terrain_suitability=Unknown
% @importance 0.85

0.90::acc(sm, terrain_suitability).

0.92::true_val(terrain_suitability, park_jib_all_mountain); 0.08::true_val(terrain_suitability, unk_terrain_suitability).

measured(sm, terrain_suitability, park_jib_all_mountain).

all_consistent(terrain_suitability) :-
    (indep(sm), consistent(sm, terrain_suitability) ; \+indep(sm)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, park_jib_all_mountain)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr terrain_suitability_all_mountain
% @type numeric
% @canonical false
% @original_name terrain_suitability all mountain
% @unit /10
% @values v8=8.0 unk_terrain_suitability_all_mountain=Unknown
% @importance 0.85

0.82::acc(s35, terrain_suitability_all_mountain).
0.85::acc(s38, terrain_suitability_all_mountain).

0.92::true_val(terrain_suitability_all_mountain, v8); 0.08::true_val(terrain_suitability_all_mountain, unk_terrain_suitability_all_mountain).

measured(s35, terrain_suitability_all_mountain, v8).
measured(s38, terrain_suitability_all_mountain, v8).

all_consistent(terrain_suitability_all_mountain) :-
    consistent(s35, terrain_suitability_all_mountain),
    consistent(s38, terrain_suitability_all_mountain).

evidence(all_consistent(terrain_suitability_all_mountain)).
query(true_val(terrain_suitability_all_mountain, v8)).
query(true_val(terrain_suitability_all_mountain, unk_terrain_suitability_all_mountain)).

% @attr terrain_suitability_park
% @type numeric
% @canonical false
% @original_name terrain_suitability park
% @unit /10
% @values v10=10.0 unk_terrain_suitability_park=Unknown
% @importance 0.85

0.82::acc(s35, terrain_suitability_park).
0.85::acc(s38, terrain_suitability_park).

0.92::true_val(terrain_suitability_park, v10); 0.08::true_val(terrain_suitability_park, unk_terrain_suitability_park).

measured(s35, terrain_suitability_park, v10).
measured(s38, terrain_suitability_park, v10).

all_consistent(terrain_suitability_park) :-
    consistent(s35, terrain_suitability_park),
    consistent(s38, terrain_suitability_park).

evidence(all_consistent(terrain_suitability_park)).
query(true_val(terrain_suitability_park, v10)).
query(true_val(terrain_suitability_park, unk_terrain_suitability_park)).

% @attr terrain_suitability_powder
% @type numeric
% @canonical false
% @original_name terrain_suitability powder
% @unit /10
% @values v6=6.0 unk_terrain_suitability_powder=Unknown
% @importance 0.85

0.82::acc(s35, terrain_suitability_powder).
0.85::acc(s38, terrain_suitability_powder).

0.92::true_val(terrain_suitability_powder, v6); 0.08::true_val(terrain_suitability_powder, unk_terrain_suitability_powder).

measured(s35, terrain_suitability_powder, v6).
measured(s38, terrain_suitability_powder, v6).

all_consistent(terrain_suitability_powder) :-
    consistent(s35, terrain_suitability_powder),
    consistent(s38, terrain_suitability_powder).

evidence(all_consistent(terrain_suitability_powder)).
query(true_val(terrain_suitability_powder, v6)).
query(true_val(terrain_suitability_powder, unk_terrain_suitability_powder)).

% @attr terrain_rating_note
% @type categorical
% @canonical false
% @original_name terrain_suitability disagreement note
% @values possible_page_confusion=EU_page_may_mix_Middle_Earth_and_Fava_ratings unk_terrain_rating_note=Unknown
% @importance 0.80

0.75::acc(s35, terrain_rating_note).
0.80::acc(s38, terrain_rating_note).

0.85::true_val(terrain_rating_note, possible_page_confusion); 0.15::true_val(terrain_rating_note, unk_terrain_rating_note).

measured(s35, terrain_rating_note, possible_page_confusion).
measured(s38, terrain_rating_note, possible_page_confusion).

all_consistent(terrain_rating_note) :-
    consistent(s35, terrain_rating_note),
    consistent(s38, terrain_rating_note).

evidence(all_consistent(terrain_rating_note)).
query(true_val(terrain_rating_note, possible_page_confusion)).
query(true_val(terrain_rating_note, unk_terrain_rating_note)).

% @attr riding_style
% @type categorical
% @canonical false
% @original_name riding_style
% @values creative_press_jib_park_switch=Creative_pressing_jib_park_switch unk_riding_style=Unknown
% @importance 0.85

0.90::acc(sm, riding_style).

0.95::true_val(riding_style, creative_press_jib_park_switch); 0.05::true_val(riding_style, unk_riding_style).

measured(sm, riding_style, creative_press_jib_park_switch).

all_consistent(riding_style) :-
    (indep(sm), consistent(sm, riding_style) ; \+indep(sm)).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, creative_press_jib_park_switch)).
query(true_val(riding_style, unk_riding_style)).

% @attr rider_level
% @type categorical
% @canonical false
% @original_name rider_level
% @values intermediate=Intermediate unk_rider_level=Unknown
% @importance 0.85

0.88::acc(sm, rider_level).

0.90::true_val(rider_level, intermediate); 0.10::true_val(rider_level, unk_rider_level).

measured(sm, rider_level, intermediate).

all_consistent(rider_level) :-
    (indep(sm), consistent(sm, rider_level) ; \+indep(sm)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate)).
query(true_val(rider_level, unk_rider_level)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values intermediate_advanced=Intermediate_to_Advanced intermediate_expert=Intermediate_100pct_Expert_100pct freestyle_style_performance=Freestyle_riders_style_and_performance
% @importance 0.82

0.80::acc(s35, skill_level_recommendation).
0.88::acc(s19, skill_level_recommendation).
0.82::acc(s8, skill_level_recommendation).
0.90::acc(s1, skill_level_recommendation).
0.80::acc(s7, skill_level_recommendation).

0.40::true_val(skill_level_recommendation, intermediate_advanced); 0.30::true_val(skill_level_recommendation, intermediate_expert); 0.30::true_val(skill_level_recommendation, freestyle_style_performance).

measured(s35, skill_level_recommendation, intermediate_expert).
measured(s19, skill_level_recommendation, intermediate_advanced).
measured(s8, skill_level_recommendation, intermediate_advanced).
measured(s1, skill_level_recommendation, freestyle_style_performance).
measured(s7, skill_level_recommendation, freestyle_style_performance).

all_consistent(skill_level_recommendation) :-
    consistent(s35, skill_level_recommendation),
    (indep(s19), consistent(s19, skill_level_recommendation) ; \+indep(s19)),
    (indep(s8), consistent(s8, skill_level_recommendation) ; \+indep(s8)),
    consistent(s1, skill_level_recommendation),
    (indep(s7), consistent(s7, skill_level_recommendation) ; \+indep(s7)).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, intermediate_advanced)).
query(true_val(skill_level_recommendation, intermediate_expert)).
query(true_val(skill_level_recommendation, freestyle_style_performance)).

% @attr pop
% @type categorical
% @canonical false
% @original_name pop
% @values responsive_tons=Responsive_pop_tons_of_pop unk_pop=Unknown
% @importance 0.925

0.90::acc(s1, pop).
0.82::acc(s7, pop).

0.92::true_val(pop, responsive_tons); 0.08::true_val(pop, unk_pop).

measured(s1, pop, responsive_tons).
measured(s7, pop, responsive_tons).

all_consistent(pop) :-
    consistent(s1, pop),
    (indep(s7), consistent(s7, pop) ; \+indep(s7)).

evidence(all_consistent(pop)).
query(true_val(pop, responsive_tons)).
query(true_val(pop, unk_pop)).

% @attr stability
% @type categorical
% @canonical false
% @original_name Stability
% @values stable_takeoffs_precise_turns=Stable_on_takeoffs_precise_through_turns unk_stability=Unknown
% @importance 0.85

0.82::acc(s7, stability).

0.85::true_val(stability, stable_takeoffs_precise_turns); 0.15::true_val(stability, unk_stability).

measured(s7, stability, stable_takeoffs_precise_turns).

all_consistent(stability) :-
    (indep(s7), consistent(s7, stability) ; \+indep(s7)).

evidence(all_consistent(stability)).
query(true_val(stability, stable_takeoffs_precise_turns)).
query(true_val(stability, unk_stability)).

% @attr edge_hold
% @type categorical
% @canonical false
% @original_name edge_hold
% @values consistent=Consistent_edge_hold unk_edge_hold=Unknown
% @importance 0.80

0.82::acc(s8, edge_hold).

0.85::true_val(edge_hold, consistent); 0.15::true_val(edge_hold, unk_edge_hold).

measured(s8, edge_hold, consistent).

all_consistent(edge_hold) :-
    (indep(s8), consistent(s8, edge_hold) ; \+indep(s8)).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, consistent)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr responsiveness
% @type categorical
% @canonical false
% @original_name Responsiveness
% @values responsive_carbon_energy=Responsive_carbon_stringers_increase_energy_transfer unk_responsiveness=Unknown
% @importance 0.80

0.82::acc(s8, responsiveness).

0.85::true_val(responsiveness, responsive_carbon_energy); 0.15::true_val(responsiveness, unk_responsiveness).

measured(s8, responsiveness, responsive_carbon_energy).

all_consistent(responsiveness) :-
    (indep(s8), consistent(s8, responsiveness) ; \+indep(s8)).

evidence(all_consistent(responsiveness)).
query(true_val(responsiveness, responsive_carbon_energy)).
query(true_val(responsiveness, unk_responsiveness)).

% @attr dampening
% @type categorical
% @canonical false
% @original_name Dampening
% @values poplar_paulownia_dampening=Poplar_paulownia_provide_dampening_flex_consistency unk_dampening=Unknown
% @importance 0.70

0.75::acc(s33, dampening).

0.82::true_val(dampening, poplar_paulownia_dampening); 0.18::true_val(dampening, unk_dampening).

measured(s33, dampening, poplar_paulownia_dampening).

all_consistent(dampening) :-
    (indep(s33), consistent(s33, dampening) ; \+indep(s33)).

evidence(all_consistent(dampening)).
query(true_val(dampening, poplar_paulownia_dampening)).
query(true_val(dampening, unk_dampening)).

% @attr float_rating
% @type categorical
% @canonical false
% @original_name Float
% @values not_primary_6_10=Not_primary_focus_powder_6_out_of_10 unk_float_rating=Unknown
% @importance 0.95

0.82::acc(s35, float_rating).

0.85::true_val(float_rating, not_primary_6_10); 0.15::true_val(float_rating, unk_float_rating).

measured(s35, float_rating, not_primary_6_10).

all_consistent(float_rating) :- consistent(s35, float_rating).

evidence(all_consistent(float_rating)).
query(true_val(float_rating, not_primary_6_10)).
query(true_val(float_rating, unk_float_rating)).

% @attr comparable_vs_softer_boards
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand vs softer boards
% @values more_pop_speed_stability=More_pop_speed_stability_than_softer_boards unk_comparable_vs_softer_boards=Unknown
% @importance 0.80

0.78::acc(s34, comparable_vs_softer_boards).

0.85::true_val(comparable_vs_softer_boards, more_pop_speed_stability); 0.15::true_val(comparable_vs_softer_boards, unk_comparable_vs_softer_boards).

measured(s34, comparable_vs_softer_boards, more_pop_speed_stability).

all_consistent(comparable_vs_softer_boards) :-
    (indep(s34), consistent(s34, comparable_vs_softer_boards) ; \+indep(s34)).

evidence(all_consistent(comparable_vs_softer_boards)).
query(true_val(comparable_vs_softer_boards, more_pop_speed_stability)).
query(true_val(comparable_vs_softer_boards, unk_comparable_vs_softer_boards)).

% @attr comparable_weight_balance
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand weight/balance
% @values lighter_balanced_freestyle=Lighter_more_balanced_freestyle_focused unk_comparable_weight_balance=Unknown
% @importance 0.80

0.78::acc(s34, comparable_weight_balance).

0.85::true_val(comparable_weight_balance, lighter_balanced_freestyle); 0.15::true_val(comparable_weight_balance, unk_comparable_weight_balance).

measured(s34, comparable_weight_balance, lighter_balanced_freestyle).

all_consistent(comparable_weight_balance) :-
    (indep(s34), consistent(s34, comparable_weight_balance) ; \+indep(s34)).

evidence(all_consistent(comparable_weight_balance)).
query(true_val(comparable_weight_balance, lighter_balanced_freestyle)).
query(true_val(comparable_weight_balance, unk_comparable_weight_balance)).

% @attr park_freestyle_versatility
% @type categorical
% @canonical false
% @original_name Park/freestyle versatility
% @values park_street_creative_am=Park_street_features_creative_all_mountain unk_park_freestyle_versatility=Unknown
% @importance 0.85

0.82::acc(s7, park_freestyle_versatility).

0.88::true_val(park_freestyle_versatility, park_street_creative_am); 0.12::true_val(park_freestyle_versatility, unk_park_freestyle_versatility).

measured(s7, park_freestyle_versatility, park_street_creative_am).

all_consistent(park_freestyle_versatility) :-
    (indep(s7), consistent(s7, park_freestyle_versatility) ; \+indep(s7)).

evidence(all_consistent(park_freestyle_versatility)).
query(true_val(park_freestyle_versatility, park_street_creative_am)).
query(true_val(park_freestyle_versatility, unk_park_freestyle_versatility)).

% @attr switch_riding
% @type categorical
% @canonical false
% @original_name switch_riding
% @values equal_both_directions=True_twin_equal_performance_switch unk_switch_riding=Unknown
% @importance 0.85

0.82::acc(s31, switch_riding).

0.88::true_val(switch_riding, equal_both_directions); 0.12::true_val(switch_riding, unk_switch_riding).

measured(s31, switch_riding, equal_both_directions).

all_consistent(switch_riding) :-
    (indep(s31), consistent(s31, switch_riding) ; \+indep(s31)).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, equal_both_directions)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr sessions_ride_impression
% @type categorical
% @canonical false
% @original_name Sessions Ride Co impression
% @values creativity_power_control_dialed=Creativity_power_control_stable_precise_dialed unk_sessions_ride_impression=Unknown
% @importance 0.85

0.82::acc(s7, sessions_ride_impression).

0.85::true_val(sessions_ride_impression, creativity_power_control_dialed); 0.15::true_val(sessions_ride_impression, unk_sessions_ride_impression).

measured(s7, sessions_ride_impression, creativity_power_control_dialed).

all_consistent(sessions_ride_impression) :-
    (indep(s7), consistent(s7, sessions_ride_impression) ; \+indep(s7)).

evidence(all_consistent(sessions_ride_impression)).
query(true_val(sessions_ride_impression, creativity_power_control_dialed)).
query(true_val(sessions_ride_impression, unk_sessions_ride_impression)).

% @attr user_review_forum
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values early_impressions_feb_2026=Early_on_snow_impressions_Feb_2026_very_early unk_user_review_forum=Unknown
% @importance 0.60

0.50::acc(s39, user_review_forum).

0.55::true_val(user_review_forum, early_impressions_feb_2026); 0.45::true_val(user_review_forum, unk_user_review_forum).

measured(s39, user_review_forum, early_impressions_feb_2026).

all_consistent(user_review_forum) :- consistent(s39, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, early_impressions_feb_2026)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr eastern_boarder_review
% @type categorical
% @canonical false
% @original_name Eastern Boarder review note
% @values pop_without_harshness=Pop_without_harshness_bamboo_paulownia_smooth_balanced unk_eastern_boarder_review=Unknown
% @importance 0.90

0.82::acc(s25, eastern_boarder_review).

0.85::true_val(eastern_boarder_review, pop_without_harshness); 0.15::true_val(eastern_boarder_review, unk_eastern_boarder_review).

measured(s25, eastern_boarder_review, pop_without_harshness).

all_consistent(eastern_boarder_review) :-
    (indep(s25), consistent(s25, eastern_boarder_review) ; \+indep(s25)).

evidence(all_consistent(eastern_boarder_review)).
query(true_val(eastern_boarder_review, pop_without_harshness)).
query(true_val(eastern_boarder_review, unk_eastern_boarder_review)).

% @attr blauer_board_assessment
% @type categorical
% @canonical false
% @original_name Blauer Board Shop assessment
% @values park_or_resort=Equally_comfortable_park_or_cruising_resort unk_blauer_board_assessment=Unknown
% @importance 0.80

0.82::acc(s8, blauer_board_assessment).

0.85::true_val(blauer_board_assessment, park_or_resort); 0.15::true_val(blauer_board_assessment, unk_blauer_board_assessment).

measured(s8, blauer_board_assessment, park_or_resort).

all_consistent(blauer_board_assessment) :-
    (indep(s8), consistent(s8, blauer_board_assessment) ; \+indep(s8)).

evidence(all_consistent(blauer_board_assessment)).
query(true_val(blauer_board_assessment, park_or_resort)).
query(true_val(blauer_board_assessment, unk_blauer_board_assessment)).

% @attr ski_pro_bottom_line
% @type categorical
% @canonical false
% @original_name Ski Pro AZ bottom line
% @values fast_poppy_twin_freestyle_ltd=Fast_poppy_true_twin_freestyle_premium_ltd unk_ski_pro_bottom_line=Unknown
% @importance 0.80

0.78::acc(s34, ski_pro_bottom_line).

0.82::true_val(ski_pro_bottom_line, fast_poppy_twin_freestyle_ltd); 0.18::true_val(ski_pro_bottom_line, unk_ski_pro_bottom_line).

measured(s34, ski_pro_bottom_line, fast_poppy_twin_freestyle_ltd).

all_consistent(ski_pro_bottom_line) :-
    (indep(s34), consistent(s34, ski_pro_bottom_line) ; \+indep(s34)).

evidence(all_consistent(ski_pro_bottom_line)).
query(true_val(ski_pro_bottom_line, fast_poppy_twin_freestyle_ltd)).
query(true_val(ski_pro_bottom_line, unk_ski_pro_bottom_line)).

% @attr independent_review_status
% @type categorical
% @canonical false
% @original_name No major independent reviews
% @values none_found_too_new=No_major_independent_reviews_too_new_limited_release unk_independent_review_status=Unknown
% @importance 0.70

0.70::true_val(independent_review_status, none_found_too_new); 0.30::true_val(independent_review_status, unk_independent_review_status).

all_consistent(independent_review_status).

evidence(all_consistent(independent_review_status)).
query(true_val(independent_review_status, none_found_too_new)).
query(true_val(independent_review_status, unk_independent_review_status)).

% @attr brand_primary_category
% @type categorical
% @canonical false
% @original_name ThirtyTwo primarily known for boots
% @values boots_first_boards=Primarily_boots_first_ever_snowboard_product unk_brand_primary_category=Unknown
% @importance 0.70

0.85::acc(s17, brand_primary_category).

0.90::true_val(brand_primary_category, boots_first_boards); 0.10::true_val(brand_primary_category, unk_brand_primary_category).

measured(s17, brand_primary_category, boots_first_boards).

all_consistent(brand_primary_category) :- consistent(s17, brand_primary_category).

evidence(all_consistent(brand_primary_category)).
query(true_val(brand_primary_category, boots_first_boards)).
query(true_val(brand_primary_category, unk_brand_primary_category)).

% @attr boots_brand_reputation
% @type categorical
% @canonical false
% @original_name ThirtyTwo boots brand reputation
% @values strong_rider_driven_since_1995=Strong_well_established_rider_driven_since_1995 unk_boots_brand_reputation=Unknown
% @importance 0.50

0.75::acc(s14, boots_brand_reputation).

0.82::true_val(boots_brand_reputation, strong_rider_driven_since_1995); 0.18::true_val(boots_brand_reputation, unk_boots_brand_reputation).

measured(s14, boots_brand_reputation, strong_rider_driven_since_1995).

all_consistent(boots_brand_reputation) :-
    (indep(s14), consistent(s14, boots_brand_reputation) ; \+indep(s14)).

evidence(all_consistent(boots_brand_reputation)).
query(true_val(boots_brand_reputation, strong_rider_driven_since_1995)).
query(true_val(boots_brand_reputation, unk_boots_brand_reputation)).

% @attr boot_forum_reputation
% @type categorical
% @canonical false
% @original_name ThirtyTwo boot reputation on forums
% @values positive_comfort_sizing_issues=Positive_comfort_after_breakin_some_sizing_inconsistency unk_boot_forum_reputation=Unknown
% @importance 0.375

0.45::acc(s40, boot_forum_reputation).
0.42::acc(s41, boot_forum_reputation).

0.60::true_val(boot_forum_reputation, positive_comfort_sizing_issues); 0.40::true_val(boot_forum_reputation, unk_boot_forum_reputation).

measured(s40, boot_forum_reputation, positive_comfort_sizing_issues).
measured(s41, boot_forum_reputation, positive_comfort_sizing_issues).

all_consistent(boot_forum_reputation) :-
    consistent(s40, boot_forum_reputation),
    consistent(s41, boot_forum_reputation).

evidence(all_consistent(boot_forum_reputation)).
query(true_val(boot_forum_reputation, positive_comfort_sizing_issues)).
query(true_val(boot_forum_reputation, unk_boot_forum_reputation)).

% @attr nidecker_group_size
% @type categorical
% @canonical false
% @original_name Nidecker Group is second biggest snowboard company
% @values second_biggest_world=Second_biggest_snowboard_company_in_world unk_nidecker_group_size=Unknown
% @importance 0.60

0.78::acc(s10, nidecker_group_size).

0.82::true_val(nidecker_group_size, second_biggest_world); 0.18::true_val(nidecker_group_size, unk_nidecker_group_size).

measured(s10, nidecker_group_size, second_biggest_world).

all_consistent(nidecker_group_size) :- consistent(s10, nidecker_group_size).

evidence(all_consistent(nidecker_group_size)).
query(true_val(nidecker_group_size, second_biggest_world)).
query(true_val(nidecker_group_size, unk_nidecker_group_size)).

% @attr sws_factory_shared
% @type categorical
% @canonical false
% @original_name SWS factory shared brands
% @values jones_yes_nidecker_rome_bataleon=Jones_YES_Nidecker_Rome_Bataleon_and_others unk_sws_factory_shared=Unknown
% @importance 0.77

0.88::acc(s6, sws_factory_shared).
0.85::acc(s16, sws_factory_shared).
0.55::acc(s42, sws_factory_shared).

0.92::true_val(sws_factory_shared, jones_yes_nidecker_rome_bataleon); 0.08::true_val(sws_factory_shared, unk_sws_factory_shared).

measured(s6, sws_factory_shared, jones_yes_nidecker_rome_bataleon).
measured(s16, sws_factory_shared, jones_yes_nidecker_rome_bataleon).
measured(s42, sws_factory_shared, jones_yes_nidecker_rome_bataleon).

all_consistent(sws_factory_shared) :-
    consistent(s6, sws_factory_shared),
    consistent(s16, sws_factory_shared),
    consistent(s42, sws_factory_shared).

evidence(all_consistent(sws_factory_shared)).
query(true_val(sws_factory_shared, jones_yes_nidecker_rome_bataleon)).
query(true_val(sws_factory_shared, unk_sws_factory_shared)).

% @attr built_to_rider_spec
% @type categorical
% @canonical false
% @original_name Brand director confirmed built to Scott specs
% @values yes_brian_cook_confirmed=Yes_Brian_Cook_confirmed_built_to_Scott_specs unk_built_to_rider_spec=Unknown
% @importance 0.85

0.88::acc(s5, built_to_rider_spec).

0.90::true_val(built_to_rider_spec, yes_brian_cook_confirmed); 0.10::true_val(built_to_rider_spec, unk_built_to_rider_spec).

measured(s5, built_to_rider_spec, yes_brian_cook_confirmed).

all_consistent(built_to_rider_spec) :- consistent(s5, built_to_rider_spec).

evidence(all_consistent(built_to_rider_spec)).
query(true_val(built_to_rider_spec, yes_brian_cook_confirmed)).
query(true_val(built_to_rider_spec, unk_built_to_rider_spec)).

% @attr board_development_approach
% @type categorical
% @canonical false
% @original_name Board development approach
% @values custom_shapes_moulds_pod=Custom_shapes_moulds_real_point_of_difference unk_board_development_approach=Unknown
% @importance 0.80

0.92::acc(s18, board_development_approach).

0.90::true_val(board_development_approach, custom_shapes_moulds_pod); 0.10::true_val(board_development_approach, unk_board_development_approach).

measured(s18, board_development_approach, custom_shapes_moulds_pod).

all_consistent(board_development_approach) :- consistent(s18, board_development_approach).

evidence(all_consistent(board_development_approach)).
query(true_val(board_development_approach, custom_shapes_moulds_pod)).
query(true_val(board_development_approach, unk_board_development_approach)).

% @attr first_year_risk
% @type categorical
% @canonical false
% @original_name First-year brand risk
% @values yes_no_track_record=First_year_brand_no_long_term_durability_track_record unk_first_year_risk=Unknown
% @importance 0.75

0.75::true_val(first_year_risk, yes_no_track_record); 0.25::true_val(first_year_risk, unk_first_year_risk).

all_consistent(first_year_risk).

evidence(all_consistent(first_year_risk)).
query(true_val(first_year_risk, yes_no_track_record)).
query(true_val(first_year_risk, unk_first_year_risk)).

% @attr stevens_team_tenure
% @type categorical
% @canonical false
% @original_name Scott Stevens team tenure
% @values over_17_years=More_than_17_years_boots_outerwear unk_stevens_team_tenure=Unknown
% @importance 0.85

0.88::acc(s5, stevens_team_tenure).

0.90::true_val(stevens_team_tenure, over_17_years); 0.10::true_val(stevens_team_tenure, unk_stevens_team_tenure).

measured(s5, stevens_team_tenure, over_17_years).

all_consistent(stevens_team_tenure) :- consistent(s5, stevens_team_tenure).

evidence(all_consistent(stevens_team_tenure)).
query(true_val(stevens_team_tenure, over_17_years)).
query(true_val(stevens_team_tenure, unk_stevens_team_tenure)).

% @attr stevens_riding_style
% @type categorical
% @canonical false
% @original_name Scott Stevens riding style
% @values skate_style=Best_known_for_skate_style_riding unk_stevens_riding_style=Unknown
% @importance 0.90

0.88::acc(s6, stevens_riding_style).

0.90::true_val(stevens_riding_style, skate_style); 0.10::true_val(stevens_riding_style, unk_stevens_riding_style).

measured(s6, stevens_riding_style, skate_style).

all_consistent(stevens_riding_style) :- consistent(s6, stevens_riding_style).

evidence(all_consistent(stevens_riding_style)).
query(true_val(stevens_riding_style, skate_style)).
query(true_val(stevens_riding_style, unk_stevens_riding_style)).

% @attr pro_rider_creativity
% @type categorical
% @canonical false
% @original_name pro_rider_name creativity description
% @values transforms_overlooked_features=Creativity_transforms_overlooked_features_into_expressive_lines unk_pro_rider_creativity=Unknown
% @importance 0.80

0.85::acc(s21, pro_rider_creativity).

0.88::true_val(pro_rider_creativity, transforms_overlooked_features); 0.12::true_val(pro_rider_creativity, unk_pro_rider_creativity).

measured(s21, pro_rider_creativity, transforms_overlooked_features).

all_consistent(pro_rider_creativity) :- consistent(s21, pro_rider_creativity).

evidence(all_consistent(pro_rider_creativity)).
query(true_val(pro_rider_creativity, transforms_overlooked_features)).
query(true_val(pro_rider_creativity, unk_pro_rider_creativity)).

% @attr stevens_jibbing_evolution
% @type categorical
% @canonical false
% @original_name Stevens jibbing evolution
% @values shaped_jibbing_two_decades=Shaped_evolution_of_jibbing_more_than_two_decades unk_stevens_jibbing_evolution=Unknown
% @importance 0.80

0.85::acc(s21, stevens_jibbing_evolution).

0.88::true_val(stevens_jibbing_evolution, shaped_jibbing_two_decades); 0.12::true_val(stevens_jibbing_evolution, unk_stevens_jibbing_evolution).

measured(s21, stevens_jibbing_evolution, shaped_jibbing_two_decades).

all_consistent(stevens_jibbing_evolution) :- consistent(s21, stevens_jibbing_evolution).

evidence(all_consistent(stevens_jibbing_evolution)).
query(true_val(stevens_jibbing_evolution, shaped_jibbing_two_decades)).
query(true_val(stevens_jibbing_evolution, unk_stevens_jibbing_evolution)).

% @attr team_riders
% @type categorical
% @canonical false
% @original_name ThirtyTwo snowboard team riders
% @values fava_hansen_hofmann_alexander_stevens_weiler=Fava_Hansen_Hofmann_Alexander_Stevens_Weiler unk_team_riders=Unknown
% @importance 0.875

0.88::acc(s6, team_riders).
0.85::acc(s16, team_riders).

0.92::true_val(team_riders, fava_hansen_hofmann_alexander_stevens_weiler); 0.08::true_val(team_riders, unk_team_riders).

measured(s6, team_riders, fava_hansen_hofmann_alexander_stevens_weiler).
measured(s16, team_riders, fava_hansen_hofmann_alexander_stevens_weiler).

all_consistent(team_riders) :-
    consistent(s6, team_riders),
    consistent(s16, team_riders).

evidence(all_consistent(team_riders)).
query(true_val(team_riders, fava_hansen_hofmann_alexander_stevens_weiler)).
query(true_val(team_riders, unk_team_riders)).

% @attr pat_fava_achievements
% @type categorical
% @canonical false
% @original_name Pat Fava X Games achievement
% @values xgames_street_gold_2024=X_Games_Street_Style_gold_2024 unk_pat_fava_achievements=Unknown
% @importance 0.50

0.82::acc(s43, pat_fava_achievements).

0.85::true_val(pat_fava_achievements, xgames_street_gold_2024); 0.15::true_val(pat_fava_achievements, unk_pat_fava_achievements).

measured(s43, pat_fava_achievements, xgames_street_gold_2024).

all_consistent(pat_fava_achievements) :- consistent(s43, pat_fava_achievements).

evidence(all_consistent(pat_fava_achievements)).
query(true_val(pat_fava_achievements, xgames_street_gold_2024)).
query(true_val(pat_fava_achievements, unk_pat_fava_achievements)).

% @attr patrick_hofmann_achievements
% @type categorical
% @canonical false
% @original_name Patrick Hofmann X Games achievement
% @values xgames_knuckle_huck_silver_2025=Silver_Knuckle_Huck_2025_X_Games unk_patrick_hofmann_achievements=Unknown
% @importance 0.90

0.88::acc(s6, patrick_hofmann_achievements).

0.88::true_val(patrick_hofmann_achievements, xgames_knuckle_huck_silver_2025); 0.12::true_val(patrick_hofmann_achievements, unk_patrick_hofmann_achievements).

measured(s6, patrick_hofmann_achievements, xgames_knuckle_huck_silver_2025).

all_consistent(patrick_hofmann_achievements) :- consistent(s6, patrick_hofmann_achievements).

evidence(all_consistent(patrick_hofmann_achievements)).
query(true_val(patrick_hofmann_achievements, xgames_knuckle_huck_silver_2025)).
query(true_val(patrick_hofmann_achievements, unk_patrick_hofmann_achievements)).

% @attr comparable_capita_doa
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand CAPiTA DOA
% @values doa_industry_standard_twin=CAPiTA_DOA_569_95_industry_standard_freestyle_twin unk_comparable_capita_doa=Unknown
% @importance 0.775

0.72::acc(s28, comparable_capita_doa).
0.72::acc(s29, comparable_capita_doa).

0.85::true_val(comparable_capita_doa, doa_industry_standard_twin); 0.15::true_val(comparable_capita_doa, unk_comparable_capita_doa).

measured(s28, comparable_capita_doa, doa_industry_standard_twin).
measured(s29, comparable_capita_doa, doa_industry_standard_twin).

all_consistent(comparable_capita_doa) :-
    consistent(s28, comparable_capita_doa),
    consistent(s29, comparable_capita_doa).

evidence(all_consistent(comparable_capita_doa)).
query(true_val(comparable_capita_doa, doa_industry_standard_twin)).
query(true_val(comparable_capita_doa, unk_comparable_capita_doa)).

% @attr comparable_spring_break
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand CAPiTA Spring Break Resort Twin
% @values spring_break_twin_camber_flex5=True_twin_popsicle_camber_Flex5_599_95 unk_comparable_spring_break=Unknown
% @importance 0.75

0.68::acc(s30, comparable_spring_break).

0.78::true_val(comparable_spring_break, spring_break_twin_camber_flex5); 0.22::true_val(comparable_spring_break, unk_comparable_spring_break).

measured(s30, comparable_spring_break, spring_break_twin_camber_flex5).

all_consistent(comparable_spring_break) :- consistent(s30, comparable_spring_break).

evidence(all_consistent(comparable_spring_break)).
query(true_val(comparable_spring_break, spring_break_twin_camber_flex5)).
query(true_val(comparable_spring_break, unk_comparable_spring_break)).

% @attr comparable_burton_custom
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand Burton Custom Camber
% @values burton_custom_dir_twin_flex6=Directional_twin_camber_Flex6_679_95_more_AM unk_comparable_burton_custom=Unknown
% @importance 0.75

0.72::acc(s29, comparable_burton_custom).

0.80::true_val(comparable_burton_custom, burton_custom_dir_twin_flex6); 0.20::true_val(comparable_burton_custom, unk_comparable_burton_custom).

measured(s29, comparable_burton_custom, burton_custom_dir_twin_flex6).

all_consistent(comparable_burton_custom) :- consistent(s29, comparable_burton_custom).

evidence(all_consistent(comparable_burton_custom)).
query(true_val(comparable_burton_custom, burton_custom_dir_twin_flex6)).
query(true_val(comparable_burton_custom, unk_comparable_burton_custom)).

% @attr comparable_endeavor_pioneer
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand Endeavor Pioneer
% @values endeavor_pioneer_twin_camber_flex5=True_twin_camber_Flex5_599 unk_comparable_endeavor_pioneer=Unknown
% @importance 0.75

0.68::acc(s30, comparable_endeavor_pioneer).

0.78::true_val(comparable_endeavor_pioneer, endeavor_pioneer_twin_camber_flex5); 0.22::true_val(comparable_endeavor_pioneer, unk_comparable_endeavor_pioneer).

measured(s30, comparable_endeavor_pioneer, endeavor_pioneer_twin_camber_flex5).

all_consistent(comparable_endeavor_pioneer) :- consistent(s30, comparable_endeavor_pioneer).

evidence(all_consistent(comparable_endeavor_pioneer)).
query(true_val(comparable_endeavor_pioneer, endeavor_pioneer_twin_camber_flex5)).
query(true_val(comparable_endeavor_pioneer, unk_comparable_endeavor_pioneer)).

% @attr comparable_all_mtn_freestyle
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand all-mountain freestyle hybrid
% @values am_freestyle_twin_hybrid_highly_rated=AM_freestyle_twin_hybrid_camber_highly_rated unk_comparable_all_mtn_freestyle=Unknown
% @importance 0.70

0.62::acc(s44, comparable_all_mtn_freestyle).

0.72::true_val(comparable_all_mtn_freestyle, am_freestyle_twin_hybrid_highly_rated); 0.28::true_val(comparable_all_mtn_freestyle, unk_comparable_all_mtn_freestyle).

measured(s44, comparable_all_mtn_freestyle, am_freestyle_twin_hybrid_highly_rated).

all_consistent(comparable_all_mtn_freestyle) :- consistent(s44, comparable_all_mtn_freestyle).

evidence(all_consistent(comparable_all_mtn_freestyle)).
query(true_val(comparable_all_mtn_freestyle, am_freestyle_twin_hybrid_highly_rated)).
query(true_val(comparable_all_mtn_freestyle, unk_comparable_all_mtn_freestyle)).

% @attr comparable_jones_tweaker
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand Jones Tweaker
% @values tweaker_playful_creative_softer=True_twin_playful_creative_softer_than_ME unk_comparable_jones_tweaker=Unknown
% @importance 0.70

0.62::acc(s44, comparable_jones_tweaker).

0.72::true_val(comparable_jones_tweaker, tweaker_playful_creative_softer); 0.28::true_val(comparable_jones_tweaker, unk_comparable_jones_tweaker).

measured(s44, comparable_jones_tweaker, tweaker_playful_creative_softer).

all_consistent(comparable_jones_tweaker) :- consistent(s44, comparable_jones_tweaker).

evidence(all_consistent(comparable_jones_tweaker)).
query(true_val(comparable_jones_tweaker, tweaker_playful_creative_softer)).
query(true_val(comparable_jones_tweaker, unk_comparable_jones_tweaker)).

% @attr comparable_rome_agent
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand Rome Agent Pro
% @values rome_agent_am_freestyle_consistent=AM_freestyle_twin_consistent_performer unk_comparable_rome_agent=Unknown
% @importance 0.70

0.62::acc(s44, comparable_rome_agent).

0.72::true_val(comparable_rome_agent, rome_agent_am_freestyle_consistent); 0.28::true_val(comparable_rome_agent, unk_comparable_rome_agent).

measured(s44, comparable_rome_agent, rome_agent_am_freestyle_consistent).

all_consistent(comparable_rome_agent) :- consistent(s44, comparable_rome_agent).

evidence(all_consistent(comparable_rome_agent)).
query(true_val(comparable_rome_agent, rome_agent_am_freestyle_consistent)).
query(true_val(comparable_rome_agent, unk_comparable_rome_agent)).

% @attr comparable_gnu_money
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand GNU Money
% @values gnu_money_twin_trad_camber_mid_flex=True_twin_traditional_camber_mid_flex_freestyle unk_comparable_gnu_money=Unknown
% @importance 0.80

0.68::acc(s28, comparable_gnu_money).

0.78::true_val(comparable_gnu_money, gnu_money_twin_trad_camber_mid_flex); 0.22::true_val(comparable_gnu_money, unk_comparable_gnu_money).

measured(s28, comparable_gnu_money, gnu_money_twin_trad_camber_mid_flex).

all_consistent(comparable_gnu_money) :- consistent(s28, comparable_gnu_money).

evidence(all_consistent(comparable_gnu_money)).
query(true_val(comparable_gnu_money, gnu_money_twin_trad_camber_mid_flex)).
query(true_val(comparable_gnu_money, unk_comparable_gnu_money)).

% @attr comparable_yes_greats
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand YES Greats
% @values yes_greats_twin_am_camber_edge_hold=Twin_AM_freestyle_camber_good_edge_hold unk_comparable_yes_greats=Unknown
% @importance 0.80

0.68::acc(s28, comparable_yes_greats).

0.78::true_val(comparable_yes_greats, yes_greats_twin_am_camber_edge_hold); 0.22::true_val(comparable_yes_greats, unk_comparable_yes_greats).

measured(s28, comparable_yes_greats, yes_greats_twin_am_camber_edge_hold).

all_consistent(comparable_yes_greats) :- consistent(s28, comparable_yes_greats).

evidence(all_consistent(comparable_yes_greats)).
query(true_val(comparable_yes_greats, yes_greats_twin_am_camber_edge_hold)).
query(true_val(comparable_yes_greats, unk_comparable_yes_greats)).

% @attr key_differentiator
% @type categorical
% @canonical false
% @original_name Key differentiator from competitors
% @values ltd_collectible_pro_model_new_brand=Limited_edition_collectible_Scott_Stevens_pro_ThirtyTwo_first_boards unk_key_differentiator=Unknown
% @importance 0.75

0.70::true_val(key_differentiator, ltd_collectible_pro_model_new_brand); 0.30::true_val(key_differentiator, unk_key_differentiator).

all_consistent(key_differentiator).

evidence(all_consistent(key_differentiator)).
query(true_val(key_differentiator, ltd_collectible_pro_model_new_brand)).
query(true_val(key_differentiator, unk_key_differentiator)).

% @attr sustainability_certification
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values fast_wend_natural_wax=Fast_Wend_Natural_Wax_eco_friendly unk_sustainability_certification=Unknown
% @importance 0.85

0.90::acc(sm, sustainability_certification).

0.90::true_val(sustainability_certification, fast_wend_natural_wax); 0.10::true_val(sustainability_certification, unk_sustainability_certification).

measured(sm, sustainability_certification, fast_wend_natural_wax).

all_consistent(sustainability_certification) :-
    (indep(sm), consistent(sm, sustainability_certification) ; \+indep(sm)).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, fast_wend_natural_wax)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr binding_compatibility
% @type categorical
% @canonical false
% @original_name binding_compatibility
% @values t32m_fase_349_95=T32M_FASE_Bindings_349_95_bundle_949_90 unk_binding_compatibility=Unknown
% @importance 0.70

0.85::acc(s27, binding_compatibility).

0.88::true_val(binding_compatibility, t32m_fase_349_95); 0.12::true_val(binding_compatibility, unk_binding_compatibility).

measured(s27, binding_compatibility, t32m_fase_349_95).

all_consistent(binding_compatibility) :-
    (indep(s19), consistent(s19, binding_compatibility) ; \+indep(s19)).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, t32m_fase_349_95)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

% @attr board_historical_significance
% @type categorical
% @canonical false
% @original_name Board historical significance
% @values true_piece_snowboard_history=True_piece_of_snowboard_history unk_board_historical_significance=Unknown
% @importance 0.85

0.78::acc(s7, board_historical_significance).

0.82::true_val(board_historical_significance, true_piece_snowboard_history); 0.18::true_val(board_historical_significance, unk_board_historical_significance).

measured(s7, board_historical_significance, true_piece_snowboard_history).

all_consistent(board_historical_significance) :-
    (indep(s7), consistent(s7, board_historical_significance) ; \+indep(s7)).

evidence(all_consistent(board_historical_significance)).
query(true_val(board_historical_significance, true_piece_snowboard_history)).
query(true_val(board_historical_significance, unk_board_historical_significance)).

% @attr topsheet_appearance_description
% @type categorical
% @canonical true
% @original_name topsheet_appearance_description
% @values bold_skate_bratrud=Bold_skate_driven_graphics_by_Todd_Bratrud unk_topsheet_appearance_description=Unknown
% @importance 0.80

0.85::acc(s8, topsheet_appearance_description).

0.88::true_val(topsheet_appearance_description, bold_skate_bratrud); 0.12::true_val(topsheet_appearance_description, unk_topsheet_appearance_description).

measured(s8, topsheet_appearance_description, bold_skate_bratrud).

all_consistent(topsheet_appearance_description) :-
    (indep(s8), consistent(s8, topsheet_appearance_description) ; \+indep(s8)).

evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, bold_skate_bratrud)).
query(true_val(topsheet_appearance_description, unk_topsheet_appearance_description)).

% @attr collectible_appeal
% @type categorical
% @canonical false
% @original_name Collectible appeal
% @values wall_hanging_art=Board_that_lives_past_snow_days_as_wall_art unk_collectible_appeal=Unknown
% @importance 0.70

0.78::acc(s17, collectible_appeal).

0.80::true_val(collectible_appeal, wall_hanging_art); 0.20::true_val(collectible_appeal, unk_collectible_appeal).

measured(s17, collectible_appeal, wall_hanging_art).

all_consistent(collectible_appeal) :- consistent(s17, collectible_appeal).

evidence(all_consistent(collectible_appeal)).
query(true_val(collectible_appeal, wall_hanging_art)).
query(true_val(collectible_appeal, unk_collectible_appeal)).