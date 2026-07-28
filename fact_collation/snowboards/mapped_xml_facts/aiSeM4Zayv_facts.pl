0.15::indep(s13).
0.15::indep(s_merchant).
0.20::indep(s17).
0.12::indep(s18).
0.12::indep(s19).
0.15::indep(s20).
0.15::indep(s23).
0.30::indep(s24).
0.30::indep(s25).
0.20::indep(s28).
0.15::indep(s16).
0.25::indep(s32).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

0.95::acc(s1, brand).

% @attr brand
% @type categorical
% @canonical false
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
% @values freecarver_6000s=Freecarver_6000s unk_model_name=Unknown
% @importance 1.0

0.95::true_val(model_name, freecarver_6000s); 0.05::true_val(model_name, unk_model_name).
measured(s1, model_name, freecarver_6000s).
all_consistent(model_name) :- consistent(s1, model_name).
evidence(all_consistent(model_name)).
query(true_val(model_name, freecarver_6000s)).
query(true_val(model_name, unk_model_name)).

0.93::acc(s_merchant, model_year).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2027=2027 unk_model_year=Unknown
% @importance 0.85

0.93::true_val(model_year, y2027); 0.07::true_val(model_year, unk_model_year).
measured(s_merchant, model_year, y2027).
all_consistent(model_year) :- consistent(s_merchant, model_year).
evidence(all_consistent(model_year)).
query(true_val(model_year, y2027)).
query(true_val(model_year, unk_model_year)).

0.93::acc(s2, model_series).

% @attr model_series
% @type categorical
% @canonical false
% @original_name model series
% @values freecarver_series=Freecarver_Series unk_model_series=Unknown
% @importance 0.85

0.90::true_val(model_series, freecarver_series); 0.10::true_val(model_series, unk_model_series).
measured(s2, model_series, freecarver_series).
all_consistent(model_series) :- consistent(s2, model_series).
evidence(all_consistent(model_series)).
query(true_val(model_series, freecarver_series)).
query(true_val(model_series, unk_model_series)).

0.95::acc(s1, manufacturer).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values jones_nidecker=Jones_Snowboards_Nidecker_US_Inc unk_manufacturer=Unknown
% @importance 1.0

0.95::true_val(manufacturer, jones_nidecker); 0.05::true_val(manufacturer, unk_manufacturer).
measured(s1, manufacturer, jones_nidecker).
all_consistent(manufacturer) :- consistent(s1, manufacturer).
evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, jones_nidecker)).
query(true_val(manufacturer, unk_manufacturer)).

0.93::acc(s3, company_headquarters).

% @attr company_headquarters
% @type categorical
% @canonical false
% @original_name company headquarters
% @values truckee_ca_usa=Truckee_California_USA unk_company_headquarters=Unknown
% @importance 0.45

0.90::true_val(company_headquarters, truckee_ca_usa); 0.10::true_val(company_headquarters, unk_company_headquarters).
measured(s3, company_headquarters, truckee_ca_usa).
all_consistent(company_headquarters) :- consistent(s3, company_headquarters).
evidence(all_consistent(company_headquarters)).
query(true_val(company_headquarters, truckee_ca_usa)).
query(true_val(company_headquarters, unk_company_headquarters)).

0.94::acc(s1, company_address).

% @attr company_address
% @type categorical
% @canonical false
% @original_name company address
% @values brockway_rd_truckee=11253_Brockway_Rd_Suite_E202_CA_Truckee unk_company_address=Unknown
% @importance 1.0

0.93::true_val(company_address, brockway_rd_truckee); 0.07::true_val(company_address, unk_company_address).
measured(s1, company_address, brockway_rd_truckee).
all_consistent(company_address) :- consistent(s1, company_address).
evidence(all_consistent(company_address)).
query(true_val(company_address, brockway_rd_truckee)).
query(true_val(company_address, unk_company_address)).

0.88::acc(s4, founder).

% @attr founder
% @type categorical
% @canonical false
% @original_name founder
% @values jeremy_jones=Jeremy_Jones_legendary_big_mountain_snowboarder unk_founder=Unknown
% @importance 0.4

0.85::true_val(founder, jeremy_jones); 0.15::true_val(founder, unk_founder).
measured(s4, founder, jeremy_jones).
all_consistent(founder) :- consistent(s4, founder).
evidence(all_consistent(founder)).
query(true_val(founder, jeremy_jones)).
query(true_val(founder, unk_founder)).

0.93::acc(s5, brand_founded_year).
0.70::acc(s6, brand_founded_year).

% @attr brand_founded_year
% @type categorical
% @canonical false
% @original_name brand founded year
% @values y2009=2009 y2010=2010
% @importance 0.425

0.65::true_val(brand_founded_year, y2009); 0.35::true_val(brand_founded_year, y2010).
measured(s5, brand_founded_year, y2009).
measured(s6, brand_founded_year, y2010).
all_consistent(brand_founded_year) :- consistent(s5, brand_founded_year), consistent(s6, brand_founded_year).
evidence(all_consistent(brand_founded_year)).
query(true_val(brand_founded_year, y2009)).
query(true_val(brand_founded_year, y2010)).

0.70::acc(s6, parent_company).

% @attr parent_company
% @type categorical
% @canonical false
% @original_name parent company
% @values nidecker_group=Nidecker_Group_NDK unk_parent_company=Unknown
% @importance 0.5

0.68::true_val(parent_company, nidecker_group); 0.32::true_val(parent_company, unk_parent_company).
measured(s6, parent_company, nidecker_group).
all_consistent(parent_company) :- consistent(s6, parent_company).
evidence(all_consistent(parent_company)).
query(true_val(parent_company, nidecker_group)).
query(true_val(parent_company, unk_parent_company)).

0.70::acc(s6, nidecker_group_brands).

% @attr nidecker_group_brands
% @type categorical
% @canonical false
% @original_name nidecker group brands
% @values nidecker_flow_jones_yes_now=Nidecker_Flow_Jones_YES_Now unk_nidecker_group_brands=Unknown
% @importance 0.5

0.68::true_val(nidecker_group_brands, nidecker_flow_jones_yes_now); 0.32::true_val(nidecker_group_brands, unk_nidecker_group_brands).
measured(s6, nidecker_group_brands, nidecker_flow_jones_yes_now).
all_consistent(nidecker_group_brands) :- consistent(s6, nidecker_group_brands).
evidence(all_consistent(nidecker_group_brands)).
query(true_val(nidecker_group_brands, nidecker_flow_jones_yes_now)).
query(true_val(nidecker_group_brands, unk_nidecker_group_brands)).

0.88::acc(s7, manufacturing_location_current).
0.65::acc(s8, manufacturing_location_current).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values dubai_sws=Dubai_UAE_SWS_factory unk_manufacturing_location_current=Unknown
% @importance 0.725

0.93::true_val(manufacturing_location_current, dubai_sws); 0.07::true_val(manufacturing_location_current, unk_manufacturing_location_current).
measured(s7, manufacturing_location_current, dubai_sws).
measured(s8, manufacturing_location_current, dubai_sws).
all_consistent(manufacturing_location_current) :- consistent(s7, manufacturing_location_current), consistent(s8, manufacturing_location_current).
evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, dubai_sws)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

0.60::acc(s9, manufacturing_location_prior).

% @attr manufacturing_location_prior
% @type categorical
% @canonical true
% @original_name manufacturing_location_prior
% @values gst_austria=GST_factory_Antiesenhofen_Austria unk_manufacturing_location_prior=Unknown
% @importance 0.3

0.55::true_val(manufacturing_location_prior, gst_austria); 0.45::true_val(manufacturing_location_prior, unk_manufacturing_location_prior).
measured(s9, manufacturing_location_prior, gst_austria).
all_consistent(manufacturing_location_prior) :- consistent(s9, manufacturing_location_prior).
evidence(all_consistent(manufacturing_location_prior)).
query(true_val(manufacturing_location_prior, gst_austria)).
query(true_val(manufacturing_location_prior, unk_manufacturing_location_prior)).

0.90::acc(s10, sustainability_certification_solar).

% @attr sustainability_certification_solar
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values solar_100_since_2020=100pct_solar_power_since_May_2020 unk_sustainability_certification_solar=Unknown
% @importance 0.55

0.87::true_val(sustainability_certification_solar, solar_100_since_2020); 0.13::true_val(sustainability_certification_solar, unk_sustainability_certification_solar).
measured(s10, sustainability_certification_solar, solar_100_since_2020).
all_consistent(sustainability_certification_solar) :- consistent(s10, sustainability_certification_solar).
evidence(all_consistent(sustainability_certification_solar)).
query(true_val(sustainability_certification_solar, solar_100_since_2020)).
query(true_val(sustainability_certification_solar, unk_sustainability_certification_solar)).

0.88::acc(s10, sustainability_certification_solar_reduction).

% @attr sustainability_certification_solar_reduction
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values reduction_89pct=89pct_reduction_vs_non_solar unk_sustainability_certification_solar_reduction=Unknown
% @importance 0.55

0.85::true_val(sustainability_certification_solar_reduction, reduction_89pct); 0.15::true_val(sustainability_certification_solar_reduction, unk_sustainability_certification_solar_reduction).
measured(s10, sustainability_certification_solar_reduction, reduction_89pct).
all_consistent(sustainability_certification_solar_reduction) :- consistent(s10, sustainability_certification_solar_reduction).
evidence(all_consistent(sustainability_certification_solar_reduction)).
query(true_val(sustainability_certification_solar_reduction, reduction_89pct)).
query(true_val(sustainability_certification_solar_reduction, unk_sustainability_certification_solar_reduction)).

0.92::acc(s11, sustainability_certification).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values one_pct_planet_fair_trade=1pct_for_the_Planet_Fair_Trade_certified unk_sustainability_certification=Unknown
% @importance 0.45

0.90::true_val(sustainability_certification, one_pct_planet_fair_trade); 0.10::true_val(sustainability_certification, unk_sustainability_certification).
measured(s11, sustainability_certification, one_pct_planet_fair_trade).
all_consistent(sustainability_certification) :- consistent(s11, sustainability_certification).
evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, one_pct_planet_fair_trade)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

0.90::acc(s12, founder_background).

% @attr founder_background
% @type categorical
% @canonical false
% @original_name founder background
% @values world_cup_racer_90s=Jeremy_Jones_World_Cup_snowboard_racer_90s unk_founder_background=Unknown
% @importance 0.35

0.85::true_val(founder_background, world_cup_racer_90s); 0.15::true_val(founder_background, unk_founder_background).
measured(s12, founder_background, world_cup_racer_90s).
all_consistent(founder_background) :- consistent(s12, founder_background).
evidence(all_consistent(founder_background)).
query(true_val(founder_background, world_cup_racer_90s)).
query(true_val(founder_background, unk_founder_background)).

0.95::acc(s1, pro_rider_name).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values jeremy_jones=Jeremy_Jones unk_pro_rider_name=Unknown
% @importance 1.0

0.95::true_val(pro_rider_name, jeremy_jones); 0.05::true_val(pro_rider_name, unk_pro_rider_name).
measured(s1, pro_rider_name, jeremy_jones).
all_consistent(pro_rider_name) :- consistent(s1, pro_rider_name).
evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, jeremy_jones)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

0.95::acc(s_merchant, availability_status).
0.80::acc(s1, availability_status).
0.75::acc(s15, availability_status).
0.70::acc(s17, availability_status).
0.65::acc(s18, availability_status).
0.65::acc(s19, availability_status).
0.70::acc(s20, availability_status).
0.60::acc(s21, availability_status).
0.55::acc(s22, availability_status).
0.65::acc(s23, availability_status).
0.70::acc(s13, availability_status).
0.60::acc(s16, availability_status).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values pre_order=Pre_order available=Available
% @importance 0.63

0.20::true_val(availability_status, pre_order); 0.80::true_val(availability_status, available).
measured(s_merchant, availability_status, pre_order).
measured(s13, availability_status, pre_order).
measured(s1, availability_status, available).
measured(s15, availability_status, available).
measured(s17, availability_status, available).
measured(s18, availability_status, available).
measured(s19, availability_status, available).
measured(s20, availability_status, available).
measured(s21, availability_status, available).
measured(s22, availability_status, available).
measured(s23, availability_status, available).
measured(s16, availability_status, available).
all_consistent(availability_status) :-
    consistent(s_merchant, availability_status),
    consistent(s1, availability_status),
    consistent(s15, availability_status),
    (indep(s13), consistent(s13, availability_status) ; \+indep(s13)),
    (indep(s17), consistent(s17, availability_status) ; \+indep(s17)),
    (indep(s18), consistent(s18, availability_status) ; \+indep(s18)),
    (indep(s19), consistent(s19, availability_status) ; \+indep(s19)),
    (indep(s20), consistent(s20, availability_status) ; \+indep(s20)),
    (indep(s21), consistent(s21, availability_status) ; \+indep(s21)),
    (indep(s22), consistent(s22, availability_status) ; \+indep(s22)),
    (indep(s23), consistent(s23, availability_status) ; \+indep(s23)),
    (indep(s16), consistent(s16, availability_status) ; \+indep(s16)).
evidence(all_consistent(availability_status)).
query(true_val(availability_status, pre_order)).
query(true_val(availability_status, available)).

0.90::acc(s_merchant, estimated_availability_date).
0.82::acc(s13, estimated_availability_date).

% @attr estimated_availability_date
% @type categorical
% @canonical true
% @original_name estimated_availability_date
% @values june_8_2026=June_8_2026 may_2026=May_2026
% @importance 0.875

0.55::true_val(estimated_availability_date, june_8_2026); 0.45::true_val(estimated_availability_date, may_2026).
measured(s_merchant, estimated_availability_date, june_8_2026).
measured(s13, estimated_availability_date, may_2026).
all_consistent(estimated_availability_date) :-
    consistent(s_merchant, estimated_availability_date),
    (indep(s13), consistent(s13, estimated_availability_date) ; \+indep(s13)).
evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, june_8_2026)).
query(true_val(estimated_availability_date, may_2026)).

0.90::acc(s14, model_first_available_year).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2023_24=2023_24_winter_season unk_model_first_available_year=Unknown
% @importance 0.65

0.87::true_val(model_first_available_year, season_2023_24); 0.13::true_val(model_first_available_year, unk_model_first_available_year).
measured(s14, model_first_available_year, season_2023_24).
all_consistent(model_first_available_year) :- consistent(s14, model_first_available_year).
evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2023_24)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

0.82::acc(s15, model_year_unchanged_2026).

% @attr model_year_unchanged_2026
% @type categorical
% @canonical false
% @original_name 2026 model year unchanged from 2025
% @values unchanged=Unchanged_from_2025 unk_model_year_unchanged_2026=Unknown
% @importance 0.85

0.80::true_val(model_year_unchanged_2026, unchanged); 0.20::true_val(model_year_unchanged_2026, unk_model_year_unchanged_2026).
measured(s15, model_year_unchanged_2026, unchanged).
all_consistent(model_year_unchanged_2026) :- consistent(s15, model_year_unchanged_2026).
evidence(all_consistent(model_year_unchanged_2026)).
query(true_val(model_year_unchanged_2026, unchanged)).
query(true_val(model_year_unchanged_2026, unk_model_year_unchanged_2026)).

0.93::acc(s_merchant, available_sizes).
0.95::acc(s1, available_sizes).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values two_sizes=154cm_158cm seven_sizes=150N_150_154N_154_158N_158_162
% @importance 0.925

0.30::true_val(available_sizes, two_sizes); 0.70::true_val(available_sizes, seven_sizes).
measured(s_merchant, available_sizes, two_sizes).
measured(s1, available_sizes, seven_sizes).
all_consistent(available_sizes) :-
    (indep(s_merchant), consistent(s_merchant, available_sizes) ; \+indep(s_merchant)),
    consistent(s1, available_sizes).
evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, two_sizes)).
query(true_val(available_sizes, seven_sizes)).

0.94::acc(s1, width_options).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_and_narrow=Standard_plus_Narrow_N_suffix unk_width_options=Unknown
% @importance 1.0

0.93::true_val(width_options, standard_and_narrow); 0.07::true_val(width_options, unk_width_options).
measured(s1, width_options, standard_and_narrow).
all_consistent(width_options) :- consistent(s1, width_options).
evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_narrow)).
query(true_val(width_options, unk_width_options)).

0.82::acc(s13, sku_2027_auski).

% @attr sku_2027_auski
% @type categorical
% @canonical false
% @original_name SKU (2027 Auski)
% @values j27snufrs=J_27_SNU_FRS unk_sku_2027_auski=Unknown
% @importance 0.9

0.80::true_val(sku_2027_auski, j27snufrs); 0.20::true_val(sku_2027_auski, unk_sku_2027_auski).
measured(s13, sku_2027_auski, j27snufrs).
all_consistent(sku_2027_auski) :- consistent(s13, sku_2027_auski).
evidence(all_consistent(sku_2027_auski)).
query(true_val(sku_2027_auski, j27snufrs)).
query(true_val(sku_2027_auski, unk_sku_2027_auski)).

0.95::acc(s1, gender).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values unisex=Unisex unk_gender=Unknown
% @importance 1.0

0.95::true_val(gender, unisex); 0.05::true_val(gender, unk_gender).
measured(s1, gender, unisex).
all_consistent(gender) :- consistent(s1, gender).
evidence(all_consistent(gender)).
query(true_val(gender, unisex)).
query(true_val(gender, unk_gender)).

0.95::acc(s1, price_usd_msrp).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v669_95=669.95 unk_price_usd_msrp=Unknown
% @importance 1.0

0.95::true_val(price_usd_msrp, v669_95); 0.05::true_val(price_usd_msrp, unk_price_usd_msrp).
measured(s1, price_usd_msrp, v669_95).
all_consistent(price_usd_msrp) :- consistent(s1, price_usd_msrp).
evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v669_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

0.95::acc(s_merchant, price_aud_merchant).
0.82::acc(s13, price_aud_merchant).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v1149_99=1149.99 unk_price_aud_merchant=Unknown
% @importance 0.875

0.95::true_val(price_aud_merchant, v1149_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).
measured(s_merchant, price_aud_merchant, v1149_99).
measured(s13, price_aud_merchant, v1149_99).
all_consistent(price_aud_merchant) :-
    consistent(s_merchant, price_aud_merchant),
    (indep(s13), consistent(s13, price_aud_merchant) ; \+indep(s13)).
evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v1149_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

0.80::acc(s15, price_usd_evo).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_evo
% @values v535_96=535.96 unk_price_usd_evo=Unknown
% @importance 0.85

0.78::true_val(price_usd_evo, v535_96); 0.22::true_val(price_usd_evo, unk_price_usd_evo).
measured(s15, price_usd_evo, v535_96).
all_consistent(price_usd_evo) :- consistent(s15, price_usd_evo).
evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v535_96)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

0.80::acc(s15, price_usd_tactics).

% @attr price_usd_tactics
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_tactics
% @values v535_95=535.95 unk_price_usd_tactics=Unknown
% @importance 0.85

0.78::true_val(price_usd_tactics, v535_95); 0.22::true_val(price_usd_tactics, unk_price_usd_tactics).
measured(s15, price_usd_tactics, v535_95).
all_consistent(price_usd_tactics) :- consistent(s15, price_usd_tactics).
evidence(all_consistent(price_usd_tactics)).
query(true_val(price_usd_tactics, v535_95)).
query(true_val(price_usd_tactics, unk_price_usd_tactics)).

0.80::acc(s15, price_usd_backcountry).

% @attr price_usd_backcountry
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_backcountry
% @values v535_96=535.96 unk_price_usd_backcountry=Unknown
% @importance 0.85

0.78::true_val(price_usd_backcountry, v535_96); 0.22::true_val(price_usd_backcountry, unk_price_usd_backcountry).
measured(s15, price_usd_backcountry, v535_96).
all_consistent(price_usd_backcountry) :- consistent(s15, price_usd_backcountry).
evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v535_96)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

0.78::acc(s15, price_usd_gravity_coalition).

% @attr price_usd_gravity_coalition
% @type numeric
% @unit USD
% @canonical false
% @original_name price USD (Gravity Coalition)
% @values v534_97=534.97 unk_price_usd_gravity_coalition=Unknown
% @importance 0.85

0.76::true_val(price_usd_gravity_coalition, v534_97); 0.24::true_val(price_usd_gravity_coalition, unk_price_usd_gravity_coalition).
measured(s15, price_usd_gravity_coalition, v534_97).
all_consistent(price_usd_gravity_coalition) :- consistent(s15, price_usd_gravity_coalition).
evidence(all_consistent(price_usd_gravity_coalition)).
query(true_val(price_usd_gravity_coalition, v534_97)).
query(true_val(price_usd_gravity_coalition, unk_price_usd_gravity_coalition)).

0.78::acc(s15, price_usd_blauer_board_shop).

% @attr price_usd_blauer_board_shop
% @type numeric
% @unit USD
% @canonical false
% @original_name price USD (Blauer Board Shop)
% @values v669=669.0 unk_price_usd_blauer_board_shop=Unknown
% @importance 0.85

0.76::true_val(price_usd_blauer_board_shop, v669); 0.24::true_val(price_usd_blauer_board_shop, unk_price_usd_blauer_board_shop).
measured(s15, price_usd_blauer_board_shop, v669).
all_consistent(price_usd_blauer_board_shop) :- consistent(s15, price_usd_blauer_board_shop).
evidence(all_consistent(price_usd_blauer_board_shop)).
query(true_val(price_usd_blauer_board_shop, v669)).
query(true_val(price_usd_blauer_board_shop, unk_price_usd_blauer_board_shop)).

0.78::acc(s15, price_eur_blue_tomato).

% @attr price_eur_blue_tomato
% @type numeric
% @unit EUR
% @canonical true
% @original_name price_eur_blue_tomato
% @values v649_95=649.95 unk_price_eur_blue_tomato=Unknown
% @importance 0.85

0.76::true_val(price_eur_blue_tomato, v649_95); 0.24::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).
measured(s15, price_eur_blue_tomato, v649_95).
all_consistent(price_eur_blue_tomato) :- consistent(s15, price_eur_blue_tomato).
evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v649_95)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

0.78::acc(s15, price_eur_snowcountry).

% @attr price_eur_snowcountry
% @type numeric
% @unit EUR
% @canonical false
% @original_name price EUR (SnowCountry, on sale)
% @values v500_46=500.46 unk_price_eur_snowcountry=Unknown
% @importance 0.85

0.76::true_val(price_eur_snowcountry, v500_46); 0.24::true_val(price_eur_snowcountry, unk_price_eur_snowcountry).
measured(s15, price_eur_snowcountry, v500_46).
all_consistent(price_eur_snowcountry) :- consistent(s15, price_eur_snowcountry).
evidence(all_consistent(price_eur_snowcountry)).
query(true_val(price_eur_snowcountry, v500_46)).
query(true_val(price_eur_snowcountry, unk_price_eur_snowcountry)).

0.65::acc(s16, price_usd_snowinn).

% @attr price_usd_snowinn
% @type numeric
% @unit USD
% @canonical false
% @original_name price USD (Snowinn/TradeInn)
% @values v556_99=556.99 unk_price_usd_snowinn=Unknown
% @importance 0.65

0.62::true_val(price_usd_snowinn, v556_99); 0.38::true_val(price_usd_snowinn, unk_price_usd_snowinn).
measured(s16, price_usd_snowinn, v556_99).
all_consistent(price_usd_snowinn) :- consistent(s16, price_usd_snowinn).
evidence(all_consistent(price_usd_snowinn)).
query(true_val(price_usd_snowinn, v556_99)).
query(true_val(price_usd_snowinn, unk_price_usd_snowinn)).

0.95::acc(s1, return_policy_terms).

% @attr return_policy_terms
% @type categorical
% @canonical false
% @original_name return_policy_terms
% @values days_30_unused=30_days_unused_buyer_pays_return unk_return_policy_terms=Unknown
% @importance 1.0

0.93::true_val(return_policy_terms, days_30_unused); 0.07::true_val(return_policy_terms, unk_return_policy_terms).
measured(s1, return_policy_terms, days_30_unused).
all_consistent(return_policy_terms) :- consistent(s1, return_policy_terms).
evidence(all_consistent(return_policy_terms)).
query(true_val(return_policy_terms, days_30_unused)).
query(true_val(return_policy_terms, unk_return_policy_terms)).

0.93::acc(s1, warranty).

% @attr warranty
% @type categorical
% @canonical false
% @original_name warranty
% @values extended_via_registration=Extended_warranty_via_product_registration unk_warranty=Unknown
% @importance 1.0

0.92::true_val(warranty, extended_via_registration); 0.08::true_val(warranty, unk_warranty).
measured(s1, warranty, extended_via_registration).
all_consistent(warranty) :- consistent(s1, warranty).
evidence(all_consistent(warranty)).
query(true_val(warranty, extended_via_registration)).
query(true_val(warranty, unk_warranty)).

0.93::acc(s1, jones_direct_shipping).

% @attr jones_direct_shipping
% @type categorical
% @canonical false
% @original_name Jones direct shipping (US)
% @values free_5_8_days_over_100=Free_5_8_days_on_orders_over_100 unk_jones_direct_shipping=Unknown
% @importance 1.0

0.92::true_val(jones_direct_shipping, free_5_8_days_over_100); 0.08::true_val(jones_direct_shipping, unk_jones_direct_shipping).
measured(s1, jones_direct_shipping, free_5_8_days_over_100).
all_consistent(jones_direct_shipping) :- consistent(s1, jones_direct_shipping).
evidence(all_consistent(jones_direct_shipping)).
query(true_val(jones_direct_shipping, free_5_8_days_over_100)).
query(true_val(jones_direct_shipping, unk_jones_direct_shipping)).

0.95::acc(s1, product_type).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.95::true_val(product_type, snowboard); 0.05::true_val(product_type, unk_product_type).
measured(s1, product_type, snowboard).
all_consistent(product_type) :- consistent(s1, product_type).
evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

0.94::acc(s1, board_category).
0.90::acc(s2, board_category).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values carving_all_mountain=Carving_All_Mountain directional_freeride_carver=Directional_freeride_carver
% @importance 0.925

0.55::true_val(board_category, carving_all_mountain); 0.45::true_val(board_category, directional_freeride_carver).
measured(s1, board_category, carving_all_mountain).
measured(s2, board_category, directional_freeride_carver).
all_consistent(board_category) :- consistent(s1, board_category), consistent(s2, board_category).
evidence(all_consistent(board_category)).
query(true_val(board_category, carving_all_mountain)).
query(true_val(board_category, directional_freeride_carver)).

0.90::acc(s_merchant, terrain_suitability).
0.94::acc(s1, terrain_suitability).
0.85::acc(s24, terrain_suitability).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values carving_race_freeride_am=Carving_Race_Boardercross_Freeride_All_Mountain unk_terrain_suitability=Unknown
% @importance 0.883

0.95::true_val(terrain_suitability, carving_race_freeride_am); 0.05::true_val(terrain_suitability, unk_terrain_suitability).
measured(s_merchant, terrain_suitability, carving_race_freeride_am).
measured(s1, terrain_suitability, carving_race_freeride_am).
measured(s24, terrain_suitability, carving_race_freeride_am).
all_consistent(terrain_suitability) :-
    consistent(s1, terrain_suitability),
    (indep(s_merchant), consistent(s_merchant, terrain_suitability) ; \+indep(s_merchant)),
    (indep(s24), consistent(s24, terrain_suitability) ; \+indep(s24)).
evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, carving_race_freeride_am)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

0.95::acc(s1, terrain_suitability_groomer_rating).

% @attr terrain_suitability_groomer_rating
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability
% @values v10=10.0 unk_terrain_suitability_groomer_rating=Unknown
% @importance 1.0

