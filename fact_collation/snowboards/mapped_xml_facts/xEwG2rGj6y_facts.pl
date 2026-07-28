0.15::indep(s1, brand).
0.15::indep(s1, model_name).
0.15::indep(s1, shape).
0.15::indep(s1, flex_rating_10_manufacturer).
0.15::indep(s1, camber_type).
0.15::indep(s1, sidecut_type).
0.15::indep(s1, available_sizes).
0.15::indep(s1, stance_width_range_size_153).
0.15::indep(s1, stance_width_range_size).
0.15::indep(s1, stance_width_range_size_159).
0.15::indep(s1, stance_width_range_size_162).
0.15::indep(s1, core_material).
0.15::indep(s1, laminate).
0.15::indep(s1, base_material).
0.20::indep(s14, sustainability_certification_energy_globe).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values capita=CAPiTA unk_brand=Unknown
% @importance 1.0

0.93::acc(s1, brand).
0.95::acc(s2, brand).

0.97::true_val(brand, capita); 0.03::true_val(brand, unk_brand).

measured(s1, brand, capita).
measured(s2, brand, capita).

all_consistent(brand) :-
    consistent(s2, brand),
    (indep(s1, brand), consistent(s1, brand) ; \+indep(s1, brand)).

evidence(all_consistent(brand)).
query(true_val(brand, capita)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values sb_powder_twin=Spring_Break_Powder_Twin unk_model_name=Unknown
% @importance 1.0

0.93::acc(s1, model_name).
0.95::acc(s2, model_name).

0.97::true_val(model_name, sb_powder_twin); 0.03::true_val(model_name, unk_model_name).

measured(s1, model_name, sb_powder_twin).
measured(s2, model_name, sb_powder_twin).

all_consistent(model_name) :-
    consistent(s2, model_name),
    (indep(s1, model_name), consistent(s1, model_name) ; \+indep(s1, model_name)).

evidence(all_consistent(model_name)).
query(true_val(model_name, sb_powder_twin)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values v2027=2027 unk_model_year=Unknown
% @importance 1.0

0.90::acc(s1, model_year).

0.71::true_val(model_year, v2027); 0.29::true_val(model_year, unk_model_year).

measured(s1, model_year, v2027).

all_consistent(model_year) :- consistent(s1, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, v2027)).
query(true_val(model_year, unk_model_year)).

% @attr model_series
% @type categorical
% @canonical false
% @original_name Model series
% @values spring_break_collab=Spring_Break_CAPiTA_collaboration unk_model_series=Unknown
% @importance 1.0

0.93::acc(s2, model_series).

0.87::true_val(model_series, spring_break_collab); 0.13::true_val(model_series, unk_model_series).

measured(s2, model_series, spring_break_collab).

all_consistent(model_series) :- consistent(s2, model_series).

evidence(all_consistent(model_series)).
query(true_val(model_series, spring_break_collab)).
query(true_val(model_series, unk_model_series)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.90::acc(s1, product_type).

0.71::true_val(product_type, snowboard); 0.29::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).

all_consistent(product_type) :- consistent(s1, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values powder=Powder unk_board_category=Unknown
% @importance 1.0

0.90::acc(s1, board_category).

0.71::true_val(board_category, powder); 0.29::true_val(board_category, unk_board_category).

measured(s1, board_category, powder).

all_consistent(board_category) :- consistent(s1, board_category).

evidence(all_consistent(board_category)).
query(true_val(board_category, powder)).
query(true_val(board_category, unk_board_category)).

% @attr board_subtype
% @type categorical
% @canonical false
% @original_name Board subtype
% @values powder_freestyle_twin=Powder_Freestyle_Twin unk_board_subtype=Unknown
% @importance 0.85

0.75::acc(s3, board_subtype).

0.68::true_val(board_subtype, powder_freestyle_twin); 0.32::true_val(board_subtype, unk_board_subtype).

measured(s3, board_subtype, powder_freestyle_twin).

all_consistent(board_subtype) :- consistent(s3, board_subtype).

evidence(all_consistent(board_subtype)).
query(true_val(board_subtype, powder_freestyle_twin)).
query(true_val(board_subtype, unk_board_subtype)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.4

0.65::acc(s4, gender).

0.60::true_val(gender, mens); 0.40::true_val(gender, unk_gender).

measured(s4, gender, mens).

all_consistent(gender) :- consistent(s4, gender).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values corey_smith=Corey_Smith_founder_Spring_Break unk_pro_rider_name=Unknown
% @importance 0.45

0.82::acc(s5, pro_rider_name).

0.76::true_val(pro_rider_name, corey_smith); 0.24::true_val(pro_rider_name, unk_pro_rider_name).

measured(s5, pro_rider_name, corey_smith).

all_consistent(pro_rider_name) :- consistent(s5, pro_rider_name).

evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, corey_smith)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr spring_break_founded
% @type categorical
% @canonical false
% @original_name Spring Break brand founded
% @values founded_2010=2010_by_Corey_Smith unk_spring_break_founded=Unknown
% @importance 0.35

0.88::acc(s6, spring_break_founded).

0.86::true_val(spring_break_founded, founded_2010); 0.14::true_val(spring_break_founded, unk_spring_break_founded).

measured(s6, spring_break_founded, founded_2010).

all_consistent(spring_break_founded) :- consistent(s6, spring_break_founded).

evidence(all_consistent(spring_break_founded)).
query(true_val(spring_break_founded, founded_2010)).
query(true_val(spring_break_founded, unk_spring_break_founded)).

% @attr collaboration_began
% @type categorical
% @canonical false
% @original_name CAPiTA x Spring Break collaboration began
% @values year_2013=2013_strategic_partnership unk_collaboration_began=Unknown
% @importance 0.35

0.68::acc(s7, collaboration_began).

0.63::true_val(collaboration_began, year_2013); 0.37::true_val(collaboration_began, unk_collaboration_began).

measured(s7, collaboration_began, year_2013).

all_consistent(collaboration_began) :- consistent(s7, collaboration_began).

evidence(all_consistent(collaboration_began)).
query(true_val(collaboration_began, year_2013)).
query(true_val(collaboration_began, unk_collaboration_began)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values approx_2021=Approximately_2021 unk_model_first_available_year=Unknown
% @importance 0.5

0.70::acc(s8, model_first_available_year).

0.60::true_val(model_first_available_year, approx_2021); 0.40::true_val(model_first_available_year, unk_model_first_available_year).

measured(s8, model_first_available_year, approx_2021).

all_consistent(model_first_available_year) :- consistent(s8, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, approx_2021)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr capita_founded
% @type categorical
% @canonical false
% @original_name CAPiTA founded
% @values seattle_2000=2000_in_Seattle_Washington unk_capita_founded=Unknown
% @importance 0.4

0.90::acc(s9, capita_founded).

0.87::true_val(capita_founded, seattle_2000); 0.13::true_val(capita_founded, unk_capita_founded).

measured(s9, capita_founded, seattle_2000).

all_consistent(capita_founded) :- consistent(s9, capita_founded).

evidence(all_consistent(capita_founded)).
query(true_val(capita_founded, seattle_2000)).
query(true_val(capita_founded, unk_capita_founded)).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values austria_mothership=Mothership_Feistritz_Austria china=China
% @importance 0.525

0.85::acc(s10, manufacturing_location_current).
0.18::acc(s11, manufacturing_location_current).

0.82::true_val(manufacturing_location_current, austria_mothership); 0.18::true_val(manufacturing_location_current, china).

measured(s10, manufacturing_location_current, austria_mothership).
measured(s11, manufacturing_location_current, china).

all_consistent(manufacturing_location_current) :-
    consistent(s10, manufacturing_location_current),
    consistent(s11, manufacturing_location_current).

evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, austria_mothership)).
query(true_val(manufacturing_location_current, china)).

% @attr sustainability_certification_clean_energy
% @type categorical
% @canonical false
% @original_name sustainability_certification (clean energy)
% @values clean_energy_hydro_solar=100pct_clean_energy_hydro_solar unk_sustainability_certification_clean_energy=Unknown
% @importance 0.5

0.85::acc(s12, sustainability_certification_clean_energy).

0.81::true_val(sustainability_certification_clean_energy, clean_energy_hydro_solar); 0.19::true_val(sustainability_certification_clean_energy, unk_sustainability_certification_clean_energy).

measured(s12, sustainability_certification_clean_energy, clean_energy_hydro_solar).

all_consistent(sustainability_certification_clean_energy) :- consistent(s12, sustainability_certification_clean_energy).

evidence(all_consistent(sustainability_certification_clean_energy)).
query(true_val(sustainability_certification_clean_energy, clean_energy_hydro_solar)).
query(true_val(sustainability_certification_clean_energy, unk_sustainability_certification_clean_energy)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values b_corp_98_9=Certified_B_Corp_score_98_9 unk_sustainability_certification=Unknown
% @importance 0.55

0.90::acc(s13, sustainability_certification).

0.86::true_val(sustainability_certification, b_corp_98_9); 0.14::true_val(sustainability_certification, unk_sustainability_certification).

measured(s13, sustainability_certification, b_corp_98_9).

all_consistent(sustainability_certification) :- consistent(s13, sustainability_certification).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, b_corp_98_9)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr sustainability_certification_energy_globe
% @type categorical
% @canonical false
% @original_name sustainability_certification (Energy Globe Award)
% @values energy_globe_2017=Energy_Globe_Award_Austria_2017 unk_sustainability_certification_energy_globe=Unknown
% @importance 0.35

0.72::acc(s14, sustainability_certification_energy_globe).

0.68::true_val(sustainability_certification_energy_globe, energy_globe_2017); 0.32::true_val(sustainability_certification_energy_globe, unk_sustainability_certification_energy_globe).

measured(s14, sustainability_certification_energy_globe, energy_globe_2017).

all_consistent(sustainability_certification_energy_globe) :-
    (indep(s14, sustainability_certification_energy_globe), consistent(s14, sustainability_certification_energy_globe) ; \+indep(s14, sustainability_certification_energy_globe)).

evidence(all_consistent(sustainability_certification_energy_globe)).
query(true_val(sustainability_certification_energy_globe, energy_globe_2017)).
query(true_val(sustainability_certification_energy_globe, unk_sustainability_certification_energy_globe)).

% @attr nfc_chip
% @type categorical
% @canonical false
% @original_name NFC chip
% @values embedded_registration=Embedded_for_registration_warranty_exclusive_access unk_nfc_chip=Unknown
% @importance 0.4

0.88::acc(s15, nfc_chip).

0.81::true_val(nfc_chip, embedded_registration); 0.19::true_val(nfc_chip, unk_nfc_chip).

measured(s15, nfc_chip, embedded_registration).

all_consistent(nfc_chip) :- consistent(s15, nfc_chip).

evidence(all_consistent(nfc_chip)).
query(true_val(nfc_chip, embedded_registration)).
query(true_val(nfc_chip, unk_nfc_chip)).

% @attr edge_bevel_spec
% @type numeric
% @canonical true
% @original_name edge_bevel_spec
% @unit degree
% @values v1=1.0 unk_edge_bevel_spec=Unknown
% @importance 0.55

0.83::acc(s16, edge_bevel_spec).

0.77::true_val(edge_bevel_spec, v1); 0.23::true_val(edge_bevel_spec, unk_edge_bevel_spec).

measured(s16, edge_bevel_spec, v1).

all_consistent(edge_bevel_spec) :- consistent(s16, edge_bevel_spec).

evidence(all_consistent(edge_bevel_spec)).
query(true_val(edge_bevel_spec, v1)).
query(true_val(edge_bevel_spec, unk_edge_bevel_spec)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v599_95=599.95 unk_price_usd_msrp=Unknown
% @importance 0.9

0.88::acc(s17, price_usd_msrp).

0.81::true_val(price_usd_msrp, v599_95); 0.19::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s17, price_usd_msrp, v599_95).

all_consistent(price_usd_msrp) :- consistent(s17, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v599_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_usd_evo
% @type numeric
% @canonical true
% @original_name price_usd_evo
% @unit USD
% @values v479_96=479.96 unk_price_usd_evo=Unknown
% @importance 0.9

0.85::acc(s18, price_usd_evo).

0.77::true_val(price_usd_evo, v479_96); 0.23::true_val(price_usd_evo, unk_price_usd_evo).

measured(s18, price_usd_evo, v479_96).

all_consistent(price_usd_evo) :- consistent(s18, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v479_96)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_aud_merchant
% @type numeric
% @canonical true
% @original_name price_aud_merchant
% @unit AUD
% @values v1049_99=1049.99 unk_price_aud_merchant=Unknown
% @importance 1.0

0.85::acc(s1, price_aud_merchant).

0.71::true_val(price_aud_merchant, v1049_99); 0.29::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s1, price_aud_merchant, v1049_99).

all_consistent(price_aud_merchant) :- consistent(s1, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v1049_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values preorder=Preorder unk_availability_status=Unknown
% @importance 1.0

0.85::acc(s1, availability_status).

0.71::true_val(availability_status, preorder); 0.29::true_val(availability_status, unk_availability_status).

measured(s1, availability_status, preorder).

all_consistent(availability_status) :- consistent(s1, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, preorder)).
query(true_val(availability_status, unk_availability_status)).

% @attr estimated_availability_date
% @type categorical
% @canonical true
% @original_name estimated_availability_date
% @values may_1_2026=May_1_2026 summer_2026_jun_jul=Summer_2026_June_July
% @importance 0.85

0.82::acc(s1, estimated_availability_date).
0.65::acc(s19, estimated_availability_date).

0.58::true_val(estimated_availability_date, may_1_2026); 0.42::true_val(estimated_availability_date, summer_2026_jun_jul).

measured(s1, estimated_availability_date, may_1_2026).
measured(s19, estimated_availability_date, summer_2026_jun_jul).

all_consistent(estimated_availability_date) :-
    consistent(s1, estimated_availability_date),
    consistent(s19, estimated_availability_date).

evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, may_1_2026)).
query(true_val(estimated_availability_date, summer_2026_jun_jul)).

