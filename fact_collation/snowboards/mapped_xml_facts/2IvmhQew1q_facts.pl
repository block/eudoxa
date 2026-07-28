0.15::indep(s2).
0.12::indep(s8).
0.12::indep(s12).
0.13::indep(s13).
0.10::indep(s15).
0.15::indep(s22).
0.15::indep(s23).
0.12::indep(s24).
0.10::indep(s25).
0.15::indep(s26).
0.15::indep(s27).
0.15::indep(s28).
0.15::indep(s29).
0.12::indep(s30).
0.12::indep(s31).
0.12::indep(s32).
0.12::indep(s33).
0.10::indep(s34).
0.12::indep(s40).
0.12::indep(s41).
0.15::indep(s42).
0.15::indep(s44).
0.15::indep(s45).
0.12::indep(s47).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values capita=CAPiTA unk_brand=Unknown
% @importance 1.0

0.95::acc(s1, brand).

0.95::true_val(brand, capita); 0.05::true_val(brand, unk_brand).

measured(s1, brand, capita).

all_consistent(brand) :- consistent(s1, brand).

evidence(all_consistent(brand)).
query(true_val(brand, capita)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values kazu_kokubo_pro=Kazu_Kokubo_Pro unk_model_name=Unknown
% @importance 1.0

0.95::acc(s1, model_name).

0.95::true_val(model_name, kazu_kokubo_pro); 0.05::true_val(model_name, unk_model_name).

measured(s1, model_name, kazu_kokubo_pro).

all_consistent(model_name) :- consistent(s1, model_name).

evidence(all_consistent(model_name)).
query(true_val(model_name, kazu_kokubo_pro)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type numeric
% @canonical true
% @original_name model_year
% @values v2027=2027 unk_model_year=Unknown
% @importance 1.0

0.95::acc(s1, model_year).

0.95::true_val(model_year, v2027); 0.05::true_val(model_year, unk_model_year).

measured(s1, model_year, v2027).

all_consistent(model_year) :- consistent(s1, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, v2027)).
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
% @values all_mountain_freeride=All_Mountain_Freeride unk_board_category=Unknown
% @importance 1.0

0.95::acc(s1, board_category).

0.95::true_val(board_category, all_mountain_freeride); 0.05::true_val(board_category, unk_board_category).

measured(s1, board_category, all_mountain_freeride).

all_consistent(board_category) :- consistent(s1, board_category).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain_freeride)).
query(true_val(board_category, unk_board_category)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.4

0.80::acc(s2, gender).

0.63::true_val(gender, mens); 0.37::true_val(gender, unk_gender).

measured(s2, gender, mens).

all_consistent(gender) :-
    (indep(s2), consistent(s2, gender) ; \+indep(s2)).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values kazu_kokubo=Kazu_Kokubo_Kazuhiro_Kokubo_Japanese_professional_snowboarder unk_pro_rider_name=Unknown
% @importance 0.5

0.85::acc(s3, pro_rider_name).
0.93::acc(s4, pro_rider_name).

0.95::true_val(pro_rider_name, kazu_kokubo); 0.05::true_val(pro_rider_name, unk_pro_rider_name).

measured(s3, pro_rider_name, kazu_kokubo).
measured(s4, pro_rider_name, kazu_kokubo).

all_consistent(pro_rider_name) :-
    consistent(s3, pro_rider_name),
    consistent(s4, pro_rider_name).

evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, kazu_kokubo)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr pro_rider_name_bio
% @type categorical
% @canonical false
% @original_name pro_rider_name
% @values backcountry_style_icon=Star_since_age_14_backcountry_and_style_icon unk_pro_rider_name_bio=Unknown
% @importance 0.45

0.90::acc(s4, pro_rider_name_bio).

0.855::true_val(pro_rider_name_bio, backcountry_style_icon); 0.145::true_val(pro_rider_name_bio, unk_pro_rider_name_bio).

measured(s4, pro_rider_name_bio, backcountry_style_icon).

all_consistent(pro_rider_name_bio) :- consistent(s4, pro_rider_name_bio).

evidence(all_consistent(pro_rider_name_bio)).
query(true_val(pro_rider_name_bio, backcountry_style_icon)).
query(true_val(pro_rider_name_bio, unk_pro_rider_name_bio)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2016_17=2016_2017_season unk_model_first_available_year=Unknown
% @importance 0.6

0.85::acc(s5, model_first_available_year).

0.76::true_val(model_first_available_year, season_2016_17); 0.24::true_val(model_first_available_year, unk_model_first_available_year).

measured(s5, model_first_available_year, season_2016_17).

all_consistent(model_first_available_year) :- consistent(s5, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2016_17)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr model_lineage
% @type categorical
% @canonical false
% @original_name Model lineage
% @values longest_running_best_selling=Longest_running_and_best_selling_pro_model unk_model_lineage=Unknown
% @importance 0.4

0.82::acc(s6, model_lineage).

0.72::true_val(model_lineage, longest_running_best_selling); 0.28::true_val(model_lineage, unk_model_lineage).

measured(s6, model_lineage, longest_running_best_selling).

all_consistent(model_lineage) :- consistent(s6, model_lineage).

evidence(all_consistent(model_lineage)).
query(true_val(model_lineage, longest_running_best_selling)).
query(true_val(model_lineage, unk_model_lineage)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values preorder_may_2026=PREORDER_estimated_May_1_2026 unk_availability_status=Unknown
% @importance 1.0

0.92::acc(s1, availability_status).

0.81::true_val(availability_status, preorder_may_2026); 0.19::true_val(availability_status, unk_availability_status).

measured(s1, availability_status, preorder_may_2026).

all_consistent(availability_status) :- consistent(s1, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, preorder_may_2026)).
query(true_val(availability_status, unk_availability_status)).

% @attr design_philosophy
% @type categorical
% @canonical false
% @original_name Design philosophy
% @values compact_quick_agile=Compact_design_for_quick_and_agile_handling unk_design_philosophy=Unknown
% @importance 1.0

0.90::acc(s1, design_philosophy).

0.81::true_val(design_philosophy, compact_quick_agile); 0.19::true_val(design_philosophy, unk_design_philosophy).

measured(s1, design_philosophy, compact_quick_agile).

all_consistent(design_philosophy) :- consistent(s1, design_philosophy).

evidence(all_consistent(design_philosophy)).
query(true_val(design_philosophy, compact_quick_agile)).
query(true_val(design_philosophy, unk_design_philosophy)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values capita_seattle_2000=CAPiTA_Snowboards_founded_Seattle_2000 unk_manufacturer=Unknown
% @importance 0.4

0.92::acc(s7, manufacturer).

0.855::true_val(manufacturer, capita_seattle_2000); 0.145::true_val(manufacturer, unk_manufacturer).

measured(s7, manufacturer, capita_seattle_2000).

all_consistent(manufacturer) :- consistent(s7, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, capita_seattle_2000)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values feistritz_austria_mothership=Feistritz_an_der_Gail_Carinthia_Austria_The_Mothership unk_manufacturing_location=Unknown
% @importance 0.35

0.82::acc(s8, manufacturing_location).

0.71::true_val(manufacturing_location, feistritz_austria_mothership); 0.29::true_val(manufacturing_location, unk_manufacturing_location).

measured(s8, manufacturing_location, feistritz_austria_mothership).

all_consistent(manufacturing_location) :-
    (indep(s8), consistent(s8, manufacturing_location) ; \+indep(s8)).

evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, feistritz_austria_mothership)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values b_corp_98_9=Certified_B_Corporation_B_Impact_Score_98_9 unk_sustainability_certification=Unknown
% @importance 0.45

0.90::acc(s10, sustainability_certification).

0.81::true_val(sustainability_certification, b_corp_98_9); 0.19::true_val(sustainability_certification, unk_sustainability_certification).

measured(s10, sustainability_certification, b_corp_98_9).

all_consistent(sustainability_certification) :- consistent(s10, sustainability_certification).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, b_corp_98_9)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr sustainability_certification_clean_energy
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values clean_energy_hydro_solar=100pct_clean_energy_hydro_NH3_thermal_plus_solar unk_sustainability_certification_clean_energy=Unknown
% @importance 0.5

0.88::acc(s9, sustainability_certification_clean_energy).

0.81::true_val(sustainability_certification_clean_energy, clean_energy_hydro_solar); 0.19::true_val(sustainability_certification_clean_energy, unk_sustainability_certification_clean_energy).

measured(s9, sustainability_certification_clean_energy, clean_energy_hydro_solar).

all_consistent(sustainability_certification_clean_energy) :- consistent(s9, sustainability_certification_clean_energy).

evidence(all_consistent(sustainability_certification_clean_energy)).
query(true_val(sustainability_certification_clean_energy, clean_energy_hydro_solar)).
query(true_val(sustainability_certification_clean_energy, unk_sustainability_certification_clean_energy)).

% @attr sustainability_certification_local_sourcing
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values local_98pct=98pct_locally_sourced_raw_materials unk_sustainability_certification_local_sourcing=Unknown
% @importance 0.35

0.75::acc(s11, sustainability_certification_local_sourcing).

0.50::true_val(sustainability_certification_local_sourcing, local_98pct); 0.50::true_val(sustainability_certification_local_sourcing, unk_sustainability_certification_local_sourcing).

measured(s11, sustainability_certification_local_sourcing, local_98pct).

all_consistent(sustainability_certification_local_sourcing) :- consistent(s11, sustainability_certification_local_sourcing).

evidence(all_consistent(sustainability_certification_local_sourcing)).
query(true_val(sustainability_certification_local_sourcing, local_98pct)).
query(true_val(sustainability_certification_local_sourcing, unk_sustainability_certification_local_sourcing)).

% @attr sustainability_certification_energy_globe
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values energy_globe_austria_2017=Energy_Globe_Award_Austria_2017 unk_sustainability_certification_energy_globe=Unknown
% @importance 0.35

0.78::acc(s12, sustainability_certification_energy_globe).

0.63::true_val(sustainability_certification_energy_globe, energy_globe_austria_2017); 0.37::true_val(sustainability_certification_energy_globe, unk_sustainability_certification_energy_globe).

measured(s12, sustainability_certification_energy_globe, energy_globe_austria_2017).

all_consistent(sustainability_certification_energy_globe) :-
    (indep(s12), consistent(s12, sustainability_certification_energy_globe) ; \+indep(s12)).

evidence(all_consistent(sustainability_certification_energy_globe)).
query(true_val(sustainability_certification_energy_globe, energy_globe_austria_2017)).
query(true_val(sustainability_certification_energy_globe, unk_sustainability_certification_energy_globe)).

% @attr sustainability_certification_fsc
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values fsc_certified_wood=FSC_certified_wood_cores unk_sustainability_certification_fsc=Unknown
% @importance 0.4

0.75::acc(s13, sustainability_certification_fsc).

0.60::true_val(sustainability_certification_fsc, fsc_certified_wood); 0.40::true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc).

measured(s13, sustainability_certification_fsc, fsc_certified_wood).

all_consistent(sustainability_certification_fsc) :-
    (indep(s13), consistent(s13, sustainability_certification_fsc) ; \+indep(s13)).

evidence(all_consistent(sustainability_certification_fsc)).
query(true_val(sustainability_certification_fsc, fsc_certified_wood)).
query(true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc)).

% @attr nfc_technology
% @type categorical
% @canonical false
% @original_name NFC technology
% @values embedded_since_2020=Embedded_NFC_chip_in_nose_since_2020 unk_nfc_technology=Unknown
% @importance 0.3

0.90::acc(s14, nfc_technology).

0.855::true_val(nfc_technology, embedded_since_2020); 0.145::true_val(nfc_technology, unk_nfc_technology).

measured(s14, nfc_technology, embedded_since_2020).

all_consistent(nfc_technology) :- consistent(s14, nfc_technology).

evidence(all_consistent(nfc_technology)).
query(true_val(nfc_technology, embedded_since_2020)).
query(true_val(nfc_technology, unk_nfc_technology)).

% @attr company_mantra
% @type categorical
% @canonical false
% @original_name Company mantra
% @values everything_is_possible=EVERYTHING_IS_POSSIBLE unk_company_mantra=Unknown
% @importance 0.15

0.65::acc(s15, company_mantra).

0.44::true_val(company_mantra, everything_is_possible); 0.56::true_val(company_mantra, unk_company_mantra).

measured(s15, company_mantra, everything_is_possible).

all_consistent(company_mantra) :-
    (indep(s15), consistent(s15, company_mantra) ; \+indep(s15)).

evidence(all_consistent(company_mantra)).
query(true_val(company_mantra, everything_is_possible)).
query(true_val(company_mantra, unk_company_mantra)).

% @attr warranty_period_years
% @type numeric
% @canonical true
% @original_name warranty_period_years
% @unit years
% @values v2=2.0 unk_warranty_period_years=Unknown
% @importance 0.8

0.95::acc(s16, warranty_period_years).

0.90::true_val(warranty_period_years, v2); 0.10::true_val(warranty_period_years, unk_warranty_period_years).

measured(s16, warranty_period_years, v2).

all_consistent(warranty_period_years) :- consistent(s16, warranty_period_years).

evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v2)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values covered_delam_crack_inserts=Topsheet_base_sidewall_delamination_cracking_misaligned_inserts unk_warranty=Unknown
% @importance 0.7

0.95::acc(s17, warranty).

0.90::true_val(warranty, covered_delam_crack_inserts); 0.10::true_val(warranty, unk_warranty).

measured(s17, warranty, covered_delam_crack_inserts).

all_consistent(warranty) :- consistent(s17, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, covered_delam_crack_inserts)).
query(true_val(warranty, unk_warranty)).

% @attr warranty_exclusions
% @type categorical
% @canonical false
% @original_name warranty
% @values not_covered_impact_wear_secondhand=Impact_damage_normal_wear_secondhand_not_covered unk_warranty_exclusions=Unknown
% @importance 0.65

0.95::acc(s18, warranty_exclusions).

0.90::true_val(warranty_exclusions, not_covered_impact_wear_secondhand); 0.10::true_val(warranty_exclusions, unk_warranty_exclusions).

measured(s18, warranty_exclusions, not_covered_impact_wear_secondhand).

all_consistent(warranty_exclusions) :- consistent(s18, warranty_exclusions).

evidence(all_consistent(warranty_exclusions)).
query(true_val(warranty_exclusions, not_covered_impact_wear_secondhand)).
query(true_val(warranty_exclusions, unk_warranty_exclusions)).

% @attr edge_bevel_spec
% @type numeric
% @canonical true
% @original_name edge_bevel_spec
% @unit degrees
% @values v1=1.0 unk_edge_bevel_spec=Unknown
% @importance 0.45

0.88::acc(s19, edge_bevel_spec).

0.77::true_val(edge_bevel_spec, v1); 0.23::true_val(edge_bevel_spec, unk_edge_bevel_spec).

measured(s19, edge_bevel_spec, v1).

all_consistent(edge_bevel_spec) :- consistent(s19, edge_bevel_spec).

evidence(all_consistent(edge_bevel_spec)).
query(true_val(edge_bevel_spec, v1)).
query(true_val(edge_bevel_spec, unk_edge_bevel_spec)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v699_95=699.95 unk_price_usd_msrp=Unknown
% @importance 0.95

0.95::acc(s20, price_usd_msrp).

0.90::true_val(price_usd_msrp, v699_95); 0.10::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s20, price_usd_msrp, v699_95).

