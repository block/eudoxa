0.15::indep(s1).
0.12::indep(s7).
0.15::indep(s12).
0.15::indep(s20).
0.12::indep(s30).
0.12::indep(s34).
0.15::indep(s40).
0.15::indep(s50).
0.15::indep(s56).
0.10::indep(s124).
0.15::indep(s48).
0.12::indep(s29).
0.15::indep(s123).
0.12::indep(s90).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values salomon=Salomon unk_brand=Unknown
% @importance 1.0

0.92::acc(s1, brand).

0.95::true_val(brand, salomon); 0.05::true_val(brand, unk_brand).

measured(s1, brand, salomon).

all_consistent(brand) :- consistent(s1, brand).

evidence(all_consistent(brand)).
query(true_val(brand, salomon)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values abstract=Abstract unk_model_name=Unknown
% @importance 1.0

0.92::acc(s1, model_name).

0.95::true_val(model_name, abstract); 0.05::true_val(model_name, unk_model_name).

measured(s1, model_name, abstract).

all_consistent(model_name) :- consistent(s1, model_name).

evidence(all_consistent(model_name)).
query(true_val(model_name, abstract)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2025=2025 unk_model_year=Unknown
% @importance 1.0

0.92::acc(s1, model_year).

0.95::true_val(model_year, y2025); 0.05::true_val(model_year, unk_model_year).

measured(s1, model_year, y2025).

all_consistent(model_year) :- consistent(s1, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2025)).
query(true_val(model_year, unk_model_year)).

% @attr sku
% @type categorical
% @canonical true
% @original_name SKU
% @values l47660800=L47660800 unk_sku=Unknown
% @importance 0.85

0.90::acc(s7, sku).
0.88::acc(s1, sku).

0.95::true_val(sku, l47660800); 0.05::true_val(sku, unk_sku).

measured(s7, sku, l47660800).
measured(s1, sku, l47660800).

all_consistent(sku) :-
    (indep(s7), consistent(s7, sku) ; \+indep(s7)),
    (indep(s1), consistent(s1, sku) ; \+indep(s1)).

evidence(all_consistent(sku)).
query(true_val(sku, l47660800)).
query(true_val(sku, unk_sku)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.92::acc(s1, product_type).

0.97::true_val(product_type, snowboard); 0.03::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).

all_consistent(product_type) :- consistent(s1, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain_park_freestyle=All_Mountain_Park_and_Freestyle unk_board_category=Unknown
% @importance 1.0

0.88::acc(s1, board_category).
0.85::acc(s7, board_category).

0.95::true_val(board_category, all_mountain_park_freestyle); 0.05::true_val(board_category, unk_board_category).

measured(s1, board_category, all_mountain_park_freestyle).
measured(s7, board_category, all_mountain_park_freestyle).

all_consistent(board_category) :-
    consistent(s1, board_category),
    (indep(s7), consistent(s7, board_category) ; \+indep(s7)).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain_park_freestyle)).
query(true_val(board_category, unk_board_category)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values unisex=Unisex unk_gender=Unknown
% @importance 1.0

0.92::acc(s9, gender).
0.88::acc(s1, gender).

0.97::true_val(gender, unisex); 0.03::true_val(gender, unk_gender).

measured(s9, gender, unisex).
measured(s1, gender, unisex).

all_consistent(gender) :-
    consistent(s9, gender),
    (indep(s1), consistent(s1, gender) ; \+indep(s1)).

evidence(all_consistent(gender)).
query(true_val(gender, unisex)).
query(true_val(gender, unk_gender)).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values gypsy_and_villain=Combination_of_Salomon_Gypsy_and_Villain unk_predecessor=Unknown
% @importance 0.85

0.88::acc(s1, predecessor_model_name).
0.85::acc(s81, predecessor_model_name).
0.87::acc(s47, predecessor_model_name).

0.95::true_val(predecessor_model_name, gypsy_and_villain); 0.05::true_val(predecessor_model_name, unk_predecessor).

measured(s1, predecessor_model_name, gypsy_and_villain).
measured(s81, predecessor_model_name, gypsy_and_villain).
measured(s47, predecessor_model_name, gypsy_and_villain).

all_consistent(predecessor_model_name) :-
    (indep(s1), consistent(s1, predecessor_model_name) ; \+indep(s1)),
    consistent(s81, predecessor_model_name),
    consistent(s47, predecessor_model_name).

evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, gypsy_and_villain)).
query(true_val(predecessor_model_name, unk_predecessor)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values y2023=2023 unk_first_year=Unknown
% @importance 0.7

0.88::acc(s84, model_first_available_year).

0.81::true_val(model_first_available_year, y2023); 0.19::true_val(model_first_available_year, unk_first_year).

measured(s84, model_first_available_year, y2023).

all_consistent(model_first_available_year) :- consistent(s84, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2023)).
query(true_val(model_first_available_year, unk_first_year)).

% @attr graphic_designer_artist
% @type categorical
% @canonical true
% @original_name graphic_designer_artist
% @values estee_preda=Estee_Preda unk_graphic_artist=Unknown
% @importance 0.3

0.82::acc(s114, graphic_designer_artist).

0.75::true_val(graphic_designer_artist, estee_preda); 0.25::true_val(graphic_designer_artist, unk_graphic_artist).

measured(s114, graphic_designer_artist, estee_preda).

all_consistent(graphic_designer_artist) :- consistent(s114, graphic_designer_artist).

evidence(all_consistent(graphic_designer_artist)).
query(true_val(graphic_designer_artist, estee_preda)).
query(true_val(graphic_designer_artist, unk_graphic_artist)).

% @attr graphic_designer_artist_original
% @type categorical
% @canonical false
% @original_name graphic_designer_artist (original)
% @values desiree_melancon=Desiree_Melancon unk_graphic_orig=Unknown
% @importance 0.3

0.92::acc(s113, graphic_designer_artist_original).

0.86::true_val(graphic_designer_artist_original, desiree_melancon); 0.14::true_val(graphic_designer_artist_original, unk_graphic_orig).

measured(s113, graphic_designer_artist_original, desiree_melancon).

all_consistent(graphic_designer_artist_original) :- consistent(s113, graphic_designer_artist_original).

evidence(all_consistent(graphic_designer_artist_original)).
query(true_val(graphic_designer_artist_original, desiree_melancon)).
query(true_val(graphic_designer_artist_original, unk_graphic_orig)).

% @attr snowboard_mag_platinum_pick
% @type categorical
% @canonical false
% @original_name Snowboard Magazine Platinum Pick (2026 model year)
% @values yes_platinum_pick=Yes_Platinum_Pick unk_award=Unknown
% @importance 0.85

0.88::acc(s49, snowboard_mag_platinum_pick).

0.85::true_val(snowboard_mag_platinum_pick, yes_platinum_pick); 0.15::true_val(snowboard_mag_platinum_pick, unk_award).

measured(s49, snowboard_mag_platinum_pick, yes_platinum_pick).

all_consistent(snowboard_mag_platinum_pick) :- consistent(s49, snowboard_mag_platinum_pick).

evidence(all_consistent(snowboard_mag_platinum_pick)).
query(true_val(snowboard_mag_platinum_pick, yes_platinum_pick)).
query(true_val(snowboard_mag_platinum_pick, unk_award)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values salomon_1947=Salomon unk_manufacturer=Unknown
% @importance 0.3

0.88::acc(s3, manufacturer).

0.85::true_val(manufacturer, salomon_1947); 0.15::true_val(manufacturer, unk_manufacturer).

measured(s3, manufacturer, salomon_1947).

all_consistent(manufacturer) :- consistent(s3, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, salomon_1947)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr manufacturer_reputation
% @type categorical
% @canonical false
% @original_name Manufacturer reputation
% @values high_quality=High_quality_great_company unk_reputation=Unknown
% @importance 0.3

0.75::acc(s3, manufacturer_reputation).

0.60::true_val(manufacturer_reputation, high_quality); 0.40::true_val(manufacturer_reputation, unk_reputation).

measured(s3, manufacturer_reputation, high_quality).

all_consistent(manufacturer_reputation) :- consistent(s3, manufacturer_reputation).

evidence(all_consistent(manufacturer_reputation)).
query(true_val(manufacturer_reputation, high_quality)).
query(true_val(manufacturer_reputation, unk_reputation)).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v499_95=499.95 unk_msrp=Unknown
% @importance 0.95

0.92::acc(s56, price_usd_msrp).
0.90::acc(s18, price_usd_msrp).

0.97::true_val(price_usd_msrp, v499_95); 0.03::true_val(price_usd_msrp, unk_msrp).

measured(s56, price_usd_msrp, v499_95).
measured(s18, price_usd_msrp, v499_95).

all_consistent(price_usd_msrp) :-
    consistent(s56, price_usd_msrp),
    consistent(s18, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v499_95)).
query(true_val(price_usd_msrp, unk_msrp)).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v594_99=594.99 unk_price_aud=Unknown
% @importance 0.85

0.95::acc(s1, price_aud_merchant).

0.95::true_val(price_aud_merchant, v594_99); 0.05::true_val(price_aud_merchant, unk_price_aud).

measured(s1, price_aud_merchant, v594_99).

all_consistent(price_aud_merchant) :- consistent(s1, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v594_99)).
query(true_val(price_aud_merchant, unk_price_aud)).

% @attr price_aud_merchant_rrp
% @type numeric
% @unit AUD
% @canonical false
% @original_name price_aud_merchant (RRP)
% @values v849_99=849.99 unk_price_aud_rrp=Unknown
% @importance 0.85

0.95::acc(s1, price_aud_merchant_rrp).

0.95::true_val(price_aud_merchant_rrp, v849_99); 0.05::true_val(price_aud_merchant_rrp, unk_price_aud_rrp).

measured(s1, price_aud_merchant_rrp, v849_99).

all_consistent(price_aud_merchant_rrp) :- consistent(s1, price_aud_merchant_rrp).

evidence(all_consistent(price_aud_merchant_rrp)).
query(true_val(price_aud_merchant_rrp, v849_99)).
query(true_val(price_aud_merchant_rrp, unk_price_aud_rrp)).

% @attr discount_merchant
% @type numeric
% @unit percent
% @canonical false
% @original_name Discount (merchant)
% @values v30=30 unk_discount=Unknown
% @importance 0.85

0.95::acc(s1, discount_merchant).

0.95::true_val(discount_merchant, v30); 0.05::true_val(discount_merchant, unk_discount).

measured(s1, discount_merchant, v30).

all_consistent(discount_merchant) :- consistent(s1, discount_merchant).

evidence(all_consistent(discount_merchant)).
query(true_val(discount_merchant, v30)).
query(true_val(discount_merchant, unk_discount)).

% @attr price_usd_backcountry
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_backcountry
% @values v374_96=374.96 unk_price_bc=Unknown
% @importance 0.95

0.92::acc(s56, price_usd_backcountry).

0.90::true_val(price_usd_backcountry, v374_96); 0.10::true_val(price_usd_backcountry, unk_price_bc).

measured(s56, price_usd_backcountry, v374_96).

all_consistent(price_usd_backcountry) :- consistent(s56, price_usd_backcountry).

evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v374_96)).
query(true_val(price_usd_backcountry, unk_price_bc)).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_evo
% @values v299_97=299.97 unk_price_evo=Unknown
% @importance 0.95

0.90::acc(s18, price_usd_evo).

0.88::true_val(price_usd_evo, v299_97); 0.12::true_val(price_usd_evo, unk_price_evo).

measured(s18, price_usd_evo, v299_97).

all_consistent(price_usd_evo) :- consistent(s18, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v299_97)).
query(true_val(price_usd_evo, unk_price_evo)).

