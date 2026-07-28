0.15::indep(s14).
0.15::indep(s24).
0.15::indep(s36).
0.12::indep(s25).
0.12::indep(s26).
0.12::indep(s27).
0.10::indep(s20).
0.15::indep(s_merchant).
0.20::indep(s6).
0.15::indep(s18).
0.15::indep(s19).
0.15::indep(s32).
0.15::indep(s34).
0.15::indep(s21).
0.15::indep(s16).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

0.97::acc(s1, brand).
% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values lib_tech=Lib_Tech unk_brand=Unknown
% @importance 1.0
0.95::true_val(brand, lib_tech); 0.05::true_val(brand, unk_brand).
measured(s1, brand, lib_tech).
all_consistent(brand) :- consistent(s1, brand).
evidence(all_consistent(brand)).
query(true_val(brand, lib_tech)).
query(true_val(brand, unk_brand)).

0.97::acc(s1, model_name).
% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values off_ramp=Off_Ramp unk_model_name=Unknown
% @importance 1.0
0.95::true_val(model_name, off_ramp); 0.05::true_val(model_name, unk_model_name).
measured(s1, model_name, off_ramp).
all_consistent(model_name) :- consistent(s1, model_name).
evidence(all_consistent(model_name)).
query(true_val(model_name, off_ramp)).
query(true_val(model_name, unk_model_name)).

0.95::acc(s1, model_year).
% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values yr2025=2025 unk_model_year=Unknown
% @importance 1.0
0.95::true_val(model_year, yr2025); 0.05::true_val(model_year, unk_model_year).
measured(s1, model_year, yr2025).
all_consistent(model_year) :- consistent(s1, model_year).
evidence(all_consistent(model_year)).
query(true_val(model_year, yr2025)).
query(true_val(model_year, unk_model_year)).

0.85::acc(s3, model_first_available_year).
0.85::acc(s4, model_first_available_year).
% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2024=2024_season unk_model_first_available_year=Unknown
% @importance 0.65
0.90::true_val(model_first_available_year, season_2024); 0.10::true_val(model_first_available_year, unk_model_first_available_year).
measured(s3, model_first_available_year, season_2024).
measured(s4, model_first_available_year, season_2024).
all_consistent(model_first_available_year) :- consistent(s3, model_first_available_year), consistent(s4, model_first_available_year).
evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2024)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

0.85::acc(s3, predecessor_model_name).
0.88::acc(s4, predecessor_model_name).
% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values box_knife=Lib_Tech_Box_Knife unk_predecessor_model_name=Unknown
% @importance 0.65
0.90::true_val(predecessor_model_name, box_knife); 0.10::true_val(predecessor_model_name, unk_predecessor_model_name).
measured(s3, predecessor_model_name, box_knife).
measured(s4, predecessor_model_name, box_knife).
all_consistent(predecessor_model_name) :- consistent(s3, predecessor_model_name), consistent(s4, predecessor_model_name).
evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, box_knife)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).

0.97::acc(s1, product_type).
% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0
0.97::true_val(product_type, snowboard); 0.03::true_val(product_type, unk_product_type).
measured(s1, product_type, snowboard).
all_consistent(product_type) :- consistent(s1, product_type).
evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

0.88::acc(s5, board_category).
0.80::acc(s6, board_category).
0.95::acc(s1, board_category).
% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mtn_freestyle=All_Mountain_Freestyle freestyle_park_twin=Freestyle_Park_Twin
% @importance 0.85
0.45::true_val(board_category, all_mtn_freestyle); 0.55::true_val(board_category, freestyle_park_twin).
measured(s5, board_category, all_mtn_freestyle).
measured(s6, board_category, all_mtn_freestyle).
measured(s1, board_category, freestyle_park_twin).
all_consistent(board_category) :- consistent(s5, board_category), consistent(s1, board_category), (indep(s6), consistent(s6, board_category) ; \+indep(s6)).
evidence(all_consistent(board_category)).
query(true_val(board_category, all_mtn_freestyle)).
query(true_val(board_category, freestyle_park_twin)).

0.82::acc(s7, gender).
% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.5
0.90::true_val(gender, mens); 0.10::true_val(gender, unk_gender).
measured(s7, gender, mens).
all_consistent(gender) :- consistent(s7, gender).
evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

0.95::acc(s1, pro_rider_name).
0.85::acc(s5, pro_rider_name).
% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values hansen_soltane=Phil_Hansen_and_Matteo_Soltane unk_pro_rider_name=Unknown
% @importance 0.925
0.95::true_val(pro_rider_name, hansen_soltane); 0.05::true_val(pro_rider_name, unk_pro_rider_name).
measured(s1, pro_rider_name, hansen_soltane).
measured(s5, pro_rider_name, hansen_soltane).
all_consistent(pro_rider_name) :- consistent(s1, pro_rider_name), consistent(s5, pro_rider_name).
evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, hansen_soltane)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

0.92::acc(s2, graphic_designer_artist).
% @attr graphic_designer_artist
% @type categorical
% @canonical true
% @original_name graphic_designer_artist
% @values phil_hansen=Phil_Hansen unk_graphic_designer_artist=Unknown
% @importance 1.0
0.92::true_val(graphic_designer_artist, phil_hansen); 0.08::true_val(graphic_designer_artist, unk_graphic_designer_artist).
measured(s2, graphic_designer_artist, phil_hansen).
all_consistent(graphic_designer_artist) :- consistent(s2, graphic_designer_artist).
evidence(all_consistent(graphic_designer_artist)).
query(true_val(graphic_designer_artist, phil_hansen)).
query(true_val(graphic_designer_artist, unk_graphic_designer_artist)).

0.95::acc(s_merchant, sku_merchant).
% @attr sku_merchant
% @type categorical
% @canonical false
% @original_name SKU (merchant)
% @values sku_24sn053_157=24SN053_157 unk_sku_merchant=Unknown
% @importance 0.85
0.95::true_val(sku_merchant, sku_24sn053_157); 0.05::true_val(sku_merchant, unk_sku_merchant).
measured(s_merchant, sku_merchant, sku_24sn053_157).
all_consistent(sku_merchant) :- consistent(s_merchant, sku_merchant).
evidence(all_consistent(sku_merchant)).
query(true_val(sku_merchant, sku_24sn053_157)).
query(true_val(sku_merchant, unk_sku_merchant)).

0.80::acc(s8, youth_variant).
% @attr youth_variant
% @type categorical
% @canonical false
% @original_name Youth variant
% @values mini_ramp=Lib_Tech_Mini_Ramp unk_youth_variant=Unknown
% @importance 0.35
0.80::true_val(youth_variant, mini_ramp); 0.20::true_val(youth_variant, unk_youth_variant).
measured(s8, youth_variant, mini_ramp).
all_consistent(youth_variant) :- consistent(s8, youth_variant).
evidence(all_consistent(youth_variant)).
query(true_val(youth_variant, mini_ramp)).
query(true_val(youth_variant, unk_youth_variant)).

0.85::acc(s9, manufacturer).
% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values mervin_manufacturing=Mervin_Manufacturing unk_manufacturer=Unknown
% @importance 0.7
0.92::true_val(manufacturer, mervin_manufacturing); 0.08::true_val(manufacturer, unk_manufacturer).
measured(s9, manufacturer, mervin_manufacturing).
all_consistent(manufacturer) :- consistent(s9, manufacturer).
evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, mervin_manufacturing)).
query(true_val(manufacturer, unk_manufacturer)).

0.80::acc(s10, parent_company_ownership).
% @attr parent_company_ownership
% @type categorical
% @canonical false
% @original_name Parent company ownership
% @values spring_capital_group=Spring_Capital_Group unk_parent_company_ownership=Unknown
% @importance 0.5
0.80::true_val(parent_company_ownership, spring_capital_group); 0.20::true_val(parent_company_ownership, unk_parent_company_ownership).
measured(s10, parent_company_ownership, spring_capital_group).
all_consistent(parent_company_ownership) :- consistent(s10, parent_company_ownership).
evidence(all_consistent(parent_company_ownership)).
query(true_val(parent_company_ownership, spring_capital_group)).
query(true_val(parent_company_ownership, unk_parent_company_ownership)).

0.82::acc(s11, previous_ownership).
0.78::acc(s12, previous_ownership).
% @attr previous_ownership
% @type categorical
% @canonical false
% @original_name Previous ownership
% @values altamont_then_quiksilver=Altamont_Capital_then_Quiksilver unk_previous_ownership=Unknown
% @importance 0.35
0.90::true_val(previous_ownership, altamont_then_quiksilver); 0.10::true_val(previous_ownership, unk_previous_ownership).
measured(s11, previous_ownership, altamont_then_quiksilver).
measured(s12, previous_ownership, altamont_then_quiksilver).
all_consistent(previous_ownership) :- consistent(s11, previous_ownership), consistent(s12, previous_ownership).
evidence(all_consistent(previous_ownership)).
query(true_val(previous_ownership, altamont_then_quiksilver)).
query(true_val(previous_ownership, unk_previous_ownership)).

0.90::acc(s9, manufacturing_location_current).
0.88::acc(s13, manufacturing_location_current).
% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values sequim_wa_usa=Sequim_Washington_USA unk_manufacturing_location_current=Unknown
% @importance 0.65
0.95::true_val(manufacturing_location_current, sequim_wa_usa); 0.05::true_val(manufacturing_location_current, unk_manufacturing_location_current).
measured(s9, manufacturing_location_current, sequim_wa_usa).
measured(s13, manufacturing_location_current, sequim_wa_usa).
all_consistent(manufacturing_location_current) :- consistent(s9, manufacturing_location_current), consistent(s13, manufacturing_location_current).
evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, sequim_wa_usa)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

0.85::acc(s14, manufacturing_method).
% @attr manufacturing_method
% @type categorical
% @canonical false
% @original_name Manufacturing method
% @values handbuilt_usa=Handbuilt_in_the_USA unk_manufacturing_method=Unknown
% @importance 0.9
0.88::true_val(manufacturing_method, handbuilt_usa); 0.12::true_val(manufacturing_method, unk_manufacturing_method).
measured(s14, manufacturing_method, handbuilt_usa).
all_consistent(manufacturing_method) :- (indep(s14), consistent(s14, manufacturing_method) ; \+indep(s14)).
evidence(all_consistent(manufacturing_method)).
query(true_val(manufacturing_method, handbuilt_usa)).
query(true_val(manufacturing_method, unk_manufacturing_method)).

0.85::acc(s13, manufacturer_reputation).
% @attr manufacturer_reputation
% @type categorical
% @canonical false
% @original_name Manufacturer reputation
% @values longest_running_usa_factory=Longest_running_last_major_board_factory_in_USA unk_manufacturer_reputation=Unknown
% @importance 0.6
0.85::true_val(manufacturer_reputation, longest_running_usa_factory); 0.15::true_val(manufacturer_reputation, unk_manufacturer_reputation).
measured(s13, manufacturer_reputation, longest_running_usa_factory).
all_consistent(manufacturer_reputation) :- consistent(s13, manufacturer_reputation).
evidence(all_consistent(manufacturer_reputation)).
query(true_val(manufacturer_reputation, longest_running_usa_factory)).
query(true_val(manufacturer_reputation, unk_manufacturer_reputation)).

0.90::acc(s15, sustainability_certification).
0.82::acc(s16, sustainability_certification).
% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values zero_waste_renewable=Zero_hazardous_waste_renewable_energy_eco_sublimation unk_sustainability_certification=Unknown
% @importance 0.425
0.92::true_val(sustainability_certification, zero_waste_renewable); 0.08::true_val(sustainability_certification, unk_sustainability_certification).
measured(s15, sustainability_certification, zero_waste_renewable).
measured(s16, sustainability_certification, zero_waste_renewable).
all_consistent(sustainability_certification) :- consistent(s15, sustainability_certification), (indep(s16), consistent(s16, sustainability_certification) ; \+indep(s16)).
evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, zero_waste_renewable)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

0.85::acc(s9, sister_brands).
% @attr sister_brands
% @type categorical
% @canonical false
% @original_name Sister brands
% @values gnu_roxy_bentmetal=GNU_Roxy_Bent_Metal unk_sister_brands=Unknown
% @importance 0.7
0.88::true_val(sister_brands, gnu_roxy_bentmetal); 0.12::true_val(sister_brands, unk_sister_brands).
measured(s9, sister_brands, gnu_roxy_bentmetal).
all_consistent(sister_brands) :- consistent(s9, sister_brands).
evidence(all_consistent(sister_brands)).
query(true_val(sister_brands, gnu_roxy_bentmetal)).
query(true_val(sister_brands, unk_sister_brands)).

0.82::acc(s13, brand_founded).
% @attr brand_founded
% @type categorical
% @canonical false
% @original_name Brand founded
% @values yr1977_olson_saari=1977_by_Mike_Olson_and_Pete_Saari unk_brand_founded=Unknown
% @importance 0.6
0.85::true_val(brand_founded, yr1977_olson_saari); 0.15::true_val(brand_founded, unk_brand_founded).
measured(s13, brand_founded, yr1977_olson_saari).
all_consistent(brand_founded) :- consistent(s13, brand_founded).
evidence(all_consistent(brand_founded)).
query(true_val(brand_founded, yr1977_olson_saari)).
query(true_val(brand_founded, unk_brand_founded)).

0.95::acc(s2, price_usd_msrp).
0.82::acc(s17, price_usd_msrp).
% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v549_99=549.99 v549=549.0
% @importance 0.925
0.65::true_val(price_usd_msrp, v549_99); 0.35::true_val(price_usd_msrp, v549).
measured(s2, price_usd_msrp, v549_99).
measured(s17, price_usd_msrp, v549).
all_consistent(price_usd_msrp) :- consistent(s2, price_usd_msrp), consistent(s17, price_usd_msrp).
evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v549_99)).
query(true_val(price_usd_msrp, v549)).