all_consistent(price_usd_msrp) :- consistent(s20, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v699_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_eur_blue_tomato
% @type numeric
% @canonical true
% @original_name price_eur_blue_tomato
% @unit EUR
% @values v649=649.0 unk_price_eur_blue_tomato=Unknown
% @importance 0.85

0.95::acc(s21, price_eur_blue_tomato).

0.90::true_val(price_eur_blue_tomato, v649); 0.10::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).

measured(s21, price_eur_blue_tomato, v649).

all_consistent(price_eur_blue_tomato) :- consistent(s21, price_eur_blue_tomato).

evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v649)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

% @attr price_aud_merchant
% @type numeric
% @canonical true
% @original_name price_aud_merchant
% @unit AUD
% @values v1249_99=1249.99 unk_price_aud_merchant=Unknown
% @importance 1.0

0.93::acc(s1, price_aud_merchant).

0.81::true_val(price_aud_merchant, v1249_99); 0.19::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s1, price_aud_merchant, v1249_99).

all_consistent(price_aud_merchant) :- consistent(s1, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v1249_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_usd_evo
% @type numeric
% @canonical true
% @original_name price_usd_evo
% @unit USD
% @values v559_96=559.96 unk_price_usd_evo=Unknown
% @importance 0.85

0.88::acc(s22, price_usd_evo).

0.68::true_val(price_usd_evo, v559_96); 0.32::true_val(price_usd_evo, unk_price_usd_evo).

measured(s22, price_usd_evo, v559_96).

all_consistent(price_usd_evo) :-
    (indep(s22), consistent(s22, price_usd_evo) ; \+indep(s22)).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v559_96)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_tactics
% @type numeric
% @canonical true
% @original_name price_usd_tactics
% @unit USD
% @values v559_95=559.95 unk_price_usd_tactics=Unknown
% @importance 0.85

0.88::acc(s23, price_usd_tactics).

0.68::true_val(price_usd_tactics, v559_95); 0.32::true_val(price_usd_tactics, unk_price_usd_tactics).

measured(s23, price_usd_tactics, v559_95).

all_consistent(price_usd_tactics) :-
    (indep(s23), consistent(s23, price_usd_tactics) ; \+indep(s23)).

evidence(all_consistent(price_usd_tactics)).
query(true_val(price_usd_tactics, v559_95)).
query(true_val(price_usd_tactics, unk_price_usd_tactics)).

% @attr price_usd_the_house
% @type numeric
% @canonical false
% @original_name Sale price at The House (2026 model)
% @unit USD
% @values v559_95_house=559.95 unk_price_usd_the_house=Unknown
% @importance 0.85

0.82::acc(s24, price_usd_the_house).

0.64::true_val(price_usd_the_house, v559_95_house); 0.36::true_val(price_usd_the_house, unk_price_usd_the_house).

measured(s24, price_usd_the_house, v559_95_house).

all_consistent(price_usd_the_house) :-
    (indep(s24), consistent(s24, price_usd_the_house) ; \+indep(s24)).

evidence(all_consistent(price_usd_the_house)).
query(true_val(price_usd_the_house, v559_95_house)).
query(true_val(price_usd_the_house, unk_price_usd_the_house)).

% @attr price_usd_spokex
% @type numeric
% @canonical false
% @original_name Sale price at SpokeX (2026 model)
% @unit USD
% @values v489_97=489.97 unk_price_usd_spokex=Unknown
% @importance 0.8

0.75::acc(s25, price_usd_spokex).

0.51::true_val(price_usd_spokex, v489_97); 0.49::true_val(price_usd_spokex, unk_price_usd_spokex).

measured(s25, price_usd_spokex, v489_97).

all_consistent(price_usd_spokex) :-
    (indep(s25), consistent(s25, price_usd_spokex) ; \+indep(s25)).

evidence(all_consistent(price_usd_spokex)).
query(true_val(price_usd_spokex, v489_97)).
query(true_val(price_usd_spokex, unk_price_usd_spokex)).

% @attr price_usd_backcountry
% @type numeric
% @canonical true
% @original_name price_usd_backcountry
% @unit USD
% @values v559_96_bc=559.96 unk_price_usd_backcountry=Unknown
% @importance 0.8

0.78::acc(s26, price_usd_backcountry).

0.56::true_val(price_usd_backcountry, v559_96_bc); 0.44::true_val(price_usd_backcountry, unk_price_usd_backcountry).

measured(s26, price_usd_backcountry, v559_96_bc).

all_consistent(price_usd_backcountry) :-
    (indep(s26), consistent(s26, price_usd_backcountry) ; \+indep(s26)).

evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v559_96_bc)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

% @attr price_usd_christy_sports
% @type numeric
% @canonical false
% @original_name Price at Christy Sports (wide version, 2026 model)
% @unit USD
% @values v649_95=649.95 unk_price_usd_christy_sports=Unknown
% @importance 0.8

0.78::acc(s27, price_usd_christy_sports).

0.56::true_val(price_usd_christy_sports, v649_95); 0.44::true_val(price_usd_christy_sports, unk_price_usd_christy_sports).

measured(s27, price_usd_christy_sports, v649_95).

all_consistent(price_usd_christy_sports) :-
    (indep(s27), consistent(s27, price_usd_christy_sports) ; \+indep(s27)).

evidence(all_consistent(price_usd_christy_sports)).
query(true_val(price_usd_christy_sports, v649_95)).
query(true_val(price_usd_christy_sports, unk_price_usd_christy_sports)).

% @attr available_capita_direct
% @type categorical
% @canonical false
% @original_name Available at CAPiTA direct
% @values yes=Available unk_available_capita_direct=Unknown
% @importance 0.95

0.95::acc(s20, available_capita_direct).

0.90::true_val(available_capita_direct, yes); 0.10::true_val(available_capita_direct, unk_available_capita_direct).

measured(s20, available_capita_direct, yes).

all_consistent(available_capita_direct) :- consistent(s20, available_capita_direct).

evidence(all_consistent(available_capita_direct)).
query(true_val(available_capita_direct, yes)).
query(true_val(available_capita_direct, unk_available_capita_direct)).

% @attr available_evo
% @type categorical
% @canonical false
% @original_name Available at evo.com
% @values yes=Available unk_available_evo=Unknown
% @importance 0.85

0.85::acc(s22, available_evo).

0.68::true_val(available_evo, yes); 0.32::true_val(available_evo, unk_available_evo).

measured(s22, available_evo, yes).

all_consistent(available_evo) :-
    (indep(s22), consistent(s22, available_evo) ; \+indep(s22)).

evidence(all_consistent(available_evo)).
query(true_val(available_evo, yes)).
query(true_val(available_evo, unk_available_evo)).

% @attr available_rei
% @type categorical
% @canonical false
% @original_name Available at REI
% @values yes=Available unk_available_rei=Unknown
% @importance 0.7

0.85::acc(s28, available_rei).

0.77::true_val(available_rei, yes); 0.23::true_val(available_rei, unk_available_rei).

measured(s28, available_rei, yes).

all_consistent(available_rei) :-
    (indep(s28), consistent(s28, available_rei) ; \+indep(s28)).

evidence(all_consistent(available_rei)).
query(true_val(available_rei, yes)).
query(true_val(available_rei, unk_available_rei)).

% @attr available_backcountry
% @type categorical
% @canonical false
% @original_name Available at Backcountry.com
% @values yes=Available unk_available_backcountry=Unknown
% @importance 0.8

0.78::acc(s26, available_backcountry).

0.56::true_val(available_backcountry, yes); 0.44::true_val(available_backcountry, unk_available_backcountry).

measured(s26, available_backcountry, yes).

all_consistent(available_backcountry) :-
    (indep(s26), consistent(s26, available_backcountry) ; \+indep(s26)).

evidence(all_consistent(available_backcountry)).
query(true_val(available_backcountry, yes)).
query(true_val(available_backcountry, unk_available_backcountry)).

% @attr available_tactics
% @type categorical
% @canonical false
% @original_name Available at Tactics.com
% @values yes=Available unk_available_tactics=Unknown
% @importance 0.6

0.80::acc(s29, available_tactics).

0.60::true_val(available_tactics, yes); 0.40::true_val(available_tactics, unk_available_tactics).

measured(s29, available_tactics, yes).

all_consistent(available_tactics) :-
    (indep(s29), consistent(s29, available_tactics) ; \+indep(s29)).

evidence(all_consistent(available_tactics)).
query(true_val(available_tactics, yes)).
query(true_val(available_tactics, unk_available_tactics)).

% @attr available_the_house
% @type categorical
% @canonical false
% @original_name Available at The House
% @values yes=Available unk_available_the_house=Unknown
% @importance 0.85

0.80::acc(s24, available_the_house).

0.64::true_val(available_the_house, yes); 0.36::true_val(available_the_house, unk_available_the_house).

measured(s24, available_the_house, yes).

all_consistent(available_the_house) :-
    (indep(s24), consistent(s24, available_the_house) ; \+indep(s24)).

evidence(all_consistent(available_the_house)).
query(true_val(available_the_house, yes)).
query(true_val(available_the_house, unk_available_the_house)).

% @attr available_spokex
% @type categorical
% @canonical false
% @original_name Available at SpokeX Bike Co.
% @values yes=Available unk_available_spokex=Unknown
% @importance 0.8

0.72::acc(s25, available_spokex).

0.51::true_val(available_spokex, yes); 0.49::true_val(available_spokex, unk_available_spokex).

measured(s25, available_spokex, yes).

all_consistent(available_spokex) :-
    (indep(s25), consistent(s25, available_spokex) ; \+indep(s25)).

evidence(all_consistent(available_spokex)).
query(true_val(available_spokex, yes)).
query(true_val(available_spokex, unk_available_spokex)).

% @attr available_christy_sports
% @type categorical
% @canonical false
% @original_name Available at Christy Sports
% @values yes=Available unk_available_christy_sports=Unknown
% @importance 0.8

0.78::acc(s27, available_christy_sports).

0.56::true_val(available_christy_sports, yes); 0.44::true_val(available_christy_sports, unk_available_christy_sports).

measured(s27, available_christy_sports, yes).

all_consistent(available_christy_sports) :-
    (indep(s27), consistent(s27, available_christy_sports) ; \+indep(s27)).

evidence(all_consistent(available_christy_sports)).
query(true_val(available_christy_sports, yes)).
query(true_val(available_christy_sports, unk_available_christy_sports)).

% @attr available_blauer
% @type categorical
% @canonical false
% @original_name Available at Blauer Board Shop
% @values yes=Available unk_available_blauer=Unknown
% @importance 0.5

0.70::acc(s30, available_blauer).

0.46::true_val(available_blauer, yes); 0.54::true_val(available_blauer, unk_available_blauer).

measured(s30, available_blauer, yes).

all_consistent(available_blauer) :-
    (indep(s30), consistent(s30, available_blauer) ; \+indep(s30)).

evidence(all_consistent(available_blauer)).
query(true_val(available_blauer, yes)).
query(true_val(available_blauer, unk_available_blauer)).

% @attr available_auski
% @type categorical
% @canonical false
% @original_name Available at Auski Australia (2027 model)
% @values yes=Available unk_available_auski=Unknown
% @importance 0.6

0.78::acc(s31, available_auski).

0.60::true_val(available_auski, yes); 0.40::true_val(available_auski, unk_available_auski).

measured(s31, available_auski, yes).

all_consistent(available_auski) :-
    (indep(s31), consistent(s31, available_auski) ; \+indep(s31)).

evidence(all_consistent(available_auski)).
query(true_val(available_auski, yes)).
query(true_val(available_auski, unk_available_auski)).

% @attr available_rhythm
% @type categorical
% @canonical false
% @original_name Available at Rhythm Snow Sports Australia (2027 model)
% @values yes=Available unk_available_rhythm=Unknown
% @importance 0.6

0.78::acc(s32, available_rhythm).

0.60::true_val(available_rhythm, yes); 0.40::true_val(available_rhythm, unk_available_rhythm).

measured(s32, available_rhythm, yes).

all_consistent(available_rhythm) :-
    (indep(s32), consistent(s32, available_rhythm) ; \+indep(s32)).

evidence(all_consistent(available_rhythm)).
query(true_val(available_rhythm, yes)).
query(true_val(available_rhythm, unk_available_rhythm)).

% @attr available_whiteroom
% @type categorical
% @canonical false
% @original_name Available at Whiteroom Snow Australia (2027 model)
% @values yes=Available unk_available_whiteroom=Unknown
% @importance 0.55

0.75::acc(s33, available_whiteroom).

0.55::true_val(available_whiteroom, yes); 0.45::true_val(available_whiteroom, unk_available_whiteroom).

measured(s33, available_whiteroom, yes).

all_consistent(available_whiteroom) :-
    (indep(s33), consistent(s33, available_whiteroom) ; \+indep(s33)).

evidence(all_consistent(available_whiteroom)).
query(true_val(available_whiteroom, yes)).
query(true_val(available_whiteroom, unk_available_whiteroom)).

% @attr available_ebay
% @type categorical
% @canonical false
% @original_name Available on eBay
% @values yes=Available unk_available_ebay=Unknown
% @importance 0.5

0.60::acc(s34, available_ebay).

0.38::true_val(available_ebay, yes); 0.62::true_val(available_ebay, unk_available_ebay).

measured(s34, available_ebay, yes).

all_consistent(available_ebay) :-
    (indep(s34), consistent(s34, available_ebay) ; \+indep(s34)).

