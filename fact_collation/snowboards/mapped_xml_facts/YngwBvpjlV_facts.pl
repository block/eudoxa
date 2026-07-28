0.20::indep(s1).
0.20::indep(s5).
0.25::indep(s7).
0.15::indep(s22).
0.15::indep(s29).
0.15::indep(s30).
0.20::indep(s31).
0.25::indep(s36).
0.15::indep(s39).
0.15::indep(s48).
0.15::indep(s72).
0.15::indep(s76).
0.15::indep(s97).
0.15::indep(s100).
0.20::indep(s101).
0.15::indep(s109).
0.25::indep(smerchant).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values bataleon=Bataleon unk_brand=Unknown
% @importance 0.975

0.93::acc(s1, brand).
0.95::acc(s2, brand).

0.97::true_val(brand, bataleon); 0.03::true_val(brand, unk_brand).

measured(s1, brand, bataleon).
measured(s2, brand, bataleon).

all_consistent(brand) :-
    consistent(s2, brand),
    (indep(s1), consistent(s1, brand) ; \+indep(s1)).

evidence(all_consistent(brand)).
query(true_val(brand, bataleon)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values whatever=Whatever unk_model_name=Unknown
% @importance 0.975

0.93::acc(s1, model_name).
0.95::acc(s2, model_name).

0.97::true_val(model_name, whatever); 0.03::true_val(model_name, unk_model_name).

measured(s1, model_name, whatever).
measured(s2, model_name, whatever).

all_consistent(model_name) :-
    consistent(s2, model_name),
    (indep(s1), consistent(s1, model_name) ; \+indep(s1)).

evidence(all_consistent(model_name)).
query(true_val(model_name, whatever)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2027=2027 unk_model_year=Unknown
% @importance 0.90

0.90::acc(s1, model_year).
0.82::acc(s5, model_year).

0.95::true_val(model_year, y2027); 0.05::true_val(model_year, unk_model_year).

measured(s1, model_year, y2027).
measured(s5, model_year, y2027).

all_consistent(model_year) :-
    consistent(s1, model_year),
    consistent(s5, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2027)).
query(true_val(model_year, unk_model_year)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.975

0.93::acc(s1, product_type).
0.95::acc(s2, product_type).

0.97::true_val(product_type, snowboard); 0.03::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).
measured(s2, product_type, snowboard).

all_consistent(product_type) :-
    consistent(s2, product_type),
    (indep(s1), consistent(s1, product_type) ; \+indep(s1)).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain_freestyle=All-Mountain_Freestyle unk_board_category=Unknown
% @importance 0.90

0.90::acc(s1, board_category).
0.82::acc(s5, board_category).

0.95::true_val(board_category, all_mountain_freestyle); 0.05::true_val(board_category, unk_board_category).

measured(s1, board_category, all_mountain_freestyle).
measured(s5, board_category, all_mountain_freestyle).

all_consistent(board_category) :-
    consistent(s1, board_category),
    consistent(s5, board_category).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain_freestyle)).
query(true_val(board_category, unk_board_category)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values unisex=Unisex unk_gender=Unknown
% @importance 0.925

0.93::acc(s2, gender).
0.82::acc(s5, gender).

0.95::true_val(gender, unisex); 0.05::true_val(gender, unk_gender).

measured(s2, gender, unisex).
measured(s5, gender, unisex).

all_consistent(gender) :-
    consistent(s2, gender),
    (indep(s5), consistent(s5, gender) ; \+indep(s5)).

evidence(all_consistent(gender)).
query(true_val(gender, unisex)).
query(true_val(gender, unk_gender)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values bataleon_lps=Bataleon_Snowboards_Low_Pressure_Studio unk_manufacturer=Unknown
% @importance 0.50

0.88::acc(s41, manufacturer).

0.83::true_val(manufacturer, bataleon_lps); 0.17::true_val(manufacturer, unk_manufacturer).

measured(s41, manufacturer, bataleon_lps).

all_consistent(manufacturer) :-
    consistent(s41, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, bataleon_lps)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr manufacturer_headquarters
% @type categorical
% @canonical false
% @original_name Manufacturer headquarters
% @values amsterdam_netherlands=Amsterdam_Netherlands unk_manufacturer_headquarters=Unknown
% @importance 0.45

0.88::acc(s41, manufacturer_headquarters).
0.70::acc(s43, manufacturer_headquarters).

0.95::true_val(manufacturer_headquarters, amsterdam_netherlands); 0.05::true_val(manufacturer_headquarters, unk_manufacturer_headquarters).

measured(s41, manufacturer_headquarters, amsterdam_netherlands).
measured(s43, manufacturer_headquarters, amsterdam_netherlands).

all_consistent(manufacturer_headquarters) :-
    consistent(s41, manufacturer_headquarters),
    consistent(s43, manufacturer_headquarters).

evidence(all_consistent(manufacturer_headquarters)).
query(true_val(manufacturer_headquarters, amsterdam_netherlands)).
query(true_val(manufacturer_headquarters, unk_manufacturer_headquarters)).

% @attr manufacturer_founded
% @type categorical
% @canonical false
% @original_name Manufacturer founded
% @values y2000_jorgen_karlsen=2000_Jorgen_Karlsen unk_manufacturer_founded=Unknown
% @importance 0.45

0.85::acc(s44, manufacturer_founded).
0.70::acc(s48, manufacturer_founded).

0.90::true_val(manufacturer_founded, y2000_jorgen_karlsen); 0.10::true_val(manufacturer_founded, unk_manufacturer_founded).

measured(s44, manufacturer_founded, y2000_jorgen_karlsen).
measured(s48, manufacturer_founded, y2000_jorgen_karlsen).

all_consistent(manufacturer_founded) :-
    consistent(s44, manufacturer_founded),
    (indep(s48), consistent(s48, manufacturer_founded) ; \+indep(s48)).

evidence(all_consistent(manufacturer_founded)).
query(true_val(manufacturer_founded, y2000_jorgen_karlsen)).
query(true_val(manufacturer_founded, unk_manufacturer_founded)).

% @attr parent_company
% @type categorical
% @canonical false
% @original_name Parent company
% @values nidecker_group=Nidecker_Group_acquired_2018 unk_parent_company=Unknown
% @importance 0.45

0.88::acc(s45, parent_company).
0.78::acc(s50, parent_company).

0.95::true_val(parent_company, nidecker_group); 0.05::true_val(parent_company, unk_parent_company).

measured(s45, parent_company, nidecker_group).
measured(s50, parent_company, nidecker_group).

all_consistent(parent_company) :-
    consistent(s45, parent_company),
    consistent(s50, parent_company).

evidence(all_consistent(parent_company)).
query(true_val(parent_company, nidecker_group)).
query(true_val(parent_company, unk_parent_company)).

% @attr nidecker_group_status
% @type categorical
% @canonical false
% @original_name Nidecker Group status
% @values family_owned_swiss=Family_owned_Swiss_second_biggest unk_nidecker_group_status=Unknown
% @importance 0.50

0.85::acc(s45, nidecker_group_status).

0.76::true_val(nidecker_group_status, family_owned_swiss); 0.24::true_val(nidecker_group_status, unk_nidecker_group_status).

measured(s45, nidecker_group_status, family_owned_swiss).

all_consistent(nidecker_group_status) :-
    consistent(s45, nidecker_group_status).

evidence(all_consistent(nidecker_group_status)).
query(true_val(nidecker_group_status, family_owned_swiss)).
query(true_val(nidecker_group_status, unk_nidecker_group_status)).

% @attr manufacturing_location_prior
% @type categorical
% @canonical true
% @original_name manufacturing_location_prior
% @values elan_austria_then_asia=Elan_Austria_then_outsourced_Asia unk_manufacturing_location_prior=Unknown
% @importance 0.45

0.82::acc(s44, manufacturing_location_prior).

0.72::true_val(manufacturing_location_prior, elan_austria_then_asia); 0.28::true_val(manufacturing_location_prior, unk_manufacturing_location_prior).

measured(s44, manufacturing_location_prior, elan_austria_then_asia).

all_consistent(manufacturing_location_prior) :-
    consistent(s44, manufacturing_location_prior).

evidence(all_consistent(manufacturing_location_prior)).
query(true_val(manufacturing_location_prior, elan_austria_then_asia)).
query(true_val(manufacturing_location_prior, unk_manufacturing_location_prior)).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values austria=Austria unk_manufacturing_location_current=Unknown
% @importance 0.55

0.55::acc(s48, manufacturing_location_current).

0.38::true_val(manufacturing_location_current, austria); 0.62::true_val(manufacturing_location_current, unk_manufacturing_location_current).

measured(s48, manufacturing_location_current, austria).

all_consistent(manufacturing_location_current) :-
    consistent(s48, manufacturing_location_current).

evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, austria)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values approx_2010_2011=Approximately_2010-2011_season unk_model_first_available_year=Unknown
% @importance 0.55

0.90::acc(s93, model_first_available_year).
0.70::acc(s61, model_first_available_year).

0.92::true_val(model_first_available_year, approx_2010_2011); 0.08::true_val(model_first_available_year, unk_model_first_available_year).

measured(s93, model_first_available_year, approx_2010_2011).
measured(s61, model_first_available_year, approx_2010_2011).

all_consistent(model_first_available_year) :-
    consistent(s93, model_first_available_year),
    consistent(s61, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, approx_2010_2011)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr estimated_availability_date
% @type categorical
% @canonical true
% @original_name estimated_availability_date
% @values may_2026_preorder=Pre-order_estimated_May_1_2026 unk_estimated_availability_date=Unknown
% @importance 0.85

0.93::acc(smerchant, estimated_availability_date).

0.95::true_val(estimated_availability_date, may_2026_preorder); 0.05::true_val(estimated_availability_date, unk_estimated_availability_date).

measured(smerchant, estimated_availability_date, may_2026_preorder).

all_consistent(estimated_availability_date) :-
    consistent(smerchant, estimated_availability_date).

evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, may_2026_preorder)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values pre_order=Pre-order unk_availability_status=Unknown
% @importance 0.85

0.95::acc(smerchant, availability_status).

0.95::true_val(availability_status, pre_order); 0.05::true_val(availability_status, unk_availability_status).

measured(smerchant, availability_status, pre_order).

all_consistent(availability_status) :-
    consistent(smerchant, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, pre_order)).
query(true_val(availability_status, unk_availability_status)).

% @attr price_aud_merchant
% @type numeric
% @canonical true
% @original_name price_aud_merchant
% @unit AUD
% @values v949_99=949.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.97::acc(smerchant, price_aud_merchant).

