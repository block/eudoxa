0.15::indep(sm).
0.15::indep(s1).
0.15::indep(s4).
0.15::indep(s6).
0.15::indep(s29).
0.15::indep(s30).
0.12::indep(s33).
0.15::indep(s41).
0.20::indep(s83).
0.12::indep(s84).
0.12::indep(s89).
0.15::indep(s91).
0.12::indep(s98).
0.15::indep(s71).
0.12::indep(s97).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values burton=Burton unk_brand=Unknown
% @importance 1.0

0.92::acc(s1, brand).
0.93::acc(sm, brand).

0.97::true_val(brand, burton); 0.03::true_val(brand, unk_brand).

measured(s1, brand, burton).
measured(sm, brand, burton).

all_consistent(brand) :-
    (indep(s1), consistent(s1, brand) ; \+indep(s1)),
    (indep(sm), consistent(sm, brand) ; \+indep(sm)).

evidence(all_consistent(brand)).
query(true_val(brand, burton)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values rewind=Rewind unk_model_name=Unknown
% @importance 1.0

0.92::acc(s1, model_name).
0.93::acc(sm, model_name).

0.97::true_val(model_name, rewind); 0.03::true_val(model_name, unk_model_name).

measured(s1, model_name, rewind).
measured(sm, model_name, rewind).

all_consistent(model_name) :-
    (indep(s1), consistent(s1, model_name) ; \+indep(s1)),
    (indep(sm), consistent(sm, model_name) ; \+indep(sm)).

evidence(all_consistent(model_name)).
query(true_val(model_name, rewind)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2025=2025 unk_model_year=Unknown
% @importance 0.88

0.93::acc(sm, model_year).

0.95::true_val(model_year, y2025); 0.05::true_val(model_year, unk_model_year).

measured(sm, model_year, y2025).

all_consistent(model_year) :-
    consistent(sm, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2025)).
query(true_val(model_year, unk_model_year)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.92::acc(s1, product_type).
0.93::acc(sm, product_type).

0.97::true_val(product_type, snowboard); 0.03::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).
measured(sm, product_type, snowboard).

all_consistent(product_type) :-
    (indep(s1), consistent(s1, product_type) ; \+indep(s1)),
    (indep(sm), consistent(sm, product_type) ; \+indep(sm)).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values park_all_mountain=Park_All_Mountain unk_board_category=Unknown
% @importance 0.90

0.90::acc(sm, board_category).

0.95::true_val(board_category, park_all_mountain); 0.05::true_val(board_category, unk_board_category).

measured(sm, board_category, park_all_mountain).

all_consistent(board_category) :-
    consistent(sm, board_category).

evidence(all_consistent(board_category)).
query(true_val(board_category, park_all_mountain)).
query(true_val(board_category, unk_board_category)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values burton_snowboards=Burton_Snowboards_B_Corp unk_manufacturer=Unknown
% @importance 0.65

0.93::acc(s3, manufacturer).
0.88::acc(s78, manufacturer).

0.95::true_val(manufacturer, burton_snowboards); 0.05::true_val(manufacturer, unk_manufacturer).

measured(s3, manufacturer, burton_snowboards).
measured(s78, manufacturer, burton_snowboards).

all_consistent(manufacturer) :-
    consistent(s3, manufacturer),
    consistent(s78, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, burton_snowboards)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr manufacturer_reputation
% @type categorical
% @canonical false
% @original_name Manufacturer reputation
% @values most_complete_brand=Most_established_and_complete_snowboard_brand unk_manufacturer_reputation=Unknown
% @importance 0.60

0.80::acc(s78, manufacturer_reputation).

0.72::true_val(manufacturer_reputation, most_complete_brand); 0.28::true_val(manufacturer_reputation, unk_manufacturer_reputation).

measured(s78, manufacturer_reputation, most_complete_brand).

all_consistent(manufacturer_reputation) :-
    consistent(s78, manufacturer_reputation).

evidence(all_consistent(manufacturer_reputation)).
query(true_val(manufacturer_reputation, most_complete_brand)).
query(true_val(manufacturer_reputation, unk_manufacturer_reputation)).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values rewind_womens=Burton_Rewind_womens_specific_since_2018 unk_predecessor_model_name=Unknown
% @importance 0.40

0.75::acc(s44, predecessor_model_name).
0.80::acc(s47, predecessor_model_name).

0.90::true_val(predecessor_model_name, rewind_womens); 0.10::true_val(predecessor_model_name, unk_predecessor_model_name).

measured(s44, predecessor_model_name, rewind_womens).
measured(s47, predecessor_model_name, rewind_womens).

all_consistent(predecessor_model_name) :-
    consistent(s44, predecessor_model_name),
    consistent(s47, predecessor_model_name).

evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, rewind_womens)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).

% @attr predecessor_model_name_mens
% @type categorical
% @canonical false
% @original_name predecessor_model_name (Name Dropper)
% @values name_dropper=Burton_Name_Dropper unk_predecessor_model_name_mens=Unknown
% @importance 0.75

0.85::acc(s18, predecessor_model_name_mens).

0.78::true_val(predecessor_model_name_mens, name_dropper); 0.22::true_val(predecessor_model_name_mens, unk_predecessor_model_name_mens).

measured(s18, predecessor_model_name_mens, name_dropper).

all_consistent(predecessor_model_name_mens) :-
    consistent(s18, predecessor_model_name_mens).

evidence(all_consistent(predecessor_model_name_mens)).
query(true_val(predecessor_model_name_mens, name_dropper)).
query(true_val(predecessor_model_name_mens, unk_predecessor_model_name_mens)).

% @attr redesign_year
% @type categorical
% @canonical true
% @original_name redesign_year
% @values y2025_unisex_merge=2025_unisex_merge_of_Name_Dropper_and_Rewind unk_redesign_year=Unknown
% @importance 0.75

0.85::acc(s18, redesign_year).

0.78::true_val(redesign_year, y2025_unisex_merge); 0.22::true_val(redesign_year, unk_redesign_year).

measured(s18, redesign_year, y2025_unisex_merge).

all_consistent(redesign_year) :-
    consistent(s18, redesign_year).

evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, y2025_unisex_merge)).
query(true_val(redesign_year, unk_redesign_year)).

% @attr redesign_year_2026
% @type categorical
% @canonical false
% @original_name redesign_year (2026)
% @values graphics_only=Only_graphics_change_for_2026 unk_redesign_year_2026=Unknown
% @importance 0.90

0.88::acc(s1, redesign_year_2026).

0.85::true_val(redesign_year_2026, graphics_only); 0.15::true_val(redesign_year_2026, unk_redesign_year_2026).

measured(s1, redesign_year_2026, graphics_only).

all_consistent(redesign_year_2026) :-
    (indep(s1), consistent(s1, redesign_year_2026) ; \+indep(s1)).

evidence(all_consistent(redesign_year_2026)).
query(true_val(redesign_year_2026, graphics_only)).
query(true_val(redesign_year_2026, unk_redesign_year_2026)).

% @attr award
% @type categorical
% @canonical false
% @original_name Award
% @values platinum_pick_2022=Snowboard_Magazine_2022_Platinum_Pick unk_award=Unknown
% @importance 0.80

0.88::acc(s49, award).

0.85::true_val(award, platinum_pick_2022); 0.15::true_val(award, unk_award).

measured(s49, award, platinum_pick_2022).

all_consistent(award) :-
    consistent(s49, award).

