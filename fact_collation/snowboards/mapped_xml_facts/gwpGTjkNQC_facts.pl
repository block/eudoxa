0.15::indep(s_merchant).
0.25::indep(s4).
0.15::indep(s8).
0.15::indep(s10).
0.25::indep(s14).
0.20::indep(s15).
0.20::indep(s16).
0.15::indep(s20).
0.15::indep(s21).
0.15::indep(s22).
0.15::indep(s23).
0.15::indep(s24).
0.15::indep(s26).
0.15::indep(s29).
0.25::indep(s30).
0.40::indep(s36).
0.15::indep(s40).
0.15::indep(s41).
0.15::indep(s42).
0.20::indep(s45).
0.40::indep(s49).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values gnu_snowboards=GNU_Snowboards unk_brand=Unknown
% @importance 1.0

0.95::acc(s1, brand).

0.95::true_val(brand, gnu_snowboards); 0.05::true_val(brand, unk_brand).

measured(s1, brand, gnu_snowboards).

all_consistent(brand) :- consistent(s1, brand).

evidence(all_consistent(brand)).
query(true_val(brand, gnu_snowboards)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values head_space=Head_Space unk_model_name=Unknown
% @importance 1.0

0.95::acc(s1, model_name).

0.95::true_val(model_name, head_space); 0.05::true_val(model_name, unk_model_name).

measured(s1, model_name, head_space).

all_consistent(model_name) :- consistent(s1, model_name).

evidence(all_consistent(model_name)).
query(true_val(model_name, head_space)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values season_2024_25=2025_(2024-2025_season) unk_model_year=Unknown
% @importance 0.7

0.90::acc(s2, model_year).

0.85::true_val(model_year, season_2024_25); 0.15::true_val(model_year, unk_model_year).

measured(s2, model_year, season_2024_25).

all_consistent(model_year) :- consistent(s2, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, season_2024_25)).
query(true_val(model_year, unk_model_year)).

% @attr product_type
% @type categorical
% @canonical true
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
% @canonical true
% @original_name board_category
% @values freestyle_park=Freestyle_Park unk_board_category=Unknown
% @importance 1.0

0.95::acc(s1, board_category).

0.95::true_val(board_category, freestyle_park); 0.05::true_val(board_category, unk_board_category).

measured(s1, board_category, freestyle_park).

all_consistent(board_category) :- consistent(s1, board_category).

evidence(all_consistent(board_category)).
query(true_val(board_category, freestyle_park)).
query(true_val(board_category, unk_board_category)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values forest_bailey=Forest_Bailey unk_pro_rider_name=Unknown
% @importance 0.5

0.95::acc(s3, pro_rider_name).
0.80::acc(s4, pro_rider_name).

0.95::true_val(pro_rider_name, forest_bailey); 0.05::true_val(pro_rider_name, unk_pro_rider_name).

measured(s3, pro_rider_name, forest_bailey).
measured(s4, pro_rider_name, forest_bailey).

all_consistent(pro_rider_name) :-
    consistent(s3, pro_rider_name),
    (indep(s4), consistent(s4, pro_rider_name) ; \+indep(s4)).

evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, forest_bailey)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values mervin_manufacturing=Mervin_Manufacturing unk_manufacturer=Unknown
% @importance 0.7

0.85::acc(s5, manufacturer).

0.80::true_val(manufacturer, mervin_manufacturing); 0.20::true_val(manufacturer, unk_manufacturer).

measured(s5, manufacturer, mervin_manufacturing).

all_consistent(manufacturer) :- consistent(s5, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, mervin_manufacturing)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr parent_company_brands
% @type categorical
% @canonical false
% @original_name Parent company brands
% @values lib_tech_gnu_roxy_bent_metal=Lib_Tech_GNU_Roxy_Bent_Metal unk_parent_company_brands=Unknown
% @importance 0.7

0.85::acc(s5, parent_company_brands).

0.80::true_val(parent_company_brands, lib_tech_gnu_roxy_bent_metal); 0.20::true_val(parent_company_brands, unk_parent_company_brands).

measured(s5, parent_company_brands, lib_tech_gnu_roxy_bent_metal).

all_consistent(parent_company_brands) :- consistent(s5, parent_company_brands).

evidence(all_consistent(parent_company_brands)).
query(true_val(parent_company_brands, lib_tech_gnu_roxy_bent_metal)).
query(true_val(parent_company_brands, unk_parent_company_brands)).

% @attr mervin_founders
% @type categorical
% @canonical false
% @original_name Mervin founders
% @values olson_saari_1977=Mike_Olson_Pete_Saari_1977 unk_mervin_founders=Unknown
% @importance 0.4

0.90::acc(s6, mervin_founders).

0.88::true_val(mervin_founders, olson_saari_1977); 0.12::true_val(mervin_founders, unk_mervin_founders).

measured(s6, mervin_founders, olson_saari_1977).

all_consistent(mervin_founders) :- consistent(s6, mervin_founders).

evidence(all_consistent(mervin_founders)).
query(true_val(mervin_founders, olson_saari_1977)).
query(true_val(mervin_founders, unk_mervin_founders)).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values sequim_wa_usa=Sequim_Washington_USA unk_manufacturing_location=Unknown
% @importance 0.6

0.85::acc(s7, manufacturing_location).
0.75::acc(s8, manufacturing_location).

0.95::true_val(manufacturing_location, sequim_wa_usa); 0.05::true_val(manufacturing_location, unk_manufacturing_location).

measured(s7, manufacturing_location, sequim_wa_usa).
measured(s8, manufacturing_location, sequim_wa_usa).

all_consistent(manufacturing_location) :-
    consistent(s7, manufacturing_location),
    (indep(s8), consistent(s8, manufacturing_location) ; \+indep(s8)).

evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, sequim_wa_usa)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

% @attr manufacturing_claim
% @type categorical
% @canonical false
% @original_name Manufacturing claim
% @values last_major_usa_factory=Last_major_board_factory_in_USA unk_manufacturing_claim=Unknown
% @importance 0.5

0.75::acc(s9, manufacturing_claim).

0.70::true_val(manufacturing_claim, last_major_usa_factory); 0.30::true_val(manufacturing_claim, unk_manufacturing_claim).

measured(s9, manufacturing_claim, last_major_usa_factory).

all_consistent(manufacturing_claim) :- consistent(s9, manufacturing_claim).

evidence(all_consistent(manufacturing_claim)).
query(true_val(manufacturing_claim, last_major_usa_factory)).
query(true_val(manufacturing_claim, unk_manufacturing_claim)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values zero_waste_eco_fsc=Zero_hazardous_waste_eco_materials_FSC_certified unk_sustainability_certification=Unknown
% @importance 0.5

0.80::acc(s10, sustainability_certification).

0.78::true_val(sustainability_certification, zero_waste_eco_fsc); 0.22::true_val(sustainability_certification, unk_sustainability_certification).

measured(s10, sustainability_certification, zero_waste_eco_fsc).

all_consistent(sustainability_certification) :-
    (indep(s10), consistent(s10, sustainability_certification) ; \+indep(s10)).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, zero_waste_eco_fsc)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values y2016=2016 unk_model_first_available_year=Unknown
% @importance 0.85

0.82::acc(s11, model_first_available_year).

0.75::true_val(model_first_available_year, y2016); 0.25::true_val(model_first_available_year, unk_model_first_available_year).

measured(s11, model_first_available_year, y2016).

all_consistent(model_first_available_year) :- consistent(s11, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2016)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr redesign_year
% @type categorical
% @canonical true
% @original_name redesign_year
% @values y2024=2024_true_twin_redesign unk_redesign_year=Unknown
% @importance 0.85

0.85::acc(s12, redesign_year).

0.80::true_val(redesign_year, y2024); 0.20::true_val(redesign_year, unk_redesign_year).

measured(s12, redesign_year, y2024).

all_consistent(redesign_year) :- consistent(s12, redesign_year).

evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, y2024)).
query(true_val(redesign_year, unk_redesign_year)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v579_99=579.99 unk_price_usd_msrp=Unknown
% @importance 0.95

0.95::acc(s13, price_usd_msrp).

0.95::true_val(price_usd_msrp, v579_99); 0.05::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s13, price_usd_msrp, v579_99).

all_consistent(price_usd_msrp) :- consistent(s13, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v579_99)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr gnu_direct_sale_price
% @type numeric
% @canonical false
% @original_name GNU direct sale price (USD)
% @unit USD
% @values v417_59=417.59 unk_gnu_direct_sale_price=Unknown
% @importance 0.95

0.93::acc(s13, gnu_direct_sale_price).

0.93::true_val(gnu_direct_sale_price, v417_59); 0.07::true_val(gnu_direct_sale_price, unk_gnu_direct_sale_price).

measured(s13, gnu_direct_sale_price, v417_59).

all_consistent(gnu_direct_sale_price) :- consistent(s13, gnu_direct_sale_price).

evidence(all_consistent(gnu_direct_sale_price)).
query(true_val(gnu_direct_sale_price, v417_59)).
query(true_val(gnu_direct_sale_price, unk_gnu_direct_sale_price)).

% @attr price_usd_evo
% @type numeric
% @canonical true
% @original_name price_usd_evo
% @unit USD
% @values v405_99=405.99 unk_price_usd_evo=Unknown
% @importance 0.9

0.88::acc(s14, price_usd_evo).

0.85::true_val(price_usd_evo, v405_99); 0.15::true_val(price_usd_evo, unk_price_usd_evo).

measured(s14, price_usd_evo, v405_99).

all_consistent(price_usd_evo) :- consistent(s14, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v405_99)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_eastern_boarder
% @type numeric
% @canonical false
% @original_name Price at Eastern Boarder (USD)
% @unit USD
% @values v579_95=579.95 unk_price_eastern_boarder=Unknown
% @importance 0.7

0.82::acc(s15, price_eastern_boarder).

0.78::true_val(price_eastern_boarder, v579_95); 0.22::true_val(price_eastern_boarder, unk_price_eastern_boarder).

measured(s15, price_eastern_boarder, v579_95).

all_consistent(price_eastern_boarder) :- consistent(s15, price_eastern_boarder).

evidence(all_consistent(price_eastern_boarder)).
query(true_val(price_eastern_boarder, v579_95)).
query(true_val(price_eastern_boarder, unk_price_eastern_boarder)).

% @attr price_philbricks
% @type numeric
% @canonical false
% @original_name Price at Philbrick's (USD)
% @unit USD
% @values v405_97=405.97 unk_price_philbricks=Unknown
% @importance 0.7

0.75::acc(s16, price_philbricks).

0.70::true_val(price_philbricks, v405_97); 0.30::true_val(price_philbricks, unk_price_philbricks).

measured(s16, price_philbricks, v405_97).

all_consistent(price_philbricks) :- consistent(s16, price_philbricks).

evidence(all_consistent(price_philbricks)).
query(true_val(price_philbricks, v405_97)).
query(true_val(price_philbricks, unk_price_philbricks)).

% @attr price_usd_backcountry
% @type numeric
% @canonical true
% @original_name price_usd_backcountry
% @unit USD
% @values v492_99=492.99 unk_price_usd_backcountry=Unknown
% @importance 0.85

0.78::acc(s17, price_usd_backcountry).

0.75::true_val(price_usd_backcountry, v492_99); 0.25::true_val(price_usd_backcountry, unk_price_usd_backcountry).

measured(s17, price_usd_backcountry, v492_99).

all_consistent(price_usd_backcountry) :- consistent(s17, price_usd_backcountry).

evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v492_99)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

% @attr price_sun_ski
% @type numeric
% @canonical false
% @original_name Price at Sun & Ski Sports (USD)
% @unit USD
% @values v405_83=405.83 unk_price_sun_ski=Unknown
% @importance 0.85

0.75::acc(s17, price_sun_ski).

0.72::true_val(price_sun_ski, v405_83); 0.28::true_val(price_sun_ski, unk_price_sun_ski).

measured(s17, price_sun_ski, v405_83).

all_consistent(price_sun_ski) :- consistent(s17, price_sun_ski).

evidence(all_consistent(price_sun_ski)).
query(true_val(price_sun_ski, v405_83)).
query(true_val(price_sun_ski, unk_price_sun_ski)).

% @attr price_aud_merchant
% @type numeric
% @canonical true
% @original_name price_aud_merchant
% @unit AUD
% @values v678_99=678.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.93::acc(s_merchant, price_aud_merchant).

0.93::true_val(price_aud_merchant, v678_99); 0.07::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s_merchant, price_aud_merchant, v678_99).

