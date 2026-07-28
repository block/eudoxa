0.20::indep(sMERCHANT).
0.15::indep(s2).
0.15::indep(s5).
0.15::indep(s12).
0.20::indep(s22).
0.25::indep(s24).
0.15::indep(s33).
0.15::indep(s43).
0.15::indep(s48).
0.15::indep(s15).
0.20::indep(s28).
0.15::indep(s30).
0.15::indep(s31).
0.20::indep(s29).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values burton=Burton unk_brand=Unknown
% @importance 0.95

0.95::acc(s1, brand).
0.85::acc(s2, brand).

0.97::true_val(brand, burton); 0.03::true_val(brand, unk_brand).

measured(s1, brand, burton).
measured(s2, brand, burton).

all_consistent(brand) :-
    consistent(s1, brand),
    (indep(s2), consistent(s2, brand) ; \+indep(s2)).

evidence(all_consistent(brand)).
query(true_val(brand, burton)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values family_tree_alekesam=Family_Tree_Alekesam unk_model_name=Unknown
% @importance 0.95

0.95::acc(s1, model_name).
0.85::acc(s2, model_name).

0.97::true_val(model_name, family_tree_alekesam); 0.03::true_val(model_name, unk_model_name).

measured(s1, model_name, family_tree_alekesam).
measured(s2, model_name, family_tree_alekesam).

all_consistent(model_name) :-
    consistent(s1, model_name),
    (indep(s2), consistent(s2, model_name) ; \+indep(s2)).

evidence(all_consistent(model_name)).
query(true_val(model_name, family_tree_alekesam)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2026=2026 unk_model_year=Unknown
% @importance 0.80

0.95::acc(s2, model_year).
0.95::acc(s3, model_year).

0.97::true_val(model_year, y2026); 0.03::true_val(model_year, unk_model_year).

measured(s2, model_year, y2026).
measured(s3, model_year, y2026).

all_consistent(model_year) :-
    consistent(s3, model_year),
    (indep(s2), consistent(s2, model_year) ; \+indep(s2)).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2026)).
query(true_val(model_year, unk_model_year)).

% @attr model_series
% @type categorical
% @canonical false
% @original_name model series
% @values family_tree_limited=Family_Tree_limited_edition_freeride unk_model_series=Unknown
% @importance 0.70

0.95::acc(s3, model_series).

0.90::true_val(model_series, family_tree_limited); 0.10::true_val(model_series, unk_model_series).

measured(s3, model_series, family_tree_limited).

all_consistent(model_series) :-
    consistent(s3, model_series).

evidence(all_consistent(model_series)).
query(true_val(model_series, family_tree_limited)).
query(true_val(model_series, unk_model_series)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.00

0.95::acc(s1, product_type).

0.95::true_val(product_type, snowboard); 0.05::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).

all_consistent(product_type) :-
    consistent(s1, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values y2023=2023 unk_model_first_available_year=Unknown
% @importance 0.80

0.95::acc(s4, model_first_available_year).

0.95::true_val(model_first_available_year, y2023); 0.05::true_val(model_first_available_year, unk_model_first_available_year).

measured(s4, model_first_available_year, y2023).

all_consistent(model_first_available_year) :-
    consistent(s4, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2023)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values selema_masekela=Selema_Masekela unk_pro_rider_name=Unknown
% @importance 0.65

0.88::acc(s5, pro_rider_name).
0.88::acc(s6, pro_rider_name).

0.95::true_val(pro_rider_name, selema_masekela); 0.05::true_val(pro_rider_name, unk_pro_rider_name).

measured(s5, pro_rider_name, selema_masekela).
measured(s6, pro_rider_name, selema_masekela).

all_consistent(pro_rider_name) :-
    (indep(s5), consistent(s5, pro_rider_name) ; \+indep(s5)),
    (indep(sMERCHANT), consistent(s6, pro_rider_name) ; \+indep(sMERCHANT)).

evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, selema_masekela)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr design_inspiration
% @type categorical
% @canonical false
% @original_name design inspiration
% @values surf_twin_fin=Surf_inspired_twin_fin unk_design_inspiration=Unknown
% @importance 0.50

0.95::acc(s7, design_inspiration).

0.90::true_val(design_inspiration, surf_twin_fin); 0.10::true_val(design_inspiration, unk_design_inspiration).

measured(s7, design_inspiration, surf_twin_fin).

all_consistent(design_inspiration) :-
    consistent(s7, design_inspiration).

evidence(all_consistent(design_inspiration)).
query(true_val(design_inspiration, surf_twin_fin)).
query(true_val(design_inspiration, unk_design_inspiration)).

% @attr topsheet_appearance_description
% @type categorical
% @canonical true
% @original_name topsheet_appearance_description
% @values macaw_parrot_audubon=Bird_themed_Audubon_macaw_parrot unk_topsheet_appearance_description=Unknown
% @importance 0.35

0.95::acc(s8, topsheet_appearance_description).

0.90::true_val(topsheet_appearance_description, macaw_parrot_audubon); 0.10::true_val(topsheet_appearance_description, unk_topsheet_appearance_description).

measured(s8, topsheet_appearance_description, macaw_parrot_audubon).

all_consistent(topsheet_appearance_description) :-
    consistent(s8, topsheet_appearance_description).

evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, macaw_parrot_audubon)).
query(true_val(topsheet_appearance_description, unk_topsheet_appearance_description)).

% @attr graphic_designer_artist
% @type categorical
% @canonical true
% @original_name graphic_designer_artist
% @values chase_hall=Chase_Hall_NYC_painter unk_graphic_designer_artist=Unknown
% @importance 0.30

0.93::acc(s9, graphic_designer_artist).

0.86::true_val(graphic_designer_artist, chase_hall); 0.14::true_val(graphic_designer_artist, unk_graphic_designer_artist).

measured(s9, graphic_designer_artist, chase_hall).

all_consistent(graphic_designer_artist) :-
    consistent(s9, graphic_designer_artist).

evidence(all_consistent(graphic_designer_artist)).
query(true_val(graphic_designer_artist, chase_hall)).
query(true_val(graphic_designer_artist, unk_graphic_designer_artist)).

% @attr selema_masekela_background
% @type categorical
% @canonical false
% @original_name Selema Masekela background
% @values xgames_chief_burton_board=XGames_Chief_Burton_Board_ambassador unk_selema_masekela_background=Unknown
% @importance 0.40

0.93::acc(s10, selema_masekela_background).
0.75::acc(s11, selema_masekela_background).

0.95::true_val(selema_masekela_background, xgames_chief_burton_board); 0.05::true_val(selema_masekela_background, unk_selema_masekela_background).

measured(s10, selema_masekela_background, xgames_chief_burton_board).
measured(s11, selema_masekela_background, xgames_chief_burton_board).

all_consistent(selema_masekela_background) :-
    consistent(s10, selema_masekela_background),
    consistent(s11, selema_masekela_background).

evidence(all_consistent(selema_masekela_background)).
query(true_val(selema_masekela_background, xgames_chief_burton_board)).
query(true_val(selema_masekela_background, unk_selema_masekela_background)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values unisex_female_friendly=Unisex_gender_neutral_female_friendly_sizing unk_gender=Unknown
% @importance 0.625

0.85::acc(s12, gender).
0.88::acc(s13, gender).

0.95::true_val(gender, unisex_female_friendly); 0.05::true_val(gender, unk_gender).

measured(s12, gender, unisex_female_friendly).
measured(s13, gender, unisex_female_friendly).

all_consistent(gender) :-
    (indep(s12), consistent(s12, gender) ; \+indep(s12)),
    consistent(s13, gender).

evidence(all_consistent(gender)).
query(true_val(gender, unisex_female_friendly)).
query(true_val(gender, unk_gender)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values burton_snowboards=Burton_Snowboards_founded_1977_Burlington_VT unk_manufacturer=Unknown
% @importance 0.70

0.90::acc(s14, manufacturer).

0.92::true_val(manufacturer, burton_snowboards); 0.08::true_val(manufacturer, unk_manufacturer).

measured(s14, manufacturer, burton_snowboards).

all_consistent(manufacturer) :-
    consistent(s14, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, burton_snowboards)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values keil_nindl_austria=Keil_Nindl_GmbH_Uttendorf_Austria unk_manufacturing_location_current=Unknown
% @importance 0.50

0.82::acc(s15, manufacturing_location_current).
0.90::acc(s16, manufacturing_location_current).
0.85::acc(s17, manufacturing_location_current).

0.95::true_val(manufacturing_location_current, keil_nindl_austria); 0.05::true_val(manufacturing_location_current, unk_manufacturing_location_current).

measured(s15, manufacturing_location_current, keil_nindl_austria).
measured(s16, manufacturing_location_current, keil_nindl_austria).
measured(s17, manufacturing_location_current, keil_nindl_austria).

all_consistent(manufacturing_location_current) :-
    (indep(s15), consistent(s15, manufacturing_location_current) ; \+indep(s15)),
    consistent(s16, manufacturing_location_current),
    consistent(s17, manufacturing_location_current).

evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, keil_nindl_austria)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

% @attr burton_prototyping_facility
% @type categorical
% @canonical false
% @original_name Burton prototyping facility
% @values burlington_vt=Burlington_Vermont_USA unk_burton_prototyping_facility=Unknown
% @importance 0.50

0.80::acc(s18, burton_prototyping_facility).

0.79::true_val(burton_prototyping_facility, burlington_vt); 0.21::true_val(burton_prototyping_facility, unk_burton_prototyping_facility).

measured(s18, burton_prototyping_facility, burlington_vt).

all_consistent(burton_prototyping_facility) :-
    consistent(s18, burton_prototyping_facility).

evidence(all_consistent(burton_prototyping_facility)).
query(true_val(burton_prototyping_facility, burlington_vt)).
query(true_val(burton_prototyping_facility, unk_burton_prototyping_facility)).

% @attr manufacturing_location_lower_range
% @type categorical
% @canonical false
% @original_name Burton lower-range boards also manufactured in China
% @values china=China unk_manufacturing_location_lower_range=Unknown
% @importance 0.50

0.80::acc(s18, manufacturing_location_lower_range).

0.79::true_val(manufacturing_location_lower_range, china); 0.21::true_val(manufacturing_location_lower_range, unk_manufacturing_location_lower_range).

measured(s18, manufacturing_location_lower_range, china).

all_consistent(manufacturing_location_lower_range) :-
    consistent(s18, manufacturing_location_lower_range).

evidence(all_consistent(manufacturing_location_lower_range)).
query(true_val(manufacturing_location_lower_range, china)).
query(true_val(manufacturing_location_lower_range, unk_manufacturing_location_lower_range)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values b_corporation=Certified_B_Corporation unk_sustainability_certification=Unknown
% @importance 0.70

0.88::acc(s14, sustainability_certification).

0.88::true_val(sustainability_certification, b_corporation); 0.12::true_val(sustainability_certification, unk_sustainability_certification).

measured(s14, sustainability_certification, b_corporation).

all_consistent(sustainability_certification) :-
    consistent(s14, sustainability_certification).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, b_corporation)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v629_95=629.95 unk_price_usd_msrp=Unknown
% @importance 0.95

0.88::acc(s19, price_usd_msrp).
0.85::acc(s20, price_usd_msrp).

0.95::true_val(price_usd_msrp, v629_95); 0.05::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s19, price_usd_msrp, v629_95).
measured(s20, price_usd_msrp, v629_95).