evidence(all_consistent(award)).
query(true_val(award, platinum_pick_2022)).
query(true_val(award, unk_award)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values unisex=Unisex_2025 unk_gender=Unknown
% @importance 0.90

0.90::acc(sm, gender).

0.95::true_val(gender, unisex); 0.05::true_val(gender, unk_gender).

measured(sm, gender, unisex).

all_consistent(gender) :-
    consistent(sm, gender).

evidence(all_consistent(gender)).
query(true_val(gender, unisex)).
query(true_val(gender, unk_gender)).

% @attr sku
% @type categorical
% @canonical false
% @original_name SKU (merchant provided)
% @values sku_19854108000_148=19854108000_148 unk_sku=Unknown
% @importance 0.85

0.95::acc(sm, sku).

0.95::true_val(sku, sku_19854108000_148); 0.05::true_val(sku, unk_sku).

measured(sm, sku, sku_19854108000_148).

all_consistent(sku) :-
    consistent(sm, sku).

evidence(all_consistent(sku)).
query(true_val(sku, sku_19854108000_148)).
query(true_val(sku, unk_sku)).

% @attr topsheet_appearance_description
% @type categorical
% @canonical false
% @original_name topsheet_appearance_description
% @values punk_graffiti=Graphics_inspired_by_spray_paint_on_cardboard_punk_graffiti unk_topsheet_appearance_description=Unknown
% @importance 0.50

0.85::acc(s83, topsheet_appearance_description).
0.82::acc(s98, topsheet_appearance_description).

0.92::true_val(topsheet_appearance_description, punk_graffiti); 0.08::true_val(topsheet_appearance_description, unk_topsheet_appearance_description).

measured(s83, topsheet_appearance_description, punk_graffiti).
measured(s98, topsheet_appearance_description, punk_graffiti).

all_consistent(topsheet_appearance_description) :-
    (indep(s83), consistent(s83, topsheet_appearance_description) ; \+indep(s83)),
    (indep(s98), consistent(s98, topsheet_appearance_description) ; \+indep(s98)).

evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, punk_graffiti)).
query(true_val(topsheet_appearance_description, unk_topsheet_appearance_description)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values six_sizes=140_145_148_151_155_158cm unk_available_sizes=Unknown
% @importance 0.90

0.93::acc(sm, available_sizes).

0.95::true_val(available_sizes, six_sizes); 0.05::true_val(available_sizes, unk_available_sizes).

measured(sm, available_sizes, six_sizes).

all_consistent(available_sizes) :-
    consistent(sm, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, six_sizes)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr setback
% @type numeric
% @unit mm
% @canonical true
% @original_name setback
% @values v0=0.0 unk_setback=Unknown
% @importance 0.85

0.93::acc(sm, setback).

0.95::true_val(setback, v0); 0.05::true_val(setback, unk_setback).

measured(sm, setback, v0).

all_consistent(setback) :-
    consistent(sm, setback).

evidence(all_consistent(setback)).
query(true_val(setback, v0)).
query(true_val(setback, unk_setback)).

% @attr effective_edge_140
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 140cm
% @values v1045=1045.0 unk_effective_edge_140=Unknown
% @importance 0.85

0.93::acc(sm, effective_edge_140).

0.95::true_val(effective_edge_140, v1045); 0.05::true_val(effective_edge_140, unk_effective_edge_140).

measured(sm, effective_edge_140, v1045).

all_consistent(effective_edge_140) :-
    consistent(sm, effective_edge_140).

evidence(all_consistent(effective_edge_140)).
query(true_val(effective_edge_140, v1045)).
query(true_val(effective_edge_140, unk_effective_edge_140)).

% @attr sidecut_radius_size_140
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (140cm)
% @values v6_6=6.6 unk_sidecut_radius_size_140=Unknown
% @importance 0.85

0.93::acc(sm, sidecut_radius_size_140).

0.95::true_val(sidecut_radius_size_140, v6_6); 0.05::true_val(sidecut_radius_size_140, unk_sidecut_radius_size_140).

measured(sm, sidecut_radius_size_140, v6_6).

all_consistent(sidecut_radius_size_140) :-
    consistent(sm, sidecut_radius_size_140).

evidence(all_consistent(sidecut_radius_size_140)).
query(true_val(sidecut_radius_size_140, v6_6)).
query(true_val(sidecut_radius_size_140, unk_sidecut_radius_size_140)).

% @attr tip_tail_width_size_140
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size (140cm)
% @values v2749=2749.0 unk_tip_tail_width_size_140=Unknown
% @importance 0.85

0.93::acc(sm, tip_tail_width_size_140).

0.95::true_val(tip_tail_width_size_140, v2749); 0.05::true_val(tip_tail_width_size_140, unk_tip_tail_width_size_140).

measured(sm, tip_tail_width_size_140, v2749).

all_consistent(tip_tail_width_size_140) :-
    consistent(sm, tip_tail_width_size_140).

evidence(all_consistent(tip_tail_width_size_140)).
query(true_val(tip_tail_width_size_140, v2749)).
query(true_val(tip_tail_width_size_140, unk_tip_tail_width_size_140)).

% @attr waist_width_140
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 140cm
% @values v237=237.0 unk_waist_width_140=Unknown
% @importance 0.85

0.93::acc(sm, waist_width_140).

0.95::true_val(waist_width_140, v237); 0.05::true_val(waist_width_140, unk_waist_width_140).

measured(sm, waist_width_140, v237).

all_consistent(waist_width_140) :-
    consistent(sm, waist_width_140).

evidence(all_consistent(waist_width_140)).
query(true_val(waist_width_140, v237)).
query(true_val(waist_width_140, unk_waist_width_140)).

% @attr stance_width_range_size_140
% @type numeric
% @unit mm
% @canonical false
% @original_name stance_width_range_size (140cm)
% @values v505=505.0 unk_stance_width_range_size_140=Unknown
% @importance 0.85

0.93::acc(sm, stance_width_range_size_140).

0.95::true_val(stance_width_range_size_140, v505); 0.05::true_val(stance_width_range_size_140, unk_stance_width_range_size_140).

measured(sm, stance_width_range_size_140, v505).

all_consistent(stance_width_range_size_140) :-
    consistent(sm, stance_width_range_size_140).

evidence(all_consistent(stance_width_range_size_140)).
query(true_val(stance_width_range_size_140, v505)).
query(true_val(stance_width_range_size_140, unk_stance_width_range_size_140)).

% @attr recommended_weight_range_size_140
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (140cm)
% @values w36_54=36-54kg unk_recommended_weight_range_size_140=Unknown
% @importance 0.85

0.93::acc(sm, recommended_weight_range_size_140).

0.95::true_val(recommended_weight_range_size_140, w36_54); 0.05::true_val(recommended_weight_range_size_140, unk_recommended_weight_range_size_140).

measured(sm, recommended_weight_range_size_140, w36_54).

all_consistent(recommended_weight_range_size_140) :-
    consistent(sm, recommended_weight_range_size_140).

evidence(all_consistent(recommended_weight_range_size_140)).
query(true_val(recommended_weight_range_size_140, w36_54)).
query(true_val(recommended_weight_range_size_140, unk_recommended_weight_range_size_140)).

% @attr effective_edge_145
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 145cm
% @values v1095=1095.0 unk_effective_edge_145=Unknown
% @importance 0.85

0.93::acc(sm, effective_edge_145).

0.95::true_val(effective_edge_145, v1095); 0.05::true_val(effective_edge_145, unk_effective_edge_145).

measured(sm, effective_edge_145, v1095).

all_consistent(effective_edge_145) :-
    consistent(sm, effective_edge_145).

evidence(all_consistent(effective_edge_145)).
query(true_val(effective_edge_145, v1095)).
query(true_val(effective_edge_145, unk_effective_edge_145)).

% @attr sidecut_radius_size_145
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (145cm)
% @values v6_9=6.9 unk_sidecut_radius_size_145=Unknown
% @importance 0.85

0.93::acc(sm, sidecut_radius_size_145).

0.95::true_val(sidecut_radius_size_145, v6_9); 0.05::true_val(sidecut_radius_size_145, unk_sidecut_radius_size_145).

measured(sm, sidecut_radius_size_145, v6_9).

all_consistent(sidecut_radius_size_145) :-
    consistent(sm, sidecut_radius_size_145).

evidence(all_consistent(sidecut_radius_size_145)).
query(true_val(sidecut_radius_size_145, v6_9)).
query(true_val(sidecut_radius_size_145, unk_sidecut_radius_size_145)).

% @attr tip_tail_width_size_145
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size (145cm)
% @values v2798=2798.0 unk_tip_tail_width_size_145=Unknown
% @importance 0.85

0.93::acc(sm, tip_tail_width_size_145).

0.95::true_val(tip_tail_width_size_145, v2798); 0.05::true_val(tip_tail_width_size_145, unk_tip_tail_width_size_145).

measured(sm, tip_tail_width_size_145, v2798).

all_consistent(tip_tail_width_size_145) :-
    consistent(sm, tip_tail_width_size_145).

evidence(all_consistent(tip_tail_width_size_145)).
query(true_val(tip_tail_width_size_145, v2798)).
query(true_val(tip_tail_width_size_145, unk_tip_tail_width_size_145)).

% @attr waist_width_145
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 145cm
% @values v240=240.0 unk_waist_width_145=Unknown
% @importance 0.85

0.93::acc(sm, waist_width_145).

0.95::true_val(waist_width_145, v240); 0.05::true_val(waist_width_145, unk_waist_width_145).

measured(sm, waist_width_145, v240).

all_consistent(waist_width_145) :-
    consistent(sm, waist_width_145).

evidence(all_consistent(waist_width_145)).
query(true_val(waist_width_145, v240)).
query(true_val(waist_width_145, unk_waist_width_145)).

% @attr stance_width_range_size_145
% @type numeric
% @unit mm
% @canonical false
% @original_name stance_width_range_size (145cm)
% @values v505_145=505.0 unk_stance_width_range_size_145=Unknown
% @importance 0.85

0.93::acc(sm, stance_width_range_size_145).

0.95::true_val(stance_width_range_size_145, v505_145); 0.05::true_val(stance_width_range_size_145, unk_stance_width_range_size_145).

measured(sm, stance_width_range_size_145, v505_145).

all_consistent(stance_width_range_size_145) :-
    consistent(sm, stance_width_range_size_145).

evidence(all_consistent(stance_width_range_size_145)).
query(true_val(stance_width_range_size_145, v505_145)).
query(true_val(stance_width_range_size_145, unk_stance_width_range_size_145)).

% @attr recommended_weight_range_size_145
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (145cm)
% @values w45_68=45-68kg unk_recommended_weight_range_size_145=Unknown
% @importance 0.85

0.93::acc(sm, recommended_weight_range_size_145).

0.95::true_val(recommended_weight_range_size_145, w45_68); 0.05::true_val(recommended_weight_range_size_145, unk_recommended_weight_range_size_145).

measured(sm, recommended_weight_range_size_145, w45_68).

all_consistent(recommended_weight_range_size_145) :-
    consistent(sm, recommended_weight_range_size_145).

evidence(all_consistent(recommended_weight_range_size_145)).
query(true_val(recommended_weight_range_size_145, w45_68)).
query(true_val(recommended_weight_range_size_145, unk_recommended_weight_range_size_145)).

% @attr effective_edge_148
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 148cm
% @values v1123=1123.0 unk_effective_edge_148=Unknown
% @importance 0.85

0.93::acc(sm, effective_edge_148).

0.95::true_val(effective_edge_148, v1123); 0.05::true_val(effective_edge_148, unk_effective_edge_148).

measured(sm, effective_edge_148, v1123).

all_consistent(effective_edge_148) :-
    consistent(sm, effective_edge_148).

evidence(all_consistent(effective_edge_148)).
query(true_val(effective_edge_148, v1123)).
query(true_val(effective_edge_148, unk_effective_edge_148)).

% @attr sidecut_radius_size_148
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (148cm)
% @values v7_1=7.1 unk_sidecut_radius_size_148=Unknown
% @importance 0.85

0.93::acc(sm, sidecut_radius_size_148).

0.95::true_val(sidecut_radius_size_148, v7_1); 0.05::true_val(sidecut_radius_size_148, unk_sidecut_radius_size_148).

measured(sm, sidecut_radius_size_148, v7_1).

all_consistent(sidecut_radius_size_148) :-
    consistent(sm, sidecut_radius_size_148).

evidence(all_consistent(sidecut_radius_size_148)).
query(true_val(sidecut_radius_size_148, v7_1)).
query(true_val(sidecut_radius_size_148, unk_sidecut_radius_size_148)).

% @attr tip_tail_width_size_148
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size (148cm)
% @values v2849=2849.0 unk_tip_tail_width_size_148=Unknown
% @importance 0.85

0.93::acc(sm, tip_tail_width_size_148).

0.95::true_val(tip_tail_width_size_148, v2849); 0.05::true_val(tip_tail_width_size_148, unk_tip_tail_width_size_148).

measured(sm, tip_tail_width_size_148, v2849).

all_consistent(tip_tail_width_size_148) :-
    consistent(sm, tip_tail_width_size_148).

evidence(all_consistent(tip_tail_width_size_148)).
query(true_val(tip_tail_width_size_148, v2849)).
query(true_val(tip_tail_width_size_148, unk_tip_tail_width_size_148)).

% @attr waist_width_148
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 148cm
% @values v244=244.0 unk_waist_width_148=Unknown
% @importance 0.85

0.93::acc(sm, waist_width_148).

0.95::true_val(waist_width_148, v244); 0.05::true_val(waist_width_148, unk_waist_width_148).

measured(sm, waist_width_148, v244).

all_consistent(waist_width_148) :-
    consistent(sm, waist_width_148).

evidence(all_consistent(waist_width_148)).
query(true_val(waist_width_148, v244)).
query(true_val(waist_width_148, unk_waist_width_148)).

% @attr stance_width_range_size_148
% @type numeric
% @unit mm
% @canonical false
% @original_name stance_width_range_size (148cm)
% @values v530=530.0 unk_stance_width_range_size_148=Unknown
% @importance 0.85

0.93::acc(sm, stance_width_range_size_148).

0.95::true_val(stance_width_range_size_148, v530); 0.05::true_val(stance_width_range_size_148, unk_stance_width_range_size_148).

measured(sm, stance_width_range_size_148, v530).

all_consistent(stance_width_range_size_148) :-
    consistent(sm, stance_width_range_size_148).

evidence(all_consistent(stance_width_range_size_148)).
query(true_val(stance_width_range_size_148, v530)).
query(true_val(stance_width_range_size_148, unk_stance_width_range_size_148)).

% @attr recommended_weight_range_size_148
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (148cm)
% @values w45_68_148=45-68kg unk_recommended_weight_range_size_148=Unknown
% @importance 0.85

0.93::acc(sm, recommended_weight_range_size_148).

0.95::true_val(recommended_weight_range_size_148, w45_68_148); 0.05::true_val(recommended_weight_range_size_148, unk_recommended_weight_range_size_148).

measured(sm, recommended_weight_range_size_148, w45_68_148).

all_consistent(recommended_weight_range_size_148) :-
    consistent(sm, recommended_weight_range_size_148).

evidence(all_consistent(recommended_weight_range_size_148)).
query(true_val(recommended_weight_range_size_148, w45_68_148)).
query(true_val(recommended_weight_range_size_148, unk_recommended_weight_range_size_148)).

% @attr effective_edge_151
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 151cm
% @values v1149=1149.0 unk_effective_edge_151=Unknown
% @importance 0.85

0.93::acc(sm, effective_edge_151).

0.95::true_val(effective_edge_151, v1149); 0.05::true_val(effective_edge_151, unk_effective_edge_151).

measured(sm, effective_edge_151, v1149).

all_consistent(effective_edge_151) :-
    consistent(sm, effective_edge_151).

evidence(all_consistent(effective_edge_151)).
query(true_val(effective_edge_151, v1149)).
query(true_val(effective_edge_151, unk_effective_edge_151)).

% @attr sidecut_radius_size_151
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (151cm)
% @values v7_3=7.3 unk_sidecut_radius_size_151=Unknown
% @importance 0.85

0.93::acc(sm, sidecut_radius_size_151).

0.95::true_val(sidecut_radius_size_151, v7_3); 0.05::true_val(sidecut_radius_size_151, unk_sidecut_radius_size_151).

measured(sm, sidecut_radius_size_151, v7_3).

all_consistent(sidecut_radius_size_151) :-
    consistent(sm, sidecut_radius_size_151).

evidence(all_consistent(sidecut_radius_size_151)).
query(true_val(sidecut_radius_size_151, v7_3)).
query(true_val(sidecut_radius_size_151, unk_sidecut_radius_size_151)).

% @attr tip_tail_width_size_151
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size (151cm)
% @values v2899=2899.0 unk_tip_tail_width_size_151=Unknown
% @importance 0.85

0.93::acc(sm, tip_tail_width_size_151).

0.95::true_val(tip_tail_width_size_151, v2899); 0.05::true_val(tip_tail_width_size_151, unk_tip_tail_width_size_151).

measured(sm, tip_tail_width_size_151, v2899).

all_consistent(tip_tail_width_size_151) :-
    consistent(sm, tip_tail_width_size_151).

evidence(all_consistent(tip_tail_width_size_151)).
query(true_val(tip_tail_width_size_151, v2899)).
query(true_val(tip_tail_width_size_151, unk_tip_tail_width_size_151)).

% @attr waist_width_151
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 151cm
% @values v248=248.0 unk_waist_width_151=Unknown
% @importance 0.85

0.93::acc(sm, waist_width_151).

0.95::true_val(waist_width_151, v248); 0.05::true_val(waist_width_151, unk_waist_width_151).

measured(sm, waist_width_151, v248).

all_consistent(waist_width_151) :-
    consistent(sm, waist_width_151).

evidence(all_consistent(waist_width_151)).
query(true_val(waist_width_151, v248)).
query(true_val(waist_width_151, unk_waist_width_151)).

% @attr stance_width_range_size_151
% @type numeric
% @unit mm
% @canonical false
% @original_name stance_width_range_size (151cm)
% @values v530_151=530.0 unk_stance_width_range_size_151=Unknown
% @importance 0.85

0.93::acc(sm, stance_width_range_size_151).

0.95::true_val(stance_width_range_size_151, v530_151); 0.05::true_val(stance_width_range_size_151, unk_stance_width_range_size_151).

measured(sm, stance_width_range_size_151, v530_151).

all_consistent(stance_width_range_size_151) :-
    consistent(sm, stance_width_range_size_151).

evidence(all_consistent(stance_width_range_size_151)).
query(true_val(stance_width_range_size_151, v530_151)).
query(true_val(stance_width_range_size_151, unk_stance_width_range_size_151)).

% @attr recommended_weight_range_size_151
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (151cm)
% @values w54_82=54-82kg unk_recommended_weight_range_size_151=Unknown
% @importance 0.85

0.93::acc(sm, recommended_weight_range_size_151).

0.95::true_val(recommended_weight_range_size_151, w54_82); 0.05::true_val(recommended_weight_range_size_151, unk_recommended_weight_range_size_151).

measured(sm, recommended_weight_range_size_151, w54_82).

all_consistent(recommended_weight_range_size_151) :-
    consistent(sm, recommended_weight_range_size_151).

evidence(all_consistent(recommended_weight_range_size_151)).
query(true_val(recommended_weight_range_size_151, w54_82)).
query(true_val(recommended_weight_range_size_151, unk_recommended_weight_range_size_151)).

% @attr effective_edge_155
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 155cm
% @values v1185=1185.0 unk_effective_edge_155=Unknown
% @importance 0.85

0.93::acc(sm, effective_edge_155).

0.95::true_val(effective_edge_155, v1185); 0.05::true_val(effective_edge_155, unk_effective_edge_155).

measured(sm, effective_edge_155, v1185).

all_consistent(effective_edge_155) :-
    consistent(sm, effective_edge_155).

evidence(all_consistent(effective_edge_155)).
query(true_val(effective_edge_155, v1185)).
query(true_val(effective_edge_155, unk_effective_edge_155)).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size
% @values v7_5=7.5 unk_sidecut_radius_size=Unknown
% @importance 0.85

0.93::acc(sm, sidecut_radius_size).

0.95::true_val(sidecut_radius_size, v7_5); 0.05::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(sm, sidecut_radius_size, v7_5).

all_consistent(sidecut_radius_size) :-
    consistent(sm, sidecut_radius_size).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_5)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr tip_tail_width_size
