0.15::indep(s1).
0.15::indep(s_merchant).
0.12::indep(s4).
0.12::indep(s5).
0.20::indep(s3).
0.25::indep(s8).
0.12::indep(s13).
0.15::indep(s14).
0.15::indep(s15).
0.15::indep(s16).
0.15::indep(s21).
0.15::indep(s22).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values burton=Burton unk_brand=Unknown
% @importance 0.90

0.88::acc(s1, brand).
0.90::acc(s_merchant, brand).

0.97::true_val(brand, burton); 0.03::true_val(brand, unk_brand).

measured(s1, brand, burton).
measured(s_merchant, brand, burton).

all_consistent(brand) :-
    (indep(s1), consistent(s1, brand) ; \+indep(s1)),
    (indep(s_merchant), consistent(s_merchant, brand) ; \+indep(s_merchant)).

evidence(all_consistent(brand)).
query(true_val(brand, burton)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values fish_3d_splitboard=Fish_3D_Splitboard unk_model_name=Unknown
% @importance 0.95

0.88::acc(s1, model_name).
0.95::acc(s2, model_name).

0.95::true_val(model_name, fish_3d_splitboard); 0.05::true_val(model_name, unk_model_name).

measured(s1, model_name, fish_3d_splitboard).
measured(s2, model_name, fish_3d_splitboard).

all_consistent(model_name) :-
    (indep(s1), consistent(s1, model_name) ; \+indep(s1)),
    consistent(s2, model_name).

evidence(all_consistent(model_name)).
query(true_val(model_name, fish_3d_splitboard)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type numeric
% @canonical true
% @original_name model_year
% @values v2026=2026 unk_model_year=Unknown
% @importance 0.90

0.85::acc(s1, model_year).
0.80::acc(s4, model_year).

0.95::true_val(model_year, v2026); 0.05::true_val(model_year, unk_model_year).

measured(s1, model_year, v2026).
measured(s4, model_year, v2026).

all_consistent(model_year) :-
    (indep(s1), consistent(s1, model_year) ; \+indep(s1)),
    (indep(s4), consistent(s4, model_year) ; \+indep(s4)).

evidence(all_consistent(model_year)).
query(true_val(model_year, v2026)).
query(true_val(model_year, unk_model_year)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values burton_snowboards=Burton_Snowboards_founded_1977 unk_manufacturer=Unknown
% @importance 0.50

0.90::acc(s17, manufacturer).

0.92::true_val(manufacturer, burton_snowboards); 0.08::true_val(manufacturer, unk_manufacturer).

measured(s17, manufacturer, burton_snowboards).

all_consistent(manufacturer) :- consistent(s17, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, burton_snowboards)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr manufacturer_headquarters
% @type categorical
% @canonical false
% @original_name Manufacturer headquarters
% @values burlington_vt_usa=Burlington_Vermont_USA unk_manufacturer_headquarters=Unknown
% @importance 0.35

0.90::acc(s18, manufacturer_headquarters).

0.92::true_val(manufacturer_headquarters, burlington_vt_usa); 0.08::true_val(manufacturer_headquarters, unk_manufacturer_headquarters).

measured(s18, manufacturer_headquarters, burlington_vt_usa).

all_consistent(manufacturer_headquarters) :- consistent(s18, manufacturer_headquarters).

evidence(all_consistent(manufacturer_headquarters)).
query(true_val(manufacturer_headquarters, burlington_vt_usa)).
query(true_val(manufacturer_headquarters, unk_manufacturer_headquarters)).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values austria_china=Austria_Keil_and_China unk_manufacturing_location_current=Unknown
% @importance 0.45

0.88::acc(s19, manufacturing_location_current).
0.87::acc(s20, manufacturing_location_current).

0.93::true_val(manufacturing_location_current, austria_china); 0.07::true_val(manufacturing_location_current, unk_manufacturing_location_current).

measured(s19, manufacturing_location_current, austria_china).
measured(s20, manufacturing_location_current, austria_china).

all_consistent(manufacturing_location_current) :-
    consistent(s19, manufacturing_location_current),
    consistent(s20, manufacturing_location_current).

evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, austria_china)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

% @attr manufacturer_reputation
% @type categorical
% @canonical false
% @original_name Manufacturer reputation
% @values most_storied=One_of_the_most_storied_brands unk_manufacturer_reputation=Unknown
% @importance 0.95

0.85::acc(s6, manufacturer_reputation).

0.85::true_val(manufacturer_reputation, most_storied); 0.15::true_val(manufacturer_reputation, unk_manufacturer_reputation).

measured(s6, manufacturer_reputation, most_storied).

all_consistent(manufacturer_reputation) :- consistent(s6, manufacturer_reputation).

evidence(all_consistent(manufacturer_reputation)).
query(true_val(manufacturer_reputation, most_storied)).
query(true_val(manufacturer_reputation, unk_manufacturer_reputation)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values splitboard=Splitboard unk_product_type=Unknown
% @importance 0.90

0.90::acc(s1, product_type).

0.95::true_val(product_type, splitboard); 0.05::true_val(product_type, unk_product_type).

measured(s1, product_type, splitboard).

all_consistent(product_type) :- (indep(s1), consistent(s1, product_type) ; \+indep(s1)).

evidence(all_consistent(product_type)).
query(true_val(product_type, splitboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values powder=Powder unk_board_category=Unknown
% @importance 0.90

0.88::acc(s_merchant, board_category).

0.92::true_val(board_category, powder); 0.08::true_val(board_category, unk_board_category).

measured(s_merchant, board_category, powder).

all_consistent(board_category) :- (indep(s_merchant), consistent(s_merchant, board_category) ; \+indep(s_merchant)).

evidence(all_consistent(board_category)).
query(true_val(board_category, powder)).
query(true_val(board_category, unk_board_category)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values unisex=Unisex unk_gender=Unknown
% @importance 0.88

0.88::acc(s1, gender).
0.85::acc(s8, gender).

0.95::true_val(gender, unisex); 0.05::true_val(gender, unk_gender).

measured(s1, gender, unisex).
measured(s8, gender, unisex).

all_consistent(gender) :-
    (indep(s1), consistent(s1, gender) ; \+indep(s1)),
    (indep(s8), consistent(s8, gender) ; \+indep(s8)).

evidence(all_consistent(gender)).
query(true_val(gender, unisex)).
query(true_val(gender, unk_gender)).

% @attr design_inspiration
% @type categorical
% @canonical false
% @original_name Design inspiration
% @values evolution_fish_split=Evolution_of_Burton_Fish_into_splitboard unk_design_inspiration=Unknown
% @importance 0.90

0.88::acc(s_merchant, design_inspiration).

0.90::true_val(design_inspiration, evolution_fish_split); 0.10::true_val(design_inspiration, unk_design_inspiration).

measured(s_merchant, design_inspiration, evolution_fish_split).

all_consistent(design_inspiration) :- (indep(s_merchant), consistent(s_merchant, design_inspiration) ; \+indep(s_merchant)).

evidence(all_consistent(design_inspiration)).
query(true_val(design_inspiration, evolution_fish_split)).
query(true_val(design_inspiration, unk_design_inspiration)).

% @attr model_first_available_year
% @type numeric
% @canonical true
% @original_name model_first_available_year
% @values v2021=2021 v2025_26=2025.5
% @importance 0.78

0.72::acc(s9, model_first_available_year).
0.82::acc(s6, model_first_available_year).

0.40::true_val(model_first_available_year, v2021); 0.60::true_val(model_first_available_year, v2025_26).

measured(s9, model_first_available_year, v2021).
measured(s6, model_first_available_year, v2025_26).

all_consistent(model_first_available_year) :-
    consistent(s9, model_first_available_year),
    consistent(s6, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, v2021)).
query(true_val(model_first_available_year, v2025_26)).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values burton_fish_split=Burton_Fish_Splitboard_discontinued unk_predecessor_model_name=Unknown
% @importance 0.88

0.82::acc(s6, predecessor_model_name).
0.75::acc(s9, predecessor_model_name).

0.90::true_val(predecessor_model_name, burton_fish_split); 0.10::true_val(predecessor_model_name, unk_predecessor_model_name).

measured(s6, predecessor_model_name, burton_fish_split).
measured(s9, predecessor_model_name, burton_fish_split).

all_consistent(predecessor_model_name) :-
    consistent(s6, predecessor_model_name),
    consistent(s9, predecessor_model_name).

evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, burton_fish_split)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).

% @attr sku_merchant
% @type categorical
% @canonical false
% @original_name SKU (merchant)
% @values sku_2437410a03rg156=2437410A03RG156 unk_sku_merchant=Unknown
% @importance 0.85

0.97::acc(s_merchant, sku_merchant).

0.95::true_val(sku_merchant, sku_2437410a03rg156); 0.05::true_val(sku_merchant, unk_sku_merchant).

measured(s_merchant, sku_merchant, sku_2437410a03rg156).

all_consistent(sku_merchant) :- consistent(s_merchant, sku_merchant).

evidence(all_consistent(sku_merchant)).
query(true_val(sku_merchant, sku_2437410a03rg156)).
query(true_val(sku_merchant, unk_sku_merchant)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v999_95=999.95 unk_price_usd_msrp=Unknown
% @importance 0.95

0.93::acc(s10, price_usd_msrp).
0.80::acc(s6, price_usd_msrp).

0.95::true_val(price_usd_msrp, v999_95); 0.05::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s10, price_usd_msrp, v999_95).
measured(s6, price_usd_msrp, v999_95).

all_consistent(price_usd_msrp) :-
    consistent(s10, price_usd_msrp),
    consistent(s6, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v999_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_usd_evo
% @type numeric
% @canonical true
% @original_name price_usd_evo
% @unit USD
% @values v699_96=699.96 unk_price_usd_evo=Unknown
% @importance 0.95

0.95::acc(s10, price_usd_evo).

0.95::true_val(price_usd_evo, v699_96); 0.05::true_val(price_usd_evo, unk_price_usd_evo).

measured(s10, price_usd_evo, v699_96).

all_consistent(price_usd_evo) :- consistent(s10, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v699_96)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_aud_merchant
% @type numeric
% @canonical true
% @original_name price_aud_merchant
% @unit AUD
% @values v1119_99=1119.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.97::acc(s_merchant, price_aud_merchant).

0.95::true_val(price_aud_merchant, v1119_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s_merchant, price_aud_merchant, v1119_99).

all_consistent(price_aud_merchant) :- consistent(s_merchant, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v1119_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_usd_nonsplit_reference
% @type categorical
% @canonical false
% @original_name Non-split 3D Fish price at Burton US
% @values nonsplit_659_split_1029=Nonsplit_659_95_Split_1029_95 unk_price_usd_nonsplit_reference=Unknown
% @importance 0.78

0.70::acc(s11, price_usd_nonsplit_reference).
0.68::acc(s12, price_usd_nonsplit_reference).

0.80::true_val(price_usd_nonsplit_reference, nonsplit_659_split_1029); 0.20::true_val(price_usd_nonsplit_reference, unk_price_usd_nonsplit_reference).

measured(s11, price_usd_nonsplit_reference, nonsplit_659_split_1029).
measured(s12, price_usd_nonsplit_reference, nonsplit_659_split_1029).

all_consistent(price_usd_nonsplit_reference) :-
    consistent(s11, price_usd_nonsplit_reference),
    consistent(s12, price_usd_nonsplit_reference).

evidence(all_consistent(price_usd_nonsplit_reference)).
query(true_val(price_usd_nonsplit_reference, nonsplit_659_split_1029)).
query(true_val(price_usd_nonsplit_reference, unk_price_usd_nonsplit_reference)).

% @attr price_usd_backcountry
% @type numeric
% @canonical true
% @original_name price_usd_backcountry
% @unit USD
% @values v543_96_to_799_96=543.96 unk_price_usd_backcountry=Unknown
% @importance 0.85

0.68::acc(s12, price_usd_backcountry).

0.72::true_val(price_usd_backcountry, v543_96_to_799_96); 0.28::true_val(price_usd_backcountry, unk_price_usd_backcountry).

measured(s12, price_usd_backcountry, v543_96_to_799_96).

all_consistent(price_usd_backcountry) :- consistent(s12, price_usd_backcountry).

evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v543_96_to_799_96)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values in_stock_evo=In_stock_evo_com unk_availability_status=Unknown
% @importance 0.95

0.93::acc(s10, availability_status).

0.95::true_val(availability_status, in_stock_evo); 0.05::true_val(availability_status, unk_availability_status).

measured(s10, availability_status, in_stock_evo).

all_consistent(availability_status) :- consistent(s10, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, in_stock_evo)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_backcountry
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_backcountry=Available_Backcountry_com unk_availability_status_backcountry=Unknown
% @importance 0.85

0.85::acc(s3, availability_status_backcountry).

0.90::true_val(availability_status_backcountry, available_backcountry); 0.10::true_val(availability_status_backcountry, unk_availability_status_backcountry).

measured(s3, availability_status_backcountry, available_backcountry).

all_consistent(availability_status_backcountry) :- (indep(s3), consistent(s3, availability_status_backcountry) ; \+indep(s3)).

evidence(all_consistent(availability_status_backcountry)).
query(true_val(availability_status_backcountry, available_backcountry)).
query(true_val(availability_status_backcountry, unk_availability_status_backcountry)).

% @attr availability_status_amazon
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_amazon=Available_Amazon unk_availability_status_amazon=Unknown
% @importance 0.65

0.78::acc(s4, availability_status_amazon).
0.75::acc(s5, availability_status_amazon).

0.90::true_val(availability_status_amazon, available_amazon); 0.10::true_val(availability_status_amazon, unk_availability_status_amazon).

measured(s4, availability_status_amazon, available_amazon).
measured(s5, availability_status_amazon, available_amazon).

all_consistent(availability_status_amazon) :-
    (indep(s4), consistent(s4, availability_status_amazon) ; \+indep(s4)),
    (indep(s5), consistent(s5, availability_status_amazon) ; \+indep(s5)).

evidence(all_consistent(availability_status_amazon)).
query(true_val(availability_status_amazon, available_amazon)).
query(true_val(availability_status_amazon, unk_availability_status_amazon)).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_blauer=Available_Blauer_Board_Shop unk_availability_status_blauer=Unknown
% @importance 0.90

0.85::acc(s1, availability_status_blauer).

0.90::true_val(availability_status_blauer, available_blauer); 0.10::true_val(availability_status_blauer, unk_availability_status_blauer).

measured(s1, availability_status_blauer, available_blauer).

all_consistent(availability_status_blauer) :- (indep(s1), consistent(s1, availability_status_blauer) ; \+indep(s1)).

evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, available_blauer)).
query(true_val(availability_status_blauer, unk_availability_status_blauer)).

% @attr availability_status_source_boards
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_source=Available_The_Source unk_availability_status_source_boards=Unknown
% @importance 0.75

0.80::acc(s14, availability_status_source_boards).

0.88::true_val(availability_status_source_boards, available_source); 0.12::true_val(availability_status_source_boards, unk_availability_status_source_boards).

measured(s14, availability_status_source_boards, available_source).

all_consistent(availability_status_source_boards) :- (indep(s14), consistent(s14, availability_status_source_boards) ; \+indep(s14)).

evidence(all_consistent(availability_status_source_boards)).
query(true_val(availability_status_source_boards, available_source)).
query(true_val(availability_status_source_boards, unk_availability_status_source_boards)).

% @attr availability_status_level_nine
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_l9=Available_Level_Nine_Sports unk_availability_status_level_nine=Unknown
% @importance 0.80

0.78::acc(s9, availability_status_level_nine).

0.85::true_val(availability_status_level_nine, available_l9); 0.15::true_val(availability_status_level_nine, unk_availability_status_level_nine).

measured(s9, availability_status_level_nine, available_l9).

all_consistent(availability_status_level_nine) :- consistent(s9, availability_status_level_nine).

evidence(all_consistent(availability_status_level_nine)).
query(true_val(availability_status_level_nine, available_l9)).
query(true_val(availability_status_level_nine, unk_availability_status_level_nine)).

% @attr availability_status_steep_cheap
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_steep=Available_Steep_and_Cheap unk_availability_status_steep_cheap=Unknown
% @importance 0.60

0.78::acc(s13, availability_status_steep_cheap).

0.85::true_val(availability_status_steep_cheap, available_steep); 0.15::true_val(availability_status_steep_cheap, unk_availability_status_steep_cheap).

measured(s13, availability_status_steep_cheap, available_steep).

all_consistent(availability_status_steep_cheap) :- (indep(s13), consistent(s13, availability_status_steep_cheap) ; \+indep(s13)).

evidence(all_consistent(availability_status_steep_cheap)).
query(true_val(availability_status_steep_cheap, available_steep)).
query(true_val(availability_status_steep_cheap, unk_availability_status_steep_cheap)).

% @attr availability_status_gravity
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_gravity=Available_Gravity_Coalition unk_availability_status_gravity=Unknown
% @importance 0.75

0.78::acc(s14, availability_status_gravity).

0.85::true_val(availability_status_gravity, available_gravity); 0.15::true_val(availability_status_gravity, unk_availability_status_gravity).

measured(s14, availability_status_gravity, available_gravity).

all_consistent(availability_status_gravity) :- (indep(s14), consistent(s14, availability_status_gravity) ; \+indep(s14)).

evidence(all_consistent(availability_status_gravity)).
query(true_val(availability_status_gravity, available_gravity)).
query(true_val(availability_status_gravity, unk_availability_status_gravity)).

% @attr availability_status_alt113
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_alt113=Available_Alternative113 unk_availability_status_alt113=Unknown
% @importance 0.70

0.75::acc(s15, availability_status_alt113).

0.85::true_val(availability_status_alt113, available_alt113); 0.15::true_val(availability_status_alt113, unk_availability_status_alt113).

measured(s15, availability_status_alt113, available_alt113).

all_consistent(availability_status_alt113) :- (indep(s15), consistent(s15, availability_status_alt113) ; \+indep(s15)).

evidence(all_consistent(availability_status_alt113)).
query(true_val(availability_status_alt113, available_alt113)).
query(true_val(availability_status_alt113, unk_availability_status_alt113)).

% @attr availability_status_garceau
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_garceau=Available_Boutique_Garceau_Canada unk_availability_status_garceau=Unknown
% @importance 0.50

0.72::acc(s16, availability_status_garceau).

0.82::true_val(availability_status_garceau, available_garceau); 0.18::true_val(availability_status_garceau, unk_availability_status_garceau).

measured(s16, availability_status_garceau, available_garceau).

all_consistent(availability_status_garceau) :- (indep(s16), consistent(s16, availability_status_garceau) ; \+indep(s16)).

evidence(all_consistent(availability_status_garceau)).
query(true_val(availability_status_garceau, available_garceau)).
query(true_val(availability_status_garceau, unk_availability_status_garceau)).

% @attr availability_status_eriks
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_eriks=Available_ERIKS_some_sold_out unk_availability_status_eriks=Unknown
% @importance 0.68

0.80::acc(s8, availability_status_eriks).

0.85::true_val(availability_status_eriks, available_eriks); 0.15::true_val(availability_status_eriks, unk_availability_status_eriks).

measured(s8, availability_status_eriks, available_eriks).

all_consistent(availability_status_eriks) :- (indep(s8), consistent(s8, availability_status_eriks) ; \+indep(s8)).

evidence(all_consistent(availability_status_eriks)).
query(true_val(availability_status_eriks, available_eriks)).
query(true_val(availability_status_eriks, unk_availability_status_eriks)).

% @attr availability_status_salty_peaks
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_salty=Available_Salty_Peaks unk_availability_status_salty_peaks=Unknown
% @importance 0.40

0.75::acc(s21, availability_status_salty_peaks).

0.82::true_val(availability_status_salty_peaks, available_salty); 0.18::true_val(availability_status_salty_peaks, unk_availability_status_salty_peaks).

measured(s21, availability_status_salty_peaks, available_salty).

all_consistent(availability_status_salty_peaks) :- (indep(s21), consistent(s21, availability_status_salty_peaks) ; \+indep(s21)).

evidence(all_consistent(availability_status_salty_peaks)).
query(true_val(availability_status_salty_peaks, available_salty)).
query(true_val(availability_status_salty_peaks, unk_availability_status_salty_peaks)).

% @attr shipping_restriction_merchant
% @type categorical
% @canonical false
% @original_name Melbourne Snowboard shipping restriction
% @values australia_only=Australia_only unk_shipping_restriction_merchant=Unknown
% @importance 0.85

0.96::acc(s_merchant, shipping_restriction_merchant).

0.95::true_val(shipping_restriction_merchant, australia_only); 0.05::true_val(shipping_restriction_merchant, unk_shipping_restriction_merchant).

measured(s_merchant, shipping_restriction_merchant, australia_only).

all_consistent(shipping_restriction_merchant) :- consistent(s_merchant, shipping_restriction_merchant).

evidence(all_consistent(shipping_restriction_merchant)).
query(true_val(shipping_restriction_merchant, australia_only)).
query(true_val(shipping_restriction_merchant, unk_shipping_restriction_merchant)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values jones_libtech_capita=Jones_Solution_Lib_Tech_Escalator_CAPiTA_Navigator unk_comparable_board_cross_brand=Unknown
% @importance 0.95

0.88::acc(s10, comparable_board_cross_brand).

0.90::true_val(comparable_board_cross_brand, jones_libtech_capita); 0.10::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s10, comparable_board_cross_brand, jones_libtech_capita).

all_consistent(comparable_board_cross_brand) :- consistent(s10, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, jones_libtech_capita)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 0.88

0.90::acc(s_merchant, shape).

0.93::true_val(shape, tapered_directional); 0.07::true_val(shape, unk_shape).

measured(s_merchant, shape, tapered_directional).

all_consistent(shape) :- (indep(s_merchant), consistent(s_merchant, shape) ; \+indep(s_merchant)).

evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

% @attr tail_design
% @type categorical
% @canonical false
% @original_name Tail design
% @values double_swallowtail=Double_swallowtail unk_tail_design=Unknown
% @importance 0.90

0.88::acc(s1, tail_design).
0.88::acc(s_merchant, tail_design).

0.95::true_val(tail_design, double_swallowtail); 0.05::true_val(tail_design, unk_tail_design).

measured(s1, tail_design, double_swallowtail).
measured(s_merchant, tail_design, double_swallowtail).

all_consistent(tail_design) :-
    (indep(s1), consistent(s1, tail_design) ; \+indep(s1)),
    (indep(s_merchant), consistent(s_merchant, tail_design) ; \+indep(s_merchant)).

evidence(all_consistent(tail_design)).
query(true_val(tail_design, double_swallowtail)).
query(true_val(tail_design, unk_tail_design)).

% @attr base_3d_technology
% @type categorical
% @canonical false
% @original_name 3D base technology
% @values convex_3d_nose_tail=Surfboard_inspired_3D_convex_nose_and_tail unk_base_3d_technology=Unknown
% @importance 0.90

0.88::acc(s1, base_3d_technology).

0.90::true_val(base_3d_technology, convex_3d_nose_tail); 0.10::true_val(base_3d_technology, unk_base_3d_technology).

measured(s1, base_3d_technology, convex_3d_nose_tail).

all_consistent(base_3d_technology) :- (indep(s1), consistent(s1, base_3d_technology) ; \+indep(s1)).

evidence(all_consistent(base_3d_technology)).
query(true_val(base_3d_technology, convex_3d_nose_tail)).
query(true_val(base_3d_technology, unk_base_3d_technology)).

% @attr taper
% @type numeric
% @canonical true
% @original_name taper
% @unit mm
% @values v30=30.0 unk_taper=Unknown
% @importance 0.75

0.78::acc(s9, taper).
0.82::acc(s22, taper).

0.93::true_val(taper, v30); 0.07::true_val(taper, unk_taper).

measured(s9, taper, v30).
measured(s22, taper, v30).

all_consistent(taper) :-
    consistent(s9, taper),
    (indep(s22), consistent(s22, taper) ; \+indep(s22)).

evidence(all_consistent(taper)).
query(true_val(taper, v30)).
query(true_val(taper, unk_taper)).

% @attr shortened_overall_length
% @type categorical
% @canonical false
% @original_name Shortened overall length
% @values reduced_for_manoeuvrability=Reduced_length_for_sharpened_manoeuvrability unk_shortened_overall_length=Unknown
% @importance 0.90

0.85::acc(s_merchant, shortened_overall_length).

0.88::true_val(shortened_overall_length, reduced_for_manoeuvrability); 0.12::true_val(shortened_overall_length, unk_shortened_overall_length).

measured(s_merchant, shortened_overall_length, reduced_for_manoeuvrability).

all_consistent(shortened_overall_length) :- (indep(s_merchant), consistent(s_merchant, shortened_overall_length) ; \+indep(s_merchant)).

evidence(all_consistent(shortened_overall_length)).
query(true_val(shortened_overall_length, reduced_for_manoeuvrability)).
query(true_val(shortened_overall_length, unk_shortened_overall_length)).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values hourglass_instant_turns=Hourglass_sidecut_instantaneous_short_medium_turns unk_sidecut_type=Unknown
% @importance 0.95

0.92::acc(s23, sidecut_type).

0.92::true_val(sidecut_type, hourglass_instant_turns); 0.08::true_val(sidecut_type, unk_sidecut_type).

measured(s23, sidecut_type, hourglass_instant_turns).

all_consistent(sidecut_type) :- consistent(s23, sidecut_type).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, hourglass_instant_turns)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values directional_flat_top=Directional_Flat_Top_flat_between_feet_rocker_nose unk_camber_type=Unknown
% @importance 0.90

0.88::acc(s1, camber_type).
0.88::acc(s_merchant, camber_type).

0.95::true_val(camber_type, directional_flat_top); 0.05::true_val(camber_type, unk_camber_type).

measured(s1, camber_type, directional_flat_top).
measured(s_merchant, camber_type, directional_flat_top).

all_consistent(camber_type) :-
    (indep(s1), consistent(s1, camber_type) ; \+indep(s1)),
    (indep(s_merchant), consistent(s_merchant, camber_type) ; \+indep(s_merchant)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, directional_flat_top)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values flat_stability_rocker_float=Flat_between_feet_stability_rocker_nose_float unk_camber_description=Unknown
% @importance 0.90

0.88::acc(s1, camber_description).

0.90::true_val(camber_description, flat_stability_rocker_float); 0.10::true_val(camber_description, unk_camber_description).

measured(s1, camber_description, flat_stability_rocker_float).

all_consistent(camber_description) :- (indep(s1), consistent(s1, camber_description) ; \+indep(s1)).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, flat_stability_rocker_float)).
query(true_val(camber_description, unk_camber_description)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @original_name flex_rating_10
% @unit /10
% @values v4_5=4.5 v6=6.0
% @importance 0.83

0.87::acc(s_merchant, flex_rating_10).
0.72::acc(s9, flex_rating_10).

0.55::true_val(flex_rating_10, v4_5); 0.45::true_val(flex_rating_10, v6).

measured(s_merchant, flex_rating_10, v4_5).
measured(s9, flex_rating_10, v6).

all_consistent(flex_rating_10) :-
    (indep(s_merchant), consistent(s_merchant, flex_rating_10) ; \+indep(s_merchant)),
    consistent(s9, flex_rating_10).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v4_5)).
