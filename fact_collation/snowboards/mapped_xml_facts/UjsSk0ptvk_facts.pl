0.15::indep(s2).
0.12::indep(s4).
0.25::indep(s5).
0.20::indep(s6).
0.25::indep(s7).
0.30::indep(s13).
0.20::indep(s15).
0.20::indep(s21).
0.15::indep(s24).
0.15::indep(s27).
0.15::indep(s28).
0.15::indep(s29).
0.15::indep(s30).
0.12::indep(s31).
0.15::indep(s32).
0.15::indep(s33).
0.15::indep(s34).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values salomon=Salomon unk_brand=Unknown
% @importance 0.98

0.95::acc(s1, brand).
0.80::acc(s2, brand).

0.97::true_val(brand, salomon); 0.03::true_val(brand, unk_brand).

measured(s1, brand, salomon).
measured(s2, brand, salomon).

all_consistent(brand) :-
    consistent(s1, brand),
    (indep(s2), consistent(s2, brand) ; \+indep(s2)).

evidence(all_consistent(brand)).
query(true_val(brand, salomon)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values jetstream=Jetstream unk_model_name=Unknown
% @importance 0.98

0.95::acc(s1, model_name).
0.80::acc(s2, model_name).

0.97::true_val(model_name, jetstream); 0.03::true_val(model_name, unk_model_name).

measured(s1, model_name, jetstream).
measured(s2, model_name, jetstream).

all_consistent(model_name) :-
    consistent(s1, model_name),
    (indep(s2), consistent(s2, model_name) ; \+indep(s2)).

evidence(all_consistent(model_name)).
query(true_val(model_name, jetstream)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type numeric
% @canonical true
% @original_name model_year
% @values v2026=2026 unk_model_year=Unknown
% @importance 0.98

0.95::acc(s1, model_year).
0.80::acc(s2, model_year).
0.93::acc(s_merchant, model_year).

0.97::true_val(model_year, v2026); 0.03::true_val(model_year, unk_model_year).

measured(s1, model_year, v2026).
measured(s2, model_year, v2026).
measured(s_merchant, model_year, v2026).

all_consistent(model_year) :-
    consistent(s1, model_year),
    consistent(s_merchant, model_year),
    (indep(s2), consistent(s2, model_year) ; \+indep(s2)).

evidence(all_consistent(model_year)).
query(true_val(model_year, v2026)).
query(true_val(model_year, unk_model_year)).

% @attr sku
% @type categorical
% @canonical false
% @original_name SKU
% @values l47945800=L47945800 unk_sku=Unknown
% @importance 0.30

0.95::acc(s3, sku).
0.70::acc(s4, sku).
0.93::acc(s_merchant, sku).

0.97::true_val(sku, l47945800); 0.03::true_val(sku, unk_sku).

measured(s3, sku, l47945800).
measured(s4, sku, l47945800).
measured(s_merchant, sku, l47945800).

all_consistent(sku) :-
    consistent(s3, sku),
    consistent(s_merchant, sku),
    (indep(s4), consistent(s4, sku) ; \+indep(s4)).

evidence(all_consistent(sku)).
query(true_val(sku, l47945800)).
query(true_val(sku, unk_sku)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.98

0.95::acc(s1, product_type).
0.80::acc(s2, product_type).

0.97::true_val(product_type, snowboard); 0.03::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).
measured(s2, product_type, snowboard).

all_consistent(product_type) :-
    consistent(s1, product_type),
    (indep(s2), consistent(s2, product_type) ; \+indep(s2)).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain_freeride=All-Mountain_Freeride unk_board_category=Unknown
% @importance 0.98

0.95::acc(s1, board_category).
0.80::acc(s2, board_category).
0.93::acc(s_merchant, board_category).

0.97::true_val(board_category, all_mountain_freeride); 0.03::true_val(board_category, unk_board_category).

measured(s1, board_category, all_mountain_freeride).
measured(s2, board_category, all_mountain_freeride).
measured(s_merchant, board_category, all_mountain_freeride).

all_consistent(board_category) :-
    consistent(s1, board_category),
    consistent(s_merchant, board_category),
    (indep(s2), consistent(s2, board_category) ; \+indep(s2)).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain_freeride)).
query(true_val(board_category, unk_board_category)).

% @attr model_series
% @type categorical
% @canonical false
% @original_name Model series
% @values horizon_series=Horizon_Series unk_model_series=Unknown
% @importance 0.55

0.82::acc(s5, model_series).
0.78::acc(s6, model_series).

0.88::true_val(model_series, horizon_series); 0.12::true_val(model_series, unk_model_series).

measured(s5, model_series, horizon_series).
measured(s6, model_series, horizon_series).

all_consistent(model_series) :-
    consistent(s5, model_series),
    consistent(s6, model_series).

evidence(all_consistent(model_series)).
query(true_val(model_series, horizon_series)).
query(true_val(model_series, unk_model_series)).

% @attr new_model_status
% @type categorical
% @canonical false
% @original_name New model status
% @values brand_new_2026=Brand_new_model_for_2026 unk_new_model_status=Unknown
% @importance 0.70

0.80::acc(s7, new_model_status).
0.60::acc(s8, new_model_status).

0.85::true_val(new_model_status, brand_new_2026); 0.15::true_val(new_model_status, unk_new_model_status).

measured(s7, new_model_status, brand_new_2026).
measured(s8, new_model_status, brand_new_2026).

all_consistent(new_model_status) :-
    (indep(s7), consistent(s7, new_model_status) ; \+indep(s7)),
    consistent(s8, new_model_status).

