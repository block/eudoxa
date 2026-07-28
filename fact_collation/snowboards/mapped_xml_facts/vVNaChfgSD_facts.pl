0.12::indep(s2).
0.12::indep(s3).
0.12::indep(s4).
0.15::indep(s13).
0.15::indep(s22).
0.15::indep(s23).
0.20::indep(s27).
0.20::indep(s28).
0.15::indep(s29).
0.12::indep(s30).
0.12::indep(s31).
0.12::indep(s32).
0.15::indep(s33).
0.12::indep(s34).
0.15::indep(s35).
0.30::indep(s40).
0.15::indep(s41).
0.12::indep(s44).
0.20::indep(s47).
0.50::indep(s48).
0.20::indep(s74).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values rome_snowboards=Rome_Snowboards_Rome_SDS unk_brand=Unknown
% @importance 1.0

0.95::acc(s1, brand).
0.75::acc(s2, brand).

0.95::true_val(brand, rome_snowboards); 0.05::true_val(brand, unk_brand).

measured(s1, brand, rome_snowboards).
measured(s2, brand, rome_snowboards).

all_consistent(brand) :-
    consistent(s1, brand),
    (indep(s2), consistent(s2, brand) ; \+indep(s2)).

evidence(all_consistent(brand)).
query(true_val(brand, rome_snowboards)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values stale_crewzer=Stale_Crewzer unk_model_name=Unknown
% @importance 1.0

0.95::acc(s1, model_name).
0.75::acc(s2, model_name).

0.95::true_val(model_name, stale_crewzer); 0.05::true_val(model_name, unk_model_name).

measured(s1, model_name, stale_crewzer).
measured(s2, model_name, stale_crewzer).

all_consistent(model_name) :-
    consistent(s1, model_name),
    (indep(s2), consistent(s2, model_name) ; \+indep(s2)).

evidence(all_consistent(model_name)).
query(true_val(model_name, stale_crewzer)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2027=2027 unk_model_year=Unknown
% @importance 0.75

0.75::acc(s3, model_year).
0.65::acc(s4, model_year).

0.92::true_val(model_year, y2027); 0.08::true_val(model_year, unk_model_year).

measured(s3, model_year, y2027).
measured(s4, model_year, y2027).

all_consistent(model_year) :-
    consistent(s3, model_year),
    (indep(s4), consistent(s4, model_year) ; \+indep(s4)).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2027)).
query(true_val(model_year, unk_model_year)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values rome_sds=Rome_Snowboard_Design_Syndicate unk_manufacturer=Unknown
% @importance 0.5

0.90::acc(s5, manufacturer).

0.81::true_val(manufacturer, rome_sds); 0.19::true_val(manufacturer, unk_manufacturer).

measured(s5, manufacturer, rome_sds).

all_consistent(manufacturer) :- consistent(s5, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, rome_sds)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr manufacturer_founded
% @type categorical
% @canonical false
% @original_name Manufacturer founded
% @values founded_2001_waterbury_vt=2001_in_Waterbury_Vermont unk_manufacturer_founded=Unknown
% @importance 0.5

0.90::acc(s6, manufacturer_founded).
0.82::acc(s7, manufacturer_founded).

0.95::true_val(manufacturer_founded, founded_2001_waterbury_vt); 0.05::true_val(manufacturer_founded, unk_manufacturer_founded).

measured(s6, manufacturer_founded, founded_2001_waterbury_vt).
measured(s7, manufacturer_founded, founded_2001_waterbury_vt).

all_consistent(manufacturer_founded) :-
    consistent(s6, manufacturer_founded),
    consistent(s7, manufacturer_founded).

evidence(all_consistent(manufacturer_founded)).
query(true_val(manufacturer_founded, founded_2001_waterbury_vt)).
query(true_val(manufacturer_founded, unk_manufacturer_founded)).

% @attr manufacturer_founders
% @type categorical
% @canonical false
% @original_name Manufacturer founders
% @values reid_maravetz=Josh_Reid_and_Paul_Maravetz_former_Burton unk_manufacturer_founders=Unknown
% @importance 0.425

0.82::acc(s7, manufacturer_founders).
0.72::acc(s8, manufacturer_founders).

0.92::true_val(manufacturer_founders, reid_maravetz); 0.08::true_val(manufacturer_founders, unk_manufacturer_founders).

measured(s7, manufacturer_founders, reid_maravetz).
measured(s8, manufacturer_founders, reid_maravetz).

all_consistent(manufacturer_founders) :-
    consistent(s7, manufacturer_founders),
    consistent(s8, manufacturer_founders).

evidence(all_consistent(manufacturer_founders)).
query(true_val(manufacturer_founders, reid_maravetz)).
query(true_val(manufacturer_founders, unk_manufacturer_founders)).

% @attr parent_company
% @type categorical
% @canonical false
% @original_name Parent company
% @values nidecker_group=Nidecker_Group unk_parent_company=Unknown
% @importance 0.45

0.92::acc(s9, parent_company).

0.86::true_val(parent_company, nidecker_group); 0.14::true_val(parent_company, unk_parent_company).

measured(s9, parent_company, nidecker_group).

all_consistent(parent_company) :- consistent(s9, parent_company).

evidence(all_consistent(parent_company)).
query(true_val(parent_company, nidecker_group)).
query(true_val(parent_company, unk_parent_company)).

% @attr manufacturer_headquarters
% @type categorical
% @canonical false
% @original_name Manufacturer headquarters
% @values waterbury_vt=Waterbury_Vermont unk_manufacturer_headquarters=Unknown
% @importance 0.275

0.88::acc(s10, manufacturer_headquarters).
0.82::acc(s11, manufacturer_headquarters).

0.95::true_val(manufacturer_headquarters, waterbury_vt); 0.05::true_val(manufacturer_headquarters, unk_manufacturer_headquarters).

measured(s10, manufacturer_headquarters, waterbury_vt).
measured(s11, manufacturer_headquarters, waterbury_vt).

all_consistent(manufacturer_headquarters) :-
    consistent(s10, manufacturer_headquarters),
    consistent(s11, manufacturer_headquarters).

evidence(all_consistent(manufacturer_headquarters)).
query(true_val(manufacturer_headquarters, waterbury_vt)).
query(true_val(manufacturer_headquarters, unk_manufacturer_headquarters)).

% @attr manufacturer_brand_ethos
% @type categorical
% @canonical false
% @original_name Manufacturer brand ethos
% @values rider_driven_anti_establishment=Rider_driven_anti_establishment_from_snowboarders_for_snowboarders unk_manufacturer_brand_ethos=Unknown
% @importance 0.4

0.80::acc(s7, manufacturer_brand_ethos).
0.75::acc(s12, manufacturer_brand_ethos).

0.90::true_val(manufacturer_brand_ethos, rider_driven_anti_establishment); 0.10::true_val(manufacturer_brand_ethos, unk_manufacturer_brand_ethos).

measured(s7, manufacturer_brand_ethos, rider_driven_anti_establishment).
measured(s12, manufacturer_brand_ethos, rider_driven_anti_establishment).

all_consistent(manufacturer_brand_ethos) :-
    consistent(s7, manufacturer_brand_ethos),
    consistent(s12, manufacturer_brand_ethos).

evidence(all_consistent(manufacturer_brand_ethos)).
query(true_val(manufacturer_brand_ethos, rider_driven_anti_establishment)).
query(true_val(manufacturer_brand_ethos, unk_manufacturer_brand_ethos)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.95::acc(s1, product_type).

0.90::true_val(product_type, snowboard); 0.10::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).

all_consistent(product_type) :- consistent(s1, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values freestyle_all_mountain=Freestyle_All_Mountain unk_board_category=Unknown
% @importance 0.9

0.75::acc(s13, board_category).

0.67::true_val(board_category, freestyle_all_mountain); 0.33::true_val(board_category, unk_board_category).

measured(s13, board_category, freestyle_all_mountain).

all_consistent(board_category) :-
    (indep(s13), consistent(s13, board_category) ; \+indep(s13)).

evidence(all_consistent(board_category)).
query(true_val(board_category, freestyle_all_mountain)).
query(true_val(board_category, unk_board_category)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 1.0

0.95::acc(s14, gender).

0.90::true_val(gender, mens); 0.10::true_val(gender, unk_gender).

measured(s14, gender, mens).

all_consistent(gender) :- consistent(s14, gender).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values stale_sandbech=Stale_Sandbech unk_pro_rider_name=Unknown
% @importance 0.675

0.95::acc(s15, pro_rider_name).
0.93::acc(s16, pro_rider_name).

0.95::true_val(pro_rider_name, stale_sandbech); 0.05::true_val(pro_rider_name, unk_pro_rider_name).

measured(s15, pro_rider_name, stale_sandbech).
measured(s16, pro_rider_name, stale_sandbech).

all_consistent(pro_rider_name) :-
    consistent(s15, pro_rider_name),
    consistent(s16, pro_rider_name).

evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, stale_sandbech)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr pro_rider_nationality
% @type categorical
% @canonical false
% @original_name Pro rider nationality
% @values norwegian=Norwegian_born_June_3_1993 unk_pro_rider_nationality=Unknown
% @importance 0.5

0.88::acc(s17, pro_rider_nationality).

0.81::true_val(pro_rider_nationality, norwegian); 0.19::true_val(pro_rider_nationality, unk_pro_rider_nationality).

measured(s17, pro_rider_nationality, norwegian).

all_consistent(pro_rider_nationality) :- consistent(s17, pro_rider_nationality).

evidence(all_consistent(pro_rider_nationality)).
query(true_val(pro_rider_nationality, norwegian)).
query(true_val(pro_rider_nationality, unk_pro_rider_nationality)).

% @attr pro_rider_accomplishments
% @type categorical
% @canonical false
% @original_name Pro rider accomplishments
% @values olympic_silver_xgames_worlds=2014_Olympic_Silver_multiple_XGames_2017_World_gold_4x_Olympian unk_pro_rider_accomplishments=Unknown
% @importance 0.45

0.88::acc(s17, pro_rider_accomplishments).
0.88::acc(s18, pro_rider_accomplishments).

0.95::true_val(pro_rider_accomplishments, olympic_silver_xgames_worlds); 0.05::true_val(pro_rider_accomplishments, unk_pro_rider_accomplishments).

measured(s17, pro_rider_accomplishments, olympic_silver_xgames_worlds).
measured(s18, pro_rider_accomplishments, olympic_silver_xgames_worlds).

all_consistent(pro_rider_accomplishments) :-
    consistent(s17, pro_rider_accomplishments),
    consistent(s18, pro_rider_accomplishments).

evidence(all_consistent(pro_rider_accomplishments)).
query(true_val(pro_rider_accomplishments, olympic_silver_xgames_worlds)).
query(true_val(pro_rider_accomplishments, unk_pro_rider_accomplishments)).

% @attr pro_rider_status_at_rome
% @type categorical
% @canonical false
% @original_name Pro rider status at Rome
% @values longest_tenured_pro=Longest_tenured_Rome_Pro unk_pro_rider_status_at_rome=Unknown
% @importance 0.45

0.93::acc(s19, pro_rider_status_at_rome).

0.90::true_val(pro_rider_status_at_rome, longest_tenured_pro); 0.10::true_val(pro_rider_status_at_rome, unk_pro_rider_status_at_rome).

measured(s19, pro_rider_status_at_rome, longest_tenured_pro).

all_consistent(pro_rider_status_at_rome) :- consistent(s19, pro_rider_status_at_rome).

evidence(all_consistent(pro_rider_status_at_rome)).
query(true_val(pro_rider_status_at_rome, longest_tenured_pro)).
query(true_val(pro_rider_status_at_rome, unk_pro_rider_status_at_rome)).

% @attr anniversary_note
% @type categorical
% @canonical false
% @original_name Anniversary note (2025/2026 model)
% @values ten_year_anniversary=10_year_anniversary_pro_model unk_anniversary_note=Unknown
% @importance 0.7

0.82::acc(s20, anniversary_note).

0.72::true_val(anniversary_note, ten_year_anniversary); 0.28::true_val(anniversary_note, unk_anniversary_note).

measured(s20, anniversary_note, ten_year_anniversary).

all_consistent(anniversary_note) :- consistent(s20, anniversary_note).

evidence(all_consistent(anniversary_note)).
query(true_val(anniversary_note, ten_year_anniversary)).
query(true_val(anniversary_note, unk_anniversary_note)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values stale_fish=Stale_Fish_powder_focused_directional unk_comparable_board_same_brand=Unknown
% @importance 0.5

0.90::acc(s21, comparable_board_same_brand).

0.81::true_val(comparable_board_same_brand, stale_fish); 0.19::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s21, comparable_board_same_brand, stale_fish).

all_consistent(comparable_board_same_brand) :- consistent(s21, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, stale_fish)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr price_aud_merchant
% @type numeric
% @canonical true
% @original_name price_aud_merchant
% @unit AUD
% @values v1049_99=1049.99 unk_price_aud_merchant=Unknown
% @importance 0.9

0.90::acc(s3, price_aud_merchant).

0.71::true_val(price_aud_merchant, v1049_99); 0.29::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s3, price_aud_merchant, v1049_99).

all_consistent(price_aud_merchant) :-
    (indep(s3), consistent(s3, price_aud_merchant) ; \+indep(s3)).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v1049_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_aud_merchant_snow_central
% @type numeric
% @canonical false
% @original_name price_aud_merchant (Snow Central)
% @unit AUD
% @values v1049_99=1049.99 unk_price_aud_merchant_snow_central=Unknown
% @importance 0.85

0.90::acc(s22, price_aud_merchant_snow_central).

0.67::true_val(price_aud_merchant_snow_central, v1049_99); 0.33::true_val(price_aud_merchant_snow_central, unk_price_aud_merchant_snow_central).

measured(s22, price_aud_merchant_snow_central, v1049_99).

all_consistent(price_aud_merchant_snow_central) :-
    (indep(s22), consistent(s22, price_aud_merchant_snow_central) ; \+indep(s22)).

evidence(all_consistent(price_aud_merchant_snow_central)).
query(true_val(price_aud_merchant_snow_central, v1049_99)).
query(true_val(price_aud_merchant_snow_central, unk_price_aud_merchant_snow_central)).

% @attr price_aud_merchant_melbourne
% @type categorical
% @canonical false
% @original_name price_aud_merchant (Melbourne)
% @values listed_no_price=Listed_as_available_price_not_shown unk_price_aud_merchant_melbourne=Unknown
% @importance 0.6

0.75::acc(s23, price_aud_merchant_melbourne).

0.60::true_val(price_aud_merchant_melbourne, listed_no_price); 0.40::true_val(price_aud_merchant_melbourne, unk_price_aud_merchant_melbourne).

measured(s23, price_aud_merchant_melbourne, listed_no_price).

all_consistent(price_aud_merchant_melbourne) :-
    (indep(s23), consistent(s23, price_aud_merchant_melbourne) ; \+indep(s23)).

evidence(all_consistent(price_aud_merchant_melbourne)).
query(true_val(price_aud_merchant_melbourne, listed_no_price)).
query(true_val(price_aud_merchant_melbourne, unk_price_aud_merchant_melbourne)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values preorder_may_2026=Preorder_estimated_May_2026_some_sizes_sold_out unk_availability_status=Unknown
% @importance 0.9

0.88::acc(s3, availability_status).

0.71::true_val(availability_status, preorder_may_2026); 0.29::true_val(availability_status, unk_availability_status).

measured(s3, availability_status, preorder_may_2026).

all_consistent(availability_status) :-
    (indep(s3), consistent(s3, availability_status) ; \+indep(s3)).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, preorder_may_2026)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_snow_central
% @type categorical
% @canonical false
% @original_name availability_status (Snow Central)
% @values preorder=Preorder unk_availability_status_snow_central=Unknown
% @importance 0.85

0.88::acc(s22, availability_status_snow_central).

0.67::true_val(availability_status_snow_central, preorder); 0.33::true_val(availability_status_snow_central, unk_availability_status_snow_central).

measured(s22, availability_status_snow_central, preorder).

all_consistent(availability_status_snow_central) :-
    (indep(s22), consistent(s22, availability_status_snow_central) ; \+indep(s22)).

evidence(all_consistent(availability_status_snow_central)).
query(true_val(availability_status_snow_central, preorder)).
query(true_val(availability_status_snow_central, unk_availability_status_snow_central)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v419_95=419.95 unk_price_usd_msrp=Unknown
% @importance 1.0

0.95::acc(s14, price_usd_msrp).

0.90::true_val(price_usd_msrp, v419_95); 0.10::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s14, price_usd_msrp, v419_95).

all_consistent(price_usd_msrp) :- consistent(s14, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v419_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_usd_msrp_rrp
% @type numeric
% @canonical false
% @original_name price_usd_msrp (RRP/MSRP)
% @unit USD
% @values v599_95=599.95 v550=550.0
% @importance 0.85

0.93::acc(s14, price_usd_msrp_rrp).
0.82::acc(s20, price_usd_msrp_rrp).
0.85::acc(s24, price_usd_msrp_rrp).
0.80::acc(s25, price_usd_msrp_rrp).

0.75::true_val(price_usd_msrp_rrp, v599_95); 0.25::true_val(price_usd_msrp_rrp, v550).

measured(s14, price_usd_msrp_rrp, v599_95).
measured(s20, price_usd_msrp_rrp, v550).
measured(s24, price_usd_msrp_rrp, v599_95).
measured(s25, price_usd_msrp_rrp, v599_95).

all_consistent(price_usd_msrp_rrp) :-
    consistent(s14, price_usd_msrp_rrp),
    consistent(s20, price_usd_msrp_rrp),
    consistent(s24, price_usd_msrp_rrp),
    consistent(s25, price_usd_msrp_rrp).

evidence(all_consistent(price_usd_msrp_rrp)).
query(true_val(price_usd_msrp_rrp, v599_95)).
query(true_val(price_usd_msrp_rrp, v550)).

% @attr price_eur_blue_tomato
% @type numeric
% @canonical false
% @original_name price_eur_blue_tomato
% @unit EUR
% @values v569_95=569.95 unk_price_eur_blue_tomato=Unknown
% @importance 0.6

0.72::acc(s26, price_eur_blue_tomato).

0.49::true_val(price_eur_blue_tomato, v569_95); 0.51::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).

measured(s26, price_eur_blue_tomato, v569_95).

all_consistent(price_eur_blue_tomato) :- consistent(s26, price_eur_blue_tomato).

evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v569_95)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

