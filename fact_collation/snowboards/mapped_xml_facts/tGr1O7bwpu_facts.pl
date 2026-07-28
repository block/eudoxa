0.20::indep(s2).
0.15::indep(s3).
0.15::indep(s7).
0.12::indep(s8).
0.12::indep(s15).
0.20::indep(s16).
0.15::indep(s18).
0.15::indep(s31).
0.15::indep(s32).
0.20::indep(s37).
0.20::indep(s38).
0.15::indep(s39).
0.25::indep(s40).
0.20::indep(s45).
0.15::indep(s46).
0.20::indep(s47).
0.15::indep(s48).
0.20::indep(s49).
0.20::indep(s50).
0.12::indep(s53).
0.20::indep(s54).
0.12::indep(s55).
0.12::indep(s56).
0.12::indep(s57).
0.12::indep(s58).
0.20::indep(s59).
0.15::indep(s60).
0.20::indep(s61).
0.15::indep(sm).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values burton_snowboards=Burton_Snowboards unk_manufacturer=Unknown
% @importance 0.95

0.97::true_val(manufacturer, burton_snowboards); 0.03::true_val(manufacturer, unk_manufacturer).
0.95::acc(s1, manufacturer).
0.80::acc(s2, manufacturer).
measured(s1, manufacturer, burton_snowboards).
measured(s2, manufacturer, burton_snowboards).
all_consistent(manufacturer) :- consistent(s1, manufacturer), (indep(s2), consistent(s2, manufacturer) ; \+indep(s2)).
evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, burton_snowboards)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values burton=Burton unk_brand=Unknown
% @importance 1.0

0.97::true_val(brand, burton); 0.03::true_val(brand, unk_brand).
0.95::acc(s1, brand).
measured(s1, brand, burton).
all_consistent(brand) :- consistent(s1, brand).
evidence(all_consistent(brand)).
query(true_val(brand, burton)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values ft_high_fidelity=Family_Tree_High_Fidelity unk_model_name=Unknown
% @importance 0.9

0.95::true_val(model_name, ft_high_fidelity); 0.05::true_val(model_name, unk_model_name).
0.90::acc(s2, model_name).
measured(s2, model_name, ft_high_fidelity).
all_consistent(model_name) :- (indep(s2), consistent(s2, model_name) ; \+indep(s2)).
evidence(all_consistent(model_name)).
query(true_val(model_name, ft_high_fidelity)).
query(true_val(model_name, unk_model_name)).

% @attr model_series
% @type categorical
% @canonical false
% @original_name model series
% @values family_tree=Family_Tree_Collection unk_model_series=Unknown
% @importance 0.6

0.85::true_val(model_series, family_tree); 0.15::true_val(model_series, unk_model_series).
0.82::acc(s3, model_series).
measured(s3, model_series, family_tree).
all_consistent(model_series) :- (indep(s3), consistent(s3, model_series) ; \+indep(s3)).
evidence(all_consistent(model_series)).
query(true_val(model_series, family_tree)).
query(true_val(model_series, unk_model_series)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2026=2026 unk_model_year=Unknown
% @importance 0.9

0.97::true_val(model_year, y2026); 0.03::true_val(model_year, unk_model_year).
0.95::acc(s4, model_year).
measured(s4, model_year, y2026).
all_consistent(model_year) :- consistent(s4, model_year).
evidence(all_consistent(model_year)).
query(true_val(model_year, y2026)).
query(true_val(model_year, unk_model_year)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2025=2025_season unk_model_first_available_year=Unknown
% @importance 0.8

0.80::true_val(model_first_available_year, season_2025); 0.20::true_val(model_first_available_year, unk_model_first_available_year).
0.78::acc(s5, model_first_available_year).
measured(s5, model_first_available_year, season_2025).
all_consistent(model_first_available_year) :- consistent(s5, model_first_available_year).
evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2025)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr construction_change_2026
% @type categorical
% @canonical false
% @original_name 2026 construction change
% @values none_unchanged=None_unchanged unk_construction_change_2026=Unknown
% @importance 0.85

0.95::true_val(construction_change_2026, none_unchanged); 0.05::true_val(construction_change_2026, unk_construction_change_2026).
0.95::acc(s6, construction_change_2026).
measured(s6, construction_change_2026, none_unchanged).
all_consistent(construction_change_2026) :- consistent(s6, construction_change_2026).
evidence(all_consistent(construction_change_2026)).
query(true_val(construction_change_2026, none_unchanged)).
query(true_val(construction_change_2026, unk_construction_change_2026)).

% @attr sku_au_merchant
% @type categorical
% @canonical false
% @original_name SKU (Australian merchant)
% @values sku_2437011a03rg154=2437011A03RG154 unk_sku_au_merchant=Unknown
% @importance 0.85

0.95::true_val(sku_au_merchant, sku_2437011a03rg154); 0.05::true_val(sku_au_merchant, unk_sku_au_merchant).
0.95::acc(sm, sku_au_merchant).
measured(sm, sku_au_merchant, sku_2437011a03rg154).
all_consistent(sku_au_merchant) :- consistent(sm, sku_au_merchant).
evidence(all_consistent(sku_au_merchant)).
query(true_val(sku_au_merchant, sku_2437011a03rg154)).
query(true_val(sku_au_merchant, unk_sku_au_merchant)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

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
% @values freeride_powder=Freeride_Powder unk_board_category=Unknown
% @importance 0.8

0.85::true_val(board_category, freeride_powder); 0.15::true_val(board_category, unk_board_category).
0.80::acc(s7, board_category).
measured(s7, board_category, freeride_powder).
all_consistent(board_category) :- (indep(s7), consistent(s7, board_category) ; \+indep(s7)).
evidence(all_consistent(board_category)).
query(true_val(board_category, freeride_powder)).
query(true_val(board_category, unk_board_category)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values unisex=Unisex unk_gender=Unknown
% @importance 0.6

0.85::true_val(gender, unisex); 0.15::true_val(gender, unk_gender).
0.78::acc(s8, gender).
measured(s8, gender, unisex).
all_consistent(gender) :- (indep(s8), consistent(s8, gender) ; \+indep(s8)).
evidence(all_consistent(gender)).
query(true_val(gender, unisex)).
query(true_val(gender, unk_gender)).

% @attr limited_edition_status
% @type categorical
% @canonical false
% @original_name limited edition status
% @values limited_edition=Limited_edition unk_limited_edition_status=Unknown
% @importance 0.5

0.90::true_val(limited_edition_status, limited_edition); 0.10::true_val(limited_edition_status, unk_limited_edition_status).
0.90::acc(s9, limited_edition_status).
measured(s9, limited_edition_status, limited_edition).
all_consistent(limited_edition_status) :- consistent(s9, limited_edition_status).
evidence(all_consistent(limited_edition_status)).
query(true_val(limited_edition_status, limited_edition)).
query(true_val(limited_edition_status, unk_limited_edition_status)).

% @attr manufacturer_founded
% @type categorical
% @canonical false
% @original_name manufacturer founded
% @values y1977_jake_burton=1977_Jake_Burton_Carpenter_Londonderry_VT unk_manufacturer_founded=Unknown
% @importance 0.5

0.88::true_val(manufacturer_founded, y1977_jake_burton); 0.12::true_val(manufacturer_founded, unk_manufacturer_founded).
0.88::acc(s10, manufacturer_founded).
measured(s10, manufacturer_founded, y1977_jake_burton).
all_consistent(manufacturer_founded) :- consistent(s10, manufacturer_founded).
evidence(all_consistent(manufacturer_founded)).
query(true_val(manufacturer_founded, y1977_jake_burton)).
query(true_val(manufacturer_founded, unk_manufacturer_founded)).

% @attr manufacturer_headquarters
% @type categorical
% @canonical false
% @original_name manufacturer headquarters
% @values burlington_vt_usa=Burlington_Vermont_USA unk_manufacturer_headquarters=Unknown
% @importance 0.4

0.87::true_val(manufacturer_headquarters, burlington_vt_usa); 0.13::true_val(manufacturer_headquarters, unk_manufacturer_headquarters).
0.85::acc(s11, manufacturer_headquarters).
measured(s11, manufacturer_headquarters, burlington_vt_usa).
all_consistent(manufacturer_headquarters) :- consistent(s11, manufacturer_headquarters).
evidence(all_consistent(manufacturer_headquarters)).
query(true_val(manufacturer_headquarters, burlington_vt_usa)).
query(true_val(manufacturer_headquarters, unk_manufacturer_headquarters)).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values austria_keil=Austria_Keil_factory unk_manufacturing_location_current=Unknown
% @importance 0.6

0.92::true_val(manufacturing_location_current, austria_keil); 0.08::true_val(manufacturing_location_current, unk_manufacturing_location_current).
0.88::acc(s12, manufacturing_location_current).
0.75::acc(s13, manufacturing_location_current).
measured(s12, manufacturing_location_current, austria_keil).
measured(s13, manufacturing_location_current, austria_keil).
all_consistent(manufacturing_location_current) :- consistent(s12, manufacturing_location_current), consistent(s13, manufacturing_location_current).
evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, austria_keil)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values b_corp=B_Corporation unk_sustainability_certification=Unknown
% @importance 0.4

0.82::true_val(sustainability_certification, b_corp); 0.18::true_val(sustainability_certification, unk_sustainability_certification).
0.80::acc(s14, sustainability_certification).
measured(s14, sustainability_certification, b_corp).
all_consistent(sustainability_certification) :- consistent(s14, sustainability_certification).
evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, b_corp)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr design_inspiration
% @type categorical
% @canonical false
% @original_name design inspiration
% @values natural_selection_tour=Natural_Selection_Tour unk_design_inspiration=Unknown
% @importance 0.7

0.82::true_val(design_inspiration, natural_selection_tour); 0.18::true_val(design_inspiration, unk_design_inspiration).
0.78::acc(s15, design_inspiration).
measured(s15, design_inspiration, natural_selection_tour).
all_consistent(design_inspiration) :- (indep(s15), consistent(s15, design_inspiration) ; \+indep(s15)).
evidence(all_consistent(design_inspiration)).
query(true_val(design_inspiration, natural_selection_tour)).
query(true_val(design_inspiration, unk_design_inspiration)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values ferguson_fasani=Ben_Ferguson_and_Kimmy_Fasani unk_pro_rider_name=Unknown
% @importance 0.5

0.75::true_val(pro_rider_name, ferguson_fasani); 0.25::true_val(pro_rider_name, unk_pro_rider_name).
0.72::acc(s16, pro_rider_name).
measured(s16, pro_rider_name, ferguson_fasani).
all_consistent(pro_rider_name) :- (indep(s16), consistent(s16, pro_rider_name) ; \+indep(s16)).
evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, ferguson_fasani)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr topsheet_appearance_description
% @type categorical
% @canonical true
% @original_name topsheet_appearance_description
% @values vulture_graphic=Bird_themed_vulture_graphic unk_topsheet_appearance_description=Unknown
% @importance 0.3

0.93::true_val(topsheet_appearance_description, vulture_graphic); 0.07::true_val(topsheet_appearance_description, unk_topsheet_appearance_description).
0.93::acc(s17, topsheet_appearance_description).
measured(s17, topsheet_appearance_description, vulture_graphic).
all_consistent(topsheet_appearance_description) :- consistent(s17, topsheet_appearance_description).
evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, vulture_graphic)).
query(true_val(topsheet_appearance_description, unk_topsheet_appearance_description)).

% @attr topsheet_appearance_description_detail
% @type categorical
% @canonical false
% @original_name topsheet_appearance_description (detail)
% @values vulture_big_mountain=Soaring_high_mountain_vulture_energy unk_topsheet_appearance_description_detail=Unknown
% @importance 0.25

0.78::true_val(topsheet_appearance_description_detail, vulture_big_mountain); 0.22::true_val(topsheet_appearance_description_detail, unk_topsheet_appearance_description_detail).
0.75::acc(s18, topsheet_appearance_description_detail).
measured(s18, topsheet_appearance_description_detail, vulture_big_mountain).
all_consistent(topsheet_appearance_description_detail) :- (indep(s18), consistent(s18, topsheet_appearance_description_detail) ; \+indep(s18)).
evidence(all_consistent(topsheet_appearance_description_detail)).
query(true_val(topsheet_appearance_description_detail, vulture_big_mountain)).
query(true_val(topsheet_appearance_description_detail, unk_topsheet_appearance_description_detail)).

% @attr topsheet_appearance_description_colors
% @type categorical
% @canonical false
% @original_name topsheet_appearance_description (colors)
% @values orange_green_black=Vibrant_orange_green_black unk_topsheet_appearance_description_colors=Unknown
% @importance 0.2

0.72::true_val(topsheet_appearance_description_colors, orange_green_black); 0.28::true_val(topsheet_appearance_description_colors, unk_topsheet_appearance_description_colors).
0.75::acc(s19, topsheet_appearance_description_colors).
measured(s19, topsheet_appearance_description_colors, orange_green_black).
all_consistent(topsheet_appearance_description_colors) :- consistent(s19, topsheet_appearance_description_colors).
evidence(all_consistent(topsheet_appearance_description_colors)).
query(true_val(topsheet_appearance_description_colors, orange_green_black)).
query(true_val(topsheet_appearance_description_colors, unk_topsheet_appearance_description_colors)).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v680=680.0
% @importance 0.95

0.95::true_val(price_usd_msrp, v680); 0.05::true_val(price_usd_msrp, unk_price_usd_msrp).
0.90::acc(s20, price_usd_msrp).
measured(s20, price_usd_msrp, v680).
all_consistent(price_usd_msrp) :- consistent(s20, price_usd_msrp).
evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v680)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical false
% @original_name price_aud_merchant
% @values v1099_99=1099.99
% @importance 0.85

