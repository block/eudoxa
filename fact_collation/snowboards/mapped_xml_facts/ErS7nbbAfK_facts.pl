0.20::indep(s1).
0.15::indep(s16).
0.15::indep(s30).
0.15::indep(s31).
0.15::indep(s32).
0.15::indep(s33).
0.15::indep(s38).
0.12::indep(s13).
0.12::indep(s19).
0.12::indep(s22).
0.12::indep(s29).
0.12::indep(s37).
0.12::indep(s41).
0.80::indep(s43).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values nitro=Nitro unk_brand=Unknown
% @importance 1.0

0.85::true_val(brand, nitro); 0.15::true_val(brand, unk_brand).
0.90::acc(s1, brand).
measured(s1, brand, nitro).
all_consistent(brand) :- consistent(s1, brand).
evidence(all_consistent(brand)).
query(true_val(brand, nitro)).
query(true_val(brand, unk_brand)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values nitro_ag_switzerland=Nitro_AG_Hunenberg_Switzerland unk_manufacturer=Unknown
% @importance 0.4

0.90::true_val(manufacturer, nitro_ag_switzerland); 0.10::true_val(manufacturer, unk_manufacturer).
0.95::acc(s2, manufacturer).
measured(s2, manufacturer, nitro_ag_switzerland).
all_consistent(manufacturer) :- consistent(s2, manufacturer).
evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, nitro_ag_switzerland)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr eu_representative
% @type categorical
% @canonical false
% @original_name EU representative
% @values nitro_italia=Nitro_Distribution_Italia_SRL_Arco unk_eu_representative=Unknown
% @importance 0.4

0.90::true_val(eu_representative, nitro_italia); 0.10::true_val(eu_representative, unk_eu_representative).
0.95::acc(s2, eu_representative).
measured(s2, eu_representative, nitro_italia).
all_consistent(eu_representative) :- consistent(s2, eu_representative).
evidence(all_consistent(eu_representative)).
query(true_val(eu_representative, nitro_italia)).
query(true_val(eu_representative, unk_eu_representative)).

% @attr us_distribution
% @type categorical
% @canonical false
% @original_name US distribution
% @values foundry_slc=Foundry_Distribution_Salt_Lake_City unk_us_distribution=Unknown
% @importance 0.35

0.86::true_val(us_distribution, foundry_slc); 0.14::true_val(us_distribution, unk_us_distribution).
0.90::acc(s3, us_distribution).
measured(s3, us_distribution, foundry_slc).
all_consistent(us_distribution) :- consistent(s3, us_distribution).
evidence(all_consistent(us_distribution)).
query(true_val(us_distribution, foundry_slc)).
query(true_val(us_distribution, unk_us_distribution)).

% @attr founded
% @type categorical
% @canonical false
% @original_name Founded
% @values y1990_seattle=1990_Seattle_WA unk_founded=Unknown
% @importance 0.3

0.86::true_val(founded, y1990_seattle); 0.14::true_val(founded, unk_founded).
0.90::acc(s4, founded).
measured(s4, founded, y1990_seattle).
all_consistent(founded) :- consistent(s4, founded).
evidence(all_consistent(founded)).
query(true_val(founded, y1990_seattle)).
query(true_val(founded, unk_founded)).

% @attr company_size
% @type categorical
% @canonical false
% @original_name Company size
% @values approx_81_employees=81_employees_4_continents unk_company_size=Unknown
% @importance 0.2

0.47::true_val(company_size, approx_81_employees); 0.53::true_val(company_size, unk_company_size).
0.55::acc(s5, company_size).
measured(s5, company_size, approx_81_employees).
all_consistent(company_size) :- consistent(s5, company_size).
evidence(all_consistent(company_size)).
query(true_val(company_size, approx_81_employees)).
query(true_val(company_size, unk_company_size)).

% @attr no_direct_online_usa
% @type categorical
% @canonical false
% @original_name No direct online sales USA
% @values confirmed=No_direct_online_sales_USA unk_no_direct_online_usa=Unknown
% @importance 0.6

0.81::true_val(no_direct_online_usa, confirmed); 0.19::true_val(no_direct_online_usa, unk_no_direct_online_usa).
0.90::acc(s6, no_direct_online_usa).
measured(s6, no_direct_online_usa, confirmed).
all_consistent(no_direct_online_usa) :- consistent(s6, no_direct_online_usa).
evidence(all_consistent(no_direct_online_usa)).
query(true_val(no_direct_online_usa, confirmed)).
query(true_val(no_direct_online_usa, unk_no_direct_online_usa)).

% @attr design_location
% @type categorical
% @canonical false
% @original_name Products designed in Seattle, engineered in Europe
% @values seattle_design_europe_eng=Seattle_design_Europe_engineering unk_design_location=Unknown
% @importance 0.35

0.56::true_val(design_location, seattle_design_europe_eng); 0.44::true_val(design_location, unk_design_location).
0.72::acc(s7, design_location).
measured(s7, design_location, seattle_design_europe_eng).
all_consistent(design_location) :- consistent(s7, design_location).
evidence(all_consistent(design_location)).
query(true_val(design_location, seattle_design_europe_eng)).
query(true_val(design_location, unk_design_location)).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values taiwan_playmaker=Taiwan_Playmaker_factory unk_manufacturing_location_current=Unknown
% @importance 0.425

0.95::true_val(manufacturing_location_current, taiwan_playmaker); 0.05::true_val(manufacturing_location_current, unk_manufacturing_location_current).
0.75::acc(s8, manufacturing_location_current).
0.78::acc(s9, manufacturing_location_current).
measured(s8, manufacturing_location_current, taiwan_playmaker).
measured(s9, manufacturing_location_current, taiwan_playmaker).
all_consistent(manufacturing_location_current) :- consistent(s8, manufacturing_location_current), consistent(s9, manufacturing_location_current).
evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, taiwan_playmaker)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

% @attr brand_reputation
% @type categorical
% @canonical false
% @original_name Brand reputation
% @values rider_driven_heritage=Rider_driven_snowboard_heritage_brand unk_brand_reputation=Unknown
% @importance 0.25

0.36::true_val(brand_reputation, rider_driven_heritage); 0.64::true_val(brand_reputation, unk_brand_reputation).
0.55::acc(s10, brand_reputation).
measured(s10, brand_reputation, rider_driven_heritage).
all_consistent(brand_reputation) :- consistent(s10, brand_reputation).
evidence(all_consistent(brand_reputation)).
query(true_val(brand_reputation, rider_driven_heritage)).
query(true_val(brand_reputation, unk_brand_reputation)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values team=Team unk_model_name=Unknown
% @importance 1.0

0.85::true_val(model_name, team); 0.15::true_val(model_name, unk_model_name).
0.92::acc(s1, model_name).
measured(s1, model_name, team).
all_consistent(model_name) :- consistent(s1, model_name).
evidence(all_consistent(model_name)).
query(true_val(model_name, team)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type numeric
% @canonical true
% @original_name model_year
% @values v2027=2027 unk_model_year=Unknown
% @importance 1.0

0.85::true_val(model_year, v2027); 0.15::true_val(model_year, unk_model_year).
0.92::acc(s1, model_year).
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

0.85::true_val(product_type, snowboard); 0.15::true_val(product_type, unk_product_type).
0.92::acc(s1, product_type).
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
% @importance 1.0

0.85::true_val(board_category, freestyle_all_mountain); 0.15::true_val(board_category, unk_board_category).
0.88::acc(s1, board_category).
measured(s1, board_category, freestyle_all_mountain).
all_consistent(board_category) :- consistent(s1, board_category).
evidence(all_consistent(board_category)).
query(true_val(board_category, freestyle_all_mountain)).
query(true_val(board_category, unk_board_category)).

% @attr team_classic_heritage
% @type categorical
% @canonical false
% @original_name Team classic heritage
% @values over_two_decades=Classic_for_over_two_decades unk_team_classic_heritage=Unknown
% @importance 0.5

0.86::true_val(team_classic_heritage, over_two_decades); 0.14::true_val(team_classic_heritage, unk_team_classic_heritage).
0.90::acc(s11, team_classic_heritage).
measured(s11, team_classic_heritage, over_two_decades).
all_consistent(team_classic_heritage) :- consistent(s11, team_classic_heritage).
evidence(all_consistent(team_classic_heritage)).
query(true_val(team_classic_heritage, over_two_decades)).
query(true_val(team_classic_heritage, unk_team_classic_heritage)).

% @attr flagship_description
% @type categorical
% @canonical false
% @original_name Flagship description
% @values favorite_board_flagship=Favorite_snowboarders_favorite_board unk_flagship_description=Unknown
% @importance 0.4

0.56::true_val(flagship_description, favorite_board_flagship); 0.44::true_val(flagship_description, unk_flagship_description).
0.65::acc(s12, flagship_description).
measured(s12, flagship_description, favorite_board_flagship).
all_consistent(flagship_description) :- consistent(s12, flagship_description).
evidence(all_consistent(flagship_description)).
query(true_val(flagship_description, favorite_board_flagship)).
query(true_val(flagship_description, unk_flagship_description)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.5

0.67::true_val(gender, mens); 0.33::true_val(gender, unk_gender).
0.75::acc(s13, gender).
measured(s13, gender, mens).
all_consistent(gender) :- consistent(s13, gender).
evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values preorder=Preorder unk_availability_status=Unknown
% @importance 1.0

0.85::true_val(availability_status, preorder); 0.15::true_val(availability_status, unk_availability_status).
0.88::acc(s1, availability_status).
measured(s1, availability_status, preorder).
all_consistent(availability_status) :- consistent(s1, availability_status).
evidence(all_consistent(availability_status)).
query(true_val(availability_status, preorder)).
query(true_val(availability_status, unk_availability_status)).

% @attr estimated_availability_date
% @type categorical
% @canonical true
% @original_name estimated_availability_date
% @values may_2026=May_1_2026 unk_estimated_availability_date=Unknown
% @importance 1.0

0.85::true_val(estimated_availability_date, may_2026); 0.15::true_val(estimated_availability_date, unk_estimated_availability_date).
0.88::acc(s1, estimated_availability_date).
measured(s1, estimated_availability_date, may_2026).
all_consistent(estimated_availability_date) :- consistent(s1, estimated_availability_date).
evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, may_2026)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

% @attr available_retailers_2027
% @type categorical
% @canonical false
% @original_name Available retailers 2027
% @values blauer_milosport=Blauer_Board_Shop_and_Milosport unk_available_retailers_2027=Unknown
% @importance 0.65

0.55::true_val(available_retailers_2027, blauer_milosport); 0.45::true_val(available_retailers_2027, unk_available_retailers_2027).
0.68::acc(s14, available_retailers_2027).
0.65::acc(s15, available_retailers_2027).
measured(s14, available_retailers_2027, blauer_milosport).
measured(s15, available_retailers_2027, blauer_milosport).
all_consistent(available_retailers_2027) :- consistent(s14, available_retailers_2027), consistent(s15, available_retailers_2027).
evidence(all_consistent(available_retailers_2027)).
query(true_val(available_retailers_2027, blauer_milosport)).
query(true_val(available_retailers_2027, unk_available_retailers_2027)).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_evo
% @values v405_91=405.91 unk_price_usd_evo=Unknown
% @importance 0.9

0.77::true_val(price_usd_evo, v405_91); 0.23::true_val(price_usd_evo, unk_price_usd_evo).
0.88::acc(s16, price_usd_evo).
measured(s16, price_usd_evo, v405_91).
all_consistent(price_usd_evo) :- consistent(s16, price_usd_evo).
evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v405_91)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr prior_model_retailer_pure
% @type categorical
% @canonical false
% @original_name Prior model year (2026) at Pure Boardshop
% @values available=Available unk_prior_model_retailer_pure=Unknown
% @importance 0.6

0.55::true_val(prior_model_retailer_pure, available); 0.45::true_val(prior_model_retailer_pure, unk_prior_model_retailer_pure).
0.65::acc(s17, prior_model_retailer_pure).
measured(s17, prior_model_retailer_pure, available).
all_consistent(prior_model_retailer_pure) :- consistent(s17, prior_model_retailer_pure).
evidence(all_consistent(prior_model_retailer_pure)).
query(true_val(prior_model_retailer_pure, available)).
query(true_val(prior_model_retailer_pure, unk_prior_model_retailer_pure)).

% @attr prior_model_retailer_baker
% @type categorical
% @canonical false
% @original_name Prior model year (2026) at Baker Street Snow
% @values available=Available unk_prior_model_retailer_baker=Unknown
% @importance 0.55

0.48::true_val(prior_model_retailer_baker, available); 0.52::true_val(prior_model_retailer_baker, unk_prior_model_retailer_baker).
0.60::acc(s18, prior_model_retailer_baker).
measured(s18, prior_model_retailer_baker, available).
all_consistent(prior_model_retailer_baker) :- consistent(s18, prior_model_retailer_baker).
evidence(all_consistent(prior_model_retailer_baker)).
query(true_val(prior_model_retailer_baker, available)).
query(true_val(prior_model_retailer_baker, unk_prior_model_retailer_baker)).

% @attr prior_model_retailer_source
% @type categorical
% @canonical false
% @original_name Prior model year (2026) at The Source
% @values available=Available unk_prior_model_retailer_source=Unknown
% @importance 0.9

0.51::true_val(prior_model_retailer_source, available); 0.49::true_val(prior_model_retailer_source, unk_prior_model_retailer_source).
0.62::acc(s19, prior_model_retailer_source).
measured(s19, prior_model_retailer_source, available).
all_consistent(prior_model_retailer_source) :- consistent(s19, prior_model_retailer_source).
evidence(all_consistent(prior_model_retailer_source)).
query(true_val(prior_model_retailer_source, available)).
query(true_val(prior_model_retailer_source, unk_prior_model_retailer_source)).

% @attr price_usd_rei
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_rei
% @values v405_83=405.83 unk_price_usd_rei=Unknown
% @importance 0.8

0.60::true_val(price_usd_rei, v405_83); 0.40::true_val(price_usd_rei, unk_price_usd_rei).
0.78::acc(s20, price_usd_rei).
measured(s20, price_usd_rei, v405_83).
all_consistent(price_usd_rei) :- consistent(s20, price_usd_rei).
evidence(all_consistent(price_usd_rei)).
query(true_val(price_usd_rei, v405_83)).
query(true_val(price_usd_rei, unk_price_usd_rei)).

% @attr price_eur_blue_tomato
% @type numeric
% @unit EUR
% @canonical true
% @original_name price_eur_blue_tomato
% @values v579_95=579.95 unk_price_eur_blue_tomato=Unknown
% @importance 0.7

0.60::true_val(price_eur_blue_tomato, v579_95); 0.40::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).
0.78::acc(s21, price_eur_blue_tomato).
measured(s21, price_eur_blue_tomato, v579_95).
all_consistent(price_eur_blue_tomato) :- consistent(s21, price_eur_blue_tomato).
evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v579_95)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