% @type numeric
% @unit mm
% @canonical true
% @original_name tip_tail_width_size
% @values v2942=2942.0 unk_tip_tail_width_size=Unknown
% @importance 0.85

0.93::acc(sm, tip_tail_width_size).

0.95::true_val(tip_tail_width_size, v2942); 0.05::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(sm, tip_tail_width_size, v2942).

all_consistent(tip_tail_width_size) :-
    consistent(sm, tip_tail_width_size).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v2942)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr waist_width_155
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 155cm
% @values v251=251.0 unk_waist_width_155=Unknown
% @importance 0.85

0.93::acc(sm, waist_width_155).

0.95::true_val(waist_width_155, v251); 0.05::true_val(waist_width_155, unk_waist_width_155).

measured(sm, waist_width_155, v251).

all_consistent(waist_width_155) :-
    consistent(sm, waist_width_155).

evidence(all_consistent(waist_width_155)).
query(true_val(waist_width_155, v251)).
query(true_val(waist_width_155, unk_waist_width_155)).

% @attr stance_width_range_size
% @type numeric
% @unit mm
% @canonical true
% @original_name stance_width_range_size
% @values v560=560.0 unk_stance_width_range_size=Unknown
% @importance 0.85

0.93::acc(sm, stance_width_range_size).

0.95::true_val(stance_width_range_size, v560); 0.05::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(sm, stance_width_range_size, v560).

all_consistent(stance_width_range_size) :-
    consistent(sm, stance_width_range_size).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v560)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size
% @values w54_82_155=54-82kg unk_recommended_weight_range_size=Unknown
% @importance 0.85

0.93::acc(sm, recommended_weight_range_size).

0.95::true_val(recommended_weight_range_size, w54_82_155); 0.05::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(sm, recommended_weight_range_size, w54_82_155).

all_consistent(recommended_weight_range_size) :-
    consistent(sm, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w54_82_155)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr effective_edge_158
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 158cm
% @values v1211=1211.0 unk_effective_edge_158=Unknown
% @importance 0.85

0.93::acc(sm, effective_edge_158).

0.95::true_val(effective_edge_158, v1211); 0.05::true_val(effective_edge_158, unk_effective_edge_158).

measured(sm, effective_edge_158, v1211).

all_consistent(effective_edge_158) :-
    consistent(sm, effective_edge_158).

evidence(all_consistent(effective_edge_158)).
query(true_val(effective_edge_158, v1211)).
query(true_val(effective_edge_158, unk_effective_edge_158)).

% @attr sidecut_radius_size_158
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (158cm)
% @values v7_7=7.7 unk_sidecut_radius_size_158=Unknown
% @importance 0.85

0.93::acc(sm, sidecut_radius_size_158).

0.95::true_val(sidecut_radius_size_158, v7_7); 0.05::true_val(sidecut_radius_size_158, unk_sidecut_radius_size_158).

measured(sm, sidecut_radius_size_158, v7_7).

all_consistent(sidecut_radius_size_158) :-
    consistent(sm, sidecut_radius_size_158).

evidence(all_consistent(sidecut_radius_size_158)).
query(true_val(sidecut_radius_size_158, v7_7)).
query(true_val(sidecut_radius_size_158, unk_sidecut_radius_size_158)).

% @attr tip_tail_width_size_158
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size (158cm)
% @values v2972=2972.0 unk_tip_tail_width_size_158=Unknown
% @importance 0.85

0.93::acc(sm, tip_tail_width_size_158).

0.95::true_val(tip_tail_width_size_158, v2972); 0.05::true_val(tip_tail_width_size_158, unk_tip_tail_width_size_158).

measured(sm, tip_tail_width_size_158, v2972).

all_consistent(tip_tail_width_size_158) :-
    consistent(sm, tip_tail_width_size_158).

evidence(all_consistent(tip_tail_width_size_158)).
query(true_val(tip_tail_width_size_158, v2972)).
query(true_val(tip_tail_width_size_158, unk_tip_tail_width_size_158)).

% @attr waist_width_158
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 158cm
% @values v253=253.0 unk_waist_width_158=Unknown
% @importance 0.85

0.93::acc(sm, waist_width_158).

0.95::true_val(waist_width_158, v253); 0.05::true_val(waist_width_158, unk_waist_width_158).

measured(sm, waist_width_158, v253).

all_consistent(waist_width_158) :-
    consistent(sm, waist_width_158).

evidence(all_consistent(waist_width_158)).
query(true_val(waist_width_158, v253)).
query(true_val(waist_width_158, unk_waist_width_158)).

% @attr stance_width_range_size_158
% @type numeric
% @unit mm
% @canonical false
% @original_name stance_width_range_size (158cm)
% @values v560_158=560.0 unk_stance_width_range_size_158=Unknown
% @importance 0.85

0.93::acc(sm, stance_width_range_size_158).

0.95::true_val(stance_width_range_size_158, v560_158); 0.05::true_val(stance_width_range_size_158, unk_stance_width_range_size_158).

measured(sm, stance_width_range_size_158, v560_158).

all_consistent(stance_width_range_size_158) :-
    consistent(sm, stance_width_range_size_158).

evidence(all_consistent(stance_width_range_size_158)).
query(true_val(stance_width_range_size_158, v560_158)).
query(true_val(stance_width_range_size_158, unk_stance_width_range_size_158)).

% @attr recommended_weight_range_size_158
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (158cm)
% @values w68_91=68-91kg unk_recommended_weight_range_size_158=Unknown
% @importance 0.85

0.93::acc(sm, recommended_weight_range_size_158).

0.95::true_val(recommended_weight_range_size_158, w68_91); 0.05::true_val(recommended_weight_range_size_158, unk_recommended_weight_range_size_158).

measured(sm, recommended_weight_range_size_158, w68_91).

all_consistent(recommended_weight_range_size_158) :-
    consistent(sm, recommended_weight_range_size_158).

evidence(all_consistent(recommended_weight_range_size_158)).
query(true_val(recommended_weight_range_size_158, w68_91)).
query(true_val(recommended_weight_range_size_158, unk_recommended_weight_range_size_158)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values true_twin=True_Twin unk_shape=Unknown
% @importance 0.88

0.90::acc(s6, shape).
0.88::acc(s4, shape).
0.93::acc(sm, shape).

0.97::true_val(shape, true_twin); 0.03::true_val(shape, unk_shape).

measured(s6, shape, true_twin).
measured(s4, shape, true_twin).
measured(sm, shape, true_twin).

all_consistent(shape) :-
    (indep(s6), consistent(s6, shape) ; \+indep(s6)),
    (indep(s4), consistent(s4, shape) ; \+indep(s4)),
    (indep(sm), consistent(sm, shape) ; \+indep(sm)).

evidence(all_consistent(shape)).
query(true_val(shape, true_twin)).
query(true_val(shape, unk_shape)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values purepop_camber=PurePop_Camber unk_camber_type=Unknown
% @importance 0.93

0.90::acc(s6, camber_type).
0.88::acc(s1, camber_type).
0.93::acc(sm, camber_type).

0.97::true_val(camber_type, purepop_camber); 0.03::true_val(camber_type, unk_camber_type).

measured(s6, camber_type, purepop_camber).
measured(s1, camber_type, purepop_camber).
measured(sm, camber_type, purepop_camber).

all_consistent(camber_type) :-
    (indep(s6), consistent(s6, camber_type) ; \+indep(s6)),
    (indep(s1), consistent(s1, camber_type) ; \+indep(s1)),
    (indep(sm), consistent(sm, camber_type) ; \+indep(sm)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, purepop_camber)).
query(true_val(camber_type, unk_camber_type)).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v2_5=2.5 v1_4_soft=1-4
% @importance 0.90

0.90::acc(sm, flex_rating_10).
0.85::acc(s1, flex_rating_10).

0.55::true_val(flex_rating_10, v2_5); 0.45::true_val(flex_rating_10, v1_4_soft).

measured(sm, flex_rating_10, v2_5).
measured(s1, flex_rating_10, v1_4_soft).

all_consistent(flex_rating_10) :-
    (indep(sm), consistent(sm, flex_rating_10) ; \+indep(sm)),
    (indep(s1), consistent(s1, flex_rating_10) ; \+indep(s1)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v2_5)).
query(true_val(flex_rating_10, v1_4_soft)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values twin_flex=Twin_Flex_balanced_tip_to_tail unk_flex_feel=Unknown
% @importance 0.90

0.88::acc(s1, flex_feel).
0.88::acc(s29, flex_feel).

0.95::true_val(flex_feel, twin_flex); 0.05::true_val(flex_feel, unk_flex_feel).

measured(s1, flex_feel, twin_flex).
measured(s29, flex_feel, twin_flex).

all_consistent(flex_feel) :-
    (indep(s1), consistent(s1, flex_feel) ; \+indep(s1)),
    (indep(s29), consistent(s29, flex_feel) ; \+indep(s29)).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, twin_flex)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr flex_feel_softness
% @type categorical
% @canonical false
% @original_name flex_feel (soft forgiving)
% @values soft_forgiving=Soft_forgiving_ideal_for_freestyle unk_flex_feel_softness=Unknown
% @importance 0.90

0.87::acc(s1, flex_feel_softness).

0.85::true_val(flex_feel_softness, soft_forgiving); 0.15::true_val(flex_feel_softness, unk_flex_feel_softness).

measured(s1, flex_feel_softness, soft_forgiving).

all_consistent(flex_feel_softness) :-
    (indep(s1), consistent(s1, flex_feel_softness) ; \+indep(s1)).

evidence(all_consistent(flex_feel_softness)).
query(true_val(flex_feel_softness, soft_forgiving)).
query(true_val(flex_feel_softness, unk_flex_feel_softness)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values fsc_super_fly_800g=FSC_Certified_Super_Fly_800G_Dualzone_EGD unk_core_material=Unknown
% @importance 0.87

0.90::acc(s84, core_material).
0.90::acc(s89, core_material).
0.92::acc(sm, core_material).

0.96::true_val(core_material, fsc_super_fly_800g); 0.04::true_val(core_material, unk_core_material).

measured(s84, core_material, fsc_super_fly_800g).
measured(s89, core_material, fsc_super_fly_800g).
measured(sm, core_material, fsc_super_fly_800g).

all_consistent(core_material) :-
    (indep(s84), consistent(s84, core_material) ; \+indep(s84)),
    (indep(s89), consistent(s89, core_material) ; \+indep(s89)),
    (indep(sm), consistent(sm, core_material) ; \+indep(sm)).

evidence(all_consistent(core_material)).
query(true_val(core_material, fsc_super_fly_800g)).
query(true_val(core_material, unk_core_material)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values off_axis_squeezebox_low=Off_Axis_Squeezebox_Low_15deg_core_zones unk_construction_material_innovation=Unknown
% @importance 0.95

0.90::acc(sm, construction_material_innovation).

0.90::true_val(construction_material_innovation, off_axis_squeezebox_low); 0.10::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(sm, construction_material_innovation, off_axis_squeezebox_low).

all_consistent(construction_material_innovation) :-
    (indep(sm), consistent(sm, construction_material_innovation) ; \+indep(sm)).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, off_axis_squeezebox_low)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr construction_material_innovation_filet_o_flex
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Filet-O-Flex)
% @values off_axis_filet_o_flex=Off_Axis_Filet_O_Flex_buttery_board_feel unk_construction_material_innovation_filet_o_flex=Unknown
% @importance 0.95