0.95::true_val(price_aud_merchant, v949_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(smerchant, price_aud_merchant, v949_99).

all_consistent(price_aud_merchant) :-
    consistent(smerchant, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v949_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_usd_s2as
% @type numeric
% @canonical false
% @original_name USD price at Surface 2 Air Sports (S2AS, UK retailer)
% @unit USD
% @values v544=544.0 unk_price_usd_s2as=Unknown
% @importance 0.92

0.90::acc(s31, price_usd_s2as).

0.65::true_val(price_usd_s2as, v544); 0.35::true_val(price_usd_s2as, unk_price_usd_s2as).

measured(s31, price_usd_s2as, v544).

all_consistent(price_usd_s2as) :-
    consistent(s31, price_usd_s2as).

evidence(all_consistent(price_usd_s2as)).
query(true_val(price_usd_s2as, v544)).
query(true_val(price_usd_s2as, unk_price_usd_s2as)).

% @attr price_usd_nzshred
% @type numeric
% @canonical false
% @original_name USD price at NZ Shred (New Zealand)
% @unit USD
% @values v653=653.0 unk_price_usd_nzshred=Unknown
% @importance 0.85

0.88::acc(s36, price_usd_nzshred).

0.63::true_val(price_usd_nzshred, v653); 0.37::true_val(price_usd_nzshred, unk_price_usd_nzshred).

measured(s36, price_usd_nzshred, v653).

all_consistent(price_usd_nzshred) :-
    consistent(s36, price_usd_nzshred).

evidence(all_consistent(price_usd_nzshred)).
query(true_val(price_usd_nzshred, v653)).
query(true_val(price_usd_nzshred, unk_price_usd_nzshred)).

% @attr price_usd_evo
% @type numeric
% @canonical true
% @original_name price_usd_evo
% @unit USD
% @values v405_96=405.96 unk_price_usd_evo=Unknown
% @importance 0.92

0.90::acc(s76, price_usd_evo).

0.72::true_val(price_usd_evo, v405_96); 0.28::true_val(price_usd_evo, unk_price_usd_evo).

measured(s76, price_usd_evo, v405_96).

all_consistent(price_usd_evo) :-
    consistent(s76, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v405_96)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_evo_2025_sale
% @type numeric
% @canonical false
% @original_name price_usd_evo (2025 model sale)
% @unit USD
% @values v329_97=329.97 unk_price_usd_evo_2025_sale=Unknown
% @importance 0.92

0.88::acc(s72, price_usd_evo_2025_sale).

0.72::true_val(price_usd_evo_2025_sale, v329_97); 0.28::true_val(price_usd_evo_2025_sale, unk_price_usd_evo_2025_sale).

measured(s72, price_usd_evo_2025_sale, v329_97).

all_consistent(price_usd_evo_2025_sale) :-
    consistent(s72, price_usd_evo_2025_sale).

evidence(all_consistent(price_usd_evo_2025_sale)).
query(true_val(price_usd_evo_2025_sale, v329_97)).
query(true_val(price_usd_evo_2025_sale, unk_price_usd_evo_2025_sale)).

% @attr price_usd_evo_rrp
% @type numeric
% @canonical false
% @original_name price_usd_evo (MSRP)
% @unit USD
% @values v579_95=579.95 unk_price_usd_evo_rrp=Unknown
% @importance 0.92

0.90::acc(s76, price_usd_evo_rrp).
0.88::acc(s97, price_usd_evo_rrp).

0.95::true_val(price_usd_evo_rrp, v579_95); 0.05::true_val(price_usd_evo_rrp, unk_price_usd_evo_rrp).

measured(s76, price_usd_evo_rrp, v579_95).
measured(s97, price_usd_evo_rrp, v579_95).

all_consistent(price_usd_evo_rrp) :-
    consistent(s76, price_usd_evo_rrp),
    consistent(s97, price_usd_evo_rrp).

evidence(all_consistent(price_usd_evo_rrp)).
query(true_val(price_usd_evo_rrp, v579_95)).
query(true_val(price_usd_evo_rrp, unk_price_usd_evo_rrp)).

% @attr retailer_evo
% @type categorical
% @canonical false
% @original_name Retailer evo.com
% @values evo_major_us=evo.com_Seattle_major_US_retailer unk_retailer_evo=Unknown
% @importance 0.65

0.82::acc(s97, retailer_evo).

0.74::true_val(retailer_evo, evo_major_us); 0.26::true_val(retailer_evo, unk_retailer_evo).

measured(s97, retailer_evo, evo_major_us).

all_consistent(retailer_evo) :-
    consistent(s97, retailer_evo).

evidence(all_consistent(retailer_evo)).
query(true_val(retailer_evo, evo_major_us)).
query(true_val(retailer_evo, unk_retailer_evo)).

% @attr retailer_s2as
% @type categorical
% @canonical false
% @original_name Retailer S2AS
% @values s2as_uk_authorised=S2AS_UK_authorised_retailer unk_retailer_s2as=Unknown
% @importance 0.92

0.85::acc(s31, retailer_s2as).

0.65::true_val(retailer_s2as, s2as_uk_authorised); 0.35::true_val(retailer_s2as, unk_retailer_s2as).

measured(s31, retailer_s2as, s2as_uk_authorised).

all_consistent(retailer_s2as) :-
    consistent(s31, retailer_s2as).

evidence(all_consistent(retailer_s2as)).
query(true_val(retailer_s2as, s2as_uk_authorised)).
query(true_val(retailer_s2as, unk_retailer_s2as)).

% @attr retailer_snowboard_shop_uk
% @type categorical
% @canonical false
% @original_name Retailer The Snowboard Shop (UK)
% @values tss_uk_specialist=The_Snowboard_Shop_UK_specialist unk_retailer_snowboard_shop_uk=Unknown
% @importance 0.85

0.78::acc(s5, retailer_snowboard_shop_uk).

0.69::true_val(retailer_snowboard_shop_uk, tss_uk_specialist); 0.31::true_val(retailer_snowboard_shop_uk, unk_retailer_snowboard_shop_uk).

measured(s5, retailer_snowboard_shop_uk, tss_uk_specialist).

all_consistent(retailer_snowboard_shop_uk) :-
    consistent(s5, retailer_snowboard_shop_uk).

evidence(all_consistent(retailer_snowboard_shop_uk)).
query(true_val(retailer_snowboard_shop_uk, tss_uk_specialist)).
query(true_val(retailer_snowboard_shop_uk, unk_retailer_snowboard_shop_uk)).

% @attr retailer_nzshred
% @type categorical
% @canonical false
% @original_name Retailer NZ Shred
% @values nzshred_nz=NZ_Shred_New_Zealand unk_retailer_nzshred=Unknown
% @importance 0.85

0.75::acc(s36, retailer_nzshred).

0.63::true_val(retailer_nzshred, nzshred_nz); 0.37::true_val(retailer_nzshred, unk_retailer_nzshred).

measured(s36, retailer_nzshred, nzshred_nz).

all_consistent(retailer_nzshred) :-
    consistent(s36, retailer_nzshred).

evidence(all_consistent(retailer_nzshred)).
query(true_val(retailer_nzshred, nzshred_nz)).
query(true_val(retailer_nzshred, unk_retailer_nzshred)).

% @attr retailer_blauer
% @type categorical
% @canonical false
% @original_name Retailer Blauer Board Shop
% @values blauer_us=Blauer_Board_Shop_US unk_retailer_blauer=Unknown
% @importance 0.85

0.75::acc(s55, retailer_blauer).

0.64::true_val(retailer_blauer, blauer_us); 0.36::true_val(retailer_blauer, unk_retailer_blauer).

measured(s55, retailer_blauer, blauer_us).

all_consistent(retailer_blauer) :-
    consistent(s55, retailer_blauer).

evidence(all_consistent(retailer_blauer)).
query(true_val(retailer_blauer, blauer_us)).
query(true_val(retailer_blauer, unk_retailer_blauer)).

% @attr retailer_twelve
% @type categorical
% @canonical false
% @original_name Retailer Twelve Board Store
% @values twelve_melbourne=Twelve_Board_Store_Melbourne unk_retailer_twelve=Unknown
% @importance 0.70

0.75::acc(s39, retailer_twelve).

0.60::true_val(retailer_twelve, twelve_melbourne); 0.40::true_val(retailer_twelve, unk_retailer_twelve).

measured(s39, retailer_twelve, twelve_melbourne).

all_consistent(retailer_twelve) :-
    consistent(s39, retailer_twelve).

evidence(all_consistent(retailer_twelve)).
query(true_val(retailer_twelve, twelve_melbourne)).
query(true_val(retailer_twelve, unk_retailer_twelve)).

% @attr retailer_amazon
% @type categorical
% @canonical false
% @original_name Retailer Amazon
% @values amazon_prev_year=Amazon_previous_year_models unk_retailer_amazon=Unknown
% @importance 0.55

0.72::acc(s30, retailer_amazon).

0.63::true_val(retailer_amazon, amazon_prev_year); 0.37::true_val(retailer_amazon, unk_retailer_amazon).

measured(s30, retailer_amazon, amazon_prev_year).

all_consistent(retailer_amazon) :-
    consistent(s30, retailer_amazon).

evidence(all_consistent(retailer_amazon)).
query(true_val(retailer_amazon, amazon_prev_year)).
query(true_val(retailer_amazon, unk_retailer_amazon)).

% @attr retailer_bataleon_direct
% @type categorical
% @canonical false
% @original_name Retailer Bataleon direct
% @values bataleon_direct=Bataleon_direct_webshop unk_retailer_bataleon_direct=Unknown
% @importance 0.75

0.93::acc(s34, retailer_bataleon_direct).

0.90::true_val(retailer_bataleon_direct, bataleon_direct); 0.10::true_val(retailer_bataleon_direct, unk_retailer_bataleon_direct).

measured(s34, retailer_bataleon_direct, bataleon_direct).

all_consistent(retailer_bataleon_direct) :-
    consistent(s34, retailer_bataleon_direct).

evidence(all_consistent(retailer_bataleon_direct)).
query(true_val(retailer_bataleon_direct, bataleon_direct)).
query(true_val(retailer_bataleon_direct, unk_retailer_bataleon_direct)).

% @attr retailer_darkside
% @type categorical
% @canonical false
% @original_name Retailer Darkside Snowboards
% @values darkside_vermont=Darkside_Snowboards_Vermont unk_retailer_darkside=Unknown
% @importance 0.75

0.70::acc(s5, retailer_darkside).

0.69::true_val(retailer_darkside, darkside_vermont); 0.31::true_val(retailer_darkside, unk_retailer_darkside).

measured(s5, retailer_darkside, darkside_vermont).

all_consistent(retailer_darkside) :-
    consistent(s5, retailer_darkside).

evidence(all_consistent(retailer_darkside)).
query(true_val(retailer_darkside, darkside_vermont)).
query(true_val(retailer_darkside, unk_retailer_darkside)).

% @attr retailer_ski_pro_az
% @type categorical
% @canonical false
% @original_name Retailer Ski Pro AZ
% @values ski_pro_az=Ski_Pro_AZ unk_retailer_ski_pro_az=Unknown
% @importance 0.75

0.65::acc(s5, retailer_ski_pro_az).

0.69::true_val(retailer_ski_pro_az, ski_pro_az); 0.31::true_val(retailer_ski_pro_az, unk_retailer_ski_pro_az).

measured(s5, retailer_ski_pro_az, ski_pro_az).

all_consistent(retailer_ski_pro_az) :-
    consistent(s5, retailer_ski_pro_az).

evidence(all_consistent(retailer_ski_pro_az)).
query(true_val(retailer_ski_pro_az, ski_pro_az)).
query(true_val(retailer_ski_pro_az, unk_retailer_ski_pro_az)).

% @attr shipping_restriction
% @type categorical
% @canonical false
% @original_name Shipping restriction (merchant site)
% @values australia_only=Australia_only unk_shipping_restriction=Unknown
% @importance 0.85

0.95::acc(smerchant, shipping_restriction).

0.95::true_val(shipping_restriction, australia_only); 0.05::true_val(shipping_restriction, unk_shipping_restriction).

measured(smerchant, shipping_restriction, australia_only).

all_consistent(shipping_restriction) :-
    consistent(smerchant, shipping_restriction).

evidence(all_consistent(shipping_restriction)).
query(true_val(shipping_restriction, australia_only)).
query(true_val(shipping_restriction, unk_shipping_restriction)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values directional_twin=Directional_Twin unk_shape=Unknown
% @importance 0.925

0.93::acc(smerchant, shape).
0.95::acc(s2, shape).

0.97::true_val(shape, directional_twin); 0.03::true_val(shape, unk_shape).

measured(smerchant, shape, directional_twin).
measured(s2, shape, directional_twin).

all_consistent(shape) :-
    consistent(s2, shape),
    (indep(smerchant), consistent(smerchant, shape) ; \+indep(smerchant)).

evidence(all_consistent(shape)).
query(true_val(shape, directional_twin)).
query(true_val(shape, unk_shape)).

% @attr shape_description
% @type categorical
% @canonical false
% @original_name Shape description
% @values dir_outline_twin_sidecut=Directional_outline_twin_sidecut_nose_1cm_longer unk_shape_description=Unknown
% @importance 0.85

0.82::acc(s5, shape_description).
0.80::acc(s101, shape_description).

0.92::true_val(shape_description, dir_outline_twin_sidecut); 0.08::true_val(shape_description, unk_shape_description).

measured(s5, shape_description, dir_outline_twin_sidecut).
measured(s101, shape_description, dir_outline_twin_sidecut).

all_consistent(shape_description) :-
    consistent(s5, shape_description),
    consistent(s101, shape_description).

evidence(all_consistent(shape_description)).
query(true_val(shape_description, dir_outline_twin_sidecut)).
query(true_val(shape_description, unk_shape_description)).

% @attr setback
% @type numeric
% @canonical true
% @original_name setback
% @unit mm
% @values v0=0.0 unk_setback=Unknown
% @importance 0.85

0.90::acc(s5, setback).
0.93::acc(smerchant, setback).

0.95::true_val(setback, v0); 0.05::true_val(setback, unk_setback).

measured(s5, setback, v0).
measured(smerchant, setback, v0).

all_consistent(setback) :-
    consistent(smerchant, setback),
    consistent(s5, setback).

evidence(all_consistent(setback)).
query(true_val(setback, v0)).
query(true_val(setback, unk_setback)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values medium_camber_3bt_sidekick=Medium_Camber_3BT_SideKick unk_camber_type=Unknown
% @importance 0.925

0.93::acc(smerchant, camber_type).
0.95::acc(s2, camber_type).

0.97::true_val(camber_type, medium_camber_3bt_sidekick); 0.03::true_val(camber_type, unk_camber_type).

measured(smerchant, camber_type, medium_camber_3bt_sidekick).
measured(s2, camber_type, medium_camber_3bt_sidekick).

all_consistent(camber_type) :-
    consistent(s2, camber_type),
    (indep(smerchant), consistent(smerchant, camber_type) ; \+indep(smerchant)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, medium_camber_3bt_sidekick)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical false
% @original_name camber_description
% @values traditional_camber_3bt_3d=Traditional_positive_camber_with_3BT_3D_base unk_camber_description=Unknown
% @importance 0.925

0.93::acc(s2, camber_description).
0.82::acc(s22, camber_description).

0.95::true_val(camber_description, traditional_camber_3bt_3d); 0.05::true_val(camber_description, unk_camber_description).

measured(s2, camber_description, traditional_camber_3bt_3d).
measured(s22, camber_description, traditional_camber_3bt_3d).

all_consistent(camber_description) :-
    consistent(s2, camber_description),
    (indep(s22), consistent(s22, camber_description) ; \+indep(s22)).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, traditional_camber_3bt_3d)).
query(true_val(camber_description, unk_camber_description)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @original_name flex_rating_10
% @unit /10
% @values v5=5.0 v4=4.0
% @importance 0.86

0.93::acc(smerchant, flex_rating_10).
0.88::acc(s31, flex_rating_10).
0.82::acc(s36, flex_rating_10).
0.60::acc(s100, flex_rating_10).
0.72::acc(ssp, flex_rating_10).

0.70::true_val(flex_rating_10, v5); 0.30::true_val(flex_rating_10, v4).

measured(smerchant, flex_rating_10, v5).
measured(s31, flex_rating_10, v5).
measured(s36, flex_rating_10, v5).
measured(s100, flex_rating_10, v4).
measured(ssp, flex_rating_10, v4).

all_consistent(flex_rating_10) :-
    consistent(smerchant, flex_rating_10),
    (indep(s31), consistent(s31, flex_rating_10) ; \+indep(s31)),
    (indep(s36), consistent(s36, flex_rating_10) ; \+indep(s36)),
    (indep(s100), consistent(s100, flex_rating_10) ; \+indep(s100)),
    consistent(ssp, flex_rating_10).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v5)).
query(true_val(flex_rating_10, v4)).

% @attr flex_feel
% @type numeric
% @canonical false
% @original_name flex_feel
% @unit /10
% @values v4_5=4.5 unk_flex_feel=Unknown
% @importance 0.90

0.82::acc(ssp, flex_feel).

0.68::true_val(flex_feel, v4_5); 0.32::true_val(flex_feel, unk_flex_feel).

measured(ssp, flex_feel, v4_5).

all_consistent(flex_feel) :-
    consistent(ssp, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, v4_5)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr flex_rating_10_evo
% @type categorical
% @canonical false
% @original_name flex_rating_10_evo
% @values medium=Medium unk_flex_rating_10_evo=Unknown
% @importance 0.70

0.82::acc(s72, flex_rating_10_evo).

0.72::true_val(flex_rating_10_evo, medium); 0.28::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).

measured(s72, flex_rating_10_evo, medium).

all_consistent(flex_rating_10_evo) :-
    consistent(s72, flex_rating_10_evo).

evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, medium)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values light_core_poplar_paulownia=Light_Core_50_50_Poplar_Paulownia unk_core_material=Unknown
% @importance 0.825

0.93::acc(smerchant, core_material).
0.82::acc(s29, core_material).

0.95::true_val(core_material, light_core_poplar_paulownia); 0.05::true_val(core_material, unk_core_material).

measured(smerchant, core_material, light_core_poplar_paulownia).
measured(s29, core_material, light_core_poplar_paulownia).

all_consistent(core_material) :-
    consistent(smerchant, core_material),
    (indep(s29), consistent(s29, core_material) ; \+indep(s29)).