query(true_val(flex_rating_10, v6)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values mid_flex=Mid_flex med_stiff_variable=Med_stiff_between_feet_soft_nose_med_stiff_tail softest_split=One_of_softest_splits_ever
% @importance 0.90

0.83::acc(s_merchant, flex_feel).
0.82::acc(s24, flex_feel).
0.92::acc(s23, flex_feel).

0.35::true_val(flex_feel, mid_flex); 0.30::true_val(flex_feel, med_stiff_variable); 0.35::true_val(flex_feel, softest_split).

measured(s_merchant, flex_feel, mid_flex).
measured(s24, flex_feel, med_stiff_variable).
measured(s23, flex_feel, softest_split).

all_consistent(flex_feel) :-
    (indep(s_merchant), consistent(s_merchant, flex_feel) ; \+indep(s_merchant)),
    consistent(s24, flex_feel),
    consistent(s23, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, mid_flex)).
query(true_val(flex_feel, med_stiff_variable)).
query(true_val(flex_feel, softest_split)).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values directional_flex=Directional_flex_pop_tail_stiff_nose unk_flex_direction=Unknown
% @importance 0.90

0.88::acc(s1, flex_direction).

0.90::true_val(flex_direction, directional_flex); 0.10::true_val(flex_direction, unk_flex_direction).