all_consistent(price_usd_msrp) :-
    consistent(s19, price_usd_msrp),
    consistent(s20, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v629_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_aud_merchant
% @type numeric
% @canonical true
% @original_name price_aud_merchant
% @unit AUD
% @values v899_99=899.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.95::acc(sMERCHANT, price_aud_merchant).

0.95::true_val(price_aud_merchant, v899_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(sMERCHANT, price_aud_merchant, v899_99).

all_consistent(price_aud_merchant) :-
    consistent(sMERCHANT, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v899_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_usd_evo
% @type numeric
% @canonical true
% @original_name price_usd_evo
% @unit USD
% @values v440_96=440.96 unk_price_usd_evo=Unknown
% @importance 0.95

0.90::acc(s21, price_usd_evo).

0.90::true_val(price_usd_evo, v440_96); 0.10::true_val(price_usd_evo, unk_price_usd_evo).

measured(s21, price_usd_evo, v440_96).

all_consistent(price_usd_evo) :-
    consistent(s21, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v440_96)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_rei
% @type numeric
% @canonical true
% @original_name price_usd_rei
% @unit USD
% @values v377_83=377.83 unk_price_usd_rei=Unknown
% @importance 0.95

0.88::acc(s22, price_usd_rei).

0.88::true_val(price_usd_rei, v377_83); 0.12::true_val(price_usd_rei, unk_price_usd_rei).

measured(s22, price_usd_rei, v377_83).

all_consistent(price_usd_rei) :-
    consistent(s22, price_usd_rei).

evidence(all_consistent(price_usd_rei)).
query(true_val(price_usd_rei, v377_83)).
query(true_val(price_usd_rei, unk_price_usd_rei)).

% @attr price_usd_the_house
% @type numeric
% @canonical false
% @original_name price (USD at The House, 2025 model)
% @unit USD
% @values v433_97=433.97 unk_price_usd_the_house=Unknown
% @importance 0.85

0.80::acc(s23, price_usd_the_house).

0.80::true_val(price_usd_the_house, v433_97); 0.20::true_val(price_usd_the_house, unk_price_usd_the_house).

measured(s23, price_usd_the_house, v433_97).

all_consistent(price_usd_the_house) :-
    consistent(s23, price_usd_the_house).

evidence(all_consistent(price_usd_the_house)).
query(true_val(price_usd_the_house, v433_97)).
query(true_val(price_usd_the_house, unk_price_usd_the_house)).

% @attr price_usd_skatepro
% @type numeric
% @canonical false
% @original_name price (USD at SkatePro)
% @unit USD
% @values v449_95=449.95 unk_price_usd_skatepro=Unknown
% @importance 0.90

0.75::acc(s24, price_usd_skatepro).

0.75::true_val(price_usd_skatepro, v449_95); 0.25::true_val(price_usd_skatepro, unk_price_usd_skatepro).

measured(s24, price_usd_skatepro, v449_95).

all_consistent(price_usd_skatepro) :-
    consistent(s24, price_usd_skatepro).

evidence(all_consistent(price_usd_skatepro)).
query(true_val(price_usd_skatepro, v449_95)).
query(true_val(price_usd_skatepro, unk_price_usd_skatepro)).

% @attr price_avg_category
% @type numeric
% @canonical false
% @original_name price (average for mellow freeride category)
% @unit USD
% @values v600=600.0 unk_price_avg_category=Unknown
% @importance 0.90

0.85::acc(s25, price_avg_category).

0.81::true_val(price_avg_category, v600); 0.19::true_val(price_avg_category, unk_price_avg_category).

measured(s25, price_avg_category, v600).

all_consistent(price_avg_category) :-
    consistent(s25, price_avg_category).

evidence(all_consistent(price_avg_category)).
query(true_val(price_avg_category, v600)).
query(true_val(price_avg_category, unk_price_avg_category)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values in_stock_2026=In_stock_available_2026 unk_availability_status=Unknown
% @importance 0.58

0.93::acc(s1, availability_status).
0.88::acc(s21, availability_status).
0.82::acc(s26, availability_status).
0.80::acc(s28, availability_status).
0.80::acc(s30, availability_status).
0.80::acc(s31, availability_status).
0.78::acc(s24, availability_status).
0.80::acc(s32, availability_status).

0.97::true_val(availability_status, in_stock_2026); 0.03::true_val(availability_status, unk_availability_status).

measured(s1, availability_status, in_stock_2026).
measured(s21, availability_status, in_stock_2026).
measured(s26, availability_status, in_stock_2026).
measured(s28, availability_status, in_stock_2026).
measured(s30, availability_status, in_stock_2026).
measured(s31, availability_status, in_stock_2026).
measured(s24, availability_status, in_stock_2026).
measured(s32, availability_status, in_stock_2026).

all_consistent(availability_status) :-
    consistent(s1, availability_status),
    (indep(s2), consistent(s21, availability_status) ; \+indep(s2)),
    (indep(s5), consistent(s26, availability_status) ; \+indep(s5)),
    (indep(s28), consistent(s28, availability_status) ; \+indep(s28)),
    (indep(s30), consistent(s30, availability_status) ; \+indep(s30)),
    (indep(s31), consistent(s31, availability_status) ; \+indep(s31)),
    (indep(s24), consistent(s24, availability_status) ; \+indep(s24)),
    (indep(sMERCHANT), consistent(s32, availability_status) ; \+indep(sMERCHANT)).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, in_stock_2026)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_clearance
% @type categorical
% @canonical false
% @original_name availability_status (REI clearance)
% @values discontinued_clearance=Discontinued_clearance_pricing unk_availability_status_clearance=Unknown
% @importance 0.95

0.85::acc(s22, availability_status_clearance).

0.85::true_val(availability_status_clearance, discontinued_clearance); 0.15::true_val(availability_status_clearance, unk_availability_status_clearance).

measured(s22, availability_status_clearance, discontinued_clearance).

all_consistent(availability_status_clearance) :-
    (indep(s22), consistent(s22, availability_status_clearance) ; \+indep(s22)).

evidence(all_consistent(availability_status_clearance)).
query(true_val(availability_status_clearance, discontinued_clearance)).
query(true_val(availability_status_clearance, unk_availability_status_clearance)).

% @attr availability_status_sold_out
% @type categorical
% @canonical false
% @original_name availability_status (Erik's sold out)
% @values sizes_sold_out=Sizes_sold_out_unavailable unk_availability_status_sold_out=Unknown
% @importance 0.60

0.78::acc(s27, availability_status_sold_out).

0.78::true_val(availability_status_sold_out, sizes_sold_out); 0.22::true_val(availability_status_sold_out, unk_availability_status_sold_out).

measured(s27, availability_status_sold_out, sizes_sold_out).

all_consistent(availability_status_sold_out) :-
    (indep(s12), consistent(s27, availability_status_sold_out) ; \+indep(s12)).

evidence(all_consistent(availability_status_sold_out)).
query(true_val(availability_status_sold_out, sizes_sold_out)).
query(true_val(availability_status_sold_out, unk_availability_status_sold_out)).

% @attr availability_status_demo
% @type categorical
% @canonical false
% @original_name availability_status (demo boards)
% @values demo_listed=Demo_boards_listed unk_availability_status_demo=Unknown
% @importance 0.40

0.75::acc(s29, availability_status_demo).

0.72::true_val(availability_status_demo, demo_listed); 0.28::true_val(availability_status_demo, unk_availability_status_demo).

measured(s29, availability_status_demo, demo_listed).

all_consistent(availability_status_demo) :-
    (indep(s29), consistent(s29, availability_status_demo) ; \+indep(s29)).

evidence(all_consistent(availability_status_demo)).
query(true_val(availability_status_demo, demo_listed)).
query(true_val(availability_status_demo, unk_availability_status_demo)).

% @attr availability_status_uk
% @type categorical
% @canonical false
% @original_name availability_status (UK pricing GBP)
% @values listed_gbp_481_sale=Listed_GBP481_sale_GBP602_regular unk_availability_status_uk=Unknown
% @importance 0.60

0.72::acc(s33, availability_status_uk).

0.68::true_val(availability_status_uk, listed_gbp_481_sale); 0.32::true_val(availability_status_uk, unk_availability_status_uk).

measured(s33, availability_status_uk, listed_gbp_481_sale).

all_consistent(availability_status_uk) :-
    (indep(s33), consistent(s33, availability_status_uk) ; \+indep(s33)).

evidence(all_consistent(availability_status_uk)).
query(true_val(availability_status_uk, listed_gbp_481_sale)).
query(true_val(availability_status_uk, unk_availability_status_uk)).

% @attr australian_shipping_restriction
% @type categorical
% @canonical false
% @original_name Australian shipping restriction (merchant-provided)
% @values australia_only=Only_available_shipping_within_Australia unk_australian_shipping_restriction=Unknown
% @importance 0.85

0.93::acc(sMERCHANT, australian_shipping_restriction).

0.93::true_val(australian_shipping_restriction, australia_only); 0.07::true_val(australian_shipping_restriction, unk_australian_shipping_restriction).

measured(sMERCHANT, australian_shipping_restriction, australia_only).

all_consistent(australian_shipping_restriction) :-
    consistent(sMERCHANT, australian_shipping_restriction).

evidence(all_consistent(australian_shipping_restriction)).
query(true_val(australian_shipping_restriction, australia_only)).
query(true_val(australian_shipping_restriction, unk_australian_shipping_restriction)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values freeride_powder=Freeride_Powder unk_board_category=Unknown
% @importance 0.85

0.92::acc(sMERCHANT, board_category).

0.92::true_val(board_category, freeride_powder); 0.08::true_val(board_category, unk_board_category).

measured(sMERCHANT, board_category, freeride_powder).

all_consistent(board_category) :-
    consistent(sMERCHANT, board_category).

evidence(all_consistent(board_category)).
query(true_val(board_category, freeride_powder)).
query(true_val(board_category, unk_board_category)).

% @attr board_subtype
% @type categorical
% @canonical false
% @original_name board subtype (review classification)
% @values mellow_freeride=Mellow_Freeride_2026_reclassified unk_board_subtype=Unknown
% @importance 0.875

0.88::acc(s25, board_subtype).
0.88::acc(s34, board_subtype).

0.95::true_val(board_subtype, mellow_freeride); 0.05::true_val(board_subtype, unk_board_subtype).

measured(s25, board_subtype, mellow_freeride).
measured(s34, board_subtype, mellow_freeride).

all_consistent(board_subtype) :-
    consistent(s25, board_subtype),
    consistent(s34, board_subtype).

evidence(all_consistent(board_subtype)).
query(true_val(board_subtype, mellow_freeride)).
query(true_val(board_subtype, unk_board_subtype)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values groomers_powder_am_freeride=Groomers_fresh_powder_all_mountain_freeride unk_terrain_suitability=Unknown
% @importance 0.85

0.90::acc(sMERCHANT, terrain_suitability).

0.93::true_val(terrain_suitability, groomers_powder_am_freeride); 0.07::true_val(terrain_suitability, unk_terrain_suitability).

measured(sMERCHANT, terrain_suitability, groomers_powder_am_freeride).

all_consistent(terrain_suitability) :-
    consistent(sMERCHANT, terrain_suitability).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, groomers_powder_am_freeride)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values surf_freeride_carving_powder=Surf_inspired_freeride_carving_powder unk_riding_style=Unknown
% @importance 0.775

0.90::acc(sMERCHANT, riding_style).
0.82::acc(s5, riding_style).

0.95::true_val(riding_style, surf_freeride_carving_powder); 0.05::true_val(riding_style, unk_riding_style).

measured(sMERCHANT, riding_style, surf_freeride_carving_powder).
measured(s5, riding_style, surf_freeride_carving_powder).

all_consistent(riding_style) :-
    consistent(sMERCHANT, riding_style),
    (indep(s5), consistent(s5, riding_style) ; \+indep(s5)).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, surf_freeride_carving_powder)).
query(true_val(riding_style, unk_riding_style)).

% @attr terrain_suitability_park
% @type numeric
% @canonical false
% @original_name terrain_suitability (park rating)
% @unit /10
% @values v4=4.0 unk_terrain_suitability_park=Unknown
% @importance 0.85

0.90::acc(sMERCHANT, terrain_suitability_park).
0.80::acc(s35, terrain_suitability_park).

0.95::true_val(terrain_suitability_park, v4); 0.05::true_val(terrain_suitability_park, unk_terrain_suitability_park).

measured(sMERCHANT, terrain_suitability_park, v4).
measured(s35, terrain_suitability_park, v4).

all_consistent(terrain_suitability_park) :-
    consistent(sMERCHANT, terrain_suitability_park),
    (indep(s33), consistent(s35, terrain_suitability_park) ; \+indep(s33)).

evidence(all_consistent(terrain_suitability_park)).
query(true_val(terrain_suitability_park, v4)).
query(true_val(terrain_suitability_park, unk_terrain_suitability_park)).

% @attr terrain_suitability_all_mountain
% @type numeric
% @canonical false
% @original_name terrain_suitability (all mountain rating)
% @unit /10
% @values v9=9.0 unk_terrain_suitability_all_mountain=Unknown
% @importance 0.85

0.90::acc(sMERCHANT, terrain_suitability_all_mountain).
0.80::acc(s35, terrain_suitability_all_mountain).

0.95::true_val(terrain_suitability_all_mountain, v9); 0.05::true_val(terrain_suitability_all_mountain, unk_terrain_suitability_all_mountain).

measured(sMERCHANT, terrain_suitability_all_mountain, v9).
measured(s35, terrain_suitability_all_mountain, v9).

all_consistent(terrain_suitability_all_mountain) :-
    consistent(sMERCHANT, terrain_suitability_all_mountain),
    (indep(s33), consistent(s35, terrain_suitability_all_mountain) ; \+indep(s33)).

evidence(all_consistent(terrain_suitability_all_mountain)).
query(true_val(terrain_suitability_all_mountain, v9)).
query(true_val(terrain_suitability_all_mountain, unk_terrain_suitability_all_mountain)).

% @attr terrain_suitability_powder
% @type numeric
% @canonical false
% @original_name terrain_suitability (powder rating)
% @unit /10
% @values v7=7.0 unk_terrain_suitability_powder=Unknown
% @importance 0.85

0.90::acc(sMERCHANT, terrain_suitability_powder).
0.80::acc(s35, terrain_suitability_powder).

0.95::true_val(terrain_suitability_powder, v7); 0.05::true_val(terrain_suitability_powder, unk_terrain_suitability_powder).

measured(sMERCHANT, terrain_suitability_powder, v7).
measured(s35, terrain_suitability_powder, v7).

all_consistent(terrain_suitability_powder) :-
    consistent(sMERCHANT, terrain_suitability_powder),
    (indep(s33), consistent(s35, terrain_suitability_powder) ; \+indep(s33)).

evidence(all_consistent(terrain_suitability_powder)).
query(true_val(terrain_suitability_powder, v7)).
query(true_val(terrain_suitability_powder, unk_terrain_suitability_powder)).

% @attr ideal_conditions
% @type categorical
% @canonical false
% @original_name ideal conditions
% @values fresh_untracked=Best_in_fresh_untracked_snow_weakness_in_tracked unk_ideal_conditions=Unknown
% @importance 0.80

0.85::acc(s36, ideal_conditions).

0.82::true_val(ideal_conditions, fresh_untracked); 0.18::true_val(ideal_conditions, unk_ideal_conditions).

measured(s36, ideal_conditions, fresh_untracked).

all_consistent(ideal_conditions) :-
    consistent(s36, ideal_conditions).

evidence(all_consistent(ideal_conditions)).
query(true_val(ideal_conditions, fresh_untracked)).
query(true_val(ideal_conditions, unk_ideal_conditions)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate_to_advanced=Intermediate_to_Advanced unk_rider_level=Unknown
% @importance 0.85

0.90::acc(sMERCHANT, rider_level).
0.87::acc(s37, rider_level).

0.95::true_val(rider_level, intermediate_to_advanced); 0.05::true_val(rider_level, unk_rider_level).

measured(sMERCHANT, rider_level, intermediate_to_advanced).
measured(s37, rider_level, intermediate_to_advanced).

all_consistent(rider_level) :-
    consistent(sMERCHANT, rider_level),
    (indep(s2), consistent(s37, rider_level) ; \+indep(s2)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate_to_advanced)).
query(true_val(rider_level, unk_rider_level)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values intermediate_to_expert=Intermediate_to_Expert intermediate_to_advanced_versatile=Intermediate_to_advanced_versatile_fun
% @importance 0.77

0.82::acc(s26, skill_level_recommendation).
0.85::acc(s37, skill_level_recommendation).
0.78::acc(s38, skill_level_recommendation).

0.60::true_val(skill_level_recommendation, intermediate_to_expert); 0.40::true_val(skill_level_recommendation, intermediate_to_advanced_versatile).

measured(s26, skill_level_recommendation, intermediate_to_expert).
measured(s37, skill_level_recommendation, intermediate_to_expert).
measured(s38, skill_level_recommendation, intermediate_to_advanced_versatile).

all_consistent(skill_level_recommendation) :-
    (indep(s5), consistent(s26, skill_level_recommendation) ; \+indep(s5)),
    (indep(s2), consistent(s37, skill_level_recommendation) ; \+indep(s2)),
    consistent(s38, skill_level_recommendation).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, intermediate_to_expert)).
query(true_val(skill_level_recommendation, intermediate_to_advanced_versatile)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 0.85

0.92::acc(sMERCHANT, shape).

0.95::true_val(shape, tapered_directional); 0.05::true_val(shape, unk_shape).

measured(sMERCHANT, shape, tapered_directional).

all_consistent(shape) :-
    consistent(sMERCHANT, shape).

evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

% @attr taper
% @type numeric
% @canonical true
% @original_name taper
% @unit mm
% @values v15=15.0 unk_taper=Unknown
% @importance 0.825

0.92::acc(sMERCHANT, taper).
0.82::acc(s39, taper).

0.95::true_val(taper, v15); 0.05::true_val(taper, unk_taper).

measured(sMERCHANT, taper, v15).
measured(s39, taper, v15).

all_consistent(taper) :-
    consistent(sMERCHANT, taper),
    (indep(s5), consistent(s39, taper) ; \+indep(s5)).

evidence(all_consistent(taper)).
query(true_val(taper, v15)).
query(true_val(taper, unk_taper)).

% @attr freeride_geometry
% @type categorical
% @canonical false
% @original_name freeride geometry
% @values balanced_freeride=Balanced_Freeride_Geometry_setback_camber_stance_centred_sidecut unk_freeride_geometry=Unknown
% @importance 0.825

0.90::acc(sMERCHANT, freeride_geometry).
0.87::acc(s40, freeride_geometry).

0.95::true_val(freeride_geometry, balanced_freeride); 0.05::true_val(freeride_geometry, unk_freeride_geometry).

measured(sMERCHANT, freeride_geometry, balanced_freeride).
measured(s40, freeride_geometry, balanced_freeride).

all_consistent(freeride_geometry) :-
    consistent(sMERCHANT, freeride_geometry),
    (indep(s2), consistent(s40, freeride_geometry) ; \+indep(s2)).

evidence(all_consistent(freeride_geometry)).
query(true_val(freeride_geometry, balanced_freeride)).
query(true_val(freeride_geometry, unk_freeride_geometry)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values directional_camber=Directional_Camber_rocker_nose_camber_back unk_camber_type=Unknown
% @importance 0.875

0.92::acc(sMERCHANT, camber_type).
0.87::acc(s41, camber_type).

0.95::true_val(camber_type, directional_camber); 0.05::true_val(camber_type, unk_camber_type).

measured(sMERCHANT, camber_type, directional_camber).
measured(s41, camber_type, directional_camber).

all_consistent(camber_type) :-
    consistent(sMERCHANT, camber_type),
    (indep(s2), consistent(s41, camber_type) ; \+indep(s2)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, directional_camber)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_height_mm
% @type numeric
% @canonical true
% @original_name camber_height_mm
% @unit mm
% @values v7_5=7.5 unk_camber_height_mm=Unknown
% @importance 0.90

0.92::acc(s25, camber_height_mm).

0.86::true_val(camber_height_mm, v7_5); 0.14::true_val(camber_height_mm, unk_camber_height_mm).

measured(s25, camber_height_mm, v7_5).

all_consistent(camber_height_mm) :-
    consistent(s25, camber_height_mm).

evidence(all_consistent(camber_height_mm)).
query(true_val(camber_height_mm, v7_5)).
query(true_val(camber_height_mm, unk_camber_height_mm)).

% @attr flex_rating_10_manufacturer
% @type numeric
% @canonical true
% @original_name flex_rating_10_manufacturer
% @unit /10
% @values v6_5=6.5 unk_flex_rating_10_manufacturer=Unknown
% @importance 0.85

0.93::acc(sMERCHANT, flex_rating_10_manufacturer).

0.93::true_val(flex_rating_10_manufacturer, v6_5); 0.07::true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer).

measured(sMERCHANT, flex_rating_10_manufacturer, v6_5).

all_consistent(flex_rating_10_manufacturer) :-
    consistent(sMERCHANT, flex_rating_10_manufacturer).

evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, v6_5)).
query(true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values medium_6=Medium_6_of_10 mid_stiff=Mid_Stiff
% @importance 0.82

0.88::acc(s25, flex_feel).
0.83::acc(s42, flex_feel).
0.80::acc(s32, flex_feel).

0.55::true_val(flex_feel, medium_6); 0.45::true_val(flex_feel, mid_stiff).

measured(s25, flex_feel, medium_6).
measured(s42, flex_feel, medium_6).
measured(s32, flex_feel, mid_stiff).

all_consistent(flex_feel) :-
    consistent(s25, flex_feel),
    consistent(s42, flex_feel),
    (indep(sMERCHANT), consistent(s32, flex_feel) ; \+indep(sMERCHANT)).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium_6)).