0.93::true_val(terrain_suitability_groomer_rating, v10); 0.07::true_val(terrain_suitability_groomer_rating, unk_terrain_suitability_groomer_rating).
measured(s1, terrain_suitability_groomer_rating, v10).
all_consistent(terrain_suitability_groomer_rating) :- consistent(s1, terrain_suitability_groomer_rating).
evidence(all_consistent(terrain_suitability_groomer_rating)).
query(true_val(terrain_suitability_groomer_rating, v10)).
query(true_val(terrain_suitability_groomer_rating, unk_terrain_suitability_groomer_rating)).

0.94::acc(s1, terrain_suitability_powder_rating).
0.88::acc(s_merchant, terrain_suitability_powder_rating).

% @attr terrain_suitability_powder_rating
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability
% @values v5=5.0 v6=6.0
% @importance 0.925

0.60::true_val(terrain_suitability_powder_rating, v5); 0.40::true_val(terrain_suitability_powder_rating, v6).
measured(s1, terrain_suitability_powder_rating, v5).
measured(s_merchant, terrain_suitability_powder_rating, v6).
all_consistent(terrain_suitability_powder_rating) :-
    consistent(s1, terrain_suitability_powder_rating),
    (indep(s_merchant), consistent(s_merchant, terrain_suitability_powder_rating) ; \+indep(s_merchant)).
evidence(all_consistent(terrain_suitability_powder_rating)).
query(true_val(terrain_suitability_powder_rating, v5)).
query(true_val(terrain_suitability_powder_rating, v6)).

0.94::acc(s1, freestyle_park_rating).
0.88::acc(s_merchant, freestyle_park_rating).

% @attr freestyle_park_rating
% @type numeric
% @unit /10
% @canonical true
% @original_name freestyle_park_rating
% @values v2=2.0 v4=4.0
% @importance 0.925

0.60::true_val(freestyle_park_rating, v2); 0.40::true_val(freestyle_park_rating, v4).
measured(s1, freestyle_park_rating, v2).
measured(s_merchant, freestyle_park_rating, v4).
all_consistent(freestyle_park_rating) :-
    consistent(s1, freestyle_park_rating),
    (indep(s_merchant), consistent(s_merchant, freestyle_park_rating) ; \+indep(s_merchant)).
evidence(all_consistent(freestyle_park_rating)).
query(true_val(freestyle_park_rating, v2)).
query(true_val(freestyle_park_rating, v4)).

0.88::acc(s7, riding_style).

% @attr riding_style
% @type categorical
% @canonical false
% @original_name riding_style
% @values freeride_freecarving=Freeride_Freecarving unk_riding_style=Unknown
% @importance 0.9

0.85::true_val(riding_style, freeride_freecarving); 0.15::true_val(riding_style, unk_riding_style).
measured(s7, riding_style, freeride_freecarving).
all_consistent(riding_style) :- consistent(s7, riding_style).
evidence(all_consistent(riding_style)).
query(true_val(riding_style, freeride_freecarving)).
query(true_val(riding_style, unk_riding_style)).

0.78::acc(s15, terrain_suitability_quiver).

% @attr terrain_suitability_quiver
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values quiver_board_groomers=Quiver_board_for_groomers_tight_turn_carving unk_terrain_suitability_quiver=Unknown
% @importance 0.85

0.76::true_val(terrain_suitability_quiver, quiver_board_groomers); 0.24::true_val(terrain_suitability_quiver, unk_terrain_suitability_quiver).
measured(s15, terrain_suitability_quiver, quiver_board_groomers).
all_consistent(terrain_suitability_quiver) :- consistent(s15, terrain_suitability_quiver).
evidence(all_consistent(terrain_suitability_quiver)).
query(true_val(terrain_suitability_quiver, quiver_board_groomers)).
query(true_val(terrain_suitability_quiver, unk_terrain_suitability_quiver)).

0.94::acc(s1, rider_level).

% @attr rider_level
% @type categorical
% @canonical false
% @original_name rider_level
% @values intermediate_to_expert=Intermediate_to_Expert unk_rider_level=Unknown
% @importance 1.0

0.93::true_val(rider_level, intermediate_to_expert); 0.07::true_val(rider_level, unk_rider_level).
measured(s1, rider_level, intermediate_to_expert).
all_consistent(rider_level) :- consistent(s1, rider_level).
evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate_to_expert)).
query(true_val(rider_level, unk_rider_level)).

0.85::acc(s24, skill_level_recommendation).
0.86::acc(s7, skill_level_recommendation).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values advanced_expert=Advanced_Expert unk_skill_level_recommendation=Unknown
% @importance 0.85

0.92::true_val(skill_level_recommendation, advanced_expert); 0.08::true_val(skill_level_recommendation, unk_skill_level_recommendation).
measured(s24, skill_level_recommendation, advanced_expert).
measured(s7, skill_level_recommendation, advanced_expert).
all_consistent(skill_level_recommendation) :-
    (indep(s24), consistent(s24, skill_level_recommendation) ; \+indep(s24)),
    consistent(s7, skill_level_recommendation).
evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, advanced_expert)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

0.94::acc(s1, sizing_tip).

% @attr sizing_tip
% @type categorical
% @canonical false
% @original_name sizing tip
% @values ride_4_6cm_shorter=Designed_to_ride_4_6cm_shorter_than_standard unk_sizing_tip=Unknown
% @importance 1.0

0.93::true_val(sizing_tip, ride_4_6cm_shorter); 0.07::true_val(sizing_tip, unk_sizing_tip).
measured(s1, sizing_tip, ride_4_6cm_shorter).
all_consistent(sizing_tip) :- consistent(s1, sizing_tip).
evidence(all_consistent(sizing_tip)).
query(true_val(sizing_tip, ride_4_6cm_shorter)).
query(true_val(sizing_tip, unk_sizing_tip)).

0.93::acc(s1, boot_size_limit).

% @attr boot_size_limit
% @type categorical
% @canonical false
% @original_name boot size limit
% @values us_mens_11_5_bighorn=US_Mens_11_5_plus_should_look_at_Big_Horn_26_3cm unk_boot_size_limit=Unknown
% @importance 1.0

0.92::true_val(boot_size_limit, us_mens_11_5_bighorn); 0.08::true_val(boot_size_limit, unk_boot_size_limit).
measured(s1, boot_size_limit, us_mens_11_5_bighorn).
all_consistent(boot_size_limit) :- consistent(s1, boot_size_limit).
evidence(all_consistent(boot_size_limit)).
query(true_val(boot_size_limit, us_mens_11_5_bighorn)).
query(true_val(boot_size_limit, unk_boot_size_limit)).

0.95::acc(s1, recommended_weight_range_size).

% @attr recommended_weight_range_size
% @type categorical
% @unit lbs
% @canonical true
% @original_name recommended_weight_range_size
% @values lbs_130_180=130_180lbs_59_82kg unk_recommended_weight_range_size=Unknown
% @importance 1.0

0.93::true_val(recommended_weight_range_size, lbs_130_180); 0.07::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).
measured(s1, recommended_weight_range_size, lbs_130_180).
all_consistent(recommended_weight_range_size) :- consistent(s1, recommended_weight_range_size).
evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, lbs_130_180)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

0.95::acc(s1, recommended_weight_range_size_158).

% @attr recommended_weight_range_size_158
% @type categorical
% @unit lbs
% @canonical false
% @original_name recommended_weight_range_size
% @values lbs_150_200=150_200plus_lbs_67_91plus_kg unk_recommended_weight_range_size_158=Unknown
% @importance 1.0

0.93::true_val(recommended_weight_range_size_158, lbs_150_200); 0.07::true_val(recommended_weight_range_size_158, unk_recommended_weight_range_size_158).
measured(s1, recommended_weight_range_size_158, lbs_150_200).
all_consistent(recommended_weight_range_size_158) :- consistent(s1, recommended_weight_range_size_158).
evidence(all_consistent(recommended_weight_range_size_158)).
query(true_val(recommended_weight_range_size_158, lbs_150_200)).
query(true_val(recommended_weight_range_size_158, unk_recommended_weight_range_size_158)).

0.95::acc(s1, recommended_weight_range_size_150).

% @attr recommended_weight_range_size_150
% @type categorical
% @unit lbs
% @canonical false
% @original_name recommended_weight_range_size
% @values lbs_120_170=120_170lbs_54_77kg unk_recommended_weight_range_size_150=Unknown
% @importance 1.0

0.93::true_val(recommended_weight_range_size_150, lbs_120_170); 0.07::true_val(recommended_weight_range_size_150, unk_recommended_weight_range_size_150).
measured(s1, recommended_weight_range_size_150, lbs_120_170).
all_consistent(recommended_weight_range_size_150) :- consistent(s1, recommended_weight_range_size_150).
evidence(all_consistent(recommended_weight_range_size_150)).
query(true_val(recommended_weight_range_size_150, lbs_120_170)).
query(true_val(recommended_weight_range_size_150, unk_recommended_weight_range_size_150)).

0.95::acc(s1, recommended_weight_range_size_162).

% @attr recommended_weight_range_size_162
% @type categorical
% @unit lbs
% @canonical false
% @original_name recommended_weight_range_size
% @values lbs_170_220=170_220plus_lbs_77_100plus_kg unk_recommended_weight_range_size_162=Unknown
% @importance 1.0

0.93::true_val(recommended_weight_range_size_162, lbs_170_220); 0.07::true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162).
measured(s1, recommended_weight_range_size_162, lbs_170_220).
all_consistent(recommended_weight_range_size_162) :- consistent(s1, recommended_weight_range_size_162).
evidence(all_consistent(recommended_weight_range_size_162)).
query(true_val(recommended_weight_range_size_162, lbs_170_220)).
query(true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162)).

0.95::acc(s1, shape).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 1.0

0.95::true_val(shape, tapered_directional); 0.05::true_val(shape, unk_shape).
measured(s1, shape, tapered_directional).
all_consistent(shape) :- consistent(s1, shape).
evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

0.95::acc(s1, camber_type).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values true_camber=True_Camber_full_tip_to_tail unk_camber_type=Unknown
% @importance 1.0

0.95::true_val(camber_type, true_camber); 0.05::true_val(camber_type, unk_camber_type).
measured(s1, camber_type, true_camber).
all_consistent(camber_type) :- consistent(s1, camber_type).
evidence(all_consistent(camber_type)).
query(true_val(camber_type, true_camber)).
query(true_val(camber_type, unk_camber_type)).

0.85::acc(s25, camber_description).

% @attr camber_description
% @type categorical
% @canonical false
% @original_name camber_description
% @values traditional_full_camber_insane_edge=Traditional_full_camber_insane_edge_response unk_camber_description=Unknown
% @importance 0.7

0.82::true_val(camber_description, traditional_full_camber_insane_edge); 0.18::true_val(camber_description, unk_camber_description).
measured(s25, camber_description, traditional_full_camber_insane_edge).
all_consistent(camber_description) :-
    (indep(s25), consistent(s25, camber_description) ; \+indep(s25)).
evidence(all_consistent(camber_description)).
query(true_val(camber_description, traditional_full_camber_insane_edge)).
query(true_val(camber_description, unk_camber_description)).

0.72::acc(s26, camber_height_mm).

% @attr camber_height_mm
% @type numeric
% @unit mm
% @canonical true
% @original_name camber_height_mm
% @values v6=6.0 unk_camber_height_mm=Unknown
% @importance 0.75

0.65::true_val(camber_height_mm, v6); 0.35::true_val(camber_height_mm, unk_camber_height_mm).
measured(s26, camber_height_mm, v6).
all_consistent(camber_height_mm) :- consistent(s26, camber_height_mm).
evidence(all_consistent(camber_height_mm)).
query(true_val(camber_height_mm, v6)).
query(true_val(camber_height_mm, unk_camber_height_mm)).

0.95::acc(s1, contour_base_3d).

% @attr contour_base_3d
% @type categorical
% @canonical false
% @original_name 3D contour base
% @values medium_3d_contour=Medium_3D_Contour_Base unk_contour_base_3d=Unknown
% @importance 1.0

0.93::true_val(contour_base_3d, medium_3d_contour); 0.07::true_val(contour_base_3d, unk_contour_base_3d).
measured(s1, contour_base_3d, medium_3d_contour).
all_consistent(contour_base_3d) :- consistent(s1, contour_base_3d).
evidence(all_consistent(contour_base_3d)).
query(true_val(contour_base_3d, medium_3d_contour)).
query(true_val(contour_base_3d, unk_contour_base_3d)).

0.85::acc(s25, contour_base_3d_detail).

% @attr contour_base_3d_detail
% @type categorical
% @canonical false
% @original_name 3D contour base detail
% @values spoon_4mm_nose_4mm_tail=4mm_spoon_bevel_nose_and_4mm_tail unk_contour_base_3d_detail=Unknown
% @importance 0.7

0.82::true_val(contour_base_3d_detail, spoon_4mm_nose_4mm_tail); 0.18::true_val(contour_base_3d_detail, unk_contour_base_3d_detail).
measured(s25, contour_base_3d_detail, spoon_4mm_nose_4mm_tail).
all_consistent(contour_base_3d_detail) :-
    (indep(s25), consistent(s25, contour_base_3d_detail) ; \+indep(s25)).
evidence(all_consistent(contour_base_3d_detail)).
query(true_val(contour_base_3d_detail, spoon_4mm_nose_4mm_tail)).
query(true_val(contour_base_3d_detail, unk_contour_base_3d_detail)).

0.95::acc(s1, taper).

% @attr taper
% @type numeric
% @unit mm
% @canonical true
% @original_name taper
% @values v9=9.0 unk_taper=Unknown
% @importance 1.0

0.93::true_val(taper, v9); 0.07::true_val(taper, unk_taper).
measured(s1, taper, v9).
all_consistent(taper) :- consistent(s1, taper).
evidence(all_consistent(taper)).
query(true_val(taper, v9)).
query(true_val(taper, unk_taper)).