measured(s1, flex_direction, directional_flex).

all_consistent(flex_direction) :- (indep(s1), consistent(s1, flex_direction) ; \+indep(s1)).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional_flex)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr core_profiling
% @type categorical
% @canonical false
% @original_name Core profiling
% @values squeezebox=Squeezebox_thick_thin_balance unk_core_profiling=Unknown
% @importance 0.90

0.88::acc(s1, core_profiling).

0.90::true_val(core_profiling, squeezebox); 0.10::true_val(core_profiling, unk_core_profiling).

measured(s1, core_profiling, squeezebox).

all_consistent(core_profiling) :- (indep(s1), consistent(s1, core_profiling) ; \+indep(s1)).

evidence(all_consistent(core_profiling)).
query(true_val(core_profiling, squeezebox)).
query(true_val(core_profiling, unk_core_profiling)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values super_fly_ii_700g=Super_Fly_II_700G_Dualzone_EGD_FSC_dual_species unk_core_material=Unknown
% @importance 0.81

0.88::acc(s1, core_material).
0.88::acc(s_merchant, core_material).
0.82::acc(s14, core_material).
0.78::acc(s15, core_material).

0.95::true_val(core_material, super_fly_ii_700g); 0.05::true_val(core_material, unk_core_material).

measured(s1, core_material, super_fly_ii_700g).
measured(s_merchant, core_material, super_fly_ii_700g).
measured(s14, core_material, super_fly_ii_700g).
measured(s15, core_material, super_fly_ii_700g).

all_consistent(core_material) :-
    (indep(s1), consistent(s1, core_material) ; \+indep(s1)),
    (indep(s_merchant), consistent(s_merchant, core_material) ; \+indep(s_merchant)),
    (indep(s14), consistent(s14, core_material) ; \+indep(s14)),
    (indep(s15), consistent(s15, core_material) ; \+indep(s15)).

evidence(all_consistent(core_material)).
query(true_val(core_material, super_fly_ii_700g)).
query(true_val(core_material, unk_core_material)).

% @attr core_technology_dualzone_egd
% @type categorical
% @canonical false
% @original_name Core technology - Dualzone EGD
% @values wood_grain_heel_toe=Wood_grain_aligned_heel_toe_edge_perpendicular_for_edge_hold unk_core_technology_dualzone_egd=Unknown
% @importance 0.90

0.88::acc(s_merchant, core_technology_dualzone_egd).

0.90::true_val(core_technology_dualzone_egd, wood_grain_heel_toe); 0.10::true_val(core_technology_dualzone_egd, unk_core_technology_dualzone_egd).

measured(s_merchant, core_technology_dualzone_egd, wood_grain_heel_toe).

all_consistent(core_technology_dualzone_egd) :- (indep(s_merchant), consistent(s_merchant, core_technology_dualzone_egd) ; \+indep(s_merchant)).

evidence(all_consistent(core_technology_dualzone_egd)).
query(true_val(core_technology_dualzone_egd, wood_grain_heel_toe)).
query(true_val(core_technology_dualzone_egd, unk_core_technology_dualzone_egd)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values carbon_highlights_45=45_degree_Carbon_Highlights_tip_to_tail unk_laminate=Unknown
% @importance 0.87

0.88::acc(s1, laminate).
0.88::acc(s_merchant, laminate).
0.78::acc(s9, laminate).

0.95::true_val(laminate, carbon_highlights_45); 0.05::true_val(laminate, unk_laminate).

measured(s1, laminate, carbon_highlights_45).
measured(s_merchant, laminate, carbon_highlights_45).
measured(s9, laminate, carbon_highlights_45).

all_consistent(laminate) :-
    (indep(s1), consistent(s1, laminate) ; \+indep(s1)),
    (indep(s_merchant), consistent(s_merchant, laminate) ; \+indep(s_merchant)),
    consistent(s9, laminate).

evidence(all_consistent(laminate)).
query(true_val(laminate, carbon_highlights_45)).
query(true_val(laminate, unk_laminate)).

% @attr laminate_fiber_angle_effect
% @type categorical
% @canonical false
% @original_name laminate
% @values aggressive_45_angle=45_degree_fiber_more_aggressive_ride unk_laminate_fiber_angle_effect=Unknown
% @importance 0.90

0.85::acc(s1, laminate_fiber_angle_effect).

0.88::true_val(laminate_fiber_angle_effect, aggressive_45_angle); 0.12::true_val(laminate_fiber_angle_effect, unk_laminate_fiber_angle_effect).

measured(s1, laminate_fiber_angle_effect, aggressive_45_angle).

all_consistent(laminate_fiber_angle_effect) :- (indep(s1), consistent(s1, laminate_fiber_angle_effect) ; \+indep(s1)).

evidence(all_consistent(laminate_fiber_angle_effect)).
query(true_val(laminate_fiber_angle_effect, aggressive_45_angle)).
query(true_val(laminate_fiber_angle_effect, unk_laminate_fiber_angle_effect)).

% @attr laminate_mystery_glass
% @type categorical
% @canonical false
% @original_name laminate
% @values mystery_glass=Mystery_Glass_fiberglass_carbon_blend unk_laminate_mystery_glass=Unknown
% @importance 0.75

0.82::acc(s14, laminate_mystery_glass).

0.85::true_val(laminate_mystery_glass, mystery_glass); 0.15::true_val(laminate_mystery_glass, unk_laminate_mystery_glass).

measured(s14, laminate_mystery_glass, mystery_glass).

all_consistent(laminate_mystery_glass) :- (indep(s14), consistent(s14, laminate_mystery_glass) ; \+indep(s14)).

evidence(all_consistent(laminate_mystery_glass)).
query(true_val(laminate_mystery_glass, mystery_glass)).
query(true_val(laminate_mystery_glass, unk_laminate_mystery_glass)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_wfo=Sintered_WFO_high_density_wax_infused unk_base_material=Unknown
% @importance 0.90

0.88::acc(s1, base_material).
0.88::acc(s_merchant, base_material).

0.95::true_val(base_material, sintered_wfo); 0.05::true_val(base_material, unk_base_material).

measured(s1, base_material, sintered_wfo).
measured(s_merchant, base_material, sintered_wfo).

all_consistent(base_material) :-
    (indep(s1), consistent(s1, base_material) ; \+indep(s1)),
    (indep(s_merchant), consistent(s_merchant, base_material) ; \+indep(s_merchant)).

evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_wfo)).
query(true_val(base_material, unk_base_material)).

% @attr resin
% @type categorical
% @canonical true
% @original_name resin
% @values super_sap_epoxy=Super_Sap_Epoxy_bio_based_50pct_carbon_reduction unk_resin=Unknown
% @importance 0.90

0.88::acc(s1, resin).

0.90::true_val(resin, super_sap_epoxy); 0.10::true_val(resin, unk_resin).

measured(s1, resin, super_sap_epoxy).

all_consistent(resin) :- (indep(s1), consistent(s1, resin) ; \+indep(s1)).

evidence(all_consistent(resin)).
query(true_val(resin, super_sap_epoxy)).
query(true_val(resin, unk_resin)).

% @attr factory_treatment
% @type categorical
% @canonical false
% @original_name Factory treatment
% @values infinite_ride=Infinite_Ride_overbuilt_machine_broken_in unk_factory_treatment=Unknown
% @importance 0.90

0.88::acc(s1, factory_treatment).

0.90::true_val(factory_treatment, infinite_ride); 0.10::true_val(factory_treatment, unk_factory_treatment).

measured(s1, factory_treatment, infinite_ride).

all_consistent(factory_treatment) :- (indep(s1), consistent(s1, factory_treatment) ; \+indep(s1)).

evidence(all_consistent(factory_treatment)).
query(true_val(factory_treatment, infinite_ride)).
query(true_val(factory_treatment, unk_factory_treatment)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values slimrail_slanted=Slimrail_slanted_sidewalls_reduced_weight unk_sidewall_material=Unknown
% @importance 0.75

0.80::acc(s9, sidewall_material).

0.82::true_val(sidewall_material, slimrail_slanted); 0.18::true_val(sidewall_material, unk_sidewall_material).

measured(s9, sidewall_material, slimrail_slanted).

all_consistent(sidewall_material) :- consistent(s9, sidewall_material).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, slimrail_slanted)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values fsc_certified_core=FSC_Certified_core_woods unk_sustainability_certification=Unknown
% @importance 0.70

0.78::acc(s15, sustainability_certification).

0.85::true_val(sustainability_certification, fsc_certified_core); 0.15::true_val(sustainability_certification, unk_sustainability_certification).

measured(s15, sustainability_certification, fsc_certified_core).

all_consistent(sustainability_certification) :- (indep(s15), consistent(s15, sustainability_certification) ; \+indep(s15)).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, fsc_certified_core)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values split_channel=The_Split_Channel_with_pre_mounted_pucks unk_mounting_pattern=Unknown
% @importance 0.90

