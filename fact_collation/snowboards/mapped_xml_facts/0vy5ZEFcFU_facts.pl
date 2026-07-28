0.15::indep(s2).
0.20::indep(s3).
0.80::indep(s4).
0.80::indep(s5).
0.95::indep(s6).
0.25::indep(s7).
0.95::indep(s8).
0.20::indep(s9).
0.15::indep(s10).
0.95::indep(s11).
0.15::indep(s12).
0.90::indep(s13).
0.15::indep(s14).
0.80::indep(s15).
0.90::indep(s16).
0.80::indep(s17).
0.25::indep(s18).
0.20::indep(s19).
0.15::indep(s20).
0.15::indep(s21).
0.15::indep(s22).
0.15::indep(s23).
0.50::indep(s24).
0.15::indep(s25).
0.15::indep(s26).
0.75::indep(s27).
0.15::indep(s28).
0.15::indep(s29).
0.80::indep(s30).
0.20::indep(s31).
0.90::indep(s32).
0.30::indep(s33).
0.95::indep(s34).
0.95::indep(s35).
0.95::indep(s36).
0.95::indep(s37).
0.95::indep(s38).
0.95::indep(s39).
0.85::indep(s40).
0.80::indep(s41).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values capita=CAPiTA unk_brand=Unknown
% @importance 0.90

0.95::true_val(brand, capita); 0.05::true_val(brand, unk_brand).
0.95::acc(s1, brand).
0.70::acc(s2, brand).
measured(s1, brand, capita).
measured(s2, brand, capita).
all_consistent(brand) :- consistent(s1, brand), (indep(s2), consistent(s2, brand) ; \+indep(s2)).
evidence(all_consistent(brand)).
query(true_val(brand, capita)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values aeronaut=Aeronaut unk_model_name=Unknown
% @importance 0.90

0.95::true_val(model_name, aeronaut); 0.05::true_val(model_name, unk_model_name).
0.95::acc(s1, model_name).
0.70::acc(s2, model_name).
measured(s1, model_name, aeronaut).
measured(s2, model_name, aeronaut).
all_consistent(model_name) :- consistent(s1, model_name), (indep(s2), consistent(s2, model_name) ; \+indep(s2)).
evidence(all_consistent(model_name)).
query(true_val(model_name, aeronaut)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2027=2027 unk_model_year=Unknown
% @importance 0.75

0.92::true_val(model_year, y2027); 0.08::true_val(model_year, unk_model_year).
0.70::acc(s2, model_year).
0.68::acc(s3, model_year).
measured(s2, model_year, y2027).
measured(s3, model_year, y2027).
all_consistent(model_year) :- consistent(s2, model_year), (indep(s3), consistent(s3, model_year) ; \+indep(s3)).
evidence(all_consistent(model_year)).
query(true_val(model_year, y2027)).
query(true_val(model_year, unk_model_year)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.90

0.95::true_val(product_type, snowboard); 0.05::true_val(product_type, unk_product_type).
0.95::acc(s1, product_type).
0.70::acc(s2, product_type).
measured(s1, product_type, snowboard).
measured(s2, product_type, snowboard).
all_consistent(product_type) :- consistent(s1, product_type), (indep(s2), consistent(s2, product_type) ; \+indep(s2)).
evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.73

0.92::true_val(gender, mens); 0.08::true_val(gender, unk_gender).
0.70::acc(s2, gender).
0.55::acc(s7, gender).
measured(s2, gender, mens).
measured(s7, gender, mens).
all_consistent(gender) :- consistent(s2, gender), (indep(s7), consistent(s7, gender) ; \+indep(s7)).
evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values capita_c3_core=CAPiTA_by_C3_Worldwide_manufactured_Core_Srl unk_manufacturer=Unknown
% @importance 1.0

0.92::true_val(manufacturer, capita_c3_core); 0.08::true_val(manufacturer, unk_manufacturer).
0.95::acc(s1, manufacturer).
measured(s1, manufacturer, capita_c3_core).
all_consistent(manufacturer) :- consistent(s1, manufacturer).
evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, capita_c3_core)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr brand_founding_year
% @type numeric
% @canonical false
% @original_name Brand founding year
% @values v2000=2000
% @importance 0.45

0.86::true_val(brand_founding_year, v2000); 0.14::true_val(brand_founding_year, unk_brand_founding_year).
0.90::acc(s15, brand_founding_year).
measured(s15, brand_founding_year, v2000).
all_consistent(brand_founding_year) :- consistent(s15, brand_founding_year).
evidence(all_consistent(brand_founding_year)).
query(true_val(brand_founding_year, v2000)).
query(true_val(brand_founding_year, unk_brand_founding_year)).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values austria_mothership=Austria_MotherShip_Feistritz unk_manufacturing_location=Unknown
% @importance 0.83

0.95::true_val(manufacturing_location, austria_mothership); 0.05::true_val(manufacturing_location, unk_manufacturing_location).
0.95::acc(s1, manufacturing_location).
0.93::acc(s4, manufacturing_location).
0.90::acc(s5, manufacturing_location).
measured(s1, manufacturing_location, austria_mothership).
measured(s4, manufacturing_location, austria_mothership).
measured(s5, manufacturing_location, austria_mothership).
all_consistent(manufacturing_location) :- consistent(s1, manufacturing_location), (indep(s4), consistent(s4, manufacturing_location) ; \+indep(s4)), (indep(s5), consistent(s5, manufacturing_location) ; \+indep(s5)).
evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, austria_mothership)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

% @attr manufacturing_description
% @type categorical
% @canonical false
% @original_name Manufacturing description
% @values handcrafted_clean_energy=Handcrafted_in_Austria_with_clean_energy unk_manufacturing_description=Unknown
% @importance 0.75

0.95::true_val(manufacturing_description, handcrafted_clean_energy); 0.05::true_val(manufacturing_description, unk_manufacturing_description).
0.93::acc(s1, manufacturing_description).
0.93::acc(s4, manufacturing_description).
measured(s1, manufacturing_description, handcrafted_clean_energy).
measured(s4, manufacturing_description, handcrafted_clean_energy).
all_consistent(manufacturing_description) :- consistent(s1, manufacturing_description), (indep(s4), consistent(s4, manufacturing_description) ; \+indep(s4)).
evidence(all_consistent(manufacturing_description)).
query(true_val(manufacturing_description, handcrafted_clean_energy)).
query(true_val(manufacturing_description, unk_manufacturing_description)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values bcorp_98_9=Certified_B_Corp_score_98_9 unk_sustainability_certification=Unknown
% @importance 0.45

0.86::true_val(sustainability_certification, bcorp_98_9); 0.14::true_val(sustainability_certification, unk_sustainability_certification).
0.90::acc(s15, sustainability_certification).
measured(s15, sustainability_certification, bcorp_98_9).
all_consistent(sustainability_certification) :- consistent(s15, sustainability_certification).
evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, bcorp_98_9)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr sustainability_certification_energy
% @type categorical
% @canonical false
% @original_name sustainability_certification (energy system)
% @values hydro_nh3_solar=Hydro_NH3_thermal_plus_solar_zero_emissions unk_sustainability_certification_energy=Unknown
% @importance 0.73

0.92::true_val(sustainability_certification_energy, hydro_nh3_solar); 0.08::true_val(sustainability_certification_energy, unk_sustainability_certification_energy).
0.94::acc(s1, sustainability_certification_energy).
0.90::acc(s5, sustainability_certification_energy).
measured(s1, sustainability_certification_energy, hydro_nh3_solar).
measured(s5, sustainability_certification_energy, hydro_nh3_solar).
all_consistent(sustainability_certification_energy) :- consistent(s1, sustainability_certification_energy), (indep(s5), consistent(s5, sustainability_certification_energy) ; \+indep(s5)).
evidence(all_consistent(sustainability_certification_energy)).
query(true_val(sustainability_certification_energy, hydro_nh3_solar)).
query(true_val(sustainability_certification_energy, unk_sustainability_certification_energy)).

% @attr sustainability_certification_local_supply
% @type categorical
% @canonical false
% @original_name sustainability_certification (local supply)
% @values pct98_local=98pct_locally_supplied unk_sustainability_certification_local_supply=Unknown
% @importance 0.35

0.51::true_val(sustainability_certification_local_supply, pct98_local); 0.49::true_val(sustainability_certification_local_supply, unk_sustainability_certification_local_supply).
0.60::acc(s16, sustainability_certification_local_supply).
measured(s16, sustainability_certification_local_supply, pct98_local).
all_consistent(sustainability_certification_local_supply) :- consistent(s16, sustainability_certification_local_supply).
evidence(all_consistent(sustainability_certification_local_supply)).
query(true_val(sustainability_certification_local_supply, pct98_local)).
query(true_val(sustainability_certification_local_supply, unk_sustainability_certification_local_supply)).

% @attr nfc_technology
% @type categorical
% @canonical false
% @original_name NFC technology
% @values embedded_nfc=Embedded_NFC_chip_nose_registration_warranty unk_nfc_technology=Unknown
% @importance 0.68

0.90::true_val(nfc_technology, embedded_nfc); 0.10::true_val(nfc_technology, unk_nfc_technology).
0.93::acc(s1, nfc_technology).
0.90::acc(s17, nfc_technology).
measured(s1, nfc_technology, embedded_nfc).
measured(s17, nfc_technology, embedded_nfc).
all_consistent(nfc_technology) :- consistent(s1, nfc_technology), (indep(s17), consistent(s17, nfc_technology) ; \+indep(s17)).
evidence(all_consistent(nfc_technology)).
query(true_val(nfc_technology, embedded_nfc)).
query(true_val(nfc_technology, unk_nfc_technology)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values arthur_longo=Arthur_Longo unk_pro_rider_name=Unknown
% @importance 0.83

0.95::true_val(pro_rider_name, arthur_longo); 0.05::true_val(pro_rider_name, unk_pro_rider_name).
0.95::acc(s1, pro_rider_name).
0.70::acc(s2, pro_rider_name).
0.68::acc(s3, pro_rider_name).
measured(s1, pro_rider_name, arthur_longo).
measured(s2, pro_rider_name, arthur_longo).
measured(s3, pro_rider_name, arthur_longo).
all_consistent(pro_rider_name) :- consistent(s1, pro_rider_name), (indep(s2), consistent(s2, pro_rider_name) ; \+indep(s2)), (indep(s3), consistent(s3, pro_rider_name) ; \+indep(s3)).
evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, arthur_longo)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr model_first_available_year
% @type numeric
% @canonical true
% @original_name model_first_available_year
% @values y2024=2024
% @importance 0.85

0.82::true_val(model_first_available_year, y2024); 0.18::true_val(model_first_available_year, unk_model_first_available_year).
0.82::acc(s6, model_first_available_year).
measured(s6, model_first_available_year, y2024).
all_consistent(model_first_available_year) :- consistent(s6, model_first_available_year).
evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2024)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr redesign_year
% @type categorical
% @canonical true
% @original_name redesign_year
% @values graphics_alpine_v3=Graphics_update_Alpine_V3_camber_refinements minor_base_upgrade=Minor_base_upgrade_HyperDrive_ADV_XT graphics_deeper_camber=Graphics_and_deeper_camber_profile unk_redesign_year=Unknown
% @importance 0.63

0.40::true_val(redesign_year, graphics_alpine_v3); 0.35::true_val(redesign_year, minor_base_upgrade); 0.20::true_val(redesign_year, graphics_deeper_camber); 0.05::true_val(redesign_year, unk_redesign_year).
0.55::acc(s7, redesign_year).
0.80::acc(s8, redesign_year).
0.65::acc(s9, redesign_year).
measured(s7, redesign_year, graphics_alpine_v3).
measured(s8, redesign_year, minor_base_upgrade).
measured(s9, redesign_year, graphics_deeper_camber).
all_consistent(redesign_year) :- consistent(s7, redesign_year), consistent(s8, redesign_year), (indep(s9), consistent(s9, redesign_year) ; \+indep(s9)).
evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, graphics_alpine_v3)).
query(true_val(redesign_year, minor_base_upgrade)).
query(true_val(redesign_year, graphics_deeper_camber)).
query(true_val(redesign_year, unk_redesign_year)).

% @attr design_philosophy
% @type categorical
% @canonical false
% @original_name Design philosophy
% @values retro_directional_resort_max=Semi_old_school_directional_cambered_local_resort_maximizer unk_design_philosophy=Unknown
% @importance 0.50

0.80::true_val(design_philosophy, retro_directional_resort_max); 0.20::true_val(design_philosophy, unk_design_philosophy).
0.75::acc(s10, design_philosophy).
measured(s10, design_philosophy, retro_directional_resort_max).
all_consistent(design_philosophy) :- consistent(s10, design_philosophy).
evidence(all_consistent(design_philosophy)).
query(true_val(design_philosophy, retro_directional_resort_max)).
query(true_val(design_philosophy, unk_design_philosophy)).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v699_95=699.95 v649=649.0
% @importance 0.97

0.65::true_val(price_usd_msrp, v699_95); 0.35::true_val(price_usd_msrp, v649).
0.95::acc(s1, price_usd_msrp).
0.65::acc(s11, price_usd_msrp).
measured(s1, price_usd_msrp, v699_95).
measured(s11, price_usd_msrp, v649).
all_consistent(price_usd_msrp) :- consistent(s1, price_usd_msrp), consistent(s11, price_usd_msrp).
evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v699_95)).
query(true_val(price_usd_msrp, v649)).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v1249_99=1249.99 unk_price_aud_merchant=Unknown
% @importance 0.90