all_consistent(price_aud_merchant) :- consistent(s_merchant, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v678_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_comparison_bow
% @type categorical
% @canonical false
% @original_name Price comparison (Board of the World)
% @values four_less_than_avg=Approx_4_less_than_average_468 unk_price_comparison_bow=Unknown
% @importance 0.75

0.78::acc(s18, price_comparison_bow).

0.72::true_val(price_comparison_bow, four_less_than_avg); 0.28::true_val(price_comparison_bow, unk_price_comparison_bow).

measured(s18, price_comparison_bow, four_less_than_avg).

all_consistent(price_comparison_bow) :- consistent(s18, price_comparison_bow).

evidence(all_consistent(price_comparison_bow)).
query(true_val(price_comparison_bow, four_less_than_avg)).
query(true_val(price_comparison_bow, unk_price_comparison_bow)).

% @attr b_grade_available
% @type categorical
% @canonical false
% @original_name B-grade boards available
% @values yes_cosmetic_discount=Yes_cosmetic_defect_discount unk_b_grade_available=Unknown
% @importance 0.5

0.85::acc(s19, b_grade_available).

0.80::true_val(b_grade_available, yes_cosmetic_discount); 0.20::true_val(b_grade_available, unk_b_grade_available).

measured(s19, b_grade_available, yes_cosmetic_discount).

all_consistent(b_grade_available) :- consistent(s19, b_grade_available).

evidence(all_consistent(b_grade_available)).
query(true_val(b_grade_available, yes_cosmetic_discount)).
query(true_val(b_grade_available, unk_b_grade_available)).

% @attr seller_gnu
% @type categorical
% @canonical false
% @original_name Seller gnu.com
% @values in_stock_free_ship=In_stock_free_shipping_over_75 unk_seller_gnu=Unknown
% @importance 0.95

0.93::acc(s13, seller_gnu).

0.93::true_val(seller_gnu, in_stock_free_ship); 0.07::true_val(seller_gnu, unk_seller_gnu).

measured(s13, seller_gnu, in_stock_free_ship).

all_consistent(seller_gnu) :- consistent(s13, seller_gnu).

evidence(all_consistent(seller_gnu)).
query(true_val(seller_gnu, in_stock_free_ship)).
query(true_val(seller_gnu, unk_seller_gnu)).

% @attr seller_evo
% @type categorical
% @canonical false
% @original_name Seller evo.com
% @values available_price_match=Available_price_match_guarantee unk_seller_evo=Unknown
% @importance 0.9

0.85::acc(s14, seller_evo).

0.85::true_val(seller_evo, available_price_match); 0.15::true_val(seller_evo, unk_seller_evo).

measured(s14, seller_evo, available_price_match).

all_consistent(seller_evo) :- consistent(s14, seller_evo).

evidence(all_consistent(seller_evo)).
query(true_val(seller_evo, available_price_match)).
query(true_val(seller_evo, unk_seller_evo)).

% @attr seller_tactics
% @type categorical
% @canonical false
% @original_name Seller Tactics.com
% @values available_free_ship_150=Available_free_shipping_over_150 unk_seller_tactics=Unknown
% @importance 0.65

0.82::acc(s20, seller_tactics).

0.80::true_val(seller_tactics, available_free_ship_150); 0.20::true_val(seller_tactics, unk_seller_tactics).

measured(s20, seller_tactics, available_free_ship_150).

all_consistent(seller_tactics) :- consistent(s20, seller_tactics).

evidence(all_consistent(seller_tactics)).
query(true_val(seller_tactics, available_free_ship_150)).
query(true_val(seller_tactics, unk_seller_tactics)).

% @attr seller_backcountry
% @type categorical
% @canonical false
% @original_name Seller Backcountry.com
% @values available=Available unk_seller_backcountry=Unknown
% @importance 0.85

0.78::acc(s17, seller_backcountry).

0.75::true_val(seller_backcountry, available); 0.25::true_val(seller_backcountry, unk_seller_backcountry).

measured(s17, seller_backcountry, available).

all_consistent(seller_backcountry) :- consistent(s17, seller_backcountry).

evidence(all_consistent(seller_backcountry)).
query(true_val(seller_backcountry, available)).
query(true_val(seller_backcountry, unk_seller_backcountry)).

% @attr seller_eastern_boarder
% @type categorical
% @canonical false
% @original_name Seller Eastern Boarder
% @values available=Available unk_seller_eastern_boarder=Unknown
% @importance 0.7

0.78::acc(s15, seller_eastern_boarder).

0.75::true_val(seller_eastern_boarder, available); 0.25::true_val(seller_eastern_boarder, unk_seller_eastern_boarder).

measured(s15, seller_eastern_boarder, available).

all_consistent(seller_eastern_boarder) :- consistent(s15, seller_eastern_boarder).

evidence(all_consistent(seller_eastern_boarder)).
query(true_val(seller_eastern_boarder, available)).
query(true_val(seller_eastern_boarder, unk_seller_eastern_boarder)).

% @attr seller_philbricks
% @type categorical
% @canonical false
% @original_name Seller Philbrick's
% @values available=Available unk_seller_philbricks=Unknown
% @importance 0.7

0.72::acc(s16, seller_philbricks).

0.70::true_val(seller_philbricks, available); 0.30::true_val(seller_philbricks, unk_seller_philbricks).

measured(s16, seller_philbricks, available).

all_consistent(seller_philbricks) :- consistent(s16, seller_philbricks).

evidence(all_consistent(seller_philbricks)).
query(true_val(seller_philbricks, available)).
query(true_val(seller_philbricks, unk_seller_philbricks)).

% @attr seller_corbetts
% @type categorical
% @canonical false
% @original_name Seller Corbetts
% @values available_free_ship_100=Available_free_shipping_over_100 unk_seller_corbetts=Unknown
% @importance 0.5

0.72::acc(s21, seller_corbetts).

0.68::true_val(seller_corbetts, available_free_ship_100); 0.32::true_val(seller_corbetts, unk_seller_corbetts).

measured(s21, seller_corbetts, available_free_ship_100).

all_consistent(seller_corbetts) :- consistent(s21, seller_corbetts).

evidence(all_consistent(seller_corbetts)).
query(true_val(seller_corbetts, available_free_ship_100)).
query(true_val(seller_corbetts, unk_seller_corbetts)).

% @attr seller_gear_west
% @type categorical
% @canonical false
% @original_name Seller Gear West
% @values available_ups_usps=Available_ships_UPS_USPS unk_seller_gear_west=Unknown
% @importance 0.5

0.68::acc(s22, seller_gear_west).

0.65::true_val(seller_gear_west, available_ups_usps); 0.35::true_val(seller_gear_west, unk_seller_gear_west).

measured(s22, seller_gear_west, available_ups_usps).

all_consistent(seller_gear_west) :- consistent(s22, seller_gear_west).

evidence(all_consistent(seller_gear_west)).
query(true_val(seller_gear_west, available_ups_usps)).
query(true_val(seller_gear_west, unk_seller_gear_west)).

% @attr seller_the_house
% @type categorical
% @canonical false
% @original_name Seller The House
% @values available=Available unk_seller_the_house=Unknown
% @importance 0.5

0.72::acc(s23, seller_the_house).

0.70::true_val(seller_the_house, available); 0.30::true_val(seller_the_house, unk_seller_the_house).

measured(s23, seller_the_house, available).

all_consistent(seller_the_house) :- consistent(s23, seller_the_house).

evidence(all_consistent(seller_the_house)).
query(true_val(seller_the_house, available)).
query(true_val(seller_the_house, unk_seller_the_house)).

% @attr seller_aspen_ski
% @type categorical
% @canonical false
% @original_name Seller Aspen Ski and Board
% @values backordered_some_sizes=Backordered_some_sizes unk_seller_aspen_ski=Unknown
% @importance 0.6

0.70::acc(s24, seller_aspen_ski).

0.68::true_val(seller_aspen_ski, backordered_some_sizes); 0.32::true_val(seller_aspen_ski, unk_seller_aspen_ski).

measured(s24, seller_aspen_ski, backordered_some_sizes).

all_consistent(seller_aspen_ski) :- consistent(s24, seller_aspen_ski).

evidence(all_consistent(seller_aspen_ski)).
query(true_val(seller_aspen_ski, backordered_some_sizes)).
query(true_val(seller_aspen_ski, unk_seller_aspen_ski)).

% @attr seller_melbourne_au
% @type categorical
% @canonical false
% @original_name Seller Melbourne Snowboard Centre (AU)
% @values available=Available unk_seller_melbourne_au=Unknown
% @importance 0.85

0.85::acc(s_merchant, seller_melbourne_au).

0.85::true_val(seller_melbourne_au, available); 0.15::true_val(seller_melbourne_au, unk_seller_melbourne_au).

measured(s_merchant, seller_melbourne_au, available).

all_consistent(seller_melbourne_au) :- consistent(s_merchant, seller_melbourne_au).

evidence(all_consistent(seller_melbourne_au)).
query(true_val(seller_melbourne_au, available)).
query(true_val(seller_melbourne_au, unk_seller_melbourne_au)).

% @attr seller_snowcountry_eu
% @type categorical
% @canonical false
% @original_name Seller snowcountry.eu
% @values available=Available unk_seller_snowcountry_eu=Unknown
% @importance 0.5

0.65::acc(s26, seller_snowcountry_eu).

0.60::true_val(seller_snowcountry_eu, available); 0.40::true_val(seller_snowcountry_eu, unk_seller_snowcountry_eu).

measured(s26, seller_snowcountry_eu, available).

all_consistent(seller_snowcountry_eu) :- consistent(s26, seller_snowcountry_eu).

evidence(all_consistent(seller_snowcountry_eu)).
query(true_val(seller_snowcountry_eu, available)).
query(true_val(seller_snowcountry_eu, unk_seller_snowcountry_eu)).

% @attr seller_ebay_warning
% @type categorical
% @canonical false
% @original_name Seller eBay WARNING
% @values voids_warranty=Purchasing_voids_manufacturer_warranty unk_seller_ebay_warning=Unknown
% @importance 0.8

0.93::acc(s27, seller_ebay_warning).

0.93::true_val(seller_ebay_warning, voids_warranty); 0.07::true_val(seller_ebay_warning, unk_seller_ebay_warning).

measured(s27, seller_ebay_warning, voids_warranty).

all_consistent(seller_ebay_warning) :- consistent(s27, seller_ebay_warning).

evidence(all_consistent(seller_ebay_warning)).
query(true_val(seller_ebay_warning, voids_warranty)).
query(true_val(seller_ebay_warning, unk_seller_ebay_warning)).

% @attr warranty_period_years
% @type numeric
% @canonical true
% @original_name warranty_period_years
% @unit years
% @values v1=1.0 unk_warranty_period_years=Unknown
% @importance 0.85

0.95::acc(s28, warranty_period_years).

0.95::true_val(warranty_period_years, v1); 0.05::true_val(warranty_period_years, unk_warranty_period_years).

measured(s28, warranty_period_years, v1).

all_consistent(warranty_period_years) :- consistent(s28, warranty_period_years).

evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v1)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values mfg_defects_materials_workmanship=Manufacturer_defects_materials_workmanship unk_warranty=Unknown
% @importance 0.85

0.95::acc(s28, warranty).

0.95::true_val(warranty, mfg_defects_materials_workmanship); 0.05::true_val(warranty, unk_warranty).

measured(s28, warranty, mfg_defects_materials_workmanship).

all_consistent(warranty) :- consistent(s28, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, mfg_defects_materials_workmanship)).
query(true_val(warranty, unk_warranty)).

% @attr warranty_exclusions
% @type categorical
% @canonical false
% @original_name warranty exclusions
% @values no_wear_impact_abuse=Does_not_cover_wear_impact_abuse_cosmetic unk_warranty_exclusions=Unknown
% @importance 0.825

0.95::acc(s28, warranty_exclusions).
0.78::acc(s29, warranty_exclusions).

0.95::true_val(warranty_exclusions, no_wear_impact_abuse); 0.05::true_val(warranty_exclusions, unk_warranty_exclusions).

measured(s28, warranty_exclusions, no_wear_impact_abuse).
measured(s29, warranty_exclusions, no_wear_impact_abuse).

all_consistent(warranty_exclusions) :-
    consistent(s28, warranty_exclusions),
    (indep(s29), consistent(s29, warranty_exclusions) ; \+indep(s29)).

evidence(all_consistent(warranty_exclusions)).
query(true_val(warranty_exclusions, no_wear_impact_abuse)).
query(true_val(warranty_exclusions, unk_warranty_exclusions)).

% @attr warranty_authorized_dealer
% @type categorical
% @canonical false
% @original_name warranty authorized dealer requirement
% @values must_be_authorized=Must_purchase_from_authorized_dealer unk_warranty_authorized_dealer=Unknown
% @importance 0.85

0.95::acc(s28, warranty_authorized_dealer).

0.95::true_val(warranty_authorized_dealer, must_be_authorized); 0.05::true_val(warranty_authorized_dealer, unk_warranty_authorized_dealer).

measured(s28, warranty_authorized_dealer, must_be_authorized).

all_consistent(warranty_authorized_dealer) :- consistent(s28, warranty_authorized_dealer).

evidence(all_consistent(warranty_authorized_dealer)).
query(true_val(warranty_authorized_dealer, must_be_authorized)).
query(true_val(warranty_authorized_dealer, unk_warranty_authorized_dealer)).

% @attr warranty_unauthorized_void
% @type categorical
% @canonical false
% @original_name warranty unauthorized dealer void
% @values ebay_craigslist_void=eBay_Craigslist_purchases_void_warranty unk_warranty_unauthorized_void=Unknown
% @importance 0.8

0.93::acc(s27, warranty_unauthorized_void).

0.93::true_val(warranty_unauthorized_void, ebay_craigslist_void); 0.07::true_val(warranty_unauthorized_void, unk_warranty_unauthorized_void).

measured(s27, warranty_unauthorized_void, ebay_craigslist_void).

all_consistent(warranty_unauthorized_void) :- consistent(s27, warranty_unauthorized_void).