query(true_val(flex_feel, mid_stiff)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @original_name flex_rating_10
% @unit /10
% @values v6_5_range=6.5 v8=8.0
% @importance 0.80

0.75::acc(s43, flex_rating_10).
0.40::acc(s24, flex_rating_10).

0.80::true_val(flex_rating_10, v6_5_range); 0.20::true_val(flex_rating_10, v8).

measured(s43, flex_rating_10, v6_5_range).
measured(s24, flex_rating_10, v8).

all_consistent(flex_rating_10) :-
    (indep(s43), consistent(s43, flex_rating_10) ; \+indep(s43)),
    (indep(s24), consistent(s24, flex_rating_10) ; \+indep(s24)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v6_5_range)).
query(true_val(flex_rating_10, v8)).

% @attr flex_direction
% @type categorical
% @canonical false
% @original_name flex_direction
% @values directional_flex=Directional_Flex_stiffer_nose_pop_in_tail unk_flex_direction=Unknown
% @importance 0.85

0.92::acc(sMERCHANT, flex_direction).

0.92::true_val(flex_direction, directional_flex); 0.08::true_val(flex_direction, unk_flex_direction).

measured(sMERCHANT, flex_direction, directional_flex).

all_consistent(flex_direction) :-
    consistent(sMERCHANT, flex_direction).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional_flex)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr flex_feel_directional_detail
% @type categorical
% @canonical false
% @original_name flex_feel (directional detail)
% @values nose_medium_tail_stiffer=Nose_bends_easier_medium_stiff_front_insert_to_tail unk_flex_feel_directional_detail=Unknown
% @importance 0.75

0.85::acc(s44, flex_feel_directional_detail).

0.82::true_val(flex_feel_directional_detail, nose_medium_tail_stiffer); 0.18::true_val(flex_feel_directional_detail, unk_flex_feel_directional_detail).

measured(s44, flex_feel_directional_detail, nose_medium_tail_stiffer).

all_consistent(flex_feel_directional_detail) :-
    consistent(s44, flex_feel_directional_detail).

evidence(all_consistent(flex_feel_directional_detail)).
query(true_val(flex_feel_directional_detail, nose_medium_tail_stiffer)).
query(true_val(flex_feel_directional_detail, unk_flex_feel_directional_detail)).

% @attr flex_change_2026_vs_2025
% @type categorical
% @canonical false
% @original_name 2026 vs 2025 flex change
% @values softer_torsional=Noticeably_softer_torsional_flex_more_mellow unk_flex_change_2026_vs_2025=Unknown
% @importance 0.85

0.88::acc(s34, flex_change_2026_vs_2025).

0.83::true_val(flex_change_2026_vs_2025, softer_torsional); 0.17::true_val(flex_change_2026_vs_2025, unk_flex_change_2026_vs_2025).

measured(s34, flex_change_2026_vs_2025, softer_torsional).

all_consistent(flex_change_2026_vs_2025) :-
    consistent(s34, flex_change_2026_vs_2025).