% @attr prior_model_retailer_ski_world
% @type categorical
% @canonical false
% @original_name Prior model year (2026) at Ski World
% @values available=Available unk_prior_model_retailer_ski_world=Unknown
% @importance 0.8

0.51::true_val(prior_model_retailer_ski_world, available); 0.49::true_val(prior_model_retailer_ski_world, unk_prior_model_retailer_ski_world).
0.62::acc(s22, prior_model_retailer_ski_world).
measured(s22, prior_model_retailer_ski_world, available).
all_consistent(prior_model_retailer_ski_world) :- consistent(s22, prior_model_retailer_ski_world).
evidence(all_consistent(prior_model_retailer_ski_world)).
query(true_val(prior_model_retailer_ski_world, available)).
query(true_val(prior_model_retailer_ski_world, unk_prior_model_retailer_ski_world)).

% @attr prior_model_retailer_snowcountry
% @type categorical
% @canonical false
% @original_name Prior model year (2026) at SnowCountry
% @values available_team_pro_eur499=Available_Team_Pro_EUR499 unk_prior_model_retailer_snowcountry=Unknown
% @importance 0.65

0.49::true_val(prior_model_retailer_snowcountry, available_team_pro_eur499); 0.51::true_val(prior_model_retailer_snowcountry, unk_prior_model_retailer_snowcountry).
0.65::acc(s23, prior_model_retailer_snowcountry).
measured(s23, prior_model_retailer_snowcountry, available_team_pro_eur499).
all_consistent(prior_model_retailer_snowcountry) :- consistent(s23, prior_model_retailer_snowcountry).
evidence(all_consistent(prior_model_retailer_snowcountry)).
query(true_val(prior_model_retailer_snowcountry, available_team_pro_eur499)).
query(true_val(prior_model_retailer_snowcountry, unk_prior_model_retailer_snowcountry)).

% @attr prior_model_retailer_prfo
% @type categorical
% @canonical false
% @original_name Prior model year (2026) at PRFO Sports Canada
% @values available=Available unk_prior_model_retailer_prfo=Unknown
% @importance 0.65

0.53::true_val(prior_model_retailer_prfo, available); 0.47::true_val(prior_model_retailer_prfo, unk_prior_model_retailer_prfo).
0.68::acc(s24, prior_model_retailer_prfo).
measured(s24, prior_model_retailer_prfo, available).
all_consistent(prior_model_retailer_prfo) :- consistent(s24, prior_model_retailer_prfo).
evidence(all_consistent(prior_model_retailer_prfo)).
query(true_val(prior_model_retailer_prfo, available)).
query(true_val(prior_model_retailer_prfo, unk_prior_model_retailer_prfo)).

% @attr prior_model_retailer_bergs
% @type categorical
% @canonical false
% @original_name Prior model year (2026) at Bergs Ski Shop
% @values available=Available unk_prior_model_retailer_bergs=Unknown
% @importance 0.5

0.42::true_val(prior_model_retailer_bergs, available); 0.58::true_val(prior_model_retailer_bergs, unk_prior_model_retailer_bergs).
0.58::acc(s25, prior_model_retailer_bergs).
measured(s25, prior_model_retailer_bergs, available).
all_consistent(prior_model_retailer_bergs) :- consistent(s25, prior_model_retailer_bergs).
evidence(all_consistent(prior_model_retailer_bergs)).
query(true_val(prior_model_retailer_bergs, available)).
query(true_val(prior_model_retailer_bergs, unk_prior_model_retailer_bergs)).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v899_99=899.99 unk_price_aud_merchant=Unknown
% @importance 1.0

0.85::true_val(price_aud_merchant, v899_99); 0.15::true_val(price_aud_merchant, unk_price_aud_merchant).
0.88::acc(s1, price_aud_merchant).
measured(s1, price_aud_merchant, v899_99).
all_consistent(price_aud_merchant) :- consistent(s1, price_aud_merchant).
evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v899_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v579_95=579.95 unk_price_usd_msrp=Unknown
% @importance 0.9

0.77::true_val(price_usd_msrp, v579_95); 0.23::true_val(price_usd_msrp, unk_price_usd_msrp).
0.88::acc(s16, price_usd_msrp).
measured(s16, price_usd_msrp, v579_95).
all_consistent(price_usd_msrp) :- consistent(s16, price_usd_msrp).
evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v579_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_gbp_blue_tomato_uk
% @type numeric
% @unit GBP
% @canonical true
% @original_name price_gbp_blue_tomato_uk
% @values v379=379.0 unk_price_gbp_blue_tomato_uk=Unknown
% @importance 0.3

0.53::true_val(price_gbp_blue_tomato_uk, v379); 0.47::true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk).
0.68::acc(s26, price_gbp_blue_tomato_uk).
measured(s26, price_gbp_blue_tomato_uk, v379).
all_consistent(price_gbp_blue_tomato_uk) :- consistent(s26, price_gbp_blue_tomato_uk).
evidence(all_consistent(price_gbp_blue_tomato_uk)).
query(true_val(price_gbp_blue_tomato_uk, v379)).
query(true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk)).

% @attr competitor_pricing_context
% @type categorical
% @canonical false
% @original_name Competitor pricing context
% @values team_cheaper_than_custom=Team_historically_cheaper_than_Burton_Custom unk_competitor_pricing_context=Unknown
% @importance 0.75

0.26::true_val(competitor_pricing_context, team_cheaper_than_custom); 0.74::true_val(competitor_pricing_context, unk_competitor_pricing_context).
0.45::acc(s27, competitor_pricing_context).
measured(s27, competitor_pricing_context, team_cheaper_than_custom).
all_consistent(competitor_pricing_context) :- consistent(s27, competitor_pricing_context).
evidence(all_consistent(competitor_pricing_context)).
query(true_val(competitor_pricing_context, team_cheaper_than_custom)).
query(true_val(competitor_pricing_context, unk_competitor_pricing_context)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values true_camber=True_Camber cam_out_camber=Cam_Out_Camber
% @importance 0.925

0.70::true_val(camber_type, true_camber); 0.30::true_val(camber_type, cam_out_camber).
0.82::acc(s1, camber_type).
0.95::acc(s28, camber_type).
0.58::acc(s19, camber_type).
0.55::acc(s29, camber_type).
measured(s1, camber_type, true_camber).
measured(s28, camber_type, true_camber).
measured(s19, camber_type, cam_out_camber).
measured(s29, camber_type, cam_out_camber).
all_consistent(camber_type) :-
    consistent(s28, camber_type),
    consistent(s19, camber_type),
    consistent(s29, camber_type),
    (indep(s1), consistent(s1, camber_type) ; \+indep(s1)).
evidence(all_consistent(camber_type)).
query(true_val(camber_type, true_camber)).
query(true_val(camber_type, cam_out_camber)).

% @attr core_profile
% @type categorical
% @canonical false
% @original_name Core profile
% @values reflex_core=Reflex_Core_Profile unk_core_profile=Unknown
% @importance 0.875

0.95::true_val(core_profile, reflex_core); 0.05::true_val(core_profile, unk_core_profile).
0.88::acc(s1, core_profile).
0.88::acc(s30, core_profile).
measured(s1, core_profile, reflex_core).
measured(s30, core_profile, reflex_core).
all_consistent(core_profile) :-
    consistent(s30, core_profile),
    (indep(s1), consistent(s1, core_profile) ; \+indep(s1)).
evidence(all_consistent(core_profile)).
query(true_val(core_profile, reflex_core)).
query(true_val(core_profile, unk_core_profile)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values directional_twin=Directional_Twin unk_shape=Unknown
% @importance 1.0

0.85::true_val(shape, directional_twin); 0.15::true_val(shape, unk_shape).
0.88::acc(s1, shape).
measured(s1, shape, directional_twin).
all_consistent(shape) :- consistent(s1, shape).
evidence(all_consistent(shape)).
query(true_val(shape, directional_twin)).
query(true_val(shape, unk_shape)).

% @attr shape_description
% @type categorical
% @canonical false
% @original_name Shape description
% @values nose_longer_than_tail=Best_ridden_regular_nose_slightly_longer unk_shape_description=Unknown
% @importance 0.85

0.81::true_val(shape_description, nose_longer_than_tail); 0.19::true_val(shape_description, unk_shape_description).
0.88::acc(s31, shape_description).
measured(s31, shape_description, nose_longer_than_tail).
all_consistent(shape_description) :-
    (indep(s31), consistent(s31, shape_description) ; \+indep(s31)).
evidence(all_consistent(shape_description)).
query(true_val(shape_description, nose_longer_than_tail)).
query(true_val(shape_description, unk_shape_description)).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v7=7.0 unk_flex_rating_10=Unknown
% @importance 1.0

0.85::true_val(flex_rating_10, v7); 0.15::true_val(flex_rating_10, unk_flex_rating_10).
0.90::acc(s1, flex_rating_10).
measured(s1, flex_rating_10, v7).
all_consistent(flex_rating_10) :- consistent(s1, flex_rating_10).
evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v7)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values mid_flex=Mid_flex_balanced unk_flex_feel=Unknown
% @importance 0.8

0.95::true_val(flex_feel, mid_flex); 0.05::true_val(flex_feel, unk_flex_feel).
0.82::acc(s1, flex_feel).
0.82::acc(s57, flex_feel).
0.78::acc(s62, flex_feel).
measured(s1, flex_feel, mid_flex).
measured(s57, flex_feel, mid_flex).
measured(s62, flex_feel, mid_flex).
all_consistent(flex_feel) :-
    consistent(s57, flex_feel),
    consistent(s62, flex_feel),
    (indep(s1), consistent(s1, flex_feel) ; \+indep(s1)).
evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, mid_flex)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr flex_pattern_name
% @type categorical
% @canonical false
% @original_name Flex pattern name
% @values all_terrain=All_Terrain unk_flex_pattern_name=Unknown
% @importance 0.7

