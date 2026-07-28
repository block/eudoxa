0.12::indep(s1).
0.15::indep(s2).
0.20::indep(s15).
0.25::indep(s16).
0.12::indep(s18).
0.15::indep(s21).
0.15::indep(s_merchant).
0.30::indep(s28).
0.15::indep(s17).
0.20::indep(s19).
0.15::indep(s20).
0.12::indep(s22).
0.25::indep(s23).
0.80::indep(s24).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values jones_snowboards=Jones_Snowboards unk_brand=Unknown
% @importance 0.9

0.93::acc(s1, brand).

0.93::true_val(brand, jones_snowboards); 0.07::true_val(brand, unk_brand).

measured(s1, brand, jones_snowboards).

all_consistent(brand) :-
    (indep(s1), consistent(s1, brand) ; \+indep(s1)).

evidence(all_consistent(brand)).
query(true_val(brand, jones_snowboards)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values hovercraft_2_0=Hovercraft_2.0 unk_model_name=Unknown
% @importance 0.9

0.93::acc(s1, model_name).

0.93::true_val(model_name, hovercraft_2_0); 0.07::true_val(model_name, unk_model_name).

measured(s1, model_name, hovercraft_2_0).

all_consistent(model_name) :-
    (indep(s1), consistent(s1, model_name) ; \+indep(s1)).

evidence(all_consistent(model_name)).
query(true_val(model_name, hovercraft_2_0)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2027=2027 unk_model_year=Unknown
% @importance 0.9

0.93::acc(s1, model_year).

0.93::true_val(model_year, y2027); 0.07::true_val(model_year, unk_model_year).

measured(s1, model_year, y2027).

all_consistent(model_year) :-
    (indep(s1), consistent(s1, model_year) ; \+indep(s1)).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2027)).
query(true_val(model_year, unk_model_year)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.9

0.93::acc(s1, product_type).

0.93::true_val(product_type, snowboard); 0.07::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).

all_consistent(product_type) :-
    (indep(s1), consistent(s1, product_type) ; \+indep(s1)).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values freeride_powder=Freeride-Powder unk_board_category=Unknown
% @importance 0.9

0.88::acc(s2, board_category).

0.88::true_val(board_category, freeride_powder); 0.12::true_val(board_category, unk_board_category).

measured(s2, board_category, freeride_powder).

all_consistent(board_category) :-
    (indep(s2), consistent(s2, board_category) ; \+indep(s2)).

evidence(all_consistent(board_category)).
query(true_val(board_category, freeride_powder)).
query(true_val(board_category, unk_board_category)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values unisex=Unisex unk_gender=Unknown
% @importance 1.0

0.95::acc(s3, gender).

0.95::true_val(gender, unisex); 0.05::true_val(gender, unk_gender).

measured(s3, gender, unisex).

all_consistent(gender) :-
    consistent(s3, gender).

evidence(all_consistent(gender)).
query(true_val(gender, unisex)).
query(true_val(gender, unk_gender)).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values original_hovercraft=Original_Hovercraft_2011-2023 unk_predecessor_model_name=Unknown
% @importance 0.6

0.93::acc(s4, predecessor_model_name).

0.90::true_val(predecessor_model_name, original_hovercraft); 0.10::true_val(predecessor_model_name, unk_predecessor_model_name).

measured(s4, predecessor_model_name, original_hovercraft).

all_consistent(predecessor_model_name) :-
    consistent(s4, predecessor_model_name).

evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, original_hovercraft)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2010_11=2010/2011 unk_model_first_available_year=Unknown
% @importance 0.5

0.85::acc(s5, model_first_available_year).

0.85::true_val(model_first_available_year, season_2010_11); 0.15::true_val(model_first_available_year, unk_model_first_available_year).

measured(s5, model_first_available_year, season_2010_11).

all_consistent(model_first_available_year) :-
    consistent(s5, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2010_11)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr redesign_year
% @type categorical
% @canonical true
% @original_name redesign_year
% @values season_2023_24=2023/2024 unk_redesign_year=Unknown
% @importance 0.5

0.85::acc(s9, redesign_year).

0.85::true_val(redesign_year, season_2023_24); 0.15::true_val(redesign_year, unk_redesign_year).

measured(s9, redesign_year, season_2023_24).

all_consistent(redesign_year) :-
    consistent(s9, redesign_year).

evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, season_2023_24)).
query(true_val(redesign_year, unk_redesign_year)).

% @attr unchanged_2024_to_2025
% @type categorical
% @canonical false
% @original_name Hovercraft 2.0 unchanged from 2024 to 2025
% @values yes_same=Same_exact_board unk_unchanged_2024_to_2025=Unknown
% @importance 0.9

0.85::acc(s7, unchanged_2024_to_2025).

0.85::true_val(unchanged_2024_to_2025, yes_same); 0.15::true_val(unchanged_2024_to_2025, unk_unchanged_2024_to_2025).

measured(s7, unchanged_2024_to_2025, yes_same).

all_consistent(unchanged_2024_to_2025) :-
    consistent(s7, unchanged_2024_to_2025).

evidence(all_consistent(unchanged_2024_to_2025)).
query(true_val(unchanged_2024_to_2025, yes_same)).
query(true_val(unchanged_2024_to_2025, unk_unchanged_2024_to_2025)).

% @attr hovercraft_legacy
% @type categorical
% @canonical false
% @original_name Hovercraft legacy
% @values first_major_update_14_years=First_major_update_after_14_years unk_hovercraft_legacy=Unknown
% @importance 0.9

0.88::acc(s8, hovercraft_legacy).

0.88::true_val(hovercraft_legacy, first_major_update_14_years); 0.12::true_val(hovercraft_legacy, unk_hovercraft_legacy).

measured(s8, hovercraft_legacy, first_major_update_14_years).

all_consistent(hovercraft_legacy) :-
    consistent(s8, hovercraft_legacy).

evidence(all_consistent(hovercraft_legacy)).
query(true_val(hovercraft_legacy, first_major_update_14_years)).
query(true_val(hovercraft_legacy, unk_hovercraft_legacy)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values shearer_autti_warnick_goodman_murphy=Forrest_Shearer_Antti_Autti_Garrett_Warnick_Jimmy_Goodman_Nathaniel_Murphy unk_pro_rider_name=Unknown
% @importance 1.0

0.95::acc(s3, pro_rider_name).

0.95::true_val(pro_rider_name, shearer_autti_warnick_goodman_murphy); 0.05::true_val(pro_rider_name, unk_pro_rider_name).

measured(s3, pro_rider_name, shearer_autti_warnick_goodman_murphy).

all_consistent(pro_rider_name) :-
    consistent(s3, pro_rider_name).

evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, shearer_autti_warnick_goodman_murphy)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr design_philosophy
% @type categorical
% @canonical false
% @original_name Design philosophy
% @values surf_inspired_freeride=Surf-inspired_freeride unk_design_philosophy=Unknown
% @importance 0.85

0.88::acc(s9, design_philosophy).

0.88::true_val(design_philosophy, surf_inspired_freeride); 0.12::true_val(design_philosophy, unk_design_philosophy).

measured(s9, design_philosophy, surf_inspired_freeride).

all_consistent(design_philosophy) :-
    consistent(s9, design_philosophy).

evidence(all_consistent(design_philosophy)).
query(true_val(design_philosophy, surf_inspired_freeride)).
query(true_val(design_philosophy, unk_design_philosophy)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values jones_nidecker=Jones_Snowboards_Nidecker_Group unk_manufacturer=Unknown
% @importance 0.5

0.85::acc(s10, manufacturer).

0.85::true_val(manufacturer, jones_nidecker); 0.15::true_val(manufacturer, unk_manufacturer).

measured(s10, manufacturer, jones_nidecker).

all_consistent(manufacturer) :-
    consistent(s10, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, jones_nidecker)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr founded
% @type categorical
% @canonical false
% @original_name Founded
% @values y2009=2009 y2010=2010
% @importance 0.4

0.93::acc(s11, founded).
0.80::acc(s10, founded).
0.78::acc(s12, founded).

0.55::true_val(founded, y2009); 0.45::true_val(founded, y2010).

measured(s11, founded, y2009).
measured(s10, founded, y2010).
measured(s12, founded, y2010).

all_consistent(founded) :-
    consistent(s11, founded),
    consistent(s10, founded),
    consistent(s12, founded).

evidence(all_consistent(founded)).
query(true_val(founded, y2009)).
query(true_val(founded, y2010)).

% @attr founder
% @type categorical
% @canonical false
% @original_name Founder
% @values jeremy_jones=Jeremy_Jones unk_founder=Unknown
% @importance 0.4

0.93::acc(s11, founder).

0.93::true_val(founder, jeremy_jones); 0.07::true_val(founder, unk_founder).

measured(s11, founder, jeremy_jones).

all_consistent(founder) :-
    consistent(s11, founder).

evidence(all_consistent(founder)).
query(true_val(founder, jeremy_jones)).
query(true_val(founder, unk_founder)).

% @attr headquarters
% @type categorical
% @canonical false
% @original_name Headquarters
% @values truckee_ca=Truckee_California unk_headquarters=Unknown
% @importance 1.0

0.95::acc(s3, headquarters).

0.95::true_val(headquarters, truckee_ca); 0.05::true_val(headquarters, unk_headquarters).

measured(s3, headquarters, truckee_ca).

all_consistent(headquarters) :-
    consistent(s3, headquarters).

evidence(all_consistent(headquarters)).
query(true_val(headquarters, truckee_ca)).
query(true_val(headquarters, unk_headquarters)).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values solico_dubai_uae=Solico_Winter_Sport_Factory_Dubai_UAE unk_manufacturing_location=Unknown
% @importance 0.7

0.88::acc(s1, manufacturing_location).

0.88::true_val(manufacturing_location, solico_dubai_uae); 0.12::true_val(manufacturing_location, unk_manufacturing_location).

measured(s1, manufacturing_location, solico_dubai_uae).

all_consistent(manufacturing_location) :-
    (indep(s1), consistent(s1, manufacturing_location) ; \+indep(s1)).

evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, solico_dubai_uae)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values solar_100pct=100pct_solar_power_89pct_CO2_reduction unk_sustainability_certification=Unknown
% @importance 0.6

0.92::acc(s4, sustainability_certification).

0.92::true_val(sustainability_certification, solar_100pct); 0.08::true_val(sustainability_certification, unk_sustainability_certification).

measured(s4, sustainability_certification, solar_100pct).

all_consistent(sustainability_certification) :-
    consistent(s4, sustainability_certification).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, solar_100pct)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr parent_company
% @type categorical
% @canonical false
% @original_name Parent company
% @values nidecker_group=Nidecker_Group_NDK unk_parent_company=Unknown
% @importance 0.5

0.85::acc(s10, parent_company).

0.85::true_val(parent_company, nidecker_group); 0.15::true_val(parent_company, unk_parent_company).

measured(s10, parent_company, nidecker_group).

all_consistent(parent_company) :-
    consistent(s10, parent_company).

evidence(all_consistent(parent_company)).
query(true_val(parent_company, nidecker_group)).
query(true_val(parent_company, unk_parent_company)).

% @attr sustainability_certification_1pct
% @type categorical
% @canonical false
% @original_name sustainability_certification (1% For The Planet)
% @values one_pct_planet=1pct_For_The_Planet_member unk_sustainability_certification_1pct=Unknown
% @importance 0.65

0.85::acc(s15, sustainability_certification_1pct).

0.85::true_val(sustainability_certification_1pct, one_pct_planet); 0.15::true_val(sustainability_certification_1pct, unk_sustainability_certification_1pct).

measured(s15, sustainability_certification_1pct, one_pct_planet).

all_consistent(sustainability_certification_1pct) :-
    (indep(s15), consistent(s15, sustainability_certification_1pct) ; \+indep(s15)).

evidence(all_consistent(sustainability_certification_1pct)).
query(true_val(sustainability_certification_1pct, one_pct_planet)).
query(true_val(sustainability_certification_1pct, unk_sustainability_certification_1pct)).

% @attr sustainability_certification_pow
% @type categorical
% @canonical false
% @original_name sustainability_certification (POW)
% @values pow_support=Supports_Protect_Our_Winters unk_sustainability_certification_pow=Unknown
% @importance 0.65

0.85::acc(s15, sustainability_certification_pow).

0.85::true_val(sustainability_certification_pow, pow_support); 0.15::true_val(sustainability_certification_pow, unk_sustainability_certification_pow).

measured(s15, sustainability_certification_pow, pow_support).

all_consistent(sustainability_certification_pow) :-
    (indep(s15), consistent(s15, sustainability_certification_pow) ; \+indep(s15)).

evidence(all_consistent(sustainability_certification_pow)).
query(true_val(sustainability_certification_pow, pow_support)).
query(true_val(sustainability_certification_pow, unk_sustainability_certification_pow)).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v629_95=629.95 unk_price_usd_msrp=Unknown
% @importance 1.0

0.95::acc(s3, price_usd_msrp).

0.95::true_val(price_usd_msrp, v629_95); 0.05::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s3, price_usd_msrp, v629_95).

all_consistent(price_usd_msrp) :-
    consistent(s3, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v629_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_evo
% @values v419_95=419.95 unk_price_usd_evo=Unknown
% @importance 0.95

0.92::acc(s16, price_usd_evo).

0.92::true_val(price_usd_evo, v419_95); 0.08::true_val(price_usd_evo, unk_price_usd_evo).

measured(s16, price_usd_evo, v419_95).

all_consistent(price_usd_evo) :-
    consistent(s16, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v419_95)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_rei
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_rei
% @values v629_83=629.83 unk_price_usd_rei=Unknown
% @importance 0.9

0.85::acc(s7, price_usd_rei).

0.85::true_val(price_usd_rei, v629_83); 0.15::true_val(price_usd_rei, unk_price_usd_rei).

measured(s7, price_usd_rei, v629_83).

all_consistent(price_usd_rei) :-
    consistent(s7, price_usd_rei).

evidence(all_consistent(price_usd_rei)).
query(true_val(price_usd_rei, v629_83)).
query(true_val(price_usd_rei, unk_price_usd_rei)).

% @attr price_usd_tactics
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_tactics
% @values v629_95=629.95 unk_price_usd_tactics=Unknown
% @importance 0.9

0.85::acc(s7, price_usd_tactics).

0.85::true_val(price_usd_tactics, v629_95); 0.15::true_val(price_usd_tactics, unk_price_usd_tactics).

measured(s7, price_usd_tactics, v629_95).

all_consistent(price_usd_tactics) :-
    consistent(s7, price_usd_tactics).

evidence(all_consistent(price_usd_tactics)).
query(true_val(price_usd_tactics, v629_95)).
query(true_val(price_usd_tactics, unk_price_usd_tactics)).

% @attr price_usd_backcountry
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_backcountry
% @values v629_95=629.95 unk_price_usd_backcountry=Unknown
% @importance 0.9

0.85::acc(s7, price_usd_backcountry).

0.85::true_val(price_usd_backcountry, v629_95); 0.15::true_val(price_usd_backcountry, unk_price_usd_backcountry).

measured(s7, price_usd_backcountry, v629_95).

all_consistent(price_usd_backcountry) :-
    consistent(s7, price_usd_backcountry).

evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v629_95)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

% @attr price_usd_christy
% @type numeric
% @unit USD
% @canonical false
% @original_name Price (Christy Sports)
% @values v629_95=629.95 unk_price_usd_christy=Unknown
% @importance 0.9

0.85::acc(s7, price_usd_christy).

0.85::true_val(price_usd_christy, v629_95); 0.15::true_val(price_usd_christy, unk_price_usd_christy).

measured(s7, price_usd_christy, v629_95).

all_consistent(price_usd_christy) :-
    consistent(s7, price_usd_christy).

evidence(all_consistent(price_usd_christy)).
query(true_val(price_usd_christy, v629_95)).
query(true_val(price_usd_christy, unk_price_usd_christy)).

% @attr price_cad_adrenaline
% @type numeric
% @unit CAD
% @canonical false
% @original_name Price (CAD, Boutique Adrenaline)
% @values v769=769.0 unk_price_cad_adrenaline=Unknown
% @importance 0.8

0.82::acc(s17, price_cad_adrenaline).

0.82::true_val(price_cad_adrenaline, v769); 0.18::true_val(price_cad_adrenaline, unk_price_cad_adrenaline).