% @attr price_usd_evo_msrp
% @type numeric
% @canonical false
% @original_name price_usd_evo (MSRP listing)
% @unit USD
% @values v599_95=599.95 unk_price_usd_evo_msrp=Unknown
% @importance 0.9

0.88::acc(s17, price_usd_evo_msrp).

0.81::true_val(price_usd_evo_msrp, v599_95); 0.19::true_val(price_usd_evo_msrp, unk_price_usd_evo_msrp).

measured(s17, price_usd_evo_msrp, v599_95).

all_consistent(price_usd_evo_msrp) :- consistent(s17, price_usd_evo_msrp).

evidence(all_consistent(price_usd_evo_msrp)).
query(true_val(price_usd_evo_msrp, v599_95)).
query(true_val(price_usd_evo_msrp, unk_price_usd_evo_msrp)).

% @attr price_usd_eriks
% @type numeric
% @canonical false
% @original_name Price at Eriks Bike Shop (2026)
% @unit USD
% @values v599_95=599.95 unk_price_usd_eriks=Unknown
% @importance 0.85

0.78::acc(s20, price_usd_eriks).

0.68::true_val(price_usd_eriks, v599_95); 0.32::true_val(price_usd_eriks, unk_price_usd_eriks).

measured(s20, price_usd_eriks, v599_95).

all_consistent(price_usd_eriks) :- consistent(s20, price_usd_eriks).

evidence(all_consistent(price_usd_eriks)).
query(true_val(price_usd_eriks, v599_95)).
query(true_val(price_usd_eriks, unk_price_usd_eriks)).

% @attr price_usd_milosport
% @type numeric
% @canonical false
% @original_name Price at Milosport (2026)
% @unit USD
% @values v599_95=599.95 unk_price_usd_milosport=Unknown
% @importance 0.85

0.78::acc(s21, price_usd_milosport).

0.68::true_val(price_usd_milosport, v599_95); 0.32::true_val(price_usd_milosport, unk_price_usd_milosport).

measured(s21, price_usd_milosport, v599_95).

all_consistent(price_usd_milosport) :- consistent(s21, price_usd_milosport).

evidence(all_consistent(price_usd_milosport)).
query(true_val(price_usd_milosport, v599_95)).
query(true_val(price_usd_milosport, unk_price_usd_milosport)).

% @attr price_usd_ski_chalet
% @type numeric
% @canonical false
% @original_name Price at The Ski Chalet (2026)
% @unit USD
% @values v599_95=599.95 unk_price_usd_ski_chalet=Unknown
% @importance 0.85

0.72::acc(s22, price_usd_ski_chalet).

0.59::true_val(price_usd_ski_chalet, v599_95); 0.41::true_val(price_usd_ski_chalet, unk_price_usd_ski_chalet).

measured(s22, price_usd_ski_chalet, v599_95).

all_consistent(price_usd_ski_chalet) :- consistent(s22, price_usd_ski_chalet).

evidence(all_consistent(price_usd_ski_chalet)).
query(true_val(price_usd_ski_chalet, v599_95)).
query(true_val(price_usd_ski_chalet, unk_price_usd_ski_chalet)).

% @attr price_usd_backcountry
% @type numeric
% @canonical true
% @original_name price_usd_backcountry
% @unit USD
% @values v479_96=479.96 unk_price_usd_backcountry=Unknown
% @importance 0.85

0.78::acc(s23, price_usd_backcountry).

0.68::true_val(price_usd_backcountry, v479_96); 0.32::true_val(price_usd_backcountry, unk_price_usd_backcountry).

measured(s23, price_usd_backcountry, v479_96).

all_consistent(price_usd_backcountry) :- consistent(s23, price_usd_backcountry).

evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v479_96)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

% @attr price_eur_blue_tomato
% @type numeric
% @canonical true
% @original_name price_eur_blue_tomato
% @unit EUR
% @values v384_25=384.25 unk_price_eur_blue_tomato=Unknown
% @importance 0.85

0.78::acc(s23, price_eur_blue_tomato).

0.68::true_val(price_eur_blue_tomato, v384_25); 0.32::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).

measured(s23, price_eur_blue_tomato, v384_25).

all_consistent(price_eur_blue_tomato) :- consistent(s23, price_eur_blue_tomato).

evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v384_25)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status (Blauer)
% @values login_required=Listed_requires_account_login unk_availability_status_blauer=Unknown
% @importance 0.65

0.65::acc(s24, availability_status_blauer).

0.49::true_val(availability_status_blauer, login_required); 0.51::true_val(availability_status_blauer, unk_availability_status_blauer).

measured(s24, availability_status_blauer, login_required).

all_consistent(availability_status_blauer) :- consistent(s24, availability_status_blauer).

evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, login_required)).
query(true_val(availability_status_blauer, unk_availability_status_blauer)).

% @attr retailer_evo
% @type categorical
% @canonical false
% @original_name evo.com retailer description
% @values major_us_retailer_benefits=Major_US_retailer_LPG_1yr_returns_10pct_rewards_free_ship unk_retailer_evo=Unknown
% @importance 0.6

0.82::acc(s25, retailer_evo).

0.77::true_val(retailer_evo, major_us_retailer_benefits); 0.23::true_val(retailer_evo, unk_retailer_evo).

measured(s25, retailer_evo, major_us_retailer_benefits).

all_consistent(retailer_evo) :- consistent(s25, retailer_evo).

evidence(all_consistent(retailer_evo)).
query(true_val(retailer_evo, major_us_retailer_benefits)).
query(true_val(retailer_evo, unk_retailer_evo)).

% @attr retailer_backcountry
% @type categorical
% @canonical false
% @original_name Backcountry.com description
% @values major_us_outdoor_retailer=Major_US_online_outdoor_retailer unk_retailer_backcountry=Unknown
% @importance 0.85

0.78::acc(s23, retailer_backcountry).

0.68::true_val(retailer_backcountry, major_us_outdoor_retailer); 0.32::true_val(retailer_backcountry, unk_retailer_backcountry).

measured(s23, retailer_backcountry, major_us_outdoor_retailer).

all_consistent(retailer_backcountry) :- consistent(s23, retailer_backcountry).

evidence(all_consistent(retailer_backcountry)).
query(true_val(retailer_backcountry, major_us_outdoor_retailer)).
query(true_val(retailer_backcountry, unk_retailer_backcountry)).

% @attr retailer_the_house
% @type categorical
% @canonical false
% @original_name The House (the-house.com) description
% @values us_action_sports_retailer=US_online_action_sports_retailer unk_retailer_the_house=Unknown
% @importance 0.7

0.68::acc(s26, retailer_the_house).

0.60::true_val(retailer_the_house, us_action_sports_retailer); 0.40::true_val(retailer_the_house, unk_retailer_the_house).

measured(s26, retailer_the_house, us_action_sports_retailer).

all_consistent(retailer_the_house) :- consistent(s26, retailer_the_house).

evidence(all_consistent(retailer_the_house)).
query(true_val(retailer_the_house, us_action_sports_retailer)).
query(true_val(retailer_the_house, unk_retailer_the_house)).

% @attr retailer_tactics
% @type categorical
% @canonical false
% @original_name Tactics.com description
% @values us_snowboard_specialist=US_snowboard_specialist_LPG_free_ship unk_retailer_tactics=Unknown
% @importance 0.65

0.78::acc(s27, retailer_tactics).

0.72::true_val(retailer_tactics, us_snowboard_specialist); 0.28::true_val(retailer_tactics, unk_retailer_tactics).

measured(s27, retailer_tactics, us_snowboard_specialist).

all_consistent(retailer_tactics) :- consistent(s27, retailer_tactics).

evidence(all_consistent(retailer_tactics)).
query(true_val(retailer_tactics, us_snowboard_specialist)).
query(true_val(retailer_tactics, unk_retailer_tactics)).

% @attr retailer_eriks
% @type categorical
% @canonical false
% @original_name Eriks Bike Shop description
% @values us_multisport_price_match=US_multisport_retailer_price_match_10_days unk_retailer_eriks=Unknown
% @importance 0.5

0.68::acc(s28, retailer_eriks).

0.60::true_val(retailer_eriks, us_multisport_price_match); 0.40::true_val(retailer_eriks, unk_retailer_eriks).

measured(s28, retailer_eriks, us_multisport_price_match).

all_consistent(retailer_eriks) :- consistent(s28, retailer_eriks).

evidence(all_consistent(retailer_eriks)).
query(true_val(retailer_eriks, us_multisport_price_match)).
query(true_val(retailer_eriks, unk_retailer_eriks)).

% @attr retailer_christy_sports
% @type categorical
% @canonical false
% @original_name Christy Sports description
% @values us_specialty_retailer=US_specialty_retailer unk_retailer_christy_sports=Unknown
% @importance 0.65

0.68::acc(s29, retailer_christy_sports).

0.56::true_val(retailer_christy_sports, us_specialty_retailer); 0.44::true_val(retailer_christy_sports, unk_retailer_christy_sports).

measured(s29, retailer_christy_sports, us_specialty_retailer).

all_consistent(retailer_christy_sports) :- consistent(s29, retailer_christy_sports).

evidence(all_consistent(retailer_christy_sports)).
query(true_val(retailer_christy_sports, us_specialty_retailer)).
query(true_val(retailer_christy_sports, unk_retailer_christy_sports)).

% @attr retailer_melbourne_snowboard
% @type categorical
% @canonical false
% @original_name Melbourne Snowboard Centre description
% @values au_specialist_no_refunds=Australian_specialist_no_change_of_mind_refunds unk_retailer_melbourne_snowboard=Unknown
% @importance 0.55

0.68::acc(s30, retailer_melbourne_snowboard).

0.60::true_val(retailer_melbourne_snowboard, au_specialist_no_refunds); 0.40::true_val(retailer_melbourne_snowboard, unk_retailer_melbourne_snowboard).

measured(s30, retailer_melbourne_snowboard, au_specialist_no_refunds).

all_consistent(retailer_melbourne_snowboard) :- consistent(s30, retailer_melbourne_snowboard).

evidence(all_consistent(retailer_melbourne_snowboard)).
query(true_val(retailer_melbourne_snowboard, au_specialist_no_refunds)).
query(true_val(retailer_melbourne_snowboard, unk_retailer_melbourne_snowboard)).

% @attr retailer_capita_direct
% @type categorical
% @canonical false
% @original_name CAPiTA direct description
% @values official_no_base_colour_guarantee=Official_site_cannot_guarantee_base_colour unk_retailer_capita_direct=Unknown
% @importance 0.35

0.90::acc(s31, retailer_capita_direct).

0.83::true_val(retailer_capita_direct, official_no_base_colour_guarantee); 0.17::true_val(retailer_capita_direct, unk_retailer_capita_direct).

measured(s31, retailer_capita_direct, official_no_base_colour_guarantee).

all_consistent(retailer_capita_direct) :- consistent(s31, retailer_capita_direct).

evidence(all_consistent(retailer_capita_direct)).
query(true_val(retailer_capita_direct, official_no_base_colour_guarantee)).
query(true_val(retailer_capita_direct, unk_retailer_capita_direct)).

% @attr retailer_milosport
% @type categorical
% @canonical false
% @original_name Milosport description
% @values specialty_slc=Specialty_snowboard_shop_Salt_Lake_City unk_retailer_milosport=Unknown
% @importance 0.85

0.72::acc(s21, retailer_milosport).

0.68::true_val(retailer_milosport, specialty_slc); 0.32::true_val(retailer_milosport, unk_retailer_milosport).

measured(s21, retailer_milosport, specialty_slc).

all_consistent(retailer_milosport) :- consistent(s21, retailer_milosport).

evidence(all_consistent(retailer_milosport)).
query(true_val(retailer_milosport, specialty_slc)).
query(true_val(retailer_milosport, unk_retailer_milosport)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values true_twin=True_Twin unk_shape=Unknown
% @importance 1.0

0.93::acc(s2, shape).
0.80::acc(s1, shape).

0.97::true_val(shape, true_twin); 0.03::true_val(shape, unk_shape).

measured(s1, shape, true_twin).
measured(s2, shape, true_twin).

all_consistent(shape) :-
    consistent(s2, shape),
    (indep(s1, shape), consistent(s1, shape) ; \+indep(s1, shape)).

evidence(all_consistent(shape)).
query(true_val(shape, true_twin)).
query(true_val(shape, unk_shape)).

% @attr flex_rating_10_manufacturer
% @type numeric
% @canonical true
% @original_name flex_rating_10_manufacturer
% @unit /10
% @values v5=5.0 unk_flex_rating_10_manufacturer=Unknown
% @importance 1.0

0.93::acc(s2, flex_rating_10_manufacturer).
0.80::acc(s1, flex_rating_10_manufacturer).

0.97::true_val(flex_rating_10_manufacturer, v5); 0.03::true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer).

measured(s1, flex_rating_10_manufacturer, v5).
measured(s2, flex_rating_10_manufacturer, v5).

all_consistent(flex_rating_10_manufacturer) :-
    consistent(s2, flex_rating_10_manufacturer),
    (indep(s1, flex_rating_10_manufacturer), consistent(s1, flex_rating_10_manufacturer) ; \+indep(s1, flex_rating_10_manufacturer)).

evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, v5)).
query(true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer)).