0.77::true_val(flex_pattern_name, all_terrain); 0.23::true_val(flex_pattern_name, unk_flex_pattern_name).
0.85::acc(s32, flex_pattern_name).
measured(s32, flex_pattern_name, all_terrain).
all_consistent(flex_pattern_name) :-
    (indep(s32), consistent(s32, flex_pattern_name) ; \+indep(s32)).
evidence(all_consistent(flex_pattern_name)).
query(true_val(flex_pattern_name, all_terrain)).
query(true_val(flex_pattern_name, unk_flex_pattern_name)).

% @attr evo_flex_category
% @type categorical
% @canonical false
% @original_name evo flex categorization
% @values stiff=Stiff_6_to_8 unk_evo_flex_category=Unknown
% @importance 0.8

0.77::true_val(evo_flex_category, stiff); 0.23::true_val(evo_flex_category, unk_evo_flex_category).
0.85::acc(s33, evo_flex_category).
measured(s33, evo_flex_category, stiff).
all_consistent(evo_flex_category) :-
    (indep(s33), consistent(s33, evo_flex_category) ; \+indep(s33)).
evidence(all_consistent(evo_flex_category)).
query(true_val(evo_flex_category, stiff)).
query(true_val(evo_flex_category, unk_evo_flex_category)).

% @attr flex_direction
% @type categorical
% @canonical false
% @original_name flex_direction
% @values symmetrical=Symmetrical_not_directional unk_flex_direction=Unknown
% @importance 0.7

0.77::true_val(flex_direction, symmetrical); 0.23::true_val(flex_direction, unk_flex_direction).
0.82::acc(s32, flex_direction).
measured(s32, flex_direction, symmetrical).
all_consistent(flex_direction) :-
    (indep(s32), consistent(s32, flex_direction) ; \+indep(s32)).
evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, symmetrical)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values dual_degressive=Dual_Degressive_Sidecut unk_sidecut_type=Unknown
% @importance 1.0

0.85::true_val(sidecut_type, dual_degressive); 0.15::true_val(sidecut_type, unk_sidecut_type).
0.90::acc(s1, sidecut_type).
measured(s1, sidecut_type, dual_degressive).
all_consistent(sidecut_type) :- consistent(s1, sidecut_type).
evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, dual_degressive)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr sidecut_description
% @type categorical
% @canonical false
% @original_name Sidecut description
% @values loose_playful_forgiving=Loose_playful_most_forgiving unk_sidecut_description=Unknown
% @importance 0.925

0.95::true_val(sidecut_description, loose_playful_forgiving); 0.05::true_val(sidecut_description, unk_sidecut_description).
0.88::acc(s1, sidecut_description).
0.95::acc(s34, sidecut_description).
measured(s1, sidecut_description, loose_playful_forgiving).
measured(s34, sidecut_description, loose_playful_forgiving).
all_consistent(sidecut_description) :-
    consistent(s34, sidecut_description),
    (indep(s1), consistent(s1, sidecut_description) ; \+indep(s1)).
evidence(all_consistent(sidecut_description)).
query(true_val(sidecut_description, loose_playful_forgiving)).
query(true_val(sidecut_description, unk_sidecut_description)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values powerlite_poplar=PowerLite_ultra_lightweight_poplar unk_core_material=Unknown
% @importance 0.9

0.95::true_val(core_material, powerlite_poplar); 0.05::true_val(core_material, unk_core_material).
0.88::acc(s1, core_material).
0.95::acc(s35, core_material).
measured(s1, core_material, powerlite_poplar).
measured(s35, core_material, powerlite_poplar).
all_consistent(core_material) :-
    consistent(s35, core_material),
    (indep(s1), consistent(s1, core_material) ; \+indep(s1)).
evidence(all_consistent(core_material)).
query(true_val(core_material, powerlite_poplar)).
query(true_val(core_material, unk_core_material)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values bi_lite=Bi_Lite_Laminates unk_laminate=Unknown
% @importance 0.85

0.95::true_val(laminate, bi_lite); 0.05::true_val(laminate, unk_laminate).
0.88::acc(s1, laminate).
0.92::acc(s36, laminate).
measured(s1, laminate, bi_lite).
measured(s36, laminate, bi_lite).
all_consistent(laminate) :-
    consistent(s36, laminate),
    (indep(s1), consistent(s1, laminate) ; \+indep(s1)).
evidence(all_consistent(laminate)).
query(true_val(laminate, bi_lite)).
query(true_val(laminate, unk_laminate)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values abs=ABS_flexible_impact_resistant unk_sidewall_material=Unknown
% @importance 0.775

0.95::true_val(sidewall_material, abs); 0.05::true_val(sidewall_material, unk_sidewall_material).
0.85::acc(s1, sidewall_material).
0.65::acc(s37, sidewall_material).
measured(s1, sidewall_material, abs).
measured(s37, sidewall_material, abs).
all_consistent(sidewall_material) :-
    consistent(s37, sidewall_material),
    (indep(s1), consistent(s1, sidewall_material) ; \+indep(s1)).
evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, abs)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_ecospeed_hd=Sintered_EcoSpeed_HD_Base unk_base_material=Unknown
% @importance 0.875

0.95::true_val(base_material, sintered_ecospeed_hd); 0.05::true_val(base_material, unk_base_material).
0.88::acc(s1, base_material).
0.88::acc(s38, base_material).
measured(s1, base_material, sintered_ecospeed_hd).
measured(s38, base_material, sintered_ecospeed_hd).
all_consistent(base_material) :-
    (indep(s38), consistent(s38, base_material) ; \+indep(s38)),
    (indep(s1), consistent(s1, base_material) ; \+indep(s1)).
evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_ecospeed_hd)).
query(true_val(base_material, unk_base_material)).

% @attr base_construction_detail
% @type categorical
% @canonical false
% @original_name Base construction detail
% @values recycled_compound=Recycled_material_compound unk_base_construction_detail=Unknown
% @importance 0.6

0.86::true_val(base_construction_detail, recycled_compound); 0.14::true_val(base_construction_detail, unk_base_construction_detail).
0.92::acc(s39, base_construction_detail).
measured(s39, base_construction_detail, recycled_compound).
all_consistent(base_construction_detail) :- consistent(s39, base_construction_detail).
evidence(all_consistent(base_construction_detail)).
query(true_val(base_construction_detail, recycled_compound)).
query(true_val(base_construction_detail, unk_base_construction_detail)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values recycled_steel=Recycled_Steel_Edge unk_edge_technology=Unknown
% @importance 1.0

0.85::true_val(edge_technology, recycled_steel); 0.15::true_val(edge_technology, unk_edge_technology).
0.88::acc(s1, edge_technology).
measured(s1, edge_technology, recycled_steel).
all_consistent(edge_technology) :- consistent(s1, edge_technology).
evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, recycled_steel)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr edge_detail
% @type categorical
% @canonical false
% @original_name Edge detail
% @values pct50_recycled_steel=50pct_recycled_steel_durable unk_edge_detail=Unknown
% @importance 0.45

0.90::true_val(edge_detail, pct50_recycled_steel); 0.10::true_val(edge_detail, unk_edge_detail).
0.95::acc(s40, edge_detail).
measured(s40, edge_detail, pct50_recycled_steel).
all_consistent(edge_detail) :- consistent(s40, edge_detail).
evidence(all_consistent(edge_detail)).
query(true_val(edge_detail, pct50_recycled_steel)).
query(true_val(edge_detail, unk_edge_detail)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 1.0

0.85::true_val(mounting_pattern, inserts_2x4); 0.15::true_val(mounting_pattern, unk_mounting_pattern).
0.90::acc(s1, mounting_pattern).
measured(s1, mounting_pattern, inserts_2x4).
all_consistent(mounting_pattern) :- consistent(s1, mounting_pattern).
evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr mounting_pattern_detail
% @type categorical
% @canonical false
% @original_name 2x4 insert detail
% @values tighter_pattern=Tighter_hole_pattern_precise_stance unk_mounting_pattern_detail=Unknown
% @importance 0.5

0.51::true_val(mounting_pattern_detail, tighter_pattern); 0.49::true_val(mounting_pattern_detail, unk_mounting_pattern_detail).
0.62::acc(s41, mounting_pattern_detail).
measured(s41, mounting_pattern_detail, tighter_pattern).
all_consistent(mounting_pattern_detail) :-
    (indep(s41), consistent(s41, mounting_pattern_detail) ; \+indep(s41)).
evidence(all_consistent(mounting_pattern_detail)).
query(true_val(mounting_pattern_detail, tighter_pattern)).
query(true_val(mounting_pattern_detail, unk_mounting_pattern_detail)).

% @attr no_carbon_reinforcement
% @type categorical
% @canonical false
% @original_name No carbon reinforcement
% @values confirmed_no_carbon=No_carbon_Team_Pro_has_carbon unk_no_carbon_reinforcement=Unknown
% @importance 0.8

0.51::true_val(no_carbon_reinforcement, confirmed_no_carbon); 0.49::true_val(no_carbon_reinforcement, unk_no_carbon_reinforcement).
0.68::acc(s42, no_carbon_reinforcement).
measured(s42, no_carbon_reinforcement, confirmed_no_carbon).
all_consistent(no_carbon_reinforcement) :- consistent(s42, no_carbon_reinforcement).
evidence(all_consistent(no_carbon_reinforcement)).
query(true_val(no_carbon_reinforcement, confirmed_no_carbon)).
query(true_val(no_carbon_reinforcement, unk_no_carbon_reinforcement)).

% @attr width_options
% @type categorical
% @canonical true
% @original_name width_options
% @values standard_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 1.0

0.85::true_val(width_options, standard_wide); 0.15::true_val(width_options, unk_width_options).
0.88::acc(s1, width_options).
measured(s1, width_options, standard_wide).
all_consistent(width_options) :- consistent(s1, width_options).
evidence(all_consistent(width_options)).
query(true_val(width_options, standard_wide)).
query(true_val(width_options, unk_width_options)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values nine_sizes=152_155_157_159_162_157W_159W_162W_165W unk_available_sizes=Unknown
% @importance 1.0

0.85::true_val(available_sizes, nine_sizes); 0.15::true_val(available_sizes, unk_available_sizes).
0.90::acc(s1, available_sizes).
measured(s1, available_sizes, nine_sizes).
all_consistent(available_sizes) :- consistent(s1, available_sizes).
evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, nine_sizes)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr contact_length_size_152
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size 152cm
% @values v114_0=114.0 unk_contact_length_size_152=Unknown
% @importance 1.0

0.85::true_val(contact_length_size_152, v114_0); 0.15::true_val(contact_length_size_152, unk_contact_length_size_152).
0.90::acc(s1, contact_length_size_152).
measured(s1, contact_length_size_152, v114_0).
all_consistent(contact_length_size_152) :- consistent(s1, contact_length_size_152).
evidence(all_consistent(contact_length_size_152)).
query(true_val(contact_length_size_152, v114_0)).
query(true_val(contact_length_size_152, unk_contact_length_size_152)).

% @attr tip_tail_width_size
% @type numeric
% @unit cm
% @canonical true
% @original_name tip_tail_width_size
% @values v28_9=28.9 unk_tip_tail_width_size=Unknown
% @importance 1.0

0.85::true_val(tip_tail_width_size, v28_9); 0.15::true_val(tip_tail_width_size, unk_tip_tail_width_size).
0.90::acc(s1, tip_tail_width_size).
measured(s1, tip_tail_width_size, v28_9).
all_consistent(tip_tail_width_size) :- consistent(s1, tip_tail_width_size).
evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v28_9)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr waist_width_152
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 152cm
% @values v24_6=24.6 unk_waist_width_152=Unknown
% @importance 1.0