% @attr price_gbp_blue_tomato_uk
% @type numeric
% @canonical false
% @original_name price_gbp_blue_tomato_uk
% @unit GBP
% @values v510=510.0 unk_price_gbp_blue_tomato_uk=Unknown
% @importance 0.6

0.72::acc(s26, price_gbp_blue_tomato_uk).

0.49::true_val(price_gbp_blue_tomato_uk, v510); 0.51::true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk).

measured(s26, price_gbp_blue_tomato_uk, v510).

all_consistent(price_gbp_blue_tomato_uk) :- consistent(s26, price_gbp_blue_tomato_uk).

evidence(all_consistent(price_gbp_blue_tomato_uk)).
query(true_val(price_gbp_blue_tomato_uk, v510)).
query(true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status (evo)
% @values in_stock=In_stock unk_availability_status_evo=Unknown
% @importance 0.75

0.90::acc(s27, availability_status_evo).

0.77::true_val(availability_status_evo, in_stock); 0.23::true_val(availability_status_evo, unk_availability_status_evo).

measured(s27, availability_status_evo, in_stock).

all_consistent(availability_status_evo) :- consistent(s27, availability_status_evo).

evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, in_stock)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

% @attr availability_status_evo_outlet
% @type categorical
% @canonical false
% @original_name availability_status (evo outlet)
% @values on_sale_outlet=On_sale_outlet unk_availability_status_evo_outlet=Unknown
% @importance 0.5

0.88::acc(s28, availability_status_evo_outlet).

0.72::true_val(availability_status_evo_outlet, on_sale_outlet); 0.28::true_val(availability_status_evo_outlet, unk_availability_status_evo_outlet).

measured(s28, availability_status_evo_outlet, on_sale_outlet).

all_consistent(availability_status_evo_outlet) :- consistent(s28, availability_status_evo_outlet).

evidence(all_consistent(availability_status_evo_outlet)).
query(true_val(availability_status_evo_outlet, on_sale_outlet)).
query(true_val(availability_status_evo_outlet, unk_availability_status_evo_outlet)).

% @attr availability_status_sp
% @type categorical
% @canonical false
% @original_name availability_status (SnowboardingProfiles)
% @values listed=Listed unk_availability_status_sp=Unknown
% @importance 0.95

0.88::acc(s24, availability_status_sp).

0.81::true_val(availability_status_sp, listed); 0.19::true_val(availability_status_sp, unk_availability_status_sp).

measured(s24, availability_status_sp, listed).

all_consistent(availability_status_sp) :- consistent(s24, availability_status_sp).

evidence(all_consistent(availability_status_sp)).
query(true_val(availability_status_sp, listed)).
query(true_val(availability_status_sp, unk_availability_status_sp)).

% @attr availability_status_2024
% @type categorical
% @canonical false
% @original_name availability_status (2024 model)
% @values listed_2024=Listed_2024_model unk_availability_status_2024=Unknown
% @importance 0.95

0.85::acc(s24, availability_status_2024).

0.81::true_val(availability_status_2024, listed_2024); 0.19::true_val(availability_status_2024, unk_availability_status_2024).

measured(s24, availability_status_2024, listed_2024).

all_consistent(availability_status_2024) :- consistent(s24, availability_status_2024).

evidence(all_consistent(availability_status_2024)).
query(true_val(availability_status_2024, listed_2024)).
query(true_val(availability_status_2024, unk_availability_status_2024)).

% @attr availability_status_sbf
% @type categorical
% @canonical false
% @original_name availability_status (SBF)
% @values listed=Listed unk_availability_status_sbf=Unknown
% @importance 0.5

0.80::acc(s29, availability_status_sbf).

0.55::true_val(availability_status_sbf, listed); 0.45::true_val(availability_status_sbf, unk_availability_status_sbf).

measured(s29, availability_status_sbf, listed).

all_consistent(availability_status_sbf) :-
    (indep(s29), consistent(s29, availability_status_sbf) ; \+indep(s29)).

evidence(all_consistent(availability_status_sbf)).
query(true_val(availability_status_sbf, listed)).
query(true_val(availability_status_sbf, unk_availability_status_sbf)).

% @attr availability_status_darkside
% @type categorical
% @canonical false
% @original_name availability_status (Darkside)
% @values listed=Listed unk_availability_status_darkside=Unknown
% @importance 0.45

0.78::acc(s30, availability_status_darkside).

0.48::true_val(availability_status_darkside, listed); 0.52::true_val(availability_status_darkside, unk_availability_status_darkside).

measured(s30, availability_status_darkside, listed).

all_consistent(availability_status_darkside) :-
    (indep(s30), consistent(s30, availability_status_darkside) ; \+indep(s30)).

evidence(all_consistent(availability_status_darkside)).
query(true_val(availability_status_darkside, listed)).
query(true_val(availability_status_darkside, unk_availability_status_darkside)).

% @attr availability_status_auski
% @type categorical
% @canonical false
% @original_name availability_status (Auski)
% @values listed=Listed unk_availability_status_auski=Unknown
% @importance 0.5

0.80::acc(s31, availability_status_auski).

0.55::true_val(availability_status_auski, listed); 0.45::true_val(availability_status_auski, unk_availability_status_auski).

measured(s31, availability_status_auski, listed).

all_consistent(availability_status_auski) :-
    (indep(s31), consistent(s31, availability_status_auski) ; \+indep(s31)).

evidence(all_consistent(availability_status_auski)).
query(true_val(availability_status_auski, listed)).
query(true_val(availability_status_auski, unk_availability_status_auski)).

% @attr availability_status_xdream
% @type categorical
% @canonical false
% @original_name availability_status (X-Dream)
% @values listed=Listed unk_availability_status_xdream=Unknown
% @importance 0.45

0.78::acc(s32, availability_status_xdream).

0.51::true_val(availability_status_xdream, listed); 0.49::true_val(availability_status_xdream, unk_availability_status_xdream).

measured(s32, availability_status_xdream, listed).

all_consistent(availability_status_xdream) :-
    (indep(s32), consistent(s32, availability_status_xdream) ; \+indep(s32)).

evidence(all_consistent(availability_status_xdream)).
query(true_val(availability_status_xdream, listed)).
query(true_val(availability_status_xdream, unk_availability_status_xdream)).

% @attr availability_status_skatepro
% @type categorical
% @canonical false
% @original_name availability_status (SkatePro)
% @values listed=Listed unk_availability_status_skatepro=Unknown
% @importance 0.4

0.78::acc(s33, availability_status_skatepro).

0.52::true_val(availability_status_skatepro, listed); 0.48::true_val(availability_status_skatepro, unk_availability_status_skatepro).

measured(s33, availability_status_skatepro, listed).

all_consistent(availability_status_skatepro) :-
    (indep(s33), consistent(s33, availability_status_skatepro) ; \+indep(s33)).

evidence(all_consistent(availability_status_skatepro)).
query(true_val(availability_status_skatepro, listed)).
query(true_val(availability_status_skatepro, unk_availability_status_skatepro)).

% @attr availability_status_snowboards_eu
% @type categorical
% @canonical false
% @original_name availability_status (Snowboards EU)
% @values listed=Listed unk_availability_status_snowboards_eu=Unknown
% @importance 0.4

0.76::acc(s34, availability_status_snowboards_eu).

0.48::true_val(availability_status_snowboards_eu, listed); 0.52::true_val(availability_status_snowboards_eu, unk_availability_status_snowboards_eu).

measured(s34, availability_status_snowboards_eu, listed).

all_consistent(availability_status_snowboards_eu) :-
    (indep(s34), consistent(s34, availability_status_snowboards_eu) ; \+indep(s34)).

evidence(all_consistent(availability_status_snowboards_eu)).
query(true_val(availability_status_snowboards_eu, listed)).
query(true_val(availability_status_snowboards_eu, unk_availability_status_snowboards_eu)).

% @attr availability_status_amazon
% @type categorical
% @canonical false
% @original_name availability_status (Amazon)
% @values listed=Listed unk_availability_status_amazon=Unknown
% @importance 0.35

0.75::acc(s35, availability_status_amazon).

0.49::true_val(availability_status_amazon, listed); 0.51::true_val(availability_status_amazon, unk_availability_status_amazon).

measured(s35, availability_status_amazon, listed).

all_consistent(availability_status_amazon) :-
    (indep(s35), consistent(s35, availability_status_amazon) ; \+indep(s35)).

evidence(all_consistent(availability_status_amazon)).
query(true_val(availability_status_amazon, listed)).
query(true_val(availability_status_amazon, unk_availability_status_amazon)).

% @attr warranty_period_years_base
% @type categorical
% @canonical false
% @original_name warranty_period_years (base)
% @values two_year=2_year_limited_warranty unk_warranty_period_years_base=Unknown
% @importance 0.8

0.95::acc(s36, warranty_period_years_base).

0.90::true_val(warranty_period_years_base, two_year); 0.10::true_val(warranty_period_years_base, unk_warranty_period_years_base).

measured(s36, warranty_period_years_base, two_year).

all_consistent(warranty_period_years_base) :- consistent(s36, warranty_period_years_base).

evidence(all_consistent(warranty_period_years_base)).
query(true_val(warranty_period_years_base, two_year)).
query(true_val(warranty_period_years_base, unk_warranty_period_years_base)).

% @attr warranty_period_years
% @type categorical
% @canonical true
% @original_name warranty_period_years
% @values two_plus_one=2_plus_1_year_3_total_with_registration unk_warranty_period_years=Unknown
% @importance 0.75

0.95::acc(s37, warranty_period_years).

