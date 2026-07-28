0.15::indep(sm).
0.15::indep(s2).
0.15::indep(s3).
0.15::indep(s8).
0.35::indep(s11).
0.25::indep(s18).
0.15::indep(s19).
0.15::indep(s20).
0.15::indep(s21).
0.15::indep(s22).
0.20::indep(s23).
0.20::indep(s25).
0.10::indep(s26).
0.15::indep(s27).
0.15::indep(s28).
0.20::indep(s29).
0.15::indep(s30).
0.35::indep(s31).
0.15::indep(s32).
0.30::indep(s6).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

0.95::acc(s1, brand).
% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values jones_snowboards=Jones_Snowboards unk_brand=Unknown
% @importance 1.0
0.95::true_val(brand, jones_snowboards); 0.05::true_val(brand, unk_brand).
measured(s1, brand, jones_snowboards).
all_consistent(brand) :- consistent(s1, brand).
evidence(all_consistent(brand)).
query(true_val(brand, jones_snowboards)).
query(true_val(brand, unk_brand)).

0.95::acc(s1, model_name).
% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values flagship=Flagship unk_model_name=Unknown
% @importance 1.0
0.95::true_val(model_name, flagship); 0.05::true_val(model_name, unk_model_name).
measured(s1, model_name, flagship).
all_consistent(model_name) :- consistent(s1, model_name).
evidence(all_consistent(model_name)).
query(true_val(model_name, flagship)).
query(true_val(model_name, unk_model_name)).

0.80::acc(s2, model_year).
% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2027=2027 unk_model_year=Unknown
% @importance 0.9
0.71::true_val(model_year, y2027); 0.29::true_val(model_year, unk_model_year).
measured(s2, model_year, y2027).
all_consistent(model_year) :- consistent(s2, model_year).
evidence(all_consistent(model_year)).
query(true_val(model_year, y2027)).
query(true_val(model_year, unk_model_year)).

0.75::acc(s3, product_type).
% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values freeride_snowboard=Freeride_snowboard unk_product_type=Unknown
% @importance 0.9
0.60::true_val(product_type, freeride_snowboard); 0.40::true_val(product_type, unk_product_type).
measured(s3, product_type, freeride_snowboard).
all_consistent(product_type) :- consistent(s3, product_type).
evidence(all_consistent(product_type)).
query(true_val(product_type, freeride_snowboard)).
query(true_val(product_type, unk_product_type)).

0.93::acc(s4, gender).
% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.7
0.86::true_val(gender, mens); 0.14::true_val(gender, unk_gender).
measured(s4, gender, mens).
all_consistent(gender) :- consistent(s4, gender).
evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

0.82::acc(s5, founder).
% @attr founder
% @type categorical
% @canonical false
% @original_name Founder
% @values jeremy_jones=Jeremy_Jones_professional_freeride_snowboarder unk_founder=Unknown
% @importance 0.6
0.71::true_val(founder, jeremy_jones); 0.29::true_val(founder, unk_founder).
measured(s5, founder, jeremy_jones).
all_consistent(founder) :- consistent(s5, founder).
evidence(all_consistent(founder)).
query(true_val(founder, jeremy_jones)).
query(true_val(founder, unk_founder)).

0.80::acc(s5, company_founded).
0.70::acc(s6, company_founded).
% @attr company_founded
% @type categorical
% @canonical false
% @original_name Company founded
% @values y2010=2010 y2009=2009
% @importance 0.55
0.58::true_val(company_founded, y2010); 0.42::true_val(company_founded, y2009).
measured(s5, company_founded, y2010).
measured(s6, company_founded, y2009).
all_consistent(company_founded) :-
    consistent(s5, company_founded),
    (indep(s6), consistent(s6, company_founded) ; \+indep(s6)).
evidence(all_consistent(company_founded)).
query(true_val(company_founded, y2010)).
query(true_val(company_founded, y2009)).

0.82::acc(s7, parent_company).
% @attr parent_company
% @type categorical
% @canonical false
% @original_name Parent company
% @values nidecker_group=Nidecker_Group_NDK unk_parent_company=Unknown
% @importance 0.5
0.71::true_val(parent_company, nidecker_group); 0.29::true_val(parent_company, unk_parent_company).
measured(s7, parent_company, nidecker_group).
all_consistent(parent_company) :- consistent(s7, parent_company).
evidence(all_consistent(parent_company)).
query(true_val(parent_company, nidecker_group)).
query(true_val(parent_company, unk_parent_company)).

0.75::acc(s8, headquarters).
% @attr headquarters
% @type categorical
% @canonical false
% @original_name Headquarters
% @values truckee_ca=Truckee_California unk_headquarters=Unknown
% @importance 0.4
0.63::true_val(headquarters, truckee_ca); 0.37::true_val(headquarters, unk_headquarters).
measured(s8, headquarters, truckee_ca).
all_consistent(headquarters) :-
    (indep(s8), consistent(s8, headquarters) ; \+indep(s8)).
evidence(all_consistent(headquarters)).
query(true_val(headquarters, truckee_ca)).
query(true_val(headquarters, unk_headquarters)).

0.93::acc(s9, corporate_entity).
% @attr corporate_entity
% @type categorical
% @canonical false
% @original_name Corporate entity
% @values jones_nidecker_us=Jones_Nidecker_US_Inc_Truckee_CA unk_corporate_entity=Unknown
% @importance 1.0
0.87::true_val(corporate_entity, jones_nidecker_us); 0.13::true_val(corporate_entity, unk_corporate_entity).
measured(s9, corporate_entity, jones_nidecker_us).
all_consistent(corporate_entity) :- consistent(s9, corporate_entity).
evidence(all_consistent(corporate_entity)).
query(true_val(corporate_entity, jones_nidecker_us)).
query(true_val(corporate_entity, unk_corporate_entity)).

0.82::acc(s10, brand_manager).
% @attr brand_manager
% @type categorical
% @canonical false
% @original_name Brand manager
% @values xavier_nidecker=Xavier_Nidecker unk_brand_manager=Unknown
% @importance 0.4
0.72::true_val(brand_manager, xavier_nidecker); 0.28::true_val(brand_manager, unk_brand_manager).
measured(s10, brand_manager, xavier_nidecker).
all_consistent(brand_manager) :- consistent(s10, brand_manager).
evidence(all_consistent(brand_manager)).
query(true_val(brand_manager, xavier_nidecker)).
query(true_val(brand_manager, unk_brand_manager)).

0.80::acc(s11, manufacturing_location).
% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values sws_dubai=SWS_factory_Dubai_UAE unk_manufacturing_location=Unknown
% @importance 0.5
0.67::true_val(manufacturing_location, sws_dubai); 0.33::true_val(manufacturing_location, unk_manufacturing_location).
measured(s11, manufacturing_location, sws_dubai).
all_consistent(manufacturing_location) :-
    (indep(s11), consistent(s11, manufacturing_location) ; \+indep(s11)).
evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, sws_dubai)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

0.78::acc(s12, sws_factory_background).
% @attr sws_factory_background
% @type categorical
% @canonical false
% @original_name SWS factory background
% @values former_elan_300k_yr=Former_Elan_workers_300k_boards_per_year unk_sws_factory_background=Unknown
% @importance 0.4
0.68::true_val(sws_factory_background, former_elan_300k_yr); 0.32::true_val(sws_factory_background, unk_sws_factory_background).
measured(s12, sws_factory_background, former_elan_300k_yr).
all_consistent(sws_factory_background) :- consistent(s12, sws_factory_background).
evidence(all_consistent(sws_factory_background)).
query(true_val(sws_factory_background, former_elan_300k_yr)).
query(true_val(sws_factory_background, unk_sws_factory_background)).

0.85::acc(s13, sustainability_certification).
% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values fair_trade_certified=Fair_Trade_Certified_industry_first unk_sustainability_certification=Unknown
% @importance 0.6
0.72::true_val(sustainability_certification, fair_trade_certified); 0.28::true_val(sustainability_certification, unk_sustainability_certification).
measured(s13, sustainability_certification, fair_trade_certified).
all_consistent(sustainability_certification) :- consistent(s13, sustainability_certification).
evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, fair_trade_certified)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

0.85::acc(s14, sustainability_certification_solar).
0.82::acc(s13, sustainability_certification_solar).
% @attr sustainability_certification_solar
% @type categorical
% @canonical false
% @original_name Manufacturing powered by 100% solar energy
% @values solar_100pct=100_percent_solar_powered unk_sustainability_certification_solar=Unknown
% @importance 0.575
0.95::true_val(sustainability_certification_solar, solar_100pct); 0.05::true_val(sustainability_certification_solar, unk_sustainability_certification_solar).
measured(s14, sustainability_certification_solar, solar_100pct).
measured(s13, sustainability_certification_solar, solar_100pct).
all_consistent(sustainability_certification_solar) :-
    consistent(s14, sustainability_certification_solar),
    consistent(s13, sustainability_certification_solar).
evidence(all_consistent(sustainability_certification_solar)).
query(true_val(sustainability_certification_solar, solar_100pct)).
query(true_val(sustainability_certification_solar, unk_sustainability_certification_solar)).

0.78::acc(s15, sustainability_certification_1pct_planet).
% @attr sustainability_certification_1pct_planet
% @type categorical
% @canonical false
% @original_name sustainability_certification (1% for the Planet)
% @values donates_1pct=Donates_1pct_of_sales_to_nonprofits unk_sustainability_certification_1pct_planet=Unknown
% @importance 0.45
0.63::true_val(sustainability_certification_1pct_planet, donates_1pct); 0.37::true_val(sustainability_certification_1pct_planet, unk_sustainability_certification_1pct_planet).
measured(s15, sustainability_certification_1pct_planet, donates_1pct).
all_consistent(sustainability_certification_1pct_planet) :- consistent(s15, sustainability_certification_1pct_planet).
evidence(all_consistent(sustainability_certification_1pct_planet)).
query(true_val(sustainability_certification_1pct_planet, donates_1pct)).
query(true_val(sustainability_certification_1pct_planet, unk_sustainability_certification_1pct_planet)).

0.72::acc(s16, model_first_available_year).
% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2010_11=2010_11_season unk_model_first_available_year=Unknown
% @importance 0.6
0.50::true_val(model_first_available_year, season_2010_11); 0.50::true_val(model_first_available_year, unk_model_first_available_year).
measured(s16, model_first_available_year, season_2010_11).
all_consistent(model_first_available_year) :- consistent(s16, model_first_available_year).
evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2010_11)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

0.85::acc(s17, predecessor_model_continuity).
% @attr predecessor_model_continuity
% @type categorical
% @canonical false
% @original_name Predecessor model continuity
% @values no_change_2026_stiffer_2024=No_change_2026_stiffer_flex_2024_2025 unk_predecessor_model_continuity=Unknown
% @importance 0.9
0.77::true_val(predecessor_model_continuity, no_change_2026_stiffer_2024); 0.23::true_val(predecessor_model_continuity, unk_predecessor_model_continuity).
measured(s17, predecessor_model_continuity, no_change_2026_stiffer_2024).
all_consistent(predecessor_model_continuity) :- consistent(s17, predecessor_model_continuity).
evidence(all_consistent(predecessor_model_continuity)).
query(true_val(predecessor_model_continuity, no_change_2026_stiffer_2024)).
query(true_val(predecessor_model_continuity, unk_predecessor_model_continuity)).

0.70::acc(s18, redesign_year).
% @attr redesign_year
% @type categorical
% @canonical true
% @original_name redesign_year
% @values subtle_refinements_2027=Subtle_refinements_updated_graphics_2027 unk_redesign_year=Unknown
% @importance 0.8
0.55::true_val(redesign_year, subtle_refinements_2027); 0.45::true_val(redesign_year, unk_redesign_year).
measured(s18, redesign_year, subtle_refinements_2027).
all_consistent(redesign_year) :-
    (indep(s18), consistent(s18, redesign_year) ; \+indep(s18)).
evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, subtle_refinements_2027)).
query(true_val(redesign_year, unk_redesign_year)).

0.92::acc(sm, availability_status).
% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values preorder=Preorder_merchant_verified unk_availability_status=Unknown
% @importance 0.85
0.95::true_val(availability_status, preorder); 0.05::true_val(availability_status, unk_availability_status).
measured(sm, availability_status, preorder).
all_consistent(availability_status) :- consistent(sm, availability_status).
evidence(all_consistent(availability_status)).
query(true_val(availability_status, preorder)).
query(true_val(availability_status, unk_availability_status)).

0.92::acc(sm, estimated_availability_date).
% @attr estimated_availability_date
% @type categorical
% @canonical false
% @original_name estimated_availability_date
% @values jun_8_2026=June_8_2026 unk_estimated_availability_date=Unknown
% @importance 0.85
0.95::true_val(estimated_availability_date, jun_8_2026); 0.05::true_val(estimated_availability_date, unk_estimated_availability_date).
measured(sm, estimated_availability_date, jun_8_2026).
all_consistent(estimated_availability_date) :- consistent(sm, estimated_availability_date).
evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, jun_8_2026)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

0.93::acc(s9, availability_status_jones).
% @attr availability_status_jones
% @type categorical
% @canonical false
% @original_name availability_status (Jones direct)
% @values in_stock_749_95=In_stock_749_95_USD unk_availability_status_jones=Unknown
% @importance 1.0
0.87::true_val(availability_status_jones, in_stock_749_95); 0.13::true_val(availability_status_jones, unk_availability_status_jones).
measured(s9, availability_status_jones, in_stock_749_95).
all_consistent(availability_status_jones) :- consistent(s9, availability_status_jones).
evidence(all_consistent(availability_status_jones)).
query(true_val(availability_status_jones, in_stock_749_95)).
query(true_val(availability_status_jones, unk_availability_status_jones)).