0.88::acc(s1, mounting_pattern).
0.88::acc(s_merchant, mounting_pattern).

0.95::true_val(mounting_pattern, split_channel); 0.05::true_val(mounting_pattern, unk_mounting_pattern).

measured(s1, mounting_pattern, split_channel).
measured(s_merchant, mounting_pattern, split_channel).

all_consistent(mounting_pattern) :-
    (indep(s1), consistent(s1, mounting_pattern) ; \+indep(s1)),
    (indep(s_merchant), consistent(s_merchant, mounting_pattern) ; \+indep(s_merchant)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, split_channel)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values all_major_bindings=Compatible_with_all_major_bindings unk_binding_compatibility=Unknown
% @importance 0.90

0.88::acc(s1, binding_compatibility).

0.90::true_val(binding_compatibility, all_major_bindings); 0.10::true_val(binding_compatibility, unk_binding_compatibility).

measured(s1, binding_compatibility, all_major_bindings).

all_consistent(binding_compatibility) :- (indep(s1), consistent(s1, binding_compatibility) ; \+indep(s1)).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, all_major_bindings)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

% @attr pre_mounted_pucks
% @type categorical
% @canonical false
% @original_name Pre-mounted pucks
% @values yes_pucks=Yes_comes_with_binding_pucks unk_pre_mounted_pucks=Unknown
% @importance 0.95

0.85::acc(s6, pre_mounted_pucks).

0.88::true_val(pre_mounted_pucks, yes_pucks); 0.12::true_val(pre_mounted_pucks, unk_pre_mounted_pucks).

measured(s6, pre_mounted_pucks, yes_pucks).

all_consistent(pre_mounted_pucks) :- consistent(s6, pre_mounted_pucks).

evidence(all_consistent(pre_mounted_pucks)).
query(true_val(pre_mounted_pucks, yes_pucks)).
query(true_val(pre_mounted_pucks, unk_pre_mounted_pucks)).

% @attr recommended_binding
% @type categorical
% @canonical false
% @original_name Recommended binding
% @values burton_step_on_split=Burton_Step_On_Splitboard_Binding unk_recommended_binding=Unknown
% @importance 0.95

0.82::acc(s6, recommended_binding).

0.85::true_val(recommended_binding, burton_step_on_split); 0.15::true_val(recommended_binding, unk_recommended_binding).

measured(s6, recommended_binding, burton_step_on_split).

all_consistent(recommended_binding) :- consistent(s6, recommended_binding).

evidence(all_consistent(recommended_binding)).
query(true_val(recommended_binding, burton_step_on_split)).
query(true_val(recommended_binding, unk_recommended_binding)).

% @attr skin_compatibility_note
% @type categorical
% @canonical false
% @original_name Skin compatibility note
% @values burton_skins_best=Burton_proprietary_skins_best_for_swallowtail unk_skin_compatibility_note=Unknown
% @importance 0.95

0.85::acc(s6, skin_compatibility_note).

0.88::true_val(skin_compatibility_note, burton_skins_best); 0.12::true_val(skin_compatibility_note, unk_skin_compatibility_note).

measured(s6, skin_compatibility_note, burton_skins_best).

all_consistent(skin_compatibility_note) :- consistent(s6, skin_compatibility_note).

evidence(all_consistent(skin_compatibility_note)).
query(true_val(skin_compatibility_note, burton_skins_best)).
query(true_val(skin_compatibility_note, unk_skin_compatibility_note)).

% @attr splitboard_function
% @type categorical
% @canonical false
% @original_name Splitboard function
% @values splits_two_halves=Splits_into_two_halves_for_touring unk_splitboard_function=Unknown
% @importance 0.85

0.85::acc(s8, splitboard_function).

0.92::true_val(splitboard_function, splits_two_halves); 0.08::true_val(splitboard_function, unk_splitboard_function).

measured(s8, splitboard_function, splits_two_halves).

all_consistent(splitboard_function) :- (indep(s8), consistent(s8, splitboard_function) ; \+indep(s8)).

evidence(all_consistent(splitboard_function)).
query(true_val(splitboard_function, splits_two_halves)).
query(true_val(splitboard_function, unk_splitboard_function)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values sizes_146_151_156_161=146_151_156_161cm unk_available_sizes=Unknown
% @importance 0.83

0.80::acc(s9, available_sizes).
0.85::acc(s8, available_sizes).

0.95::true_val(available_sizes, sizes_146_151_156_161); 0.05::true_val(available_sizes, unk_available_sizes).

measured(s9, available_sizes, sizes_146_151_156_161).
measured(s8, available_sizes, sizes_146_151_156_161).

all_consistent(available_sizes) :-
    consistent(s9, available_sizes),
    (indep(s8), consistent(s8, available_sizes) ; \+indep(s8)).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, sizes_146_151_156_161)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr effective_edge_146
% @type numeric
% @canonical false
% @original_name Effective edge 146cm
% @unit mm
% @values v995=995.0 unk_effective_edge_146=Unknown
% @importance 0.85

0.93::acc(s_merchant, effective_edge_146).

0.90::true_val(effective_edge_146, v995); 0.10::true_val(effective_edge_146, unk_effective_edge_146).

measured(s_merchant, effective_edge_146, v995).

all_consistent(effective_edge_146) :- consistent(s_merchant, effective_edge_146).

evidence(all_consistent(effective_edge_146)).
query(true_val(effective_edge_146, v995)).
query(true_val(effective_edge_146, unk_effective_edge_146)).

% @attr sidecut_radius_size_146
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v5_4=5.4 unk_sidecut_radius_size_146=Unknown
% @importance 0.85

0.93::acc(s_merchant, sidecut_radius_size_146).

0.90::true_val(sidecut_radius_size_146, v5_4); 0.10::true_val(sidecut_radius_size_146, unk_sidecut_radius_size_146).

measured(s_merchant, sidecut_radius_size_146, v5_4).

all_consistent(sidecut_radius_size_146) :- consistent(s_merchant, sidecut_radius_size_146).

evidence(all_consistent(sidecut_radius_size_146)).
query(true_val(sidecut_radius_size_146, v5_4)).
query(true_val(sidecut_radius_size_146, unk_sidecut_radius_size_146)).

% @attr tip_width_146
% @type numeric
% @canonical false
% @original_name tip_tail_width_size
% @unit mm
% @values v303_6=303.6 unk_tip_width_146=Unknown
% @importance 0.85

0.93::acc(s_merchant, tip_width_146).

0.90::true_val(tip_width_146, v303_6); 0.10::true_val(tip_width_146, unk_tip_width_146).

measured(s_merchant, tip_width_146, v303_6).

all_consistent(tip_width_146) :- consistent(s_merchant, tip_width_146).

evidence(all_consistent(tip_width_146)).
query(true_val(tip_width_146, v303_6)).
query(true_val(tip_width_146, unk_tip_width_146)).

% @attr tail_width_146
% @type numeric
% @canonical false
% @original_name tip_tail_width_size
% @unit mm
% @values v273_6=273.6 unk_tail_width_146=Unknown
% @importance 0.85

0.93::acc(s_merchant, tail_width_146).

0.90::true_val(tail_width_146, v273_6); 0.10::true_val(tail_width_146, unk_tail_width_146).

measured(s_merchant, tail_width_146, v273_6).

all_consistent(tail_width_146) :- consistent(s_merchant, tail_width_146).

evidence(all_consistent(tail_width_146)).
query(true_val(tail_width_146, v273_6)).
query(true_val(tail_width_146, unk_tail_width_146)).

% @attr waist_width_146
% @type numeric
% @canonical false
% @original_name Waist width 146cm
% @unit mm
% @values v252=252.0 unk_waist_width_146=Unknown
% @importance 0.85

0.93::acc(s_merchant, waist_width_146).

0.90::true_val(waist_width_146, v252); 0.10::true_val(waist_width_146, unk_waist_width_146).

measured(s_merchant, waist_width_146, v252).

all_consistent(waist_width_146) :- consistent(s_merchant, waist_width_146).

evidence(all_consistent(waist_width_146)).
query(true_val(waist_width_146, v252)).
query(true_val(waist_width_146, unk_waist_width_146)).

% @attr recommended_weight_range_size_146
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @unit kg
% @values w45_68=45_68kg unk_recommended_weight_range_size_146=Unknown
% @importance 0.85

0.93::acc(s_merchant, recommended_weight_range_size_146).

0.90::true_val(recommended_weight_range_size_146, w45_68); 0.10::true_val(recommended_weight_range_size_146, unk_recommended_weight_range_size_146).

measured(s_merchant, recommended_weight_range_size_146, w45_68).

all_consistent(recommended_weight_range_size_146) :- consistent(s_merchant, recommended_weight_range_size_146).

evidence(all_consistent(recommended_weight_range_size_146)).
query(true_val(recommended_weight_range_size_146, w45_68)).
query(true_val(recommended_weight_range_size_146, unk_recommended_weight_range_size_146)).

% @attr effective_edge_151
% @type numeric
% @canonical false
% @original_name Effective edge 151cm
% @unit mm
% @values v1045=1045.0 unk_effective_edge_151=Unknown
% @importance 0.85

0.93::acc(s_merchant, effective_edge_151).

0.90::true_val(effective_edge_151, v1045); 0.10::true_val(effective_edge_151, unk_effective_edge_151).

measured(s_merchant, effective_edge_151, v1045).

all_consistent(effective_edge_151) :- consistent(s_merchant, effective_edge_151).

evidence(all_consistent(effective_edge_151)).
query(true_val(effective_edge_151, v1045)).
query(true_val(effective_edge_151, unk_effective_edge_151)).

% @attr sidecut_radius_size_151
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v5_8=5.8 unk_sidecut_radius_size_151=Unknown
% @importance 0.85

0.93::acc(s_merchant, sidecut_radius_size_151).

0.90::true_val(sidecut_radius_size_151, v5_8); 0.10::true_val(sidecut_radius_size_151, unk_sidecut_radius_size_151).

measured(s_merchant, sidecut_radius_size_151, v5_8).

all_consistent(sidecut_radius_size_151) :- consistent(s_merchant, sidecut_radius_size_151).

evidence(all_consistent(sidecut_radius_size_151)).
query(true_val(sidecut_radius_size_151, v5_8)).
query(true_val(sidecut_radius_size_151, unk_sidecut_radius_size_151)).

% @attr tip_width_151
% @type numeric
% @canonical false
% @original_name tip_tail_width_size
% @unit mm
% @values v311_5=311.5 unk_tip_width_151=Unknown
% @importance 0.85

0.93::acc(s_merchant, tip_width_151).

0.90::true_val(tip_width_151, v311_5); 0.10::true_val(tip_width_151, unk_tip_width_151).

measured(s_merchant, tip_width_151, v311_5).

all_consistent(tip_width_151) :- consistent(s_merchant, tip_width_151).

evidence(all_consistent(tip_width_151)).
query(true_val(tip_width_151, v311_5)).
query(true_val(tip_width_151, unk_tip_width_151)).