0.95::true_val(price_aud_merchant, v1099_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).
0.95::acc(sm, price_aud_merchant).
measured(sm, price_aud_merchant, v1099_99).
all_consistent(price_aud_merchant) :- consistent(sm, price_aud_merchant).
evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v1099_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_cad_prfo
% @type numeric
% @unit CAD
% @canonical false
% @original_name price_cad_prfo
% @values v889_99=889.99
% @importance 0.85

0.80::true_val(price_cad_prfo, v889_99); 0.20::true_val(price_cad_prfo, unk_price_cad_prfo).
0.78::acc(s21, price_cad_prfo).
measured(s21, price_cad_prfo, v889_99).
all_consistent(price_cad_prfo) :- consistent(s21, price_cad_prfo).
evidence(all_consistent(price_cad_prfo)).
query(true_val(price_cad_prfo, v889_99)).
query(true_val(price_cad_prfo, unk_price_cad_prfo)).

% @attr price_eur_blue_tomato
% @type numeric
% @unit EUR
% @canonical false
% @original_name price_eur_blue_tomato
% @values v569=569.0
% @importance 0.8

0.75::true_val(price_eur_blue_tomato, v569); 0.25::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).
0.72::acc(s22, price_eur_blue_tomato).
measured(s22, price_eur_blue_tomato, v569).
all_consistent(price_eur_blue_tomato) :- consistent(s22, price_eur_blue_tomato).
evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v569)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

% @attr price_skatepro_discounted
% @type numeric
% @unit USD
% @canonical false
% @original_name price (SkatePro, discounted 24/25 model)
% @values v569_95=569.95
% @importance 0.85

0.72::true_val(price_skatepro_discounted, v569_95); 0.28::true_val(price_skatepro_discounted, unk_price_skatepro_discounted).
0.70::acc(s23, price_skatepro_discounted).
measured(s23, price_skatepro_discounted, v569_95).
all_consistent(price_skatepro_discounted) :- consistent(s23, price_skatepro_discounted).
evidence(all_consistent(price_skatepro_discounted)).
query(true_val(price_skatepro_discounted, v569_95)).
query(true_val(price_skatepro_discounted, unk_price_skatepro_discounted)).

% @attr price_salty_peaks_sale
% @type numeric
% @unit USD
% @canonical false
% @original_name price (Salty Peaks, sale price 2025 model)
% @values v544=544.0
% @importance 0.9

0.76::true_val(price_salty_peaks_sale, v544); 0.24::true_val(price_salty_peaks_sale, unk_price_salty_peaks_sale).
0.74::acc(s24, price_salty_peaks_sale).
measured(s24, price_salty_peaks_sale, v544).
all_consistent(price_salty_peaks_sale) :- consistent(s24, price_salty_peaks_sale).
evidence(all_consistent(price_salty_peaks_sale)).
query(true_val(price_salty_peaks_sale, v544)).
query(true_val(price_salty_peaks_sale, unk_price_salty_peaks_sale)).

% @attr price_usd_rei
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_rei
% @values v419_83=419.83
% @importance 0.85

0.72::true_val(price_usd_rei, v419_83); 0.28::true_val(price_usd_rei, unk_price_usd_rei).
0.70::acc(s25, price_usd_rei).
measured(s25, price_usd_rei, v419_83).
all_consistent(price_usd_rei) :- consistent(s25, price_usd_rei).
evidence(all_consistent(price_usd_rei)).
query(true_val(price_usd_rei, v419_83)).
query(true_val(price_usd_rei, unk_price_usd_rei)).

% @attr price_sun_ski
% @type numeric
% @unit USD
% @canonical false
% @original_name price (Sun & Ski Sports, discounted)
% @values v559_93=559.93
% @importance 0.8

0.68::true_val(price_sun_ski, v559_93); 0.32::true_val(price_sun_ski, unk_price_sun_ski).
0.65::acc(s26, price_sun_ski).
measured(s26, price_sun_ski, v559_93).
all_consistent(price_sun_ski) :- consistent(s26, price_sun_ski).
evidence(all_consistent(price_sun_ski)).
query(true_val(price_sun_ski, v559_93)).
query(true_val(price_sun_ski, unk_price_sun_ski)).

% @attr price_blauer
% @type numeric
% @unit USD
% @canonical false
% @original_name price (Blauer Board Shop)
% @values v599_99=599.99
% @importance 0.8

0.75::true_val(price_blauer, v599_99); 0.25::true_val(price_blauer, unk_price_blauer).
0.73::acc(s27, price_blauer).
measured(s27, price_blauer, v599_99).
all_consistent(price_blauer) :- consistent(s27, price_blauer).
evidence(all_consistent(price_blauer)).
query(true_val(price_blauer, v599_99)).
query(true_val(price_blauer, unk_price_blauer)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values widely_available=Widely_available_multiple_retailers unk_availability_status=Unknown
% @importance 0.85

0.95::true_val(availability_status, widely_available); 0.05::true_val(availability_status, unk_availability_status).
0.92::acc(sm, availability_status).
measured(sm, availability_status, widely_available).
all_consistent(availability_status) :- consistent(sm, availability_status).
evidence(all_consistent(availability_status)).
query(true_val(availability_status, widely_available)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_discontinued
% @type categorical
% @canonical false
% @original_name availability_status (discontinued notice)
% @values discontinued=Discontinued_at_REI unk_availability_status_discontinued=Unknown
% @importance 0.75

0.88::true_val(availability_status_discontinued, discontinued); 0.12::true_val(availability_status_discontinued, unk_availability_status_discontinued).
0.87::acc(s28, availability_status_discontinued).
measured(s28, availability_status_discontinued, discontinued).
all_consistent(availability_status_discontinued) :- consistent(s28, availability_status_discontinued).
evidence(all_consistent(availability_status_discontinued)).
query(true_val(availability_status_discontinued, discontinued)).
query(true_val(availability_status_discontinued, unk_availability_status_discontinued)).

% @attr availability_status_backordered
% @type categorical
% @canonical false
% @original_name availability_status (backordered)
% @values backordered_154=154cm_backordered unk_availability_status_backordered=Unknown
% @importance 0.6

0.72::true_val(availability_status_backordered, backordered_154); 0.28::true_val(availability_status_backordered, unk_availability_status_backordered).
0.70::acc(s29, availability_status_backordered).
measured(s29, availability_status_backordered, backordered_154).
all_consistent(availability_status_backordered) :- consistent(s29, availability_status_backordered).
evidence(all_consistent(availability_status_backordered)).
query(true_val(availability_status_backordered, backordered_154)).
query(true_val(availability_status_backordered, unk_availability_status_backordered)).

% @attr australian_shipping_restriction
% @type categorical
% @canonical false
% @original_name Australian shipping restriction
% @values au_only=Only_ships_within_Australia unk_australian_shipping_restriction=Unknown
% @importance 0.5

0.78::true_val(australian_shipping_restriction, au_only); 0.22::true_val(australian_shipping_restriction, unk_australian_shipping_restriction).
0.75::acc(s30, australian_shipping_restriction).
measured(s30, australian_shipping_restriction, au_only).
all_consistent(australian_shipping_restriction) :- consistent(s30, australian_shipping_restriction).
evidence(all_consistent(australian_shipping_restriction)).
query(true_val(australian_shipping_restriction, au_only)).
query(true_val(australian_shipping_restriction, unk_australian_shipping_restriction)).

% @attr warranty
% @type categorical
% @canonical false
% @original_name warranty
% @values three_year=3_year_warranty unk_warranty=Unknown
% @importance 0.75

0.82::true_val(warranty, three_year); 0.18::true_val(warranty, unk_warranty).
0.80::acc(s31, warranty).
measured(s31, warranty, three_year).
all_consistent(warranty) :- (indep(s31), consistent(s31, warranty) ; \+indep(s31)).
evidence(all_consistent(warranty)).
query(true_val(warranty, three_year)).
query(true_val(warranty, unk_warranty)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional_Freeride unk_shape=Unknown
% @importance 0.9

0.95::true_val(shape, tapered_directional); 0.05::true_val(shape, unk_shape).
0.82::acc(s32, shape).
0.88::acc(sm, shape).
measured(s32, shape, tapered_directional).
measured(sm, shape, tapered_directional).
all_consistent(shape) :- (indep(s32), consistent(s32, shape) ; \+indep(s32)), (indep(sm), consistent(sm, shape) ; \+indep(sm)).
evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

% @attr taper
% @type numeric
% @unit mm
% @canonical false
% @original_name taper
% @values v7=7.0
% @importance 0.85

0.97::true_val(taper, v7); 0.03::true_val(taper, unk_taper).
0.95::acc(s33, taper).
measured(s33, taper, v7).
all_consistent(taper) :- consistent(s33, taper).
evidence(all_consistent(taper)).
query(true_val(taper, v7)).
query(true_val(taper, unk_taper)).

% @attr setback
% @type numeric
% @unit mm
% @canonical false
% @original_name setback
% @values v_neg25=neg25.0
% @importance 0.8

0.95::true_val(setback, v_neg25); 0.05::true_val(setback, unk_setback).
0.93::acc(s34, setback).
measured(s34, setback, v_neg25).
all_consistent(setback) :- consistent(s34, setback).
evidence(all_consistent(setback)).
query(true_val(setback, v_neg25)).
query(true_val(setback, unk_setback)).

% @attr nose_design
% @type categorical
% @canonical false
% @original_name nose design
% @values elongated_blunted=Elongated_blunted_nose unk_nose_design=Unknown
% @importance 0.7

0.85::true_val(nose_design, elongated_blunted); 0.15::true_val(nose_design, unk_nose_design).
0.85::acc(s35, nose_design).
measured(s35, nose_design, elongated_blunted).
all_consistent(nose_design) :- consistent(s35, nose_design).
evidence(all_consistent(nose_design)).
query(true_val(nose_design, elongated_blunted)).
query(true_val(nose_design, unk_nose_design)).

% @attr tail_design
% @type categorical
% @canonical false
% @original_name tail design
% @values squashed_egg=Squashed_egg_shaped_tail unk_tail_design=Unknown
% @importance 0.6

0.85::true_val(tail_design, squashed_egg); 0.15::true_val(tail_design, unk_tail_design).
0.85::acc(s36, tail_design).
measured(s36, tail_design, squashed_egg).
all_consistent(tail_design) :- consistent(s36, tail_design).
evidence(all_consistent(tail_design)).
query(true_val(tail_design, squashed_egg)).
query(true_val(tail_design, unk_tail_design)).

% @attr tip_tail_technology
% @type categorical
% @canonical false
% @original_name tip/tail technology
% @values pro_tip=Pro_Tip_tapered_thickness unk_tip_tail_technology=Unknown
% @importance 0.65

0.88::true_val(tip_tail_technology, pro_tip); 0.12::true_val(tip_tail_technology, unk_tip_tail_technology).
0.85::acc(s37, tip_tail_technology).
measured(s37, tip_tail_technology, pro_tip).
all_consistent(tip_tail_technology) :- (indep(s37), consistent(s37, tip_tail_technology) ; \+indep(s37)).
evidence(all_consistent(tip_tail_technology)).
query(true_val(tip_tail_technology, pro_tip)).
query(true_val(tip_tail_technology, unk_tip_tail_technology)).

% @attr freeride_geometry
% @type categorical
% @canonical false
% @original_name freeride geometry
% @values balanced_freeride=Balanced_Freeride_Geometry unk_freeride_geometry=Unknown
% @importance 0.85

0.88::true_val(freeride_geometry, balanced_freeride); 0.12::true_val(freeride_geometry, unk_freeride_geometry).
0.85::acc(s38, freeride_geometry).
measured(s38, freeride_geometry, balanced_freeride).
all_consistent(freeride_geometry) :- (indep(s38), consistent(s38, freeride_geometry) ; \+indep(s38)).
evidence(all_consistent(freeride_geometry)).
query(true_val(freeride_geometry, balanced_freeride)).
query(true_val(freeride_geometry, unk_freeride_geometry)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values directional_camber=Directional_Camber_rocker_nose_camber_feet unk_camber_type=Unknown
% @importance 0.9

0.85::true_val(camber_type, directional_camber); 0.15::true_val(camber_type, unk_camber_type).
0.80::acc(s39, camber_type).
measured(s39, camber_type, directional_camber).
all_consistent(camber_type) :- (indep(s39), consistent(s39, camber_type) ; \+indep(s39)).
evidence(all_consistent(camber_type)).
query(true_val(camber_type, directional_camber)).
query(true_val(camber_type, unk_camber_type)).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v7_5=7.5 unk_flex_rating_10=Unknown
% @importance 0.88

0.95::true_val(flex_rating_10, v7_5); 0.05::true_val(flex_rating_10, unk_flex_rating_10).
0.88::acc(sm, flex_rating_10).
0.78::acc(s40, flex_rating_10).
measured(sm, flex_rating_10, v7_5).
measured(s40, flex_rating_10, v7_5).
all_consistent(flex_rating_10) :- (indep(sm), consistent(sm, flex_rating_10) ; \+indep(sm)), (indep(s40), consistent(s40, flex_rating_10) ; \+indep(s40)).
evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v7_5)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values v8_out_of_10=8_out_of_10_feel medium_stiff=Medium_Stiff
% @importance 0.85

0.48::true_val(flex_feel, v8_out_of_10); 0.52::true_val(flex_feel, medium_stiff).
0.82::acc(s41, flex_feel).
0.80::acc(s42, flex_feel).
0.85::acc(s43, flex_feel).
0.82::acc(s67, flex_feel).
measured(s41, flex_feel, v8_out_of_10).
measured(s42, flex_feel, v8_out_of_10).
measured(s43, flex_feel, medium_stiff).
measured(s67, flex_feel, medium_stiff).
all_consistent(flex_feel) :- consistent(s41, flex_feel), consistent(s42, flex_feel), consistent(s43, flex_feel), consistent(s67, flex_feel).
evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, v8_out_of_10)).
query(true_val(flex_feel, medium_stiff)).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values directional=Directional_flex unk_flex_direction=Unknown
% @importance 0.9

0.95::true_val(flex_direction, directional); 0.05::true_val(flex_direction, unk_flex_direction).
0.88::acc(sm, flex_direction).
0.82::acc(s32, flex_direction).
measured(sm, flex_direction, directional).
measured(s32, flex_direction, directional).
all_consistent(flex_direction) :- (indep(sm), consistent(sm, flex_direction) ; \+indep(sm)), (indep(s32), consistent(s32, flex_direction) ; \+indep(s32)).
evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr flex_torsional_character
% @type categorical
% @canonical false
% @original_name flex torsional character
% @values stiffer_torsionally=Stiffer_torsionally_than_longitudinally unk_flex_torsional_character=Unknown
% @importance 0.7

0.78::true_val(flex_torsional_character, stiffer_torsionally); 0.22::true_val(flex_torsional_character, unk_flex_torsional_character).
0.80::acc(s44, flex_torsional_character).
measured(s44, flex_torsional_character, stiffer_torsionally).
all_consistent(flex_torsional_character) :- consistent(s44, flex_torsional_character).
evidence(all_consistent(flex_torsional_character)).
query(true_val(flex_torsional_character, stiffer_torsionally)).
query(true_val(flex_torsional_character, unk_flex_torsional_character)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values super_fly_ii_700g=Super_Fly_II_700G_dual_species unk_core_material=Unknown
% @importance 0.8

0.95::true_val(core_material, super_fly_ii_700g); 0.05::true_val(core_material, unk_core_material).
0.85::acc(s45, core_material).
0.85::acc(s46, core_material).
measured(s45, core_material, super_fly_ii_700g).
measured(s46, core_material, super_fly_ii_700g).
all_consistent(core_material) :- (indep(s45), consistent(s45, core_material) ; \+indep(s45)), (indep(s46), consistent(s46, core_material) ; \+indep(s46)).
evidence(all_consistent(core_material)).
query(true_val(core_material, super_fly_ii_700g)).
query(true_val(core_material, unk_core_material)).

% @attr core_profiling
% @type categorical
% @canonical false
% @original_name core profiling
% @values squeezebox=Squeezebox_profile unk_core_profiling=Unknown
% @importance 0.7

0.88::true_val(core_profiling, squeezebox); 0.12::true_val(core_profiling, unk_core_profiling).
0.85::acc(s47, core_profiling).
measured(s47, core_profiling, squeezebox).
all_consistent(core_profiling) :- (indep(s47), consistent(s47, core_profiling) ; \+indep(s47)).
evidence(all_consistent(core_profiling)).
query(true_val(core_profiling, squeezebox)).
query(true_val(core_profiling, unk_core_profiling)).

% @attr core_zones
% @type categorical
% @canonical false
% @original_name core zones
% @values dualzone_egd=Dualzone_EGD unk_core_zones=Unknown
% @importance 0.65

0.78::true_val(core_zones, dualzone_egd); 0.22::true_val(core_zones, unk_core_zones).
0.75::acc(s48, core_zones).
measured(s48, core_zones, dualzone_egd).
all_consistent(core_zones) :- (indep(s48), consistent(s48, core_zones) ; \+indep(s48)).
evidence(all_consistent(core_zones)).
query(true_val(core_zones, dualzone_egd)).
query(true_val(core_zones, unk_core_zones)).

% @attr laminate
% @type categorical
% @canonical false
% @original_name laminate
% @values carbon_45_highlights=45_degree_Carbon_Highlights unk_laminate=Unknown
% @importance 0.8

0.88::true_val(laminate, carbon_45_highlights); 0.12::true_val(laminate, unk_laminate).
0.85::acc(s49, laminate).
measured(s49, laminate, carbon_45_highlights).
all_consistent(laminate) :- (indep(s49), consistent(s49, laminate) ; \+indep(s49)).
evidence(all_consistent(laminate)).
query(true_val(laminate, carbon_45_highlights)).
query(true_val(laminate, unk_laminate)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_wfo=Sintered_WFO unk_base_material=Unknown
% @importance 0.75

0.88::true_val(base_material, sintered_wfo); 0.12::true_val(base_material, unk_base_material).
0.85::acc(s50, base_material).
measured(s50, base_material, sintered_wfo).
all_consistent(base_material) :- (indep(s50), consistent(s50, base_material) ; \+indep(s50)).
evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_wfo)).
query(true_val(base_material, unk_base_material)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values fastest_in_review=Fastest_in_review good=Good
% @importance 0.7

0.40::true_val(base_glide_performance, fastest_in_review); 0.60::true_val(base_glide_performance, good).
0.88::acc(s51, base_glide_performance).
0.82::acc(s52, base_glide_performance).
0.82::acc(s67, base_glide_performance).
measured(s51, base_glide_performance, fastest_in_review).
measured(s52, base_glide_performance, good).
measured(s67, base_glide_performance, good).
all_consistent(base_glide_performance) :- consistent(s51, base_glide_performance), consistent(s52, base_glide_performance), consistent(s67, base_glide_performance).
evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, fastest_in_review)).
query(true_val(base_glide_performance, good)).