0.88::acc(s18, price_usd_evo).
% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_evo
% @values v405_99=405.99 unk_price_usd_evo=Unknown
% @importance 0.9
0.88::true_val(price_usd_evo, v405_99); 0.12::true_val(price_usd_evo, unk_price_usd_evo).
measured(s18, price_usd_evo, v405_99).
all_consistent(price_usd_evo) :- consistent(s18, price_usd_evo).
evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v405_99)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

0.88::acc(s19, price_usd_evo_2026).
% @attr price_usd_evo_2026
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_evo
% @values v384_99=384.99 unk_price_usd_evo_2026=Unknown
% @importance 0.9
0.88::true_val(price_usd_evo_2026, v384_99); 0.12::true_val(price_usd_evo_2026, unk_price_usd_evo_2026).
measured(s19, price_usd_evo_2026, v384_99).
all_consistent(price_usd_evo_2026) :- consistent(s19, price_usd_evo_2026).
evidence(all_consistent(price_usd_evo_2026)).
query(true_val(price_usd_evo_2026, v384_99)).
query(true_val(price_usd_evo_2026, unk_price_usd_evo_2026)).

0.90::acc(s2, price_usd_libtech_direct).
% @attr price_usd_libtech_direct
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at Lib Tech direct (2025-2026, USD)
% @values v395_99=395.99 unk_price_usd_libtech_direct=Unknown
% @importance 1.0
0.92::true_val(price_usd_libtech_direct, v395_99); 0.08::true_val(price_usd_libtech_direct, unk_price_usd_libtech_direct).
measured(s2, price_usd_libtech_direct, v395_99).
all_consistent(price_usd_libtech_direct) :- consistent(s2, price_usd_libtech_direct).
evidence(all_consistent(price_usd_libtech_direct)).
query(true_val(price_usd_libtech_direct, v395_99)).
query(true_val(price_usd_libtech_direct, unk_price_usd_libtech_direct)).

0.72::acc(s20, price_usd_gearchase).
% @attr price_usd_gearchase
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at GearChase (2025/2026, USD)
% @values v384_99_gc=384.99 unk_price_usd_gearchase=Unknown
% @importance 0.8
0.75::true_val(price_usd_gearchase, v384_99_gc); 0.25::true_val(price_usd_gearchase, unk_price_usd_gearchase).
measured(s20, price_usd_gearchase, v384_99_gc).
all_consistent(price_usd_gearchase) :- (indep(s20), consistent(s20, price_usd_gearchase) ; \+indep(s20)).
evidence(all_consistent(price_usd_gearchase)).
query(true_val(price_usd_gearchase, v384_99_gc)).
query(true_val(price_usd_gearchase, unk_price_usd_gearchase)).

0.68::acc(s21, price_usd_glacier).
% @attr price_usd_glacier
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at Glacier Ski Shop (2026 demo, USD)
% @values v385=385.0 unk_price_usd_glacier=Unknown
% @importance 0.7
0.72::true_val(price_usd_glacier, v385); 0.28::true_val(price_usd_glacier, unk_price_usd_glacier).
measured(s21, price_usd_glacier, v385).
all_consistent(price_usd_glacier) :- (indep(s21), consistent(s21, price_usd_glacier) ; \+indep(s21)).
evidence(all_consistent(price_usd_glacier)).
query(true_val(price_usd_glacier, v385)).
query(true_val(price_usd_glacier, unk_price_usd_glacier)).

0.95::acc(s_merchant, price_aud_merchant).
% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v678_99=678.99 unk_price_aud_merchant=Unknown
% @importance 0.85
0.95::true_val(price_aud_merchant, v678_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).
measured(s_merchant, price_aud_merchant, v678_99).
all_consistent(price_aud_merchant) :- consistent(s_merchant, price_aud_merchant).
evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v678_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

0.82::acc(s22, price_comparison_to_avg).
% @attr price_comparison_to_avg
% @type categorical
% @canonical false
% @original_name Price comparison to average
% @values above_avg_14_27=14_27_above_avg_535_72 unk_price_comparison_to_avg=Unknown
% @importance 0.85
0.82::true_val(price_comparison_to_avg, above_avg_14_27); 0.18::true_val(price_comparison_to_avg, unk_price_comparison_to_avg).
measured(s22, price_comparison_to_avg, above_avg_14_27).
all_consistent(price_comparison_to_avg) :- consistent(s22, price_comparison_to_avg).
evidence(all_consistent(price_comparison_to_avg)).
query(true_val(price_comparison_to_avg, above_avg_14_27)).
query(true_val(price_comparison_to_avg, unk_price_comparison_to_avg)).

0.85::acc(s23, negative_aspect).
% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values expensive_for_jib=Expensive_for_a_jib_board unk_negative_aspect=Unknown
% @importance 0.85
0.85::true_val(negative_aspect, expensive_for_jib); 0.15::true_val(negative_aspect, unk_negative_aspect).
measured(s23, negative_aspect, expensive_for_jib).
all_consistent(negative_aspect) :- consistent(s23, negative_aspect).
evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, expensive_for_jib)).
query(true_val(negative_aspect, unk_negative_aspect)).

0.80::acc(s14, availability_status_tactics).
% @attr availability_status_tactics
% @type categorical
% @canonical false
% @original_name availability_status
% @values out_of_stock=Out_of_stock_2025 unk_availability_status_tactics=Unknown
% @importance 0.9
0.80::true_val(availability_status_tactics, out_of_stock); 0.20::true_val(availability_status_tactics, unk_availability_status_tactics).
measured(s14, availability_status_tactics, out_of_stock).
all_consistent(availability_status_tactics) :- (indep(s14), consistent(s14, availability_status_tactics) ; \+indep(s14)).
evidence(all_consistent(availability_status_tactics)).
query(true_val(availability_status_tactics, out_of_stock)).
query(true_val(availability_status_tactics, unk_availability_status_tactics)).

0.85::acc(s18, availability_status).
0.85::acc(s19, availability_status).
% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values in_stock=In_stock unk_availability_status=Unknown
% @importance 0.9
0.95::true_val(availability_status, in_stock); 0.05::true_val(availability_status, unk_availability_status).
measured(s18, availability_status, in_stock).
measured(s19, availability_status, in_stock).
all_consistent(availability_status) :- (indep(s18), consistent(s18, availability_status) ; \+indep(s18)), (indep(s19), consistent(s19, availability_status) ; \+indep(s19)).
evidence(all_consistent(availability_status)).
query(true_val(availability_status, in_stock)).
query(true_val(availability_status, unk_availability_status)).

0.78::acc(s24, availability_status_blauer).
% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_blauer=Available unk_availability_status_blauer=Unknown
% @importance 0.75
0.82::true_val(availability_status_blauer, available_blauer); 0.18::true_val(availability_status_blauer, unk_availability_status_blauer).
measured(s24, availability_status_blauer, available_blauer).
all_consistent(availability_status_blauer) :- (indep(s24), consistent(s24, availability_status_blauer) ; \+indep(s24)).
evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, available_blauer)).
query(true_val(availability_status_blauer, unk_availability_status_blauer)).

0.78::acc(s25, availability_status_zumiez).
% @attr availability_status_zumiez
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_zumiez=Available unk_availability_status_zumiez=Unknown
% @importance 0.65
0.80::true_val(availability_status_zumiez, available_zumiez); 0.20::true_val(availability_status_zumiez, unk_availability_status_zumiez).
measured(s25, availability_status_zumiez, available_zumiez).
all_consistent(availability_status_zumiez) :- (indep(s25), consistent(s25, availability_status_zumiez) ; \+indep(s25)).
evidence(all_consistent(availability_status_zumiez)).
query(true_val(availability_status_zumiez, available_zumiez)).
query(true_val(availability_status_zumiez, unk_availability_status_zumiez)).

0.72::acc(s26, availability_status_gorge).
% @attr availability_status_gorge
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_gorge=Available unk_availability_status_gorge=Unknown
% @importance 0.5
0.75::true_val(availability_status_gorge, available_gorge); 0.25::true_val(availability_status_gorge, unk_availability_status_gorge).
measured(s26, availability_status_gorge, available_gorge).
all_consistent(availability_status_gorge) :- (indep(s26), consistent(s26, availability_status_gorge) ; \+indep(s26)).
evidence(all_consistent(availability_status_gorge)).
query(true_val(availability_status_gorge, available_gorge)).
query(true_val(availability_status_gorge, unk_availability_status_gorge)).

0.68::acc(s27, availability_status_proctor).
% @attr availability_status_proctor
% @type categorical
% @canonical false
% @original_name availability_status
% @values backordered_151=151_backordered unk_availability_status_proctor=Unknown
% @importance 0.6
0.70::true_val(availability_status_proctor, backordered_151); 0.30::true_val(availability_status_proctor, unk_availability_status_proctor).
measured(s27, availability_status_proctor, backordered_151).
all_consistent(availability_status_proctor) :- (indep(s27), consistent(s27, availability_status_proctor) ; \+indep(s27)).
evidence(all_consistent(availability_status_proctor)).
query(true_val(availability_status_proctor, backordered_151)).
query(true_val(availability_status_proctor, unk_availability_status_proctor)).

0.93::acc(s2, availability_status_libtech).
% @attr availability_status_libtech
% @type categorical
% @canonical false
% @original_name availability_status
% @values in_stock_libtech=In_stock_2025_2026 unk_availability_status_libtech=Unknown
% @importance 1.0
0.93::true_val(availability_status_libtech, in_stock_libtech); 0.07::true_val(availability_status_libtech, unk_availability_status_libtech).
measured(s2, availability_status_libtech, in_stock_libtech).
all_consistent(availability_status_libtech) :- consistent(s2, availability_status_libtech).
evidence(all_consistent(availability_status_libtech)).
query(true_val(availability_status_libtech, in_stock_libtech)).
query(true_val(availability_status_libtech, unk_availability_status_libtech)).

0.88::acc(s28, availability_status_libtech_direct).
% @attr availability_status_libtech_direct
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_direct=Available_direct unk_availability_status_libtech_direct=Unknown
% @importance 0.45
0.88::true_val(availability_status_libtech_direct, available_direct); 0.12::true_val(availability_status_libtech_direct, unk_availability_status_libtech_direct).
measured(s28, availability_status_libtech_direct, available_direct).
all_consistent(availability_status_libtech_direct) :- consistent(s28, availability_status_libtech_direct).
evidence(all_consistent(availability_status_libtech_direct)).
query(true_val(availability_status_libtech_direct, available_direct)).
query(true_val(availability_status_libtech_direct, unk_availability_status_libtech_direct)).

0.82::acc(s14, tactics_reputation).
% @attr tactics_reputation
% @type categorical
% @canonical false
% @original_name Tactics reputation
% @values established_since_1999=Established_US_retailer_since_1999 unk_tactics_reputation=Unknown
% @importance 0.9
0.82::true_val(tactics_reputation, established_since_1999); 0.18::true_val(tactics_reputation, unk_tactics_reputation).
measured(s14, tactics_reputation, established_since_1999).
all_consistent(tactics_reputation) :- (indep(s14), consistent(s14, tactics_reputation) ; \+indep(s14)).
evidence(all_consistent(tactics_reputation)).
query(true_val(tactics_reputation, established_since_1999)).
query(true_val(tactics_reputation, unk_tactics_reputation)).

0.82::acc(s18, evo_reputation).
% @attr evo_reputation
% @type categorical
% @canonical false
% @original_name evo reputation
% @values large_us_retailer=Large_US_retailer_price_match unk_evo_reputation=Unknown
% @importance 0.9
0.82::true_val(evo_reputation, large_us_retailer); 0.18::true_val(evo_reputation, unk_evo_reputation).
measured(s18, evo_reputation, large_us_retailer).
all_consistent(evo_reputation) :- (indep(s18), consistent(s18, evo_reputation) ; \+indep(s18)).
evidence(all_consistent(evo_reputation)).
query(true_val(evo_reputation, large_us_retailer)).
query(true_val(evo_reputation, unk_evo_reputation)).

0.72::acc(s29, blauer_reputation).
% @attr blauer_reputation
% @type categorical
% @canonical false
% @original_name Blauer Board Shop reputation
% @values specialty_shop=Specialty_snowboard_shop_early_releases unk_blauer_reputation=Unknown
% @importance 0.5
0.72::true_val(blauer_reputation, specialty_shop); 0.28::true_val(blauer_reputation, unk_blauer_reputation).
measured(s29, blauer_reputation, specialty_shop).
all_consistent(blauer_reputation) :- consistent(s29, blauer_reputation).
evidence(all_consistent(blauer_reputation)).
query(true_val(blauer_reputation, specialty_shop)).
query(true_val(blauer_reputation, unk_blauer_reputation)).

0.78::acc(s25, zumiez_reputation).
% @attr zumiez_reputation
% @type categorical
% @canonical false
% @original_name Zumiez reputation
% @values major_us_chain=Major_US_youth_action_sports_chain unk_zumiez_reputation=Unknown
% @importance 0.65
0.78::true_val(zumiez_reputation, major_us_chain); 0.22::true_val(zumiez_reputation, unk_zumiez_reputation).
measured(s25, zumiez_reputation, major_us_chain).
all_consistent(zumiez_reputation) :- (indep(s25), consistent(s25, zumiez_reputation) ; \+indep(s25)).
evidence(all_consistent(zumiez_reputation)).
query(true_val(zumiez_reputation, major_us_chain)).
query(true_val(zumiez_reputation, unk_zumiez_reputation)).