0.85::true_val(waist_width_152, v24_6); 0.15::true_val(waist_width_152, unk_waist_width_152).
0.90::acc(s1, waist_width_152).
measured(s1, waist_width_152, v24_6).
all_consistent(waist_width_152) :- consistent(s1, waist_width_152).
evidence(all_consistent(waist_width_152)).
query(true_val(waist_width_152, v24_6)).
query(true_val(waist_width_152, unk_waist_width_152)).

% @attr sidecut_radius_size_152
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size 152cm
% @values r10_7_6_8_10_7=10.7/6.8/10.7 unk_sidecut_radius_size_152=Unknown
% @importance 1.0

0.85::true_val(sidecut_radius_size_152, r10_7_6_8_10_7); 0.15::true_val(sidecut_radius_size_152, unk_sidecut_radius_size_152).
0.90::acc(s1, sidecut_radius_size_152).
measured(s1, sidecut_radius_size_152, r10_7_6_8_10_7).
all_consistent(sidecut_radius_size_152) :- consistent(s1, sidecut_radius_size_152).
evidence(all_consistent(sidecut_radius_size_152)).
query(true_val(sidecut_radius_size_152, r10_7_6_8_10_7)).
query(true_val(sidecut_radius_size_152, unk_sidecut_radius_size_152)).

% @attr setback
% @type numeric
% @unit cm
% @canonical true
% @original_name setback
% @values v_neg1_5=neg1.5 unk_setback=Unknown
% @importance 1.0

0.85::true_val(setback, v_neg1_5); 0.15::true_val(setback, unk_setback).
0.90::acc(s1, setback).
measured(s1, setback, v_neg1_5).
all_consistent(setback) :- consistent(s1, setback).
evidence(all_consistent(setback)).
query(true_val(setback, v_neg1_5)).
query(true_val(setback, unk_setback)).

% @attr recommended_weight_range_size_152
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size 152cm
% @values w50_70=50-70kg unk_recommended_weight_range_size_152=Unknown
% @importance 1.0

0.85::true_val(recommended_weight_range_size_152, w50_70); 0.15::true_val(recommended_weight_range_size_152, unk_recommended_weight_range_size_152).
0.90::acc(s1, recommended_weight_range_size_152).
measured(s1, recommended_weight_range_size_152, w50_70).
all_consistent(recommended_weight_range_size_152) :- consistent(s1, recommended_weight_range_size_152).
evidence(all_consistent(recommended_weight_range_size_152)).
query(true_val(recommended_weight_range_size_152, w50_70)).
query(true_val(recommended_weight_range_size_152, unk_recommended_weight_range_size_152)).

% @attr contact_length_size_155
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size 155cm
% @values v116_0=116.0 unk_contact_length_size_155=Unknown
% @importance 1.0

0.85::true_val(contact_length_size_155, v116_0); 0.15::true_val(contact_length_size_155, unk_contact_length_size_155).
0.90::acc(s1, contact_length_size_155).
measured(s1, contact_length_size_155, v116_0).
all_consistent(contact_length_size_155) :- consistent(s1, contact_length_size_155).
evidence(all_consistent(contact_length_size_155)).
query(true_val(contact_length_size_155, v116_0)).
query(true_val(contact_length_size_155, unk_contact_length_size_155)).

% @attr waist_width_155
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 155cm
% @values v25_0=25.0 unk_waist_width_155=Unknown
% @importance 1.0

0.85::true_val(waist_width_155, v25_0); 0.15::true_val(waist_width_155, unk_waist_width_155).
0.90::acc(s1, waist_width_155).
measured(s1, waist_width_155, v25_0).
all_consistent(waist_width_155) :- consistent(s1, waist_width_155).
evidence(all_consistent(waist_width_155)).
query(true_val(waist_width_155, v25_0)).
query(true_val(waist_width_155, unk_waist_width_155)).

% @attr sidecut_radius_size_155
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size 155cm
% @values r11_0_7_2_11_0=11.0/7.2/11.0 unk_sidecut_radius_size_155=Unknown
% @importance 1.0

0.85::true_val(sidecut_radius_size_155, r11_0_7_2_11_0); 0.15::true_val(sidecut_radius_size_155, unk_sidecut_radius_size_155).
0.90::acc(s1, sidecut_radius_size_155).
measured(s1, sidecut_radius_size_155, r11_0_7_2_11_0).
all_consistent(sidecut_radius_size_155) :- consistent(s1, sidecut_radius_size_155).
evidence(all_consistent(sidecut_radius_size_155)).
query(true_val(sidecut_radius_size_155, r11_0_7_2_11_0)).
query(true_val(sidecut_radius_size_155, unk_sidecut_radius_size_155)).

% @attr recommended_weight_range_size_155
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size 155cm
% @values w55_75=55-75kg unk_recommended_weight_range_size_155=Unknown
% @importance 1.0

0.85::true_val(recommended_weight_range_size_155, w55_75); 0.15::true_val(recommended_weight_range_size_155, unk_recommended_weight_range_size_155).
0.90::acc(s1, recommended_weight_range_size_155).
measured(s1, recommended_weight_range_size_155, w55_75).
all_consistent(recommended_weight_range_size_155) :- consistent(s1, recommended_weight_range_size_155).
evidence(all_consistent(recommended_weight_range_size_155)).
query(true_val(recommended_weight_range_size_155, w55_75)).
query(true_val(recommended_weight_range_size_155, unk_recommended_weight_range_size_155)).

% @attr contact_length_size
% @type numeric
% @unit cm
% @canonical true
% @original_name contact_length_size
% @values v117_0=117.0 unk_contact_length_size=Unknown
% @importance 1.0

0.85::true_val(contact_length_size, v117_0); 0.15::true_val(contact_length_size, unk_contact_length_size).
0.90::acc(s1, contact_length_size).
measured(s1, contact_length_size, v117_0).
all_consistent(contact_length_size) :- consistent(s1, contact_length_size).
evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v117_0)).
query(true_val(contact_length_size, unk_contact_length_size)).

% @attr waist_width_157
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 157cm
% @values v25_2=25.2 unk_waist_width_157=Unknown
% @importance 1.0

0.85::true_val(waist_width_157, v25_2); 0.15::true_val(waist_width_157, unk_waist_width_157).
0.90::acc(s1, waist_width_157).
measured(s1, waist_width_157, v25_2).
all_consistent(waist_width_157) :- consistent(s1, waist_width_157).
evidence(all_consistent(waist_width_157)).
query(true_val(waist_width_157, v25_2)).
query(true_val(waist_width_157, unk_waist_width_157)).

% @attr sidecut_radius_size
% @type categorical
% @unit m
% @canonical true
% @original_name sidecut_radius_size
% @values r11_3_7_3_11_3=11.3/7.3/11.3 unk_sidecut_radius_size=Unknown
% @importance 1.0

0.85::true_val(sidecut_radius_size, r11_3_7_3_11_3); 0.15::true_val(sidecut_radius_size, unk_sidecut_radius_size).
0.90::acc(s1, sidecut_radius_size).
measured(s1, sidecut_radius_size, r11_3_7_3_11_3).
all_consistent(sidecut_radius_size) :- consistent(s1, sidecut_radius_size).
evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, r11_3_7_3_11_3)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size
% @values w60_80=60-80kg unk_recommended_weight_range_size=Unknown
% @importance 1.0

0.85::true_val(recommended_weight_range_size, w60_80); 0.15::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).
0.90::acc(s1, recommended_weight_range_size).
measured(s1, recommended_weight_range_size, w60_80).
all_consistent(recommended_weight_range_size) :- consistent(s1, recommended_weight_range_size).
evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w60_80)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr contact_length_size_159
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size 159cm
% @values v118_0=118.0 unk_contact_length_size_159=Unknown
% @importance 1.0

0.85::true_val(contact_length_size_159, v118_0); 0.15::true_val(contact_length_size_159, unk_contact_length_size_159).
0.90::acc(s1, contact_length_size_159).
measured(s1, contact_length_size_159, v118_0).
all_consistent(contact_length_size_159) :- consistent(s1, contact_length_size_159).
evidence(all_consistent(contact_length_size_159)).
query(true_val(contact_length_size_159, v118_0)).
query(true_val(contact_length_size_159, unk_contact_length_size_159)).

% @attr waist_width_159
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 159cm
% @values v25_4=25.4 unk_waist_width_159=Unknown
% @importance 1.0

0.85::true_val(waist_width_159, v25_4); 0.15::true_val(waist_width_159, unk_waist_width_159).
0.90::acc(s1, waist_width_159).
measured(s1, waist_width_159, v25_4).
all_consistent(waist_width_159) :- consistent(s1, waist_width_159).
evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v25_4)).
query(true_val(waist_width_159, unk_waist_width_159)).

% @attr sidecut_radius_size_159
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size 159cm
% @values r11_7_7_3_11_7=11.7/7.3/11.7 unk_sidecut_radius_size_159=Unknown
% @importance 1.0

0.85::true_val(sidecut_radius_size_159, r11_7_7_3_11_7); 0.15::true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159).
0.90::acc(s1, sidecut_radius_size_159).
measured(s1, sidecut_radius_size_159, r11_7_7_3_11_7).
all_consistent(sidecut_radius_size_159) :- consistent(s1, sidecut_radius_size_159).
evidence(all_consistent(sidecut_radius_size_159)).
query(true_val(sidecut_radius_size_159, r11_7_7_3_11_7)).
query(true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159)).

% @attr recommended_weight_range_size_159
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size 159cm
% @values w65_85=65-85kg unk_recommended_weight_range_size_159=Unknown
% @importance 1.0

0.85::true_val(recommended_weight_range_size_159, w65_85); 0.15::true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159).
0.90::acc(s1, recommended_weight_range_size_159).
measured(s1, recommended_weight_range_size_159, w65_85).
all_consistent(recommended_weight_range_size_159) :- consistent(s1, recommended_weight_range_size_159).
evidence(all_consistent(recommended_weight_range_size_159)).
query(true_val(recommended_weight_range_size_159, w65_85)).
query(true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159)).

% @attr contact_length_size_162
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size 162cm
% @values v121_0=121.0 unk_contact_length_size_162=Unknown
% @importance 1.0

0.85::true_val(contact_length_size_162, v121_0); 0.15::true_val(contact_length_size_162, unk_contact_length_size_162).
0.90::acc(s1, contact_length_size_162).
measured(s1, contact_length_size_162, v121_0).
all_consistent(contact_length_size_162) :- consistent(s1, contact_length_size_162).
evidence(all_consistent(contact_length_size_162)).
query(true_val(contact_length_size_162, v121_0)).
query(true_val(contact_length_size_162, unk_contact_length_size_162)).

% @attr waist_width_162
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 162cm
% @values v25_6=25.6 unk_waist_width_162=Unknown
% @importance 1.0

0.85::true_val(waist_width_162, v25_6); 0.15::true_val(waist_width_162, unk_waist_width_162).
0.90::acc(s1, waist_width_162).
measured(s1, waist_width_162, v25_6).
all_consistent(waist_width_162) :- consistent(s1, waist_width_162).
evidence(all_consistent(waist_width_162)).
query(true_val(waist_width_162, v25_6)).
query(true_val(waist_width_162, unk_waist_width_162)).