% @attr flex_feel
% @type numeric
% @canonical true
% @original_name flex_feel
% @unit /10
% @values v6=6.0 medium_stiff=Medium_Stiff
% @importance 0.875

0.82::acc(s32, flex_feel).
0.78::acc(s33, flex_feel).

0.55::true_val(flex_feel, v6); 0.45::true_val(flex_feel, medium_stiff).

measured(s32, flex_feel, v6).
measured(s33, flex_feel, medium_stiff).

all_consistent(flex_feel) :-
    consistent(s32, flex_feel),
    consistent(s33, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, v6)).
query(true_val(flex_feel, medium_stiff)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values surf_camber_twin=Surf_Camber_Twin unk_camber_type=Unknown
% @importance 1.0

0.93::acc(s2, camber_type).
0.80::acc(s1, camber_type).

0.97::true_val(camber_type, surf_camber_twin); 0.03::true_val(camber_type, unk_camber_type).

measured(s1, camber_type, surf_camber_twin).
measured(s2, camber_type, surf_camber_twin).

all_consistent(camber_type) :-
    consistent(s2, camber_type),
    (indep(s1, camber_type), consistent(s1, camber_type) ; \+indep(s1, camber_type)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, surf_camber_twin)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical false
% @original_name camber_description
% @values raised_camber_zero_zone_float=Raised_camber_zero_camber_zone_elevated_contact_points unk_camber_description=Unknown
% @importance 1.0

0.93::acc(s2, camber_description).

0.87::true_val(camber_description, raised_camber_zero_zone_float); 0.13::true_val(camber_description, unk_camber_description).

measured(s2, camber_description, raised_camber_zero_zone_float).

all_consistent(camber_description) :- consistent(s2, camber_description).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, raised_camber_zero_zone_float)).
query(true_val(camber_description, unk_camber_description)).

% @attr camber_height_mm
% @type numeric
% @canonical true
% @original_name camber_height_mm
% @unit mm
% @values v4=4.0 unk_camber_height_mm=Unknown
% @importance 0.9

0.82::acc(s32, camber_height_mm).

0.74::true_val(camber_height_mm, v4); 0.26::true_val(camber_height_mm, unk_camber_height_mm).

measured(s32, camber_height_mm, v4).

all_consistent(camber_height_mm) :- consistent(s32, camber_height_mm).

evidence(all_consistent(camber_height_mm)).
query(true_val(camber_height_mm, v4)).
query(true_val(camber_height_mm, unk_camber_height_mm)).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values blended_radial=Blended_Radial unk_sidecut_type=Unknown
% @importance 1.0

0.93::acc(s2, sidecut_type).
0.80::acc(s1, sidecut_type).

0.97::true_val(sidecut_type, blended_radial); 0.03::true_val(sidecut_type, unk_sidecut_type).

measured(s1, sidecut_type, blended_radial).
measured(s2, sidecut_type, blended_radial).

all_consistent(sidecut_type) :-
    consistent(s2, sidecut_type),
    (indep(s1, sidecut_type), consistent(s1, sidecut_type) ; \+indep(s1, sidecut_type)).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, blended_radial)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard=Standard unk_width_options=Unknown
% @importance 1.0

0.85::acc(s1, width_options).

0.71::true_val(width_options, standard); 0.29::true_val(width_options, unk_width_options).

measured(s1, width_options, standard).

all_consistent(width_options) :- consistent(s1, width_options).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard)).
query(true_val(width_options, unk_width_options)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 1.0

0.85::acc(s1, mounting_pattern).

0.71::true_val(mounting_pattern, inserts_2x4); 0.29::true_val(mounting_pattern, unk_mounting_pattern).

measured(s1, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :- consistent(s1, mounting_pattern).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values three_sizes=153_156_159cm four_sizes=153_156_159_162cm
% @importance 0.97

0.78::acc(s1, available_sizes).
0.93::acc(s2, available_sizes).
0.85::acc(s17, available_sizes).

0.30::true_val(available_sizes, three_sizes); 0.70::true_val(available_sizes, four_sizes).

measured(s1, available_sizes, three_sizes).
measured(s2, available_sizes, four_sizes).
measured(s17, available_sizes, four_sizes).

all_consistent(available_sizes) :-
    consistent(s2, available_sizes),
    consistent(s17, available_sizes),
    (indep(s1, available_sizes), consistent(s1, available_sizes) ; \+indep(s1, available_sizes)).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, three_sizes)).
query(true_val(available_sizes, four_sizes)).

% @attr setback
% @type numeric
% @canonical true
% @original_name setback
% @unit cm
% @values v0=0.0 unk_setback=Unknown
% @importance 1.0

0.85::acc(s1, setback).

0.71::true_val(setback, v0); 0.29::true_val(setback, unk_setback).

measured(s1, setback, v0).

all_consistent(setback) :- consistent(s1, setback).

evidence(all_consistent(setback)).
query(true_val(setback, v0)).
query(true_val(setback, unk_setback)).

% @attr effective_edge_153
% @type numeric
% @canonical false
% @original_name 153cm effective edge
% @unit mm
% @values v1116=1116.0 unk_effective_edge_153=Unknown
% @importance 1.0

0.85::acc(s1, effective_edge_153).

0.71::true_val(effective_edge_153, v1116); 0.29::true_val(effective_edge_153, unk_effective_edge_153).

measured(s1, effective_edge_153, v1116).

all_consistent(effective_edge_153) :- consistent(s1, effective_edge_153).

evidence(all_consistent(effective_edge_153)).
query(true_val(effective_edge_153, v1116)).
query(true_val(effective_edge_153, unk_effective_edge_153)).

% @attr sidecut_radius_size_153
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (153cm)
% @unit m
% @values v6_5=6.5 unk_sidecut_radius_size_153=Unknown
% @importance 1.0

0.85::acc(s1, sidecut_radius_size_153).

0.71::true_val(sidecut_radius_size_153, v6_5); 0.29::true_val(sidecut_radius_size_153, unk_sidecut_radius_size_153).

measured(s1, sidecut_radius_size_153, v6_5).

all_consistent(sidecut_radius_size_153) :- consistent(s1, sidecut_radius_size_153).

evidence(all_consistent(sidecut_radius_size_153)).
query(true_val(sidecut_radius_size_153, v6_5)).
query(true_val(sidecut_radius_size_153, unk_sidecut_radius_size_153)).

% @attr tip_tail_width_size_153
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (153cm)
% @unit cm
% @values v30_9=30.9 unk_tip_tail_width_size_153=Unknown
% @importance 1.0

0.85::acc(s1, tip_tail_width_size_153).

0.71::true_val(tip_tail_width_size_153, v30_9); 0.29::true_val(tip_tail_width_size_153, unk_tip_tail_width_size_153).

measured(s1, tip_tail_width_size_153, v30_9).

all_consistent(tip_tail_width_size_153) :- consistent(s1, tip_tail_width_size_153).

evidence(all_consistent(tip_tail_width_size_153)).
query(true_val(tip_tail_width_size_153, v30_9)).
query(true_val(tip_tail_width_size_153, unk_tip_tail_width_size_153)).

% @attr waist_width_153
% @type numeric
% @canonical false
% @original_name 153cm waist width
% @unit mm
% @values v263=263.0 v264=264.0
% @importance 0.95

0.85::acc(s1, waist_width_153).
0.80::acc(s32, waist_width_153).

0.52::true_val(waist_width_153, v263); 0.48::true_val(waist_width_153, v264).

measured(s1, waist_width_153, v263).
measured(s32, waist_width_153, v264).

all_consistent(waist_width_153) :-
    consistent(s1, waist_width_153),
    consistent(s32, waist_width_153).

evidence(all_consistent(waist_width_153)).
query(true_val(waist_width_153, v263)).
query(true_val(waist_width_153, v264)).

% @attr stance_width_range_size_153
% @type numeric
% @canonical false
% @original_name stance_width_range_size (153cm)
% @unit cm
% @values v53_3=53.3 unk_stance_width_range_size_153=Unknown
% @importance 1.0

0.93::acc(s2, stance_width_range_size_153).
0.80::acc(s1, stance_width_range_size_153).

0.97::true_val(stance_width_range_size_153, v53_3); 0.03::true_val(stance_width_range_size_153, unk_stance_width_range_size_153).

measured(s1, stance_width_range_size_153, v53_3).
measured(s2, stance_width_range_size_153, v53_3).

all_consistent(stance_width_range_size_153) :-
    consistent(s2, stance_width_range_size_153),
    (indep(s1, stance_width_range_size_153), consistent(s1, stance_width_range_size_153) ; \+indep(s1, stance_width_range_size_153)).

evidence(all_consistent(stance_width_range_size_153)).
query(true_val(stance_width_range_size_153, v53_3)).
query(true_val(stance_width_range_size_153, unk_stance_width_range_size_153)).

% @attr recommended_weight_range_size_153
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (153cm)
% @values w50_77kg=50_77kg_110_170lbs unk_recommended_weight_range_size_153=Unknown
% @importance 0.95

0.85::acc(s1, recommended_weight_range_size_153).
0.80::acc(s32, recommended_weight_range_size_153).

0.95::true_val(recommended_weight_range_size_153, w50_77kg); 0.05::true_val(recommended_weight_range_size_153, unk_recommended_weight_range_size_153).

measured(s1, recommended_weight_range_size_153, w50_77kg).
measured(s32, recommended_weight_range_size_153, w50_77kg).

all_consistent(recommended_weight_range_size_153) :-
    consistent(s1, recommended_weight_range_size_153),
    consistent(s32, recommended_weight_range_size_153).

evidence(all_consistent(recommended_weight_range_size_153)).
query(true_val(recommended_weight_range_size_153, w50_77kg)).
query(true_val(recommended_weight_range_size_153, unk_recommended_weight_range_size_153)).

% @attr effective_edge_156
% @type numeric
% @canonical false
% @original_name 156cm effective edge
% @unit mm
% @values v1138=1138.0 unk_effective_edge_156=Unknown
% @importance 1.0

0.85::acc(s1, effective_edge_156).

0.71::true_val(effective_edge_156, v1138); 0.29::true_val(effective_edge_156, unk_effective_edge_156).

measured(s1, effective_edge_156, v1138).

all_consistent(effective_edge_156) :- consistent(s1, effective_edge_156).

evidence(all_consistent(effective_edge_156)).
query(true_val(effective_edge_156, v1138)).
query(true_val(effective_edge_156, unk_effective_edge_156)).

% @attr sidecut_radius_size
% @type numeric
% @canonical true
% @original_name sidecut_radius_size
% @unit m
% @values v6_6=6.6 unk_sidecut_radius_size=Unknown
% @importance 1.0

0.85::acc(s1, sidecut_radius_size).

0.71::true_val(sidecut_radius_size, v6_6); 0.29::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s1, sidecut_radius_size, v6_6).

all_consistent(sidecut_radius_size) :- consistent(s1, sidecut_radius_size).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v6_6)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr tip_tail_width_size
% @type numeric
% @canonical true
% @original_name tip_tail_width_size
% @unit cm
% @values v31_5=31.5 unk_tip_tail_width_size=Unknown
% @importance 1.0

0.85::acc(s1, tip_tail_width_size).

0.71::true_val(tip_tail_width_size, v31_5); 0.29::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s1, tip_tail_width_size, v31_5).

all_consistent(tip_tail_width_size) :- consistent(s1, tip_tail_width_size).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v31_5)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr waist_width_156
% @type numeric
% @canonical false
% @original_name 156cm waist width
% @unit mm
% @values v268=268.0 unk_waist_width_156=Unknown
% @importance 0.95

0.85::acc(s1, waist_width_156).
0.80::acc(s32, waist_width_156).

0.95::true_val(waist_width_156, v268); 0.05::true_val(waist_width_156, unk_waist_width_156).

measured(s1, waist_width_156, v268).
measured(s32, waist_width_156, v268).

all_consistent(waist_width_156) :-
    consistent(s1, waist_width_156),
    consistent(s32, waist_width_156).

evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v268)).
query(true_val(waist_width_156, unk_waist_width_156)).

% @attr stance_width_range_size
% @type numeric
% @canonical true
% @original_name stance_width_range_size
% @unit cm
% @values v55_9=55.9 unk_stance_width_range_size=Unknown
% @importance 1.0

0.93::acc(s2, stance_width_range_size).
0.80::acc(s1, stance_width_range_size).

0.97::true_val(stance_width_range_size, v55_9); 0.03::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s1, stance_width_range_size, v55_9).
measured(s2, stance_width_range_size, v55_9).

all_consistent(stance_width_range_size) :-
    consistent(s2, stance_width_range_size),
    (indep(s1, stance_width_range_size), consistent(s1, stance_width_range_size) ; \+indep(s1, stance_width_range_size)).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v55_9)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size
% @values w54_82kg=54_82kg_120_180lbs unk_recommended_weight_range_size=Unknown
% @importance 0.95

0.85::acc(s1, recommended_weight_range_size).
0.80::acc(s32, recommended_weight_range_size).

0.95::true_val(recommended_weight_range_size, w54_82kg); 0.05::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s1, recommended_weight_range_size, w54_82kg).
measured(s32, recommended_weight_range_size, w54_82kg).

all_consistent(recommended_weight_range_size) :-
    consistent(s1, recommended_weight_range_size),
    consistent(s32, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w54_82kg)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr effective_edge_159
% @type numeric
% @canonical false
% @original_name 159cm effective edge
% @unit mm
% @values v1160=1160.0 unk_effective_edge_159=Unknown
% @importance 1.0

0.85::acc(s1, effective_edge_159).

0.71::true_val(effective_edge_159, v1160); 0.29::true_val(effective_edge_159, unk_effective_edge_159).