% @attr resin
% @type categorical
% @canonical false
% @original_name resin
% @values super_sap_epoxy=Super_Sap_Epoxy_bio_based unk_resin=Unknown
% @importance 0.5

0.82::true_val(resin, super_sap_epoxy); 0.18::true_val(resin, unk_resin).
0.78::acc(s53, resin).
measured(s53, resin, super_sap_epoxy).
all_consistent(resin) :- (indep(s53), consistent(s53, resin) ; \+indep(s53)).
evidence(all_consistent(resin)).
query(true_val(resin, super_sap_epoxy)).
query(true_val(resin, unk_resin)).

% @attr durability_technology
% @type categorical
% @canonical false
% @original_name durability technology
% @values infinite_ride=Infinite_Ride unk_durability_technology=Unknown
% @importance 0.65

0.88::true_val(durability_technology, infinite_ride); 0.12::true_val(durability_technology, unk_durability_technology).
0.85::acc(s54, durability_technology).
measured(s54, durability_technology, infinite_ride).
all_consistent(durability_technology) :- (indep(s54), consistent(s54, durability_technology) ; \+indep(s54)).
evidence(all_consistent(durability_technology)).
query(true_val(durability_technology, infinite_ride)).
query(true_val(durability_technology, unk_durability_technology)).

% @attr factory_tuning
% @type categorical
% @canonical false
% @original_name factory tuning
% @values waxed_ready=Waxed_and_ready_from_factory unk_factory_tuning=Unknown
% @importance 0.4

0.78::true_val(factory_tuning, waxed_ready); 0.22::true_val(factory_tuning, unk_factory_tuning).
0.75::acc(s55, factory_tuning).
measured(s55, factory_tuning, waxed_ready).
all_consistent(factory_tuning) :- (indep(s55), consistent(s55, factory_tuning) ; \+indep(s55)).
evidence(all_consistent(factory_tuning)).
query(true_val(factory_tuning, waxed_ready)).
query(true_val(factory_tuning, unk_factory_tuning)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values the_channel=The_Channel unk_mounting_pattern=Unknown
% @importance 0.8

0.82::true_val(mounting_pattern, the_channel); 0.18::true_val(mounting_pattern, unk_mounting_pattern).
0.80::acc(s56, mounting_pattern).
measured(s56, mounting_pattern, the_channel).
all_consistent(mounting_pattern) :- (indep(s56), consistent(s56, mounting_pattern) ; \+indep(s56)).
evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, the_channel)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values all_major_est_optimized=All_major_brands_EST_optimized unk_binding_compatibility=Unknown
% @importance 0.8

0.82::true_val(binding_compatibility, all_major_est_optimized); 0.18::true_val(binding_compatibility, unk_binding_compatibility).
0.80::acc(s57, binding_compatibility).
measured(s57, binding_compatibility, all_major_est_optimized).
all_consistent(binding_compatibility) :- (indep(s57), consistent(s57, binding_compatibility) ; \+indep(s57)).
evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, all_major_est_optimized)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

% @attr mounting_screws_per_binding
% @type numeric
% @unit screws
% @canonical false
% @original_name mounting screws per binding
% @values v2=2
% @importance 0.55

0.82::true_val(mounting_screws_per_binding, v2); 0.18::true_val(mounting_screws_per_binding, unk_mounting_screws_per_binding).
0.80::acc(s58, mounting_screws_per_binding).
measured(s58, mounting_screws_per_binding, v2).
all_consistent(mounting_screws_per_binding) :- (indep(s58), consistent(s58, mounting_screws_per_binding) ; \+indep(s58)).
evidence(all_consistent(mounting_screws_per_binding)).
query(true_val(mounting_screws_per_binding, v2)).
query(true_val(mounting_screws_per_binding, unk_mounting_screws_per_binding)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values s154_158_162=154_158_162cm unk_available_sizes=Unknown
% @importance 0.85

0.95::true_val(available_sizes, s154_158_162); 0.05::true_val(available_sizes, unk_available_sizes).
0.95::acc(sm, available_sizes).
measured(sm, available_sizes, s154_158_162).
all_consistent(available_sizes) :- consistent(sm, available_sizes).
evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, s154_158_162)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr available_sizes_wide
% @type categorical
% @canonical false
% @original_name available_sizes (wide)
% @values s158w=158W unk_available_sizes_wide=Unknown
% @importance 0.85

0.95::true_val(available_sizes_wide, s158w); 0.05::true_val(available_sizes_wide, unk_available_sizes_wide).
0.95::acc(sm, available_sizes_wide).
measured(sm, available_sizes_wide, s158w).
all_consistent(available_sizes_wide) :- consistent(sm, available_sizes_wide).
evidence(all_consistent(available_sizes_wide)).
query(true_val(available_sizes_wide, s158w)).
query(true_val(available_sizes_wide, unk_available_sizes_wide)).

% @attr available_sizes_additional
% @type categorical
% @canonical false
% @original_name available_sizes (additional at some retailers)
% @values s150_166mw_162w=150_166MW_162W unk_available_sizes_additional=Unknown
% @importance 0.85

0.95::true_val(available_sizes_additional, s150_166mw_162w); 0.05::true_val(available_sizes_additional, unk_available_sizes_additional).
0.95::acc(sm, available_sizes_additional).
measured(sm, available_sizes_additional, s150_166mw_162w).
all_consistent(available_sizes_additional) :- consistent(sm, available_sizes_additional).
evidence(all_consistent(available_sizes_additional)).
query(true_val(available_sizes_additional, s150_166mw_162w)).
query(true_val(available_sizes_additional, unk_available_sizes_additional)).

% @attr waist_width_154
% @type numeric
% @unit mm
% @canonical false
% @original_name waist_width_154
% @values v248=248.0
% @importance 0.85

0.95::true_val(waist_width_154, v248); 0.05::true_val(waist_width_154, unk_waist_width_154).
0.93::acc(sm, waist_width_154).
measured(sm, waist_width_154, v248).
all_consistent(waist_width_154) :- consistent(sm, waist_width_154).
evidence(all_consistent(waist_width_154)).
query(true_val(waist_width_154, v248)).
query(true_val(waist_width_154, unk_waist_width_154)).

% @attr waist_width_158
% @type numeric
% @unit mm
% @canonical false
% @original_name waist_width_158
% @values v250=250.0
% @importance 0.85

0.95::true_val(waist_width_158, v250); 0.05::true_val(waist_width_158, unk_waist_width_158).
0.93::acc(sm, waist_width_158).
measured(sm, waist_width_158, v250).
all_consistent(waist_width_158) :- consistent(sm, waist_width_158).
evidence(all_consistent(waist_width_158)).
query(true_val(waist_width_158, v250)).
query(true_val(waist_width_158, unk_waist_width_158)).

% @attr waist_width_162
% @type numeric
% @unit mm
% @canonical false
% @original_name waist_width_162
% @values v254=254.0
% @importance 0.85

0.95::true_val(waist_width_162, v254); 0.05::true_val(waist_width_162, unk_waist_width_162).
0.93::acc(sm, waist_width_162).
measured(sm, waist_width_162, v254).
all_consistent(waist_width_162) :- consistent(sm, waist_width_162).
evidence(all_consistent(waist_width_162)).
query(true_val(waist_width_162, v254)).
query(true_val(waist_width_162, unk_waist_width_162)).

% @attr waist_width_158w
% @type numeric
% @unit mm
% @canonical false
% @original_name waist_width_158W
% @values v258=258.0
% @importance 0.85

0.95::true_val(waist_width_158w, v258); 0.05::true_val(waist_width_158w, unk_waist_width_158w).
0.93::acc(sm, waist_width_158w).
measured(sm, waist_width_158w, v258).
all_consistent(waist_width_158w) :- consistent(sm, waist_width_158w).
evidence(all_consistent(waist_width_158w)).
query(true_val(waist_width_158w, v258)).
query(true_val(waist_width_158w, unk_waist_width_158w)).

% @attr waist_width_150
% @type numeric
% @unit mm
% @canonical false
% @original_name waist_width_150
% @values v245=245.0
% @importance 0.85

0.95::true_val(waist_width_150, v245); 0.05::true_val(waist_width_150, unk_waist_width_150).
0.93::acc(sm, waist_width_150).
measured(sm, waist_width_150, v245).
all_consistent(waist_width_150) :- consistent(sm, waist_width_150).
evidence(all_consistent(waist_width_150)).
query(true_val(waist_width_150, v245)).
query(true_val(waist_width_150, unk_waist_width_150)).

% @attr waist_width_166mw
% @type numeric
% @unit mm
% @canonical false
% @original_name waist_width_166MW
% @values v260=260.0
% @importance 0.85