% @attr sidecut_radius_size_162
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size 162cm
% @values r12_8_8_1_12_8=12.8/8.1/12.8 unk_sidecut_radius_size_162=Unknown
% @importance 1.0

0.85::true_val(sidecut_radius_size_162, r12_8_8_1_12_8); 0.15::true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162).
0.90::acc(s1, sidecut_radius_size_162).
measured(s1, sidecut_radius_size_162, r12_8_8_1_12_8).
all_consistent(sidecut_radius_size_162) :- consistent(s1, sidecut_radius_size_162).
evidence(all_consistent(sidecut_radius_size_162)).
query(true_val(sidecut_radius_size_162, r12_8_8_1_12_8)).
query(true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162)).

% @attr recommended_weight_range_size_162
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size 162cm
% @values w70_plus=70plus_kg unk_recommended_weight_range_size_162=Unknown
% @importance 1.0

0.85::true_val(recommended_weight_range_size_162, w70_plus); 0.15::true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162).
0.90::acc(s1, recommended_weight_range_size_162).
measured(s1, recommended_weight_range_size_162, w70_plus).
all_consistent(recommended_weight_range_size_162) :- consistent(s1, recommended_weight_range_size_162).
evidence(all_consistent(recommended_weight_range_size_162)).
query(true_val(recommended_weight_range_size_162, w70_plus)).
query(true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162)).

% @attr waist_width_157w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 157W
% @values v26_4=26.4 unk_waist_width_157w=Unknown
% @importance 1.0

0.85::true_val(waist_width_157w, v26_4); 0.15::true_val(waist_width_157w, unk_waist_width_157w).
0.90::acc(s1, waist_width_157w).
measured(s1, waist_width_157w, v26_4).
all_consistent(waist_width_157w) :- consistent(s1, waist_width_157w).
evidence(all_consistent(waist_width_157w)).
query(true_val(waist_width_157w, v26_4)).
query(true_val(waist_width_157w, unk_waist_width_157w)).

% @attr recommended_weight_range_size_157w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size 157W
% @values w60_80=60-80kg unk_recommended_weight_range_size_157w=Unknown
% @importance 1.0

0.85::true_val(recommended_weight_range_size_157w, w60_80_157w); 0.15::true_val(recommended_weight_range_size_157w, unk_recommended_weight_range_size_157w).
0.90::acc(s1, recommended_weight_range_size_157w).
measured(s1, recommended_weight_range_size_157w, w60_80_157w).
all_consistent(recommended_weight_range_size_157w) :- consistent(s1, recommended_weight_range_size_157w).
evidence(all_consistent(recommended_weight_range_size_157w)).
query(true_val(recommended_weight_range_size_157w, w60_80_157w)).
query(true_val(recommended_weight_range_size_157w, unk_recommended_weight_range_size_157w)).

% @attr waist_width_159w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 159W
% @values v26_6=26.6 unk_waist_width_159w=Unknown
% @importance 1.0

0.85::true_val(waist_width_159w, v26_6); 0.15::true_val(waist_width_159w, unk_waist_width_159w).
0.90::acc(s1, waist_width_159w).
measured(s1, waist_width_159w, v26_6).
all_consistent(waist_width_159w) :- consistent(s1, waist_width_159w).
evidence(all_consistent(waist_width_159w)).
query(true_val(waist_width_159w, v26_6)).
query(true_val(waist_width_159w, unk_waist_width_159w)).

% @attr recommended_weight_range_size_159w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size 159W
% @values w65_85=65-85kg unk_recommended_weight_range_size_159w=Unknown
% @importance 1.0

0.85::true_val(recommended_weight_range_size_159w, w65_85_159w); 0.15::true_val(recommended_weight_range_size_159w, unk_recommended_weight_range_size_159w).
0.90::acc(s1, recommended_weight_range_size_159w).
measured(s1, recommended_weight_range_size_159w, w65_85_159w).
all_consistent(recommended_weight_range_size_159w) :- consistent(s1, recommended_weight_range_size_159w).
evidence(all_consistent(recommended_weight_range_size_159w)).
query(true_val(recommended_weight_range_size_159w, w65_85_159w)).
query(true_val(recommended_weight_range_size_159w, unk_recommended_weight_range_size_159w)).

% @attr waist_width_162w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 162W
% @values v27_0=27.0 unk_waist_width_162w=Unknown
% @importance 1.0

0.85::true_val(waist_width_162w, v27_0); 0.15::true_val(waist_width_162w, unk_waist_width_162w).
0.90::acc(s1, waist_width_162w).
measured(s1, waist_width_162w, v27_0).
all_consistent(waist_width_162w) :- consistent(s1, waist_width_162w).
evidence(all_consistent(waist_width_162w)).
query(true_val(waist_width_162w, v27_0)).
query(true_val(waist_width_162w, unk_waist_width_162w)).

% @attr recommended_weight_range_size_162w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size 162W
% @values w70_plus=70plus_kg unk_recommended_weight_range_size_162w=Unknown
% @importance 1.0

0.85::true_val(recommended_weight_range_size_162w, w70_plus_162w); 0.15::true_val(recommended_weight_range_size_162w, unk_recommended_weight_range_size_162w).
0.90::acc(s1, recommended_weight_range_size_162w).
measured(s1, recommended_weight_range_size_162w, w70_plus_162w).
all_consistent(recommended_weight_range_size_162w) :- consistent(s1, recommended_weight_range_size_162w).
evidence(all_consistent(recommended_weight_range_size_162w)).
query(true_val(recommended_weight_range_size_162w, w70_plus_162w)).
query(true_val(recommended_weight_range_size_162w, unk_recommended_weight_range_size_162w)).

% @attr contact_length_size_165w
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size 165W
% @values v124_0=124.0 unk_contact_length_size_165w=Unknown
% @importance 1.0

0.85::true_val(contact_length_size_165w, v124_0); 0.15::true_val(contact_length_size_165w, unk_contact_length_size_165w).
0.90::acc(s1, contact_length_size_165w).
measured(s1, contact_length_size_165w, v124_0).
all_consistent(contact_length_size_165w) :- consistent(s1, contact_length_size_165w).
evidence(all_consistent(contact_length_size_165w)).
query(true_val(contact_length_size_165w, v124_0)).
query(true_val(contact_length_size_165w, unk_contact_length_size_165w)).

% @attr waist_width_165w
% @type numeric
% @unit cm
% @canonical false
% @original_name waist_width_165
% @values v27_2=27.2 unk_waist_width_165w=Unknown
% @importance 1.0

0.85::true_val(waist_width_165w, v27_2); 0.15::true_val(waist_width_165w, unk_waist_width_165w).
0.90::acc(s1, waist_width_165w).
measured(s1, waist_width_165w, v27_2).
all_consistent(waist_width_165w) :- consistent(s1, waist_width_165w).
evidence(all_consistent(waist_width_165w)).
query(true_val(waist_width_165w, v27_2)).
query(true_val(waist_width_165w, unk_waist_width_165w)).

% @attr sidecut_radius_165w
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_165
% @values r12_4_8_8_12_4=12.4/8.8/12.4 unk_sidecut_radius_165w=Unknown
% @importance 1.0

0.85::true_val(sidecut_radius_165w, r12_4_8_8_12_4); 0.15::true_val(sidecut_radius_165w, unk_sidecut_radius_165w).
0.90::acc(s1, sidecut_radius_165w).
measured(s1, sidecut_radius_165w, r12_4_8_8_12_4).
all_consistent(sidecut_radius_165w) :- consistent(s1, sidecut_radius_165w).
evidence(all_consistent(sidecut_radius_165w)).
query(true_val(sidecut_radius_165w, r12_4_8_8_12_4)).
query(true_val(sidecut_radius_165w, unk_sidecut_radius_165w)).

% @attr recommended_weight_165w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_165
% @values w75_plus=75plus_kg unk_recommended_weight_165w=Unknown
% @importance 1.0

0.85::true_val(recommended_weight_165w, w75_plus); 0.15::true_val(recommended_weight_165w, unk_recommended_weight_165w).
0.90::acc(s1, recommended_weight_165w).
measured(s1, recommended_weight_165w, w75_plus).
all_consistent(recommended_weight_165w) :- consistent(s1, recommended_weight_165w).
evidence(all_consistent(recommended_weight_165w)).
query(true_val(recommended_weight_165w, w75_plus)).
query(true_val(recommended_weight_165w, unk_recommended_weight_165w)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values park_pipe_offpiste_am=Park_Halfpipe_Offpiste_All_Mountain unk_terrain_suitability=Unknown
% @importance 1.0

0.85::true_val(terrain_suitability, park_pipe_offpiste_am); 0.15::true_val(terrain_suitability, unk_terrain_suitability).
0.88::acc(s1, terrain_suitability).
measured(s1, terrain_suitability, park_pipe_offpiste_am).
all_consistent(terrain_suitability) :- consistent(s1, terrain_suitability).
evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, park_pipe_offpiste_am)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values intermediate=Intermediate advanced_expert=Advanced_Expert
% @importance 0.867

0.33::true_val(skill_level_recommendation, intermediate); 0.67::true_val(skill_level_recommendation, advanced_expert).
0.78::acc(s1, skill_level_recommendation).
0.82::acc(s33, skill_level_recommendation).
0.72::acc(s22, skill_level_recommendation).
measured(s1, skill_level_recommendation, intermediate).
measured(s33, skill_level_recommendation, advanced_expert).
measured(s22, skill_level_recommendation, advanced_expert).
all_consistent(skill_level_recommendation) :-
    consistent(s33, skill_level_recommendation),
    (indep(s22), consistent(s22, skill_level_recommendation) ; \+indep(s22)),
    (indep(s1), consistent(s1, skill_level_recommendation) ; \+indep(s1)).
evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, intermediate)).
query(true_val(skill_level_recommendation, advanced_expert)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values am_freestyle=All_mountain_freestyle_everyday_ripper unk_riding_style=Unknown
% @importance 0.55

0.77::true_val(riding_style, am_freestyle); 0.23::true_val(riding_style, unk_riding_style).
0.85::acc(s43, riding_style).
measured(s43, riding_style, am_freestyle).
all_consistent(riding_style) :-
    (indep(s43), consistent(s43, riding_style) ; \+indep(s43)).
evidence(all_consistent(riding_style)).
query(true_val(riding_style, am_freestyle)).
query(true_val(riding_style, unk_riding_style)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values solar_fsc_recycled=Solar_FSC_water_inks_recycled unk_sustainability_certification=Unknown
% @importance 0.775

0.95::true_val(sustainability_certification, solar_fsc_recycled); 0.05::true_val(sustainability_certification, unk_sustainability_certification).
0.88::acc(s1, sustainability_certification).
0.90::acc(s44, sustainability_certification).
measured(s1, sustainability_certification, solar_fsc_recycled).
measured(s44, sustainability_certification, solar_fsc_recycled).
all_consistent(sustainability_certification) :-
    consistent(s44, sustainability_certification),
    (indep(s1), consistent(s1, sustainability_certification) ; \+indep(s1)).
evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, solar_fsc_recycled)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr sustainability_co2
% @type numeric
% @unit kg_CO2
% @canonical false
% @original_name sustainability_certification CO2
% @values v32_2=32.2 unk_sustainability_co2=Unknown
% @importance 1.0

0.85::true_val(sustainability_co2, v32_2); 0.15::true_val(sustainability_co2, unk_sustainability_co2).
0.85::acc(s1, sustainability_co2).
measured(s1, sustainability_co2, v32_2).
all_consistent(sustainability_co2) :- consistent(s1, sustainability_co2).
evidence(all_consistent(sustainability_co2)).
query(true_val(sustainability_co2, v32_2)).
query(true_val(sustainability_co2, unk_sustainability_co2)).

% @attr factory_solar
% @type categorical
% @canonical false
% @original_name Factory solar power station
% @values kw700_solar=700KW_solar_on_factory_roof unk_factory_solar=Unknown
% @importance 0.4

0.77::true_val(factory_solar, kw700_solar); 0.23::true_val(factory_solar, unk_factory_solar).
0.85::acc(s45, factory_solar).
measured(s45, factory_solar, kw700_solar).
all_consistent(factory_solar) :- consistent(s45, factory_solar).
evidence(all_consistent(factory_solar)).
query(true_val(factory_solar, kw700_solar)).
query(true_val(factory_solar, unk_factory_solar)).

% @attr fair_labor_standards
% @type categorical
% @canonical false
% @original_name Fair labor standards
% @values confirmed=Safe_and_fair_labor_standards unk_fair_labor_standards=Unknown
% @importance 0.35

0.56::true_val(fair_labor_standards, confirmed); 0.44::true_val(fair_labor_standards, unk_fair_labor_standards).
0.68::acc(s46, fair_labor_standards).
measured(s46, fair_labor_standards, confirmed).
all_consistent(fair_labor_standards) :- consistent(s46, fair_labor_standards).
evidence(all_consistent(fair_labor_standards)).
query(true_val(fair_labor_standards, confirmed)).
query(true_val(fair_labor_standards, unk_fair_labor_standards)).

% @attr warranty_period_years
% @type numeric
% @unit years
% @canonical true
% @original_name warranty_period_years
% @values v2=2.0 unk_warranty_period_years=Unknown
% @importance 0.75

0.90::true_val(warranty_period_years, v2); 0.10::true_val(warranty_period_years, unk_warranty_period_years).
0.95::acc(s47, warranty_period_years).
measured(s47, warranty_period_years, v2).
all_consistent(warranty_period_years) :- consistent(s47, warranty_period_years).
evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v2)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name Warranty authorized dealers only
% @values authorized_only=Authorized_Nitro_dealers_only unk_warranty=Unknown
% @importance 0.7