measured(s1, effective_edge_159, v1160).

all_consistent(effective_edge_159) :- consistent(s1, effective_edge_159).

evidence(all_consistent(effective_edge_159)).
query(true_val(effective_edge_159, v1160)).
query(true_val(effective_edge_159, unk_effective_edge_159)).

% @attr sidecut_radius_size_159
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (159cm)
% @unit m
% @values v6_7=6.7 unk_sidecut_radius_size_159=Unknown
% @importance 1.0

0.85::acc(s1, sidecut_radius_size_159).

0.71::true_val(sidecut_radius_size_159, v6_7); 0.29::true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159).

measured(s1, sidecut_radius_size_159, v6_7).

all_consistent(sidecut_radius_size_159) :- consistent(s1, sidecut_radius_size_159).

evidence(all_consistent(sidecut_radius_size_159)).
query(true_val(sidecut_radius_size_159, v6_7)).
query(true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159)).

% @attr tip_tail_width_size_159
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (159cm)
% @unit cm
% @values v32_1=32.1 unk_tip_tail_width_size_159=Unknown
% @importance 1.0

0.85::acc(s1, tip_tail_width_size_159).

0.71::true_val(tip_tail_width_size_159, v32_1); 0.29::true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159).

measured(s1, tip_tail_width_size_159, v32_1).

all_consistent(tip_tail_width_size_159) :- consistent(s1, tip_tail_width_size_159).

evidence(all_consistent(tip_tail_width_size_159)).
query(true_val(tip_tail_width_size_159, v32_1)).
query(true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159)).

% @attr waist_width_159
% @type numeric
% @canonical false
% @original_name 159cm waist width
% @unit mm
% @values v273=273.0 unk_waist_width_159=Unknown
% @importance 0.8

0.85::acc(s1, waist_width_159).
0.42::acc(s34, waist_width_159).

0.95::true_val(waist_width_159, v273); 0.05::true_val(waist_width_159, unk_waist_width_159).

measured(s1, waist_width_159, v273).
measured(s34, waist_width_159, v273).

all_consistent(waist_width_159) :-
    consistent(s1, waist_width_159),
    consistent(s34, waist_width_159).

evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v273)).
query(true_val(waist_width_159, unk_waist_width_159)).

% @attr stance_width_range_size_159
% @type numeric
% @canonical false
% @original_name stance_width_range_size (159cm)
% @unit cm
% @values v55_9=55.9 unk_stance_width_range_size_159=Unknown
% @importance 1.0

0.93::acc(s2, stance_width_range_size_159).
0.80::acc(s1, stance_width_range_size_159).

0.97::true_val(stance_width_range_size_159, v55_9); 0.03::true_val(stance_width_range_size_159, unk_stance_width_range_size_159).

measured(s1, stance_width_range_size_159, v55_9).
measured(s2, stance_width_range_size_159, v55_9).

all_consistent(stance_width_range_size_159) :-
    consistent(s2, stance_width_range_size_159),
    (indep(s1, stance_width_range_size_159), consistent(s1, stance_width_range_size_159) ; \+indep(s1, stance_width_range_size_159)).

evidence(all_consistent(stance_width_range_size_159)).
query(true_val(stance_width_range_size_159, v55_9)).
query(true_val(stance_width_range_size_159, unk_stance_width_range_size_159)).

% @attr recommended_weight_range_size_159
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (159cm)
% @values w63_90kg=63_90kg_140_200lbs unk_recommended_weight_range_size_159=Unknown
% @importance 1.0

0.85::acc(s1, recommended_weight_range_size_159).

0.71::true_val(recommended_weight_range_size_159, w63_90kg); 0.29::true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159).

measured(s1, recommended_weight_range_size_159, w63_90kg).

all_consistent(recommended_weight_range_size_159) :- consistent(s1, recommended_weight_range_size_159).

evidence(all_consistent(recommended_weight_range_size_159)).
query(true_val(recommended_weight_range_size_159, w63_90kg)).
query(true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159)).

% @attr effective_edge_162
% @type numeric
% @canonical false
% @original_name 162cm effective edge
% @unit mm
% @values v1182=1182.0 unk_effective_edge_162=Unknown
% @importance 1.0

0.85::acc(s1, effective_edge_162).

0.71::true_val(effective_edge_162, v1182); 0.29::true_val(effective_edge_162, unk_effective_edge_162).

measured(s1, effective_edge_162, v1182).

all_consistent(effective_edge_162) :- consistent(s1, effective_edge_162).

evidence(all_consistent(effective_edge_162)).
query(true_val(effective_edge_162, v1182)).
query(true_val(effective_edge_162, unk_effective_edge_162)).

% @attr sidecut_radius_size_162
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (162cm)
% @unit m
% @values v6_8=6.8 unk_sidecut_radius_size_162=Unknown
% @importance 1.0

0.85::acc(s1, sidecut_radius_size_162).

0.71::true_val(sidecut_radius_size_162, v6_8); 0.29::true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162).

measured(s1, sidecut_radius_size_162, v6_8).

all_consistent(sidecut_radius_size_162) :- consistent(s1, sidecut_radius_size_162).

evidence(all_consistent(sidecut_radius_size_162)).
query(true_val(sidecut_radius_size_162, v6_8)).
query(true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162)).

% @attr tip_tail_width_size_162
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (162cm)
% @unit cm
% @values v32_7=32.7 unk_tip_tail_width_size_162=Unknown
% @importance 1.0

0.85::acc(s1, tip_tail_width_size_162).

0.71::true_val(tip_tail_width_size_162, v32_7); 0.29::true_val(tip_tail_width_size_162, unk_tip_tail_width_size_162).

measured(s1, tip_tail_width_size_162, v32_7).

all_consistent(tip_tail_width_size_162) :- consistent(s1, tip_tail_width_size_162).

evidence(all_consistent(tip_tail_width_size_162)).
query(true_val(tip_tail_width_size_162, v32_7)).
query(true_val(tip_tail_width_size_162, unk_tip_tail_width_size_162)).

% @attr waist_width_162
% @type numeric
% @canonical false
% @original_name 162cm waist width
% @unit mm
% @values v278=278.0 unk_waist_width_162=Unknown
% @importance 0.8

0.85::acc(s1, waist_width_162).
0.45::acc(s35, waist_width_162).

0.95::true_val(waist_width_162, v278); 0.05::true_val(waist_width_162, unk_waist_width_162).

measured(s1, waist_width_162, v278).
measured(s35, waist_width_162, v278).

all_consistent(waist_width_162) :-
    consistent(s1, waist_width_162),
    consistent(s35, waist_width_162).

evidence(all_consistent(waist_width_162)).
query(true_val(waist_width_162, v278)).
query(true_val(waist_width_162, unk_waist_width_162)).

% @attr stance_width_range_size_162
% @type numeric
% @canonical false
% @original_name stance_width_range_size (162cm)
% @unit cm
% @values v58_4=58.4 unk_stance_width_range_size_162=Unknown
% @importance 1.0

0.93::acc(s2, stance_width_range_size_162).
0.80::acc(s1, stance_width_range_size_162).

0.97::true_val(stance_width_range_size_162, v58_4); 0.03::true_val(stance_width_range_size_162, unk_stance_width_range_size_162).

measured(s1, stance_width_range_size_162, v58_4).
measured(s2, stance_width_range_size_162, v58_4).

all_consistent(stance_width_range_size_162) :-
    consistent(s2, stance_width_range_size_162),
    (indep(s1, stance_width_range_size_162), consistent(s1, stance_width_range_size_162) ; \+indep(s1, stance_width_range_size_162)).

evidence(all_consistent(stance_width_range_size_162)).
query(true_val(stance_width_range_size_162, v58_4)).
query(true_val(stance_width_range_size_162, unk_stance_width_range_size_162)).

% @attr recommended_weight_range_size_162
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (162cm)
% @values w77_100kg=77_100kg_160_220plus_lbs unk_recommended_weight_range_size_162=Unknown
% @importance 0.95

0.85::acc(s1, recommended_weight_range_size_162).
0.80::acc(s32, recommended_weight_range_size_162).

0.95::true_val(recommended_weight_range_size_162, w77_100kg); 0.05::true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162).

measured(s1, recommended_weight_range_size_162, w77_100kg).
measured(s32, recommended_weight_range_size_162, w77_100kg).

all_consistent(recommended_weight_range_size_162) :-
    consistent(s1, recommended_weight_range_size_162),
    consistent(s32, recommended_weight_range_size_162).

evidence(all_consistent(recommended_weight_range_size_162)).
query(true_val(recommended_weight_range_size_162, w77_100kg)).
query(true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values meta_core_poplar_paulownia_beech=Meta_Core_Poplar_Paulownia_Beech_stringers unk_core_material=Unknown
% @importance 0.875

0.93::acc(s2, core_material).
0.80::acc(s1, core_material).
0.90::acc(s36, core_material).

0.97::true_val(core_material, meta_core_poplar_paulownia_beech); 0.03::true_val(core_material, unk_core_material).

measured(s1, core_material, meta_core_poplar_paulownia_beech).
measured(s2, core_material, meta_core_poplar_paulownia_beech).
measured(s36, core_material, meta_core_poplar_paulownia_beech).

all_consistent(core_material) :-
    consistent(s2, core_material),
    consistent(s36, core_material),
    (indep(s1, core_material), consistent(s1, core_material) ; \+indep(s1, core_material)).

evidence(all_consistent(core_material)).
query(true_val(core_material, meta_core_poplar_paulownia_beech)).
query(true_val(core_material, unk_core_material)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values holysheet_tri_bi=Holysheet_Triax_above_Biax_below unk_laminate=Unknown
% @importance 1.0

0.93::acc(s2, laminate).
0.80::acc(s1, laminate).

0.97::true_val(laminate, holysheet_tri_bi); 0.03::true_val(laminate, unk_laminate).

measured(s1, laminate, holysheet_tri_bi).
measured(s2, laminate, holysheet_tri_bi).

all_consistent(laminate) :-
    consistent(s2, laminate),
    (indep(s1, laminate), consistent(s1, laminate) ; \+indep(s1, laminate)).

evidence(all_consistent(laminate)).
query(true_val(laminate, holysheet_tri_bi)).
query(true_val(laminate, unk_laminate)).

% @attr laminate_properties
% @type categorical
% @canonical false
% @original_name laminate (material properties)
% @values high_tensile_low_modulus=High_tensile_strength_low_modulus_high_roving_count unk_laminate_properties=Unknown
% @importance 1.0

0.90::acc(s2, laminate_properties).

0.87::true_val(laminate_properties, high_tensile_low_modulus); 0.13::true_val(laminate_properties, unk_laminate_properties).

measured(s2, laminate_properties, high_tensile_low_modulus).

all_consistent(laminate_properties) :- consistent(s2, laminate_properties).

evidence(all_consistent(laminate_properties)).
query(true_val(laminate_properties, high_tensile_low_modulus)).
query(true_val(laminate_properties, unk_laminate_properties)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values carbon_v_tech_4x30mm=4x30mm_Carbon_V_Tech_Amplifiers unk_construction_material_innovation=Unknown
% @importance 1.0

0.85::acc(s1, construction_material_innovation).

0.71::true_val(construction_material_innovation, carbon_v_tech_4x30mm); 0.29::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s1, construction_material_innovation, carbon_v_tech_4x30mm).

all_consistent(construction_material_innovation) :- consistent(s1, construction_material_innovation).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, carbon_v_tech_4x30mm)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr construction_material_innovation_carbonflax
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Carbonflax)
% @values carbonflax=Carbonflax_natural_flax_plus_carbon unk_construction_material_innovation_carbonflax=Unknown
% @importance 1.0

0.85::acc(s1, construction_material_innovation_carbonflax).

0.71::true_val(construction_material_innovation_carbonflax, carbonflax); 0.29::true_val(construction_material_innovation_carbonflax, unk_construction_material_innovation_carbonflax).

measured(s1, construction_material_innovation_carbonflax, carbonflax).

all_consistent(construction_material_innovation_carbonflax) :- consistent(s1, construction_material_innovation_carbonflax).

evidence(all_consistent(construction_material_innovation_carbonflax)).
query(true_val(construction_material_innovation_carbonflax, carbonflax)).
query(true_val(construction_material_innovation_carbonflax, unk_construction_material_innovation_carbonflax)).

% @attr resin
% @type categorical
% @canonical false
% @original_name resin
% @values magic_bean_60pct_bio=Magic_Bean_Resin_60pct_renewable_bio_content unk_resin=Unknown
% @importance 0.675

0.85::acc(s1, resin).
0.68::acc(s37, resin).

0.95::true_val(resin, magic_bean_60pct_bio); 0.05::true_val(resin, unk_resin).

measured(s1, resin, magic_bean_60pct_bio).
measured(s37, resin, magic_bean_60pct_bio).

all_consistent(resin) :-
    consistent(s1, resin),
    consistent(s37, resin).