0.80::acc(s19, availability_status_milosport).
% @attr availability_status_milosport
% @type categorical
% @canonical false
% @original_name availability_status (Milosport)
% @values in_stock_749_95_pickup=749_95_USD_pickup_MILO_SLC unk_availability_status_milosport=Unknown
% @importance 0.85
0.71::true_val(availability_status_milosport, in_stock_749_95_pickup); 0.29::true_val(availability_status_milosport, unk_availability_status_milosport).
measured(s19, availability_status_milosport, in_stock_749_95_pickup).
all_consistent(availability_status_milosport) :- consistent(s19, availability_status_milosport).
evidence(all_consistent(availability_status_milosport)).
query(true_val(availability_status_milosport, in_stock_749_95_pickup)).
query(true_val(availability_status_milosport, unk_availability_status_milosport)).

0.72::acc(s20, availability_status_sourceboards).
% @attr availability_status_sourceboards
% @type categorical
% @canonical false
% @original_name availability_status (Source Boards)
% @values sold_out_wide_638=638_USD_sold_out_wide unk_availability_status_sourceboards=Unknown
% @importance 0.7
0.52::true_val(availability_status_sourceboards, sold_out_wide_638); 0.48::true_val(availability_status_sourceboards, unk_availability_status_sourceboards).
measured(s20, availability_status_sourceboards, sold_out_wide_638).
all_consistent(availability_status_sourceboards) :- consistent(s20, availability_status_sourceboards).
evidence(all_consistent(availability_status_sourceboards)).
query(true_val(availability_status_sourceboards, sold_out_wide_638)).
query(true_val(availability_status_sourceboards, unk_availability_status_sourceboards)).

0.75::acc(s21, availability_status_twelve).
% @attr availability_status_twelve
% @type categorical
% @canonical false
% @original_name availability_status (Twelve Board Store)
% @values preorder_early_may=On_preorder_first_shipment_early_May unk_availability_status_twelve=Unknown
% @importance 0.6
0.60::true_val(availability_status_twelve, preorder_early_may); 0.40::true_val(availability_status_twelve, unk_availability_status_twelve).
measured(s21, availability_status_twelve, preorder_early_may).
all_consistent(availability_status_twelve) :- consistent(s21, availability_status_twelve).
evidence(all_consistent(availability_status_twelve)).
query(true_val(availability_status_twelve, preorder_early_may)).
query(true_val(availability_status_twelve, unk_availability_status_twelve)).

0.72::acc(s22, availability_status_ballistyx).
% @attr availability_status_ballistyx
% @type categorical
% @canonical false
% @original_name availability_status (Ballistyx)
% @values preorder_with_tshirt=On_preorder_includes_limited_edition_tshirt unk_availability_status_ballistyx=Unknown
% @importance 0.55
0.52::true_val(availability_status_ballistyx, preorder_with_tshirt); 0.48::true_val(availability_status_ballistyx, unk_availability_status_ballistyx).
measured(s22, availability_status_ballistyx, preorder_with_tshirt).
all_consistent(availability_status_ballistyx) :- consistent(s22, availability_status_ballistyx).
evidence(all_consistent(availability_status_ballistyx)).
query(true_val(availability_status_ballistyx, preorder_with_tshirt)).
query(true_val(availability_status_ballistyx, unk_availability_status_ballistyx)).

0.78::acc(s23, availability_status_evo).
% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status (evo)
% @values in_stock_price_match=In_stock_lowest_price_guarantee unk_availability_status_evo=Unknown
% @importance 0.8
0.60::true_val(availability_status_evo, in_stock_price_match); 0.40::true_val(availability_status_evo, unk_availability_status_evo).
measured(s23, availability_status_evo, in_stock_price_match).
all_consistent(availability_status_evo) :- consistent(s23, availability_status_evo).
evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, in_stock_price_match)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

0.78::acc(s24, price_usd_backcountry).
% @attr price_usd_backcountry
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_backcountry
% @values v599_96=599.96 unk_price_usd_backcountry=Unknown
% @importance 0.85
0.56::true_val(price_usd_backcountry, v599_96); 0.44::true_val(price_usd_backcountry, unk_price_usd_backcountry).
measured(s24, price_usd_backcountry, v599_96).
all_consistent(price_usd_backcountry) :- consistent(s24, price_usd_backcountry).
evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v599_96)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

0.75::acc(s25, price_usd_rei).
% @attr price_usd_rei
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_rei
% @values v599_93=599.93 unk_price_usd_rei=Unknown
% @importance 0.75
0.56::true_val(price_usd_rei, v599_93); 0.44::true_val(price_usd_rei, unk_price_usd_rei).
measured(s25, price_usd_rei, v599_93).
all_consistent(price_usd_rei) :- consistent(s25, price_usd_rei).
evidence(all_consistent(price_usd_rei)).
query(true_val(price_usd_rei, v599_93)).
query(true_val(price_usd_rei, unk_price_usd_rei)).

0.78::acc(s24, price_usd_tactics).
% @attr price_usd_tactics
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_tactics
% @values v749_95=749.95 unk_price_usd_tactics=Unknown
% @importance 0.85
0.56::true_val(price_usd_tactics, v749_95); 0.44::true_val(price_usd_tactics, unk_price_usd_tactics).
measured(s24, price_usd_tactics, v749_95).
all_consistent(price_usd_tactics) :- consistent(s24, price_usd_tactics).
evidence(all_consistent(price_usd_tactics)).
query(true_val(price_usd_tactics, v749_95)).
query(true_val(price_usd_tactics, unk_price_usd_tactics)).

0.75::acc(s24, price_usd_the_house).
% @attr price_usd_the_house
% @type numeric
% @unit USD
% @canonical false
% @original_name Availability at The House
% @values v599_95=599.95 unk_price_usd_the_house=Unknown
% @importance 0.85
0.56::true_val(price_usd_the_house, v599_95); 0.44::true_val(price_usd_the_house, unk_price_usd_the_house).
measured(s24, price_usd_the_house, v599_95).
all_consistent(price_usd_the_house) :- consistent(s24, price_usd_the_house).
evidence(all_consistent(price_usd_the_house)).
query(true_val(price_usd_the_house, v599_95)).
query(true_val(price_usd_the_house, unk_price_usd_the_house)).

0.75::acc(s24, price_eur_blue_tomato).
% @attr price_eur_blue_tomato
% @type numeric
% @unit EUR
% @canonical false
% @original_name price_eur_blue_tomato
% @values v569=569.0 unk_price_eur_blue_tomato=Unknown
% @importance 0.85
0.56::true_val(price_eur_blue_tomato, v569); 0.44::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).
measured(s24, price_eur_blue_tomato, v569).
all_consistent(price_eur_blue_tomato) :- consistent(s24, price_eur_blue_tomato).
evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v569)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

0.55::acc(s26, availability_amazon).
% @attr availability_amazon
% @type categorical
% @canonical false
% @original_name Availability at Amazon
% @values listed_various_2025=Listed_at_various_prices_2025_model unk_availability_amazon=Unknown
% @importance 0.6
0.39::true_val(availability_amazon, listed_various_2025); 0.61::true_val(availability_amazon, unk_availability_amazon).
measured(s26, availability_amazon, listed_various_2025).
all_consistent(availability_amazon) :- consistent(s26, availability_amazon).
evidence(all_consistent(availability_amazon)).
query(true_val(availability_amazon, listed_various_2025)).
query(true_val(availability_amazon, unk_availability_amazon)).

0.92::acc(sm, price_aud_merchant).
% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v1299_99=1299.99 unk_price_aud_merchant=Unknown
% @importance 0.85
0.95::true_val(price_aud_merchant, v1299_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).
measured(sm, price_aud_merchant, v1299_99).
all_consistent(price_aud_merchant) :- consistent(sm, price_aud_merchant).
evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v1299_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

0.93::acc(s9, price_usd_msrp).
0.80::acc(s19, price_usd_msrp).
% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v749_95=749.95 unk_price_usd_msrp=Unknown
% @importance 0.925
0.95::true_val(price_usd_msrp, v749_95); 0.05::true_val(price_usd_msrp, unk_price_usd_msrp).
measured(s9, price_usd_msrp, v749_95).
measured(s19, price_usd_msrp, v749_95).
all_consistent(price_usd_msrp) :-
    consistent(s9, price_usd_msrp),
    (indep(s19), consistent(s19, price_usd_msrp) ; \+indep(s19)).
evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v749_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

0.93::acc(s9, flagship_pro_msrp).
% @attr flagship_pro_msrp
% @type numeric
% @unit USD
% @canonical false
% @original_name Flagship Pro MSRP
% @values v899_95=899.95 unk_flagship_pro_msrp=Unknown
% @importance 1.0
0.87::true_val(flagship_pro_msrp, v899_95); 0.13::true_val(flagship_pro_msrp, unk_flagship_pro_msrp).
measured(s9, flagship_pro_msrp, v899_95).
all_consistent(flagship_pro_msrp) :- consistent(s9, flagship_pro_msrp).
evidence(all_consistent(flagship_pro_msrp)).
query(true_val(flagship_pro_msrp, v899_95)).
query(true_val(flagship_pro_msrp, unk_flagship_pro_msrp)).

0.93::acc(s9, warranty).
% @attr warranty
% @type categorical
% @canonical false
% @original_name warranty
% @values two_plus_one=2_plus_1_warranty_with_registration unk_warranty=Unknown
% @importance 1.0
0.87::true_val(warranty, two_plus_one); 0.13::true_val(warranty, unk_warranty).
measured(s9, warranty, two_plus_one).
all_consistent(warranty) :- consistent(s9, warranty).
evidence(all_consistent(warranty)).
query(true_val(warranty, two_plus_one)).
query(true_val(warranty, unk_warranty)).

0.92::acc(sm, shape).
0.75::acc(s27, shape).
% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 0.825
0.95::true_val(shape, tapered_directional); 0.05::true_val(shape, unk_shape).
measured(sm, shape, tapered_directional).
measured(s27, shape, tapered_directional).
all_consistent(shape) :-
    consistent(sm, shape),
    (indep(s27), consistent(s27, shape) ; \+indep(s27)).
evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

0.92::acc(sm, camber_type).
% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values directional_camber_rocker=Directional_Camber_Rocker unk_camber_type=Unknown
% @importance 0.85
0.95::true_val(camber_type, directional_camber_rocker); 0.05::true_val(camber_type, unk_camber_type).
measured(sm, camber_type, directional_camber_rocker).
all_consistent(camber_type) :- consistent(sm, camber_type).
evidence(all_consistent(camber_type)).
query(true_val(camber_type, directional_camber_rocker)).
query(true_val(camber_type, unk_camber_type)).

0.80::acc(s28, camber_description).
% @attr camber_description
% @type categorical
% @canonical false
% @original_name camber_description
% @values camber_dominant_nose_rocker=Camber_dominant_nose_rises_freely_in_powder unk_camber_description=Unknown
% @importance 0.85
0.63::true_val(camber_description, camber_dominant_nose_rocker); 0.37::true_val(camber_description, unk_camber_description).
measured(s28, camber_description, camber_dominant_nose_rocker).
all_consistent(camber_description) :-
    (indep(s28), consistent(s28, camber_description) ; \+indep(s28)).
evidence(all_consistent(camber_description)).
query(true_val(camber_description, camber_dominant_nose_rocker)).
query(true_val(camber_description, unk_camber_description)).

0.90::acc(sm, taper).
0.88::acc(s9, taper).
% @attr taper
% @type numeric
% @unit mm
% @canonical true
% @original_name taper
% @values v12=12.0 unk_taper=Unknown
% @importance 0.925
0.95::true_val(taper, v12); 0.05::true_val(taper, unk_taper).
measured(sm, taper, v12).
measured(s9, taper, v12).
all_consistent(taper) :-
    consistent(s9, taper),
    (indep(sm), consistent(sm, taper) ; \+indep(sm)).
evidence(all_consistent(taper)).
query(true_val(taper, v12)).
query(true_val(taper, unk_taper)).

0.85::acc(s9, taper_large).
% @attr taper_large
% @type numeric
% @unit mm
% @canonical false
% @original_name taper (large sizes)
% @values v14=14.0 unk_taper_large=Unknown
% @importance 1.0
0.87::true_val(taper_large, v14); 0.13::true_val(taper_large, unk_taper_large).
measured(s9, taper_large, v14).
all_consistent(taper_large) :- consistent(s9, taper_large).
evidence(all_consistent(taper_large)).
query(true_val(taper_large, v14)).
query(true_val(taper_large, unk_taper_large)).

0.92::acc(sm, setback).
% @attr setback
% @type numeric
% @unit mm
% @canonical true
% @original_name setback
% @values v20=20.0 unk_setback=Unknown
% @importance 0.85
0.95::true_val(setback, v20); 0.05::true_val(setback, unk_setback).
measured(sm, setback, v20).
all_consistent(setback) :- consistent(sm, setback).
evidence(all_consistent(setback)).
query(true_val(setback, v20)).
query(true_val(setback, unk_setback)).

