0.15::indep(s1).
0.15::indep(s4).
0.15::indep(s5).
0.15::indep(s6).
0.15::indep(s7).
0.25::indep(s8).
0.15::indep(s9).
0.15::indep(s20).
0.15::indep(s21).
0.15::indep(s22).
0.15::indep(s24).
0.15::indep(s25).
0.15::indep(s26).
0.15::indep(s27).
0.15::indep(s28).
0.15::indep(s29).
0.25::indep(s30).
0.20::indep(s31).
0.15::indep(s32).
0.20::indep(s35).
0.15::indep(s36).
0.15::indep(s37).
0.15::indep(s38).
0.15::indep(s39).
0.12::indep(s40).
0.15::indep(s41).
0.15::indep(s42).
0.15::indep(s43).
0.25::indep(s45).
0.15::indep(s46).
0.15::indep(s47).
0.15::indep(s48).
0.15::indep(s54).
0.15::indep(sm).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values burton=Burton unk_brand=Unknown
% @importance 0.95

0.97::true_val(brand, burton); 0.03::true_val(brand, unk_brand).
0.82::acc(s1, brand).
0.95::acc(s2, brand).
measured(s1, brand, burton).
measured(s2, brand, burton).
all_consistent(brand) :- consistent(s2, brand), (indep(s1), consistent(s1, brand) ; \+indep(s1)).
evidence(all_consistent(brand)).
query(true_val(brand, burton)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values blossom=Blossom unk_model_name=Unknown
% @importance 0.95

0.97::true_val(model_name, blossom); 0.03::true_val(model_name, unk_model_name).
0.82::acc(s1, model_name).
0.95::acc(s2, model_name).
measured(s1, model_name, blossom).
measured(s2, model_name, blossom).
all_consistent(model_name) :- consistent(s2, model_name), (indep(s1), consistent(s1, model_name) ; \+indep(s1)).
evidence(all_consistent(model_name)).
query(true_val(model_name, blossom)).
query(true_val(model_name, unk_model_name)).

% @attr full_product_name
% @type categorical
% @canonical false
% @original_name Full product name
% @values burton_blossom_camber_snowboard=Burton_Blossom_Camber_Snowboard unk_full_product_name=Unknown
% @importance 1.0

0.85::true_val(full_product_name, burton_blossom_camber_snowboard); 0.15::true_val(full_product_name, unk_full_product_name).
0.93::acc(s2, full_product_name).
measured(s2, full_product_name, burton_blossom_camber_snowboard).
all_consistent(full_product_name) :- consistent(s2, full_product_name).
evidence(all_consistent(full_product_name)).
query(true_val(full_product_name, burton_blossom_camber_snowboard)).
query(true_val(full_product_name, unk_full_product_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2026=2026 unk_model_year=Unknown
% @importance 0.95

0.97::true_val(model_year, y2026); 0.03::true_val(model_year, unk_model_year).
0.82::acc(s1, model_year).
0.95::acc(s2, model_year).
measured(s1, model_year, y2026).
measured(s2, model_year, y2026).
all_consistent(model_year) :- consistent(s2, model_year), (indep(s1), consistent(s1, model_year) ; \+indep(s1)).
evidence(all_consistent(model_year)).
query(true_val(model_year, y2026)).
query(true_val(model_year, unk_model_year)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values y2022=2022 unk_model_first_available_year=Unknown
% @importance 0.625

0.92::true_val(model_first_available_year, y2022); 0.08::true_val(model_first_available_year, unk_model_first_available_year).
0.75::acc(s3, model_first_available_year).
0.70::acc(s4, model_first_available_year).
measured(s3, model_first_available_year, y2022).
measured(s4, model_first_available_year, y2022).
all_consistent(model_first_available_year) :- consistent(s3, model_first_available_year), (indep(s4), consistent(s4, model_first_available_year) ; \+indep(s4)).
evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2022)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr camber_type_2022
% @type categorical
% @canonical false
% @original_name camber_type (2022 debut)
% @values purepop_camber=PurePop_Camber unk_camber_type_2022=Unknown
% @importance 0.55

0.81::true_val(camber_type_2022, purepop_camber); 0.19::true_val(camber_type_2022, unk_camber_type_2022).
0.82::acc(s5, camber_type_2022).
measured(s5, camber_type_2022, purepop_camber).
all_consistent(camber_type_2022) :- consistent(s5, camber_type_2022).
evidence(all_consistent(camber_type_2022)).
query(true_val(camber_type_2022, purepop_camber)).
query(true_val(camber_type_2022, unk_camber_type_2022)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.9

0.95::true_val(product_type, snowboard); 0.05::true_val(product_type, unk_product_type).
0.82::acc(s1, product_type).
measured(s1, product_type, snowboard).
all_consistent(product_type) :- consistent(s1, product_type).
evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values freestyle_all_mountain=Freestyle_All_Mountain_Freestyle unk_board_category=Unknown
% @importance 0.8

0.95::true_val(board_category, freestyle_all_mountain); 0.05::true_val(board_category, unk_board_category).
0.82::acc(s6, board_category).
0.72::acc(s7, board_category).
measured(s6, board_category, freestyle_all_mountain).
measured(s7, board_category, freestyle_all_mountain).
all_consistent(board_category) :- consistent(s6, board_category), consistent(s7, board_category).
evidence(all_consistent(board_category)).
query(true_val(board_category, freestyle_all_mountain)).
query(true_val(board_category, unk_board_category)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values unisex=Unisex unk_gender=Unknown
% @importance 0.6

0.95::true_val(gender, unisex); 0.05::true_val(gender, unk_gender).
0.80::acc(s8, gender).
0.70::acc(s9, gender).
measured(s8, gender, unisex).
measured(s9, gender, unisex).
all_consistent(gender) :- consistent(s8, gender), consistent(s9, gender).
evidence(all_consistent(gender)).
query(true_val(gender, unisex)).
query(true_val(gender, unk_gender)).

% @attr sku_merchant
% @type categorical
% @canonical false
% @original_name SKU (merchant)
% @values sku_2294314evarg144=2294314EVARG144 unk_sku_merchant=Unknown
% @importance 0.85

0.95::true_val(sku_merchant, sku_2294314evarg144); 0.05::true_val(sku_merchant, unk_sku_merchant).
0.95::acc(sm, sku_merchant).
measured(sm, sku_merchant, sku_2294314evarg144).
all_consistent(sku_merchant) :- consistent(sm, sku_merchant).
evidence(all_consistent(sku_merchant)).
query(true_val(sku_merchant, sku_2294314evarg144)).
query(true_val(sku_merchant, unk_sku_merchant)).

% @attr burton_product_code
% @type categorical
% @canonical false
% @original_name Burton product code
% @values w26_229431=W26_229431 unk_burton_product_code=Unknown
% @importance 1.0

0.85::true_val(burton_product_code, w26_229431); 0.15::true_val(burton_product_code, unk_burton_product_code).
0.93::acc(s2, burton_product_code).
measured(s2, burton_product_code, w26_229431).
all_consistent(burton_product_code) :- consistent(s2, burton_product_code).
evidence(all_consistent(burton_product_code)).
query(true_val(burton_product_code, w26_229431)).
query(true_val(burton_product_code, unk_burton_product_code)).

% @attr graphic_designer_artist
% @type categorical
% @canonical true
% @original_name graphic_designer_artist
% @values niels_schack=Niels_Schack unk_graphic_designer_artist=Unknown
% @importance 0.325

0.90::true_val(graphic_designer_artist, niels_schack); 0.10::true_val(graphic_designer_artist, unk_graphic_designer_artist).
0.93::acc(s10, graphic_designer_artist).
0.93::acc(s11, graphic_designer_artist).
measured(s10, graphic_designer_artist, niels_schack).
measured(s11, graphic_designer_artist, niels_schack).
all_consistent(graphic_designer_artist) :- consistent(s10, graphic_designer_artist), consistent(s11, graphic_designer_artist).
evidence(all_consistent(graphic_designer_artist)).
query(true_val(graphic_designer_artist, niels_schack)).
query(true_val(graphic_designer_artist, unk_graphic_designer_artist)).

% @attr available_colors
% @type categorical
% @canonical true
% @original_name available_colors
% @values frog_and_cherry_blossom=Frog_and_Cherry_Blossom unk_available_colors=Unknown
% @importance 0.3

0.90::true_val(available_colors, frog_and_cherry_blossom); 0.10::true_val(available_colors, unk_available_colors).
0.93::acc(s12, available_colors).
measured(s12, available_colors, frog_and_cherry_blossom).
all_consistent(available_colors) :- consistent(s12, available_colors).
evidence(all_consistent(available_colors)).
query(true_val(available_colors, frog_and_cherry_blossom)).
query(true_val(available_colors, unk_available_colors)).

% @attr topsheet_appearance_description
% @type categorical
% @canonical true
% @original_name topsheet_appearance_description
% @values frog_stencil_lily_pad=Playful_frog_stencil_bright_lily_pad unk_topsheet_appearance_description=Unknown
% @importance 0.3

0.90::true_val(topsheet_appearance_description, frog_stencil_lily_pad); 0.10::true_val(topsheet_appearance_description, unk_topsheet_appearance_description).
0.93::acc(s12, topsheet_appearance_description).
measured(s12, topsheet_appearance_description, frog_stencil_lily_pad).
all_consistent(topsheet_appearance_description) :- consistent(s12, topsheet_appearance_description).
evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, frog_stencil_lily_pad)).
query(true_val(topsheet_appearance_description, unk_topsheet_appearance_description)).

% @attr topsheet_appearance_description_cherry
% @type categorical
% @canonical false
% @original_name topsheet_appearance_description (Cherry Blossom)
% @values fiery_red_palm_tree=Fiery_red_deck_palm_tree_base unk_topsheet_cherry=Unknown
% @importance 0.3

0.90::true_val(topsheet_appearance_description_cherry, fiery_red_palm_tree); 0.10::true_val(topsheet_appearance_description_cherry, unk_topsheet_cherry).
0.93::acc(s12, topsheet_appearance_description_cherry).
measured(s12, topsheet_appearance_description_cherry, fiery_red_palm_tree).
all_consistent(topsheet_appearance_description_cherry) :- consistent(s12, topsheet_appearance_description_cherry).
evidence(all_consistent(topsheet_appearance_description_cherry)).
query(true_val(topsheet_appearance_description_cherry, fiery_red_palm_tree)).
query(true_val(topsheet_appearance_description_cherry, unk_topsheet_cherry)).

% @attr design_philosophy
% @type categorical
% @canonical false
% @original_name Design philosophy
% @values rider_creative_freedom=Team_riders_creative_freedom unk_design_philosophy=Unknown
% @importance 0.3

0.81::true_val(design_philosophy, rider_creative_freedom); 0.19::true_val(design_philosophy, unk_design_philosophy).
0.90::acc(s13, design_philosophy).
measured(s13, design_philosophy, rider_creative_freedom).
all_consistent(design_philosophy) :- consistent(s13, design_philosophy).
evidence(all_consistent(design_philosophy)).
query(true_val(design_philosophy, rider_creative_freedom)).
query(true_val(design_philosophy, unk_design_philosophy)).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values burton_paramount=Burton_Paramount unk_predecessor_model_name=Unknown
% @importance 0.4

0.85::true_val(predecessor_model_name, burton_paramount); 0.15::true_val(predecessor_model_name, unk_predecessor_model_name).
0.75::acc(s14, predecessor_model_name).
measured(s14, predecessor_model_name, burton_paramount).
all_consistent(predecessor_model_name) :- consistent(s14, predecessor_model_name).
evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, burton_paramount)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).

% @attr predecessor_model_name_secondary
% @type categorical
% @canonical false
% @original_name predecessor_model_name (Free Thinker / Talent Scout)
% @values free_thinker_talent_scout=Free_Thinker_and_Talent_Scout unk_predecessor_secondary=Unknown
% @importance 0.5

0.71::true_val(predecessor_model_name_secondary, free_thinker_talent_scout); 0.29::true_val(predecessor_model_name_secondary, unk_predecessor_secondary).
0.75::acc(s15, predecessor_model_name_secondary).
measured(s15, predecessor_model_name_secondary, free_thinker_talent_scout).
all_consistent(predecessor_model_name_secondary) :- consistent(s15, predecessor_model_name_secondary).
evidence(all_consistent(predecessor_model_name_secondary)).
query(true_val(predecessor_model_name_secondary, free_thinker_talent_scout)).
query(true_val(predecessor_model_name_secondary, unk_predecessor_secondary)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values powell_winkelmann_crouch_sadowski_schack=Zeb_Powell_Luke_Winkelmann_Brock_Crouch_Zoi_Sadowski_Synnott_Niels_Schack unk_pro_rider_name=Unknown
% @importance 0.475

0.95::true_val(pro_rider_name, powell_winkelmann_crouch_sadowski_schack); 0.05::true_val(pro_rider_name, unk_pro_rider_name).
0.93::acc(s16, pro_rider_name).
0.93::acc(s17, pro_rider_name).
measured(s16, pro_rider_name, powell_winkelmann_crouch_sadowski_schack).
measured(s17, pro_rider_name, powell_winkelmann_crouch_sadowski_schack).
all_consistent(pro_rider_name) :- consistent(s16, pro_rider_name), consistent(s17, pro_rider_name).
evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, powell_winkelmann_crouch_sadowski_schack)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr changes_2026_vs_2025
% @type categorical
% @canonical false
% @original_name 2026 technical changes vs 2025
% @values no_technical_upgrades=No_technical_upgrades_new_graphics_only unk_changes_2026=Unknown
% @importance 0.6

0.92::true_val(changes_2026_vs_2025, no_technical_upgrades); 0.08::true_val(changes_2026_vs_2025, unk_changes_2026).
0.72::acc(s18, changes_2026_vs_2025).
0.72::acc(s19, changes_2026_vs_2025).
measured(s18, changes_2026_vs_2025, no_technical_upgrades).
measured(s19, changes_2026_vs_2025, no_technical_upgrades).
all_consistent(changes_2026_vs_2025) :- consistent(s18, changes_2026_vs_2025), consistent(s19, changes_2026_vs_2025).
evidence(all_consistent(changes_2026_vs_2025)).
query(true_val(changes_2026_vs_2025, no_technical_upgrades)).
query(true_val(changes_2026_vs_2025, unk_changes_2026)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v559_95=559.95 v599=599.0
% @importance 0.95

0.82::true_val(price_usd_msrp, v559_95); 0.18::true_val(price_usd_msrp, v599).
0.92::acc(s20, price_usd_msrp).
0.92::acc(s21, price_usd_msrp).
0.90::acc(s22, price_usd_msrp).
0.72::acc(s23, price_usd_msrp).
measured(s20, price_usd_msrp, v559_95).
measured(s21, price_usd_msrp, v559_95).
measured(s22, price_usd_msrp, v559_95).
measured(s23, price_usd_msrp, v599).
all_consistent(price_usd_msrp) :- consistent(s20, price_usd_msrp), consistent(s21, price_usd_msrp), consistent(s22, price_usd_msrp), consistent(s23, price_usd_msrp).
evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v559_95)).
query(true_val(price_usd_msrp, v599)).

% @attr price_aud_merchant
% @type numeric
% @canonical true
% @original_name price_aud_merchant
% @unit AUD
% @values v679_99=679.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.95::true_val(price_aud_merchant, v679_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).
0.95::acc(sm, price_aud_merchant).
measured(sm, price_aud_merchant, v679_99).
all_consistent(price_aud_merchant) :- consistent(sm, price_aud_merchant).
evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v679_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_aud_merchant_rrp
% @type numeric
% @canonical false
% @original_name price_aud_merchant (RRP)
% @unit AUD
% @values v849_99=849.99 unk_price_aud_rrp=Unknown
% @importance 0.85