% @attr tail_width_151
% @type numeric
% @canonical false
% @original_name tip_tail_width_size
% @unit mm
% @values v281_5=281.5 unk_tail_width_151=Unknown
% @importance 0.85

0.93::acc(s_merchant, tail_width_151).

0.90::true_val(tail_width_151, v281_5); 0.10::true_val(tail_width_151, unk_tail_width_151).

measured(s_merchant, tail_width_151, v281_5).

all_consistent(tail_width_151) :- consistent(s_merchant, tail_width_151).

evidence(all_consistent(tail_width_151)).
query(true_val(tail_width_151, v281_5)).
query(true_val(tail_width_151, unk_tail_width_151)).

% @attr waist_width_151
% @type numeric
% @canonical false
% @original_name Waist width 151cm
% @unit mm
% @values v258=258.0 unk_waist_width_151=Unknown
% @importance 0.85

0.93::acc(s_merchant, waist_width_151).

0.90::true_val(waist_width_151, v258); 0.10::true_val(waist_width_151, unk_waist_width_151).

measured(s_merchant, waist_width_151, v258).

all_consistent(waist_width_151) :- consistent(s_merchant, waist_width_151).

evidence(all_consistent(waist_width_151)).
query(true_val(waist_width_151, v258)).
query(true_val(waist_width_151, unk_waist_width_151)).

% @attr recommended_weight_range_size_151
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @unit kg
% @values w54_82=54_82kg unk_recommended_weight_range_size_151=Unknown
% @importance 0.85

0.93::acc(s_merchant, recommended_weight_range_size_151).

0.90::true_val(recommended_weight_range_size_151, w54_82); 0.10::true_val(recommended_weight_range_size_151, unk_recommended_weight_range_size_151).

measured(s_merchant, recommended_weight_range_size_151, w54_82).

all_consistent(recommended_weight_range_size_151) :- consistent(s_merchant, recommended_weight_range_size_151).

evidence(all_consistent(recommended_weight_range_size_151)).
query(true_val(recommended_weight_range_size_151, w54_82)).
query(true_val(recommended_weight_range_size_151, unk_recommended_weight_range_size_151)).

% @attr effective_edge_156
% @type numeric
% @canonical false
% @original_name Effective edge 156cm
% @unit mm
% @values v1095=1095.0 unk_effective_edge_156=Unknown
% @importance 0.85

0.93::acc(s_merchant, effective_edge_156).

0.90::true_val(effective_edge_156, v1095); 0.10::true_val(effective_edge_156, unk_effective_edge_156).

measured(s_merchant, effective_edge_156, v1095).

all_consistent(effective_edge_156) :- consistent(s_merchant, effective_edge_156).

evidence(all_consistent(effective_edge_156)).
query(true_val(effective_edge_156, v1095)).
query(true_val(effective_edge_156, unk_effective_edge_156)).

% @attr sidecut_radius_size
% @type numeric
% @canonical true
% @original_name sidecut_radius_size
% @unit m
% @values v6_1=6.1 unk_sidecut_radius_size=Unknown
% @importance 0.85

0.93::acc(s_merchant, sidecut_radius_size).

0.90::true_val(sidecut_radius_size, v6_1); 0.10::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s_merchant, sidecut_radius_size, v6_1).

all_consistent(sidecut_radius_size) :- consistent(s_merchant, sidecut_radius_size).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v6_1)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr tip_tail_width_size
% @type numeric
% @canonical true
% @original_name tip_tail_width_size
% @unit mm
% @values v315_3=315.3 unk_tip_tail_width_size=Unknown
% @importance 0.85

0.93::acc(s_merchant, tip_tail_width_size).

0.90::true_val(tip_tail_width_size, v315_3); 0.10::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s_merchant, tip_tail_width_size, v315_3).

all_consistent(tip_tail_width_size) :- consistent(s_merchant, tip_tail_width_size).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v315_3)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr tail_width_156
% @type numeric
% @canonical false
% @original_name tip_tail_width_size
% @unit mm
% @values v285_3=285.3 unk_tail_width_156=Unknown
% @importance 0.85

0.93::acc(s_merchant, tail_width_156).

0.90::true_val(tail_width_156, v285_3); 0.10::true_val(tail_width_156, unk_tail_width_156).

measured(s_merchant, tail_width_156, v285_3).

all_consistent(tail_width_156) :- consistent(s_merchant, tail_width_156).

evidence(all_consistent(tail_width_156)).
query(true_val(tail_width_156, v285_3)).
query(true_val(tail_width_156, unk_tail_width_156)).

% @attr waist_width_156
% @type numeric
% @canonical false
% @original_name Waist width 156cm
% @unit mm
% @values v260=260.0 unk_waist_width_156=Unknown
% @importance 0.85

0.93::acc(s_merchant, waist_width_156).

0.90::true_val(waist_width_156, v260); 0.10::true_val(waist_width_156, unk_waist_width_156).

measured(s_merchant, waist_width_156, v260).

all_consistent(waist_width_156) :- consistent(s_merchant, waist_width_156).

evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v260)).
query(true_val(waist_width_156, unk_waist_width_156)).

% @attr stance_width_range_size
% @type numeric
% @canonical true
% @original_name stance_width_range_size
% @unit mm
% @values v560=560.0 unk_stance_width_range_size=Unknown
% @importance 0.85

0.93::acc(s_merchant, stance_width_range_size).

0.90::true_val(stance_width_range_size, v560); 0.10::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s_merchant, stance_width_range_size, v560).

all_consistent(stance_width_range_size) :- consistent(s_merchant, stance_width_range_size).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v560)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr setback
% @type numeric
% @canonical true
% @original_name setback
% @unit mm
% @values vn50=-50.0 unk_setback=Unknown
% @importance 0.85

0.93::acc(s_merchant, setback).

0.90::true_val(setback, vn50); 0.10::true_val(setback, unk_setback).

measured(s_merchant, setback, vn50).

all_consistent(setback) :- consistent(s_merchant, setback).

evidence(all_consistent(setback)).
query(true_val(setback, vn50)).
query(true_val(setback, unk_setback)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size
% @unit kg
% @values w68_91=68_91kg unk_recommended_weight_range_size=Unknown
% @importance 0.85

0.93::acc(s_merchant, recommended_weight_range_size).

0.90::true_val(recommended_weight_range_size, w68_91); 0.10::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s_merchant, recommended_weight_range_size, w68_91).

all_consistent(recommended_weight_range_size) :- consistent(s_merchant, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w68_91)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr effective_edge_161
% @type numeric
% @canonical false
% @original_name Effective edge 161cm
% @unit mm
% @values v1145=1145.0 unk_effective_edge_161=Unknown
% @importance 0.85

0.93::acc(s_merchant, effective_edge_161).

0.90::true_val(effective_edge_161, v1145); 0.10::true_val(effective_edge_161, unk_effective_edge_161).

measured(s_merchant, effective_edge_161, v1145).

all_consistent(effective_edge_161) :- consistent(s_merchant, effective_edge_161).

evidence(all_consistent(effective_edge_161)).
query(true_val(effective_edge_161, v1145)).
query(true_val(effective_edge_161, unk_effective_edge_161)).

% @attr sidecut_radius_size_161
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v6_4=6.4 unk_sidecut_radius_size_161=Unknown
% @importance 0.85

0.93::acc(s_merchant, sidecut_radius_size_161).

0.90::true_val(sidecut_radius_size_161, v6_4); 0.10::true_val(sidecut_radius_size_161, unk_sidecut_radius_size_161).

measured(s_merchant, sidecut_radius_size_161, v6_4).

all_consistent(sidecut_radius_size_161) :- consistent(s_merchant, sidecut_radius_size_161).

evidence(all_consistent(sidecut_radius_size_161)).
query(true_val(sidecut_radius_size_161, v6_4)).
query(true_val(sidecut_radius_size_161, unk_sidecut_radius_size_161)).

% @attr tip_width_161
% @type numeric
% @canonical false
% @original_name tip_tail_width_size
% @unit mm
% @values v319_1=319.1 unk_tip_width_161=Unknown
% @importance 0.85

0.93::acc(s_merchant, tip_width_161).

0.90::true_val(tip_width_161, v319_1); 0.10::true_val(tip_width_161, unk_tip_width_161).

measured(s_merchant, tip_width_161, v319_1).

all_consistent(tip_width_161) :- consistent(s_merchant, tip_width_161).

evidence(all_consistent(tip_width_161)).
query(true_val(tip_width_161, v319_1)).
query(true_val(tip_width_161, unk_tip_width_161)).

% @attr tail_width_161
% @type numeric
% @canonical false
% @original_name tip_tail_width_size
% @unit mm
% @values v289_1=289.1 unk_tail_width_161=Unknown
% @importance 0.85

0.93::acc(s_merchant, tail_width_161).

0.90::true_val(tail_width_161, v289_1); 0.10::true_val(tail_width_161, unk_tail_width_161).

measured(s_merchant, tail_width_161, v289_1).

all_consistent(tail_width_161) :- consistent(s_merchant, tail_width_161).

evidence(all_consistent(tail_width_161)).
query(true_val(tail_width_161, v289_1)).
query(true_val(tail_width_161, unk_tail_width_161)).

% @attr waist_width_161
% @type numeric
% @canonical false
% @original_name Waist width 161cm
% @unit mm
% @values v262=262.0 unk_waist_width_161=Unknown
% @importance 0.85

0.93::acc(s_merchant, waist_width_161).

0.90::true_val(waist_width_161, v262); 0.10::true_val(waist_width_161, unk_waist_width_161).

measured(s_merchant, waist_width_161, v262).

all_consistent(waist_width_161) :- consistent(s_merchant, waist_width_161).

evidence(all_consistent(waist_width_161)).
query(true_val(waist_width_161, v262)).
query(true_val(waist_width_161, unk_waist_width_161)).

% @attr recommended_weight_range_size_161
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @unit kg
% @values w82_118plus=82_118plus_kg unk_recommended_weight_range_size_161=Unknown
% @importance 0.85

0.93::acc(s_merchant, recommended_weight_range_size_161).

0.90::true_val(recommended_weight_range_size_161, w82_118plus); 0.10::true_val(recommended_weight_range_size_161, unk_recommended_weight_range_size_161).

measured(s_merchant, recommended_weight_range_size_161, w82_118plus).

all_consistent(recommended_weight_range_size_161) :- consistent(s_merchant, recommended_weight_range_size_161).

evidence(all_consistent(recommended_weight_range_size_161)).
query(true_val(recommended_weight_range_size_161, w82_118plus)).
query(true_val(recommended_weight_range_size_161, unk_recommended_weight_range_size_161)).

% @attr contact_length_size
% @type numeric
% @canonical true
% @original_name contact_length_size
% @unit mm
% @values v1040=1040.0 unk_contact_length_size=Unknown
% @importance 0.80

0.78::acc(s9, contact_length_size).

0.82::true_val(contact_length_size, v1040); 0.18::true_val(contact_length_size, unk_contact_length_size).

measured(s9, contact_length_size, v1040).

all_consistent(contact_length_size) :- consistent(s9, contact_length_size).

evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v1040)).
query(true_val(contact_length_size, unk_contact_length_size)).

% @attr board_weight_grams
% @type numeric
% @canonical true
% @original_name board_weight_grams
% @unit g
% @values v2900=2900.0 unk_board_weight_grams=Unknown
% @importance 0.75

0.75::acc(s9, board_weight_grams).

0.78::true_val(board_weight_grams, v2900); 0.22::true_val(board_weight_grams, unk_board_weight_grams).

measured(s9, board_weight_grams, v2900).

all_consistent(board_weight_grams) :- consistent(s9, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v2900)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr weight_category
% @type categorical
% @canonical false
% @original_name Weight category
% @values lighter_side_normal=On_lighter_side_of_normal unk_weight_category=Unknown
% @importance 0.85

0.78::acc(s24, weight_category).

0.80::true_val(weight_category, lighter_side_normal); 0.20::true_val(weight_category, unk_weight_category).

measured(s24, weight_category, lighter_side_normal).

all_consistent(weight_category) :- consistent(s24, weight_category).

