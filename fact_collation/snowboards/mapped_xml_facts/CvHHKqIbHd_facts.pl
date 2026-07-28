0.12::indep(s1).
0.10::indep(s5).
0.12::indep(s6).
0.12::indep(s9).
0.12::indep(s11).
0.20::indep(s12).
0.15::indep(s31).
0.12::indep(s33).
0.15::indep(s_merchant).
0.12::indep(s78).
0.15::indep(s50).
0.12::indep(s82).
0.10::indep(s83).
0.12::indep(s84).
0.15::indep(s86).
0.12::indep(s94).
0.20::indep(s98).
0.10::indep(s43).
0.10::indep(s80).
0.10::indep(s81).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values burton_snowboards=Burton_Snowboards unk_brand=Unknown
% @importance 0.875

0.95::true_val(brand, burton_snowboards); 0.05::true_val(brand, unk_brand).
0.90::acc(s22, brand).
0.85::acc(s1, brand).
measured(s22, brand, burton_snowboards).
measured(s1, brand, burton_snowboards).
all_consistent(brand) :- consistent(s22, brand), (indep(s1), consistent(s1, brand) ; \+indep(s1)).
evidence(all_consistent(brand)).
query(true_val(brand, burton_snowboards)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values custom_30th_anniversary=Burton_Custom_30th_Anniversary unk_model_name=Unknown
% @importance 0.825

0.95::true_val(model_name, custom_30th_anniversary); 0.05::true_val(model_name, unk_model_name).
0.95::acc(s32, model_name).
0.85::acc(s1, model_name).
measured(s32, model_name, custom_30th_anniversary).
measured(s1, model_name, custom_30th_anniversary).
all_consistent(model_name) :- consistent(s32, model_name), (indep(s1), consistent(s1, model_name) ; \+indep(s1)).
evidence(all_consistent(model_name)).
query(true_val(model_name, custom_30th_anniversary)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2026=2026 unk_model_year=Unknown
% @importance 0.875

0.97::true_val(model_year, y2026); 0.03::true_val(model_year, unk_model_year).
0.95::acc(s22, model_year).
0.88::acc(s1, model_year).
measured(s22, model_year, y2026).
measured(s1, model_year, y2026).
all_consistent(model_year) :- consistent(s22, model_year), (indep(s1), consistent(s1, model_year) ; \+indep(s1)).
evidence(all_consistent(model_year)).
query(true_val(model_year, y2026)).
query(true_val(model_year, unk_model_year)).

% @attr anniversary
% @type categorical
% @canonical false
% @original_name Anniversary
% @values thirtieth=30th_Anniversary_of_Burton_Custom unk_anniversary=Unknown
% @importance 0.80

0.93::true_val(anniversary, thirtieth); 0.07::true_val(anniversary, unk_anniversary).
0.95::acc(s22, anniversary).
measured(s22, anniversary, thirtieth).
all_consistent(anniversary) :- consistent(s22, anniversary).
evidence(all_consistent(anniversary)).
query(true_val(anniversary, thirtieth)).
query(true_val(anniversary, unk_anniversary)).

% @attr model_series
% @type categorical
% @canonical false
% @original_name Model series
% @values burton_custom=Burton_Custom unk_model_series=Unknown
% @importance 0.80

0.93::true_val(model_series, burton_custom); 0.07::true_val(model_series, unk_model_series).
0.95::acc(s22, model_series).
measured(s22, model_series, burton_custom).
all_consistent(model_series) :- consistent(s22, model_series).
evidence(all_consistent(model_series)).
query(true_val(model_series, burton_custom)).
query(true_val(model_series, unk_model_series)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_1995_96=1995_96_season unk_model_first_available_year=Unknown
% @importance 0.70

0.92::true_val(model_first_available_year, season_1995_96); 0.08::true_val(model_first_available_year, unk_model_first_available_year).
0.96::acc(s74, model_first_available_year).
measured(s74, model_first_available_year, season_1995_96).
all_consistent(model_first_available_year) :- consistent(s74, model_first_available_year).
evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_1995_96)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr custom_x_launched
% @type categorical
% @canonical false
% @original_name Custom X launched
% @values y2004=2004 unk_custom_x_launched=Unknown
% @importance 0.70

0.92::true_val(custom_x_launched, y2004); 0.08::true_val(custom_x_launched, unk_custom_x_launched).
0.96::acc(s74, custom_x_launched).
measured(s74, custom_x_launched, y2004).
all_consistent(custom_x_launched) :- consistent(s74, custom_x_launched).
evidence(all_consistent(custom_x_launched)).
query(true_val(custom_x_launched, y2004)).
query(true_val(custom_x_launched, unk_custom_x_launched)).

% @attr model_variant
% @type categorical
% @canonical false
% @original_name Model variant
% @values ltd_30th_reissue=Limited_Edition_30th_Anniversary_reissue_1996_graphics unk_model_variant=Unknown
% @importance 0.775

0.93::true_val(model_variant, ltd_30th_reissue); 0.07::true_val(model_variant, unk_model_variant).
0.90::acc(s1, model_variant).
0.85::acc(s9, model_variant).
measured(s1, model_variant, ltd_30th_reissue).
measured(s9, model_variant, ltd_30th_reissue).
all_consistent(model_variant) :- (indep(s1), consistent(s1, model_variant) ; \+indep(s1)), (indep(s9), consistent(s9, model_variant) ; \+indep(s9)).
evidence(all_consistent(model_variant)).
query(true_val(model_variant, ltd_30th_reissue)).
query(true_val(model_variant, unk_model_variant)).

% @attr ben_ferguson_variant
% @type categorical
% @canonical false
% @original_name Ben Ferguson collaboration variant
% @values pegasus_graphic=Ben_Ferguson_hand_drawn_Pegasus_graphic unk_ben_ferguson_variant=Unknown
% @importance 0.475

0.85::true_val(ben_ferguson_variant, pegasus_graphic); 0.15::true_val(ben_ferguson_variant, unk_ben_ferguson_variant).
0.95::acc(s7, ben_ferguson_variant).
0.70::acc(s10, ben_ferguson_variant).
measured(s7, ben_ferguson_variant, pegasus_graphic).
measured(s10, ben_ferguson_variant, pegasus_graphic).
all_consistent(ben_ferguson_variant) :- consistent(s7, ben_ferguson_variant), consistent(s10, ben_ferguson_variant).
evidence(all_consistent(ben_ferguson_variant)).
query(true_val(ben_ferguson_variant, pegasus_graphic)).
query(true_val(ben_ferguson_variant, unk_ben_ferguson_variant)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values custom_camber_standard=Burton_Custom_Camber_non_anniversary_679_95 unk_comparable_board_same_brand=Unknown
% @importance 0.80

0.90::true_val(comparable_board_same_brand, custom_camber_standard); 0.10::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).
0.88::acc(s82, comparable_board_same_brand).
0.78::acc(s83, comparable_board_same_brand).
measured(s82, comparable_board_same_brand, custom_camber_standard).
measured(s83, comparable_board_same_brand, custom_camber_standard).
all_consistent(comparable_board_same_brand) :- (indep(s82), consistent(s82, comparable_board_same_brand) ; \+indep(s82)), (indep(s83), consistent(s83, comparable_board_same_brand) ; \+indep(s83)).
evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, custom_camber_standard)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_flying_v
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Flying V variant)
% @values custom_flying_v=Custom_Flying_V_hybrid_rocker_camber unk_cbs_flying_v=Unknown
% @importance 0.70

0.88::true_val(comparable_board_same_brand_flying_v, custom_flying_v); 0.12::true_val(comparable_board_same_brand_flying_v, unk_cbs_flying_v).
0.92::acc(s19, comparable_board_same_brand_flying_v).
0.82::acc(s106, comparable_board_same_brand_flying_v).
0.78::acc(s16, comparable_board_same_brand_flying_v).
measured(s19, comparable_board_same_brand_flying_v, custom_flying_v).
measured(s106, comparable_board_same_brand_flying_v, custom_flying_v).
measured(s16, comparable_board_same_brand_flying_v, custom_flying_v).
all_consistent(comparable_board_same_brand_flying_v) :- consistent(s19, comparable_board_same_brand_flying_v), consistent(s106, comparable_board_same_brand_flying_v), consistent(s16, comparable_board_same_brand_flying_v).
evidence(all_consistent(comparable_board_same_brand_flying_v)).
query(true_val(comparable_board_same_brand_flying_v, custom_flying_v)).
query(true_val(comparable_board_same_brand_flying_v, unk_cbs_flying_v)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.95

0.97::true_val(product_type, snowboard); 0.03::true_val(product_type, unk_product_type).
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
% @values all_mountain=All_Mountain unk_board_category=Unknown
% @importance 0.875

0.95::true_val(board_category, all_mountain); 0.05::true_val(board_category, unk_board_category).
0.90::acc(s1, board_category).
0.85::acc(s6, board_category).
measured(s1, board_category, all_mountain).
measured(s6, board_category, all_mountain).
all_consistent(board_category) :- (indep(s1), consistent(s1, board_category) ; \+indep(s1)), (indep(s6), consistent(s6, board_category) ; \+indep(s6)).
evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain)).
query(true_val(board_category, unk_board_category)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values unisex=Unisex unk_gender=Unknown
% @importance 0.50

0.75::true_val(gender, unisex); 0.25::true_val(gender, unk_gender).
0.72::acc(s78, gender).
measured(s78, gender, unisex).
all_consistent(gender) :- consistent(s78, gender).
evidence(all_consistent(gender)).
query(true_val(gender, unisex)).
query(true_val(gender, unk_gender)).

% @attr comparable_board_same_brand_feelgood
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Feelgood)
% @values feelgood=Burton_Feelgood_same_tech_different_graphics_smaller_sizes unk_cbs_feelgood=Unknown
% @importance 0.80

0.82::true_val(comparable_board_same_brand_feelgood, feelgood); 0.18::true_val(comparable_board_same_brand_feelgood, unk_cbs_feelgood).
0.82::acc(s16, comparable_board_same_brand_feelgood).
measured(s16, comparable_board_same_brand_feelgood, feelgood).
all_consistent(comparable_board_same_brand_feelgood) :- consistent(s16, comparable_board_same_brand_feelgood).
evidence(all_consistent(comparable_board_same_brand_feelgood)).
query(true_val(comparable_board_same_brand_feelgood, feelgood)).
query(true_val(comparable_board_same_brand_feelgood, unk_cbs_feelgood)).

% @attr comparable_board_same_brand_smalls
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Custom Smalls)
% @values custom_smalls=Burton_Custom_Smalls_125_145cm unk_cbs_smalls=Unknown
% @importance 0.80

0.82::true_val(comparable_board_same_brand_smalls, custom_smalls); 0.18::true_val(comparable_board_same_brand_smalls, unk_cbs_smalls).
0.82::acc(s16, comparable_board_same_brand_smalls).
measured(s16, comparable_board_same_brand_smalls, custom_smalls).
all_consistent(comparable_board_same_brand_smalls) :- consistent(s16, comparable_board_same_brand_smalls).
evidence(all_consistent(comparable_board_same_brand_smalls)).
query(true_val(comparable_board_same_brand_smalls, custom_smalls)).
query(true_val(comparable_board_same_brand_smalls, unk_cbs_smalls)).

% @attr legacy
% @type categorical
% @canonical false
% @original_name Legacy
% @values never_left_lineup=Only_board_never_left_Burton_lineup unk_legacy=Unknown
% @importance 0.80

0.93::true_val(legacy, never_left_lineup); 0.07::true_val(legacy, unk_legacy).
0.95::acc(s22, legacy).
measured(s22, legacy, never_left_lineup).
all_consistent(legacy) :- consistent(s22, legacy).
evidence(all_consistent(legacy)).
query(true_val(legacy, never_left_lineup)).
query(true_val(legacy, unk_legacy)).

% @attr manufacturer_description
% @type categorical
% @canonical false
% @original_name Manufacturer description
% @values most_popular_versatile=Most_popular_versatile_mimicked_board unk_manufacturer_description=Unknown
% @importance 0.80

0.88::true_val(manufacturer_description, most_popular_versatile); 0.12::true_val(manufacturer_description, unk_manufacturer_description).
0.85::acc(s6, manufacturer_description).
measured(s6, manufacturer_description, most_popular_versatile).
all_consistent(manufacturer_description) :- consistent(s6, manufacturer_description).
evidence(all_consistent(manufacturer_description)).
query(true_val(manufacturer_description, most_popular_versatile)).
query(true_val(manufacturer_description, unk_manufacturer_description)).

% @attr best_selling_claim
% @type categorical
% @canonical false
% @original_name Best-selling claim
% @values best_selling_ever=Best_selling_snowboard_of_all_time unk_best_selling_claim=Unknown
% @importance 0.70

0.88::true_val(best_selling_claim, best_selling_ever); 0.12::true_val(best_selling_claim, unk_best_selling_claim).
0.90::acc(s74, best_selling_claim).
measured(s74, best_selling_claim, best_selling_ever).
all_consistent(best_selling_claim) :- consistent(s74, best_selling_claim).
evidence(all_consistent(best_selling_claim)).
query(true_val(best_selling_claim, best_selling_ever)).
query(true_val(best_selling_claim, unk_best_selling_claim)).

% @attr designer
% @type categorical
% @canonical false
% @original_name Designer
% @values burton_snowboards_design=Burton_Snowboards unk_designer=Unknown
% @importance 0.75

0.85::true_val(designer, burton_snowboards_design); 0.15::true_val(designer, unk_designer).
0.82::acc(s98, designer).
measured(s98, designer, burton_snowboards_design).
all_consistent(designer) :- consistent(s98, designer).
evidence(all_consistent(designer)).
query(true_val(designer, burton_snowboards_design)).
query(true_val(designer, unk_designer)).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values kiel_nindl_austria=Kiel_Nindl_GMBH_Austria unk_manufacturing_location=Unknown
% @importance 0.75

0.85::true_val(manufacturing_location, kiel_nindl_austria); 0.15::true_val(manufacturing_location, unk_manufacturing_location).
0.85::acc(s98, manufacturing_location).
measured(s98, manufacturing_location, kiel_nindl_austria).
all_consistent(manufacturing_location) :- (indep(s98), consistent(s98, manufacturing_location) ; \+indep(s98)).
evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, kiel_nindl_austria)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

% @attr sustainability_certification_local_sourcing
% @type categorical
% @canonical false
% @original_name sustainability_certification (local sourcing)
% @values radius_250_miles=Sources_materials_within_250_mile_radius unk_sc_local=Unknown
% @importance 0.50

0.84::true_val(sustainability_certification_local_sourcing, radius_250_miles); 0.16::true_val(sustainability_certification_local_sourcing, unk_sc_local).
0.90::acc(s96, sustainability_certification_local_sourcing).
measured(s96, sustainability_certification_local_sourcing, radius_250_miles).
all_consistent(sustainability_certification_local_sourcing) :- consistent(s96, sustainability_certification_local_sourcing).
evidence(all_consistent(sustainability_certification_local_sourcing)).
query(true_val(sustainability_certification_local_sourcing, radius_250_miles)).
query(true_val(sustainability_certification_local_sourcing, unk_sc_local)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values fsc_certified_100=100_percent_FSC_certified_cores unk_sustainability_certification=Unknown
% @importance 0.525

0.95::true_val(sustainability_certification, fsc_certified_100); 0.05::true_val(sustainability_certification, unk_sustainability_certification).
0.95::acc(s93, sustainability_certification).
0.90::acc(s96, sustainability_certification).
measured(s93, sustainability_certification, fsc_certified_100).
measured(s96, sustainability_certification, fsc_certified_100).
all_consistent(sustainability_certification) :- consistent(s93, sustainability_certification), consistent(s96, sustainability_certification).
evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, fsc_certified_100)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr sustainability_certification_super_sap
% @type categorical
% @canonical false
% @original_name sustainability_certification (Super Sap)
% @values super_sap_50pct=Super_Sap_Epoxy_50pct_reduced_carbon unk_sc_sap=Unknown
% @importance 0.90