evidence(all_consistent(warranty_unauthorized_void)).
query(true_val(warranty_unauthorized_void, ebay_craigslist_void)).
query(true_val(warranty_unauthorized_void, unk_warranty_unauthorized_void)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values true_twin=True_twin_symmetric asym_twin=Asym_twin_level1 unk_shape=Unknown
% @importance 0.8

0.93::acc(s1, shape).
0.85::acc(s12, shape).
0.80::acc(s30, shape).
0.65::acc(s_merchant, shape).
0.55::acc(s26, shape).

0.60::true_val(shape, true_twin); 0.35::true_val(shape, asym_twin); 0.05::true_val(shape, unk_shape).

measured(s1, shape, true_twin).
measured(s12, shape, true_twin).
measured(s30, shape, true_twin).
measured(s_merchant, shape, asym_twin).
measured(s26, shape, asym_twin).

all_consistent(shape) :-
    consistent(s1, shape),
    consistent(s12, shape),
    (indep(s30), consistent(s30, shape) ; \+indep(s30)),
    (indep(s_merchant), consistent(s_merchant, shape) ; \+indep(s_merchant)),
    (indep(s26), consistent(s26, shape) ; \+indep(s26)).

evidence(all_consistent(shape)).
query(true_val(shape, true_twin)).
query(true_val(shape, asym_twin)).
query(true_val(shape, unk_shape)).

% @attr shape_description
% @type categorical
% @canonical false
% @original_name Shape description
% @values pill_freestyle_90s=Classic_pill_freestyle_shape_90s unk_shape_description=Unknown
% @importance 0.775

0.82::acc(s11, shape_description).
0.80::acc(s30, shape_description).

0.95::true_val(shape_description, pill_freestyle_90s); 0.05::true_val(shape_description, unk_shape_description).

measured(s11, shape_description, pill_freestyle_90s).
measured(s30, shape_description, pill_freestyle_90s).

all_consistent(shape_description) :-
    consistent(s11, shape_description),
    (indep(s30), consistent(s30, shape_description) ; \+indep(s30)).

evidence(all_consistent(shape_description)).
query(true_val(shape_description, pill_freestyle_90s)).
query(true_val(shape_description, unk_shape_description)).

% @attr asymmetry_level
% @type categorical
% @canonical false
% @original_name Asymmetry level
% @values level_1=Level_1_asymmetric_sidecut_core unk_asymmetry_level=Unknown
% @importance 0.85

0.75::acc(s_merchant, asymmetry_level).

0.72::true_val(asymmetry_level, level_1); 0.28::true_val(asymmetry_level, unk_asymmetry_level).

measured(s_merchant, asymmetry_level, level_1).

all_consistent(asymmetry_level) :-
    (indep(s_merchant), consistent(s_merchant, asymmetry_level) ; \+indep(s_merchant)).

evidence(all_consistent(asymmetry_level)).
query(true_val(asymmetry_level, level_1)).
query(true_val(asymmetry_level, unk_asymmetry_level)).

% @attr setback
% @type numeric
% @canonical true
% @original_name setback
% @unit inches
% @values v0=0.0 unk_setback=Unknown
% @importance 0.925

0.93::acc(s_merchant, setback).
0.95::acc(s31, setback).

0.95::true_val(setback, v0); 0.05::true_val(setback, unk_setback).

measured(s_merchant, setback, v0).
measured(s31, setback, v0).

all_consistent(setback) :-
    consistent(s31, setback),
    (indep(s_merchant), consistent(s_merchant, setback) ; \+indep(s_merchant)).

evidence(all_consistent(setback)).
query(true_val(setback, v0)).
query(true_val(setback, unk_setback)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_inserts unk_mounting_pattern=Unknown
% @importance 0.85

0.88::acc(s_merchant, mounting_pattern).

0.88::true_val(mounting_pattern, inserts_2x4); 0.12::true_val(mounting_pattern, unk_mounting_pattern).

measured(s_merchant, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :-
    (indep(s_merchant), consistent(s_merchant, mounting_pattern) ; \+indep(s_merchant)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values s149_152_155_155w_158=149_152_155_155W_158cm unk_available_sizes=Unknown
% @importance 1.0

0.95::acc(s31, available_sizes).

0.95::true_val(available_sizes, s149_152_155_155w_158); 0.05::true_val(available_sizes, unk_available_sizes).

measured(s31, available_sizes, s149_152_155_155w_158).

all_consistent(available_sizes) :- consistent(s31, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, s149_152_155_155w_158)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr size_specs_149
% @type categorical
% @canonical false
% @original_name Size variant 149cm
% @values specs_149=CL112_SC7_8_NT29_1_WW25_0_SR20_25to25_FX4_5_WR90lbs unk_size_specs_149=Unknown
% @importance 1.0

0.93::acc(s31, size_specs_149).

0.93::true_val(size_specs_149, specs_149); 0.07::true_val(size_specs_149, unk_size_specs_149).

measured(s31, size_specs_149, specs_149).

all_consistent(size_specs_149) :- consistent(s31, size_specs_149).

evidence(all_consistent(size_specs_149)).
query(true_val(size_specs_149, specs_149)).
query(true_val(size_specs_149, unk_size_specs_149)).

% @attr size_specs_152
% @type categorical
% @canonical false
% @original_name Size variant 152cm
% @values specs_152=CL113_SC8_0_NT29_4_WW25_0_SR20_25to25_FX5_WR100lbs unk_size_specs_152=Unknown
% @importance 1.0

0.93::acc(s31, size_specs_152).

0.93::true_val(size_specs_152, specs_152); 0.07::true_val(size_specs_152, unk_size_specs_152).

measured(s31, size_specs_152, specs_152).

all_consistent(size_specs_152) :- consistent(s31, size_specs_152).

evidence(all_consistent(size_specs_152)).
query(true_val(size_specs_152, specs_152)).
query(true_val(size_specs_152, unk_size_specs_152)).

% @attr size_specs_155
% @type categorical
% @canonical false
% @original_name Size variant 155cm
% @values specs_155=CL115_SC8_2_NT29_7_WW25_4_SR20_25to25_FX6_WR110lbs unk_size_specs_155=Unknown
% @importance 1.0

0.93::acc(s31, size_specs_155).

0.93::true_val(size_specs_155, specs_155); 0.07::true_val(size_specs_155, unk_size_specs_155).

measured(s31, size_specs_155, specs_155).

all_consistent(size_specs_155) :- consistent(s31, size_specs_155).

evidence(all_consistent(size_specs_155)).
query(true_val(size_specs_155, specs_155)).
query(true_val(size_specs_155, unk_size_specs_155)).

% @attr size_specs_155w
% @type categorical
% @canonical false
% @original_name Size variant 155W
% @values specs_155w=CL115_SC8_2_NT30_5_WW26_4_SR20_25to25_FX6_WR120lbs unk_size_specs_155w=Unknown
% @importance 1.0

0.93::acc(s31, size_specs_155w).

0.93::true_val(size_specs_155w, specs_155w); 0.07::true_val(size_specs_155w, unk_size_specs_155w).

measured(s31, size_specs_155w, specs_155w).

all_consistent(size_specs_155w) :- consistent(s31, size_specs_155w).

evidence(all_consistent(size_specs_155w)).
query(true_val(size_specs_155w, specs_155w)).
query(true_val(size_specs_155w, unk_size_specs_155w)).

% @attr size_specs_158
% @type categorical
% @canonical false
% @original_name Size variant 158cm
% @values specs_158=CL117_SC8_3_NT30_0_WW25_5_SR20_25to25_FX6_WR120lbs unk_size_specs_158=Unknown
% @importance 1.0

0.93::acc(s31, size_specs_158).

0.93::true_val(size_specs_158, specs_158); 0.07::true_val(size_specs_158, unk_size_specs_158).

measured(s31, size_specs_158, specs_158).

all_consistent(size_specs_158) :- consistent(s31, size_specs_158).

evidence(all_consistent(size_specs_158)).
query(true_val(size_specs_158, specs_158)).
query(true_val(size_specs_158, unk_size_specs_158)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide_155W unk_width_options=Unknown
% @importance 0.85

0.88::acc(s_merchant, width_options).

0.88::true_val(width_options, standard_and_wide); 0.12::true_val(width_options, unk_width_options).

measured(s_merchant, width_options, standard_and_wide).

all_consistent(width_options) :-
    (indep(s_merchant), consistent(s_merchant, width_options) ; \+indep(s_merchant)).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

% @attr spec_disagreement_152_nose_tail
% @type numeric
% @canonical false
% @original_name DISAGREEMENT 152cm nose/tail width
% @unit cm
% @values v29_4=29.4 v29_1=29.1
% @importance 0.9

0.93::acc(s31, spec_disagreement_152_nose_tail).
0.65::acc(s32, spec_disagreement_152_nose_tail).

0.70::true_val(spec_disagreement_152_nose_tail, v29_4); 0.30::true_val(spec_disagreement_152_nose_tail, v29_1).

measured(s31, spec_disagreement_152_nose_tail, v29_4).
measured(s32, spec_disagreement_152_nose_tail, v29_1).

all_consistent(spec_disagreement_152_nose_tail) :-
    consistent(s31, spec_disagreement_152_nose_tail),
    consistent(s32, spec_disagreement_152_nose_tail).

evidence(all_consistent(spec_disagreement_152_nose_tail)).
query(true_val(spec_disagreement_152_nose_tail, v29_4)).
query(true_val(spec_disagreement_152_nose_tail, v29_1)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @original_name flex_rating_10
% @unit /10
% @values v5=5.0 v4=4.0 v6=6.0
% @importance 0.9

0.80::acc(s_merchant, flex_rating_10).
0.88::acc(s33, flex_rating_10).
0.92::acc(s31, flex_rating_10).

0.35::true_val(flex_rating_10, v5); 0.25::true_val(flex_rating_10, v4); 0.40::true_val(flex_rating_10, v6).

measured(s_merchant, flex_rating_10, v5).
measured(s33, flex_rating_10, v4).
measured(s31, flex_rating_10, v6).

all_consistent(flex_rating_10) :-
    consistent(s31, flex_rating_10),
    consistent(s33, flex_rating_10),
    (indep(s_merchant), consistent(s_merchant, flex_rating_10) ; \+indep(s_merchant)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v5)).
query(true_val(flex_rating_10, v4)).
query(true_val(flex_rating_10, v6)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values c3=C3_camber unk_camber_type=Unknown
% @importance 0.925

0.95::acc(s1, camber_type).
0.90::acc(s34, camber_type).

0.95::true_val(camber_type, c3); 0.05::true_val(camber_type, unk_camber_type).

measured(s1, camber_type, c3).
measured(s34, camber_type, c3).

all_consistent(camber_type) :- consistent(s1, camber_type), consistent(s34, camber_type).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, c3)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values mild_rocker_camber_tips=Mild_rocker_between_feet_powerful_camber_to_tips unk_camber_description=Unknown
% @importance 0.85

0.90::acc(s34, camber_description).

0.88::true_val(camber_description, mild_rocker_camber_tips); 0.12::true_val(camber_description, unk_camber_description).

measured(s34, camber_description, mild_rocker_camber_tips).

all_consistent(camber_description) :- consistent(s34, camber_description).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, mild_rocker_camber_tips)).
query(true_val(camber_description, unk_camber_description)).

% @attr camber_description_2
% @type categorical
% @canonical false
% @original_name camber_description mellow rocker detail
% @values mellow_rocker_two_camber_pockets=Mellow_rocker_between_two_camber_pockets unk_camber_description_2=Unknown
% @importance 0.7

0.82::acc(s35, camber_description_2).

0.78::true_val(camber_description_2, mellow_rocker_two_camber_pockets); 0.22::true_val(camber_description_2, unk_camber_description_2).

measured(s35, camber_description_2, mellow_rocker_two_camber_pockets).

all_consistent(camber_description_2) :- consistent(s35, camber_description_2).

evidence(all_consistent(camber_description_2)).
query(true_val(camber_description_2, mellow_rocker_two_camber_pockets)).
query(true_val(camber_description_2, unk_camber_description_2)).

% @attr camber_description_3
% @type categorical
% @canonical false
% @original_name camber_description performance benefits
% @values max_edge_pop_power_float=Max_edge_hold_pop_power_precision_float unk_camber_description_3=Unknown
% @importance 0.85

0.90::acc(s34, camber_description_3).

0.88::true_val(camber_description_3, max_edge_pop_power_float); 0.12::true_val(camber_description_3, unk_camber_description_3).

measured(s34, camber_description_3, max_edge_pop_power_float).

all_consistent(camber_description_3) :- consistent(s34, camber_description_3).

evidence(all_consistent(camber_description_3)).
query(true_val(camber_description_3, max_edge_pop_power_float)).
query(true_val(camber_description_3, unk_camber_description_3)).

% @attr camber_description_4
% @type categorical
% @canonical false
% @original_name camber_description close to traditional
% @values close_to_traditional_camber=As_close_to_traditional_camber_as_GNU_gets unk_camber_description_4=Unknown
% @importance 0.7

0.82::acc(s35, camber_description_4).

0.78::true_val(camber_description_4, close_to_traditional_camber); 0.22::true_val(camber_description_4, unk_camber_description_4).

measured(s35, camber_description_4, close_to_traditional_camber).

all_consistent(camber_description_4) :- consistent(s35, camber_description_4).

evidence(all_consistent(camber_description_4)).
query(true_val(camber_description_4, close_to_traditional_camber)).
query(true_val(camber_description_4, unk_camber_description_4)).

% @attr camber_height_mm
% @type numeric
% @canonical true
% @original_name camber_height_mm
% @unit mm
% @values v6=6.0 unk_camber_height_mm=Unknown
% @importance 0.9

0.92::acc(s33, camber_height_mm).

0.85::true_val(camber_height_mm, v6); 0.15::true_val(camber_height_mm, unk_camber_height_mm).

measured(s33, camber_height_mm, v6).

all_consistent(camber_height_mm) :- consistent(s33, camber_height_mm).

evidence(all_consistent(camber_height_mm)).
query(true_val(camber_height_mm, v6)).
query(true_val(camber_height_mm, unk_camber_height_mm)).

% @attr flex_rating_10_manufacturer
% @type categorical
% @canonical false
% @original_name flex_rating_10_manufacturer
% @values v4_5_to_6=4.5_to_6_depending_on_size unk_flex_rating_10_manufacturer=Unknown
% @importance 1.0

0.95::acc(s31, flex_rating_10_manufacturer).

0.95::true_val(flex_rating_10_manufacturer, v4_5_to_6); 0.05::true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer).

measured(s31, flex_rating_10_manufacturer, v4_5_to_6).

all_consistent(flex_rating_10_manufacturer) :- consistent(s31, flex_rating_10_manufacturer).

evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, v4_5_to_6)).
query(true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer)).