0.90::true_val(warranty_period_years, two_plus_one); 0.10::true_val(warranty_period_years, unk_warranty_period_years).

measured(s37, warranty_period_years, two_plus_one).

all_consistent(warranty_period_years) :- consistent(s37, warranty_period_years).

evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, two_plus_one)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

% @attr warranty_period_years_eu
% @type categorical
% @canonical false
% @original_name warranty_period_years (EU)
% @values three_year=3_year_limited_guarantee unk_warranty_period_years_eu=Unknown
% @importance 0.7

0.92::acc(s38, warranty_period_years_eu).

0.86::true_val(warranty_period_years_eu, three_year); 0.14::true_val(warranty_period_years_eu, unk_warranty_period_years_eu).

measured(s38, warranty_period_years_eu, three_year).

all_consistent(warranty_period_years_eu) :- consistent(s38, warranty_period_years_eu).

evidence(all_consistent(warranty_period_years_eu)).
query(true_val(warranty_period_years_eu, three_year)).
query(true_val(warranty_period_years_eu, unk_warranty_period_years_eu)).

% @attr warranty_coverage
% @type categorical
% @canonical false
% @original_name warranty
% @values delam_inserts_cracked_topsheet=Delamination_inserts_cracked_topsheet_outside_binding unk_warranty_coverage=Unknown
% @importance 0.8

0.95::acc(s36, warranty_coverage).

0.90::true_val(warranty_coverage, delam_inserts_cracked_topsheet); 0.10::true_val(warranty_coverage, unk_warranty_coverage).

measured(s36, warranty_coverage, delam_inserts_cracked_topsheet).

all_consistent(warranty_coverage) :- consistent(s36, warranty_coverage).

evidence(all_consistent(warranty_coverage)).
query(true_val(warranty_coverage, delam_inserts_cracked_topsheet)).
query(true_val(warranty_coverage, unk_warranty_coverage)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values directional_twin=Directional_Twin unk_shape=Unknown
% @importance 0.95

0.95::acc(s14, shape).
0.75::acc(s3, shape).

0.95::true_val(shape, directional_twin); 0.05::true_val(shape, unk_shape).

measured(s14, shape, directional_twin).
measured(s3, shape, directional_twin).

all_consistent(shape) :-
    consistent(s14, shape),
    (indep(s3), consistent(s3, shape) ; \+indep(s3)).

evidence(all_consistent(shape)).
query(true_val(shape, directional_twin)).
query(true_val(shape, unk_shape)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values fusion_camber=Fusion_Camber_positive_camber_rocker_at_contact_points unk_camber_type=Unknown
% @importance 0.95

0.95::acc(s14, camber_type).
0.95::acc(s39, camber_type).

0.95::true_val(camber_type, fusion_camber); 0.05::true_val(camber_type, unk_camber_type).

measured(s14, camber_type, fusion_camber).
measured(s39, camber_type, fusion_camber).

all_consistent(camber_type) :-
    consistent(s14, camber_type),
    consistent(s39, camber_type).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, fusion_camber)).
query(true_val(camber_type, unk_camber_type)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @original_name flex_rating_10
% @unit /10
% @values v6=6.0 unk_flex_rating_10=Unknown
% @importance 0.95

0.93::acc(s14, flex_rating_10).
0.80::acc(s3, flex_rating_10).

0.95::true_val(flex_rating_10, v6); 0.05::true_val(flex_rating_10, unk_flex_rating_10).

measured(s14, flex_rating_10, v6).
measured(s3, flex_rating_10, v6).

all_consistent(flex_rating_10) :-
    consistent(s14, flex_rating_10),
    (indep(s3), consistent(s3, flex_rating_10) ; \+indep(s3)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v6)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values medium=Medium mid_stiff_6_5=6_5_out_of_10_bordering_mid_stiff
% @importance 0.825

0.78::acc(s40, flex_feel).
0.88::acc(s24, flex_feel).

0.45::true_val(flex_feel, medium); 0.55::true_val(flex_feel, mid_stiff_6_5).

measured(s40, flex_feel, medium).
measured(s24, flex_feel, mid_stiff_6_5).

all_consistent(flex_feel) :-
    (indep(s40), consistent(s40, flex_feel) ; \+indep(s40)),
    consistent(s24, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium)).
query(true_val(flex_feel, mid_stiff_6_5)).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values radial=Radial_single_radius unk_sidecut_type=Unknown
% @importance 0.825

0.95::acc(s14, sidecut_type).
0.85::acc(s41, sidecut_type).

0.95::true_val(sidecut_type, radial); 0.05::true_val(sidecut_type, unk_sidecut_type).

measured(s14, sidecut_type, radial).
measured(s41, sidecut_type, radial).

all_consistent(sidecut_type) :-
    consistent(s14, sidecut_type),
    (indep(s41), consistent(s41, sidecut_type) ; \+indep(s41)).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, radial)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values insert_2x4=2x4_insert_pack unk_mounting_pattern=Unknown
% @importance 0.95

0.95::acc(s14, mounting_pattern).
0.80::acc(s3, mounting_pattern).

0.95::true_val(mounting_pattern, insert_2x4); 0.05::true_val(mounting_pattern, unk_mounting_pattern).

measured(s14, mounting_pattern, insert_2x4).
measured(s3, mounting_pattern, insert_2x4).

all_consistent(mounting_pattern) :-
    consistent(s14, mounting_pattern),
    (indep(s3), consistent(s3, mounting_pattern) ; \+indep(s3)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, insert_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values standard_2x4=Standard_2x4_all_major_brands unk_binding_compatibility=Unknown
% @importance 0.9

0.80::acc(s3, binding_compatibility).

0.71::true_val(binding_compatibility, standard_2x4); 0.29::true_val(binding_compatibility, unk_binding_compatibility).

measured(s3, binding_compatibility, standard_2x4).

all_consistent(binding_compatibility) :-
    (indep(s3), consistent(s3, binding_compatibility) ; \+indep(s3)).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, standard_2x4)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

% @attr taper
% @type numeric
% @canonical true
% @original_name taper
% @unit mm
% @values v0=0.0 unk_taper=Unknown
% @importance 0.95

0.95::acc(s14, taper).
0.80::acc(s3, taper).

0.95::true_val(taper, v0); 0.05::true_val(taper, unk_taper).

measured(s14, taper, v0).
measured(s3, taper, v0).

all_consistent(taper) :-
    consistent(s14, taper),
    (indep(s3), consistent(s3, taper) ; \+indep(s3)).

evidence(all_consistent(taper)).
query(true_val(taper, v0)).
query(true_val(taper, unk_taper)).

% @attr setback
% @type numeric
% @canonical true
% @original_name setback
% @unit cm
% @values v0=0.0 unk_setback=Unknown
% @importance 0.95

0.95::acc(s14, setback).
0.80::acc(s3, setback).

0.95::true_val(setback, v0); 0.05::true_val(setback, unk_setback).

measured(s14, setback, v0).
measured(s3, setback, v0).

all_consistent(setback) :-
    consistent(s14, setback),
    (indep(s3), consistent(s3, setback) ; \+indep(s3)).

evidence(all_consistent(setback)).
query(true_val(setback, v0)).
query(true_val(setback, unk_setback)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values pop_core=Pop_Core_alternating_20mm_Poplar_Paulownia unk_core_material=Unknown
% @importance 0.875

0.95::acc(s14, core_material).
0.92::acc(s42, core_material).

0.95::true_val(core_material, pop_core); 0.05::true_val(core_material, unk_core_material).

measured(s14, core_material, pop_core).
measured(s42, core_material, pop_core).

all_consistent(core_material) :-
    consistent(s14, core_material),
    consistent(s42, core_material).

evidence(all_consistent(core_material)).
query(true_val(core_material, pop_core)).
query(true_val(core_material, unk_core_material)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values triaxial_fiberglass=Triaxial_Fiberglass_three_angles_torsional_rigidity_snap unk_laminate=Unknown
% @importance 0.825

0.95::acc(s14, laminate).
0.92::acc(s43, laminate).

0.95::true_val(laminate, triaxial_fiberglass); 0.05::true_val(laminate, unk_laminate).

measured(s14, laminate, triaxial_fiberglass).
measured(s43, laminate, triaxial_fiberglass).

all_consistent(laminate) :-
    consistent(s14, laminate),
    consistent(s43, laminate).

evidence(all_consistent(laminate)).
query(true_val(laminate, triaxial_fiberglass)).
query(true_val(laminate, unk_laminate)).

% @attr laminate_lower
% @type categorical
% @canonical false
% @original_name laminate (lower glass)
% @values biaxial_fiberglass=Biaxial_Fiberglass_two_angles_torsionally_playful unk_laminate_lower=Unknown
% @importance 1.0

0.95::acc(s14, laminate_lower).

0.90::true_val(laminate_lower, biaxial_fiberglass); 0.10::true_val(laminate_lower, unk_laminate_lower).

measured(s14, laminate_lower, biaxial_fiberglass).

all_consistent(laminate_lower) :- consistent(s14, laminate_lower).

evidence(all_consistent(laminate_lower)).
query(true_val(laminate_lower, biaxial_fiberglass)).
query(true_val(laminate_lower, unk_laminate_lower)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values twin_single_carbon_hotrods=Twin_Single_Carbon_HotRods_nose_and_tail_snap_rebound unk_construction_material_innovation=Unknown
% @importance 0.7

0.93::acc(s14, construction_material_innovation).
0.70::acc(s44, construction_material_innovation).

0.92::true_val(construction_material_innovation, twin_single_carbon_hotrods); 0.08::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s14, construction_material_innovation, twin_single_carbon_hotrods).
measured(s44, construction_material_innovation, twin_single_carbon_hotrods).

all_consistent(construction_material_innovation) :-
    consistent(s14, construction_material_innovation),
    (indep(s44), consistent(s44, construction_material_innovation) ; \+indep(s44)).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, twin_single_carbon_hotrods)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr construction_material_innovation_flax
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Flax Impact Plates)
% @values flax_impact_plates=Full_woven_flax_impact_plates_around_inserts_distributes_impact unk_construction_material_innovation_flax=Unknown
% @importance 0.875

0.95::acc(s14, construction_material_innovation_flax).
0.95::acc(s45, construction_material_innovation_flax).

0.95::true_val(construction_material_innovation_flax, flax_impact_plates); 0.05::true_val(construction_material_innovation_flax, unk_construction_material_innovation_flax).

measured(s14, construction_material_innovation_flax, flax_impact_plates).
measured(s45, construction_material_innovation_flax, flax_impact_plates).

all_consistent(construction_material_innovation_flax) :-
    consistent(s14, construction_material_innovation_flax),
    consistent(s45, construction_material_innovation_flax).

evidence(all_consistent(construction_material_innovation_flax)).
query(true_val(construction_material_innovation_flax, flax_impact_plates)).
query(true_val(construction_material_innovation_flax, unk_construction_material_innovation_flax)).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values sinterstrong=SinterStrong_sintered_low_maintenance unk_base_type=Unknown
% @importance 0.85

0.95::acc(s14, base_type).
0.95::acc(s46, base_type).

0.95::true_val(base_type, sinterstrong); 0.05::true_val(base_type, unk_base_type).

measured(s14, base_type, sinterstrong).
measured(s46, base_type, sinterstrong).

all_consistent(base_type) :-
    consistent(s14, base_type),
    consistent(s46, base_type).