evidence(all_consistent(resin)).
query(true_val(resin, magic_bean_60pct_bio)).
query(true_val(resin, unk_resin)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values powder_drive_sintruded=Powder_Drive_Base_hybrid_sintruded unk_base_material=Unknown
% @importance 1.0

0.93::acc(s2, base_material).
0.80::acc(s1, base_material).

0.97::true_val(base_material, powder_drive_sintruded); 0.03::true_val(base_material, unk_base_material).

measured(s1, base_material, powder_drive_sintruded).
measured(s2, base_material, powder_drive_sintruded).

all_consistent(base_material) :-
    consistent(s2, base_material),
    (indep(s1, base_material), consistent(s1, base_material) ; \+indep(s1, base_material)).

evidence(all_consistent(base_material)).
query(true_val(base_material, powder_drive_sintruded)).
query(true_val(base_material, unk_base_material)).

% @attr base_type
% @type categorical
% @canonical false
% @original_name base_type
% @values hybrid_sintruded=Hybrid_sintruded_speed_durability_low_maintenance unk_base_type=Unknown
% @importance 0.7

0.68::acc(s38, base_type).

0.60::true_val(base_type, hybrid_sintruded); 0.40::true_val(base_type, unk_base_type).

measured(s38, base_type, hybrid_sintruded).

all_consistent(base_type) :- consistent(s38, base_type).

evidence(all_consistent(base_type)).
query(true_val(base_type, hybrid_sintruded)).
query(true_val(base_type, unk_base_type)).

% @attr base_material_die_cut
% @type categorical
% @canonical false
% @original_name base_material (die-cut detail)
% @values die_cut_two_colours=Die_cut_base_two_colour_variations_per_size unk_base_material_die_cut=Unknown
% @importance 0.35

0.90::acc(s31, base_material_die_cut).

0.83::true_val(base_material_die_cut, die_cut_two_colours); 0.17::true_val(base_material_die_cut, unk_base_material_die_cut).

measured(s31, base_material_die_cut, die_cut_two_colours).

all_consistent(base_material_die_cut) :- consistent(s31, base_material_die_cut).

evidence(all_consistent(base_material_die_cut)).
query(true_val(base_material_die_cut, die_cut_two_colours)).
query(true_val(base_material_die_cut, unk_base_material_die_cut)).

% @attr topsheet
% @type categorical
% @canonical true
% @original_name topsheet
% @values plt_technology=PLT_Technology_featherlight_smooth_high_gloss_no_solvents unk_topsheet=Unknown
% @importance 1.0

0.93::acc(s2, topsheet).

0.87::true_val(topsheet, plt_technology); 0.13::true_val(topsheet, unk_topsheet).

measured(s2, topsheet, plt_technology).

all_consistent(topsheet) :- consistent(s2, topsheet).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, plt_technology)).
query(true_val(topsheet, unk_topsheet)).

% @attr topsheet_printing
% @type categorical
% @canonical false
% @original_name topsheet (printing technology)
% @values pam16000_solventless=PAM16000_16000_nozzles_solventless_UV_ink_plus_screen_print unk_topsheet_printing=Unknown
% @importance 1.0

0.85::acc(s1, topsheet_printing).

0.71::true_val(topsheet_printing, pam16000_solventless); 0.29::true_val(topsheet_printing, unk_topsheet_printing).

measured(s1, topsheet_printing, pam16000_solventless).

all_consistent(topsheet_printing) :- consistent(s1, topsheet_printing).

evidence(all_consistent(topsheet_printing)).
query(true_val(topsheet_printing, pam16000_solventless)).
query(true_val(topsheet_printing, unk_topsheet_printing)).

% @attr sustainability_certification_fsc_bio
% @type categorical
% @canonical false
% @original_name sustainability_certification (FSC bio resins)
% @values fsc_bio_resins_low_temp=FSC_certified_wood_bio_resins_low_temp_pressing unk_sustainability_certification_fsc_bio=Unknown
% @importance 0.5

0.88::acc(s39, sustainability_certification_fsc_bio).

0.81::true_val(sustainability_certification_fsc_bio, fsc_bio_resins_low_temp); 0.19::true_val(sustainability_certification_fsc_bio, unk_sustainability_certification_fsc_bio).

measured(s39, sustainability_certification_fsc_bio, fsc_bio_resins_low_temp).

all_consistent(sustainability_certification_fsc_bio) :- consistent(s39, sustainability_certification_fsc_bio).

evidence(all_consistent(sustainability_certification_fsc_bio)).
query(true_val(sustainability_certification_fsc_bio, fsc_bio_resins_low_temp)).
query(true_val(sustainability_certification_fsc_bio, unk_sustainability_certification_fsc_bio)).

% @attr warranty_period_years
% @type numeric
% @canonical true
% @original_name warranty_period_years
% @unit years
% @values v2=2.0 unk_warranty_period_years=Unknown
% @importance 0.75

0.93::acc(s40, warranty_period_years).

0.90::true_val(warranty_period_years, v2); 0.10::true_val(warranty_period_years, unk_warranty_period_years).

measured(s40, warranty_period_years, v2).

all_consistent(warranty_period_years) :- consistent(s40, warranty_period_years).

evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v2)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

% @attr warranty_period_years_international
% @type numeric
% @canonical false
% @original_name warranty_period_years (international/Japan)
% @unit years
% @values v1=1.0 unk_warranty_period_years_international=Unknown
% @importance 0.7

0.90::acc(s41, warranty_period_years_international).

0.87::true_val(warranty_period_years_international, v1); 0.13::true_val(warranty_period_years_international, unk_warranty_period_years_international).

measured(s41, warranty_period_years_international, v1).

all_consistent(warranty_period_years_international) :- consistent(s41, warranty_period_years_international).

evidence(all_consistent(warranty_period_years_international)).
query(true_val(warranty_period_years_international, v1)).
query(true_val(warranty_period_years_international, unk_warranty_period_years_international)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values defects_material_workmanship=Defects_in_material_or_workmanship_structural_defects unk_warranty=Unknown
% @importance 0.75

0.93::acc(s40, warranty).

0.90::true_val(warranty, defects_material_workmanship); 0.10::true_val(warranty, unk_warranty).

measured(s40, warranty, defects_material_workmanship).

all_consistent(warranty) :- consistent(s40, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, defects_material_workmanship)).
query(true_val(warranty, unk_warranty)).

% @attr warranty_exclusions
% @type categorical
% @canonical false
% @original_name warranty (exclusions)
% @values excludes_impact_abuse_wear=Excludes_impact_abuse_misuse_normal_wear_rock_rail_damage unk_warranty_exclusions=Unknown
% @importance 0.65

0.68::acc(s42, warranty_exclusions).

0.63::true_val(warranty_exclusions, excludes_impact_abuse_wear); 0.37::true_val(warranty_exclusions, unk_warranty_exclusions).

measured(s42, warranty_exclusions, excludes_impact_abuse_wear).

all_consistent(warranty_exclusions) :- consistent(s42, warranty_exclusions).

evidence(all_consistent(warranty_exclusions)).
query(true_val(warranty_exclusions, excludes_impact_abuse_wear)).
query(true_val(warranty_exclusions, unk_warranty_exclusions)).

% @attr overall_rating_snowboardingprofiles
% @type numeric
% @canonical true
% @original_name overall_rating_snowboardingprofiles
% @unit /100
% @values v83_3=83.3 v84_3=84.3
% @importance 0.9

0.80::acc(s32, overall_rating_snowboardingprofiles).

0.50::true_val(overall_rating_snowboardingprofiles, v83_3); 0.50::true_val(overall_rating_snowboardingprofiles, v84_3).

measured(s32, overall_rating_snowboardingprofiles, v83_3).
measured(s32, overall_rating_snowboardingprofiles, v84_3).

all_consistent(overall_rating_snowboardingprofiles) :-
    consistent(s32, overall_rating_snowboardingprofiles).

evidence(all_consistent(overall_rating_snowboardingprofiles)).
query(true_val(overall_rating_snowboardingprofiles, v83_3)).
query(true_val(overall_rating_snowboardingprofiles, v84_3)).

% @attr overall_rating_snowboardingprofiles_ranking
% @type categorical
% @canonical false
% @original_name overall_rating_snowboardingprofiles (ranking)
% @values rank_21_of_33=21st_equal_out_of_33 unk_overall_rating_snowboardingprofiles_ranking=Unknown
% @importance 0.9

0.78::acc(s32, overall_rating_snowboardingprofiles_ranking).

0.74::true_val(overall_rating_snowboardingprofiles_ranking, rank_21_of_33); 0.26::true_val(overall_rating_snowboardingprofiles_ranking, unk_overall_rating_snowboardingprofiles_ranking).

measured(s32, overall_rating_snowboardingprofiles_ranking, rank_21_of_33).

all_consistent(overall_rating_snowboardingprofiles_ranking) :- consistent(s32, overall_rating_snowboardingprofiles_ranking).

evidence(all_consistent(overall_rating_snowboardingprofiles_ranking)).
query(true_val(overall_rating_snowboardingprofiles_ranking, rank_21_of_33)).
query(true_val(overall_rating_snowboardingprofiles_ranking, unk_overall_rating_snowboardingprofiles_ranking)).

% @attr jumps_score_snowboardingprofiles
% @type numeric
% @canonical false
% @original_name SnowboardingProfiles jumps score
% @unit /5
% @values v4=4.0 unk_jumps_score_snowboardingprofiles=Unknown
% @importance 0.9

0.80::acc(s32, jumps_score_snowboardingprofiles).

0.74::true_val(jumps_score_snowboardingprofiles, v4); 0.26::true_val(jumps_score_snowboardingprofiles, unk_jumps_score_snowboardingprofiles).

measured(s32, jumps_score_snowboardingprofiles, v4).

all_consistent(jumps_score_snowboardingprofiles) :- consistent(s32, jumps_score_snowboardingprofiles).

evidence(all_consistent(jumps_score_snowboardingprofiles)).
query(true_val(jumps_score_snowboardingprofiles, v4)).
query(true_val(jumps_score_snowboardingprofiles, unk_jumps_score_snowboardingprofiles)).

% @attr carving_score_snowboardingprofiles
% @type numeric
% @canonical true
% @original_name carving_score_snowboardingprofiles
% @unit /5
% @values v3_5=3.5 unk_carving_score_snowboardingprofiles=Unknown
% @importance 0.9

0.80::acc(s32, carving_score_snowboardingprofiles).

0.74::true_val(carving_score_snowboardingprofiles, v3_5); 0.26::true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles).

measured(s32, carving_score_snowboardingprofiles, v3_5).

all_consistent(carving_score_snowboardingprofiles) :- consistent(s32, carving_score_snowboardingprofiles).

evidence(all_consistent(carving_score_snowboardingprofiles)).
query(true_val(carving_score_snowboardingprofiles, v3_5)).
query(true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles)).

% @attr turns_score_snowboardingprofiles
% @type numeric
% @canonical false
% @original_name SnowboardingProfiles turns score
% @unit /5
% @values v3_5=3.5 unk_turns_score_snowboardingprofiles=Unknown
% @importance 0.9

0.80::acc(s32, turns_score_snowboardingprofiles).

0.74::true_val(turns_score_snowboardingprofiles, v3_5); 0.26::true_val(turns_score_snowboardingprofiles, unk_turns_score_snowboardingprofiles).

measured(s32, turns_score_snowboardingprofiles, v3_5).

all_consistent(turns_score_snowboardingprofiles) :- consistent(s32, turns_score_snowboardingprofiles).

evidence(all_consistent(turns_score_snowboardingprofiles)).
query(true_val(turns_score_snowboardingprofiles, v3_5)).
query(true_val(turns_score_snowboardingprofiles, unk_turns_score_snowboardingprofiles)).

% @attr switch_score_snowboardingprofiles
% @type numeric
% @canonical false
% @original_name SnowboardingProfiles switch score
% @unit /5
% @values v4_5=4.5 unk_switch_score_snowboardingprofiles=Unknown
% @importance 0.9

0.80::acc(s32, switch_score_snowboardingprofiles).

0.74::true_val(switch_score_snowboardingprofiles, v4_5); 0.26::true_val(switch_score_snowboardingprofiles, unk_switch_score_snowboardingprofiles).

measured(s32, switch_score_snowboardingprofiles, v4_5).

all_consistent(switch_score_snowboardingprofiles) :- consistent(s32, switch_score_snowboardingprofiles).

evidence(all_consistent(switch_score_snowboardingprofiles)).
query(true_val(switch_score_snowboardingprofiles, v4_5)).
query(true_val(switch_score_snowboardingprofiles, unk_switch_score_snowboardingprofiles)).

% @attr speed_score_snowboardingprofiles
% @type numeric
% @canonical false
% @original_name SnowboardingProfiles speed score
% @unit /5
% @values v3_5=3.5 unk_speed_score_snowboardingprofiles=Unknown
% @importance 0.9

0.80::acc(s32, speed_score_snowboardingprofiles).

0.74::true_val(speed_score_snowboardingprofiles, v3_5); 0.26::true_val(speed_score_snowboardingprofiles, unk_speed_score_snowboardingprofiles).

measured(s32, speed_score_snowboardingprofiles, v3_5).

all_consistent(speed_score_snowboardingprofiles) :- consistent(s32, speed_score_snowboardingprofiles).

evidence(all_consistent(speed_score_snowboardingprofiles)).
query(true_val(speed_score_snowboardingprofiles, v3_5)).
query(true_val(speed_score_snowboardingprofiles, unk_speed_score_snowboardingprofiles)).

% @attr spins_score_snowboardingprofiles
% @type numeric
% @canonical false
% @original_name SnowboardingProfiles spins score
% @unit /5
% @values v4=4.0 unk_spins_score_snowboardingprofiles=Unknown
% @importance 0.9

0.80::acc(s32, spins_score_snowboardingprofiles).

0.74::true_val(spins_score_snowboardingprofiles, v4); 0.26::true_val(spins_score_snowboardingprofiles, unk_spins_score_snowboardingprofiles).

measured(s32, spins_score_snowboardingprofiles, v4).

all_consistent(spins_score_snowboardingprofiles) :- consistent(s32, spins_score_snowboardingprofiles).

evidence(all_consistent(spins_score_snowboardingprofiles)).
query(true_val(spins_score_snowboardingprofiles, v4)).
query(true_val(spins_score_snowboardingprofiles, unk_spins_score_snowboardingprofiles)).