0.95::acc(s2, available_sizes).
0.85::acc(s30, available_sizes).
0.90::acc(s_merchant, available_sizes).
% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values five_sizes=148_151_154_157_157W two_sizes_merchant=154_157
% @importance 0.92
0.80::true_val(available_sizes, five_sizes); 0.20::true_val(available_sizes, two_sizes_merchant).
measured(s2, available_sizes, five_sizes).
measured(s30, available_sizes, five_sizes).
measured(s_merchant, available_sizes, two_sizes_merchant).
all_consistent(available_sizes) :- consistent(s2, available_sizes), consistent(s30, available_sizes), (indep(s_merchant), consistent(s_merchant, available_sizes) ; \+indep(s_merchant)).
evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, five_sizes)).
query(true_val(available_sizes, two_sizes_merchant)).

0.95::acc(s2, contact_length_size_148).
% @attr contact_length_size_148
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size
% @values v110=110.0
% @importance 1.0
0.95::true_val(contact_length_size_148, v110); 0.05::true_val(contact_length_size_148, unk_contact_length_size_148).
measured(s2, contact_length_size_148, v110).
all_consistent(contact_length_size_148) :- consistent(s2, contact_length_size_148).
evidence(all_consistent(contact_length_size_148)).
query(true_val(contact_length_size_148, v110)).
query(true_val(contact_length_size_148, unk_contact_length_size_148)).

0.95::acc(s2, contact_length_size_151).
% @attr contact_length_size_151
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size
% @values v111=111.0
% @importance 1.0
0.95::true_val(contact_length_size_151, v111); 0.05::true_val(contact_length_size_151, unk_contact_length_size_151).
measured(s2, contact_length_size_151, v111).
all_consistent(contact_length_size_151) :- consistent(s2, contact_length_size_151).
evidence(all_consistent(contact_length_size_151)).
query(true_val(contact_length_size_151, v111)).
query(true_val(contact_length_size_151, unk_contact_length_size_151)).

0.95::acc(s2, contact_length_size_154).
% @attr contact_length_size_154
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size
% @values v113=113.0
% @importance 1.0
0.95::true_val(contact_length_size_154, v113); 0.05::true_val(contact_length_size_154, unk_contact_length_size_154).
measured(s2, contact_length_size_154, v113).
all_consistent(contact_length_size_154) :- consistent(s2, contact_length_size_154).
evidence(all_consistent(contact_length_size_154)).
query(true_val(contact_length_size_154, v113)).
query(true_val(contact_length_size_154, unk_contact_length_size_154)).

0.95::acc(s2, contact_length_size).
% @attr contact_length_size
% @type numeric
% @unit cm
% @canonical true
% @original_name contact_length_size
% @values v115=115.0
% @importance 1.0
0.95::true_val(contact_length_size, v115); 0.05::true_val(contact_length_size, unk_contact_length_size).
measured(s2, contact_length_size, v115).
all_consistent(contact_length_size) :- consistent(s2, contact_length_size).
evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v115)).
query(true_val(contact_length_size, unk_contact_length_size)).

0.95::acc(s2, contact_length_size_157w).
% @attr contact_length_size_157w
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size
% @values v115w=115.0
% @importance 1.0
0.95::true_val(contact_length_size_157w, v115w); 0.05::true_val(contact_length_size_157w, unk_contact_length_size_157w).
measured(s2, contact_length_size_157w, v115w).
all_consistent(contact_length_size_157w) :- consistent(s2, contact_length_size_157w).
evidence(all_consistent(contact_length_size_157w)).
query(true_val(contact_length_size_157w, v115w)).
query(true_val(contact_length_size_157w, unk_contact_length_size_157w)).

0.95::acc(s2, sidecut_radius_size_148).
% @attr sidecut_radius_size_148
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v8_0=8.0
% @importance 1.0
0.95::true_val(sidecut_radius_size_148, v8_0); 0.05::true_val(sidecut_radius_size_148, unk_sidecut_radius_size_148).
measured(s2, sidecut_radius_size_148, v8_0).
all_consistent(sidecut_radius_size_148) :- consistent(s2, sidecut_radius_size_148).
evidence(all_consistent(sidecut_radius_size_148)).
query(true_val(sidecut_radius_size_148, v8_0)).
query(true_val(sidecut_radius_size_148, unk_sidecut_radius_size_148)).

0.95::acc(s2, sidecut_radius_size_151).
% @attr sidecut_radius_size_151
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v8_1=8.1
% @importance 1.0
0.95::true_val(sidecut_radius_size_151, v8_1); 0.05::true_val(sidecut_radius_size_151, unk_sidecut_radius_size_151).
measured(s2, sidecut_radius_size_151, v8_1).
all_consistent(sidecut_radius_size_151) :- consistent(s2, sidecut_radius_size_151).
evidence(all_consistent(sidecut_radius_size_151)).
query(true_val(sidecut_radius_size_151, v8_1)).
query(true_val(sidecut_radius_size_151, unk_sidecut_radius_size_151)).

0.95::acc(s2, sidecut_radius_size_154).
% @attr sidecut_radius_size_154
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v8_2=8.2
% @importance 1.0
0.95::true_val(sidecut_radius_size_154, v8_2); 0.05::true_val(sidecut_radius_size_154, unk_sidecut_radius_size_154).
measured(s2, sidecut_radius_size_154, v8_2).
all_consistent(sidecut_radius_size_154) :- consistent(s2, sidecut_radius_size_154).
evidence(all_consistent(sidecut_radius_size_154)).
query(true_val(sidecut_radius_size_154, v8_2)).
query(true_val(sidecut_radius_size_154, unk_sidecut_radius_size_154)).

0.95::acc(s2, sidecut_radius_size).
% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size
% @values v8_2sr=8.2
% @importance 1.0
0.95::true_val(sidecut_radius_size, v8_2sr); 0.05::true_val(sidecut_radius_size, unk_sidecut_radius_size).
measured(s2, sidecut_radius_size, v8_2sr).
all_consistent(sidecut_radius_size) :- consistent(s2, sidecut_radius_size).
evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v8_2sr)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

0.95::acc(s2, sidecut_radius_size_157w).
% @attr sidecut_radius_size_157w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v8_2w=8.2
% @importance 1.0
0.95::true_val(sidecut_radius_size_157w, v8_2w); 0.05::true_val(sidecut_radius_size_157w, unk_sidecut_radius_size_157w).
measured(s2, sidecut_radius_size_157w, v8_2w).
all_consistent(sidecut_radius_size_157w) :- consistent(s2, sidecut_radius_size_157w).
evidence(all_consistent(sidecut_radius_size_157w)).
query(true_val(sidecut_radius_size_157w, v8_2w)).
query(true_val(sidecut_radius_size_157w, unk_sidecut_radius_size_157w)).

0.95::acc(s2, tip_tail_width_size_148).
% @attr tip_tail_width_size_148
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size
% @values v28_8=28.8
% @importance 1.0
0.95::true_val(tip_tail_width_size_148, v28_8); 0.05::true_val(tip_tail_width_size_148, unk_tip_tail_width_size_148).
measured(s2, tip_tail_width_size_148, v28_8).
all_consistent(tip_tail_width_size_148) :- consistent(s2, tip_tail_width_size_148).
evidence(all_consistent(tip_tail_width_size_148)).
query(true_val(tip_tail_width_size_148, v28_8)).
query(true_val(tip_tail_width_size_148, unk_tip_tail_width_size_148)).

0.95::acc(s2, tip_tail_width_size_151).
% @attr tip_tail_width_size_151
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size
% @values v29_0=29.0
% @importance 1.0
0.95::true_val(tip_tail_width_size_151, v29_0); 0.05::true_val(tip_tail_width_size_151, unk_tip_tail_width_size_151).
measured(s2, tip_tail_width_size_151, v29_0).
all_consistent(tip_tail_width_size_151) :- consistent(s2, tip_tail_width_size_151).
evidence(all_consistent(tip_tail_width_size_151)).
query(true_val(tip_tail_width_size_151, v29_0)).
query(true_val(tip_tail_width_size_151, unk_tip_tail_width_size_151)).

0.95::acc(s2, tip_tail_width_size_154).
% @attr tip_tail_width_size_154
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size
% @values v29_3=29.3
% @importance 1.0
0.95::true_val(tip_tail_width_size_154, v29_3); 0.05::true_val(tip_tail_width_size_154, unk_tip_tail_width_size_154).
measured(s2, tip_tail_width_size_154, v29_3).
all_consistent(tip_tail_width_size_154) :- consistent(s2, tip_tail_width_size_154).
evidence(all_consistent(tip_tail_width_size_154)).
query(true_val(tip_tail_width_size_154, v29_3)).
query(true_val(tip_tail_width_size_154, unk_tip_tail_width_size_154)).

0.95::acc(s2, tip_tail_width_size).
% @attr tip_tail_width_size
% @type numeric
% @unit cm
% @canonical true
% @original_name tip_tail_width_size
% @values v29_5=29.5
% @importance 1.0
0.95::true_val(tip_tail_width_size, v29_5); 0.05::true_val(tip_tail_width_size, unk_tip_tail_width_size).
measured(s2, tip_tail_width_size, v29_5).
all_consistent(tip_tail_width_size) :- consistent(s2, tip_tail_width_size).
evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v29_5)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

0.95::acc(s2, tip_tail_width_size_157w).
% @attr tip_tail_width_size_157w
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size
% @values v30_7=30.7
% @importance 1.0
0.95::true_val(tip_tail_width_size_157w, v30_7); 0.05::true_val(tip_tail_width_size_157w, unk_tip_tail_width_size_157w).
measured(s2, tip_tail_width_size_157w, v30_7).
all_consistent(tip_tail_width_size_157w) :- consistent(s2, tip_tail_width_size_157w).
evidence(all_consistent(tip_tail_width_size_157w)).
query(true_val(tip_tail_width_size_157w, v30_7)).
query(true_val(tip_tail_width_size_157w, unk_tip_tail_width_size_157w)).

0.95::acc(s2, waist_width_148).
% @attr waist_width_148
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 148cm
% @values v25_0=25.0
% @importance 1.0
0.95::true_val(waist_width_148, v25_0); 0.05::true_val(waist_width_148, unk_waist_width_148).
measured(s2, waist_width_148, v25_0).
all_consistent(waist_width_148) :- consistent(s2, waist_width_148).
evidence(all_consistent(waist_width_148)).
query(true_val(waist_width_148, v25_0)).
query(true_val(waist_width_148, unk_waist_width_148)).

0.95::acc(s2, waist_width_151).
% @attr waist_width_151
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 151cm
% @values v25_1=25.1
% @importance 1.0
0.95::true_val(waist_width_151, v25_1); 0.05::true_val(waist_width_151, unk_waist_width_151).
measured(s2, waist_width_151, v25_1).
all_consistent(waist_width_151) :- consistent(s2, waist_width_151).
evidence(all_consistent(waist_width_151)).
query(true_val(waist_width_151, v25_1)).
query(true_val(waist_width_151, unk_waist_width_151)).

0.95::acc(s2, waist_width_154).
% @attr waist_width_154
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 154cm
% @values v25_3=25.3
% @importance 1.0
0.95::true_val(waist_width_154, v25_3); 0.05::true_val(waist_width_154, unk_waist_width_154).
measured(s2, waist_width_154, v25_3).
all_consistent(waist_width_154) :- consistent(s2, waist_width_154).
evidence(all_consistent(waist_width_154)).
query(true_val(waist_width_154, v25_3)).
query(true_val(waist_width_154, unk_waist_width_154)).

0.95::acc(s2, waist_width_157).
% @attr waist_width_157
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 157cm
% @values v25_3w=25.3
% @importance 1.0
0.95::true_val(waist_width_157, v25_3w); 0.05::true_val(waist_width_157, unk_waist_width_157).
measured(s2, waist_width_157, v25_3w).
all_consistent(waist_width_157) :- consistent(s2, waist_width_157).
evidence(all_consistent(waist_width_157)).
query(true_val(waist_width_157, v25_3w)).
query(true_val(waist_width_157, unk_waist_width_157)).

0.95::acc(s2, waist_width_157w).
% @attr waist_width_157w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 157W
% @values v26_5=26.5
% @importance 1.0
0.95::true_val(waist_width_157w, v26_5); 0.05::true_val(waist_width_157w, unk_waist_width_157w).
measured(s2, waist_width_157w, v26_5).
all_consistent(waist_width_157w) :- consistent(s2, waist_width_157w).
evidence(all_consistent(waist_width_157w)).
query(true_val(waist_width_157w, v26_5)).
query(true_val(waist_width_157w, unk_waist_width_157w)).

0.95::acc(s2, stance_width_range_size_small).
% @attr stance_width_range_size_small
% @type categorical
% @unit inches
% @canonical false
% @original_name stance_width_range_size
% @values v19_25_to_24_0=19.25_to_24.0_inches unk_stance_width_range_size_small=Unknown
% @importance 1.0
0.95::true_val(stance_width_range_size_small, v19_25_to_24_0); 0.05::true_val(stance_width_range_size_small, unk_stance_width_range_size_small).
measured(s2, stance_width_range_size_small, v19_25_to_24_0).
all_consistent(stance_width_range_size_small) :- consistent(s2, stance_width_range_size_small).
evidence(all_consistent(stance_width_range_size_small)).
query(true_val(stance_width_range_size_small, v19_25_to_24_0)).
query(true_val(stance_width_range_size_small, unk_stance_width_range_size_small)).

0.95::acc(s2, stance_width_range_size).
% @attr stance_width_range_size
% @type categorical
% @unit inches
% @canonical true
% @original_name stance_width_range_size
% @values v20_25_to_25_0=20.25_to_25.0_inches unk_stance_width_range_size=Unknown
% @importance 1.0
0.95::true_val(stance_width_range_size, v20_25_to_25_0); 0.05::true_val(stance_width_range_size, unk_stance_width_range_size).
measured(s2, stance_width_range_size, v20_25_to_25_0).
all_consistent(stance_width_range_size) :- consistent(s2, stance_width_range_size).
evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v20_25_to_25_0)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