measured(s17, price_cad_adrenaline, v769).

all_consistent(price_cad_adrenaline) :-
    consistent(s17, price_cad_adrenaline).

evidence(all_consistent(price_cad_adrenaline)).
query(true_val(price_cad_adrenaline, v769)).
query(true_val(price_cad_adrenaline, unk_price_cad_adrenaline)).

% @attr price_usd_nz_shred
% @type numeric
% @unit USD
% @canonical false
% @original_name Price (NZD/USD, NZ Shred)
% @values v785=785.0 unk_price_usd_nz_shred=Unknown
% @importance 0.8

0.80::acc(s18, price_usd_nz_shred).

0.80::true_val(price_usd_nz_shred, v785); 0.20::true_val(price_usd_nz_shred, unk_price_usd_nz_shred).

measured(s18, price_usd_nz_shred, v785).

all_consistent(price_usd_nz_shred) :-
    consistent(s18, price_usd_nz_shred).

evidence(all_consistent(price_usd_nz_shred)).
query(true_val(price_usd_nz_shred, v785)).
query(true_val(price_usd_nz_shred, unk_price_usd_nz_shred)).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v1149_99=1149.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.95::acc(s_merchant, price_aud_merchant).

0.95::true_val(price_aud_merchant, v1149_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s_merchant, price_aud_merchant, v1149_99).

all_consistent(price_aud_merchant) :-
    consistent(s_merchant, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v1149_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_eur_blue_tomato
% @type numeric
% @unit EUR
% @canonical true
% @original_name price_eur_blue_tomato
% @values v479=479.0 unk_price_eur_blue_tomato=Unknown
% @importance 0.9

0.82::acc(s7, price_eur_blue_tomato).

0.82::true_val(price_eur_blue_tomato, v479); 0.18::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).

measured(s7, price_eur_blue_tomato, v479).

all_consistent(price_eur_blue_tomato) :-
    consistent(s7, price_eur_blue_tomato).

evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v479)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values preorder_june_2026=Preorder_estimated_June_2026 unk_availability_status=Unknown
% @importance 0.85

0.95::acc(s_merchant, availability_status).

0.95::true_val(availability_status, preorder_june_2026); 0.05::true_val(availability_status, unk_availability_status).

measured(s_merchant, availability_status, preorder_june_2026).

all_consistent(availability_status) :-
    consistent(s_merchant, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, preorder_june_2026)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_jones_site
% @type categorical
% @canonical false
% @original_name availability_status (Jones site)
% @values sold_out=All_sizes_sold_out unk_availability_status_jones_site=Unknown
% @importance 1.0

0.95::acc(s3, availability_status_jones_site).

0.95::true_val(availability_status_jones_site, sold_out); 0.05::true_val(availability_status_jones_site, unk_availability_status_jones_site).

measured(s3, availability_status_jones_site, sold_out).

all_consistent(availability_status_jones_site) :-
    consistent(s3, availability_status_jones_site).

evidence(all_consistent(availability_status_jones_site)).
query(true_val(availability_status_jones_site, sold_out)).
query(true_val(availability_status_jones_site, unk_availability_status_jones_site)).

% @attr retailer_jones_direct
% @type categorical
% @canonical false
% @original_name Retailer (Jones direct)
% @values available=Available_30day_returns_free_ship_100 unk_retailer_jones_direct=Unknown
% @importance 1.0

0.95::acc(s3, retailer_jones_direct).

0.95::true_val(retailer_jones_direct, available); 0.05::true_val(retailer_jones_direct, unk_retailer_jones_direct).

measured(s3, retailer_jones_direct, available).

all_consistent(retailer_jones_direct) :-
    consistent(s3, retailer_jones_direct).

evidence(all_consistent(retailer_jones_direct)).
query(true_val(retailer_jones_direct, available)).
query(true_val(retailer_jones_direct, unk_retailer_jones_direct)).

% @attr retailer_evo
% @type categorical
% @canonical false
% @original_name Retailer (evo)
% @values available=Available_low_price_guarantee unk_retailer_evo=Unknown
% @importance 0.95

0.92::acc(s16, retailer_evo).

0.92::true_val(retailer_evo, available); 0.08::true_val(retailer_evo, unk_retailer_evo).

measured(s16, retailer_evo, available).

all_consistent(retailer_evo) :-
    consistent(s16, retailer_evo).

evidence(all_consistent(retailer_evo)).
query(true_val(retailer_evo, available)).
query(true_val(retailer_evo, unk_retailer_evo)).

% @attr retailer_rei
% @type categorical
% @canonical false
% @original_name Retailer (REI)
% @values available=Available_great_return_policy unk_retailer_rei=Unknown
% @importance 0.7

0.88::acc(s19, retailer_rei).

0.88::true_val(retailer_rei, available); 0.12::true_val(retailer_rei, unk_retailer_rei).

measured(s19, retailer_rei, available).

all_consistent(retailer_rei) :-
    consistent(s19, retailer_rei).

evidence(all_consistent(retailer_rei)).
query(true_val(retailer_rei, available)).
query(true_val(retailer_rei, unk_retailer_rei)).

% @attr retailer_tactics
% @type categorical
% @canonical false
% @original_name Retailer (Tactics)
% @values available=Available_Portland_boardshop unk_retailer_tactics=Unknown
% @importance 0.65

0.85::acc(s15, retailer_tactics).

0.85::true_val(retailer_tactics, available); 0.15::true_val(retailer_tactics, unk_retailer_tactics).

measured(s15, retailer_tactics, available).

all_consistent(retailer_tactics) :-
    consistent(s15, retailer_tactics).

evidence(all_consistent(retailer_tactics)).
query(true_val(retailer_tactics, available)).
query(true_val(retailer_tactics, unk_retailer_tactics)).

% @attr retailer_backcountry
% @type categorical
% @canonical false
% @original_name Retailer (Backcountry)
% @values available=Available unk_retailer_backcountry=Unknown
% @importance 0.9

0.85::acc(s7, retailer_backcountry).

0.85::true_val(retailer_backcountry, available); 0.15::true_val(retailer_backcountry, unk_retailer_backcountry).

measured(s7, retailer_backcountry, available).

all_consistent(retailer_backcountry) :-
    consistent(s7, retailer_backcountry).

evidence(all_consistent(retailer_backcountry)).
query(true_val(retailer_backcountry, available)).
query(true_val(retailer_backcountry, unk_retailer_backcountry)).

% @attr retailer_christy
% @type categorical
% @canonical false
% @original_name Retailer (Christy Sports)
% @values available=Available_CO_UT_chain unk_retailer_christy=Unknown
% @importance 0.6

0.82::acc(s20, retailer_christy).

0.82::true_val(retailer_christy, available); 0.18::true_val(retailer_christy, unk_retailer_christy).

measured(s20, retailer_christy, available).

all_consistent(retailer_christy) :-
    consistent(s20, retailer_christy).

evidence(all_consistent(retailer_christy)).
query(true_val(retailer_christy, available)).
query(true_val(retailer_christy, unk_retailer_christy)).

% @attr retailer_ski_monster
% @type categorical
% @canonical false
% @original_name Retailer (The Ski Monster)
% @values available=Available_staff_tested unk_retailer_ski_monster=Unknown
% @importance 0.7

0.88::acc(s1, retailer_ski_monster).

0.88::true_val(retailer_ski_monster, available); 0.12::true_val(retailer_ski_monster, unk_retailer_ski_monster).

measured(s1, retailer_ski_monster, available).

all_consistent(retailer_ski_monster) :-
    consistent(s1, retailer_ski_monster).

evidence(all_consistent(retailer_ski_monster)).
query(true_val(retailer_ski_monster, available)).
query(true_val(retailer_ski_monster, unk_retailer_ski_monster)).

% @attr retailer_eriks
% @type categorical
% @canonical false
% @original_name Retailer (ERIK'S)
% @values available=Available_regional_US unk_retailer_eriks=Unknown
% @importance 0.7

0.85::acc(s21, retailer_eriks).

0.85::true_val(retailer_eriks, available); 0.15::true_val(retailer_eriks, unk_retailer_eriks).

measured(s21, retailer_eriks, available).

all_consistent(retailer_eriks) :-
    consistent(s21, retailer_eriks).

evidence(all_consistent(retailer_eriks)).
query(true_val(retailer_eriks, available)).
query(true_val(retailer_eriks, unk_retailer_eriks)).

% @attr retailer_sports_basement
% @type categorical
% @canonical false
% @original_name Retailer (Sports Basement)
% @values available=Available_Bay_Area unk_retailer_sports_basement=Unknown
% @importance 0.5

0.78::acc(s22, retailer_sports_basement).

0.78::true_val(retailer_sports_basement, available); 0.22::true_val(retailer_sports_basement, unk_retailer_sports_basement).

measured(s22, retailer_sports_basement, available).

all_consistent(retailer_sports_basement) :-
    consistent(s22, retailer_sports_basement).

evidence(all_consistent(retailer_sports_basement)).
query(true_val(retailer_sports_basement, available)).
query(true_val(retailer_sports_basement, unk_retailer_sports_basement)).

% @attr retailer_melbourne_snowboard
% @type categorical
% @canonical false
% @original_name Retailer (Melbourne Snowboard Centre)
% @values available=Available_Australian_dealer unk_retailer_melbourne_snowboard=Unknown
% @importance 0.9

0.88::acc(s2, retailer_melbourne_snowboard).

0.88::true_val(retailer_melbourne_snowboard, available); 0.12::true_val(retailer_melbourne_snowboard, unk_retailer_melbourne_snowboard).

measured(s2, retailer_melbourne_snowboard, available).

all_consistent(retailer_melbourne_snowboard) :-
    consistent(s2, retailer_melbourne_snowboard).

evidence(all_consistent(retailer_melbourne_snowboard)).
query(true_val(retailer_melbourne_snowboard, available)).
query(true_val(retailer_melbourne_snowboard, unk_retailer_melbourne_snowboard)).

% @attr retailer_nz_shred
% @type categorical
% @canonical false
% @original_name Retailer (NZ Shred)
% @values available=Available_NZ_dealer unk_retailer_nz_shred=Unknown
% @importance 0.8

0.80::acc(s18, retailer_nz_shred).

0.80::true_val(retailer_nz_shred, available); 0.20::true_val(retailer_nz_shred, unk_retailer_nz_shred).

measured(s18, retailer_nz_shred, available).

all_consistent(retailer_nz_shred) :-
    consistent(s18, retailer_nz_shred).

evidence(all_consistent(retailer_nz_shred)).
query(true_val(retailer_nz_shred, available)).
query(true_val(retailer_nz_shred, unk_retailer_nz_shred)).

% @attr retailer_underground
% @type categorical
% @canonical false
% @original_name Retailer (Underground Snowboards)
% @values available=Available_Breckenridge_since_1988 unk_retailer_underground=Unknown
% @importance 0.4

0.78::acc(s23, retailer_underground).

0.78::true_val(retailer_underground, available); 0.22::true_val(retailer_underground, unk_retailer_underground).

measured(s23, retailer_underground, available).

all_consistent(retailer_underground) :-
    consistent(s23, retailer_underground).

evidence(all_consistent(retailer_underground)).
query(true_val(retailer_underground, available)).
query(true_val(retailer_underground, unk_retailer_underground)).

% @attr retailer_jones_reup
% @type categorical
% @canonical false
% @original_name Retailer (Jones ReUp)
% @values available=Available_refurbished_used unk_retailer_jones_reup=Unknown
% @importance 0.5

0.88::acc(s24, retailer_jones_reup).

0.88::true_val(retailer_jones_reup, available); 0.12::true_val(retailer_jones_reup, unk_retailer_jones_reup).

measured(s24, retailer_jones_reup, available).

all_consistent(retailer_jones_reup) :-
    consistent(s24, retailer_jones_reup).

evidence(all_consistent(retailer_jones_reup)).
query(true_val(retailer_jones_reup, available)).
query(true_val(retailer_jones_reup, unk_retailer_jones_reup)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 1.0

0.95::acc(s3, shape).

0.95::true_val(shape, tapered_directional); 0.05::true_val(shape, unk_shape).

measured(s3, shape, tapered_directional).

all_consistent(shape) :-
    consistent(s3, shape).

evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

% @attr shape_description
% @type categorical
% @canonical false
% @original_name Shape description
% @values high_tapered_dir_nimble_float=High_Tapered_Directional_nimble_float_long_sidecuts unk_shape_description=Unknown
% @importance 0.7

0.82::acc(s18, shape_description).

0.82::true_val(shape_description, high_tapered_dir_nimble_float); 0.18::true_val(shape_description, unk_shape_description).

measured(s18, shape_description, high_tapered_dir_nimble_float).

all_consistent(shape_description) :-
    (indep(s18), consistent(s18, shape_description) ; \+indep(s18)).

evidence(all_consistent(shape_description)).
query(true_val(shape_description, high_tapered_dir_nimble_float)).
query(true_val(shape_description, unk_shape_description)).

% @attr nose_design
% @type categorical
% @canonical false
% @original_name Nose design
% @values blunt_nose=Blunt_nose_maximized_surface_area unk_nose_design=Unknown
% @importance 0.75

0.88::acc(s16, nose_design).

0.88::true_val(nose_design, blunt_nose); 0.12::true_val(nose_design, unk_nose_design).

measured(s16, nose_design, blunt_nose).

all_consistent(nose_design) :-
    (indep(s16), consistent(s16, nose_design) ; \+indep(s16)).

evidence(all_consistent(nose_design)).
query(true_val(nose_design, blunt_nose)).
query(true_val(nose_design, unk_nose_design)).

% @attr tail_design
% @type categorical
% @canonical false
% @original_name Tail design
% @values short_swallow_tail=Short_with_small_swallow_tail unk_tail_design=Unknown
% @importance 0.9

0.88::acc(s8, tail_design).

0.88::true_val(tail_design, short_swallow_tail); 0.12::true_val(tail_design, unk_tail_design).

measured(s8, tail_design, short_swallow_tail).

all_consistent(tail_design) :-
    consistent(s8, tail_design).

evidence(all_consistent(tail_design)).
query(true_val(tail_design, short_swallow_tail)).
query(true_val(tail_design, unk_tail_design)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values dir_camber_rocker=Directional_Camber_Rocker unk_camber_type=Unknown
% @importance 1.0

0.95::acc(s3, camber_type).

0.95::true_val(camber_type, dir_camber_rocker); 0.05::true_val(camber_type, unk_camber_type).

measured(s3, camber_type, dir_camber_rocker).

all_consistent(camber_type) :-
    consistent(s3, camber_type).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, dir_camber_rocker)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values camber_body_rocker_nose=Camber_body_rocker_nose_more_tip_rocker_than_tail unk_camber_description=Unknown
% @importance 0.83

0.85::acc(s2, camber_description).
0.88::acc(s16, camber_description).

0.95::true_val(camber_description, camber_body_rocker_nose); 0.05::true_val(camber_description, unk_camber_description).

measured(s2, camber_description, camber_body_rocker_nose).
measured(s16, camber_description, camber_body_rocker_nose).

all_consistent(camber_description) :-
    (indep(s2), consistent(s2, camber_description) ; \+indep(s2)),
    (indep(s16), consistent(s16, camber_description) ; \+indep(s16)).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, camber_body_rocker_nose)).
query(true_val(camber_description, unk_camber_description)).

% @attr base_contour_3d
% @type categorical
% @canonical false
% @original_name 3D Base Contour
% @values high_3d_contour=High_3D_Contour_Base unk_base_contour_3d=Unknown
% @importance 1.0

0.95::acc(s3, base_contour_3d).

0.95::true_val(base_contour_3d, high_3d_contour); 0.05::true_val(base_contour_3d, unk_base_contour_3d).

measured(s3, base_contour_3d, high_3d_contour).

all_consistent(base_contour_3d) :-
    consistent(s3, base_contour_3d).

evidence(all_consistent(base_contour_3d)).
query(true_val(base_contour_3d, high_3d_contour)).
query(true_val(base_contour_3d, unk_base_contour_3d)).

% @attr spoon_bevel_nose
% @type numeric
% @unit mm
% @canonical false
% @original_name 3D base detail / Spoon bevel in nose
% @values v7=7.0 v12=12.0
% @importance 0.8

0.93::acc(s2, spoon_bevel_nose).
0.80::acc(s21, spoon_bevel_nose).