0.88::acc(s1, construction_material_innovation_filet_o_flex).
0.88::acc(s6, construction_material_innovation_filet_o_flex).

0.93::true_val(construction_material_innovation_filet_o_flex, off_axis_filet_o_flex); 0.07::true_val(construction_material_innovation_filet_o_flex, unk_construction_material_innovation_filet_o_flex).

measured(s1, construction_material_innovation_filet_o_flex, off_axis_filet_o_flex).
measured(s6, construction_material_innovation_filet_o_flex, off_axis_filet_o_flex).

all_consistent(construction_material_innovation_filet_o_flex) :-
    (indep(s1), consistent(s1, construction_material_innovation_filet_o_flex) ; \+indep(s1)),
    (indep(s6), consistent(s6, construction_material_innovation_filet_o_flex) ; \+indep(s6)).

evidence(all_consistent(construction_material_innovation_filet_o_flex)).
query(true_val(construction_material_innovation_filet_o_flex, off_axis_filet_o_flex)).
query(true_val(construction_material_innovation_filet_o_flex, unk_construction_material_innovation_filet_o_flex)).

% @attr construction_material_innovation_eva
% @type categorical
% @canonical false
% @original_name construction_material_innovation (EVA)
% @values ultra_thin_eva=Ultra_thin_core_with_EVA_padding unk_construction_material_innovation_eva=Unknown
% @importance 0.90

0.90::acc(sm, construction_material_innovation_eva).

0.90::true_val(construction_material_innovation_eva, ultra_thin_eva); 0.10::true_val(construction_material_innovation_eva, unk_construction_material_innovation_eva).

measured(sm, construction_material_innovation_eva, ultra_thin_eva).

all_consistent(construction_material_innovation_eva) :-
    (indep(sm), consistent(sm, construction_material_innovation_eva) ; \+indep(sm)).

evidence(all_consistent(construction_material_innovation_eva)).
query(true_val(construction_material_innovation_eva, ultra_thin_eva)).
query(true_val(construction_material_innovation_eva, unk_construction_material_innovation_eva)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values fsc_certified=FSC_Certified_FSC_C124994 unk_sustainability_certification=Unknown
% @importance 0.60

0.88::acc(s98, sustainability_certification).
0.90::acc(sm, sustainability_certification).

0.93::true_val(sustainability_certification, fsc_certified); 0.07::true_val(sustainability_certification, unk_sustainability_certification).

measured(s98, sustainability_certification, fsc_certified).
measured(sm, sustainability_certification, fsc_certified).

all_consistent(sustainability_certification) :-
    (indep(s98), consistent(s98, sustainability_certification) ; \+indep(s98)),
    (indep(sm), consistent(sm, sustainability_certification) ; \+indep(sm)).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, fsc_certified)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values womens_specific_triax=Womens_Specific_Triax_Fiberglass triax_standard=Triax_Fiberglass
% @importance 0.83

0.88::acc(s6, laminate).
0.82::acc(s89, laminate).
0.88::acc(sm, laminate).

0.65::true_val(laminate, womens_specific_triax); 0.35::true_val(laminate, triax_standard).

measured(s6, laminate, womens_specific_triax).
measured(sm, laminate, womens_specific_triax).
measured(s89, laminate, triax_standard).

all_consistent(laminate) :-
    (indep(s6), consistent(s6, laminate) ; \+indep(s6)),
    (indep(sm), consistent(sm, laminate) ; \+indep(sm)),
    (indep(s89), consistent(s89, laminate) ; \+indep(s89)).

evidence(all_consistent(laminate)).
query(true_val(laminate, womens_specific_triax)).
query(true_val(laminate, triax_standard)).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values sintered=Sintered_durable_high_wax_absorption unk_base_type=Unknown
% @importance 0.95

0.90::acc(s6, base_type).
0.90::acc(sm, base_type).

0.96::true_val(base_type, sintered); 0.04::true_val(base_type, unk_base_type).

measured(s6, base_type, sintered).
measured(sm, base_type, sintered).

all_consistent(base_type) :-
    (indep(s6), consistent(s6, base_type) ; \+indep(s6)),
    (indep(sm), consistent(sm, base_type) ; \+indep(sm)).

evidence(all_consistent(base_type)).
query(true_val(base_type, sintered)).
query(true_val(base_type, unk_base_type)).

% @attr resin
% @type categorical
% @canonical true
% @original_name resin
% @values super_sap_epoxy=Super_Sap_plant_based_epoxy_50pct_less_carbon unk_resin=Unknown
% @importance 0.95

0.88::acc(s1, resin).
0.90::acc(sm, resin).

0.95::true_val(resin, super_sap_epoxy); 0.05::true_val(resin, unk_resin).

measured(s1, resin, super_sap_epoxy).
measured(sm, resin, super_sap_epoxy).

all_consistent(resin) :-
    (indep(s1), consistent(s1, resin) ; \+indep(s1)),
    (indep(sm), consistent(sm, resin) ; \+indep(sm)).

evidence(all_consistent(resin)).
query(true_val(resin, super_sap_epoxy)).
query(true_val(resin, unk_resin)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values off_axis_frostbite=Off_Axis_Frostbite_Edges unk_edge_technology=Unknown
% @importance 0.95

0.90::acc(s6, edge_technology).
0.90::acc(sm, edge_technology).

0.95::true_val(edge_technology, off_axis_frostbite); 0.05::true_val(edge_technology, unk_edge_technology).

measured(s6, edge_technology, off_axis_frostbite).
measured(sm, edge_technology, off_axis_frostbite).

all_consistent(edge_technology) :-
    (indep(s6), consistent(s6, edge_technology) ; \+indep(s6)),
    (indep(sm), consistent(sm, edge_technology) ; \+indep(sm)).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, off_axis_frostbite)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr construction_material_innovation_pro_tip
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Pro-Tip)
% @values pro_tip=Pro_Tip_reduced_swing_weight unk_construction_material_innovation_pro_tip=Unknown
% @importance 0.95

0.90::acc(sm, construction_material_innovation_pro_tip).

0.90::true_val(construction_material_innovation_pro_tip, pro_tip); 0.10::true_val(construction_material_innovation_pro_tip, unk_construction_material_innovation_pro_tip).

measured(sm, construction_material_innovation_pro_tip, pro_tip).

all_consistent(construction_material_innovation_pro_tip) :-
    (indep(sm), consistent(sm, construction_material_innovation_pro_tip) ; \+indep(sm)).

evidence(all_consistent(construction_material_innovation_pro_tip)).
query(true_val(construction_material_innovation_pro_tip, pro_tip)).
query(true_val(construction_material_innovation_pro_tip, unk_construction_material_innovation_pro_tip)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values the_channel=The_Channel_mounting_system unk_mounting_pattern=Unknown
% @importance 0.90

0.90::acc(s6, mounting_pattern).
0.88::acc(s1, mounting_pattern).
0.90::acc(sm, mounting_pattern).

0.97::true_val(mounting_pattern, the_channel); 0.03::true_val(mounting_pattern, unk_mounting_pattern).

measured(s6, mounting_pattern, the_channel).
measured(s1, mounting_pattern, the_channel).
measured(sm, mounting_pattern, the_channel).

all_consistent(mounting_pattern) :-
    (indep(s6), consistent(s6, mounting_pattern) ; \+indep(s6)),
    (indep(s1), consistent(s1, mounting_pattern) ; \+indep(s1)),
    (indep(sm), consistent(sm, mounting_pattern) ; \+indep(sm)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, the_channel)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values all_major_best_est=Compatible_all_major_brands_best_with_Burton_EST unk_binding_compatibility=Unknown
% @importance 0.83

0.90::acc(sm, binding_compatibility).

0.90::true_val(binding_compatibility, all_major_best_est); 0.10::true_val(binding_compatibility, unk_binding_compatibility).

measured(sm, binding_compatibility, all_major_best_est).

all_consistent(binding_compatibility) :-
    (indep(sm), consistent(sm, binding_compatibility) ; \+indep(sm)).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, all_major_best_est)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

% @attr construction_material_innovation_infinite_ride
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Infinite Ride)
% @values infinite_ride=Infinite_Ride_maintains_pop_and_flex unk_construction_material_innovation_infinite_ride=Unknown
% @importance 0.95

0.88::acc(s1, construction_material_innovation_infinite_ride).
0.90::acc(s6, construction_material_innovation_infinite_ride).

0.93::true_val(construction_material_innovation_infinite_ride, infinite_ride); 0.07::true_val(construction_material_innovation_infinite_ride, unk_construction_material_innovation_infinite_ride).

measured(s1, construction_material_innovation_infinite_ride, infinite_ride).
measured(s6, construction_material_innovation_infinite_ride, infinite_ride).

all_consistent(construction_material_innovation_infinite_ride) :-
    (indep(s1), consistent(s1, construction_material_innovation_infinite_ride) ; \+indep(s1)),
    (indep(s6), consistent(s6, construction_material_innovation_infinite_ride) ; \+indep(s6)).

evidence(all_consistent(construction_material_innovation_infinite_ride)).
query(true_val(construction_material_innovation_infinite_ride, infinite_ride)).
query(true_val(construction_material_innovation_infinite_ride, unk_construction_material_innovation_infinite_ride)).

% @attr construction_material_innovation_rubber_pads
% @type categorical
% @canonical false
% @original_name construction_material_innovation (rubber pads)
% @values rubber_pads_under_bindings=Thinner_board_with_rubber_pads_under_bindings unk_construction_material_innovation_rubber_pads=Unknown
% @importance 0.85

0.82::acc(s18, construction_material_innovation_rubber_pads).

0.75::true_val(construction_material_innovation_rubber_pads, rubber_pads_under_bindings); 0.25::true_val(construction_material_innovation_rubber_pads, unk_construction_material_innovation_rubber_pads).

measured(s18, construction_material_innovation_rubber_pads, rubber_pads_under_bindings).

all_consistent(construction_material_innovation_rubber_pads) :-
    consistent(s18, construction_material_innovation_rubber_pads).

evidence(all_consistent(construction_material_innovation_rubber_pads)).
query(true_val(construction_material_innovation_rubber_pads, rubber_pads_under_bindings)).
query(true_val(construction_material_innovation_rubber_pads, unk_construction_material_innovation_rubber_pads)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate_expert=Intermediate_to_Expert unk_rider_level=Unknown
% @importance 0.95

0.88::acc(s1, rider_level).
0.90::acc(s29, rider_level).

0.95::true_val(rider_level, intermediate_expert); 0.05::true_val(rider_level, unk_rider_level).

measured(s1, rider_level, intermediate_expert).
measured(s29, rider_level, intermediate_expert).

all_consistent(rider_level) :-
    (indep(s1), consistent(s1, rider_level) ; \+indep(s1)),
    (indep(s29), consistent(s29, rider_level) ; \+indep(s29)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate_expert)).
query(true_val(rider_level, unk_rider_level)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values park7_am7_pow4=Park_7_AllMtn_7_Powder_4 park4_am7_pow4=Park_4_AllMtn_7_Powder_4
% @importance 0.78

0.88::acc(s30, terrain_suitability).
0.70::acc(s71, terrain_suitability).

0.65::true_val(terrain_suitability, park7_am7_pow4); 0.35::true_val(terrain_suitability, park4_am7_pow4).

measured(s30, terrain_suitability, park7_am7_pow4).
measured(s71, terrain_suitability, park4_am7_pow4).

all_consistent(terrain_suitability) :-
    (indep(s30), consistent(s30, terrain_suitability) ; \+indep(s30)),
    (indep(s71), consistent(s71, terrain_suitability) ; \+indep(s71)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, park7_am7_pow4)).
query(true_val(terrain_suitability, park4_am7_pow4)).

% @attr personality_rating
% @type categorical
% @canonical false
% @original_name Personality rating (Cardrona)
% @values playful_medium=1_to_4_Playful_to_Medium unk_personality_rating=Unknown
% @importance 0.85