0.93::true_val(sustainability_certification_super_sap, super_sap_50pct); 0.07::true_val(sustainability_certification_super_sap, unk_sc_sap).
0.90::acc(s1, sustainability_certification_super_sap).
0.88::acc(s31, sustainability_certification_super_sap).
measured(s1, sustainability_certification_super_sap, super_sap_50pct).
measured(s31, sustainability_certification_super_sap, super_sap_50pct).
all_consistent(sustainability_certification_super_sap) :- (indep(s1), consistent(s1, sustainability_certification_super_sap) ; \+indep(s1)), (indep(s31), consistent(s31, sustainability_certification_super_sap) ; \+indep(s31)).
evidence(all_consistent(sustainability_certification_super_sap)).
query(true_val(sustainability_certification_super_sap, super_sap_50pct)).
query(true_val(sustainability_certification_super_sap, unk_sc_sap)).

% @attr sustainability_certification_b_corp
% @type categorical
% @canonical false
% @original_name sustainability_certification (B Corp)
% @values b_corp_certified=Burton_is_certified_B_Corporation unk_sc_bcorp=Unknown
% @importance 0.50

0.80::true_val(sustainability_certification_b_corp, b_corp_certified); 0.20::true_val(sustainability_certification_b_corp, unk_sc_bcorp).
0.82::acc(s32, sustainability_certification_b_corp).
measured(s32, sustainability_certification_b_corp, b_corp_certified).
all_consistent(sustainability_certification_b_corp) :- consistent(s32, sustainability_certification_b_corp).
evidence(all_consistent(sustainability_certification_b_corp)).
query(true_val(sustainability_certification_b_corp, b_corp_certified)).
query(true_val(sustainability_certification_b_corp, unk_sc_bcorp)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values three_year=3_year_warranty unk_warranty=Unknown
% @importance 0.775

0.95::true_val(warranty, three_year); 0.05::true_val(warranty, unk_warranty).
0.88::acc(s6, warranty).
0.85::acc(s33, warranty).
measured(s6, warranty, three_year).
measured(s33, warranty, three_year).
all_consistent(warranty) :- (indep(s6), consistent(s6, warranty) ; \+indep(s6)), (indep(s33), consistent(s33, warranty) ; \+indep(s33)).
evidence(all_consistent(warranty)).
query(true_val(warranty, three_year)).
query(true_val(warranty, unk_warranty)).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v1049_99=1049.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.95::true_val(price_aud_merchant, v1049_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).
0.97::acc(s_merchant, price_aud_merchant).
measured(s_merchant, price_aud_merchant, v1049_99).
all_consistent(price_aud_merchant) :- consistent(s_merchant, price_aud_merchant).
evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v1049_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr sku
% @type categorical
% @canonical false
% @original_name SKU
% @values sku_308901015lrg149=308901015LRG149 unk_sku=Unknown
% @importance 0.85

0.95::true_val(sku, sku_308901015lrg149); 0.05::true_val(sku, unk_sku).
0.97::acc(s_merchant, sku).
measured(s_merchant, sku, sku_308901015lrg149).
all_consistent(sku) :- consistent(s_merchant, sku).
evidence(all_consistent(sku)).
query(true_val(sku, sku_308901015lrg149)).
query(true_val(sku, unk_sku)).

% @attr terrain_suitability_park
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability (park)
% @values v6=6.0 unk_ts_park=Unknown
% @importance 0.85

0.90::true_val(terrain_suitability_park, v6); 0.10::true_val(terrain_suitability_park, unk_ts_park).
0.90::acc(s_merchant, terrain_suitability_park).
measured(s_merchant, terrain_suitability_park, v6).
all_consistent(terrain_suitability_park) :- consistent(s_merchant, terrain_suitability_park).
evidence(all_consistent(terrain_suitability_park)).
query(true_val(terrain_suitability_park, v6)).
query(true_val(terrain_suitability_park, unk_ts_park)).

% @attr terrain_suitability
% @type numeric
% @unit /10
% @canonical true
% @original_name terrain_suitability (all-mountain)
% @values v10=10.0 unk_terrain_suitability=Unknown
% @importance 0.85

0.90::true_val(terrain_suitability, v10); 0.10::true_val(terrain_suitability, unk_terrain_suitability).
0.90::acc(s_merchant, terrain_suitability).
measured(s_merchant, terrain_suitability, v10).
all_consistent(terrain_suitability) :- consistent(s_merchant, terrain_suitability).
evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, v10)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr terrain_suitability_powder
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability (powder)
% @values v6=6.0 unk_ts_powder=Unknown
% @importance 0.85

0.90::true_val(terrain_suitability_powder, v6); 0.10::true_val(terrain_suitability_powder, unk_ts_powder).
0.90::acc(s_merchant, terrain_suitability_powder).
measured(s_merchant, terrain_suitability_powder, v6).
all_consistent(terrain_suitability_powder) :- consistent(s_merchant, terrain_suitability_powder).
evidence(all_consistent(terrain_suitability_powder)).
query(true_val(terrain_suitability_powder, v6)).
query(true_val(terrain_suitability_powder, unk_ts_powder)).

% @attr flex_rating_10_manufacturer
% @type numeric
% @unit /10
% @canonical false
% @original_name flex_rating_10_manufacturer
% @values v5_5=5.5 unk_flex_mfr=Unknown
% @importance 0.85

0.92::true_val(flex_rating_10_manufacturer, v5_5); 0.08::true_val(flex_rating_10_manufacturer, unk_flex_mfr).
0.93::acc(s_merchant, flex_rating_10_manufacturer).
measured(s_merchant, flex_rating_10_manufacturer, v5_5).
all_consistent(flex_rating_10_manufacturer) :- consistent(s_merchant, flex_rating_10_manufacturer).
evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, v5_5)).
query(true_val(flex_rating_10_manufacturer, unk_flex_mfr)).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v6_5=6.5 v6=6.0
% @importance 0.875

0.35::true_val(flex_rating_10, v6_5); 0.65::true_val(flex_rating_10, v6).
0.88::acc(s15, flex_rating_10).
0.82::acc(s65, flex_rating_10).
0.80::acc(s98, flex_rating_10).
measured(s15, flex_rating_10, v6_5).
measured(s65, flex_rating_10, v6).
measured(s98, flex_rating_10, v6).
all_consistent(flex_rating_10) :- consistent(s15, flex_rating_10), consistent(s65, flex_rating_10), (indep(s98), consistent(s98, flex_rating_10) ; \+indep(s98)).
evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v6_5)).
query(true_val(flex_rating_10, v6)).

% @attr flex_rating_10_evo
% @type categorical
% @canonical false
% @original_name flex_rating_10_evo
% @values medium=Medium unk_flex_evo=Unknown
% @importance 0.65

0.82::true_val(flex_rating_10_evo, medium); 0.18::true_val(flex_rating_10_evo, unk_flex_evo).
0.80::acc(s50, flex_rating_10_evo).
measured(s50, flex_rating_10_evo, medium).
all_consistent(flex_rating_10_evo) :- consistent(s50, flex_rating_10_evo).
evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, medium)).
query(true_val(flex_rating_10_evo, unk_flex_evo)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate=Intermediate unk_rider_level=Unknown
% @importance 0.85

0.90::true_val(rider_level, intermediate); 0.10::true_val(rider_level, unk_rider_level).
0.88::acc(s_merchant, rider_level).
measured(s_merchant, rider_level, intermediate).
all_consistent(rider_level) :- consistent(s_merchant, rider_level).
evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate)).
query(true_val(rider_level, unk_rider_level)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values intermediate_to_expert=Intermediate_to_Expert unk_skill_level=Unknown
% @importance 0.825

0.88::true_val(skill_level_recommendation, intermediate_to_expert); 0.12::true_val(skill_level_recommendation, unk_skill_level).
0.80::acc(s44, skill_level_recommendation).
0.88::acc(s15, skill_level_recommendation).
measured(s44, skill_level_recommendation, intermediate_to_expert).
measured(s15, skill_level_recommendation, intermediate_to_expert).
all_consistent(skill_level_recommendation) :- consistent(s44, skill_level_recommendation), consistent(s15, skill_level_recommendation).
evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, intermediate_to_expert)).
query(true_val(skill_level_recommendation, unk_skill_level)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values directional_twin=Directional_Twin unk_shape=Unknown
% @importance 0.825

0.95::true_val(shape, directional_twin); 0.05::true_val(shape, unk_shape).
0.90::acc(s_merchant, shape).
0.88::acc(s6, shape).
measured(s_merchant, shape, directional_twin).
measured(s6, shape, directional_twin).
all_consistent(shape) :- (indep(s_merchant), consistent(s_merchant, shape) ; \+indep(s_merchant)), (indep(s6), consistent(s6, shape) ; \+indep(s6)).
evidence(all_consistent(shape)).
query(true_val(shape, directional_twin)).
query(true_val(shape, unk_shape)).

% @attr shape_description
% @type categorical
% @canonical false
% @original_name Shape description
% @values longer_nose_pop_tail=Slightly_longer_nose_than_tail_concentrating_pop_in_tail unk_shape_desc=Unknown
% @importance 0.80

0.90::true_val(shape_description, longer_nose_pop_tail); 0.10::true_val(shape_description, unk_shape_desc).
0.88::acc(s6, shape_description).
measured(s6, shape_description, longer_nose_pop_tail).
all_consistent(shape_description) :- consistent(s6, shape_description).
evidence(all_consistent(shape_description)).
query(true_val(shape_description, longer_nose_pop_tail)).
query(true_val(shape_description, unk_shape_desc)).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values twin_flex=Twin_Flex_symmetrical unk_flex_direction=Unknown
% @importance 0.90

0.95::true_val(flex_direction, twin_flex); 0.05::true_val(flex_direction, unk_flex_direction).
0.90::acc(s_merchant, flex_direction).
0.88::acc(s1, flex_direction).
measured(s_merchant, flex_direction, twin_flex).
measured(s1, flex_direction, twin_flex).
all_consistent(flex_direction) :- (indep(s_merchant), consistent(s_merchant, flex_direction) ; \+indep(s_merchant)), (indep(s1), consistent(s1, flex_direction) ; \+indep(s1)).
evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, twin_flex)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values traditional_camber=Traditional_full_camber unk_camber_type=Unknown
% @importance 0.90

0.97::true_val(camber_type, traditional_camber); 0.03::true_val(camber_type, unk_camber_type).
0.93::acc(s_merchant, camber_type).
0.90::acc(s1, camber_type).
measured(s_merchant, camber_type, traditional_camber).
measured(s1, camber_type, traditional_camber).
all_consistent(camber_type) :- (indep(s_merchant), consistent(s_merchant, camber_type) ; \+indep(s_merchant)), (indep(s1), consistent(s1, camber_type) ; \+indep(s1)).
evidence(all_consistent(camber_type)).
query(true_val(camber_type, traditional_camber)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_height_mm
% @type numeric
% @unit mm
% @canonical true
% @original_name camber_height_mm
% @values v11=11.0 unk_camber_height=Unknown
% @importance 0.90

0.78::true_val(camber_height_mm, v11); 0.22::true_val(camber_height_mm, unk_camber_height).
0.92::acc(s15, camber_height_mm).
measured(s15, camber_height_mm, v11).
all_consistent(camber_height_mm) :- consistent(s15, camber_height_mm).
evidence(all_consistent(camber_height_mm)).
query(true_val(camber_height_mm, v11)).
query(true_val(camber_height_mm, unk_camber_height)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 0.85

0.90::true_val(width_options, standard_and_wide); 0.10::true_val(width_options, unk_width_options).
0.90::acc(s_merchant, width_options).
measured(s_merchant, width_options, standard_and_wide).
all_consistent(width_options) :- consistent(s_merchant, width_options).
evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values the_channel=The_Channel unk_mounting_pattern=Unknown
% @importance 0.90

0.97::true_val(mounting_pattern, the_channel); 0.03::true_val(mounting_pattern, unk_mounting_pattern).
0.93::acc(s_merchant, mounting_pattern).
0.90::acc(s1, mounting_pattern).
measured(s_merchant, mounting_pattern, the_channel).
measured(s1, mounting_pattern, the_channel).
all_consistent(mounting_pattern) :- (indep(s_merchant), consistent(s_merchant, mounting_pattern) ; \+indep(s_merchant)), (indep(s1), consistent(s1, mounting_pattern) ; \+indep(s1)).
evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, the_channel)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values all_major_brands=Compatible_with_all_major_binding_brands unk_binding_compat=Unknown
% @importance 0.875

0.93::true_val(binding_compatibility, all_major_brands); 0.07::true_val(binding_compatibility, unk_binding_compat).
0.90::acc(s1, binding_compatibility).
0.85::acc(s6, binding_compatibility).
measured(s1, binding_compatibility, all_major_brands).
measured(s6, binding_compatibility, all_major_brands).
all_consistent(binding_compatibility) :- (indep(s1), consistent(s1, binding_compatibility) ; \+indep(s1)), (indep(s6), consistent(s6, binding_compatibility) ; \+indep(s6)).
evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, all_major_brands)).
query(true_val(binding_compatibility, unk_binding_compat)).

% @attr binding_compatibility_est
% @type categorical
% @canonical false
% @original_name binding_compatibility (EST)
% @values est_channel_only=EST_bindings_only_compatible_with_Channel unk_binding_est=Unknown
% @importance 0.60

0.82::true_val(binding_compatibility_est, est_channel_only); 0.18::true_val(binding_compatibility_est, unk_binding_est).
0.82::acc(s9, binding_compatibility_est).
measured(s9, binding_compatibility_est, est_channel_only).
all_consistent(binding_compatibility_est) :- consistent(s9, binding_compatibility_est).
evidence(all_consistent(binding_compatibility_est)).
query(true_val(binding_compatibility_est, est_channel_only)).
query(true_val(binding_compatibility_est, unk_binding_est)).

% @attr limited_edition
% @type categorical
% @canonical false
% @original_name Limited edition
% @values yes_limited=Yes unk_limited_edition=Unknown
% @importance 0.85

0.92::true_val(limited_edition, yes_limited); 0.08::true_val(limited_edition, unk_limited_edition).
0.92::acc(s_merchant, limited_edition).
measured(s_merchant, limited_edition, yes_limited).
all_consistent(limited_edition) :- consistent(s_merchant, limited_edition).
evidence(all_consistent(limited_edition)).
query(true_val(limited_edition, yes_limited)).
query(true_val(limited_edition, unk_limited_edition)).

% @attr topsheet_appearance_description
% @type categorical
% @canonical true
% @original_name topsheet_appearance_description
% @values classic_1996_graphics=Classic_1996_line_graphics_vary_by_length unk_topsheet=Unknown
% @importance 0.775