% @attr flex_rating_10_evo
% @type categorical
% @canonical false
% @original_name flex_rating_10_evo
% @values medium=Medium unk_flex_rating_10_evo=Unknown
% @importance 0.75

0.78::acc(s36, flex_rating_10_evo).

0.75::true_val(flex_rating_10_evo, medium); 0.25::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).

measured(s36, flex_rating_10_evo, medium).

all_consistent(flex_rating_10_evo) :-
    (indep(s36), consistent(s36, flex_rating_10_evo) ; \+indep(s36)).

evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, medium)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values medium_soft_4_10=Medium_Soft_4out10 unk_flex_feel=Unknown
% @importance 0.9

0.88::acc(s33, flex_feel).

0.85::true_val(flex_feel, medium_soft_4_10); 0.15::true_val(flex_feel, unk_flex_feel).

measured(s33, flex_feel, medium_soft_4_10).

all_consistent(flex_feel) :- consistent(s33, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium_soft_4_10)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr flex_feel_2
% @type categorical
% @canonical false
% @original_name flex_feel Board of the World
% @values long_4_5_tors_4_5_5=Longitudinal_4out5_torsional_4_5out5 unk_flex_feel_2=Unknown
% @importance 0.9

0.85::acc(s37, flex_feel_2).

0.82::true_val(flex_feel_2, long_4_5_tors_4_5_5); 0.18::true_val(flex_feel_2, unk_flex_feel_2).

measured(s37, flex_feel_2, long_4_5_tors_4_5_5).

all_consistent(flex_feel_2) :- consistent(s37, flex_feel_2).

evidence(all_consistent(flex_feel_2)).
query(true_val(flex_feel_2, long_4_5_tors_4_5_5)).
query(true_val(flex_feel_2, unk_flex_feel_2)).

% @attr flex_direction
% @type categorical
% @canonical false
% @original_name flex_direction
% @values soft_tips_stiff_center=Softer_tips_stiffer_center unk_flex_direction=Unknown
% @importance 0.9

0.85::acc(s37, flex_direction).

0.82::true_val(flex_direction, soft_tips_stiff_center); 0.18::true_val(flex_direction, unk_flex_direction).

measured(s37, flex_direction, soft_tips_stiff_center).

all_consistent(flex_direction) :- consistent(s37, flex_direction).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, soft_tips_stiff_center)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr flex_feel_3
% @type categorical
% @canonical false
% @original_name flex_feel The Good Ride
% @values super_soft_buttery=Super_soft_buttery_for_C3 unk_flex_feel_3=Unknown
% @importance 0.85

0.84::acc(s38, flex_feel_3).

0.82::true_val(flex_feel_3, super_soft_buttery); 0.18::true_val(flex_feel_3, unk_flex_feel_3).

measured(s38, flex_feel_3, super_soft_buttery).

all_consistent(flex_feel_3) :- consistent(s38, flex_feel_3).

evidence(all_consistent(flex_feel_3)).
query(true_val(flex_feel_3, super_soft_buttery)).
query(true_val(flex_feel_3, unk_flex_feel_3)).

% @attr flex_feel_4
% @type categorical
% @canonical false
% @original_name flex_feel forum
% @values softer_than_medium=Little_softer_than_medium_great_rails_butters unk_flex_feel_4=Unknown
% @importance 0.65

0.55::acc(s39, flex_feel_4).

0.50::true_val(flex_feel_4, softer_than_medium); 0.50::true_val(flex_feel_4, unk_flex_feel_4).

measured(s39, flex_feel_4, softer_than_medium).

all_consistent(flex_feel_4) :- consistent(s39, flex_feel_4).

evidence(all_consistent(flex_feel_4)).
query(true_val(flex_feel_4, softer_than_medium)).
query(true_val(flex_feel_4, unk_flex_feel_4)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values g2_lite_aspen_paulownia=G2_Lite_Aspen_Paulownia unk_core_material=Unknown
% @importance 0.875

0.88::acc(s40, core_material).
0.85::acc(s_merchant, core_material).

0.95::true_val(core_material, g2_lite_aspen_paulownia); 0.05::true_val(core_material, unk_core_material).

measured(s40, core_material, g2_lite_aspen_paulownia).
measured(s_merchant, core_material, g2_lite_aspen_paulownia).

all_consistent(core_material) :-
    (indep(s40), consistent(s40, core_material) ; \+indep(s40)),
    (indep(s_merchant), consistent(s_merchant, core_material) ; \+indep(s_merchant)).

evidence(all_consistent(core_material)).
query(true_val(core_material, g2_lite_aspen_paulownia)).
query(true_val(core_material, unk_core_material)).

% @attr sustainability_certification_fsc_core
% @type categorical
% @canonical false
% @original_name sustainability_certification FSC eco core
% @values fsc_eco_core=FSC_certified_eco_core unk_sustainability_certification_fsc_core=Unknown
% @importance 1.0

0.93::acc(s1, sustainability_certification_fsc_core).

0.93::true_val(sustainability_certification_fsc_core, fsc_eco_core); 0.07::true_val(sustainability_certification_fsc_core, unk_sustainability_certification_fsc_core).

measured(s1, sustainability_certification_fsc_core, fsc_eco_core).

all_consistent(sustainability_certification_fsc_core) :- consistent(s1, sustainability_certification_fsc_core).

evidence(all_consistent(sustainability_certification_fsc_core)).
query(true_val(sustainability_certification_fsc_core, fsc_eco_core)).
query(true_val(sustainability_certification_fsc_core, unk_sustainability_certification_fsc_core)).

% @attr core_material_description
% @type categorical
% @canonical false
% @original_name core_material description
% @values light_strong_poppy=Light_strong_poppy unk_core_material_description=Unknown
% @importance 0.85

0.85::acc(s40, core_material_description).

0.82::true_val(core_material_description, light_strong_poppy); 0.18::true_val(core_material_description, unk_core_material_description).

measured(s40, core_material_description, light_strong_poppy).

all_consistent(core_material_description) :-
    (indep(s40), consistent(s40, core_material_description) ; \+indep(s40)).

evidence(all_consistent(core_material_description)).
query(true_val(core_material_description, light_strong_poppy)).
query(true_val(core_material_description, unk_core_material_description)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values triax_biax_glass=Triaxial_Biaxial_alloy_glass unk_laminate=Unknown
% @importance 0.725

0.88::acc(s40, laminate).
0.65::acc(s41, laminate).

0.95::true_val(laminate, triax_biax_glass); 0.05::true_val(laminate, unk_laminate).

measured(s40, laminate, triax_biax_glass).
measured(s41, laminate, triax_biax_glass).

all_consistent(laminate) :-
    (indep(s40), consistent(s40, laminate) ; \+indep(s40)),
    (indep(s41), consistent(s41, laminate) ; \+indep(s41)).

evidence(all_consistent(laminate)).
query(true_val(laminate, triax_biax_glass)).
query(true_val(laminate, unk_laminate)).

% @attr laminate_description
% @type categorical
% @canonical false
% @original_name laminate description
% @values strong_poppy_light_responsive=Strong_poppy_lightweight_responsive unk_laminate_description=Unknown
% @importance 0.6

0.65::acc(s41, laminate_description).

0.60::true_val(laminate_description, strong_poppy_light_responsive); 0.40::true_val(laminate_description, unk_laminate_description).

measured(s41, laminate_description, strong_poppy_light_responsive).

all_consistent(laminate_description) :-
    (indep(s41), consistent(s41, laminate_description) ; \+indep(s41)).

evidence(all_consistent(laminate_description)).
query(true_val(laminate_description, strong_poppy_light_responsive)).
query(true_val(laminate_description, unk_laminate_description)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values eco_sublimated_sintered=Eco_sublimated_sintered_base unk_base_material=Unknown
% @importance 1.0

0.95::acc(s1, base_material).

0.95::true_val(base_material, eco_sublimated_sintered); 0.05::true_val(base_material, unk_base_material).

measured(s1, base_material, eco_sublimated_sintered).

all_consistent(base_material) :- consistent(s1, base_material).

evidence(all_consistent(base_material)).
query(true_val(base_material, eco_sublimated_sintered)).
query(true_val(base_material, unk_base_material)).

% @attr base_material_description
% @type categorical
% @canonical false
% @original_name base_material description
% @values fast_tough_holds_wax=Fast_tough_holds_wax_eco unk_base_material_description=Unknown
% @importance 0.85

0.85::acc(s40, base_material_description).

0.82::true_val(base_material_description, fast_tough_holds_wax); 0.18::true_val(base_material_description, unk_base_material_description).

measured(s40, base_material_description, fast_tough_holds_wax).

all_consistent(base_material_description) :-
    (indep(s40), consistent(s40, base_material_description) ; \+indep(s40)).

evidence(all_consistent(base_material_description)).
query(true_val(base_material_description, fast_tough_holds_wax)).
query(true_val(base_material_description, unk_base_material_description)).

% @attr topsheet
% @type categorical
% @canonical false
% @original_name topsheet
% @values eco_sublimated_poly_top=Eco_sublimated_poly_top unk_topsheet=Unknown
% @importance 0.6

0.72::acc(s42, topsheet).
0.85::acc(s_merchant, topsheet).

0.95::true_val(topsheet, eco_sublimated_poly_top); 0.05::true_val(topsheet, unk_topsheet).

measured(s42, topsheet, eco_sublimated_poly_top).
measured(s_merchant, topsheet, eco_sublimated_poly_top).

all_consistent(topsheet) :-
    (indep(s42), consistent(s42, topsheet) ; \+indep(s42)),
    (indep(s_merchant), consistent(s_merchant, topsheet) ; \+indep(s_merchant)).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, eco_sublimated_poly_top)).
query(true_val(topsheet, unk_topsheet)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values uhmw=UHMW_sidewalls unk_sidewall_material=Unknown
% @importance 0.6

0.72::acc(s42, sidewall_material).
0.85::acc(s_merchant, sidewall_material).

0.95::true_val(sidewall_material, uhmw); 0.05::true_val(sidewall_material, unk_sidewall_material).

measured(s42, sidewall_material, uhmw).
measured(s_merchant, sidewall_material, uhmw).

all_consistent(sidewall_material) :-
    (indep(s42), consistent(s42, sidewall_material) ; \+indep(s42)),
    (indep(s_merchant), consistent(s_merchant, sidewall_material) ; \+indep(s_merchant)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, uhmw)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr sidewall_material_description
% @type categorical
% @canonical false
% @original_name sidewall_material description
% @values tough_fast=Tough_and_fast unk_sidewall_material_description=Unknown
% @importance 0.85

0.82::acc(s_merchant, sidewall_material_description).

0.82::true_val(sidewall_material_description, tough_fast); 0.18::true_val(sidewall_material_description, unk_sidewall_material_description).

measured(s_merchant, sidewall_material_description, tough_fast).

all_consistent(sidewall_material_description) :-
    (indep(s_merchant), consistent(s_merchant, sidewall_material_description) ; \+indep(s_merchant)).

evidence(all_consistent(sidewall_material_description)).
query(true_val(sidewall_material_description, tough_fast)).
query(true_val(sidewall_material_description, unk_sidewall_material_description)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values magne_traction_7=Magne_Traction_7_serrations unk_edge_technology=Unknown
% @importance 0.925

0.95::acc(s1, edge_technology).
0.90::acc(s43, edge_technology).

0.95::true_val(edge_technology, magne_traction_7); 0.05::true_val(edge_technology, unk_edge_technology).

measured(s1, edge_technology, magne_traction_7).
measured(s43, edge_technology, magne_traction_7).

all_consistent(edge_technology) :- consistent(s1, edge_technology), consistent(s43, edge_technology).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, magne_traction_7)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr edge_technology_description
% @type categorical
% @canonical false
% @original_name edge_technology description
% @values serrated_steak_knife_grip=Serrated_steak_knife_ice_hardpack_grip unk_edge_technology_description=Unknown
% @importance 0.875

0.88::acc(s43, edge_technology_description).
0.82::acc(s44, edge_technology_description).

0.95::true_val(edge_technology_description, serrated_steak_knife_grip); 0.05::true_val(edge_technology_description, unk_edge_technology_description).

measured(s43, edge_technology_description, serrated_steak_knife_grip).
measured(s44, edge_technology_description, serrated_steak_knife_grip).

all_consistent(edge_technology_description) :- consistent(s43, edge_technology_description), consistent(s44, edge_technology_description).

evidence(all_consistent(edge_technology_description)).
query(true_val(edge_technology_description, serrated_steak_knife_grip)).
query(true_val(edge_technology_description, unk_edge_technology_description)).

% @attr available_colors
% @type categorical
% @canonical false
% @original_name available_colors
% @values random_alternating=Random_alternating_base_reduces_waste unk_available_colors=Unknown
% @importance 0.3

0.78::acc(s45, available_colors).

0.75::true_val(available_colors, random_alternating); 0.25::true_val(available_colors, unk_available_colors).

measured(s45, available_colors, random_alternating).

all_consistent(available_colors) :-
    (indep(s45), consistent(s45, available_colors) ; \+indep(s45)).

evidence(all_consistent(available_colors)).
query(true_val(available_colors, random_alternating)).
query(true_val(available_colors, unk_available_colors)).

% @attr resin
% @type categorical
% @canonical false
% @original_name resin
% @values non_toxic_low_voc=Non_toxic_low_VOC_epoxy unk_resin=Unknown
% @importance 0.5

0.80::acc(s46, resin).

0.75::true_val(resin, non_toxic_low_voc); 0.25::true_val(resin, unk_resin).

measured(s46, resin, non_toxic_low_voc).

all_consistent(resin) :- consistent(s46, resin).

evidence(all_consistent(resin)).
query(true_val(resin, non_toxic_low_voc)).
query(true_val(resin, unk_resin)).

% @attr graphic_designer_artist
% @type categorical
% @canonical false
% @original_name graphic_designer_artist
% @values forest_bailey_sundial=Forest_Bailey_sundial_theme_2025 unk_graphic_designer_artist=Unknown
% @importance 0.35

0.78::acc(s47, graphic_designer_artist).

0.72::true_val(graphic_designer_artist, forest_bailey_sundial); 0.28::true_val(graphic_designer_artist, unk_graphic_designer_artist).

measured(s47, graphic_designer_artist, forest_bailey_sundial).

all_consistent(graphic_designer_artist) :- consistent(s47, graphic_designer_artist).

evidence(all_consistent(graphic_designer_artist)).
query(true_val(graphic_designer_artist, forest_bailey_sundial)).
query(true_val(graphic_designer_artist, unk_graphic_designer_artist)).

% @attr terrain_suitability
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values park_streets_groomers=Park_Streets_Groomers unk_terrain_suitability=Unknown
% @importance 0.85

0.85::acc(s_merchant, terrain_suitability).

0.85::true_val(terrain_suitability, park_streets_groomers); 0.15::true_val(terrain_suitability, unk_terrain_suitability).

measured(s_merchant, terrain_suitability, park_streets_groomers).

all_consistent(terrain_suitability) :-
    (indep(s_merchant), consistent(s_merchant, terrain_suitability) ; \+indep(s_merchant)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, park_streets_groomers)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr riding_style
% @type categorical
% @canonical false
% @original_name riding_style
% @values freestyle_carving=Freestyle_Carving unk_riding_style=Unknown
% @importance 0.85

0.85::acc(s_merchant, riding_style).

0.85::true_val(riding_style, freestyle_carving); 0.15::true_val(riding_style, unk_riding_style).

measured(s_merchant, riding_style, freestyle_carving).

all_consistent(riding_style) :-
    (indep(s_merchant), consistent(s_merchant, riding_style) ; \+indep(s_merchant)).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, freestyle_carving)).