evidence(all_consistent(weight_category)).
query(true_val(weight_category, lighter_side_normal)).
query(true_val(weight_category, unk_weight_category)).

% @attr weight_note
% @type categorical
% @canonical false
% @original_name Weight note
% @values wood_core_inconsistent=Wood_cores_no_consistency_between_units unk_weight_note=Unknown
% @importance 0.85

0.78::acc(s24, weight_note).

0.80::true_val(weight_note, wood_core_inconsistent); 0.20::true_val(weight_note, unk_weight_note).

measured(s24, weight_note, wood_core_inconsistent).

all_consistent(weight_note) :- consistent(s24, weight_note).

evidence(all_consistent(weight_note)).
query(true_val(weight_note, wood_core_inconsistent)).
query(true_val(weight_note, unk_weight_note)).

% @attr terrain_suitability_groomed
% @type numeric
% @canonical false
% @original_name terrain_suitability
% @unit /10
% @values v2=2.0 unk_terrain_suitability_groomed=Unknown
% @importance 0.83

0.88::acc(s_merchant, terrain_suitability_groomed).
0.78::acc(s9, terrain_suitability_groomed).

0.92::true_val(terrain_suitability_groomed, v2); 0.08::true_val(terrain_suitability_groomed, unk_terrain_suitability_groomed).

measured(s_merchant, terrain_suitability_groomed, v2).
measured(s9, terrain_suitability_groomed, v2).

all_consistent(terrain_suitability_groomed) :-
    (indep(s_merchant), consistent(s_merchant, terrain_suitability_groomed) ; \+indep(s_merchant)),
    consistent(s9, terrain_suitability_groomed).

evidence(all_consistent(terrain_suitability_groomed)).
query(true_val(terrain_suitability_groomed, v2)).
query(true_val(terrain_suitability_groomed, unk_terrain_suitability_groomed)).

% @attr terrain_suitability_all_mountain
% @type numeric
% @canonical false
% @original_name terrain_suitability
% @unit /10
% @values v4=4.0 unk_terrain_suitability_all_mountain=Unknown
% @importance 0.83

0.88::acc(s_merchant, terrain_suitability_all_mountain).
0.78::acc(s9, terrain_suitability_all_mountain).

0.92::true_val(terrain_suitability_all_mountain, v4); 0.08::true_val(terrain_suitability_all_mountain, unk_terrain_suitability_all_mountain).

measured(s_merchant, terrain_suitability_all_mountain, v4).
measured(s9, terrain_suitability_all_mountain, v4).

all_consistent(terrain_suitability_all_mountain) :-
    (indep(s_merchant), consistent(s_merchant, terrain_suitability_all_mountain) ; \+indep(s_merchant)),
    consistent(s9, terrain_suitability_all_mountain).

evidence(all_consistent(terrain_suitability_all_mountain)).
query(true_val(terrain_suitability_all_mountain, v4)).
query(true_val(terrain_suitability_all_mountain, unk_terrain_suitability_all_mountain)).

% @attr terrain_suitability_powder_rating
% @type numeric
% @canonical false
% @original_name terrain_suitability
% @unit /10
% @values v10=10.0 unk_terrain_suitability_powder_rating=Unknown
% @importance 0.83

0.88::acc(s_merchant, terrain_suitability_powder_rating).
0.78::acc(s9, terrain_suitability_powder_rating).

0.95::true_val(terrain_suitability_powder_rating, v10); 0.05::true_val(terrain_suitability_powder_rating, unk_terrain_suitability_powder_rating).

measured(s_merchant, terrain_suitability_powder_rating, v10).
measured(s9, terrain_suitability_powder_rating, v10).

all_consistent(terrain_suitability_powder_rating) :-
    (indep(s_merchant), consistent(s_merchant, terrain_suitability_powder_rating) ; \+indep(s_merchant)),
    consistent(s9, terrain_suitability_powder_rating).

evidence(all_consistent(terrain_suitability_powder_rating)).
query(true_val(terrain_suitability_powder_rating, v10)).
query(true_val(terrain_suitability_powder_rating, unk_terrain_suitability_powder_rating)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate=Intermediate expert_powder_bc=Expert_Powder_Backcountry advanced_expert=Advanced_Expert
% @importance 0.83

0.78::acc(s_merchant, rider_level).
0.80::acc(s4, rider_level).
0.85::acc(s8, rider_level).

0.10::true_val(rider_level, intermediate); 0.35::true_val(rider_level, expert_powder_bc); 0.55::true_val(rider_level, advanced_expert).

measured(s_merchant, rider_level, intermediate).
measured(s4, rider_level, expert_powder_bc).
measured(s8, rider_level, advanced_expert).

all_consistent(rider_level) :-
    (indep(s_merchant), consistent(s_merchant, rider_level) ; \+indep(s_merchant)),
    (indep(s4), consistent(s4, rider_level) ; \+indep(s4)),
    (indep(s8), consistent(s8, rider_level) ; \+indep(s8)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate)).
query(true_val(rider_level, expert_powder_bc)).
query(true_val(rider_level, advanced_expert)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard=Standard_not_wide unk_width_options=Unknown
% @importance 0.85

0.88::acc(s_merchant, width_options).

0.90::true_val(width_options, standard); 0.10::true_val(width_options, unk_width_options).

measured(s_merchant, width_options, standard).

all_consistent(width_options) :- (indep(s_merchant), consistent(s_merchant, width_options) ; \+indep(s_merchant)).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard)).
query(true_val(width_options, unk_width_options)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values deep_powder_bc_trees=Deep_powder_backcountry_trees unk_terrain_suitability=Unknown
% @importance 0.88

0.88::acc(s_merchant, terrain_suitability).
0.88::acc(s1, terrain_suitability).

0.95::true_val(terrain_suitability, deep_powder_bc_trees); 0.05::true_val(terrain_suitability, unk_terrain_suitability).

measured(s_merchant, terrain_suitability, deep_powder_bc_trees).
measured(s1, terrain_suitability, deep_powder_bc_trees).

all_consistent(terrain_suitability) :-
    (indep(s_merchant), consistent(s_merchant, terrain_suitability) ; \+indep(s_merchant)),
    (indep(s1), consistent(s1, terrain_suitability) ; \+indep(s1)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, deep_powder_bc_trees)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr riding_style
% @type categorical
% @canonical false
% @original_name riding_style
% @values bc_splitboarding_powder=Backcountry_splitboarding_powder_surfing unk_riding_style=Unknown
% @importance 0.85

0.88::acc(s_merchant, riding_style).

0.92::true_val(riding_style, bc_splitboarding_powder); 0.08::true_val(riding_style, unk_riding_style).

measured(s_merchant, riding_style, bc_splitboarding_powder).

all_consistent(riding_style) :- (indep(s_merchant), consistent(s_merchant, riding_style) ; \+indep(s_merchant)).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, bc_splitboarding_powder)).
query(true_val(riding_style, unk_riding_style)).

% @attr terrain_suitability_storm_trees
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values storm_trees_bigmtn=Storm_days_tight_trees_big_mountain_powder unk_terrain_suitability_storm_trees=Unknown
% @importance 0.85

0.85::acc(s3, terrain_suitability_storm_trees).

0.88::true_val(terrain_suitability_storm_trees, storm_trees_bigmtn); 0.12::true_val(terrain_suitability_storm_trees, unk_terrain_suitability_storm_trees).

measured(s3, terrain_suitability_storm_trees, storm_trees_bigmtn).

all_consistent(terrain_suitability_storm_trees) :- (indep(s3), consistent(s3, terrain_suitability_storm_trees) ; \+indep(s3)).

evidence(all_consistent(terrain_suitability_storm_trees)).
query(true_val(terrain_suitability_storm_trees, storm_trees_bigmtn)).
query(true_val(terrain_suitability_storm_trees, unk_terrain_suitability_storm_trees)).

% @attr terrain_suitability_touring
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values powder_touring_deep=Powder_touring_and_deep_snow_riding unk_terrain_suitability_touring=Unknown
% @importance 0.80

0.82::acc(s4, terrain_suitability_touring).

0.85::true_val(terrain_suitability_touring, powder_touring_deep); 0.15::true_val(terrain_suitability_touring, unk_terrain_suitability_touring).

measured(s4, terrain_suitability_touring, powder_touring_deep).

all_consistent(terrain_suitability_touring) :- (indep(s4), consistent(s4, terrain_suitability_touring) ; \+indep(s4)).

evidence(all_consistent(terrain_suitability_touring)).
query(true_val(terrain_suitability_touring, powder_touring_deep)).
query(true_val(terrain_suitability_touring, unk_terrain_suitability_touring)).

% @attr recommended_skin_setup
% @type categorical
% @canonical false
% @original_name Recommended skin setup
% @values burton_proprietary=Burton_proprietary_skins_recommended unk_recommended_skin_setup=Unknown
% @importance 0.95

0.85::acc(s6, recommended_skin_setup).

0.88::true_val(recommended_skin_setup, burton_proprietary); 0.12::true_val(recommended_skin_setup, unk_recommended_skin_setup).

measured(s6, recommended_skin_setup, burton_proprietary).

all_consistent(recommended_skin_setup) :- consistent(s6, recommended_skin_setup).

evidence(all_consistent(recommended_skin_setup)).
query(true_val(recommended_skin_setup, burton_proprietary)).
query(true_val(recommended_skin_setup, unk_recommended_skin_setup)).

% @attr equipment_needed
% @type categorical
% @canonical false
% @original_name Equipment needed
% @values split_bindings_skins_avy=Splitboard_bindings_skins_avalanche_gear unk_equipment_needed=Unknown
% @importance 0.85

0.85::acc(s8, equipment_needed).

0.92::true_val(equipment_needed, split_bindings_skins_avy); 0.08::true_val(equipment_needed, unk_equipment_needed).

measured(s8, equipment_needed, split_bindings_skins_avy).

all_consistent(equipment_needed) :- (indep(s8), consistent(s8, equipment_needed) ; \+indep(s8)).