evidence(all_consistent(flex_change_2026_vs_2025)).
query(true_val(flex_change_2026_vs_2025, softer_torsional)).
query(true_val(flex_change_2026_vs_2025, unk_flex_change_2026_vs_2025)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values super_fly_ii_700g=Super_Fly_II_700G_dual_species_wood_FSC unk_core_material=Unknown
% @importance 0.80

0.93::acc(sMERCHANT, core_material).
0.95::acc(s45, core_material).
0.87::acc(s46, core_material).

0.97::true_val(core_material, super_fly_ii_700g); 0.03::true_val(core_material, unk_core_material).

measured(sMERCHANT, core_material, super_fly_ii_700g).
measured(s45, core_material, super_fly_ii_700g).
measured(s46, core_material, super_fly_ii_700g).

all_consistent(core_material) :-
    (indep(sMERCHANT), consistent(sMERCHANT, core_material) ; \+indep(sMERCHANT)),
    consistent(s45, core_material),
    (indep(s22), consistent(s46, core_material) ; \+indep(s22)).

evidence(all_consistent(core_material)).
query(true_val(core_material, super_fly_ii_700g)).
query(true_val(core_material, unk_core_material)).

% @attr core_construction
% @type categorical
% @canonical false
% @original_name core construction
% @values dualzone_egd=Dualzone_EGD_wood_grain_heel_toe_edges unk_core_construction=Unknown
% @importance 0.70

0.88::acc(sMERCHANT, core_construction).
0.82::acc(s47, core_construction).

0.95::true_val(core_construction, dualzone_egd); 0.05::true_val(core_construction, unk_core_construction).

measured(sMERCHANT, core_construction, dualzone_egd).
measured(s47, core_construction, dualzone_egd).

all_consistent(core_construction) :-
    consistent(sMERCHANT, core_construction),
    (indep(sMERCHANT), consistent(s47, core_construction) ; \+indep(sMERCHANT)).

evidence(all_consistent(core_construction)).
query(true_val(core_construction, dualzone_egd)).
query(true_val(core_construction, unk_core_construction)).

% @attr core_profiling
% @type categorical
% @canonical false
% @original_name core profiling
% @values squeezebox=Squeezebox_thicker_thinner_sections_energy_transfer unk_core_profiling=Unknown
% @importance 0.65

0.90::acc(sMERCHANT, core_profiling).
0.78::acc(s48, core_profiling).

0.95::true_val(core_profiling, squeezebox); 0.05::true_val(core_profiling, unk_core_profiling).

measured(sMERCHANT, core_profiling, squeezebox).
measured(s48, core_profiling, squeezebox).

all_consistent(core_profiling) :-
    consistent(sMERCHANT, core_profiling),
    (indep(s48), consistent(s48, core_profiling) ; \+indep(s48)).

evidence(all_consistent(core_profiling)).
query(true_val(core_profiling, squeezebox)).
query(true_val(core_profiling, unk_core_profiling)).

% @attr laminate
% @type categorical
% @canonical false
% @original_name laminate
% @values triax_fiberglass=Triax_fiberglass_above_below_core unk_laminate=Unknown
% @importance 0.75

0.90::acc(sMERCHANT, laminate).
0.82::acc(s49, laminate).

0.95::true_val(laminate, triax_fiberglass); 0.05::true_val(laminate, unk_laminate).

measured(sMERCHANT, laminate, triax_fiberglass).
measured(s49, laminate, triax_fiberglass).

all_consistent(laminate) :-
    consistent(sMERCHANT, laminate),
    (indep(sMERCHANT), consistent(s49, laminate) ; \+indep(sMERCHANT)).

evidence(all_consistent(laminate)).
query(true_val(laminate, triax_fiberglass)).
query(true_val(laminate, unk_laminate)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values carbon_i_beam=Carbon_I_Beam_ultralight_backbone_bottom_triax unk_construction_material_innovation=Unknown
% @importance 0.75

0.90::acc(sMERCHANT, construction_material_innovation).
0.82::acc(s49, construction_material_innovation).

0.95::true_val(construction_material_innovation, carbon_i_beam); 0.05::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(sMERCHANT, construction_material_innovation, carbon_i_beam).
measured(s49, construction_material_innovation, carbon_i_beam).

all_consistent(construction_material_innovation) :-
    consistent(sMERCHANT, construction_material_innovation),
    (indep(sMERCHANT), consistent(s49, construction_material_innovation) ; \+indep(sMERCHANT)).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, carbon_i_beam)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_wfo=Sintered_WFO_high_density_wax_infused unk_base_material=Unknown
% @importance 0.75

0.90::acc(sMERCHANT, base_material).
0.78::acc(s50, base_material).

0.95::true_val(base_material, sintered_wfo); 0.05::true_val(base_material, unk_base_material).

measured(sMERCHANT, base_material, sintered_wfo).
measured(s50, base_material, sintered_wfo).

all_consistent(base_material) :-
    consistent(sMERCHANT, base_material),
    (indep(s48), consistent(s50, base_material) ; \+indep(s48)).

evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_wfo)).
query(true_val(base_material, unk_base_material)).

% @attr resin
% @type categorical
% @canonical false
% @original_name resin
% @values super_sap_epoxy=Super_Sap_Epoxy_bio_based_50pct_carbon_reduction unk_resin=Unknown
% @importance 0.55

0.90::acc(sMERCHANT, resin).
0.80::acc(s51, resin).

0.95::true_val(resin, super_sap_epoxy); 0.05::true_val(resin, unk_resin).

measured(sMERCHANT, resin, super_sap_epoxy).
measured(s51, resin, super_sap_epoxy).

all_consistent(resin) :-
    consistent(sMERCHANT, resin),
    consistent(s51, resin).

evidence(all_consistent(resin)).
query(true_val(resin, super_sap_epoxy)).
query(true_val(resin, unk_resin)).

% @attr break_in_technology
% @type categorical
% @canonical false
% @original_name break-in technology
% @values infinite_ride=Infinite_Ride_overbuilt_machine_broken_in unk_break_in_technology=Unknown
% @importance 0.65

0.78::acc(s43, break_in_technology).
0.78::acc(s52, break_in_technology).

0.88::true_val(break_in_technology, infinite_ride); 0.12::true_val(break_in_technology, unk_break_in_technology).

measured(s43, break_in_technology, infinite_ride).
measured(s52, break_in_technology, infinite_ride).

all_consistent(break_in_technology) :-
    (indep(s43), consistent(s43, break_in_technology) ; \+indep(s43)),
    (indep(s43), consistent(s52, break_in_technology) ; \+indep(s43)).

evidence(all_consistent(break_in_technology)).
query(true_val(break_in_technology, infinite_ride)).
query(true_val(break_in_technology, unk_break_in_technology)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values the_channel=The_Channel_Burton_adjustable_stance_all_bindings unk_mounting_pattern=Unknown
% @importance 0.85

0.92::acc(sMERCHANT, mounting_pattern).
0.87::acc(s53, mounting_pattern).

0.95::true_val(mounting_pattern, the_channel); 0.05::true_val(mounting_pattern, unk_mounting_pattern).

measured(sMERCHANT, mounting_pattern, the_channel).
measured(s53, mounting_pattern, the_channel).

all_consistent(mounting_pattern) :-
    consistent(sMERCHANT, mounting_pattern),
    (indep(s2), consistent(s53, mounting_pattern) ; \+indep(s2)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, the_channel)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr sustainability_certification_resin
% @type categorical
% @canonical false
% @original_name sustainability_certification (resin)
% @values super_sap_50pct=Super_Sap_Epoxy_50pct_carbon_reduction unk_sustainability_certification_resin=Unknown
% @importance 0.55

0.80::acc(s51, sustainability_certification_resin).

0.77::true_val(sustainability_certification_resin, super_sap_50pct); 0.23::true_val(sustainability_certification_resin, unk_sustainability_certification_resin).

measured(s51, sustainability_certification_resin, super_sap_50pct).

all_consistent(sustainability_certification_resin) :-
    consistent(s51, sustainability_certification_resin).

evidence(all_consistent(sustainability_certification_resin)).
query(true_val(sustainability_certification_resin, super_sap_50pct)).
query(true_val(sustainability_certification_resin, unk_sustainability_certification_resin)).

% @attr sustainability_certification_core
% @type categorical
% @canonical false
% @original_name sustainability_certification (FSC core)
% @values fsc_certified=FSC_Certified_wood_core unk_sustainability_certification_core=Unknown
% @importance 0.75

0.85::acc(s46, sustainability_certification_core).

0.82::true_val(sustainability_certification_core, fsc_certified); 0.18::true_val(sustainability_certification_core, unk_sustainability_certification_core).

measured(s46, sustainability_certification_core, fsc_certified).

all_consistent(sustainability_certification_core) :-
    (indep(s22), consistent(s46, sustainability_certification_core) ; \+indep(s22)).

evidence(all_consistent(sustainability_certification_core)).
query(true_val(sustainability_certification_core, fsc_certified)).
query(true_val(sustainability_certification_core, unk_sustainability_certification_core)).

% @attr sustainability_certification_materials
% @type categorical
% @canonical false
% @original_name sustainability_certification (eco-friendly materials)
% @values eco_friendly=Significant_steps_eco_friendly_materials unk_sustainability_certification_materials=Unknown
% @importance 0.70

0.82::acc(s54, sustainability_certification_materials).

0.78::true_val(sustainability_certification_materials, eco_friendly); 0.22::true_val(sustainability_certification_materials, unk_sustainability_certification_materials).

measured(s54, sustainability_certification_materials, eco_friendly).

all_consistent(sustainability_certification_materials) :-
    consistent(s54, sustainability_certification_materials).

evidence(all_consistent(sustainability_certification_materials)).
query(true_val(sustainability_certification_materials, eco_friendly)).
query(true_val(sustainability_certification_materials, unk_sustainability_certification_materials)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values sizes_140_to_160=140_144_148_152_156_160cm unk_available_sizes=Unknown
% @importance 0.85

0.92::acc(sMERCHANT, available_sizes).

0.92::true_val(available_sizes, sizes_140_to_160); 0.08::true_val(available_sizes, unk_available_sizes).

measured(sMERCHANT, available_sizes, sizes_140_to_160).

all_consistent(available_sizes) :-
    consistent(sMERCHANT, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, sizes_140_to_160)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr available_sizes_wide
% @type categorical
% @canonical false
% @original_name available_sizes (wide)
% @values sizes_152w_156w=152cm_Wide_156cm_Wide unk_available_sizes_wide=Unknown
% @importance 0.85

0.92::acc(sMERCHANT, available_sizes_wide).

0.92::true_val(available_sizes_wide, sizes_152w_156w); 0.08::true_val(available_sizes_wide, unk_available_sizes_wide).

measured(sMERCHANT, available_sizes_wide, sizes_152w_156w).

all_consistent(available_sizes_wide) :-
    consistent(sMERCHANT, available_sizes_wide).

evidence(all_consistent(available_sizes_wide)).
query(true_val(available_sizes_wide, sizes_152w_156w)).
query(true_val(available_sizes_wide, unk_available_sizes_wide)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 0.85

0.92::acc(sMERCHANT, width_options).

0.92::true_val(width_options, standard_wide); 0.08::true_val(width_options, unk_width_options).

measured(sMERCHANT, width_options, standard_wide).

all_consistent(width_options) :-
    consistent(sMERCHANT, width_options).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_wide)).
query(true_val(width_options, unk_width_options)).

% @attr waist_width_152
% @type numeric
% @canonical false
% @original_name waist width 152cm
% @unit mm
% @values v252=252.0 unk_waist_width_152=Unknown
% @importance 0.85

0.93::acc(sMERCHANT, waist_width_152).

0.93::true_val(waist_width_152, v252); 0.07::true_val(waist_width_152, unk_waist_width_152).

measured(sMERCHANT, waist_width_152, v252).

all_consistent(waist_width_152) :-
    consistent(sMERCHANT, waist_width_152).

evidence(all_consistent(waist_width_152)).
query(true_val(waist_width_152, v252)).
query(true_val(waist_width_152, unk_waist_width_152)).

% @attr waist_width_156
% @type numeric
% @canonical false
% @original_name waist width 156cm
% @unit mm
% @values v256=256.0 unk_waist_width_156=Unknown
% @importance 0.85

0.93::acc(sMERCHANT, waist_width_156).

0.93::true_val(waist_width_156, v256); 0.07::true_val(waist_width_156, unk_waist_width_156).

measured(sMERCHANT, waist_width_156, v256).

all_consistent(waist_width_156) :-
    consistent(sMERCHANT, waist_width_156).

evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v256)).
query(true_val(waist_width_156, unk_waist_width_156)).