0.95::true_val(topsheet_appearance_description, classic_1996_graphics); 0.05::true_val(topsheet_appearance_description, unk_topsheet).
0.90::acc(s_merchant, topsheet_appearance_description).
0.90::acc(s1, topsheet_appearance_description).
0.82::acc(s9, topsheet_appearance_description).
measured(s_merchant, topsheet_appearance_description, classic_1996_graphics).
measured(s1, topsheet_appearance_description, classic_1996_graphics).
measured(s9, topsheet_appearance_description, classic_1996_graphics).
all_consistent(topsheet_appearance_description) :- (indep(s_merchant), consistent(s_merchant, topsheet_appearance_description) ; \+indep(s_merchant)), (indep(s1), consistent(s1, topsheet_appearance_description) ; \+indep(s1)), (indep(s9), consistent(s9, topsheet_appearance_description) ; \+indep(s9)).
evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, classic_1996_graphics)).
query(true_val(topsheet_appearance_description, unk_topsheet)).

% @attr topsheet_appearance_description_size_variant
% @type categorical
% @canonical false
% @original_name topsheet_appearance_description (size variant)
% @values size_dependent=Size_dependent_cannot_be_swapped unk_topsheet_sv=Unknown
% @importance 0.85

0.90::true_val(topsheet_appearance_description_size_variant, size_dependent); 0.10::true_val(topsheet_appearance_description_size_variant, unk_topsheet_sv).
0.90::acc(s_merchant, topsheet_appearance_description_size_variant).
measured(s_merchant, topsheet_appearance_description_size_variant, size_dependent).
all_consistent(topsheet_appearance_description_size_variant) :- consistent(s_merchant, topsheet_appearance_description_size_variant).
evidence(all_consistent(topsheet_appearance_description_size_variant)).
query(true_val(topsheet_appearance_description_size_variant, size_dependent)).
query(true_val(topsheet_appearance_description_size_variant, unk_topsheet_sv)).

% @attr available_sizes_au
% @type categorical
% @canonical false
% @original_name available_sizes (AU)
% @values au_144_149_155_159=144_149_155_159cm unk_avail_sizes_au=Unknown
% @importance 0.85

0.90::true_val(available_sizes_au, au_144_149_155_159); 0.10::true_val(available_sizes_au, unk_avail_sizes_au).
0.92::acc(s_merchant, available_sizes_au).
measured(s_merchant, available_sizes_au, au_144_149_155_159).
all_consistent(available_sizes_au) :- consistent(s_merchant, available_sizes_au).
evidence(all_consistent(available_sizes_au)).
query(true_val(available_sizes_au, au_144_149_155_159)).
query(true_val(available_sizes_au, unk_avail_sizes_au)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values full_range=150_154_156_158_162_154W_158W_162W_166W_170W unk_available_sizes=Unknown
% @importance 0.85

0.90::true_val(available_sizes, full_range); 0.10::true_val(available_sizes, unk_available_sizes).
0.88::acc(s15, available_sizes).
0.80::acc(s16, available_sizes).
measured(s15, available_sizes, full_range).
measured(s16, available_sizes, full_range).
all_consistent(available_sizes) :- consistent(s15, available_sizes), consistent(s16, available_sizes).
evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, full_range)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr setback
% @type numeric
% @unit mm
% @canonical true
% @original_name setback
% @values v_neg12_5=-12.5 unk_setback=Unknown
% @importance 0.85

0.95::true_val(setback, v_neg12_5); 0.05::true_val(setback, unk_setback).
0.90::acc(s_merchant, setback).
0.85::acc(s65, setback).
measured(s_merchant, setback, v_neg12_5).
measured(s65, setback, v_neg12_5).
all_consistent(setback) :- (indep(s_merchant), consistent(s_merchant, setback) ; \+indep(s_merchant)), consistent(s65, setback).
evidence(all_consistent(setback)).
query(true_val(setback, v_neg12_5)).
query(true_val(setback, unk_setback)).

% @attr effective_edge_150
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 150cm
% @values v1135=1135.0 unk_ee150=Unknown
% @importance 0.85

0.90::true_val(effective_edge_150, v1135); 0.10::true_val(effective_edge_150, unk_ee150).
0.90::acc(s_merchant, effective_edge_150).
measured(s_merchant, effective_edge_150, v1135).
all_consistent(effective_edge_150) :- consistent(s_merchant, effective_edge_150).
evidence(all_consistent(effective_edge_150)).
query(true_val(effective_edge_150, v1135)).
query(true_val(effective_edge_150, unk_ee150)).

% @attr effective_edge_154
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 154cm
% @values v1175=1175.0 unk_ee154=Unknown
% @importance 0.85

0.90::true_val(effective_edge_154, v1175); 0.10::true_val(effective_edge_154, unk_ee154).
0.90::acc(s_merchant, effective_edge_154).
measured(s_merchant, effective_edge_154, v1175).
all_consistent(effective_edge_154) :- consistent(s_merchant, effective_edge_154).
evidence(all_consistent(effective_edge_154)).
query(true_val(effective_edge_154, v1175)).
query(true_val(effective_edge_154, unk_ee154)).

% @attr effective_edge_156
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 156cm
% @values v1195=1195.0 unk_ee156=Unknown
% @importance 0.85

0.90::true_val(effective_edge_156, v1195); 0.10::true_val(effective_edge_156, unk_ee156).
0.90::acc(s_merchant, effective_edge_156).
measured(s_merchant, effective_edge_156, v1195).
all_consistent(effective_edge_156) :- consistent(s_merchant, effective_edge_156).
evidence(all_consistent(effective_edge_156)).
query(true_val(effective_edge_156, v1195)).
query(true_val(effective_edge_156, unk_ee156)).

% @attr effective_edge_158
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 158cm
% @values v1215=1215.0 unk_ee158=Unknown
% @importance 0.85

0.90::true_val(effective_edge_158, v1215); 0.10::true_val(effective_edge_158, unk_ee158).
0.90::acc(s_merchant, effective_edge_158).
measured(s_merchant, effective_edge_158, v1215).
all_consistent(effective_edge_158) :- consistent(s_merchant, effective_edge_158).
evidence(all_consistent(effective_edge_158)).
query(true_val(effective_edge_158, v1215)).
query(true_val(effective_edge_158, unk_ee158)).

% @attr effective_edge_162
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 162cm
% @values v1255=1255.0 unk_ee162=Unknown
% @importance 0.85

0.90::true_val(effective_edge_162, v1255); 0.10::true_val(effective_edge_162, unk_ee162).
0.90::acc(s_merchant, effective_edge_162).
measured(s_merchant, effective_edge_162, v1255).
all_consistent(effective_edge_162) :- consistent(s_merchant, effective_edge_162).
evidence(all_consistent(effective_edge_162)).
query(true_val(effective_edge_162, v1255)).
query(true_val(effective_edge_162, unk_ee162)).

% @attr sidecut_radius_size_150
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (150cm)
% @values v7_4=7.4 unk_scr150=Unknown
% @importance 0.85

0.90::true_val(sidecut_radius_size_150, v7_4); 0.10::true_val(sidecut_radius_size_150, unk_scr150).
0.90::acc(s_merchant, sidecut_radius_size_150).
measured(s_merchant, sidecut_radius_size_150, v7_4).
all_consistent(sidecut_radius_size_150) :- consistent(s_merchant, sidecut_radius_size_150).
evidence(all_consistent(sidecut_radius_size_150)).
query(true_val(sidecut_radius_size_150, v7_4)).
query(true_val(sidecut_radius_size_150, unk_scr150)).

% @attr sidecut_radius_size_154
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (154cm)
% @values v7_6=7.6 unk_scr154=Unknown
% @importance 0.85

0.90::true_val(sidecut_radius_size_154, v7_6); 0.10::true_val(sidecut_radius_size_154, unk_scr154).
0.90::acc(s_merchant, sidecut_radius_size_154).
measured(s_merchant, sidecut_radius_size_154, v7_6).
all_consistent(sidecut_radius_size_154) :- consistent(s_merchant, sidecut_radius_size_154).
evidence(all_consistent(sidecut_radius_size_154)).
query(true_val(sidecut_radius_size_154, v7_6)).
query(true_val(sidecut_radius_size_154, unk_scr154)).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size (156cm)
% @values v7_8=7.8 unk_sidecut_radius_size=Unknown
% @importance 0.85

0.90::true_val(sidecut_radius_size, v7_8); 0.10::true_val(sidecut_radius_size, unk_sidecut_radius_size).
0.90::acc(s_merchant, sidecut_radius_size).
measured(s_merchant, sidecut_radius_size, v7_8).
all_consistent(sidecut_radius_size) :- consistent(s_merchant, sidecut_radius_size).
evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_8)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr sidecut_radius_size_158
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (158cm)
% @values v7_9=7.9 unk_scr158=Unknown
% @importance 0.85

0.90::true_val(sidecut_radius_size_158, v7_9); 0.10::true_val(sidecut_radius_size_158, unk_scr158).
0.90::acc(s_merchant, sidecut_radius_size_158).
measured(s_merchant, sidecut_radius_size_158, v7_9).
all_consistent(sidecut_radius_size_158) :- consistent(s_merchant, sidecut_radius_size_158).
evidence(all_consistent(sidecut_radius_size_158)).
query(true_val(sidecut_radius_size_158, v7_9)).
query(true_val(sidecut_radius_size_158, unk_scr158)).

% @attr sidecut_radius_size_162
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (162cm)
% @values v8_2=8.2 unk_scr162=Unknown
% @importance 0.85

0.90::true_val(sidecut_radius_size_162, v8_2); 0.10::true_val(sidecut_radius_size_162, unk_scr162).
0.90::acc(s_merchant, sidecut_radius_size_162).
measured(s_merchant, sidecut_radius_size_162, v8_2).
all_consistent(sidecut_radius_size_162) :- consistent(s_merchant, sidecut_radius_size_162).
evidence(all_consistent(sidecut_radius_size_162)).
query(true_val(sidecut_radius_size_162, v8_2)).
query(true_val(sidecut_radius_size_162, unk_scr162)).

% @attr waist_width_150
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 150cm
% @values v248=248.0 unk_ww150=Unknown
% @importance 0.875

0.95::true_val(waist_width_150, v248); 0.05::true_val(waist_width_150, unk_ww150).
0.90::acc(s_merchant, waist_width_150).
0.90::acc(s15, waist_width_150).
measured(s_merchant, waist_width_150, v248).
measured(s15, waist_width_150, v248).
all_consistent(waist_width_150) :- (indep(s_merchant), consistent(s_merchant, waist_width_150) ; \+indep(s_merchant)), consistent(s15, waist_width_150).
evidence(all_consistent(waist_width_150)).
query(true_val(waist_width_150, v248)).
query(true_val(waist_width_150, unk_ww150)).

% @attr waist_width_154
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 154cm
% @values v250=250.0 unk_ww154=Unknown
% @importance 0.85

0.90::true_val(waist_width_154, v250); 0.10::true_val(waist_width_154, unk_ww154).
0.90::acc(s_merchant, waist_width_154).
measured(s_merchant, waist_width_154, v250).
all_consistent(waist_width_154) :- consistent(s_merchant, waist_width_154).
evidence(all_consistent(waist_width_154)).
query(true_val(waist_width_154, v250)).
query(true_val(waist_width_154, unk_ww154)).

% @attr waist_width_156
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 156cm
% @values v252=252.0 unk_ww156=Unknown
% @importance 0.875

0.95::true_val(waist_width_156, v252); 0.05::true_val(waist_width_156, unk_ww156).
0.90::acc(s_merchant, waist_width_156).
0.90::acc(s15, waist_width_156).
measured(s_merchant, waist_width_156, v252).
measured(s15, waist_width_156, v252).
all_consistent(waist_width_156) :- (indep(s_merchant), consistent(s_merchant, waist_width_156) ; \+indep(s_merchant)), consistent(s15, waist_width_156).
evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v252)).
query(true_val(waist_width_156, unk_ww156)).

% @attr waist_width_158
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 158cm
% @values v254=254.0 unk_ww158=Unknown
% @importance 0.85

0.90::true_val(waist_width_158, v254); 0.10::true_val(waist_width_158, unk_ww158).
0.90::acc(s_merchant, waist_width_158).
measured(s_merchant, waist_width_158, v254).
all_consistent(waist_width_158) :- consistent(s_merchant, waist_width_158).
evidence(all_consistent(waist_width_158)).
query(true_val(waist_width_158, v254)).
query(true_val(waist_width_158, unk_ww158)).

% @attr waist_width_162
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 162cm
% @values v256=256.0 unk_ww162=Unknown
% @importance 0.85

0.90::true_val(waist_width_162, v256); 0.10::true_val(waist_width_162, unk_ww162).
0.90::acc(s_merchant, waist_width_162).
measured(s_merchant, waist_width_162, v256).
all_consistent(waist_width_162) :- consistent(s_merchant, waist_width_162).
evidence(all_consistent(waist_width_162)).
query(true_val(waist_width_162, v256)).
query(true_val(waist_width_162, unk_ww162)).

% @attr waist_width_154w
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 154W
% @values v258=258.0 unk_ww154w=Unknown
% @importance 0.85

0.90::true_val(waist_width_154w, v258); 0.10::true_val(waist_width_154w, unk_ww154w).
0.90::acc(s_merchant, waist_width_154w).
measured(s_merchant, waist_width_154w, v258).
all_consistent(waist_width_154w) :- consistent(s_merchant, waist_width_154w).
evidence(all_consistent(waist_width_154w)).
query(true_val(waist_width_154w, v258)).
query(true_val(waist_width_154w, unk_ww154w)).

% @attr waist_width_158w
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 158W
% @values v262=262.0 unk_ww158w=Unknown
% @importance 0.85

0.90::true_val(waist_width_158w, v262); 0.10::true_val(waist_width_158w, unk_ww158w).
0.90::acc(s_merchant, waist_width_158w).
measured(s_merchant, waist_width_158w, v262).
all_consistent(waist_width_158w) :- consistent(s_merchant, waist_width_158w).
evidence(all_consistent(waist_width_158w)).
query(true_val(waist_width_158w, v262)).
query(true_val(waist_width_158w, unk_ww158w)).

% @attr waist_width_162w
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 162W
% @values v264=264.0 unk_ww162w=Unknown
% @importance 0.85

0.90::true_val(waist_width_162w, v264); 0.10::true_val(waist_width_162w, unk_ww162w).
0.90::acc(s_merchant, waist_width_162w).
measured(s_merchant, waist_width_162w, v264).
all_consistent(waist_width_162w) :- consistent(s_merchant, waist_width_162w).
evidence(all_consistent(waist_width_162w)).
query(true_val(waist_width_162w, v264)).
query(true_val(waist_width_162w, unk_ww162w)).

% @attr waist_width_166w
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 166W
% @values v266=266.0 unk_ww166w=Unknown
% @importance 0.85

0.90::true_val(waist_width_166w, v266); 0.10::true_val(waist_width_166w, unk_ww166w).
0.90::acc(s_merchant, waist_width_166w).
measured(s_merchant, waist_width_166w, v266).
all_consistent(waist_width_166w) :- consistent(s_merchant, waist_width_166w).
evidence(all_consistent(waist_width_166w)).
query(true_val(waist_width_166w, v266)).
query(true_val(waist_width_166w, unk_ww166w)).

% @attr waist_width_170w
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 170W
% @values v270=270.0 unk_ww170w=Unknown
% @importance 0.85