% @attr price_usd_pto_ski
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at PTO Ski (sale)
% @values v349=349.0 unk_price_pto=Unknown
% @importance 0.85

0.85::acc(s53, price_usd_pto_ski).

0.80::true_val(price_usd_pto_ski, v349); 0.20::true_val(price_usd_pto_ski, unk_price_pto).

measured(s53, price_usd_pto_ski, v349).

all_consistent(price_usd_pto_ski) :- consistent(s53, price_usd_pto_ski).

evidence(all_consistent(price_usd_pto_ski)).
query(true_val(price_usd_pto_ski, v349)).
query(true_val(price_usd_pto_ski, unk_price_pto)).

% @attr price_usd_source_snowboard
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at The Source Snowboard (sale)
% @values v253=253.0 unk_price_source=Unknown
% @importance 0.85

0.80::acc(s32, price_usd_source_snowboard).

0.72::true_val(price_usd_source_snowboard, v253); 0.28::true_val(price_usd_source_snowboard, unk_price_source).

measured(s32, price_usd_source_snowboard, v253).

all_consistent(price_usd_source_snowboard) :- consistent(s32, price_usd_source_snowboard).

evidence(all_consistent(price_usd_source_snowboard)).
query(true_val(price_usd_source_snowboard, v253)).
query(true_val(price_usd_source_snowboard, unk_price_source)).

% @attr price_usd_ken_jones
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at Ken Jones Ski Mart
% @values v399_95=399.95 unk_price_kj=Unknown
% @importance 0.9

0.82::acc(s38, price_usd_ken_jones).

0.75::true_val(price_usd_ken_jones, v399_95); 0.25::true_val(price_usd_ken_jones, unk_price_kj).

measured(s38, price_usd_ken_jones, v399_95).

all_consistent(price_usd_ken_jones) :- consistent(s38, price_usd_ken_jones).

evidence(all_consistent(price_usd_ken_jones)).
query(true_val(price_usd_ken_jones, v399_95)).
query(true_val(price_usd_ken_jones, unk_price_kj)).

% @attr price_usd_msrp_2026
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_msrp (2026 model)
% @values v549_95=549.95 unk_msrp_2026=Unknown
% @importance 0.95

0.88::acc(s18, price_usd_msrp_2026).

0.85::true_val(price_usd_msrp_2026, v549_95); 0.15::true_val(price_usd_msrp_2026, unk_msrp_2026).

measured(s18, price_usd_msrp_2026, v549_95).

all_consistent(price_usd_msrp_2026) :- consistent(s18, price_usd_msrp_2026).

evidence(all_consistent(price_usd_msrp_2026)).
query(true_val(price_usd_msrp_2026, v549_95)).
query(true_val(price_usd_msrp_2026, unk_msrp_2026)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status (Backcountry)
% @values available_limited=Available_limited_sizes unk_avail_bc=Unknown
% @importance 0.95

0.90::acc(s56, availability_status).

0.90::true_val(availability_status, available_limited); 0.10::true_val(availability_status, unk_avail_bc).

measured(s56, availability_status, available_limited).

all_consistent(availability_status) :- consistent(s56, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, available_limited)).
query(true_val(availability_status, unk_avail_bc)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status (evo)
% @values on_sale_closeout=On_sale_closeout unk_avail_evo=Unknown
% @importance 0.95

0.88::acc(s18, availability_status_evo).

0.88::true_val(availability_status_evo, on_sale_closeout); 0.12::true_val(availability_status_evo, unk_avail_evo).

measured(s18, availability_status_evo, on_sale_closeout).

all_consistent(availability_status_evo) :- consistent(s18, availability_status_evo).

evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, on_sale_closeout)).
query(true_val(availability_status_evo, unk_avail_evo)).

% @attr availability_status_rei
% @type categorical
% @canonical false
% @original_name availability_status (REI)
% @values available=Available unk_avail_rei=Unknown
% @importance 0.7

0.85::acc(s13, availability_status_rei).

0.82::true_val(availability_status_rei, available); 0.18::true_val(availability_status_rei, unk_avail_rei).

measured(s13, availability_status_rei, available).

all_consistent(availability_status_rei) :- consistent(s13, availability_status_rei).

evidence(all_consistent(availability_status_rei)).
query(true_val(availability_status_rei, available)).
query(true_val(availability_status_rei, unk_avail_rei)).

% @attr availability_status_ski_pro_az
% @type categorical
% @canonical false
% @original_name availability_status (Ski Pro AZ)
% @values sold_out=Sold_out unk_avail_spa=Unknown
% @importance 0.7

0.82::acc(s37, availability_status_ski_pro_az).

0.78::true_val(availability_status_ski_pro_az, sold_out); 0.22::true_val(availability_status_ski_pro_az, unk_avail_spa).

measured(s37, availability_status_ski_pro_az, sold_out).

all_consistent(availability_status_ski_pro_az) :- consistent(s37, availability_status_ski_pro_az).

evidence(all_consistent(availability_status_ski_pro_az)).
query(true_val(availability_status_ski_pro_az, sold_out)).
query(true_val(availability_status_ski_pro_az, unk_avail_spa)).

% @attr availability_status_tactics
% @type categorical
% @canonical false
% @original_name availability_status (Tactics)
% @values sold_out_closeout=Sold_out_closeout unk_avail_tac=Unknown
% @importance 0.6

0.82::acc(s39, availability_status_tactics).

0.78::true_val(availability_status_tactics, sold_out_closeout); 0.22::true_val(availability_status_tactics, unk_avail_tac).

measured(s39, availability_status_tactics, sold_out_closeout).

all_consistent(availability_status_tactics) :- consistent(s39, availability_status_tactics).

evidence(all_consistent(availability_status_tactics)).
query(true_val(availability_status_tactics, sold_out_closeout)).
query(true_val(availability_status_tactics, unk_avail_tac)).

% @attr availability_status_subvert
% @type categorical
% @canonical false
% @original_name availability_status (Subvert Board Store UK)
% @values available=Available unk_avail_sub=Unknown
% @importance 0.4

0.78::acc(s40, availability_status_subvert).

0.72::true_val(availability_status_subvert, available); 0.28::true_val(availability_status_subvert, unk_avail_sub).

measured(s40, availability_status_subvert, available).

all_consistent(availability_status_subvert) :- consistent(s40, availability_status_subvert).

evidence(all_consistent(availability_status_subvert)).
query(true_val(availability_status_subvert, available)).
query(true_val(availability_status_subvert, unk_avail_sub)).

% @attr availability_status_absolute_snow
% @type categorical
% @canonical false
% @original_name availability_status (Absolute-Snow UK)
% @values available=Available unk_avail_abs=Unknown
% @importance 0.5

0.78::acc(s29, availability_status_absolute_snow).

0.72::true_val(availability_status_absolute_snow, available); 0.28::true_val(availability_status_absolute_snow, unk_avail_abs).

measured(s29, availability_status_absolute_snow, available).

all_consistent(availability_status_absolute_snow) :- consistent(s29, availability_status_absolute_snow).

evidence(all_consistent(availability_status_absolute_snow)).
query(true_val(availability_status_absolute_snow, available)).
query(true_val(availability_status_absolute_snow, unk_avail_abs)).

% @attr availability_status_rude_boys
% @type categorical
% @canonical false
% @original_name availability_status (Rude Boys Canada)
% @values available=Available unk_avail_rb=Unknown
% @importance 0.4

0.70::acc(s15, availability_status_rude_boys).

0.65::true_val(availability_status_rude_boys, available); 0.35::true_val(availability_status_rude_boys, unk_avail_rb).

measured(s15, availability_status_rude_boys, available).

all_consistent(availability_status_rude_boys) :- consistent(s15, availability_status_rude_boys).

evidence(all_consistent(availability_status_rude_boys)).
query(true_val(availability_status_rude_boys, available)).
query(true_val(availability_status_rude_boys, unk_avail_rb)).

% @attr availability_status_pto_ski
% @type categorical
% @canonical false
% @original_name availability_status (PTO Ski)
% @values sold_out=Sold_out unk_avail_pto=Unknown
% @importance 0.85

0.82::acc(s53, availability_status_pto_ski).

0.78::true_val(availability_status_pto_ski, sold_out); 0.22::true_val(availability_status_pto_ski, unk_avail_pto).

measured(s53, availability_status_pto_ski, sold_out).

all_consistent(availability_status_pto_ski) :- consistent(s53, availability_status_pto_ski).

evidence(all_consistent(availability_status_pto_ski)).
query(true_val(availability_status_pto_ski, sold_out)).
query(true_val(availability_status_pto_ski, unk_avail_pto)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values true_twin=True_Twin unk_shape=Unknown
% @importance 0.97

0.95::acc(s9, shape).
0.88::acc(s12, shape).
0.88::acc(s1, shape).
0.85::acc(s49, shape).

0.97::true_val(shape, true_twin); 0.03::true_val(shape, unk_shape).

measured(s9, shape, true_twin).
measured(s12, shape, true_twin).
measured(s1, shape, true_twin).
measured(s49, shape, true_twin).

all_consistent(shape) :-
    consistent(s9, shape),
    (indep(s12), consistent(s12, shape) ; \+indep(s12)),
    (indep(s1), consistent(s1, shape) ; \+indep(s1)),
    consistent(s49, shape).

evidence(all_consistent(shape)).
query(true_val(shape, true_twin)).
query(true_val(shape, unk_shape)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values rock_out_camber=Rock_Out_Camber unk_camber=Unknown
% @importance 0.93

0.95::acc(s9, camber_type).
0.88::acc(s40, camber_type).
0.85::acc(s81, camber_type).

0.97::true_val(camber_type, rock_out_camber); 0.03::true_val(camber_type, unk_camber).

measured(s9, camber_type, rock_out_camber).
measured(s40, camber_type, rock_out_camber).
measured(s81, camber_type, rock_out_camber).

all_consistent(camber_type) :-
    consistent(s9, camber_type),
    (indep(s40), consistent(s40, camber_type) ; \+indep(s40)),
    consistent(s81, camber_type).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, rock_out_camber)).
query(true_val(camber_type, unk_camber)).

% @attr setback
% @type numeric
% @unit mm
% @canonical true
% @original_name setback
% @values v0=0.0 unk_setback=Unknown
% @importance 1.0

0.90::acc(s1, setback).

0.90::true_val(setback, v0); 0.10::true_val(setback, unk_setback).

measured(s1, setback, v0).

all_consistent(setback) :- consistent(s1, setback).

