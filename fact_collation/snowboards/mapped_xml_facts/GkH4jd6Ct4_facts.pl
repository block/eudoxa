0.12::indep(sm).
0.15::indep(s1).
0.15::indep(s5).
0.15::indep(s6).
0.12::indep(s7).
0.20::indep(s4).
0.15::indep(s22).
0.20::indep(s26).
0.15::indep(s33).
0.12::indep(s34).
0.15::indep(s44).
0.15::indep(s32).
0.15::indep(s21).
0.20::indep(s28).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values capita=CAPiTA unk_brand=Unknown
% @importance 0.95

0.95::true_val(brand, capita); 0.05::true_val(brand, unk_brand).
0.95::acc(s1, brand).
0.95::acc(s2, brand).
measured(s1, brand, capita).
measured(s2, brand, capita).
all_consistent(brand) :-
    consistent(s2, brand),
    (indep(s1), consistent(s1, brand) ; \+indep(s1)).
evidence(all_consistent(brand)).
query(true_val(brand, capita)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values mega_death=Mega_Death unk_model_name=Unknown
% @importance 0.95

0.95::true_val(model_name, mega_death); 0.05::true_val(model_name, unk_model_name).
0.95::acc(s1, model_name).
0.95::acc(s2, model_name).
measured(s1, model_name, mega_death).
measured(s2, model_name, mega_death).
all_consistent(model_name) :-
    consistent(s2, model_name),
    (indep(s1), consistent(s1, model_name) ; \+indep(s1)).
evidence(all_consistent(model_name)).
query(true_val(model_name, mega_death)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2027=2027 unk_model_year=Unknown
% @importance 0.88

0.95::true_val(model_year, y2027); 0.05::true_val(model_year, unk_model_year).
0.90::acc(s1, model_year).
0.85::acc(s5, model_year).
measured(s1, model_year, y2027).
measured(s5, model_year, y2027).
all_consistent(model_year) :-
    (indep(s1), consistent(s1, model_year) ; \+indep(s1)),
    (indep(s5), consistent(s5, model_year) ; \+indep(s5)).
evidence(all_consistent(model_year)).
query(true_val(model_year, y2027)).
query(true_val(model_year, unk_model_year)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.95

0.97::true_val(product_type, snowboard); 0.03::true_val(product_type, unk_product_type).
0.97::acc(s1, product_type).
0.97::acc(s2, product_type).
measured(s1, product_type, snowboard).
measured(s2, product_type, snowboard).
all_consistent(product_type) :-
    consistent(s2, product_type),
    (indep(s1), consistent(s1, product_type) ; \+indep(s1)).
evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.78

0.95::true_val(gender, mens); 0.05::true_val(gender, unk_gender).
0.88::acc(s5, gender).
0.88::acc(s7, gender).
measured(s5, gender, mens).
measured(s7, gender, mens).
all_consistent(gender) :-
    (indep(s5), consistent(s5, gender) ; \+indep(s5)),
    (indep(s7), consistent(s7, gender) ; \+indep(s7)).
evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain_freeride=All_Mountain_Freeride unk_board_category=Unknown
% @importance 0.78

0.90::true_val(board_category, all_mountain_freeride); 0.10::true_val(board_category, unk_board_category).
0.82::acc(s5, board_category).
0.65::acc(s12, board_category).
measured(s5, board_category, all_mountain_freeride).
measured(s12, board_category, all_mountain_freeride).
all_consistent(board_category) :-
    (indep(s5), consistent(s5, board_category) ; \+indep(s5)),
    consistent(s12, board_category).
evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain_freeride)).
query(true_val(board_category, unk_board_category)).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values mothership_austria=Handcrafted_at_The_Mothership_Austria unk_manufacturing_location_current=Unknown
% @importance 0.88

0.95::true_val(manufacturing_location_current, mothership_austria); 0.05::true_val(manufacturing_location_current, unk_manufacturing_location_current).
0.95::acc(s2, manufacturing_location_current).
0.85::acc(s1, manufacturing_location_current).
0.80::acc(s8, manufacturing_location_current).
measured(s2, manufacturing_location_current, mothership_austria).
measured(s1, manufacturing_location_current, mothership_austria).
measured(s8, manufacturing_location_current, mothership_austria).
all_consistent(manufacturing_location_current) :-
    consistent(s2, manufacturing_location_current),
    (indep(s1), consistent(s1, manufacturing_location_current) ; \+indep(s1)),
    consistent(s8, manufacturing_location_current).
evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, mothership_austria)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

% @attr sustainability_certification_clean_energy
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values clean_energy_hydro_solar=100pct_self_generated_clean_energy unk_sustainability_certification_clean_energy=Unknown
% @importance 0.83

0.92::true_val(sustainability_certification_clean_energy, clean_energy_hydro_solar); 0.08::true_val(sustainability_certification_clean_energy, unk_sustainability_certification_clean_energy).
0.94::acc(s2, sustainability_certification_clean_energy).
0.82::acc(s8, sustainability_certification_clean_energy).
measured(s2, sustainability_certification_clean_energy, clean_energy_hydro_solar).
measured(s8, sustainability_certification_clean_energy, clean_energy_hydro_solar).
all_consistent(sustainability_certification_clean_energy) :-
    consistent(s2, sustainability_certification_clean_energy),
    consistent(s8, sustainability_certification_clean_energy).
evidence(all_consistent(sustainability_certification_clean_energy)).
query(true_val(sustainability_certification_clean_energy, clean_energy_hydro_solar)).
query(true_val(sustainability_certification_clean_energy, unk_sustainability_certification_clean_energy)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values capita_c3=CAPiTA_C3_Worldwide_Austria unk_manufacturer=Unknown
% @importance 0.80

0.95::true_val(manufacturer, capita_c3); 0.05::true_val(manufacturer, unk_manufacturer).
0.95::acc(s2, manufacturer).
0.93::acc(s10, manufacturer).
measured(s2, manufacturer, capita_c3).
measured(s10, manufacturer, capita_c3).
all_consistent(manufacturer) :-
    consistent(s2, manufacturer),
    consistent(s10, manufacturer).
evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, capita_c3)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr manufacturer_website
% @type categorical
% @canonical false
% @original_name Manufacturer website
% @values capitasnowboarding_com=capitasnowboarding_com unk_manufacturer_website=Unknown
% @importance 1.0

0.92::true_val(manufacturer_website, capitasnowboarding_com); 0.08::true_val(manufacturer_website, unk_manufacturer_website).
0.95::acc(s2, manufacturer_website).
measured(s2, manufacturer_website, capitasnowboarding_com).
all_consistent(manufacturer_website) :- consistent(s2, manufacturer_website).
evidence(all_consistent(manufacturer_website)).
query(true_val(manufacturer_website, capitasnowboarding_com)).
query(true_val(manufacturer_website, unk_manufacturer_website)).

% @attr design_philosophy
% @type categorical
% @canonical false
% @original_name Design philosophy
% @values bsod_evolution=High_end_evolution_of_BSOD unk_design_philosophy=Unknown
% @importance 0.95

0.93::true_val(design_philosophy, bsod_evolution); 0.07::true_val(design_philosophy, unk_design_philosophy).
0.92::acc(s2, design_philosophy).
0.85::acc(s1, design_philosophy).
measured(s2, design_philosophy, bsod_evolution).
measured(s1, design_philosophy, bsod_evolution).
all_consistent(design_philosophy) :-
    consistent(s2, design_philosophy),
    (indep(s1), consistent(s1, design_philosophy) ; \+indep(s1)).
evidence(all_consistent(design_philosophy)).
query(true_val(design_philosophy, bsod_evolution)).
query(true_val(design_philosophy, unk_design_philosophy)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values bsod=Black_Snowboard_of_Death_bigger_better_brother unk_comparable_board_same_brand=Unknown
% @importance 0.93

0.93::true_val(comparable_board_same_brand, bsod); 0.07::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).
0.92::acc(s2, comparable_board_same_brand).
0.80::acc(s5, comparable_board_same_brand).
measured(s2, comparable_board_same_brand, bsod).
measured(s5, comparable_board_same_brand, bsod).
all_consistent(comparable_board_same_brand) :-
    consistent(s2, comparable_board_same_brand),
    (indep(s5), consistent(s5, comparable_board_same_brand) ; \+indep(s5)).
evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, bsod)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values y2024=2024_model_year unk_model_first_available_year=Unknown
% @importance 0.65

0.75::true_val(model_first_available_year, y2024); 0.25::true_val(model_first_available_year, unk_model_first_available_year).
0.65::acc(s11, model_first_available_year).
0.60::acc(s12, model_first_available_year).
measured(s11, model_first_available_year, y2024).
measured(s12, model_first_available_year, y2024).
all_consistent(model_first_available_year) :-
    consistent(s11, model_first_available_year),
    consistent(s12, model_first_available_year).
evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2024)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr estimated_availability_date
% @type categorical
% @canonical true
% @original_name estimated_availability_date
% @values preorder_may_2026=Preorder_delivery_May_2026 unk_estimated_availability_date=Unknown
% @importance 0.78

0.88::true_val(estimated_availability_date, preorder_may_2026); 0.12::true_val(estimated_availability_date, unk_estimated_availability_date).
0.82::acc(s5, estimated_availability_date).
0.78::acc(s13, estimated_availability_date).
measured(s5, estimated_availability_date, preorder_may_2026).
measured(s13, estimated_availability_date, preorder_may_2026).
all_consistent(estimated_availability_date) :-
    (indep(s5), consistent(s5, estimated_availability_date) ; \+indep(s5)),
    consistent(s13, estimated_availability_date).
evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, preorder_may_2026)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values certified_b_corp=Certified_B_Corp unk_sustainability_certification=Unknown
% @importance 0.40

0.85::true_val(sustainability_certification, certified_b_corp); 0.15::true_val(sustainability_certification, unk_sustainability_certification).
0.90::acc(s14, sustainability_certification).
measured(s14, sustainability_certification, certified_b_corp).
all_consistent(sustainability_certification) :- consistent(s14, sustainability_certification).
evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, certified_b_corp)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr nfc_chip
% @type categorical
% @canonical true
% @original_name NFC chip
% @values embedded_nfc=Embedded_NFC_chip_registration_warranty unk_nfc_chip=Unknown
% @importance 0.73

0.92::true_val(nfc_chip, embedded_nfc); 0.08::true_val(nfc_chip, unk_nfc_chip).
0.95::acc(s2, nfc_chip).
0.93::acc(s15, nfc_chip).
measured(s2, nfc_chip, embedded_nfc).
measured(s15, nfc_chip, embedded_nfc).
all_consistent(nfc_chip) :-
    consistent(s2, nfc_chip),
    consistent(s15, nfc_chip).
evidence(all_consistent(nfc_chip)).
query(true_val(nfc_chip, embedded_nfc)).
query(true_val(nfc_chip, unk_nfc_chip)).

% @attr nfc_introduction_year
% @type categorical
% @canonical false
% @original_name NFC introduction year
% @values y2020=2020 unk_nfc_introduction_year=Unknown
% @importance 0.73

0.92::true_val(nfc_introduction_year, y2020); 0.08::true_val(nfc_introduction_year, unk_nfc_introduction_year).
0.95::acc(s2, nfc_introduction_year).
0.93::acc(s15, nfc_introduction_year).
measured(s2, nfc_introduction_year, y2020).
measured(s15, nfc_introduction_year, y2020).
all_consistent(nfc_introduction_year) :-
    consistent(s2, nfc_introduction_year),
    consistent(s15, nfc_introduction_year).
evidence(all_consistent(nfc_introduction_year)).
query(true_val(nfc_introduction_year, y2020)).
query(true_val(nfc_introduction_year, unk_nfc_introduction_year)).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v1999_99=1999.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.95::true_val(price_aud_merchant, v1999_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).
0.95::acc(sm, price_aud_merchant).
measured(sm, price_aud_merchant, v1999_99).
all_consistent(price_aud_merchant) :- consistent(sm, price_aud_merchant).
evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v1999_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values preorder=Preorder_est_May_2026 unk_availability_status=Unknown
% @importance 0.85

0.95::true_val(availability_status, preorder); 0.05::true_val(availability_status, unk_availability_status).
0.95::acc(sm, availability_status).
measured(sm, availability_status, preorder).
all_consistent(availability_status) :- consistent(sm, availability_status).
evidence(all_consistent(availability_status)).
query(true_val(availability_status, preorder)).
query(true_val(availability_status, unk_availability_status)).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v1099_95=1099.95 unk_price_usd_msrp=Unknown
% @importance 0.87

0.96::true_val(price_usd_msrp, v1099_95); 0.04::true_val(price_usd_msrp, unk_price_usd_msrp).
0.93::acc(s16, price_usd_msrp).
0.90::acc(s21, price_usd_msrp).
measured(s16, price_usd_msrp, v1099_95).
measured(s21, price_usd_msrp, v1099_95).
all_consistent(price_usd_msrp) :-
    consistent(s16, price_usd_msrp),
    (indep(s21), consistent(s21, price_usd_msrp) ; \+indep(s21)).
evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v1099_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_evo
% @values v879_96=879.96 unk_price_usd_evo=Unknown
% @importance 0.95

0.95::true_val(price_usd_evo, v879_96); 0.05::true_val(price_usd_evo, unk_price_usd_evo).
0.93::acc(s16, price_usd_evo).
measured(s16, price_usd_evo, v879_96).
all_consistent(price_usd_evo) :- consistent(s16, price_usd_evo).
evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v879_96)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_tactics
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_tactics
% @values v879_95=879.95 unk_price_usd_tactics=Unknown
% @importance 0.75

0.93::true_val(price_usd_tactics, v879_95); 0.07::true_val(price_usd_tactics, unk_price_usd_tactics).
0.92::acc(s18, price_usd_tactics).
measured(s18, price_usd_tactics, v879_95).
all_consistent(price_usd_tactics) :- consistent(s18, price_usd_tactics).
evidence(all_consistent(price_usd_tactics)).
query(true_val(price_usd_tactics, v879_95)).
query(true_val(price_usd_tactics, unk_price_usd_tactics)).

% @attr price_usd_sun_ski
% @type numeric
% @unit USD
% @canonical false
% @original_name USD sale price (2026 model at Sun & Ski Sports)
% @values v879_93=879.93 unk_price_usd_sun_ski=Unknown
% @importance 0.90

0.88::true_val(price_usd_sun_ski, v879_93); 0.12::true_val(price_usd_sun_ski, unk_price_usd_sun_ski).
0.85::acc(s19, price_usd_sun_ski).
measured(s19, price_usd_sun_ski, v879_93).
all_consistent(price_usd_sun_ski) :- consistent(s19, price_usd_sun_ski).
evidence(all_consistent(price_usd_sun_ski)).
query(true_val(price_usd_sun_ski, v879_93)).
query(true_val(price_usd_sun_ski, unk_price_usd_sun_ski)).

% @attr price_usd_rei
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_rei
% @values v879_93=879.93 unk_price_usd_rei=Unknown
% @importance 0.90

0.88::true_val(price_usd_rei, v879_93); 0.12::true_val(price_usd_rei, unk_price_usd_rei).
0.85::acc(s19, price_usd_rei).
measured(s19, price_usd_rei, v879_93).
all_consistent(price_usd_rei) :- consistent(s19, price_usd_rei).
evidence(all_consistent(price_usd_rei)).
query(true_val(price_usd_rei, v879_93)).
query(true_val(price_usd_rei, unk_price_usd_rei)).

% @attr price_usd_backcountry
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_backcountry
% @values v879_96=879.96 unk_price_usd_backcountry=Unknown
% @importance 0.90

0.88::true_val(price_usd_backcountry, v879_96); 0.12::true_val(price_usd_backcountry, unk_price_usd_backcountry).
0.85::acc(s19, price_usd_backcountry).
measured(s19, price_usd_backcountry, v879_96).
all_consistent(price_usd_backcountry) :- consistent(s19, price_usd_backcountry).
evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v879_96)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

% @attr price_usd_christy
% @type numeric
% @unit USD
% @canonical false
% @original_name USD sale price (2026 model at Christy Sports)
% @values v879_96=879.96 unk_price_usd_christy=Unknown
% @importance 0.90

0.88::true_val(price_usd_christy, v879_96); 0.12::true_val(price_usd_christy, unk_price_usd_christy).
0.85::acc(s19, price_usd_christy).
measured(s19, price_usd_christy, v879_96).
all_consistent(price_usd_christy) :- consistent(s19, price_usd_christy).
evidence(all_consistent(price_usd_christy)).
query(true_val(price_usd_christy, v879_96)).
query(true_val(price_usd_christy, unk_price_usd_christy)).

% @attr price_eur_blue_tomato
% @type numeric
% @unit EUR
% @canonical true
% @original_name price_eur_blue_tomato
% @values v899=899.0 unk_price_eur_blue_tomato=Unknown
% @importance 0.90