0.95::true_val(price_aud_merchant_rrp, v849_99); 0.05::true_val(price_aud_merchant_rrp, unk_price_aud_rrp).
0.95::acc(sm, price_aud_merchant_rrp).
measured(sm, price_aud_merchant_rrp, v849_99).
all_consistent(price_aud_merchant_rrp) :- consistent(sm, price_aud_merchant_rrp).
evidence(all_consistent(price_aud_merchant_rrp)).
query(true_val(price_aud_merchant_rrp, v849_99)).
query(true_val(price_aud_merchant_rrp, unk_price_aud_rrp)).

% @attr merchant_discount
% @type numeric
% @canonical false
% @original_name Merchant discount
% @unit percent
% @values v20=20.0 unk_merchant_discount=Unknown
% @importance 0.85

0.95::true_val(merchant_discount, v20); 0.05::true_val(merchant_discount, unk_merchant_discount).
0.95::acc(sm, merchant_discount).
measured(sm, merchant_discount, v20).
all_consistent(merchant_discount) :- consistent(sm, merchant_discount).
evidence(all_consistent(merchant_discount)).
query(true_val(merchant_discount, v20)).
query(true_val(merchant_discount, unk_merchant_discount)).

% @attr price_usd_evo
% @type numeric
% @canonical false
% @original_name Price at evo
% @unit USD
% @values v559_95_evo=559.95 unk_price_evo=Unknown
% @importance 0.7

0.85::true_val(price_usd_evo, v559_95_evo); 0.15::true_val(price_usd_evo, unk_price_evo).
0.85::acc(s24, price_usd_evo).
measured(s24, price_usd_evo, v559_95_evo).
all_consistent(price_usd_evo) :- consistent(s24, price_usd_evo).
evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v559_95_evo)).
query(true_val(price_usd_evo, unk_price_evo)).

% @attr price_darkside
% @type numeric
% @canonical false
% @original_name Price at Darkside Snowboards
% @unit USD
% @values v559_95_ds=559.95 unk_price_darkside=Unknown
% @importance 0.95

0.85::true_val(price_darkside, v559_95_ds); 0.15::true_val(price_darkside, unk_price_darkside).
0.78::acc(s20, price_darkside).
measured(s20, price_darkside, v559_95_ds).
all_consistent(price_darkside) :- consistent(s20, price_darkside).
evidence(all_consistent(price_darkside)).
query(true_val(price_darkside, v559_95_ds)).
query(true_val(price_darkside, unk_price_darkside)).

% @attr price_aspen
% @type numeric
% @canonical false
% @original_name Price at Aspen Ski and Board
% @unit USD
% @values v559_99=559.99 unk_price_aspen=Unknown
% @importance 0.8

0.80::true_val(price_aspen, v559_99); 0.20::true_val(price_aspen, unk_price_aspen).
0.72::acc(s26, price_aspen).
measured(s26, price_aspen, v559_99).
all_consistent(price_aspen) :- consistent(s26, price_aspen).
evidence(all_consistent(price_aspen)).
query(true_val(price_aspen, v559_99)).
query(true_val(price_aspen, unk_price_aspen)).

% @attr price_source_snowboard
% @type numeric
% @canonical false
% @original_name Price at The Source Snowboard
% @unit USD
% @values v555=555.0 unk_price_source=Unknown
% @importance 0.8

0.80::true_val(price_source_snowboard, v555); 0.20::true_val(price_source_snowboard, unk_price_source).
0.72::acc(s27, price_source_snowboard).
measured(s27, price_source_snowboard, v555).
all_consistent(price_source_snowboard) :- consistent(s27, price_source_snowboard).
evidence(all_consistent(price_source_snowboard)).
query(true_val(price_source_snowboard, v555)).
query(true_val(price_source_snowboard, unk_price_source)).

% @attr price_ski_chalet
% @type categorical
% @canonical false
% @original_name Price at The Ski Chalet
% @values msrp_559_95_sale_447_96=MSRP_559_95_sale_447_96_sold_out unk_price_ski_chalet=Unknown
% @importance 0.8

0.80::true_val(price_ski_chalet, msrp_559_95_sale_447_96); 0.20::true_val(price_ski_chalet, unk_price_ski_chalet).
0.72::acc(s28, price_ski_chalet).
measured(s28, price_ski_chalet, msrp_559_95_sale_447_96).
all_consistent(price_ski_chalet) :- consistent(s28, price_ski_chalet).
evidence(all_consistent(price_ski_chalet)).
query(true_val(price_ski_chalet, msrp_559_95_sale_447_96)).
query(true_val(price_ski_chalet, unk_price_ski_chalet)).

% @attr price_bluezone
% @type numeric
% @canonical false
% @original_name Price at BlueZone Sports
% @unit USD
% @values v559_95_bz=559.95 unk_price_bluezone=Unknown
% @importance 0.8

0.85::true_val(price_bluezone, v559_95_bz); 0.15::true_val(price_bluezone, unk_price_bluezone).
0.78::acc(s29, price_bluezone).
measured(s29, price_bluezone, v559_95_bz).
all_consistent(price_bluezone) :- consistent(s29, price_bluezone).
evidence(all_consistent(price_bluezone)).
query(true_val(price_bluezone, v559_95_bz)).
query(true_val(price_bluezone, unk_price_bluezone)).

% @attr price_peter_glenn
% @type numeric
% @canonical false
% @original_name Price at Peter Glenn
% @unit USD
% @values v559_95_pg=559.95 unk_price_peter_glenn=Unknown
% @importance 0.7

0.82::true_val(price_peter_glenn, v559_95_pg); 0.18::true_val(price_peter_glenn, unk_price_peter_glenn).
0.80::acc(s30, price_peter_glenn).
measured(s30, price_peter_glenn, v559_95_pg).
all_consistent(price_peter_glenn) :- consistent(s30, price_peter_glenn).
evidence(all_consistent(price_peter_glenn)).
query(true_val(price_peter_glenn, v559_95_pg)).
query(true_val(price_peter_glenn, unk_price_peter_glenn)).

% @attr price_ebay
% @type numeric
% @canonical false
% @original_name Price at eBay (new)
% @unit USD
% @values v559_95_eb=559.95 unk_price_ebay=Unknown
% @importance 0.7

0.70::true_val(price_ebay, v559_95_eb); 0.30::true_val(price_ebay, unk_price_ebay).
0.55::acc(s31, price_ebay).
measured(s31, price_ebay, v559_95_eb).
all_consistent(price_ebay) :- consistent(s31, price_ebay).
evidence(all_consistent(price_ebay)).
query(true_val(price_ebay, v559_95_eb)).
query(true_val(price_ebay, unk_price_ebay)).

% @attr price_people_skate
% @type numeric
% @canonical false
% @original_name Price at People Skate and Snowboard
% @unit USD
% @values v559_95_ps=559.95 unk_price_people_skate=Unknown
% @importance 0.6

0.80::true_val(price_people_skate, v559_95_ps); 0.20::true_val(price_people_skate, unk_price_people_skate).
0.72::acc(s32, price_people_skate).
measured(s32, price_people_skate, v559_95_ps).
all_consistent(price_people_skate) :- consistent(s32, price_people_skate).
evidence(all_consistent(price_people_skate)).
query(true_val(price_people_skate, v559_95_ps)).
query(true_val(price_people_skate, unk_price_people_skate)).

% @attr price_vs_average
% @type categorical
% @canonical false
% @original_name Price vs average snowboard
% @values above_avg_by_48=Above_avg_by_48_05_vs_468_01 unk_price_vs_average=Unknown
% @importance 0.725

0.65::true_val(price_vs_average, above_avg_by_48); 0.35::true_val(price_vs_average, unk_price_vs_average).
0.62::acc(s33, price_vs_average).
0.68::acc(s34, price_vs_average).
measured(s33, price_vs_average, above_avg_by_48).
measured(s34, price_vs_average, above_avg_by_48).
all_consistent(price_vs_average) :- consistent(s33, price_vs_average), consistent(s34, price_vs_average).
evidence(all_consistent(price_vs_average)).
query(true_val(price_vs_average, above_avg_by_48)).
query(true_val(price_vs_average, unk_price_vs_average)).

% @attr shipping_restriction
% @type categorical
% @canonical false
% @original_name Shipping restriction (merchant verified)
% @values australia_only=Australia_only unk_shipping_restriction=Unknown
% @importance 0.85

0.95::true_val(shipping_restriction, australia_only); 0.05::true_val(shipping_restriction, unk_shipping_restriction).
0.95::acc(sm, shipping_restriction).
measured(sm, shipping_restriction, australia_only).
all_consistent(shipping_restriction) :- consistent(sm, shipping_restriction).
evidence(all_consistent(shipping_restriction)).
query(true_val(shipping_restriction, australia_only)).
query(true_val(shipping_restriction, unk_shipping_restriction)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name Available at burton.com
% @values available_burton=Available_burton_com unk_availability_status=Unknown
% @importance 1.0

0.85::true_val(availability_status, available_burton); 0.15::true_val(availability_status, unk_availability_status).
0.90::acc(s2, availability_status).
measured(s2, availability_status, available_burton).
all_consistent(availability_status) :- consistent(s2, availability_status).
evidence(all_consistent(availability_status)).
query(true_val(availability_status, available_burton)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name Available at evo.com
% @values available_evo=Available_evo_com unk_avail_evo=Unknown
% @importance 0.7

0.85::true_val(availability_status_evo, available_evo); 0.15::true_val(availability_status_evo, unk_avail_evo).
0.82::acc(s24, availability_status_evo).
measured(s24, availability_status_evo, available_evo).
all_consistent(availability_status_evo) :- consistent(s24, availability_status_evo).
evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, available_evo)).
query(true_val(availability_status_evo, unk_avail_evo)).

% @attr availability_status_backcountry
% @type categorical
% @canonical false
% @original_name Available at backcountry.com
% @values available_backcountry=Available_backcountry_com unk_avail_backcountry=Unknown
% @importance 0.7

0.82::true_val(availability_status_backcountry, available_backcountry); 0.18::true_val(availability_status_backcountry, unk_avail_backcountry).
0.80::acc(s35, availability_status_backcountry).
measured(s35, availability_status_backcountry, available_backcountry).
all_consistent(availability_status_backcountry) :- consistent(s35, availability_status_backcountry).
evidence(all_consistent(availability_status_backcountry)).
query(true_val(availability_status_backcountry, available_backcountry)).
query(true_val(availability_status_backcountry, unk_avail_backcountry)).

% @attr availability_status_peter_glenn
% @type categorical
% @canonical false
% @original_name Available at Peter Glenn
% @values available_pg=Available_Peter_Glenn unk_avail_pg=Unknown
% @importance 0.7

0.82::true_val(availability_status_peter_glenn, available_pg); 0.18::true_val(availability_status_peter_glenn, unk_avail_pg).
0.80::acc(s30, availability_status_peter_glenn).
measured(s30, availability_status_peter_glenn, available_pg).
all_consistent(availability_status_peter_glenn) :- consistent(s30, availability_status_peter_glenn).
evidence(all_consistent(availability_status_peter_glenn)).
query(true_val(availability_status_peter_glenn, available_pg)).
query(true_val(availability_status_peter_glenn, unk_avail_pg)).

% @attr availability_status_bluezone
% @type categorical
% @canonical false
% @original_name Available at BlueZone Sports
% @values available_bz=Available_BlueZone unk_avail_bz=Unknown
% @importance 0.8

0.82::true_val(availability_status_bluezone, available_bz); 0.18::true_val(availability_status_bluezone, unk_avail_bz).
0.78::acc(s29, availability_status_bluezone).
measured(s29, availability_status_bluezone, available_bz).
all_consistent(availability_status_bluezone) :- consistent(s29, availability_status_bluezone).
evidence(all_consistent(availability_status_bluezone)).
query(true_val(availability_status_bluezone, available_bz)).
query(true_val(availability_status_bluezone, unk_avail_bz)).

% @attr availability_status_darkside
% @type categorical
% @canonical false
% @original_name Available at Darkside Snowboards
% @values available_darkside=Available_Darkside unk_avail_darkside=Unknown
% @importance 0.95

0.82::true_val(availability_status_darkside, available_darkside); 0.18::true_val(availability_status_darkside, unk_avail_darkside).
0.78::acc(s36, availability_status_darkside).
measured(s36, availability_status_darkside, available_darkside).
all_consistent(availability_status_darkside) :- consistent(s36, availability_status_darkside).
evidence(all_consistent(availability_status_darkside)).
query(true_val(availability_status_darkside, available_darkside)).
query(true_val(availability_status_darkside, unk_avail_darkside)).

% @attr availability_status_aspen
% @type categorical
% @canonical false
% @original_name Available at Aspen Ski and Board
% @values available_aspen=Available_Aspen_Ski unk_avail_aspen=Unknown
% @importance 0.8

0.80::true_val(availability_status_aspen, available_aspen); 0.20::true_val(availability_status_aspen, unk_avail_aspen).
0.72::acc(s26, availability_status_aspen).
measured(s26, availability_status_aspen, available_aspen).
all_consistent(availability_status_aspen) :- consistent(s26, availability_status_aspen).
evidence(all_consistent(availability_status_aspen)).
query(true_val(availability_status_aspen, available_aspen)).
query(true_val(availability_status_aspen, unk_avail_aspen)).

% @attr availability_status_source
% @type categorical
% @canonical false
% @original_name Available at The Source Snowboard (sold out)
% @values sold_out_source=Sold_out unk_avail_source=Unknown
% @importance 0.8

0.80::true_val(availability_status_source, sold_out_source); 0.20::true_val(availability_status_source, unk_avail_source).
0.72::acc(s27, availability_status_source).
measured(s27, availability_status_source, sold_out_source).
all_consistent(availability_status_source) :- consistent(s27, availability_status_source).
evidence(all_consistent(availability_status_source)).
query(true_val(availability_status_source, sold_out_source)).
query(true_val(availability_status_source, unk_avail_source)).

% @attr availability_status_ski_chalet
% @type categorical
% @canonical false
% @original_name Available at The Ski Chalet (sold out)
% @values sold_out_chalet=Sold_out unk_avail_chalet=Unknown
% @importance 0.8

0.80::true_val(availability_status_ski_chalet, sold_out_chalet); 0.20::true_val(availability_status_ski_chalet, unk_avail_chalet).
0.72::acc(s28, availability_status_ski_chalet).
measured(s28, availability_status_ski_chalet, sold_out_chalet).
all_consistent(availability_status_ski_chalet) :- consistent(s28, availability_status_ski_chalet).
evidence(all_consistent(availability_status_ski_chalet)).
query(true_val(availability_status_ski_chalet, sold_out_chalet)).
query(true_val(availability_status_ski_chalet, unk_avail_chalet)).

% @attr availability_status_skiis_biikes
% @type categorical
% @canonical false
% @original_name Available at Skiis and Biikes (Canada)
% @values available_skiis=Available_Skiis_Biikes unk_avail_skiis=Unknown
% @importance 0.5