0.82::acc(s29, nose_design).
% @attr nose_design
% @type categorical
% @canonical false
% @original_name Nose design
% @values blunt_nose=Blunt_nose_improved_powder_float unk_nose_design=Unknown
% @importance 0.85
0.72::true_val(nose_design, blunt_nose); 0.28::true_val(nose_design, unk_nose_design).
measured(s29, nose_design, blunt_nose).
all_consistent(nose_design) :-
    (indep(s29), consistent(s29, nose_design) ; \+indep(s29)).
evidence(all_consistent(nose_design)).
query(true_val(nose_design, blunt_nose)).
query(true_val(nose_design, unk_nose_design)).

0.92::acc(sm, contour_base_3d).
% @attr contour_base_3d
% @type categorical
% @canonical false
% @original_name 3D contour base
% @values high_3d_7mm_spoon=High_3D_Contour_Base_7mm_spoon_bevel unk_contour_base_3d=Unknown
% @importance 0.85
0.95::true_val(contour_base_3d, high_3d_7mm_spoon); 0.05::true_val(contour_base_3d, unk_contour_base_3d).
measured(sm, contour_base_3d, high_3d_7mm_spoon).
all_consistent(contour_base_3d) :- consistent(sm, contour_base_3d).
evidence(all_consistent(contour_base_3d)).
query(true_val(contour_base_3d, high_3d_7mm_spoon)).
query(true_val(contour_base_3d, unk_contour_base_3d)).

0.80::acc(s28, contour_base_version).
% @attr contour_base_version
% @type categorical
% @canonical false
% @original_name 3D Contour Base version
% @values v3_0_most_aggressive=3D_Contour_Base_3_0_most_aggressive unk_contour_base_version=Unknown
% @importance 0.85
0.63::true_val(contour_base_version, v3_0_most_aggressive); 0.37::true_val(contour_base_version, unk_contour_base_version).
measured(s28, contour_base_version, v3_0_most_aggressive).
all_consistent(contour_base_version) :-
    (indep(s28), consistent(s28, contour_base_version) ; \+indep(s28)).
evidence(all_consistent(contour_base_version)).
query(true_val(contour_base_version, v3_0_most_aggressive)).
query(true_val(contour_base_version, unk_contour_base_version)).

0.88::acc(sm, base_material).
0.75::acc(s30, base_material).
0.80::acc(s9, base_material).
% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_8000=Sintered_8000 sintered_9900=Sintered_9900
% @importance 0.88
0.55::true_val(base_material, sintered_8000); 0.45::true_val(base_material, sintered_9900).
measured(sm, base_material, sintered_8000).
measured(s30, base_material, sintered_8000).
measured(s9, base_material, sintered_9900).
all_consistent(base_material) :-
    consistent(s9, base_material),
    (indep(sm), consistent(sm, base_material) ; \+indep(sm)),
    (indep(s30), consistent(s30, base_material) ; \+indep(s30)).
evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_8000)).
query(true_val(base_material, sintered_9900)).

0.93::acc(s9, flip_flop_base).
% @attr flip_flop_base
% @type categorical
% @canonical false
% @original_name Flip-Flop Base
% @values two_colorways_less_waste=Two_base_colorways_minimize_PTex_waste unk_flip_flop_base=Unknown
% @importance 1.0
0.87::true_val(flip_flop_base, two_colorways_less_waste); 0.13::true_val(flip_flop_base, unk_flip_flop_base).
measured(s9, flip_flop_base, two_colorways_less_waste).
all_consistent(flip_flop_base) :- consistent(s9, flip_flop_base).
evidence(all_consistent(flip_flop_base)).
query(true_val(flip_flop_base, two_colorways_less_waste)).
query(true_val(flip_flop_base, unk_flip_flop_base)).

0.90::acc(sm, base_contouring).
% @attr base_contouring
% @type categorical
% @canonical false
% @original_name Base contouring
% @values inspired_surfboard_reduces_drag=3D_Base_Contouring_surfboard_inspired unk_base_contouring=Unknown
% @importance 0.85
0.95::true_val(base_contouring, inspired_surfboard_reduces_drag); 0.05::true_val(base_contouring, unk_base_contouring).
measured(sm, base_contouring, inspired_surfboard_reduces_drag).
all_consistent(base_contouring) :- consistent(sm, base_contouring).
evidence(all_consistent(base_contouring)).
query(true_val(base_contouring, inspired_surfboard_reduces_drag)).
query(true_val(base_contouring, unk_base_contouring)).

0.88::acc(sm, core_material).
0.85::acc(s9, core_material).
% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values control_core=Control_Core_dual_density_paulownia_poplar power_core=Power_Core_triple_density_bamboo_paulownia_poplar
% @importance 0.925
0.52::true_val(core_material, control_core); 0.48::true_val(core_material, power_core).
measured(sm, core_material, control_core).
measured(s9, core_material, power_core).
all_consistent(core_material) :-
    consistent(s9, core_material),
    (indep(sm), consistent(sm, core_material) ; \+indep(sm)).
evidence(all_consistent(core_material)).
query(true_val(core_material, control_core)).
query(true_val(core_material, power_core)).

0.92::acc(sm, laminate).
% @attr laminate
% @type categorical
% @canonical false
% @original_name laminate
% @values triax_fiberglass=Triax_Fiberglass_triple_layer_multi_axis unk_laminate=Unknown
% @importance 0.85
0.95::true_val(laminate, triax_fiberglass); 0.05::true_val(laminate, unk_laminate).
measured(sm, laminate, triax_fiberglass).
all_consistent(laminate) :- consistent(sm, laminate).
evidence(all_consistent(laminate)).
query(true_val(laminate, triax_fiberglass)).
query(true_val(laminate, unk_laminate)).

0.90::acc(sm, construction_material_innovation).
0.88::acc(s9, construction_material_innovation).
% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values bcomp_carbon_flax_bio_resin=BComp_Carbon_Flax_Stringer_Bio_Resin unk_construction_material_innovation=Unknown
% @importance 0.925
0.95::true_val(construction_material_innovation, bcomp_carbon_flax_bio_resin); 0.05::true_val(construction_material_innovation, unk_construction_material_innovation).
measured(sm, construction_material_innovation, bcomp_carbon_flax_bio_resin).
measured(s9, construction_material_innovation, bcomp_carbon_flax_bio_resin).
all_consistent(construction_material_innovation) :-
    consistent(s9, construction_material_innovation),
    (indep(sm), consistent(sm, construction_material_innovation) ; \+indep(sm)).
evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, bcomp_carbon_flax_bio_resin)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

0.92::acc(sm, resin).
% @attr resin
% @type categorical
% @canonical false
% @original_name resin
% @values plant_based_bio_resin=Plant_based_bio_resin_27pct_plant_carbon unk_resin=Unknown
% @importance 0.85
0.95::true_val(resin, plant_based_bio_resin); 0.05::true_val(resin, unk_resin).
measured(sm, resin, plant_based_bio_resin).
all_consistent(resin) :- consistent(sm, resin).
evidence(all_consistent(resin)).
query(true_val(resin, plant_based_bio_resin)).
query(true_val(resin, unk_resin)).

0.90::acc(s9, topsheet).
0.85::acc(sm, topsheet).
% @attr topsheet
% @type categorical
% @canonical true
% @original_name topsheet
% @values ash_wood_veneer=Ash_Wood_Veneer_lightweight_damp unk_topsheet=Unknown
% @importance 0.925
0.95::true_val(topsheet, ash_wood_veneer); 0.05::true_val(topsheet, unk_topsheet).
measured(s9, topsheet, ash_wood_veneer).
measured(sm, topsheet, ash_wood_veneer).
all_consistent(topsheet) :-
    consistent(s9, topsheet),
    (indep(sm), consistent(sm, topsheet) ; \+indep(sm)).
evidence(all_consistent(topsheet)).
query(true_val(topsheet, ash_wood_veneer)).
query(true_val(topsheet, unk_topsheet)).

0.90::acc(sm, sidewall_material).
0.88::acc(s9, sidewall_material).
% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values recycled_abs_round=Recycled_ABS_round_finish unk_sidewall_material=Unknown
% @importance 0.925
0.95::true_val(sidewall_material, recycled_abs_round); 0.05::true_val(sidewall_material, unk_sidewall_material).
measured(sm, sidewall_material, recycled_abs_round).
measured(s9, sidewall_material, recycled_abs_round).
all_consistent(sidewall_material) :-
    consistent(s9, sidewall_material),
    (indep(sm), consistent(sm, sidewall_material) ; \+indep(sm)).
evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, recycled_abs_round)).
query(true_val(sidewall_material, unk_sidewall_material)).

0.90::acc(sm, edges_material).
% @attr edges_material
% @type categorical
% @canonical false
% @original_name Edges
% @values recycled_german_steel=Recycled_German_steel_edges unk_edges_material=Unknown
% @importance 0.85
0.95::true_val(edges_material, recycled_german_steel); 0.05::true_val(edges_material, unk_edges_material).
measured(sm, edges_material, recycled_german_steel).
all_consistent(edges_material) :- consistent(sm, edges_material).
evidence(all_consistent(edges_material)).
query(true_val(edges_material, recycled_german_steel)).
query(true_val(edges_material, unk_edges_material)).

0.90::acc(sm, edge_technology).
0.80::acc(s28, edge_technology).
% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values traction_tech_3_0=Traction_Tech_3_0_three_contact_points unk_edge_technology=Unknown
% @importance 0.85
0.95::true_val(edge_technology, traction_tech_3_0); 0.05::true_val(edge_technology, unk_edge_technology).
measured(sm, edge_technology, traction_tech_3_0).
measured(s28, edge_technology, traction_tech_3_0).
all_consistent(edge_technology) :-
    (indep(sm), consistent(sm, edge_technology) ; \+indep(sm)),
    (indep(s28), consistent(s28, edge_technology) ; \+indep(s28)).
evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, traction_tech_3_0)).
query(true_val(edge_technology, unk_edge_technology)).

0.90::acc(sm, factory_wax).
% @attr factory_wax
% @type categorical
% @canonical false
% @original_name Factory wax
% @values wend_natural=WEND_Natural_Wax_ready_to_ride unk_factory_wax=Unknown
% @importance 0.85
0.95::true_val(factory_wax, wend_natural); 0.05::true_val(factory_wax, unk_factory_wax).
measured(sm, factory_wax, wend_natural).
all_consistent(factory_wax) :- consistent(sm, factory_wax).
evidence(all_consistent(factory_wax)).
query(true_val(factory_wax, wend_natural)).
query(true_val(factory_wax, unk_factory_wax)).

0.90::acc(sm, factory_tuning).
% @attr factory_tuning
% @type categorical
% @canonical false
% @original_name Factory tuning
% @values detuned_tip_tail=Factory_detuned_tip_and_tail unk_factory_tuning=Unknown
% @importance 0.85
0.95::true_val(factory_tuning, detuned_tip_tail); 0.05::true_val(factory_tuning, unk_factory_tuning).
measured(sm, factory_tuning, detuned_tip_tail).
all_consistent(factory_tuning) :- consistent(sm, factory_tuning).
evidence(all_consistent(factory_tuning)).
query(true_val(factory_tuning, detuned_tip_tail)).
query(true_val(factory_tuning, unk_factory_tuning)).

0.90::acc(sm, flex_conditioning).
% @attr flex_conditioning
% @type categorical
% @canonical false
% @original_name Flex conditioning
% @values forever_flex=Forever_Flex_overbuilt_broken_in_at_factory unk_flex_conditioning=Unknown
% @importance 0.85
0.95::true_val(flex_conditioning, forever_flex); 0.05::true_val(flex_conditioning, unk_flex_conditioning).
measured(sm, flex_conditioning, forever_flex).
all_consistent(flex_conditioning) :- consistent(sm, flex_conditioning).
evidence(all_consistent(flex_conditioning)).
query(true_val(flex_conditioning, forever_flex)).
query(true_val(flex_conditioning, unk_flex_conditioning)).

0.92::acc(sm, mounting_pattern).
% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 0.85
0.95::true_val(mounting_pattern, inserts_2x4); 0.05::true_val(mounting_pattern, unk_mounting_pattern).
measured(sm, mounting_pattern, inserts_2x4).
all_consistent(mounting_pattern) :- consistent(sm, mounting_pattern).
evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

0.92::acc(sm, extra_inserts).
% @attr extra_inserts
% @type categorical
% @canonical false
% @original_name Extra inserts
% @values float_pack=Float_Pack_extra_setback_inserts unk_extra_inserts=Unknown
% @importance 0.85
0.95::true_val(extra_inserts, float_pack); 0.05::true_val(extra_inserts, unk_extra_inserts).
measured(sm, extra_inserts, float_pack).
all_consistent(extra_inserts) :- consistent(sm, extra_inserts).
evidence(all_consistent(extra_inserts)).
query(true_val(extra_inserts, float_pack)).
query(true_val(extra_inserts, unk_extra_inserts)).

0.90::acc(sm, flex_rating_10).
0.82::acc(s31, flex_rating_10).
% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v8=8.0 unk_flex_rating_10=Unknown
% @importance 0.85
0.95::true_val(flex_rating_10, v8); 0.05::true_val(flex_rating_10, unk_flex_rating_10).
measured(sm, flex_rating_10, v8).
measured(s31, flex_rating_10, v8).
all_consistent(flex_rating_10) :-
    (indep(sm), consistent(sm, flex_rating_10) ; \+indep(sm)),
    (indep(s31), consistent(s31, flex_rating_10) ; \+indep(s31)).
evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v8)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

