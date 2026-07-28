0.15::indep(sm).
0.15::indep(s7).
0.20::indep(s15).
0.20::indep(s16).
0.15::indep(s19).
0.15::indep(s20).
0.15::indep(s21).
0.15::indep(s28).
0.20::indep(s32).
0.20::indep(s33).
0.15::indep(s36).
0.15::indep(s38).
0.15::indep(s39).
0.15::indep(s40).
0.15::indep(s41).
0.15::indep(s42).
0.15::indep(s44).
0.20::indep(s45).
0.20::indep(s46).
0.15::indep(s47).
0.20::indep(s48).
0.15::indep(s49).
0.20::indep(s50).
0.15::indep(s54).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

0.93::acc(s1, brand).
0.90::acc(sm, brand).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values burton_snowboards=Burton_Snowboards unk_brand=Unknown
% @importance 1.0

0.95::true_val(brand, burton_snowboards); 0.05::true_val(brand, unk_brand).

measured(s1, brand, burton_snowboards).
measured(sm, brand, burton_snowboards).

all_consistent(brand) :-
    consistent(s1, brand),
    (indep(sm), consistent(sm, brand) ; \+indep(sm)).

evidence(all_consistent(brand)).
query(true_val(brand, burton_snowboards)).
query(true_val(brand, unk_brand)).

0.93::acc(s1, model_name).
0.88::acc(s2, model_name).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values fish_3d_splitboard=Fish_3D_Splitboard unk_model_name=Unknown
% @importance 0.85

0.95::true_val(model_name, fish_3d_splitboard); 0.05::true_val(model_name, unk_model_name).

measured(s1, model_name, fish_3d_splitboard).
measured(s2, model_name, fish_3d_splitboard).

all_consistent(model_name) :-
    consistent(s1, model_name),
    consistent(s2, model_name).

evidence(all_consistent(model_name)).
query(true_val(model_name, fish_3d_splitboard)).
query(true_val(model_name, unk_model_name)).

0.93::acc(s1, model_year).
0.92::acc(sm, model_year).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2024=2024 unk_model_year=Unknown
% @importance 1.0

0.95::true_val(model_year, y2024); 0.05::true_val(model_year, unk_model_year).

measured(s1, model_year, y2024).
measured(sm, model_year, y2024).

all_consistent(model_year) :-
    consistent(s1, model_year),
    (indep(sm), consistent(sm, model_year) ; \+indep(sm)).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2024)).
query(true_val(model_year, unk_model_year)).

0.80::acc(s3, manufacturer).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values burton_snowboards_1977=Burton_Snowboards_founded_1977 unk_manufacturer=Unknown
% @importance 0.4

0.71::true_val(manufacturer, burton_snowboards_1977); 0.29::true_val(manufacturer, unk_manufacturer).

measured(s3, manufacturer, burton_snowboards_1977).

all_consistent(manufacturer) :-
    consistent(s3, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, burton_snowboards_1977)).
query(true_val(manufacturer, unk_manufacturer)).

0.80::acc(s3, manufacturer_headquarters).

% @attr manufacturer_headquarters
% @type categorical
% @canonical false
% @original_name Manufacturer headquarters
% @values burlington_vt_usa=Burlington_Vermont_USA unk_manufacturer_headquarters=Unknown
% @importance 0.4

0.71::true_val(manufacturer_headquarters, burlington_vt_usa); 0.29::true_val(manufacturer_headquarters, unk_manufacturer_headquarters).

measured(s3, manufacturer_headquarters, burlington_vt_usa).

all_consistent(manufacturer_headquarters) :-
    consistent(s3, manufacturer_headquarters).

evidence(all_consistent(manufacturer_headquarters)).
query(true_val(manufacturer_headquarters, burlington_vt_usa)).
query(true_val(manufacturer_headquarters, unk_manufacturer_headquarters)).

0.75::acc(s4, manufacturing_location_current).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values austria_and_china=Austria_and_China unk_manufacturing_location_current=Unknown
% @importance 0.35

0.68::true_val(manufacturing_location_current, austria_and_china); 0.32::true_val(manufacturing_location_current, unk_manufacturing_location_current).

measured(s4, manufacturing_location_current, austria_and_china).

all_consistent(manufacturing_location_current) :-
    consistent(s4, manufacturing_location_current).

evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, austria_and_china)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

0.65::acc(s5, burton_market_share).

% @attr burton_market_share
% @type categorical
% @canonical false
% @original_name Burton market share
% @values pct_40_45=40_to_45_percent unk_burton_market_share=Unknown
% @importance 0.3

0.60::true_val(burton_market_share, pct_40_45); 0.40::true_val(burton_market_share, unk_burton_market_share).

measured(s5, burton_market_share, pct_40_45).

all_consistent(burton_market_share) :-
    consistent(s5, burton_market_share).

evidence(all_consistent(burton_market_share)).
query(true_val(burton_market_share, pct_40_45)).
query(true_val(burton_market_share, unk_burton_market_share)).

0.93::acc(s1, product_type).
0.90::acc(sm, product_type).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values splitboard=Splitboard unk_product_type=Unknown
% @importance 0.85

0.95::true_val(product_type, splitboard); 0.05::true_val(product_type, unk_product_type).

measured(s1, product_type, splitboard).
measured(sm, product_type, splitboard).

all_consistent(product_type) :-
    consistent(s1, product_type),
    (indep(sm), consistent(sm, product_type) ; \+indep(sm)).

evidence(all_consistent(product_type)).
query(true_val(product_type, splitboard)).
query(true_val(product_type, unk_product_type)).

0.93::acc(s1, board_category).
0.90::acc(sm, board_category).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values powder=Powder unk_board_category=Unknown
% @importance 0.85

0.95::true_val(board_category, powder); 0.05::true_val(board_category, unk_board_category).

measured(s1, board_category, powder).
measured(sm, board_category, powder).

all_consistent(board_category) :-
    consistent(s1, board_category),
    (indep(sm), consistent(sm, board_category) ; \+indep(sm)).

evidence(all_consistent(board_category)).
query(true_val(board_category, powder)).
query(true_val(board_category, unk_board_category)).

0.70::acc(s6, model_series).

% @attr model_series
% @type categorical
% @canonical false
% @original_name Model series
% @values family_tree=Family_Tree unk_model_series=Unknown
% @importance 0.5

0.45::true_val(model_series, family_tree); 0.55::true_val(model_series, unk_model_series).

measured(s6, model_series, family_tree).

all_consistent(model_series) :-
    consistent(s6, model_series).

evidence(all_consistent(model_series)).
query(true_val(model_series, family_tree)).
query(true_val(model_series, unk_model_series)).

0.70::acc(s7, gender).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values unisex=Unisex unk_gender=Unknown
% @importance 0.4

0.62::true_val(gender, unisex); 0.38::true_val(gender, unk_gender).

measured(s7, gender, unisex).

all_consistent(gender) :-
    (indep(s7), consistent(s7, gender) ; \+indep(s7)).

evidence(all_consistent(gender)).
query(true_val(gender, unisex)).
query(true_val(gender, unk_gender)).

0.50::acc(s8, predecessor_model_name).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values original_fish_2002=Original_Burton_Fish_circa_2002 unk_predecessor_model_name=Unknown
% @importance 0.3

0.28::true_val(predecessor_model_name, original_fish_2002); 0.72::true_val(predecessor_model_name, unk_predecessor_model_name).

measured(s8, predecessor_model_name, original_fish_2002).

all_consistent(predecessor_model_name) :-
    consistent(s8, predecessor_model_name).

evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, original_fish_2002)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).

0.82::acc(s9, model_first_available_year).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values y2021=2021 unk_model_first_available_year=Unknown
% @importance 0.5

0.68::true_val(model_first_available_year, y2021); 0.32::true_val(model_first_available_year, unk_model_first_available_year).

measured(s9, model_first_available_year, y2021).

all_consistent(model_first_available_year) :-
    consistent(s9, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2021)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

0.78::acc(s10, model_first_available_year_split).

% @attr model_first_available_year_split
% @type categorical
% @canonical false
% @original_name model_first_available_year (split version)
% @values y2024=2024 unk_model_first_available_year_split=Unknown
% @importance 0.7

0.60::true_val(model_first_available_year_split, y2024); 0.40::true_val(model_first_available_year_split, unk_model_first_available_year_split).

measured(s10, model_first_available_year_split, y2024).

all_consistent(model_first_available_year_split) :-
    consistent(s10, model_first_available_year_split).

evidence(all_consistent(model_first_available_year_split)).
query(true_val(model_first_available_year_split, y2024)).
query(true_val(model_first_available_year_split, unk_model_first_available_year_split)).

0.90::acc(s11, successor_model).
0.90::acc(s12, successor_model).

% @attr successor_model
% @type categorical
% @canonical false
% @original_name Successor model
% @values continued_3d_fish_flat_top_split=3D_Fish_Flat_Top_Splitboard_2025_2026 unk_successor_model=Unknown
% @importance 0.5

0.95::true_val(successor_model, continued_3d_fish_flat_top_split); 0.05::true_val(successor_model, unk_successor_model).

measured(s11, successor_model, continued_3d_fish_flat_top_split).
measured(s12, successor_model, continued_3d_fish_flat_top_split).

all_consistent(successor_model) :-
    consistent(s11, successor_model),
    consistent(s12, successor_model).

evidence(all_consistent(successor_model)).
query(true_val(successor_model, continued_3d_fish_flat_top_split)).
query(true_val(successor_model, unk_successor_model)).

0.93::acc(sm, sku_merchant).

% @attr sku_merchant
% @type categorical
% @canonical false
% @original_name SKU (merchant)
% @values sku_2391410a03rg156=2391410A03RG156 unk_sku_merchant=Unknown
% @importance 0.85

0.93::true_val(sku_merchant, sku_2391410a03rg156); 0.07::true_val(sku_merchant, unk_sku_merchant).

measured(sm, sku_merchant, sku_2391410a03rg156).

all_consistent(sku_merchant) :-
    consistent(sm, sku_merchant).

evidence(all_consistent(sku_merchant)).
query(true_val(sku_merchant, sku_2391410a03rg156)).
query(true_val(sku_merchant, unk_sku_merchant)).

0.95::acc(sm, price_aud_merchant).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v839_99=839.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.95::true_val(price_aud_merchant, v839_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(sm, price_aud_merchant, v839_99).

all_consistent(price_aud_merchant) :-
    consistent(sm, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v839_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

0.95::acc(sm, price_aud_merchant_rrp).

% @attr price_aud_merchant_rrp
% @type numeric
% @unit AUD
% @canonical false
% @original_name price_aud_merchant (RRP)
% @values v1399_99=1399.99 unk_price_aud_merchant_rrp=Unknown
% @importance 0.85

0.95::true_val(price_aud_merchant_rrp, v1399_99); 0.05::true_val(price_aud_merchant_rrp, unk_price_aud_merchant_rrp).

measured(sm, price_aud_merchant_rrp, v1399_99).

all_consistent(price_aud_merchant_rrp) :-
    consistent(sm, price_aud_merchant_rrp).

evidence(all_consistent(price_aud_merchant_rrp)).
query(true_val(price_aud_merchant_rrp, v1399_99)).
query(true_val(price_aud_merchant_rrp, unk_price_aud_merchant_rrp)).

0.95::acc(sm, discount_merchant).

% @attr discount_merchant
% @type categorical
% @canonical false
% @original_name Discount (merchant)
% @values pct_40_off=40_percent_off unk_discount_merchant=Unknown
% @importance 0.85

0.95::true_val(discount_merchant, pct_40_off); 0.05::true_val(discount_merchant, unk_discount_merchant).

measured(sm, discount_merchant, pct_40_off).

all_consistent(discount_merchant) :-
    consistent(sm, discount_merchant).

evidence(all_consistent(discount_merchant)).
query(true_val(discount_merchant, pct_40_off)).
query(true_val(discount_merchant, unk_discount_merchant)).

0.93::acc(sm, shipping_restriction).

% @attr shipping_restriction
% @type categorical
% @canonical false
% @original_name Shipping restriction (merchant)
% @values australia_only=Australia_only unk_shipping_restriction=Unknown
% @importance 0.85

0.93::true_val(shipping_restriction, australia_only); 0.07::true_val(shipping_restriction, unk_shipping_restriction).

measured(sm, shipping_restriction, australia_only).

all_consistent(shipping_restriction) :-
    consistent(sm, shipping_restriction).

evidence(all_consistent(shipping_restriction)).
query(true_val(shipping_restriction, australia_only)).
query(true_val(shipping_restriction, unk_shipping_restriction)).

0.80::acc(s13, price_usd_msrp).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v999=999.0 unk_price_usd_msrp=Unknown
% @importance 0.95

0.63::true_val(price_usd_msrp, v999); 0.37::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s13, price_usd_msrp, v999).

all_consistent(price_usd_msrp) :-
    consistent(s13, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v999)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

0.65::acc(s14, price_usd_burton_us_non_split).

% @attr price_usd_burton_us_non_split
% @type categorical
% @canonical false
% @original_name Price at Burton US (non-split 3D Fish)
% @values v659_95_sale_v1029_95_full=659.95_sale_1029.95_full unk_price_usd_burton_us_non_split=Unknown
% @importance 0.85

0.46::true_val(price_usd_burton_us_non_split, v659_95_sale_v1029_95_full); 0.54::true_val(price_usd_burton_us_non_split, unk_price_usd_burton_us_non_split).

measured(s14, price_usd_burton_us_non_split, v659_95_sale_v1029_95_full).

all_consistent(price_usd_burton_us_non_split) :-
    consistent(s14, price_usd_burton_us_non_split).

evidence(all_consistent(price_usd_burton_us_non_split)).
query(true_val(price_usd_burton_us_non_split, v659_95_sale_v1029_95_full)).
query(true_val(price_usd_burton_us_non_split, unk_price_usd_burton_us_non_split)).

0.65::acc(s14, price_usd_backcountry).

% @attr price_usd_backcountry
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_backcountry
% @values v543_96=543.96 unk_price_usd_backcountry=Unknown
% @importance 0.85

0.46::true_val(price_usd_backcountry, v543_96); 0.54::true_val(price_usd_backcountry, unk_price_usd_backcountry).

measured(s14, price_usd_backcountry, v543_96).

all_consistent(price_usd_backcountry) :-
    consistent(s14, price_usd_backcountry).

evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v543_96)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