0.78::true_val(availability_status_skiis_biikes, available_skiis); 0.22::true_val(availability_status_skiis_biikes, unk_avail_skiis).
0.70::acc(s37, availability_status_skiis_biikes).
measured(s37, availability_status_skiis_biikes, available_skiis).
all_consistent(availability_status_skiis_biikes) :- consistent(s37, availability_status_skiis_biikes).
evidence(all_consistent(availability_status_skiis_biikes)).
query(true_val(availability_status_skiis_biikes, available_skiis)).
query(true_val(availability_status_skiis_biikes, unk_avail_skiis)).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name Available at Blauer Board Shop
% @values available_blauer=Available_Blauer unk_avail_blauer=Unknown
% @importance 0.8

0.80::true_val(availability_status_blauer, available_blauer); 0.20::true_val(availability_status_blauer, unk_avail_blauer).
0.72::acc(s38, availability_status_blauer).
measured(s38, availability_status_blauer, available_blauer).
all_consistent(availability_status_blauer) :- consistent(s38, availability_status_blauer).
evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, available_blauer)).
query(true_val(availability_status_blauer, unk_avail_blauer)).

% @attr availability_status_people_skate
% @type categorical
% @canonical false
% @original_name Available at People Skate and Snowboard
% @values available_people=Available_People_Skate unk_avail_people=Unknown
% @importance 0.6

0.80::true_val(availability_status_people_skate, available_people); 0.20::true_val(availability_status_people_skate, unk_avail_people).
0.72::acc(s32, availability_status_people_skate).
measured(s32, availability_status_people_skate, available_people).
all_consistent(availability_status_people_skate) :- consistent(s32, availability_status_people_skate).
evidence(all_consistent(availability_status_people_skate)).
query(true_val(availability_status_people_skate, available_people)).
query(true_val(availability_status_people_skate, unk_avail_people)).

% @attr availability_status_ebay
% @type categorical
% @canonical false
% @original_name Available at eBay (new)
% @values available_ebay=Available_eBay unk_avail_ebay=Unknown
% @importance 0.7

0.68::true_val(availability_status_ebay, available_ebay); 0.32::true_val(availability_status_ebay, unk_avail_ebay).
0.55::acc(s31, availability_status_ebay).
measured(s31, availability_status_ebay, available_ebay).
all_consistent(availability_status_ebay) :- consistent(s31, availability_status_ebay).
evidence(all_consistent(availability_status_ebay)).
query(true_val(availability_status_ebay, available_ebay)).
query(true_val(availability_status_ebay, unk_avail_ebay)).

% @attr availability_status_amazon
% @type categorical
% @canonical false
% @original_name Available at Amazon.com
% @values available_amazon=Available_Amazon unk_avail_amazon=Unknown
% @importance 0.7

0.78::true_val(availability_status_amazon, available_amazon); 0.22::true_val(availability_status_amazon, unk_avail_amazon).
0.75::acc(s39, availability_status_amazon).
measured(s39, availability_status_amazon, available_amazon).
all_consistent(availability_status_amazon) :- consistent(s39, availability_status_amazon).
evidence(all_consistent(availability_status_amazon)).
query(true_val(availability_status_amazon, available_amazon)).
query(true_val(availability_status_amazon, unk_avail_amazon)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values burton_snowboards=Burton_Snowboards_Burlington_VT_B_Corp unk_manufacturer=Unknown
% @importance 1.0

0.85::true_val(manufacturer, burton_snowboards); 0.15::true_val(manufacturer, unk_manufacturer).
0.95::acc(s2, manufacturer).
measured(s2, manufacturer, burton_snowboards).
all_consistent(manufacturer) :- consistent(s2, manufacturer).
evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, burton_snowboards)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values true_twin=True_Twin unk_shape=Unknown
% @importance 0.9

0.95::true_val(shape, true_twin); 0.05::true_val(shape, unk_shape).
0.82::acc(s1, shape).
0.82::acc(s6, shape).
measured(s1, shape, true_twin).
measured(s6, shape, true_twin).
all_consistent(shape) :- consistent(s1, shape), consistent(s6, shape).
evidence(all_consistent(shape)).
query(true_val(shape, true_twin)).
query(true_val(shape, unk_shape)).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values twin_flex=Twin_Flex_symmetrical unk_flex_direction=Unknown
% @importance 0.9

0.95::true_val(flex_direction, twin_flex); 0.05::true_val(flex_direction, unk_flex_direction).
0.82::acc(s1, flex_direction).
0.82::acc(s6, flex_direction).
measured(s1, flex_direction, twin_flex).
measured(s6, flex_direction, twin_flex).
all_consistent(flex_direction) :- consistent(s1, flex_direction), consistent(s6, flex_direction).
evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, twin_flex)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values traditional_camber=Traditional_Camber unk_camber_type=Unknown
% @importance 0.9

0.95::true_val(camber_type, traditional_camber); 0.05::true_val(camber_type, unk_camber_type).
0.82::acc(s1, camber_type).
0.82::acc(s6, camber_type).
measured(s1, camber_type, traditional_camber).
measured(s6, camber_type, traditional_camber).
all_consistent(camber_type) :- consistent(s1, camber_type), consistent(s6, camber_type).
evidence(all_consistent(camber_type)).
query(true_val(camber_type, traditional_camber)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical false
% @original_name camber_description
% @values precise_turning_edge_pop=Precise_turning_edge_control_spring_pop unk_camber_description=Unknown
% @importance 0.9

0.82::true_val(camber_description, precise_turning_edge_pop); 0.18::true_val(camber_description, unk_camber_description).
0.82::acc(s6, camber_description).
measured(s6, camber_description, precise_turning_edge_pop).
all_consistent(camber_description) :- consistent(s6, camber_description).
evidence(all_consistent(camber_description)).
query(true_val(camber_description, precise_turning_edge_pop)).
query(true_val(camber_description, unk_camber_description)).

% @attr camber_height_mm
% @type numeric
% @canonical true
% @original_name camber_height_mm
% @unit mm
% @values v7=7.0 unk_camber_height_mm=Unknown
% @importance 0.95

0.76::true_val(camber_height_mm, v7); 0.24::true_val(camber_height_mm, unk_camber_height_mm).
0.78::acc(s23, camber_height_mm).
measured(s23, camber_height_mm, v7).
all_consistent(camber_height_mm) :- consistent(s23, camber_height_mm).
evidence(all_consistent(camber_height_mm)).
query(true_val(camber_height_mm, v7)).
query(true_val(camber_height_mm, unk_camber_height_mm)).

% @attr setback
% @type numeric
% @canonical true
% @original_name setback
% @unit cm
% @values v0=0.0 unk_setback=Unknown
% @importance 0.9

0.95::true_val(setback, v0); 0.05::true_val(setback, unk_setback).
0.93::acc(sm, setback).
0.78::acc(s23, setback).
measured(sm, setback, v0).
measured(s23, setback, v0).
all_consistent(setback) :- consistent(sm, setback), consistent(s23, setback).
evidence(all_consistent(setback)).
query(true_val(setback, v0)).
query(true_val(setback, unk_setback)).

% @attr nose_tail_design
% @type categorical
% @canonical false
% @original_name Nose/tail design
% @values pro_tip=Pro_Tip_tapered_reduces_swing_weight unk_nose_tail=Unknown
% @importance 0.6

0.90::true_val(nose_tail_design, pro_tip); 0.10::true_val(nose_tail_design, unk_nose_tail).
0.72::acc(s40, nose_tail_design).
0.72::acc(s41, nose_tail_design).
measured(s40, nose_tail_design, pro_tip).
measured(s41, nose_tail_design, pro_tip).
all_consistent(nose_tail_design) :- consistent(s40, nose_tail_design), consistent(s41, nose_tail_design).
evidence(all_consistent(nose_tail_design)).
query(true_val(nose_tail_design, pro_tip)).
query(true_val(nose_tail_design, unk_nose_tail)).

% @attr sidecut_type
% @type categorical
% @canonical false
% @original_name sidecut_type
% @values single_radius=Single_radius unk_sidecut_type=Unknown
% @importance 0.85

0.95::true_val(sidecut_type, single_radius); 0.05::true_val(sidecut_type, unk_sidecut_type).
0.93::acc(sm, sidecut_type).
measured(sm, sidecut_type, single_radius).
all_consistent(sidecut_type) :- consistent(sm, sidecut_type).
evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, single_radius)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @original_name flex_rating_10
% @unit /10
% @values v7_5=7.5 v6_to_9=6-9 v3_to_6=3-6
% @importance 0.85

0.55::true_val(flex_rating_10, v7_5); 0.35::true_val(flex_rating_10, v6_to_9); 0.10::true_val(flex_rating_10, v3_to_6).
0.92::acc(sm, flex_rating_10).
0.72::acc(s38, flex_rating_10).
0.45::acc(s42, flex_rating_10).
measured(sm, flex_rating_10, v7_5).
measured(s38, flex_rating_10, v6_to_9).
measured(s42, flex_rating_10, v3_to_6).
all_consistent(flex_rating_10) :- consistent(sm, flex_rating_10), (indep(s38), consistent(s38, flex_rating_10) ; \+indep(s38)), (indep(s42), consistent(s42, flex_rating_10) ; \+indep(s42)).
evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v7_5)).
query(true_val(flex_rating_10, v6_to_9)).
query(true_val(flex_rating_10, v3_to_6)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values mid_stiff=Mid_Stiff_6_5_10 medium=Medium unk_flex_feel=Unknown
% @importance 0.85

0.55::true_val(flex_feel, mid_stiff); 0.40::true_val(flex_feel, medium); 0.05::true_val(flex_feel, unk_flex_feel).
0.82::acc(s23, flex_feel).
0.70::acc(s44, flex_feel).
measured(s23, flex_feel, mid_stiff).
measured(s44, flex_feel, medium).
all_consistent(flex_feel) :- consistent(s23, flex_feel), consistent(s44, flex_feel).
evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, mid_stiff)).
query(true_val(flex_feel, medium)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr flex_pattern
% @type categorical
% @canonical false
% @original_name Flex pattern
% @values squeezebox=Squeezebox_profiled_core unk_flex_pattern=Unknown
% @importance 0.8

0.95::true_val(flex_pattern, squeezebox); 0.05::true_val(flex_pattern, unk_flex_pattern).
0.82::acc(s1, flex_pattern).
0.82::acc(s43, flex_pattern).
measured(s1, flex_pattern, squeezebox).
measured(s43, flex_pattern, squeezebox).
all_consistent(flex_pattern) :- consistent(s1, flex_pattern), consistent(s43, flex_pattern).
evidence(all_consistent(flex_pattern)).
query(true_val(flex_pattern, squeezebox)).
query(true_val(flex_pattern, unk_flex_pattern)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values super_fly_ii_700g=Super_Fly_II_700G unk_core_material=Unknown
% @importance 0.9

0.95::true_val(core_material, super_fly_ii_700g); 0.05::true_val(core_material, unk_core_material).
0.82::acc(s1, core_material).
0.82::acc(s6, core_material).
measured(s1, core_material, super_fly_ii_700g).
measured(s6, core_material, super_fly_ii_700g).
all_consistent(core_material) :- consistent(s1, core_material), consistent(s6, core_material).
evidence(all_consistent(core_material)).
query(true_val(core_material, super_fly_ii_700g)).
query(true_val(core_material, unk_core_material)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation (Dualzone EGD)
% @values dualzone_egd=Dualzone_EGD unk_construction_material_innovation=Unknown
% @importance 0.8

0.95::true_val(construction_material_innovation, dualzone_egd); 0.05::true_val(construction_material_innovation, unk_construction_material_innovation).
0.82::acc(s6, construction_material_innovation).
0.80::acc(s45, construction_material_innovation).
measured(s6, construction_material_innovation, dualzone_egd).
measured(s45, construction_material_innovation, dualzone_egd).
all_consistent(construction_material_innovation) :- consistent(s6, construction_material_innovation), (indep(s45), consistent(s45, construction_material_innovation) ; \+indep(s45)).
evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, dualzone_egd)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr construction_squeezebox
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Squeezebox)
% @values squeezebox_core=Squeezebox_balances_core_sections unk_construction_squeezebox=Unknown
% @importance 0.8

0.95::true_val(construction_squeezebox, squeezebox_core); 0.05::true_val(construction_squeezebox, unk_construction_squeezebox).
0.82::acc(s1, construction_squeezebox).
0.82::acc(s43, construction_squeezebox).
measured(s1, construction_squeezebox, squeezebox_core).
measured(s43, construction_squeezebox, squeezebox_core).
all_consistent(construction_squeezebox) :- consistent(s1, construction_squeezebox), consistent(s43, construction_squeezebox).
evidence(all_consistent(construction_squeezebox)).
query(true_val(construction_squeezebox, squeezebox_core)).
query(true_val(construction_squeezebox, unk_construction_squeezebox)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values triax_fiberglass=Triax_Fiberglass unk_laminate=Unknown
% @importance 0.9

0.95::true_val(laminate, triax_fiberglass); 0.05::true_val(laminate, unk_laminate).
0.82::acc(s1, laminate).
0.82::acc(s6, laminate).
measured(s1, laminate, triax_fiberglass).
measured(s6, laminate, triax_fiberglass).
all_consistent(laminate) :- consistent(s1, laminate), consistent(s6, laminate).
evidence(all_consistent(laminate)).
query(true_val(laminate, triax_fiberglass)).
query(true_val(laminate, unk_laminate)).

% @attr construction_carbon_ibeam
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Carbon I-Beam)
% @values carbon_ibeam=Carbon_I_Beam_ultralight_backbone unk_carbon_ibeam=Unknown
% @importance 0.9

0.95::true_val(construction_carbon_ibeam, carbon_ibeam); 0.05::true_val(construction_carbon_ibeam, unk_carbon_ibeam).
0.82::acc(s1, construction_carbon_ibeam).
0.82::acc(s6, construction_carbon_ibeam).
measured(s1, construction_carbon_ibeam, carbon_ibeam).
measured(s6, construction_carbon_ibeam, carbon_ibeam).
all_consistent(construction_carbon_ibeam) :- consistent(s1, construction_carbon_ibeam), consistent(s6, construction_carbon_ibeam).
evidence(all_consistent(construction_carbon_ibeam)).
query(true_val(construction_carbon_ibeam, carbon_ibeam)).
query(true_val(construction_carbon_ibeam, unk_carbon_ibeam)).

% @attr resin
% @type categorical
% @canonical false
% @original_name resin
% @values super_sap_epoxy=Super_Sap_Epoxy_bio_based unk_resin=Unknown
% @importance 0.7

0.95::true_val(resin, super_sap_epoxy); 0.05::true_val(resin, unk_resin).
0.82::acc(s6, resin).
0.82::acc(s46, resin).
measured(s6, resin, super_sap_epoxy).
measured(s46, resin, super_sap_epoxy).
all_consistent(resin) :- consistent(s6, resin), consistent(s46, resin).
evidence(all_consistent(resin)).
query(true_val(resin, super_sap_epoxy)).
query(true_val(resin, unk_resin)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values recycled_sintered_wfo=Recycled_Sintered_WFO unk_base_material=Unknown
% @importance 0.9

0.95::true_val(base_material, recycled_sintered_wfo); 0.05::true_val(base_material, unk_base_material).
0.82::acc(s1, base_material).
0.82::acc(s6, base_material).
measured(s1, base_material, recycled_sintered_wfo).
measured(s6, base_material, recycled_sintered_wfo).
all_consistent(base_material) :- consistent(s1, base_material), consistent(s6, base_material).
evidence(all_consistent(base_material)).
query(true_val(base_material, recycled_sintered_wfo)).
query(true_val(base_material, unk_base_material)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values highest_quality_fast=Highest_quality_extra_absorbent_super_fast unk_base_glide=Unknown
% @importance 0.775

0.92::true_val(base_glide_performance, highest_quality_fast); 0.08::true_val(base_glide_performance, unk_base_glide).
0.80::acc(s30, base_glide_performance).
0.72::acc(s49, base_glide_performance).
measured(s30, base_glide_performance, highest_quality_fast).
measured(s49, base_glide_performance, highest_quality_fast).
all_consistent(base_glide_performance) :- (indep(s30), consistent(s30, base_glide_performance) ; \+indep(s30)), consistent(s49, base_glide_performance).
evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, highest_quality_fast)).
query(true_val(base_glide_performance, unk_base_glide)).

% @attr edge_technology
% @type categorical
% @canonical false
% @original_name edge_technology
% @values frostbite_edges=Frostbite_Edges_enhanced_edge_hold unk_edge_technology=Unknown
% @importance 0.85

0.95::true_val(edge_technology, frostbite_edges); 0.05::true_val(edge_technology, unk_edge_technology).
0.93::acc(sm, edge_technology).
measured(sm, edge_technology, frostbite_edges).
all_consistent(edge_technology) :- consistent(sm, edge_technology).
evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, frostbite_edges)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr construction_infinite_ride
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Infinite Ride)
% @values infinite_ride=Infinite_Ride_consistent_pop unk_infinite_ride=Unknown
% @importance 0.775