0.90::true_val(warranty, authorized_only); 0.10::true_val(warranty, unk_warranty).
0.95::acc(s48, warranty).
measured(s48, warranty, authorized_only).
all_consistent(warranty) :- consistent(s48, warranty).
evidence(all_consistent(warranty)).
query(true_val(warranty, authorized_only)).
query(true_val(warranty, unk_warranty)).

% @attr warranty_exclusion
% @type categorical
% @canonical false
% @original_name Warranty exclusion
% @values ebay_excluded=eBay_and_non_authorized_not_covered unk_warranty_exclusion=Unknown
% @importance 0.65

0.90::true_val(warranty_exclusion, ebay_excluded); 0.10::true_val(warranty_exclusion, unk_warranty_exclusion).
0.95::acc(s49, warranty_exclusion).
measured(s49, warranty_exclusion, ebay_excluded).
all_consistent(warranty_exclusion) :- consistent(s49, warranty_exclusion).
evidence(all_consistent(warranty_exclusion)).
query(true_val(warranty_exclusion, ebay_excluded)).
query(true_val(warranty_exclusion, unk_warranty_exclusion)).

% @attr carving_rating_tgr
% @type categorical
% @canonical true
% @original_name carving_rating_tgr
% @values great=Great unk_carving_rating_tgr=Unknown
% @importance 0.85

0.68::true_val(carving_rating_tgr, great); 0.32::true_val(carving_rating_tgr, unk_carving_rating_tgr).
0.82::acc(s50, carving_rating_tgr).
measured(s50, carving_rating_tgr, great).
all_consistent(carving_rating_tgr) :- consistent(s50, carving_rating_tgr).
evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, great)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

% @attr speed_rating_tgr
% @type categorical
% @canonical true
% @original_name speed_rating_tgr
% @values great=Great unk_speed_rating_tgr=Unknown
% @importance 0.75

0.72::true_val(speed_rating_tgr, great); 0.28::true_val(speed_rating_tgr, unk_speed_rating_tgr).
0.82::acc(s51, speed_rating_tgr).
measured(s51, speed_rating_tgr, great).
all_consistent(speed_rating_tgr) :- consistent(s51, speed_rating_tgr).
evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, great)).
query(true_val(speed_rating_tgr, unk_speed_rating_tgr)).

% @attr powder_rating_tgr
% @type categorical
% @canonical true
% @original_name powder_rating_tgr
% @values poor=Poor unk_powder_rating_tgr=Unknown
% @importance 0.85

0.76::true_val(powder_rating_tgr, poor); 0.24::true_val(powder_rating_tgr, unk_powder_rating_tgr).
0.85::acc(s52, powder_rating_tgr).
measured(s52, powder_rating_tgr, poor).
all_consistent(powder_rating_tgr) :- consistent(s52, powder_rating_tgr).
evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, poor)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values switch_great=Switch_Great_doable_either_way unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.7

0.68::true_val(reviewer_opinion_the_good_ride, switch_great); 0.32::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).
0.82::acc(s53, reviewer_opinion_the_good_ride).
measured(s53, reviewer_opinion_the_good_ride, switch_great).
all_consistent(reviewer_opinion_the_good_ride) :- consistent(s53, reviewer_opinion_the_good_ride).
evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, switch_great)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr jumps_rating_tgr
% @type categorical
% @canonical true
% @original_name jumps_rating_tgr
% @values great=Great unk_jumps_rating_tgr=Unknown
% @importance 0.8

0.72::true_val(jumps_rating_tgr, great); 0.28::true_val(jumps_rating_tgr, unk_jumps_rating_tgr).
0.83::acc(s54, jumps_rating_tgr).
measured(s54, jumps_rating_tgr, great).
all_consistent(jumps_rating_tgr) :- consistent(s54, jumps_rating_tgr).
evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, great)).
query(true_val(jumps_rating_tgr, unk_jumps_rating_tgr)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values medium_snow=Medium_Snow unk_edge_hold=Unknown
% @importance 0.8

0.72::true_val(edge_hold, medium_snow); 0.28::true_val(edge_hold, unk_edge_hold).
0.83::acc(s55, edge_hold).
measured(s55, edge_hold, medium_snow).
all_consistent(edge_hold) :- consistent(s55, edge_hold).
evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, medium_snow)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr on_snow_feel_tgr
% @type categorical
% @canonical true
% @original_name on_snow_feel_tgr
% @values semi_locked_in=Semi_Locked_In unk_on_snow_feel_tgr=Unknown
% @importance 0.75

0.68::true_val(on_snow_feel_tgr, semi_locked_in); 0.32::true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr).
0.80::acc(s56, on_snow_feel_tgr).
measured(s56, on_snow_feel_tgr, semi_locked_in).
all_consistent(on_snow_feel_tgr) :- consistent(s56, on_snow_feel_tgr).
evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, semi_locked_in)).
query(true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr)).

% @attr reviewer_opinion_the_good_ride_summary
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride summary
% @values technical_old_school=Not_for_everyone_technical_old_school_rider unk_reviewer_opinion_the_good_ride_summary=Unknown
% @importance 0.8

0.72::true_val(reviewer_opinion_the_good_ride_summary, technical_old_school); 0.28::true_val(reviewer_opinion_the_good_ride_summary, unk_reviewer_opinion_the_good_ride_summary).
0.83::acc(s58, reviewer_opinion_the_good_ride_summary).
measured(s58, reviewer_opinion_the_good_ride_summary, technical_old_school).
all_consistent(reviewer_opinion_the_good_ride_summary) :- consistent(s58, reviewer_opinion_the_good_ride_summary).
evidence(all_consistent(reviewer_opinion_the_good_ride_summary)).
query(true_val(reviewer_opinion_the_good_ride_summary, technical_old_school)).
query(true_val(reviewer_opinion_the_good_ride_summary, unk_reviewer_opinion_the_good_ride_summary)).

% @attr snowboard_robot_overall
% @type categorical
% @canonical false
% @original_name Snowboard Robot overall review
% @values great_quiver_of_one=Great_board_one_board_to_ride_everywhere unk_snowboard_robot_overall=Unknown
% @importance 0.85

0.59::true_val(snowboard_robot_overall, great_quiver_of_one); 0.41::true_val(snowboard_robot_overall, unk_snowboard_robot_overall).
0.72::acc(s59, snowboard_robot_overall).
measured(s59, snowboard_robot_overall, great_quiver_of_one).
all_consistent(snowboard_robot_overall) :- consistent(s59, snowboard_robot_overall).
evidence(all_consistent(snowboard_robot_overall)).
query(true_val(snowboard_robot_overall, great_quiver_of_one)).
query(true_val(snowboard_robot_overall, unk_snowboard_robot_overall)).

% @attr snowboard_robot_custom_comparison
% @type categorical
% @canonical false
% @original_name Snowboard Robot Custom comparison
% @values similar_to_custom=Very_similar_feel_to_Burton_Custom_camber unk_snowboard_robot_custom_comparison=Unknown
% @importance 0.85

0.59::true_val(snowboard_robot_custom_comparison, similar_to_custom); 0.41::true_val(snowboard_robot_custom_comparison, unk_snowboard_robot_custom_comparison).
0.72::acc(s60, snowboard_robot_custom_comparison).
measured(s60, snowboard_robot_custom_comparison, similar_to_custom).
all_consistent(snowboard_robot_custom_comparison) :- consistent(s60, snowboard_robot_custom_comparison).
evidence(all_consistent(snowboard_robot_custom_comparison)).
query(true_val(snowboard_robot_custom_comparison, similar_to_custom)).
query(true_val(snowboard_robot_custom_comparison, unk_snowboard_robot_custom_comparison)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values smooth_strong_grip=Very_smooth_easy_strong_grip unk_turn_initiation_performance=Unknown
% @importance 0.8

0.59::true_val(turn_initiation_performance, smooth_strong_grip); 0.41::true_val(turn_initiation_performance, unk_turn_initiation_performance).
0.72::acc(s61, turn_initiation_performance).
measured(s61, turn_initiation_performance, smooth_strong_grip).
all_consistent(turn_initiation_performance) :- consistent(s61, turn_initiation_performance).
evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, smooth_strong_grip)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr snowboard_robot_waist_caution
% @type categorical
% @canonical false
% @original_name Snowboard Robot waist width caution
% @values narrow_waist_big_boot_issue=Narrow_waist_issue_for_bigger_boots unk_snowboard_robot_waist_caution=Unknown
% @importance 0.85

0.59::true_val(snowboard_robot_waist_caution, narrow_waist_big_boot_issue); 0.41::true_val(snowboard_robot_waist_caution, unk_snowboard_robot_waist_caution).
0.72::acc(s63, snowboard_robot_waist_caution).
measured(s63, snowboard_robot_waist_caution, narrow_waist_big_boot_issue).
all_consistent(snowboard_robot_waist_caution) :- consistent(s63, snowboard_robot_waist_caution).
evidence(all_consistent(snowboard_robot_waist_caution)).
query(true_val(snowboard_robot_waist_caution, narrow_waist_big_boot_issue)).
query(true_val(snowboard_robot_waist_caution, unk_snowboard_robot_waist_caution)).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name reviewer_opinion_snowboardingprofiles
% @values carves_well_good_speed=Carves_well_good_at_speed_not_too_aggressive unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.8

0.63::true_val(reviewer_opinion_snowboardingprofiles, carves_well_good_speed); 0.37::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).
0.78::acc(s64, reviewer_opinion_snowboardingprofiles).
measured(s64, reviewer_opinion_snowboardingprofiles, carves_well_good_speed).
all_consistent(reviewer_opinion_snowboardingprofiles) :- consistent(s64, reviewer_opinion_snowboardingprofiles).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, carves_well_good_speed)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

% @attr reviewer_opinion_snowboardingprofiles_overall
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles overall
% @values do_it_all_aggressive=Good_do_it_all_more_aggressive_side unk_reviewer_opinion_snowboardingprofiles_overall=Unknown
% @importance 0.75