evidence(all_consistent(core_material)).
query(true_val(core_material, light_core_poplar_paulownia)).
query(true_val(core_material, unk_core_material)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values bi_ax_fiberglass=Bi-Ax_biaxial_fiberglass unk_laminate=Unknown
% @importance 0.85

0.93::acc(smerchant, laminate).
0.85::acc(s22, laminate).

0.95::true_val(laminate, bi_ax_fiberglass); 0.05::true_val(laminate, unk_laminate).

measured(smerchant, laminate, bi_ax_fiberglass).
measured(s22, laminate, bi_ax_fiberglass).

all_consistent(laminate) :-
    consistent(smerchant, laminate),
    (indep(s22), consistent(s22, laminate) ; \+indep(s22)).

evidence(all_consistent(laminate)).
query(true_val(laminate, bi_ax_fiberglass)).
query(true_val(laminate, unk_laminate)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation (Carbon Stringers)
% @values carbon_stringers=Carbon_Stringers unk_construction_material_innovation=Unknown
% @importance 0.85

0.93::acc(smerchant, construction_material_innovation).
0.85::acc(s22, construction_material_innovation).

0.95::true_val(construction_material_innovation, carbon_stringers); 0.05::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(smerchant, construction_material_innovation, carbon_stringers).
measured(s22, construction_material_innovation, carbon_stringers).

all_consistent(construction_material_innovation) :-
    consistent(smerchant, construction_material_innovation),
    (indep(s22), consistent(s22, construction_material_innovation) ; \+indep(s22)).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, carbon_stringers)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr construction_material_innovation_supertubes
% @type categorical
% @canonical false
% @original_name construction_material_innovation (SuperTubes)
% @values dst_two_tubes=DST_SuperTubes_two_tubes drst_six_tubes=DRST_SuperTubes_six_tubes
% @importance 0.82

0.92::acc(smerchant, construction_material_innovation_supertubes).
0.93::acc(s13, construction_material_innovation_supertubes).
0.68::acc(s7, construction_material_innovation_supertubes).

0.60::true_val(construction_material_innovation_supertubes, dst_two_tubes); 0.40::true_val(construction_material_innovation_supertubes, drst_six_tubes).

measured(smerchant, construction_material_innovation_supertubes, dst_two_tubes).
measured(s13, construction_material_innovation_supertubes, dst_two_tubes).
measured(s7, construction_material_innovation_supertubes, drst_six_tubes).

all_consistent(construction_material_innovation_supertubes) :-
    consistent(s13, construction_material_innovation_supertubes),
    (indep(smerchant), consistent(smerchant, construction_material_innovation_supertubes) ; \+indep(smerchant)),
    (indep(s7), consistent(s7, construction_material_innovation_supertubes) ; \+indep(s7)).

evidence(all_consistent(construction_material_innovation_supertubes)).
query(true_val(construction_material_innovation_supertubes, dst_two_tubes)).
query(true_val(construction_material_innovation_supertubes, drst_six_tubes)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values urethane_flex_walls=Urethane_Flex_Walls unk_sidewall_material=Unknown
% @importance 0.80

0.93::acc(smerchant, sidewall_material).
0.72::acc(s7, sidewall_material).

0.95::true_val(sidewall_material, urethane_flex_walls); 0.05::true_val(sidewall_material, unk_sidewall_material).

measured(smerchant, sidewall_material, urethane_flex_walls).
measured(s7, sidewall_material, urethane_flex_walls).

all_consistent(sidewall_material) :-
    consistent(smerchant, sidewall_material),
    (indep(s7), consistent(s7, sidewall_material) ; \+indep(s7)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, urethane_flex_walls)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr sidewall_technology_description
% @type categorical
% @canonical false
% @original_name Sidewall technology description
% @values urethane_replacing_abs=Urethane_replacing_ABS_better_adhesion_durability_dampening unk_sidewall_technology_description=Unknown
% @importance 0.825

0.88::acc(s7, sidewall_technology_description).
0.90::acc(s13, sidewall_technology_description).

0.95::true_val(sidewall_technology_description, urethane_replacing_abs); 0.05::true_val(sidewall_technology_description, unk_sidewall_technology_description).

measured(s7, sidewall_technology_description, urethane_replacing_abs).
measured(s13, sidewall_technology_description, urethane_replacing_abs).

all_consistent(sidewall_technology_description) :-
    consistent(s13, sidewall_technology_description),
    (indep(s7), consistent(s7, sidewall_technology_description) ; \+indep(s7)).

evidence(all_consistent(sidewall_technology_description)).
query(true_val(sidewall_technology_description, urethane_replacing_abs)).
query(true_val(sidewall_technology_description, unk_sidewall_technology_description)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values hyper_glide_s=Hyper_Glide_S_sintered unk_base_material=Unknown
% @importance 0.85

0.93::acc(smerchant, base_material).
0.85::acc(s22, base_material).

0.95::true_val(base_material, hyper_glide_s); 0.05::true_val(base_material, unk_base_material).

measured(smerchant, base_material, hyper_glide_s).
measured(s22, base_material, hyper_glide_s).

all_consistent(base_material) :-
    consistent(smerchant, base_material),
    (indep(s22), consistent(s22, base_material) ; \+indep(s22)).

evidence(all_consistent(base_material)).
query(true_val(base_material, hyper_glide_s)).
query(true_val(base_material, unk_base_material)).

% @attr base_feature
% @type categorical
% @canonical false
% @original_name Base feature
% @values flip_flop_base=Flip_Flop_Base_die_cut_waste_reduction unk_base_feature=Unknown
% @importance 0.875

0.93::acc(smerchant, base_feature).
0.92::acc(s13, base_feature).

0.97::true_val(base_feature, flip_flop_base); 0.03::true_val(base_feature, unk_base_feature).

measured(smerchant, base_feature, flip_flop_base).
measured(s13, base_feature, flip_flop_base).

all_consistent(base_feature) :-
    consistent(s13, base_feature),
    (indep(smerchant), consistent(smerchant, base_feature) ; \+indep(smerchant)).

evidence(all_consistent(base_feature)).
query(true_val(base_feature, flip_flop_base)).
query(true_val(base_feature, unk_base_feature)).

% @attr insert_material
% @type categorical
% @canonical false
% @original_name Insert material
% @values a_grade_german_stainless=A-grade_German_stainless_steel unk_insert_material=Unknown
% @importance 0.90

0.92::acc(s13, insert_material).

0.87::true_val(insert_material, a_grade_german_stainless); 0.13::true_val(insert_material, unk_insert_material).

measured(s13, insert_material, a_grade_german_stainless).

all_consistent(insert_material) :-
    consistent(s13, insert_material).

evidence(all_consistent(insert_material)).
query(true_val(insert_material, a_grade_german_stainless)).
query(true_val(insert_material, unk_insert_material)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 0.85

0.93::acc(smerchant, mounting_pattern).

0.95::true_val(mounting_pattern, inserts_2x4); 0.05::true_val(mounting_pattern, unk_mounting_pattern).

measured(smerchant, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :-
    consistent(smerchant, mounting_pattern).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr additional_inserts
% @type categorical
% @canonical false
% @original_name Additional inserts
% @values backseat_inserts_plus2=Plus_2_Backseat_Inserts_4cm_behind unk_additional_inserts=Unknown
% @importance 0.875

0.93::acc(smerchant, additional_inserts).
0.88::acc(s13, additional_inserts).

0.95::true_val(additional_inserts, backseat_inserts_plus2); 0.05::true_val(additional_inserts, unk_additional_inserts).

measured(smerchant, additional_inserts, backseat_inserts_plus2).
measured(s13, additional_inserts, backseat_inserts_plus2).

all_consistent(additional_inserts) :-
    consistent(s13, additional_inserts),
    (indep(smerchant), consistent(smerchant, additional_inserts) ; \+indep(smerchant)).

evidence(all_consistent(additional_inserts)).
query(true_val(additional_inserts, backseat_inserts_plus2)).
query(true_val(additional_inserts, unk_additional_inserts)).

% @attr binding_compatibility
% @type categorical
% @canonical false
% @original_name binding_compatibility
% @values standard_non_est=Standard_non_Burton_EST unk_binding_compatibility=Unknown
% @importance 0.85

0.80::acc(s5, binding_compatibility).

0.69::true_val(binding_compatibility, standard_non_est); 0.31::true_val(binding_compatibility, unk_binding_compatibility).

measured(s5, binding_compatibility, standard_non_est).

all_consistent(binding_compatibility) :-
    consistent(s5, binding_compatibility).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, standard_non_est)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

% @attr edge_technology
% @type categorical
% @canonical false
% @original_name edge_technology
% @values reduces_catch_maintains_ollie=Reduces_edge_catch_maintains_ollie_carving unk_edge_technology=Unknown
% @importance 0.925

0.93::acc(smerchant, edge_technology).
0.93::acc(s2, edge_technology).

0.97::true_val(edge_technology, reduces_catch_maintains_ollie); 0.03::true_val(edge_technology, unk_edge_technology).

measured(smerchant, edge_technology, reduces_catch_maintains_ollie).
measured(s2, edge_technology, reduces_catch_maintains_ollie).

all_consistent(edge_technology) :-
    consistent(s2, edge_technology),
    (indep(smerchant), consistent(smerchant, edge_technology) ; \+indep(smerchant)).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, reduces_catch_maintains_ollie)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr construction_material_innovation_sidekick
% @type categorical
% @canonical false
% @original_name construction_material_innovation (SideKick)
% @values sidekick_hull_float=SideKick_amplifies_uplift_hull_shape_float unk_construction_material_innovation_sidekick=Unknown
% @importance 0.925

0.93::acc(smerchant, construction_material_innovation_sidekick).
0.93::acc(s2, construction_material_innovation_sidekick).

0.97::true_val(construction_material_innovation_sidekick, sidekick_hull_float); 0.03::true_val(construction_material_innovation_sidekick, unk_construction_material_innovation_sidekick).

measured(smerchant, construction_material_innovation_sidekick, sidekick_hull_float).
measured(s2, construction_material_innovation_sidekick, sidekick_hull_float).

all_consistent(construction_material_innovation_sidekick) :-
    consistent(s2, construction_material_innovation_sidekick),
    (indep(smerchant), consistent(smerchant, construction_material_innovation_sidekick) ; \+indep(smerchant)).

evidence(all_consistent(construction_material_innovation_sidekick)).
query(true_val(construction_material_innovation_sidekick, sidekick_hull_float)).
query(true_val(construction_material_innovation_sidekick, unk_construction_material_innovation_sidekick)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 0.85

0.93::acc(smerchant, width_options).

0.95::true_val(width_options, standard_and_wide); 0.05::true_val(width_options, unk_width_options).

measured(smerchant, width_options, standard_and_wide).

all_consistent(width_options) :-
    consistent(smerchant, width_options).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values sizes_144_to_162w=144_148_151_154_157_156W_159W_162W unk_available_sizes=Unknown
% @importance 0.85

0.95::acc(smerchant, available_sizes).

0.95::true_val(available_sizes, sizes_144_to_162w); 0.05::true_val(available_sizes, unk_available_sizes).

measured(smerchant, available_sizes, sizes_144_to_162w).

all_consistent(available_sizes) :-
    consistent(smerchant, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, sizes_144_to_162w)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr available_sizes_138
% @type categorical
% @canonical false
% @original_name available_sizes (138cm)
% @values size_138_backordered=138cm_backordered unk_available_sizes_138=Unknown
% @importance 0.55

0.72::acc(s101, available_sizes_138).

0.65::true_val(available_sizes_138, size_138_backordered); 0.35::true_val(available_sizes_138, unk_available_sizes_138).

measured(s101, available_sizes_138, size_138_backordered).

all_consistent(available_sizes_138) :-
    consistent(s101, available_sizes_138).

evidence(all_consistent(available_sizes_138)).
query(true_val(available_sizes_138, size_138_backordered)).
query(true_val(available_sizes_138, unk_available_sizes_138)).

% @attr effective_edge_144
% @type numeric
% @canonical false
% @original_name Effective edge 144cm
% @unit cm
% @values v109_9=109.9 unk_effective_edge_144=Unknown
% @importance 0.85

0.93::acc(smerchant, effective_edge_144).

0.95::true_val(effective_edge_144, v109_9); 0.05::true_val(effective_edge_144, unk_effective_edge_144).

measured(smerchant, effective_edge_144, v109_9).

all_consistent(effective_edge_144) :-
    consistent(smerchant, effective_edge_144).

evidence(all_consistent(effective_edge_144)).
query(true_val(effective_edge_144, v109_9)).
query(true_val(effective_edge_144, unk_effective_edge_144)).

% @attr effective_edge_148
% @type numeric
% @canonical false
% @original_name Effective edge 148cm
% @unit cm
% @values v113_5=113.5 unk_effective_edge_148=Unknown
% @importance 0.85

0.93::acc(smerchant, effective_edge_148).

0.95::true_val(effective_edge_148, v113_5); 0.05::true_val(effective_edge_148, unk_effective_edge_148).

measured(smerchant, effective_edge_148, v113_5).

all_consistent(effective_edge_148) :-
    consistent(smerchant, effective_edge_148).

evidence(all_consistent(effective_edge_148)).
query(true_val(effective_edge_148, v113_5)).
query(true_val(effective_edge_148, unk_effective_edge_148)).

% @attr effective_edge_151
% @type numeric
% @canonical false
% @original_name Effective edge 151cm
% @unit cm
% @values v116_3=116.3 unk_effective_edge_151=Unknown
% @importance 0.85

0.93::acc(smerchant, effective_edge_151).

0.95::true_val(effective_edge_151, v116_3); 0.05::true_val(effective_edge_151, unk_effective_edge_151).

measured(smerchant, effective_edge_151, v116_3).

all_consistent(effective_edge_151) :-
    consistent(smerchant, effective_edge_151).

evidence(all_consistent(effective_edge_151)).
query(true_val(effective_edge_151, v116_3)).
query(true_val(effective_edge_151, unk_effective_edge_151)).

% @attr effective_edge_154
% @type numeric
% @canonical false
% @original_name Effective edge 154cm
% @unit cm
% @values v118_7=118.7 unk_effective_edge_154=Unknown
% @importance 0.85

0.93::acc(smerchant, effective_edge_154).

0.95::true_val(effective_edge_154, v118_7); 0.05::true_val(effective_edge_154, unk_effective_edge_154).

measured(smerchant, effective_edge_154, v118_7).

all_consistent(effective_edge_154) :-
    consistent(smerchant, effective_edge_154).

evidence(all_consistent(effective_edge_154)).
query(true_val(effective_edge_154, v118_7)).
query(true_val(effective_edge_154, unk_effective_edge_154)).

% @attr effective_edge_156w
% @type numeric
% @canonical false
% @original_name Effective edge 156cm Wide
% @unit cm
% @values v120_0=120.0 unk_effective_edge_156w=Unknown
% @importance 0.85

0.93::acc(smerchant, effective_edge_156w).

0.95::true_val(effective_edge_156w, v120_0); 0.05::true_val(effective_edge_156w, unk_effective_edge_156w).

measured(smerchant, effective_edge_156w, v120_0).

all_consistent(effective_edge_156w) :-
    consistent(smerchant, effective_edge_156w).

evidence(all_consistent(effective_edge_156w)).
query(true_val(effective_edge_156w, v120_0)).
query(true_val(effective_edge_156w, unk_effective_edge_156w)).

% @attr effective_edge_157
% @type numeric
% @canonical false
% @original_name Effective edge 157cm
% @unit cm
% @values v120_3=120.3 unk_effective_edge_157=Unknown
% @importance 0.85

0.93::acc(smerchant, effective_edge_157).

0.95::true_val(effective_edge_157, v120_3); 0.05::true_val(effective_edge_157, unk_effective_edge_157).

measured(smerchant, effective_edge_157, v120_3).

all_consistent(effective_edge_157) :-
    consistent(smerchant, effective_edge_157).

evidence(all_consistent(effective_edge_157)).
query(true_val(effective_edge_157, v120_3)).
query(true_val(effective_edge_157, unk_effective_edge_157)).

% @attr effective_edge_159w
% @type numeric
% @canonical false
% @original_name Effective edge 159cm Wide
% @unit cm
% @values v122_4=122.4 unk_effective_edge_159w=Unknown
% @importance 0.85

0.93::acc(smerchant, effective_edge_159w).

0.95::true_val(effective_edge_159w, v122_4); 0.05::true_val(effective_edge_159w, unk_effective_edge_159w).

measured(smerchant, effective_edge_159w, v122_4).

all_consistent(effective_edge_159w) :-
    consistent(smerchant, effective_edge_159w).

evidence(all_consistent(effective_edge_159w)).
query(true_val(effective_edge_159w, v122_4)).
query(true_val(effective_edge_159w, unk_effective_edge_159w)).

% @attr effective_edge_162w
% @type numeric
% @canonical false
% @original_name Effective edge 162cm Wide
% @unit cm
% @values v125_0=125.0 unk_effective_edge_162w=Unknown
% @importance 0.85

0.93::acc(smerchant, effective_edge_162w).

0.95::true_val(effective_edge_162w, v125_0); 0.05::true_val(effective_edge_162w, unk_effective_edge_162w).

measured(smerchant, effective_edge_162w, v125_0).

all_consistent(effective_edge_162w) :-
    consistent(smerchant, effective_edge_162w).

evidence(all_consistent(effective_edge_162w)).
query(true_val(effective_edge_162w, v125_0)).
query(true_val(effective_edge_162w, unk_effective_edge_162w)).

% @attr waist_width_144
% @type numeric
% @canonical false
% @original_name Waist width 144cm
% @unit cm
% @values v24_6=24.6 unk_waist_width_144=Unknown
% @importance 0.85

0.93::acc(smerchant, waist_width_144).

0.95::true_val(waist_width_144, v24_6); 0.05::true_val(waist_width_144, unk_waist_width_144).

measured(smerchant, waist_width_144, v24_6).

all_consistent(waist_width_144) :-
    consistent(smerchant, waist_width_144).

evidence(all_consistent(waist_width_144)).
query(true_val(waist_width_144, v24_6)).
query(true_val(waist_width_144, unk_waist_width_144)).

% @attr waist_width_148
% @type numeric
% @canonical false
% @original_name Waist width 148cm
% @unit cm
% @values v25_0=25.0 unk_waist_width_148=Unknown
% @importance 0.85

0.93::acc(smerchant, waist_width_148).

0.95::true_val(waist_width_148, v25_0); 0.05::true_val(waist_width_148, unk_waist_width_148).

measured(smerchant, waist_width_148, v25_0).

all_consistent(waist_width_148) :-
    consistent(smerchant, waist_width_148).

evidence(all_consistent(waist_width_148)).
query(true_val(waist_width_148, v25_0)).
query(true_val(waist_width_148, unk_waist_width_148)).

% @attr waist_width_151
% @type numeric
% @canonical false
% @original_name Waist width 151cm
% @unit cm
% @values v25_4=25.4 unk_waist_width_151=Unknown
% @importance 0.85

0.93::acc(smerchant, waist_width_151).

0.95::true_val(waist_width_151, v25_4); 0.05::true_val(waist_width_151, unk_waist_width_151).

measured(smerchant, waist_width_151, v25_4).

all_consistent(waist_width_151) :-
    consistent(smerchant, waist_width_151).

evidence(all_consistent(waist_width_151)).
query(true_val(waist_width_151, v25_4)).
query(true_val(waist_width_151, unk_waist_width_151)).

% @attr waist_width_154
% @type numeric
% @canonical false
% @original_name Waist width 154cm
% @unit cm
% @values v25_7=25.7 unk_waist_width_154=Unknown
% @importance 0.85

0.93::acc(smerchant, waist_width_154).

0.95::true_val(waist_width_154, v25_7); 0.05::true_val(waist_width_154, unk_waist_width_154).

measured(smerchant, waist_width_154, v25_7).

all_consistent(waist_width_154) :-
    consistent(smerchant, waist_width_154).

evidence(all_consistent(waist_width_154)).
query(true_val(waist_width_154, v25_7)).
query(true_val(waist_width_154, unk_waist_width_154)).

% @attr waist_width_156w
% @type numeric
% @canonical false
% @original_name Waist width 156cm Wide
% @unit cm
% @values v26_8=26.8 unk_waist_width_156w=Unknown
% @importance 0.85

0.93::acc(smerchant, waist_width_156w).

0.95::true_val(waist_width_156w, v26_8); 0.05::true_val(waist_width_156w, unk_waist_width_156w).

measured(smerchant, waist_width_156w, v26_8).

all_consistent(waist_width_156w) :-
    consistent(smerchant, waist_width_156w).

evidence(all_consistent(waist_width_156w)).
query(true_val(waist_width_156w, v26_8)).
query(true_val(waist_width_156w, unk_waist_width_156w)).

% @attr waist_width_157
% @type numeric
% @canonical false
% @original_name Waist width 157cm
% @unit cm
% @values v25_9=25.9 unk_waist_width_157=Unknown
% @importance 0.85

0.93::acc(smerchant, waist_width_157).

0.95::true_val(waist_width_157, v25_9); 0.05::true_val(waist_width_157, unk_waist_width_157).

measured(smerchant, waist_width_157, v25_9).

all_consistent(waist_width_157) :-
    consistent(smerchant, waist_width_157).

evidence(all_consistent(waist_width_157)).
query(true_val(waist_width_157, v25_9)).
query(true_val(waist_width_157, unk_waist_width_157)).

% @attr waist_width_159w
% @type numeric
% @canonical false
% @original_name Waist width 159cm Wide
% @unit cm
% @values v27_1=27.1 unk_waist_width_159w=Unknown
% @importance 0.85

0.93::acc(smerchant, waist_width_159w).

0.95::true_val(waist_width_159w, v27_1); 0.05::true_val(waist_width_159w, unk_waist_width_159w).

measured(smerchant, waist_width_159w, v27_1).

all_consistent(waist_width_159w) :-
    consistent(smerchant, waist_width_159w).

evidence(all_consistent(waist_width_159w)).
query(true_val(waist_width_159w, v27_1)).
query(true_val(waist_width_159w, unk_waist_width_159w)).

% @attr waist_width_162w
% @type numeric
% @canonical false
% @original_name Waist width 162cm Wide
% @unit cm
% @values v27_4=27.4 unk_waist_width_162w=Unknown
% @importance 0.85

0.93::acc(smerchant, waist_width_162w).

0.95::true_val(waist_width_162w, v27_4); 0.05::true_val(waist_width_162w, unk_waist_width_162w).

measured(smerchant, waist_width_162w, v27_4).

all_consistent(waist_width_162w) :-
    consistent(smerchant, waist_width_162w).

evidence(all_consistent(waist_width_162w)).
query(true_val(waist_width_162w, v27_4)).
query(true_val(waist_width_162w, unk_waist_width_162w)).

% @attr tip_tail_width_size_148
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (148cm)
% @unit cm
% @values v28_6=28.6 unk_tip_tail_width_size_148=Unknown
% @importance 0.85

0.93::acc(smerchant, tip_tail_width_size_148).

0.95::true_val(tip_tail_width_size_148, v28_6); 0.05::true_val(tip_tail_width_size_148, unk_tip_tail_width_size_148).

measured(smerchant, tip_tail_width_size_148, v28_6).

all_consistent(tip_tail_width_size_148) :-
    consistent(smerchant, tip_tail_width_size_148).

evidence(all_consistent(tip_tail_width_size_148)).
query(true_val(tip_tail_width_size_148, v28_6)).
query(true_val(tip_tail_width_size_148, unk_tip_tail_width_size_148)).

% @attr tip_tail_width_size_154
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (154cm)
% @unit cm
% @values v30_1=30.1 unk_tip_tail_width_size_154=Unknown
% @importance 0.85

0.93::acc(smerchant, tip_tail_width_size_154).

0.95::true_val(tip_tail_width_size_154, v30_1); 0.05::true_val(tip_tail_width_size_154, unk_tip_tail_width_size_154).

measured(smerchant, tip_tail_width_size_154, v30_1).

all_consistent(tip_tail_width_size_154) :-
    consistent(smerchant, tip_tail_width_size_154).

evidence(all_consistent(tip_tail_width_size_154)).
query(true_val(tip_tail_width_size_154, v30_1)).
query(true_val(tip_tail_width_size_154, unk_tip_tail_width_size_154)).

% @attr tip_tail_width_size
% @type numeric
% @canonical true
% @original_name tip_tail_width_size (157cm)
% @unit cm
% @values v30_4=30.4 unk_tip_tail_width_size=Unknown
% @importance 0.85

0.93::acc(smerchant, tip_tail_width_size).

0.95::true_val(tip_tail_width_size, v30_4); 0.05::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(smerchant, tip_tail_width_size, v30_4).

all_consistent(tip_tail_width_size) :-
    consistent(smerchant, tip_tail_width_size).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v30_4)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr tip_tail_width_size_162w
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (162cm Wide)
% @unit cm
% @values v32_2=32.2 unk_tip_tail_width_size_162w=Unknown
% @importance 0.85

0.93::acc(smerchant, tip_tail_width_size_162w).

0.95::true_val(tip_tail_width_size_162w, v32_2); 0.05::true_val(tip_tail_width_size_162w, unk_tip_tail_width_size_162w).

measured(smerchant, tip_tail_width_size_162w, v32_2).

all_consistent(tip_tail_width_size_162w) :-
    consistent(smerchant, tip_tail_width_size_162w).

evidence(all_consistent(tip_tail_width_size_162w)).
query(true_val(tip_tail_width_size_162w, v32_2)).
query(true_val(tip_tail_width_size_162w, unk_tip_tail_width_size_162w)).

% @attr sidecut_radius_size_148
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (148cm)
% @unit m
% @values v7_17=7.17 unk_sidecut_radius_size_148=Unknown
% @importance 0.85

0.93::acc(smerchant, sidecut_radius_size_148).

0.95::true_val(sidecut_radius_size_148, v7_17); 0.05::true_val(sidecut_radius_size_148, unk_sidecut_radius_size_148).

measured(smerchant, sidecut_radius_size_148, v7_17).

all_consistent(sidecut_radius_size_148) :-
    consistent(smerchant, sidecut_radius_size_148).

evidence(all_consistent(sidecut_radius_size_148)).
query(true_val(sidecut_radius_size_148, v7_17)).
query(true_val(sidecut_radius_size_148, unk_sidecut_radius_size_148)).

% @attr sidecut_radius_size_154
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (154cm)
% @unit m
% @values v7_55=7.55 unk_sidecut_radius_size_154=Unknown
% @importance 0.85

0.93::acc(smerchant, sidecut_radius_size_154).

0.95::true_val(sidecut_radius_size_154, v7_55); 0.05::true_val(sidecut_radius_size_154, unk_sidecut_radius_size_154).

measured(smerchant, sidecut_radius_size_154, v7_55).

all_consistent(sidecut_radius_size_154) :-
    consistent(smerchant, sidecut_radius_size_154).

evidence(all_consistent(sidecut_radius_size_154)).
query(true_val(sidecut_radius_size_154, v7_55)).
query(true_val(sidecut_radius_size_154, unk_sidecut_radius_size_154)).

% @attr sidecut_radius_size
% @type numeric
% @canonical true
% @original_name sidecut_radius_size (157cm)
% @unit m
% @values v7_61=7.61 unk_sidecut_radius_size=Unknown
% @importance 0.85

0.93::acc(smerchant, sidecut_radius_size).

0.95::true_val(sidecut_radius_size, v7_61); 0.05::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(smerchant, sidecut_radius_size, v7_61).

all_consistent(sidecut_radius_size) :-
    consistent(smerchant, sidecut_radius_size).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_61)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr sidecut_radius_size_162w
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (162cm Wide)
% @unit m
% @values v7_78=7.78 unk_sidecut_radius_size_162w=Unknown
% @importance 0.85

0.93::acc(smerchant, sidecut_radius_size_162w).

0.95::true_val(sidecut_radius_size_162w, v7_78); 0.05::true_val(sidecut_radius_size_162w, unk_sidecut_radius_size_162w).

measured(smerchant, sidecut_radius_size_162w, v7_78).

all_consistent(sidecut_radius_size_162w) :-
    consistent(smerchant, sidecut_radius_size_162w).

evidence(all_consistent(sidecut_radius_size_162w)).
query(true_val(sidecut_radius_size_162w, v7_78)).
query(true_val(sidecut_radius_size_162w, unk_sidecut_radius_size_162w)).

% @attr recommended_weight_range_size_148
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (148cm)
% @unit kg
% @values v50_70kg=50-70kg unk_recommended_weight_range_size_148=Unknown
% @importance 0.85

0.93::acc(smerchant, recommended_weight_range_size_148).

0.95::true_val(recommended_weight_range_size_148, v50_70kg); 0.05::true_val(recommended_weight_range_size_148, unk_recommended_weight_range_size_148).

measured(smerchant, recommended_weight_range_size_148, v50_70kg).

all_consistent(recommended_weight_range_size_148) :-
    consistent(smerchant, recommended_weight_range_size_148).

evidence(all_consistent(recommended_weight_range_size_148)).
query(true_val(recommended_weight_range_size_148, v50_70kg)).
query(true_val(recommended_weight_range_size_148, unk_recommended_weight_range_size_148)).

% @attr recommended_weight_range_size_154
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (154cm)
% @unit kg
% @values v65_85kg=65-85kg unk_recommended_weight_range_size_154=Unknown
% @importance 0.85

0.93::acc(smerchant, recommended_weight_range_size_154).

0.95::true_val(recommended_weight_range_size_154, v65_85kg); 0.05::true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154).

measured(smerchant, recommended_weight_range_size_154, v65_85kg).

all_consistent(recommended_weight_range_size_154) :-
    consistent(smerchant, recommended_weight_range_size_154).

evidence(all_consistent(recommended_weight_range_size_154)).
query(true_val(recommended_weight_range_size_154, v65_85kg)).
query(true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size (157cm)
% @unit kg
% @values v71_91kg=71-91kg unk_recommended_weight_range_size=Unknown
% @importance 0.85

0.93::acc(smerchant, recommended_weight_range_size).

0.95::true_val(recommended_weight_range_size, v71_91kg); 0.05::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(smerchant, recommended_weight_range_size, v71_91kg).

all_consistent(recommended_weight_range_size) :-
    consistent(smerchant, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, v71_91kg)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr recommended_weight_range_size_162w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (162cm Wide)
% @unit kg
% @values v83_103kg=83-103kg unk_recommended_weight_range_size_162w=Unknown
% @importance 0.85

0.93::acc(smerchant, recommended_weight_range_size_162w).

0.95::true_val(recommended_weight_range_size_162w, v83_103kg); 0.05::true_val(recommended_weight_range_size_162w, unk_recommended_weight_range_size_162w).

measured(smerchant, recommended_weight_range_size_162w, v83_103kg).

all_consistent(recommended_weight_range_size_162w) :-
    consistent(smerchant, recommended_weight_range_size_162w).

evidence(all_consistent(recommended_weight_range_size_162w)).
query(true_val(recommended_weight_range_size_162w, v83_103kg)).
query(true_val(recommended_weight_range_size_162w, unk_recommended_weight_range_size_162w)).

% @attr stance_width_range_size_148
% @type categorical
% @canonical false
% @original_name stance_width_range_size (148cm)
% @unit cm
% @values v45_57cm=45.0-57.0cm unk_stance_width_range_size_148=Unknown
% @importance 0.85

0.93::acc(smerchant, stance_width_range_size_148).

0.95::true_val(stance_width_range_size_148, v45_57cm); 0.05::true_val(stance_width_range_size_148, unk_stance_width_range_size_148).

measured(smerchant, stance_width_range_size_148, v45_57cm).

all_consistent(stance_width_range_size_148) :-
    consistent(smerchant, stance_width_range_size_148).

evidence(all_consistent(stance_width_range_size_148)).
query(true_val(stance_width_range_size_148, v45_57cm)).
query(true_val(stance_width_range_size_148, unk_stance_width_range_size_148)).

% @attr stance_width_range_size_154
% @type categorical
% @canonical false
% @original_name stance_width_range_size (154cm)
% @unit cm
% @values v49_61cm=49.0-61.0cm unk_stance_width_range_size_154=Unknown
% @importance 0.85

0.93::acc(smerchant, stance_width_range_size_154).

0.95::true_val(stance_width_range_size_154, v49_61cm); 0.05::true_val(stance_width_range_size_154, unk_stance_width_range_size_154).

measured(smerchant, stance_width_range_size_154, v49_61cm).

all_consistent(stance_width_range_size_154) :-
    consistent(smerchant, stance_width_range_size_154).

evidence(all_consistent(stance_width_range_size_154)).
query(true_val(stance_width_range_size_154, v49_61cm)).
query(true_val(stance_width_range_size_154, unk_stance_width_range_size_154)).

% @attr stance_width_range_size
% @type categorical
% @canonical true
% @original_name stance_width_range_size (157cm)
% @unit cm
% @values v51_63cm=51.0-63.0cm unk_stance_width_range_size=Unknown
% @importance 0.85

0.93::acc(smerchant, stance_width_range_size).

0.95::true_val(stance_width_range_size, v51_63cm); 0.05::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(smerchant, stance_width_range_size, v51_63cm).

all_consistent(stance_width_range_size) :-
    consistent(smerchant, stance_width_range_size).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v51_63cm)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values groomers_park_powder=Groomers_Park_Powder unk_terrain_suitability=Unknown
% @importance 0.85

0.93::acc(smerchant, terrain_suitability).

0.95::true_val(terrain_suitability, groomers_park_powder); 0.05::true_val(terrain_suitability, unk_terrain_suitability).

measured(smerchant, terrain_suitability, groomers_park_powder).

all_consistent(terrain_suitability) :-
    consistent(smerchant, terrain_suitability).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, groomers_park_powder)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr terrain_suitability_ratings