evidence(all_consistent(setback)).
query(true_val(setback, v0)).
query(true_val(setback, unk_setback)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values medium=Medium unk_flex_feel=Unknown
% @importance 0.92

0.90::acc(s1, flex_feel).
0.88::acc(s40, flex_feel).
0.85::acc(s7, flex_feel).
0.87::acc(s49, flex_feel).

0.97::true_val(flex_feel, medium); 0.03::true_val(flex_feel, unk_flex_feel).

measured(s1, flex_feel, medium).
measured(s40, flex_feel, medium).
measured(s7, flex_feel, medium).
measured(s49, flex_feel, medium).

all_consistent(flex_feel) :-
    (indep(s1), consistent(s1, flex_feel) ; \+indep(s1)),
    (indep(s40), consistent(s40, flex_feel) ; \+indep(s40)),
    (indep(s7), consistent(s7, flex_feel) ; \+indep(s7)),
    consistent(s49, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr flex_rating_5
% @type numeric
% @unit /5
% @canonical true
% @original_name flex_rating_5
% @values v3=3.0 unk_flex_5=Unknown
% @importance 0.85

0.85::acc(s34, flex_rating_5).

0.82::true_val(flex_rating_5, v3); 0.18::true_val(flex_rating_5, unk_flex_5).

measured(s34, flex_rating_5, v3).

all_consistent(flex_rating_5) :-
    (indep(s34), consistent(s34, flex_rating_5) ; \+indep(s34)).

evidence(all_consistent(flex_rating_5)).
query(true_val(flex_rating_5, v3)).
query(true_val(flex_rating_5, unk_flex_5)).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values quadralizer=Quadralizer_Sidecut unk_sidecut=Unknown
% @importance 0.9

0.93::acc(s12, sidecut_type).
0.90::acc(s30, sidecut_type).

0.95::true_val(sidecut_type, quadralizer); 0.05::true_val(sidecut_type, unk_sidecut).

measured(s12, sidecut_type, quadralizer).
measured(s30, sidecut_type, quadralizer).

all_consistent(sidecut_type) :-
    (indep(s12), consistent(s12, sidecut_type) ; \+indep(s12)),
    (indep(s30), consistent(s30, sidecut_type) ; \+indep(s30)).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, quadralizer)).
query(true_val(sidecut_type, unk_sidecut)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values aspen_select=Aspen_Select aspen_generic=Aspen unk_core=Unknown
% @importance 0.92

0.88::acc(s30, core_material).
0.85::acc(s1, core_material).

0.65::true_val(core_material, aspen_select); 0.30::true_val(core_material, aspen_generic); 0.05::true_val(core_material, unk_core).

measured(s30, core_material, aspen_select).
measured(s1, core_material, aspen_generic).

all_consistent(core_material) :-
    (indep(s30), consistent(s30, core_material) ; \+indep(s30)),
    (indep(s1), consistent(s1, core_material) ; \+indep(s1)).

evidence(all_consistent(core_material)).
query(true_val(core_material, aspen_select)).
query(true_val(core_material, aspen_generic)).
query(true_val(core_material, unk_core)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values fsc_certified=FSC_certified unk_sustain=Unknown
% @importance 0.85

0.88::acc(s30, sustainability_certification).

0.88::true_val(sustainability_certification, fsc_certified); 0.12::true_val(sustainability_certification, unk_sustain).

measured(s30, sustainability_certification, fsc_certified).

all_consistent(sustainability_certification) :-
    (indep(s30), consistent(s30, sustainability_certification) ; \+indep(s30)).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, fsc_certified)).
query(true_val(sustainability_certification, unk_sustain)).

% @attr core_profiling
% @type categorical
% @canonical false
% @original_name Core profiling
% @values popster_booster=Popster_Booster unk_core_prof=Unknown
% @importance 0.78

0.85::acc(s34, core_profiling).
0.88::acc(s30, core_profiling).

0.92::true_val(core_profiling, popster_booster); 0.08::true_val(core_profiling, unk_core_prof).

measured(s34, core_profiling, popster_booster).
measured(s30, core_profiling, popster_booster).

all_consistent(core_profiling) :-
    (indep(s34), consistent(s34, core_profiling) ; \+indep(s34)),
    (indep(s30), consistent(s30, core_profiling) ; \+indep(s30)).

evidence(all_consistent(core_profiling)).
query(true_val(core_profiling, popster_booster)).
query(true_val(core_profiling, unk_core_prof)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values triax_ba_md_3layer=Triax_BA_MD_3_intersecting_layers unk_laminate=Unknown
% @importance 0.8

0.92::acc(s130, laminate).
0.88::acc(s30, laminate).
0.85::acc(s20, laminate).
0.82::acc(s50, laminate).

0.95::true_val(laminate, triax_ba_md_3layer); 0.05::true_val(laminate, unk_laminate).

measured(s130, laminate, triax_ba_md_3layer).
measured(s30, laminate, triax_ba_md_3layer).
measured(s20, laminate, triax_ba_md_3layer).
measured(s50, laminate, triax_ba_md_3layer).

all_consistent(laminate) :-
    consistent(s130, laminate),
    (indep(s30), consistent(s30, laminate) ; \+indep(s30)),
    (indep(s20), consistent(s20, laminate) ; \+indep(s20)),
    (indep(s50), consistent(s50, laminate) ; \+indep(s50)).

evidence(all_consistent(laminate)).
query(true_val(laminate, triax_ba_md_3layer)).
query(true_val(laminate, unk_laminate)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values ghost_carbon_beam=Ghost_Carbon_Beam_tip_tail unk_carbon=Unknown
% @importance 0.73

0.92::acc(s20, construction_material_innovation).
0.85::acc(s90, construction_material_innovation).
0.88::acc(s30, construction_material_innovation).

0.95::true_val(construction_material_innovation, ghost_carbon_beam); 0.05::true_val(construction_material_innovation, unk_carbon).

measured(s20, construction_material_innovation, ghost_carbon_beam).
measured(s90, construction_material_innovation, ghost_carbon_beam).
measured(s30, construction_material_innovation, ghost_carbon_beam).

all_consistent(construction_material_innovation) :-
    (indep(s20), consistent(s20, construction_material_innovation) ; \+indep(s20)),
    (indep(s90), consistent(s90, construction_material_innovation) ; \+indep(s90)),
    (indep(s30), consistent(s30, construction_material_innovation) ; \+indep(s30)).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, ghost_carbon_beam)).
query(true_val(construction_material_innovation, unk_carbon)).

% @attr resin
% @type categorical
% @canonical true
% @original_name resin
% @values pct28=28_percent_plant_derived pct30=30_percent_bio_based unk_resin=Unknown
% @importance 0.62

0.82::acc(s30, resin).
0.87::acc(s123, resin).
0.80::acc(s29, resin).

0.35::true_val(resin, pct28); 0.60::true_val(resin, pct30); 0.05::true_val(resin, unk_resin).

measured(s30, resin, pct28).
measured(s123, resin, pct30).
measured(s29, resin, pct30).

all_consistent(resin) :-
    (indep(s30), consistent(s30, resin) ; \+indep(s30)),
    (indep(s123), consistent(s123, resin) ; \+indep(s123)),
    (indep(s29), consistent(s29, resin) ; \+indep(s29)).

evidence(all_consistent(resin)).
query(true_val(resin, pct28)).
query(true_val(resin, pct30)).
query(true_val(resin, unk_resin)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values royal_rubber_rails_full=Royal_Rubber_Rails_full_length royal_rubber_4mm=Royal_Rubber_4mm_pads rubber_2mm=Rubber_2mm_blocks unk_sidewall=Unknown
% @importance 0.73

0.95::acc(s130, sidewall_material).
0.82::acc(s20, sidewall_material).
0.60::acc(s86, sidewall_material).

0.55::true_val(sidewall_material, royal_rubber_rails_full); 0.30::true_val(sidewall_material, royal_rubber_4mm); 0.10::true_val(sidewall_material, rubber_2mm); 0.05::true_val(sidewall_material, unk_sidewall).

measured(s130, sidewall_material, royal_rubber_rails_full).
measured(s20, sidewall_material, royal_rubber_4mm).
measured(s86, sidewall_material, rubber_2mm).

all_consistent(sidewall_material) :-
    consistent(s130, sidewall_material),
    (indep(s20), consistent(s20, sidewall_material) ; \+indep(s20)),
    consistent(s86, sidewall_material).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, royal_rubber_rails_full)).
query(true_val(sidewall_material, royal_rubber_4mm)).
query(true_val(sidewall_material, rubber_2mm)).
query(true_val(sidewall_material, unk_sidewall)).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values sintered=Sintered unk_base=Unknown
% @importance 0.9

0.95::acc(s9, base_type).
0.85::acc(s20, base_type).

0.97::true_val(base_type, sintered); 0.03::true_val(base_type, unk_base).

measured(s9, base_type, sintered).
measured(s20, base_type, sintered).

all_consistent(base_type) :-
    consistent(s9, base_type),
    (indep(s20), consistent(s20, base_type) ; \+indep(s20)).

evidence(all_consistent(base_type)).
query(true_val(base_type, sintered)).
query(true_val(base_type, unk_base)).

% @attr base_finish
% @type categorical
% @canonical false
% @original_name Base finish
% @values medium_stone=Medium_Stone_Finish unk_base_finish=Unknown
% @importance 1.0

0.95::acc(s9, base_finish).

0.95::true_val(base_finish, medium_stone); 0.05::true_val(base_finish, unk_base_finish).

measured(s9, base_finish, medium_stone).

all_consistent(base_finish) :- consistent(s9, base_finish).

evidence(all_consistent(base_finish)).
query(true_val(base_finish, medium_stone)).
query(true_val(base_finish, unk_base_finish)).

% @attr factory_wax
% @type categorical
% @canonical false
% @original_name Factory wax
% @values natural_paraffin_free=Natural_Wax_Paraffin_Free unk_wax=Unknown
% @importance 1.0

0.95::acc(s9, factory_wax).

0.95::true_val(factory_wax, natural_paraffin_free); 0.05::true_val(factory_wax, unk_wax).

measured(s9, factory_wax, natural_paraffin_free).

all_consistent(factory_wax) :- consistent(s9, factory_wax).

evidence(all_consistent(factory_wax)).
query(true_val(factory_wax, natural_paraffin_free)).
query(true_val(factory_wax, unk_wax)).

% @attr topsheet
% @type categorical
% @canonical true
% @original_name topsheet
% @values castor_bean_bio=Castor_Bean_Bio_Sourced unk_topsheet=Unknown
% @importance 0.93

0.90::acc(s1, topsheet).
0.85::acc(s81, topsheet).

0.95::true_val(topsheet, castor_bean_bio); 0.05::true_val(topsheet, unk_topsheet).

measured(s1, topsheet, castor_bean_bio).
measured(s81, topsheet, castor_bean_bio).

all_consistent(topsheet) :-
    (indep(s1), consistent(s1, topsheet) ; \+indep(s1)),
    consistent(s81, topsheet).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, castor_bean_bio)).
query(true_val(topsheet, unk_topsheet)).

% @attr edge_bevel_spec
% @type categorical
% @canonical true
% @original_name edge_bevel_spec
% @values freestyle_eb=Freestyle_EB_2deg_3deg unk_edge=Unknown
% @importance 0.85

0.95::acc(s130, edge_bevel_spec).
0.88::acc(s123, edge_bevel_spec).
0.85::acc(s48, edge_bevel_spec).

0.97::true_val(edge_bevel_spec, freestyle_eb); 0.03::true_val(edge_bevel_spec, unk_edge).

measured(s130, edge_bevel_spec, freestyle_eb).
measured(s123, edge_bevel_spec, freestyle_eb).
measured(s48, edge_bevel_spec, freestyle_eb).

all_consistent(edge_bevel_spec) :-
    consistent(s130, edge_bevel_spec),
    (indep(s123), consistent(s123, edge_bevel_spec) ; \+indep(s123)),
    (indep(s48), consistent(s48, edge_bevel_spec) ; \+indep(s48)).

