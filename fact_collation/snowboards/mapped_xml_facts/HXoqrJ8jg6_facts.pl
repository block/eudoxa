0.15::indep(sm).
0.15::indep(s5).
0.15::indep(s15).
0.15::indep(s20).
0.15::indep(s21).
0.20::indep(s22).
0.15::indep(s23).
0.15::indep(s24).
0.15::indep(s26).
0.15::indep(s27).
0.25::indep(s28).
0.20::indep(s29).
0.15::indep(s31).
0.20::indep(s32).
0.25::indep(s33).
0.25::indep(s34).
0.15::indep(s35).
0.25::indep(s37).
0.20::indep(s40).
0.20::indep(s51).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values never_summer=Never_Summer unk_brand=Unknown
% @importance 1.0

0.93::acc(s1, brand).

0.95::true_val(brand, never_summer); 0.05::true_val(brand, unk_brand).

measured(s1, brand, never_summer).

all_consistent(brand) :- consistent(s1, brand).

evidence(all_consistent(brand)).
query(true_val(brand, never_summer)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values mens_proto_t3_fr=Mens_Proto_T3_FR unk_model_name=Unknown
% @importance 1.0

0.93::acc(s1, model_name).

0.95::true_val(model_name, mens_proto_t3_fr); 0.05::true_val(model_name, unk_model_name).

measured(s1, model_name, mens_proto_t3_fr).

all_consistent(model_name) :- consistent(s1, model_name).

evidence(all_consistent(model_name)).
query(true_val(model_name, mens_proto_t3_fr)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2027=2027 unk_model_year=Unknown
% @importance 1.0

0.95::acc(s2, model_year).

0.95::true_val(model_year, y2027); 0.05::true_val(model_year, unk_model_year).

measured(s2, model_year, y2027).

all_consistent(model_year) :- consistent(s2, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2027)).
query(true_val(model_year, unk_model_year)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.93::acc(s1, product_type).

0.95::true_val(product_type, snowboard); 0.05::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).

all_consistent(product_type) :- consistent(s1, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values ns_denver_co=Never_Summer_Industries_Denver_Colorado unk_manufacturer=Unknown
% @importance 0.7

0.72::acc(s3, manufacturer).

0.71::true_val(manufacturer, ns_denver_co); 0.29::true_val(manufacturer, unk_manufacturer).

measured(s3, manufacturer, ns_denver_co).

all_consistent(manufacturer) :- consistent(s3, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, ns_denver_co)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr founded
% @type categorical
% @canonical false
% @original_name Founded
% @values y1991_canaday=1991_by_Tim_and_Tracey_Canaday unk_founded=Unknown
% @importance 0.5

0.72::acc(s4, founded).

0.71::true_val(founded, y1991_canaday); 0.29::true_val(founded, unk_founded).

measured(s4, founded, y1991_canaday).

all_consistent(founded) :- consistent(s4, founded).

evidence(all_consistent(founded)).
query(true_val(founded, y1991_canaday)).
query(true_val(founded, unk_founded)).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values denver_co_usa=Handcrafted_Denver_Colorado_USA unk_manufacturing_location=Unknown
% @importance 0.65

0.65::acc(s5, manufacturing_location).

0.63::true_val(manufacturing_location, denver_co_usa); 0.37::true_val(manufacturing_location, unk_manufacturing_location).

measured(s5, manufacturing_location, denver_co_usa).

all_consistent(manufacturing_location) :- consistent(s5, manufacturing_location).

evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, denver_co_usa)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

% @attr company_description
% @type categorical
% @canonical false
% @original_name Company description
% @values last_large_indie_usa=Last_larger_independently_owned_US_factory_family_owned unk_company_description=Unknown
% @importance 0.6

0.85::acc(s6, company_description).

0.81::true_val(company_description, last_large_indie_usa); 0.19::true_val(company_description, unk_company_description).

measured(s6, company_description, last_large_indie_usa).

all_consistent(company_description) :- consistent(s6, company_description).

evidence(all_consistent(company_description)).
query(true_val(company_description, last_large_indie_usa)).
query(true_val(company_description, unk_company_description)).

% @attr company_employees
% @type categorical
% @canonical false
% @original_name Company employees
% @values approx_70_factory_20_office=Approx_70_factory_20_office unk_company_employees=Unknown
% @importance 0.3

0.90::acc(s7, company_employees).

0.86::true_val(company_employees, approx_70_factory_20_office); 0.14::true_val(company_employees, unk_company_employees).

measured(s7, company_employees, approx_70_factory_20_office).

all_consistent(company_employees) :- consistent(s7, company_employees).

evidence(all_consistent(company_employees)).
query(true_val(company_employees, approx_70_factory_20_office)).
query(true_val(company_employees, unk_company_employees)).

% @attr annual_revenue
% @type categorical
% @canonical false
% @original_name Annual revenue
% @values v13m=13M v15_9m=15.9M unk_annual_revenue=Unknown
% @importance 0.275

0.70::acc(s8, annual_revenue).
0.45::acc(s9, annual_revenue).

0.50::true_val(annual_revenue, v13m); 0.35::true_val(annual_revenue, v15_9m); 0.15::true_val(annual_revenue, unk_annual_revenue).

measured(s8, annual_revenue, v13m).
measured(s9, annual_revenue, v15_9m).

all_consistent(annual_revenue) :-
    consistent(s8, annual_revenue),
    consistent(s9, annual_revenue).

evidence(all_consistent(annual_revenue)).
query(true_val(annual_revenue, v13m)).
query(true_val(annual_revenue, v15_9m)).
query(true_val(annual_revenue, unk_annual_revenue)).

% @attr factory_tours
% @type categorical
% @canonical false
% @original_name Factory tours
% @values free_3838_eudora=Free_at_3838_Eudora_Way_Denver unk_factory_tours=Unknown
% @importance 0.2

0.65::acc(s10, factory_tours).

0.63::true_val(factory_tours, free_3838_eudora); 0.37::true_val(factory_tours, unk_factory_tours).

measured(s10, factory_tours, free_3838_eudora).

all_consistent(factory_tours) :- consistent(s10, factory_tours).

evidence(all_consistent(factory_tours)).
query(true_val(factory_tours, free_3838_eudora)).
query(true_val(factory_tours, unk_factory_tours)).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values proto_fr_2021=Proto_FR_original_Triple_Camber_2021_22 unk_predecessor_model_name=Unknown
% @importance 0.7

0.90::acc(s11, predecessor_model_name).

0.86::true_val(predecessor_model_name, proto_fr_2021); 0.14::true_val(predecessor_model_name, unk_predecessor_model_name).

measured(s11, predecessor_model_name, proto_fr_2021).

all_consistent(predecessor_model_name) :- consistent(s11, predecessor_model_name).

evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, proto_fr_2021)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2026=T3_designation_and_PSCM_introduced_2026 unk_model_first_available_year=Unknown
% @importance 0.75

0.75::acc(s12, model_first_available_year).

0.68::true_val(model_first_available_year, season_2026); 0.32::true_val(model_first_available_year, unk_model_first_available_year).

measured(s12, model_first_available_year, season_2026).

all_consistent(model_first_available_year) :-
    (indep(s12), consistent(s12, model_first_available_year) ; \+indep(s12)).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2026)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr model_2027_vs_2026
% @type categorical
% @canonical false
% @original_name 2027 model vs 2026
% @values same_as_2026=Same_as_2026_per_reviewer unk_model_2027_vs_2026=Unknown
% @importance 0.8

0.65::acc(s13, model_2027_vs_2026).

0.44::true_val(model_2027_vs_2026, same_as_2026); 0.56::true_val(model_2027_vs_2026, unk_model_2027_vs_2026).

measured(s13, model_2027_vs_2026, same_as_2026).

all_consistent(model_2027_vs_2026) :- consistent(s13, model_2027_vs_2026).

evidence(all_consistent(model_2027_vs_2026)).
query(true_val(model_2027_vs_2026, same_as_2026)).
query(true_val(model_2027_vs_2026, unk_model_2027_vs_2026)).

% @attr predecessor_lineage
% @type categorical
% @canonical false
% @original_name Predecessor to Proto FR lineage
% @values best_selling=Proto_FR_was_NS_best_selling_model unk_predecessor_lineage=Unknown
% @importance 0.6

0.85::acc(s14, predecessor_lineage).

0.81::true_val(predecessor_lineage, best_selling); 0.19::true_val(predecessor_lineage, unk_predecessor_lineage).

measured(s14, predecessor_lineage, best_selling).

all_consistent(predecessor_lineage) :- consistent(s14, predecessor_lineage).

evidence(all_consistent(predecessor_lineage)).
query(true_val(predecessor_lineage, best_selling)).
query(true_val(predecessor_lineage, unk_predecessor_lineage)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mtn_freeride=All_Mountain_Freeride unk_board_category=Unknown
% @importance 0.9

0.70::acc(s15, board_category).

0.95::true_val(board_category, all_mtn_freeride); 0.05::true_val(board_category, unk_board_category).

measured(s15, board_category, all_mtn_freeride).

all_consistent(board_category) :-
    (indep(s15), consistent(s15, board_category) ; \+indep(s15)).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mtn_freeride)).
query(true_val(board_category, unk_board_category)).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v709_99=709.99 unk_price_usd_msrp=Unknown
% @importance 0.975

0.95::acc(s2, price_usd_msrp).
0.95::acc(s16, price_usd_msrp).

0.97::true_val(price_usd_msrp, v709_99); 0.03::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s2, price_usd_msrp, v709_99).
measured(s16, price_usd_msrp, v709_99).

all_consistent(price_usd_msrp) :-
    consistent(s2, price_usd_msrp),
    consistent(s16, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v709_99)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_usd_msrp_sale_2026
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_msrp (sale 2026)
% @values v567_99=567.99 unk_price_usd_msrp_sale_2026=Unknown
% @importance 0.95

0.95::acc(s16, price_usd_msrp_sale_2026).

0.90::true_val(price_usd_msrp_sale_2026, v567_99); 0.10::true_val(price_usd_msrp_sale_2026, unk_price_usd_msrp_sale_2026).

measured(s16, price_usd_msrp_sale_2026, v567_99).

all_consistent(price_usd_msrp_sale_2026) :- consistent(s16, price_usd_msrp_sale_2026).

evidence(all_consistent(price_usd_msrp_sale_2026)).
query(true_val(price_usd_msrp_sale_2026, v567_99)).
query(true_val(price_usd_msrp_sale_2026, unk_price_usd_msrp_sale_2026)).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical false
% @original_name price_aud_merchant
% @values v1049_99=1049.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.93::acc(sm, price_aud_merchant).