0.90::acc(s9, flex_rating_5).
% @attr flex_rating_5
% @type numeric
% @unit /5
% @canonical false
% @original_name flex_rating_5
% @values v4=4.0 unk_flex_rating_5=Unknown
% @importance 1.0
0.87::true_val(flex_rating_5, v4); 0.13::true_val(flex_rating_5, unk_flex_rating_5).
measured(s9, flex_rating_5, v4).
all_consistent(flex_rating_5) :- consistent(s9, flex_rating_5).
evidence(all_consistent(flex_rating_5)).
query(true_val(flex_rating_5, v4)).
query(true_val(flex_rating_5, unk_flex_rating_5)).

0.82::acc(s29, flex_rating_10_evo).
% @attr flex_rating_10_evo
% @type numeric
% @unit /5
% @canonical false
% @original_name flex_rating_10_evo
% @values v4_evo=4.0 unk_flex_rating_10_evo=Unknown
% @importance 0.85
0.72::true_val(flex_rating_10_evo, v4_evo); 0.28::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).
measured(s29, flex_rating_10_evo, v4_evo).
all_consistent(flex_rating_10_evo) :-
    (indep(s29), consistent(s29, flex_rating_10_evo) ; \+indep(s29)).
evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, v4_evo)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

0.88::acc(sm, terrain_suitability_all_mountain).
0.85::acc(s9, terrain_suitability_all_mountain).
% @attr terrain_suitability_all_mountain
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability (all-mountain rating)
% @values v9=9.0 v7=7.0
% @importance 0.925
0.48::true_val(terrain_suitability_all_mountain, v9); 0.52::true_val(terrain_suitability_all_mountain, v7).
measured(sm, terrain_suitability_all_mountain, v9).
measured(s9, terrain_suitability_all_mountain, v7).
all_consistent(terrain_suitability_all_mountain) :-
    consistent(s9, terrain_suitability_all_mountain),
    (indep(sm), consistent(sm, terrain_suitability_all_mountain) ; \+indep(sm)).
evidence(all_consistent(terrain_suitability_all_mountain)).
query(true_val(terrain_suitability_all_mountain, v9)).
query(true_val(terrain_suitability_all_mountain, v7)).

0.90::acc(sm, terrain_suitability_powder).
0.88::acc(s9, terrain_suitability_powder).
% @attr terrain_suitability_powder
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability (powder rating)
% @values v10=10.0 unk_terrain_suitability_powder=Unknown
% @importance 0.925
0.95::true_val(terrain_suitability_powder, v10); 0.05::true_val(terrain_suitability_powder, unk_terrain_suitability_powder).
measured(sm, terrain_suitability_powder, v10).
measured(s9, terrain_suitability_powder, v10).
all_consistent(terrain_suitability_powder) :-
    consistent(s9, terrain_suitability_powder),
    (indep(sm), consistent(sm, terrain_suitability_powder) ; \+indep(sm)).
evidence(all_consistent(terrain_suitability_powder)).
query(true_val(terrain_suitability_powder, v10)).
query(true_val(terrain_suitability_powder, unk_terrain_suitability_powder)).

0.88::acc(sm, freestyle_park_rating).
0.90::acc(s9, freestyle_park_rating).
% @attr freestyle_park_rating
% @type numeric
% @unit /10
% @canonical true
% @original_name freestyle_park_rating
% @values v5=5.0 v3=3.0
% @importance 0.925
0.45::true_val(freestyle_park_rating, v5); 0.55::true_val(freestyle_park_rating, v3).
measured(sm, freestyle_park_rating, v5).
measured(s9, freestyle_park_rating, v3).
all_consistent(freestyle_park_rating) :-
    consistent(s9, freestyle_park_rating),
    (indep(sm), consistent(sm, freestyle_park_rating) ; \+indep(sm)).
evidence(all_consistent(freestyle_park_rating)).
query(true_val(freestyle_park_rating, v5)).
query(true_val(freestyle_park_rating, v3)).

0.92::acc(sm, rider_level).
% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate_advanced=Intermediate_Advanced unk_rider_level=Unknown
% @importance 0.85
0.95::true_val(rider_level, intermediate_advanced); 0.05::true_val(rider_level, unk_rider_level).
measured(sm, rider_level, intermediate_advanced).
all_consistent(rider_level) :- consistent(sm, rider_level).
evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate_advanced)).
query(true_val(rider_level, unk_rider_level)).

0.92::acc(sm, board_category).
% @attr board_category
% @type categorical
% @canonical false
% @original_name board_category
% @values freeride_powder=Freeride_Powder unk_board_category=Unknown
% @importance 0.85
0.95::true_val(board_category, freeride_powder); 0.05::true_val(board_category, unk_board_category).
measured(sm, board_category, freeride_powder).
all_consistent(board_category) :- consistent(sm, board_category).
evidence(all_consistent(board_category)).
query(true_val(board_category, freeride_powder)).
query(true_val(board_category, unk_board_category)).

0.92::acc(sm, terrain_suitability).
% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values steep_deep_hardpack_bc_powder=Steep_deep_hardpacked_backcountry_powder unk_terrain_suitability=Unknown
% @importance 0.85
0.95::true_val(terrain_suitability, steep_deep_hardpack_bc_powder); 0.05::true_val(terrain_suitability, unk_terrain_suitability).
measured(sm, terrain_suitability, steep_deep_hardpack_bc_powder).
all_consistent(terrain_suitability) :- consistent(sm, terrain_suitability).
evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, steep_deep_hardpack_bc_powder)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

0.92::acc(sm, riding_style).
% @attr riding_style
% @type categorical
% @canonical false
% @original_name riding_style
% @values freeride_powder_bc=Freeride_Powder_Backcountry unk_riding_style=Unknown
% @importance 0.85
0.95::true_val(riding_style, freeride_powder_bc); 0.05::true_val(riding_style, unk_riding_style).
measured(sm, riding_style, freeride_powder_bc).
all_consistent(riding_style) :- consistent(sm, riding_style).
evidence(all_consistent(riding_style)).
query(true_val(riding_style, freeride_powder_bc)).
query(true_val(riding_style, unk_riding_style)).

0.75::acc(s32, terrain_suitability_big_mountain).
% @attr terrain_suitability_big_mountain
% @type categorical
% @canonical false
% @original_name terrain_suitability (big mountain)
% @values couloirs_faces_cornices=Steep_couloirs_exposed_faces_cornice_drops unk_terrain_suitability_big_mountain=Unknown
% @importance 0.8
0.55::true_val(terrain_suitability_big_mountain, couloirs_faces_cornices); 0.45::true_val(terrain_suitability_big_mountain, unk_terrain_suitability_big_mountain).
measured(s32, terrain_suitability_big_mountain, couloirs_faces_cornices).
all_consistent(terrain_suitability_big_mountain) :-
    (indep(s32), consistent(s32, terrain_suitability_big_mountain) ; \+indep(s32)).
evidence(all_consistent(terrain_suitability_big_mountain)).
query(true_val(terrain_suitability_big_mountain, couloirs_faces_cornices)).
query(true_val(terrain_suitability_big_mountain, unk_terrain_suitability_big_mountain)).

0.80::acc(s31, not_ideal_for).
% @attr not_ideal_for
% @type categorical
% @canonical false
% @original_name Not ideal for
% @values new_park_playful=New_riders_park_rats_playful_style unk_not_ideal_for=Unknown
% @importance 0.85
0.68::true_val(not_ideal_for, new_park_playful); 0.32::true_val(not_ideal_for, unk_not_ideal_for).
measured(s31, not_ideal_for, new_park_playful).
all_consistent(not_ideal_for) :-
    (indep(s31), consistent(s31, not_ideal_for) ; \+indep(s31)).
evidence(all_consistent(not_ideal_for)).
query(true_val(not_ideal_for, new_park_playful)).
query(true_val(not_ideal_for, unk_not_ideal_for)).

0.80::acc(s33, one_board_quiver_potential).
% @attr one_board_quiver_potential
% @type categorical
% @canonical false
% @original_name One-board quiver potential
% @values yes_advanced_no_park=Can_work_for_advanced_riders_out_of_park unk_one_board_quiver_potential=Unknown
% @importance 0.9
0.63::true_val(one_board_quiver_potential, yes_advanced_no_park); 0.37::true_val(one_board_quiver_potential, unk_one_board_quiver_potential).
measured(s33, one_board_quiver_potential, yes_advanced_no_park).
all_consistent(one_board_quiver_potential) :- consistent(s33, one_board_quiver_potential).
evidence(all_consistent(one_board_quiver_potential)).
query(true_val(one_board_quiver_potential, yes_advanced_no_park)).
query(true_val(one_board_quiver_potential, unk_one_board_quiver_potential)).

0.88::acc(sm, available_sizes_merchant).
% @attr available_sizes_merchant
% @type categorical
% @canonical false
% @original_name available_sizes (merchant subset)
% @values five_sizes=154_158_161_159W_162W unk_available_sizes_merchant=Unknown
% @importance 0.85
0.95::true_val(available_sizes_merchant, five_sizes); 0.05::true_val(available_sizes_merchant, unk_available_sizes_merchant).
measured(sm, available_sizes_merchant, five_sizes).
all_consistent(available_sizes_merchant) :- consistent(sm, available_sizes_merchant).
evidence(all_consistent(available_sizes_merchant)).
query(true_val(available_sizes_merchant, five_sizes)).
query(true_val(available_sizes_merchant, unk_available_sizes_merchant)).

0.93::acc(s9, available_sizes).
0.80::acc(s19, available_sizes).
% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values twelve_sizes=151_154_156W_158_159W_161_162W_164_165W_167_169W_172 unk_available_sizes=Unknown
% @importance 0.925
0.95::true_val(available_sizes, twelve_sizes); 0.05::true_val(available_sizes, unk_available_sizes).
measured(s9, available_sizes, twelve_sizes).
measured(s19, available_sizes, twelve_sizes).
all_consistent(available_sizes) :-
    consistent(s9, available_sizes),
    (indep(s19), consistent(s19, available_sizes) ; \+indep(s19)).
evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, twelve_sizes)).
query(true_val(available_sizes, unk_available_sizes)).

0.92::acc(sm, width_options).
% @attr width_options
% @type categorical
% @canonical true
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 0.85
0.95::true_val(width_options, standard_and_wide); 0.05::true_val(width_options, unk_width_options).
measured(sm, width_options, standard_and_wide).
all_consistent(width_options) :- consistent(sm, width_options).
evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

0.90::acc(s9, width_options_wide_boot_size).
% @attr width_options_wide_boot_size
% @type categorical
% @canonical false
% @original_name width_options (wide boot size)
% @values us_mens_11_5_plus=For_boot_sizes_11_5_plus_US_Mens unk_width_options_wide_boot_size=Unknown
% @importance 1.0
0.87::true_val(width_options_wide_boot_size, us_mens_11_5_plus); 0.13::true_val(width_options_wide_boot_size, unk_width_options_wide_boot_size).
measured(s9, width_options_wide_boot_size, us_mens_11_5_plus).
all_consistent(width_options_wide_boot_size) :- consistent(s9, width_options_wide_boot_size).
evidence(all_consistent(width_options_wide_boot_size)).
query(true_val(width_options_wide_boot_size, us_mens_11_5_plus)).
query(true_val(width_options_wide_boot_size, unk_width_options_wide_boot_size)).

0.92::acc(sm, effective_edge_154).
% @attr effective_edge_154
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 154cm
% @values v1142=1142.0 unk_effective_edge_154=Unknown
% @importance 0.85
0.95::true_val(effective_edge_154, v1142); 0.05::true_val(effective_edge_154, unk_effective_edge_154).
measured(sm, effective_edge_154, v1142).
all_consistent(effective_edge_154) :- consistent(sm, effective_edge_154).
evidence(all_consistent(effective_edge_154)).
query(true_val(effective_edge_154, v1142)).
query(true_val(effective_edge_154, unk_effective_edge_154)).

0.92::acc(sm, tip_tail_width_size).
% @attr tip_tail_width_size
% @type categorical
% @canonical true
% @original_name tip_tail_width_size
% @values v292_278=292_278mm unk_tip_tail_width_size=Unknown
% @importance 0.85
0.95::true_val(tip_tail_width_size, v292_278); 0.05::true_val(tip_tail_width_size, unk_tip_tail_width_size).
measured(sm, tip_tail_width_size, v292_278).
all_consistent(tip_tail_width_size) :- consistent(sm, tip_tail_width_size).
evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v292_278)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

0.92::acc(sm, waist_width_154).
% @attr waist_width_154
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 154cm
% @values v246=246.0 unk_waist_width_154=Unknown
% @importance 0.85
0.95::true_val(waist_width_154, v246); 0.05::true_val(waist_width_154, unk_waist_width_154).
measured(sm, waist_width_154, v246).
all_consistent(waist_width_154) :- consistent(sm, waist_width_154).
evidence(all_consistent(waist_width_154)).
query(true_val(waist_width_154, v246)).
query(true_val(waist_width_154, unk_waist_width_154)).

0.92::acc(sm, sidecut_radius_size).
% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size
% @values v7_9=7.9 unk_sidecut_radius_size=Unknown
% @importance 0.85
0.95::true_val(sidecut_radius_size, v7_9); 0.05::true_val(sidecut_radius_size, unk_sidecut_radius_size).
measured(sm, sidecut_radius_size, v7_9).
all_consistent(sidecut_radius_size) :- consistent(sm, sidecut_radius_size).
evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_9)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