% @type categorical
% @canonical false
% @original_name terrain_suitability (ratings)
% @values park10_resort9_powder8=Park_10_Resort_9_Powder_8 unk_terrain_suitability_ratings=Unknown
% @importance 0.85

0.78::acc(s36, terrain_suitability_ratings).

0.63::true_val(terrain_suitability_ratings, park10_resort9_powder8); 0.37::true_val(terrain_suitability_ratings, unk_terrain_suitability_ratings).

measured(s36, terrain_suitability_ratings, park10_resort9_powder8).

all_consistent(terrain_suitability_ratings) :-
    consistent(s36, terrain_suitability_ratings).

evidence(all_consistent(terrain_suitability_ratings)).
query(true_val(terrain_suitability_ratings, park10_resort9_powder8)).
query(true_val(terrain_suitability_ratings, unk_terrain_suitability_ratings)).

% @attr amazon_float_ratio
% @type numeric
% @canonical false
% @original_name Amazon float ratio (2025 model)
% @unit /100
% @values v61=61.0 unk_amazon_float_ratio=Unknown
% @importance 0.55

0.70::acc(s30, amazon_float_ratio).

0.63::true_val(amazon_float_ratio, v61); 0.37::true_val(amazon_float_ratio, unk_amazon_float_ratio).

measured(s30, amazon_float_ratio, v61).

all_consistent(amazon_float_ratio) :-
    consistent(s30, amazon_float_ratio).

evidence(all_consistent(amazon_float_ratio)).
query(true_val(amazon_float_ratio, v61)).
query(true_val(amazon_float_ratio, unk_amazon_float_ratio)).