0.95::true_val(price_aud_merchant, v1049_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(sm, price_aud_merchant, v1049_99).

all_consistent(price_aud_merchant) :- consistent(sm, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v1049_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_usd_tactics
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_tactics
% @values v496_99=496.99 unk_price_usd_tactics=Unknown
% @importance 0.9

0.80::acc(s17, price_usd_tactics).

0.72::true_val(price_usd_tactics, v496_99); 0.28::true_val(price_usd_tactics, unk_price_usd_tactics).

measured(s17, price_usd_tactics, v496_99).

all_consistent(price_usd_tactics) :- consistent(s17, price_usd_tactics).

evidence(all_consistent(price_usd_tactics)).
query(true_val(price_usd_tactics, v496_99)).
query(true_val(price_usd_tactics, unk_price_usd_tactics)).

% @attr price_usd_backcountry
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_backcountry
% @values v519_99=519.99 unk_price_usd_backcountry=Unknown
% @importance 0.9

0.75::acc(s18, price_usd_backcountry).

0.64::true_val(price_usd_backcountry, v519_99); 0.36::true_val(price_usd_backcountry, unk_price_usd_backcountry).

measured(s18, price_usd_backcountry, v519_99).

all_consistent(price_usd_backcountry) :- consistent(s18, price_usd_backcountry).

evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v519_99)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

% @attr price_christy_sports
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at Christy Sports (2026 model)
% @values v567_99=567.99 unk_price_christy_sports=Unknown
% @importance 0.9

0.75::acc(s19, price_christy_sports).

0.64::true_val(price_christy_sports, v567_99); 0.36::true_val(price_christy_sports, unk_price_christy_sports).

measured(s19, price_christy_sports, v567_99).

all_consistent(price_christy_sports) :- consistent(s19, price_christy_sports).

evidence(all_consistent(price_christy_sports)).
query(true_val(price_christy_sports, v567_99)).
query(true_val(price_christy_sports, unk_price_christy_sports)).

% @attr price_snowinn
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at Snowinn/Tradeinn (2026 model)
% @values v683_49=683.49 unk_price_snowinn=Unknown
% @importance 0.85

0.62::acc(s20, price_snowinn).

0.59::true_val(price_snowinn, v683_49); 0.41::true_val(price_snowinn, unk_price_snowinn).

measured(s20, price_snowinn, v683_49).

all_consistent(price_snowinn) :- consistent(s20, price_snowinn).

evidence(all_consistent(price_snowinn)).
query(true_val(price_snowinn, v683_49)).
query(true_val(price_snowinn, unk_price_snowinn)).

% @attr price_sun_ski
% @type categorical
% @canonical false
% @original_name Price at Sun & Ski Sports (2026 model)
% @values standard_retail=Available_at_standard_retail unk_price_sun_ski=Unknown
% @importance 0.9

0.78::acc(s21, price_sun_ski).

0.76::true_val(price_sun_ski, standard_retail); 0.24::true_val(price_sun_ski, unk_price_sun_ski).

measured(s21, price_sun_ski, standard_retail).

all_consistent(price_sun_ski) :-
    (indep(s21), consistent(s21, price_sun_ski) ; \+indep(s21)).

evidence(all_consistent(price_sun_ski)).
query(true_val(price_sun_ski, standard_retail)).
query(true_val(price_sun_ski, unk_price_sun_ski)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values preorder=Preorder unk_availability_status=Unknown
% @importance 0.85

0.93::acc(sm, availability_status).

0.95::true_val(availability_status, preorder); 0.05::true_val(availability_status, unk_availability_status).

measured(sm, availability_status, preorder).

all_consistent(availability_status) :- consistent(sm, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, preorder)).
query(true_val(availability_status, unk_availability_status)).

% @attr estimated_availability_date
% @type categorical
% @canonical false
% @original_name estimated_availability_date
% @values jun_1_2026=June_1_2026 unk_estimated_availability_date=Unknown
% @importance 0.85

0.93::acc(sm, estimated_availability_date).

0.95::true_val(estimated_availability_date, jun_1_2026); 0.05::true_val(estimated_availability_date, unk_estimated_availability_date).

measured(sm, estimated_availability_date, jun_1_2026).

all_consistent(estimated_availability_date) :- consistent(sm, estimated_availability_date).

evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, jun_1_2026)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status (evo)
% @values out_of_stock=Out_of_stock unk_availability_status_evo=Unknown
% @importance 0.8

0.83::acc(s22, availability_status_evo).

0.81::true_val(availability_status_evo, out_of_stock); 0.19::true_val(availability_status_evo, unk_availability_status_evo).

measured(s22, availability_status_evo, out_of_stock).

all_consistent(availability_status_evo) :- consistent(s22, availability_status_evo).

evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, out_of_stock)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

% @attr availability_status_buzzs
% @type categorical
% @canonical false
% @original_name availability_status (Buzzs 156cm)
% @values backordered_156=156cm_backordered unk_availability_status_buzzs=Unknown
% @importance 0.7

0.58::acc(s23, availability_status_buzzs).

0.54::true_val(availability_status_buzzs, backordered_156); 0.46::true_val(availability_status_buzzs, unk_availability_status_buzzs).

measured(s23, availability_status_buzzs, backordered_156).

all_consistent(availability_status_buzzs) :- consistent(s23, availability_status_buzzs).

evidence(all_consistent(availability_status_buzzs)).
query(true_val(availability_status_buzzs, backordered_156)).
query(true_val(availability_status_buzzs, unk_availability_status_buzzs)).

% @attr availability_status_salty_peaks
% @type categorical
% @canonical false
% @original_name availability_status (Salty Peaks)
% @values available=Available unk_availability_status_salty_peaks=Unknown
% @importance 0.7

0.55::acc(s24, availability_status_salty_peaks).

0.52::true_val(availability_status_salty_peaks, available); 0.48::true_val(availability_status_salty_peaks, unk_availability_status_salty_peaks).

measured(s24, availability_status_salty_peaks, available).

all_consistent(availability_status_salty_peaks) :- consistent(s24, availability_status_salty_peaks).

evidence(all_consistent(availability_status_salty_peaks)).
query(true_val(availability_status_salty_peaks, available)).
query(true_val(availability_status_salty_peaks, unk_availability_status_salty_peaks)).

% @attr authorized_retailers
% @type categorical
% @canonical false
% @original_name Authorized retailers include
% @values multi_retailers=evo_Blauer_PeterGlenn_Amazon_Tactics_Backcountry_Christy_SunSki_SaltyPeaks unk_authorized_retailers=Unknown
% @importance 0.767

0.60::acc(s25, authorized_retailers).
0.78::acc(s17, authorized_retailers).
0.75::acc(s18, authorized_retailers).

0.95::true_val(authorized_retailers, multi_retailers); 0.05::true_val(authorized_retailers, unk_authorized_retailers).

measured(s25, authorized_retailers, multi_retailers).
measured(s17, authorized_retailers, multi_retailers).
measured(s18, authorized_retailers, multi_retailers).

all_consistent(authorized_retailers) :-
    consistent(s25, authorized_retailers),
    consistent(s17, authorized_retailers),
    consistent(s18, authorized_retailers).

evidence(all_consistent(authorized_retailers)).
query(true_val(authorized_retailers, multi_retailers)).
query(true_val(authorized_retailers, unk_authorized_retailers)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values sizes_8=152_156_160_157W_161W_165W_162DF_166DF sizes_up_to_170x=Standard_Wide_DF_up_to_170X unk_available_sizes=Unknown
% @importance 0.85

0.93::acc(sm, available_sizes).
0.68::acc(s26, available_sizes).

0.60::true_val(available_sizes, sizes_8); 0.35::true_val(available_sizes, sizes_up_to_170x); 0.05::true_val(available_sizes, unk_available_sizes).

measured(sm, available_sizes, sizes_8).
measured(s26, available_sizes, sizes_up_to_170x).

all_consistent(available_sizes) :-
    consistent(sm, available_sizes),
    (indep(s26), consistent(s26, available_sizes) ; \+indep(s26)).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, sizes_8)).
query(true_val(available_sizes, sizes_up_to_170x)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 0.9

0.70::acc(s15, shape).

0.95::true_val(shape, tapered_directional); 0.05::true_val(shape, unk_shape).

measured(s15, shape, tapered_directional).

all_consistent(shape) :-
    (indep(s15), consistent(s15, shape) ; \+indep(s15)).

evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

% @attr taper
% @type numeric
% @unit mm
% @canonical true
% @original_name taper
% @values v5=5.0 unk_taper=Unknown
% @importance 0.825

0.93::acc(sm, taper).
0.62::acc(s27, taper).

0.97::true_val(taper, v5); 0.03::true_val(taper, unk_taper).

measured(sm, taper, v5).
measured(s27, taper, v5).

all_consistent(taper) :-
    consistent(sm, taper),
    (indep(s27), consistent(s27, taper) ; \+indep(s27)).

evidence(all_consistent(taper)).
query(true_val(taper, v5)).
query(true_val(taper, unk_taper)).

% @attr setback
% @type numeric
% @unit mm
% @canonical true
% @original_name setback
% @values v_neg19=neg19 unk_setback=Unknown
% @importance 0.85

0.93::acc(sm, setback).

0.95::true_val(setback, v_neg19); 0.05::true_val(setback, unk_setback).

measured(sm, setback, v_neg19).

all_consistent(setback) :- consistent(sm, setback).

evidence(all_consistent(setback)).
query(true_val(setback, v_neg19)).
query(true_val(setback, unk_setback)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values triple_camber_hybrid=Triple_Camber_Hybrid_Fusion unk_camber_type=Unknown
% @importance 0.95

0.82::acc(s28, camber_type).

0.95::true_val(camber_type, triple_camber_hybrid); 0.05::true_val(camber_type, unk_camber_type).

measured(s28, camber_type, triple_camber_hybrid).

all_consistent(camber_type) :-
    (indep(s28), consistent(s28, camber_type) ; \+indep(s28)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, triple_camber_hybrid)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical false
% @original_name camber_description
% @values central_plus_tip_tail=Central_camber_plus_tip_tail_camber_with_rocker unk_camber_description=Unknown
% @importance 0.95

0.82::acc(s28, camber_description).

0.78::true_val(camber_description, central_plus_tip_tail); 0.22::true_val(camber_description, unk_camber_description).

measured(s28, camber_description, central_plus_tip_tail).

all_consistent(camber_description) :-
    (indep(s28), consistent(s28, camber_description) ; \+indep(s28)).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, central_plus_tip_tail)).
query(true_val(camber_description, unk_camber_description)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values rip_edge_hold=RIP_Edge_Hold_Technology unk_edge_technology=Unknown
% @importance 0.875

0.93::acc(sm, edge_technology).
0.78::acc(s29, edge_technology).

0.97::true_val(edge_technology, rip_edge_hold); 0.03::true_val(edge_technology, unk_edge_technology).

measured(sm, edge_technology, rip_edge_hold).
measured(s29, edge_technology, rip_edge_hold).

all_consistent(edge_technology) :-
    consistent(sm, edge_technology),
    (indep(s29), consistent(s29, edge_technology) ; \+indep(s29)).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, rip_edge_hold)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values vario_power_grip=Vario_Power_Grip_Sidecut_multi_radii unk_sidecut_type=Unknown
% @importance 0.85

0.88::acc(s30, sidecut_type).

0.77::true_val(sidecut_type, vario_power_grip); 0.23::true_val(sidecut_type, unk_sidecut_type).

measured(s30, sidecut_type, vario_power_grip).

all_consistent(sidecut_type) :- consistent(s30, sidecut_type).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, vario_power_grip)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v7=7.0 unk_flex_rating_10=Unknown
% @importance 0.9

0.93::acc(sm, flex_rating_10).
0.70::acc(s15, flex_rating_10).
0.78::acc(s21, flex_rating_10).

0.97::true_val(flex_rating_10, v7); 0.03::true_val(flex_rating_10, unk_flex_rating_10).

measured(sm, flex_rating_10, v7).
measured(s15, flex_rating_10, v7).
measured(s21, flex_rating_10, v7).

all_consistent(flex_rating_10) :-
    consistent(sm, flex_rating_10),
    (indep(s15), consistent(s15, flex_rating_10) ; \+indep(s15)),
    (indep(s21), consistent(s21, flex_rating_10) ; \+indep(s21)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v7)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

% @attr damping_rating
% @type numeric
% @unit /10
% @canonical false
% @original_name Damping rating
% @values v8=8.0 unk_damping_rating=Unknown
% @importance 0.9

0.70::acc(s15, damping_rating).
0.78::acc(s21, damping_rating).

0.97::true_val(damping_rating, v8); 0.03::true_val(damping_rating, unk_damping_rating).

measured(s15, damping_rating, v8).
measured(s21, damping_rating, v8).

all_consistent(damping_rating) :-
    (indep(s15), consistent(s15, damping_rating) ; \+indep(s15)),
    (indep(s21), consistent(s21, damping_rating) ; \+indep(s21)).

evidence(all_consistent(damping_rating)).
query(true_val(damping_rating, v8)).
query(true_val(damping_rating, unk_damping_rating)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate_advanced=Intermediate_Advanced unk_rider_level=Unknown
% @importance 0.875

0.93::acc(sm, rider_level).
0.78::acc(s21, rider_level).

0.97::true_val(rider_level, intermediate_advanced); 0.03::true_val(rider_level, unk_rider_level).

measured(sm, rider_level, intermediate_advanced).
measured(s21, rider_level, intermediate_advanced).

all_consistent(rider_level) :-
    consistent(sm, rider_level),
    (indep(s21), consistent(s21, rider_level) ; \+indep(s21)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate_advanced)).