0.92::acc(sm, stance_width_range_size).
% @attr stance_width_range_size
% @type numeric
% @unit mm
% @canonical true
% @original_name stance_width_range_size
% @values v560=560.0 unk_stance_width_range_size=Unknown
% @importance 0.85
0.95::true_val(stance_width_range_size, v560); 0.05::true_val(stance_width_range_size, unk_stance_width_range_size).
measured(sm, stance_width_range_size, v560).
all_consistent(stance_width_range_size) :- consistent(sm, stance_width_range_size).
evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v560)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

0.92::acc(sm, recommended_weight_range_size).
% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size
% @values r54_77=54_77kg unk_recommended_weight_range_size=Unknown
% @importance 0.85
0.95::true_val(recommended_weight_range_size, r54_77); 0.05::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).
measured(sm, recommended_weight_range_size, r54_77).
all_consistent(recommended_weight_range_size) :- consistent(sm, recommended_weight_range_size).
evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, r54_77)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

0.92::acc(sm, effective_edge_161).
% @attr effective_edge_161
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 161cm
% @values v1200=1200.0 unk_effective_edge_161=Unknown
% @importance 0.85
0.95::true_val(effective_edge_161, v1200); 0.05::true_val(effective_edge_161, unk_effective_edge_161).
measured(sm, effective_edge_161, v1200).
all_consistent(effective_edge_161) :- consistent(sm, effective_edge_161).
evidence(all_consistent(effective_edge_161)).
query(true_val(effective_edge_161, v1200)).
query(true_val(effective_edge_161, unk_effective_edge_161)).

0.92::acc(sm, waist_width_161).
% @attr waist_width_161
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 161cm
% @values v252=252.0 unk_waist_width_161=Unknown
% @importance 0.85
0.95::true_val(waist_width_161, v252); 0.05::true_val(waist_width_161, unk_waist_width_161).
measured(sm, waist_width_161, v252).
all_consistent(waist_width_161) :- consistent(sm, waist_width_161).
evidence(all_consistent(waist_width_161)).
query(true_val(waist_width_161, v252)).
query(true_val(waist_width_161, unk_waist_width_161)).

0.92::acc(sm, sidecut_radius_size_161).
% @attr sidecut_radius_size_161
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (161cm)
% @values v9_1=9.1 unk_sidecut_radius_size_161=Unknown
% @importance 0.85
0.95::true_val(sidecut_radius_size_161, v9_1); 0.05::true_val(sidecut_radius_size_161, unk_sidecut_radius_size_161).
measured(sm, sidecut_radius_size_161, v9_1).
all_consistent(sidecut_radius_size_161) :- consistent(sm, sidecut_radius_size_161).
evidence(all_consistent(sidecut_radius_size_161)).
query(true_val(sidecut_radius_size_161, v9_1)).
query(true_val(sidecut_radius_size_161, unk_sidecut_radius_size_161)).

0.92::acc(sm, stance_width_range_size_161).
% @attr stance_width_range_size_161
% @type numeric
% @unit mm
% @canonical false
% @original_name stance_width_range_size (161cm)
% @values v600=600.0 unk_stance_width_range_size_161=Unknown
% @importance 0.85
0.95::true_val(stance_width_range_size_161, v600); 0.05::true_val(stance_width_range_size_161, unk_stance_width_range_size_161).
measured(sm, stance_width_range_size_161, v600).
all_consistent(stance_width_range_size_161) :- consistent(sm, stance_width_range_size_161).
evidence(all_consistent(stance_width_range_size_161)).
query(true_val(stance_width_range_size_161, v600)).
query(true_val(stance_width_range_size_161, unk_stance_width_range_size_161)).

0.92::acc(sm, recommended_weight_range_size_161).
% @attr recommended_weight_range_size_161
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (161cm)
% @values r64_86=64_86kg unk_recommended_weight_range_size_161=Unknown
% @importance 0.85
0.95::true_val(recommended_weight_range_size_161, r64_86); 0.05::true_val(recommended_weight_range_size_161, unk_recommended_weight_range_size_161).
measured(sm, recommended_weight_range_size_161, r64_86).
all_consistent(recommended_weight_range_size_161) :- consistent(sm, recommended_weight_range_size_161).
evidence(all_consistent(recommended_weight_range_size_161)).
query(true_val(recommended_weight_range_size_161, r64_86)).
query(true_val(recommended_weight_range_size_161, unk_recommended_weight_range_size_161)).

0.92::acc(sm, effective_edge_159w).
% @attr effective_edge_159w
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 159W
% @values v1180=1180.0 unk_effective_edge_159w=Unknown
% @importance 0.85
0.95::true_val(effective_edge_159w, v1180); 0.05::true_val(effective_edge_159w, unk_effective_edge_159w).
measured(sm, effective_edge_159w, v1180).
all_consistent(effective_edge_159w) :- consistent(sm, effective_edge_159w).
evidence(all_consistent(effective_edge_159w)).
query(true_val(effective_edge_159w, v1180)).
query(true_val(effective_edge_159w, unk_effective_edge_159w)).

0.92::acc(sm, waist_width_159w).
% @attr waist_width_159w
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 159W
% @values v263=263.0 unk_waist_width_159w=Unknown
% @importance 0.85
0.95::true_val(waist_width_159w, v263); 0.05::true_val(waist_width_159w, unk_waist_width_159w).
measured(sm, waist_width_159w, v263).
all_consistent(waist_width_159w) :- consistent(sm, waist_width_159w).
evidence(all_consistent(waist_width_159w)).
query(true_val(waist_width_159w, v263)).
query(true_val(waist_width_159w, unk_waist_width_159w)).

0.92::acc(sm, sidecut_radius_size_159w).
% @attr sidecut_radius_size_159w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (159W)
% @values v8_7=8.7 unk_sidecut_radius_size_159w=Unknown
% @importance 0.85
0.95::true_val(sidecut_radius_size_159w, v8_7); 0.05::true_val(sidecut_radius_size_159w, unk_sidecut_radius_size_159w).
measured(sm, sidecut_radius_size_159w, v8_7).
all_consistent(sidecut_radius_size_159w) :- consistent(sm, sidecut_radius_size_159w).
evidence(all_consistent(sidecut_radius_size_159w)).
query(true_val(sidecut_radius_size_159w, v8_7)).
query(true_val(sidecut_radius_size_159w, unk_sidecut_radius_size_159w)).

0.92::acc(sm, stance_width_range_size_159w).
% @attr stance_width_range_size_159w
% @type numeric
% @unit mm
% @canonical false
% @original_name stance_width_range_size (159W)
% @values v600_w=600.0 unk_stance_width_range_size_159w=Unknown
% @importance 0.85
0.95::true_val(stance_width_range_size_159w, v600_w); 0.05::true_val(stance_width_range_size_159w, unk_stance_width_range_size_159w).
measured(sm, stance_width_range_size_159w, v600_w).
all_consistent(stance_width_range_size_159w) :- consistent(sm, stance_width_range_size_159w).
evidence(all_consistent(stance_width_range_size_159w)).
query(true_val(stance_width_range_size_159w, v600_w)).
query(true_val(stance_width_range_size_159w, unk_stance_width_range_size_159w)).

0.92::acc(sm, recommended_weight_range_size_159w).
% @attr recommended_weight_range_size_159w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (159W)
% @values r64_86w=64_86kg unk_recommended_weight_range_size_159w=Unknown
% @importance 0.85
0.95::true_val(recommended_weight_range_size_159w, r64_86w); 0.05::true_val(recommended_weight_range_size_159w, unk_recommended_weight_range_size_159w).
measured(sm, recommended_weight_range_size_159w, r64_86w).
all_consistent(recommended_weight_range_size_159w) :- consistent(sm, recommended_weight_range_size_159w).
evidence(all_consistent(recommended_weight_range_size_159w)).
query(true_val(recommended_weight_range_size_159w, r64_86w)).
query(true_val(recommended_weight_range_size_159w, unk_recommended_weight_range_size_159w)).

0.92::acc(sm, effective_edge_162w).
% @attr effective_edge_162w
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 162W
% @values v1210=1210.0 unk_effective_edge_162w=Unknown
% @importance 0.85
0.95::true_val(effective_edge_162w, v1210); 0.05::true_val(effective_edge_162w, unk_effective_edge_162w).
measured(sm, effective_edge_162w, v1210).
all_consistent(effective_edge_162w) :- consistent(sm, effective_edge_162w).
evidence(all_consistent(effective_edge_162w)).
query(true_val(effective_edge_162w, v1210)).
query(true_val(effective_edge_162w, unk_effective_edge_162w)).

0.92::acc(sm, waist_width_162w).
% @attr waist_width_162w
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 162W
% @values v263_162w=263.0 unk_waist_width_162w=Unknown
% @importance 0.85
0.95::true_val(waist_width_162w, v263_162w); 0.05::true_val(waist_width_162w, unk_waist_width_162w).
measured(sm, waist_width_162w, v263_162w).
all_consistent(waist_width_162w) :- consistent(sm, waist_width_162w).
evidence(all_consistent(waist_width_162w)).
query(true_val(waist_width_162w, v263_162w)).
query(true_val(waist_width_162w, unk_waist_width_162w)).

0.92::acc(sm, sidecut_radius_size_162w).
% @attr sidecut_radius_size_162w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (162W)
% @values v9_3=9.3 unk_sidecut_radius_size_162w=Unknown
% @importance 0.85
0.95::true_val(sidecut_radius_size_162w, v9_3); 0.05::true_val(sidecut_radius_size_162w, unk_sidecut_radius_size_162w).
measured(sm, sidecut_radius_size_162w, v9_3).
all_consistent(sidecut_radius_size_162w) :- consistent(sm, sidecut_radius_size_162w).
evidence(all_consistent(sidecut_radius_size_162w)).
query(true_val(sidecut_radius_size_162w, v9_3)).
query(true_val(sidecut_radius_size_162w, unk_sidecut_radius_size_162w)).

0.92::acc(sm, recommended_weight_range_size_162w).
% @attr recommended_weight_range_size_162w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (162W)
% @values r73_95=73_95kg unk_recommended_weight_range_size_162w=Unknown
% @importance 0.85
0.95::true_val(recommended_weight_range_size_162w, r73_95); 0.05::true_val(recommended_weight_range_size_162w, unk_recommended_weight_range_size_162w).
measured(sm, recommended_weight_range_size_162w, r73_95).
all_consistent(recommended_weight_range_size_162w) :- consistent(sm, recommended_weight_range_size_162w).
evidence(all_consistent(recommended_weight_range_size_162w)).
query(true_val(recommended_weight_range_size_162w, r73_95)).
query(true_val(recommended_weight_range_size_162w, unk_recommended_weight_range_size_162w)).

0.85::acc(s9, board_weight_grams).
% @attr board_weight_grams
% @type numeric
% @unit g
% @canonical true
% @original_name board_weight_grams
% @values v2900=2900.0 unk_board_weight_grams=Unknown
% @importance 1.0
0.87::true_val(board_weight_grams, v2900); 0.13::true_val(board_weight_grams, unk_board_weight_grams).
measured(s9, board_weight_grams, v2900).
all_consistent(board_weight_grams) :- consistent(s9, board_weight_grams).
evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v2900)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

0.85::acc(s9, board_weight_grams_large).
% @attr board_weight_grams_large
% @type numeric
% @unit g
% @canonical false
% @original_name board_weight_grams (larger size)
% @values v3100=3100.0 unk_board_weight_grams_large=Unknown
% @importance 1.0
0.87::true_val(board_weight_grams_large, v3100); 0.13::true_val(board_weight_grams_large, unk_board_weight_grams_large).
measured(s9, board_weight_grams_large, v3100).
all_consistent(board_weight_grams_large) :- consistent(s9, board_weight_grams_large).
evidence(all_consistent(board_weight_grams_large)).
query(true_val(board_weight_grams_large, v3100)).
query(true_val(board_weight_grams_large, unk_board_weight_grams_large)).

0.90::acc(s9, user_rating_jones).
% @attr user_rating_jones
% @type numeric
% @unit /5
% @canonical false
% @original_name User rating on Jones website
% @values v4_8=4.8 unk_user_rating_jones=Unknown
% @importance 1.0
0.87::true_val(user_rating_jones, v4_8); 0.13::true_val(user_rating_jones, unk_user_rating_jones).
measured(s9, user_rating_jones, v4_8).
all_consistent(user_rating_jones) :- consistent(s9, user_rating_jones).
evidence(all_consistent(user_rating_jones)).
query(true_val(user_rating_jones, v4_8)).
query(true_val(user_rating_jones, unk_user_rating_jones)).

0.80::acc(s34, reviewer_opinion_snowboardingprofiles).
% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles
% @values ranked_num1_freeride=Ranked_number_1_freeride_snowboard_2025_2026 unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.85
0.63::true_val(reviewer_opinion_snowboardingprofiles, ranked_num1_freeride); 0.37::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).
measured(s34, reviewer_opinion_snowboardingprofiles, ranked_num1_freeride).
all_consistent(reviewer_opinion_snowboardingprofiles) :- consistent(s34, reviewer_opinion_snowboardingprofiles).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, ranked_num1_freeride)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

0.82::acc(s33, positive_aspect).
% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values excellent_stability_speed=Excellent_stability_at_speed unk_positive_aspect=Unknown
% @importance 0.9
0.63::true_val(positive_aspect, excellent_stability_speed); 0.37::true_val(positive_aspect, unk_positive_aspect).
measured(s33, positive_aspect, excellent_stability_speed).
all_consistent(positive_aspect) :- consistent(s33, positive_aspect).
evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, excellent_stability_speed)).
query(true_val(positive_aspect, unk_positive_aspect)).