0.83::true_val(price_aud_merchant, v1249_99); 0.17::true_val(price_aud_merchant, unk_price_aud_merchant).
0.70::acc(s12, price_aud_merchant).
measured(s12, price_aud_merchant, v1249_99).
all_consistent(price_aud_merchant) :- consistent(s12, price_aud_merchant).
evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v1249_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_evo
% @values v559_95=559.95 unk_price_usd_evo=Unknown
% @importance 0.90

0.85::true_val(price_usd_evo, v559_95); 0.15::true_val(price_usd_evo, unk_price_usd_evo).
0.80::acc(s13, price_usd_evo).
measured(s13, price_usd_evo, v559_95).
all_consistent(price_usd_evo) :- consistent(s13, price_usd_evo).
evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v559_95)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_eur_blue_tomato
% @type numeric
% @unit EUR
% @canonical false
% @original_name price_eur_blue_tomato
% @values v529=529.0 unk_price_eur_blue_tomato=Unknown
% @importance 0.90

0.85::true_val(price_eur_blue_tomato, v529); 0.15::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).
0.80::acc(s13, price_eur_blue_tomato).
measured(s13, price_eur_blue_tomato, v529).
all_consistent(price_eur_blue_tomato) :- consistent(s13, price_eur_blue_tomato).
evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v529)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

% @attr price_gbp_blue_tomato_uk
% @type numeric
% @unit GBP
% @canonical false
% @original_name price_gbp_blue_tomato_uk
% @values v475=475.0 unk_price_gbp_blue_tomato_uk=Unknown
% @importance 0.90

0.85::true_val(price_gbp_blue_tomato_uk, v475); 0.15::true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk).
0.80::acc(s13, price_gbp_blue_tomato_uk).
measured(s13, price_gbp_blue_tomato_uk, v475).
all_consistent(price_gbp_blue_tomato_uk) :- consistent(s13, price_gbp_blue_tomato_uk).
evidence(all_consistent(price_gbp_blue_tomato_uk)).
query(true_val(price_gbp_blue_tomato_uk, v475)).
query(true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk)).

% @attr price_cad_prfo
% @type numeric
% @unit CAD
% @canonical false
% @original_name price_cad_prfo
% @values v719_99=719.99 unk_price_cad_prfo=Unknown
% @importance 0.90

0.85::true_val(price_cad_prfo, v719_99); 0.15::true_val(price_cad_prfo, unk_price_cad_prfo).
0.80::acc(s13, price_cad_prfo).
measured(s13, price_cad_prfo, v719_99).
all_consistent(price_cad_prfo) :- consistent(s13, price_cad_prfo).
evidence(all_consistent(price_cad_prfo)).
query(true_val(price_cad_prfo, v719_99)).
query(true_val(price_cad_prfo, unk_price_cad_prfo)).

% @attr estimated_availability_date
% @type categorical
% @canonical false
% @original_name Estimated availability date
% @values apr_may_2026=April_May_2026 unk_estimated_availability_date=Unknown
% @importance 0.75

0.81::true_val(estimated_availability_date, apr_may_2026); 0.19::true_val(estimated_availability_date, unk_estimated_availability_date).
0.70::acc(s14, estimated_availability_date).
measured(s14, estimated_availability_date, apr_may_2026).
all_consistent(estimated_availability_date) :- consistent(s14, estimated_availability_date).
evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, apr_may_2026)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

% @attr availability_status
% @type categorical
% @canonical false
% @original_name Availability status
% @values in_stock_multiple=In_stock_multiple_US_EU_retailers unk_availability_status=Unknown
% @importance 0.90

0.85::true_val(availability_status, in_stock_multiple); 0.15::true_val(availability_status, unk_availability_status).
0.80::acc(s13, availability_status).
measured(s13, availability_status, in_stock_multiple).
all_consistent(availability_status) :- consistent(s13, availability_status).
evidence(all_consistent(availability_status)).
query(true_val(availability_status, in_stock_multiple)).
query(true_val(availability_status, unk_availability_status)).

% @attr supplier_capita
% @type categorical
% @canonical false
% @original_name supplier (CAPiTA direct)
% @values available=Available unk_supplier_capita=Unknown
% @importance 1.0

0.92::true_val(supplier_capita, available); 0.08::true_val(supplier_capita, unk_supplier_capita).
0.95::acc(s1, supplier_capita).
measured(s1, supplier_capita, available).
all_consistent(supplier_capita) :- consistent(s1, supplier_capita).
evidence(all_consistent(supplier_capita)).
query(true_val(supplier_capita, available)).
query(true_val(supplier_capita, unk_supplier_capita)).

% @attr supplier_evo
% @type categorical
% @canonical false
% @original_name supplier (evo.com)
% @values available=Available unk_supplier_evo=Unknown
% @importance 0.70

0.82::true_val(supplier_evo, available); 0.18::true_val(supplier_evo, unk_supplier_evo).
0.80::acc(s18, supplier_evo).
measured(s18, supplier_evo, available).
all_consistent(supplier_evo) :- consistent(s18, supplier_evo).
evidence(all_consistent(supplier_evo)).
query(true_val(supplier_evo, available)).
query(true_val(supplier_evo, unk_supplier_evo)).

% @attr supplier_tactics
% @type categorical
% @canonical false
% @original_name supplier (Tactics.com)
% @values available=Available unk_supplier_tactics=Unknown
% @importance 0.55

0.78::true_val(supplier_tactics, available); 0.22::true_val(supplier_tactics, unk_supplier_tactics).
0.78::acc(s19, supplier_tactics).
measured(s19, supplier_tactics, available).
all_consistent(supplier_tactics) :- consistent(s19, supplier_tactics).
evidence(all_consistent(supplier_tactics)).
query(true_val(supplier_tactics, available)).
query(true_val(supplier_tactics, unk_supplier_tactics)).

% @attr supplier_blauer
% @type categorical
% @canonical false
% @original_name supplier (Blauer Board Shop)
% @values available=Available unk_supplier_blauer=Unknown
% @importance 0.65

0.78::true_val(supplier_blauer, available); 0.22::true_val(supplier_blauer, unk_supplier_blauer).
0.75::acc(s20, supplier_blauer).
measured(s20, supplier_blauer, available).
all_consistent(supplier_blauer) :- consistent(s20, supplier_blauer).
evidence(all_consistent(supplier_blauer)).
query(true_val(supplier_blauer, available)).
query(true_val(supplier_blauer, unk_supplier_blauer)).

% @attr supplier_the_house
% @type categorical
% @canonical false
% @original_name supplier (The House)
% @values available=Available unk_supplier_the_house=Unknown
% @importance 0.90

0.85::true_val(supplier_the_house, available); 0.15::true_val(supplier_the_house, unk_supplier_the_house).
0.80::acc(s13, supplier_the_house).
measured(s13, supplier_the_house, available).
all_consistent(supplier_the_house) :- consistent(s13, supplier_the_house).
evidence(all_consistent(supplier_the_house)).
query(true_val(supplier_the_house, available)).
query(true_val(supplier_the_house, unk_supplier_the_house)).

% @attr supplier_backcountry
% @type categorical
% @canonical false
% @original_name supplier (Backcountry.com)
% @values available=Available unk_supplier_backcountry=Unknown
% @importance 0.90

0.85::true_val(supplier_backcountry, available); 0.15::true_val(supplier_backcountry, unk_supplier_backcountry).
0.80::acc(s13, supplier_backcountry).
measured(s13, supplier_backcountry, available).
all_consistent(supplier_backcountry) :- consistent(s13, supplier_backcountry).
evidence(all_consistent(supplier_backcountry)).
query(true_val(supplier_backcountry, available)).
query(true_val(supplier_backcountry, unk_supplier_backcountry)).

% @attr supplier_rhythm
% @type categorical
% @canonical false
% @original_name supplier (Rhythm Snowsports Australia)
% @values available=Available unk_supplier_rhythm=Unknown
% @importance 0.30

0.79::true_val(supplier_rhythm, available); 0.21::true_val(supplier_rhythm, unk_supplier_rhythm).
0.72::acc(s21, supplier_rhythm).
measured(s21, supplier_rhythm, available).
all_consistent(supplier_rhythm) :- consistent(s21, supplier_rhythm).
evidence(all_consistent(supplier_rhythm)).
query(true_val(supplier_rhythm, available)).
query(true_val(supplier_rhythm, unk_supplier_rhythm)).

% @attr supplier_melbourne
% @type categorical
% @canonical false
% @original_name supplier (Melbourne Snowboard Centre)
% @values available=Available unk_supplier_melbourne=Unknown
% @importance 0.40

0.77::true_val(supplier_melbourne, available); 0.23::true_val(supplier_melbourne, unk_supplier_melbourne).
0.70::acc(s22, supplier_melbourne).
measured(s22, supplier_melbourne, available).
all_consistent(supplier_melbourne) :- consistent(s22, supplier_melbourne).
evidence(all_consistent(supplier_melbourne)).
query(true_val(supplier_melbourne, available)).
query(true_val(supplier_melbourne, unk_supplier_melbourne)).

% @attr supplier_balmoral
% @type categorical
% @canonical false
% @original_name supplier (Balmoral Boards Australia)
% @values available=Available unk_supplier_balmoral=Unknown
% @importance 0.75

0.81::true_val(supplier_balmoral, available); 0.19::true_val(supplier_balmoral, unk_supplier_balmoral).
0.70::acc(s14, supplier_balmoral).
measured(s14, supplier_balmoral, available).
all_consistent(supplier_balmoral) :- consistent(s14, supplier_balmoral).
evidence(all_consistent(supplier_balmoral)).
query(true_val(supplier_balmoral, available)).
query(true_val(supplier_balmoral, unk_supplier_balmoral)).

% @attr supplier_whiteroom
% @type categorical
% @canonical false
% @original_name supplier (Whiteroom Snow Australia)
% @values available=Available unk_supplier_whiteroom=Unknown
% @importance 0.30

0.77::true_val(supplier_whiteroom, available); 0.23::true_val(supplier_whiteroom, unk_supplier_whiteroom).
0.70::acc(s23, supplier_whiteroom).
measured(s23, supplier_whiteroom, available).
all_consistent(supplier_whiteroom) :- consistent(s23, supplier_whiteroom).
evidence(all_consistent(supplier_whiteroom)).
query(true_val(supplier_whiteroom, available)).
query(true_val(supplier_whiteroom, unk_supplier_whiteroom)).

% @attr supplier_ski_monster
% @type categorical
% @canonical false
% @original_name supplier (The Ski Monster)
% @values available=Available unk_supplier_ski_monster=Unknown
% @importance 0.75

0.80::true_val(supplier_ski_monster, available); 0.20::true_val(supplier_ski_monster, unk_supplier_ski_monster).
0.72::acc(s24, supplier_ski_monster).
measured(s24, supplier_ski_monster, available).
all_consistent(supplier_ski_monster) :- consistent(s24, supplier_ski_monster).
evidence(all_consistent(supplier_ski_monster)).
query(true_val(supplier_ski_monster, available)).
query(true_val(supplier_ski_monster, unk_supplier_ski_monster)).

% @attr supplier_snow_rock
% @type categorical
% @canonical false
% @original_name supplier (Snow+Rock UK)
% @values available=Available unk_supplier_snow_rock=Unknown
% @importance 0.50

0.78::true_val(supplier_snow_rock, available); 0.22::true_val(supplier_snow_rock, unk_supplier_snow_rock).
0.75::acc(s25, supplier_snow_rock).
measured(s25, supplier_snow_rock, available).
all_consistent(supplier_snow_rock) :- consistent(s25, supplier_snow_rock).
evidence(all_consistent(supplier_snow_rock)).
query(true_val(supplier_snow_rock, available)).
query(true_val(supplier_snow_rock, unk_supplier_snow_rock)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain_freeride=All_Mountain_Freeride unk_board_category=Unknown
% @importance 0.90

0.95::true_val(board_category, all_mountain_freeride); 0.05::true_val(board_category, unk_board_category).
0.95::acc(s1, board_category).
0.70::acc(s2, board_category).
measured(s1, board_category, all_mountain_freeride).
measured(s2, board_category, all_mountain_freeride).
all_consistent(board_category) :- consistent(s1, board_category), (indep(s2), consistent(s2, board_category) ; \+indep(s2)).
evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain_freeride)).
query(true_val(board_category, unk_board_category)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional_20mm_setback=Tapered_Directional_20mm_setback unk_shape=Unknown
% @importance 0.90

0.95::true_val(shape, tapered_directional_20mm_setback); 0.05::true_val(shape, unk_shape).
0.95::acc(s1, shape).
0.70::acc(s26, shape).
measured(s1, shape, tapered_directional_20mm_setback).
measured(s26, shape, tapered_directional_20mm_setback).
all_consistent(shape) :- consistent(s1, shape), (indep(s26), consistent(s26, shape) ; \+indep(s26)).
evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional_20mm_setback)).
query(true_val(shape, unk_shape)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values alpine_v3_directional=Alpine_V3_Directional unk_camber_type=Unknown
% @importance 1.0

0.92::true_val(camber_type, alpine_v3_directional); 0.08::true_val(camber_type, unk_camber_type).
0.95::acc(s1, camber_type).
measured(s1, camber_type, alpine_v3_directional).
all_consistent(camber_type) :- consistent(s1, camber_type).
evidence(all_consistent(camber_type)).
query(true_val(camber_type, alpine_v3_directional)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical false
% @original_name Camber description
% @values v7mm_zeros_before_sidecut_end=7mm_traditional_camber_zeros_before_sidecut_end unk_camber_description=Unknown
% @importance 1.0

0.92::true_val(camber_description, v7mm_zeros_before_sidecut_end); 0.08::true_val(camber_description, unk_camber_description).
0.95::acc(s1, camber_description).
measured(s1, camber_description, v7mm_zeros_before_sidecut_end).
all_consistent(camber_description) :- consistent(s1, camber_description).
evidence(all_consistent(camber_description)).
query(true_val(camber_description, v7mm_zeros_before_sidecut_end)).
query(true_val(camber_description, unk_camber_description)).

% @attr flex_rating_10_manufacturer
% @type numeric
% @unit /10
% @canonical false
% @original_name flex_rating_10_manufacturer
% @values v6=6.0 unk_flex_rating_10_manufacturer=Unknown
% @importance 0.90

0.95::true_val(flex_rating_10_manufacturer, v6); 0.05::true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer).
0.95::acc(s1, flex_rating_10_manufacturer).
0.70::acc(s26, flex_rating_10_manufacturer).
measured(s1, flex_rating_10_manufacturer, v6).
measured(s26, flex_rating_10_manufacturer, v6).
all_consistent(flex_rating_10_manufacturer) :- consistent(s1, flex_rating_10_manufacturer), (indep(s26), consistent(s26, flex_rating_10_manufacturer) ; \+indep(s26)).
evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, v6)).
query(true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer)).