query(true_val(rider_level, unk_rider_level)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.9

0.78::acc(s21, gender).

0.95::true_val(gender, mens); 0.05::true_val(gender, unk_gender).

measured(s21, gender, mens).

all_consistent(gender) :-
    (indep(s21), consistent(s21, gender) ; \+indep(s21)).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_inserts unk_mounting_pattern=Unknown
% @importance 0.85

0.93::acc(sm, mounting_pattern).

0.95::true_val(mounting_pattern, inserts_2x4); 0.05::true_val(mounting_pattern, unk_mounting_pattern).

measured(sm, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :- consistent(sm, mounting_pattern).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values wooboo_wood=WooBoo_Bamboo_Paulownia_Poplar_Birch unk_core_material=Unknown
% @importance 0.825

0.93::acc(sm, core_material).
0.68::acc(s31, core_material).

0.97::true_val(core_material, wooboo_wood); 0.03::true_val(core_material, unk_core_material).

measured(sm, core_material, wooboo_wood).
measured(s31, core_material, wooboo_wood).

all_consistent(core_material) :-
    consistent(sm, core_material),
    (indep(s31), consistent(s31, core_material) ; \+indep(s31)).

evidence(all_consistent(core_material)).
query(true_val(core_material, wooboo_wood)).
query(true_val(core_material, unk_core_material)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values bi_lite_fiberglass=Bi_Lite_Fiberglass unk_laminate=Unknown
% @importance 0.85

0.93::acc(sm, laminate).

0.95::true_val(laminate, bi_lite_fiberglass); 0.05::true_val(laminate, unk_laminate).

measured(sm, laminate, bi_lite_fiberglass).

all_consistent(laminate) :- consistent(sm, laminate).

evidence(all_consistent(laminate)).
query(true_val(laminate, bi_lite_fiberglass)).
query(true_val(laminate, unk_laminate)).

% @attr laminate_pscm
% @type categorical
% @canonical false
% @original_name laminate (PSCM)
% @values pscm_carbon=Precision_Stitched_Carbon_Matrix unk_laminate_pscm=Unknown
% @importance 0.85

0.78::acc(s32, laminate_pscm).

0.95::true_val(laminate_pscm, pscm_carbon); 0.05::true_val(laminate_pscm, unk_laminate_pscm).

measured(s32, laminate_pscm, pscm_carbon).

all_consistent(laminate_pscm) :-
    (indep(s32), consistent(s32, laminate_pscm) ; \+indep(s32)).

evidence(all_consistent(laminate_pscm)).
query(true_val(laminate_pscm, pscm_carbon)).
query(true_val(laminate_pscm, unk_laminate_pscm)).

% @attr laminate_sts
% @type categorical
% @canonical false
% @original_name laminate (STS)
% @values sts_pretensioned=STS_Pre_Tensioned_Fiberglass unk_laminate_sts=Unknown
% @importance 0.85

0.93::acc(sm, laminate_sts).

0.95::true_val(laminate_sts, sts_pretensioned); 0.05::true_val(laminate_sts, unk_laminate_sts).

measured(sm, laminate_sts, sts_pretensioned).

all_consistent(laminate_sts) :- consistent(sm, laminate_sts).

evidence(all_consistent(laminate_sts)).
query(true_val(laminate_sts, sts_pretensioned)).
query(true_val(laminate_sts, unk_laminate_sts)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values t3_carbon_mapping=T3_Directional_Carbon_Mapping_Embossment unk_construction_material_innovation=Unknown
% @importance 0.8

0.80::acc(s33, construction_material_innovation).

0.74::true_val(construction_material_innovation, t3_carbon_mapping); 0.26::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s33, construction_material_innovation, t3_carbon_mapping).

all_consistent(construction_material_innovation) :-
    (indep(s33), consistent(s33, construction_material_innovation) ; \+indep(s33)).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, t3_carbon_mapping)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr construction_material_innovation_rds
% @type categorical
% @canonical false
% @original_name construction_material_innovation (RDS damping)
% @values rds_2=Triple_Layer_RDS_2_Damping rds_1=RDS_1_Damping_System unk_construction_material_innovation_rds=Unknown
% @importance 0.85

0.93::acc(sm, construction_material_innovation_rds).
0.68::acc(s26, construction_material_innovation_rds).

0.55::true_val(construction_material_innovation_rds, rds_2); 0.40::true_val(construction_material_innovation_rds, rds_1); 0.05::true_val(construction_material_innovation_rds, unk_construction_material_innovation_rds).

measured(sm, construction_material_innovation_rds, rds_2).
measured(s26, construction_material_innovation_rds, rds_1).

all_consistent(construction_material_innovation_rds) :-
    consistent(sm, construction_material_innovation_rds),
    (indep(s26), consistent(s26, construction_material_innovation_rds) ; \+indep(s26)).

evidence(all_consistent(construction_material_innovation_rds)).
query(true_val(construction_material_innovation_rds, rds_2)).
query(true_val(construction_material_innovation_rds, rds_1)).
query(true_val(construction_material_innovation_rds, unk_construction_material_innovation_rds)).

% @attr construction_material_innovation_elastomeric
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Elastomeric)
% @values elast_underfoot=Elastomeric_Underfoot_Stabilizers unk_construction_material_innovation_elastomeric=Unknown
% @importance 0.85

0.93::acc(sm, construction_material_innovation_elastomeric).

0.95::true_val(construction_material_innovation_elastomeric, elast_underfoot); 0.05::true_val(construction_material_innovation_elastomeric, unk_construction_material_innovation_elastomeric).

measured(sm, construction_material_innovation_elastomeric, elast_underfoot).

all_consistent(construction_material_innovation_elastomeric) :- consistent(sm, construction_material_innovation_elastomeric).

evidence(all_consistent(construction_material_innovation_elastomeric)).
query(true_val(construction_material_innovation_elastomeric, elast_underfoot)).
query(true_val(construction_material_innovation_elastomeric, unk_construction_material_innovation_elastomeric)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values uhmw_sintered_ptex=UHMW_Sintered_PTex unk_sidewall_material=Unknown
% @importance 0.825

0.93::acc(sm, sidewall_material).
0.82::acc(s34, sidewall_material).

0.97::true_val(sidewall_material, uhmw_sintered_ptex); 0.03::true_val(sidewall_material, unk_sidewall_material).

measured(sm, sidewall_material, uhmw_sintered_ptex).
measured(s34, sidewall_material, uhmw_sintered_ptex).

all_consistent(sidewall_material) :-
    consistent(sm, sidewall_material),
    (indep(s34), consistent(s34, sidewall_material) ; \+indep(s34)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, uhmw_sintered_ptex)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr sidewall_claim
% @type categorical
% @canonical false
% @original_name Sidewall claim
% @values first_sintered_ptex_never_cracked=First_to_use_sintered_PTex_never_cracked unk_sidewall_claim=Unknown
% @importance 0.8

0.82::acc(s34, sidewall_claim).

0.78::true_val(sidewall_claim, first_sintered_ptex_never_cracked); 0.22::true_val(sidewall_claim, unk_sidewall_claim).

measured(s34, sidewall_claim, first_sintered_ptex_never_cracked).

all_consistent(sidewall_claim) :-
    (indep(s34), consistent(s34, sidewall_claim) ; \+indep(s34)).

evidence(all_consistent(sidewall_claim)).
query(true_val(sidewall_claim, first_sintered_ptex_never_cracked)).
query(true_val(sidewall_claim, unk_sidewall_claim)).

% @attr sidewall_advantage
% @type categorical
% @canonical false
% @original_name Sidewall advantage over ABS
% @values cold_integrity=Maintains_integrity_at_any_temp_unlike_ABS unk_sidewall_advantage=Unknown
% @importance 0.8

0.82::acc(s34, sidewall_advantage).

0.78::true_val(sidewall_advantage, cold_integrity); 0.22::true_val(sidewall_advantage, unk_sidewall_advantage).

measured(s34, sidewall_advantage, cold_integrity).

all_consistent(sidewall_advantage) :-
    (indep(s34), consistent(s34, sidewall_advantage) ; \+indep(s34)).

evidence(all_consistent(sidewall_advantage)).
query(true_val(sidewall_advantage, cold_integrity)).
query(true_val(sidewall_advantage, unk_sidewall_advantage)).

% @attr edge_technology_wrap
% @type categorical
% @canonical false
% @original_name edge_technology (Full Wrap)
% @values full_wrap_metal=Full_Wrap_Metal_Edge unk_edge_technology_wrap=Unknown
% @importance 0.85

0.93::acc(sm, edge_technology_wrap).

0.95::true_val(edge_technology_wrap, full_wrap_metal); 0.05::true_val(edge_technology_wrap, unk_edge_technology_wrap).

measured(sm, edge_technology_wrap, full_wrap_metal).

all_consistent(edge_technology_wrap) :- consistent(sm, edge_technology_wrap).

evidence(all_consistent(edge_technology_wrap)).
query(true_val(edge_technology_wrap, full_wrap_metal)).
query(true_val(edge_technology_wrap, unk_edge_technology_wrap)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values durasurf_xt_5501=Durasurf_XT_Sintered_5501_graphite unk_base_material=Unknown
% @importance 0.775

0.93::acc(sm, base_material).
0.68::acc(s35, base_material).

0.97::true_val(base_material, durasurf_xt_5501); 0.03::true_val(base_material, unk_base_material).

measured(sm, base_material, durasurf_xt_5501).
measured(s35, base_material, durasurf_xt_5501).

all_consistent(base_material) :-
    consistent(sm, base_material),
    (indep(s35), consistent(s35, base_material) ; \+indep(s35)).

evidence(all_consistent(base_material)).
query(true_val(base_material, durasurf_xt_5501)).
query(true_val(base_material, unk_base_material)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values excellent_fast=Excellent_fast_graphite_infused unk_base_glide_performance=Unknown
% @importance 0.725

0.68::acc(s35, base_glide_performance).
0.70::acc(s51, base_glide_performance).

0.97::true_val(base_glide_performance, excellent_fast); 0.03::true_val(base_glide_performance, unk_base_glide_performance).

measured(s35, base_glide_performance, excellent_fast).
measured(s51, base_glide_performance, excellent_fast).

all_consistent(base_glide_performance) :-
    (indep(s35), consistent(s35, base_glide_performance) ; \+indep(s35)),
    (indep(s51), consistent(s51, base_glide_performance) ; \+indep(s51)).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, excellent_fast)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr topsheet
% @type categorical
% @canonical true
% @original_name topsheet
% @values coex_polymer_t3_carbon=CoExtruded_Polymer_T3_Carbon_Mapping unk_topsheet=Unknown
% @importance 0.85

0.93::acc(sm, topsheet).

0.95::true_val(topsheet, coex_polymer_t3_carbon); 0.05::true_val(topsheet, unk_topsheet).

measured(sm, topsheet, coex_polymer_t3_carbon).

all_consistent(topsheet) :- consistent(sm, topsheet).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, coex_polymer_t3_carbon)).
query(true_val(topsheet, unk_topsheet)).

% @attr topsheet_appearance_description
% @type categorical
% @canonical false
% @original_name topsheet_appearance_description
% @values tough_waterproof_stompad=Tough_lightweight_waterproof_builtin_stomp_pad unk_topsheet_appearance_description=Unknown
% @importance 0.65

0.88::acc(s36, topsheet_appearance_description).

0.81::true_val(topsheet_appearance_description, tough_waterproof_stompad); 0.19::true_val(topsheet_appearance_description, unk_topsheet_appearance_description).

measured(s36, topsheet_appearance_description, tough_waterproof_stompad).

all_consistent(topsheet_appearance_description) :- consistent(s36, topsheet_appearance_description).

evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, tough_waterproof_stompad)).
query(true_val(topsheet_appearance_description, unk_topsheet_appearance_description)).

% @attr additional_features
% @type categorical
% @canonical false
% @original_name Additional features
% @values ext_transition_early_rise_ptex_protect=Extended_Transition_EarlyRise_PTex_Protection unk_additional_features=Unknown
% @importance 0.85

0.93::acc(sm, additional_features).

0.95::true_val(additional_features, ext_transition_early_rise_ptex_protect); 0.05::true_val(additional_features, unk_additional_features).

measured(sm, additional_features, ext_transition_early_rise_ptex_protect).

all_consistent(additional_features) :- consistent(sm, additional_features).

evidence(all_consistent(additional_features)).
query(true_val(additional_features, ext_transition_early_rise_ptex_protect)).
query(true_val(additional_features, unk_additional_features)).

% @attr construction_material_innovation_early_rise
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Early Rise)
% @values early_rise_float=Front_contact_closer_eases_turn_improves_float unk_construction_material_innovation_early_rise=Unknown
% @importance 0.75

0.80::acc(s37, construction_material_innovation_early_rise).

0.74::true_val(construction_material_innovation_early_rise, early_rise_float); 0.26::true_val(construction_material_innovation_early_rise, unk_construction_material_innovation_early_rise).

measured(s37, construction_material_innovation_early_rise, early_rise_float).

all_consistent(construction_material_innovation_early_rise) :-
    (indep(s37), consistent(s37, construction_material_innovation_early_rise) ; \+indep(s37)).

evidence(all_consistent(construction_material_innovation_early_rise)).
query(true_val(construction_material_innovation_early_rise, early_rise_float)).
query(true_val(construction_material_innovation_early_rise, unk_construction_material_innovation_early_rise)).