0.65::acc(s14, price_usd_gravity_coalition_non_split).

% @attr price_usd_gravity_coalition_non_split
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at Gravity Coalition (non-split 3D Fish)
% @values v699_97=699.97 unk_price_usd_gravity_coalition_non_split=Unknown
% @importance 0.85

0.46::true_val(price_usd_gravity_coalition_non_split, v699_97); 0.54::true_val(price_usd_gravity_coalition_non_split, unk_price_usd_gravity_coalition_non_split).

measured(s14, price_usd_gravity_coalition_non_split, v699_97).

all_consistent(price_usd_gravity_coalition_non_split) :-
    consistent(s14, price_usd_gravity_coalition_non_split).

evidence(all_consistent(price_usd_gravity_coalition_non_split)).
query(true_val(price_usd_gravity_coalition_non_split, v699_97)).
query(true_val(price_usd_gravity_coalition_non_split, unk_price_usd_gravity_coalition_non_split)).

0.65::acc(s14, price_cad_burton_canada_non_split).

% @attr price_cad_burton_canada_non_split
% @type categorical
% @unit CAD
% @canonical false
% @original_name Price at Burton Canada (non-split 3D Fish)
% @values v789_99_to_1299_99=789.99_to_1299.99_CAD unk_price_cad=Unknown
% @importance 0.85

0.46::true_val(price_cad_burton_canada_non_split, v789_99_to_1299_99); 0.54::true_val(price_cad_burton_canada_non_split, unk_price_cad).

measured(s14, price_cad_burton_canada_non_split, v789_99_to_1299_99).

all_consistent(price_cad_burton_canada_non_split) :-
    consistent(s14, price_cad_burton_canada_non_split).

evidence(all_consistent(price_cad_burton_canada_non_split)).
query(true_val(price_cad_burton_canada_non_split, v789_99_to_1299_99)).
query(true_val(price_cad_burton_canada_non_split, unk_price_cad)).

0.65::acc(s14, price_eur_snowcountry_non_split).

% @attr price_eur_snowcountry_non_split
% @type categorical
% @unit EUR
% @canonical false
% @original_name Price at SnowCountry EU (non-split 3D Fish)
% @values v539_to_799=539_to_799_EUR unk_price_eur=Unknown
% @importance 0.85

0.46::true_val(price_eur_snowcountry_non_split, v539_to_799); 0.54::true_val(price_eur_snowcountry_non_split, unk_price_eur).

measured(s14, price_eur_snowcountry_non_split, v539_to_799).

all_consistent(price_eur_snowcountry_non_split) :-
    consistent(s14, price_eur_snowcountry_non_split).

evidence(all_consistent(price_eur_snowcountry_non_split)).
query(true_val(price_eur_snowcountry_non_split, v539_to_799)).
query(true_val(price_eur_snowcountry_non_split, unk_price_eur)).

0.85::acc(s15, availability_status).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values in_stock=In_stock_splitboard unk_availability_status=Unknown
% @importance 0.85

0.72::true_val(availability_status, in_stock); 0.28::true_val(availability_status, unk_availability_status).

measured(s15, availability_status, in_stock).

all_consistent(availability_status) :-
    consistent(s15, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, in_stock)).
query(true_val(availability_status, unk_availability_status)).

0.82::acc(s16, availability_status_2026_backcountry).

% @attr availability_status_2026_backcountry
% @type categorical
% @canonical false
% @original_name availability_status (2026 Backcountry)
% @values listed_2026=Listed_2026_version unk_avail_bc=Unknown
% @importance 0.85

0.72::true_val(availability_status_2026_backcountry, listed_2026); 0.28::true_val(availability_status_2026_backcountry, unk_avail_bc).

measured(s16, availability_status_2026_backcountry, listed_2026).

all_consistent(availability_status_2026_backcountry) :-
    consistent(s16, availability_status_2026_backcountry).

evidence(all_consistent(availability_status_2026_backcountry)).
query(true_val(availability_status_2026_backcountry, listed_2026)).
query(true_val(availability_status_2026_backcountry, unk_avail_bc)).

0.75::acc(s17, availability_status_2025_steepandcheap).

% @attr availability_status_2025_steepandcheap
% @type categorical
% @canonical false
% @original_name availability_status (2025 Steep and Cheap)
% @values listed_2025=Listed_2025_version unk_avail_sc=Unknown
% @importance 0.8

0.64::true_val(availability_status_2025_steepandcheap, listed_2025); 0.36::true_val(availability_status_2025_steepandcheap, unk_avail_sc).

measured(s17, availability_status_2025_steepandcheap, listed_2025).

all_consistent(availability_status_2025_steepandcheap) :-
    consistent(s17, availability_status_2025_steepandcheap).

evidence(all_consistent(availability_status_2025_steepandcheap)).
query(true_val(availability_status_2025_steepandcheap, listed_2025)).
query(true_val(availability_status_2025_steepandcheap, unk_avail_sc)).

0.70::acc(s18, availability_status_amazon).

% @attr availability_status_amazon
% @type categorical
% @canonical false
% @original_name availability_status (Amazon 2025/2026)
% @values listed_2025_2026=Listed_2025_and_2026 unk_avail_az=Unknown
% @importance 0.8

0.55::true_val(availability_status_amazon, listed_2025_2026); 0.45::true_val(availability_status_amazon, unk_avail_az).

measured(s18, availability_status_amazon, listed_2025_2026).

all_consistent(availability_status_amazon) :-
    consistent(s18, availability_status_amazon).

evidence(all_consistent(availability_status_amazon)).
query(true_val(availability_status_amazon, listed_2025_2026)).
query(true_val(availability_status_amazon, unk_avail_az)).

0.70::acc(s7, availability_status_2026_blauer).

% @attr availability_status_2026_blauer
% @type categorical
% @canonical false
% @original_name availability_status (2026 Blauer)
% @values listed_2026=Listed_2026_version unk_avail_bl=Unknown
% @importance 0.4

0.62::true_val(availability_status_2026_blauer, listed_2026); 0.38::true_val(availability_status_2026_blauer, unk_avail_bl).

measured(s7, availability_status_2026_blauer, listed_2026).

all_consistent(availability_status_2026_blauer) :-
    (indep(s7), consistent(s7, availability_status_2026_blauer) ; \+indep(s7)).

evidence(all_consistent(availability_status_2026_blauer)).
query(true_val(availability_status_2026_blauer, listed_2026)).
query(true_val(availability_status_2026_blauer, unk_avail_bl)).

0.70::acc(s19, availability_status_gravity_coalition).

% @attr availability_status_gravity_coalition
% @type categorical
% @canonical false
% @original_name availability_status (Gravity Coalition)
% @values listed=Listed_splitboard unk_avail_gc=Unknown
% @importance 0.75

0.55::true_val(availability_status_gravity_coalition, listed); 0.45::true_val(availability_status_gravity_coalition, unk_avail_gc).

measured(s19, availability_status_gravity_coalition, listed).

all_consistent(availability_status_gravity_coalition) :-
    (indep(s19), consistent(s19, availability_status_gravity_coalition) ; \+indep(s19)).

evidence(all_consistent(availability_status_gravity_coalition)).
query(true_val(availability_status_gravity_coalition, listed)).
query(true_val(availability_status_gravity_coalition, unk_avail_gc)).

0.65::acc(s20, availability_status_2026_sourceboards).

% @attr availability_status_2026_sourceboards
% @type categorical
% @canonical false
% @original_name availability_status (2026 Source Boards)
% @values listed_2026=Listed_2026_version unk_avail_sb=Unknown
% @importance 0.75

0.51::true_val(availability_status_2026_sourceboards, listed_2026); 0.49::true_val(availability_status_2026_sourceboards, unk_avail_sb).

measured(s20, availability_status_2026_sourceboards, listed_2026).

all_consistent(availability_status_2026_sourceboards) :-
    (indep(s20), consistent(s20, availability_status_2026_sourceboards) ; \+indep(s20)).

evidence(all_consistent(availability_status_2026_sourceboards)).
query(true_val(availability_status_2026_sourceboards, listed_2026)).
query(true_val(availability_status_2026_sourceboards, unk_avail_sb)).

0.60::acc(s21, availability_status_oos_2024_2025).

% @attr availability_status_oos_2024_2025
% @type categorical
% @canonical false
% @original_name availability_status (out of stock 2024/2025)
% @values out_of_stock=Out_of_stock_2024_2025 unk_avail_oos=Unknown
% @importance 0.6

0.47::true_val(availability_status_oos_2024_2025, out_of_stock); 0.53::true_val(availability_status_oos_2024_2025, unk_avail_oos).

measured(s21, availability_status_oos_2024_2025, out_of_stock).

all_consistent(availability_status_oos_2024_2025) :-
    consistent(s21, availability_status_oos_2024_2025).

evidence(all_consistent(availability_status_oos_2024_2025)).
query(true_val(availability_status_oos_2024_2025, out_of_stock)).
query(true_val(availability_status_oos_2024_2025, unk_avail_oos)).

0.65::acc(s22, availability_status_2025_levelnine).

% @attr availability_status_2025_levelnine
% @type categorical
% @canonical false
% @original_name availability_status (2025 Level Nine Sports)
% @values listed_2025=Listed_2025_version unk_avail_ln=Unknown
% @importance 0.7

0.48::true_val(availability_status_2025_levelnine, listed_2025); 0.52::true_val(availability_status_2025_levelnine, unk_avail_ln).

measured(s22, availability_status_2025_levelnine, listed_2025).

all_consistent(availability_status_2025_levelnine) :-
    consistent(s22, availability_status_2025_levelnine).

evidence(all_consistent(availability_status_2025_levelnine)).
query(true_val(availability_status_2025_levelnine, listed_2025)).
query(true_val(availability_status_2025_levelnine, unk_avail_ln)).

0.55::acc(s23, availability_status_ebay).

% @attr availability_status_ebay
% @type categorical
% @canonical false
% @original_name availability_status (eBay used and new)
% @values used_and_new=Used_and_new_units_available unk_avail_eb=Unknown
% @importance 0.5

0.35::true_val(availability_status_ebay, used_and_new); 0.65::true_val(availability_status_ebay, unk_avail_eb).

measured(s23, availability_status_ebay, used_and_new).

all_consistent(availability_status_ebay) :-
    consistent(s23, availability_status_ebay).

evidence(all_consistent(availability_status_ebay)).
query(true_val(availability_status_ebay, used_and_new)).
query(true_val(availability_status_ebay, unk_avail_eb)).

0.82::acc(s15, evo_reputation).

% @attr evo_reputation
% @type categorical
% @canonical false
% @original_name evo.com reputation
% @values major_reputable=Major_reputable_US_retailer unk_evo_reputation=Unknown
% @importance 0.85

0.72::true_val(evo_reputation, major_reputable); 0.28::true_val(evo_reputation, unk_evo_reputation).

measured(s15, evo_reputation, major_reputable).

all_consistent(evo_reputation) :-
    consistent(s15, evo_reputation).

evidence(all_consistent(evo_reputation)).
query(true_val(evo_reputation, major_reputable)).
query(true_val(evo_reputation, unk_evo_reputation)).

0.82::acc(s16, backcountry_reputation).

% @attr backcountry_reputation
% @type categorical
% @canonical false
% @original_name Backcountry.com reputation
% @values major_retailer=Major_US_outdoor_retailer unk_backcountry_reputation=Unknown
% @importance 0.85

0.72::true_val(backcountry_reputation, major_retailer); 0.28::true_val(backcountry_reputation, unk_backcountry_reputation).

measured(s16, backcountry_reputation, major_retailer).

all_consistent(backcountry_reputation) :-
    consistent(s16, backcountry_reputation).

evidence(all_consistent(backcountry_reputation)).
query(true_val(backcountry_reputation, major_retailer)).
query(true_val(backcountry_reputation, unk_backcountry_reputation)).

0.90::acc(s2, burton_reputation).

% @attr burton_reputation
% @type categorical
% @canonical false
% @original_name Burton.com reputation
% @values official_manufacturer=Official_manufacturer_direct_store unk_burton_reputation=Unknown
% @importance 0.85

0.76::true_val(burton_reputation, official_manufacturer); 0.24::true_val(burton_reputation, unk_burton_reputation).

measured(s2, burton_reputation, official_manufacturer).

all_consistent(burton_reputation) :-
    consistent(s2, burton_reputation).

evidence(all_consistent(burton_reputation)).
query(true_val(burton_reputation, official_manufacturer)).
query(true_val(burton_reputation, unk_burton_reputation)).

0.88::acc(sm, available_sizes).
0.70::acc(s24, available_sizes).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values s146_151_156_161=146_151_156_161cm unk_available_sizes=Unknown
% @importance 0.8

0.95::true_val(available_sizes, s146_151_156_161); 0.05::true_val(available_sizes, unk_available_sizes).

measured(sm, available_sizes, s146_151_156_161).
measured(s24, available_sizes, s146_151_156_161).

all_consistent(available_sizes) :-
    (indep(sm), consistent(sm, available_sizes) ; \+indep(sm)),
    consistent(s24, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, s146_151_156_161)).
query(true_val(available_sizes, unk_available_sizes)).