% @attr flex_rating_10_evo
% @type categorical
% @canonical false
% @original_name flex_rating_10_evo
% @values medium_boundary=Medium_at_boundary_of_stiff unk_flex_rating_10_evo=Unknown
% @importance 0.70

0.82::true_val(flex_rating_10_evo, medium_boundary); 0.18::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).
0.78::acc(s18, flex_rating_10_evo).
measured(s18, flex_rating_10_evo, medium_boundary).
all_consistent(flex_rating_10_evo) :- consistent(s18, flex_rating_10_evo).
evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, medium_boundary)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

% @attr flex_feel
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_feel
% @values v6=6.0 v7=7.0
% @importance 0.83

0.70::true_val(flex_feel, v6); 0.30::true_val(flex_feel, v7).
0.95::acc(s1, flex_feel).
0.62::acc(s27, flex_feel).
0.78::acc(s18, flex_feel).
0.82::acc(s6, flex_feel).
0.88::acc(s11, flex_feel).
measured(s1, flex_feel, v6).
measured(s27, flex_feel, v7).
measured(s18, flex_feel, v6).
measured(s6, flex_feel, v6).
measured(s11, flex_feel, v6).
all_consistent(flex_feel) :- consistent(s1, flex_feel), (indep(s27), consistent(s27, flex_feel) ; \+indep(s27)), (indep(s18), consistent(s18, flex_feel) ; \+indep(s18)), (indep(s6), consistent(s6, flex_feel) ; \+indep(s6)), consistent(s11, flex_feel).
evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, v6)).
query(true_val(flex_feel, v7)).

% @attr flex_direction
% @type categorical
% @canonical false
% @original_name Flex direction
% @values directional=Directional_nose_differs_from_tail unk_flex_direction=Unknown
% @importance 0.85

0.82::true_val(flex_direction, directional); 0.18::true_val(flex_direction, unk_flex_direction).
0.82::acc(s6, flex_direction).
measured(s6, flex_direction, directional).
all_consistent(flex_direction) :- consistent(s6, flex_direction).
evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values progressive=Progressive unk_sidecut_type=Unknown
% @importance 1.0

0.92::true_val(sidecut_type, progressive); 0.08::true_val(sidecut_type, unk_sidecut_type).
0.95::acc(s1, sidecut_type).
measured(s1, sidecut_type, progressive).
all_consistent(sidecut_type) :- consistent(s1, sidecut_type).
evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, progressive)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr sidecut_description
% @type categorical
% @canonical false
% @original_name Sidecut description
% @values three_stage_turn=Three_stage_turn_initiation_control_power unk_sidecut_description=Unknown
% @importance 1.0

0.92::true_val(sidecut_description, three_stage_turn); 0.08::true_val(sidecut_description, unk_sidecut_description).
0.93::acc(s1, sidecut_description).
measured(s1, sidecut_description, three_stage_turn).
all_consistent(sidecut_description) :- consistent(s1, sidecut_description).
evidence(all_consistent(sidecut_description)).
query(true_val(sidecut_description, three_stage_turn)).
query(true_val(sidecut_description, unk_sidecut_description)).

% @attr taper
% @type numeric
% @unit cm
% @canonical true
% @original_name taper
% @values v0_5=0.5 unk_taper=Unknown
% @importance 1.0

0.92::true_val(taper, v0_5); 0.08::true_val(taper, unk_taper).
0.95::acc(s1, taper).
measured(s1, taper, v0_5).
all_consistent(taper) :- consistent(s1, taper).
evidence(all_consistent(taper)).
query(true_val(taper, v0_5)).
query(true_val(taper, unk_taper)).

% @attr setback
% @type numeric
% @unit cm
% @canonical true
% @original_name setback
% @values v2_0=2.0 unk_setback=Unknown
% @importance 0.90

0.95::true_val(setback, v2_0); 0.05::true_val(setback, unk_setback).
0.95::acc(s1, setback).
0.70::acc(s26, setback).
measured(s1, setback, v2_0).
measured(s26, setback, v2_0).
all_consistent(setback) :- consistent(s1, setback), (indep(s26), consistent(s26, setback) ; \+indep(s26)).
evidence(all_consistent(setback)).
query(true_val(setback, v2_0)).
query(true_val(setback, unk_setback)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name Width options
% @values standard_and_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 0.80

0.88::true_val(width_options, standard_and_wide); 0.12::true_val(width_options, unk_width_options).
0.70::acc(s2, width_options).
measured(s2, width_options, standard_and_wide).
all_consistent(width_options) :- consistent(s2, width_options).
evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_inserts unk_mounting_pattern=Unknown
% @importance 0.80

0.88::true_val(mounting_pattern, inserts_2x4); 0.12::true_val(mounting_pattern, unk_mounting_pattern).
0.70::acc(s2, mounting_pattern).
measured(s2, mounting_pattern, inserts_2x4).
all_consistent(mounting_pattern) :- consistent(s2, mounting_pattern).
evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values nine_sizes=153_155_157_159_161_156W_158W_160W_162W unk_available_sizes=Unknown
% @importance 1.0

0.92::true_val(available_sizes, nine_sizes); 0.08::true_val(available_sizes, unk_available_sizes).
0.95::acc(s1, available_sizes).
measured(s1, available_sizes, nine_sizes).
all_consistent(available_sizes) :- consistent(s1, available_sizes).
evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, nine_sizes)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values panda_hover=Panda_Hover_Paulownia_Poplar_Bamboo_Power_Rods unk_core_material=Unknown
% @importance 1.0

0.92::true_val(core_material, panda_hover); 0.08::true_val(core_material, unk_core_material).
0.95::acc(s1, core_material).
measured(s1, core_material, panda_hover).
all_consistent(core_material) :- consistent(s1, core_material).
evidence(all_consistent(core_material)).
query(true_val(core_material, panda_hover)).
query(true_val(core_material, unk_core_material)).

% @attr core_description
% @type categorical
% @canonical false
% @original_name Core description
% @values ultra_light_responsive=Ultra_lightweight_ultra_responsive unk_core_description=Unknown
% @importance 1.0