0.88::true_val(price_eur_blue_tomato, v899); 0.12::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).
0.85::acc(s19, price_eur_blue_tomato).
measured(s19, price_eur_blue_tomato, v899).
all_consistent(price_eur_blue_tomato) :- consistent(s19, price_eur_blue_tomato).
evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v899)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

% @attr price_cad_prfo
% @type categorical
% @unit CAD
% @canonical true
% @original_name price_cad_prfo
% @values v1119_99_to_1399_99=1119.99_to_1399.99 unk_price_cad_prfo=Unknown
% @importance 0.90

0.88::true_val(price_cad_prfo, v1119_99_to_1399_99); 0.12::true_val(price_cad_prfo, unk_price_cad_prfo).
0.85::acc(s19, price_cad_prfo).
measured(s19, price_cad_prfo, v1119_99_to_1399_99).
all_consistent(price_cad_prfo) :- consistent(s19, price_cad_prfo).
evidence(all_consistent(price_cad_prfo)).
query(true_val(price_cad_prfo, v1119_99_to_1399_99)).
query(true_val(price_cad_prfo, unk_price_cad_prfo)).

% @attr price_aud_merchant_2024
% @type numeric
% @unit AUD
% @canonical false
% @original_name price_aud_merchant
% @values v1800=1800.0 unk_price_aud_merchant_2024=Unknown
% @importance 0.65

0.60::true_val(price_aud_merchant_2024, v1800); 0.40::true_val(price_aud_merchant_2024, unk_price_aud_merchant_2024).
0.55::acc(s20, price_aud_merchant_2024).
measured(s20, price_aud_merchant_2024, v1800).
all_consistent(price_aud_merchant_2024) :- consistent(s20, price_aud_merchant_2024).
evidence(all_consistent(price_aud_merchant_2024)).
query(true_val(price_aud_merchant_2024, v1800)).
query(true_val(price_aud_merchant_2024, unk_price_aud_merchant_2024)).

% @attr availability_status_evo_2026
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_on_sale=Available_on_sale unk_availability_status_evo_2026=Unknown
% @importance 0.95

0.92::true_val(availability_status_evo_2026, available_on_sale); 0.08::true_val(availability_status_evo_2026, unk_availability_status_evo_2026).
0.90::acc(s16, availability_status_evo_2026).
measured(s16, availability_status_evo_2026, available_on_sale).
all_consistent(availability_status_evo_2026) :- consistent(s16, availability_status_evo_2026).
evidence(all_consistent(availability_status_evo_2026)).
query(true_val(availability_status_evo_2026, available_on_sale)).
query(true_val(availability_status_evo_2026, unk_availability_status_evo_2026)).

% @attr availability_status_tactics
% @type categorical
% @canonical false
% @original_name availability_status
% @values available=Available unk_availability_status_tactics=Unknown
% @importance 0.75

0.90::true_val(availability_status_tactics, available); 0.10::true_val(availability_status_tactics, unk_availability_status_tactics).
0.88::acc(s18, availability_status_tactics).
measured(s18, availability_status_tactics, available).
all_consistent(availability_status_tactics) :- consistent(s18, availability_status_tactics).
evidence(all_consistent(availability_status_tactics)).
query(true_val(availability_status_tactics, available)).
query(true_val(availability_status_tactics, unk_availability_status_tactics)).

% @attr availability_status_house
% @type categorical
% @canonical false
% @original_name availability_status
% @values available=Available unk_availability_status_house=Unknown
% @importance 0.70

0.88::true_val(availability_status_house, available); 0.12::true_val(availability_status_house, unk_availability_status_house).
0.85::acc(s7, availability_status_house).
measured(s7, availability_status_house, available).
all_consistent(availability_status_house) :- consistent(s7, availability_status_house).
evidence(all_consistent(availability_status_house)).
query(true_val(availability_status_house, available)).
query(true_val(availability_status_house, unk_availability_status_house)).

% @attr availability_status_capita_preorder
% @type categorical
% @canonical false
% @original_name availability_status
% @values pre_order=Pre_order unk_availability_status_capita_preorder=Unknown
% @importance 0.90

0.92::true_val(availability_status_capita_preorder, pre_order); 0.08::true_val(availability_status_capita_preorder, unk_availability_status_capita_preorder).
0.90::acc(s1, availability_status_capita_preorder).
measured(s1, availability_status_capita_preorder, pre_order).
all_consistent(availability_status_capita_preorder) :-
    (indep(s1), consistent(s1, availability_status_capita_preorder) ; \+indep(s1)).
evidence(all_consistent(availability_status_capita_preorder)).
query(true_val(availability_status_capita_preorder, pre_order)).
query(true_val(availability_status_capita_preorder, unk_availability_status_capita_preorder)).

% @attr availability_status_melbourne_preorder
% @type categorical
% @canonical false
% @original_name availability_status
% @values pre_order=Pre_order unk_availability_status_melbourne_preorder=Unknown
% @importance 0.85

0.90::true_val(availability_status_melbourne_preorder, pre_order); 0.10::true_val(availability_status_melbourne_preorder, unk_availability_status_melbourne_preorder).
0.88::acc(s5, availability_status_melbourne_preorder).
measured(s5, availability_status_melbourne_preorder, pre_order).
all_consistent(availability_status_melbourne_preorder) :-
    (indep(s5), consistent(s5, availability_status_melbourne_preorder) ; \+indep(s5)).
evidence(all_consistent(availability_status_melbourne_preorder)).
query(true_val(availability_status_melbourne_preorder, pre_order)).
query(true_val(availability_status_melbourne_preorder, unk_availability_status_melbourne_preorder)).

% @attr availability_status_auski
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_for_purchase=Available_for_purchase unk_availability_status_auski=Unknown
% @importance 0.85

0.88::true_val(availability_status_auski, available_for_purchase); 0.12::true_val(availability_status_auski, unk_availability_status_auski).
0.82::acc(s4, availability_status_auski).
measured(s4, availability_status_auski, available_for_purchase).
all_consistent(availability_status_auski) :- consistent(s4, availability_status_auski).
evidence(all_consistent(availability_status_auski)).
query(true_val(availability_status_auski, available_for_purchase)).
query(true_val(availability_status_auski, unk_availability_status_auski)).

% @attr availability_status_gravity
% @type categorical
% @canonical false
% @original_name availability_status
% @values available=Available unk_availability_status_gravity=Unknown
% @importance 0.50

0.80::true_val(availability_status_gravity, available); 0.20::true_val(availability_status_gravity, unk_availability_status_gravity).
0.78::acc(s22, availability_status_gravity).
measured(s22, availability_status_gravity, available).
all_consistent(availability_status_gravity) :-
    (indep(s22), consistent(s22, availability_status_gravity) ; \+indep(s22)).
evidence(all_consistent(availability_status_gravity)).
query(true_val(availability_status_gravity, available)).
query(true_val(availability_status_gravity, unk_availability_status_gravity)).

% @attr availability_status_amazon
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_older=Available_older_models unk_availability_status_amazon=Unknown
% @importance 0.50

0.75::true_val(availability_status_amazon, available_older); 0.25::true_val(availability_status_amazon, unk_availability_status_amazon).
0.72::acc(s23, availability_status_amazon).
measured(s23, availability_status_amazon, available_older).
all_consistent(availability_status_amazon) :- consistent(s23, availability_status_amazon).
evidence(all_consistent(availability_status_amazon)).
query(true_val(availability_status_amazon, available_older)).
query(true_val(availability_status_amazon, unk_availability_status_amazon)).

% @attr availability_status_eriks
% @type categorical
% @canonical false
% @original_name availability_status
% @values closeout=Closeout_item unk_availability_status_eriks=Unknown
% @importance 0.60

0.82::true_val(availability_status_eriks, closeout); 0.18::true_val(availability_status_eriks, unk_availability_status_eriks).
0.80::acc(s24, availability_status_eriks).
measured(s24, availability_status_eriks, closeout).
all_consistent(availability_status_eriks) :- consistent(s24, availability_status_eriks).
evidence(all_consistent(availability_status_eriks)).
query(true_val(availability_status_eriks, closeout)).
query(true_val(availability_status_eriks, unk_availability_status_eriks)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values directional=Directional unk_shape=Unknown
% @importance 0.88

0.96::true_val(shape, directional); 0.04::true_val(shape, unk_shape).
0.93::acc(s2, shape).
0.85::acc(s1, shape).
0.85::acc(s8, shape).
0.85::acc(s25, shape).
measured(s2, shape, directional).
measured(s1, shape, directional).
measured(s8, shape, directional).
measured(s25, shape, directional).
all_consistent(shape) :-
    consistent(s2, shape),
    (indep(s1), consistent(s1, shape) ; \+indep(s1)),
    consistent(s8, shape),
    (indep(s1), consistent(s25, shape) ; \+indep(s1)).
evidence(all_consistent(shape)).
query(true_val(shape, directional)).
query(true_val(shape, unk_shape)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values alpine_v1_directional_flat_kick=Alpine_V1_Directional_Flat_Kick_Tech unk_camber_type=Unknown
% @importance 0.95

0.95::true_val(camber_type, alpine_v1_directional_flat_kick); 0.05::true_val(camber_type, unk_camber_type).
0.93::acc(s2, camber_type).
0.85::acc(s1, camber_type).
measured(s2, camber_type, alpine_v1_directional_flat_kick).
measured(s1, camber_type, alpine_v1_directional_flat_kick).
all_consistent(camber_type) :-
    consistent(s2, camber_type),
    (indep(s1), consistent(s1, camber_type) ; \+indep(s1)).
evidence(all_consistent(camber_type)).
query(true_val(camber_type, alpine_v1_directional_flat_kick)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values mid_camber_flat_tail_reverse_nose=Mid_body_camber_flat_tail_reverse_cambered_nose unk_camber_description=Unknown
% @importance 0.90

0.93::true_val(camber_description, mid_camber_flat_tail_reverse_nose); 0.07::true_val(camber_description, unk_camber_description).
0.90::acc(s1, camber_description).
0.88::acc(s6, camber_description).
measured(s1, camber_description, mid_camber_flat_tail_reverse_nose).
measured(s6, camber_description, mid_camber_flat_tail_reverse_nose).
all_consistent(camber_description) :-
    (indep(s1), consistent(s1, camber_description) ; \+indep(s1)),
    (indep(s6), consistent(s6, camber_description) ; \+indep(s6)).
evidence(all_consistent(camber_description)).
query(true_val(camber_description, mid_camber_flat_tail_reverse_nose)).
query(true_val(camber_description, unk_camber_description)).

% @attr taper
% @type numeric
% @unit cm
% @canonical true
% @original_name taper
% @values v1_1=1.1 unk_taper=Unknown
% @importance 0.85

0.92::true_val(taper, v1_1); 0.08::true_val(taper, unk_taper).
0.92::acc(sm, taper).
measured(sm, taper, v1_1).
all_consistent(taper) :-
    (indep(sm), consistent(sm, taper) ; \+indep(sm)).
evidence(all_consistent(taper)).
query(true_val(taper, v1_1)).
query(true_val(taper, unk_taper)).

% @attr setback
% @type numeric
% @unit mm
% @canonical true
% @original_name setback
% @values v20=20.0 unk_setback=Unknown
% @importance 0.85

0.95::true_val(setback, v20); 0.05::true_val(setback, unk_setback).
0.82::acc(s26, setback).
0.88::acc(s27, setback).
0.90::acc(s34, setback).
measured(s26, setback, v20).
measured(s27, setback, v20).
measured(s34, setback, v20).
all_consistent(setback) :-
    (indep(s26), consistent(s26, setback) ; \+indep(s26)),
    consistent(s27, setback),
    (indep(s34), consistent(s34, setback) ; \+indep(s34)).
evidence(all_consistent(setback)).
query(true_val(setback, v20)).
query(true_val(setback, unk_setback)).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v6_5=6.5 v7=7.0
% @importance 0.83

0.70::true_val(flex_rating_10, v6_5); 0.30::true_val(flex_rating_10, v7).
0.90::acc(sm, flex_rating_10).
0.88::acc(s8, flex_rating_10).
0.87::acc(s25, flex_rating_10).
0.60::acc(s4, flex_rating_10).
0.55::acc(s28, flex_rating_10).
measured(sm, flex_rating_10, v6_5).
measured(s8, flex_rating_10, v6_5).
measured(s25, flex_rating_10, v6_5).
measured(s4, flex_rating_10, v7).
measured(s28, flex_rating_10, v7).
all_consistent(flex_rating_10) :-
    (indep(sm), consistent(sm, flex_rating_10) ; \+indep(sm)),
    consistent(s8, flex_rating_10),
    (indep(s25), consistent(s25, flex_rating_10) ; \+indep(s25)),
    (indep(s4), consistent(s4, flex_rating_10) ; \+indep(s4)),
    (indep(s28), consistent(s28, flex_rating_10) ; \+indep(s28)).
evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v6_5)).
query(true_val(flex_rating_10, v7)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values medium_stiff=Medium_stiff unk_flex_feel=Unknown
% @importance 0.85

0.92::true_val(flex_feel, medium_stiff); 0.08::true_val(flex_feel, unk_flex_feel).
0.85::acc(s8, flex_feel).
0.85::acc(s25, flex_feel).
measured(s8, flex_feel, medium_stiff).
measured(s25, flex_feel, medium_stiff).
all_consistent(flex_feel) :-
    consistent(s8, flex_feel),
    (indep(s1), consistent(s25, flex_feel) ; \+indep(s1)).
evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium_stiff)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values directional_stiffer_tail=Directional_flex_stiffer_tail_softer_nose unk_flex_direction=Unknown
% @importance 0.75

0.90::true_val(flex_direction, directional_stiffer_tail); 0.10::true_val(flex_direction, unk_flex_direction).
0.85::acc(s25, flex_direction).
0.82::acc(s29, flex_direction).
measured(s25, flex_direction, directional_stiffer_tail).
measured(s29, flex_direction, directional_stiffer_tail).
all_consistent(flex_direction) :-
    (indep(s1), consistent(s25, flex_direction) ; \+indep(s1)),
    consistent(s29, flex_direction).
evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional_stiffer_tail)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr flex_direction_between_feet
% @type categorical
% @canonical false
% @original_name flex_direction
% @values stiffer_tip_tail=Stiffer_in_tip_and_tail_than_between_feet unk_flex_direction_between_feet=Unknown
% @importance 0.85

0.85::true_val(flex_direction_between_feet, stiffer_tip_tail); 0.15::true_val(flex_direction_between_feet, unk_flex_direction_between_feet).
0.83::acc(s25, flex_direction_between_feet).
measured(s25, flex_direction_between_feet, stiffer_tip_tail).
all_consistent(flex_direction_between_feet) :-
    (indep(s1), consistent(s25, flex_direction_between_feet) ; \+indep(s1)).
evidence(all_consistent(flex_direction_between_feet)).
query(true_val(flex_direction_between_feet, stiffer_tip_tail)).
query(true_val(flex_direction_between_feet, unk_flex_direction_between_feet)).

% @attr flex_feel_stiffer_than_rated
% @type categorical
% @canonical false
% @original_name flex_feel
% @values stiffer_than_rated=Feels_stiffer_than_CAPiTA_rate_at_70kg unk_flex_feel_stiffer_than_rated=Unknown
% @importance 0.85

0.80::true_val(flex_feel_stiffer_than_rated, stiffer_than_rated); 0.20::true_val(flex_feel_stiffer_than_rated, unk_flex_feel_stiffer_than_rated).
0.82::acc(s30, flex_feel_stiffer_than_rated).
measured(s30, flex_feel_stiffer_than_rated, stiffer_than_rated).
all_consistent(flex_feel_stiffer_than_rated) :- consistent(s30, flex_feel_stiffer_than_rated).
evidence(all_consistent(flex_feel_stiffer_than_rated)).
query(true_val(flex_feel_stiffer_than_rated, stiffer_than_rated)).
query(true_val(flex_feel_stiffer_than_rated, unk_flex_feel_stiffer_than_rated)).

% @attr flex_feel_torsionally_stiff
% @type categorical
% @canonical false
% @original_name flex_feel
% @values torsionally_stiff=Quite_torsionally_stiff_locked_in_feel unk_flex_feel_torsionally_stiff=Unknown
% @importance 0.90

0.83::true_val(flex_feel_torsionally_stiff, torsionally_stiff); 0.17::true_val(flex_feel_torsionally_stiff, unk_flex_feel_torsionally_stiff).
0.85::acc(s31, flex_feel_torsionally_stiff).
measured(s31, flex_feel_torsionally_stiff, torsionally_stiff).
all_consistent(flex_feel_torsionally_stiff) :- consistent(s31, flex_feel_torsionally_stiff).
evidence(all_consistent(flex_feel_torsionally_stiff)).
query(true_val(flex_feel_torsionally_stiff, torsionally_stiff)).
query(true_val(flex_feel_torsionally_stiff, unk_flex_feel_torsionally_stiff)).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values new_age_progressive_death_grip=New_Age_Progressive_Death_Grip unk_sidecut_type=Unknown
% @importance 0.88