% @attr riding_style
% @type categorical
% @canonical false
% @original_name riding_style
% @values all_mountain_freestyle=All_Mountain_Freestyle unk_riding_style=Unknown
% @importance 0.85

0.93::acc(smerchant, riding_style).

0.95::true_val(riding_style, all_mountain_freestyle); 0.05::true_val(riding_style, unk_riding_style).

measured(smerchant, riding_style, all_mountain_freestyle).

all_consistent(riding_style) :-
    consistent(smerchant, riding_style).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, all_mountain_freestyle)).
query(true_val(riding_style, unk_riding_style)).

% @attr rider_level
% @type categorical
% @canonical false
% @original_name rider_level
% @values intermediate=Intermediate unk_rider_level=Unknown
% @importance 0.85

0.93::acc(smerchant, rider_level).

0.95::true_val(rider_level, intermediate); 0.05::true_val(rider_level, unk_rider_level).

measured(smerchant, rider_level, intermediate).

all_consistent(rider_level) :-
    consistent(smerchant, rider_level).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate)).
query(true_val(rider_level, unk_rider_level)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values intermediate_to_advanced=Intermediate_to_Advanced unk_skill_level_recommendation=Unknown
% @importance 0.81

0.85::acc(s31, skill_level_recommendation).
0.82::acc(s72, skill_level_recommendation).

0.95::true_val(skill_level_recommendation, intermediate_to_advanced); 0.05::true_val(skill_level_recommendation, unk_skill_level_recommendation).

measured(s31, skill_level_recommendation, intermediate_to_advanced).
measured(s72, skill_level_recommendation, intermediate_to_advanced).

all_consistent(skill_level_recommendation) :-
    (indep(s31), consistent(s31, skill_level_recommendation) ; \+indep(s31)),
    (indep(s72), consistent(s72, skill_level_recommendation) ; \+indep(s72)).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, intermediate_to_advanced)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

% @attr use_case_description
% @type categorical
% @canonical false
% @original_name Use case description
% @values quiver_killer=Quiver_killer_one_board_for_everything unk_use_case_description=Unknown
% @importance 0.90

0.92::acc(smerchant, use_case_description).
0.90::acc(s1, use_case_description).

0.95::true_val(use_case_description, quiver_killer); 0.05::true_val(use_case_description, unk_use_case_description).

measured(smerchant, use_case_description, quiver_killer).
measured(s1, use_case_description, quiver_killer).

all_consistent(use_case_description) :-
    consistent(smerchant, use_case_description),
    (indep(s1), consistent(s1, use_case_description) ; \+indep(s1)).

evidence(all_consistent(use_case_description)).
query(true_val(use_case_description, quiver_killer)).
query(true_val(use_case_description, unk_use_case_description)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values smooth_forgiving_lively_catchfree=Smooth_forgiving_lively_responsive_catch-free unk_reviewer_opinion_whitelines=Unknown
% @importance 0.85

0.82::acc(s12, reviewer_opinion_whitelines).

0.77::true_val(reviewer_opinion_whitelines, smooth_forgiving_lively_catchfree); 0.23::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

measured(s12, reviewer_opinion_whitelines, smooth_forgiving_lively_catchfree).

all_consistent(reviewer_opinion_whitelines) :-
    consistent(s12, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, smooth_forgiving_lively_catchfree)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

% @attr pop
% @type categorical
% @canonical false
% @original_name pop
% @values easy_lively_ollie=Easy_access_pop_super_lively_ollie_from_camber_carbon unk_pop=Unknown
% @importance 0.875

0.82::acc(ssp, pop).
0.78::acc(s55, pop).

0.92::true_val(pop, easy_lively_ollie); 0.08::true_val(pop, unk_pop).

measured(ssp, pop, easy_lively_ollie).
measured(s55, pop, easy_lively_ollie).

all_consistent(pop) :-
    consistent(ssp, pop),
    consistent(s55, pop).

evidence(all_consistent(pop)).
query(true_val(pop, easy_lively_ollie)).
query(true_val(pop, unk_pop)).

% @attr stability_at_speed
% @type categorical
% @canonical false
% @original_name Stability at speed
% @values average_wobbly_high_speed=Average_wobbly_at_higher_speeds unk_stability_at_speed=Unknown
% @importance 0.90

0.82::acc(ssp, stability_at_speed).

0.68::true_val(stability_at_speed, average_wobbly_high_speed); 0.32::true_val(stability_at_speed, unk_stability_at_speed).

measured(ssp, stability_at_speed, average_wobbly_high_speed).

all_consistent(stability_at_speed) :-
    consistent(ssp, stability_at_speed).

evidence(all_consistent(stability_at_speed)).
query(true_val(stability_at_speed, average_wobbly_high_speed)).
query(true_val(stability_at_speed, unk_stability_at_speed)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values decent_struggles_hardpack=Decent_in_good_conditions_struggles_hardpack_ice unk_edge_hold=Unknown
% @importance 0.875

0.80::acc(ssp, edge_hold).
0.78::acc(s52, edge_hold).

0.90::true_val(edge_hold, decent_struggles_hardpack); 0.10::true_val(edge_hold, unk_edge_hold).

measured(ssp, edge_hold, decent_struggles_hardpack).
measured(s52, edge_hold, decent_struggles_hardpack).

all_consistent(edge_hold) :-
    consistent(ssp, edge_hold),
    consistent(s52, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, decent_struggles_hardpack)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr float_in_powder
% @type categorical
% @canonical false
% @original_name Float in powder
% @values good_float_3bt_backseat=Good_float_from_3BT_plus_backseat_inserts unk_float_in_powder=Unknown
% @importance 0.84

0.82::acc(s16, float_in_powder).
0.90::acc(s13, float_in_powder).

0.93::true_val(float_in_powder, good_float_3bt_backseat); 0.07::true_val(float_in_powder, unk_float_in_powder).

measured(s16, float_in_powder, good_float_3bt_backseat).
measured(s13, float_in_powder, good_float_3bt_backseat).

all_consistent(float_in_powder) :-
    consistent(s13, float_in_powder),
    consistent(s16, float_in_powder).

evidence(all_consistent(float_in_powder)).
query(true_val(float_in_powder, good_float_3bt_backseat)).
query(true_val(float_in_powder, unk_float_in_powder)).

% @attr chatter_performance
% @type categorical
% @canonical false
% @original_name chatter_performance
% @values urethane_reduces_chatter=Urethane_sidewalls_reduce_chatter_vibration unk_chatter_performance=Unknown
% @importance 0.85

0.88::acc(s13, chatter_performance).
0.82::acc(s27, chatter_performance).

0.93::true_val(chatter_performance, urethane_reduces_chatter); 0.07::true_val(chatter_performance, unk_chatter_performance).

measured(s13, chatter_performance, urethane_reduces_chatter).
measured(s27, chatter_performance, urethane_reduces_chatter).

all_consistent(chatter_performance) :-
    consistent(s13, chatter_performance),
    consistent(s27, chatter_performance).

evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, urethane_reduces_chatter)).
query(true_val(chatter_performance, unk_chatter_performance)).

% @attr warranty_period_years
% @type categorical
% @canonical true
% @original_name warranty_period_years
% @values y2_limited=2_year_limited_warranty unk_warranty_period_years=Unknown
% @importance 0.80

0.95::acc(s81, warranty_period_years).

0.93::true_val(warranty_period_years, y2_limited); 0.07::true_val(warranty_period_years, unk_warranty_period_years).

measured(s81, warranty_period_years, y2_limited).

all_consistent(warranty_period_years) :-
    consistent(s81, warranty_period_years).

evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, y2_limited)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

% @attr warranty_period_years_extended
% @type categorical
% @canonical false
% @original_name warranty_period_years (extended)
% @values y2_plus_1=2_plus_1_year_warranty_with_registration unk_warranty_period_years_extended=Unknown
% @importance 0.72

0.95::acc(s82, warranty_period_years_extended).

0.90::true_val(warranty_period_years_extended, y2_plus_1); 0.10::true_val(warranty_period_years_extended, unk_warranty_period_years_extended).

measured(s82, warranty_period_years_extended, y2_plus_1).

all_consistent(warranty_period_years_extended) :-
    consistent(s82, warranty_period_years_extended).

evidence(all_consistent(warranty_period_years_extended)).
query(true_val(warranty_period_years_extended, y2_plus_1)).
query(true_val(warranty_period_years_extended, unk_warranty_period_years_extended)).

% @attr return_policy_terms
% @type categorical
% @canonical true
% @original_name return_policy_terms (Bataleon direct)
% @values d45_days=45_day_returns unk_return_policy_terms=Unknown
% @importance 0.75

0.95::acc(s34, return_policy_terms).

0.90::true_val(return_policy_terms, d45_days); 0.10::true_val(return_policy_terms, unk_return_policy_terms).

measured(s34, return_policy_terms, d45_days).

all_consistent(return_policy_terms) :-
    consistent(s34, return_policy_terms).

evidence(all_consistent(return_policy_terms)).
query(true_val(return_policy_terms, d45_days)).
query(true_val(return_policy_terms, unk_return_policy_terms)).

% @attr return_policy_terms_evo
% @type categorical
% @canonical false
% @original_name return_policy_terms (evo.com)
% @values up_to_1_year=Up_to_1_year_returns unk_return_policy_terms_evo=Unknown
% @importance 0.65

0.85::acc(s97, return_policy_terms_evo).

0.74::true_val(return_policy_terms_evo, up_to_1_year); 0.26::true_val(return_policy_terms_evo, unk_return_policy_terms_evo).

measured(s97, return_policy_terms_evo, up_to_1_year).

all_consistent(return_policy_terms_evo) :-
    consistent(s97, return_policy_terms_evo).

evidence(all_consistent(return_policy_terms_evo)).
query(true_val(return_policy_terms_evo, up_to_1_year)).
query(true_val(return_policy_terms_evo, unk_return_policy_terms_evo)).

% @attr overall_rating_snowboardingprofiles
% @type numeric
% @canonical false
% @original_name overall_rating_snowboardingprofiles
% @unit /100
% @values v85_6=85.6 unk_overall_rating_snowboardingprofiles=Unknown
% @importance 0.90

0.85::acc(ssp, overall_rating_snowboardingprofiles).

0.68::true_val(overall_rating_snowboardingprofiles, v85_6); 0.32::true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles).

measured(ssp, overall_rating_snowboardingprofiles, v85_6).

all_consistent(overall_rating_snowboardingprofiles) :-
    consistent(ssp, overall_rating_snowboardingprofiles).

evidence(all_consistent(overall_rating_snowboardingprofiles)).
query(true_val(overall_rating_snowboardingprofiles, v85_6)).
query(true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles)).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name reviewer_opinion_snowboardingprofiles (ranking)
% @values rank_13_of_33=13th_out_of_33_AMF_boards unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.90

0.82::acc(ssp, reviewer_opinion_snowboardingprofiles).

0.68::true_val(reviewer_opinion_snowboardingprofiles, rank_13_of_33); 0.32::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).

measured(ssp, reviewer_opinion_snowboardingprofiles, rank_13_of_33).

all_consistent(reviewer_opinion_snowboardingprofiles) :-
    consistent(ssp, reviewer_opinion_snowboardingprofiles).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, rank_13_of_33)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

% @attr reviewer_opinion_snowboardingprofiles_score
% @type numeric
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (score)
% @unit /100
% @values v84_3=84.3 unk_reviewer_opinion_snowboardingprofiles_score=Unknown
% @importance 0.90

0.82::acc(ssp, reviewer_opinion_snowboardingprofiles_score).

0.68::true_val(reviewer_opinion_snowboardingprofiles_score, v84_3); 0.32::true_val(reviewer_opinion_snowboardingprofiles_score, unk_reviewer_opinion_snowboardingprofiles_score).

measured(ssp, reviewer_opinion_snowboardingprofiles_score, v84_3).

all_consistent(reviewer_opinion_snowboardingprofiles_score) :-
    consistent(ssp, reviewer_opinion_snowboardingprofiles_score).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_score)).
query(true_val(reviewer_opinion_snowboardingprofiles_score, v84_3)).
query(true_val(reviewer_opinion_snowboardingprofiles_score, unk_reviewer_opinion_snowboardingprofiles_score)).

% @attr sp_price_listed
% @type numeric
% @canonical false
% @original_name SnowboardingProfiles price listed
% @unit USD
% @values v579=579.0 unk_sp_price_listed=Unknown
% @importance 0.90

0.80::acc(ssp, sp_price_listed).

0.68::true_val(sp_price_listed, v579); 0.32::true_val(sp_price_listed, unk_sp_price_listed).

measured(ssp, sp_price_listed, v579).

all_consistent(sp_price_listed) :-
    consistent(ssp, sp_price_listed).

evidence(all_consistent(sp_price_listed)).
query(true_val(sp_price_listed, v579)).
query(true_val(sp_price_listed, unk_sp_price_listed)).

% @attr sp_jumps_rating
% @type numeric
% @canonical false
% @original_name SP Jumps rating
% @unit /5
% @values v4_of_5=4.0 unk_sp_jumps_rating=Unknown
% @importance 0.90

0.85::acc(ssp, sp_jumps_rating).

0.68::true_val(sp_jumps_rating, v4_of_5); 0.32::true_val(sp_jumps_rating, unk_sp_jumps_rating).

measured(ssp, sp_jumps_rating, v4_of_5).

all_consistent(sp_jumps_rating) :-
    consistent(ssp, sp_jumps_rating).

evidence(all_consistent(sp_jumps_rating)).
query(true_val(sp_jumps_rating, v4_of_5)).
query(true_val(sp_jumps_rating, unk_sp_jumps_rating)).

% @attr carving_score_snowboardingprofiles
% @type numeric
% @canonical false
% @original_name carving_score_snowboardingprofiles
% @unit /5
% @values v3_5_of_5=3.5 unk_carving_score_snowboardingprofiles=Unknown
% @importance 0.90

0.85::acc(ssp, carving_score_snowboardingprofiles).

0.68::true_val(carving_score_snowboardingprofiles, v3_5_of_5); 0.32::true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles).

measured(ssp, carving_score_snowboardingprofiles, v3_5_of_5).

all_consistent(carving_score_snowboardingprofiles) :-
    consistent(ssp, carving_score_snowboardingprofiles).

evidence(all_consistent(carving_score_snowboardingprofiles)).
query(true_val(carving_score_snowboardingprofiles, v3_5_of_5)).
query(true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles)).

% @attr sp_turns_rating
% @type numeric
% @canonical false
% @original_name SP Turns rating
% @unit /5
% @values v4_5_of_5=4.5 unk_sp_turns_rating=Unknown
% @importance 0.90

0.85::acc(ssp, sp_turns_rating).

0.68::true_val(sp_turns_rating, v4_5_of_5); 0.32::true_val(sp_turns_rating, unk_sp_turns_rating).

measured(ssp, sp_turns_rating, v4_5_of_5).

all_consistent(sp_turns_rating) :-
    consistent(ssp, sp_turns_rating).

evidence(all_consistent(sp_turns_rating)).
query(true_val(sp_turns_rating, v4_5_of_5)).
query(true_val(sp_turns_rating, unk_sp_turns_rating)).

% @attr sp_switch_rating
% @type numeric
% @canonical false
% @original_name SP Switch rating
% @unit /5
% @values v4_of_5=4.0 unk_sp_switch_rating=Unknown
% @importance 0.90

0.85::acc(ssp, sp_switch_rating).

0.68::true_val(sp_switch_rating, v4_of_5); 0.32::true_val(sp_switch_rating, unk_sp_switch_rating).

measured(ssp, sp_switch_rating, v4_of_5).

all_consistent(sp_switch_rating) :-
    consistent(ssp, sp_switch_rating).

evidence(all_consistent(sp_switch_rating)).
query(true_val(sp_switch_rating, v4_of_5)).
query(true_val(sp_switch_rating, unk_sp_switch_rating)).

% @attr sp_speed_rating
% @type numeric
% @canonical false
% @original_name SP Speed rating
% @unit /5
% @values v3_of_5=3.0 unk_sp_speed_rating=Unknown
% @importance 0.90

0.85::acc(ssp, sp_speed_rating).

0.68::true_val(sp_speed_rating, v3_of_5); 0.32::true_val(sp_speed_rating, unk_sp_speed_rating).