evidence(all_consistent(available_ebay)).
query(true_val(available_ebay, yes)).
query(true_val(available_ebay, unk_available_ebay)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 1.0

0.93::acc(s1, shape).
0.93::acc(s35, shape).

0.95::true_val(shape, tapered_directional); 0.05::true_val(shape, unk_shape).

measured(s1, shape, tapered_directional).
measured(s35, shape, tapered_directional).

all_consistent(shape) :-
    consistent(s1, shape),
    consistent(s35, shape).

evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

% @attr setback
% @type numeric
% @canonical true
% @original_name setback
% @unit cm
% @values v2_0=2.0 unk_setback=Unknown
% @importance 1.0

0.90::acc(s1, setback).
0.93::acc(s35, setback).

0.95::true_val(setback, v2_0); 0.05::true_val(setback, unk_setback).

measured(s1, setback, v2_0).
measured(s35, setback, v2_0).

all_consistent(setback) :-
    consistent(s1, setback),
    consistent(s35, setback).

evidence(all_consistent(setback)).
query(true_val(setback, v2_0)).
query(true_val(setback, unk_setback)).

% @attr flex_rating_10_manufacturer
% @type numeric
% @canonical true
% @original_name flex_rating_10_manufacturer
% @unit /10
% @values v7=7.0 v6_5=6.5
% @importance 1.0

0.88::acc(s1, flex_rating_10_manufacturer).
0.82::acc(s35, flex_rating_10_manufacturer).

0.55::true_val(flex_rating_10_manufacturer, v7); 0.45::true_val(flex_rating_10_manufacturer, v6_5).

measured(s1, flex_rating_10_manufacturer, v7).
measured(s35, flex_rating_10_manufacturer, v6_5).

all_consistent(flex_rating_10_manufacturer) :-
    consistent(s1, flex_rating_10_manufacturer),
    consistent(s35, flex_rating_10_manufacturer).

evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, v7)).
query(true_val(flex_rating_10_manufacturer, v6_5)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values stiffer_than_rated=Stiffer_than_rated_6_5 unk_flex_feel=Unknown
% @importance 0.8

0.80::acc(s36, flex_feel).

0.60::true_val(flex_feel, stiffer_than_rated); 0.40::true_val(flex_feel, unk_flex_feel).

measured(s36, flex_feel, stiffer_than_rated).

all_consistent(flex_feel) :- consistent(s36, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, stiffer_than_rated)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr flex_feel_medium_stiff
% @type categorical
% @canonical false
% @original_name flex_feel
% @values medium_stiff=Pretty_medium_stiff_flex unk_flex_feel_medium_stiff=Unknown
% @importance 0.85

0.82::acc(s37, flex_feel_medium_stiff).

0.68::true_val(flex_feel_medium_stiff, medium_stiff); 0.32::true_val(flex_feel_medium_stiff, unk_flex_feel_medium_stiff).

measured(s37, flex_feel_medium_stiff, medium_stiff).

all_consistent(flex_feel_medium_stiff) :- consistent(s37, flex_feel_medium_stiff).

evidence(all_consistent(flex_feel_medium_stiff)).
query(true_val(flex_feel_medium_stiff, medium_stiff)).
query(true_val(flex_feel_medium_stiff, unk_flex_feel_medium_stiff)).

% @attr flex_feel_directional
% @type categorical
% @canonical false
% @original_name flex_feel
% @values directional_pattern=Directional_flex_pattern unk_flex_feel_directional=Unknown
% @importance 1.0

0.93::acc(s35, flex_feel_directional).

0.90::true_val(flex_feel_directional, directional_pattern); 0.10::true_val(flex_feel_directional, unk_flex_feel_directional).

measured(s35, flex_feel_directional, directional_pattern).

all_consistent(flex_feel_directional) :- consistent(s35, flex_feel_directional).

evidence(all_consistent(flex_feel_directional)).
query(true_val(flex_feel_directional, directional_pattern)).
query(true_val(flex_feel_directional, unk_flex_feel_directional)).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values stiffer_tail=Stiffer_in_the_tail unk_flex_direction=Unknown
% @importance 0.7

0.80::acc(s38, flex_direction).

0.60::true_val(flex_direction, stiffer_tail); 0.40::true_val(flex_direction, unk_flex_direction).

measured(s38, flex_direction, stiffer_tail).

all_consistent(flex_direction) :- consistent(s38, flex_direction).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, stiffer_tail)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values merchant_2027=151_154_157_160_155W_158W_161W capita_26_27=155_158_161_164_167
% @importance 1.0

0.88::acc(s1, available_sizes).
0.85::acc(s20, available_sizes).

0.55::true_val(available_sizes, merchant_2027); 0.45::true_val(available_sizes, capita_26_27).

measured(s1, available_sizes, merchant_2027).
measured(s20, available_sizes, capita_26_27).

all_consistent(available_sizes) :-
    consistent(s1, available_sizes),
    consistent(s20, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, merchant_2027)).
query(true_val(available_sizes, capita_26_27)).

% @attr width_options
% @type categorical
% @canonical true
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 1.0

0.93::acc(s1, width_options).

0.81::true_val(width_options, standard_and_wide); 0.19::true_val(width_options, unk_width_options).

measured(s1, width_options, standard_and_wide).

all_consistent(width_options) :- consistent(s1, width_options).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts_stainless_steel unk_mounting_pattern=Unknown
% @importance 1.0

0.93::acc(s1, mounting_pattern).

0.81::true_val(mounting_pattern, inserts_2x4); 0.19::true_val(mounting_pattern, unk_mounting_pattern).

measured(s1, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :- consistent(s1, mounting_pattern).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr effective_edge_151
% @type numeric
% @canonical false
% @original_name Effective edge 151cm
% @unit mm
% @values v1170=1170.0 v1171=1171.0
% @importance 1.0

0.88::acc(s1, effective_edge_151).
0.90::acc(s35, effective_edge_151).

0.50::true_val(effective_edge_151, v1170); 0.50::true_val(effective_edge_151, v1171).

measured(s1, effective_edge_151, v1170).
measured(s35, effective_edge_151, v1171).

all_consistent(effective_edge_151) :-
    consistent(s1, effective_edge_151),
    consistent(s35, effective_edge_151).

evidence(all_consistent(effective_edge_151)).
query(true_val(effective_edge_151, v1170)).
query(true_val(effective_edge_151, v1171)).

% @attr sidecut_radius_size
% @type numeric
% @canonical true
% @original_name sidecut_radius_size
% @unit m
% @values v8_4=8.4 unk_sidecut_radius_size=Unknown
% @importance 1.0

0.90::acc(s1, sidecut_radius_size).

0.81::true_val(sidecut_radius_size, v8_4); 0.19::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s1, sidecut_radius_size, v8_4).

all_consistent(sidecut_radius_size) :- consistent(s1, sidecut_radius_size).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v8_4)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr sidecut_radius_size_151
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v8_0=8.0 unk_sidecut_radius_size_151=Unknown
% @importance 1.0

0.90::acc(s1, sidecut_radius_size_151).

0.81::true_val(sidecut_radius_size_151, v8_0); 0.19::true_val(sidecut_radius_size_151, unk_sidecut_radius_size_151).

measured(s1, sidecut_radius_size_151, v8_0).

all_consistent(sidecut_radius_size_151) :- consistent(s1, sidecut_radius_size_151).

evidence(all_consistent(sidecut_radius_size_151)).
query(true_val(sidecut_radius_size_151, v8_0)).
query(true_val(sidecut_radius_size_151, unk_sidecut_radius_size_151)).

% @attr tip_tail_width_size
% @type categorical
% @canonical true
% @original_name tip_tail_width_size
% @unit cm
% @values v30_4_29_5=30.4/29.5 unk_tip_tail_width_size=Unknown
% @importance 1.0

0.90::acc(s1, tip_tail_width_size).

0.81::true_val(tip_tail_width_size, v30_4_29_5); 0.19::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s1, tip_tail_width_size, v30_4_29_5).

all_consistent(tip_tail_width_size) :- consistent(s1, tip_tail_width_size).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v30_4_29_5)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr tip_tail_width_size_151
% @type categorical
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v29_6_28_9=29.6/28.9 unk_tip_tail_width_size_151=Unknown
% @importance 1.0

0.90::acc(s1, tip_tail_width_size_151).

0.81::true_val(tip_tail_width_size_151, v29_6_28_9); 0.19::true_val(tip_tail_width_size_151, unk_tip_tail_width_size_151).

measured(s1, tip_tail_width_size_151, v29_6_28_9).

all_consistent(tip_tail_width_size_151) :- consistent(s1, tip_tail_width_size_151).

evidence(all_consistent(tip_tail_width_size_151)).
query(true_val(tip_tail_width_size_151, v29_6_28_9)).
query(true_val(tip_tail_width_size_151, unk_tip_tail_width_size_151)).

% @attr waist_width_151
% @type numeric
% @canonical false
% @original_name Waist width 151cm
% @unit cm
% @values v25_1=25.1 unk_waist_width_151=Unknown
% @importance 1.0

0.90::acc(s1, waist_width_151).

0.81::true_val(waist_width_151, v25_1); 0.19::true_val(waist_width_151, unk_waist_width_151).

measured(s1, waist_width_151, v25_1).

all_consistent(waist_width_151) :- consistent(s1, waist_width_151).

evidence(all_consistent(waist_width_151)).
query(true_val(waist_width_151, v25_1)).
query(true_val(waist_width_151, unk_waist_width_151)).

% @attr stance_width_range_size
% @type numeric
% @canonical true
% @original_name stance_width_range_size
% @unit cm
% @values v55_9=55.9 unk_stance_width_range_size=Unknown
% @importance 1.0

0.90::acc(s1, stance_width_range_size).

0.81::true_val(stance_width_range_size, v55_9); 0.19::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s1, stance_width_range_size, v55_9).

all_consistent(stance_width_range_size) :- consistent(s1, stance_width_range_size).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v55_9)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr stance_width_range_size_151
% @type numeric
% @canonical false
% @original_name stance_width_range_size
% @unit cm
% @values v53_3=53.3 unk_stance_width_range_size_151=Unknown
% @importance 1.0

0.90::acc(s1, stance_width_range_size_151).

0.81::true_val(stance_width_range_size_151, v53_3); 0.19::true_val(stance_width_range_size_151, unk_stance_width_range_size_151).

measured(s1, stance_width_range_size_151, v53_3).

all_consistent(stance_width_range_size_151) :- consistent(s1, stance_width_range_size_151).

evidence(all_consistent(stance_width_range_size_151)).
query(true_val(stance_width_range_size_151, v53_3)).
query(true_val(stance_width_range_size_151, unk_stance_width_range_size_151)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size
% @unit kg
% @values v59_86=59-86 unk_recommended_weight_range_size=Unknown
% @importance 1.0

0.90::acc(s1, recommended_weight_range_size).

0.81::true_val(recommended_weight_range_size, v59_86); 0.19::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s1, recommended_weight_range_size, v59_86).

all_consistent(recommended_weight_range_size) :- consistent(s1, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, v59_86)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr recommended_weight_range_size_151
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @unit kg
% @values v45_68=45-68 unk_recommended_weight_range_size_151=Unknown
% @importance 1.0

0.90::acc(s1, recommended_weight_range_size_151).

0.81::true_val(recommended_weight_range_size_151, v45_68); 0.19::true_val(recommended_weight_range_size_151, unk_recommended_weight_range_size_151).

measured(s1, recommended_weight_range_size_151, v45_68).

all_consistent(recommended_weight_range_size_151) :- consistent(s1, recommended_weight_range_size_151).

evidence(all_consistent(recommended_weight_range_size_151)).
query(true_val(recommended_weight_range_size_151, v45_68)).
query(true_val(recommended_weight_range_size_151, unk_recommended_weight_range_size_151)).

% @attr effective_edge_154
% @type numeric
% @canonical false
% @original_name Effective edge 154cm
% @unit mm
% @values v1200=1200.0 unk_effective_edge_154=Unknown
% @importance 1.0

0.90::acc(s1, effective_edge_154).

0.81::true_val(effective_edge_154, v1200); 0.19::true_val(effective_edge_154, unk_effective_edge_154).

measured(s1, effective_edge_154, v1200).

all_consistent(effective_edge_154) :- consistent(s1, effective_edge_154).

evidence(all_consistent(effective_edge_154)).
query(true_val(effective_edge_154, v1200)).
query(true_val(effective_edge_154, unk_effective_edge_154)).

% @attr sidecut_radius_size_154
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v8_2=8.2 unk_sidecut_radius_size_154=Unknown
% @importance 1.0

0.90::acc(s1, sidecut_radius_size_154).

0.81::true_val(sidecut_radius_size_154, v8_2); 0.19::true_val(sidecut_radius_size_154, unk_sidecut_radius_size_154).

measured(s1, sidecut_radius_size_154, v8_2).

all_consistent(sidecut_radius_size_154) :- consistent(s1, sidecut_radius_size_154).

evidence(all_consistent(sidecut_radius_size_154)).
query(true_val(sidecut_radius_size_154, v8_2)).
query(true_val(sidecut_radius_size_154, unk_sidecut_radius_size_154)).

% @attr tip_tail_width_size_154
% @type categorical
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v30_0_29_2=30.0/29.2 unk_tip_tail_width_size_154=Unknown
% @importance 1.0

0.90::acc(s1, tip_tail_width_size_154).

0.81::true_val(tip_tail_width_size_154, v30_0_29_2); 0.19::true_val(tip_tail_width_size_154, unk_tip_tail_width_size_154).

measured(s1, tip_tail_width_size_154, v30_0_29_2).

all_consistent(tip_tail_width_size_154) :- consistent(s1, tip_tail_width_size_154).

evidence(all_consistent(tip_tail_width_size_154)).
query(true_val(tip_tail_width_size_154, v30_0_29_2)).
query(true_val(tip_tail_width_size_154, unk_tip_tail_width_size_154)).

% @attr waist_width_154
% @type numeric
% @canonical false
% @original_name Waist width 154cm
% @unit cm
% @values v25_3=25.3 unk_waist_width_154=Unknown
% @importance 1.0

0.90::acc(s1, waist_width_154).

0.81::true_val(waist_width_154, v25_3); 0.19::true_val(waist_width_154, unk_waist_width_154).

measured(s1, waist_width_154, v25_3).

all_consistent(waist_width_154) :- consistent(s1, waist_width_154).

evidence(all_consistent(waist_width_154)).
query(true_val(waist_width_154, v25_3)).
query(true_val(waist_width_154, unk_waist_width_154)).

% @attr stance_width_range_size_154
% @type numeric
% @canonical false
% @original_name stance_width_range_size
% @unit cm
% @values v53_3_154=53.3 unk_stance_width_range_size_154=Unknown
% @importance 1.0

0.90::acc(s1, stance_width_range_size_154).

0.81::true_val(stance_width_range_size_154, v53_3_154); 0.19::true_val(stance_width_range_size_154, unk_stance_width_range_size_154).

measured(s1, stance_width_range_size_154, v53_3_154).

all_consistent(stance_width_range_size_154) :- consistent(s1, stance_width_range_size_154).

evidence(all_consistent(stance_width_range_size_154)).
query(true_val(stance_width_range_size_154, v53_3_154)).
query(true_val(stance_width_range_size_154, unk_stance_width_range_size_154)).

% @attr recommended_weight_range_size_154
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @unit kg
% @values v45_72=45-72 unk_recommended_weight_range_size_154=Unknown
% @importance 1.0

0.90::acc(s1, recommended_weight_range_size_154).

0.81::true_val(recommended_weight_range_size_154, v45_72); 0.19::true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154).

measured(s1, recommended_weight_range_size_154, v45_72).

all_consistent(recommended_weight_range_size_154) :- consistent(s1, recommended_weight_range_size_154).

evidence(all_consistent(recommended_weight_range_size_154)).
query(true_val(recommended_weight_range_size_154, v45_72)).
query(true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154)).

% @attr effective_edge_157
% @type numeric
% @canonical false
% @original_name Effective edge 157cm
% @unit mm
% @values v1222=1222.0 unk_effective_edge_157=Unknown
% @importance 1.0

0.90::acc(s1, effective_edge_157).

0.81::true_val(effective_edge_157, v1222); 0.19::true_val(effective_edge_157, unk_effective_edge_157).

measured(s1, effective_edge_157, v1222).

all_consistent(effective_edge_157) :- consistent(s1, effective_edge_157).

evidence(all_consistent(effective_edge_157)).
query(true_val(effective_edge_157, v1222)).
query(true_val(effective_edge_157, unk_effective_edge_157)).

% @attr waist_width_157
% @type numeric
% @canonical false
% @original_name Waist width 157cm
% @unit cm
% @values v25_5=25.5 unk_waist_width_157=Unknown
% @importance 1.0

0.90::acc(s1, waist_width_157).

0.81::true_val(waist_width_157, v25_5); 0.19::true_val(waist_width_157, unk_waist_width_157).

measured(s1, waist_width_157, v25_5).

all_consistent(waist_width_157) :- consistent(s1, waist_width_157).

evidence(all_consistent(waist_width_157)).
query(true_val(waist_width_157, v25_5)).
query(true_val(waist_width_157, unk_waist_width_157)).

% @attr effective_edge_160
% @type numeric
% @canonical false
% @original_name Effective edge 160cm
% @unit mm
% @values v1254=1254.0 unk_effective_edge_160=Unknown
% @importance 1.0

0.90::acc(s1, effective_edge_160).

0.81::true_val(effective_edge_160, v1254); 0.19::true_val(effective_edge_160, unk_effective_edge_160).

measured(s1, effective_edge_160, v1254).