0.85::acc(s30, personality_rating).

0.85::true_val(personality_rating, playful_medium); 0.15::true_val(personality_rating, unk_personality_rating).

measured(s30, personality_rating, playful_medium).

all_consistent(personality_rating) :-
    (indep(s30), consistent(s30, personality_rating) ; \+indep(s30)).

evidence(all_consistent(personality_rating)).
query(true_val(personality_rating, playful_medium)).
query(true_val(personality_rating, unk_personality_rating)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values freestyle_park=Freestyle_Park_focused_all_mountain_versatility unk_riding_style=Unknown
% @importance 0.95

0.90::acc(s6, riding_style).
0.90::acc(sm, riding_style).

0.95::true_val(riding_style, freestyle_park); 0.05::true_val(riding_style, unk_riding_style).

measured(s6, riding_style, freestyle_park).
measured(sm, riding_style, freestyle_park).

all_consistent(riding_style) :-
    (indep(s6), consistent(s6, riding_style) ; \+indep(s6)),
    (indep(sm), consistent(sm, riding_style) ; \+indep(sm)).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, freestyle_park)).
query(true_val(riding_style, unk_riding_style)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values int_expert_park=Intermediate_to_expert_park_riders_soft_camber_twin unk_skill_level_recommendation=Unknown
% @importance 1.0

0.85::acc(s1, skill_level_recommendation).

0.82::true_val(skill_level_recommendation, int_expert_park); 0.18::true_val(skill_level_recommendation, unk_skill_level_recommendation).

measured(s1, skill_level_recommendation, int_expert_park).

all_consistent(skill_level_recommendation) :-
    (indep(s1), consistent(s1, skill_level_recommendation) ; \+indep(s1)).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, int_expert_park)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

% @attr flex_feel_torsional
% @type categorical
% @canonical false
% @original_name flex_feel (torsionally softer)
% @values torsionally_softer=Torsionally_softer_for_lighter_riders unk_flex_feel_torsional=Unknown
% @importance 0.90

0.88::acc(s6, flex_feel_torsional).

0.88::true_val(flex_feel_torsional, torsionally_softer); 0.12::true_val(flex_feel_torsional, unk_flex_feel_torsional).

measured(s6, flex_feel_torsional, torsionally_softer).

all_consistent(flex_feel_torsional) :-
    (indep(s6), consistent(s6, flex_feel_torsional) ; \+indep(s6)).

evidence(all_consistent(flex_feel_torsional)).
query(true_val(flex_feel_torsional, torsionally_softer)).
query(true_val(flex_feel_torsional, unk_flex_feel_torsional)).

% @attr pop
% @type categorical
% @canonical true
% @original_name pop
% @values poppy_forgiving=Poppy_forgiving_true_twin_for_freestyle unk_pop=Unknown
% @importance 1.0

0.85::acc(s1, pop).

0.82::true_val(pop, poppy_forgiving); 0.18::true_val(pop, unk_pop).

measured(s1, pop, poppy_forgiving).

all_consistent(pop) :-
    (indep(s1), consistent(s1, pop) ; \+indep(s1)).

evidence(all_consistent(pop)).
query(true_val(pop, poppy_forgiving)).
query(true_val(pop, unk_pop)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values butter_machine=Fun_butter_machine_holding_presses_zero_effort unk_reviewer_opinion_whitelines=Unknown
% @importance 0.90

0.85::acc(s47, reviewer_opinion_whitelines).

0.82::true_val(reviewer_opinion_whitelines, butter_machine); 0.18::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

measured(s47, reviewer_opinion_whitelines, butter_machine).

all_consistent(reviewer_opinion_whitelines) :-
    consistent(s47, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, butter_machine)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values great_switch=Rides_great_switch_true_twin_same_feel unk_switch_riding=Unknown
% @importance 0.95

0.83::acc(s42, switch_riding).

0.80::true_val(switch_riding, great_switch); 0.20::true_val(switch_riding, unk_switch_riding).

measured(s42, switch_riding, great_switch).

all_consistent(switch_riding) :-
    consistent(s42, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, great_switch)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values great_edge_hold=Great_connection_holds_edge_well_up_to_hard_icy unk_edge_hold=Unknown
% @importance 0.95

0.83::acc(s42, edge_hold).

0.80::true_val(edge_hold, great_edge_hold); 0.20::true_val(edge_hold, unk_edge_hold).

measured(s42, edge_hold, great_edge_hold).

all_consistent(edge_hold) :-
    consistent(s42, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, great_edge_hold)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values fast_stable_playful=Wants_to_ride_fast_stable_playful_at_speed unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.95

0.83::acc(s42, reviewer_opinion_the_good_ride).

0.80::true_val(reviewer_opinion_the_good_ride, fast_stable_playful); 0.20::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s42, reviewer_opinion_the_good_ride, fast_stable_playful).

all_consistent(reviewer_opinion_the_good_ride) :-
    consistent(s42, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, fast_stable_playful)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr reviewer_opinion_whitelines_jib
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines (jib)
% @values fun_boxes_rails=Fun_on_boxes_rails_learning_tricks_easy unk_reviewer_opinion_whitelines_jib=Unknown
% @importance 0.90

0.85::acc(s47, reviewer_opinion_whitelines_jib).

0.82::true_val(reviewer_opinion_whitelines_jib, fun_boxes_rails); 0.18::true_val(reviewer_opinion_whitelines_jib, unk_reviewer_opinion_whitelines_jib).

measured(s47, reviewer_opinion_whitelines_jib, fun_boxes_rails).

all_consistent(reviewer_opinion_whitelines_jib) :-
    consistent(s47, reviewer_opinion_whitelines_jib).

evidence(all_consistent(reviewer_opinion_whitelines_jib)).
query(true_val(reviewer_opinion_whitelines_jib, fun_boxes_rails)).
query(true_val(reviewer_opinion_whitelines_jib, unk_reviewer_opinion_whitelines_jib)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values easy_press_pop_fun=Super_easy_to_press_pop_fun_for_any_level unk_positive_aspect=Unknown
% @importance 0.95

0.88::acc(sm, positive_aspect).

0.88::true_val(positive_aspect, easy_press_pop_fun); 0.12::true_val(positive_aspect, unk_positive_aspect).

measured(sm, positive_aspect, easy_press_pop_fun).

all_consistent(positive_aspect) :-
    (indep(sm), consistent(sm, positive_aspect) ; \+indep(sm)).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, easy_press_pop_fun)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr flex_feel_charging
% @type categorical
% @canonical false
% @original_name flex_feel (charging)
% @values soft_flex_charges=Soft_flex_that_charges unk_flex_feel_charging=Unknown
% @importance 0.80

0.85::acc(s49, flex_feel_charging).

0.85::true_val(flex_feel_charging, soft_flex_charges); 0.15::true_val(flex_feel_charging, unk_flex_feel_charging).

measured(s49, flex_feel_charging, soft_flex_charges).

all_consistent(flex_feel_charging) :-
    consistent(s49, flex_feel_charging).

evidence(all_consistent(flex_feel_charging)).
query(true_val(flex_feel_charging, soft_flex_charges)).
query(true_val(flex_feel_charging, unk_flex_feel_charging)).

% @attr reviewer_opinion_the_good_ride_powder
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (powder)
% @values poor_powder=Slows_in_powder_prefers_groomed_harder_snow unk_reviewer_opinion_the_good_ride_powder=Unknown
% @importance 0.95

0.83::acc(s42, reviewer_opinion_the_good_ride_powder).

0.80::true_val(reviewer_opinion_the_good_ride_powder, poor_powder); 0.20::true_val(reviewer_opinion_the_good_ride_powder, unk_reviewer_opinion_the_good_ride_powder).

measured(s42, reviewer_opinion_the_good_ride_powder, poor_powder).

all_consistent(reviewer_opinion_the_good_ride_powder) :-
    consistent(s42, reviewer_opinion_the_good_ride_powder).

evidence(all_consistent(reviewer_opinion_the_good_ride_powder)).
query(true_val(reviewer_opinion_the_good_ride_powder, poor_powder)).
query(true_val(reviewer_opinion_the_good_ride_powder, unk_reviewer_opinion_the_good_ride_powder)).

% @attr reviewer_opinion_the_good_ride_slow_speed
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (slow speed)
% @values sticky_slow_turn=Sticks_on_edge_slow_to_turn_at_low_speed unk_reviewer_opinion_the_good_ride_slow_speed=Unknown
% @importance 0.95

0.83::acc(s42, reviewer_opinion_the_good_ride_slow_speed).

0.80::true_val(reviewer_opinion_the_good_ride_slow_speed, sticky_slow_turn); 0.20::true_val(reviewer_opinion_the_good_ride_slow_speed, unk_reviewer_opinion_the_good_ride_slow_speed).

measured(s42, reviewer_opinion_the_good_ride_slow_speed, sticky_slow_turn).

all_consistent(reviewer_opinion_the_good_ride_slow_speed) :-
    consistent(s42, reviewer_opinion_the_good_ride_slow_speed).

evidence(all_consistent(reviewer_opinion_the_good_ride_slow_speed)).
query(true_val(reviewer_opinion_the_good_ride_slow_speed, sticky_slow_turn)).
query(true_val(reviewer_opinion_the_good_ride_slow_speed, unk_reviewer_opinion_the_good_ride_slow_speed)).

% @attr reviewer_opinion_whitelines_high_speed
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines (high speed)
% @values less_comfortable_high_speed=Not_as_comfortable_high_speed_but_holds_edge unk_reviewer_opinion_whitelines_high_speed=Unknown
% @importance 0.90

0.85::acc(s47, reviewer_opinion_whitelines_high_speed).

0.82::true_val(reviewer_opinion_whitelines_high_speed, less_comfortable_high_speed); 0.18::true_val(reviewer_opinion_whitelines_high_speed, unk_reviewer_opinion_whitelines_high_speed).

measured(s47, reviewer_opinion_whitelines_high_speed, less_comfortable_high_speed).

all_consistent(reviewer_opinion_whitelines_high_speed) :-
    consistent(s47, reviewer_opinion_whitelines_high_speed).

evidence(all_consistent(reviewer_opinion_whitelines_high_speed)).
query(true_val(reviewer_opinion_whitelines_high_speed, less_comfortable_high_speed)).
query(true_val(reviewer_opinion_whitelines_high_speed, unk_reviewer_opinion_whitelines_high_speed)).

% @attr reviewer_opinion_whitelines_jumps
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines (jumps)
% @values loose_bigger_jumps=Feels_loose_on_bigger_jumps_soft_profile_washout unk_reviewer_opinion_whitelines_jumps=Unknown
% @importance 0.90

0.85::acc(s47, reviewer_opinion_whitelines_jumps).

0.82::true_val(reviewer_opinion_whitelines_jumps, loose_bigger_jumps); 0.18::true_val(reviewer_opinion_whitelines_jumps, unk_reviewer_opinion_whitelines_jumps).

measured(s47, reviewer_opinion_whitelines_jumps, loose_bigger_jumps).

all_consistent(reviewer_opinion_whitelines_jumps) :-
    consistent(s47, reviewer_opinion_whitelines_jumps).

evidence(all_consistent(reviewer_opinion_whitelines_jumps)).
query(true_val(reviewer_opinion_whitelines_jumps, loose_bigger_jumps)).
query(true_val(reviewer_opinion_whitelines_jumps, unk_reviewer_opinion_whitelines_jumps)).

% @attr reviewer_opinion_the_good_ride_butter
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (butter)
% @values butter_effort=Can_butter_but_requires_effort_stiffer_on_foot unk_reviewer_opinion_the_good_ride_butter=Unknown
% @importance 0.95

0.83::acc(s42, reviewer_opinion_the_good_ride_butter).

0.80::true_val(reviewer_opinion_the_good_ride_butter, butter_effort); 0.20::true_val(reviewer_opinion_the_good_ride_butter, unk_reviewer_opinion_the_good_ride_butter).

measured(s42, reviewer_opinion_the_good_ride_butter, butter_effort).

all_consistent(reviewer_opinion_the_good_ride_butter) :-
    consistent(s42, reviewer_opinion_the_good_ride_butter).

evidence(all_consistent(reviewer_opinion_the_good_ride_butter)).
query(true_val(reviewer_opinion_the_good_ride_butter, butter_effort)).
query(true_val(reviewer_opinion_the_good_ride_butter, unk_reviewer_opinion_the_good_ride_butter)).

% @attr reviewer_opinion_the_good_ride_jib
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (jib)
% @values not_beginner_jib=Not_for_beginner_jibbers_but_locks_in_well unk_reviewer_opinion_the_good_ride_jib=Unknown
% @importance 0.95

0.83::acc(s42, reviewer_opinion_the_good_ride_jib).

0.80::true_val(reviewer_opinion_the_good_ride_jib, not_beginner_jib); 0.20::true_val(reviewer_opinion_the_good_ride_jib, unk_reviewer_opinion_the_good_ride_jib).