0.95::acc(s2, stance_width_range_size_small_cm).
% @attr stance_width_range_size_small_cm
% @type categorical
% @unit cm
% @canonical false
% @original_name stance_width_range_size
% @values v49_to_61=49_to_61cm unk_stance_width_range_size_small_cm=Unknown
% @importance 1.0
0.95::true_val(stance_width_range_size_small_cm, v49_to_61); 0.05::true_val(stance_width_range_size_small_cm, unk_stance_width_range_size_small_cm).
measured(s2, stance_width_range_size_small_cm, v49_to_61).
all_consistent(stance_width_range_size_small_cm) :- consistent(s2, stance_width_range_size_small_cm).
evidence(all_consistent(stance_width_range_size_small_cm)).
query(true_val(stance_width_range_size_small_cm, v49_to_61)).
query(true_val(stance_width_range_size_small_cm, unk_stance_width_range_size_small_cm)).

0.95::acc(s2, stance_width_range_size_cm).
% @attr stance_width_range_size_cm
% @type categorical
% @unit cm
% @canonical false
% @original_name stance_width_range_size
% @values v51_5_to_63_5=51.5_to_63.5cm unk_stance_width_range_size_cm=Unknown
% @importance 1.0
0.95::true_val(stance_width_range_size_cm, v51_5_to_63_5); 0.05::true_val(stance_width_range_size_cm, unk_stance_width_range_size_cm).
measured(s2, stance_width_range_size_cm, v51_5_to_63_5).
all_consistent(stance_width_range_size_cm) :- consistent(s2, stance_width_range_size_cm).
evidence(all_consistent(stance_width_range_size_cm)).
query(true_val(stance_width_range_size_cm, v51_5_to_63_5)).
query(true_val(stance_width_range_size_cm, unk_stance_width_range_size_cm)).

0.95::acc(s2, setback).
% @attr setback
% @type numeric
% @unit inches
% @canonical true
% @original_name setback
% @values v0=0.0
% @importance 1.0
0.95::true_val(setback, v0); 0.05::true_val(setback, unk_setback).
measured(s2, setback, v0).
all_consistent(setback) :- consistent(s2, setback).
evidence(all_consistent(setback)).
query(true_val(setback, v0)).
query(true_val(setback, unk_setback)).

0.95::acc(s2, recommended_weight_range_size_148).
% @attr recommended_weight_range_size_148
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values w85_plus_lbs=85_plus_lbs_40_plus_kg unk_recommended_weight_range_size_148=Unknown
% @importance 1.0
0.95::true_val(recommended_weight_range_size_148, w85_plus_lbs); 0.05::true_val(recommended_weight_range_size_148, unk_recommended_weight_range_size_148).
measured(s2, recommended_weight_range_size_148, w85_plus_lbs).
all_consistent(recommended_weight_range_size_148) :- consistent(s2, recommended_weight_range_size_148).
evidence(all_consistent(recommended_weight_range_size_148)).
query(true_val(recommended_weight_range_size_148, w85_plus_lbs)).
query(true_val(recommended_weight_range_size_148, unk_recommended_weight_range_size_148)).

0.95::acc(s2, recommended_weight_range_size_151).
% @attr recommended_weight_range_size_151
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values w95_plus_lbs=95_plus_lbs_45_plus_kg unk_recommended_weight_range_size_151=Unknown
% @importance 1.0
0.95::true_val(recommended_weight_range_size_151, w95_plus_lbs); 0.05::true_val(recommended_weight_range_size_151, unk_recommended_weight_range_size_151).
measured(s2, recommended_weight_range_size_151, w95_plus_lbs).
all_consistent(recommended_weight_range_size_151) :- consistent(s2, recommended_weight_range_size_151).
evidence(all_consistent(recommended_weight_range_size_151)).
query(true_val(recommended_weight_range_size_151, w95_plus_lbs)).
query(true_val(recommended_weight_range_size_151, unk_recommended_weight_range_size_151)).

0.95::acc(s2, recommended_weight_range_size_154).
% @attr recommended_weight_range_size_154
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values w110_plus_lbs=110_plus_lbs_50_plus_kg unk_recommended_weight_range_size_154=Unknown
% @importance 1.0
0.95::true_val(recommended_weight_range_size_154, w110_plus_lbs); 0.05::true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154).
measured(s2, recommended_weight_range_size_154, w110_plus_lbs).
all_consistent(recommended_weight_range_size_154) :- consistent(s2, recommended_weight_range_size_154).
evidence(all_consistent(recommended_weight_range_size_154)).
query(true_val(recommended_weight_range_size_154, w110_plus_lbs)).
query(true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154)).

0.95::acc(s2, recommended_weight_range_size).
% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size
% @values w120_plus_lbs=120_plus_lbs_55_plus_kg unk_recommended_weight_range_size=Unknown
% @importance 1.0
0.95::true_val(recommended_weight_range_size, w120_plus_lbs); 0.05::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).
measured(s2, recommended_weight_range_size, w120_plus_lbs).
all_consistent(recommended_weight_range_size) :- consistent(s2, recommended_weight_range_size).
evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w120_plus_lbs)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

0.95::acc(s2, recommended_weight_range_size_157w).
% @attr recommended_weight_range_size_157w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values w125_plus_lbs=125_plus_lbs_60_plus_kg unk_recommended_weight_range_size_157w=Unknown
% @importance 1.0
0.95::true_val(recommended_weight_range_size_157w, w125_plus_lbs); 0.05::true_val(recommended_weight_range_size_157w, unk_recommended_weight_range_size_157w).
measured(s2, recommended_weight_range_size_157w, w125_plus_lbs).
all_consistent(recommended_weight_range_size_157w) :- consistent(s2, recommended_weight_range_size_157w).
evidence(all_consistent(recommended_weight_range_size_157w)).
query(true_val(recommended_weight_range_size_157w, w125_plus_lbs)).
query(true_val(recommended_weight_range_size_157w, unk_recommended_weight_range_size_157w)).

0.82::acc(s14, width_options).
% @attr width_options
% @type categorical
% @canonical true
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 0.9
0.88::true_val(width_options, standard_and_wide); 0.12::true_val(width_options, unk_width_options).
measured(s14, width_options, standard_and_wide).
all_consistent(width_options) :- (indep(s14), consistent(s14, width_options) ; \+indep(s14)).
evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

0.82::acc(s14, suggested_boot_size_151).
% @attr suggested_boot_size_151
% @type categorical
% @canonical false
% @original_name Suggested boot size 151
% @values us10_under=US_10_and_under unk_suggested_boot_size_151=Unknown
% @importance 0.9
0.85::true_val(suggested_boot_size_151, us10_under); 0.15::true_val(suggested_boot_size_151, unk_suggested_boot_size_151).
measured(s14, suggested_boot_size_151, us10_under).
all_consistent(suggested_boot_size_151) :- (indep(s14), consistent(s14, suggested_boot_size_151) ; \+indep(s14)).
evidence(all_consistent(suggested_boot_size_151)).
query(true_val(suggested_boot_size_151, us10_under)).
query(true_val(suggested_boot_size_151, unk_suggested_boot_size_151)).

0.82::acc(s14, suggested_boot_size_154).
% @attr suggested_boot_size_154
% @type categorical
% @canonical false
% @original_name Suggested boot size 154
% @values us10_5_under=US_10_5_and_under unk_suggested_boot_size_154=Unknown
% @importance 0.9
0.85::true_val(suggested_boot_size_154, us10_5_under); 0.15::true_val(suggested_boot_size_154, unk_suggested_boot_size_154).
measured(s14, suggested_boot_size_154, us10_5_under).
all_consistent(suggested_boot_size_154) :- (indep(s14), consistent(s14, suggested_boot_size_154) ; \+indep(s14)).
evidence(all_consistent(suggested_boot_size_154)).
query(true_val(suggested_boot_size_154, us10_5_under)).
query(true_val(suggested_boot_size_154, unk_suggested_boot_size_154)).

0.82::acc(s14, suggested_boot_size_157w).
% @attr suggested_boot_size_157w
% @type categorical
% @canonical false
% @original_name Suggested boot size 157W
% @values us13_under=US_13_and_under unk_suggested_boot_size_157w=Unknown
% @importance 0.9
0.85::true_val(suggested_boot_size_157w, us13_under); 0.15::true_val(suggested_boot_size_157w, unk_suggested_boot_size_157w).
measured(s14, suggested_boot_size_157w, us13_under).
all_consistent(suggested_boot_size_157w) :- (indep(s14), consistent(s14, suggested_boot_size_157w) ; \+indep(s14)).
evidence(all_consistent(suggested_boot_size_157w)).
query(true_val(suggested_boot_size_157w, us13_under)).
query(true_val(suggested_boot_size_157w, unk_suggested_boot_size_157w)).

0.90::acc(s_merchant, mounting_pattern).
% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_inserts unk_mounting_pattern=Unknown
% @importance 0.85
0.90::true_val(mounting_pattern, inserts_2x4); 0.10::true_val(mounting_pattern, unk_mounting_pattern).
measured(s_merchant, mounting_pattern, inserts_2x4).
all_consistent(mounting_pattern) :- (indep(s_merchant), consistent(s_merchant, mounting_pattern) ; \+indep(s_merchant)).
evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

0.93::acc(s2, flex_rating_10_manufacturer_148).
% @attr flex_rating_10_manufacturer_148
% @type numeric
% @unit /10
% @canonical false
% @original_name flex_rating_10_manufacturer
% @values v6_5=6.5
% @importance 1.0
0.93::true_val(flex_rating_10_manufacturer_148, v6_5); 0.07::true_val(flex_rating_10_manufacturer_148, unk_flex_rating_10_manufacturer_148).
measured(s2, flex_rating_10_manufacturer_148, v6_5).
all_consistent(flex_rating_10_manufacturer_148) :- consistent(s2, flex_rating_10_manufacturer_148).
evidence(all_consistent(flex_rating_10_manufacturer_148)).
query(true_val(flex_rating_10_manufacturer_148, v6_5)).
query(true_val(flex_rating_10_manufacturer_148, unk_flex_rating_10_manufacturer_148)).

0.93::acc(s2, flex_rating_10_manufacturer).
% @attr flex_rating_10_manufacturer
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10_manufacturer
% @values v7=7.0
% @importance 1.0
0.93::true_val(flex_rating_10_manufacturer, v7); 0.07::true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer).
measured(s2, flex_rating_10_manufacturer, v7).
all_consistent(flex_rating_10_manufacturer) :- consistent(s2, flex_rating_10_manufacturer).
evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, v7)).
query(true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer)).

0.75::acc(s24, flex_feel).
0.88::acc(s30, flex_feel).
0.85::acc(s17, flex_feel).
% @attr flex_feel
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_feel
% @values medium_firm=Medium_Firm v6_feel=6.0 v5_5=5.5
% @importance 0.875
0.25::true_val(flex_feel, medium_firm); 0.40::true_val(flex_feel, v6_feel); 0.35::true_val(flex_feel, v5_5).
measured(s24, flex_feel, medium_firm).
measured(s30, flex_feel, v6_feel).
measured(s17, flex_feel, v5_5).
all_consistent(flex_feel) :- (indep(s24), consistent(s24, flex_feel) ; \+indep(s24)), consistent(s30, flex_feel), consistent(s17, flex_feel).
evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium_firm)).
query(true_val(flex_feel, v6_feel)).
query(true_val(flex_feel, v5_5)).

0.85::acc(s31, flex_rating_10_evo).
0.78::acc(s32, flex_rating_10_evo).
% @attr flex_rating_10_evo
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10_evo
% @values v7_evo=7.0 unk_flex_rating_10_evo=Unknown
% @importance 0.675
0.92::true_val(flex_rating_10_evo, v7_evo); 0.08::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).
measured(s31, flex_rating_10_evo, v7_evo).
measured(s32, flex_rating_10_evo, v7_evo).
all_consistent(flex_rating_10_evo) :- consistent(s31, flex_rating_10_evo), (indep(s32), consistent(s32, flex_rating_10_evo) ; \+indep(s32)).
evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, v7_evo)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

0.85::acc(s31, flex_direction).
% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values symmetrical=Symmetrical_true_twin unk_flex_direction=Unknown
% @importance 0.85
0.88::true_val(flex_direction, symmetrical); 0.12::true_val(flex_direction, unk_flex_direction).
measured(s31, flex_direction, symmetrical).
all_consistent(flex_direction) :- consistent(s31, flex_direction).
evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, symmetrical)).
query(true_val(flex_direction, unk_flex_direction)).

0.95::acc(s2, camber_type).
0.88::acc(s30, camber_type).
0.78::acc(s24, camber_type).
0.85::acc(s33, camber_type).
0.50::acc(s27, camber_type).
0.40::acc(s34, camber_type).
0.50::acc(s18, camber_type).
% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values traditional_camber=Traditional_Camber c3_camber=C3_Camber
% @importance 0.82
0.82::true_val(camber_type, traditional_camber); 0.18::true_val(camber_type, c3_camber).
measured(s2, camber_type, traditional_camber).
measured(s30, camber_type, traditional_camber).
measured(s24, camber_type, traditional_camber).
measured(s33, camber_type, traditional_camber).
measured(s27, camber_type, c3_camber).
measured(s34, camber_type, c3_camber).
measured(s18, camber_type, c3_camber).
all_consistent(camber_type) :- consistent(s2, camber_type), consistent(s30, camber_type), (indep(s24), consistent(s24, camber_type) ; \+indep(s24)), consistent(s33, camber_type), (indep(s27), consistent(s27, camber_type) ; \+indep(s27)), (indep(s34), consistent(s34, camber_type) ; \+indep(s34)), (indep(s18), consistent(s18, camber_type) ; \+indep(s18)).
evidence(all_consistent(camber_type)).
query(true_val(camber_type, traditional_camber)).
query(true_val(camber_type, c3_camber)).