query(true_val(riding_style, unk_riding_style)).

% @attr rider_level
% @type categorical
% @canonical false
% @original_name rider_level
% @values intermediate_advanced=Intermediate_to_Advanced unk_rider_level=Unknown
% @importance 0.85

0.85::acc(s_merchant, rider_level).
0.82::acc(s11, rider_level).

0.95::true_val(rider_level, intermediate_advanced); 0.05::true_val(rider_level, unk_rider_level).

measured(s_merchant, rider_level, intermediate_advanced).
measured(s11, rider_level, intermediate_advanced).

all_consistent(rider_level) :-
    consistent(s11, rider_level),
    (indep(s_merchant), consistent(s_merchant, rider_level) ; \+indep(s_merchant)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate_advanced)).
query(true_val(rider_level, unk_rider_level)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values low_intermediate_up=Low_intermediate_or_up advanced_expert=Advanced_Expert unk_skill_level_recommendation=Unknown
% @importance 0.8

0.85::acc(s48, skill_level_recommendation).
0.75::acc(s49, skill_level_recommendation).

0.45::true_val(skill_level_recommendation, low_intermediate_up); 0.50::true_val(skill_level_recommendation, advanced_expert); 0.05::true_val(skill_level_recommendation, unk_skill_level_recommendation).

measured(s48, skill_level_recommendation, low_intermediate_up).
measured(s49, skill_level_recommendation, advanced_expert).

all_consistent(skill_level_recommendation) :-
    consistent(s48, skill_level_recommendation),
    (indep(s49), consistent(s49, skill_level_recommendation) ; \+indep(s49)).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, low_intermediate_up)).
query(true_val(skill_level_recommendation, advanced_expert)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

% @attr pop
% @type categorical
% @canonical false
% @original_name pop
% @values good_easy_access_7_5=Good_pop_easy_access_7_5out10 unk_pop=Unknown
% @importance 0.9

0.85::acc(s37, pop).
0.88::acc(s33, pop).

0.95::true_val(pop, good_easy_access_7_5); 0.05::true_val(pop, unk_pop).

measured(s37, pop, good_easy_access_7_5).
measured(s33, pop, good_easy_access_7_5).

all_consistent(pop) :- consistent(s37, pop), consistent(s33, pop).

evidence(all_consistent(pop)).
query(true_val(pop, good_easy_access_7_5)).
query(true_val(pop, unk_pop)).

% @attr edge_hold
% @type categorical
% @canonical false
% @original_name edge_hold
% @values exceptional_magne_traction=Exceptional_Magne_Traction_outstanding_ice unk_edge_hold=Unknown
% @importance 0.85

0.82::acc(s11, edge_hold).
0.82::acc(s44, edge_hold).

0.95::true_val(edge_hold, exceptional_magne_traction); 0.05::true_val(edge_hold, unk_edge_hold).

measured(s11, edge_hold, exceptional_magne_traction).
measured(s44, edge_hold, exceptional_magne_traction).

all_consistent(edge_hold) :- consistent(s11, edge_hold), consistent(s44, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, exceptional_magne_traction)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr ride_stability
% @type categorical
% @canonical false
% @original_name Ride characteristics stability
% @values stable_locked_predictable=Stable_locked_in_predictable unk_ride_stability=Unknown
% @importance 0.875

0.82::acc(s11, ride_stability).
0.88::acc(s33, ride_stability).

0.95::true_val(ride_stability, stable_locked_predictable); 0.05::true_val(ride_stability, unk_ride_stability).

measured(s11, ride_stability, stable_locked_predictable).
measured(s33, ride_stability, stable_locked_predictable).

all_consistent(ride_stability) :- consistent(s11, ride_stability), consistent(s33, ride_stability).

evidence(all_consistent(ride_stability)).
query(true_val(ride_stability, stable_locked_predictable)).
query(true_val(ride_stability, unk_ride_stability)).

% @attr ride_dampness
% @type categorical
% @canonical false
% @original_name Ride characteristics dampness
% @values noticeably_damp=Noticeably_damp_for_freestyle unk_ride_dampness=Unknown
% @importance 0.85

0.82::acc(s11, ride_dampness).

0.78::true_val(ride_dampness, noticeably_damp); 0.22::true_val(ride_dampness, unk_ride_dampness).

measured(s11, ride_dampness, noticeably_damp).

all_consistent(ride_dampness) :- consistent(s11, ride_dampness).

evidence(all_consistent(ride_dampness)).
query(true_val(ride_dampness, noticeably_damp)).
query(true_val(ride_dampness, unk_ride_dampness)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values easy_butter_tall_presses=Super_easy_butter_soft_tips_tall_presses unk_positive_aspect=Unknown
% @importance 0.9

0.85::acc(s37, positive_aspect).
0.88::acc(s33, positive_aspect).

0.95::true_val(positive_aspect, easy_butter_tall_presses); 0.05::true_val(positive_aspect, unk_positive_aspect).

measured(s37, positive_aspect, easy_butter_tall_presses).
measured(s33, positive_aspect, easy_butter_tall_presses).

all_consistent(positive_aspect) :- consistent(s37, positive_aspect), consistent(s33, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, easy_butter_tall_presses)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr positive_aspect_2
% @type categorical
% @canonical false
% @original_name positive_aspect jibbing
% @values excellent_jibbing=Excellent_jibbing_locked_in_feel unk_positive_aspect_2=Unknown
% @importance 0.9

0.85::acc(s37, positive_aspect_2).
0.88::acc(s33, positive_aspect_2).

0.95::true_val(positive_aspect_2, excellent_jibbing); 0.05::true_val(positive_aspect_2, unk_positive_aspect_2).

measured(s37, positive_aspect_2, excellent_jibbing).
measured(s33, positive_aspect_2, excellent_jibbing).

all_consistent(positive_aspect_2) :- consistent(s37, positive_aspect_2), consistent(s33, positive_aspect_2).

evidence(all_consistent(positive_aspect_2)).
query(true_val(positive_aspect_2, excellent_jibbing)).
query(true_val(positive_aspect_2, unk_positive_aspect_2)).

% @attr switch_riding
% @type categorical
% @canonical false
% @original_name switch_riding
% @values identical_both_directions=Rides_identically_both_directions unk_switch_riding=Unknown
% @importance 0.9

0.85::acc(s37, switch_riding).

0.82::true_val(switch_riding, identical_both_directions); 0.18::true_val(switch_riding, unk_switch_riding).

measured(s37, switch_riding, identical_both_directions).

all_consistent(switch_riding) :- consistent(s37, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, identical_both_directions)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr carving_rating_tgr
% @type categorical
% @canonical false
% @original_name carving_rating_tgr
% @values good_short_medium_turns=Good_edge_hold_better_short_medium_turns unk_carving_rating_tgr=Unknown
% @importance 0.9

0.85::acc(s37, carving_rating_tgr).
0.88::acc(s33, carving_rating_tgr).

0.95::true_val(carving_rating_tgr, good_short_medium_turns); 0.05::true_val(carving_rating_tgr, unk_carving_rating_tgr).

measured(s37, carving_rating_tgr, good_short_medium_turns).
measured(s33, carving_rating_tgr, good_short_medium_turns).

all_consistent(carving_rating_tgr) :- consistent(s37, carving_rating_tgr), consistent(s33, carving_rating_tgr).

evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, good_short_medium_turns)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

% @attr ride_speed
% @type categorical
% @canonical false
% @original_name Ride characteristics speed
% @values not_speed_board_7_5=Not_speed_board_7_5out10_needs_waxing unk_ride_speed=Unknown
% @importance 0.9

0.85::acc(s37, ride_speed).

0.82::true_val(ride_speed, not_speed_board_7_5); 0.18::true_val(ride_speed, unk_ride_speed).

measured(s37, ride_speed, not_speed_board_7_5).

all_consistent(ride_speed) :- consistent(s37, ride_speed).

evidence(all_consistent(ride_speed)).
query(true_val(ride_speed, not_speed_board_7_5)).
query(true_val(ride_speed, unk_ride_speed)).

% @attr powder_rating_tgr
% @type categorical
% @canonical false
% @original_name powder_rating_tgr
% @values poor_sinky=Poor_sinky_twin_camber unk_powder_rating_tgr=Unknown
% @importance 0.9

0.88::acc(s33, powder_rating_tgr).
0.85::acc(s37, powder_rating_tgr).

0.95::true_val(powder_rating_tgr, poor_sinky); 0.05::true_val(powder_rating_tgr, unk_powder_rating_tgr).

measured(s33, powder_rating_tgr, poor_sinky).
measured(s37, powder_rating_tgr, poor_sinky).

all_consistent(powder_rating_tgr) :- consistent(s33, powder_rating_tgr), consistent(s37, powder_rating_tgr).

evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, poor_sinky)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

% @attr positive_aspect_3
% @type categorical
% @canonical false
% @original_name positive_aspect ice conditions
% @values excellent_east_coast_ice=Excellent_for_East_Coast_icy_Magne_Traction unk_positive_aspect_3=Unknown
% @importance 0.875

0.82::acc(s11, positive_aspect_3).
0.82::acc(s44, positive_aspect_3).

0.95::true_val(positive_aspect_3, excellent_east_coast_ice); 0.05::true_val(positive_aspect_3, unk_positive_aspect_3).

measured(s11, positive_aspect_3, excellent_east_coast_ice).
measured(s44, positive_aspect_3, excellent_east_coast_ice).

all_consistent(positive_aspect_3) :- consistent(s11, positive_aspect_3), consistent(s44, positive_aspect_3).

evidence(all_consistent(positive_aspect_3)).
query(true_val(positive_aspect_3, excellent_east_coast_ice)).
query(true_val(positive_aspect_3, unk_positive_aspect_3)).

% @attr positive_aspect_4
% @type categorical
% @canonical false
% @original_name positive_aspect side hits ollies
% @values great_side_hits_ollies=Great_for_side_hits_ollies_butters_spins unk_positive_aspect_4=Unknown
% @importance 0.9

0.88::acc(s33, positive_aspect_4).

0.85::true_val(positive_aspect_4, great_side_hits_ollies); 0.15::true_val(positive_aspect_4, unk_positive_aspect_4).

measured(s33, positive_aspect_4, great_side_hits_ollies).

all_consistent(positive_aspect_4) :- consistent(s33, positive_aspect_4).