0.60::true_val(spoon_bevel_nose, v7); 0.40::true_val(spoon_bevel_nose, v12).

measured(s2, spoon_bevel_nose, v7).
measured(s21, spoon_bevel_nose, v12).

all_consistent(spoon_bevel_nose) :-
    (indep(s2), consistent(s2, spoon_bevel_nose) ; \+indep(s2)),
    (indep(s21), consistent(s21, spoon_bevel_nose) ; \+indep(s21)).

evidence(all_consistent(spoon_bevel_nose)).
query(true_val(spoon_bevel_nose, v7)).
query(true_val(spoon_bevel_nose, v12)).

% @attr taper
% @type numeric
% @unit mm
% @canonical true
% @original_name taper
% @values v17=17.0 unk_taper=Unknown
% @importance 0.93

0.95::acc(s3, taper).
0.90::acc(s_merchant, taper).

0.97::true_val(taper, v17); 0.03::true_val(taper, unk_taper).

measured(s3, taper, v17).
measured(s_merchant, taper, v17).

all_consistent(taper) :-
    consistent(s3, taper),
    (indep(s_merchant), consistent(s_merchant, taper) ; \+indep(s_merchant)).

evidence(all_consistent(taper)).
query(true_val(taper, v17)).
query(true_val(taper, unk_taper)).

% @attr volume_shift
% @type categorical
% @canonical false
% @original_name Volume shift
% @values slightly_vol_shifted=Slightly_volume-shifted_wider_waist_shorter_length unk_volume_shift=Unknown
% @importance 0.9

0.88::acc(s8, volume_shift).

0.88::true_val(volume_shift, slightly_vol_shifted); 0.12::true_val(volume_shift, unk_volume_shift).

measured(s8, volume_shift, slightly_vol_shifted).

all_consistent(volume_shift) :-
    consistent(s8, volume_shift).

evidence(all_consistent(volume_shift)).
query(true_val(volume_shift, slightly_vol_shifted)).
query(true_val(volume_shift, unk_volume_shift)).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v6=6.0 v7=7.0
% @importance 0.72

0.93::acc(s_merchant, flex_rating_10).
0.88::acc(s1, flex_rating_10).
0.60::acc(s28, flex_rating_10).

0.78::true_val(flex_rating_10, v6); 0.22::true_val(flex_rating_10, v7).

measured(s_merchant, flex_rating_10, v6).
measured(s1, flex_rating_10, v6).
measured(s28, flex_rating_10, v7).

all_consistent(flex_rating_10) :-
    (indep(s_merchant), consistent(s_merchant, flex_rating_10) ; \+indep(s_merchant)),
    (indep(s1), consistent(s1, flex_rating_10) ; \+indep(s1)),
    (indep(s28), consistent(s28, flex_rating_10) ; \+indep(s28)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v6)).
query(true_val(flex_rating_10, v7)).

% @attr flex_rating_5
% @type numeric
% @unit /5
% @canonical true
% @original_name flex_rating_5
% @values v3=3.0 unk_flex_rating_5=Unknown
% @importance 1.0

0.95::acc(s3, flex_rating_5).

0.95::true_val(flex_rating_5, v3); 0.05::true_val(flex_rating_5, unk_flex_rating_5).

measured(s3, flex_rating_5, v3).

all_consistent(flex_rating_5) :-
    consistent(s3, flex_rating_5).

evidence(all_consistent(flex_rating_5)).
query(true_val(flex_rating_5, v3)).
query(true_val(flex_rating_5, unk_flex_rating_5)).

% @attr flex_feel
% @type categorical
% @canonical false
% @original_name flex_feel
% @values medium=Medium_flex_friendly_control unk_flex_feel=Unknown
% @importance 1.0

0.95::acc(s3, flex_feel).

0.95::true_val(flex_feel, medium); 0.05::true_val(flex_feel, unk_flex_feel).

measured(s3, flex_feel, medium).

all_consistent(flex_feel) :-
    consistent(s3, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values directional_soft_nose_stiff_tail=Directional_softer_nose_stiffer_tail unk_flex_direction=Unknown
% @importance 0.78

0.85::acc(s27, flex_direction).
0.85::acc(s9, flex_direction).

0.95::true_val(flex_direction, directional_soft_nose_stiff_tail); 0.05::true_val(flex_direction, unk_flex_direction).

measured(s27, flex_direction, directional_soft_nose_stiff_tail).
measured(s9, flex_direction, directional_soft_nose_stiff_tail).

all_consistent(flex_direction) :-
    consistent(s27, flex_direction),
    consistent(s9, flex_direction).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional_soft_nose_stiff_tail)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr torsional_flex
% @type categorical
% @canonical false
% @original_name Torsional flex
% @values mid_soft=Mid-soft_torsional_flex unk_torsional_flex=Unknown
% @importance 0.9

0.85::acc(s2, torsional_flex).

0.85::true_val(torsional_flex, mid_soft); 0.15::true_val(torsional_flex, unk_torsional_flex).

measured(s2, torsional_flex, mid_soft).

all_consistent(torsional_flex) :-
    (indep(s2), consistent(s2, torsional_flex) ; \+indep(s2)).

evidence(all_consistent(torsional_flex)).
query(true_val(torsional_flex, mid_soft)).
query(true_val(torsional_flex, unk_torsional_flex)).

% @attr flex_treatment
% @type categorical
% @canonical false
% @original_name Flex treatment
% @values forever_flex=Forever_Flex_factory_broken_in unk_flex_treatment=Unknown
% @importance 0.78

0.90::acc(s_merchant, flex_treatment).
0.82::acc(s21, flex_treatment).

0.95::true_val(flex_treatment, forever_flex); 0.05::true_val(flex_treatment, unk_flex_treatment).

measured(s_merchant, flex_treatment, forever_flex).
measured(s21, flex_treatment, forever_flex).

all_consistent(flex_treatment) :-
    (indep(s_merchant), consistent(s_merchant, flex_treatment) ; \+indep(s_merchant)),
    (indep(s21), consistent(s21, flex_treatment) ; \+indep(s21)).

evidence(all_consistent(flex_treatment)).
query(true_val(flex_treatment, forever_flex)).
query(true_val(flex_treatment, unk_flex_treatment)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values reup_tech_paulownia_poplar=Re-Up_Tech_Core_Paulownia_Poplar_reclaimed_stringers unk_core_material=Unknown
% @importance 1.0

0.95::acc(s3, core_material).

0.95::true_val(core_material, reup_tech_paulownia_poplar); 0.05::true_val(core_material, unk_core_material).

measured(s3, core_material, reup_tech_paulownia_poplar).

all_consistent(core_material) :-
    consistent(s3, core_material).

evidence(all_consistent(core_material)).
query(true_val(core_material, reup_tech_paulownia_poplar)).
query(true_val(core_material, unk_core_material)).

% @attr sustainability_certification_fsc
% @type categorical
% @canonical false
% @original_name sustainability_certification (FSC)
% @values fsc_certified=FSC_certified_wood_core unk_sustainability_certification_fsc=Unknown
% @importance 0.65

0.85::acc(s15, sustainability_certification_fsc).

0.85::true_val(sustainability_certification_fsc, fsc_certified); 0.15::true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc).

measured(s15, sustainability_certification_fsc, fsc_certified).

all_consistent(sustainability_certification_fsc) :-
    (indep(s15), consistent(s15, sustainability_certification_fsc) ; \+indep(s15)).

evidence(all_consistent(sustainability_certification_fsc)).
query(true_val(sustainability_certification_fsc, fsc_certified)).
query(true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc)).

% @attr construction_material_innovation
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values reclaimed_stringers=Embedded_stringers_from_reclaimed_snowboards unk_construction_material_innovation=Unknown
% @importance 1.0

0.95::acc(s3, construction_material_innovation).

0.95::true_val(construction_material_innovation, reclaimed_stringers); 0.05::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s3, construction_material_innovation, reclaimed_stringers).

all_consistent(construction_material_innovation) :-
    consistent(s3, construction_material_innovation).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, reclaimed_stringers)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values biax_fiberglass=Biax_Fiberglass biax_fiberglass_carbon=Biax_Fiberglass_and_Carbon
% @importance 0.85

0.93::acc(s3, laminate).
0.70::acc(s1, laminate).

0.70::true_val(laminate, biax_fiberglass); 0.30::true_val(laminate, biax_fiberglass_carbon).

measured(s3, laminate, biax_fiberglass).
measured(s1, laminate, biax_fiberglass_carbon).

all_consistent(laminate) :-
    consistent(s3, laminate),
    (indep(s1), consistent(s1, laminate) ; \+indep(s1)).

evidence(all_consistent(laminate)).
query(true_val(laminate, biax_fiberglass)).
query(true_val(laminate, biax_fiberglass_carbon)).

% @attr laminate_construction
% @type categorical
% @canonical false
% @original_name laminate (construction)
% @values dual_layer_dual_dir=Dual-layer_dual-directional unk_laminate_construction=Unknown
% @importance 1.0

0.95::acc(s3, laminate_construction).

0.95::true_val(laminate_construction, dual_layer_dual_dir); 0.05::true_val(laminate_construction, unk_laminate_construction).

measured(s3, laminate_construction, dual_layer_dual_dir).

all_consistent(laminate_construction) :-
    consistent(s3, laminate_construction).

evidence(all_consistent(laminate_construction)).
query(true_val(laminate_construction, dual_layer_dual_dir)).
query(true_val(laminate_construction, unk_laminate_construction)).

% @attr resin
% @type categorical
% @canonical false
% @original_name resin
% @values bio_resin=Bio_Resin_27pct_plant_based_carbon unk_resin=Unknown
% @importance 1.0

0.95::acc(s3, resin).

0.95::true_val(resin, bio_resin); 0.05::true_val(resin, unk_resin).

measured(s3, resin, bio_resin).

all_consistent(resin) :-
    consistent(s3, resin).

evidence(all_consistent(resin)).
query(true_val(resin, bio_resin)).
query(true_val(resin, unk_resin)).

% @attr sustainability_certification_bio_resin
% @type categorical
% @canonical false
% @original_name sustainability_certification (bio resin)
% @values bio_resin_33pct_less_ghg=Bio_Resin_33pct_less_GHG_27pct_plant_carbon unk_sustainability_certification_bio_resin=Unknown
% @importance 0.55

0.85::acc(s21, sustainability_certification_bio_resin).
0.90::acc(s4, sustainability_certification_bio_resin).

0.95::true_val(sustainability_certification_bio_resin, bio_resin_33pct_less_ghg); 0.05::true_val(sustainability_certification_bio_resin, unk_sustainability_certification_bio_resin).

measured(s21, sustainability_certification_bio_resin, bio_resin_33pct_less_ghg).
measured(s4, sustainability_certification_bio_resin, bio_resin_33pct_less_ghg).

all_consistent(sustainability_certification_bio_resin) :-
    (indep(s21), consistent(s21, sustainability_certification_bio_resin) ; \+indep(s21)),
    consistent(s4, sustainability_certification_bio_resin).

evidence(all_consistent(sustainability_certification_bio_resin)).
query(true_val(sustainability_certification_bio_resin, bio_resin_33pct_less_ghg)).
query(true_val(sustainability_certification_bio_resin, unk_sustainability_certification_bio_resin)).

% @attr topsheet
% @type categorical
% @canonical false
% @original_name topsheet
% @values sustainable_flax=Sustainable_Flax_Topsheet unk_topsheet=Unknown
% @importance 1.0

0.95::acc(s3, topsheet).

0.95::true_val(topsheet, sustainable_flax); 0.05::true_val(topsheet, unk_topsheet).

measured(s3, topsheet, sustainable_flax).

all_consistent(topsheet) :-
    consistent(s3, topsheet).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, sustainable_flax)).
query(true_val(topsheet, unk_topsheet)).

% @attr topsheet_appearance_description
% @type categorical
% @canonical false
% @original_name topsheet_appearance_description
% @values carbon_neutral_flax_abrasion_resistant=Carbon_neutral_flax_fiber_abrasion_resistant_absorbs_chatter unk_topsheet_appearance_description=Unknown
% @importance 1.0

0.95::acc(s3, topsheet_appearance_description).

0.95::true_val(topsheet_appearance_description, carbon_neutral_flax_abrasion_resistant); 0.05::true_val(topsheet_appearance_description, unk_topsheet_appearance_description).

measured(s3, topsheet_appearance_description, carbon_neutral_flax_abrasion_resistant).

all_consistent(topsheet_appearance_description) :-
    consistent(s3, topsheet_appearance_description).

evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, carbon_neutral_flax_abrasion_resistant)).
query(true_val(topsheet_appearance_description, unk_topsheet_appearance_description)).

% @attr topsheet_benefit
% @type categorical
% @canonical false
% @original_name Topsheet benefit
% @values less_resin_lighter=Flax_uses_less_resin_saves_weight_and_synthetics unk_topsheet_benefit=Unknown
% @importance 0.7

0.82::acc(s21, topsheet_benefit).

0.82::true_val(topsheet_benefit, less_resin_lighter); 0.18::true_val(topsheet_benefit, unk_topsheet_benefit).

measured(s21, topsheet_benefit, less_resin_lighter).

all_consistent(topsheet_benefit) :-
    (indep(s21), consistent(s21, topsheet_benefit) ; \+indep(s21)).

evidence(all_consistent(topsheet_benefit)).
query(true_val(topsheet_benefit, less_resin_lighter)).
query(true_val(topsheet_benefit, unk_topsheet_benefit)).

% @attr sidewall_material
% @type categorical
% @canonical false
% @original_name sidewall_material
% @values recycled_abs=Recycled_ABS unk_sidewall_material=Unknown
% @importance 1.0

0.95::acc(s3, sidewall_material).

0.95::true_val(sidewall_material, recycled_abs); 0.05::true_val(sidewall_material, unk_sidewall_material).

measured(s3, sidewall_material, recycled_abs).

all_consistent(sidewall_material) :-
    consistent(s3, sidewall_material).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, recycled_abs)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr sidewall_construction
% @type categorical
% @canonical false
% @original_name Sidewall construction
% @values rounded_deflecting=Rounded_finish_deflects_impact_prevents_chipping unk_sidewall_construction=Unknown
% @importance 0.9

0.85::acc(s2, sidewall_construction).

0.85::true_val(sidewall_construction, rounded_deflecting); 0.15::true_val(sidewall_construction, unk_sidewall_construction).

measured(s2, sidewall_construction, rounded_deflecting).

all_consistent(sidewall_construction) :-
    (indep(s2), consistent(s2, sidewall_construction) ; \+indep(s2)).

evidence(all_consistent(sidewall_construction)).
query(true_val(sidewall_construction, rounded_deflecting)).
query(true_val(sidewall_construction, unk_sidewall_construction)).

% @attr sustainability_certification_recycled_abs
% @type categorical
% @canonical false
% @original_name sustainability_certification (recycled ABS)
% @values recycled_abs_since_2014=Recycled_ABS_sidewalls_since_2014 unk_sustainability_certification_recycled_abs=Unknown
% @importance 0.8

0.92::acc(s4, sustainability_certification_recycled_abs).
0.93::acc(s3, sustainability_certification_recycled_abs).

0.97::true_val(sustainability_certification_recycled_abs, recycled_abs_since_2014); 0.03::true_val(sustainability_certification_recycled_abs, unk_sustainability_certification_recycled_abs).

measured(s4, sustainability_certification_recycled_abs, recycled_abs_since_2014).
measured(s3, sustainability_certification_recycled_abs, recycled_abs_since_2014).

all_consistent(sustainability_certification_recycled_abs) :-
    consistent(s4, sustainability_certification_recycled_abs),
    consistent(s3, sustainability_certification_recycled_abs).

evidence(all_consistent(sustainability_certification_recycled_abs)).
query(true_val(sustainability_certification_recycled_abs, recycled_abs_since_2014)).
query(true_val(sustainability_certification_recycled_abs, unk_sustainability_certification_recycled_abs)).

% @attr edge_material
% @type categorical
% @canonical false
% @original_name Edge material
% @values recycled_german_steel=Recycled_German_steel unk_edge_material=Unknown
% @importance 0.9

0.85::acc(s2, edge_material).

0.85::true_val(edge_material, recycled_german_steel); 0.15::true_val(edge_material, unk_edge_material).

measured(s2, edge_material, recycled_german_steel).