% @attr butters_score_snowboardingprofiles
% @type numeric
% @canonical false
% @original_name SnowboardingProfiles butters score
% @unit /5
% @values v3_5=3.5 unk_butters_score_snowboardingprofiles=Unknown
% @importance 0.9

0.80::acc(s32, butters_score_snowboardingprofiles).

0.74::true_val(butters_score_snowboardingprofiles, v3_5); 0.26::true_val(butters_score_snowboardingprofiles, unk_butters_score_snowboardingprofiles).

measured(s32, butters_score_snowboardingprofiles, v3_5).

all_consistent(butters_score_snowboardingprofiles) :- consistent(s32, butters_score_snowboardingprofiles).

evidence(all_consistent(butters_score_snowboardingprofiles)).
query(true_val(butters_score_snowboardingprofiles, v3_5)).
query(true_val(butters_score_snowboardingprofiles, unk_butters_score_snowboardingprofiles)).

% @attr jibbing_score_snowboardingprofiles
% @type numeric
% @canonical false
% @original_name SnowboardingProfiles jibbing score
% @unit /5
% @values v3=3.0 unk_jibbing_score_snowboardingprofiles=Unknown
% @importance 0.9

0.80::acc(s32, jibbing_score_snowboardingprofiles).

0.74::true_val(jibbing_score_snowboardingprofiles, v3); 0.26::true_val(jibbing_score_snowboardingprofiles, unk_jibbing_score_snowboardingprofiles).

measured(s32, jibbing_score_snowboardingprofiles, v3).

all_consistent(jibbing_score_snowboardingprofiles) :- consistent(s32, jibbing_score_snowboardingprofiles).

evidence(all_consistent(jibbing_score_snowboardingprofiles)).
query(true_val(jibbing_score_snowboardingprofiles, v3)).
query(true_val(jibbing_score_snowboardingprofiles, unk_jibbing_score_snowboardingprofiles)).

% @attr crud_chunder_score_snowboardingprofiles
% @type numeric
% @canonical false
% @original_name SnowboardingProfiles crud/chunder score
% @unit /5
% @values v4=4.0 unk_crud_chunder_score_snowboardingprofiles=Unknown
% @importance 0.9

0.80::acc(s32, crud_chunder_score_snowboardingprofiles).

0.74::true_val(crud_chunder_score_snowboardingprofiles, v4); 0.26::true_val(crud_chunder_score_snowboardingprofiles, unk_crud_chunder_score_snowboardingprofiles).

measured(s32, crud_chunder_score_snowboardingprofiles, v4).

all_consistent(crud_chunder_score_snowboardingprofiles) :- consistent(s32, crud_chunder_score_snowboardingprofiles).

evidence(all_consistent(crud_chunder_score_snowboardingprofiles)).
query(true_val(crud_chunder_score_snowboardingprofiles, v4)).
query(true_val(crud_chunder_score_snowboardingprofiles, unk_crud_chunder_score_snowboardingprofiles)).

% @attr trees_score_snowboardingprofiles
% @type numeric
% @canonical false
% @original_name SnowboardingProfiles trees score
% @unit /5
% @values v3_5=3.5 unk_trees_score_snowboardingprofiles=Unknown
% @importance 0.9

0.80::acc(s32, trees_score_snowboardingprofiles).

0.74::true_val(trees_score_snowboardingprofiles, v3_5); 0.26::true_val(trees_score_snowboardingprofiles, unk_trees_score_snowboardingprofiles).

measured(s32, trees_score_snowboardingprofiles, v3_5).

all_consistent(trees_score_snowboardingprofiles) :- consistent(s32, trees_score_snowboardingprofiles).

evidence(all_consistent(trees_score_snowboardingprofiles)).
query(true_val(trees_score_snowboardingprofiles, v3_5)).
query(true_val(trees_score_snowboardingprofiles, unk_trees_score_snowboardingprofiles)).

% @attr powder_score_snowboardingprofiles
% @type numeric
% @canonical true
% @original_name powder_score_snowboardingprofiles
% @unit /5
% @values v3_5=3.5 unk_powder_score_snowboardingprofiles=Unknown
% @importance 0.9

0.80::acc(s32, powder_score_snowboardingprofiles).

0.74::true_val(powder_score_snowboardingprofiles, v3_5); 0.26::true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles).

measured(s32, powder_score_snowboardingprofiles, v3_5).

all_consistent(powder_score_snowboardingprofiles) :- consistent(s32, powder_score_snowboardingprofiles).

evidence(all_consistent(powder_score_snowboardingprofiles)).
query(true_val(powder_score_snowboardingprofiles, v3_5)).
query(true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles)).

% @attr board_weight_grams
% @type numeric
% @canonical true
% @original_name board_weight_grams
% @unit grams
% @values v3140=3140.0 unk_board_weight_grams=Unknown
% @importance 0.9

0.82::acc(s32, board_weight_grams).

0.74::true_val(board_weight_grams, v3140); 0.26::true_val(board_weight_grams, unk_board_weight_grams).

measured(s32, board_weight_grams, v3140).

all_consistent(board_weight_grams) :- consistent(s32, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v3140)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr weight_per_cm
% @type numeric
% @canonical false
% @original_name weight_per_cm
% @unit grams/cm
% @values v20_13=20.13 unk_weight_per_cm=Unknown
% @importance 0.9

0.80::acc(s32, weight_per_cm).

0.74::true_val(weight_per_cm, v20_13); 0.26::true_val(weight_per_cm, unk_weight_per_cm).

measured(s32, weight_per_cm, v20_13).

all_consistent(weight_per_cm) :- consistent(s32, weight_per_cm).

evidence(all_consistent(weight_per_cm)).
query(true_val(weight_per_cm, v20_13)).
query(true_val(weight_per_cm, unk_weight_per_cm)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values best_twin_powder=About_the_best_twin_ride_in_powder unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.9

0.82::acc(s43, reviewer_opinion_the_good_ride).

0.74::true_val(reviewer_opinion_the_good_ride, best_twin_powder); 0.26::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s43, reviewer_opinion_the_good_ride, best_twin_powder).

all_consistent(reviewer_opinion_the_good_ride) :- consistent(s43, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, best_twin_powder)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr switch_riding
% @type categorical
% @canonical false
% @original_name switch_riding
% @values excellent_true_twin=True_twin_excellent_switch_powder_landings unk_switch_riding=Unknown
% @importance 0.85

0.78::acc(s44, switch_riding).

0.70::true_val(switch_riding, excellent_true_twin); 0.30::true_val(switch_riding, unk_switch_riding).

measured(s44, switch_riding, excellent_true_twin).

all_consistent(switch_riding) :- consistent(s44, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, excellent_true_twin)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr reviewer_opinion_the_good_ride_dampness
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (dampness)
% @values pretty_damp=Pretty_damp_reduces_chatter unk_reviewer_opinion_the_good_ride_dampness=Unknown
% @importance 0.9

0.82::acc(s43, reviewer_opinion_the_good_ride_dampness).

0.74::true_val(reviewer_opinion_the_good_ride_dampness, pretty_damp); 0.26::true_val(reviewer_opinion_the_good_ride_dampness, unk_reviewer_opinion_the_good_ride_dampness).

measured(s43, reviewer_opinion_the_good_ride_dampness, pretty_damp).

all_consistent(reviewer_opinion_the_good_ride_dampness) :- consistent(s43, reviewer_opinion_the_good_ride_dampness).

evidence(all_consistent(reviewer_opinion_the_good_ride_dampness)).
query(true_val(reviewer_opinion_the_good_ride_dampness, pretty_damp)).
query(true_val(reviewer_opinion_the_good_ride_dampness, unk_reviewer_opinion_the_good_ride_dampness)).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name reviewer_opinion_snowboardingprofiles
% @values manages_crud_well=Manages_crud_chunder_well_due_to_weight_width_dampness unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.9

0.80::acc(s32, reviewer_opinion_snowboardingprofiles).

0.74::true_val(reviewer_opinion_snowboardingprofiles, manages_crud_well); 0.26::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).

measured(s32, reviewer_opinion_snowboardingprofiles, manages_crud_well).

all_consistent(reviewer_opinion_snowboardingprofiles) :- consistent(s32, reviewer_opinion_snowboardingprofiles).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, manages_crud_well)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

% @attr base_glide_performance
% @type categorical
% @canonical false
% @original_name base_glide_performance
% @values easy_glide_improved=Easy_glide_much_better_since_2020_base_change unk_base_glide_performance=Unknown
% @importance 0.9

0.82::acc(s43, base_glide_performance).

0.74::true_val(base_glide_performance, easy_glide_improved); 0.26::true_val(base_glide_performance, unk_base_glide_performance).

measured(s43, base_glide_performance, easy_glide_improved).

all_consistent(base_glide_performance) :- consistent(s43, base_glide_performance).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, easy_glide_improved)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values good_firm_hard=Good_edge_hold_firm_to_hard_snow unk_edge_hold=Unknown
% @importance 0.825

0.72::acc(s45, edge_hold).
0.80::acc(s32, edge_hold).

0.95::true_val(edge_hold, good_firm_hard); 0.05::true_val(edge_hold, unk_edge_hold).

measured(s45, edge_hold, good_firm_hard).
measured(s32, edge_hold, good_firm_hard).

all_consistent(edge_hold) :-
    consistent(s45, edge_hold),
    consistent(s32, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, good_firm_hard)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr reviewer_opinion_snowboardingprofiles_versatility
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (versatility)
% @values remarkably_well_rounded=Remarkably_well_rounded_given_specialization unk_reviewer_opinion_snowboardingprofiles_versatility=Unknown
% @importance 0.9

0.80::acc(s32, reviewer_opinion_snowboardingprofiles_versatility).

0.74::true_val(reviewer_opinion_snowboardingprofiles_versatility, remarkably_well_rounded); 0.26::true_val(reviewer_opinion_snowboardingprofiles_versatility, unk_reviewer_opinion_snowboardingprofiles_versatility).

measured(s32, reviewer_opinion_snowboardingprofiles_versatility, remarkably_well_rounded).

all_consistent(reviewer_opinion_snowboardingprofiles_versatility) :- consistent(s32, reviewer_opinion_snowboardingprofiles_versatility).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_versatility)).
query(true_val(reviewer_opinion_snowboardingprofiles_versatility, remarkably_well_rounded)).
query(true_val(reviewer_opinion_snowboardingprofiles_versatility, unk_reviewer_opinion_snowboardingprofiles_versatility)).

% @attr reviewer_opinion_the_good_ride_stance
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (stance advice)
% @values ride_centered_no_setback=Just_ride_centered_in_powder_no_setback_needed unk_reviewer_opinion_the_good_ride_stance=Unknown
% @importance 0.9

0.82::acc(s43, reviewer_opinion_the_good_ride_stance).

0.74::true_val(reviewer_opinion_the_good_ride_stance, ride_centered_no_setback); 0.26::true_val(reviewer_opinion_the_good_ride_stance, unk_reviewer_opinion_the_good_ride_stance).

measured(s43, reviewer_opinion_the_good_ride_stance, ride_centered_no_setback).

all_consistent(reviewer_opinion_the_good_ride_stance) :- consistent(s43, reviewer_opinion_the_good_ride_stance).