0.95::true_val(construction_infinite_ride, infinite_ride); 0.05::true_val(construction_infinite_ride, unk_infinite_ride).
0.82::acc(s1, construction_infinite_ride).
0.82::acc(s6, construction_infinite_ride).
0.80::acc(s47, construction_infinite_ride).
measured(s1, construction_infinite_ride, infinite_ride).
measured(s6, construction_infinite_ride, infinite_ride).
measured(s47, construction_infinite_ride, infinite_ride).
all_consistent(construction_infinite_ride) :- consistent(s1, construction_infinite_ride), consistent(s6, construction_infinite_ride), (indep(s47), consistent(s47, construction_infinite_ride) ; \+indep(s47)).
evidence(all_consistent(construction_infinite_ride)).
query(true_val(construction_infinite_ride, infinite_ride)).
query(true_val(construction_infinite_ride, unk_infinite_ride)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values the_channel=The_Channel_micro_adjustable unk_mounting_pattern=Unknown
% @importance 0.8

0.95::true_val(mounting_pattern, the_channel); 0.05::true_val(mounting_pattern, unk_mounting_pattern).
0.82::acc(s1, mounting_pattern).
0.82::acc(s6, mounting_pattern).
0.72::acc(s48, mounting_pattern).
measured(s1, mounting_pattern, the_channel).
measured(s6, mounting_pattern, the_channel).
measured(s48, mounting_pattern, the_channel).
all_consistent(mounting_pattern) :- consistent(s1, mounting_pattern), consistent(s6, mounting_pattern), (indep(s48), consistent(s48, mounting_pattern) ; \+indep(s48)).
evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, the_channel)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr binding_compatibility
% @type categorical
% @canonical false
% @original_name binding_compatibility
% @values est_and_all_major=EST_and_all_major_brands unk_binding=Unknown
% @importance 0.65

0.90::true_val(binding_compatibility, est_and_all_major); 0.10::true_val(binding_compatibility, unk_binding).
0.78::acc(s36, binding_compatibility).
0.72::acc(s48, binding_compatibility).
measured(s36, binding_compatibility, est_and_all_major).
measured(s48, binding_compatibility, est_and_all_major).
all_consistent(binding_compatibility) :- consistent(s36, binding_compatibility), consistent(s48, binding_compatibility).
evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, est_and_all_major)).
query(true_val(binding_compatibility, unk_binding)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values s144_149_152_155_158_162=144_149_152_155_158_162cm unk_available_sizes=Unknown
% @importance 0.85

0.95::true_val(available_sizes, s144_149_152_155_158_162); 0.05::true_val(available_sizes, unk_available_sizes).
0.95::acc(sm, available_sizes).
measured(sm, available_sizes, s144_149_152_155_158_162).
all_consistent(available_sizes) :- consistent(sm, available_sizes).
evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, s144_149_152_155_158_162)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 0.85

0.95::true_val(width_options, standard_wide); 0.05::true_val(width_options, unk_width_options).
0.95::acc(sm, width_options).
measured(sm, width_options, standard_wide).
all_consistent(width_options) :- consistent(sm, width_options).
evidence(all_consistent(width_options)).
query(true_val(width_options, standard_wide)).
query(true_val(width_options, unk_width_options)).

% @attr effective_edge_144
% @type numeric
% @canonical false
% @original_name Effective edge 144cm
% @unit cm
% @values v107_5=107.5 unk_ee144=Unknown
% @importance 0.85

0.95::true_val(effective_edge_144, v107_5); 0.05::true_val(effective_edge_144, unk_ee144).
0.93::acc(sm, effective_edge_144).
measured(sm, effective_edge_144, v107_5).
all_consistent(effective_edge_144) :- consistent(sm, effective_edge_144).
evidence(all_consistent(effective_edge_144)).
query(true_val(effective_edge_144, v107_5)).
query(true_val(effective_edge_144, unk_ee144)).

% @attr sidecut_radius_size_144
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (144cm)
% @unit m
% @values v7_0=7.0 unk_scr144=Unknown
% @importance 0.85

0.95::true_val(sidecut_radius_size_144, v7_0); 0.05::true_val(sidecut_radius_size_144, unk_scr144).
0.93::acc(sm, sidecut_radius_size_144).
measured(sm, sidecut_radius_size_144, v7_0).
all_consistent(sidecut_radius_size_144) :- consistent(sm, sidecut_radius_size_144).
evidence(all_consistent(sidecut_radius_size_144)).
query(true_val(sidecut_radius_size_144, v7_0)).
query(true_val(sidecut_radius_size_144, unk_scr144)).

% @attr tip_tail_width_size_144
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (144cm)
% @unit cm
% @values v27_8=27.8 unk_ttw144=Unknown
% @importance 0.85

0.95::true_val(tip_tail_width_size_144, v27_8); 0.05::true_val(tip_tail_width_size_144, unk_ttw144).
0.93::acc(sm, tip_tail_width_size_144).
measured(sm, tip_tail_width_size_144, v27_8).
all_consistent(tip_tail_width_size_144) :- consistent(sm, tip_tail_width_size_144).
evidence(all_consistent(tip_tail_width_size_144)).
query(true_val(tip_tail_width_size_144, v27_8)).
query(true_val(tip_tail_width_size_144, unk_ttw144)).

% @attr waist_width_144
% @type numeric
% @canonical false
% @original_name Waist width 144cm
% @unit mm
% @values v240=240.0 unk_ww144=Unknown
% @importance 0.85

0.95::true_val(waist_width_144, v240); 0.05::true_val(waist_width_144, unk_ww144).
0.93::acc(sm, waist_width_144).
measured(sm, waist_width_144, v240).
all_consistent(waist_width_144) :- consistent(sm, waist_width_144).
evidence(all_consistent(waist_width_144)).
query(true_val(waist_width_144, v240)).
query(true_val(waist_width_144, unk_ww144)).

% @attr stance_width_range_size_144
% @type numeric
% @canonical false
% @original_name stance_width_range_size (144cm)
% @unit cm
% @values v50_5=50.5 unk_sw144=Unknown
% @importance 0.85

0.95::true_val(stance_width_range_size_144, v50_5); 0.05::true_val(stance_width_range_size_144, unk_sw144).
0.93::acc(sm, stance_width_range_size_144).
measured(sm, stance_width_range_size_144, v50_5).
all_consistent(stance_width_range_size_144) :- consistent(sm, stance_width_range_size_144).
evidence(all_consistent(stance_width_range_size_144)).
query(true_val(stance_width_range_size_144, v50_5)).
query(true_val(stance_width_range_size_144, unk_sw144)).

% @attr recommended_weight_range_size_144
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (144cm)
% @values w45_68kg=45-68kg_100-150lbs unk_rw144=Unknown
% @importance 0.9

0.95::true_val(recommended_weight_range_size_144, w45_68kg); 0.05::true_val(recommended_weight_range_size_144, unk_rw144).
0.93::acc(sm, recommended_weight_range_size_144).
0.78::acc(s23, recommended_weight_range_size_144).
measured(sm, recommended_weight_range_size_144, w45_68kg).
measured(s23, recommended_weight_range_size_144, w45_68kg).
all_consistent(recommended_weight_range_size_144) :- consistent(sm, recommended_weight_range_size_144), consistent(s23, recommended_weight_range_size_144).
evidence(all_consistent(recommended_weight_range_size_144)).
query(true_val(recommended_weight_range_size_144, w45_68kg)).
query(true_val(recommended_weight_range_size_144, unk_rw144)).

% @attr effective_edge_149
% @type numeric
% @canonical false
% @original_name Effective edge 149cm
% @unit cm
% @values v112_5=112.5 unk_ee149=Unknown
% @importance 0.85

0.95::true_val(effective_edge_149, v112_5); 0.05::true_val(effective_edge_149, unk_ee149).
0.93::acc(sm, effective_edge_149).
measured(sm, effective_edge_149, v112_5).
all_consistent(effective_edge_149) :- consistent(sm, effective_edge_149).
evidence(all_consistent(effective_edge_149)).
query(true_val(effective_edge_149, v112_5)).
query(true_val(effective_edge_149, unk_ee149)).

% @attr sidecut_radius_size_149
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (149cm)
% @unit m
% @values v7_3=7.3 unk_scr149=Unknown
% @importance 0.85

0.95::true_val(sidecut_radius_size_149, v7_3); 0.05::true_val(sidecut_radius_size_149, unk_scr149).
0.93::acc(sm, sidecut_radius_size_149).
measured(sm, sidecut_radius_size_149, v7_3).
all_consistent(sidecut_radius_size_149) :- consistent(sm, sidecut_radius_size_149).
evidence(all_consistent(sidecut_radius_size_149)).
query(true_val(sidecut_radius_size_149, v7_3)).
query(true_val(sidecut_radius_size_149, unk_scr149)).

% @attr tip_tail_width_size_149
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (149cm)
% @unit cm
% @values v28_4=28.4 unk_ttw149=Unknown
% @importance 0.85

0.95::true_val(tip_tail_width_size_149, v28_4); 0.05::true_val(tip_tail_width_size_149, unk_ttw149).
0.93::acc(sm, tip_tail_width_size_149).
measured(sm, tip_tail_width_size_149, v28_4).
all_consistent(tip_tail_width_size_149) :- consistent(sm, tip_tail_width_size_149).
evidence(all_consistent(tip_tail_width_size_149)).
query(true_val(tip_tail_width_size_149, v28_4)).
query(true_val(tip_tail_width_size_149, unk_ttw149)).

% @attr waist_width_149
% @type numeric
% @canonical false
% @original_name Waist width 149cm
% @unit mm
% @values v244=244.0 unk_ww149=Unknown
% @importance 0.85

0.95::true_val(waist_width_149, v244); 0.05::true_val(waist_width_149, unk_ww149).
0.93::acc(sm, waist_width_149).
measured(sm, waist_width_149, v244).
all_consistent(waist_width_149) :- consistent(sm, waist_width_149).
evidence(all_consistent(waist_width_149)).
query(true_val(waist_width_149, v244)).
query(true_val(waist_width_149, unk_ww149)).

% @attr stance_width_range_size_149
% @type numeric
% @canonical false
% @original_name stance_width_range_size (149cm)
% @unit cm
% @values v53_0=53.0 unk_sw149=Unknown
% @importance 0.85

0.95::true_val(stance_width_range_size_149, v53_0); 0.05::true_val(stance_width_range_size_149, unk_sw149).
0.93::acc(sm, stance_width_range_size_149).
measured(sm, stance_width_range_size_149, v53_0).
all_consistent(stance_width_range_size_149) :- consistent(sm, stance_width_range_size_149).
evidence(all_consistent(stance_width_range_size_149)).
query(true_val(stance_width_range_size_149, v53_0)).
query(true_val(stance_width_range_size_149, unk_sw149)).

% @attr recommended_weight_range_size_149
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (149cm)
% @values w45_68kg_149=45-68kg unk_rw149=Unknown
% @importance 0.85

0.95::true_val(recommended_weight_range_size_149, w45_68kg_149); 0.05::true_val(recommended_weight_range_size_149, unk_rw149).
0.93::acc(sm, recommended_weight_range_size_149).
measured(sm, recommended_weight_range_size_149, w45_68kg_149).
all_consistent(recommended_weight_range_size_149) :- consistent(sm, recommended_weight_range_size_149).
evidence(all_consistent(recommended_weight_range_size_149)).
query(true_val(recommended_weight_range_size_149, w45_68kg_149)).
query(true_val(recommended_weight_range_size_149, unk_rw149)).

% @attr effective_edge_152
% @type numeric
% @canonical false
% @original_name Effective edge 152cm
% @unit cm
% @values v115_5=115.5 unk_ee152=Unknown
% @importance 0.85

0.95::true_val(effective_edge_152, v115_5); 0.05::true_val(effective_edge_152, unk_ee152).
0.93::acc(sm, effective_edge_152).
measured(sm, effective_edge_152, v115_5).
all_consistent(effective_edge_152) :- consistent(sm, effective_edge_152).
evidence(all_consistent(effective_edge_152)).
query(true_val(effective_edge_152, v115_5)).
query(true_val(effective_edge_152, unk_ee152)).

% @attr sidecut_radius_size_152
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (152cm)
% @unit m
% @values v7_5_scr=7.5 unk_scr152=Unknown
% @importance 0.85

0.95::true_val(sidecut_radius_size_152, v7_5_scr); 0.05::true_val(sidecut_radius_size_152, unk_scr152).
0.93::acc(sm, sidecut_radius_size_152).
measured(sm, sidecut_radius_size_152, v7_5_scr).
all_consistent(sidecut_radius_size_152) :- consistent(sm, sidecut_radius_size_152).
evidence(all_consistent(sidecut_radius_size_152)).
query(true_val(sidecut_radius_size_152, v7_5_scr)).
query(true_val(sidecut_radius_size_152, unk_scr152)).

% @attr tip_tail_width_size_152
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (152cm)
% @unit cm
% @values v29_0=29.0 unk_ttw152=Unknown
% @importance 0.85

0.95::true_val(tip_tail_width_size_152, v29_0); 0.05::true_val(tip_tail_width_size_152, unk_ttw152).
0.93::acc(sm, tip_tail_width_size_152).
measured(sm, tip_tail_width_size_152, v29_0).
all_consistent(tip_tail_width_size_152) :- consistent(sm, tip_tail_width_size_152).
evidence(all_consistent(tip_tail_width_size_152)).
query(true_val(tip_tail_width_size_152, v29_0)).
query(true_val(tip_tail_width_size_152, unk_ttw152)).

% @attr waist_width_152
% @type numeric
% @canonical false
% @original_name Waist width 152cm
% @unit mm
% @values v249=249.0 unk_ww152=Unknown
% @importance 0.85

0.95::true_val(waist_width_152, v249); 0.05::true_val(waist_width_152, unk_ww152).
0.93::acc(sm, waist_width_152).
measured(sm, waist_width_152, v249).
all_consistent(waist_width_152) :- consistent(sm, waist_width_152).
evidence(all_consistent(waist_width_152)).
query(true_val(waist_width_152, v249)).
query(true_val(waist_width_152, unk_ww152)).