0.93::acc(sm, available_sizes_merchant_stock).

% @attr available_sizes_merchant_stock
% @type categorical
% @canonical false
% @original_name available_sizes (merchant stock)
% @values s156_only=156cm_only unk_available_sizes_merchant_stock=Unknown
% @importance 0.85

0.93::true_val(available_sizes_merchant_stock, s156_only); 0.07::true_val(available_sizes_merchant_stock, unk_available_sizes_merchant_stock).

measured(sm, available_sizes_merchant_stock, s156_only).

all_consistent(available_sizes_merchant_stock) :-
    consistent(sm, available_sizes_merchant_stock).

evidence(all_consistent(available_sizes_merchant_stock)).
query(true_val(available_sizes_merchant_stock, s156_only)).
query(true_val(available_sizes_merchant_stock, unk_available_sizes_merchant_stock)).

0.88::acc(sm, effective_edge_146).

% @attr effective_edge_146
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge (146cm)
% @values v995=995.0 unk_effective_edge_146=Unknown
% @importance 0.85

0.93::true_val(effective_edge_146, v995); 0.07::true_val(effective_edge_146, unk_effective_edge_146).

measured(sm, effective_edge_146, v995).

all_consistent(effective_edge_146) :-
    consistent(sm, effective_edge_146).

evidence(all_consistent(effective_edge_146)).
query(true_val(effective_edge_146, v995)).
query(true_val(effective_edge_146, unk_effective_edge_146)).

0.88::acc(sm, sidecut_radius_size_146).

% @attr sidecut_radius_size_146
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (146cm)
% @values v5_4=5.4 unk_sidecut_radius_size_146=Unknown
% @importance 0.85

0.93::true_val(sidecut_radius_size_146, v5_4); 0.07::true_val(sidecut_radius_size_146, unk_sidecut_radius_size_146).

measured(sm, sidecut_radius_size_146, v5_4).

all_consistent(sidecut_radius_size_146) :-
    consistent(sm, sidecut_radius_size_146).

evidence(all_consistent(sidecut_radius_size_146)).
query(true_val(sidecut_radius_size_146, v5_4)).
query(true_val(sidecut_radius_size_146, unk_sidecut_radius_size_146)).

0.88::acc(sm, tip_width_146).

% @attr tip_width_146
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size (146cm nose)
% @values v303_6=303.6 unk_tip_width_146=Unknown
% @importance 0.85

0.93::true_val(tip_width_146, v303_6); 0.07::true_val(tip_width_146, unk_tip_width_146).

measured(sm, tip_width_146, v303_6).

all_consistent(tip_width_146) :-
    consistent(sm, tip_width_146).

evidence(all_consistent(tip_width_146)).
query(true_val(tip_width_146, v303_6)).
query(true_val(tip_width_146, unk_tip_width_146)).

0.88::acc(sm, tail_width_146).

% @attr tail_width_146
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size (146cm tail)
% @values v273_6=273.6 unk_tail_width_146=Unknown
% @importance 0.85

0.93::true_val(tail_width_146, v273_6); 0.07::true_val(tail_width_146, unk_tail_width_146).

measured(sm, tail_width_146, v273_6).

all_consistent(tail_width_146) :-
    consistent(sm, tail_width_146).

evidence(all_consistent(tail_width_146)).
query(true_val(tail_width_146, v273_6)).
query(true_val(tail_width_146, unk_tail_width_146)).

0.88::acc(sm, waist_width_146).

% @attr waist_width_146
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width (146cm)
% @values v252=252.0 unk_waist_width_146=Unknown
% @importance 0.85

0.93::true_val(waist_width_146, v252); 0.07::true_val(waist_width_146, unk_waist_width_146).

measured(sm, waist_width_146, v252).

all_consistent(waist_width_146) :-
    consistent(sm, waist_width_146).

evidence(all_consistent(waist_width_146)).
query(true_val(waist_width_146, v252)).
query(true_val(waist_width_146, unk_waist_width_146)).

0.88::acc(sm, stance_width_range_size_146).

% @attr stance_width_range_size_146
% @type numeric
% @unit mm
% @canonical false
% @original_name stance_width_range_size (146cm)
% @values v480=480.0 unk_stance_width_range_size_146=Unknown
% @importance 0.85

0.93::true_val(stance_width_range_size_146, v480); 0.07::true_val(stance_width_range_size_146, unk_stance_width_range_size_146).

measured(sm, stance_width_range_size_146, v480).

all_consistent(stance_width_range_size_146) :-
    consistent(sm, stance_width_range_size_146).

evidence(all_consistent(stance_width_range_size_146)).
query(true_val(stance_width_range_size_146, v480)).
query(true_val(stance_width_range_size_146, unk_stance_width_range_size_146)).

0.88::acc(sm, setback_146).

% @attr setback_146
% @type numeric
% @unit mm
% @canonical false
% @original_name setback (146cm)
% @values vneg50=neg50.0 unk_setback_146=Unknown
% @importance 0.85

0.93::true_val(setback_146, vneg50); 0.07::true_val(setback_146, unk_setback_146).

measured(sm, setback_146, vneg50).

all_consistent(setback_146) :-
    consistent(sm, setback_146).

evidence(all_consistent(setback_146)).
query(true_val(setback_146, vneg50)).
query(true_val(setback_146, unk_setback_146)).

0.88::acc(sm, recommended_weight_range_size_146).

% @attr recommended_weight_range_size_146
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (146cm)
% @values w45_68=45_to_68kg unk_recommended_weight_range_size_146=Unknown
% @importance 0.85

0.93::true_val(recommended_weight_range_size_146, w45_68); 0.07::true_val(recommended_weight_range_size_146, unk_recommended_weight_range_size_146).

measured(sm, recommended_weight_range_size_146, w45_68).

all_consistent(recommended_weight_range_size_146) :-
    consistent(sm, recommended_weight_range_size_146).

evidence(all_consistent(recommended_weight_range_size_146)).
query(true_val(recommended_weight_range_size_146, w45_68)).
query(true_val(recommended_weight_range_size_146, unk_recommended_weight_range_size_146)).

0.88::acc(sm, effective_edge_151).

% @attr effective_edge_151
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge (151cm)
% @values v1045=1045.0 unk_effective_edge_151=Unknown
% @importance 0.85

0.93::true_val(effective_edge_151, v1045); 0.07::true_val(effective_edge_151, unk_effective_edge_151).

measured(sm, effective_edge_151, v1045).

all_consistent(effective_edge_151) :-
    consistent(sm, effective_edge_151).

evidence(all_consistent(effective_edge_151)).
query(true_val(effective_edge_151, v1045)).
query(true_val(effective_edge_151, unk_effective_edge_151)).

0.88::acc(sm, sidecut_radius_size_151).

% @attr sidecut_radius_size_151
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (151cm)
% @values v5_8=5.8 unk_sidecut_radius_size_151=Unknown
% @importance 0.85

0.93::true_val(sidecut_radius_size_151, v5_8); 0.07::true_val(sidecut_radius_size_151, unk_sidecut_radius_size_151).

measured(sm, sidecut_radius_size_151, v5_8).

all_consistent(sidecut_radius_size_151) :-
    consistent(sm, sidecut_radius_size_151).

evidence(all_consistent(sidecut_radius_size_151)).
query(true_val(sidecut_radius_size_151, v5_8)).
query(true_val(sidecut_radius_size_151, unk_sidecut_radius_size_151)).

0.88::acc(sm, tip_width_151).

% @attr tip_width_151
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size (151cm nose)
% @values v311_5=311.5 unk_tip_width_151=Unknown
% @importance 0.85

0.93::true_val(tip_width_151, v311_5); 0.07::true_val(tip_width_151, unk_tip_width_151).

measured(sm, tip_width_151, v311_5).

all_consistent(tip_width_151) :-
    consistent(sm, tip_width_151).

evidence(all_consistent(tip_width_151)).
query(true_val(tip_width_151, v311_5)).
query(true_val(tip_width_151, unk_tip_width_151)).

0.88::acc(sm, tail_width_151).

% @attr tail_width_151
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size (151cm tail)
% @values v281_5=281.5 unk_tail_width_151=Unknown
% @importance 0.85

0.93::true_val(tail_width_151, v281_5); 0.07::true_val(tail_width_151, unk_tail_width_151).

measured(sm, tail_width_151, v281_5).

all_consistent(tail_width_151) :-
    consistent(sm, tail_width_151).

evidence(all_consistent(tail_width_151)).
query(true_val(tail_width_151, v281_5)).
query(true_val(tail_width_151, unk_tail_width_151)).

0.88::acc(sm, waist_width_151).

% @attr waist_width_151
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width (151cm)
% @values v258=258.0 unk_waist_width_151=Unknown
% @importance 0.85

0.93::true_val(waist_width_151, v258); 0.07::true_val(waist_width_151, unk_waist_width_151).

measured(sm, waist_width_151, v258).

all_consistent(waist_width_151) :-
    consistent(sm, waist_width_151).

evidence(all_consistent(waist_width_151)).
query(true_val(waist_width_151, v258)).
query(true_val(waist_width_151, unk_waist_width_151)).

0.88::acc(sm, stance_width_range_size_151).

% @attr stance_width_range_size_151
% @type numeric
% @unit mm
% @canonical false
% @original_name stance_width_range_size (151cm)
% @values v530=530.0 unk_stance_width_range_size_151=Unknown
% @importance 0.85

0.93::true_val(stance_width_range_size_151, v530); 0.07::true_val(stance_width_range_size_151, unk_stance_width_range_size_151).

measured(sm, stance_width_range_size_151, v530).

all_consistent(stance_width_range_size_151) :-
    consistent(sm, stance_width_range_size_151).

evidence(all_consistent(stance_width_range_size_151)).
query(true_val(stance_width_range_size_151, v530)).
query(true_val(stance_width_range_size_151, unk_stance_width_range_size_151)).

0.88::acc(sm, setback_151).

% @attr setback_151
% @type numeric
% @unit mm
% @canonical false
% @original_name setback (151cm)
% @values vneg50=neg50.0 unk_setback_151=Unknown
% @importance 0.85

0.93::true_val(setback_151, vneg50); 0.07::true_val(setback_151, unk_setback_151).

measured(sm, setback_151, vneg50).

all_consistent(setback_151) :-
    consistent(sm, setback_151).

evidence(all_consistent(setback_151)).
query(true_val(setback_151, vneg50)).
query(true_val(setback_151, unk_setback_151)).

0.88::acc(sm, recommended_weight_range_size_151).

% @attr recommended_weight_range_size_151
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (151cm)
% @values w54_82=54_to_82kg unk_recommended_weight_range_size_151=Unknown
% @importance 0.85

0.93::true_val(recommended_weight_range_size_151, w54_82); 0.07::true_val(recommended_weight_range_size_151, unk_recommended_weight_range_size_151).

measured(sm, recommended_weight_range_size_151, w54_82).

all_consistent(recommended_weight_range_size_151) :-
    consistent(sm, recommended_weight_range_size_151).

evidence(all_consistent(recommended_weight_range_size_151)).
query(true_val(recommended_weight_range_size_151, w54_82)).
query(true_val(recommended_weight_range_size_151, unk_recommended_weight_range_size_151)).

0.88::acc(sm, effective_edge_156).

% @attr effective_edge_156
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge (156cm)
% @values v1095=1095.0 unk_effective_edge_156=Unknown
% @importance 0.85

0.93::true_val(effective_edge_156, v1095); 0.07::true_val(effective_edge_156, unk_effective_edge_156).

measured(sm, effective_edge_156, v1095).

all_consistent(effective_edge_156) :-
    consistent(sm, effective_edge_156).

evidence(all_consistent(effective_edge_156)).
query(true_val(effective_edge_156, v1095)).
query(true_val(effective_edge_156, unk_effective_edge_156)).

0.88::acc(sm, sidecut_radius_size).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size (156cm)
% @values v6_1=6.1 unk_sidecut_radius_size=Unknown
% @importance 0.85

0.93::true_val(sidecut_radius_size, v6_1); 0.07::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(sm, sidecut_radius_size, v6_1).

all_consistent(sidecut_radius_size) :-
    consistent(sm, sidecut_radius_size).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v6_1)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

0.88::acc(sm, tip_tail_width_size).

% @attr tip_tail_width_size
% @type numeric
% @unit mm
% @canonical true
% @original_name tip_tail_width_size (156cm nose)
% @values v315_3=315.3 unk_tip_tail_width_size=Unknown
% @importance 0.85

0.93::true_val(tip_tail_width_size, v315_3); 0.07::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(sm, tip_tail_width_size, v315_3).

all_consistent(tip_tail_width_size) :-
    consistent(sm, tip_tail_width_size).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v315_3)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

0.88::acc(sm, tail_width_156).

% @attr tail_width_156
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size (156cm tail)
% @values v285_3=285.3 unk_tail_width_156=Unknown
% @importance 0.85

0.93::true_val(tail_width_156, v285_3); 0.07::true_val(tail_width_156, unk_tail_width_156).

measured(sm, tail_width_156, v285_3).

all_consistent(tail_width_156) :-
    consistent(sm, tail_width_156).

evidence(all_consistent(tail_width_156)).
query(true_val(tail_width_156, v285_3)).
query(true_val(tail_width_156, unk_tail_width_156)).

0.88::acc(sm, waist_width_156).

% @attr waist_width_156
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width (156cm)
% @values v260=260.0 unk_waist_width_156=Unknown
% @importance 0.85

0.93::true_val(waist_width_156, v260); 0.07::true_val(waist_width_156, unk_waist_width_156).

measured(sm, waist_width_156, v260).

all_consistent(waist_width_156) :-
    consistent(sm, waist_width_156).

evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v260)).
query(true_val(waist_width_156, unk_waist_width_156)).

0.88::acc(sm, stance_width_range_size).