evidence(all_consistent(positive_aspect_4)).
query(true_val(positive_aspect_4, great_side_hits_ollies)).
query(true_val(positive_aspect_4, unk_positive_aspect_4)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values not_for_deep_powder=Not_suitable_for_deep_powder unk_negative_aspect=Unknown
% @importance 0.9

0.88::acc(s33, negative_aspect).
0.85::acc(s37, negative_aspect).

0.95::true_val(negative_aspect, not_for_deep_powder); 0.05::true_val(negative_aspect, unk_negative_aspect).

measured(s33, negative_aspect, not_for_deep_powder).
measured(s37, negative_aspect, not_for_deep_powder).

all_consistent(negative_aspect) :- consistent(s33, negative_aspect), consistent(s37, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, not_for_deep_powder)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_2
% @type categorical
% @canonical false
% @original_name negative_aspect speed
% @values not_high_speed_bomber=Not_a_high_speed_bomber unk_negative_aspect_2=Unknown
% @importance 0.875

0.88::acc(s33, negative_aspect_2).
0.84::acc(s38, negative_aspect_2).

0.95::true_val(negative_aspect_2, not_high_speed_bomber); 0.05::true_val(negative_aspect_2, unk_negative_aspect_2).

measured(s33, negative_aspect_2, not_high_speed_bomber).
measured(s38, negative_aspect_2, not_high_speed_bomber).

all_consistent(negative_aspect_2) :- consistent(s33, negative_aspect_2), consistent(s38, negative_aspect_2).

evidence(all_consistent(negative_aspect_2)).
query(true_val(negative_aspect_2, not_high_speed_bomber)).
query(true_val(negative_aspect_2, unk_negative_aspect_2)).

% @attr negative_aspect_3
% @type categorical
% @canonical false
% @original_name negative_aspect edge catch C3
% @values c3_can_catch_edge=C3_can_catch_edge_when_off_game unk_negative_aspect_3=Unknown
% @importance 0.85

0.84::acc(s38, negative_aspect_3).

0.82::true_val(negative_aspect_3, c3_can_catch_edge); 0.18::true_val(negative_aspect_3, unk_negative_aspect_3).

measured(s38, negative_aspect_3, c3_can_catch_edge).

all_consistent(negative_aspect_3) :- consistent(s38, negative_aspect_3).

evidence(all_consistent(negative_aspect_3)).
query(true_val(negative_aspect_3, c3_can_catch_edge)).
query(true_val(negative_aspect_3, unk_negative_aspect_3)).

% @attr negative_aspect_4
% @type categorical
% @canonical false
% @original_name negative_aspect serrated edge catch on landing
% @values serrated_catch_off_axis=Serrated_edges_catch_if_off_axis_landing unk_negative_aspect_4=Unknown
% @importance 0.9

0.85::acc(s37, negative_aspect_4).

0.82::true_val(negative_aspect_4, serrated_catch_off_axis); 0.18::true_val(negative_aspect_4, unk_negative_aspect_4).

measured(s37, negative_aspect_4, serrated_catch_off_axis).

all_consistent(negative_aspect_4) :- consistent(s37, negative_aspect_4).

evidence(all_consistent(negative_aspect_4)).
query(true_val(negative_aspect_4, serrated_catch_off_axis)).
query(true_val(negative_aspect_4, unk_negative_aspect_4)).

% @attr board_weight_grams
% @type numeric
% @canonical true
% @original_name board_weight_grams
% @unit grams
% @values v2980=2980.0 unk_board_weight_grams=Unknown
% @importance 0.9

0.92::acc(s33, board_weight_grams).

0.85::true_val(board_weight_grams, v2980); 0.15::true_val(board_weight_grams, unk_board_weight_grams).

measured(s33, board_weight_grams, v2980).

all_consistent(board_weight_grams) :- consistent(s33, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v2980)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr weight_per_cm
% @type numeric
% @canonical false
% @original_name weight_per_cm
% @unit g/cm
% @values v19_23=19.23 unk_weight_per_cm=Unknown
% @importance 0.9

0.92::acc(s33, weight_per_cm).

0.85::true_val(weight_per_cm, v19_23); 0.15::true_val(weight_per_cm, unk_weight_per_cm).

measured(s33, weight_per_cm, v19_23).

all_consistent(weight_per_cm) :- consistent(s33, weight_per_cm).

evidence(all_consistent(weight_per_cm)).
query(true_val(weight_per_cm, v19_23)).
query(true_val(weight_per_cm, unk_weight_per_cm)).

% @attr on_snow_weight_feel
% @type categorical
% @canonical false
% @original_name On-snow weight feel
% @values lighter_than_normal=Little_lighter_than_normal_on_snow unk_on_snow_weight_feel=Unknown
% @importance 0.9

0.88::acc(s33, on_snow_weight_feel).

0.85::true_val(on_snow_weight_feel, lighter_than_normal); 0.15::true_val(on_snow_weight_feel, unk_on_snow_weight_feel).

measured(s33, on_snow_weight_feel, lighter_than_normal).

all_consistent(on_snow_weight_feel) :- consistent(s33, on_snow_weight_feel).

evidence(all_consistent(on_snow_weight_feel)).
query(true_val(on_snow_weight_feel, lighter_than_normal)).
query(true_val(on_snow_weight_feel, unk_on_snow_weight_feel)).

% @attr board_weight_grams_smaller
% @type numeric
% @canonical false
% @original_name board_weight_grams smaller size
% @unit grams
% @values v2780=2780.0 unk_board_weight_grams_smaller=Unknown
% @importance 0.9

0.90::acc(s33, board_weight_grams_smaller).

0.85::true_val(board_weight_grams_smaller, v2780); 0.15::true_val(board_weight_grams_smaller, unk_board_weight_grams_smaller).

measured(s33, board_weight_grams_smaller, v2780).

all_consistent(board_weight_grams_smaller) :- consistent(s33, board_weight_grams_smaller).

evidence(all_consistent(board_weight_grams_smaller)).
query(true_val(board_weight_grams_smaller, v2780)).
query(true_val(board_weight_grams_smaller, unk_board_weight_grams_smaller)).

% @attr boot_size_149
% @type categorical
% @canonical false
% @original_name 149cm boot size
% @values us_8_9=US_boot_8_9 unk_boot_size_149=Unknown
% @importance 0.85

0.85::acc(s50, boot_size_149).

0.82::true_val(boot_size_149, us_8_9); 0.18::true_val(boot_size_149, unk_boot_size_149).

measured(s50, boot_size_149, us_8_9).

all_consistent(boot_size_149) :- consistent(s50, boot_size_149).

evidence(all_consistent(boot_size_149)).
query(true_val(boot_size_149, us_8_9)).
query(true_val(boot_size_149, unk_boot_size_149)).

% @attr boot_size_152
% @type categorical
% @canonical false
% @original_name 152cm boot size
% @values us_8_9=US_boot_8_9 unk_boot_size_152=Unknown
% @importance 0.85

0.85::acc(s50, boot_size_152).

0.82::true_val(boot_size_152, us_8_9); 0.18::true_val(boot_size_152, unk_boot_size_152).

measured(s50, boot_size_152, us_8_9).

all_consistent(boot_size_152) :- consistent(s50, boot_size_152).

evidence(all_consistent(boot_size_152)).
query(true_val(boot_size_152, us_8_9)).
query(true_val(boot_size_152, unk_boot_size_152)).

% @attr boot_size_152w
% @type categorical
% @canonical false
% @original_name 152W boot size
% @values us_10_11=US_boot_10_11 unk_boot_size_152w=Unknown
% @importance 0.85

0.85::acc(s50, boot_size_152w).

0.82::true_val(boot_size_152w, us_10_11); 0.18::true_val(boot_size_152w, unk_boot_size_152w).

measured(s50, boot_size_152w, us_10_11).

all_consistent(boot_size_152w) :- consistent(s50, boot_size_152w).

evidence(all_consistent(boot_size_152w)).
query(true_val(boot_size_152w, us_10_11)).
query(true_val(boot_size_152w, unk_boot_size_152w)).

% @attr boot_size_155
% @type categorical
% @canonical false
% @original_name 155cm boot size
% @values us_8_10=US_boot_8_10 unk_boot_size_155=Unknown
% @importance 0.85

0.85::acc(s50, boot_size_155).

0.82::true_val(boot_size_155, us_8_10); 0.18::true_val(boot_size_155, unk_boot_size_155).

measured(s50, boot_size_155, us_8_10).

all_consistent(boot_size_155) :- consistent(s50, boot_size_155).

evidence(all_consistent(boot_size_155)).
query(true_val(boot_size_155, us_8_10)).
query(true_val(boot_size_155, unk_boot_size_155)).

% @attr boot_size_155w
% @type categorical
% @canonical false
% @original_name 155W boot size
% @values us_10_12=US_boot_10_12 unk_boot_size_155w=Unknown
% @importance 0.85

0.85::acc(s50, boot_size_155w).

0.82::true_val(boot_size_155w, us_10_12); 0.18::true_val(boot_size_155w, unk_boot_size_155w).

measured(s50, boot_size_155w, us_10_12).

all_consistent(boot_size_155w) :- consistent(s50, boot_size_155w).

evidence(all_consistent(boot_size_155w)).
query(true_val(boot_size_155w, us_10_12)).
query(true_val(boot_size_155w, unk_boot_size_155w)).

% @attr boot_size_158
% @type categorical
% @canonical false
% @original_name 158cm boot size
% @values us_9_10=US_boot_9_10 unk_boot_size_158=Unknown
% @importance 0.85

0.85::acc(s50, boot_size_158).

0.82::true_val(boot_size_158, us_9_10); 0.18::true_val(boot_size_158, unk_boot_size_158).

measured(s50, boot_size_158, us_9_10).

all_consistent(boot_size_158) :- consistent(s50, boot_size_158).

evidence(all_consistent(boot_size_158)).
query(true_val(boot_size_158, us_9_10)).
query(true_val(boot_size_158, unk_boot_size_158)).

% @attr gnu_user_rating
% @type numeric
% @canonical false
% @original_name GNU.com user rating
% @unit percent
% @values v99=99.0 unk_gnu_user_rating=Unknown
% @importance 0.95

0.90::acc(s13, gnu_user_rating).

0.90::true_val(gnu_user_rating, v99); 0.10::true_val(gnu_user_rating, unk_gnu_user_rating).

measured(s13, gnu_user_rating, v99).

all_consistent(gnu_user_rating) :- consistent(s13, gnu_user_rating).

evidence(all_consistent(gnu_user_rating)).
query(true_val(gnu_user_rating, v99)).
query(true_val(gnu_user_rating, unk_gnu_user_rating)).

% @attr overall_rating_snowboardingprofiles
% @type numeric
% @canonical true
% @original_name overall_rating_snowboardingprofiles
% @unit /100
% @values v88_6=88.6 v88_0=88.0
% @importance 0.9

0.90::acc(s33, overall_rating_snowboardingprofiles).
0.85::acc(s33b, overall_rating_snowboardingprofiles).

0.55::true_val(overall_rating_snowboardingprofiles, v88_6); 0.45::true_val(overall_rating_snowboardingprofiles, v88_0).

measured(s33, overall_rating_snowboardingprofiles, v88_6).
measured(s33b, overall_rating_snowboardingprofiles, v88_0).

all_consistent(overall_rating_snowboardingprofiles) :-
    consistent(s33, overall_rating_snowboardingprofiles),
    consistent(s33b, overall_rating_snowboardingprofiles).

evidence(all_consistent(overall_rating_snowboardingprofiles)).
query(true_val(overall_rating_snowboardingprofiles, v88_6)).
query(true_val(overall_rating_snowboardingprofiles, v88_0)).

% @attr bow_review_score
% @type numeric
% @canonical false
% @original_name Board of the World review score
% @unit /100
% @values v85_25=85.25 unk_bow_review_score=Unknown
% @importance 0.9

0.85::acc(s37, bow_review_score).

0.82::true_val(bow_review_score, v85_25); 0.18::true_val(bow_review_score, unk_bow_review_score).

measured(s37, bow_review_score, v85_25).

all_consistent(bow_review_score) :- consistent(s37, bow_review_score).

evidence(all_consistent(bow_review_score)).
query(true_val(bow_review_score, v85_25)).
query(true_val(bow_review_score, unk_bow_review_score)).

% @attr bow_all_mountain_ranking
% @type categorical
% @canonical false
% @original_name Board of the World all-mountain ranking
% @values rank_27_of_38=27th_of_38 unk_bow_all_mountain_ranking=Unknown
% @importance 0.75

0.78::acc(s18, bow_all_mountain_ranking).

0.72::true_val(bow_all_mountain_ranking, rank_27_of_38); 0.28::true_val(bow_all_mountain_ranking, unk_bow_all_mountain_ranking).

measured(s18, bow_all_mountain_ranking, rank_27_of_38).

all_consistent(bow_all_mountain_ranking) :- consistent(s18, bow_all_mountain_ranking).

evidence(all_consistent(bow_all_mountain_ranking)).
query(true_val(bow_all_mountain_ranking, rank_27_of_38)).
query(true_val(bow_all_mountain_ranking, unk_bow_all_mountain_ranking)).

% @attr bow_park_ranking
% @type categorical
% @canonical false
% @original_name Board of the World park ranking
% @values rank_25_of_36=25th_of_36 unk_bow_park_ranking=Unknown
% @importance 0.75

0.78::acc(s18, bow_park_ranking).

0.72::true_val(bow_park_ranking, rank_25_of_36); 0.28::true_val(bow_park_ranking, unk_bow_park_ranking).

measured(s18, bow_park_ranking, rank_25_of_36).

all_consistent(bow_park_ranking) :- consistent(s18, bow_park_ranking).

evidence(all_consistent(bow_park_ranking)).
query(true_val(bow_park_ranking, rank_25_of_36)).
query(true_val(bow_park_ranking, unk_bow_park_ranking)).

% @attr bow_sub_ratings
% @type categorical
% @canonical false
% @original_name Board of the World sub-ratings
% @values bow_full_sub=Pop3_75_Carv5_Spd3_75_Ice5_Sw5_Jmp3_75_Dmp3_5_Fun5 unk_bow_sub_ratings=Unknown
% @importance 0.9

0.85::acc(s37, bow_sub_ratings).

0.82::true_val(bow_sub_ratings, bow_full_sub); 0.18::true_val(bow_sub_ratings, unk_bow_sub_ratings).

measured(s37, bow_sub_ratings, bow_full_sub).

all_consistent(bow_sub_ratings) :- consistent(s37, bow_sub_ratings).

evidence(all_consistent(bow_sub_ratings)).
query(true_val(bow_sub_ratings, bow_full_sub)).
query(true_val(bow_sub_ratings, unk_bow_sub_ratings)).

% @attr sp_sub_ratings
% @type categorical
% @canonical false
% @original_name SnowboardingProfiles sub-ratings
% @values sp_full_sub=Jmp4_5_Jib4_Spn4_5_Sw4_5_Btr4_5_Unev3_5_Pwd2_Spd3_Crv3_Trn4_5 unk_sp_sub_ratings=Unknown
% @importance 0.9

0.88::acc(s33, sp_sub_ratings).

0.85::true_val(sp_sub_ratings, sp_full_sub); 0.15::true_val(sp_sub_ratings, unk_sp_sub_ratings).

measured(s33, sp_sub_ratings, sp_full_sub).

all_consistent(sp_sub_ratings) :- consistent(s33, sp_sub_ratings).

evidence(all_consistent(sp_sub_ratings)).
query(true_val(sp_sub_ratings, sp_full_sub)).
query(true_val(sp_sub_ratings, unk_sp_sub_ratings)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values great_advanced_jibber_camber=Great_for_advanced_expert_jibbers_full_camber_feel unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.85

0.84::acc(s38, reviewer_opinion_the_good_ride).

0.82::true_val(reviewer_opinion_the_good_ride, great_advanced_jibber_camber); 0.18::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s38, reviewer_opinion_the_good_ride, great_advanced_jibber_camber).

all_consistent(reviewer_opinion_the_good_ride) :- consistent(s38, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, great_advanced_jibber_camber)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values top_100_product=Selected_top_100_snowboard_products_of_year unk_reviewer_opinion_whitelines=Unknown
% @importance 0.7

0.80::acc(s35, reviewer_opinion_whitelines).

0.78::true_val(reviewer_opinion_whitelines, top_100_product); 0.22::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

measured(s35, reviewer_opinion_whitelines, top_100_product).

all_consistent(reviewer_opinion_whitelines) :- consistent(s35, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, top_100_product)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

% @attr user_review_forum
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values good_park_rails_lock_in=Good_park_rails_jumps_lock_in_feel unk_user_review_forum=Unknown
% @importance 0.6

0.60::acc(s51, user_review_forum).

0.52::true_val(user_review_forum, good_park_rails_lock_in); 0.48::true_val(user_review_forum, unk_user_review_forum).

measured(s51, user_review_forum, good_park_rails_lock_in).

all_consistent(user_review_forum) :- consistent(s51, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, good_park_rails_lock_in)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr positive_aspect_5
% @type categorical
% @canonical false
% @original_name positive_aspect C3 tips lock presses
% @values c3_tips_lock_presses=Flat_C3_tips_lock_into_presses_butters unk_positive_aspect_5=Unknown
% @importance 0.9

0.85::acc(s37, positive_aspect_5).

0.82::true_val(positive_aspect_5, c3_tips_lock_presses); 0.18::true_val(positive_aspect_5, unk_positive_aspect_5).

measured(s37, positive_aspect_5, c3_tips_lock_presses).

all_consistent(positive_aspect_5) :- consistent(s37, positive_aspect_5).

evidence(all_consistent(positive_aspect_5)).
query(true_val(positive_aspect_5, c3_tips_lock_presses)).
query(true_val(positive_aspect_5, unk_positive_aspect_5)).

% @attr positive_aspect_6
% @type categorical
% @canonical false
% @original_name positive_aspect C3 springboard pop
% @values c3_springboard_pop=C3_profile_gives_springboard_pop unk_positive_aspect_6=Unknown
% @importance 0.9

0.85::acc(s37, positive_aspect_6).

0.82::true_val(positive_aspect_6, c3_springboard_pop); 0.18::true_val(positive_aspect_6, unk_positive_aspect_6).

measured(s37, positive_aspect_6, c3_springboard_pop).

all_consistent(positive_aspect_6) :- consistent(s37, positive_aspect_6).

evidence(all_consistent(positive_aspect_6)).
query(true_val(positive_aspect_6, c3_springboard_pop)).
query(true_val(positive_aspect_6, unk_positive_aspect_6)).

% @attr positive_aspect_7
% @type categorical
% @canonical false
% @original_name positive_aspect Magne-Traction turns
% @values mt_locks_turns=Magne_Traction_locks_into_turns unk_positive_aspect_7=Unknown
% @importance 0.9

0.85::acc(s37, positive_aspect_7).

0.82::true_val(positive_aspect_7, mt_locks_turns); 0.18::true_val(positive_aspect_7, unk_positive_aspect_7).

measured(s37, positive_aspect_7, mt_locks_turns).

all_consistent(positive_aspect_7) :- consistent(s37, positive_aspect_7).

evidence(all_consistent(positive_aspect_7)).
query(true_val(positive_aspect_7, mt_locks_turns)).
query(true_val(positive_aspect_7, unk_positive_aspect_7)).

% @attr positive_aspect_8
% @type categorical
% @canonical false
% @original_name positive_aspect easy turn initiation
% @values easy_turn_stable_damp=Easy_turn_initiation_stable_damp unk_positive_aspect_8=Unknown
% @importance 0.9

0.85::acc(s37, positive_aspect_8).

0.82::true_val(positive_aspect_8, easy_turn_stable_damp); 0.18::true_val(positive_aspect_8, unk_positive_aspect_8).

measured(s37, positive_aspect_8, easy_turn_stable_damp).

all_consistent(positive_aspect_8) :- consistent(s37, positive_aspect_8).

evidence(all_consistent(positive_aspect_8)).
query(true_val(positive_aspect_8, easy_turn_stable_damp)).
query(true_val(positive_aspect_8, unk_positive_aspect_8)).

% @attr positive_aspect_9
% @type categorical
% @canonical false
% @original_name positive_aspect confidence booster
% @values predictable_confidence=Predictable_locked_in_confidence_booster unk_positive_aspect_9=Unknown
% @importance 0.85

0.82::acc(s11, positive_aspect_9).

0.78::true_val(positive_aspect_9, predictable_confidence); 0.22::true_val(positive_aspect_9, unk_positive_aspect_9).

measured(s11, positive_aspect_9, predictable_confidence).

all_consistent(positive_aspect_9) :- consistent(s11, positive_aspect_9).

evidence(all_consistent(positive_aspect_9)).
query(true_val(positive_aspect_9, predictable_confidence)).
query(true_val(positive_aspect_9, unk_positive_aspect_9)).

% @attr negative_aspect_5
% @type categorical
% @canonical false
% @original_name negative_aspect catchy
% @values can_be_catchy=Can_be_catchy_wont_suit_everyone unk_negative_aspect_5=Unknown
% @importance 0.9

0.85::acc(s37, negative_aspect_5).

0.82::true_val(negative_aspect_5, can_be_catchy); 0.18::true_val(negative_aspect_5, unk_negative_aspect_5).

measured(s37, negative_aspect_5, can_be_catchy).

all_consistent(negative_aspect_5) :- consistent(s37, negative_aspect_5).

evidence(all_consistent(negative_aspect_5)).
query(true_val(negative_aspect_5, can_be_catchy)).
query(true_val(negative_aspect_5, unk_negative_aspect_5)).

% @attr negative_aspect_6
% @type categorical
% @canonical false
% @original_name negative_aspect limiting for tall heavy
% @values limiting_tall_heavy=May_be_limiting_tall_heavy_riders unk_negative_aspect_6=Unknown
% @importance 0.9

0.85::acc(s37, negative_aspect_6).

0.82::true_val(negative_aspect_6, limiting_tall_heavy); 0.18::true_val(negative_aspect_6, unk_negative_aspect_6).

measured(s37, negative_aspect_6, limiting_tall_heavy).

all_consistent(negative_aspect_6) :- consistent(s37, negative_aspect_6).

evidence(all_consistent(negative_aspect_6)).
query(true_val(negative_aspect_6, limiting_tall_heavy)).
query(true_val(negative_aspect_6, unk_negative_aspect_6)).

% @attr negative_aspect_7
% @type categorical
% @canonical false
% @original_name negative_aspect not for carver freerider
% @values not_for_carver_freerider=Not_ideal_aggressive_carver_freerider unk_negative_aspect_7=Unknown
% @importance 0.85

0.82::acc(s11, negative_aspect_7).

0.78::true_val(negative_aspect_7, not_for_carver_freerider); 0.22::true_val(negative_aspect_7, unk_negative_aspect_7).

measured(s11, negative_aspect_7, not_for_carver_freerider).

all_consistent(negative_aspect_7) :- consistent(s11, negative_aspect_7).

evidence(all_consistent(negative_aspect_7)).
query(true_val(negative_aspect_7, not_for_carver_freerider)).
query(true_val(negative_aspect_7, unk_negative_aspect_7)).

% @attr negative_aspect_8
% @type categorical
% @canonical false
% @original_name negative_aspect nose dives powder
% @values nose_dives_powder=Nose_dives_deep_powder_no_float unk_negative_aspect_8=Unknown
% @importance 0.9

0.88::acc(s33, negative_aspect_8).

0.85::true_val(negative_aspect_8, nose_dives_powder); 0.15::true_val(negative_aspect_8, unk_negative_aspect_8).

measured(s33, negative_aspect_8, nose_dives_powder).

all_consistent(negative_aspect_8) :- consistent(s33, negative_aspect_8).

evidence(all_consistent(negative_aspect_8)).
query(true_val(negative_aspect_8, nose_dives_powder)).
query(true_val(negative_aspect_8, unk_negative_aspect_8)).

% @attr negative_aspect_9
% @type categorical
% @canonical false
% @original_name negative_aspect squirrelly at speed
% @values squirrelly_high_speed=Gets_squirrelly_at_high_speed unk_negative_aspect_9=Unknown
% @importance 0.9

0.88::acc(s33, negative_aspect_9).

0.85::true_val(negative_aspect_9, squirrelly_high_speed); 0.15::true_val(negative_aspect_9, unk_negative_aspect_9).

measured(s33, negative_aspect_9, squirrelly_high_speed).

all_consistent(negative_aspect_9) :- consistent(s33, negative_aspect_9).

evidence(all_consistent(negative_aspect_9)).
query(true_val(negative_aspect_9, squirrelly_high_speed)).
query(true_val(negative_aspect_9, unk_negative_aspect_9)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values lib_tech_off_ramp=Lib_Tech_Off_Ramp_stiffer_traditional_camber unk_comparable_board_same_brand=Unknown
% @importance 0.9

0.85::acc(s37, comparable_board_same_brand).

0.82::true_val(comparable_board_same_brand, lib_tech_off_ramp); 0.18::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s37, comparable_board_same_brand, lib_tech_off_ramp).

all_consistent(comparable_board_same_brand) :- consistent(s37, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, lib_tech_off_ramp)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values burton_process=Burton_Process unk_comparable_board_cross_brand=Unknown
% @importance 0.75

0.60::acc(s52, comparable_board_cross_brand).

0.55::true_val(comparable_board_cross_brand, burton_process); 0.45::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s52, comparable_board_cross_brand, burton_process).