measured(s42, reviewer_opinion_the_good_ride_jib, not_beginner_jib).

all_consistent(reviewer_opinion_the_good_ride_jib) :-
    consistent(s42, reviewer_opinion_the_good_ride_jib).

evidence(all_consistent(reviewer_opinion_the_good_ride_jib)).
query(true_val(reviewer_opinion_the_good_ride_jib, not_beginner_jib)).
query(true_val(reviewer_opinion_the_good_ride_jib, unk_reviewer_opinion_the_good_ride_jib)).

% @attr reviewer_opinion_the_good_ride_damp
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (dampness)
% @values medium_damp=Medium_damp_feel_information_from_snow unk_reviewer_opinion_the_good_ride_damp=Unknown
% @importance 0.95

0.83::acc(s42, reviewer_opinion_the_good_ride_damp).

0.80::true_val(reviewer_opinion_the_good_ride_damp, medium_damp); 0.20::true_val(reviewer_opinion_the_good_ride_damp, unk_reviewer_opinion_the_good_ride_damp).

measured(s42, reviewer_opinion_the_good_ride_damp, medium_damp).

all_consistent(reviewer_opinion_the_good_ride_damp) :-
    consistent(s42, reviewer_opinion_the_good_ride_damp).

evidence(all_consistent(reviewer_opinion_the_good_ride_damp)).
query(true_val(reviewer_opinion_the_good_ride_damp, medium_damp)).
query(true_val(reviewer_opinion_the_good_ride_damp, unk_reviewer_opinion_the_good_ride_damp)).

% @attr reviewer_opinion_the_good_ride_groomers
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (groomers)
% @values prefers_groomers=Prefers_groomers_ok_off_piste_best_on_even_terrain unk_reviewer_opinion_the_good_ride_groomers=Unknown
% @importance 0.95

0.83::acc(s42, reviewer_opinion_the_good_ride_groomers).

0.80::true_val(reviewer_opinion_the_good_ride_groomers, prefers_groomers); 0.20::true_val(reviewer_opinion_the_good_ride_groomers, unk_reviewer_opinion_the_good_ride_groomers).

measured(s42, reviewer_opinion_the_good_ride_groomers, prefers_groomers).

all_consistent(reviewer_opinion_the_good_ride_groomers) :-
    consistent(s42, reviewer_opinion_the_good_ride_groomers).

evidence(all_consistent(reviewer_opinion_the_good_ride_groomers)).
query(true_val(reviewer_opinion_the_good_ride_groomers, prefers_groomers)).
query(true_val(reviewer_opinion_the_good_ride_groomers, unk_reviewer_opinion_the_good_ride_groomers)).

% @attr reviewer_opinion_the_good_ride_recommendation
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (recommendation)
% @values high_int_adv_fast_twin=Good_for_high_intermediate_to_advanced_fast_twin unk_reviewer_opinion_the_good_ride_recommendation=Unknown
% @importance 0.95

0.83::acc(s42, reviewer_opinion_the_good_ride_recommendation).

0.80::true_val(reviewer_opinion_the_good_ride_recommendation, high_int_adv_fast_twin); 0.20::true_val(reviewer_opinion_the_good_ride_recommendation, unk_reviewer_opinion_the_good_ride_recommendation).

measured(s42, reviewer_opinion_the_good_ride_recommendation, high_int_adv_fast_twin).

all_consistent(reviewer_opinion_the_good_ride_recommendation) :-
    consistent(s42, reviewer_opinion_the_good_ride_recommendation).

evidence(all_consistent(reviewer_opinion_the_good_ride_recommendation)).
query(true_val(reviewer_opinion_the_good_ride_recommendation, high_int_adv_fast_twin)).
query(true_val(reviewer_opinion_the_good_ride_recommendation, unk_reviewer_opinion_the_good_ride_recommendation)).

% @attr snowboarder_com_assessment
% @type categorical
% @canonical false
% @original_name Snowboarder.com assessment
% @values perfect_soft_charging=Perfect_soft_but_charging_womens_freestyle_board unk_snowboarder_com_assessment=Unknown
% @importance 0.50

0.78::acc(s63, snowboarder_com_assessment).

0.75::true_val(snowboarder_com_assessment, perfect_soft_charging); 0.25::true_val(snowboarder_com_assessment, unk_snowboarder_com_assessment).

measured(s63, snowboarder_com_assessment, perfect_soft_charging).

all_consistent(snowboarder_com_assessment) :-
    consistent(s63, snowboarder_com_assessment).

evidence(all_consistent(snowboarder_com_assessment)).
query(true_val(snowboarder_com_assessment, perfect_soft_charging)).
query(true_val(snowboarder_com_assessment, unk_snowboarder_com_assessment)).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v529_95=529.95 unk_price_usd_msrp=Unknown
% @importance 0.93

0.93::acc(s83, price_usd_msrp).
0.90::acc(s4, price_usd_msrp).

0.97::true_val(price_usd_msrp, v529_95); 0.03::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s83, price_usd_msrp, v529_95).
measured(s4, price_usd_msrp, v529_95).

all_consistent(price_usd_msrp) :-
    (indep(s83), consistent(s83, price_usd_msrp) ; \+indep(s83)),
    (indep(s4), consistent(s4, price_usd_msrp) ; \+indep(s4)).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v529_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical false
% @original_name price_aud_merchant
% @values v559_99=559.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.95::acc(sm, price_aud_merchant).