0.92::true_val(core_description, ultra_light_responsive); 0.08::true_val(core_description, unk_core_description).
0.93::acc(s1, core_description).
measured(s1, core_description, ultra_light_responsive).
all_consistent(core_description) :- consistent(s1, core_description).
evidence(all_consistent(core_description)).
query(true_val(core_description, ultra_light_responsive)).
query(true_val(core_description, unk_core_description)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values holysheet_tri_bi=Holysheet_Tri_Bi_triax_above_biax_below unk_laminate=Unknown
% @importance 0.78

0.95::true_val(laminate, holysheet_tri_bi); 0.05::true_val(laminate, unk_laminate).
0.95::acc(s1, laminate).
0.70::acc(s28, laminate).
measured(s1, laminate, holysheet_tri_bi).
measured(s28, laminate, holysheet_tri_bi).
all_consistent(laminate) :- consistent(s1, laminate), (indep(s28), consistent(s28, laminate) ; \+indep(s28)).
evidence(all_consistent(laminate)).
query(true_val(laminate, holysheet_tri_bi)).
query(true_val(laminate, unk_laminate)).

% @attr fiberglass_description
% @type categorical
% @canonical false
% @original_name Fiberglass description
% @values high_tensile_low_modulus=High_tensile_strength_low_modulus_high_roving unk_fiberglass_description=Unknown
% @importance 1.0

0.92::true_val(fiberglass_description, high_tensile_low_modulus); 0.08::true_val(fiberglass_description, unk_fiberglass_description).
0.93::acc(s1, fiberglass_description).
measured(s1, fiberglass_description, high_tensile_low_modulus).
all_consistent(fiberglass_description) :- consistent(s1, fiberglass_description).
evidence(all_consistent(fiberglass_description)).
query(true_val(fiberglass_description, high_tensile_low_modulus)).
query(true_val(fiberglass_description, unk_fiberglass_description)).

% @attr resin
% @type categorical
% @canonical true
% @original_name resin
% @values magic_bean=Magic_Bean_plant_based_high_bio_zero_waste unk_resin=Unknown
% @importance 0.90

0.95::true_val(resin, magic_bean); 0.05::true_val(resin, unk_resin).
0.95::acc(s1, resin).
0.70::acc(s2, resin).
measured(s1, resin, magic_bean).
measured(s2, resin, magic_bean).
all_consistent(resin) :- consistent(s1, resin), (indep(s2), consistent(s2, resin) ; \+indep(s2)).
evidence(all_consistent(resin)).
query(true_val(resin, magic_bean)).
query(true_val(resin, unk_resin)).

% @attr resin_properties
% @type categorical
% @canonical false
% @original_name Resin properties
% @values stronger_rigid_lighter=Stronger_rigid_decreased_core_thickness_lighter_higher_energy unk_resin_properties=Unknown
% @importance 0.55

0.78::true_val(resin_properties, stronger_rigid_lighter); 0.22::true_val(resin_properties, unk_resin_properties).
0.78::acc(s19, resin_properties).
measured(s19, resin_properties, stronger_rigid_lighter).
all_consistent(resin_properties) :- consistent(s19, resin_properties).
evidence(all_consistent(resin_properties)).
query(true_val(resin_properties, stronger_rigid_lighter)).
query(true_val(resin_properties, unk_resin_properties)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values carbonflax_3x25mm=3x25mm_CarbonFlax_Amplifier_flax_carbon_weave unk_construction_material_innovation=Unknown
% @importance 0.72

0.95::true_val(construction_material_innovation, carbonflax_3x25mm); 0.05::true_val(construction_material_innovation, unk_construction_material_innovation).
0.95::acc(s1, construction_material_innovation).
0.70::acc(s26, construction_material_innovation).
0.68::acc(s10, construction_material_innovation).
0.65::acc(s29, construction_material_innovation).
measured(s1, construction_material_innovation, carbonflax_3x25mm).
measured(s26, construction_material_innovation, carbonflax_3x25mm).
measured(s10, construction_material_innovation, carbonflax_3x25mm).
measured(s29, construction_material_innovation, carbonflax_3x25mm).
all_consistent(construction_material_innovation) :- consistent(s1, construction_material_innovation), (indep(s26), consistent(s26, construction_material_innovation) ; \+indep(s26)), (indep(s10), consistent(s10, construction_material_innovation) ; \+indep(s10)), (indep(s29), consistent(s29, construction_material_innovation) ; \+indep(s29)).
evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, carbonflax_3x25mm)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values hyperdrive_adv_xt=HyperDrive_ADV_XT_premium_sintered_extra_thick unk_base_material=Unknown
% @importance 1.0

0.92::true_val(base_material, hyperdrive_adv_xt); 0.08::true_val(base_material, unk_base_material).
0.95::acc(s1, base_material).
measured(s1, base_material, hyperdrive_adv_xt).
all_consistent(base_material) :- consistent(s1, base_material).
evidence(all_consistent(base_material)).
query(true_val(base_material, hyperdrive_adv_xt)).
query(true_val(base_material, unk_base_material)).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values sintered_high_mol=Sintered_custom_high_molecular_mass unk_base_type=Unknown
% @importance 1.0

0.92::true_val(base_type, sintered_high_mol); 0.08::true_val(base_type, unk_base_type).
0.95::acc(s1, base_type).
measured(s1, base_type, sintered_high_mol).
all_consistent(base_type) :- consistent(s1, base_type).
evidence(all_consistent(base_type)).
query(true_val(base_type, sintered_high_mol)).
query(true_val(base_type, unk_base_type)).

% @attr base_upgrade
% @type categorical
% @canonical false
% @original_name Base upgrade
% @values xt_from_2025=Upgraded_to_XT_extra_thick_from_2025 unk_base_upgrade=Unknown
% @importance 0.80

0.92::true_val(base_upgrade, xt_from_2025); 0.08::true_val(base_upgrade, unk_base_upgrade).
0.94::acc(s1, base_upgrade).
0.82::acc(s8, base_upgrade).
measured(s1, base_upgrade, xt_from_2025).
measured(s8, base_upgrade, xt_from_2025).
all_consistent(base_upgrade) :- consistent(s1, base_upgrade), consistent(s8, base_upgrade).
evidence(all_consistent(base_upgrade)).
query(true_val(base_upgrade, xt_from_2025)).
query(true_val(base_upgrade, unk_base_upgrade)).

% @attr base_graphics
% @type categorical
% @canonical false
% @original_name Base graphics
% @values sublimation_print=Sublimation_print unk_base_graphics=Unknown
% @importance 0.80

0.88::true_val(base_graphics, sublimation_print); 0.12::true_val(base_graphics, unk_base_graphics).
0.70::acc(s2, base_graphics).
measured(s2, base_graphics, sublimation_print).
all_consistent(base_graphics) :- consistent(s2, base_graphics).
evidence(all_consistent(base_graphics)).
query(true_val(base_graphics, sublimation_print)).
query(true_val(base_graphics, unk_base_graphics)).

% @attr available_colors
% @type categorical
% @canonical true
% @original_name available_colors
% @values white_standard_black_wide=White_base_standard_Black_base_wide unk_available_colors=Unknown
% @importance 0.55

0.95::true_val(available_colors, white_standard_black_wide); 0.05::true_val(available_colors, unk_available_colors).
0.72::acc(s21, available_colors).
0.93::acc(s1, available_colors).
0.70::acc(s2, available_colors).
measured(s21, available_colors, white_standard_black_wide).
measured(s1, available_colors, white_standard_black_wide).
measured(s2, available_colors, white_standard_black_wide).
all_consistent(available_colors) :- consistent(s1, available_colors), (indep(s21), consistent(s21, available_colors) ; \+indep(s21)), (indep(s2), consistent(s2, available_colors) ; \+indep(s2)).
evidence(all_consistent(available_colors)).
query(true_val(available_colors, white_standard_black_wide)).
query(true_val(available_colors, unk_available_colors)).

% @attr topsheet
% @type categorical
% @canonical true
% @original_name topsheet
% @values plt_metallic_pam16000=PLT_metallic_screen_PAM16000_solventless_UV_ink unk_topsheet=Unknown
% @importance 0.63

0.95::true_val(topsheet, plt_metallic_pam16000); 0.05::true_val(topsheet, unk_topsheet).
0.93::acc(s1, topsheet).
0.70::acc(s2, topsheet).
0.68::acc(s23, topsheet).
measured(s1, topsheet, plt_metallic_pam16000).
measured(s2, topsheet, plt_metallic_pam16000).
measured(s23, topsheet, plt_metallic_pam16000).
all_consistent(topsheet) :- consistent(s1, topsheet), (indep(s2), consistent(s2, topsheet) ; \+indep(s2)), (indep(s23), consistent(s23, topsheet) ; \+indep(s23)).
evidence(all_consistent(topsheet)).
query(true_val(topsheet, plt_metallic_pam16000)).
query(true_val(topsheet, unk_topsheet)).

% @attr construction
% @type categorical
% @canonical true
% @original_name construction
% @values sandwich=Sandwich unk_construction=Unknown
% @importance 0.55

0.77::true_val(construction, sandwich); 0.23::true_val(construction, unk_construction).
0.70::acc(s28, construction).
measured(s28, construction, sandwich).
all_consistent(construction) :- consistent(s28, construction).
evidence(all_consistent(construction)).
query(true_val(construction, sandwich)).
query(true_val(construction, unk_construction)).

% @attr factory_tuning
% @type categorical
% @canonical false
% @original_name Factory tuning
% @values waxed_ready=Waxed_and_ready_from_factory unk_factory_tuning=Unknown
% @importance 0.75

0.92::true_val(factory_tuning, waxed_ready); 0.08::true_val(factory_tuning, unk_factory_tuning).
0.93::acc(s30, factory_tuning).
measured(s30, factory_tuning, waxed_ready).
all_consistent(factory_tuning) :- consistent(s30, factory_tuning).
evidence(all_consistent(factory_tuning)).
query(true_val(factory_tuning, waxed_ready)).
query(true_val(factory_tuning, unk_factory_tuning)).

% @attr effective_edge_153
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 153
% @values v1200=1200.0 unk_effective_edge_153=Unknown
% @importance 1.0

0.92::true_val(effective_edge_153, v1200); 0.08::true_val(effective_edge_153, unk_effective_edge_153).
0.95::acc(s1, effective_edge_153).
measured(s1, effective_edge_153, v1200).
all_consistent(effective_edge_153) :- consistent(s1, effective_edge_153).
evidence(all_consistent(effective_edge_153)).
query(true_val(effective_edge_153, v1200)).
query(true_val(effective_edge_153, unk_effective_edge_153)).

% @attr effective_edge_155
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 155
% @values v1215=1215.0 unk_effective_edge_155=Unknown
% @importance 1.0

0.92::true_val(effective_edge_155, v1215); 0.08::true_val(effective_edge_155, unk_effective_edge_155).
0.95::acc(s1, effective_edge_155).
measured(s1, effective_edge_155, v1215).
all_consistent(effective_edge_155) :- consistent(s1, effective_edge_155).
evidence(all_consistent(effective_edge_155)).
query(true_val(effective_edge_155, v1215)).
query(true_val(effective_edge_155, unk_effective_edge_155)).

% @attr effective_edge_157
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 157
% @values v1230=1230.0 unk_effective_edge_157=Unknown
% @importance 1.0

0.92::true_val(effective_edge_157, v1230); 0.08::true_val(effective_edge_157, unk_effective_edge_157).
0.95::acc(s1, effective_edge_157).
measured(s1, effective_edge_157, v1230).
all_consistent(effective_edge_157) :- consistent(s1, effective_edge_157).
evidence(all_consistent(effective_edge_157)).
query(true_val(effective_edge_157, v1230)).
query(true_val(effective_edge_157, unk_effective_edge_157)).

% @attr effective_edge_159
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 159
% @values v1245=1245.0 unk_effective_edge_159=Unknown
% @importance 1.0

0.92::true_val(effective_edge_159, v1245); 0.08::true_val(effective_edge_159, unk_effective_edge_159).
0.95::acc(s1, effective_edge_159).
measured(s1, effective_edge_159, v1245).
all_consistent(effective_edge_159) :- consistent(s1, effective_edge_159).
evidence(all_consistent(effective_edge_159)).
query(true_val(effective_edge_159, v1245)).
query(true_val(effective_edge_159, unk_effective_edge_159)).

% @attr effective_edge_161
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 161
% @values v1260=1260.0 unk_effective_edge_161=Unknown
% @importance 1.0

0.92::true_val(effective_edge_161, v1260); 0.08::true_val(effective_edge_161, unk_effective_edge_161).
0.95::acc(s1, effective_edge_161).
measured(s1, effective_edge_161, v1260).
all_consistent(effective_edge_161) :- consistent(s1, effective_edge_161).
evidence(all_consistent(effective_edge_161)).
query(true_val(effective_edge_161, v1260)).
query(true_val(effective_edge_161, unk_effective_edge_161)).

% @attr effective_edge_156w
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 156W
% @values v1222_5=1222.5 unk_effective_edge_156w=Unknown
% @importance 1.0

0.92::true_val(effective_edge_156w, v1222_5); 0.08::true_val(effective_edge_156w, unk_effective_edge_156w).
0.95::acc(s1, effective_edge_156w).
measured(s1, effective_edge_156w, v1222_5).
all_consistent(effective_edge_156w) :- consistent(s1, effective_edge_156w).
evidence(all_consistent(effective_edge_156w)).
query(true_val(effective_edge_156w, v1222_5)).
query(true_val(effective_edge_156w, unk_effective_edge_156w)).

% @attr effective_edge_158w
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 158W
% @values v1237_5=1237.5 unk_effective_edge_158w=Unknown
% @importance 1.0

0.92::true_val(effective_edge_158w, v1237_5); 0.08::true_val(effective_edge_158w, unk_effective_edge_158w).
0.95::acc(s1, effective_edge_158w).
measured(s1, effective_edge_158w, v1237_5).
all_consistent(effective_edge_158w) :- consistent(s1, effective_edge_158w).
evidence(all_consistent(effective_edge_158w)).
query(true_val(effective_edge_158w, v1237_5)).
query(true_val(effective_edge_158w, unk_effective_edge_158w)).

% @attr effective_edge_160w
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 160W
% @values v1252_5=1252.5 unk_effective_edge_160w=Unknown
% @importance 1.0

0.92::true_val(effective_edge_160w, v1252_5); 0.08::true_val(effective_edge_160w, unk_effective_edge_160w).
0.95::acc(s1, effective_edge_160w).
measured(s1, effective_edge_160w, v1252_5).
all_consistent(effective_edge_160w) :- consistent(s1, effective_edge_160w).
evidence(all_consistent(effective_edge_160w)).
query(true_val(effective_edge_160w, v1252_5)).
query(true_val(effective_edge_160w, unk_effective_edge_160w)).

% @attr effective_edge_162w
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 162W
% @values v1267_5=1267.5 unk_effective_edge_162w=Unknown
% @importance 1.0

0.92::true_val(effective_edge_162w, v1267_5); 0.08::true_val(effective_edge_162w, unk_effective_edge_162w).
0.95::acc(s1, effective_edge_162w).
measured(s1, effective_edge_162w, v1267_5).
all_consistent(effective_edge_162w) :- consistent(s1, effective_edge_162w).
evidence(all_consistent(effective_edge_162w)).
query(true_val(effective_edge_162w, v1267_5)).
query(true_val(effective_edge_162w, unk_effective_edge_162w)).

% @attr waist_width_153
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 153
% @values v24_7=24.7 unk_waist_width_153=Unknown
% @importance 1.0

0.92::true_val(waist_width_153, v24_7); 0.08::true_val(waist_width_153, unk_waist_width_153).
0.95::acc(s1, waist_width_153).
measured(s1, waist_width_153, v24_7).
all_consistent(waist_width_153) :- consistent(s1, waist_width_153).
evidence(all_consistent(waist_width_153)).
query(true_val(waist_width_153, v24_7)).
query(true_val(waist_width_153, unk_waist_width_153)).

% @attr waist_width_155
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 155
% @values v25_0=25.0 unk_waist_width_155=Unknown
% @importance 1.0

0.92::true_val(waist_width_155, v25_0); 0.08::true_val(waist_width_155, unk_waist_width_155).
0.95::acc(s1, waist_width_155).
measured(s1, waist_width_155, v25_0).
all_consistent(waist_width_155) :- consistent(s1, waist_width_155).
evidence(all_consistent(waist_width_155)).
query(true_val(waist_width_155, v25_0)).
query(true_val(waist_width_155, unk_waist_width_155)).

% @attr waist_width_157
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 157
% @values v25_3=25.3 unk_waist_width_157=Unknown
% @importance 1.0

0.92::true_val(waist_width_157, v25_3); 0.08::true_val(waist_width_157, unk_waist_width_157).
0.95::acc(s1, waist_width_157).
measured(s1, waist_width_157, v25_3).
all_consistent(waist_width_157) :- consistent(s1, waist_width_157).
evidence(all_consistent(waist_width_157)).
query(true_val(waist_width_157, v25_3)).
query(true_val(waist_width_157, unk_waist_width_157)).

% @attr waist_width_159
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 159
% @values v25_6=25.6 unk_waist_width_159=Unknown
% @importance 1.0

0.92::true_val(waist_width_159, v25_6); 0.08::true_val(waist_width_159, unk_waist_width_159).
0.95::acc(s1, waist_width_159).
measured(s1, waist_width_159, v25_6).
all_consistent(waist_width_159) :- consistent(s1, waist_width_159).
evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v25_6)).
query(true_val(waist_width_159, unk_waist_width_159)).

% @attr waist_width_161
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 161
% @values v25_9=25.9 unk_waist_width_161=Unknown
% @importance 1.0

0.92::true_val(waist_width_161, v25_9); 0.08::true_val(waist_width_161, unk_waist_width_161).
0.95::acc(s1, waist_width_161).
measured(s1, waist_width_161, v25_9).
all_consistent(waist_width_161) :- consistent(s1, waist_width_161).
evidence(all_consistent(waist_width_161)).
query(true_val(waist_width_161, v25_9)).
query(true_val(waist_width_161, unk_waist_width_161)).

% @attr waist_width_156w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 156W
% @values v26_0=26.0 unk_waist_width_156w=Unknown
% @importance 1.0

0.92::true_val(waist_width_156w, v26_0); 0.08::true_val(waist_width_156w, unk_waist_width_156w).
0.95::acc(s1, waist_width_156w).
measured(s1, waist_width_156w, v26_0).
all_consistent(waist_width_156w) :- consistent(s1, waist_width_156w).
evidence(all_consistent(waist_width_156w)).
query(true_val(waist_width_156w, v26_0)).
query(true_val(waist_width_156w, unk_waist_width_156w)).

% @attr waist_width_158w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 158W
% @values v26_3=26.3 unk_waist_width_158w=Unknown
% @importance 1.0