% @attr stance_width_range_size_152
% @type numeric
% @canonical false
% @original_name stance_width_range_size (152cm)
% @unit cm
% @values v53_0_152=53.0 unk_sw152=Unknown
% @importance 0.85

0.95::true_val(stance_width_range_size_152, v53_0_152); 0.05::true_val(stance_width_range_size_152, unk_sw152).
0.93::acc(sm, stance_width_range_size_152).
measured(sm, stance_width_range_size_152, v53_0_152).
all_consistent(stance_width_range_size_152) :- consistent(sm, stance_width_range_size_152).
evidence(all_consistent(stance_width_range_size_152)).
query(true_val(stance_width_range_size_152, v53_0_152)).
query(true_val(stance_width_range_size_152, unk_sw152)).

% @attr recommended_weight_range_size_152
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (152cm)
% @values w54_82kg=54-82kg_120-180lbs unk_rw152=Unknown
% @importance 0.85

0.95::true_val(recommended_weight_range_size_152, w54_82kg); 0.05::true_val(recommended_weight_range_size_152, unk_rw152).
0.93::acc(sm, recommended_weight_range_size_152).
measured(sm, recommended_weight_range_size_152, w54_82kg).
all_consistent(recommended_weight_range_size_152) :- consistent(sm, recommended_weight_range_size_152).
evidence(all_consistent(recommended_weight_range_size_152)).
query(true_val(recommended_weight_range_size_152, w54_82kg)).
query(true_val(recommended_weight_range_size_152, unk_rw152)).

% @attr effective_edge_155
% @type numeric
% @canonical false
% @original_name Effective edge 155cm
% @unit cm
% @values v118_5=118.5 unk_ee155=Unknown
% @importance 0.85

0.95::true_val(effective_edge_155, v118_5); 0.05::true_val(effective_edge_155, unk_ee155).
0.93::acc(sm, effective_edge_155).
measured(sm, effective_edge_155, v118_5).
all_consistent(effective_edge_155) :- consistent(sm, effective_edge_155).
evidence(all_consistent(effective_edge_155)).
query(true_val(effective_edge_155, v118_5)).
query(true_val(effective_edge_155, unk_ee155)).

% @attr sidecut_radius_size
% @type numeric
% @canonical true
% @original_name sidecut_radius_size (155cm)
% @unit m
% @values v7_7=7.7 unk_sidecut_radius_size=Unknown
% @importance 0.85

0.95::true_val(sidecut_radius_size, v7_7); 0.05::true_val(sidecut_radius_size, unk_sidecut_radius_size).
0.93::acc(sm, sidecut_radius_size).
measured(sm, sidecut_radius_size, v7_7).
all_consistent(sidecut_radius_size) :- consistent(sm, sidecut_radius_size).
evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_7)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr tip_tail_width_size
% @type numeric
% @canonical true
% @original_name tip_tail_width_size (155cm)
% @unit cm
% @values v29_3=29.3 unk_tip_tail_width_size=Unknown
% @importance 0.85

0.95::true_val(tip_tail_width_size, v29_3); 0.05::true_val(tip_tail_width_size, unk_tip_tail_width_size).
0.93::acc(sm, tip_tail_width_size).
measured(sm, tip_tail_width_size, v29_3).
all_consistent(tip_tail_width_size) :- consistent(sm, tip_tail_width_size).
evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v29_3)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr waist_width_155
% @type numeric
% @canonical false
% @original_name Waist width 155cm
% @unit mm
% @values v251=251.0 unk_ww155=Unknown
% @importance 0.85

0.95::true_val(waist_width_155, v251); 0.05::true_val(waist_width_155, unk_ww155).
0.93::acc(sm, waist_width_155).
measured(sm, waist_width_155, v251).
all_consistent(waist_width_155) :- consistent(sm, waist_width_155).
evidence(all_consistent(waist_width_155)).
query(true_val(waist_width_155, v251)).
query(true_val(waist_width_155, unk_ww155)).

% @attr stance_width_range_size
% @type numeric
% @canonical true
% @original_name stance_width_range_size (155cm)
% @unit cm
% @values v56_0=56.0 unk_stance_width_range_size=Unknown
% @importance 0.85

0.95::true_val(stance_width_range_size, v56_0); 0.05::true_val(stance_width_range_size, unk_stance_width_range_size).
0.93::acc(sm, stance_width_range_size).
measured(sm, stance_width_range_size, v56_0).
all_consistent(stance_width_range_size) :- consistent(sm, stance_width_range_size).
evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v56_0)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size (155cm)
% @values w54_82kg_155=54-82kg unk_recommended_weight_range_size=Unknown
% @importance 0.85

0.95::true_val(recommended_weight_range_size, w54_82kg_155); 0.05::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).
0.93::acc(sm, recommended_weight_range_size).
measured(sm, recommended_weight_range_size, w54_82kg_155).
all_consistent(recommended_weight_range_size) :- consistent(sm, recommended_weight_range_size).
evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w54_82kg_155)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr effective_edge_158
% @type numeric
% @canonical false
% @original_name Effective edge 158cm
% @unit cm
% @values v121_5=121.5 unk_ee158=Unknown
% @importance 0.85

0.95::true_val(effective_edge_158, v121_5); 0.05::true_val(effective_edge_158, unk_ee158).
0.93::acc(sm, effective_edge_158).
measured(sm, effective_edge_158, v121_5).
all_consistent(effective_edge_158) :- consistent(sm, effective_edge_158).
evidence(all_consistent(effective_edge_158)).
query(true_val(effective_edge_158, v121_5)).
query(true_val(effective_edge_158, unk_ee158)).

% @attr sidecut_radius_size_158
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (158cm)
% @unit m
% @values v7_9=7.9 unk_scr158=Unknown
% @importance 0.85

0.95::true_val(sidecut_radius_size_158, v7_9); 0.05::true_val(sidecut_radius_size_158, unk_scr158).
0.93::acc(sm, sidecut_radius_size_158).
measured(sm, sidecut_radius_size_158, v7_9).
all_consistent(sidecut_radius_size_158) :- consistent(sm, sidecut_radius_size_158).
evidence(all_consistent(sidecut_radius_size_158)).
query(true_val(sidecut_radius_size_158, v7_9)).
query(true_val(sidecut_radius_size_158, unk_scr158)).

% @attr tip_tail_width_size_158
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (158cm)
% @unit cm
% @values v29_7=29.7 unk_ttw158=Unknown
% @importance 0.85

0.95::true_val(tip_tail_width_size_158, v29_7); 0.05::true_val(tip_tail_width_size_158, unk_ttw158).
0.93::acc(sm, tip_tail_width_size_158).
measured(sm, tip_tail_width_size_158, v29_7).
all_consistent(tip_tail_width_size_158) :- consistent(sm, tip_tail_width_size_158).
evidence(all_consistent(tip_tail_width_size_158)).
query(true_val(tip_tail_width_size_158, v29_7)).
query(true_val(tip_tail_width_size_158, unk_ttw158)).

% @attr waist_width_158
% @type numeric
% @canonical false
% @original_name Waist width 158cm
% @unit mm
% @values v254=254.0 unk_ww158=Unknown
% @importance 0.85

0.95::true_val(waist_width_158, v254); 0.05::true_val(waist_width_158, unk_ww158).
0.93::acc(sm, waist_width_158).
measured(sm, waist_width_158, v254).
all_consistent(waist_width_158) :- consistent(sm, waist_width_158).
evidence(all_consistent(waist_width_158)).
query(true_val(waist_width_158, v254)).
query(true_val(waist_width_158, unk_ww158)).

% @attr stance_width_range_size_158
% @type numeric
% @canonical false
% @original_name stance_width_range_size (158cm)
% @unit cm
% @values v56_0_158=56.0 unk_sw158=Unknown
% @importance 0.85

0.95::true_val(stance_width_range_size_158, v56_0_158); 0.05::true_val(stance_width_range_size_158, unk_sw158).
0.93::acc(sm, stance_width_range_size_158).
measured(sm, stance_width_range_size_158, v56_0_158).
all_consistent(stance_width_range_size_158) :- consistent(sm, stance_width_range_size_158).
evidence(all_consistent(stance_width_range_size_158)).
query(true_val(stance_width_range_size_158, v56_0_158)).
query(true_val(stance_width_range_size_158, unk_sw158)).

% @attr recommended_weight_range_size_158
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (158cm)
% @values w68_91kg=68-91kg_150-200lbs unk_rw158=Unknown
% @importance 0.85

0.95::true_val(recommended_weight_range_size_158, w68_91kg); 0.05::true_val(recommended_weight_range_size_158, unk_rw158).
0.93::acc(sm, recommended_weight_range_size_158).
measured(sm, recommended_weight_range_size_158, w68_91kg).
all_consistent(recommended_weight_range_size_158) :- consistent(sm, recommended_weight_range_size_158).
evidence(all_consistent(recommended_weight_range_size_158)).
query(true_val(recommended_weight_range_size_158, w68_91kg)).
query(true_val(recommended_weight_range_size_158, unk_rw158)).

% @attr effective_edge_162
% @type numeric
% @canonical false
% @original_name Effective edge 162cm
% @unit cm
% @values v125_5=125.5 unk_ee162=Unknown
% @importance 0.85

0.95::true_val(effective_edge_162, v125_5); 0.05::true_val(effective_edge_162, unk_ee162).
0.93::acc(sm, effective_edge_162).
measured(sm, effective_edge_162, v125_5).
all_consistent(effective_edge_162) :- consistent(sm, effective_edge_162).
evidence(all_consistent(effective_edge_162)).
query(true_val(effective_edge_162, v125_5)).
query(true_val(effective_edge_162, unk_ee162)).

% @attr sidecut_radius_size_162
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (162cm)
% @unit m
% @values v8_2=8.2 unk_scr162=Unknown
% @importance 0.85

0.95::true_val(sidecut_radius_size_162, v8_2); 0.05::true_val(sidecut_radius_size_162, unk_scr162).
0.93::acc(sm, sidecut_radius_size_162).
measured(sm, sidecut_radius_size_162, v8_2).
all_consistent(sidecut_radius_size_162) :- consistent(sm, sidecut_radius_size_162).
evidence(all_consistent(sidecut_radius_size_162)).
query(true_val(sidecut_radius_size_162, v8_2)).
query(true_val(sidecut_radius_size_162, unk_scr162)).

% @attr tip_tail_width_size_162
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (162cm)
% @unit cm
% @values v30_3=30.3 unk_ttw162=Unknown
% @importance 0.85

0.95::true_val(tip_tail_width_size_162, v30_3); 0.05::true_val(tip_tail_width_size_162, unk_ttw162).
0.93::acc(sm, tip_tail_width_size_162).
measured(sm, tip_tail_width_size_162, v30_3).
all_consistent(tip_tail_width_size_162) :- consistent(sm, tip_tail_width_size_162).
evidence(all_consistent(tip_tail_width_size_162)).
query(true_val(tip_tail_width_size_162, v30_3)).
query(true_val(tip_tail_width_size_162, unk_ttw162)).

% @attr waist_width_162
% @type numeric
% @canonical false
% @original_name Waist width 162cm
% @unit mm
% @values v258=258.0 unk_ww162=Unknown
% @importance 0.85

0.95::true_val(waist_width_162, v258); 0.05::true_val(waist_width_162, unk_ww162).
0.93::acc(sm, waist_width_162).
measured(sm, waist_width_162, v258).
all_consistent(waist_width_162) :- consistent(sm, waist_width_162).
evidence(all_consistent(waist_width_162)).
query(true_val(waist_width_162, v258)).
query(true_val(waist_width_162, unk_ww162)).

% @attr stance_width_range_size_162
% @type numeric
% @canonical false
% @original_name stance_width_range_size (162cm)
% @unit cm
% @values v56_0_162=56.0 unk_sw162=Unknown
% @importance 0.85

0.95::true_val(stance_width_range_size_162, v56_0_162); 0.05::true_val(stance_width_range_size_162, unk_sw162).
0.93::acc(sm, stance_width_range_size_162).
measured(sm, stance_width_range_size_162, v56_0_162).
all_consistent(stance_width_range_size_162) :- consistent(sm, stance_width_range_size_162).
evidence(all_consistent(stance_width_range_size_162)).
query(true_val(stance_width_range_size_162, v56_0_162)).
query(true_val(stance_width_range_size_162, unk_sw162)).

% @attr recommended_weight_range_size_162
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (162cm)
% @values w82_118plus=82-118plus_kg_180-260plus_lbs unk_rw162=Unknown
% @importance 0.85

0.95::true_val(recommended_weight_range_size_162, w82_118plus); 0.05::true_val(recommended_weight_range_size_162, unk_rw162).
0.93::acc(sm, recommended_weight_range_size_162).
measured(sm, recommended_weight_range_size_162, w82_118plus).
all_consistent(recommended_weight_range_size_162) :- consistent(sm, recommended_weight_range_size_162).
evidence(all_consistent(recommended_weight_range_size_162)).
query(true_val(recommended_weight_range_size_162, w82_118plus)).
query(true_val(recommended_weight_range_size_162, unk_rw162)).

% @attr board_weight_grams
% @type numeric
% @canonical true
% @original_name board_weight_grams
% @unit g
% @values v2900=2900.0 unk_board_weight_grams=Unknown
% @importance 0.95

0.76::true_val(board_weight_grams, v2900); 0.24::true_val(board_weight_grams, unk_board_weight_grams).
0.85::acc(s23, board_weight_grams).
measured(s23, board_weight_grams, v2900).
all_consistent(board_weight_grams) :- consistent(s23, board_weight_grams).
evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v2900)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr weight_per_cm
% @type numeric
% @canonical true
% @original_name weight_per_cm
% @unit g/cm
% @values v18_35=18.35 v18_58=18.58
% @importance 0.95

0.50::true_val(weight_per_cm, v18_35); 0.50::true_val(weight_per_cm, v18_58).
0.80::acc(s23, weight_per_cm).
0.78::acc(s23b, weight_per_cm).
measured(s23, weight_per_cm, v18_35).
measured(s23b, weight_per_cm, v18_58).
all_consistent(weight_per_cm) :- consistent(s23, weight_per_cm), consistent(s23b, weight_per_cm).
evidence(all_consistent(weight_per_cm)).
query(true_val(weight_per_cm, v18_35)).
query(true_val(weight_per_cm, v18_58)).

0.78::acc(s23b, weight_per_cm).

% @attr weight_comparison
% @type categorical
% @canonical false
% @original_name Weight comparison
% @values slightly_lighter_than_avg=Slightly_lighter_than_avg_lighter_than_2023 unk_weight_comparison=Unknown
% @importance 0.95

0.76::true_val(weight_comparison, slightly_lighter_than_avg); 0.24::true_val(weight_comparison, unk_weight_comparison).
0.80::acc(s23, weight_comparison).
measured(s23, weight_comparison, slightly_lighter_than_avg).
all_consistent(weight_comparison) :- consistent(s23, weight_comparison).
evidence(all_consistent(weight_comparison)).
query(true_val(weight_comparison, slightly_lighter_than_avg)).
query(true_val(weight_comparison, unk_weight_comparison)).

% @attr weight_feel_on_snow
% @type categorical
% @canonical false
% @original_name Weight feel on snow
% @values normal_weight=Felt_normal_weight unk_weight_feel=Unknown
% @importance 0.95