measured(ssp, sp_speed_rating, v3_of_5).

all_consistent(sp_speed_rating) :-
    consistent(ssp, sp_speed_rating).

evidence(all_consistent(sp_speed_rating)).
query(true_val(sp_speed_rating, v3_of_5)).
query(true_val(sp_speed_rating, unk_sp_speed_rating)).

% @attr sp_spins_rating
% @type numeric
% @canonical false
% @original_name SP Spins rating
% @unit /5
% @values v4_of_5=4.0 unk_sp_spins_rating=Unknown
% @importance 0.90

0.85::acc(ssp, sp_spins_rating).

0.68::true_val(sp_spins_rating, v4_of_5); 0.32::true_val(sp_spins_rating, unk_sp_spins_rating).

measured(ssp, sp_spins_rating, v4_of_5).

all_consistent(sp_spins_rating) :-
    consistent(ssp, sp_spins_rating).

evidence(all_consistent(sp_spins_rating)).
query(true_val(sp_spins_rating, v4_of_5)).
query(true_val(sp_spins_rating, unk_sp_spins_rating)).

% @attr sp_butters_rating
% @type numeric
% @canonical false
% @original_name SP Butters rating
% @unit /5
% @values v4_5_of_5=4.5 unk_sp_butters_rating=Unknown
% @importance 0.90

0.85::acc(ssp, sp_butters_rating).

0.68::true_val(sp_butters_rating, v4_5_of_5); 0.32::true_val(sp_butters_rating, unk_sp_butters_rating).

measured(ssp, sp_butters_rating, v4_5_of_5).

all_consistent(sp_butters_rating) :-
    consistent(ssp, sp_butters_rating).

evidence(all_consistent(sp_butters_rating)).
query(true_val(sp_butters_rating, v4_5_of_5)).
query(true_val(sp_butters_rating, unk_sp_butters_rating)).

% @attr sp_jibbing_rating
% @type numeric
% @canonical false
% @original_name SP Jibbing rating
% @unit /5
% @values v3_5_of_5=3.5 unk_sp_jibbing_rating=Unknown
% @importance 0.90

0.85::acc(ssp, sp_jibbing_rating).

0.68::true_val(sp_jibbing_rating, v3_5_of_5); 0.32::true_val(sp_jibbing_rating, unk_sp_jibbing_rating).

measured(ssp, sp_jibbing_rating, v3_5_of_5).

all_consistent(sp_jibbing_rating) :-
    consistent(ssp, sp_jibbing_rating).

evidence(all_consistent(sp_jibbing_rating)).
query(true_val(sp_jibbing_rating, v3_5_of_5)).
query(true_val(sp_jibbing_rating, unk_sp_jibbing_rating)).

% @attr sp_crud_rating
% @type numeric
% @canonical false
% @original_name SP Crud rating
% @unit /5
% @values v3_5_of_5=3.5 unk_sp_crud_rating=Unknown
% @importance 0.90

0.85::acc(ssp, sp_crud_rating).

0.68::true_val(sp_crud_rating, v3_5_of_5); 0.32::true_val(sp_crud_rating, unk_sp_crud_rating).

measured(ssp, sp_crud_rating, v3_5_of_5).

all_consistent(sp_crud_rating) :-
    consistent(ssp, sp_crud_rating).

evidence(all_consistent(sp_crud_rating)).
query(true_val(sp_crud_rating, v3_5_of_5)).
query(true_val(sp_crud_rating, unk_sp_crud_rating)).

% @attr powder_score_snowboardingprofiles
% @type numeric
% @canonical false
% @original_name powder_score_snowboardingprofiles
% @unit /5
% @values v3_of_5=3.0 unk_powder_score_snowboardingprofiles=Unknown
% @importance 0.90

0.85::acc(ssp, powder_score_snowboardingprofiles).

0.68::true_val(powder_score_snowboardingprofiles, v3_of_5); 0.32::true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles).

measured(ssp, powder_score_snowboardingprofiles, v3_of_5).

all_consistent(powder_score_snowboardingprofiles) :-
    consistent(ssp, powder_score_snowboardingprofiles).

evidence(all_consistent(powder_score_snowboardingprofiles)).
query(true_val(powder_score_snowboardingprofiles, v3_of_5)).
query(true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles)).

% @attr reviewer_opinion_whitelines_top100_2021
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines (top 100 2021)
% @values selected_top_100=Selected_for_Whitelines_top_100 unk_reviewer_opinion_whitelines_top100_2021=Unknown
% @importance 0.70

0.82::acc(s20, reviewer_opinion_whitelines_top100_2021).

0.77::true_val(reviewer_opinion_whitelines_top100_2021, selected_top_100); 0.23::true_val(reviewer_opinion_whitelines_top100_2021, unk_reviewer_opinion_whitelines_top100_2021).

measured(s20, reviewer_opinion_whitelines_top100_2021, selected_top_100).

all_consistent(reviewer_opinion_whitelines_top100_2021) :-
    consistent(s20, reviewer_opinion_whitelines_top100_2021).

evidence(all_consistent(reviewer_opinion_whitelines_top100_2021)).
query(true_val(reviewer_opinion_whitelines_top100_2021, selected_top_100)).
query(true_val(reviewer_opinion_whitelines_top100_2021, unk_reviewer_opinion_whitelines_top100_2021)).

% @attr reviewer_opinion_whitelines_top100_2022
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines (top 100 2022)
% @values selected_top_100=Also_selected_Whitelines_top_100 unk_reviewer_opinion_whitelines_top100_2022=Unknown
% @importance 0.78

0.80::acc(s16, reviewer_opinion_whitelines_top100_2022).

0.70::true_val(reviewer_opinion_whitelines_top100_2022, selected_top_100); 0.30::true_val(reviewer_opinion_whitelines_top100_2022, unk_reviewer_opinion_whitelines_top100_2022).

measured(s16, reviewer_opinion_whitelines_top100_2022, selected_top_100).

all_consistent(reviewer_opinion_whitelines_top100_2022) :-
    consistent(s16, reviewer_opinion_whitelines_top100_2022).

evidence(all_consistent(reviewer_opinion_whitelines_top100_2022)).
query(true_val(reviewer_opinion_whitelines_top100_2022, selected_top_100)).
query(true_val(reviewer_opinion_whitelines_top100_2022, unk_reviewer_opinion_whitelines_top100_2022)).

% @attr reviewer_opinion_whitelines_quote
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines (quote)
% @values lives_up_anything_goes=The_Whatever_truly_lives_up_to_anything_goes_philosophy unk_reviewer_opinion_whitelines_quote=Unknown
% @importance 0.80

0.82::acc(s27, reviewer_opinion_whitelines_quote).

0.75::true_val(reviewer_opinion_whitelines_quote, lives_up_anything_goes); 0.25::true_val(reviewer_opinion_whitelines_quote, unk_reviewer_opinion_whitelines_quote).

measured(s27, reviewer_opinion_whitelines_quote, lives_up_anything_goes).

all_consistent(reviewer_opinion_whitelines_quote) :-
    consistent(s27, reviewer_opinion_whitelines_quote).

evidence(all_consistent(reviewer_opinion_whitelines_quote)).
query(true_val(reviewer_opinion_whitelines_quote, lives_up_anything_goes)).
query(true_val(reviewer_opinion_whitelines_quote, unk_reviewer_opinion_whitelines_quote)).

% @attr proctorski_overall_rating
% @type numeric
% @canonical false
% @original_name Proctorski.com overall rating
% @unit /5
% @values v4_7=4.7 unk_proctorski_overall_rating=Unknown
% @importance 0.60

0.55::acc(s18, proctorski_overall_rating).

0.36::true_val(proctorski_overall_rating, v4_7); 0.64::true_val(proctorski_overall_rating, unk_proctorski_overall_rating).

measured(s18, proctorski_overall_rating, v4_7).

all_consistent(proctorski_overall_rating) :-
    consistent(s18, proctorski_overall_rating).

evidence(all_consistent(proctorski_overall_rating)).
query(true_val(proctorski_overall_rating, v4_7)).
query(true_val(proctorski_overall_rating, unk_proctorski_overall_rating)).

% @attr proctorski_design_rating
% @type numeric
% @canonical false
% @original_name Proctorski.com design/build quality rating
% @unit /5
% @values v4_5=4.5 unk_proctorski_design_rating=Unknown
% @importance 0.60

0.55::acc(s18, proctorski_design_rating).

0.36::true_val(proctorski_design_rating, v4_5); 0.64::true_val(proctorski_design_rating, unk_proctorski_design_rating).

measured(s18, proctorski_design_rating, v4_5).

all_consistent(proctorski_design_rating) :-
    consistent(s18, proctorski_design_rating).

evidence(all_consistent(proctorski_design_rating)).
query(true_val(proctorski_design_rating, v4_5)).
query(true_val(proctorski_design_rating, unk_proctorski_design_rating)).

% @attr evo_field_test_verdict
% @type categorical
% @canonical false
% @original_name evo.com field test (2024) verdict
% @values perfectly_named_performs=Perfectly_named_whatever_condition_terrain_rider unk_evo_field_test_verdict=Unknown
% @importance 0.80

0.75::acc(s14, evo_field_test_verdict).

0.66::true_val(evo_field_test_verdict, perfectly_named_performs); 0.34::true_val(evo_field_test_verdict, unk_evo_field_test_verdict).

measured(s14, evo_field_test_verdict, perfectly_named_performs).

all_consistent(evo_field_test_verdict) :-
    consistent(s14, evo_field_test_verdict).

evidence(all_consistent(evo_field_test_verdict)).
query(true_val(evo_field_test_verdict, perfectly_named_performs)).
query(true_val(evo_field_test_verdict, unk_evo_field_test_verdict)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect (3BT edge catch)
% @values tbt_reduces_edge_catch=3BT_dramatically_reduces_edge_catch unk_positive_aspect=Unknown
% @importance 0.82

0.82::acc(s12, positive_aspect).
0.80::acc(s16, positive_aspect).
0.78::acc(s5, positive_aspect).

0.95::true_val(positive_aspect, tbt_reduces_edge_catch); 0.05::true_val(positive_aspect, unk_positive_aspect).

measured(s12, positive_aspect, tbt_reduces_edge_catch).
measured(s16, positive_aspect, tbt_reduces_edge_catch).
measured(s5, positive_aspect, tbt_reduces_edge_catch).

all_consistent(positive_aspect) :-
    consistent(s12, positive_aspect),
    consistent(s16, positive_aspect),
    (indep(s5), consistent(s5, positive_aspect) ; \+indep(s5)).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, tbt_reduces_edge_catch)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr positive_aspect_quiver_killer
% @type categorical
% @canonical false
% @original_name positive_aspect (quiver killer)
% @values true_quiver_killer=True_quiver_killer_park_groomers_powder unk_positive_aspect_quiver_killer=Unknown
% @importance 0.81

0.78::acc(s14, positive_aspect_quiver_killer).
0.80::acc(s16, positive_aspect_quiver_killer).
0.82::acc(s27, positive_aspect_quiver_killer).

0.95::true_val(positive_aspect_quiver_killer, true_quiver_killer); 0.05::true_val(positive_aspect_quiver_killer, unk_positive_aspect_quiver_killer).

measured(s14, positive_aspect_quiver_killer, true_quiver_killer).
measured(s16, positive_aspect_quiver_killer, true_quiver_killer).
measured(s27, positive_aspect_quiver_killer, true_quiver_killer).

all_consistent(positive_aspect_quiver_killer) :-
    consistent(s14, positive_aspect_quiver_killer),
    consistent(s16, positive_aspect_quiver_killer),
    consistent(s27, positive_aspect_quiver_killer).

evidence(all_consistent(positive_aspect_quiver_killer)).
query(true_val(positive_aspect_quiver_killer, true_quiver_killer)).
query(true_val(positive_aspect_quiver_killer, unk_positive_aspect_quiver_killer)).

% @attr positive_aspect_butter_press
% @type categorical
% @canonical false
% @original_name positive_aspect (butter/press)
% @values easy_butter_press=Very_easy_to_butter_press_medium_soft_flex unk_positive_aspect_butter_press=Unknown
% @importance 0.875

0.82::acc(ssp, positive_aspect_butter_press).
0.78::acc(s5, positive_aspect_butter_press).

0.92::true_val(positive_aspect_butter_press, easy_butter_press); 0.08::true_val(positive_aspect_butter_press, unk_positive_aspect_butter_press).

measured(ssp, positive_aspect_butter_press, easy_butter_press).
measured(s5, positive_aspect_butter_press, easy_butter_press).

all_consistent(positive_aspect_butter_press) :-
    consistent(ssp, positive_aspect_butter_press),
    (indep(s5), consistent(s5, positive_aspect_butter_press) ; \+indep(s5)).

evidence(all_consistent(positive_aspect_butter_press)).
query(true_val(positive_aspect_butter_press, easy_butter_press)).
query(true_val(positive_aspect_butter_press, unk_positive_aspect_butter_press)).

% @attr turn_initiation_performance
% @type categorical
% @canonical false
% @original_name turn_initiation_performance
% @values smooth_forgiving_effortless=Smooth_forgiving_effortless_edge_to_edge unk_turn_initiation_performance=Unknown
% @importance 0.85

0.80::acc(s5, turn_initiation_performance).
0.82::acc(s12, turn_initiation_performance).

0.92::true_val(turn_initiation_performance, smooth_forgiving_effortless); 0.08::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s5, turn_initiation_performance, smooth_forgiving_effortless).
measured(s12, turn_initiation_performance, smooth_forgiving_effortless).

all_consistent(turn_initiation_performance) :-
    consistent(s12, turn_initiation_performance),
    (indep(s5), consistent(s5, turn_initiation_performance) ; \+indep(s5)).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, smooth_forgiving_effortless)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr weight_feel
% @type categorical
% @canonical false
% @original_name Weight feel
% @values feels_light_despite_average=Feels_light_on_snow_despite_near_average_weight unk_weight_feel=Unknown
% @importance 0.90

0.82::acc(ssp, weight_feel).
0.88::acc(s13, weight_feel).

0.92::true_val(weight_feel, feels_light_despite_average); 0.08::true_val(weight_feel, unk_weight_feel).

measured(ssp, weight_feel, feels_light_despite_average).
measured(s13, weight_feel, feels_light_despite_average).

all_consistent(weight_feel) :-
    consistent(ssp, weight_feel),
    consistent(s13, weight_feel).

evidence(all_consistent(weight_feel)).
query(true_val(weight_feel, feels_light_despite_average)).
query(true_val(weight_feel, unk_weight_feel)).

% @attr positive_aspect_float
% @type categorical
% @canonical false
% @original_name positive_aspect (float)
% @values tbt_float_backseat=3BT_provides_surprising_float_backseat_inserts_help unk_positive_aspect_float=Unknown
% @importance 0.84

0.80::acc(s16, positive_aspect_float).
0.88::acc(s13, positive_aspect_float).

0.93::true_val(positive_aspect_float, tbt_float_backseat); 0.07::true_val(positive_aspect_float, unk_positive_aspect_float).

measured(s16, positive_aspect_float, tbt_float_backseat).
measured(s13, positive_aspect_float, tbt_float_backseat).

all_consistent(positive_aspect_float) :-
    consistent(s13, positive_aspect_float),
    consistent(s16, positive_aspect_float).

evidence(all_consistent(positive_aspect_float)).
query(true_val(positive_aspect_float, tbt_float_backseat)).
query(true_val(positive_aspect_float, unk_positive_aspect_float)).

% @attr positive_aspect_park
% @type categorical
% @canonical false
% @original_name positive_aspect (park)
% @values hookfree_easy_pop=Hook_free_on_rails_easy_pop_for_jumps unk_positive_aspect_park=Unknown
% @importance 0.78

0.72::acc(s61, positive_aspect_park).
0.82::acc(ssp, positive_aspect_park).

0.88::true_val(positive_aspect_park, hookfree_easy_pop); 0.12::true_val(positive_aspect_park, unk_positive_aspect_park).

measured(s61, positive_aspect_park, hookfree_easy_pop).
measured(ssp, positive_aspect_park, hookfree_easy_pop).