evidence(all_consistent(edge_bevel_spec)).
query(true_val(edge_bevel_spec, freestyle_eb)).
query(true_val(edge_bevel_spec, unk_edge)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting=Unknown
% @importance 0.8

0.90::acc(s1, mounting_pattern).
0.72::acc(s124, mounting_pattern).

0.95::true_val(mounting_pattern, inserts_2x4); 0.05::true_val(mounting_pattern, unk_mounting).

measured(s1, mounting_pattern, inserts_2x4).
measured(s124, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :-
    (indep(s1), consistent(s1, mounting_pattern) ; \+indep(s1)),
    (indep(s124), consistent(s124, mounting_pattern) ; \+indep(s124)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate_advanced=Intermediate_Advanced unk_level=Unknown
% @importance 0.85

0.90::acc(s1, rider_level).
0.85::acc(s7, rider_level).

0.95::true_val(rider_level, intermediate_advanced); 0.05::true_val(rider_level, unk_level).

measured(s1, rider_level, intermediate_advanced).
measured(s7, rider_level, intermediate_advanced).

all_consistent(rider_level) :-
    (indep(s1), consistent(s1, rider_level) ; \+indep(s1)),
    (indep(s7), consistent(s7, rider_level) ; \+indep(s7)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate_advanced)).
query(true_val(rider_level, unk_level)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values park_freestyle_all_mountain=Park_Freestyle_Streets_All_Mountain unk_terrain=Unknown
% @importance 0.9

0.90::acc(s1, terrain_suitability).
0.85::acc(s7, terrain_suitability).

0.95::true_val(terrain_suitability, park_freestyle_all_mountain); 0.05::true_val(terrain_suitability, unk_terrain).

measured(s1, terrain_suitability, park_freestyle_all_mountain).
measured(s7, terrain_suitability, park_freestyle_all_mountain).

all_consistent(terrain_suitability) :-
    (indep(s1), consistent(s1, terrain_suitability) ; \+indep(s1)),
    (indep(s7), consistent(s7, terrain_suitability) ; \+indep(s7)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, park_freestyle_all_mountain)).
query(true_val(terrain_suitability, unk_terrain)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values nine_sizes=9_sizes_no_162 ten_sizes=10_sizes_with_162 unk_sizes=Unknown
% @importance 0.92

0.85::acc(s1, available_sizes).
0.90::acc(s108, available_sizes).
0.87::acc(s49, available_sizes).

0.30::true_val(available_sizes, nine_sizes); 0.65::true_val(available_sizes, ten_sizes); 0.05::true_val(available_sizes, unk_sizes).

measured(s1, available_sizes, nine_sizes).
measured(s108, available_sizes, ten_sizes).
measured(s49, available_sizes, ten_sizes).

all_consistent(available_sizes) :-
    (indep(s1), consistent(s1, available_sizes) ; \+indep(s1)),
    consistent(s108, available_sizes),
    consistent(s49, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, nine_sizes)).
query(true_val(available_sizes, ten_sizes)).
query(true_val(available_sizes, unk_sizes)).

% @attr waist_width_138
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 138cm
% @values v238=238.0 unk_ww138=Unknown
% @importance 0.97

0.88::acc(s1, waist_width_138).
0.90::acc(s56, waist_width_138).

0.95::true_val(waist_width_138, v238); 0.05::true_val(waist_width_138, unk_ww138).

measured(s1, waist_width_138, v238).
measured(s56, waist_width_138, v238).

all_consistent(waist_width_138) :-
    (indep(s1), consistent(s1, waist_width_138) ; \+indep(s1)),
    (indep(s56), consistent(s56, waist_width_138) ; \+indep(s56)).

evidence(all_consistent(waist_width_138)).
query(true_val(waist_width_138, v238)).
query(true_val(waist_width_138, unk_ww138)).

% @attr tip_tail_width_size_138
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size (138cm)
% @values v283=283.0 unk_ttw138=Unknown
% @importance 1.0

0.88::acc(s1, tip_tail_width_size_138).

0.90::true_val(tip_tail_width_size_138, v283); 0.10::true_val(tip_tail_width_size_138, unk_ttw138).

measured(s1, tip_tail_width_size_138, v283).

all_consistent(tip_tail_width_size_138) :-
    (indep(s1), consistent(s1, tip_tail_width_size_138) ; \+indep(s1)).

evidence(all_consistent(tip_tail_width_size_138)).
query(true_val(tip_tail_width_size_138, v283)).
query(true_val(tip_tail_width_size_138, unk_ttw138)).

% @attr effective_edge_138
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 138cm
% @values v1075=1075.0 unk_ee138=Unknown
% @importance 0.97

0.88::acc(s1, effective_edge_138).
0.90::acc(s56, effective_edge_138).

0.95::true_val(effective_edge_138, v1075); 0.05::true_val(effective_edge_138, unk_ee138).

measured(s1, effective_edge_138, v1075).
measured(s56, effective_edge_138, v1075).

all_consistent(effective_edge_138) :-
    (indep(s1), consistent(s1, effective_edge_138) ; \+indep(s1)),
    (indep(s56), consistent(s56, effective_edge_138) ; \+indep(s56)).

evidence(all_consistent(effective_edge_138)).
query(true_val(effective_edge_138, v1075)).
query(true_val(effective_edge_138, unk_ee138)).

% @attr recommended_weight_range_size_138
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (138cm)
% @values w35_60=35-60kg unk_rw138=Unknown
% @importance 1.0

0.88::acc(s1, recommended_weight_range_size_138).

0.90::true_val(recommended_weight_range_size_138, w35_60); 0.10::true_val(recommended_weight_range_size_138, unk_rw138).

measured(s1, recommended_weight_range_size_138, w35_60).

all_consistent(recommended_weight_range_size_138) :-
    (indep(s1), consistent(s1, recommended_weight_range_size_138) ; \+indep(s1)).

evidence(all_consistent(recommended_weight_range_size_138)).
query(true_val(recommended_weight_range_size_138, w35_60)).
query(true_val(recommended_weight_range_size_138, unk_rw138)).

% @attr waist_width_143
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 143cm
% @values v240=240.0 unk_ww143=Unknown
% @importance 0.97

0.88::acc(s1, waist_width_143).
0.90::acc(s56, waist_width_143).

0.95::true_val(waist_width_143, v240); 0.05::true_val(waist_width_143, unk_ww143).

measured(s1, waist_width_143, v240).
measured(s56, waist_width_143, v240).

all_consistent(waist_width_143) :-
    (indep(s1), consistent(s1, waist_width_143) ; \+indep(s1)),
    (indep(s56), consistent(s56, waist_width_143) ; \+indep(s56)).

evidence(all_consistent(waist_width_143)).
query(true_val(waist_width_143, v240)).
query(true_val(waist_width_143, unk_ww143)).

% @attr tip_tail_width_size_143
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size (143cm)
% @values v285=285.0 unk_ttw143=Unknown
% @importance 1.0

0.88::acc(s1, tip_tail_width_size_143).

0.90::true_val(tip_tail_width_size_143, v285); 0.10::true_val(tip_tail_width_size_143, unk_ttw143).

measured(s1, tip_tail_width_size_143, v285).

all_consistent(tip_tail_width_size_143) :-
    (indep(s1), consistent(s1, tip_tail_width_size_143) ; \+indep(s1)).

evidence(all_consistent(tip_tail_width_size_143)).
query(true_val(tip_tail_width_size_143, v285)).
query(true_val(tip_tail_width_size_143, unk_ttw143)).

% @attr effective_edge_143
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 143cm
% @values v1115=1115.0 unk_ee143=Unknown
% @importance 0.97

0.88::acc(s1, effective_edge_143).
0.90::acc(s56, effective_edge_143).

0.95::true_val(effective_edge_143, v1115); 0.05::true_val(effective_edge_143, unk_ee143).

measured(s1, effective_edge_143, v1115).
measured(s56, effective_edge_143, v1115).

all_consistent(effective_edge_143) :-
    (indep(s1), consistent(s1, effective_edge_143) ; \+indep(s1)),
    (indep(s56), consistent(s56, effective_edge_143) ; \+indep(s56)).

evidence(all_consistent(effective_edge_143)).
query(true_val(effective_edge_143, v1115)).
query(true_val(effective_edge_143, unk_ee143)).

% @attr recommended_weight_range_size_143
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (143cm)
% @values w40_60=40-60kg unk_rw143=Unknown
% @importance 1.0

0.88::acc(s1, recommended_weight_range_size_143).

0.90::true_val(recommended_weight_range_size_143, w40_60); 0.10::true_val(recommended_weight_range_size_143, unk_rw143).

measured(s1, recommended_weight_range_size_143, w40_60).

all_consistent(recommended_weight_range_size_143) :-
    (indep(s1), consistent(s1, recommended_weight_range_size_143) ; \+indep(s1)).

evidence(all_consistent(recommended_weight_range_size_143)).
query(true_val(recommended_weight_range_size_143, w40_60)).
query(true_val(recommended_weight_range_size_143, unk_rw143)).

% @attr waist_width_147
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 147cm
% @values v242=242.0 unk_ww147=Unknown
% @importance 0.97

0.88::acc(s1, waist_width_147).
0.90::acc(s56, waist_width_147).

0.95::true_val(waist_width_147, v242); 0.05::true_val(waist_width_147, unk_ww147).

measured(s1, waist_width_147, v242).
measured(s56, waist_width_147, v242).

all_consistent(waist_width_147) :-
    (indep(s1), consistent(s1, waist_width_147) ; \+indep(s1)),
    (indep(s56), consistent(s56, waist_width_147) ; \+indep(s56)).

evidence(all_consistent(waist_width_147)).
query(true_val(waist_width_147, v242)).
query(true_val(waist_width_147, unk_ww147)).

% @attr tip_tail_width_size_147
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size (147cm)
% @values v287=287.0 unk_ttw147=Unknown
% @importance 1.0

0.88::acc(s1, tip_tail_width_size_147).

0.90::true_val(tip_tail_width_size_147, v287); 0.10::true_val(tip_tail_width_size_147, unk_ttw147).

measured(s1, tip_tail_width_size_147, v287).

all_consistent(tip_tail_width_size_147) :-
    (indep(s1), consistent(s1, tip_tail_width_size_147) ; \+indep(s1)).

evidence(all_consistent(tip_tail_width_size_147)).
query(true_val(tip_tail_width_size_147, v287)).
query(true_val(tip_tail_width_size_147, unk_ttw147)).

% @attr effective_edge_147
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 147cm
% @values v1150=1150.0 unk_ee147=Unknown
% @importance 0.97

0.88::acc(s1, effective_edge_147).
0.90::acc(s56, effective_edge_147).

0.95::true_val(effective_edge_147, v1150); 0.05::true_val(effective_edge_147, unk_ee147).

measured(s1, effective_edge_147, v1150).
measured(s56, effective_edge_147, v1150).

all_consistent(effective_edge_147) :-
    (indep(s1), consistent(s1, effective_edge_147) ; \+indep(s1)),
    (indep(s56), consistent(s56, effective_edge_147) ; \+indep(s56)).

evidence(all_consistent(effective_edge_147)).
query(true_val(effective_edge_147, v1150)).
query(true_val(effective_edge_147, unk_ee147)).

% @attr recommended_weight_range_size_147
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (147cm)
% @values w45_65=45-65kg unk_rw147=Unknown
% @importance 1.0

0.88::acc(s1, recommended_weight_range_size_147).

0.90::true_val(recommended_weight_range_size_147, w45_65); 0.10::true_val(recommended_weight_range_size_147, unk_rw147).

measured(s1, recommended_weight_range_size_147, w45_65).

all_consistent(recommended_weight_range_size_147) :-
    (indep(s1), consistent(s1, recommended_weight_range_size_147) ; \+indep(s1)).

evidence(all_consistent(recommended_weight_range_size_147)).
query(true_val(recommended_weight_range_size_147, w45_65)).
query(true_val(recommended_weight_range_size_147, unk_rw147)).

% @attr waist_width_151
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 151cm
% @values v247=247.0 unk_ww151=Unknown
% @importance 0.97

0.88::acc(s1, waist_width_151).
0.90::acc(s56, waist_width_151).

0.95::true_val(waist_width_151, v247); 0.05::true_val(waist_width_151, unk_ww151).

measured(s1, waist_width_151, v247).
measured(s56, waist_width_151, v247).

all_consistent(waist_width_151) :-
    (indep(s1), consistent(s1, waist_width_151) ; \+indep(s1)),
    (indep(s56), consistent(s56, waist_width_151) ; \+indep(s56)).

evidence(all_consistent(waist_width_151)).
query(true_val(waist_width_151, v247)).
query(true_val(waist_width_151, unk_ww151)).

% @attr tip_tail_width_size_151
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size (151cm)
% @values v292=292.0 unk_ttw151=Unknown
% @importance 1.0

0.88::acc(s1, tip_tail_width_size_151).

0.90::true_val(tip_tail_width_size_151, v292); 0.10::true_val(tip_tail_width_size_151, unk_ttw151).

measured(s1, tip_tail_width_size_151, v292).

all_consistent(tip_tail_width_size_151) :-
    (indep(s1), consistent(s1, tip_tail_width_size_151) ; \+indep(s1)).

evidence(all_consistent(tip_tail_width_size_151)).
query(true_val(tip_tail_width_size_151, v292)).
query(true_val(tip_tail_width_size_151, unk_ttw151)).

% @attr effective_edge_151
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 151cm
% @values v1165=1165.0 unk_ee151=Unknown
% @importance 0.97

0.88::acc(s1, effective_edge_151).
0.90::acc(s56, effective_edge_151).

0.95::true_val(effective_edge_151, v1165); 0.05::true_val(effective_edge_151, unk_ee151).

measured(s1, effective_edge_151, v1165).
measured(s56, effective_edge_151, v1165).

all_consistent(effective_edge_151) :-
    (indep(s1), consistent(s1, effective_edge_151) ; \+indep(s1)),
    (indep(s56), consistent(s56, effective_edge_151) ; \+indep(s56)).

evidence(all_consistent(effective_edge_151)).
query(true_val(effective_edge_151, v1165)).
query(true_val(effective_edge_151, unk_ee151)).

% @attr recommended_weight_range_size_151
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (151cm)
% @values w50_70=50-70kg unk_rw151=Unknown
% @importance 1.0

0.88::acc(s1, recommended_weight_range_size_151).

0.90::true_val(recommended_weight_range_size_151, w50_70); 0.10::true_val(recommended_weight_range_size_151, unk_rw151).

measured(s1, recommended_weight_range_size_151, w50_70).

all_consistent(recommended_weight_range_size_151) :-
    (indep(s1), consistent(s1, recommended_weight_range_size_151) ; \+indep(s1)).

evidence(all_consistent(recommended_weight_range_size_151)).
query(true_val(recommended_weight_range_size_151, w50_70)).
query(true_val(recommended_weight_range_size_151, unk_rw151)).

% @attr waist_width_153
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 153cm
% @values v250=250.0 unk_ww153=Unknown
% @importance 0.97

0.88::acc(s1, waist_width_153).
0.90::acc(s56, waist_width_153).

0.95::true_val(waist_width_153, v250); 0.05::true_val(waist_width_153, unk_ww153).

measured(s1, waist_width_153, v250).
measured(s56, waist_width_153, v250).

all_consistent(waist_width_153) :-
    (indep(s1), consistent(s1, waist_width_153) ; \+indep(s1)),
    (indep(s56), consistent(s56, waist_width_153) ; \+indep(s56)).

evidence(all_consistent(waist_width_153)).
query(true_val(waist_width_153, v250)).
query(true_val(waist_width_153, unk_ww153)).

% @attr tip_tail_width_size_153
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size (153cm)
% @values v295=295.0 unk_ttw153=Unknown
% @importance 1.0

0.88::acc(s1, tip_tail_width_size_153).

0.90::true_val(tip_tail_width_size_153, v295); 0.10::true_val(tip_tail_width_size_153, unk_ttw153).

measured(s1, tip_tail_width_size_153, v295).

all_consistent(tip_tail_width_size_153) :-
    (indep(s1), consistent(s1, tip_tail_width_size_153) ; \+indep(s1)).

evidence(all_consistent(tip_tail_width_size_153)).
query(true_val(tip_tail_width_size_153, v295)).
query(true_val(tip_tail_width_size_153, unk_ttw153)).

% @attr effective_edge_153
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 153cm
% @values v1190=1190.0 unk_ee153=Unknown
% @importance 0.97

0.88::acc(s1, effective_edge_153).
0.90::acc(s56, effective_edge_153).

0.95::true_val(effective_edge_153, v1190); 0.05::true_val(effective_edge_153, unk_ee153).

measured(s1, effective_edge_153, v1190).
measured(s56, effective_edge_153, v1190).

all_consistent(effective_edge_153) :-
    (indep(s1), consistent(s1, effective_edge_153) ; \+indep(s1)),
    (indep(s56), consistent(s56, effective_edge_153) ; \+indep(s56)).

evidence(all_consistent(effective_edge_153)).
query(true_val(effective_edge_153, v1190)).
query(true_val(effective_edge_153, unk_ee153)).

% @attr recommended_weight_range_size_153
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (153cm)
% @values w55_75=55-75kg unk_rw153=Unknown
% @importance 1.0

0.88::acc(s1, recommended_weight_range_size_153).

0.90::true_val(recommended_weight_range_size_153, w55_75); 0.10::true_val(recommended_weight_range_size_153, unk_rw153).

measured(s1, recommended_weight_range_size_153, w55_75).

all_consistent(recommended_weight_range_size_153) :-
    (indep(s1), consistent(s1, recommended_weight_range_size_153) ; \+indep(s1)).

evidence(all_consistent(recommended_weight_range_size_153)).
query(true_val(recommended_weight_range_size_153, w55_75)).
query(true_val(recommended_weight_range_size_153, unk_rw153)).

% @attr waist_width_155
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 155cm
% @values v252=252.0 unk_ww155=Unknown
% @importance 0.97

0.88::acc(s1, waist_width_155).
0.90::acc(s56, waist_width_155).

0.95::true_val(waist_width_155, v252); 0.05::true_val(waist_width_155, unk_ww155).

measured(s1, waist_width_155, v252).
measured(s56, waist_width_155, v252).

all_consistent(waist_width_155) :-
    (indep(s1), consistent(s1, waist_width_155) ; \+indep(s1)),
    (indep(s56), consistent(s56, waist_width_155) ; \+indep(s56)).

evidence(all_consistent(waist_width_155)).
query(true_val(waist_width_155, v252)).
query(true_val(waist_width_155, unk_ww155)).

% @attr tip_tail_width_size
% @type numeric
% @unit mm
% @canonical true
% @original_name tip_tail_width_size (155cm)
% @values v297=297.0 unk_ttw155=Unknown
% @importance 1.0

0.88::acc(s1, tip_tail_width_size).

0.90::true_val(tip_tail_width_size, v297); 0.10::true_val(tip_tail_width_size, unk_ttw155).

measured(s1, tip_tail_width_size, v297).

all_consistent(tip_tail_width_size) :-
    (indep(s1), consistent(s1, tip_tail_width_size) ; \+indep(s1)).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v297)).