evidence(all_consistent(new_model_status)).
query(true_val(new_model_status, brand_new_2026)).
query(true_val(new_model_status, unk_new_model_status)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values unisex=Unisex unk_gender=Unknown
% @importance 0.90

0.88::acc(s9, gender).

0.81::true_val(gender, unisex); 0.19::true_val(gender, unk_gender).

measured(s9, gender, unisex).

all_consistent(gender) :-
    consistent(s9, gender).

evidence(all_consistent(gender)).
query(true_val(gender, unisex)).
query(true_val(gender, unk_gender)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values salomon_sas=Salomon_SAS_Annecy_France unk_manufacturer=Unknown
% @importance 0.60

0.88::acc(s10, manufacturer).

0.76::true_val(manufacturer, salomon_sas); 0.24::true_val(manufacturer, unk_manufacturer).

measured(s10, manufacturer, salomon_sas).

all_consistent(manufacturer) :-
    consistent(s10, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, salomon_sas)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr parent_company
% @type categorical
% @canonical false
% @original_name Parent company
% @values amer_sports=Amer_Sports_Corporation unk_parent_company=Unknown
% @importance 0.50

0.88::acc(s11, parent_company).

0.76::true_val(parent_company, amer_sports); 0.24::true_val(parent_company, unk_parent_company).

measured(s11, parent_company, amer_sports).

all_consistent(parent_company) :-
    consistent(s11, parent_company).

evidence(all_consistent(parent_company)).
query(true_val(parent_company, amer_sports)).
query(true_val(parent_company, unk_parent_company)).

% @attr founded
% @type categorical
% @canonical false
% @original_name Founded
% @values y1947=1947_Francois_Salomon_Annecy unk_founded=Unknown
% @importance 0.35

0.88::acc(s12, founded).

0.76::true_val(founded, y1947); 0.24::true_val(founded, unk_founded).

measured(s12, founded, y1947).

all_consistent(founded) :-
    consistent(s12, founded).

evidence(all_consistent(founded)).
query(true_val(founded, y1947)).
query(true_val(founded, unk_founded)).

% @attr designed_by
% @type categorical
% @canonical false
% @original_name Designed by
% @values salomon_snowboards=Salomon_Snowboards unk_designed_by=Unknown
% @importance 0.85

0.80::acc(s13, designed_by).

0.65::true_val(designed_by, salomon_snowboards); 0.35::true_val(designed_by, unk_designed_by).

measured(s13, designed_by, salomon_snowboards).

all_consistent(designed_by) :-
    consistent(s13, designed_by).

evidence(all_consistent(designed_by)).
query(true_val(designed_by, salomon_snowboards)).
query(true_val(designed_by, unk_designed_by)).

% @attr built_by
% @type categorical
% @canonical false
% @original_name Built by
% @values amer_sports=Amer_Sports unk_built_by=Unknown
% @importance 0.85

0.80::acc(s13, built_by).

0.65::true_val(built_by, amer_sports); 0.35::true_val(built_by, unk_built_by).

measured(s13, built_by, amer_sports).

all_consistent(built_by) :-
    consistent(s13, built_by).

evidence(all_consistent(built_by)).
query(true_val(built_by, amer_sports)).
query(true_val(built_by, unk_built_by)).

% @attr design_team
% @type categorical
% @canonical false
% @original_name Design team
% @values mindnich_nyvelt=Nils_Mindnich_Wolle_Nyvelt unk_design_team=Unknown
% @importance 0.90

0.82::acc(s14, design_team).

0.77::true_val(design_team, mindnich_nyvelt); 0.23::true_val(design_team, unk_design_team).

measured(s14, design_team, mindnich_nyvelt).

all_consistent(design_team) :-
    consistent(s14, design_team).

evidence(all_consistent(design_team)).
query(true_val(design_team, mindnich_nyvelt)).
query(true_val(design_team, unk_design_team)).

% @attr manufacturer_reputation
% @type categorical
% @canonical false
% @original_name Manufacturer reputation
% @values world_leading=World_leading_outdoor_sports_brand unk_manufacturer_reputation=Unknown
% @importance 0.70

0.78::acc(s15, manufacturer_reputation).

0.66::true_val(manufacturer_reputation, world_leading); 0.34::true_val(manufacturer_reputation, unk_manufacturer_reputation).

measured(s15, manufacturer_reputation, world_leading).

all_consistent(manufacturer_reputation) :-
    consistent(s15, manufacturer_reputation).

evidence(all_consistent(manufacturer_reputation)).
query(true_val(manufacturer_reputation, world_leading)).
query(true_val(manufacturer_reputation, unk_manufacturer_reputation)).

% @attr ownership_chain
% @type categorical
% @canonical false
% @original_name Ownership chain
% @values anta_consortium=ANTA_Sports_consortium unk_ownership_chain=Unknown
% @importance 0.35

0.85::acc(s16, ownership_chain).

0.74::true_val(ownership_chain, anta_consortium); 0.26::true_val(ownership_chain, unk_ownership_chain).

measured(s16, ownership_chain, anta_consortium).

all_consistent(ownership_chain) :-
    consistent(s16, ownership_chain).

evidence(all_consistent(ownership_chain)).
query(true_val(ownership_chain, anta_consortium)).
query(true_val(ownership_chain, unk_ownership_chain)).

% @attr snowboard_market_entry
% @type numeric
% @canonical false
% @original_name Snowboard market entry
% @values v1997=1997 unk_snowboard_market_entry=Unknown
% @importance 0.30

0.78::acc(s17, snowboard_market_entry).

0.68::true_val(snowboard_market_entry, v1997); 0.32::true_val(snowboard_market_entry, unk_snowboard_market_entry).

measured(s17, snowboard_market_entry, v1997).

all_consistent(snowboard_market_entry) :-
    consistent(s17, snowboard_market_entry).

evidence(all_consistent(snowboard_market_entry)).
query(true_val(snowboard_market_entry, v1997)).
query(true_val(snowboard_market_entry, unk_snowboard_market_entry)).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v649_95=649.95 unk_price_usd_msrp=Unknown
% @importance 0.93

0.90::acc(s9, price_usd_msrp).
0.90::acc(s18, price_usd_msrp).
0.88::acc(s19, price_usd_msrp).

0.95::true_val(price_usd_msrp, v649_95); 0.05::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s9, price_usd_msrp, v649_95).
measured(s18, price_usd_msrp, v649_95).
measured(s19, price_usd_msrp, v649_95).

all_consistent(price_usd_msrp) :-
    consistent(s9, price_usd_msrp),
    consistent(s18, price_usd_msrp),
    consistent(s19, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v649_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_evo
% @values v519_96=519.96 unk_price_usd_evo=Unknown
% @importance 0.95

0.88::acc(s20, price_usd_evo).

0.78::true_val(price_usd_evo, v519_96); 0.22::true_val(price_usd_evo, unk_price_usd_evo).

measured(s20, price_usd_evo, v519_96).

all_consistent(price_usd_evo) :-
    consistent(s20, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v519_96)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_tactics
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_tactics
% @values v519_95=519.95 unk_price_usd_tactics=Unknown
% @importance 0.90

0.85::acc(s21, price_usd_tactics).

0.75::true_val(price_usd_tactics, v519_95); 0.25::true_val(price_usd_tactics, unk_price_usd_tactics).

measured(s21, price_usd_tactics, v519_95).

all_consistent(price_usd_tactics) :-
    consistent(s21, price_usd_tactics).

evidence(all_consistent(price_usd_tactics)).
query(true_val(price_usd_tactics, v519_95)).
query(true_val(price_usd_tactics, unk_price_usd_tactics)).

% @attr price_usd_ski_haus
% @type numeric
% @unit USD
% @canonical false
% @original_name Sale price at Ski Haus (USD)
% @values v454_97=454.97 unk_price_usd_ski_haus=Unknown
% @importance 0.90

0.78::acc(s22, price_usd_ski_haus).

0.57::true_val(price_usd_ski_haus, v454_97); 0.43::true_val(price_usd_ski_haus, unk_price_usd_ski_haus).

measured(s22, price_usd_ski_haus, v454_97).

all_consistent(price_usd_ski_haus) :-
    consistent(s22, price_usd_ski_haus).

evidence(all_consistent(price_usd_ski_haus)).
query(true_val(price_usd_ski_haus, v454_97)).
query(true_val(price_usd_ski_haus, unk_price_usd_ski_haus)).

% @attr price_cad_alternative_groove
% @type numeric
% @unit CAD
% @canonical false
% @original_name Sale price (CAD) at Alternative Groove
% @values c454_97=454.97 unk_price_cad_alternative_groove=Unknown
% @importance 0.80

0.75::acc(s23, price_cad_alternative_groove).

0.53::true_val(price_cad_alternative_groove, c454_97); 0.47::true_val(price_cad_alternative_groove, unk_price_cad_alternative_groove).

measured(s23, price_cad_alternative_groove, c454_97).

all_consistent(price_cad_alternative_groove) :-
    consistent(s23, price_cad_alternative_groove).

evidence(all_consistent(price_cad_alternative_groove)).
query(true_val(price_cad_alternative_groove, c454_97)).
query(true_val(price_cad_alternative_groove, unk_price_cad_alternative_groove)).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v759_99=759.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.93::acc(s_merchant, price_aud_merchant).

0.95::true_val(price_aud_merchant, v759_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s_merchant, price_aud_merchant, v759_99).

all_consistent(price_aud_merchant) :-
    consistent(s_merchant, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v759_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_usd_shred_shop
% @type numeric
% @unit USD
% @canonical false
% @original_name Sale price at Shred Shop (USD)
% @values v649_95=649.95 unk_price_usd_shred_shop=Unknown
% @importance 0.70

0.72::acc(s24, price_usd_shred_shop).

0.53::true_val(price_usd_shred_shop, v649_95); 0.47::true_val(price_usd_shred_shop, unk_price_usd_shred_shop).

measured(s24, price_usd_shred_shop, v649_95).

all_consistent(price_usd_shred_shop) :-
    consistent(s24, price_usd_shred_shop).

evidence(all_consistent(price_usd_shred_shop)).
query(true_val(price_usd_shred_shop, v649_95)).
query(true_val(price_usd_shred_shop, unk_price_usd_shred_shop)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values available_salomon_com=salomon.com_official unk_availability_status=Unknown
% @importance 0.90

0.88::acc(s9, availability_status).

0.81::true_val(availability_status, available_salomon_com); 0.19::true_val(availability_status, unk_availability_status).

measured(s9, availability_status, available_salomon_com).

all_consistent(availability_status) :-
    consistent(s9, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, available_salomon_com)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status
% @values in_stock_evo=evo.com_in_stock unk_availability_status_evo=Unknown
% @importance 0.95

0.88::acc(s20, availability_status_evo).

0.78::true_val(availability_status_evo, in_stock_evo); 0.22::true_val(availability_status_evo, unk_availability_status_evo).

measured(s20, availability_status_evo, in_stock_evo).

all_consistent(availability_status_evo) :-
    consistent(s20, availability_status_evo).

evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, in_stock_evo)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

% @attr availability_status_tactics
% @type categorical
% @canonical false
% @original_name availability_status
% @values in_stock_tactics=Tactics.com_in_stock unk_availability_status_tactics=Unknown
% @importance 0.90

0.85::acc(s21, availability_status_tactics).

0.75::true_val(availability_status_tactics, in_stock_tactics); 0.25::true_val(availability_status_tactics, unk_availability_status_tactics).

measured(s21, availability_status_tactics, in_stock_tactics).

all_consistent(availability_status_tactics) :-
    consistent(s21, availability_status_tactics).

evidence(all_consistent(availability_status_tactics)).
query(true_val(availability_status_tactics, in_stock_tactics)).
query(true_val(availability_status_tactics, unk_availability_status_tactics)).

% @attr availability_status_rei
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_rei=REI_Co-op unk_availability_status_rei=Unknown
% @importance 0.75

0.85::acc(s25, availability_status_rei).

0.75::true_val(availability_status_rei, available_rei); 0.25::true_val(availability_status_rei, unk_availability_status_rei).

measured(s25, availability_status_rei, available_rei).

all_consistent(availability_status_rei) :-
    consistent(s25, availability_status_rei).

evidence(all_consistent(availability_status_rei)).
query(true_val(availability_status_rei, available_rei)).
query(true_val(availability_status_rei, unk_availability_status_rei)).

% @attr availability_status_amazon
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_amazon=Amazon.com_via_Ski_Monster unk_availability_status_amazon=Unknown
% @importance 0.70

0.78::acc(s26, availability_status_amazon).

0.57::true_val(availability_status_amazon, available_amazon); 0.43::true_val(availability_status_amazon, unk_availability_status_amazon).

measured(s26, availability_status_amazon, available_amazon).

all_consistent(availability_status_amazon) :-
    consistent(s26, availability_status_amazon).

evidence(all_consistent(availability_status_amazon)).
query(true_val(availability_status_amazon, available_amazon)).
query(true_val(availability_status_amazon, unk_availability_status_amazon)).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_blauer=Blauer_Board_Shop unk_availability_status_blauer=Unknown
% @importance 0.85

0.80::acc(s7, availability_status_blauer).

0.69::true_val(availability_status_blauer, available_blauer); 0.31::true_val(availability_status_blauer, unk_availability_status_blauer).

measured(s7, availability_status_blauer, available_blauer).

all_consistent(availability_status_blauer) :-
    consistent(s7, availability_status_blauer).

evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, available_blauer)).
query(true_val(availability_status_blauer, unk_availability_status_blauer)).

% @attr availability_status_corbetts
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_corbetts=Corbetts_Ski_Snowboard unk_availability_status_corbetts=Unknown
% @importance 0.60

0.78::acc(s27, availability_status_corbetts).

0.65::true_val(availability_status_corbetts, available_corbetts); 0.35::true_val(availability_status_corbetts, unk_availability_status_corbetts).

measured(s27, availability_status_corbetts, available_corbetts).

all_consistent(availability_status_corbetts) :-
    consistent(s27, availability_status_corbetts).

evidence(all_consistent(availability_status_corbetts)).
query(true_val(availability_status_corbetts, available_corbetts)).
query(true_val(availability_status_corbetts, unk_availability_status_corbetts)).

% @attr availability_status_ski_monster
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_ski_monster=The_Ski_Monster unk_availability_status_ski_monster=Unknown
% @importance 0.85

0.80::acc(s13, availability_status_ski_monster).

0.65::true_val(availability_status_ski_monster, available_ski_monster); 0.35::true_val(availability_status_ski_monster, unk_availability_status_ski_monster).

measured(s13, availability_status_ski_monster, available_ski_monster).

all_consistent(availability_status_ski_monster) :-
    consistent(s13, availability_status_ski_monster).

evidence(all_consistent(availability_status_ski_monster)).
query(true_val(availability_status_ski_monster, available_ski_monster)).
query(true_val(availability_status_ski_monster, unk_availability_status_ski_monster)).

% @attr availability_status_ski_haus
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_ski_haus=Ski_Haus unk_availability_status_ski_haus=Unknown
% @importance 0.90

0.78::acc(s22, availability_status_ski_haus).

0.57::true_val(availability_status_ski_haus, available_ski_haus); 0.43::true_val(availability_status_ski_haus, unk_availability_status_ski_haus).

measured(s22, availability_status_ski_haus, available_ski_haus).

all_consistent(availability_status_ski_haus) :-
    consistent(s22, availability_status_ski_haus).

evidence(all_consistent(availability_status_ski_haus)).
query(true_val(availability_status_ski_haus, available_ski_haus)).
query(true_val(availability_status_ski_haus, unk_availability_status_ski_haus)).

% @attr availability_status_mcu
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_mcu=McU_Sports unk_availability_status_mcu=Unknown
% @importance 0.30

0.70::acc(s4, availability_status_mcu).

0.54::true_val(availability_status_mcu, available_mcu); 0.46::true_val(availability_status_mcu, unk_availability_status_mcu).

measured(s4, availability_status_mcu, available_mcu).

all_consistent(availability_status_mcu) :-
    consistent(s4, availability_status_mcu).

evidence(all_consistent(availability_status_mcu)).
query(true_val(availability_status_mcu, available_mcu)).
query(true_val(availability_status_mcu, unk_availability_status_mcu)).

% @attr availability_status_mountain_cultures
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_mc=Mountain_Cultures unk_availability_status_mountain_cultures=Unknown
% @importance 0.50

0.72::acc(s28, availability_status_mountain_cultures).

0.51::true_val(availability_status_mountain_cultures, available_mc); 0.49::true_val(availability_status_mountain_cultures, unk_availability_status_mountain_cultures).

measured(s28, availability_status_mountain_cultures, available_mc).

all_consistent(availability_status_mountain_cultures) :-
    consistent(s28, availability_status_mountain_cultures).

evidence(all_consistent(availability_status_mountain_cultures)).
query(true_val(availability_status_mountain_cultures, available_mc)).
query(true_val(availability_status_mountain_cultures, unk_availability_status_mountain_cultures)).

% @attr availability_status_absolute_snow
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_abs=Absolute-Snow_UK unk_availability_status_absolute_snow=Unknown
% @importance 0.70

0.78::acc(s15, availability_status_absolute_snow).

0.66::true_val(availability_status_absolute_snow, available_abs); 0.34::true_val(availability_status_absolute_snow, unk_availability_status_absolute_snow).

measured(s15, availability_status_absolute_snow, available_abs).

all_consistent(availability_status_absolute_snow) :-
    consistent(s15, availability_status_absolute_snow).

evidence(all_consistent(availability_status_absolute_snow)).
query(true_val(availability_status_absolute_snow, available_abs)).
query(true_val(availability_status_absolute_snow, unk_availability_status_absolute_snow)).

% @attr availability_status_snowtrax
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_snowtrax=Snowtrax_Store_UK unk_availability_status_snowtrax=Unknown
% @importance 0.50

0.72::acc(s29, availability_status_snowtrax).

0.53::true_val(availability_status_snowtrax, available_snowtrax); 0.47::true_val(availability_status_snowtrax, unk_availability_status_snowtrax).

measured(s29, availability_status_snowtrax, available_snowtrax).

all_consistent(availability_status_snowtrax) :-
    consistent(s29, availability_status_snowtrax).

evidence(all_consistent(availability_status_snowtrax)).
query(true_val(availability_status_snowtrax, available_snowtrax)).
query(true_val(availability_status_snowtrax, unk_availability_status_snowtrax)).

% @attr availability_status_skipro
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_skipro=SkiPro unk_availability_status_skipro=Unknown
% @importance 0.50

0.70::acc(s30, availability_status_skipro).

0.39::true_val(availability_status_skipro, available_skipro); 0.61::true_val(availability_status_skipro, unk_availability_status_skipro).

measured(s30, availability_status_skipro, available_skipro).

all_consistent(availability_status_skipro) :-
    consistent(s30, availability_status_skipro).

evidence(all_consistent(availability_status_skipro)).
query(true_val(availability_status_skipro, available_skipro)).
query(true_val(availability_status_skipro, unk_availability_status_skipro)).

% @attr availability_status_ski_essentials
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_skie=SkiEssentials unk_availability_status_ski_essentials=Unknown
% @importance 0.40

0.68::acc(s31, availability_status_ski_essentials).

0.30::true_val(availability_status_ski_essentials, available_skie); 0.70::true_val(availability_status_ski_essentials, unk_availability_status_ski_essentials).

measured(s31, availability_status_ski_essentials, available_skie).

all_consistent(availability_status_ski_essentials) :-
    consistent(s31, availability_status_ski_essentials).

evidence(all_consistent(availability_status_ski_essentials)).
query(true_val(availability_status_ski_essentials, available_skie)).
query(true_val(availability_status_ski_essentials, unk_availability_status_ski_essentials)).

% @attr availability_status_gear_west
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_gw=Gear_West unk_availability_status_gear_west=Unknown
% @importance 0.40

0.70::acc(s32, availability_status_gear_west).

0.48::true_val(availability_status_gear_west, available_gw); 0.52::true_val(availability_status_gear_west, unk_availability_status_gear_west).

measured(s32, availability_status_gear_west, available_gw).

all_consistent(availability_status_gear_west) :-
    consistent(s32, availability_status_gear_west).

evidence(all_consistent(availability_status_gear_west)).
query(true_val(availability_status_gear_west, available_gw)).
query(true_val(availability_status_gear_west, unk_availability_status_gear_west)).

% @attr availability_status_snowcountry
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_sc=Snowcountry_EU unk_availability_status_snowcountry=Unknown
% @importance 0.30

0.70::acc(s33, availability_status_snowcountry).

0.51::true_val(availability_status_snowcountry, available_sc); 0.49::true_val(availability_status_snowcountry, unk_availability_status_snowcountry).

measured(s33, availability_status_snowcountry, available_sc).

all_consistent(availability_status_snowcountry) :-
    consistent(s33, availability_status_snowcountry).

evidence(all_consistent(availability_status_snowcountry)).
query(true_val(availability_status_snowcountry, available_sc)).
query(true_val(availability_status_snowcountry, unk_availability_status_snowcountry)).

% @attr availability_status_glisshop
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_gliss=Glisshop_UK unk_availability_status_glisshop=Unknown
% @importance 0.40

0.70::acc(s34, availability_status_glisshop).

0.45::true_val(availability_status_glisshop, available_gliss); 0.55::true_val(availability_status_glisshop, unk_availability_status_glisshop).

measured(s34, availability_status_glisshop, available_gliss).

all_consistent(availability_status_glisshop) :-
    consistent(s34, availability_status_glisshop).

evidence(all_consistent(availability_status_glisshop)).
query(true_val(availability_status_glisshop, available_gliss)).
query(true_val(availability_status_glisshop, unk_availability_status_glisshop)).

% @attr availability_status_shred_shop
% @type categorical
% @canonical false
% @original_name availability_status
% @values sold_out_shred=Shred_Shop_sold_out unk_availability_status_shred_shop=Unknown
% @importance 0.70

0.72::acc(s24, availability_status_shred_shop).

0.53::true_val(availability_status_shred_shop, sold_out_shred); 0.47::true_val(availability_status_shred_shop, unk_availability_status_shred_shop).

measured(s24, availability_status_shred_shop, sold_out_shred).

all_consistent(availability_status_shred_shop) :-
    consistent(s24, availability_status_shred_shop).

evidence(all_consistent(availability_status_shred_shop)).
query(true_val(availability_status_shred_shop, sold_out_shred)).
query(true_val(availability_status_shred_shop, unk_availability_status_shred_shop)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values six_sizes=146_149_153_157_160_163 seven_sizes=146_149_153_157_160_163_166
% @importance 0.88

0.85::acc(s_merchant, available_sizes).
0.90::acc(s9, available_sizes).
0.90::acc(s18, available_sizes).

0.40::true_val(available_sizes, six_sizes); 0.60::true_val(available_sizes, seven_sizes).

measured(s_merchant, available_sizes, six_sizes).
measured(s9, available_sizes, seven_sizes).
measured(s18, available_sizes, seven_sizes).

all_consistent(available_sizes) :-
    consistent(s_merchant, available_sizes),
    consistent(s9, available_sizes),
    consistent(s18, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, six_sizes)).
query(true_val(available_sizes, seven_sizes)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 0.98

0.95::acc(s1, shape).
0.80::acc(s2, shape).
0.93::acc(s_merchant, shape).

0.97::true_val(shape, tapered_directional); 0.03::true_val(shape, unk_shape).

measured(s1, shape, tapered_directional).
measured(s2, shape, tapered_directional).
measured(s_merchant, shape, tapered_directional).

all_consistent(shape) :-
    consistent(s1, shape),
    consistent(s_merchant, shape),
    (indep(s2), consistent(s2, shape) ; \+indep(s2)).

evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

% @attr shape_description
% @type categorical
% @canonical false
% @original_name Shape description
% @values wider_tapered=Wider_tapered_shape_long_nose_scoopy_tail unk_shape_description=Unknown
% @importance 0.90

0.85::acc(s35, shape_description).

0.72::true_val(shape_description, wider_tapered); 0.28::true_val(shape_description, unk_shape_description).

measured(s35, shape_description, wider_tapered).

all_consistent(shape_description) :-
    consistent(s35, shape_description).

evidence(all_consistent(shape_description)).
query(true_val(shape_description, wider_tapered)).
query(true_val(shape_description, unk_shape_description)).

% @attr taper
% @type categorical
% @canonical true
% @original_name taper
% @values taper_2_20mm=Tail_tapered_2_to_20mm unk_taper=Unknown
% @importance 0.60

0.75::acc(s24, taper).

0.57::true_val(taper, taper_2_20mm); 0.43::true_val(taper, unk_taper).

measured(s24, taper, taper_2_20mm).

all_consistent(taper) :-
    consistent(s24, taper).

evidence(all_consistent(taper)).
query(true_val(taper, taper_2_20mm)).
query(true_val(taper, unk_taper)).

% @attr setback
% @type numeric
% @unit mm
% @canonical true
% @original_name setback
% @values v20=20.0 unk_setback=Unknown
% @importance 0.88

0.93::acc(s_merchant, setback).
0.85::acc(s21, setback).

0.95::true_val(setback, v20); 0.05::true_val(setback, unk_setback).

measured(s_merchant, setback, v20).
measured(s21, setback, v20).

all_consistent(setback) :-
    consistent(s_merchant, setback),
    (indep(s21), consistent(s21, setback) ; \+indep(s21)).

evidence(all_consistent(setback)).
query(true_val(setback, v20)).
query(true_val(setback, unk_setback)).

% @attr width_options
% @type categorical
% @canonical true
% @original_name width_options
% @values standard_only=Standard includes_wide=Standard_with_Wide_153_157
% @importance 0.88

0.88::acc(s_merchant, width_options).
0.85::acc(s21, width_options).

0.40::true_val(width_options, standard_only); 0.60::true_val(width_options, includes_wide).

measured(s_merchant, width_options, standard_only).
measured(s21, width_options, includes_wide).

all_consistent(width_options) :-
    consistent(s_merchant, width_options),
    (indep(s21), consistent(s21, width_options) ; \+indep(s21)).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_only)).