0.90::true_val(waist_width_170w, v270); 0.10::true_val(waist_width_170w, unk_ww170w).
0.90::acc(s_merchant, waist_width_170w).
measured(s_merchant, waist_width_170w, v270).
all_consistent(waist_width_170w) :- consistent(s_merchant, waist_width_170w).
evidence(all_consistent(waist_width_170w)).
query(true_val(waist_width_170w, v270)).
query(true_val(waist_width_170w, unk_ww170w)).

% @attr tip_tail_width_size
% @type numeric
% @unit mm
% @canonical true
% @original_name tip_tail_width_size
% @values v294=294.0 unk_tip_tail_width=Unknown
% @importance 0.85

0.90::true_val(tip_tail_width_size, v294); 0.10::true_val(tip_tail_width_size, unk_tip_tail_width).
0.90::acc(s_merchant, tip_tail_width_size).
measured(s_merchant, tip_tail_width_size, v294).
all_consistent(tip_tail_width_size) :- consistent(s_merchant, tip_tail_width_size).
evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v294)).
query(true_val(tip_tail_width_size, unk_tip_tail_width)).

% @attr stance_width_range_size
% @type numeric
% @unit mm
% @canonical true
% @original_name stance_width_range_size
% @values v530=530.0 unk_stance_width=Unknown
% @importance 0.875

0.95::true_val(stance_width_range_size, v530); 0.05::true_val(stance_width_range_size, unk_stance_width).
0.90::acc(s_merchant, stance_width_range_size).
0.90::acc(s15, stance_width_range_size).
measured(s_merchant, stance_width_range_size, v530).
measured(s15, stance_width_range_size, v530).
all_consistent(stance_width_range_size) :- (indep(s_merchant), consistent(s_merchant, stance_width_range_size) ; \+indep(s_merchant)), consistent(s15, stance_width_range_size).
evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v530)).
query(true_val(stance_width_range_size, unk_stance_width)).

% @attr recommended_weight_range_size_150
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (small)
% @values w54_82kg=54_82kg_120_180lbs unk_rwr150=Unknown
% @importance 0.875

0.93::true_val(recommended_weight_range_size_150, w54_82kg); 0.07::true_val(recommended_weight_range_size_150, unk_rwr150).
0.90::acc(s_merchant, recommended_weight_range_size_150).
0.88::acc(s15, recommended_weight_range_size_150).
measured(s_merchant, recommended_weight_range_size_150, w54_82kg).
measured(s15, recommended_weight_range_size_150, w54_82kg).
all_consistent(recommended_weight_range_size_150) :- (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size_150) ; \+indep(s_merchant)), consistent(s15, recommended_weight_range_size_150).
evidence(all_consistent(recommended_weight_range_size_150)).
query(true_val(recommended_weight_range_size_150, w54_82kg)).
query(true_val(recommended_weight_range_size_150, unk_rwr150)).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size (156cm)
% @values w68_91kg=68_91kg_150_200lbs unk_rwr=Unknown
% @importance 0.875

0.93::true_val(recommended_weight_range_size, w68_91kg); 0.07::true_val(recommended_weight_range_size, unk_rwr).
0.90::acc(s_merchant, recommended_weight_range_size).
0.88::acc(s15, recommended_weight_range_size).
measured(s_merchant, recommended_weight_range_size, w68_91kg).
measured(s15, recommended_weight_range_size, w68_91kg).
all_consistent(recommended_weight_range_size) :- (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size) ; \+indep(s_merchant)), consistent(s15, recommended_weight_range_size).
evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w68_91kg)).
query(true_val(recommended_weight_range_size, unk_rwr)).

% @attr recommended_weight_range_size_162
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (large)
% @values w82_118kg=82_118plus_kg_180_260plus_lbs unk_rwr162=Unknown
% @importance 0.875

0.93::true_val(recommended_weight_range_size_162, w82_118kg); 0.07::true_val(recommended_weight_range_size_162, unk_rwr162).
0.90::acc(s_merchant, recommended_weight_range_size_162).
0.88::acc(s15, recommended_weight_range_size_162).
measured(s_merchant, recommended_weight_range_size_162, w82_118kg).
measured(s15, recommended_weight_range_size_162, w82_118kg).
all_consistent(recommended_weight_range_size_162) :- (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size_162) ; \+indep(s_merchant)), consistent(s15, recommended_weight_range_size_162).
evidence(all_consistent(recommended_weight_range_size_162)).
query(true_val(recommended_weight_range_size_162, w82_118kg)).
query(true_val(recommended_weight_range_size_162, unk_rwr162)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values carbon_highlights_45=45_degree_Carbon_Highlights_tip_to_tail unk_laminate=Unknown
% @importance 0.90

0.95::true_val(laminate, carbon_highlights_45); 0.05::true_val(laminate, unk_laminate).
0.88::acc(s_merchant, laminate).
0.88::acc(s31, laminate).
measured(s_merchant, laminate, carbon_highlights_45).
measured(s31, laminate, carbon_highlights_45).
all_consistent(laminate) :- (indep(s_merchant), consistent(s_merchant, laminate) ; \+indep(s_merchant)), (indep(s31), consistent(s31, laminate) ; \+indep(s31)).
evidence(all_consistent(laminate)).
query(true_val(laminate, carbon_highlights_45)).
query(true_val(laminate, unk_laminate)).

% @attr construction_material_innovation_carbon_angle
% @type categorical
% @canonical false
% @original_name construction_material_innovation (carbon angle)
% @values angle_45_aggressive=45_degree_fiber_angle_more_aggressive_ride unk_cmi_ca=Unknown
% @importance 0.85

0.88::true_val(construction_material_innovation_carbon_angle, angle_45_aggressive); 0.12::true_val(construction_material_innovation_carbon_angle, unk_cmi_ca).
0.88::acc(s31, construction_material_innovation_carbon_angle).
measured(s31, construction_material_innovation_carbon_angle, angle_45_aggressive).
all_consistent(construction_material_innovation_carbon_angle) :- consistent(s31, construction_material_innovation_carbon_angle).
evidence(all_consistent(construction_material_innovation_carbon_angle)).
query(true_val(construction_material_innovation_carbon_angle, angle_45_aggressive)).
query(true_val(construction_material_innovation_carbon_angle, unk_cmi_ca)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values super_fly_ii_700g=Super_Fly_II_700G_Core unk_core_material=Unknown
% @importance 0.90

0.95::true_val(core_material, super_fly_ii_700g); 0.05::true_val(core_material, unk_core_material).
0.90::acc(s_merchant, core_material).
0.88::acc(s1, core_material).
measured(s_merchant, core_material, super_fly_ii_700g).
measured(s1, core_material, super_fly_ii_700g).
all_consistent(core_material) :- (indep(s_merchant), consistent(s_merchant, core_material) ; \+indep(s_merchant)), (indep(s1), consistent(s1, core_material) ; \+indep(s1)).
evidence(all_consistent(core_material)).
query(true_val(core_material, super_fly_ii_700g)).
query(true_val(core_material, unk_core_material)).

% @attr construction_material_innovation_edge_hold
% @type categorical
% @canonical false
% @original_name construction_material_innovation (edge hold)
% @values wood_grain_perpendicular=Wood_grain_perpendicular_along_edges unk_cmi_eh=Unknown
% @importance 0.90

0.93::true_val(construction_material_innovation_edge_hold, wood_grain_perpendicular); 0.07::true_val(construction_material_innovation_edge_hold, unk_cmi_eh).
0.88::acc(s_merchant, construction_material_innovation_edge_hold).
0.88::acc(s1, construction_material_innovation_edge_hold).
measured(s_merchant, construction_material_innovation_edge_hold, wood_grain_perpendicular).
measured(s1, construction_material_innovation_edge_hold, wood_grain_perpendicular).
all_consistent(construction_material_innovation_edge_hold) :- (indep(s_merchant), consistent(s_merchant, construction_material_innovation_edge_hold) ; \+indep(s_merchant)), (indep(s1), consistent(s1, construction_material_innovation_edge_hold) ; \+indep(s1)).
evidence(all_consistent(construction_material_innovation_edge_hold)).
query(true_val(construction_material_innovation_edge_hold, wood_grain_perpendicular)).
query(true_val(construction_material_innovation_edge_hold, unk_cmi_eh)).

% @attr construction_material_innovation_core_profiling
% @type categorical
% @canonical false
% @original_name construction_material_innovation (core profiling)
% @values thick_thin_sections=Thicker_powerful_thinner_flexible_sections unk_cmi_cp=Unknown
% @importance 0.90

0.93::true_val(construction_material_innovation_core_profiling, thick_thin_sections); 0.07::true_val(construction_material_innovation_core_profiling, unk_cmi_cp).
0.88::acc(s_merchant, construction_material_innovation_core_profiling).
0.88::acc(s1, construction_material_innovation_core_profiling).
measured(s_merchant, construction_material_innovation_core_profiling, thick_thin_sections).
measured(s1, construction_material_innovation_core_profiling, thick_thin_sections).
all_consistent(construction_material_innovation_core_profiling) :- (indep(s_merchant), consistent(s_merchant, construction_material_innovation_core_profiling) ; \+indep(s_merchant)), (indep(s1), consistent(s1, construction_material_innovation_core_profiling) ; \+indep(s1)).
evidence(all_consistent(construction_material_innovation_core_profiling)).
query(true_val(construction_material_innovation_core_profiling, thick_thin_sections)).
query(true_val(construction_material_innovation_core_profiling, unk_cmi_cp)).

% @attr core_material_wood_composition
% @type categorical
% @canonical false
% @original_name core_material (wood composition)
% @values fsc_hard_soft_alternating=FSC_certified_alternating_hard_soft_woods unk_cm_wood=Unknown
% @importance 0.55

0.88::true_val(core_material_wood_composition, fsc_hard_soft_alternating); 0.12::true_val(core_material_wood_composition, unk_cm_wood).
0.80::acc(s94, core_material_wood_composition).
0.92::acc(s93, core_material_wood_composition).
measured(s94, core_material_wood_composition, fsc_hard_soft_alternating).
measured(s93, core_material_wood_composition, fsc_hard_soft_alternating).
all_consistent(core_material_wood_composition) :- (indep(s94), consistent(s94, core_material_wood_composition) ; \+indep(s94)), consistent(s93, core_material_wood_composition).
evidence(all_consistent(core_material_wood_composition)).
query(true_val(core_material_wood_composition, fsc_hard_soft_alternating)).
query(true_val(core_material_wood_composition, unk_cm_wood)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values frostbite_edges=Frostbite_Edges_enhanced_edge_hold unk_edge_technology=Unknown
% @importance 0.85

0.95::true_val(edge_technology, frostbite_edges); 0.05::true_val(edge_technology, unk_edge_technology).
0.90::acc(s_merchant, edge_technology).
0.88::acc(s11, edge_technology).
measured(s_merchant, edge_technology, frostbite_edges).
measured(s11, edge_technology, frostbite_edges).
all_consistent(edge_technology) :- (indep(s_merchant), consistent(s_merchant, edge_technology) ; \+indep(s_merchant)), (indep(s11), consistent(s11, edge_technology) ; \+indep(s11)).
evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, frostbite_edges)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_wfo=Sintered_WFO_extra_absorbent_high_density unk_base_material=Unknown
% @importance 0.85

0.95::true_val(base_material, sintered_wfo); 0.05::true_val(base_material, unk_base_material).
0.90::acc(s_merchant, base_material).
0.88::acc(s11, base_material).
measured(s_merchant, base_material, sintered_wfo).
measured(s11, base_material, sintered_wfo).
all_consistent(base_material) :- (indep(s_merchant), consistent(s_merchant, base_material) ; \+indep(s_merchant)), (indep(s11), consistent(s11, base_material) ; \+indep(s11)).
evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_wfo)).
query(true_val(base_material, unk_base_material)).

% @attr resin
% @type categorical
% @canonical true
% @original_name resin
% @values super_sap_epoxy=Super_Sap_Epoxy_bio_based unk_resin=Unknown
% @importance 0.90

0.95::true_val(resin, super_sap_epoxy); 0.05::true_val(resin, unk_resin).
0.90::acc(s_merchant, resin).
0.88::acc(s1, resin).
measured(s_merchant, resin, super_sap_epoxy).
measured(s1, resin, super_sap_epoxy).
all_consistent(resin) :- (indep(s_merchant), consistent(s_merchant, resin) ; \+indep(s_merchant)), (indep(s1), consistent(s1, resin) ; \+indep(s1)).
evidence(all_consistent(resin)).
query(true_val(resin, super_sap_epoxy)).
query(true_val(resin, unk_resin)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation (Infinite Ride)
% @values infinite_ride=Overbuilt_factory_broken_in_consistent_flex unk_cmi=Unknown
% @importance 0.90

0.93::true_val(construction_material_innovation, infinite_ride); 0.07::true_val(construction_material_innovation, unk_cmi).
0.88::acc(s_merchant, construction_material_innovation).
0.88::acc(s1, construction_material_innovation).
measured(s_merchant, construction_material_innovation, infinite_ride).
measured(s1, construction_material_innovation, infinite_ride).
all_consistent(construction_material_innovation) :- (indep(s_merchant), consistent(s_merchant, construction_material_innovation) ; \+indep(s_merchant)), (indep(s1), consistent(s1, construction_material_innovation) ; \+indep(s1)).
evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, infinite_ride)).
query(true_val(construction_material_innovation, unk_cmi)).

% @attr construction_material_innovation_pro_tip
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Pro-Tip)
% @values pro_tip=Tip_tail_taper_reducing_swing_weight unk_cmi_pt=Unknown
% @importance 0.725

0.88::true_val(construction_material_innovation_pro_tip, pro_tip); 0.12::true_val(construction_material_innovation_pro_tip, unk_cmi_pt).
0.88::acc(s_merchant, construction_material_innovation_pro_tip).
0.82::acc(s5, construction_material_innovation_pro_tip).
measured(s_merchant, construction_material_innovation_pro_tip, pro_tip).
measured(s5, construction_material_innovation_pro_tip, pro_tip).
all_consistent(construction_material_innovation_pro_tip) :- (indep(s_merchant), consistent(s_merchant, construction_material_innovation_pro_tip) ; \+indep(s_merchant)), (indep(s5), consistent(s5, construction_material_innovation_pro_tip) ; \+indep(s5)).
evidence(all_consistent(construction_material_innovation_pro_tip)).
query(true_val(construction_material_innovation_pro_tip, pro_tip)).
query(true_val(construction_material_innovation_pro_tip, unk_cmi_pt)).

% @attr tip_style
% @type categorical
% @canonical false
% @original_name Tip style
% @values squared_off_since_2018=Squared_off_tips_since_2018 unk_tip_style=Unknown
% @importance 0.70

0.92::true_val(tip_style, squared_off_since_2018); 0.08::true_val(tip_style, unk_tip_style).
0.95::acc(s74, tip_style).
measured(s74, tip_style, squared_off_since_2018).
all_consistent(tip_style) :- consistent(s74, tip_style).
evidence(all_consistent(tip_style)).
query(true_val(tip_style, squared_off_since_2018)).
query(true_val(tip_style, unk_tip_style)).

% @attr terrain_suitability_categories
% @type categorical
% @canonical false
% @original_name terrain_suitability (categories)
% @values am_park_powder=All_Mountain_Park_Powder unk_ts_cat=Unknown
% @importance 0.85