0.95::acc(s1, setback).

% @attr setback
% @type numeric
% @unit mm
% @canonical true
% @original_name setback
% @values v40=40.0 unk_setback=Unknown
% @importance 1.0

0.93::true_val(setback, v40); 0.07::true_val(setback, unk_setback).
measured(s1, setback, v40).
all_consistent(setback) :- consistent(s1, setback).
evidence(all_consistent(setback)).
query(true_val(setback, v40)).
query(true_val(setback, unk_setback)).

0.85::acc(s24, nose_design).

% @attr nose_design
% @type categorical
% @canonical false
% @original_name nose design
% @values blunt_nose=Blunt_Nose unk_nose_design=Unknown
% @importance 0.8

0.82::true_val(nose_design, blunt_nose); 0.18::true_val(nose_design, unk_nose_design).
measured(s24, nose_design, blunt_nose).
all_consistent(nose_design) :-
    (indep(s24), consistent(s24, nose_design) ; \+indep(s24)).
evidence(all_consistent(nose_design)).
query(true_val(nose_design, blunt_nose)).
query(true_val(nose_design, unk_nose_design)).

0.68::acc(s16, sidecut_type).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values progressive=Progressive_Sidecut unk_sidecut_type=Unknown
% @importance 0.65

0.65::true_val(sidecut_type, progressive); 0.35::true_val(sidecut_type, unk_sidecut_type).
measured(s16, sidecut_type, progressive).
all_consistent(sidecut_type) :-
    (indep(s16), consistent(s16, sidecut_type) ; \+indep(s16)).
evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, progressive)).
query(true_val(sidecut_type, unk_sidecut_type)).

0.92::acc(s2, sidecut_description).

% @attr sidecut_description
% @type categorical
% @canonical false
% @original_name sidecut description
% @values short_6m_slalom=Short_6m_sidecut_radius_for_tight_slalom_turns unk_sidecut_description=Unknown
% @importance 0.85

0.90::true_val(sidecut_description, short_6m_slalom); 0.10::true_val(sidecut_description, unk_sidecut_description).
measured(s2, sidecut_description, short_6m_slalom).
all_consistent(sidecut_description) :- consistent(s2, sidecut_description).
evidence(all_consistent(sidecut_description)).
query(true_val(sidecut_description, short_6m_slalom)).
query(true_val(sidecut_description, unk_sidecut_description)).

0.95::acc(s1, overall_length_154).

% @attr overall_length_154
% @type numeric
% @unit cm
% @canonical false
% @original_name overall length 154
% @values v154=154.0 unk_overall_length_154=Unknown
% @importance 1.0

0.93::true_val(overall_length_154, v154); 0.07::true_val(overall_length_154, unk_overall_length_154).
measured(s1, overall_length_154, v154).
all_consistent(overall_length_154) :- consistent(s1, overall_length_154).
evidence(all_consistent(overall_length_154)).
query(true_val(overall_length_154, v154)).
query(true_val(overall_length_154, unk_overall_length_154)).

0.95::acc(s1, waist_width_154).
0.85::acc(s_merchant, waist_width_154).

% @attr waist_width_154
% @type numeric
% @unit cm
% @canonical false
% @original_name waist width 154
% @values v26_3=26.3 unk_waist_width_154=Unknown
% @importance 0.925

0.95::true_val(waist_width_154, v26_3); 0.05::true_val(waist_width_154, unk_waist_width_154).
measured(s1, waist_width_154, v26_3).
measured(s_merchant, waist_width_154, v26_3).
all_consistent(waist_width_154) :-
    consistent(s1, waist_width_154),
    (indep(s_merchant), consistent(s_merchant, waist_width_154) ; \+indep(s_merchant)).
evidence(all_consistent(waist_width_154)).
query(true_val(waist_width_154, v26_3)).
query(true_val(waist_width_154, unk_waist_width_154)).

0.95::acc(s1, tip_tail_width_size).

% @attr tip_tail_width_size
% @type numeric
% @unit cm
% @canonical true
% @original_name tip_tail_width_size
% @values v32_8=32.8 unk_tip_tail_width_size=Unknown
% @importance 1.0

0.93::true_val(tip_tail_width_size, v32_8); 0.07::true_val(tip_tail_width_size, unk_tip_tail_width_size).
measured(s1, tip_tail_width_size, v32_8).
all_consistent(tip_tail_width_size) :- consistent(s1, tip_tail_width_size).
evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v32_8)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

0.95::acc(s1, tip_tail_width_size_154_tail).

% @attr tip_tail_width_size_154_tail
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size
% @values v31_9=31.9 unk_tip_tail_width_size_154_tail=Unknown
% @importance 1.0

0.93::true_val(tip_tail_width_size_154_tail, v31_9); 0.07::true_val(tip_tail_width_size_154_tail, unk_tip_tail_width_size_154_tail).
measured(s1, tip_tail_width_size_154_tail, v31_9).
all_consistent(tip_tail_width_size_154_tail) :- consistent(s1, tip_tail_width_size_154_tail).
evidence(all_consistent(tip_tail_width_size_154_tail)).
query(true_val(tip_tail_width_size_154_tail, v31_9)).
query(true_val(tip_tail_width_size_154_tail, unk_tip_tail_width_size_154_tail)).

0.95::acc(s1, sidecut_radius_size).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size
% @values v6_5=6.5 unk_sidecut_radius_size=Unknown
% @importance 1.0

0.93::true_val(sidecut_radius_size, v6_5); 0.07::true_val(sidecut_radius_size, unk_sidecut_radius_size).
measured(s1, sidecut_radius_size, v6_5).
all_consistent(sidecut_radius_size) :- consistent(s1, sidecut_radius_size).
evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v6_5)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

0.95::acc(s1, effective_edge_154).

% @attr effective_edge_154
% @type numeric
% @unit mm
% @canonical false
% @original_name effective edge 154
% @values v1280=1280.0 unk_effective_edge_154=Unknown
% @importance 1.0

0.93::true_val(effective_edge_154, v1280); 0.07::true_val(effective_edge_154, unk_effective_edge_154).
measured(s1, effective_edge_154, v1280).
all_consistent(effective_edge_154) :- consistent(s1, effective_edge_154).
evidence(all_consistent(effective_edge_154)).
query(true_val(effective_edge_154, v1280)).
query(true_val(effective_edge_154, unk_effective_edge_154)).

0.95::acc(s1, contact_length_size).

% @attr contact_length_size
% @type numeric
% @unit cm
% @canonical true
% @original_name contact_length_size
% @values v122_0=122.0 unk_contact_length_size=Unknown
% @importance 1.0

0.93::true_val(contact_length_size, v122_0); 0.07::true_val(contact_length_size, unk_contact_length_size).
measured(s1, contact_length_size, v122_0).
all_consistent(contact_length_size) :- consistent(s1, contact_length_size).
evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v122_0)).
query(true_val(contact_length_size, unk_contact_length_size)).

0.95::acc(s1, tip_length_154).

% @attr tip_length_154
% @type numeric
% @unit cm
% @canonical false
% @original_name tip length 154
% @values v21_0=21.0 unk_tip_length_154=Unknown
% @importance 1.0

0.93::true_val(tip_length_154, v21_0); 0.07::true_val(tip_length_154, unk_tip_length_154).
measured(s1, tip_length_154, v21_0).
all_consistent(tip_length_154) :- consistent(s1, tip_length_154).
evidence(all_consistent(tip_length_154)).
query(true_val(tip_length_154, v21_0)).
query(true_val(tip_length_154, unk_tip_length_154)).

0.95::acc(s1, tail_length_154).

% @attr tail_length_154
% @type numeric
% @unit cm
% @canonical false
% @original_name tail length 154
% @values v11_0=11.0 unk_tail_length_154=Unknown
% @importance 1.0

0.93::true_val(tail_length_154, v11_0); 0.07::true_val(tail_length_154, unk_tail_length_154).
measured(s1, tail_length_154, v11_0).
all_consistent(tail_length_154) :- consistent(s1, tail_length_154).
evidence(all_consistent(tail_length_154)).
query(true_val(tail_length_154, v11_0)).
query(true_val(tail_length_154, unk_tail_length_154)).

0.95::acc(s1, stance_width_range_size).

% @attr stance_width_range_size
% @type numeric
% @unit cm
% @canonical true
% @original_name stance_width_range_size
% @values v56_0=56.0 unk_stance_width_range_size=Unknown
% @importance 1.0

0.93::true_val(stance_width_range_size, v56_0); 0.07::true_val(stance_width_range_size, unk_stance_width_range_size).
measured(s1, stance_width_range_size, v56_0).
all_consistent(stance_width_range_size) :- consistent(s1, stance_width_range_size).
evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v56_0)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

0.93::acc(s1, board_weight_grams).
0.65::acc(s26, board_weight_grams).

% @attr board_weight_grams
% @type numeric
% @unit lbs
% @canonical true
% @original_name board_weight_grams
% @values v6_6=6.6 v6_16=6.16
% @importance 0.875

0.60::true_val(board_weight_grams, v6_6); 0.40::true_val(board_weight_grams, v6_16).
measured(s1, board_weight_grams, v6_6).
measured(s26, board_weight_grams, v6_16).
all_consistent(board_weight_grams) :- consistent(s1, board_weight_grams), consistent(s26, board_weight_grams).
evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v6_6)).
query(true_val(board_weight_grams, v6_16)).

0.95::acc(s1, surface_area_154).

% @attr surface_area_154
% @type numeric
% @unit dm2
% @canonical false
% @original_name surface area 154
% @values v43_3=43.3 unk_surface_area_154=Unknown
% @importance 1.0

0.93::true_val(surface_area_154, v43_3); 0.07::true_val(surface_area_154, unk_surface_area_154).
measured(s1, surface_area_154, v43_3).
all_consistent(surface_area_154) :- consistent(s1, surface_area_154).
evidence(all_consistent(surface_area_154)).
query(true_val(surface_area_154, v43_3)).
query(true_val(surface_area_154, unk_surface_area_154)).

0.95::acc(s1, overall_length_158).

% @attr overall_length_158
% @type numeric
% @unit cm
% @canonical false
% @original_name overall length 158
% @values v158=158.0 unk_overall_length_158=Unknown
% @importance 1.0

0.93::true_val(overall_length_158, v158); 0.07::true_val(overall_length_158, unk_overall_length_158).
measured(s1, overall_length_158, v158).
all_consistent(overall_length_158) :- consistent(s1, overall_length_158).
evidence(all_consistent(overall_length_158)).
query(true_val(overall_length_158, v158)).
query(true_val(overall_length_158, unk_overall_length_158)).

0.95::acc(s1, waist_width_158).

% @attr waist_width_158
% @type numeric
% @unit cm
% @canonical false
% @original_name waist width 158
% @values v26_5=26.5 unk_waist_width_158=Unknown
% @importance 1.0

0.93::true_val(waist_width_158, v26_5); 0.07::true_val(waist_width_158, unk_waist_width_158).
measured(s1, waist_width_158, v26_5).
all_consistent(waist_width_158) :- consistent(s1, waist_width_158).
evidence(all_consistent(waist_width_158)).
query(true_val(waist_width_158, v26_5)).
query(true_val(waist_width_158, unk_waist_width_158)).

0.95::acc(s1, tip_tail_width_size_158_nose).

% @attr tip_tail_width_size_158_nose
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size
% @values v33_2=33.2 unk_tip_tail_width_size_158_nose=Unknown
% @importance 1.0

0.93::true_val(tip_tail_width_size_158_nose, v33_2); 0.07::true_val(tip_tail_width_size_158_nose, unk_tip_tail_width_size_158_nose).
measured(s1, tip_tail_width_size_158_nose, v33_2).
all_consistent(tip_tail_width_size_158_nose) :- consistent(s1, tip_tail_width_size_158_nose).
evidence(all_consistent(tip_tail_width_size_158_nose)).
query(true_val(tip_tail_width_size_158_nose, v33_2)).
query(true_val(tip_tail_width_size_158_nose, unk_tip_tail_width_size_158_nose)).

0.95::acc(s1, tip_tail_width_size_158_tail).

% @attr tip_tail_width_size_158_tail
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size
% @values v32_3=32.3 unk_tip_tail_width_size_158_tail=Unknown
% @importance 1.0

0.93::true_val(tip_tail_width_size_158_tail, v32_3); 0.07::true_val(tip_tail_width_size_158_tail, unk_tip_tail_width_size_158_tail).
measured(s1, tip_tail_width_size_158_tail, v32_3).
all_consistent(tip_tail_width_size_158_tail) :- consistent(s1, tip_tail_width_size_158_tail).
evidence(all_consistent(tip_tail_width_size_158_tail)).
query(true_val(tip_tail_width_size_158_tail, v32_3)).
query(true_val(tip_tail_width_size_158_tail, unk_tip_tail_width_size_158_tail)).

0.95::acc(s1, sidecut_radius_size_158).

% @attr sidecut_radius_size_158
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v6_7=6.7 unk_sidecut_radius_size_158=Unknown
% @importance 1.0

0.93::true_val(sidecut_radius_size_158, v6_7); 0.07::true_val(sidecut_radius_size_158, unk_sidecut_radius_size_158).
measured(s1, sidecut_radius_size_158, v6_7).
all_consistent(sidecut_radius_size_158) :- consistent(s1, sidecut_radius_size_158).
evidence(all_consistent(sidecut_radius_size_158)).
query(true_val(sidecut_radius_size_158, v6_7)).
query(true_val(sidecut_radius_size_158, unk_sidecut_radius_size_158)).

0.95::acc(s1, effective_edge_158).
0.85::acc(s_merchant, effective_edge_158).

% @attr effective_edge_158
% @type numeric
% @unit mm
% @canonical false
% @original_name effective edge 158
% @values v1320=1320.0 v1318=1318.0
% @importance 0.925