query(true_val(width_options, includes_wide)).

% @attr waist_description
% @type categorical
% @canonical false
% @original_name Waist description
% @values mid_wide=Mid-wide_waist unk_waist_description=Unknown
% @importance 0.90

0.85::acc(s14, waist_description).

0.77::true_val(waist_description, mid_wide); 0.23::true_val(waist_description, unk_waist_description).

measured(s14, waist_description, mid_wide).

all_consistent(waist_description) :-
    consistent(s14, waist_description).

evidence(all_consistent(waist_description)).
query(true_val(waist_description, mid_wide)).
query(true_val(waist_description, unk_waist_description)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values rock_out_camber=Rock_Out_Camber rocker_flat_rocker=Rocker_Flat_Rocker flat_with_camber=Flat_with_Camber
% @importance 0.82

0.95::acc(s1, camber_type).
0.80::acc(s2, camber_type).
0.93::acc(s_merchant, camber_type).
0.78::acc(s37, camber_type).
0.80::acc(s21, camber_type).

0.70::true_val(camber_type, rock_out_camber); 0.20::true_val(camber_type, rocker_flat_rocker); 0.10::true_val(camber_type, flat_with_camber).

measured(s1, camber_type, rock_out_camber).
measured(s2, camber_type, rock_out_camber).
measured(s_merchant, camber_type, rock_out_camber).
measured(s37, camber_type, rocker_flat_rocker).
measured(s21, camber_type, flat_with_camber).

all_consistent(camber_type) :-
    consistent(s1, camber_type),
    consistent(s_merchant, camber_type),
    consistent(s37, camber_type),
    (indep(s2), consistent(s2, camber_type) ; \+indep(s2)),
    (indep(s21), consistent(s21, camber_type) ; \+indep(s21)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, rock_out_camber)).
query(true_val(camber_type, rocker_flat_rocker)).
query(true_val(camber_type, flat_with_camber)).

% @attr camber_description
% @type categorical
% @canonical false
% @original_name camber_description
% @values flat_camber_rocker=Flat_between_bindings_camber_near_feet_rocker_tip_tail unk_camber_description=Unknown
% @importance 0.94

0.95::acc(s1, camber_description).
0.80::acc(s2, camber_description).

0.95::true_val(camber_description, flat_camber_rocker); 0.05::true_val(camber_description, unk_camber_description).

measured(s1, camber_description, flat_camber_rocker).
measured(s2, camber_description, flat_camber_rocker).

all_consistent(camber_description) :-
    consistent(s1, camber_description),
    (indep(s2), consistent(s2, camber_description) ; \+indep(s2)).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, flat_camber_rocker)).
query(true_val(camber_description, unk_camber_description)).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values radial=Radial_Sidecut unk_sidecut_type=Unknown
% @importance 0.98

0.95::acc(s1, sidecut_type).
0.80::acc(s2, sidecut_type).
0.93::acc(s_merchant, sidecut_type).

0.97::true_val(sidecut_type, radial); 0.03::true_val(sidecut_type, unk_sidecut_type).

measured(s1, sidecut_type, radial).
measured(s2, sidecut_type, radial).
measured(s_merchant, sidecut_type, radial).

all_consistent(sidecut_type) :-
    consistent(s1, sidecut_type),
    consistent(s_merchant, sidecut_type),
    (indep(s2), consistent(s2, sidecut_type) ; \+indep(s2)).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, radial)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr sidecut_description
% @type categorical
% @canonical false
% @original_name Sidecut description
% @values perfect_circle=Perfect_circle_classic_sidecut unk_sidecut_description=Unknown
% @importance 0.70

0.80::acc(s38, sidecut_description).

0.53::true_val(sidecut_description, perfect_circle); 0.47::true_val(sidecut_description, unk_sidecut_description).

measured(s38, sidecut_description, perfect_circle).

all_consistent(sidecut_description) :-
    consistent(s38, sidecut_description).

evidence(all_consistent(sidecut_description)).
query(true_val(sidecut_description, perfect_circle)).
query(true_val(sidecut_description, unk_sidecut_description)).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size
% @values v7_3=7.3 unk_sidecut_radius_size=Unknown
% @importance 0.85

0.93::acc(s_merchant, sidecut_radius_size).

0.95::true_val(sidecut_radius_size, v7_3); 0.05::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s_merchant, sidecut_radius_size, v7_3).

all_consistent(sidecut_radius_size) :-
    consistent(s_merchant, sidecut_radius_size).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_3)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr sidecut_radius_size_146
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v6_2=6.2 unk_sidecut_radius_size_146=Unknown
% @importance 0.85

0.93::acc(s_merchant, sidecut_radius_size_146).

0.95::true_val(sidecut_radius_size_146, v6_2); 0.05::true_val(sidecut_radius_size_146, unk_sidecut_radius_size_146).

measured(s_merchant, sidecut_radius_size_146, v6_2).

all_consistent(sidecut_radius_size_146) :-
    consistent(s_merchant, sidecut_radius_size_146).

evidence(all_consistent(sidecut_radius_size_146)).
query(true_val(sidecut_radius_size_146, v6_2)).
query(true_val(sidecut_radius_size_146, unk_sidecut_radius_size_146)).

% @attr sidecut_radius_size_149
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v6_5=6.5 unk_sidecut_radius_size_149=Unknown
% @importance 0.85

0.93::acc(s_merchant, sidecut_radius_size_149).

0.95::true_val(sidecut_radius_size_149, v6_5); 0.05::true_val(sidecut_radius_size_149, unk_sidecut_radius_size_149).

measured(s_merchant, sidecut_radius_size_149, v6_5).

all_consistent(sidecut_radius_size_149) :-
    consistent(s_merchant, sidecut_radius_size_149).

evidence(all_consistent(sidecut_radius_size_149)).
query(true_val(sidecut_radius_size_149, v6_5)).
query(true_val(sidecut_radius_size_149, unk_sidecut_radius_size_149)).

% @attr sidecut_radius_size_153
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v7_1=7.1 unk_sidecut_radius_size_153=Unknown
% @importance 0.85

0.93::acc(s_merchant, sidecut_radius_size_153).

0.95::true_val(sidecut_radius_size_153, v7_1); 0.05::true_val(sidecut_radius_size_153, unk_sidecut_radius_size_153).

measured(s_merchant, sidecut_radius_size_153, v7_1).

all_consistent(sidecut_radius_size_153) :-
    consistent(s_merchant, sidecut_radius_size_153).

evidence(all_consistent(sidecut_radius_size_153)).
query(true_val(sidecut_radius_size_153, v7_1)).
query(true_val(sidecut_radius_size_153, unk_sidecut_radius_size_153)).

% @attr sidecut_radius_size_160
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v7_5=7.5 unk_sidecut_radius_size_160=Unknown
% @importance 0.85

0.93::acc(s_merchant, sidecut_radius_size_160).

0.95::true_val(sidecut_radius_size_160, v7_5); 0.05::true_val(sidecut_radius_size_160, unk_sidecut_radius_size_160).

measured(s_merchant, sidecut_radius_size_160, v7_5).

all_consistent(sidecut_radius_size_160) :-
    consistent(s_merchant, sidecut_radius_size_160).

evidence(all_consistent(sidecut_radius_size_160)).
query(true_val(sidecut_radius_size_160, v7_5)).
query(true_val(sidecut_radius_size_160, unk_sidecut_radius_size_160)).

% @attr sidecut_radius_size_163
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v7_7=7.7 unk_sidecut_radius_size_163=Unknown
% @importance 0.85

0.93::acc(s_merchant, sidecut_radius_size_163).

0.95::true_val(sidecut_radius_size_163, v7_7); 0.05::true_val(sidecut_radius_size_163, unk_sidecut_radius_size_163).

measured(s_merchant, sidecut_radius_size_163, v7_7).

all_consistent(sidecut_radius_size_163) :-
    consistent(s_merchant, sidecut_radius_size_163).

evidence(all_consistent(sidecut_radius_size_163)).
query(true_val(sidecut_radius_size_163, v7_7)).
query(true_val(sidecut_radius_size_163, unk_sidecut_radius_size_163)).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v7=7.0 unk_flex_rating_10=Unknown
% @importance 0.85

0.93::acc(s_merchant, flex_rating_10).
0.80::acc(s13, flex_rating_10).

0.95::true_val(flex_rating_10, v7); 0.05::true_val(flex_rating_10, unk_flex_rating_10).

measured(s_merchant, flex_rating_10, v7).
measured(s13, flex_rating_10, v7).

all_consistent(flex_rating_10) :-
    consistent(s_merchant, flex_rating_10),
    (indep(s13), consistent(s13, flex_rating_10) ; \+indep(s13)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v7)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

% @attr flex_rating_5
% @type numeric
% @unit /5
% @canonical true
% @original_name flex_rating_5
% @values v3_5=3.5 unk_flex_rating_5=Unknown
% @importance 0.85

0.80::acc(s7, flex_rating_5).

0.69::true_val(flex_rating_5, v3_5); 0.31::true_val(flex_rating_5, unk_flex_rating_5).

measured(s7, flex_rating_5, v3_5).

all_consistent(flex_rating_5) :-
    (indep(s7), consistent(s7, flex_rating_5) ; \+indep(s7)).

evidence(all_consistent(flex_rating_5)).
query(true_val(flex_rating_5, v3_5)).
query(true_val(flex_rating_5, unk_flex_rating_5)).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values progressive=Progressive_stiffer_tail_softer_nose unk_flex_direction=Unknown
% @importance 0.85

0.88::acc(s14, flex_direction).
0.88::acc(s39, flex_direction).

0.92::true_val(flex_direction, progressive); 0.08::true_val(flex_direction, unk_flex_direction).

measured(s14, flex_direction, progressive).
measured(s39, flex_direction, progressive).

all_consistent(flex_direction) :-
    consistent(s14, flex_direction),
    consistent(s39, flex_direction).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, progressive)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr flex_rating_10_evo
% @type categorical
% @canonical true
% @original_name flex_rating_10_evo
% @values stiff=Stiff unk_flex_rating_10_evo=Unknown
% @importance 0.65

0.78::acc(s37, flex_rating_10_evo).

0.64::true_val(flex_rating_10_evo, stiff); 0.36::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).

measured(s37, flex_rating_10_evo, stiff).

all_consistent(flex_rating_10_evo) :-
    consistent(s37, flex_rating_10_evo).

evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, stiff)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values medium=Overall_medium_flex medium_stiff=Medium-stiff softer_than_expected=Softer_than_expected
% @importance 0.82

0.85::acc(s19, flex_feel).
0.93::acc(s_merchant, flex_feel).
0.60::acc(s40, flex_feel).

0.40::true_val(flex_feel, medium); 0.45::true_val(flex_feel, medium_stiff); 0.15::true_val(flex_feel, softer_than_expected).

measured(s19, flex_feel, medium).
measured(s_merchant, flex_feel, medium_stiff).
measured(s40, flex_feel, softer_than_expected).

all_consistent(flex_feel) :-
    consistent(s19, flex_feel),
    consistent(s_merchant, flex_feel),
    consistent(s40, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium)).