query(true_val(tip_tail_width_size, unk_ttw155)).

% @attr effective_edge_155
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 155cm
% @values v1205=1205.0 unk_ee155=Unknown
% @importance 0.97

0.88::acc(s1, effective_edge_155).
0.90::acc(s56, effective_edge_155).

0.95::true_val(effective_edge_155, v1205); 0.05::true_val(effective_edge_155, unk_ee155).

measured(s1, effective_edge_155, v1205).
measured(s56, effective_edge_155, v1205).

all_consistent(effective_edge_155) :-
    (indep(s1), consistent(s1, effective_edge_155) ; \+indep(s1)),
    (indep(s56), consistent(s56, effective_edge_155) ; \+indep(s56)).

evidence(all_consistent(effective_edge_155)).
query(true_val(effective_edge_155, v1205)).
query(true_val(effective_edge_155, unk_ee155)).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size (155cm)
% @values w55_85=55-85kg unk_rw155=Unknown
% @importance 1.0

0.88::acc(s1, recommended_weight_range_size).

0.90::true_val(recommended_weight_range_size, w55_85); 0.10::true_val(recommended_weight_range_size, unk_rw155).

measured(s1, recommended_weight_range_size, w55_85).

all_consistent(recommended_weight_range_size) :-
    (indep(s1), consistent(s1, recommended_weight_range_size) ; \+indep(s1)).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w55_85)).
query(true_val(recommended_weight_range_size, unk_rw155)).

% @attr waist_width_158
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 158cm
% @values v254=254.0 unk_ww158=Unknown
% @importance 0.97

0.88::acc(s1, waist_width_158).
0.90::acc(s56, waist_width_158).

0.95::true_val(waist_width_158, v254); 0.05::true_val(waist_width_158, unk_ww158).

measured(s1, waist_width_158, v254).
measured(s56, waist_width_158, v254).

all_consistent(waist_width_158) :-
    (indep(s1), consistent(s1, waist_width_158) ; \+indep(s1)),
    (indep(s56), consistent(s56, waist_width_158) ; \+indep(s56)).

evidence(all_consistent(waist_width_158)).
query(true_val(waist_width_158, v254)).
query(true_val(waist_width_158, unk_ww158)).

% @attr tip_tail_width_size_158
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size (158cm)
% @values v299=299.0 unk_ttw158=Unknown
% @importance 1.0

0.88::acc(s1, tip_tail_width_size_158).

0.90::true_val(tip_tail_width_size_158, v299); 0.10::true_val(tip_tail_width_size_158, unk_ttw158).

measured(s1, tip_tail_width_size_158, v299).

all_consistent(tip_tail_width_size_158) :-
    (indep(s1), consistent(s1, tip_tail_width_size_158) ; \+indep(s1)).

evidence(all_consistent(tip_tail_width_size_158)).
query(true_val(tip_tail_width_size_158, v299)).
query(true_val(tip_tail_width_size_158, unk_ttw158)).

% @attr effective_edge_158
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 158cm
% @values v1230=1230.0 unk_ee158=Unknown
% @importance 0.97

0.88::acc(s1, effective_edge_158).
0.90::acc(s56, effective_edge_158).

0.95::true_val(effective_edge_158, v1230); 0.05::true_val(effective_edge_158, unk_ee158).

measured(s1, effective_edge_158, v1230).
measured(s56, effective_edge_158, v1230).

all_consistent(effective_edge_158) :-
    (indep(s1), consistent(s1, effective_edge_158) ; \+indep(s1)),
    (indep(s56), consistent(s56, effective_edge_158) ; \+indep(s56)).

evidence(all_consistent(effective_edge_158)).
query(true_val(effective_edge_158, v1230)).
query(true_val(effective_edge_158, unk_ee158)).

% @attr recommended_weight_range_size_158
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (158cm)
% @values w65_90=65-90kg unk_rw158=Unknown
% @importance 1.0

0.88::acc(s1, recommended_weight_range_size_158).

0.90::true_val(recommended_weight_range_size_158, w65_90); 0.10::true_val(recommended_weight_range_size_158, unk_rw158).

measured(s1, recommended_weight_range_size_158, w65_90).

all_consistent(recommended_weight_range_size_158) :-
    (indep(s1), consistent(s1, recommended_weight_range_size_158) ; \+indep(s1)).

evidence(all_consistent(recommended_weight_range_size_158)).
query(true_val(recommended_weight_range_size_158, w65_90)).
query(true_val(recommended_weight_range_size_158, unk_rw158)).

% @attr waist_width_155w
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 155W
% @values v259=259.0 unk_ww155w=Unknown
% @importance 0.97