0.90::true_val(terrain_suitability_categories, am_park_powder); 0.10::true_val(terrain_suitability_categories, unk_ts_cat).
0.90::acc(s_merchant, terrain_suitability_categories).
measured(s_merchant, terrain_suitability_categories, am_park_powder).
all_consistent(terrain_suitability_categories) :- consistent(s_merchant, terrain_suitability_categories).
evidence(all_consistent(terrain_suitability_categories)).
query(true_val(terrain_suitability_categories, am_park_powder)).
query(true_val(terrain_suitability_categories, unk_ts_cat)).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_evo
% @values v679_95=679.95 unk_price_usd_evo=Unknown
% @importance 0.85

0.97::true_val(price_usd_evo, v679_95); 0.03::true_val(price_usd_evo, unk_price_usd_evo).
0.95::acc(s82, price_usd_evo).
0.93::acc(s86, price_usd_evo).
0.88::acc(s84, price_usd_evo).
measured(s82, price_usd_evo, v679_95).
measured(s86, price_usd_evo, v679_95).
measured(s84, price_usd_evo, v679_95).
all_consistent(price_usd_evo) :- (indep(s82), consistent(s82, price_usd_evo) ; \+indep(s82)), (indep(s86), consistent(s86, price_usd_evo) ; \+indep(s86)), (indep(s84), consistent(s84, price_usd_evo) ; \+indep(s84)).
evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v679_95)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_msrp
% @values v669_95=669.95 v679_95=679.95
% @importance 0.825

0.35::true_val(price_usd_msrp, v669_95); 0.65::true_val(price_usd_msrp, v679_95_msrp).
0.78::acc(s106, price_usd_msrp).
0.90::acc(s82, price_usd_msrp).
measured(s106, price_usd_msrp, v669_95).
measured(s82, price_usd_msrp, v679_95_msrp).
all_consistent(price_usd_msrp) :- consistent(s106, price_usd_msrp), (indep(s82), consistent(s82, price_usd_msrp) ; \+indep(s82)).
evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v669_95)).
query(true_val(price_usd_msrp, v679_95_msrp)).

% @attr price_usd_evo_availability
% @type categorical
% @canonical false
% @original_name price_usd_evo (availability)
% @values sold_out_many_sizes=Listed_but_sold_out_many_sizes_679_95 unk_evo_avail=Unknown
% @importance 0.85

0.85::true_val(price_usd_evo_availability, sold_out_many_sizes); 0.15::true_val(price_usd_evo_availability, unk_evo_avail).
0.85::acc(s31, price_usd_evo_availability).
measured(s31, price_usd_evo_availability, sold_out_many_sizes).
all_consistent(price_usd_evo_availability) :- consistent(s31, price_usd_evo_availability).
evidence(all_consistent(price_usd_evo_availability)).
query(true_val(price_usd_evo_availability, sold_out_many_sizes)).
query(true_val(price_usd_evo_availability, unk_evo_avail)).

% @attr price_usd_evo_sale
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_evo (sale)
% @values v475_96=475.96 unk_evo_sale=Unknown
% @importance 0.90

0.90::true_val(price_usd_evo_sale, v475_96); 0.10::true_val(price_usd_evo_sale, unk_evo_sale).
0.92::acc(s82, price_usd_evo_sale).
measured(s82, price_usd_evo_sale, v475_96).
all_consistent(price_usd_evo_sale) :- consistent(s82, price_usd_evo_sale).
evidence(all_consistent(price_usd_evo_sale)).
query(true_val(price_usd_evo_sale, v475_96)).
query(true_val(price_usd_evo_sale, unk_evo_sale)).

% @attr price_cad_prfo
% @type numeric
% @unit CAD
% @canonical true
% @original_name price_cad_prfo
% @values v879_99=879.99 unk_price_cad=Unknown
% @importance 0.85

0.85::true_val(price_cad_prfo, v879_99); 0.15::true_val(price_cad_prfo, unk_price_cad).
0.82::acc(s62, price_cad_prfo).
measured(s62, price_cad_prfo, v879_99).
all_consistent(price_cad_prfo) :- consistent(s62, price_cad_prfo).
evidence(all_consistent(price_cad_prfo)).
query(true_val(price_cad_prfo, v879_99)).
query(true_val(price_cad_prfo, unk_price_cad)).

% @attr price_eur_blue_tomato
% @type categorical
% @canonical true
% @original_name price_eur_blue_tomato
% @values sale_359_95=359_95_EUR_sale rrp_879_95=879_95_EUR_regular
% @importance 0.85

0.50::true_val(price_eur_blue_tomato, sale_359_95); 0.50::true_val(price_eur_blue_tomato, rrp_879_95).
0.82::acc(s62, price_eur_blue_tomato).
measured(s62, price_eur_blue_tomato, sale_359_95).
all_consistent(price_eur_blue_tomato) :- consistent(s62, price_eur_blue_tomato).
evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, sale_359_95)).
query(true_val(price_eur_blue_tomato, rrp_879_95)).

% @attr availability_status_burton
% @type categorical
% @canonical false
% @original_name availability_status (Burton.com)
% @values available_some_sold_out=Available_some_sizes_sold_out unk_as_burton=Unknown
% @importance 0.70

0.88::true_val(availability_status_burton, available_some_sold_out); 0.12::true_val(availability_status_burton, unk_as_burton).
0.90::acc(s32, availability_status_burton).
measured(s32, availability_status_burton, available_some_sold_out).
all_consistent(availability_status_burton) :- consistent(s32, availability_status_burton).
evidence(all_consistent(availability_status_burton)).
query(true_val(availability_status_burton, available_some_sold_out)).
query(true_val(availability_status_burton, unk_as_burton)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status (evo.com)
% @values available_evo=Available_major_US_retailer unk_as_evo=Unknown
% @importance 0.775

0.88::true_val(availability_status_evo, available_evo); 0.12::true_val(availability_status_evo, unk_as_evo).
0.88::acc(s31, availability_status_evo).
measured(s31, availability_status_evo, available_evo).
all_consistent(availability_status_evo) :- consistent(s31, availability_status_evo).
evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, available_evo)).
query(true_val(availability_status_evo, unk_as_evo)).

% @attr availability_status_rei
% @type categorical
% @canonical false
% @original_name availability_status (REI)
% @values available_rei=Available_679_95_10pct_member_reward unk_as_rei=Unknown
% @importance 0.85

0.90::true_val(availability_status_rei, available_rei); 0.10::true_val(availability_status_rei, unk_as_rei).
0.92::acc(s86, availability_status_rei).
measured(s86, availability_status_rei, available_rei).
all_consistent(availability_status_rei) :- consistent(s86, availability_status_rei).
evidence(all_consistent(availability_status_rei)).
query(true_val(availability_status_rei, available_rei)).
query(true_val(availability_status_rei, unk_as_rei)).

% @attr availability_status_darkside
% @type categorical
% @canonical false
% @original_name availability_status (Darkside)
% @values available_darkside=Available_free_shipping_over_99 unk_as_darkside=Unknown
% @importance 0.675

0.82::true_val(availability_status_darkside, available_darkside); 0.18::true_val(availability_status_darkside, unk_as_darkside).
0.80::acc(s9, availability_status_darkside).
measured(s9, availability_status_darkside, available_darkside).
all_consistent(availability_status_darkside) :- consistent(s9, availability_status_darkside).
evidence(all_consistent(availability_status_darkside)).
query(true_val(availability_status_darkside, available_darkside)).
query(true_val(availability_status_darkside, unk_as_darkside)).

% @attr availability_status_focus
% @type categorical
% @canonical false
% @original_name availability_status (Focus Boardshop)
% @values available_159_backordered=Available_rider_owned_159_backordered unk_as_focus=Unknown
% @importance 0.775

0.82::true_val(availability_status_focus, available_159_backordered); 0.18::true_val(availability_status_focus, unk_as_focus).
0.80::acc(s6, availability_status_focus).
measured(s6, availability_status_focus, available_159_backordered).
all_consistent(availability_status_focus) :- consistent(s6, availability_status_focus).
evidence(all_consistent(availability_status_focus)).
query(true_val(availability_status_focus, available_159_backordered)).
query(true_val(availability_status_focus, unk_as_focus)).

% @attr availability_status_boyne
% @type categorical
% @canonical false
% @original_name availability_status (Boyne)
% @values available_boyne=Available unk_as_boyne=Unknown
% @importance 0.40

0.72::true_val(availability_status_boyne, available_boyne); 0.28::true_val(availability_status_boyne, unk_as_boyne).
0.70::acc(s4, availability_status_boyne).
measured(s4, availability_status_boyne, available_boyne).
all_consistent(availability_status_boyne) :- consistent(s4, availability_status_boyne).
evidence(all_consistent(availability_status_boyne)).
query(true_val(availability_status_boyne, available_boyne)).
query(true_val(availability_status_boyne, unk_as_boyne)).

% @attr availability_status_ski_chalet
% @type categorical
% @canonical false
% @original_name availability_status (Ski Chalet)
% @values available_ski_chalet=Available unk_as_sc=Unknown
% @importance 0.40

0.72::true_val(availability_status_ski_chalet, available_ski_chalet); 0.28::true_val(availability_status_ski_chalet, unk_as_sc).
0.70::acc(s8, availability_status_ski_chalet).
measured(s8, availability_status_ski_chalet, available_ski_chalet).
all_consistent(availability_status_ski_chalet) :- consistent(s8, availability_status_ski_chalet).
evidence(all_consistent(availability_status_ski_chalet)).
query(true_val(availability_status_ski_chalet, available_ski_chalet)).
query(true_val(availability_status_ski_chalet, unk_as_sc)).

% @attr availability_status_pacific_boarder
% @type categorical
% @canonical false
% @original_name availability_status (Pacific Boarder)
% @values available_pb=Available_164_listed_free_ship_canada unk_as_pb=Unknown
% @importance 0.60

0.78::true_val(availability_status_pacific_boarder, available_pb); 0.22::true_val(availability_status_pacific_boarder, unk_as_pb).
0.78::acc(s5, availability_status_pacific_boarder).
measured(s5, availability_status_pacific_boarder, available_pb).
all_consistent(availability_status_pacific_boarder) :- consistent(s5, availability_status_pacific_boarder).
evidence(all_consistent(availability_status_pacific_boarder)).
query(true_val(availability_status_pacific_boarder, available_pb)).
query(true_val(availability_status_pacific_boarder, unk_as_pb)).

% @attr availability_status_corbetts
% @type categorical
% @canonical false
% @original_name availability_status (Corbetts)
% @values available_corbetts=Available_free_ship_over_100 unk_as_corb=Unknown
% @importance 0.50

0.72::true_val(availability_status_corbetts, available_corbetts); 0.28::true_val(availability_status_corbetts, unk_as_corb).
0.70::acc(s3, availability_status_corbetts).
measured(s3, availability_status_corbetts, available_corbetts).
all_consistent(availability_status_corbetts) :- consistent(s3, availability_status_corbetts).
evidence(all_consistent(availability_status_corbetts)).
query(true_val(availability_status_corbetts, available_corbetts)).
query(true_val(availability_status_corbetts, unk_as_corb)).

% @attr availability_status_salty_peaks
% @type categorical
% @canonical false
% @original_name availability_status (Salty Peaks)
% @values listed_495_older=Listed_at_495_appears_older_model unk_as_sp=Unknown
% @importance 0.40

0.55::true_val(availability_status_salty_peaks, listed_495_older); 0.45::true_val(availability_status_salty_peaks, unk_as_sp).
0.55::acc(s24, availability_status_salty_peaks).
measured(s24, availability_status_salty_peaks, listed_495_older).
all_consistent(availability_status_salty_peaks) :- consistent(s24, availability_status_salty_peaks).
evidence(all_consistent(availability_status_salty_peaks)).
query(true_val(availability_status_salty_peaks, listed_495_older)).
query(true_val(availability_status_salty_peaks, unk_as_sp)).

% @attr availability_status_buckmans
% @type categorical
% @canonical false
% @original_name availability_status (Buckmans)
% @values available_buckmans=Available unk_as_buck=Unknown
% @importance 0.40

0.68::true_val(availability_status_buckmans, available_buckmans); 0.32::true_val(availability_status_buckmans, unk_as_buck).
0.65::acc(s80, availability_status_buckmans).
measured(s80, availability_status_buckmans, available_buckmans).
all_consistent(availability_status_buckmans) :- consistent(s80, availability_status_buckmans).
evidence(all_consistent(availability_status_buckmans)).
query(true_val(availability_status_buckmans, available_buckmans)).
query(true_val(availability_status_buckmans, unk_as_buck)).

% @attr availability_status_wintermen
% @type categorical
% @canonical false
% @original_name availability_status (WinterMen)
% @values available_wintermen=Available unk_as_wm=Unknown
% @importance 0.50

0.70::true_val(availability_status_wintermen, available_wintermen); 0.30::true_val(availability_status_wintermen, unk_as_wm).
0.68::acc(s78, availability_status_wintermen).
measured(s78, availability_status_wintermen, available_wintermen).
all_consistent(availability_status_wintermen) :- consistent(s78, availability_status_wintermen).
evidence(all_consistent(availability_status_wintermen)).
query(true_val(availability_status_wintermen, available_wintermen)).
query(true_val(availability_status_wintermen, unk_as_wm)).

% @attr availability_status_the_source
% @type categorical
% @canonical false
% @original_name availability_status (The Source)
% @values available_the_source=Available unk_as_ts=Unknown
% @importance 0.40

0.65::true_val(availability_status_the_source, available_the_source); 0.35::true_val(availability_status_the_source, unk_as_ts).
0.62::acc(s46, availability_status_the_source).
measured(s46, availability_status_the_source, available_the_source).
all_consistent(availability_status_the_source) :- consistent(s46, availability_status_the_source).
evidence(all_consistent(availability_status_the_source)).
query(true_val(availability_status_the_source, available_the_source)).
query(true_val(availability_status_the_source, unk_as_ts)).

% @attr availability_status_peter_glenn
% @type categorical
% @canonical false
% @original_name availability_status (Peter Glenn)
% @values available_pg_679_95=Available_679_95 unk_as_pg=Unknown
% @importance 0.70

0.78::true_val(availability_status_peter_glenn, available_pg_679_95); 0.22::true_val(availability_status_peter_glenn, unk_as_pg).
0.78::acc(s87, availability_status_peter_glenn).
measured(s87, availability_status_peter_glenn, available_pg_679_95).
all_consistent(availability_status_peter_glenn) :- consistent(s87, availability_status_peter_glenn).
evidence(all_consistent(availability_status_peter_glenn)).
query(true_val(availability_status_peter_glenn, available_pg_679_95)).
query(true_val(availability_status_peter_glenn, unk_as_pg)).

% @attr availability_status_trigger_bros
% @type categorical
% @canonical false
% @original_name availability_status (Trigger Bros)
% @values available_trigger=Available_Australia unk_as_tb=Unknown
% @importance 0.40

0.68::true_val(availability_status_trigger_bros, available_trigger); 0.32::true_val(availability_status_trigger_bros, unk_as_tb).
0.65::acc(s81, availability_status_trigger_bros).
measured(s81, availability_status_trigger_bros, available_trigger).
all_consistent(availability_status_trigger_bros) :- consistent(s81, availability_status_trigger_bros).
evidence(all_consistent(availability_status_trigger_bros)).
query(true_val(availability_status_trigger_bros, available_trigger)).
query(true_val(availability_status_trigger_bros, unk_as_tb)).

% @attr availability_status_boltcraf
% @type categorical
% @canonical false
% @original_name availability_status (Boltcraf)
% @values available_boltcraf_ltd=Ben_Ferguson_variant_very_limited unk_as_bolt=Unknown
% @importance 0.45