evidence(all_consistent(reviewer_opinion_the_good_ride_stance)).
query(true_val(reviewer_opinion_the_good_ride_stance, ride_centered_no_setback)).
query(true_val(reviewer_opinion_the_good_ride_stance, unk_reviewer_opinion_the_good_ride_stance)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values stomp_landings=Extra_width_weight_stomp_landings unk_positive_aspect=Unknown
% @importance 0.9

0.80::acc(s32, positive_aspect).

0.74::true_val(positive_aspect, stomp_landings); 0.26::true_val(positive_aspect, unk_positive_aspect).

measured(s32, positive_aspect, stomp_landings).

all_consistent(positive_aspect) :- consistent(s32, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, stomp_landings)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr positive_aspect_boot_fit
% @type categorical
% @canonical false
% @original_name positive_aspect (boot fit)
% @values wide_for_big_boots=Extra_wide_waist_excellent_for_US_13_14_boots unk_positive_aspect_boot_fit=Unknown
% @importance 0.7

0.45::acc(s46, positive_aspect_boot_fit).

0.34::true_val(positive_aspect_boot_fit, wide_for_big_boots); 0.66::true_val(positive_aspect_boot_fit, unk_positive_aspect_boot_fit).

measured(s46, positive_aspect_boot_fit, wide_for_big_boots).

all_consistent(positive_aspect_boot_fit) :- consistent(s46, positive_aspect_boot_fit).

evidence(all_consistent(positive_aspect_boot_fit)).
query(true_val(positive_aspect_boot_fit, wide_for_big_boots)).
query(true_val(positive_aspect_boot_fit, unk_positive_aspect_boot_fit)).

% @attr positive_aspect_butters
% @type categorical
% @canonical false
% @original_name positive_aspect (butters)
% @values tip_tail_flex_easy_butters=Tip_tail_more_flex_than_mid_butters_feel_easy unk_positive_aspect_butters=Unknown
% @importance 0.9

0.80::acc(s32, positive_aspect_butters).

0.74::true_val(positive_aspect_butters, tip_tail_flex_easy_butters); 0.26::true_val(positive_aspect_butters, unk_positive_aspect_butters).

measured(s32, positive_aspect_butters, tip_tail_flex_easy_butters).

all_consistent(positive_aspect_butters) :- consistent(s32, positive_aspect_butters).

evidence(all_consistent(positive_aspect_butters)).
query(true_val(positive_aspect_butters, tip_tail_flex_easy_butters)).
query(true_val(positive_aspect_butters, unk_positive_aspect_butters)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values best_true_twin_powder=One_of_the_best_true_twins_for_powder_after_10_days unk_user_review_forum=Unknown
% @importance 0.7

0.42::acc(s47, user_review_forum).

0.32::true_val(user_review_forum, best_true_twin_powder); 0.68::true_val(user_review_forum, unk_user_review_forum).

measured(s47, user_review_forum, best_true_twin_powder).

all_consistent(user_review_forum) :- consistent(s47, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, best_true_twin_powder)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr user_review_forum_float
% @type categorical
% @canonical false
% @original_name user_review_forum (float)
% @values higher_float_amazing_deep=Would_score_float_higher_amazing_in_deeper_stuff unk_user_review_forum_float=Unknown
% @importance 0.7

0.40::acc(s48, user_review_forum_float).

0.30::true_val(user_review_forum_float, higher_float_amazing_deep); 0.70::true_val(user_review_forum_float, unk_user_review_forum_float).

measured(s48, user_review_forum_float, higher_float_amazing_deep).

all_consistent(user_review_forum_float) :- consistent(s48, user_review_forum_float).

evidence(all_consistent(user_review_forum_float)).
query(true_val(user_review_forum_float, higher_float_amazing_deep)).
query(true_val(user_review_forum_float, unk_user_review_forum_float)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values slow_edge_to_edge=Very_wide_board_slower_edge_to_edge_needs_more_leverage unk_negative_aspect=Unknown
% @importance 0.8

0.72::acc(s49, negative_aspect).

0.63::true_val(negative_aspect, slow_edge_to_edge); 0.37::true_val(negative_aspect, unk_negative_aspect).

measured(s49, negative_aspect, slow_edge_to_edge).

all_consistent(negative_aspect) :- consistent(s49, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, slow_edge_to_edge)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_speed
% @type categorical
% @canonical false
% @original_name negative_aspect (speed in trees)
% @values felt_slow_hard_work=Felt_slow_hard_work_for_quick_changes unk_negative_aspect_speed=Unknown
% @importance 0.8

0.72::acc(s49, negative_aspect_speed).

0.63::true_val(negative_aspect_speed, felt_slow_hard_work); 0.37::true_val(negative_aspect_speed, unk_negative_aspect_speed).

measured(s49, negative_aspect_speed, felt_slow_hard_work).

all_consistent(negative_aspect_speed) :- consistent(s49, negative_aspect_speed).

evidence(all_consistent(negative_aspect_speed)).
query(true_val(negative_aspect_speed, felt_slow_hard_work)).
query(true_val(negative_aspect_speed, unk_negative_aspect_speed)).

% @attr negative_aspect_weight
% @type categorical
% @canonical false
% @original_name negative_aspect (weight for spins)
% @values heavier_effort_spins=Heavier_than_average_effort_to_whip_around_for_spins unk_negative_aspect_weight=Unknown
% @importance 0.9

0.80::acc(s32, negative_aspect_weight).

0.74::true_val(negative_aspect_weight, heavier_effort_spins); 0.26::true_val(negative_aspect_weight, unk_negative_aspect_weight).

measured(s32, negative_aspect_weight, heavier_effort_spins).

all_consistent(negative_aspect_weight) :- consistent(s32, negative_aspect_weight).

evidence(all_consistent(negative_aspect_weight)).
query(true_val(negative_aspect_weight, heavier_effort_spins)).
query(true_val(negative_aspect_weight, unk_negative_aspect_weight)).

% @attr negative_aspect_pressing
% @type categorical
% @canonical false
% @original_name negative_aspect (pressing)
% @values hard_to_press=Could_hardly_press_the_board_at_all unk_negative_aspect_pressing=Unknown
% @importance 0.65

0.68::acc(s50, negative_aspect_pressing).

0.60::true_val(negative_aspect_pressing, hard_to_press); 0.40::true_val(negative_aspect_pressing, unk_negative_aspect_pressing).

measured(s50, negative_aspect_pressing, hard_to_press).

all_consistent(negative_aspect_pressing) :- consistent(s50, negative_aspect_pressing).

evidence(all_consistent(negative_aspect_pressing)).
query(true_val(negative_aspect_pressing, hard_to_press)).
query(true_val(negative_aspect_pressing, unk_negative_aspect_pressing)).

% @attr negative_aspect_nose_dive
% @type categorical
% @canonical false
% @original_name negative_aspect (nose dive)
% @values nose_grabs_when_centered=Nose_goes_under_and_grabs_if_weight_centered unk_negative_aspect_nose_dive=Unknown
% @importance 0.8

0.72::acc(s49, negative_aspect_nose_dive).

0.63::true_val(negative_aspect_nose_dive, nose_grabs_when_centered); 0.37::true_val(negative_aspect_nose_dive, unk_negative_aspect_nose_dive).

measured(s49, negative_aspect_nose_dive, nose_grabs_when_centered).

all_consistent(negative_aspect_nose_dive) :- consistent(s49, negative_aspect_nose_dive).

evidence(all_consistent(negative_aspect_nose_dive)).
query(true_val(negative_aspect_nose_dive, nose_grabs_when_centered)).
query(true_val(negative_aspect_nose_dive, unk_negative_aspect_nose_dive)).

% @attr negative_aspect_small_boots
% @type categorical
% @canonical false
% @original_name negative_aspect (small boots turning)
% @values width_hard_small_boots=Width_makes_turning_challenging_for_smaller_boots_eg_US9 unk_negative_aspect_small_boots=Unknown
% @importance 0.9

0.80::acc(s43, negative_aspect_small_boots).

0.74::true_val(negative_aspect_small_boots, width_hard_small_boots); 0.26::true_val(negative_aspect_small_boots, unk_negative_aspect_small_boots).

measured(s43, negative_aspect_small_boots, width_hard_small_boots).

all_consistent(negative_aspect_small_boots) :- consistent(s43, negative_aspect_small_boots).

evidence(all_consistent(negative_aspect_small_boots)).
query(true_val(negative_aspect_small_boots, width_hard_small_boots)).
query(true_val(negative_aspect_small_boots, unk_negative_aspect_small_boots)).

% @attr negative_aspect_sizing
% @type categorical
% @canonical false
% @original_name negative_aspect (sizing advice)
% @values size_down_for_groomers=Size_down_length_for_groomer_use_unless_big_feet unk_negative_aspect_sizing=Unknown
% @importance 0.9

0.80::acc(s32, negative_aspect_sizing).

0.74::true_val(negative_aspect_sizing, size_down_for_groomers); 0.26::true_val(negative_aspect_sizing, unk_negative_aspect_sizing).

measured(s32, negative_aspect_sizing, size_down_for_groomers).

all_consistent(negative_aspect_sizing) :- consistent(s32, negative_aspect_sizing).

evidence(all_consistent(negative_aspect_sizing)).
query(true_val(negative_aspect_sizing, size_down_for_groomers)).
query(true_val(negative_aspect_sizing, unk_negative_aspect_sizing)).

% @attr turn_initiation_performance
% @type categorical
% @canonical false
% @original_name turn_initiation_performance
% @values not_easy_width_sidecut_helps=Not_easy_to_initiate_turn_due_to_width_deep_sidecut_compensates unk_turn_initiation_performance=Unknown
% @importance 0.9

0.80::acc(s43, turn_initiation_performance).

0.74::true_val(turn_initiation_performance, not_easy_width_sidecut_helps); 0.26::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s43, turn_initiation_performance, not_easy_width_sidecut_helps).

all_consistent(turn_initiation_performance) :- consistent(s43, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, not_easy_width_sidecut_helps)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr carving_rating_tgr
% @type categorical
% @canonical false
% @original_name carving_rating_tgr
% @values not_epic_not_bad=Not_epic_carver_but_not_bad_either unk_carving_rating_tgr=Unknown
% @importance 0.9

0.80::acc(s32, carving_rating_tgr).

0.74::true_val(carving_rating_tgr, not_epic_not_bad); 0.26::true_val(carving_rating_tgr, unk_carving_rating_tgr).

measured(s32, carving_rating_tgr, not_epic_not_bad).

all_consistent(carving_rating_tgr) :- consistent(s32, carving_rating_tgr).

evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, not_epic_not_bad)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

% @attr negative_aspect_bumps
% @type categorical
% @canonical false
% @original_name negative_aspect (bumps)
% @values hate_bump_line=Would_hate_to_turn_through_a_bump_line unk_negative_aspect_bumps=Unknown
% @importance 0.9

0.80::acc(s43, negative_aspect_bumps).

0.74::true_val(negative_aspect_bumps, hate_bump_line); 0.26::true_val(negative_aspect_bumps, unk_negative_aspect_bumps).

measured(s43, negative_aspect_bumps, hate_bump_line).

all_consistent(negative_aspect_bumps) :- consistent(s43, negative_aspect_bumps).

evidence(all_consistent(negative_aspect_bumps)).
query(true_val(negative_aspect_bumps, hate_bump_line)).
query(true_val(negative_aspect_bumps, unk_negative_aspect_bumps)).

% @attr on_snow_feel_tgr
% @type categorical
% @canonical false
% @original_name on_snow_feel_tgr
% @values stable=Stable unk_on_snow_feel_tgr=Unknown
% @importance 0.9

0.80::acc(s32, on_snow_feel_tgr).

0.74::true_val(on_snow_feel_tgr, stable); 0.26::true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr).

measured(s32, on_snow_feel_tgr, stable).

all_consistent(on_snow_feel_tgr) :- consistent(s32, on_snow_feel_tgr).

evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, stable)).
query(true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr)).

% @attr reviewer_opinion_snowboardingprofiles_dampness
% @type numeric
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (dampness)
% @unit /10
% @values v7=7.0 unk_reviewer_opinion_snowboardingprofiles_dampness=Unknown
% @importance 0.9

0.80::acc(s32, reviewer_opinion_snowboardingprofiles_dampness).

0.74::true_val(reviewer_opinion_snowboardingprofiles_dampness, v7); 0.26::true_val(reviewer_opinion_snowboardingprofiles_dampness, unk_reviewer_opinion_snowboardingprofiles_dampness).

measured(s32, reviewer_opinion_snowboardingprofiles_dampness, v7).

all_consistent(reviewer_opinion_snowboardingprofiles_dampness) :- consistent(s32, reviewer_opinion_snowboardingprofiles_dampness).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_dampness)).
query(true_val(reviewer_opinion_snowboardingprofiles_dampness, v7)).
query(true_val(reviewer_opinion_snowboardingprofiles_dampness, unk_reviewer_opinion_snowboardingprofiles_dampness)).

% @attr reviewer_opinion_snowboardingprofiles_smoothness
% @type numeric
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (smoothness)
% @unit /10
% @values v4=4.0 unk_reviewer_opinion_snowboardingprofiles_smoothness=Unknown
% @importance 0.9

0.80::acc(s32, reviewer_opinion_snowboardingprofiles_smoothness).

0.74::true_val(reviewer_opinion_snowboardingprofiles_smoothness, v4); 0.26::true_val(reviewer_opinion_snowboardingprofiles_smoothness, unk_reviewer_opinion_snowboardingprofiles_smoothness).

measured(s32, reviewer_opinion_snowboardingprofiles_smoothness, v4).

all_consistent(reviewer_opinion_snowboardingprofiles_smoothness) :- consistent(s32, reviewer_opinion_snowboardingprofiles_smoothness).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_smoothness)).
query(true_val(reviewer_opinion_snowboardingprofiles_smoothness, v4)).
query(true_val(reviewer_opinion_snowboardingprofiles_smoothness, unk_reviewer_opinion_snowboardingprofiles_smoothness)).

% @attr reviewer_opinion_snowboardingprofiles_balance
% @type numeric
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (balance)
% @unit /10
% @values v5=5.0 unk_reviewer_opinion_snowboardingprofiles_balance=Unknown
% @importance 0.9

0.80::acc(s32, reviewer_opinion_snowboardingprofiles_balance).

0.74::true_val(reviewer_opinion_snowboardingprofiles_balance, v5); 0.26::true_val(reviewer_opinion_snowboardingprofiles_balance, unk_reviewer_opinion_snowboardingprofiles_balance).

measured(s32, reviewer_opinion_snowboardingprofiles_balance, v5).

all_consistent(reviewer_opinion_snowboardingprofiles_balance) :- consistent(s32, reviewer_opinion_snowboardingprofiles_balance).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_balance)).
query(true_val(reviewer_opinion_snowboardingprofiles_balance, v5)).
query(true_val(reviewer_opinion_snowboardingprofiles_balance, unk_reviewer_opinion_snowboardingprofiles_balance)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values powder_resort=Powder_plus_Resort unk_terrain_suitability=Unknown
% @importance 0.7

0.70::acc(s26, terrain_suitability).

0.60::true_val(terrain_suitability, powder_resort); 0.40::true_val(terrain_suitability, unk_terrain_suitability).

measured(s26, terrain_suitability, powder_resort).

all_consistent(terrain_suitability) :- consistent(s26, terrain_suitability).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, powder_resort)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr terrain_suitability_freestyle
% @type categorical
% @canonical false
% @original_name terrain_suitability (freestyle powder)
% @values freestyle_powder_switch=Freestyle_in_powder_switch_landings_deep_snow unk_terrain_suitability_freestyle=Unknown
% @importance 0.9

0.80::acc(s32, terrain_suitability_freestyle).

0.74::true_val(terrain_suitability_freestyle, freestyle_powder_switch); 0.26::true_val(terrain_suitability_freestyle, unk_terrain_suitability_freestyle).

measured(s32, terrain_suitability_freestyle, freestyle_powder_switch).