% @attr waist_width_160
% @type numeric
% @canonical false
% @original_name waist width 160cm
% @unit mm
% @values v261=261.0 unk_waist_width_160=Unknown
% @importance 0.85

0.93::acc(sMERCHANT, waist_width_160).

0.93::true_val(waist_width_160, v261); 0.07::true_val(waist_width_160, unk_waist_width_160).

measured(sMERCHANT, waist_width_160, v261).

all_consistent(waist_width_160) :-
    consistent(sMERCHANT, waist_width_160).

evidence(all_consistent(waist_width_160)).
query(true_val(waist_width_160, v261)).
query(true_val(waist_width_160, unk_waist_width_160)).

% @attr waist_width_152w
% @type numeric
% @canonical false
% @original_name waist width 152W
% @unit mm
% @values v260=260.0 unk_waist_width_152w=Unknown
% @importance 0.85

0.93::acc(sMERCHANT, waist_width_152w).

0.93::true_val(waist_width_152w, v260); 0.07::true_val(waist_width_152w, unk_waist_width_152w).

measured(sMERCHANT, waist_width_152w, v260).

all_consistent(waist_width_152w) :-
    consistent(sMERCHANT, waist_width_152w).

evidence(all_consistent(waist_width_152w)).
query(true_val(waist_width_152w, v260)).
query(true_val(waist_width_152w, unk_waist_width_152w)).

% @attr waist_width_156w
% @type numeric
% @canonical false
% @original_name waist width 156W
% @unit mm
% @values v264=264.0 unk_waist_width_156w=Unknown
% @importance 0.85

0.93::acc(sMERCHANT, waist_width_156w).

0.93::true_val(waist_width_156w, v264); 0.07::true_val(waist_width_156w, unk_waist_width_156w).

measured(sMERCHANT, waist_width_156w, v264).

all_consistent(waist_width_156w) :-
    consistent(sMERCHANT, waist_width_156w).

evidence(all_consistent(waist_width_156w)).
query(true_val(waist_width_156w, v264)).
query(true_val(waist_width_156w, unk_waist_width_156w)).

% @attr effective_edge_152
% @type numeric
% @canonical false
% @original_name effective edge 152cm
% @unit mm
% @values v1151=1151.0 unk_effective_edge_152=Unknown
% @importance 0.85

0.93::acc(sMERCHANT, effective_edge_152).

0.93::true_val(effective_edge_152, v1151); 0.07::true_val(effective_edge_152, unk_effective_edge_152).

measured(sMERCHANT, effective_edge_152, v1151).

all_consistent(effective_edge_152) :-
    consistent(sMERCHANT, effective_edge_152).

evidence(all_consistent(effective_edge_152)).
query(true_val(effective_edge_152, v1151)).
query(true_val(effective_edge_152, unk_effective_edge_152)).

% @attr effective_edge_156
% @type numeric
% @canonical false
% @original_name effective edge 156cm
% @unit mm
% @values v1191=1191.0 unk_effective_edge_156=Unknown
% @importance 0.85

0.93::acc(sMERCHANT, effective_edge_156).

0.93::true_val(effective_edge_156, v1191); 0.07::true_val(effective_edge_156, unk_effective_edge_156).

measured(sMERCHANT, effective_edge_156, v1191).

all_consistent(effective_edge_156) :-
    consistent(sMERCHANT, effective_edge_156).

evidence(all_consistent(effective_edge_156)).
query(true_val(effective_edge_156, v1191)).
query(true_val(effective_edge_156, unk_effective_edge_156)).

% @attr effective_edge_160
% @type numeric
% @canonical false
% @original_name effective edge 160cm
% @unit mm
% @values v1231=1231.0 unk_effective_edge_160=Unknown
% @importance 0.85

0.93::acc(sMERCHANT, effective_edge_160).

0.93::true_val(effective_edge_160, v1231); 0.07::true_val(effective_edge_160, unk_effective_edge_160).

measured(sMERCHANT, effective_edge_160, v1231).

all_consistent(effective_edge_160) :-
    consistent(sMERCHANT, effective_edge_160).

evidence(all_consistent(effective_edge_160)).
query(true_val(effective_edge_160, v1231)).
query(true_val(effective_edge_160, unk_effective_edge_160)).

% @attr sidecut_radius_size_152
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (152cm)
% @unit m
% @values v7_0=7.0 unk_sidecut_radius_size_152=Unknown
% @importance 0.85

0.93::acc(sMERCHANT, sidecut_radius_size_152).

0.93::true_val(sidecut_radius_size_152, v7_0); 0.07::true_val(sidecut_radius_size_152, unk_sidecut_radius_size_152).

measured(sMERCHANT, sidecut_radius_size_152, v7_0).

all_consistent(sidecut_radius_size_152) :-
    consistent(sMERCHANT, sidecut_radius_size_152).

evidence(all_consistent(sidecut_radius_size_152)).
query(true_val(sidecut_radius_size_152, v7_0)).
query(true_val(sidecut_radius_size_152, unk_sidecut_radius_size_152)).

% @attr sidecut_radius_size
% @type numeric
% @canonical true
% @original_name sidecut_radius_size
% @unit m
% @values v7_2=7.2 unk_sidecut_radius_size=Unknown
% @importance 0.85

0.93::acc(sMERCHANT, sidecut_radius_size).

0.93::true_val(sidecut_radius_size, v7_2); 0.07::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(sMERCHANT, sidecut_radius_size, v7_2).

all_consistent(sidecut_radius_size) :-
    consistent(sMERCHANT, sidecut_radius_size).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_2)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr sidecut_radius_size_160
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (160cm)
% @unit m
% @values v7_5=7.5 unk_sidecut_radius_size_160=Unknown
% @importance 0.85

0.93::acc(sMERCHANT, sidecut_radius_size_160).

0.93::true_val(sidecut_radius_size_160, v7_5); 0.07::true_val(sidecut_radius_size_160, unk_sidecut_radius_size_160).

measured(sMERCHANT, sidecut_radius_size_160, v7_5).

all_consistent(sidecut_radius_size_160) :-
    consistent(sMERCHANT, sidecut_radius_size_160).

evidence(all_consistent(sidecut_radius_size_160)).
query(true_val(sidecut_radius_size_160, v7_5)).
query(true_val(sidecut_radius_size_160, unk_sidecut_radius_size_160)).

% @attr setback
% @type numeric
% @canonical true
% @original_name setback
% @unit mm
% @values v_neg50=neg50 v25=25.0
% @importance 0.875

0.85::acc(sMERCHANT, setback).
0.88::acc(s25, setback).

0.45::true_val(setback, v_neg50); 0.55::true_val(setback, v25).

measured(sMERCHANT, setback, v_neg50).
measured(s25, setback, v25).

all_consistent(setback) :-
    consistent(sMERCHANT, setback),
    consistent(s25, setback).

evidence(all_consistent(setback)).
query(true_val(setback, v_neg50)).
query(true_val(setback, v25)).

% @attr recommended_weight_range_size_152
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (152cm)
% @values wt_54_82kg=54_to_82kg_120_to_180lbs unk_recommended_weight_range_size_152=Unknown
% @importance 0.85

0.93::acc(sMERCHANT, recommended_weight_range_size_152).

0.93::true_val(recommended_weight_range_size_152, wt_54_82kg); 0.07::true_val(recommended_weight_range_size_152, unk_recommended_weight_range_size_152).

measured(sMERCHANT, recommended_weight_range_size_152, wt_54_82kg).

all_consistent(recommended_weight_range_size_152) :-
    consistent(sMERCHANT, recommended_weight_range_size_152).

evidence(all_consistent(recommended_weight_range_size_152)).
query(true_val(recommended_weight_range_size_152, wt_54_82kg)).
query(true_val(recommended_weight_range_size_152, unk_recommended_weight_range_size_152)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size
% @values wt_68_91kg=68_to_91kg_150_to_200lbs unk_recommended_weight_range_size=Unknown
% @importance 0.85

0.93::acc(sMERCHANT, recommended_weight_range_size).

0.93::true_val(recommended_weight_range_size, wt_68_91kg); 0.07::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(sMERCHANT, recommended_weight_range_size, wt_68_91kg).

all_consistent(recommended_weight_range_size) :-
    consistent(sMERCHANT, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, wt_68_91kg)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr recommended_weight_range_size_160
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (160cm)
% @values wt_82_118kg=82_to_118plus_kg_180_to_260plus_lbs unk_recommended_weight_range_size_160=Unknown
% @importance 0.85

0.93::acc(sMERCHANT, recommended_weight_range_size_160).

0.93::true_val(recommended_weight_range_size_160, wt_82_118kg); 0.07::true_val(recommended_weight_range_size_160, unk_recommended_weight_range_size_160).

measured(sMERCHANT, recommended_weight_range_size_160, wt_82_118kg).

all_consistent(recommended_weight_range_size_160) :-
    consistent(sMERCHANT, recommended_weight_range_size_160).

evidence(all_consistent(recommended_weight_range_size_160)).
query(true_val(recommended_weight_range_size_160, wt_82_118kg)).
query(true_val(recommended_weight_range_size_160, unk_recommended_weight_range_size_160)).

% @attr board_weight_grams
% @type numeric
% @canonical true
% @original_name board_weight_grams
% @unit g
% @values v2660=2660.0 unk_board_weight_grams=Unknown
% @importance 0.90

0.92::acc(s25, board_weight_grams).

0.86::true_val(board_weight_grams, v2660); 0.14::true_val(board_weight_grams, unk_board_weight_grams).

measured(s25, board_weight_grams, v2660).

all_consistent(board_weight_grams) :-
    consistent(s25, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v2660)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr weight_per_cm
% @type numeric
% @canonical true
% @original_name weight_per_cm
% @unit g/cm
% @values v17_05=17.05 unk_weight_per_cm=Unknown
% @importance 0.90

0.90::acc(s25, weight_per_cm).

0.86::true_val(weight_per_cm, v17_05); 0.14::true_val(weight_per_cm, unk_weight_per_cm).

measured(s25, weight_per_cm, v17_05).

all_consistent(weight_per_cm) :-
    consistent(s25, weight_per_cm).

evidence(all_consistent(weight_per_cm)).
query(true_val(weight_per_cm, v17_05)).
query(true_val(weight_per_cm, unk_weight_per_cm)).

% @attr weight_per_cm_category_avg
% @type numeric
% @canonical false
% @original_name weight_per_cm (category average)
% @unit g/cm
% @values v18_58=18.58 unk_weight_per_cm_category_avg=Unknown
% @importance 0.90

0.88::acc(s25, weight_per_cm_category_avg).

0.83::true_val(weight_per_cm_category_avg, v18_58); 0.17::true_val(weight_per_cm_category_avg, unk_weight_per_cm_category_avg).

measured(s25, weight_per_cm_category_avg, v18_58).

all_consistent(weight_per_cm_category_avg) :-
    consistent(s25, weight_per_cm_category_avg).

evidence(all_consistent(weight_per_cm_category_avg)).
query(true_val(weight_per_cm_category_avg, v18_58)).
query(true_val(weight_per_cm_category_avg, unk_weight_per_cm_category_avg)).

% @attr weight_subjective_feel
% @type categorical
% @canonical false
% @original_name weight subjective feel
% @values felt_light=Felt_Light unk_weight_subjective_feel=Unknown
% @importance 0.90

0.85::acc(s25, weight_subjective_feel).

0.81::true_val(weight_subjective_feel, felt_light); 0.19::true_val(weight_subjective_feel, unk_weight_subjective_feel).

measured(s25, weight_subjective_feel, felt_light).

all_consistent(weight_subjective_feel) :-
    consistent(s25, weight_subjective_feel).

evidence(all_consistent(weight_subjective_feel)).
query(true_val(weight_subjective_feel, felt_light)).
query(true_val(weight_subjective_feel, unk_weight_subjective_feel)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values three_year=3_year_manufacturer_warranty_Channel_boards unk_warranty=Unknown
% @importance 0.85

0.88::acc(s55, warranty).

0.88::true_val(warranty, three_year); 0.12::true_val(warranty, unk_warranty).

measured(s55, warranty, three_year).

all_consistent(warranty) :-
    (indep(s22), consistent(s55, warranty) ; \+indep(s22)).

evidence(all_consistent(warranty)).
query(true_val(warranty, three_year)).
query(true_val(warranty, unk_warranty)).

% @attr overall_rating_snowboardingprofiles
% @type numeric
% @canonical true
% @original_name overall_rating_snowboardingprofiles
% @unit /100
% @values v88_3=88.3 unk_overall_rating_snowboardingprofiles=Unknown
% @importance 0.90

0.90::acc(s25, overall_rating_snowboardingprofiles).

0.86::true_val(overall_rating_snowboardingprofiles, v88_3); 0.14::true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles).

measured(s25, overall_rating_snowboardingprofiles, v88_3).

all_consistent(overall_rating_snowboardingprofiles) :-
    consistent(s25, overall_rating_snowboardingprofiles).

evidence(all_consistent(overall_rating_snowboardingprofiles)).
query(true_val(overall_rating_snowboardingprofiles, v88_3)).
query(true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles)).