all_consistent(effective_edge_160) :- consistent(s1, effective_edge_160).

evidence(all_consistent(effective_edge_160)).
query(true_val(effective_edge_160, v1254)).
query(true_val(effective_edge_160, unk_effective_edge_160)).

% @attr sidecut_radius_size_160
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v8_6=8.6 unk_sidecut_radius_size_160=Unknown
% @importance 1.0

0.90::acc(s1, sidecut_radius_size_160).

0.81::true_val(sidecut_radius_size_160, v8_6); 0.19::true_val(sidecut_radius_size_160, unk_sidecut_radius_size_160).

measured(s1, sidecut_radius_size_160, v8_6).

all_consistent(sidecut_radius_size_160) :- consistent(s1, sidecut_radius_size_160).

evidence(all_consistent(sidecut_radius_size_160)).
query(true_val(sidecut_radius_size_160, v8_6)).
query(true_val(sidecut_radius_size_160, unk_sidecut_radius_size_160)).

% @attr waist_width_160
% @type numeric
% @canonical false
% @original_name Waist width 160cm
% @unit cm
% @values v25_7=25.7 unk_waist_width_160=Unknown
% @importance 1.0

0.90::acc(s1, waist_width_160).

0.81::true_val(waist_width_160, v25_7); 0.19::true_val(waist_width_160, unk_waist_width_160).

measured(s1, waist_width_160, v25_7).

all_consistent(waist_width_160) :- consistent(s1, waist_width_160).

evidence(all_consistent(waist_width_160)).
query(true_val(waist_width_160, v25_7)).
query(true_val(waist_width_160, unk_waist_width_160)).

% @attr stance_width_range_size_160
% @type numeric
% @canonical false
% @original_name stance_width_range_size
% @unit cm
% @values v58_4=58.4 unk_stance_width_range_size_160=Unknown
% @importance 1.0

0.90::acc(s1, stance_width_range_size_160).

0.81::true_val(stance_width_range_size_160, v58_4); 0.19::true_val(stance_width_range_size_160, unk_stance_width_range_size_160).

measured(s1, stance_width_range_size_160, v58_4).

all_consistent(stance_width_range_size_160) :- consistent(s1, stance_width_range_size_160).

evidence(all_consistent(stance_width_range_size_160)).
query(true_val(stance_width_range_size_160, v58_4)).
query(true_val(stance_width_range_size_160, unk_stance_width_range_size_160)).

% @attr recommended_weight_range_size_160
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @unit kg
% @values v63_90=63-90 unk_recommended_weight_range_size_160=Unknown
% @importance 1.0

0.90::acc(s1, recommended_weight_range_size_160).

0.81::true_val(recommended_weight_range_size_160, v63_90); 0.19::true_val(recommended_weight_range_size_160, unk_recommended_weight_range_size_160).

measured(s1, recommended_weight_range_size_160, v63_90).

all_consistent(recommended_weight_range_size_160) :- consistent(s1, recommended_weight_range_size_160).

evidence(all_consistent(recommended_weight_range_size_160)).
query(true_val(recommended_weight_range_size_160, v63_90)).
query(true_val(recommended_weight_range_size_160, unk_recommended_weight_range_size_160)).

% @attr effective_edge_155w
% @type numeric
% @canonical false
% @original_name Effective edge 155W
% @unit mm
% @values v1214=1214.0 unk_effective_edge_155w=Unknown
% @importance 1.0

0.90::acc(s1, effective_edge_155w).

0.81::true_val(effective_edge_155w, v1214); 0.19::true_val(effective_edge_155w, unk_effective_edge_155w).

measured(s1, effective_edge_155w, v1214).

all_consistent(effective_edge_155w) :- consistent(s1, effective_edge_155w).

evidence(all_consistent(effective_edge_155w)).
query(true_val(effective_edge_155w, v1214)).
query(true_val(effective_edge_155w, unk_effective_edge_155w)).

% @attr waist_width_155w
% @type numeric
% @canonical false
% @original_name Waist width 155W
% @unit cm
% @values v26_3=26.3 unk_waist_width_155w=Unknown
% @importance 1.0

0.90::acc(s1, waist_width_155w).

0.81::true_val(waist_width_155w, v26_3); 0.19::true_val(waist_width_155w, unk_waist_width_155w).

measured(s1, waist_width_155w, v26_3).

all_consistent(waist_width_155w) :- consistent(s1, waist_width_155w).

evidence(all_consistent(waist_width_155w)).
query(true_val(waist_width_155w, v26_3)).
query(true_val(waist_width_155w, unk_waist_width_155w)).

% @attr recommended_weight_range_size_155w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @unit kg
% @values v50_77=50-77 unk_recommended_weight_range_size_155w=Unknown
% @importance 1.0

0.90::acc(s1, recommended_weight_range_size_155w).

0.81::true_val(recommended_weight_range_size_155w, v50_77); 0.19::true_val(recommended_weight_range_size_155w, unk_recommended_weight_range_size_155w).

measured(s1, recommended_weight_range_size_155w, v50_77).

all_consistent(recommended_weight_range_size_155w) :- consistent(s1, recommended_weight_range_size_155w).

evidence(all_consistent(recommended_weight_range_size_155w)).
query(true_val(recommended_weight_range_size_155w, v50_77)).
query(true_val(recommended_weight_range_size_155w, unk_recommended_weight_range_size_155w)).

% @attr effective_edge_158w
% @type numeric
% @canonical false
% @original_name Effective edge 158W
% @unit mm
% @values v1244=1244.0 unk_effective_edge_158w=Unknown
% @importance 1.0

0.90::acc(s1, effective_edge_158w).

0.81::true_val(effective_edge_158w, v1244); 0.19::true_val(effective_edge_158w, unk_effective_edge_158w).

measured(s1, effective_edge_158w, v1244).

all_consistent(effective_edge_158w) :- consistent(s1, effective_edge_158w).

evidence(all_consistent(effective_edge_158w)).
query(true_val(effective_edge_158w, v1244)).
query(true_val(effective_edge_158w, unk_effective_edge_158w)).

% @attr waist_width_158w
% @type numeric
% @canonical false
% @original_name Waist width 158W
% @unit cm
% @values v26_5=26.5 unk_waist_width_158w=Unknown
% @importance 1.0

0.90::acc(s1, waist_width_158w).

0.81::true_val(waist_width_158w, v26_5); 0.19::true_val(waist_width_158w, unk_waist_width_158w).

measured(s1, waist_width_158w, v26_5).

all_consistent(waist_width_158w) :- consistent(s1, waist_width_158w).

evidence(all_consistent(waist_width_158w)).
query(true_val(waist_width_158w, v26_5)).
query(true_val(waist_width_158w, unk_waist_width_158w)).

% @attr recommended_weight_range_size_158w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @unit kg
% @values v59_86_158w=59-86 unk_recommended_weight_range_size_158w=Unknown
% @importance 1.0

0.90::acc(s1, recommended_weight_range_size_158w).

0.81::true_val(recommended_weight_range_size_158w, v59_86_158w); 0.19::true_val(recommended_weight_range_size_158w, unk_recommended_weight_range_size_158w).

measured(s1, recommended_weight_range_size_158w, v59_86_158w).

all_consistent(recommended_weight_range_size_158w) :- consistent(s1, recommended_weight_range_size_158w).

evidence(all_consistent(recommended_weight_range_size_158w)).
query(true_val(recommended_weight_range_size_158w, v59_86_158w)).
query(true_val(recommended_weight_range_size_158w, unk_recommended_weight_range_size_158w)).

% @attr effective_edge_161w
% @type numeric
% @canonical false
% @original_name Effective edge 161W
% @unit mm
% @values v1262=1262.0 unk_effective_edge_161w=Unknown
% @importance 1.0

0.90::acc(s1, effective_edge_161w).

0.81::true_val(effective_edge_161w, v1262); 0.19::true_val(effective_edge_161w, unk_effective_edge_161w).

measured(s1, effective_edge_161w, v1262).

all_consistent(effective_edge_161w) :- consistent(s1, effective_edge_161w).

evidence(all_consistent(effective_edge_161w)).
query(true_val(effective_edge_161w, v1262)).
query(true_val(effective_edge_161w, unk_effective_edge_161w)).

% @attr waist_width_161w
% @type numeric
% @canonical false
% @original_name Waist width 161W
% @unit cm
% @values v26_7=26.7 unk_waist_width_161w=Unknown
% @importance 1.0

0.90::acc(s1, waist_width_161w).

0.81::true_val(waist_width_161w, v26_7); 0.19::true_val(waist_width_161w, unk_waist_width_161w).

measured(s1, waist_width_161w, v26_7).

all_consistent(waist_width_161w) :- consistent(s1, waist_width_161w).

evidence(all_consistent(waist_width_161w)).
query(true_val(waist_width_161w, v26_7)).
query(true_val(waist_width_161w, unk_waist_width_161w)).

% @attr recommended_weight_range_size_161w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @unit kg
% @values v68_95=68-95 unk_recommended_weight_range_size_161w=Unknown
% @importance 1.0

0.90::acc(s1, recommended_weight_range_size_161w).

0.81::true_val(recommended_weight_range_size_161w, v68_95); 0.19::true_val(recommended_weight_range_size_161w, unk_recommended_weight_range_size_161w).

measured(s1, recommended_weight_range_size_161w, v68_95).

all_consistent(recommended_weight_range_size_161w) :- consistent(s1, recommended_weight_range_size_161w).

evidence(all_consistent(recommended_weight_range_size_161w)).
query(true_val(recommended_weight_range_size_161w, v68_95)).
query(true_val(recommended_weight_range_size_161w, unk_recommended_weight_range_size_161w)).

% @attr effective_edge_164w
% @type numeric
% @canonical false
% @original_name Effective edge 164W
% @unit mm
% @values v1284=1284.0 unk_effective_edge_164w=Unknown
% @importance 1.0

0.90::acc(s1, effective_edge_164w).

0.81::true_val(effective_edge_164w, v1284); 0.19::true_val(effective_edge_164w, unk_effective_edge_164w).

measured(s1, effective_edge_164w, v1284).

all_consistent(effective_edge_164w) :- consistent(s1, effective_edge_164w).

evidence(all_consistent(effective_edge_164w)).
query(true_val(effective_edge_164w, v1284)).
query(true_val(effective_edge_164w, unk_effective_edge_164w)).

% @attr waist_width_164w
% @type numeric
% @canonical false
% @original_name Waist width 164W
% @unit cm
% @values v26_9=26.9 unk_waist_width_164w=Unknown
% @importance 1.0

0.90::acc(s1, waist_width_164w).

0.81::true_val(waist_width_164w, v26_9); 0.19::true_val(waist_width_164w, unk_waist_width_164w).

measured(s1, waist_width_164w, v26_9).

all_consistent(waist_width_164w) :- consistent(s1, waist_width_164w).

evidence(all_consistent(waist_width_164w)).
query(true_val(waist_width_164w, v26_9)).
query(true_val(waist_width_164w, unk_waist_width_164w)).

% @attr recommended_weight_range_size_164w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @unit kg
% @values v77_104=77-104 unk_recommended_weight_range_size_164w=Unknown
% @importance 1.0

0.90::acc(s1, recommended_weight_range_size_164w).

0.81::true_val(recommended_weight_range_size_164w, v77_104); 0.19::true_val(recommended_weight_range_size_164w, unk_recommended_weight_range_size_164w).

measured(s1, recommended_weight_range_size_164w, v77_104).

all_consistent(recommended_weight_range_size_164w) :- consistent(s1, recommended_weight_range_size_164w).

evidence(all_consistent(recommended_weight_range_size_164w)).
query(true_val(recommended_weight_range_size_164w, v77_104)).
query(true_val(recommended_weight_range_size_164w, unk_recommended_weight_range_size_164w)).

% @attr taper
% @type numeric
% @canonical true
% @original_name taper
% @unit mm
% @values v7=7.0 unk_taper=Unknown
% @importance 1.0

0.92::acc(s35, taper).

0.90::true_val(taper, v7); 0.10::true_val(taper, unk_taper).

measured(s35, taper, v7).

all_consistent(taper) :- consistent(s35, taper).

evidence(all_consistent(taper)).
query(true_val(taper, v7)).
query(true_val(taper, unk_taper)).

% @attr taper_small
% @type numeric
% @canonical false
% @original_name taper
% @unit mm
% @values v6=6.0 unk_taper_small=Unknown
% @importance 1.0

0.92::acc(s35, taper_small).

0.90::true_val(taper_small, v6); 0.10::true_val(taper_small, unk_taper_small).

measured(s35, taper_small, v6).

all_consistent(taper_small) :- consistent(s35, taper_small).

evidence(all_consistent(taper_small)).
query(true_val(taper_small, v6)).
query(true_val(taper_small, unk_taper_small)).

% @attr taper_large
% @type numeric
% @canonical false
% @original_name taper
% @unit mm
% @values v10=10.0 v9=9.0
% @importance 0.925

0.88::acc(s35, taper_large).
0.85::acc(s37, taper_large).

0.52::true_val(taper_large, v10); 0.48::true_val(taper_large, v9).

measured(s35, taper_large, v10).
measured(s37, taper_large, v9).

all_consistent(taper_large) :-
    consistent(s35, taper_large),
    consistent(s37, taper_large).

evidence(all_consistent(taper_large)).
query(true_val(taper_large, v10)).
query(true_val(taper_large, v9)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values resort_v3_directional=Resort_V3_Directional unk_camber_type=Unknown
% @importance 1.0

0.93::acc(s1, camber_type).

0.81::true_val(camber_type, resort_v3_directional); 0.19::true_val(camber_type, unk_camber_type).

measured(s1, camber_type, resort_v3_directional).

all_consistent(camber_type) :- consistent(s1, camber_type).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, resort_v3_directional)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values raised_camber_elevated_contacts=Raised_camber_through_inserts_elevated_contact_points_traditional_arcs unk_camber_description=Unknown
% @importance 1.0

0.90::acc(s1, camber_description).

0.81::true_val(camber_description, raised_camber_elevated_contacts); 0.19::true_val(camber_description, unk_camber_description).

measured(s1, camber_description, raised_camber_elevated_contacts).

all_consistent(camber_description) :- consistent(s1, camber_description).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, raised_camber_elevated_contacts)).
query(true_val(camber_description, unk_camber_description)).

% @attr camber_description_v3_change
% @type categorical
% @canonical false
% @original_name camber_description
% @values alpine_v2_to_resort_v3=Changed_from_Alpine_V2_to_Resort_V3_added_rocker_both_tip_and_tail unk_camber_description_v3_change=Unknown
% @importance 0.7

0.82::acc(s39, camber_description_v3_change).

0.63::true_val(camber_description_v3_change, alpine_v2_to_resort_v3); 0.37::true_val(camber_description_v3_change, unk_camber_description_v3_change).

measured(s39, camber_description_v3_change, alpine_v2_to_resort_v3).

all_consistent(camber_description_v3_change) :- consistent(s39, camber_description_v3_change).

evidence(all_consistent(camber_description_v3_change)).
query(true_val(camber_description_v3_change, alpine_v2_to_resort_v3)).
query(true_val(camber_description_v3_change, unk_camber_description_v3_change)).

% @attr camber_description_detail
% @type categorical
% @canonical false
% @original_name camber_description
% @values trad_camber_flat_zones_reverse_nose=Traditional_camber_center_flat_transitions_reverse_camber_nose unk_camber_description_detail=Unknown
% @importance 0.7

0.75::acc(s40, camber_description_detail).