0.95::true_val(waist_width_166mw, v260); 0.05::true_val(waist_width_166mw, unk_waist_width_166mw).
0.93::acc(sm, waist_width_166mw).
measured(sm, waist_width_166mw, v260).
all_consistent(waist_width_166mw) :- consistent(sm, waist_width_166mw).
evidence(all_consistent(waist_width_166mw)).
query(true_val(waist_width_166mw, v260)).
query(true_val(waist_width_166mw, unk_waist_width_166mw)).

% @attr waist_width_162w
% @type numeric
% @unit mm
% @canonical false
% @original_name waist_width_162W
% @values v260=260.0
% @importance 0.85

0.95::true_val(waist_width_162w, v260w); 0.05::true_val(waist_width_162w, unk_waist_width_162w).
0.93::acc(sm, waist_width_162w).
measured(sm, waist_width_162w, v260w).
all_consistent(waist_width_162w) :- consistent(sm, waist_width_162w).
evidence(all_consistent(waist_width_162w)).
query(true_val(waist_width_162w, v260w)).
query(true_val(waist_width_162w, unk_waist_width_162w)).

% @attr tip_tail_width_size_154
% @type categorical
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (154)
% @values v29_01_28_31=29.01/28.31
% @importance 0.85

0.95::true_val(tip_tail_width_size_154, v29_01_28_31); 0.05::true_val(tip_tail_width_size_154, unk_tip_tail_width_size_154).
0.93::acc(sm, tip_tail_width_size_154).
measured(sm, tip_tail_width_size_154, v29_01_28_31).
all_consistent(tip_tail_width_size_154) :- consistent(sm, tip_tail_width_size_154).
evidence(all_consistent(tip_tail_width_size_154)).
query(true_val(tip_tail_width_size_154, v29_01_28_31)).
query(true_val(tip_tail_width_size_154, unk_tip_tail_width_size_154)).

% @attr tip_tail_width_size
% @type categorical
% @unit cm
% @canonical true
% @original_name tip_tail_width_size (158)
% @values v29_35_28_65=29.35/28.65
% @importance 0.85

0.95::true_val(tip_tail_width_size, v29_35_28_65); 0.05::true_val(tip_tail_width_size, unk_tip_tail_width_size).
0.93::acc(sm, tip_tail_width_size).
measured(sm, tip_tail_width_size, v29_35_28_65).
all_consistent(tip_tail_width_size) :- consistent(sm, tip_tail_width_size).
evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v29_35_28_65)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr tip_tail_width_size_162
% @type categorical
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (162)
% @values v29_89_29_19=29.89/29.19
% @importance 0.85

0.95::true_val(tip_tail_width_size_162, v29_89_29_19); 0.05::true_val(tip_tail_width_size_162, unk_tip_tail_width_size_162).
0.93::acc(sm, tip_tail_width_size_162).
measured(sm, tip_tail_width_size_162, v29_89_29_19).
all_consistent(tip_tail_width_size_162) :- consistent(sm, tip_tail_width_size_162).
evidence(all_consistent(tip_tail_width_size_162)).
query(true_val(tip_tail_width_size_162, v29_89_29_19)).
query(true_val(tip_tail_width_size_162, unk_tip_tail_width_size_162)).

% @attr tip_tail_width_size_158w
% @type categorical
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (158W)
% @values v30_15_29_45=30.15/29.45
% @importance 0.85

0.95::true_val(tip_tail_width_size_158w, v30_15_29_45); 0.05::true_val(tip_tail_width_size_158w, unk_tip_tail_width_size_158w).
0.93::acc(sm, tip_tail_width_size_158w).
measured(sm, tip_tail_width_size_158w, v30_15_29_45).
all_consistent(tip_tail_width_size_158w) :- consistent(sm, tip_tail_width_size_158w).
evidence(all_consistent(tip_tail_width_size_158w)).
query(true_val(tip_tail_width_size_158w, v30_15_29_45)).
query(true_val(tip_tail_width_size_158w, unk_tip_tail_width_size_158w)).

% @attr effective_edge_154
% @type numeric
% @unit cm
% @canonical false
% @original_name effective_edge_154
% @values v112=112.0
% @importance 0.85

0.95::true_val(effective_edge_154, v112); 0.05::true_val(effective_edge_154, unk_effective_edge_154).
0.93::acc(sm, effective_edge_154).
measured(sm, effective_edge_154, v112).
all_consistent(effective_edge_154) :- consistent(sm, effective_edge_154).
evidence(all_consistent(effective_edge_154)).
query(true_val(effective_edge_154, v112)).
query(true_val(effective_edge_154, unk_effective_edge_154)).

% @attr effective_edge_158
% @type numeric
% @unit cm
% @canonical false
% @original_name effective_edge_158
% @values v116=116.0
% @importance 0.85

0.95::true_val(effective_edge_158, v116); 0.05::true_val(effective_edge_158, unk_effective_edge_158).
0.93::acc(sm, effective_edge_158).
measured(sm, effective_edge_158, v116).
all_consistent(effective_edge_158) :- consistent(sm, effective_edge_158).
evidence(all_consistent(effective_edge_158)).
query(true_val(effective_edge_158, v116)).
query(true_val(effective_edge_158, unk_effective_edge_158)).

% @attr effective_edge_162
% @type numeric
% @unit cm
% @canonical false
% @original_name effective_edge_162
% @values v120=120.0
% @importance 0.85

0.95::true_val(effective_edge_162, v120); 0.05::true_val(effective_edge_162, unk_effective_edge_162).
0.93::acc(sm, effective_edge_162).
measured(sm, effective_edge_162, v120).
all_consistent(effective_edge_162) :- consistent(sm, effective_edge_162).
evidence(all_consistent(effective_edge_162)).
query(true_val(effective_edge_162, v120)).
query(true_val(effective_edge_162, unk_effective_edge_162)).

% @attr effective_edge_158w
% @type numeric
% @unit cm
% @canonical false
% @original_name effective_edge_158W
% @values v116w=116.0
% @importance 0.85

0.95::true_val(effective_edge_158w, v116w); 0.05::true_val(effective_edge_158w, unk_effective_edge_158w).
0.93::acc(sm, effective_edge_158w).
measured(sm, effective_edge_158w, v116w).
all_consistent(effective_edge_158w) :- consistent(sm, effective_edge_158w).
evidence(all_consistent(effective_edge_158w)).
query(true_val(effective_edge_158w, v116w)).
query(true_val(effective_edge_158w, unk_effective_edge_158w)).

% @attr sidecut_radius_size_154
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (154)
% @values v7_6=7.6
% @importance 0.85

0.95::true_val(sidecut_radius_size_154, v7_6); 0.05::true_val(sidecut_radius_size_154, unk_sidecut_radius_size_154).
0.93::acc(sm, sidecut_radius_size_154).
measured(sm, sidecut_radius_size_154, v7_6).
all_consistent(sidecut_radius_size_154) :- consistent(sm, sidecut_radius_size_154).
evidence(all_consistent(sidecut_radius_size_154)).
query(true_val(sidecut_radius_size_154, v7_6)).
query(true_val(sidecut_radius_size_154, unk_sidecut_radius_size_154)).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size (158)
% @values v7_8=7.8
% @importance 0.85

0.95::true_val(sidecut_radius_size, v7_8); 0.05::true_val(sidecut_radius_size, unk_sidecut_radius_size).
0.93::acc(sm, sidecut_radius_size).
measured(sm, sidecut_radius_size, v7_8).
all_consistent(sidecut_radius_size) :- consistent(sm, sidecut_radius_size).
evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_8)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr sidecut_radius_size_162
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (162)
% @values v8_1=8.1
% @importance 0.85

0.95::true_val(sidecut_radius_size_162, v8_1); 0.05::true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162).
0.93::acc(sm, sidecut_radius_size_162).
measured(sm, sidecut_radius_size_162, v8_1).
all_consistent(sidecut_radius_size_162) :- consistent(sm, sidecut_radius_size_162).
evidence(all_consistent(sidecut_radius_size_162)).
query(true_val(sidecut_radius_size_162, v8_1)).
query(true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162)).

% @attr sidecut_radius_size_158w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (158W)
% @values v7_8w=7.8
% @importance 0.85

0.95::true_val(sidecut_radius_size_158w, v7_8w); 0.05::true_val(sidecut_radius_size_158w, unk_sidecut_radius_size_158w).
0.93::acc(sm, sidecut_radius_size_158w).
measured(sm, sidecut_radius_size_158w, v7_8w).
all_consistent(sidecut_radius_size_158w) :- consistent(sm, sidecut_radius_size_158w).
evidence(all_consistent(sidecut_radius_size_158w)).
query(true_val(sidecut_radius_size_158w, v7_8w)).
query(true_val(sidecut_radius_size_158w, unk_sidecut_radius_size_158w)).

% @attr stance_width_range_size_154
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size (154)
% @values v56=56.0
% @importance 0.85

0.95::true_val(stance_width_range_size_154, v56); 0.05::true_val(stance_width_range_size_154, unk_stance_width_range_size_154).
0.93::acc(sm, stance_width_range_size_154).
measured(sm, stance_width_range_size_154, v56).
all_consistent(stance_width_range_size_154) :- consistent(sm, stance_width_range_size_154).
evidence(all_consistent(stance_width_range_size_154)).
query(true_val(stance_width_range_size_154, v56)).
query(true_val(stance_width_range_size_154, unk_stance_width_range_size_154)).

% @attr stance_width_range_size
% @type numeric
% @unit cm
% @canonical true
% @original_name stance_width_range_size (158)
% @values v56=56.0
% @importance 0.85

0.95::true_val(stance_width_range_size, v56s); 0.05::true_val(stance_width_range_size, unk_stance_width_range_size).
0.93::acc(sm, stance_width_range_size).
measured(sm, stance_width_range_size, v56s).
all_consistent(stance_width_range_size) :- consistent(sm, stance_width_range_size).
evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v56s)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr stance_width_range_size_162
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size (162)
% @values v56=56.0
% @importance 0.85

0.95::true_val(stance_width_range_size_162, v56b); 0.05::true_val(stance_width_range_size_162, unk_stance_width_range_size_162).
0.93::acc(sm, stance_width_range_size_162).
measured(sm, stance_width_range_size_162, v56b).
all_consistent(stance_width_range_size_162) :- consistent(sm, stance_width_range_size_162).
evidence(all_consistent(stance_width_range_size_162)).
query(true_val(stance_width_range_size_162, v56b)).
query(true_val(stance_width_range_size_162, unk_stance_width_range_size_162)).

% @attr stance_width_range_size_158w
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size (158W)
% @values v56=56.0
% @importance 0.85

0.95::true_val(stance_width_range_size_158w, v56w); 0.05::true_val(stance_width_range_size_158w, unk_stance_width_range_size_158w).
0.93::acc(sm, stance_width_range_size_158w).
measured(sm, stance_width_range_size_158w, v56w).
all_consistent(stance_width_range_size_158w) :- consistent(sm, stance_width_range_size_158w).
evidence(all_consistent(stance_width_range_size_158w)).
query(true_val(stance_width_range_size_158w, v56w)).
query(true_val(stance_width_range_size_158w, unk_stance_width_range_size_158w)).

% @attr recommended_weight_range_size_154
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (154)
% @values w54_82=54-82kg
% @importance 0.85

0.95::true_val(recommended_weight_range_size_154, w54_82); 0.05::true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154).
0.93::acc(sm, recommended_weight_range_size_154).
measured(sm, recommended_weight_range_size_154, w54_82).
all_consistent(recommended_weight_range_size_154) :- consistent(sm, recommended_weight_range_size_154).
evidence(all_consistent(recommended_weight_range_size_154)).
query(true_val(recommended_weight_range_size_154, w54_82)).
query(true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154)).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size (158)
% @values w68_91=68-91kg
% @importance 0.85

0.95::true_val(recommended_weight_range_size, w68_91); 0.05::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).
0.93::acc(sm, recommended_weight_range_size).
measured(sm, recommended_weight_range_size, w68_91).
all_consistent(recommended_weight_range_size) :- consistent(sm, recommended_weight_range_size).
evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w68_91)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr recommended_weight_range_size_162
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (162)
% @values w82_118plus=82-118+kg
% @importance 0.85

0.95::true_val(recommended_weight_range_size_162, w82_118plus); 0.05::true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162).
0.93::acc(sm, recommended_weight_range_size_162).
measured(sm, recommended_weight_range_size_162, w82_118plus).
all_consistent(recommended_weight_range_size_162) :- consistent(sm, recommended_weight_range_size_162).
evidence(all_consistent(recommended_weight_range_size_162)).
query(true_val(recommended_weight_range_size_162, w82_118plus)).
query(true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162)).

% @attr recommended_weight_range_size_158w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (158W)
% @values w68_91w=68-91kg
% @importance 0.85