all_consistent(comparable_board_cross_brand) :- consistent(s52, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, burton_process)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_2
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand Yes The Greats
% @values yes_the_greats=Yes_The_Greats_Uninc unk_comparable_board_cross_brand_2=Unknown
% @importance 0.75

0.60::acc(s52, comparable_board_cross_brand_2).

0.55::true_val(comparable_board_cross_brand_2, yes_the_greats); 0.45::true_val(comparable_board_cross_brand_2, unk_comparable_board_cross_brand_2).

measured(s52, comparable_board_cross_brand_2, yes_the_greats).

all_consistent(comparable_board_cross_brand_2) :- consistent(s52, comparable_board_cross_brand_2).

evidence(all_consistent(comparable_board_cross_brand_2)).
query(true_val(comparable_board_cross_brand_2, yes_the_greats)).
query(true_val(comparable_board_cross_brand_2, unk_comparable_board_cross_brand_2)).

% @attr comparable_board_cross_brand_3
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand Capita Horrorscope
% @values capita_horrorscope=Capita_Horrorscope unk_comparable_board_cross_brand_3=Unknown
% @importance 0.75

0.82::acc(s53, comparable_board_cross_brand_3).

0.78::true_val(comparable_board_cross_brand_3, capita_horrorscope); 0.22::true_val(comparable_board_cross_brand_3, unk_comparable_board_cross_brand_3).

measured(s53, comparable_board_cross_brand_3, capita_horrorscope).

all_consistent(comparable_board_cross_brand_3) :- consistent(s53, comparable_board_cross_brand_3).

evidence(all_consistent(comparable_board_cross_brand_3)).
query(true_val(comparable_board_cross_brand_3, capita_horrorscope)).
query(true_val(comparable_board_cross_brand_3, unk_comparable_board_cross_brand_3)).

% @attr comparable_board_cross_brand_4
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand DWD Rat
% @values dwd_rat=DWD_Rat unk_comparable_board_cross_brand_4=Unknown
% @importance 0.75

0.82::acc(s53, comparable_board_cross_brand_4).

0.78::true_val(comparable_board_cross_brand_4, dwd_rat); 0.22::true_val(comparable_board_cross_brand_4, unk_comparable_board_cross_brand_4).

measured(s53, comparable_board_cross_brand_4, dwd_rat).

all_consistent(comparable_board_cross_brand_4) :- consistent(s53, comparable_board_cross_brand_4).

evidence(all_consistent(comparable_board_cross_brand_4)).
query(true_val(comparable_board_cross_brand_4, dwd_rat)).
query(true_val(comparable_board_cross_brand_4, unk_comparable_board_cross_brand_4)).

% @attr comparable_board_same_brand_2
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand Lib Tech Box Knife
% @values lib_tech_box_knife=Lib_Tech_Box_Knife unk_comparable_board_same_brand_2=Unknown
% @importance 0.75

0.82::acc(s53, comparable_board_same_brand_2).

0.78::true_val(comparable_board_same_brand_2, lib_tech_box_knife); 0.22::true_val(comparable_board_same_brand_2, unk_comparable_board_same_brand_2).