0.60::true_val(effective_edge_158, v1320); 0.40::true_val(effective_edge_158, v1318).
measured(s1, effective_edge_158, v1320).
measured(s_merchant, effective_edge_158, v1318).
all_consistent(effective_edge_158) :-
    consistent(s1, effective_edge_158),
    (indep(s_merchant), consistent(s_merchant, effective_edge_158) ; \+indep(s_merchant)).
evidence(all_consistent(effective_edge_158)).
query(true_val(effective_edge_158, v1320)).
query(true_val(effective_edge_158, v1318)).

0.95::acc(s1, contact_length_size_158).

% @attr contact_length_size_158
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size
% @values v125_8=125.8 unk_contact_length_size_158=Unknown
% @importance 1.0

0.93::true_val(contact_length_size_158, v125_8); 0.07::true_val(contact_length_size_158, unk_contact_length_size_158).
measured(s1, contact_length_size_158, v125_8).
all_consistent(contact_length_size_158) :- consistent(s1, contact_length_size_158).
evidence(all_consistent(contact_length_size_158)).
query(true_val(contact_length_size_158, v125_8)).
query(true_val(contact_length_size_158, unk_contact_length_size_158)).

0.95::acc(s1, stance_width_range_size_158).

% @attr stance_width_range_size_158
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size
% @values v60_0=60.0 unk_stance_width_range_size_158=Unknown
% @importance 1.0

0.93::true_val(stance_width_range_size_158, v60_0); 0.07::true_val(stance_width_range_size_158, unk_stance_width_range_size_158).
measured(s1, stance_width_range_size_158, v60_0).
all_consistent(stance_width_range_size_158) :- consistent(s1, stance_width_range_size_158).
evidence(all_consistent(stance_width_range_size_158)).
query(true_val(stance_width_range_size_158, v60_0)).
query(true_val(stance_width_range_size_158, unk_stance_width_range_size_158)).

0.95::acc(s1, board_weight_grams_158).

% @attr board_weight_grams_158
% @type numeric
% @unit lbs
% @canonical false
% @original_name board_weight_grams
% @values v7_0=7.0 unk_board_weight_grams_158=Unknown
% @importance 1.0

0.93::true_val(board_weight_grams_158, v7_0); 0.07::true_val(board_weight_grams_158, unk_board_weight_grams_158).
measured(s1, board_weight_grams_158, v7_0).
all_consistent(board_weight_grams_158) :- consistent(s1, board_weight_grams_158).
evidence(all_consistent(board_weight_grams_158)).
query(true_val(board_weight_grams_158, v7_0)).
query(true_val(board_weight_grams_158, unk_board_weight_grams_158)).

0.94::acc(s1, flex_rating_5).

% @attr flex_rating_5
% @type numeric
% @unit /5
% @canonical false
% @original_name flex_rating_5
% @values v3=3.0 unk_flex_rating_5=Unknown
% @importance 1.0

0.93::true_val(flex_rating_5, v3); 0.07::true_val(flex_rating_5, unk_flex_rating_5).
measured(s1, flex_rating_5, v3).
all_consistent(flex_rating_5) :- consistent(s1, flex_rating_5).
evidence(all_consistent(flex_rating_5)).
query(true_val(flex_rating_5, v3)).
query(true_val(flex_rating_5, unk_flex_rating_5)).

0.90::acc(s_merchant, flex_rating_10).
0.82::acc(s27, flex_rating_10).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v6=6.0 unk_flex_rating_10=Unknown
% @importance 0.835

0.93::true_val(flex_rating_10, v6); 0.07::true_val(flex_rating_10, unk_flex_rating_10).
measured(s_merchant, flex_rating_10, v6).
measured(s27, flex_rating_10, v6).
all_consistent(flex_rating_10) :-
    (indep(s_merchant), consistent(s_merchant, flex_rating_10) ; \+indep(s_merchant)),
    consistent(s27, flex_rating_10).
evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v6)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

0.85::acc(s7, flex_feel).

% @attr flex_feel
% @type categorical
% @canonical false
% @original_name flex_feel
% @values medium_mellow_torsion=Not_very_stiff_medium_mellow_torsional_flex unk_flex_feel=Unknown
% @importance 0.9

0.82::true_val(flex_feel, medium_mellow_torsion); 0.18::true_val(flex_feel, unk_flex_feel).
measured(s7, flex_feel, medium_mellow_torsion).
all_consistent(flex_feel) :- consistent(s7, flex_feel).
evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium_mellow_torsion)).
query(true_val(flex_feel, unk_flex_feel)).

0.65::acc(s16, flex_direction).

% @attr flex_direction
% @type categorical
% @canonical false
% @original_name flex_direction
% @values directional=Directional unk_flex_direction=Unknown
% @importance 0.65

0.62::true_val(flex_direction, directional); 0.38::true_val(flex_direction, unk_flex_direction).
measured(s16, flex_direction, directional).
all_consistent(flex_direction) :-
    (indep(s16), consistent(s16, flex_direction) ; \+indep(s16)).
evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional)).
query(true_val(flex_direction, unk_flex_direction)).

0.95::acc(s1, core_material).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values power_core_bamboo_paulownia_poplar=Power_Core_triple_density_Bamboo_Paulownia_Poplar unk_core_material=Unknown
% @importance 1.0

0.95::true_val(core_material, power_core_bamboo_paulownia_poplar); 0.05::true_val(core_material, unk_core_material).
measured(s1, core_material, power_core_bamboo_paulownia_poplar).
all_consistent(core_material) :- consistent(s1, core_material).
evidence(all_consistent(core_material)).
query(true_val(core_material, power_core_bamboo_paulownia_poplar)).
query(true_val(core_material, unk_core_material)).

0.85::acc(s17, sustainability_certification_fsc).
0.95::acc(s1, sustainability_certification_fsc).

% @attr sustainability_certification_fsc
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values fsc_certified_wood=FSC_certified_wood unk_sustainability_certification_fsc=Unknown
% @importance 0.8

0.95::true_val(sustainability_certification_fsc, fsc_certified_wood); 0.05::true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc).
measured(s17, sustainability_certification_fsc, fsc_certified_wood).
measured(s1, sustainability_certification_fsc, fsc_certified_wood).
all_consistent(sustainability_certification_fsc) :-
    consistent(s1, sustainability_certification_fsc),
    (indep(s17), consistent(s17, sustainability_certification_fsc) ; \+indep(s17)).
evidence(all_consistent(sustainability_certification_fsc)).
query(true_val(sustainability_certification_fsc, fsc_certified_wood)).
query(true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc)).

0.95::acc(s1, laminate).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values biax_fiberglass=Biax_Fiberglass_dual_layer_dual_directional unk_laminate=Unknown
% @importance 1.0

0.95::true_val(laminate, biax_fiberglass); 0.05::true_val(laminate, unk_laminate).
measured(s1, laminate, biax_fiberglass).
all_consistent(laminate) :- consistent(s1, laminate).
evidence(all_consistent(laminate)).
query(true_val(laminate, biax_fiberglass)).
query(true_val(laminate, unk_laminate)).

0.95::acc(s1, construction_material_innovation).
0.78::acc(s17, construction_material_innovation).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values bcomp_carbon_flax=BComp_Carbon_Flax_Stringer basalt_power=Basalt_Power_Stringers_100pct_natural
% @importance 0.8

0.65::true_val(construction_material_innovation, bcomp_carbon_flax); 0.35::true_val(construction_material_innovation, basalt_power).
measured(s1, construction_material_innovation, bcomp_carbon_flax).
measured(s17, construction_material_innovation, basalt_power).
all_consistent(construction_material_innovation) :-
    consistent(s1, construction_material_innovation),
    (indep(s17), consistent(s17, construction_material_innovation) ; \+indep(s17)).
evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, bcomp_carbon_flax)).
query(true_val(construction_material_innovation, basalt_power)).

0.95::acc(s1, base_material).
0.82::acc(s20, base_material).
0.80::acc(s24, base_material).
0.75::acc(s27, base_material).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_8000=Sintered_8000_Base sintered_9900=Sintered_9900_Base
% @importance 0.875

0.55::true_val(base_material, sintered_8000); 0.45::true_val(base_material, sintered_9900).
measured(s1, base_material, sintered_8000).
measured(s20, base_material, sintered_8000).
measured(s24, base_material, sintered_9900).
measured(s27, base_material, sintered_9900).
all_consistent(base_material) :-
    consistent(s1, base_material),
    (indep(s20), consistent(s20, base_material) ; \+indep(s20)),
    (indep(s24), consistent(s24, base_material) ; \+indep(s24)),
    consistent(s27, base_material).
evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_8000)).
query(true_val(base_material, sintered_9900)).

0.85::acc(s24, base_type).

% @attr base_type
% @type categorical
% @canonical false
% @original_name base_type
% @values sintered_uhmwpe_carbon=Sintered_UHMW_PE_with_carbon_additives unk_base_type=Unknown
% @importance 0.8

0.82::true_val(base_type, sintered_uhmwpe_carbon); 0.18::true_val(base_type, unk_base_type).
measured(s24, base_type, sintered_uhmwpe_carbon).
all_consistent(base_type) :-
    (indep(s24), consistent(s24, base_type) ; \+indep(s24)).
evidence(all_consistent(base_type)).
query(true_val(base_type, sintered_uhmwpe_carbon)).
query(true_val(base_type, unk_base_type)).

0.90::acc(s10, resin).

% @attr resin
% @type categorical
% @canonical false
% @original_name resin
% @values bio_resin_27pct_plant=Bio_Resin_27pct_plant_based_carbon unk_resin=Unknown
% @importance 0.55

0.87::true_val(resin, bio_resin_27pct_plant); 0.13::true_val(resin, unk_resin).
measured(s10, resin, bio_resin_27pct_plant).
all_consistent(resin) :- consistent(s10, resin).
evidence(all_consistent(resin)).
query(true_val(resin, bio_resin_27pct_plant)).
query(true_val(resin, unk_resin)).

0.85::acc(s24, sustainability_certification_bio_resin).

% @attr sustainability_certification_bio_resin
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values ghg_33pct_less=33pct_less_greenhouse_gas_than_conventional_epoxy unk_sustainability_certification_bio_resin=Unknown
% @importance 0.8

0.82::true_val(sustainability_certification_bio_resin, ghg_33pct_less); 0.18::true_val(sustainability_certification_bio_resin, unk_sustainability_certification_bio_resin).
measured(s24, sustainability_certification_bio_resin, ghg_33pct_less).
all_consistent(sustainability_certification_bio_resin) :-
    (indep(s24), consistent(s24, sustainability_certification_bio_resin) ; \+indep(s24)).
evidence(all_consistent(sustainability_certification_bio_resin)).
query(true_val(sustainability_certification_bio_resin, ghg_33pct_less)).
query(true_val(sustainability_certification_bio_resin, unk_sustainability_certification_bio_resin)).

0.95::acc(s1, sidewall_material).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values recycled_abs=Recycled_ABS unk_sidewall_material=Unknown
% @importance 1.0

0.93::true_val(sidewall_material, recycled_abs); 0.07::true_val(sidewall_material, unk_sidewall_material).
measured(s1, sidewall_material, recycled_abs).
all_consistent(sidewall_material) :- consistent(s1, sidewall_material).
evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, recycled_abs)).
query(true_val(sidewall_material, unk_sidewall_material)).

0.88::acc(s_merchant, sidewall_material_finish).

% @attr sidewall_material_finish
% @type categorical
% @canonical false
% @original_name sidewall_material
% @values rounded_deflect=Rounded_finish_deflects_impact unk_sidewall_material_finish=Unknown
% @importance 0.85

0.86::true_val(sidewall_material_finish, rounded_deflect); 0.14::true_val(sidewall_material_finish, unk_sidewall_material_finish).
measured(s_merchant, sidewall_material_finish, rounded_deflect).
all_consistent(sidewall_material_finish) :-
    (indep(s_merchant), consistent(s_merchant, sidewall_material_finish) ; \+indep(s_merchant)).
evidence(all_consistent(sidewall_material_finish)).
query(true_val(sidewall_material_finish, rounded_deflect)).
query(true_val(sidewall_material_finish, unk_sidewall_material_finish)).

0.88::acc(s10, sustainability_certification_recycled_year).

% @attr sustainability_certification_recycled_year
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values since_2014=Since_2014_all_Jones_snowboards unk_sustainability_certification_recycled_year=Unknown
% @importance 0.55

0.85::true_val(sustainability_certification_recycled_year, since_2014); 0.15::true_val(sustainability_certification_recycled_year, unk_sustainability_certification_recycled_year).
measured(s10, sustainability_certification_recycled_year, since_2014).
all_consistent(sustainability_certification_recycled_year) :- consistent(s10, sustainability_certification_recycled_year).
evidence(all_consistent(sustainability_certification_recycled_year)).
query(true_val(sustainability_certification_recycled_year, since_2014)).
query(true_val(sustainability_certification_recycled_year, unk_sustainability_certification_recycled_year)).

0.95::acc(s1, edge_material).

% @attr edge_material
% @type categorical
% @canonical false
% @original_name edge material
% @values recycled_german_steel=Recycled_German_steel unk_edge_material=Unknown
% @importance 1.0

0.93::true_val(edge_material, recycled_german_steel); 0.07::true_val(edge_material, unk_edge_material).
measured(s1, edge_material, recycled_german_steel).
all_consistent(edge_material) :- consistent(s1, edge_material).
evidence(all_consistent(edge_material)).
query(true_val(edge_material, recycled_german_steel)).
query(true_val(edge_material, unk_edge_material)).

0.88::acc(s_merchant, edge_technology).
0.82::acc(s28, edge_technology).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values traction_tech_3_0=Traction_Tech_3_0_three_bumps_per_edge unk_edge_technology=Unknown
% @importance 0.725

0.92::true_val(edge_technology, traction_tech_3_0); 0.08::true_val(edge_technology, unk_edge_technology).
measured(s_merchant, edge_technology, traction_tech_3_0).
measured(s28, edge_technology, traction_tech_3_0).
all_consistent(edge_technology) :-
    (indep(s_merchant), consistent(s_merchant, edge_technology) ; \+indep(s_merchant)),
    (indep(s28), consistent(s28, edge_technology) ; \+indep(s28)).
evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, traction_tech_3_0)).
query(true_val(edge_technology, unk_edge_technology)).

0.85::acc(s24, topsheet).
0.78::acc(s13, topsheet).

% @attr topsheet
% @type categorical
% @canonical false
% @original_name topsheet
% @values fsc_ash_wood_veneer=FSC_Ash_Wood_Veneer premium_updated=Premium_Topsheet_updated
% @importance 0.85

0.60::true_val(topsheet, fsc_ash_wood_veneer); 0.40::true_val(topsheet, premium_updated).
measured(s24, topsheet, fsc_ash_wood_veneer).
measured(s13, topsheet, premium_updated).
all_consistent(topsheet) :-
    (indep(s24), consistent(s24, topsheet) ; \+indep(s24)),
    (indep(s13), consistent(s13, topsheet) ; \+indep(s13)).
evidence(all_consistent(topsheet)).
query(true_val(topsheet, fsc_ash_wood_veneer)).
query(true_val(topsheet, premium_updated)).

0.93::acc(s1, topsheet_appearance_description).

% @attr topsheet_appearance_description
% @type categorical
% @canonical false
% @original_name topsheet_appearance_description
% @values super_damp_even_flex=Super_damp_eliminates_edge_chatter_even_flex unk_topsheet_appearance_description=Unknown
% @importance 1.0

0.92::true_val(topsheet_appearance_description, super_damp_even_flex); 0.08::true_val(topsheet_appearance_description, unk_topsheet_appearance_description).
measured(s1, topsheet_appearance_description, super_damp_even_flex).
all_consistent(topsheet_appearance_description) :- consistent(s1, topsheet_appearance_description).
evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, super_damp_even_flex)).
query(true_val(topsheet_appearance_description, unk_topsheet_appearance_description)).

0.94::acc(s1, factory_wax).

% @attr factory_wax
% @type categorical
% @canonical false
% @original_name factory wax
% @values wend_natural=WEND_Natural_Wax unk_factory_wax=Unknown
% @importance 1.0

0.93::true_val(factory_wax, wend_natural); 0.07::true_val(factory_wax, unk_factory_wax).
measured(s1, factory_wax, wend_natural).
all_consistent(factory_wax) :- consistent(s1, factory_wax).
evidence(all_consistent(factory_wax)).
query(true_val(factory_wax, wend_natural)).
query(true_val(factory_wax, unk_factory_wax)).

0.94::acc(s1, factory_tuning).

% @attr factory_tuning
% @type categorical
% @canonical false
% @original_name factory tuning
% @values detuned_tip_tail_ready=Detuned_at_tip_and_tail_ready_to_ride unk_factory_tuning=Unknown
% @importance 1.0

0.93::true_val(factory_tuning, detuned_tip_tail_ready); 0.07::true_val(factory_tuning, unk_factory_tuning).
measured(s1, factory_tuning, detuned_tip_tail_ready).
all_consistent(factory_tuning) :- consistent(s1, factory_tuning).
evidence(all_consistent(factory_tuning)).
query(true_val(factory_tuning, detuned_tip_tail_ready)).
query(true_val(factory_tuning, unk_factory_tuning)).

0.88::acc(s_merchant, flex_technology).

% @attr flex_technology
% @type categorical
% @canonical false
% @original_name flex technology
% @values forever_flex=Forever_Flex_overbuilt_then_broken_in_at_factory unk_flex_technology=Unknown
% @importance 0.85

0.86::true_val(flex_technology, forever_flex); 0.14::true_val(flex_technology, unk_flex_technology).
measured(s_merchant, flex_technology, forever_flex).
all_consistent(flex_technology) :-
    (indep(s_merchant), consistent(s_merchant, flex_technology) ; \+indep(s_merchant)).
evidence(all_consistent(flex_technology)).
query(true_val(flex_technology, forever_flex)).
query(true_val(flex_technology, unk_flex_technology)).

0.95::acc(s1, mounting_pattern).
0.88::acc(s_merchant, mounting_pattern).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts_Standard_Pack unk_mounting_pattern=Unknown
% @importance 0.925

0.95::true_val(mounting_pattern, inserts_2x4); 0.05::true_val(mounting_pattern, unk_mounting_pattern).
measured(s1, mounting_pattern, inserts_2x4).
measured(s_merchant, mounting_pattern, inserts_2x4).
all_consistent(mounting_pattern) :-
    consistent(s1, mounting_pattern),
    (indep(s_merchant), consistent(s_merchant, mounting_pattern) ; \+indep(s_merchant)).
evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

0.94::acc(s1, binding_compatibility).

% @attr binding_compatibility
% @type categorical
% @canonical false
% @original_name binding_compatibility
% @values standard_2x4_all_major=Standard_2x4_compatible_all_major_bindings unk_binding_compatibility=Unknown
% @importance 1.0

0.93::true_val(binding_compatibility, standard_2x4_all_major); 0.07::true_val(binding_compatibility, unk_binding_compatibility).
measured(s1, binding_compatibility, standard_2x4_all_major).
all_consistent(binding_compatibility) :- consistent(s1, binding_compatibility).
evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, standard_2x4_all_major)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

0.85::acc(s7, reviewer_opinion_the_good_ride).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values independent_tested_154=The_Good_Ride_independent_tested_on_154cm unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.9

0.82::true_val(reviewer_opinion_the_good_ride, independent_tested_154); 0.18::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).
measured(s7, reviewer_opinion_the_good_ride, independent_tested_154).
all_consistent(reviewer_opinion_the_good_ride) :- consistent(s7, reviewer_opinion_the_good_ride).
evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, independent_tested_154)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

0.88::acc(s7, carving_rating_tgr).

% @attr carving_rating_tgr
% @type categorical
% @canonical true
% @original_name carving_rating_tgr
% @values excellent=Excellent unk_carving_rating_tgr=Unknown
% @importance 0.9

0.85::true_val(carving_rating_tgr, excellent); 0.15::true_val(carving_rating_tgr, unk_carving_rating_tgr).
measured(s7, carving_rating_tgr, excellent).
all_consistent(carving_rating_tgr) :- consistent(s7, carving_rating_tgr).
evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, excellent)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

0.88::acc(s7, edge_hold).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values icy_near_excellent=Icy_Snow_near_excellent_grip unk_edge_hold=Unknown
% @importance 0.9

0.85::true_val(edge_hold, icy_near_excellent); 0.15::true_val(edge_hold, unk_edge_hold).
measured(s7, edge_hold, icy_near_excellent).
all_consistent(edge_hold) :- consistent(s7, edge_hold).
evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, icy_near_excellent)).
query(true_val(edge_hold, unk_edge_hold)).

0.88::acc(s7, base_glide_performance).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values great=Great unk_base_glide_performance=Unknown
% @importance 0.9

0.85::true_val(base_glide_performance, great); 0.15::true_val(base_glide_performance, unk_base_glide_performance).
measured(s7, base_glide_performance, great).
all_consistent(base_glide_performance) :- consistent(s7, base_glide_performance).
evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, great)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

0.87::acc(s7, speed_rating_tgr).

% @attr speed_rating_tgr
% @type categorical
% @canonical true
% @original_name speed_rating_tgr
% @values good=Good unk_speed_rating_tgr=Unknown
% @importance 0.9

0.84::true_val(speed_rating_tgr, good); 0.16::true_val(speed_rating_tgr, unk_speed_rating_tgr).
measured(s7, speed_rating_tgr, good).
all_consistent(speed_rating_tgr) :- consistent(s7, speed_rating_tgr).
evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, good)).
query(true_val(speed_rating_tgr, unk_speed_rating_tgr)).

0.87::acc(s7, powder_rating_tgr).

% @attr powder_rating_tgr
% @type categorical
% @canonical true
% @original_name powder_rating_tgr
% @values average=Average unk_powder_rating_tgr=Unknown
% @importance 0.9

0.84::true_val(powder_rating_tgr, average); 0.16::true_val(powder_rating_tgr, unk_powder_rating_tgr).
measured(s7, powder_rating_tgr, average).
all_consistent(powder_rating_tgr) :- consistent(s7, powder_rating_tgr).
evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, average)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

0.85::acc(s7, reviewer_opinion_the_good_ride_uneven).

% @attr reviewer_opinion_the_good_ride_uneven
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values good=Good unk_reviewer_opinion_the_good_ride_uneven=Unknown
% @importance 0.9

0.82::true_val(reviewer_opinion_the_good_ride_uneven, good); 0.18::true_val(reviewer_opinion_the_good_ride_uneven, unk_reviewer_opinion_the_good_ride_uneven).
measured(s7, reviewer_opinion_the_good_ride_uneven, good).
all_consistent(reviewer_opinion_the_good_ride_uneven) :- consistent(s7, reviewer_opinion_the_good_ride_uneven).
evidence(all_consistent(reviewer_opinion_the_good_ride_uneven)).
query(true_val(reviewer_opinion_the_good_ride_uneven, good)).
query(true_val(reviewer_opinion_the_good_ride_uneven, unk_reviewer_opinion_the_good_ride_uneven)).

0.87::acc(s7, switch_riding).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values poor=Poor unk_switch_riding=Unknown
% @importance 0.9

0.84::true_val(switch_riding, poor); 0.16::true_val(switch_riding, unk_switch_riding).
measured(s7, switch_riding, poor).
all_consistent(switch_riding) :- consistent(s7, switch_riding).
evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, poor)).
query(true_val(switch_riding, unk_switch_riding)).

0.87::acc(s7, jumps_rating_tgr).

% @attr jumps_rating_tgr
% @type categorical
% @canonical true
% @original_name jumps_rating_tgr
% @values good=Good unk_jumps_rating_tgr=Unknown
% @importance 0.9

0.84::true_val(jumps_rating_tgr, good); 0.16::true_val(jumps_rating_tgr, unk_jumps_rating_tgr).
measured(s7, jumps_rating_tgr, good).
all_consistent(jumps_rating_tgr) :- consistent(s7, jumps_rating_tgr).
evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, good)).
query(true_val(jumps_rating_tgr, unk_jumps_rating_tgr)).

0.87::acc(s7, jibbing_rating_tgr).

% @attr jibbing_rating_tgr
% @type categorical
% @canonical true
% @original_name jibbing_rating_tgr
% @values poor=Poor unk_jibbing_rating_tgr=Unknown
% @importance 0.9

0.84::true_val(jibbing_rating_tgr, poor); 0.16::true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr).
measured(s7, jibbing_rating_tgr, poor).
all_consistent(jibbing_rating_tgr) :- consistent(s7, jibbing_rating_tgr).
evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, poor)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr)).

0.87::acc(s7, pipe_rating_tgr).

% @attr pipe_rating_tgr
% @type categorical
% @canonical true
% @original_name pipe_rating_tgr
% @values poor=Poor unk_pipe_rating_tgr=Unknown
% @importance 0.9

0.84::true_val(pipe_rating_tgr, poor); 0.16::true_val(pipe_rating_tgr, unk_pipe_rating_tgr).
measured(s7, pipe_rating_tgr, poor).
all_consistent(pipe_rating_tgr) :- consistent(s7, pipe_rating_tgr).
evidence(all_consistent(pipe_rating_tgr)).
query(true_val(pipe_rating_tgr, poor)).
query(true_val(pipe_rating_tgr, unk_pipe_rating_tgr)).

0.88::acc(s7, on_snow_feel_tgr).

% @attr on_snow_feel_tgr
% @type categorical
% @canonical true
% @original_name on_snow_feel_tgr
% @values locked_in=Locked_In unk_on_snow_feel_tgr=Unknown
% @importance 0.9

0.85::true_val(on_snow_feel_tgr, locked_in); 0.15::true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr).
measured(s7, on_snow_feel_tgr, locked_in).
all_consistent(on_snow_feel_tgr) :- consistent(s7, on_snow_feel_tgr).
evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, locked_in)).
query(true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr)).

0.86::acc(s7, turn_initiation_performance).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values medium_slow=Medium_Slow unk_turn_initiation_performance=Unknown
% @importance 0.9

0.83::true_val(turn_initiation_performance, medium_slow); 0.17::true_val(turn_initiation_performance, unk_turn_initiation_performance).
measured(s7, turn_initiation_performance, medium_slow).
all_consistent(turn_initiation_performance) :- consistent(s7, turn_initiation_performance).
evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, medium_slow)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

0.85::acc(s7, reviewer_opinion_the_good_ride_boot_support).

% @attr reviewer_opinion_the_good_ride_boot_support
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values hard=Hard unk_reviewer_opinion_the_good_ride_boot_support=Unknown
% @importance 0.9

0.82::true_val(reviewer_opinion_the_good_ride_boot_support, hard); 0.18::true_val(reviewer_opinion_the_good_ride_boot_support, unk_reviewer_opinion_the_good_ride_boot_support).
measured(s7, reviewer_opinion_the_good_ride_boot_support, hard).
all_consistent(reviewer_opinion_the_good_ride_boot_support) :- consistent(s7, reviewer_opinion_the_good_ride_boot_support).
evidence(all_consistent(reviewer_opinion_the_good_ride_boot_support)).
query(true_val(reviewer_opinion_the_good_ride_boot_support, hard)).
query(true_val(reviewer_opinion_the_good_ride_boot_support, unk_reviewer_opinion_the_good_ride_boot_support)).

0.85::acc(s7, reviewer_opinion_the_good_ride_boot_flex).

% @attr reviewer_opinion_the_good_ride_boot_flex
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values semi_hard=Semi_Hard unk_reviewer_opinion_the_good_ride_boot_flex=Unknown
% @importance 0.9