0.88::acc(s1, waist_width_155w).
0.90::acc(s56, waist_width_155w).

0.95::true_val(waist_width_155w, v259); 0.05::true_val(waist_width_155w, unk_ww155w).

measured(s1, waist_width_155w, v259).
measured(s56, waist_width_155w, v259).

all_consistent(waist_width_155w) :-
    (indep(s1), consistent(s1, waist_width_155w) ; \+indep(s1)),
    (indep(s56), consistent(s56, waist_width_155w) ; \+indep(s56)).

evidence(all_consistent(waist_width_155w)).
query(true_val(waist_width_155w, v259)).
query(true_val(waist_width_155w, unk_ww155w)).

% @attr tip_tail_width_size_155w
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size (155W)
% @values v304=304.0 unk_ttw155w=Unknown
% @importance 1.0

0.88::acc(s1, tip_tail_width_size_155w).

0.90::true_val(tip_tail_width_size_155w, v304); 0.10::true_val(tip_tail_width_size_155w, unk_ttw155w).

measured(s1, tip_tail_width_size_155w, v304).

all_consistent(tip_tail_width_size_155w) :-
    (indep(s1), consistent(s1, tip_tail_width_size_155w) ; \+indep(s1)).

evidence(all_consistent(tip_tail_width_size_155w)).
query(true_val(tip_tail_width_size_155w, v304)).
query(true_val(tip_tail_width_size_155w, unk_ttw155w)).

% @attr effective_edge_155w
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 155W
% @values v1205=1205.0 unk_ee155w=Unknown
% @importance 0.97

0.88::acc(s1, effective_edge_155w).
0.90::acc(s56, effective_edge_155w).

0.95::true_val(effective_edge_155w, v1205); 0.05::true_val(effective_edge_155w, unk_ee155w).

measured(s1, effective_edge_155w, v1205).
measured(s56, effective_edge_155w, v1205).

all_consistent(effective_edge_155w) :-
    (indep(s1), consistent(s1, effective_edge_155w) ; \+indep(s1)),
    (indep(s56), consistent(s56, effective_edge_155w) ; \+indep(s56)).

evidence(all_consistent(effective_edge_155w)).
query(true_val(effective_edge_155w, v1205)).
query(true_val(effective_edge_155w, unk_ee155w)).

% @attr recommended_weight_range_size_155w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (155W)
% @values w55_85=55-85kg unk_rw155w=Unknown
% @importance 1.0

0.88::acc(s1, recommended_weight_range_size_155w).

0.90::true_val(recommended_weight_range_size_155w, w55_85); 0.10::true_val(recommended_weight_range_size_155w, unk_rw155w).

measured(s1, recommended_weight_range_size_155w, w55_85).

all_consistent(recommended_weight_range_size_155w) :-
    (indep(s1), consistent(s1, recommended_weight_range_size_155w) ; \+indep(s1)).

evidence(all_consistent(recommended_weight_range_size_155w)).
query(true_val(recommended_weight_range_size_155w, w55_85)).
query(true_val(recommended_weight_range_size_155w, unk_rw155w)).

% @attr waist_width_158w
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 158W
% @values v262=262.0 unk_ww158w=Unknown
% @importance 0.97

0.88::acc(s1, waist_width_158w).
0.90::acc(s56, waist_width_158w).

0.95::true_val(waist_width_158w, v262); 0.05::true_val(waist_width_158w, unk_ww158w).

measured(s1, waist_width_158w, v262).
measured(s56, waist_width_158w, v262).

all_consistent(waist_width_158w) :-
    (indep(s1), consistent(s1, waist_width_158w) ; \+indep(s1)),
    (indep(s56), consistent(s56, waist_width_158w) ; \+indep(s56)).

evidence(all_consistent(waist_width_158w)).
query(true_val(waist_width_158w, v262)).
query(true_val(waist_width_158w, unk_ww158w)).

% @attr tip_tail_width_size_158w
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size (158W)
% @values v307=307.0 unk_ttw158w=Unknown
% @importance 1.0

0.88::acc(s1, tip_tail_width_size_158w).

0.90::true_val(tip_tail_width_size_158w, v307); 0.10::true_val(tip_tail_width_size_158w, unk_ttw158w).

measured(s1, tip_tail_width_size_158w, v307).

all_consistent(tip_tail_width_size_158w) :-
    (indep(s1), consistent(s1, tip_tail_width_size_158w) ; \+indep(s1)).

evidence(all_consistent(tip_tail_width_size_158w)).
query(true_val(tip_tail_width_size_158w, v307)).
query(true_val(tip_tail_width_size_158w, unk_ttw158w)).

% @attr effective_edge_158w
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 158W
% @values v1230=1230.0 v123=123.0
% @importance 0.97

0.55::acc(s1, effective_edge_158w).
0.92::acc(s56, effective_edge_158w).

0.10::true_val(effective_edge_158w, v123); 0.90::true_val(effective_edge_158w, v1230).

measured(s1, effective_edge_158w, v123).
measured(s56, effective_edge_158w, v1230).

all_consistent(effective_edge_158w) :-
    (indep(s1), consistent(s1, effective_edge_158w) ; \+indep(s1)),
    consistent(s56, effective_edge_158w).

evidence(all_consistent(effective_edge_158w)).
query(true_val(effective_edge_158w, v123)).
query(true_val(effective_edge_158w, v1230)).

% @attr recommended_weight_range_size_158w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (158W)
% @values w60_90=60-90kg unk_rw158w=Unknown
% @importance 1.0

0.88::acc(s1, recommended_weight_range_size_158w).

0.90::true_val(recommended_weight_range_size_158w, w60_90); 0.10::true_val(recommended_weight_range_size_158w, unk_rw158w).

measured(s1, recommended_weight_range_size_158w, w60_90).

all_consistent(recommended_weight_range_size_158w) :-
    (indep(s1), consistent(s1, recommended_weight_range_size_158w) ; \+indep(s1)).

evidence(all_consistent(recommended_weight_range_size_158w)).
query(true_val(recommended_weight_range_size_158w, w60_90)).
query(true_val(recommended_weight_range_size_158w, unk_rw158w)).

% @attr waist_width_162
% @type numeric
% @unit mm
% @canonical false
% @original_name 162cm waist width
% @values v262=262.0 unk_ww162=Unknown
% @importance 0.95

0.90::acc(s56, waist_width_162).

0.88::true_val(waist_width_162, v262); 0.12::true_val(waist_width_162, unk_ww162).

measured(s56, waist_width_162, v262).

all_consistent(waist_width_162) :- consistent(s56, waist_width_162).

evidence(all_consistent(waist_width_162)).
query(true_val(waist_width_162, v262)).
query(true_val(waist_width_162, unk_ww162)).

% @attr effective_edge_162
% @type numeric
% @unit mm
% @canonical false
% @original_name 162cm effective edge
% @values v1266=1266.0 unk_ee162=Unknown
% @importance 0.95

0.90::acc(s56, effective_edge_162).

0.88::true_val(effective_edge_162, v1266); 0.12::true_val(effective_edge_162, unk_ee162).

measured(s56, effective_edge_162, v1266).

all_consistent(effective_edge_162) :- consistent(s56, effective_edge_162).

evidence(all_consistent(effective_edge_162)).
query(true_val(effective_edge_162, v1266)).
query(true_val(effective_edge_162, unk_ee162)).

% @attr customer_rating_merchant
% @type numeric
% @unit out_of_5
% @canonical false
% @original_name Customer rating (merchant)
% @values v5_0=5.0 unk_rating=Unknown
% @importance 1.0

0.88::acc(s1, customer_rating_merchant).

0.85::true_val(customer_rating_merchant, v5_0); 0.15::true_val(customer_rating_merchant, unk_rating).

measured(s1, customer_rating_merchant, v5_0).

all_consistent(customer_rating_merchant) :- consistent(s1, customer_rating_merchant).

evidence(all_consistent(customer_rating_merchant)).
query(true_val(customer_rating_merchant, v5_0)).
query(true_val(customer_rating_merchant, unk_rating)).

% @attr number_of_reviews_merchant
% @type numeric
% @unit count
% @canonical false
% @original_name Number of reviews (merchant)
% @values v4=4 unk_num_reviews=Unknown
% @importance 1.0

0.88::acc(s1, number_of_reviews_merchant).

0.85::true_val(number_of_reviews_merchant, v4); 0.15::true_val(number_of_reviews_merchant, unk_num_reviews).

measured(s1, number_of_reviews_merchant, v4).

all_consistent(number_of_reviews_merchant) :- consistent(s1, number_of_reviews_merchant).

evidence(all_consistent(number_of_reviews_merchant)).
query(true_val(number_of_reviews_merchant, v4)).
query(true_val(number_of_reviews_merchant, unk_num_reviews)).

% @attr review_curated_expert
% @type categorical
% @canonical false
% @original_name Review (Curated.com expert)
% @values fun_versatile_park=Fun_versatile_park_board unk_review_curated=Unknown
% @importance 0.9

0.85::acc(s46, review_curated_expert).

0.82::true_val(review_curated_expert, fun_versatile_park); 0.18::true_val(review_curated_expert, unk_review_curated).

measured(s46, review_curated_expert, fun_versatile_park).

all_consistent(review_curated_expert) :- consistent(s46, review_curated_expert).

evidence(all_consistent(review_curated_expert)).
query(true_val(review_curated_expert, fun_versatile_park)).
query(true_val(review_curated_expert, unk_review_curated)).

% @attr pop_performance
% @type categorical
% @canonical false
% @original_name Pop performance
% @values explosive_responsive=Explosive_responsive_pop unk_pop=Unknown
% @importance 0.9

0.85::acc(s46, pop_performance).

0.82::true_val(pop_performance, explosive_responsive); 0.18::true_val(pop_performance, unk_pop).

measured(s46, pop_performance, explosive_responsive).

all_consistent(pop_performance) :- consistent(s46, pop_performance).

evidence(all_consistent(pop_performance)).
query(true_val(pop_performance, explosive_responsive)).
query(true_val(pop_performance, unk_pop)).

% @attr groomer_performance
% @type categorical
% @canonical false
% @original_name Groomer performance
% @values good_carving_moderate_speed=Good_carving_moderate_speed unk_groomer=Unknown
% @importance 0.9

0.85::acc(s46, groomer_performance).

0.82::true_val(groomer_performance, good_carving_moderate_speed); 0.18::true_val(groomer_performance, unk_groomer).

measured(s46, groomer_performance, good_carving_moderate_speed).

all_consistent(groomer_performance) :- consistent(s46, groomer_performance).

evidence(all_consistent(groomer_performance)).
query(true_val(groomer_performance, good_carving_moderate_speed)).
query(true_val(groomer_performance, unk_groomer)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name Turn initiation
% @values nimble_playful_easy=Nimble_playful_easy unk_turn=Unknown
% @importance 0.9

0.85::acc(s46, turn_initiation_performance).
0.88::acc(s47, turn_initiation_performance).

0.95::true_val(turn_initiation_performance, nimble_playful_easy); 0.05::true_val(turn_initiation_performance, unk_turn).

measured(s46, turn_initiation_performance, nimble_playful_easy).
measured(s47, turn_initiation_performance, nimble_playful_easy).

all_consistent(turn_initiation_performance) :-
    consistent(s46, turn_initiation_performance),
    consistent(s47, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, nimble_playful_easy)).
query(true_val(turn_initiation_performance, unk_turn)).

% @attr park_performance
% @type categorical
% @canonical false
% @original_name Park performance
% @values excellent_park=Excellent_true_twin_durable unk_park=Unknown
% @importance 0.9