0.95::true_val(recommended_weight_range_size_158w, w68_91w); 0.05::true_val(recommended_weight_range_size_158w, unk_recommended_weight_range_size_158w).
0.93::acc(sm, recommended_weight_range_size_158w).
measured(sm, recommended_weight_range_size_158w, w68_91w).
all_consistent(recommended_weight_range_size_158w) :- consistent(sm, recommended_weight_range_size_158w).
evidence(all_consistent(recommended_weight_range_size_158w)).
query(true_val(recommended_weight_range_size_158w, w68_91w)).
query(true_val(recommended_weight_range_size_158w, unk_recommended_weight_range_size_158w)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 0.85

0.95::true_val(width_options, standard_and_wide); 0.05::true_val(width_options, unk_width_options).
0.93::acc(sm, width_options).
measured(sm, width_options, standard_and_wide).
all_consistent(width_options) :- consistent(sm, width_options).
evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

% @attr terrain_suitability_groomer
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability (groomer)
% @values v5=5.0
% @importance 0.85

0.95::true_val(terrain_suitability_groomer, v5); 0.05::true_val(terrain_suitability_groomer, unk_terrain_suitability_groomer).
0.90::acc(sm, terrain_suitability_groomer).
measured(sm, terrain_suitability_groomer, v5).
all_consistent(terrain_suitability_groomer) :- consistent(sm, terrain_suitability_groomer).
evidence(all_consistent(terrain_suitability_groomer)).
query(true_val(terrain_suitability_groomer, v5)).
query(true_val(terrain_suitability_groomer, unk_terrain_suitability_groomer)).

% @attr terrain_suitability_powder_rating
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability (powder)
% @values v9=9.0
% @importance 0.85

0.95::true_val(terrain_suitability_powder_rating, v9); 0.05::true_val(terrain_suitability_powder_rating, unk_terrain_suitability_powder_rating).
0.90::acc(sm, terrain_suitability_powder_rating).
measured(sm, terrain_suitability_powder_rating, v9).
all_consistent(terrain_suitability_powder_rating) :- consistent(sm, terrain_suitability_powder_rating).
evidence(all_consistent(terrain_suitability_powder_rating)).
query(true_val(terrain_suitability_powder_rating, v9)).
query(true_val(terrain_suitability_powder_rating, unk_terrain_suitability_powder_rating)).

% @attr terrain_suitability_all_mountain
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability (all-mountain)
% @values v7=7.0
% @importance 0.85

0.95::true_val(terrain_suitability_all_mountain, v7am); 0.05::true_val(terrain_suitability_all_mountain, unk_terrain_suitability_all_mountain).
0.90::acc(sm, terrain_suitability_all_mountain).
measured(sm, terrain_suitability_all_mountain, v7am).
all_consistent(terrain_suitability_all_mountain) :- consistent(sm, terrain_suitability_all_mountain).
evidence(all_consistent(terrain_suitability_all_mountain)).
query(true_val(terrain_suitability_all_mountain, v7am)).
query(true_val(terrain_suitability_all_mountain, unk_terrain_suitability_all_mountain)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate_advanced=Intermediate_Advanced unk_rider_level=Unknown
% @importance 0.85

0.90::true_val(rider_level, intermediate_advanced); 0.10::true_val(rider_level, unk_rider_level).
0.85::acc(sm, rider_level).
measured(sm, rider_level, intermediate_advanced).
all_consistent(rider_level) :- consistent(sm, rider_level).
evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate_advanced)).
query(true_val(rider_level, unk_rider_level)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values advanced_expert=Advanced_Expert expert=Expert
% @importance 0.9

0.55::true_val(skill_level_recommendation, advanced_expert); 0.45::true_val(skill_level_recommendation, expert).
0.82::acc(s59, skill_level_recommendation).
0.78::acc(s60, skill_level_recommendation).
measured(s59, skill_level_recommendation, advanced_expert).
measured(s60, skill_level_recommendation, expert).
all_consistent(skill_level_recommendation) :- (indep(s59), consistent(s59, skill_level_recommendation) ; \+indep(s59)), (indep(s60), consistent(s60, skill_level_recommendation) ; \+indep(s60)).
evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, advanced_expert)).
query(true_val(skill_level_recommendation, expert)).

% @attr rider_level_summary
% @type categorical
% @canonical false
% @original_name rider_level (summary of disagreement)
% @values adv_to_expert_consensus=Advanced_to_Expert_consensus unk_rider_level_summary=Unknown
% @importance 0.85

0.85::true_val(rider_level_summary, adv_to_expert_consensus); 0.15::true_val(rider_level_summary, unk_rider_level_summary).
0.80::acc(sm, rider_level_summary).
measured(sm, rider_level_summary, adv_to_expert_consensus).
all_consistent(rider_level_summary) :- consistent(sm, rider_level_summary).
evidence(all_consistent(rider_level_summary)).
query(true_val(rider_level_summary, adv_to_expert_consensus)).
query(true_val(rider_level_summary, unk_rider_level_summary)).

% @attr skill_level_recommendation_persona
% @type categorical
% @canonical false
% @original_name skill_level_recommendation (persona)
% @values chase_nervous_lines=Freeriders_who_chase_nervous_lines unk_skill_level_recommendation_persona=Unknown
% @importance 0.7

0.82::true_val(skill_level_recommendation_persona, chase_nervous_lines); 0.18::true_val(skill_level_recommendation_persona, unk_skill_level_recommendation_persona).
0.80::acc(s61, skill_level_recommendation_persona).
measured(s61, skill_level_recommendation_persona, chase_nervous_lines).
all_consistent(skill_level_recommendation_persona) :- (indep(s61), consistent(s61, skill_level_recommendation_persona) ; \+indep(s61)).
evidence(all_consistent(skill_level_recommendation_persona)).
query(true_val(skill_level_recommendation_persona, chase_nervous_lines)).
query(true_val(skill_level_recommendation_persona, unk_skill_level_recommendation_persona)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values steep_deep_offpiste=Steep_deep_off_piste_freeride_powder_backcountry unk_terrain_suitability=Unknown
% @importance 0.85

0.95::true_val(terrain_suitability, steep_deep_offpiste); 0.05::true_val(terrain_suitability, unk_terrain_suitability).
0.90::acc(sm, terrain_suitability).
measured(sm, terrain_suitability, steep_deep_offpiste).
all_consistent(terrain_suitability) :- consistent(sm, terrain_suitability).
evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, steep_deep_offpiste)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr skill_level_recommendation_warning
% @type categorical
% @canonical false
% @original_name skill_level_recommendation (warning)
% @values not_for_beginners=Definitely_not_for_beginners unk_skill_level_recommendation_warning=Unknown
% @importance 0.85

0.80::true_val(skill_level_recommendation_warning, not_for_beginners); 0.20::true_val(skill_level_recommendation_warning, unk_skill_level_recommendation_warning).
0.80::acc(s62, skill_level_recommendation_warning).
measured(s62, skill_level_recommendation_warning, not_for_beginners).
all_consistent(skill_level_recommendation_warning) :- consistent(s62, skill_level_recommendation_warning).
evidence(all_consistent(skill_level_recommendation_warning)).
query(true_val(skill_level_recommendation_warning, not_for_beginners)).
query(true_val(skill_level_recommendation_warning, unk_skill_level_recommendation_warning)).

% @attr ideal_boot_size_per_size
% @type categorical
% @canonical false
% @original_name ideal boot size per size
% @values boot_chart=154_US7_8_158_US7_5_8_5_162_US8_5_9_5_158W_US9_5_10_5 unk_ideal_boot_size_per_size=Unknown
% @importance 0.85

0.78::true_val(ideal_boot_size_per_size, boot_chart); 0.22::true_val(ideal_boot_size_per_size, unk_ideal_boot_size_per_size).
0.80::acc(s63, ideal_boot_size_per_size).
measured(s63, ideal_boot_size_per_size, boot_chart).
all_consistent(ideal_boot_size_per_size) :- consistent(s63, ideal_boot_size_per_size).
evidence(all_consistent(ideal_boot_size_per_size)).
query(true_val(ideal_boot_size_per_size, boot_chart)).
query(true_val(ideal_boot_size_per_size, unk_ideal_boot_size_per_size)).

% @attr toe_heel_drag_threshold
% @type categorical
% @canonical false
% @original_name toe/heel drag threshold
% @values above_us8_5=Drag_above_US_8_5_except_158W unk_toe_heel_drag_threshold=Unknown
% @importance 0.9

0.88::true_val(toe_heel_drag_threshold, above_us8_5); 0.12::true_val(toe_heel_drag_threshold, unk_toe_heel_drag_threshold).
0.88::acc(s64, toe_heel_drag_threshold).
measured(s64, toe_heel_drag_threshold, above_us8_5).
all_consistent(toe_heel_drag_threshold) :- consistent(s64, toe_heel_drag_threshold).
evidence(all_consistent(toe_heel_drag_threshold)).
query(true_val(toe_heel_drag_threshold, above_us8_5)).
query(true_val(toe_heel_drag_threshold, unk_toe_heel_drag_threshold)).

% @attr ogl_overall_score
% @type numeric
% @unit /100
% @canonical false
% @original_name Outdoor Gear Lab overall score
% @values v73=73.0
% @importance 0.9

0.90::true_val(ogl_overall_score, v73); 0.10::true_val(ogl_overall_score, unk_ogl_overall_score).
0.92::acc(s65, ogl_overall_score).
measured(s65, ogl_overall_score, v73).
all_consistent(ogl_overall_score) :- consistent(s65, ogl_overall_score).
evidence(all_consistent(ogl_overall_score)).
query(true_val(ogl_overall_score, v73)).
query(true_val(ogl_overall_score, unk_ogl_overall_score)).

% @attr ogl_edging_score
% @type numeric
% @unit /10
% @canonical false
% @original_name Outdoor Gear Lab edging score
% @values v6_5=6.5
% @importance 0.9

0.90::true_val(ogl_edging_score, v6_5); 0.10::true_val(ogl_edging_score, unk_ogl_edging_score).
0.92::acc(s65, ogl_edging_score).
measured(s65, ogl_edging_score, v6_5).
all_consistent(ogl_edging_score) :- consistent(s65, ogl_edging_score).
evidence(all_consistent(ogl_edging_score)).
query(true_val(ogl_edging_score, v6_5)).
query(true_val(ogl_edging_score, unk_ogl_edging_score)).

% @attr ogl_float_powder_score
% @type numeric
% @unit /10
% @canonical false
% @original_name Outdoor Gear Lab float in powder score
% @values v8_5=8.5
% @importance 0.9

0.90::true_val(ogl_float_powder_score, v8_5); 0.10::true_val(ogl_float_powder_score, unk_ogl_float_powder_score).
0.92::acc(s65, ogl_float_powder_score).
measured(s65, ogl_float_powder_score, v8_5).
all_consistent(ogl_float_powder_score) :- consistent(s65, ogl_float_powder_score).
evidence(all_consistent(ogl_float_powder_score)).
query(true_val(ogl_float_powder_score, v8_5)).
query(true_val(ogl_float_powder_score, unk_ogl_float_powder_score)).

% @attr ogl_stability_speed_score
% @type numeric
% @unit /10
% @canonical false
% @original_name Outdoor Gear Lab stability at speed score
% @values v8_0=8.0
% @importance 0.9

0.90::true_val(ogl_stability_speed_score, v8_0); 0.10::true_val(ogl_stability_speed_score, unk_ogl_stability_speed_score).
0.92::acc(s65, ogl_stability_speed_score).
measured(s65, ogl_stability_speed_score, v8_0).
all_consistent(ogl_stability_speed_score) :- consistent(s65, ogl_stability_speed_score).
evidence(all_consistent(ogl_stability_speed_score)).
query(true_val(ogl_stability_speed_score, v8_0)).
query(true_val(ogl_stability_speed_score, unk_ogl_stability_speed_score)).

% @attr ogl_playfulness_score
% @type numeric
% @unit /10
% @canonical false
% @original_name Outdoor Gear Lab playfulness score
% @values v6_0=6.0
% @importance 0.9

0.90::true_val(ogl_playfulness_score, v6_0); 0.10::true_val(ogl_playfulness_score, unk_ogl_playfulness_score).
0.92::acc(s65, ogl_playfulness_score).
measured(s65, ogl_playfulness_score, v6_0).
all_consistent(ogl_playfulness_score) :- consistent(s65, ogl_playfulness_score).
evidence(all_consistent(ogl_playfulness_score)).
query(true_val(ogl_playfulness_score, v6_0)).
query(true_val(ogl_playfulness_score, unk_ogl_playfulness_score)).

% @attr ogl_pop_jumping_score
% @type numeric
% @unit /10
% @canonical false
% @original_name Outdoor Gear Lab pop and jumping score
% @values v8_0=8.0
% @importance 0.9

0.90::true_val(ogl_pop_jumping_score, v8_0pj); 0.10::true_val(ogl_pop_jumping_score, unk_ogl_pop_jumping_score).
0.92::acc(s65, ogl_pop_jumping_score).
measured(s65, ogl_pop_jumping_score, v8_0pj).
all_consistent(ogl_pop_jumping_score) :- consistent(s65, ogl_pop_jumping_score).
evidence(all_consistent(ogl_pop_jumping_score)).
query(true_val(ogl_pop_jumping_score, v8_0pj)).
query(true_val(ogl_pop_jumping_score, unk_ogl_pop_jumping_score)).

% @attr ogl_award
% @type categorical
% @canonical false
% @original_name Outdoor Gear Lab award
% @values top_pick=Top_Pick unk_ogl_award=Unknown
% @importance 0.9

0.90::true_val(ogl_award, top_pick); 0.10::true_val(ogl_award, unk_ogl_award).
0.92::acc(s65, ogl_award).
measured(s65, ogl_award, top_pick).
all_consistent(ogl_award) :- consistent(s65, ogl_award).
evidence(all_consistent(ogl_award)).
query(true_val(ogl_award, top_pick)).
query(true_val(ogl_award, unk_ogl_award)).

% @attr ogl_verdict
% @type categorical
% @canonical false
% @original_name Outdoor Gear Lab verdict
% @values fav_am_freeride_powder=Favorite_all_mountain_freeride_powder_board unk_ogl_verdict=Unknown
% @importance 0.85