all_consistent(edge_material) :-
    (indep(s2), consistent(s2, edge_material) ; \+indep(s2)).

evidence(all_consistent(edge_material)).
query(true_val(edge_material, recycled_german_steel)).
query(true_val(edge_material, unk_edge_material)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values traction_tech=Traction_Tech_multiple_contact_points unk_edge_technology=Unknown
% @importance 0.85

0.90::acc(s_merchant, edge_technology).

0.90::true_val(edge_technology, traction_tech); 0.10::true_val(edge_technology, unk_edge_technology).

measured(s_merchant, edge_technology, traction_tech).

all_consistent(edge_technology) :-
    (indep(s_merchant), consistent(s_merchant, edge_technology) ; \+indep(s_merchant)).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, traction_tech)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr edge_description
% @type categorical
% @canonical false
% @original_name Edge description
% @values serrated_knife_enhanced_grip=Serrated_knife_edge_grip_multiple_contact_points unk_edge_description=Unknown
% @importance 0.7

0.82::acc(s18, edge_description).

0.82::true_val(edge_description, serrated_knife_enhanced_grip); 0.18::true_val(edge_description, unk_edge_description).

measured(s18, edge_description, serrated_knife_enhanced_grip).

all_consistent(edge_description) :-
    (indep(s18), consistent(s18, edge_description) ; \+indep(s18)).

evidence(all_consistent(edge_description)).
query(true_val(edge_description, serrated_knife_enhanced_grip)).
query(true_val(edge_description, unk_edge_description)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_8000=Sintered_8000 unk_base_material=Unknown
% @importance 1.0

0.95::acc(s3, base_material).

0.95::true_val(base_material, sintered_8000); 0.05::true_val(base_material, unk_base_material).

measured(s3, base_material, sintered_8000).

all_consistent(base_material) :-
    consistent(s3, base_material).

evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_8000)).
query(true_val(base_material, unk_base_material)).

% @attr base_description
% @type categorical
% @canonical false
% @original_name Base description
% @values uhmwpe_carbon_durable=UHMW-PE_and_carbon_super_durable unk_base_description=Unknown
% @importance 0.65

0.85::acc(s15, base_description).

0.85::true_val(base_description, uhmwpe_carbon_durable); 0.15::true_val(base_description, unk_base_description).

measured(s15, base_description, uhmwpe_carbon_durable).

all_consistent(base_description) :-
    (indep(s15), consistent(s15, base_description) ; \+indep(s15)).

evidence(all_consistent(base_description)).
query(true_val(base_description, uhmwpe_carbon_durable)).
query(true_val(base_description, unk_base_description)).

% @attr base_properties
% @type categorical
% @canonical false
% @original_name Base properties
% @values ultra_fast_wax_absorbent=Ultra_fast_highly_wax_absorbent_easy_to_repair unk_base_properties=Unknown
% @importance 1.0

0.95::acc(s3, base_properties).

0.95::true_val(base_properties, ultra_fast_wax_absorbent); 0.05::true_val(base_properties, unk_base_properties).

measured(s3, base_properties, ultra_fast_wax_absorbent).

all_consistent(base_properties) :-
    consistent(s3, base_properties).

evidence(all_consistent(base_properties)).
query(true_val(base_properties, ultra_fast_wax_absorbent)).
query(true_val(base_properties, unk_base_properties)).

% @attr factory_wax
% @type categorical
% @canonical false
% @original_name Factory wax
% @values wend_natural=WEND_Natural_Wax unk_factory_wax=Unknown
% @importance 1.0

0.95::acc(s3, factory_wax).

0.95::true_val(factory_wax, wend_natural); 0.05::true_val(factory_wax, unk_factory_wax).

measured(s3, factory_wax, wend_natural).

all_consistent(factory_wax) :-
    consistent(s3, factory_wax).

evidence(all_consistent(factory_wax)).
query(true_val(factory_wax, wend_natural)).
query(true_val(factory_wax, unk_factory_wax)).

% @attr factory_tuning
% @type categorical
% @canonical false
% @original_name Factory tuning
% @values detuned_tip_tail=Factory_detuned_tip_tail_ready_to_ride unk_factory_tuning=Unknown
% @importance 0.85

0.90::acc(s_merchant, factory_tuning).

0.90::true_val(factory_tuning, detuned_tip_tail); 0.10::true_val(factory_tuning, unk_factory_tuning).

measured(s_merchant, factory_tuning, detuned_tip_tail).

all_consistent(factory_tuning) :-
    (indep(s_merchant), consistent(s_merchant, factory_tuning) ; \+indep(s_merchant)).

evidence(all_consistent(factory_tuning)).
query(true_val(factory_tuning, detuned_tip_tail)).
query(true_val(factory_tuning, unk_factory_tuning)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 0.93

0.90::acc(s_merchant, mounting_pattern).
0.95::acc(s3, mounting_pattern).

0.97::true_val(mounting_pattern, inserts_2x4); 0.03::true_val(mounting_pattern, unk_mounting_pattern).

measured(s_merchant, mounting_pattern, inserts_2x4).
measured(s3, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :-
    consistent(s3, mounting_pattern),
    (indep(s_merchant), consistent(s_merchant, mounting_pattern) ; \+indep(s_merchant)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr available_sizes_merchant
% @type categorical
% @canonical false
% @original_name available_sizes (merchant stock)
% @values sizes_156_160=156cm_160cm unk_available_sizes_merchant=Unknown
% @importance 0.85

0.95::acc(s_merchant, available_sizes_merchant).

0.95::true_val(available_sizes_merchant, sizes_156_160); 0.05::true_val(available_sizes_merchant, unk_available_sizes_merchant).

measured(s_merchant, available_sizes_merchant, sizes_156_160).

all_consistent(available_sizes_merchant) :-
    consistent(s_merchant, available_sizes_merchant).

evidence(all_consistent(available_sizes_merchant)).
query(true_val(available_sizes_merchant, sizes_156_160)).
query(true_val(available_sizes_merchant, unk_available_sizes_merchant)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values sizes_144_148_152_156_160_164=144_148_152_156_160_164cm unk_available_sizes=Unknown
% @importance 1.0

0.95::acc(s3, available_sizes).

0.95::true_val(available_sizes, sizes_144_148_152_156_160_164); 0.05::true_val(available_sizes, unk_available_sizes).

measured(s3, available_sizes, sizes_144_148_152_156_160_164).

all_consistent(available_sizes) :-
    consistent(s3, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, sizes_144_148_152_156_160_164)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr reviewer_opinion_the_good_ride_sizing
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (sizing)
% @values ride_2_3cm_shorter=Designed_to_ride_2-3cm_shorter unk_reviewer_opinion_the_good_ride_sizing=Unknown
% @importance 1.0

0.90::acc(s3, reviewer_opinion_the_good_ride_sizing).

0.90::true_val(reviewer_opinion_the_good_ride_sizing, ride_2_3cm_shorter); 0.10::true_val(reviewer_opinion_the_good_ride_sizing, unk_reviewer_opinion_the_good_ride_sizing).

measured(s3, reviewer_opinion_the_good_ride_sizing, ride_2_3cm_shorter).

all_consistent(reviewer_opinion_the_good_ride_sizing) :-
    consistent(s3, reviewer_opinion_the_good_ride_sizing).

evidence(all_consistent(reviewer_opinion_the_good_ride_sizing)).
query(true_val(reviewer_opinion_the_good_ride_sizing, ride_2_3cm_shorter)).
query(true_val(reviewer_opinion_the_good_ride_sizing, unk_reviewer_opinion_the_good_ride_sizing)).

% @attr sizing_note
% @type categorical
% @canonical false
% @original_name Sizing note
% @values replaced_both_unisex=Replaced_Hovercraft_and_Womens_now_unisex_sizing unk_sizing_note=Unknown
% @importance 0.85

0.85::acc(s30, sizing_note).

0.85::true_val(sizing_note, replaced_both_unisex); 0.15::true_val(sizing_note, unk_sizing_note).

measured(s30, sizing_note, replaced_both_unisex).

all_consistent(sizing_note) :-
    consistent(s30, sizing_note).

evidence(all_consistent(sizing_note)).
query(true_val(sizing_note, replaced_both_unisex)).
query(true_val(sizing_note, unk_sizing_note)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard=Standard unk_width_options=Unknown
% @importance 0.85

0.90::acc(s_merchant, width_options).

0.90::true_val(width_options, standard); 0.10::true_val(width_options, unk_width_options).

measured(s_merchant, width_options, standard).

all_consistent(width_options) :-
    (indep(s_merchant), consistent(s_merchant, width_options) ; \+indep(s_merchant)).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard)).
query(true_val(width_options, unk_width_options)).

% @attr big_horn_threshold
% @type categorical
% @canonical false
% @original_name Big Horn Series threshold
% @values us_mens_11_5_min_26_3cm=US_Mens_11.5_or_bigger_needs_min_waist_26.3cm unk_big_horn_threshold=Unknown
% @importance 1.0

0.95::acc(s3, big_horn_threshold).

0.95::true_val(big_horn_threshold, us_mens_11_5_min_26_3cm); 0.05::true_val(big_horn_threshold, unk_big_horn_threshold).

measured(s3, big_horn_threshold, us_mens_11_5_min_26_3cm).

all_consistent(big_horn_threshold) :-
    consistent(s3, big_horn_threshold).

evidence(all_consistent(big_horn_threshold)).
query(true_val(big_horn_threshold, us_mens_11_5_min_26_3cm)).
query(true_val(big_horn_threshold, unk_big_horn_threshold)).

% @attr effective_edge_156
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge (156cm)
% @values v1225=1225.0 v1230=1230.0
% @importance 0.93

0.88::acc(s_merchant, effective_edge_156).
0.93::acc(s3, effective_edge_156).

0.45::true_val(effective_edge_156, v1225); 0.55::true_val(effective_edge_156, v1230).

measured(s_merchant, effective_edge_156, v1225).
measured(s3, effective_edge_156, v1230).

all_consistent(effective_edge_156) :-
    (indep(s_merchant), consistent(s_merchant, effective_edge_156) ; \+indep(s_merchant)),
    consistent(s3, effective_edge_156).

evidence(all_consistent(effective_edge_156)).
query(true_val(effective_edge_156, v1225)).
query(true_val(effective_edge_156, v1230)).

% @attr waist_width_156
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width (156cm)
% @values v263=263.0 unk_waist_width_156=Unknown
% @importance 0.93

0.90::acc(s_merchant, waist_width_156).
0.95::acc(s3, waist_width_156).

0.97::true_val(waist_width_156, v263); 0.03::true_val(waist_width_156, unk_waist_width_156).

measured(s_merchant, waist_width_156, v263).
measured(s3, waist_width_156, v263).

all_consistent(waist_width_156) :-
    consistent(s3, waist_width_156),
    (indep(s_merchant), consistent(s_merchant, waist_width_156) ; \+indep(s_merchant)).

evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v263)).
query(true_val(waist_width_156, unk_waist_width_156)).

% @attr tip_tail_width_size
% @type numeric
% @unit mm
% @canonical true
% @original_name tip_tail_width_size
% @values v311=311.0 unk_tip_tail_width_size=Unknown
% @importance 0.93

0.90::acc(s_merchant, tip_tail_width_size).
0.95::acc(s3, tip_tail_width_size).

0.97::true_val(tip_tail_width_size, v311); 0.03::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s_merchant, tip_tail_width_size, v311).
measured(s3, tip_tail_width_size, v311).

all_consistent(tip_tail_width_size) :-
    consistent(s3, tip_tail_width_size),
    (indep(s_merchant), consistent(s_merchant, tip_tail_width_size) ; \+indep(s_merchant)).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v311)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr tip_tail_width_size_tail_156
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size (tail 156cm)
% @values v294=294.0 unk_tip_tail_width_size_tail_156=Unknown
% @importance 0.93

0.90::acc(s_merchant, tip_tail_width_size_tail_156).
0.95::acc(s3, tip_tail_width_size_tail_156).

0.97::true_val(tip_tail_width_size_tail_156, v294); 0.03::true_val(tip_tail_width_size_tail_156, unk_tip_tail_width_size_tail_156).

measured(s_merchant, tip_tail_width_size_tail_156, v294).
measured(s3, tip_tail_width_size_tail_156, v294).

all_consistent(tip_tail_width_size_tail_156) :-
    consistent(s3, tip_tail_width_size_tail_156),
    (indep(s_merchant), consistent(s_merchant, tip_tail_width_size_tail_156) ; \+indep(s_merchant)).

evidence(all_consistent(tip_tail_width_size_tail_156)).
query(true_val(tip_tail_width_size_tail_156, v294)).
query(true_val(tip_tail_width_size_tail_156, unk_tip_tail_width_size_tail_156)).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size
% @values v9_0=9.0 unk_sidecut_radius_size=Unknown
% @importance 0.93

0.90::acc(s_merchant, sidecut_radius_size).
0.95::acc(s3, sidecut_radius_size).

0.97::true_val(sidecut_radius_size, v9_0); 0.03::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s_merchant, sidecut_radius_size, v9_0).
measured(s3, sidecut_radius_size, v9_0).

all_consistent(sidecut_radius_size) :-
    consistent(s3, sidecut_radius_size),
    (indep(s_merchant), consistent(s_merchant, sidecut_radius_size) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v9_0)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr stance_width_range_size
% @type numeric
% @unit mm
% @canonical true
% @original_name stance_width_range_size
% @values v540=540.0 unk_stance_width_range_size=Unknown
% @importance 0.93

0.90::acc(s_merchant, stance_width_range_size).
0.95::acc(s3, stance_width_range_size).

0.97::true_val(stance_width_range_size, v540); 0.03::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s_merchant, stance_width_range_size, v540).
measured(s3, stance_width_range_size, v540).

all_consistent(stance_width_range_size) :-
    consistent(s3, stance_width_range_size),
    (indep(s_merchant), consistent(s_merchant, stance_width_range_size) ; \+indep(s_merchant)).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v540)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size
% @values r59_82kg=59-82kg_130-180lbs unk_recommended_weight_range_size=Unknown
% @importance 0.93

0.90::acc(s_merchant, recommended_weight_range_size).
0.95::acc(s3, recommended_weight_range_size).

0.97::true_val(recommended_weight_range_size, r59_82kg); 0.03::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s_merchant, recommended_weight_range_size, r59_82kg).
measured(s3, recommended_weight_range_size, r59_82kg).

all_consistent(recommended_weight_range_size) :-
    consistent(s3, recommended_weight_range_size),
    (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size) ; \+indep(s_merchant)).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, r59_82kg)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr contact_length_size
% @type numeric
% @unit cm
% @canonical true
% @original_name contact_length_size
% @values v100_5=100.5 unk_contact_length_size=Unknown
% @importance 1.0

0.95::acc(s3, contact_length_size).

0.95::true_val(contact_length_size, v100_5); 0.05::true_val(contact_length_size, unk_contact_length_size).

measured(s3, contact_length_size, v100_5).

all_consistent(contact_length_size) :-
    consistent(s3, contact_length_size).

evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v100_5)).
query(true_val(contact_length_size, unk_contact_length_size)).

% @attr tip_length_156
% @type numeric
% @unit cm
% @canonical false
% @original_name Tip length (156cm)
% @values v40_0=40.0 unk_tip_length_156=Unknown
% @importance 1.0

0.95::acc(s3, tip_length_156).

0.95::true_val(tip_length_156, v40_0); 0.05::true_val(tip_length_156, unk_tip_length_156).

measured(s3, tip_length_156, v40_0).

all_consistent(tip_length_156) :-
    consistent(s3, tip_length_156).

evidence(all_consistent(tip_length_156)).
query(true_val(tip_length_156, v40_0)).
query(true_val(tip_length_156, unk_tip_length_156)).

% @attr tail_length_156
% @type numeric
% @unit cm
% @canonical false
% @original_name Tail length (156cm)
% @values v15_5=15.5 unk_tail_length_156=Unknown
% @importance 1.0

0.95::acc(s3, tail_length_156).

0.95::true_val(tail_length_156, v15_5); 0.05::true_val(tail_length_156, unk_tail_length_156).

measured(s3, tail_length_156, v15_5).

all_consistent(tail_length_156) :-
    consistent(s3, tail_length_156).

evidence(all_consistent(tail_length_156)).
query(true_val(tail_length_156, v15_5)).
query(true_val(tail_length_156, unk_tail_length_156)).