0.55::true_val(camber_description_detail, trad_camber_flat_zones_reverse_nose); 0.45::true_val(camber_description_detail, unk_camber_description_detail).

measured(s40, camber_description_detail, trad_camber_flat_zones_reverse_nose).

all_consistent(camber_description_detail) :-
    (indep(s40), consistent(s40, camber_description_detail) ; \+indep(s40)).

evidence(all_consistent(camber_description_detail)).
query(true_val(camber_description_detail, trad_camber_flat_zones_reverse_nose)).
query(true_val(camber_description_detail, unk_camber_description_detail)).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values radical_taper=Radical_Taper unk_sidecut_type=Unknown
% @importance 1.0

0.93::acc(s1, sidecut_type).

0.81::true_val(sidecut_type, radical_taper); 0.19::true_val(sidecut_type, unk_sidecut_type).

measured(s1, sidecut_type, radical_taper).

all_consistent(sidecut_type) :- consistent(s1, sidecut_type).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, radical_taper)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr sidecut_type_detail
% @type categorical
% @canonical false
% @original_name sidecut_type
% @values radial_tapered_tail=Radial_sidecut_tapered_tail_narrower_tail_sinks_wider_nose_floats unk_sidecut_type_detail=Unknown
% @importance 1.0

0.90::acc(s1, sidecut_type_detail).

0.81::true_val(sidecut_type_detail, radial_tapered_tail); 0.19::true_val(sidecut_type_detail, unk_sidecut_type_detail).

measured(s1, sidecut_type_detail, radial_tapered_tail).

all_consistent(sidecut_type_detail) :- consistent(s1, sidecut_type_detail).

evidence(all_consistent(sidecut_type_detail)).
query(true_val(sidecut_type_detail, radial_tapered_tail)).
query(true_val(sidecut_type_detail, unk_sidecut_type_detail)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values panda_hover_core=Panda_Hover_Core_Paulownia_Poplar_Bamboo_Power_Rods unk_core_material=Unknown
% @importance 1.0

0.93::acc(s1, core_material).

0.81::true_val(core_material, panda_hover_core); 0.19::true_val(core_material, unk_core_material).

measured(s1, core_material, panda_hover_core).

all_consistent(core_material) :- consistent(s1, core_material).

evidence(all_consistent(core_material)).
query(true_val(core_material, panda_hover_core)).
query(true_val(core_material, unk_core_material)).

% @attr core_material_properties
% @type categorical
% @canonical false
% @original_name core_material
% @values ultra_light_responsive=Ultra_lightweight_ultra_responsive unk_core_material_properties=Unknown
% @importance 1.0

0.90::acc(s1, core_material_properties).

0.81::true_val(core_material_properties, ultra_light_responsive); 0.19::true_val(core_material_properties, unk_core_material_properties).

measured(s1, core_material_properties, ultra_light_responsive).

all_consistent(core_material_properties) :- consistent(s1, core_material_properties).

evidence(all_consistent(core_material_properties)).
query(true_val(core_material_properties, ultra_light_responsive)).
query(true_val(core_material_properties, unk_core_material_properties)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values holysheet_tri_bi=Holysheet_Tri_Bi_triaxial_above_biaxial_beneath unk_laminate=Unknown
% @importance 1.0

0.93::acc(s1, laminate).

0.81::true_val(laminate, holysheet_tri_bi); 0.19::true_val(laminate, unk_laminate).

measured(s1, laminate, holysheet_tri_bi).

all_consistent(laminate) :- consistent(s1, laminate).

evidence(all_consistent(laminate)).
query(true_val(laminate, holysheet_tri_bi)).
query(true_val(laminate, unk_laminate)).

% @attr laminate_detail
% @type categorical
% @canonical false
% @original_name laminate
% @values higher_roving_count=Higher_roving_count_stronger_more_responsive_no_extra_weight unk_laminate_detail=Unknown
% @importance 0.6

0.75::acc(s41, laminate_detail).

0.55::true_val(laminate_detail, higher_roving_count); 0.45::true_val(laminate_detail, unk_laminate_detail).

measured(s41, laminate_detail, higher_roving_count).

all_consistent(laminate_detail) :-
    (indep(s41), consistent(s41, laminate_detail) ; \+indep(s41)).

evidence(all_consistent(laminate_detail)).
query(true_val(laminate_detail, higher_roving_count)).
query(true_val(laminate_detail, unk_laminate_detail)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values carbonflax_4x25=4x25mm_CarbonFlax_Amplifier carbonflax_3x25=3x25mm_CarbonFlax_Amplifier
% @importance 0.875

0.90::acc(s1, construction_material_innovation).
0.65::acc(s42, construction_material_innovation).

0.70::true_val(construction_material_innovation, carbonflax_4x25); 0.30::true_val(construction_material_innovation, carbonflax_3x25).

measured(s1, construction_material_innovation, carbonflax_4x25).
measured(s42, construction_material_innovation, carbonflax_3x25).

all_consistent(construction_material_innovation) :-
    consistent(s1, construction_material_innovation),
    (indep(s42), consistent(s42, construction_material_innovation) ; \+indep(s42)).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, carbonflax_4x25)).
query(true_val(construction_material_innovation, carbonflax_3x25)).

% @attr construction_material_innovation_detail
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values flax_carbon_weave=Natural_flax_fiber_woven_with_carbon_strands unk_construction_material_innovation_detail=Unknown
% @importance 0.7

0.92::acc(s43, construction_material_innovation_detail).

0.855::true_val(construction_material_innovation_detail, flax_carbon_weave); 0.145::true_val(construction_material_innovation_detail, unk_construction_material_innovation_detail).

measured(s43, construction_material_innovation_detail, flax_carbon_weave).

all_consistent(construction_material_innovation_detail) :- consistent(s43, construction_material_innovation_detail).

evidence(all_consistent(construction_material_innovation_detail)).
query(true_val(construction_material_innovation_detail, flax_carbon_weave)).
query(true_val(construction_material_innovation_detail, unk_construction_material_innovation_detail)).

% @attr resin
% @type categorical
% @canonical true
% @original_name resin
% @values magic_bean_plant_based=Magic_Bean_Resin_plant_based_60pct_renewable_zero_waste unk_resin=Unknown
% @importance 0.775

0.90::acc(s1, resin).
0.78::acc(s44, resin).

0.95::true_val(resin, magic_bean_plant_based); 0.05::true_val(resin, unk_resin).

measured(s1, resin, magic_bean_plant_based).
measured(s44, resin, magic_bean_plant_based).

all_consistent(resin) :-
    consistent(s1, resin),
    (indep(s44), consistent(s44, resin) ; \+indep(s44)).

evidence(all_consistent(resin)).
query(true_val(resin, magic_bean_plant_based)).
query(true_val(resin, unk_resin)).

% @attr resin_properties
% @type categorical
% @canonical false
% @original_name resin
% @values poppy_powerful_durable=Poppy_powerful_extremely_durable_allows_thinner_core unk_resin_properties=Unknown
% @importance 0.55

0.75::acc(s44, resin_properties).

0.59::true_val(resin_properties, poppy_powerful_durable); 0.41::true_val(resin_properties, unk_resin_properties).

measured(s44, resin_properties, poppy_powerful_durable).

all_consistent(resin_properties) :-
    (indep(s44), consistent(s44, resin_properties) ; \+indep(s44)).

evidence(all_consistent(resin_properties)).
query(true_val(resin_properties, poppy_powerful_durable)).
query(true_val(resin_properties, unk_resin_properties)).

% @attr topsheet
% @type categorical
% @canonical true
% @original_name topsheet
% @values skinless_ash_woodgrain=Skinless_Core_Ash_Woodgrain_digital_print_PAM16000_silkscreened unk_topsheet=Unknown
% @importance 1.0

0.93::acc(s1, topsheet).

0.81::true_val(topsheet, skinless_ash_woodgrain); 0.19::true_val(topsheet, unk_topsheet).

measured(s1, topsheet, skinless_ash_woodgrain).

all_consistent(topsheet) :- consistent(s1, topsheet).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, skinless_ash_woodgrain)).
query(true_val(topsheet, unk_topsheet)).

% @attr topsheet_weight_saving
% @type numeric
% @canonical false
% @original_name topsheet
% @unit g
% @values v220=220.0 unk_topsheet_weight_saving=Unknown
% @importance 0.55

0.75::acc(s45, topsheet_weight_saving).

0.59::true_val(topsheet_weight_saving, v220); 0.41::true_val(topsheet_weight_saving, unk_topsheet_weight_saving).

measured(s45, topsheet_weight_saving, v220).

all_consistent(topsheet_weight_saving) :-
    (indep(s45), consistent(s45, topsheet_weight_saving) ; \+indep(s45)).

evidence(all_consistent(topsheet_weight_saving)).
query(true_val(topsheet_weight_saving, v220)).
query(true_val(topsheet_weight_saving, unk_topsheet_weight_saving)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values hyperdrive_adv_xt=Hyperdrive_ADV_XT_premium_sintered_PE_highest_antifriction unk_base_material=Unknown
% @importance 1.0

0.93::acc(s1, base_material).

0.81::true_val(base_material, hyperdrive_adv_xt); 0.19::true_val(base_material, unk_base_material).

measured(s1, base_material, hyperdrive_adv_xt).

all_consistent(base_material) :- consistent(s1, base_material).

evidence(all_consistent(base_material)).
query(true_val(base_material, hyperdrive_adv_xt)).
query(true_val(base_material, unk_base_material)).

% @attr base_material_durability
% @type categorical
% @canonical false
% @original_name base_material
% @values extra_thick_durable=Extra_thick_XT_for_enhanced_durability unk_base_material_durability=Unknown
% @importance 1.0

0.90::acc(s1, base_material_durability).

0.81::true_val(base_material_durability, extra_thick_durable); 0.19::true_val(base_material_durability, unk_base_material_durability).

measured(s1, base_material_durability, extra_thick_durable).

all_consistent(base_material_durability) :- consistent(s1, base_material_durability).

evidence(all_consistent(base_material_durability)).
query(true_val(base_material_durability, extra_thick_durable)).
query(true_val(base_material_durability, unk_base_material_durability)).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values moonshot_omni_tune=Moonshot_Omni_Tune_race_base_45deg_water_channel unk_base_type=Unknown
% @importance 1.0

0.93::acc(s1, base_type).

0.81::true_val(base_type, moonshot_omni_tune); 0.19::true_val(base_type, unk_base_type).

measured(s1, base_type, moonshot_omni_tune).

all_consistent(base_type) :- consistent(s1, base_type).

evidence(all_consistent(base_type)).
query(true_val(base_type, moonshot_omni_tune)).
query(true_val(base_type, unk_base_type)).

% @attr base_graphics
% @type categorical
% @canonical false
% @original_name Base graphics
% @values sublimation=Sublimation_process_bold_vibrant_colors_embedded unk_base_graphics=Unknown
% @importance 1.0

0.90::acc(s1, base_graphics).

0.81::true_val(base_graphics, sublimation); 0.19::true_val(base_graphics, unk_base_graphics).

measured(s1, base_graphics, sublimation).

all_consistent(base_graphics) :- consistent(s1, base_graphics).

evidence(all_consistent(base_graphics)).
query(true_val(base_graphics, sublimation)).
query(true_val(base_graphics, unk_base_graphics)).

% @attr graphics_note
% @type categorical
% @canonical false
% @original_name Graphics note
% @values size_dependent=Graphics_are_size_dependent_cannot_swap unk_graphics_note=Unknown
% @importance 1.0

0.90::acc(s1, graphics_note).

0.81::true_val(graphics_note, size_dependent); 0.19::true_val(graphics_note, unk_graphics_note).

measured(s1, graphics_note, size_dependent).

all_consistent(graphics_note) :- consistent(s1, graphics_note).

evidence(all_consistent(graphics_note)).
query(true_val(graphics_note, size_dependent)).
query(true_val(graphics_note, unk_graphics_note)).

% @attr available_colors
% @type categorical
% @canonical true
% @original_name available_colors
% @values two_base_variations_per_size=Two_base_color_variations_per_size unk_available_colors=Unknown
% @importance 0.35

0.88::acc(s46, available_colors).

0.81::true_val(available_colors, two_base_variations_per_size); 0.19::true_val(available_colors, unk_available_colors).

measured(s46, available_colors, two_base_variations_per_size).

all_consistent(available_colors) :- consistent(s46, available_colors).

evidence(all_consistent(available_colors)).
query(true_val(available_colors, two_base_variations_per_size)).
query(true_val(available_colors, unk_available_colors)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values full_abs1000=Full_ABS1000_Sidewalls unk_sidewall_material=Unknown
% @importance 0.55

0.70::acc(s47, sidewall_material).

0.51::true_val(sidewall_material, full_abs1000); 0.49::true_val(sidewall_material, unk_sidewall_material).

measured(s47, sidewall_material, full_abs1000).

all_consistent(sidewall_material) :-
    (indep(s47), consistent(s47, sidewall_material) ; \+indep(s47)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, full_abs1000)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values edges_360_hrc48=360_Degree_HRC48_Steel_Edges unk_edge_technology=Unknown
% @importance 0.55

0.70::acc(s47, edge_technology).

0.51::true_val(edge_technology, edges_360_hrc48); 0.49::true_val(edge_technology, unk_edge_technology).

measured(s47, edge_technology, edges_360_hrc48).

all_consistent(edge_technology) :-
    (indep(s47), consistent(s47, edge_technology) ; \+indep(s47)).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, edges_360_hrc48)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr base_type_grind
% @type categorical
% @canonical false
% @original_name base_type
% @values stone_ground_factory=Stone_ground_from_factory unk_base_type_grind=Unknown
% @importance 0.5

0.80::acc(s48, base_type_grind).

0.60::true_val(base_type_grind, stone_ground_factory); 0.40::true_val(base_type_grind, unk_base_type_grind).

measured(s48, base_type_grind, stone_ground_factory).

all_consistent(base_type_grind) :- consistent(s48, base_type_grind).

evidence(all_consistent(base_type_grind)).
query(true_val(base_type_grind, stone_ground_factory)).
query(true_val(base_type_grind, unk_base_type_grind)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values backcountry_am_powder=Backcountry_all_mountain_variable_terrain_powder unk_terrain_suitability=Unknown
% @importance 1.0

0.93::acc(s1, terrain_suitability).

0.81::true_val(terrain_suitability, backcountry_am_powder); 0.19::true_val(terrain_suitability, unk_terrain_suitability).

measured(s1, terrain_suitability, backcountry_am_powder).

all_consistent(terrain_suitability) :- consistent(s1, terrain_suitability).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, backcountry_am_powder)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values am_freeride_bc=All_Mountain_Freeride_Backcountry unk_riding_style=Unknown
% @importance 1.0

0.93::acc(s1, riding_style).

0.81::true_val(riding_style, am_freeride_bc); 0.19::true_val(riding_style, unk_riding_style).

measured(s1, riding_style, am_freeride_bc).

all_consistent(riding_style) :- consistent(s1, riding_style).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, am_freeride_bc)).
query(true_val(riding_style, unk_riding_style)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values advanced=Advanced unk_rider_level=Unknown
% @importance 1.0

0.93::acc(s1, rider_level).

0.81::true_val(rider_level, advanced); 0.19::true_val(rider_level, unk_rider_level).

measured(s1, rider_level, advanced).

all_consistent(rider_level) :- consistent(s1, rider_level).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, advanced)).
query(true_val(rider_level, unk_rider_level)).