0.76::true_val(weight_feel_on_snow, normal_weight); 0.24::true_val(weight_feel_on_snow, unk_weight_feel).
0.80::acc(s23, weight_feel_on_snow).
measured(s23, weight_feel_on_snow, normal_weight).
all_consistent(weight_feel_on_snow) :- consistent(s23, weight_feel_on_snow).
evidence(all_consistent(weight_feel_on_snow)).
query(true_val(weight_feel_on_snow, normal_weight)).
query(true_val(weight_feel_on_snow, unk_weight_feel)).

% @attr terrain_suitability
% @type numeric
% @canonical true
% @original_name terrain_suitability (Park)
% @unit /10
% @values v10=10.0 unk_terrain_suitability=Unknown
% @importance 0.85

0.95::true_val(terrain_suitability, v10); 0.05::true_val(terrain_suitability, unk_terrain_suitability).
0.93::acc(sm, terrain_suitability).
measured(sm, terrain_suitability, v10).
all_consistent(terrain_suitability) :- consistent(sm, terrain_suitability).
evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, v10)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr terrain_suitability_all_mountain
% @type numeric
% @canonical false
% @original_name terrain_suitability (All-Mountain)
% @unit /10
% @values v7_am=7.0 unk_terrain_am=Unknown
% @importance 0.85

0.95::true_val(terrain_suitability_all_mountain, v7_am); 0.05::true_val(terrain_suitability_all_mountain, unk_terrain_am).
0.93::acc(sm, terrain_suitability_all_mountain).
measured(sm, terrain_suitability_all_mountain, v7_am).
all_consistent(terrain_suitability_all_mountain) :- consistent(sm, terrain_suitability_all_mountain).
evidence(all_consistent(terrain_suitability_all_mountain)).
query(true_val(terrain_suitability_all_mountain, v7_am)).
query(true_val(terrain_suitability_all_mountain, unk_terrain_am)).

% @attr terrain_suitability_powder
% @type numeric
% @canonical false
% @original_name terrain_suitability (Powder)
% @unit /10
% @values v2=2.0 unk_terrain_pow=Unknown
% @importance 0.85

0.95::true_val(terrain_suitability_powder, v2); 0.05::true_val(terrain_suitability_powder, unk_terrain_pow).
0.93::acc(sm, terrain_suitability_powder).
measured(sm, terrain_suitability_powder, v2).
all_consistent(terrain_suitability_powder) :- consistent(sm, terrain_suitability_powder).
evidence(all_consistent(terrain_suitability_powder)).
query(true_val(terrain_suitability_powder, v2)).
query(true_val(terrain_suitability_powder, unk_terrain_pow)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate_advanced=Intermediate_to_Advanced_Expert unk_rider_level=Unknown
% @importance 0.82

0.95::true_val(rider_level, intermediate_advanced); 0.05::true_val(rider_level, unk_rider_level).
0.90::acc(sm, rider_level).
0.82::acc(s6, rider_level).
0.82::acc(s23, rider_level).
0.72::acc(s38, rider_level).
measured(sm, rider_level, intermediate_advanced).
measured(s6, rider_level, intermediate_advanced).
measured(s23, rider_level, intermediate_advanced).
measured(s38, rider_level, intermediate_advanced).
all_consistent(rider_level) :- consistent(sm, rider_level), (indep(s6), consistent(s6, rider_level) ; \+indep(s6)), consistent(s23, rider_level), (indep(s38), consistent(s38, rider_level) ; \+indep(s38)).
evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate_advanced)).
query(true_val(rider_level, unk_rider_level)).

% @attr review_rating_merchant
% @type numeric
% @canonical false
% @original_name Review rating (merchant)
% @unit /5
% @values v5_0=5.0 unk_review_merchant=Unknown
% @importance 0.85

0.95::true_val(review_rating_merchant, v5_0); 0.05::true_val(review_rating_merchant, unk_review_merchant).
0.90::acc(sm, review_rating_merchant).
measured(sm, review_rating_merchant, v5_0).
all_consistent(review_rating_merchant) :- consistent(sm, review_rating_merchant).
evidence(all_consistent(review_rating_merchant)).
query(true_val(review_rating_merchant, v5_0)).
query(true_val(review_rating_merchant, unk_review_merchant)).

% @attr overall_rating_snowboardingprofiles
% @type numeric
% @canonical true
% @original_name overall_rating_snowboardingprofiles
% @unit /100
% @values v87_2=87.2 unk_overall_rating=Unknown
% @importance 0.95

0.76::true_val(overall_rating_snowboardingprofiles, v87_2); 0.24::true_val(overall_rating_snowboardingprofiles, unk_overall_rating).
0.82::acc(s23, overall_rating_snowboardingprofiles).
measured(s23, overall_rating_snowboardingprofiles, v87_2).
all_consistent(overall_rating_snowboardingprofiles) :- consistent(s23, overall_rating_snowboardingprofiles).
evidence(all_consistent(overall_rating_snowboardingprofiles)).
query(true_val(overall_rating_snowboardingprofiles, v87_2)).
query(true_val(overall_rating_snowboardingprofiles, unk_overall_rating)).

% @attr botw_rating
% @type numeric
% @canonical false
% @original_name Board of the World rating
% @unit /5
% @values v4_22=4.22 unk_botw_rating=Unknown
% @importance 0.85

0.72::true_val(botw_rating, v4_22); 0.28::true_val(botw_rating, unk_botw_rating).
0.72::acc(s49, botw_rating).
measured(s49, botw_rating, v4_22).
all_consistent(botw_rating) :- consistent(s49, botw_rating).
evidence(all_consistent(botw_rating)).
query(true_val(botw_rating, v4_22)).
query(true_val(botw_rating, unk_botw_rating)).

% @attr botw_ranking
% @type categorical
% @canonical false
% @original_name Board of the World ranking
% @values below_avg_1_7pct=Neg_1_7pct_below_average unk_botw_ranking=Unknown
% @importance 0.85

0.72::true_val(botw_ranking, below_avg_1_7pct); 0.28::true_val(botw_ranking, unk_botw_ranking).
0.72::acc(s49, botw_ranking).
measured(s49, botw_ranking, below_avg_1_7pct).
all_consistent(botw_ranking) :- consistent(s49, botw_ranking).
evidence(all_consistent(botw_ranking)).
query(true_val(botw_ranking, below_avg_1_7pct)).
query(true_val(botw_ranking, unk_botw_ranking)).

% @attr botw_park_ranking
% @type categorical
% @canonical false
% @original_name Board of the World park ranking
% @values rank_2_of_36=2nd_of_36_park unk_botw_park=Unknown
% @importance 0.85

0.72::true_val(botw_park_ranking, rank_2_of_36); 0.28::true_val(botw_park_ranking, unk_botw_park).
0.75::acc(s50, botw_park_ranking).
measured(s50, botw_park_ranking, rank_2_of_36).
all_consistent(botw_park_ranking) :- consistent(s50, botw_park_ranking).
evidence(all_consistent(botw_park_ranking)).
query(true_val(botw_park_ranking, rank_2_of_36)).
query(true_val(botw_park_ranking, unk_botw_park)).

% @attr botw_editor_rating
% @type numeric
% @canonical false
% @original_name Board of the World editor review
% @unit /5
% @values v4_63=4.63 unk_botw_editor=Unknown
% @importance 0.8

0.72::true_val(botw_editor_rating, v4_63); 0.28::true_val(botw_editor_rating, unk_botw_editor).
0.75::acc(s51, botw_editor_rating).
measured(s51, botw_editor_rating, v4_63).
all_consistent(botw_editor_rating) :- consistent(s51, botw_editor_rating).
evidence(all_consistent(botw_editor_rating)).
query(true_val(botw_editor_rating, v4_63)).
query(true_val(botw_editor_rating, unk_botw_editor)).

% @attr jumps_rating_tgr
% @type numeric
% @canonical true
% @original_name jumps_rating_tgr
% @unit /5
% @values v4_5=4.5 unk_jumps=Unknown
% @importance 0.95

0.76::true_val(jumps_rating_tgr, v4_5); 0.24::true_val(jumps_rating_tgr, unk_jumps).
0.82::acc(s23, jumps_rating_tgr).
measured(s23, jumps_rating_tgr, v4_5).
all_consistent(jumps_rating_tgr) :- consistent(s23, jumps_rating_tgr).
evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, v4_5)).
query(true_val(jumps_rating_tgr, unk_jumps)).

% @attr carving_score_snowboardingprofiles
% @type numeric
% @canonical true
% @original_name carving_score_snowboardingprofiles
% @unit /5
% @values v4_carv=4.0 unk_carving=Unknown
% @importance 0.95

0.76::true_val(carving_score_snowboardingprofiles, v4_carv); 0.24::true_val(carving_score_snowboardingprofiles, unk_carving).
0.82::acc(s23, carving_score_snowboardingprofiles).
measured(s23, carving_score_snowboardingprofiles, v4_carv).
all_consistent(carving_score_snowboardingprofiles) :- consistent(s23, carving_score_snowboardingprofiles).
evidence(all_consistent(carving_score_snowboardingprofiles)).
query(true_val(carving_score_snowboardingprofiles, v4_carv)).
query(true_val(carving_score_snowboardingprofiles, unk_carving)).

% @attr turn_initiation_performance
% @type numeric
% @canonical true
% @original_name turn_initiation_performance
% @unit /5
% @values v4_turn=4.0 unk_turn=Unknown
% @importance 0.95

0.76::true_val(turn_initiation_performance, v4_turn); 0.24::true_val(turn_initiation_performance, unk_turn).
0.82::acc(s23, turn_initiation_performance).
measured(s23, turn_initiation_performance, v4_turn).
all_consistent(turn_initiation_performance) :- consistent(s23, turn_initiation_performance).
evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, v4_turn)).
query(true_val(turn_initiation_performance, unk_turn)).

% @attr switch_riding
% @type numeric
% @canonical true
% @original_name switch_riding
% @unit /5
% @values v4_5_switch=4.5 unk_switch=Unknown
% @importance 0.925

0.90::true_val(switch_riding, v4_5_switch); 0.10::true_val(switch_riding, unk_switch).
0.82::acc(s23, switch_riding).
0.82::acc(s6, switch_riding).
measured(s23, switch_riding, v4_5_switch).
measured(s6, switch_riding, v4_5_switch).
all_consistent(switch_riding) :- consistent(s23, switch_riding), (indep(s6), consistent(s6, switch_riding) ; \+indep(s6)).
evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, v4_5_switch)).
query(true_val(switch_riding, unk_switch)).

% @attr speed_rating_tgr
% @type numeric
% @canonical true
% @original_name speed_rating_tgr
% @unit /5
% @values v4_speed=4.0 unk_speed=Unknown
% @importance 0.95

0.76::true_val(speed_rating_tgr, v4_speed); 0.24::true_val(speed_rating_tgr, unk_speed).
0.82::acc(s23, speed_rating_tgr).
measured(s23, speed_rating_tgr, v4_speed).
all_consistent(speed_rating_tgr) :- consistent(s23, speed_rating_tgr).
evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, v4_speed)).
query(true_val(speed_rating_tgr, unk_speed)).

% @attr spins_score
% @type numeric
% @canonical false
% @original_name Spins score
% @unit /5
% @values v4_spins=4.0 unk_spins=Unknown
% @importance 0.95

0.76::true_val(spins_score, v4_spins); 0.24::true_val(spins_score, unk_spins).
0.82::acc(s23, spins_score).
measured(s23, spins_score, v4_spins).
all_consistent(spins_score) :- consistent(s23, spins_score).
evidence(all_consistent(spins_score)).
query(true_val(spins_score, v4_spins)).
query(true_val(spins_score, unk_spins)).

% @attr butters_score
% @type numeric
% @canonical false
% @original_name Butters score
% @unit /5
% @values v3_5=3.5 unk_butters=Unknown
% @importance 0.95

0.76::true_val(butters_score, v3_5); 0.24::true_val(butters_score, unk_butters).
0.82::acc(s23, butters_score).
measured(s23, butters_score, v3_5).
all_consistent(butters_score) :- consistent(s23, butters_score).
evidence(all_consistent(butters_score)).
query(true_val(butters_score, v3_5)).
query(true_val(butters_score, unk_butters)).

% @attr jibbing_rating_tgr
% @type numeric
% @canonical true
% @original_name jibbing_rating_tgr
% @unit /5
% @values v3_jib=3.0 unk_jibbing=Unknown
% @importance 0.95

0.76::true_val(jibbing_rating_tgr, v3_jib); 0.24::true_val(jibbing_rating_tgr, unk_jibbing).
0.82::acc(s23, jibbing_rating_tgr).
measured(s23, jibbing_rating_tgr, v3_jib).
all_consistent(jibbing_rating_tgr) :- consistent(s23, jibbing_rating_tgr).
evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, v3_jib)).
query(true_val(jibbing_rating_tgr, unk_jibbing)).

% @attr crud_chunder_score
% @type numeric
% @canonical false
% @original_name Crud/chunder score
% @unit /5
% @values v4_crud=4.0 unk_crud=Unknown
% @importance 0.95

0.76::true_val(crud_chunder_score, v4_crud); 0.24::true_val(crud_chunder_score, unk_crud).
0.82::acc(s23, crud_chunder_score).
measured(s23, crud_chunder_score, v4_crud).
all_consistent(crud_chunder_score) :- consistent(s23, crud_chunder_score).
evidence(all_consistent(crud_chunder_score)).
query(true_val(crud_chunder_score, v4_crud)).
query(true_val(crud_chunder_score, unk_crud)).

% @attr trees_bumps_score
% @type numeric
% @canonical false
% @original_name Trees/bumps score
% @unit /5
% @values v3_5_trees=3.5 unk_trees=Unknown
% @importance 0.95

0.76::true_val(trees_bumps_score, v3_5_trees); 0.24::true_val(trees_bumps_score, unk_trees).
0.82::acc(s23, trees_bumps_score).
measured(s23, trees_bumps_score, v3_5_trees).
all_consistent(trees_bumps_score) :- consistent(s23, trees_bumps_score).
evidence(all_consistent(trees_bumps_score)).
query(true_val(trees_bumps_score, v3_5_trees)).
query(true_val(trees_bumps_score, unk_trees)).

% @attr powder_score_snowboardingprofiles
% @type numeric
% @canonical true
% @original_name powder_score_snowboardingprofiles
% @unit /5
% @values v2_powder=2.0 unk_powder=Unknown
% @importance 0.95

0.76::true_val(powder_score_snowboardingprofiles, v2_powder); 0.24::true_val(powder_score_snowboardingprofiles, unk_powder).
0.82::acc(s23, powder_score_snowboardingprofiles).
measured(s23, powder_score_snowboardingprofiles, v2_powder).
all_consistent(powder_score_snowboardingprofiles) :- consistent(s23, powder_score_snowboardingprofiles).
evidence(all_consistent(powder_score_snowboardingprofiles)).
query(true_val(powder_score_snowboardingprofiles, v2_powder)).
query(true_val(powder_score_snowboardingprofiles, unk_powder)).

% @attr chatter_performance
% @type numeric
% @canonical true
% @original_name chatter_performance
% @unit /10
% @values v6_chatter=6.0 unk_chatter=Unknown
% @importance 0.95

0.76::true_val(chatter_performance, v6_chatter); 0.24::true_val(chatter_performance, unk_chatter).
0.82::acc(s23, chatter_performance).
measured(s23, chatter_performance, v6_chatter).
all_consistent(chatter_performance) :- consistent(s23, chatter_performance).
evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, v6_chatter)).
query(true_val(chatter_performance, unk_chatter)).