0.70::true_val(availability_status_boltcraf, available_boltcraf_ltd); 0.30::true_val(availability_status_boltcraf, unk_as_bolt).
0.65::acc(s10, availability_status_boltcraf).
measured(s10, availability_status_boltcraf, available_boltcraf_ltd).
all_consistent(availability_status_boltcraf) :- consistent(s10, availability_status_boltcraf).
evidence(all_consistent(availability_status_boltcraf)).
query(true_val(availability_status_boltcraf, available_boltcraf_ltd)).
query(true_val(availability_status_boltcraf, unk_as_bolt)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status (limited quantities)
% @values very_limited=Very_limited_quantities_shop_exclusive_reissue unk_availability_status=Unknown
% @importance 0.875

0.92::true_val(availability_status, very_limited); 0.08::true_val(availability_status, unk_availability_status).
0.90::acc(s1, availability_status).
0.88::acc(s31, availability_status).
measured(s1, availability_status, very_limited).
measured(s31, availability_status, very_limited).
all_consistent(availability_status) :- (indep(s1), consistent(s1, availability_status) ; \+indep(s1)), (indep(s31), consistent(s31, availability_status) ; \+indep(s31)).
evidence(all_consistent(availability_status)).
query(true_val(availability_status, very_limited)).
query(true_val(availability_status, unk_availability_status)).

% @attr shipping_restriction
% @type categorical
% @canonical false
% @original_name Shipping restriction
% @values australia_only=Australia_only unk_shipping=Unknown
% @importance 0.85

0.90::true_val(shipping_restriction, australia_only); 0.10::true_val(shipping_restriction, unk_shipping).
0.92::acc(s_merchant, shipping_restriction).
measured(s_merchant, shipping_restriction, australia_only).
all_consistent(shipping_restriction) :- consistent(s_merchant, shipping_restriction).
evidence(all_consistent(shipping_restriction)).
query(true_val(shipping_restriction, australia_only)).
query(true_val(shipping_restriction, unk_shipping)).

% @attr overall_rating_snowboardingprofiles
% @type numeric
% @unit /100
% @canonical true
% @original_name overall_rating_snowboardingprofiles
% @values v89_8=89.8 unk_rating_sp=Unknown
% @importance 0.90

0.78::true_val(overall_rating_snowboardingprofiles, v89_8); 0.22::true_val(overall_rating_snowboardingprofiles, unk_rating_sp).
0.90::acc(s15, overall_rating_snowboardingprofiles).
measured(s15, overall_rating_snowboardingprofiles, v89_8).
all_consistent(overall_rating_snowboardingprofiles) :- consistent(s15, overall_rating_snowboardingprofiles).
evidence(all_consistent(overall_rating_snowboardingprofiles)).
query(true_val(overall_rating_snowboardingprofiles, v89_8)).
query(true_val(overall_rating_snowboardingprofiles, unk_rating_sp)).

% @attr snowboardingprofiles_price
% @type numeric
% @unit USD
% @canonical false
% @original_name SnowboardingProfiles price
% @values v679=679.0 unk_sp_price=Unknown
% @importance 0.90

0.78::true_val(snowboardingprofiles_price, v679); 0.22::true_val(snowboardingprofiles_price, unk_sp_price).
0.85::acc(s15, snowboardingprofiles_price).
measured(s15, snowboardingprofiles_price, v679).
all_consistent(snowboardingprofiles_price) :- consistent(s15, snowboardingprofiles_price).
evidence(all_consistent(snowboardingprofiles_price)).
query(true_val(snowboardingprofiles_price, v679)).
query(true_val(snowboardingprofiles_price, unk_sp_price)).

% @attr overall_rating_snowboardingprofiles_general
% @type numeric
% @unit /100
% @canonical false
% @original_name overall_rating_snowboardingprofiles (general)
% @values v84_6=84.6 unk_rating_sp_gen=Unknown
% @importance 0.90

0.78::true_val(overall_rating_snowboardingprofiles_general, v84_6); 0.22::true_val(overall_rating_snowboardingprofiles_general, unk_rating_sp_gen).
0.88::acc(s15, overall_rating_snowboardingprofiles_general).
measured(s15, overall_rating_snowboardingprofiles_general, v84_6).
all_consistent(overall_rating_snowboardingprofiles_general) :- consistent(s15, overall_rating_snowboardingprofiles_general).
evidence(all_consistent(overall_rating_snowboardingprofiles_general)).
query(true_val(overall_rating_snowboardingprofiles_general, v84_6)).
query(true_val(overall_rating_snowboardingprofiles_general, unk_rating_sp_gen)).

% @attr board_of_the_world_rating
% @type numeric
% @unit /100
% @canonical false
% @original_name Board of the World rating
% @values v89_52=89.52 unk_botw_rating=Unknown
% @importance 0.85

0.80::true_val(board_of_the_world_rating, v89_52); 0.20::true_val(board_of_the_world_rating, unk_botw_rating).
0.85::acc(s65, board_of_the_world_rating).
measured(s65, board_of_the_world_rating, v89_52).
all_consistent(board_of_the_world_rating) :- consistent(s65, board_of_the_world_rating).
evidence(all_consistent(board_of_the_world_rating)).
query(true_val(board_of_the_world_rating, v89_52)).
query(true_val(board_of_the_world_rating, unk_botw_rating)).

% @attr outdoorshell_score
% @type numeric
% @unit /100
% @canonical false
% @original_name OutdoorShell comprehensive score
% @values v87=87.0 unk_os_score=Unknown
% @importance 0.75

0.72::true_val(outdoorshell_score, v87); 0.28::true_val(outdoorshell_score, unk_os_score).
0.78::acc(s44, outdoorshell_score).
measured(s44, outdoorshell_score, v87).
all_consistent(outdoorshell_score) :- consistent(s44, outdoorshell_score).
evidence(all_consistent(outdoorshell_score)).
query(true_val(outdoorshell_score, v87)).
query(true_val(outdoorshell_score, unk_os_score)).

% @attr outdoorshell_category_average
% @type numeric
% @unit /100
% @canonical false
% @original_name OutdoorShell category average
% @values v90=90.0 unk_os_avg=Unknown
% @importance 0.75

0.72::true_val(outdoorshell_category_average, v90); 0.28::true_val(outdoorshell_category_average, unk_os_avg).
0.75::acc(s44, outdoorshell_category_average).
measured(s44, outdoorshell_category_average, v90).
all_consistent(outdoorshell_category_average) :- consistent(s44, outdoorshell_category_average).
evidence(all_consistent(outdoorshell_category_average)).
query(true_val(outdoorshell_category_average, v90)).
query(true_val(outdoorshell_category_average, unk_os_avg)).

% @attr mtnweekly_sentiment
% @type categorical
% @canonical false
% @original_name MtnWeekly sentiment
% @values highly_positive=Highly_positive_top_pick unk_mw_sent=Unknown
% @importance 0.70

0.72::true_val(mtnweekly_sentiment, highly_positive); 0.28::true_val(mtnweekly_sentiment, unk_mw_sent).
0.78::acc(s48, mtnweekly_sentiment).
measured(s48, mtnweekly_sentiment, highly_positive).
all_consistent(mtnweekly_sentiment) :- consistent(s48, mtnweekly_sentiment).
evidence(all_consistent(mtnweekly_sentiment)).
query(true_val(mtnweekly_sentiment, highly_positive)).
query(true_val(mtnweekly_sentiment, unk_mw_sent)).

% @attr the_inertia_assessment
% @type categorical
% @canonical false
% @original_name The Inertia 2026 assessment
% @values excellent_not_top=Excellent_but_knocked_out_of_top_picks unk_inertia=Unknown
% @importance 0.75

0.78::true_val(the_inertia_assessment, excellent_not_top); 0.22::true_val(the_inertia_assessment, unk_inertia).
0.82::acc(s104, the_inertia_assessment).
measured(s104, the_inertia_assessment, excellent_not_top).
all_consistent(the_inertia_assessment) :- consistent(s104, the_inertia_assessment).
evidence(all_consistent(the_inertia_assessment)).
query(true_val(the_inertia_assessment, excellent_not_top)).
query(true_val(the_inertia_assessment, unk_inertia)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values not_one_board_quiver=Not_the_one_board_quiver_it_used_to_be unk_ro_tgr=Unknown
% @importance 0.85

0.80::true_val(reviewer_opinion_the_good_ride, not_one_board_quiver); 0.20::true_val(reviewer_opinion_the_good_ride, unk_ro_tgr).
0.88::acc(s62, reviewer_opinion_the_good_ride).
measured(s62, reviewer_opinion_the_good_ride, not_one_board_quiver).
all_consistent(reviewer_opinion_the_good_ride) :- consistent(s62, reviewer_opinion_the_good_ride).
evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, not_one_board_quiver)).
query(true_val(reviewer_opinion_the_good_ride, unk_ro_tgr)).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name reviewer_opinion_snowboardingprofiles
% @values fun_to_carve=Just_so_fun_to_carve_medium_to_high_speeds unk_ro_sp=Unknown
% @importance 0.90

0.80::true_val(reviewer_opinion_snowboardingprofiles, fun_to_carve); 0.20::true_val(reviewer_opinion_snowboardingprofiles, unk_ro_sp).
0.88::acc(s15, reviewer_opinion_snowboardingprofiles).
measured(s15, reviewer_opinion_snowboardingprofiles, fun_to_carve).
all_consistent(reviewer_opinion_snowboardingprofiles) :- consistent(s15, reviewer_opinion_snowboardingprofiles).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, fun_to_carve)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_ro_sp)).

% @attr pop
% @type numeric
% @unit /10
% @canonical false
% @original_name pop
% @values v8=8.0 unk_pop=Unknown
% @importance 0.85

0.80::true_val(pop, v8); 0.20::true_val(pop, unk_pop).
0.85::acc(s65, pop).
measured(s65, pop, v8).
all_consistent(pop) :- consistent(s65, pop).
evidence(all_consistent(pop)).
query(true_val(pop, v8)).
query(true_val(pop, unk_pop)).

% @attr reviewer_opinion_snowboardingprofiles_jumps
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (jumps)
% @values sick_for_jumps=Sick_for_jumps_goldilocks_stability_maneuverability unk_ro_sp_j=Unknown
% @importance 0.90

0.80::true_val(reviewer_opinion_snowboardingprofiles_jumps, sick_for_jumps); 0.20::true_val(reviewer_opinion_snowboardingprofiles_jumps, unk_ro_sp_j).
0.88::acc(s15, reviewer_opinion_snowboardingprofiles_jumps).
measured(s15, reviewer_opinion_snowboardingprofiles_jumps, sick_for_jumps).
all_consistent(reviewer_opinion_snowboardingprofiles_jumps) :- consistent(s15, reviewer_opinion_snowboardingprofiles_jumps).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles_jumps)).
query(true_val(reviewer_opinion_snowboardingprofiles_jumps, sick_for_jumps)).
query(true_val(reviewer_opinion_snowboardingprofiles_jumps, unk_ro_sp_j)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values super_versatile=Super_versatile_feels_good_every_terrain unk_positive=Unknown
% @importance 0.90

0.82::true_val(positive_aspect, super_versatile); 0.18::true_val(positive_aspect, unk_positive).
0.88::acc(s15, positive_aspect).
measured(s15, positive_aspect, super_versatile).
all_consistent(positive_aspect) :- consistent(s15, positive_aspect).
evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, super_versatile)).
query(true_val(positive_aspect, unk_positive)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values competent_switch=Twin_flex_allows_competent_switch_despite_directional unk_switch=Unknown
% @importance 0.875

0.90::true_val(switch_riding, competent_switch); 0.10::true_val(switch_riding, unk_switch).
0.88::acc(s1, switch_riding).
0.85::acc(s6, switch_riding).
measured(s1, switch_riding, competent_switch).
measured(s6, switch_riding, competent_switch).
all_consistent(switch_riding) :- (indep(s1), consistent(s1, switch_riding) ; \+indep(s1)), (indep(s6), consistent(s6, switch_riding) ; \+indep(s6)).
evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, competent_switch)).
query(true_val(switch_riding, unk_switch)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values surprisingly_easy=Surprisingly_easy_edge_to_edge unk_turn_init=Unknown
% @importance 0.70

0.72::true_val(turn_initiation_performance, surprisingly_easy); 0.28::true_val(turn_initiation_performance, unk_turn_init).
0.78::acc(s48, turn_initiation_performance).
measured(s48, turn_initiation_performance, surprisingly_easy).
all_consistent(turn_initiation_performance) :- consistent(s48, turn_initiation_performance).
evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, surprisingly_easy)).
query(true_val(turn_initiation_performance, unk_turn_init)).

% @attr positive_aspect_landings
% @type categorical
% @canonical false
% @original_name positive_aspect (landings)
% @values stomp_landings=Really_stomp_landings unk_pa_land=Unknown
% @importance 0.90

0.80::true_val(positive_aspect_landings, stomp_landings); 0.20::true_val(positive_aspect_landings, unk_pa_land).
0.88::acc(s15, positive_aspect_landings).
measured(s15, positive_aspect_landings, stomp_landings).
all_consistent(positive_aspect_landings) :- consistent(s15, positive_aspect_landings).
evidence(all_consistent(positive_aspect_landings)).
query(true_val(positive_aspect_landings, stomp_landings)).
query(true_val(positive_aspect_landings, unk_pa_land)).

% @attr positive_aspect_durability
% @type categorical
% @canonical false
% @original_name positive_aspect (durability)
% @values maintains_flex_pop=Maintains_flex_pop_from_day_one_season_after_season unk_pa_dur=Unknown
% @importance 0.95

0.88::true_val(positive_aspect_durability, maintains_flex_pop); 0.12::true_val(positive_aspect_durability, unk_pa_dur).
0.88::acc(s1, positive_aspect_durability).
measured(s1, positive_aspect_durability, maintains_flex_pop).
all_consistent(positive_aspect_durability) :- consistent(s1, positive_aspect_durability).
evidence(all_consistent(positive_aspect_durability)).
query(true_val(positive_aspect_durability, maintains_flex_pop)).
query(true_val(positive_aspect_durability, unk_pa_dur)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values fast_all_conditions=Ultradurable_very_fast_all_conditions declining=Not_what_it_used_to_be
% @importance 0.775

0.45::true_val(base_glide_performance, fast_all_conditions); 0.55::true_val(base_glide_performance, declining).
0.75::acc(s12, base_glide_performance).
0.88::acc(s62, base_glide_performance).
measured(s12, base_glide_performance, fast_all_conditions).
measured(s62, base_glide_performance, declining).
all_consistent(base_glide_performance) :- (indep(s12), consistent(s12, base_glide_performance) ; \+indep(s12)), consistent(s62, base_glide_performance).
evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, fast_all_conditions)).
query(true_val(base_glide_performance, declining)).

% @attr board_weight_grams
% @type numeric
% @unit g
% @canonical true
% @original_name board_weight_grams
% @values v2620=2620.0 unk_weight=Unknown
% @importance 0.90

0.78::true_val(board_weight_grams, v2620); 0.22::true_val(board_weight_grams, unk_weight).
0.92::acc(s15, board_weight_grams).
measured(s15, board_weight_grams, v2620).
all_consistent(board_weight_grams) :- consistent(s15, board_weight_grams).
evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v2620)).
query(true_val(board_weight_grams, unk_weight)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values not_awesome_powder=Not_awesome_for_powder_back_leg_burner unk_negative=Unknown
% @importance 0.90

0.85::true_val(negative_aspect, not_awesome_powder); 0.15::true_val(negative_aspect, unk_negative).
0.88::acc(s15, negative_aspect).
measured(s15, negative_aspect, not_awesome_powder).
all_consistent(negative_aspect) :- consistent(s15, negative_aspect).
evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, not_awesome_powder)).
query(true_val(negative_aspect, unk_negative)).