% @attr rider_level_type
% @type categorical
% @canonical false
% @original_name rider_level
% @values all_mtn_freeride=All_Mtn_Freeride unk_rider_level_type=Unknown
% @importance 1.0

0.92::acc(s35, rider_level_type).

0.90::true_val(rider_level_type, all_mtn_freeride); 0.10::true_val(rider_level_type, unk_rider_level_type).

measured(s35, rider_level_type, all_mtn_freeride).

all_consistent(rider_level_type) :- consistent(s35, rider_level_type).

evidence(all_consistent(rider_level_type)).
query(true_val(rider_level_type, all_mtn_freeride)).
query(true_val(rider_level_type, unk_rider_level_type)).

% @attr good_wood_award
% @type categorical
% @canonical false
% @original_name Good Wood Award
% @values good_wood_2018_19=TransWorld_Good_Wood_2018_2019 unk_good_wood_award=Unknown
% @importance 0.65

0.85::acc(s49, good_wood_award).

0.72::true_val(good_wood_award, good_wood_2018_19); 0.28::true_val(good_wood_award, unk_good_wood_award).

measured(s49, good_wood_award, good_wood_2018_19).

all_consistent(good_wood_award) :- consistent(s49, good_wood_award).

evidence(all_consistent(good_wood_award)).
query(true_val(good_wood_award, good_wood_2018_19)).
query(true_val(good_wood_award, unk_good_wood_award)).

% @attr the_inertia_award
% @type categorical
% @canonical false
% @original_name The Inertia Award
% @values best_freeride_2026=Best_Freeride_Snowboard_2026 unk_the_inertia_award=Unknown
% @importance 0.8

0.82::acc(s50, the_inertia_award).

0.68::true_val(the_inertia_award, best_freeride_2026); 0.32::true_val(the_inertia_award, unk_the_inertia_award).

measured(s50, the_inertia_award, best_freeride_2026).

all_consistent(the_inertia_award) :- consistent(s50, the_inertia_award).

evidence(all_consistent(the_inertia_award)).
query(true_val(the_inertia_award, best_freeride_2026)).
query(true_val(the_inertia_award, unk_the_inertia_award)).

% @attr pop
% @type categorical
% @canonical true
% @original_name pop
% @values strong_no_preload=Strong_pop_camber_dominant_no_significant_preloading unk_pop=Unknown
% @importance 0.8

0.82::acc(s51, pop).

0.68::true_val(pop, strong_no_preload); 0.32::true_val(pop, unk_pop).

measured(s51, pop, strong_no_preload).

all_consistent(pop) :- consistent(s51, pop).

evidence(all_consistent(pop)).
query(true_val(pop, strong_no_preload)).
query(true_val(pop, unk_pop)).

% @attr stability_at_speed
% @type categorical
% @canonical false
% @original_name Stability at speed
% @values precise_bullet_high_speed=Precise_bullet_at_high_speeds_cambered_profile unk_stability_at_speed=Unknown
% @importance 0.85

0.82::acc(s52, stability_at_speed).

0.68::true_val(stability_at_speed, precise_bullet_high_speed); 0.32::true_val(stability_at_speed, unk_stability_at_speed).

measured(s52, stability_at_speed, precise_bullet_high_speed).

all_consistent(stability_at_speed) :- consistent(s52, stability_at_speed).

evidence(all_consistent(stability_at_speed)).
query(true_val(stability_at_speed, precise_bullet_high_speed)).
query(true_val(stability_at_speed, unk_stability_at_speed)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values very_good_near_trad_camber=Very_good_close_to_full_traditional_camber unk_edge_hold=Unknown
% @importance 0.85

0.82::acc(s53, edge_hold).

0.63::true_val(edge_hold, very_good_near_trad_camber); 0.37::true_val(edge_hold, unk_edge_hold).

measured(s53, edge_hold, very_good_near_trad_camber).

all_consistent(edge_hold) :- consistent(s53, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, very_good_near_trad_camber)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values short_long_radius_explosive=Short_and_long_radius_turns_explosive_all_speeds unk_turn_initiation_performance=Unknown
% @importance 0.7

0.82::acc(s54, turn_initiation_performance).

0.68::true_val(turn_initiation_performance, short_long_radius_explosive); 0.32::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s54, turn_initiation_performance, short_long_radius_explosive).

all_consistent(turn_initiation_performance) :- consistent(s54, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, short_long_radius_explosive)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr carving_rating_tgr
% @type categorical
% @canonical true
% @original_name carving_rating_tgr
% @values exceptional_deep_grippy=Exceptional_deep_grippy_carve_takes_effort unk_carving_rating_tgr=Unknown
% @importance 0.8

0.80::acc(s55, carving_rating_tgr).

0.60::true_val(carving_rating_tgr, exceptional_deep_grippy); 0.40::true_val(carving_rating_tgr, unk_carving_rating_tgr).

measured(s55, carving_rating_tgr, exceptional_deep_grippy).

all_consistent(carving_rating_tgr) :- consistent(s55, carving_rating_tgr).

evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, exceptional_deep_grippy)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

% @attr powder_float
% @type categorical
% @canonical false
% @original_name Powder float
% @values good_not_top_tier=Good_but_not_top_tier_average_to_good_AM unk_powder_float=Unknown
% @importance 0.85

0.83::acc(s56, powder_float).

0.68::true_val(powder_float, good_not_top_tier); 0.32::true_val(powder_float, unk_powder_float).

measured(s56, powder_float, good_not_top_tier).

all_consistent(powder_float) :- consistent(s56, powder_float).

evidence(all_consistent(powder_float)).
query(true_val(powder_float, good_not_top_tier)).
query(true_val(powder_float, unk_powder_float)).

% @attr crud_performance
% @type categorical
% @canonical false
% @original_name Crud performance
% @values crushes_crud_well=Crushes_crud_well_does_well_uneven_snow unk_crud_performance=Unknown
% @importance 0.75

0.80::acc(s57, crud_performance).

0.60::true_val(crud_performance, crushes_crud_well); 0.40::true_val(crud_performance, unk_crud_performance).

measured(s57, crud_performance, crushes_crud_well).

all_consistent(crud_performance) :- consistent(s57, crud_performance).

evidence(all_consistent(crud_performance)).
query(true_val(crud_performance, crushes_crud_well)).
query(true_val(crud_performance, unk_crud_performance)).

% @attr chatter_performance
% @type categorical
% @canonical true
% @original_name chatter_performance
% @values eats_vibrations=Eats_up_vibrations_and_rough_snow_well unk_chatter_performance=Unknown
% @importance 0.775

0.82::acc(s50, chatter_performance).
0.80::acc(s58, chatter_performance).

0.95::true_val(chatter_performance, eats_vibrations); 0.05::true_val(chatter_performance, unk_chatter_performance).

measured(s50, chatter_performance, eats_vibrations).
measured(s58, chatter_performance, eats_vibrations).

all_consistent(chatter_performance) :-
    consistent(s50, chatter_performance),
    consistent(s58, chatter_performance).

evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, eats_vibrations)).
query(true_val(chatter_performance, unk_chatter_performance)).

% @attr board_weight_grams
% @type categorical
% @canonical true
% @original_name board_weight_grams
% @values significantly_lighter=Significantly_lighter_than_average unk_board_weight_grams=Unknown
% @importance 0.75

0.82::acc(s59, board_weight_grams).

0.63::true_val(board_weight_grams, significantly_lighter); 0.37::true_val(board_weight_grams, unk_board_weight_grams).

measured(s59, board_weight_grams, significantly_lighter).

all_consistent(board_weight_grams) :- consistent(s59, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, significantly_lighter)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values fastest_capita_base=One_of_Capitas_fastest_base_materials unk_base_glide_performance=Unknown
% @importance 0.7

0.80::acc(s60, base_glide_performance).

0.60::true_val(base_glide_performance, fastest_capita_base); 0.40::true_val(base_glide_performance, unk_base_glide_performance).

measured(s60, base_glide_performance, fastest_capita_base).

all_consistent(base_glide_performance) :- consistent(s60, base_glide_performance).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, fastest_capita_base)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr reviewer_opinion_the_good_ride
% @type numeric
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @unit /5
% @values v5_0=5.0 unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.55

0.70::acc(s88, reviewer_opinion_the_good_ride).

0.45::true_val(reviewer_opinion_the_good_ride, v5_0); 0.55::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s88, reviewer_opinion_the_good_ride, v5_0).

all_consistent(reviewer_opinion_the_good_ride) :- consistent(s88, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, v5_0)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr reviewer_opinion_the_good_ride_quote
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values stability_playfulness_impressive=Ratio_of_stability_to_playfulness_very_impressive unk_reviewer_opinion_the_good_ride_quote=Unknown
% @importance 0.8

0.82::acc(s51, reviewer_opinion_the_good_ride_quote).

0.68::true_val(reviewer_opinion_the_good_ride_quote, stability_playfulness_impressive); 0.32::true_val(reviewer_opinion_the_good_ride_quote, unk_reviewer_opinion_the_good_ride_quote).

measured(s51, reviewer_opinion_the_good_ride_quote, stability_playfulness_impressive).

all_consistent(reviewer_opinion_the_good_ride_quote) :- consistent(s51, reviewer_opinion_the_good_ride_quote).