0.93::true_val(sidecut_type, new_age_progressive_death_grip); 0.07::true_val(sidecut_type, unk_sidecut_type).
0.90::acc(sm, sidecut_type).
0.88::acc(s6, sidecut_type).
measured(sm, sidecut_type, new_age_progressive_death_grip).
measured(s6, sidecut_type, new_age_progressive_death_grip).
all_consistent(sidecut_type) :-
    (indep(sm), consistent(sm, sidecut_type) ; \+indep(sm)),
    (indep(s6), consistent(s6, sidecut_type) ; \+indep(s6)).
evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, new_age_progressive_death_grip)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr sidecut_type_description
% @type categorical
% @canonical false
% @original_name sidecut_type
% @values progressive_blended_radii=Progressive_sidecut_blends_radii_death_grip_reverse_arc unk_sidecut_type_description=Unknown
% @importance 0.88

0.92::true_val(sidecut_type_description, progressive_blended_radii); 0.08::true_val(sidecut_type_description, unk_sidecut_type_description).
0.90::acc(sm, sidecut_type_description).
0.88::acc(s6, sidecut_type_description).
measured(sm, sidecut_type_description, progressive_blended_radii).
measured(s6, sidecut_type_description, progressive_blended_radii).
all_consistent(sidecut_type_description) :-
    (indep(sm), consistent(sm, sidecut_type_description) ; \+indep(sm)),
    (indep(s6), consistent(s6, sidecut_type_description) ; \+indep(s6)).
evidence(all_consistent(sidecut_type_description)).
query(true_val(sidecut_type_description, progressive_blended_radii)).
query(true_val(sidecut_type_description, unk_sidecut_type_description)).

% @attr edge_technology_death_grip
% @type categorical
% @canonical false
% @original_name edge_technology
% @values bump_1_5mm=1_5mm_bump_each_side_waist_additional_contact unk_edge_technology_death_grip=Unknown
% @importance 0.90

0.88::true_val(edge_technology_death_grip, bump_1_5mm); 0.12::true_val(edge_technology_death_grip, unk_edge_technology_death_grip).
0.88::acc(s27, edge_technology_death_grip).
measured(s27, edge_technology_death_grip, bump_1_5mm).
all_consistent(edge_technology_death_grip) :- consistent(s27, edge_technology_death_grip).
evidence(all_consistent(edge_technology_death_grip)).
query(true_val(edge_technology_death_grip, bump_1_5mm)).
query(true_val(edge_technology_death_grip, unk_edge_technology_death_grip)).

% @attr sidecut_type_rider_description
% @type categorical
% @canonical false
% @original_name sidecut_type
% @values larger_to_tighter_tail=Larger_radius_majority_tighter_towards_tail unk_sidecut_type_rider_description=Unknown
% @importance 0.85

0.80::true_val(sidecut_type_rider_description, larger_to_tighter_tail); 0.20::true_val(sidecut_type_rider_description, unk_sidecut_type_rider_description).
0.80::acc(s30, sidecut_type_rider_description).
measured(s30, sidecut_type_rider_description, larger_to_tighter_tail).
all_consistent(sidecut_type_rider_description) :- consistent(s30, sidecut_type_rider_description).
evidence(all_consistent(sidecut_type_rider_description)).
query(true_val(sidecut_type_rider_description, larger_to_tighter_tail)).
query(true_val(sidecut_type_rider_description, unk_sidecut_type_rider_description)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values thermopolymer_starship_poplar=Thermopolymer_Starship_Core_reforestation_Poplar unk_core_material=Unknown
% @importance 0.95

0.95::true_val(core_material, thermopolymer_starship_poplar); 0.05::true_val(core_material, unk_core_material).
0.94::acc(s2, core_material).
0.88::acc(s6, core_material).
measured(s2, core_material, thermopolymer_starship_poplar).
measured(s6, core_material, thermopolymer_starship_poplar).
all_consistent(core_material) :-
    consistent(s2, core_material),
    (indep(s6), consistent(s6, core_material) ; \+indep(s6)).
evidence(all_consistent(core_material)).
query(true_val(core_material, thermopolymer_starship_poplar)).
query(true_val(core_material, unk_core_material)).

% @attr core_material_poplar
% @type categorical
% @canonical false
% @original_name core_material
% @values poplar_comparable_paulownia=Poplar_comparable_to_Paulownia_strength_to_weight unk_core_material_poplar=Unknown
% @importance 0.95

0.92::true_val(core_material_poplar, poplar_comparable_paulownia); 0.08::true_val(core_material_poplar, unk_core_material_poplar).
0.94::acc(s2, core_material_poplar).
0.88::acc(s6, core_material_poplar).
measured(s2, core_material_poplar, poplar_comparable_paulownia).
measured(s6, core_material_poplar, poplar_comparable_paulownia).
all_consistent(core_material_poplar) :-
    consistent(s2, core_material_poplar),
    (indep(s6), consistent(s6, core_material_poplar) ; \+indep(s6)).
evidence(all_consistent(core_material_poplar)).
query(true_val(core_material_poplar, poplar_comparable_paulownia)).
query(true_val(core_material_poplar, unk_core_material_poplar)).

% @attr core_material_thermopolymer_channels
% @type categorical
% @canonical false
% @original_name core_material
% @values recycled_thermopolymer_3ch=Post_consumer_recycled_thermopolymer_3_channels unk_core_material_thermopolymer_channels=Unknown
% @importance 0.93

0.90::true_val(core_material_thermopolymer_channels, recycled_thermopolymer_3ch); 0.10::true_val(core_material_thermopolymer_channels, unk_core_material_thermopolymer_channels).
0.88::acc(s30, core_material_thermopolymer_channels).
0.94::acc(s2, core_material_thermopolymer_channels).
measured(s30, core_material_thermopolymer_channels, recycled_thermopolymer_3ch).
measured(s2, core_material_thermopolymer_channels, recycled_thermopolymer_3ch).
all_consistent(core_material_thermopolymer_channels) :-
    consistent(s30, core_material_thermopolymer_channels),
    consistent(s2, core_material_thermopolymer_channels).
evidence(all_consistent(core_material_thermopolymer_channels)).
query(true_val(core_material_thermopolymer_channels, recycled_thermopolymer_3ch)).
query(true_val(core_material_thermopolymer_channels, unk_core_material_thermopolymer_channels)).

% @attr core_exclusivity
% @type categorical
% @canonical false
% @original_name Core exclusivity
% @values mega_death_mega_merc_only=Used_only_on_Mega_Death_and_Mega_Merc unk_core_exclusivity=Unknown
% @importance 0.85

0.80::true_val(core_exclusivity, mega_death_mega_merc_only); 0.20::true_val(core_exclusivity, unk_core_exclusivity).
0.80::acc(s30, core_exclusivity).
measured(s30, core_exclusivity, mega_death_mega_merc_only).
all_consistent(core_exclusivity) :- consistent(s30, core_exclusivity).
evidence(all_consistent(core_exclusivity)).
query(true_val(core_exclusivity, mega_death_mega_merc_only)).
query(true_val(core_exclusivity, unk_core_exclusivity)).

% @attr sustainability_certification_fsc
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values fsc_certified=FSC_Certified_reforestation unk_sustainability_certification_fsc=Unknown
% @importance 0.78

0.92::true_val(sustainability_certification_fsc, fsc_certified); 0.08::true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc).
0.88::acc(s6, sustainability_certification_fsc).
0.82::acc(s32, sustainability_certification_fsc).
measured(s6, sustainability_certification_fsc, fsc_certified).
measured(s32, sustainability_certification_fsc, fsc_certified).
all_consistent(sustainability_certification_fsc) :-
    (indep(s6), consistent(s6, sustainability_certification_fsc) ; \+indep(s6)),
    (indep(s32), consistent(s32, sustainability_certification_fsc) ; \+indep(s32)).
evidence(all_consistent(sustainability_certification_fsc)).
query(true_val(sustainability_certification_fsc, fsc_certified)).
query(true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values pure_megacarbon_marine_epoxy=Pure_Megacarbon_Marine_Grade_Epoxy unk_laminate=Unknown
% @importance 0.88

0.92::true_val(laminate, pure_megacarbon_marine_epoxy); 0.08::true_val(laminate, unk_laminate).
0.90::acc(sm, laminate).
0.85::acc(s5, laminate).
measured(sm, laminate, pure_megacarbon_marine_epoxy).
measured(s5, laminate, pure_megacarbon_marine_epoxy).
all_consistent(laminate) :-
    (indep(sm), consistent(sm, laminate) ; \+indep(sm)),
    (indep(s5), consistent(s5, laminate) ; \+indep(s5)).
evidence(all_consistent(laminate)).
query(true_val(laminate, pure_megacarbon_marine_epoxy)).
query(true_val(laminate, unk_laminate)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values full_carbon_tip_to_tail=Pure_Megacarbon_full_carbon_tip_to_tail unk_construction_material_innovation=Unknown
% @importance 0.88

0.94::true_val(construction_material_innovation, full_carbon_tip_to_tail); 0.06::true_val(construction_material_innovation, unk_construction_material_innovation).
0.85::acc(s5, construction_material_innovation).
0.82::acc(s30, construction_material_innovation).
0.85::acc(s25, construction_material_innovation).
0.85::acc(s1, construction_material_innovation).
measured(s5, construction_material_innovation, full_carbon_tip_to_tail).
measured(s30, construction_material_innovation, full_carbon_tip_to_tail).
measured(s25, construction_material_innovation, full_carbon_tip_to_tail).
measured(s1, construction_material_innovation, full_carbon_tip_to_tail).
all_consistent(construction_material_innovation) :-
    (indep(s5), consistent(s5, construction_material_innovation) ; \+indep(s5)),
    consistent(s30, construction_material_innovation),
    (indep(s1), consistent(s25, construction_material_innovation) ; \+indep(s1)),
    (indep(s1), consistent(s1, construction_material_innovation) ; \+indep(s1)).
evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, full_carbon_tip_to_tail)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr construction_material_innovation_array
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values megacarbon_array=Megacarbon_Array_wide_carbon_tape_top_bottom unk_construction_material_innovation_array=Unknown
% @importance 0.68

0.80::true_val(construction_material_innovation_array, megacarbon_array); 0.20::true_val(construction_material_innovation_array, unk_construction_material_innovation_array).
0.78::acc(s21, construction_material_innovation_array).
0.75::acc(s32, construction_material_innovation_array).
measured(s21, construction_material_innovation_array, megacarbon_array).
measured(s32, construction_material_innovation_array, megacarbon_array).
all_consistent(construction_material_innovation_array) :-
    (indep(s21), consistent(s21, construction_material_innovation_array) ; \+indep(s21)),
    (indep(s32), consistent(s32, construction_material_innovation_array) ; \+indep(s32)).
evidence(all_consistent(construction_material_innovation_array)).
query(true_val(construction_material_innovation_array, megacarbon_array)).
query(true_val(construction_material_innovation_array, unk_construction_material_innovation_array)).

% @attr resin
% @type categorical
% @canonical true
% @original_name resin
% @values magic_bean=Magic_Bean_Resin_plant_based_60pct_renewable unk_resin=Unknown
% @importance 0.90

0.92::true_val(resin, magic_bean); 0.08::true_val(resin, unk_resin).
0.90::acc(s1, resin).
0.82::acc(s33, resin).
measured(s1, resin, magic_bean).
measured(s33, resin, magic_bean).
all_consistent(resin) :-
    (indep(s1), consistent(s1, resin) ; \+indep(s1)),
    (indep(s33), consistent(s33, resin) ; \+indep(s33)).
evidence(all_consistent(resin)).
query(true_val(resin, magic_bean)).
query(true_val(resin, unk_resin)).

% @attr resin_properties
% @type categorical
% @canonical false
% @original_name resin
% @values powerful_durable_thinner_core=Powerful_durable_allows_decreased_core_thickness unk_resin_properties=Unknown
% @importance 0.60

0.78::true_val(resin_properties, powerful_durable_thinner_core); 0.22::true_val(resin_properties, unk_resin_properties).
0.75::acc(s33, resin_properties).
measured(s33, resin_properties, powerful_durable_thinner_core).
all_consistent(resin_properties) :-
    (indep(s33), consistent(s33, resin_properties) ; \+indep(s33)).
evidence(all_consistent(resin_properties)).
query(true_val(resin_properties, powerful_durable_thinner_core)).
query(true_val(resin_properties, unk_resin_properties)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values megadrive_xt=Megadrive_XT_sintered_race_base_UHMW_carbon_fluoro unk_base_material=Unknown
% @importance 0.93

0.95::true_val(base_material, megadrive_xt); 0.05::true_val(base_material, unk_base_material).
0.92::acc(sm, base_material).
0.94::acc(s2, base_material).
measured(sm, base_material, megadrive_xt).
measured(s2, base_material, megadrive_xt).
all_consistent(base_material) :-
    (indep(sm), consistent(sm, base_material) ; \+indep(sm)),
    consistent(s2, base_material).
evidence(all_consistent(base_material)).
query(true_val(base_material, megadrive_xt)).
query(true_val(base_material, unk_base_material)).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values sintered_race=Sintered_race_base unk_base_type=Unknown
% @importance 0.95

0.95::true_val(base_type, sintered_race); 0.05::true_val(base_type, unk_base_type).
0.94::acc(s2, base_type).
0.88::acc(s6, base_type).
measured(s2, base_type, sintered_race).
measured(s6, base_type, sintered_race).
all_consistent(base_type) :-
    consistent(s2, base_type),
    (indep(s6), consistent(s6, base_type) ; \+indep(s6)).
evidence(all_consistent(base_type)).
query(true_val(base_type, sintered_race)).
query(true_val(base_type, unk_base_type)).

% @attr base_material_thickness
% @type categorical
% @canonical false
% @original_name base_material
% @values extra_thick=Extra_thick_enhanced_durability unk_base_material_thickness=Unknown
% @importance 0.93

0.92::true_val(base_material_thickness, extra_thick); 0.08::true_val(base_material_thickness, unk_base_material_thickness).
0.92::acc(s2, base_material_thickness).
0.85::acc(s5, base_material_thickness).
measured(s2, base_material_thickness, extra_thick).
measured(s5, base_material_thickness, extra_thick).
all_consistent(base_material_thickness) :-
    consistent(s2, base_material_thickness),
    (indep(s5), consistent(s5, base_material_thickness) ; \+indep(s5)).
evidence(all_consistent(base_material_thickness)).
query(true_val(base_material_thickness, extra_thick)).
query(true_val(base_material_thickness, unk_base_material_thickness)).

% @attr base_material_moonshot
% @type categorical
% @canonical false
% @original_name base_material
% @values moonshot_omni_tune=Moonshot_Omni_Tune_race_base_45deg_water_channel unk_base_material_moonshot=Unknown
% @importance 0.93

0.92::true_val(base_material_moonshot, moonshot_omni_tune); 0.08::true_val(base_material_moonshot, unk_base_material_moonshot).
0.92::acc(sm, base_material_moonshot).
0.94::acc(s2, base_material_moonshot).
measured(sm, base_material_moonshot, moonshot_omni_tune).
measured(s2, base_material_moonshot, moonshot_omni_tune).
all_consistent(base_material_moonshot) :-
    (indep(sm), consistent(sm, base_material_moonshot) ; \+indep(sm)),
    consistent(s2, base_material_moonshot).
evidence(all_consistent(base_material_moonshot)).
query(true_val(base_material_moonshot, moonshot_omni_tune)).
query(true_val(base_material_moonshot, unk_base_material_moonshot)).

% @attr base_material_die_cut
% @type categorical
% @canonical false
% @original_name base_material
% @values die_cut_laser=Die_Cut_Base_laser_guided_die_cutting unk_base_material_die_cut=Unknown
% @importance 0.85

0.90::true_val(base_material_die_cut, die_cut_laser); 0.10::true_val(base_material_die_cut, unk_base_material_die_cut).
0.90::acc(sm, base_material_die_cut).
0.85::acc(s5, base_material_die_cut).
measured(sm, base_material_die_cut, die_cut_laser).
measured(s5, base_material_die_cut, die_cut_laser).
all_consistent(base_material_die_cut) :-
    (indep(sm), consistent(sm, base_material_die_cut) ; \+indep(sm)),
    (indep(s5), consistent(s5, base_material_die_cut) ; \+indep(s5)).
evidence(all_consistent(base_material_die_cut)).
query(true_val(base_material_die_cut, die_cut_laser)).
query(true_val(base_material_die_cut, unk_base_material_die_cut)).

% @attr available_colors
% @type categorical
% @canonical true
% @original_name available_colors
% @values two_base_colors_per_size=Two_base_color_variations_per_size unk_available_colors=Unknown
% @importance 1.0

0.92::true_val(available_colors, two_base_colors_per_size); 0.08::true_val(available_colors, unk_available_colors).
0.92::acc(s2, available_colors).
measured(s2, available_colors, two_base_colors_per_size).
all_consistent(available_colors) :- consistent(s2, available_colors).
evidence(all_consistent(available_colors)).
query(true_val(available_colors, two_base_colors_per_size)).
query(true_val(available_colors, unk_available_colors)).

% @attr edge_technology_skid_plates
% @type categorical
% @canonical false
% @original_name edge_technology
% @values inlaid_alloy_skid_plates=Inlaid_Alloy_Skid_Plates_ultralight_tail_protection unk_edge_technology_skid_plates=Unknown
% @importance 0.88

0.92::true_val(edge_technology_skid_plates, inlaid_alloy_skid_plates); 0.08::true_val(edge_technology_skid_plates, unk_edge_technology_skid_plates).
0.90::acc(sm, edge_technology_skid_plates).
0.88::acc(s1, edge_technology_skid_plates).
measured(sm, edge_technology_skid_plates, inlaid_alloy_skid_plates).
measured(s1, edge_technology_skid_plates, inlaid_alloy_skid_plates).
all_consistent(edge_technology_skid_plates) :-
    (indep(sm), consistent(sm, edge_technology_skid_plates) ; \+indep(sm)),
    (indep(s1), consistent(s1, edge_technology_skid_plates) ; \+indep(s1)).
evidence(all_consistent(edge_technology_skid_plates)).
query(true_val(edge_technology_skid_plates, inlaid_alloy_skid_plates)).
query(true_val(edge_technology_skid_plates, unk_edge_technology_skid_plates)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values abs1000=Full_ABS1000_Sidewalls kevlar_fortress=Fortress_Kevlar_Bound_Sidewalls unk_sidewall_material=Unknown
% @importance 0.65

0.45::true_val(sidewall_material, abs1000); 0.45::true_val(sidewall_material, kevlar_fortress); 0.10::true_val(sidewall_material, unk_sidewall_material).
0.82::acc(s7, sidewall_material).
0.70::acc(s33, sidewall_material).
measured(s7, sidewall_material, abs1000).
measured(s33, sidewall_material, kevlar_fortress).
all_consistent(sidewall_material) :-
    (indep(s7), consistent(s7, sidewall_material) ; \+indep(s7)),
    (indep(s33), consistent(s33, sidewall_material) ; \+indep(s33)).
evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, abs1000)).
query(true_val(sidewall_material, kevlar_fortress)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values hrc48_360_steel=360_Degree_HRC48_Steel_Edges unk_edge_technology=Unknown
% @importance 0.70

0.88::true_val(edge_technology, hrc48_360_steel); 0.12::true_val(edge_technology, unk_edge_technology).
0.85::acc(s7, edge_technology).
measured(s7, edge_technology, hrc48_360_steel).
all_consistent(edge_technology) :-
    (indep(s7), consistent(s7, edge_technology) ; \+indep(s7)).
evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, hrc48_360_steel)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Stainless_Steel_Inserts unk_mounting_pattern=Unknown
% @importance 0.78

0.93::true_val(mounting_pattern, inserts_2x4); 0.07::true_val(mounting_pattern, unk_mounting_pattern).
0.90::acc(sm, mounting_pattern).
0.85::acc(s7, mounting_pattern).
measured(sm, mounting_pattern, inserts_2x4).
measured(s7, mounting_pattern, inserts_2x4).
all_consistent(mounting_pattern) :-
    (indep(sm), consistent(sm, mounting_pattern) ; \+indep(sm)),
    (indep(s7), consistent(s7, mounting_pattern) ; \+indep(s7)).
evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr topsheet
% @type categorical
% @canonical true
% @original_name topsheet
% @values screen_print_metallic=Screen_Print_Metallic_Underlay unk_topsheet=Unknown
% @importance 0.88

0.90::true_val(topsheet, screen_print_metallic); 0.10::true_val(topsheet, unk_topsheet).
0.90::acc(sm, topsheet).
0.88::acc(s1, topsheet).
measured(sm, topsheet, screen_print_metallic).
measured(s1, topsheet, screen_print_metallic).
all_consistent(topsheet) :-
    (indep(sm), consistent(sm, topsheet) ; \+indep(sm)),
    (indep(s1), consistent(s1, topsheet) ; \+indep(s1)).
evidence(all_consistent(topsheet)).
query(true_val(topsheet, screen_print_metallic)).
query(true_val(topsheet, unk_topsheet)).

% @attr topsheet_appearance_description
% @type categorical
% @canonical true
% @original_name topsheet_appearance_description
% @values pam16000=PAM16000_16000_nozzles_solventless_UV_ink unk_topsheet_appearance_description=Unknown
% @importance 0.85

0.90::true_val(topsheet_appearance_description, pam16000); 0.10::true_val(topsheet_appearance_description, unk_topsheet_appearance_description).
0.90::acc(sm, topsheet_appearance_description).
0.85::acc(s5, topsheet_appearance_description).
measured(sm, topsheet_appearance_description, pam16000).
measured(s5, topsheet_appearance_description, pam16000).
all_consistent(topsheet_appearance_description) :-
    (indep(sm), consistent(sm, topsheet_appearance_description) ; \+indep(sm)),
    (indep(s5), consistent(s5, topsheet_appearance_description) ; \+indep(s5)).
evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, pam16000)).
query(true_val(topsheet_appearance_description, unk_topsheet_appearance_description)).