evidence(all_consistent(base_type)).
query(true_val(base_type, sinterstrong)).
query(true_val(base_type, unk_base_type)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values versatile_durable=Versatile_durable_holds_wax_easy_repair unk_base_material=Unknown
% @importance 0.625

0.93::acc(s46, base_material).
0.80::acc(s47, base_material).

0.93::true_val(base_material, versatile_durable); 0.07::true_val(base_material, unk_base_material).

measured(s46, base_material, versatile_durable).
measured(s47, base_material, versatile_durable).

all_consistent(base_material) :-
    consistent(s46, base_material),
    (indep(s47), consistent(s47, base_material) ; \+indep(s47)).

evidence(all_consistent(base_material)).
query(true_val(base_material, versatile_durable)).
query(true_val(base_material, unk_base_material)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 1.0

0.95::acc(s14, width_options).

0.90::true_val(width_options, standard_and_wide); 0.10::true_val(width_options, unk_width_options).

measured(s14, width_options, standard_and_wide).

all_consistent(width_options) :- consistent(s14, width_options).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values four_sizes=154_157_158W_160 seven_sizes=151_154_157_160_158W_161W_164W
% @importance 0.95

0.80::acc(s3, available_sizes).
0.93::acc(s14, available_sizes).

0.40::true_val(available_sizes, four_sizes); 0.60::true_val(available_sizes, seven_sizes).

measured(s3, available_sizes, four_sizes).
measured(s14, available_sizes, seven_sizes).

all_consistent(available_sizes) :-
    (indep(s3), consistent(s3, available_sizes) ; \+indep(s3)),
    consistent(s14, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, four_sizes)).
query(true_val(available_sizes, seven_sizes)).

% @attr effective_edge_154
% @type numeric
% @canonical false
% @original_name Effective edge 154cm
% @unit cm
% @values v117_8=117.8 unk_effective_edge_154=Unknown
% @importance 0.95

0.95::acc(s14, effective_edge_154).
0.80::acc(s3, effective_edge_154).

0.95::true_val(effective_edge_154, v117_8); 0.05::true_val(effective_edge_154, unk_effective_edge_154).

measured(s14, effective_edge_154, v117_8).
measured(s3, effective_edge_154, v117_8).

all_consistent(effective_edge_154) :-
    consistent(s14, effective_edge_154),
    (indep(s3), consistent(s3, effective_edge_154) ; \+indep(s3)).

evidence(all_consistent(effective_edge_154)).
query(true_val(effective_edge_154, v117_8)).
query(true_val(effective_edge_154, unk_effective_edge_154)).

% @attr effective_edge_157
% @type numeric
% @canonical false
% @original_name Effective edge 157cm
% @unit cm
% @values v120_4=120.4 unk_effective_edge_157=Unknown
% @importance 0.95

0.95::acc(s14, effective_edge_157).
0.80::acc(s3, effective_edge_157).

0.95::true_val(effective_edge_157, v120_4); 0.05::true_val(effective_edge_157, unk_effective_edge_157).

measured(s14, effective_edge_157, v120_4).
measured(s3, effective_edge_157, v120_4).

all_consistent(effective_edge_157) :-
    consistent(s14, effective_edge_157),
    (indep(s3), consistent(s3, effective_edge_157) ; \+indep(s3)).

evidence(all_consistent(effective_edge_157)).
query(true_val(effective_edge_157, v120_4)).
query(true_val(effective_edge_157, unk_effective_edge_157)).

% @attr effective_edge_158w
% @type numeric
% @canonical false
% @original_name Effective edge 158W
% @unit cm
% @values v121_2=121.2 unk_effective_edge_158w=Unknown
% @importance 0.95

0.95::acc(s14, effective_edge_158w).
0.80::acc(s3, effective_edge_158w).

0.95::true_val(effective_edge_158w, v121_2); 0.05::true_val(effective_edge_158w, unk_effective_edge_158w).

measured(s14, effective_edge_158w, v121_2).
measured(s3, effective_edge_158w, v121_2).

all_consistent(effective_edge_158w) :-
    consistent(s14, effective_edge_158w),
    (indep(s3), consistent(s3, effective_edge_158w) ; \+indep(s3)).

evidence(all_consistent(effective_edge_158w)).
query(true_val(effective_edge_158w, v121_2)).
query(true_val(effective_edge_158w, unk_effective_edge_158w)).

% @attr effective_edge_160
% @type numeric
% @canonical false
% @original_name Effective edge 160cm
% @unit cm
% @values v123_0=123.0 unk_effective_edge_160=Unknown
% @importance 0.95

0.95::acc(s14, effective_edge_160).
0.80::acc(s3, effective_edge_160).

0.95::true_val(effective_edge_160, v123_0); 0.05::true_val(effective_edge_160, unk_effective_edge_160).

measured(s14, effective_edge_160, v123_0).
measured(s3, effective_edge_160, v123_0).

all_consistent(effective_edge_160) :-
    consistent(s14, effective_edge_160),
    (indep(s3), consistent(s3, effective_edge_160) ; \+indep(s3)).

evidence(all_consistent(effective_edge_160)).
query(true_val(effective_edge_160, v123_0)).
query(true_val(effective_edge_160, unk_effective_edge_160)).

% @attr waist_width_154
% @type numeric
% @canonical false
% @original_name Waist width 154cm
% @unit cm
% @values v25_3=25.3 unk_waist_width_154=Unknown
% @importance 0.95

0.95::acc(s14, waist_width_154).
0.80::acc(s3, waist_width_154).

0.95::true_val(waist_width_154, v25_3); 0.05::true_val(waist_width_154, unk_waist_width_154).

measured(s14, waist_width_154, v25_3).
measured(s3, waist_width_154, v25_3).

all_consistent(waist_width_154) :-
    consistent(s14, waist_width_154),
    (indep(s3), consistent(s3, waist_width_154) ; \+indep(s3)).

evidence(all_consistent(waist_width_154)).
query(true_val(waist_width_154, v25_3)).
query(true_val(waist_width_154, unk_waist_width_154)).

% @attr waist_width_157
% @type numeric
% @canonical false
% @original_name Waist width 157cm
% @unit cm
% @values v25_5=25.5 unk_waist_width_157=Unknown
% @importance 0.95

0.95::acc(s14, waist_width_157).
0.80::acc(s3, waist_width_157).

0.95::true_val(waist_width_157, v25_5); 0.05::true_val(waist_width_157, unk_waist_width_157).

measured(s14, waist_width_157, v25_5).
measured(s3, waist_width_157, v25_5).

all_consistent(waist_width_157) :-
    consistent(s14, waist_width_157),
    (indep(s3), consistent(s3, waist_width_157) ; \+indep(s3)).

evidence(all_consistent(waist_width_157)).
query(true_val(waist_width_157, v25_5)).
query(true_val(waist_width_157, unk_waist_width_157)).

% @attr waist_width_158w
% @type numeric
% @canonical false
% @original_name Waist width 158W
% @unit cm
% @values v26_5=26.5 unk_waist_width_158w=Unknown
% @importance 0.95

0.95::acc(s14, waist_width_158w).
0.80::acc(s3, waist_width_158w).

0.95::true_val(waist_width_158w, v26_5); 0.05::true_val(waist_width_158w, unk_waist_width_158w).

measured(s14, waist_width_158w, v26_5).
measured(s3, waist_width_158w, v26_5).

all_consistent(waist_width_158w) :-
    consistent(s14, waist_width_158w),
    (indep(s3), consistent(s3, waist_width_158w) ; \+indep(s3)).

evidence(all_consistent(waist_width_158w)).
query(true_val(waist_width_158w, v26_5)).
query(true_val(waist_width_158w, unk_waist_width_158w)).

% @attr waist_width_160
% @type numeric
% @canonical false
% @original_name Waist width 160cm
% @unit cm
% @values v25_6=25.6 unk_waist_width_160=Unknown
% @importance 0.95

0.95::acc(s14, waist_width_160).
0.80::acc(s3, waist_width_160).

0.95::true_val(waist_width_160, v25_6); 0.05::true_val(waist_width_160, unk_waist_width_160).

measured(s14, waist_width_160, v25_6).
measured(s3, waist_width_160, v25_6).

all_consistent(waist_width_160) :-
    consistent(s14, waist_width_160),
    (indep(s3), consistent(s3, waist_width_160) ; \+indep(s3)).

evidence(all_consistent(waist_width_160)).
query(true_val(waist_width_160, v25_6)).
query(true_val(waist_width_160, unk_waist_width_160)).

% @attr sidecut_radius_size_154
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (154cm)
% @unit m
% @values v7_98=7.98 unk_sidecut_radius_size_154=Unknown
% @importance 1.0

0.95::acc(s14, sidecut_radius_size_154).

0.90::true_val(sidecut_radius_size_154, v7_98); 0.10::true_val(sidecut_radius_size_154, unk_sidecut_radius_size_154).

measured(s14, sidecut_radius_size_154, v7_98).

all_consistent(sidecut_radius_size_154) :- consistent(s14, sidecut_radius_size_154).

evidence(all_consistent(sidecut_radius_size_154)).
query(true_val(sidecut_radius_size_154, v7_98)).
query(true_val(sidecut_radius_size_154, unk_sidecut_radius_size_154)).

% @attr sidecut_radius_size
% @type numeric
% @canonical true
% @original_name sidecut_radius_size
% @unit m
% @values v8_16=8.16 unk_sidecut_radius_size=Unknown
% @importance 1.0

0.95::acc(s14, sidecut_radius_size).

0.90::true_val(sidecut_radius_size, v8_16); 0.10::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s14, sidecut_radius_size, v8_16).

all_consistent(sidecut_radius_size) :- consistent(s14, sidecut_radius_size).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v8_16)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr sidecut_radius_size_158w
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (158W)
% @unit m
% @values v8_22=8.22 unk_sidecut_radius_size_158w=Unknown
% @importance 1.0

0.95::acc(s14, sidecut_radius_size_158w).

0.90::true_val(sidecut_radius_size_158w, v8_22); 0.10::true_val(sidecut_radius_size_158w, unk_sidecut_radius_size_158w).

measured(s14, sidecut_radius_size_158w, v8_22).

all_consistent(sidecut_radius_size_158w) :- consistent(s14, sidecut_radius_size_158w).

evidence(all_consistent(sidecut_radius_size_158w)).
query(true_val(sidecut_radius_size_158w, v8_22)).
query(true_val(sidecut_radius_size_158w, unk_sidecut_radius_size_158w)).

% @attr sidecut_radius_size_160
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (160cm)
% @unit m
% @values v8_34=8.34 unk_sidecut_radius_size_160=Unknown
% @importance 1.0

0.95::acc(s14, sidecut_radius_size_160).

0.90::true_val(sidecut_radius_size_160, v8_34); 0.10::true_val(sidecut_radius_size_160, unk_sidecut_radius_size_160).

measured(s14, sidecut_radius_size_160, v8_34).

all_consistent(sidecut_radius_size_160) :- consistent(s14, sidecut_radius_size_160).

evidence(all_consistent(sidecut_radius_size_160)).
query(true_val(sidecut_radius_size_160, v8_34)).
query(true_val(sidecut_radius_size_160, unk_sidecut_radius_size_160)).

% @attr stance_width_range_size_154
% @type numeric
% @canonical false
% @original_name stance_width_range_size (154cm)
% @unit cm
% @values v53_3=53.3 unk_stance_width_range_size_154=Unknown
% @importance 0.9

0.80::acc(s3, stance_width_range_size_154).

0.71::true_val(stance_width_range_size_154, v53_3); 0.29::true_val(stance_width_range_size_154, unk_stance_width_range_size_154).

measured(s3, stance_width_range_size_154, v53_3).

all_consistent(stance_width_range_size_154) :-
    (indep(s3), consistent(s3, stance_width_range_size_154) ; \+indep(s3)).

evidence(all_consistent(stance_width_range_size_154)).
query(true_val(stance_width_range_size_154, v53_3)).
query(true_val(stance_width_range_size_154, unk_stance_width_range_size_154)).

% @attr stance_width_range_size
% @type numeric
% @canonical true
% @original_name stance_width_range_size
% @unit cm
% @values v53_3=53.3 unk_stance_width_range_size=Unknown
% @importance 0.95

0.80::acc(s3, stance_width_range_size).
0.93::acc(s14, stance_width_range_size).

0.95::true_val(stance_width_range_size, v53_3); 0.05::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s3, stance_width_range_size, v53_3).
measured(s14, stance_width_range_size, v53_3).

all_consistent(stance_width_range_size) :-
    consistent(s14, stance_width_range_size),
    (indep(s3), consistent(s3, stance_width_range_size) ; \+indep(s3)).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v53_3)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr stance_width_range_size_158w
% @type numeric
% @canonical false
% @original_name stance_width_range_size (158W)
% @unit cm
% @values v55_9=55.9 unk_stance_width_range_size_158w=Unknown
% @importance 0.9

0.80::acc(s3, stance_width_range_size_158w).

0.71::true_val(stance_width_range_size_158w, v55_9); 0.29::true_val(stance_width_range_size_158w, unk_stance_width_range_size_158w).

measured(s3, stance_width_range_size_158w, v55_9).

all_consistent(stance_width_range_size_158w) :-
    (indep(s3), consistent(s3, stance_width_range_size_158w) ; \+indep(s3)).

evidence(all_consistent(stance_width_range_size_158w)).
query(true_val(stance_width_range_size_158w, v55_9)).
query(true_val(stance_width_range_size_158w, unk_stance_width_range_size_158w)).

% @attr stance_width_range_size_160
% @type numeric
% @canonical false
% @original_name stance_width_range_size (160cm)
% @unit cm
% @values v55_9=55.9 unk_stance_width_range_size_160=Unknown
% @importance 0.9

0.80::acc(s3, stance_width_range_size_160).

0.71::true_val(stance_width_range_size_160, v55_9); 0.29::true_val(stance_width_range_size_160, unk_stance_width_range_size_160).

measured(s3, stance_width_range_size_160, v55_9).

all_consistent(stance_width_range_size_160) :-
    (indep(s3), consistent(s3, stance_width_range_size_160) ; \+indep(s3)).

evidence(all_consistent(stance_width_range_size_160)).
query(true_val(stance_width_range_size_160, v55_9)).
query(true_val(stance_width_range_size_160, unk_stance_width_range_size_160)).

% @attr recommended_weight_range_size_154
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (154cm)
% @unit kg
% @values w61_81=61_to_81_kg unk_recommended_weight_range_size_154=Unknown
% @importance 0.9

0.80::acc(s3, recommended_weight_range_size_154).

0.71::true_val(recommended_weight_range_size_154, w61_81); 0.29::true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154).

measured(s3, recommended_weight_range_size_154, w61_81).

all_consistent(recommended_weight_range_size_154) :-
    (indep(s3), consistent(s3, recommended_weight_range_size_154) ; \+indep(s3)).

evidence(all_consistent(recommended_weight_range_size_154)).
query(true_val(recommended_weight_range_size_154, w61_81)).
query(true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size
% @unit kg
% @values w67_87=67_to_87_kg unk_recommended_weight_range_size=Unknown
% @importance 0.9

0.80::acc(s3, recommended_weight_range_size).

0.71::true_val(recommended_weight_range_size, w67_87); 0.29::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s3, recommended_weight_range_size, w67_87).

all_consistent(recommended_weight_range_size) :-
    (indep(s3), consistent(s3, recommended_weight_range_size) ; \+indep(s3)).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w67_87)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr recommended_weight_range_size_158w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (158W)
% @unit kg
% @values w76_96=76_to_96_kg unk_recommended_weight_range_size_158w=Unknown
% @importance 0.9

0.80::acc(s3, recommended_weight_range_size_158w).

0.71::true_val(recommended_weight_range_size_158w, w76_96); 0.29::true_val(recommended_weight_range_size_158w, unk_recommended_weight_range_size_158w).

measured(s3, recommended_weight_range_size_158w, w76_96).

all_consistent(recommended_weight_range_size_158w) :-
    (indep(s3), consistent(s3, recommended_weight_range_size_158w) ; \+indep(s3)).

evidence(all_consistent(recommended_weight_range_size_158w)).
query(true_val(recommended_weight_range_size_158w, w76_96)).
query(true_val(recommended_weight_range_size_158w, unk_recommended_weight_range_size_158w)).

% @attr recommended_weight_range_size_160
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (160cm)
% @unit kg
% @values w73_93=73_to_93_kg unk_recommended_weight_range_size_160=Unknown
% @importance 0.9

0.80::acc(s3, recommended_weight_range_size_160).

0.71::true_val(recommended_weight_range_size_160, w73_93); 0.29::true_val(recommended_weight_range_size_160, unk_recommended_weight_range_size_160).