0.85::acc(s46, park_performance).

0.82::true_val(park_performance, excellent_park); 0.18::true_val(park_performance, unk_park).

measured(s46, park_performance, excellent_park).

all_consistent(park_performance) :- consistent(s46, park_performance).

evidence(all_consistent(park_performance)).
query(true_val(park_performance, excellent_park)).
query(true_val(park_performance, unk_park)).

% @attr value_for_money
% @type categorical
% @canonical false
% @original_name Value for money
% @values average_price_point=Average_price_point unk_value=Unknown
% @importance 0.9

0.82::acc(s46, value_for_money).

0.78::true_val(value_for_money, average_price_point); 0.22::true_val(value_for_money, unk_value).

measured(s46, value_for_money, average_price_point).

all_consistent(value_for_money) :- consistent(s46, value_for_money).

evidence(all_consistent(value_for_money)).
query(true_val(value_for_money, average_price_point)).
query(true_val(value_for_money, unk_value)).

% @attr sizing_advice
% @type categorical
% @canonical false
% @original_name Sizing advice
% @values size_down_flex_up_stiff=Size_down_for_flex_up_for_stiff unk_sizing=Unknown
% @importance 0.9

0.82::acc(s46, sizing_advice).

0.78::true_val(sizing_advice, size_down_flex_up_stiff); 0.22::true_val(sizing_advice, unk_sizing).

measured(s46, sizing_advice, size_down_flex_up_stiff).

all_consistent(sizing_advice) :- consistent(s46, sizing_advice).

evidence(all_consistent(sizing_advice)).
query(true_val(sizing_advice, size_down_flex_up_stiff)).
query(true_val(sizing_advice, unk_sizing)).

% @attr ride_feel_snowboard_mag
% @type categorical
% @canonical false
% @original_name Snowboard Mag board test (2023) ride feel
% @values fine_tuned_park_machine=Fine_tuned_park_machine unk_ride_feel=Unknown
% @importance 0.9

0.88::acc(s47, ride_feel_snowboard_mag).

0.85::true_val(ride_feel_snowboard_mag, fine_tuned_park_machine); 0.15::true_val(ride_feel_snowboard_mag, unk_ride_feel).

measured(s47, ride_feel_snowboard_mag, fine_tuned_park_machine).

all_consistent(ride_feel_snowboard_mag) :- consistent(s47, ride_feel_snowboard_mag).

evidence(all_consistent(ride_feel_snowboard_mag)).
query(true_val(ride_feel_snowboard_mag, fine_tuned_park_machine)).
query(true_val(ride_feel_snowboard_mag, unk_ride_feel)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values less_stable_steep_ice=Less_stable_steep_icy unk_negative=Unknown
% @importance 0.9

0.88::acc(s47, negative_aspect).
0.85::acc(s46, negative_aspect).

0.95::true_val(negative_aspect, less_stable_steep_ice); 0.05::true_val(negative_aspect, unk_negative).

measured(s47, negative_aspect, less_stable_steep_ice).
measured(s46, negative_aspect, less_stable_steep_ice).

all_consistent(negative_aspect) :-
    consistent(s47, negative_aspect),
    consistent(s46, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, less_stable_steep_ice)).
query(true_val(negative_aspect, unk_negative)).

% @attr edge_hold_performance
% @type categorical
% @canonical false
% @original_name Snowboard Mag edge hold
% @values gentle_but_holds=Gentle_initiation_holds_edge unk_edge_hold=Unknown
% @importance 0.9

0.88::acc(s47, edge_hold_performance).

0.85::true_val(edge_hold_performance, gentle_but_holds); 0.15::true_val(edge_hold_performance, unk_edge_hold).

measured(s47, edge_hold_performance, gentle_but_holds).

all_consistent(edge_hold_performance) :- consistent(s47, edge_hold_performance).

evidence(all_consistent(edge_hold_performance)).
query(true_val(edge_hold_performance, gentle_but_holds)).
query(true_val(edge_hold_performance, unk_edge_hold)).

% @attr rider_quote_platinum_pick
% @type categorical
% @canonical false
% @original_name Snowboard Mag Platinum Pick (2026) rider quote
% @values good_pop_snappy_park=Good_pop_super_snappy_park unk_rider_quote=Unknown
% @importance 0.85

0.87::acc(s49, rider_quote_platinum_pick).

0.85::true_val(rider_quote_platinum_pick, good_pop_snappy_park); 0.15::true_val(rider_quote_platinum_pick, unk_rider_quote).

measured(s49, rider_quote_platinum_pick, good_pop_snappy_park).

all_consistent(rider_quote_platinum_pick) :- consistent(s49, rider_quote_platinum_pick).

evidence(all_consistent(rider_quote_platinum_pick)).
query(true_val(rider_quote_platinum_pick, good_pop_snappy_park)).
query(true_val(rider_quote_platinum_pick, unk_rider_quote)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name Forum criticism
% @values average_sub_par_2023=Average_sub_par_dead_board_2023 unk_forum_crit=Unknown
% @importance 0.8

0.55::acc(s74, user_review_forum).

0.45::true_val(user_review_forum, average_sub_par_2023); 0.55::true_val(user_review_forum, unk_forum_crit).

measured(s74, user_review_forum, average_sub_par_2023).

all_consistent(user_review_forum) :- consistent(s74, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, average_sub_par_2023)).
query(true_val(user_review_forum, unk_forum_crit)).

% @attr user_review_forum_alternative
% @type categorical
% @canonical false
% @original_name Forum alternative suggestion
% @values huck_knife_assassin=Huck_Knife_or_Assassin unk_forum_alt=Unknown
% @importance 0.8

0.55::acc(s74, user_review_forum_alternative).

0.45::true_val(user_review_forum_alternative, huck_knife_assassin); 0.55::true_val(user_review_forum_alternative, unk_forum_alt).

measured(s74, user_review_forum_alternative, huck_knife_assassin).

all_consistent(user_review_forum_alternative) :- consistent(s74, user_review_forum_alternative).

evidence(all_consistent(user_review_forum_alternative)).
query(true_val(user_review_forum_alternative, huck_knife_assassin)).
query(true_val(user_review_forum_alternative, unk_forum_alt)).

% @attr user_review_forum_comparison
% @type categorical
% @canonical false
% @original_name Forum comparison to Villain
% @values same_on_paper_unconfirmed=Same_on_paper_unconfirmed_practice unk_forum_comp=Unknown
% @importance 0.8

0.50::acc(s74, user_review_forum_comparison).

0.40::true_val(user_review_forum_comparison, same_on_paper_unconfirmed); 0.60::true_val(user_review_forum_comparison, unk_forum_comp).

measured(s74, user_review_forum_comparison, same_on_paper_unconfirmed).

all_consistent(user_review_forum_comparison) :- consistent(s74, user_review_forum_comparison).

evidence(all_consistent(user_review_forum_comparison)).
query(true_val(user_review_forum_comparison, same_on_paper_unconfirmed)).
query(true_val(user_review_forum_comparison, unk_forum_comp)).

% @attr review_overall_quote
% @type categorical
% @canonical false
% @original_name Overall review quote
% @values sweet_soft_park_rail=Sweet_soft_park_beginner_to_advanced_rail unk_overall_quote=Unknown
% @importance 0.9

0.88::acc(s47, review_overall_quote).

0.85::true_val(review_overall_quote, sweet_soft_park_rail); 0.15::true_val(review_overall_quote, unk_overall_quote).

measured(s47, review_overall_quote, sweet_soft_park_rail).

all_consistent(review_overall_quote) :- consistent(s47, review_overall_quote).

evidence(all_consistent(review_overall_quote)).
query(true_val(review_overall_quote, sweet_soft_park_rail)).
query(true_val(review_overall_quote, unk_overall_quote)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand (Huck Knife)
% @values huck_knife=Salomon_Huck_Knife unk_comp_same=Unknown
% @importance 0.75

0.82::acc(s68, comparable_board_same_brand).
0.60::acc(s74, comparable_board_same_brand).

0.90::true_val(comparable_board_same_brand, huck_knife); 0.10::true_val(comparable_board_same_brand, unk_comp_same).

measured(s68, comparable_board_same_brand, huck_knife).
measured(s74, comparable_board_same_brand, huck_knife).

all_consistent(comparable_board_same_brand) :-
    consistent(s68, comparable_board_same_brand),
    consistent(s74, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, huck_knife)).
query(true_val(comparable_board_same_brand, unk_comp_same)).

% @attr comparable_board_same_brand_assassin
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Assassin)
% @values assassin=Salomon_Assassin unk_comp_assassin=Unknown
% @importance 0.75

0.82::acc(s68, comparable_board_same_brand_assassin).

0.80::true_val(comparable_board_same_brand_assassin, assassin); 0.20::true_val(comparable_board_same_brand_assassin, unk_comp_assassin).

measured(s68, comparable_board_same_brand_assassin, assassin).

all_consistent(comparable_board_same_brand_assassin) :- consistent(s68, comparable_board_same_brand_assassin).

evidence(all_consistent(comparable_board_same_brand_assassin)).
query(true_val(comparable_board_same_brand_assassin, assassin)).
query(true_val(comparable_board_same_brand_assassin, unk_comp_assassin)).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values salomon_district=Salomon_District unk_binding=Unknown
% @importance 0.75

0.82::acc(s68, binding_compatibility).

0.80::true_val(binding_compatibility, salomon_district); 0.20::true_val(binding_compatibility, unk_binding).

measured(s68, binding_compatibility, salomon_district).

all_consistent(binding_compatibility) :- consistent(s68, binding_compatibility).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, salomon_district)).
query(true_val(binding_compatibility, unk_binding)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand (Burton Process Flying V)
% @values burton_process=Burton_Process_Flying_V unk_comp_cross=Unknown
% @importance 0.7

0.78::acc(s69, comparable_board_cross_brand).

0.75::true_val(comparable_board_cross_brand, burton_process); 0.25::true_val(comparable_board_cross_brand, unk_comp_cross).

measured(s69, comparable_board_cross_brand, burton_process).

all_consistent(comparable_board_cross_brand) :- consistent(s69, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, burton_process)).
query(true_val(comparable_board_cross_brand, unk_comp_cross)).

% @attr comparable_board_cross_brand_yes_basic
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Yes Basic)
% @values yes_basic=Yes_Basic unk_comp_yes=Unknown
% @importance 0.7

0.78::acc(s64, comparable_board_cross_brand_yes_basic).

0.72::true_val(comparable_board_cross_brand_yes_basic, yes_basic); 0.28::true_val(comparable_board_cross_brand_yes_basic, unk_comp_yes).

measured(s64, comparable_board_cross_brand_yes_basic, yes_basic).

all_consistent(comparable_board_cross_brand_yes_basic) :- consistent(s64, comparable_board_cross_brand_yes_basic).

evidence(all_consistent(comparable_board_cross_brand_yes_basic)).
query(true_val(comparable_board_cross_brand_yes_basic, yes_basic)).
query(true_val(comparable_board_cross_brand_yes_basic, unk_comp_yes)).

% @attr comparable_board_cross_brand_ride_twinpig
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Ride Twinpig)
% @values ride_twinpig=Ride_Twinpig unk_comp_twinpig=Unknown
% @importance 0.7

0.75::acc(s39, comparable_board_cross_brand_ride_twinpig).

0.70::true_val(comparable_board_cross_brand_ride_twinpig, ride_twinpig); 0.30::true_val(comparable_board_cross_brand_ride_twinpig, unk_comp_twinpig).

measured(s39, comparable_board_cross_brand_ride_twinpig, ride_twinpig).