0.63::true_val(reviewer_opinion_snowboardingprofiles_overall, do_it_all_aggressive); 0.37::true_val(reviewer_opinion_snowboardingprofiles_overall, unk_reviewer_opinion_snowboardingprofiles_overall).
0.78::acc(s65, reviewer_opinion_snowboardingprofiles_overall).
measured(s65, reviewer_opinion_snowboardingprofiles_overall, do_it_all_aggressive).
all_consistent(reviewer_opinion_snowboardingprofiles_overall) :- consistent(s65, reviewer_opinion_snowboardingprofiles_overall).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles_overall)).
query(true_val(reviewer_opinion_snowboardingprofiles_overall, do_it_all_aggressive)).
query(true_val(reviewer_opinion_snowboardingprofiles_overall, unk_reviewer_opinion_snowboardingprofiles_overall)).

% @attr reviewer_opinion_snowboardingprofiles_category
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles category
% @values aggressive_am=Aggressive_all_mountain_snowboard unk_reviewer_opinion_snowboardingprofiles_category=Unknown
% @importance 0.7

0.60::true_val(reviewer_opinion_snowboardingprofiles_category, aggressive_am); 0.40::true_val(reviewer_opinion_snowboardingprofiles_category, unk_reviewer_opinion_snowboardingprofiles_category).
0.75::acc(s66, reviewer_opinion_snowboardingprofiles_category).
measured(s66, reviewer_opinion_snowboardingprofiles_category, aggressive_am).
all_consistent(reviewer_opinion_snowboardingprofiles_category) :- consistent(s66, reviewer_opinion_snowboardingprofiles_category).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles_category)).
query(true_val(reviewer_opinion_snowboardingprofiles_category, aggressive_am)).
query(true_val(reviewer_opinion_snowboardingprofiles_category, unk_reviewer_opinion_snowboardingprofiles_category)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values responsive_grippy_playful=Responsive_grippy_playful_flex unk_reviewer_opinion_whitelines=Unknown
% @importance 0.65

0.60::true_val(reviewer_opinion_whitelines, responsive_grippy_playful); 0.40::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).
0.72::acc(s67, reviewer_opinion_whitelines).
measured(s67, reviewer_opinion_whitelines, responsive_grippy_playful).
all_consistent(reviewer_opinion_whitelines) :- consistent(s67, reviewer_opinion_whitelines).
evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, responsive_grippy_playful)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

% @attr reviewer_opinion_whitelines_camber
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines camber intro
% @values great_camber_intro=Great_board_for_rocker_to_camber_transition unk_reviewer_opinion_whitelines_camber=Unknown
% @importance 0.65

0.60::true_val(reviewer_opinion_whitelines_camber, great_camber_intro); 0.40::true_val(reviewer_opinion_whitelines_camber, unk_reviewer_opinion_whitelines_camber).
0.72::acc(s68, reviewer_opinion_whitelines_camber).
measured(s68, reviewer_opinion_whitelines_camber, great_camber_intro).
all_consistent(reviewer_opinion_whitelines_camber) :- consistent(s68, reviewer_opinion_whitelines_camber).
evidence(all_consistent(reviewer_opinion_whitelines_camber)).
query(true_val(reviewer_opinion_whitelines_camber, great_camber_intro)).
query(true_val(reviewer_opinion_whitelines_camber, unk_reviewer_opinion_whitelines_camber)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values great_midflex_camber=Great_midflex_camber_fun_carving_popping unk_user_review_forum=Unknown
% @importance 0.6

0.28::true_val(user_review_forum, great_midflex_camber); 0.72::true_val(user_review_forum, unk_user_review_forum).
0.50::acc(s69, user_review_forum).
measured(s69, user_review_forum, great_midflex_camber).
all_consistent(user_review_forum) :- consistent(s69, user_review_forum).
evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, great_midflex_camber)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr user_review_forum_sidecut
% @type categorical
% @canonical false
% @original_name user_review_forum sidecut comparison
% @values more_forgiving_than_custom=More_forgiving_turn_initiation_than_Custom unk_user_review_forum_sidecut=Unknown
% @importance 0.8

0.30::true_val(user_review_forum_sidecut, more_forgiving_than_custom); 0.70::true_val(user_review_forum_sidecut, unk_user_review_forum_sidecut).
0.52::acc(s70, user_review_forum_sidecut).
measured(s70, user_review_forum_sidecut, more_forgiving_than_custom).
all_consistent(user_review_forum_sidecut) :- consistent(s70, user_review_forum_sidecut).
evidence(all_consistent(user_review_forum_sidecut)).
query(true_val(user_review_forum_sidecut, more_forgiving_than_custom)).
query(true_val(user_review_forum_sidecut, unk_user_review_forum_sidecut)).

% @attr user_review_forum_soft
% @type categorical
% @canonical false
% @original_name user_review_forum soft flex opinion
% @values surprisingly_soft=Found_Team_surprisingly_soft unk_user_review_forum_soft=Unknown
% @importance 0.75

0.30::true_val(user_review_forum_soft, surprisingly_soft); 0.70::true_val(user_review_forum_soft, unk_user_review_forum_soft).
0.50::acc(s71, user_review_forum_soft).
measured(s71, user_review_forum_soft, surprisingly_soft).
all_consistent(user_review_forum_soft) :- consistent(s71, user_review_forum_soft).
evidence(all_consistent(user_review_forum_soft)).
query(true_val(user_review_forum_soft, surprisingly_soft)).
query(true_val(user_review_forum_soft, unk_user_review_forum_soft)).

% @attr user_review_forum_custom_compare
% @type categorical
% @canonical false
% @original_name user_review_forum Custom comparison
% @values very_similar_on_paper=Very_similar_to_Custom_on_paper unk_user_review_forum_custom_compare=Unknown
% @importance 0.75

0.28::true_val(user_review_forum_custom_compare, very_similar_on_paper); 0.72::true_val(user_review_forum_custom_compare, unk_user_review_forum_custom_compare).
0.50::acc(s72, user_review_forum_custom_compare).
measured(s72, user_review_forum_custom_compare, very_similar_on_paper).
all_consistent(user_review_forum_custom_compare) :- consistent(s72, user_review_forum_custom_compare).
evidence(all_consistent(user_review_forum_custom_compare)).
query(true_val(user_review_forum_custom_compare, very_similar_on_paper)).
query(true_val(user_review_forum_custom_compare, unk_user_review_forum_custom_compare)).

% @attr user_review_forum_choice
% @type categorical
% @canonical false
% @original_name user_review_forum purchase choice
% @values wider_no_channel_cheaper=Chose_Team_wider_no_channel_cheaper unk_user_review_forum_choice=Unknown
% @importance 0.75

0.28::true_val(user_review_forum_choice, wider_no_channel_cheaper); 0.72::true_val(user_review_forum_choice, unk_user_review_forum_choice).
0.50::acc(s73, user_review_forum_choice).
measured(s73, user_review_forum_choice, wider_no_channel_cheaper).
all_consistent(user_review_forum_choice) :- consistent(s73, user_review_forum_choice).
evidence(all_consistent(user_review_forum_choice)).
query(true_val(user_review_forum_choice, wider_no_channel_cheaper)).
query(true_val(user_review_forum_choice, unk_user_review_forum_choice)).

% @attr user_review_forum_catchy
% @type categorical
% @canonical false
% @original_name user_review_forum sidecut catchiness
% @values less_catchy_than_custom=Dual_degressive_less_catchy_than_Custom unk_user_review_forum_catchy=Unknown
% @importance 0.7

0.26::true_val(user_review_forum_catchy, less_catchy_than_custom); 0.74::true_val(user_review_forum_catchy, unk_user_review_forum_catchy).
0.48::acc(s74, user_review_forum_catchy).
measured(s74, user_review_forum_catchy, less_catchy_than_custom).
all_consistent(user_review_forum_catchy) :- consistent(s74, user_review_forum_catchy).
evidence(all_consistent(user_review_forum_catchy)).
query(true_val(user_review_forum_catchy, less_catchy_than_custom)).
query(true_val(user_review_forum_catchy, unk_user_review_forum_catchy)).

% @attr user_review_forum_top_pick
% @type categorical
% @canonical false
% @original_name user_review_forum top AM pick
% @values top_am_with_custom=Top_AM_list_with_Custom unk_user_review_forum_top_pick=Unknown
% @importance 0.75

0.30::true_val(user_review_forum_top_pick, top_am_with_custom); 0.70::true_val(user_review_forum_top_pick, unk_user_review_forum_top_pick).
0.52::acc(s75, user_review_forum_top_pick).
measured(s75, user_review_forum_top_pick, top_am_with_custom).
all_consistent(user_review_forum_top_pick) :- consistent(s75, user_review_forum_top_pick).
evidence(all_consistent(user_review_forum_top_pick)).
query(true_val(user_review_forum_top_pick, top_am_with_custom)).
query(true_val(user_review_forum_top_pick, unk_user_review_forum_top_pick)).

% @attr user_review_forum_sold
% @type categorical
% @canonical false
% @original_name user_review_forum negative sold Team Pro
% @values sold_for_others=Sold_Team_Pro_for_Bataleon_Ride unk_user_review_forum_sold=Unknown
% @importance 0.6

0.23::true_val(user_review_forum_sold, sold_for_others); 0.77::true_val(user_review_forum_sold, unk_user_review_forum_sold).
0.42::acc(s76, user_review_forum_sold).
measured(s76, user_review_forum_sold, sold_for_others).
all_consistent(user_review_forum_sold) :- consistent(s76, user_review_forum_sold).
evidence(all_consistent(user_review_forum_sold)).
query(true_val(user_review_forum_sold, sold_for_others)).
query(true_val(user_review_forum_sold, unk_user_review_forum_sold)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values custom_mercury_assassin_etc=Burton_Custom_CAPiTA_Mercury_Salomon_Assassin_K2_Broadcast_Yes_Standard_Jones_Mountain_Twin unk_comparable_board_cross_brand=Unknown
% @importance 0.85

0.36::true_val(comparable_board_cross_brand, custom_mercury_assassin_etc); 0.64::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).
0.55::acc(s77, comparable_board_cross_brand).
measured(s77, comparable_board_cross_brand, custom_mercury_assassin_etc).
all_consistent(comparable_board_cross_brand) :- consistent(s77, comparable_board_cross_brand).
evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, custom_mercury_assassin_etc)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_flex
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand flex comparison
% @values team_softer_custom_stiffer=Team_slightly_softer_Custom_stiffer_more_reactive unk_comparable_board_cross_brand_flex=Unknown
% @importance 0.8

0.30::true_val(comparable_board_cross_brand_flex, team_softer_custom_stiffer); 0.70::true_val(comparable_board_cross_brand_flex, unk_comparable_board_cross_brand_flex).
0.50::acc(s78, comparable_board_cross_brand_flex).
measured(s78, comparable_board_cross_brand_flex, team_softer_custom_stiffer).
all_consistent(comparable_board_cross_brand_flex) :- consistent(s78, comparable_board_cross_brand_flex).
evidence(all_consistent(comparable_board_cross_brand_flex)).
query(true_val(comparable_board_cross_brand_flex, team_softer_custom_stiffer)).
query(true_val(comparable_board_cross_brand_flex, unk_comparable_board_cross_brand_flex)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values team_pro=Team_Pro_carbon_tape_faster_base_flex_8 unk_comparable_board_same_brand=Unknown
% @importance 0.75

0.68::true_val(comparable_board_same_brand, team_pro); 0.32::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).
0.82::acc(s79, comparable_board_same_brand).
measured(s79, comparable_board_same_brand, team_pro).
all_consistent(comparable_board_same_brand) :- consistent(s79, comparable_board_same_brand).
evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, team_pro)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_price
% @type numeric
% @unit USD
% @canonical false
% @original_name comparable_board_same_brand Team Pro price
% @values v629_95=629.95 unk_comparable_board_same_brand_price=Unknown
% @importance 0.7