% @attr negative_aspect_deep_snow
% @type categorical
% @canonical false
% @original_name negative_aspect (deep snow)
% @values not_for_16in_plus=Not_for_snow_deeper_than_16in_40cm unk_na_deep=Unknown
% @importance 0.85

0.80::true_val(negative_aspect_deep_snow, not_for_16in_plus); 0.20::true_val(negative_aspect_deep_snow, unk_na_deep).
0.82::acc(s65, negative_aspect_deep_snow).
measured(s65, negative_aspect_deep_snow, not_for_16in_plus).
all_consistent(negative_aspect_deep_snow) :- consistent(s65, negative_aspect_deep_snow).
evidence(all_consistent(negative_aspect_deep_snow)).
query(true_val(negative_aspect_deep_snow, not_for_16in_plus)).
query(true_val(negative_aspect_deep_snow, unk_na_deep)).

% @attr negative_aspect_grip
% @type categorical
% @canonical false
% @original_name negative_aspect (grip)
% @values behind_in_grip=A_little_behind_in_grip_vs_competitors unk_na_grip=Unknown
% @importance 0.85

0.80::true_val(negative_aspect_grip, behind_in_grip); 0.20::true_val(negative_aspect_grip, unk_na_grip).
0.85::acc(s62, negative_aspect_grip).
measured(s62, negative_aspect_grip, behind_in_grip).
all_consistent(negative_aspect_grip) :- consistent(s62, negative_aspect_grip).
evidence(all_consistent(negative_aspect_grip)).
query(true_val(negative_aspect_grip, behind_in_grip)).
query(true_val(negative_aspect_grip, unk_na_grip)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values good_not_top=Good_but_not_top_tier unk_edge_hold=Unknown
% @importance 0.85

0.80::true_val(edge_hold, good_not_top); 0.20::true_val(edge_hold, unk_edge_hold).
0.85::acc(s62, edge_hold).
measured(s62, edge_hold, good_not_top).
all_consistent(edge_hold) :- consistent(s62, edge_hold).
evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, good_not_top)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr negative_aspect_beginners
% @type categorical
% @canonical false
% @original_name negative_aspect (beginners)
% @values not_for_beginners=Not_for_beginners_low_intermediate_may_struggle unk_na_beg=Unknown
% @importance 0.90

0.82::true_val(negative_aspect_beginners, not_for_beginners); 0.18::true_val(negative_aspect_beginners, unk_na_beg).
0.85::acc(s15, negative_aspect_beginners).
measured(s15, negative_aspect_beginners, not_for_beginners).
all_consistent(negative_aspect_beginners) :- consistent(s15, negative_aspect_beginners).
evidence(all_consistent(negative_aspect_beginners)).
query(true_val(negative_aspect_beginners, not_for_beginners)).
query(true_val(negative_aspect_beginners, unk_na_beg)).

% @attr negative_aspect_catchy
% @type categorical
% @canonical false
% @original_name negative_aspect (catchy)
% @values catchy_for_beginners=Full_camber_can_feel_catchy_for_beginners unk_na_catch=Unknown
% @importance 0.65

0.74::true_val(negative_aspect_catchy, catchy_for_beginners); 0.26::true_val(negative_aspect_catchy, unk_na_catch).
0.75::acc(s43, negative_aspect_catchy).
measured(s43, negative_aspect_catchy, catchy_for_beginners).
all_consistent(negative_aspect_catchy) :- consistent(s43, negative_aspect_catchy).
evidence(all_consistent(negative_aspect_catchy)).
query(true_val(negative_aspect_catchy, catchy_for_beginners)).
query(true_val(negative_aspect_catchy, unk_na_catch)).

% @attr negative_aspect_buttering
% @type categorical
% @canonical false
% @original_name negative_aspect (buttering)
% @values buttering_not_highlight=Buttering_performance_not_a_highlight unk_na_butt=Unknown
% @importance 0.80

0.78::true_val(negative_aspect_buttering, buttering_not_highlight); 0.22::true_val(negative_aspect_buttering, unk_na_butt).
0.82::acc(s16, negative_aspect_buttering).
measured(s16, negative_aspect_buttering, buttering_not_highlight).
all_consistent(negative_aspect_buttering) :- consistent(s16, negative_aspect_buttering).
evidence(all_consistent(negative_aspect_buttering)).
query(true_val(negative_aspect_buttering, buttering_not_highlight)).
query(true_val(negative_aspect_buttering, unk_na_butt)).

% @attr negative_aspect_price
% @type categorical
% @canonical false
% @original_name negative_aspect (price)
% @values price_120_more=120_more_than_comparable_like_Jones_Mountain_Twin unk_na_price=Unknown
% @importance 0.80

0.80::true_val(negative_aspect_price, price_120_more); 0.20::true_val(negative_aspect_price, unk_na_price).
0.82::acc(s106, negative_aspect_price).
measured(s106, negative_aspect_price, price_120_more).
all_consistent(negative_aspect_price) :- consistent(s106, negative_aspect_price).
evidence(all_consistent(negative_aspect_price)).
query(true_val(negative_aspect_price, price_120_more)).
query(true_val(negative_aspect_price, unk_na_price)).

% @attr negative_aspect_speed_limit
% @type categorical
% @canonical false
% @original_name negative_aspect (speed limit)
% @values unstable_at_max=Cant_bomb_without_some_instability_ceiling_fairly_high unk_na_speed=Unknown
% @importance 0.90

0.80::true_val(negative_aspect_speed_limit, unstable_at_max); 0.20::true_val(negative_aspect_speed_limit, unk_na_speed).
0.85::acc(s15, negative_aspect_speed_limit).
measured(s15, negative_aspect_speed_limit, unstable_at_max).
all_consistent(negative_aspect_speed_limit) :- consistent(s15, negative_aspect_speed_limit).
evidence(all_consistent(negative_aspect_speed_limit)).
query(true_val(negative_aspect_speed_limit, unstable_at_max)).
query(true_val(negative_aspect_speed_limit, unk_na_speed)).

% @attr comparable_board_same_brand_custom_x
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Custom X)
% @values custom_x=Custom_X_stiffer_6_9flex_899_91_5rating unk_cbs_cx=Unknown
% @importance 0.75

0.82::true_val(comparable_board_same_brand_custom_x, custom_x); 0.18::true_val(comparable_board_same_brand_custom_x, unk_cbs_cx).
0.85::acc(s13, comparable_board_same_brand_custom_x).
measured(s13, comparable_board_same_brand_custom_x, custom_x).
all_consistent(comparable_board_same_brand_custom_x) :- consistent(s13, comparable_board_same_brand_custom_x).
evidence(all_consistent(comparable_board_same_brand_custom_x)).
query(true_val(comparable_board_same_brand_custom_x, custom_x)).
query(true_val(comparable_board_same_brand_custom_x, unk_cbs_cx)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values jones_mountain_twin=Jones_Mountain_Twin_120_cheaper_similar_versatility unk_cbc=Unknown
% @importance 0.80

0.82::true_val(comparable_board_cross_brand, jones_mountain_twin); 0.18::true_val(comparable_board_cross_brand, unk_cbc).
0.82::acc(s106, comparable_board_cross_brand).
measured(s106, comparable_board_cross_brand, jones_mountain_twin).
all_consistent(comparable_board_cross_brand) :- consistent(s106, comparable_board_cross_brand).
evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, jones_mountain_twin)).
query(true_val(comparable_board_cross_brand, unk_cbc)).

% @attr comparable_board_cross_brand_mercury
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Mercury)
% @values capita_mercury=CAPiTA_Mercury_hybrid_camber_cross_shop unk_cbc_merc=Unknown
% @importance 0.75

0.78::true_val(comparable_board_cross_brand_mercury, capita_mercury); 0.22::true_val(comparable_board_cross_brand_mercury, unk_cbc_merc).
0.70::acc(s102, comparable_board_cross_brand_mercury).
0.85::acc(s109, comparable_board_cross_brand_mercury).
measured(s102, comparable_board_cross_brand_mercury, capita_mercury).
measured(s109, comparable_board_cross_brand_mercury, capita_mercury).
all_consistent(comparable_board_cross_brand_mercury) :- consistent(s102, comparable_board_cross_brand_mercury), consistent(s109, comparable_board_cross_brand_mercury).
evidence(all_consistent(comparable_board_cross_brand_mercury)).
query(true_val(comparable_board_cross_brand_mercury, capita_mercury)).
query(true_val(comparable_board_cross_brand_mercury, unk_cbc_merc)).

% @attr comparable_board_cross_brand_yes_standard
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Yes Standard)
% @values yes_standard=Yes_Standard_hybrid_camber_true_twin unk_cbc_yes=Unknown
% @importance 0.60

0.75::true_val(comparable_board_cross_brand_yes_standard, yes_standard); 0.25::true_val(comparable_board_cross_brand_yes_standard, unk_cbc_yes).
0.78::acc(s107, comparable_board_cross_brand_yes_standard).
measured(s107, comparable_board_cross_brand_yes_standard, yes_standard).
all_consistent(comparable_board_cross_brand_yes_standard) :- consistent(s107, comparable_board_cross_brand_yes_standard).
evidence(all_consistent(comparable_board_cross_brand_yes_standard)).
query(true_val(comparable_board_cross_brand_yes_standard, yes_standard)).
query(true_val(comparable_board_cross_brand_yes_standard, unk_cbc_yes)).

% @attr comparable_board_cross_brand_top_rated
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (top-rated)
% @values top_am_responsive=Top_rated_all_mountain_responds_aggressive_and_lighter unk_cbc_top=Unknown
% @importance 0.80

0.80::true_val(comparable_board_cross_brand_top_rated, top_am_responsive); 0.20::true_val(comparable_board_cross_brand_top_rated, unk_cbc_top).
0.85::acc(s109, comparable_board_cross_brand_top_rated).
measured(s109, comparable_board_cross_brand_top_rated, top_am_responsive).
all_consistent(comparable_board_cross_brand_top_rated) :- consistent(s109, comparable_board_cross_brand_top_rated).
evidence(all_consistent(comparable_board_cross_brand_top_rated)).
query(true_val(comparable_board_cross_brand_top_rated, top_am_responsive)).
query(true_val(comparable_board_cross_brand_top_rated, unk_cbc_top)).

% @attr comparable_board_same_brand_good_company
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Good Company)
% @values good_company=Burton_Good_Company_440_budget_82_35rating unk_cbs_gc=Unknown
% @importance 0.60

0.72::true_val(comparable_board_same_brand_good_company, good_company); 0.28::true_val(comparable_board_same_brand_good_company, unk_cbs_gc).
0.75::acc(s67, comparable_board_same_brand_good_company).
measured(s67, comparable_board_same_brand_good_company, good_company).
all_consistent(comparable_board_same_brand_good_company) :- consistent(s67, comparable_board_same_brand_good_company).
evidence(all_consistent(comparable_board_same_brand_good_company)).
query(true_val(comparable_board_same_brand_good_company, good_company)).
query(true_val(comparable_board_same_brand_good_company, unk_cbs_gc)).

% @attr average_snowboard_price
% @type numeric
% @unit USD
% @canonical false
% @original_name Average snowboard price (2026)
% @values v468_01=468.01 unk_avg_price=Unknown
% @importance 0.85

0.80::true_val(average_snowboard_price, v468_01); 0.20::true_val(average_snowboard_price, unk_avg_price).
0.78::acc(s65, average_snowboard_price).
measured(s65, average_snowboard_price, v468_01).
all_consistent(average_snowboard_price) :- consistent(s65, average_snowboard_price).
evidence(all_consistent(average_snowboard_price)).
query(true_val(average_snowboard_price, v468_01)).
query(true_val(average_snowboard_price, unk_avg_price)).

% @attr topsheet_appearance_description_ferguson
% @type categorical
% @canonical false
% @original_name topsheet_appearance_description (Ferguson)
% @values pegasus_lightning=Pegasus_and_lightning_bolt_hand_drawn unk_topsheet_ferg=Unknown
% @importance 0.50

0.90::true_val(topsheet_appearance_description_ferguson, pegasus_lightning); 0.10::true_val(topsheet_appearance_description_ferguson, unk_topsheet_ferg).
0.93::acc(s7, topsheet_appearance_description_ferguson).
measured(s7, topsheet_appearance_description_ferguson, pegasus_lightning).
all_consistent(topsheet_appearance_description_ferguson) :- consistent(s7, topsheet_appearance_description_ferguson).
evidence(all_consistent(topsheet_appearance_description_ferguson)).
query(true_val(topsheet_appearance_description_ferguson, pegasus_lightning)).
query(true_val(topsheet_appearance_description_ferguson, unk_topsheet_ferg)).

% @attr available_colors
% @type categorical
% @canonical false
% @original_name available_colors
% @values jungle_and_glow=Jungle_colorful_and_Glow_neon unk_colors=Unknown
% @importance 0.60

0.88::true_val(available_colors, jungle_and_glow); 0.12::true_val(available_colors, unk_colors).
0.92::acc(s7, available_colors).
0.78::acc(s83, available_colors).
measured(s7, available_colors, jungle_and_glow).
measured(s83, available_colors, jungle_and_glow).
all_consistent(available_colors) :- consistent(s7, available_colors), (indep(s83), consistent(s83, available_colors) ; \+indep(s83)).
evidence(all_consistent(available_colors)).
query(true_val(available_colors, jungle_and_glow)).
query(true_val(available_colors, unk_colors)).

% @attr collectibility
% @type categorical
% @canonical false
% @original_name Collectibility
% @values rideable_history=A_piece_of_snowboarding_history_you_can_ride unk_collectibility=Unknown
% @importance 0.95

0.85::true_val(collectibility, rideable_history); 0.15::true_val(collectibility, unk_collectibility).
0.85::acc(s1, collectibility).
measured(s1, collectibility, rideable_history).
all_consistent(collectibility) :- consistent(s1, collectibility).
evidence(all_consistent(collectibility)).
query(true_val(collectibility, rideable_history)).
query(true_val(collectibility, unk_collectibility)).

% @attr shop_exclusive
% @type categorical
% @canonical false
% @original_name Shop-exclusive
% @values yes_shop_exclusive=Shop_exclusive_reissue unk_shop_excl=Unknown
% @importance 0.85

0.85::true_val(shop_exclusive, yes_shop_exclusive); 0.15::true_val(shop_exclusive, unk_shop_excl).
0.85::acc(s31, shop_exclusive).
measured(s31, shop_exclusive, yes_shop_exclusive).
all_consistent(shop_exclusive) :- consistent(s31, shop_exclusive).
evidence(all_consistent(shop_exclusive)).
query(true_val(shop_exclusive, yes_shop_exclusive)).
query(true_val(shop_exclusive, unk_shop_excl)).

% @attr custom_prototype_first_ridden
% @type categorical
% @canonical false
% @original_name Custom prototype first ridden
% @values y1995=1995 unk_proto=Unknown
% @importance 0.70

0.92::true_val(custom_prototype_first_ridden, y1995); 0.08::true_val(custom_prototype_first_ridden, unk_proto).
0.95::acc(s74, custom_prototype_first_ridden).
measured(s74, custom_prototype_first_ridden, y1995).
all_consistent(custom_prototype_first_ridden) :- consistent(s74, custom_prototype_first_ridden).
evidence(all_consistent(custom_prototype_first_ridden)).
query(true_val(custom_prototype_first_ridden, y1995)).
query(true_val(custom_prototype_first_ridden, unk_proto)).