0.82::true_val(reviewer_opinion_the_good_ride_boot_flex, semi_hard); 0.18::true_val(reviewer_opinion_the_good_ride_boot_flex, unk_reviewer_opinion_the_good_ride_boot_flex).
measured(s7, reviewer_opinion_the_good_ride_boot_flex, semi_hard).
all_consistent(reviewer_opinion_the_good_ride_boot_flex) :- consistent(s7, reviewer_opinion_the_good_ride_boot_flex).
evidence(all_consistent(reviewer_opinion_the_good_ride_boot_flex)).
query(true_val(reviewer_opinion_the_good_ride_boot_flex, semi_hard)).
query(true_val(reviewer_opinion_the_good_ride_boot_flex, unk_reviewer_opinion_the_good_ride_boot_flex)).

0.85::acc(s7, positive_aspect).

% @attr positive_aspect
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values amazing_carver_grip_poppy=Amazing_circle_carver_near_excellent_grip_poppy_flex_quiver unk_positive_aspect=Unknown
% @importance 0.9

0.82::true_val(positive_aspect, amazing_carver_grip_poppy); 0.18::true_val(positive_aspect, unk_positive_aspect).
measured(s7, positive_aspect, amazing_carver_grip_poppy).
all_consistent(positive_aspect) :- consistent(s7, positive_aspect).
evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, amazing_carver_grip_poppy)).
query(true_val(positive_aspect, unk_positive_aspect)).

0.85::acc(s7, negative_aspect).

% @attr negative_aspect
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values one_dimensional_not_powder=Very_one_dimensional_not_daily_driver_not_ideal_powder unk_negative_aspect=Unknown
% @importance 0.9

0.82::true_val(negative_aspect, one_dimensional_not_powder); 0.18::true_val(negative_aspect, unk_negative_aspect).
measured(s7, negative_aspect, one_dimensional_not_powder).
all_consistent(negative_aspect) :- consistent(s7, negative_aspect).
evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, one_dimensional_not_powder)).
query(true_val(negative_aspect, unk_negative_aspect)).

0.78::acc(s27, snowboard_selector_assessment).

% @attr snowboard_selector_assessment
% @type categorical
% @canonical false
% @original_name snowboard selector assessment
% @values great_for_carve_not_aggressive=Great_board_for_carve_sensation_not_super_aggressive unk_snowboard_selector_assessment=Unknown
% @importance 0.82

0.75::true_val(snowboard_selector_assessment, great_for_carve_not_aggressive); 0.25::true_val(snowboard_selector_assessment, unk_snowboard_selector_assessment).
measured(s27, snowboard_selector_assessment, great_for_carve_not_aggressive).
all_consistent(snowboard_selector_assessment) :- consistent(s27, snowboard_selector_assessment).
evidence(all_consistent(snowboard_selector_assessment)).
query(true_val(snowboard_selector_assessment, great_for_carve_not_aggressive)).
query(true_val(snowboard_selector_assessment, unk_snowboard_selector_assessment)).

0.93::acc(s1, jones_direct_review_score).

% @attr jones_direct_review_score
% @type numeric
% @unit /5
% @canonical false
% @original_name Jones direct review score
% @values v4_9=4.9 unk_jones_direct_review_score=Unknown
% @importance 1.0

0.92::true_val(jones_direct_review_score, v4_9); 0.08::true_val(jones_direct_review_score, unk_jones_direct_review_score).
measured(s1, jones_direct_review_score, v4_9).
all_consistent(jones_direct_review_score) :- consistent(s1, jones_direct_review_score).
evidence(all_consistent(jones_direct_review_score)).
query(true_val(jones_direct_review_score, v4_9)).
query(true_val(jones_direct_review_score, unk_jones_direct_review_score)).

0.70::acc(s29, user_review_forum).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values holds_edge_best_ever=Holds_edge_better_than_any_board_handles_speed unk_user_review_forum=Unknown
% @importance 0.7

0.65::true_val(user_review_forum, holds_edge_best_ever); 0.35::true_val(user_review_forum, unk_user_review_forum).
measured(s29, user_review_forum, holds_edge_best_ever).
all_consistent(user_review_forum) :- consistent(s29, user_review_forum).
evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, holds_edge_best_ever)).
query(true_val(user_review_forum, unk_user_review_forum)).

0.68::acc(s26, user_review_forum_carving_feel).

% @attr user_review_forum_carving_feel
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values astonishing_stunning=Astonishing_stunning_carving_skate_to_try_is_to_adopt unk_user_review_forum_carving_feel=Unknown
% @importance 0.75

0.62::true_val(user_review_forum_carving_feel, astonishing_stunning); 0.38::true_val(user_review_forum_carving_feel, unk_user_review_forum_carving_feel).
measured(s26, user_review_forum_carving_feel, astonishing_stunning).
all_consistent(user_review_forum_carving_feel) :- consistent(s26, user_review_forum_carving_feel).
evidence(all_consistent(user_review_forum_carving_feel)).
query(true_val(user_review_forum_carving_feel, astonishing_stunning)).
query(true_val(user_review_forum_carving_feel, unk_user_review_forum_carving_feel)).

0.72::acc(s30, user_review_forum_versatility).

% @attr user_review_forum_versatility
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values fun_holds_edge_agile=Fun_to_ride_holds_edge_agile_short_long_eurocarves unk_user_review_forum_versatility=Unknown
% @importance 0.78

0.68::true_val(user_review_forum_versatility, fun_holds_edge_agile); 0.32::true_val(user_review_forum_versatility, unk_user_review_forum_versatility).
measured(s30, user_review_forum_versatility, fun_holds_edge_agile).
all_consistent(user_review_forum_versatility) :- consistent(s30, user_review_forum_versatility).
evidence(all_consistent(user_review_forum_versatility)).
query(true_val(user_review_forum_versatility, fun_holds_edge_agile)).
query(true_val(user_review_forum_versatility, unk_user_review_forum_versatility)).

0.70::acc(s31, user_review_forum_versatility_neg).

% @attr user_review_forum_versatility_neg
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values one_dimensional_carving_only=One_dimensional_carving_only unk_user_review_forum_versatility_neg=Unknown
% @importance 0.72

0.65::true_val(user_review_forum_versatility_neg, one_dimensional_carving_only); 0.35::true_val(user_review_forum_versatility_neg, unk_user_review_forum_versatility_neg).
measured(s31, user_review_forum_versatility_neg, one_dimensional_carving_only).
all_consistent(user_review_forum_versatility_neg) :- consistent(s31, user_review_forum_versatility_neg).
evidence(all_consistent(user_review_forum_versatility_neg)).
query(true_val(user_review_forum_versatility_neg, one_dimensional_carving_only)).
query(true_val(user_review_forum_versatility_neg, unk_user_review_forum_versatility_neg)).

0.70::acc(s29, user_review_forum_switch).

% @attr user_review_forum_switch
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values not_designed_for_switch=Remember_not_to_go_switch_not_designed_for_it unk_user_review_forum_switch=Unknown
% @importance 0.7

0.65::true_val(user_review_forum_switch, not_designed_for_switch); 0.35::true_val(user_review_forum_switch, unk_user_review_forum_switch).
measured(s29, user_review_forum_switch, not_designed_for_switch).
all_consistent(user_review_forum_switch) :- consistent(s29, user_review_forum_switch).
evidence(all_consistent(user_review_forum_switch)).
query(true_val(user_review_forum_switch, not_designed_for_switch)).
query(true_val(user_review_forum_switch, unk_user_review_forum_switch)).

0.68::acc(s26, user_review_forum_powder).

% @attr user_review_forum_powder
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values careful_nose_can_work=Be_careful_with_nose_but_can_work_in_powder unk_user_review_forum_powder=Unknown
% @importance 0.75

0.62::true_val(user_review_forum_powder, careful_nose_can_work); 0.38::true_val(user_review_forum_powder, unk_user_review_forum_powder).
measured(s26, user_review_forum_powder, careful_nose_can_work).
all_consistent(user_review_forum_powder) :- consistent(s26, user_review_forum_powder).
evidence(all_consistent(user_review_forum_powder)).
query(true_val(user_review_forum_powder, careful_nose_can_work)).
query(true_val(user_review_forum_powder, unk_user_review_forum_powder)).

0.72::acc(s30, user_review_forum_ice).

% @attr user_review_forum_ice
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values prefers_alchemist_ice=One_user_prefers_Alchemist_on_ice_Freecarver_hardpack unk_user_review_forum_ice=Unknown
% @importance 0.78

0.68::true_val(user_review_forum_ice, prefers_alchemist_ice); 0.32::true_val(user_review_forum_ice, unk_user_review_forum_ice).
measured(s30, user_review_forum_ice, prefers_alchemist_ice).
all_consistent(user_review_forum_ice) :- consistent(s30, user_review_forum_ice).
evidence(all_consistent(user_review_forum_ice)).
query(true_val(user_review_forum_ice, prefers_alchemist_ice)).
query(true_val(user_review_forum_ice, unk_user_review_forum_ice)).

0.68::acc(s26, user_review_forum_tail).

% @attr user_review_forum_tail
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values short_tail_ollie_works=Tail_very_short_but_ollie_works_once_used_to_it unk_user_review_forum_tail=Unknown
% @importance 0.75

0.62::true_val(user_review_forum_tail, short_tail_ollie_works); 0.38::true_val(user_review_forum_tail, unk_user_review_forum_tail).
measured(s26, user_review_forum_tail, short_tail_ollie_works).
all_consistent(user_review_forum_tail) :- consistent(s26, user_review_forum_tail).
evidence(all_consistent(user_review_forum_tail)).
query(true_val(user_review_forum_tail, short_tail_ollie_works)).
query(true_val(user_review_forum_tail, unk_user_review_forum_tail)).

0.82::acc(s2, comparable_board_same_brand).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values freecarver_9000s=Jones_Freecarver_9000s_9m_sidecut_triax_stiffer unk_comparable_board_same_brand=Unknown
% @importance 0.85

0.80::true_val(comparable_board_same_brand, freecarver_9000s); 0.20::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).
measured(s2, comparable_board_same_brand, freecarver_9000s).
all_consistent(comparable_board_same_brand) :- consistent(s2, comparable_board_same_brand).
evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, freecarver_9000s)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

0.82::acc(s2, comparable_board_same_brand_sidecut).

% @attr comparable_board_same_brand_sidecut
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values sidecut_6m_vs_9m=Biggest_difference_is_sidecut_6m_vs_9m unk_comparable_board_same_brand_sidecut=Unknown
% @importance 0.85

0.80::true_val(comparable_board_same_brand_sidecut, sidecut_6m_vs_9m); 0.20::true_val(comparable_board_same_brand_sidecut, unk_comparable_board_same_brand_sidecut).
measured(s2, comparable_board_same_brand_sidecut, sidecut_6m_vs_9m).
all_consistent(comparable_board_same_brand_sidecut) :- consistent(s2, comparable_board_same_brand_sidecut).
evidence(all_consistent(comparable_board_same_brand_sidecut)).
query(true_val(comparable_board_same_brand_sidecut, sidecut_6m_vs_9m)).
query(true_val(comparable_board_same_brand_sidecut, unk_comparable_board_same_brand_sidecut)).

0.78::acc(s32, comparable_board_same_brand_fiberglass).

% @attr comparable_board_same_brand_fiberglass
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values biax_vs_triax=6000s_biax_more_forgiving_torsion_vs_triax_9000s unk_comparable_board_same_brand_fiberglass=Unknown
% @importance 0.72

0.72::true_val(comparable_board_same_brand_fiberglass, biax_vs_triax); 0.28::true_val(comparable_board_same_brand_fiberglass, unk_comparable_board_same_brand_fiberglass).
measured(s32, comparable_board_same_brand_fiberglass, biax_vs_triax).
all_consistent(comparable_board_same_brand_fiberglass) :-
    (indep(s32), consistent(s32, comparable_board_same_brand_fiberglass) ; \+indep(s32)).
evidence(all_consistent(comparable_board_same_brand_fiberglass)).
query(true_val(comparable_board_same_brand_fiberglass, biax_vs_triax)).
query(true_val(comparable_board_same_brand_fiberglass, unk_comparable_board_same_brand_fiberglass)).

0.80::acc(s27, comparable_board_cross_brand).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values nidecker_blade_plus=Nidecker_Blade_Plus_699_95_stiffness_8_10 unk_comparable_board_cross_brand=Unknown
% @importance 0.82

0.78::true_val(comparable_board_cross_brand, nidecker_blade_plus); 0.22::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).
measured(s27, comparable_board_cross_brand, nidecker_blade_plus).
all_consistent(comparable_board_cross_brand) :- consistent(s27, comparable_board_cross_brand).
evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, nidecker_blade_plus)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

0.80::acc(s27, comparable_board_cross_brand_k2).

% @attr comparable_board_cross_brand_k2
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values k2_alchemist=K2_Alchemist_809_95_stiffness_9_10 unk_comparable_board_cross_brand_k2=Unknown
% @importance 0.82

0.78::true_val(comparable_board_cross_brand_k2, k2_alchemist); 0.22::true_val(comparable_board_cross_brand_k2, unk_comparable_board_cross_brand_k2).
measured(s27, comparable_board_cross_brand_k2, k2_alchemist).
all_consistent(comparable_board_cross_brand_k2) :- consistent(s27, comparable_board_cross_brand_k2).
evidence(all_consistent(comparable_board_cross_brand_k2)).
query(true_val(comparable_board_cross_brand_k2, k2_alchemist)).
query(true_val(comparable_board_cross_brand_k2, unk_comparable_board_cross_brand_k2)).

0.80::acc(s27, comparable_board_cross_brand_arbor).

% @attr comparable_board_cross_brand_arbor
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values arbor_a_frame=Arbor_A_Frame_619_95_stiffness_7_10 unk_comparable_board_cross_brand_arbor=Unknown
% @importance 0.82