evidence(all_consistent(reviewer_opinion_the_good_ride_quote)).
query(true_val(reviewer_opinion_the_good_ride_quote, stability_playfulness_impressive)).
query(true_val(reviewer_opinion_the_good_ride_quote, unk_reviewer_opinion_the_good_ride_quote)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values versatile_sidecountry_resort=Versatile_for_sidecountry_powder_mornings_transitioning_to_resort unk_positive_aspect=Unknown
% @importance 1.0

0.88::acc(s1, positive_aspect).

0.81::true_val(positive_aspect, versatile_sidecountry_resort); 0.19::true_val(positive_aspect, unk_positive_aspect).

measured(s1, positive_aspect, versatile_sidecountry_resort).

all_consistent(positive_aspect) :- consistent(s1, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, versatile_sidecountry_resort)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr positive_aspect_poppy_floaty
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values poppy_floaty_stable_fun=Poppy_floaty_super_stable_so_much_fun unk_positive_aspect_poppy_floaty=Unknown
% @importance 0.8

0.80::acc(s50, positive_aspect_poppy_floaty).

0.68::true_val(positive_aspect_poppy_floaty, poppy_floaty_stable_fun); 0.32::true_val(positive_aspect_poppy_floaty, unk_positive_aspect_poppy_floaty).

measured(s50, positive_aspect_poppy_floaty, poppy_floaty_stable_fun).

all_consistent(positive_aspect_poppy_floaty) :- consistent(s50, positive_aspect_poppy_floaty).

evidence(all_consistent(positive_aspect_poppy_floaty)).
query(true_val(positive_aspect_poppy_floaty, poppy_floaty_stable_fun)).
query(true_val(positive_aspect_poppy_floaty, unk_positive_aspect_poppy_floaty)).

% @attr positive_aspect_tree_riding
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values excellent_trees_compact=Excellent_for_tree_riding_compact_design unk_positive_aspect_tree_riding=Unknown
% @importance 0.65

0.78::acc(s61, positive_aspect_tree_riding).

0.56::true_val(positive_aspect_tree_riding, excellent_trees_compact); 0.44::true_val(positive_aspect_tree_riding, unk_positive_aspect_tree_riding).

measured(s61, positive_aspect_tree_riding, excellent_trees_compact).

all_consistent(positive_aspect_tree_riding) :- consistent(s61, positive_aspect_tree_riding).

evidence(all_consistent(positive_aspect_tree_riding)).
query(true_val(positive_aspect_tree_riding, excellent_trees_compact)).
query(true_val(positive_aspect_tree_riding, unk_positive_aspect_tree_riding)).

% @attr positive_aspect_best_board
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values one_of_best_boards=One_of_the_best_boards_Behind_The_Pines unk_positive_aspect_best_board=Unknown
% @importance 0.6

0.72::acc(s62, positive_aspect_best_board).

0.44::true_val(positive_aspect_best_board, one_of_best_boards); 0.56::true_val(positive_aspect_best_board, unk_positive_aspect_best_board).

measured(s62, positive_aspect_best_board, one_of_best_boards).

all_consistent(positive_aspect_best_board) :- consistent(s62, positive_aspect_best_board).

evidence(all_consistent(positive_aspect_best_board)).
query(true_val(positive_aspect_best_board, one_of_best_boards)).
query(true_val(positive_aspect_best_board, unk_positive_aspect_best_board)).

% @attr positive_aspect_best_directional
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values best_directional_capita=Best_of_all_directional_Capita_boards_The_Good_Ride unk_positive_aspect_best_directional=Unknown
% @importance 0.75

0.80::acc(s58, positive_aspect_best_directional).

0.64::true_val(positive_aspect_best_directional, best_directional_capita); 0.36::true_val(positive_aspect_best_directional, unk_positive_aspect_best_directional).

measured(s58, positive_aspect_best_directional, best_directional_capita).

all_consistent(positive_aspect_best_directional) :- consistent(s58, positive_aspect_best_directional).

evidence(all_consistent(positive_aspect_best_directional)).
query(true_val(positive_aspect_best_directional, best_directional_capita)).
query(true_val(positive_aspect_best_directional, unk_positive_aspect_best_directional)).

% @attr positive_aspect_amplifies_input
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values amplifies_rider_input=Board_amplifies_rider_input_feels_like_part_of_you unk_positive_aspect_amplifies_input=Unknown
% @importance 0.6

0.65::acc(s63, positive_aspect_amplifies_input).

0.38::true_val(positive_aspect_amplifies_input, amplifies_rider_input); 0.62::true_val(positive_aspect_amplifies_input, unk_positive_aspect_amplifies_input).

measured(s63, positive_aspect_amplifies_input, amplifies_rider_input).

all_consistent(positive_aspect_amplifies_input) :- consistent(s63, positive_aspect_amplifies_input).

evidence(all_consistent(positive_aspect_amplifies_input)).
query(true_val(positive_aspect_amplifies_input, amplifies_rider_input)).
query(true_val(positive_aspect_amplifies_input, unk_positive_aspect_amplifies_input)).

% @attr positive_aspect_graphics
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values unique_graphics_tattoo_artist=Unique_stunning_graphics_by_Kazus_tattoo_artist unk_positive_aspect_graphics=Unknown
% @importance 0.7

0.80::acc(s54, positive_aspect_graphics).

0.68::true_val(positive_aspect_graphics, unique_graphics_tattoo_artist); 0.32::true_val(positive_aspect_graphics, unk_positive_aspect_graphics).

measured(s54, positive_aspect_graphics, unique_graphics_tattoo_artist).

all_consistent(positive_aspect_graphics) :- consistent(s54, positive_aspect_graphics).

evidence(all_consistent(positive_aspect_graphics)).
query(true_val(positive_aspect_graphics, unique_graphics_tattoo_artist)).
query(true_val(positive_aspect_graphics, unk_positive_aspect_graphics)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values not_for_beginners=Not_for_beginners_could_knock_confidence unk_negative_aspect=Unknown
% @importance 0.85

0.80::acc(s64, negative_aspect).

0.60::true_val(negative_aspect, not_for_beginners); 0.40::true_val(negative_aspect, unk_negative_aspect).

measured(s64, negative_aspect, not_for_beginners).

all_consistent(negative_aspect) :- consistent(s64, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, not_for_beginners)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_demands_energy
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values demands_active_riding=Demands_active_riding_you_provide_energy unk_negative_aspect_demands_energy=Unknown
% @importance 0.75

0.80::acc(s65, negative_aspect_demands_energy).

0.60::true_val(negative_aspect_demands_energy, demands_active_riding); 0.40::true_val(negative_aspect_demands_energy, unk_negative_aspect_demands_energy).

measured(s65, negative_aspect_demands_energy, demands_active_riding).

all_consistent(negative_aspect_demands_energy) :- consistent(s65, negative_aspect_demands_energy).

evidence(all_consistent(negative_aspect_demands_energy)).
query(true_val(negative_aspect_demands_energy, demands_active_riding)).
query(true_val(negative_aspect_demands_energy, unk_negative_aspect_demands_energy)).

% @attr negative_aspect_heel_disengage
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values heel_edge_disengage=Heel_edge_can_slightly_disengage unk_negative_aspect_heel_disengage=Unknown
% @importance 0.7

0.82::acc(s66, negative_aspect_heel_disengage).

0.68::true_val(negative_aspect_heel_disengage, heel_edge_disengage); 0.32::true_val(negative_aspect_heel_disengage, unk_negative_aspect_heel_disengage).

measured(s66, negative_aspect_heel_disengage, heel_edge_disengage).

all_consistent(negative_aspect_heel_disengage) :- consistent(s66, negative_aspect_heel_disengage).

evidence(all_consistent(negative_aspect_heel_disengage)).
query(true_val(negative_aspect_heel_disengage, heel_edge_disengage)).
query(true_val(negative_aspect_heel_disengage, unk_negative_aspect_heel_disengage)).

% @attr negative_aspect_hard_to_slash
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values not_easy_slash=Not_easy_to_slash_harder_than_previous_models unk_negative_aspect_hard_to_slash=Unknown
% @importance 0.65

0.80::acc(s67, negative_aspect_hard_to_slash).

0.60::true_val(negative_aspect_hard_to_slash, not_easy_slash); 0.40::true_val(negative_aspect_hard_to_slash, unk_negative_aspect_hard_to_slash).

measured(s67, negative_aspect_hard_to_slash, not_easy_slash).

all_consistent(negative_aspect_hard_to_slash) :- consistent(s67, negative_aspect_hard_to_slash).

evidence(all_consistent(negative_aspect_hard_to_slash)).
query(true_val(negative_aspect_hard_to_slash, not_easy_slash)).
query(true_val(negative_aspect_hard_to_slash, unk_negative_aspect_hard_to_slash)).

% @attr negative_aspect_edge_effort
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values effort_to_get_on_edge=Takes_effort_to_get_on_edge_pulls_back_to_flat unk_negative_aspect_edge_effort=Unknown
% @importance 0.75

0.80::acc(s68, negative_aspect_edge_effort).

0.60::true_val(negative_aspect_edge_effort, effort_to_get_on_edge); 0.40::true_val(negative_aspect_edge_effort, unk_negative_aspect_edge_effort).

measured(s68, negative_aspect_edge_effort, effort_to_get_on_edge).

all_consistent(negative_aspect_edge_effort) :- consistent(s68, negative_aspect_edge_effort).

evidence(all_consistent(negative_aspect_edge_effort)).
query(true_val(negative_aspect_edge_effort, effort_to_get_on_edge)).
query(true_val(negative_aspect_edge_effort, unk_negative_aspect_edge_effort)).

% @attr negative_aspect_less_pop
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values less_pop_ollie_vs_older=Less_pop_on_ollie_vs_older_pre_Resort_V3 unk_negative_aspect_less_pop=Unknown
% @importance 0.65

0.80::acc(s69, negative_aspect_less_pop).

0.64::true_val(negative_aspect_less_pop, less_pop_ollie_vs_older); 0.36::true_val(negative_aspect_less_pop, unk_negative_aspect_less_pop).

measured(s69, negative_aspect_less_pop, less_pop_ollie_vs_older).

all_consistent(negative_aspect_less_pop) :- consistent(s69, negative_aspect_less_pop).

evidence(all_consistent(negative_aspect_less_pop)).
query(true_val(negative_aspect_less_pop, less_pop_ollie_vs_older)).
query(true_val(negative_aspect_less_pop, unk_negative_aspect_less_pop)).

% @attr negative_aspect_powder_not_better
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values no_better_deep_powder=Not_better_in_deep_powder_than_other_directional_twins unk_negative_aspect_powder_not_better=Unknown
% @importance 0.75

0.65::acc(s70, negative_aspect_powder_not_better).

0.30::true_val(negative_aspect_powder_not_better, no_better_deep_powder); 0.70::true_val(negative_aspect_powder_not_better, unk_negative_aspect_powder_not_better).

measured(s70, negative_aspect_powder_not_better, no_better_deep_powder).

all_consistent(negative_aspect_powder_not_better) :- consistent(s70, negative_aspect_powder_not_better).

evidence(all_consistent(negative_aspect_powder_not_better)).
query(true_val(negative_aspect_powder_not_better, no_better_deep_powder)).
query(true_val(negative_aspect_powder_not_better, unk_negative_aspect_powder_not_better)).

% @attr negative_aspect_base_grabs
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values overly_structured_base_grabs=Overly_structured_base_can_grab_too_much unk_negative_aspect_base_grabs=Unknown
% @importance 0.6

0.78::acc(s71, negative_aspect_base_grabs).

0.60::true_val(negative_aspect_base_grabs, overly_structured_base_grabs); 0.40::true_val(negative_aspect_base_grabs, unk_negative_aspect_base_grabs).

measured(s71, negative_aspect_base_grabs, overly_structured_base_grabs).

all_consistent(negative_aspect_base_grabs) :- consistent(s71, negative_aspect_base_grabs).

evidence(all_consistent(negative_aspect_base_grabs)).
query(true_val(negative_aspect_base_grabs, overly_structured_base_grabs)).
query(true_val(negative_aspect_base_grabs, unk_negative_aspect_base_grabs)).

% @attr negative_aspect_no_jibbing
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values jibbing_not_suitable=Not_suitable_for_jibbing unk_negative_aspect_no_jibbing=Unknown
% @importance 0.6

0.68::acc(s72, negative_aspect_no_jibbing).

0.36::true_val(negative_aspect_no_jibbing, jibbing_not_suitable); 0.64::true_val(negative_aspect_no_jibbing, unk_negative_aspect_no_jibbing).

measured(s72, negative_aspect_no_jibbing, jibbing_not_suitable).

all_consistent(negative_aspect_no_jibbing) :- consistent(s72, negative_aspect_no_jibbing).

evidence(all_consistent(negative_aspect_no_jibbing)).
query(true_val(negative_aspect_no_jibbing, jibbing_not_suitable)).
query(true_val(negative_aspect_no_jibbing, unk_negative_aspect_no_jibbing)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values daily_driver_no_park=Works_well_as_daily_driver_for_aggressive_riders_not_park unk_user_review_forum=Unknown
% @importance 0.7

0.68::acc(s73, user_review_forum).

0.36::true_val(user_review_forum, daily_driver_no_park); 0.64::true_val(user_review_forum, unk_user_review_forum).

measured(s73, user_review_forum, daily_driver_no_park).

all_consistent(user_review_forum) :- consistent(s73, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, daily_driver_no_park)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr user_review_forum_mercury_comparison
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values mercury_tapered_tail=Similar_to_CAPiTA_Mercury_with_tapered_tail unk_user_review_forum_mercury_comparison=Unknown
% @importance 0.5

0.55::acc(s74, user_review_forum_mercury_comparison).

0.26::true_val(user_review_forum_mercury_comparison, mercury_tapered_tail); 0.74::true_val(user_review_forum_mercury_comparison, unk_user_review_forum_mercury_comparison).

measured(s74, user_review_forum_mercury_comparison, mercury_tapered_tail).

all_consistent(user_review_forum_mercury_comparison) :- consistent(s74, user_review_forum_mercury_comparison).

evidence(all_consistent(user_review_forum_mercury_comparison)).
query(true_val(user_review_forum_mercury_comparison, mercury_tapered_tail)).
query(true_val(user_review_forum_mercury_comparison, unk_user_review_forum_mercury_comparison)).

% @attr user_review_forum_boot_priority
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values boot_size_over_weight=Boot_size_should_take_priority_over_weight unk_user_review_forum_boot_priority=Unknown
% @importance 0.85

0.80::acc(s75, user_review_forum_boot_priority).

0.68::true_val(user_review_forum_boot_priority, boot_size_over_weight); 0.32::true_val(user_review_forum_boot_priority, unk_user_review_forum_boot_priority).

measured(s75, user_review_forum_boot_priority, boot_size_over_weight).

all_consistent(user_review_forum_boot_priority) :- consistent(s75, user_review_forum_boot_priority).

evidence(all_consistent(user_review_forum_boot_priority)).
query(true_val(user_review_forum_boot_priority, boot_size_over_weight)).
query(true_val(user_review_forum_boot_priority, unk_user_review_forum_boot_priority)).

% @attr recommended_boot_sizes
% @type categorical
% @canonical false
% @original_name Recommended boot sizes (Good Ride)
% @values boot_chart=151_US7_5_8_5_154_US8_9_157_US9_10_160_US9_5_10_5 unk_recommended_boot_sizes=Unknown
% @importance 0.8

0.80::acc(s76, recommended_boot_sizes).

0.64::true_val(recommended_boot_sizes, boot_chart); 0.36::true_val(recommended_boot_sizes, unk_recommended_boot_sizes).

measured(s76, recommended_boot_sizes, boot_chart).

all_consistent(recommended_boot_sizes) :- consistent(s76, recommended_boot_sizes).

evidence(all_consistent(recommended_boot_sizes)).
query(true_val(recommended_boot_sizes, boot_chart)).
query(true_val(recommended_boot_sizes, unk_recommended_boot_sizes)).

% @attr user_review_forum_k2_alchemist
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values k2_alchemist_more_stable=K2_Alchemist_may_be_more_stable_at_high_speed_more_carbon unk_user_review_forum_k2_alchemist=Unknown
% @importance 0.55

0.50::acc(s77, user_review_forum_k2_alchemist).

0.21::true_val(user_review_forum_k2_alchemist, k2_alchemist_more_stable); 0.79::true_val(user_review_forum_k2_alchemist, unk_user_review_forum_k2_alchemist).

measured(s77, user_review_forum_k2_alchemist, k2_alchemist_more_stable).

all_consistent(user_review_forum_k2_alchemist) :- consistent(s77, user_review_forum_k2_alchemist).

evidence(all_consistent(user_review_forum_k2_alchemist)).
query(true_val(user_review_forum_k2_alchemist, k2_alchemist_more_stable)).
query(true_val(user_review_forum_k2_alchemist, unk_user_review_forum_k2_alchemist)).

% @attr user_review_forum_rides_big
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values rides_like_160_feels_155=On_edge_rides_like_160_in_air_feels_like_155 unk_user_review_forum_rides_big=Unknown
% @importance 0.7

0.68::acc(s78, user_review_forum_rides_big).

0.36::true_val(user_review_forum_rides_big, rides_like_160_feels_155); 0.64::true_val(user_review_forum_rides_big, unk_user_review_forum_rides_big).

measured(s78, user_review_forum_rides_big, rides_like_160_feels_155).

all_consistent(user_review_forum_rides_big) :- consistent(s78, user_review_forum_rides_big).

evidence(all_consistent(user_review_forum_rides_big)).
query(true_val(user_review_forum_rides_big, rides_like_160_feels_155)).
query(true_val(user_review_forum_rides_big, unk_user_review_forum_rides_big)).

% @attr user_review_forum_weight_range
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values handles_higher_weight_well=Board_handles_riders_on_higher_end_of_weight_range_well unk_user_review_forum_weight_range=Unknown
% @importance 0.85

0.80::acc(s75, user_review_forum_weight_range).

0.68::true_val(user_review_forum_weight_range, handles_higher_weight_well); 0.32::true_val(user_review_forum_weight_range, unk_user_review_forum_weight_range).

measured(s75, user_review_forum_weight_range, handles_higher_weight_well).

all_consistent(user_review_forum_weight_range) :- consistent(s75, user_review_forum_weight_range).

evidence(all_consistent(user_review_forum_weight_range)).
query(true_val(user_review_forum_weight_range, handles_higher_weight_well)).
query(true_val(user_review_forum_weight_range, unk_user_review_forum_weight_range)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values tgr_list=Amplid_Souly_Grail_K2_Alchemist_Burton_Skeleton_Key_YES_PYL_Weston_Backwoods_and_more unk_comparable_board_cross_brand=Unknown
% @importance 0.75

0.80::acc(s79, comparable_board_cross_brand).

0.64::true_val(comparable_board_cross_brand, tgr_list); 0.36::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s79, comparable_board_cross_brand, tgr_list).

all_consistent(comparable_board_cross_brand) :- consistent(s79, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, tgr_list)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_storm_wolf
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values jones_storm_wolf_699=Jones_Storm_Wolf_at_699_95 unk_comparable_board_cross_brand_storm_wolf=Unknown
% @importance 0.8

0.82::acc(s80, comparable_board_cross_brand_storm_wolf).

0.68::true_val(comparable_board_cross_brand_storm_wolf, jones_storm_wolf_699); 0.32::true_val(comparable_board_cross_brand_storm_wolf, unk_comparable_board_cross_brand_storm_wolf).

measured(s80, comparable_board_cross_brand_storm_wolf, jones_storm_wolf_699).

all_consistent(comparable_board_cross_brand_storm_wolf) :- consistent(s80, comparable_board_cross_brand_storm_wolf).

evidence(all_consistent(comparable_board_cross_brand_storm_wolf)).
query(true_val(comparable_board_cross_brand_storm_wolf, jones_storm_wolf_699)).
query(true_val(comparable_board_cross_brand_storm_wolf, unk_comparable_board_cross_brand_storm_wolf)).

% @attr comparable_board_cross_brand_storm_chaser
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values jones_storm_chaser_699=Jones_Storm_Chaser_at_699_95 unk_comparable_board_cross_brand_storm_chaser=Unknown
% @importance 0.8

0.82::acc(s80, comparable_board_cross_brand_storm_chaser).

0.68::true_val(comparable_board_cross_brand_storm_chaser, jones_storm_chaser_699); 0.32::true_val(comparable_board_cross_brand_storm_chaser, unk_comparable_board_cross_brand_storm_chaser).

measured(s80, comparable_board_cross_brand_storm_chaser, jones_storm_chaser_699).

all_consistent(comparable_board_cross_brand_storm_chaser) :- consistent(s80, comparable_board_cross_brand_storm_chaser).

evidence(all_consistent(comparable_board_cross_brand_storm_chaser)).
query(true_val(comparable_board_cross_brand_storm_chaser, jones_storm_chaser_699)).
query(true_val(comparable_board_cross_brand_storm_chaser, unk_comparable_board_cross_brand_storm_chaser)).

% @attr comparable_board_cross_brand_smooth_operator
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values burton_smooth_operator_899=Burton_Family_Tree_Smooth_Operator_at_899_95 unk_comparable_board_cross_brand_smooth_operator=Unknown
% @importance 0.8

0.82::acc(s80, comparable_board_cross_brand_smooth_operator).

0.68::true_val(comparable_board_cross_brand_smooth_operator, burton_smooth_operator_899); 0.32::true_val(comparable_board_cross_brand_smooth_operator, unk_comparable_board_cross_brand_smooth_operator).

measured(s80, comparable_board_cross_brand_smooth_operator, burton_smooth_operator_899).

all_consistent(comparable_board_cross_brand_smooth_operator) :- consistent(s80, comparable_board_cross_brand_smooth_operator).

evidence(all_consistent(comparable_board_cross_brand_smooth_operator)).
query(true_val(comparable_board_cross_brand_smooth_operator, burton_smooth_operator_899)).
query(true_val(comparable_board_cross_brand_smooth_operator, unk_comparable_board_cross_brand_smooth_operator)).

% @attr comparable_board_cross_brand_lib_tech_orca
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values lib_tech_orca=Lib_Tech_Orca_alternative_powder_oriented unk_comparable_board_cross_brand_lib_tech_orca=Unknown
% @importance 0.45

0.50::acc(s84, comparable_board_cross_brand_lib_tech_orca).

0.23::true_val(comparable_board_cross_brand_lib_tech_orca, lib_tech_orca); 0.77::true_val(comparable_board_cross_brand_lib_tech_orca, unk_comparable_board_cross_brand_lib_tech_orca).

measured(s84, comparable_board_cross_brand_lib_tech_orca, lib_tech_orca).

all_consistent(comparable_board_cross_brand_lib_tech_orca) :- consistent(s84, comparable_board_cross_brand_lib_tech_orca).

evidence(all_consistent(comparable_board_cross_brand_lib_tech_orca)).
query(true_val(comparable_board_cross_brand_lib_tech_orca, lib_tech_orca)).
query(true_val(comparable_board_cross_brand_lib_tech_orca, unk_comparable_board_cross_brand_lib_tech_orca)).

% @attr comparable_board_cross_brand_inertia_list
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values gnu_banked_nidecker_alpha_ride_deep_fake=GNU_Banked_Country_Nidecker_Alpha_APX_Ride_Deep_Fake unk_comparable_board_cross_brand_inertia_list=Unknown
% @importance 0.8

0.80::acc(s50, comparable_board_cross_brand_inertia_list).

0.68::true_val(comparable_board_cross_brand_inertia_list, gnu_banked_nidecker_alpha_ride_deep_fake); 0.32::true_val(comparable_board_cross_brand_inertia_list, unk_comparable_board_cross_brand_inertia_list).

measured(s50, comparable_board_cross_brand_inertia_list, gnu_banked_nidecker_alpha_ride_deep_fake).

all_consistent(comparable_board_cross_brand_inertia_list) :- consistent(s50, comparable_board_cross_brand_inertia_list).

evidence(all_consistent(comparable_board_cross_brand_inertia_list)).
query(true_val(comparable_board_cross_brand_inertia_list, gnu_banked_nidecker_alpha_ride_deep_fake)).
query(true_val(comparable_board_cross_brand_inertia_list, unk_comparable_board_cross_brand_inertia_list)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values navigator_649=The_Navigator_at_649_95_softer_easier unk_comparable_board_same_brand=Unknown
% @importance 0.7

0.80::acc(s81, comparable_board_same_brand).

0.60::true_val(comparable_board_same_brand, navigator_649); 0.40::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s81, comparable_board_same_brand, navigator_649).

all_consistent(comparable_board_same_brand) :- consistent(s81, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, navigator_649)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_bsod
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values bsod_749=BSOD_at_749_95_more_all_mountain_less_taper unk_comparable_board_same_brand_bsod=Unknown
% @importance 0.65

0.68::acc(s82, comparable_board_same_brand_bsod).

0.36::true_val(comparable_board_same_brand_bsod, bsod_749); 0.64::true_val(comparable_board_same_brand_bsod, unk_comparable_board_same_brand_bsod).

measured(s82, comparable_board_same_brand_bsod, bsod_749).

all_consistent(comparable_board_same_brand_bsod) :- consistent(s82, comparable_board_same_brand_bsod).

evidence(all_consistent(comparable_board_same_brand_bsod)).
query(true_val(comparable_board_same_brand_bsod, bsod_749)).
query(true_val(comparable_board_same_brand_bsod, unk_comparable_board_same_brand_bsod)).

% @attr comparable_board_same_brand_mega_death
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values mega_death_1099=Mega_Death_at_1099_95_stiffer_more_carbon unk_comparable_board_same_brand_mega_death=Unknown
% @importance 0.55

0.78::acc(s83, comparable_board_same_brand_mega_death).

0.64::true_val(comparable_board_same_brand_mega_death, mega_death_1099); 0.36::true_val(comparable_board_same_brand_mega_death, unk_comparable_board_same_brand_mega_death).

measured(s83, comparable_board_same_brand_mega_death, mega_death_1099).

all_consistent(comparable_board_same_brand_mega_death) :- consistent(s83, comparable_board_same_brand_mega_death).

evidence(all_consistent(comparable_board_same_brand_mega_death)).
query(true_val(comparable_board_same_brand_mega_death, mega_death_1099)).
query(true_val(comparable_board_same_brand_mega_death, unk_comparable_board_same_brand_mega_death)).

% @attr model_2023_spec
% @type categorical
% @canonical false
% @original_name 2023 model
% @values alpine_v2_hyperdrive_3x25=Alpine_V2_camber_Hyperdrive_base_Moonshot_ProTune_3x25mm_CarbonFlax unk_model_2023_spec=Unknown
% @importance 0.67

0.75::acc(s39, model_2023_spec).
0.68::acc(s42, model_2023_spec).
0.65::acc(s47, model_2023_spec).

0.95::true_val(model_2023_spec, alpine_v2_hyperdrive_3x25); 0.05::true_val(model_2023_spec, unk_model_2023_spec).

measured(s39, model_2023_spec, alpine_v2_hyperdrive_3x25).
measured(s42, model_2023_spec, alpine_v2_hyperdrive_3x25).
measured(s47, model_2023_spec, alpine_v2_hyperdrive_3x25).

all_consistent(model_2023_spec) :-
    consistent(s39, model_2023_spec),
    (indep(s42), consistent(s42, model_2023_spec) ; \+indep(s42)),
    (indep(s47), consistent(s47, model_2023_spec) ; \+indep(s47)).

evidence(all_consistent(model_2023_spec)).
query(true_val(model_2023_spec, alpine_v2_hyperdrive_3x25)).
query(true_val(model_2023_spec, unk_model_2023_spec)).

% @attr model_2024_2025_changes
% @type categorical
% @canonical false
% @original_name 2024/2025 model changes
% @values resort_v3_adv_omnitune=New_Resort_V3_camber_Hyperdrive_ADV_base_Moonshot_OmniTune unk_model_2024_2025_changes=Unknown
% @importance 0.7

0.82::acc(s39, model_2024_2025_changes).

0.63::true_val(model_2024_2025_changes, resort_v3_adv_omnitune); 0.37::true_val(model_2024_2025_changes, unk_model_2024_2025_changes).

measured(s39, model_2024_2025_changes, resort_v3_adv_omnitune).

all_consistent(model_2024_2025_changes) :- consistent(s39, model_2024_2025_changes).

evidence(all_consistent(model_2024_2025_changes)).
query(true_val(model_2024_2025_changes, resort_v3_adv_omnitune)).
query(true_val(model_2024_2025_changes, unk_model_2024_2025_changes)).

% @attr model_2026_changes
% @type categorical
% @canonical false
% @original_name 2026 model changes
% @values adv_xt_base=Upgraded_to_Hyperdrive_ADV_XT_extra_thick_durability unk_model_2026_changes=Unknown
% @importance 0.7

0.90::acc(s85, model_2026_changes).

0.855::true_val(model_2026_changes, adv_xt_base); 0.145::true_val(model_2026_changes, unk_model_2026_changes).

measured(s85, model_2026_changes, adv_xt_base).

all_consistent(model_2026_changes) :- consistent(s85, model_2026_changes).

evidence(all_consistent(model_2026_changes)).
query(true_val(model_2026_changes, adv_xt_base)).
query(true_val(model_2026_changes, unk_model_2026_changes)).

% @attr model_2025_flex_changes
% @type categorical
% @canonical false
% @original_name 2025 model changes
% @values more_relaxed_flex=More_relaxed_flex_pattern_more_accessible unk_model_2025_flex_changes=Unknown
% @importance 0.6

0.72::acc(s62, model_2025_flex_changes).

0.44::true_val(model_2025_flex_changes, more_relaxed_flex); 0.56::true_val(model_2025_flex_changes, unk_model_2025_flex_changes).

measured(s62, model_2025_flex_changes, more_relaxed_flex).

all_consistent(model_2025_flex_changes) :- consistent(s62, model_2025_flex_changes).

evidence(all_consistent(model_2025_flex_changes)).
query(true_val(model_2025_flex_changes, more_relaxed_flex)).
query(true_val(model_2025_flex_changes, unk_model_2025_flex_changes)).

% @attr redesign_year
% @type categorical
% @canonical true
% @original_name redesign_year
% @values upgraded_3x_to_4x_carbonflax=Upgraded_CarbonFlax_from_3x25mm_to_4x25mm unk_redesign_year=Unknown
% @importance 0.875

0.90::acc(s1, redesign_year).
0.70::acc(s42, redesign_year).

0.95::true_val(redesign_year, upgraded_3x_to_4x_carbonflax); 0.05::true_val(redesign_year, unk_redesign_year).

measured(s1, redesign_year, upgraded_3x_to_4x_carbonflax).
measured(s42, redesign_year, upgraded_3x_to_4x_carbonflax).

all_consistent(redesign_year) :-
    consistent(s1, redesign_year),
    (indep(s42), consistent(s42, redesign_year) ; \+indep(s42)).

evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, upgraded_3x_to_4x_carbonflax)).
query(true_val(redesign_year, unk_redesign_year)).

% @attr sustainability_certification_magic_bean
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values magic_bean_60pct_renewable=Magic_Bean_Resin_60pct_renewable_agricultural unk_sustainability_certification_magic_bean=Unknown
% @importance 0.55

0.78::acc(s44, sustainability_certification_magic_bean).

0.59::true_val(sustainability_certification_magic_bean, magic_bean_60pct_renewable); 0.41::true_val(sustainability_certification_magic_bean, unk_sustainability_certification_magic_bean).

measured(s44, sustainability_certification_magic_bean, magic_bean_60pct_renewable).

all_consistent(sustainability_certification_magic_bean) :-
    (indep(s44), consistent(s44, sustainability_certification_magic_bean) ; \+indep(s44)).

evidence(all_consistent(sustainability_certification_magic_bean)).
query(true_val(sustainability_certification_magic_bean, magic_bean_60pct_renewable)).
query(true_val(sustainability_certification_magic_bean, unk_sustainability_certification_magic_bean)).

% @attr sustainability_certification_uv_ink
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values water_based_uv_solventless=Water_based_UV_ink_solventless unk_sustainability_certification_uv_ink=Unknown
% @importance 1.0

0.90::acc(s1, sustainability_certification_uv_ink).

0.81::true_val(sustainability_certification_uv_ink, water_based_uv_solventless); 0.19::true_val(sustainability_certification_uv_ink, unk_sustainability_certification_uv_ink).

measured(s1, sustainability_certification_uv_ink, water_based_uv_solventless).

all_consistent(sustainability_certification_uv_ink) :- consistent(s1, sustainability_certification_uv_ink).

evidence(all_consistent(sustainability_certification_uv_ink)).
query(true_val(sustainability_certification_uv_ink, water_based_uv_solventless)).
query(true_val(sustainability_certification_uv_ink, unk_sustainability_certification_uv_ink)).

% @attr sustainability_certification_recycling
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values all_scraps_recycled=All_production_scraps_recycled unk_sustainability_certification_recycling=Unknown
% @importance 0.4

0.85::acc(s86, sustainability_certification_recycling).

0.77::true_val(sustainability_certification_recycling, all_scraps_recycled); 0.23::true_val(sustainability_certification_recycling, unk_sustainability_certification_recycling).

measured(s86, sustainability_certification_recycling, all_scraps_recycled).

all_consistent(sustainability_certification_recycling) :- consistent(s86, sustainability_certification_recycling).

evidence(all_consistent(sustainability_certification_recycling)).
query(true_val(sustainability_certification_recycling, all_scraps_recycled)).
query(true_val(sustainability_certification_recycling, unk_sustainability_certification_recycling)).

% @attr sustainability_certification_shrink_wrap
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values recyclable_shrink_wrap=100pct_recyclable_shrink_wrap_film unk_sustainability_certification_shrink_wrap=Unknown
% @importance 0.4

0.85::acc(s86, sustainability_certification_shrink_wrap).

0.77::true_val(sustainability_certification_shrink_wrap, recyclable_shrink_wrap); 0.23::true_val(sustainability_certification_shrink_wrap, unk_sustainability_certification_shrink_wrap).

measured(s86, sustainability_certification_shrink_wrap, recyclable_shrink_wrap).

all_consistent(sustainability_certification_shrink_wrap) :- consistent(s86, sustainability_certification_shrink_wrap).

evidence(all_consistent(sustainability_certification_shrink_wrap)).
query(true_val(sustainability_certification_shrink_wrap, recyclable_shrink_wrap)).
query(true_val(sustainability_certification_shrink_wrap, unk_sustainability_certification_shrink_wrap)).

% @attr powder_score_snowboardingprofiles
% @type numeric
% @canonical true
% @original_name powder_score_snowboardingprofiles
% @unit /100
% @values v84_5=84.5 unk_powder_score_snowboardingprofiles=Unknown
% @importance 0.6

0.72::acc(s87, powder_score_snowboardingprofiles).

0.52::true_val(powder_score_snowboardingprofiles, v84_5); 0.48::true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles).