measured(s3, recommended_weight_range_size_160, w73_93).

all_consistent(recommended_weight_range_size_160) :-
    (indep(s3), consistent(s3, recommended_weight_range_size_160) ; \+indep(s3)).

evidence(all_consistent(recommended_weight_range_size_160)).
query(true_val(recommended_weight_range_size_160, w73_93)).
query(true_val(recommended_weight_range_size_160, unk_recommended_weight_range_size_160)).

% @attr recommended_weight_range_note
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (note)
% @values ranges_vary_by_year=Weight_ranges_differ_between_model_years_and_retailers unk_recommended_weight_range_note=Unknown
% @importance 0.95

0.78::acc(s3, recommended_weight_range_note).
0.85::acc(s14, recommended_weight_range_note).

0.90::true_val(recommended_weight_range_note, ranges_vary_by_year); 0.10::true_val(recommended_weight_range_note, unk_recommended_weight_range_note).

measured(s3, recommended_weight_range_note, ranges_vary_by_year).
measured(s14, recommended_weight_range_note, ranges_vary_by_year).

all_consistent(recommended_weight_range_note) :-
    (indep(s3), consistent(s3, recommended_weight_range_note) ; \+indep(s3)),
    consistent(s14, recommended_weight_range_note).

evidence(all_consistent(recommended_weight_range_note)).
query(true_val(recommended_weight_range_note, ranges_vary_by_year)).
query(true_val(recommended_weight_range_note, unk_recommended_weight_range_note)).

% @attr boot_size_rec_157
% @type categorical
% @canonical false
% @original_name Boot size recommendation 157cm (Rome 2526)
% @values us7_10_eu39_44=US_7_10_EU_39_44 unk_boot_size_rec_157=Unknown
% @importance 1.0

0.95::acc(s14, boot_size_rec_157).

0.90::true_val(boot_size_rec_157, us7_10_eu39_44); 0.10::true_val(boot_size_rec_157, unk_boot_size_rec_157).

measured(s14, boot_size_rec_157, us7_10_eu39_44).

all_consistent(boot_size_rec_157) :- consistent(s14, boot_size_rec_157).

evidence(all_consistent(boot_size_rec_157)).
query(true_val(boot_size_rec_157, us7_10_eu39_44)).
query(true_val(boot_size_rec_157, unk_boot_size_rec_157)).

% @attr boot_size_rec_158w
% @type categorical
% @canonical false
% @original_name Boot size recommendation 158W (Rome 2526)
% @values us9_12_eu42_47=US_9_12_EU_42_47 unk_boot_size_rec_158w=Unknown
% @importance 1.0

0.95::acc(s14, boot_size_rec_158w).

0.90::true_val(boot_size_rec_158w, us9_12_eu42_47); 0.10::true_val(boot_size_rec_158w, unk_boot_size_rec_158w).

measured(s14, boot_size_rec_158w, us9_12_eu42_47).

all_consistent(boot_size_rec_158w) :- consistent(s14, boot_size_rec_158w).

evidence(all_consistent(boot_size_rec_158w)).
query(true_val(boot_size_rec_158w, us9_12_eu42_47)).
query(true_val(boot_size_rec_158w, unk_boot_size_rec_158w)).

% @attr terrain_suitability_all_mountain
% @type numeric
% @canonical false
% @original_name terrain_suitability (All Mountain)
% @unit /10
% @values v8=8.0 unk_terrain_suitability_all_mountain=Unknown
% @importance 0.9

0.78::acc(s13, terrain_suitability_all_mountain).

0.67::true_val(terrain_suitability_all_mountain, v8); 0.33::true_val(terrain_suitability_all_mountain, unk_terrain_suitability_all_mountain).

measured(s13, terrain_suitability_all_mountain, v8).

all_consistent(terrain_suitability_all_mountain) :-
    (indep(s13), consistent(s13, terrain_suitability_all_mountain) ; \+indep(s13)).

evidence(all_consistent(terrain_suitability_all_mountain)).
query(true_val(terrain_suitability_all_mountain, v8)).
query(true_val(terrain_suitability_all_mountain, unk_terrain_suitability_all_mountain)).

% @attr terrain_suitability_powder
% @type numeric
% @canonical false
% @original_name terrain_suitability (Powder)
% @unit /10
% @values v6=6.0 unk_terrain_suitability_powder=Unknown
% @importance 0.9

0.78::acc(s13, terrain_suitability_powder).

0.67::true_val(terrain_suitability_powder, v6); 0.33::true_val(terrain_suitability_powder, unk_terrain_suitability_powder).

measured(s13, terrain_suitability_powder, v6).

all_consistent(terrain_suitability_powder) :-
    (indep(s13), consistent(s13, terrain_suitability_powder) ; \+indep(s13)).

evidence(all_consistent(terrain_suitability_powder)).
query(true_val(terrain_suitability_powder, v6)).
query(true_val(terrain_suitability_powder, unk_terrain_suitability_powder)).

% @attr terrain_suitability_park
% @type numeric
% @canonical false
% @original_name terrain_suitability (Park)
% @unit /10
% @values v8=8.0 unk_terrain_suitability_park=Unknown
% @importance 0.9

0.78::acc(s13, terrain_suitability_park).

0.67::true_val(terrain_suitability_park, v8); 0.33::true_val(terrain_suitability_park, unk_terrain_suitability_park).

measured(s13, terrain_suitability_park, v8).

all_consistent(terrain_suitability_park) :-
    (indep(s13), consistent(s13, terrain_suitability_park) ; \+indep(s13)).

evidence(all_consistent(terrain_suitability_park)).
query(true_val(terrain_suitability_park, v8)).
query(true_val(terrain_suitability_park, unk_terrain_suitability_park)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values park_all_mountain=Park_All_Mountain unk_terrain_suitability=Unknown
% @importance 0.9

0.78::acc(s13, terrain_suitability).

0.67::true_val(terrain_suitability, park_all_mountain); 0.33::true_val(terrain_suitability, unk_terrain_suitability).

measured(s13, terrain_suitability, park_all_mountain).

all_consistent(terrain_suitability) :-
    (indep(s13), consistent(s13, terrain_suitability) ; \+indep(s13)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, park_all_mountain)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values freestyle_am_playful=Freestyle_All_Mountain_playful_versatile unk_riding_style=Unknown
% @importance 0.9

0.78::acc(s13, riding_style).

0.67::true_val(riding_style, freestyle_am_playful); 0.33::true_val(riding_style, unk_riding_style).

measured(s13, riding_style, freestyle_am_playful).

all_consistent(riding_style) :-
    (indep(s13), consistent(s13, riding_style) ; \+indep(s13)).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, freestyle_am_playful)).
query(true_val(riding_style, unk_riding_style)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate_advanced=Intermediate_to_Advanced unk_rider_level=Unknown
% @importance 0.925

0.93::acc(s14, rider_level).
0.82::acc(s48, rider_level).

0.95::true_val(rider_level, intermediate_advanced); 0.05::true_val(rider_level, unk_rider_level).

measured(s14, rider_level, intermediate_advanced).
measured(s48, rider_level, intermediate_advanced).

all_consistent(rider_level) :-
    consistent(s14, rider_level),
    (indep(s48), consistent(s48, rider_level) ; \+indep(s48)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate_advanced)).
query(true_val(rider_level, unk_rider_level)).

% @attr board_weight_grams
% @type numeric
% @canonical true
% @original_name board_weight_grams
% @unit g
% @values v3080=3080.0 unk_board_weight_grams=Unknown
% @importance 0.95

0.90::acc(s24, board_weight_grams).

0.81::true_val(board_weight_grams, v3080); 0.19::true_val(board_weight_grams, unk_board_weight_grams).

measured(s24, board_weight_grams, v3080).

all_consistent(board_weight_grams) :- consistent(s24, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v3080)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr weight_per_cm
% @type numeric
% @canonical true
% @original_name weight_per_cm
% @unit g/cm
% @values v19_49=19.49 unk_weight_per_cm=Unknown
% @importance 0.95

0.90::acc(s24, weight_per_cm).

0.81::true_val(weight_per_cm, v19_49); 0.19::true_val(weight_per_cm, unk_weight_per_cm).

measured(s24, weight_per_cm, v19_49).

all_consistent(weight_per_cm) :- consistent(s24, weight_per_cm).

evidence(all_consistent(weight_per_cm)).
query(true_val(weight_per_cm, v19_49)).
query(true_val(weight_per_cm, unk_weight_per_cm)).

% @attr weight_per_cm_avg_comparison
% @type numeric
% @canonical false
% @original_name weight_per_cm (category average comparison)
% @unit g/cm
% @values v18_64=18.64 unk_weight_per_cm_avg_comparison=Unknown
% @importance 0.95

0.88::acc(s24, weight_per_cm_avg_comparison).

0.81::true_val(weight_per_cm_avg_comparison, v18_64); 0.19::true_val(weight_per_cm_avg_comparison, unk_weight_per_cm_avg_comparison).

measured(s24, weight_per_cm_avg_comparison, v18_64).

all_consistent(weight_per_cm_avg_comparison) :- consistent(s24, weight_per_cm_avg_comparison).

evidence(all_consistent(weight_per_cm_avg_comparison)).
query(true_val(weight_per_cm_avg_comparison, v18_64)).
query(true_val(weight_per_cm_avg_comparison, unk_weight_per_cm_avg_comparison)).

% @attr overall_rating_snowboardingprofiles
% @type numeric
% @canonical true
% @original_name overall_rating_snowboardingprofiles
% @unit /100
% @values v88_6=88.6 unk_overall_rating_snowboardingprofiles=Unknown
% @importance 0.95

0.90::acc(s24, overall_rating_snowboardingprofiles).

0.81::true_val(overall_rating_snowboardingprofiles, v88_6); 0.19::true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles).

measured(s24, overall_rating_snowboardingprofiles, v88_6).

all_consistent(overall_rating_snowboardingprofiles) :- consistent(s24, overall_rating_snowboardingprofiles).

evidence(all_consistent(overall_rating_snowboardingprofiles)).
query(true_val(overall_rating_snowboardingprofiles, v88_6)).
query(true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles)).

% @attr powder_score_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name powder_score_snowboardingprofiles
% @values average_powder=Average_longer_nose_helps_float_but_limited unk_powder_score_snowboardingprofiles=Unknown
% @importance 0.875

0.88::acc(s24, powder_score_snowboardingprofiles).
0.85::acc(s49, powder_score_snowboardingprofiles).

0.93::true_val(powder_score_snowboardingprofiles, average_powder); 0.07::true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles).

measured(s24, powder_score_snowboardingprofiles, average_powder).
measured(s49, powder_score_snowboardingprofiles, average_powder).

all_consistent(powder_score_snowboardingprofiles) :-
    consistent(s24, powder_score_snowboardingprofiles),
    consistent(s49, powder_score_snowboardingprofiles).

evidence(all_consistent(powder_score_snowboardingprofiles)).
query(true_val(powder_score_snowboardingprofiles, average_powder)).
query(true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles)).

% @attr carving_score_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name carving_score_snowboardingprofiles
% @values good_moderate_speeds=Carves_well_moderate_to_moderately_fast_speeds unk_carving_score_snowboardingprofiles=Unknown
% @importance 0.9

0.88::acc(s24, carving_score_snowboardingprofiles).
0.85::acc(s50, carving_score_snowboardingprofiles).

0.93::true_val(carving_score_snowboardingprofiles, good_moderate_speeds); 0.07::true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles).

measured(s24, carving_score_snowboardingprofiles, good_moderate_speeds).
measured(s50, carving_score_snowboardingprofiles, good_moderate_speeds).

all_consistent(carving_score_snowboardingprofiles) :-
    consistent(s24, carving_score_snowboardingprofiles),
    consistent(s50, carving_score_snowboardingprofiles).

evidence(all_consistent(carving_score_snowboardingprofiles)).
query(true_val(carving_score_snowboardingprofiles, good_moderate_speeds)).
query(true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles)).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name reviewer_opinion_snowboardingprofiles
% @values fast_stable_not_limitless=Reasonably_fast_stable_at_high_speeds_not_limitless unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.95

0.88::acc(s24, reviewer_opinion_snowboardingprofiles).

0.81::true_val(reviewer_opinion_snowboardingprofiles, fast_stable_not_limitless); 0.19::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).

measured(s24, reviewer_opinion_snowboardingprofiles, fast_stable_not_limitless).

all_consistent(reviewer_opinion_snowboardingprofiles) :- consistent(s24, reviewer_opinion_snowboardingprofiles).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, fast_stable_not_limitless)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

% @attr chatter_performance
% @type categorical
% @canonical true
% @original_name chatter_performance
% @values fairly_damp_7_10=Fairly_damp_about_7_out_of_10_stable unk_chatter_performance=Unknown
% @importance 0.95

0.88::acc(s24, chatter_performance).

0.81::true_val(chatter_performance, fairly_damp_7_10); 0.19::true_val(chatter_performance, unk_chatter_performance).

measured(s24, chatter_performance, fairly_damp_7_10).

all_consistent(chatter_performance) :- consistent(s24, chatter_performance).

evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, fairly_damp_7_10)).
query(true_val(chatter_performance, unk_chatter_performance)).

% @attr pop
% @type categorical
% @canonical true
% @original_name pop
% @values good_total_pop=Good_total_pop_more_than_Warden_and_Terrain_Wrecker unk_pop=Unknown
% @importance 0.95

0.88::acc(s24, pop).

0.81::true_val(pop, good_total_pop); 0.19::true_val(pop, unk_pop).

measured(s24, pop, good_total_pop).

all_consistent(pop) :- consistent(s24, pop).