0.92::true_val(waist_width_158w, v26_3); 0.08::true_val(waist_width_158w, unk_waist_width_158w).
0.95::acc(s1, waist_width_158w).
measured(s1, waist_width_158w, v26_3).
all_consistent(waist_width_158w) :- consistent(s1, waist_width_158w).
evidence(all_consistent(waist_width_158w)).
query(true_val(waist_width_158w, v26_3)).
query(true_val(waist_width_158w, unk_waist_width_158w)).

% @attr waist_width_160w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 160W
% @values v26_6=26.6 unk_waist_width_160w=Unknown
% @importance 1.0

0.92::true_val(waist_width_160w, v26_6); 0.08::true_val(waist_width_160w, unk_waist_width_160w).
0.95::acc(s1, waist_width_160w).
measured(s1, waist_width_160w, v26_6).
all_consistent(waist_width_160w) :- consistent(s1, waist_width_160w).
evidence(all_consistent(waist_width_160w)).
query(true_val(waist_width_160w, v26_6)).
query(true_val(waist_width_160w, unk_waist_width_160w)).

% @attr waist_width_162w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 162W
% @values v26_9=26.9 unk_waist_width_162w=Unknown
% @importance 1.0

0.92::true_val(waist_width_162w, v26_9); 0.08::true_val(waist_width_162w, unk_waist_width_162w).
0.95::acc(s1, waist_width_162w).
measured(s1, waist_width_162w, v26_9).
all_consistent(waist_width_162w) :- consistent(s1, waist_width_162w).
evidence(all_consistent(waist_width_162w)).
query(true_val(waist_width_162w, v26_9)).
query(true_val(waist_width_162w, unk_waist_width_162w)).

% @attr tip_tail_width_size
% @type categorical
% @unit cm
% @canonical false
% @original_name tip_tail_width_size
% @values v30_0_29_5=30.0_29.5 unk_tip_tail_width_size=Unknown
% @importance 1.0

0.92::true_val(tip_tail_width_size, v30_0_29_5); 0.08::true_val(tip_tail_width_size, unk_tip_tail_width_size).
0.95::acc(s1, tip_tail_width_size).
measured(s1, tip_tail_width_size, v30_0_29_5).
all_consistent(tip_tail_width_size) :- consistent(s1, tip_tail_width_size).
evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v30_0_29_5)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr sidecut_radius_size
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v8_5_7_5=8.5_7.5 unk_sidecut_radius_size=Unknown
% @importance 1.0

0.92::true_val(sidecut_radius_size, v8_5_7_5); 0.08::true_val(sidecut_radius_size, unk_sidecut_radius_size).
0.95::acc(s1, sidecut_radius_size).
measured(s1, sidecut_radius_size, v8_5_7_5).
all_consistent(sidecut_radius_size) :- consistent(s1, sidecut_radius_size).
evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v8_5_7_5)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr stance_width_range_size
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size
% @values v55_9=55.9 unk_stance_width_range_size=Unknown
% @importance 1.0

0.92::true_val(stance_width_range_size, v55_9); 0.08::true_val(stance_width_range_size, unk_stance_width_range_size).
0.95::acc(s1, stance_width_range_size).
measured(s1, stance_width_range_size, v55_9).
all_consistent(stance_width_range_size) :- consistent(s1, stance_width_range_size).
evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v55_9)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr suggested_boot_sizes
% @type categorical
% @canonical false
% @original_name Suggested boot sizes
% @values mens_6_to_10plus=Mens_6_9_5_for_153_8_10_for_155_161_8_10plus_for_wide unk_suggested_boot_sizes=Unknown
% @importance 1.0

0.92::true_val(suggested_boot_sizes, mens_6_to_10plus); 0.08::true_val(suggested_boot_sizes, unk_suggested_boot_sizes).
0.95::acc(s1, suggested_boot_sizes).
measured(s1, suggested_boot_sizes, mens_6_to_10plus).
all_consistent(suggested_boot_sizes) :- consistent(s1, suggested_boot_sizes).
evidence(all_consistent(suggested_boot_sizes)).
query(true_val(suggested_boot_sizes, mens_6_to_10plus)).
query(true_val(suggested_boot_sizes, unk_suggested_boot_sizes)).

% @attr recommended_weight_range_size_153
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (153)
% @values w52_79=52_79kg unk_recommended_weight_range_size_153=Unknown
% @importance 1.0

0.92::true_val(recommended_weight_range_size_153, w52_79); 0.08::true_val(recommended_weight_range_size_153, unk_recommended_weight_range_size_153).
0.95::acc(s1, recommended_weight_range_size_153).
measured(s1, recommended_weight_range_size_153, w52_79).
all_consistent(recommended_weight_range_size_153) :- consistent(s1, recommended_weight_range_size_153).
evidence(all_consistent(recommended_weight_range_size_153)).
query(true_val(recommended_weight_range_size_153, w52_79)).
query(true_val(recommended_weight_range_size_153, unk_recommended_weight_range_size_153)).

% @attr recommended_weight_range_size_155
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (155)
% @values w56_83=56_83kg unk_recommended_weight_range_size_155=Unknown
% @importance 1.0

0.92::true_val(recommended_weight_range_size_155, w56_83); 0.08::true_val(recommended_weight_range_size_155, unk_recommended_weight_range_size_155).
0.95::acc(s1, recommended_weight_range_size_155).
measured(s1, recommended_weight_range_size_155, w56_83).
all_consistent(recommended_weight_range_size_155) :- consistent(s1, recommended_weight_range_size_155).
evidence(all_consistent(recommended_weight_range_size_155)).
query(true_val(recommended_weight_range_size_155, w56_83)).
query(true_val(recommended_weight_range_size_155, unk_recommended_weight_range_size_155)).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size (157)
% @values w61_88=61_88kg unk_recommended_weight_range_size=Unknown
% @importance 1.0

0.92::true_val(recommended_weight_range_size, w61_88); 0.08::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).
0.95::acc(s1, recommended_weight_range_size).
measured(s1, recommended_weight_range_size, w61_88).
all_consistent(recommended_weight_range_size) :- consistent(s1, recommended_weight_range_size).
evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w61_88)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr recommended_weight_range_size_159
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (159)
% @values w65_92=65_92kg unk_recommended_weight_range_size_159=Unknown
% @importance 1.0

0.92::true_val(recommended_weight_range_size_159, w65_92); 0.08::true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159).
0.95::acc(s1, recommended_weight_range_size_159).
measured(s1, recommended_weight_range_size_159, w65_92).
all_consistent(recommended_weight_range_size_159) :- consistent(s1, recommended_weight_range_size_159).
evidence(all_consistent(recommended_weight_range_size_159)).
query(true_val(recommended_weight_range_size_159, w65_92)).
query(true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159)).

% @attr recommended_weight_range_size_161
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (161)
% @values w72_99=72_99kg unk_recommended_weight_range_size_161=Unknown
% @importance 1.0

0.92::true_val(recommended_weight_range_size_161, w72_99); 0.08::true_val(recommended_weight_range_size_161, unk_recommended_weight_range_size_161).
0.95::acc(s1, recommended_weight_range_size_161).
measured(s1, recommended_weight_range_size_161, w72_99).
all_consistent(recommended_weight_range_size_161) :- consistent(s1, recommended_weight_range_size_161).
evidence(all_consistent(recommended_weight_range_size_161)).
query(true_val(recommended_weight_range_size_161, w72_99)).
query(true_val(recommended_weight_range_size_161, unk_recommended_weight_range_size_161)).

% @attr recommended_weight_range_size_wide
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (wide)
% @values w77_104=77_104kg unk_recommended_weight_range_size_wide=Unknown
% @importance 1.0

0.92::true_val(recommended_weight_range_size_wide, w77_104); 0.08::true_val(recommended_weight_range_size_wide, unk_recommended_weight_range_size_wide).
0.95::acc(s1, recommended_weight_range_size_wide).
measured(s1, recommended_weight_range_size_wide, w77_104).
all_consistent(recommended_weight_range_size_wide) :- consistent(s1, recommended_weight_range_size_wide).
evidence(all_consistent(recommended_weight_range_size_wide)).
query(true_val(recommended_weight_range_size_wide, w77_104)).
query(true_val(recommended_weight_range_size_wide, unk_recommended_weight_range_size_wide)).

% @attr warranty_period_years
% @type numeric
% @unit years
% @canonical true
% @original_name warranty_period_years
% @values v2=2.0 unk_warranty_period_years=Unknown
% @importance 0.73

0.95::true_val(warranty_period_years, v2); 0.05::true_val(warranty_period_years, unk_warranty_period_years).
0.95::acc(s30, warranty_period_years).
0.78::acc(s31, warranty_period_years).
measured(s30, warranty_period_years, v2).
measured(s31, warranty_period_years, v2).
all_consistent(warranty_period_years) :- consistent(s30, warranty_period_years), (indep(s31), consistent(s31, warranty_period_years) ; \+indep(s31)).
evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v2)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty (coverage scope)
% @values structural_defects_only=Structural_defects_material_workmanship_no_impact_abuse unk_warranty=Unknown
% @importance 0.73

0.95::true_val(warranty, structural_defects_only); 0.05::true_val(warranty, unk_warranty).
0.95::acc(s30, warranty).
0.78::acc(s31, warranty).
measured(s30, warranty, structural_defects_only).
measured(s31, warranty, structural_defects_only).
all_consistent(warranty) :- consistent(s30, warranty), (indep(s31), consistent(s31, warranty) ; \+indep(s31)).
evidence(all_consistent(warranty)).
query(true_val(warranty, structural_defects_only)).
query(true_val(warranty, unk_warranty)).

% @attr warranty_authorized_dealer
% @type categorical
% @canonical false
% @original_name warranty (authorized dealer requirement)
% @values authorized_original_only=Must_be_authorized_dealer_original_purchaser unk_warranty_authorized_dealer=Unknown
% @importance 0.75

0.92::true_val(warranty_authorized_dealer, authorized_original_only); 0.08::true_val(warranty_authorized_dealer, unk_warranty_authorized_dealer).
0.95::acc(s30, warranty_authorized_dealer).
measured(s30, warranty_authorized_dealer, authorized_original_only).
all_consistent(warranty_authorized_dealer) :- consistent(s30, warranty_authorized_dealer).
evidence(all_consistent(warranty_authorized_dealer)).
query(true_val(warranty_authorized_dealer, authorized_original_only)).
query(true_val(warranty_authorized_dealer, unk_warranty_authorized_dealer)).

% @attr warranty_nfc_registration
% @type categorical
% @canonical false
% @original_name warranty (NFC registration)
% @values nfc_scan_required=NFC_chip_scan_serial_registration_claim unk_warranty_nfc_registration=Unknown
% @importance 0.75

0.92::true_val(warranty_nfc_registration, nfc_scan_required); 0.08::true_val(warranty_nfc_registration, unk_warranty_nfc_registration).
0.95::acc(s30, warranty_nfc_registration).
measured(s30, warranty_nfc_registration, nfc_scan_required).
all_consistent(warranty_nfc_registration) :- consistent(s30, warranty_nfc_registration).
evidence(all_consistent(warranty_nfc_registration)).
query(true_val(warranty_nfc_registration, nfc_scan_required)).
query(true_val(warranty_nfc_registration, unk_warranty_nfc_registration)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values all_mountain=All_Mountain unk_riding_style=Unknown
% @importance 0.95

0.88::true_val(riding_style, all_mountain); 0.12::true_val(riding_style, unk_riding_style).
0.88::acc(s11, riding_style).
measured(s11, riding_style, all_mountain).
all_consistent(riding_style) :- consistent(s11, riding_style).
evidence(all_consistent(riding_style)).
query(true_val(riding_style, all_mountain)).
query(true_val(riding_style, unk_riding_style)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values advanced_expert=Advanced_Expert unk_rider_level=Unknown
% @importance 0.95

0.88::true_val(rider_level, advanced_expert); 0.12::true_val(rider_level, unk_rider_level).
0.88::acc(s11, rider_level).
measured(s11, rider_level, advanced_expert).
all_consistent(rider_level) :- consistent(s11, rider_level).
evidence(all_consistent(rider_level)).
query(true_val(rider_level, advanced_expert)).
query(true_val(rider_level, unk_rider_level)).

% @attr carving_rating_tgr
% @type categorical
% @canonical true
% @original_name carving_rating_tgr
% @values great=Great unk_carving_rating_tgr=Unknown
% @importance 0.95

0.88::true_val(carving_rating_tgr, great); 0.12::true_val(carving_rating_tgr, unk_carving_rating_tgr).
0.88::acc(s11, carving_rating_tgr).
measured(s11, carving_rating_tgr, great).
all_consistent(carving_rating_tgr) :- consistent(s11, carving_rating_tgr).
evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, great)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values great=Great unk_base_glide_performance=Unknown
% @importance 0.95

0.88::true_val(base_glide_performance, great); 0.12::true_val(base_glide_performance, unk_base_glide_performance).
0.88::acc(s11, base_glide_performance).
measured(s11, base_glide_performance, great).
all_consistent(base_glide_performance) :- consistent(s11, base_glide_performance).
evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, great)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr jumps_rating_tgr
% @type categorical
% @canonical true
% @original_name jumps_rating_tgr
% @values great=Great unk_jumps_rating_tgr=Unknown
% @importance 0.95

0.88::true_val(jumps_rating_tgr, great); 0.12::true_val(jumps_rating_tgr, unk_jumps_rating_tgr).
0.88::acc(s11, jumps_rating_tgr).
measured(s11, jumps_rating_tgr, great).
all_consistent(jumps_rating_tgr) :- consistent(s11, jumps_rating_tgr).
evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, great)).
query(true_val(jumps_rating_tgr, unk_jumps_rating_tgr)).