evidence(all_consistent(equipment_needed)).
query(true_val(equipment_needed, split_bindings_skins_avy)).
query(true_val(equipment_needed, unk_equipment_needed)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values unsinkable=Unsinkable_exceptional_float unk_positive_aspect=Unknown
% @importance 0.95

0.92::acc(s23, positive_aspect).

0.93::true_val(positive_aspect, unsinkable); 0.07::true_val(positive_aspect, unk_positive_aspect).

measured(s23, positive_aspect, unsinkable).

all_consistent(positive_aspect) :- consistent(s23, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, unsinkable)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr positive_aspect_surfy
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values surfy_best_way=Really_felt_surfy_best_possible_way unk_positive_aspect_surfy=Unknown
% @importance 0.95

0.85::acc(s6, positive_aspect_surfy).

0.88::true_val(positive_aspect_surfy, surfy_best_way); 0.12::true_val(positive_aspect_surfy, unk_positive_aspect_surfy).

measured(s6, positive_aspect_surfy, surfy_best_way).

all_consistent(positive_aspect_surfy) :- consistent(s6, positive_aspect_surfy).

evidence(all_consistent(positive_aspect_surfy)).
query(true_val(positive_aspect_surfy, surfy_best_way)).
query(true_val(positive_aspect_surfy, unk_positive_aspect_surfy)).

% @attr positive_aspect_trees
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values favorite_trees=Reviewers_favorite_for_jamming_through_trees unk_positive_aspect_trees=Unknown
% @importance 0.85

0.82::acc(s24, positive_aspect_trees).

0.85::true_val(positive_aspect_trees, favorite_trees); 0.15::true_val(positive_aspect_trees, unk_positive_aspect_trees).

measured(s24, positive_aspect_trees, favorite_trees).

all_consistent(positive_aspect_trees) :- consistent(s24, positive_aspect_trees).

evidence(all_consistent(positive_aspect_trees)).
query(true_val(positive_aspect_trees, favorite_trees)).
query(true_val(positive_aspect_trees, unk_positive_aspect_trees)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values instantaneous_short_med=Instantaneous_short_medium_turns_rapid_edge_energy unk_turn_initiation_performance=Unknown
% @importance 0.95

0.92::acc(s23, turn_initiation_performance).

0.93::true_val(turn_initiation_performance, instantaneous_short_med); 0.07::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s23, turn_initiation_performance, instantaneous_short_med).

all_consistent(turn_initiation_performance) :- consistent(s23, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, instantaneous_short_med)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr positive_aspect_ease_of_use
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values ease_of_use_control=Ease_of_use_and_absolute_control unk_positive_aspect_ease_of_use=Unknown
% @importance 0.95

0.85::acc(s6, positive_aspect_ease_of_use).

0.88::true_val(positive_aspect_ease_of_use, ease_of_use_control); 0.12::true_val(positive_aspect_ease_of_use, unk_positive_aspect_ease_of_use).

measured(s6, positive_aspect_ease_of_use, ease_of_use_control).

all_consistent(positive_aspect_ease_of_use) :- consistent(s6, positive_aspect_ease_of_use).

evidence(all_consistent(positive_aspect_ease_of_use)).
query(true_val(positive_aspect_ease_of_use, ease_of_use_control)).
query(true_val(positive_aspect_ease_of_use, unk_positive_aspect_ease_of_use)).

% @attr pop
% @type categorical
% @canonical true
% @original_name pop
% @values pops_back_turns=Board_pops_back_in_and_out_of_turns good_not_exceptional=Good_but_not_exceptional
% @importance 0.90

0.85::acc(s6, pop).
0.82::acc(s24, pop).

0.55::true_val(pop, pops_back_turns); 0.45::true_val(pop, good_not_exceptional).

measured(s6, pop, pops_back_turns).
measured(s24, pop, good_not_exceptional).

all_consistent(pop) :-
    consistent(s6, pop),
    consistent(s24, pop).

evidence(all_consistent(pop)).
query(true_val(pop, pops_back_turns)).
query(true_val(pop, good_not_exceptional)).

% @attr positive_aspect_maneuverability
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values unique_maneuverability=Unique_maneuverability_in_splitboard_category unk_positive_aspect_maneuverability=Unknown
% @importance 0.85

0.85::acc(s6, positive_aspect_maneuverability).

0.88::true_val(positive_aspect_maneuverability, unique_maneuverability); 0.12::true_val(positive_aspect_maneuverability, unk_positive_aspect_maneuverability).

measured(s6, positive_aspect_maneuverability, unique_maneuverability).

all_consistent(positive_aspect_maneuverability) :- consistent(s6, positive_aspect_maneuverability).

evidence(all_consistent(positive_aspect_maneuverability)).
query(true_val(positive_aspect_maneuverability, unique_maneuverability)).
query(true_val(positive_aspect_maneuverability, unk_positive_aspect_maneuverability)).

% @attr volume_shift_sizing
% @type categorical
% @canonical false
% @original_name Volume shift sizing
% @values extra_width_compensates=Extra_width_nose_mid_compensates_shorter_length unk_volume_shift_sizing=Unknown
% @importance 0.95

0.85::acc(s6, volume_shift_sizing).

0.88::true_val(volume_shift_sizing, extra_width_compensates); 0.12::true_val(volume_shift_sizing, unk_volume_shift_sizing).

measured(s6, volume_shift_sizing, extra_width_compensates).

all_consistent(volume_shift_sizing) :- consistent(s6, volume_shift_sizing).

evidence(all_consistent(volume_shift_sizing)).
query(true_val(volume_shift_sizing, extra_width_compensates)).
query(true_val(volume_shift_sizing, unk_volume_shift_sizing)).

% @attr positive_aspect_stance_adjust
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values adjust_stance_no_drill=Underrated_adjust_stance_no_drilling unk_positive_aspect_stance_adjust=Unknown
% @importance 0.95

0.85::acc(s6, positive_aspect_stance_adjust).

0.88::true_val(positive_aspect_stance_adjust, adjust_stance_no_drill); 0.12::true_val(positive_aspect_stance_adjust, unk_positive_aspect_stance_adjust).

measured(s6, positive_aspect_stance_adjust, adjust_stance_no_drill).

all_consistent(positive_aspect_stance_adjust) :- consistent(s6, positive_aspect_stance_adjust).

evidence(all_consistent(positive_aspect_stance_adjust)).
query(true_val(positive_aspect_stance_adjust, adjust_stance_no_drill)).
query(true_val(positive_aspect_stance_adjust, unk_positive_aspect_stance_adjust)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values exceptional_initial=Exceptional_initial_glide unk_base_glide_performance=Unknown
% @importance 0.85

0.80::acc(s24, base_glide_performance).

0.82::true_val(base_glide_performance, exceptional_initial); 0.18::true_val(base_glide_performance, unk_base_glide_performance).

measured(s24, base_glide_performance, exceptional_initial).

all_consistent(base_glide_performance) :- consistent(s24, base_glide_performance).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, exceptional_initial)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr award
% @type categorical
% @canonical false
% @original_name Award
% @values bc_mag_2026_ec=Backcountry_Magazine_2026_Editors_Choice_Splitboard unk_award=Unknown
% @importance 0.95

0.93::acc(s23, award).

0.95::true_val(award, bc_mag_2026_ec); 0.05::true_val(award, unk_award).

measured(s23, award, bc_mag_2026_ec).

all_consistent(award) :- consistent(s23, award).

evidence(all_consistent(award)).
query(true_val(award, bc_mag_2026_ec)).
query(true_val(award, unk_award)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values not_steep_hard=Not_at_home_in_steep_hard_conditions unk_negative_aspect=Unknown
% @importance 0.95

0.85::acc(s6, negative_aspect).

0.88::true_val(negative_aspect, not_steep_hard); 0.12::true_val(negative_aspect, unk_negative_aspect).

measured(s6, negative_aspect, not_steep_hard).

all_consistent(negative_aspect) :- consistent(s6, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, not_steep_hard)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_nose_catchy
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values nose_catchy_firm=Nose_feels_catchy_maneuvering_firm_snow unk_negative_aspect_nose_catchy=Unknown
% @importance 0.95

0.85::acc(s6, negative_aspect_nose_catchy).

0.88::true_val(negative_aspect_nose_catchy, nose_catchy_firm); 0.12::true_val(negative_aspect_nose_catchy, unk_negative_aspect_nose_catchy).

measured(s6, negative_aspect_nose_catchy, nose_catchy_firm).

all_consistent(negative_aspect_nose_catchy) :- consistent(s6, negative_aspect_nose_catchy).

evidence(all_consistent(negative_aspect_nose_catchy)).
query(true_val(negative_aspect_nose_catchy, nose_catchy_firm)).
query(true_val(negative_aspect_nose_catchy, unk_negative_aspect_nose_catchy)).

% @attr negative_aspect_icy_useless
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values useless_windblown_icy=Completely_useless_in_windblown_or_icy_crust unk_negative_aspect_icy_useless=Unknown
% @importance 0.80

0.65::acc(s27, negative_aspect_icy_useless).

0.72::true_val(negative_aspect_icy_useless, useless_windblown_icy); 0.28::true_val(negative_aspect_icy_useless, unk_negative_aspect_icy_useless).

measured(s27, negative_aspect_icy_useless, useless_windblown_icy).

all_consistent(negative_aspect_icy_useless) :- consistent(s27, negative_aspect_icy_useless).

evidence(all_consistent(negative_aspect_icy_useless)).
query(true_val(negative_aspect_icy_useless, useless_windblown_icy)).
query(true_val(negative_aspect_icy_useless, unk_negative_aspect_icy_useless)).

% @attr negative_aspect_not_bombing
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values not_bombing_speed=Not_about_bombing_speed_more_for_turning unk_negative_aspect_not_bombing=Unknown
% @importance 0.85

0.82::acc(s24, negative_aspect_not_bombing).

0.85::true_val(negative_aspect_not_bombing, not_bombing_speed); 0.15::true_val(negative_aspect_not_bombing, unk_negative_aspect_not_bombing).

measured(s24, negative_aspect_not_bombing, not_bombing_speed).

all_consistent(negative_aspect_not_bombing) :- consistent(s24, negative_aspect_not_bombing).

evidence(all_consistent(negative_aspect_not_bombing)).
query(true_val(negative_aspect_not_bombing, not_bombing_speed)).
query(true_val(negative_aspect_not_bombing, unk_negative_aspect_not_bombing)).

% @attr negative_aspect_not_chop
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values not_chop_bumps=Not_for_powering_over_chopped_snow_or_bumps unk_negative_aspect_not_chop=Unknown
% @importance 0.85

0.82::acc(s24, negative_aspect_not_chop).

0.85::true_val(negative_aspect_not_chop, not_chop_bumps); 0.15::true_val(negative_aspect_not_chop, unk_negative_aspect_not_chop).

measured(s24, negative_aspect_not_chop, not_chop_bumps).

all_consistent(negative_aspect_not_chop) :- consistent(s24, negative_aspect_not_chop).

evidence(all_consistent(negative_aspect_not_chop)).
query(true_val(negative_aspect_not_chop, not_chop_bumps)).
query(true_val(negative_aspect_not_chop, unk_negative_aspect_not_chop)).

% @attr negative_aspect_base_chalky
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values base_chalky_wax=Base_gets_chalky_after_non_Burton_wax_needs_maintenance unk_negative_aspect_base_chalky=Unknown
% @importance 0.85

0.80::acc(s24, negative_aspect_base_chalky).

0.82::true_val(negative_aspect_base_chalky, base_chalky_wax); 0.18::true_val(negative_aspect_base_chalky, unk_negative_aspect_base_chalky).

measured(s24, negative_aspect_base_chalky, base_chalky_wax).

all_consistent(negative_aspect_base_chalky) :- consistent(s24, negative_aspect_base_chalky).

evidence(all_consistent(negative_aspect_base_chalky)).
query(true_val(negative_aspect_base_chalky, base_chalky_wax)).
query(true_val(negative_aspect_base_chalky, unk_negative_aspect_base_chalky)).

% @attr negative_aspect_waxing_difficult
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values waxing_laborious_3d=Hot_waxing_3D_base_laboriously_time_consuming unk_negative_aspect_waxing_difficult=Unknown
% @importance 0.75

0.78::acc(s9, negative_aspect_waxing_difficult).

0.80::true_val(negative_aspect_waxing_difficult, waxing_laborious_3d); 0.20::true_val(negative_aspect_waxing_difficult, unk_negative_aspect_waxing_difficult).

measured(s9, negative_aspect_waxing_difficult, waxing_laborious_3d).

all_consistent(negative_aspect_waxing_difficult) :- consistent(s9, negative_aspect_waxing_difficult).

evidence(all_consistent(negative_aspect_waxing_difficult)).
query(true_val(negative_aspect_waxing_difficult, waxing_laborious_3d)).
query(true_val(negative_aspect_waxing_difficult, unk_negative_aspect_waxing_difficult)).

% @attr switch_riding
% @type categorical
% @canonical false
% @original_name switch_riding
% @values not_designed_switch=Not_designed_for_switch_directional_shape unk_switch_riding=Unknown
% @importance 0.80

0.85::acc(s_merchant, switch_riding).

0.92::true_val(switch_riding, not_designed_switch); 0.08::true_val(switch_riding, unk_switch_riding).

measured(s_merchant, switch_riding, not_designed_switch).

all_consistent(switch_riding) :- (indep(s_merchant), consistent(s_merchant, switch_riding) ; \+indep(s_merchant)).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, not_designed_switch)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr skin_fit
% @type categorical
% @canonical false
% @original_name Skin fit
% @values swallowtail_generic_issue=Swallowtail_generic_skins_may_not_fit_Burton_recommended unk_skin_fit=Unknown
% @importance 0.95

0.85::acc(s6, skin_fit).

0.88::true_val(skin_fit, swallowtail_generic_issue); 0.12::true_val(skin_fit, unk_skin_fit).

measured(s6, skin_fit, swallowtail_generic_issue).

all_consistent(skin_fit) :- consistent(s6, skin_fit).

evidence(all_consistent(skin_fit)).
query(true_val(skin_fit, swallowtail_generic_issue)).
query(true_val(skin_fit, unk_skin_fit)).

% @attr comparable_board_cross_brand_japow
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values weston_japow=Weston_Japow unk_comparable_board_cross_brand_japow=Unknown
% @importance 0.95

0.82::acc(s6, comparable_board_cross_brand_japow).

0.85::true_val(comparable_board_cross_brand_japow, weston_japow); 0.15::true_val(comparable_board_cross_brand_japow, unk_comparable_board_cross_brand_japow).

measured(s6, comparable_board_cross_brand_japow, weston_japow).

all_consistent(comparable_board_cross_brand_japow) :- consistent(s6, comparable_board_cross_brand_japow).

evidence(all_consistent(comparable_board_cross_brand_japow)).
query(true_val(comparable_board_cross_brand_japow, weston_japow)).
query(true_val(comparable_board_cross_brand_japow, unk_comparable_board_cross_brand_japow)).

% @attr comparable_board_cross_brand_storm_chaser
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values jones_storm_chaser=Jones_Storm_Chaser unk_comparable_board_cross_brand_storm_chaser=Unknown
% @importance 0.95

0.82::acc(s6, comparable_board_cross_brand_storm_chaser).

0.85::true_val(comparable_board_cross_brand_storm_chaser, jones_storm_chaser); 0.15::true_val(comparable_board_cross_brand_storm_chaser, unk_comparable_board_cross_brand_storm_chaser).

measured(s6, comparable_board_cross_brand_storm_chaser, jones_storm_chaser).

all_consistent(comparable_board_cross_brand_storm_chaser) :- consistent(s6, comparable_board_cross_brand_storm_chaser).

evidence(all_consistent(comparable_board_cross_brand_storm_chaser)).
query(true_val(comparable_board_cross_brand_storm_chaser, jones_storm_chaser)).
query(true_val(comparable_board_cross_brand_storm_chaser, unk_comparable_board_cross_brand_storm_chaser)).

% @attr comparable_board_cross_brand_escalator
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values libtech_escalator=Lib_Tech_Escalator_Split_more_versatile unk_comparable_board_cross_brand_escalator=Unknown
% @importance 0.95

0.82::acc(s6, comparable_board_cross_brand_escalator).

0.85::true_val(comparable_board_cross_brand_escalator, libtech_escalator); 0.15::true_val(comparable_board_cross_brand_escalator, unk_comparable_board_cross_brand_escalator).

measured(s6, comparable_board_cross_brand_escalator, libtech_escalator).

all_consistent(comparable_board_cross_brand_escalator) :- consistent(s6, comparable_board_cross_brand_escalator).

evidence(all_consistent(comparable_board_cross_brand_escalator)).
query(true_val(comparable_board_cross_brand_escalator, libtech_escalator)).
query(true_val(comparable_board_cross_brand_escalator, unk_comparable_board_cross_brand_escalator)).

% @attr comparable_board_cross_brand_spring_break
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values capita_sb_jones_me=CAPiTA_Spring_Break_Powder_Glider_Tree_Hunter_Jones_Mind_Expander unk_comparable_board_cross_brand_spring_break=Unknown
% @importance 0.75

0.78::acc(s28, comparable_board_cross_brand_spring_break).

0.82::true_val(comparable_board_cross_brand_spring_break, capita_sb_jones_me); 0.18::true_val(comparable_board_cross_brand_spring_break, unk_comparable_board_cross_brand_spring_break).

measured(s28, comparable_board_cross_brand_spring_break, capita_sb_jones_me).

all_consistent(comparable_board_cross_brand_spring_break) :- consistent(s28, comparable_board_cross_brand_spring_break).

evidence(all_consistent(comparable_board_cross_brand_spring_break)).
query(true_val(comparable_board_cross_brand_spring_break, capita_sb_jones_me)).
query(true_val(comparable_board_cross_brand_spring_break, unk_comparable_board_cross_brand_spring_break)).

% @attr comparable_board_cross_brand_versatility
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values more_versatile_than_pow=More_versatile_than_Japow_Storm_Chaser unk_comparable_board_cross_brand_versatility=Unknown
% @importance 0.95

0.82::acc(s6, comparable_board_cross_brand_versatility).

0.85::true_val(comparable_board_cross_brand_versatility, more_versatile_than_pow); 0.15::true_val(comparable_board_cross_brand_versatility, unk_comparable_board_cross_brand_versatility).

measured(s6, comparable_board_cross_brand_versatility, more_versatile_than_pow).

all_consistent(comparable_board_cross_brand_versatility) :- consistent(s6, comparable_board_cross_brand_versatility).

evidence(all_consistent(comparable_board_cross_brand_versatility)).
query(true_val(comparable_board_cross_brand_versatility, more_versatile_than_pow)).
query(true_val(comparable_board_cross_brand_versatility, unk_comparable_board_cross_brand_versatility)).

% @attr heli_skiing_use
% @type categorical
% @canonical false
% @original_name Heli-skiing use
% @values largest_heli_stocks_fish=Worlds_largest_heli_operator_stocks_more_Fish_than_all_others unk_heli_skiing_use=Unknown
% @importance 0.70

0.58::acc(s29, heli_skiing_use).

0.65::true_val(heli_skiing_use, largest_heli_stocks_fish); 0.35::true_val(heli_skiing_use, unk_heli_skiing_use).

measured(s29, heli_skiing_use, largest_heli_stocks_fish).

all_consistent(heli_skiing_use) :- consistent(s29, heli_skiing_use).

evidence(all_consistent(heli_skiing_use)).
query(true_val(heli_skiing_use, largest_heli_stocks_fish)).
query(true_val(heli_skiing_use, unk_heli_skiing_use)).

% @attr warranty_period_years
% @type numeric
% @canonical true
% @original_name warranty_period_years
% @unit years
% @values v3=3.0 unk_warranty_period_years=Unknown
% @importance 0.80

0.93::acc(s30, warranty_period_years).

0.95::true_val(warranty_period_years, v3); 0.05::true_val(warranty_period_years, unk_warranty_period_years).

measured(s30, warranty_period_years, v3).

all_consistent(warranty_period_years) :- consistent(s30, warranty_period_years).

evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v3)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values free_defects_material=All_products_free_of_defects_material_workmanship unk_warranty=Unknown
% @importance 0.75