0.77::true_val(comparable_board_same_brand_price, v629_95); 0.23::true_val(comparable_board_same_brand_price, unk_comparable_board_same_brand_price).
0.88::acc(s80, comparable_board_same_brand_price).
measured(s80, comparable_board_same_brand_price, v629_95).
all_consistent(comparable_board_same_brand_price) :- consistent(s80, comparable_board_same_brand_price).
evidence(all_consistent(comparable_board_same_brand_price)).
query(true_val(comparable_board_same_brand_price, v629_95)).
query(true_val(comparable_board_same_brand_price, unk_comparable_board_same_brand_price)).

% @attr nitro_beast_context
% @type categorical
% @canonical false
% @original_name Nitro Beast stiffest in lineup
% @values beast_stiffest_8_10=Nitro_Beast_stiffest_rated_8_10 unk_nitro_beast_context=Unknown
% @importance 0.5

0.49::true_val(nitro_beast_context, beast_stiffest_8_10); 0.51::true_val(nitro_beast_context, unk_nitro_beast_context).
0.62::acc(s81, nitro_beast_context).
measured(s81, nitro_beast_context, beast_stiffest_8_10).
all_consistent(nitro_beast_context) :- consistent(s81, nitro_beast_context).
evidence(all_consistent(nitro_beast_context)).
query(true_val(nitro_beast_context, beast_stiffest_8_10)).
query(true_val(nitro_beast_context, unk_nitro_beast_context)).

% @attr comparable_board_same_brand_phase
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand Phase
% @values phase_459_95=Nitro_Phase_at_459_95 unk_comparable_board_same_brand_phase=Unknown
% @importance 0.55

0.68::true_val(comparable_board_same_brand_phase, phase_459_95); 0.32::true_val(comparable_board_same_brand_phase, unk_comparable_board_same_brand_phase).
0.82::acc(s82, comparable_board_same_brand_phase).
measured(s82, comparable_board_same_brand_phase, phase_459_95).
all_consistent(comparable_board_same_brand_phase) :- consistent(s82, comparable_board_same_brand_phase).
evidence(all_consistent(comparable_board_same_brand_phase)).
query(true_val(comparable_board_same_brand_phase, phase_459_95)).
query(true_val(comparable_board_same_brand_phase, unk_comparable_board_same_brand_phase)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values early_2000s=Over_20_years_since_early_2000s unk_model_first_available_year=Unknown
% @importance 0.5

0.86::true_val(model_first_available_year, early_2000s); 0.14::true_val(model_first_available_year, unk_model_first_available_year).
0.88::acc(s11, model_first_available_year).
measured(s11, model_first_available_year, early_2000s).
all_consistent(model_first_available_year) :- consistent(s11, model_first_available_year).
evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, early_2000s)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr team_gullwing_discontinued
% @type categorical
% @canonical false
% @original_name Team Gullwing variant discontinued
% @values discontinued_2023=Gullwing_discontinued_after_2023 unk_team_gullwing_discontinued=Unknown
% @importance 0.5

0.67::true_val(team_gullwing_discontinued, discontinued_2023); 0.33::true_val(team_gullwing_discontinued, unk_team_gullwing_discontinued).
0.78::acc(s83, team_gullwing_discontinued).
measured(s83, team_gullwing_discontinued, discontinued_2023).
all_consistent(team_gullwing_discontinued) :- consistent(s83, team_gullwing_discontinued).
evidence(all_consistent(team_gullwing_discontinued)).
query(true_val(team_gullwing_discontinued, discontinued_2023)).
query(true_val(team_gullwing_discontinued, unk_team_gullwing_discontinued)).

% @attr comparable_board_same_brand_pro
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand pro version
% @values team_pro_carbon=Team_Pro_carbon_reinforcement_faster_base unk_comparable_board_same_brand_pro=Unknown
% @importance 0.8

0.51::true_val(comparable_board_same_brand_pro, team_pro_carbon); 0.49::true_val(comparable_board_same_brand_pro, unk_comparable_board_same_brand_pro).
0.68::acc(s42, comparable_board_same_brand_pro).
measured(s42, comparable_board_same_brand_pro, team_pro_carbon).
all_consistent(comparable_board_same_brand_pro) :- consistent(s42, comparable_board_same_brand_pro).
evidence(all_consistent(comparable_board_same_brand_pro)).
query(true_val(comparable_board_same_brand_pro, team_pro_carbon)).
query(true_val(comparable_board_same_brand_pro, unk_comparable_board_same_brand_pro)).

% @attr comparable_board_same_brand_youth
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand youth
% @values future_team=Future_Team_youth_version unk_comparable_board_same_brand_youth=Unknown
% @importance 0.35

0.72::true_val(comparable_board_same_brand_youth, future_team); 0.28::true_val(comparable_board_same_brand_youth, unk_comparable_board_same_brand_youth).
0.82::acc(s84, comparable_board_same_brand_youth).
measured(s84, comparable_board_same_brand_youth, future_team).
all_consistent(comparable_board_same_brand_youth) :- consistent(s84, comparable_board_same_brand_youth).
evidence(all_consistent(comparable_board_same_brand_youth)).
query(true_val(comparable_board_same_brand_youth, future_team)).
query(true_val(comparable_board_same_brand_youth, unk_comparable_board_same_brand_youth)).

% @attr comparable_board_same_brand_signature
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand signature edition
% @values team_pro_kleveland_649_95=Team_Pro_x_Kleveland_649_95 unk_comparable_board_same_brand_signature=Unknown
% @importance 0.5

0.77::true_val(comparable_board_same_brand_signature, team_pro_kleveland_649_95); 0.23::true_val(comparable_board_same_brand_signature, unk_comparable_board_same_brand_signature).
0.85::acc(s85, comparable_board_same_brand_signature).
measured(s85, comparable_board_same_brand_signature, team_pro_kleveland_649_95).
all_consistent(comparable_board_same_brand_signature) :- consistent(s85, comparable_board_same_brand_signature).
evidence(all_consistent(comparable_board_same_brand_signature)).
query(true_val(comparable_board_same_brand_signature, team_pro_kleveland_649_95)).
query(true_val(comparable_board_same_brand_signature, unk_comparable_board_same_brand_signature)).

% @attr nose_design
% @type categorical
% @canonical false
% @original_name Nose design
% @values semi_blunted_tips=Semi_blunted_tips_longer_nose unk_nose_design=Unknown
% @importance 0.55

0.77::true_val(nose_design, semi_blunted_tips); 0.23::true_val(nose_design, unk_nose_design).
0.85::acc(s43, nose_design).
measured(s43, nose_design, semi_blunted_tips).
all_consistent(nose_design) :-
    (indep(s43), consistent(s43, nose_design) ; \+indep(s43)).
evidence(all_consistent(nose_design)).
query(true_val(nose_design, semi_blunted_tips)).
query(true_val(nose_design, unk_nose_design)).

% @attr board_weight_grams
% @type categorical
% @canonical true
% @original_name board_weight_grams
% @values feels_normal=Feels_normal_average unk_board_weight_grams=Unknown
% @importance 0.5

0.68::true_val(board_weight_grams, feels_normal); 0.32::true_val(board_weight_grams, unk_board_weight_grams).
0.80::acc(s86, board_weight_grams).
measured(s86, board_weight_grams, feels_normal).
all_consistent(board_weight_grams) :- consistent(s86, board_weight_grams).
evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, feels_normal)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr board_profile_description
% @type categorical
% @canonical false
% @original_name Board profile description
% @values dtwin_look_feel_versatility=Directional_Twin_true_twin_feel_directional_versatility unk_board_profile_description=Unknown
% @importance 0.75

0.90::true_val(board_profile_description, dtwin_look_feel_versatility); 0.10::true_val(board_profile_description, unk_board_profile_description).
0.95::acc(s87, board_profile_description).
measured(s87, board_profile_description, dtwin_look_feel_versatility).
all_consistent(board_profile_description) :- consistent(s87, board_profile_description).
evidence(all_consistent(board_profile_description)).
query(true_val(board_profile_description, dtwin_look_feel_versatility)).
query(true_val(board_profile_description, unk_board_profile_description)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values do_it_all_recommended=Frequently_recommended_do_it_all_board unk_positive_aspect=Unknown
% @importance 0.825

0.95::true_val(positive_aspect, do_it_all_recommended); 0.05::true_val(positive_aspect, unk_positive_aspect).
0.78::acc(s59, positive_aspect).
0.80::acc(s64, positive_aspect).
measured(s59, positive_aspect, do_it_all_recommended).
measured(s64, positive_aspect, do_it_all_recommended).
all_consistent(positive_aspect) :- consistent(s59, positive_aspect), consistent(s64, positive_aspect).
evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, do_it_all_recommended)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values poor_powder_minimal_setback=Full_camber_minimal_setback_limits_powder_float unk_negative_aspect=Unknown
% @importance 0.825

0.95::true_val(negative_aspect, poor_powder_minimal_setback); 0.05::true_val(negative_aspect, unk_negative_aspect).
0.85::acc(s52, negative_aspect).
0.80::acc(s88, negative_aspect).
measured(s52, negative_aspect, poor_powder_minimal_setback).
measured(s88, negative_aspect, poor_powder_minimal_setback).
all_consistent(negative_aspect) :- consistent(s52, negative_aspect), consistent(s88, negative_aspect).
evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, poor_powder_minimal_setback)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_boot_size
% @type categorical
% @canonical false
% @original_name negative_aspect boot size
% @values narrow_waist_us10_plus=Potential_issue_boot_US10_plus unk_negative_aspect_boot_size=Unknown
% @importance 0.85

0.59::true_val(negative_aspect_boot_size, narrow_waist_us10_plus); 0.41::true_val(negative_aspect_boot_size, unk_negative_aspect_boot_size).
0.72::acc(s63, negative_aspect_boot_size).
measured(s63, negative_aspect_boot_size, narrow_waist_us10_plus).
all_consistent(negative_aspect_boot_size) :- consistent(s63, negative_aspect_boot_size).
evidence(all_consistent(negative_aspect_boot_size)).
query(true_val(negative_aspect_boot_size, narrow_waist_us10_plus)).
query(true_val(negative_aspect_boot_size, unk_negative_aspect_boot_size)).

% @attr positive_aspect_price
% @type categorical
% @canonical false
% @original_name positive_aspect price advantage
% @values cheaper_than_custom=Generally_50_100_lower_than_Burton_Custom unk_positive_aspect_price=Unknown
% @importance 0.75

0.95::true_val(positive_aspect_price, cheaper_than_custom); 0.05::true_val(positive_aspect_price, unk_positive_aspect_price).
0.45::acc(s27, positive_aspect_price).
0.50::acc(s73, positive_aspect_price).
measured(s27, positive_aspect_price, cheaper_than_custom).
measured(s73, positive_aspect_price, cheaper_than_custom).
all_consistent(positive_aspect_price) :- consistent(s27, positive_aspect_price), consistent(s73, positive_aspect_price).
evidence(all_consistent(positive_aspect_price)).
query(true_val(positive_aspect_price, cheaper_than_custom)).
query(true_val(positive_aspect_price, unk_positive_aspect_price)).

% @attr negative_aspect_resale
% @type categorical
% @canonical false
% @original_name negative_aspect resale value
% @values lower_resale_than_burton=Lower_resale_Burton_holds_value unk_negative_aspect_resale=Unknown
% @importance 0.5

0.21::true_val(negative_aspect_resale, lower_resale_than_burton); 0.79::true_val(negative_aspect_resale, unk_negative_aspect_resale).
0.40::acc(s89, negative_aspect_resale).
measured(s89, negative_aspect_resale, lower_resale_than_burton).
all_consistent(negative_aspect_resale) :- consistent(s89, negative_aspect_resale).
evidence(all_consistent(negative_aspect_resale)).
query(true_val(negative_aspect_resale, lower_resale_than_burton)).
query(true_val(negative_aspect_resale, unk_negative_aspect_resale)).