% @attr stance_width_range_size
% @type numeric
% @unit mm
% @canonical true
% @original_name stance_width_range_size (156cm)
% @values v560=560.0 unk_stance_width_range_size=Unknown
% @importance 0.85

0.93::true_val(stance_width_range_size, v560); 0.07::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(sm, stance_width_range_size, v560).

all_consistent(stance_width_range_size) :-
    consistent(sm, stance_width_range_size).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v560)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

0.88::acc(sm, setback).
0.78::acc(s27, setback).

% @attr setback
% @type numeric
% @unit mm
% @canonical true
% @original_name setback (156cm)
% @values vneg50=neg50.0 unk_setback=Unknown
% @importance 0.78

0.95::true_val(setback, vneg50); 0.05::true_val(setback, unk_setback).

measured(sm, setback, vneg50).
measured(s27, setback, vneg50).

all_consistent(setback) :-
    (indep(sm), consistent(sm, setback) ; \+indep(sm)),
    consistent(s27, setback).

evidence(all_consistent(setback)).
query(true_val(setback, vneg50)).
query(true_val(setback, unk_setback)).

0.88::acc(sm, recommended_weight_range_size).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size (156cm)
% @values w68_91=68_to_91kg unk_recommended_weight_range_size=Unknown
% @importance 0.85

0.93::true_val(recommended_weight_range_size, w68_91); 0.07::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(sm, recommended_weight_range_size, w68_91).

all_consistent(recommended_weight_range_size) :-
    consistent(sm, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w68_91)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

0.88::acc(sm, effective_edge_161).
0.78::acc(s27, effective_edge_161).

% @attr effective_edge_161
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge (161cm)
% @values v1145=1145.0 unk_effective_edge_161=Unknown
% @importance 0.78

0.95::true_val(effective_edge_161, v1145); 0.05::true_val(effective_edge_161, unk_effective_edge_161).

measured(sm, effective_edge_161, v1145).
measured(s27, effective_edge_161, v1145).

all_consistent(effective_edge_161) :-
    (indep(sm), consistent(sm, effective_edge_161) ; \+indep(sm)),
    consistent(s27, effective_edge_161).

evidence(all_consistent(effective_edge_161)).
query(true_val(effective_edge_161, v1145)).
query(true_val(effective_edge_161, unk_effective_edge_161)).

0.88::acc(sm, sidecut_radius_size_161).

% @attr sidecut_radius_size_161
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (161cm)
% @values v6_4=6.4 unk_sidecut_radius_size_161=Unknown
% @importance 0.85

0.93::true_val(sidecut_radius_size_161, v6_4); 0.07::true_val(sidecut_radius_size_161, unk_sidecut_radius_size_161).

measured(sm, sidecut_radius_size_161, v6_4).

all_consistent(sidecut_radius_size_161) :-
    consistent(sm, sidecut_radius_size_161).

evidence(all_consistent(sidecut_radius_size_161)).
query(true_val(sidecut_radius_size_161, v6_4)).
query(true_val(sidecut_radius_size_161, unk_sidecut_radius_size_161)).

0.88::acc(sm, tip_width_161).

% @attr tip_width_161
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size (161cm nose)
% @values v319_1=319.1 unk_tip_width_161=Unknown
% @importance 0.85

0.93::true_val(tip_width_161, v319_1); 0.07::true_val(tip_width_161, unk_tip_width_161).

measured(sm, tip_width_161, v319_1).

all_consistent(tip_width_161) :-
    consistent(sm, tip_width_161).

evidence(all_consistent(tip_width_161)).
query(true_val(tip_width_161, v319_1)).
query(true_val(tip_width_161, unk_tip_width_161)).

0.88::acc(sm, tail_width_161).

% @attr tail_width_161
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size (161cm tail)
% @values v289_1=289.1 unk_tail_width_161=Unknown
% @importance 0.85

0.93::true_val(tail_width_161, v289_1); 0.07::true_val(tail_width_161, unk_tail_width_161).

measured(sm, tail_width_161, v289_1).

all_consistent(tail_width_161) :-
    consistent(sm, tail_width_161).

evidence(all_consistent(tail_width_161)).
query(true_val(tail_width_161, v289_1)).
query(true_val(tail_width_161, unk_tail_width_161)).

0.88::acc(sm, waist_width_161).

% @attr waist_width_161
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width (161cm)
% @values v262=262.0 unk_waist_width_161=Unknown
% @importance 0.85

0.93::true_val(waist_width_161, v262); 0.07::true_val(waist_width_161, unk_waist_width_161).

measured(sm, waist_width_161, v262).

all_consistent(waist_width_161) :-
    consistent(sm, waist_width_161).

evidence(all_consistent(waist_width_161)).
query(true_val(waist_width_161, v262)).
query(true_val(waist_width_161, unk_waist_width_161)).

0.88::acc(sm, stance_width_range_size_161).

% @attr stance_width_range_size_161
% @type numeric
% @unit mm
% @canonical false
% @original_name stance_width_range_size (161cm)
% @values v560=560.0 unk_stance_width_range_size_161=Unknown
% @importance 0.85

0.93::true_val(stance_width_range_size_161, v560); 0.07::true_val(stance_width_range_size_161, unk_stance_width_range_size_161).

measured(sm, stance_width_range_size_161, v560).

all_consistent(stance_width_range_size_161) :-
    consistent(sm, stance_width_range_size_161).

evidence(all_consistent(stance_width_range_size_161)).
query(true_val(stance_width_range_size_161, v560)).
query(true_val(stance_width_range_size_161, unk_stance_width_range_size_161)).

0.88::acc(sm, setback_161).
0.78::acc(s27, setback_161).

% @attr setback_161
% @type numeric
% @unit mm
% @canonical false
% @original_name setback (161cm)
% @values vneg50=neg50.0 unk_setback_161=Unknown
% @importance 0.78

0.95::true_val(setback_161, vneg50); 0.05::true_val(setback_161, unk_setback_161).

measured(sm, setback_161, vneg50).
measured(s27, setback_161, vneg50).

all_consistent(setback_161) :-
    (indep(sm), consistent(sm, setback_161) ; \+indep(sm)),
    consistent(s27, setback_161).

evidence(all_consistent(setback_161)).
query(true_val(setback_161, vneg50)).
query(true_val(setback_161, unk_setback_161)).

0.88::acc(sm, recommended_weight_range_size_161).

% @attr recommended_weight_range_size_161
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (161cm)
% @values w82_118plus=82_to_118plus_kg unk_recommended_weight_range_size_161=Unknown
% @importance 0.85

0.93::true_val(recommended_weight_range_size_161, w82_118plus); 0.07::true_val(recommended_weight_range_size_161, unk_recommended_weight_range_size_161).

measured(sm, recommended_weight_range_size_161, w82_118plus).

all_consistent(recommended_weight_range_size_161) :-
    consistent(sm, recommended_weight_range_size_161).

evidence(all_consistent(recommended_weight_range_size_161)).
query(true_val(recommended_weight_range_size_161, w82_118plus)).
query(true_val(recommended_weight_range_size_161, unk_recommended_weight_range_size_161)).

0.55::acc(s25, board_weight_grams).

% @attr board_weight_grams
% @type numeric
% @unit g
% @canonical true
% @original_name board_weight_grams
% @values v2900=2900.0 unk_board_weight_grams=Unknown
% @importance 0.7

0.34::true_val(board_weight_grams, v2900); 0.66::true_val(board_weight_grams, unk_board_weight_grams).

measured(s25, board_weight_grams, v2900).

all_consistent(board_weight_grams) :-
    consistent(s25, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v2900)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

0.82::acc(s26, weight_character).

% @attr weight_character
% @type categorical
% @canonical false
% @original_name Weight character
% @values lighter_side_normal=Lighter_side_of_normal_not_ultralight unk_weight_character=Unknown
% @importance 0.65

0.68::true_val(weight_character, lighter_side_normal); 0.32::true_val(weight_character, unk_weight_character).

measured(s26, weight_character, lighter_side_normal).

all_consistent(weight_character) :-
    consistent(s26, weight_character).

evidence(all_consistent(weight_character)).
query(true_val(weight_character, lighter_side_normal)).
query(true_val(weight_character, unk_weight_character)).

0.78::acc(s27, contact_length_size).

% @attr contact_length_size
% @type numeric
% @unit mm
% @canonical true
% @original_name contact_length_size
% @values v1040=1040.0 unk_contact_length_size=Unknown
% @importance 0.7

0.52::true_val(contact_length_size, v1040); 0.48::true_val(contact_length_size, unk_contact_length_size).

measured(s27, contact_length_size, v1040).

all_consistent(contact_length_size) :-
    consistent(s27, contact_length_size).

evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v1040)).
query(true_val(contact_length_size, unk_contact_length_size)).

0.90::acc(sm, shape).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 0.85

0.93::true_val(shape, tapered_directional); 0.07::true_val(shape, unk_shape).

measured(sm, shape, tapered_directional).

all_consistent(shape) :-
    consistent(sm, shape).

evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

0.85::acc(sm, tail_design).
0.75::acc(s28, tail_design).

% @attr tail_design
% @type categorical
% @canonical false
% @original_name Tail design
% @values double_swallowtail=Double_swallowtail unk_tail_design=Unknown
% @importance 0.83

0.95::true_val(tail_design, double_swallowtail); 0.05::true_val(tail_design, unk_tail_design).

measured(sm, tail_design, double_swallowtail).
measured(s28, tail_design, double_swallowtail).

all_consistent(tail_design) :-
    (indep(sm), consistent(sm, tail_design) ; \+indep(sm)),
    (indep(s28), consistent(s28, tail_design) ; \+indep(s28)).

evidence(all_consistent(tail_design)).
query(true_val(tail_design, double_swallowtail)).
query(true_val(tail_design, unk_tail_design)).

0.85::acc(sm, taper).
0.80::acc(s29, taper).

% @attr taper
% @type numeric
% @unit mm
% @canonical true
% @original_name taper
% @values v30=30.0 unk_taper=Unknown
% @importance 0.85

0.95::true_val(taper, v30); 0.05::true_val(taper, unk_taper).

measured(sm, taper, v30).
measured(s29, taper, v30).

all_consistent(taper) :-
    (indep(sm), consistent(sm, taper) ; \+indep(sm)),
    (indep(s19), consistent(s19, taper) ; \+indep(s19)).

evidence(all_consistent(taper)).
query(true_val(taper, v30)).
query(true_val(taper, unk_taper)).

0.80::acc(s30, base_3d_technology).
0.80::acc(s93, base_3d_technology).

% @attr base_3d_technology
% @type categorical
% @canonical false
% @original_name 3D base technology
% @values convex_tip_tail_flat_middle=Surfboard_inspired_3D_convex_nose_tail_flat_middle unk_base_3d_technology=Unknown
% @importance 0.83

0.95::true_val(base_3d_technology, convex_tip_tail_flat_middle); 0.05::true_val(base_3d_technology, unk_base_3d_technology).

measured(s30, base_3d_technology, convex_tip_tail_flat_middle).
measured(s93, base_3d_technology, convex_tip_tail_flat_middle).

all_consistent(base_3d_technology) :-
    (indep(s19), consistent(s19, base_3d_technology) ; \+indep(s19)),
    consistent(s93, base_3d_technology).

evidence(all_consistent(base_3d_technology)).
query(true_val(base_3d_technology, convex_tip_tail_flat_middle)).
query(true_val(base_3d_technology, unk_base_3d_technology)).

0.78::acc(s31, overall_length_concept).

% @attr overall_length_concept
% @type categorical
% @canonical false
% @original_name Overall length concept
% @values size_3_5cm_shorter=Shortened_ride_3_to_5cm_shorter_than_normal unk_overall_length_concept=Unknown
% @importance 0.75

0.60::true_val(overall_length_concept, size_3_5cm_shorter); 0.40::true_val(overall_length_concept, unk_overall_length_concept).

measured(s31, overall_length_concept, size_3_5cm_shorter).

all_consistent(overall_length_concept) :-
    consistent(s31, overall_length_concept).

evidence(all_consistent(overall_length_concept)).
query(true_val(overall_length_concept, size_3_5cm_shorter)).
query(true_val(overall_length_concept, unk_overall_length_concept)).

0.90::acc(sm, width_options).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard=Standard_not_wide unk_width_options=Unknown
% @importance 0.85

0.93::true_val(width_options, standard); 0.07::true_val(width_options, unk_width_options).

measured(sm, width_options, standard).

all_consistent(width_options) :-
    consistent(sm, width_options).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard)).
query(true_val(width_options, unk_width_options)).

0.88::acc(sm, camber_type).
0.85::acc(s32, camber_type).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values directional_flat_top=Directional_Flat_Top_flat_camber_rocker_nose unk_camber_type=Unknown
% @importance 0.9

0.95::true_val(camber_type, directional_flat_top); 0.05::true_val(camber_type, unk_camber_type).

measured(sm, camber_type, directional_flat_top).
measured(s32, camber_type, directional_flat_top).

all_consistent(camber_type) :-
    (indep(sm), consistent(sm, camber_type) ; \+indep(sm)),
    (indep(s32), consistent(s32, camber_type) ; \+indep(s32)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, directional_flat_top)).
query(true_val(camber_type, unk_camber_type)).

0.90::acc(sm, flex_rating_10).

% @attr flex_rating_10
% @type numeric
% @unit out_of_10
% @canonical true
% @original_name flex_rating_10
% @values v4_5=4.5 unk_flex_rating_10=Unknown
% @importance 0.85

0.93::true_val(flex_rating_10, v4_5); 0.07::true_val(flex_rating_10, unk_flex_rating_10).

measured(sm, flex_rating_10, v4_5).

all_consistent(flex_rating_10) :-
    consistent(sm, flex_rating_10).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v4_5)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