measured(s53, comparable_board_same_brand_2, lib_tech_box_knife).

all_consistent(comparable_board_same_brand_2) :- consistent(s53, comparable_board_same_brand_2).

evidence(all_consistent(comparable_board_same_brand_2)).
query(true_val(comparable_board_same_brand_2, lib_tech_box_knife)).
query(true_val(comparable_board_same_brand_2, unk_comparable_board_same_brand_2)).

% @attr comparable_board_cross_brand_5
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand Ride Twinpig
% @values ride_twinpig=Ride_Twinpig unk_comparable_board_cross_brand_5=Unknown
% @importance 0.65

0.72::acc(s54, comparable_board_cross_brand_5).

0.68::true_val(comparable_board_cross_brand_5, ride_twinpig); 0.32::true_val(comparable_board_cross_brand_5, unk_comparable_board_cross_brand_5).

measured(s54, comparable_board_cross_brand_5, ride_twinpig).

all_consistent(comparable_board_cross_brand_5) :- consistent(s54, comparable_board_cross_brand_5).

evidence(all_consistent(comparable_board_cross_brand_5)).
query(true_val(comparable_board_cross_brand_5, ride_twinpig)).
query(true_val(comparable_board_cross_brand_5, unk_comparable_board_cross_brand_5)).

% @attr comparable_board_cross_brand_6
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand Capita DOA
% @values capita_doa=Capita_DOA unk_comparable_board_cross_brand_6=Unknown
% @importance 0.75

0.60::acc(s52, comparable_board_cross_brand_6).

0.55::true_val(comparable_board_cross_brand_6, capita_doa); 0.45::true_val(comparable_board_cross_brand_6, unk_comparable_board_cross_brand_6).

measured(s52, comparable_board_cross_brand_6, capita_doa).

all_consistent(comparable_board_cross_brand_6) :- consistent(s52, comparable_board_cross_brand_6).

evidence(all_consistent(comparable_board_cross_brand_6)).
query(true_val(comparable_board_cross_brand_6, capita_doa)).
query(true_val(comparable_board_cross_brand_6, unk_comparable_board_cross_brand_6)).

% @attr comparable_board_cross_brand_7
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand Arbor Westmark
% @values arbor_westmark=Arbor_Westmark_Camber unk_comparable_board_cross_brand_7=Unknown
% @importance 0.75

0.60::acc(s52, comparable_board_cross_brand_7).

0.55::true_val(comparable_board_cross_brand_7, arbor_westmark); 0.45::true_val(comparable_board_cross_brand_7, unk_comparable_board_cross_brand_7).

measured(s52, comparable_board_cross_brand_7, arbor_westmark).

all_consistent(comparable_board_cross_brand_7) :- consistent(s52, comparable_board_cross_brand_7).

evidence(all_consistent(comparable_board_cross_brand_7)).
query(true_val(comparable_board_cross_brand_7, arbor_westmark)).
query(true_val(comparable_board_cross_brand_7, unk_comparable_board_cross_brand_7)).

% @attr recommended_bindings
% @type categorical
% @canonical false
% @original_name Recommended bindings
% @values bent_metal_axtion=Bent_Metal_Axtion_and_Union_Ultra unk_recommended_bindings=Unknown
% @importance 0.55

0.78::acc(s55, recommended_bindings).
0.85::acc(s37, recommended_bindings).

0.95::true_val(recommended_bindings, bent_metal_axtion); 0.05::true_val(recommended_bindings, unk_recommended_bindings).

measured(s55, recommended_bindings, bent_metal_axtion).
measured(s37, recommended_bindings, bent_metal_axtion).

all_consistent(recommended_bindings) :- consistent(s55, recommended_bindings), consistent(s37, recommended_bindings).

evidence(all_consistent(recommended_bindings)).
query(true_val(recommended_bindings, bent_metal_axtion)).
query(true_val(recommended_bindings, unk_recommended_bindings)).

% @attr sustainability_certification_fsc
% @type categorical
% @canonical false
% @original_name sustainability_certification FSC
% @values fsc_certified=FSC_Forest_Stewardship_Council_certified unk_sustainability_certification_fsc=Unknown
% @importance 1.0

0.95::acc(s1, sustainability_certification_fsc).

0.95::true_val(sustainability_certification_fsc, fsc_certified); 0.05::true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc).

measured(s1, sustainability_certification_fsc, fsc_certified).

all_consistent(sustainability_certification_fsc) :- consistent(s1, sustainability_certification_fsc).

evidence(all_consistent(sustainability_certification_fsc)).
query(true_val(sustainability_certification_fsc, fsc_certified)).
query(true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc)).

% @attr sustainability_certification_zero_waste
% @type categorical
% @canonical false
% @original_name sustainability_certification zero hazardous waste
% @values zero_hazardous_waste=Zero_hazardous_waste_production unk_sustainability_certification_zero_waste=Unknown
% @importance 0.5

0.80::acc(s10, sustainability_certification_zero_waste).

0.78::true_val(sustainability_certification_zero_waste, zero_hazardous_waste); 0.22::true_val(sustainability_certification_zero_waste, unk_sustainability_certification_zero_waste).

measured(s10, sustainability_certification_zero_waste, zero_hazardous_waste).

all_consistent(sustainability_certification_zero_waste) :-
    (indep(s10), consistent(s10, sustainability_certification_zero_waste) ; \+indep(s10)).

evidence(all_consistent(sustainability_certification_zero_waste)).
query(true_val(sustainability_certification_zero_waste, zero_hazardous_waste)).
query(true_val(sustainability_certification_zero_waste, unk_sustainability_certification_zero_waste)).

% @attr sustainability_certification_no_toxic
% @type categorical
% @canonical false
% @original_name sustainability_certification no toxic silk screen
% @values no_toxic_silk_screen=Eliminates_toxic_silk_screen_no_toxic_runoff unk_sustainability_certification_no_toxic=Unknown
% @importance 0.5

0.80::acc(s46, sustainability_certification_no_toxic).

0.75::true_val(sustainability_certification_no_toxic, no_toxic_silk_screen); 0.25::true_val(sustainability_certification_no_toxic, unk_sustainability_certification_no_toxic).

measured(s46, sustainability_certification_no_toxic, no_toxic_silk_screen).

all_consistent(sustainability_certification_no_toxic) :- consistent(s46, sustainability_certification_no_toxic).

evidence(all_consistent(sustainability_certification_no_toxic)).
query(true_val(sustainability_certification_no_toxic, no_toxic_silk_screen)).
query(true_val(sustainability_certification_no_toxic, unk_sustainability_certification_no_toxic)).

% @attr sustainability_certification_renewable_power
% @type categorical
% @canonical false
% @original_name sustainability_certification renewable power
% @values wind_water_power=Washington_State_wind_water_power unk_sustainability_certification_renewable_power=Unknown
% @importance 0.5

0.80::acc(s46, sustainability_certification_renewable_power).

0.75::true_val(sustainability_certification_renewable_power, wind_water_power); 0.25::true_val(sustainability_certification_renewable_power, unk_sustainability_certification_renewable_power).

measured(s46, sustainability_certification_renewable_power, wind_water_power).

all_consistent(sustainability_certification_renewable_power) :- consistent(s46, sustainability_certification_renewable_power).

evidence(all_consistent(sustainability_certification_renewable_power)).
query(true_val(sustainability_certification_renewable_power, wind_water_power)).
query(true_val(sustainability_certification_renewable_power, unk_sustainability_certification_renewable_power)).

% @attr sustainability_certification_composting
% @type categorical
% @canonical false
% @original_name sustainability_certification composting
% @values delivered_neighbors_composting=Delivered_to_neighbors_for_composting unk_sustainability_certification_composting=Unknown
% @importance 0.5

0.75::acc(s46, sustainability_certification_composting).

0.70::true_val(sustainability_certification_composting, delivered_neighbors_composting); 0.30::true_val(sustainability_certification_composting, unk_sustainability_certification_composting).

measured(s46, sustainability_certification_composting, delivered_neighbors_composting).

all_consistent(sustainability_certification_composting) :- consistent(s46, sustainability_certification_composting).

evidence(all_consistent(sustainability_certification_composting)).
query(true_val(sustainability_certification_composting, delivered_neighbors_composting)).
query(true_val(sustainability_certification_composting, unk_sustainability_certification_composting)).

% @attr core_material_renewable
% @type categorical
% @canonical false
% @original_name core_material renewable forest products
% @values fast_growing_renewable=Fast_growing_renewable_Aspen_Paulownia unk_core_material_renewable=Unknown
% @importance 0.5

0.80::acc(s10, core_material_renewable).

0.78::true_val(core_material_renewable, fast_growing_renewable); 0.22::true_val(core_material_renewable, unk_core_material_renewable).

measured(s10, core_material_renewable, fast_growing_renewable).

all_consistent(core_material_renewable) :-
    (indep(s10), consistent(s10, core_material_renewable) ; \+indep(s10)).

evidence(all_consistent(core_material_renewable)).
query(true_val(core_material_renewable, fast_growing_renewable)).
query(true_val(core_material_renewable, unk_core_material_renewable)).

% @attr gender
% @type categorical
% @canonical false
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.7

0.80::acc(s_merchant, gender).

0.80::true_val(gender, mens); 0.20::true_val(gender, unk_gender).

measured(s_merchant, gender, mens).

all_consistent(gender) :-
    (indep(s_merchant), consistent(s_merchant, gender) ; \+indep(s_merchant)).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr binding_compatibility
% @type categorical
% @canonical false
% @original_name binding_compatibility
% @values compatible_2x4_most_brands=2x4_insert_compatible_most_major_brands unk_binding_compatibility=Unknown
% @importance 0.85

0.85::acc(s_merchant, binding_compatibility).

0.85::true_val(binding_compatibility, compatible_2x4_most_brands); 0.15::true_val(binding_compatibility, unk_binding_compatibility).

measured(s_merchant, binding_compatibility, compatible_2x4_most_brands).

all_consistent(binding_compatibility) :-
    (indep(s_merchant), consistent(s_merchant, binding_compatibility) ; \+indep(s_merchant)).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, compatible_2x4_most_brands)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

% @attr base_maintenance
% @type categorical
% @canonical false
% @original_name Base maintenance
% @values sintered_regular_wax=Sintered_base_requires_regular_waxing unk_base_maintenance=Unknown
% @importance 0.9

0.85::acc(s37, base_maintenance).

0.82::true_val(base_maintenance, sintered_regular_wax); 0.18::true_val(base_maintenance, unk_base_maintenance).

measured(s37, base_maintenance, sintered_regular_wax).

all_consistent(base_maintenance) :- consistent(s37, base_maintenance).

evidence(all_consistent(base_maintenance)).
query(true_val(base_maintenance, sintered_regular_wax)).
query(true_val(base_maintenance, unk_base_maintenance)).

% @attr design_inspiration
% @type categorical
% @canonical false
% @original_name Design inspiration
% @values pill_skate_surf_90s=Classic_pill_shape_skateboarding_surfing_90s unk_design_inspiration=Unknown
% @importance 0.7

0.82::acc(s35, design_inspiration).

0.78::true_val(design_inspiration, pill_skate_surf_90s); 0.22::true_val(design_inspiration, unk_design_inspiration).

measured(s35, design_inspiration, pill_skate_surf_90s).

all_consistent(design_inspiration) :- consistent(s35, design_inspiration).

evidence(all_consistent(design_inspiration)).
query(true_val(design_inspiration, pill_skate_surf_90s)).
query(true_val(design_inspiration, unk_design_inspiration)).

% @attr gnu_brand_history
% @type categorical
% @canonical false
% @original_name GNU brand history
% @values handbuilt_usa_since_1977=Handbuilt_USA_since_1977 unk_gnu_brand_history=Unknown
% @importance 0.4

0.88::acc(s56, gnu_brand_history).

0.85::true_val(gnu_brand_history, handbuilt_usa_since_1977); 0.15::true_val(gnu_brand_history, unk_gnu_brand_history).

measured(s56, gnu_brand_history, handbuilt_usa_since_1977).

all_consistent(gnu_brand_history) :- consistent(s56, gnu_brand_history).

evidence(all_consistent(gnu_brand_history)).
query(true_val(gnu_brand_history, handbuilt_usa_since_1977)).
query(true_val(gnu_brand_history, unk_gnu_brand_history)).

% @attr mervin_factory_employees
% @type numeric
% @canonical false
% @original_name Mervin factory employees
% @unit people
% @values v120=120.0 unk_mervin_factory_employees=Unknown
% @importance 0.35

0.82::acc(s57, mervin_factory_employees).

0.78::true_val(mervin_factory_employees, v120); 0.22::true_val(mervin_factory_employees, unk_mervin_factory_employees).

measured(s57, mervin_factory_employees, v120).

all_consistent(mervin_factory_employees) :- consistent(s57, mervin_factory_employees).

evidence(all_consistent(mervin_factory_employees)).
query(true_val(mervin_factory_employees, v120)).
query(true_val(mervin_factory_employees, unk_mervin_factory_employees)).

% @attr mervin_workweek
% @type categorical
% @canonical false
% @original_name Mervin workweek
% @values four_day=Four_day_workweek unk_mervin_workweek=Unknown
% @importance 0.35

0.82::acc(s57, mervin_workweek).

0.78::true_val(mervin_workweek, four_day); 0.22::true_val(mervin_workweek, unk_mervin_workweek).

measured(s57, mervin_workweek, four_day).

all_consistent(mervin_workweek) :- consistent(s57, mervin_workweek).

evidence(all_consistent(mervin_workweek)).
query(true_val(mervin_workweek, four_day)).
query(true_val(mervin_workweek, unk_mervin_workweek)).