% @attr graphics_printing
% @type categorical
% @canonical false
% @original_name Graphics printing
% @values water_ink_clay_paper=Water_based_inks_clay_paper_infused_polymer unk_graphics_printing=Unknown
% @importance 0.65

0.88::acc(s36, graphics_printing).

0.81::true_val(graphics_printing, water_ink_clay_paper); 0.19::true_val(graphics_printing, unk_graphics_printing).

measured(s36, graphics_printing, water_ink_clay_paper).

all_consistent(graphics_printing) :- consistent(s36, graphics_printing).

evidence(all_consistent(graphics_printing)).
query(true_val(graphics_printing, water_ink_clay_paper)).
query(true_val(graphics_printing, unk_graphics_printing)).

% @attr edge_bevel_spec
% @type categorical
% @canonical true
% @original_name edge_bevel_spec
% @values half_base_one_side=0_5_deg_base_1_deg_side unk_edge_bevel_spec=Unknown
% @importance 0.85

0.92::acc(s38, edge_bevel_spec).

0.87::true_val(edge_bevel_spec, half_base_one_side); 0.13::true_val(edge_bevel_spec, unk_edge_bevel_spec).

measured(s38, edge_bevel_spec, half_base_one_side).

all_consistent(edge_bevel_spec) :- consistent(s38, edge_bevel_spec).

evidence(all_consistent(edge_bevel_spec)).
query(true_val(edge_bevel_spec, half_base_one_side)).
query(true_val(edge_bevel_spec, unk_edge_bevel_spec)).

% @attr edge_bevel_spec_factory
% @type categorical
% @canonical false
% @original_name edge_bevel_spec (factory grind)
% @values flat_90=0_90_degree_flat_grind unk_edge_bevel_spec_factory=Unknown
% @importance 0.85

0.92::acc(s38, edge_bevel_spec_factory).

0.87::true_val(edge_bevel_spec_factory, flat_90); 0.13::true_val(edge_bevel_spec_factory, unk_edge_bevel_spec_factory).

measured(s38, edge_bevel_spec_factory, flat_90).

all_consistent(edge_bevel_spec_factory) :- consistent(s38, edge_bevel_spec_factory).

evidence(all_consistent(edge_bevel_spec_factory)).
query(true_val(edge_bevel_spec_factory, flat_90)).
query(true_val(edge_bevel_spec_factory, unk_edge_bevel_spec_factory)).

% @attr factory_tuned
% @type categorical
% @canonical false
% @original_name Boards come fully tuned from factory
% @values yes_fully_tuned=Sanded_sharpened_waxed_buffed unk_factory_tuned=Unknown
% @importance 0.65

0.88::acc(s36, factory_tuned).

0.81::true_val(factory_tuned, yes_fully_tuned); 0.19::true_val(factory_tuned, unk_factory_tuned).

measured(s36, factory_tuned, yes_fully_tuned).

all_consistent(factory_tuned) :- consistent(s36, factory_tuned).

evidence(all_consistent(factory_tuned)).
query(true_val(factory_tuned, yes_fully_tuned)).
query(true_val(factory_tuned, unk_factory_tuned)).

% @attr waist_width_152
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 152cm
% @values v254=254.0 unk_waist_width_152=Unknown
% @importance 0.85

0.93::acc(sm, waist_width_152).

0.95::true_val(waist_width_152, v254); 0.05::true_val(waist_width_152, unk_waist_width_152).

measured(sm, waist_width_152, v254).

all_consistent(waist_width_152) :- consistent(sm, waist_width_152).

evidence(all_consistent(waist_width_152)).
query(true_val(waist_width_152, v254)).
query(true_val(waist_width_152, unk_waist_width_152)).

% @attr effective_edge_152
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 152cm
% @values v1140=1140.0 unk_effective_edge_152=Unknown
% @importance 0.85

0.93::acc(sm, effective_edge_152).

0.95::true_val(effective_edge_152, v1140); 0.05::true_val(effective_edge_152, unk_effective_edge_152).

measured(sm, effective_edge_152, v1140).

all_consistent(effective_edge_152) :- consistent(sm, effective_edge_152).

evidence(all_consistent(effective_edge_152)).
query(true_val(effective_edge_152, v1140)).
query(true_val(effective_edge_152, unk_effective_edge_152)).

% @attr recommended_weight_range_size_152
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (152cm)
% @values w54_72kg=54_72kg unk_recommended_weight_range_size_152=Unknown
% @importance 0.85

0.93::acc(sm, recommended_weight_range_size_152).

0.95::true_val(recommended_weight_range_size_152, w54_72kg); 0.05::true_val(recommended_weight_range_size_152, unk_recommended_weight_range_size_152).

measured(sm, recommended_weight_range_size_152, w54_72kg).

all_consistent(recommended_weight_range_size_152) :- consistent(sm, recommended_weight_range_size_152).

evidence(all_consistent(recommended_weight_range_size_152)).
query(true_val(recommended_weight_range_size_152, w54_72kg)).
query(true_val(recommended_weight_range_size_152, unk_recommended_weight_range_size_152)).

% @attr waist_width_156
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 156cm
% @values v256=256.0 unk_waist_width_156=Unknown
% @importance 0.85

0.93::acc(sm, waist_width_156).

0.95::true_val(waist_width_156, v256); 0.05::true_val(waist_width_156, unk_waist_width_156).

measured(sm, waist_width_156, v256).

all_consistent(waist_width_156) :- consistent(sm, waist_width_156).

evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v256)).
query(true_val(waist_width_156, unk_waist_width_156)).

% @attr effective_edge_156
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 156cm
% @values v1180=1180.0 unk_effective_edge_156=Unknown
% @importance 0.85

0.93::acc(sm, effective_edge_156).

0.95::true_val(effective_edge_156, v1180); 0.05::true_val(effective_edge_156, unk_effective_edge_156).

measured(sm, effective_edge_156, v1180).

all_consistent(effective_edge_156) :- consistent(sm, effective_edge_156).

evidence(all_consistent(effective_edge_156)).
query(true_val(effective_edge_156, v1180)).
query(true_val(effective_edge_156, unk_effective_edge_156)).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size
% @values w63_90kg=63_90kg unk_recommended_weight_range_size=Unknown
% @importance 0.85

0.93::acc(sm, recommended_weight_range_size).

0.95::true_val(recommended_weight_range_size, w63_90kg); 0.05::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(sm, recommended_weight_range_size, w63_90kg).

all_consistent(recommended_weight_range_size) :- consistent(sm, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w63_90kg)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr waist_width_160
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 160cm
% @values v258=258.0 unk_waist_width_160=Unknown
% @importance 0.85

0.93::acc(sm, waist_width_160).

0.95::true_val(waist_width_160, v258); 0.05::true_val(waist_width_160, unk_waist_width_160).

measured(sm, waist_width_160, v258).

all_consistent(waist_width_160) :- consistent(sm, waist_width_160).

evidence(all_consistent(waist_width_160)).
query(true_val(waist_width_160, v258)).
query(true_val(waist_width_160, unk_waist_width_160)).

% @attr effective_edge_160
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 160cm
% @values v1220=1220.0 unk_effective_edge_160=Unknown
% @importance 0.85

0.93::acc(sm, effective_edge_160).

0.95::true_val(effective_edge_160, v1220); 0.05::true_val(effective_edge_160, unk_effective_edge_160).

measured(sm, effective_edge_160, v1220).

all_consistent(effective_edge_160) :- consistent(sm, effective_edge_160).

evidence(all_consistent(effective_edge_160)).
query(true_val(effective_edge_160, v1220)).
query(true_val(effective_edge_160, unk_effective_edge_160)).

% @attr recommended_weight_range_size_160
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (160cm)
% @values w68_90kg=68_90kg unk_recommended_weight_range_size_160=Unknown
% @importance 0.85

0.93::acc(sm, recommended_weight_range_size_160).

0.95::true_val(recommended_weight_range_size_160, w68_90kg); 0.05::true_val(recommended_weight_range_size_160, unk_recommended_weight_range_size_160).

measured(sm, recommended_weight_range_size_160, w68_90kg).

all_consistent(recommended_weight_range_size_160) :- consistent(sm, recommended_weight_range_size_160).

evidence(all_consistent(recommended_weight_range_size_160)).
query(true_val(recommended_weight_range_size_160, w68_90kg)).
query(true_val(recommended_weight_range_size_160, unk_recommended_weight_range_size_160)).

% @attr waist_width_157x
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 157X (Wide)
% @values v264=264.0 unk_waist_width_157x=Unknown
% @importance 0.85

0.93::acc(sm, waist_width_157x).

0.95::true_val(waist_width_157x, v264); 0.05::true_val(waist_width_157x, unk_waist_width_157x).

measured(sm, waist_width_157x, v264).

all_consistent(waist_width_157x) :- consistent(sm, waist_width_157x).

evidence(all_consistent(waist_width_157x)).
query(true_val(waist_width_157x, v264)).
query(true_val(waist_width_157x, unk_waist_width_157x)).

% @attr effective_edge_157x
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 157X
% @values v1190=1190.0 unk_effective_edge_157x=Unknown
% @importance 0.85

0.93::acc(sm, effective_edge_157x).

0.95::true_val(effective_edge_157x, v1190); 0.05::true_val(effective_edge_157x, unk_effective_edge_157x).

measured(sm, effective_edge_157x, v1190).

all_consistent(effective_edge_157x) :- consistent(sm, effective_edge_157x).

evidence(all_consistent(effective_edge_157x)).
query(true_val(effective_edge_157x, v1190)).
query(true_val(effective_edge_157x, unk_effective_edge_157x)).

% @attr recommended_weight_range_size_157x
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (157X)
% @values w68_90kg=68_90kg unk_recommended_weight_range_size_157x=Unknown
% @importance 0.85

0.93::acc(sm, recommended_weight_range_size_157x).

0.95::true_val(recommended_weight_range_size_157x, w68_90kg); 0.05::true_val(recommended_weight_range_size_157x, unk_recommended_weight_range_size_157x).

measured(sm, recommended_weight_range_size_157x, w68_90kg).

all_consistent(recommended_weight_range_size_157x) :- consistent(sm, recommended_weight_range_size_157x).

evidence(all_consistent(recommended_weight_range_size_157x)).
query(true_val(recommended_weight_range_size_157x, w68_90kg)).
query(true_val(recommended_weight_range_size_157x, unk_recommended_weight_range_size_157x)).

% @attr waist_width_161x
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 161X
% @values v266=266.0 unk_waist_width_161x=Unknown
% @importance 0.85

0.93::acc(sm, waist_width_161x).

0.95::true_val(waist_width_161x, v266); 0.05::true_val(waist_width_161x, unk_waist_width_161x).

measured(sm, waist_width_161x, v266).

all_consistent(waist_width_161x) :- consistent(sm, waist_width_161x).

evidence(all_consistent(waist_width_161x)).
query(true_val(waist_width_161x, v266)).
query(true_val(waist_width_161x, unk_waist_width_161x)).

% @attr effective_edge_161x
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 161X
% @values v1230=1230.0 unk_effective_edge_161x=Unknown
% @importance 0.85

0.93::acc(sm, effective_edge_161x).

0.95::true_val(effective_edge_161x, v1230); 0.05::true_val(effective_edge_161x, unk_effective_edge_161x).

measured(sm, effective_edge_161x, v1230).

all_consistent(effective_edge_161x) :- consistent(sm, effective_edge_161x).

evidence(all_consistent(effective_edge_161x)).
query(true_val(effective_edge_161x, v1230)).
query(true_val(effective_edge_161x, unk_effective_edge_161x)).

% @attr recommended_weight_range_size_161x
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (161X)
% @values w68_90plus_kg=68_90plus_kg unk_recommended_weight_range_size_161x=Unknown
% @importance 0.85

0.93::acc(sm, recommended_weight_range_size_161x).

0.95::true_val(recommended_weight_range_size_161x, w68_90plus_kg); 0.05::true_val(recommended_weight_range_size_161x, unk_recommended_weight_range_size_161x).

measured(sm, recommended_weight_range_size_161x, w68_90plus_kg).

all_consistent(recommended_weight_range_size_161x) :- consistent(sm, recommended_weight_range_size_161x).

evidence(all_consistent(recommended_weight_range_size_161x)).
query(true_val(recommended_weight_range_size_161x, w68_90plus_kg)).
query(true_val(recommended_weight_range_size_161x, unk_recommended_weight_range_size_161x)).

% @attr waist_width_165
% @type numeric
% @unit mm
% @canonical false
% @original_name waist_width_165
% @values v268=268.0 unk_waist_width_165=Unknown
% @importance 0.85

0.93::acc(sm, waist_width_165).