0.85::acc(sm, flex_feel).
0.70::acc(s21, flex_feel).
0.82::acc(s34, flex_feel).
0.88::acc(s35, flex_feel).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values mid_flex=Mid_flex_Medium medium=Medium med_stiff_varied=Med_stiff_between_feet_soft_nose_med_stiff_tail soft_for_split=One_of_softest_EC_splits
% @importance 0.75

0.35::true_val(flex_feel, mid_flex); 0.20::true_val(flex_feel, med_stiff_varied); 0.45::true_val(flex_feel, soft_for_split).

measured(sm, flex_feel, mid_flex).
measured(s21, flex_feel, mid_flex).
measured(s34, flex_feel, med_stiff_varied).
measured(s35, flex_feel, soft_for_split).

all_consistent(flex_feel) :-
    (indep(sm), consistent(sm, flex_feel) ; \+indep(sm)),
    (indep(s21), consistent(s21, flex_feel) ; \+indep(s21)),
    consistent(s34, flex_feel),
    consistent(s35, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, mid_flex)).
query(true_val(flex_feel, med_stiff_varied)).
query(true_val(flex_feel, soft_for_split)).

0.82::acc(s33, flex_rating_10_evo).

% @attr flex_rating_10_evo
% @type categorical
% @canonical false
% @original_name flex_rating_10_evo
% @values medium=Medium_3_to_5_range unk_flex_rating_10_evo=Unknown
% @importance 0.7

0.72::true_val(flex_rating_10_evo, medium); 0.28::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).

measured(s33, flex_rating_10_evo, medium).

all_consistent(flex_rating_10_evo) :-
    consistent(s33, flex_rating_10_evo).

evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, medium)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

0.88::acc(sm, flex_direction).
0.85::acc(s95, flex_direction).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values directional_flex=Directional_flex_stiffer_nose_pop_tail unk_flex_direction=Unknown
% @importance 0.78

0.95::true_val(flex_direction, directional_flex); 0.05::true_val(flex_direction, unk_flex_direction).

measured(sm, flex_direction, directional_flex).
measured(s95, flex_direction, directional_flex).

all_consistent(flex_direction) :-
    (indep(sm), consistent(sm, flex_direction) ; \+indep(sm)),
    (indep(s45), consistent(s45, flex_direction) ; \+indep(s45)).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional_flex)).
query(true_val(flex_direction, unk_flex_direction)).

0.82::acc(sm, core_material).
0.75::acc(s36, core_material).
0.80::acc(s37, core_material).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values fsc_super_fly_ii_700g=FSC_Super_Fly_II_700G_dual_species_wood unk_core_material=Unknown
% @importance 0.72

0.95::true_val(core_material, fsc_super_fly_ii_700g); 0.05::true_val(core_material, unk_core_material).

measured(sm, core_material, fsc_super_fly_ii_700g).
measured(s36, core_material, fsc_super_fly_ii_700g).
measured(s37, core_material, fsc_super_fly_ii_700g).

all_consistent(core_material) :-
    (indep(sm), consistent(sm, core_material) ; \+indep(sm)),
    (indep(s36), consistent(s36, core_material) ; \+indep(s36)),
    consistent(s37, core_material).

evidence(all_consistent(core_material)).
query(true_val(core_material, fsc_super_fly_ii_700g)).
query(true_val(core_material, unk_core_material)).

0.78::acc(s38, core_profiling).

% @attr core_profiling
% @type categorical
% @canonical false
% @original_name Core profiling
% @values squeezebox=Squeezebox_thick_thin_core_balance unk_core_profiling=Unknown
% @importance 0.7

0.62::true_val(core_profiling, squeezebox); 0.38::true_val(core_profiling, unk_core_profiling).

measured(s38, core_profiling, squeezebox).

all_consistent(core_profiling) :-
    (indep(s38), consistent(s38, core_profiling) ; \+indep(s38)).

evidence(all_consistent(core_profiling)).
query(true_val(core_profiling, squeezebox)).
query(true_val(core_profiling, unk_core_profiling)).

0.85::acc(sm, edge_technology).
0.78::acc(s39, edge_technology).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values dualzone_egd=Dualzone_EGD_perpendicular_wood_grain_edges unk_edge_technology=Unknown
% @importance 0.7

0.95::true_val(edge_technology, dualzone_egd); 0.05::true_val(edge_technology, unk_edge_technology).

measured(sm, edge_technology, dualzone_egd).
measured(s39, edge_technology, dualzone_egd).

all_consistent(edge_technology) :-
    (indep(sm), consistent(sm, edge_technology) ; \+indep(sm)),
    (indep(s39), consistent(s39, edge_technology) ; \+indep(s39)).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, dualzone_egd)).
query(true_val(edge_technology, unk_edge_technology)).

0.85::acc(sm, laminate).
0.75::acc(s40, laminate).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values carbon_highlights_45=45_degree_Carbon_Highlights_tip_to_tail unk_laminate=Unknown
% @importance 0.75

0.95::true_val(laminate, carbon_highlights_45); 0.05::true_val(laminate, unk_laminate).

measured(sm, laminate, carbon_highlights_45).
measured(s40, laminate, carbon_highlights_45).

all_consistent(laminate) :-
    (indep(sm), consistent(sm, laminate) ; \+indep(sm)),
    (indep(s40), consistent(s40, laminate) ; \+indep(s40)).

evidence(all_consistent(laminate)).
query(true_val(laminate, carbon_highlights_45)).
query(true_val(laminate, unk_laminate)).

0.78::acc(s41, construction_material_innovation).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values fiber_45_aggressive=45_degree_fiber_angle_more_aggressive_ride unk_construction_material_innovation=Unknown
% @importance 0.55

0.62::true_val(construction_material_innovation, fiber_45_aggressive); 0.38::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s41, construction_material_innovation, fiber_45_aggressive).

all_consistent(construction_material_innovation) :-
    (indep(s41), consistent(s41, construction_material_innovation) ; \+indep(s41)).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, fiber_45_aggressive)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

0.70::acc(s42, laminate_mystery_glass).

% @attr laminate_mystery_glass
% @type categorical
% @canonical false
% @original_name laminate (Mystery Glass)
% @values mystery_glass=Mystery_Glass_fiberglass_carbon_blend unk_laminate_mystery_glass=Unknown
% @importance 0.6

0.48::true_val(laminate_mystery_glass, mystery_glass); 0.52::true_val(laminate_mystery_glass, unk_laminate_mystery_glass).

measured(s42, laminate_mystery_glass, mystery_glass).

all_consistent(laminate_mystery_glass) :-
    (indep(s42), consistent(s42, laminate_mystery_glass) ; \+indep(s42)).

evidence(all_consistent(laminate_mystery_glass)).
query(true_val(laminate_mystery_glass, mystery_glass)).
query(true_val(laminate_mystery_glass, unk_laminate_mystery_glass)).

0.78::acc(s43, laminate_triax).

% @attr laminate_triax
% @type categorical
% @canonical false
% @original_name laminate (Triax)
% @values triax_fiberglass=Triax_fiberglass_weave unk_laminate_triax=Unknown
% @importance 0.55

0.64::true_val(laminate_triax, triax_fiberglass); 0.36::true_val(laminate_triax, unk_laminate_triax).

measured(s43, laminate_triax, triax_fiberglass).

all_consistent(laminate_triax) :-
    consistent(s43, laminate_triax).

evidence(all_consistent(laminate_triax)).
query(true_val(laminate_triax, triax_fiberglass)).
query(true_val(laminate_triax, unk_laminate_triax)).

0.85::acc(sm, base_material).
0.78::acc(s44, base_material).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_wfo=Sintered_WFO_high_density_wax_infused unk_base_material=Unknown
% @importance 0.8

0.95::true_val(base_material, sintered_wfo); 0.05::true_val(base_material, unk_base_material).

measured(sm, base_material, sintered_wfo).
measured(s44, base_material, sintered_wfo).

all_consistent(base_material) :-
    (indep(sm), consistent(sm, base_material) ; \+indep(sm)),
    (indep(s44), consistent(s44, base_material) ; \+indep(s44)).

evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_wfo)).
query(true_val(base_material, unk_base_material)).

0.78::acc(s44, base_type).

% @attr base_type
% @type categorical
% @canonical false
% @original_name base_type
% @values ultra_durable=Ultra_durable_all_season unk_base_type=Unknown
% @importance 0.8

0.62::true_val(base_type, ultra_durable); 0.38::true_val(base_type, unk_base_type).

measured(s44, base_type, ultra_durable).

all_consistent(base_type) :-
    (indep(s44), consistent(s44, base_type) ; \+indep(s44)).

evidence(all_consistent(base_type)).
query(true_val(base_type, ultra_durable)).
query(true_val(base_type, unk_base_type)).

0.85::acc(s45, resin).

% @attr resin
% @type categorical
% @canonical false
% @original_name resin
% @values super_sap_epoxy=Super_Sap_bio_based_epoxy_50pct_less_carbon unk_resin=Unknown
% @importance 0.45

0.76::true_val(resin, super_sap_epoxy); 0.24::true_val(resin, unk_resin).

measured(s45, resin, super_sap_epoxy).

all_consistent(resin) :-
    (indep(s45), consistent(s45, resin) ; \+indep(s45)).

evidence(all_consistent(resin)).
query(true_val(resin, super_sap_epoxy)).
query(true_val(resin, unk_resin)).

0.85::acc(sm, mounting_pattern).
0.85::acc(s46, mounting_pattern).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values split_channel=Split_Channel_pre_mounted_pucks unk_mounting_pattern=Unknown
% @importance 0.8

0.95::true_val(mounting_pattern, split_channel); 0.05::true_val(mounting_pattern, unk_mounting_pattern).

measured(sm, mounting_pattern, split_channel).
measured(s46, mounting_pattern, split_channel).

all_consistent(mounting_pattern) :-
    (indep(sm), consistent(sm, mounting_pattern) ; \+indep(sm)),
    (indep(s46), consistent(s46, mounting_pattern) ; \+indep(s46)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, split_channel)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

0.78::acc(s47, binding_compatibility).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values all_major_bindings=Compatible_all_major_bindings unk_binding_compatibility=Unknown
% @importance 0.8

0.62::true_val(binding_compatibility, all_major_bindings); 0.38::true_val(binding_compatibility, unk_binding_compatibility).

measured(s47, binding_compatibility, all_major_bindings).

all_consistent(binding_compatibility) :-
    (indep(s47), consistent(s47, binding_compatibility) ; \+indep(s47)).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, all_major_bindings)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

0.85::acc(sm, construction_material_innovation_ir).
0.85::acc(s48, construction_material_innovation_ir).

% @attr construction_material_innovation_ir
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Infinite Ride)
% @values infinite_ride=Infinite_Ride_overbuilt_machine_broken_in unk_construction_material_innovation_ir=Unknown
% @importance 0.65

0.95::true_val(construction_material_innovation_ir, infinite_ride); 0.05::true_val(construction_material_innovation_ir, unk_construction_material_innovation_ir).

measured(sm, construction_material_innovation_ir, infinite_ride).
measured(s48, construction_material_innovation_ir, infinite_ride).

all_consistent(construction_material_innovation_ir) :-
    (indep(sm), consistent(sm, construction_material_innovation_ir) ; \+indep(sm)),
    (indep(s48), consistent(s48, construction_material_innovation_ir) ; \+indep(s48)).

evidence(all_consistent(construction_material_innovation_ir)).
query(true_val(construction_material_innovation_ir, infinite_ride)).
query(true_val(construction_material_innovation_ir, unk_construction_material_innovation_ir)).

0.70::acc(s49, construction_material_innovation_layup).

% @attr construction_material_innovation_layup
% @type categorical
% @canonical false
% @original_name construction_material_innovation (layup order)
% @values five_layer=Topsheet_TopGlass_Core_BottomGlass_Base unk_construction_material_innovation_layup=Unknown
% @importance 0.55

0.50::true_val(construction_material_innovation_layup, five_layer); 0.50::true_val(construction_material_innovation_layup, unk_construction_material_innovation_layup).

measured(s49, construction_material_innovation_layup, five_layer).

all_consistent(construction_material_innovation_layup) :-
    (indep(s49), consistent(s49, construction_material_innovation_layup) ; \+indep(s49)).

evidence(all_consistent(construction_material_innovation_layup)).
query(true_val(construction_material_innovation_layup, five_layer)).
query(true_val(construction_material_innovation_layup, unk_construction_material_innovation_layup)).

0.75::acc(s36, sustainability_certification).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values fsc_certified_core=FSC_certified_core_wood unk_sustainability_certification=Unknown
% @importance 0.85

0.57::true_val(sustainability_certification, fsc_certified_core); 0.43::true_val(sustainability_certification, unk_sustainability_certification).

measured(s36, sustainability_certification, fsc_certified_core).

all_consistent(sustainability_certification) :-
    (indep(s36), consistent(s36, sustainability_certification) ; \+indep(s36)).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, fsc_certified_core)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

0.85::acc(s45, sustainability_certification_resin).

% @attr sustainability_certification_resin
% @type categorical
% @canonical false
% @original_name sustainability_certification (Super Sap)
% @values super_sap_50pct=Super_Sap_Epoxy_50pct_reduced_carbon unk_sustainability_certification_resin=Unknown
% @importance 0.45

0.76::true_val(sustainability_certification_resin, super_sap_50pct); 0.24::true_val(sustainability_certification_resin, unk_sustainability_certification_resin).

measured(s45, sustainability_certification_resin, super_sap_50pct).

all_consistent(sustainability_certification_resin) :-
    (indep(s45), consistent(s45, sustainability_certification_resin) ; \+indep(s45)).

evidence(all_consistent(sustainability_certification_resin)).
query(true_val(sustainability_certification_resin, super_sap_50pct)).
query(true_val(sustainability_certification_resin, unk_sustainability_certification_resin)).