% @attr board_weight_grams
% @type numeric
% @unit kg
% @canonical true
% @original_name board_weight_grams
% @values v3_1=3.1 unk_board_weight_grams=Unknown
% @importance 1.0

0.95::acc(s3, board_weight_grams).

0.95::true_val(board_weight_grams, v3_1); 0.05::true_val(board_weight_grams, unk_board_weight_grams).

measured(s3, board_weight_grams, v3_1).

all_consistent(board_weight_grams) :-
    consistent(s3, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v3_1)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr surface_area_156
% @type numeric
% @unit dm2
% @canonical false
% @original_name Surface area (156cm)
% @values v42_8=42.8 unk_surface_area_156=Unknown
% @importance 1.0

0.95::acc(s3, surface_area_156).

0.95::true_val(surface_area_156, v42_8); 0.05::true_val(surface_area_156, unk_surface_area_156).

measured(s3, surface_area_156, v42_8).

all_consistent(surface_area_156) :-
    consistent(s3, surface_area_156).

evidence(all_consistent(surface_area_156)).
query(true_val(surface_area_156, v42_8)).
query(true_val(surface_area_156, unk_surface_area_156)).

% @attr underfoot_width_front_156
% @type numeric
% @unit cm
% @canonical false
% @original_name Underfoot width front foot (156cm)
% @values v27_7=27.7 unk_underfoot_width_front_156=Unknown
% @importance 1.0

0.95::acc(s3, underfoot_width_front_156).

0.95::true_val(underfoot_width_front_156, v27_7); 0.05::true_val(underfoot_width_front_156, unk_underfoot_width_front_156).

measured(s3, underfoot_width_front_156, v27_7).

all_consistent(underfoot_width_front_156) :-
    consistent(s3, underfoot_width_front_156).

evidence(all_consistent(underfoot_width_front_156)).
query(true_val(underfoot_width_front_156, v27_7)).
query(true_val(underfoot_width_front_156, unk_underfoot_width_front_156)).

% @attr underfoot_width_rear_156
% @type numeric
% @unit cm
% @canonical false
% @original_name Underfoot width back foot (156cm)
% @values v27_1=27.1 unk_underfoot_width_rear_156=Unknown
% @importance 1.0

0.95::acc(s3, underfoot_width_rear_156).

0.95::true_val(underfoot_width_rear_156, v27_1); 0.05::true_val(underfoot_width_rear_156, unk_underfoot_width_rear_156).

measured(s3, underfoot_width_rear_156, v27_1).

all_consistent(underfoot_width_rear_156) :-
    consistent(s3, underfoot_width_rear_156).

evidence(all_consistent(underfoot_width_rear_156)).
query(true_val(underfoot_width_rear_156, v27_1)).
query(true_val(underfoot_width_rear_156, unk_underfoot_width_rear_156)).

% @attr stance_width_range_size_160
% @type numeric
% @unit mm
% @canonical false
% @original_name stance_width_range_size (160cm)
% @values v560=560.0 unk_stance_width_range_size_160=Unknown
% @importance 0.93

0.95::acc(s3, stance_width_range_size_160).
0.90::acc(s_merchant, stance_width_range_size_160).

0.97::true_val(stance_width_range_size_160, v560); 0.03::true_val(stance_width_range_size_160, unk_stance_width_range_size_160).

measured(s3, stance_width_range_size_160, v560).
measured(s_merchant, stance_width_range_size_160, v560).

all_consistent(stance_width_range_size_160) :-
    consistent(s3, stance_width_range_size_160),
    (indep(s_merchant), consistent(s_merchant, stance_width_range_size_160) ; \+indep(s_merchant)).

evidence(all_consistent(stance_width_range_size_160)).
query(true_val(stance_width_range_size_160, v560)).
query(true_val(stance_width_range_size_160, unk_stance_width_range_size_160)).

% @attr setback
% @type numeric
% @unit cm
% @canonical true
% @original_name setback
% @values v0=0.0 unk_setback=Unknown
% @importance 1.0

0.95::acc(s3, setback).

0.95::true_val(setback, v0); 0.05::true_val(setback, unk_setback).

measured(s3, setback, v0).

all_consistent(setback) :-
    consistent(s3, setback).

evidence(all_consistent(setback)).
query(true_val(setback, v0)).
query(true_val(setback, unk_setback)).

% @attr effective_edge_160
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge (160cm)
% @values v1257=1257.0 v1260=1260.0
% @importance 0.93

0.88::acc(s_merchant, effective_edge_160).
0.93::acc(s3, effective_edge_160).

0.45::true_val(effective_edge_160, v1257); 0.55::true_val(effective_edge_160, v1260).

measured(s_merchant, effective_edge_160, v1257).
measured(s3, effective_edge_160, v1260).

all_consistent(effective_edge_160) :-
    (indep(s_merchant), consistent(s_merchant, effective_edge_160) ; \+indep(s_merchant)),
    consistent(s3, effective_edge_160).

evidence(all_consistent(effective_edge_160)).
query(true_val(effective_edge_160, v1257)).
query(true_val(effective_edge_160, v1260)).

% @attr waist_width_160
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width (160cm)
% @values v267=267.0 unk_waist_width_160=Unknown
% @importance 0.93

0.90::acc(s_merchant, waist_width_160).
0.95::acc(s3, waist_width_160).

0.97::true_val(waist_width_160, v267); 0.03::true_val(waist_width_160, unk_waist_width_160).

measured(s_merchant, waist_width_160, v267).
measured(s3, waist_width_160, v267).

all_consistent(waist_width_160) :-
    consistent(s3, waist_width_160),
    (indep(s_merchant), consistent(s_merchant, waist_width_160) ; \+indep(s_merchant)).

evidence(all_consistent(waist_width_160)).
query(true_val(waist_width_160, v267)).
query(true_val(waist_width_160, unk_waist_width_160)).

% @attr tip_tail_width_size_nose_160
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size (nose 160cm)
% @values v316=316.0 unk_tip_tail_width_size_nose_160=Unknown
% @importance 0.93

0.90::acc(s_merchant, tip_tail_width_size_nose_160).
0.95::acc(s3, tip_tail_width_size_nose_160).

0.97::true_val(tip_tail_width_size_nose_160, v316); 0.03::true_val(tip_tail_width_size_nose_160, unk_tip_tail_width_size_nose_160).

measured(s_merchant, tip_tail_width_size_nose_160, v316).
measured(s3, tip_tail_width_size_nose_160, v316).

all_consistent(tip_tail_width_size_nose_160) :-
    consistent(s3, tip_tail_width_size_nose_160),
    (indep(s_merchant), consistent(s_merchant, tip_tail_width_size_nose_160) ; \+indep(s_merchant)).

evidence(all_consistent(tip_tail_width_size_nose_160)).
query(true_val(tip_tail_width_size_nose_160, v316)).
query(true_val(tip_tail_width_size_nose_160, unk_tip_tail_width_size_nose_160)).

% @attr tip_tail_width_size_tail_160
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size (tail 160cm)
% @values v299=299.0 unk_tip_tail_width_size_tail_160=Unknown
% @importance 0.93

0.90::acc(s_merchant, tip_tail_width_size_tail_160).
0.95::acc(s3, tip_tail_width_size_tail_160).

0.97::true_val(tip_tail_width_size_tail_160, v299); 0.03::true_val(tip_tail_width_size_tail_160, unk_tip_tail_width_size_tail_160).

measured(s_merchant, tip_tail_width_size_tail_160, v299).
measured(s3, tip_tail_width_size_tail_160, v299).

all_consistent(tip_tail_width_size_tail_160) :-
    consistent(s3, tip_tail_width_size_tail_160),
    (indep(s_merchant), consistent(s_merchant, tip_tail_width_size_tail_160) ; \+indep(s_merchant)).

evidence(all_consistent(tip_tail_width_size_tail_160)).
query(true_val(tip_tail_width_size_tail_160, v299)).
query(true_val(tip_tail_width_size_tail_160, unk_tip_tail_width_size_tail_160)).

% @attr sidecut_radius_size_160
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (160cm)
% @values v9_3=9.3 unk_sidecut_radius_size_160=Unknown
% @importance 0.93

0.90::acc(s_merchant, sidecut_radius_size_160).
0.95::acc(s3, sidecut_radius_size_160).

0.97::true_val(sidecut_radius_size_160, v9_3); 0.03::true_val(sidecut_radius_size_160, unk_sidecut_radius_size_160).

measured(s_merchant, sidecut_radius_size_160, v9_3).
measured(s3, sidecut_radius_size_160, v9_3).

all_consistent(sidecut_radius_size_160) :-
    consistent(s3, sidecut_radius_size_160),
    (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_160) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_radius_size_160)).
query(true_val(sidecut_radius_size_160, v9_3)).
query(true_val(sidecut_radius_size_160, unk_sidecut_radius_size_160)).

% @attr recommended_weight_range_size_160
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (160cm)
% @values r73_95kg=73-95kg_160-210lbs unk_recommended_weight_range_size_160=Unknown
% @importance 0.93

0.90::acc(s_merchant, recommended_weight_range_size_160).
0.95::acc(s3, recommended_weight_range_size_160).

0.97::true_val(recommended_weight_range_size_160, r73_95kg); 0.03::true_val(recommended_weight_range_size_160, unk_recommended_weight_range_size_160).

measured(s_merchant, recommended_weight_range_size_160, r73_95kg).
measured(s3, recommended_weight_range_size_160, r73_95kg).

all_consistent(recommended_weight_range_size_160) :-
    consistent(s3, recommended_weight_range_size_160),
    (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size_160) ; \+indep(s_merchant)).

evidence(all_consistent(recommended_weight_range_size_160)).
query(true_val(recommended_weight_range_size_160, r73_95kg)).
query(true_val(recommended_weight_range_size_160, unk_recommended_weight_range_size_160)).

% @attr contact_length_size_160
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size (160cm)
% @values v103_7=103.7 unk_contact_length_size_160=Unknown
% @importance 1.0

0.95::acc(s3, contact_length_size_160).

0.95::true_val(contact_length_size_160, v103_7); 0.05::true_val(contact_length_size_160, unk_contact_length_size_160).

measured(s3, contact_length_size_160, v103_7).

all_consistent(contact_length_size_160) :-
    consistent(s3, contact_length_size_160).

evidence(all_consistent(contact_length_size_160)).
query(true_val(contact_length_size_160, v103_7)).
query(true_val(contact_length_size_160, unk_contact_length_size_160)).

% @attr board_weight_grams_160
% @type numeric
% @unit kg
% @canonical false
% @original_name board_weight_grams (160cm)
% @values v3_2=3.2 unk_board_weight_grams_160=Unknown
% @importance 1.0

0.95::acc(s3, board_weight_grams_160).

0.95::true_val(board_weight_grams_160, v3_2); 0.05::true_val(board_weight_grams_160, unk_board_weight_grams_160).

measured(s3, board_weight_grams_160, v3_2).

all_consistent(board_weight_grams_160) :-
    consistent(s3, board_weight_grams_160).

evidence(all_consistent(board_weight_grams_160)).
query(true_val(board_weight_grams_160, v3_2)).
query(true_val(board_weight_grams_160, unk_board_weight_grams_160)).

% @attr surface_area_160
% @type numeric
% @unit dm2
% @canonical false
% @original_name Surface area (160cm)
% @values v44_6=44.6 unk_surface_area_160=Unknown
% @importance 1.0

0.95::acc(s3, surface_area_160).

0.95::true_val(surface_area_160, v44_6); 0.05::true_val(surface_area_160, unk_surface_area_160).

measured(s3, surface_area_160, v44_6).

all_consistent(surface_area_160) :-
    consistent(s3, surface_area_160).

evidence(all_consistent(surface_area_160)).
query(true_val(surface_area_160, v44_6)).
query(true_val(surface_area_160, unk_surface_area_160)).

% @attr terrain_suitability_all_mountain
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability (All Mountain)
% @values v7=7.0 unk_terrain_suitability_all_mountain=Unknown
% @importance 0.88

0.88::acc(s_merchant, terrain_suitability_all_mountain).
0.85::acc(s2, terrain_suitability_all_mountain).

0.95::true_val(terrain_suitability_all_mountain, v7); 0.05::true_val(terrain_suitability_all_mountain, unk_terrain_suitability_all_mountain).

measured(s_merchant, terrain_suitability_all_mountain, v7).
measured(s2, terrain_suitability_all_mountain, v7).

all_consistent(terrain_suitability_all_mountain) :-
    (indep(s_merchant), consistent(s_merchant, terrain_suitability_all_mountain) ; \+indep(s_merchant)),
    (indep(s2), consistent(s2, terrain_suitability_all_mountain) ; \+indep(s2)).

evidence(all_consistent(terrain_suitability_all_mountain)).
query(true_val(terrain_suitability_all_mountain, v7)).
query(true_val(terrain_suitability_all_mountain, unk_terrain_suitability_all_mountain)).

% @attr terrain_suitability_powder
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability (Powder)
% @values v10=10.0 unk_terrain_suitability_powder=Unknown
% @importance 0.88

0.88::acc(s_merchant, terrain_suitability_powder).
0.85::acc(s2, terrain_suitability_powder).

0.95::true_val(terrain_suitability_powder, v10); 0.05::true_val(terrain_suitability_powder, unk_terrain_suitability_powder).

measured(s_merchant, terrain_suitability_powder, v10).
measured(s2, terrain_suitability_powder, v10).

all_consistent(terrain_suitability_powder) :-
    (indep(s_merchant), consistent(s_merchant, terrain_suitability_powder) ; \+indep(s_merchant)),
    (indep(s2), consistent(s2, terrain_suitability_powder) ; \+indep(s2)).

evidence(all_consistent(terrain_suitability_powder)).
query(true_val(terrain_suitability_powder, v10)).
query(true_val(terrain_suitability_powder, unk_terrain_suitability_powder)).

% @attr freestyle_park_rating
% @type numeric
% @unit /10
% @canonical true
% @original_name freestyle_park_rating
% @values v4=4.0 v5=5.0
% @importance 0.93

0.93::acc(s3, freestyle_park_rating).
0.82::acc(s_merchant, freestyle_park_rating).

0.65::true_val(freestyle_park_rating, v4); 0.35::true_val(freestyle_park_rating, v5).

measured(s3, freestyle_park_rating, v4).
measured(s_merchant, freestyle_park_rating, v5).

all_consistent(freestyle_park_rating) :-
    consistent(s3, freestyle_park_rating),
    (indep(s_merchant), consistent(s_merchant, freestyle_park_rating) ; \+indep(s_merchant)).

evidence(all_consistent(freestyle_park_rating)).
query(true_val(freestyle_park_rating, v4)).
query(true_val(freestyle_park_rating, v5)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values pow_slash_crud_trees=Ideal_for_pow_slashing_crud_busting_slaloming_trees unk_terrain_suitability=Unknown
% @importance 1.0

0.95::acc(s3, terrain_suitability).

0.95::true_val(terrain_suitability, pow_slash_crud_trees); 0.05::true_val(terrain_suitability, unk_terrain_suitability).

measured(s3, terrain_suitability, pow_slash_crud_trees).

all_consistent(terrain_suitability) :-
    consistent(s3, terrain_suitability).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, pow_slash_crud_trees)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr riding_style
% @type categorical
% @canonical false
% @original_name riding_style
% @values surf_freeride=Surf-inspired_freeride_responsive_in_powder unk_riding_style=Unknown
% @importance 0.85

0.85::acc(s9, riding_style).

0.85::true_val(riding_style, surf_freeride); 0.15::true_val(riding_style, unk_riding_style).

measured(s9, riding_style, surf_freeride).

all_consistent(riding_style) :-
    consistent(s9, riding_style).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, surf_freeride)).
query(true_val(riding_style, unk_riding_style)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate_expert=Intermediate_to_Expert unk_rider_level=Unknown
% @importance 0.7

0.82::acc(s21, rider_level).

0.82::true_val(rider_level, intermediate_expert); 0.18::true_val(rider_level, unk_rider_level).

measured(s21, rider_level, intermediate_expert).

all_consistent(rider_level) :-
    (indep(s21), consistent(s21, rider_level) ; \+indep(s21)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate_expert)).
query(true_val(rider_level, unk_rider_level)).