0.82::acc(s33, positive_aspect_base_glide).
% @attr positive_aspect_base_glide
% @type categorical
% @canonical false
% @original_name positive_aspect (base glide)
% @values fast_base_excellent_glide=Fast_base_glide_excellent unk_positive_aspect_base_glide=Unknown
% @importance 0.9
0.63::true_val(positive_aspect_base_glide, fast_base_excellent_glide); 0.37::true_val(positive_aspect_base_glide, unk_positive_aspect_base_glide).
measured(s33, positive_aspect_base_glide, fast_base_excellent_glide).
all_consistent(positive_aspect_base_glide) :- consistent(s33, positive_aspect_base_glide).
evidence(all_consistent(positive_aspect_base_glide)).
query(true_val(positive_aspect_base_glide, fast_base_excellent_glide)).
query(true_val(positive_aspect_base_glide, unk_positive_aspect_base_glide)).

0.82::acc(s33, positive_aspect_crud_handling).
% @attr positive_aspect_crud_handling
% @type categorical
% @canonical false
% @original_name positive_aspect (crud handling)
% @values outstanding_crud_chunder=Outstanding_in_crud_chunder_no_chatter unk_positive_aspect_crud_handling=Unknown
% @importance 0.9
0.63::true_val(positive_aspect_crud_handling, outstanding_crud_chunder); 0.37::true_val(positive_aspect_crud_handling, unk_positive_aspect_crud_handling).
measured(s33, positive_aspect_crud_handling, outstanding_crud_chunder).
all_consistent(positive_aspect_crud_handling) :- consistent(s33, positive_aspect_crud_handling).
evidence(all_consistent(positive_aspect_crud_handling)).
query(true_val(positive_aspect_crud_handling, outstanding_crud_chunder)).
query(true_val(positive_aspect_crud_handling, unk_positive_aspect_crud_handling)).

0.80::acc(s28, positive_aspect_dampening).
% @attr positive_aspect_dampening
% @type categorical
% @canonical false
% @original_name positive_aspect (dampening)
% @values excellent_dampening=Excellent_dampening_ash_veneer_bcomp unk_positive_aspect_dampening=Unknown
% @importance 0.85
0.63::true_val(positive_aspect_dampening, excellent_dampening); 0.37::true_val(positive_aspect_dampening, unk_positive_aspect_dampening).
measured(s28, positive_aspect_dampening, excellent_dampening).
all_consistent(positive_aspect_dampening) :-
    (indep(s28), consistent(s28, positive_aspect_dampening) ; \+indep(s28)).
evidence(all_consistent(positive_aspect_dampening)).
query(true_val(positive_aspect_dampening, excellent_dampening)).
query(true_val(positive_aspect_dampening, unk_positive_aspect_dampening)).

0.80::acc(s31, positive_aspect_nimble).
% @attr positive_aspect_nimble
% @type categorical
% @canonical false
% @original_name positive_aspect (nimble)
% @values surprisingly_nimble=Surprisingly_nimble_in_tight_terrain unk_positive_aspect_nimble=Unknown
% @importance 0.85
0.68::true_val(positive_aspect_nimble, surprisingly_nimble); 0.32::true_val(positive_aspect_nimble, unk_positive_aspect_nimble).
measured(s31, positive_aspect_nimble, surprisingly_nimble).
all_consistent(positive_aspect_nimble) :-
    (indep(s31), consistent(s31, positive_aspect_nimble) ; \+indep(s31)).
evidence(all_consistent(positive_aspect_nimble)).
query(true_val(positive_aspect_nimble, surprisingly_nimble)).
query(true_val(positive_aspect_nimble, unk_positive_aspect_nimble)).

0.85::acc(s17, positive_aspect_forgiving).
% @attr positive_aspect_forgiving
% @type categorical
% @canonical false
% @original_name positive_aspect (forgiving)
% @values forgiving_for_stiffness=Forgiving_for_stiffness_easy_skid_turn unk_positive_aspect_forgiving=Unknown
% @importance 0.9
0.77::true_val(positive_aspect_forgiving, forgiving_for_stiffness); 0.23::true_val(positive_aspect_forgiving, unk_positive_aspect_forgiving).
measured(s17, positive_aspect_forgiving, forgiving_for_stiffness).
all_consistent(positive_aspect_forgiving) :- consistent(s17, positive_aspect_forgiving).
evidence(all_consistent(positive_aspect_forgiving)).
query(true_val(positive_aspect_forgiving, forgiving_for_stiffness)).
query(true_val(positive_aspect_forgiving, unk_positive_aspect_forgiving)).

0.82::acc(s33, positive_aspect_powder_float).
% @attr positive_aspect_powder_float
% @type categorical
% @canonical false
% @original_name positive_aspect (powder float)
% @values excellent_powder_float=Excellent_powder_float_shape_taper_setback_3d unk_positive_aspect_powder_float=Unknown
% @importance 0.9
0.63::true_val(positive_aspect_powder_float, excellent_powder_float); 0.37::true_val(positive_aspect_powder_float, unk_positive_aspect_powder_float).
measured(s33, positive_aspect_powder_float, excellent_powder_float).
all_consistent(positive_aspect_powder_float) :- consistent(s33, positive_aspect_powder_float).
evidence(all_consistent(positive_aspect_powder_float)).
query(true_val(positive_aspect_powder_float, excellent_powder_float)).
query(true_val(positive_aspect_powder_float, unk_positive_aspect_powder_float)).

0.78::acc(s35, positive_aspect_build_quality).
% @attr positive_aspect_build_quality
% @type categorical
% @canonical false
% @original_name positive_aspect (build quality)
% @values solid_build=Build_quality_solid_nothing_rattles unk_positive_aspect_build_quality=Unknown
% @importance 0.85
0.55::true_val(positive_aspect_build_quality, solid_build); 0.45::true_val(positive_aspect_build_quality, unk_positive_aspect_build_quality).
measured(s35, positive_aspect_build_quality, solid_build).
all_consistent(positive_aspect_build_quality) :- consistent(s35, positive_aspect_build_quality).
evidence(all_consistent(positive_aspect_build_quality)).
query(true_val(positive_aspect_build_quality, solid_build)).
query(true_val(positive_aspect_build_quality, unk_positive_aspect_build_quality)).

0.78::acc(s35, positive_aspect_longevity).
% @attr positive_aspect_longevity
% @type categorical
% @canonical false
% @original_name positive_aspect (longevity)
% @values buy_to_keep=Feels_like_a_board_you_buy_to_keep_for_years unk_positive_aspect_longevity=Unknown
% @importance 0.85
0.55::true_val(positive_aspect_longevity, buy_to_keep); 0.45::true_val(positive_aspect_longevity, unk_positive_aspect_longevity).
measured(s35, positive_aspect_longevity, buy_to_keep).
all_consistent(positive_aspect_longevity) :- consistent(s35, positive_aspect_longevity).
evidence(all_consistent(positive_aspect_longevity)).
query(true_val(positive_aspect_longevity, buy_to_keep)).
query(true_val(positive_aspect_longevity, unk_positive_aspect_longevity)).

0.82::acc(s33, negative_aspect).
% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values not_for_park_jib=Not_suitable_for_park_or_jibbing unk_negative_aspect=Unknown
% @importance 0.9
0.63::true_val(negative_aspect, not_for_park_jib); 0.37::true_val(negative_aspect, unk_negative_aspect).
measured(s33, negative_aspect, not_for_park_jib).
all_consistent(negative_aspect) :- consistent(s33, negative_aspect).
evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, not_for_park_jib)).
query(true_val(negative_aspect, unk_negative_aspect)).

0.85::acc(s17, negative_aspect_wide_stance).
% @attr negative_aspect_wide_stance
% @type categorical
% @canonical false
% @original_name negative_aspect (wide stance)
% @values ref_stance_very_wide=Reference_stance_is_very_wide unk_negative_aspect_wide_stance=Unknown
% @importance 0.9
0.77::true_val(negative_aspect_wide_stance, ref_stance_very_wide); 0.23::true_val(negative_aspect_wide_stance, unk_negative_aspect_wide_stance).
measured(s17, negative_aspect_wide_stance, ref_stance_very_wide).
all_consistent(negative_aspect_wide_stance) :- consistent(s17, negative_aspect_wide_stance).
evidence(all_consistent(negative_aspect_wide_stance)).
query(true_val(negative_aspect_wide_stance, ref_stance_very_wide)).
query(true_val(negative_aspect_wide_stance, unk_negative_aspect_wide_stance)).

0.85::acc(s17, negative_aspect_float_pack).
% @attr negative_aspect_float_pack
% @type categorical
% @canonical false
% @original_name negative_aspect (float pack)
% @values inserts_far_apart=Float_Pack_inserts_far_apart_limiting unk_negative_aspect_float_pack=Unknown
% @importance 0.9
0.77::true_val(negative_aspect_float_pack, inserts_far_apart); 0.23::true_val(negative_aspect_float_pack, unk_negative_aspect_float_pack).
measured(s17, negative_aspect_float_pack, inserts_far_apart).
all_consistent(negative_aspect_float_pack) :- consistent(s17, negative_aspect_float_pack).
evidence(all_consistent(negative_aspect_float_pack)).
query(true_val(negative_aspect_float_pack, inserts_far_apart)).
query(true_val(negative_aspect_float_pack, unk_negative_aspect_float_pack)).

0.85::acc(s17, negative_aspect_washy_carving).
% @attr negative_aspect_washy_carving
% @type categorical
% @canonical false
% @original_name negative_aspect (washy carving)
% @values touch_washy_hard_carves=Touch_washy_on_hard_carving_due_to_spoon_tech unk_negative_aspect_washy_carving=Unknown
% @importance 0.9
0.77::true_val(negative_aspect_washy_carving, touch_washy_hard_carves); 0.23::true_val(negative_aspect_washy_carving, unk_negative_aspect_washy_carving).
measured(s17, negative_aspect_washy_carving, touch_washy_hard_carves).
all_consistent(negative_aspect_washy_carving) :- consistent(s17, negative_aspect_washy_carving).
evidence(all_consistent(negative_aspect_washy_carving)).
query(true_val(negative_aspect_washy_carving, touch_washy_hard_carves)).
query(true_val(negative_aspect_washy_carving, unk_negative_aspect_washy_carving)).

0.78::acc(s35, negative_aspect_pop).
% @attr negative_aspect_pop
% @type categorical
% @canonical false
% @original_name negative_aspect (pop)
% @values pop_requires_effort=Pop_requires_effort_load_tail_properly unk_negative_aspect_pop=Unknown
% @importance 0.85
0.55::true_val(negative_aspect_pop, pop_requires_effort); 0.45::true_val(negative_aspect_pop, unk_negative_aspect_pop).
measured(s35, negative_aspect_pop, pop_requires_effort).
all_consistent(negative_aspect_pop) :- consistent(s35, negative_aspect_pop).
evidence(all_consistent(negative_aspect_pop)).
query(true_val(negative_aspect_pop, pop_requires_effort)).
query(true_val(negative_aspect_pop, unk_negative_aspect_pop)).

0.75::acc(s36, negative_aspect_price).
% @attr negative_aspect_price
% @type categorical
% @canonical false
% @original_name negative_aspect (price)
% @values high_price_limits_value=High_price_limits_value_unless_freeride_primary unk_negative_aspect_price=Unknown
% @importance 0.75
0.51::true_val(negative_aspect_price, high_price_limits_value); 0.49::true_val(negative_aspect_price, unk_negative_aspect_price).
measured(s36, negative_aspect_price, high_price_limits_value).
all_consistent(negative_aspect_price) :- consistent(s36, negative_aspect_price).
evidence(all_consistent(negative_aspect_price)).
query(true_val(negative_aspect_price, high_price_limits_value)).
query(true_val(negative_aspect_price, unk_negative_aspect_price)).

0.50::acc(s37, negative_aspect_topsheet_wear).
% @attr negative_aspect_topsheet_wear
% @type categorical
% @canonical false
% @original_name negative_aspect (topsheet wear)
% @values cosmetic_wear=Topsheet_can_show_cosmetic_wear unk_negative_aspect_topsheet_wear=Unknown
% @importance 0.6
0.23::true_val(negative_aspect_topsheet_wear, cosmetic_wear); 0.77::true_val(negative_aspect_topsheet_wear, unk_negative_aspect_topsheet_wear).
measured(s37, negative_aspect_topsheet_wear, cosmetic_wear).
all_consistent(negative_aspect_topsheet_wear) :- consistent(s37, negative_aspect_topsheet_wear).
evidence(all_consistent(negative_aspect_topsheet_wear)).
query(true_val(negative_aspect_topsheet_wear, cosmetic_wear)).
query(true_val(negative_aspect_topsheet_wear, unk_negative_aspect_topsheet_wear)).

0.85::acc(s17, on_snow_feel_tgr).
% @attr on_snow_feel_tgr
% @type categorical
% @canonical false
% @original_name on_snow_feel_tgr
% @values stable=Stable unk_on_snow_feel_tgr=Unknown
% @importance 0.9
0.77::true_val(on_snow_feel_tgr, stable); 0.23::true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr).
measured(s17, on_snow_feel_tgr, stable).
all_consistent(on_snow_feel_tgr) :- consistent(s17, on_snow_feel_tgr).
evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, stable)).
query(true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr)).