0.95::true_val(waist_width_165, v268); 0.05::true_val(waist_width_165, unk_waist_width_165).

measured(sm, waist_width_165, v268).

all_consistent(waist_width_165) :- consistent(sm, waist_width_165).

evidence(all_consistent(waist_width_165)).
query(true_val(waist_width_165, v268)).
query(true_val(waist_width_165, unk_waist_width_165)).

% @attr effective_edge_165
% @type numeric
% @unit mm
% @canonical false
% @original_name effective_edge_165
% @values v1270=1270.0 unk_effective_edge_165=Unknown
% @importance 0.85

0.93::acc(sm, effective_edge_165).

0.95::true_val(effective_edge_165, v1270); 0.05::true_val(effective_edge_165, unk_effective_edge_165).

measured(sm, effective_edge_165, v1270).

all_consistent(effective_edge_165) :- consistent(sm, effective_edge_165).

evidence(all_consistent(effective_edge_165)).
query(true_val(effective_edge_165, v1270)).
query(true_val(effective_edge_165, unk_effective_edge_165)).

% @attr recommended_weight_165
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_165
% @values w77_90plus_kg=77_90plus_kg unk_recommended_weight_165=Unknown
% @importance 0.85

0.93::acc(sm, recommended_weight_165).

0.95::true_val(recommended_weight_165, w77_90plus_kg); 0.05::true_val(recommended_weight_165, unk_recommended_weight_165).

measured(sm, recommended_weight_165, w77_90plus_kg).

all_consistent(recommended_weight_165) :- consistent(sm, recommended_weight_165).

evidence(all_consistent(recommended_weight_165)).
query(true_val(recommended_weight_165, w77_90plus_kg)).
query(true_val(recommended_weight_165, unk_recommended_weight_165)).

% @attr waist_width_162df
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 162DF
% @values v284=284.0 unk_waist_width_162df=Unknown
% @importance 0.85

0.93::acc(sm, waist_width_162df).

0.95::true_val(waist_width_162df, v284); 0.05::true_val(waist_width_162df, unk_waist_width_162df).

measured(sm, waist_width_162df, v284).

all_consistent(waist_width_162df) :- consistent(sm, waist_width_162df).

evidence(all_consistent(waist_width_162df)).
query(true_val(waist_width_162df, v284)).
query(true_val(waist_width_162df, unk_waist_width_162df)).

% @attr effective_edge_162df
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 162DF
% @values v1220=1220.0 unk_effective_edge_162df=Unknown
% @importance 0.85

0.93::acc(sm, effective_edge_162df).

0.95::true_val(effective_edge_162df, v1220); 0.05::true_val(effective_edge_162df, unk_effective_edge_162df).

measured(sm, effective_edge_162df, v1220).

all_consistent(effective_edge_162df) :- consistent(sm, effective_edge_162df).

evidence(all_consistent(effective_edge_162df)).
query(true_val(effective_edge_162df, v1220)).
query(true_val(effective_edge_162df, unk_effective_edge_162df)).

% @attr recommended_weight_range_size_162df
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (162DF)
% @values w68_90plus_kg=68_90plus_kg unk_recommended_weight_range_size_162df=Unknown
% @importance 0.85

0.93::acc(sm, recommended_weight_range_size_162df).

0.95::true_val(recommended_weight_range_size_162df, w68_90plus_kg); 0.05::true_val(recommended_weight_range_size_162df, unk_recommended_weight_range_size_162df).

measured(sm, recommended_weight_range_size_162df, w68_90plus_kg).

all_consistent(recommended_weight_range_size_162df) :- consistent(sm, recommended_weight_range_size_162df).

evidence(all_consistent(recommended_weight_range_size_162df)).
query(true_val(recommended_weight_range_size_162df, w68_90plus_kg)).
query(true_val(recommended_weight_range_size_162df, unk_recommended_weight_range_size_162df)).

% @attr waist_width_166df
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 166DF
% @values v284=284.0 unk_waist_width_166df=Unknown
% @importance 0.85

0.93::acc(sm, waist_width_166df).

0.95::true_val(waist_width_166df, v284); 0.05::true_val(waist_width_166df, unk_waist_width_166df).

measured(sm, waist_width_166df, v284).

all_consistent(waist_width_166df) :- consistent(sm, waist_width_166df).

evidence(all_consistent(waist_width_166df)).
query(true_val(waist_width_166df, v284)).
query(true_val(waist_width_166df, unk_waist_width_166df)).

% @attr effective_edge_166df
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 166DF
% @values v1270=1270.0 unk_effective_edge_166df=Unknown
% @importance 0.85

0.93::acc(sm, effective_edge_166df).

0.95::true_val(effective_edge_166df, v1270); 0.05::true_val(effective_edge_166df, unk_effective_edge_166df).

measured(sm, effective_edge_166df, v1270).

all_consistent(effective_edge_166df) :- consistent(sm, effective_edge_166df).

evidence(all_consistent(effective_edge_166df)).
query(true_val(effective_edge_166df, v1270)).
query(true_val(effective_edge_166df, unk_effective_edge_166df)).

% @attr recommended_weight_range_size_166df
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (166DF)
% @values w77_90plus_kg=77_90plus_kg unk_recommended_weight_range_size_166df=Unknown
% @importance 0.85

0.93::acc(sm, recommended_weight_range_size_166df).

0.95::true_val(recommended_weight_range_size_166df, w77_90plus_kg); 0.05::true_val(recommended_weight_range_size_166df, unk_recommended_weight_range_size_166df).

measured(sm, recommended_weight_range_size_166df, w77_90plus_kg).

all_consistent(recommended_weight_range_size_166df) :- consistent(sm, recommended_weight_range_size_166df).

evidence(all_consistent(recommended_weight_range_size_166df)).
query(true_val(recommended_weight_range_size_166df, w77_90plus_kg)).
query(true_val(recommended_weight_range_size_166df, unk_recommended_weight_range_size_166df)).

% @attr width_options
% @type categorical
% @canonical true
% @original_name width_options
% @values regular_up_to_10=Regular_for_boot_up_to_US10 unk_width_options=Unknown
% @importance 0.85

0.92::acc(s38, width_options).

0.87::true_val(width_options, regular_up_to_10); 0.13::true_val(width_options, unk_width_options).

measured(s38, width_options, regular_up_to_10).

all_consistent(width_options) :- consistent(s38, width_options).

evidence(all_consistent(width_options)).
query(true_val(width_options, regular_up_to_10)).
query(true_val(width_options, unk_width_options)).

% @attr width_options_wide
% @type categorical
% @canonical false
% @original_name width_options (Wide)
% @values wide_10_5_to_12=Wide_X_for_boot_US10_5_to_12 unk_width_options_wide=Unknown
% @importance 0.85

0.92::acc(s38, width_options_wide).

0.87::true_val(width_options_wide, wide_10_5_to_12); 0.13::true_val(width_options_wide, unk_width_options_wide).

measured(s38, width_options_wide, wide_10_5_to_12).

all_consistent(width_options_wide) :- consistent(s38, width_options_wide).

evidence(all_consistent(width_options_wide)).
query(true_val(width_options_wide, wide_10_5_to_12)).
query(true_val(width_options_wide, unk_width_options_wide)).

% @attr width_options_df
% @type categorical
% @canonical false
% @original_name width_options (Drag Free)
% @values df_14_plus=Drag_Free_for_boot_US14_plus_or_carving unk_width_options_df=Unknown
% @importance 0.825

0.93::acc(sm, width_options_df).
0.80::acc(s39, width_options_df).

0.97::true_val(width_options_df, df_14_plus); 0.03::true_val(width_options_df, unk_width_options_df).

measured(sm, width_options_df, df_14_plus).
measured(s39, width_options_df, df_14_plus).

all_consistent(width_options_df) :-
    consistent(sm, width_options_df),
    consistent(s39, width_options_df).

evidence(all_consistent(width_options_df)).
query(true_val(width_options_df, df_14_plus)).
query(true_val(width_options_df, unk_width_options_df)).

% @attr flex_rating_10_evo
% @type numeric
% @unit /10
% @canonical false
% @original_name flex_rating_10_evo
% @values v8=8.0 unk_flex_rating_10_evo=Unknown
% @importance 0.85

0.70::acc(s40, flex_rating_10_evo).

0.70::true_val(flex_rating_10_evo, v8); 0.30::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).

measured(s40, flex_rating_10_evo, v8).

all_consistent(flex_rating_10_evo) :-
    (indep(s40), consistent(s40, flex_rating_10_evo) ; \+indep(s40)).

evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, v8)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values med_to_med_stiff=Medium_to_medium_stiff unk_flex_feel=Unknown
% @importance 0.9

0.85::acc(s41, flex_feel).

0.74::true_val(flex_feel, med_to_med_stiff); 0.26::true_val(flex_feel, unk_flex_feel).

measured(s41, flex_feel, med_to_med_stiff).

all_consistent(flex_feel) :- consistent(s41, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, med_to_med_stiff)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr flex_feel_distribution
% @type categorical
% @canonical false
% @original_name flex_feel (distribution)
% @values tip_tail_flex_stiffer_camber=Most_flex_in_tip_tail_stiffer_over_camber unk_flex_feel_distribution=Unknown
% @importance 0.9

0.85::acc(s41, flex_feel_distribution).

0.74::true_val(flex_feel_distribution, tip_tail_flex_stiffer_camber); 0.26::true_val(flex_feel_distribution, unk_flex_feel_distribution).

measured(s41, flex_feel_distribution, tip_tail_flex_stiffer_camber).

all_consistent(flex_feel_distribution) :- consistent(s41, flex_feel_distribution).

evidence(all_consistent(flex_feel_distribution)).
query(true_val(flex_feel_distribution, tip_tail_flex_stiffer_camber)).
query(true_val(flex_feel_distribution, unk_flex_feel_distribution)).

% @attr warranty_period_years
% @type numeric
% @unit years
% @canonical true
% @original_name warranty_period_years
% @values v3=3.0 unk_warranty_period_years=Unknown
% @importance 0.85

0.95::acc(s42, warranty_period_years).

0.93::true_val(warranty_period_years, v3); 0.07::true_val(warranty_period_years, unk_warranty_period_years).

measured(s42, warranty_period_years, v3).

all_consistent(warranty_period_years) :- consistent(s42, warranty_period_years).

evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v3)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values defects_repair_replace=Defects_in_material_workmanship_repair_or_replace unk_warranty=Unknown
% @importance 0.85

0.95::acc(s42, warranty).

0.93::true_val(warranty, defects_repair_replace); 0.07::true_val(warranty, unk_warranty).

measured(s42, warranty, defects_repair_replace).

all_consistent(warranty) :- consistent(s42, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, defects_repair_replace)).
query(true_val(warranty, unk_warranty)).

% @attr warranty_exclusions
% @type categorical
% @canonical false
% @original_name warranty (exclusions)
% @values impact_misuse_wear=Impact_misuse_abuse_normal_wear_cracked_edges unk_warranty_exclusions=Unknown
% @importance 0.85

0.95::acc(s42, warranty_exclusions).

0.93::true_val(warranty_exclusions, impact_misuse_wear); 0.07::true_val(warranty_exclusions, unk_warranty_exclusions).

measured(s42, warranty_exclusions, impact_misuse_wear).

all_consistent(warranty_exclusions) :- consistent(s42, warranty_exclusions).

evidence(all_consistent(warranty_exclusions)).
query(true_val(warranty_exclusions, impact_misuse_wear)).
query(true_val(warranty_exclusions, unk_warranty_exclusions)).

% @attr warranty_requirements
% @type categorical
% @canonical false
% @original_name warranty (requirements)
% @values proof_purchase_reg=Original_proof_of_purchase_registration_recommended unk_warranty_requirements=Unknown
% @importance 0.85

0.95::acc(s42, warranty_requirements).

0.93::true_val(warranty_requirements, proof_purchase_reg); 0.07::true_val(warranty_requirements, unk_warranty_requirements).

measured(s42, warranty_requirements, proof_purchase_reg).

all_consistent(warranty_requirements) :- consistent(s42, warranty_requirements).

evidence(all_consistent(warranty_requirements)).
query(true_val(warranty_requirements, proof_purchase_reg)).
query(true_val(warranty_requirements, unk_warranty_requirements)).

% @attr warranty_vs_capita
% @type categorical
% @canonical false
% @original_name warranty (vs Capita)
% @values ns_3yr_vs_capita_2yr=NS_3yr_vs_Capita_2yr unk_warranty_vs_capita=Unknown
% @importance 0.75

0.62::acc(s43, warranty_vs_capita).