0.88::acc(sm, terrain_suitability_groomer).

% @attr terrain_suitability_groomer
% @type numeric
% @unit out_of_10
% @canonical false
% @original_name terrain_suitability (groomer)
% @values v2=2.0 unk_terrain_suitability_groomer=Unknown
% @importance 0.85

0.93::true_val(terrain_suitability_groomer, v2); 0.07::true_val(terrain_suitability_groomer, unk_terrain_suitability_groomer).

measured(sm, terrain_suitability_groomer, v2).

all_consistent(terrain_suitability_groomer) :-
    consistent(sm, terrain_suitability_groomer).

evidence(all_consistent(terrain_suitability_groomer)).
query(true_val(terrain_suitability_groomer, v2)).
query(true_val(terrain_suitability_groomer, unk_terrain_suitability_groomer)).

0.88::acc(sm, terrain_suitability_freeride).

% @attr terrain_suitability_freeride
% @type numeric
% @unit out_of_10
% @canonical false
% @original_name terrain_suitability (freeride)
% @values v4=4.0 unk_terrain_suitability_freeride=Unknown
% @importance 0.85

0.93::true_val(terrain_suitability_freeride, v4); 0.07::true_val(terrain_suitability_freeride, unk_terrain_suitability_freeride).

measured(sm, terrain_suitability_freeride, v4).

all_consistent(terrain_suitability_freeride) :-
    consistent(sm, terrain_suitability_freeride).

evidence(all_consistent(terrain_suitability_freeride)).
query(true_val(terrain_suitability_freeride, v4)).
query(true_val(terrain_suitability_freeride, unk_terrain_suitability_freeride)).

0.88::acc(sm, terrain_suitability).

% @attr terrain_suitability
% @type numeric
% @unit out_of_10
% @canonical true
% @original_name terrain_suitability (powder)
% @values v10=10.0 unk_terrain_suitability=Unknown
% @importance 0.85

0.93::true_val(terrain_suitability, v10); 0.07::true_val(terrain_suitability, unk_terrain_suitability).

measured(sm, terrain_suitability, v10).

all_consistent(terrain_suitability) :-
    consistent(sm, terrain_suitability).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, v10)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

0.85::acc(sm, skill_level_recommendation).
0.82::acc(s50, skill_level_recommendation).
0.82::acc(s51, skill_level_recommendation).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values intermediate=Intermediate advanced_expert=Advanced_Expert expert=Expert
% @importance 0.82

0.15::true_val(skill_level_recommendation, intermediate); 0.45::true_val(skill_level_recommendation, advanced_expert); 0.40::true_val(skill_level_recommendation, expert).

measured(sm, skill_level_recommendation, intermediate).
measured(s50, skill_level_recommendation, advanced_expert).
measured(s51, skill_level_recommendation, expert).

all_consistent(skill_level_recommendation) :-
    consistent(sm, skill_level_recommendation),
    consistent(s50, skill_level_recommendation),
    consistent(s51, skill_level_recommendation).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, intermediate)).
query(true_val(skill_level_recommendation, advanced_expert)).
query(true_val(skill_level_recommendation, expert)).

0.88::acc(sm, terrain_suitability_desc).

% @attr terrain_suitability_desc
% @type categorical
% @canonical false
% @original_name terrain_suitability (terrain description)
% @values bc_deep_trees=Backcountry_deep_snow_trees unk_terrain_suitability_desc=Unknown
% @importance 0.85

0.93::true_val(terrain_suitability_desc, bc_deep_trees); 0.07::true_val(terrain_suitability_desc, unk_terrain_suitability_desc).

measured(sm, terrain_suitability_desc, bc_deep_trees).

all_consistent(terrain_suitability_desc) :-
    consistent(sm, terrain_suitability_desc).

evidence(all_consistent(terrain_suitability_desc)).
query(true_val(terrain_suitability_desc, bc_deep_trees)).
query(true_val(terrain_suitability_desc, unk_terrain_suitability_desc)).

0.82::acc(s51, terrain_suitability_review).

% @attr terrain_suitability_review
% @type categorical
% @canonical false
% @original_name terrain_suitability (review description)
% @values storm_trees_bigmtn=Storm_days_tight_trees_big_mountain_powder unk_terrain_suitability_review=Unknown
% @importance 0.85

0.72::true_val(terrain_suitability_review, storm_trees_bigmtn); 0.28::true_val(terrain_suitability_review, unk_terrain_suitability_review).

measured(s51, terrain_suitability_review, storm_trees_bigmtn).

all_consistent(terrain_suitability_review) :-
    consistent(s51, terrain_suitability_review).

evidence(all_consistent(terrain_suitability_review)).
query(true_val(terrain_suitability_review, storm_trees_bigmtn)).
query(true_val(terrain_suitability_review, unk_terrain_suitability_review)).

0.88::acc(sm, riding_style).
0.82::acc(s52, riding_style).

% @attr riding_style
% @type categorical
% @canonical false
% @original_name riding_style
% @values surfy=Surfy_feeling unk_riding_style=Unknown
% @importance 0.8

0.95::true_val(riding_style, surfy); 0.05::true_val(riding_style, unk_riding_style).

measured(sm, riding_style, surfy).
measured(s52, riding_style, surfy).

all_consistent(riding_style) :-
    consistent(sm, riding_style),
    consistent(s52, riding_style).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, surfy)).
query(true_val(riding_style, unk_riding_style)).

0.80::acc(s53, use_case).

% @attr use_case
% @type categorical
% @canonical false
% @original_name Use case
% @values quiver_powder_board=Quiver_powder_board_not_all_rounder unk_use_case=Unknown
% @importance 0.85

0.68::true_val(use_case, quiver_powder_board); 0.32::true_val(use_case, unk_use_case).

measured(s53, use_case, quiver_powder_board).

all_consistent(use_case) :-
    consistent(s53, use_case).

evidence(all_consistent(use_case)).
query(true_val(use_case, quiver_powder_board)).
query(true_val(use_case, unk_use_case)).

0.78::acc(s54, warranty).
0.90::acc(s55, warranty).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values three_year=3_year_warranty_Channel_boards unk_warranty=Unknown
% @importance 0.8

0.95::true_val(warranty, three_year); 0.05::true_val(warranty, unk_warranty).

measured(s54, warranty, three_year).
measured(s55, warranty, three_year).

all_consistent(warranty) :-
    (indep(s54), consistent(s54, warranty) ; \+indep(s54)),
    consistent(s55, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, three_year)).
query(true_val(warranty, unk_warranty)).

0.90::acc(s55, warranty_coverage).

% @attr warranty_coverage
% @type categorical
% @canonical false
% @original_name warranty (coverage type)
% @values defects_repair_replace=Against_manufacturer_defects_repair_or_replace unk_warranty_coverage=Unknown
% @importance 0.8

0.86::true_val(warranty_coverage, defects_repair_replace); 0.14::true_val(warranty_coverage, unk_warranty_coverage).

measured(s55, warranty_coverage, defects_repair_replace).

all_consistent(warranty_coverage) :-
    consistent(s55, warranty_coverage).

evidence(all_consistent(warranty_coverage)).
query(true_val(warranty_coverage, defects_repair_replace)).
query(true_val(warranty_coverage, unk_warranty_coverage)).

0.90::acc(s55, warranty_eligibility).

% @attr warranty_eligibility
% @type categorical
% @canonical false
% @original_name warranty (eligibility)
% @values original_purchaser_authorized=Original_purchaser_authorized_retailer_only unk_warranty_eligibility=Unknown
% @importance 0.8

0.86::true_val(warranty_eligibility, original_purchaser_authorized); 0.14::true_val(warranty_eligibility, unk_warranty_eligibility).

measured(s55, warranty_eligibility, original_purchaser_authorized).

all_consistent(warranty_eligibility) :-
    consistent(s55, warranty_eligibility).

evidence(all_consistent(warranty_eligibility)).
query(true_val(warranty_eligibility, original_purchaser_authorized)).
query(true_val(warranty_eligibility, unk_warranty_eligibility)).

0.88::acc(s56, warranty_turnaround).

% @attr warranty_turnaround
% @type categorical
% @canonical false
% @original_name warranty (turnaround)
% @values three_to_four_weeks=Typically_3_to_4_weeks unk_warranty_turnaround=Unknown
% @importance 0.55

0.86::true_val(warranty_turnaround, three_to_four_weeks); 0.14::true_val(warranty_turnaround, unk_warranty_turnaround).

measured(s56, warranty_turnaround, three_to_four_weeks).

all_consistent(warranty_turnaround) :-
    consistent(s56, warranty_turnaround).

evidence(all_consistent(warranty_turnaround)).
query(true_val(warranty_turnaround, three_to_four_weeks)).
query(true_val(warranty_turnaround, unk_warranty_turnaround)).

0.88::acc(s35, positive_aspect).
0.82::acc(s57, positive_aspect).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values exceptional_float=Exceptional_float_unsinkable unk_positive_aspect=Unknown
% @importance 0.9

0.95::true_val(positive_aspect, exceptional_float); 0.05::true_val(positive_aspect, unk_positive_aspect).

measured(s35, positive_aspect, exceptional_float).
measured(s57, positive_aspect, exceptional_float).

all_consistent(positive_aspect) :-
    consistent(s35, positive_aspect),
    consistent(s57, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, exceptional_float)).
query(true_val(positive_aspect, unk_positive_aspect)).

0.82::acc(s58, positive_aspect_trees).
0.88::acc(s35, positive_aspect_trees).

% @attr positive_aspect_trees
% @type categorical
% @canonical false
% @original_name positive_aspect (tree riding)
% @values excellent_trees=Excellent_tree_riding unk_positive_aspect_trees=Unknown
% @importance 0.88

0.95::true_val(positive_aspect_trees, excellent_trees); 0.05::true_val(positive_aspect_trees, unk_positive_aspect_trees).

measured(s58, positive_aspect_trees, excellent_trees).
measured(s35, positive_aspect_trees, excellent_trees).

all_consistent(positive_aspect_trees) :-
    consistent(s58, positive_aspect_trees),
    consistent(s35, positive_aspect_trees).

evidence(all_consistent(positive_aspect_trees)).
query(true_val(positive_aspect_trees, excellent_trees)).
query(true_val(positive_aspect_trees, unk_positive_aspect_trees)).

0.82::acc(s59, positive_aspect_quickness).

% @attr positive_aspect_quickness
% @type categorical
% @canonical false
% @original_name positive_aspect (quickness)
% @values super_quick_responsive=Super_quick_responsive unk_positive_aspect_quickness=Unknown
% @importance 0.8

0.68::true_val(positive_aspect_quickness, super_quick_responsive); 0.32::true_val(positive_aspect_quickness, unk_positive_aspect_quickness).

measured(s59, positive_aspect_quickness, super_quick_responsive).

all_consistent(positive_aspect_quickness) :-
    consistent(s59, positive_aspect_quickness).

evidence(all_consistent(positive_aspect_quickness)).
query(true_val(positive_aspect_quickness, super_quick_responsive)).
query(true_val(positive_aspect_quickness, unk_positive_aspect_quickness)).

0.82::acc(s60, positive_aspect_taper_feel).

% @attr positive_aspect_taper_feel
% @type categorical
% @canonical false
% @original_name positive_aspect (taper feel)
% @values taper_doesnt_feel_washy=30mm_taper_doesnt_feel_washy unk_positive_aspect_taper_feel=Unknown
% @importance 0.7

0.68::true_val(positive_aspect_taper_feel, taper_doesnt_feel_washy); 0.32::true_val(positive_aspect_taper_feel, unk_positive_aspect_taper_feel).

measured(s60, positive_aspect_taper_feel, taper_doesnt_feel_washy).

all_consistent(positive_aspect_taper_feel) :-
    consistent(s60, positive_aspect_taper_feel).

evidence(all_consistent(positive_aspect_taper_feel)).
query(true_val(positive_aspect_taper_feel, taper_doesnt_feel_washy)).
query(true_val(positive_aspect_taper_feel, unk_positive_aspect_taper_feel)).

0.80::acc(s61, positive_aspect_3d_smooth).

% @attr positive_aspect_3d_smooth
% @type categorical
% @canonical false
% @original_name positive_aspect (3D smoothness)
% @values smooth_fun_3d=Smooth_and_fun_due_to_3D_tech unk_positive_aspect_3d_smooth=Unknown
% @importance 0.7

0.64::true_val(positive_aspect_3d_smooth, smooth_fun_3d); 0.36::true_val(positive_aspect_3d_smooth, unk_positive_aspect_3d_smooth).

measured(s61, positive_aspect_3d_smooth, smooth_fun_3d).

all_consistent(positive_aspect_3d_smooth) :-
    consistent(s61, positive_aspect_3d_smooth).

evidence(all_consistent(positive_aspect_3d_smooth)).
query(true_val(positive_aspect_3d_smooth, smooth_fun_3d)).
query(true_val(positive_aspect_3d_smooth, unk_positive_aspect_3d_smooth)).

0.80::acc(s62, positive_aspect_buttering).

% @attr positive_aspect_buttering
% @type categorical
% @canonical false
% @original_name positive_aspect (buttering)
% @values easy_butter=Board_butters_really_easy unk_positive_aspect_buttering=Unknown
% @importance 0.5

0.64::true_val(positive_aspect_buttering, easy_butter); 0.36::true_val(positive_aspect_buttering, unk_positive_aspect_buttering).

measured(s62, positive_aspect_buttering, easy_butter).

all_consistent(positive_aspect_buttering) :-
    consistent(s62, positive_aspect_buttering).

evidence(all_consistent(positive_aspect_buttering)).
query(true_val(positive_aspect_buttering, easy_butter)).
query(true_val(positive_aspect_buttering, unk_positive_aspect_buttering)).