% @attr ranking_in_category
% @type categorical
% @canonical false
% @original_name ranking in category (SnowboardingProfiles)
% @values seventh_of_28=7th_out_of_28_mellow_freeride unk_ranking_in_category=Unknown
% @importance 0.90

0.88::acc(s25, ranking_in_category).

0.83::true_val(ranking_in_category, seventh_of_28); 0.17::true_val(ranking_in_category, unk_ranking_in_category).

measured(s25, ranking_in_category, seventh_of_28).

all_consistent(ranking_in_category) :-
    consistent(s25, ranking_in_category).

evidence(all_consistent(ranking_in_category)).
query(true_val(ranking_in_category, seventh_of_28)).
query(true_val(ranking_in_category, unk_ranking_in_category)).

% @attr average_score_in_category
% @type numeric
% @canonical false
% @original_name average score in category
% @unit /100
% @values v85_7=85.7 unk_average_score_in_category=Unknown
% @importance 0.90

0.88::acc(s25, average_score_in_category).

0.83::true_val(average_score_in_category, v85_7); 0.17::true_val(average_score_in_category, unk_average_score_in_category).

measured(s25, average_score_in_category, v85_7).

all_consistent(average_score_in_category) :-
    consistent(s25, average_score_in_category).

evidence(all_consistent(average_score_in_category)).
query(true_val(average_score_in_category, v85_7)).
query(true_val(average_score_in_category, unk_average_score_in_category)).

% @attr highest_score_in_category
% @type numeric
% @canonical false
% @original_name highest score in category
% @unit /100
% @values v92_8=92.8 unk_highest_score_in_category=Unknown
% @importance 0.90

0.88::acc(s25, highest_score_in_category).

0.83::true_val(highest_score_in_category, v92_8); 0.17::true_val(highest_score_in_category, unk_highest_score_in_category).

measured(s25, highest_score_in_category, v92_8).

all_consistent(highest_score_in_category) :-
    consistent(s25, highest_score_in_category).

evidence(all_consistent(highest_score_in_category)).
query(true_val(highest_score_in_category, v92_8)).
query(true_val(highest_score_in_category, unk_highest_score_in_category)).

% @attr review_rating_rei
% @type numeric
% @canonical false
% @original_name review rating (REI, user reviews)
% @unit /5
% @values v5_0=5.0 unk_review_rating_rei=Unknown
% @importance 0.95

0.82::acc(s22, review_rating_rei).

0.78::true_val(review_rating_rei, v5_0); 0.22::true_val(review_rating_rei, unk_review_rating_rei).

measured(s22, review_rating_rei, v5_0).

all_consistent(review_rating_rei) :-
    (indep(s22), consistent(s22, review_rating_rei) ; \+indep(s22)).

evidence(all_consistent(review_rating_rei)).
query(true_val(review_rating_rei, v5_0)).
query(true_val(review_rating_rei, unk_review_rating_rei)).

% @attr evo_field_tested_summary
% @type categorical
% @canonical false
% @original_name evo Field Tested review summary (2025 model)
% @values favorite_versatile=Became_tester_favorite_versatile_all_around unk_evo_field_tested_summary=Unknown
% @importance 0.85

0.85::acc(s56, evo_field_tested_summary).

0.82::true_val(evo_field_tested_summary, favorite_versatile); 0.18::true_val(evo_field_tested_summary, unk_evo_field_tested_summary).

measured(s56, evo_field_tested_summary, favorite_versatile).

all_consistent(evo_field_tested_summary) :-
    consistent(s56, evo_field_tested_summary).

evidence(all_consistent(evo_field_tested_summary)).
query(true_val(evo_field_tested_summary, favorite_versatile)).
query(true_val(evo_field_tested_summary, unk_evo_field_tested_summary)).

% @attr ease_of_use
% @type categorical
% @canonical false
% @original_name ease of use
% @values impressed_first_turn=Impressed_from_first_turn_no_adapting unk_ease_of_use=Unknown
% @importance 0.85

0.85::acc(s56, ease_of_use).

0.82::true_val(ease_of_use, impressed_first_turn); 0.18::true_val(ease_of_use, unk_ease_of_use).

measured(s56, ease_of_use, impressed_first_turn).

all_consistent(ease_of_use) :-
    consistent(s56, ease_of_use).

evidence(all_consistent(ease_of_use)).
query(true_val(ease_of_use, impressed_first_turn)).
query(true_val(ease_of_use, unk_ease_of_use)).

% @attr versatility
% @type categorical
% @canonical false
% @original_name versatility
% @values excels_groomers_powder=Excels_across_conditions_stable_groomers_powder unk_versatility=Unknown
% @importance 0.85

0.85::acc(s57, versatility).

0.82::true_val(versatility, excels_groomers_powder); 0.18::true_val(versatility, unk_versatility).

measured(s57, versatility, excels_groomers_powder).

all_consistent(versatility) :-
    consistent(s57, versatility).

evidence(all_consistent(versatility)).
query(true_val(versatility, excels_groomers_powder)).
query(true_val(versatility, unk_versatility)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values easy_improved=Really_easy_to_turn_slash_improved_over_2025_quick_edge_to_edge unk_turn_initiation_performance=Unknown
% @importance 0.85

0.88::acc(s34, turn_initiation_performance).

0.83::true_val(turn_initiation_performance, easy_improved); 0.17::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s34, turn_initiation_performance, easy_improved).

all_consistent(turn_initiation_performance) :-
    consistent(s34, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, easy_improved)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr catchiness
% @type categorical
% @canonical false
% @original_name catchiness (2026)
% @values very_minimal=Very_minimal_less_catchy_than_2025 unk_catchiness=Unknown
% @importance 0.85

0.88::acc(s34, catchiness).

0.83::true_val(catchiness, very_minimal); 0.17::true_val(catchiness, unk_catchiness).

measured(s34, catchiness, very_minimal).

all_consistent(catchiness) :-
    consistent(s34, catchiness).

evidence(all_consistent(catchiness)).
query(true_val(catchiness, very_minimal)).
query(true_val(catchiness, unk_catchiness)).

% @attr trees_bumps_performance
% @type categorical
% @canonical false
% @original_name trees/bumps (2026)
% @values noticeable_improvement=Noticeable_improvement_weaving_trees_bumps unk_trees_bumps_performance=Unknown
% @importance 0.85

0.88::acc(s34, trees_bumps_performance).

0.83::true_val(trees_bumps_performance, noticeable_improvement); 0.17::true_val(trees_bumps_performance, unk_trees_bumps_performance).

measured(s34, trees_bumps_performance, noticeable_improvement).

all_consistent(trees_bumps_performance) :-
    consistent(s34, trees_bumps_performance).

evidence(all_consistent(trees_bumps_performance)).
query(true_val(trees_bumps_performance, noticeable_improvement)).
query(true_val(trees_bumps_performance, unk_trees_bumps_performance)).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name reviewer_opinion_snowboardingprofiles
% @values handles_powder_well=Should_handle_powder_deep_powder_very_well unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.90

0.85::acc(s25, reviewer_opinion_snowboardingprofiles).

0.81::true_val(reviewer_opinion_snowboardingprofiles, handles_powder_well); 0.19::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).

measured(s25, reviewer_opinion_snowboardingprofiles, handles_powder_well).

all_consistent(reviewer_opinion_snowboardingprofiles) :-
    consistent(s25, reviewer_opinion_snowboardingprofiles).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, handles_powder_well)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

% @attr surfy_feel
% @type categorical
% @canonical false
% @original_name surfy feel
% @values surfy_on_snow=Delivers_surfy_on_snow_feel unk_surfy_feel=Unknown
% @importance 0.75

0.85::acc(s58, surfy_feel).

0.82::true_val(surfy_feel, surfy_on_snow); 0.18::true_val(surfy_feel, unk_surfy_feel).

measured(s58, surfy_feel, surfy_on_snow).

all_consistent(surfy_feel) :-
    consistent(s58, surfy_feel).

evidence(all_consistent(surfy_feel)).
query(true_val(surfy_feel, surfy_on_snow)).
query(true_val(surfy_feel, unk_surfy_feel)).

% @attr nimbleness
% @type categorical
% @canonical false
% @original_name nimbleness
% @values super_nimble=Super_nimble_super_surfy_easy_to_throw_around unk_nimbleness=Unknown
% @importance 0.70

0.78::acc(s59, nimbleness).

0.72::true_val(nimbleness, super_nimble); 0.28::true_val(nimbleness, unk_nimbleness).

measured(s59, nimbleness, super_nimble).

all_consistent(nimbleness) :-
    consistent(s59, nimbleness).

evidence(all_consistent(nimbleness)).
query(true_val(nimbleness, super_nimble)).
query(true_val(nimbleness, unk_nimbleness)).

% @attr pop
% @type categorical
% @canonical false
% @original_name pop
% @values pretty_easy_good=Pretty_easy_pop_good_not_epic_easy_ollie unk_pop=Unknown
% @importance 0.90

0.85::acc(s25, pop).

0.81::true_val(pop, pretty_easy_good); 0.19::true_val(pop, unk_pop).

measured(s25, pop, pretty_easy_good).

all_consistent(pop) :-
    consistent(s25, pop).

evidence(all_consistent(pop)).
query(true_val(pop, pretty_easy_good)).
query(true_val(pop, unk_pop)).

% @attr carving_rating_tgr
% @type categorical
% @canonical true
% @original_name carving_rating_tgr
% @values good_as_2025_moderate=Just_as_good_as_2025_slower_moderate_carves unk_carving_rating_tgr=Unknown
% @importance 0.85

0.88::acc(s34, carving_rating_tgr).

0.83::true_val(carving_rating_tgr, good_as_2025_moderate); 0.17::true_val(carving_rating_tgr, unk_carving_rating_tgr).

measured(s34, carving_rating_tgr, good_as_2025_moderate).

all_consistent(carving_rating_tgr) :-
    consistent(s34, carving_rating_tgr).

evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, good_as_2025_moderate)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

% @attr all_day_ride
% @type categorical
% @canonical false
% @original_name all-day ride
% @values manageable_not_chattery=Manageable_all_day_not_ultra_chattery unk_all_day_ride=Unknown
% @importance 0.75

0.85::acc(s44, all_day_ride).

0.82::true_val(all_day_ride, manageable_not_chattery); 0.18::true_val(all_day_ride, unk_all_day_ride).

measured(s44, all_day_ride, manageable_not_chattery).

all_consistent(all_day_ride) :-
    consistent(s44, all_day_ride).

evidence(all_consistent(all_day_ride)).
query(true_val(all_day_ride, manageable_not_chattery)).
query(true_val(all_day_ride, unk_all_day_ride)).

% @attr spins
% @type categorical
% @canonical false
% @original_name spins
% @values easy_rotation=Really_easy_rotation_light_low_catch_risk unk_spins=Unknown
% @importance 0.90

0.85::acc(s25, spins).

0.81::true_val(spins, easy_rotation); 0.19::true_val(spins, unk_spins).

measured(s25, spins, easy_rotation).

all_consistent(spins) :-
    consistent(s25, spins).

evidence(all_consistent(spins)).
query(true_val(spins, easy_rotation)).
query(true_val(spins, unk_spins)).