0.88::true_val(ogl_verdict, fav_am_freeride_powder); 0.12::true_val(ogl_verdict, unk_ogl_verdict).
0.88::acc(s66, ogl_verdict).
measured(s66, ogl_verdict, fav_am_freeride_powder).
all_consistent(ogl_verdict) :- consistent(s66, ogl_verdict).
evidence(all_consistent(ogl_verdict)).
query(true_val(ogl_verdict, fav_am_freeride_powder)).
query(true_val(ogl_verdict, unk_ogl_verdict)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values freeride=Freeride unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.9

0.85::true_val(reviewer_opinion_the_good_ride, freeride); 0.15::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).
0.85::acc(s67, reviewer_opinion_the_good_ride).
measured(s67, reviewer_opinion_the_good_ride, freeride).
all_consistent(reviewer_opinion_the_good_ride) :- consistent(s67, reviewer_opinion_the_good_ride).
evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, freeride)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr powder_rating_tgr
% @type categorical
% @canonical false
% @original_name powder_rating_tgr
% @values great=Great unk_powder_rating_tgr=Unknown
% @importance 0.9

0.85::true_val(powder_rating_tgr, great); 0.15::true_val(powder_rating_tgr, unk_powder_rating_tgr).
0.85::acc(s67, powder_rating_tgr).
measured(s67, powder_rating_tgr, great).
all_consistent(powder_rating_tgr) :- consistent(s67, powder_rating_tgr).
evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, great)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

% @attr carving_rating_tgr
% @type categorical
% @canonical false
% @original_name carving_rating_tgr
% @values great=Great unk_carving_rating_tgr=Unknown
% @importance 0.9

0.85::true_val(carving_rating_tgr, great_carv); 0.15::true_val(carving_rating_tgr, unk_carving_rating_tgr).
0.85::acc(s67, carving_rating_tgr).
measured(s67, carving_rating_tgr, great_carv).
all_consistent(carving_rating_tgr) :- consistent(s67, carving_rating_tgr).
evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, great_carv)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

% @attr speed_rating_tgr
% @type categorical
% @canonical false
% @original_name speed_rating_tgr
% @values great=Great unk_speed_rating_tgr=Unknown
% @importance 0.9

0.85::true_val(speed_rating_tgr, great_spd); 0.15::true_val(speed_rating_tgr, unk_speed_rating_tgr).
0.85::acc(s67, speed_rating_tgr).
measured(s67, speed_rating_tgr, great_spd).
all_consistent(speed_rating_tgr) :- consistent(s67, speed_rating_tgr).
evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, great_spd)).
query(true_val(speed_rating_tgr, unk_speed_rating_tgr)).

% @attr reviewer_opinion_the_good_ride_uneven_snow
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (uneven snow)
% @values good=Good unk_reviewer_opinion_tgr_uneven=Unknown
% @importance 0.9

0.85::true_val(reviewer_opinion_the_good_ride_uneven_snow, good_un); 0.15::true_val(reviewer_opinion_the_good_ride_uneven_snow, unk_reviewer_opinion_tgr_uneven).
0.85::acc(s67, reviewer_opinion_the_good_ride_uneven_snow).
measured(s67, reviewer_opinion_the_good_ride_uneven_snow, good_un).
all_consistent(reviewer_opinion_the_good_ride_uneven_snow) :- consistent(s67, reviewer_opinion_the_good_ride_uneven_snow).
evidence(all_consistent(reviewer_opinion_the_good_ride_uneven_snow)).
query(true_val(reviewer_opinion_the_good_ride_uneven_snow, good_un)).
query(true_val(reviewer_opinion_the_good_ride_uneven_snow, unk_reviewer_opinion_tgr_uneven)).

% @attr reviewer_opinion_the_good_ride_switch
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (switch)
% @values average=Average unk_reviewer_opinion_tgr_switch=Unknown
% @importance 0.9

0.85::true_val(reviewer_opinion_the_good_ride_switch, average_sw); 0.15::true_val(reviewer_opinion_the_good_ride_switch, unk_reviewer_opinion_tgr_switch).
0.85::acc(s67, reviewer_opinion_the_good_ride_switch).
measured(s67, reviewer_opinion_the_good_ride_switch, average_sw).
all_consistent(reviewer_opinion_the_good_ride_switch) :- consistent(s67, reviewer_opinion_the_good_ride_switch).
evidence(all_consistent(reviewer_opinion_the_good_ride_switch)).
query(true_val(reviewer_opinion_the_good_ride_switch, average_sw)).
query(true_val(reviewer_opinion_the_good_ride_switch, unk_reviewer_opinion_tgr_switch)).

% @attr jumps_rating_tgr
% @type categorical
% @canonical false
% @original_name jumps_rating_tgr
% @values great=Great unk_jumps_rating_tgr=Unknown
% @importance 0.9

0.85::true_val(jumps_rating_tgr, great_jmp); 0.15::true_val(jumps_rating_tgr, unk_jumps_rating_tgr).
0.85::acc(s67, jumps_rating_tgr).
measured(s67, jumps_rating_tgr, great_jmp).
all_consistent(jumps_rating_tgr) :- consistent(s67, jumps_rating_tgr).
evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, great_jmp)).
query(true_val(jumps_rating_tgr, unk_jumps_rating_tgr)).

% @attr jibbing_rating_tgr
% @type categorical
% @canonical false
% @original_name jibbing_rating_tgr
% @values poor=Poor unk_jibbing_rating_tgr=Unknown
% @importance 0.9

0.85::true_val(jibbing_rating_tgr, poor); 0.15::true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr).
0.85::acc(s67, jibbing_rating_tgr).
measured(s67, jibbing_rating_tgr, poor).
all_consistent(jibbing_rating_tgr) :- consistent(s67, jibbing_rating_tgr).
evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, poor)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr)).

% @attr pipe_rating_tgr
% @type categorical
% @canonical false
% @original_name pipe_rating_tgr
% @values good=Good unk_pipe_rating_tgr=Unknown
% @importance 0.9

0.85::true_val(pipe_rating_tgr, good_pipe); 0.15::true_val(pipe_rating_tgr, unk_pipe_rating_tgr).
0.85::acc(s67, pipe_rating_tgr).
measured(s67, pipe_rating_tgr, good_pipe).
all_consistent(pipe_rating_tgr) :- consistent(s67, pipe_rating_tgr).
evidence(all_consistent(pipe_rating_tgr)).
query(true_val(pipe_rating_tgr, good_pipe)).
query(true_val(pipe_rating_tgr, unk_pipe_rating_tgr)).

% @attr edge_hold
% @type categorical
% @canonical false
% @original_name edge_hold
% @values medium_snow=Medium_Snow unk_edge_hold=Unknown
% @importance 0.9

0.85::true_val(edge_hold, medium_snow); 0.15::true_val(edge_hold, unk_edge_hold).
0.85::acc(s67, edge_hold).
measured(s67, edge_hold, medium_snow).
all_consistent(edge_hold) :- consistent(s67, edge_hold).
evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, medium_snow)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr on_snow_feel_tgr
% @type categorical
% @canonical false
% @original_name on_snow_feel_tgr
% @values semi_locked_in=Semi_Locked_In unk_on_snow_feel_tgr=Unknown
% @importance 0.9

0.85::true_val(on_snow_feel_tgr, semi_locked_in); 0.15::true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr).
0.85::acc(s67, on_snow_feel_tgr).
measured(s67, on_snow_feel_tgr, semi_locked_in).
all_consistent(on_snow_feel_tgr) :- consistent(s67, on_snow_feel_tgr).
evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, semi_locked_in)).
query(true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr)).

% @attr turn_initiation_performance
% @type categorical
% @canonical false
% @original_name turn_initiation_performance
% @values fast=Fast unk_turn_initiation_performance=Unknown
% @importance 0.9

0.85::true_val(turn_initiation_performance, fast); 0.15::true_val(turn_initiation_performance, unk_turn_initiation_performance).
0.85::acc(s67, turn_initiation_performance).
measured(s67, turn_initiation_performance, fast).
all_consistent(turn_initiation_performance) :- consistent(s67, turn_initiation_performance).
evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, fast)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr high_speed_stability
% @type categorical
% @canonical false
% @original_name high-speed stability
% @values excellent=Excellent_resistant_to_chatter unk_high_speed_stability=Unknown
% @importance 0.85

0.87::true_val(high_speed_stability, excellent); 0.13::true_val(high_speed_stability, unk_high_speed_stability).
0.88::acc(s68, high_speed_stability).
measured(s68, high_speed_stability, excellent).
all_consistent(high_speed_stability) :- consistent(s68, high_speed_stability).
evidence(all_consistent(high_speed_stability)).
query(true_val(high_speed_stability, excellent)).
query(true_val(high_speed_stability, unk_high_speed_stability)).

% @attr powder_float
% @type categorical
% @canonical false
% @original_name powder float
% @values exceptional=Exceptional_rises_and_floats unk_powder_float=Unknown
% @importance 0.85

0.85::true_val(powder_float, exceptional); 0.15::true_val(powder_float, unk_powder_float).
0.85::acc(s69, powder_float).
measured(s69, powder_float, exceptional).
all_consistent(powder_float) :- consistent(s69, powder_float).
evidence(all_consistent(powder_float)).
query(true_val(powder_float, exceptional)).
query(true_val(powder_float, unk_powder_float)).

% @attr carving
% @type categorical
% @canonical false
% @original_name carving
% @values strong_edge_quick_turn=Strong_edge_hold_quick_turn_initiation unk_carving=Unknown
% @importance 0.8

0.85::true_val(carving, strong_edge_quick_turn); 0.15::true_val(carving, unk_carving).
0.85::acc(s70, carving).
measured(s70, carving, strong_edge_quick_turn).
all_consistent(carving) :- consistent(s70, carving).
evidence(all_consistent(carving)).
query(true_val(carving, strong_edge_quick_turn)).
query(true_val(carving, unk_carving)).

% @attr buttering_difficulty
% @type categorical
% @canonical false
% @original_name buttering difficulty
% @values very_limited=Very_stiff_flex_limits_buttering unk_buttering_difficulty=Unknown
% @importance 0.6

0.88::true_val(buttering_difficulty, very_limited); 0.12::true_val(buttering_difficulty, unk_buttering_difficulty).
0.88::acc(s71, buttering_difficulty).
measured(s71, buttering_difficulty, very_limited).
all_consistent(buttering_difficulty) :- consistent(s71, buttering_difficulty).
evidence(all_consistent(buttering_difficulty)).
query(true_val(buttering_difficulty, very_limited)).
query(true_val(buttering_difficulty, unk_buttering_difficulty)).

% @attr crud_chop_performance
% @type categorical
% @canonical false
% @original_name crud/chop performance
% @values handles_well=Handles_choppy_variable_snow_well unk_crud_chop_performance=Unknown
% @importance 0.7

0.78::true_val(crud_chop_performance, handles_well); 0.22::true_val(crud_chop_performance, unk_crud_chop_performance).
0.80::acc(s72, crud_chop_performance).
measured(s72, crud_chop_performance, handles_well).
all_consistent(crud_chop_performance) :- consistent(s72, crud_chop_performance).
evidence(all_consistent(crud_chop_performance)).
query(true_val(crud_chop_performance, handles_well)).
query(true_val(crud_chop_performance, unk_crud_chop_performance)).

% @attr tree_bump_riding
% @type categorical
% @canonical false
% @original_name tree/bump riding
% @values great_but_fatiguing=Great_for_slalom_but_can_be_fatiguing unk_tree_bump_riding=Unknown
% @importance 0.7

0.78::true_val(tree_bump_riding, great_but_fatiguing); 0.22::true_val(tree_bump_riding, unk_tree_bump_riding).
0.80::acc(s73, tree_bump_riding).
measured(s73, tree_bump_riding, great_but_fatiguing).
all_consistent(tree_bump_riding) :- consistent(s73, tree_bump_riding).
evidence(all_consistent(tree_bump_riding)).
query(true_val(tree_bump_riding, great_but_fatiguing)).
query(true_val(tree_bump_riding, unk_tree_bump_riding)).

% @attr slow_speed_feel
% @type categorical
% @canonical false
% @original_name slow speed feel
% @values bland_planky=Bland_and_planky_needs_speed unk_slow_speed_feel=Unknown
% @importance 0.8

0.80::true_val(slow_speed_feel, bland_planky); 0.20::true_val(slow_speed_feel, unk_slow_speed_feel).
0.82::acc(s74, slow_speed_feel).
measured(s74, slow_speed_feel, bland_planky).
all_consistent(slow_speed_feel) :- consistent(s74, slow_speed_feel).
evidence(all_consistent(slow_speed_feel)).
query(true_val(slow_speed_feel, bland_planky)).
query(true_val(slow_speed_feel, unk_slow_speed_feel)).

% @attr playfulness
% @type categorical
% @canonical false
% @original_name playfulness
% @values surprisingly_playful=Surprisingly_playful_for_design_intent unk_playfulness=Unknown
% @importance 0.65

0.85::true_val(playfulness, surprisingly_playful); 0.15::true_val(playfulness, unk_playfulness).
0.85::acc(s75, playfulness).
measured(s75, playfulness, surprisingly_playful).
all_consistent(playfulness) :- consistent(s75, playfulness).
evidence(all_consistent(playfulness)).
query(true_val(playfulness, surprisingly_playful)).
query(true_val(playfulness, unk_playfulness)).

% @attr pop
% @type categorical
% @canonical false
% @original_name pop
% @values excellent_tough_access=Excellent_pop_tough_to_access_for_spinning unk_pop=Unknown
% @importance 0.6

0.78::true_val(pop, excellent_tough_access); 0.22::true_val(pop, unk_pop).
0.78::acc(s76, pop).
measured(s76, pop, excellent_tough_access).
all_consistent(pop) :- consistent(s76, pop).
evidence(all_consistent(pop)).
query(true_val(pop, excellent_tough_access)).
query(true_val(pop, unk_pop)).

% @attr switch_riding
% @type categorical
% @canonical false
% @original_name switch_riding
% @values average=Average_directional_limits_switch unk_switch_riding=Unknown
% @importance 0.9