% @attr terrain_suitability_detailed
% @type categorical
% @canonical false
% @original_name terrain_suitability (detailed)
% @values deep_pow_steeps_trees_variable=Deep_powder_steeps_trees_variable_snow_competent_groomers unk_terrain_suitability_detailed=Unknown
% @importance 0.9

0.88::acc(s8, terrain_suitability_detailed).

0.88::true_val(terrain_suitability_detailed, deep_pow_steeps_trees_variable); 0.12::true_val(terrain_suitability_detailed, unk_terrain_suitability_detailed).

measured(s8, terrain_suitability_detailed, deep_pow_steeps_trees_variable).

all_consistent(terrain_suitability_detailed) :-
    consistent(s8, terrain_suitability_detailed).

evidence(all_consistent(terrain_suitability_detailed)).
query(true_val(terrain_suitability_detailed, deep_pow_steeps_trees_variable)).
query(true_val(terrain_suitability_detailed, unk_terrain_suitability_detailed)).

% @attr use_case
% @type categorical
% @canonical false
% @original_name Use case
% @values quiver_powder_or_daily_turny=Quiver_powder_board_or_daily_driver_turny_style unk_use_case=Unknown
% @importance 0.9

0.88::acc(s8, use_case).

0.88::true_val(use_case, quiver_powder_or_daily_turny); 0.12::true_val(use_case, unk_use_case).

measured(s8, use_case, quiver_powder_or_daily_turny).

all_consistent(use_case) :-
    consistent(s8, use_case).

evidence(all_consistent(use_case)).
query(true_val(use_case, quiver_powder_or_daily_turny)).
query(true_val(use_case, unk_use_case)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values best_in_class_powder=Best_in_class_powder_performance unk_positive_aspect=Unknown
% @importance 0.9

0.88::acc(s8, positive_aspect).

0.88::true_val(positive_aspect, best_in_class_powder); 0.12::true_val(positive_aspect, unk_positive_aspect).

measured(s8, positive_aspect, best_in_class_powder).

all_consistent(positive_aspect) :-
    consistent(s8, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, best_in_class_powder)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr powder_float_gearjunkie
% @type categorical
% @canonical false
% @original_name Powder float (GearJunkie)
% @values ten_ten_niche_five_ten_elsewhere=10_10_in_niche_5_10_elsewhere unk_powder_float_gearjunkie=Unknown
% @importance 0.85

0.85::acc(s9, powder_float_gearjunkie).

0.85::true_val(powder_float_gearjunkie, ten_ten_niche_five_ten_elsewhere); 0.15::true_val(powder_float_gearjunkie, unk_powder_float_gearjunkie).

measured(s9, powder_float_gearjunkie, ten_ten_niche_five_ten_elsewhere).

all_consistent(powder_float_gearjunkie) :-
    consistent(s9, powder_float_gearjunkie).

evidence(all_consistent(powder_float_gearjunkie)).
query(true_val(powder_float_gearjunkie, ten_ten_niche_five_ten_elsewhere)).
query(true_val(powder_float_gearjunkie, unk_powder_float_gearjunkie)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values good=Good_traction_tech_helps unk_edge_hold=Unknown
% @importance 0.9

0.88::acc(s8, edge_hold).

0.88::true_val(edge_hold, good); 0.12::true_val(edge_hold, unk_edge_hold).

measured(s8, edge_hold, good).

all_consistent(edge_hold) :-
    consistent(s8, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, good)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr negative_aspect_taper_edgehold
% @type categorical
% @canonical false
% @original_name negative_aspect (taper edgehold)
% @values taper_hinders_edgehold=17mm_taper_hinders_overall_edgehold unk_negative_aspect_taper_edgehold=Unknown
% @importance 0.9

0.88::acc(s8, negative_aspect_taper_edgehold).

0.88::true_val(negative_aspect_taper_edgehold, taper_hinders_edgehold); 0.12::true_val(negative_aspect_taper_edgehold, unk_negative_aspect_taper_edgehold).

measured(s8, negative_aspect_taper_edgehold, taper_hinders_edgehold).

all_consistent(negative_aspect_taper_edgehold) :-
    consistent(s8, negative_aspect_taper_edgehold).

evidence(all_consistent(negative_aspect_taper_edgehold)).
query(true_val(negative_aspect_taper_edgehold, taper_hinders_edgehold)).
query(true_val(negative_aspect_taper_edgehold, unk_negative_aspect_taper_edgehold)).

% @attr reviewer_opinion_the_good_ride_ice
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (ice)
% @values handles_hard_loses_ice=Handles_hard_snow_loses_edge_on_ice unk_reviewer_opinion_the_good_ride_ice=Unknown
% @importance 0.8

0.82::acc(s7, reviewer_opinion_the_good_ride_ice).

0.82::true_val(reviewer_opinion_the_good_ride_ice, handles_hard_loses_ice); 0.18::true_val(reviewer_opinion_the_good_ride_ice, unk_reviewer_opinion_the_good_ride_ice).

measured(s7, reviewer_opinion_the_good_ride_ice, handles_hard_loses_ice).

all_consistent(reviewer_opinion_the_good_ride_ice) :-
    consistent(s7, reviewer_opinion_the_good_ride_ice).

evidence(all_consistent(reviewer_opinion_the_good_ride_ice)).
query(true_val(reviewer_opinion_the_good_ride_ice, handles_hard_loses_ice)).
query(true_val(reviewer_opinion_the_good_ride_ice, unk_reviewer_opinion_the_good_ride_ice)).

% @attr reviewer_opinion_the_good_ride_traction_tech
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (Traction Tech)
% @values not_as_reliable_as_magnetraction=Not_as_reliable_as_Lib_Tech_Magne-Traction unk_reviewer_opinion_the_good_ride_traction_tech=Unknown
% @importance 0.7

0.75::acc(s32, reviewer_opinion_the_good_ride_traction_tech).

0.75::true_val(reviewer_opinion_the_good_ride_traction_tech, not_as_reliable_as_magnetraction); 0.25::true_val(reviewer_opinion_the_good_ride_traction_tech, unk_reviewer_opinion_the_good_ride_traction_tech).

measured(s32, reviewer_opinion_the_good_ride_traction_tech, not_as_reliable_as_magnetraction).

all_consistent(reviewer_opinion_the_good_ride_traction_tech) :-
    consistent(s32, reviewer_opinion_the_good_ride_traction_tech).

evidence(all_consistent(reviewer_opinion_the_good_ride_traction_tech)).
query(true_val(reviewer_opinion_the_good_ride_traction_tech, not_as_reliable_as_magnetraction)).
query(true_val(reviewer_opinion_the_good_ride_traction_tech, unk_reviewer_opinion_the_good_ride_traction_tech)).

% @attr dampening
% @type categorical
% @canonical false
% @original_name Dampening
% @values damp_ride_expected=Offers_damp_ride_expected_from_Jones unk_dampening=Unknown
% @importance 0.9

0.88::acc(s8, dampening).

0.88::true_val(dampening, damp_ride_expected); 0.12::true_val(dampening, unk_dampening).

measured(s8, dampening, damp_ride_expected).

all_consistent(dampening) :-
    consistent(s8, dampening).

evidence(all_consistent(dampening)).
query(true_val(dampening, damp_ride_expected)).
query(true_val(dampening, unk_dampening)).

% @attr reviewer_opinion_snowboardingprofiles_dampness
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (dampness)
% @values quite_damp_not_super=Quite_damp_but_not_super_damp unk_reviewer_opinion_snowboardingprofiles_dampness=Unknown
% @importance 0.85

0.85::acc(s30, reviewer_opinion_snowboardingprofiles_dampness).

0.85::true_val(reviewer_opinion_snowboardingprofiles_dampness, quite_damp_not_super); 0.15::true_val(reviewer_opinion_snowboardingprofiles_dampness, unk_reviewer_opinion_snowboardingprofiles_dampness).

measured(s30, reviewer_opinion_snowboardingprofiles_dampness, quite_damp_not_super).

all_consistent(reviewer_opinion_snowboardingprofiles_dampness) :-
    consistent(s30, reviewer_opinion_snowboardingprofiles_dampness).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_dampness)).
query(true_val(reviewer_opinion_snowboardingprofiles_dampness, quite_damp_not_super)).
query(true_val(reviewer_opinion_snowboardingprofiles_dampness, unk_reviewer_opinion_snowboardingprofiles_dampness)).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name reviewer_opinion_snowboardingprofiles
% @values decently_fast_stable=Decently_fast_and_really_decently_stable_at_speed unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.85

0.85::acc(s30, reviewer_opinion_snowboardingprofiles).

0.85::true_val(reviewer_opinion_snowboardingprofiles, decently_fast_stable); 0.15::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).

measured(s30, reviewer_opinion_snowboardingprofiles, decently_fast_stable).

all_consistent(reviewer_opinion_snowboardingprofiles) :-
    consistent(s30, reviewer_opinion_snowboardingprofiles).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, decently_fast_stable)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

% @attr reviewer_opinion_snowboardingprofiles_carving
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (carving)
% @values not_as_carvy_still_decent=Not_quite_as_carvy_as_old_Hovercraft_still_decent unk_reviewer_opinion_snowboardingprofiles_carving=Unknown
% @importance 0.85

0.85::acc(s30, reviewer_opinion_snowboardingprofiles_carving).

0.85::true_val(reviewer_opinion_snowboardingprofiles_carving, not_as_carvy_still_decent); 0.15::true_val(reviewer_opinion_snowboardingprofiles_carving, unk_reviewer_opinion_snowboardingprofiles_carving).

measured(s30, reviewer_opinion_snowboardingprofiles_carving, not_as_carvy_still_decent).

all_consistent(reviewer_opinion_snowboardingprofiles_carving) :-
    consistent(s30, reviewer_opinion_snowboardingprofiles_carving).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_carving)).
query(true_val(reviewer_opinion_snowboardingprofiles_carving, not_as_carvy_still_decent)).
query(true_val(reviewer_opinion_snowboardingprofiles_carving, unk_reviewer_opinion_snowboardingprofiles_carving)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values better_slashes_quicker_turns=Better_for_slashes_easier_quicker_to_turn unk_turn_initiation_performance=Unknown
% @importance 0.85

0.85::acc(s30, turn_initiation_performance).

0.85::true_val(turn_initiation_performance, better_slashes_quicker_turns); 0.15::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s30, turn_initiation_performance, better_slashes_quicker_turns).

all_consistent(turn_initiation_performance) :-
    consistent(s30, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, better_slashes_quicker_turns)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr reviewer_opinion_snowboardingprofiles_edge_to_edge
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (edge to edge)
% @values decently_quick_slower_speeds=Really_decently_quick_edge-to-edge_at_slower_speeds unk_reviewer_opinion_snowboardingprofiles_edge_to_edge=Unknown
% @importance 0.85

0.85::acc(s30, reviewer_opinion_snowboardingprofiles_edge_to_edge).

0.85::true_val(reviewer_opinion_snowboardingprofiles_edge_to_edge, decently_quick_slower_speeds); 0.15::true_val(reviewer_opinion_snowboardingprofiles_edge_to_edge, unk_reviewer_opinion_snowboardingprofiles_edge_to_edge).

measured(s30, reviewer_opinion_snowboardingprofiles_edge_to_edge, decently_quick_slower_speeds).

all_consistent(reviewer_opinion_snowboardingprofiles_edge_to_edge) :-
    consistent(s30, reviewer_opinion_snowboardingprofiles_edge_to_edge).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_edge_to_edge)).
query(true_val(reviewer_opinion_snowboardingprofiles_edge_to_edge, decently_quick_slower_speeds)).
query(true_val(reviewer_opinion_snowboardingprofiles_edge_to_edge, unk_reviewer_opinion_snowboardingprofiles_edge_to_edge)).

% @attr reviewer_opinion_snowboardingprofiles_forgiveness
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (forgiveness)
% @values not_catchy_forgiving=Not_catchy_more_forgiving_of_errors unk_reviewer_opinion_snowboardingprofiles_forgiveness=Unknown
% @importance 0.85

0.85::acc(s30, reviewer_opinion_snowboardingprofiles_forgiveness).

0.85::true_val(reviewer_opinion_snowboardingprofiles_forgiveness, not_catchy_forgiving); 0.15::true_val(reviewer_opinion_snowboardingprofiles_forgiveness, unk_reviewer_opinion_snowboardingprofiles_forgiveness).

measured(s30, reviewer_opinion_snowboardingprofiles_forgiveness, not_catchy_forgiving).

all_consistent(reviewer_opinion_snowboardingprofiles_forgiveness) :-
    consistent(s30, reviewer_opinion_snowboardingprofiles_forgiveness).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_forgiveness)).
query(true_val(reviewer_opinion_snowboardingprofiles_forgiveness, not_catchy_forgiving)).
query(true_val(reviewer_opinion_snowboardingprofiles_forgiveness, unk_reviewer_opinion_snowboardingprofiles_forgiveness)).

% @attr reviewer_opinion_snowboardingprofiles_messy_snow
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (messy snow)
% @values handled_messy_well=Handled_messy_snow_well unk_reviewer_opinion_snowboardingprofiles_messy_snow=Unknown
% @importance 0.85

0.85::acc(s30, reviewer_opinion_snowboardingprofiles_messy_snow).

0.85::true_val(reviewer_opinion_snowboardingprofiles_messy_snow, handled_messy_well); 0.15::true_val(reviewer_opinion_snowboardingprofiles_messy_snow, unk_reviewer_opinion_snowboardingprofiles_messy_snow).

measured(s30, reviewer_opinion_snowboardingprofiles_messy_snow, handled_messy_well).

all_consistent(reviewer_opinion_snowboardingprofiles_messy_snow) :-
    consistent(s30, reviewer_opinion_snowboardingprofiles_messy_snow).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_messy_snow)).
query(true_val(reviewer_opinion_snowboardingprofiles_messy_snow, handled_messy_well)).
query(true_val(reviewer_opinion_snowboardingprofiles_messy_snow, unk_reviewer_opinion_snowboardingprofiles_messy_snow)).

% @attr positive_aspect_firm_snow
% @type categorical
% @canonical false
% @original_name positive_aspect (firm snow)
% @values surprisingly_fun_firm=Surprisingly_fun_competent_for_firm_snow unk_positive_aspect_firm_snow=Unknown
% @importance 0.9

0.88::acc(s8, positive_aspect_firm_snow).

0.88::true_val(positive_aspect_firm_snow, surprisingly_fun_firm); 0.12::true_val(positive_aspect_firm_snow, unk_positive_aspect_firm_snow).

measured(s8, positive_aspect_firm_snow, surprisingly_fun_firm).

all_consistent(positive_aspect_firm_snow) :-
    consistent(s8, positive_aspect_firm_snow).

evidence(all_consistent(positive_aspect_firm_snow)).
query(true_val(positive_aspect_firm_snow, surprisingly_fun_firm)).
query(true_val(positive_aspect_firm_snow, unk_positive_aspect_firm_snow)).

% @attr negative_aspect_wide_firm
% @type categorical
% @canonical false
% @original_name negative_aspect (wide firm)
% @values wide_pushes_around_firm=Wide_pushes_around_on_firm_bumpy_terrain_small_feet unk_negative_aspect_wide_firm=Unknown
% @importance 0.9

0.88::acc(s8, negative_aspect_wide_firm).

0.88::true_val(negative_aspect_wide_firm, wide_pushes_around_firm); 0.12::true_val(negative_aspect_wide_firm, unk_negative_aspect_wide_firm).

measured(s8, negative_aspect_wide_firm, wide_pushes_around_firm).

all_consistent(negative_aspect_wide_firm) :-
    consistent(s8, negative_aspect_wide_firm).

evidence(all_consistent(negative_aspect_wide_firm)).
query(true_val(negative_aspect_wide_firm, wide_pushes_around_firm)).
query(true_val(negative_aspect_wide_firm, unk_negative_aspect_wide_firm)).

% @attr negative_aspect_clumsy_speed
% @type categorical
% @canonical false
% @original_name negative_aspect (clumsy speed)
% @values touch_clumsy_high_speed=Touch_clumsy_high_speeds_slower_edge-to-edge unk_negative_aspect_clumsy_speed=Unknown
% @importance 0.85

0.85::acc(s9, negative_aspect_clumsy_speed).

0.85::true_val(negative_aspect_clumsy_speed, touch_clumsy_high_speed); 0.15::true_val(negative_aspect_clumsy_speed, unk_negative_aspect_clumsy_speed).