% @attr user_friendliness
% @type categorical
% @canonical false
% @original_name user-friendliness
% @values approachable_intermediate=Approachable_for_intermediate_progressing_advanced unk_user_friendliness=Unknown
% @importance 0.85

0.85::acc(s57, user_friendliness).

0.82::true_val(user_friendliness, approachable_intermediate); 0.18::true_val(user_friendliness, unk_user_friendliness).

measured(s57, user_friendliness, approachable_intermediate).

all_consistent(user_friendliness) :-
    consistent(s57, user_friendliness).

evidence(all_consistent(user_friendliness)).
query(true_val(user_friendliness, approachable_intermediate)).
query(true_val(user_friendliness, unk_user_friendliness)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values tail_wash_poor_hard_snow=Tail_washes_at_speed_edge_lets_go_hard_snow unk_edge_hold=Unknown
% @importance 0.875

0.88::acc(s60, edge_hold).
0.88::acc(s61, edge_hold).
0.90::acc(s62, edge_hold).

0.95::true_val(edge_hold, tail_wash_poor_hard_snow); 0.05::true_val(edge_hold, unk_edge_hold).

measured(s60, edge_hold, tail_wash_poor_hard_snow).
measured(s61, edge_hold, tail_wash_poor_hard_snow).
measured(s62, edge_hold, tail_wash_poor_hard_snow).

all_consistent(edge_hold) :-
    consistent(s60, edge_hold),
    consistent(s61, edge_hold),
    consistent(s62, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, tail_wash_poor_hard_snow)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr negative_aspect_speed_stability
% @type categorical
% @canonical false
% @original_name negative_aspect (speed stability)
% @values unstable_earlier_than_2025=Gets_unstable_at_speed_earlier_than_2025 unk_negative_aspect_speed_stability=Unknown
% @importance 0.85

0.88::acc(s34, negative_aspect_speed_stability).

0.83::true_val(negative_aspect_speed_stability, unstable_earlier_than_2025); 0.17::true_val(negative_aspect_speed_stability, unk_negative_aspect_speed_stability).

measured(s34, negative_aspect_speed_stability, unstable_earlier_than_2025).

all_consistent(negative_aspect_speed_stability) :-
    consistent(s34, negative_aspect_speed_stability).

evidence(all_consistent(negative_aspect_speed_stability)).
query(true_val(negative_aspect_speed_stability, unstable_earlier_than_2025)).
query(true_val(negative_aspect_speed_stability, unk_negative_aspect_speed_stability)).

% @attr chatter_performance
% @type categorical
% @canonical true
% @original_name chatter_performance
% @values worse_than_predecessor=Not_as_good_as_predecessor_more_chatter unk_chatter_performance=Unknown
% @importance 0.85

0.88::acc(s34, chatter_performance).

0.83::true_val(chatter_performance, worse_than_predecessor); 0.17::true_val(chatter_performance, unk_chatter_performance).

measured(s34, chatter_performance, worse_than_predecessor).

all_consistent(chatter_performance) :-
    consistent(s34, chatter_performance).

evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, worse_than_predecessor)).
query(true_val(chatter_performance, unk_chatter_performance)).

% @attr negative_aspect_pop_limitations
% @type categorical
% @canonical false
% @original_name negative_aspect (pop limitations)
% @values pop_not_for_big_park=Pop_not_there_for_big_park_laps_or_big_drops unk_negative_aspect_pop_limitations=Unknown
% @importance 0.80

0.85::acc(s63, negative_aspect_pop_limitations).

0.82::true_val(negative_aspect_pop_limitations, pop_not_for_big_park); 0.18::true_val(negative_aspect_pop_limitations, unk_negative_aspect_pop_limitations).

measured(s63, negative_aspect_pop_limitations, pop_not_for_big_park).

all_consistent(negative_aspect_pop_limitations) :-
    consistent(s63, negative_aspect_pop_limitations).

evidence(all_consistent(negative_aspect_pop_limitations)).
query(true_val(negative_aspect_pop_limitations, pop_not_for_big_park)).
query(true_val(negative_aspect_pop_limitations, unk_negative_aspect_pop_limitations)).

% @attr switch_riding
% @type categorical
% @canonical false
% @original_name switch_riding
% @values not_ideal=Not_ideal_for_switch_or_park_directional_shape unk_switch_riding=Unknown
% @importance 0.75

0.85::acc(s64, switch_riding).

0.82::true_val(switch_riding, not_ideal); 0.18::true_val(switch_riding, unk_switch_riding).

measured(s64, switch_riding, not_ideal).

all_consistent(switch_riding) :-
    consistent(s64, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, not_ideal)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr negative_aspect_uneven_terrain
% @type categorical
% @canonical false
% @original_name negative_aspect (uneven terrain)
% @values challenging_tracked=Challenging_on_uneven_tracked_snow_gets_bucky unk_negative_aspect_uneven_terrain=Unknown
% @importance 0.80

0.88::acc(s65, negative_aspect_uneven_terrain).

0.83::true_val(negative_aspect_uneven_terrain, challenging_tracked); 0.17::true_val(negative_aspect_uneven_terrain, unk_negative_aspect_uneven_terrain).

measured(s65, negative_aspect_uneven_terrain, challenging_tracked).

all_consistent(negative_aspect_uneven_terrain) :-
    consistent(s65, negative_aspect_uneven_terrain).

evidence(all_consistent(negative_aspect_uneven_terrain)).
query(true_val(negative_aspect_uneven_terrain, challenging_tracked)).
query(true_val(negative_aspect_uneven_terrain, unk_negative_aspect_uneven_terrain)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values needs_wax_middle_tier=Needs_frequent_waxing_second_highest_feels_middle_tier unk_base_glide_performance=Unknown
% @importance 0.70

0.85::acc(s54, base_glide_performance).
0.85::acc(s66, base_glide_performance).

0.90::true_val(base_glide_performance, needs_wax_middle_tier); 0.10::true_val(base_glide_performance, unk_base_glide_performance).

measured(s54, base_glide_performance, needs_wax_middle_tier).
measured(s66, base_glide_performance, needs_wax_middle_tier).

all_consistent(base_glide_performance) :-
    consistent(s54, base_glide_performance),
    consistent(s66, base_glide_performance).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, needs_wax_middle_tier)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values not_damp_downforce_issues=Not_as_damp_lightweight_trouble_downforce_high_speed unk_negative_aspect=Unknown
% @importance 0.825

0.85::acc(s25, negative_aspect).
0.85::acc(s44, negative_aspect).

0.90::true_val(negative_aspect, not_damp_downforce_issues); 0.10::true_val(negative_aspect, unk_negative_aspect).

measured(s25, negative_aspect, not_damp_downforce_issues).
measured(s44, negative_aspect, not_damp_downforce_issues).

all_consistent(negative_aspect) :-
    consistent(s25, negative_aspect),
    consistent(s44, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, not_damp_downforce_issues)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_tail_heavy
% @type categorical
% @canonical false
% @original_name negative_aspect (tail heavy landing)
% @values hard_control_tail_heavy=Hard_to_control_landing_tail_heavy_short_tail unk_negative_aspect_tail_heavy=Unknown
% @importance 0.90

0.85::acc(s25, negative_aspect_tail_heavy).

0.81::true_val(negative_aspect_tail_heavy, hard_control_tail_heavy); 0.19::true_val(negative_aspect_tail_heavy, unk_negative_aspect_tail_heavy).

measured(s25, negative_aspect_tail_heavy, hard_control_tail_heavy).

all_consistent(negative_aspect_tail_heavy) :-
    consistent(s25, negative_aspect_tail_heavy).

evidence(all_consistent(negative_aspect_tail_heavy)).
query(true_val(negative_aspect_tail_heavy, hard_control_tail_heavy)).
query(true_val(negative_aspect_tail_heavy, unk_negative_aspect_tail_heavy)).

% @attr tradeoff_2026_vs_2025
% @type categorical
% @canonical false
% @original_name 2026 vs 2025 trade-off
% @values gained_agility_lost_speed=Gained_agility_ease_sacrificed_high_speed_dampness unk_tradeoff_2026_vs_2025=Unknown
% @importance 0.85

0.88::acc(s34, tradeoff_2026_vs_2025).

0.83::true_val(tradeoff_2026_vs_2025, gained_agility_lost_speed); 0.17::true_val(tradeoff_2026_vs_2025, unk_tradeoff_2026_vs_2025).

measured(s34, tradeoff_2026_vs_2025, gained_agility_lost_speed).

all_consistent(tradeoff_2026_vs_2025) :-
    consistent(s34, tradeoff_2026_vs_2025).

evidence(all_consistent(tradeoff_2026_vs_2025)).
query(true_val(tradeoff_2026_vs_2025, gained_agility_lost_speed)).
query(true_val(tradeoff_2026_vs_2025, unk_tradeoff_2026_vs_2025)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values hometown_hero=Hometown_Hero_stiffer_7_10_twin_flex_12mm_taper unk_comparable_board_same_brand=Unknown
% @importance 0.70

0.90::acc(s67, comparable_board_same_brand).

0.85::true_val(comparable_board_same_brand, hometown_hero); 0.15::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s67, comparable_board_same_brand, hometown_hero).

all_consistent(comparable_board_same_brand) :-
    consistent(s67, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, hometown_hero)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_gril_master
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Gril Master)
% @values gril_master=Gril_Master_2026_Alekesam_feels_like_2025_Gril_Master unk_comparable_board_same_brand_gril_master=Unknown
% @importance 0.85

0.88::acc(s34, comparable_board_same_brand_gril_master).

0.83::true_val(comparable_board_same_brand_gril_master, gril_master); 0.17::true_val(comparable_board_same_brand_gril_master, unk_comparable_board_same_brand_gril_master).

measured(s34, comparable_board_same_brand_gril_master, gril_master).

all_consistent(comparable_board_same_brand_gril_master) :-
    consistent(s34, comparable_board_same_brand_gril_master).

evidence(all_consistent(comparable_board_same_brand_gril_master)).
query(true_val(comparable_board_same_brand_gril_master, gril_master)).
query(true_val(comparable_board_same_brand_gril_master, unk_comparable_board_same_brand_gril_master)).

% @attr comparable_board_same_brand_counterbalance
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Counterbalance)
% @values counterbalance=Counterbalance_more_stability unk_comparable_board_same_brand_counterbalance=Unknown
% @importance 0.60

0.80::acc(s68, comparable_board_same_brand_counterbalance).

0.74::true_val(comparable_board_same_brand_counterbalance, counterbalance); 0.26::true_val(comparable_board_same_brand_counterbalance, unk_comparable_board_same_brand_counterbalance).

measured(s68, comparable_board_same_brand_counterbalance, counterbalance).

all_consistent(comparable_board_same_brand_counterbalance) :-
    consistent(s68, comparable_board_same_brand_counterbalance).

evidence(all_consistent(comparable_board_same_brand_counterbalance)).
query(true_val(comparable_board_same_brand_counterbalance, counterbalance)).
query(true_val(comparable_board_same_brand_counterbalance, unk_comparable_board_same_brand_counterbalance)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values lib_tech_orca=Lib_Tech_Orca_more_nose_rocker_better_powder_float unk_comparable_board_cross_brand=Unknown
% @importance 0.70

0.80::acc(s69, comparable_board_cross_brand).

0.74::true_val(comparable_board_cross_brand, lib_tech_orca); 0.26::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s69, comparable_board_cross_brand, lib_tech_orca).

all_consistent(comparable_board_cross_brand) :-
    consistent(s69, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, lib_tech_orca)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_jones_flagship
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Jones Flagship)
% @values jones_flagship=Jones_Flagship_freeride_directional_3D_base unk_comparable_board_cross_brand_jones_flagship=Unknown
% @importance 0.70

0.80::acc(s70, comparable_board_cross_brand_jones_flagship).

0.74::true_val(comparable_board_cross_brand_jones_flagship, jones_flagship); 0.26::true_val(comparable_board_cross_brand_jones_flagship, unk_comparable_board_cross_brand_jones_flagship).

measured(s70, comparable_board_cross_brand_jones_flagship, jones_flagship).

all_consistent(comparable_board_cross_brand_jones_flagship) :-
    consistent(s70, comparable_board_cross_brand_jones_flagship).