0.59::true_val(warranty_vs_capita, ns_3yr_vs_capita_2yr); 0.41::true_val(warranty_vs_capita, unk_warranty_vs_capita).

measured(s43, warranty_vs_capita, ns_3yr_vs_capita_2yr).

all_consistent(warranty_vs_capita) :- consistent(s43, warranty_vs_capita).

evidence(all_consistent(warranty_vs_capita)).
query(true_val(warranty_vs_capita, ns_3yr_vs_capita_2yr)).
query(true_val(warranty_vs_capita, unk_warranty_vs_capita)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values exceptional=Exceptional_grips_like_champ unk_edge_hold=Unknown
% @importance 0.95

0.85::acc(s44, edge_hold).

0.78::true_val(edge_hold, exceptional); 0.22::true_val(edge_hold, unk_edge_hold).

measured(s44, edge_hold, exceptional).

all_consistent(edge_hold) :- consistent(s44, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, exceptional)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr chatter_performance
% @type categorical
% @canonical true
% @original_name chatter_performance
% @values very_high_damp=Very_high_dampness_stable_fast unk_chatter_performance=Unknown
% @importance 0.875

0.78::acc(s45, chatter_performance).
0.82::acc(s46, chatter_performance).

0.97::true_val(chatter_performance, very_high_damp); 0.03::true_val(chatter_performance, unk_chatter_performance).

measured(s45, chatter_performance, very_high_damp).
measured(s46, chatter_performance, very_high_damp).

all_consistent(chatter_performance) :-
    consistent(s45, chatter_performance),
    consistent(s46, chatter_performance).

evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, very_high_damp)).
query(true_val(chatter_performance, unk_chatter_performance)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values fast=Fast_turn_initiation_less_pressure_nose_tail unk_turn_initiation_performance=Unknown
% @importance 0.85

0.55::acc(s47, turn_initiation_performance).

0.47::true_val(turn_initiation_performance, fast); 0.53::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s47, turn_initiation_performance, fast).

all_consistent(turn_initiation_performance) :- consistent(s47, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, fast)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr powder_float
% @type categorical
% @canonical false
% @original_name Powder float
% @values decent=Decent_float_with_early_rise_taper_setback unk_powder_float=Unknown
% @importance 0.9

0.78::acc(s48, powder_float).

0.70::true_val(powder_float, decent); 0.30::true_val(powder_float, unk_powder_float).

measured(s48, powder_float, decent).

all_consistent(powder_float) :- consistent(s48, powder_float).

evidence(all_consistent(powder_float)).
query(true_val(powder_float, decent)).
query(true_val(powder_float, unk_powder_float)).

% @attr pop
% @type categorical
% @canonical false
% @original_name pop
% @values good=Good_pop_energy_return_from_camber_carbon unk_pop=Unknown
% @importance 0.8

0.85::acc(s49, pop).

0.75::true_val(pop, good); 0.25::true_val(pop, unk_pop).

measured(s49, pop, good).

all_consistent(pop) :- consistent(s49, pop).

evidence(all_consistent(pop)).
query(true_val(pop, good)).
query(true_val(pop, unk_pop)).

% @attr durability
% @type categorical
% @canonical false
% @original_name Durability
% @values super_durable=Super_durable_topsheet_long_lasting unk_durability=Unknown
% @importance 0.8

0.82::acc(s50, durability).

0.74::true_val(durability, super_durable); 0.26::true_val(durability, unk_durability).

measured(s50, durability, super_durable).

all_consistent(durability) :- consistent(s50, durability).

evidence(all_consistent(durability)).
query(true_val(durability, super_durable)).
query(true_val(durability, unk_durability)).

% @attr board_weight_grams
% @type categorical
% @canonical true
% @original_name board_weight_grams
% @values light_medium=Light_side_of_medium_exact_not_published unk_board_weight_grams=Unknown
% @importance 0.8

0.82::acc(s50, board_weight_grams).

0.74::true_val(board_weight_grams, light_medium); 0.26::true_val(board_weight_grams, unk_board_weight_grams).

measured(s50, board_weight_grams, light_medium).

all_consistent(board_weight_grams) :- consistent(s50, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, light_medium)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr positive_aspect
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values one_board_quiver=One_board_quiver_aggressive_all_mountain_freeride unk_positive_aspect=Unknown
% @importance 0.85

0.78::acc(s52, positive_aspect).

0.74::true_val(positive_aspect, one_board_quiver); 0.26::true_val(positive_aspect, unk_positive_aspect).

measured(s52, positive_aspect, one_board_quiver).

all_consistent(positive_aspect) :- consistent(s52, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, one_board_quiver)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr mtn_weekly_news_review
% @type categorical
% @canonical false
% @original_name Mountain Weekly News
% @values perfect_freeride=Perfect_freeride_board_all_season_ripper unk_mtn_weekly_news_review=Unknown
% @importance 0.85

0.78::acc(s52, mtn_weekly_news_review).

0.74::true_val(mtn_weekly_news_review, perfect_freeride); 0.26::true_val(mtn_weekly_news_review, unk_mtn_weekly_news_review).

measured(s52, mtn_weekly_news_review, perfect_freeride).

all_consistent(mtn_weekly_news_review) :- consistent(s52, mtn_weekly_news_review).

evidence(all_consistent(mtn_weekly_news_review)).
query(true_val(mtn_weekly_news_review, perfect_freeride)).
query(true_val(mtn_weekly_news_review, unk_mtn_weekly_news_review)).

% @attr mtn_weekly_news_reviewer
% @type categorical
% @canonical false
% @original_name Mountain Weekly News reviewer Eric Odlin
% @values eric_odlin_all_season=Uses_opening_day_through_season_carving_park_powder unk_mtn_weekly_news_reviewer=Unknown
% @importance 0.85

0.78::acc(s52, mtn_weekly_news_reviewer).

0.74::true_val(mtn_weekly_news_reviewer, eric_odlin_all_season); 0.26::true_val(mtn_weekly_news_reviewer, unk_mtn_weekly_news_reviewer).

measured(s52, mtn_weekly_news_reviewer, eric_odlin_all_season).

all_consistent(mtn_weekly_news_reviewer) :- consistent(s52, mtn_weekly_news_reviewer).

evidence(all_consistent(mtn_weekly_news_reviewer)).
query(true_val(mtn_weekly_news_reviewer, eric_odlin_all_season)).
query(true_val(mtn_weekly_news_reviewer, unk_mtn_weekly_news_reviewer)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values stable_fast_reliable=Stable_fast_reliable_steady unk_user_review_forum=Unknown
% @importance 0.7

0.45::acc(s53, user_review_forum).

0.38::true_val(user_review_forum, stable_fast_reliable); 0.62::true_val(user_review_forum, unk_user_review_forum).

measured(s53, user_review_forum, stable_fast_reliable).

all_consistent(user_review_forum) :- consistent(s53, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, stable_fast_reliable)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr user_review_forum_ice
% @type categorical
% @canonical false
% @original_name user_review_forum (ice)
% @values never_lost_edge=Never_lost_edge_on_ice_Japan unk_user_review_forum_ice=Unknown
% @importance 0.75

0.40::acc(s54, user_review_forum_ice).

0.32::true_val(user_review_forum_ice, never_lost_edge); 0.68::true_val(user_review_forum_ice, unk_user_review_forum_ice).

measured(s54, user_review_forum_ice, never_lost_edge).

all_consistent(user_review_forum_ice) :- consistent(s54, user_review_forum_ice).

evidence(all_consistent(user_review_forum_ice)).
query(true_val(user_review_forum_ice, never_lost_edge)).
query(true_val(user_review_forum_ice, unk_user_review_forum_ice)).

% @attr pro_rider_name
% @type categorical
% @canonical false
% @original_name pro_rider_name
% @values holden_samuels_fwt=Holden_Samuels_Freeride_World_Tour unk_pro_rider_name=Unknown
% @importance 0.75

0.40::acc(s54, pro_rider_name).

0.32::true_val(pro_rider_name, holden_samuels_fwt); 0.68::true_val(pro_rider_name, unk_pro_rider_name).

measured(s54, pro_rider_name, holden_samuels_fwt).

all_consistent(pro_rider_name) :- consistent(s54, pro_rider_name).

evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, holden_samuels_fwt)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values hooky_poor_tracking=Contact_points_feel_hooky_doesnt_track_well unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.9

0.85::acc(s55, reviewer_opinion_the_good_ride).

0.78::true_val(reviewer_opinion_the_good_ride, hooky_poor_tracking); 0.22::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s55, reviewer_opinion_the_good_ride, hooky_poor_tracking).

all_consistent(reviewer_opinion_the_good_ride) :- consistent(s55, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, hooky_poor_tracking)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr reviewer_opinion_the_good_ride_preference
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (preference)
% @values prefers_eclipse_cougar=Prefers_Eclipse_and_Cougar_over_this unk_reviewer_opinion_the_good_ride_preference=Unknown
% @importance 0.8

0.82::acc(s56, reviewer_opinion_the_good_ride_preference).

0.74::true_val(reviewer_opinion_the_good_ride_preference, prefers_eclipse_cougar); 0.26::true_val(reviewer_opinion_the_good_ride_preference, unk_reviewer_opinion_the_good_ride_preference).

measured(s56, reviewer_opinion_the_good_ride_preference, prefers_eclipse_cougar).

all_consistent(reviewer_opinion_the_good_ride_preference) :- consistent(s56, reviewer_opinion_the_good_ride_preference).

evidence(all_consistent(reviewer_opinion_the_good_ride_preference)).
query(true_val(reviewer_opinion_the_good_ride_preference, prefers_eclipse_cougar)).
query(true_val(reviewer_opinion_the_good_ride_preference, unk_reviewer_opinion_the_good_ride_preference)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values adjustment_time=Riders_from_traditional_camber_need_adjustment unk_negative_aspect=Unknown
% @importance 0.8

0.85::acc(s57, negative_aspect).

0.75::true_val(negative_aspect, adjustment_time); 0.25::true_val(negative_aspect, unk_negative_aspect).

measured(s57, negative_aspect, adjustment_time).

all_consistent(negative_aspect) :- consistent(s57, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, adjustment_time)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_dampness
% @type categorical
% @canonical false
% @original_name negative_aspect (dampness)
% @values dampness_masks_lively=Dampness_masks_lively_feel_too_composed unk_negative_aspect_dampness=Unknown
% @importance 0.8

0.78::acc(s58, negative_aspect_dampness).

0.70::true_val(negative_aspect_dampness, dampness_masks_lively); 0.30::true_val(negative_aspect_dampness, unk_negative_aspect_dampness).

measured(s58, negative_aspect_dampness, dampness_masks_lively).

all_consistent(negative_aspect_dampness) :- consistent(s58, negative_aspect_dampness).

evidence(all_consistent(negative_aspect_dampness)).
query(true_val(negative_aspect_dampness, dampness_masks_lively)).
query(true_val(negative_aspect_dampness, unk_negative_aspect_dampness)).

% @attr negative_aspect_flat_basing
% @type categorical
% @canonical false
% @original_name negative_aspect (flat basing)
% @values not_confident_flat_basing=Not_100pct_confident_flat_basing_at_speed unk_negative_aspect_flat_basing=Unknown
% @importance 0.85

0.82::acc(s59, negative_aspect_flat_basing).

0.74::true_val(negative_aspect_flat_basing, not_confident_flat_basing); 0.26::true_val(negative_aspect_flat_basing, unk_negative_aspect_flat_basing).

measured(s59, negative_aspect_flat_basing, not_confident_flat_basing).

all_consistent(negative_aspect_flat_basing) :- consistent(s59, negative_aspect_flat_basing).

evidence(all_consistent(negative_aspect_flat_basing)).
query(true_val(negative_aspect_flat_basing, not_confident_flat_basing)).
query(true_val(negative_aspect_flat_basing, unk_negative_aspect_flat_basing)).

% @attr negative_aspect_jibbing
% @type categorical
% @canonical false
% @original_name negative_aspect (jibbing)
% @values not_for_jibbing=Not_best_for_jibbing_or_flat_ground_tricks unk_negative_aspect_jibbing=Unknown
% @importance 0.75

0.75::acc(s60, negative_aspect_jibbing).

0.64::true_val(negative_aspect_jibbing, not_for_jibbing); 0.36::true_val(negative_aspect_jibbing, unk_negative_aspect_jibbing).

measured(s60, negative_aspect_jibbing, not_for_jibbing).

all_consistent(negative_aspect_jibbing) :- consistent(s60, negative_aspect_jibbing).

evidence(all_consistent(negative_aspect_jibbing)).
query(true_val(negative_aspect_jibbing, not_for_jibbing)).
query(true_val(negative_aspect_jibbing, unk_negative_aspect_jibbing)).

% @attr negative_aspect_setback
% @type categorical
% @canonical false
% @original_name negative_aspect (setback)
% @values limited_setback=Only_2in_setback_vs_3_5in_freeride_standard unk_negative_aspect_setback=Unknown
% @importance 0.85

0.82::acc(s61, negative_aspect_setback).

0.78::true_val(negative_aspect_setback, limited_setback); 0.22::true_val(negative_aspect_setback, unk_negative_aspect_setback).

measured(s61, negative_aspect_setback, limited_setback).

all_consistent(negative_aspect_setback) :- consistent(s61, negative_aspect_setback).

evidence(all_consistent(negative_aspect_setback)).
query(true_val(negative_aspect_setback, limited_setback)).
query(true_val(negative_aspect_setback, unk_negative_aspect_setback)).

% @attr negative_aspect_price
% @type categorical
% @canonical false
% @original_name negative_aspect (price)
% @values above_avg_price=Above_average_snowboard_price_point unk_negative_aspect_price=Unknown
% @importance 0.85

0.62::acc(s62, negative_aspect_price).

0.52::true_val(negative_aspect_price, above_avg_price); 0.48::true_val(negative_aspect_price, unk_negative_aspect_price).

measured(s62, negative_aspect_price, above_avg_price).

all_consistent(negative_aspect_price) :- consistent(s62, negative_aspect_price).

evidence(all_consistent(negative_aspect_price)).
query(true_val(negative_aspect_price, above_avg_price)).
query(true_val(negative_aspect_price, unk_negative_aspect_price)).

% @attr user_review_forum_edge_separation
% @type categorical
% @canonical false
% @original_name user_review_forum (edge separation)
% @values minor_separation_day1=Possible_minor_edge_separation_after_first_day unk_user_review_forum_edge_separation=Unknown
% @importance 0.75

0.30::acc(s63, user_review_forum_edge_separation).

0.21::true_val(user_review_forum_edge_separation, minor_separation_day1); 0.79::true_val(user_review_forum_edge_separation, unk_user_review_forum_edge_separation).

measured(s63, user_review_forum_edge_separation, minor_separation_day1).

all_consistent(user_review_forum_edge_separation) :- consistent(s63, user_review_forum_edge_separation).

evidence(all_consistent(user_review_forum_edge_separation)).
query(true_val(user_review_forum_edge_separation, minor_separation_day1)).
query(true_val(user_review_forum_edge_separation, unk_user_review_forum_edge_separation)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values proto_t3_twin=Proto_T3_twin_flex6_damp6_699 unk_comparable_board_same_brand=Unknown
% @importance 0.7

0.90::acc(s64, comparable_board_same_brand).

0.83::true_val(comparable_board_same_brand, proto_t3_twin); 0.17::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s64, comparable_board_same_brand, proto_t3_twin).

all_consistent(comparable_board_same_brand) :- consistent(s64, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, proto_t3_twin)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_eclipse
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Eclipse)
% @values eclipse=Eclipse_Recurve_10mm_taper_32mm_setback unk_comparable_board_same_brand_eclipse=Unknown
% @importance 0.7