% @attr smooth_snappy
% @type numeric
% @canonical false
% @original_name Smooth/snappy
% @unit /10
% @values v7_snappy=7.0 unk_smooth_snappy=Unknown
% @importance 0.95

0.76::true_val(smooth_snappy, v7_snappy); 0.24::true_val(smooth_snappy, unk_smooth_snappy).
0.82::acc(s23, smooth_snappy).
measured(s23, smooth_snappy, v7_snappy).
all_consistent(smooth_snappy) :- consistent(s23, smooth_snappy).
evidence(all_consistent(smooth_snappy)).
query(true_val(smooth_snappy, v7_snappy)).
query(true_val(smooth_snappy, unk_smooth_snappy)).

% @attr playful_aggressive
% @type numeric
% @canonical false
% @original_name Playful/aggressive
% @unit /10
% @values v7_aggressive=7.0 unk_playful_aggressive=Unknown
% @importance 0.95

0.76::true_val(playful_aggressive, v7_aggressive); 0.24::true_val(playful_aggressive, unk_playful_aggressive).
0.82::acc(s23, playful_aggressive).
measured(s23, playful_aggressive, v7_aggressive).
all_consistent(playful_aggressive) :- consistent(s23, playful_aggressive).
evidence(all_consistent(playful_aggressive)).
query(true_val(playful_aggressive, v7_aggressive)).
query(true_val(playful_aggressive, unk_playful_aggressive)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values good=Good unk_edge_hold=Unknown
% @importance 0.95

0.76::true_val(edge_hold, good); 0.24::true_val(edge_hold, unk_edge_hold).
0.82::acc(s23, edge_hold).
measured(s23, edge_hold, good).
all_consistent(edge_hold) :- consistent(s23, edge_hold).
evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, good)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr catchiness
% @type categorical
% @canonical false
% @original_name Catchiness
% @values very_minimal=Very_minimal_catch_free_for_full_camber unk_catchiness=Unknown
% @importance 0.95

0.76::true_val(catchiness, very_minimal); 0.24::true_val(catchiness, unk_catchiness).
0.82::acc(s23, catchiness).
measured(s23, catchiness, very_minimal).
all_consistent(catchiness) :- consistent(s23, catchiness).
evidence(all_consistent(catchiness)).
query(true_val(catchiness, very_minimal)).
query(true_val(catchiness, unk_catchiness)).

% @attr pop
% @type categorical
% @canonical false
% @original_name pop
% @values springboard_level=Springboard_level_comparable_to_DOA unk_pop=Unknown
% @importance 0.85

0.72::true_val(pop, springboard_level); 0.28::true_val(pop, unk_pop).
0.75::acc(s52, pop).
measured(s52, pop, springboard_level).
all_consistent(pop) :- consistent(s52, pop).
evidence(all_consistent(pop)).
query(true_val(pop, springboard_level)).
query(true_val(pop, unk_pop)).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name reviewer_opinion_snowboardingprofiles
% @values carves_best_twin=Carves_as_good_as_any_twin unk_reviewer_opinion=Unknown
% @importance 0.95

0.76::true_val(reviewer_opinion_snowboardingprofiles, carves_best_twin); 0.24::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion).
0.82::acc(s23, reviewer_opinion_snowboardingprofiles).
measured(s23, reviewer_opinion_snowboardingprofiles, carves_best_twin).
all_consistent(reviewer_opinion_snowboardingprofiles) :- consistent(s23, reviewer_opinion_snowboardingprofiles).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, carves_best_twin)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion)).

% @attr reviewer_opinion_fast_stable
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (fast and stable)
% @values fast_stable_damp=Fast_stable_damp_charge_through_anything unk_reviewer_fast=Unknown
% @importance 0.85

0.72::true_val(reviewer_opinion_fast_stable, fast_stable_damp); 0.28::true_val(reviewer_opinion_fast_stable, unk_reviewer_fast).
0.72::acc(s49, reviewer_opinion_fast_stable).
measured(s49, reviewer_opinion_fast_stable, fast_stable_damp).
all_consistent(reviewer_opinion_fast_stable) :- consistent(s49, reviewer_opinion_fast_stable).
evidence(all_consistent(reviewer_opinion_fast_stable)).
query(true_val(reviewer_opinion_fast_stable, fast_stable_damp)).
query(true_val(reviewer_opinion_fast_stable, unk_reviewer_fast)).

% @attr ease_of_adaptation
% @type categorical
% @canonical false
% @original_name Easy to get used to
% @values incredibly_easy=Familiar_shape_incredibly_easy unk_ease=Unknown
% @importance 0.65

0.68::true_val(ease_of_adaptation, incredibly_easy); 0.32::true_val(ease_of_adaptation, unk_ease).
0.68::acc(s53, ease_of_adaptation).
measured(s53, ease_of_adaptation, incredibly_easy).
all_consistent(ease_of_adaptation) :- consistent(s53, ease_of_adaptation).
evidence(all_consistent(ease_of_adaptation)).
query(true_val(ease_of_adaptation, incredibly_easy)).
query(true_val(ease_of_adaptation, unk_ease)).

% @attr versatility
% @type categorical
% @canonical false
% @original_name Versatile
% @values jumps_jibbing_all_mountain=Handles_jumps_jibbing_all_mountain unk_versatility=Unknown
% @importance 0.8

0.90::true_val(versatility, jumps_jibbing_all_mountain); 0.10::true_val(versatility, unk_versatility).
0.82::acc(s6, versatility).
0.72::acc(s7, versatility).
measured(s6, versatility, jumps_jibbing_all_mountain).
measured(s7, versatility, jumps_jibbing_all_mountain).
all_consistent(versatility) :- consistent(s6, versatility), consistent(s7, versatility).
evidence(all_consistent(versatility)).
query(true_val(versatility, jumps_jibbing_all_mountain)).
query(true_val(versatility, unk_versatility)).

% @attr factory_ready
% @type categorical
% @canonical false
% @original_name Factory ready-to-ride
% @values waxed_ready=Comes_waxed_ready_from_factory unk_factory_ready=Unknown
% @importance 0.45

0.72::true_val(factory_ready, waxed_ready); 0.28::true_val(factory_ready, unk_factory_ready).
0.72::acc(s54, factory_ready).
measured(s54, factory_ready, waxed_ready).
all_consistent(factory_ready) :- consistent(s54, factory_ready).
evidence(all_consistent(factory_ready)).
query(true_val(factory_ready, waxed_ready)).
query(true_val(factory_ready, unk_factory_ready)).

% @attr reviewer_opinion_mellowed
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (2026 mellowed flex)
% @values mellowed_torsional=Mellowed_torsional_flex_easier_turning unk_reviewer_mellowed=Unknown
% @importance 0.95

0.76::true_val(reviewer_opinion_mellowed, mellowed_torsional); 0.24::true_val(reviewer_opinion_mellowed, unk_reviewer_mellowed).
0.82::acc(s23, reviewer_opinion_mellowed).
measured(s23, reviewer_opinion_mellowed, mellowed_torsional).
all_consistent(reviewer_opinion_mellowed) :- consistent(s23, reviewer_opinion_mellowed).
evidence(all_consistent(reviewer_opinion_mellowed)).
query(true_val(reviewer_opinion_mellowed, mellowed_torsional)).
query(true_val(reviewer_opinion_mellowed, unk_reviewer_mellowed)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect (too stiff for beginners)
% @values too_stiff_beginners=Too_much_for_beginners_most_intermediates unk_negative_aspect=Unknown
% @importance 0.65

0.80::true_val(negative_aspect, too_stiff_beginners); 0.20::true_val(negative_aspect, unk_negative_aspect).
0.75::acc(s15, negative_aspect).
0.78::acc(s55, negative_aspect).
measured(s15, negative_aspect, too_stiff_beginners).
measured(s55, negative_aspect, too_stiff_beginners).
all_consistent(negative_aspect) :- consistent(s15, negative_aspect), consistent(s55, negative_aspect).
evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, too_stiff_beginners)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_powder
% @type categorical
% @canonical false
% @original_name negative_aspect (powder)
% @values poor_powder=Poor_not_designed_for_deep_snow unk_neg_powder=Unknown
% @importance 0.825

0.78::true_val(negative_aspect_powder, poor_powder); 0.22::true_val(negative_aspect_powder, unk_neg_powder).
0.82::acc(s23, negative_aspect_powder).
0.72::acc(s56, negative_aspect_powder).
measured(s23, negative_aspect_powder, poor_powder).
measured(s56, negative_aspect_powder, poor_powder).
all_consistent(negative_aspect_powder) :- consistent(s23, negative_aspect_powder), consistent(s56, negative_aspect_powder).
evidence(all_consistent(negative_aspect_powder)).
query(true_val(negative_aspect_powder, poor_powder)).
query(true_val(negative_aspect_powder, unk_neg_powder)).

% @attr negative_aspect_casual
% @type categorical
% @canonical false
% @original_name negative_aspect (not for casual)
% @values not_for_casual=Best_when_charging_not_for_casual unk_neg_casual=Unknown
% @importance 0.8

0.72::true_val(negative_aspect_casual, not_for_casual); 0.28::true_val(negative_aspect_casual, unk_neg_casual).
0.78::acc(s55, negative_aspect_casual).
measured(s55, negative_aspect_casual, not_for_casual).
all_consistent(negative_aspect_casual) :- consistent(s55, negative_aspect_casual).
evidence(all_consistent(negative_aspect_casual)).
query(true_val(negative_aspect_casual, not_for_casual)).
query(true_val(negative_aspect_casual, unk_neg_casual)).

% @attr negative_aspect_wide
% @type categorical
% @canonical false
% @original_name negative_aspect (no wide sizes)
% @values no_wide_sizes=Limits_availability_larger_feet unk_neg_wide=Unknown
% @importance 0.85

0.72::true_val(negative_aspect_wide, no_wide_sizes); 0.28::true_val(negative_aspect_wide, unk_neg_wide).
0.72::acc(s49, negative_aspect_wide).
measured(s49, negative_aspect_wide, no_wide_sizes).
all_consistent(negative_aspect_wide) :- consistent(s49, negative_aspect_wide).
evidence(all_consistent(negative_aspect_wide)).
query(true_val(negative_aspect_wide, no_wide_sizes)).
query(true_val(negative_aspect_wide, unk_neg_wide)).

% @attr negative_aspect_fewer_sizes
% @type categorical
% @canonical false
% @original_name negative_aspect (fewer sizes vs predecessors)
% @values fewer_sizes=Fewer_optimal_sizes_vs_predecessors unk_neg_sizes=Unknown
% @importance 0.95

0.76::true_val(negative_aspect_fewer_sizes, fewer_sizes); 0.24::true_val(negative_aspect_fewer_sizes, unk_neg_sizes).
0.80::acc(s23, negative_aspect_fewer_sizes).
measured(s23, negative_aspect_fewer_sizes, fewer_sizes).
all_consistent(negative_aspect_fewer_sizes) :- consistent(s23, negative_aspect_fewer_sizes).
evidence(all_consistent(negative_aspect_fewer_sizes)).
query(true_val(negative_aspect_fewer_sizes, fewer_sizes)).
query(true_val(negative_aspect_fewer_sizes, unk_neg_sizes)).

% @attr negative_aspect_weight
% @type categorical
% @canonical false
% @original_name negative_aspect (heavier than Free Thinker)
% @values heavier_than_ft=2900g_vs_2680g_noticeable_in_spins unk_neg_weight=Unknown
% @importance 0.95

0.76::true_val(negative_aspect_weight, heavier_than_ft); 0.24::true_val(negative_aspect_weight, unk_neg_weight).
0.80::acc(s23, negative_aspect_weight).
measured(s23, negative_aspect_weight, heavier_than_ft).
all_consistent(negative_aspect_weight) :- consistent(s23, negative_aspect_weight).
evidence(all_consistent(negative_aspect_weight)).
query(true_val(negative_aspect_weight, heavier_than_ft)).
query(true_val(negative_aspect_weight, unk_neg_weight)).

% @attr negative_aspect_vs_freethinker
% @type categorical
% @canonical false
% @original_name negative_aspect (vs Free Thinker)
% @values doesnt_reach_ft_bar=Doesnt_quite_reach_Free_Thinker_bar unk_neg_ft=Unknown
% @importance 0.95

0.76::true_val(negative_aspect_vs_freethinker, doesnt_reach_ft_bar); 0.24::true_val(negative_aspect_vs_freethinker, unk_neg_ft).
0.80::acc(s23, negative_aspect_vs_freethinker).
measured(s23, negative_aspect_vs_freethinker, doesnt_reach_ft_bar).
all_consistent(negative_aspect_vs_freethinker) :- consistent(s23, negative_aspect_vs_freethinker).
evidence(all_consistent(negative_aspect_vs_freethinker)).
query(true_val(negative_aspect_vs_freethinker, doesnt_reach_ft_bar)).
query(true_val(negative_aspect_vs_freethinker, unk_neg_ft)).

% @attr negative_aspect_butters
% @type categorical
% @canonical false
% @original_name negative_aspect (tip/tail stiffness butters)
% @values butters_need_effort=Tip_tail_stiffness_butters_take_energy unk_neg_butters=Unknown
% @importance 0.95

0.76::true_val(negative_aspect_butters, butters_need_effort); 0.24::true_val(negative_aspect_butters, unk_neg_butters).
0.80::acc(s23, negative_aspect_butters).
measured(s23, negative_aspect_butters, butters_need_effort).
all_consistent(negative_aspect_butters) :- consistent(s23, negative_aspect_butters).
evidence(all_consistent(negative_aspect_butters)).
query(true_val(negative_aspect_butters, butters_need_effort)).
query(true_val(negative_aspect_butters, unk_neg_butters)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values three_year=3_year_warranty_Channel_boards unk_warranty=Unknown
% @importance 0.725

0.95::true_val(warranty, three_year); 0.05::true_val(warranty, unk_warranty).
0.93::acc(s57, warranty).
0.75::acc(s39, warranty).
measured(s57, warranty, three_year).
measured(s39, warranty, three_year).
all_consistent(warranty) :- consistent(s57, warranty), (indep(s39), consistent(s39, warranty) ; \+indep(s39)).
evidence(all_consistent(warranty)).
query(true_val(warranty, three_year)).
query(true_val(warranty, unk_warranty)).

% @attr warranty_processing
% @type categorical
% @canonical false
% @original_name warranty (W48 processing)
% @values w48_2_business_days=W48_processed_returned_2_business_days unk_warranty_proc=Unknown
% @importance 0.6

0.90::true_val(warranty_processing, w48_2_business_days); 0.10::true_val(warranty_processing, unk_warranty_proc).
0.93::acc(s58, warranty_processing).
measured(s58, warranty_processing, w48_2_business_days).
all_consistent(warranty_processing) :- consistent(s58, warranty_processing).
evidence(all_consistent(warranty_processing)).
query(true_val(warranty_processing, w48_2_business_days)).
query(true_val(warranty_processing, unk_warranty_proc)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification (Super Sap)
% @values super_sap_50pct_reduction=Super_Sap_Epoxy_50pct_carbon_reduction unk_sustainability=Unknown
% @importance 0.7

0.95::true_val(sustainability_certification, super_sap_50pct_reduction); 0.05::true_val(sustainability_certification, unk_sustainability).
0.82::acc(s6, sustainability_certification).
0.82::acc(s46, sustainability_certification).
measured(s6, sustainability_certification, super_sap_50pct_reduction).
measured(s46, sustainability_certification, super_sap_50pct_reduction).
all_consistent(sustainability_certification) :- consistent(s6, sustainability_certification), consistent(s46, sustainability_certification).
evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, super_sap_50pct_reduction)).
query(true_val(sustainability_certification, unk_sustainability)).