% @attr topsheet_appearance_description_deepspace
% @type categorical
% @canonical false
% @original_name topsheet_appearance_description
% @values multitech_deepspace=Multitech_Level5_DeepSpace_Silkscreen_Pearlescent unk_topsheet_appearance_description_deepspace=Unknown
% @importance 0.68

0.85::true_val(topsheet_appearance_description_deepspace, multitech_deepspace); 0.15::true_val(topsheet_appearance_description_deepspace, unk_topsheet_appearance_description_deepspace).
0.82::acc(s7, topsheet_appearance_description_deepspace).
0.78::acc(s32, topsheet_appearance_description_deepspace).
measured(s7, topsheet_appearance_description_deepspace, multitech_deepspace).
measured(s32, topsheet_appearance_description_deepspace, multitech_deepspace).
all_consistent(topsheet_appearance_description_deepspace) :-
    (indep(s7), consistent(s7, topsheet_appearance_description_deepspace) ; \+indep(s7)),
    (indep(s32), consistent(s32, topsheet_appearance_description_deepspace) ; \+indep(s32)).
evidence(all_consistent(topsheet_appearance_description_deepspace)).
query(true_val(topsheet_appearance_description_deepspace, multitech_deepspace)).
query(true_val(topsheet_appearance_description_deepspace, unk_topsheet_appearance_description_deepspace)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values six_sizes=156_159_162_157W_161W_165W unk_available_sizes=Unknown
% @importance 0.85

0.95::true_val(available_sizes, six_sizes); 0.05::true_val(available_sizes, unk_available_sizes).
0.93::acc(sm, available_sizes).
measured(sm, available_sizes, six_sizes).
all_consistent(available_sizes) :- consistent(sm, available_sizes).
evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, six_sizes)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr width_options
% @type categorical
% @canonical true
% @original_name width_options
% @values standard_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 0.85

0.95::true_val(width_options, standard_wide); 0.05::true_val(width_options, unk_width_options).
0.93::acc(sm, width_options).
measured(sm, width_options, standard_wide).
all_consistent(width_options) :- consistent(sm, width_options).
evidence(all_consistent(width_options)).
query(true_val(width_options, standard_wide)).
query(true_val(width_options, unk_width_options)).

% @attr effective_edge_156
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 156cm
% @values v1197=1197.0 unk_effective_edge_156=Unknown
% @importance 0.90

0.93::true_val(effective_edge_156, v1197); 0.07::true_val(effective_edge_156, unk_effective_edge_156).
0.92::acc(sm, effective_edge_156).
measured(sm, effective_edge_156, v1197).
all_consistent(effective_edge_156) :-
    (indep(sm), consistent(sm, effective_edge_156) ; \+indep(sm)).
evidence(all_consistent(effective_edge_156)).
query(true_val(effective_edge_156, v1197)).
query(true_val(effective_edge_156, unk_effective_edge_156)).

% @attr sidecut_radius_size
% @type categorical
% @unit m
% @canonical true
% @original_name sidecut_radius_size
% @values r8_2_7_8_7_6=8.2_7.8_7.6 unk_sidecut_radius_size=Unknown
% @importance 0.90

0.93::true_val(sidecut_radius_size, r8_2_7_8_7_6); 0.07::true_val(sidecut_radius_size, unk_sidecut_radius_size).
0.92::acc(sm, sidecut_radius_size).
measured(sm, sidecut_radius_size, r8_2_7_8_7_6).
all_consistent(sidecut_radius_size) :-
    (indep(sm), consistent(sm, sidecut_radius_size) ; \+indep(sm)).
evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, r8_2_7_8_7_6)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr tip_tail_width_size
% @type categorical
% @unit cm
% @canonical true
% @original_name tip_tail_width_size
% @values w29_6_29_5=29.6_29.5 unk_tip_tail_width_size=Unknown
% @importance 0.90

0.93::true_val(tip_tail_width_size, w29_6_29_5); 0.07::true_val(tip_tail_width_size, unk_tip_tail_width_size).
0.92::acc(sm, tip_tail_width_size).
measured(sm, tip_tail_width_size, w29_6_29_5).
all_consistent(tip_tail_width_size) :-
    (indep(sm), consistent(sm, tip_tail_width_size) ; \+indep(sm)).
evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, w29_6_29_5)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr waist_width_156
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 156cm
% @values v25_6=25.6 unk_waist_width_156=Unknown
% @importance 0.90

0.93::true_val(waist_width_156, v25_6); 0.07::true_val(waist_width_156, unk_waist_width_156).
0.92::acc(sm, waist_width_156).
measured(sm, waist_width_156, v25_6).
all_consistent(waist_width_156) :-
    (indep(sm), consistent(sm, waist_width_156) ; \+indep(sm)).
evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v25_6)).
query(true_val(waist_width_156, unk_waist_width_156)).

% @attr stance_width_range_size
% @type numeric
% @unit cm
% @canonical true
% @original_name stance_width_range_size
% @values v55_9=55.9 unk_stance_width_range_size=Unknown
% @importance 0.90

0.93::true_val(stance_width_range_size, v55_9); 0.07::true_val(stance_width_range_size, unk_stance_width_range_size).
0.92::acc(sm, stance_width_range_size).
measured(sm, stance_width_range_size, v55_9).
all_consistent(stance_width_range_size) :-
    (indep(sm), consistent(sm, stance_width_range_size) ; \+indep(sm)).
evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v55_9)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size
% @values w59_86=59_86_kg unk_recommended_weight_range_size=Unknown
% @importance 0.90

0.93::true_val(recommended_weight_range_size, w59_86); 0.07::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).
0.92::acc(sm, recommended_weight_range_size).
measured(sm, recommended_weight_range_size, w59_86).
all_consistent(recommended_weight_range_size) :-
    (indep(sm), consistent(sm, recommended_weight_range_size) ; \+indep(sm)).
evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w59_86)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr effective_edge_159
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 159cm
% @values v1221=1221.0 unk_effective_edge_159=Unknown
% @importance 0.90

0.93::true_val(effective_edge_159, v1221); 0.07::true_val(effective_edge_159, unk_effective_edge_159).
0.92::acc(sm, effective_edge_159).
measured(sm, effective_edge_159, v1221).
all_consistent(effective_edge_159) :-
    (indep(sm), consistent(sm, effective_edge_159) ; \+indep(sm)).
evidence(all_consistent(effective_edge_159)).
query(true_val(effective_edge_159, v1221)).
query(true_val(effective_edge_159, unk_effective_edge_159)).

% @attr sidecut_radius_size_159
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values r8_4_8_0_7_8=8.4_8.0_7.8 unk_sidecut_radius_size_159=Unknown
% @importance 0.90

0.93::true_val(sidecut_radius_size_159, r8_4_8_0_7_8); 0.07::true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159).
0.92::acc(sm, sidecut_radius_size_159).
measured(sm, sidecut_radius_size_159, r8_4_8_0_7_8).
all_consistent(sidecut_radius_size_159) :-
    (indep(sm), consistent(sm, sidecut_radius_size_159) ; \+indep(sm)).
evidence(all_consistent(sidecut_radius_size_159)).
query(true_val(sidecut_radius_size_159, r8_4_8_0_7_8)).
query(true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159)).

% @attr tip_tail_width_size_159
% @type categorical
% @unit cm
% @canonical false
% @original_name tip_tail_width_size
% @values w30_0_29_9=30.0_29.9 unk_tip_tail_width_size_159=Unknown
% @importance 0.90

0.93::true_val(tip_tail_width_size_159, w30_0_29_9); 0.07::true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159).
0.92::acc(sm, tip_tail_width_size_159).
measured(sm, tip_tail_width_size_159, w30_0_29_9).
all_consistent(tip_tail_width_size_159) :-
    (indep(sm), consistent(sm, tip_tail_width_size_159) ; \+indep(sm)).
evidence(all_consistent(tip_tail_width_size_159)).
query(true_val(tip_tail_width_size_159, w30_0_29_9)).
query(true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159)).

% @attr waist_width_159
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 159cm
% @values v25_9=25.9 unk_waist_width_159=Unknown
% @importance 0.90

0.93::true_val(waist_width_159, v25_9); 0.07::true_val(waist_width_159, unk_waist_width_159).
0.92::acc(sm, waist_width_159).
measured(sm, waist_width_159, v25_9).
all_consistent(waist_width_159) :-
    (indep(sm), consistent(sm, waist_width_159) ; \+indep(sm)).
evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v25_9)).
query(true_val(waist_width_159, unk_waist_width_159)).

% @attr stance_width_range_size_159
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size
% @values v55_9=55.9 unk_stance_width_range_size_159=Unknown
% @importance 0.90

0.93::true_val(stance_width_range_size_159, v55_9); 0.07::true_val(stance_width_range_size_159, unk_stance_width_range_size_159).
0.92::acc(sm, stance_width_range_size_159).
measured(sm, stance_width_range_size_159, v55_9).
all_consistent(stance_width_range_size_159) :-
    (indep(sm), consistent(sm, stance_width_range_size_159) ; \+indep(sm)).
evidence(all_consistent(stance_width_range_size_159)).
query(true_val(stance_width_range_size_159, v55_9)).
query(true_val(stance_width_range_size_159, unk_stance_width_range_size_159)).

% @attr recommended_weight_range_size_159
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values w63_90=63_90_kg unk_recommended_weight_range_size_159=Unknown
% @importance 0.90

0.93::true_val(recommended_weight_range_size_159, w63_90); 0.07::true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159).
0.92::acc(sm, recommended_weight_range_size_159).
measured(sm, recommended_weight_range_size_159, w63_90).
all_consistent(recommended_weight_range_size_159) :-
    (indep(sm), consistent(sm, recommended_weight_range_size_159) ; \+indep(sm)).
evidence(all_consistent(recommended_weight_range_size_159)).
query(true_val(recommended_weight_range_size_159, w63_90)).
query(true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159)).

% @attr effective_edge_162
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 162cm
% @values v1245=1245.0 unk_effective_edge_162=Unknown
% @importance 0.90

0.93::true_val(effective_edge_162, v1245); 0.07::true_val(effective_edge_162, unk_effective_edge_162).
0.92::acc(sm, effective_edge_162).
measured(sm, effective_edge_162, v1245).
all_consistent(effective_edge_162) :-
    (indep(sm), consistent(sm, effective_edge_162) ; \+indep(sm)).
evidence(all_consistent(effective_edge_162)).
query(true_val(effective_edge_162, v1245)).
query(true_val(effective_edge_162, unk_effective_edge_162)).

% @attr sidecut_radius_size_162
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values r8_6_8_2_8_0=8.6_8.2_8.0 unk_sidecut_radius_size_162=Unknown
% @importance 0.90

0.93::true_val(sidecut_radius_size_162, r8_6_8_2_8_0); 0.07::true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162).
0.92::acc(sm, sidecut_radius_size_162).
measured(sm, sidecut_radius_size_162, r8_6_8_2_8_0).
all_consistent(sidecut_radius_size_162) :-
    (indep(sm), consistent(sm, sidecut_radius_size_162) ; \+indep(sm)).
evidence(all_consistent(sidecut_radius_size_162)).
query(true_val(sidecut_radius_size_162, r8_6_8_2_8_0)).
query(true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162)).