0.92::acc(s31, warranty).

0.93::true_val(warranty, free_defects_material); 0.07::true_val(warranty, unk_warranty).

measured(s31, warranty, free_defects_material).

all_consistent(warranty) :- consistent(s31, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, free_defects_material)).
query(true_val(warranty, unk_warranty)).

% @attr warranty_purchaser_requirement
% @type categorical
% @canonical false
% @original_name warranty
% @values original_purchaser_proof=Valid_original_purchaser_proof_from_authorized_retailer unk_warranty_purchaser_requirement=Unknown
% @importance 0.75

0.92::acc(s31, warranty_purchaser_requirement).

0.93::true_val(warranty_purchaser_requirement, original_purchaser_proof); 0.07::true_val(warranty_purchaser_requirement, unk_warranty_purchaser_requirement).

measured(s31, warranty_purchaser_requirement, original_purchaser_proof).

all_consistent(warranty_purchaser_requirement) :- consistent(s31, warranty_purchaser_requirement).

evidence(all_consistent(warranty_purchaser_requirement)).
query(true_val(warranty_purchaser_requirement, original_purchaser_proof)).
query(true_val(warranty_purchaser_requirement, unk_warranty_purchaser_requirement)).

% @attr warranty_exclusions
% @type categorical
% @canonical false
% @original_name warranty
% @values rock_impact_ebay_excluded=Rock_impact_damage_eBay_not_covered unk_warranty_exclusions=Unknown
% @importance 0.78

0.93::acc(s30, warranty_exclusions).
0.92::acc(s31, warranty_exclusions).

0.95::true_val(warranty_exclusions, rock_impact_ebay_excluded); 0.05::true_val(warranty_exclusions, unk_warranty_exclusions).

measured(s30, warranty_exclusions, rock_impact_ebay_excluded).
measured(s31, warranty_exclusions, rock_impact_ebay_excluded).

all_consistent(warranty_exclusions) :-
    consistent(s30, warranty_exclusions),
    consistent(s31, warranty_exclusions).

evidence(all_consistent(warranty_exclusions)).
query(true_val(warranty_exclusions, rock_impact_ebay_excluded)).
query(true_val(warranty_exclusions, unk_warranty_exclusions)).

% @attr return_policy_terms
% @type categorical
% @canonical true
% @original_name return_policy_terms
% @values unused_30_days_refund=Unused_original_packaging_30_days_full_refund unk_return_policy_terms=Unknown
% @importance 0.75

0.80::acc(s14, return_policy_terms).

0.82::true_val(return_policy_terms, unused_30_days_refund); 0.18::true_val(return_policy_terms, unk_return_policy_terms).

measured(s14, return_policy_terms, unused_30_days_refund).

all_consistent(return_policy_terms) :- (indep(s14), consistent(s14, return_policy_terms) ; \+indep(s14)).

evidence(all_consistent(return_policy_terms)).
query(true_val(return_policy_terms, unused_30_days_refund)).
query(true_val(return_policy_terms, unk_return_policy_terms)).

% @attr sustainability_certification_super_sap
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values super_sap_50pct=Super_Sap_Epoxy_50pct_carbon_reduction unk_sustainability_certification_super_sap=Unknown
% @importance 0.90

0.88::acc(s1, sustainability_certification_super_sap).

0.90::true_val(sustainability_certification_super_sap, super_sap_50pct); 0.10::true_val(sustainability_certification_super_sap, unk_sustainability_certification_super_sap).

measured(s1, sustainability_certification_super_sap, super_sap_50pct).

all_consistent(sustainability_certification_super_sap) :- (indep(s1), consistent(s1, sustainability_certification_super_sap) ; \+indep(s1)).

evidence(all_consistent(sustainability_certification_super_sap)).
query(true_val(sustainability_certification_super_sap, super_sap_50pct)).
query(true_val(sustainability_certification_super_sap, unk_sustainability_certification_super_sap)).

% @attr sustainability_certification_b_corp
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values certified_b_corp=Burton_is_certified_B_Corporation unk_sustainability_certification_b_corp=Unknown
% @importance 0.80

0.85::acc(s2, sustainability_certification_b_corp).

0.88::true_val(sustainability_certification_b_corp, certified_b_corp); 0.12::true_val(sustainability_certification_b_corp, unk_sustainability_certification_b_corp).

measured(s2, sustainability_certification_b_corp, certified_b_corp).

all_consistent(sustainability_certification_b_corp) :- consistent(s2, sustainability_certification_b_corp).

evidence(all_consistent(sustainability_certification_b_corp)).
query(true_val(sustainability_certification_b_corp, certified_b_corp)).
query(true_val(sustainability_certification_b_corp, unk_sustainability_certification_b_corp)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values rider_6ft_200lbs_156=6ft_200lbs_rode_156_felt_good unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.95

0.82::acc(s6, reviewer_opinion_the_good_ride).

0.85::true_val(reviewer_opinion_the_good_ride, rider_6ft_200lbs_156); 0.15::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s6, reviewer_opinion_the_good_ride, rider_6ft_200lbs_156).

all_consistent(reviewer_opinion_the_good_ride) :- consistent(s6, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, rider_6ft_200lbs_156)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr reviewer_opinion_the_good_ride_boot_size
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values size_156_boots_9_10=Size_156_best_US_boots_9_10 unk_reviewer_opinion_the_good_ride_boot_size=Unknown
% @importance 0.85

0.78::acc(s24, reviewer_opinion_the_good_ride_boot_size).

0.82::true_val(reviewer_opinion_the_good_ride_boot_size, size_156_boots_9_10); 0.18::true_val(reviewer_opinion_the_good_ride_boot_size, unk_reviewer_opinion_the_good_ride_boot_size).

measured(s24, reviewer_opinion_the_good_ride_boot_size, size_156_boots_9_10).

all_consistent(reviewer_opinion_the_good_ride_boot_size) :- consistent(s24, reviewer_opinion_the_good_ride_boot_size).

evidence(all_consistent(reviewer_opinion_the_good_ride_boot_size)).
query(true_val(reviewer_opinion_the_good_ride_boot_size, size_156_boots_9_10)).
query(true_val(reviewer_opinion_the_good_ride_boot_size, unk_reviewer_opinion_the_good_ride_boot_size)).