measured(s9, negative_aspect_clumsy_speed, touch_clumsy_high_speed).

all_consistent(negative_aspect_clumsy_speed) :-
    consistent(s9, negative_aspect_clumsy_speed).

evidence(all_consistent(negative_aspect_clumsy_speed)).
query(true_val(negative_aspect_clumsy_speed, touch_clumsy_high_speed)).
query(true_val(negative_aspect_clumsy_speed, unk_negative_aspect_clumsy_speed)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values practically_impossible=Practically_impossible_due_to_directional_shape unk_switch_riding=Unknown
% @importance 0.7

0.80::acc(s33, switch_riding).

0.80::true_val(switch_riding, practically_impossible); 0.20::true_val(switch_riding, unk_switch_riding).

measured(s33, switch_riding, practically_impossible).

all_consistent(switch_riding) :-
    consistent(s33, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, practically_impossible)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr reviewer_opinion_snowboardingprofiles_weight
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (weight)
% @values heavy_on_scales_light_on_snow=Rather_heavy_on_scales_but_feels_light_on_snow unk_reviewer_opinion_snowboardingprofiles_weight=Unknown
% @importance 0.85

0.85::acc(s30, reviewer_opinion_snowboardingprofiles_weight).

0.85::true_val(reviewer_opinion_snowboardingprofiles_weight, heavy_on_scales_light_on_snow); 0.15::true_val(reviewer_opinion_snowboardingprofiles_weight, unk_reviewer_opinion_snowboardingprofiles_weight).

measured(s30, reviewer_opinion_snowboardingprofiles_weight, heavy_on_scales_light_on_snow).

all_consistent(reviewer_opinion_snowboardingprofiles_weight) :-
    consistent(s30, reviewer_opinion_snowboardingprofiles_weight).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_weight)).
query(true_val(reviewer_opinion_snowboardingprofiles_weight, heavy_on_scales_light_on_snow)).
query(true_val(reviewer_opinion_snowboardingprofiles_weight, unk_reviewer_opinion_snowboardingprofiles_weight)).

% @attr pop
% @type categorical
% @canonical false
% @original_name pop
% @values not_oodles_not_bad_easy_access=Not_oodles_but_not_bad_relatively_easy_to_access unk_pop=Unknown
% @importance 0.85

0.85::acc(s30, pop).

0.85::true_val(pop, not_oodles_not_bad_easy_access); 0.15::true_val(pop, unk_pop).

measured(s30, pop, not_oodles_not_bad_easy_access).

all_consistent(pop) :-
    consistent(s30, pop).

evidence(all_consistent(pop)).
query(true_val(pop, not_oodles_not_bad_easy_access)).
query(true_val(pop, unk_pop)).

% @attr negative_aspect_landing
% @type categorical
% @canonical false
% @original_name negative_aspect (landing)
% @values weak_landing_short_tail=Landing_weakest_part_not_much_tail_for_jumps unk_negative_aspect_landing=Unknown
% @importance 0.85

0.85::acc(s30, negative_aspect_landing).

0.85::true_val(negative_aspect_landing, weak_landing_short_tail); 0.15::true_val(negative_aspect_landing, unk_negative_aspect_landing).

measured(s30, negative_aspect_landing, weak_landing_short_tail).

all_consistent(negative_aspect_landing) :-
    consistent(s30, negative_aspect_landing).

evidence(all_consistent(negative_aspect_landing)).
query(true_val(negative_aspect_landing, weak_landing_short_tail)).
query(true_val(negative_aspect_landing, unk_negative_aspect_landing)).

% @attr jones_review_rating
% @type numeric
% @unit /5
% @canonical false
% @original_name Jones official site review rating
% @values v4_8=4.8 unk_jones_review_rating=Unknown
% @importance 1.0

0.95::acc(s3, jones_review_rating).

0.95::true_val(jones_review_rating, v4_8); 0.05::true_val(jones_review_rating, unk_jones_review_rating).

measured(s3, jones_review_rating, v4_8).

all_consistent(jones_review_rating) :-
    consistent(s3, jones_review_rating).

evidence(all_consistent(jones_review_rating)).
query(true_val(jones_review_rating, v4_8)).
query(true_val(jones_review_rating, unk_jones_review_rating)).

% @attr reviewer_opinion_the_good_ride
% @type numeric
% @unit /5
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values v4_6=4.6 unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.9

0.85::acc(s7, reviewer_opinion_the_good_ride).

0.85::true_val(reviewer_opinion_the_good_ride, v4_6); 0.15::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s7, reviewer_opinion_the_good_ride, v4_6).

all_consistent(reviewer_opinion_the_good_ride) :-
    consistent(s7, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, v4_6)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr ogl_splitboard_review
% @type categorical
% @canonical false
% @original_name Outdoor Gear Lab (splitboard version)
% @values best_in_class_editors_choice=Best_in_class_powder_Editors_Choice unk_ogl_splitboard_review=Unknown
% @importance 0.9

0.88::acc(s8, ogl_splitboard_review).

0.88::true_val(ogl_splitboard_review, best_in_class_editors_choice); 0.12::true_val(ogl_splitboard_review, unk_ogl_splitboard_review).

measured(s8, ogl_splitboard_review, best_in_class_editors_choice).

all_consistent(ogl_splitboard_review) :-
    consistent(s8, ogl_splitboard_review).

evidence(all_consistent(ogl_splitboard_review)).
query(true_val(ogl_splitboard_review, best_in_class_editors_choice)).
query(true_val(ogl_splitboard_review, unk_ogl_splitboard_review)).

% @attr positive_aspect_powder_float
% @type categorical
% @canonical false
% @original_name positive_aspect (powder float)
% @values near_excellent_float=Near_excellent_float_in_powder unk_positive_aspect_powder_float=Unknown
% @importance 0.9

0.85::acc(s7, positive_aspect_powder_float).

0.85::true_val(positive_aspect_powder_float, near_excellent_float); 0.15::true_val(positive_aspect_powder_float, unk_positive_aspect_powder_float).

measured(s7, positive_aspect_powder_float, near_excellent_float).

all_consistent(positive_aspect_powder_float) :-
    consistent(s7, positive_aspect_powder_float).

evidence(all_consistent(positive_aspect_powder_float)).
query(true_val(positive_aspect_powder_float, near_excellent_float)).
query(true_val(positive_aspect_powder_float, unk_positive_aspect_powder_float)).

% @attr positive_aspect_fast_damp
% @type categorical
% @canonical false
% @original_name positive_aspect (fast damp)
% @values fast_damp_aggressive_forgiving=Fast_Damp_Aggressive_Bomber_still_forgiving unk_positive_aspect_fast_damp=Unknown
% @importance 0.9

0.85::acc(s7, positive_aspect_fast_damp).

0.85::true_val(positive_aspect_fast_damp, fast_damp_aggressive_forgiving); 0.15::true_val(positive_aspect_fast_damp, unk_positive_aspect_fast_damp).

measured(s7, positive_aspect_fast_damp, fast_damp_aggressive_forgiving).

all_consistent(positive_aspect_fast_damp) :-
    consistent(s7, positive_aspect_fast_damp).

evidence(all_consistent(positive_aspect_fast_damp)).
query(true_val(positive_aspect_fast_damp, fast_damp_aggressive_forgiving)).
query(true_val(positive_aspect_fast_damp, unk_positive_aspect_fast_damp)).

% @attr positive_aspect_tree_nimble
% @type categorical
% @canonical false
% @original_name positive_aspect (tree nimble)
% @values super_nimble_trees_slow=Super_nimble_wiggle_through_trees_slow_speeds unk_positive_aspect_tree_nimble=Unknown
% @importance 0.75

0.78::acc(s34, positive_aspect_tree_nimble).

0.78::true_val(positive_aspect_tree_nimble, super_nimble_trees_slow); 0.22::true_val(positive_aspect_tree_nimble, unk_positive_aspect_tree_nimble).

measured(s34, positive_aspect_tree_nimble, super_nimble_trees_slow).

all_consistent(positive_aspect_tree_nimble) :-
    consistent(s34, positive_aspect_tree_nimble).

evidence(all_consistent(positive_aspect_tree_nimble)).
query(true_val(positive_aspect_tree_nimble, super_nimble_trees_slow)).
query(true_val(positive_aspect_tree_nimble, unk_positive_aspect_tree_nimble)).

% @attr positive_aspect_easy_legs
% @type categorical
% @canonical false
% @original_name positive_aspect (easy legs)
% @values float_no_lean_back_easy_legs=Float_without_leaning_back_easy_on_legs unk_positive_aspect_easy_legs=Unknown
% @importance 0.7

0.82::acc(s27, positive_aspect_easy_legs).

0.82::true_val(positive_aspect_easy_legs, float_no_lean_back_easy_legs); 0.18::true_val(positive_aspect_easy_legs, unk_positive_aspect_easy_legs).

measured(s27, positive_aspect_easy_legs, float_no_lean_back_easy_legs).

all_consistent(positive_aspect_easy_legs) :-
    consistent(s27, positive_aspect_easy_legs).

evidence(all_consistent(positive_aspect_easy_legs)).
query(true_val(positive_aspect_easy_legs, float_no_lean_back_easy_legs)).
query(true_val(positive_aspect_easy_legs, unk_positive_aspect_easy_legs)).

% @attr positive_aspect_surf_control
% @type categorical
% @canonical false
% @original_name positive_aspect (surf control)
% @values surf_ride_exceptional_control=Surf-inspired_ride_exceptional_control unk_positive_aspect_surf_control=Unknown
% @importance 0.5

0.82::acc(s24, positive_aspect_surf_control).

0.82::true_val(positive_aspect_surf_control, surf_ride_exceptional_control); 0.18::true_val(positive_aspect_surf_control, unk_positive_aspect_surf_control).

measured(s24, positive_aspect_surf_control, surf_ride_exceptional_control).

all_consistent(positive_aspect_surf_control) :-
    (indep(s24), consistent(s24, positive_aspect_surf_control) ; \+indep(s24)).

evidence(all_consistent(positive_aspect_surf_control)).
query(true_val(positive_aspect_surf_control, surf_ride_exceptional_control)).
query(true_val(positive_aspect_surf_control, unk_positive_aspect_surf_control)).

% @attr positive_aspect_sustainability
% @type categorical
% @canonical false
% @original_name positive_aspect (sustainability)
% @values most_responsible_jones=Most_responsibly_produced_board_in_Jones_line unk_positive_aspect_sustainability=Unknown
% @importance 0.9

0.85::acc(s2, positive_aspect_sustainability).

0.85::true_val(positive_aspect_sustainability, most_responsible_jones); 0.15::true_val(positive_aspect_sustainability, unk_positive_aspect_sustainability).

measured(s2, positive_aspect_sustainability, most_responsible_jones).

all_consistent(positive_aspect_sustainability) :-
    (indep(s2), consistent(s2, positive_aspect_sustainability) ; \+indep(s2)).