query(true_val(flex_feel, medium_stiff)).
query(true_val(flex_feel, softer_than_expected)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values softer_japanese_style=Softer_than_expected_Japanese_low_angle_pow_carve unk_user_review_forum=Unknown
% @importance 0.75

0.60::acc(s40, user_review_forum).

0.37::true_val(user_review_forum, softer_japanese_style); 0.63::true_val(user_review_forum, unk_user_review_forum).

measured(s40, user_review_forum, softer_japanese_style).

all_consistent(user_review_forum) :-
    consistent(s40, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, softer_japanese_style)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values aspen_slct=Aspen_SLCT_Core unk_core_material=Unknown
% @importance 0.78

0.93::acc(s_merchant, core_material).
0.80::acc(s38, core_material).

0.95::true_val(core_material, aspen_slct); 0.05::true_val(core_material, unk_core_material).

measured(s_merchant, core_material, aspen_slct).
measured(s38, core_material, aspen_slct).

all_consistent(core_material) :-
    consistent(s_merchant, core_material),
    (indep(s28), consistent(s38, core_material) ; \+indep(s28)).

evidence(all_consistent(core_material)).
query(true_val(core_material, aspen_slct)).
query(true_val(core_material, unk_core_material)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values fsc_certified=FSC_certified_wood_core unk_sustainability_certification=Unknown
% @importance 0.60

0.85::acc(s41, sustainability_certification).
0.82::acc(s42, sustainability_certification).

0.90::true_val(sustainability_certification, fsc_certified); 0.10::true_val(sustainability_certification, unk_sustainability_certification).

measured(s41, sustainability_certification, fsc_certified).
measured(s42, sustainability_certification, fsc_certified).

all_consistent(sustainability_certification) :-
    consistent(s41, sustainability_certification),
    consistent(s42, sustainability_certification).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, fsc_certified)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr core_material_aero
% @type categorical
% @canonical false
% @original_name core_material
% @values aero_core=Aero_Core_balsa_poplar unk_core_material_aero=Unknown
% @importance 0.70

0.75::acc(s38, core_material_aero).

0.53::true_val(core_material_aero, aero_core); 0.47::true_val(core_material_aero, unk_core_material_aero).

measured(s38, core_material_aero, aero_core).

all_consistent(core_material_aero) :-
    consistent(s38, core_material_aero).

evidence(all_consistent(core_material_aero)).
query(true_val(core_material_aero, aero_core)).
query(true_val(core_material_aero, unk_core_material_aero)).

% @attr core_profile
% @type categorical
% @canonical false
% @original_name Core profile
% @values popster=Popster_milled_thinner_underfoot unk_core_profile=Unknown
% @importance 0.65

0.82::acc(s42, core_profile).

0.63::true_val(core_profile, popster); 0.37::true_val(core_profile, unk_core_profile).

measured(s42, core_profile, popster).

all_consistent(core_profile) :-
    consistent(s42, core_profile).

evidence(all_consistent(core_profile)).
query(true_val(core_profile, popster)).
query(true_val(core_profile, unk_core_profile)).

% @attr core_material_general
% @type categorical
% @canonical false
% @original_name core_material
% @values full_length_fsc=Full_length_FSC_wood_core unk_core_material_general=Unknown
% @importance 0.65

0.82::acc(s42, core_material_general).

0.63::true_val(core_material_general, full_length_fsc); 0.37::true_val(core_material_general, unk_core_material_general).

measured(s42, core_material_general, full_length_fsc).

all_consistent(core_material_general) :-
    consistent(s42, core_material_general).

evidence(all_consistent(core_material_general)).
query(true_val(core_material_general, full_length_fsc)).
query(true_val(core_material_general, unk_core_material_general)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values ba_md_fiberglass=BA_MD_Fiberglass unk_laminate=Unknown
% @importance 0.88

0.93::acc(s_merchant, laminate).
0.82::acc(s21, laminate).

0.95::true_val(laminate, ba_md_fiberglass); 0.05::true_val(laminate, unk_laminate).

measured(s_merchant, laminate, ba_md_fiberglass).
measured(s21, laminate, ba_md_fiberglass).

all_consistent(laminate) :-
    consistent(s_merchant, laminate),
    (indep(s21), consistent(s21, laminate) ; \+indep(s21)).

evidence(all_consistent(laminate)).
query(true_val(laminate, ba_md_fiberglass)).
query(true_val(laminate, unk_laminate)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values ghost_carbon_beams_plus=Ghost_Carbon_Beams_Plus unk_construction_material_innovation=Unknown
% @importance 0.75

0.93::acc(s_merchant, construction_material_innovation).
0.82::acc(s42, construction_material_innovation).
0.72::acc(s24, construction_material_innovation).

0.95::true_val(construction_material_innovation, ghost_carbon_beams_plus); 0.05::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s_merchant, construction_material_innovation, ghost_carbon_beams_plus).
measured(s42, construction_material_innovation, ghost_carbon_beams_plus).
measured(s24, construction_material_innovation, ghost_carbon_beams_plus).

all_consistent(construction_material_innovation) :-
    consistent(s_merchant, construction_material_innovation),
    consistent(s42, construction_material_innovation),
    (indep(s24), consistent(s24, construction_material_innovation) ; \+indep(s24)).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, ghost_carbon_beams_plus)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr construction_material_innovation_basalt
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values bfx_basalt=BFX_Basalt_fibers unk_construction_material_innovation_basalt=Unknown
% @importance 0.50

0.55::acc(s30, construction_material_innovation_basalt).

0.39::true_val(construction_material_innovation_basalt, bfx_basalt); 0.61::true_val(construction_material_innovation_basalt, unk_construction_material_innovation_basalt).

measured(s30, construction_material_innovation_basalt, bfx_basalt).

all_consistent(construction_material_innovation_basalt) :-
    (indep(s30), consistent(s30, construction_material_innovation_basalt) ; \+indep(s30)).

evidence(all_consistent(construction_material_innovation_basalt)).
query(true_val(construction_material_innovation_basalt, bfx_basalt)).
query(true_val(construction_material_innovation_basalt, unk_construction_material_innovation_basalt)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values recycled_sintered_50=50pct_Recycled_Sintered_Base unk_base_material=Unknown
% @importance 0.78

0.93::acc(s_merchant, base_material).
0.75::acc(s38, base_material).

0.95::true_val(base_material, recycled_sintered_50); 0.05::true_val(base_material, unk_base_material).

measured(s_merchant, base_material, recycled_sintered_50).
measured(s38, base_material, recycled_sintered_50).

all_consistent(base_material) :-
    consistent(s_merchant, base_material),
    (indep(s28), consistent(s38, base_material) ; \+indep(s28)).

evidence(all_consistent(base_material)).
query(true_val(base_material, recycled_sintered_50)).
query(true_val(base_material, unk_base_material)).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values sintered_eg=Sintered_EG unk_base_type=Unknown
% @importance 0.70

0.75::acc(s38, base_type).

0.53::true_val(base_type, sintered_eg); 0.47::true_val(base_type, unk_base_type).

measured(s38, base_type, sintered_eg).

all_consistent(base_type) :-
    consistent(s38, base_type).

evidence(all_consistent(base_type)).
query(true_val(base_type, sintered_eg)).
query(true_val(base_type, unk_base_type)).

% @attr base_finish
% @type categorical
% @canonical false
% @original_name Base finish
% @values fine_stone=Fine_Stone_Finish unk_base_finish=Unknown
% @importance 0.78

0.93::acc(s_merchant, base_finish).
0.75::acc(s38, base_finish).

0.95::true_val(base_finish, fine_stone); 0.05::true_val(base_finish, unk_base_finish).

measured(s_merchant, base_finish, fine_stone).
measured(s38, base_finish, fine_stone).

all_consistent(base_finish) :-
    consistent(s_merchant, base_finish),
    (indep(s28), consistent(s38, base_finish) ; \+indep(s28)).

evidence(all_consistent(base_finish)).
query(true_val(base_finish, fine_stone)).
query(true_val(base_finish, unk_base_finish)).

% @attr wax
% @type categorical
% @canonical false
% @original_name Wax
% @values natural_wax=Natural_paraffin_free_wax unk_wax=Unknown
% @importance 0.45

0.95::acc(s43, wax).

0.90::true_val(wax, natural_wax); 0.10::true_val(wax, unk_wax).

measured(s43, wax, natural_wax).

all_consistent(wax) :-
    consistent(s43, wax).

evidence(all_consistent(wax)).
query(true_val(wax, natural_wax)).
query(true_val(wax, unk_wax)).

% @attr base_colour_variation
% @type categorical
% @canonical false
% @original_name Base colour variation
% @values flip_flop=Flip_Flop_Base_two_color_variations unk_base_colour_variation=Unknown
% @importance 0.30

0.72::acc(s33, base_colour_variation).

0.51::true_val(base_colour_variation, flip_flop); 0.49::true_val(base_colour_variation, unk_base_colour_variation).

measured(s33, base_colour_variation, flip_flop).

all_consistent(base_colour_variation) :-
    (indep(s33), consistent(s33, base_colour_variation) ; \+indep(s33)).

evidence(all_consistent(base_colour_variation)).
query(true_val(base_colour_variation, flip_flop)).
query(true_val(base_colour_variation, unk_base_colour_variation)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values recycled_abs_66=66pct_Recycled_ABS recycled_abs_100=100pct_Recycled_ABS
% @importance 0.68

0.93::acc(s_merchant, sidewall_material).
0.78::acc(s42, sidewall_material).

0.75::true_val(sidewall_material, recycled_abs_66); 0.25::true_val(sidewall_material, recycled_abs_100).

measured(s_merchant, sidewall_material, recycled_abs_66).
measured(s42, sidewall_material, recycled_abs_100).

all_consistent(sidewall_material) :-
    consistent(s_merchant, sidewall_material),
    consistent(s42, sidewall_material).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, recycled_abs_66)).
query(true_val(sidewall_material, recycled_abs_100)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values recycled_aluminum_20=20pct_recycled_aluminum_edges unk_edge_technology=Unknown
% @importance 0.65

0.82::acc(s42, edge_technology).

0.63::true_val(edge_technology, recycled_aluminum_20); 0.37::true_val(edge_technology, unk_edge_technology).

measured(s42, edge_technology, recycled_aluminum_20).

all_consistent(edge_technology) :-
    consistent(s42, edge_technology).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, recycled_aluminum_20)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr resin
% @type categorical
% @canonical true
% @original_name resin
% @values bio_based_30=30pct_Bio_Based_Resin unk_resin=Unknown
% @importance 0.78

0.93::acc(s_merchant, resin).
0.82::acc(s42, resin).

0.95::true_val(resin, bio_based_30); 0.05::true_val(resin, unk_resin).

measured(s_merchant, resin, bio_based_30).
measured(s42, resin, bio_based_30).

all_consistent(resin) :-
    consistent(s_merchant, resin),
    consistent(s42, resin).

evidence(all_consistent(resin)).
query(true_val(resin, bio_based_30)).
query(true_val(resin, unk_resin)).

% @attr topsheet
% @type categorical
% @canonical true
% @original_name topsheet
% @values olive_wood_veneer=Olive_wood_veneer unk_topsheet=Unknown
% @importance 0.65

0.82::acc(s42, topsheet).

0.63::true_val(topsheet, olive_wood_veneer); 0.37::true_val(topsheet, unk_topsheet).

measured(s42, topsheet, olive_wood_veneer).

all_consistent(topsheet) :-
    consistent(s42, topsheet).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, olive_wood_veneer)).