% @attr speed_rating_tgr
% @type categorical
% @canonical true
% @original_name speed_rating_tgr
% @values good=Good unk_speed_rating_tgr=Unknown
% @importance 0.95

0.88::true_val(speed_rating_tgr, good); 0.12::true_val(speed_rating_tgr, unk_speed_rating_tgr).
0.88::acc(s11, speed_rating_tgr).
measured(s11, speed_rating_tgr, good).
all_consistent(speed_rating_tgr) :- consistent(s11, speed_rating_tgr).
evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, good)).
query(true_val(speed_rating_tgr, unk_speed_rating_tgr)).

% @attr powder_rating_tgr
% @type categorical
% @canonical true
% @original_name powder_rating_tgr
% @values average=Average unk_powder_rating_tgr=Unknown
% @importance 0.95

0.88::true_val(powder_rating_tgr, average); 0.12::true_val(powder_rating_tgr, unk_powder_rating_tgr).
0.88::acc(s11, powder_rating_tgr).
measured(s11, powder_rating_tgr, average).
all_consistent(powder_rating_tgr) :- consistent(s11, powder_rating_tgr).
evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, average)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

% @attr uneven_snow_rating
% @type categorical
% @canonical false
% @original_name Uneven snow rating
% @values average=Average unk_uneven_snow_rating=Unknown
% @importance 0.95

0.88::true_val(uneven_snow_rating, average); 0.12::true_val(uneven_snow_rating, unk_uneven_snow_rating).
0.88::acc(s11, uneven_snow_rating).
measured(s11, uneven_snow_rating, average).
all_consistent(uneven_snow_rating) :- consistent(s11, uneven_snow_rating).
evidence(all_consistent(uneven_snow_rating)).
query(true_val(uneven_snow_rating, average)).
query(true_val(uneven_snow_rating, unk_uneven_snow_rating)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values good=Good serviceable=Serviceable_occasional
% @importance 0.90

0.55::true_val(switch_riding, good); 0.40::true_val(switch_riding, serviceable); 0.05::true_val(switch_riding, unk_switch_riding).
0.88::acc(s11, switch_riding).
0.80::acc(s6, switch_riding).
measured(s11, switch_riding, good).
measured(s6, switch_riding, serviceable).
all_consistent(switch_riding) :- consistent(s11, switch_riding), (indep(s6), consistent(s6, switch_riding) ; \+indep(s6)).
evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, good)).
query(true_val(switch_riding, serviceable)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr jibbing_rating_tgr
% @type categorical
% @canonical true
% @original_name jibbing_rating_tgr
% @values average=Average unk_jibbing_rating_tgr=Unknown
% @importance 0.95

0.88::true_val(jibbing_rating_tgr, average); 0.12::true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr).
0.88::acc(s11, jibbing_rating_tgr).
measured(s11, jibbing_rating_tgr, average).
all_consistent(jibbing_rating_tgr) :- consistent(s11, jibbing_rating_tgr).
evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, average)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr)).

% @attr pipe_rating_tgr
% @type categorical
% @canonical true
% @original_name pipe_rating_tgr
% @values good=Good unk_pipe_rating_tgr=Unknown
% @importance 0.95

0.88::true_val(pipe_rating_tgr, good); 0.12::true_val(pipe_rating_tgr, unk_pipe_rating_tgr).
0.88::acc(s11, pipe_rating_tgr).
measured(s11, pipe_rating_tgr, good).
all_consistent(pipe_rating_tgr) :- consistent(s11, pipe_rating_tgr).
evidence(all_consistent(pipe_rating_tgr)).
query(true_val(pipe_rating_tgr, good)).
query(true_val(pipe_rating_tgr, unk_pipe_rating_tgr)).

% @attr on_snow_feel_tgr
% @type categorical
% @canonical true
% @original_name on_snow_feel_tgr
% @values semi_locked_in=Semi_Locked_In unk_on_snow_feel_tgr=Unknown
% @importance 0.95

0.88::true_val(on_snow_feel_tgr, semi_locked_in); 0.12::true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr).
0.88::acc(s11, on_snow_feel_tgr).
measured(s11, on_snow_feel_tgr, semi_locked_in).
all_consistent(on_snow_feel_tgr) :- consistent(s11, on_snow_feel_tgr).
evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, semi_locked_in)).
query(true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values fast=Fast unk_turn_initiation_performance=Unknown
% @importance 0.95

0.88::true_val(turn_initiation_performance, fast); 0.12::true_val(turn_initiation_performance, unk_turn_initiation_performance).
0.88::acc(s11, turn_initiation_performance).
measured(s11, turn_initiation_performance, fast).
all_consistent(turn_initiation_performance) :- consistent(s11, turn_initiation_performance).
evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, fast)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr skidded_turns
% @type categorical
% @canonical false
% @original_name Skidded turns
% @values semi_hard=Semi_Hard unk_skidded_turns=Unknown
% @importance 0.95

0.88::true_val(skidded_turns, semi_hard); 0.12::true_val(skidded_turns, unk_skidded_turns).
0.88::acc(s11, skidded_turns).
measured(s11, skidded_turns, semi_hard).
all_consistent(skidded_turns) :- consistent(s11, skidded_turns).
evidence(all_consistent(skidded_turns)).
query(true_val(skidded_turns, semi_hard)).
query(true_val(skidded_turns, unk_skidded_turns)).

% @attr buttering
% @type categorical
% @canonical true
% @original_name buttering
% @values moderate=Moderate unk_buttering=Unknown
% @importance 0.95

0.88::true_val(buttering, moderate); 0.12::true_val(buttering, unk_buttering).
0.88::acc(s11, buttering).
measured(s11, buttering, moderate).
all_consistent(buttering) :- consistent(s11, buttering).
evidence(all_consistent(buttering)).
query(true_val(buttering, moderate)).
query(true_val(buttering, unk_buttering)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values medium_snow=Medium_Snow unk_edge_hold=Unknown
% @importance 0.95

0.88::true_val(edge_hold, medium_snow); 0.12::true_val(edge_hold, unk_edge_hold).
0.88::acc(s11, edge_hold).
measured(s11, edge_hold, medium_snow).
all_consistent(edge_hold) :- consistent(s11, edge_hold).
evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, medium_snow)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr approximate_weight_feel
% @type categorical
% @canonical false
% @original_name Approximate weight feel
% @values feels_light=Feels_Light unk_approximate_weight_feel=Unknown
% @importance 0.95

0.88::true_val(approximate_weight_feel, feels_light); 0.12::true_val(approximate_weight_feel, unk_approximate_weight_feel).
0.88::acc(s11, approximate_weight_feel).
measured(s11, approximate_weight_feel, feels_light).
all_consistent(approximate_weight_feel) :- consistent(s11, approximate_weight_feel).
evidence(all_consistent(approximate_weight_feel)).
query(true_val(approximate_weight_feel, feels_light)).
query(true_val(approximate_weight_feel, unk_approximate_weight_feel)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect (pop/ollie)
% @values pops_super_well=Pops_Super_Well_On_Ollie unk_positive_aspect=Unknown
% @importance 0.95

0.88::true_val(positive_aspect, pops_super_well); 0.12::true_val(positive_aspect, unk_positive_aspect).
0.88::acc(s11, positive_aspect).
measured(s11, positive_aspect, pops_super_well).
all_consistent(positive_aspect) :- consistent(s11, positive_aspect).
evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, pops_super_well)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr positive_aspect_turn_spring
% @type categorical
% @canonical false
% @original_name positive_aspect (turn spring)
% @values lots_of_spring=Lots_of_Spring_Out_Of_Turn unk_positive_aspect_turn_spring=Unknown
% @importance 0.95

0.88::true_val(positive_aspect_turn_spring, lots_of_spring); 0.12::true_val(positive_aspect_turn_spring, unk_positive_aspect_turn_spring).
0.88::acc(s11, positive_aspect_turn_spring).
measured(s11, positive_aspect_turn_spring, lots_of_spring).
all_consistent(positive_aspect_turn_spring) :- consistent(s11, positive_aspect_turn_spring).
evidence(all_consistent(positive_aspect_turn_spring)).
query(true_val(positive_aspect_turn_spring, lots_of_spring)).
query(true_val(positive_aspect_turn_spring, unk_positive_aspect_turn_spring)).

% @attr positive_aspect_turning
% @type categorical
% @canonical false
% @original_name positive_aspect (turning)
% @values very_turny=Very_Turny_quick_turning unk_positive_aspect_turning=Unknown
% @importance 0.95

0.88::true_val(positive_aspect_turning, very_turny); 0.12::true_val(positive_aspect_turning, unk_positive_aspect_turning).
0.88::acc(s11, positive_aspect_turning).
measured(s11, positive_aspect_turning, very_turny).
all_consistent(positive_aspect_turning) :- consistent(s11, positive_aspect_turning).
evidence(all_consistent(positive_aspect_turning)).
query(true_val(positive_aspect_turning, very_turny)).
query(true_val(positive_aspect_turning, unk_positive_aspect_turning)).

% @attr positive_aspect_versatility
% @type categorical
% @canonical false
% @original_name positive_aspect (versatility)
% @values super_versatile=Super_versatile_great_balance unk_positive_aspect_versatility=Unknown
% @importance 0.80

0.82::true_val(positive_aspect_versatility, super_versatile); 0.18::true_val(positive_aspect_versatility, unk_positive_aspect_versatility).
0.80::acc(s32, positive_aspect_versatility).
measured(s32, positive_aspect_versatility, super_versatile).
all_consistent(positive_aspect_versatility) :- consistent(s32, positive_aspect_versatility).
evidence(all_consistent(positive_aspect_versatility)).
query(true_val(positive_aspect_versatility, super_versatile)).
query(true_val(positive_aspect_versatility, unk_positive_aspect_versatility)).

% @attr positive_aspect_carving
% @type categorical
% @canonical false
% @original_name positive_aspect (carving)
% @values locks_carve_precise=Locks_into_carve_confident_precise_groomers unk_positive_aspect_carving=Unknown
% @importance 0.70

0.72::true_val(positive_aspect_carving, locks_carve_precise); 0.28::true_val(positive_aspect_carving, unk_positive_aspect_carving).
0.65::acc(s33, positive_aspect_carving).
measured(s33, positive_aspect_carving, locks_carve_precise).
all_consistent(positive_aspect_carving) :- consistent(s33, positive_aspect_carving).
evidence(all_consistent(positive_aspect_carving)).
query(true_val(positive_aspect_carving, locks_carve_precise)).
query(true_val(positive_aspect_carving, unk_positive_aspect_carving)).

% @attr positive_aspect_base_speed
% @type categorical
% @canonical false
% @original_name positive_aspect (base speed)
% @values very_fast_base=Very_fast_base_constantly_accelerating unk_positive_aspect_base_speed=Unknown
% @importance 0.85

0.82::true_val(positive_aspect_base_speed, very_fast_base); 0.18::true_val(positive_aspect_base_speed, unk_positive_aspect_base_speed).
0.82::acc(s6, positive_aspect_base_speed).
measured(s6, positive_aspect_base_speed, very_fast_base).
all_consistent(positive_aspect_base_speed) :- consistent(s6, positive_aspect_base_speed).
evidence(all_consistent(positive_aspect_base_speed)).
query(true_val(positive_aspect_base_speed, very_fast_base)).
query(true_val(positive_aspect_base_speed, unk_positive_aspect_base_speed)).

% @attr positive_aspect_edge_hold
% @type categorical
% @canonical false
% @original_name positive_aspect (edge hold)
% @values predictable_strong=Predictable_strong_edge_hold_never_catchy unk_positive_aspect_edge_hold=Unknown
% @importance 0.85

0.82::true_val(positive_aspect_edge_hold, predictable_strong); 0.18::true_val(positive_aspect_edge_hold, unk_positive_aspect_edge_hold).
0.82::acc(s6, positive_aspect_edge_hold).
measured(s6, positive_aspect_edge_hold, predictable_strong).
all_consistent(positive_aspect_edge_hold) :- consistent(s6, positive_aspect_edge_hold).
evidence(all_consistent(positive_aspect_edge_hold)).
query(true_val(positive_aspect_edge_hold, predictable_strong)).
query(true_val(positive_aspect_edge_hold, unk_positive_aspect_edge_hold)).

% @attr positive_aspect_lightweight
% @type categorical
% @canonical false
% @original_name positive_aspect (lightweight)
% @values lively_maneuverable=Lightweight_core_lively_maneuverable_feel unk_positive_aspect_lightweight=Unknown
% @importance 0.85

0.82::true_val(positive_aspect_lightweight, lively_maneuverable); 0.18::true_val(positive_aspect_lightweight, unk_positive_aspect_lightweight).
0.82::acc(s6, positive_aspect_lightweight).
measured(s6, positive_aspect_lightweight, lively_maneuverable).
all_consistent(positive_aspect_lightweight) :- consistent(s6, positive_aspect_lightweight).
evidence(all_consistent(positive_aspect_lightweight)).
query(true_val(positive_aspect_lightweight, lively_maneuverable)).
query(true_val(positive_aspect_lightweight, unk_positive_aspect_lightweight)).

% @attr positive_aspect_stability
% @type categorical
% @canonical false
% @original_name positive_aspect (stability)
% @values stable_maneuverable=Stable_for_approach_maneuverable_for_adjustments unk_positive_aspect_stability=Unknown
% @importance 0.80