0.85::true_val(switch_riding, average); 0.15::true_val(switch_riding, unk_switch_riding).
0.85::acc(s67, switch_riding).
measured(s67, switch_riding, average).
all_consistent(switch_riding) :- consistent(s67, switch_riding).
evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, average)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr one_board_quiver_potential
% @type categorical
% @canonical false
% @original_name one-board-quiver potential
% @values possible_depends=Could_be_depending_on_riding_style unk_one_board_quiver_potential=Unknown
% @importance 0.75

0.75::true_val(one_board_quiver_potential, possible_depends); 0.25::true_val(one_board_quiver_potential, unk_one_board_quiver_potential).
0.75::acc(s77, one_board_quiver_potential).
measured(s77, one_board_quiver_potential, possible_depends).
all_consistent(one_board_quiver_potential) :- consistent(s77, one_board_quiver_potential).
evidence(all_consistent(one_board_quiver_potential)).
query(true_val(one_board_quiver_potential, possible_depends)).
query(true_val(one_board_quiver_potential, unk_one_board_quiver_potential)).

% @attr board_weight_grams
% @type categorical
% @canonical true
% @original_name board_weight_grams
% @values very_light=Very_light_on_scales_normal_on_snow unk_board_weight_grams=Unknown
% @importance 0.65

0.78::true_val(board_weight_grams, very_light); 0.22::true_val(board_weight_grams, unk_board_weight_grams).
0.78::acc(s78, board_weight_grams).
measured(s78, board_weight_grams, very_light).
all_consistent(board_weight_grams) :- consistent(s78, board_weight_grams).
evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, very_light)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values stiff_aggressive_charging=Stiff_and_aggressive_for_high_speed_charging unk_positive_aspect=Unknown
% @importance 0.9

0.85::true_val(positive_aspect, stiff_aggressive_charging); 0.15::true_val(positive_aspect, unk_positive_aspect).
0.85::acc(s67, positive_aspect).
measured(s67, positive_aspect, stiff_aggressive_charging).
all_consistent(positive_aspect) :- consistent(s67, positive_aspect).
evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, stiff_aggressive_charging)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr positive_aspect_2
% @type categorical
% @canonical false
% @original_name positive_aspect (fast turn initiation)
% @values fast_turn_init=Fast_turn_initiation unk_positive_aspect_2=Unknown
% @importance 0.9

0.85::true_val(positive_aspect_2, fast_turn_init); 0.15::true_val(positive_aspect_2, unk_positive_aspect_2).
0.85::acc(s67, positive_aspect_2).
measured(s67, positive_aspect_2, fast_turn_init).
all_consistent(positive_aspect_2) :- consistent(s67, positive_aspect_2).
evidence(all_consistent(positive_aspect_2)).
query(true_val(positive_aspect_2, fast_turn_init)).
query(true_val(positive_aspect_2, unk_positive_aspect_2)).

% @attr positive_aspect_3
% @type categorical
% @canonical false
% @original_name positive_aspect (excellent pop)
% @values excellent_pop=Excellent_pop unk_positive_aspect_3=Unknown
% @importance 0.9

0.85::true_val(positive_aspect_3, excellent_pop); 0.15::true_val(positive_aspect_3, unk_positive_aspect_3).
0.85::acc(s67, positive_aspect_3).
measured(s67, positive_aspect_3, excellent_pop).
all_consistent(positive_aspect_3) :- consistent(s67, positive_aspect_3).
evidence(all_consistent(positive_aspect_3)).
query(true_val(positive_aspect_3, excellent_pop)).
query(true_val(positive_aspect_3, unk_positive_aspect_3)).

% @attr positive_aspect_4
% @type categorical
% @canonical false
% @original_name positive_aspect (great carving)
% @values great_carving=Great_in_good_condition_carving unk_positive_aspect_4=Unknown
% @importance 0.9

0.85::true_val(positive_aspect_4, great_carving); 0.15::true_val(positive_aspect_4, unk_positive_aspect_4).
0.85::acc(s67, positive_aspect_4).
measured(s67, positive_aspect_4, great_carving).
all_consistent(positive_aspect_4) :- consistent(s67, positive_aspect_4).
evidence(all_consistent(positive_aspect_4)).
query(true_val(positive_aspect_4, great_carving)).
query(true_val(positive_aspect_4, unk_positive_aspect_4)).

% @attr positive_aspect_5
% @type categorical
% @canonical false
% @original_name positive_aspect (ideal small boots)
% @values ideal_small_boots=Ideal_for_riders_with_smaller_boots unk_positive_aspect_5=Unknown
% @importance 0.9

0.85::true_val(positive_aspect_5, ideal_small_boots); 0.15::true_val(positive_aspect_5, unk_positive_aspect_5).
0.85::acc(s67, positive_aspect_5).
measured(s67, positive_aspect_5, ideal_small_boots).
all_consistent(positive_aspect_5) :- consistent(s67, positive_aspect_5).
evidence(all_consistent(positive_aspect_5)).
query(true_val(positive_aspect_5, ideal_small_boots)).
query(true_val(positive_aspect_5, unk_positive_aspect_5)).

% @attr positive_aspect_6
% @type categorical
% @canonical false
% @original_name positive_aspect (fast base)
% @values fast_base=Pretty_fast_base unk_positive_aspect_6=Unknown
% @importance 0.9

0.85::true_val(positive_aspect_6, fast_base); 0.15::true_val(positive_aspect_6, unk_positive_aspect_6).
0.85::acc(s67, positive_aspect_6).
measured(s67, positive_aspect_6, fast_base).
all_consistent(positive_aspect_6) :- consistent(s67, positive_aspect_6).
evidence(all_consistent(positive_aspect_6)).
query(true_val(positive_aspect_6, fast_base)).
query(true_val(positive_aspect_6, unk_positive_aspect_6)).

% @attr positive_aspect_7
% @type categorical
% @canonical false
% @original_name positive_aspect (exceptional powder float)
% @values exceptional_powder_float=Exceptional_float_in_powder_narrow_waist unk_positive_aspect_7=Unknown
% @importance 0.85

0.85::true_val(positive_aspect_7, exceptional_powder_float); 0.15::true_val(positive_aspect_7, unk_positive_aspect_7).
0.85::acc(s69, positive_aspect_7).
measured(s69, positive_aspect_7, exceptional_powder_float).
all_consistent(positive_aspect_7) :- consistent(s69, positive_aspect_7).
evidence(all_consistent(positive_aspect_7)).
query(true_val(positive_aspect_7, exceptional_powder_float)).
query(true_val(positive_aspect_7, unk_positive_aspect_7)).

% @attr positive_aspect_8
% @type categorical
% @canonical false
% @original_name positive_aspect (stable at speed)
% @values stable_at_speed=Stable_at_speed unk_positive_aspect_8=Unknown
% @importance 0.85

0.87::true_val(positive_aspect_8, stable_at_speed); 0.13::true_val(positive_aspect_8, unk_positive_aspect_8).
0.88::acc(s68, positive_aspect_8).
measured(s68, positive_aspect_8, stable_at_speed).
all_consistent(positive_aspect_8) :- consistent(s68, positive_aspect_8).
evidence(all_consistent(positive_aspect_8)).
query(true_val(positive_aspect_8, stable_at_speed)).
query(true_val(positive_aspect_8, unk_positive_aspect_8)).

% @attr positive_aspect_9
% @type categorical
% @canonical false
% @original_name positive_aspect (responsive)
% @values responsive=Responsive unk_positive_aspect_9=Unknown
% @importance 0.9

0.88::true_val(positive_aspect_9, responsive); 0.12::true_val(positive_aspect_9, unk_positive_aspect_9).
0.88::acc(s64, positive_aspect_9).
measured(s64, positive_aspect_9, responsive).
all_consistent(positive_aspect_9) :- consistent(s64, positive_aspect_9).
evidence(all_consistent(positive_aspect_9)).
query(true_val(positive_aspect_9, responsive)).
query(true_val(positive_aspect_9, unk_positive_aspect_9)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values narrow_waist_drag=Narrow_waist_causes_drag_above_US_8_5 unk_negative_aspect=Unknown
% @importance 0.9

0.88::true_val(negative_aspect, narrow_waist_drag); 0.12::true_val(negative_aspect, unk_negative_aspect).
0.88::acc(s64, negative_aspect).
measured(s64, negative_aspect, narrow_waist_drag).
all_consistent(negative_aspect) :- consistent(s64, negative_aspect).
evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, narrow_waist_drag)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_2
% @type categorical
% @canonical false
% @original_name negative_aspect (base glide)
% @values base_glide_slow_for_price=Base_glide_should_be_faster_at_price unk_negative_aspect_2=Unknown
% @importance 0.7

0.82::true_val(negative_aspect_2, base_glide_slow_for_price); 0.18::true_val(negative_aspect_2, unk_negative_aspect_2).
0.82::acc(s79, negative_aspect_2).
measured(s79, negative_aspect_2, base_glide_slow_for_price).
all_consistent(negative_aspect_2) :- consistent(s79, negative_aspect_2).
evidence(all_consistent(negative_aspect_2)).
query(true_val(negative_aspect_2, base_glide_slow_for_price)).
query(true_val(negative_aspect_2, unk_negative_aspect_2)).

% @attr negative_aspect_3
% @type categorical
% @canonical false
% @original_name negative_aspect (edge hold)
% @values edge_hold_behind_peers=Edge_hold_behind_some_peers unk_negative_aspect_3=Unknown
% @importance 0.75

0.82::true_val(negative_aspect_3, edge_hold_behind_peers); 0.18::true_val(negative_aspect_3, unk_negative_aspect_3).
0.82::acc(s80, negative_aspect_3).
measured(s80, negative_aspect_3, edge_hold_behind_peers).
all_consistent(negative_aspect_3) :- consistent(s80, negative_aspect_3).
evidence(all_consistent(negative_aspect_3)).
query(true_val(negative_aspect_3, edge_hold_behind_peers)).
query(true_val(negative_aspect_3, unk_negative_aspect_3)).

% @attr negative_aspect_4
% @type categorical
% @canonical false
% @original_name negative_aspect (not ideal bigger boots)
% @values not_ideal_big_boots=Not_ideal_for_bigger_boots unk_negative_aspect_4=Unknown
% @importance 0.9

0.85::true_val(negative_aspect_4, not_ideal_big_boots); 0.15::true_val(negative_aspect_4, unk_negative_aspect_4).
0.85::acc(s67, negative_aspect_4).
measured(s67, negative_aspect_4, not_ideal_big_boots).
all_consistent(negative_aspect_4) :- consistent(s67, negative_aspect_4).
evidence(all_consistent(negative_aspect_4)).
query(true_val(negative_aspect_4, not_ideal_big_boots)).
query(true_val(negative_aspect_4, unk_negative_aspect_4)).

% @attr negative_aspect_5
% @type categorical
% @canonical false
% @original_name negative_aspect (fatiguing trees)
% @values fatiguing_trees_bumps=Fatiguing_in_tight_trees_bumps_slower_speeds unk_negative_aspect_5=Unknown
% @importance 0.7

0.78::true_val(negative_aspect_5, fatiguing_trees_bumps); 0.22::true_val(negative_aspect_5, unk_negative_aspect_5).
0.78::acc(s81, negative_aspect_5).
measured(s81, negative_aspect_5, fatiguing_trees_bumps).
all_consistent(negative_aspect_5) :- consistent(s81, negative_aspect_5).
evidence(all_consistent(negative_aspect_5)).
query(true_val(negative_aspect_5, fatiguing_trees_bumps)).
query(true_val(negative_aspect_5, unk_negative_aspect_5)).

% @attr negative_aspect_6
% @type categorical
% @canonical false
% @original_name negative_aspect (chunked snow)
% @values could_be_smoother=Could_be_smoother_chunked_uneven_hard_snow unk_negative_aspect_6=Unknown
% @importance 0.7

0.75::true_val(negative_aspect_6, could_be_smoother); 0.25::true_val(negative_aspect_6, unk_negative_aspect_6).
0.75::acc(s82, negative_aspect_6).
measured(s82, negative_aspect_6, could_be_smoother).
all_consistent(negative_aspect_6) :- consistent(s82, negative_aspect_6).
evidence(all_consistent(negative_aspect_6)).
query(true_val(negative_aspect_6, could_be_smoother)).
query(true_val(negative_aspect_6, unk_negative_aspect_6)).

% @attr negative_aspect_7
% @type categorical
% @canonical false
% @original_name negative_aspect (expert only)
% @values expert_only_not_versatile=Expert_only_look_elsewhere_for_versatility unk_negative_aspect_7=Unknown
% @importance 0.85

0.78::true_val(negative_aspect_7, expert_only_not_versatile); 0.22::true_val(negative_aspect_7, unk_negative_aspect_7).
0.78::acc(s83, negative_aspect_7).
measured(s83, negative_aspect_7, expert_only_not_versatile).
all_consistent(negative_aspect_7) :- consistent(s83, negative_aspect_7).
evidence(all_consistent(negative_aspect_7)).
query(true_val(negative_aspect_7, expert_only_not_versatile)).
query(true_val(negative_aspect_7, unk_negative_aspect_7)).

% @attr sustainability_certification_epoxy
% @type categorical
% @canonical false
% @original_name sustainability_certification (Super Sap Epoxy)
% @values super_sap_50pct=Super_Sap_Epoxy_50pct_carbon_reduction unk_sustainability_certification_epoxy=Unknown
% @importance 0.5

0.82::true_val(sustainability_certification_epoxy, super_sap_50pct); 0.18::true_val(sustainability_certification_epoxy, unk_sustainability_certification_epoxy).
0.78::acc(s53, sustainability_certification_epoxy).
measured(s53, sustainability_certification_epoxy, super_sap_50pct).
all_consistent(sustainability_certification_epoxy) :- (indep(s53), consistent(s53, sustainability_certification_epoxy) ; \+indep(s53)).
evidence(all_consistent(sustainability_certification_epoxy)).
query(true_val(sustainability_certification_epoxy, super_sap_50pct)).
query(true_val(sustainability_certification_epoxy, unk_sustainability_certification_epoxy)).