all_consistent(comparable_board_cross_brand_ride_twinpig) :- consistent(s39, comparable_board_cross_brand_ride_twinpig).

evidence(all_consistent(comparable_board_cross_brand_ride_twinpig)).
query(true_val(comparable_board_cross_brand_ride_twinpig, ride_twinpig)).
query(true_val(comparable_board_cross_brand_ride_twinpig, unk_comp_twinpig)).

% @attr comparable_board_cross_brand_capita_doa
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Capita DOA)
% @values capita_doa=Capita_DOA unk_comp_doa=Unknown
% @importance 0.65

0.75::acc(s65, comparable_board_cross_brand_capita_doa).

0.70::true_val(comparable_board_cross_brand_capita_doa, capita_doa); 0.30::true_val(comparable_board_cross_brand_capita_doa, unk_comp_doa).

measured(s65, comparable_board_cross_brand_capita_doa, capita_doa).

all_consistent(comparable_board_cross_brand_capita_doa) :- consistent(s65, comparable_board_cross_brand_capita_doa).

evidence(all_consistent(comparable_board_cross_brand_capita_doa)).
query(true_val(comparable_board_cross_brand_capita_doa, capita_doa)).
query(true_val(comparable_board_cross_brand_capita_doa, unk_comp_doa)).

% @attr comparable_board_cross_brand_arbor_relapse
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Arbor Relapse)
% @values arbor_relapse=Arbor_Relapse unk_comp_relapse=Unknown
% @importance 0.9

0.82::acc(s46, comparable_board_cross_brand_arbor_relapse).

0.78::true_val(comparable_board_cross_brand_arbor_relapse, arbor_relapse); 0.22::true_val(comparable_board_cross_brand_arbor_relapse, unk_comp_relapse).

measured(s46, comparable_board_cross_brand_arbor_relapse, arbor_relapse).

all_consistent(comparable_board_cross_brand_arbor_relapse) :- consistent(s46, comparable_board_cross_brand_arbor_relapse).

evidence(all_consistent(comparable_board_cross_brand_arbor_relapse)).
query(true_val(comparable_board_cross_brand_arbor_relapse, arbor_relapse)).
query(true_val(comparable_board_cross_brand_arbor_relapse, unk_comp_relapse)).

% @attr retailer_evo
% @type categorical
% @canonical false
% @original_name evo.com retailer description
% @values major_us_price_match=Major_US_retailer_price_match unk_ret_evo=Unknown
% @importance 0.5

0.85::acc(s51, retailer_evo).

0.80::true_val(retailer_evo, major_us_price_match); 0.20::true_val(retailer_evo, unk_ret_evo).

measured(s51, retailer_evo, major_us_price_match).

all_consistent(retailer_evo) :- consistent(s51, retailer_evo).

evidence(all_consistent(retailer_evo)).
query(true_val(retailer_evo, major_us_price_match)).
query(true_val(retailer_evo, unk_ret_evo)).

% @attr retailer_backcountry
% @type categorical
% @canonical false
% @original_name Backcountry.com retailer description
% @values major_us_free_ship=Major_US_retailer_lowest_price unk_ret_bc=Unknown
% @importance 0.95

0.88::acc(s56, retailer_backcountry).

0.85::true_val(retailer_backcountry, major_us_free_ship); 0.15::true_val(retailer_backcountry, unk_ret_bc).

measured(s56, retailer_backcountry, major_us_free_ship).

all_consistent(retailer_backcountry) :- consistent(s56, retailer_backcountry).

evidence(all_consistent(retailer_backcountry)).
query(true_val(retailer_backcountry, major_us_free_ship)).
query(true_val(retailer_backcountry, unk_ret_bc)).

% @attr retailer_rei
% @type categorical
% @canonical false
% @original_name REI Co-op retailer description
% @values major_us_coop=Major_US_outdoor_coop unk_ret_rei=Unknown
% @importance 0.7

0.82::acc(s13, retailer_rei).

0.80::true_val(retailer_rei, major_us_coop); 0.20::true_val(retailer_rei, unk_ret_rei).

measured(s13, retailer_rei, major_us_coop).

all_consistent(retailer_rei) :- consistent(s13, retailer_rei).

evidence(all_consistent(retailer_rei)).
query(true_val(retailer_rei, major_us_coop)).
query(true_val(retailer_rei, unk_ret_rei)).

% @attr retailer_tactics
% @type categorical
% @canonical false
% @original_name Tactics retailer description
% @values major_us_skate_snow=Major_US_skate_snow unk_ret_tactics=Unknown
% @importance 0.6

0.80::acc(s39, retailer_tactics).

0.78::true_val(retailer_tactics, major_us_skate_snow); 0.22::true_val(retailer_tactics, unk_ret_tactics).

measured(s39, retailer_tactics, major_us_skate_snow).

all_consistent(retailer_tactics) :- consistent(s39, retailer_tactics).

evidence(all_consistent(retailer_tactics)).
query(true_val(retailer_tactics, major_us_skate_snow)).
query(true_val(retailer_tactics, unk_ret_tactics)).

% @attr retailer_ken_jones
% @type categorical
% @canonical false
% @original_name Ken Jones Ski Mart retailer description
% @values us_retailer_price_match=US_retailer_price_match unk_ret_kj=Unknown
% @importance 0.9

0.78::acc(s38, retailer_ken_jones).

0.72::true_val(retailer_ken_jones, us_retailer_price_match); 0.28::true_val(retailer_ken_jones, unk_ret_kj).

measured(s38, retailer_ken_jones, us_retailer_price_match).

all_consistent(retailer_ken_jones) :- consistent(s38, retailer_ken_jones).

evidence(all_consistent(retailer_ken_jones)).
query(true_val(retailer_ken_jones, us_retailer_price_match)).
query(true_val(retailer_ken_jones, unk_ret_kj)).

% @attr retailer_subvert
% @type categorical
% @canonical false
% @original_name Subvert Board Store retailer description
% @values independent_uk_shop=Independent_UK_snowboard_shop unk_ret_subvert=Unknown
% @importance 0.4

0.75::acc(s15, retailer_subvert).

0.70::true_val(retailer_subvert, independent_uk_shop); 0.30::true_val(retailer_subvert, unk_ret_subvert).

measured(s15, retailer_subvert, independent_uk_shop).

all_consistent(retailer_subvert) :- consistent(s15, retailer_subvert).

evidence(all_consistent(retailer_subvert)).
query(true_val(retailer_subvert, independent_uk_shop)).
query(true_val(retailer_subvert, unk_ret_subvert)).

% @attr retailer_absolute_snow
% @type categorical
% @canonical false
% @original_name Absolute-Snow retailer description
% @values uk_retailer=UK_retailer unk_ret_abs=Unknown
% @importance 0.5

0.75::acc(s29, retailer_absolute_snow).

0.70::true_val(retailer_absolute_snow, uk_retailer); 0.30::true_val(retailer_absolute_snow, unk_ret_abs).

measured(s29, retailer_absolute_snow, uk_retailer).

all_consistent(retailer_absolute_snow) :- consistent(s29, retailer_absolute_snow).

evidence(all_consistent(retailer_absolute_snow)).
query(true_val(retailer_absolute_snow, uk_retailer)).
query(true_val(retailer_absolute_snow, unk_ret_abs)).

% @attr retailer_rude_boys
% @type categorical
% @canonical false
% @original_name Rude Boys retailer description
% @values canadian_shop_banff=Canadian_shop_Banff_Alberta unk_ret_rb=Unknown
% @importance 0.4

0.70::acc(s15, retailer_rude_boys).

0.65::true_val(retailer_rude_boys, canadian_shop_banff); 0.35::true_val(retailer_rude_boys, unk_ret_rb).

measured(s15, retailer_rude_boys, canadian_shop_banff).

all_consistent(retailer_rude_boys) :- consistent(s15, retailer_rude_boys).

evidence(all_consistent(retailer_rude_boys)).
query(true_val(retailer_rude_boys, canadian_shop_banff)).
query(true_val(retailer_rude_boys, unk_ret_rb)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values park_rails_freestyle=Park_rails_jibs_freestyle_buttering unk_positive=Unknown
% @importance 0.9

0.85::acc(s46, positive_aspect).
0.88::acc(s47, positive_aspect).

0.95::true_val(positive_aspect, park_rails_freestyle); 0.05::true_val(positive_aspect, unk_positive).

measured(s46, positive_aspect, park_rails_freestyle).
measured(s47, positive_aspect, park_rails_freestyle).

all_consistent(positive_aspect) :-
    consistent(s46, positive_aspect),
    consistent(s47, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, park_rails_freestyle)).
query(true_val(positive_aspect, unk_positive)).

% @attr adequate_performance
% @type categorical
% @canonical false
% @original_name Board is adequate at
% @values groomer_carving_spring_powder=Groomer_carving_spring_small_powder unk_adequate=Unknown
% @importance 0.9

0.85::acc(s46, adequate_performance).

0.82::true_val(adequate_performance, groomer_carving_spring_powder); 0.18::true_val(adequate_performance, unk_adequate).

measured(s46, adequate_performance, groomer_carving_spring_powder).

all_consistent(adequate_performance) :- consistent(s46, adequate_performance).

evidence(all_consistent(adequate_performance)).
query(true_val(adequate_performance, groomer_carving_spring_powder)).
query(true_val(adequate_performance, unk_adequate)).

% @attr positive_aspect_versatility
% @type categorical
% @canonical false
% @original_name positive_aspect (beginner and experienced)
% @values good_all_levels_park=Good_for_park_beginners_and_experienced unk_pos_versatile=Unknown
% @importance 0.9

0.88::acc(s47, positive_aspect_versatility).

0.85::true_val(positive_aspect_versatility, good_all_levels_park); 0.15::true_val(positive_aspect_versatility, unk_pos_versatile).

measured(s47, positive_aspect_versatility, good_all_levels_park).

all_consistent(positive_aspect_versatility) :- consistent(s47, positive_aspect_versatility).

evidence(all_consistent(positive_aspect_versatility)).
query(true_val(positive_aspect_versatility, good_all_levels_park)).
query(true_val(positive_aspect_versatility, unk_pos_versatile)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values excellent_true_twin=Excellent_true_twin_0mm_setback unk_switch=Unknown
% @importance 0.95

0.88::acc(s12, switch_riding).

0.88::true_val(switch_riding, excellent_true_twin); 0.12::true_val(switch_riding, unk_switch).

measured(s12, switch_riding, excellent_true_twin).

all_consistent(switch_riding) :-
    (indep(s12), consistent(s12, switch_riding) ; \+indep(s12)).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, excellent_true_twin)).
query(true_val(switch_riding, unk_switch)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values yes_155w_158w=Yes_155W_and_158W unk_width_opt=Unknown
% @importance 1.0

0.90::acc(s1, width_options).

0.90::true_val(width_options, yes_155w_158w); 0.10::true_val(width_options, unk_width_opt).

measured(s1, width_options, yes_155w_158w).

all_consistent(width_options) :- consistent(s1, width_options).

evidence(all_consistent(width_options)).
query(true_val(width_options, yes_155w_158w)).
query(true_val(width_options, unk_width_opt)).

% @attr board_weight_grams
% @type numeric
% @unit grams
% @canonical true
% @original_name board_weight_grams
% @values not_published=Not_published unk_weight=Unknown
% @importance 0.5

0.50::acc(s1, board_weight_grams).

0.50::true_val(board_weight_grams, not_published); 0.50::true_val(board_weight_grams, unk_weight).

measured(s1, board_weight_grams, not_published).

all_consistent(board_weight_grams) :- consistent(s1, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, not_published)).
query(true_val(board_weight_grams, unk_weight)).