% @attr custom_wide_launch
% @type categorical
% @canonical false
% @original_name Custom Wide launch
% @values y2008=2008 unk_wide_launch=Unknown
% @importance 0.70

0.92::true_val(custom_wide_launch, y2008); 0.08::true_val(custom_wide_launch, unk_wide_launch).
0.95::acc(s74, custom_wide_launch).
measured(s74, custom_wide_launch, y2008).
all_consistent(custom_wide_launch) :- consistent(s74, custom_wide_launch).
evidence(all_consistent(custom_wide_launch)).
query(true_val(custom_wide_launch, y2008)).
query(true_val(custom_wide_launch, unk_wide_launch)).

% @attr wfo_base_added
% @type categorical
% @canonical false
% @original_name WFO sintered base added
% @values y2007=2007 unk_wfo_added=Unknown
% @importance 0.70

0.92::true_val(wfo_base_added, y2007); 0.08::true_val(wfo_base_added, unk_wfo_added).
0.95::acc(s74, wfo_base_added).
measured(s74, wfo_base_added, y2007).
all_consistent(wfo_base_added) :- consistent(s74, wfo_base_added).
evidence(all_consistent(wfo_base_added)).
query(true_val(wfo_base_added, y2007)).
query(true_val(wfo_base_added, unk_wfo_added)).

% @attr dimensions_unchanged
% @type categorical
% @canonical false
% @original_name Dimensions unchanged
% @values unchanged_throughout=Dimensions_unchanged_same_sidecut_lengths_ride unk_dim_unch=Unknown
% @importance 0.70

0.90::true_val(dimensions_unchanged, unchanged_throughout); 0.10::true_val(dimensions_unchanged, unk_dim_unch).
0.90::acc(s74, dimensions_unchanged).
measured(s74, dimensions_unchanged, unchanged_throughout).
all_consistent(dimensions_unchanged) :- consistent(s74, dimensions_unchanged).
evidence(all_consistent(dimensions_unchanged)).
query(true_val(dimensions_unchanged, unchanged_throughout)).
query(true_val(dimensions_unchanged, unk_dim_unch)).

% @attr twentieth_anniversary
% @type categorical
% @canonical false
% @original_name 20th anniversary
% @values y2016_throwback=2016_edition_featured_throwback_topsheets unk_20th=Unknown
% @importance 0.70

0.92::true_val(twentieth_anniversary, y2016_throwback); 0.08::true_val(twentieth_anniversary, unk_20th).
0.95::acc(s74, twentieth_anniversary).
measured(s74, twentieth_anniversary, y2016_throwback).
all_consistent(twentieth_anniversary) :- consistent(s74, twentieth_anniversary).
evidence(all_consistent(twentieth_anniversary)).
query(true_val(twentieth_anniversary, y2016_throwback)).
query(true_val(twentieth_anniversary, unk_20th)).

% @attr first_all_mountain_snowboard
% @type categorical
% @canonical false
% @original_name First all-mountain snowboard
% @values yes_1996=Burton_Custom_1996_was_first_all_mountain unk_first_am=Unknown
% @importance 0.60

0.80::true_val(first_all_mountain_snowboard, yes_1996); 0.20::true_val(first_all_mountain_snowboard, unk_first_am).
0.82::acc(s107, first_all_mountain_snowboard).
measured(s107, first_all_mountain_snowboard, yes_1996).
all_consistent(first_all_mountain_snowboard) :- consistent(s107, first_all_mountain_snowboard).
evidence(all_consistent(first_all_mountain_snowboard)).
query(true_val(first_all_mountain_snowboard, yes_1996)).
query(true_val(first_all_mountain_snowboard, unk_first_am)).

% @attr powder_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical true
% @original_name powder_score_snowboardingprofiles
% @values v2_5=2.5 unk_powder_sp=Unknown
% @importance 0.90

0.78::true_val(powder_score_snowboardingprofiles, v2_5); 0.22::true_val(powder_score_snowboardingprofiles, unk_powder_sp).
0.88::acc(s15, powder_score_snowboardingprofiles).
measured(s15, powder_score_snowboardingprofiles, v2_5).
all_consistent(powder_score_snowboardingprofiles) :- consistent(s15, powder_score_snowboardingprofiles).
evidence(all_consistent(powder_score_snowboardingprofiles)).
query(true_val(powder_score_snowboardingprofiles, v2_5)).
query(true_val(powder_score_snowboardingprofiles, unk_powder_sp)).

% @attr carving_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical true
% @original_name carving_score_snowboardingprofiles
% @values v4=4.0 unk_carving_sp=Unknown
% @importance 0.90

0.78::true_val(carving_score_snowboardingprofiles, v4); 0.22::true_val(carving_score_snowboardingprofiles, unk_carving_sp).
0.88::acc(s15, carving_score_snowboardingprofiles).
measured(s15, carving_score_snowboardingprofiles, v4).
all_consistent(carving_score_snowboardingprofiles) :- consistent(s15, carving_score_snowboardingprofiles).
evidence(all_consistent(carving_score_snowboardingprofiles)).
query(true_val(carving_score_snowboardingprofiles, v4)).
query(true_val(carving_score_snowboardingprofiles, unk_carving_sp)).

% @attr turns_score_sp
% @type numeric
% @unit /5
% @canonical false
% @original_name SnowboardingProfiles turns score
% @values v4=4.0 unk_turns_sp=Unknown
% @importance 0.90

0.78::true_val(turns_score_sp, v4); 0.22::true_val(turns_score_sp, unk_turns_sp).
0.88::acc(s15, turns_score_sp).
measured(s15, turns_score_sp, v4).
all_consistent(turns_score_sp) :- consistent(s15, turns_score_sp).
evidence(all_consistent(turns_score_sp)).
query(true_val(turns_score_sp, v4)).
query(true_val(turns_score_sp, unk_turns_sp)).

% @attr speed_score_sp
% @type numeric
% @unit /5
% @canonical false
% @original_name SnowboardingProfiles speed score
% @values v4=4.0 unk_speed_sp=Unknown
% @importance 0.90

0.78::true_val(speed_score_sp, v4); 0.22::true_val(speed_score_sp, unk_speed_sp).
0.88::acc(s15, speed_score_sp).
measured(s15, speed_score_sp, v4).
all_consistent(speed_score_sp) :- consistent(s15, speed_score_sp).
evidence(all_consistent(speed_score_sp)).
query(true_val(speed_score_sp, v4)).
query(true_val(speed_score_sp, unk_speed_sp)).

% @attr crud_score_sp
% @type numeric
% @unit /5
% @canonical false
% @original_name SnowboardingProfiles crud score
% @values v3_5=3.5 unk_crud_sp=Unknown
% @importance 0.90

0.78::true_val(crud_score_sp, v3_5); 0.22::true_val(crud_score_sp, unk_crud_sp).
0.88::acc(s15, crud_score_sp).
measured(s15, crud_score_sp, v3_5).
all_consistent(crud_score_sp) :- consistent(s15, crud_score_sp).
evidence(all_consistent(crud_score_sp)).
query(true_val(crud_score_sp, v3_5)).
query(true_val(crud_score_sp, unk_crud_sp)).

% @attr trees_score_sp
% @type numeric
% @unit /5
% @canonical false
% @original_name SnowboardingProfiles trees score
% @values v4=4.0 unk_trees_sp=Unknown
% @importance 0.90

0.78::true_val(trees_score_sp, v4); 0.22::true_val(trees_score_sp, unk_trees_sp).
0.88::acc(s15, trees_score_sp).
measured(s15, trees_score_sp, v4).
all_consistent(trees_score_sp) :- consistent(s15, trees_score_sp).
evidence(all_consistent(trees_score_sp)).
query(true_val(trees_score_sp, v4)).
query(true_val(trees_score_sp, unk_trees_sp)).

% @attr switch_score_sp
% @type numeric
% @unit /5
% @canonical false
% @original_name SnowboardingProfiles switch score
% @values v4=4.0 unk_switch_sp=Unknown
% @importance 0.90

0.78::true_val(switch_score_sp, v4); 0.22::true_val(switch_score_sp, unk_switch_sp).
0.88::acc(s15, switch_score_sp).
measured(s15, switch_score_sp, v4).
all_consistent(switch_score_sp) :- consistent(s15, switch_score_sp).
evidence(all_consistent(switch_score_sp)).
query(true_val(switch_score_sp, v4)).
query(true_val(switch_score_sp, unk_switch_sp)).

% @attr jumps_score_sp
% @type numeric
% @unit /5
% @canonical false
% @original_name SnowboardingProfiles jumps score
% @values v4_5=4.5 unk_jumps_sp=Unknown
% @importance 0.90

0.78::true_val(jumps_score_sp, v4_5); 0.22::true_val(jumps_score_sp, unk_jumps_sp).
0.88::acc(s15, jumps_score_sp).
measured(s15, jumps_score_sp, v4_5).
all_consistent(jumps_score_sp) :- consistent(s15, jumps_score_sp).
evidence(all_consistent(jumps_score_sp)).
query(true_val(jumps_score_sp, v4_5)).
query(true_val(jumps_score_sp, unk_jumps_sp)).

% @attr spins_score_sp
% @type numeric
% @unit /5
% @canonical false
% @original_name SnowboardingProfiles spins score
% @values v4_5=4.5 unk_spins_sp=Unknown
% @importance 0.90

0.78::true_val(spins_score_sp, v4_5); 0.22::true_val(spins_score_sp, unk_spins_sp).
0.88::acc(s15, spins_score_sp).
measured(s15, spins_score_sp, v4_5).
all_consistent(spins_score_sp) :- consistent(s15, spins_score_sp).
evidence(all_consistent(spins_score_sp)).
query(true_val(spins_score_sp, v4_5)).
query(true_val(spins_score_sp, unk_spins_sp)).

% @attr butters_score_sp
% @type numeric
% @unit /5
% @canonical false
% @original_name SnowboardingProfiles butters score
% @values v3_5=3.5 unk_butters_sp=Unknown
% @importance 0.90

0.78::true_val(butters_score_sp, v3_5); 0.22::true_val(butters_score_sp, unk_butters_sp).
0.88::acc(s15, butters_score_sp).
measured(s15, butters_score_sp, v3_5).
all_consistent(butters_score_sp) :- consistent(s15, butters_score_sp).
evidence(all_consistent(butters_score_sp)).
query(true_val(butters_score_sp, v3_5)).
query(true_val(butters_score_sp, unk_butters_sp)).

% @attr rails_score_sp
% @type numeric
% @unit /5
% @canonical false
% @original_name SnowboardingProfiles rails score
% @values v3=3.0 unk_rails_sp=Unknown
% @importance 0.90

0.78::true_val(rails_score_sp, v3); 0.22::true_val(rails_score_sp, unk_rails_sp).
0.88::acc(s15, rails_score_sp).
measured(s15, rails_score_sp, v3).
all_consistent(rails_score_sp) :- consistent(s15, rails_score_sp).
evidence(all_consistent(rails_score_sp)).
query(true_val(rails_score_sp, v3)).
query(true_val(rails_score_sp, unk_rails_sp)).

% @attr reviewer_opinion_the_good_ride_style
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (style)
% @values semi_locked_semi_aggressive=Semi_Locked_In_and_Semi_Aggressive unk_ro_tgr_s=Unknown
% @importance 0.80

0.80::true_val(reviewer_opinion_the_good_ride_style, semi_locked_semi_aggressive); 0.20::true_val(reviewer_opinion_the_good_ride_style, unk_ro_tgr_s).
0.85::acc(s109, reviewer_opinion_the_good_ride_style).
measured(s109, reviewer_opinion_the_good_ride_style, semi_locked_semi_aggressive).
all_consistent(reviewer_opinion_the_good_ride_style) :- consistent(s109, reviewer_opinion_the_good_ride_style).
evidence(all_consistent(reviewer_opinion_the_good_ride_style)).
query(true_val(reviewer_opinion_the_good_ride_style, semi_locked_semi_aggressive)).
query(true_val(reviewer_opinion_the_good_ride_style, unk_ro_tgr_s)).

% @attr chatter_performance
% @type categorical
% @canonical true
% @original_name chatter_performance
% @values more_damp_than_avg=More_damp_than_average_not_bulletproof_in_crud unk_chatter=Unknown
% @importance 0.90

0.78::true_val(chatter_performance, more_damp_than_avg); 0.22::true_val(chatter_performance, unk_chatter).
0.85::acc(s15, chatter_performance).
measured(s15, chatter_performance, more_damp_than_avg).
all_consistent(chatter_performance) :- consistent(s15, chatter_performance).
evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, more_damp_than_avg)).
query(true_val(chatter_performance, unk_chatter)).

% @attr snappiness
% @type numeric
% @unit /10
% @canonical false
% @original_name Snappiness
% @values v7=7.0 unk_snappiness=Unknown
% @importance 0.90

0.78::true_val(snappiness, v7); 0.22::true_val(snappiness, unk_snappiness).
0.85::acc(s15, snappiness).
measured(s15, snappiness, v7).
all_consistent(snappiness) :- consistent(s15, snappiness).
evidence(all_consistent(snappiness)).
query(true_val(snappiness, v7)).
query(true_val(snappiness, unk_snappiness)).

% @attr aggressiveness
% @type numeric
% @unit /10
% @canonical false
% @original_name Aggressiveness
% @values v7=7.0 unk_aggressiveness=Unknown
% @importance 0.90

0.78::true_val(aggressiveness, v7); 0.22::true_val(aggressiveness, unk_aggressiveness).
0.85::acc(s15, aggressiveness).
measured(s15, aggressiveness, v7).
all_consistent(aggressiveness) :- consistent(s15, aggressiveness).
evidence(all_consistent(aggressiveness)).
query(true_val(aggressiveness, v7)).
query(true_val(aggressiveness, unk_aggressiveness)).

% @attr positive_aspect_shallow_snow
% @type categorical
% @canonical false
% @original_name positive_aspect (shallow snow)
% @values great_no_deep_powder=Great_for_those_without_deep_powder unk_pa_ss=Unknown
% @importance 0.90

0.78::true_val(positive_aspect_shallow_snow, great_no_deep_powder); 0.22::true_val(positive_aspect_shallow_snow, unk_pa_ss).
0.85::acc(s15, positive_aspect_shallow_snow).
measured(s15, positive_aspect_shallow_snow, great_no_deep_powder).
all_consistent(positive_aspect_shallow_snow) :- consistent(s15, positive_aspect_shallow_snow).
evidence(all_consistent(positive_aspect_shallow_snow)).
query(true_val(positive_aspect_shallow_snow, great_no_deep_powder)).
query(true_val(positive_aspect_shallow_snow, unk_pa_ss)).

% @attr personality
% @type categorical
% @canonical false
% @original_name Personality
% @values middle_aggressive_playful=Right_in_the_middle_of_too_aggressive_and_too_playful unk_personality=Unknown
% @importance 0.70

0.78::true_val(personality, middle_aggressive_playful); 0.22::true_val(personality, unk_personality).
0.78::acc(s45, personality).
measured(s45, personality, middle_aggressive_playful).
all_consistent(personality) :- consistent(s45, personality).
evidence(all_consistent(personality)).
query(true_val(personality, middle_aggressive_playful)).
query(true_val(personality, unk_personality)).