% @attr tip_tail_width_size_162
% @type categorical
% @unit cm
% @canonical false
% @original_name tip_tail_width_size
% @values w30_4_30_2=30.4_30.2 unk_tip_tail_width_size_162=Unknown
% @importance 0.90

0.93::true_val(tip_tail_width_size_162, w30_4_30_2); 0.07::true_val(tip_tail_width_size_162, unk_tip_tail_width_size_162).
0.92::acc(sm, tip_tail_width_size_162).
measured(sm, tip_tail_width_size_162, w30_4_30_2).
all_consistent(tip_tail_width_size_162) :-
    (indep(sm), consistent(sm, tip_tail_width_size_162) ; \+indep(sm)).
evidence(all_consistent(tip_tail_width_size_162)).
query(true_val(tip_tail_width_size_162, w30_4_30_2)).
query(true_val(tip_tail_width_size_162, unk_tip_tail_width_size_162)).

% @attr waist_width_162
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 162cm
% @values v26_2=26.2 unk_waist_width_162=Unknown
% @importance 0.90

0.93::true_val(waist_width_162, v26_2); 0.07::true_val(waist_width_162, unk_waist_width_162).
0.92::acc(sm, waist_width_162).
measured(sm, waist_width_162, v26_2).
all_consistent(waist_width_162) :-
    (indep(sm), consistent(sm, waist_width_162) ; \+indep(sm)).
evidence(all_consistent(waist_width_162)).
query(true_val(waist_width_162, v26_2)).
query(true_val(waist_width_162, unk_waist_width_162)).

% @attr stance_width_range_size_162
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size
% @values v58_4=58.4 unk_stance_width_range_size_162=Unknown
% @importance 0.90

0.93::true_val(stance_width_range_size_162, v58_4); 0.07::true_val(stance_width_range_size_162, unk_stance_width_range_size_162).
0.92::acc(sm, stance_width_range_size_162).
measured(sm, stance_width_range_size_162, v58_4).
all_consistent(stance_width_range_size_162) :-
    (indep(sm), consistent(sm, stance_width_range_size_162) ; \+indep(sm)).
evidence(all_consistent(stance_width_range_size_162)).
query(true_val(stance_width_range_size_162, v58_4)).
query(true_val(stance_width_range_size_162, unk_stance_width_range_size_162)).

% @attr recommended_weight_range_size_162
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values w68_95plus=68_95plus_kg unk_recommended_weight_range_size_162=Unknown
% @importance 0.90

0.93::true_val(recommended_weight_range_size_162, w68_95plus); 0.07::true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162).
0.92::acc(sm, recommended_weight_range_size_162).
measured(sm, recommended_weight_range_size_162, w68_95plus).
all_consistent(recommended_weight_range_size_162) :-
    (indep(sm), consistent(sm, recommended_weight_range_size_162) ; \+indep(sm)).
evidence(all_consistent(recommended_weight_range_size_162)).
query(true_val(recommended_weight_range_size_162, w68_95plus)).
query(true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162)).

% @attr effective_edge_157w
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 157W
% @values v1205=1205.0 unk_effective_edge_157w=Unknown
% @importance 0.90

0.93::true_val(effective_edge_157w, v1205); 0.07::true_val(effective_edge_157w, unk_effective_edge_157w).
0.92::acc(sm, effective_edge_157w).
measured(sm, effective_edge_157w, v1205).
all_consistent(effective_edge_157w) :-
    (indep(sm), consistent(sm, effective_edge_157w) ; \+indep(sm)).
evidence(all_consistent(effective_edge_157w)).
query(true_val(effective_edge_157w, v1205)).
query(true_val(effective_edge_157w, unk_effective_edge_157w)).

% @attr sidecut_radius_size_157w
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values r8_2_7_8_7_7=8.2_7.8_7.7 unk_sidecut_radius_size_157w=Unknown
% @importance 0.90

0.93::true_val(sidecut_radius_size_157w, r8_2_7_8_7_7); 0.07::true_val(sidecut_radius_size_157w, unk_sidecut_radius_size_157w).
0.92::acc(sm, sidecut_radius_size_157w).
measured(sm, sidecut_radius_size_157w, r8_2_7_8_7_7).
all_consistent(sidecut_radius_size_157w) :-
    (indep(sm), consistent(sm, sidecut_radius_size_157w) ; \+indep(sm)).
evidence(all_consistent(sidecut_radius_size_157w)).
query(true_val(sidecut_radius_size_157w, r8_2_7_8_7_7)).
query(true_val(sidecut_radius_size_157w, unk_sidecut_radius_size_157w)).

% @attr tip_tail_width_size_157w
% @type categorical
% @unit cm
% @canonical false
% @original_name tip_tail_width_size
% @values w30_5_30_3=30.5_30.3 unk_tip_tail_width_size_157w=Unknown
% @importance 0.90

0.93::true_val(tip_tail_width_size_157w, w30_5_30_3); 0.07::true_val(tip_tail_width_size_157w, unk_tip_tail_width_size_157w).
0.92::acc(sm, tip_tail_width_size_157w).
measured(sm, tip_tail_width_size_157w, w30_5_30_3).
all_consistent(tip_tail_width_size_157w) :-
    (indep(sm), consistent(sm, tip_tail_width_size_157w) ; \+indep(sm)).
evidence(all_consistent(tip_tail_width_size_157w)).
query(true_val(tip_tail_width_size_157w, w30_5_30_3)).
query(true_val(tip_tail_width_size_157w, unk_tip_tail_width_size_157w)).

% @attr waist_width_157w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 157W
% @values v26_4=26.4 unk_waist_width_157w=Unknown
% @importance 0.90

0.93::true_val(waist_width_157w, v26_4); 0.07::true_val(waist_width_157w, unk_waist_width_157w).
0.92::acc(sm, waist_width_157w).
measured(sm, waist_width_157w, v26_4).
all_consistent(waist_width_157w) :-
    (indep(sm), consistent(sm, waist_width_157w) ; \+indep(sm)).
evidence(all_consistent(waist_width_157w)).
query(true_val(waist_width_157w, v26_4)).
query(true_val(waist_width_157w, unk_waist_width_157w)).

% @attr stance_width_range_size_157w
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size
% @values v55_9=55.9 unk_stance_width_range_size_157w=Unknown
% @importance 0.90

0.93::true_val(stance_width_range_size_157w, v55_9); 0.07::true_val(stance_width_range_size_157w, unk_stance_width_range_size_157w).
0.92::acc(sm, stance_width_range_size_157w).
measured(sm, stance_width_range_size_157w, v55_9).
all_consistent(stance_width_range_size_157w) :-
    (indep(sm), consistent(sm, stance_width_range_size_157w) ; \+indep(sm)).
evidence(all_consistent(stance_width_range_size_157w)).
query(true_val(stance_width_range_size_157w, v55_9)).
query(true_val(stance_width_range_size_157w, unk_stance_width_range_size_157w)).

% @attr recommended_weight_range_size_157w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values w63_90=63_90_kg unk_recommended_weight_range_size_157w=Unknown
% @importance 0.90

0.93::true_val(recommended_weight_range_size_157w, w63_90); 0.07::true_val(recommended_weight_range_size_157w, unk_recommended_weight_range_size_157w).
0.92::acc(sm, recommended_weight_range_size_157w).
measured(sm, recommended_weight_range_size_157w, w63_90).
all_consistent(recommended_weight_range_size_157w) :-
    (indep(sm), consistent(sm, recommended_weight_range_size_157w) ; \+indep(sm)).
evidence(all_consistent(recommended_weight_range_size_157w)).
query(true_val(recommended_weight_range_size_157w, w63_90)).
query(true_val(recommended_weight_range_size_157w, unk_recommended_weight_range_size_157w)).

% @attr effective_edge_161w
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 161W
% @values v1237=1237.0 unk_effective_edge_161w=Unknown
% @importance 0.90

0.93::true_val(effective_edge_161w, v1237); 0.07::true_val(effective_edge_161w, unk_effective_edge_161w).
0.92::acc(sm, effective_edge_161w).
measured(sm, effective_edge_161w, v1237).
all_consistent(effective_edge_161w) :-
    (indep(sm), consistent(sm, effective_edge_161w) ; \+indep(sm)).
evidence(all_consistent(effective_edge_161w)).
query(true_val(effective_edge_161w, v1237)).
query(true_val(effective_edge_161w, unk_effective_edge_161w)).

% @attr sidecut_radius_size_161w
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values r8_5_8_1_7_9=8.5_8.1_7.9 unk_sidecut_radius_size_161w=Unknown
% @importance 0.90

0.93::true_val(sidecut_radius_size_161w, r8_5_8_1_7_9); 0.07::true_val(sidecut_radius_size_161w, unk_sidecut_radius_size_161w).
0.92::acc(sm, sidecut_radius_size_161w).
measured(sm, sidecut_radius_size_161w, r8_5_8_1_7_9).
all_consistent(sidecut_radius_size_161w) :-
    (indep(sm), consistent(sm, sidecut_radius_size_161w) ; \+indep(sm)).
evidence(all_consistent(sidecut_radius_size_161w)).
query(true_val(sidecut_radius_size_161w, r8_5_8_1_7_9)).
query(true_val(sidecut_radius_size_161w, unk_sidecut_radius_size_161w)).

% @attr tip_tail_width_size_161w
% @type categorical
% @unit cm
% @canonical false
% @original_name tip_tail_width_size
% @values w30_9_30_8=30.9_30.8 unk_tip_tail_width_size_161w=Unknown
% @importance 0.90

0.93::true_val(tip_tail_width_size_161w, w30_9_30_8); 0.07::true_val(tip_tail_width_size_161w, unk_tip_tail_width_size_161w).
0.92::acc(sm, tip_tail_width_size_161w).
measured(sm, tip_tail_width_size_161w, w30_9_30_8).
all_consistent(tip_tail_width_size_161w) :-
    (indep(sm), consistent(sm, tip_tail_width_size_161w) ; \+indep(sm)).
evidence(all_consistent(tip_tail_width_size_161w)).
query(true_val(tip_tail_width_size_161w, w30_9_30_8)).
query(true_val(tip_tail_width_size_161w, unk_tip_tail_width_size_161w)).

% @attr waist_width_161w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 161W
% @values v26_7=26.7 unk_waist_width_161w=Unknown
% @importance 0.90

0.93::true_val(waist_width_161w, v26_7); 0.07::true_val(waist_width_161w, unk_waist_width_161w).
0.92::acc(sm, waist_width_161w).
measured(sm, waist_width_161w, v26_7).
all_consistent(waist_width_161w) :-
    (indep(sm), consistent(sm, waist_width_161w) ; \+indep(sm)).
evidence(all_consistent(waist_width_161w)).
query(true_val(waist_width_161w, v26_7)).
query(true_val(waist_width_161w, unk_waist_width_161w)).

% @attr stance_width_range_size_161w
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size
% @values v58_4=58.4 unk_stance_width_range_size_161w=Unknown
% @importance 0.90

0.93::true_val(stance_width_range_size_161w, v58_4); 0.07::true_val(stance_width_range_size_161w, unk_stance_width_range_size_161w).
0.92::acc(sm, stance_width_range_size_161w).
measured(sm, stance_width_range_size_161w, v58_4).
all_consistent(stance_width_range_size_161w) :-
    (indep(sm), consistent(sm, stance_width_range_size_161w) ; \+indep(sm)).
evidence(all_consistent(stance_width_range_size_161w)).
query(true_val(stance_width_range_size_161w, v58_4)).
query(true_val(stance_width_range_size_161w, unk_stance_width_range_size_161w)).

% @attr recommended_weight_range_size_161w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values w68_95=68_95_kg unk_recommended_weight_range_size_161w=Unknown
% @importance 0.90

0.93::true_val(recommended_weight_range_size_161w, w68_95); 0.07::true_val(recommended_weight_range_size_161w, unk_recommended_weight_range_size_161w).
0.92::acc(sm, recommended_weight_range_size_161w).
measured(sm, recommended_weight_range_size_161w, w68_95).
all_consistent(recommended_weight_range_size_161w) :-
    (indep(sm), consistent(sm, recommended_weight_range_size_161w) ; \+indep(sm)).
evidence(all_consistent(recommended_weight_range_size_161w)).
query(true_val(recommended_weight_range_size_161w, w68_95)).
query(true_val(recommended_weight_range_size_161w, unk_recommended_weight_range_size_161w)).

% @attr effective_edge_165
% @type numeric
% @unit mm
% @canonical true
% @original_name effective_edge_165
% @values v1269=1269.0 unk_effective_edge_165=Unknown
% @importance 0.90

0.93::true_val(effective_edge_165, v1269); 0.07::true_val(effective_edge_165, unk_effective_edge_165).
0.92::acc(sm, effective_edge_165).
measured(sm, effective_edge_165, v1269).
all_consistent(effective_edge_165) :-
    (indep(sm), consistent(sm, effective_edge_165) ; \+indep(sm)).
evidence(all_consistent(effective_edge_165)).
query(true_val(effective_edge_165, v1269)).
query(true_val(effective_edge_165, unk_effective_edge_165)).

% @attr sidecut_radius_165
% @type categorical
% @unit m
% @canonical true
% @original_name sidecut_radius_165
% @values r8_8_8_4_8_2=8.8_8.4_8.2 unk_sidecut_radius_165=Unknown
% @importance 0.90

0.93::true_val(sidecut_radius_165, r8_8_8_4_8_2); 0.07::true_val(sidecut_radius_165, unk_sidecut_radius_165).
0.92::acc(sm, sidecut_radius_165).
measured(sm, sidecut_radius_165, r8_8_8_4_8_2).
all_consistent(sidecut_radius_165) :-
    (indep(sm), consistent(sm, sidecut_radius_165) ; \+indep(sm)).
evidence(all_consistent(sidecut_radius_165)).
query(true_val(sidecut_radius_165, r8_8_8_4_8_2)).
query(true_val(sidecut_radius_165, unk_sidecut_radius_165)).

% @attr nose_tail_width_165
% @type categorical
% @unit cm
% @canonical true
% @original_name nose_tail_width_165
% @values w31_2_31_1=31.2_31.1 unk_nose_tail_width_165=Unknown
% @importance 0.90

0.93::true_val(nose_tail_width_165, w31_2_31_1); 0.07::true_val(nose_tail_width_165, unk_nose_tail_width_165).
0.92::acc(sm, nose_tail_width_165).
measured(sm, nose_tail_width_165, w31_2_31_1).
all_consistent(nose_tail_width_165) :-
    (indep(sm), consistent(sm, nose_tail_width_165) ; \+indep(sm)).
evidence(all_consistent(nose_tail_width_165)).
query(true_val(nose_tail_width_165, w31_2_31_1)).
query(true_val(nose_tail_width_165, unk_nose_tail_width_165)).

% @attr waist_width_165
% @type numeric
% @unit cm
% @canonical true
% @original_name waist_width_165
% @values v27_0=27.0 unk_waist_width_165=Unknown
% @importance 0.90

0.93::true_val(waist_width_165, v27_0); 0.07::true_val(waist_width_165, unk_waist_width_165).
0.92::acc(sm, waist_width_165).
measured(sm, waist_width_165, v27_0).
all_consistent(waist_width_165) :-
    (indep(sm), consistent(sm, waist_width_165) ; \+indep(sm)).
evidence(all_consistent(waist_width_165)).
query(true_val(waist_width_165, v27_0)).
query(true_val(waist_width_165, unk_waist_width_165)).

% @attr stance_width_range_size_165
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size
% @values v58_4=58.4 unk_stance_width_range_size_165=Unknown
% @importance 0.90

0.93::true_val(stance_width_range_size_165, v58_4); 0.07::true_val(stance_width_range_size_165, unk_stance_width_range_size_165).
0.92::acc(sm, stance_width_range_size_165).
measured(sm, stance_width_range_size_165, v58_4).
all_consistent(stance_width_range_size_165) :-
    (indep(sm), consistent(sm, stance_width_range_size_165) ; \+indep(sm)).
evidence(all_consistent(stance_width_range_size_165)).
query(true_val(stance_width_range_size_165, v58_4)).
query(true_val(stance_width_range_size_165, unk_stance_width_range_size_165)).

% @attr recommended_weight_165
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_165
% @values w72_99=72_99_kg unk_recommended_weight_165=Unknown
% @importance 0.90

0.93::true_val(recommended_weight_165, w72_99); 0.07::true_val(recommended_weight_165, unk_recommended_weight_165).
0.92::acc(sm, recommended_weight_165).
measured(sm, recommended_weight_165, w72_99).
all_consistent(recommended_weight_165) :-
    (indep(sm), consistent(sm, recommended_weight_165) ; \+indep(sm)).
evidence(all_consistent(recommended_weight_165)).
query(true_val(recommended_weight_165, w72_99)).
query(true_val(recommended_weight_165, unk_recommended_weight_165)).