0.82::true_val(positive_aspect_stability, stable_maneuverable); 0.18::true_val(positive_aspect_stability, unk_positive_aspect_stability).
0.80::acc(s32, positive_aspect_stability).
measured(s32, positive_aspect_stability, stable_maneuverable).
all_consistent(positive_aspect_stability) :- consistent(s32, positive_aspect_stability).
evidence(all_consistent(positive_aspect_stability)).
query(true_val(positive_aspect_stability, stable_maneuverable)).
query(true_val(positive_aspect_stability, unk_positive_aspect_stability)).

% @attr positive_aspect_quiver
% @type categorical
% @canonical false
% @original_name positive_aspect (one board quiver)
% @values one_board_quiver=Could_easily_be_one_board_quiver unk_positive_aspect_quiver=Unknown
% @importance 0.85

0.82::true_val(positive_aspect_quiver, one_board_quiver); 0.18::true_val(positive_aspect_quiver, unk_positive_aspect_quiver).
0.82::acc(s6, positive_aspect_quiver).
measured(s6, positive_aspect_quiver, one_board_quiver).
all_consistent(positive_aspect_quiver) :- consistent(s6, positive_aspect_quiver).
evidence(all_consistent(positive_aspect_quiver)).
query(true_val(positive_aspect_quiver, one_board_quiver)).
query(true_val(positive_aspect_quiver, unk_positive_aspect_quiver)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect (uneven soft snow)
% @values bucks_uneven_snow=Bucks_in_uneven_soft_snow unk_negative_aspect=Unknown
% @importance 0.95

0.88::true_val(negative_aspect, bucks_uneven_snow); 0.12::true_val(negative_aspect, unk_negative_aspect).
0.88::acc(s11, negative_aspect).
measured(s11, negative_aspect, bucks_uneven_snow).
all_consistent(negative_aspect) :- consistent(s11, negative_aspect).
evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, bucks_uneven_snow)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_powder
% @type categorical
% @canonical false
% @original_name negative_aspect (powder)
% @values not_good_powder=Not_as_good_in_powder_as_it_looks unk_negative_aspect_powder=Unknown
% @importance 0.95

0.88::true_val(negative_aspect_powder, not_good_powder); 0.12::true_val(negative_aspect_powder, unk_negative_aspect_powder).
0.88::acc(s11, negative_aspect_powder).
measured(s11, negative_aspect_powder, not_good_powder).
all_consistent(negative_aspect_powder) :- consistent(s11, negative_aspect_powder).
evidence(all_consistent(negative_aspect_powder)).
query(true_val(negative_aspect_powder, not_good_powder)).
query(true_val(negative_aspect_powder, unk_negative_aspect_powder)).

% @attr negative_aspect_beginners
% @type categorical
% @canonical false
% @original_name negative_aspect (beginners)
% @values not_for_beginners=Far_from_ideal_for_beginners_intermediates_technical unk_negative_aspect_beginners=Unknown
% @importance 0.95

0.88::true_val(negative_aspect_beginners, not_for_beginners); 0.12::true_val(negative_aspect_beginners, unk_negative_aspect_beginners).
0.88::acc(s11, negative_aspect_beginners).
measured(s11, negative_aspect_beginners, not_for_beginners).
all_consistent(negative_aspect_beginners) :- consistent(s11, negative_aspect_beginners).
evidence(all_consistent(negative_aspect_beginners)).
query(true_val(negative_aspect_beginners, not_for_beginners)).
query(true_val(negative_aspect_beginners, unk_negative_aspect_beginners)).

% @attr negative_aspect_slow_speed
% @type categorical
% @canonical false
% @original_name negative_aspect (slow speed)
% @values not_fun_slow=Not_in_fun_zone_at_slower_speeds unk_negative_aspect_slow_speed=Unknown
% @importance 0.80

0.68::true_val(negative_aspect_slow_speed, not_fun_slow); 0.32::true_val(negative_aspect_slow_speed, unk_negative_aspect_slow_speed).
0.58::acc(s34, negative_aspect_slow_speed).
measured(s34, negative_aspect_slow_speed, not_fun_slow).
all_consistent(negative_aspect_slow_speed) :- consistent(s34, negative_aspect_slow_speed).
evidence(all_consistent(negative_aspect_slow_speed)).
query(true_val(negative_aspect_slow_speed, not_fun_slow)).
query(true_val(negative_aspect_slow_speed, unk_negative_aspect_slow_speed)).

% @attr negative_aspect_dampness
% @type categorical
% @canonical false
% @original_name negative_aspect (dampness)
% @values not_damp=Not_most_damp_feel_underfoot unk_negative_aspect_dampness=Unknown
% @importance 0.75

0.78::true_val(negative_aspect_dampness, not_damp); 0.22::true_val(negative_aspect_dampness, unk_negative_aspect_dampness).
0.72::acc(s24, negative_aspect_dampness).
measured(s24, negative_aspect_dampness, not_damp).
all_consistent(negative_aspect_dampness) :- consistent(s24, negative_aspect_dampness).
evidence(all_consistent(negative_aspect_dampness)).
query(true_val(negative_aspect_dampness, not_damp)).
query(true_val(negative_aspect_dampness, unk_negative_aspect_dampness)).

% @attr negative_aspect_ice_grip
% @type categorical
% @canonical false
% @original_name negative_aspect (ice grip)
% @values ice_grip_worse_than_expected=Ice_grip_worse_than_Mercury_BSOD unk_negative_aspect_ice_grip=Unknown
% @importance 0.80

0.65::true_val(negative_aspect_ice_grip, ice_grip_worse_than_expected); 0.35::true_val(negative_aspect_ice_grip, unk_negative_aspect_ice_grip).
0.55::acc(s34, negative_aspect_ice_grip).
measured(s34, negative_aspect_ice_grip, ice_grip_worse_than_expected).
all_consistent(negative_aspect_ice_grip) :- consistent(s34, negative_aspect_ice_grip).
evidence(all_consistent(negative_aspect_ice_grip)).
query(true_val(negative_aspect_ice_grip, ice_grip_worse_than_expected)).
query(true_val(negative_aspect_ice_grip, unk_negative_aspect_ice_grip)).

% @attr negative_aspect_jib
% @type categorical
% @canonical false
% @original_name negative_aspect (jib/park)
% @values too_stiff_demanding=Too_stiff_demanding_for_beginners_jib_riders unk_negative_aspect_jib=Unknown
% @importance 0.70

0.72::true_val(negative_aspect_jib, too_stiff_demanding); 0.28::true_val(negative_aspect_jib, unk_negative_aspect_jib).
0.62::acc(s27, negative_aspect_jib).
measured(s27, negative_aspect_jib, too_stiff_demanding).
all_consistent(negative_aspect_jib) :- consistent(s27, negative_aspect_jib).
evidence(all_consistent(negative_aspect_jib)).
query(true_val(negative_aspect_jib, too_stiff_demanding)).
query(true_val(negative_aspect_jib, unk_negative_aspect_jib)).

% @attr negative_aspect_butter
% @type categorical
% @canonical false
% @original_name negative_aspect (butter/press)
% @values hard_to_press=Not_easy_to_press_butter_due_to_camber unk_negative_aspect_butter=Unknown
% @importance 0.85

0.82::true_val(negative_aspect_butter, hard_to_press); 0.18::true_val(negative_aspect_butter, unk_negative_aspect_butter).
0.82::acc(s6, negative_aspect_butter).
measured(s6, negative_aspect_butter, hard_to_press).
all_consistent(negative_aspect_butter) :- consistent(s6, negative_aspect_butter).
evidence(all_consistent(negative_aspect_butter)).
query(true_val(negative_aspect_butter, hard_to_press)).
query(true_val(negative_aspect_butter, unk_negative_aspect_butter)).

% @attr negative_aspect_price
% @type categorical
% @canonical false
% @original_name negative_aspect (price)
% @values premium_price=Premium_price_point unk_negative_aspect_price=Unknown
% @importance 0.70

0.72::true_val(negative_aspect_price, premium_price); 0.28::true_val(negative_aspect_price, unk_negative_aspect_price).
0.65::acc(s33, negative_aspect_price).
measured(s33, negative_aspect_price, premium_price).
all_consistent(negative_aspect_price) :- consistent(s33, negative_aspect_price).
evidence(all_consistent(negative_aspect_price)).
query(true_val(negative_aspect_price, premium_price)).
query(true_val(negative_aspect_price, unk_negative_aspect_price)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand (Mercury)
% @values capita_mercury=CAPiTA_Mercury_more_all_round_hybrid_forgiving unk_comparable_board_same_brand=Unknown
% @importance 0.73

0.90::true_val(comparable_board_same_brand, capita_mercury); 0.10::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).
0.60::acc(s35, comparable_board_same_brand).
0.82::acc(s36, comparable_board_same_brand).
measured(s35, comparable_board_same_brand, capita_mercury).
measured(s36, comparable_board_same_brand, capita_mercury).
all_consistent(comparable_board_same_brand) :- consistent(s35, comparable_board_same_brand), consistent(s36, comparable_board_same_brand).
evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, capita_mercury)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_bsod
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (BSOD)
% @values capita_bsod=CAPiTA_BSOD_freeride_speed_stability_charging unk_comparable_board_same_brand_bsod=Unknown
% @importance 0.73

0.80::true_val(comparable_board_same_brand_bsod, capita_bsod); 0.20::true_val(comparable_board_same_brand_bsod, unk_comparable_board_same_brand_bsod).
0.58::acc(s37, comparable_board_same_brand_bsod).
0.55::acc(s38, comparable_board_same_brand_bsod).
measured(s37, comparable_board_same_brand_bsod, capita_bsod).
measured(s38, comparable_board_same_brand_bsod, capita_bsod).
all_consistent(comparable_board_same_brand_bsod) :- consistent(s37, comparable_board_same_brand_bsod), consistent(s38, comparable_board_same_brand_bsod).
evidence(all_consistent(comparable_board_same_brand_bsod)).
query(true_val(comparable_board_same_brand_bsod, capita_bsod)).
query(true_val(comparable_board_same_brand_bsod, unk_comparable_board_same_brand_bsod)).

% @attr comparable_board_same_brand_mega_death
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Mega Death)
% @values capita_mega_death=CAPiTA_Mega_Death_ultralight_BSOD_premium unk_comparable_board_same_brand_mega_death=Unknown
% @importance 0.55

0.78::true_val(comparable_board_same_brand_mega_death, capita_mega_death); 0.22::true_val(comparable_board_same_brand_mega_death, unk_comparable_board_same_brand_mega_death).
0.75::acc(s39, comparable_board_same_brand_mega_death).
measured(s39, comparable_board_same_brand_mega_death, capita_mega_death).
all_consistent(comparable_board_same_brand_mega_death) :- consistent(s39, comparable_board_same_brand_mega_death).
evidence(all_consistent(comparable_board_same_brand_mega_death)).
query(true_val(comparable_board_same_brand_mega_death, capita_mega_death)).
query(true_val(comparable_board_same_brand_mega_death, unk_comparable_board_same_brand_mega_death)).

% @attr comparable_board_same_brand_artemis
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Artemis)
% @values capita_artemis=CAPiTA_Artemis_womens_Aeronaut_Mercury_hybrid unk_comparable_board_same_brand_artemis=Unknown
% @importance 0.40

0.77::true_val(comparable_board_same_brand_artemis, capita_artemis); 0.23::true_val(comparable_board_same_brand_artemis, unk_comparable_board_same_brand_artemis).
0.70::acc(s22, comparable_board_same_brand_artemis).
measured(s22, comparable_board_same_brand_artemis, capita_artemis).
all_consistent(comparable_board_same_brand_artemis) :- consistent(s22, comparable_board_same_brand_artemis).
evidence(all_consistent(comparable_board_same_brand_artemis)).
query(true_val(comparable_board_same_brand_artemis, capita_artemis)).
query(true_val(comparable_board_same_brand_artemis, unk_comparable_board_same_brand_artemis)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand (Jones Stratos)
% @values jones_stratos=Jones_Stratos unk_comparable_board_cross_brand=Unknown
% @importance 0.70

0.72::true_val(comparable_board_cross_brand, jones_stratos); 0.28::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).
0.62::acc(s27, comparable_board_cross_brand).
measured(s27, comparable_board_cross_brand, jones_stratos).
all_consistent(comparable_board_cross_brand) :- consistent(s27, comparable_board_cross_brand).
evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, jones_stratos)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_yes
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Yes Standard UnInc)
% @values yes_standard_uninc=Yes_Standard_UnInc unk_comparable_board_cross_brand_yes=Unknown
% @importance 0.70

0.72::true_val(comparable_board_cross_brand_yes, yes_standard_uninc); 0.28::true_val(comparable_board_cross_brand_yes, unk_comparable_board_cross_brand_yes).
0.62::acc(s27, comparable_board_cross_brand_yes).
measured(s27, comparable_board_cross_brand_yes, yes_standard_uninc).
all_consistent(comparable_board_cross_brand_yes) :- consistent(s27, comparable_board_cross_brand_yes).
evidence(all_consistent(comparable_board_cross_brand_yes)).
query(true_val(comparable_board_cross_brand_yes, yes_standard_uninc)).
query(true_val(comparable_board_cross_brand_yes, unk_comparable_board_cross_brand_yes)).