all_consistent(positive_aspect_park) :-
    consistent(ssp, positive_aspect_park),
    consistent(s61, positive_aspect_park).

evidence(all_consistent(positive_aspect_park)).
query(true_val(positive_aspect_park, hookfree_easy_pop)).
query(true_val(positive_aspect_park, unk_positive_aspect_park)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum (powder)
% @values powder_surfed_mountain=Dumped_snow_backseat_settings_surfed_mountain unk_user_review_forum=Unknown
% @importance 0.90

0.75::acc(s13, user_review_forum).

0.69::true_val(user_review_forum, powder_surfed_mountain); 0.31::true_val(user_review_forum, unk_user_review_forum).

measured(s13, user_review_forum, powder_surfed_mountain).

all_consistent(user_review_forum) :-
    consistent(s13, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, powder_surfed_mountain)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr user_review_forum_ice
% @type categorical
% @canonical false
% @original_name user_review_forum (ice edge hold)
% @values held_edge_on_ice=Icy_start_still_held_edge_confidently unk_user_review_forum_ice=Unknown
% @importance 0.90

0.72::acc(s13, user_review_forum_ice).

0.69::true_val(user_review_forum_ice, held_edge_on_ice); 0.31::true_val(user_review_forum_ice, unk_user_review_forum_ice).

measured(s13, user_review_forum_ice, held_edge_on_ice).

all_consistent(user_review_forum_ice) :-
    consistent(s13, user_review_forum_ice).

evidence(all_consistent(user_review_forum_ice)).
query(true_val(user_review_forum_ice, held_edge_on_ice)).
query(true_val(user_review_forum_ice, unk_user_review_forum_ice)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect (speed instability)
% @values wobbly_at_speed=Gets_wobbly_unstable_at_higher_speeds unk_negative_aspect=Unknown
% @importance 0.875

0.80::acc(ssp, negative_aspect).
0.78::acc(s52, negative_aspect).

0.90::true_val(negative_aspect, wobbly_at_speed); 0.10::true_val(negative_aspect, unk_negative_aspect).

measured(ssp, negative_aspect, wobbly_at_speed).
measured(s52, negative_aspect, wobbly_at_speed).

all_consistent(negative_aspect) :-
    consistent(ssp, negative_aspect),
    consistent(s52, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, wobbly_at_speed)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_edge_hold
% @type categorical
% @canonical false
% @original_name negative_aspect (edge hold concern)
% @values edge_hold_concern_ice=Concern_about_edge_hold_hardpack_ice_3BT_lifts_edges unk_negative_aspect_edge_hold=Unknown
% @importance 0.83

0.78::acc(s52, negative_aspect_edge_hold).
0.78::acc(s55, negative_aspect_edge_hold).
0.68::acc(s70, negative_aspect_edge_hold).

0.92::true_val(negative_aspect_edge_hold, edge_hold_concern_ice); 0.08::true_val(negative_aspect_edge_hold, unk_negative_aspect_edge_hold).

measured(s52, negative_aspect_edge_hold, edge_hold_concern_ice).
measured(s55, negative_aspect_edge_hold, edge_hold_concern_ice).
measured(s70, negative_aspect_edge_hold, edge_hold_concern_ice).

all_consistent(negative_aspect_edge_hold) :-
    consistent(s52, negative_aspect_edge_hold),
    consistent(s55, negative_aspect_edge_hold),
    consistent(s70, negative_aspect_edge_hold).

evidence(all_consistent(negative_aspect_edge_hold)).
query(true_val(negative_aspect_edge_hold, edge_hold_concern_ice)).
query(true_val(negative_aspect_edge_hold, unk_negative_aspect_edge_hold)).

% @attr negative_aspect_too_soft
% @type categorical
% @canonical false
% @original_name negative_aspect (too soft)
% @values too_soft_heavy_riders=Too_soft_for_heavier_aggressive_riders_tail_washout unk_negative_aspect_too_soft=Unknown
% @importance 0.73

0.68::acc(s56, negative_aspect_too_soft).
0.62::acc(s61, negative_aspect_too_soft).

0.82::true_val(negative_aspect_too_soft, too_soft_heavy_riders); 0.18::true_val(negative_aspect_too_soft, unk_negative_aspect_too_soft).

measured(s56, negative_aspect_too_soft, too_soft_heavy_riders).
measured(s61, negative_aspect_too_soft, too_soft_heavy_riders).

all_consistent(negative_aspect_too_soft) :-
    consistent(s56, negative_aspect_too_soft),
    consistent(s61, negative_aspect_too_soft).

evidence(all_consistent(negative_aspect_too_soft)).
query(true_val(negative_aspect_too_soft, too_soft_heavy_riders)).
query(true_val(negative_aspect_too_soft, unk_negative_aspect_too_soft)).

% @attr user_review_forum_snap
% @type categorical
% @canonical false
% @original_name user_review_forum (board snap)
% @values snapped_15hrs_warranty_denied=Board_snapped_after_15hrs_warranty_denied unk_user_review_forum_snap=Unknown
% @importance 0.80

0.65::acc(s24, user_review_forum_snap).

0.36::true_val(user_review_forum_snap, snapped_15hrs_warranty_denied); 0.64::true_val(user_review_forum_snap, unk_user_review_forum_snap).

measured(s24, user_review_forum_snap, snapped_15hrs_warranty_denied).

all_consistent(user_review_forum_snap) :-
    consistent(s24, user_review_forum_snap).

evidence(all_consistent(user_review_forum_snap)).
query(true_val(user_review_forum_snap, snapped_15hrs_warranty_denied)).
query(true_val(user_review_forum_snap, unk_user_review_forum_snap)).

% @attr user_review_forum_warranty
% @type categorical
% @canonical false
% @original_name user_review_forum (warranty frustration)
% @values frustrating_warranty_process=Some_users_report_frustrating_warranty_claims unk_user_review_forum_warranty=Unknown
% @importance 0.75

0.55::acc(s83, user_review_forum_warranty).

0.25::true_val(user_review_forum_warranty, frustrating_warranty_process); 0.75::true_val(user_review_forum_warranty, unk_user_review_forum_warranty).

measured(s83, user_review_forum_warranty, frustrating_warranty_process).

all_consistent(user_review_forum_warranty) :-
    consistent(s83, user_review_forum_warranty).

evidence(all_consistent(user_review_forum_warranty)).
query(true_val(user_review_forum_warranty, frustrating_warranty_process)).
query(true_val(user_review_forum_warranty, unk_user_review_forum_warranty)).

% @attr negative_aspect_learning_curve
% @type categorical
% @canonical false
% @original_name negative_aspect (learning curve)
% @values feels_different_initially=Takes_getting_used_to_feels_different unk_negative_aspect_learning_curve=Unknown
% @importance 0.65

0.65::acc(s61, negative_aspect_learning_curve).
0.62::acc(s61, negative_aspect_learning_curve).

0.72::true_val(negative_aspect_learning_curve, feels_different_initially); 0.28::true_val(negative_aspect_learning_curve, unk_negative_aspect_learning_curve).

measured(s61, negative_aspect_learning_curve, feels_different_initially).

all_consistent(negative_aspect_learning_curve) :-
    consistent(s61, negative_aspect_learning_curve).

evidence(all_consistent(negative_aspect_learning_curve)).
query(true_val(negative_aspect_learning_curve, feels_different_initially)).
query(true_val(negative_aspect_learning_curve, unk_negative_aspect_learning_curve)).

% @attr negative_aspect_3bt_groomed
% @type categorical
% @canonical false
% @original_name negative_aspect (3BT on groomers)
% @values tbt_better_park_powder_than_hardpack=3BT_works_better_park_powder_than_hard_groomed unk_negative_aspect_3bt_groomed=Unknown
% @importance 0.65

0.65::acc(s61, negative_aspect_3bt_groomed).

0.52::true_val(negative_aspect_3bt_groomed, tbt_better_park_powder_than_hardpack); 0.48::true_val(negative_aspect_3bt_groomed, unk_negative_aspect_3bt_groomed).

measured(s61, negative_aspect_3bt_groomed, tbt_better_park_powder_than_hardpack).

all_consistent(negative_aspect_3bt_groomed) :-
    consistent(s61, negative_aspect_3bt_groomed).

evidence(all_consistent(negative_aspect_3bt_groomed)).
query(true_val(negative_aspect_3bt_groomed, tbt_better_park_powder_than_hardpack)).
query(true_val(negative_aspect_3bt_groomed, unk_negative_aspect_3bt_groomed)).

% @attr negative_aspect_edgeless_firm
% @type categorical
% @canonical false
% @original_name negative_aspect (edgeless in firm snow)
% @values edgeless_washy_firm_snow=Can_feel_edgeless_washy_medium_to_firm_snow unk_negative_aspect_edgeless_firm=Unknown
% @importance 0.85

0.78::acc(s55, negative_aspect_edgeless_firm).

0.64::true_val(negative_aspect_edgeless_firm, edgeless_washy_firm_snow); 0.36::true_val(negative_aspect_edgeless_firm, unk_negative_aspect_edgeless_firm).

measured(s55, negative_aspect_edgeless_firm, edgeless_washy_firm_snow).

all_consistent(negative_aspect_edgeless_firm) :-
    consistent(s55, negative_aspect_edgeless_firm).

evidence(all_consistent(negative_aspect_edgeless_firm)).
query(true_val(negative_aspect_edgeless_firm, edgeless_washy_firm_snow)).
query(true_val(negative_aspect_edgeless_firm, unk_negative_aspect_edgeless_firm)).

% @attr negative_aspect_width_confusion
% @type categorical
% @canonical false
% @original_name negative_aspect (width confusion)
% @values wider_than_average_confusing=Standard_wider_than_average_waist_confuses_buyers unk_negative_aspect_width_confusion=Unknown
% @importance 0.65

0.62::acc(s65, negative_aspect_width_confusion).

0.31::true_val(negative_aspect_width_confusion, wider_than_average_confusing); 0.69::true_val(negative_aspect_width_confusion, unk_negative_aspect_width_confusion).

measured(s65, negative_aspect_width_confusion, wider_than_average_confusing).

all_consistent(negative_aspect_width_confusion) :-
    consistent(s65, negative_aspect_width_confusion).

evidence(all_consistent(negative_aspect_width_confusion)).
query(true_val(negative_aspect_width_confusion, wider_than_average_confusing)).
query(true_val(negative_aspect_width_confusion, unk_negative_aspect_width_confusion)).

% @attr sustainability_certification
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values flip_flop_waste_reduction=Flip_Flop_Base_minimizes_waste_offcuts unk_sustainability_certification=Unknown
% @importance 0.85

0.88::acc(s13, sustainability_certification).
0.82::acc(s29, sustainability_certification).

0.93::true_val(sustainability_certification, flip_flop_waste_reduction); 0.07::true_val(sustainability_certification, unk_sustainability_certification).

measured(s13, sustainability_certification, flip_flop_waste_reduction).
measured(s29, sustainability_certification, flip_flop_waste_reduction).

all_consistent(sustainability_certification) :-
    consistent(s13, sustainability_certification),
    (indep(s29), consistent(s29, sustainability_certification) ; \+indep(s29)).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, flip_flop_waste_reduction)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr insert_quality_detail
% @type categorical
% @canonical false
% @original_name Insert quality
% @values a_grade_stainless_years=A_grade_German_stainless_rated_years_of_use unk_insert_quality_detail=Unknown
% @importance 0.90

0.90::acc(s13, insert_quality_detail).

0.87::true_val(insert_quality_detail, a_grade_stainless_years); 0.13::true_val(insert_quality_detail, unk_insert_quality_detail).

measured(s13, insert_quality_detail, a_grade_stainless_years).

all_consistent(insert_quality_detail) :-
    consistent(s13, insert_quality_detail).

evidence(all_consistent(insert_quality_detail)).
query(true_val(insert_quality_detail, a_grade_stainless_years)).
query(true_val(insert_quality_detail, unk_insert_quality_detail)).

% @attr available_colors
% @type categorical
% @canonical false
% @original_name available_colors
% @values rop_van_mierlo_edition=Rop_van_Mierlo_special_artist_edition_cat_graphics unk_available_colors=Unknown
% @importance 0.35

0.92::acc(s25, available_colors).
0.85::acc(s76, available_colors).

0.95::true_val(available_colors, rop_van_mierlo_edition); 0.05::true_val(available_colors, unk_available_colors).

measured(s25, available_colors, rop_van_mierlo_edition).
measured(s76, available_colors, rop_van_mierlo_edition).

all_consistent(available_colors) :-
    consistent(s25, available_colors),
    (indep(s76), consistent(s76, available_colors) ; \+indep(s76)).

evidence(all_consistent(available_colors)).
query(true_val(available_colors, rop_van_mierlo_edition)).
query(true_val(available_colors, unk_available_colors)).

% @attr design_philosophy
% @type categorical
% @canonical false
% @original_name Design philosophy
% @values non_specific_live_truth=Non_specific_AF_just_live_your_truth unk_design_philosophy=Unknown
% @importance 0.92

0.80::acc(s31, design_philosophy).

0.65::true_val(design_philosophy, non_specific_live_truth); 0.35::true_val(design_philosophy, unk_design_philosophy).

measured(s31, design_philosophy, non_specific_live_truth).

all_consistent(design_philosophy) :-
    consistent(s31, design_philosophy).

evidence(all_consistent(design_philosophy)).
query(true_val(design_philosophy, non_specific_live_truth)).
query(true_val(design_philosophy, unk_design_philosophy)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand (Ride Shadowban)
% @values ride_shadowban=Ride_Shadowban_hybrid_camber_quiver_killer unk_comparable_board_cross_brand=Unknown
% @importance 0.85

0.82::acc(s113, comparable_board_cross_brand).

0.67::true_val(comparable_board_cross_brand, ride_shadowban); 0.33::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s113, comparable_board_cross_brand, ride_shadowban).

all_consistent(comparable_board_cross_brand) :-
    consistent(s113, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, ride_shadowban)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_yes
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (YES Standard/Typo)
% @values yes_standard_typo=YES_Standard_Typo_directional_twin unk_comparable_board_cross_brand_yes=Unknown
% @importance 0.85

0.82::acc(s113, comparable_board_cross_brand_yes).

0.67::true_val(comparable_board_cross_brand_yes, yes_standard_typo); 0.33::true_val(comparable_board_cross_brand_yes, unk_comparable_board_cross_brand_yes).

measured(s113, comparable_board_cross_brand_yes, yes_standard_typo).

all_consistent(comparable_board_cross_brand_yes) :-
    consistent(s113, comparable_board_cross_brand_yes).

evidence(all_consistent(comparable_board_cross_brand_yes)).
query(true_val(comparable_board_cross_brand_yes, yes_standard_typo)).
query(true_val(comparable_board_cross_brand_yes, unk_comparable_board_cross_brand_yes)).

% @attr comparable_board_cross_brand_jones_mt
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Jones Mountain Twin)
% @values jones_mountain_twin=Jones_Mountain_Twin_spoon_tech_3D unk_comparable_board_cross_brand_jones_mt=Unknown
% @importance 0.85

0.80::acc(s113, comparable_board_cross_brand_jones_mt).

0.67::true_val(comparable_board_cross_brand_jones_mt, jones_mountain_twin); 0.33::true_val(comparable_board_cross_brand_jones_mt, unk_comparable_board_cross_brand_jones_mt).

measured(s113, comparable_board_cross_brand_jones_mt, jones_mountain_twin).

all_consistent(comparable_board_cross_brand_jones_mt) :-
    consistent(s113, comparable_board_cross_brand_jones_mt).

evidence(all_consistent(comparable_board_cross_brand_jones_mt)).
query(true_val(comparable_board_cross_brand_jones_mt, jones_mountain_twin)).
query(true_val(comparable_board_cross_brand_jones_mt, unk_comparable_board_cross_brand_jones_mt)).

% @attr comparable_board_cross_brand_jones_fr
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Jones Frontier)
% @values jones_frontier=Jones_Frontier_freeride_directional_twin unk_comparable_board_cross_brand_jones_fr=Unknown
% @importance 0.85

0.82::acc(s113, comparable_board_cross_brand_jones_fr).