evidence(all_consistent(pop)).
query(true_val(pop, good_total_pop)).
query(true_val(pop, unk_pop)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values similar_both_directions=Felt_similar_both_directions_little_concentration_on_transitions unk_switch_riding=Unknown
% @importance 0.95

0.85::acc(s24, switch_riding).

0.81::true_val(switch_riding, similar_both_directions); 0.19::true_val(switch_riding, unk_switch_riding).

measured(s24, switch_riding, similar_both_directions).

all_consistent(switch_riding) :- consistent(s24, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, similar_both_directions)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr reviewer_opinion_snowboardingprofiles_rails
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (rails)
% @values not_first_choice_rails=Not_first_choice_for_rails_less_confidence_than_softer unk_reviewer_opinion_snowboardingprofiles_rails=Unknown
% @importance 0.95

0.85::acc(s24, reviewer_opinion_snowboardingprofiles_rails).

0.81::true_val(reviewer_opinion_snowboardingprofiles_rails, not_first_choice_rails); 0.19::true_val(reviewer_opinion_snowboardingprofiles_rails, unk_reviewer_opinion_snowboardingprofiles_rails).

measured(s24, reviewer_opinion_snowboardingprofiles_rails, not_first_choice_rails).

all_consistent(reviewer_opinion_snowboardingprofiles_rails) :- consistent(s24, reviewer_opinion_snowboardingprofiles_rails).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_rails)).
query(true_val(reviewer_opinion_snowboardingprofiles_rails, not_first_choice_rails)).
query(true_val(reviewer_opinion_snowboardingprofiles_rails, unk_reviewer_opinion_snowboardingprofiles_rails)).

% @attr reviewer_opinion_snowboardingprofiles_flex
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (flex)
% @values more_effort_but_manageable=More_effort_to_flex_nose_tail_than_Warden_locks_in_nicely unk_reviewer_opinion_snowboardingprofiles_flex=Unknown
% @importance 0.95

0.85::acc(s24, reviewer_opinion_snowboardingprofiles_flex).

0.81::true_val(reviewer_opinion_snowboardingprofiles_flex, more_effort_but_manageable); 0.19::true_val(reviewer_opinion_snowboardingprofiles_flex, unk_reviewer_opinion_snowboardingprofiles_flex).

measured(s24, reviewer_opinion_snowboardingprofiles_flex, more_effort_but_manageable).

all_consistent(reviewer_opinion_snowboardingprofiles_flex) :- consistent(s24, reviewer_opinion_snowboardingprofiles_flex).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_flex)).
query(true_val(reviewer_opinion_snowboardingprofiles_flex, more_effort_but_manageable)).
query(true_val(reviewer_opinion_snowboardingprofiles_flex, unk_reviewer_opinion_snowboardingprofiles_flex)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values good_hard_snow=Good_edge_hold_rated_for_hard_snow unk_edge_hold=Unknown
% @importance 0.95

0.88::acc(s24, edge_hold).

0.81::true_val(edge_hold, good_hard_snow); 0.19::true_val(edge_hold, unk_edge_hold).

measured(s24, edge_hold, good_hard_snow).

all_consistent(edge_hold) :- consistent(s24, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, good_hard_snow)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr reviewer_opinion_snowboardingprofiles_snappy
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (snappy vs damp)
% @values six_out_of_10_slightly_snappy=About_6_out_of_10_leans_slightly_snappy unk_reviewer_opinion_snowboardingprofiles_snappy=Unknown
% @importance 0.95

0.85::acc(s24, reviewer_opinion_snowboardingprofiles_snappy).

0.81::true_val(reviewer_opinion_snowboardingprofiles_snappy, six_out_of_10_slightly_snappy); 0.19::true_val(reviewer_opinion_snowboardingprofiles_snappy, unk_reviewer_opinion_snowboardingprofiles_snappy).

measured(s24, reviewer_opinion_snowboardingprofiles_snappy, six_out_of_10_slightly_snappy).

all_consistent(reviewer_opinion_snowboardingprofiles_snappy) :- consistent(s24, reviewer_opinion_snowboardingprofiles_snappy).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_snappy)).
query(true_val(reviewer_opinion_snowboardingprofiles_snappy, six_out_of_10_slightly_snappy)).
query(true_val(reviewer_opinion_snowboardingprofiles_snappy, unk_reviewer_opinion_snowboardingprofiles_snappy)).

% @attr reviewer_opinion_snowboardingprofiles_aggressive
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (aggressive)
% @values seven_out_of_10_more_aggressive=About_7_out_of_10_leans_more_aggressive unk_reviewer_opinion_snowboardingprofiles_aggressive=Unknown
% @importance 0.95

0.85::acc(s24, reviewer_opinion_snowboardingprofiles_aggressive).

0.81::true_val(reviewer_opinion_snowboardingprofiles_aggressive, seven_out_of_10_more_aggressive); 0.19::true_val(reviewer_opinion_snowboardingprofiles_aggressive, unk_reviewer_opinion_snowboardingprofiles_aggressive).

measured(s24, reviewer_opinion_snowboardingprofiles_aggressive, seven_out_of_10_more_aggressive).

all_consistent(reviewer_opinion_snowboardingprofiles_aggressive) :- consistent(s24, reviewer_opinion_snowboardingprofiles_aggressive).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_aggressive)).
query(true_val(reviewer_opinion_snowboardingprofiles_aggressive, seven_out_of_10_more_aggressive)).
query(true_val(reviewer_opinion_snowboardingprofiles_aggressive, unk_reviewer_opinion_snowboardingprofiles_aggressive)).

% @attr gearjunkie_review_summary
% @type categorical
% @canonical false
% @original_name GearJunkie review summary
% @values hard_charging_dt=Hard_charging_directional_twin_diverse_conditions_playful_precise unk_gearjunkie_review_summary=Unknown
% @importance 0.75

0.82::acc(s51, gearjunkie_review_summary).

0.72::true_val(gearjunkie_review_summary, hard_charging_dt); 0.28::true_val(gearjunkie_review_summary, unk_gearjunkie_review_summary).

measured(s51, gearjunkie_review_summary, hard_charging_dt).

all_consistent(gearjunkie_review_summary) :- consistent(s51, gearjunkie_review_summary).

evidence(all_consistent(gearjunkie_review_summary)).
query(true_val(gearjunkie_review_summary, hard_charging_dt)).
query(true_val(gearjunkie_review_summary, unk_gearjunkie_review_summary)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values not_ideal_deep_carves=Not_ideal_for_deep_carves_narrow_waist_toe_heel_drag unk_negative_aspect=Unknown
% @importance 0.85

0.82::acc(s52, negative_aspect).

0.76::true_val(negative_aspect, not_ideal_deep_carves); 0.24::true_val(negative_aspect, unk_negative_aspect).

measured(s52, negative_aspect, not_ideal_deep_carves).

all_consistent(negative_aspect) :- consistent(s52, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, not_ideal_deep_carves)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_powder
% @type categorical
% @canonical false
% @original_name negative_aspect (powder)
% @values not_a_powder_board=Not_a_powder_board unk_negative_aspect_powder=Unknown
% @importance 0.8

0.82::acc(s53, negative_aspect_powder).

0.76::true_val(negative_aspect_powder, not_a_powder_board); 0.24::true_val(negative_aspect_powder, unk_negative_aspect_powder).

measured(s53, negative_aspect_powder, not_a_powder_board).

all_consistent(negative_aspect_powder) :- consistent(s53, negative_aspect_powder).

evidence(all_consistent(negative_aspect_powder)).
query(true_val(negative_aspect_powder, not_a_powder_board)).
query(true_val(negative_aspect_powder, unk_negative_aspect_powder)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values great_pop_landings=Comes_off_lip_with_pop_landings_easier_thanks_to_flax unk_positive_aspect=Unknown
% @importance 0.75

0.80::acc(s54, positive_aspect).

0.72::true_val(positive_aspect, great_pop_landings); 0.28::true_val(positive_aspect, unk_positive_aspect).

measured(s54, positive_aspect, great_pop_landings).

all_consistent(positive_aspect) :- consistent(s54, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, great_pop_landings)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values whitelines_100_versatile=Whitelines_100_cracked_the_code_genuinely_versatile unk_reviewer_opinion_whitelines=Unknown
% @importance 0.7

0.85::acc(s55, reviewer_opinion_whitelines).

0.81::true_val(reviewer_opinion_whitelines, whitelines_100_versatile); 0.19::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

measured(s55, reviewer_opinion_whitelines, whitelines_100_versatile).

all_consistent(reviewer_opinion_whitelines) :- consistent(s55, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, whitelines_100_versatile)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

% @attr reviewer_opinion_whitelines_recommendation
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines (recommendation)
% @values great_option_intermediate_freestyle=Great_option_intermediate_plus_freestyle_holds_own_outside_park unk_reviewer_opinion_whitelines_recommendation=Unknown
% @importance 0.8

0.85::acc(s56, reviewer_opinion_whitelines_recommendation).

0.77::true_val(reviewer_opinion_whitelines_recommendation, great_option_intermediate_freestyle); 0.23::true_val(reviewer_opinion_whitelines_recommendation, unk_reviewer_opinion_whitelines_recommendation).

measured(s56, reviewer_opinion_whitelines_recommendation, great_option_intermediate_freestyle).

all_consistent(reviewer_opinion_whitelines_recommendation) :- consistent(s56, reviewer_opinion_whitelines_recommendation).

evidence(all_consistent(reviewer_opinion_whitelines_recommendation)).
query(true_val(reviewer_opinion_whitelines_recommendation, great_option_intermediate_freestyle)).
query(true_val(reviewer_opinion_whitelines_recommendation, unk_reviewer_opinion_whitelines_recommendation)).

% @attr snowboard_mag_platinum_pick
% @type categorical
% @canonical false
% @original_name Snowboard Magazine 2025 Platinum Pick
% @values favorite_board_of_decade=Favorite_board_of_year_and_decade_ongoing_improvement unk_snowboard_mag_platinum_pick=Unknown
% @importance 0.8

0.85::acc(s57, snowboard_mag_platinum_pick).

0.81::true_val(snowboard_mag_platinum_pick, favorite_board_of_decade); 0.19::true_val(snowboard_mag_platinum_pick, unk_snowboard_mag_platinum_pick).

measured(s57, snowboard_mag_platinum_pick, favorite_board_of_decade).

all_consistent(snowboard_mag_platinum_pick) :- consistent(s57, snowboard_mag_platinum_pick).

evidence(all_consistent(snowboard_mag_platinum_pick)).
query(true_val(snowboard_mag_platinum_pick, favorite_board_of_decade)).
query(true_val(snowboard_mag_platinum_pick, unk_snowboard_mag_platinum_pick)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values unforgiving_carves_pops=Unforgiving_no_pow_float_hard_to_butter_but_carves_and_pops unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.85

0.82::acc(s58, reviewer_opinion_the_good_ride).

0.72::true_val(reviewer_opinion_the_good_ride, unforgiving_carves_pops); 0.28::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s58, reviewer_opinion_the_good_ride, unforgiving_carves_pops).

all_consistent(reviewer_opinion_the_good_ride) :- consistent(s58, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, unforgiving_carves_pops)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values feels_full_camber=Feels_like_full_old_school_camber_very_little_rocker unk_camber_description=Unknown
% @importance 0.9

0.82::acc(s58, camber_description).
0.88::acc(s24, camber_description).

0.92::true_val(camber_description, feels_full_camber); 0.08::true_val(camber_description, unk_camber_description).

measured(s58, camber_description, feels_full_camber).
measured(s24, camber_description, feels_full_camber).

all_consistent(camber_description) :-
    consistent(s58, camber_description),
    consistent(s24, camber_description).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, feels_full_camber)).
query(true_val(camber_description, unk_camber_description)).

% @attr user_review_count
% @type numeric
% @canonical false
% @original_name User review count on Rome US
% @values v92=92.0 unk_user_review_count=Unknown
% @importance 1.0

0.90::acc(s14, user_review_count).

0.90::true_val(user_review_count, v92); 0.10::true_val(user_review_count, unk_user_review_count).

measured(s14, user_review_count, v92).

all_consistent(user_review_count) :- consistent(s14, user_review_count).

evidence(all_consistent(user_review_count)).
query(true_val(user_review_count, v92)).
query(true_val(user_review_count, unk_user_review_count)).

% @attr user_satisfaction_rate
% @type categorical
% @canonical false
% @original_name User satisfaction rate
% @values pct92_five_star=92_percent_5_star_85_of_92 unk_user_satisfaction_rate=Unknown
% @importance 1.0

0.90::acc(s14, user_satisfaction_rate).

0.90::true_val(user_satisfaction_rate, pct92_five_star); 0.10::true_val(user_satisfaction_rate, unk_user_satisfaction_rate).

measured(s14, user_satisfaction_rate, pct92_five_star).

all_consistent(user_satisfaction_rate) :- consistent(s14, user_satisfaction_rate).

evidence(all_consistent(user_satisfaction_rate)).
query(true_val(user_satisfaction_rate, pct92_five_star)).
query(true_val(user_satisfaction_rate, unk_user_satisfaction_rate)).

% @attr positive_aspect_pop
% @type categorical
% @canonical false
% @original_name positive_aspect (pop/responsiveness)
% @values responsive_great_pop=Immediately_fell_in_love_responsive_so_much_pop unk_positive_aspect_pop=Unknown
% @importance 0.8

0.65::acc(s59, positive_aspect_pop).

0.54::true_val(positive_aspect_pop, responsive_great_pop); 0.46::true_val(positive_aspect_pop, unk_positive_aspect_pop).

measured(s59, positive_aspect_pop, responsive_great_pop).

all_consistent(positive_aspect_pop) :- consistent(s59, positive_aspect_pop).

evidence(all_consistent(positive_aspect_pop)).
query(true_val(positive_aspect_pop, responsive_great_pop)).
query(true_val(positive_aspect_pop, unk_positive_aspect_pop)).

% @attr negative_aspect_topsheet
% @type categorical
% @canonical false
% @original_name negative_aspect (topsheet)
% @values fragile_topsheet=Topsheet_fragile_scratches_easily_chips unk_negative_aspect_topsheet=Unknown
% @importance 0.7

0.58::acc(s60, negative_aspect_topsheet).

0.45::true_val(negative_aspect_topsheet, fragile_topsheet); 0.55::true_val(negative_aspect_topsheet, unk_negative_aspect_topsheet).