% @attr comparable_board_cross_brand_burton
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Burton Custom Camber)
% @values burton_custom_camber=Burton_Custom_Camber unk_comparable_board_cross_brand_burton=Unknown
% @importance 0.85

0.82::true_val(comparable_board_cross_brand_burton, burton_custom_camber); 0.18::true_val(comparable_board_cross_brand_burton, unk_comparable_board_cross_brand_burton).
0.80::acc(s6, comparable_board_cross_brand_burton).
measured(s6, comparable_board_cross_brand_burton, burton_custom_camber).
all_consistent(comparable_board_cross_brand_burton) :- consistent(s6, comparable_board_cross_brand_burton).
evidence(all_consistent(comparable_board_cross_brand_burton)).
query(true_val(comparable_board_cross_brand_burton, burton_custom_camber)).
query(true_val(comparable_board_cross_brand_burton, unk_comparable_board_cross_brand_burton)).

% @attr comparable_board_cross_brand_others
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (K2 Manifest et al)
% @values k2_manifest_amplid_korua_ride_salomon=K2_Manifest_Amplid_Souly_Grail_Korua_Otto_Ride_Algorythm_Salomon_Highpath unk_comparable_board_cross_brand_others=Unknown
% @importance 0.95

0.88::true_val(comparable_board_cross_brand_others, k2_manifest_amplid_korua_ride_salomon); 0.12::true_val(comparable_board_cross_brand_others, unk_comparable_board_cross_brand_others).
0.85::acc(s11, comparable_board_cross_brand_others).
measured(s11, comparable_board_cross_brand_others, k2_manifest_amplid_korua_ride_salomon).
all_consistent(comparable_board_cross_brand_others) :- consistent(s11, comparable_board_cross_brand_others).
evidence(all_consistent(comparable_board_cross_brand_others)).
query(true_val(comparable_board_cross_brand_others, k2_manifest_amplid_korua_ride_salomon)).
query(true_val(comparable_board_cross_brand_others, unk_comparable_board_cross_brand_others)).

% @attr price_usd_msrp_comparable
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_msrp (comparable Mercury range)
% @values v629_95_679_95=629.95_679.95 unk_price_usd_msrp_comparable=Unknown
% @importance 0.55

0.72::true_val(price_usd_msrp_comparable, v629_95_679_95); 0.28::true_val(price_usd_msrp_comparable, unk_price_usd_msrp_comparable).
0.60::acc(s40, price_usd_msrp_comparable).
measured(s40, price_usd_msrp_comparable, v629_95_679_95).
all_consistent(price_usd_msrp_comparable) :- consistent(s40, price_usd_msrp_comparable).
evidence(all_consistent(price_usd_msrp_comparable)).
query(true_val(price_usd_msrp_comparable, v629_95_679_95)).
query(true_val(price_usd_msrp_comparable, unk_price_usd_msrp_comparable)).

% @attr sustainability_certification_fsc
% @type categorical
% @canonical false
% @original_name sustainability_certification (FSC wood)
% @values fsc_certified_wood=FSC_certified_wood_cores unk_sustainability_certification_fsc=Unknown
% @importance 0.45

0.86::true_val(sustainability_certification_fsc, fsc_certified_wood); 0.14::true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc).
0.90::acc(s5, sustainability_certification_fsc).
measured(s5, sustainability_certification_fsc, fsc_certified_wood).
all_consistent(sustainability_certification_fsc) :- consistent(s5, sustainability_certification_fsc).
evidence(all_consistent(sustainability_certification_fsc)).
query(true_val(sustainability_certification_fsc, fsc_certified_wood)).
query(true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc)).

% @attr sustainability_certification_resin
% @type categorical
% @canonical false
% @original_name sustainability_certification (bio resins)
% @values plant_based_bio_resin=Plant_based_bio_resins_zero_waste_no_emissions unk_sustainability_certification_resin=Unknown
% @importance 0.90

0.95::true_val(sustainability_certification_resin, plant_based_bio_resin); 0.05::true_val(sustainability_certification_resin, unk_sustainability_certification_resin).
0.94::acc(s1, sustainability_certification_resin).
0.70::acc(s2, sustainability_certification_resin).
measured(s1, sustainability_certification_resin, plant_based_bio_resin).
measured(s2, sustainability_certification_resin, plant_based_bio_resin).
all_consistent(sustainability_certification_resin) :- consistent(s1, sustainability_certification_resin), (indep(s2), consistent(s2, sustainability_certification_resin) ; \+indep(s2)).
evidence(all_consistent(sustainability_certification_resin)).
query(true_val(sustainability_certification_resin, plant_based_bio_resin)).
query(true_val(sustainability_certification_resin, unk_sustainability_certification_resin)).

% @attr sustainability_certification_ink
% @type categorical
% @canonical false
% @original_name sustainability_certification (UV ink)
% @values water_based_uv_ink=Water_based_solventless_UV_ink unk_sustainability_certification_ink=Unknown
% @importance 0.58

0.88::true_val(sustainability_certification_ink, water_based_uv_ink); 0.12::true_val(sustainability_certification_ink, unk_sustainability_certification_ink).
0.70::acc(s2, sustainability_certification_ink).
0.60::acc(s16, sustainability_certification_ink).
measured(s2, sustainability_certification_ink, water_based_uv_ink).
measured(s16, sustainability_certification_ink, water_based_uv_ink).
all_consistent(sustainability_certification_ink) :- consistent(s2, sustainability_certification_ink), (indep(s16), consistent(s16, sustainability_certification_ink) ; \+indep(s16)).
evidence(all_consistent(sustainability_certification_ink)).
query(true_val(sustainability_certification_ink, water_based_uv_ink)).
query(true_val(sustainability_certification_ink, unk_sustainability_certification_ink)).

% @attr core_milling
% @type categorical
% @canonical false
% @original_name Core milling
% @values cnc_5axis_hand_inspect=In_house_5axis_CNC_hand_inspection_carpenters unk_core_milling=Unknown
% @importance 0.40

0.86::true_val(core_milling, cnc_5axis_hand_inspect); 0.14::true_val(core_milling, unk_core_milling).
0.90::acc(s41, core_milling).
measured(s41, core_milling, cnc_5axis_hand_inspect).
all_consistent(core_milling) :- consistent(s41, core_milling).
evidence(all_consistent(core_milling)).
query(true_val(core_milling, cnc_5axis_hand_inspect)).
query(true_val(core_milling, unk_core_milling)).

% @attr insert_drilling
% @type categorical
% @canonical false
% @original_name Insert drilling
% @values automated_thermal_robotic=Automated_thermal_insert_drilling_robotic_precision unk_insert_drilling=Unknown
% @importance 0.75

0.92::true_val(insert_drilling, automated_thermal_robotic); 0.08::true_val(insert_drilling, unk_insert_drilling).
0.93::acc(s30, insert_drilling).
measured(s30, insert_drilling, automated_thermal_robotic).
all_consistent(insert_drilling) :- consistent(s30, insert_drilling).
evidence(all_consistent(insert_drilling)).
query(true_val(insert_drilling, automated_thermal_robotic)).
query(true_val(insert_drilling, unk_insert_drilling)).

% @attr quality_control
% @type categorical
% @canonical false
% @original_name Quality control
% @values final_hand_inspect_stamp=Final_hand_inspection_MotherShip_QC_stamp unk_quality_control=Unknown
% @importance 0.40

0.86::true_val(quality_control, final_hand_inspect_stamp); 0.14::true_val(quality_control, unk_quality_control).
0.90::acc(s41, quality_control).
measured(s41, quality_control, final_hand_inspect_stamp).
all_consistent(quality_control) :- consistent(s41, quality_control).
evidence(all_consistent(quality_control)).
query(true_val(quality_control, final_hand_inspect_stamp)).
query(true_val(quality_control, unk_quality_control)).

% @attr sustainability_certification_pressing
% @type categorical
% @canonical false
% @original_name sustainability_certification (pressing)
% @values low_temp_pressing=Lower_temperature_pressing_reduced_cycle_less_energy unk_sustainability_certification_pressing=Unknown
% @importance 0.45

0.86::true_val(sustainability_certification_pressing, low_temp_pressing); 0.14::true_val(sustainability_certification_pressing, unk_sustainability_certification_pressing).
0.90::acc(s5, sustainability_certification_pressing).
measured(s5, sustainability_certification_pressing, low_temp_pressing).
all_consistent(sustainability_certification_pressing) :- consistent(s5, sustainability_certification_pressing).
evidence(all_consistent(sustainability_certification_pressing)).
query(true_val(sustainability_certification_pressing, low_temp_pressing)).
query(true_val(sustainability_certification_pressing, unk_sustainability_certification_pressing)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum (at home good at everything)
% @values felt_at_home_good_at_everything=Immediately_felt_at_home_quite_good_at_everything unk_user_review_forum=Unknown
% @importance 0.80

0.68::true_val(user_review_forum, felt_at_home_good_at_everything); 0.32::true_val(user_review_forum, unk_user_review_forum).
0.58::acc(s34, user_review_forum).
measured(s34, user_review_forum, felt_at_home_good_at_everything).
all_consistent(user_review_forum) :- consistent(s34, user_review_forum).
evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, felt_at_home_good_at_everything)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr user_review_forum_pop
% @type categorical
% @canonical false
% @original_name user_review_forum (pop vs Mercury)
% @values aeronaut_outperforms_merc_pop=Aeronaut_outperforms_Mercury_pure_pop unk_user_review_forum_pop=Unknown
% @importance 0.80

0.68::true_val(user_review_forum_pop, aeronaut_outperforms_merc_pop); 0.32::true_val(user_review_forum_pop, unk_user_review_forum_pop).
0.58::acc(s34, user_review_forum_pop).
measured(s34, user_review_forum_pop, aeronaut_outperforms_merc_pop).
all_consistent(user_review_forum_pop) :- consistent(s34, user_review_forum_pop).
evidence(all_consistent(user_review_forum_pop)).
query(true_val(user_review_forum_pop, aeronaut_outperforms_merc_pop)).
query(true_val(user_review_forum_pop, unk_user_review_forum_pop)).

% @attr user_review_forum_mercury
% @type categorical
% @canonical false
% @original_name user_review_forum (Mercury preferred side hits)
% @values mercury_better_side_hits=Mercury_preferred_for_side_hits_sketchy_landings unk_user_review_forum_mercury=Unknown
% @importance 0.80

0.68::true_val(user_review_forum_mercury, mercury_better_side_hits); 0.32::true_val(user_review_forum_mercury, unk_user_review_forum_mercury).
0.58::acc(s34, user_review_forum_mercury).
measured(s34, user_review_forum_mercury, mercury_better_side_hits).
all_consistent(user_review_forum_mercury) :- consistent(s34, user_review_forum_mercury).
evidence(all_consistent(user_review_forum_mercury)).
query(true_val(user_review_forum_mercury, mercury_better_side_hits)).
query(true_val(user_review_forum_mercury, unk_user_review_forum_mercury)).

% @attr user_review_forum_letdown
% @type categorical
% @canonical false
% @original_name user_review_forum (let down)
% @values solid_all_rounder_nothing_stands_out=Solid_all_rounder_but_no_standout_beyond_pop unk_user_review_forum_letdown=Unknown
% @importance 0.80

0.68::true_val(user_review_forum_letdown, solid_all_rounder_nothing_stands_out); 0.32::true_val(user_review_forum_letdown, unk_user_review_forum_letdown).
0.58::acc(s34, user_review_forum_letdown).
measured(s34, user_review_forum_letdown, solid_all_rounder_nothing_stands_out).
all_consistent(user_review_forum_letdown) :- consistent(s34, user_review_forum_letdown).
evidence(all_consistent(user_review_forum_letdown)).
query(true_val(user_review_forum_letdown, solid_all_rounder_nothing_stands_out)).
query(true_val(user_review_forum_letdown, unk_user_review_forum_letdown)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical false
% @original_name Reviewer opinion The Good Ride
% @values stay_lower_weight=Recommended_lower_end_weight_better_for_lighter_riders unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.95

0.88::true_val(reviewer_opinion_the_good_ride, stay_lower_weight); 0.12::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).
0.88::acc(s11, reviewer_opinion_the_good_ride).
measured(s11, reviewer_opinion_the_good_ride, stay_lower_weight).
all_consistent(reviewer_opinion_the_good_ride) :- consistent(s11, reviewer_opinion_the_good_ride).
evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, stay_lower_weight)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr recommended_binding_pairing
% @type categorical
% @canonical false
% @original_name Recommended binding pairing
% @values medium_stiff_binding=Medium_stiff_binding_Union_Atlas_Falcor unk_recommended_binding_pairing=Unknown
% @importance 0.70

0.78::true_val(recommended_binding_pairing, medium_stiff_binding); 0.22::true_val(recommended_binding_pairing, unk_recommended_binding_pairing).
0.62::acc(s33, recommended_binding_pairing).
0.55::acc(s34, recommended_binding_pairing).
measured(s33, recommended_binding_pairing, medium_stiff_binding).
measured(s34, recommended_binding_pairing, medium_stiff_binding).
all_consistent(recommended_binding_pairing) :- (indep(s33), consistent(s33, recommended_binding_pairing) ; \+indep(s33)), consistent(s34, recommended_binding_pairing).
evidence(all_consistent(recommended_binding_pairing)).
query(true_val(recommended_binding_pairing, medium_stiff_binding)).
query(true_val(recommended_binding_pairing, unk_recommended_binding_pairing)).