evidence(all_consistent(comparable_board_cross_brand_jones_flagship)).
query(true_val(comparable_board_cross_brand_jones_flagship, jones_flagship)).
query(true_val(comparable_board_cross_brand_jones_flagship, unk_comparable_board_cross_brand_jones_flagship)).

% @attr comparable_board_cross_brand_jones_stratos
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Jones Stratos)
% @values jones_stratos=Jones_Stratos_big_mountain_charger_powder unk_comparable_board_cross_brand_jones_stratos=Unknown
% @importance 0.65

0.78::acc(s71, comparable_board_cross_brand_jones_stratos).

0.72::true_val(comparable_board_cross_brand_jones_stratos, jones_stratos); 0.28::true_val(comparable_board_cross_brand_jones_stratos, unk_comparable_board_cross_brand_jones_stratos).

measured(s71, comparable_board_cross_brand_jones_stratos, jones_stratos).

all_consistent(comparable_board_cross_brand_jones_stratos) :-
    consistent(s71, comparable_board_cross_brand_jones_stratos).

evidence(all_consistent(comparable_board_cross_brand_jones_stratos)).
query(true_val(comparable_board_cross_brand_jones_stratos, jones_stratos)).
query(true_val(comparable_board_cross_brand_jones_stratos, unk_comparable_board_cross_brand_jones_stratos)).

% @attr comparable_board_cross_brand_category_count
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (category count)
% @values n28_tested=28_current_models_tested_by_SnowboardingProfiles unk_comparable_board_cross_brand_category_count=Unknown
% @importance 0.90

0.85::acc(s25, comparable_board_cross_brand_category_count).

0.81::true_val(comparable_board_cross_brand_category_count, n28_tested); 0.19::true_val(comparable_board_cross_brand_category_count, unk_comparable_board_cross_brand_category_count).

measured(s25, comparable_board_cross_brand_category_count, n28_tested).

all_consistent(comparable_board_cross_brand_category_count) :-
    consistent(s25, comparable_board_cross_brand_category_count).

evidence(all_consistent(comparable_board_cross_brand_category_count)).
query(true_val(comparable_board_cross_brand_category_count, n28_tested)).
query(true_val(comparable_board_cross_brand_category_count, unk_comparable_board_cross_brand_category_count)).

% @attr ideal_boot_sizes
% @type categorical
% @canonical false
% @original_name ideal boot sizes (The Good Ride)
% @values size_chart_us=144cm_US6_7_148cm_US7_8_152cm_US8_9_156cm_US9_10_160cm_US10_11_152W_US10_11_156W_US11_12 unk_ideal_boot_sizes=Unknown
% @importance 0.80

0.85::acc(s72, ideal_boot_sizes).

0.82::true_val(ideal_boot_sizes, size_chart_us); 0.18::true_val(ideal_boot_sizes, unk_ideal_boot_sizes).

measured(s72, ideal_boot_sizes, size_chart_us).

all_consistent(ideal_boot_sizes) :-
    consistent(s72, ideal_boot_sizes).

evidence(all_consistent(ideal_boot_sizes)).
query(true_val(ideal_boot_sizes, size_chart_us)).
query(true_val(ideal_boot_sizes, unk_ideal_boot_sizes)).

% @attr width_note_women
% @type categorical
% @canonical false
% @original_name width note for women
% @values w8_ideal_smaller_may_wide=144cm_246mm_ideal_W8_smaller_boots_too_wide unk_width_note_women=Unknown
% @importance 0.75

0.85::acc(s73, width_note_women).

0.82::true_val(width_note_women, w8_ideal_smaller_may_wide); 0.18::true_val(width_note_women, unk_width_note_women).

measured(s73, width_note_women, w8_ideal_smaller_may_wide).

all_consistent(width_note_women) :-
    consistent(s73, width_note_women).

evidence(all_consistent(width_note_women)).
query(true_val(width_note_women, w8_ideal_smaller_may_wide)).
query(true_val(width_note_women, unk_width_note_women)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values fit_boot_first_liberal_sizing=Fit_boot_first_weight_second_Burton_sizing_very_liberal unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.80

0.85::acc(s72, reviewer_opinion_the_good_ride).

0.82::true_val(reviewer_opinion_the_good_ride, fit_boot_first_liberal_sizing); 0.18::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s72, reviewer_opinion_the_good_ride, fit_boot_first_liberal_sizing).

all_consistent(reviewer_opinion_the_good_ride) :-
    consistent(s72, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, fit_boot_first_liberal_sizing)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr retailer_burton_com
% @type categorical
% @canonical false
% @original_name Burton.com
% @values official_manufacturer=Official_manufacturer_store_highest_authority_warranty unk_retailer_burton_com=Unknown
% @importance 1.00

0.95::acc(s1, retailer_burton_com).

0.90::true_val(retailer_burton_com, official_manufacturer); 0.10::true_val(retailer_burton_com, unk_retailer_burton_com).

measured(s1, retailer_burton_com, official_manufacturer).

all_consistent(retailer_burton_com) :-
    consistent(s1, retailer_burton_com).

evidence(all_consistent(retailer_burton_com)).
query(true_val(retailer_burton_com, official_manufacturer)).
query(true_val(retailer_burton_com, unk_retailer_burton_com)).

% @attr retailer_evo_com
% @type categorical
% @canonical false
% @original_name evo.com
% @values major_us_specialty=Major_US_specialty_lowest_price_guarantee_free_shipping unk_retailer_evo_com=Unknown
% @importance 0.95

0.88::acc(s21, retailer_evo_com).

0.85::true_val(retailer_evo_com, major_us_specialty); 0.15::true_val(retailer_evo_com, unk_retailer_evo_com).

measured(s21, retailer_evo_com, major_us_specialty).

all_consistent(retailer_evo_com) :-
    consistent(s21, retailer_evo_com).

evidence(all_consistent(retailer_evo_com)).
query(true_val(retailer_evo_com, major_us_specialty)).
query(true_val(retailer_evo_com, unk_retailer_evo_com)).

% @attr retailer_rei
% @type categorical
% @canonical false
% @original_name REI Co-op
% @values major_us_outdoor=Major_US_outdoor_member_rewards_strong_return_policy unk_retailer_rei=Unknown
% @importance 0.95

0.88::acc(s22, retailer_rei).

0.85::true_val(retailer_rei, major_us_outdoor); 0.15::true_val(retailer_rei, unk_retailer_rei).

measured(s22, retailer_rei, major_us_outdoor).

all_consistent(retailer_rei) :-
    (indep(s22), consistent(s22, retailer_rei) ; \+indep(s22)).

evidence(all_consistent(retailer_rei)).
query(true_val(retailer_rei, major_us_outdoor)).
query(true_val(retailer_rei, unk_retailer_rei)).

% @attr retailer_the_house
% @type categorical
% @canonical false
% @original_name The House
% @values established_online=Established_online_snow_sports_competitive_pricing unk_retailer_the_house=Unknown
% @importance 0.85

0.80::acc(s23, retailer_the_house).

0.78::true_val(retailer_the_house, established_online); 0.22::true_val(retailer_the_house, unk_retailer_the_house).

measured(s23, retailer_the_house, established_online).

all_consistent(retailer_the_house) :-
    consistent(s23, retailer_the_house).

evidence(all_consistent(retailer_the_house)).
query(true_val(retailer_the_house, established_online)).
query(true_val(retailer_the_house, unk_retailer_the_house)).

% @attr retailer_bluezone
% @type categorical
% @canonical false
% @original_name BlueZone Sports
% @values specialty_outdoor=Specialty_outdoor_free_shipping_over_50 unk_retailer_bluezone=Unknown
% @importance 0.70

0.78::acc(s26, retailer_bluezone).

0.73::true_val(retailer_bluezone, specialty_outdoor); 0.27::true_val(retailer_bluezone, unk_retailer_bluezone).

measured(s26, retailer_bluezone, specialty_outdoor).

all_consistent(retailer_bluezone) :-
    (indep(s5), consistent(s26, retailer_bluezone) ; \+indep(s5)).

evidence(all_consistent(retailer_bluezone)).
query(true_val(retailer_bluezone, specialty_outdoor)).
query(true_val(retailer_bluezone, unk_retailer_bluezone)).

% @attr retailer_melbourne_snowboard
% @type categorical
% @canonical false
% @original_name Melbourne Snowboard Centre
% @values australian_specialty=Australian_specialty_store_credit_3_years unk_retailer_melbourne_snowboard=Unknown
% @importance 0.70

0.82::acc(s32, retailer_melbourne_snowboard).

0.78::true_val(retailer_melbourne_snowboard, australian_specialty); 0.22::true_val(retailer_melbourne_snowboard, unk_retailer_melbourne_snowboard).

measured(s32, retailer_melbourne_snowboard, australian_specialty).

all_consistent(retailer_melbourne_snowboard) :-
    (indep(sMERCHANT), consistent(s32, retailer_melbourne_snowboard) ; \+indep(sMERCHANT)).

evidence(all_consistent(retailer_melbourne_snowboard)).
query(true_val(retailer_melbourne_snowboard, australian_specialty)).
query(true_val(retailer_melbourne_snowboard, unk_retailer_melbourne_snowboard)).

% @attr retailer_skatepro
% @type categorical
% @canonical false
% @original_name SkatePro
% @values european_price_match_data_error=European_based_price_match_flex_rating_error unk_retailer_skatepro=Unknown
% @importance 0.90

0.70::acc(s24, retailer_skatepro).

0.62::true_val(retailer_skatepro, european_price_match_data_error); 0.38::true_val(retailer_skatepro, unk_retailer_skatepro).

measured(s24, retailer_skatepro, european_price_match_data_error).

all_consistent(retailer_skatepro) :-
    (indep(s24), consistent(s24, retailer_skatepro) ; \+indep(s24)).

evidence(all_consistent(retailer_skatepro)).
query(true_val(retailer_skatepro, european_price_match_data_error)).
query(true_val(retailer_skatepro, unk_retailer_skatepro)).

% @attr price_positioning
% @type categorical
% @canonical false
% @original_name price positioning
% @values above_avg_at_629=At_629_95_above_average_mellow_freeride_600 unk_price_positioning=Unknown
% @importance 0.90

0.85::acc(s25, price_positioning).

0.81::true_val(price_positioning, above_avg_at_629); 0.19::true_val(price_positioning, unk_price_positioning).

measured(s25, price_positioning, above_avg_at_629).

all_consistent(price_positioning) :-
    consistent(s25, price_positioning).

evidence(all_consistent(price_positioning)).
query(true_val(price_positioning, above_avg_at_629)).
query(true_val(price_positioning, unk_price_positioning)).

% @attr widely_discounted
% @type categorical
% @canonical false
% @original_name widely discounted
% @values on_sale_30_40_pct=Found_on_sale_30_to_40_pct_off_multiple_retailers unk_widely_discounted=Unknown
% @importance 0.95

0.88::acc(s21, widely_discounted).
0.85::acc(s22, widely_discounted).

0.93::true_val(widely_discounted, on_sale_30_40_pct); 0.07::true_val(widely_discounted, unk_widely_discounted).

measured(s21, widely_discounted, on_sale_30_40_pct).
measured(s22, widely_discounted, on_sale_30_40_pct).

all_consistent(widely_discounted) :-
    consistent(s21, widely_discounted),
    (indep(s22), consistent(s22, widely_discounted) ; \+indep(s22)).

evidence(all_consistent(widely_discounted)).
query(true_val(widely_discounted, on_sale_30_40_pct)).
query(true_val(widely_discounted, unk_widely_discounted)).

% @attr limited_edition_status
% @type categorical
% @canonical false
% @original_name limited edition status
% @values family_tree_limited_annual=Family_Tree_limited_editions_specific_annual_graphics unk_limited_edition_status=Unknown
% @importance 0.35

0.93::acc(s8, limited_edition_status).

0.88::true_val(limited_edition_status, family_tree_limited_annual); 0.12::true_val(limited_edition_status, unk_limited_edition_status).

measured(s8, limited_edition_status, family_tree_limited_annual).

all_consistent(limited_edition_status) :-
    consistent(s8, limited_edition_status).

evidence(all_consistent(limited_edition_status)).
query(true_val(limited_edition_status, family_tree_limited_annual)).
query(true_val(limited_edition_status, unk_limited_edition_status)).