0.90::acc(s65, comparable_board_same_brand_eclipse).

0.83::true_val(comparable_board_same_brand_eclipse, eclipse); 0.17::true_val(comparable_board_same_brand_eclipse, unk_comparable_board_same_brand_eclipse).

measured(s65, comparable_board_same_brand_eclipse, eclipse).

all_consistent(comparable_board_same_brand_eclipse) :- consistent(s65, comparable_board_same_brand_eclipse).

evidence(all_consistent(comparable_board_same_brand_eclipse)).
query(true_val(comparable_board_same_brand_eclipse, eclipse)).
query(true_val(comparable_board_same_brand_eclipse, unk_comparable_board_same_brand_eclipse)).

% @attr comparable_board_same_brand_ultra
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Ultra)
% @values proto_t3_ultra=Proto_T3_Ultra_twin_wider_stiffer_7flex_8damp unk_comparable_board_same_brand_ultra=Unknown
% @importance 0.65

0.80::acc(s66, comparable_board_same_brand_ultra).

0.66::true_val(comparable_board_same_brand_ultra, proto_t3_ultra); 0.34::true_val(comparable_board_same_brand_ultra, unk_comparable_board_same_brand_ultra).

measured(s66, comparable_board_same_brand_ultra, proto_t3_ultra).

all_consistent(comparable_board_same_brand_ultra) :- consistent(s66, comparable_board_same_brand_ultra).

evidence(all_consistent(comparable_board_same_brand_ultra)).
query(true_val(comparable_board_same_brand_ultra, proto_t3_ultra)).
query(true_val(comparable_board_same_brand_ultra, unk_comparable_board_same_brand_ultra)).

% @attr comparable_board_cross_brand_mercury
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Capita Mercury)
% @values capita_mercury=Capita_Mercury_679_more_lively_nimble unk_comparable_board_cross_brand_mercury=Unknown
% @importance 0.75

0.45::acc(s67, comparable_board_cross_brand_mercury).

0.32::true_val(comparable_board_cross_brand_mercury, capita_mercury); 0.68::true_val(comparable_board_cross_brand_mercury, unk_comparable_board_cross_brand_mercury).

measured(s67, comparable_board_cross_brand_mercury, capita_mercury).

all_consistent(comparable_board_cross_brand_mercury) :- consistent(s67, comparable_board_cross_brand_mercury).

evidence(all_consistent(comparable_board_cross_brand_mercury)).
query(true_val(comparable_board_cross_brand_mercury, capita_mercury)).
query(true_val(comparable_board_cross_brand_mercury, unk_comparable_board_cross_brand_mercury)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values capita_super_doa=Capita_Super_DOA_similar_carbon_NS_better_ice unk_comparable_board_cross_brand=Unknown
% @importance 0.75

0.62::acc(s43, comparable_board_cross_brand).

0.59::true_val(comparable_board_cross_brand, capita_super_doa); 0.41::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s43, comparable_board_cross_brand, capita_super_doa).

all_consistent(comparable_board_cross_brand) :- consistent(s43, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, capita_super_doa)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_jones_mt
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Jones Mountain Twin)
% @values jones_mountain_twin=Jones_Mountain_Twin_under_600_traditional_camber unk_comparable_board_cross_brand_jones_mt=Unknown
% @importance 0.75

0.62::acc(s68, comparable_board_cross_brand_jones_mt).

0.52::true_val(comparable_board_cross_brand_jones_mt, jones_mountain_twin); 0.48::true_val(comparable_board_cross_brand_jones_mt, unk_comparable_board_cross_brand_jones_mt).

measured(s68, comparable_board_cross_brand_jones_mt, jones_mountain_twin).

all_consistent(comparable_board_cross_brand_jones_mt) :- consistent(s68, comparable_board_cross_brand_jones_mt).

evidence(all_consistent(comparable_board_cross_brand_jones_mt)).
query(true_val(comparable_board_cross_brand_jones_mt, jones_mountain_twin)).
query(true_val(comparable_board_cross_brand_jones_mt, unk_comparable_board_cross_brand_jones_mt)).

% @attr comparable_board_cross_brand_yes_pyl
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Yes Pick Your Line)
% @values yes_pick_your_line=Yes_Pick_Your_Line unk_comparable_board_cross_brand_yes_pyl=Unknown
% @importance 0.85

0.82::acc(s69, comparable_board_cross_brand_yes_pyl).

0.74::true_val(comparable_board_cross_brand_yes_pyl, yes_pick_your_line); 0.26::true_val(comparable_board_cross_brand_yes_pyl, unk_comparable_board_cross_brand_yes_pyl).

measured(s69, comparable_board_cross_brand_yes_pyl, yes_pick_your_line).

all_consistent(comparable_board_cross_brand_yes_pyl) :- consistent(s69, comparable_board_cross_brand_yes_pyl).

evidence(all_consistent(comparable_board_cross_brand_yes_pyl)).
query(true_val(comparable_board_cross_brand_yes_pyl, yes_pick_your_line)).
query(true_val(comparable_board_cross_brand_yes_pyl, unk_comparable_board_cross_brand_yes_pyl)).

% @attr comparable_board_cross_brand_burton_fa
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Burton Flight Attendant)
% @values burton_flight_attendant=Burton_Flight_Attendant unk_comparable_board_cross_brand_burton_fa=Unknown
% @importance 0.85

0.82::acc(s69, comparable_board_cross_brand_burton_fa).

0.74::true_val(comparable_board_cross_brand_burton_fa, burton_flight_attendant); 0.26::true_val(comparable_board_cross_brand_burton_fa, unk_comparable_board_cross_brand_burton_fa).

measured(s69, comparable_board_cross_brand_burton_fa, burton_flight_attendant).

all_consistent(comparable_board_cross_brand_burton_fa) :- consistent(s69, comparable_board_cross_brand_burton_fa).

evidence(all_consistent(comparable_board_cross_brand_burton_fa)).
query(true_val(comparable_board_cross_brand_burton_fa, burton_flight_attendant)).
query(true_val(comparable_board_cross_brand_burton_fa, unk_comparable_board_cross_brand_burton_fa)).

% @attr comparable_board_cross_brand_jones_flagship
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Jones Flagship)
% @values jones_flagship=Jones_Flagship unk_comparable_board_cross_brand_jones_flagship=Unknown
% @importance 0.85

0.82::acc(s69, comparable_board_cross_brand_jones_flagship).

0.74::true_val(comparable_board_cross_brand_jones_flagship, jones_flagship); 0.26::true_val(comparable_board_cross_brand_jones_flagship, unk_comparable_board_cross_brand_jones_flagship).

measured(s69, comparable_board_cross_brand_jones_flagship, jones_flagship).

all_consistent(comparable_board_cross_brand_jones_flagship) :- consistent(s69, comparable_board_cross_brand_jones_flagship).

evidence(all_consistent(comparable_board_cross_brand_jones_flagship)).
query(true_val(comparable_board_cross_brand_jones_flagship, jones_flagship)).
query(true_val(comparable_board_cross_brand_jones_flagship, unk_comparable_board_cross_brand_jones_flagship)).

% @attr comparable_board_cross_brand_rossignol_xv
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Rossignol XV)
% @values rossignol_xv=Rossignol_XV unk_comparable_board_cross_brand_rossignol_xv=Unknown
% @importance 0.85

0.82::acc(s69, comparable_board_cross_brand_rossignol_xv).

0.74::true_val(comparable_board_cross_brand_rossignol_xv, rossignol_xv); 0.26::true_val(comparable_board_cross_brand_rossignol_xv, unk_comparable_board_cross_brand_rossignol_xv).

measured(s69, comparable_board_cross_brand_rossignol_xv, rossignol_xv).

all_consistent(comparable_board_cross_brand_rossignol_xv) :- consistent(s69, comparable_board_cross_brand_rossignol_xv).

evidence(all_consistent(comparable_board_cross_brand_rossignol_xv)).
query(true_val(comparable_board_cross_brand_rossignol_xv, rossignol_xv)).
query(true_val(comparable_board_cross_brand_rossignol_xv, unk_comparable_board_cross_brand_rossignol_xv)).

% @attr comparable_board_cross_brand_libtech_brd
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Lib Tech BRD)
% @values libtech_brd=Lib_Tech_BRD unk_comparable_board_cross_brand_libtech_brd=Unknown
% @importance 0.85

0.82::acc(s69, comparable_board_cross_brand_libtech_brd).

0.74::true_val(comparable_board_cross_brand_libtech_brd, libtech_brd); 0.26::true_val(comparable_board_cross_brand_libtech_brd, unk_comparable_board_cross_brand_libtech_brd).

measured(s69, comparable_board_cross_brand_libtech_brd, libtech_brd).

all_consistent(comparable_board_cross_brand_libtech_brd) :- consistent(s69, comparable_board_cross_brand_libtech_brd).

evidence(all_consistent(comparable_board_cross_brand_libtech_brd)).
query(true_val(comparable_board_cross_brand_libtech_brd, libtech_brd)).
query(true_val(comparable_board_cross_brand_libtech_brd, unk_comparable_board_cross_brand_libtech_brd)).

% @attr botw_rating
% @type numeric
% @unit /100
% @canonical false
% @original_name Board of the World rating (Proto T3 twin, not FR)
% @values v91_58=91.58 unk_botw_rating=Unknown
% @importance 0.8

0.58::acc(s70, botw_rating).

0.46::true_val(botw_rating, v91_58); 0.54::true_val(botw_rating, unk_botw_rating).

measured(s70, botw_rating, v91_58).