0.78::true_val(comparable_board_cross_brand_arbor, arbor_a_frame); 0.22::true_val(comparable_board_cross_brand_arbor, unk_comparable_board_cross_brand_arbor).
measured(s27, comparable_board_cross_brand_arbor, arbor_a_frame).
all_consistent(comparable_board_cross_brand_arbor) :- consistent(s27, comparable_board_cross_brand_arbor).
evidence(all_consistent(comparable_board_cross_brand_arbor)).
query(true_val(comparable_board_cross_brand_arbor, arbor_a_frame)).
query(true_val(comparable_board_cross_brand_arbor, unk_comparable_board_cross_brand_arbor)).

0.80::acc(s27, comparable_board_cross_brand_ride).

% @attr comparable_board_cross_brand_ride
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values ride_smokescreen=Ride_Smokescreen_539_95_stiffness_6_10 unk_comparable_board_cross_brand_ride=Unknown
% @importance 0.82

0.78::true_val(comparable_board_cross_brand_ride, ride_smokescreen); 0.22::true_val(comparable_board_cross_brand_ride, unk_comparable_board_cross_brand_ride).
measured(s27, comparable_board_cross_brand_ride, ride_smokescreen).
all_consistent(comparable_board_cross_brand_ride) :- consistent(s27, comparable_board_cross_brand_ride).
evidence(all_consistent(comparable_board_cross_brand_ride)).
query(true_val(comparable_board_cross_brand_ride, ride_smokescreen)).
query(true_val(comparable_board_cross_brand_ride, unk_comparable_board_cross_brand_ride)).

0.72::acc(s30, comparable_board_cross_brand_stranda).

% @attr comparable_board_cross_brand_stranda
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values stranda_cheater_shorty=Stranda_Cheater_Shorty unk_comparable_board_cross_brand_stranda=Unknown
% @importance 0.78

0.68::true_val(comparable_board_cross_brand_stranda, stranda_cheater_shorty); 0.32::true_val(comparable_board_cross_brand_stranda, unk_comparable_board_cross_brand_stranda).
measured(s30, comparable_board_cross_brand_stranda, stranda_cheater_shorty).
all_consistent(comparable_board_cross_brand_stranda) :- consistent(s30, comparable_board_cross_brand_stranda).
evidence(all_consistent(comparable_board_cross_brand_stranda)).
query(true_val(comparable_board_cross_brand_stranda, stranda_cheater_shorty)).
query(true_val(comparable_board_cross_brand_stranda, unk_comparable_board_cross_brand_stranda)).

0.72::acc(s33, comparable_board_cross_brand_korua).

% @attr comparable_board_cross_brand_korua
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values korua_dart_cafe_bullet=Korua_Dart_Cafe_Racer_Bullet_Train unk_comparable_board_cross_brand_korua=Unknown
% @importance 0.78

0.68::true_val(comparable_board_cross_brand_korua, korua_dart_cafe_bullet); 0.32::true_val(comparable_board_cross_brand_korua, unk_comparable_board_cross_brand_korua).
measured(s33, comparable_board_cross_brand_korua, korua_dart_cafe_bullet).
all_consistent(comparable_board_cross_brand_korua) :- consistent(s33, comparable_board_cross_brand_korua).
evidence(all_consistent(comparable_board_cross_brand_korua)).
query(true_val(comparable_board_cross_brand_korua, korua_dart_cafe_bullet)).
query(true_val(comparable_board_cross_brand_korua, unk_comparable_board_cross_brand_korua)).

0.72::acc(s33, comparable_board_cross_brand_ee).

% @attr comparable_board_cross_brand_ee
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values ee_1280_more_than_korua=154_Freecarver_EE_1280_has_11_8cm_more_EE_than_Korua unk_comparable_board_cross_brand_ee=Unknown
% @importance 0.78

0.68::true_val(comparable_board_cross_brand_ee, ee_1280_more_than_korua); 0.32::true_val(comparable_board_cross_brand_ee, unk_comparable_board_cross_brand_ee).
measured(s33, comparable_board_cross_brand_ee, ee_1280_more_than_korua).
all_consistent(comparable_board_cross_brand_ee) :- consistent(s33, comparable_board_cross_brand_ee).
evidence(all_consistent(comparable_board_cross_brand_ee)).
query(true_val(comparable_board_cross_brand_ee, ee_1280_more_than_korua)).
query(true_val(comparable_board_cross_brand_ee, unk_comparable_board_cross_brand_ee)).

0.72::acc(s33, user_review_forum_best_softboot).

% @attr user_review_forum_best_softboot
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values best_softboot_freecarve=Best_softboot_freecarve_board_on_market unk_user_review_forum_best_softboot=Unknown
% @importance 0.78

0.68::true_val(user_review_forum_best_softboot, best_softboot_freecarve); 0.32::true_val(user_review_forum_best_softboot, unk_user_review_forum_best_softboot).
measured(s33, user_review_forum_best_softboot, best_softboot_freecarve).
all_consistent(user_review_forum_best_softboot) :- consistent(s33, user_review_forum_best_softboot).
evidence(all_consistent(user_review_forum_best_softboot)).
query(true_val(user_review_forum_best_softboot, best_softboot_freecarve)).
query(true_val(user_review_forum_best_softboot, unk_user_review_forum_best_softboot)).

0.72::acc(s33, user_review_forum_comparison).

% @attr user_review_forum_comparison
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values nearly_as_well_stranda_beat_korua=Carved_nearly_as_well_as_Stranda_outperformed_Korua_on_ice unk_user_review_forum_comparison=Unknown
% @importance 0.78

0.68::true_val(user_review_forum_comparison, nearly_as_well_stranda_beat_korua); 0.32::true_val(user_review_forum_comparison, unk_user_review_forum_comparison).
measured(s33, user_review_forum_comparison, nearly_as_well_stranda_beat_korua).
all_consistent(user_review_forum_comparison) :- consistent(s33, user_review_forum_comparison).
evidence(all_consistent(user_review_forum_comparison)).
query(true_val(user_review_forum_comparison, nearly_as_well_stranda_beat_korua)).
query(true_val(user_review_forum_comparison, unk_user_review_forum_comparison)).

0.88::acc(s10, sustainability_certification_bio_sourcing).

% @attr sustainability_certification_bio_sourcing
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values co_products_plant_industrial=Co_products_waste_of_plant_based_industrial_processes unk_sustainability_certification_bio_sourcing=Unknown
% @importance 0.55

0.85::true_val(sustainability_certification_bio_sourcing, co_products_plant_industrial); 0.15::true_val(sustainability_certification_bio_sourcing, unk_sustainability_certification_bio_sourcing).
measured(s10, sustainability_certification_bio_sourcing, co_products_plant_industrial).
all_consistent(sustainability_certification_bio_sourcing) :- consistent(s10, sustainability_certification_bio_sourcing).
evidence(all_consistent(sustainability_certification_bio_sourcing)).
query(true_val(sustainability_certification_bio_sourcing, co_products_plant_industrial)).
query(true_val(sustainability_certification_bio_sourcing, unk_sustainability_certification_bio_sourcing)).

0.93::acc(s1, sustainability_certification_recycled_materials).

% @attr sustainability_certification_recycled_materials
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values recycled_abs_steel=Recycled_ABS_sidewalls_recycled_steel_edges unk_sustainability_certification_recycled_materials=Unknown
% @importance 1.0

0.92::true_val(sustainability_certification_recycled_materials, recycled_abs_steel); 0.08::true_val(sustainability_certification_recycled_materials, unk_sustainability_certification_recycled_materials).
measured(s1, sustainability_certification_recycled_materials, recycled_abs_steel).
all_consistent(sustainability_certification_recycled_materials) :- consistent(s1, sustainability_certification_recycled_materials).
evidence(all_consistent(sustainability_certification_recycled_materials)).
query(true_val(sustainability_certification_recycled_materials, recycled_abs_steel)).
query(true_val(sustainability_certification_recycled_materials, unk_sustainability_certification_recycled_materials)).

0.93::acc(s1, sustainability_certification_flax).

% @attr sustainability_certification_flax
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values lower_co2_vs_carbon=Lower_CO2_emissions_vs_full_carbon_stringer unk_sustainability_certification_flax=Unknown
% @importance 1.0

0.92::true_val(sustainability_certification_flax, lower_co2_vs_carbon); 0.08::true_val(sustainability_certification_flax, unk_sustainability_certification_flax).
measured(s1, sustainability_certification_flax, lower_co2_vs_carbon).
all_consistent(sustainability_certification_flax) :- consistent(s1, sustainability_certification_flax).
evidence(all_consistent(sustainability_certification_flax)).
query(true_val(sustainability_certification_flax, lower_co2_vs_carbon)).
query(true_val(sustainability_certification_flax, unk_sustainability_certification_flax)).

0.70::acc(s34, sustainability_certification_pow).

% @attr sustainability_certification_pow
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values pow_founded_2007=POW_founded_by_Jeremy_Jones_2007 unk_sustainability_certification_pow=Unknown
% @importance 0.35

0.68::true_val(sustainability_certification_pow, pow_founded_2007); 0.32::true_val(sustainability_certification_pow, unk_sustainability_certification_pow).
measured(s34, sustainability_certification_pow, pow_founded_2007).
all_consistent(sustainability_certification_pow) :- consistent(s34, sustainability_certification_pow).
evidence(all_consistent(sustainability_certification_pow)).
query(true_val(sustainability_certification_pow, pow_founded_2007)).
query(true_val(sustainability_certification_pow, unk_sustainability_certification_pow)).

0.93::acc(s1, sustainability_certification_trade_in).

% @attr sustainability_certification_trade_in
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values trade_in_50_off=Trade_in_dead_board_get_50_toward_new unk_sustainability_certification_trade_in=Unknown
% @importance 1.0

0.92::true_val(sustainability_certification_trade_in, trade_in_50_off); 0.08::true_val(sustainability_certification_trade_in, unk_sustainability_certification_trade_in).
measured(s1, sustainability_certification_trade_in, trade_in_50_off).
all_consistent(sustainability_certification_trade_in) :- consistent(s1, sustainability_certification_trade_in).
evidence(all_consistent(sustainability_certification_trade_in)).
query(true_val(sustainability_certification_trade_in, trade_in_50_off)).
query(true_val(sustainability_certification_trade_in, unk_sustainability_certification_trade_in)).

0.88::acc(s10, design_philosophy).

% @attr design_philosophy
% @type categorical
% @canonical false
% @original_name design philosophy
% @values performance_sustainability_innovation=Three_pillars_performance_sustainability_innovation unk_design_philosophy=Unknown
% @importance 0.55

0.85::true_val(design_philosophy, performance_sustainability_innovation); 0.15::true_val(design_philosophy, unk_design_philosophy).
measured(s10, design_philosophy, performance_sustainability_innovation).
all_consistent(design_philosophy) :- consistent(s10, design_philosophy).
evidence(all_consistent(design_philosophy)).
query(true_val(design_philosophy, performance_sustainability_innovation)).
query(true_val(design_philosophy, unk_design_philosophy)).

0.88::acc(s12, design_inspiration).

% @attr design_inspiration
% @type categorical
% @canonical false
% @original_name design inspiration
% @values racing_background=Jeremy_Jones_racing_background_World_Cup unk_design_inspiration=Unknown
% @importance 0.35

0.85::true_val(design_inspiration, racing_background); 0.15::true_val(design_inspiration, unk_design_inspiration).
measured(s12, design_inspiration, racing_background).
all_consistent(design_inspiration) :- consistent(s12, design_inspiration).
evidence(all_consistent(design_inspiration)).
query(true_val(design_inspiration, racing_background)).
query(true_val(design_inspiration, unk_design_inspiration)).

0.94::acc(s1, sizing_recommendation).

% @attr sizing_recommendation
% @type categorical
% @canonical false
% @original_name sizing recommendation
% @values ride_4_6cm_shorter=Designed_to_ride_4_6cm_shorter_than_standard unk_sizing_recommendation=Unknown
% @importance 1.0

0.93::true_val(sizing_recommendation, ride_4_6cm_shorter); 0.07::true_val(sizing_recommendation, unk_sizing_recommendation).
measured(s1, sizing_recommendation, ride_4_6cm_shorter).
all_consistent(sizing_recommendation) :- consistent(s1, sizing_recommendation).
evidence(all_consistent(sizing_recommendation)).
query(true_val(sizing_recommendation, ride_4_6cm_shorter)).
query(true_val(sizing_recommendation, unk_sizing_recommendation)).

0.90::acc(s1, recommended_bindings).
0.68::acc(s26, recommended_bindings).

% @attr recommended_bindings
% @type categorical
% @canonical false
% @original_name recommended bindings
% @values mercury_fase_union_flux=Jones_Mercury_FASE_379_95_Union_Force_Flux_CV unk_recommended_bindings=Unknown
% @importance 0.875

0.88::true_val(recommended_bindings, mercury_fase_union_flux); 0.12::true_val(recommended_bindings, unk_recommended_bindings).
measured(s1, recommended_bindings, mercury_fase_union_flux).
measured(s26, recommended_bindings, mercury_fase_union_flux).
all_consistent(recommended_bindings) :- consistent(s1, recommended_bindings), consistent(s26, recommended_bindings).
evidence(all_consistent(recommended_bindings)).
query(true_val(recommended_bindings, mercury_fase_union_flux)).
query(true_val(recommended_bindings, unk_recommended_bindings)).

0.85::acc(s7, recommended_stance_angles).

% @attr recommended_stance_angles
% @type categorical
% @canonical false
% @original_name recommended stance angles (reviewer)
% @values angles_18_3_30_15_27_9=plus18_plus3_plus30_plus15_plus27_plus9 unk_recommended_stance_angles=Unknown
% @importance 0.9

0.82::true_val(recommended_stance_angles, angles_18_3_30_15_27_9); 0.18::true_val(recommended_stance_angles, unk_recommended_stance_angles).
measured(s7, recommended_stance_angles, angles_18_3_30_15_27_9).
all_consistent(recommended_stance_angles) :- consistent(s7, recommended_stance_angles).
evidence(all_consistent(recommended_stance_angles)).
query(true_val(recommended_stance_angles, angles_18_3_30_15_27_9)).
query(true_val(recommended_stance_angles, unk_recommended_stance_angles)).