% @attr edge_bevel_spec
% @type numeric
% @unit degree
% @canonical true
% @original_name edge_bevel_spec
% @values v1=1.0 unk_edge_bevel_spec=Unknown
% @importance 0.55

0.88::true_val(edge_bevel_spec, v1); 0.12::true_val(edge_bevel_spec, unk_edge_bevel_spec).
0.90::acc(s35, edge_bevel_spec).
measured(s35, edge_bevel_spec, v1).
all_consistent(edge_bevel_spec) :- consistent(s35, edge_bevel_spec).
evidence(all_consistent(edge_bevel_spec)).
query(true_val(edge_bevel_spec, v1)).
query(true_val(edge_bevel_spec, unk_edge_bevel_spec)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values am7_pow8_park3=AllMtn_7_Powder_8_Park_3 unk_terrain_suitability=Unknown
% @importance 0.85

0.82::true_val(terrain_suitability, am7_pow8_park3); 0.18::true_val(terrain_suitability, unk_terrain_suitability).
0.75::acc(s4, terrain_suitability).
measured(s4, terrain_suitability, am7_pow8_park3).
all_consistent(terrain_suitability) :-
    (indep(s4), consistent(s4, terrain_suitability) ; \+indep(s4)).
evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, am7_pow8_park3)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values advanced_expert=Advanced_to_Expert unk_rider_level=Unknown
% @importance 0.88

0.95::true_val(rider_level, advanced_expert); 0.05::true_val(rider_level, unk_rider_level).
0.90::acc(s1, rider_level).
0.78::acc(s4, rider_level).
measured(s1, rider_level, advanced_expert).
measured(s4, rider_level, advanced_expert).
all_consistent(rider_level) :-
    (indep(s1), consistent(s1, rider_level) ; \+indep(s1)),
    (indep(s4), consistent(s4, rider_level) ; \+indep(s4)).
evidence(all_consistent(rider_level)).
query(true_val(rider_level, advanced_expert)).
query(true_val(rider_level, unk_rider_level)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values aggressive_am_freeride=Aggressive_all_mountain_freeride_carving_powder unk_riding_style=Unknown
% @importance 0.90

0.93::true_val(riding_style, aggressive_am_freeride); 0.07::true_val(riding_style, unk_riding_style).
0.90::acc(s1, riding_style).
0.88::acc(s6, riding_style).
measured(s1, riding_style, aggressive_am_freeride).
measured(s6, riding_style, aggressive_am_freeride).
all_consistent(riding_style) :-
    (indep(s1), consistent(s1, riding_style) ; \+indep(s1)),
    (indep(s6), consistent(s6, riding_style) ; \+indep(s6)).
evidence(all_consistent(riding_style)).
query(true_val(riding_style, aggressive_am_freeride)).
query(true_val(riding_style, unk_riding_style)).

% @attr terrain_suitability_conditions
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values clean_pristine=Clean_pristine_groomed_and_powder unk_terrain_suitability_conditions=Unknown
% @importance 0.90

0.88::true_val(terrain_suitability_conditions, clean_pristine); 0.12::true_val(terrain_suitability_conditions, unk_terrain_suitability_conditions).
0.85::acc(s27, terrain_suitability_conditions).
0.85::acc(s36, terrain_suitability_conditions).
measured(s27, terrain_suitability_conditions, clean_pristine).
measured(s36, terrain_suitability_conditions, clean_pristine).
all_consistent(terrain_suitability_conditions) :-
    consistent(s27, terrain_suitability_conditions),
    consistent(s36, terrain_suitability_conditions).
evidence(all_consistent(terrain_suitability_conditions)).
query(true_val(terrain_suitability_conditions, clean_pristine)).
query(true_val(terrain_suitability_conditions, unk_terrain_suitability_conditions)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values not_park_not_beginner=Not_for_park_or_beginners_intermediates unk_negative_aspect=Unknown
% @importance 0.88

0.88::true_val(negative_aspect, not_park_not_beginner); 0.12::true_val(negative_aspect, unk_negative_aspect).
0.78::acc(s4, negative_aspect).
0.82::acc(s31, negative_aspect).
measured(s4, negative_aspect, not_park_not_beginner).
measured(s31, negative_aspect, not_park_not_beginner).
all_consistent(negative_aspect) :-
    (indep(s4), consistent(s4, negative_aspect) ; \+indep(s4)),
    consistent(s31, negative_aspect).
evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, not_park_not_beginner)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_stiffness
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values not_stiffest=Not_for_riders_wanting_stiffest_of_stiff unk_negative_aspect_stiffness=Unknown
% @importance 0.85

0.78::true_val(negative_aspect_stiffness, not_stiffest); 0.22::true_val(negative_aspect_stiffness, unk_negative_aspect_stiffness).
0.80::acc(s8, negative_aspect_stiffness).
measured(s8, negative_aspect_stiffness, not_stiffest).
all_consistent(negative_aspect_stiffness) :- consistent(s8, negative_aspect_stiffness).
evidence(all_consistent(negative_aspect_stiffness)).
query(true_val(negative_aspect_stiffness, not_stiffest)).
query(true_val(negative_aspect_stiffness, unk_negative_aspect_stiffness)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values exceptional=Fastest_board_best_base_in_snowboarding unk_base_glide_performance=Unknown
% @importance 0.85

0.90::true_val(base_glide_performance, exceptional); 0.10::true_val(base_glide_performance, unk_base_glide_performance).
0.85::acc(s30, base_glide_performance).
0.83::acc(s8, base_glide_performance).
measured(s30, base_glide_performance, exceptional).
measured(s8, base_glide_performance, exceptional).
all_consistent(base_glide_performance) :-
    consistent(s30, base_glide_performance),
    consistent(s8, base_glide_performance).
evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, exceptional)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr pop
% @type categorical
% @canonical true
% @original_name pop
% @values explosive=Explosive_pop_especially_tail_carbon_fiber unk_pop=Unknown
% @importance 0.88

0.88::true_val(pop, explosive); 0.12::true_val(pop, unk_pop).
0.85::acc(s30, pop).
0.85::acc(s31, pop).
measured(s30, pop, explosive).
measured(s31, pop, explosive).
all_consistent(pop) :-
    consistent(s30, pop),
    consistent(s31, pop).
evidence(all_consistent(pop)).
query(true_val(pop, explosive)).
query(true_val(pop, unk_pop)).

% @attr board_weight_grams
% @type categorical
% @canonical true
% @original_name board_weight_grams
% @values ultra_light=Ultra_light_silly_light unk_board_weight_grams=Unknown
% @importance 0.85

0.88::true_val(board_weight_grams, ultra_light); 0.12::true_val(board_weight_grams, unk_board_weight_grams).
0.82::acc(s30, board_weight_grams).
0.80::acc(s8, board_weight_grams).
measured(s30, board_weight_grams, ultra_light).
measured(s8, board_weight_grams, ultra_light).
all_consistent(board_weight_grams) :-
    consistent(s30, board_weight_grams),
    consistent(s8, board_weight_grams).
evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, ultra_light)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name reviewer_opinion_snowboardingprofiles
% @values bomber_no_shake=No_shake_at_speed_minimal_chatter_real_bomber unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.90

0.83::true_val(reviewer_opinion_snowboardingprofiles, bomber_no_shake); 0.17::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).
0.85::acc(s31, reviewer_opinion_snowboardingprofiles).
measured(s31, reviewer_opinion_snowboardingprofiles, bomber_no_shake).
all_consistent(reviewer_opinion_snowboardingprofiles) :- consistent(s31, reviewer_opinion_snowboardingprofiles).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, bomber_no_shake)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

% @attr chatter_performance
% @type categorical
% @canonical true
% @original_name chatter_performance
% @values good_not_great=Good_but_not_great_high_speed_stability unk_chatter_performance=Unknown
% @importance 0.85

0.80::true_val(chatter_performance, good_not_great); 0.20::true_val(chatter_performance, unk_chatter_performance).
0.82::acc(s8, chatter_performance).
measured(s8, chatter_performance, good_not_great).
all_consistent(chatter_performance) :- consistent(s8, chatter_performance).
evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, good_not_great)).
query(true_val(chatter_performance, unk_chatter_performance)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values bucks_bounces_not_allday=Bucks_bounces_too_much_not_good_all_day_ride unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.90

0.83::true_val(reviewer_opinion_the_good_ride, bucks_bounces_not_allday); 0.17::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).
0.85::acc(s36, reviewer_opinion_the_good_ride).
measured(s36, reviewer_opinion_the_good_ride, bucks_bounces_not_allday).
all_consistent(reviewer_opinion_the_good_ride) :- consistent(s36, reviewer_opinion_the_good_ride).
evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, bucks_bounces_not_allday)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values very_solid=Very_solid_edge_hold_in_ice unk_edge_hold=Unknown
% @importance 0.88

0.88::true_val(edge_hold, very_solid); 0.12::true_val(edge_hold, unk_edge_hold).
0.82::acc(s30, edge_hold).
0.85::acc(s31, edge_hold).
measured(s30, edge_hold, very_solid).
measured(s31, edge_hold, very_solid).
all_consistent(edge_hold) :-
    consistent(s30, edge_hold),
    consistent(s31, edge_hold).
evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, very_solid)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr carving_rating_tgr
% @type categorical
% @canonical true
% @original_name carving_rating_tgr
% @values excels=Excels_long_radius_high_speed_grip_doesnt_let_go unk_carving_rating_tgr=Unknown
% @importance 0.88

0.90::true_val(carving_rating_tgr, excels); 0.10::true_val(carving_rating_tgr, unk_carving_rating_tgr).
0.85::acc(s31, carving_rating_tgr).
0.83::acc(s37, carving_rating_tgr).
measured(s31, carving_rating_tgr, excels).
measured(s37, carving_rating_tgr, excels).
all_consistent(carving_rating_tgr) :-
    consistent(s31, carving_rating_tgr),
    consistent(s37, carving_rating_tgr).
evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, excels)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values smooth_easy=Smooth_easy_all_speeds difficult_torsional=Torsionally_stiff_difficult_not_agile_slow
% @importance 0.88

0.40::true_val(turn_initiation_performance, smooth_easy); 0.60::true_val(turn_initiation_performance, difficult_torsional).
0.80::acc(s30, turn_initiation_performance).
0.85::acc(s31, turn_initiation_performance).
measured(s30, turn_initiation_performance, smooth_easy).
measured(s31, turn_initiation_performance, difficult_torsional).
all_consistent(turn_initiation_performance) :-
    consistent(s30, turn_initiation_performance),
    consistent(s31, turn_initiation_performance).
evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, smooth_easy)).
query(true_val(turn_initiation_performance, difficult_torsional)).

% @attr powder_rating_tgr
% @type categorical
% @canonical true
% @original_name powder_rating_tgr
% @values good_float=Good_float_directional_rocker_nose_setback unk_powder_rating_tgr=Unknown
% @importance 0.90

0.83::true_val(powder_rating_tgr, good_float); 0.17::true_val(powder_rating_tgr, unk_powder_rating_tgr).
0.82::acc(s31, powder_rating_tgr).
measured(s31, powder_rating_tgr, good_float).
all_consistent(powder_rating_tgr) :- consistent(s31, powder_rating_tgr).
evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, good_float)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

% @attr reviewer_opinion_the_good_ride_soft_snow
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values bucks_soft_snow=Bucks_hard_in_soft_uneven_snow_lacks_dampness_vs_BSOD unk_reviewer_opinion_the_good_ride_soft_snow=Unknown
% @importance 0.90

0.85::true_val(reviewer_opinion_the_good_ride_soft_snow, bucks_soft_snow); 0.15::true_val(reviewer_opinion_the_good_ride_soft_snow, unk_reviewer_opinion_the_good_ride_soft_snow).
0.85::acc(s27, reviewer_opinion_the_good_ride_soft_snow).
0.85::acc(s36, reviewer_opinion_the_good_ride_soft_snow).
measured(s27, reviewer_opinion_the_good_ride_soft_snow, bucks_soft_snow).
measured(s36, reviewer_opinion_the_good_ride_soft_snow, bucks_soft_snow).
all_consistent(reviewer_opinion_the_good_ride_soft_snow) :-
    consistent(s27, reviewer_opinion_the_good_ride_soft_snow),
    consistent(s36, reviewer_opinion_the_good_ride_soft_snow).
evidence(all_consistent(reviewer_opinion_the_good_ride_soft_snow)).
query(true_val(reviewer_opinion_the_good_ride_soft_snow, bucks_soft_snow)).
query(true_val(reviewer_opinion_the_good_ride_soft_snow, unk_reviewer_opinion_the_good_ride_soft_snow)).

% @attr negative_aspect_catchiness
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values some_catchiness=Some_catchiness_demands_deliberate_energy_technique unk_negative_aspect_catchiness=Unknown
% @importance 0.90

0.83::true_val(negative_aspect_catchiness, some_catchiness); 0.17::true_val(negative_aspect_catchiness, unk_negative_aspect_catchiness).
0.82::acc(s31, negative_aspect_catchiness).
measured(s31, negative_aspect_catchiness, some_catchiness).
all_consistent(negative_aspect_catchiness) :- consistent(s31, negative_aspect_catchiness).
evidence(all_consistent(negative_aspect_catchiness)).
query(true_val(negative_aspect_catchiness, some_catchiness)).
query(true_val(negative_aspect_catchiness, unk_negative_aspect_catchiness)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values one_board_quiver=Could_be_one_board_quiver_for_right_rider unk_positive_aspect=Unknown
% @importance 0.75

0.80::true_val(positive_aspect, one_board_quiver); 0.20::true_val(positive_aspect, unk_positive_aspect).
0.78::acc(s38, positive_aspect).
measured(s38, positive_aspect, one_board_quiver).
all_consistent(positive_aspect) :- consistent(s38, positive_aspect).
evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, one_board_quiver)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr reviewer_opinion_snowboardingprofiles_dampness
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles
% @values surprisingly_damp=Surprisingly_damp_for_weight unk_reviewer_opinion_snowboardingprofiles_dampness=Unknown
% @importance 0.90

0.83::true_val(reviewer_opinion_snowboardingprofiles_dampness, surprisingly_damp); 0.17::true_val(reviewer_opinion_snowboardingprofiles_dampness, unk_reviewer_opinion_snowboardingprofiles_dampness).
0.82::acc(s31, reviewer_opinion_snowboardingprofiles_dampness).
measured(s31, reviewer_opinion_snowboardingprofiles_dampness, surprisingly_damp).
all_consistent(reviewer_opinion_snowboardingprofiles_dampness) :- consistent(s31, reviewer_opinion_snowboardingprofiles_dampness).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles_dampness)).
query(true_val(reviewer_opinion_snowboardingprofiles_dampness, surprisingly_damp)).
query(true_val(reviewer_opinion_snowboardingprofiles_dampness, unk_reviewer_opinion_snowboardingprofiles_dampness)).

% @attr reviewer_opinion_the_good_ride_dampness
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values less_damp_bsod=Less_damp_than_BSOD_bucky_soft_conditions unk_reviewer_opinion_the_good_ride_dampness=Unknown
% @importance 0.90

0.85::true_val(reviewer_opinion_the_good_ride_dampness, less_damp_bsod); 0.15::true_val(reviewer_opinion_the_good_ride_dampness, unk_reviewer_opinion_the_good_ride_dampness).
0.85::acc(s27, reviewer_opinion_the_good_ride_dampness).
0.85::acc(s36, reviewer_opinion_the_good_ride_dampness).
measured(s27, reviewer_opinion_the_good_ride_dampness, less_damp_bsod).
measured(s36, reviewer_opinion_the_good_ride_dampness, less_damp_bsod).
all_consistent(reviewer_opinion_the_good_ride_dampness) :-
    consistent(s27, reviewer_opinion_the_good_ride_dampness),
    consistent(s36, reviewer_opinion_the_good_ride_dampness).
evidence(all_consistent(reviewer_opinion_the_good_ride_dampness)).
query(true_val(reviewer_opinion_the_good_ride_dampness, less_damp_bsod)).
query(true_val(reviewer_opinion_the_good_ride_dampness, unk_reviewer_opinion_the_good_ride_dampness)).

% @attr positive_aspect_build_quality
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values built_diffo=Built_diffo_immediately_noticeable_quality unk_positive_aspect_build_quality=Unknown
% @importance 0.85

0.80::true_val(positive_aspect_build_quality, built_diffo); 0.20::true_val(positive_aspect_build_quality, unk_positive_aspect_build_quality).
0.80::acc(s8, positive_aspect_build_quality).
measured(s8, positive_aspect_build_quality, built_diffo).
all_consistent(positive_aspect_build_quality) :- consistent(s8, positive_aspect_build_quality).
evidence(all_consistent(positive_aspect_build_quality)).
query(true_val(positive_aspect_build_quality, built_diffo)).
query(true_val(positive_aspect_build_quality, unk_positive_aspect_build_quality)).