all_consistent(botw_rating) :- consistent(s70, botw_rating).

evidence(all_consistent(botw_rating)).
query(true_val(botw_rating, v91_58)).
query(true_val(botw_rating, unk_botw_rating)).

% @attr botw_rank
% @type categorical
% @canonical false
% @original_name Board of the World rank
% @values rank_4_of_38=4th_of_38_all_mountain unk_botw_rank=Unknown
% @importance 0.8

0.58::acc(s70, botw_rank).

0.46::true_val(botw_rank, rank_4_of_38); 0.54::true_val(botw_rank, unk_botw_rank).

measured(s70, botw_rank, rank_4_of_38).

all_consistent(botw_rank) :- consistent(s70, botw_rank).

evidence(all_consistent(botw_rank)).
query(true_val(botw_rank, rank_4_of_38)).
query(true_val(botw_rank, unk_botw_rank)).

% @attr ogl_verdict
% @type categorical
% @canonical false
% @original_name Outdoor Gear Lab (Proto FR)
% @values versatile_am_int_expert=Versatile_all_mountain_intermediate_to_expert unk_ogl_verdict=Unknown
% @importance 0.8

0.85::acc(s57, ogl_verdict).

0.75::true_val(ogl_verdict, versatile_am_int_expert); 0.25::true_val(ogl_verdict, unk_ogl_verdict).

measured(s57, ogl_verdict, versatile_am_int_expert).

all_consistent(ogl_verdict) :- consistent(s57, ogl_verdict).

evidence(all_consistent(ogl_verdict)).
query(true_val(ogl_verdict, versatile_am_int_expert)).
query(true_val(ogl_verdict, unk_ogl_verdict)).

% @attr mtn_weekly_verdict
% @type categorical
% @canonical false
% @original_name Mountain Weekly News verdict
% @values perfect_freeride_vote=Gets_my_vote_as_perfect_freeride_board unk_mtn_weekly_verdict=Unknown
% @importance 0.85

0.78::acc(s52, mtn_weekly_verdict).

0.74::true_val(mtn_weekly_verdict, perfect_freeride_vote); 0.26::true_val(mtn_weekly_verdict, unk_mtn_weekly_verdict).

measured(s52, mtn_weekly_verdict, perfect_freeride_vote).

all_consistent(mtn_weekly_verdict) :- consistent(s52, mtn_weekly_verdict).

evidence(all_consistent(mtn_weekly_verdict)).
query(true_val(mtn_weekly_verdict, perfect_freeride_vote)).
query(true_val(mtn_weekly_verdict, unk_mtn_weekly_verdict)).

% @attr ns_website_reviews
% @type categorical
% @canonical false
% @original_name Never Summer website
% @values six_reviews_2026=6_reviews_on_2026_Proto_T3_FR unk_ns_website_reviews=Unknown
% @importance 0.95

0.93::acc(s16, ns_website_reviews).

0.90::true_val(ns_website_reviews, six_reviews_2026); 0.10::true_val(ns_website_reviews, unk_ns_website_reviews).

measured(s16, ns_website_reviews, six_reviews_2026).

all_consistent(ns_website_reviews) :- consistent(s16, ns_website_reviews).

evidence(all_consistent(ns_website_reviews)).
query(true_val(ns_website_reviews, six_reviews_2026)).
query(true_val(ns_website_reviews, unk_ns_website_reviews)).

% @attr retailer_rep_evo
% @type categorical
% @canonical false
% @original_name evo
% @values major_retailer_price_match=Major_retailer_price_match_1yr_returns_free_ship unk_retailer_rep_evo=Unknown
% @importance 0.8

0.83::acc(s22, retailer_rep_evo).

0.81::true_val(retailer_rep_evo, major_retailer_price_match); 0.19::true_val(retailer_rep_evo, unk_retailer_rep_evo).

measured(s22, retailer_rep_evo, major_retailer_price_match).

all_consistent(retailer_rep_evo) :- consistent(s22, retailer_rep_evo).

evidence(all_consistent(retailer_rep_evo)).
query(true_val(retailer_rep_evo, major_retailer_price_match)).
query(true_val(retailer_rep_evo, unk_retailer_rep_evo)).

% @attr retailer_rep_tactics
% @type categorical
% @canonical false
% @original_name Tactics
% @values reputable_low_price_free_ship=Reputable_low_price_guarantee_free_ship_99 unk_retailer_rep_tactics=Unknown
% @importance 0.9

0.78::acc(s17, retailer_rep_tactics).

0.72::true_val(retailer_rep_tactics, reputable_low_price_free_ship); 0.28::true_val(retailer_rep_tactics, unk_retailer_rep_tactics).

measured(s17, retailer_rep_tactics, reputable_low_price_free_ship).

all_consistent(retailer_rep_tactics) :- consistent(s17, retailer_rep_tactics).

evidence(all_consistent(retailer_rep_tactics)).
query(true_val(retailer_rep_tactics, reputable_low_price_free_ship)).
query(true_val(retailer_rep_tactics, unk_retailer_rep_tactics)).

% @attr retailer_rep_sun_ski
% @type categorical
% @canonical false
% @original_name Sun & Ski Sports
% @values physical_stores_wax=30_plus_locations_lifetime_wax_service unk_retailer_rep_sun_ski=Unknown
% @importance 0.9

0.78::acc(s21, retailer_rep_sun_ski).

0.76::true_val(retailer_rep_sun_ski, physical_stores_wax); 0.24::true_val(retailer_rep_sun_ski, unk_retailer_rep_sun_ski).

measured(s21, retailer_rep_sun_ski, physical_stores_wax).

all_consistent(retailer_rep_sun_ski) :-
    (indep(s21), consistent(s21, retailer_rep_sun_ski) ; \+indep(s21)).

evidence(all_consistent(retailer_rep_sun_ski)).
query(true_val(retailer_rep_sun_ski, physical_stores_wax)).
query(true_val(retailer_rep_sun_ski, unk_retailer_rep_sun_ski)).

% @attr retailer_rep_backcountry
% @type categorical
% @canonical false
% @original_name Backcountry
% @values major_online_membership=Major_online_retailer_membership_rewards unk_retailer_rep_backcountry=Unknown
% @importance 0.9

0.75::acc(s18, retailer_rep_backcountry).

0.64::true_val(retailer_rep_backcountry, major_online_membership); 0.36::true_val(retailer_rep_backcountry, unk_retailer_rep_backcountry).

measured(s18, retailer_rep_backcountry, major_online_membership).

all_consistent(retailer_rep_backcountry) :- consistent(s18, retailer_rep_backcountry).

evidence(all_consistent(retailer_rep_backcountry)).
query(true_val(retailer_rep_backcountry, major_online_membership)).
query(true_val(retailer_rep_backcountry, unk_retailer_rep_backcountry)).

% @attr retailer_rep_salty_peaks
% @type categorical
% @canonical false
% @original_name Salty Peaks
% @values specialty_shop_utah=Specialty_snowboard_shop_Millcreek_Utah unk_retailer_rep_salty_peaks=Unknown
% @importance 0.7

0.55::acc(s24, retailer_rep_salty_peaks).

0.52::true_val(retailer_rep_salty_peaks, specialty_shop_utah); 0.48::true_val(retailer_rep_salty_peaks, unk_retailer_rep_salty_peaks).

measured(s24, retailer_rep_salty_peaks, specialty_shop_utah).

all_consistent(retailer_rep_salty_peaks) :- consistent(s24, retailer_rep_salty_peaks).

evidence(all_consistent(retailer_rep_salty_peaks)).
query(true_val(retailer_rep_salty_peaks, specialty_shop_utah)).
query(true_val(retailer_rep_salty_peaks, unk_retailer_rep_salty_peaks)).

% @attr retailer_rep_blauer
% @type categorical
% @canonical false
% @original_name Blauer Board Shop
% @values tgr_recommended=Recommended_by_TheGoodRide_for_honest_reviews unk_retailer_rep_blauer=Unknown
% @importance 0.5

0.75::acc(s71, retailer_rep_blauer).

0.64::true_val(retailer_rep_blauer, tgr_recommended); 0.36::true_val(retailer_rep_blauer, unk_retailer_rep_blauer).

measured(s71, retailer_rep_blauer, tgr_recommended).

all_consistent(retailer_rep_blauer) :- consistent(s71, retailer_rep_blauer).

evidence(all_consistent(retailer_rep_blauer)).
query(true_val(retailer_rep_blauer, tgr_recommended)).
query(true_val(retailer_rep_blauer, unk_retailer_rep_blauer)).

% @attr retailer_rep_christy
% @type categorical
% @canonical false
% @original_name Christy Sports
% @values authorized_ns_dealer=Authorized_NS_dealer unk_retailer_rep_christy=Unknown
% @importance 0.9

0.75::acc(s19, retailer_rep_christy).

0.64::true_val(retailer_rep_christy, authorized_ns_dealer); 0.36::true_val(retailer_rep_christy, unk_retailer_rep_christy).

measured(s19, retailer_rep_christy, authorized_ns_dealer).

all_consistent(retailer_rep_christy) :- consistent(s19, retailer_rep_christy).

evidence(all_consistent(retailer_rep_christy)).
query(true_val(retailer_rep_christy, authorized_ns_dealer)).
query(true_val(retailer_rep_christy, unk_retailer_rep_christy)).

% @attr triple_camber_patented
% @type categorical
% @canonical false
% @original_name Triple Camber Profile is patented by Never Summer
% @values yes_patented=Patented_by_Never_Summer unk_triple_camber_patented=Unknown
% @importance 0.6

0.85::acc(s72, triple_camber_patented).

0.77::true_val(triple_camber_patented, yes_patented); 0.23::true_val(triple_camber_patented, unk_triple_camber_patented).

measured(s72, triple_camber_patented, yes_patented).

all_consistent(triple_camber_patented) :- consistent(s72, triple_camber_patented).

evidence(all_consistent(triple_camber_patented)).
query(true_val(triple_camber_patented, yes_patented)).
query(true_val(triple_camber_patented, unk_triple_camber_patented)).

% @attr first_hybrid_camber_patent
% @type categorical
% @canonical false
% @original_name Never Summer was awarded the first patent on any type of hybrid camber technology
% @values yes_first_patent=First_patent_on_hybrid_camber unk_first_hybrid_camber_patent=Unknown
% @importance 0.5

0.55::acc(s73, first_hybrid_camber_patent).

0.51::true_val(first_hybrid_camber_patent, yes_first_patent); 0.49::true_val(first_hybrid_camber_patent, unk_first_hybrid_camber_patent).

measured(s73, first_hybrid_camber_patent, yes_first_patent).

all_consistent(first_hybrid_camber_patent) :- consistent(s73, first_hybrid_camber_patent).

evidence(all_consistent(first_hybrid_camber_patent)).
query(true_val(first_hybrid_camber_patent, yes_first_patent)).
query(true_val(first_hybrid_camber_patent, unk_first_hybrid_camber_patent)).

% @attr ptex_sidewalls_innovator
% @type categorical
% @canonical false
% @original_name Never Summer is one of the innovators of P-tex sidewalls
% @values yes_innovator=One_of_the_innovators_of_PTex_sidewalls unk_ptex_sidewalls_innovator=Unknown
% @importance 0.55

0.72::acc(s74, ptex_sidewalls_innovator).

0.68::true_val(ptex_sidewalls_innovator, yes_innovator); 0.32::true_val(ptex_sidewalls_innovator, unk_ptex_sidewalls_innovator).

measured(s74, ptex_sidewalls_innovator, yes_innovator).

all_consistent(ptex_sidewalls_innovator) :- consistent(s74, ptex_sidewalls_innovator).

evidence(all_consistent(ptex_sidewalls_innovator)).
query(true_val(ptex_sidewalls_innovator, yes_innovator)).
query(true_val(ptex_sidewalls_innovator, unk_ptex_sidewalls_innovator)).

% @attr warranty_eu
% @type categorical
% @canonical false
% @original_name warranty (EU)
% @values extra_year_eu_reg=Extra_year_warranty_EU_registration unk_warranty_eu=Unknown
% @importance 0.5

0.55::acc(s75, warranty_eu).

0.45::true_val(warranty_eu, extra_year_eu_reg); 0.55::true_val(warranty_eu, unk_warranty_eu).

measured(s75, warranty_eu, extra_year_eu_reg).

all_consistent(warranty_eu) :-
    (indep(s15), consistent(s75, warranty_eu) ; \+indep(s15)).

evidence(all_consistent(warranty_eu)).
query(true_val(warranty_eu, extra_year_eu_reg)).
query(true_val(warranty_eu, unk_warranty_eu)).