0.80::acc(s63, positive_aspect_maneuverability).

% @attr positive_aspect_maneuverability
% @type categorical
% @canonical false
% @original_name positive_aspect (maneuverability)
% @values unique_maneuverability=Unique_industry_maneuverability unk_positive_aspect_maneuverability=Unknown
% @importance 0.8

0.60::true_val(positive_aspect_maneuverability, unique_maneuverability); 0.40::true_val(positive_aspect_maneuverability, unk_positive_aspect_maneuverability).

measured(s63, positive_aspect_maneuverability, unique_maneuverability).

all_consistent(positive_aspect_maneuverability) :-
    consistent(s63, positive_aspect_maneuverability).

evidence(all_consistent(positive_aspect_maneuverability)).
query(true_val(positive_aspect_maneuverability, unique_maneuverability)).
query(true_val(positive_aspect_maneuverability, unk_positive_aspect_maneuverability)).

0.82::acc(s64, pop).

% @attr pop
% @type categorical
% @canonical true
% @original_name pop
% @values good_not_exceptional=Good_but_not_exceptional unk_pop=Unknown
% @importance 0.6

0.68::true_val(pop, good_not_exceptional); 0.32::true_val(pop, unk_pop).

measured(s64, pop, good_not_exceptional).

all_consistent(pop) :-
    consistent(s64, pop).

evidence(all_consistent(pop)).
query(true_val(pop, good_not_exceptional)).
query(true_val(pop, unk_pop)).

0.82::acc(s65, base_glide_performance).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values exceptional_out_of_box=Exceptional_out_of_the_box unk_base_glide_performance=Unknown
% @importance 0.65

0.68::true_val(base_glide_performance, exceptional_out_of_box); 0.32::true_val(base_glide_performance, unk_base_glide_performance).

measured(s65, base_glide_performance, exceptional_out_of_box).

all_consistent(base_glide_performance) :-
    consistent(s65, base_glide_performance).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, exceptional_out_of_box)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

0.80::acc(s66, positive_aspect_pucks).

% @attr positive_aspect_pucks
% @type categorical
% @canonical false
% @original_name positive_aspect (pre-mounted pucks)
% @values pucks_ready=Pre_mounted_pucks_underrated_feature unk_positive_aspect_pucks=Unknown
% @importance 0.7

0.63::true_val(positive_aspect_pucks, pucks_ready); 0.37::true_val(positive_aspect_pucks, unk_positive_aspect_pucks).

measured(s66, positive_aspect_pucks, pucks_ready).

all_consistent(positive_aspect_pucks) :-
    consistent(s66, positive_aspect_pucks).

evidence(all_consistent(positive_aspect_pucks)).
query(true_val(positive_aspect_pucks, pucks_ready)).
query(true_val(positive_aspect_pucks, unk_positive_aspect_pucks)).

0.78::acc(s67, positive_aspect_swallowtail).

% @attr positive_aspect_swallowtail
% @type categorical
% @canonical false
% @original_name positive_aspect (swallowtail control)
% @values swallowtail_feels_great=Swallowtail_feels_great_anywhere unk_positive_aspect_swallowtail=Unknown
% @importance 0.7

0.60::true_val(positive_aspect_swallowtail, swallowtail_feels_great); 0.40::true_val(positive_aspect_swallowtail, unk_positive_aspect_swallowtail).

measured(s67, positive_aspect_swallowtail, swallowtail_feels_great).

all_consistent(positive_aspect_swallowtail) :-
    consistent(s67, positive_aspect_swallowtail).

evidence(all_consistent(positive_aspect_swallowtail)).
query(true_val(positive_aspect_swallowtail, swallowtail_feels_great)).
query(true_val(positive_aspect_swallowtail, unk_positive_aspect_swallowtail)).

0.88::acc(s35, award).

% @attr award
% @type categorical
% @canonical false
% @original_name Award
% @values bc_mag_2026_ec=Backcountry_Magazine_2026_Editors_Choice_splitboard unk_award=Unknown
% @importance 0.9

0.86::true_val(award, bc_mag_2026_ec); 0.14::true_val(award, unk_award).

measured(s35, award, bc_mag_2026_ec).

all_consistent(award) :-
    consistent(s35, award).

evidence(all_consistent(award)).
query(true_val(award, bc_mag_2026_ec)).
query(true_val(award, unk_award)).

0.55::acc(s68, user_review_forum).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values heli_ops_trust=Largest_BC_heli_operator_stocks_more_Fish_than_everything unk_user_review_forum=Unknown
% @importance 0.75

0.30::true_val(user_review_forum, heli_ops_trust); 0.70::true_val(user_review_forum, unk_user_review_forum).

measured(s68, user_review_forum, heli_ops_trust).

all_consistent(user_review_forum) :-
    consistent(s68, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, heli_ops_trust)).
query(true_val(user_review_forum, unk_user_review_forum)).

0.78::acc(s69, topsheet_appearance_description).

% @attr topsheet_appearance_description
% @type categorical
% @canonical false
% @original_name topsheet_appearance_description
% @values gorgeous=Gorgeous_board_beautiful_topsheet unk_topsheet_appearance_description=Unknown
% @importance 0.25

0.60::true_val(topsheet_appearance_description, gorgeous); 0.40::true_val(topsheet_appearance_description, unk_topsheet_appearance_description).

measured(s69, topsheet_appearance_description, gorgeous).

all_consistent(topsheet_appearance_description) :-
    consistent(s69, topsheet_appearance_description).

evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, gorgeous)).
query(true_val(topsheet_appearance_description, unk_topsheet_appearance_description)).

0.80::acc(s70, reviewer_opinion_the_good_ride).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values kept_in_quiver=Planned_to_sell_now_in_quiver unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.6

0.64::true_val(reviewer_opinion_the_good_ride, kept_in_quiver); 0.36::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s70, reviewer_opinion_the_good_ride, kept_in_quiver).

all_consistent(reviewer_opinion_the_good_ride) :-
    consistent(s70, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, kept_in_quiver)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

0.82::acc(s71, negative_aspect).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values poor_hard_snow=Not_at_home_steep_hard_conditions_nose_catchy unk_negative_aspect=Unknown
% @importance 0.9

0.67::true_val(negative_aspect, poor_hard_snow); 0.33::true_val(negative_aspect, unk_negative_aspect).

measured(s71, negative_aspect, poor_hard_snow).

all_consistent(negative_aspect) :-
    consistent(s71, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, poor_hard_snow)).
query(true_val(negative_aspect, unk_negative_aspect)).

0.65::acc(s72, negative_aspect_groomers).
0.82::acc(s73, negative_aspect_groomers).

% @attr negative_aspect_groomers
% @type categorical
% @canonical false
% @original_name negative_aspect (groomers)
% @values poor_groomers=Not_more_than_4_of_10_on_groomers_far_from_ideal unk_negative_aspect_groomers=Unknown
% @importance 0.83

0.95::true_val(negative_aspect_groomers, poor_groomers); 0.05::true_val(negative_aspect_groomers, unk_negative_aspect_groomers).

measured(s72, negative_aspect_groomers, poor_groomers).
measured(s73, negative_aspect_groomers, poor_groomers).

all_consistent(negative_aspect_groomers) :-
    consistent(s72, negative_aspect_groomers),
    consistent(s73, negative_aspect_groomers).

evidence(all_consistent(negative_aspect_groomers)).
query(true_val(negative_aspect_groomers, poor_groomers)).
query(true_val(negative_aspect_groomers, unk_negative_aspect_groomers)).

0.55::acc(s74, negative_aspect_ice_crust).

% @attr negative_aspect_ice_crust
% @type categorical
% @canonical false
% @original_name negative_aspect (ice/crust)
% @values useless_windblown_icy=3D_completely_useless_windblown_icy_crust unk_negative_aspect_ice_crust=Unknown
% @importance 0.85

0.30::true_val(negative_aspect_ice_crust, useless_windblown_icy); 0.70::true_val(negative_aspect_ice_crust, unk_negative_aspect_ice_crust).

measured(s74, negative_aspect_ice_crust, useless_windblown_icy).

all_consistent(negative_aspect_ice_crust) :-
    consistent(s74, negative_aspect_ice_crust).

evidence(all_consistent(negative_aspect_ice_crust)).
query(true_val(negative_aspect_ice_crust, useless_windblown_icy)).
query(true_val(negative_aspect_ice_crust, unk_negative_aspect_ice_crust)).

0.80::acc(s75, negative_aspect_base_chalky).

% @attr negative_aspect_base_chalky
% @type categorical
% @canonical false
% @original_name negative_aspect (base maintenance)
% @values base_chalky=Base_gets_chalky_needs_maintenance unk_negative_aspect_base_chalky=Unknown
% @importance 0.7

0.64::true_val(negative_aspect_base_chalky, base_chalky); 0.36::true_val(negative_aspect_base_chalky, unk_negative_aspect_base_chalky).

measured(s75, negative_aspect_base_chalky, base_chalky).

all_consistent(negative_aspect_base_chalky) :-
    consistent(s75, negative_aspect_base_chalky).

evidence(all_consistent(negative_aspect_base_chalky)).
query(true_val(negative_aspect_base_chalky, base_chalky)).
query(true_val(negative_aspect_base_chalky, unk_negative_aspect_base_chalky)).

0.55::acc(s74, user_review_forum_pop).

% @attr user_review_forum_pop
% @type categorical
% @canonical false
% @original_name user_review_forum (pop)
% @values has_no_pop=Has_no_pop unk_user_review_forum_pop=Unknown
% @importance 0.85

0.30::true_val(user_review_forum_pop, has_no_pop); 0.70::true_val(user_review_forum_pop, unk_user_review_forum_pop).

measured(s74, user_review_forum_pop, has_no_pop).

all_consistent(user_review_forum_pop) :-
    consistent(s74, user_review_forum_pop).

evidence(all_consistent(user_review_forum_pop)).
query(true_val(user_review_forum_pop, has_no_pop)).
query(true_val(user_review_forum_pop, unk_user_review_forum_pop)).

0.82::acc(s76, negative_aspect_not_bombing).

% @attr negative_aspect_not_bombing
% @type categorical
% @canonical false
% @original_name negative_aspect (not for bombing)
% @values not_bombing_not_chop=Not_about_bombing_not_for_chop_or_bumps unk_negative_aspect_not_bombing=Unknown
% @importance 0.85

0.68::true_val(negative_aspect_not_bombing, not_bombing_not_chop); 0.32::true_val(negative_aspect_not_bombing, unk_negative_aspect_not_bombing).

measured(s76, negative_aspect_not_bombing, not_bombing_not_chop).

all_consistent(negative_aspect_not_bombing) :-
    consistent(s76, negative_aspect_not_bombing).

evidence(all_consistent(negative_aspect_not_bombing)).
query(true_val(negative_aspect_not_bombing, not_bombing_not_chop)).
query(true_val(negative_aspect_not_bombing, unk_negative_aspect_not_bombing)).

0.80::acc(s77, negative_aspect_skins).

% @attr negative_aspect_skins
% @type categorical
% @canonical false
% @original_name negative_aspect (skins requirement)
% @values needs_burton_skins=Works_best_with_Burton_proprietary_skins unk_negative_aspect_skins=Unknown
% @importance 0.8

0.63::true_val(negative_aspect_skins, needs_burton_skins); 0.37::true_val(negative_aspect_skins, unk_negative_aspect_skins).

measured(s77, negative_aspect_skins, needs_burton_skins).

all_consistent(negative_aspect_skins) :-
    consistent(s77, negative_aspect_skins).

evidence(all_consistent(negative_aspect_skins)).
query(true_val(negative_aspect_skins, needs_burton_skins)).
query(true_val(negative_aspect_skins, unk_negative_aspect_skins)).

0.85::acc(s78, negative_aspect_bc_requirements).

% @attr negative_aspect_bc_requirements
% @type categorical
% @canonical false
% @original_name negative_aspect (backcountry requirements)
% @values requires_bc_gear_knowledge=Requires_skins_bindings_safety_knowledge unk_negative_aspect_bc_requirements=Unknown
% @importance 0.8

0.72::true_val(negative_aspect_bc_requirements, requires_bc_gear_knowledge); 0.28::true_val(negative_aspect_bc_requirements, unk_negative_aspect_bc_requirements).

measured(s78, negative_aspect_bc_requirements, requires_bc_gear_knowledge).

all_consistent(negative_aspect_bc_requirements) :-
    consistent(s78, negative_aspect_bc_requirements).

evidence(all_consistent(negative_aspect_bc_requirements)).
query(true_val(negative_aspect_bc_requirements, requires_bc_gear_knowledge)).
query(true_val(negative_aspect_bc_requirements, unk_negative_aspect_bc_requirements)).

0.55::acc(s79, user_review_forum_open_pow).

% @attr user_review_forum_open_pow
% @type categorical
% @canonical false
% @original_name user_review_forum (open powder)
% @values letdown_open_pow=Letdown_in_open_powder_vs_wider_boards unk_user_review_forum_open_pow=Unknown
% @importance 0.7

0.32::true_val(user_review_forum_open_pow, letdown_open_pow); 0.68::true_val(user_review_forum_open_pow, unk_user_review_forum_open_pow).

measured(s79, user_review_forum_open_pow, letdown_open_pow).

all_consistent(user_review_forum_open_pow) :-
    consistent(s79, user_review_forum_open_pow).

evidence(all_consistent(user_review_forum_open_pow)).
query(true_val(user_review_forum_open_pow, letdown_open_pow)).
query(true_val(user_review_forum_open_pow, unk_user_review_forum_open_pow)).

0.82::acc(s80, recommended_boot_size_152).