measured(s87, powder_score_snowboardingprofiles, v84_5).

all_consistent(powder_score_snowboardingprofiles) :- consistent(s87, powder_score_snowboardingprofiles).

evidence(all_consistent(powder_score_snowboardingprofiles)).
query(true_val(powder_score_snowboardingprofiles, v84_5)).
query(true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles)).

% @attr user_review_forum_highly_positive
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values cant_say_enough=Highly_positive_cant_say_enough_about_this_board unk_user_review_forum_highly_positive=Unknown
% @importance 0.6

0.65::acc(s63, user_review_forum_highly_positive).

0.38::true_val(user_review_forum_highly_positive, cant_say_enough); 0.62::true_val(user_review_forum_highly_positive, unk_user_review_forum_highly_positive).

measured(s63, user_review_forum_highly_positive, cant_say_enough).

all_consistent(user_review_forum_highly_positive) :- consistent(s63, user_review_forum_highly_positive).

evidence(all_consistent(user_review_forum_highly_positive)).
query(true_val(user_review_forum_highly_positive, cant_say_enough)).
query(true_val(user_review_forum_highly_positive, unk_user_review_forum_highly_positive)).

% @attr outdoor_gear_lab_opinion
% @type categorical
% @canonical false
% @original_name Outdoor Gear Lab
% @values incredibly_well_rounded=Incredibly_well_rounded_excellent_choice unk_outdoor_gear_lab_opinion=Unknown
% @importance 0.8

0.82::acc(s51, outdoor_gear_lab_opinion).

0.68::true_val(outdoor_gear_lab_opinion, incredibly_well_rounded); 0.32::true_val(outdoor_gear_lab_opinion, unk_outdoor_gear_lab_opinion).

measured(s51, outdoor_gear_lab_opinion, incredibly_well_rounded).

all_consistent(outdoor_gear_lab_opinion) :- consistent(s51, outdoor_gear_lab_opinion).

evidence(all_consistent(outdoor_gear_lab_opinion)).
query(true_val(outdoor_gear_lab_opinion, incredibly_well_rounded)).
query(true_val(outdoor_gear_lab_opinion, unk_outdoor_gear_lab_opinion)).