query(true_val(topsheet, unk_topsheet)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 0.85

0.93::acc(s_merchant, mounting_pattern).
0.80::acc(s7, mounting_pattern).

0.95::true_val(mounting_pattern, inserts_2x4); 0.05::true_val(mounting_pattern, unk_mounting_pattern).

measured(s_merchant, mounting_pattern, inserts_2x4).
measured(s7, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :-
    consistent(s_merchant, mounting_pattern),
    (indep(s7), consistent(s7, mounting_pattern) ; \+indep(s7)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr binding_compatibility
% @type categorical
% @canonical false
% @original_name binding_compatibility
% @values standard_most=Standard_compatible_most_bindings unk_binding_compatibility=Unknown
% @importance 0.85

0.80::acc(s7, binding_compatibility).

0.69::true_val(binding_compatibility, standard_most); 0.31::true_val(binding_compatibility, unk_binding_compatibility).

measured(s7, binding_compatibility, standard_most).

all_consistent(binding_compatibility) :-
    (indep(s7), consistent(s7, binding_compatibility) ; \+indep(s7)).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, standard_most)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

% @attr effective_edge_146
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 146cm
% @values v105_7=105.7 unk_effective_edge_146=Unknown
% @importance 0.85

0.93::acc(s_merchant, effective_edge_146).

0.95::true_val(effective_edge_146, v105_7); 0.05::true_val(effective_edge_146, unk_effective_edge_146).

measured(s_merchant, effective_edge_146, v105_7).

all_consistent(effective_edge_146) :-
    consistent(s_merchant, effective_edge_146).

evidence(all_consistent(effective_edge_146)).
query(true_val(effective_edge_146, v105_7)).
query(true_val(effective_edge_146, unk_effective_edge_146)).

% @attr effective_edge_149
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 149cm
% @values v108_1=108.1 unk_effective_edge_149=Unknown
% @importance 0.85

0.93::acc(s_merchant, effective_edge_149).

0.95::true_val(effective_edge_149, v108_1); 0.05::true_val(effective_edge_149, unk_effective_edge_149).

measured(s_merchant, effective_edge_149, v108_1).

all_consistent(effective_edge_149) :-
    consistent(s_merchant, effective_edge_149).

evidence(all_consistent(effective_edge_149)).
query(true_val(effective_edge_149, v108_1)).
query(true_val(effective_edge_149, unk_effective_edge_149)).

% @attr effective_edge_153
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 153cm
% @values v112_0=112.0 unk_effective_edge_153=Unknown
% @importance 0.85

0.93::acc(s_merchant, effective_edge_153).

0.95::true_val(effective_edge_153, v112_0); 0.05::true_val(effective_edge_153, unk_effective_edge_153).

measured(s_merchant, effective_edge_153, v112_0).

all_consistent(effective_edge_153) :-
    consistent(s_merchant, effective_edge_153).

evidence(all_consistent(effective_edge_153)).
query(true_val(effective_edge_153, v112_0)).
query(true_val(effective_edge_153, unk_effective_edge_153)).

% @attr effective_edge_157
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 157cm
% @values v115_3=115.3 unk_effective_edge_157=Unknown
% @importance 0.85

0.93::acc(s_merchant, effective_edge_157).

0.95::true_val(effective_edge_157, v115_3); 0.05::true_val(effective_edge_157, unk_effective_edge_157).

measured(s_merchant, effective_edge_157, v115_3).

all_consistent(effective_edge_157) :-
    consistent(s_merchant, effective_edge_157).

evidence(all_consistent(effective_edge_157)).
query(true_val(effective_edge_157, v115_3)).
query(true_val(effective_edge_157, unk_effective_edge_157)).

% @attr effective_edge_160
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 160cm
% @values v117_6=117.6 unk_effective_edge_160=Unknown
% @importance 0.85

0.93::acc(s_merchant, effective_edge_160).

0.95::true_val(effective_edge_160, v117_6); 0.05::true_val(effective_edge_160, unk_effective_edge_160).

measured(s_merchant, effective_edge_160, v117_6).

all_consistent(effective_edge_160) :-
    consistent(s_merchant, effective_edge_160).

evidence(all_consistent(effective_edge_160)).
query(true_val(effective_edge_160, v117_6)).
query(true_val(effective_edge_160, unk_effective_edge_160)).

% @attr effective_edge_163
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 163cm
% @values v119_9=119.9 unk_effective_edge_163=Unknown
% @importance 0.85

0.93::acc(s_merchant, effective_edge_163).

0.95::true_val(effective_edge_163, v119_9); 0.05::true_val(effective_edge_163, unk_effective_edge_163).

measured(s_merchant, effective_edge_163, v119_9).

all_consistent(effective_edge_163) :-
    consistent(s_merchant, effective_edge_163).

evidence(all_consistent(effective_edge_163)).
query(true_val(effective_edge_163, v119_9)).
query(true_val(effective_edge_163, unk_effective_edge_163)).

% @attr waist_width_146
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 146cm
% @values v25_1=25.1 unk_waist_width_146=Unknown
% @importance 0.85

0.93::acc(s_merchant, waist_width_146).

0.95::true_val(waist_width_146, v25_1); 0.05::true_val(waist_width_146, unk_waist_width_146).

measured(s_merchant, waist_width_146, v25_1).

all_consistent(waist_width_146) :-
    consistent(s_merchant, waist_width_146).

evidence(all_consistent(waist_width_146)).
query(true_val(waist_width_146, v25_1)).
query(true_val(waist_width_146, unk_waist_width_146)).

% @attr waist_width_149
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 149cm
% @values v25_4=25.4 unk_waist_width_149=Unknown
% @importance 0.85

0.93::acc(s_merchant, waist_width_149).

0.95::true_val(waist_width_149, v25_4); 0.05::true_val(waist_width_149, unk_waist_width_149).

measured(s_merchant, waist_width_149, v25_4).

all_consistent(waist_width_149) :-
    consistent(s_merchant, waist_width_149).

evidence(all_consistent(waist_width_149)).
query(true_val(waist_width_149, v25_4)).
query(true_val(waist_width_149, unk_waist_width_149)).

% @attr waist_width_153
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 153cm
% @values v26_3=26.3 unk_waist_width_153=Unknown
% @importance 0.85

0.93::acc(s_merchant, waist_width_153).

0.95::true_val(waist_width_153, v26_3); 0.05::true_val(waist_width_153, unk_waist_width_153).

measured(s_merchant, waist_width_153, v26_3).

all_consistent(waist_width_153) :-
    consistent(s_merchant, waist_width_153).

evidence(all_consistent(waist_width_153)).
query(true_val(waist_width_153, v26_3)).
query(true_val(waist_width_153, unk_waist_width_153)).

% @attr waist_width_157
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 157cm
% @values v26_6=26.6 unk_waist_width_157=Unknown
% @importance 0.85

0.93::acc(s_merchant, waist_width_157).

0.95::true_val(waist_width_157, v26_6); 0.05::true_val(waist_width_157, unk_waist_width_157).

measured(s_merchant, waist_width_157, v26_6).

all_consistent(waist_width_157) :-
    consistent(s_merchant, waist_width_157).

evidence(all_consistent(waist_width_157)).
query(true_val(waist_width_157, v26_6)).
query(true_val(waist_width_157, unk_waist_width_157)).

% @attr waist_width_160
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 160cm
% @values v26_9=26.9 unk_waist_width_160=Unknown
% @importance 0.85

0.93::acc(s_merchant, waist_width_160).

0.95::true_val(waist_width_160, v26_9); 0.05::true_val(waist_width_160, unk_waist_width_160).

measured(s_merchant, waist_width_160, v26_9).

all_consistent(waist_width_160) :-
    consistent(s_merchant, waist_width_160).

evidence(all_consistent(waist_width_160)).
query(true_val(waist_width_160, v26_9)).
query(true_val(waist_width_160, unk_waist_width_160)).

% @attr waist_width_163
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 163cm
% @values v27_2=27.2 unk_waist_width_163=Unknown
% @importance 0.85

0.93::acc(s_merchant, waist_width_163).

0.95::true_val(waist_width_163, v27_2); 0.05::true_val(waist_width_163, unk_waist_width_163).

measured(s_merchant, waist_width_163, v27_2).

all_consistent(waist_width_163) :-
    consistent(s_merchant, waist_width_163).

evidence(all_consistent(waist_width_163)).
query(true_val(waist_width_163, v27_2)).
query(true_val(waist_width_163, unk_waist_width_163)).

% @attr tip_tail_width_size
% @type numeric
% @unit cm
% @canonical true
% @original_name tip_tail_width_size
% @values v32_0=32.0 unk_tip_tail_width_size=Unknown
% @importance 0.85

0.93::acc(s_merchant, tip_tail_width_size).

0.95::true_val(tip_tail_width_size, v32_0); 0.05::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s_merchant, tip_tail_width_size, v32_0).

all_consistent(tip_tail_width_size) :-
    consistent(s_merchant, tip_tail_width_size).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v32_0)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr tip_width_146
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size
% @values v30_0=30.0 unk_tip_width_146=Unknown
% @importance 0.85

0.93::acc(s_merchant, tip_width_146).

0.95::true_val(tip_width_146, v30_0); 0.05::true_val(tip_width_146, unk_tip_width_146).

measured(s_merchant, tip_width_146, v30_0).

all_consistent(tip_width_146) :-
    consistent(s_merchant, tip_width_146).

evidence(all_consistent(tip_width_146)).
query(true_val(tip_width_146, v30_0)).
query(true_val(tip_width_146, unk_tip_width_146)).

% @attr tip_width_149
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size
% @values v30_4=30.4 unk_tip_width_149=Unknown
% @importance 0.85

0.93::acc(s_merchant, tip_width_149).

0.95::true_val(tip_width_149, v30_4); 0.05::true_val(tip_width_149, unk_tip_width_149).

measured(s_merchant, tip_width_149, v30_4).

all_consistent(tip_width_149) :-
    consistent(s_merchant, tip_width_149).

evidence(all_consistent(tip_width_149)).
query(true_val(tip_width_149, v30_4)).
query(true_val(tip_width_149, unk_tip_width_149)).

% @attr tip_width_153
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size
% @values v31_4=31.4 unk_tip_width_153=Unknown
% @importance 0.85

0.93::acc(s_merchant, tip_width_153).

0.95::true_val(tip_width_153, v31_4); 0.05::true_val(tip_width_153, unk_tip_width_153).

measured(s_merchant, tip_width_153, v31_4).

all_consistent(tip_width_153) :-
    consistent(s_merchant, tip_width_153).

evidence(all_consistent(tip_width_153)).
query(true_val(tip_width_153, v31_4)).
query(true_val(tip_width_153, unk_tip_width_153)).

% @attr tip_width_160
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size
% @values v32_5=32.5 unk_tip_width_160=Unknown
% @importance 0.85

0.93::acc(s_merchant, tip_width_160).

0.95::true_val(tip_width_160, v32_5); 0.05::true_val(tip_width_160, unk_tip_width_160).

measured(s_merchant, tip_width_160, v32_5).

all_consistent(tip_width_160) :-
    consistent(s_merchant, tip_width_160).

evidence(all_consistent(tip_width_160)).
query(true_val(tip_width_160, v32_5)).
query(true_val(tip_width_160, unk_tip_width_160)).

% @attr tip_width_163
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size
% @values v33_2=33.2 unk_tip_width_163=Unknown
% @importance 0.85

0.93::acc(s_merchant, tip_width_163).

0.95::true_val(tip_width_163, v33_2); 0.05::true_val(tip_width_163, unk_tip_width_163).

measured(s_merchant, tip_width_163, v33_2).

all_consistent(tip_width_163) :-
    consistent(s_merchant, tip_width_163).

evidence(all_consistent(tip_width_163)).
query(true_val(tip_width_163, v33_2)).
query(true_val(tip_width_163, unk_tip_width_163)).

% @attr tail_width_146
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size
% @values v28_6=28.6 unk_tail_width_146=Unknown
% @importance 0.85

0.93::acc(s_merchant, tail_width_146).

0.95::true_val(tail_width_146, v28_6); 0.05::true_val(tail_width_146, unk_tail_width_146).

measured(s_merchant, tail_width_146, v28_6).

all_consistent(tail_width_146) :-
    consistent(s_merchant, tail_width_146).

evidence(all_consistent(tail_width_146)).
query(true_val(tail_width_146, v28_6)).
query(true_val(tail_width_146, unk_tail_width_146)).

% @attr tail_width_149
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size
% @values v29_0=29.0 unk_tail_width_149=Unknown
% @importance 0.85

0.93::acc(s_merchant, tail_width_149).

0.95::true_val(tail_width_149, v29_0); 0.05::true_val(tail_width_149, unk_tail_width_149).

measured(s_merchant, tail_width_149, v29_0).

all_consistent(tail_width_149) :-
    consistent(s_merchant, tail_width_149).

evidence(all_consistent(tail_width_149)).
query(true_val(tail_width_149, v29_0)).
query(true_val(tail_width_149, unk_tail_width_149)).

% @attr tail_width_153
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size
% @values v29_6=29.6 unk_tail_width_153=Unknown
% @importance 0.85

0.93::acc(s_merchant, tail_width_153).

0.95::true_val(tail_width_153, v29_6); 0.05::true_val(tail_width_153, unk_tail_width_153).

measured(s_merchant, tail_width_153, v29_6).

all_consistent(tail_width_153) :-
    consistent(s_merchant, tail_width_153).

evidence(all_consistent(tail_width_153)).
query(true_val(tail_width_153, v29_6)).
query(true_val(tail_width_153, unk_tail_width_153)).

% @attr tail_width_157
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size
% @values v30_0=30.0 unk_tail_width_157=Unknown
% @importance 0.85

0.93::acc(s_merchant, tail_width_157).

0.95::true_val(tail_width_157, v30_0); 0.05::true_val(tail_width_157, unk_tail_width_157).

measured(s_merchant, tail_width_157, v30_0).

all_consistent(tail_width_157) :-
    consistent(s_merchant, tail_width_157).

evidence(all_consistent(tail_width_157)).
query(true_val(tail_width_157, v30_0)).
query(true_val(tail_width_157, unk_tail_width_157)).

% @attr tail_width_160
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size
% @values v30_5=30.5 unk_tail_width_160=Unknown
% @importance 0.85

0.93::acc(s_merchant, tail_width_160).

0.95::true_val(tail_width_160, v30_5); 0.05::true_val(tail_width_160, unk_tail_width_160).

measured(s_merchant, tail_width_160, v30_5).

all_consistent(tail_width_160) :-
    consistent(s_merchant, tail_width_160).

evidence(all_consistent(tail_width_160)).
query(true_val(tail_width_160, v30_5)).
query(true_val(tail_width_160, unk_tail_width_160)).

% @attr tail_width_163
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size
% @values v31_0=31.0 unk_tail_width_163=Unknown
% @importance 0.85

0.93::acc(s_merchant, tail_width_163).

0.95::true_val(tail_width_163, v31_0); 0.05::true_val(tail_width_163, unk_tail_width_163).

measured(s_merchant, tail_width_163, v31_0).

all_consistent(tail_width_163) :-
    consistent(s_merchant, tail_width_163).

evidence(all_consistent(tail_width_163)).
query(true_val(tail_width_163, v31_0)).
query(true_val(tail_width_163, unk_tail_width_163)).

% @attr stance_width_range_size
% @type numeric
% @unit cm
% @canonical true
% @original_name stance_width_range_size
% @values v55_0=55.0 unk_stance_width_range_size=Unknown
% @importance 0.85

0.93::acc(s_merchant, stance_width_range_size).

0.95::true_val(stance_width_range_size, v55_0); 0.05::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s_merchant, stance_width_range_size, v55_0).

all_consistent(stance_width_range_size) :-
    consistent(s_merchant, stance_width_range_size).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v55_0)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr stance_width_range_size_146
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size
% @values v52_0=52.0 unk_stance_width_range_size_146=Unknown
% @importance 0.85

0.93::acc(s_merchant, stance_width_range_size_146).

0.95::true_val(stance_width_range_size_146, v52_0); 0.05::true_val(stance_width_range_size_146, unk_stance_width_range_size_146).

measured(s_merchant, stance_width_range_size_146, v52_0).

all_consistent(stance_width_range_size_146) :-
    consistent(s_merchant, stance_width_range_size_146).

evidence(all_consistent(stance_width_range_size_146)).
query(true_val(stance_width_range_size_146, v52_0)).
query(true_val(stance_width_range_size_146, unk_stance_width_range_size_146)).

% @attr stance_width_range_size_149
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size
% @values v53_0=53.0 unk_stance_width_range_size_149=Unknown
% @importance 0.85

0.93::acc(s_merchant, stance_width_range_size_149).

0.95::true_val(stance_width_range_size_149, v53_0); 0.05::true_val(stance_width_range_size_149, unk_stance_width_range_size_149).

measured(s_merchant, stance_width_range_size_149, v53_0).

all_consistent(stance_width_range_size_149) :-
    consistent(s_merchant, stance_width_range_size_149).