all_consistent(terrain_suitability_freestyle) :- consistent(s32, terrain_suitability_freestyle).

evidence(all_consistent(terrain_suitability_freestyle)).
query(true_val(terrain_suitability_freestyle, freestyle_powder_switch)).
query(true_val(terrain_suitability_freestyle, unk_terrain_suitability_freestyle)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate_advanced=Intermediate_Advanced unk_rider_level=Unknown
% @importance 1.0

0.85::acc(s1, rider_level).

0.71::true_val(rider_level, intermediate_advanced); 0.29::true_val(rider_level, unk_rider_level).

measured(s1, rider_level, intermediate_advanced).

all_consistent(rider_level) :- consistent(s1, rider_level).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate_advanced)).
query(true_val(rider_level, unk_rider_level)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values jones_me_twin=Jones_Mind_Expander_Twin_more_centered_float_vs_better_groomers unk_comparable_board_cross_brand=Unknown
% @importance 0.85

0.80::acc(s51, comparable_board_cross_brand).

0.70::true_val(comparable_board_cross_brand, jones_me_twin); 0.30::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s51, comparable_board_cross_brand, jones_me_twin).

all_consistent(comparable_board_cross_brand) :- consistent(s51, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, jones_me_twin)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_me_twin_detail
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (ME Twin detail)
% @values me_twin_directional_setback=ME_Twin_directional_twin_slight_setback_vs_SB_true_twin_centered unk_comparable_board_cross_brand_me_twin_detail=Unknown
% @importance 0.85

0.80::acc(s51, comparable_board_cross_brand_me_twin_detail).

0.70::true_val(comparable_board_cross_brand_me_twin_detail, me_twin_directional_setback); 0.30::true_val(comparable_board_cross_brand_me_twin_detail, unk_comparable_board_cross_brand_me_twin_detail).

measured(s51, comparable_board_cross_brand_me_twin_detail, me_twin_directional_setback).

all_consistent(comparable_board_cross_brand_me_twin_detail) :- consistent(s51, comparable_board_cross_brand_me_twin_detail).

evidence(all_consistent(comparable_board_cross_brand_me_twin_detail)).
query(true_val(comparable_board_cross_brand_me_twin_detail, me_twin_directional_setback)).
query(true_val(comparable_board_cross_brand_me_twin_detail, unk_comparable_board_cross_brand_me_twin_detail)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values sb_resort_twin=SB_Resort_Twin_standard_width_AM_freestyle_same_MSRP unk_comparable_board_same_brand=Unknown
% @importance 0.8

0.88::acc(s52, comparable_board_same_brand).

0.83::true_val(comparable_board_same_brand, sb_resort_twin); 0.17::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s52, comparable_board_same_brand, sb_resort_twin).

all_consistent(comparable_board_same_brand) :- consistent(s52, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, sb_resort_twin)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_cross_brand_jones_mt_twin
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Jones Mountain Twin)
% @values jones_mountain_twin=Jones_Mountain_Twin_more_versatile_3d_spoon_nose_setback unk_comparable_board_cross_brand_jones_mt_twin=Unknown
% @importance 0.7

0.65::acc(s53, comparable_board_cross_brand_jones_mt_twin).

0.53::true_val(comparable_board_cross_brand_jones_mt_twin, jones_mountain_twin); 0.47::true_val(comparable_board_cross_brand_jones_mt_twin, unk_comparable_board_cross_brand_jones_mt_twin).

measured(s53, comparable_board_cross_brand_jones_mt_twin, jones_mountain_twin).

all_consistent(comparable_board_cross_brand_jones_mt_twin) :- consistent(s53, comparable_board_cross_brand_jones_mt_twin).

evidence(all_consistent(comparable_board_cross_brand_jones_mt_twin)).
query(true_val(comparable_board_cross_brand_jones_mt_twin, jones_mountain_twin)).
query(true_val(comparable_board_cross_brand_jones_mt_twin, unk_comparable_board_cross_brand_jones_mt_twin)).

% @attr comparable_board_cross_brand_yes_2020
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (YES 2020)
% @values yes_2020=YES_2020_comparable_powder_twin unk_comparable_board_cross_brand_yes_2020=Unknown
% @importance 0.85

0.78::acc(s51, comparable_board_cross_brand_yes_2020).

0.70::true_val(comparable_board_cross_brand_yes_2020, yes_2020); 0.30::true_val(comparable_board_cross_brand_yes_2020, unk_comparable_board_cross_brand_yes_2020).

measured(s51, comparable_board_cross_brand_yes_2020, yes_2020).

all_consistent(comparable_board_cross_brand_yes_2020) :- consistent(s51, comparable_board_cross_brand_yes_2020).

evidence(all_consistent(comparable_board_cross_brand_yes_2020)).
query(true_val(comparable_board_cross_brand_yes_2020, yes_2020)).
query(true_val(comparable_board_cross_brand_yes_2020, unk_comparable_board_cross_brand_yes_2020)).

% @attr comparable_board_cross_brand_nitro_santoku
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Nitro Santoku)
% @values nitro_santoku=Nitro_Santoku_soft_powder_twin_big_tips unk_comparable_board_cross_brand_nitro_santoku=Unknown
% @importance 0.6

0.40::acc(s54, comparable_board_cross_brand_nitro_santoku).

0.28::true_val(comparable_board_cross_brand_nitro_santoku, nitro_santoku); 0.72::true_val(comparable_board_cross_brand_nitro_santoku, unk_comparable_board_cross_brand_nitro_santoku).

measured(s54, comparable_board_cross_brand_nitro_santoku, nitro_santoku).

all_consistent(comparable_board_cross_brand_nitro_santoku) :- consistent(s54, comparable_board_cross_brand_nitro_santoku).

evidence(all_consistent(comparable_board_cross_brand_nitro_santoku)).
query(true_val(comparable_board_cross_brand_nitro_santoku, nitro_santoku)).
query(true_val(comparable_board_cross_brand_nitro_santoku, unk_comparable_board_cross_brand_nitro_santoku)).

% @attr comparable_board_cross_brand_orca
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Lib Tech Orca)
% @values lib_tech_orca_golden=Lib_Tech_Orca_Golden_Orca_technical_pow_switch unk_comparable_board_cross_brand_orca=Unknown
% @importance 0.6

0.40::acc(s55, comparable_board_cross_brand_orca).

0.28::true_val(comparable_board_cross_brand_orca, lib_tech_orca_golden); 0.72::true_val(comparable_board_cross_brand_orca, unk_comparable_board_cross_brand_orca).

measured(s55, comparable_board_cross_brand_orca, lib_tech_orca_golden).

all_consistent(comparable_board_cross_brand_orca) :- consistent(s55, comparable_board_cross_brand_orca).

evidence(all_consistent(comparable_board_cross_brand_orca)).
query(true_val(comparable_board_cross_brand_orca, lib_tech_orca_golden)).
query(true_val(comparable_board_cross_brand_orca, unk_comparable_board_cross_brand_orca)).

% @attr comparable_board_cross_brand_wider_options
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (wider powder options)
% @values wider_powder_alternatives=Alternative_wider_powder_options_mentioned unk_comparable_board_cross_brand_wider_options=Unknown
% @importance 0.6

0.40::acc(s55, comparable_board_cross_brand_wider_options).

0.28::true_val(comparable_board_cross_brand_wider_options, wider_powder_alternatives); 0.72::true_val(comparable_board_cross_brand_wider_options, unk_comparable_board_cross_brand_wider_options).

measured(s55, comparable_board_cross_brand_wider_options, wider_powder_alternatives).

all_consistent(comparable_board_cross_brand_wider_options) :- consistent(s55, comparable_board_cross_brand_wider_options).

evidence(all_consistent(comparable_board_cross_brand_wider_options)).
query(true_val(comparable_board_cross_brand_wider_options, wider_powder_alternatives)).
query(true_val(comparable_board_cross_brand_wider_options, unk_comparable_board_cross_brand_wider_options)).

% @attr comparable_board_cross_brand_bataleon
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Bataleon Party Wave)
% @values bataleon_party_wave=Bataleon_Party_Wave_Twin_awesome_in_powder_not_good_carving unk_comparable_board_cross_brand_bataleon=Unknown
% @importance 0.55

0.40::acc(s56, comparable_board_cross_brand_bataleon).

0.28::true_val(comparable_board_cross_brand_bataleon, bataleon_party_wave); 0.72::true_val(comparable_board_cross_brand_bataleon, unk_comparable_board_cross_brand_bataleon).

measured(s56, comparable_board_cross_brand_bataleon, bataleon_party_wave).

all_consistent(comparable_board_cross_brand_bataleon) :- consistent(s56, comparable_board_cross_brand_bataleon).

evidence(all_consistent(comparable_board_cross_brand_bataleon)).
query(true_val(comparable_board_cross_brand_bataleon, bataleon_party_wave)).
query(true_val(comparable_board_cross_brand_bataleon, unk_comparable_board_cross_brand_bataleon)).

% @attr comparable_board_same_brand_racers
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Powder Racers)
% @values sb_powder_racers=SB_Powder_Racers_directional_more_powder_649_95 unk_comparable_board_same_brand_racers=Unknown
% @importance 0.7

0.88::acc(s57, comparable_board_same_brand_racers).

0.83::true_val(comparable_board_same_brand_racers, sb_powder_racers); 0.17::true_val(comparable_board_same_brand_racers, unk_comparable_board_same_brand_racers).

measured(s57, comparable_board_same_brand_racers, sb_powder_racers).

all_consistent(comparable_board_same_brand_racers) :- consistent(s57, comparable_board_same_brand_racers).

evidence(all_consistent(comparable_board_same_brand_racers)).
query(true_val(comparable_board_same_brand_racers, sb_powder_racers)).
query(true_val(comparable_board_same_brand_racers, unk_comparable_board_same_brand_racers)).

% @attr comparable_board_same_brand_glider
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Powder Glider)
% @values sb_powder_glider=SB_Powder_Glider_premium_Hover_Core_799_95 unk_comparable_board_same_brand_glider=Unknown
% @importance 0.7

0.88::acc(s57, comparable_board_same_brand_glider).

0.83::true_val(comparable_board_same_brand_glider, sb_powder_glider); 0.17::true_val(comparable_board_same_brand_glider, unk_comparable_board_same_brand_glider).

measured(s57, comparable_board_same_brand_glider, sb_powder_glider).

all_consistent(comparable_board_same_brand_glider) :- consistent(s57, comparable_board_same_brand_glider).

evidence(all_consistent(comparable_board_same_brand_glider)).
query(true_val(comparable_board_same_brand_glider, sb_powder_glider)).
query(true_val(comparable_board_same_brand_glider, unk_comparable_board_same_brand_glider)).

% @attr sustainability_certification_recycling
% @type categorical
% @canonical false
% @original_name sustainability_certification (recycling)
% @values all_scraps_recycled_shrink_wrap=All_production_scraps_recycled_100pct_recyclable_shrink_wrap unk_sustainability_certification_recycling=Unknown
% @importance 0.4

0.83::acc(s58, sustainability_certification_recycling).

0.77::true_val(sustainability_certification_recycling, all_scraps_recycled_shrink_wrap); 0.23::true_val(sustainability_certification_recycling, unk_sustainability_certification_recycling).

measured(s58, sustainability_certification_recycling, all_scraps_recycled_shrink_wrap).

all_consistent(sustainability_certification_recycling) :- consistent(s58, sustainability_certification_recycling).

evidence(all_consistent(sustainability_certification_recycling)).
query(true_val(sustainability_certification_recycling, all_scraps_recycled_shrink_wrap)).
query(true_val(sustainability_certification_recycling, unk_sustainability_certification_recycling)).

% @attr sustainability_certification_no_solvents
% @type categorical
% @canonical false
% @original_name sustainability_certification (no solvents)
% @values no_solvents_toxic_lacquers=No_solvents_or_toxic_lacquers unk_sustainability_certification_no_solvents=Unknown
% @importance 1.0

0.90::acc(s2, sustainability_certification_no_solvents).

0.87::true_val(sustainability_certification_no_solvents, no_solvents_toxic_lacquers); 0.13::true_val(sustainability_certification_no_solvents, unk_sustainability_certification_no_solvents).

measured(s2, sustainability_certification_no_solvents, no_solvents_toxic_lacquers).

all_consistent(sustainability_certification_no_solvents) :- consistent(s2, sustainability_certification_no_solvents).

evidence(all_consistent(sustainability_certification_no_solvents)).
query(true_val(sustainability_certification_no_solvents, no_solvents_toxic_lacquers)).
query(true_val(sustainability_certification_no_solvents, unk_sustainability_certification_no_solvents)).

% @attr sustainability_certification_solventless_ink
% @type categorical
% @canonical false
% @original_name sustainability_certification (solventless ink)
% @values solventless_water_uv_ink=Solventless_water_based_UV_ink unk_sustainability_certification_solventless_ink=Unknown
% @importance 1.0

0.85::acc(s1, sustainability_certification_solventless_ink).

0.71::true_val(sustainability_certification_solventless_ink, solventless_water_uv_ink); 0.29::true_val(sustainability_certification_solventless_ink, unk_sustainability_certification_solventless_ink).

measured(s1, sustainability_certification_solventless_ink, solventless_water_uv_ink).

all_consistent(sustainability_certification_solventless_ink) :- consistent(s1, sustainability_certification_solventless_ink).

evidence(all_consistent(sustainability_certification_solventless_ink)).
query(true_val(sustainability_certification_solventless_ink, solventless_water_uv_ink)).
query(true_val(sustainability_certification_solventless_ink, unk_sustainability_certification_solventless_ink)).