measured(s60, negative_aspect_topsheet, fragile_topsheet).

all_consistent(negative_aspect_topsheet) :- consistent(s60, negative_aspect_topsheet).

evidence(all_consistent(negative_aspect_topsheet)).
query(true_val(negative_aspect_topsheet, fragile_topsheet)).
query(true_val(negative_aspect_topsheet, unk_negative_aspect_topsheet)).

% @attr negative_aspect_butter
% @type categorical
% @canonical false
% @original_name negative_aspect (butter/rails)
% @values hard_to_butter_stiff=Cant_really_butter_pretty_stiff_not_great_for_rails unk_negative_aspect_butter=Unknown
% @importance 0.65

0.55::acc(s61, negative_aspect_butter).

0.43::true_val(negative_aspect_butter, hard_to_butter_stiff); 0.57::true_val(negative_aspect_butter, unk_negative_aspect_butter).

measured(s61, negative_aspect_butter, hard_to_butter_stiff).

all_consistent(negative_aspect_butter) :- consistent(s61, negative_aspect_butter).

evidence(all_consistent(negative_aspect_butter)).
query(true_val(negative_aspect_butter, hard_to_butter_stiff)).
query(true_val(negative_aspect_butter, unk_negative_aspect_butter)).

% @attr positive_aspect_versatility
% @type categorical
% @canonical false
% @original_name positive_aspect (versatility)
% @values whole_mountain_playground=Makes_whole_mountain_playground_insane_fun_9_of_10_picks unk_positive_aspect_versatility=Unknown
% @importance 0.65

0.55::acc(s62, positive_aspect_versatility).

0.43::true_val(positive_aspect_versatility, whole_mountain_playground); 0.57::true_val(positive_aspect_versatility, unk_positive_aspect_versatility).

measured(s62, positive_aspect_versatility, whole_mountain_playground).

all_consistent(positive_aspect_versatility) :- consistent(s62, positive_aspect_versatility).

evidence(all_consistent(positive_aspect_versatility)).
query(true_val(positive_aspect_versatility, whole_mountain_playground)).
query(true_val(positive_aspect_versatility, unk_positive_aspect_versatility)).

% @attr positive_aspect_stability
% @type categorical
% @canonical false
% @original_name positive_aspect (stability/fun)
% @values stable_fun_lively=Stable_not_too_damp_fun_lively_confidence_inspiring_powder_to_park unk_positive_aspect_stability=Unknown
% @importance 0.7

0.55::acc(s63, positive_aspect_stability).

0.43::true_val(positive_aspect_stability, stable_fun_lively); 0.57::true_val(positive_aspect_stability, unk_positive_aspect_stability).

measured(s63, positive_aspect_stability, stable_fun_lively).

all_consistent(positive_aspect_stability) :- consistent(s63, positive_aspect_stability).

evidence(all_consistent(positive_aspect_stability)).
query(true_val(positive_aspect_stability, stable_fun_lively)).
query(true_val(positive_aspect_stability, unk_positive_aspect_stability)).

% @attr negative_aspect_wide_rails
% @type categorical
% @canonical false
% @original_name negative_aspect (wide model rails)
% @values hard_press_wide=Little_hard_to_press_rails_wide_model_not_impossible_wide_stiffer unk_negative_aspect_wide_rails=Unknown
% @importance 0.65

0.55::acc(s64, negative_aspect_wide_rails).

0.43::true_val(negative_aspect_wide_rails, hard_press_wide); 0.57::true_val(negative_aspect_wide_rails, unk_negative_aspect_wide_rails).

measured(s64, negative_aspect_wide_rails, hard_press_wide).

all_consistent(negative_aspect_wide_rails) :- consistent(s64, negative_aspect_wide_rails).

evidence(all_consistent(negative_aspect_wide_rails)).
query(true_val(negative_aspect_wide_rails, hard_press_wide)).
query(true_val(negative_aspect_wide_rails, unk_negative_aspect_wide_rails)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values topsheet_split_warranty_replaced=Topsheet_split_2024_Rome_replaced_under_warranty_no_hassle unk_user_review_forum=Unknown
% @importance 0.8

0.62::acc(s59, user_review_forum).

0.54::true_val(user_review_forum, topsheet_split_warranty_replaced); 0.46::true_val(user_review_forum, unk_user_review_forum).

measured(s59, user_review_forum, topsheet_split_warranty_replaced).

all_consistent(user_review_forum) :- consistent(s59, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, topsheet_split_warranty_replaced)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr availability_status_sold_out
% @type categorical
% @canonical false
% @original_name availability_status (sold out)
% @values some_sizes_sold_out=Some_sizes_sold_out_only_board_in_Rome_lineup_two_sizes_sold_out unk_availability_status_sold_out=Unknown
% @importance 0.6

0.50::acc(s65, availability_status_sold_out).

0.36::true_val(availability_status_sold_out, some_sizes_sold_out); 0.64::true_val(availability_status_sold_out, unk_availability_status_sold_out).

measured(s65, availability_status_sold_out, some_sizes_sold_out).

all_consistent(availability_status_sold_out) :- consistent(s65, availability_status_sold_out).

evidence(all_consistent(availability_status_sold_out)).
query(true_val(availability_status_sold_out, some_sizes_sold_out)).
query(true_val(availability_status_sold_out, unk_availability_status_sold_out)).

% @attr user_review_forum_carving
% @type categorical
% @canonical false
% @original_name user_review_forum (carving)
% @values fun_small_freestyle_great_carving=Fun_small_freestyle_mtns_width_shallow_sidecut_great_carving_stable unk_user_review_forum_carving=Unknown
% @importance 0.55

0.50::acc(s66, user_review_forum_carving).

0.32::true_val(user_review_forum_carving, fun_small_freestyle_great_carving); 0.68::true_val(user_review_forum_carving, unk_user_review_forum_carving).

measured(s66, user_review_forum_carving, fun_small_freestyle_great_carving).

all_consistent(user_review_forum_carving) :- consistent(s66, user_review_forum_carving).

evidence(all_consistent(user_review_forum_carving)).
query(true_val(user_review_forum_carving, fun_small_freestyle_great_carving)).
query(true_val(user_review_forum_carving, unk_user_review_forum_carving)).

% @attr user_review_forum_overlap
% @type categorical
% @canonical false
% @original_name user_review_forum (lineup overlap)
% @values rome_lineup_overlap=Agent_National_Party_Mod_Warden_overlap_with_Crewzer unk_user_review_forum_overlap=Unknown
% @importance 0.55

0.50::acc(s67, user_review_forum_overlap).

0.32::true_val(user_review_forum_overlap, rome_lineup_overlap); 0.68::true_val(user_review_forum_overlap, unk_user_review_forum_overlap).

measured(s67, user_review_forum_overlap, rome_lineup_overlap).

all_consistent(user_review_forum_overlap) :- consistent(s67, user_review_forum_overlap).

evidence(all_consistent(user_review_forum_overlap)).
query(true_val(user_review_forum_overlap, rome_lineup_overlap)).
query(true_val(user_review_forum_overlap, unk_user_review_forum_overlap)).

% @attr user_review_forum_chilled
% @type categorical
% @canonical false
% @original_name user_review_forum (chilled)
% @values chilled_party_all_conditions=Chilled_version_of_aggressive_AM_party_board_handles_all unk_user_review_forum_chilled=Unknown
% @importance 0.55

0.50::acc(s67, user_review_forum_chilled).

0.32::true_val(user_review_forum_chilled, chilled_party_all_conditions); 0.68::true_val(user_review_forum_chilled, unk_user_review_forum_chilled).

measured(s67, user_review_forum_chilled, chilled_party_all_conditions).

all_consistent(user_review_forum_chilled) :- consistent(s67, user_review_forum_chilled).

evidence(all_consistent(user_review_forum_chilled)).
query(true_val(user_review_forum_chilled, chilled_party_all_conditions)).
query(true_val(user_review_forum_chilled, unk_user_review_forum_chilled)).

% @attr comparable_board_same_brand_warden
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Warden)
% @values rome_warden=Rome_Warden_cheaper_softer_mellow_less_pop_easier unk_comparable_board_same_brand_warden=Unknown
% @importance 0.95

0.88::acc(s24, comparable_board_same_brand_warden).

0.81::true_val(comparable_board_same_brand_warden, rome_warden); 0.19::true_val(comparable_board_same_brand_warden, unk_comparable_board_same_brand_warden).

measured(s24, comparable_board_same_brand_warden, rome_warden).

all_consistent(comparable_board_same_brand_warden) :- consistent(s24, comparable_board_same_brand_warden).

evidence(all_consistent(comparable_board_same_brand_warden)).
query(true_val(comparable_board_same_brand_warden, rome_warden)).
query(true_val(comparable_board_same_brand_warden, unk_comparable_board_same_brand_warden)).

% @attr comparable_board_same_brand_freaker
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Freaker)
% @values rome_freaker=Rome_Freaker_stiffer_lower_quality_base_cheaper unk_comparable_board_same_brand_freaker=Unknown
% @importance 0.95

0.88::acc(s24, comparable_board_same_brand_freaker).

0.81::true_val(comparable_board_same_brand_freaker, rome_freaker); 0.19::true_val(comparable_board_same_brand_freaker, unk_comparable_board_same_brand_freaker).

measured(s24, comparable_board_same_brand_freaker, rome_freaker).

all_consistent(comparable_board_same_brand_freaker) :- consistent(s24, comparable_board_same_brand_freaker).

evidence(all_consistent(comparable_board_same_brand_freaker)).
query(true_val(comparable_board_same_brand_freaker, rome_freaker)).
query(true_val(comparable_board_same_brand_freaker, unk_comparable_board_same_brand_freaker)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values burton_custom=Burton_Custom_slightly_more_snappy_Crewzer_better_ice unk_comparable_board_cross_brand=Unknown
% @importance 0.9

0.88::acc(s68, comparable_board_cross_brand).

0.79::true_val(comparable_board_cross_brand, burton_custom); 0.21::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s68, comparable_board_cross_brand, burton_custom).

all_consistent(comparable_board_cross_brand) :- consistent(s68, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, burton_custom)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_yes
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (YES Standard)
% @values yes_standard=YES_Standard_more_mellow_better_intermediate unk_comparable_board_cross_brand_yes=Unknown
% @importance 0.9

0.88::acc(s68, comparable_board_cross_brand_yes).

0.79::true_val(comparable_board_cross_brand_yes, yes_standard); 0.21::true_val(comparable_board_cross_brand_yes, unk_comparable_board_cross_brand_yes).

measured(s68, comparable_board_cross_brand_yes, yes_standard).

all_consistent(comparable_board_cross_brand_yes) :- consistent(s68, comparable_board_cross_brand_yes).

evidence(all_consistent(comparable_board_cross_brand_yes)).
query(true_val(comparable_board_cross_brand_yes, yes_standard)).
query(true_val(comparable_board_cross_brand_yes, unk_comparable_board_cross_brand_yes)).

% @attr comparable_board_cross_brand_jones
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Jones)
% @values jones_mountain_twin=Jones_Mountain_Twin_more_forgiving_intermediate_less_aggressive unk_comparable_board_cross_brand_jones=Unknown
% @importance 0.9

0.88::acc(s68, comparable_board_cross_brand_jones).

0.79::true_val(comparable_board_cross_brand_jones, jones_mountain_twin); 0.21::true_val(comparable_board_cross_brand_jones, unk_comparable_board_cross_brand_jones).

measured(s68, comparable_board_cross_brand_jones, jones_mountain_twin).

all_consistent(comparable_board_cross_brand_jones) :- consistent(s68, comparable_board_cross_brand_jones).

evidence(all_consistent(comparable_board_cross_brand_jones)).
query(true_val(comparable_board_cross_brand_jones, jones_mountain_twin)).
query(true_val(comparable_board_cross_brand_jones, unk_comparable_board_cross_brand_jones)).

% @attr comparable_board_cross_brand_capita
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Capita Mercury)
% @values capita_mercury=Capita_Mercury_slightly_less_aggressive_than_Crewzer unk_comparable_board_cross_brand_capita=Unknown
% @importance 0.9

0.88::acc(s68, comparable_board_cross_brand_capita).

0.79::true_val(comparable_board_cross_brand_capita, capita_mercury); 0.21::true_val(comparable_board_cross_brand_capita, unk_comparable_board_cross_brand_capita).

measured(s68, comparable_board_cross_brand_capita, capita_mercury).

all_consistent(comparable_board_cross_brand_capita) :- consistent(s68, comparable_board_cross_brand_capita).

evidence(all_consistent(comparable_board_cross_brand_capita)).
query(true_val(comparable_board_cross_brand_capita, capita_mercury)).
query(true_val(comparable_board_cross_brand_capita, unk_comparable_board_cross_brand_capita)).

% @attr comparable_board_cross_brand_list
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (full list)
% @values korua_otto_ltw_capita_yes_nsb_jones=Korua_Otto_LibTech_TW_Capita_Mercury_YES_NSB_Jones_MT_K2_Manifest unk_comparable_board_cross_brand_list=Unknown
% @importance 0.75

0.82::acc(s69, comparable_board_cross_brand_list).

0.68::true_val(comparable_board_cross_brand_list, korua_otto_ltw_capita_yes_nsb_jones); 0.32::true_val(comparable_board_cross_brand_list, unk_comparable_board_cross_brand_list).

measured(s69, comparable_board_cross_brand_list, korua_otto_ltw_capita_yes_nsb_jones).

all_consistent(comparable_board_cross_brand_list) :- consistent(s69, comparable_board_cross_brand_list).

evidence(all_consistent(comparable_board_cross_brand_list)).
query(true_val(comparable_board_cross_brand_list, korua_otto_ltw_capita_yes_nsb_jones)).
query(true_val(comparable_board_cross_brand_list, unk_comparable_board_cross_brand_list)).

% @attr avg_price_comparable_am
% @type numeric
% @canonical false
% @original_name Average price for comparable all-mountain snowboards
% @unit USD
% @values v572=572.0 unk_avg_price_comparable_am=Unknown
% @importance 0.95