0.85::acc(s17, turn_initiation_performance).
% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values medium_fast=Medium_Fast unk_turn_initiation_performance=Unknown
% @importance 0.9
0.77::true_val(turn_initiation_performance, medium_fast); 0.23::true_val(turn_initiation_performance, unk_turn_initiation_performance).
measured(s17, turn_initiation_performance, medium_fast).
all_consistent(turn_initiation_performance) :- consistent(s17, turn_initiation_performance).
evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, medium_fast)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

0.85::acc(s17, reviewer_opinion_the_good_ride).
% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values semi_easy=Semi_Easy unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.9
0.77::true_val(reviewer_opinion_the_good_ride, semi_easy); 0.23::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).
measured(s17, reviewer_opinion_the_good_ride, semi_easy).
all_consistent(reviewer_opinion_the_good_ride) :- consistent(s17, reviewer_opinion_the_good_ride).
evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, semi_easy)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

0.85::acc(s17, reviewer_opinion_the_good_ride_2).
% @attr reviewer_opinion_the_good_ride_2
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (second rating)
% @values semi_hard=Semi_Hard unk_reviewer_opinion_the_good_ride_2=Unknown
% @importance 0.9
0.77::true_val(reviewer_opinion_the_good_ride_2, semi_hard); 0.23::true_val(reviewer_opinion_the_good_ride_2, unk_reviewer_opinion_the_good_ride_2).
measured(s17, reviewer_opinion_the_good_ride_2, semi_hard).
all_consistent(reviewer_opinion_the_good_ride_2) :- consistent(s17, reviewer_opinion_the_good_ride_2).
evidence(all_consistent(reviewer_opinion_the_good_ride_2)).
query(true_val(reviewer_opinion_the_good_ride_2, semi_hard)).
query(true_val(reviewer_opinion_the_good_ride_2, unk_reviewer_opinion_the_good_ride_2)).

0.85::acc(s17, edge_hold).
% @attr edge_hold
% @type categorical
% @canonical false
% @original_name edge_hold
% @values hard_snow_capable=Hard_snow_capable unk_edge_hold=Unknown
% @importance 0.9
0.77::true_val(edge_hold, hard_snow_capable); 0.23::true_val(edge_hold, unk_edge_hold).
measured(s17, edge_hold, hard_snow_capable).
all_consistent(edge_hold) :- consistent(s17, edge_hold).
evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, hard_snow_capable)).
query(true_val(edge_hold, unk_edge_hold)).

0.85::acc(s31, speed_rating_tgr).
% @attr speed_rating_tgr
% @type categorical
% @canonical false
% @original_name speed_rating_tgr
% @values great_no_speed_limit=Great_no_speed_limit unk_speed_rating_tgr=Unknown
% @importance 0.85
0.68::true_val(speed_rating_tgr, great_no_speed_limit); 0.32::true_val(speed_rating_tgr, unk_speed_rating_tgr).
measured(s31, speed_rating_tgr, great_no_speed_limit).
all_consistent(speed_rating_tgr) :-
    (indep(s31), consistent(s31, speed_rating_tgr) ; \+indep(s31)).
evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, great_no_speed_limit)).
query(true_val(speed_rating_tgr, unk_speed_rating_tgr)).

0.85::acc(s17, powder_rating_tgr).
% @attr powder_rating_tgr
% @type categorical
% @canonical false
% @original_name powder_rating_tgr
% @values great=Great unk_powder_rating_tgr=Unknown
% @importance 0.9
0.77::true_val(powder_rating_tgr, great); 0.23::true_val(powder_rating_tgr, unk_powder_rating_tgr).
measured(s17, powder_rating_tgr, great).
all_consistent(powder_rating_tgr) :- consistent(s17, powder_rating_tgr).
evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, great)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

0.85::acc(s17, switch_riding).
% @attr switch_riding
% @type categorical
% @canonical false
% @original_name switch_riding
% @values average=Average unk_switch_riding=Unknown
% @importance 0.9
0.77::true_val(switch_riding, average); 0.23::true_val(switch_riding, unk_switch_riding).
measured(s17, switch_riding, average).
all_consistent(switch_riding) :- consistent(s17, switch_riding).
evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, average)).
query(true_val(switch_riding, unk_switch_riding)).

0.85::acc(s17, jumps_rating_tgr).
% @attr jumps_rating_tgr
% @type categorical
% @canonical false
% @original_name jumps_rating_tgr
% @values good=Good unk_jumps_rating_tgr=Unknown
% @importance 0.9
0.77::true_val(jumps_rating_tgr, good); 0.23::true_val(jumps_rating_tgr, unk_jumps_rating_tgr).
measured(s17, jumps_rating_tgr, good).
all_consistent(jumps_rating_tgr) :- consistent(s17, jumps_rating_tgr).
evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, good)).
query(true_val(jumps_rating_tgr, unk_jumps_rating_tgr)).

0.85::acc(s17, jibbing_rating_tgr).
% @attr jibbing_rating_tgr
% @type categorical
% @canonical false
% @original_name jibbing_rating_tgr
% @values poor=Poor unk_jibbing_rating_tgr=Unknown
% @importance 0.9
0.77::true_val(jibbing_rating_tgr, poor); 0.23::true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr).
measured(s17, jibbing_rating_tgr, poor).
all_consistent(jibbing_rating_tgr) :- consistent(s17, jibbing_rating_tgr).
evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, poor)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr)).

0.85::acc(s17, pipe_rating_tgr).
% @attr pipe_rating_tgr
% @type categorical
% @canonical false
% @original_name pipe_rating_tgr
% @values good_pipe=Good unk_pipe_rating_tgr=Unknown
% @importance 0.9
0.77::true_val(pipe_rating_tgr, good_pipe); 0.23::true_val(pipe_rating_tgr, unk_pipe_rating_tgr).
measured(s17, pipe_rating_tgr, good_pipe).
all_consistent(pipe_rating_tgr) :- consistent(s17, pipe_rating_tgr).
evidence(all_consistent(pipe_rating_tgr)).
query(true_val(pipe_rating_tgr, good_pipe)).
query(true_val(pipe_rating_tgr, unk_pipe_rating_tgr)).

0.80::acc(s33, perceived_weight).
% @attr perceived_weight
% @type categorical
% @canonical false
% @original_name Perceived weight
% @values feels_normal=Feels_normal_on_snow unk_perceived_weight=Unknown
% @importance 0.9
0.63::true_val(perceived_weight, feels_normal); 0.37::true_val(perceived_weight, unk_perceived_weight).
measured(s33, perceived_weight, feels_normal).
all_consistent(perceived_weight) :- consistent(s33, perceived_weight).
evidence(all_consistent(perceived_weight)).
query(true_val(perceived_weight, feels_normal)).
query(true_val(perceived_weight, unk_perceived_weight)).

0.85::acc(s17, comparable_board_cross_brand).
% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values amplid_k2_yes_weston_cardiff_united=Amplid_Souly_Grail_K2_Alchemist_YES_PYL_Weston_Cardiff_United unk_comparable_board_cross_brand=Unknown
% @importance 0.9
0.77::true_val(comparable_board_cross_brand, amplid_k2_yes_weston_cardiff_united); 0.23::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).
measured(s17, comparable_board_cross_brand, amplid_k2_yes_weston_cardiff_united).
all_consistent(comparable_board_cross_brand) :- consistent(s17, comparable_board_cross_brand).
evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, amplid_k2_yes_weston_cardiff_united)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

0.85::acc(s28, comparable_board_same_brand).
% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values stratos_7_10_flex_hybrid=Stratos_7_10_flex_all_conditions_hybrid unk_comparable_board_same_brand=Unknown
% @importance 0.85
0.63::true_val(comparable_board_same_brand, stratos_7_10_flex_hybrid); 0.37::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).
measured(s28, comparable_board_same_brand, stratos_7_10_flex_hybrid).
all_consistent(comparable_board_same_brand) :-
    (indep(s28), consistent(s28, comparable_board_same_brand) ; \+indep(s28)).
evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, stratos_7_10_flex_hybrid)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

0.85::acc(s28, comparable_board_same_brand_pro).
% @attr comparable_board_same_brand_pro
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Pro)
% @values flagship_pro_koroyd_5_5=Pro_adds_Koroyd_Carbon_Innegra_5_5_flex unk_comparable_board_same_brand_pro=Unknown
% @importance 0.85
0.63::true_val(comparable_board_same_brand_pro, flagship_pro_koroyd_5_5); 0.37::true_val(comparable_board_same_brand_pro, unk_comparable_board_same_brand_pro).
measured(s28, comparable_board_same_brand_pro, flagship_pro_koroyd_5_5).
all_consistent(comparable_board_same_brand_pro) :-
    (indep(s28), consistent(s28, comparable_board_same_brand_pro) ; \+indep(s28)).
evidence(all_consistent(comparable_board_same_brand_pro)).
query(true_val(comparable_board_same_brand_pro, flagship_pro_koroyd_5_5)).
query(true_val(comparable_board_same_brand_pro, unk_comparable_board_same_brand_pro)).

0.85::acc(s17, comparable_board_same_brand_pro_price).
% @attr comparable_board_same_brand_pro_price
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Pro price comparison)
% @values pro_899_95_worth_upgrade=Pro_899_95_vs_749_95_TGR_says_worth_upgrade unk_comparable_board_same_brand_pro_price=Unknown
% @importance 0.9
0.77::true_val(comparable_board_same_brand_pro_price, pro_899_95_worth_upgrade); 0.23::true_val(comparable_board_same_brand_pro_price, unk_comparable_board_same_brand_pro_price).
measured(s17, comparable_board_same_brand_pro_price, pro_899_95_worth_upgrade).
all_consistent(comparable_board_same_brand_pro_price) :- consistent(s17, comparable_board_same_brand_pro_price).
evidence(all_consistent(comparable_board_same_brand_pro_price)).
query(true_val(comparable_board_same_brand_pro_price, pro_899_95_worth_upgrade)).
query(true_val(comparable_board_same_brand_pro_price, unk_comparable_board_same_brand_pro_price)).

0.85::acc(s17, comparable_board_cross_brand_amplid).
% @attr comparable_board_cross_brand_amplid
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (vs Amplid)
% @values flagship_better_float_speed=Flagship_edges_out_on_powder_float_base_speed unk_comparable_board_cross_brand_amplid=Unknown
% @importance 0.9
0.77::true_val(comparable_board_cross_brand_amplid, flagship_better_float_speed); 0.23::true_val(comparable_board_cross_brand_amplid, unk_comparable_board_cross_brand_amplid).
measured(s17, comparable_board_cross_brand_amplid, flagship_better_float_speed).
all_consistent(comparable_board_cross_brand_amplid) :- consistent(s17, comparable_board_cross_brand_amplid).
evidence(all_consistent(comparable_board_cross_brand_amplid)).
query(true_val(comparable_board_cross_brand_amplid, flagship_better_float_speed)).
query(true_val(comparable_board_cross_brand_amplid, unk_comparable_board_cross_brand_amplid)).

0.80::acc(s34, comparable_board_cross_brand_yes_pyl).
% @attr comparable_board_cross_brand_yes_pyl
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (YES PYL)
% @values pyl_better_value=Both_freeride_favorites_PYL_better_value unk_comparable_board_cross_brand_yes_pyl=Unknown
% @importance 0.85
0.63::true_val(comparable_board_cross_brand_yes_pyl, pyl_better_value); 0.37::true_val(comparable_board_cross_brand_yes_pyl, unk_comparable_board_cross_brand_yes_pyl).
measured(s34, comparable_board_cross_brand_yes_pyl, pyl_better_value).
all_consistent(comparable_board_cross_brand_yes_pyl) :- consistent(s34, comparable_board_cross_brand_yes_pyl).
evidence(all_consistent(comparable_board_cross_brand_yes_pyl)).
query(true_val(comparable_board_cross_brand_yes_pyl, pyl_better_value)).
query(true_val(comparable_board_cross_brand_yes_pyl, unk_comparable_board_cross_brand_yes_pyl)).

0.80::acc(s34, comparable_board_cross_brand_valhalla).
% @attr comparable_board_cross_brand_valhalla
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Valhalla)
% @values valhalla_num2_more_versatile=Valhalla_rated_num2_more_versatile_across_speeds unk_comparable_board_cross_brand_valhalla=Unknown
% @importance 0.85
0.63::true_val(comparable_board_cross_brand_valhalla, valhalla_num2_more_versatile); 0.37::true_val(comparable_board_cross_brand_valhalla, unk_comparable_board_cross_brand_valhalla).
measured(s34, comparable_board_cross_brand_valhalla, valhalla_num2_more_versatile).
all_consistent(comparable_board_cross_brand_valhalla) :- consistent(s34, comparable_board_cross_brand_valhalla).
evidence(all_consistent(comparable_board_cross_brand_valhalla)).
query(true_val(comparable_board_cross_brand_valhalla, valhalla_num2_more_versatile)).
query(true_val(comparable_board_cross_brand_valhalla, unk_comparable_board_cross_brand_valhalla)).

0.82::acc(s38, reviewer_opinion_the_good_ride_3).
% @attr reviewer_opinion_the_good_ride_3
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (Pro top freeride)
% @values pro_top_freeride=Lists_Flagship_Pro_as_top_freeride_board unk_reviewer_opinion_the_good_ride_3=Unknown
% @importance 0.8
0.60::true_val(reviewer_opinion_the_good_ride_3, pro_top_freeride); 0.40::true_val(reviewer_opinion_the_good_ride_3, unk_reviewer_opinion_the_good_ride_3).
measured(s38, reviewer_opinion_the_good_ride_3, pro_top_freeride).
all_consistent(reviewer_opinion_the_good_ride_3) :- consistent(s38, reviewer_opinion_the_good_ride_3).
evidence(all_consistent(reviewer_opinion_the_good_ride_3)).
query(true_val(reviewer_opinion_the_good_ride_3, pro_top_freeride)).
query(true_val(reviewer_opinion_the_good_ride_3, unk_reviewer_opinion_the_good_ride_3)).