% @attr recommended_boot_size_152
% @type categorical
% @canonical false
% @original_name Recommended boot size 152cm
% @values us8_9=US_8_to_9 unk_recommended_boot_size_152=Unknown
% @importance 0.8

0.68::true_val(recommended_boot_size_152, us8_9); 0.32::true_val(recommended_boot_size_152, unk_recommended_boot_size_152).

measured(s80, recommended_boot_size_152, us8_9).

all_consistent(recommended_boot_size_152) :-
    consistent(s80, recommended_boot_size_152).

evidence(all_consistent(recommended_boot_size_152)).
query(true_val(recommended_boot_size_152, us8_9)).
query(true_val(recommended_boot_size_152, unk_recommended_boot_size_152)).

0.82::acc(s80, recommended_boot_size_156).

% @attr recommended_boot_size_156
% @type categorical
% @canonical false
% @original_name Recommended boot size 156cm
% @values us9_10=US_9_to_10 unk_recommended_boot_size_156=Unknown
% @importance 0.8

0.68::true_val(recommended_boot_size_156, us9_10); 0.32::true_val(recommended_boot_size_156, unk_recommended_boot_size_156).

measured(s80, recommended_boot_size_156, us9_10).

all_consistent(recommended_boot_size_156) :-
    consistent(s80, recommended_boot_size_156).

evidence(all_consistent(recommended_boot_size_156)).
query(true_val(recommended_boot_size_156, us9_10)).
query(true_val(recommended_boot_size_156, unk_recommended_boot_size_156)).

0.82::acc(s80, recommended_boot_size_160_161).

% @attr recommended_boot_size_160_161
% @type categorical
% @canonical false
% @original_name Recommended boot size 160/161cm
% @values us9_5_10_5=US_9_5_to_10_5 unk_recommended_boot_size_160_161=Unknown
% @importance 0.8

0.68::true_val(recommended_boot_size_160_161, us9_5_10_5); 0.32::true_val(recommended_boot_size_160_161, unk_recommended_boot_size_160_161).

measured(s80, recommended_boot_size_160_161, us9_5_10_5).

all_consistent(recommended_boot_size_160_161) :-
    consistent(s80, recommended_boot_size_160_161).

evidence(all_consistent(recommended_boot_size_160_161)).
query(true_val(recommended_boot_size_160_161, us9_5_10_5)).
query(true_val(recommended_boot_size_160_161, unk_recommended_boot_size_160_161)).

0.80::acc(s81, max_boot_size_recommendation).

% @attr max_boot_size_recommendation
% @type categorical
% @canonical false
% @original_name Maximum boot size recommendation
% @values under_us11=Best_under_US_size_11 unk_max_boot_size_recommendation=Unknown
% @importance 0.75

0.64::true_val(max_boot_size_recommendation, under_us11); 0.36::true_val(max_boot_size_recommendation, unk_max_boot_size_recommendation).

measured(s81, max_boot_size_recommendation, under_us11).

all_consistent(max_boot_size_recommendation) :-
    consistent(s81, max_boot_size_recommendation).

evidence(all_consistent(max_boot_size_recommendation)).
query(true_val(max_boot_size_recommendation, under_us11)).
query(true_val(max_boot_size_recommendation, unk_max_boot_size_recommendation)).

0.80::acc(s82, comparable_board_cross_brand).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values jones_storm_chaser=Jones_Storm_Chaser_Split unk_comparable_board_cross_brand=Unknown
% @importance 0.7

0.64::true_val(comparable_board_cross_brand, jones_storm_chaser); 0.36::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s82, comparable_board_cross_brand, jones_storm_chaser).

all_consistent(comparable_board_cross_brand) :-
    consistent(s82, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, jones_storm_chaser)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

0.80::acc(s83, comparable_board_cross_brand_weston).

% @attr comparable_board_cross_brand_weston
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Weston Japow)
% @values weston_japow=Weston_Japow_3D_Fish_more_versatile unk_comparable_board_cross_brand_weston=Unknown
% @importance 0.85

0.63::true_val(comparable_board_cross_brand_weston, weston_japow); 0.37::true_val(comparable_board_cross_brand_weston, unk_comparable_board_cross_brand_weston).

measured(s83, comparable_board_cross_brand_weston, weston_japow).

all_consistent(comparable_board_cross_brand_weston) :-
    consistent(s83, comparable_board_cross_brand_weston).

evidence(all_consistent(comparable_board_cross_brand_weston)).
query(true_val(comparable_board_cross_brand_weston, weston_japow)).
query(true_val(comparable_board_cross_brand_weston, unk_comparable_board_cross_brand_weston)).

0.78::acc(s84, comparable_board_cross_brand_libtech).

% @attr comparable_board_cross_brand_libtech
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Lib Tech)
% @values libtech_escalator=Lib_Tech_Escalator_Split_more_versatile unk_comparable_board_cross_brand_libtech=Unknown
% @importance 0.7

0.60::true_val(comparable_board_cross_brand_libtech, libtech_escalator); 0.40::true_val(comparable_board_cross_brand_libtech, unk_comparable_board_cross_brand_libtech).

measured(s84, comparable_board_cross_brand_libtech, libtech_escalator).

all_consistent(comparable_board_cross_brand_libtech) :-
    consistent(s84, comparable_board_cross_brand_libtech).

evidence(all_consistent(comparable_board_cross_brand_libtech)).
query(true_val(comparable_board_cross_brand_libtech, libtech_escalator)).
query(true_val(comparable_board_cross_brand_libtech, unk_comparable_board_cross_brand_libtech)).

0.88::acc(s85, comparable_board_same_brand).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values fish_3d_solid=Burton_Fish_3D_Directional_Flat_Top_non_split unk_comparable_board_same_brand=Unknown
% @importance 0.5

0.76::true_val(comparable_board_same_brand, fish_3d_solid); 0.24::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s85, comparable_board_same_brand, fish_3d_solid).

all_consistent(comparable_board_same_brand) :-
    consistent(s85, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, fish_3d_solid)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

0.55::acc(s86, comparable_board_same_brand_hh).

% @attr comparable_board_same_brand_hh
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Hometown Hero)
% @values burton_hh=Burton_Hometown_Hero_most_prefer_Fish_for_powder unk_comparable_board_same_brand_hh=Unknown
% @importance 0.65

0.32::true_val(comparable_board_same_brand_hh, burton_hh); 0.68::true_val(comparable_board_same_brand_hh, unk_comparable_board_same_brand_hh).

measured(s86, comparable_board_same_brand_hh, burton_hh).

all_consistent(comparable_board_same_brand_hh) :-
    consistent(s86, comparable_board_same_brand_hh).

evidence(all_consistent(comparable_board_same_brand_hh)).
query(true_val(comparable_board_same_brand_hh, burton_hh)).
query(true_val(comparable_board_same_brand_hh, unk_comparable_board_same_brand_hh)).

0.60::acc(s87, comparable_board_same_brand_pw).

% @attr comparable_board_same_brand_pw
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Pow Wrench)
% @values burton_pow_wrench=Burton_Pow_Wrench_Fish_derived_swallowtail unk_comparable_board_same_brand_pw=Unknown
% @importance 0.5

0.38::true_val(comparable_board_same_brand_pw, burton_pow_wrench); 0.62::true_val(comparable_board_same_brand_pw, unk_comparable_board_same_brand_pw).

measured(s87, comparable_board_same_brand_pw, burton_pow_wrench).

all_consistent(comparable_board_same_brand_pw) :-
    consistent(s87, comparable_board_same_brand_pw).

evidence(all_consistent(comparable_board_same_brand_pw)).
query(true_val(comparable_board_same_brand_pw, burton_pow_wrench)).
query(true_val(comparable_board_same_brand_pw, unk_comparable_board_same_brand_pw)).

0.80::acc(s88, predecessor_model_name_non3d).

% @attr predecessor_model_name_non3d
% @type categorical
% @canonical false
% @original_name predecessor_model_name (non-3D Fish split)
% @values burton_fish_non3d=Burton_Fish_non_3D_now_out_of_production_split unk_predecessor_model_name_non3d=Unknown
% @importance 0.5

0.63::true_val(predecessor_model_name_non3d, burton_fish_non3d); 0.37::true_val(predecessor_model_name_non3d, unk_predecessor_model_name_non3d).

measured(s88, predecessor_model_name_non3d, burton_fish_non3d).

all_consistent(predecessor_model_name_non3d) :-
    consistent(s88, predecessor_model_name_non3d).

evidence(all_consistent(predecessor_model_name_non3d)).
query(true_val(predecessor_model_name_non3d, burton_fish_non3d)).
query(true_val(predecessor_model_name_non3d, unk_predecessor_model_name_non3d)).

0.55::acc(s89, user_review_forum_3d_vs_non3d).

% @attr user_review_forum_3d_vs_non3d
% @type categorical
% @canonical false
% @original_name user_review_forum (3D vs non-3D)
% @values more_stable_less_pop=3D_Fish_more_stable_less_pop_than_non_3D unk_user_review_forum_3d_vs_non3d=Unknown
% @importance 0.6

0.34::true_val(user_review_forum_3d_vs_non3d, more_stable_less_pop); 0.66::true_val(user_review_forum_3d_vs_non3d, unk_user_review_forum_3d_vs_non3d).

measured(s89, user_review_forum_3d_vs_non3d, more_stable_less_pop).

all_consistent(user_review_forum_3d_vs_non3d) :-
    consistent(s89, user_review_forum_3d_vs_non3d).

evidence(all_consistent(user_review_forum_3d_vs_non3d)).
query(true_val(user_review_forum_3d_vs_non3d, more_stable_less_pop)).
query(true_val(user_review_forum_3d_vs_non3d, unk_user_review_forum_3d_vs_non3d)).

0.82::acc(s90, reviewer_stats_inertia).

% @attr reviewer_stats_inertia
% @type categorical
% @canonical false
% @original_name Reviewer stats (The Inertia)
% @values six_ft_200lbs_156cm=6ft_200lbs_rode_156cm_felt_good unk_reviewer_stats_inertia=Unknown
% @importance 0.75

0.67::true_val(reviewer_stats_inertia, six_ft_200lbs_156cm); 0.33::true_val(reviewer_stats_inertia, unk_reviewer_stats_inertia).

measured(s90, reviewer_stats_inertia, six_ft_200lbs_156cm).

all_consistent(reviewer_stats_inertia) :-
    consistent(s90, reviewer_stats_inertia).

evidence(all_consistent(reviewer_stats_inertia)).
query(true_val(reviewer_stats_inertia, six_ft_200lbs_156cm)).
query(true_val(reviewer_stats_inertia, unk_reviewer_stats_inertia)).

0.82::acc(s91, reviewer_stats_thegoodride).

% @attr reviewer_stats_thegoodride
% @type categorical
% @canonical false
% @original_name Reviewer stats (TheGoodRide)
% @values size9_5ft10_185_190lbs_156cm=Size9_5ft10_185_190lbs_rode_156cm unk_reviewer_stats_thegoodride=Unknown
% @importance 0.7

0.68::true_val(reviewer_stats_thegoodride, size9_5ft10_185_190lbs_156cm); 0.32::true_val(reviewer_stats_thegoodride, unk_reviewer_stats_thegoodride).

measured(s91, reviewer_stats_thegoodride, size9_5ft10_185_190lbs_156cm).

all_consistent(reviewer_stats_thegoodride) :-
    consistent(s91, reviewer_stats_thegoodride).

evidence(all_consistent(reviewer_stats_thegoodride)).
query(true_val(reviewer_stats_thegoodride, size9_5ft10_185_190lbs_156cm)).
query(true_val(reviewer_stats_thegoodride, unk_reviewer_stats_thegoodride)).

0.80::acc(s92, volume_shift_sizing).

% @attr volume_shift_sizing
% @type categorical
% @canonical false
% @original_name Volume shift sizing
% @values width_compensates_length=Extra_width_makes_up_for_lack_of_length unk_volume_shift_sizing=Unknown
% @importance 0.7

0.63::true_val(volume_shift_sizing, width_compensates_length); 0.37::true_val(volume_shift_sizing, unk_volume_shift_sizing).

measured(s92, volume_shift_sizing, width_compensates_length).

all_consistent(volume_shift_sizing) :-
    consistent(s92, volume_shift_sizing).

evidence(all_consistent(volume_shift_sizing)).
query(true_val(volume_shift_sizing, width_compensates_length)).
query(true_val(volume_shift_sizing, unk_volume_shift_sizing)).

0.75::acc(s94, setback_actual_board).

% @attr setback_actual_board
% @type numeric
% @unit mm
% @canonical false
% @original_name setback (actual board setback at 161cm)
% @values v130=130.0 unk_setback_actual_board=Unknown
% @importance 0.65

0.50::true_val(setback_actual_board, v130); 0.50::true_val(setback_actual_board, unk_setback_actual_board).

measured(s94, setback_actual_board, v130).

all_consistent(setback_actual_board) :-
    consistent(s94, setback_actual_board).

evidence(all_consistent(setback_actual_board)).
query(true_val(setback_actual_board, v130)).
query(true_val(setback_actual_board, unk_setback_actual_board)).

0.78::acc(s96, binding_recommendation).

% @attr binding_recommendation
% @type categorical
% @canonical false
% @original_name Binding recommendation (The Inertia)
% @values burton_step_on_split=Burton_Step_On_Splitboard_Binding unk_binding_recommendation=Unknown
% @importance 0.6

0.56::true_val(binding_recommendation, burton_step_on_split); 0.44::true_val(binding_recommendation, unk_binding_recommendation).

measured(s96, binding_recommendation, burton_step_on_split).

all_consistent(binding_recommendation) :-
    consistent(s96, binding_recommendation).

evidence(all_consistent(binding_recommendation)).
query(true_val(binding_recommendation, burton_step_on_split)).
query(true_val(binding_recommendation, unk_binding_recommendation)).