0.85::acc(s30, camber_description).
0.82::acc(s33, camber_description).
% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values upgraded_from_c3=Upgraded_from_C3_to_traditional_for_2025 unk_camber_description=Unknown
% @importance 0.875
0.90::true_val(camber_description, upgraded_from_c3); 0.10::true_val(camber_description, unk_camber_description).
measured(s30, camber_description, upgraded_from_c3).
measured(s33, camber_description, upgraded_from_c3).
all_consistent(camber_description) :- consistent(s30, camber_description), consistent(s33, camber_description).
evidence(all_consistent(camber_description)).
query(true_val(camber_description, upgraded_from_c3)).
query(true_val(camber_description, unk_camber_description)).

0.90::acc(s35, camber_height_mm).
% @attr camber_height_mm
% @type numeric
% @unit mm
% @canonical true
% @original_name camber_height_mm
% @values v11=11.0 unk_camber_height_mm=Unknown
% @importance 0.85
0.82::true_val(camber_height_mm, v11); 0.18::true_val(camber_height_mm, unk_camber_height_mm).
measured(s35, camber_height_mm, v11).
all_consistent(camber_height_mm) :- consistent(s35, camber_height_mm).
evidence(all_consistent(camber_height_mm)).
query(true_val(camber_height_mm, v11)).
query(true_val(camber_height_mm, unk_camber_height_mm)).

0.95::acc(s2, shape).
0.82::acc(s14, shape).
% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values true_twin=True_Twin unk_shape=Unknown
% @importance 0.95
0.95::true_val(shape, true_twin); 0.05::true_val(shape, unk_shape).
measured(s2, shape, true_twin).
measured(s14, shape, true_twin).
all_consistent(shape) :- consistent(s2, shape), (indep(s14), consistent(s14, shape) ; \+indep(s14)).
evidence(all_consistent(shape)).
query(true_val(shape, true_twin)).
query(true_val(shape, unk_shape)).

0.93::acc(s2, shape_outline).
0.85::acc(s31, shape_outline).
% @attr shape_outline
% @type categorical
% @canonical false
% @original_name shape
% @values twin_pill=Twin_pill_skateboard_style unk_shape_outline=Unknown
% @importance 0.925
0.93::true_val(shape_outline, twin_pill); 0.07::true_val(shape_outline, unk_shape_outline).
measured(s2, shape_outline, twin_pill).
measured(s31, shape_outline, twin_pill).
all_consistent(shape_outline) :- consistent(s2, shape_outline), consistent(s31, shape_outline).
evidence(all_consistent(shape_outline)).
query(true_val(shape_outline, twin_pill)).
query(true_val(shape_outline, unk_shape_outline)).

0.82::acc(s3, nose_tail_shape).
% @attr nose_tail_shape
% @type categorical
% @canonical false
% @original_name Nose/tail shape
% @values more_rounded=More_rounded_less_blunted_than_Box_Knife unk_nose_tail_shape=Unknown
% @importance 0.7
0.80::true_val(nose_tail_shape, more_rounded); 0.20::true_val(nose_tail_shape, unk_nose_tail_shape).
measured(s3, nose_tail_shape, more_rounded).
all_consistent(nose_tail_shape) :- consistent(s3, nose_tail_shape).
evidence(all_consistent(nose_tail_shape)).
query(true_val(nose_tail_shape, more_rounded)).
query(true_val(nose_tail_shape, unk_nose_tail_shape)).

0.93::acc(s2, design_philosophy).
% @attr design_philosophy
% @type categorical
% @canonical false
% @original_name Design philosophy
% @values cambered_freestyle_jib=Cambered_freestyle_jib_resort_friendly unk_design_philosophy=Unknown
% @importance 1.0
0.93::true_val(design_philosophy, cambered_freestyle_jib); 0.07::true_val(design_philosophy, unk_design_philosophy).
measured(s2, design_philosophy, cambered_freestyle_jib).
all_consistent(design_philosophy) :- consistent(s2, design_philosophy).
evidence(all_consistent(design_philosophy)).
query(true_val(design_philosophy, cambered_freestyle_jib)).
query(true_val(design_philosophy, unk_design_philosophy)).

0.93::acc(s14, core_material).
0.95::acc(s2, core_material).
% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values op_plus=Original_Power_Plus unk_core_material=Unknown
% @importance 0.95
0.95::true_val(core_material, op_plus); 0.05::true_val(core_material, unk_core_material).
measured(s14, core_material, op_plus).
measured(s2, core_material, op_plus).
all_consistent(core_material) :- consistent(s2, core_material), (indep(s14), consistent(s14, core_material) ; \+indep(s14)).
evidence(all_consistent(core_material)).
query(true_val(core_material, op_plus)).
query(true_val(core_material, unk_core_material)).

0.95::acc(s2, core_material_blend_ratio).
0.82::acc(s14, core_material_blend_ratio).
0.78::acc(s24, core_material_blend_ratio).
0.55::acc(s18, core_material_blend_ratio).
% @attr core_material_blend_ratio
% @type categorical
% @canonical true
% @original_name core_material_blend_ratio
% @values aspen75_paulownia25=75pct_Aspen_25pct_Paulownia paulownia75_aspen25=75pct_Paulownia_25pct_Aspen
% @importance 0.93
0.88::true_val(core_material_blend_ratio, aspen75_paulownia25); 0.12::true_val(core_material_blend_ratio, paulownia75_aspen25).
measured(s2, core_material_blend_ratio, aspen75_paulownia25).
measured(s14, core_material_blend_ratio, aspen75_paulownia25).
measured(s24, core_material_blend_ratio, aspen75_paulownia25).
measured(s18, core_material_blend_ratio, paulownia75_aspen25).
all_consistent(core_material_blend_ratio) :- consistent(s2, core_material_blend_ratio), (indep(s14), consistent(s14, core_material_blend_ratio) ; \+indep(s14)), (indep(s24), consistent(s24, core_material_blend_ratio) ; \+indep(s24)), (indep(s18), consistent(s18, core_material_blend_ratio) ; \+indep(s18)).
evidence(all_consistent(core_material_blend_ratio)).
query(true_val(core_material_blend_ratio, aspen75_paulownia25)).
query(true_val(core_material_blend_ratio, paulownia75_aspen25)).

0.85::acc(s14, laminate).
% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values triax_biax_fiberglass=Tri_axial_and_Bi_axial_fiberglass unk_laminate=Unknown
% @importance 0.9
0.88::true_val(laminate, triax_biax_fiberglass); 0.12::true_val(laminate, unk_laminate).
measured(s14, laminate, triax_biax_fiberglass).
all_consistent(laminate) :- (indep(s14), consistent(s14, laminate) ; \+indep(s14)).
evidence(all_consistent(laminate)).
query(true_val(laminate, triax_biax_fiberglass)).
query(true_val(laminate, unk_laminate)).

0.85::acc(s14, laminate_triaxial).
% @attr laminate_triaxial
% @type categorical
% @canonical false
% @original_name laminate
% @values triax_snap_damp=3way_fiber_increases_snap_decreases_vibrations unk_laminate_triaxial=Unknown
% @importance 0.9
0.85::true_val(laminate_triaxial, triax_snap_damp); 0.15::true_val(laminate_triaxial, unk_laminate_triaxial).
measured(s14, laminate_triaxial, triax_snap_damp).
all_consistent(laminate_triaxial) :- (indep(s14), consistent(s14, laminate_triaxial) ; \+indep(s14)).
evidence(all_consistent(laminate_triaxial)).
query(true_val(laminate_triaxial, triax_snap_damp)).
query(true_val(laminate_triaxial, unk_laminate_triaxial)).

0.85::acc(s14, laminate_biaxial).
% @attr laminate_biaxial
% @type categorical
% @canonical false
% @original_name laminate
% @values biax_snap_chatter=2way_fiber_max_snap_decreases_chatter unk_laminate_biaxial=Unknown
% @importance 0.9
0.85::true_val(laminate_biaxial, biax_snap_chatter); 0.15::true_val(laminate_biaxial, unk_laminate_biaxial).
measured(s14, laminate_biaxial, biax_snap_chatter).
all_consistent(laminate_biaxial) :- (indep(s14), consistent(s14, laminate_biaxial) ; \+indep(s14)).
evidence(all_consistent(laminate_biaxial)).
query(true_val(laminate_biaxial, biax_snap_chatter)).
query(true_val(laminate_biaxial, unk_laminate_biaxial)).

0.85::acc(s14, base_material).
0.95::acc(s2, base_material).
% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values eco_sublimated_sintered=Eco_Sublimated_Sintered unk_base_material=Unknown
% @importance 0.95
0.95::true_val(base_material, eco_sublimated_sintered); 0.05::true_val(base_material, unk_base_material).
measured(s14, base_material, eco_sublimated_sintered).
measured(s2, base_material, eco_sublimated_sintered).
all_consistent(base_material) :- consistent(s2, base_material), (indep(s14), consistent(s14, base_material) ; \+indep(s14)).
evidence(all_consistent(base_material)).
query(true_val(base_material, eco_sublimated_sintered)).
query(true_val(base_material, unk_base_material)).

0.85::acc(s14, base_material_properties).
% @attr base_material_properties
% @type categorical
% @canonical false
% @original_name base_material
% @values fast_rugged_wax_retention=Fast_rugged_max_wax_retention unk_base_material_properties=Unknown
% @importance 0.9
0.85::true_val(base_material_properties, fast_rugged_wax_retention); 0.15::true_val(base_material_properties, unk_base_material_properties).
measured(s14, base_material_properties, fast_rugged_wax_retention).
all_consistent(base_material_properties) :- (indep(s14), consistent(s14, base_material_properties) ; \+indep(s14)).
evidence(all_consistent(base_material_properties)).
query(true_val(base_material_properties, fast_rugged_wax_retention)).
query(true_val(base_material_properties, unk_base_material_properties)).

0.85::acc(s14, topsheet).
% @attr topsheet
% @type categorical
% @canonical true
% @original_name topsheet
% @values eco_sublimated_poly=Eco_Sublimated_Poly_Top unk_topsheet=Unknown
% @importance 0.9
0.88::true_val(topsheet, eco_sublimated_poly); 0.12::true_val(topsheet, unk_topsheet).
measured(s14, topsheet, eco_sublimated_poly).
all_consistent(topsheet) :- (indep(s14), consistent(s14, topsheet) ; \+indep(s14)).
evidence(all_consistent(topsheet)).
query(true_val(topsheet, eco_sublimated_poly)).
query(true_val(topsheet, unk_topsheet)).

0.78::acc(s24, topsheet_properties).
% @attr topsheet_properties
% @type categorical
% @canonical false
% @original_name topsheet
% @values high_strength_impact=High_strength_impact_resistant_lightweight_UV_resistant unk_topsheet_properties=Unknown
% @importance 0.75
0.80::true_val(topsheet_properties, high_strength_impact); 0.20::true_val(topsheet_properties, unk_topsheet_properties).
measured(s24, topsheet_properties, high_strength_impact).
all_consistent(topsheet_properties) :- (indep(s24), consistent(s24, topsheet_properties) ; \+indep(s24)).
evidence(all_consistent(topsheet_properties)).
query(true_val(topsheet_properties, high_strength_impact)).
query(true_val(topsheet_properties, unk_topsheet_properties)).

0.85::acc(s14, sidewall_material).
% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values birch_internal=Birch_internal_sidewalls_vertical_end_grain unk_sidewall_material=Unknown
% @importance 0.9
0.88::true_val(sidewall_material, birch_internal); 0.12::true_val(sidewall_material, unk_sidewall_material).
measured(s14, sidewall_material, birch_internal).
all_consistent(sidewall_material) :- (indep(s14), consistent(s14, sidewall_material) ; \+indep(s14)).
evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, birch_internal)).
query(true_val(sidewall_material, unk_sidewall_material)).

0.78::acc(s36, sidewall_material_ply).
% @attr sidewall_material_ply
% @type categorical
% @canonical false
% @original_name sidewall_material
% @values six_ply_reinforcement=6_ply_high_impact_sidewall_reinforcement unk_sidewall_material_ply=Unknown
% @importance 0.65
0.78::true_val(sidewall_material_ply, six_ply_reinforcement); 0.22::true_val(sidewall_material_ply, unk_sidewall_material_ply).
measured(s36, sidewall_material_ply, six_ply_reinforcement).
all_consistent(sidewall_material_ply) :- (indep(s36), consistent(s36, sidewall_material_ply) ; \+indep(s36)).
evidence(all_consistent(sidewall_material_ply)).
query(true_val(sidewall_material_ply, six_ply_reinforcement)).
query(true_val(sidewall_material_ply, unk_sidewall_material_ply)).

0.85::acc(s14, sidewall_material_uhmw).
% @attr sidewall_material_uhmw
% @type categorical
% @canonical false
% @original_name sidewall_material
% @values uhmw_sintered=UHMW_Sintered_Sidewalls unk_sidewall_material_uhmw=Unknown
% @importance 0.9
0.85::true_val(sidewall_material_uhmw, uhmw_sintered); 0.15::true_val(sidewall_material_uhmw, unk_sidewall_material_uhmw).
measured(s14, sidewall_material_uhmw, uhmw_sintered).
all_consistent(sidewall_material_uhmw) :- (indep(s14), consistent(s14, sidewall_material_uhmw) ; \+indep(s14)).
evidence(all_consistent(sidewall_material_uhmw)).
query(true_val(sidewall_material_uhmw, uhmw_sintered)).
query(true_val(sidewall_material_uhmw, unk_sidewall_material_uhmw)).