0.90::acc(s9, sustainability_certification_bio_resin).
% @attr sustainability_certification_bio_resin
% @type categorical
% @canonical false
% @original_name sustainability_certification (bio resin)
% @values plant_27pct_33pct_less_ghg=27pct_plant_carbon_33pct_less_GHG unk_sustainability_certification_bio_resin=Unknown
% @importance 1.0
0.87::true_val(sustainability_certification_bio_resin, plant_27pct_33pct_less_ghg); 0.13::true_val(sustainability_certification_bio_resin, unk_sustainability_certification_bio_resin).
measured(s9, sustainability_certification_bio_resin, plant_27pct_33pct_less_ghg).
all_consistent(sustainability_certification_bio_resin) :- consistent(s9, sustainability_certification_bio_resin).
evidence(all_consistent(sustainability_certification_bio_resin)).
query(true_val(sustainability_certification_bio_resin, plant_27pct_33pct_less_ghg)).
query(true_val(sustainability_certification_bio_resin, unk_sustainability_certification_bio_resin)).

0.90::acc(s9, sustainability_certification_recycled_plastic).
% @attr sustainability_certification_recycled_plastic
% @type categorical
% @canonical false
% @original_name sustainability_certification (recycled plastic)
% @values only_recycled_plastic=Uses_only_recycled_plastic unk_sustainability_certification_recycled_plastic=Unknown
% @importance 1.0
0.87::true_val(sustainability_certification_recycled_plastic, only_recycled_plastic); 0.13::true_val(sustainability_certification_recycled_plastic, unk_sustainability_certification_recycled_plastic).
measured(s9, sustainability_certification_recycled_plastic, only_recycled_plastic).
all_consistent(sustainability_certification_recycled_plastic) :- consistent(s9, sustainability_certification_recycled_plastic).
evidence(all_consistent(sustainability_certification_recycled_plastic)).
query(true_val(sustainability_certification_recycled_plastic, only_recycled_plastic)).
query(true_val(sustainability_certification_recycled_plastic, unk_sustainability_certification_recycled_plastic)).

0.90::acc(s9, sustainability_certification_recycled_steel).
% @attr sustainability_certification_recycled_steel
% @type categorical
% @canonical false
% @original_name sustainability_certification (recycled steel)
% @values recycled_german_steel_edges=Made_from_recycled_German_steel unk_sustainability_certification_recycled_steel=Unknown
% @importance 1.0
0.87::true_val(sustainability_certification_recycled_steel, recycled_german_steel_edges); 0.13::true_val(sustainability_certification_recycled_steel, unk_sustainability_certification_recycled_steel).
measured(s9, sustainability_certification_recycled_steel, recycled_german_steel_edges).
all_consistent(sustainability_certification_recycled_steel) :- consistent(s9, sustainability_certification_recycled_steel).
evidence(all_consistent(sustainability_certification_recycled_steel)).
query(true_val(sustainability_certification_recycled_steel, recycled_german_steel_edges)).
query(true_val(sustainability_certification_recycled_steel, unk_sustainability_certification_recycled_steel)).

0.90::acc(s9, sustainability_certification_responsible_harvest).
% @attr sustainability_certification_responsible_harvest
% @type categorical
% @canonical false
% @original_name sustainability_certification (responsible harvest)
% @values responsibly_harvested=Responsibly_harvested_materials unk_sustainability_certification_responsible_harvest=Unknown
% @importance 1.0
0.87::true_val(sustainability_certification_responsible_harvest, responsibly_harvested); 0.13::true_val(sustainability_certification_responsible_harvest, unk_sustainability_certification_responsible_harvest).
measured(s9, sustainability_certification_responsible_harvest, responsibly_harvested).
all_consistent(sustainability_certification_responsible_harvest) :- consistent(s9, sustainability_certification_responsible_harvest).
evidence(all_consistent(sustainability_certification_responsible_harvest)).
query(true_val(sustainability_certification_responsible_harvest, responsibly_harvested)).
query(true_val(sustainability_certification_responsible_harvest, unk_sustainability_certification_responsible_harvest)).

0.90::acc(s9, sustainability_certification_board_recycling).
% @attr sustainability_certification_board_recycling
% @type categorical
% @canonical false
% @original_name sustainability_certification (board recycling)
% @values recycle_50_credit=Dead_boards_recycled_for_50_toward_new unk_sustainability_certification_board_recycling=Unknown
% @importance 1.0
0.87::true_val(sustainability_certification_board_recycling, recycle_50_credit); 0.13::true_val(sustainability_certification_board_recycling, unk_sustainability_certification_board_recycling).
measured(s9, sustainability_certification_board_recycling, recycle_50_credit).
all_consistent(sustainability_certification_board_recycling) :- consistent(s9, sustainability_certification_board_recycling).
evidence(all_consistent(sustainability_certification_board_recycling)).
query(true_val(sustainability_certification_board_recycling, recycle_50_credit)).
query(true_val(sustainability_certification_board_recycling, unk_sustainability_certification_board_recycling)).

0.82::acc(s13, sustainability_certification_fair_wages).
% @attr sustainability_certification_fair_wages
% @type categorical
% @canonical false
% @original_name sustainability_certification (fair wages)
% @values sws_certified_fair_wages=SWS_factory_certified_worker_empowerment_fair_wages unk_sustainability_certification_fair_wages=Unknown
% @importance 0.6
0.72::true_val(sustainability_certification_fair_wages, sws_certified_fair_wages); 0.28::true_val(sustainability_certification_fair_wages, unk_sustainability_certification_fair_wages).
measured(s13, sustainability_certification_fair_wages, sws_certified_fair_wages).
all_consistent(sustainability_certification_fair_wages) :- consistent(s13, sustainability_certification_fair_wages).
evidence(all_consistent(sustainability_certification_fair_wages)).
query(true_val(sustainability_certification_fair_wages, sws_certified_fair_wages)).
query(true_val(sustainability_certification_fair_wages, unk_sustainability_certification_fair_wages)).

0.90::acc(s9, retailer_jones_direct).
% @attr retailer_jones_direct
% @type categorical
% @canonical false
% @original_name Jones Snowboards direct retailer info
% @values mfr_store_free_ship_30day=Manufacturer_store_free_shipping_over_100_30day_returns unk_retailer_jones_direct=Unknown
% @importance 1.0
0.87::true_val(retailer_jones_direct, mfr_store_free_ship_30day); 0.13::true_val(retailer_jones_direct, unk_retailer_jones_direct).
measured(s9, retailer_jones_direct, mfr_store_free_ship_30day).
all_consistent(retailer_jones_direct) :- consistent(s9, retailer_jones_direct).
evidence(all_consistent(retailer_jones_direct)).
query(true_val(retailer_jones_direct, mfr_store_free_ship_30day)).
query(true_val(retailer_jones_direct, unk_retailer_jones_direct)).

0.78::acc(s23, retailer_evo).
% @attr retailer_evo
% @type categorical
% @canonical false
% @original_name evo retailer info
% @values major_us_price_match_5pct=Major_US_retailer_price_match_beat_5pct unk_retailer_evo=Unknown
% @importance 0.8
0.60::true_val(retailer_evo, major_us_price_match_5pct); 0.40::true_val(retailer_evo, unk_retailer_evo).
measured(s23, retailer_evo, major_us_price_match_5pct).
all_consistent(retailer_evo) :- consistent(s23, retailer_evo).
evidence(all_consistent(retailer_evo)).
query(true_val(retailer_evo, major_us_price_match_5pct)).
query(true_val(retailer_evo, unk_retailer_evo)).

0.75::acc(s25, retailer_rei).
% @attr retailer_rei
% @type categorical
% @canonical false
% @original_name REI retailer info
% @values major_us_coop_strong_returns=Major_US_outdoor_coop_strong_return_policy unk_retailer_rei=Unknown
% @importance 0.75
0.56::true_val(retailer_rei, major_us_coop_strong_returns); 0.44::true_val(retailer_rei, unk_retailer_rei).
measured(s25, retailer_rei, major_us_coop_strong_returns).
all_consistent(retailer_rei) :- consistent(s25, retailer_rei).
evidence(all_consistent(retailer_rei)).
query(true_val(retailer_rei, major_us_coop_strong_returns)).
query(true_val(retailer_rei, unk_retailer_rei)).

0.78::acc(s24, retailer_backcountry).
% @attr retailer_backcountry
% @type categorical
% @canonical false
% @original_name Backcountry retailer info
% @values major_us_specialty_snow=Major_US_specialty_retailer_snow_sports unk_retailer_backcountry=Unknown
% @importance 0.85
0.56::true_val(retailer_backcountry, major_us_specialty_snow); 0.44::true_val(retailer_backcountry, unk_retailer_backcountry).
measured(s24, retailer_backcountry, major_us_specialty_snow).
all_consistent(retailer_backcountry) :- consistent(s24, retailer_backcountry).
evidence(all_consistent(retailer_backcountry)).
query(true_val(retailer_backcountry, major_us_specialty_snow)).
query(true_val(retailer_backcountry, unk_retailer_backcountry)).

0.78::acc(s24, retailer_tactics).
% @attr retailer_tactics
% @type categorical
% @canonical false
% @original_name Tactics retailer info
% @values core_boardshop_well_regarded=Core_boardshop_well_regarded unk_retailer_tactics=Unknown
% @importance 0.85
0.56::true_val(retailer_tactics, core_boardshop_well_regarded); 0.44::true_val(retailer_tactics, unk_retailer_tactics).
measured(s24, retailer_tactics, core_boardshop_well_regarded).
all_consistent(retailer_tactics) :- consistent(s24, retailer_tactics).
evidence(all_consistent(retailer_tactics)).
query(true_val(retailer_tactics, core_boardshop_well_regarded)).
query(true_val(retailer_tactics, unk_retailer_tactics)).

0.75::acc(s21, retailer_twelve_board_store).
% @attr retailer_twelve_board_store
% @type categorical
% @canonical false
% @original_name Twelve Board Store retailer info
% @values au_authorized_free_ship_price_match=Australian_authorized_Jones_dealer_free_shipping_price_match unk_retailer_twelve_board_store=Unknown
% @importance 0.6
0.60::true_val(retailer_twelve_board_store, au_authorized_free_ship_price_match); 0.40::true_val(retailer_twelve_board_store, unk_retailer_twelve_board_store).
measured(s21, retailer_twelve_board_store, au_authorized_free_ship_price_match).
all_consistent(retailer_twelve_board_store) :- consistent(s21, retailer_twelve_board_store).
evidence(all_consistent(retailer_twelve_board_store)).
query(true_val(retailer_twelve_board_store, au_authorized_free_ship_price_match)).
query(true_val(retailer_twelve_board_store, unk_retailer_twelve_board_store)).

0.72::acc(s22, retailer_ballistyx).
% @attr retailer_ballistyx
% @type categorical
% @canonical false
% @original_name Ballistyx retailer info
% @values melb_since_1991_authorized=Trusted_Melbourne_store_since_1991_authorized unk_retailer_ballistyx=Unknown
% @importance 0.55
0.52::true_val(retailer_ballistyx, melb_since_1991_authorized); 0.48::true_val(retailer_ballistyx, unk_retailer_ballistyx).
measured(s22, retailer_ballistyx, melb_since_1991_authorized).
all_consistent(retailer_ballistyx) :- consistent(s22, retailer_ballistyx).
evidence(all_consistent(retailer_ballistyx)).
query(true_val(retailer_ballistyx, melb_since_1991_authorized)).
query(true_val(retailer_ballistyx, unk_retailer_ballistyx)).

0.80::acc(s19, retailer_milosport).
% @attr retailer_milosport
% @type categorical
% @canonical false
% @original_name Milosport retailer info
% @values established_slc_pickup=Established_SLC_boardshop_in_store_pickup unk_retailer_milosport=Unknown
% @importance 0.85
0.71::true_val(retailer_milosport, established_slc_pickup); 0.29::true_val(retailer_milosport, unk_retailer_milosport).
measured(s19, retailer_milosport, established_slc_pickup).
all_consistent(retailer_milosport) :- consistent(s19, retailer_milosport).
evidence(all_consistent(retailer_milosport)).
query(true_val(retailer_milosport, established_slc_pickup)).
query(true_val(retailer_milosport, unk_retailer_milosport)).

0.80::acc(s31, retailer_ski_monster).
% @attr retailer_ski_monster
% @type categorical
% @canonical false
% @original_name The Ski Monster retailer info
% @values boston_specialty_expert_staff=Boston_specialty_shop_expert_staff_test_products unk_retailer_ski_monster=Unknown
% @importance 0.85
0.68::true_val(retailer_ski_monster, boston_specialty_expert_staff); 0.32::true_val(retailer_ski_monster, unk_retailer_ski_monster).
measured(s31, retailer_ski_monster, boston_specialty_expert_staff).
all_consistent(retailer_ski_monster) :-
    (indep(s31), consistent(s31, retailer_ski_monster) ; \+indep(s31)).
evidence(all_consistent(retailer_ski_monster)).
query(true_val(retailer_ski_monster, boston_specialty_expert_staff)).
query(true_val(retailer_ski_monster, unk_retailer_ski_monster)).