evidence(all_consistent(stance_width_range_size_149)).
query(true_val(stance_width_range_size_149, v53_0)).
query(true_val(stance_width_range_size_149, unk_stance_width_range_size_149)).

% @attr stance_width_range_size_153
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size
% @values v54_0=54.0 unk_stance_width_range_size_153=Unknown
% @importance 0.85

0.93::acc(s_merchant, stance_width_range_size_153).

0.95::true_val(stance_width_range_size_153, v54_0); 0.05::true_val(stance_width_range_size_153, unk_stance_width_range_size_153).

measured(s_merchant, stance_width_range_size_153, v54_0).

all_consistent(stance_width_range_size_153) :-
    consistent(s_merchant, stance_width_range_size_153).

evidence(all_consistent(stance_width_range_size_153)).
query(true_val(stance_width_range_size_153, v54_0)).
query(true_val(stance_width_range_size_153, unk_stance_width_range_size_153)).

% @attr stance_width_range_size_160
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size
% @values v56_0=56.0 unk_stance_width_range_size_160=Unknown
% @importance 0.85

0.93::acc(s_merchant, stance_width_range_size_160).

0.95::true_val(stance_width_range_size_160, v56_0); 0.05::true_val(stance_width_range_size_160, unk_stance_width_range_size_160).

measured(s_merchant, stance_width_range_size_160, v56_0).

all_consistent(stance_width_range_size_160) :-
    consistent(s_merchant, stance_width_range_size_160).

evidence(all_consistent(stance_width_range_size_160)).
query(true_val(stance_width_range_size_160, v56_0)).
query(true_val(stance_width_range_size_160, unk_stance_width_range_size_160)).

% @attr stance_width_range_size_163
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size
% @values v57_0=57.0 unk_stance_width_range_size_163=Unknown
% @importance 0.85

0.93::acc(s_merchant, stance_width_range_size_163).

0.95::true_val(stance_width_range_size_163, v57_0); 0.05::true_val(stance_width_range_size_163, unk_stance_width_range_size_163).

measured(s_merchant, stance_width_range_size_163, v57_0).

all_consistent(stance_width_range_size_163) :-
    consistent(s_merchant, stance_width_range_size_163).

evidence(all_consistent(stance_width_range_size_163)).
query(true_val(stance_width_range_size_163, v57_0)).
query(true_val(stance_width_range_size_163, unk_stance_width_range_size_163)).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size
% @values r60_95=60-95kg unk_recommended_weight_range_size=Unknown
% @importance 0.85

0.93::acc(s_merchant, recommended_weight_range_size).

0.95::true_val(recommended_weight_range_size, r60_95); 0.05::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s_merchant, recommended_weight_range_size, r60_95).

all_consistent(recommended_weight_range_size) :-
    consistent(s_merchant, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, r60_95)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr recommended_weight_range_size_146
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values r50_75=50-75kg unk_recommended_weight_range_size_146=Unknown
% @importance 0.85

0.93::acc(s_merchant, recommended_weight_range_size_146).

0.95::true_val(recommended_weight_range_size_146, r50_75); 0.05::true_val(recommended_weight_range_size_146, unk_recommended_weight_range_size_146).

measured(s_merchant, recommended_weight_range_size_146, r50_75).

all_consistent(recommended_weight_range_size_146) :-
    consistent(s_merchant, recommended_weight_range_size_146).

evidence(all_consistent(recommended_weight_range_size_146)).
query(true_val(recommended_weight_range_size_146, r50_75)).
query(true_val(recommended_weight_range_size_146, unk_recommended_weight_range_size_146)).

% @attr recommended_weight_range_size_149
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values r50_80=50-80kg unk_recommended_weight_range_size_149=Unknown
% @importance 0.85

0.93::acc(s_merchant, recommended_weight_range_size_149).

0.95::true_val(recommended_weight_range_size_149, r50_80); 0.05::true_val(recommended_weight_range_size_149, unk_recommended_weight_range_size_149).

measured(s_merchant, recommended_weight_range_size_149, r50_80).

all_consistent(recommended_weight_range_size_149) :-
    consistent(s_merchant, recommended_weight_range_size_149).

evidence(all_consistent(recommended_weight_range_size_149)).
query(true_val(recommended_weight_range_size_149, r50_80)).
query(true_val(recommended_weight_range_size_149, unk_recommended_weight_range_size_149)).

% @attr recommended_weight_range_size_153
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values r60_90=60-90kg unk_recommended_weight_range_size_153=Unknown
% @importance 0.85

0.93::acc(s_merchant, recommended_weight_range_size_153).

0.95::true_val(recommended_weight_range_size_153, r60_90); 0.05::true_val(recommended_weight_range_size_153, unk_recommended_weight_range_size_153).

measured(s_merchant, recommended_weight_range_size_153, r60_90).

all_consistent(recommended_weight_range_size_153) :-
    consistent(s_merchant, recommended_weight_range_size_153).

evidence(all_consistent(recommended_weight_range_size_153)).
query(true_val(recommended_weight_range_size_153, r60_90)).
query(true_val(recommended_weight_range_size_153, unk_recommended_weight_range_size_153)).

% @attr recommended_weight_range_size_160
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values r70_95=70-95kg unk_recommended_weight_range_size_160=Unknown
% @importance 0.85

0.93::acc(s_merchant, recommended_weight_range_size_160).

0.95::true_val(recommended_weight_range_size_160, r70_95); 0.05::true_val(recommended_weight_range_size_160, unk_recommended_weight_range_size_160).

measured(s_merchant, recommended_weight_range_size_160, r70_95).

all_consistent(recommended_weight_range_size_160) :-
    consistent(s_merchant, recommended_weight_range_size_160).

evidence(all_consistent(recommended_weight_range_size_160)).
query(true_val(recommended_weight_range_size_160, r70_95)).
query(true_val(recommended_weight_range_size_160, unk_recommended_weight_range_size_160)).

% @attr recommended_weight_range_size_163
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values r70_105=70-105kg unk_recommended_weight_range_size_163=Unknown
% @importance 0.85

0.93::acc(s_merchant, recommended_weight_range_size_163).

0.95::true_val(recommended_weight_range_size_163, r70_105); 0.05::true_val(recommended_weight_range_size_163, unk_recommended_weight_range_size_163).

measured(s_merchant, recommended_weight_range_size_163, r70_105).

all_consistent(recommended_weight_range_size_163) :-
    consistent(s_merchant, recommended_weight_range_size_163).

evidence(all_consistent(recommended_weight_range_size_163)).
query(true_val(recommended_weight_range_size_163, r70_105)).
query(true_val(recommended_weight_range_size_163, unk_recommended_weight_range_size_163)).

% @attr recommended_boot_size_153
% @type categorical
% @canonical false
% @original_name Recommended boot size 153cm
% @values us13_under=US_13_and_under unk_recommended_boot_size_153=Unknown
% @importance 0.90

0.85::acc(s21, recommended_boot_size_153).

0.75::true_val(recommended_boot_size_153, us13_under); 0.25::true_val(recommended_boot_size_153, unk_recommended_boot_size_153).

measured(s21, recommended_boot_size_153, us13_under).

all_consistent(recommended_boot_size_153) :-
    (indep(s21), consistent(s21, recommended_boot_size_153) ; \+indep(s21)).

evidence(all_consistent(recommended_boot_size_153)).
query(true_val(recommended_boot_size_153, us13_under)).
query(true_val(recommended_boot_size_153, unk_recommended_boot_size_153)).

% @attr recommended_boot_size_157
% @type categorical
% @canonical false
% @original_name Recommended boot size 157cm
% @values us14_under=US_14_and_under unk_recommended_boot_size_157=Unknown
% @importance 0.90

0.85::acc(s21, recommended_boot_size_157).

0.75::true_val(recommended_boot_size_157, us14_under); 0.25::true_val(recommended_boot_size_157, unk_recommended_boot_size_157).

measured(s21, recommended_boot_size_157, us14_under).

all_consistent(recommended_boot_size_157) :-
    (indep(s21), consistent(s21, recommended_boot_size_157) ; \+indep(s21)).

evidence(all_consistent(recommended_boot_size_157)).
query(true_val(recommended_boot_size_157, us14_under)).
query(true_val(recommended_boot_size_157, unk_recommended_boot_size_157)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate_advanced=Intermediate-Advanced advanced_expert=Advanced_to_Expert
% @importance 0.78

0.90::acc(s_merchant, rider_level).
0.82::acc(s7, rider_level).
0.80::acc(s15, rider_level).

0.35::true_val(rider_level, intermediate_advanced); 0.65::true_val(rider_level, advanced_expert).

measured(s_merchant, rider_level, intermediate_advanced).
measured(s7, rider_level, advanced_expert).
measured(s15, rider_level, advanced_expert).

all_consistent(rider_level) :-
    consistent(s_merchant, rider_level),
    (indep(s7), consistent(s7, rider_level) ; \+indep(s7)),
    (indep(s15), consistent(s15, rider_level) ; \+indep(s15)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate_advanced)).
query(true_val(rider_level, advanced_expert)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values adv_expert=Advanced_to_Expert unk_skill_level_recommendation=Unknown
% @importance 0.78

0.82::acc(s7, skill_level_recommendation).
0.80::acc(s15, skill_level_recommendation).

0.88::true_val(skill_level_recommendation, adv_expert); 0.12::true_val(skill_level_recommendation, unk_skill_level_recommendation).

measured(s7, skill_level_recommendation, adv_expert).
measured(s15, skill_level_recommendation, adv_expert).

all_consistent(skill_level_recommendation) :-
    (indep(s7), consistent(s7, skill_level_recommendation) ; \+indep(s7)),
    (indep(s15), consistent(s15, skill_level_recommendation) ; \+indep(s15)).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, adv_expert)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

% @attr skill_level_recommendation_description
% @type categorical
% @canonical false
% @original_name skill_level_recommendation
% @values charge_hard=Riders_who_charge_hard_ride_fast_outside_groomers unk_skill_level_recommendation_description=Unknown
% @importance 0.85

0.80::acc(s13, skill_level_recommendation_description).

0.65::true_val(skill_level_recommendation_description, charge_hard); 0.35::true_val(skill_level_recommendation_description, unk_skill_level_recommendation_description).

measured(s13, skill_level_recommendation_description, charge_hard).

all_consistent(skill_level_recommendation_description) :-
    (indep(s13), consistent(s13, skill_level_recommendation_description) ; \+indep(s13)).

evidence(all_consistent(skill_level_recommendation_description)).
query(true_val(skill_level_recommendation_description, charge_hard)).
query(true_val(skill_level_recommendation_description, unk_skill_level_recommendation_description)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values not_bigger_lines=Not_first_choice_bigger_lines_variable_snow unk_negative_aspect=Unknown
% @importance 0.88

0.88::acc(s45, negative_aspect).

0.78::true_val(negative_aspect, not_bigger_lines); 0.22::true_val(negative_aspect, unk_negative_aspect).

measured(s45, negative_aspect, not_bigger_lines).

all_consistent(negative_aspect) :-
    consistent(s45, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, not_bigger_lines)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_park
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values not_for_park=Not_for_park_rails_jumps_presses_switch unk_negative_aspect_park=Unknown
% @importance 0.85

0.80::acc(s13, negative_aspect_park).

0.65::true_val(negative_aspect_park, not_for_park); 0.35::true_val(negative_aspect_park, unk_negative_aspect_park).

measured(s13, negative_aspect_park, not_for_park).

all_consistent(negative_aspect_park) :-
    (indep(s13), consistent(s13, negative_aspect_park) ; \+indep(s13)).

evidence(all_consistent(negative_aspect_park)).
query(true_val(negative_aspect_park, not_for_park)).
query(true_val(negative_aspect_park, unk_negative_aspect_park)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values all_mtn_freeride_groomers_pow=All_Mountain_Freeride_Groomers_Powder powder_variable_groomed=Powder_variable_groomed carving_deep_snow=Carving_precision_deep_snow_float
% @importance 0.77

0.93::acc(s_merchant, terrain_suitability).
0.80::acc(s15, terrain_suitability).
0.82::acc(s7, terrain_suitability).

0.55::true_val(terrain_suitability, all_mtn_freeride_groomers_pow); 0.25::true_val(terrain_suitability, powder_variable_groomed); 0.20::true_val(terrain_suitability, carving_deep_snow).

measured(s_merchant, terrain_suitability, all_mtn_freeride_groomers_pow).
measured(s15, terrain_suitability, powder_variable_groomed).
measured(s7, terrain_suitability, carving_deep_snow).

all_consistent(terrain_suitability) :-
    consistent(s_merchant, terrain_suitability),
    (indep(s15), consistent(s15, terrain_suitability) ; \+indep(s15)),
    (indep(s7), consistent(s7, terrain_suitability) ; \+indep(s7)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, all_mtn_freeride_groomers_pow)).
query(true_val(terrain_suitability, powder_variable_groomed)).
query(true_val(terrain_suitability, carving_deep_snow)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values carving_freeride=Carving_Freeride unk_riding_style=Unknown
% @importance 0.90

0.85::acc(s35, riding_style).

0.72::true_val(riding_style, carving_freeride); 0.28::true_val(riding_style, unk_riding_style).

measured(s35, riding_style, carving_freeride).

all_consistent(riding_style) :-
    consistent(s35, riding_style).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, carving_freeride)).