% @attr negative_aspect_technique
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values demands_technique=Demands_aggressive_riding_good_technique unk_negative_aspect_technique=Unknown
% @importance 0.88

0.85::true_val(negative_aspect_technique, demands_technique); 0.15::true_val(negative_aspect_technique, unk_negative_aspect_technique).
0.82::acc(s31, negative_aspect_technique).
0.80::acc(s30, negative_aspect_technique).
measured(s31, negative_aspect_technique, demands_technique).
measured(s30, negative_aspect_technique, demands_technique).
all_consistent(negative_aspect_technique) :-
    consistent(s31, negative_aspect_technique),
    consistent(s30, negative_aspect_technique).
evidence(all_consistent(negative_aspect_technique)).
query(true_val(negative_aspect_technique, demands_technique)).
query(true_val(negative_aspect_technique, unk_negative_aspect_technique)).

% @attr comparable_board_same_brand_bsod_construction
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values same_shape_heavier_damper=Same_shape_more_standard_construction_heavier_damper unk_comparable_board_same_brand_bsod_construction=Unknown
% @importance 0.90

0.85::true_val(comparable_board_same_brand_bsod_construction, same_shape_heavier_damper); 0.15::true_val(comparable_board_same_brand_bsod_construction, unk_comparable_board_same_brand_bsod_construction).
0.85::acc(s27, comparable_board_same_brand_bsod_construction).
0.85::acc(s36, comparable_board_same_brand_bsod_construction).
measured(s27, comparable_board_same_brand_bsod_construction, same_shape_heavier_damper).
measured(s36, comparable_board_same_brand_bsod_construction, same_shape_heavier_damper).
all_consistent(comparable_board_same_brand_bsod_construction) :-
    consistent(s27, comparable_board_same_brand_bsod_construction),
    consistent(s36, comparable_board_same_brand_bsod_construction).
evidence(all_consistent(comparable_board_same_brand_bsod_construction)).
query(true_val(comparable_board_same_brand_bsod_construction, same_shape_heavier_damper)).
query(true_val(comparable_board_same_brand_bsod_construction, unk_comparable_board_same_brand_bsod_construction)).

% @attr comparable_board_same_brand_bsod_allday
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values bsod_much_better_allday=BSOD_much_better_choose_for_all_day unk_comparable_board_same_brand_bsod_allday=Unknown
% @importance 0.90

0.83::true_val(comparable_board_same_brand_bsod_allday, bsod_much_better_allday); 0.17::true_val(comparable_board_same_brand_bsod_allday, unk_comparable_board_same_brand_bsod_allday).
0.85::acc(s36, comparable_board_same_brand_bsod_allday).
measured(s36, comparable_board_same_brand_bsod_allday, bsod_much_better_allday).
all_consistent(comparable_board_same_brand_bsod_allday) :- consistent(s36, comparable_board_same_brand_bsod_allday).
evidence(all_consistent(comparable_board_same_brand_bsod_allday)).
query(true_val(comparable_board_same_brand_bsod_allday, bsod_much_better_allday)).
query(true_val(comparable_board_same_brand_bsod_allday, unk_comparable_board_same_brand_bsod_allday)).

% @attr comparable_board_same_brand_bsod_stability
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values mega_death_more_stable=Mega_Death_more_stable_at_speed_more_bulletproof unk_comparable_board_same_brand_bsod_stability=Unknown
% @importance 0.80

0.80::true_val(comparable_board_same_brand_bsod_stability, mega_death_more_stable); 0.20::true_val(comparable_board_same_brand_bsod_stability, unk_comparable_board_same_brand_bsod_stability).
0.78::acc(s39, comparable_board_same_brand_bsod_stability).
measured(s39, comparable_board_same_brand_bsod_stability, mega_death_more_stable).
all_consistent(comparable_board_same_brand_bsod_stability) :- consistent(s39, comparable_board_same_brand_bsod_stability).
evidence(all_consistent(comparable_board_same_brand_bsod_stability)).
query(true_val(comparable_board_same_brand_bsod_stability, mega_death_more_stable)).
query(true_val(comparable_board_same_brand_bsod_stability, unk_comparable_board_same_brand_bsod_stability)).

% @attr comparable_board_same_brand_bsod_price
% @type categorical
% @unit USD
% @canonical false
% @original_name comparable_board_same_brand
% @values bsod_749_95_sale_599_96=BSOD_749_95_MSRP_599_96_sale unk_comparable_board_same_brand_bsod_price=Unknown
% @importance 0.95

0.90::true_val(comparable_board_same_brand_bsod_price, bsod_749_95_sale_599_96); 0.10::true_val(comparable_board_same_brand_bsod_price, unk_comparable_board_same_brand_bsod_price).
0.90::acc(s16, comparable_board_same_brand_bsod_price).
measured(s16, comparable_board_same_brand_bsod_price, bsod_749_95_sale_599_96).
all_consistent(comparable_board_same_brand_bsod_price) :- consistent(s16, comparable_board_same_brand_bsod_price).
evidence(all_consistent(comparable_board_same_brand_bsod_price)).
query(true_val(comparable_board_same_brand_bsod_price, bsod_749_95_sale_599_96)).
query(true_val(comparable_board_same_brand_bsod_price, unk_comparable_board_same_brand_bsod_price)).

% @attr comparable_board_same_brand_mega_merc_core
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values same_core_am_freestyle=Same_Thermopolymer_Starship_core_more_AM_freestyle unk_comparable_board_same_brand_mega_merc_core=Unknown
% @importance 0.85

0.80::true_val(comparable_board_same_brand_mega_merc_core, same_core_am_freestyle); 0.20::true_val(comparable_board_same_brand_mega_merc_core, unk_comparable_board_same_brand_mega_merc_core).
0.80::acc(s30, comparable_board_same_brand_mega_merc_core).
measured(s30, comparable_board_same_brand_mega_merc_core, same_core_am_freestyle).
all_consistent(comparable_board_same_brand_mega_merc_core) :- consistent(s30, comparable_board_same_brand_mega_merc_core).
evidence(all_consistent(comparable_board_same_brand_mega_merc_core)).
query(true_val(comparable_board_same_brand_mega_merc_core, same_core_am_freestyle)).
query(true_val(comparable_board_same_brand_mega_merc_core, unk_comparable_board_same_brand_mega_merc_core)).

% @attr comparable_board_same_brand_mega_merc_price
% @type categorical
% @unit USD
% @canonical false
% @original_name comparable_board_same_brand
% @values mega_merc_949_95=Mega_Mercury_949_95_MSRP unk_comparable_board_same_brand_mega_merc_price=Unknown
% @importance 0.95

0.90::true_val(comparable_board_same_brand_mega_merc_price, mega_merc_949_95); 0.10::true_val(comparable_board_same_brand_mega_merc_price, unk_comparable_board_same_brand_mega_merc_price).
0.90::acc(s16, comparable_board_same_brand_mega_merc_price).
measured(s16, comparable_board_same_brand_mega_merc_price, mega_merc_949_95).
all_consistent(comparable_board_same_brand_mega_merc_price) :- consistent(s16, comparable_board_same_brand_mega_merc_price).
evidence(all_consistent(comparable_board_same_brand_mega_merc_price)).
query(true_val(comparable_board_same_brand_mega_merc_price, mega_merc_949_95)).
query(true_val(comparable_board_same_brand_mega_merc_price, unk_comparable_board_same_brand_mega_merc_price)).

% @attr comparable_board_same_brand_lower_tier
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values lower_tier_premium=Lower_tier_premium_option_in_CAPiTA_line unk_comparable_board_same_brand_lower_tier=Unknown
% @importance 0.95

0.88::true_val(comparable_board_same_brand_lower_tier, lower_tier_premium); 0.12::true_val(comparable_board_same_brand_lower_tier, unk_comparable_board_same_brand_lower_tier).
0.88::acc(s16, comparable_board_same_brand_lower_tier).
measured(s16, comparable_board_same_brand_lower_tier, lower_tier_premium).
all_consistent(comparable_board_same_brand_lower_tier) :- consistent(s16, comparable_board_same_brand_lower_tier).
evidence(all_consistent(comparable_board_same_brand_lower_tier)).
query(true_val(comparable_board_same_brand_lower_tier, lower_tier_premium)).
query(true_val(comparable_board_same_brand_lower_tier, unk_comparable_board_same_brand_lower_tier)).

% @attr comparable_board_same_brand_bsod_recommendation
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values downgrade_to_bsod=Small_downgrade_to_BSOD_makes_most_sense unk_comparable_board_same_brand_bsod_recommendation=Unknown
% @importance 0.85

0.80::true_val(comparable_board_same_brand_bsod_recommendation, downgrade_to_bsod); 0.20::true_val(comparable_board_same_brand_bsod_recommendation, unk_comparable_board_same_brand_bsod_recommendation).
0.78::acc(s30, comparable_board_same_brand_bsod_recommendation).
measured(s30, comparable_board_same_brand_bsod_recommendation, downgrade_to_bsod).
all_consistent(comparable_board_same_brand_bsod_recommendation) :- consistent(s30, comparable_board_same_brand_bsod_recommendation).
evidence(all_consistent(comparable_board_same_brand_bsod_recommendation)).
query(true_val(comparable_board_same_brand_bsod_recommendation, downgrade_to_bsod)).
query(true_val(comparable_board_same_brand_bsod_recommendation, unk_comparable_board_same_brand_bsod_recommendation)).

% @attr comparable_board_same_brand_bsod_sizes
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values bsod_169w_274mm=BSOD_up_to_169W_waist_274mm_more_sizes unk_comparable_board_same_brand_bsod_sizes=Unknown
% @importance 0.65

0.80::true_val(comparable_board_same_brand_bsod_sizes, bsod_169w_274mm); 0.20::true_val(comparable_board_same_brand_bsod_sizes, unk_comparable_board_same_brand_bsod_sizes).
0.80::acc(s40, comparable_board_same_brand_bsod_sizes).
measured(s40, comparable_board_same_brand_bsod_sizes, bsod_169w_274mm).
all_consistent(comparable_board_same_brand_bsod_sizes) :- consistent(s40, comparable_board_same_brand_bsod_sizes).
evidence(all_consistent(comparable_board_same_brand_bsod_sizes)).
query(true_val(comparable_board_same_brand_bsod_sizes, bsod_169w_274mm)).
query(true_val(comparable_board_same_brand_bsod_sizes, unk_comparable_board_same_brand_bsod_sizes)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values bsod_better_value=BSOD_better_freeride_doesnt_fit_lineup_for_price unk_user_review_forum=Unknown
% @importance 0.80

0.72::true_val(user_review_forum, bsod_better_value); 0.28::true_val(user_review_forum, unk_user_review_forum).
0.65::acc(s41, user_review_forum).
measured(s41, user_review_forum, bsod_better_value).
all_consistent(user_review_forum) :- consistent(s41, user_review_forum).
evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, bsod_better_value)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr user_review_forum_positive
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values badass_home_run=Board_is_so_badass_home_run unk_user_review_forum_positive=Unknown
% @importance 0.60

0.65::true_val(user_review_forum_positive, badass_home_run); 0.35::true_val(user_review_forum_positive, unk_user_review_forum_positive).
0.60::acc(s42, user_review_forum_positive).
measured(s42, user_review_forum_positive, badass_home_run).
all_consistent(user_review_forum_positive) :- consistent(s42, user_review_forum_positive).
evidence(all_consistent(user_review_forum_positive)).
query(true_val(user_review_forum_positive, badass_home_run)).
query(true_val(user_review_forum_positive, unk_user_review_forum_positive)).

% @attr warranty_period_years
% @type numeric
% @unit years
% @canonical true
% @original_name warranty_period_years
% @values v2=2.0 unk_warranty_period_years=Unknown
% @importance 0.78

0.96::true_val(warranty_period_years, v2); 0.04::true_val(warranty_period_years, unk_warranty_period_years).
0.95::acc(s43, warranty_period_years).
0.85::acc(s44, warranty_period_years).
measured(s43, warranty_period_years, v2).
measured(s44, warranty_period_years, v2).
all_consistent(warranty_period_years) :-
    consistent(s43, warranty_period_years),
    (indep(s44), consistent(s44, warranty_period_years) ; \+indep(s44)).
evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v2)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values delam_cracking_inserts=Topsheet_base_sidewall_delam_cracking_misaligned_inserts unk_warranty=Unknown
% @importance 0.80

0.92::true_val(warranty, delam_cracking_inserts); 0.08::true_val(warranty, unk_warranty).
0.93::acc(s43, warranty).
measured(s43, warranty, delam_cracking_inserts).
all_consistent(warranty) :- consistent(s43, warranty).
evidence(all_consistent(warranty)).
query(true_val(warranty, delam_cracking_inserts)).
query(true_val(warranty, unk_warranty)).

% @attr warranty_exclusions
% @type categorical
% @canonical false
% @original_name warranty
% @values impact_wear_secondhand=Impact_damage_wear_tear_secondhand_not_covered unk_warranty_exclusions=Unknown
% @importance 0.78

0.92::true_val(warranty_exclusions, impact_wear_secondhand); 0.08::true_val(warranty_exclusions, unk_warranty_exclusions).
0.93::acc(s43, warranty_exclusions).
0.85::acc(s44, warranty_exclusions).
measured(s43, warranty_exclusions, impact_wear_secondhand).
measured(s44, warranty_exclusions, impact_wear_secondhand).
all_consistent(warranty_exclusions) :-
    consistent(s43, warranty_exclusions),
    (indep(s44), consistent(s44, warranty_exclusions) ; \+indep(s44)).
evidence(all_consistent(warranty_exclusions)).
query(true_val(warranty_exclusions, impact_wear_secondhand)).
query(true_val(warranty_exclusions, unk_warranty_exclusions)).

% @attr warranty_process
% @type categorical
% @canonical false
% @original_name warranty
% @values nfc_scan_register_online=Scan_NFC_register_submit_online_2_3_days unk_warranty_process=Unknown
% @importance 0.80

0.92::true_val(warranty_process, nfc_scan_register_online); 0.08::true_val(warranty_process, unk_warranty_process).
0.93::acc(s43, warranty_process).
measured(s43, warranty_process, nfc_scan_register_online).
all_consistent(warranty_process) :- consistent(s43, warranty_process).
evidence(all_consistent(warranty_process)).
query(true_val(warranty_process, nfc_scan_register_online)).
query(true_val(warranty_process, unk_warranty_process)).

% @attr warranty_contact_au
% @type categorical
% @canonical false
% @original_name warranty
% @values principle_distribution=Principle_Distribution_AU unk_warranty_contact_au=Unknown
% @importance 0.55

0.90::true_val(warranty_contact_au, principle_distribution); 0.10::true_val(warranty_contact_au, unk_warranty_contact_au).
0.92::acc(s45, warranty_contact_au).
measured(s45, warranty_contact_au, principle_distribution).
all_consistent(warranty_contact_au) :- consistent(s45, warranty_contact_au).
evidence(all_consistent(warranty_contact_au)).
query(true_val(warranty_contact_au, principle_distribution)).
query(true_val(warranty_contact_au, unk_warranty_contact_au)).

% @attr warranty_contact_us
% @type categorical
% @canonical false
% @original_name warranty
% @values c3_worldwide=C3_Worldwide_US unk_warranty_contact_us=Unknown
% @importance 0.55

0.90::true_val(warranty_contact_us, c3_worldwide); 0.10::true_val(warranty_contact_us, unk_warranty_contact_us).
0.92::acc(s45, warranty_contact_us).
measured(s45, warranty_contact_us, c3_worldwide).
all_consistent(warranty_contact_us) :- consistent(s45, warranty_contact_us).
evidence(all_consistent(warranty_contact_us)).
query(true_val(warranty_contact_us, c3_worldwide)).
query(true_val(warranty_contact_us, unk_warranty_contact_us)).

% @attr user_review_forum_warranty
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values mixed_delam_epoxy=Mixed_reports_delamination_told_marine_epoxy unk_user_review_forum_warranty=Unknown
% @importance 0.70

0.60::true_val(user_review_forum_warranty, mixed_delam_epoxy); 0.40::true_val(user_review_forum_warranty, unk_user_review_forum_warranty).
0.55::acc(s46, user_review_forum_warranty).
measured(s46, user_review_forum_warranty, mixed_delam_epoxy).
all_consistent(user_review_forum_warranty) :- consistent(s46, user_review_forum_warranty).
evidence(all_consistent(user_review_forum_warranty)).
query(true_val(user_review_forum_warranty, mixed_delam_epoxy)).
query(true_val(user_review_forum_warranty, unk_user_review_forum_warranty)).

% @attr sustainability_certification_recycled
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values recycled_thermopolymer=Post_consumer_recycled_thermopolymer_channels unk_sustainability_certification_recycled=Unknown
% @importance 0.95