0.95::true_val(price_aud_merchant, v559_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(sm, price_aud_merchant, v559_99).

all_consistent(price_aud_merchant) :-
    consistent(sm, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v559_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_usd_rei
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_rei
% @values v317_83=317.83 unk_price_usd_rei=Unknown
% @importance 0.95

0.95::acc(s83, price_usd_rei).

0.95::true_val(price_usd_rei, v317_83); 0.05::true_val(price_usd_rei, unk_price_usd_rei).

measured(s83, price_usd_rei, v317_83).

all_consistent(price_usd_rei) :-
    consistent(s83, price_usd_rei).

evidence(all_consistent(price_usd_rei)).
query(true_val(price_usd_rei, v317_83)).
query(true_val(price_usd_rei, unk_price_usd_rei)).

% @attr price_usd_evo
% @type categorical
% @canonical false
% @original_name price_usd_evo
% @values evo_397_46_sale=2026_model_397_46_sale_in_store_only unk_price_usd_evo=Unknown
% @importance 0.88

0.90::acc(s6, price_usd_evo).

0.88::true_val(price_usd_evo, evo_397_46_sale); 0.12::true_val(price_usd_evo, unk_price_usd_evo).

measured(s6, price_usd_evo, evo_397_46_sale).

all_consistent(price_usd_evo) :-
    consistent(s6, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, evo_397_46_sale)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_ski_chalet
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at The Ski Chalet (USD)
% @values v529_95_sc=529.95 unk_price_ski_chalet=Unknown
% @importance 0.90

0.90::acc(s4, price_ski_chalet).

0.90::true_val(price_ski_chalet, v529_95_sc); 0.10::true_val(price_ski_chalet, unk_price_ski_chalet).

measured(s4, price_ski_chalet, v529_95_sc).

all_consistent(price_ski_chalet) :-
    (indep(s4), consistent(s4, price_ski_chalet) ; \+indep(s4)).

evidence(all_consistent(price_ski_chalet)).
query(true_val(price_ski_chalet, v529_95_sc)).
query(true_val(price_ski_chalet, unk_price_ski_chalet)).

% @attr price_shoreline
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at Shoreline of Tahoe (USD)
% @values v529_95_sl=529.95 unk_price_shoreline=Unknown
% @importance 0.85

0.88::acc(s84, price_shoreline).

0.88::true_val(price_shoreline, v529_95_sl); 0.12::true_val(price_shoreline, unk_price_shoreline).

measured(s84, price_shoreline, v529_95_sl).

all_consistent(price_shoreline) :-
    (indep(s84), consistent(s84, price_shoreline) ; \+indep(s84)).

evidence(all_consistent(price_shoreline)).
query(true_val(price_shoreline, v529_95_sl)).
query(true_val(price_shoreline, unk_price_shoreline)).

% @attr price_ski_world
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at Ski World (USD)
% @values v529_95_sw=529.95 unk_price_ski_world=Unknown
% @importance 0.70

0.85::acc(s89, price_ski_world).

0.85::true_val(price_ski_world, v529_95_sw); 0.15::true_val(price_ski_world, unk_price_ski_world).

measured(s89, price_ski_world, v529_95_sw).

all_consistent(price_ski_world) :-
    (indep(s89), consistent(s89, price_ski_world) ; \+indep(s89)).

evidence(all_consistent(price_ski_world)).
query(true_val(price_ski_world, v529_95_sw)).
query(true_val(price_ski_world, unk_price_ski_world)).

% @attr price_source_boards
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at Source Boards (USD)
% @values v481=481.0 unk_price_source_boards=Unknown
% @importance 0.85

0.88::acc(s33, price_source_boards).

0.85::true_val(price_source_boards, v481); 0.15::true_val(price_source_boards, unk_price_source_boards).

measured(s33, price_source_boards, v481).

all_consistent(price_source_boards) :-
    (indep(s33), consistent(s33, price_source_boards) ; \+indep(s33)).

evidence(all_consistent(price_source_boards)).
query(true_val(price_source_boards, v481)).
query(true_val(price_source_boards, unk_price_source_boards)).

% @attr price_snowboard_robot
% @type numeric
% @unit USD
% @canonical false
% @original_name Price per Snowboard Robot (USD, 2025 season)
% @values v530=530.0 unk_price_snowboard_robot=Unknown
% @importance 0.85

0.82::acc(s18, price_snowboard_robot).

0.78::true_val(price_snowboard_robot, v530); 0.22::true_val(price_snowboard_robot, unk_price_snowboard_robot).

measured(s18, price_snowboard_robot, v530).

all_consistent(price_snowboard_robot) :-
    consistent(s18, price_snowboard_robot).

evidence(all_consistent(price_snowboard_robot)).
query(true_val(price_snowboard_robot, v530)).
query(true_val(price_snowboard_robot, unk_price_snowboard_robot)).

% @attr price_usd_msrp_2022
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_msrp (2022 historical)
% @values v499_95=499.95 unk_price_usd_msrp_2022=Unknown
% @importance 0.80

0.85::acc(s49, price_usd_msrp_2022).

0.85::true_val(price_usd_msrp_2022, v499_95); 0.15::true_val(price_usd_msrp_2022, unk_price_usd_msrp_2022).

measured(s49, price_usd_msrp_2022, v499_95).

all_consistent(price_usd_msrp_2022) :-
    consistent(s49, price_usd_msrp_2022).

evidence(all_consistent(price_usd_msrp_2022)).
query(true_val(price_usd_msrp_2022, v499_95)).
query(true_val(price_usd_msrp_2022, unk_price_usd_msrp_2022)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values sold_through_bstock=2025_model_sold_through_B_stock_was_available unk_availability_status=Unknown
% @importance 0.70

0.85::acc(s3, availability_status).

0.80::true_val(availability_status, sold_through_bstock); 0.20::true_val(availability_status, unk_availability_status).

measured(s3, availability_status, sold_through_bstock).

all_consistent(availability_status) :-
    consistent(s3, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, sold_through_bstock)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_rei
% @type categorical
% @canonical false
% @original_name availability_status (REI)
% @values available_clearance=Available_317_83_clearance unk_availability_status_rei=Unknown
% @importance 0.95

0.93::acc(s83, availability_status_rei).

0.93::true_val(availability_status_rei, available_clearance); 0.07::true_val(availability_status_rei, unk_availability_status_rei).

measured(s83, availability_status_rei, available_clearance).

all_consistent(availability_status_rei) :-
    consistent(s83, availability_status_rei).

evidence(all_consistent(availability_status_rei)).
query(true_val(availability_status_rei, available_clearance)).
query(true_val(availability_status_rei, unk_availability_status_rei)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status (evo)
% @values oos_2026_instore=2025_out_of_stock_2026_in_store_only unk_availability_status_evo=Unknown
% @importance 0.88

0.90::acc(s6, availability_status_evo).

0.88::true_val(availability_status_evo, oos_2026_instore); 0.12::true_val(availability_status_evo, unk_availability_status_evo).

measured(s6, availability_status_evo, oos_2026_instore).

all_consistent(availability_status_evo) :-
    consistent(s6, availability_status_evo).

evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, oos_2026_instore)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

% @attr availability_status_melbourne
% @type categorical
% @canonical false
% @original_name availability_status (Melbourne)
% @values ships_australia=Ships_within_Australia_only unk_availability_status_melbourne=Unknown
% @importance 0.95

0.93::acc(sm, availability_status_melbourne).

0.93::true_val(availability_status_melbourne, ships_australia); 0.07::true_val(availability_status_melbourne, unk_availability_status_melbourne).

measured(sm, availability_status_melbourne, ships_australia).

all_consistent(availability_status_melbourne) :-
    consistent(sm, availability_status_melbourne).

evidence(all_consistent(availability_status_melbourne)).
query(true_val(availability_status_melbourne, ships_australia)).
query(true_val(availability_status_melbourne, unk_availability_status_melbourne)).

% @attr availability_status_cardrona
% @type categorical
% @canonical false
% @original_name availability_status (Cardrona)
% @values nz_only=Only_available_within_New_Zealand unk_availability_status_cardrona=Unknown
% @importance 0.85

0.88::acc(s30, availability_status_cardrona).

0.88::true_val(availability_status_cardrona, nz_only); 0.12::true_val(availability_status_cardrona, unk_availability_status_cardrona).

measured(s30, availability_status_cardrona, nz_only).

all_consistent(availability_status_cardrona) :-
    (indep(s30), consistent(s30, availability_status_cardrona) ; \+indep(s30)).

evidence(all_consistent(availability_status_cardrona)).
query(true_val(availability_status_cardrona, nz_only)).
query(true_val(availability_status_cardrona, unk_availability_status_cardrona)).

% @attr availability_status_eriks
% @type categorical
% @canonical false
% @original_name availability_status (ERIK'S)
% @values available_eriks=Available unk_availability_status_eriks=Unknown
% @importance 0.70

0.82::acc(s41, availability_status_eriks).

0.78::true_val(availability_status_eriks, available_eriks); 0.22::true_val(availability_status_eriks, unk_availability_status_eriks).

measured(s41, availability_status_eriks, available_eriks).

all_consistent(availability_status_eriks) :-
    (indep(s41), consistent(s41, availability_status_eriks) ; \+indep(s41)).

evidence(all_consistent(availability_status_eriks)).
query(true_val(availability_status_eriks, available_eriks)).
query(true_val(availability_status_eriks, unk_availability_status_eriks)).

% @attr availability_status_corbetts
% @type categorical
% @canonical false
% @original_name availability_status (Corbetts)
% @values listed_corbetts=Listed unk_availability_status_corbetts=Unknown
% @importance 0.50

0.78::acc(s91, availability_status_corbetts).

0.72::true_val(availability_status_corbetts, listed_corbetts); 0.28::true_val(availability_status_corbetts, unk_availability_status_corbetts).

measured(s91, availability_status_corbetts, listed_corbetts).

all_consistent(availability_status_corbetts) :-
    (indep(s91), consistent(s91, availability_status_corbetts) ; \+indep(s91)).

evidence(all_consistent(availability_status_corbetts)).
query(true_val(availability_status_corbetts, listed_corbetts)).
query(true_val(availability_status_corbetts, unk_availability_status_corbetts)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values three_year=3_Year_Warranty_Channel_boards_2014_plus unk_warranty=Unknown
% @importance 0.83

0.88::acc(s4, warranty).
0.90::acc(s29, warranty).

0.93::true_val(warranty, three_year); 0.07::true_val(warranty, unk_warranty).

measured(s4, warranty, three_year).
measured(s29, warranty, three_year).

all_consistent(warranty) :-
    (indep(s4), consistent(s4, warranty) ; \+indep(s4)),
    (indep(s29), consistent(s29, warranty) ; \+indep(s29)).

evidence(all_consistent(warranty)).
query(true_val(warranty, three_year)).
query(true_val(warranty, unk_warranty)).

% @attr sustainability_certification_super_sap
% @type categorical
% @canonical false
% @original_name sustainability_certification (Super Sap)
% @values super_sap_50pct=Super_Sap_Epoxy_50pct_carbon_reduction unk_sustainability_certification_super_sap=Unknown
% @importance 0.95

0.90::acc(sm, sustainability_certification_super_sap).

0.90::true_val(sustainability_certification_super_sap, super_sap_50pct); 0.10::true_val(sustainability_certification_super_sap, unk_sustainability_certification_super_sap).

measured(sm, sustainability_certification_super_sap, super_sap_50pct).

all_consistent(sustainability_certification_super_sap) :-
    (indep(sm), consistent(sm, sustainability_certification_super_sap) ; \+indep(sm)).

evidence(all_consistent(sustainability_certification_super_sap)).
query(true_val(sustainability_certification_super_sap, super_sap_50pct)).
query(true_val(sustainability_certification_super_sap, unk_sustainability_certification_super_sap)).

% @attr sustainability_certification_b_corp
% @type categorical
% @canonical false
% @original_name sustainability_certification (B Corp)
% @values certified_b_corp=Burton_is_Certified_B_Corp unk_sustainability_certification_b_corp=Unknown
% @importance 0.50

0.80::acc(s97, sustainability_certification_b_corp).

0.78::true_val(sustainability_certification_b_corp, certified_b_corp); 0.22::true_val(sustainability_certification_b_corp, unk_sustainability_certification_b_corp).

measured(s97, sustainability_certification_b_corp, certified_b_corp).

all_consistent(sustainability_certification_b_corp) :-
    (indep(s97), consistent(s97, sustainability_certification_b_corp) ; \+indep(s97)).

evidence(all_consistent(sustainability_certification_b_corp)).
query(true_val(sustainability_certification_b_corp, certified_b_corp)).
query(true_val(sustainability_certification_b_corp, unk_sustainability_certification_b_corp)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values talent_scout=Burton_Talent_Scout_more_aggressive_stiffer_camber unk_comparable_board_same_brand=Unknown
% @importance 0.90

0.82::acc(s47, comparable_board_same_brand).

0.82::true_val(comparable_board_same_brand, talent_scout); 0.18::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s47, comparable_board_same_brand, talent_scout).

all_consistent(comparable_board_same_brand) :-
    consistent(s47, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, talent_scout)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_blossom
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Blossom)
% @values blossom=Burton_Blossom_unisex_twin_full_camber_620 unk_comparable_board_same_brand_blossom=Unknown
% @importance 0.70

0.78::acc(s18, comparable_board_same_brand_blossom).

0.72::true_val(comparable_board_same_brand_blossom, blossom); 0.28::true_val(comparable_board_same_brand_blossom, unk_comparable_board_same_brand_blossom).

measured(s18, comparable_board_same_brand_blossom, blossom).

all_consistent(comparable_board_same_brand_blossom) :-
    consistent(s18, comparable_board_same_brand_blossom).

evidence(all_consistent(comparable_board_same_brand_blossom)).
query(true_val(comparable_board_same_brand_blossom, blossom)).
query(true_val(comparable_board_same_brand_blossom, unk_comparable_board_same_brand_blossom)).

% @attr comparable_board_same_brand_process
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Process)
% @values process=Burton_Process_stiffer_traditional_camber_549_95 unk_comparable_board_same_brand_process=Unknown
% @importance 0.80

0.85::acc(s83, comparable_board_same_brand_process).

0.82::true_val(comparable_board_same_brand_process, process); 0.18::true_val(comparable_board_same_brand_process, unk_comparable_board_same_brand_process).

measured(s83, comparable_board_same_brand_process, process).

all_consistent(comparable_board_same_brand_process) :-
    consistent(s83, comparable_board_same_brand_process).

evidence(all_consistent(comparable_board_same_brand_process)).
query(true_val(comparable_board_same_brand_process, process)).
query(true_val(comparable_board_same_brand_process, unk_comparable_board_same_brand_process)).

% @attr comparable_board_same_brand_custom
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Custom)
% @values custom=Burton_Custom_flagship_all_mountain_directional_670 unk_comparable_board_same_brand_custom=Unknown
% @importance 0.70

0.78::acc(s18, comparable_board_same_brand_custom).

0.72::true_val(comparable_board_same_brand_custom, custom); 0.28::true_val(comparable_board_same_brand_custom, unk_comparable_board_same_brand_custom).

measured(s18, comparable_board_same_brand_custom, custom).

all_consistent(comparable_board_same_brand_custom) :-
    consistent(s18, comparable_board_same_brand_custom).

evidence(all_consistent(comparable_board_same_brand_custom)).
query(true_val(comparable_board_same_brand_custom, custom)).
query(true_val(comparable_board_same_brand_custom, unk_comparable_board_same_brand_custom)).

% @attr comparable_board_same_brand_park_twin
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (park twin)
% @values park_twin_530=Similar_park_twin_530_camber_medium_flex_800g unk_comparable_board_same_brand_park_twin=Unknown
% @importance 0.85

0.80::acc(s18, comparable_board_same_brand_park_twin).

0.75::true_val(comparable_board_same_brand_park_twin, park_twin_530); 0.25::true_val(comparable_board_same_brand_park_twin, unk_comparable_board_same_brand_park_twin).

measured(s18, comparable_board_same_brand_park_twin, park_twin_530).

all_consistent(comparable_board_same_brand_park_twin) :-
    consistent(s18, comparable_board_same_brand_park_twin).

evidence(all_consistent(comparable_board_same_brand_park_twin)).
query(true_val(comparable_board_same_brand_park_twin, park_twin_530)).
query(true_val(comparable_board_same_brand_park_twin, unk_comparable_board_same_brand_park_twin)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values capita_paradise=CAPiTA_Paradise_529_95_at_evo unk_comparable_board_cross_brand=Unknown
% @importance 0.70

0.82::acc(s6, comparable_board_cross_brand).

0.80::true_val(comparable_board_cross_brand, capita_paradise); 0.20::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s6, comparable_board_cross_brand, capita_paradise).

all_consistent(comparable_board_cross_brand) :-
    consistent(s6, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, capita_paradise)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_2
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (second)
% @values competitor_519_95=Competitor_519_95_at_evo unk_comparable_board_cross_brand_2=Unknown
% @importance 0.70

0.82::acc(s6, comparable_board_cross_brand_2).

0.80::true_val(comparable_board_cross_brand_2, competitor_519_95); 0.20::true_val(comparable_board_cross_brand_2, unk_comparable_board_cross_brand_2).

measured(s6, comparable_board_cross_brand_2, competitor_519_95).

all_consistent(comparable_board_cross_brand_2) :-
    consistent(s6, comparable_board_cross_brand_2).

evidence(all_consistent(comparable_board_cross_brand_2)).
query(true_val(comparable_board_cross_brand_2, competitor_519_95)).
query(true_val(comparable_board_cross_brand_2, unk_comparable_board_cross_brand_2)).

% @attr comparable_board_cross_brand_3
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (K2)
% @values k2_alternative=K2_alternative_womens_park_all_mountain_sintered unk_comparable_board_cross_brand_3=Unknown
% @importance 0.50

0.65::acc(s43, comparable_board_cross_brand_3).

0.55::true_val(comparable_board_cross_brand_3, k2_alternative); 0.45::true_val(comparable_board_cross_brand_3, unk_comparable_board_cross_brand_3).

measured(s43, comparable_board_cross_brand_3, k2_alternative).

all_consistent(comparable_board_cross_brand_3) :-
    consistent(s43, comparable_board_cross_brand_3).

evidence(all_consistent(comparable_board_cross_brand_3)).
query(true_val(comparable_board_cross_brand_3, k2_alternative)).
query(true_val(comparable_board_cross_brand_3, unk_comparable_board_cross_brand_3)).

% @attr comparable_board_cross_brand_4
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (forum alternatives)
% @values popular_park_alternatives=Popular_park_alternatives_from_major_brands unk_comparable_board_cross_brand_4=Unknown
% @importance 0.50

0.55::acc(s75, comparable_board_cross_brand_4).

0.45::true_val(comparable_board_cross_brand_4, popular_park_alternatives); 0.55::true_val(comparable_board_cross_brand_4, unk_comparable_board_cross_brand_4).

measured(s75, comparable_board_cross_brand_4, popular_park_alternatives).

all_consistent(comparable_board_cross_brand_4) :-
    consistent(s75, comparable_board_cross_brand_4).

evidence(all_consistent(comparable_board_cross_brand_4)).
query(true_val(comparable_board_cross_brand_4, popular_park_alternatives)).
query(true_val(comparable_board_cross_brand_4, unk_comparable_board_cross_brand_4)).

% @attr comparable_board_cross_brand_5
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (shape shifted)
% @values shape_shifted_alt=Popular_alternative_shape_shifted_board unk_comparable_board_cross_brand_5=Unknown
% @importance 0.60

0.70::acc(s78, comparable_board_cross_brand_5).

0.65::true_val(comparable_board_cross_brand_5, shape_shifted_alt); 0.35::true_val(comparable_board_cross_brand_5, unk_comparable_board_cross_brand_5).

measured(s78, comparable_board_cross_brand_5, shape_shifted_alt).

all_consistent(comparable_board_cross_brand_5) :-
    consistent(s78, comparable_board_cross_brand_5).

evidence(all_consistent(comparable_board_cross_brand_5)).
query(true_val(comparable_board_cross_brand_5, shape_shifted_alt)).
query(true_val(comparable_board_cross_brand_5, unk_comparable_board_cross_brand_5)).

% @attr retailer_burton_com
% @type categorical
% @canonical false
% @original_name Burton.com
% @values official_manufacturer=Official_manufacturer_direct_highest_authority unk_retailer_burton_com=Unknown
% @importance 0.70

0.90::acc(s3, retailer_burton_com).

0.90::true_val(retailer_burton_com, official_manufacturer); 0.10::true_val(retailer_burton_com, unk_retailer_burton_com).

measured(s3, retailer_burton_com, official_manufacturer).

all_consistent(retailer_burton_com) :-
    consistent(s3, retailer_burton_com).

evidence(all_consistent(retailer_burton_com)).
query(true_val(retailer_burton_com, official_manufacturer)).
query(true_val(retailer_burton_com, unk_retailer_burton_com)).

% @attr retailer_rei
% @type categorical
% @canonical false
% @original_name REI Co-op
% @values major_us_outdoor=Major_US_outdoor_retailer_1yr_return unk_retailer_rei=Unknown
% @importance 0.95

0.92::acc(s83, retailer_rei).

0.92::true_val(retailer_rei, major_us_outdoor); 0.08::true_val(retailer_rei, unk_retailer_rei).

measured(s83, retailer_rei, major_us_outdoor).

all_consistent(retailer_rei) :-
    consistent(s83, retailer_rei).

evidence(all_consistent(retailer_rei)).
query(true_val(retailer_rei, major_us_outdoor)).
query(true_val(retailer_rei, unk_retailer_rei)).

% @attr retailer_evo
% @type categorical
% @canonical false
% @original_name evo
% @values specialty_snow=Respected_specialty_snow_retailer_rewards_returns unk_retailer_evo=Unknown
% @importance 0.90

0.90::acc(s6, retailer_evo).

0.88::true_val(retailer_evo, specialty_snow); 0.12::true_val(retailer_evo, unk_retailer_evo).

measured(s6, retailer_evo, specialty_snow).

all_consistent(retailer_evo) :-
    consistent(s6, retailer_evo).

evidence(all_consistent(retailer_evo)).
query(true_val(retailer_evo, specialty_snow)).
query(true_val(retailer_evo, unk_retailer_evo)).

% @attr retailer_melbourne_snowboard
% @type categorical
% @canonical false
% @original_name Melbourne Snowboard Centre
% @values aus_specialist=Australian_specialist_snowboard_retailer unk_retailer_melbourne_snowboard=Unknown
% @importance 0.95

0.90::acc(sm, retailer_melbourne_snowboard).

0.90::true_val(retailer_melbourne_snowboard, aus_specialist); 0.10::true_val(retailer_melbourne_snowboard, unk_retailer_melbourne_snowboard).

measured(sm, retailer_melbourne_snowboard, aus_specialist).

all_consistent(retailer_melbourne_snowboard) :-
    consistent(sm, retailer_melbourne_snowboard).

evidence(all_consistent(retailer_melbourne_snowboard)).
query(true_val(retailer_melbourne_snowboard, aus_specialist)).
query(true_val(retailer_melbourne_snowboard, unk_retailer_melbourne_snowboard)).

% @attr retailer_corbetts
% @type categorical
% @canonical false
% @original_name Corbetts
% @values canadian_retailer=Canadian_ski_snowboard_retailer_free_ship_100 unk_retailer_corbetts=Unknown
% @importance 0.50

0.75::acc(s91, retailer_corbetts).

0.72::true_val(retailer_corbetts, canadian_retailer); 0.28::true_val(retailer_corbetts, unk_retailer_corbetts).

measured(s91, retailer_corbetts, canadian_retailer).

all_consistent(retailer_corbetts) :-
    (indep(s91), consistent(s91, retailer_corbetts) ; \+indep(s91)).

evidence(all_consistent(retailer_corbetts)).
query(true_val(retailer_corbetts, canadian_retailer)).
query(true_val(retailer_corbetts, unk_retailer_corbetts)).

% @attr retailer_ski_chalet
% @type categorical
% @canonical false
% @original_name The Ski Chalet
% @values na_retailer=North_American_retailer unk_retailer_ski_chalet=Unknown
% @importance 0.90

0.85::acc(s4, retailer_ski_chalet).

0.82::true_val(retailer_ski_chalet, na_retailer); 0.18::true_val(retailer_ski_chalet, unk_retailer_ski_chalet).

measured(s4, retailer_ski_chalet, na_retailer).

all_consistent(retailer_ski_chalet) :-
    (indep(s4), consistent(s4, retailer_ski_chalet) ; \+indep(s4)).

evidence(all_consistent(retailer_ski_chalet)).
query(true_val(retailer_ski_chalet, na_retailer)).
query(true_val(retailer_ski_chalet, unk_retailer_ski_chalet)).

% @attr retailer_eriks
% @type categorical
% @canonical false
% @original_name ERIK'S
% @values us_chain=US_bike_board_ski_chain_free_wax_price_match unk_retailer_eriks=Unknown
% @importance 0.70

0.78::acc(s41, retailer_eriks).

0.75::true_val(retailer_eriks, us_chain); 0.25::true_val(retailer_eriks, unk_retailer_eriks).

measured(s41, retailer_eriks, us_chain).

all_consistent(retailer_eriks) :-
    (indep(s41), consistent(s41, retailer_eriks) ; \+indep(s41)).

evidence(all_consistent(retailer_eriks)).
query(true_val(retailer_eriks, us_chain)).
query(true_val(retailer_eriks, unk_retailer_eriks)).

% @attr retailer_source_boards
% @type categorical
% @canonical false
% @original_name Source Boards (The Source Snowboard & Skate)
% @values canadian_owned=Canadian_owned_shop unk_retailer_source_boards=Unknown
% @importance 0.85

0.80::acc(s33, retailer_source_boards).

0.78::true_val(retailer_source_boards, canadian_owned); 0.22::true_val(retailer_source_boards, unk_retailer_source_boards).

measured(s33, retailer_source_boards, canadian_owned).

all_consistent(retailer_source_boards) :-
    (indep(s33), consistent(s33, retailer_source_boards) ; \+indep(s33)).

evidence(all_consistent(retailer_source_boards)).
query(true_val(retailer_source_boards, canadian_owned)).
query(true_val(retailer_source_boards, unk_retailer_source_boards)).

% @attr retailer_blauer
% @type categorical
% @canonical false
% @original_name Blauer Board Shop
% @values us_specialty=US_specialty_retailer_expert_staff unk_retailer_blauer=Unknown
% @importance 1.0

0.82::acc(s1, retailer_blauer).

0.80::true_val(retailer_blauer, us_specialty); 0.20::true_val(retailer_blauer, unk_retailer_blauer).

measured(s1, retailer_blauer, us_specialty).

all_consistent(retailer_blauer) :-
    (indep(s1), consistent(s1, retailer_blauer) ; \+indep(s1)).

evidence(all_consistent(retailer_blauer)).
query(true_val(retailer_blauer, us_specialty)).
query(true_val(retailer_blauer, unk_retailer_blauer)).

% @attr retailer_cardrona
% @type categorical
% @canonical false
% @original_name Cardrona Corner
% @values nz_resort_shop=New_Zealand_resort_shop unk_retailer_cardrona=Unknown
% @importance 0.85

0.82::acc(s30, retailer_cardrona).

0.80::true_val(retailer_cardrona, nz_resort_shop); 0.20::true_val(retailer_cardrona, unk_retailer_cardrona).

measured(s30, retailer_cardrona, nz_resort_shop).

all_consistent(retailer_cardrona) :-
    (indep(s30), consistent(s30, retailer_cardrona) ; \+indep(s30)).

evidence(all_consistent(retailer_cardrona)).
query(true_val(retailer_cardrona, nz_resort_shop)).
query(true_val(retailer_cardrona, unk_retailer_cardrona)).

% @attr terrain_suitability_qualitative
% @type categorical
% @canonical false
% @original_name terrain_suitability (qualitative)
% @values park_groomers=Park_riding_rails_boxes_jumps_and_groomer_laps unk_terrain_suitability_qualitative=Unknown
% @importance 0.98

0.88::acc(s1, terrain_suitability_qualitative).
0.83::acc(s42, terrain_suitability_qualitative).

0.92::true_val(terrain_suitability_qualitative, park_groomers); 0.08::true_val(terrain_suitability_qualitative, unk_terrain_suitability_qualitative).

measured(s1, terrain_suitability_qualitative, park_groomers).
measured(s42, terrain_suitability_qualitative, park_groomers).

all_consistent(terrain_suitability_qualitative) :-
    (indep(s1), consistent(s1, terrain_suitability_qualitative) ; \+indep(s1)),
    consistent(s42, terrain_suitability_qualitative).

evidence(all_consistent(terrain_suitability_qualitative)).
query(true_val(terrain_suitability_qualitative, park_groomers)).
query(true_val(terrain_suitability_qualitative, unk_terrain_suitability_qualitative)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values powder_slow_damp=Deep_powder_very_slow_speed_lacking_dampening unk_negative_aspect=Unknown
% @importance 0.93

0.83::acc(s42, negative_aspect).
0.82::acc(s47, negative_aspect).

0.90::true_val(negative_aspect, powder_slow_damp); 0.10::true_val(negative_aspect, unk_negative_aspect).

measured(s42, negative_aspect, powder_slow_damp).
measured(s47, negative_aspect, powder_slow_damp).

all_consistent(negative_aspect) :-
    consistent(s42, negative_aspect),
    consistent(s47, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, powder_slow_damp)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr recommended_weight_range_size_note
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (general note)
% @values general_recommendation=Weight_ranges_are_general_recommendations unk_recommended_weight_range_size_note=Unknown
% @importance 1.0

0.85::acc(s1, recommended_weight_range_size_note).

0.82::true_val(recommended_weight_range_size_note, general_recommendation); 0.18::true_val(recommended_weight_range_size_note, unk_recommended_weight_range_size_note).

measured(s1, recommended_weight_range_size_note, general_recommendation).

all_consistent(recommended_weight_range_size_note) :-
    (indep(s1), consistent(s1, recommended_weight_range_size_note) ; \+indep(s1)).

evidence(all_consistent(recommended_weight_range_size_note)).
query(true_val(recommended_weight_range_size_note, general_recommendation)).
query(true_val(recommended_weight_range_size_note, unk_recommended_weight_range_size_note)).

% @attr maintenance
% @type categorical
% @canonical false
% @original_name Maintenance
% @values wax_every_2_uses=Sintered_base_needs_regular_waxing_every_2_uses unk_maintenance=Unknown
% @importance 0.50

0.55::acc(s43, maintenance).

0.45::true_val(maintenance, wax_every_2_uses); 0.55::true_val(maintenance, unk_maintenance).

measured(s43, maintenance, wax_every_2_uses).

all_consistent(maintenance) :-
    consistent(s43, maintenance).

evidence(all_consistent(maintenance)).
query(true_val(maintenance, wax_every_2_uses)).
query(true_val(maintenance, unk_maintenance)).

% @attr flex_feel_hand_vs_foot
% @type categorical
% @canonical false
% @original_name flex_feel (hand vs foot)
% @values softer_hand_stiffer_foot=Softer_in_hand_medium_to_stiff_on_foot unk_flex_feel_hand_vs_foot=Unknown
% @importance 0.95

0.83::acc(s42, flex_feel_hand_vs_foot).

0.80::true_val(flex_feel_hand_vs_foot, softer_hand_stiffer_foot); 0.20::true_val(flex_feel_hand_vs_foot, unk_flex_feel_hand_vs_foot).

measured(s42, flex_feel_hand_vs_foot, softer_hand_stiffer_foot).

all_consistent(flex_feel_hand_vs_foot) :-
    consistent(s42, flex_feel_hand_vs_foot).

evidence(all_consistent(flex_feel_hand_vs_foot)).
query(true_val(flex_feel_hand_vs_foot, softer_hand_stiffer_foot)).
query(true_val(flex_feel_hand_vs_foot, unk_flex_feel_hand_vs_foot)).

% @attr value_positioning
% @type categorical
% @canonical false
% @original_name Value positioning
% @values mid_range_800g_sintered=Mid_range_529_95_800g_core_regular_sintered_base unk_value_positioning=Unknown
% @importance 0.85

0.80::acc(s18, value_positioning).

0.75::true_val(value_positioning, mid_range_800g_sintered); 0.25::true_val(value_positioning, unk_value_positioning).

measured(s18, value_positioning, mid_range_800g_sintered).

all_consistent(value_positioning) :-
    consistent(s18, value_positioning).

evidence(all_consistent(value_positioning)).
query(true_val(value_positioning, mid_range_800g_sintered)).
query(true_val(value_positioning, unk_value_positioning)).