0.88::acc(s24, avg_price_comparable_am).

0.81::true_val(avg_price_comparable_am, v572); 0.19::true_val(avg_price_comparable_am, unk_avg_price_comparable_am).

measured(s24, avg_price_comparable_am, v572).

all_consistent(avg_price_comparable_am) :- consistent(s24, avg_price_comparable_am).

evidence(all_consistent(avg_price_comparable_am)).
query(true_val(avg_price_comparable_am, v572)).
query(true_val(avg_price_comparable_am, unk_avg_price_comparable_am)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2020_21=2020_2021_season_all_new_winter_2021 unk_model_first_available_year=Unknown
% @importance 0.7

0.85::acc(s55, model_first_available_year).

0.81::true_val(model_first_available_year, season_2020_21); 0.19::true_val(model_first_available_year, unk_model_first_available_year).

measured(s55, model_first_available_year, season_2020_21).

all_consistent(model_first_available_year) :- consistent(s55, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2020_21)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr redesign_year
% @type categorical
% @canonical true
% @original_name redesign_year
% @values reshaped_24_25=Reshaped_24_25_rounded_nose_tail_5mm_nose_added_5mm_tail_removed unk_redesign_year=Unknown
% @importance 0.65

0.72::acc(s70, redesign_year).

0.62::true_val(redesign_year, reshaped_24_25); 0.38::true_val(redesign_year, unk_redesign_year).

measured(s70, redesign_year, reshaped_24_25).

all_consistent(redesign_year) :- consistent(s70, redesign_year).

evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, reshaped_24_25)).
query(true_val(redesign_year, unk_redesign_year)).

% @attr model_continuation_2526
% @type categorical
% @canonical false
% @original_name 2025/2026 continuation
% @values same_shape_continued=Same_new_shape_continued_10_year_anniversary unk_model_continuation_2526=Unknown
% @importance 0.7

0.82::acc(s20, model_continuation_2526).

0.72::true_val(model_continuation_2526, same_shape_continued); 0.28::true_val(model_continuation_2526, unk_model_continuation_2526).

measured(s20, model_continuation_2526, same_shape_continued).

all_consistent(model_continuation_2526) :- consistent(s20, model_continuation_2526).

evidence(all_consistent(model_continuation_2526)).
query(true_val(model_continuation_2526, same_shape_continued)).
query(true_val(model_continuation_2526, unk_model_continuation_2526)).

% @attr evo_model_year_listings
% @type categorical
% @canonical false
% @original_name evo listings exist for
% @values years_2021_to_2026=2021_2022_2023_2024_2025_2026_model_years unk_evo_model_year_listings=Unknown
% @importance 0.5

0.85::acc(s27, evo_model_year_listings).
0.85::acc(s28, evo_model_year_listings).
0.85::acc(s71, evo_model_year_listings).
0.85::acc(s72, evo_model_year_listings).

0.95::true_val(evo_model_year_listings, years_2021_to_2026); 0.05::true_val(evo_model_year_listings, unk_evo_model_year_listings).

measured(s27, evo_model_year_listings, years_2021_to_2026).
measured(s28, evo_model_year_listings, years_2021_to_2026).
measured(s71, evo_model_year_listings, years_2021_to_2026).
measured(s72, evo_model_year_listings, years_2021_to_2026).

all_consistent(evo_model_year_listings) :-
    consistent(s27, evo_model_year_listings),
    consistent(s28, evo_model_year_listings),
    consistent(s71, evo_model_year_listings),
    consistent(s72, evo_model_year_listings).

evidence(all_consistent(evo_model_year_listings)).
query(true_val(evo_model_year_listings, years_2021_to_2026)).
query(true_val(evo_model_year_listings, unk_evo_model_year_listings)).

% @attr nose_design
% @type categorical
% @canonical false
% @original_name Nose design
% @values larger_rounded=Larger_rounded_nose unk_nose_design=Unknown
% @importance 0.85

0.82::acc(s52, nose_design).

0.76::true_val(nose_design, larger_rounded); 0.24::true_val(nose_design, unk_nose_design).

measured(s52, nose_design, larger_rounded).

all_consistent(nose_design) :- consistent(s52, nose_design).

evidence(all_consistent(nose_design)).
query(true_val(nose_design, larger_rounded)).
query(true_val(nose_design, unk_nose_design)).

% @attr tail_design
% @type categorical
% @canonical false
% @original_name Tail design
% @values smaller_rounded_blunt=Smaller_rounded_blunt_tail unk_tail_design=Unknown
% @importance 0.725

0.82::acc(s52, tail_design).
0.85::acc(s73, tail_design).

0.92::true_val(tail_design, smaller_rounded_blunt); 0.08::true_val(tail_design, unk_tail_design).

measured(s52, tail_design, smaller_rounded_blunt).
measured(s73, tail_design, smaller_rounded_blunt).

all_consistent(tail_design) :-
    consistent(s52, tail_design),
    consistent(s73, tail_design).

evidence(all_consistent(tail_design)).
query(true_val(tail_design, smaller_rounded_blunt)).
query(true_val(tail_design, unk_tail_design)).

% @attr shape_description
% @type categorical
% @canonical false
% @original_name Shape description
% @values longer_nose_sym_sidecut_camber=Slightly_longer_nose_symmetrical_sidecut_and_camber unk_shape_description=Unknown
% @importance 0.7

0.85::acc(s74, shape_description).

0.81::true_val(shape_description, longer_nose_sym_sidecut_camber); 0.19::true_val(shape_description, unk_shape_description).

measured(s74, shape_description, longer_nose_sym_sidecut_camber).

all_consistent(shape_description) :-
    (indep(s74), consistent(s74, shape_description) ; \+indep(s74)).

evidence(all_consistent(shape_description)).
query(true_val(shape_description, longer_nose_sym_sidecut_camber)).
query(true_val(shape_description, unk_shape_description)).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values symmetric_twin=Symmetric_twin_flex_profile_underfoot unk_flex_direction=Unknown
% @importance 0.8

0.85::acc(s56, flex_direction).

0.77::true_val(flex_direction, symmetric_twin); 0.23::true_val(flex_direction, unk_flex_direction).

measured(s56, flex_direction, symmetric_twin).

all_consistent(flex_direction) :- consistent(s56, flex_direction).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, symmetric_twin)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr construction_layup_order
% @type categorical
% @canonical false
% @original_name Construction layup order (bottom-up, from Rome site)
% @values base_biax_carbon_core_triax_topsheet=SinterStrong_Biax_Lower_Carbon_HotRod_Pop_Core_Triax_Upper_Topsheet unk_construction_layup_order=Unknown
% @importance 1.0

0.95::acc(s14, construction_layup_order).

0.90::true_val(construction_layup_order, base_biax_carbon_core_triax_topsheet); 0.10::true_val(construction_layup_order, unk_construction_layup_order).

measured(s14, construction_layup_order, base_biax_carbon_core_triax_topsheet).

all_consistent(construction_layup_order) :- consistent(s14, construction_layup_order).

evidence(all_consistent(construction_layup_order)).
query(true_val(construction_layup_order, base_biax_carbon_core_triax_topsheet)).
query(true_val(construction_layup_order, unk_construction_layup_order)).

% @attr return_policy_terms
% @type categorical
% @canonical true
% @original_name return_policy_terms
% @values rome_free_ship_45day=Official_manufacturer_free_shipping_2plus1_warranty_45_day_returns unk_return_policy_terms=Unknown
% @importance 0.875

0.93::acc(s14, return_policy_terms).
0.93::acc(s37, return_policy_terms).

0.95::true_val(return_policy_terms, rome_free_ship_45day); 0.05::true_val(return_policy_terms, unk_return_policy_terms).

measured(s14, return_policy_terms, rome_free_ship_45day).
measured(s37, return_policy_terms, rome_free_ship_45day).

all_consistent(return_policy_terms) :-
    consistent(s14, return_policy_terms),
    consistent(s37, return_policy_terms).

evidence(all_consistent(return_policy_terms)).
query(true_val(return_policy_terms, rome_free_ship_45day)).
query(true_val(return_policy_terms, unk_return_policy_terms)).

% @attr return_policy_terms_evo
% @type categorical
% @canonical false
% @original_name return_policy_terms (evo)
% @values evo_free_ship_price_match_1yr=Evo_free_shipping_lowest_price_guarantee_5pct_match_1_year_returns unk_return_policy_terms_evo=Unknown
% @importance 0.75

0.88::acc(s27, return_policy_terms_evo).

0.77::true_val(return_policy_terms_evo, evo_free_ship_price_match_1yr); 0.23::true_val(return_policy_terms_evo, unk_return_policy_terms_evo).

measured(s27, return_policy_terms_evo, evo_free_ship_price_match_1yr).

all_consistent(return_policy_terms_evo) :- consistent(s27, return_policy_terms_evo).

evidence(all_consistent(return_policy_terms_evo)).
query(true_val(return_policy_terms_evo, evo_free_ship_price_match_1yr)).
query(true_val(return_policy_terms_evo, unk_return_policy_terms_evo)).

% @attr return_policy_terms_ballistyx
% @type categorical
% @canonical false
% @original_name return_policy_terms (Ballistyx)
% @values ballistyx_free_ship_99_tshirt=Melbourne_store_since_1991_free_ship_99_preorder_tshirt unk_return_policy_terms_ballistyx=Unknown
% @importance 0.9

0.80::acc(s3, return_policy_terms_ballistyx).

0.71::true_val(return_policy_terms_ballistyx, ballistyx_free_ship_99_tshirt); 0.29::true_val(return_policy_terms_ballistyx, unk_return_policy_terms_ballistyx).

measured(s3, return_policy_terms_ballistyx, ballistyx_free_ship_99_tshirt).

all_consistent(return_policy_terms_ballistyx) :-
    (indep(s3), consistent(s3, return_policy_terms_ballistyx) ; \+indep(s3)).

evidence(all_consistent(return_policy_terms_ballistyx)).
query(true_val(return_policy_terms_ballistyx, ballistyx_free_ship_99_tshirt)).
query(true_val(return_policy_terms_ballistyx, unk_return_policy_terms_ballistyx)).

% @attr return_policy_terms_melbourne
% @type categorical
% @canonical false
% @original_name return_policy_terms (Melbourne)
% @values melbourne_30day_exchange_credit=Local_independent_30_day_returns_exchange_credit_no_change_of_mind unk_return_policy_terms_melbourne=Unknown
% @importance 0.6

0.75::acc(s23, return_policy_terms_melbourne).

0.60::true_val(return_policy_terms_melbourne, melbourne_30day_exchange_credit); 0.40::true_val(return_policy_terms_melbourne, unk_return_policy_terms_melbourne).

measured(s23, return_policy_terms_melbourne, melbourne_30day_exchange_credit).

all_consistent(return_policy_terms_melbourne) :-
    (indep(s23), consistent(s23, return_policy_terms_melbourne) ; \+indep(s23)).

evidence(all_consistent(return_policy_terms_melbourne)).
query(true_val(return_policy_terms_melbourne, melbourne_30day_exchange_credit)).
query(true_val(return_policy_terms_melbourne, unk_return_policy_terms_melbourne)).

% @attr return_policy_terms_snow_central
% @type categorical
% @canonical false
% @original_name return_policy_terms (Snow Central)
% @values snow_central_30day=Small_locally_owned_30_day_returns unk_return_policy_terms_snow_central=Unknown
% @importance 0.85

0.75::acc(s22, return_policy_terms_snow_central).

0.67::true_val(return_policy_terms_snow_central, snow_central_30day); 0.33::true_val(return_policy_terms_snow_central, unk_return_policy_terms_snow_central).

measured(s22, return_policy_terms_snow_central, snow_central_30day).

all_consistent(return_policy_terms_snow_central) :-
    (indep(s22), consistent(s22, return_policy_terms_snow_central) ; \+indep(s22)).

evidence(all_consistent(return_policy_terms_snow_central)).
query(true_val(return_policy_terms_snow_central, snow_central_30day)).
query(true_val(return_policy_terms_snow_central, unk_return_policy_terms_snow_central)).

% @attr return_policy_terms_auski
% @type categorical
% @canonical false
% @original_name return_policy_terms (Auski)
% @values auski_free_ship_99=Free_standard_shipping_over_99_no_parcel_lockers unk_return_policy_terms_auski=Unknown
% @importance 0.5

0.75::acc(s31, return_policy_terms_auski).

0.55::true_val(return_policy_terms_auski, auski_free_ship_99); 0.45::true_val(return_policy_terms_auski, unk_return_policy_terms_auski).

measured(s31, return_policy_terms_auski, auski_free_ship_99).

all_consistent(return_policy_terms_auski) :-
    (indep(s31), consistent(s31, return_policy_terms_auski) ; \+indep(s31)).

evidence(all_consistent(return_policy_terms_auski)).
query(true_val(return_policy_terms_auski, auski_free_ship_99)).
query(true_val(return_policy_terms_auski, unk_return_policy_terms_auski)).

% @attr return_policy_terms_blue_tomato
% @type categorical
% @canonical false
% @original_name return_policy_terms (Blue Tomato)
% @values blue_tomato_eu_retailer=Major_European_action_sports_retailer_various_older_models unk_return_policy_terms_blue_tomato=Unknown
% @importance 0.6

0.72::acc(s26, return_policy_terms_blue_tomato).

0.49::true_val(return_policy_terms_blue_tomato, blue_tomato_eu_retailer); 0.51::true_val(return_policy_terms_blue_tomato, unk_return_policy_terms_blue_tomato).

measured(s26, return_policy_terms_blue_tomato, blue_tomato_eu_retailer).

all_consistent(return_policy_terms_blue_tomato) :- consistent(s26, return_policy_terms_blue_tomato).

evidence(all_consistent(return_policy_terms_blue_tomato)).
query(true_val(return_policy_terms_blue_tomato, blue_tomato_eu_retailer)).
query(true_val(return_policy_terms_blue_tomato, unk_return_policy_terms_blue_tomato)).