% @attr sustainability_certification_bcorp
% @type categorical
% @canonical false
% @original_name sustainability_certification (B Corp)
% @values b_corp_certified=Burton_B_Corp_certified unk_sustainability_bcorp=Unknown
% @importance 1.0

0.85::true_val(sustainability_certification_bcorp, b_corp_certified); 0.15::true_val(sustainability_certification_bcorp, unk_sustainability_bcorp).
0.93::acc(s2, sustainability_certification_bcorp).
measured(s2, sustainability_certification_bcorp, b_corp_certified).
all_consistent(sustainability_certification_bcorp) :- consistent(s2, sustainability_certification_bcorp).
evidence(all_consistent(sustainability_certification_bcorp)).
query(true_val(sustainability_certification_bcorp, b_corp_certified)).
query(true_val(sustainability_certification_bcorp, unk_sustainability_bcorp)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand (CAPiTA DOA summary)
% @values capita_doa=CAPiTA_DOA_463_96_hybrid_camber_twin_flex_5_5 unk_comparable_cross=Unknown
% @importance 0.775

0.72::true_val(comparable_board_cross_brand, capita_doa); 0.28::true_val(comparable_board_cross_brand, unk_comparable_cross).
0.70::acc(s59, comparable_board_cross_brand).
0.70::acc(s60, comparable_board_cross_brand).
measured(s59, comparable_board_cross_brand, capita_doa).
measured(s60, comparable_board_cross_brand, capita_doa).
all_consistent(comparable_board_cross_brand) :- consistent(s59, comparable_board_cross_brand), consistent(s60, comparable_board_cross_brand).
evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, capita_doa)).
query(true_val(comparable_board_cross_brand, unk_comparable_cross)).

% @attr comparable_doa_pop
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (DOA pop comparison)
% @values both_springboard_pop=Both_springboard_pop_camber_carbon unk_comp_pop=Unknown
% @importance 0.85

0.72::true_val(comparable_doa_pop, both_springboard_pop); 0.28::true_val(comparable_doa_pop, unk_comp_pop).
0.75::acc(s52, comparable_doa_pop).
measured(s52, comparable_doa_pop, both_springboard_pop).
all_consistent(comparable_doa_pop) :- consistent(s52, comparable_doa_pop).
evidence(all_consistent(comparable_doa_pop)).
query(true_val(comparable_doa_pop, both_springboard_pop)).
query(true_val(comparable_doa_pop, unk_comp_pop)).

% @attr comparable_doa_advantages
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (DOA advantages)
% @values cheaper_playful_wider=100_less_playful_flex_wider_sizes_7_good_wood unk_comp_doa_adv=Unknown
% @importance 0.775

0.72::true_val(comparable_doa_advantages, cheaper_playful_wider); 0.28::true_val(comparable_doa_advantages, unk_comp_doa_adv).
0.70::acc(s59, comparable_doa_advantages).
0.70::acc(s60, comparable_doa_advantages).
measured(s59, comparable_doa_advantages, cheaper_playful_wider).
measured(s60, comparable_doa_advantages, cheaper_playful_wider).
all_consistent(comparable_doa_advantages) :- consistent(s59, comparable_doa_advantages), consistent(s60, comparable_doa_advantages).
evidence(all_consistent(comparable_doa_advantages)).
query(true_val(comparable_doa_advantages, cheaper_playful_wider)).
query(true_val(comparable_doa_advantages, unk_comp_doa_adv)).

% @attr comparable_doa_disadvantages
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (DOA disadvantages)
% @values hybrid_less_edge_speed=Hybrid_camber_less_edge_hold_less_speed_stability unk_comp_doa_dis=Unknown
% @importance 0.775

0.72::true_val(comparable_doa_disadvantages, hybrid_less_edge_speed); 0.28::true_val(comparable_doa_disadvantages, unk_comp_doa_dis).
0.70::acc(s52, comparable_doa_disadvantages).
0.70::acc(s60, comparable_doa_disadvantages).
measured(s52, comparable_doa_disadvantages, hybrid_less_edge_speed).
measured(s60, comparable_doa_disadvantages, hybrid_less_edge_speed).
all_consistent(comparable_doa_disadvantages) :- consistent(s52, comparable_doa_disadvantages), consistent(s60, comparable_doa_disadvantages).
evidence(all_consistent(comparable_doa_disadvantages)).
query(true_val(comparable_doa_disadvantages, hybrid_less_edge_speed)).
query(true_val(comparable_doa_disadvantages, unk_comp_doa_dis)).

% @attr comparable_jones_mt
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Jones Mountain Twin)
% @values jones_mt_twin=Jones_Mountain_Twin_579_95_dir_twin_crcc_flex_7 unk_comp_jones=Unknown
% @importance 0.8

0.72::true_val(comparable_jones_mt, jones_mt_twin); 0.28::true_val(comparable_jones_mt, unk_comp_jones).
0.70::acc(s61, comparable_jones_mt).
0.68::acc(s62, comparable_jones_mt).
measured(s61, comparable_jones_mt, jones_mt_twin).
measured(s62, comparable_jones_mt, jones_mt_twin).
all_consistent(comparable_jones_mt) :- consistent(s61, comparable_jones_mt), consistent(s62, comparable_jones_mt).
evidence(all_consistent(comparable_jones_mt)).
query(true_val(comparable_jones_mt, jones_mt_twin)).
query(true_val(comparable_jones_mt, unk_comp_jones)).

% @attr comparable_jones_mt_advantages
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Jones MT advantages)
% @values serrated_3d_nose_setback=Serrated_edges_3D_nose_setback_freeride unk_comp_jones_adv=Unknown
% @importance 0.8

0.68::true_val(comparable_jones_mt_advantages, serrated_3d_nose_setback); 0.32::true_val(comparable_jones_mt_advantages, unk_comp_jones_adv).
0.68::acc(s62, comparable_jones_mt_advantages).
measured(s62, comparable_jones_mt_advantages, serrated_3d_nose_setback).
all_consistent(comparable_jones_mt_advantages) :- consistent(s62, comparable_jones_mt_advantages).
evidence(all_consistent(comparable_jones_mt_advantages)).
query(true_val(comparable_jones_mt_advantages, serrated_3d_nose_setback)).
query(true_val(comparable_jones_mt_advantages, unk_comp_jones_adv)).

% @attr comparable_jones_mt_disadvantages
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Jones MT disadvantages)
% @values less_park_not_true_twin=Less_park_focused_not_true_twin unk_comp_jones_dis=Unknown
% @importance 0.8

0.68::true_val(comparable_jones_mt_disadvantages, less_park_not_true_twin); 0.32::true_val(comparable_jones_mt_disadvantages, unk_comp_jones_dis).
0.68::acc(s62, comparable_jones_mt_disadvantages).
measured(s62, comparable_jones_mt_disadvantages, less_park_not_true_twin).
all_consistent(comparable_jones_mt_disadvantages) :- consistent(s62, comparable_jones_mt_disadvantages).
evidence(all_consistent(comparable_jones_mt_disadvantages)).
query(true_val(comparable_jones_mt_disadvantages, less_park_not_true_twin)).
query(true_val(comparable_jones_mt_disadvantages, unk_comp_jones_dis)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand (Burton Custom Camber)
% @values burton_custom_camber=Burton_Custom_Camber_dir_twin_611_95 unk_comparable_same=Unknown
% @importance 0.75

0.70::true_val(comparable_board_same_brand, burton_custom_camber); 0.30::true_val(comparable_board_same_brand, unk_comparable_same).
0.70::acc(s63, comparable_board_same_brand).
measured(s63, comparable_board_same_brand, burton_custom_camber).
all_consistent(comparable_board_same_brand) :- consistent(s63, comparable_board_same_brand).
evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, burton_custom_camber)).
query(true_val(comparable_board_same_brand, unk_comparable_same)).

% @attr comparable_jones_tweaker
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Jones Tweaker)
% @values jones_tweaker=Jones_Tweaker_4_29_stars unk_comp_tweaker=Unknown
% @importance 0.85

0.72::true_val(comparable_jones_tweaker, jones_tweaker); 0.28::true_val(comparable_jones_tweaker, unk_comp_tweaker).
0.72::acc(s49, comparable_jones_tweaker).
measured(s49, comparable_jones_tweaker, jones_tweaker).
all_consistent(comparable_jones_tweaker) :- consistent(s49, comparable_jones_tweaker).
evidence(all_consistent(comparable_jones_tweaker)).
query(true_val(comparable_jones_tweaker, jones_tweaker)).
query(true_val(comparable_jones_tweaker, unk_comp_tweaker)).

% @attr comparable_capita_super_doa
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (CAPiTA Super DOA)
% @values capita_super_doa=CAPiTA_Super_DOA_4_67_stars unk_comp_sdoa=Unknown
% @importance 0.85

0.72::true_val(comparable_capita_super_doa, capita_super_doa); 0.28::true_val(comparable_capita_super_doa, unk_comp_sdoa).
0.72::acc(s49, comparable_capita_super_doa).
measured(s49, comparable_capita_super_doa, capita_super_doa).
all_consistent(comparable_capita_super_doa) :- consistent(s49, comparable_capita_super_doa).
evidence(all_consistent(comparable_capita_super_doa)).
query(true_val(comparable_capita_super_doa, capita_super_doa)).
query(true_val(comparable_capita_super_doa, unk_comp_sdoa)).

% @attr comparable_burton_good_company
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Burton Good Company)
% @values burton_good_company=Burton_Good_Company_440_softer_extruded unk_comp_gc=Unknown
% @importance 0.7

0.70::true_val(comparable_burton_good_company, burton_good_company); 0.30::true_val(comparable_burton_good_company, unk_comp_gc).
0.70::acc(s34, comparable_burton_good_company).
measured(s34, comparable_burton_good_company, burton_good_company).
all_consistent(comparable_burton_good_company) :- consistent(s34, comparable_burton_good_company).
evidence(all_consistent(comparable_burton_good_company)).
query(true_val(comparable_burton_good_company, burton_good_company)).
query(true_val(comparable_burton_good_company, unk_comp_gc)).

% @attr review_location_botw
% @type categorical
% @canonical false
% @original_name Board of the World review location
% @values big_snow_nj=Big_Snow_East_Rutherford_NJ unk_loc_botw=Unknown
% @importance 0.65

0.68::true_val(review_location_botw, big_snow_nj); 0.32::true_val(review_location_botw, unk_loc_botw).
0.68::acc(s53, review_location_botw).
measured(s53, review_location_botw, big_snow_nj).
all_consistent(review_location_botw) :- consistent(s53, review_location_botw).
evidence(all_consistent(review_location_botw)).
query(true_val(review_location_botw, big_snow_nj)).
query(true_val(review_location_botw, unk_loc_botw)).

% @attr review_location_sbp
% @type categorical
% @canonical false
% @original_name SnowboardingProfiles review location
% @values outdoor_apr_2025=Outdoor_testing_April_14_2025 unk_loc_sbp=Unknown
% @importance 0.95

0.76::true_val(review_location_sbp, outdoor_apr_2025); 0.24::true_val(review_location_sbp, unk_loc_sbp).
0.80::acc(s23, review_location_sbp).
measured(s23, review_location_sbp, outdoor_apr_2025).
all_consistent(review_location_sbp) :- consistent(s23, review_location_sbp).
evidence(all_consistent(review_location_sbp)).
query(true_val(review_location_sbp, outdoor_apr_2025)).
query(true_val(review_location_sbp, unk_loc_sbp)).

% @attr review_location_transfer
% @type categorical
% @canonical false
% @original_name Transfer Magazine review location
% @values on_mountain_au=On_mountain_Australian_publication unk_loc_transfer=Unknown
% @importance 0.6

0.62::true_val(review_location_transfer, on_mountain_au); 0.38::true_val(review_location_transfer, unk_loc_transfer).
0.62::acc(s64, review_location_transfer).
measured(s64, review_location_transfer, on_mountain_au).
all_consistent(review_location_transfer) :- consistent(s64, review_location_transfer).
evidence(all_consistent(review_location_transfer)).
query(true_val(review_location_transfer, on_mountain_au)).
query(true_val(review_location_transfer, unk_loc_transfer)).

% @attr review_location_bombhole
% @type categorical
% @canonical false
% @original_name Bomb Hole review location
% @values woodward_park_city=Woodward_Park_City unk_loc_bh=Unknown
% @importance 0.6

0.60::true_val(review_location_bombhole, woodward_park_city); 0.40::true_val(review_location_bombhole, unk_loc_bh).
0.60::acc(s65, review_location_bombhole).
measured(s65, review_location_bombhole, woodward_park_city).
all_consistent(review_location_bombhole) :- consistent(s65, review_location_bombhole).
evidence(all_consistent(review_location_bombhole)).
query(true_val(review_location_bombhole, woodward_park_city)).
query(true_val(review_location_bombhole, unk_loc_bh)).

% @attr review_location_snowboard_mag
% @type categorical
% @canonical false
% @original_name Snowboard Magazine test location
% @values aspen_snowmass=Aspen_Snowmass unk_loc_sm=Unknown
% @importance 0.55

0.75::true_val(review_location_snowboard_mag, aspen_snowmass); 0.25::true_val(review_location_snowboard_mag, unk_loc_sm).
0.78::acc(s66, review_location_snowboard_mag).
measured(s66, review_location_snowboard_mag, aspen_snowmass).
all_consistent(review_location_snowboard_mag) :- consistent(s66, review_location_snowboard_mag).
evidence(all_consistent(review_location_snowboard_mag)).
query(true_val(review_location_snowboard_mag, aspen_snowmass)).
query(true_val(review_location_snowboard_mag, unk_loc_sm)).

% @attr zeb_powell_size_preference
% @type categorical
% @canonical false
% @original_name Zeb Powell board size preference
% @values v160cm=160cm_daily_driver unk_zeb_size=Unknown
% @importance 0.35

0.86::true_val(zeb_powell_size_preference, v160cm); 0.14::true_val(zeb_powell_size_preference, unk_zeb_size).
0.90::acc(s67, zeb_powell_size_preference).
measured(s67, zeb_powell_size_preference, v160cm).
all_consistent(zeb_powell_size_preference) :- consistent(s67, zeb_powell_size_preference).
evidence(all_consistent(zeb_powell_size_preference)).
query(true_val(zeb_powell_size_preference, v160cm)).
query(true_val(zeb_powell_size_preference, unk_zeb_size)).

% @attr sizes_below_150_stiffness
% @type categorical
% @canonical false
% @original_name Sizes below 150cm stiffness
% @values women_friendly_stiffness=More_women_friendly_stiffness unk_sub150=Unknown
% @importance 0.65

0.45::true_val(sizes_below_150_stiffness, women_friendly_stiffness); 0.55::true_val(sizes_below_150_stiffness, unk_sub150).
0.50::acc(s68, sizes_below_150_stiffness).
measured(s68, sizes_below_150_stiffness, women_friendly_stiffness).
all_consistent(sizes_below_150_stiffness) :- consistent(s68, sizes_below_150_stiffness).
evidence(all_consistent(sizes_below_150_stiffness)).
query(true_val(sizes_below_150_stiffness, women_friendly_stiffness)).
query(true_val(sizes_below_150_stiffness, unk_sub150)).