0.92::true_val(sustainability_certification_recycled, recycled_thermopolymer); 0.08::true_val(sustainability_certification_recycled, unk_sustainability_certification_recycled).
0.94::acc(s2, sustainability_certification_recycled).
0.88::acc(s6, sustainability_certification_recycled).
measured(s2, sustainability_certification_recycled, recycled_thermopolymer).
measured(s6, sustainability_certification_recycled, recycled_thermopolymer).
all_consistent(sustainability_certification_recycled) :-
    consistent(s2, sustainability_certification_recycled),
    (indep(s6), consistent(s6, sustainability_certification_recycled) ; \+indep(s6)).
evidence(all_consistent(sustainability_certification_recycled)).
query(true_val(sustainability_certification_recycled, recycled_thermopolymer)).
query(true_val(sustainability_certification_recycled, unk_sustainability_certification_recycled)).

% @attr sustainability_certification_resin
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values magic_bean_60pct=Magic_Bean_Resin_60pct_renewable_no_emissions unk_sustainability_certification_resin=Unknown
% @importance 0.75

0.90::true_val(sustainability_certification_resin, magic_bean_60pct); 0.10::true_val(sustainability_certification_resin, unk_sustainability_certification_resin).
0.88::acc(s33, sustainability_certification_resin).
0.90::acc(s1, sustainability_certification_resin).
measured(s33, sustainability_certification_resin, magic_bean_60pct).
measured(s1, sustainability_certification_resin, magic_bean_60pct).
all_consistent(sustainability_certification_resin) :-
    (indep(s33), consistent(s33, sustainability_certification_resin) ; \+indep(s33)),
    (indep(s1), consistent(s1, sustainability_certification_resin) ; \+indep(s1)).
evidence(all_consistent(sustainability_certification_resin)).
query(true_val(sustainability_certification_resin, magic_bean_60pct)).
query(true_val(sustainability_certification_resin, unk_sustainability_certification_resin)).

% @attr sustainability_certification_ink
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values solventless_uv=Solventless_water_based_UV_ink unk_sustainability_certification_ink=Unknown
% @importance 0.85

0.90::true_val(sustainability_certification_ink, solventless_uv); 0.10::true_val(sustainability_certification_ink, unk_sustainability_certification_ink).
0.90::acc(sm, sustainability_certification_ink).
0.85::acc(s5, sustainability_certification_ink).
measured(sm, sustainability_certification_ink, solventless_uv).
measured(s5, sustainability_certification_ink, solventless_uv).
all_consistent(sustainability_certification_ink) :-
    (indep(sm), consistent(sm, sustainability_certification_ink) ; \+indep(sm)),
    (indep(s5), consistent(s5, sustainability_certification_ink) ; \+indep(s5)).
evidence(all_consistent(sustainability_certification_ink)).
query(true_val(sustainability_certification_ink, solventless_uv)).
query(true_val(sustainability_certification_ink, unk_sustainability_certification_ink)).

% @attr sustainability_certification_die_cut
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values die_cut_minimize_waste=Die_cut_base_minimize_waste_two_colors_per_size unk_sustainability_certification_die_cut=Unknown
% @importance 1.0

0.92::true_val(sustainability_certification_die_cut, die_cut_minimize_waste); 0.08::true_val(sustainability_certification_die_cut, unk_sustainability_certification_die_cut).
0.92::acc(s2, sustainability_certification_die_cut).
measured(s2, sustainability_certification_die_cut, die_cut_minimize_waste).
all_consistent(sustainability_certification_die_cut) :- consistent(s2, sustainability_certification_die_cut).
evidence(all_consistent(sustainability_certification_die_cut)).
query(true_val(sustainability_certification_die_cut, die_cut_minimize_waste)).
query(true_val(sustainability_certification_die_cut, unk_sustainability_certification_die_cut)).

% @attr recommended_boot_size_156
% @type categorical
% @unit US
% @canonical false
% @original_name Recommended boot size 156
% @values us_8_9=US_8_9 unk_recommended_boot_size_156=Unknown
% @importance 0.90

0.88::true_val(recommended_boot_size_156, us_8_9); 0.12::true_val(recommended_boot_size_156, unk_recommended_boot_size_156).
0.85::acc(s27, recommended_boot_size_156).
measured(s27, recommended_boot_size_156, us_8_9).
all_consistent(recommended_boot_size_156) :- consistent(s27, recommended_boot_size_156).
evidence(all_consistent(recommended_boot_size_156)).
query(true_val(recommended_boot_size_156, us_8_9)).
query(true_val(recommended_boot_size_156, unk_recommended_boot_size_156)).

% @attr recommended_boot_size_159
% @type categorical
% @unit US
% @canonical false
% @original_name Recommended boot size 159
% @values us_9_10=US_9_10 unk_recommended_boot_size_159=Unknown
% @importance 0.90

0.88::true_val(recommended_boot_size_159, us_9_10); 0.12::true_val(recommended_boot_size_159, unk_recommended_boot_size_159).
0.85::acc(s27, recommended_boot_size_159).
measured(s27, recommended_boot_size_159, us_9_10).
all_consistent(recommended_boot_size_159) :- consistent(s27, recommended_boot_size_159).
evidence(all_consistent(recommended_boot_size_159)).
query(true_val(recommended_boot_size_159, us_9_10)).
query(true_val(recommended_boot_size_159, unk_recommended_boot_size_159)).

% @attr recommended_boot_size_162
% @type categorical
% @unit US
% @canonical false
% @original_name Recommended boot size 162
% @values us_9_5_10_5=US_9_5_10_5 unk_recommended_boot_size_162=Unknown
% @importance 0.90

0.88::true_val(recommended_boot_size_162, us_9_5_10_5); 0.12::true_val(recommended_boot_size_162, unk_recommended_boot_size_162).
0.85::acc(s27, recommended_boot_size_162).
measured(s27, recommended_boot_size_162, us_9_5_10_5).
all_consistent(recommended_boot_size_162) :- consistent(s27, recommended_boot_size_162).
evidence(all_consistent(recommended_boot_size_162)).
query(true_val(recommended_boot_size_162, us_9_5_10_5)).
query(true_val(recommended_boot_size_162, unk_recommended_boot_size_162)).

% @attr recommended_boot_size_157w
% @type categorical
% @unit US
% @canonical false
% @original_name Recommended boot size 157W
% @values us_10_5_11_5=US_10_5_11_5 unk_recommended_boot_size_157w=Unknown
% @importance 0.90

0.88::true_val(recommended_boot_size_157w, us_10_5_11_5); 0.12::true_val(recommended_boot_size_157w, unk_recommended_boot_size_157w).
0.85::acc(s27, recommended_boot_size_157w).
measured(s27, recommended_boot_size_157w, us_10_5_11_5).
all_consistent(recommended_boot_size_157w) :- consistent(s27, recommended_boot_size_157w).
evidence(all_consistent(recommended_boot_size_157w)).
query(true_val(recommended_boot_size_157w, us_10_5_11_5)).
query(true_val(recommended_boot_size_157w, unk_recommended_boot_size_157w)).

% @attr recommended_boot_size_161w
% @type categorical
% @unit US
% @canonical false
% @original_name Recommended boot size 161W
% @values us_11_12=US_11_12 unk_recommended_boot_size_161w=Unknown
% @importance 0.90

0.88::true_val(recommended_boot_size_161w, us_11_12); 0.12::true_val(recommended_boot_size_161w, unk_recommended_boot_size_161w).
0.85::acc(s27, recommended_boot_size_161w).
measured(s27, recommended_boot_size_161w, us_11_12).
all_consistent(recommended_boot_size_161w) :- consistent(s27, recommended_boot_size_161w).
evidence(all_consistent(recommended_boot_size_161w)).
query(true_val(recommended_boot_size_161w, us_11_12)).
query(true_val(recommended_boot_size_161w, unk_recommended_boot_size_161w)).

% @attr death_grip_waist_sizing_note
% @type categorical
% @canonical false
% @original_name Death Grip waist sizing note
% @values subtract_3mm=Subtract_3mm_from_waist_width_for_sizing unk_death_grip_waist_sizing_note=Unknown
% @importance 0.90

0.88::true_val(death_grip_waist_sizing_note, subtract_3mm); 0.12::true_val(death_grip_waist_sizing_note, unk_death_grip_waist_sizing_note).
0.85::acc(s27, death_grip_waist_sizing_note).
measured(s27, death_grip_waist_sizing_note, subtract_3mm).
all_consistent(death_grip_waist_sizing_note) :- consistent(s27, death_grip_waist_sizing_note).
evidence(all_consistent(death_grip_waist_sizing_note)).
query(true_val(death_grip_waist_sizing_note, subtract_3mm)).
query(true_val(death_grip_waist_sizing_note, unk_death_grip_waist_sizing_note)).

% @attr recommended_weight_range_size_note
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values stay_lower_end=Stay_lower_end_ultra_light_not_good_heavy_riders unk_recommended_weight_range_size_note=Unknown
% @importance 0.90

0.85::true_val(recommended_weight_range_size_note, stay_lower_end); 0.15::true_val(recommended_weight_range_size_note, unk_recommended_weight_range_size_note).
0.82::acc(s27, recommended_weight_range_size_note).
measured(s27, recommended_weight_range_size_note, stay_lower_end).
all_consistent(recommended_weight_range_size_note) :- consistent(s27, recommended_weight_range_size_note).
evidence(all_consistent(recommended_weight_range_size_note)).
query(true_val(recommended_weight_range_size_note, stay_lower_end)).
query(true_val(recommended_weight_range_size_note, unk_recommended_weight_range_size_note)).

% @attr redesign_year
% @type categorical
% @canonical true
% @original_name redesign_year
% @values graphics_only=Graphics_update_only_no_spec_changes unk_redesign_year=Unknown
% @importance 0.90

0.85::true_val(redesign_year, graphics_only); 0.15::true_val(redesign_year, unk_redesign_year).
0.82::acc(s1, redesign_year).
measured(s1, redesign_year, graphics_only).
all_consistent(redesign_year) :-
    (indep(s1), consistent(s1, redesign_year) ; \+indep(s1)).
evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, graphics_only)).
query(true_val(redesign_year, unk_redesign_year)).

% @attr return_policy_terms
% @type categorical
% @canonical true
% @original_name return_policy_terms
% @values evo_price_match_1yr=Major_US_retailer_price_match_1yr_returns unk_return_policy_terms=Unknown
% @importance 0.95

0.90::true_val(return_policy_terms, evo_price_match_1yr); 0.10::true_val(return_policy_terms, unk_return_policy_terms).
0.88::acc(s16, return_policy_terms).
measured(s16, return_policy_terms, evo_price_match_1yr).
all_consistent(return_policy_terms) :- consistent(s16, return_policy_terms).
evidence(all_consistent(return_policy_terms)).
query(true_val(return_policy_terms, evo_price_match_1yr)).
query(true_val(return_policy_terms, unk_return_policy_terms)).

% @attr return_policy_terms_tactics
% @type categorical
% @canonical false
% @original_name return_policy_terms
% @values tactics_free_ship_10pct=US_retailer_free_ship_over_99_10pct_reward unk_return_policy_terms_tactics=Unknown
% @importance 0.75

0.88::true_val(return_policy_terms_tactics, tactics_free_ship_10pct); 0.12::true_val(return_policy_terms_tactics, unk_return_policy_terms_tactics).
0.85::acc(s18, return_policy_terms_tactics).
measured(s18, return_policy_terms_tactics, tactics_free_ship_10pct).
all_consistent(return_policy_terms_tactics) :- consistent(s18, return_policy_terms_tactics).
evidence(all_consistent(return_policy_terms_tactics)).
query(true_val(return_policy_terms_tactics, tactics_free_ship_10pct)).
query(true_val(return_policy_terms_tactics, unk_return_policy_terms_tactics)).

% @attr blauer_board_shop
% @type categorical
% @canonical false
% @original_name Blauer Board Shop
% @values specialty_knowledgeable=Specialty_board_shop_knowledgeable_2027_preorders unk_blauer_board_shop=Unknown
% @importance 0.90

0.85::true_val(blauer_board_shop, specialty_knowledgeable); 0.15::true_val(blauer_board_shop, unk_blauer_board_shop).
0.82::acc(s1, blauer_board_shop).
measured(s1, blauer_board_shop, specialty_knowledgeable).
all_consistent(blauer_board_shop) :-
    (indep(s1), consistent(s1, blauer_board_shop) ; \+indep(s1)).
evidence(all_consistent(blauer_board_shop)).
query(true_val(blauer_board_shop, specialty_knowledgeable)).
query(true_val(blauer_board_shop, unk_blauer_board_shop)).

% @attr return_policy_terms_melbourne
% @type categorical
% @canonical false
% @original_name return_policy_terms
% @values au_specialty_free_ship=AU_specialty_2027_preorders_free_ship_over_100 unk_return_policy_terms_melbourne=Unknown
% @importance 0.85

0.88::true_val(return_policy_terms_melbourne, au_specialty_free_ship); 0.12::true_val(return_policy_terms_melbourne, unk_return_policy_terms_melbourne).
0.85::acc(s5, return_policy_terms_melbourne).
measured(s5, return_policy_terms_melbourne, au_specialty_free_ship).
all_consistent(return_policy_terms_melbourne) :-
    (indep(s5), consistent(s5, return_policy_terms_melbourne) ; \+indep(s5)).
evidence(all_consistent(return_policy_terms_melbourne)).
query(true_val(return_policy_terms_melbourne, au_specialty_free_ship)).
query(true_val(return_policy_terms_melbourne, unk_return_policy_terms_melbourne)).

% @attr return_policy_terms_auski
% @type categorical
% @canonical false
% @original_name return_policy_terms
% @values au_free_ship_30day=AU_retailer_free_ship_over_99_30day_return unk_return_policy_terms_auski=Unknown
% @importance 0.85

0.88::true_val(return_policy_terms_auski, au_free_ship_30day); 0.12::true_val(return_policy_terms_auski, unk_return_policy_terms_auski).
0.82::acc(s4, return_policy_terms_auski).
measured(s4, return_policy_terms_auski, au_free_ship_30day).
all_consistent(return_policy_terms_auski) :-
    (indep(s4), consistent(s4, return_policy_terms_auski) ; \+indep(s4)).
evidence(all_consistent(return_policy_terms_auski)).
query(true_val(return_policy_terms_auski, au_free_ship_30day)).
query(true_val(return_policy_terms_auski, unk_return_policy_terms_auski)).

% @attr return_policy_terms_skimonster
% @type categorical
% @canonical false
% @original_name return_policy_terms
% @values specialty_firsthand_90day=Specialty_firsthand_testing_90day_returns unk_return_policy_terms_skimonster=Unknown
% @importance 0.85

0.82::true_val(return_policy_terms_skimonster, specialty_firsthand_90day); 0.18::true_val(return_policy_terms_skimonster, unk_return_policy_terms_skimonster).
0.80::acc(s8, return_policy_terms_skimonster).
measured(s8, return_policy_terms_skimonster, specialty_firsthand_90day).
all_consistent(return_policy_terms_skimonster) :- consistent(s8, return_policy_terms_skimonster).
evidence(all_consistent(return_policy_terms_skimonster)).
query(true_val(return_policy_terms_skimonster, specialty_firsthand_90day)).
query(true_val(return_policy_terms_skimonster, unk_return_policy_terms_skimonster)).

% @attr the_house
% @type categorical
% @canonical false
% @original_name The House
% @values established_us_online=Established_US_online_retailer unk_the_house=Unknown
% @importance 0.70

0.82::true_val(the_house, established_us_online); 0.18::true_val(the_house, unk_the_house).
0.80::acc(s7, the_house).
measured(s7, the_house, established_us_online).
all_consistent(the_house) :-
    (indep(s7), consistent(s7, the_house) ; \+indep(s7)).
evidence(all_consistent(the_house)).
query(true_val(the_house, established_us_online)).
query(true_val(the_house, unk_the_house)).

% @attr return_policy_terms_blue_tomato
% @type categorical
% @canonical false
% @original_name return_policy_terms
% @values eu_100day_free=European_multi_country_100day_free_returns unk_return_policy_terms_blue_tomato=Unknown
% @importance 0.90

0.85::true_val(return_policy_terms_blue_tomato, eu_100day_free); 0.15::true_val(return_policy_terms_blue_tomato, unk_return_policy_terms_blue_tomato).
0.82::acc(s19, return_policy_terms_blue_tomato).
measured(s19, return_policy_terms_blue_tomato, eu_100day_free).
all_consistent(return_policy_terms_blue_tomato) :- consistent(s19, return_policy_terms_blue_tomato).
evidence(all_consistent(return_policy_terms_blue_tomato)).
query(true_val(return_policy_terms_blue_tomato, eu_100day_free)).
query(true_val(return_policy_terms_blue_tomato, unk_return_policy_terms_blue_tomato)).