0.85::acc(s14, sidewall_material_sintered_detail).
% @attr sidewall_material_sintered_detail
% @type categorical
% @canonical false
% @original_name sidewall_material
% @values twice_sintered=Twice_as_sintered_increases_durability_response unk_sidewall_material_sintered_detail=Unknown
% @importance 0.9
0.85::true_val(sidewall_material_sintered_detail, twice_sintered); 0.15::true_val(sidewall_material_sintered_detail, unk_sidewall_material_sintered_detail).
measured(s14, sidewall_material_sintered_detail, twice_sintered).
all_consistent(sidewall_material_sintered_detail) :- (indep(s14), consistent(s14, sidewall_material_sintered_detail) ; \+indep(s14)).
evidence(all_consistent(sidewall_material_sintered_detail)).
query(true_val(sidewall_material_sintered_detail, twice_sintered)).
query(true_val(sidewall_material_sintered_detail, unk_sidewall_material_sintered_detail)).

0.85::acc(s14, tip_tail_protection).
% @attr tip_tail_protection
% @type categorical
% @canonical false
% @original_name Tip/tail protection
% @values uhmw_impact_deflection=UHMW_Tip_Tail_Impact_Deflection unk_tip_tail_protection=Unknown
% @importance 0.9
0.88::true_val(tip_tail_protection, uhmw_impact_deflection); 0.12::true_val(tip_tail_protection, unk_tip_tail_protection).
measured(s14, tip_tail_protection, uhmw_impact_deflection).
all_consistent(tip_tail_protection) :- (indep(s14), consistent(s14, tip_tail_protection) ; \+indep(s14)).
evidence(all_consistent(tip_tail_protection)).
query(true_val(tip_tail_protection, uhmw_impact_deflection)).
query(true_val(tip_tail_protection, unk_tip_tail_protection)).

0.78::acc(s36, tip_tail_protection_detail).
% @attr tip_tail_protection_detail
% @type categorical
% @canonical false
% @original_name Tip/tail protection detail
% @values long_molecular_chains=Long_molecular_chains_impact_resistance unk_tip_tail_protection_detail=Unknown
% @importance 0.65
0.78::true_val(tip_tail_protection_detail, long_molecular_chains); 0.22::true_val(tip_tail_protection_detail, unk_tip_tail_protection_detail).
measured(s36, tip_tail_protection_detail, long_molecular_chains).
all_consistent(tip_tail_protection_detail) :- (indep(s36), consistent(s36, tip_tail_protection_detail) ; \+indep(s36)).
evidence(all_consistent(tip_tail_protection_detail)).
query(true_val(tip_tail_protection_detail, long_molecular_chains)).
query(true_val(tip_tail_protection_detail, unk_tip_tail_protection_detail)).

0.95::acc(s2, edge_technology).
0.85::acc(s14, edge_technology).
0.85::acc(s_merchant, edge_technology).
% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values magne_traction=Magne_Traction_serrated_edges_7_serrations unk_edge_technology=Unknown
% @importance 0.92
0.95::true_val(edge_technology, magne_traction); 0.05::true_val(edge_technology, unk_edge_technology).
measured(s2, edge_technology, magne_traction).
measured(s14, edge_technology, magne_traction).
measured(s_merchant, edge_technology, magne_traction).
all_consistent(edge_technology) :- consistent(s2, edge_technology), (indep(s14), consistent(s14, edge_technology) ; \+indep(s14)), (indep(s_merchant), consistent(s_merchant, edge_technology) ; \+indep(s_merchant)).
evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, magne_traction)).
query(true_val(edge_technology, unk_edge_technology)).

0.85::acc(s14, edge_hold_description).
% @attr edge_hold_description
% @type categorical
% @canonical false
% @original_name edge_hold
% @values added_contact_points=Strategic_bumps_added_contact_points_grip unk_edge_hold_description=Unknown
% @importance 0.9
0.85::true_val(edge_hold_description, added_contact_points); 0.15::true_val(edge_hold_description, unk_edge_hold_description).
measured(s14, edge_hold_description, added_contact_points).
all_consistent(edge_hold_description) :- (indep(s14), consistent(s14, edge_hold_description) ; \+indep(s14)).
evidence(all_consistent(edge_hold_description)).
query(true_val(edge_hold_description, added_contact_points)).
query(true_val(edge_hold_description, unk_edge_hold_description)).

0.82::acc(s14, warranty_period_years).
% @attr warranty_period_years
% @type numeric
% @unit years
% @canonical true
% @original_name warranty_period_years
% @values v1=1.0 unk_warranty_period_years=Unknown
% @importance 0.9
0.88::true_val(warranty_period_years, v1); 0.12::true_val(warranty_period_years, unk_warranty_period_years).
measured(s14, warranty_period_years, v1).
all_consistent(warranty_period_years) :- (indep(s14), consistent(s14, warranty_period_years) ; \+indep(s14)).
evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v1)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

0.82::acc(s14, warranty_coverage).
% @attr warranty_coverage
% @type categorical
% @canonical false
% @original_name warranty
% @values structural_defects_only=Structural_defects_only_no_impact_abuse unk_warranty_coverage=Unknown
% @importance 0.9
0.85::true_val(warranty_coverage, structural_defects_only); 0.15::true_val(warranty_coverage, unk_warranty_coverage).
measured(s14, warranty_coverage, structural_defects_only).
all_consistent(warranty_coverage) :- (indep(s14), consistent(s14, warranty_coverage) ; \+indep(s14)).
evidence(all_consistent(warranty_coverage)).
query(true_val(warranty_coverage, structural_defects_only)).
query(true_val(warranty_coverage, unk_warranty_coverage)).

0.93::acc(s2, terrain_suitability_category).
% @attr terrain_suitability_category
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values freestyle_park=Freestyle_Park unk_terrain_suitability_category=Unknown
% @importance 1.0
0.93::true_val(terrain_suitability_category, freestyle_park); 0.07::true_val(terrain_suitability_category, unk_terrain_suitability_category).
measured(s2, terrain_suitability_category, freestyle_park).
all_consistent(terrain_suitability_category) :- consistent(s2, terrain_suitability_category).
evidence(all_consistent(terrain_suitability_category)).
query(true_val(terrain_suitability_category, freestyle_park)).
query(true_val(terrain_suitability_category, unk_terrain_suitability_category)).

0.78::acc(s20, terrain_suitability).
% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values am8_pow6_park10=AllMtn_8_Powder_6_Park_10 unk_terrain_suitability=Unknown
% @importance 0.8
0.80::true_val(terrain_suitability, am8_pow6_park10); 0.20::true_val(terrain_suitability, unk_terrain_suitability).
measured(s20, terrain_suitability, am8_pow6_park10).
all_consistent(terrain_suitability) :- (indep(s20), consistent(s20, terrain_suitability) ; \+indep(s20)).
evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, am8_pow6_park10)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

0.85::acc(s14, terrain_suitability_specific).
% @attr terrain_suitability_specific
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values boxes_rails_jumps_street=Boxes_rails_jumps_street_resort unk_terrain_suitability_specific=Unknown
% @importance 0.9
0.85::true_val(terrain_suitability_specific, boxes_rails_jumps_street); 0.15::true_val(terrain_suitability_specific, unk_terrain_suitability_specific).
measured(s14, terrain_suitability_specific, boxes_rails_jumps_street).
all_consistent(terrain_suitability_specific) :- (indep(s14), consistent(s14, terrain_suitability_specific) ; \+indep(s14)).
evidence(all_consistent(terrain_suitability_specific)).
query(true_val(terrain_suitability_specific, boxes_rails_jumps_street)).
query(true_val(terrain_suitability_specific, unk_terrain_suitability_specific)).

0.88::acc(s30, terrain_suitability_icy).
0.82::acc(s22, terrain_suitability_icy).
% @attr terrain_suitability_icy
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values strong_icy_hardpack=Strong_in_icy_hardpack_East_Coast unk_terrain_suitability_icy=Unknown
% @importance 0.875
0.90::true_val(terrain_suitability_icy, strong_icy_hardpack); 0.10::true_val(terrain_suitability_icy, unk_terrain_suitability_icy).
measured(s30, terrain_suitability_icy, strong_icy_hardpack).
measured(s22, terrain_suitability_icy, strong_icy_hardpack).
all_consistent(terrain_suitability_icy) :- consistent(s30, terrain_suitability_icy), consistent(s22, terrain_suitability_icy).
evidence(all_consistent(terrain_suitability_icy)).
query(true_val(terrain_suitability_icy, strong_icy_hardpack)).
query(true_val(terrain_suitability_icy, unk_terrain_suitability_icy)).

0.85::acc(s_merchant, riding_style).
% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values freestyle_jib_park_street=Freestyle_jib_park_all_terrain_street unk_riding_style=Unknown
% @importance 0.85
0.88::true_val(riding_style, freestyle_jib_park_street); 0.12::true_val(riding_style, unk_riding_style).
measured(s_merchant, riding_style, freestyle_jib_park_street).
all_consistent(riding_style) :- (indep(s_merchant), consistent(s_merchant, riding_style) ; \+indep(s_merchant)).
evidence(all_consistent(riding_style)).
query(true_val(riding_style, freestyle_jib_park_street)).
query(true_val(riding_style, unk_riding_style)).

0.80::acc(s20, rider_level).
0.82::acc(s23, rider_level).
% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate_to_expert=Intermediate_to_Advanced_Expert unk_rider_level=Unknown
% @importance 0.825
0.88::true_val(rider_level, intermediate_to_expert); 0.12::true_val(rider_level, unk_rider_level).
measured(s20, rider_level, intermediate_to_expert).
measured(s23, rider_level, intermediate_to_expert).
all_consistent(rider_level) :- (indep(s20), consistent(s20, rider_level) ; \+indep(s20)), consistent(s23, rider_level).
evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate_to_expert)).
query(true_val(rider_level, unk_rider_level)).

0.85::acc(s31, skill_level_recommendation).
% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values park_jib_street_rail=Park_riders_jibbers_street_rail unk_skill_level_recommendation=Unknown
% @importance 0.85
0.85::true_val(skill_level_recommendation, park_jib_street_rail); 0.15::true_val(skill_level_recommendation, unk_skill_level_recommendation).
measured(s31, skill_level_recommendation, park_jib_street_rail).
all_consistent(skill_level_recommendation) :- consistent(s31, skill_level_recommendation).
evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, park_jib_street_rail)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

0.88::acc(s30, botw_rating).
% @attr botw_rating
% @type numeric
% @unit /100
% @canonical false
% @original_name Board of the World rating
% @values v86_62=86.62 unk_botw_rating=Unknown
% @importance 0.9
0.85::true_val(botw_rating, v86_62); 0.15::true_val(botw_rating, unk_botw_rating).
measured(s30, botw_rating, v86_62).
all_consistent(botw_rating) :- consistent(s30, botw_rating).
evidence(all_consistent(botw_rating)).
query(true_val(botw_rating, v86_62)).
query(true_val(botw_rating, unk_botw_rating)).

0.85::acc(s22, botw_ranking).
% @attr botw_ranking
% @type categorical
% @canonical false
% @original_name Board of the World ranking
% @values rank_15_of_38=15th_of_38_all_mountain unk_botw_ranking=Unknown
% @importance 0.85
0.82::true_val(botw_ranking, rank_15_of_38); 0.18::true_val(botw_ranking, unk_botw_ranking).
measured(s22, botw_ranking, rank_15_of_38).
all_consistent(botw_ranking) :- consistent(s22, botw_ranking).
evidence(all_consistent(botw_ranking)).
query(true_val(botw_ranking, rank_15_of_38)).
query(true_val(botw_ranking, unk_botw_ranking)).

0.85::acc(s17, overall_rating_snowboardingprofiles).
% @attr overall_rating_snowboardingprofiles
% @type numeric
% @unit /100
% @canonical true
% @original_name overall_rating_snowboardingprofiles
% @values v84_4=84.4 unk_overall_rating_snowboardingprofiles=Unknown
% @importance 0.85
0.85::true_val(overall_rating_snowboardingprofiles, v84_4); 0.15::true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles).
measured(s17, overall_rating_snowboardingprofiles, v84_4).
all_consistent(overall_rating_snowboardingprofiles) :- consistent(s17, overall_rating_snowboardingprofiles).
evidence(all_consistent(overall_rating_snowboardingprofiles)).
query(true_val(overall_rating_snowboardingprofiles, v84_4)).
query(true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles)).

0.85::acc(s17, overall_ranking_snowboardingprofiles).
% @attr overall_ranking_snowboardingprofiles
% @type categorical
% @canonical false
% @original_name overall_rating_snowboardingprofiles
% @values rank_17_of_33=17th_of_33_all_mountain_freestyle unk_overall_ranking_snowboardingprofiles=Unknown
% @importance 0.85
0.82::true_val(overall_ranking_snowboardingprofiles, rank_17_of_33); 0.18::true_val(overall_ranking_snowboardingprofiles, unk_overall_ranking_snowboardingprofiles).
measured(s17, overall_ranking_snowboardingprofiles, rank_17_of_33).
all_consistent(overall_ranking_snowboardingprofiles) :- consistent(s17, overall_ranking_snowboardingprofiles).
evidence(all_consistent(overall_ranking_snowboardingprofiles)).
query(true_val(overall_ranking_snowboardingprofiles, rank_17_of_33)).
query(true_val(overall_ranking_snowboardingprofiles, unk_overall_ranking_snowboardingprofiles)).