query(true_val(riding_style, unk_riding_style)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values two_year_limited=2_year_limited_warranty unk_warranty=Unknown
% @importance 0.85

0.82::acc(s7, warranty).

0.69::true_val(warranty, two_year_limited); 0.31::true_val(warranty, unk_warranty).

measured(s7, warranty, two_year_limited).

all_consistent(warranty) :-
    (indep(s7), consistent(s7, warranty) ; \+indep(s7)).

evidence(all_consistent(warranty)).
query(true_val(warranty, two_year_limited)).
query(true_val(warranty, unk_warranty)).

% @attr award
% @type categorical
% @canonical false
% @original_name Award
% @values platinum_pick_2026=Snowboard_Magazine_Platinum_Pick_2026 unk_award=Unknown
% @importance 0.85

0.88::acc(s19, award).

0.81::true_val(award, platinum_pick_2026); 0.19::true_val(award, unk_award).

measured(s19, award, platinum_pick_2026).

all_consistent(award) :-
    consistent(s19, award).

evidence(all_consistent(award)).
query(true_val(award, platinum_pick_2026)).
query(true_val(award, unk_award)).

% @attr review_snowboard_mag
% @type categorical
% @canonical false
% @original_name Review (Snowboard Magazine)
% @values thrives_lower_angle=Thrives_lower_angle_terrain_casual_cruising unk_review_snowboard_mag=Unknown
% @importance 0.85

0.88::acc(s19, review_snowboard_mag).

0.81::true_val(review_snowboard_mag, thrives_lower_angle); 0.19::true_val(review_snowboard_mag, unk_review_snowboard_mag).

measured(s19, review_snowboard_mag, thrives_lower_angle).

all_consistent(review_snowboard_mag) :-
    consistent(s19, review_snowboard_mag).

evidence(all_consistent(review_snowboard_mag)).
query(true_val(review_snowboard_mag, thrives_lower_angle)).
query(true_val(review_snowboard_mag, unk_review_snowboard_mag)).

% @attr review_tsj_rips
% @type categorical
% @canonical false
% @original_name Review (The Snowboarder's Journal)
% @values rips_edge_hold=Rips_great_edge_hold_forgiving_playful unk_review_tsj_rips=Unknown
% @importance 0.90

0.88::acc(s14, review_tsj_rips).

0.77::true_val(review_tsj_rips, rips_edge_hold); 0.23::true_val(review_tsj_rips, unk_review_tsj_rips).

measured(s14, review_tsj_rips, rips_edge_hold).

all_consistent(review_tsj_rips) :-
    consistent(s14, review_tsj_rips).

evidence(all_consistent(review_tsj_rips)).
query(true_val(review_tsj_rips, rips_edge_hold)).
query(true_val(review_tsj_rips, unk_review_tsj_rips)).

% @attr review_king_snow_top3
% @type categorical
% @canonical false
% @original_name Review (King Snow / Aari, 20 years riding experience)
% @values edge_responsive_nose_play=Edge_hold_responsive_nose_play unk_review_king_snow_top3=Unknown
% @importance 0.90

0.85::acc(s35, review_king_snow_top3).

0.72::true_val(review_king_snow_top3, edge_responsive_nose_play); 0.28::true_val(review_king_snow_top3, unk_review_king_snow_top3).

measured(s35, review_king_snow_top3, edge_responsive_nose_play).

all_consistent(review_king_snow_top3) :-
    consistent(s35, review_king_snow_top3).

evidence(all_consistent(review_king_snow_top3)).
query(true_val(review_king_snow_top3, edge_responsive_nose_play)).
query(true_val(review_king_snow_top3, unk_review_king_snow_top3)).

% @attr review_king_snow_ideal
% @type categorical
% @canonical false
% @original_name Review (King Snow)
% @values freeride_carver=Perfect_for_freeride_carver_powder_groomers unk_review_king_snow_ideal=Unknown
% @importance 0.85

0.85::acc(s44, review_king_snow_ideal).

0.70::true_val(review_king_snow_ideal, freeride_carver); 0.30::true_val(review_king_snow_ideal, unk_review_king_snow_ideal).

measured(s44, review_king_snow_ideal, freeride_carver).

all_consistent(review_king_snow_ideal) :-
    consistent(s44, review_king_snow_ideal).

evidence(all_consistent(review_king_snow_ideal)).
query(true_val(review_king_snow_ideal, freeride_carver)).
query(true_val(review_king_snow_ideal, unk_review_king_snow_ideal)).

% @attr review_tsj_flex
% @type categorical
% @canonical false
% @original_name Review (The Snowboarder's Journal)
% @values progressive_forgiving=Progressive_flex_forgiving_fun_quick_edge_transition unk_review_tsj_flex=Unknown
% @importance 0.90

0.88::acc(s14, review_tsj_flex).

0.77::true_val(review_tsj_flex, progressive_forgiving); 0.23::true_val(review_tsj_flex, unk_review_tsj_flex).

measured(s14, review_tsj_flex, progressive_forgiving).

all_consistent(review_tsj_flex) :-
    consistent(s14, review_tsj_flex).

evidence(all_consistent(review_tsj_flex)).
query(true_val(review_tsj_flex, progressive_forgiving)).
query(true_val(review_tsj_flex, unk_review_tsj_flex)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values superior_powder_float=Superior_powder_buoyancy_wider_taper_Rock_Out unk_positive_aspect=Unknown
% @importance 0.78

0.82::acc(s15, positive_aspect).
0.82::acc(s7, positive_aspect).

0.88::true_val(positive_aspect, superior_powder_float); 0.12::true_val(positive_aspect, unk_positive_aspect).

measured(s15, positive_aspect, superior_powder_float).
measured(s7, positive_aspect, superior_powder_float).

all_consistent(positive_aspect) :-
    (indep(s15), consistent(s15, positive_aspect) ; \+indep(s15)),
    (indep(s7), consistent(s7, positive_aspect) ; \+indep(s7)).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, superior_powder_float)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr positive_aspect_daily_driving
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values daily_driver=Excels_daily_driving_spring_powder_park_banked_slalom unk_positive_aspect_daily_driving=Unknown
% @importance 0.88

0.88::acc(s45, positive_aspect_daily_driving).

0.78::true_val(positive_aspect_daily_driving, daily_driver); 0.22::true_val(positive_aspect_daily_driving, unk_positive_aspect_daily_driving).

measured(s45, positive_aspect_daily_driving, daily_driver).

all_consistent(positive_aspect_daily_driving) :-
    consistent(s45, positive_aspect_daily_driving).

evidence(all_consistent(positive_aspect_daily_driving)).
query(true_val(positive_aspect_daily_driving, daily_driver)).
query(true_val(positive_aspect_daily_driving, unk_positive_aspect_daily_driving)).

% @attr positive_aspect_stability
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values high_speed_stability=Comfortably_handles_high_speed_stability_creative_finessing unk_positive_aspect_stability=Unknown
% @importance 0.85

0.80::acc(s13, positive_aspect_stability).

0.65::true_val(positive_aspect_stability, high_speed_stability); 0.35::true_val(positive_aspect_stability, unk_positive_aspect_stability).

measured(s13, positive_aspect_stability, high_speed_stability).

all_consistent(positive_aspect_stability) :-
    (indep(s13), consistent(s13, positive_aspect_stability) ; \+indep(s13)).

evidence(all_consistent(positive_aspect_stability)).
query(true_val(positive_aspect_stability, high_speed_stability)).
query(true_val(positive_aspect_stability, unk_positive_aspect_stability)).

% @attr positive_aspect_responsive
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values very_responsive=Very_responsive_easy_to_get_on_edge unk_positive_aspect_responsive=Unknown
% @importance 0.90

0.85::acc(s35, positive_aspect_responsive).

0.72::true_val(positive_aspect_responsive, very_responsive); 0.28::true_val(positive_aspect_responsive, unk_positive_aspect_responsive).

measured(s35, positive_aspect_responsive, very_responsive).

all_consistent(positive_aspect_responsive) :-
    consistent(s35, positive_aspect_responsive).

evidence(all_consistent(positive_aspect_responsive)).
query(true_val(positive_aspect_responsive, very_responsive)).
query(true_val(positive_aspect_responsive, unk_positive_aspect_responsive)).

% @attr positive_aspect_nose_play
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values nose_play=Lot_of_play_in_the_nose unk_positive_aspect_nose_play=Unknown
% @importance 0.90

0.85::acc(s35, positive_aspect_nose_play).

0.72::true_val(positive_aspect_nose_play, nose_play); 0.28::true_val(positive_aspect_nose_play, unk_positive_aspect_nose_play).

measured(s35, positive_aspect_nose_play, nose_play).

all_consistent(positive_aspect_nose_play) :-
    consistent(s35, positive_aspect_nose_play).

evidence(all_consistent(positive_aspect_nose_play)).
query(true_val(positive_aspect_nose_play, nose_play)).
query(true_val(positive_aspect_nose_play, unk_positive_aspect_nose_play)).

% @attr positive_aspect_corduroy
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values slices_corduroy=Effortlessly_slices_corduroy_high_on_edge unk_positive_aspect_corduroy=Unknown
% @importance 0.85

0.88::acc(s19, positive_aspect_corduroy).

0.81::true_val(positive_aspect_corduroy, slices_corduroy); 0.19::true_val(positive_aspect_corduroy, unk_positive_aspect_corduroy).

measured(s19, positive_aspect_corduroy, slices_corduroy).

all_consistent(positive_aspect_corduroy) :-
    consistent(s19, positive_aspect_corduroy).

evidence(all_consistent(positive_aspect_corduroy)).
query(true_val(positive_aspect_corduroy, slices_corduroy)).
query(true_val(positive_aspect_corduroy, unk_positive_aspect_corduroy)).

% @attr user_review_forum_comparison
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values cross_dancehaul_super8=Cross_between_Dancehaul_and_Super_8 unk_user_review_forum_comparison=Unknown
% @importance 0.75

0.60::acc(s40, user_review_forum_comparison).

0.37::true_val(user_review_forum_comparison, cross_dancehaul_super8); 0.63::true_val(user_review_forum_comparison, unk_user_review_forum_comparison).

measured(s40, user_review_forum_comparison, cross_dancehaul_super8).

all_consistent(user_review_forum_comparison) :-
    consistent(s40, user_review_forum_comparison).

evidence(all_consistent(user_review_forum_comparison)).
query(true_val(user_review_forum_comparison, cross_dancehaul_super8)).
query(true_val(user_review_forum_comparison, unk_user_review_forum_comparison)).

% @attr user_review_forum_overlap
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values overlap_taka_goop_sickstick=Overlap_Taka_Jetstream_Goop_Sickstick unk_user_review_forum_overlap=Unknown
% @importance 0.65

0.55::acc(s46, user_review_forum_overlap).

0.31::true_val(user_review_forum_overlap, overlap_taka_goop_sickstick); 0.69::true_val(user_review_forum_overlap, unk_user_review_forum_overlap).

measured(s46, user_review_forum_overlap, overlap_taka_goop_sickstick).

all_consistent(user_review_forum_overlap) :-
    consistent(s46, user_review_forum_overlap).

evidence(all_consistent(user_review_forum_overlap)).
query(true_val(user_review_forum_overlap, overlap_taka_goop_sickstick)).
query(true_val(user_review_forum_overlap, unk_user_review_forum_overlap)).

% @attr review_angrysnowboarder
% @type categorical
% @canonical false
% @original_name Early review (Angrysnowboarder on Patreon)
% @values rock_out_flat_camber_rocker=Rock_Out_Camber_flat_middle_rocker_tips unk_review_angrysnowboarder=Unknown
% @importance 0.50

0.65::acc(s47, review_angrysnowboarder).

0.47::true_val(review_angrysnowboarder, rock_out_flat_camber_rocker); 0.53::true_val(review_angrysnowboarder, unk_review_angrysnowboarder).

measured(s47, review_angrysnowboarder, rock_out_flat_camber_rocker).

all_consistent(review_angrysnowboarder) :-
    consistent(s47, review_angrysnowboarder).

evidence(all_consistent(review_angrysnowboarder)).
query(true_val(review_angrysnowboarder, rock_out_flat_camber_rocker)).
query(true_val(review_angrysnowboarder, unk_review_angrysnowboarder)).

% @attr review_test_rider_tsj
% @type categorical
% @canonical false
% @original_name Review test rider profile (The Snowboarder's Journal)
% @values tsj_rider=44yo_5ft7_150lbs_sz8_32yrs_baker unk_review_test_rider_tsj=Unknown
% @importance 0.90

0.88::acc(s14, review_test_rider_tsj).

0.77::true_val(review_test_rider_tsj, tsj_rider); 0.23::true_val(review_test_rider_tsj, unk_review_test_rider_tsj).

measured(s14, review_test_rider_tsj, tsj_rider).

all_consistent(review_test_rider_tsj) :-
    consistent(s14, review_test_rider_tsj).

evidence(all_consistent(review_test_rider_tsj)).
query(true_val(review_test_rider_tsj, tsj_rider)).
query(true_val(review_test_rider_tsj, unk_review_test_rider_tsj)).

% @attr review_test_rider_king_snow
% @type categorical
% @canonical false
% @original_name Review test rider profile (King Snow)
% @values ks_rider=5ft8_150lbs_sz8_5_tested_157 unk_review_test_rider_king_snow=Unknown
% @importance 0.90

0.85::acc(s35, review_test_rider_king_snow).

0.72::true_val(review_test_rider_king_snow, ks_rider); 0.28::true_val(review_test_rider_king_snow, unk_review_test_rider_king_snow).

measured(s35, review_test_rider_king_snow, ks_rider).

all_consistent(review_test_rider_king_snow) :-
    consistent(s35, review_test_rider_king_snow).

evidence(all_consistent(review_test_rider_king_snow)).
query(true_val(review_test_rider_king_snow, ks_rider)).
query(true_val(review_test_rider_king_snow, unk_review_test_rider_king_snow)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values excellent=Excellent unk_edge_hold=Unknown
% @importance 0.90

0.88::acc(s35, edge_hold).
0.88::acc(s14, edge_hold).

0.92::true_val(edge_hold, excellent); 0.08::true_val(edge_hold, unk_edge_hold).

measured(s35, edge_hold, excellent).
measured(s14, edge_hold, excellent).

all_consistent(edge_hold) :-
    consistent(s35, edge_hold),
    consistent(s14, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, excellent)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr pop
% @type categorical
% @canonical true
% @original_name pop
% @values good=Good_Ghost_Carbon_Popster unk_pop=Unknown
% @importance 0.65

0.82::acc(s42, pop).

0.63::true_val(pop, good); 0.37::true_val(pop, unk_pop).

measured(s42, pop, good).

all_consistent(pop) :-
    consistent(s42, pop).

evidence(all_consistent(pop)).
query(true_val(pop, good)).
query(true_val(pop, unk_pop)).

% @attr stability_at_speed
% @type categorical
% @canonical false
% @original_name Stability at speed
% @values good_moderate=Good_moderate_speeds_may_lack_extreme unk_stability_at_speed=Unknown
% @importance 0.88

0.88::acc(s45, stability_at_speed).

0.78::true_val(stability_at_speed, good_moderate); 0.22::true_val(stability_at_speed, unk_stability_at_speed).

measured(s45, stability_at_speed, good_moderate).

all_consistent(stability_at_speed) :-
    consistent(s45, stability_at_speed).

evidence(all_consistent(stability_at_speed)).
query(true_val(stability_at_speed, good_moderate)).
query(true_val(stability_at_speed, unk_stability_at_speed)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values quick=Quick_turning_taper_radial_sidecut unk_turn_initiation_performance=Unknown
% @importance 1.00

0.92::acc(s1, turn_initiation_performance).

0.90::true_val(turn_initiation_performance, quick); 0.10::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s1, turn_initiation_performance, quick).

all_consistent(turn_initiation_performance) :-
    consistent(s1, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, quick)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr dampening
% @type categorical
% @canonical false
% @original_name Dampening
% @values recycled_abs_dampening=Recycled_ABS_sidewalls_toughness_dampening unk_dampening=Unknown
% @importance 0.70

0.75::acc(s38, dampening).

0.53::true_val(dampening, recycled_abs_dampening); 0.47::true_val(dampening, unk_dampening).

measured(s38, dampening, recycled_abs_dampening).

all_consistent(dampening) :-
    consistent(s38, dampening).

evidence(all_consistent(dampening)).
query(true_val(dampening, recycled_abs_dampening)).
query(true_val(dampening, unk_dampening)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values highpath=Salomon_Highpath_699_95_stiffer_quadratic_sidecut unk_comparable_board_same_brand=Unknown
% @importance 0.65

0.82::acc(s48, comparable_board_same_brand).

0.70::true_val(comparable_board_same_brand, highpath); 0.30::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s48, comparable_board_same_brand, highpath).

all_consistent(comparable_board_same_brand) :-
    consistent(s48, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, highpath)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_fastlane
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values fastlane=Salomon_Fastlane_749_95_aggressive_pintail unk_comparable_board_same_brand_fastlane=Unknown
% @importance 0.65

0.82::acc(s49, comparable_board_same_brand_fastlane).

0.70::true_val(comparable_board_same_brand_fastlane, fastlane); 0.30::true_val(comparable_board_same_brand_fastlane, unk_comparable_board_same_brand_fastlane).

measured(s49, comparable_board_same_brand_fastlane, fastlane).

all_consistent(comparable_board_same_brand_fastlane) :-
    consistent(s49, comparable_board_same_brand_fastlane).

evidence(all_consistent(comparable_board_same_brand_fastlane)).
query(true_val(comparable_board_same_brand_fastlane, fastlane)).
query(true_val(comparable_board_same_brand_fastlane, unk_comparable_board_same_brand_fastlane)).

% @attr comparable_board_same_brand_hierarchy
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values jetstream_softest=Jetstream_softest_Highpath_middle_Fastlane_stiffest unk_comparable_board_same_brand_hierarchy=Unknown
% @importance 0.75

0.60::acc(s40, comparable_board_same_brand_hierarchy).

0.37::true_val(comparable_board_same_brand_hierarchy, jetstream_softest); 0.63::true_val(comparable_board_same_brand_hierarchy, unk_comparable_board_same_brand_hierarchy).

measured(s40, comparable_board_same_brand_hierarchy, jetstream_softest).

all_consistent(comparable_board_same_brand_hierarchy) :-
    consistent(s40, comparable_board_same_brand_hierarchy).

evidence(all_consistent(comparable_board_same_brand_hierarchy)).
query(true_val(comparable_board_same_brand_hierarchy, jetstream_softest)).
query(true_val(comparable_board_same_brand_hierarchy, unk_comparable_board_same_brand_hierarchy)).

% @attr comparable_board_same_brand_assassin
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values assassin=Salomon_Assassin_649_95_directional_twin_quiver_killer unk_comparable_board_same_brand_assassin=Unknown
% @importance 0.95

0.85::acc(s20, comparable_board_same_brand_assassin).

0.78::true_val(comparable_board_same_brand_assassin, assassin); 0.22::true_val(comparable_board_same_brand_assassin, unk_comparable_board_same_brand_assassin).

measured(s20, comparable_board_same_brand_assassin, assassin).

all_consistent(comparable_board_same_brand_assassin) :-
    consistent(s20, comparable_board_same_brand_assassin).

evidence(all_consistent(comparable_board_same_brand_assassin)).
query(true_val(comparable_board_same_brand_assassin, assassin)).
query(true_val(comparable_board_same_brand_assassin, unk_comparable_board_same_brand_assassin)).

% @attr comparable_board_same_brand_sickstick
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values hps_sickstick=Salomon_HPS_Sickstick_699_95_freestyle_freeride unk_comparable_board_same_brand_sickstick=Unknown
% @importance 0.65

0.55::acc(s46, comparable_board_same_brand_sickstick).

0.31::true_val(comparable_board_same_brand_sickstick, hps_sickstick); 0.69::true_val(comparable_board_same_brand_sickstick, unk_comparable_board_same_brand_sickstick).

measured(s46, comparable_board_same_brand_sickstick, hps_sickstick).

all_consistent(comparable_board_same_brand_sickstick) :-
    consistent(s46, comparable_board_same_brand_sickstick).

evidence(all_consistent(comparable_board_same_brand_sickstick)).
query(true_val(comparable_board_same_brand_sickstick, hps_sickstick)).
query(true_val(comparable_board_same_brand_sickstick, unk_comparable_board_same_brand_sickstick)).

% @attr comparable_board_same_brand_dancehaul
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values dancehaul=Salomon_Dancehaul_549_95_rep_cross_reference unk_comparable_board_same_brand_dancehaul=Unknown
% @importance 0.75

0.60::acc(s40, comparable_board_same_brand_dancehaul).

0.37::true_val(comparable_board_same_brand_dancehaul, dancehaul); 0.63::true_val(comparable_board_same_brand_dancehaul, unk_comparable_board_same_brand_dancehaul).

measured(s40, comparable_board_same_brand_dancehaul, dancehaul).

all_consistent(comparable_board_same_brand_dancehaul) :-
    consistent(s40, comparable_board_same_brand_dancehaul).

evidence(all_consistent(comparable_board_same_brand_dancehaul)).
query(true_val(comparable_board_same_brand_dancehaul, dancehaul)).
query(true_val(comparable_board_same_brand_dancehaul, unk_comparable_board_same_brand_dancehaul)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values k2_embassy=K2_Embassy_All_Mountain unk_comparable_board_cross_brand=Unknown
% @importance 0.70

0.72::acc(s26, comparable_board_cross_brand).

0.57::true_val(comparable_board_cross_brand, k2_embassy); 0.43::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s26, comparable_board_cross_brand, k2_embassy).

all_consistent(comparable_board_cross_brand) :-
    consistent(s26, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, k2_embassy)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_commonwealth
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values k2_commonwealth=K2_Commonwealth_Freeride unk_comparable_board_cross_brand_commonwealth=Unknown
% @importance 0.70

0.72::acc(s26, comparable_board_cross_brand_commonwealth).

0.57::true_val(comparable_board_cross_brand_commonwealth, k2_commonwealth); 0.43::true_val(comparable_board_cross_brand_commonwealth, unk_comparable_board_cross_brand_commonwealth).

measured(s26, comparable_board_cross_brand_commonwealth, k2_commonwealth).

all_consistent(comparable_board_cross_brand_commonwealth) :-
    consistent(s26, comparable_board_cross_brand_commonwealth).

evidence(all_consistent(comparable_board_cross_brand_commonwealth)).
query(true_val(comparable_board_cross_brand_commonwealth, k2_commonwealth)).
query(true_val(comparable_board_cross_brand_commonwealth, unk_comparable_board_cross_brand_commonwealth)).

% @attr comparable_board_cross_brand_gnu
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values gnu_upgrade=GNU_Upgrade_Mens unk_comparable_board_cross_brand_gnu=Unknown
% @importance 0.70

0.72::acc(s26, comparable_board_cross_brand_gnu).

0.57::true_val(comparable_board_cross_brand_gnu, gnu_upgrade); 0.43::true_val(comparable_board_cross_brand_gnu, unk_comparable_board_cross_brand_gnu).

measured(s26, comparable_board_cross_brand_gnu, gnu_upgrade).

all_consistent(comparable_board_cross_brand_gnu) :-
    consistent(s26, comparable_board_cross_brand_gnu).

evidence(all_consistent(comparable_board_cross_brand_gnu)).
query(true_val(comparable_board_cross_brand_gnu, gnu_upgrade)).
query(true_val(comparable_board_cross_brand_gnu, unk_comparable_board_cross_brand_gnu)).

% @attr comparable_board_cross_brand_instrument
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values k2_instrument=K2_Instrument_Mens unk_comparable_board_cross_brand_instrument=Unknown
% @importance 0.70

0.72::acc(s26, comparable_board_cross_brand_instrument).

0.57::true_val(comparable_board_cross_brand_instrument, k2_instrument); 0.43::true_val(comparable_board_cross_brand_instrument, unk_comparable_board_cross_brand_instrument).

measured(s26, comparable_board_cross_brand_instrument, k2_instrument).

all_consistent(comparable_board_cross_brand_instrument) :-
    consistent(s26, comparable_board_cross_brand_instrument).

evidence(all_consistent(comparable_board_cross_brand_instrument)).
query(true_val(comparable_board_cross_brand_instrument, k2_instrument)).
query(true_val(comparable_board_cross_brand_instrument, unk_comparable_board_cross_brand_instrument)).

% @attr retailer_info_evo
% @type categorical
% @canonical false
% @original_name evo.com
% @values reputable_lowest_price=Major_US_specialty_lowest_price_free_shipping unk_retailer_info_evo=Unknown
% @importance 0.95

0.85::acc(s20, retailer_info_evo).

0.78::true_val(retailer_info_evo, reputable_lowest_price); 0.22::true_val(retailer_info_evo, unk_retailer_info_evo).

measured(s20, retailer_info_evo, reputable_lowest_price).

all_consistent(retailer_info_evo) :-
    consistent(s20, retailer_info_evo).

evidence(all_consistent(retailer_info_evo)).
query(true_val(retailer_info_evo, reputable_lowest_price)).
query(true_val(retailer_info_evo, unk_retailer_info_evo)).

% @attr retailer_info_tactics
% @type categorical
% @canonical false
% @original_name Tactics
% @values established_since_1999=Established_since_1999_low_price_free_shipping unk_retailer_info_tactics=Unknown
% @importance 0.90

0.85::acc(s21, retailer_info_tactics).

0.75::true_val(retailer_info_tactics, established_since_1999); 0.25::true_val(retailer_info_tactics, unk_retailer_info_tactics).

measured(s21, retailer_info_tactics, established_since_1999).

all_consistent(retailer_info_tactics) :-
    consistent(s21, retailer_info_tactics).

evidence(all_consistent(retailer_info_tactics)).
query(true_val(retailer_info_tactics, established_since_1999)).
query(true_val(retailer_info_tactics, unk_retailer_info_tactics)).

% @attr retailer_info_rei
% @type categorical
% @canonical false
% @original_name REI Co-op
% @values major_outdoor_1yr_guarantee=Major_US_outdoor_1yr_satisfaction_guarantee unk_retailer_info_rei=Unknown
% @importance 0.75

0.85::acc(s25, retailer_info_rei).

0.75::true_val(retailer_info_rei, major_outdoor_1yr_guarantee); 0.25::true_val(retailer_info_rei, unk_retailer_info_rei).

measured(s25, retailer_info_rei, major_outdoor_1yr_guarantee).

all_consistent(retailer_info_rei) :-
    consistent(s25, retailer_info_rei).

evidence(all_consistent(retailer_info_rei)).
query(true_val(retailer_info_rei, major_outdoor_1yr_guarantee)).
query(true_val(retailer_info_rei, unk_retailer_info_rei)).

% @attr retailer_info_amazon
% @type categorical
% @canonical false
% @original_name Amazon (via The Ski Monster)
% @values third_party_90day=Third_party_seller_90day_returns unk_retailer_info_amazon=Unknown
% @importance 0.70

0.72::acc(s26, retailer_info_amazon).

0.57::true_val(retailer_info_amazon, third_party_90day); 0.43::true_val(retailer_info_amazon, unk_retailer_info_amazon).

measured(s26, retailer_info_amazon, third_party_90day).

all_consistent(retailer_info_amazon) :-
    consistent(s26, retailer_info_amazon).

evidence(all_consistent(retailer_info_amazon)).
query(true_val(retailer_info_amazon, third_party_90day)).
query(true_val(retailer_info_amazon, unk_retailer_info_amazon)).

% @attr retailer_info_blauer
% @type categorical
% @canonical false
% @original_name Blauer Board Shop
% @values core_specialty_expert=Core_snowboard_specialty_expert_staff unk_retailer_info_blauer=Unknown
% @importance 0.85

0.80::acc(s7, retailer_info_blauer).

0.69::true_val(retailer_info_blauer, core_specialty_expert); 0.31::true_val(retailer_info_blauer, unk_retailer_info_blauer).

measured(s7, retailer_info_blauer, core_specialty_expert).

all_consistent(retailer_info_blauer) :-
    consistent(s7, retailer_info_blauer).

evidence(all_consistent(retailer_info_blauer)).
query(true_val(retailer_info_blauer, core_specialty_expert)).
query(true_val(retailer_info_blauer, unk_retailer_info_blauer)).

% @attr retailer_info_ski_monster
% @type categorical
% @canonical false
% @original_name The Ski Monster (Boston)
% @values independent_tests_all_gear=Independent_specialty_staff_tests_all_gear unk_retailer_info_ski_monster=Unknown
% @importance 0.85

0.80::acc(s13, retailer_info_ski_monster).

0.65::true_val(retailer_info_ski_monster, independent_tests_all_gear); 0.35::true_val(retailer_info_ski_monster, unk_retailer_info_ski_monster).

measured(s13, retailer_info_ski_monster, independent_tests_all_gear).

all_consistent(retailer_info_ski_monster) :-
    consistent(s13, retailer_info_ski_monster).

evidence(all_consistent(retailer_info_ski_monster)).
query(true_val(retailer_info_ski_monster, independent_tests_all_gear)).
query(true_val(retailer_info_ski_monster, unk_retailer_info_ski_monster)).