0.67::true_val(comparable_board_cross_brand_jones_fr, jones_frontier); 0.33::true_val(comparable_board_cross_brand_jones_fr, unk_comparable_board_cross_brand_jones_fr).

measured(s113, comparable_board_cross_brand_jones_fr, jones_frontier).

all_consistent(comparable_board_cross_brand_jones_fr) :-
    consistent(s113, comparable_board_cross_brand_jones_fr).

evidence(all_consistent(comparable_board_cross_brand_jones_fr)).
query(true_val(comparable_board_cross_brand_jones_fr, jones_frontier)).
query(true_val(comparable_board_cross_brand_jones_fr, unk_comparable_board_cross_brand_jones_fr)).

% @attr comparable_board_cross_brand_algorythm
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Ride Algorythm)
% @values ride_algorythm=Ride_Algorythm_versatile_dampened unk_comparable_board_cross_brand_algorythm=Unknown
% @importance 0.85

0.82::acc(s113, comparable_board_cross_brand_algorythm).

0.67::true_val(comparable_board_cross_brand_algorythm, ride_algorythm); 0.33::true_val(comparable_board_cross_brand_algorythm, unk_comparable_board_cross_brand_algorythm).

measured(s113, comparable_board_cross_brand_algorythm, ride_algorythm).

all_consistent(comparable_board_cross_brand_algorythm) :-
    consistent(s113, comparable_board_cross_brand_algorythm).

evidence(all_consistent(comparable_board_cross_brand_algorythm)).
query(true_val(comparable_board_cross_brand_algorythm, ride_algorythm)).
query(true_val(comparable_board_cross_brand_algorythm, unk_comparable_board_cross_brand_algorythm)).

% @attr comparable_board_cross_brand_highpath
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Salomon Highpath)
% @values salomon_highpath=Salomon_Highpath_all_mountain unk_comparable_board_cross_brand_highpath=Unknown
% @importance 0.85

0.82::acc(s113, comparable_board_cross_brand_highpath).

0.67::true_val(comparable_board_cross_brand_highpath, salomon_highpath); 0.33::true_val(comparable_board_cross_brand_highpath, unk_comparable_board_cross_brand_highpath).

measured(s113, comparable_board_cross_brand_highpath, salomon_highpath).

all_consistent(comparable_board_cross_brand_highpath) :-
    consistent(s113, comparable_board_cross_brand_highpath).

evidence(all_consistent(comparable_board_cross_brand_highpath)).
query(true_val(comparable_board_cross_brand_highpath, salomon_highpath)).
query(true_val(comparable_board_cross_brand_highpath, unk_comparable_board_cross_brand_highpath)).

% @attr comparable_board_cross_brand_manifest
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (K2 Manifest)
% @values k2_manifest=K2_Manifest_directional_twin unk_comparable_board_cross_brand_manifest=Unknown
% @importance 0.85

0.82::acc(s113, comparable_board_cross_brand_manifest).

0.67::true_val(comparable_board_cross_brand_manifest, k2_manifest); 0.33::true_val(comparable_board_cross_brand_manifest, unk_comparable_board_cross_brand_manifest).

measured(s113, comparable_board_cross_brand_manifest, k2_manifest).

all_consistent(comparable_board_cross_brand_manifest) :-
    consistent(s113, comparable_board_cross_brand_manifest).

evidence(all_consistent(comparable_board_cross_brand_manifest)).
query(true_val(comparable_board_cross_brand_manifest, k2_manifest)).
query(true_val(comparable_board_cross_brand_manifest, unk_comparable_board_cross_brand_manifest)).

% @attr comparable_board_cross_brand_otto
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Korua Otto)
% @values korua_otto=Korua_Otto_freestyle_carving unk_comparable_board_cross_brand_otto=Unknown
% @importance 0.85

0.80::acc(s113, comparable_board_cross_brand_otto).

0.67::true_val(comparable_board_cross_brand_otto, korua_otto); 0.33::true_val(comparable_board_cross_brand_otto, unk_comparable_board_cross_brand_otto).

measured(s113, comparable_board_cross_brand_otto, korua_otto).

all_consistent(comparable_board_cross_brand_otto) :-
    consistent(s113, comparable_board_cross_brand_otto).

evidence(all_consistent(comparable_board_cross_brand_otto)).
query(true_val(comparable_board_cross_brand_otto, korua_otto)).
query(true_val(comparable_board_cross_brand_otto, unk_comparable_board_cross_brand_otto)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand (Goliath)
% @values bataleon_goliath=Bataleon_Goliath_stiffer_flex_6 unk_comparable_board_same_brand=Unknown
% @importance 0.92

0.85::acc(s76, comparable_board_same_brand).

0.72::true_val(comparable_board_same_brand, bataleon_goliath); 0.28::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s76, comparable_board_same_brand, bataleon_goliath).

all_consistent(comparable_board_same_brand) :-
    consistent(s76, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, bataleon_goliath)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_goliath_plus
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Goliath+)
% @values bataleon_goliath_plus=Bataleon_Goliath_Plus_premium unk_comparable_board_same_brand_goliath_plus=Unknown
% @importance 0.92

0.85::acc(s76, comparable_board_same_brand_goliath_plus).

0.72::true_val(comparable_board_same_brand_goliath_plus, bataleon_goliath_plus); 0.28::true_val(comparable_board_same_brand_goliath_plus, unk_comparable_board_same_brand_goliath_plus).

measured(s76, comparable_board_same_brand_goliath_plus, bataleon_goliath_plus).

all_consistent(comparable_board_same_brand_goliath_plus) :-
    consistent(s76, comparable_board_same_brand_goliath_plus).

evidence(all_consistent(comparable_board_same_brand_goliath_plus)).
query(true_val(comparable_board_same_brand_goliath_plus, bataleon_goliath_plus)).
query(true_val(comparable_board_same_brand_goliath_plus, unk_comparable_board_same_brand_goliath_plus)).

% @attr comparable_board_same_brand_funkink
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Fun.Kink)
% @values bataleon_funkink=Bataleon_Fun_Kink_budget_soft unk_comparable_board_same_brand_funkink=Unknown
% @importance 0.85

0.78::acc(s55, comparable_board_same_brand_funkink).

0.64::true_val(comparable_board_same_brand_funkink, bataleon_funkink); 0.36::true_val(comparable_board_same_brand_funkink, unk_comparable_board_same_brand_funkink).

measured(s55, comparable_board_same_brand_funkink, bataleon_funkink).

all_consistent(comparable_board_same_brand_funkink) :-
    consistent(s55, comparable_board_same_brand_funkink).

evidence(all_consistent(comparable_board_same_brand_funkink)).
query(true_val(comparable_board_same_brand_funkink, bataleon_funkink)).
query(true_val(comparable_board_same_brand_funkink, unk_comparable_board_same_brand_funkink)).

% @attr brand_reputation
% @type categorical
% @canonical false
% @original_name Brand reputation
% @values led_3d_tech_20yrs=Led_industry_3D_tech_20_plus_years_patented_3BT unk_brand_reputation=Unknown
% @importance 0.45

0.82::acc(s42, brand_reputation).

0.77::true_val(brand_reputation, led_3d_tech_20yrs); 0.23::true_val(brand_reputation, unk_brand_reputation).

measured(s42, brand_reputation, led_3d_tech_20yrs).

all_consistent(brand_reputation) :-
    consistent(s42, brand_reputation).

evidence(all_consistent(brand_reputation)).
query(true_val(brand_reputation, led_3d_tech_20yrs)).
query(true_val(brand_reputation, unk_brand_reputation)).

% @attr nidecker_group_brands
% @type categorical
% @canonical false
% @original_name Nidecker Group brands
% @values full_brand_portfolio=Bataleon_Emerica_eS_Etnies_Jones_Nidecker_Rome_ThirtyTwo_YES unk_nidecker_group_brands=Unknown
% @importance 0.45

0.92::acc(s49, nidecker_group_brands).

0.87::true_val(nidecker_group_brands, full_brand_portfolio); 0.13::true_val(nidecker_group_brands, unk_nidecker_group_brands).

measured(s49, nidecker_group_brands, full_brand_portfolio).

all_consistent(nidecker_group_brands) :-
    consistent(s49, nidecker_group_brands).

evidence(all_consistent(nidecker_group_brands)).
query(true_val(nidecker_group_brands, full_brand_portfolio)).
query(true_val(nidecker_group_brands, unk_nidecker_group_brands)).

% @attr reviewer_opinion_whitelines_brand
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines (brand)
% @values never_plays_safe=Bataleon_never_plays_it_safe unk_reviewer_opinion_whitelines_brand=Unknown
% @importance 0.85

0.82::acc(s12, reviewer_opinion_whitelines_brand).

0.77::true_val(reviewer_opinion_whitelines_brand, never_plays_safe); 0.23::true_val(reviewer_opinion_whitelines_brand, unk_reviewer_opinion_whitelines_brand).

measured(s12, reviewer_opinion_whitelines_brand, never_plays_safe).

all_consistent(reviewer_opinion_whitelines_brand) :-
    consistent(s12, reviewer_opinion_whitelines_brand).

evidence(all_consistent(reviewer_opinion_whitelines_brand)).
query(true_val(reviewer_opinion_whitelines_brand, never_plays_safe)).
query(true_val(reviewer_opinion_whitelines_brand, unk_reviewer_opinion_whitelines_brand)).

% @attr user_review_forum_innovation
% @type categorical
% @canonical false
% @original_name user_review_forum (innovation respect)
% @values respected_innovation_edge_concern=Respected_for_innovation_some_edge_hold_concern unk_user_review_forum_innovation=Unknown
% @importance 0.75

0.65::acc(s70, user_review_forum_innovation).

0.29::true_val(user_review_forum_innovation, respected_innovation_edge_concern); 0.71::true_val(user_review_forum_innovation, unk_user_review_forum_innovation).

measured(s70, user_review_forum_innovation, respected_innovation_edge_concern).

all_consistent(user_review_forum_innovation) :-
    consistent(s70, user_review_forum_innovation).

evidence(all_consistent(user_review_forum_innovation)).
query(true_val(user_review_forum_innovation, respected_innovation_edge_concern)).
query(true_val(user_review_forum_innovation, unk_user_review_forum_innovation)).

% @attr evo_reputation
% @type categorical
% @canonical false
% @original_name evo.com reputation
% @values major_us_price_match_1yr_return=Major_US_specialty_retailer_price_match_1yr_return unk_evo_reputation=Unknown
% @importance 0.65

0.82::acc(s97, evo_reputation).

0.74::true_val(evo_reputation, major_us_price_match_1yr_return); 0.26::true_val(evo_reputation, unk_evo_reputation).

measured(s97, evo_reputation, major_us_price_match_1yr_return).

all_consistent(evo_reputation) :-
    consistent(s97, evo_reputation).

evidence(all_consistent(evo_reputation)).
query(true_val(evo_reputation, major_us_price_match_1yr_return)).
query(true_val(evo_reputation, unk_evo_reputation)).

% @attr s2as_reputation
% @type categorical
% @canonical false
% @original_name S2AS reputation
% @values uk_authorised_price_match=UK_authorised_retailer_price_match_specialist unk_s2as_reputation=Unknown
% @importance 0.92

0.80::acc(s31, s2as_reputation).

0.65::true_val(s2as_reputation, uk_authorised_price_match); 0.35::true_val(s2as_reputation, unk_s2as_reputation).

measured(s31, s2as_reputation, uk_authorised_price_match).

all_consistent(s2as_reputation) :-
    consistent(s31, s2as_reputation).

evidence(all_consistent(s2as_reputation)).
query(true_val(s2as_reputation, uk_authorised_price_match)).
query(true_val(s2as_reputation, unk_s2as_reputation)).

% @attr twelve_board_store_reputation
% @type categorical
% @canonical false
% @original_name Twelve Board Store reputation
% @values melbourne_authorised_price_match=Melbourne_authorised_Bataleon_dealer_price_match unk_twelve_board_store_reputation=Unknown
% @importance 0.70

0.72::acc(s39, twelve_board_store_reputation).

0.60::true_val(twelve_board_store_reputation, melbourne_authorised_price_match); 0.40::true_val(twelve_board_store_reputation, unk_twelve_board_store_reputation).

measured(s39, twelve_board_store_reputation, melbourne_authorised_price_match).

all_consistent(twelve_board_store_reputation) :-
    consistent(s39, twelve_board_store_reputation).

evidence(all_consistent(twelve_board_store_reputation)).
query(true_val(twelve_board_store_reputation, melbourne_authorised_price_match)).
query(true_val(twelve_board_store_reputation, unk_twelve_board_store_reputation)).

% @attr blauer_board_shop_reputation
% @type categorical
% @canonical false
% @original_name Blauer Board Shop reputation
% @values supports_objective_reviews=Recommended_supporting_independent_objective_reviews unk_blauer_board_shop_reputation=Unknown
% @importance 0.85

0.78::acc(s55, blauer_board_shop_reputation).

0.64::true_val(blauer_board_shop_reputation, supports_objective_reviews); 0.36::true_val(blauer_board_shop_reputation, unk_blauer_board_shop_reputation).

measured(s55, blauer_board_shop_reputation, supports_objective_reviews).

all_consistent(blauer_board_shop_reputation) :-
    consistent(s55, blauer_board_shop_reputation).

evidence(all_consistent(blauer_board_shop_reputation)).
query(true_val(blauer_board_shop_reputation, supports_objective_reviews)).
query(true_val(blauer_board_shop_reputation, unk_blauer_board_shop_reputation)).

% @attr board_weight_grams
% @type numeric
% @canonical true
% @original_name board_weight_grams
% @unit grams
% @values v2940=2940.0 unk_board_weight_grams=Unknown
% @importance 0.90

0.88::acc(ssp, board_weight_grams).

0.68::true_val(board_weight_grams, v2940); 0.32::true_val(board_weight_grams, unk_board_weight_grams).

measured(ssp, board_weight_grams, v2940).

all_consistent(board_weight_grams) :-
    consistent(ssp, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v2940)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr weight_per_cm
% @type numeric
% @canonical true
% @original_name weight_per_cm
% @unit grams/cm
% @values v18_73=18.73 unk_weight_per_cm=Unknown
% @importance 0.90

0.88::acc(ssp, weight_per_cm).

0.68::true_val(weight_per_cm, v18_73); 0.32::true_val(weight_per_cm, unk_weight_per_cm).

measured(ssp, weight_per_cm, v18_73).

all_consistent(weight_per_cm) :-
    consistent(ssp, weight_per_cm).

evidence(all_consistent(weight_per_cm)).
query(true_val(weight_per_cm, v18_73)).
query(true_val(weight_per_cm, unk_weight_per_cm)).

% @attr weight_per_cm_avg
% @type numeric
% @canonical false
% @original_name weight_per_cm (average baseline)
% @unit grams/cm
% @values v18_43=18.43 unk_weight_per_cm_avg=Unknown
% @importance 0.90

0.85::acc(ssp, weight_per_cm_avg).

0.68::true_val(weight_per_cm_avg, v18_43); 0.32::true_val(weight_per_cm_avg, unk_weight_per_cm_avg).

measured(ssp, weight_per_cm_avg, v18_43).

all_consistent(weight_per_cm_avg) :-
    consistent(ssp, weight_per_cm_avg).

evidence(all_consistent(weight_per_cm_avg)).
query(true_val(weight_per_cm_avg, v18_43)).
query(true_val(weight_per_cm_avg, unk_weight_per_cm_avg)).

% @attr weight_assessment
% @type categorical
% @canonical false
% @original_name Weight assessment
% @values slightly_above_avg_felt_light=Slightly_above_average_weight_felt_light_on_snow unk_weight_assessment=Unknown
% @importance 0.90

0.82::acc(ssp, weight_assessment).

0.68::true_val(weight_assessment, slightly_above_avg_felt_light); 0.32::true_val(weight_assessment, unk_weight_assessment).

measured(ssp, weight_assessment, slightly_above_avg_felt_light).

all_consistent(weight_assessment) :-
    consistent(ssp, weight_assessment).

evidence(all_consistent(weight_assessment)).
query(true_val(weight_assessment, slightly_above_avg_felt_light)).
query(true_val(weight_assessment, unk_weight_assessment)).