0.90::acc(s2, user_review_forum).
% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values nine_reviews_100pct=9_reviews_100pct_rating unk_user_review_forum=Unknown
% @importance 1.0
0.90::true_val(user_review_forum, nine_reviews_100pct); 0.10::true_val(user_review_forum, unk_user_review_forum).
measured(s2, user_review_forum, nine_reviews_100pct).
all_consistent(user_review_forum) :- consistent(s2, user_review_forum).
evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, nine_reviews_100pct)).
query(true_val(user_review_forum, unk_user_review_forum)).

0.85::acc(s37, botw_amf_rating).
% @attr botw_amf_rating
% @type categorical
% @canonical false
% @original_name Board of the World (all-mtn freestyle list)
% @values v4_30_of_5_above_avg=4_30_of_5_plus_1_57pct_above_avg unk_botw_amf_rating=Unknown
% @importance 0.75
0.82::true_val(botw_amf_rating, v4_30_of_5_above_avg); 0.18::true_val(botw_amf_rating, unk_botw_amf_rating).
measured(s37, botw_amf_rating, v4_30_of_5_above_avg).
all_consistent(botw_amf_rating) :- consistent(s37, botw_amf_rating).
evidence(all_consistent(botw_amf_rating)).
query(true_val(botw_amf_rating, v4_30_of_5_above_avg)).
query(true_val(botw_amf_rating, unk_botw_amf_rating)).

0.88::acc(s30, pop).
0.85::acc(s35, pop).
% @attr pop
% @type categorical
% @canonical true
% @original_name pop
% @values exceptional=Exceptional_effortless_high_ceiling unk_pop=Unknown
% @importance 0.875
0.90::true_val(pop, exceptional); 0.10::true_val(pop, unk_pop).
measured(s30, pop, exceptional).
measured(s35, pop, exceptional).
all_consistent(pop) :- consistent(s30, pop), consistent(s35, pop).
evidence(all_consistent(pop)).
query(true_val(pop, exceptional)).
query(true_val(pop, unk_pop)).

0.88::acc(s30, edge_hold).
0.82::acc(s22, edge_hold).
% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values strong_on_ice=Strong_edge_hold_ice_Magne_Traction_camber unk_edge_hold=Unknown
% @importance 0.875
0.90::true_val(edge_hold, strong_on_ice); 0.10::true_val(edge_hold, unk_edge_hold).
measured(s30, edge_hold, strong_on_ice).
measured(s22, edge_hold, strong_on_ice).
all_consistent(edge_hold) :- consistent(s30, edge_hold), consistent(s22, edge_hold).
evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, strong_on_ice)).
query(true_val(edge_hold, unk_edge_hold)).

0.88::acc(s30, positive_aspect).
% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values stable_damp_poppy=Stable_underfoot_damp_poppy unk_positive_aspect=Unknown
% @importance 0.9
0.85::true_val(positive_aspect, stable_damp_poppy); 0.15::true_val(positive_aspect, unk_positive_aspect).
measured(s30, positive_aspect, stable_damp_poppy).
all_consistent(positive_aspect) :- consistent(s30, positive_aspect).
evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, stable_damp_poppy)).
query(true_val(positive_aspect, unk_positive_aspect)).

0.85::acc(s35, positive_aspect_landing).
% @attr positive_aspect_landing
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values stomper_landings=Stomper_fully_stomp_landings unk_positive_aspect_landing=Unknown
% @importance 0.85
0.82::true_val(positive_aspect_landing, stomper_landings); 0.18::true_val(positive_aspect_landing, unk_positive_aspect_landing).
measured(s35, positive_aspect_landing, stomper_landings).
all_consistent(positive_aspect_landing) :- consistent(s35, positive_aspect_landing).
evidence(all_consistent(positive_aspect_landing)).
query(true_val(positive_aspect_landing, stomper_landings)).
query(true_val(positive_aspect_landing, unk_positive_aspect_landing)).

0.88::acc(s30, positive_aspect_carving).
0.85::acc(s35, positive_aspect_carving).
% @attr positive_aspect_carving
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values carves_well=Carved_impressively_well_for_freestyle unk_positive_aspect_carving=Unknown
% @importance 0.875
0.90::true_val(positive_aspect_carving, carves_well); 0.10::true_val(positive_aspect_carving, unk_positive_aspect_carving).
measured(s30, positive_aspect_carving, carves_well).
measured(s35, positive_aspect_carving, carves_well).
all_consistent(positive_aspect_carving) :- consistent(s30, positive_aspect_carving), consistent(s35, positive_aspect_carving).
evidence(all_consistent(positive_aspect_carving)).
query(true_val(positive_aspect_carving, carves_well)).
query(true_val(positive_aspect_carving, unk_positive_aspect_carving)).

0.88::acc(s30, positive_aspect_versatile).
% @attr positive_aspect_versatile
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values versatile_all_mtn=Versatile_enough_for_all_mountain unk_positive_aspect_versatile=Unknown
% @importance 0.9
0.85::true_val(positive_aspect_versatile, versatile_all_mtn); 0.15::true_val(positive_aspect_versatile, unk_positive_aspect_versatile).
measured(s30, positive_aspect_versatile, versatile_all_mtn).
all_consistent(positive_aspect_versatile) :- consistent(s30, positive_aspect_versatile).
evidence(all_consistent(positive_aspect_versatile)).
query(true_val(positive_aspect_versatile, versatile_all_mtn)).
query(true_val(positive_aspect_versatile, unk_positive_aspect_versatile)).

0.88::acc(s30, positive_aspect_damp).
% @attr positive_aspect_damp
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values damp_higher_end=Damp_higher_end_feel_rare_in_park unk_positive_aspect_damp=Unknown
% @importance 0.9
0.85::true_val(positive_aspect_damp, damp_higher_end); 0.15::true_val(positive_aspect_damp, unk_positive_aspect_damp).
measured(s30, positive_aspect_damp, damp_higher_end).
all_consistent(positive_aspect_damp) :- consistent(s30, positive_aspect_damp).
evidence(all_consistent(positive_aspect_damp)).
query(true_val(positive_aspect_damp, damp_higher_end)).
query(true_val(positive_aspect_damp, unk_positive_aspect_damp)).

0.88::acc(s30, positive_aspect_icy_jumps).
% @attr positive_aspect_icy_jumps
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values icy_park_jumps=Performance_on_icy_park_jumps_highlight unk_positive_aspect_icy_jumps=Unknown
% @importance 0.9
0.85::true_val(positive_aspect_icy_jumps, icy_park_jumps); 0.15::true_val(positive_aspect_icy_jumps, unk_positive_aspect_icy_jumps).
measured(s30, positive_aspect_icy_jumps, icy_park_jumps).
all_consistent(positive_aspect_icy_jumps) :- consistent(s30, positive_aspect_icy_jumps).
evidence(all_consistent(positive_aspect_icy_jumps)).
query(true_val(positive_aspect_icy_jumps, icy_park_jumps)).
query(true_val(positive_aspect_icy_jumps, unk_positive_aspect_icy_jumps)).

0.85::acc(s35, switch_riding).
% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values great_switch=Great_for_setting_up_and_landing_switch unk_switch_riding=Unknown
% @importance 0.85
0.82::true_val(switch_riding, great_switch); 0.18::true_val(switch_riding, unk_switch_riding).
measured(s35, switch_riding, great_switch).
all_consistent(switch_riding) :- consistent(s35, switch_riding).
evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, great_switch)).
query(true_val(switch_riding, unk_switch_riding)).

0.85::acc(s31, positive_aspect_ollies).
% @attr positive_aspect_ollies
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values skateboard_ollies=Skateboard_style_ollies_without_much_input unk_positive_aspect_ollies=Unknown
% @importance 0.85
0.85::true_val(positive_aspect_ollies, skateboard_ollies); 0.15::true_val(positive_aspect_ollies, unk_positive_aspect_ollies).
measured(s31, positive_aspect_ollies, skateboard_ollies).
all_consistent(positive_aspect_ollies) :- consistent(s31, positive_aspect_ollies).
evidence(all_consistent(positive_aspect_ollies)).
query(true_val(positive_aspect_ollies, skateboard_ollies)).
query(true_val(positive_aspect_ollies, unk_positive_aspect_ollies)).

0.85::acc(s23, positive_aspect_durability).
% @attr positive_aspect_durability
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values uhmw_rail_confidence=UHMW_sidewalls_tip_tail_rail_confidence unk_positive_aspect_durability=Unknown
% @importance 0.85
0.85::true_val(positive_aspect_durability, uhmw_rail_confidence); 0.15::true_val(positive_aspect_durability, unk_positive_aspect_durability).
measured(s23, positive_aspect_durability, uhmw_rail_confidence).
all_consistent(positive_aspect_durability) :- consistent(s23, positive_aspect_durability).
evidence(all_consistent(positive_aspect_durability)).
query(true_val(positive_aspect_durability, uhmw_rail_confidence)).
query(true_val(positive_aspect_durability, unk_positive_aspect_durability)).

0.88::acc(s30, negative_aspect_slow_base).
% @attr negative_aspect_slow_base
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values slow_base=Base_not_fastest_slow_in_flats_needs_waxing unk_negative_aspect_slow_base=Unknown
% @importance 0.9
0.85::true_val(negative_aspect_slow_base, slow_base); 0.15::true_val(negative_aspect_slow_base, unk_negative_aspect_slow_base).
measured(s30, negative_aspect_slow_base, slow_base).
all_consistent(negative_aspect_slow_base) :- consistent(s30, negative_aspect_slow_base).
evidence(all_consistent(negative_aspect_slow_base)).
query(true_val(negative_aspect_slow_base, slow_base)).
query(true_val(negative_aspect_slow_base, unk_negative_aspect_slow_base)).

0.88::acc(s30, negative_aspect_too_stiff).
% @attr negative_aspect_too_stiff
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values too_stiff_jibbers=Too_stiff_for_some_jibbers_takes_muscle unk_negative_aspect_too_stiff=Unknown
% @importance 0.9
0.85::true_val(negative_aspect_too_stiff, too_stiff_jibbers); 0.15::true_val(negative_aspect_too_stiff, unk_negative_aspect_too_stiff).
measured(s30, negative_aspect_too_stiff, too_stiff_jibbers).
all_consistent(negative_aspect_too_stiff) :- consistent(s30, negative_aspect_too_stiff).
evidence(all_consistent(negative_aspect_too_stiff)).
query(true_val(negative_aspect_too_stiff, too_stiff_jibbers)).
query(true_val(negative_aspect_too_stiff, unk_negative_aspect_too_stiff)).

0.85::acc(s35, negative_aspect_heavy).
% @attr negative_aspect_heavy
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values heavier_than_avg=Heavier_board_notice_extra_weight_on_spins unk_negative_aspect_heavy=Unknown
% @importance 0.85
0.82::true_val(negative_aspect_heavy, heavier_than_avg); 0.18::true_val(negative_aspect_heavy, unk_negative_aspect_heavy).
measured(s35, negative_aspect_heavy, heavier_than_avg).
all_consistent(negative_aspect_heavy) :- consistent(s35, negative_aspect_heavy).
evidence(all_consistent(negative_aspect_heavy)).
query(true_val(negative_aspect_heavy, heavier_than_avg)).
query(true_val(negative_aspect_heavy, unk_negative_aspect_heavy)).

0.85::acc(s35, negative_aspect_powder).
% @attr negative_aspect_powder
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values sinky_no_float=Not_great_in_powder_sinky_no_setback unk_negative_aspect_powder=Unknown
% @importance 0.85
0.82::true_val(negative_aspect_powder, sinky_no_float); 0.18::true_val(negative_aspect_powder, unk_negative_aspect_powder).
measured(s35, negative_aspect_powder, sinky_no_float).
all_consistent(negative_aspect_powder) :- consistent(s35, negative_aspect_powder).
evidence(all_consistent(negative_aspect_powder)).
query(true_val(negative_aspect_powder, sinky_no_float)).
query(true_val(negative_aspect_powder, unk_negative_aspect_powder)).

0.85::acc(s31, negative_aspect_unforgiving).
% @attr negative_aspect_unforgiving
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values unforgiving_flat_base=Unforgiving_on_flat_base_not_paying_attention unk_negative_aspect_unforgiving=Unknown
% @importance 0.85
0.85::true_val(negative_aspect_unforgiving, unforgiving_flat_base); 0.15::true_val(negative_aspect_unforgiving, unk_negative_aspect_unforgiving).
measured(s31, negative_aspect_unforgiving, unforgiving_flat_base).
all_consistent(negative_aspect_unforgiving) :- consistent(s31, negative_aspect_unforgiving).
evidence(all_consistent(negative_aspect_unforgiving)).
query(true_val(negative_aspect_unforgiving, unforgiving_flat_base)).
query(true_val(negative_aspect_unforgiving, unk_negative_aspect_unforgiving)).

0.85::acc(s31, negative_aspect_not_all_mountain).
% @attr negative_aspect_not_all_mountain
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values not_all_mtn_big_terrain=Not_all_mountain_on_big_terrain_ok_smaller unk_negative_aspect_not_all_mountain=Unknown
% @importance 0.85
0.85::true_val(negative_aspect_not_all_mountain, not_all_mtn_big_terrain); 0.15::true_val(negative_aspect_not_all_mountain, unk_negative_aspect_not_all_mountain).
measured(s31, negative_aspect_not_all_mountain, not_all_mtn_big_terrain).
all_consistent(negative_aspect_not_all_mountain) :- consistent(s31, negative_aspect_not_all_mountain).
evidence(all_consistent(negative_aspect_not_all_mountain)).
query(true_val(negative_aspect_not_all_mountain, not_all_mtn_big_terrain)).
query(true_val(negative_aspect_not_all_mountain, unk_negative_aspect_not_all_mountain)).