% @attr sustainability_certification_note
% @type categorical
% @canonical false
% @original_name sustainability_certification (2025 vs 2026 listing)
% @values listed_2025_not_2026=Explicit_in_2025_not_listed_separately_2026 unk_sustainability_certification_note=Unknown
% @importance 0.45

0.75::true_val(sustainability_certification_note, listed_2025_not_2026); 0.25::true_val(sustainability_certification_note, unk_sustainability_certification_note).
0.73::acc(s84, sustainability_certification_note).
measured(s84, sustainability_certification_note, listed_2025_not_2026).
all_consistent(sustainability_certification_note) :- consistent(s84, sustainability_certification_note).
evidence(all_consistent(sustainability_certification_note)).
query(true_val(sustainability_certification_note, listed_2025_not_2026)).
query(true_val(sustainability_certification_note, unk_sustainability_certification_note)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values tgr_comp_list=Amplid_Souly_Grail_K2_Alchemist_YES_PYL_Uninc_Weston_Backwoods_United_Shapes_Cadet_Burton_Gril_Master_Jones_Flagship_Pro unk_comparable_board_cross_brand=Unknown
% @importance 0.85

0.82::true_val(comparable_board_cross_brand, tgr_comp_list); 0.18::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).
0.80::acc(s85, comparable_board_cross_brand).
measured(s85, comparable_board_cross_brand, tgr_comp_list).
all_consistent(comparable_board_cross_brand) :- consistent(s85, comparable_board_cross_brand).
evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, tgr_comp_list)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_alternatives
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (OGL alternatives)
% @values yes_standard_arbor_candle=Yes_Standard_Uninc_DC_Arbor_Candle_Rain unk_comparable_board_cross_brand_alternatives=Unknown
% @importance 0.8

0.85::true_val(comparable_board_cross_brand_alternatives, yes_standard_arbor_candle); 0.15::true_val(comparable_board_cross_brand_alternatives, unk_comparable_board_cross_brand_alternatives).
0.85::acc(s86, comparable_board_cross_brand_alternatives).
measured(s86, comparable_board_cross_brand_alternatives, yes_standard_arbor_candle).
all_consistent(comparable_board_cross_brand_alternatives) :- consistent(s86, comparable_board_cross_brand_alternatives).
evidence(all_consistent(comparable_board_cross_brand_alternatives)).
query(true_val(comparable_board_cross_brand_alternatives, yes_standard_arbor_candle)).
query(true_val(comparable_board_cross_brand_alternatives, unk_comparable_board_cross_brand_alternatives)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values hometown_hero_sketch_artist=Burton_Hometown_Hero_Burton_Sketch_Artist unk_comparable_board_same_brand=Unknown
% @importance 0.75

0.85::true_val(comparable_board_same_brand, hometown_hero_sketch_artist); 0.15::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).
0.85::acc(s87, comparable_board_same_brand).
measured(s87, comparable_board_same_brand, hometown_hero_sketch_artist).
all_consistent(comparable_board_same_brand) :- consistent(s87, comparable_board_same_brand).
evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, hometown_hero_sketch_artist)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_cross_brand_competitor
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Jones Flagship)
% @values jones_flagship_no1=Jones_Flagship_no1_freeride unk_comparable_board_cross_brand_competitor=Unknown
% @importance 0.8

0.75::true_val(comparable_board_cross_brand_competitor, jones_flagship_no1); 0.25::true_val(comparable_board_cross_brand_competitor, unk_comparable_board_cross_brand_competitor).
0.75::acc(s88, comparable_board_cross_brand_competitor).
measured(s88, comparable_board_cross_brand_competitor, jones_flagship_no1).
all_consistent(comparable_board_cross_brand_competitor) :- consistent(s88, comparable_board_cross_brand_competitor).
evidence(all_consistent(comparable_board_cross_brand_competitor)).
query(true_val(comparable_board_cross_brand_competitor, jones_flagship_no1)).
query(true_val(comparable_board_cross_brand_competitor, unk_comparable_board_cross_brand_competitor)).

% @attr competitive_positioning
% @type categorical
% @canonical false
% @original_name competitive positioning
% @values narrower_speed_focused=Narrower_and_more_speed_focused_than_peers unk_competitive_positioning=Unknown
% @importance 0.75

0.78::true_val(competitive_positioning, narrower_speed_focused); 0.22::true_val(competitive_positioning, unk_competitive_positioning).
0.78::acc(s89, competitive_positioning).
measured(s89, competitive_positioning, narrower_speed_focused).
all_consistent(competitive_positioning) :- consistent(s89, competitive_positioning).
evidence(all_consistent(competitive_positioning)).
query(true_val(competitive_positioning, narrower_speed_focused)).
query(true_val(competitive_positioning, unk_competitive_positioning)).

% @attr splitboard_variant_available
% @type categorical
% @canonical false
% @original_name splitboard variant available
% @values yes_splitboard=Yes_FT_High_Fidelity_Splitboard unk_splitboard_variant_available=Unknown
% @importance 0.65

0.87::true_val(splitboard_variant_available, yes_splitboard); 0.13::true_val(splitboard_variant_available, unk_splitboard_variant_available).
0.87::acc(s90, splitboard_variant_available).
measured(s90, splitboard_variant_available, yes_splitboard).
all_consistent(splitboard_variant_available) :- consistent(s90, splitboard_variant_available).
evidence(all_consistent(splitboard_variant_available)).
query(true_val(splitboard_variant_available, yes_splitboard)).
query(true_val(splitboard_variant_available, unk_splitboard_variant_available)).

% @attr splitboard_price_cad
% @type numeric
% @unit CAD
% @canonical false
% @original_name splitboard price (CAD)
% @values v1299_95=1299.95
% @importance 0.6

0.75::true_val(splitboard_price_cad, v1299_95); 0.25::true_val(splitboard_price_cad, unk_splitboard_price_cad).
0.73::acc(s91, splitboard_price_cad).
measured(s91, splitboard_price_cad, v1299_95).
all_consistent(splitboard_price_cad) :- consistent(s91, splitboard_price_cad).
evidence(all_consistent(splitboard_price_cad)).
query(true_val(splitboard_price_cad, v1299_95)).
query(true_val(splitboard_price_cad, unk_splitboard_price_cad)).

% @attr splitboard_features
% @type categorical
% @canonical false
% @original_name splitboard features
% @values split_channel_skin_ready=Split_Channel_mount_skin_ready_tail unk_splitboard_features=Unknown
% @importance 0.5

0.85::true_val(splitboard_features, split_channel_skin_ready); 0.15::true_val(splitboard_features, unk_splitboard_features).
0.85::acc(s92, splitboard_features).
measured(s92, splitboard_features, split_channel_skin_ready).
all_consistent(splitboard_features) :- consistent(s92, splitboard_features).
evidence(all_consistent(splitboard_features)).
query(true_val(splitboard_features, split_channel_skin_ready)).
query(true_val(splitboard_features, unk_splitboard_features)).

% @attr burton_brand_reputation
% @type categorical
% @canonical false
% @original_name Burton brand reputation
% @values original_roots_company=Original_roots_company_since_1977 unk_burton_brand_reputation=Unknown
% @importance 0.4

0.62::true_val(burton_brand_reputation, original_roots_company); 0.38::true_val(burton_brand_reputation, unk_burton_brand_reputation).
0.60::acc(s93, burton_brand_reputation).
measured(s93, burton_brand_reputation, original_roots_company).
all_consistent(burton_brand_reputation) :- consistent(s93, burton_brand_reputation).
evidence(all_consistent(burton_brand_reputation)).
query(true_val(burton_brand_reputation, original_roots_company)).
query(true_val(burton_brand_reputation, unk_burton_brand_reputation)).

% @attr burton_quality_reputation
% @type categorical
% @canonical false
% @original_name Burton quality reputation
% @values performance_craftsmanship=Performance_and_craftsmanship_characteristic unk_burton_quality_reputation=Unknown
% @importance 0.5

0.55::true_val(burton_quality_reputation, performance_craftsmanship); 0.45::true_val(burton_quality_reputation, unk_burton_quality_reputation).
0.55::acc(s94, burton_quality_reputation).
measured(s94, burton_quality_reputation, performance_craftsmanship).
all_consistent(burton_quality_reputation) :- consistent(s94, burton_quality_reputation).
evidence(all_consistent(burton_quality_reputation)).
query(true_val(burton_quality_reputation, performance_craftsmanship)).
query(true_val(burton_quality_reputation, unk_burton_quality_reputation)).

% @attr burton_construction_quality
% @type categorical
% @canonical false
% @original_name Burton construction quality
% @values quality_construction_durable=Quality_construction_durable_materials unk_burton_construction_quality=Unknown
% @importance 0.55

0.62::true_val(burton_construction_quality, quality_construction_durable); 0.38::true_val(burton_construction_quality, unk_burton_construction_quality).
0.62::acc(s95, burton_construction_quality).
measured(s95, burton_construction_quality, quality_construction_durable).
all_consistent(burton_construction_quality) :- consistent(s95, burton_construction_quality).
evidence(all_consistent(burton_construction_quality)).
query(true_val(burton_construction_quality, quality_construction_durable)).
query(true_val(burton_construction_quality, unk_burton_construction_quality)).

% @attr evo_reputation
% @type categorical
% @canonical false
% @original_name evo reputation
% @values major_retailer_price_match=Major_specialty_retailer_price_match_guarantee unk_evo_reputation=Unknown
% @importance 0.55

0.85::true_val(evo_reputation, major_retailer_price_match); 0.15::true_val(evo_reputation, unk_evo_reputation).
0.85::acc(s96, evo_reputation).
measured(s96, evo_reputation, major_retailer_price_match).
all_consistent(evo_reputation) :- consistent(s96, evo_reputation).
evidence(all_consistent(evo_reputation)).
query(true_val(evo_reputation, major_retailer_price_match)).
query(true_val(evo_reputation, unk_evo_reputation)).

% @attr rei_reputation
% @type categorical
% @canonical false
% @original_name REI reputation
% @values major_coop_expert_sizing=Major_outdoor_coop_member_rewards_expert_sizing unk_rei_reputation=Unknown
% @importance 0.4

0.80::true_val(rei_reputation, major_coop_expert_sizing); 0.20::true_val(rei_reputation, unk_rei_reputation).
0.78::acc(s97, rei_reputation).
measured(s97, rei_reputation, major_coop_expert_sizing).
all_consistent(rei_reputation) :- consistent(s97, rei_reputation).
evidence(all_consistent(rei_reputation)).
query(true_val(rei_reputation, major_coop_expert_sizing)).
query(true_val(rei_reputation, unk_rei_reputation)).

% @attr blauer_board_shop_reputation
% @type categorical
% @canonical false
% @original_name Blauer Board Shop reputation
% @values indie_shop_tgr_favorite=Independent_shop_TGR_Favorite_Store unk_blauer_board_shop_reputation=Unknown
% @importance 0.35

0.75::true_val(blauer_board_shop_reputation, indie_shop_tgr_favorite); 0.25::true_val(blauer_board_shop_reputation, unk_blauer_board_shop_reputation).
0.73::acc(s98, blauer_board_shop_reputation).
measured(s98, blauer_board_shop_reputation, indie_shop_tgr_favorite).
all_consistent(blauer_board_shop_reputation) :- consistent(s98, blauer_board_shop_reputation).
evidence(all_consistent(blauer_board_shop_reputation)).
query(true_val(blauer_board_shop_reputation, indie_shop_tgr_favorite)).
query(true_val(blauer_board_shop_reputation, unk_blauer_board_shop_reputation)).

% @attr radio_board_shop
% @type categorical
% @canonical false
% @original_name Radio Board Shop
% @values indie_aspen_co=Independent_local_shop_Aspen_Colorado unk_radio_board_shop=Unknown
% @importance 0.3

0.68::true_val(radio_board_shop, indie_aspen_co); 0.32::true_val(radio_board_shop, unk_radio_board_shop).
0.65::acc(s99, radio_board_shop).
measured(s99, radio_board_shop, indie_aspen_co).
all_consistent(radio_board_shop) :- consistent(s99, radio_board_shop).
evidence(all_consistent(radio_board_shop)).
query(true_val(radio_board_shop, indie_aspen_co)).
query(true_val(radio_board_shop, unk_radio_board_shop)).

% @attr melbourne_snowboard
% @type categorical
% @canonical false
% @original_name Melbourne Snowboard
% @values au_indie_30day_exchange=Australian_independent_retailer_30_day_exchange unk_melbourne_snowboard=Unknown
% @importance 0.4

0.65::true_val(melbourne_snowboard, au_indie_30day_exchange); 0.35::true_val(melbourne_snowboard, unk_melbourne_snowboard).
0.63::acc(s100, melbourne_snowboard).
measured(s100, melbourne_snowboard, au_indie_30day_exchange).
all_consistent(melbourne_snowboard) :- consistent(s100, melbourne_snowboard).
evidence(all_consistent(melbourne_snowboard)).
query(true_val(melbourne_snowboard, au_indie_30day_exchange)).
query(true_val(melbourne_snowboard, unk_melbourne_snowboard)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values best_board_hard_charging=Best_board_ever_for_hard_charging_mixed_terrain unk_user_review_forum=Unknown
% @importance 0.6

0.50::true_val(user_review_forum, best_board_hard_charging); 0.50::true_val(user_review_forum, unk_user_review_forum).
0.45::acc(s101, user_review_forum).
measured(s101, user_review_forum, best_board_hard_charging).
all_consistent(user_review_forum) :- consistent(s101, user_review_forum).
evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, best_board_hard_charging)).
query(true_val(user_review_forum, unk_user_review_forum)).