evidence(all_consistent(positive_aspect_sustainability)).
query(true_val(positive_aspect_sustainability, most_responsible_jones)).
query(true_val(positive_aspect_sustainability, unk_positive_aspect_sustainability)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values slow_edge_to_edge=Slow_edge_to_edge unk_negative_aspect=Unknown
% @importance 0.9

0.85::acc(s7, negative_aspect).

0.85::true_val(negative_aspect, slow_edge_to_edge); 0.15::true_val(negative_aspect, unk_negative_aspect).

measured(s7, negative_aspect, slow_edge_to_edge).

all_consistent(negative_aspect) :-
    consistent(s7, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, slow_edge_to_edge)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_chatter
% @type categorical
% @canonical false
% @original_name negative_aspect (chatter)
% @values chattered_bucked_hardpack=Chattered_and_bucked_on_harder-packed_chunder unk_negative_aspect_chatter=Unknown
% @importance 0.85

0.85::acc(s9, negative_aspect_chatter).

0.85::true_val(negative_aspect_chatter, chattered_bucked_hardpack); 0.15::true_val(negative_aspect_chatter, unk_negative_aspect_chatter).

measured(s9, negative_aspect_chatter, chattered_bucked_hardpack).

all_consistent(negative_aspect_chatter) :-
    consistent(s9, negative_aspect_chatter).

evidence(all_consistent(negative_aspect_chatter)).
query(true_val(negative_aspect_chatter, chattered_bucked_hardpack)).
query(true_val(negative_aspect_chatter, unk_negative_aspect_chatter)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values washy_hardpack_edge_issues=Found_washy_in_hardpack_hard_time_holding_edge_chundered unk_user_review_forum=Unknown
% @importance 0.75

0.78::acc(s34, user_review_forum).

0.78::true_val(user_review_forum, washy_hardpack_edge_issues); 0.22::true_val(user_review_forum, unk_user_review_forum).

measured(s34, user_review_forum, washy_hardpack_edge_issues).

all_consistent(user_review_forum) :-
    consistent(s34, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, washy_hardpack_edge_issues)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr reviewer_opinion_the_good_ride_trees
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (trees)
% @values not_first_pick_tight_trees=Not_first_pick_tight_trees_less_responsive_bindings unk_reviewer_opinion_the_good_ride_trees=Unknown
% @importance 0.9

0.82::acc(s7, reviewer_opinion_the_good_ride_trees).

0.82::true_val(reviewer_opinion_the_good_ride_trees, not_first_pick_tight_trees); 0.18::true_val(reviewer_opinion_the_good_ride_trees, unk_reviewer_opinion_the_good_ride_trees).

measured(s7, reviewer_opinion_the_good_ride_trees, not_first_pick_tight_trees).

all_consistent(reviewer_opinion_the_good_ride_trees) :-
    consistent(s7, reviewer_opinion_the_good_ride_trees).

evidence(all_consistent(reviewer_opinion_the_good_ride_trees)).
query(true_val(reviewer_opinion_the_good_ride_trees, not_first_pick_tight_trees)).
query(true_val(reviewer_opinion_the_good_ride_trees, unk_reviewer_opinion_the_good_ride_trees)).

% @attr negative_aspect_binding_pairing
% @type categorical
% @canonical false
% @original_name negative_aspect (binding pairing)
% @values binding_matters_contact_pro_bad=Binding_pairing_matters_Contact_Pro_bad_Genesis_X_great unk_negative_aspect_binding_pairing=Unknown
% @importance 0.9

0.80::acc(s7, negative_aspect_binding_pairing).

0.80::true_val(negative_aspect_binding_pairing, binding_matters_contact_pro_bad); 0.20::true_val(negative_aspect_binding_pairing, unk_negative_aspect_binding_pairing).

measured(s7, negative_aspect_binding_pairing, binding_matters_contact_pro_bad).

all_consistent(negative_aspect_binding_pairing) :-
    consistent(s7, negative_aspect_binding_pairing).

evidence(all_consistent(negative_aspect_binding_pairing)).
query(true_val(negative_aspect_binding_pairing, binding_matters_contact_pro_bad)).
query(true_val(negative_aspect_binding_pairing, unk_negative_aspect_binding_pairing)).

% @attr negative_aspect_traverses
% @type categorical
% @canonical false
% @original_name negative_aspect (traverses)
% @values long_traverses_tiring=Long_traverses_tiring_rear_leg_holds_tension unk_negative_aspect_traverses=Unknown
% @importance 0.7

0.80::acc(s33, negative_aspect_traverses).

0.80::true_val(negative_aspect_traverses, long_traverses_tiring); 0.20::true_val(negative_aspect_traverses, unk_negative_aspect_traverses).

measured(s33, negative_aspect_traverses, long_traverses_tiring).

all_consistent(negative_aspect_traverses) :-
    consistent(s33, negative_aspect_traverses).

evidence(all_consistent(negative_aspect_traverses)).
query(true_val(negative_aspect_traverses, long_traverses_tiring)).
query(true_val(negative_aspect_traverses, unk_negative_aspect_traverses)).

% @attr negative_aspect_no_park_switch
% @type categorical
% @canonical false
% @original_name negative_aspect (no park switch)
% @values not_for_park_or_switch=Not_suitable_for_park_or_switch_riding unk_negative_aspect_no_park_switch=Unknown
% @importance 0.7

0.82::acc(s1, negative_aspect_no_park_switch).

0.82::true_val(negative_aspect_no_park_switch, not_for_park_or_switch); 0.18::true_val(negative_aspect_no_park_switch, unk_negative_aspect_no_park_switch).

measured(s1, negative_aspect_no_park_switch, not_for_park_or_switch).

all_consistent(negative_aspect_no_park_switch) :-
    (indep(s1), consistent(s1, negative_aspect_no_park_switch) ; \+indep(s1)).

evidence(all_consistent(negative_aspect_no_park_switch)).
query(true_val(negative_aspect_no_park_switch, not_for_park_or_switch)).
query(true_val(negative_aspect_no_park_switch, unk_negative_aspect_no_park_switch)).

% @attr sustainability_certification_reclaimed_core
% @type categorical
% @canonical false
% @original_name sustainability_certification (reclaimed core)
% @values reclaimed_snowboard_stringers=Core_stringers_from_reclaimed_snowboards unk_sustainability_certification_reclaimed_core=Unknown
% @importance 1.0

0.95::acc(s3, sustainability_certification_reclaimed_core).

0.95::true_val(sustainability_certification_reclaimed_core, reclaimed_snowboard_stringers); 0.05::true_val(sustainability_certification_reclaimed_core, unk_sustainability_certification_reclaimed_core).

measured(s3, sustainability_certification_reclaimed_core, reclaimed_snowboard_stringers).

all_consistent(sustainability_certification_reclaimed_core) :-
    consistent(s3, sustainability_certification_reclaimed_core).

evidence(all_consistent(sustainability_certification_reclaimed_core)).
query(true_val(sustainability_certification_reclaimed_core, reclaimed_snowboard_stringers)).
query(true_val(sustainability_certification_reclaimed_core, unk_sustainability_certification_reclaimed_core)).

% @attr sustainability_certification_recycled_steel
% @type categorical
% @canonical false
% @original_name sustainability_certification (recycled steel)
% @values recycled_german_steel_edges=Recycled_German_steel_edges unk_sustainability_certification_recycled_steel=Unknown
% @importance 1.0

0.95::acc(s3, sustainability_certification_recycled_steel).

0.95::true_val(sustainability_certification_recycled_steel, recycled_german_steel_edges); 0.05::true_val(sustainability_certification_recycled_steel, unk_sustainability_certification_recycled_steel).

measured(s3, sustainability_certification_recycled_steel, recycled_german_steel_edges).

all_consistent(sustainability_certification_recycled_steel) :-
    consistent(s3, sustainability_certification_recycled_steel).

evidence(all_consistent(sustainability_certification_recycled_steel)).
query(true_val(sustainability_certification_recycled_steel, recycled_german_steel_edges)).
query(true_val(sustainability_certification_recycled_steel, unk_sustainability_certification_recycled_steel)).

% @attr sustainability_certification_flax
% @type categorical
% @canonical false
% @original_name sustainability_certification (flax)
% @values flax_fiber_carbon_neutral=Flax_fiber_topsheet_carbon_neutral unk_sustainability_certification_flax=Unknown
% @importance 1.0

0.95::acc(s3, sustainability_certification_flax).

0.95::true_val(sustainability_certification_flax, flax_fiber_carbon_neutral); 0.05::true_val(sustainability_certification_flax, unk_sustainability_certification_flax).

measured(s3, sustainability_certification_flax, flax_fiber_carbon_neutral).

all_consistent(sustainability_certification_flax) :-
    consistent(s3, sustainability_certification_flax).

evidence(all_consistent(sustainability_certification_flax)).
query(true_val(sustainability_certification_flax, flax_fiber_carbon_neutral)).
query(true_val(sustainability_certification_flax, unk_sustainability_certification_flax)).

% @attr sustainability_certification_reup_program
% @type categorical
% @canonical false
% @original_name sustainability_certification (ReUp program)
% @values donate_board_50_credit=Donate_board_recycled_into_new_boards_50_credit unk_sustainability_certification_reup_program=Unknown
% @importance 0.8

0.93::acc(s3, sustainability_certification_reup_program).
0.90::acc(s4, sustainability_certification_reup_program).

0.97::true_val(sustainability_certification_reup_program, donate_board_50_credit); 0.03::true_val(sustainability_certification_reup_program, unk_sustainability_certification_reup_program).

measured(s3, sustainability_certification_reup_program, donate_board_50_credit).
measured(s4, sustainability_certification_reup_program, donate_board_50_credit).

all_consistent(sustainability_certification_reup_program) :-
    consistent(s3, sustainability_certification_reup_program),
    consistent(s4, sustainability_certification_reup_program).

evidence(all_consistent(sustainability_certification_reup_program)).
query(true_val(sustainability_certification_reup_program, donate_board_50_credit)).
query(true_val(sustainability_certification_reup_program, unk_sustainability_certification_reup_program)).

% @attr comparable_board_cross_brand_cardiff_goat
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Cardiff Goat)
% @values cardiff_goat_pro_carbon=Cardiff_Goat_Pro_Carbon unk_comparable_board_cross_brand_cardiff_goat=Unknown
% @importance 0.9

0.88::acc(s8, comparable_board_cross_brand_cardiff_goat).

0.88::true_val(comparable_board_cross_brand_cardiff_goat, cardiff_goat_pro_carbon); 0.12::true_val(comparable_board_cross_brand_cardiff_goat, unk_comparable_board_cross_brand_cardiff_goat).

measured(s8, comparable_board_cross_brand_cardiff_goat, cardiff_goat_pro_carbon).

all_consistent(comparable_board_cross_brand_cardiff_goat) :-
    consistent(s8, comparable_board_cross_brand_cardiff_goat).

evidence(all_consistent(comparable_board_cross_brand_cardiff_goat)).
query(true_val(comparable_board_cross_brand_cardiff_goat, cardiff_goat_pro_carbon)).
query(true_val(comparable_board_cross_brand_cardiff_goat, unk_comparable_board_cross_brand_cardiff_goat)).

% @attr comparable_board_cross_brand_cardiff_crane
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Cardiff Crane)
% @values cardiff_crane_enduro=Cardiff_Crane_Enduro unk_comparable_board_cross_brand_cardiff_crane=Unknown
% @importance 0.9

0.88::acc(s8, comparable_board_cross_brand_cardiff_crane).

0.88::true_val(comparable_board_cross_brand_cardiff_crane, cardiff_crane_enduro); 0.12::true_val(comparable_board_cross_brand_cardiff_crane, unk_comparable_board_cross_brand_cardiff_crane).

measured(s8, comparable_board_cross_brand_cardiff_crane, cardiff_crane_enduro).

all_consistent(comparable_board_cross_brand_cardiff_crane) :-
    consistent(s8, comparable_board_cross_brand_cardiff_crane).

evidence(all_consistent(comparable_board_cross_brand_cardiff_crane)).
query(true_val(comparable_board_cross_brand_cardiff_crane, cardiff_crane_enduro)).
query(true_val(comparable_board_cross_brand_cardiff_crane, unk_comparable_board_cross_brand_cardiff_crane)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values korua_transition_finder=Korua_Transition_Finder_stiffer_more_tapered_under_500 unk_comparable_board_cross_brand=Unknown
% @importance 0.83

0.82::acc(s7, comparable_board_cross_brand).
0.80::acc(s27, comparable_board_cross_brand).

0.95::true_val(comparable_board_cross_brand, korua_transition_finder); 0.05::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s7, comparable_board_cross_brand, korua_transition_finder).
measured(s27, comparable_board_cross_brand, korua_transition_finder).

all_consistent(comparable_board_cross_brand) :-
    consistent(s7, comparable_board_cross_brand),
    consistent(s27, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, korua_transition_finder)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values jones_flagship=Jones_Flagship_749_95 unk_comparable_board_same_brand=Unknown
% @importance 1.0

0.92::acc(s3, comparable_board_same_brand).

0.92::true_val(comparable_board_same_brand, jones_flagship); 0.08::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s3, comparable_board_same_brand, jones_flagship).

all_consistent(comparable_board_same_brand) :-
    consistent(s3, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, jones_flagship)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_freecarver
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Freecarver)
% @values jones_freecarver=Jones_Freecarver_6000s_9000s unk_comparable_board_same_brand_freecarver=Unknown
% @importance 0.85

0.85::acc(s9, comparable_board_same_brand_freecarver).

0.85::true_val(comparable_board_same_brand_freecarver, jones_freecarver); 0.15::true_val(comparable_board_same_brand_freecarver, unk_comparable_board_same_brand_freecarver).

measured(s9, comparable_board_same_brand_freecarver, jones_freecarver).

all_consistent(comparable_board_same_brand_freecarver) :-
    consistent(s9, comparable_board_same_brand_freecarver).

evidence(all_consistent(comparable_board_same_brand_freecarver)).
query(true_val(comparable_board_same_brand_freecarver, jones_freecarver)).
query(true_val(comparable_board_same_brand_freecarver, unk_comparable_board_same_brand_freecarver)).

% @attr comparable_board_same_brand_mind_expander
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Mind Expander)
% @values jones_mind_expander=Jones_Mind_Expander_turny_alternative unk_comparable_board_same_brand_mind_expander=Unknown
% @importance 0.8

0.82::acc(s7, comparable_board_same_brand_mind_expander).

0.82::true_val(comparable_board_same_brand_mind_expander, jones_mind_expander); 0.18::true_val(comparable_board_same_brand_mind_expander, unk_comparable_board_same_brand_mind_expander).

measured(s7, comparable_board_same_brand_mind_expander, jones_mind_expander).

all_consistent(comparable_board_same_brand_mind_expander) :-
    consistent(s7, comparable_board_same_brand_mind_expander).

evidence(all_consistent(comparable_board_same_brand_mind_expander)).
query(true_val(comparable_board_same_brand_mind_expander, jones_mind_expander)).
query(true_val(comparable_board_same_brand_mind_expander, unk_comparable_board_same_brand_mind_expander)).

% @attr comparable_board_same_brand_stratos
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Stratos)
% @values jones_stratos=Jones_Stratos_669_95 unk_comparable_board_same_brand_stratos=Unknown
% @importance 1.0

0.92::acc(s3, comparable_board_same_brand_stratos).

0.92::true_val(comparable_board_same_brand_stratos, jones_stratos); 0.08::true_val(comparable_board_same_brand_stratos, unk_comparable_board_same_brand_stratos).

measured(s3, comparable_board_same_brand_stratos, jones_stratos).

all_consistent(comparable_board_same_brand_stratos) :-
    consistent(s3, comparable_board_same_brand_stratos).

evidence(all_consistent(comparable_board_same_brand_stratos)).
query(true_val(comparable_board_same_brand_stratos, jones_stratos)).
query(true_val(comparable_board_same_brand_stratos, unk_comparable_board_same_brand_stratos)).

% @attr comparable_board_same_brand_frontier
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Frontier)
% @values jones_frontier_2_0=Jones_Frontier_2.0_529_95 unk_comparable_board_same_brand_frontier=Unknown
% @importance 1.0

0.92::acc(s3, comparable_board_same_brand_frontier).

0.92::true_val(comparable_board_same_brand_frontier, jones_frontier_2_0); 0.08::true_val(comparable_board_same_brand_frontier, unk_comparable_board_same_brand_frontier).

measured(s3, comparable_board_same_brand_frontier, jones_frontier_2_0).

all_consistent(comparable_board_same_brand_frontier) :-
    consistent(s3, comparable_board_same_brand_frontier).

evidence(all_consistent(comparable_board_same_brand_frontier)).
query(true_val(comparable_board_same_brand_frontier, jones_frontier_2_0)).
query(true_val(comparable_board_same_brand_frontier, unk_comparable_board_same_brand_frontier)).

% @attr comparable_board_cross_brand_group
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (group)
% @values stratos_powderhull_transition=Jones_Stratos_Yes_Powderhull_Korua_Transition_Finder unk_comparable_board_cross_brand_group=Unknown
% @importance 0.7

0.80::acc(s27, comparable_board_cross_brand_group).

0.80::true_val(comparable_board_cross_brand_group, stratos_powderhull_transition); 0.20::true_val(comparable_board_cross_brand_group, unk_comparable_board_cross_brand_group).

measured(s27, comparable_board_cross_brand_group, stratos_powderhull_transition).

all_consistent(comparable_board_cross_brand_group) :-
    consistent(s27, comparable_board_cross_brand_group).

evidence(all_consistent(comparable_board_cross_brand_group)).
query(true_val(comparable_board_cross_brand_group, stratos_powderhull_transition)).
query(true_val(comparable_board_cross_brand_group, unk_comparable_board_cross_brand_group)).

% @attr warranty
% @type categorical
% @canonical false
% @original_name warranty
% @values extended_via_registration=Extended_warranty_via_product_registration unk_warranty=Unknown
% @importance 1.0

0.95::acc(s3, warranty).

0.95::true_val(warranty, extended_via_registration); 0.05::true_val(warranty, unk_warranty).

measured(s3, warranty, extended_via_registration).

all_consistent(warranty) :-
    consistent(s3, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, extended_via_registration)).
query(true_val(warranty, unk_warranty)).

% @attr return_policy_terms
% @type categorical
% @canonical false
% @original_name return_policy_terms
% @values thirty_day_unused_buyer_ships=30_day_returns_unused_buyer_pays_shipping_sale_final unk_return_policy_terms=Unknown
% @importance 1.0

0.95::acc(s3, return_policy_terms).

0.95::true_val(return_policy_terms, thirty_day_unused_buyer_ships); 0.05::true_val(return_policy_terms, unk_return_policy_terms).

measured(s3, return_policy_terms, thirty_day_unused_buyer_ships).

all_consistent(return_policy_terms) :-
    consistent(s3, return_policy_terms).

evidence(all_consistent(return_policy_terms)).
query(true_val(return_policy_terms, thirty_day_unused_buyer_ships)).
query(true_val(return_policy_terms, unk_return_policy_terms)).

% @attr size_144_specs
% @type categorical
% @canonical false
% @original_name Size 144cm weight
% @values specs_144=2.6kg_waist25.1_sc8.1_wt41-63kg unk_size_144_specs=Unknown
% @importance 1.0

0.95::acc(s3, size_144_specs).

0.95::true_val(size_144_specs, specs_144); 0.05::true_val(size_144_specs, unk_size_144_specs).

measured(s3, size_144_specs, specs_144).

all_consistent(size_144_specs) :-
    consistent(s3, size_144_specs).

evidence(all_consistent(size_144_specs)).
query(true_val(size_144_specs, specs_144)).
query(true_val(size_144_specs, unk_size_144_specs)).

% @attr size_148_specs
% @type categorical
% @canonical false
% @original_name Size 148cm weight
% @values specs_148=2.7kg_waist25.5_sc8.4_wt41-63kg unk_size_148_specs=Unknown
% @importance 1.0

0.95::acc(s3, size_148_specs).

0.95::true_val(size_148_specs, specs_148); 0.05::true_val(size_148_specs, unk_size_148_specs).

measured(s3, size_148_specs, specs_148).

all_consistent(size_148_specs) :-
    consistent(s3, size_148_specs).

evidence(all_consistent(size_148_specs)).
query(true_val(size_148_specs, specs_148)).
query(true_val(size_148_specs, unk_size_148_specs)).

% @attr size_152_specs
% @type categorical
% @canonical false
% @original_name Size 152cm weight
% @values specs_152=2.9kg_waist25.9_sc8.7_wt49-73kg unk_size_152_specs=Unknown
% @importance 1.0

0.95::acc(s3, size_152_specs).

0.95::true_val(size_152_specs, specs_152); 0.05::true_val(size_152_specs, unk_size_152_specs).

measured(s3, size_152_specs, specs_152).

all_consistent(size_152_specs) :-
    consistent(s3, size_152_specs).

evidence(all_consistent(size_152_specs)).
query(true_val(size_152_specs, specs_152)).
query(true_val(size_152_specs, unk_size_152_specs)).

% @attr size_164_specs
% @type categorical
% @canonical false
% @original_name Size 164cm weight
% @values specs_164=3.3kg_waist27.1_sc9.6_wt77-100kg unk_size_164_specs=Unknown
% @importance 1.0

0.95::acc(s3, size_164_specs).

0.95::true_val(size_164_specs, specs_164); 0.05::true_val(size_164_specs, unk_size_164_specs).

measured(s3, size_164_specs, specs_164).

all_consistent(size_164_specs) :-
    consistent(s3, size_164_specs).

evidence(all_consistent(size_164_specs)).
query(true_val(size_164_specs, specs_164)).
query(true_val(size_164_specs, unk_size_164_specs)).