0.85::acc(s31, negative_aspect_not_beginner).
% @attr negative_aspect_not_beginner
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values not_first_park_board=Not_first_park_board_strong_flex_aggressive_camber unk_negative_aspect_not_beginner=Unknown
% @importance 0.85
0.85::true_val(negative_aspect_not_beginner, not_first_park_board); 0.15::true_val(negative_aspect_not_beginner, unk_negative_aspect_not_beginner).
measured(s31, negative_aspect_not_beginner, not_first_park_board).
all_consistent(negative_aspect_not_beginner) :- consistent(s31, negative_aspect_not_beginner).
evidence(all_consistent(negative_aspect_not_beginner)).
query(true_val(negative_aspect_not_beginner, not_first_park_board)).
query(true_val(negative_aspect_not_beginner, unk_negative_aspect_not_beginner)).

0.88::acc(s30, comparable_board_same_brand).
% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values gnu_headspace=GNU_Headspace_softer_C3_jib unk_comparable_board_same_brand=Unknown
% @importance 0.9
0.85::true_val(comparable_board_same_brand, gnu_headspace); 0.15::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).
measured(s30, comparable_board_same_brand, gnu_headspace).
all_consistent(comparable_board_same_brand) :- consistent(s30, comparable_board_same_brand).
evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, gnu_headspace)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

0.85::acc(s23, comparable_board_cross_brand).
% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values burton_blossom=Burton_Blossom unk_comparable_board_cross_brand=Unknown
% @importance 0.85
0.85::true_val(comparable_board_cross_brand, burton_blossom); 0.15::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).
measured(s23, comparable_board_cross_brand, burton_blossom).
all_consistent(comparable_board_cross_brand) :- consistent(s23, comparable_board_cross_brand).
evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, burton_blossom)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

0.85::acc(s23, comparable_board_cross_brand_huck_knife).
% @attr comparable_board_cross_brand_huck_knife
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values salomon_huck_knife=Salomon_Huck_Knife unk_comparable_board_cross_brand_huck_knife=Unknown
% @importance 0.85
0.85::true_val(comparable_board_cross_brand_huck_knife, salomon_huck_knife); 0.15::true_val(comparable_board_cross_brand_huck_knife, unk_comparable_board_cross_brand_huck_knife).
measured(s23, comparable_board_cross_brand_huck_knife, salomon_huck_knife).
all_consistent(comparable_board_cross_brand_huck_knife) :- consistent(s23, comparable_board_cross_brand_huck_knife).
evidence(all_consistent(comparable_board_cross_brand_huck_knife)).
query(true_val(comparable_board_cross_brand_huck_knife, salomon_huck_knife)).
query(true_val(comparable_board_cross_brand_huck_knife, unk_comparable_board_cross_brand_huck_knife)).

0.85::acc(s23, comparable_board_cross_brand_evil_twin).
% @attr comparable_board_cross_brand_evil_twin
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values bataleon_evil_twin=Bataleon_Evil_Twin unk_comparable_board_cross_brand_evil_twin=Unknown
% @importance 0.85
0.85::true_val(comparable_board_cross_brand_evil_twin, bataleon_evil_twin); 0.15::true_val(comparable_board_cross_brand_evil_twin, unk_comparable_board_cross_brand_evil_twin).
measured(s23, comparable_board_cross_brand_evil_twin, bataleon_evil_twin).
all_consistent(comparable_board_cross_brand_evil_twin) :- consistent(s23, comparable_board_cross_brand_evil_twin).
evidence(all_consistent(comparable_board_cross_brand_evil_twin)).
query(true_val(comparable_board_cross_brand_evil_twin, bataleon_evil_twin)).
query(true_val(comparable_board_cross_brand_evil_twin, unk_comparable_board_cross_brand_evil_twin)).

0.85::acc(s23, comparable_board_cross_brand_tweaker).
% @attr comparable_board_cross_brand_tweaker
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values jones_tweaker=Jones_Tweaker unk_comparable_board_cross_brand_tweaker=Unknown
% @importance 0.85
0.85::true_val(comparable_board_cross_brand_tweaker, jones_tweaker); 0.15::true_val(comparable_board_cross_brand_tweaker, unk_comparable_board_cross_brand_tweaker).
measured(s23, comparable_board_cross_brand_tweaker, jones_tweaker).
all_consistent(comparable_board_cross_brand_tweaker) :- consistent(s23, comparable_board_cross_brand_tweaker).
evidence(all_consistent(comparable_board_cross_brand_tweaker)).
query(true_val(comparable_board_cross_brand_tweaker, jones_tweaker)).
query(true_val(comparable_board_cross_brand_tweaker, unk_comparable_board_cross_brand_tweaker)).

0.85::acc(s23, comparable_board_cross_brand_abstract).
% @attr comparable_board_cross_brand_abstract
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values salomon_abstract=Salomon_Abstract unk_comparable_board_cross_brand_abstract=Unknown
% @importance 0.85
0.85::true_val(comparable_board_cross_brand_abstract, salomon_abstract); 0.15::true_val(comparable_board_cross_brand_abstract, unk_comparable_board_cross_brand_abstract).
measured(s23, comparable_board_cross_brand_abstract, salomon_abstract).
all_consistent(comparable_board_cross_brand_abstract) :- consistent(s23, comparable_board_cross_brand_abstract).
evidence(all_consistent(comparable_board_cross_brand_abstract)).
query(true_val(comparable_board_cross_brand_abstract, salomon_abstract)).
query(true_val(comparable_board_cross_brand_abstract, unk_comparable_board_cross_brand_abstract)).

0.85::acc(s23, comparable_board_cross_brand_freethinker).
% @attr comparable_board_cross_brand_freethinker
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values burton_free_thinker=Burton_Free_Thinker unk_comparable_board_cross_brand_freethinker=Unknown
% @importance 0.85
0.85::true_val(comparable_board_cross_brand_freethinker, burton_free_thinker); 0.15::true_val(comparable_board_cross_brand_freethinker, unk_comparable_board_cross_brand_freethinker).
measured(s23, comparable_board_cross_brand_freethinker, burton_free_thinker).
all_consistent(comparable_board_cross_brand_freethinker) :- consistent(s23, comparable_board_cross_brand_freethinker).
evidence(all_consistent(comparable_board_cross_brand_freethinker)).
query(true_val(comparable_board_cross_brand_freethinker, burton_free_thinker)).
query(true_val(comparable_board_cross_brand_freethinker, unk_comparable_board_cross_brand_freethinker)).

0.82::acc(s37, comparable_board_cross_brand_super_doa).
% @attr comparable_board_cross_brand_super_doa
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values capita_super_doa=Capita_Super_DOA unk_comparable_board_cross_brand_super_doa=Unknown
% @importance 0.75
0.82::true_val(comparable_board_cross_brand_super_doa, capita_super_doa); 0.18::true_val(comparable_board_cross_brand_super_doa, unk_comparable_board_cross_brand_super_doa).
measured(s37, comparable_board_cross_brand_super_doa, capita_super_doa).
all_consistent(comparable_board_cross_brand_super_doa) :- consistent(s37, comparable_board_cross_brand_super_doa).
evidence(all_consistent(comparable_board_cross_brand_super_doa)).
query(true_val(comparable_board_cross_brand_super_doa, capita_super_doa)).
query(true_val(comparable_board_cross_brand_super_doa, unk_comparable_board_cross_brand_super_doa)).

0.85::acc(s23, comparable_board_same_brand_lineup).
% @attr comparable_board_same_brand_lineup
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values between_scratcher_knife=Between_Box_Scratcher_and_Box_Knife unk_comparable_board_same_brand_lineup=Unknown
% @importance 0.85
0.85::true_val(comparable_board_same_brand_lineup, between_scratcher_knife); 0.15::true_val(comparable_board_same_brand_lineup, unk_comparable_board_same_brand_lineup).
measured(s23, comparable_board_same_brand_lineup, between_scratcher_knife).
all_consistent(comparable_board_same_brand_lineup) :- consistent(s23, comparable_board_same_brand_lineup).
evidence(all_consistent(comparable_board_same_brand_lineup)).
query(true_val(comparable_board_same_brand_lineup, between_scratcher_knife)).
query(true_val(comparable_board_same_brand_lineup, unk_comparable_board_same_brand_lineup)).

0.88::acc(s30, comparable_board_same_brand_vs_headspace).
% @attr comparable_board_same_brand_vs_headspace
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values offramp_stiffer_jumps=Off_Ramp_stiffer_jumps_Headspace_softer_jib unk_comparable_board_same_brand_vs_headspace=Unknown
% @importance 0.9
0.85::true_val(comparable_board_same_brand_vs_headspace, offramp_stiffer_jumps); 0.15::true_val(comparable_board_same_brand_vs_headspace, unk_comparable_board_same_brand_vs_headspace).
measured(s30, comparable_board_same_brand_vs_headspace, offramp_stiffer_jumps).
all_consistent(comparable_board_same_brand_vs_headspace) :- consistent(s30, comparable_board_same_brand_vs_headspace).
evidence(all_consistent(comparable_board_same_brand_vs_headspace)).
query(true_val(comparable_board_same_brand_vs_headspace, offramp_stiffer_jumps)).
query(true_val(comparable_board_same_brand_vs_headspace, unk_comparable_board_same_brand_vs_headspace)).

0.88::acc(s30, binding_compatibility).
0.85::acc(s31, binding_compatibility).
% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values union_ultra=Union_Ultra unk_binding_compatibility=Unknown
% @importance 0.875
0.90::true_val(binding_compatibility, union_ultra); 0.10::true_val(binding_compatibility, unk_binding_compatibility).
measured(s30, binding_compatibility, union_ultra).
measured(s31, binding_compatibility, union_ultra).
all_consistent(binding_compatibility) :- consistent(s30, binding_compatibility), consistent(s31, binding_compatibility).
evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, union_ultra)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

0.82::acc(s38, binding_compatibility_axtion).
% @attr binding_compatibility_axtion
% @type categorical
% @canonical false
% @original_name binding_compatibility
% @values bent_metal_axtion=Bent_Metal_Axtion_good_match unk_binding_compatibility_axtion=Unknown
% @importance 0.65
0.80::true_val(binding_compatibility_axtion, bent_metal_axtion); 0.20::true_val(binding_compatibility_axtion, unk_binding_compatibility_axtion).
measured(s38, binding_compatibility_axtion, bent_metal_axtion).
all_consistent(binding_compatibility_axtion) :- consistent(s38, binding_compatibility_axtion).
evidence(all_consistent(binding_compatibility_axtion)).
query(true_val(binding_compatibility_axtion, bent_metal_axtion)).
query(true_val(binding_compatibility_axtion, unk_binding_compatibility_axtion)).

0.82::acc(s38, binding_compatibility_transfer).
% @attr binding_compatibility_transfer
% @type categorical
% @canonical false
% @original_name binding_compatibility
% @values bent_metal_transfer_too_stiff=Bent_Metal_Transfer_too_stiff unk_binding_compatibility_transfer=Unknown
% @importance 0.65
0.80::true_val(binding_compatibility_transfer, bent_metal_transfer_too_stiff); 0.20::true_val(binding_compatibility_transfer, unk_binding_compatibility_transfer).
measured(s38, binding_compatibility_transfer, bent_metal_transfer_too_stiff).
all_consistent(binding_compatibility_transfer) :- consistent(s38, binding_compatibility_transfer).
evidence(all_consistent(binding_compatibility_transfer)).
query(true_val(binding_compatibility_transfer, bent_metal_transfer_too_stiff)).
query(true_val(binding_compatibility_transfer, unk_binding_compatibility_transfer)).

0.93::acc(s2, model_series).
% @attr model_series
% @type categorical
% @canonical false
% @original_name Model series
% @values freestyle_park_lineup=Freestyle_Park_lineup_within_Lib_Tech unk_model_series=Unknown
% @importance 1.0
0.93::true_val(model_series, freestyle_park_lineup); 0.07::true_val(model_series, unk_model_series).
measured(s2, model_series, freestyle_park_lineup).
all_consistent(model_series) :- consistent(s2, model_series).
evidence(all_consistent(model_series)).
query(true_val(model_series, freestyle_park_lineup)).
query(true_val(model_series, unk_model_series)).

0.85::acc(s33, redesign_year).
% @attr redesign_year
% @type categorical
% @canonical true
% @original_name redesign_year
% @values yr2025_c3_to_traditional=2025_upgraded_C3_to_traditional_camber unk_redesign_year=Unknown
% @importance 0.85
0.85::true_val(redesign_year, yr2025_c3_to_traditional); 0.15::true_val(redesign_year, unk_redesign_year).
measured(s33, redesign_year, yr2025_c3_to_traditional).
all_consistent(redesign_year) :- consistent(s33, redesign_year).
evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, yr2025_c3_to_traditional)).
query(true_val(redesign_year, unk_redesign_year)).

0.88::acc(s2, sale_activity).
0.82::acc(s18, sale_activity).
% @attr sale_activity
% @type categorical
% @canonical false
% @original_name Lib Tech sale activity
% @values active_sales=20pct_off_libtech_30pct_off_evo unk_sale_activity=Unknown
% @importance 0.95
0.90::true_val(sale_activity, active_sales); 0.10::true_val(sale_activity, unk_sale_activity).
measured(s2, sale_activity, active_sales).
measured(s18, sale_activity, active_sales).
all_consistent(sale_activity) :- consistent(s2, sale_activity), (indep(s18), consistent(s18, sale_activity) ; \+indep(s18)).
evidence(all_consistent(sale_activity)).
query(true_val(sale_activity, active_sales)).
query(true_val(sale_activity, unk_sale_activity)).